import os
import shutil
import subprocess
import fitz  # PyMuPDF
from pypdf import PdfReader

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SOURCE_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\07_SOURCE_FILES")
ASSETS_DIR = os.path.join(SOURCE_DIR, "02_BRAND_ASSETS")
OUTPUT_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION")
PREVIEWS_DIR = os.path.join(OUTPUT_DIR, "previews_en")
os.makedirs(SOURCE_DIR, exist_ok=True)
os.makedirs(ASSETS_DIR, exist_ok=True)
os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(PREVIEWS_DIR, exist_ok=True)

# Ensure brand images are inside 02_BRAND_ASSETS
shutil.copy(os.path.join(BASE_DIR, r"public\brand\rahul-patel.jpg"), os.path.join(ASSETS_DIR, "rahul-patel.jpg"))
shutil.copy(os.path.join(BASE_DIR, r"public\brand\favicon-32x32.png"), os.path.join(ASSETS_DIR, "favicon-32x32.png"))

typ_path = os.path.join(SOURCE_DIR, "office_365_cheat_sheet_22rs_en.typ")
pdf_path = os.path.join(OUTPUT_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf")
public_pdf = os.path.join(BASE_DIR, r"public\downloads\Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf")

typst_content = r'''// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE PRODUCTIVITY DESK CHEAT SHEET (ENGLISH)
// Exactly 8 Pages · Printable Daily Desk Companion · Edition 1
// Author: Rahul Patel (Founder & Lead Systems Architect, RTechLab)
// Official Portal: https://rtechlab.com
// =============================================================================

#set document(
  title: "Microsoft 365 Enterprise Desk Reference & Cheat Sheet (English)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 11mm, bottom: 9mm, left: 9.5mm, right: 9.5mm),
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 11pt, baseline: 1pt)[#image("02_BRAND_ASSETS/favicon-32x32.png", height: 11pt)]
          #h(4pt)
          #text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 8pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 Enterprise Daily Desk Reference & Cheat Sheet]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#107C41"))[Word · Excel · PPT · Outlook · Cloud]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · Rahul Patel]
        ]
      )
      #v(1.5pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.4pt + rgb("#E2E8F0"))
      #v(2.5pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.8pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] Technology Made Practical · Print & Keep on Your Office Desk · Free Tools: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 6pt, y: 1.5pt),
            text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Segoe UI", "Arial"),
  size: 7.4pt,
  fill: rgb("#1E293B"),
  spacing: 100%
)

#set par(
  justify: true,
  leading: 0.44em,
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
#let rtech-muted = rgb("#64748B")
#let rtech-border = rgb("#E2E8F0")

// Reusable UI Macros
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-o(body) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#body]]
#let kbd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#CBD5E1"), radius: 2pt, inset: (x: 3pt, y: 1pt))[#text(size: 6.8pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-blue) = {
  v(2.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3pt + color, rest: 0.4pt + rtech-border),
    radius: (right: 3pt),
    inset: (x: 6pt, y: 3.5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 4.5pt, y: 1.5pt),
            text(size: 6.5pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 8.8pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(2pt)
}

// =============================================================================
// PAGE 01: THE EXECUTIVE MASTER COVER PAGE (BRANDING & MINDSET BLUEPRINT)
// =============================================================================

#align(center)[
  #v(2pt)
  #text(size: 9pt, weight: "black", tracking: 2pt, fill: rtech-blue)[RTECHLAB VOCATIONAL LEARNING SYSTEMS]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[Technology Made Practical · Gujarat #1 Vocational Architecture Track · Edition 1]
  #v(2pt)
  #line(length: 100%, stroke: 0.8pt + rgb("#E2E8F0"))
  #v(5pt)

  // Author & Institute Tagline
  #text(size: 11pt, weight: "black", fill: rtech-navy)[Authored by Rahul Patel]\
  #v(1pt)
  #text(size: 7.8pt, fill: rtech-muted)[
    Director & Senior Technical Expert, IANT Computer Education, Palanpur · 10+ Yrs IT Experience · 3,000+ Students Mentored
  ]

  #v(6pt)
  #line(length: 22%, stroke: 1.5pt + rtech-blue)
  #v(6pt)

  // Microsoft 365 Official Suite Visual
  #image("02_BRAND_ASSETS/microsoft_365_official_suite_logo.png", width: 92%)

  #v(6pt)

  // Bestseller Bold Title
  #text(size: 22pt, font: ("Segoe UI", "Arial"), weight: "black", fill: rtech-navy, tracking: 0.5pt)[
    MICROSOFT 365 ENTERPRISE
  ]
  #v(2pt)
  #text(size: 12pt, font: ("Segoe UI", "Arial"), weight: "black", fill: rtech-blue, tracking: 0.5pt)[
    The Ultimate Corporate Desk Reference & Daily Cheat Sheet
  ]
  #v(2.5pt)
  #text(size: 8pt, weight: "bold", fill: rtech-muted)[
    Advanced Excel 365 (Dynamic Arrays & XLOOKUP) · Word Corporate Styling · Executive PowerPoint · Outlook Inbox Zero · Cloud Collaboration
  ]

  #v(5pt)

  // Bestseller Seal Pill
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#38BDF8"),
    radius: 16pt,
    inset: (x: 12pt, y: 2.5pt),
    text(size: 6.8pt, weight: "black", fill: rgb("#0369A1"), tracking: 0.5pt)[
      ★ #1 DAILY DESK DESKTOP COMPANION FOR CORPORATE EXECUTIVES, DATA ANALYSTS & STUDENTS ★
    ]
  )

  #v(6pt)

  // Mindset & Compounding Growth Quotations Box (Atomic Habits & Think and Grow Rich Inspired)
  #block(
    width: 95%,
    stroke: 1.2pt + rgb("#38BDF8"),
    fill: rgb("#F0F9FF"),
    radius: 6pt,
    inset: (x: 10pt, y: 6pt),
    [
      #grid(
        columns: (1fr, 1fr),
        gutter: 10pt,
        [
          #text(size: 7.2pt, weight: "black", fill: rtech-blue)[⚡ THE COMPOUND LEVERAGE LAW (Atomic Habits Principle):]\
          #v(2pt)
          #text(size: 6.8pt, fill: rtech-navy, style: "italic")[
            "Success in modern enterprise is the product of daily micro-habits—not one-time cramming. Improving your keyboard shortcuts and formula efficiency by just 1% each day compounds into a 37x productivity advantage over a single year."
          ]
        ],
        [
          #text(size: 7.2pt, weight: "black", fill: rgb("#047857"))[🎯 APPLIED KNOWLEDGE IS POWER (Think & Grow Rich):]\
          #v(2pt)
          #text(size: 6.8pt, fill: rtech-navy, style: "italic")[
            "Whatever the mind can conceive and believe, it can achieve. Knowledge is merely potential power; it becomes true power only when organized into definite formulas, checklists, and daily workplace execution."
          ]
        ]
      )
    ]
  )

  #v(6pt)

  // 4-Pillar Key Stats Badges
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 6pt,
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[100+]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-excel)[PRO SHORTCUTS]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[35+]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-blue)[DYNAMIC FORMULAS]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[5 APPS]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-word)[ENTERPRISE SUITE]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[100%]\
          #text(size: 6.5pt, weight: "bold", fill: rgb("#047857"))[MNC PLACEMENT READY]
        ]
      )
    ]
  )

  #v(6pt)

  // Quick Multi-Page Index Directory Bar
  #block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: (x: 6pt, y: 4pt),
    [
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center,
        [#text(size: 6.5pt, weight: "bold", fill: rtech-excel)[P2: Dynamic Formulas]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-excel)[P3: Data Cleaning]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-blue)[P4: Shortcuts & PQ]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-word)[P5: Word Legal Styles]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-ppt)[P6: PPT Deck Standards]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-outlook)[P7: Outlook & Cloud]],
        [#text(size: 6.5pt, weight: "bold", fill: rgb("#047857"))[P8: Interview & Author]],
      )
    ]
  )
]

#pagebreak()

// =============================================================================
// PAGE 02: MODERN EXCEL 365 CORE FORMULA ENGINE & DYNAMIC ARRAYS
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[EXCEL 365: NEXT-GEN DYNAMIC ARRAY & LOOKUP FORMULAS]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[The Modern Calculation Engine · Spill Ranges (`#`) · Two-Way Matrix Queries · High-Speed Calculation with `LET`]
]

#section-banner(num: "FORMULA ARCHITECTURE", title: "The Modern Calculation Paradigm vs Legacy Arrays", color: rtech-excel)

#table(
  columns: (1.2fr, 2.8fr, 2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Concept / Feature],
  text(size: 7pt, weight: "bold", fill: white)[How It Works in Modern Excel 365],
  text(size: 7pt, weight: "bold", fill: white)[Legacy Excel Difference],

  [#text(weight: "bold", fill: rtech-excel)[Dynamic Array Spill]],
  [One formula written in a single cell returns multiple rows and columns automatically. The border glows with a blue spill outline.],
  [Required selecting whole range + pressing #kbd[Ctrl+Shift+Enter] (CSE).],

  [#text(weight: "bold", fill: rtech-blue)[Spilled Range Ref (`#`)]],
  [Use `=A2#` to dynamically refer to the entire output of an array formula. If the output grows, downstream formulas update instantly.],
  [Had to manually expand formula ranges across rows.],

  [#text(weight: "bold", fill: rtech-word)[#text(fill: rtech-excel)[#kbd[#`#SPILL!`]] Error]],
  [Occurs when a cell in the expected spill path is blocked by existing text, numbers, or a space. Clear blocking cells to resolve immediately.],
  [Formula would return a single truncated value or `#VALUE!`],
)

#section-banner(num: "LOOKUP POWERHOUSES", title: "XLOOKUP Mastery vs VLOOKUP / INDEX-MATCH", color: rtech-excel)

#table(
  columns: (1.3fr, 2.2fr, 2.5fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Function & Syntax],
  text(size: 7pt, weight: "bold", fill: white)[Enterprise Scenario],
  text(size: 7pt, weight: "bold", fill: white)[Pro-Tip / Advantage],

  [#text(weight: "bold", fill: rtech-excel)[`=XLOOKUP(...)`]\
  #text(size: 6.2pt, font: ("Consolas", "Segoe UI"))[(lookup, lkp_arr, ret_arr, [if_not], [match], [search])]],
  [Find employee salary by EmpID without column index counting:\
  #hl-g[`=XLOOKUP(F2, A2:A500, D2:D500, "Not Found")`]],
  [#hl-y[Exact match by default] (no `FALSE` needed!). Searches leftward, handles missing values cleanly, will never break if columns are inserted.],

  [#text(weight: "bold", fill: rtech-excel)[Multi-Column XLOOKUP]],
  [Return Name, Department, and CTC simultaneously:\
  #hl-g[`=XLOOKUP(F2, A2:A500, B2:D500)`]],
  [Spills horizontally across 3 columns in a single formula! Replaces 3 separate `VLOOKUP` calls.],

  [#text(weight: "bold", fill: rtech-blue)[Two-Way Matrix Lookup\ (2D Grid)]],
  [Find Product price across variable Region columns:\
  #hl-b[`=XLOOKUP(A10, A2:A6, XLOOKUP(B9, B1:F1, B2:F6))`]],
  [Nested XLOOKUP queries row header and column header simultaneously. 100% replaces legacy `=INDEX(..., MATCH(), MATCH())`.],

  [#text(weight: "bold", fill: rtech-muted)[Reverse Search\ (`search_mode = -1`)]],
  [Find the latest invoice date for a repeat customer:\
  #hl-g[`=XLOOKUP(G2, Cust_Col, Date_Col, , 0, -1)`]],
  [Searches bottom-up to extract the most recent transaction entry without sorting the master database.],
)

#section-banner(num: "DYNAMIC ARRAY TOOLS", title: "FILTER, UNIQUE, SORT & High-Performance LET", color: rtech-excel)

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Function],
  text(size: 7pt, weight: "bold", fill: white)[Corporate Production Formula],
  text(size: 7pt, weight: "bold", fill: white)[Output Result & Best Practice],

  [#text(weight: "bold", fill: rtech-excel)[`FILTER`]\ #text(size: 6.2pt)[Multi-criteria extract]],
  [#hl-g[`=FILTER(A2:D100, (B2:B100="IT")*(D2:D100>=50000), "No Records")`]],
  [Use `*` for AND logic; use `+` for OR logic. Automatically outputs all matching rows into a live updating table.],

  [#text(weight: "bold", fill: rtech-blue)[`UNIQUE`]\ #text(size: 6.2pt)[De-duplicate lists]],
  [#hl-b[`=SORT(UNIQUE(FILTER(C2:C100, C2:C100<>"")))`]],
  [Extracts distinct customer city names, removes blank cells, and sorts them alphabetically from A to Z in 1 line.],

  [#text(weight: "bold", fill: rtech-ppt)[`SORTBY`]\ #text(size: 6.2pt)[Custom multi-column sort]],
  [#hl-o[`=SORTBY(A2:C50, B2:B50, 1, C2:C50, -1)`]],
  [Sorts staff records primarily by Department (Ascending) and secondary by Salary (Descending).],

  [#text(weight: "bold", fill: rtech-excel)[`LET`]\ #text(size: 6.2pt)[Variable declaration]],
  [#hl-g[`=LET(rev, D2:D100, cogs, E2:E100, margin, (rev-cogs)/rev, IF(margin>0.2, "High", "Low"))`]],
  [#hl-y[Boosts calculation speed by 500%]. Defines named variables so Excel computes complex terms only once.],

  [#text(weight: "bold", fill: rtech-word)[`SEQUENCE`]\ #text(size: 6.2pt)[Serial numbers]],
  [#hl-b[`=SEQUENCE(COUNTA(A2:A100), 1, 1001, 1)`]],
  [Generates automated invoice serial numbers (1001, 1002, 1003...) that expand automatically as new records arrive.],
)

#pagebreak()

// =============================================================================
// PAGE 03: EXCEL DATA CLEANING, TEXT FUNCTIONS & CONDITIONAL LOGIC
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[EXCEL 365: CORPORATE DATA HYGIENE, TEXT SPLITTING & LOGIC]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[Zero-Flash-Fill String Extraction · Advanced Multi-Condition Aggregations · Custom Cell Formats]
]

#section-banner(num: "TEXT MANIPULATION", title: "Modern Text Functions (TEXTSPLIT, TEXTBEFORE, TEXTAFTER)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Function],
  text(size: 7pt, weight: "bold", fill: white)[Formula Syntax Example],
  text(size: 7pt, weight: "bold", fill: white)[Practical Business Usage],

  [#text(weight: "bold", fill: rtech-excel)[`TEXTBEFORE`]],
  [#hl-g[`=TEXTBEFORE(A2, "@")`]],
  [Extracts username from an email address (`rahul.patel@rtechlab.com` $->$ `rahul.patel`).],

  [#text(weight: "bold", fill: rtech-excel)[`TEXTAFTER`]],
  [#hl-g[`=TEXTAFTER(A2, "@")`]],
  [Extracts company domain name from corporate email IDs (`rtechlab.com`).],

  [#text(weight: "bold", fill: rtech-blue)[`TEXTSPLIT`]],
  [#hl-b[`=TEXTSPLIT(A2, ",", ";")`]],
  [Splits delimited comma and semi-colon strings across rows and columns simultaneously. 100% replaces manual Text-to-Columns wizard.],

  [#text(weight: "bold", fill: rtech-word)[`TEXTJOIN`]],
  [#hl-b[`=TEXTJOIN(", ", TRUE, FILTER(A2:A50, B2:B50="Pending"))`]],
  [Consolidates filtered pending ticket IDs into a single, clean comma-separated paragraph cell for executive summaries.],
)

#section-banner(num: "MULTI-CRITERIA AGGREGATIONS", title: "SUMIFS, COUNTIFS, AVERAGEIFS & Modern Logical Routing", color: rtech-excel)

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Function],
  text(size: 7pt, weight: "bold", fill: white)[Syntax & Formula],
  text(size: 7pt, weight: "bold", fill: white)[Enterprise Best Practice],

  [#text(weight: "bold", fill: rtech-excel)[`SUMIFS`]],
  [#hl-g[`=SUMIFS(Sales, Region, "West", Date, ">=2027-01-01")`]],
  [Sum_Range comes #hl-y[FIRST]. Always wrap logical comparison operators in quotes (`">=2027-01-01"`).],

  [#text(weight: "bold", fill: rtech-excel)[`COUNTIFS`]],
  [#hl-g[`=COUNTIFS(Status, "Delivered", Amount, ">10000")`]],
  [Counts high-value dispatched orders. Use wildcard `"*"` to count non-blank text cells efficiently.],

  [#text(weight: "bold", fill: rtech-blue)[`IFS`]],
  [#hl-b[`=IFS(A2>=90, "Distinction", A2>=75, "First", TRUE, "Pass")`]],
  [Evaluates sequential conditions without messy nested `IF(IF(IF()))`. Always use `TRUE` as the final fallback bucket.],

  [#text(weight: "bold", fill: rtech-word)[`SWITCH`]],
  [#hl-b[`=SWITCH(B2, 1, "Q1-North", 2, "Q2-South", 3, "Q3-East", "Other")`]],
  [Tests an expression against a list of exact matching values. Cleaner and more legible than long `IFS` chains.],
)

#section-banner(num: "NUMBER FORMATTING & DATES", title: "Corporate Custom Formatting Codes & Date Engines", color: rtech-excel)

#table(
  columns: (1.6fr, 2.4fr, 2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Custom Format Code],
  text(size: 7pt, weight: "bold", fill: white)[Display Output Format],
  text(size: 7pt, weight: "bold", fill: white)[Business Scenario],

  [#text(font: ("Consolas", "Segoe UI"))[`#,##0;[Red]-#,##0;"-";@`]],
  [Positive: `1,250` · Negative: #text(fill: red)[`-450`] · Zero: `-` · Text: `@`],
  [#hl-y[Corporate MIS Gold Standard]. Shows zero as clean dashes and highlights negative balances in red.],

  [#text(font: ("Consolas", "Segoe UI"))[`₹#,##0.00;[Red]-₹#,##0.00;"Free"`]],
  [Formats numbers as Indian Rupee amounts with decimals.],
  [Invoice billing line items and accounts receivable ledgers.],

  [#text(font: ("Consolas", "Segoe UI"))[`00000` or `+91-00000-00000`]],
  [Maintains leading zeroes for Employee IDs and PIN codes.],
  [Prevents PIN `003841` from collapsing to `3841`.],

  [#text(weight: "bold", fill: rtech-excel)[`=EOMONTH(A2, 0)`]],
  [Returns exact last calendar day of the given month.],
  [Statutory GST invoice reconciliation and payroll cutoff dates.],

  [#text(weight: "bold", fill: rtech-blue)[`=EDATE(A2, 3)`]],
  [Computes exact date 3 months forward (same calendar day).],
  [Quarterly license renewals, subscription expiries, and warranties.],
)

#pagebreak()

// =============================================================================
// PAGE 04: EXCEL SHORTCUTS MATRIX & POWER QUERY (ETL) PIPELINE
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[EXCEL 365: WORKPLACE SHORTCUTS & POWER QUERY (ETL) PIPELINE]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[Top 30 High-Velocity Office Hotkeys · Automated 6-Step Data Reshaping · Zero-VBA Automation]
]

#section-banner(num: "TOP SHORTCUTS", title: "Top 30 High-Speed Keyboard Shortcuts for Accountants & MIS", color: rtech-excel)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.35pt + rtech-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 3.2pt,

      text(size: 6.8pt, weight: "bold", fill: white)[Key Combination],
      text(size: 6.8pt, weight: "bold", fill: white)[Action Performed],

      [#kbd[Ctrl + T]], [Convert selected range to official Excel Table],
      [#kbd[Ctrl + Alt + V] $->$ #kbd[V]], [Paste as Values only (removes underlying formulas)],
      [#kbd[Alt + =]], [Instant AutoSum (`SUM` formula insertion)],
      [#kbd[F4]], [Cycle Absolute Ref (`\$A\$1` $->$ `A\$1` $->$ `\$A1` $->$ `A1`)],
      [#kbd[Ctrl + 1]], [Open Format Cells dialogue window],
      [#kbd[Alt + H + O + I]], [Auto-fit all column widths perfectly],
      [#kbd[Ctrl + Arrow Keys]], [Jump to edge of data region instantly],
      [#kbd[Ctrl + Shift + Arrows]], [Select entire contiguous dataset],
      [#kbd[Ctrl + D] / #kbd[Ctrl + R]], [Fill formula/content Down / Fill Right],
      [#kbd[Ctrl + E]], [Trigger Flash Fill pattern detection],
      [#kbd[Ctrl + ~]], [Toggle show formulas in all sheet cells],
      [#kbd[Ctrl + ;] / #kbd[Ctrl + Shift + :]], [Insert Current Date / Insert Current Time],
      [#kbd[Shift + Space]], [Select entire current Row],
      [#kbd[Ctrl + Space]], [Select entire current Column],
      [#kbd[Ctrl + -] / #kbd[Ctrl + Shift + +]], [Delete selected row/col / Insert new row/col],
    )
  ],
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.35pt + rtech-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 3.2pt,

      text(size: 6.8pt, weight: "bold", fill: white)[Key Combination],
      text(size: 6.8pt, weight: "bold", fill: white)[Action Performed],

      [#kbd[Alt + A + C]], [Clear all applied Data Filters],
      [#kbd[Alt + H + V + E]], [Paste Transpose (flip rows into columns)],
      [#kbd[F2]], [Edit current cell directly in formula mode],
      [#kbd[Alt + Enter]], [Insert new line inside a single cell],
      [#kbd[Ctrl + F1]], [Toggle ribbon visibility (expand/collapse)],
      [#kbd[Ctrl + PageDown / Up]], [Switch between worksheet tabs in workbook],
      [#kbd[Ctrl + K]], [Insert or edit a hyperlink],
      [#kbd[Ctrl + Shift + L]], [Toggle AutoFilter drop-down arrows on/off],
      [#kbd[F12]], [Save As dialogue box directly],
      [#kbd[Ctrl + W] / #kbd[Ctrl + N]], [Close current workbook / Open new workbook],
      [#kbd[Alt + N + V]], [Create new Pivot Table from selected dataset],
      [#kbd[Ctrl + 5]], [Apply or remove strikethrough styling],
      [#kbd[Shift + F2]], [Insert or edit Cell Note / Comment],
      [#kbd[Alt + H + M + C]], [Merge & Center selected cells],
      [#kbd[Ctrl + Shift + \$]], [Apply Currency Format with 2 decimals],
    )
  ]
)

#section-banner(num: "POWER QUERY (ETL)", title: "The 6-Step Automated Corporate Data Reshaping Pipeline", color: rtech-blue)

#table(
  columns: (0.7fr, 1.4fr, 2.5fr, 1.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Step],
  text(size: 7pt, weight: "bold", fill: white)[Pipeline Action],
  text(size: 7pt, weight: "bold", fill: white)[What Happens Under the Hood],
  text(size: 7pt, weight: "bold", fill: white)[Business Benefit],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[01]]],
  [#text(weight: "bold", fill: rtech-blue)[Get Data (Extract)]],
  [Connect to CSV, Excel folder, SQL DB, Web URL, or SAP exported text file via #text(weight: "bold")[Data $->$ Get Data].],
  [Single pipeline connects to disparate data sources.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[02]]],
  [#text(weight: "bold", fill: rtech-blue)[Promote Headers & Filter]],
  [Use First Row as Headers; remove empty null rows, test headers, and trailing summary totals.],
  [Eliminates manual file cleanup forever.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[03]]],
  [#text(weight: "bold", fill: rtech-emerald)[#hl-y[Unpivot Columns]]],
  [Select ID columns $->$ click #text(weight: "bold")[Unpivot Other Columns]. Transforms matrix tables (Jan, Feb, Mar...) into normalized 2-column database rows (Month, Value).],
  [#hl-g[#1 skill in Power Query]. Enables flawless Pivot Table creation.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[04]]],
  [#text(weight: "bold", fill: rtech-blue)[Split & Transform]],
  [Split columns by delimiter (hyphens, spaces); extract numbers; trim leading/trailing whitespace; set strict Data Types (Date, Currency, Integer).],
  [Prevents `#VALUE!` calculation errors.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[05]]],
  [#text(weight: "bold", fill: rtech-ppt)[Merge Queries]],
  [Perform Left Outer Join between Sales Table and Customer Master based on CustomerID.],
  [100% automated VLOOKUP replacement for millions of rows.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[06]]],
  [#text(weight: "bold", fill: rtech-excel)[Close & Load]],
  [Load cleaned output into Excel Table or directly into #text(weight: "bold")[PowerPivot Data Model] without bloating workbook file size.],
  [#hl-y[Next month: click 1 button ('Refresh All')] to update full report!],
)

#pagebreak()

// =============================================================================
// PAGE 05: MICROSOFT WORD 365: LEGAL STYLES & CORPORATE AUTOMATION
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[WORD 365: LEGAL MULTI-LEVEL NUMBERING, SECTION BREAKS & MAIL MERGE]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[Flawless Multi-page Formatting · Landscape Inclusions · Mail Merge Pipeline · Top 15 Word Keys]
]

#section-banner(num: "STYLES ARCHITECTURE", title: "Heading Hierarchy & Numbering Linkage (Solves Broken Numbering)", color: rtech-word)

#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Structural Element],
  text(size: 7pt, weight: "bold", fill: white)[Standard Corporate Rule],
  text(size: 7pt, weight: "bold", fill: white)[How to Configure in Word 365],

  [#text(weight: "bold", fill: rtech-word)[Heading 1, 2, 3 Linking]],
  [Never type numbers manually! Link multilevel list levels directly to Heading Styles.],
  [Click #kbd[Multilevel List] $->$ #kbd[Define New Multilevel List] $->$ click #kbd[More] $->$ #hl-y[Link level to style: Heading 1]. Repeat for Level 2 & 3.],

  [#text(weight: "bold", fill: rtech-blue)[Automated Table of Contents (TOC)]],
  [TOC must generate in 1-click based on applied heading styles without manual page typing.],
  [Navigate to #text(weight: "bold")[References $->$ Table of Contents $->$ Automatic Table 1]. Press #kbd[F9] to update entire table.],

  [#text(weight: "bold", fill: rtech-emerald)[Navigation Pane Control]],
  [Real-time document structure map for fast reordering of 100+ page contracts.],
  [Press #kbd[Ctrl + F] $->$ select #kbd[Headings]. Drag-and-drop headings directly inside pane to reorder entire chapters!],
)

#section-banner(num: "SECTION BREAKS", title: "Section Breaks vs Page Breaks (Landscape Inside Portrait)", color: rtech-word)

#table(
  columns: (1.3fr, 2.2fr, 2.5fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Break Type],
  text(size: 7pt, weight: "bold", fill: white)[Keyboard / Navigation Path],
  text(size: 7pt, weight: "bold", fill: white)[Crucial Difference & Rule],

  [#text(weight: "bold", fill: rtech-word)[Page Break]],
  [#kbd[Ctrl + Enter]],
  [Pushes text to next page. Headers, footers, page numbering, margins, and page orientation #hl-y[remain strictly identical].],

  [#text(weight: "bold", fill: rtech-ppt)[Section Break\ (Next Page)]],
  [#text(weight: "bold")[Layout $->$ Breaks $->$ Section Breaks $->$ Next Page]],
  [Creates an independent document zone. Allows changing orientation from #hl-b[Portrait to Landscape] for wide financial tables.],

  [#text(weight: "bold", fill: rtech-emerald)[Decouple Headers\ ('Link to Previous')]],
  [Double-click Header in Section 2 $->$ click #kbd[Link to Previous] on ribbon to turn OFF.],
  [#hl-g[Crucial Step]! Allows Section 2 to have custom header titles or restart page numbers from 1 (e.g. Chapter 1 starting after Roman numeral index).],
)

#section-banner(num: "MAIL MERGE PIPELINE", title: "Automated 5-Step Bulk Letter & Invoice Pipeline", color: rtech-word)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[STEP 1: PREPARE DATA]\
      #v(1.5pt)
      Excel sheet must have clean column headers in Row 1 (`Name`, `Address`, `Salary`, `Email`).
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[STEP 2: LINK LIST]\
      #v(1.5pt)
      Word: #text(weight: "bold")[Mailings $->$ Select Recipients $->$ Use Existing List]. Select Excel file.
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[STEP 3: INSERT FIELDS]\
      #v(1.5pt)
      Place cursor $->$ click #text(weight: "bold")[Insert Merge Field] $->$ pick `<<Name>>`, `<<Salary>>`.
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[STEP 4: PREVIEW]\
      #v(1.5pt)
      Click #kbd[Preview Results] to cycle through live employee records and verify formatting.
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.5pt + rgb("#86EFAC"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-excel)[STEP 5: FINISH]\
      #v(1.5pt)
      Click #kbd[Finish & Merge] $->$ Print or send personalized PDFs to 1,000+ recipients in 60s!
    ]
  ],
)

#v(2pt)
#section-banner(num: "WORD SHORTCUTS", title: "Top 15 Workplace Shortcuts for Microsoft Word", color: rtech-word)

#table(
  columns: (1fr, 1.4fr, 1fr, 1.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Shortcut],
  text(size: 6.8pt, weight: "bold", fill: white)[Action],
  text(size: 6.8pt, weight: "bold", fill: white)[Shortcut],
  text(size: 6.8pt, weight: "bold", fill: white)[Action],

  [#kbd[Ctrl + Shift + C / V]], [Format Painter Copy / Paste],
  [#kbd[Shift + F3]], [Cycle Case (lower $->$ Title $->$ UPPER)],
  [#kbd[Ctrl + Enter]], [Insert clean Page Break],
  [#kbd[Alt + Shift + D]], [Insert dynamic Current Date],
  [#kbd[Ctrl + F]], [Open Navigation & Search Pane],
  [#kbd[Ctrl + H]], [Open Find & Replace dialogue],
  [#kbd[Ctrl + K]], [Insert Hyperlink],
  [#kbd[Ctrl + E] / #kbd[Ctrl + L]], [Align Center / Align Left],
  [#kbd[Ctrl + J]], [Justify paragraph margins],
  [#kbd[Ctrl + Shift + > / <]], [Increase / Decrease font size],
  [#kbd[Ctrl + Space]], [Clear manual character formatting],
  [#kbd[Ctrl + 1] / #kbd[Ctrl + 2]], [Single line spacing / Double spacing],
  [#kbd[F7]], [Run Spelling & Grammar Checker],
  [#kbd[Ctrl + Shift + E]], [Toggle Track Changes on / off],
)

#pagebreak()

// =============================================================================
// PAGE 06: POWERPOINT 365: PITCH DECK ARCHITECTURE & CINEMATIC MORPH
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[POWERPOINT 365: EXECUTIVE DECK STANDARDS, SLIDE MASTER & MORPH]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[Slide Master Corporate Locks · Cinematic App Walkthroughs with Morph · Top 15 Hotkeys]
]

#section-banner(num: "SLIDE MASTER ARCHITECTURE", title: "Corporate Branding Lock (Prevent Team Layout Corruption)", color: rtech-ppt)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Element],
  text(size: 7pt, weight: "bold", fill: white)[Configuration Rule in Word / PPT],
  text(size: 7pt, weight: "bold", fill: white)[Business Benefit],

  [#text(weight: "bold", fill: rtech-ppt)[Slide Master Access]],
  [Navigate to #text(weight: "bold")[View $->$ Slide Master]. Edit top parent slide to apply company logo, official brand fonts, and primary color scheme across all layouts.],
  [Locks logos and background graphics so team members cannot accidentally click or move them during editing.],

  [#text(weight: "bold", fill: rtech-blue)[Custom Layout Placeholders]],
  [Click #kbd[Insert Placeholder] $->$ choose Text, Picture, Chart, or Table. Position predefined boxes with exact corporate padding.],
  [Non-technical presenters just click #hl-y['Click to add picture'] — layout never gets distorted.],

  [#text(weight: "bold", fill: rtech-emerald)[Aspect Ratio Standard]],
  [Always use #text(weight: "bold")[Widescreen 16:9] (#kbd[Design $->$ Slide Size $->$ Widescreen]). Never use legacy Standard 4:3 on modern projectors.],
  [Eliminates black vertical pillar bars on modern LED panels and laptop screens.],
)

#section-banner(num: "MORPH TRANSITION", title: "Cinematic Transitions without Tedious Complex Animations", color: rtech-ppt)

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Morph Technique],
  text(size: 7pt, weight: "bold", fill: white)[How to Execute in 3 Steps],
  text(size: 7pt, weight: "bold", fill: white)[Visual Effect on Screen],

  [#text(weight: "bold", fill: rtech-ppt)[Object Move & Scale]],
  [1. Design Slide 1 with objects $->$ 2. Duplicate slide (#kbd[Ctrl+D]) $->$ 3. On Slide 2, move, enlarge, or recolor object $->$ 4. Apply #text(weight: "bold")[Transitions $->$ Morph].],
  [Smooth, fluid motion graphic movement between slides without setting complex motion paths.],

  [#text(weight: "bold", fill: rtech-blue)[Name Tagging (`!!`)]],
  [Name mismatched shapes identically using `!!` in Selection Pane (#kbd[Alt+F10]), e.g., name circle `!!Logo` on Slide 1 and star `!!Logo` on Slide 2.],
  [#hl-y[Forces different shapes to seamlessly morph into one another]! High-impact executive effect.],

  [#text(weight: "bold", fill: rtech-excel)[Zoom-in Product Focus]],
  [Place small UI dashboard mockup on Slide 1. On duplicated Slide 2, enlarge screenshot by 300% to frame single metric card $->$ apply Morph.],
  [Cinematic camera zoom effect directly inside PowerPoint without external video editing software.],
)

#section-banner(num: "PPT SHORTCUTS", title: "Top 15 Pitch Deck Hotkeys for Presenters & Designers", color: rtech-ppt)

#table(
  columns: (1.1fr, 2.4fr, 1.1fr, 2.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Shortcut],
  text(size: 6.8pt, weight: "bold", fill: white)[Action],
  text(size: 6.8pt, weight: "bold", fill: white)[Shortcut],
  text(size: 6.8pt, weight: "bold", fill: white)[Action],

  [#kbd[Ctrl + D]], [Duplicate object or slide (memorizes spacing)],
  [#kbd[Shift + Drag]], [Constrain perfect square, circle, or straight line],
  [#kbd[Ctrl + Shift + G]], [Ungroup shapes or complex vectors],
  [#kbd[Ctrl + G]], [Group selected shapes together],
  [#kbd[F5]], [Start slideshow presentation from beginning],
  [#kbd[Shift + F5]], [Start slideshow from current active slide],
  [#kbd[B] in Show], [Turn screen completely Black (focuses room on speaker)],
  [#kbd[W] in Show], [Turn screen completely White],
  [#kbd[Ctrl + L] in Show], [Turn mouse cursor into Laser Pointer],
  [#kbd[Ctrl + P] in Show], [Turn mouse cursor into Live Pen for drawing],
  [#kbd[Ctrl + E] in Show], [Erase annotations drawn with live pen],
  [#kbd[Alt + F10]], [Open Selection Pane to name & reorder layers],
  [#kbd[Ctrl + Shift + C/V]], [Pick up and apply Object Style attributes],
  [#kbd[Alt + Shift + Left/Right]], [Promote / Demote bullet list outline level],
)

#pagebreak()

// =============================================================================
// PAGE 07: MICROSOFT 365 CLOUD & OUTLOOK INBOX ZERO PROTOCOL
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[MICROSOFT 365: CLOUD COLLABORATION & OUTLOOK INBOX ZERO]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[OneDrive Co-Authoring · File Version History · 4D Email Triage · Corporate Calendar Standards]
]

#section-banner(num: "CLOUD COLLABORATION", title: "Real-Time Co-Authoring & SharePoint / OneDrive Protocols", color: rtech-blue)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Cloud Capability],
  text(size: 7pt, weight: "bold", fill: white)[How It Operates in Microsoft 365],
  text(size: 7pt, weight: "bold", fill: white)[Security & Best Practice],

  [#text(weight: "bold", fill: rtech-blue)[Real-Time Co-Authoring]],
  [Multiple team members work on the exact same Excel/Word/PPT file simultaneously. Colored avatars and live cursors show edits in real time.],
  [No more duplicate files named `Report_Final_v2_FinalApproved.xlsx` attached to emails!],

  [#text(weight: "bold", fill: rtech-emerald)[Version History]],
  [Click file title on top title bar $->$ select #kbd[Version History]. Browse historical snapshots by date and author; restore any past version in 1 click.],
  [Ransomware and accidental deletion safeguard. Every save creates an immutable historical milestone.],

  [#text(weight: "bold", fill: rtech-ppt)[Sharing Permissions]],
  [Share link types: 1. #text(weight: "bold")[Anyone with the link] (public), 2. #text(weight: "bold")[People in your organization], 3. #text(weight: "bold")[Specific People].],
  [#hl-y[Never use 'Anyone with link' for company financial data]! Always set link expiration dates and block downloads for confidential decks.],

  [#text(weight: "bold", fill: rtech-word)[Excel Web vs Desktop]],
  [Excel Online supports core formulas, co-authoring, and Office Scripts (TypeScript). Desktop Excel supports PowerPivot, VBA Macros, and full COM add-ins.],
  [Use Online for multi-user collaboration; use Desktop for heavy data modeling and legacy macro execution.],
)

#section-banner(num: "OUTLOOK INBOX ZERO", title: "The 4D Framework for Enterprise Email Management", color: rtech-outlook)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.8pt + rgb("#38BDF8"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[1. DO IT (< 2 MINS)]\
      #v(2pt)
      If an email requires less than 120 seconds to answer or approve, #hl-y[do it immediately]. Never read it twice.
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.8pt + rgb("#86EFAC"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-excel)[2. DELEGATE]\
      #v(2pt)
      Forward to the responsible owner with clear deadline instructions; move email to #kbd[\@WaitingFor] tracking folder.
    ]
  ],
  [
    #block(fill: rgb("#FEF3C7"), stroke: 0.8pt + rgb("#FCD34D"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B45309"))[3. DEFER (CALENDAR)]\
      #v(2pt)
      Requires deep focus ($>15$ mins). Drag email to #kbd[Calendar icon] to schedule dedicated focus block.
    ]
  ],
  [
    #block(fill: rgb("#FFE4E6"), stroke: 0.8pt + rgb("#FDA4AF"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#E11D48"))[4. DELETE / ARCHIVE]\
      #v(2pt)
      FYI threads, spam, newsletters. Hit #kbd[Backspace] to Archive. Keep zero emails idling in Inbox view.
    ]
  ],
)

#v(2pt)
#section-banner(num: "OUTLOOK POWER TOOLS", title: "Quick Steps, Automated Rules & Keyboard Accelerators", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[Outlook Feature],
  text(size: 6.8pt, weight: "bold", fill: white)[How to Configure in Outlook 365],
  text(size: 6.8pt, weight: "bold", fill: white)[High-Yield Shortcut],

  [#text(weight: "bold", fill: rtech-outlook)[Quick Steps]],
  [Home $->$ Quick Steps $->$ New. Combine multiple actions into 1 click: Mark Read + Move to Archive + Flag.],
  [Assign shortcut #kbd[Ctrl + Shift + 1] to clear common repetitive emails instantly.],

  [#text(weight: "bold", fill: rtech-blue)[Automated Rules]],
  [Home $->$ Rules $->$ Create Rule. Route automated server alerts or newsletter emails straight to subfolders.],
  [Keeps Inbox reserved exclusively for direct human-to-human conversations.],

  [#text(weight: "bold", fill: rtech-emerald)[Scheduling Assistant]],
  [New Meeting $->$ Scheduling Assistant. View attendees' free/busy calendar slots across the enterprise.],
  [Eliminates back-and-forth "When are you free?" emails forever.],

  [#text(weight: "bold", fill: rtech-navy)[Top Outlook Hotkeys]],
  [#kbd[Ctrl+Shift+M] (New Email) · #kbd[Ctrl+N] (New Item in active view) · #kbd[Ctrl+R] (Reply) · #kbd[Ctrl+Shift+R] (Reply All)],
  [#kbd[Ctrl+1] (Mail) · #kbd[Ctrl+2] (Calendar) · #kbd[Ctrl+3] (People) · #kbd[Backspace] (One-touch Archive)],
)

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB & MNC INTERVIEW READY VAULT
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[RTECHLAB AUTHOR MENTORSHIP HUB & MNC INTERVIEW VAULT]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[Official Author Profile · Direct Portfolio & Social Hub · Placement Preparation Checklist]
]

#section-banner(num: "AUTHOR PROFILE", title: "Authored by Rahul Patel — Founder & Senior Technical Expert", color: rtech-navy)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  fill: rgb("#F8FAFC"),
  radius: 5pt,
  inset: 6pt,
  [
    #grid(
      columns: (65pt, 1fr),
      gutter: 9pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-blue,
          radius: 6pt,
          clip: true,
          width: 58pt,
          height: 68pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 10pt, weight: "black", fill: rtech-navy)[Rahul Patel]\
        #v(0.5pt)
        #text(size: 7.2pt, weight: "bold", fill: rtech-blue)[Founder & Lead Systems Architect · RTechLab Publications]\
        #text(size: 7.2pt, weight: "bold", fill: rgb("#047857"))[Director & Senior Technical Expert · IANT COMPUTER EDUCATION, PALANPUR]\
        #v(1.5pt)
        #text(size: 6.8pt, fill: rtech-navy)[
          With over *10+ years of deep technical engineering & classroom experience*, Rahul has mentored more than *3,000+ students* across Gujarat and India in Computer Networking, Cisco CCNA, Cloud Infrastructure, and Corporate MIS Systems. He created the ₹22 Desk Reference series to make high-caliber industry knowledge instantly accessible and affordable for every ambitious student.
        ]
      ]
    )
  ]
)

#section-banner(num: "COMMUNITY CHANNELS", title: "Direct Links to Author Portfolio, YouTube & Official Channels", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [
    #block(
      stroke: 0.8pt + rgb("#38BDF8"),
      fill: rgb("#F0F9FF"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rtech-blue)[AUTHOR PORTFOLIO]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#FDA4AF"),
      fill: rgb("#FFF1F2"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#E11D48"))[YOUTUBE CHANNEL]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#F472B6"),
      fill: rgb("#FDF2F8"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#DB2777"))[INSTAGRAM HUB]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#86EFAC"),
      fill: rgb("#F0FDF4"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#166534"))[WHATSAPP HUB]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[Free Community Access ↗]]
        ]
      ]
    )
  ],
)

#section-banner(num: "MNC INTERVIEW VAULT", title: "Top 5 MIS & Office 365 Interview Questions with Model Answers", color: rtech-excel)

#table(
  columns: (2.2fr, 3.8fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[Technical Interview Question Asked in MNCs],
  text(size: 7pt, weight: "bold", fill: white)[Senior Executive Model Answer],

  [#text(weight: "bold", fill: rtech-navy)[Q1: Why is XLOOKUP superior to VLOOKUP?]],
  [XLOOKUP defaults to exact match, searches leftward, handles `#N/A` with built-in fallback, returns multi-column arrays, and will never break if new columns are inserted into the source table.],

  [#text(weight: "bold", fill: rtech-navy)[Q2: When should you use Section Break instead of Page Break?]],
  [A Page Break merely pushes text to the next page while keeping header/footer and page orientation identical. A Section Break creates an independent layout zone, allowing mixed Portrait/Landscape orientation and unlinked headers/footers.],

  [#text(weight: "bold", fill: rtech-navy)[Q3: What does the 'Unpivot Columns' feature in Power Query achieve?]],
  [It transforms wide report matrices (with monthly columns) into normalized, tall two-column database structures (Attribute and Value), which is required for reliable relational data modeling and dynamic Pivot Tables.],

  [#text(weight: "bold", fill: rtech-navy)[Q4: How does Morph differ from traditional PowerPoint animations?]],
  [Traditional animation requires configuring individual entrance/exit motion paths. Morph automatically compares two slides, detects identically named objects, and calculates smooth mathematical interpolation for position, size, and color.],

  [#text(weight: "bold", fill: rtech-navy)[Q5: What is the 4D rule of Inbox Zero in Microsoft Outlook?]],
  [Do it immediately if under 2 minutes; Delegate to team members with tracking tags; Defer to calendar for focused work blocks; Delete or Archive all non-actionable emails to keep the active inbox empty.],
)

#v(2pt)
#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 0.8pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 10pt, y: 3pt),
    text(size: 7pt, weight: "bold", fill: rtech-blue)[
      🚀 Want the Complete 113-Page In-Depth Textbook & 6 Real Excel Lab Files (.xlsx)? Upgrade anytime to the ₹49 Master Book or ₹149 Career Accelerator Suite at #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]
    ]
  )
]
'''

with open(typ_path, "w", encoding="utf-8") as f:
    f.write(typst_content)

print(f"✓ Typst source written to: {typ_path}")

# Compile Typst to PDF
cmd = ["typst", "compile", typ_path, pdf_path]
print(f"Compiling: {' '.join(cmd)}")
res = subprocess.run(cmd, capture_output=True, text=True)
if res.returncode != 0:
    print("Compilation error:", res.stderr)
    exit(1)

print(f"✓ PDF successfully compiled to: {pdf_path}")

# Verify exact page count with PyMuPDF
doc = fitz.open(pdf_path)
page_count = len(doc)
print(f"=== VERIFICATION: Total Pages = {page_count} ===")
doc.close()

# Copy to public downloads
with open(pdf_path, "rb") as fsrc, open(public_pdf, "wb") as fdst:
    fdst.write(fsrc.read())

print(f"✓ Copied to public download path: {public_pdf}")
