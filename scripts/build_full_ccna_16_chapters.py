# -*- coding: utf-8 -*-
"""
RTechLab CCNA 200-301 Master Curriculum — 16 Chapter Complete Publisher
Compiles both English and Hindi master editions with exact 16-chapter parity,
rich topologies, authentic hardware teardowns, and automated watermarking.
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
"""

import os
import sys
import subprocess
import shutil

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
CCNA_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301")
SOURCE_DIR = os.path.join(CCNA_DIR, "07_SOURCE_FILES")
ENG_DIR = os.path.join(SOURCE_DIR, "English")
HI_DIR = os.path.join(SOURCE_DIR, "Hindi")
CORE_OUT = os.path.join(CCNA_DIR, "01_CORE_MASTER_EDITION")
DOWNLOADS_DIR = os.path.join(BASE_DIR, "public", "downloads")

# Import chapter modules
sys.path.append(os.path.join(BASE_DIR, "scripts"))
from ccna_chapters_eng_1_8 import chapters_eng_1_8
from ccna_chapters_eng_9_16 import chapters_eng_9_16
from ccna_chapters_hi_1_8 import chapters_hi_1_8
from ccna_chapters_hi_9_16 import chapters_hi_9_16

# 1. Merge English Chapters
all_eng = {}
all_eng.update(chapters_eng_1_8)
all_eng.update(chapters_eng_9_16)

# 2. Merge Hindi Chapters
all_hi = {}
all_hi.update(chapters_hi_1_8)
all_hi.update(chapters_hi_9_16)

print(f"[INFO] Loaded {len(all_eng)} English chapters and {len(all_hi)} Hindi chapters.")

# 3. Write individual chapter files
for ch_num in range(1, 17):
    # English
    eng_path = os.path.join(ENG_DIR, f"chapter-{ch_num:02d}.typ")
    with open(eng_path, "w", encoding="utf-8") as f:
        f.write(all_eng[ch_num].strip() + "\n")
    
    # Hindi
    hi_path = os.path.join(HI_DIR, f"chapter-{ch_num:02d}.typ")
    with open(hi_path, "w", encoding="utf-8") as f:
        f.write(all_hi[ch_num].strip() + "\n")

print("[OK] All 16 English and 16 Hindi chapter files written successfully.")

# 4. Generate English Master Typst Document
eng_master = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab Cisco CCNA 200-301 Master Guide (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Cisco CCNA 200-301 Master Guide",
  edition: "2027 Master Edition · Edition 1 Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-CCNA-ED1"
)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5.typ"

'''

for ch_num in range(1, 17):
    eng_master += f"// CHAPTER {ch_num}\n#pagebreak()\n#include \"chapter-{ch_num:02d}.typ\"\n\n"

eng_master_path = os.path.join(ENG_DIR, "CCNA-200-301-English-Edition-1.typ")
with open(eng_master_path, "w", encoding="utf-8") as f:
    f.write(eng_master.strip() + "\n")
print("[OK] English master typst document generated.")

# 5. Generate Hindi Master Typst Document
hi_master = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5

#set document(
  title: "RTechLab Cisco CCNA 200-301 Master Guide - Hindi (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER (HINDI)
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "सिस्को CCNA 200-301 मास्टर गाइड",
  edition: "2027 मास्टर संस्करण · संस्करण 1 वाणिज्यिक रिलीज",
  author: "राहुल पटेल",
  subject-code: "RTL-2027-CCNA-ED1-HI"
)

// PAGE 2: BLUEPRINT (HINDI)
#include "../07_PUBLISHING_ENGINE/blueprint-v5-hi.typ"

'''

for ch_num in range(1, 17):
    hi_master += f"// CHAPTER {ch_num} (HINDI)\n#pagebreak()\n#include \"chapter-{ch_num:02d}.typ\"\n\n"

hi_master_path = os.path.join(HI_DIR, "CCNA-200-301-Hindi-Edition-1.typ")
with open(hi_master_path, "w", encoding="utf-8") as f:
    f.write(hi_master.strip() + "\n")
print("[OK] Hindi master typst document generated.")

# 6. Compile Both Master PDFs
eng_pdf_out = os.path.join(CORE_OUT, "CCNA-200-301-English-Edition-1.pdf")
hi_pdf_out = os.path.join(CORE_OUT, "CCNA-200-301-Hindi-Edition-1.pdf")

print("\n[INFO] Compiling English Master Edition with Typst...")
cmd_eng = ["typst", "compile", "--root", CCNA_DIR, eng_master_path, eng_pdf_out]
res_eng = subprocess.run(cmd_eng, capture_output=True, text=True)
if res_eng.returncode != 0:
    print("[ERROR] English compilation failed:", res_eng.stderr)
else:
    print(f"[SUCCESS] English Master PDF compiled: {eng_pdf_out}")

print("\n[INFO] Compiling Hindi Master Edition with Typst...")
cmd_hi = ["typst", "compile", "--root", CCNA_DIR, hi_master_path, hi_pdf_out]
res_hi = subprocess.run(cmd_hi, capture_output=True, text=True)
if res_hi.returncode != 0:
    print("[ERROR] Hindi compilation failed:", res_hi.stderr)
else:
    print(f"[SUCCESS] Hindi Master PDF compiled: {hi_pdf_out}")

# 7. Check Page Counts with PyMuPDF
import fitz
if os.path.exists(eng_pdf_out):
    doc_eng = fitz.open(eng_pdf_out)
    print(f"\n[PAGE AUDIT] English Master Edition Total Pages: {len(doc_eng)}")
if os.path.exists(hi_pdf_out):
    doc_hi = fitz.open(hi_pdf_out)
    print(f"[PAGE AUDIT] Hindi Master Edition Total Pages: {len(doc_hi)}")
