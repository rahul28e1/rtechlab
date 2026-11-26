# -*- coding: utf-8 -*-
"""
RTechLab Microsoft 365 Enterprise Quick Desk Reference & 150 Shortcuts (V6 Master Builder)
Compiles English, Hindi, and Gujarati editions cleanly to exact 8-page A4 PDFs.
"""
import os
import re
import shutil
import subprocess
import fitz  # PyMuPDF

from o365_v6_data import (
    LANG_PACKS,
    SHORTCUTS_WORD_45,
    SHORTCUTS_EXCEL_72,
    SHORTCUTS_PPT_33,
)

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SOURCE_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\07_SOURCE_FILES")
OUTPUT_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION")
DOWNLOADS_DIR = os.path.join(BASE_DIR, "public", "downloads")
PREVIEW_DIR = os.path.join(BASE_DIR, "scratch", "v6_preview")

os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(DOWNLOADS_DIR, exist_ok=True)
os.makedirs(PREVIEW_DIR, exist_ok=True)

OUT_FILENAMES = {
    "en": "Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf",
    "hi": "Office-365-Quick-Desk-Reference-Cheat-Sheet-Hindi.pdf",
    "gu": "Office-365-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf",
}


def sanitize_typst_content(text: str) -> str:
    """
    Escape accidental Typst code characters outside backticks and known macros (#hl-, #kbd, #link, #text, #box).
    """
    parts = re.split(r"(`[^`]*`)", text)
    cleaned = []
    for i, part in enumerate(parts):
        if i % 2 == 1:
            # Inside backticks: Typst treats # and $ literally
            cleaned.append(part)
        else:
            # Escape #digit like #1, #2 unless already escaped
            part = re.sub(r"(?<!\\)#(\d+)", r"\\#\1", part)
            # Escape standalone # followed by space or )
            part = re.sub(r"(?<!\\)#(?=[\s\)])", r"\\#", part)
            # Escape Excel-like #N/A, #VALUE!, #SPILL!, #REF!, #DIV/0!, #NAME? outside backticks
            part = re.sub(r"(?<!\\)#(N/A|VALUE!|SPILL!|REF!|DIV/0!|NAME\?|#)", r"\\#\1", part)
            # Escape literal @ if any
            part = re.sub(r"(?<!\\)@", r"\\@", part)
            cleaned.append(part)
    return "".join(cleaned)


def format_shortcut_band(items, lang_idx, pill_color, cols_count=3):
    """Build 6-column shortcut table cells (No.+Key | Action) x 3 for a tight poster band."""
    # lang_idx: 2=en, 3=hi, 4=gu
    cells = []
    for (num, key, d_en, d_hi, d_gu, hl) in items:
        desc = (d_en, d_hi, d_gu)[lang_idx - 2]
        desc_safe = sanitize_typst_content(desc)
        key_safe = key.replace("$", "\\$") if "\\$" not in key else key
        key_safe = (
            key_safe.replace("#", "\\#")
            .replace("*", "\\*")
            .replace("_", "\\_")
            .replace("[", "\\[")
            .replace("]", "\\]")
        )
        if hl:
            desc_cell = f"[#hl-{hl}[{desc_safe}]]"
        else:
            desc_cell = f"[{desc_safe}]"
        key_cell = f"[#nb(\"{num}\", {pill_color}) #kbd[{key_safe}]]"
        cells.append(f"    {key_cell}, {desc_cell},")
    return "\n".join(cells)


