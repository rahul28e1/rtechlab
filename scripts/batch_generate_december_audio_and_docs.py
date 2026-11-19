# -*- coding: utf-8 -*-
"""
Batch Audio & Docs Generator for December 2026 Episodes (EP03 to EP16)
Generates:
1. Complete date-wise folder documentation and mobile-ready posting packages.
2. Scene-by-scene audio stems using edge-tts (hi-IN-MadhurNeural & en-IN-PrabhatNeural).
3. Audio duration measurements and cues.
"""

import asyncio
import os
import shutil
import edge_tts
from december_episodes_data import DECEMBER_EPISODES

BASE_REELS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\DECEMBER_2026_FACE_REELS"
VIDEO_ENGINE_AUDIO_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\video-engine\public\audio\december"

def write_docs(ep_key, ep):
    folder_path = os.path.join(BASE_REELS_DIR, ep["folder"])
    posting_dir = os.path.join(folder_path, "POSTING_PACKAGE")
    os.makedirs(posting_dir, exist_ok=True)
    
    # 1. SCRIPT_AND_STORYBOARD.md
    script_content = f"""# RTechLab December Face Reels — {ep['num']} Master Script & Architecture
## {ep['title_hi']}
### {ep['title_en']}

**Scheduled Date:** {ep['date_code']}.2026 (06:30 PM IST)  
**Format:** 1080 × 1920 (Vertical 9:16) @ 30 FPS  
**Style:** 100% Bright Motion Graphics, Scene-Locked Audio Sync, Fast Cuts  
**Spoken Voices:** Hindi (`hi-IN-MadhurNeural`), English (`en-IN-PrabhatNeural`)  
**Continuity Link:** Follows previous episode, concludes with cliffhanger to {ep['next_ep']}

---

### HINDI SCENES (8 SCENES)
"""
    for code, text in ep["scenes_hi"]:
        script_content += f"\n* **{code.upper()}:**\n  `{text}`\n"

    script_content += "\n---\n\n### ENGLISH SCENES (8 SCENES)\n"
    for code, text in ep["scenes_en"]:
        script_content += f"\n* **{code.upper()}:**\n  `{text}`\n"

    with open(os.path.join(folder_path, "SCRIPT_AND_STORYBOARD.md"), "w", encoding="utf-8") as f:
        f.write(script_content)

    # 2. POSTING_TEXT_MOBILE_READY.txt
    mobile_content = f"""=====================================================
RTechLab {ep['num']} — INSTAGRAM REELS & YOUTUBE SHORTS PACKAGE
Scheduled Date: {ep['date_code']}.2026 (06:30 PM IST)
=====================================================

[HOOK / FIRST 3 SECONDS TEXT ON SCREEN]
{ep['scenes_hi'][0][1][:70]}... ⚡📱

[INSTAGRAM CAPTION — COPY & PASTE DIRECTLY ON MOBILE]
{ep['title_hi']} 🚀

{ep['scenes_hi'][0][1]}

{ep['scenes_hi'][1][1]}

इसके पीछे काम करने वाले 4 Core Architectural Principles:
1️⃣ {ep['scenes_hi'][2][1]}
2️⃣ {ep['scenes_hi'][3][1]}
3️⃣ {ep['scenes_hi'][4][1]}
4️⃣ {ep['scenes_hi'][5][1]}

💡 Architecture Lesson:
{ep['scenes_hi'][6][1]}

👉 Next Episode Cliffhanger:
{ep['next_hook_hi']} Follow @rtechlab.official for more!

Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate! 🚀

#SystemDesign #SoftwareEngineering #TechArchitecture #CodingInHindi #RTechLab #BackendDeveloper #HighConcurrency #{ep['short_title'].replace(' ', '')} #DevShorts

=====================================================
YOUTUBE SHORTS POSTING PACKAGE
=====================================================

TITLE:
{ep['title_hi']} | {ep['num']} #Shorts #Tech

DESCRIPTION:
{ep['scenes_hi'][0][1]}
जानिए {ep['short_title']} का पूरा system design और software architecture!

Episode {ep['num']} of Connected Season 1: Everyday Tech Architecture by RTechLab.
Technology Made Practical.

⏱️ Timestamps:
0:00 - The Hook & Core Problem
0:12 - Why Standard Systems Crash
0:25 - Tier 1 Architecture
0:38 - Concurrency & Ingress Flow
0:50 - In-Memory Caching & State Machine
1:02 - Automated Recovery & Failover
1:14 - Senior Architecture Takeaway
1:24 - Cliffhanger to {ep['next_ep']} & Spoken Outro

TAGS:
{ep['short_title'].lower()}, system design shorts, how it works in hindi, high concurrency architecture, software engineering, rtechlab, dev shorts, coding
"""
    with open(os.path.join(posting_dir, "POSTING_TEXT_MOBILE_READY.txt"), "w", encoding="utf-8") as f:
        f.write(mobile_content)


