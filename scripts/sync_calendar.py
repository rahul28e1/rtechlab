# -*- coding: utf-8 -*-
"""
Sync MASTER_DECEMBER_2026_PUBLISHING_CALENDAR.md from december_youtube_schedule_manifest.json
"""

import json
from pathlib import Path

MANIFEST_PATH = Path(r"c:\Users\Rahul\Videos\My projects\RtechLab\publishing\system\december_youtube_schedule_manifest.json")
CALENDAR_PATH = Path(r"c:\Users\Rahul\Videos\My projects\RtechLab\DECEMBER_2026_FACE_REELS\MASTER_DECEMBER_2026_PUBLISHING_CALENDAR.md")

with open(MANIFEST_PATH, "r", encoding="utf-8") as f:
    manifest = json.load(f)

# Group by episode_code
eps = {}
for it in manifest["queue"]:
    code = it["episode_code"]
    if code not in eps:
        eps[code] = {}
    eps[code][it["language"]] = it

content = """# 🚀 RTechLab — December 2026 Complete Publishing Master Calendar
### Connected Season 1: Everyday High-Concurrency System Design & Tech Architecture

> **Dual-Language Publishing Engine Active**  
> **Rule:** Same topic every 2 days released in **both Hindi & English** with a 20-minute gap.  
> **Timings:**  
> • 🇮🇳 **Hindi Reel:** Scheduled at **06:30 PM IST** (13:00 UTC)  
> • 🇬🇧 **English Reel:** Scheduled at **06:50 PM IST** (13:20 UTC — 20 min gap)  
> **Format:** 1080 × 1920 (Vertical 9:16) @ 30 FPS • 100% Bright Motion Graphics  
> **Channel:** [@rtechlabofficial](https://youtube.com/@rtechlabofficial)

---

## 📅 Schedule & Live YouTube Links (32 Total Reels)

| Ep | Release Date | Topic | Hindi Reel (06:30 PM IST) | English Reel (06:50 PM IST) | Local Hindi File | Local English File |
|:---|:---|:---|:---|:---|:---|:---|
"""

for ep_num in sorted(eps.keys()):
    pair = eps[ep_num]
    hi = pair.get("Hindi", {})
    en = pair.get("English", {})

    date = hi.get("date") or en.get("date")
    topic = hi.get("title", "").split("|")[0].strip()

    # Hindi Link
    if hi.get("status") == "SCHEDULED" and hi.get("videoId"):
        hi_col = f"[youtu.be/{hi['videoId']}](https://youtu.be/{hi['videoId']}) ✅"
    else:
        hi_col = "⏳ *Auto-queue*"

    # English Link
    if en.get("status") == "SCHEDULED" and en.get("videoId"):
        en_col = f"[youtu.be/{en['videoId']}](https://youtu.be/{en['videoId']}) ✅"
    else:
        en_col = "⏳ *Auto-queue*"

    hi_file = f"[Hindi MP4](file:///{hi.get('video_path', '').replace(chr(92), '/')})"
    en_file = f"[English MP4](file:///{en.get('video_path', '').replace(chr(92), '/')})"

    content += f"| **{ep_num}** | `{date}` | {topic} | {hi_col} | {en_col} | {hi_file} | {en_file} |\n"

content += """
---

## ⚙️ Active Autonomous Pipelines
1. **Render Engine (`scripts/re_render_all_fixed_december_reels.py`)**: Sequentially rendering all remaining episodes with fixed multi-scene spring animations, dynamic HUD, ambient BGM, and transition whooshes.
2. **YouTube Dual-Language Scheduler (`scripts/schedule_december_youtube.py --watch`)**: Automatically uploads and schedules each episode in both Hindi (18:30 IST) and English (18:50 IST) with persistent manifest tracking.
"""

with open(CALENDAR_PATH, "w", encoding="utf-8") as f:
    f.write(content)

print("Calendar successfully synced with 32 dual-language slots!")
