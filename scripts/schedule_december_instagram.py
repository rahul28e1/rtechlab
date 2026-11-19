# -*- coding: utf-8 -*-
"""
RTechLab Autonomous December 2026 Instagram Reels Scheduler
Generates and manages the 32-reel Instagram publishing queue:
- Hindi Reel: Released on scheduled date at 06:30 PM IST (13:00 UTC)
- English Reel: Released on scheduled date at 06:50 PM IST (13:20 UTC — 20m gap)
Integrates with Meta Graph API / Content Publishing API and tracks state in manifest.
"""

import os
import sys
import json
import time
import re
from pathlib import Path
from datetime import datetime, timezone

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(line_buffering=True)

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT / "scripts"))

from december_episodes_data import DECEMBER_EPISODES

BASE_REELS_DIR = PROJECT_ROOT / "DECEMBER_2026_FACE_REELS"
MANIFEST_PATH = PROJECT_ROOT / "publishing" / "system" / "december_instagram_schedule_manifest.json"

EP01_DATA = {
    "num": "EP01",
    "date_code": "01.12.26",
    "folder": "EP01 (01.12.26) - The 3-Second UPI Miracle",
    "title_hi": "₹10 का UPI QR Scan: 3 Second में Soundbox कैसे बोला?",
    "title_en": "₹10 UPI QR Scan: How the Soundbox Speaks in 3 Seconds!",
    "short_title": "The 3-Second UPI Miracle",
    "desc_en": "When you scan a ₹10 UPI QR code at a local tea stall, how does the Soundbox speak within 3 seconds? Understand the NPCI Central Switch, Bank CBS Ledgers, and MQTT Cellular Soundbox Architecture!"
}

EP02_DATA = {
    "num": "EP02",
    "date_code": "03.12.26",
    "folder": "EP02 (03.12.26) - UPI Payment Pending & Reversal",
    "title_hi": "UPI Payment Pending: आपका पैसा कहाँ फंसा रहता है?",
    "title_en": "UPI Payment Pending: Where Does Your Money Get Stuck?",
    "short_title": "UPI Payment Pending & Reversal",
    "desc_en": "Account debited ₹500 but the merchant didn't receive it? Learn where your money sits in bank suspense accounts and how NPCI's automated UDIR system handles auto-reversals!"
}

def get_all_episodes():
    all_eps = {"ep01": EP01_DATA, "ep02": EP02_DATA}
    all_eps.update(DECEMBER_EPISODES)
    return all_eps

def parse_instagram_caption(txt_path):
    p = Path(txt_path)
    if not p.exists():
        return ""
    text = p.read_text(encoding="utf-8")
    m = re.search(r"\[INSTAGRAM CAPTION.*?\]\s*\n(.*?)(?=\n={5,}|\n\n\[HOOK|\Z)", text, re.DOTALL)
    if m:
        return m.group(1).strip()
    return ""

