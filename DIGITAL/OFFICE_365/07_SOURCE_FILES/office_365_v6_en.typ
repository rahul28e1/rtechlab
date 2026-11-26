// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE V6 (EN)
// Complete College & Corporate Desk Reference + 150 Shortcuts Poster (8 Pages)
// =============================================================================

#set document(
  title: "Microsoft 365 Enterprise Quick Desk Reference & 150 Shortcuts (English)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 8mm, bottom: 7.5mm, left: 7.5mm, right: 7.5mm),
  background: context {
    let p = counter(page).get().first()
    if p > 1 [
      #place(center + horizon)[
        #rotate(-35deg)[
          #text(size: 74pt, weight: "black", fill: rgb("#0F172A0A"))[RTECHLAB]
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
          #h(3pt)#text(size: 7.5pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 7.5pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 Enterprise Desk Reference & 150 Shortcuts]
        ],
        [
          #text(size: 6.8pt, weight: "bold", fill: rgb("#107C41"))[Word · Excel · PowerPoint · Outlook · Cloud]
          #text(size: 6.8pt, fill: rgb("#64748B"))[ · Rahul Patel]
        ]
      )
      #v(1pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(1pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.3pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] 150 Production Shortcuts · Print & Laminate · Free Tools: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            stroke: 0.4pt + rgb("#CBD5E1"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.2pt),
            text(size: 6.5pt, weight: "bold", fill: rgb("#0F172A"))[Page #p of 8]
          )
        ]
      )
    ]
  }
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

#let app-banner(title, subtitle, color) = {
  block(width: 100%, fill: color, radius: 3pt, inset: (x: 6pt, y: 3.5pt))[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [#text(size: 9.2pt, weight: "black", fill: white)[#title]],
      [#text(size: 6.4pt, weight: "bold", fill: rgb("#FFFFFFCC"))[#subtitle]]
    )
  ]
  v(2pt)
}

#let section-banner(num: "PART", title: "TITLE", color: rtech-blue) = {
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
}

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
#app-banner("SECTION 1  |  MICROSOFT WORD 365", "Executive Reports, College Thesis, Resumes & Automated Documentation", rtech-word)

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

#section-banner(num: "PART 1.1", title: "Visual Architecture: Why MNCs & Colleges Reject Unformatted Documents", color: rtech-word)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/word_document_layout_visual.png", width: 84%)
  ]
]

