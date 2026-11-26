import os
import qrcode
from PIL import Image, ImageDraw, ImageFont

def generate_office_visuals():
    assets_dir = r"DIGITAL\OFFICE_365\07_SOURCE_FILES\02_BRAND_ASSETS"
    os.makedirs(assets_dir, exist_ok=True)

    # 1. Generate QR Codes
    qrs = [
        ("qr_rahul_portfolio.png", "https://rahulprofile28.netlify.app/"),
        ("qr_youtube_rtechlab.png", "https://www.youtube.com/@RTechLabOfficial"),
        ("qr_instagram_rtechlab.png", "https://www.instagram.com/rtechlabofficial/"),
        ("qr_whatsapp_community.png", "https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")
    ]

    for fname, url in qrs:
        qr = qrcode.QRCode(
            version=1,
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            box_size=10,
            border=2,
        )
        qr.add_data(url)
        qr.make(fit=True)
        img = qr.make_image(fill_color="#0F172A", back_color="#FFFFFF")
        out_path = os.path.join(assets_dir, fname)
        img.save(out_path)
        print(f"✓ Saved QR: {out_path}")

    # 2. Generate Microsoft 365 Official Suite Banner / App Badges Graphic
    # High-res clean image with W (Word Blue #185ABD), X (Excel Green #107C41),
    # P (PowerPoint Orange #C43E1C), O (Outlook Cyan/Blue #0078D4) and 365 Cloud Badge
    w, h = 1200, 320
    banner = Image.new("RGBA", (w, h), (255, 255, 255, 0))
    draw = ImageDraw.Draw(banner)

    # Rounded background card
    draw.rounded_rectangle([(10, 10), (w - 10, h - 10)], radius=24, fill=(15, 23, 42, 255), outline=(56, 189, 248, 200), width=3)

    # Draw App Pills / Tiles
    apps = [
        ("W", "Word 365", "#185ABD", "#2B7CD3"),
        ("X", "Excel 365", "#107C41", "#1E9C54"),
        ("P", "PowerPoint", "#C43E1C", "#E05328"),
        ("O", "Outlook 365", "#0078D4", "#2899F5"),
        ("☁", "Cloud & Co-Authoring", "#0284C7", "#38BDF8")
    ]

    start_x = 45
    tile_w = 210
    tile_h = 240
    tile_y = 40

    for i, (letter, name, c_dark, c_light) in enumerate(apps):
        tx = start_x + i * 230
        # Tile background
        draw.rounded_rectangle([(tx, tile_y), (tx + tile_w, tile_y + tile_h)], radius=18, fill=(30, 41, 59, 255), outline=(71, 85, 105, 255), width=2)
        
        # Icon square
        icon_size = 90
        ix = tx + (tile_w - icon_size) // 2
        iy = tile_y + 25
        draw.rounded_rectangle([(ix, iy), (ix + icon_size, iy + icon_size)], radius=20, fill=c_dark, outline=c_light, width=3)
        
        # Letter
        draw.text((ix + icon_size // 2, iy + icon_size // 2 - 2), letter, fill="white", anchor="mm", font_size=52)
        
        # App Name
        draw.text((tx + tile_w // 2, tile_y + 150), name, fill="white", anchor="mm", font_size=20)
        draw.text((tx + tile_w // 2, tile_y + 185), "Enterprise Pro", fill=(148, 163, 184), anchor="mm", font_size=14)

    suite_banner_path = os.path.join(assets_dir, "microsoft_365_official_suite_logo.png")
    banner.save(suite_banner_path)
    print(f"✓ Saved Suite Banner: {suite_banner_path}")

if __name__ == "__main__":
    generate_office_visuals()
