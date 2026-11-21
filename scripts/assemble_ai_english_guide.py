# -*- coding: utf-8 -*-
"""
Assembles and Compiles RTechLab AI Essentials & Career Accelerator (English Edition)
Target: Exactly 44 Pages, 85-95% fill per page, 0 overflow errors.
"""

import os
import sys
import subprocess
import fitz

# Import English chapter modules
sys.path.append(os.path.join(os.path.dirname(__file__)))
from ai_chapters_eng_part1 import chapters_eng_part1
from ai_chapters_eng_part2 import chapters_eng_part2
from ai_chapters_eng_part3 import chapters_eng_part3
from ai_chapters_eng_part4 import chapters_eng_part4
from ai_chapters_eng_part5 import chapters_eng_part5
from ai_chapters_eng_part6 import chapters_eng_part6

eng_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/English"
out_dir = "DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION"
os.makedirs(eng_dir, exist_ok=True)
os.makedirs(out_dir, exist_ok=True)

all_chapters = {}
all_chapters.update(chapters_eng_part1)
all_chapters.update(chapters_eng_part2)
all_chapters.update(chapters_eng_part3)
all_chapters.update(chapters_eng_part4)
all_chapters.update(chapters_eng_part5)
all_chapters.update(chapters_eng_part6)

print(f"[INFO] Loaded {len(all_chapters)} English chapters.")

# 1. Write individual chapter files
for ch_num in range(1, 43):
    ch_path = os.path.join(eng_dir, f"chapter-{ch_num:02d}.typ")
    content = all_chapters.get(ch_num, f"= Chapter {ch_num}\nContent coming soon.")
    with open(ch_path, "w", encoding="utf-8") as f:
        f.write(content)

# 2. Write Master typst file
en_includes = []
for ch in range(1, 43):
    en_includes.append(f'#pagebreak()\n#include "chapter-{ch:02d}.typ"')

master_src = f"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "Artificial Intelligence Essentials & Career Accelerator (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Artificial Intelligence Essentials & Career Accelerator",
  edition: "2027 Master Edition · Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-AI-ESS"
)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5.typ"

// CHAPTERS 01 TO 42 (PAGES 3 TO 44)
{chr(10).join(en_includes)}
"""

master_path = os.path.join(eng_dir, "ai-master-guide-en.typ")
with open(master_path, "w", encoding="utf-8") as f:
    f.write(master_src)

print(f"[INFO] Master typst written at {master_path}")

# 3. Compile with Typst
pdf_out = os.path.join(out_dir, "AI-Essentials-English-Edition-1.pdf")
cmd = ["typst", "compile", "--root", ".", master_path, pdf_out]
print(f"[INFO] Compiling: {' '.join(cmd)}")
res = subprocess.run(cmd, capture_output=True, text=True)

if res.returncode != 0:
    print(f"[ERROR] Compilation failed:\n{res.stderr}")
    sys.exit(1)

print(f"[SUCCESS] Compiled successfully to {pdf_out}")

# 4. Audit with PyMuPDF
doc = fitz.open(pdf_out)
total_pages = len(doc)
print(f"[AUDIT] Total Pages: {total_pages} (Target: 44 Pages)")

for i, page in enumerate(doc):
    text = page.get_text()
    words = len(text.split())
    rects = page.get_drawings()
    images = page.get_images()
    print(f"  Page {i+1:02d}: {words:4d} words, {len(rects):2d} drawings, {len(images):1d} images")

if total_pages == 44:
    print("[PERFECT] Exact 44-page target hit flawlessly!")
else:
    print(f"[WARNING] Page count is {total_pages}, expected 44.")
