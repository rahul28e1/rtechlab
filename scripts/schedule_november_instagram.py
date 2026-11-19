# -*- coding: utf-8 -*-
"""
RTechLab Autonomous November 2026 Instagram Reels Scheduler
Generates and manages the 38-reel November Instagram publishing queue:
- Hindi Reel: Released on scheduled date at 06:30 PM IST (13:00 UTC)
- English Reel: Released on scheduled date at 06:50 PM IST (13:20 UTC — 20m gap)
Integrates with Meta Graph API / Content Publishing API and tracks state in manifest.
"""

import os
import sys
import json
import re
from pathlib import Path
from datetime import datetime, timezone

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(line_buffering=True)

PROJECT_ROOT = Path(__file__).resolve().parent.parent
HUB_DIR = PROJECT_ROOT / "PUBLISHING_HUB" / "November_2026"
MANIFEST_PATH = PROJECT_ROOT / "publishing" / "system" / "november_instagram_schedule_manifest.json"
MASTER_QUEUE_PATH = PROJECT_ROOT / "publishing" / "system" / "master_publishing_queue.json"

def load_existing_manifest():
    if MANIFEST_PATH.exists():
        try:
            with open(MANIFEST_PATH, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception:
            pass
    return {}

def get_caption(day_dir, lang):
    lang_upper = lang.upper()
    cap_files = (
        list(day_dir.glob(f"07_CAPTIONS_AND_METADATA/{lang_upper}/*INSTAGRAM*.txt")) +
        list(day_dir.glob(f"06_CAPTIONS_HASHTAGS/*{lang_upper}*.txt")) +
        list(day_dir.glob(f"07_CAPTIONS_AND_METADATA/{lang_upper}/*.txt"))
    )
    for p in cap_files:
        if p.exists():
            text = p.read_text(encoding="utf-8").strip()
            if text:
                return text
    return ""

def get_cover(day_dir, lang):
    lang_upper = lang.upper()
    lang_lower = lang.lower()
    
    # Try language specific first
    covers = (
        list(day_dir.glob(f"05_THUMBNAILS_COVERS/*_{lang_upper}.png")) +
        list(day_dir.glob(f"05_THUMBNAILS_COVERS/*_{lang_lower}.png")) +
        list(day_dir.glob(f"05_THUMBNAILS_COVERS/*{lang_lower}*.png")) +
        list(day_dir.glob(f"06_THUMBNAILS_AND_COVERS/*_{lang_upper}.png")) +
        list(day_dir.glob(f"06_THUMBNAILS_AND_COVERS/*{lang_lower}*.png"))
    )
    if covers:
        return str(covers[0])
    
    all_covers = list(day_dir.glob("05_THUMBNAILS_COVERS/*.png")) + list(day_dir.glob("06_THUMBNAILS_AND_COVERS/*.png"))
    if all_covers:
        return str(all_covers[0])
    return ""

def get_video(day_dir, lang):
    lang_upper = lang.upper()
    lang_lower = lang.lower()
    
    vids = (
        list(day_dir.glob(f"01_FINAL_VIDEO/{lang_upper}/*.mp4")) +
        list(day_dir.glob(f"01_FINAL_VIDEO/*_{lang_upper}.mp4")) +
        list(day_dir.glob(f"01_FINAL_VIDEO/*_{lang_lower}.mp4"))
    )
    # Prefer short/vertical
    for v in vids:
        if "vertical" in v.name.lower() or "short" in v.name.lower() or "ports" in v.name.lower() or "13000km" in v.name.lower():
            return str(v)
    if vids:
        return str(vids[0])
    return ""

def build_or_load_manifest():
    existing_data = load_existing_manifest()
    existing_items = {it["slot_id"]: it for it in existing_data.get("queue", [])}
    
    # Load known statuses from master_publishing_queue.json
    master_statuses = {}
    if MASTER_QUEUE_PATH.exists():
        try:
            with open(MASTER_QUEUE_PATH, "r", encoding="utf-8") as f:
                mq = json.load(f)
                for it in mq:
                    if it.get("platform") == "Instagram":
                        key = f"{it.get('date')}_{it.get('lang')}"
                        master_statuses[key] = {
                            "status": it.get("status"),
                            "post_id": it.get("platform_post_id"),
                            "url": it.get("published_url")
                        }
        except Exception:
            pass

    day_dirs = sorted([d for d in HUB_DIR.iterdir() if d.is_dir()])
    items = []
    slot_counter = 1

    for day_dir in day_dirs:
        date_iso = day_dir.name[:10]  # YYYY-MM-DD
        day_tag = day_dir.name[11:]   # Day & Topic name
        
        # 1. HINDI REEL (18:30 IST / 13:00 UTC)
        hi_slot_id = f"NOV_{date_iso}_HI"
        hi_vid = get_video(day_dir, "HI")
        hi_cover = get_cover(day_dir, "HI")
        hi_caption = get_caption(day_dir, "HI")
        hi_epoch = int(datetime.strptime(f"{date_iso} 13:00:00", "%Y-%m-%d %H:%M:%S").replace(tzinfo=timezone.utc).timestamp())
        
        hi_master = master_statuses.get(f"{date_iso}_HI", {})
        hi_existing = existing_items.get(hi_slot_id, {})
        
        status_hi = hi_existing.get("status") or hi_master.get("status")
        if not status_hi:
            status_hi = "READY" if date_iso >= "2026-11-16" else "PUBLISHED"
            
        items.append({
            "slot_id": hi_slot_id,
            "order": slot_counter,
            "date": date_iso,
            "language": "Hindi",
            "topic_folder": day_dir.name,
            "scheduled_time_ist": f"18:30 IST on {date_iso}",
            "publish_at_utc": f"{date_iso}T13:00:00Z",
            "publish_timestamp_epoch": hi_epoch,
            "video_path": hi_vid,
            "cover_path": hi_cover,
            "caption": hi_caption,
            "status": status_hi,
            "ig_media_id": hi_existing.get("ig_media_id") or hi_master.get("post_id"),
            "permalink": hi_existing.get("permalink") or hi_master.get("url")
        })
        slot_counter += 1

        # 2. ENGLISH REEL (18:50 IST / 13:20 UTC — 20m gap!)
        en_slot_id = f"NOV_{date_iso}_EN"
        en_vid = get_video(day_dir, "EN")
        en_cover = get_cover(day_dir, "EN")
        en_caption = get_caption(day_dir, "EN")
        en_epoch = int(datetime.strptime(f"{date_iso} 13:20:00", "%Y-%m-%d %H:%M:%S").replace(tzinfo=timezone.utc).timestamp())

        en_master = master_statuses.get(f"{date_iso}_EN", {})
        en_existing = existing_items.get(en_slot_id, {})

        status_en = en_existing.get("status") or en_master.get("status")
        if not status_en:
            status_en = "READY" if date_iso >= "2026-11-16" else "PUBLISHED"

        items.append({
            "slot_id": en_slot_id,
            "order": slot_counter,
            "date": date_iso,
            "language": "English",
            "topic_folder": day_dir.name,
            "scheduled_time_ist": f"18:50 IST on {date_iso} (20 min after Hindi)",
            "publish_at_utc": f"{date_iso}T13:20:00Z",
            "publish_timestamp_epoch": en_epoch,
            "video_path": en_vid,
            "cover_path": en_cover,
            "caption": en_caption,
            "status": status_en,
            "ig_media_id": en_existing.get("ig_media_id") or en_master.get("post_id"),
            "permalink": en_existing.get("permalink") or en_master.get("url")
        })
        slot_counter += 1

    manifest = {
        "title": "RTechLab November 2026 Instagram Reels Master Schedule (Dual Language)",
        "account": "@rtechlabofficial",
        "description": "38 Reels: Daily dual-language release | Hindi @ 18:30 IST | English @ 18:50 IST (20-min gap)",
        "last_updated": datetime.now(timezone.utc).isoformat(),
        "total_reels": len(items),
        "queue": items
    }

    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    with open(MANIFEST_PATH, "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)
    return manifest

def print_summary():
    manifest = build_or_load_manifest()
    queue = manifest.get("queue", [])
    print("=" * 95)
    print("📸 RTECHLAB — NOVEMBER 2026 INSTAGRAM REELS MASTER SCHEDULE")
    print(f"Target: @rtechlabofficial | Total Reels: {len(queue)} (19 Hindi + 19 English)")
    print("=" * 95)
    print(f"{'Slot':<18} | {'Lang':<8} | {'Date':<11} | {'Time (IST)':<35} | {'Status':<10}")
    print("-" * 95)
    for it in queue:
        print(f"{it['slot_id']:<18} | {it['language']:<8} | {it['date']:<11} | {it['scheduled_time_ist']:<35} | {it['status']:<10}")
    print("=" * 95)

if __name__ == "__main__":
    build_or_load_manifest()
    print_summary()
