#!/usr/bin/env python3
import os
import sys
from pathlib import Path
from extract_brand_qa_final import probe_video, extract_all_frames, build_comparison_sheet, audit_pixels, get_sha256

out_dir = Path("video-engine/out/brand_qa_final")
en_path = out_dir / "rtechlab_brand_test_en_refined_v2.mp4"
hi_path = out_dir / "rtechlab_brand_test_hi_refined_v2.mp4"

print("=== PROBING ENGLISH REFINED V2 ===")
probe_en = probe_video(en_path)
sha_en = get_sha256(en_path)
print(f"File: {en_path.name}")
print(f"Size: {probe_en['size_bytes']:,} bytes")
print(f"Duration: {probe_en['duration']:.2f}s | Resolution: {probe_en['width']}x{probe_en['height']} | FPS: {probe_en['fps']} | Codec: {probe_en['codec']}")
print(f"SHA-256: {sha_en}")

print("\n=== PROBING HINDI REFINED V2 ===")
probe_hi = probe_video(hi_path)
sha_hi = get_sha256(hi_path)
print(f"File: {hi_path.name}")
print(f"Size: {probe_hi['size_bytes']:,} bytes")
print(f"Duration: {probe_hi['duration']:.2f}s | Resolution: {probe_hi['width']}x{probe_hi['height']} | FPS: {probe_hi['fps']} | Codec: {probe_hi['codec']}")
print(f"SHA-256: {sha_hi}")

print("\n=== EXTRACTING ENGLISH FRAMES (0s, 1s, 2s, 3s, 4s, 5s) ===")
frames_en = extract_all_frames(en_path, "brand_test_en")
for f in frames_en:
    print(f"  {f['filename']} ({f['size'][0]}x{f['size'][1]})")

print("\n=== EXTRACTING HINDI FRAMES (0s, 1s, 2s, 3s, 4s, 5s) ===")
frames_hi = extract_all_frames(hi_path, "brand_test_hi")
for f in frames_hi:
    print(f"  {f['filename']} ({f['size'][0]}x{f['size'][1]})")

print("\n=== BUILDING COMPARISON SHEET ===")
build_comparison_sheet()

print("\n=== PIXEL AUDIT ===")
audit_pixels()
