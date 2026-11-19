#!/usr/bin/env python3
"""
RTechLab Official Brand Asset System Generator
Processes the approved master logo into lossless, multi-resolution, verified assets.
Strictly preserves proportions, colors, and typography without inventing elements.
"""

import os
import shutil
import math
from PIL import Image, ImageDraw

SRC_MASTER = r"C:/Users/Rahul/.gemini/antigravity/brain/aa8b9a64-f281-4dd1-bf84-94b54dd00256/.user_uploaded/media_1794366651626_b99e2b8c.jpg"

PUBLIC_BRAND = r"c:/Users/Rahul/Videos/My projects/RtechLab/public/brand"
ENGINE_BRAND = r"c:/Users/Rahul/Videos/My projects/RtechLab/video-engine/assets/brand"
PREVIEWS_DIR = r"c:/Users/Rahul/Videos/My projects/RtechLab/public/brand/previews"

os.makedirs(PUBLIC_BRAND, exist_ok=True)
os.makedirs(ENGINE_BRAND, exist_ok=True)
os.makedirs(PREVIEWS_DIR, exist_ok=True)

def build_brand_assets():
    print("[1/6] Loading approved master logo...")
    master_im = Image.open(SRC_MASTER).convert("RGB")
    w, h = master_im.size # 1024, 682
    bg_color = (0, 1, 24)

    # 1. rtechlab-master.png (Lossless 1024x682 full logo)
    print("[2/6] Generating rtechlab-master.png...")
    master_png_path = os.path.join(PUBLIC_BRAND, "rtechlab-master.png")
    master_im.save(master_png_path, "PNG", optimize=True)

    # 2. rtechlab-icon.png (Square 800x800 for profile avatars)
    print("[3/6] Generating rtechlab-icon.png (square profile format)...")
    # Emblem bounds: X=[279, 815] (center=547), Y=[26, 449] (center=237)
    crop_w = 600
    crop_h = 460
    x1 = 547 - crop_w // 2 # 247
    x2 = x1 + crop_w       # 847
    y1 = 0
    y2 = 460
    emblem_crop = master_im.crop((x1, y1, x2, y2))
    
    icon_canvas = Image.new("RGB", (800, 800), bg_color)
    paste_x = (800 - crop_w) // 2
    paste_y = 400 - 237 # 163 (centers emblem at 400, 400)
    icon_canvas.paste(emblem_crop, (paste_x, paste_y))
    
    icon_path = os.path.join(PUBLIC_BRAND, "rtechlab-icon.png")
    icon_canvas.save(icon_path, "PNG", optimize=True)

    # 3. rtechlab-logo-transparent.png & rtechlab-watermark.png
    print("[4/6] Extracting precision alpha transparency...")
    trans_logo = Image.new("RGBA", (w, h), (0, 0, 0, 0))
    bg_r, bg_g, bg_b = bg_color
    
    for y in range(h):
        for x in range(w):
            r, g, b = master_im.getpixel((x, y))
            dist = math.sqrt((r - bg_r)**2 + (g - bg_g)**2 + (b - bg_b)**2)
            
            is_core_emblem = (350 <= x <= 700) and (70 <= y <= 425)
            is_core_text = (130 <= x <= 895) and (455 <= y <= 625)
            
            if is_core_emblem or is_core_text:
                if dist > 8:
                    alpha = 255 if dist > 14 else int(dist * 18)
                else:
                    alpha = 0
            else:
                if dist <= 14:
                    alpha = 0
                elif dist < 50:
                    t = (dist - 14) / (50 - 14)
                    alpha = int(255 * (t ** 1.5))
                else:
                    alpha = 255
                    
            if alpha > 0:
                trans_logo.putpixel((x, y), (r, g, b, alpha))
                
    trans_logo_path = os.path.join(PUBLIC_BRAND, "rtechlab-logo-transparent.png")
    trans_logo.save(trans_logo_path, "PNG", optimize=True)

    # Watermark: Icon portion transparent (600x460 cropped to 800x800 transparent canvas)
    trans_emblem_crop = trans_logo.crop((x1, y1, x2, y2))
    watermark_canvas = Image.new("RGBA", (800, 800), (0, 0, 0, 0))
    watermark_canvas.paste(trans_emblem_crop, (paste_x, paste_y), trans_emblem_crop)
    watermark_path = os.path.join(PUBLIC_BRAND, "rtechlab-watermark.png")
    watermark_canvas.save(watermark_path, "PNG", optimize=True)

    # 4. Multi-scale Favicons
    print("[5/6] Generating multi-resolution favicons and favicon.ico...")
    favicon_sizes = [16, 32, 48, 64, 128, 192, 512]
    ico_images = []
    
    for sz in favicon_sizes:
        # Resize from icon_canvas for crisp dark-background square
        resized = icon_canvas.resize((sz, sz), Image.Resampling.LANCZOS)
        out_fav_path = os.path.join(PUBLIC_BRAND, f"favicon-{sz}x{sz}.png")
        resized.save(out_fav_path, "PNG", optimize=True)
        if sz in [16, 32, 48]:
            ico_images.append(resized)
            
    # Save standard favicon.ico
    ico_path = os.path.join(PUBLIC_BRAND, "favicon.ico")
    ico_images[0].save(ico_path, format="ICO", sizes=[(16, 16), (32, 32), (48, 48)], append_images=ico_images[1:])

    # Copy all assets to video-engine/assets/brand
    print("Mirroring assets to video-engine/assets/brand/...")
    for f in os.listdir(PUBLIC_BRAND):
        src_f = os.path.join(PUBLIC_BRAND, f)
        if os.path.isfile(src_f):
            shutil.copy2(src_f, os.path.join(ENGINE_BRAND, f))

    # 5. Verification Mockup Previews
    print("[6/6] Generating verification preview mockups...")
    
    # A. Website Header Preview (Height 44px on #0f172a navbar)
    header_h = 44
    header_w = int(w * (header_h / h))
    logo_header = trans_logo.resize((header_w, header_h), Image.Resampling.LANCZOS)
    header_canvas = Image.new("RGB", (600, 72), (15, 23, 42)) # #0f172a
    draw_h = ImageDraw.Draw(header_canvas)
    draw_h.line([(0, 71), (600, 71)], fill=(30, 41, 59), width=1)
    header_canvas.paste(logo_header, (24, (72 - header_h) // 2), logo_header)
    header_canvas.save(os.path.join(PREVIEWS_DIR, "preview_website_header.png"))

    # B. Instagram Profile Circle Crop (400x400 circle on gray canvas)
    ig_size = 400
    ig_icon = icon_canvas.resize((ig_size, ig_size), Image.Resampling.LANCZOS)
    mask = Image.new("L", (ig_size, ig_size), 0)
    draw_m = ImageDraw.Draw(mask)
    draw_m.ellipse((0, 0, ig_size, ig_size), fill=255)
    
    ig_preview = Image.new("RGB", (ig_size + 40, ig_size + 40), (24, 24, 27))
    ig_preview.paste(ig_icon, (20, 20), mask)
    draw_ig = ImageDraw.Draw(ig_preview)
    draw_ig.ellipse((20, 20, ig_size + 20, ig_size + 20), outline=(217, 70, 239), width=3) # Instagram ring
    ig_preview.save(os.path.join(PREVIEWS_DIR, "preview_instagram_circle.png"))

    # C. YouTube Profile Avatar (400x400 circle on #0f0f0f canvas)
    yt_preview = Image.new("RGB", (ig_size + 40, ig_size + 40), (15, 15, 15))
    yt_preview.paste(ig_icon, (20, 20), mask)
    draw_yt = ImageDraw.Draw(yt_preview)
    draw_yt.ellipse((20, 20, ig_size + 20, ig_size + 20), outline=(56, 189, 248), width=2)
    yt_preview.save(os.path.join(PREVIEWS_DIR, "preview_youtube_profile.png"))

    # D. Video Watermark Preview (translucent at bottom-right of 1080x1920 video slice)
    wm_slice = Image.new("RGB", (500, 500), (8, 13, 26))
    wm_small = watermark_canvas.resize((120, 120), Image.Resampling.LANCZOS)
    # Apply 45% watermark opacity
    wm_r, wm_g, wm_b, wm_a = wm_small.split()
    wm_a = wm_a.point(lambda p: int(p * 0.45))
    wm_small.putalpha(wm_a)
    wm_slice.paste(wm_small, (350, 350), wm_small)
    wm_slice.save(os.path.join(PREVIEWS_DIR, "preview_video_watermark.png"))

    # E. Video Intro/Outro Emblem (centered 480x480 on 1080x1920 slice)
    outro_slice = Image.new("RGB", (1080, 800), (8, 13, 26))
    emblem_outro = icon_canvas.resize((480, 480), Image.Resampling.LANCZOS)
    outro_slice.paste(emblem_outro, ((1080 - 480) // 2, (800 - 480) // 2))
    outro_slice.save(os.path.join(PREVIEWS_DIR, "preview_video_outro.png"))

    print("[DONE] Brand asset system generation and previews complete.")

if __name__ == "__main__":
    build_brand_assets()
