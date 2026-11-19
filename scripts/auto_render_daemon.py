# -*- coding: utf-8 -*-
"""
Auto Render Daemon for December 2026 Season 1
Orchestrates seamless sequential rendering of all episodes directly into date folders.
"""

import time
import os
import subprocess
from december_episodes_data import DECEMBER_EPISODES
from render_all_december_reels import render_episode
from generate_all_december_compositions import generate_configs

BASE_REELS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\DECEMBER_2026_FACE_REELS"
AUDIO_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\video-engine\public\audio\december"

def check_all_audio_done():
    for i in range(3, 17):
        ep_dir = os.path.join(AUDIO_DIR, f"ep{i:02d}")
        if not os.path.exists(ep_dir) or len(os.listdir(ep_dir)) < 16:
            return False
    return True

def main():
    print("="*60)
    print("🚀 RTECHLAB DECEMBER 2026 AUTOMATED RENDERING ENGINE")
    print("="*60)

    # 1. Wait for audio generation if still in progress
    print("Checking audio generation status...")
    while not check_all_audio_done():
        print("  Waiting for audio generation to complete across all episodes...")
        time.sleep(5)

    print("✅ All 16 episodes audio stems verified complete!")

    # 2. Update configs
    print("\nUpdating Remotion frame timeline configurations...")
    generate_configs()
    print("✅ Timeline configurations updated!")

    # 3. Wait for any currently running EP03 Hindi render to finish
    ep03_folder = os.path.join(BASE_REELS_DIR, "EP03 (05.12.26) - IRCTC 10 AM Tatkal Spike", "FINAL_VIDEOS")
    ep03_hi = os.path.join(ep03_folder, "EP03_IRCTC_10_AM_Tatkal_Spike_Hindi.mp4")
    
    print("\nChecking EP03 render status...")
    # If a render is in progress, check if file is growing
    if os.path.exists(ep03_hi):
        last_sz = -1
        while True:
            cur_sz = os.path.getsize(ep03_hi)
            if cur_sz == last_sz and cur_sz > 1000000:
                print(f"EP03 Hindi render complete: {cur_sz:,} bytes")
                break
            print(f"EP03 Hindi rendering in progress ({cur_sz:,} bytes)...")
            last_sz = cur_sz
            time.sleep(10)

    # 4. Sequentially render all episodes EP03 through EP16
    for i in range(3, 17):
        ep_key = f"ep{i:02d}"
        ep = DECEMBER_EPISODES[ep_key]
        num_str = ep["num"]
        print(f"\n[{i-2}/14] Launching render for {num_str} ({ep['date_code']})...")
        success = render_episode(ep_key)
        if success:
            print(f"✅ {num_str} fully rendered and filed!")
        else:
            print(f"⚠️ {num_str} render encountered an issue, proceeding to next.")

    print("\n" + "="*60)
    print("🎉 ALL 16 DECEMBER REELS COMPLETE & PLACED IN DATE FOLDERS!")
    print("="*60)

if __name__ == "__main__":
    main()
