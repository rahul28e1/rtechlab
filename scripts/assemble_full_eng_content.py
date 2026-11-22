# -*- coding: utf-8 -*-
"""
Master English Content Assembler
Integrates Parts 1, 2, 3, and Capstone into scripts/tally_content_eng.py
"""
import os
import sys

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SCRIPTS_DIR = os.path.join(BASE_DIR, "scripts")
sys.path.append(SCRIPTS_DIR)

from mega_content_eng_part1 import get_part1_chapters
from mega_content_eng_part2 import append_chapters_5_to_7
from mega_content_eng_part3 import append_chapters_8_to_11
from mega_capstone_eng import get_capstone_chapter

chapters = get_part1_chapters() # Ch 1 to 4
chapters = append_chapters_5_to_7(chapters) # Ch 5 to 7
chapters = append_chapters_8_to_11(chapters) # Ch 8 to 11
chapters[12] = get_capstone_chapter() # Capstone Project

print(f"Total English chapters assembled: {len(chapters)}")
for ch in range(1, 13):
    print(f"  Ch {ch}: {len(chapters[ch])} chars")

out_file = os.path.join(SCRIPTS_DIR, "tally_content_eng.py")
with open(out_file, "w", encoding="utf-8") as f:
    f.write('''# -*- coding: utf-8 -*-
"""
Tally Prime Master Curriculum — English Edition (11 Comprehensive Topics + Capstone)
Standardized by Rahul Patel (Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab)
Direct Contact: rahul.28e1@gmail.com
"""

def get_english_chapters():
    chapters = {}
''')
    for ch in range(1, 13):
        escaped_content = chapters[ch].replace('\\', '\\\\').replace('"""', '\\"\\"\\"')
        f.write(f'    chapters[{ch}] = """{escaped_content}"""\n\n')
    f.write('    return chapters\n')

print(f"Successfully wrote {out_file} ({os.path.getsize(out_file)} bytes)")