def build_or_load_manifest():
    existing_items = {}
    if MANIFEST_PATH.exists():
        try:
            with open(MANIFEST_PATH, "r", encoding="utf-8") as f:
                data = json.load(f)
                for it in data.get("queue", []):
                    existing_items[it["slot_id"]] = it
        except Exception:
            pass

    all_eps = get_all_episodes()
    items = []
    slot_counter = 1

    for ep_key, ep in all_eps.items():
        num_str = ep["num"]
        folder = BASE_REELS_DIR / ep["folder"]
        vids_dir = folder / "FINAL_VIDEOS"
        covers_dir = folder / "THUMBNAILS_COVERS"
        post_dir = folder / "POSTING_PACKAGE"

        day_str, mon_str, yr_str = ep["date_code"].split(".")
        date_iso = f"20{yr_str}-{mon_str}-{day_str}"

        # Cover Thumbnail
        cover_png = covers_dir / f"{num_str}_Cover_Frame150.png"
        if not cover_png.exists():
            cands = list(covers_dir.glob("*.png"))
            if cands:
                cover_png = cands[0]

        # 1. HINDI REEL (18:30 IST / 13:00 UTC)
        hi_slot_id = f"{num_str}_HI"
        hi_mp4 = vids_dir / f"{num_str}_{ep['short_title'].replace(' ', '_')}_Hindi.mp4"
        if not hi_mp4.exists():
            cands = list(vids_dir.glob("*_Hindi.mp4"))
            if cands:
                hi_mp4 = cands[0]

        txt_file = post_dir / "POSTING_TEXT_MOBILE_READY.txt"
        hi_caption = parse_instagram_caption(txt_file)
        if not hi_caption:
            hi_caption = (
                f"{ep['title_hi']} 🚀\n\n"
                f"Episode {num_str} of Connected Season 1: Everyday Tech Architecture by RTechLab.\n"
                f"Technology Made Practical.\n\n"
                f"Follow @rtechlab.official for practical system design!\n\n"
                f"#RTechLab #SystemDesign #TechShorts #SoftwareEngineering #Coding"
            )

        # Epoch for 18:30 IST (13:00 UTC)
        hi_epoch = int(datetime.strptime(f"{date_iso} 13:00:00", "%Y-%m-%d %H:%M:%S").replace(tzinfo=timezone.utc).timestamp())

        hi_existing = existing_items.get(hi_slot_id, {})
        items.append({
            "slot_id": hi_slot_id,
            "order": slot_counter,
            "episode_code": num_str,
            "language": "Hindi",
            "date": date_iso,
            "scheduled_time_ist": f"18:30 IST on {date_iso}",
            "publish_at_utc": f"{date_iso}T13:00:00Z",
            "publish_timestamp_epoch": hi_epoch,
            "video_path": str(hi_mp4),
            "cover_path": str(cover_png) if cover_png.exists() else "",
            "caption": hi_caption,
            "status": hi_existing.get("status", "PENDING"),
            "ig_media_id": hi_existing.get("ig_media_id"),
            "permalink": hi_existing.get("permalink"),
            "scheduled_at_utc": hi_existing.get("scheduled_at_utc")
        })
        slot_counter += 1

        # 2. ENGLISH REEL (18:50 IST / 13:20 UTC — 20 min gap!)
        en_slot_id = f"{num_str}_EN"
        en_mp4 = vids_dir / f"{num_str}_{ep['short_title'].replace(' ', '_')}_English.mp4"
        if not en_mp4.exists():
            cands = list(vids_dir.glob("*_English.mp4"))
            if cands:
                en_mp4 = cands[0]

        if "desc_en" in ep:
            en_summary = ep["desc_en"]
        elif "scenes_en" in ep and ep["scenes_en"]:
            en_summary = ep["scenes_en"][0][1]
        else:
            en_summary = f"Learn how {ep['short_title']} works at scale!"

        en_caption = (
            f"{ep['title_en']} ⚡\n\n"
            f"{en_summary}\n\n"
            f"Key Takeaway: Never expose raw databases directly to massive concurrency bursts—always buffer with Rate Limiters, In-Memory Caches, and Distributed Queues!\n\n"
            f"Episode {num_str} of Connected Season 1: Everyday Tech Architecture by RTechLab.\n"
            f"Technology Made Practical. Follow @rtechlab.official for daily system design breakdowns!\n\n"
            f"#SystemDesign #SoftwareEngineering #BackendDeveloper #HighConcurrency #TechInEnglish #RTechLab #DevShorts"
        )

        en_epoch = int(datetime.strptime(f"{date_iso} 13:20:00", "%Y-%m-%d %H:%M:%S").replace(tzinfo=timezone.utc).timestamp())

        en_existing = existing_items.get(en_slot_id, {})
        items.append({
            "slot_id": en_slot_id,
            "order": slot_counter,
            "episode_code": num_str,
            "language": "English",
            "date": date_iso,
            "scheduled_time_ist": f"18:50 IST on {date_iso} (20 min after Hindi)",
            "publish_at_utc": f"{date_iso}T13:20:00Z",
            "publish_timestamp_epoch": en_epoch,
            "video_path": str(en_mp4),
            "cover_path": str(cover_png) if cover_png.exists() else "",
            "caption": en_caption,
            "status": en_existing.get("status", "PENDING"),
            "ig_media_id": en_existing.get("ig_media_id"),
            "permalink": en_existing.get("permalink"),
            "scheduled_at_utc": en_existing.get("scheduled_at_utc")
        })
        slot_counter += 1

    manifest = {
        "title": "RTechLab December 2026 Instagram Reels Schedule (Dual Language)",
        "account": "@rtechlabofficial",
        "description": "32 Reels: Same topic every 2 days | Hindi @ 18:30 IST | English @ 18:50 IST",
        "last_updated": datetime.now(timezone.utc).isoformat(),
        "queue": items
    }

    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    with open(MANIFEST_PATH, "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)
    return manifest

def print_summary():
    manifest = build_or_load_manifest()
    queue = manifest.get("queue", [])
    print("=" * 85)
    print("📸 RTECHLAB — DECEMBER 2026 INSTAGRAM REELS MASTER SCHEDULE")
    print(f"Target: @rtechlabofficial | Total Reels: {len(queue)} (16 Hindi + 16 English)")
    print("=" * 85)
    print(f"{'Slot':<10} | {'Lang':<8} | {'Date':<11} | {'Time (IST)':<32} | {'Status':<10}")
    print("-" * 85)
    for it in queue:
        print(f"{it['slot_id']:<10} | {it['language']:<8} | {it['date']:<11} | {it['scheduled_time_ist']:<32} | {it['status']:<10}")
    print("=" * 85)

if __name__ == "__main__":
    build_or_load_manifest()
    print_summary()
