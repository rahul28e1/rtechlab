# -*- coding: utf-8 -*-
import os
import glob
import re

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\DIGITAL"

print("Auditing and darkening table strokes across all DIGITAL projects...")

# Target faint patterns to replace with crisp, dark, professional slate stroke: '0.5pt + rgb("#64748B")'
patterns = [
    # 0.3pt + rgb(15, 23, 42, 12%)
    re.compile(r'stroke:\s*0\.3pt\s*\+\s*rgb\(15,\s*23,\s*42,\s*12%\)'),
    # 0.3pt + rtech-border
    re.compile(r'stroke:\s*0\.3pt\s*\+\s*rtech-border'),
    # 0.5pt + rgb("#CBD5E1")
    re.compile(r'stroke:\s*0\.5pt\s*\+\s*rgb\(["\']#CBD5E1["\']\)'),
    # 0.5pt + rgb("#E2E8F0")
    re.compile(r'stroke:\s*0\.5pt\s*\+\s*rgb\(["\']#E2E8F0["\']\)'),
    # 0.8pt + rgb("#CBD5E1") in table contexts
    re.compile(r'stroke:\s*0\.8pt\s*\+\s*rgb\(["\']#CBD5E1["\']\)')
]

replacement = 'stroke: 0.5pt + rgb("#64748B")'

total_files_modified = 0
total_replacements = 0

for root, _, files in os.walk(BASE_DIR):
    # Skip archive folders
    if "ARCHIVE & BASELINE" in root:
        continue
    for f in files:
        if f.endswith(".typ"):
            filepath = os.path.join(root, f)
            with open(filepath, "r", encoding="utf-8") as typ_f:
                content = typ_f.read()
            
            orig = content
            file_replacements = 0
            for pat in patterns:
                content, count = pat.subn(replacement, content)
                file_replacements += count
                
            if content != orig:
                with open(filepath, "w", encoding="utf-8") as typ_f:
                    typ_f.write(content)
                total_files_modified += 1
                total_replacements += file_replacements

print(f"COMPLETE: Darkened {total_replacements} table strokes across {total_files_modified} files to 0.5pt + rgb(\"#64748B\")!")
