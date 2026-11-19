#!/usr/bin/env python3
"""
Create a 2x4 comparison sheet of the rendered branding test frames (EN & HI)
Rows:
  Row 1: English (Intro, Dark Watermark, Bright Watermark, Outro)
  Row 2: Hindi (Intro, Dark Watermark, Bright Watermark, Outro)
"""

from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

FRAMES_DIR = Path(r"C:\Users\Rahul\.gemini\antigravity\brain\aa8b9a64-f281-4dd1-bf84-94b54dd00256\brand_test_frames")
OUT_SHEET_PUB = Path("public/brand/test_frames/brand_test_comparison_sheet.png")
OUT_SHEET_BRAIN = FRAMES_DIR / "brand_test_comparison_sheet.png"

# Thumbnails: 270 x 480 (1/4 scale of 1080x1920)
thumb_w, thumb_h = 270, 480
gap = 20
margin_x = 40
margin_top = 100
margin_bottom = 40

sheet_w = margin_x * 2 + thumb_w * 4 + gap * 3 # 40*2 + 270*4 + 60 = 80 + 1080 + 60 = 1220
sheet_h = margin_top + thumb_h * 2 + gap + margin_bottom # 100 + 480*2 + 20 + 40 = 1120

sheet = Image.new("RGB", (sheet_w, sheet_h), (5, 9, 20))
draw = ImageDraw.Draw(sheet)

# Header Title
draw.text((margin_x, 25), "RTechLab — Reusable Video Branding Component Verification", fill=(255, 255, 255))
draw.text((margin_x, 55), "Live Remotion Renders | 1080x1920 @ 30fps | Intro (0-2s) • Dark Watermark (2-3s) • Bright Watermark (3-4s) • Outro (4-6s)", fill=(0, 242, 254))

cols = [
    ("Phase 1: Brand Intro (1.0s)", "intro_1s.jpg"),
    ("Phase 2A: Dark Watermark (2.5s)", "dark_watermark_2_5s.jpg"),
    ("Phase 2B: Bright Watermark (3.5s)", "bright_watermark_3_5s.jpg"),
    ("Phase 3: Master Outro (5.0s)", "outro_5s.jpg"),
]

languages = [
    ("English Render (rtechlab_brand_test_en.mp4)", "brand_test_en"),
    ("Hindi Render (rtechlab_brand_test_hi.mp4)", "brand_test_hi"),
]

for row_idx, (lang_title, prefix) in enumerate(languages):
    y_pos = margin_top + row_idx * (thumb_h + gap)
    for col_idx, (col_label, suffix) in enumerate(cols):
        x_pos = margin_x + col_idx * (thumb_w + gap)
        
        # Draw frame
        frame_path = FRAMES_DIR / f"{prefix}_{suffix}"
        if frame_path.exists():
            im = Image.open(frame_path).resize((thumb_w, thumb_h), Image.Resampling.LANCZOS)
            sheet.paste(im, (x_pos, y_pos))
            # Border
            draw.rectangle([x_pos, y_pos, x_pos + thumb_w - 1, y_pos + thumb_h - 1], outline=(30, 41, 59), width=2)
            
        # Label above column on row 0
        if row_idx == 0:
            draw.text((x_pos, y_pos - 20), col_label, fill=(148, 163, 184))

# Save sheet
OUT_SHEET_PUB.parent.mkdir(parents=True, exist_ok=True)
sheet.save(OUT_SHEET_PUB, "PNG")
sheet.save(OUT_SHEET_BRAIN, "PNG")
print(f"Comparison sheet generated: {sheet.size} -> {OUT_SHEET_BRAIN}")
