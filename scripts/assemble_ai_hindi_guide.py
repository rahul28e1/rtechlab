# -*- coding: utf-8 -*-
"""
Hindi AI Master Guide Assembler & Compiler
Writes all 42 Hindi chapters, compiles to DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION/AI-Essentials-Hindi-Edition-1.pdf,
and audits page count and density.
"""

import os
import sys
import subprocess
import fitz

sys.path.append(os.path.join(os.path.dirname(__file__)))

from ai_chapters_hi_part1 import chapters_hi_part1
from ai_chapters_hi_part2 import chapters_hi_part2
from ai_chapters_hi_part3 import chapters_hi_part3
from ai_chapters_hi_part4 import chapters_hi_part4
from ai_chapters_hi_part5 import chapters_hi_part5
from ai_chapters_hi_part6 import chapters_hi_part6

hi_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/Hindi"
out_dir = "DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION"

os.makedirs(hi_dir, exist_ok=True)
os.makedirs(out_dir, exist_ok=True)

all_ch_hi = {}
all_ch_hi.update(chapters_hi_part1)
all_ch_hi.update(chapters_hi_part2)
all_ch_hi.update(chapters_hi_part3)
all_ch_hi.update(chapters_hi_part4)
all_ch_hi.update(chapters_hi_part5)
all_ch_hi.update(chapters_hi_part6)

print(f"[INFO] Writing {len(all_ch_hi)} Hindi chapters to {hi_dir}...")
for ch_num, content in all_ch_hi.items():
    ch_path = os.path.join(hi_dir, f"chapter-{ch_num:02d}.typ")
    with open(ch_path, "w", encoding="utf-8") as f:
        f.write(content)

print("[INFO] All 42 Hindi chapters written!")

# Create ai-master-guide-hi.typ
master_hi_content = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5-hi

#set document(
  title: "आर्टिफिशियल इंटेलिजेंस एसेंशियल्स & 2027 करियर मास्टर गाइड (प्रथम संस्करण)",
  author: "राहुल पटेल"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5-hi()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "आर्टिफिशियल इंटेलिजेंस एसेंशियल्स & करियर एक्सेलरेटर",
  edition: "2027 मास्टर एडिशन · प्रामाणिक संस्करण",
  author: "राहुल पटेल",
  subject-code: "RTL-2027-AI-HI"
)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5-hi.typ"

"""

for i in range(1, 43):
    master_hi_content += f"#pagebreak()\n#include \"chapter-{i:02d}.typ\"\n"

with open(os.path.join(hi_dir, "ai-master-guide-hi.typ"), "w", encoding="utf-8") as f:
    f.write(master_hi_content)

print("[INFO] Created ai-master-guide-hi.typ successfully!")

# Ensure master-theme.typ has font support for Devanagari (Nirmala UI)
# Compile
pdf_out = os.path.join(out_dir, "AI-Essentials-Hindi-Edition-1.pdf")
cmd = ["typst", "compile", "--root", ".", os.path.join(hi_dir, "ai-master-guide-hi.typ"), pdf_out]
res = subprocess.run(cmd, capture_output=True, text=True)

if res.returncode != 0:
    print(f"[ERROR] Compilation failed:\n{res.stderr}")
    sys.exit(1)

print(f"[SUCCESS] Compiled successfully to {pdf_out}")

# Audit
doc = fitz.open(pdf_out)
print(f"[AUDIT] Total Pages: {len(doc)} (Target: 44 Pages)")

underfilled = []
overflowed = []
for i in range(2, len(doc)):
    page = doc[i]
    blocks = [b for b in page.get_text('blocks') if b[1] > 40 and b[3] < 800 and 'C E R T I F I E D' not in b[4] and 'RTECHLAB' not in b[4] and 'Technology Made' not in b[4]]
    bottom = max(b[3] for b in blocks) if blocks else 0
    top = min(b[1] for b in blocks) if blocks else 0
    fill = ((bottom - top) / 720.0) * 100
    print(f"  Page {i+1:02d} (Ch {i-1:02d}): bottom={bottom:5.1f} pt, fill={fill:5.1f}%")
    if bottom < 660:
        underfilled.append((i+1, bottom))

if len(doc) == 44:
    print("\n[PERFECT] EXACTLY 44 PAGES MAINTAINED IN HINDI MASTER EDITION!")
else:
    print(f"\n[WARNING] Page count is {len(doc)} (Target: 44)!")

if not underfilled:
    print("[PERFECT] ZERO UNDERFILLED PAGES! Every single page is densely packed!")
else:
    print(f"[INFO] Pages under 660pt: {len(underfilled)} -> {underfilled}")
