#!/usr/bin/env python3
"""
RTechLab Autonomous Future YouTube Scheduling Engine
Executes live scheduling of verified future YouTube Shorts and Long-form masterclasses
to @rtechlabofficial with resumable uploads, metadata injection, custom thumbnails,
verification of scheduled release timestamps, and persistent multi-manifest synchronization.
"""

import os
import sys
import json
import time
from pathlib import Path
from datetime import datetime, timezone

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT / "scripts"))

from youtube_uploader import YouTubeAutomationClient, redact
from sync_publishing_hub_index import sync_index

FUTURE_MANIFEST_PATH = PROJECT_ROOT / "publishing" / "system" / "future_youtube_publishing_manifest.json"
MASTER_QUEUE_PATH = PROJECT_ROOT / "publishing" / "system" / "master_publishing_queue.json"

def parse_caption_file(caption_path):
    """Parse title, description, and hashtags from the caption file"""
    path = Path(caption_path)
    if not path.exists():
        return "", "", []
        
    text = path.read_text(encoding="utf-8")
    title = ""
    desc = ""
    tags = []
    
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
                
    # Fallback description if empty
    if not desc:
        desc = text.strip()
    return title, desc, tags

def run_batch_schedule():
    print("=" * 80)
    print("RTECHLAB — LIVE YOUTUBE BATCH SCHEDULING ENGINE")
    print(f"Timestamp: {datetime.now(timezone.utc).isoformat()} UTC")
    print("=" * 80)

    # 1. Initialize Client & Check Health
    client = YouTubeAutomationClient()
    health = client.check_token_health()
    print(f"[*] YouTube OAuth Health Check: {health.get('status')} (healthy={health.get('healthy')})")
    if not health.get("healthy"):
        print(f"[-] ERROR: OAuth token is not healthy: {health.get('message')}")
        print("[-] Aborting batch execution.")
        return

    # 2. Load Manifests
    if not FUTURE_MANIFEST_PATH.exists():
        print("[-] ERROR: future_youtube_publishing_manifest.json not found.")
        return
        
    future_manifest = json.loads(FUTURE_MANIFEST_PATH.read_text(encoding="utf-8"))
    master_queue = json.loads(MASTER_QUEUE_PATH.read_text(encoding="utf-8"))
    
    queue = future_manifest.get("future_publishing_queue", [])
    total_items = len(queue)
    print(f"[*] Target Channel: {future_manifest.get('target_channel', {}).get('custom_url')}")
    print(f"[*] Total Future Items Queued: {total_items}")
    print("-" * 80)

    scheduled_results = []
    quota_exhausted = False

    for idx, item in enumerate(queue, 1):
        order = item.get("upload_order", idx)
        date = item.get("date")
        ep = item.get("episode_code")
        lang = item.get("lang")
        fmt = item.get("format")
        ist_time = item.get("scheduled_time_ist")
        publish_at_utc = item.get("publish_at_utc")
        video_file = PROJECT_ROOT / item.get("video_file")
        thumb_file = PROJECT_ROOT / item.get("thumbnail_file") if item.get("thumbnail_file") else None
        
        print(f"\n>>> [{order:02d}/{total_items:02d}] Scheduling {date} | {ep} | {lang} | {fmt} | {ist_time}")
        print(f"    Video: {video_file.name} ({item.get('video_size_mb')} MB)")
        print(f"    Target publishAt (UTC): {publish_at_utc}")

        # Check if already scheduled in future manifest
        if item.get("scheduling_status") == "SCHEDULED" and item.get("videoId"):
            print(f"    [+] Already scheduled in manifest: {item.get('videoId')} -> {item.get('videoUrl')}")
            scheduled_results.append({
                "order": order,
                "date": date,
                "ep": ep,
                "lang": lang,
                "format": fmt,
                "status": "ALREADY_SCHEDULED",
                "videoId": item.get("videoId"),
                "videoUrl": item.get("videoUrl"),
                "publishAt": publish_at_utc
            })
            continue

        # Find matching master queue item for caption path
        matching_q = [
            q for q in master_queue 
            if q["date"] == date and q["lang"] == lang and q["format_type"] == fmt and q["platform"] == "YouTube"
        ]
        
        if matching_q and matching_q[0].get("caption_path"):
            cap_title, cap_desc, cap_tags = parse_caption_file(PROJECT_ROOT / matching_q[0]["caption_path"])
        else:
            cap_title = item.get("youtube_title", "")
            cap_desc = ""
            cap_tags = ["RTechLab", ep, "TechEducation"]

        title = cap_title if cap_title else item.get("youtube_title", f"RTechLab {ep}")
        # Clean title to ensure max 100 chars
        title = title[:100]

        # Combine description with hashtags if not already present
        full_desc = cap_desc
        if cap_tags:
            hashtag_str = " ".join([f"#{t}" for t in cap_tags[:15]])
            if hashtag_str not in full_desc:
                full_desc = f"{full_desc}\n\n{hashtag_str}"

        metadata = {
            "title": title,
            "description": full_desc[:5000],
            "tags": cap_tags[:20] if cap_tags else ["RTechLab", ep],
            "categoryId": "27",  # Education
            "publishAt": publish_at_utc,
            "privacyStatus": "private",
            "defaultLanguage": "en" if lang == "EN" else "hi",
            "defaultAudioLanguage": "en" if lang == "EN" else "hi",
            "selfDeclaredMadeForKids": False
        }

        # Execute Resumable Upload
        upload_start = time.time()
        res = client.upload_video_resumable(video_file, metadata, test_mode=False)
        upload_duration = time.time() - upload_start

        if res.get("status") in ("published_confirmed", "already_uploaded"):
            video_id = res.get("videoId")
            video_url = res.get("videoUrl", f"https://youtu.be/{video_id}")
            verified = res.get("verified_state", {})
            print(f"    [+] Upload & Schedule Success ({upload_duration:.1f}s)!")
            print(f"    [+] Video ID: {video_id} | URL: {video_url}")
            print(f"    [+] Verified Schedule: privacyStatus={verified.get('privacyStatus')}, publishAt={verified.get('publishAt')}")

            # Upload custom thumbnail if available
            if thumb_file and thumb_file.exists():
                print(f"    [*] Setting custom thumbnail: {thumb_file.name}...")
                thumb_res = client.upload_thumbnail(video_id, thumb_file, test_mode=False)
                if thumb_res.get("status") == "success":
                    print(f"    [+] Thumbnail successfully applied.")
                else:
                    print(f"    [!] Note: Thumbnail response: {thumb_res.get('message', 'Thumbnail upload skipped/unavailable')}")

            # Update item in future_manifest
            item["scheduling_status"] = "SCHEDULED"
            item["videoId"] = video_id
            item["videoUrl"] = video_url
            item["uploaded_at_utc"] = datetime.now(timezone.utc).isoformat()
            item["verified_publish_at"] = verified.get("publishAt", publish_at_utc)

            # Update master_queue
            if matching_q:
                matching_q[0]["status"] = "SCHEDULED"
                matching_q[0]["published_url"] = video_url
                matching_q[0]["platform_post_id"] = video_id
                matching_q[0]["manual_action_required"] = "None - Scheduled via YouTube Data API v3"

            # Save progress after every video to ensure fault-tolerance
            FUTURE_MANIFEST_PATH.write_text(json.dumps(future_manifest, indent=2), encoding="utf-8")
            MASTER_QUEUE_PATH.write_text(json.dumps(master_queue, indent=2), encoding="utf-8")

            scheduled_results.append({
                "order": order,
                "date": date,
                "ep": ep,
                "lang": lang,
                "format": fmt,
                "status": "SUCCESS",
                "videoId": video_id,
                "videoUrl": video_url,
                "publishAt": publish_at_utc
            })
            
            # Brief delay between uploads to respect platform rate pacing
            time.sleep(2)
        else:
            err_msg = res.get("message", "Unknown upload error")
            print(f"    [-] Upload failed for order {order}: {err_msg}")
            
            # Check for quota ceiling
            if "quotaExceeded" in err_msg or "dailyLimitExceeded" in err_msg:
                print("\n[!] CRITICAL: YouTube API Daily Quota Exceeded!")
                print(f"    The YouTube Data API daily project quota limit has been reached.")
                print(f"    Successfully scheduled {len(scheduled_results)} videos before reaching ceiling.")
                quota_exhausted = True
                break
            else:
                scheduled_results.append({
                    "order": order,
                    "date": date,
                    "ep": ep,
                    "lang": lang,
                    "format": fmt,
                    "status": "FAILED",
                    "error": err_msg
                })

    # Synchronize Master Publishing Index CSV
    print("\n[*] Synchronizing Master Publishing Index CSV...")
    sync_index()

    # Final Execution Summary
    print("\n" + "=" * 80)
    print("YOUTUBE BATCH SCHEDULING RUN SUMMARY")
    print("=" * 80)
    success_count = sum(1 for r in scheduled_results if r["status"] in ("SUCCESS", "ALREADY_SCHEDULED"))
    print(f"Total Processed in this run : {len(scheduled_results)}")
    print(f"Successfully Scheduled/Live : {success_count} / {total_items}")
    if quota_exhausted:
        print(f"Execution State             : PAUSED (Daily Quota Limit Reached - Auto-resume ready for next quota reset)")
    else:
        print(f"Execution State             : COMPLETED ({success_count}/{total_items})")
    print("=" * 80)

if __name__ == "__main__":
    run_batch_schedule()
