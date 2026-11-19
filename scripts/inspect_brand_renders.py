#!/usr/bin/env python3
"""
Inspect rendered branding test videos (English & Hindi)
Extracts key frames:
1. Frame at 1.0s (Intro)
2. Frame at 2.5s (Dark Watermark)
3. Frame at 3.5s (Bright Watermark)
4. Frame at 5.0s (Outro)
"""

import os
import subprocess
import json
from pathlib import Path
from PIL import Image

OUT_DIR = Path("video-engine/out")
FRAMES_DIR_PUB = Path("public/brand/test_frames")
FRAMES_DIR_BRAIN = Path(r"C:\Users\Rahul\.gemini\antigravity\brain\aa8b9a64-f281-4dd1-bf84-94b54dd00256\brand_test_frames")

FRAMES_DIR_PUB.mkdir(parents=True, exist_ok=True)
FRAMES_DIR_BRAIN.mkdir(parents=True, exist_ok=True)

FFMPEG_BIN = r"C:\Users\Rahul\Videos\My projects\RtechLab\video-engine\node_modules\@remotion\compositor-win32-x64-msvc\ffmpeg.exe"
FFPROBE_BIN = r"C:\Users\Rahul\Videos\My projects\RtechLab\video-engine\node_modules\@remotion\compositor-win32-x64-msvc\ffprobe.exe"

def probe_video(video_path):
    cmd = [
        FFPROBE_BIN, "-v", "quiet", "-print_format", "json",
        "-show_format", "-show_streams", str(video_path)
    ]
    res = subprocess.run(cmd, capture_output=True, text=True, check=True)
    data = json.loads(res.stdout)
    vstream = next(s for s in data["streams"] if s["codec_type"] == "video")
    
    fps_parts = vstream["r_frame_rate"].split("/")
    fps = float(fps_parts[0]) / float(fps_parts[1]) if len(fps_parts) == 2 else float(fps_parts[0])
    
    return {
        "duration": float(data["format"]["duration"]),
        "width": int(vstream["width"]),
        "height": int(vstream["height"]),
        "fps": fps,
        "codec": vstream["codec_name"],
        "size_bytes": int(data["format"]["size"]),
    }

def extract_frames(video_path, prefix):
    # Timepoints: 1.0s, 2.5s, 3.5s, 5.0s
    timepoints = [
        ("intro_1s", "00:00:01.000"),
        ("dark_watermark_2_5s", "00:00:02.500"),
        ("bright_watermark_3_5s", "00:00:03.500"),
        ("outro_5s", "00:00:05.000"),
    ]
    
    extracted = []
    for label, ts in timepoints:
        out_name = f"{prefix}_{label}.jpg"
        out_pub = FRAMES_DIR_PUB / out_name
        out_brain = FRAMES_DIR_BRAIN / out_name
        
        cmd = [
            FFMPEG_BIN, "-y", "-ss", ts, "-i", str(video_path),
            "-vframes", "1", "-q:v", "2", str(out_pub)
        ]
        subprocess.run(cmd, capture_output=True, check=True)
        
        # Copy to brain artifacts
        out_brain.write_bytes(out_pub.read_bytes())
        
        # Check image
        im = Image.open(out_pub)
        extracted.append({
            "label": label,
            "filename": out_name,
            "size": im.size,
            "pub_path": str(out_pub),
            "brain_path": str(out_brain),
        })
    return extracted

def main():
    videos = [
        ("en", OUT_DIR / "rtechlab_brand_test_en.mp4"),
        ("hi", OUT_DIR / "rtechlab_brand_test_hi.mp4"),
    ]
    
    results = {}
    for lang, vpath in videos:
        if not vpath.exists():
            print(f"Waiting for {vpath.name} to finish...")
            return False
            
        print(f"\n--- Probing {vpath.name} ---")
        probe = probe_video(vpath)
        print(f"  Duration: {probe['duration']:.2f}s | Dimensions: {probe['width']}x{probe['height']} | FPS: {probe['fps']} | Codec: {probe['codec']} | Size: {probe['size_bytes']:,} B")
        
        print(f"--- Extracting Inspection Frames for {lang.upper()} ---")
        frames = extract_frames(vpath, f"brand_test_{lang}")
        for f in frames:
            print(f"  Extracted: {f['filename']} ({f['size'][0]}x{f['size'][1]})")
            
        results[lang] = {
            "probe": probe,
            "frames": frames
        }
        
    print("\n[ALL BRANDING TEST VIDEOS & FRAMES SUCCESSFULLY INSPECTED]")
    return True

if __name__ == "__main__":
    main()
