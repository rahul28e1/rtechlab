#!/usr/bin/env python3
"""
Create a composite comparison sheet of current website screenshots:
- Desktop Homepage View
- Mobile Homepage View
- Dedicated Tool View
"""

from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

SRC_DIR = Path(r"C:\Users\Rahul\.gemini\antigravity\brain\aa8b9a64-f281-4dd1-bf84-94b54dd00256\audit_screenshots")
OUT_PUB = Path("public/brand/audit_screenshots/audit_visual_comparison_sheet.png")
OUT_BRAIN = SRC_DIR / "audit_visual_comparison_sheet.png"

im_desk = Image.open(SRC_DIR / "current_desktop_homepage.png") # 1280x900
im_mob = Image.open(SRC_DIR / "current_mobile_homepage.png")   # 390x844
im_tool = Image.open(SRC_DIR / "current_desktop_tools.png")     # 1280x900

# Canvas: 1600 x 950
canvas = Image.new("RGB", (1600, 950), (7, 11, 25)) # #070B19
draw = ImageDraw.Draw(canvas)

# Title
draw.text((40, 25), "RTechLab — Current Website Architecture & Visual Baseline", fill=(255, 255, 255))
draw.text((40, 50), "Audit V1 | Desktop View (1280x900), Mobile View (390x844), and Dedicated Tool Experience", fill=(0, 242, 254))

# Resize desktop homepage: 800 x 562
desk_w, desk_h = 800, 562
desk_thumb = im_desk.resize((desk_w, desk_h), Image.Resampling.LANCZOS)
canvas.paste(desk_thumb, (40, 100))
draw.rectangle([40, 100, 40 + desk_w - 1, 100 + desk_h - 1], outline=(30, 41, 59), width=2)
draw.text((40, 80), "Current Desktop Homepage (Hero & Marketing Above the Fold)", fill=(148, 163, 184))

# Resize mobile homepage: 260 x 562
mob_w, mob_h = 260, 562
mob_thumb = im_mob.resize((mob_w, mob_h), Image.Resampling.LANCZOS)
canvas.paste(mob_thumb, (870, 100))
draw.rectangle([870, 100, 870 + mob_w - 1, 100 + mob_h - 1], outline=(30, 41, 59), width=2)
draw.text((870, 80), "Mobile View (390px)", fill=(148, 163, 184))

# Resize desktop tool page: 400 x 281 placed at right or bottom
tool_w, tool_h = 400, 281
tool_thumb = im_tool.resize((tool_w, tool_h), Image.Resampling.LANCZOS)
canvas.paste(tool_thumb, (1160, 100))
draw.rectangle([1160, 100, 1160 + tool_w - 1, 100 + tool_h - 1], outline=(30, 41, 59), width=2)
draw.text((1160, 80), "Dedicated Tool Page (/tools/subnet-calculator)", fill=(148, 163, 184))

# Audit Annotations at bottom
draw.rectangle([40, 690, 1560, 910], fill=(15, 23, 42), outline=(30, 41, 59), width=2)
draw.text((60, 710), "KEY ARCHITECTURAL OBSERVATIONS FOR STRATEGIC REDEFINITION:", fill=(255, 255, 255))
draw.text((60, 740), "1. Homepage currently prioritizes educational branding & simulated topology hero rather than instant daily utility.", fill=(148, 163, 184))
draw.text((60, 765), "2. Free tools are accessed via a single-selection tab row; visitors cannot scan the full spectrum of tools at a glance.", fill=(148, 163, 184))
draw.text((60, 790), "3. Strategic Shift: Transform homepage into a tool-first utility platform (ILovePDF model) with instant search & categorized tool grid.", fill=(0, 242, 254))
draw.text((60, 815), "4. Maintain Rahul Patel's real technical depth: Every tool connects to practical networking labs, CCNA tutorials, and CLI workflows.", fill=(148, 163, 184))
draw.text((60, 840), "5. 100% Client-Side Privacy: No user data leaves the browser, ensuring sub-millisecond execution and $0 server API operating costs.", fill=(52, 211, 153))

canvas.save(OUT_PUB, "PNG")
canvas.save(OUT_BRAIN, "PNG")
print(f"Visual comparison sheet generated: {OUT_BRAIN}")