def build_typst_source(lang_code: str) -> str:
    L = LANG_PACKS[lang_code]
    lang_idx = {"en": 2, "hi": 3, "gu": 4}[lang_code]

    # Color map helper for badges
    color_var = {
        "navy": "rtech-navy",
        "word": "rtech-word",
        "excel": "rtech-excel",
        "ppt": "rtech-ppt",
        "out": "rtech-outlook",
        "em": "rgb(\"#047857\")",
        "b": "rtech-blue",
        "g": "rtech-excel",
        "o": "rtech-ppt",
        "w": "rtech-word",
    }

    # Index rows
    idx_cells = []
    for pg, col_key, mod_name, desc in L["idx_rows"]:
        c = color_var[col_key]
        idx_cells.append(
            f'      [#box(fill: {c}, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.4pt)[{pg}]]],\n'
            f'      [#text(weight: "bold", fill: {c})[{sanitize_typst_content(mod_name)}]],\n'
            f'      [{sanitize_typst_content(desc)}],'
        )
    idx_rows_typ = "\n".join(idx_cells)

    # Why cards (3 cols on Cover Page)
    why_cells = []
    for title, c_key, body in L["why_cards"]:
        bg = {"b": "#EFF6FF", "g": "#F0FDF4", "o": "#FFF7ED"}[c_key]
        c = color_var[c_key]
        why_cells.append(
            f'    [#block(width: 100%, height: 68pt, fill: rgb("{bg}"), stroke: (top: 2.5pt + {c}, rest: 0.65pt + dark-border), radius: 3pt, inset: 4.5pt)[\n'
            f'      #text(size: 6.8pt, weight: "black", fill: {c})[{sanitize_typst_content(title)}]\n'
            f'      #v(1.5pt)\n'
            f'      #text(size: 6.3pt, fill: rtech-navy)[{sanitize_typst_content(body)}]\n'
            f'    ]]'
        )
    why_cards_typ = ",\n".join(why_cells)

    # Stats bottom pills (4 cols on Cover Page)
    stats_cells = []
    for val, lbl, c_key in L["stats"]:
        c = color_var[c_key]
        stats_cells.append(
            f'    [#block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3.5pt)[\n'
            f'      #text(size: 10pt, weight: "black", fill: rtech-navy)[{val}]\\\n'
            f'      #text(size: 6.1pt, weight: "bold", fill: {c})[{sanitize_typst_content(lbl)}]\n'
            f'    ]]'
        )
    stats_typ = ",\n".join(stats_cells)

    # Page 2 Word workflows & quick 10 & checklist
    p2_wf_typ = "\n".join(
        f'  [{sanitize_typst_content(a)}], [{sanitize_typst_content(b)}], [{sanitize_typst_content(c)}],'
        for a, b, c in L["p2_wf_rows"]
    )
    p2_sc_typ = "\n".join(
        f'  [#kbd[{k}]], [{sanitize_typst_content(v)}],'
        for k, v in L["p2_sc"]
    )
    p2_chk_typ = "\n".join(
        f'  [#text(weight: "bold", fill: rtech-word)[{sanitize_typst_content(a)}]], [{sanitize_typst_content(b)}],'
        for a, b in L["p2_chk_rows"]
    )

    # Page 3 Excel Formulas (24 rows)
    p3_f_typ = "\n".join(
        f'  [{sanitize_typst_content(a)}], [{sanitize_typst_content(b)}], [{sanitize_typst_content(c)}],'
        for a, b, c in L["p3_f_rows"]
    )

    # Page 4 Power Query + Errors + MIS + Case Study
    p4_pq_typ = "\n".join(
        f'  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[{s}]]], '
        f'[#text(weight: "bold", fill: rtech-blue)[{sanitize_typst_content(a)}]], [{sanitize_typst_content(b)}], [{sanitize_typst_content(c)}],'
        for s, a, b, c in L["p4_pq_rows"]
    )
    p4_err_typ = "\n".join(
        f'  [#text(weight: "bold", fill: rtech-ppt)[{sanitize_typst_content(e)}]], [{sanitize_typst_content(r)}], [{sanitize_typst_content(f)}],'
        for e, r, f in L["p4_err_rows"]
    )
    p4_mis_typ = "\n".join(
        f'  [#text(weight: "bold", fill: rtech-excel)[{sanitize_typst_content(s)}]], [{sanitize_typst_content(d)}],'
        for s, d in L["p4_mis_rows"]
    )
    p4_case_typ = "\n".join(
        f'  [#text(weight: "bold", fill: rtech-navy)[{sanitize_typst_content(a)}]], [{sanitize_typst_content(b)}],'
        for a, b in L["p4_case_rows"]
    )

    # Page 5 PowerPoint
    p5_rows_typ = "\n".join(
        f'  [{sanitize_typst_content(a)}], [{sanitize_typst_content(b)}], [{sanitize_typst_content(c)}],'
        for a, b, c in L["p5_rows"]
    )
    p5_sc_typ = "\n".join(
        f'  [#kbd[{k}]], [{sanitize_typst_content(v)}],'
        for k, v in L["p5_sc"]
    )
    p5_deck_typ = "\n".join(
        f'  [#text(weight: "bold", fill: rtech-ppt)[{sanitize_typst_content(a)}]], [{sanitize_typst_content(b)}], [{sanitize_typst_content(c)}], [#text(weight: "bold", fill: rtech-navy)[{d}]],'
        for a, b, c, d in L["p5_deck_rows"]
    )

    # Page 6: 150 Shortcuts Poster
    p6_w_cells = format_shortcut_band(SHORTCUTS_WORD_45, lang_idx, "rtech-word")
    p6_x_cells = format_shortcut_band(SHORTCUTS_EXCEL_72, lang_idx, "rtech-excel")
    p6_p_cells = format_shortcut_band(SHORTCUTS_PPT_33, lang_idx, "rtech-ppt")

    # Page 7 Outlook & Cloud & Email Templates
    p7_o_typ = "\n".join(
        f'  [{sanitize_typst_content(a)}], [{sanitize_typst_content(b)}], [{sanitize_typst_content(c)}],'
        for a, b, c in L["p7_o_rows"]
    )
    p7_c_typ = "\n".join(
        f'  [{sanitize_typst_content(a)}], [{sanitize_typst_content(b)}], [{sanitize_typst_content(c)}],'
        for a, b, c in L["p7_c_rows"]
    )
    p7_tpl_typ = "\n".join(
        f'  [{sanitize_typst_content(a)}], [{sanitize_typst_content(b)}],'
        for a, b in L["p7_tpl_rows"]
    )

    # Page 8 Q&A & 30-Day Plan
    p8_qa_typ = "\n".join(
        f'  [#text(weight: "bold", fill: rtech-navy)[{sanitize_typst_content(q)}]], [{sanitize_typst_content(a)}],'
        for q, a in L["p8_qa_rows"]
    )
    p8_plan_typ = "\n".join(
        f'  [{sanitize_typst_content(a)}], [{sanitize_typst_content(b)}],'
        for a, b in L["p8_plan_rows"]
    )

    # Bottom Did-You-Know + Lab + Motivation + Illustration helper blocks
    dyk = L["dyk"]
    def make_dyk_split(key, img_file, accent, bg_hex, img_h="74pt"):
        t, fact, lab, quote = dyk[key]
        return f'''#v(1fr)
#block(
  width: 100%,
  fill: rgb("{bg_hex}"),
  stroke: (left: 3.5pt + {accent}, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: {accent})[{sanitize_typst_content(t)}]\\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[{sanitize_typst_content(fact)}]\\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[{sanitize_typst_content(lab)}]
        ]\\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: {accent})[{sanitize_typst_content(quote)}]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/{img_file}", height: {img_h}, fit: "contain")
        ]
      ]
    )
  ]
)'''

    p2_dyk_block = make_dyk_split("p2", "office_word_desk.png", "rtech-word", "#EFF6FF", "64pt")
    p3_dyk_block = make_dyk_split("p3", "office_excel_desk.png", "rtech-excel", "#F0FDF4", "64pt")
    p4_dyk_block = make_dyk_split("p4", "office_excel_desk.png", "rtech-excel", "#F0FDF4", "80pt")
    p5_dyk_block = make_dyk_split("p5", "office_ppt_stage.png", "rtech-ppt", "#FFF7ED", "76pt")
    p7_dyk_block = make_dyk_split("p7", "office_cloud_team.png", "rtech-outlook", "#EFF6FF", "62pt")

    # V7 10/10 Blocks:
    p2_ats_block = f'''#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [#box(width: 100%, fill: rgb("#DCFCE7"), stroke: 0.65pt + rtech-excel, radius: 2.5pt, inset: (x: 5pt, y: 2.5pt))[#text(size: 6.1pt, weight: "bold", fill: rgb("#166534"))[{sanitize_typst_content(L['v7_ats'][0])}]]],
  [#box(width: 100%, fill: rgb("#FEE2E2"), stroke: 0.65pt + rgb("#DC2626"), radius: 2.5pt, inset: (x: 5pt, y: 2.5pt))[#text(size: 6.1pt, weight: "bold", fill: rgb("#991B1B"))[{sanitize_typst_content(L['v7_ats'][1])}]]]
)'''

    p4_lab_banner = f'''#v(2pt)
#box(width: 100%, fill: rgb("#EFF6FF"), stroke: 0.65pt + rtech-blue, radius: 2.5pt, inset: (x: 6pt, y: 2.5pt))[
  #text(size: 6.2pt, weight: "bold", fill: rtech-blue)[{sanitize_typst_content(L['v7_lab_url'])}]
]'''

    win_cells = "\n".join(
        f'    [#nb("W{i+1}", rtech-navy) #kbd[{k}]], [{sanitize_typst_content(v)}],'
        for i, (k, v) in enumerate(L["v7_win_keys"])
    )
    p6_win_block = f'''#v(2.5pt)
#block(width: 100%, fill: rtech-navy, inset: (x: 5pt, y: 1.8pt), radius: (top: 2pt))[
  #text(size: 6.5pt, weight: "black", fill: white)[⊞  |  {sanitize_typst_content(L['v7_win_hdr'])}]
]
#block(width: 100%)[
  #set text(size: 6pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) {{ white }} else {{ rgb("#F8FAFC") }},
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2pt),
{win_cells}
  )
]'''

    ai_cells = "\n".join(
        f'  [{sanitize_typst_content(a)}], [{sanitize_typst_content(b)}],'
        for a, b in L["v7_ai_rows"]
    )
    p7_ai_block = f'''#v(2pt)
#block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 2.5pt, inset: 3pt)[
  #text(size: 6.4pt, weight: "black", fill: rtech-navy)[🤖 {sanitize_typst_content(L['v7_ai_hdr'])}]\\
  #v(1.5pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 4pt,
    ..({", ".join(f'[#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[{sanitize_typst_content(a)}: {sanitize_typst_content(b)}]]]' for a, b in L["v7_ai_rows"])})
  )
]'''

    p6_f, p6_q = dyk["p6"]
    p6_dyk_block = f'''#v(1fr)
#grid(
  columns: (1fr, 1.15fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEFCE8"), stroke: (left: 3pt + rgb("#CA8A04"), rest: 0.6pt + dark-border), radius: 2.5pt, inset: 4pt)[
      #text(size: 6.3pt, weight: "bold", fill: rgb("#854D0E"))[{sanitize_typst_content(p6_f)}]
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#EFF6FF"), stroke: (left: 3pt + rtech-blue, rest: 0.6pt + dark-border), radius: 2.5pt, inset: 4pt)[
      #text(size: 6.3pt, style: "italic", weight: "bold", fill: rtech-navy)[{sanitize_typst_content(p6_q)}]
    ]
  ]
)'''

    p8_t, p8_b = dyk["p8"]
    p8_pledge_block = f'''#v(1fr)
#block(width: 100%, fill: rgb("#F0FDF4"), stroke: (left: 3.5pt + rgb("#047857"), rest: 0.65pt + dark-border), radius: 3.5pt, inset: 5pt)[
  #grid(
    columns: (1.8fr, 0.9fr),
    gutter: 6pt,
    align: (left + horizon, center + horizon),
    [
      #text(size: 7pt, weight: "black", fill: rgb("#047857"))[{sanitize_typst_content(p8_t)}]\\
      #v(2pt)
      #text(size: 6.45pt, weight: "bold", fill: rtech-navy)[{sanitize_typst_content(p8_b)}]
    ],
    [
      #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
        #image("02_BRAND_ASSETS/office_word_desk.png", height: 56pt, fit: "contain")
      ]
    ]
  )
]'''

    typ = f'''// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE V6 ({lang_code.upper()})
// Complete College & Corporate Desk Reference + 150 Shortcuts Poster (8 Pages)
// =============================================================================

#set document(
  title: "{L['doc_title']}",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 8mm, bottom: 7.5mm, left: 7.5mm, right: 7.5mm),
  background: context {{
    let p = counter(page).get().first()
    if p > 1 [
      #place(center + horizon)[
        #rotate(-35deg)[
          #text(size: 74pt, weight: "black", fill: rgb("#0F172A0A"))[RTECHLAB]
        ]
      ]
    ]
  }},
  header: context {{
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 11pt, baseline: 1.5pt)[#image("02_BRAND_ASSETS/rtechlab_official_badge_logo.png", height: 11pt)]
          #h(3pt)#text(size: 7.5pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 7.5pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[{sanitize_typst_content(L['header_title'])}]
        ],
        [
          #text(size: 6.8pt, weight: "bold", fill: rgb("#107C41"))[{L['header_apps']}]
          #text(size: 6.8pt, fill: rgb("#64748B"))[ · Rahul Patel]
        ]
      )
      #v(1pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
    ]
  }},
  footer: context {{
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(1pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.3pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] {sanitize_typst_content(L['footer_left'])}
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            stroke: 0.4pt + rgb("#CBD5E1"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.2pt),
            text(size: 6.5pt, weight: "bold", fill: rgb("#0F172A"))[{L['page_label']} #p {L['of_label']}]
          )
        ]
      )
    ]
  }}
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
  size: 6.8pt,
  fill: rgb("#0F172A"),
  spacing: 100%
)

#set par(
  justify: false,
  leading: 0.36em,
  first-line-indent: 0pt
)

// Colors
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-word = rgb("#185ABD")
#let rtech-excel = rgb("#107C41")
#let rtech-ppt = rgb("#C43E1C")
#let rtech-outlook = rgb("#0078D4")
#let rtech-muted = rgb("#475569")
#let dark-border = rgb("#1E293B")

// Highlighters & Tags
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-o(body) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#body]]
#let kbd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.55pt + dark-border, radius: 2pt, inset: (x: 2pt, y: 0.5pt))[#text(size: 5.9pt, font: ("Consolas", "Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]
#let nb(n, c) = box(fill: c, inset: (x: 2pt, y: 0.7pt), radius: 2pt)[#text(fill: white, weight: "black", size: 5.4pt)[#n]]

#let app-banner(title, subtitle, color) = {{
  block(width: 100%, fill: color, radius: 3pt, inset: (x: 6pt, y: 3.5pt))[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [#text(size: 9.2pt, weight: "black", fill: white)[#title]],
      [#text(size: 6.4pt, weight: "bold", fill: rgb("#FFFFFFCC"))[#subtitle]]
    )
  ]
  v(2pt)
}}

#let section-banner(num: "PART", title: "TITLE", color: rtech-blue) = {{
  v(2.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3pt + color, rest: 0.55pt + dark-border),
    radius: (right: 2.5pt),
    inset: (x: 5pt, y: 2.2pt),
    [
      #box(
        fill: color,
        radius: 2pt,
        inset: (x: 3.5pt, y: 1pt),
        text(size: 5.8pt, font: ("Consolas", "Nirmala UI", "Segoe UI"), weight: "black", fill: white)[#num]
      )
      #h(4pt)
      #text(size: 7.5pt, weight: "black", fill: rtech-navy)[#title]
    ]
  )
  v(1.5pt)
}}

// =============================================================================
// PAGE 01: FULL-BLEED EXECUTIVE HERO COVER PAGE
// =============================================================================
#page(
  paper: "a4",
  margin: 0mm,
  header: none,
  footer: none,
  background: none,
)[
  #image("02_BRAND_ASSETS/office_365_cover_hero.png", width: 100%, height: 100%, fit: "cover")
]

// =============================================================================
// PAGE 02: SECTION 1 — MICROSOFT WORD 365 (VISUAL + WORKFLOWS + TOP KEYS)
// =============================================================================
#app-banner("{sanitize_typst_content(L['p2_banner'][0])}", "{sanitize_typst_content(L['p2_banner'][1])}", rtech-word)

// Compact 8-Page Quick Index Strip
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 2.5pt, inset: (x: 4pt, y: 2.5pt))[
  #set text(size: 5.7pt, weight: "bold", fill: rtech-navy)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    [#box(fill: rtech-navy, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.1]] Cover & Roadmap],
    [#box(fill: rtech-word, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.2]] MS Word 365],
    [#box(fill: rtech-excel, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.3]] 24 Excel Formulas],
    [#box(fill: rtech-excel, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.4]] Power Query & Errors],
    [#box(fill: rtech-ppt, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.5]] PowerPoint 365],
    [#box(fill: rtech-navy, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.6]] ★ 150 Shortcuts Wall],
    [#box(fill: rtech-outlook, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.7]] Outlook, Cloud & AI],
    [#box(fill: rgb("#047857"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.8]] Author QR & MNC Q&A],
  )
]

#section-banner(num: "{L['p2_m1_num']}", title: "{sanitize_typst_content(L['p2_m1_title'])}", color: rtech-word)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/word_document_layout_visual.png", width: 84%)
  ]
]

#section-banner(num: "{L['p2_m2_num']}", title: "{sanitize_typst_content(L['p2_m2_title'])}", color: rtech-word)
#table(
  columns: (1.35fr, 2.25fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3.1pt,
  text(size: 6.6pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p2_wf_cols'][0])}],
  text(size: 6.6pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p2_wf_cols'][1])}],
  text(size: 6.6pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p2_wf_cols'][2])}],
{p2_wf_typ}
)

#section-banner(num: "{L['p2_m3_num']}", title: "{sanitize_typst_content(L['p2_m3_title'])}", color: rtech-word)
#table(
  columns: (1.05fr, 1.95fr, 1.05fr, 1.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
{p2_sc_typ}
)

#section-banner(num: "{L['p2_chk_num']}", title: "{sanitize_typst_content(L['p2_chk_title'])}", color: rtech-blue)
#table(
  columns: (1.4fr, 4.6fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
{p2_chk_typ}
)
{p2_ats_block}
{p2_dyk_block}

#pagebreak()

// =============================================================================
// PAGE 03: SECTION 2A — EXCEL 365 FORMULAS + SPREADSHEET VISUAL
// =============================================================================
#app-banner("{sanitize_typst_content(L['p3_banner'][0])}", "{sanitize_typst_content(L['p3_banner'][1])}", rtech-excel)

#section-banner(num: "{L['p3_m1_num']}", title: "{sanitize_typst_content(L['p3_m1_title'])}", color: rtech-excel)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/excel_dynamic_array_grid.png", width: 96%)
  ]
]

#section-banner(num: "{L['p3_m2_num']}", title: "{sanitize_typst_content(L['p3_m2_title'])}", color: rtech-excel)
#table(
  columns: (1.15fr, 2.3fr, 2.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.5pt,
  text(size: 6.4pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p3_f_cols'][0])}],
  text(size: 6.4pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p3_f_cols'][1])}],
  text(size: 6.4pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p3_f_cols'][2])}],
{p3_f_typ}
)
#v(2.5pt)
#box(width: 100%, fill: rgb("#DCFCE7"), stroke: 0.7pt + rtech-excel, radius: 3pt, inset: (x: 6pt, y: 3.5pt))[
  #text(size: 6.4pt, weight: "bold", fill: rgb("#166534"))[{sanitize_typst_content(L['p3_spill_tip'])} · {sanitize_typst_content(L['v7_lab_url'])}]
]
{p3_dyk_block}

#pagebreak()

// =============================================================================
// PAGE 04: SECTION 2B — POWER QUERY ETL, ERROR DOCTOR & PIVOT MIS
// =============================================================================
#app-banner("{sanitize_typst_content(L['p4_banner'][0])}", "{sanitize_typst_content(L['p4_banner'][1])}", rtech-excel)

#section-banner(num: "{L['p4_m1_num']}", title: "{sanitize_typst_content(L['p4_m1_title'])}", color: rtech-blue)
#table(
  columns: (0.45fr, 1.25fr, 2.3fr, 2fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (col, row) => if col == 0 {{ center + horizon }} else {{ left + horizon }},
  inset: 3.1pt,
  text(size: 6.6pt, weight: "bold", fill: white)[{L['p4_pq_cols'][0]}],
  text(size: 6.6pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p4_pq_cols'][1])}],
  text(size: 6.6pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p4_pq_cols'][2])}],
  text(size: 6.6pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p4_pq_cols'][3])}],
{p4_pq_typ}
)

#section-banner(num: "{L['p4_m2_num']}", title: "{sanitize_typst_content(L['p4_m2_title'])}", color: rtech-ppt)
#table(
  columns: (0.75fr, 2.35fr, 2.9fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3pt,
  text(size: 6.6pt, weight: "bold", fill: white)[{L['p4_err_cols'][0]}],
  text(size: 6.6pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p4_err_cols'][1])}],
  text(size: 6.6pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p4_err_cols'][2])}],
{p4_err_typ}
)

#section-banner(num: "MIS PRO", title: "{sanitize_typst_content(L['p4_mis_title'])}", color: rtech-excel)
#table(
  columns: (1.25fr, 4.75fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon),
  inset: 3pt,
{p4_mis_typ}
)

#section-banner(num: "{L['p4_case_num']}", title: "{sanitize_typst_content(L['p4_case_title'])}", color: rtech-navy)
#table(
  columns: (1.45fr, 4.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon),
  inset: 3.2pt,
{p4_case_typ}
)
{p4_lab_banner}
{p4_dyk_block}

#pagebreak()

// =============================================================================
// PAGE 05: SECTION 3 — POWERPOINT 365 (SLIDE MASTER, MORPH & PITCH DECK)
// =============================================================================
#app-banner("{sanitize_typst_content(L['p5_banner'][0])}", "{sanitize_typst_content(L['p5_banner'][1])}", rtech-ppt)

#section-banner(num: "{L['p5_m1_num']}", title: "{sanitize_typst_content(L['p5_m1_title'])}", color: rtech-ppt)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/powerpoint_slide_master_morph.png", width: 96%)
  ]
]

#section-banner(num: "{L['p5_m2_num']}", title: "{sanitize_typst_content(L['p5_m2_title'])}", color: rtech-ppt)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3pt,
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p5_cols'][0])}],
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p5_cols'][1])}],
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p5_cols'][2])}],
{p5_rows_typ}
)

#section-banner(num: "{L['p5_m3_num']}", title: "{sanitize_typst_content(L['p5_m3_title'])}", color: rtech-ppt)
#table(
  columns: (1.05fr, 1.95fr, 1.05fr, 1.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
{p5_sc_typ}
)

#section-banner(num: "{L['p5_deck_num']}", title: "{sanitize_typst_content(L['p5_deck_title'])}", color: rtech-navy)
#table(
  columns: (0.7fr, 1.8fr, 2.85fr, 0.65fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (col, row) => if col in (0, 3) {{ center + horizon }} else {{ left + horizon }},
  inset: 2.6pt,
  text(size: 6.4pt, weight: "bold", fill: white)[{L['p5_deck_cols'][0]}],
  text(size: 6.4pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p5_deck_cols'][1])}],
  text(size: 6.4pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p5_deck_cols'][2])}],
  text(size: 6.4pt, weight: "bold", fill: white)[{L['p5_deck_cols'][3]}],
{p5_deck_typ}
)
{p5_dyk_block}

#pagebreak()

// =============================================================================
// PAGE 06: ★ THE 150 PRODUCTION SHORTCUTS MASTER WALL (ALL ON ONE PAGE!) ★
// Word (001-045) + Excel (046-117) + PowerPoint (118-150) — Zero Blank Cells!
// =============================================================================
#app-banner("{sanitize_typst_content(L['p6_banner'][0])}", "{sanitize_typst_content(L['p6_banner'][1])}", rtech-navy)

// Band 1: WORD (45 shortcuts = 15 rows x 3 pairs)
#block(width: 100%, fill: rtech-word, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[W  |  {sanitize_typst_content(L['p6_w_hdr'])}]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) {{ white }} else {{ rgb("#F8FAFC") }},
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
{p6_w_cells}
  )
]
#v(3pt)

// Band 2: EXCEL (72 shortcuts = 24 rows x 3 pairs)
#block(width: 100%, fill: rtech-excel, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[X  |  {sanitize_typst_content(L['p6_x_hdr'])}]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) {{ white }} else {{ rgb("#F0FDF4") }},
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
{p6_x_cells}
  )
]
#v(3pt)

// Band 3: POWERPOINT (33 shortcuts = 11 rows x 3 pairs)
#block(width: 100%, fill: rtech-ppt, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[P  |  {sanitize_typst_content(L['p6_p_hdr'])}]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) {{ white }} else {{ rgb("#FFF7ED") }},
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
{p6_p_cells}
  )
]
{p6_win_block}
#v(3pt)
#box(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.65pt + dark-border, radius: 2.5pt, inset: (x: 6pt, y: 3.5pt))[
  #text(size: 6.2pt, fill: rtech-navy)[{sanitize_typst_content(L['p6_legend'])}]
]
{p6_dyk_block}

#pagebreak()

// =============================================================================
// PAGE 07: SECTION 4 — OUTLOOK 365, ONEDRIVE CLOUD & WORKPLACE ETHICS
// =============================================================================
#app-banner("{sanitize_typst_content(L['p7_banner'][0])}", "{sanitize_typst_content(L['p7_banner'][1])}", rtech-outlook)

#section-banner(num: "{L['p7_m1_num']}", title: "{sanitize_typst_content(L['p7_m1_title'])}", color: rtech-outlook)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/outlook_cloud_workflow_visual.png", width: 96%)
  ]
]

#section-banner(num: "{L['p7_m2_num']}", title: "{sanitize_typst_content(L['p7_m2_title'])}", color: rtech-outlook)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.9pt,
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p7_o_cols'][0])}],
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p7_o_cols'][1])}],
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p7_o_cols'][2])}],
{p7_o_typ}
)

#section-banner(num: "{L['p7_m3_num']}", title: "{sanitize_typst_content(L['p7_m3_title'])}", color: rtech-emerald)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.9pt,
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p7_c_cols'][0])}],
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p7_c_cols'][1])}],
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p7_c_cols'][2])}],
{p7_c_typ}
)

#section-banner(num: "{L['p7_m4_num']}", title: "{sanitize_typst_content(L['p7_m4_title'])}", color: rtech-blue)
#table(
  columns: (1.45fr, 4.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon),
  inset: 2.9pt,
{p7_tpl_typ}
)
{p7_ai_block}
{p7_dyk_block}

#pagebreak()

// =============================================================================
// PAGE 08: SECTION 5 — AUTHOR HUB, 4 LIVE QR CODES & TOP 8 MNC INTERVIEW Q&A
// =============================================================================
#app-banner("{sanitize_typst_content(L['p8_banner'][0])}", "{sanitize_typst_content(L['p8_banner'][1])}", rgb("#047857"))

#section-banner(num: "{L['p8_m1_num']}", title: "{sanitize_typst_content(L['p8_m1_title'])}", color: rtech-navy)
#block(
  width: 100%,
  stroke: 0.65pt + dark-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: 5pt,
  [
    #grid(
      columns: (58pt, 1fr),
      gutter: 8pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-blue,
          radius: 5pt,
          clip: true,
          width: 52pt,
          height: 62pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 10pt, weight: "black", fill: rtech-navy)[Rahul Patel]\\
        #v(1pt)
        #text(size: 7pt, weight: "bold", fill: rtech-blue)[{sanitize_typst_content(L['p8_bio_role1'])}]\\
        #text(size: 7pt, weight: "bold", fill: rgb("#047857"))[{sanitize_typst_content(L['p8_bio_role2'])}]\\
        #v(2pt)
        #text(size: 6.6pt, fill: rtech-navy)[{sanitize_typst_content(L['p8_bio_desc'])}]
      ]
    )
  ]
)

#section-banner(num: "{L['p8_m2_num']}", title: "{sanitize_typst_content(L['p8_m2_title'])}", color: rtech-blue)
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#F0F9FF"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 50pt)]\\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rtech-blue)[{sanitize_typst_content(L['p8_qr_labels'][0])}]\\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 50pt)]\\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[{sanitize_typst_content(L['p8_qr_labels'][1])}]\\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[`RTechLabOfficial` ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 50pt)]\\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[{sanitize_typst_content(L['p8_qr_labels'][2])}]\\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[`rtechlabofficial` ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 50pt)]\\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[{sanitize_typst_content(L['p8_qr_labels'][3])}]\\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[Join Channel ↗]]
      ]
    ]
  ],
)

#section-banner(num: "{L['p8_m3_num']}", title: "{sanitize_typst_content(L['p8_m3_title'])}", color: rtech-excel)
#table(
  columns: (2.05fr, 3.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 {{ rtech-navy }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p8_qa_cols'][0])}],
  text(size: 6.5pt, weight: "bold", fill: white)[{sanitize_typst_content(L['p8_qa_cols'][1])}],
{p8_qa_typ}
)

#section-banner(num: "{L['p8_plan_num']}", title: "{sanitize_typst_content(L['p8_plan_title'])}", color: rtech-ppt)
#table(
  columns: (1.25fr, 4.75fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
{p8_plan_typ}
)
{p8_pledge_block}
#v(4pt)
#align(center)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 0.9pt + rtech-blue,
    radius: 3.5pt,
    inset: (x: 8pt, y: 4pt),
    text(size: 6.7pt, weight: "bold", fill: rtech-blue)[{sanitize_typst_content(L['p8_cta'])}]
  )
]
'''
    return typ


