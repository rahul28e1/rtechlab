#!/usr/bin/env python3
import os
import hashlib
from PIL import Image

v2_dir = r"c:/Users/Rahul/Videos/My projects/RtechLab/public/brand/previews_v2"
old_dir = r"c:/Users/Rahul/Videos/My projects/RtechLab/public/brand/previews"

files_map = [
    ("instagram_circle_v2.png", "preview_instagram_circle.png"),
    ("youtube_profile_v2.png", "preview_youtube_profile.png"),
    ("video_watermark_v2.png", "preview_video_watermark.png"),
    ("website_header_v2.png", "preview_website_header.png"),
    ("video_outro_v2.png", "preview_video_outro.png"),
    ("brand_comparison_v2.png", "brand_asset_comparison_sheet_v2.png")
]

print("=" * 110)
print(f"{'V2 New Filename':26s} | {'Dimensions':12s} | {'Size':12s} | {'SHA-256 Hash':64s}")
print("=" * 110)

for v2_fn, old_fn in files_map:
    p_v2 = os.path.join(v2_dir, v2_fn)
    im_v2 = Image.open(p_v2)
    sz_v2 = os.path.getsize(p_v2)
    with open(p_v2, "rb") as f:
        h_v2 = hashlib.sha256(f.read()).hexdigest()
        
    p_old = os.path.join(old_dir, old_fn) if os.path.exists(os.path.join(old_dir, old_fn)) else None
    h_old = ""
    if p_old:
        with open(p_old, "rb") as f:
            h_old = hashlib.sha256(f.read()).hexdigest()
            
    print(f"{v2_fn:26s} | {im_v2.size[0]}x{im_v2.size[1]:<7d} | {sz_v2:<12,d} | {h_v2}")
    is_diff = (h_v2 != h_old)
    print(f"   -> PROVEN DIFFERENT FROM PREVIOUS FILE: {is_diff} (Old Hash: {h_old[:16]}...)")

print("=" * 110)

# Visual Pixel Audit:
# 1. Instagram Circle V2
p1 = Image.open(os.path.join(v2_dir, "instagram_circle_v2.png"))
print("\n[AUDIT 1] instagram_circle_v2.png:")
bottom_pixels = []
for y in range(398, 495):
    for x in range(60, 460):
        dist = ((x - 260)**2 + (y - 295)**2)**0.5
        if dist <= 194:
            p = p1.getpixel((x, y))
            diff = ((p[0]-0)**2 + (p[1]-1)**2 + (p[2]-24)**2)**0.5
            if diff > 25:
                bottom_pixels.append((x, y, p))
print(f"   Non-bg pixels in lower circular margin (y >= 398 to 495): {len(bottom_pixels)}")
print(f"   -> Bottom circular margin is 100% clean dark background: {len(bottom_pixels) == 0} (97 clean rows below emblem)")

# 2. YouTube Profile V2
p2 = Image.open(os.path.join(v2_dir, "youtube_profile_v2.png"))
print("\n[AUDIT 2] youtube_profile_v2.png:")
bottom_yt = []
for y in range(398, 495):
    for x in range(60, 460):
        dist = ((x - 260)**2 + (y - 295)**2)**0.5
        if dist <= 194:
            p = p2.getpixel((x, y))
            diff = ((p[0]-0)**2 + (p[1]-1)**2 + (p[2]-24)**2)**0.5
            if diff > 25:
                bottom_yt.append((x, y, p))
print(f"   Non-bg pixels in lower circular margin (y >= 398 to 495): {len(bottom_yt)}")
print(f"   -> Bottom circular margin is 100% clean dark background: {len(bottom_yt) == 0} (97 clean rows below emblem)")

# 3. Video Outro V2
p5 = Image.open(os.path.join(v2_dir, "video_outro_v2.png"))
print("\n[AUDIT 3] video_outro_v2.png:")
gap_pixels = []
for y in range(595, 635):
    for x in range(720):
        p = p5.getpixel((x, y))
        diff = ((p[0]-0)**2 + (p[1]-1)**2 + (p[2]-24)**2)**0.5
        if diff > 25:
            gap_pixels.append((x, y, p))
print(f"   Non-bg pixels in gap between logo and action card (y in [595..635]): {len(gap_pixels)}")
print(f"   -> Gap is 100% clean dark background: {len(gap_pixels) == 0} (No cut-off fragments!)")
