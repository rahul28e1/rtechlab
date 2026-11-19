# -*- coding: utf-8 -*-
"""
RTechLab Autonomous December 2026 YouTube Shorts Scheduler (Dual Language Edition)
Schedules all 16 December 2026 reels to YouTube (@rtechlabofficial) in BOTH Hindi & English:
- Hindi Reel: Released on scheduled date at 06:30 PM IST (13:00 UTC)
- English Reel: Released on scheduled date at 06:50 PM IST (13:20 UTC) — 20 min gap!
Total: 32 scheduled reels (16 dates x 2 language variants)
Resumable upload protocol, 9:16 thumbnail frames, and persistent manifest tracking.
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

from youtube_uploader import YouTubeAutomationClient
from december_episodes_data import DECEMBER_EPISODES

BASE_REELS_DIR = PROJECT_ROOT / "DECEMBER_2026_FACE_REELS"
MANIFEST_PATH = PROJECT_ROOT / "publishing" / "system" / "december_youtube_schedule_manifest.json"

# Cutoff: Only videos modified after this timestamp (or verified EP01/EP02) are considered fixed
FIX_CUTOFF_EPOCH = time.mktime(time.strptime("2026-11-15 22:25:00", "%Y-%m-%d %H:%M:%S"))

EP01_DATA = {
    "num": "EP01",
    "date_code": "01.12.26",
    "folder": "EP01 (01.12.26) - The 3-Second UPI Miracle",
    "title_hi": "₹10 का UPI QR Scan: 3 Second में Soundbox कैसे बोला?",
    "title_en": "₹10 UPI QR Scan: How the Soundbox Speaks in 3 Seconds!",
    "short_title": "The 3-Second UPI Miracle",
    "desc_hi": (
        "टपरी पर ₹10 का UPI scan करने पर 3 सेकंड के अंदर Soundbox कैसे बोलता है? "
        "जानिए NPCI Central Switch, Bank CBS Ledgers, और MQTT Cellular Soundbox Architecture का पूरा technical breakdown!\n\n"
        "Episode 01 of Connected Season 1: Everyday Tech Architecture by RTechLab.\nTechnology Made Practical.\n\n"
        "⏱️ Timestamps:\n"
        "0:00 - The ₹10 QR Scan Hook\n"
        "0:11 - 4-Party Architecture Overview\n"
        "0:20 - Secure PIN Authentication Flow\n"
        "0:30 - NPCI Central Switch Routing\n"
        "0:40 - Core Banking Debit & Credit\n"
        "0:49 - The Cellular MQTT Soundbox Engine\n"
        "1:02 - Multilateral Net Settlement at RBI\n"
        "1:14 - Payment Pending Cliffhanger (EP02) & Spoken Outro"
    ),
    "desc_en": (
        "When you scan a ₹10 UPI QR code at a local tea stall, how does the Soundbox speak within 3 seconds? "
        "Understand the NPCI Central Switch, Bank CBS Ledgers, and MQTT Cellular Soundbox Architecture!\n\n"
        "Episode 01 of Connected Season 1: Everyday Tech Architecture by RTechLab.\nTechnology Made Practical.\n\n"
        "⏱️ Timestamps:\n"
        "0:00 - The ₹10 QR Scan Hook\n"
        "0:11 - 4-Party Architecture Overview\n"
        "0:20 - Secure PIN Authentication Flow\n"
        "0:30 - NPCI Central Switch Routing\n"
        "0:40 - Core Banking Debit & Credit\n"
        "0:49 - The Cellular MQTT Soundbox Engine\n"
        "1:02 - Multilateral Net Settlement at RBI\n"
        "1:14 - Payment Pending Cliffhanger (EP02) & Spoken Outro"
    ),
    "tags_hi": ["upi architecture", "how upi works", "npci switch", "paytm soundbox working", "fintech system design", "rtechlab", "coding shorts", "tech in hindi"],
    "tags_en": ["upi architecture", "how upi works", "npci switch", "paytm soundbox working", "fintech system design", "rtechlab", "coding shorts", "tech in english"]
}

EP02_DATA = {
    "num": "EP02",
    "date_code": "03.12.26",
    "folder": "EP02 (03.12.26) - UPI Payment Pending & Reversal",
    "title_hi": "UPI Payment Pending: आपका पैसा कहाँ फंसा रहता है?",
    "title_en": "UPI Payment Pending: Where Does Your Money Get Stuck?",
    "short_title": "UPI Payment Pending & Reversal",
    "desc_hi": (
        "Account से ₹500 कट गए पर दुकानदार को नहीं मिला? जानिए UPI Payment Pending होने पर पैसा किस Bank Suspense Account में जाता है "
        "और NPCI का UDIR System इसे Auto-Reverse कैसे करता है!\n\n"
        "Episode 02 of Connected Season 1: Everyday Tech Architecture by RTechLab.\nTechnology Made Practical.\n\n"
        "⏱️ Timestamps:\n"
        "0:00 - The Pending Dilemma (₹500 Stuck)\n"
        "0:12 - 3 Failure & Timeout Nodes\n"
        "0:26 - Bank Suspense Pool Account\n"
        "0:36 - Automated NPCI UDIR Engine\n"
        "0:48 - Auto-Reversal & T+1 Policy\n"
        "0:59 - End-of-Day Batch Reconciliation\n"
        "1:10 - Idempotency Keys Architecture\n"
        "1:20 - IRCTC 10 AM Tatkal Teaser (EP03) & Spoken Outro"
    ),
    "desc_en": (
        "Account debited ₹500 but the merchant didn't receive it? Learn where your money sits in bank suspense accounts "
        "and how NPCI's automated UDIR system handles auto-reversals!\n\n"
        "Episode 02 of Connected Season 1: Everyday Tech Architecture by RTechLab.\nTechnology Made Practical.\n\n"
        "⏱️ Timestamps:\n"
        "0:00 - The Pending Dilemma (₹500 Stuck)\n"
        "0:12 - 3 Failure & Timeout Nodes\n"
        "0:26 - Bank Suspense Pool Account\n"
        "0:36 - Automated NPCI UDIR Engine\n"
        "0:48 - Auto-Reversal & T+1 Policy\n"
        "0:59 - End-of-Day Batch Reconciliation\n"
        "1:10 - Idempotency Keys Architecture\n"
        "1:20 - IRCTC 10 AM Tatkal Teaser (EP03) & Spoken Outro"
    ),
    "tags_hi": ["upi payment pending", "upi stuck money", "how upi works", "npci switch", "udir npci", "core banking system", "suspense account", "rtechlab", "fintech architecture", "system design shorts"],
    "tags_en": ["upi payment pending", "upi stuck money", "how upi works", "npci switch", "udir npci", "core banking system", "suspense account", "rtechlab", "fintech architecture", "system design shorts"]
}

def get_all_episodes_data():
    all_eps = {"ep01": EP01_DATA, "ep02": EP02_DATA}
    all_eps.update(DECEMBER_EPISODES)
    return all_eps

def is_video_ready(path, ep_num):
    p = Path(path)
    if not p.exists() or p.stat().st_size < 1000000:
        return False
    if ep_num in ("EP01", "EP02"):
        return True
    return p.stat().st_mtime > FIX_CUTOFF_EPOCH

def parse_posting_package(txt_path):
    p = Path(txt_path)
    if not p.exists():
        return "", "", []
    text = p.read_text(encoding="utf-8")
    
    title = ""
    desc = ""
    tags = []
    
    if "YOUTUBE SHORTS POSTING PACKAGE" in text:
        yt_part = text.split("YOUTUBE SHORTS POSTING PACKAGE")[1]
    else:
        yt_part = text

    t_match = re.search(r"TITLE:\s*\n([^\n]+)", yt_part)
    if t_match:
        title = t_match.group(1).strip()
        
    d_match = re.search(r"DESCRIPTION:\s*\n(.*?)(?=\n⏱️|\nTAGS:|\Z)", yt_part, re.DOTALL)
    if d_match:
        desc = d_match.group(1).strip()

    ts_match = re.search(r"(⏱️ Timestamps:.*?\n\n)", yt_part, re.DOTALL)
    if ts_match and desc:
        desc = desc + "\n\n" + ts_match.group(1).strip()

    tag_match = re.search(r"TAGS:\s*\n([^\n]+)", yt_part)
    if tag_match:
        raw_tags = tag_match.group(1).split(",")
        tags = [t.strip().lstrip("#") for t in raw_tags if t.strip()]

    return title, desc, tags

def build_or_load_manifest():
    existing_items = {}
    if MANIFEST_PATH.exists():
        try:
            with open(MANIFEST_PATH, "r", encoding="utf-8") as f:
                data = json.load(f)
                for it in data.get("queue", []):
                    # Key by slot_id or episode_code
                    slot = it.get("slot_id") or f"{it.get('episode_code')}_{it.get('language', 'Hindi')[:2].upper()}"
                    existing_items[slot] = it
                    # Also fallback key by just episode_code for legacy items (which were all Hindi)
                    if "language" not in it or it.get("language") == "Hindi":
                        existing_items[f"{it.get('episode_code')}_HI"] = it
        except Exception as e:
            print(f"[-] Warning loading existing manifest: {e}")

    all_eps = get_all_episodes_data()
    items = []
    slot_counter = 1

    for ep_key, ep in all_eps.items():
        num_str = ep["num"]
        folder = BASE_REELS_DIR / ep["folder"]
        vids_dir = folder / "FINAL_VIDEOS"
        covers_dir = folder / "THUMBNAILS_COVERS"
        post_dir = folder / "POSTING_PACKAGE"

        # Cover image
        cover_png = covers_dir / f"{num_str}_Cover_Frame150.png"
        if not cover_png.exists():
            cands = list(covers_dir.glob("*.png"))
            if cands:
                cover_png = cands[0]

        # Date ISO: e.g. "01.12.26" -> "2026-12-01"
        day_str, mon_str, yr_str = ep["date_code"].split(".")
        date_iso = f"20{yr_str}-{mon_str}-{day_str}"

        # -------------------------------------------------------------
        # 1. HINDI REEL (18:30 IST / 13:00 UTC)
        # -------------------------------------------------------------
        hi_slot_id = f"{num_str}_HI"
        hi_mp4 = vids_dir / f"{num_str}_{ep['short_title'].replace(' ', '_')}_Hindi.mp4"
        if not hi_mp4.exists():
            cands = list(vids_dir.glob("*_Hindi.mp4"))
            if cands:
                hi_mp4 = cands[0]

        txt_file = post_dir / "POSTING_TEXT_MOBILE_READY.txt"
        hi_title, hi_desc, hi_tags = parse_posting_package(txt_file)
        if not hi_title:
            hi_title = f"{ep['title_hi']} | {num_str} #Shorts #Tech"
        if not hi_desc:
            hi_desc = ep.get("desc_hi") or f"{ep['title_hi']}\nTechnology Made Practical. Follow RTechLab!"
        if not hi_tags:
            hi_tags = ep.get("tags_hi") or ["RTechLab", "SystemDesign", "TechShorts", num_str]

        hi_existing = existing_items.get(hi_slot_id, {})
        items.append({
            "slot_id": hi_slot_id,
            "order": slot_counter,
            "episode_code": num_str,
            "language": "Hindi",
            "date": date_iso,
            "scheduled_time_ist": f"18:30 IST on {date_iso}",
            "publish_at_utc": f"{date_iso}T13:00:00Z",
            "title": hi_title[:100],
            "description": hi_desc,
            "tags": hi_tags[:20],
            "default_language": "hi",
            "video_path": str(hi_mp4),
            "thumbnail_path": str(cover_png) if cover_png.exists() else "",
            "status": hi_existing.get("status", "PENDING"),
            "videoId": hi_existing.get("videoId"),
            "videoUrl": hi_existing.get("videoUrl"),
            "uploaded_at_utc": hi_existing.get("uploaded_at_utc")
        })
        slot_counter += 1

        # -------------------------------------------------------------
        # 2. ENGLISH REEL (18:50 IST / 13:20 UTC) — 20 min gap!
        # -------------------------------------------------------------
        en_slot_id = f"{num_str}_EN"
        en_mp4 = vids_dir / f"{num_str}_{ep['short_title'].replace(' ', '_')}_English.mp4"
        if not en_mp4.exists():
            cands = list(vids_dir.glob("*_English.mp4"))
            if cands:
                en_mp4 = cands[0]

        en_title = f"{ep['title_en']} | {num_str} #Shorts #Tech"
        if "desc_en" in ep:
            en_desc = ep["desc_en"]
        elif "scenes_en" in ep and ep["scenes_en"]:
            en_desc = (
                f"{ep['scenes_en'][0][1]}\n"
                f"Learn the complete software engineering and system architecture behind {ep['short_title']}!\n\n"
                f"Episode {num_str} of Connected Season 1: Everyday Tech Architecture by RTechLab.\n"
                f"Technology Made Practical.\n\n"
                f"⏱️ Timestamps:\n"
                f"0:00 - The Hook & Core Problem\n"
                f"0:12 - Why Standard Systems Crash\n"
                f"0:25 - Tier 1 Architecture\n"
                f"0:38 - Concurrency & Ingress Flow\n"
                f"0:50 - In-Memory Caching & State Machine\n"
                f"1:02 - Automated Recovery & Failover\n"
                f"1:14 - Senior Architecture Takeaway\n"
                f"1:24 - Cliffhanger & Spoken Outro"
            )
        else:
            en_desc = f"{ep['title_en']}\nTechnology Made Practical. Follow RTechLab!"

        en_tags = ep.get("tags_en") or [
            ep['short_title'].lower(), "system design shorts", "how it works in english",
            "high concurrency architecture", "software engineering", "rtechlab", "dev shorts", "coding"
        ]

        en_existing = existing_items.get(en_slot_id, {})
        items.append({
            "slot_id": en_slot_id,
            "order": slot_counter,
            "episode_code": num_str,
            "language": "English",
            "date": date_iso,
            "scheduled_time_ist": f"18:50 IST on {date_iso} (20 min after Hindi)",
            "publish_at_utc": f"{date_iso}T13:20:00Z",
            "title": en_title[:100],
            "description": en_desc,
            "tags": en_tags[:20],
            "default_language": "en",
            "video_path": str(en_mp4),
            "thumbnail_path": str(cover_png) if cover_png.exists() else "",
            "status": en_existing.get("status", "PENDING"),
            "videoId": en_existing.get("videoId"),
            "videoUrl": en_existing.get("videoUrl"),
            "uploaded_at_utc": en_existing.get("uploaded_at_utc")
        })
        slot_counter += 1

    manifest = {
        "title": "RTechLab December 2026 YouTube Shorts Schedule (Dual Language)",
        "channel": "@rtechlabofficial",
        "description": "Every 2 days: Hindi @ 18:30 IST & English @ 18:50 IST (20 min gap)",
        "last_updated": datetime.now(timezone.utc).isoformat(),
        "queue": items
    }

    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    with open(MANIFEST_PATH, "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)
    return manifest

def save_manifest(manifest):
    manifest["last_updated"] = datetime.now(timezone.utc).isoformat()
    with open(MANIFEST_PATH, "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)

def run_scheduler(watch_mode=False):
    print("=" * 80)
    print("🚀 RTECHLAB — DECEMBER 2026 AUTONOMOUS YOUTUBE DUAL-LANGUAGE SCHEDULER")
    print(f"Timestamp: {datetime.now(timezone.utc).isoformat()} UTC")
    print("Strategy: Same Topic Every 2 Days | Hindi @ 18:30 IST | English @ 18:50 IST (20m gap)")
    print("=" * 80)

    client = YouTubeAutomationClient()
    health = client.check_token_health()
    print(f"[*] YouTube OAuth Health Check: {health.get('status')} (healthy={health.get('healthy')})")
    if not health.get("healthy"):
        print(f"[-] ERROR: OAuth token is not healthy: {health.get('message')}")
        return

    manifest = build_or_load_manifest()
    queue = manifest.get("queue", [])

    print(f"[*] Target Channel: {manifest.get('channel')}")
    print(f"[*] Total Scheduled Slots: {len(queue)} (16 Hindi + 16 English)")
    
    scheduled_count = sum(1 for it in queue if it.get("status") == "SCHEDULED")
    print(f"[*] Currently Scheduled: {scheduled_count} / {len(queue)}")
    print("-" * 80)

    while True:
        actions_taken = 0
        quota_exceeded = False

        for item in queue:
            order = item["order"]
            slot_id = item["slot_id"]
            ep = item["episode_code"]
            lang = item["language"]
            date = item["date"]
            vpath = item["video_path"]
            thumb_path = item["thumbnail_path"]
            publish_at = item["publish_at_utc"]
            sched_ist = item["scheduled_time_ist"]

            if item["status"] == "SCHEDULED" and item.get("videoId"):
                continue

            # Check if video is rendered & fixed
            if not is_video_ready(vpath, ep):
                print(f"⏳ [{order:02d}/32] {slot_id} ({lang} | {date}): Video not yet rendered or in progress... Waiting.")
                continue

            print(f"\n🚀 [{order:02d}/32] Scheduling {slot_id} ({lang}) for {publish_at} ({sched_ist})...")
            print(f"    Title: {item['title']}")
            print(f"    File : {Path(vpath).name} ({os.path.getsize(vpath)/(1024*1024):.2f} MB)")

            lang_code = "hi" if lang == "Hindi" else "en"
            metadata = {
                "title": item["title"],
                "description": item["description"][:5000],
                "tags": item["tags"],
                "categoryId": "27",  # Education
                "publishAt": publish_at,
                "privacyStatus": "private",
                "defaultLanguage": lang_code,
                "defaultAudioLanguage": lang_code,
                "selfDeclaredMadeForKids": False
            }

            t0 = time.time()
            res = client.upload_video_resumable(vpath, metadata, test_mode=False)
            dt = time.time() - t0

            if res.get("status") in ("published_confirmed", "already_uploaded"):
                vid_id = res.get("videoId")
                vid_url = res.get("videoUrl", f"https://youtu.be/{vid_id}")
                print(f"    ✅ Uploaded & Scheduled in {dt:.1f}s!")
                print(f"    ✅ Video ID: {vid_id} | URL: {vid_url}")
                print(f"    ✅ Official YouTube Auto-Release: {sched_ist}")

                # Apply Thumbnail if available
                if thumb_path and os.path.exists(thumb_path):
                    print(f"    📸 Applying Cover Thumbnail ({Path(thumb_path).name})...")
                    t_res = client.upload_thumbnail(vid_id, thumb_path, test_mode=False)
                    if t_res.get("status") == "success":
                        print(f"    ✅ Thumbnail applied successfully.")
                    else:
                        print(f"    ℹ️ Thumbnail note: {t_res.get('message')}")

                item["status"] = "SCHEDULED"
                item["videoId"] = vid_id
                item["videoUrl"] = vid_url
                item["uploaded_at_utc"] = datetime.now(timezone.utc).isoformat()
                save_manifest(manifest)
                actions_taken += 1
                time.sleep(3)
            else:
                err_msg = res.get("message", "Upload error")
                print(f"    ❌ Upload failed for {slot_id}: {err_msg}")
                if "quotaExceeded" in err_msg or "dailyLimitExceeded" in err_msg:
                    print("\n⚠️ YouTube Data API Daily Quota Exceeded (10,000 unit limit reached).")
                    print("   Scheduler will pause and resume automatically on next quota reset window.")
                    item["status"] = "QUOTA_PAUSED"
                    save_manifest(manifest)
                    quota_exceeded = True
                    break
                else:
                    item["status"] = "ERROR"
                    item["error_message"] = err_msg
                    save_manifest(manifest)

        if quota_exceeded:
            print("\n[!] Quota paused. Waiting 15 minutes before re-checking quota window...")
            if not watch_mode:
                break
            time.sleep(900)
            continue

        if not watch_mode:
            break

        all_done = all(it["status"] == "SCHEDULED" for it in queue)
        if all_done:
            print("\n🎉 ALL 32 YOUTUBE SHORTS (16 HINDI + 16 ENGLISH) SUCCESSFULLY SCHEDULED!")
            break

        print("\n[*] Cycle complete. Checking again in 30 seconds for newly rendered videos...")
        time.sleep(30)

    print("\n" + "=" * 80)
    print("🌟 YOUTUBE SCHEDULER EXECUTION COMPLETE")
    print("=" * 80)

if __name__ == "__main__":
    is_watch = "--watch" in sys.argv
    run_scheduler(watch_mode=is_watch)