def compile_and_verify():
    for lang in ("en", "hi", "gu"):
        typ_src = build_typst_source(lang)
        typ_path = os.path.join(SOURCE_DIR, f"office_365_v6_{lang}.typ")
        out_pdf = os.path.join(OUTPUT_DIR, OUT_FILENAMES[lang])
        pub_pdf = os.path.join(DOWNLOADS_DIR, OUT_FILENAMES[lang])

        with open(typ_path, "w", encoding="utf-8") as f:
            f.write(typ_src)

        print(f"Compiling V6 {lang.upper()}...")
        res = subprocess.run(
            ["typst", "compile", typ_path, out_pdf],
            capture_output=True, text=True, cwd=SOURCE_DIR
        )
        if res.returncode != 0:
            print(f"ERROR compiling {lang}:\n", res.stderr)
            raise SystemExit(1)

        doc = fitz.open(out_pdf)
        page_count = len(doc)
        print(f"=== {lang.upper()} V6 VERIFICATION: Total Pages = {page_count} ===")
        # Check fill percentage excluding footer y > 805
        for i, page in enumerate(doc):
            blocks = [b for b in page.get_text("blocks") if b[3] < 808]
            images = page.get_image_info(xrefs=True)
            img_max_y = max((im["bbox"][3] for im in images if im["bbox"][3] < 808), default=0)
            txt_max_y = max((b[3] for b in blocks), default=0)
            content_y = max(img_max_y, txt_max_y)
            print(f"  Page {i+1}: content bottom = {content_y:.1f} / 810pt ({content_y/810*100:.1f}%)")
            if lang in ("en", "hi", "gu"):
                pix = page.get_pixmap(dpi=130)
                pix.save(os.path.join(PREVIEW_DIR, f"{lang}_p{i+1}.png"))
        doc.close()

        shutil.copy2(out_pdf, pub_pdf)
        if page_count != 8:
            print(f"WARNING: {lang.upper()} compiled to {page_count} pages instead of 8!")


if __name__ == "__main__":
    compile_and_verify()
    print("All V6 builds completed successfully.")