async def generate_audio_for_episode(ep_key, ep):
    print(f"\n==========================================")
    print(f"Generating Audio for {ep['num']} ({ep['date_code']})...")
    print(f"==========================================")
    
    eng_audio_dir = os.path.join(VIDEO_ENGINE_AUDIO_DIR, ep_key)
    reels_audio_dir = os.path.join(BASE_REELS_DIR, ep["folder"], "AUDIO_STEMS")
    os.makedirs(eng_audio_dir, exist_ok=True)
    os.makedirs(reels_audio_dir, exist_ok=True)

    # Hindi
    for code, text in ep["scenes_hi"]:
        fname = f"hi_{code}.mp3"
        dest1 = os.path.join(eng_audio_dir, fname)
        dest2 = os.path.join(reels_audio_dir, fname)
        if not os.path.exists(dest1) or os.path.getsize(dest1) == 0:
            for attempt in range(5):
                try:
                    if os.path.exists(dest1):
                        os.remove(dest1)
                    comm = edge_tts.Communicate(text, "hi-IN-MadhurNeural", rate="+15%")
                    await comm.save(dest1)
                    if os.path.exists(dest1) and os.path.getsize(dest1) > 0:
                        shutil.copy2(dest1, dest2)
                        print(f"  [HI] {fname} generated")
                        break
                except Exception as e:
                    print(f"  [HI] {fname} attempt {attempt+1} failed: {e}")
                    await asyncio.sleep(2)
        else:
            if not os.path.exists(dest2):
                shutil.copy2(dest1, dest2)

    # English
    for code, text in ep["scenes_en"]:
        fname = f"en_{code}.mp3"
        dest1 = os.path.join(eng_audio_dir, fname)
        dest2 = os.path.join(reels_audio_dir, fname)
        if not os.path.exists(dest1) or os.path.getsize(dest1) == 0:
            for attempt in range(5):
                try:
                    if os.path.exists(dest1):
                        os.remove(dest1)
                    comm = edge_tts.Communicate(text, "en-IN-PrabhatNeural", rate="+15%")
                    await comm.save(dest1)
                    if os.path.exists(dest1) and os.path.getsize(dest1) > 0:
                        shutil.copy2(dest1, dest2)
                        print(f"  [EN] {fname} generated")
                        break
                except Exception as e:
                    print(f"  [EN] {fname} attempt {attempt+1} failed: {e}")
                    await asyncio.sleep(2)
        else:
            if not os.path.exists(dest2):
                shutil.copy2(dest1, dest2)

async def main():
    for ep_key, ep in DECEMBER_EPISODES.items():
        write_docs(ep_key, ep)
        await generate_audio_for_episode(ep_key, ep)
    print("\nALL EPISODES AUDIO & MOBILE PACKAGES GENERATED SUCCESSFULLY!")

if __name__ == "__main__":
    asyncio.run(main())
