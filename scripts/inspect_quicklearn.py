#!/usr/bin/env python3
"""
inspect_quicklearn.py
Probes, validates, hashes and generates QA frame comparisons for QuickLearn renders.
"""

import hashlib
import json
import subprocess
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
FFMPEG = PROJECT_ROOT / "video-engine" / "node_modules" / "@remotion" / "compositor-win32-x64-msvc" / "ffmpeg.exe"
FFPROBE = PROJECT_ROOT / "video-engine" / "node_modules" / "@remotion" / "compositor-win32-x64-msvc" / "ffprobe.exe"
OUT_DIR = PROJECT_ROOT / "out" / "quicklearn"
QA_DIR = PROJECT_ROOT / "references" / "qa_quicklearn"
QA_DIR.mkdir(parents=True, exist_ok=True)

VIDEOS = [
    {
        "id": "quicklearn_ports_en",
        "path": OUT_DIR / "quicklearn_ports_en.mp4",
        "expected_frames": 1388,
        "lang": "en"
    },
    {
        "id": "quicklearn_ports_hi",
        "path": OUT_DIR / "quicklearn_ports_hi.mp4",
        "expected_frames": 1561,
        "lang": "hi"
    }
]

def get_sha256(filepath):
    h = hashlib.sha256()
    with open(filepath, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()

def probe_video(filepath):
    cmd = [
        str(FFPROBE),
        "-v", "quiet",
        "-print_format", "json",
        "-show_format",
        "-show_streams",
        str(filepath)
    ]
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        return None
    return json.loads(res.stdout)

def extract_qa_frames(filepath, prefix):
    # Extract frames at 2s, 12s, 24s, 38s
    timestamps = ["00:00:02.000", "00:00:12.000", "00:00:24.000", "00:00:38.000"]
    for idx, ts in enumerate(timestamps):
        out_frame = QA_DIR / f"{prefix}_frame_{idx+1}_{ts.replace(':', '_')}.png"
        cmd = [
            str(FFMPEG), "-y",
            "-ss", ts,
            "-i", str(filepath),
            "-vframes", "1",
            "-q:v", "2",
            str(out_frame)
        ]
        subprocess.run(cmd, capture_output=True)
        if out_frame.exists():
            print(f"  [+] QA Frame extracted: {out_frame.name} ({out_frame.stat().st_size} bytes)")

def inspect_all():
    print("==================================================")
    print(" RTECHLAB QUICKLEARN MASTER VALIDATION REPORT")
    print("==================================================")
    results = []

    for v in VIDEOS:
        p = v["path"]
        if not p.exists():
            print(f"[!] Pending render: {p.name}")
            continue

        size_bytes = p.stat().st_size
        sha = get_sha256(p)
        info = probe_video(p)

        video_stream = next((s for s in info["streams"] if s["codec_type"] == "video"), None)
        audio_stream = next((s for s in info["streams"] if s["codec_type"] == "audio"), None)

        width = video_stream.get("width") if video_stream else 0
        height = video_stream.get("height") if video_stream else 0
        duration = float(info["format"].get("duration", 0))
        bitrate = int(info["format"].get("bit_rate", 0))

        v_res = {
            "id": v["id"],
            "filename": p.name,
            "size_bytes": size_bytes,
            "size_mb": round(size_bytes / (1024 * 1024), 2),
            "sha256": sha,
            "resolution": f"{width}x{height}",
            "duration_sec": round(duration, 2),
            "bitrate_kbps": round(bitrate / 1000, 1),
            "has_audio": audio_stream is not None,
            "audio_codec": audio_stream.get("codec_name") if audio_stream else "None"
        }
        results.append(v_res)

        print(f"\n[+] Asset: {v_res['filename']}")
        print(f"    Resolution: {v_res['resolution']}")
        print(f"    Duration:   {v_res['duration_sec']}s")
        print(f"    Size:       {v_res['size_mb']} MB ({v_res['size_bytes']} bytes)")
        print(f"    Bitrate:    {v_res['bitrate_kbps']} kbps")
        print(f"    Audio:      {v_res['audio_codec']} (Stereo: {v_res['has_audio']})")
        print(f"    SHA-256:    {v_res['sha256']}")

        # Extract QA frames
        extract_qa_frames(p, v["id"])

    # Write JSON ledger
    summary_path = QA_DIR / "quicklearn_qa_manifest.json"
    with open(summary_path, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)
    print(f"\n[+] Manifest written to {summary_path}")

if __name__ == "__main__":
    inspect_all()
