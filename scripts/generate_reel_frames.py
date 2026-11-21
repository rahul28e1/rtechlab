import os
import subprocess
from PIL import Image, ImageDraw, ImageFont, ImageFilter

def create_circular_avatar(image_path, size):
    img = Image.open(image_path).convert("RGBA")
    min_dim = min(img.size)
    left = (img.width - min_dim) // 2
    top = (img.height - min_dim) // 4
    img = img.crop((left, top, left + min_dim, top + min_dim))
    img = img.resize((size, size), Image.Resampling.LANCZOS)
    
    mask = Image.new('L', (size, size), 0)
    draw = ImageDraw.Draw(mask)
    draw.ellipse((0, 0, size, size), fill=255)
    
    output = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    output.paste(img, (0, 0), mask=mask)
    return output

def add_glow_circle(draw, center_x, center_y, radius, color, glow_width=14):
    for i in range(glow_width, 0, -2):
        alpha = int(70 * (1 - i / glow_width))
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

def create_base_canvas(width=1080, height=1920):
    im = Image.new("RGBA", (width, height), (10, 10, 14, 255))
    glow = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    gdraw = ImageDraw.Draw(glow)
    gdraw.ellipse((-200, -200, 700, 700), fill=(16, 185, 129, 30))
    gdraw.ellipse((width - 500, height - 700, width + 300, height + 100), fill=(6, 182, 212, 30))
    glow = glow.filter(ImageFilter.GaussianBlur(80))
    im = Image.alpha_composite(im, glow)
    return im

