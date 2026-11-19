#!/usr/bin/env python3
"""
RTechLab Controlled Single-Video Upload Probe
Executes exactly ONE controlled upload attempt for the next queued item (Nov 20 QL02 EN)
to verify if YouTube's channel-level upload limit has cleared, with zero auto-retries or looping.
"""

import os
import sys
import json
import time
from pathlib import Path
from datetime import datetime, timezone

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT / "scripts"))

from youtube_uploader import YouTubeAutomationClient
from sync_publishing_hub_index import sync_index

FUTURE_MANIFEST_PATH = PROJECT_ROOT / "publishing" / "system" / "future_youtube_publishing_manifest.json"
MASTER_QUEUE_PATH = PROJECT_ROOT / "publishing" / "system" / "master_publishing_queue.json"
EARLIEST_RETRY_UTC = "2026-11-15T14:38:07Z"

def parse_caption_file(caption_path):
    path = Path(caption_path)
    if not path.exists():
        return "", "", []
    text = path.read_text(encoding="utf-8")
    title, desc, tags = "", "", []
    parts = text.split("TITLE:")
    if len(parts) > 1:
        after_title = parts[1]
        desc_parts = after_title.split("DESCRIPTION:")
        title = desc_parts[0].strip()
        if len(desc_parts) > 1:
            after_desc = desc_parts[1]
            tag_parts = after_desc.split("HASHTAGS:")
            desc = tag_parts[0].strip()
            if len(tag_parts) > 1:
                tags = [t.strip().lstrip("#") for t in tag_parts[1].split() if t.strip()]
    return title, desc or text.strip(), tags

