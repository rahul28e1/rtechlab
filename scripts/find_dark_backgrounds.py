# -*- coding: utf-8 -*-
import glob
import re

print("Searching for dark backgrounds in .typ files...")

dark_colors = ["#0F172A", "#1E293B", "#0284C7", "#000000", "#0b0f19", "#002B36", "#111827"]

for typ in glob.glob("DIGITAL/**/*.typ", recursive=True):
    with open(typ, "r", encoding="utf-8") as f:
        content = f.read()
    
    # Check table fills
    table_matches = re.findall(r'fill:\s*\([^\)]*\)\s*=>\s*[^,\n]+', content)
    found_dark_table = []
    for tm in table_matches:
        if any(c.lower() in tm.lower() for c in ["#0f172a", "#1e293b", "navy", "rgb(15, 23, 42)"]):
            found_dark_table.append(tm)
            
    if found_dark_table:
        print(f"\n{typ}: {len(found_dark_table)} dark table fills:")
        for m in found_dark_table[:3]:
            print(f"  {m}")
