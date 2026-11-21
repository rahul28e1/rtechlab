import os
import math
from PIL import Image, ImageDraw, ImageFont, ImageFilter

def create_circular_avatar(image_path, size):
    """Crop image into a circle with smooth edges"""
    img = Image.open(image_path).convert("RGBA")
    # Crop to square first
    min_dim = min(img.size)
    left = (img.width - min_dim) // 2
    top = (img.height - min_dim) // 4  # bias slightly towards top for portrait
    img = img.crop((left, top, left + min_dim, top + min_dim))
    img = img.resize((size, size), Image.Resampling.LANCZOS)
    
    # Create circular mask
    mask = Image.new('L', (size, size), 0)
    draw = ImageDraw.Draw(mask)
    draw.ellipse((0, 0, size, size), fill=255)
    
    output = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    output.paste(img, (0, 0), mask=mask)
    return output

def add_glow_circle(draw, center_x, center_y, radius, color, glow_width=12):
    for i in range(glow_width, 0, -2):
        alpha = int(80 * (1 - i / glow_width))
        draw.ellipse(
            (center_x - radius - i, center_y - radius - i, center_x + radius + i, center_y + radius + i),
            outline=(*color[:3], alpha),
            width=2
        )
    draw.ellipse(
        (center_x - radius, center_y - radius, center_x + radius, center_y + radius),
        outline=color,
        width=4
    )

