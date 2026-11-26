import os
import shutil
import subprocess
import fitz  # PyMuPDF

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SOURCE_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\07_SOURCE_FILES")
ASSETS_DIR = os.path.join(SOURCE_DIR, "02_BRAND_ASSETS")
OUTPUT_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION")
PUBLIC_DIR = os.path.join(BASE_DIR, "public")
DOWNLOADS_DIR = os.path.join(PUBLIC_DIR, "downloads")

os.makedirs(SOURCE_DIR, exist_ok=True)
os.makedirs(ASSETS_DIR, exist_ok=True)
os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(DOWNLOADS_DIR, exist_ok=True)

typ_en = r'''// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE PRODUCTIVITY DESK CHEAT SHEET (ENGLISH V4)
// Exactly 8 Pages · Printable Daily Desk Companion · Edition 1 (2027)
// Author: Rahul Patel (Founder & Systems Architect, RTechLab)
// =============================================================================

#set document(
  title: "Microsoft 365 Enterprise Desk Reference & Cheat Sheet (English)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 8.5mm, bottom: 7.5mm, left: 8.5mm, right: 8.5mm),
  background: context {
    let p = counter(page).get().first()
    if p > 1 [
      #place(center + horizon)[
        #rotate(-35deg)[
          #text(size: 76pt, weight: "black", fill: rgb("#0F172A0B"))[RTECHLAB]
        ]
      ]
    ]
  },
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 11pt, baseline: 1.5pt)[#image("02_BRAND_ASSETS/rtechlab_official_badge_logo.png", height: 11pt)]
          #h(3pt)
          #text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 8pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 Enterprise Desk Reference & Cheat Sheet]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#107C41"))[Word · Excel · PowerPoint · Outlook · Cloud]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · Rahul Patel]
        ]
      )
      #v(1.5pt)
      #line(length: 100%, stroke: 0.6pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(1.5pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.6pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] Technology Made Practical · Print & Keep on Office Desk · Free Tools: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.5pt),
            text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[Page #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Segoe UI", "Nirmala UI", "Arial"),
  size: 7.0pt,
  fill: rgb("#0F172A"),
  spacing: 100%
)

#set par(
  justify: true,
  leading: 0.40em,
  first-line-indent: 0pt
)

// Brand Palette
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-word = rgb("#185ABD")
#let rtech-excel = rgb("#107C41")
#let rtech-ppt = rgb("#C43E1C")
#let rtech-outlook = rgb("#0078D4")
#let rtech-muted = rgb("#475569")
#let dark-border = rgb("#1E293B")
#let med-border = rgb("#334155")

// Highlighters
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-o(body) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#body]]
#let kbd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.6pt + dark-border, radius: 2pt, inset: (x: 2.5pt, y: 0.8pt))[#text(size: 6.6pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-blue) = {
  v(1.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3.5pt + color, rest: 0.6pt + dark-border),
    radius: (right: 3pt),
    inset: (x: 5pt, y: 2.5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 4pt, y: 1.2pt),
            text(size: 6.2pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 8.2pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(1pt)
}

// =============================================================================
// PAGE 01: THE EXECUTIVE MASTER COVER PAGE & COMPREHENSIVE INDEX (ENGLISH)
// =============================================================================

#align(center)[
  // Top Header Banner with Official RTechLab Badge Logo
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    align: (horizon, horizon),
    [
      #box(height: 28pt)[#image("02_BRAND_ASSETS/rtechlab_official_badge_logo.png", height: 28pt)]
    ],
    [
      #align(left)[
        #text(size: 11pt, weight: "black", tracking: 1.5pt, fill: rtech-blue)[RTECHLAB VOCATIONAL LEARNING SYSTEMS]\
        #text(size: 7pt, fill: rtech-muted)[Technology Made Practical · Gujarat #1 Vocational IT Systems Track · Edition 1 (2027)]
      ]
    ]
  )
  #v(1.5pt)
  #line(length: 100%, stroke: 0.8pt + rgb("#CBD5E1"))
  #v(2.5pt)

  // Author & Credentials
  #text(size: 10pt, weight: "black", fill: rtech-navy)[Author: Rahul Patel (Founder & Systems Architect)]\
  #text(size: 7.2pt, fill: rtech-muted)[
    Director & Senior Technical Expert, IANT Computer Education, Palanpur · 10+ Years IT Industry Experience · 3,000+ Students Trained
  ]

  #v(3pt)
  #line(length: 20%, stroke: 1.5pt + rtech-blue)
  #v(3pt)

  // Original Microsoft 365 Logo
  #image("02_BRAND_ASSETS/microsoft_365_official_logo.png", width: 52%)

  #v(2.5pt)
  #text(size: 18pt, font: ("Segoe UI", "Arial"), weight: "black", fill: rtech-navy, tracking: 0.5pt)[
    MICROSOFT 365 ENTERPRISE
  ]
  #v(1pt)
  #text(size: 10.5pt, font: ("Segoe UI", "Arial"), weight: "black", fill: rtech-blue)[
    Commercial Daily Desk Reference & Production Cheat Sheet
  ]
  #v(1pt)
  #text(size: 7.4pt, weight: "bold", fill: rtech-muted)[
    Advanced Excel 365 (Dynamic Arrays & XLOOKUP) · Word Corporate Legal Styles · Executive PowerPoint · Outlook 4D · Cloud Teamwork
  ]

  #v(3pt)

  // Bestseller Seal
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#0284C7"),
    radius: 12pt,
    inset: (x: 10pt, y: 2pt),
    text(size: 6.8pt, weight: "black", fill: rgb("#0369A1"))[
      ★ High-Density Desk Companion for MIS Analysts, Corporate Accountants & IT Professionals ★
    ]
  )

  #v(3.5pt)

  // OFFICIAL 8-PAGE COURSE INDEX (Point-to-Point with Exact Page Numbers)
  #block(
    width: 100%,
    stroke: 0.8pt + dark-border,
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: (x: 6pt, y: 4pt),
    [
      #align(center)[
        #text(size: 7.6pt, weight: "black", fill: rtech-navy)[📑 OFFICIAL 8-PAGE DESK REFERENCE & CHEAT SHEET TABLE OF CONTENTS]
      ]
      #v(2pt)
      #table(
        columns: (0.7fr, 1.6fr, 3.7fr),
        stroke: 0.65pt + dark-border,
        fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F1F5F9") } else { white },
        align: (col, row) => if col == 0 { center } else { left + horizon },
        inset: 2.8pt,

        text(size: 6.8pt, weight: "bold", fill: white)[Page No.],
        text(size: 6.8pt, weight: "bold", fill: white)[Module Name],
        text(size: 6.8pt, weight: "bold", fill: white)[Core Concepts & Visual Artifacts Covered],

        [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 1]]],
        [#text(weight: "bold", fill: rtech-blue)[Executive Cover & Blueprint]],
        [Official M365 & RTechLab branding, author credentials, publishing vision & syllabus index.],

        [#box(fill: rtech-word, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 2]]],
        [#text(weight: "bold", fill: rtech-word)[MS Word 365 Architecture]],
        [Heading style hierarchy (1-3), Section vs Page breaks, #hl-y[Document Layout Visual], 5-step Mail Merge & 16 Hotkeys.],

        [#box(fill: rtech-excel, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 3]]],
        [#text(weight: "bold", fill: rtech-excel)[Excel Modern Formula Engine]],
        [Dynamic arrays (`#`), `XLOOKUP` (2-Way & reverse), `FILTER`, `UNIQUE`, `LET`, #hl-g[Excel Dynamic Grid Visual] & `SUMIFS`.],

        [#box(fill: rtech-excel, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 4]]],
        [#text(weight: "bold", fill: rtech-excel)[Excel Shortcuts & Power Query]],
        [Top 30 high-speed MIS hotkeys + 6-step automated ETL data reshaping pipeline (Unpivot, Merge, Load).],

        [#box(fill: rtech-ppt, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 5]]],
        [#text(weight: "bold", fill: rtech-ppt)[PowerPoint Corporate Decks]],
        [Slide Master brand locking, 16:9 ratio, #hl-o[Slide Master & Morph Visual] (`!!Logo`), and 16 presenter keys.],

        [#box(fill: rtech-outlook, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 6]]],
        [#text(weight: "bold", fill: rtech-outlook)[Outlook Enterprise Setup & 4D]],
        [Corporate account config, 4D Inbox Zero protocol (Do, Delegate, Defer, Delete), Rules & Scheduling.],

        [#box(fill: rtech-blue, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 7]]],
        [#text(weight: "bold", fill: rtech-blue)[Cloud, OneDrive & Ethics]],
        [M365 Online benefits, 1TB OneDrive sync, file version restore, #hl-b[Cloud Governance Visual] & workplace ethics.],

        [#box(fill: rgb("#047857"), inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 8]]],
        [#text(weight: "bold", fill: rgb("#047857"))[Author Hub & MNC Interview]],
        [Rahul Patel profile, 4 scannable QR hubs (Portfolio, YouTube, Insta, WhatsApp) + Top 5 MNC MIS Q&A.],
      )
    ]
  )

  #v(3pt)

  // Bottom 4-Pillar Stats
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 5pt,
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[100+]\
        #text(size: 6pt, weight: "bold", fill: rtech-excel)[Hotkeys & Hot-keys]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[35+]\
        #text(size: 6pt, weight: "bold", fill: rtech-blue)[Dynamic Formulas]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[4 BLUEPRINTS]\
        #text(size: 6pt, weight: "bold", fill: rtech-word)[Visual Snapshots]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[100%]\
        #text(size: 6pt, weight: "bold", fill: rgb("#047857"))[MNC Placement Ready]
      ]
    ]
  )
]

#pagebreak()

// =============================================================================
// PAGE 02: MICROSOFT WORD 365: LEGAL STYLES & SHORTCUTS (ENGLISH)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[Word 365: Corporate Legal Architecture, Section Breaks & Cheatsheet]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[Flawless Multi-Page Formatting · Landscape Page Insertion · Automated Mail Merge · Top 16 Hotkeys]
]

#section-banner(num: "POINT 01", title: "Heading Styles & Multilevel Numbering (Preventing Numbering Breakdown)", color: rtech-word)

#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Structural Pillar],
  text(size: 6.8pt, weight: "bold", fill: white)[Enterprise Protocol & Why It Matters],
  text(size: 6.8pt, weight: "bold", fill: white)[Exact Setup Path in Word 365],

  [#text(weight: "bold", fill: rtech-word)[1. Heading 1, 2, 3 Linkage]],
  [Never type numbers manually! Link multilevel lists directly to Heading styles to prevent broken numbering in 100+ page contracts.],
  [#kbd[Multilevel List] $->$ #kbd[Define New Multilevel List] $->$ #kbd[More] $->$ #hl-y[Link level to style: Heading 1]. Repeat for levels 2 and 3.],

  [#text(weight: "bold", fill: rtech-blue)[2. Automatic Table of Contents]],
  [Generate and refresh dynamic TOC with perfect page dots without manual typing.],
  [#text(weight: "bold")[References $->$ Table of Contents $->$ Automatic Table 1]. Tap #kbd[F9] to update numbers and headings instantly.],

  [#text(weight: "bold", fill: rtech-emerald)[3. Navigation Pane Reordering]],
  [Restructure massive reports by simply dragging headings up and down in real-time.],
  [Press #kbd[Ctrl + F] $->$ select #kbd[Headings]. Drag heading titles up or down to reorganize entire document sections without copy-paste!],
)

#v(1.5pt)
// Authentic Visual Snapshot: Word Document Architecture
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/word_document_layout_visual.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "MS Word Production Shortcut Cheatsheet (Top 16 Daily Hotkeys)", color: rtech-word)

#table(
  columns: (1.1fr, 1.4fr, 1.1fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.6pt,

  text(size: 6.6pt, weight: "bold", fill: white)[Shortcut Key],
  text(size: 6.6pt, weight: "bold", fill: white)[Operational Function],
  text(size: 6.6pt, weight: "bold", fill: white)[Shortcut Key],
  text(size: 6.6pt, weight: "bold", fill: white)[Operational Function],

  [#kbd[Ctrl + Shift + C / V]], [Format Painter Copy / Paste styles],
  [#kbd[Shift + F3]], [Cycle text case (UPPER $->$ lower $->$ Title)],
  [#kbd[Ctrl + Enter]], [Insert clean Page Break],
  [#kbd[Alt + Shift + D]], [Insert dynamic Current Date],
  [#kbd[Ctrl + F]], [Open Headings Navigation & Search Pane],
  [#kbd[Ctrl + H]], [Open Find & Replace dialog box],
  [#kbd[Ctrl + K]], [Insert Hyperlink],
  [#kbd[Ctrl + E] / #kbd[Ctrl + L]], [Center Align / Left Align paragraph],
  [#kbd[Ctrl + J]], [Justify text (flawless corporate margin)],
  [#kbd[Ctrl + Shift + > / <]], [Increase / Decrease Font Size dynamically],
  [#kbd[Ctrl + Space]], [Strip manual formatting back to Normal style],
  [#kbd[Ctrl + 1] / #kbd[Ctrl + 2]], [Set Single Line Spacing / Double Spacing],
  [#kbd[F7]], [Run comprehensive Spell & Grammar Checker],
  [#kbd[Ctrl + Shift + E]], [Toggle Track Changes on / off],
  [#kbd[Alt + Shift + Up / Down]], [Move current paragraph/row up or down],
  [#kbd[Ctrl + Backspace / Del]], [Delete previous word / delete next word],
)

#pagebreak()

// =============================================================================
// PAGE 03: MODERN EXCEL 365: ADVANCE FORMULA CHEATSHEET (ENGLISH)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[Excel 365: Advanced Formula Engine & Dynamic Calculations Cheatsheet]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[Spilled Ranges (`#`) · Two-Way Matrix XLOOKUP · LET 5x Engine · Text Transformers & Logic]
]

#section-banner(num: "POINT 01", title: "XLOOKUP Mastery (Full Replacement for VLOOKUP, HLOOKUP & INDEX-MATCH)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Function & Syntax],
  text(size: 6.8pt, weight: "bold", fill: white)[Production Corporate Scenario],
  text(size: 6.8pt, weight: "bold", fill: white)[Senior Pro-Tip & Strategic Advantage],

  [#text(weight: "bold", fill: rtech-excel)[1. `=XLOOKUP(...)`\ #text(size: 5.6pt)[(lkp, lkp_arr, ret_arr, [if_nf], [match], [search])]]],
  [Retrieve employee salary by ID without counting columns:\
  #hl-g[`=XLOOKUP(F2, A2:A500, D2:D500, "Not Found")`]],
  [#hl-y[Exact Match by default]. Can look to the left. Inserting new columns never breaks your formula!],

  [#text(weight: "bold", fill: rtech-excel)[2. Multi-Column Spill]],
  [Extract Name, Dept, and CTC simultaneously:\
  #hl-g[`=XLOOKUP(F2, A2:A500, B2:D500)`]],
  [1 single formula spills across all 3 columns automatically, eliminating redundant lookup functions.],

  [#text(weight: "bold", fill: rtech-blue)[3. 2-Way Matrix Lookup\ (2D Grid Lookup)]],
  [Find price by Product (Row) and Region (Col):\
  #hl-b[`=XLOOKUP(A10, A2:A6, XLOOKUP(B9, B1:F1, B2:F6))`]],
  [Replaces complex legacy `=INDEX(..., MATCH(), MATCH())` with clean, nested dynamic calculations.],

  [#text(weight: "bold", fill: rtech-muted)[4. Reverse Search\ (`search_mode = -1`)]],
  [Retrieve latest invoice date for a client:\
  #hl-g[`=XLOOKUP(G2, Cust_Col, Date_Col, , 0, -1)`]],
  [Scans bottom-to-top without re-sorting database, ensuring instantaneous latest-record extraction.],
)

#v(1.5pt)
// Authentic Visual Snapshot: Excel Dynamic Array Grid & Formula Bar
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/excel_dynamic_array_grid.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "Modern Text Transformers, Multi-Condition Aggregation & LET Engine", color: rtech-excel)

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Function],
  text(size: 6.8pt, weight: "bold", fill: white)[Syntax & Formula Implementation],
  text(size: 6.8pt, weight: "bold", fill: white)[Production Outcome & Best Practice],

  [#text(weight: "bold", fill: rtech-excel)[1. `TEXTSPLIT`]],
  [#hl-g[`=TEXTSPLIT(A2, ",", ";")`]],
  [Splits comma/semicolon delimited strings into rows and columns instantly.],

  [#text(weight: "bold", fill: rtech-excel)[2. `TEXTBEFORE` / `AFTER`]],
  [#hl-g[`=TEXTBEFORE(A2, "@")`] / #hl-b[`=TEXTAFTER(A2, "@")`]],
  [Extracts username (`rahul.patel`) and company domain (`rtechlab.com`) without complex `FIND` math.],

  [#text(weight: "bold", fill: rtech-blue)[3. `FILTER` + `UNIQUE`]],
  [#hl-b[`=SORT(UNIQUE(FILTER(A2:A100, B2:B100="Completed")))`]],
  [Extracts deduplicated client list matching conditions and sorts A-Z in real-time without pivot tables.],

  [#text(weight: "bold", fill: rtech-ppt)[4. `LET` (5x Speed Engine)]],
  [#hl-o[`=LET(rev, D2:D100, cost, E2:E100, m, (rev-cost)/rev, IF(m>0.2, "High", "Low"))`]],
  [#hl-y[Boosts calculation speed by 500%]. Declares intermediate variables so Excel calculates them only once.],

  [#text(weight: "bold", fill: rtech-excel)[5. `SUMIFS` / `COUNTIFS`]],
  [#hl-g[`=SUMIFS(Sales, Region, "West", Date, ">=2027-01-01")`]],
  [Sum_Range comes first! Enclose comparison operators in quotes (`">=2027-01-01"`). Clean multi-criteria aggregation.],
)

#pagebreak()

// =============================================================================
// PAGE 04: EXCEL SHORTCUTS & POWER QUERY (ETL) PIPELINE (ENGLISH)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[Excel 365: Top 30 High-Speed Hotkeys & Power Query (ETL) Pipeline]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[Essential Accounting Hotkeys · 6-Stage Automated ETL Pipeline · Zero-VBA Monthly Refresh]
]

#section-banner(num: "POINT 01", title: "Top 30 High-Speed Keyboard Shortcuts for Accountants & MIS Executives", color: rtech-excel)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.65pt + dark-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 2.8pt,

      text(size: 6.6pt, weight: "bold", fill: white)[Shortcut Key],
      text(size: 6.6pt, weight: "bold", fill: white)[Operational Function],

      [#kbd[Ctrl + T]], [Convert selected range to official Excel Table],
      [#kbd[Ctrl + Alt + V] $->$ #kbd[V]], [Paste Values only (strip dynamic formulas)],
      [#kbd[Alt + =]], [Instant AutoSum (`SUM` formula injection)],
      [#kbd[F4]], [Cycle absolute cell references (`\$A\$1` to `A1`)],
      [#kbd[Ctrl + 1]], [Open Format Cells dialog box],
      [#kbd[Alt + H + O + I]], [Auto-fit Column Widths across selection],
      [#kbd[Ctrl + Arrow Keys]], [Jump to edge of continuous data region],
      [#kbd[Ctrl + Shift + Arrow]], [Select entire data range to contiguous edge],
      [#kbd[Ctrl + D] / #kbd[Ctrl + R]], [Fill Down / Fill Right from top/left cell],
      [#kbd[Ctrl + E]], [Trigger Flash Fill pattern auto-detection],
      [#kbd[Ctrl + ~]], [Toggle formula auditing view across entire sheet],
      [#kbd[Ctrl + ;] / #kbd[Ctrl + Shift + :]], [Insert today's Date / current Timestamp],
      [#kbd[Shift + Space]], [Select entire current Row],
      [#kbd[Ctrl + Space]], [Select entire current Column],
      [#kbd[Ctrl + -] / #kbd[Ctrl + Shift + +]], [Delete selected row/col / Insert new row/col],
    )
  ],
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.65pt + dark-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 2.8pt,

      text(size: 6.6pt, weight: "bold", fill: white)[Shortcut Key],
      text(size: 6.6pt, weight: "bold", fill: white)[Operational Function],

      [#kbd[Alt + A + C]], [Clear all applied Data Filters across table],
      [#kbd[Alt + H + V + E]], [Paste Transpose (swap rows and columns)],
      [#kbd[F2]], [Enter direct in-cell formula edit mode],
      [#kbd[Alt + Enter]], [Start new line within the same cell],
      [#kbd[Ctrl + F1]], [Collapse or expand the Office Ribbon menu],
      [#kbd[Ctrl + PageDown / Up]], [Navigate to next / previous sheet tab],
      [#kbd[Ctrl + K]], [Insert Hyperlink dialog],
      [#kbd[Ctrl + Shift + L]], [Toggle AutoFilter dropdown arrows on/off],
      [#kbd[F12]], [Open Save As window directly],
      [#kbd[Ctrl + W] / #kbd[Ctrl + N]], [Close active workbook / Open new workbook],
      [#kbd[Alt + N + V]], [Create new Pivot Table from selected range],
      [#kbd[Ctrl + 5]], [Apply or remove Strikethrough text formatting],
      [#kbd[Shift + F2]], [Insert or edit Cell Note / Comment],
      [#kbd[Alt + H + M + C]], [Merge & Center selected cells],
      [#kbd[Ctrl + Shift + \$]], [Apply Indian Rupee / Currency number format],
    )
  ]
)

#section-banner(num: "POINT 02", title: "Power Query (ETL): 6-Stage Automated Enterprise Data Reshaping Pipeline", color: rtech-blue)

#table(
  columns: (0.7fr, 1.4fr, 2.5fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Stage],
  text(size: 6.8pt, weight: "bold", fill: white)[Pipeline Action],
  text(size: 6.8pt, weight: "bold", fill: white)[Under-the-Hood Transformation],
  text(size: 6.8pt, weight: "bold", fill: white)[Production Advantage],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[01]]],
  [#text(weight: "bold", fill: rtech-blue)[Extract (Connect)]],
  [Connect via #text(weight: "bold")[Data $->$ Get Data] to CSV, Excel folder, SQL database, or SAP dump.],
  [Consolidates disparate branch files into 1 stream.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[02]]],
  [#text(weight: "bold", fill: rtech-blue)[Promote & Filter]],
  [Promote row 1 to headers; filter out null rows and redundant subtotal lines with 1 click.],
  [Permanently eliminates manual report scrubbing.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[03]]],
  [#text(weight: "bold", fill: rtech-emerald)[#hl-y[Unpivot Columns]]],
  [Select ID columns $->$ click #text(weight: "bold")[Unpivot Other Columns]. Flattens wide monthly tables (Jan, Feb...) into 2 normalized database columns.],
  [#hl-g[#1 Power Query skill]! Enables perfect dynamic Pivot Tables & Power BI dashboards.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[04]]],
  [#text(weight: "bold", fill: rtech-blue)[Transform Data]],
  [Split text by delimiter, trim leading spaces, and enforce strict data types (Date, Currency, Integer).],
  [Guarantees clean calculations with zero `#VALUE!` errors.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[05]]],
  [#text(weight: "bold", fill: rtech-ppt)[Merge Queries]],
  [Execute Left Outer Join between Sales Table and Customer Master using CustomerID key.],
  [Robust automated replacement for VLOOKUP across millions of rows.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[06]]],
  [#text(weight: "bold", fill: rtech-excel)[Close & Load]],
  [Load clean data to Excel sheet or directly to #text(weight: "bold")[PowerPivot Data Model] without bloating file size.],
  [#hl-y[Next month just click 'Refresh All']—entire report updates in 5 seconds!],
)

#pagebreak()

// =============================================================================
// PAGE 05: POWERPOINT 365: SLIDE MASTER, MORPH & SHORTCUTS (ENGLISH)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[PowerPoint 365: Executive Pitch Decks, Slide Master & Morph Cheatsheet]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[Corporate Brand Locks (16:9) · Cinematic Morph Animations (`!!`) · Top 16 Presenter Hotkeys]
]

#section-banner(num: "POINT 01", title: "Slide Master Architecture: Locking Corporate Branding Across Teams", color: rtech-ppt)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Structural Pillar],
  text(size: 6.8pt, weight: "bold", fill: white)[Implementation Blueprint],
  text(size: 6.8pt, weight: "bold", fill: white)[Enterprise Governance Advantage],

  [#text(weight: "bold", fill: rtech-ppt)[1. Slide Master Access]],
  [Go to #text(weight: "bold")[View $->$ Slide Master]. Configure company logo, typography, and palette on the topmost master slide.],
  [Locks logos and background graphics; presenters cannot accidentally displace or delete corporate assets.],

  [#text(weight: "bold", fill: rtech-blue)[2. Custom Placeholders]],
  [Use #kbd[Insert Placeholder] to define designated image, chart, and text containers with pre-calibrated padding.],
  [Colleagues simply click #hl-y['Click to add picture']—slide composition stays pixel-perfect!],

  [#text(weight: "bold", fill: rtech-emerald)[3. Widescreen Standard (16:9)]],
  [Enforce #text(weight: "bold")[Widescreen 16:9] via #kbd[Design $->$ Slide Size $->$ Widescreen]. Avoid obsolete 4:3 ratios.],
  [Eliminates black vertical pillarbox bars on modern laptops, LED displays, and zoom presentations.],
)

#v(1.5pt)
// Authentic Visual Snapshot: PowerPoint Slide Master & Morph
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/powerpoint_slide_master_morph.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "PowerPoint Production Cheatsheet (Top 16 Presenter & Designer Hotkeys)", color: rtech-ppt)

#table(
  columns: (1.1fr, 1.4fr, 1.1fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.6pt,

  text(size: 6.6pt, weight: "bold", fill: white)[Shortcut Key],
  text(size: 6.6pt, weight: "bold", fill: white)[Operational Function],
  text(size: 6.6pt, weight: "bold", fill: white)[Shortcut Key],
  text(size: 6.6pt, weight: "bold", fill: white)[Operational Function],

  [#kbd[Ctrl + D]], [Duplicate selected object or entire active slide],
  [#kbd[Shift + Drag]], [Constrain shape to perfect circle, square, or line],
  [#kbd[Ctrl + Shift + G]], [Ungroup complex multi-element shapes],
  [#kbd[Ctrl + G]], [Group selected objects into single manageable unit],
  [#kbd[F5]], [Launch full-screen presentation from Slide 1],
  [#kbd[Shift + F5]], [Launch presentation from currently selected slide],
  [#kbd[B] (during show)], [Black out screen (redirects room focus to speaker)],
  [#kbd[W] (during show)], [White out screen (draw audience to physical board)],
  [#kbd[Ctrl + L] (during show)], [Transform cursor into live laser pointer],
  [#kbd[Ctrl + P] (during show)], [Activate live Pen tool for on-slide annotations],
  [#kbd[Ctrl + E] (during show)], [Erase specific annotations drawn on slide],
  [#kbd[Alt + F10]], [Open Selection Pane (reorder object layers)],
  [#kbd[Ctrl + Shift + C/V]], [Copy shape format / Paste style to another object],
  [#kbd[Alt + Shift + Left/Right]], [Promote / Demote bullet point hierarchy level],
  [#kbd[Ctrl + Up / Down]], [Move selected slide up or down in deck view],
  [#kbd[Esc]], [Instantly end slide show and return to editor],
)

#pagebreak()

// =============================================================================
// PAGE 06: OUTLOOK ENTERPRISE SETUP & INBOX ZERO (ENGLISH)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[Outlook 365: Enterprise Account Setup, 4D Inbox Zero & Calendar Management]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[Corporate Account Configuration · 4D Email Triage System · Automated Rules & Quick Steps · Top 15 Hotkeys]
]

#section-banner(num: "POINT 01", title: "Enterprise Account Setup: Exchange Server vs IMAP/POP3 Architecture", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Protocol / Feature],
  text(size: 6.8pt, weight: "bold", fill: white)[Architectural Behavior & Setup],
  text(size: 6.8pt, weight: "bold", fill: white)[Enterprise Recommendation],

  [#text(weight: "bold", fill: rtech-outlook)[1. Microsoft Exchange / M365]],
  [Full bi-directional synchronization of #hl-y[Emails, Calendars, Contacts, and Tasks] across all desktop and mobile devices via ActiveSync.],
  [#hl-g[Corporate Gold Standard]. Enables team scheduling, shared mailboxes, and server-side rules.],

  [#text(weight: "bold", fill: rtech-blue)[2. IMAP (Internet Message)]],
  [Syncs emails across devices in folders; however, #text(weight: "bold")[calendars and contacts remain local] (`.ost` file on computer).],
  [Suitable for personal accounts (Gmail, Yahoo); suboptimal for corporate team coordination.],

  [#text(weight: "bold", fill: rtech-muted)[3. POP3 (Legacy Architecture)]],
  [Downloads emails to one local PC (`.pst`) and deletes from server by default. No sync across phone or web.],
  [#hl-o[Avoid in modern workplaces]. Causes fragmented communication and high risk of email data loss.],
)

#section-banner(num: "POINT 02", title: "The Corporate 4D Email Triage Formula for Inbox Zero", color: rtech-outlook)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rtech-blue)[1. DO IT (< 2 MINS)]\
      #v(1.5pt)
      If an email requires under 2 minutes to answer, #hl-y[execute it immediately]. Do not postpone quick tasks.
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rtech-excel)[2. DELEGATE]\
      #v(1.5pt)
      Forward to the accountable owner with deadline. Place a copy in your #kbd[\@WaitingFor] folder.
    ]
  ],
  [
    #block(fill: rgb("#FEF3C7"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#B45309"))[3. DEFER (CALENDAR)]\
      #v(1.5pt)
      If task requires > 15 mins, drag email to #kbd[Calendar] icon to book a dedicated time block.
    ]
  ],
  [
    #block(fill: rgb("#FFE4E6"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#E11D48"))[4. DELETE / ARCHIVE]\
      #v(1.5pt)
      Informational newsletters and resolved threads. Tap #kbd[Backspace] to archive. Keep inbox clear.
    ]
  ],
)

#section-banner(num: "POINT 03", title: "Quick Steps, Automated Rules & Outlook Shortcut Cheatsheet", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Power Feature],
  text(size: 6.8pt, weight: "bold", fill: white)[Configuration Blueprint],
  text(size: 6.8pt, weight: "bold", fill: white)[Daily Strategic Shortcut],

  [#text(weight: "bold", fill: rtech-outlook)[1. Quick Steps Automation]],
  [Home $->$ Quick Steps $->$ New. Combine 3 actions into 1 click: Mark Read + Move to Archive folder + Flag for follow-up.],
  [Assign hotkey #kbd[Ctrl + Shift + 1] to process incoming status updates in under 1 second!],

  [#text(weight: "bold", fill: rtech-blue)[2. Server-Side Rules]],
  [Home $->$ Rules $->$ Create Rule. Route automated server alerts, invoices, or bank OTPs into specific subfolders.],
  [Keeps main Inbox dedicated purely to high-priority human conversations.],

  [#text(weight: "bold", fill: rtech-emerald)[3. Scheduling Assistant]],
  [New Meeting $->$ Scheduling Assistant. Displays free/busy blocks of all internal attendees side-by-side.],
  [Permanently eliminates endless "When are you free for a call?" email exchanges.],

  [#text(weight: "bold", fill: rtech-navy)[4. Essential Outlook Keys]],
  [#kbd[Ctrl+Shift+M] (New Mail) · #kbd[Ctrl+N] (New Item) · #kbd[Ctrl+R] (Reply) · #kbd[Ctrl+Shift+R] (Reply All)],
  [#kbd[Ctrl+1] (Mail) · #kbd[Ctrl+2] (Calendar) · #kbd[Ctrl+3] (People) · #kbd[Backspace] (One-Touch Archive)],
)

#pagebreak()

// =============================================================================
// PAGE 07: MICROSOFT 365 CLOUD, ONEDRIVE & WORKPLACE ETHICS (ENGLISH)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[Microsoft 365: Cloud Collaboration, OneDrive Governance & Workplace Ethics]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[Real-Time Co-Authoring · 1TB OneDrive Storage · Historical Version Rollback · Enterprise Data Ethics]
]

#section-banner(num: "POINT 01", title: "Benefits of Microsoft 365 Online & Cloud vs Desktop Ecosystem", color: rtech-blue)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Cloud Advantage],
  text(size: 6.8pt, weight: "bold", fill: white)[Operational Mechanism in M365],
  text(size: 6.8pt, weight: "bold", fill: white)[Business Benefit & Productivity Lift],

  [#text(weight: "bold", fill: rtech-blue)[1. Real-Time Co-Authoring]],
  [Multiple colleagues work simultaneously on the same Excel or Word file stored in OneDrive/SharePoint. Colored presence flags show cursor positions.],
  [Completely eliminates emailing `Report_Final_v2_edit.xlsx` attachments back and forth!],

  [#text(weight: "bold", fill: rtech-emerald)[2. Continuous AutoSave]],
  [AutoSave toggle on top-left saves every keystroke directly to cloud storage in real-time.],
  [Zero data loss during unexpected PC crashes, battery drainage, or power failures.],

  [#text(weight: "bold", fill: rtech-ppt)[3. Cross-Platform Accessibility]],
  [Open and edit full office files via web browser (#link("https://office.com")[*office.com*]) on MacBook, iPad, Linux, or smartphone.],
  [Enables immediate critical document approvals and edits while traveling or working remotely.],

  [#text(weight: "bold", fill: rtech-word)[4. Web vs Desktop Synergy]],
  [Excel Online runs lightweight formulas, co-authoring, and TypeScript Office Scripts. Desktop app runs heavy PowerPivot & VBA.],
  [Use Online for team collaboration; switch to Desktop for heavy financial modeling with 1 click.],
)

#v(1.5pt)
// Authentic Visual Snapshot: Cloud Ecosystem & 4D Triage
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/outlook_cloud_workflow_visual.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "Workplace Collaboration Ethics & Corporate Data Governance", color: rtech-emerald)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Ethical Standard],
  text(size: 6.8pt, weight: "bold", fill: white)[Professional Practice Rule],
  text(size: 6.8pt, weight: "bold", fill: white)[Common Unprofessional Pitfall to Avoid],

  [#text(weight: "bold", fill: rtech-navy)[1. Standardized File Naming]],
  [Use strict ISO structure: `YYYY-MM-DD_Client_Project_v1.0.xlsx`. Always increment version numbers on major milestones.],
  [Never save files as `Final.xlsx`, `Final_final2.xlsx`, or `test123.xlsx`. Destroys team audit trails.],

  [#text(weight: "bold", fill: rtech-emerald)[2. Data Privacy & Confidentiality]],
  [Never share internal financial statements, salary sheets, or customer databases via public 'Anyone' links.],
  [Accidental public indexing leads to severe corporate data breaches and statutory non-compliance fines.],

  [#text(weight: "bold", fill: rtech-blue)[3. Professional Email Etiquette]],
  [Use descriptive subjects (`Action Req: Q3 Budget Review by 5 PM`). Reserve 'Reply All' strictly for critical team updates.],
  [Never write emails in anger; never use ALL CAPS (reads as shouting); always respect BCC for bulk external communications.],
)

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB & MNC INTERVIEW VAULT (ENGLISH)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[RTECHLAB Author Mentorship Hub & MNC Interview Vault]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[Official Author Profile · Direct Portfolio & Social Communities · Top 5 MNC Technical Interview Q&A]
]

#section-banner(num: "POINT 01", title: "Author Profile: Rahul Patel — Founder & Senior Technical Expert", color: rtech-navy)

#block(
  width: 100%,
  stroke: 0.65pt + dark-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: 5pt,
  [
    #grid(
      columns: (56pt, 1fr),
      gutter: 7pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-blue,
          radius: 5pt,
          clip: true,
          width: 50pt,
          height: 60pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 9.5pt, weight: "black", fill: rtech-navy)[Rahul Patel]\
        #v(0.5pt)
        #text(size: 6.8pt, weight: "bold", fill: rtech-blue)[Founder & Lead Systems Architect · RTechLab Publications]\
        #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[Director & Senior Technical Expert · IANT COMPUTER EDUCATION, PALANPUR]\
        #v(1.5pt)
        #text(size: 6.5pt, fill: rtech-navy)[
          With *10+ years of intensive corporate IT infrastructure, networking, and systems training experience*, Rahul has mentored *over 3,000 students* across Gujarat and India into careers at multinational IT and accounting firms. He created the ₹22 Desk Reference series to democratize world-class technical education at a price accessible to every ambitious student.
        ]
      ]
    )
  ]
)

#section-banner(num: "POINT 02", title: "Author Portfolio, YouTube, Instagram & Community Direct Access Hub", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [
    #block(
      stroke: 0.65pt + dark-border,
      fill: rgb("#F0F9FF"),
      radius: 4pt,
      inset: 3.5pt,
      [
        #align(center)[
          #box(height: 48pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 48pt)]
          #v(1.5pt)
          #text(size: 6.6pt, weight: "black", fill: rtech-blue)[Author Portfolio]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.65pt + dark-border,
      fill: rgb("#FFF1F2"),
      radius: 4pt,
      inset: 3.5pt,
      [
        #align(center)[
          #box(height: 48pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 48pt)]
          #v(1.5pt)
          #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[YouTube Channel]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.65pt + dark-border,
      fill: rgb("#FDF2F8"),
      radius: 4pt,
      inset: 3.5pt,
      [
        #align(center)[
          #box(height: 48pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 48pt)]
          #v(1.5pt)
          #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[Instagram Hub]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.65pt + dark-border,
      fill: rgb("#F0FDF4"),
      radius: 4pt,
      inset: 3.5pt,
      [
        #align(center)[
          #box(height: 48pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 48pt)]
          #v(1.5pt)
          #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[WhatsApp Community]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[Free Community Access ↗]]
        ]
      ]
    )
  ],
)

#section-banner(num: "POINT 03", title: "Top 5 Corporate MNC Technical Interview Questions & Senior Model Answers", color: rtech-excel)

#table(
  columns: (2.2fr, 3.8fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Technical Interview Question (MNC Level)],
  text(size: 6.8pt, weight: "bold", fill: white)[Senior Executive Model Answer],

  [#text(weight: "bold", fill: rtech-navy)[Q1: Why is XLOOKUP superior to VLOOKUP & INDEX-MATCH?]],
  [XLOOKUP defaults to exact match, searches in any direction (left/right/up/down), returns multi-column arrays, handles missing values gracefully with `[if_not_found]`, and never breaks when intervening columns are inserted.],

  [#text(weight: "bold", fill: rtech-navy)[Q2: When should Section Breaks be used instead of Page Breaks?]],
  [A Page Break only wraps text to the next page while keeping header/footer and page orientation locked. A Section Break creates an independent structural partition, enabling landscape orientation within portrait documents and unique headers.],

  [#text(weight: "bold", fill: rtech-navy)[Q3: What is the primary role of 'Unpivot Columns' in Power Query?]],
  [It normalizes wide cross-tabulated tables (months as columns) into a canonical 2-column database format (Attribute & Value). This normalization is mandatory for building scalable Pivot Tables, Power BI data models, and DAX measures.],

  [#text(weight: "bold", fill: rtech-navy)[Q4: How does Morph differ from traditional slide animations?]],
  [Traditional animations require manual motion paths on individual elements. Morph compares two slides and automatically animates matching or name-tagged (`!!Logo`) shapes smoothly across position, scale, and color dimensions.],

  [#text(weight: "bold", fill: rtech-navy)[Q5: What is the 4D rule of Inbox Zero in corporate communication?]],
  [Do it immediately if < 2 mins; Delegate to the accountable colleague with a deadline; Defer to the calendar for deep-work scheduling; Delete/Archive all informational threads to keep the active inbox empty.],
)

#v(1.5pt)
#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 0.8pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 2.5pt),
    text(size: 6.6pt, weight: "bold", fill: rtech-blue)[
      🚀 Want the complete 113-page in-depth textbook and 6 real-world Excel practice templates (.xlsx)? Upgrade to the ₹49 Master Book or ₹149 Career Accelerator Suite at #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]
    ]
  )
]
'''

typ_en_path = os.path.join(SOURCE_DIR, "office_365_cheat_sheet_22rs_en.typ")
with open(typ_en_path, "w", encoding="utf-8") as f:
    f.write(typ_en)

pdf_en_path = os.path.join(OUTPUT_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf")
pub_en_path = os.path.join(DOWNLOADS_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf")

print("Compiling English PDF...")
res = subprocess.run(["typst", "compile", typ_en_path, pdf_en_path], capture_output=True, text=True)
if res.returncode != 0:
    print("Compilation error:\n", res.stderr)
    exit(1)

doc = fitz.open(pdf_en_path)
print(f"=== ENGLISH VERIFICATION: Total Pages = {len(doc)} ===")
doc.close()
shutil.copy2(pdf_en_path, pub_en_path)
print("Copied English to public/downloads/")