def run_single_probe(force=False):
    print("=" * 80)
    print("RTECHLAB — CONTROLLED SINGLE-VIDEO PROBE (SLOT #11)")
    now_utc = datetime.now(timezone.utc)
    print(f"Current UTC Time : {now_utc.strftime('%Y-%m-%dT%H:%M:%SZ')}")
    print(f"Eligible Window  : >= {EARLIEST_RETRY_UTC}")
    print("=" * 80)

    # 1. Guard Window Timing
    target_dt = datetime.strptime(EARLIEST_RETRY_UTC, "%Y-%m-%dT%H:%M:%SZ").replace(tzinfo=timezone.utc)
    if now_utc < target_dt and not force:
        delta = target_dt - now_utc
        print(f"[-] TIMING GUARD: Current time is before the eligible retry window.")
        print(f"    Remaining wait: {delta}")
        print(f"    Pass --force if explicitly authorized.")
        return {"status": "timing_guard_active", "remaining_seconds": delta.total_seconds()}

    # 2. Client & Token Check
    client = YouTubeAutomationClient()
    health = client.check_token_health()
    if not health.get("healthy"):
        print(f"[-] Token unhealthy: {health.get('message')}")
        return {"status": "token_unhealthy", "error": health}

    # 3. Locate Target Item #11 in Manifest
    future_manifest = json.loads(FUTURE_MANIFEST_PATH.read_text(encoding="utf-8"))
    master_queue = json.loads(MASTER_QUEUE_PATH.read_text(encoding="utf-8"))
    
    queue = future_manifest.get("future_publishing_queue", [])
    ready_items = [it for it in queue if it.get("scheduling_status") == "READY_FOR_AUTONOMOUS_SCHEDULE"]
    
    if not ready_items:
        print("[+] No pending items in queue!")
        return {"status": "queue_empty"}

    target_item = ready_items[0]
    order = target_item.get("upload_order")
    date = target_item.get("date")
    ep = target_item.get("episode_code")
    lang = target_item.get("lang")
    fmt = target_item.get("format")
    publish_at_utc = target_item.get("publish_at_utc")
    video_file = PROJECT_ROOT / target_item.get("video_file")
    thumb_file = PROJECT_ROOT / target_item.get("thumbnail_file") if target_item.get("thumbnail_file") else None

    print(f"[*] Target Candidate: Slot #{order} | {date} | {ep} | {lang} | {fmt}")
    print(f"    Video: {video_file.name} ({target_item.get('video_size_mb')} MB)")
    print(f"    Target publishAt (UTC): {publish_at_utc}")

    # Prepare metadata
    matching_q = [
        q for q in master_queue 
        if q["date"] == date and q["lang"] == lang and q["format_type"] == fmt and q["platform"] == "YouTube"
    ]
    if matching_q and matching_q[0].get("caption_path"):
        cap_title, cap_desc, cap_tags = parse_caption_file(PROJECT_ROOT / matching_q[0]["caption_path"])
    else:
        cap_title = target_item.get("youtube_title", "")
        cap_desc = ""
        cap_tags = ["RTechLab", ep, "Networking"]

    title = (cap_title or target_item.get("youtube_title", f"RTechLab {ep}"))[:100]
    full_desc = cap_desc
    if cap_tags:
        h_str = " ".join([f"#{t}" for t in cap_tags[:15]])
        if h_str not in full_desc:
            full_desc = f"{full_desc}\n\n{h_str}"

    metadata = {
        "title": title,
        "description": full_desc[:5000],
        "tags": cap_tags[:20] if cap_tags else ["RTechLab", ep],
        "categoryId": "27",
        "publishAt": publish_at_utc,
        "privacyStatus": "private",
        "defaultLanguage": "en" if lang == "EN" else "hi",
        "defaultAudioLanguage": "en" if lang == "EN" else "hi",
        "selfDeclaredMadeForKids": False
    }

    # 4. Perform ONLY ONE Controlled Upload Attempt
    print("\n[*] Sending Single Resumable Upload Request (Zero Retry Loop)...")
    res = client.upload_video_resumable(video_file, metadata, test_mode=False)

    if res.get("status") in ("published_confirmed", "already_uploaded"):
        vid_id = res.get("videoId")
        vid_url = res.get("videoUrl", f"https://youtu.be/{vid_id}")
        verified = res.get("verified_state", {})
        print(f"\n[+] SUCCESS! Slot #{order} Scheduled successfully!")
        print(f"    Video ID : {vid_id}")
        print(f"    URL      : {vid_url}")
        print(f"    Verified : privacyStatus={verified.get('privacyStatus')}, publishAt={verified.get('publishAt')}")

        # Update Manifests
        target_item["scheduling_status"] = "SCHEDULED"
        target_item["videoId"] = vid_id
        target_item["videoUrl"] = vid_url
        target_item["uploaded_at_utc"] = datetime.now(timezone.utc).isoformat()
        target_item["verified_publish_at"] = verified.get("publishAt", publish_at_utc)

        if matching_q:
            matching_q[0]["status"] = "SCHEDULED"
            matching_q[0]["published_url"] = vid_url
            matching_q[0]["platform_post_id"] = vid_id
            matching_q[0]["manual_action_required"] = "None - Scheduled via YouTube Data API v3"

        FUTURE_MANIFEST_PATH.write_text(json.dumps(future_manifest, indent=2), encoding="utf-8")
        MASTER_QUEUE_PATH.write_text(json.dumps(master_queue, indent=2), encoding="utf-8")
        sync_index()

        remaining_count = len([it for it in future_manifest["future_publishing_queue"] if it.get("scheduling_status") == "READY_FOR_AUTONOMOUS_SCHEDULE"])
        print(f"[+] Remaining queue entries preserved: {remaining_count}")
        return {"status": "success", "videoId": vid_id, "videoUrl": vid_url, "remaining": remaining_count}
    else:
        err_msg = res.get("message", "Unknown error")
        print(f"\n[-] Probe Failed: {err_msg}")
        print(f"[*] Stopping immediately. No further attempts made.")
        print(f"[*] Queue strictly preserved with 26 items in READY_FOR_AUTONOMOUS_SCHEDULE.")
        return {"status": "limit_exceeded_or_failed", "error": err_msg}

if __name__ == "__main__":
    force_run = "--force" in sys.argv
    run_single_probe(force=force_run)