def generate_story_1080x1920():
    width, height = 1080, 1920
    im = Image.new("RGBA", (width, height), (10, 10, 14, 255))
    draw = ImageDraw.Draw(im)

    # Fonts
    font_bold = "C:/Windows/Fonts/segoeuib.ttf"
    font_impact = "C:/Windows/Fonts/impact.ttf"
    font_regular = "C:/Windows/Fonts/segoeui.ttf"

    f_title = ImageFont.truetype(font_impact, 64)
    f_sub = ImageFont.truetype(font_bold, 30)
    f_body = ImageFont.truetype(font_bold, 24)
    f_small = ImageFont.truetype(font_bold, 20)
    f_price = ImageFont.truetype(font_impact, 84)
    f_cross = ImageFont.truetype(font_bold, 36)

    # Background ambient radial gradients
    # Top subtle emerald glow
    glow = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    gdraw = ImageDraw.Draw(glow)
    gdraw.ellipse((-200, -200, 700, 700), fill=(16, 185, 129, 35))
    gdraw.ellipse((width - 500, height - 700, width + 300, height + 100), fill=(6, 182, 212, 35))
    glow = glow.filter(ImageFilter.GaussianBlur(80))
    im = Image.alpha_composite(im, glow)
    draw = ImageDraw.Draw(im)

    # 1. Top Bar / Brand Badge
    y = 80
    badge_text = "⚡ 2027 OFFICIAL INDUSTRIAL NOTES · RTECHLAB"
    draw.rounded_rectangle((width//2 - 320, y, width//2 + 320, y + 46), radius=23, fill=(16, 185, 129, 30), outline=(16, 185, 129, 140), width=2)
    draw.text((width//2, y + 23), badge_text, font=f_small, fill=(52, 211, 153), anchor="mm")

    # 2. Main Hook Headline
    y = 170
    draw.text((width//2, y), "THESE 4 DIGITAL NOTES CAN", font=f_title, fill=(255, 255, 255), anchor="mm")
    y += 75
    draw.text((width//2, y), "FAST-TRACK YOUR IT CAREER!", font=f_title, fill=(52, 211, 153), anchor="mm")

    y += 65
    hook_desc = "Stop wasting time on 500-page outdated college textbooks."
    draw.text((width//2, y), hook_desc, font=f_sub, fill=(161, 161, 170), anchor="mm")

    # 3. Avatar of Rahul Patel with Glowing Frame
    y = 480
    avatar_size = 230
    avatar = create_circular_avatar("public/brand/rahul-patel.jpg", avatar_size)
    avatar_x = width // 2 - avatar_size // 2
    avatar_y = y - avatar_size // 2
    
    # Outer glow
    add_glow_circle(draw, width//2, y, avatar_size//2, (16, 185, 129, 255), glow_width=16)
    im.paste(avatar, (avatar_x, avatar_y), avatar)
    draw = ImageDraw.Draw(im)

    # Author tag below photo
    y = 620
    draw.rounded_rectangle((width//2 - 210, y, width//2 + 210, y + 40), radius=20, fill=(0, 0, 0, 180), outline=(255, 255, 255, 50), width=1)
    draw.text((width//2, y + 20), "Rahul Patel · Industrial Engineer & Author", font=f_small, fill=(229, 231, 235), anchor="mm")

    # 4. 4 Notes Showcase Cards
    tracks = [
        {"code": "#1", "name": "Artificial Intelligence Mastery", "desc": "Deep Learning, LLMs, Prompt Eng & Autonomous AI", "pages": "44 Pages Core Guide", "color": (168, 85, 247), "accent": "🔥 MOST POPULAR"},
        {"code": "#2", "name": "Microsoft Office 365 Enterprise", "desc": "Word, Advanced Excel XLOOKUP, Dynamic Arrays & MIS", "pages": "113 Pages Core Guide", "color": (59, 130, 246), "accent": "⚡ PLACEMENT READY"},
        {"code": "#3", "name": "Computer Fundamentals & Arch", "desc": "Silicon Architecture, Memory Hierarchy & Hardware Triage", "pages": "45 Pages Core Guide", "color": (16, 185, 129), "accent": "💻 CORE FOUNDATION"},
        {"code": "#4", "name": "Cisco CCNA 200-301 Master", "desc": "Enterprise Switching, OSPF Routing & Cisco IOS TAC", "pages": "49 Pages Core Guide", "color": (6, 182, 212), "accent": "🌐 CISCO TAC STANDARD"},
    ]

    card_y = 700
    for t in tracks:
        # Card Background
        draw.rounded_rectangle((80, card_y, width - 80, card_y + 160), radius=22, fill=(18, 18, 24, 230), outline=(255, 255, 255, 30), width=1)
        
        # Track badge left
        draw.rounded_rectangle((105, card_y + 20, 155, card_y + 55), radius=10, fill=(t["color"][0], t["color"][1], t["color"][2], 40), outline=t["color"], width=1)
        draw.text((130, card_y + 37), t["code"], font=f_small, fill=t["color"], anchor="mm")

        # Track name
        draw.text((175, card_y + 37), t["name"], font=f_body, fill=(255, 255, 255), anchor="lm")

        # Right Pill tag
        draw.text((width - 110, card_y + 37), t["accent"], font=f_small, fill=t["color"], anchor="rm")

        # Description
        draw.text((110, card_y + 85), t["desc"], font=f_small, fill=(161, 161, 170), anchor="lm")

        # Page count tag
        draw.rounded_rectangle((105, card_y + 115, 330, card_y + 145), radius=8, fill=(255, 255, 255, 15), outline=(255, 255, 255, 30), width=1)
        draw.text((217, card_y + 130), f"📄 {t['pages']}", font=f_small, fill=(209, 213, 219), anchor="mm")

        card_y += 180

    # 5. Pricing Callout Box
    y = 1450
    draw.rounded_rectangle((80, y, width - 80, y + 210), radius=28, fill=(12, 24, 20, 240), outline=(16, 185, 129, 180), width=3)
    
    draw.text((width//2, y + 40), "SPECIAL STUDENT LAUNCH OFFER", font=f_small, fill=(52, 211, 153), anchor="mm")
    
    # Prices
    price_y = y + 105
    draw.text((width//2 - 130, price_y), "₹199", font=f_cross, fill=(248, 113, 113), anchor="mm")
    # Red strikethrough line
    draw.line((width//2 - 180, price_y, width//2 - 80, price_y), fill=(239, 68, 68), width=4)

    draw.text((width//2 + 40, price_y), "ONLY ₹49", font=f_price, fill=(255, 255, 255), anchor="mm")

    draw.text((width//2, y + 175), "⚡ 1-Click Instant Download · Both English & Hindi Available", font=f_small, fill=(167, 243, 208), anchor="mm")

    # 6. Bottom Call To Action (CTA)
    y = 1710
    draw.rounded_rectangle((100, y, width - 100, y + 110), radius=35, fill=(16, 185, 129), outline=(52, 211, 153), width=2)
    draw.text((width//2, y + 55), "👉 GET NOTES: rtechlab.vercel.app/notes", font=f_sub, fill=(0, 0, 0), anchor="mm")

    draw.text((width//2, 1860), "Official Instagram: @rtechlabofficial · Link In Bio", font=f_small, fill=(156, 163, 175), anchor="mm")

    # Save
    out_path = "public/brand/promo_reel_story_49.png"
    im.save(out_path, quality=95)
    print("Saved:", out_path)

def generate_feed_portrait_1080x1350():
    width, height = 1080, 1350
    im = Image.new("RGBA", (width, height), (10, 10, 14, 255))
    draw = ImageDraw.Draw(im)

    font_bold = "C:/Windows/Fonts/segoeuib.ttf"
    font_impact = "C:/Windows/Fonts/impact.ttf"
    font_regular = "C:/Windows/Fonts/segoeui.ttf"

    f_title = ImageFont.truetype(font_impact, 56)
    f_sub = ImageFont.truetype(font_bold, 26)
    f_body = ImageFont.truetype(font_bold, 22)
    f_small = ImageFont.truetype(font_bold, 18)
    f_price = ImageFont.truetype(font_impact, 72)
    f_cross = ImageFont.truetype(font_bold, 30)

    # Ambient glow
    glow = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    gdraw = ImageDraw.Draw(glow)
    gdraw.ellipse((-150, -150, 500, 500), fill=(16, 185, 129, 35))
    gdraw.ellipse((width - 400, height - 500, width + 200, height + 100), fill=(6, 182, 212, 35))
    glow = glow.filter(ImageFilter.GaussianBlur(70))
    im = Image.alpha_composite(im, glow)
    draw = ImageDraw.Draw(im)

    # Top Brand Badge
    y = 50
    badge_text = "⚡ 2027 OFFICIAL INDUSTRIAL NOTES · RTECHLAB"
    draw.rounded_rectangle((width//2 - 280, y, width//2 + 280, y + 40), radius=20, fill=(16, 185, 129, 30), outline=(16, 185, 129, 140), width=2)
    draw.text((width//2, y + 20), badge_text, font=f_small, fill=(52, 211, 153), anchor="mm")

    # Headline
    y = 125
    draw.text((width//2, y), "THESE 4 DIGITAL NOTES CAN", font=f_title, fill=(255, 255, 255), anchor="mm")
    y += 65
    draw.text((width//2, y), "CHANGE YOUR IT CAREER!", font=f_title, fill=(52, 211, 153), anchor="mm")

    # Photo & Author Row
    y = 230
    avatar_size = 130
    avatar = create_circular_avatar("public/brand/rahul-patel.jpg", avatar_size)
    avatar_x = 100
    avatar_y = y
    add_glow_circle(draw, avatar_x + avatar_size//2, avatar_y + avatar_size//2, avatar_size//2, (16, 185, 129, 255), glow_width=10)
    im.paste(avatar, (avatar_x, avatar_y), avatar)
    draw = ImageDraw.Draw(im)

    draw.text((260, y + 35), "Rahul Patel", font=f_sub, fill=(255, 255, 255), anchor="lm")
    draw.text((260, y + 70), "Author & Industrial Engineer · RTechLab Founder", font=f_small, fill=(161, 161, 170), anchor="lm")
    draw.text((260, y + 100), "⭐ Verified Research · 100% Placement & Exam Ready", font=f_small, fill=(52, 211, 153), anchor="lm")

    # 4 Tracks Grid
    tracks = [
        {"code": "#1 AI", "name": "Artificial Intelligence", "desc": "Neural Nets, LLMs, Prompt Eng & Autonomous AI", "pages": "44p Core Guide", "color": (168, 85, 247)},
        {"code": "#2 MIS", "name": "Office 365 Enterprise", "desc": "Adv Excel XLOOKUP, Arrays, Word, PPT & MIS", "pages": "113p Core Guide", "color": (59, 130, 246)},
        {"code": "#3 ARCH", "name": "Computer Fundamentals", "desc": "Silicon Architecture, CPU Cycle & Diagnostics", "pages": "45p Core Guide", "color": (16, 185, 129)},
        {"code": "#4 NET", "name": "Cisco CCNA 200-301", "desc": "Enterprise Switching, OSPF & Cisco TAC Standard", "pages": "49p Core Guide", "color": (6, 182, 212)},
    ]

    card_y = 390
    for t in tracks:
        draw.rounded_rectangle((80, card_y, width - 80, card_y + 115), radius=18, fill=(18, 18, 24, 230), outline=(255, 255, 255, 25), width=1)
        
        # Badge
        draw.rounded_rectangle((100, card_y + 16, 195, card_y + 48), radius=8, fill=(t["color"][0], t["color"][1], t["color"][2], 40), outline=t["color"], width=1)
        draw.text((147, card_y + 32), t["code"], font=f_small, fill=t["color"], anchor="mm")

        draw.text((215, card_y + 32), t["name"], font=f_body, fill=(255, 255, 255), anchor="lm")
        draw.text((width - 105, card_y + 32), f"📄 {t['pages']}", font=f_small, fill=(209, 213, 219), anchor="rm")

        draw.text((105, card_y + 78), t["desc"], font=f_small, fill=(161, 161, 170), anchor="lm")
        card_y += 135

    # Pricing Box
    y = 960
    draw.rounded_rectangle((80, y, width - 80, y + 175), radius=24, fill=(12, 24, 20, 240), outline=(16, 185, 129, 180), width=2)
    
    draw.text((width//2, y + 32), "STUDENT EXCLUSIVE LAUNCH OFFER", font=f_small, fill=(52, 211, 153), anchor="mm")
    
    price_y = y + 85
    draw.text((width//2 - 120, price_y), "₹199", font=f_cross, fill=(248, 113, 113), anchor="mm")
    draw.line((width//2 - 165, price_y, width//2 - 75, price_y), fill=(239, 68, 68), width=3)

    draw.text((width//2 + 35, price_y), "ONLY ₹49", font=f_price, fill=(255, 255, 255), anchor="mm")

    draw.text((width//2, y + 140), "⚡ Instant Offline PDF Download · English & Hindi Available", font=f_small, fill=(167, 243, 208), anchor="mm")

    # Bottom CTA
    y = 1175
    draw.rounded_rectangle((80, y, width - 80, y + 90), radius=25, fill=(16, 185, 129), outline=(52, 211, 153), width=2)
    draw.text((width//2, y + 45), "👉 LINK IN BIO: rtechlab.vercel.app/notes", font=f_sub, fill=(0, 0, 0), anchor="mm")

    draw.text((width//2, 1300), "@rtechlabofficial · DM or WhatsApp for Quick Access", font=f_small, fill=(156, 163, 175), anchor="mm")

    out_path = "public/brand/promo_feed_portrait_49.png"
    im.save(out_path, quality=95)
    print("Saved:", out_path)

def generate_feed_square_1080x1080():
    width, height = 1080, 1080
    im = Image.new("RGBA", (width, height), (10, 10, 14, 255))
    draw = ImageDraw.Draw(im)

    font_bold = "C:/Windows/Fonts/segoeuib.ttf"
    font_impact = "C:/Windows/Fonts/impact.ttf"

    f_title = ImageFont.truetype(font_impact, 50)
    f_sub = ImageFont.truetype(font_bold, 24)
    f_body = ImageFont.truetype(font_bold, 20)
    f_small = ImageFont.truetype(font_bold, 17)
    f_price = ImageFont.truetype(font_impact, 64)
    f_cross = ImageFont.truetype(font_bold, 28)

    # Ambient glow
    glow = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    gdraw = ImageDraw.Draw(glow)
    gdraw.ellipse((-150, -150, 450, 450), fill=(16, 185, 129, 35))
    gdraw.ellipse((width - 400, height - 400, width + 150, height + 100), fill=(6, 182, 212, 35))
    glow = glow.filter(ImageFilter.GaussianBlur(60))
    im = Image.alpha_composite(im, glow)
    draw = ImageDraw.Draw(im)

    # Top Brand
    y = 40
    badge_text = "⚡ 2027 OFFICIAL DIGITAL NOTES · RTECHLAB"
    draw.rounded_rectangle((width//2 - 250, y, width//2 + 250, y + 36), radius=18, fill=(16, 185, 129, 30), outline=(16, 185, 129, 140), width=1)
    draw.text((width//2, y + 18), badge_text, font=f_small, fill=(52, 211, 153), anchor="mm")

    # Title
    y = 105
    draw.text((width//2, y), "THESE 4 NOTES CAN CHANGE YOUR IT CAREER!", font=f_title, fill=(255, 255, 255), anchor="mm")

    # Photo & Bio
    y = 175
    avatar_size = 110
    avatar = create_circular_avatar("public/brand/rahul-patel.jpg", avatar_size)
    avatar_x = 80
    avatar_y = y
    add_glow_circle(draw, avatar_x + avatar_size//2, avatar_y + avatar_size//2, avatar_size//2, (16, 185, 129, 255), glow_width=8)
    im.paste(avatar, (avatar_x, avatar_y), avatar)
    draw = ImageDraw.Draw(im)

    draw.text((220, y + 25), "Rahul Patel · Industrial Engineer", font=f_sub, fill=(255, 255, 255), anchor="lm")
    draw.text((220, y + 60), "Stop wasting time memorizing 500-page outdated textbooks.", font=f_small, fill=(161, 161, 170), anchor="lm")
    draw.text((220, y + 85), "Master theory + placement with research-verified handbooks.", font=f_small, fill=(52, 211, 153), anchor="lm")

    # 4 Tracks 2x2 Grid
    tracks = [
        {"name": "AI Mastery (44p)", "desc": "LLMs, Prompt Eng & Agents", "color": (168, 85, 247)},
        {"name": "Office 365 (113p)", "desc": "Adv Excel, Arrays & MIS", "color": (59, 130, 246)},
        {"name": "Fundamentals (45p)", "desc": "Silicon Arch & Hardware", "color": (16, 185, 129)},
        {"name": "CCNA 200-301 (49p)", "desc": "Switching, OSPF & Cisco TAC", "color": (6, 182, 212)},
    ]

    coords = [
        (80, 315, 520, 420),
        (560, 315, 1000, 420),
        (80, 440, 520, 545),
        (560, 440, 1000, 545),
    ]

    for t, (x1, y1, x2, y2) in zip(tracks, coords):
        draw.rounded_rectangle((x1, y1, x2, y2), radius=16, fill=(18, 18, 24, 230), outline=(255, 255, 255, 25), width=1)
        draw.rounded_rectangle((x1 + 15, y1 + 15, x1 + 25, y2 - 15), radius=5, fill=t["color"])
        draw.text((x1 + 40, y1 + 35), t["name"], font=f_body, fill=(255, 255, 255), anchor="lm")
        draw.text((x1 + 40, y1 + 72), t["desc"], font=f_small, fill=(161, 161, 170), anchor="lm")

    # Price box
    y = 580
    draw.rounded_rectangle((80, y, width - 80, y + 160), radius=22, fill=(12, 24, 20, 240), outline=(16, 185, 129, 180), width=2)
    draw.text((width//2, y + 28), "STUDENT EXCLUSIVE LAUNCH OFFER", font=f_small, fill=(52, 211, 153), anchor="mm")

    price_y = y + 80
    draw.text((width//2 - 110, price_y), "₹199", font=f_cross, fill=(248, 113, 113), anchor="mm")
    draw.line((width//2 - 150, price_y, width//2 - 70, price_y), fill=(239, 68, 68), width=3)

    draw.text((width//2 + 30, price_y), "ONLY ₹49", font=f_price, fill=(255, 255, 255), anchor="mm")
    draw.text((width//2, y + 130), "⚡ 1-Click Instant Download · English & Hindi Editions", font=f_small, fill=(167, 243, 208), anchor="mm")

    # CTA Button
    y = 770
    draw.rounded_rectangle((80, y, width - 80, y + 90), radius=25, fill=(16, 185, 129), outline=(52, 211, 153), width=2)
    draw.text((width//2, y + 45), "👉 LINK IN BIO: rtechlab.vercel.app/notes", font=f_sub, fill=(0, 0, 0), anchor="mm")

    draw.text((width//2, 890), "@rtechlabofficial · 5-Page Free Preview Available", font=f_small, fill=(156, 163, 175), anchor="mm")

    out_path = "public/brand/promo_feed_square_49.png"
    im.save(out_path, quality=95)
    print("Saved:", out_path)

if __name__ == "__main__":
    generate_story_1080x1920()
    generate_feed_portrait_1080x1350()
    generate_feed_square_1080x1080()
