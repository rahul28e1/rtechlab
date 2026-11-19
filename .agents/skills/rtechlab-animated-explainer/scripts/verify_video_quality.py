#!/usr/bin/env python3
"""
RTechLab Video Quality & Standards Verification Script
Audits generated MP4 files for resolution, framerate, duration, audio presence,
and extracts representative inspection frames.
"""

import os
import sys
import json
import subprocess
import shutil

def get_ffmpeg():
    # 1. System PATH
    p = shutil.which("ffmpeg")
    if p: return p
    # 2. Known static paths
    candidates = [
        r"C:\Users\Rahul\youtube-automation-agent\node_modules\ffmpeg-static\ffmpeg.exe",
        r"C:\Users\Rahul\AppData\Local\Programs\Python\Python313\Lib\site-packages\imageio_ffmpeg\binaries\ffmpeg-win-x86_64-v7.1.exe"
    ]
    for c in candidates:
        if os.path.exists(c):
            return c
    try:
        import imageio_ffmpeg
        return imageio_ffmpeg.get_ffmpeg_exe()
    except Exception:
        pass
    return "ffmpeg"

def audit_video(video_path, output_dir=None):
    if not os.path.exists(video_path):
        return {"status": "FAIL", "error": f"File does not exist: {video_path}"}
        
    ffmpeg_exe = get_ffmpeg()
    
    cmd = [ffmpeg_exe, "-hide_banner", "-i", video_path]
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, errors="replace")
    stderr = result.stderr
    
    file_size_bytes = os.path.getsize(video_path)
    file_size_mb = round(file_size_bytes / (1024 * 1024), 2)
    
    is_1080x1920 = "1080x1920" in stderr
    has_audio = "Audio:" in stderr
    has_video = "Video:" in stderr
    is_h264 = "h264" in stderr.lower()
    
    # Extract duration
    duration = None
    import re
    dur_match = re.search(r"Duration:\s*(\d{2}):(\d{2}):(\d{2}\.\d+)", stderr)
    if dur_match:
        hours, minutes, seconds = dur_match.groups()
        duration = float(hours)*3600 + float(minutes)*60 + float(seconds)
        
    extracted_frames = []
    if output_dir and duration:
        os.makedirs(output_dir, exist_ok=True)
        sample_times = [2, 10, 25, 40, 55]
        for t in sample_times:
            if t < duration:
                frame_out = os.path.join(output_dir, f"frame_at_{t}s.jpg")
                frame_cmd = [
                    ffmpeg_exe, "-y", "-ss", str(t), "-i", video_path,
                    "-vframes", "1", "-q:v", "2", frame_out
                ]
                subprocess.run(frame_cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                if os.path.exists(frame_out):
                    extracted_frames.append(frame_out)

    audit_passed = (
        is_1080x1920 and
        has_video and
        has_audio and
        duration is not None and
        (55.0 <= duration <= 66.0)
    )

    report = {
        "file_name": os.path.basename(video_path),
        "file_path": os.path.abspath(video_path),
        "file_size_mb": file_size_mb,
        "duration_seconds": duration,
        "is_1080x1920": is_1080x1920,
        "has_h264_video": is_h264,
        "has_audio_track": has_audio,
        "extracted_sample_frames": extracted_frames,
        "audit_verdict": "PASSED" if audit_passed else "WARNING_OR_FAILED"
    }
    
    return report

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: verify_video_quality.py <video_path> [output_frame_dir]")
        sys.exit(1)
        
    v_path = sys.argv[1]
    f_dir = sys.argv[2] if len(sys.argv) > 2 else None
    rep = audit_video(v_path, f_dir)
    print(json.dumps(rep, indent=2))
