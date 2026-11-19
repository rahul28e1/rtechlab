# -*- coding: utf-8 -*-
"""
RTechLab December 2026 Batch Video Renderer
Renders full-length vertical animations (1080x1920 @ 30 FPS, Bright Theme)
for Hindi and English editions and places them into date-wise publishing folders.
"""

import os
import sys
import time
import subprocess

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(line_buffering=True)
from december_episodes_data import DECEMBER_EPISODES

ENGINE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\video-engine"
BASE_REELS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\DECEMBER_2026_FACE_REELS"

def render_episode(ep_key):
    ep = DECEMBER_EPISODES.get(ep_key)
    if not ep:
        print(f"Unknown episode key: {ep_key}")
        return False

    folder = os.path.join(BASE_REELS_DIR, ep["folder"])
    videos_dir = os.path.join(folder, "FINAL_VIDEOS")
    covers_dir = os.path.join(folder, "THUMBNAILS_COVERS")
    os.makedirs(videos_dir, exist_ok=True)
    os.makedirs(covers_dir, exist_ok=True)

    num_str = ep["num"]  # e.g. "EP03"
    comp_hi = f"December{num_str.capitalize()}HIBright"  # e.g. "DecemberEpisode03HIBright"
    # Actually composition IDs in Root.jsx are: DecemberEpisode03HIBright
    ep_num_int = int(ep_key.replace("ep", ""))
    comp_hi = f"DecemberEpisode{ep_num_int:02d}HIBright"
    comp_en = f"DecemberEpisode{ep_num_int:02d}ENBright"

    hi_mp4 = os.path.join(videos_dir, f"{num_str}_{ep['short_title'].replace(' ', '_')}_Hindi.mp4")
    en_mp4 = os.path.join(videos_dir, f"{num_str}_{ep['short_title'].replace(' ', '_')}_English.mp4")
    cover_png = os.path.join(covers_dir, f"{num_str}_Cover_Frame150.png")

    print(f"\n{'='*60}")
    print(f"🎬 RENDERING {num_str} ({ep['date_code']}) — {ep['title_hi']}")
    print(f"{'='*60}")

    # 1. Render Cover Still if not exists
    if not os.path.exists(cover_png) or os.path.getsize(cover_png) == 0:
        print(f"\n📸 Rendering Thumbnail Cover Still...")
        cmd_still = [
            "npx.cmd", "remotion", "still",
            "src/index.js", comp_hi, cover_png,
            "--frame=150", "--gl=angle"
        ]
        res = subprocess.run(cmd_still, cwd=ENGINE_DIR, text=True)
        if res.returncode == 0:
            print(f"✅ Cover Still created: {os.path.getsize(cover_png):,} bytes")
        else:
            print(f"⚠️ Cover Still render encountered an issue.")
    else:
        print(f"ℹ️ Cover Still already exists ({os.path.getsize(cover_png):,} bytes).")

    # 2. Render Hindi Video
    if not os.path.exists(hi_mp4) or os.path.getsize(hi_mp4) < 1000000:
        print(f"\n🎥 Rendering Hindi Edition ({comp_hi})...")
        t0 = time.time()
        cmd_render_hi = [
            "npx.cmd", "remotion", "render",
            "src/index.js", comp_hi, hi_mp4,
            "--gl=angle"
        ]
        res_hi = subprocess.run(cmd_render_hi, cwd=ENGINE_DIR, text=True)
        dt = time.time() - t0
        if res_hi.returncode == 0 and os.path.exists(hi_mp4):
            print(f"✅ Hindi Video Rendered in {dt:.1f}s ({dt/60:.1f}m) — {os.path.getsize(hi_mp4):,} bytes")
        else:
            print(f"❌ Hindi Video Render failed with exit code {res_hi.returncode}")
            return False
    else:
        print(f"ℹ️ Hindi Video already exists ({os.path.getsize(hi_mp4):,} bytes). Skipping.")

    # 3. Render English Video
    if not os.path.exists(en_mp4) or os.path.getsize(en_mp4) < 1000000:
        print(f"\n🎥 Rendering English Edition ({comp_en})...")
        t0 = time.time()
        cmd_render_en = [
            "npx.cmd", "remotion", "render",
            "src/index.js", comp_en, en_mp4,
            "--gl=angle"
        ]
        res_en = subprocess.run(cmd_render_en, cwd=ENGINE_DIR, text=True)
        dt = time.time() - t0
        if res_en.returncode == 0 and os.path.exists(en_mp4):
            print(f"✅ English Video Rendered in {dt:.1f}s ({dt/60:.1f}m) — {os.path.getsize(en_mp4):,} bytes")
        else:
            print(f"❌ English Video Render failed with exit code {res_en.returncode}")
            return False
    else:
        print(f"ℹ️ English Video already exists ({os.path.getsize(en_mp4):,} bytes). Skipping.")

    print(f"\n🎉 {num_str} FULL PRODUCTION COMPLETE & READY FOR MANUAL PUBLISHING!")
    return True

if __name__ == "__main__":
    if len(sys.argv) > 1:
        target_eps = sys.argv[1:]
    else:
        target_eps = [f"ep{i:02d}" for i in range(3, 17)]

    for ep in target_eps:
        render_episode(ep)