def render_scenes():
    os.makedirs("public/brand/reel_scenes", exist_ok=True)
    width, height = 1080, 1920

    font_bold = "C:/Windows/Fonts/segoeuib.ttf"
    font_impact = "C:/Windows/Fonts/impact.ttf"
    font_regular = "C:/Windows/Fonts/segoeui.ttf"

    f_hero = ImageFont.truetype(font_impact, 68)
    f_title = ImageFont.truetype(font_impact, 54)
    f_sub = ImageFont.truetype(font_bold, 32)
    f_body = ImageFont.truetype(font_bold, 26)
    f_small = ImageFont.truetype(font_bold, 22)
    f_price = ImageFont.truetype(font_impact, 92)
    f_cross = ImageFont.truetype(font_bold, 40)

    # ─────────────────────────────────────────────────────────────
    # SCENE 1: HOOK (0s - 11s)
    # ─────────────────────────────────────────────────────────────
    im1 = create_base_canvas(width, height)
    draw1 = ImageDraw.Draw(im1)

    # Top Brand Pill
    draw1.rounded_rectangle((width//2 - 290, 100, width//2 + 290, 150), radius=25, fill=(239, 68, 68, 30), outline=(239, 68, 68, 180), width=2)
    draw1.text((width//2, 125), "⚠️ CRITICAL WARNING FOR IT STUDENTS", font=f_small, fill=(248, 113, 113), anchor="mm")

    # Big Hook Text
    draw1.text((width//2, 230), "STOP WASTING TIME ON", font=f_hero, fill=(255, 255, 255), anchor="mm")
    draw1.text((width//2, 315), "500-PAGE TEXTBOOKS!", font=f_hero, fill=(239, 68, 68), anchor="mm")
    draw1.text((width//2, 395), "BCA · B.TECH · POLYTECHNIC · IT ASPIRANTS", font=f_small, fill=(161, 161, 170), anchor="mm")

    # Presenter Photo
    avatar = create_circular_avatar("public/brand/rahul-patel.jpg", 320)
    add_glow_circle(draw1, width//2, 680, 160, (16, 185, 129, 255), glow_width=20)
    im1.paste(avatar, (width//2 - 160, 520), avatar)
    draw1 = ImageDraw.Draw(im1)

    # Author Card
    draw1.rounded_rectangle((width//2 - 250, 880, width//2 + 250, 940), radius=25, fill=(0, 0, 0, 200), outline=(255, 255, 255, 60), width=1)
    draw1.text((width//2, 910), "Rahul Patel · Industrial Engineer & Author", font=f_small, fill=(255, 255, 255), anchor="mm")

    # Reality punchline box
    draw1.rounded_rectangle((100, 1030, width - 100, 1350), radius=28, fill=(18, 18, 24, 240), outline=(255, 255, 255, 30), width=1)
    draw1.text((width//2, 1100), "College Exams ≠ MNC Job Ready", font=f_sub, fill=(251, 191, 36), anchor="mm")
    draw1.text((width//2, 1170), "Rote-memorizing theory won't help you crack", font=f_body, fill=(209, 213, 219), anchor="mm")
    draw1.text((width//2, 1220), "TCS, Infosys, Cisco or Startup Technical Rounds!", font=f_body, fill=(52, 211, 153), anchor="mm")
    draw1.text((width//2, 1280), "Interviewers demand real-world architectural clarity.", font=f_small, fill=(156, 163, 175), anchor="mm")

    # Bottom Pill
    draw1.rounded_rectangle((width//2 - 240, 1700, width//2 + 240, 1760), radius=30, fill=(16, 185, 129, 20), outline=(16, 185, 129, 120), width=1)
    draw1.text((width//2, 1730), "RTechLab 2027 Official Blueprint", font=f_small, fill=(52, 211, 153), anchor="mm")

    im1.save("public/brand/reel_scenes/scene1.png", quality=95)

    # ─────────────────────────────────────────────────────────────
    # SCENE 2: THE REALITY & NEED (11s - 21s)
    # ─────────────────────────────────────────────────────────────
    im2 = create_base_canvas(width, height)
    draw2 = ImageDraw.Draw(im2)

    draw2.rounded_rectangle((width//2 - 270, 100, width//2 + 270, 150), radius=25, fill=(59, 130, 246, 30), outline=(59, 130, 246, 180), width=2)
    draw2.text((width//2, 125), "🎯 THE CORPORATE PLACEMENT REALITY", font=f_small, fill=(96, 165, 250), anchor="mm")

    draw2.text((width//2, 230), "WHAT DO TOP MNCs", font=f_hero, fill=(255, 255, 255), anchor="mm")
    draw2.text((width//2, 315), "ACTUALLY TEST IN 2027?", font=f_hero, fill=(52, 211, 153), anchor="mm")

    # Comparison Grid
    # Box 1: What College Teaches
    draw2.rounded_rectangle((90, 440, width - 90, 720), radius=26, fill=(239, 68, 68, 15), outline=(239, 68, 68, 100), width=2)
    draw2.text((130, 490), "❌ Outdated College Syllabus", font=f_sub, fill=(248, 113, 113), anchor="lm")
    draw2.text((130, 560), "• 800 pages of theoretical definitions & PPTs", font=f_body, fill=(229, 231, 235), anchor="lm")
    draw2.text((130, 615), "• Zero production network topology insight", font=f_body, fill=(229, 231, 235), anchor="lm")
    draw2.text((130, 670), "• Students stuck in low ₹2.5L–₹3.2L CTC offers", font=f_body, fill=(248, 113, 113), anchor="lm")

    # Box 2: What RTechLab Delivers
    draw2.rounded_rectangle((90, 770, width - 90, 1070), radius=26, fill=(16, 185, 129, 20), outline=(16, 185, 129, 160), width=2)
    draw2.text((130, 820), "✅ 2027 RTechLab Industrial Notes", font=f_sub, fill=(52, 211, 153), anchor="lm")
    draw2.text((130, 890), "• High-resolution vector silicon architectures", font=f_body, fill=(255, 255, 255), anchor="lm")
    draw2.text((130, 945), "• Real MNC technical troubleshooting & labs", font=f_body, fill=(255, 255, 255), anchor="lm")
    draw2.text((130, 1000), "• Fast-track to ₹5L to ₹12L+ CTC Career Bands", font=f_body, fill=(52, 211, 153), anchor="lm")

    # Quote Box
    draw2.rounded_rectangle((100, 1150, width - 100, 1420), radius=24, fill=(18, 18, 24, 240), outline=(255, 255, 255, 30), width=1)
    draw2.text((width//2, 1210), "💡 \"Don't read more. Read what counts.\"", font=f_sub, fill=(255, 255, 255), anchor="mm")
    draw2.text((width//2, 1280), "Prepared by Industrial Engineers with verified RFCs &", font=f_small, fill=(161, 161, 170), anchor="mm")
    draw2.text((width//2, 1330), "senior engineer interview solutions.", font=f_small, fill=(161, 161, 170), anchor="mm")

    draw2.rounded_rectangle((width//2 - 240, 1700, width//2 + 240, 1760), radius=30, fill=(16, 185, 129, 20), outline=(16, 185, 129, 120), width=1)
    draw2.text((width//2, 1730), "Introducing 4 Official Handbooks", font=f_small, fill=(52, 211, 153), anchor="mm")

    im2.save("public/brand/reel_scenes/scene2.png", quality=95)

    # ─────────────────────────────────────────────────────────────
    # SCENE 3: THE 4 NOTES SHOWCASE (21s - 46s)
    # ─────────────────────────────────────────────────────────────
    im3 = create_base_canvas(width, height)
    draw3 = ImageDraw.Draw(im3)

    draw3.rounded_rectangle((width//2 - 280, 90, width//2 + 280, 140), radius=25, fill=(16, 185, 129, 30), outline=(16, 185, 129, 180), width=2)
    draw3.text((width//2, 115), "⚡ 4 OFFICIAL INDUSTRY CAREER TRACKS", font=f_small, fill=(52, 211, 153), anchor="mm")

    draw3.text((width//2, 200), "CHOOSE YOUR DOMAIN", font=f_hero, fill=(255, 255, 255), anchor="mm")
    draw3.text((width//2, 275), "MASTER IN DAYS, NOT MONTHS!", font=f_hero, fill=(52, 211, 153), anchor="mm")

    tracks = [
        {"code": "#1", "name": "Artificial Intelligence", "desc": "Deep Learning, LLMs, Prompt Eng & Autonomous AI", "pages": "44p Core Guide", "color": (168, 85, 247), "badge": "🔥 MOST POPULAR"},
        {"code": "#2", "name": "Microsoft Office 365", "desc": "Adv Excel XLOOKUP, Dynamic Arrays, Word & MIS", "pages": "113p Core Guide", "color": (59, 130, 246), "badge": "⚡ PLACEMENT READY"},
        {"code": "#3", "name": "Computer Fundamentals", "desc": "Silicon Architecture, Memory Hierarchy & CPU Cycle", "pages": "45p Core Guide", "color": (16, 185, 129), "badge": "💻 CORE FOUNDATION"},
        {"code": "#4", "name": "Cisco CCNA 200-301", "desc": "Enterprise Switching, OSPF Routing & Cisco TAC", "pages": "49p Core Guide", "color": (6, 182, 212), "badge": "🌐 CISCO TAC STANDARD"},
    ]

    card_y = 350
    for t in tracks:
        draw3.rounded_rectangle((80, card_y, width - 80, card_y + 195), radius=22, fill=(18, 18, 24, 240), outline=(255, 255, 255, 40), width=1)
        
        # Track Code Badge
        draw3.rounded_rectangle((105, card_y + 20, 160, card_y + 60), radius=10, fill=(t["color"][0], t["color"][1], t["color"][2], 50), outline=t["color"], width=1)
        draw3.text((132, card_y + 40), t["code"], font=f_small, fill=t["color"], anchor="mm")

        # Name
        draw3.text((180, card_y + 40), t["name"], font=f_sub, fill=(255, 255, 255), anchor="lm")
        # Pill
        draw3.text((width - 110, card_y + 40), t["badge"], font=f_small, fill=t["color"], anchor="rm")

        # Description
        draw3.text((110, card_y + 95), t["desc"], font=f_body, fill=(161, 161, 170), anchor="lm")

        # Page Count Tag
        draw3.rounded_rectangle((105, card_y + 135, 330, card_y + 175), radius=10, fill=(255, 255, 255, 20), outline=(255, 255, 255, 40), width=1)
        draw3.text((217, card_y + 155), f"📄 {t['pages']}", font=f_small, fill=(255, 255, 255), anchor="mm")

        card_y += 225

    # Footer note
    draw3.text((width//2, 1310), "Both English & Hindi Editions Available Inside!", font=f_sub, fill=(251, 191, 36), anchor="mm")

    draw3.rounded_rectangle((width//2 - 240, 1700, width//2 + 240, 1760), radius=30, fill=(16, 185, 129, 20), outline=(16, 185, 129, 120), width=1)
    draw3.text((width//2, 1730), "Research-Verified Architecture", font=f_small, fill=(52, 211, 153), anchor="mm")

    im3.save("public/brand/reel_scenes/scene3.png", quality=95)

    # ─────────────────────────────────────────────────────────────
    # SCENE 4: QUALITY & SOCIAL PROOF (46s - 55s)
    # ─────────────────────────────────────────────────────────────
    im4 = create_base_canvas(width, height)
    draw4 = ImageDraw.Draw(im4)

    draw4.rounded_rectangle((width//2 - 270, 100, width//2 + 270, 150), radius=25, fill=(168, 85, 247, 30), outline=(168, 85, 247, 180), width=2)
    draw4.text((width//2, 125), "⭐ VERIFIED BY 2,400+ STUDENTS", font=f_small, fill=(192, 132, 252), anchor="mm")

    draw4.text((width//2, 220), "ENGINEERING EXCELLENCE", font=f_hero, fill=(255, 255, 255), anchor="mm")
    draw4.text((width//2, 305), "4.9 / 5.0 RATED QUALITY", font=f_hero, fill=(251, 191, 36), anchor="mm")

    # 4 Highlights
    highlights = [
        ("🎨 High-Resolution Vector Schematics", "Crystal clear pinouts, memory maps & packet routing"),
        ("🇮🇳 English & Hindi Bilingual Editions", "Learn complex silicon & network logic in your language"),
        ("⚡ 1-Click Instant Offline PDF", "Download directly to your mobile or laptop without locks"),
        ("🏢 Real MNC Interview Alignment", "Questions & scenarios asked by TCS, Infosys, Cisco & Wipro"),
    ]

    hy = 420
    for title, desc in highlights:
        draw4.rounded_rectangle((90, hy, width - 90, hy + 145), radius=20, fill=(18, 18, 24, 240), outline=(255, 255, 255, 30), width=1)
        draw4.text((120, hy + 45), title, font=f_sub, fill=(255, 255, 255), anchor="lm")
        draw4.text((120, hy + 95), desc, font=f_small, fill=(161, 161, 170), anchor="lm")
        hy += 175

    # Testimonial Snippet
    draw4.rounded_rectangle((90, 1180, width - 90, 1370), radius=22, fill=(16, 185, 129, 15), outline=(16, 185, 129, 100), width=1)
    draw4.text((width//2, 1230), "⭐⭐⭐⭐⭐ \"CCNA TAC Vault matched my TCS Digital round!\"", font=f_sub, fill=(52, 211, 153), anchor="mm")
    draw4.text((width//2, 1300), "— Aman Sharma (Placed at TCS Digital, ₹7.5 LPA)", font=f_small, fill=(229, 231, 235), anchor="mm")

    draw4.rounded_rectangle((width//2 - 240, 1700, width//2 + 240, 1760), radius=30, fill=(16, 185, 129, 20), outline=(16, 185, 129, 120), width=1)
    draw4.text((width//2, 1730), "Special Launch Offer Next", font=f_small, fill=(52, 211, 153), anchor="mm")

    im4.save("public/brand/reel_scenes/scene4.png", quality=95)

    # ─────────────────────────────────────────────────────────────
    # SCENE 5: OFFER & CALL TO ACTION (55s - 67.5s)
    # ─────────────────────────────────────────────────────────────
    im5 = create_base_canvas(width, height)
    draw5 = ImageDraw.Draw(im5)

    draw5.rounded_rectangle((width//2 - 280, 100, width//2 + 280, 150), radius=25, fill=(16, 185, 129, 30), outline=(16, 185, 129, 180), width=2)
    draw5.text((width//2, 125), "🔥 LIMITED STUDENT LAUNCH PASS", font=f_small, fill=(52, 211, 153), anchor="mm")

    draw5.text((width//2, 220), "INVEST IN YOUR FUTURE", font=f_hero, fill=(255, 255, 255), anchor="mm")
    draw5.text((width//2, 305), "AT LESS THAN A PIZZA!", font=f_hero, fill=(52, 211, 153), anchor="mm")

    # Big Offer Box
    draw5.rounded_rectangle((80, 420, width - 80, 850), radius=32, fill=(12, 24, 20, 245), outline=(16, 185, 129, 200), width=3)
    
    draw5.text((width//2, 480), "SPECIAL INTRODUCTORY PRICE", font=f_small, fill=(52, 211, 153), anchor="mm")
    
    # Crossed price & main price
    draw5.text((width//2 - 160, 590), "₹199", font=f_cross, fill=(248, 113, 113), anchor="mm")
    draw5.line((width//2 - 215, 590, width//2 - 105, 590), fill=(239, 68, 68), width=5)

    draw5.text((width//2 + 70, 590), "ONLY ₹49", font=f_price, fill=(255, 255, 255), anchor="mm")
    
    draw5.rounded_rectangle((width//2 - 150, 680, width//2 + 150, 725), radius=15, fill=(16, 185, 129, 40), outline=(16, 185, 129, 140), width=1)
    draw5.text((width//2, 702), "75% OFF · LIMITED PASS", font=f_small, fill=(52, 211, 153), anchor="mm")

    draw5.text((width//2, 790), "⚡ Instant Download on UPI / Cards · 100% Secure", font=f_small, fill=(167, 243, 208), anchor="mm")

    # CTA Button
    draw5.rounded_rectangle((90, 930, width - 90, 1070), radius=35, fill=(16, 185, 129), outline=(52, 211, 153), width=2)
    draw5.text((width//2, 980), "👉 LINK IN BIO", font=f_hero, fill=(0, 0, 0), anchor="mm")
    draw5.text((width//2, 1030), "rtechlab.vercel.app/notes", font=f_sub, fill=(0, 0, 0), anchor="mm")

    # Free Preview Reminder
    draw5.rounded_rectangle((100, 1140, width - 100, 1340), radius=24, fill=(18, 18, 24, 240), outline=(255, 255, 255, 30), width=1)
    draw5.text((width//2, 1190), "📖 5-PAGE FREE PREVIEW AVAILABLE", font=f_sub, fill=(251, 191, 36), anchor="mm")
    draw5.text((width//2, 1245), "Read real pages in our 3D interactive viewer", font=f_small, fill=(209, 213, 219), anchor="mm")
    draw5.text((width//2, 1290), "before you choose to buy!", font=f_small, fill=(52, 211, 153), anchor="mm")

    # Instagram handle
    draw5.text((width//2, 1450), "Official Instagram: @rtechlabofficial", font=f_sub, fill=(255, 255, 255), anchor="mm")

    draw5.rounded_rectangle((width//2 - 240, 1700, width//2 + 240, 1760), radius=30, fill=(16, 185, 129, 20), outline=(16, 185, 129, 120), width=1)
    draw5.text((width//2, 1730), "Download Your Copy Today!", font=f_small, fill=(52, 211, 153), anchor="mm")

    im5.save("public/brand/reel_scenes/scene5.png", quality=95)
    print("All 5 Reel Scene Frames generated successfully!")

if __name__ == "__main__":
    render_scenes()
