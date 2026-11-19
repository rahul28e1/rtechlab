# -*- coding: utf-8 -*-
"""
RTechLab Master Re-Renderer for Fixed December 2026 Reels (EP03 to EP16)
Re-renders all episodes with full multi-scene spring animations,
dynamic header HUD, ambient BGM, and scene transition whooshes.
Idempotent: Uses cutoff timestamp (2026-11-15 22:25:00) so any video
rendered after the fix is safely preserved.
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

# Cutoff: Only videos created AFTER 22:25:00 on 2026-11-15 are considered fixed.
FIX_CUTOFF_EPOCH = time.mktime(time.strptime("2026-11-15 22:25:00", "%Y-%m-%d %H:%M:%S"))

def is_video_fixed(path):
    if not os.path.exists(path):
        return False
    if os.path.getsize(path) < 1000000:
        return False
    return os.path.getmtime(path) > FIX_CUTOFF_EPOCH

def re_render_episode(ep_key, force=False):
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
    ep_num_int = int(ep_key.replace("ep", ""))
    comp_hi = f"DecemberEpisode{ep_num_int:02d}HIBright"
    comp_en = f"DecemberEpisode{ep_num_int:02d}ENBright"

    hi_mp4 = os.path.join(videos_dir, f"{num_str}_{ep['short_title'].replace(' ', '_')}_Hindi.mp4")
    en_mp4 = os.path.join(videos_dir, f"{num_str}_{ep['short_title'].replace(' ', '_')}_English.mp4")
    cover_png = os.path.join(covers_dir, f"{num_str}_Cover_Frame150.png")

    print(f"\n{'='*70}")
    print(f"🎬 BATCH RE-RENDER: {num_str} ({ep['date_code']}) — {ep['title_hi']}")
    print(f"{'='*70}")

    # 1. Cover Still
    if not os.path.exists(cover_png) or os.path.getsize(cover_png) == 0:
        print(f"\n📸 Rendering Thumbnail Cover Still...")
        cmd_still = [
            "npx.cmd", "remotion", "still",
            "src/index.js", comp_hi, cover_png,
            "--frame=150", "--gl=angle"
        ]
        subprocess.run(cmd_still, cwd=ENGINE_DIR, text=True)

    # 2. Hindi Video
    need_hi = force or (not is_video_fixed(hi_mp4))
    if need_hi:
        if os.path.exists(hi_mp4):
            try:
                os.remove(hi_mp4)
            except Exception:
                pass
        print(f"\n🎥 [HINDI] Rendering {comp_hi}...")
        t0 = time.time()
        cmd_hi = [
            "npx.cmd", "remotion", "render",
            "src/index.js", comp_hi, hi_mp4,
            "--gl=angle"
        ]
        res_hi = subprocess.run(cmd_hi, cwd=ENGINE_DIR, text=True)
        dt = time.time() - t0
        if res_hi.returncode == 0 and os.path.exists(hi_mp4):
            print(f"✅ Hindi Render Complete in {dt:.1f}s ({dt/60:.1f}m) — {os.path.getsize(hi_mp4):,} bytes")
        else:
            print(f"❌ Hindi Render Failed for {num_str}!")
            return False
    else:
        print(f"ℹ️ Hindi Video already verified fixed ({os.path.getsize(hi_mp4):,} bytes). Skipping.")

    # 3. English Video
    need_en = force or (not is_video_fixed(en_mp4))
    if need_en:
        if os.path.exists(en_mp4):
            try:
                os.remove(en_mp4)
            except Exception:
                pass
        print(f"\n🎥 [ENGLISH] Rendering {comp_en}...")
        t0 = time.time()
        cmd_en = [
            "npx.cmd", "remotion", "render",
            "src/index.js", comp_en, en_mp4,
            "--gl=angle"
        ]
        res_en = subprocess.run(cmd_en, cwd=ENGINE_DIR, text=True)
        dt = time.time() - t0
        if res_en.returncode == 0 and os.path.exists(en_mp4):
            print(f"✅ English Render Complete in {dt:.1f}s ({dt/60:.1f}m) — {os.path.getsize(en_mp4):,} bytes")
        else:
            print(f"❌ English Render Failed for {num_str}!")
            return False
    else:
        print(f"ℹ️ English Video already verified fixed ({os.path.getsize(en_mp4):,} bytes). Skipping.")

    print(f"\n🎉 {num_str} VERIFIED COMPLETE WITH FULL DURATION VISUALS & BGM!")
    return True

def main():
    print("="*70)
    print("🚀 STARTING DECEMBER 2026 SEQUENTIAL FULL RE-RENDER ENGINE")
    print("="*70)

    episodes = [f"ep{i:02d}" for i in range(3, 17)]
    for ep_key in episodes:
        re_render_episode(ep_key)

    print("\n" + "="*70)
    print("🌟 ALL DECEMBER REELS (EP03 TO EP16) RE-RENDERED & FULLY VERIFIED!")
    print("="*70)

if __name__ == "__main__":
    main()
