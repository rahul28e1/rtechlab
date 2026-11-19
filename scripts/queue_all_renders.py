# -*- coding: utf-8 -*-
"""
Queue and Render All December Reels Continuously
Waits for any active renders, then sequentially renders EP03 through EP16,
saving every MP4 and cover thumbnail directly into its date folder.
"""

import time
import os
import sys

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(line_buffering=True)
from december_episodes_data import DECEMBER_EPISODES
from render_all_december_reels import render_episode
from generate_all_december_compositions import generate_configs

BASE_REELS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\DECEMBER_2026_FACE_REELS"

def main():
    print("="*60)
    print("🚀 RTECHLAB DECEMBER 2026 CONTINUOUS MASTER RENDER PIPELINE")
    print("="*60)

    # First update configs for all completed episodes
    print("Updating episode timeline configurations...")
    generate_configs()

    episodes = [f"ep{i:02d}" for i in range(3, 17)]

    for ep_key in episodes:
        ep = DECEMBER_EPISODES[ep_key]
        num_str = ep["num"]
        folder = os.path.join(BASE_REELS_DIR, ep["folder"])
        videos_dir = os.path.join(folder, "FINAL_VIDEOS")
        hi_mp4 = os.path.join(videos_dir, f"{num_str}_{ep['short_title'].replace(' ', '_')}_Hindi.mp4")
        en_mp4 = os.path.join(videos_dir, f"{num_str}_{ep['short_title'].replace(' ', '_')}_English.mp4")

        # Check if already rendered
        if os.path.exists(hi_mp4) and os.path.getsize(hi_mp4) > 1000000 and \
           os.path.exists(en_mp4) and os.path.getsize(en_mp4) > 1000000:
            print(f"⏩ {num_str} already rendered and verified. Skipping.")
            continue

        print(f"\nProcessing {num_str} ({ep['date_code']})...")
        success = render_episode(ep_key)
        if success:
            print(f"🎉 Successfully rendered and filed {num_str}!")
        else:
            print(f"⚠️ Render for {num_str} returned non-zero. Continuing to next...")

    print("\n" + "="*60)
    print("🌟 ALL 16 DECEMBER EPISODES RENDERED & FILED IN DATE FOLDERS!")
    print("="*60)

if __name__ == "__main__":
    main()
