# -*- coding: utf-8 -*-
"""
Hindi AI Master Guide Generator & Assembler
Translates and formats all 42 chapters into high-density technical Hindi (Devanagari + English keywords),
compiles with Typst, and audits total page count (Target: exactly 44 pages).
"""

import os
import sys
import subprocess
import fitz

hi_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/Hindi"
eng_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/English"
out_dir = "DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION"

os.makedirs(hi_dir, exist_ok=True)
os.makedirs(out_dir, exist_ok=True)

# 1. Master Hindi file
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

print("[INFO] Created ai-master-guide-hi.typ")