#section-banner(num: "PART 1.2", title: "6 Essential Word Workflows for College Reports, Resumes & Corporate Offices", color: rtech-word)
#table(
  columns: (1.35fr, 2.25fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3.1pt,
  text(size: 6.6pt, weight: "bold", fill: white)[Workflow / Tool],
  text(size: 6.6pt, weight: "bold", fill: white)[Why College & Office Teams Demand It],
  text(size: 6.6pt, weight: "bold", fill: white)[Exact Click Path & Pro Shortcut],
  [#hl-b[1. Heading 1–3 + Auto TOC]], [Manual numbering breaks if 1 heading shifts. Auto-TOC builds thesis/report index in 2 seconds with clickable links.], [Home → Heading 1/2/3 (#kbd[Ctrl+Alt+1/2/3]) → References → Table of Contents → Press #kbd[F9] to update page numbers.],
  [#hl-o[2. Section vs Page Break]], [Insert 1 Landscape wide Excel table inside a Portrait report without rotating the whole file!], [Layout → Breaks → #hl-y[Next Page (Section Break)]. Avoid pressing Enter 20 times! Use #kbd[Ctrl+Enter] for Page Break.],
  [#hl-g[3. Mail Merge (500 Docs)]], [Generate 500 personalized College Certificates, Admit Cards, or HR Offer Letters from 1 Excel sheet in 5 mins.], [Mailings → Start Mail Merge → Letters → Select Recipients (Use Existing Excel List) → Insert Merge Field → Finish.],
  [4. Track Changes & Compare], [Mandatory for HR contracts & teacher thesis review—shows every edit highlighted without deleting originals.], [Review → Track Changes (#kbd[Ctrl+Shift+E]). Use Review → Compare to highlight differences between v1 and v2.],
  [#hl-y[5. ATS Resume & PDF Lock]], [Fancy multi-column Canva/graphics resumes fail MNC ATS scanners. Clean 1-inch margin Word tables pass 100%.], [Keep 0.75–1" margins, 10.5pt Segoe UI/Calibri, clear Heading rules, hide table borders → Export as PDF (#kbd[F12]).],
  [6. Footnotes, AutoText & Lock], [Add academic citations (`Alt+Ctrl+F`), expand company addresses in 2 keys (Quick Parts), and prevent unauthorized edits.], [References → Insert Footnote; Review → Restrict Editing (Comments Only) with password.],
)

#section-banner(num: "PART 1.3", title: "Top 10 Word Production Shortcuts (Quick Reference Before Page 6 Poster)", color: rtech-word)
#table(
  columns: (1.05fr, 1.95fr, 1.05fr, 1.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  [#kbd[Ctrl+Shift+C / V]], [Format Painter copy & paste],
  [#kbd[Ctrl+Space]], [#hl-o[Reset manual formatting]],
  [#kbd[Shift+F3]], [#hl-y[Cycle UPPER / lower / Title]],
  [#kbd[Ctrl+Enter]], [Clean Page Break (no blank Enters)],
  [#kbd[Ctrl+F / Ctrl+H]], [Heading Nav / Bulk Replace],
  [#kbd[Alt+Shift+Up/Dn]], [#hl-g[Move para / table row up/dn]],
  [#kbd[Ctrl+J]], [Justify clean margin edges],
  [#kbd[F9]], [Update TOC & all Date/Page fields],
  [#kbd[Ctrl+Shift+E]], [Track Changes ON / OFF],
  [#kbd[Ctrl+Shift+G]], [Instant Word & Page Count],
)

#section-banner(num: "PART 1.4", title: "College Thesis & Corporate Contract Golden Submission Checklist (Before Exporting PDF)", color: rtech-blue)
#table(
  columns: (1.4fr, 4.6fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  [#text(weight: "bold", fill: rtech-word)[1. Different First Page]], [Header & Footer → Check 'Different First Page' so Page 1 Cover never shows 'Page 1' or header lines!],
  [#text(weight: "bold", fill: rtech-word)[2. Dual Page Numbering]], [Use Section Break after TOC → Unlink 'Link to Previous' → Front matter `i, ii, iii`; Chapters start from `1, 2, 3`.],
  [#text(weight: "bold", fill: rtech-word)[3. Lock Figures & Tables]], [Select image/table → References → Insert Caption + Cross-Reference so 'See Fig 2.1' never goes wrong.],
  [#text(weight: "bold", fill: rtech-word)[4. Export With Bookmarks]], [File → Save As PDF → Options → Check 'Create bookmarks using Headings' for clickable left sidebar in Adobe/Chrome.],
  [#text(weight: "bold", fill: rtech-word)[5. Equation & Symbol Pro]], [Press #kbd[Alt + =] to insert clean math/engineering equations; Convert Text to Table converts raw CSV lists in 1 click.],
)
#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [#box(width: 100%, fill: rgb("#DCFCE7"), stroke: 0.65pt + rtech-excel, radius: 2.5pt, inset: (x: 5pt, y: 2.5pt))[#text(size: 6.1pt, weight: "bold", fill: rgb("#166534"))[✅ ATS 100% PASS: 1-Col Word Headings, Clean Margins, PDF Export]]],
  [#box(width: 100%, fill: rgb("#FEE2E2"), stroke: 0.65pt + rgb("#DC2626"), radius: 2.5pt, inset: (x: 5pt, y: 2.5pt))[#text(size: 6.1pt, weight: "bold", fill: rgb("#991B1B"))[❌ ATS REJECT: 2-Col Canva Graphics, Floating Textboxes, Icons]]]
)
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: (left: 3.5pt + rtech-word, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-word)[💡 DID YOU KNOW? (RESUME FACT)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[Recruiters spend only *7.4 seconds* scanning a resume! Clean 1-inch Word margins, Heading Styles & clickable PDF Bookmarks double your shortlist rate.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-MIN LAB: Open Word → Type 3 titles → Ctrl+Alt+1 → References → Table of Contents → Tap F9!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-word)[🔥 "A clean document speaks for your discipline before you even enter the room."]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_word_desk.png", height: 64pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 03: SECTION 2A — EXCEL 365 FORMULAS + SPREADSHEET VISUAL
// =============================================================================
#app-banner("SECTION 2A  |  MICROSOFT EXCEL 365 — FORMULA ENGINE", "Modern Lookups, Dynamic Arrays (#SPILL), LET Speed & Text Cleaning", rtech-excel)

#section-banner(num: "PART 2.1", title: "Live Excel Grid Visual: Dynamic Array Spill & Nested XLOOKUP Syntax", color: rtech-excel)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/excel_dynamic_array_grid.png", width: 96%)
  ]
]

#section-banner(num: "PART 2.2", title: "20 Corporate & College Practical Formulas (Exact Syntax + Output + Where Used)", color: rtech-excel)
#table(
  columns: (1.15fr, 2.3fr, 2.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.5pt,
  text(size: 6.4pt, weight: "bold", fill: white)[No. · Function],
  text(size: 6.4pt, weight: "bold", fill: white)[Copy-Paste Formula Syntax & Example],
  text(size: 6.4pt, weight: "bold", fill: white)[Real Output & College / Job Use],
  [#hl-g[01. XLOOKUP]], [`=XLOOKUP(F2, A2:A50, D2:D50, "Missing")`], [#hl-y[Replaces VLOOKUP!] Searches left/right; column inserts never break it. HR/MIS \#1.],
  [02. XLOOKUP Multi], [`=XLOOKUP(F2, A:A, B:D)`], [1 formula spills Name, Dept & Salary across 3 columns automatically.],
  [#hl-b[03. 2-Way XLOOKUP]], [`=XLOOKUP(R, A2:A6, XLOOKUP(C, B1:F1, B2:F6))`], [Matches both Row (Product) & Column (City) cleanly — GST/Shipping rates.],
  [04. Reverse Lookup], [`=XLOOKUP(ID, A:A, DateCol, , 0, -1)`], [`-1` searches bottom-to-top to grab latest invoice/attendance date instantly.],
  [05. INDEX + MATCH], [`=INDEX(D2:D99, MATCH(F2, A2:A99, 0))`], [Works on Excel 2016/2019 too. Interviewers test this + XLOOKUP.],
  [06. VLOOKUP + IFERROR], [`=IFERROR(VLOOKUP(F2, A:D, 3, 0), "N/A")`], [Legacy MNC lookup. Always set 4th arg `0`/`FALSE` & wrap in `IFERROR`.],
  [#hl-g[07. FILTER]], [`=FILTER(A2:D99, B2:B99="Paid", "None")`], [Auto-extracts matching rows dynamically! Great for pending fee/invoice reports.],
  [08. SORT + UNIQUE], [`=SORT(UNIQUE(A2:A99))`], [Removes duplicates + sorts A–Z dynamically in 1 cell — dropdown data source.],
  [09. SEQUENCE], [`=SEQUENCE(10, 1, 1001, 1)`], [Generates instant Invoice/Roll Numbers (`1001` to `1010`) automatically.],
  [#hl-b[10. LET (5x Speed)]], [`=LET(r,D2:D9, c,E2:E9, m,(r-c)/r, IF(m>0.2,"Hi","Lo"))`], [#hl-y[500% faster!] Stores variables so complex sheet ranges calculate only once.],
  [11. SUMIFS], [`=SUMIFS(Sales, Reg, "West", Yr, 2027)`], [Sum range is ALWAYS first! Used for GST monthly totals & branch sales.],
  [12. COUNTIFS / AVGIFS], [`=COUNTIFS(Dept,"IT", Salary,">40000")`], [Counts or averages by multi-criteria — college attendance & KPI scorecards.],
  [13. IFS (Grading)], [`=IFS(A2>=75,"Dist", A2>=60,"1st", TRUE,"Pass")`], [Clean multi-slab grading/bonus rules without messy nested IF brackets.],
  [14. TEXTSPLIT], [`=TEXTSPLIT(A2, ",", ";")`], [Splits comma/semicolon strings into clean columns & rows in 1 second.],
  [15. TEXTBEFORE/AFTER], [`=TEXTBEFORE(A2,"@")` / `=TEXTAFTER(A2,"@")`], [Extracts email username & company domain without FIND/MID formulas.],
  [16. TRIM + CLEAN], [`=TRIM(CLEAN(A2))`], [Strips extra spaces & hidden web characters from Tally/ERP exports.],
  [17. TEXTJOIN], [`=TEXTJOIN(", ", TRUE, A2:A10)`], [Merges cell list skipping blanks (`TRUE`) — builds email lists & tags.],
  [18. TEXT Format], [`=TEXT(A2, "DD-MMM-YYYY")`], [Locks date display (`25-Nov-2027`) when joining text strings safely.],
  [19. DATEDIF & WORKDAYS], [`=DATEDIF(DOB,TODAY(),"Y")` / `=NETWORKDAYS(A2,B2)`], [Calculates exact Age/Tenure in years; calculates working days excl. Sun/Sat.],
  [20. ROUND (GST)], [`=ROUND(Amt*0.18, 2)` / `=ROUNDUP(A2, 0)`], [Exact 2-decimal GST paise rounding & billing slab round-ups.],
  [#hl-b[21. PMT (Loan EMI)]], [`=PMT(9%/12, 60, -500000)`], [Instant ₹ EMI calculation (rate/12, months, `-loan`). Banking & Finance favorite.],
  [22. SUMPRODUCT], [`=SUMPRODUCT(Qty, Price)`], [Multiplies arrays & sums without needing a helper Total column! Weighted GPA/Marks.],
  [23. EOMONTH], [`=EOMONTH(InvDate, 0)` / `=EOMONTH(D2, 1)+20`], [Finds Month-End or GSTR-3B (20th of next month) exact payment due date!],
  [#hl-g[24. AGGREGATE]], [`=AGGREGATE(9, 6, D2:D100)`], [`9`=SUM, `6`=Ignore `#N/A`/`#DIV/0!` errors! Totals messy sheets without crashing.],
)
#v(2.5pt)
#box(width: 100%, fill: rgb("#DCFCE7"), stroke: 0.7pt + rtech-excel, radius: 3pt, inset: (x: 6pt, y: 3.5pt))[
  #text(size: 6.4pt, weight: "bold", fill: rgb("#166534"))[★ DYNAMIC SPILL PRO TIP (\# Operator): If `=UNIQUE(A2:A100)` sits in `G2` and spills down dynamically, reference the ENTIRE changing list anywhere using `=COUNTA(G2#)` or `=SORT(G2#)` — zero manual range editing! · 📥 Free Practice File: #link("https://rtechlab.com/downloads/Office-365-Practice-Lab.xlsx")[*rtechlab.com/downloads/Office-365-Practice-Lab.xlsx*]]
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#F0FDF4"),
  stroke: (left: 3.5pt + rtech-excel, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-excel)[💡 DID YOU KNOW? (CAREER FACT)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[*82% of Indian MIS, Accounts & Analyst interviews* test `XLOOKUP`, `SUMIFS` & `IFERROR` in Round 1. One `LET()` formula runs 5x faster than VLOOKUP!]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-MIN LAB: Make 5 rows of ID/Name/Salary → Type `=XLOOKUP(E2, A2:A6, B2:D6)` and watch 3 columns spill!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-excel)[🔥 "Master Excel logic once—and let formulas work for you while others type manually."]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_excel_desk.png", height: 64pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 04: SECTION 2B — POWER QUERY ETL, ERROR DOCTOR & PIVOT MIS
// =============================================================================
#app-banner("SECTION 2B  |  MICROSOFT EXCEL 365 — AUTOMATION, PIVOT & ERRORS", "Power Query ETL · 7 Fatal Error Fixes · Pivot MIS · Indian Formats", rtech-excel)

#section-banner(num: "PART 2.3", title: "Power Query (ETL): 6-Stage Zero-VBA Pipeline (Monthly Report in 5 Seconds!)", color: rtech-blue)
#table(
  columns: (0.45fr, 1.25fr, 2.3fr, 2fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
  inset: 3.1pt,
  text(size: 6.6pt, weight: "bold", fill: white)[Step],
  text(size: 6.6pt, weight: "bold", fill: white)[Stage Action],
  text(size: 6.6pt, weight: "bold", fill: white)[Under-the-Hood Action in Excel],
  text(size: 6.6pt, weight: "bold", fill: white)[Office / College Superpower],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[01]]], [#text(weight: "bold", fill: rtech-blue)[Extract (Connect)]], [Data → Get Data → From Folder / CSV / SQL / PDF.], [Combines 30 daily branch files into 1 table automatically.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[02]]], [#text(weight: "bold", fill: rtech-blue)[Promote & Filter]], [Use First Row as Headers; uncheck Blank / Subtotal rows.], [Eliminates manual delete-row cleanup forever.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[03]]], [#text(weight: "bold", fill: rtech-blue)[#hl-y[Unpivot Columns]]], [Select ID columns → Right-Click → #hl-g[Unpivot Other Columns].], [\#1 MNC Interview Skill! Turns wide Jan–Dec cols into Pivot-ready rows.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[04]]], [#text(weight: "bold", fill: rtech-blue)[Clean & Set Types]], [Right-click Transform → Trim spaces; enforce Date/₹ Currency/Int.], [Guarantees zero `#VALUE!` calculation errors downstream.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[05]]], [#text(weight: "bold", fill: rtech-blue)[Merge Queries]], [Home → Merge Queries → Left Outer Join (Sales + CustomerID).], [Replaces slow 100k-row VLOOKUPs inside memory cleanly.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[06]]], [#text(weight: "bold", fill: rtech-blue)[Close & Load]], [Load to Sheet Table or Data Model. Next month: #hl-y[Refresh All].], [5-hour monthly reporting work finishes in 5 seconds!],
)

#section-banner(num: "PART 2.4", title: "Excel Error Doctor (Instant 10-Second Fixes) & 5-Step Pivot MIS Rules", color: rtech-ppt)
#table(
  columns: (0.75fr, 2.35fr, 2.9fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3pt,
  text(size: 6.6pt, weight: "bold", fill: white)[Error],
  text(size: 6.6pt, weight: "bold", fill: white)[Exact Root Cause],
  text(size: 6.6pt, weight: "bold", fill: white)[Instant 10-Second Fix],
  [#text(weight: "bold", fill: rtech-ppt)[`#N/A`]], [Lookup ID missing or trailing spaces (`"101 "` vs `101`).], [Run `=TRIM()`, match text vs number type, wrap in `=IFERROR(..., "New")`.],
  [#text(weight: "bold", fill: rtech-ppt)[`#VALUE!`]], [Math done on text cell (e.g. `"₹500"` typed as text + `100`).], [Clean non-numeric text or use `=SUM(A1:A5)` instead of `A1+A2`.],
  [#text(weight: "bold", fill: rtech-ppt)[`#REF!`]], [Formula points to a column/row that was deleted.], [Press #kbd[Ctrl+Z] immediately or update missing range reference.],
  [#text(weight: "bold", fill: rtech-ppt)[`#DIV/0!`]], [Dividing by 0 or blank cell (margin % when Sales = 0).], [Wrap as `=IFERROR(Profit/Sales, 0)` cleanly.],
  [#text(weight: "bold", fill: rtech-ppt)[`#NAME?`]], [Typo in function name (`=XLOKUP`) or missing quotes.], [Check spelling; put text criteria inside `"Delhi"` double quotes.],
  [#text(weight: "bold", fill: rtech-ppt)[`#SPILL!`]], [Something is blocking Dynamic Array spill area below.], [Delete text/merged cells in dotted blue box so array can expand.],
  [#text(weight: "bold", fill: rtech-ppt)[`#####`]], [Column too narrow OR negative date/time result.], [Press #kbd[Alt+H+O+I] to AutoFit width; check Start < End Date.],
)

#section-banner(num: "MIS PRO", title: "PART 2.5 · 5-STEP PIVOT MIS & INDIAN FORMATS", color: rtech-excel)
#table(
  columns: (1.25fr, 4.75fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3pt,
  [#text(weight: "bold", fill: rtech-excel)[Step 1 · #hl-g[Table]]], [Press #kbd[Ctrl+T] on raw data first → new rows auto-update Pivot.],
  [#text(weight: "bold", fill: rtech-excel)[Step 2 · Pivot]], [Press #kbd[Alt+N+V] → drag Region→Rows, Sales→Values, Month→Cols.],
  [#text(weight: "bold", fill: rtech-excel)[Step 3 · Slicer]], [Pivot Analyze → Insert Slicer (Year/Dept) for clickable dashboard.],
  [#text(weight: "bold", fill: rtech-excel)[Step 4 · INR ₹]], [#kbd[Ctrl+1] → Custom: #hl-b[`"₹ "##,##,##0`] for Indian Lakhs/Crores!],
  [#text(weight: "bold", fill: rtech-excel)[Step 5 · Freeze]], [Select B2 → #kbd[Alt+W+F+F] freezes Row 1 + Col A while scrolling.],
  [#text(weight: "bold", fill: rtech-excel)[Step 6 · Dropdown]], [#kbd[Alt+A+V+V] → List → stop wrong spelling entries in shared sheets.],
)

#section-banner(num: "PART 2.6", title: "Live Office Case Study + Top 5 Conditional Formatting & Sheet Protection Rules", color: rtech-navy)
#table(
  columns: (1.45fr, 4.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3.2pt,
  [#text(weight: "bold", fill: rtech-navy)[#hl-y[Live Case: GST & Branch MIS]]], [1) Export monthly Tally/Billing CSV → 2) Load into Power Query (`Unpivot` + `Trim`) → 3) Add `XLOOKUP` Party State/GSTIN → 4) Build `Ctrl+T` Pivot + Region Slicer → 5) Email 1-Page PDF dashboard cleanly!],
  [#text(weight: "bold", fill: rtech-navy)[1. Catch Duplicate Invoices]], [Select Invoice Col → #kbd[Alt+H+L+H+D] → instantly highlights duplicate bills in red!],
  [#text(weight: "bold", fill: rtech-navy)[2. Traffic Light KPI Rules]], [Home → Conditional Formatting → Icon Sets (Green/Yellow/Red) on Target Achievement %.],
  [#text(weight: "bold", fill: rtech-navy)[3. Lock Formulas, Open Input]], [Select yellow input cells → #kbd[Ctrl+1] → Protection → Uncheck Locked → Review → Protect Sheet!],
  [#text(weight: "bold", fill: rtech-navy)[4. Custom Age > 30 Alert]], [Data Validation (#kbd[Alt+A+V+V]) → Custom `=A2>18` with friendly Error Alert popup message.],
)
#v(2pt)
#box(width: 100%, fill: rgb("#EFF6FF"), stroke: 0.65pt + rtech-blue, radius: 2.5pt, inset: (x: 6pt, y: 2.5pt))[
  #text(size: 6.2pt, weight: "bold", fill: rtech-blue)[📥 Free Practice File: #link("https://rtechlab.com/downloads/Office-365-Practice-Lab.xlsx")[*rtechlab.com/downloads/Office-365-Practice-Lab.xlsx*]]
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#F0FDF4"),
  stroke: (left: 3.5pt + rtech-excel, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-excel)[💡 DID YOU KNOW? (AUTOMATION FACT)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[Power Query saves corporate analysts *6+ hours every week*! Build `Unpivot` + `Merge` once, and next month's report updates in 5 seconds with 1 click.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-MIN LAB: Select raw data → Press `Ctrl+T` → `Alt+N+V` (Pivot) → Drag Dept to Rows & Sales to Values.]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-excel)[🔥 "Don't spend Sunday fixing sheets—automate once with Power Query and lead!"]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_excel_desk.png", height: 80pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 05: SECTION 3 — POWERPOINT 365 (SLIDE MASTER, MORPH & PITCH DECK)
// =============================================================================
#app-banner("SECTION 3  |  MICROSOFT POWERPOINT 365", "Corporate Pitch Decks, Slide Master Brand Lock & Cinematic Morph", rtech-ppt)

#section-banner(num: "PART 3.1", title: "Slide Master + Morph Transition Blueprint (Amateurs vs MNC Executives)", color: rtech-ppt)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/powerpoint_slide_master_morph.png", width: 96%)
  ]
]

#section-banner(num: "PART 3.2", title: "Corporate Design Rules & 5-Slide Blueprint for College Viva / Company Pitch", color: rtech-ppt)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3pt,
  text(size: 6.5pt, weight: "bold", fill: white)[Design / Structure Pillar],
  text(size: 6.5pt, weight: "bold", fill: white)[MNC Executive Rule (Get Hired / A+ Grade)],
  text(size: 6.5pt, weight: "bold", fill: white)[Common Student Mistake to Avoid],
  [#hl-o[1. Slide Master Brand Lock]], [View → Slide Master → Top Master Slide: put Logo, Fonts & Colors ONCE. Every slide inherits automatically!], [Copy-pasting logos manually on 25 slides—causes jumping logos & misaligned headers.],
  [#hl-b[2. Morph (`!!ObjName`)]], [Duplicate slide → resize/move KPI cards → Transitions → Morph. Prefix same name `!!Logo` in Selection Pane (#kbd[Alt+F10]).], [Using cheesy flying/bouncing animations on every bullet point—looks unprofessional.],
  [#hl-y[3. Widescreen 16:9 + 6x6 Rule]], [Always Design → 16:9 Widescreen. Max 6 bullets/slide, max 6 words/bullet! Slides support you, not replace you.], [Dumping full Word paragraphs onto slides and reading off the projector screen.],
  [4. Pixel Align & Color Sync], [Select shapes → #kbd[Alt+H+G+A] (Align) & #kbd[Alt+H+G+H] (Distribute); Eyedropper picks exact brand colors.], [Eyeballing box positions manually so charts look crooked and amateurish.],
  [#hl-g[5. 5-Slide Pitch Structure]], [\#1 Title/Hook · \#2 Problem + Data · \#3 Architecture/Solution · \#4 Live Demo / ROI Numbers · \#5 Action Plan.], [Starting with a boring 10-slide Literature History before explaining what you actually built.],
  [6. Presenter View + Compress], [Show speaker notes + timer on laptop only (#kbd[Alt+F5]). Before emailing: File → Info → Compress Media (saves 70% MB).], [Sending a 120MB PPTX via WhatsApp or reading tiny cue cards from paper.],
)

#section-banner(num: "PART 3.3", title: "Live Audience Controls (Presenter Secret Keys — Page 6 Has All 33 PPT Keys!)", color: rtech-ppt)
#table(
  columns: (1.05fr, 1.95fr, 1.05fr, 1.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  [#kbd[F5 / Shift+F5]], [Start from Slide 1 / Current Slide],
  [#kbd[B / W]], [#hl-o[Black / White screen during Q&A]],
  [#kbd[Ctrl+L / Ctrl+P]], [#hl-y[Live Laser Pointer / Pen Ink]],
  [#kbd[Number + Enter]], [Jump directly to e.g. `5+Enter`],
)

#section-banner(num: "PART 3.4", title: "5-Slide Blueprint for Winning College Project Vivas & Corporate Client Pitches", color: rtech-navy)
#table(
  columns: (0.7fr, 1.8fr, 2.85fr, 0.65fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if col in (0, 3) { center + horizon } else { left + horizon },
  inset: 2.6pt,
  text(size: 6.4pt, weight: "bold", fill: white)[Slide],
  text(size: 6.4pt, weight: "bold", fill: white)[Purpose & Exact Headline],
  text(size: 6.4pt, weight: "bold", fill: white)[Visual to Put on Slide],
  text(size: 6.4pt, weight: "bold", fill: white)[Time],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 1]], [Hook Title + Your Name/Team], [Bold 16:9 dark gradient cover + crisp 1-line value proposition.], [#text(weight: "bold", fill: rtech-navy)[30 sec]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 2]], [The Real Problem (Why Care?)], [3 Big KPI stat numbers (e.g. `42% Time Wasted`) + pain point icon.], [#text(weight: "bold", fill: rtech-navy)[1 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 3]], [Your Solution & Architecture], [Clean SmartArt workflow (`Alt+N+M`) or flowchart diagram — max 6 bullets.], [#text(weight: "bold", fill: rtech-navy)[1.5 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 4]], [Live Demo / Excel Proof], [Paste linked Excel chart (`Ctrl+V` → Keep Source Formatting) + Morph highlight.], [#text(weight: "bold", fill: rtech-navy)[2 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 5]], [ROI / Conclusion & Q&A], [Before vs After impact table + QR link to GitHub/Portfolio. Press #kbd[B] for Q&A!], [#text(weight: "bold", fill: rtech-navy)[1 min]],
)
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#FFF7ED"),
  stroke: (left: 3.5pt + rtech-ppt, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-ppt)[💡 DID YOU KNOW? (VIVA & PITCH FACT)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[The human brain processes visuals *60,000x faster* than walls of text! Combining Slide Master + `!!Morph` + 6x6 rule makes any viva look CEO-level.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-MIN LAB: Duplicate Slide 1 → Move/resize box on Slide 2 → Transitions → Morph → Press `Shift+F5`!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-ppt)[🔥 "Great slides don't replace the speaker—they amplify your confidence."]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_ppt_stage.png", height: 76pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 06: ★ THE 150 PRODUCTION SHORTCUTS MASTER WALL (ALL ON ONE PAGE!) ★
// Word (001-045) + Excel (046-117) + PowerPoint (118-150) — Zero Blank Cells!
// =============================================================================
#app-banner("★  THE 150 PRODUCTION SHORTCUTS MASTER WALL  ★", "Print & Stick Beside Keyboard · Word (45) + Excel (72) + PowerPoint (33)", rtech-navy)

// Band 1: WORD (45 shortcuts = 15 rows x 3 pairs)
#block(width: 100%, fill: rtech-word, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[W  |  SECTION A : MICROSOFT WORD 365 — 45 ESSENTIAL DOCUMENT & THESIS SHORTCUTS (001 – 045)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F8FAFC") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("001", rtech-word) #kbd[Ctrl + B / I / U]], [#hl-y[Bold / Italic / Underline]],
    [#nb("002", rtech-word) #kbd[Ctrl + E / L / R]], [Center / Left / Right Align],
    [#nb("003", rtech-word) #kbd[Ctrl + J]], [#hl-g[Justify Paragraph Margins]],
    [#nb("004", rtech-word) #kbd[Ctrl + 1 / 2 / 5]], [1.0 / 2.0 / 1.5 Line Spacing],
    [#nb("005", rtech-word) #kbd[Ctrl + Shift + >/<]], [Grow / Shrink Font Size],
    [#nb("006", rtech-word) #kbd[Ctrl + \] / \[]], [Font Size +/- 1 Point],
    [#nb("007", rtech-word) #kbd[Ctrl + Space]], [#hl-o[Clear All Manual Formatting]],
    [#nb("008", rtech-word) #kbd[Ctrl + Q]], [Clear Paragraph Formatting],
    [#nb("009", rtech-word) #kbd[Ctrl + Shift + C]], [#hl-b[Copy Style (Format Painter)]],
    [#nb("010", rtech-word) #kbd[Ctrl + Shift + V]], [#hl-b[Paste Copied Style]],
    [#nb("011", rtech-word) #kbd[Shift + F3]], [#hl-y[Cycle UPPER / lower / Title]],
    [#nb("012", rtech-word) #kbd[Ctrl + Alt + 1/2/3]], [#hl-y[Apply Heading 1 / 2 / 3]],
    [#nb("013", rtech-word) #kbd[Ctrl + Shift + N]], [Apply Normal Body Style],
    [#nb("014", rtech-word) #kbd[Ctrl + Enter]], [#hl-g[Insert Clean Page Break]],
    [#nb("015", rtech-word) #kbd[Ctrl + Shift + Enter]], [Column / Section Break Split],
    [#nb("016", rtech-word) #kbd[Ctrl + Shift + Space]], [Non-Breaking Space (No Split)],
    [#nb("017", rtech-word) #kbd[Ctrl + Shift + -]], [Non-Breaking Hyphen],
    [#nb("018", rtech-word) #kbd[Ctrl + F]], [#hl-b[Navigation Pane (Headings)]],
    [#nb("019", rtech-word) #kbd[Ctrl + H]], [#hl-y[Find & Bulk Replace Text]],
    [#nb("020", rtech-word) #kbd[Ctrl + G / F5]], [Go To Page / Line / Section],
    [#nb("021", rtech-word) #kbd[Ctrl + K]], [Insert Hyperlink (URL/File)],
    [#nb("022", rtech-word) #kbd[F7]], [Spell & Grammar Full Check],
    [#nb("023", rtech-word) #kbd[Shift + F7]], [Open Thesaurus (Synonyms)],
    [#nb("024", rtech-word) #kbd[Ctrl + Shift + E]], [#hl-o[Toggle Track Changes ON/OFF]],
    [#nb("025", rtech-word) #kbd[Alt + Ctrl + M]], [Insert Review Comment],
    [#nb("026", rtech-word) #kbd[Alt + Shift + Up/Dn]], [#hl-g[Move Para / Table Row Up/Dn]],
    [#nb("027", rtech-word) #kbd[Alt + Shift + D / T]], [Insert Auto Date / Time],
    [#nb("028", rtech-word) #kbd[Alt + Shift + P]], [Insert Page Number Field],
    [#nb("029", rtech-word) #kbd[F9]], [#hl-y[Update TOC & All Fields]],
    [#nb("030", rtech-word) #kbd[Alt + F9]], [Toggle Field Codes View],
    [#nb("031", rtech-word) #kbd[Ctrl + F9]], [Insert Blank Field Brackets],
    [#nb("032", rtech-word) #kbd[Alt + Ctrl + F / D]], [Insert Footnote / Endnote],
    [#nb("033", rtech-word) #kbd[Ctrl + Backspace/Del]], [Delete Prev / Next Full Word],
    [#nb("034", rtech-word) #kbd[Ctrl + M / Shift+M]], [Increase / Decrease Indent],
    [#nb("035", rtech-word) #kbd[Ctrl + = / Shift + +]], [Subscript (H2O) / Superscript],
    [#nb("036", rtech-word) #kbd[Ctrl + Shift + L]], [Apply Bullet List Instantly],
    [#nb("037", rtech-word) #kbd[Ctrl + Shift + G]], [Word Count (Words & Pages)],
    [#nb("038", rtech-word) #kbd[Ctrl + Shift + 8]], [Show/Hide Formatting Marks],
    [#nb("039", rtech-word) #kbd[F4 / Ctrl + Y]], [#hl-g[Repeat Last Action / Redo]],
    [#nb("040", rtech-word) #kbd[Ctrl + Alt + S]], [Split View Two Doc Parts],
    [#nb("041", rtech-word) #kbd[Ctrl + Shift + F8]], [Column / Vertical Block Select],
    [#nb("042", rtech-word) #kbd[Tab / Shift + Tab]], [Next / Prev Cell (+New Row)],
    [#nb("043", rtech-word) #kbd[Alt + F8]], [Open & Run Macros Dialog],
    [#nb("044", rtech-word) #kbd[Ctrl + F2 / Ctrl + P]], [Print Preview / Print Dialog],
    [#nb("045", rtech-word) #kbd[Ctrl + S / F12]], [#hl-o[Quick Save / Save As PDF]],
  )
]
#v(3pt)

// Band 2: EXCEL (72 shortcuts = 24 rows x 3 pairs)
#block(width: 100%, fill: rtech-excel, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[X  |  SECTION B : MICROSOFT EXCEL 365 — 72 HIGH-SPEED ACCOUNTING, MIS & FORMULA SHORTCUTS (046 – 117)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F0FDF4") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("046", rtech-excel) #kbd[Ctrl + T]], [#hl-g[Convert Range to Smart Table]],
    [#nb("047", rtech-excel) #kbd[Alt + =]], [#hl-y[Instant AutoSum Formula]],
    [#nb("048", rtech-excel) #kbd[Ctrl + E]], [#hl-b[Flash Fill Auto-Pattern]],
    [#nb("049", rtech-excel) #kbd[Ctrl + Alt + V → V]], [#hl-y[Paste Special: Values Only]],
    [#nb("050", rtech-excel) #kbd[Ctrl + Alt + V → E]], [Paste Transpose (Row ↔ Col)],
    [#nb("051", rtech-excel) #kbd[F4 (in Formula)]], [#hl-o[Cycle \$A\$1 Absolute Ref]],
    [#nb("052", rtech-excel) #kbd[F4 (in Sheet)]], [Repeat Last Formatting Step],
    [#nb("053", rtech-excel) #kbd[F2]], [#hl-g[Edit Active Cell Formula]],
    [#nb("054", rtech-excel) #kbd[Alt + Enter]], [New Line Inside Same Cell],
    [#nb("055", rtech-excel) #kbd[Ctrl + D / Ctrl + R]], [Fill Down / Fill Right],
    [#nb("056", rtech-excel) #kbd[Ctrl + Arrow Keys]], [#hl-b[Jump to Data Table Edge]],
    [#nb("057", rtech-excel) #kbd[Ctrl + Shift + Arrow]], [#hl-b[Select Entire Data Block]],
    [#nb("058", rtech-excel) #kbd[Ctrl + Home / End]], [Jump Cell A1 / Last Used],
    [#nb("059", rtech-excel) #kbd[Shift + Space]], [Select Entire Current Row],
    [#nb("060", rtech-excel) #kbd[Ctrl + Space]], [Select Entire Current Column],
    [#nb("061", rtech-excel) #kbd[Ctrl + A / Ctrl + \*]], [Select Entire Data Region],
    [#nb("062", rtech-excel) #kbd[Ctrl + Shift + +]], [Insert New Row / Column],
    [#nb("063", rtech-excel) #kbd[Ctrl + - (Minus)]], [Delete Selected Row / Col],
    [#nb("064", rtech-excel) #kbd[Ctrl + 9 / Ctrl + 0]], [Hide Selected Row / Column],
    [#nb("065", rtech-excel) #kbd[Ctrl + Shift + 9 / 0]], [Unhide Hidden Row / Col],
    [#nb("066", rtech-excel) #kbd[Ctrl + 1]], [#hl-y[Open Format Cells Dialog]],
    [#nb("067", rtech-excel) #kbd[Ctrl + Shift + \$]], [Currency Format (₹ / \$)],
    [#nb("068", rtech-excel) #kbd[Ctrl + Shift + %]], [Percentage Format (0%)],
    [#nb("069", rtech-excel) #kbd[Ctrl + Shift + \#]], [Date Format (DD-MMM-YY)],
    [#nb("070", rtech-excel) #kbd[Ctrl + Shift + !]], [Comma Number Format (1,000)],
    [#nb("071", rtech-excel) #kbd[Ctrl + 5]], [Apply / Remove Strikethrough],
    [#nb("072", rtech-excel) #kbd[Ctrl + Shift + &]], [Add Outer Border to Cells],
    [#nb("073", rtech-excel) #kbd[Ctrl + Shift + \_]], [Remove Borders from Cells],
    [#nb("074", rtech-excel) #kbd[Alt + H + O + I]], [#hl-g[Auto-Fit Column Widths]],
    [#nb("075", rtech-excel) #kbd[Alt + H + O + A]], [Auto-Fit Row Heights],
    [#nb("076", rtech-excel) #kbd[Alt + H + M + C]], [Merge & Center Cells],
    [#nb("077", rtech-excel) #kbd[Alt + H + W]], [Wrap Text Inside Cell],
    [#nb("078", rtech-excel) #kbd[Ctrl + Shift + L]], [#hl-y[Toggle AutoFilter Arrows]],
    [#nb("079", rtech-excel) #kbd[Alt + A + C]], [Clear All Applied Filters],
    [#nb("080", rtech-excel) #kbd[Alt + Down Arrow]], [Open Cell Filter / Dropdown],
    [#nb("081", rtech-excel) #kbd[Alt + N + V]], [#hl-g[Create Pivot Table Fast]],
    [#nb("082", rtech-excel) #kbd[Alt + F1]], [#hl-b[Insert Chart on Same Sheet]],
    [#nb("083", rtech-excel) #kbd[F11]], [Create Chart on New Sheet],
    [#nb("084", rtech-excel) #kbd[Ctrl + ;]], [#hl-y[Insert Today's Static Date]],
    [#nb("085", rtech-excel) #kbd[Ctrl + Shift + :]], [Insert Current Static Time],
    [#nb("086", rtech-excel) #kbd[Ctrl + ~ (Tilde)]], [#hl-o[Show / Audit All Formulas]],
    [#nb("087", rtech-excel) #kbd[Ctrl + \[]], [Select Precedent Formula Cells],
    [#nb("088", rtech-excel) #kbd[Ctrl + \]]], [Select Dependent Formulas],
    [#nb("089", rtech-excel) #kbd[Shift + F3]], [Insert Function Wizard],
    [#nb("090", rtech-excel) #kbd[Alt + M + V]], [Evaluate Formula Step-by-Step],
    [#nb("091", rtech-excel) #kbd[Ctrl + Shift + U]], [Expand / Collapse Formula Bar],
    [#nb("092", rtech-excel) #kbd[F9 / Shift + F9]], [Recalculate Workbook / Sheet],
    [#nb("093", rtech-excel) #kbd[Ctrl + PgDn / PgUp]], [Next / Previous Sheet Tab],
    [#nb("094", rtech-excel) #kbd[Shift + F11]], [Insert New Worksheet],
    [#nb("095", rtech-excel) #kbd[Alt + H + O + R]], [Rename Active Sheet Tab],
    [#nb("096", rtech-excel) #kbd[Alt + W + F + F]], [#hl-g[Freeze Top Row / Panes]],
    [#nb("097", rtech-excel) #kbd[Alt + W + VG]], [Show / Hide Gridlines],
    [#nb("098", rtech-excel) #kbd[Shift + F2]], [Add / Edit Cell Note],
    [#nb("099", rtech-excel) #kbd[Ctrl + Alt + M]], [Add Threaded Conversation],
    [#nb("100", rtech-excel) #kbd[Alt + Shift + Right]], [Group Rows / Columns Outline],
    [#nb("101", rtech-excel) #kbd[Alt + Shift + Left]], [Ungroup Rows / Columns],
    [#nb("102", rtech-excel) #kbd[Alt + A + M]], [#hl-y[Remove Duplicate Rows Tool]],
    [#nb("103", rtech-excel) #kbd[Alt + A + E]], [Text to Columns Wizard],
    [#nb("104", rtech-excel) #kbd[Alt + A + V + V]], [#hl-b[Data Validation Dropdown]],
    [#nb("105", rtech-excel) #kbd[Alt + A + R + A]], [#hl-g[Refresh All Power Queries]],
    [#nb("106", rtech-excel) #kbd[Alt + H + L]], [Conditional Formatting Menu],
    [#nb("107", rtech-excel) #kbd[Ctrl + K]], [Insert Link to Sheet / URL],
    [#nb("108", rtech-excel) #kbd[Ctrl + F3]], [Open Name Manager (Ranges)],
    [#nb("109", rtech-excel) #kbd[Ctrl + Shift + F3]], [Create Names from Selection],
    [#nb("110", rtech-excel) #kbd[Alt + ;]], [#hl-o[Select Visible Cells Only]],
    [#nb("111", rtech-excel) #kbd[F5 → Alt + S → K]], [Go To Special: Select Blanks],
    [#nb("112", rtech-excel) #kbd[Ctrl + Enter]], [#hl-y[Fill Formula into All Selected]],
    [#nb("113", rtech-excel) #kbd[Ctrl + F1]], [Collapse / Expand Top Ribbon],
    [#nb("114", rtech-excel) #kbd[Ctrl + P / F12]], [Print Setup / Save Workbook],
    [#nb("115", rtech-excel) #kbd[Ctrl + PageUp/Dn]], [Switch Between Open Tabs],
    [#nb("116", rtech-excel) #kbd[Ctrl + Tab]], [Switch Between Open Files],
    [#nb("117", rtech-excel) #kbd[Ctrl + W / Alt+F4]], [Close File / Close Excel],
  )
]
#v(3pt)

// Band 3: POWERPOINT (33 shortcuts = 11 rows x 3 pairs)
#block(width: 100%, fill: rtech-ppt, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[P  |  SECTION C : MICROSOFT POWERPOINT 365 — 33 DESIGN & PRESENTER SHORTCUTS (118 – 150)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#FFF7ED") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("118", rtech-ppt) #kbd[Ctrl + M]], [#hl-y[Insert New Blank / Layout Slide]],
    [#nb("119", rtech-ppt) #kbd[Ctrl + D]], [#hl-g[Duplicate Slide or Shape]],
    [#nb("120", rtech-ppt) #kbd[Ctrl + G]], [#hl-b[Group Multiple Shapes Together]],
    [#nb("121", rtech-ppt) #kbd[Ctrl + Shift + G]], [Ungroup Shapes / Icons],
    [#nb("122", rtech-ppt) #kbd[Ctrl + Shift + C/V]], [Copy / Paste Object Format],
    [#nb("123", rtech-ppt) #kbd[Ctrl + Drag Mouse]], [Quick Clone Object Inline],
    [#nb("124", rtech-ppt) #kbd[Shift + Drag]], [Resize Keep Exact Aspect Ratio],
    [#nb("125", rtech-ppt) #kbd[Alt + Arrow Keys]], [#hl-y[Nudge Object 1px Precision]],
    [#nb("126", rtech-ppt) #kbd[Alt + H + G + A]], [#hl-g[Align Objects (Center/Middle)]],
    [#nb("127", rtech-ppt) #kbd[Alt + H + G + H/V]], [Distribute Shapes Evenly],
    [#nb("128", rtech-ppt) #kbd[Alt + F10]], [#hl-b[Open Selection Pane (Layers)]],
    [#nb("129", rtech-ppt) #kbd[Ctrl + \] / \[]], [Increase / Decrease Text Size],
    [#nb("130", rtech-ppt) #kbd[Alt + Shift + L/R]], [Promote / Demote Bullet Level],
    [#nb("131", rtech-ppt) #kbd[Alt + Shift + Up/Dn]], [Move Bullet Point Up / Down],
    [#nb("132", rtech-ppt) #kbd[Ctrl + Up / Down]], [Reorder Slide Up / Down],
    [#nb("133", rtech-ppt) #kbd[Ctrl + Home / End]], [Jump to First / Last Slide],
    [#nb("134", rtech-ppt) #kbd[F6 / Tab]], [Cycle Through Slide Elements],
    [#nb("135", rtech-ppt) #kbd[Alt + N + P]], [Insert Picture into Slide],
    [#nb("136", rtech-ppt) #kbd[Alt + J + P + X]], [#hl-o[Remove Image Background]],
    [#nb("137", rtech-ppt) #kbd[Ctrl + K]], [Add Action / URL Hyperlink],
    [#nb("138", rtech-ppt) #kbd[Alt + W + L / M]], [Normal View / Slide Master],
    [#nb("139", rtech-ppt) #kbd[Ctrl + Shift + G]], [Slide Grid & Guides Toggle],
    [#nb("140", rtech-ppt) #kbd[F5]], [#hl-y[Start Presentation From Slide 1]],
    [#nb("141", rtech-ppt) #kbd[Shift + F5]], [#hl-g[Start From CURRENT Slide]],
    [#nb("142", rtech-ppt) #kbd[Alt + F5]], [#hl-b[Open Presenter View (Notes)]],
    [#nb("143", rtech-ppt) #kbd[B / W (in Show)]], [#hl-o[Black / White Screen Pause]],
    [#nb("144", rtech-ppt) #kbd[Ctrl + L (in Show)]], [#hl-y[Activate Live Laser Pointer]],
    [#nb("145", rtech-ppt) #kbd[Ctrl + P / E (Show)]], [Draw Live Pen / Erase Ink],
    [#nb("146", rtech-ppt) #kbd[Number + Enter]], [Jump Directly to Any Slide],
    [#nb("147", rtech-ppt) #kbd[G (during Show)]], [See All Slides Thumbnail Grid],
    [#nb("148", rtech-ppt) #kbd[Ctrl + S (in Show)]], [Search & Jump Slide Title],
    [#nb("149", rtech-ppt) #kbd[N / P (or Space)]], [Next / Previous Slide Step],
    [#nb("150", rtech-ppt) #kbd[Esc]], [Exit Presentation to Editor],
  )
]
#v(2.5pt)
#block(width: 100%, fill: rtech-navy, inset: (x: 5pt, y: 1.8pt), radius: (top: 2pt))[
  #text(size: 6.5pt, weight: "black", fill: white)[⊞  |  BONUS : 6 WINDOWS PRO SHORTCUTS FOR OFFICE SPEED (USE WITH WORD, EXCEL & PPT)]
]
#block(width: 100%)[
  #set text(size: 6pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F8FAFC") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2pt),
    [#nb("W1", rtech-navy) #kbd[Win + V]], [Clipboard History (25 items!)],
    [#nb("W2", rtech-navy) #kbd[Win+Shift+S]], [Instant Screen Snipping],
    [#nb("W3", rtech-navy) #kbd[Win + L]], [Instant Lock PC (Security)],
    [#nb("W4", rtech-navy) #kbd[Win + D]], [Show / Hide Desktop],
    [#nb("W5", rtech-navy) #kbd[Win + E]], [Open File Explorer Fast],
    [#nb("W6", rtech-navy) #kbd[Alt + Tab]], [Switch Open Apps Instantly],
  )
]
#v(3pt)
#box(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.65pt + dark-border, radius: 2.5pt, inset: (x: 6pt, y: 3.5pt))[
  #text(size: 6.2pt, fill: rtech-navy)[HIGHLIGHTER LEGEND:  #hl-y[Top Exam & Office Essential]   #hl-b[Formatting & Navigation]   #hl-g[Tables, Formulas & Data Power]   #hl-o[Mistake Preventer]   |   ★ BONUS TIP: Tap #kbd[Alt] once anywhere in Word/Excel/PPT to reveal instant letter badges for mouse-free speed!]
]
#v(1fr)
#grid(
  columns: (1fr, 1.15fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEFCE8"), stroke: (left: 3pt + rgb("#CA8A04"), rest: 0.6pt + dark-border), radius: 2.5pt, inset: 4pt)[
      #text(size: 6.3pt, weight: "bold", fill: rgb("#854D0E"))[💡 DID YOU KNOW? Keyboard shortcuts save *8 FULL WORKDAYS (64+ hours)* every year!]
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#EFF6FF"), stroke: (left: 3pt + rtech-blue, rest: 0.6pt + dark-border), radius: 2.5pt, inset: 4pt)[
      #text(size: 6.3pt, style: "italic", weight: "bold", fill: rtech-navy)[🔥 "Speed creates confidence: learn just 5 shortcuts daily from this wall—in 30 days you'll outperform 90% of operators!"]
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 07: SECTION 4 — OUTLOOK 365, ONEDRIVE CLOUD & WORKPLACE ETHICS
// =============================================================================
#app-banner("SECTION 4  |  OUTLOOK 365, ONEDRIVE CLOUD & WORKPLACE ETHICS", "Email Discipline · Exchange Architecture · Real-Time Cloud Collaboration", rtech-outlook)

#section-banner(num: "PART 4.1", title: "Outlook 4D Inbox Zero & OneDrive Files On-Demand Workflow Blueprint", color: rtech-outlook)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/outlook_cloud_workflow_visual.png", width: 96%)
  ]
]

#section-banner(num: "PART 4.2", title: "Outlook Setup (Exchange vs IMAP), Quick Steps & Top 10 Email Shortcuts", color: rtech-outlook)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.9pt,
  text(size: 6.5pt, weight: "bold", fill: white)[Feature / Protocol],
  text(size: 6.5pt, weight: "bold", fill: white)[Corporate Working Mechanism],
  text(size: 6.5pt, weight: "bold", fill: white)[Pro Action / Shortcut],
  [#hl-b[Exchange (M365) vs IMAP]], [Exchange syncs Mail + Calendar + Contacts bi-directionally across Laptop & Phone. Legacy POP3 deletes from server!], [Always add corporate email via Microsoft Exchange / 365 — avoid POP3 in offices.],
  [#hl-y[Quick Steps + Rules]], [Combine Mark Read + Move Folder + Flag into 1 hotkey! Route automated bank OTPs/alerts to folders automatically.], [Home → Quick Steps → assign #kbd[Ctrl+Shift+1] to clear routine emails in 1 sec.],
  [#hl-g[Scheduling Assistant]], [View side-by-side free/busy calendar slots of 10 team members + Delay Delivery sends morning 9 AM sharp!], [New Meeting → Scheduling Assistant; Options → Delay Delivery for late-night drafts.],
  [Top 10 Outlook Keys], [#kbd[Ctrl+N] New Item · #kbd[Ctrl+Shift+M] New Mail · #kbd[Ctrl+R] Reply · #kbd[Ctrl+Shift+R] Reply All · #kbd[Ctrl+F] Forward.], [#kbd[Ctrl+Enter] Send · #kbd[Ctrl+1/2/3] Mail/Cal/People · #kbd[Ctrl+Q] Read · #kbd[Backspace] Archive.],
)

#section-banner(num: "PART 4.3", title: "OneDrive 1TB Cloud Governance & Mandatory Corporate Workplace Ethics", color: rtech-emerald)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.9pt,
  text(size: 6.5pt, weight: "bold", fill: white)[Cloud / Ethical Pillar],
  text(size: 6.5pt, weight: "bold", fill: white)[Golden Corporate Rule (What Seniors Expect From Freshers)],
  text(size: 6.5pt, weight: "bold", fill: white)[Danger / Mistake to Never Make],
  [#hl-b[Co-Authoring + AutoSave]], [Store in OneDrive/SharePoint → AutoSave ON saves every keystroke; 5 colleagues edit 1 Excel sheet live!], [Never email `Report_Final_v2_updated.xlsx` attachments back and forth!],
  [#hl-g[180-Day Version History]], [Right-click any file in OneDrive → Version History to roll back accidental edits or ransomware instantly.], [Rebuilding 8 hours of lost Excel work because it was saved only on Desktop.],
  [#hl-o[ISO File Naming Rule]], [Always name files cleanly: `2027-11-25_ClientName_GST_v1.0.xlsx` for clean team audit trails.], [Saving critical office work as `abc123.xlsx`, `New Sheet.xlsx`, or `Final_final2.xlsx`.],
  [Data Security & Screen Lock], [Share links as 'Specific People Only' (NEVER 'Anyone with link' for Salary/Client sheets). #kbd[Win+L] when leaving desk!], [Using personal WhatsApp/Gmail to send confidential client databases or leaving PC unlocked.],
)

#section-banner(num: "PART 4.4", title: "4 Copy-Paste Office Email Templates + OneDrive Icon & M365 Forms Bonus", color: rtech-blue)
#table(
  columns: (1.45fr, 4.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.9pt,
  [#hl-b[1. Internship / Job Email]], [Subject: `Application: Accounts/MIS Trainee — Rahul Patel (B.Com / Tally + Excel)` | Opening: `Dear Hiring Manager, Please find attached my 1-page ATS resume. I build automated XLOOKUP/Power Query dashboards...`],
  [#hl-g[2. Leave / Absence Request]], [Subject: `Leave Request: 28-Nov-2027 (1 Day) — [Your Name]` | Body: Brief reason, confirm urgent tasks handed over to `[Colleague Name]`, reachable on phone for emergencies.],
  [#hl-o[3. Client Payment Follow-Up]], [Subject: `Gentle Reminder: Invoice #INV-204 (₹45,000) Due 25-Nov` | Polite line + attach PDF copy + mention NEFT/UPI details clearly.],
  [4. OneDrive Icons & Forms], [#hl-y[Blue Cloud] = Online-Only (0 MB disk) · Green Tick = Offline Ready · Solid Green = Always Pinned. Use M365 Forms to collect survey data directly into live Excel!],
)
#v(2pt)
#block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 2.5pt, inset: 3pt)[
  #text(size: 6.4pt, weight: "black", fill: rtech-navy)[🤖 2027 BONUS : 3 M365 COPILOT / AI PROMPTS]\
  #v(1.5pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 4pt,
    ..([#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-b[Word AI]: "Summarize this 20p contract into 5 bullet risks"]]], [#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-g[Excel AI]: "Write XLOOKUP + IFERROR for Sheet1 & Sheet2"]]], [#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-o[PPT AI]: "Create a 5-slide 16:9 pitch outline from Doc"]]])
  )
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: (left: 3.5pt + rtech-outlook, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-outlook)[💡 DID YOU KNOW? (OFFICE FACT)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[Professionals spend *28% of their workday* on email! Using 4D Inbox Zero + Quick Steps (`Ctrl+Shift+1`) gives you back 1.5 hours every single day.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-MIN LAB: Save a file in OneDrive → Right-click → Version History → See how 180-day rollback protects you!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-outlook)[🔥 "Clean inbox, safe data, and ethical habits build unstoppable workplace trust."]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_cloud_team.png", height: 62pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 08: SECTION 5 — AUTHOR HUB, 4 LIVE QR CODES & TOP 8 MNC INTERVIEW Q&A
// =============================================================================
#app-banner("SECTION 5  |  AUTHOR MENTORSHIP HUB, QR COMMUNITY & MNC INTERVIEW VAULT", "Rahul Patel · IANT Palanpur · Scannable QR Hubs · Top 6 Corporate Q&A", rgb("#047857"))

#section-banner(num: "PART 5.1", title: "Meet Your Mentor: Rahul Patel — Bridging Classroom to MNC Floor", color: rtech-navy)
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
        #text(size: 10pt, weight: "black", fill: rtech-navy)[Rahul Patel]\
        #v(1pt)
        #text(size: 7pt, weight: "bold", fill: rtech-blue)[Founder & Lead Systems Architect · RTechLab Publications]\
        #text(size: 7pt, weight: "bold", fill: rgb("#047857"))[Director & Senior Technical Expert · IANT Computer Education, Palanpur (Gujarat)]\
        #v(2pt)
        #text(size: 6.6pt, fill: rtech-navy)[With *10+ years of intensive enterprise IT, cloud & corporate training experience*, Rahul has mentored *3,000+ students* from tier-2/3 cities into leading IT, Accounting & MNC analytics careers. Inspired by the vision that every student deserves *₹2,200 enterprise quality for ₹22*, these desk companions turn complex tools into instant confidence.]
      ]
    )
  ]
)

#section-banner(num: "PART 5.2", title: "Scan QR Codes: Free Tools, Video Tutorials, Portfolio & WhatsApp Updates", color: rtech-blue)
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#F0F9FF"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rtech-blue)[Author Portfolio]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[YouTube Channel]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[`RTechLabOfficial` ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[Instagram Hub]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[`rtechlabofficial` ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[WhatsApp Community]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[Join Channel ↗]]
      ]
    ]
  ],
)

#section-banner(num: "PART 5.3", title: "Top 6 MNC & BPO Technical Interview Questions (Exact Winning Answers)", color: rtech-excel)
#table(
  columns: (2.05fr, 3.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  text(size: 6.5pt, weight: "bold", fill: white)[Recruiter Question (MIS / IT / Accounts Interview)],
  text(size: 6.5pt, weight: "bold", fill: white)[Winning Executive Answer],
  [#text(weight: "bold", fill: rtech-navy)[Q1: Why is XLOOKUP strictly better than VLOOKUP?]], [XLOOKUP defaults to Exact Match, searches left/right/up/down, returns multi-column spills, handles missing IDs natively (`[if_not_found]`), and never breaks if columns are inserted.],
  [#text(weight: "bold", fill: rtech-navy)[Q2: When use Section Break vs Page Break in Word?]], [Page Break only pushes text to next page keeping orientation locked. Section Break creates an independent layout partition—letting you insert 1 Landscape table inside a Portrait report.],
  [#text(weight: "bold", fill: rtech-navy)[Q3: Why is 'Unpivot Columns' the \#1 Power Query skill?]], [It transforms wide human-readable cross-tab reports (Jan, Feb, Mar across columns) into clean vertical Attribute-Value database rows needed for Pivot Tables & Power BI.],
  [#text(weight: "bold", fill: rtech-navy)[Q4: How does LET() speed up heavy Excel models?]], [LET assigns names to intermediate calculation ranges inside a formula so Excel evaluates large ranges once instead of repeating them, giving up to 5x faster recalculation.],
  [#text(weight: "bold", fill: rtech-navy)[Q5: How do you achieve cinematic Morph (`!!`) in PPT?]], [Duplicate a slide, reposition/scale shapes on Slide 2, select Transitions → Morph. Matching shape names prefixed with `!!` (e.g. `!!Chart`) animate smoothly across slides.],
  [#text(weight: "bold", fill: rtech-navy)[Q6: Explain the 4D Protocol for Inbox Zero in Outlook.]], [Do immediately if < 2 mins; Delegate to right owner with deadline; Defer deep work (>15 mins) directly onto Calendar time-blocks; Delete/Archive newsletters to keep inbox clear.],
  [#text(weight: "bold", fill: rtech-navy)[Q7: Pivot Table vs Power Query — when use which?]], [Power Query cleans, combines & reshapes dirty raw CSV/ERP files BEFORE analysis (ETL). Pivot Tables summarize & slice clean data interactively AFTERWARD.],
  [#text(weight: "bold", fill: rtech-navy)[Q8: How do you protect formulas while letting users type inputs?]], [Select only Input cells → `Ctrl+1` → Protection tab → Uncheck 'Locked'. Then Review → Protect Sheet. Users can type data without ever deleting formulas!],
)

#section-banner(num: "30-DAY PLAN", title: "Your 30-Day Skill Revolution Roadmap (15 Minutes Daily Practice = Office Pro)", color: rtech-ppt)
#table(
  columns: (1.25fr, 4.75fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  [#hl-b[Week 1 · MS Word]], [Re-format your Resume & 1 College Report using `Heading 1–3`, `Auto-TOC`, Section Breaks & Export PDF (#kbd[Ctrl+S] habit).],
  [#hl-g[Week 2 · Formulas]], [Practice `XLOOKUP`, `FILTER`, `SUMIFS`, `TEXTSPLIT` & `LET` on a 50-row sample Student/Sales sheet until zero `#N/A` errors occur.],
  [#hl-y[Week 3 · PQ & PPT]], [Run 1 Power Query `Unpivot` + Pivot Slicer dashboard, plus build a 5-slide 16:9 `Morph` pitch deck using only Slide Master.],
  [#hl-o[Week 4 · Shortcuts]], [Keep Page 6 beside your keyboard! Practice 10 shortcuts/day until all 150 become muscle memory—then tackle the MNC Q&A!],
)
#v(1fr)
#block(width: 100%, fill: rgb("#F0FDF4"), stroke: (left: 3.5pt + rgb("#047857"), rest: 0.65pt + dark-border), radius: 3.5pt, inset: 5pt)[
  #grid(
    columns: (1.8fr, 0.9fr),
    gutter: 6pt,
    align: (left + horizon, center + horizon),
    [
      #text(size: 7pt, weight: "black", fill: rgb("#047857"))[🏆 RTECHLAB QUALITY PLEDGE & 30-DAY INSTAGRAM CHALLENGE]\
      #v(2pt)
      #text(size: 6.45pt, weight: "bold", fill: rtech-navy)[15 Minutes Daily = Career Transformation! Master all 150 shortcuts in 30 days, post a photo of Page 6 on your desk, and tag `@rtechlabofficial` on Instagram to get featured by Rahul Patel!]
    ],
    [
      #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
        #image("02_BRAND_ASSETS/office_word_desk.png", height: 56pt, fit: "contain")
      ]
    ]
  )
]
#v(4pt)
#align(center)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 0.9pt + rtech-blue,
    radius: 3.5pt,
    inset: (x: 8pt, y: 4pt),
    text(size: 6.7pt, weight: "bold", fill: rtech-blue)[🚀 Ready for Complete Mastery? Get the 113-Page Illustrated Textbook + 6 Editable .XLSX Templates in the ₹49 Book or ₹149 Career Suite at #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]]
  )
]
