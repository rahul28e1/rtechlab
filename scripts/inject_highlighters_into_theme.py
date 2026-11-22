# -*- coding: utf-8 -*-
import os

files_to_update = [
    r"DIGITAL\TALLY_PRIME\07_PUBLISHING_ENGINE\master-theme.typ",
    r"DIGITAL\TALLY_PRIME\07_SOURCE_FILES\07_PUBLISHING_ENGINE\master-theme.typ",
    r".agents\skills\rtechlab-digital-publishing\templates\master-theme.typ"
]

highlighter_def = """// -----------------------------------------------------------------------------
// STUDENT STUDY HIGHLIGHTER & UNDERLINE ENGINE (Yellow, Light Orange, Light Green)
// Used by students and corporate trainees to highlight & underline key exam concepts
// -----------------------------------------------------------------------------

// Highlighter Markers (Background Tint)
#let hl-yellow(body) = highlight(fill: rgb("#FEF08A"), radius: 2.5pt)[#body]
#let hl-orange(body) = highlight(fill: rgb("#FFEDD5"), radius: 2.5pt)[#body]
#let hl-green(body) = highlight(fill: rgb("#DCFCE7"), radius: 2.5pt)[#body]

// Textbook Study Marker Underline (Underline style)
#let ul-yellow(body) = underline(stroke: 2.2pt + rgb("#EAB308"), offset: 2.2pt)[#body]
#let ul-orange(body) = underline(stroke: 2.2pt + rgb("#F97316"), offset: 2.2pt)[#body]
#let ul-green(body) = underline(stroke: 2.2pt + rgb("#22C55E"), offset: 2.2pt)[#body]

// Combined Marker Underline (Highlight fill + crisp stroke underline)
#let mark-yellow(body) = highlight(fill: rgb("#FEF9C3"), radius: 2.5pt)[#underline(stroke: 1.8pt + rgb("#FACC15"), offset: 1.8pt)[#body]]
#let mark-orange(body) = highlight(fill: rgb("#FFF7ED"), radius: 2.5pt)[#underline(stroke: 1.8pt + rgb("#FB923C"), offset: 1.8pt)[#body]]
#let mark-green(body) = highlight(fill: rgb("#F0FDF4"), radius: 2.5pt)[#underline(stroke: 1.8pt + rgb("#4ADE80"), offset: 1.8pt)[#body]]

// Convenient Short Aliases
#let hl-y = hl-yellow
#let hl-o = hl-orange
#let hl-g = hl-green
#let ul-y = ul-yellow
#let ul-o = ul-orange
#let ul-g = ul-green
#let mark-y = mark-yellow
#let mark-o = mark-orange
#let mark-g = mark-green

"""

for fpath in files_to_update:
    if os.path.exists(fpath):
        with open(fpath, "r", encoding="utf-8") as f:
            content = f.read()
        if "STUDENT STUDY HIGHLIGHTER" not in content:
            target = "// COMMERCIAL BANKING & INVOICE FORMAT COMPONENTS"
            if target in content:
                content = content.replace(target, highlighter_def + target)
                with open(fpath, "w", encoding="utf-8") as f:
                    f.write(content)
                print(f"Updated {fpath}")
            else:
                print(f"Target not found in {fpath}")
        else:
            print(f"Already updated {fpath}")
    else:
        print(f"File not found: {fpath}")
