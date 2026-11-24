# -*- coding: utf-8 -*-
import os
import glob
import re

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"

print("Fixing dark table headers across all .typ files...")

# Patterns to replace:
# fill: (x, y) => if y == 0 { rgb("#0F172A") } else ...
# fill: (col, row) => if row == 0 { rgb("#0F172A") } else ...

replacements = [
    # Match various forms of dark header fills in Typst tables
    (re.compile(r'if\s+y\s*==\s*0\s*\{\s*rgb\(["\']#0F172A["\']\)\s*\}', re.IGNORECASE),
     'if y == 0 { rgb("#E2E8F0") }'),
    (re.compile(r'if\s+row\s*==\s*0\s*\{\s*rgb\(["\']#0F172A["\']\)\s*\}', re.IGNORECASE),
     'if row == 0 { rgb("#E2E8F0") }'),
    (re.compile(r'if\s+y\s*==\s*0\s*\{\s*rtech-navy\s*\}', re.IGNORECASE),
     'if y == 0 { rgb("#E2E8F0") }'),
    (re.compile(r'if\s+row\s*==\s*0\s*\{\s*rtech-navy\s*\}', re.IGNORECASE),
     'if row == 0 { rgb("#E2E8F0") }'),
    (re.compile(r'if\s+y\s*==\s*0\s*\{\s*rgb\(["\']#1E293B["\']\)\s*\}', re.IGNORECASE),
     'if y == 0 { rgb("#E2E8F0") }'),
    (re.compile(r'if\s+row\s*==\s*0\s*\{\s*rgb\(["\']#1E293B["\']\)\s*\}', re.IGNORECASE),
     'if row == 0 { rgb("#E2E8F0") }'),
]

files_modified = 0
occurrences_replaced = 0

for typ in glob.glob(os.path.join(BASE_DIR, "DIGITAL", "**", "*.typ"), recursive=True):
    with open(typ, "r", encoding="utf-8") as f:
        content = f.read()
    
    orig = content
    for pattern, repl in replacements:
        content, count = pattern.subn(repl, content)
        occurrences_replaced += count
        
    if content != orig:
        with open(typ, "w", encoding="utf-8") as f:
            f.write(content)
        files_modified += 1

print(f"Done! Modified {files_modified} files and replaced {occurrences_replaced} dark table headers with clean light slate #E2E8F0.")
