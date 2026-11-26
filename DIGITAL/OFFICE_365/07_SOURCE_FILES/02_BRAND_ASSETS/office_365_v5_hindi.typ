// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE PRODUCTIVITY CHEAT SHEET V5 (ENGLISH)
// 150 Numbered Shortcuts · Dense Section-Wise Layout · 8 Pages A4
// Author: Rahul Patel · RTechLab Publications · Edition 1 (2027)
// =============================================================================

#set document(title: "Microsoft 365 Cheat Sheet V5 (Hindi)", author: "Rahul Patel · RTechLab")

#set page(
  paper: "a4",
  margin: (top: 8.5mm, bottom: 7.5mm, left: 7mm, right: 7mm),
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
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [
          #box(height: 11pt)[#image("rtechlab_official_badge_logo.png", height: 11pt)]
          #h(3pt)#text(size: 7.5pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 7.5pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 Enterprise Shortcut & Productivity Cheat Sheet — V5 (Hindi)]
        ],
        [
          #text(size: 7pt, weight: "bold", fill: rgb("#107C41"))[Word · Excel · PowerPoint · Outlook · Cloud]
          #text(size: 7pt, fill: rgb("#64748B"))[ · Rahul Patel]
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
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 6.4pt, fill: rgb("#64748B"))[#text(fill: rgb("#0284C7"))[●] 150 प्रोडक्शन शॉर्टकट · मुफ़्त टूल्स: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*] · प्रौद्योगिकी को व्यावहारिक बनाना]],
        [#box(fill: rgb("#F1F5F9"), radius: 3pt, inset: (x: 5pt, y: 1.5pt), stroke: 0.4pt + rgb("#CBD5E1"))[#text(size: 6.6pt, weight: "bold", fill: rgb("#0F172A"))[Page #counter(page).display() of 8]]]
      )
    ]
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 6.9pt, fill: rgb("#0F172A"), spacing: 100%)
#set par(justify: false, leading: 0.38em, first-line-indent: 0pt)

// ── Brand Colors ────────────────────────────────────────────────────────────
#let navy    = rgb("#0F172A")
#let blue    = rgb("#0284C7")
#let emerald = rgb("#059669")
#let word-c  = rgb("#185ABD")
#let excel-c = rgb("#107C41")
#let ppt-c   = rgb("#C43E1C")
#let out-c   = rgb("#0078D4")
#let muted   = rgb("#475569")
#let dborder = rgb("#1E293B")

// ── Helpers ─────────────────────────────────────────────────────────────────
#let hl-y(b) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: navy, weight: "bold")[#b]]
#let hl-g(b) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#b]]
#let hl-b(b) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#b]]
#let hl-o(b) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#b]]
#let kbd(k)  = box(fill: rgb("#F1F5F9"), stroke: 0.6pt + dborder, radius: 2pt, inset: (x: 2.5pt, y: 0.6pt))[#text(size: 6.5pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: navy)[#k]]

// Big colorful app-section banner
#let app-banner(title, subtitle, color) = {
  block(width: 100%, fill: color, radius: (top: 4pt, bottom: 0pt), inset: (x: 7pt, y: 3pt))[
    #text(size: 10pt, weight: "black", fill: white)[#title]
    #h(6pt)
    #text(size: 7pt, weight: "bold", fill: rgb("#FFFFFFB0"))[#subtitle]
  ]
}

// Thin numbered section sub-banner
#let sub-banner(num, title, color) = {
  v(2pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3pt + color, rest: 0.5pt + dborder),
    radius: (right: 3pt),
    inset: (x: 5pt, y: 2pt),
  )[
    #box(fill: color, radius: 2pt, inset: (x: 3.5pt, y: 1pt))[#text(size: 6pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]]
    #h(4pt)#text(size: 7.8pt, weight: "black", fill: navy)[#title]
  ]
  v(1pt)
}

// Number badge + key shortcut row builder (returns 2-cell tuple for 4-col grid)
#let sc(n, k, f) = (
  [#box(fill: navy, inset: (x: 2.5pt, y: 1pt), radius: 2pt)[#text(size: 5.8pt, fill: white, weight: "black")[#n]] #h(2pt) #kbd(k)],
  [#f]
)

// 4-column shortcut grid (header + flat list of (key-cell, fn-cell) pairs)
#let sc-grid(hdr-color, rows) = {
  table(
    columns: (1.55fr, 1.65fr, 1.55fr, 1.65fr),
    stroke: 0.6pt + dborder,
    fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
    align: (left + horizon, left + horizon, left + horizon, left + horizon),
    inset: 2.5pt,
    text(size: 6.5pt, weight: "bold", fill: white)[No. · Shortcut Key],
    text(size: 6.5pt, weight: "bold", fill: white)[Function],
    text(size: 6.5pt, weight: "bold", fill: white)[No. · Shortcut Key],
    text(size: 6.5pt, weight: "bold", fill: white)[Function],
    ..rows
  )
}

// 3-col formula table with standard header
#let f-table(rows) = {
  table(
    columns: (1.4fr, 2.6fr, 2fr),
    stroke: 0.6pt + dborder,
    fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
    align: (left + horizon, left + horizon, left + horizon),
    inset: 2.6pt,
    ..rows
  )
}

// Number box for formula rows
#let nb(n, c) = box(fill: c, inset: (x: 2.5pt, y: 1pt), radius: 2pt)[#text(fill: white, weight: "black", size: 5.8pt)[#n]]

// =============================================================================
// PAGE 01 — MASTER COVER · BRAND · 8-PAGE INDEX
// =============================================================================
#align(center)[
  #grid(columns: (auto, 1fr), gutter: 8pt, align: (horizon, horizon),
    [#box(height: 30pt)[#image("rtechlab_official_badge_logo.png", height: 30pt)]],
    [#align(left)[
      #text(size: 10.5pt, weight: "black", tracking: 1.5pt, fill: blue)[RTECHLAB व्यावसायिक शिक्षण प्रणाली]\
      #text(size: 6.8pt, fill: muted)[प्रौद्योगिकी को व्यावहारिक बनाना · गुजरात \#1 वोकेशनल आईटी ट्रैक · संस्करण 1 (2027)]
    ]]
  )
  #v(2pt)
  #line(length: 100%, stroke: 0.8pt + rgb("#CBD5E1"))
  #v(2pt)
  #text(size: 9.5pt, weight: "black", fill: navy)[राहुल पटेल — संस्थापक और सिस्टम्स आर्किटेक्ट, RTechLab]\
  #text(size: 6.8pt, fill: muted)[निदेशक, IANT कंप्यूटर एजुकेशन पालनपुर · 10+ वर्ष एंटरप्राइज़ IT · 3,000+ छात्र प्रशिक्षित]
  #v(3pt)
  #line(length: 18%, stroke: 1.5pt + blue)
  #v(3pt)
  #image("microsoft_365_official_logo.png", width: 50%)
  #v(2.5pt)
  #text(size: 17pt, font: ("Segoe UI", "Arial"), weight: "black", fill: navy, tracking: 0.5pt)[MICROSOFT 365 एंटरप्राइज़]
  #v(1pt)
  #text(size: 9.5pt, font: ("Segoe UI", "Arial"), weight: "black", fill: blue)[150 शॉर्टकट और फॉर्मूला चीट शीट — प्रोडक्शन एडिशन V5]
  #v(1pt)
  #text(size: 7pt, weight: "bold", fill: muted)[Word (50) · Excel (60: फॉर्मूला + हॉटकी) · PowerPoint (30) · Outlook · Cloud · लेखक हब]
  #v(2.5pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + blue, radius: 10pt, inset: (x: 10pt, y: 2pt))[
    #text(size: 6.6pt, weight: "black", fill: rgb("#0369A1"))[★ हाई-डेंसिटी डेस्क साथी · MIS विश्लेषक · कॉर्पोरेट अकाउंटेंट · IT प्रोफेशनल · कॉलेज टॉपर्स ★]
  ]
  #v(3.5pt)

  // ── INDEX TABLE ────────────────────────────────────────────────────────────
  #block(width: 100%, stroke: 0.7pt + dborder, fill: rgb("#F8FAFC"), radius: 4pt, inset: (x: 6pt, y: 4pt))[
    #align(center)[#text(size: 7.4pt, weight: "black", fill: navy)[📑  आधिकारिक 8-पेज इंडेक्स — Microsoft 365 एंटरप्राइज़ चीट शीट V5 (हिंदी)]]
    #v(2pt)
    #table(
      columns: (0.5fr, 1.5fr, 3.9fr, 0.7fr),
      stroke: 0.6pt + dborder,
      fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F1F5F9") } else { white },
      align: (center, left + horizon, left + horizon, center),
      inset: 2.6pt,
      text(size: 6.6pt, weight: "bold", fill: white)[Pg.],
      text(size: 6.6pt, weight: "bold", fill: white)[Section],
      text(size: 6.6pt, weight: "bold", fill: white)[Core Content],
      text(size: 6.6pt, weight: "bold", fill: white)[Count],

      [#box(fill: navy, inset: (x:2pt, y:1pt), radius: 2pt)[#text(fill: white, weight: "bold", size: 6.5pt)[P.1]]],
      [#text(weight: "bold", fill: blue)[कवर और इंडेक्स]],
      [आधिकारिक M365 + RTechLab ब्रांडिंग, लेखक प्रमाण-पत्र, पृष्ठ संख्या सहित 8-पेज इंडेक्स।],
      [—],

      [#box(fill: word-c, inset: (x:2pt, y:1pt), radius: 2pt)[#text(fill: white, weight: "bold", size: 6.5pt)[P.2]]],
      [#text(weight: "bold", fill: word-c)[Word — फॉर्मेटिंग A]],
      [स्टाइल हायरार्की, सेक्शन ब्रेक, ट्रैक चेंजेज़, मेल मर्ज, टेबल टिप्स + शॉर्टकट 01–25।],
      [#text(weight: "bold", fill: word-c)[25]],

      [#box(fill: word-c, inset: (x:2pt, y:1pt), radius: 2pt)[#text(fill: white, weight: "bold", size: 6.5pt)[P.3]]],
      [#text(weight: "bold", fill: word-c)[Word — शॉर्टकट B]],
      [टेबल, फुटनोट, मैक्रो, संदर्भ, समीक्षा उपकरण + शॉर्टकट 26–50।],
      [#text(weight: "bold", fill: word-c)[25]],

      [#box(fill: excel-c, inset: (x:2pt, y:1pt), radius: 2pt)[#text(fill: white, weight: "bold", size: 6.5pt)[P.4]]],
      [#text(weight: "bold", fill: excel-c)[Excel — फॉर्मूला]],
      [XLOOKUP, FILTER, LET, SUMIFS, डायनामिक ऐरे, 30 आवश्यक फॉर्मूला (नं. 51–80)।],
      [#text(weight: "bold", fill: excel-c)[30]],

      [#box(fill: excel-c, inset: (x:2pt, y:1pt), radius: 2pt)[#text(fill: white, weight: "bold", size: 6.5pt)[P.5]]],
      [#text(weight: "bold", fill: excel-c)[Excel — शॉर्टकट]],
      [टॉप 30 MIS हॉटकी + Power Query 6-स्टेज ETL पाइपलाइन (नं. 81–110)।],
      [#text(weight: "bold", fill: excel-c)[30]],

      [#box(fill: ppt-c, inset: (x:2pt, y:1pt), radius: 2pt)[#text(fill: white, weight: "bold", size: 6.5pt)[P.6]]],
      [#text(weight: "bold", fill: ppt-c)[PowerPoint]],
      [स्लाइड मास्टर, मॉर्फ, टॉप 30 प्रेज़ेंटर + डिज़ाइन शॉर्टकट (नं. 111–140)।],
      [#text(weight: "bold", fill: ppt-c)[30]],

      [#box(fill: out-c, inset: (x:2pt, y:1pt), radius: 2pt)[#text(fill: white, weight: "bold", size: 6.5pt)[P.7]]],
      [#text(weight: "bold", fill: out-c)[Outlook और Cloud]],
      [4D इनबॉक्स ज़ीरो, 10 Outlook शॉर्टकट (नं. 141–150), OneDrive और M365 ऑनलाइन लाभ।],
      [#text(weight: "bold", fill: out-c)[10]],

      [#box(fill: rgb("#047857"), inset: (x:2pt, y:1pt), radius: 2pt)[#text(fill: white, weight: "bold", size: 6.5pt)[P.8]]],
      [#text(weight: "bold", fill: rgb("#047857"))[लेखक हब और MNC Q&A]],
      [राहुल पटेल प्रोफाइल, 4 QR हब (पोर्टफोलियो / YouTube / Instagram / WhatsApp), टॉप 5 MNC Q&A।],
      [—],
    )
  ]
  #v(3pt)
  #grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 4pt,
    [#block(stroke: 0.6pt+dborder, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[#text(size: 9pt, weight: "black", fill: navy)[150] #text(size: 6pt, weight: "bold", fill: excel-c)[कुल शॉर्टकट]]],
    [#block(stroke: 0.6pt+dborder, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[#text(size: 9pt, weight: "black", fill: navy)[30+] #text(size: 6pt, weight: "bold", fill: blue)[Excel फॉर्मूला]]],
    [#block(stroke: 0.6pt+dborder, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[#text(size: 9pt, weight: "black", fill: navy)[3 Apps] #text(size: 6pt, weight: "bold", fill: word-c)[पूर्ण कवर्ड]]],
    [#block(stroke: 0.6pt+dborder, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[#text(size: 9pt, weight: "black", fill: navy)[100%] #text(size: 6pt, weight: "bold", fill: rgb("#047857"))[MNC तैयार]]],
  )
]
#pagebreak()

// =============================================================================
// PAGE 02 — MICROSOFT WORD: SECTION A — Formatting + Shortcuts 01–25
// =============================================================================
#app-banner("W   MICROSOFT WORD 365  — Section A", "Advanced Formatting, Styles, Breaks & Document Architecture", word-c)
#v(1.5pt)
#align(center)[#text(size: 8.5pt, weight: "black", fill: navy)[पृष्ठ 2 · Word सेक्शन A: स्टाइल, मेल मर्ज, ट्रैक चेंजेज़ और प्रोडक्शन शॉर्टकट (नं. 01–25)]]
#v(2pt)

#sub-banner("CONCEPT A1", "Heading Styles, TOC, Section Breaks & Document Architecture — Corporate Foundation", word-c)
#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  stroke: 0.6pt + dborder,
  fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  text(size: 6.6pt, weight: "bold", fill: white)[Concept / Tool],
  text(size: 6.6pt, weight: "bold", fill: white)[Why It Matters — Job & College Use],
  text(size: 6.6pt, weight: "bold", fill: white)[Exact Steps / Shortcut],

  [#hl-b[Heading 1–3 Style Linkage]], [Never number manually — 100-page reports auto-number perfectly without breaking.], [Multilevel List → Define New → More → Link level to Heading style (1, 2, 3).],
  [#hl-y[Auto Table of Contents]], [Auto-generated TOC with live page numbers — no retyping ever needed.], [References → Table of Contents → Automatic Table 1. #kbd[F9] = refresh all numbers.],
  [#hl-g[Navigation Pane Reorder]], [Restructure entire report by dragging headings in real-time — no cut-paste!], [#kbd[Ctrl+F] → Headings tab → drag heading title up/down to reorder sections.],
  [#hl-o[Section vs. Page Break]], [Landscape single page inside portrait doc — mandatory for MNC charts & tables.], [Layout → Breaks → Next Page (Section). Set different orientation per section only.],
  [Track Changes Protocol], [All reviewer edits color-coded — required for HR, Legal, Finance documentation.], [Review → Track Changes ON. Accept All: #kbd[Alt+H+AC]. Reject: #kbd[Alt+H+RJ].],
  [Mail Merge Engine], [Auto-generate 500 personalised offer letters from one Excel list in 10 minutes.], [Mailings → Start Mail Merge → Letters → Select Recipients (Excel file) → Insert fields.],
  [Restrict Editing], [Lock document — reviewers can only comment, not edit or delete content.], [Review → Restrict Editing → Allow only Comments. Set password to enforce.],
  [Compare Documents], [Side-by-side diff of two contract versions — highlights every single change.], [Review → Compare → Choose Original + Revised document. Merged result opens.],
)

#v(1.5pt)
#sub-banner("SHORTCUTS 01–25", "Word के टॉप 25 डेली स्पीड शॉर्टकट — फॉर्मेटिंग, नेविगेशन और एडिटिंग", word-c)
#sc-grid(word-c, (
  ..sc("01", "Ctrl + B / I / U", [#hl-y[Bold] / Italic / Underline selected text]),
  ..sc("02", "Ctrl + E / L / R", [Center / Left / Right align paragraph]),
  ..sc("03", "Ctrl + J", [#hl-g[Justify] text — perfect corporate margin]),
  ..sc("04", "Ctrl + 1 / 2 / 5", [Single / Double / 1.5× line spacing]),
  ..sc("05", "Ctrl + Shift + > / <", [Increase / Decrease font size step by step]),
  ..sc("06", "Ctrl + Space", [#hl-o[Strip all manual formatting → Normal style]]),
  ..sc("07", "Ctrl + Shift + C/V", [Format Painter: Copy style / Paste style]),
  ..sc("08", "Shift + F3", [Cycle UPPERCASE → lowercase → Title Case]),
  ..sc("09", "Ctrl + Enter", [Insert clean Page Break — never press Enter 20×!]),
  ..sc("10", "Ctrl + Shift + Enter", [Insert Section Break (Next Page) instantly]),
  ..sc("11", "Alt + Shift + D", [Insert today's auto-updating Date field]),
  ..sc("12", "Alt + Shift + P", [Insert auto-updating Page Number field]),
  ..sc("13", "Ctrl + F", [Open Navigation Pane + Headings + Find box]),
  ..sc("14", "Ctrl + H", [Find & Replace — bulk text substitution]),
  ..sc("15", "Ctrl + G / F5", [Go To: Page / Line / Bookmark instantly]),
  ..sc("16", "Ctrl + K", [Insert Hyperlink (URL or internal bookmark)]),
  ..sc("17", "F7", [Run Spell & Grammar Check full document scan]),
  ..sc("18", "Ctrl + Shift + E", [Toggle Track Changes on / off]),
  ..sc("19", "Alt + Shift + Up/Dn", [#hl-b[Move paragraph / table row up or down]]),
  ..sc("20", "Ctrl + Backspace/Del", [Delete previous / next full word instantly]),
  ..sc("21", "Ctrl + [ / ]", [Decrease / Increase font size by exactly 1pt]),
  ..sc("22", "Ctrl + D", [Open Font dialog — advanced character spacing]),
  ..sc("23", "Ctrl + M / Shift+M", [Increase / Decrease paragraph indent level]),
  ..sc("24", "Ctrl + Q", [Remove all paragraph formatting, keep text]),
  ..sc("25", "Ctrl + Alt + 1/2/3", [#hl-y[Apply Heading 1 / 2 / 3 style instantly]]),
))
#pagebreak()

// =============================================================================
// PAGE 03 — MICROSOFT WORD: SECTION B — Advanced + Shortcuts 26–50
// =============================================================================
#app-banner("W   MICROSOFT WORD 365  — Section B", "उन्नत टेबल, फुटनोट, मैक्रो, संदर्भ और पावर-यूज़र ट्रिक्स", word-c)
#v(1.5pt)
#align(center)[#text(size: 8.5pt, weight: "black", fill: navy)[पृष्ठ 3 · Word सेक्शन B: टेबल, मैक्रो, संदर्भ और 25 और शॉर्टकट (नं. 26–50)]]
#v(2pt)

#sub-banner("CONCEPT B1", "Word Tables, References, AutoText & Macro Automation — Advanced Corporate Skills", word-c)
#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  stroke: 0.6pt + dborder,
  fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  text(size: 6.6pt, weight: "bold", fill: white)[Skill / Tool],
  text(size: 6.6pt, weight: "bold", fill: white)[Real-World Application],
  text(size: 6.6pt, weight: "bold", fill: white)[How-To Steps],

  [#hl-b[Tab inside Table]], [Move cell-to-cell; Tab at last cell adds a new row automatically without clicking.], [Press #kbd[Tab] to advance. #kbd[Shift+Tab] to go back. Enter = new paragraph same cell.],
  [#hl-y[Sort Table Data]], [Alphabetise or sort numeric columns in a table — no need to open Excel.], [Select column → Table Design → Sort → By Column 1 (A→Z or Z→A).],
  [Convert Text → Table], [Import comma-separated CSV data as a clean formatted Word table instantly.], [Select text → Insert → Table → Convert Text to Table → delimiter: comma.],
  [#hl-g[Footnotes / Endnotes]], [Required for research papers, legal contracts, MNC proposals — auto-numbered.], [References → Insert Footnote (#kbd[Alt+Ctrl+F]). Auto-numbered at page bottom.],
  [Cross-Reference], [Link "See Figure 3" so it auto-updates if figure numbers change — dynamic!], [References → Cross-reference → Reference type: Figure. Insert as hyperlink.],
  [Building Blocks (AutoText)], [Type 2 letters → Word expands to full company address / standard clause.], [Insert → Quick Parts → AutoText → Save selection. Type name + #kbd[F3] to expand.],
  [Macro (Record & Run)], [1-click to format heading, add logo, set margins — saves hours monthly.], [Developer → Record Macro → do actions → Stop. Assign shortcut. #kbd[Alt+F8] = run.],
  [#hl-o[Template (.dotx)]], [Company-wide standard branding — logo, margins, fonts locked across entire team.], [File → Save As → type: Word Template (.dotx). Team opens it as new document.],
)

#v(1.5pt)
#sub-banner("SHORTCUTS 26–50", "Word उन्नत शॉर्टकट — टेबल, रिव्यू, मैक्रो और संदर्भ नेविगेशन", word-c)
#sc-grid(word-c, (
  ..sc("26", "Alt + Ctrl + F", [Insert Footnote at cursor position]),
  ..sc("27", "Alt + Ctrl + D", [Insert Endnote at document end]),
  ..sc("28", "Ctrl + Shift + N", [Apply Normal (body text) style to selection]),
  ..sc("29", "Ctrl + Alt + S", [Split window — view two parts of same doc]),
  ..sc("30", "F4 / Ctrl + Y", [#hl-y[Repeat last formatting action on selection]]),
  ..sc("31", "Ctrl + Shift + K", [Toggle small caps formatting on / off]),
  ..sc("32", "Ctrl + = / +", [Subscript H2O / Superscript m2 toggle]),
  ..sc("33", "Ctrl + Shift + H", [Apply Hidden text — invisible on print]),
  ..sc("34", "Alt + F8", [Open Macros dialog — run / record macro]),
  ..sc("35", "Alt + F9", [Toggle field codes view (show merge fields)]),
  ..sc("36", "Ctrl + F9", [Insert blank field code at cursor position]),
  ..sc("37", "F9", [#hl-g[Update ALL fields — TOC, dates, page numbers]]),
  ..sc("38", "Ctrl + Shift+F8+Arrows", [Block / column select mode in document]),
  ..sc("39", "Alt + PageUp/Down", [Move to first/last cell of column in table]),
  ..sc("40", "Tab (in table)", [Move to next cell; create new row at end]),
  ..sc("41", "Shift + Tab", [Move to previous cell in table backward]),
  ..sc("42", "Ctrl + Shift + G", [Open Word Count dialog (words, pages, chars)]),
  ..sc("43", "Ctrl + F2", [Print Preview — check layout before printing]),
  ..sc("44", "Ctrl + P", [Open Print dialog — print current document]),
  ..sc("45", "Alt + Ctrl + M", [Insert Comment at cursor / selection]),
  ..sc("46", "Ctrl + Shift + P", [Open Font Size field in ribbon directly]),
  ..sc("47", "Ctrl + Alt + K", [Start AutoFormat — apply automatic styles]),
  ..sc("48", "Ctrl + W", [Close document window (prompt to save)]),
  ..sc("49", "Ctrl + S / F12", [#hl-o[Save / Save As — do it every 5 minutes!]]),
  ..sc("50", "Alt + H + H", [#hl-y[Text Highlight Color — mark key content]]),
))
#pagebreak()

// =============================================================================
// PAGE 04 — MICROSOFT EXCEL: FORMULA ENGINE — Shortcuts 51–80
// =============================================================================
#app-banner("X   MICROSOFT EXCEL 365  — Formula Engine", "XLOOKUP · डायनामिक ऐरे · LET · टेक्स्ट फ़ंक्शन · 30 ज़रूरी फॉर्मूला", excel-c)
#v(1.5pt)
#align(center)[#text(size: 8.5pt, weight: "black", fill: navy)[पृष्ठ 4 · Excel सेक्शन A: MIS, अकाउंट्स और डेटा विश्लेषण के लिए 30 आवश्यक फॉर्मूला (नं. 51–80)]]
#v(2pt)

#sub-banner("FORMULAS 51–65", "लुकअप और संदर्भ दक्षता — XLOOKUP, INDEX-MATCH, शर्तें और डायनामिक ऐरे", excel-c)
#f-table((
  text(size: 6.5pt, weight: "bold", fill: white)[No. · Formula],
  text(size: 6.5pt, weight: "bold", fill: white)[Syntax & Real-World Example],
  text(size: 6.5pt, weight: "bold", fill: white)[Output & Pro Tip],

  [#nb("51", excel-c) #hl-g[`=XLOOKUP(...)`]],
  [`=XLOOKUP(F2, A2:A500, D2:D500, "Not Found")` — find salary by ID.],
  [#hl-y[Looks left!] No column counting. Inserting columns won't break formula.],

  [#nb("52", excel-c) XLOOKUP Multi-Col],
  [`=XLOOKUP(F2, A:A, B:D)` — spills Name, Dept, Salary in ONE formula.],
  [1 formula returns 3 columns auto-filled. No copy or drag needed.],

  [#nb("53", excel-c) 2-Way XLOOKUP],
  [`=XLOOKUP(A10, A2:A6, XLOOKUP(B9, B1:F1, B2:F6))` — row + col lookup.],
  [Replaces INDEX-MATCH-MATCH — cleaner 2D grid lookup.],

  [#nb("54", excel-c) Reverse Search],
  [`=XLOOKUP(G2, Dates, Sales, , 0, -1)` — latest entry first (bottom-up).],
  [search\_mode=-1 scans bottom-to-top. No sorting needed.],

  [#nb("55", excel-c) INDEX + MATCH],
  [`=INDEX(D2:D100, MATCH(F2, A2:A100, 0))` — classic 2-directional lookup.],
  [Works in older Excel too. Lock arrays with #kbd[F4] for absolute ref.],

  [#nb("56", excel-c) `=IFERROR`],
  [`=IFERROR(XLOOKUP(...),"Not Found")` — hide error values cleanly.],
  [Always wrap lookup formulas in IFERROR for professional clean reports.],

  [#nb("57", excel-c) `=VLOOKUP`],
  [`=VLOOKUP(F2, A:D, 3, FALSE)` — legacy, still used in 90% of MNCs.],
  [col\_index=3 is 3rd column from lookup start. FALSE = exact match always.],

  [#nb("58", excel-c) `=FILTER`],
  [`=FILTER(A2:C100, B2:B100="Delhi", "No Result")` — extract matching rows.],
  [#hl-y[Spills results auto!] Replaces Advanced Filter entirely. Combine with SORT.],

  [#nb("59", excel-c) `=UNIQUE`],
  [`=UNIQUE(A2:A100)` — deduplicated list from raw column data.],
  [Combine: `=SORT(UNIQUE(A2:A100))` for alphabetical unique list.],

  [#nb("60", excel-c) `=SORT` / `SORTBY`],
  [`=SORT(A2:C100, 2, -1)` — sort by column 2, descending. Spills auto.],
  [SORTBY sorts by a different column not in the returned range.],

  [#nb("61", excel-c) #hl-b[`=LET(...)`]],
  [`=LET(r, D2:D100, c, E2:E100, margin, (r-c)/r, IF(margin>0.2,"High","Low"))`],
  [#hl-y[5x speed boost!] Name variables once; Excel calculates them once only.],

  [#nb("62", excel-c) `=SUMIFS`],
  [`=SUMIFS(Sales, Region, "West", Year, 2027)` — multi-condition sum.],
  [Sum range comes FIRST. Enclose operators in quotes (">50000").],

  [#nb("63", excel-c) `=COUNTIFS`],
  [`=COUNTIFS(Dept, "Sales", Salary, ">50000")` — count matching rows.],
  [Same structure as SUMIFS. Perfect for MIS dashboards and reports.],

  [#nb("64", excel-c) `=IFS`],
  [`=IFS(A2>=90,"A", A2>=75,"B", A2>=60,"C", TRUE,"F")` — grade calc.],
  [Cleaner than nested IF. Final TRUE = else clause (always gets a grade).],

  [#nb("65", excel-c) `=IF` Nested],
  [`=IF(A2>=90,"A", IF(A2>=75,"B", IF(A2>=60,"C","F")))` — classic grade.],
  [Max 3–4 levels of nesting. Use IFS for more conditions — cleaner code.],
))

#v(1.5pt)
#sub-banner("FORMULAS 66–80", "टेक्स्ट ट्रांसफॉर्मर, दिनांक और राउंडिंग फ़ंक्शन — डेटा क्लीनिंग और रिपोर्टिंग", excel-c)
#f-table((
  text(size: 6.5pt, weight: "bold", fill: white)[No. · Formula],
  text(size: 6.5pt, weight: "bold", fill: white)[Syntax & Real-World Example],
  text(size: 6.5pt, weight: "bold", fill: white)[Output & Pro Tip],

  [#nb("66", excel-c) #hl-g[`=TEXTSPLIT`]],
  [`=TEXTSPLIT(A2, ",", ";")` — split string into grid of rows and columns.],
  [Splits by row AND column delimiters simultaneously. No helper columns.],

  [#nb("67", excel-c) `=TEXTBEFORE/AFTER`],
  [`=TEXTBEFORE(A2,"@")` → username. `=TEXTAFTER(A2,"@")` → domain.],
  [Extract email parts cleanly — no FIND+MID complexity needed.],

  [#nb("68", excel-c) `=TRIM` + `=CLEAN`],
  [`=TRIM(CLEAN(A2))` — remove extra spaces + hidden non-printing chars.],
  [Run this FIRST on any imported or pasted data. Prevents formula errors.],

  [#nb("69", excel-c) `=SUBSTITUTE`],
  [`=SUBSTITUTE(A2,"Ltd","Limited")` — replace text string in a cell.],
  [Case-sensitive. 4th argument replaces only the Nth occurrence.],

  [#nb("70", excel-c) `=TEXTJOIN`],
  [`=TEXTJOIN(", ", TRUE, A2:A10)` — join list with delimiter.],
  [TRUE = skip blank cells automatically. Best for joining names or IDs.],

  [#nb("71", excel-c) `=TEXT`],
  [`=TEXT(A2, "DD-MMM-YYYY")` → 25-Nov-2027 (formatted as text).],
  [Format numbers/dates as text for reports, merge fields & concatenation.],

  [#nb("72", excel-c) `=DATEDIF`],
  [`=DATEDIF(A2, TODAY(), "Y")` → employee age in complete years.],
  [Calculate service years, age, loan tenure. "YM" = months remainder.],

  [#nb("73", excel-c) `=NETWORKDAYS`],
  [`=NETWORKDAYS(A2, B2, holidays)` — working days between two dates.],
  [Excludes weekends and optional holidays list. For deadline tracking.],

  [#nb("74", excel-c) `=ROUND` / `ROUNDUP`],
  [`=ROUND(A2*0.18, 2)` — GST 18% rounded to 2 decimal places.],
  [ROUNDUP always rounds away from zero (ceiling). ROUND = standard.],

  [#nb("75", excel-c) `=SEQUENCE`],
  [`=SEQUENCE(10, 3, 1, 5)` — 10 rows x 3 cols starting 1, step 5.],
  [Generate serial numbers, date series, or multiplication tables instantly.],

  [#nb("76", excel-c) `=AVERAGEIFS`],
  [`=AVERAGEIFS(Marks, Class, "10A", Subject, "Math")` — conditional avg.],
  [Average with multiple criteria. For exam analysis and KPI dashboards.],

  [#nb("77", excel-c) `=MATCH`],
  [`=MATCH("Delhi", A2:A100, 0)` — returns row position number.],
  [Use as position pointer inside INDEX for flexible 2-way lookup.],

  [#nb("78", excel-c) `=OFFSET`],
  [`=OFFSET(A1, 2, 1, 5, 2)` — dynamic range 5 rows x 2 cols.],
  [Use for dynamic chart ranges and rolling average windows.],

  [#nb("79", excel-c) `=CONCAT`],
  [`=CONCAT(A2," ",B2," - ",C2)` — join first name, last name, ID.],
  [Ampersand `&` works too: `=A2&" "&B2`. No separator arg like TEXTJOIN.],

  [#nb("80", excel-c) `=ISNUMBER`/`ISTEXT`],
  [`=IF(ISNUMBER(A2), "Number", "Text")` — diagnose mixed data type.],
  [Use to debug VLOOKUP failures caused by text-formatted numbers.],
))
#pagebreak()

// =============================================================================
// PAGE 05 — MICROSOFT EXCEL: TOP 30 SHORTCUTS (Nos. 81–110)
// =============================================================================
#app-banner("X   MICROSOFT EXCEL 365  — Speed Shortcuts", "MIS और फाइनेंस टीम के लिए टॉप 30 पावर हॉटकी + Power Query ETL पाइपलाइन", excel-c)
#v(1.5pt)
#align(center)[#text(size: 8.5pt, weight: "black", fill: navy)[पृष्ठ 5 · Excel सेक्शन B: 30 स्पीड हॉटकी (नं. 81–110) + Power Query 6-स्टेज ETL पाइपलाइन]]
#v(2pt)

#sub-banner("SHORTCUTS 81–110", "Excel टॉप 30 हॉटकी — MIS एग्ज़ीक्यूटिव, अकाउंटेंट और डेटा एनालिस्ट के लिए ज़रूरी", excel-c)
#sc-grid(excel-c, (
  ..sc("81", "Ctrl + T", [#hl-g[Convert range to Table — structured reference]]),
  ..sc("82", "Alt + =", [#hl-y[AutoSum — instant SUM formula injection]]),
  ..sc("83", "Ctrl+Alt+V → V", [Paste Values only — strip formulas cleanly]),
  ..sc("84", "F4", [Toggle \$A\$1 → A\$1 → \$A1 → A1 reference cycle]),
  ..sc("85", "Ctrl + 1", [Open Format Cells dialog — full formatting options]),
  ..sc("86", "Alt + H + O + I", [Auto-fit column widths across selection]),
  ..sc("87", "Ctrl + Arrow Keys", [Jump to last cell of continuous data region]),
  ..sc("88", "Ctrl + Shift + Arrow", [Select to edge of data — fast block select]),
  ..sc("89", "Ctrl + D / R", [Fill Down / Fill Right from first cell value]),
  ..sc("90", "Ctrl + E", [#hl-b[Flash Fill — pattern auto-detect and populate]]),
  ..sc("91", "Ctrl + ~", [Toggle formula view — see all formulas at once]),
  ..sc("92", "Ctrl + ;", [Insert today's Date — static, does not change]),
  ..sc("93", "Ctrl + Shift + :", [Insert current Time — static timestamp]),
  ..sc("94", "Shift + Space", [Select the entire current Row instantly]),
  ..sc("95", "Ctrl + Space", [Select the entire current Column instantly]),
  ..sc("96", "Ctrl+– / Ctrl+Shift++", [Delete selected row/col / Insert new row/col]),
  ..sc("97", "Alt + A + C", [Clear all Data Filters — restore full view]),
  ..sc("98", "Alt + H + V + E", [Paste Transpose — swap rows and columns]),
  ..sc("99", "F2", [Enter edit mode — cursor jumps to end of formula]),
  ..sc("100", "Alt + Enter", [#hl-o[New line inside same cell — multi-line data]]),
  ..sc("101", "Ctrl + F1", [Collapse / Expand Ribbon for more screen space]),
  ..sc("102", "Ctrl + PageDown/Up", [Navigate to Next / Previous sheet tab]),
  ..sc("103", "Ctrl + Shift + L", [Toggle AutoFilter drop-down arrows on/off]),
  ..sc("104", "F12", [Save As — choose save location and format]),
  ..sc("105", "Alt + N + V", [Create Pivot Table from selected data range]),
  ..sc("106", "Ctrl + 5", [Apply / Remove Strikethrough formatting]),
  ..sc("107", "Shift + F2", [Insert or edit Cell Comment / Note]),
  ..sc("108", "Alt + H + M + C", [Merge and Centre selected cells]),
  ..sc("109", "Ctrl + Shift + \$", [Apply Currency number format to selection]),
  ..sc("110", "Ctrl + Shift + %", [#hl-y[Apply Percentage format to selection]]),
))

#v(1.5pt)
#sub-banner("POWER QUERY ETL", "6-स्टेज ऑटोमेटेड डेटा पाइपलाइन — ज़ीरो VBA, ज़ीरो मैन्युअल स्क्रबिंग, 1-क्लिक मंथली रिफ्रेश", blue)
#table(
  columns: (0.5fr, 1.3fr, 2.6fr, 1.6fr),
  stroke: 0.6pt + dborder,
  fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (center, left + horizon, left + horizon, left + horizon),
  inset: 2.6pt,
  text(size: 6.5pt, weight: "bold", fill: white)[Step],
  text(size: 6.5pt, weight: "bold", fill: white)[Action],
  text(size: 6.5pt, weight: "bold", fill: white)[What Happens (Under the Hood)],
  text(size: 6.5pt, weight: "bold", fill: white)[Production Benefit],

  [#box(fill: navy, inset: (x:2pt,y:1pt), radius: 2pt)[#text(fill: white, weight: "black")[01]]],
  [#text(weight: "bold", fill: blue)[Connect (Extract)]],
  [Data → Get Data → From File / SQL / SAP / Folder. Auto-reads all source formats.],
  [One live connection — no manual copy-paste every month.],

  [#box(fill: navy, inset: (x:2pt,y:1pt), radius: 2pt)[#text(fill: white, weight: "black")[02]]],
  [#text(weight: "bold", fill: blue)[Promote Headers]],
  [Row 1 → Column headers. Filter out null rows and subtotal rows with 1 click.],
  [Eliminates manual report scrubbing forever.],

  [#box(fill: navy, inset: (x:2pt,y:1pt), radius: 2pt)[#text(fill: white, weight: "black")[03]]],
  [#hl-y[#text(weight: "bold", fill: emerald)[Unpivot Columns]]],
  [Select ID cols → Unpivot Other Columns. Wide monthly table (Jan–Dec) → 2 columns.],
  [#hl-g[No.1 PQ Skill] — perfect Pivot & Power BI data model.],

  [#box(fill: navy, inset: (x:2pt,y:1pt), radius: 2pt)[#text(fill: white, weight: "black")[04]]],
  [#text(weight: "bold", fill: blue)[Transform Data]],
  [Split by delimiter, Trim spaces, enforce strict Date / Currency / Integer types.],
  [Zero VALUE errors in calculations — clean data guaranteed.],

  [#box(fill: navy, inset: (x:2pt,y:1pt), radius: 2pt)[#text(fill: white, weight: "black")[05]]],
  [#text(weight: "bold", fill: ppt-c)[Merge Queries]],
  [Left Outer Join: Sales table joined to Customer Master on CustomerID key.],
  [Automated VLOOKUP replacement — works on millions of rows.],

  [#box(fill: navy, inset: (x:2pt,y:1pt), radius: 2pt)[#text(fill: white, weight: "black")[06]]],
  [#text(weight: "bold", fill: excel-c)[Close & Load]],
  [Load clean data to Excel Sheet or PowerPivot Data Model without file bloat.],
  [#hl-y[Next month: 1-click "Refresh All" — full report in 5 seconds!]],
)
#pagebreak()

// =============================================================================
// PAGE 06 — MICROSOFT POWERPOINT: TOP 30 SHORTCUTS (Nos. 111–140)
// =============================================================================
#app-banner("P   MICROSOFT POWERPOINT 365", "कॉर्पोरेट डेक डिज़ाइन, स्लाइड मास्टर ब्रांडिंग और 30 प्रेज़ेंटर शॉर्टकट", ppt-c)
#v(1.5pt)
#align(center)[#text(size: 8.5pt, weight: "black", fill: navy)[पृष्ठ 6 · PowerPoint: स्लाइड मास्टर + कॉर्पोरेट डिज़ाइन आर्किटेक्चर + 30 शॉर्टकट (नं. 111–140)]]
#v(2pt)

#sub-banner("CONCEPT P1", "स्लाइड मास्टर, मॉर्फ, 16:9 लेआउट और कॉर्पोरेट प्रेज़ेंटेशन आर्किटेक्चर", ppt-c)
#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.6pt + dborder,
  fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  text(size: 6.6pt, weight: "bold", fill: white)[Concept],
  text(size: 6.6pt, weight: "bold", fill: white)[Why Important — Job & College],
  text(size: 6.6pt, weight: "bold", fill: white)[Exact Steps],

  [#hl-b[Slide Master Setup]], [Lock company logo, fonts & colors on ALL slides — 1 place controls everything.], [View → Slide Master → Insert logo top-right → Close Master. Brand is permanently locked.],
  [#hl-y[16:9 Widescreen Ratio]], [Industry standard. Never submit 4:3 slides to MNC interviews or college projects.], [Design → Slide Size → Widescreen (16:9). Set BEFORE you start building.],
  [#hl-g[Morph Transition]], [Smooth object animation between slides — CEO-level presentation effect.], [Name objects identically on 2 slides (!!Title). Transitions → Morph. Objects flow smoothly.],
  [#hl-o[Presenter View]], [See your speaker notes + timer on laptop while audience sees clean slide on projector.], [Slide Show → Use Presenter View. #kbd[B] blanks screen for Q&A. Any key to resume.],
  [Layout System], [Always use Slide Layouts, not random text boxes — consistency is mandatory.], [Home → Layout → choose structure (Title Only, Two Content, etc.). Never start blank!],
  [Compress Media], [Large video-heavy PPTX — email or upload friendly without quality loss.], [File → Info → Compress Media → Internet Quality. Reduces file size 60–80%.],
  [Export as PDF], [Submit reports, proposals and college projects as universal PDF — not .pptx.], [File → Export → Create PDF/XPS. Check "Optimize for: Standard" (high quality print).],
  [Section Dividers], [Group slides into chapters: Intro / Problem / Solution / ROI — MNC standard deck.], [Right-click slide panel → Add Section → name it. Navigate by section in Presenter View.],
)

#v(1.5pt)
#sub-banner("SHORTCUTS 111–140", "PowerPoint टॉप 30 शॉर्टकट — डिज़ाइन, स्लाइड कंट्रोल, ऑब्जेक्ट अलाइनमेंट और प्रेज़ेंटर मोड", ppt-c)
#sc-grid(ppt-c, (
  ..sc("111", "Ctrl + M", [Insert New Slide at current position]),
  ..sc("112", "Ctrl + D", [Duplicate selected slide or object]),
  ..sc("113", "Ctrl + G / Shift+G", [#hl-b[Group / Ungroup selected objects]]),
  ..sc("114", "F5", [Start Slide Show from beginning (slide 1)]),
  ..sc("115", "Shift + F5", [Start Slide Show from CURRENT slide]),
  ..sc("116", "Esc", [End Slide Show — return to edit view]),
  ..sc("117", "B / W", [Black / White blank screen during presentation]),
  ..sc("118", "N / P", [Next / Previous slide during presentation]),
  ..sc("119", "Tab / Shift+Tab", [Cycle through objects on slide (select next)]),
  ..sc("120", "Ctrl + A", [Select ALL objects on current slide]),
  ..sc("121", "Ctrl + Z / Y", [Undo / Redo last action]),
  ..sc("122", "Ctrl + Shift + C/V", [Copy / Paste formatting — Format Painter]),
  ..sc("123", "Ctrl + K", [Insert Hyperlink on selected text or object]),
  ..sc("124", "Alt + N + P", [Insert Picture from file into current slide]),
  ..sc("125", "Ctrl + ] / [", [Increase / Decrease font size in text box]),
  ..sc("126", "Ctrl + Shift + >/< ", [Font size up / down by step increments]),
  ..sc("127", "Alt + Arrow Keys", [#hl-y[Nudge object by 1 pixel — pixel-perfect align]]),
  ..sc("128", "Shift + drag", [Constrain resize to maintain aspect ratio]),
  ..sc("129", "Ctrl + drag", [Duplicate object while moving — fast copy]),
  ..sc("130", "Alt + H + G + A", [Align objects — Center / Middle / Left / Right]),
  ..sc("131", "Alt + H + G + H/V", [#hl-g[Distribute objects Horizontally / Vertically]]),
  ..sc("132", "Ctrl + Shift + →/←", [Navigate to Next / Previous section in deck]),
  ..sc("133", "Alt + Shift + ←/→", [Promote / Demote text in Outline view]),
  ..sc("134", "F6", [Move between slide panel, slide, notes pane]),
  ..sc("135", "Ctrl + Shift + E", [Toggle spell check underline on / off]),
  ..sc("136", "Alt + J + P + X", [Remove picture background (magic eraser tool)]),
  ..sc("137", "Ctrl + F5", [Compress all media for email-friendly file size]),
  ..sc("138", "Ctrl + Shift + D", [Delete selected slide from deck]),
  ..sc("139", "Alt + Shift + Left", [Outdent text / Promote list level in outline]),
  ..sc("140", "Ctrl + L / E / R", [#hl-o[Left / Centre / Right align text in text box]]),
))
#pagebreak()

// =============================================================================
// PAGE 07 — OUTLOOK & CLOUD: 4D SYSTEM + 10 SHORTCUTS (Nos. 141–150)
// =============================================================================
#app-banner("O   OUTLOOK & M365 CLOUD", "4D इनबॉक्स ज़ीरो सिस्टम, 10 Outlook शॉर्टकट और OneDrive क्लाउड गवर्नेंस", out-c)
#v(1.5pt)
#align(center)[#text(size: 8.5pt, weight: "black", fill: navy)[पृष्ठ 7 · Outlook + OneDrive + Microsoft 365 ऑनलाइन — कॉर्पोरेट ईमेल अनुशासन (नं. 141–150)]]
#v(2pt)

#sub-banner("CONCEPT O1", "Outlook 4D इनबॉक्स ज़ीरो प्रोटोकॉल + कॉर्पोरेट ईमेल अनुशासन — दिन के अंत में ज़ीरो अनपढ़", out-c)
#table(
  columns: (1fr, 1.8fr, 3.2fr),
  stroke: 0.6pt + dborder,
  fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  text(size: 6.6pt, weight: "bold", fill: white)[4D Action],
  text(size: 6.6pt, weight: "bold", fill: white)[Rule],
  text(size: 6.6pt, weight: "bold", fill: white)[Exact Action & Corporate Standard],

  [#hl-b[DO (< 2 min)]], [Reply immediately if action takes under 2 minutes.], [Type reply → Send → Archive with #kbd[Ctrl+Shift+1]. Target: empty inbox by 6 PM.],
  [#hl-y[DELEGATE]], [Not your task? Forward to right person + CC your manager.], [#kbd[Ctrl+F] → Forward → add owner + deadline in email subject line. No verbal delegation!],
  [#hl-o[DEFER → Calendar Block]], [Deep work needed? Schedule 30-min calendar block to handle it properly.], [Drag email to Calendar in left panel → set time block + reminder. Remove from inbox.],
  [#hl-g[DELETE / Archive]], [No action needed? Delete or Archive immediately — zero lingering.], [#kbd[Del] = soft delete to Trash. #kbd[Ctrl+Shift+1] = Archive. Aim: 0 unread inbox EOD.],
  [Focused Inbox], [Separates important emails from newsletters & CC noise automatically.], [View → Show Focused Inbox. Train it by moving emails between Focused and Other tabs.],
  [Rules Engine], [Auto-route emails: Invoice PDFs → "Finance" folder automatically.], [Home → Rules → Manage Rules → New Rule → condition → move-to-folder → save.],
  [Delay Delivery], [Schedule emails to send at 9 AM even if you draft them at midnight.], [Options (compose window) → Delay Delivery → tick "Do not deliver before" → set time.],
  [Recall Message], [Unsend a sent email (works if recipient has NOT opened it yet).], [Sent Items → open email → Message tab → Recall This Message → Delete unread copies.],
)

#v(1.5pt)
#grid(columns: (1fr, 1fr), gutter: 5pt,
  [
    #sub-banner("SHORTCUTS 141–150", "Outlook टॉप 10 शॉर्टकट (नं. 141–150)", out-c)
    #table(
      columns: (1.35fr, 2fr),
      stroke: 0.6pt + dborder,
      fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 2.5pt,
      text(size: 6.5pt, weight: "bold", fill: white)[No. · Shortcut],
      text(size: 6.5pt, weight: "bold", fill: white)[Outlook Function],

      [#nb("141", out-c) #kbd[Ctrl + N]], [New email (from anywhere in Outlook)],
      [#nb("142", out-c) #kbd[Ctrl + R]], [Reply to currently selected / open email],
      [#nb("143", out-c) #kbd[Ctrl+Shift+R]], [Reply All — use sparingly in team emails!],
      [#nb("144", out-c) #kbd[Ctrl + F]], [Forward selected email to others],
      [#nb("145", out-c) #kbd[Ctrl + Enter]], [Send email (after composing)],
      [#nb("146", out-c) #kbd[Ctrl + 1/2/3]], [Switch Mail / Calendar / Contacts view],
      [#nb("147", out-c) #kbd[Ctrl+Shift+M]], [New email message from anywhere in Windows],
      [#nb("148", out-c) #kbd[Ctrl+Shift+K]], [Create New Task / To-Do item],
      [#nb("149", out-c) #kbd[Alt + S]], [Send email (alternative to Ctrl+Enter)],
      [#nb("150", out-c) #kbd[Ctrl + Q]], [#hl-y[Mark selected email as Read / Unread]],
    )
  ],
  [
    #sub-banner("CLOUD GOVERNANCE", "OneDrive और Microsoft 365 ऑनलाइन — क्लाउड पावर फ़ीचर्स", blue)
    #table(
      columns: (1.2fr, 1.9fr),
      stroke: 0.6pt + dborder,
      fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 2.5pt,
      text(size: 6.5pt, weight: "bold", fill: white)[Feature],
      text(size: 6.5pt, weight: "bold", fill: white)[Corporate Benefit],

      [#hl-b[1 TB OneDrive]], [Personal cloud: auto-sync laptop files to cloud backup.],
      [Files On-Demand], [Files appear in Explorer but download only when opened.],
      [Version History], [Restore any file version up to 180 days — recover deleted/corrupted.],
      [Co-Author Live], [2+ people edit same Word/Excel file simultaneously in real-time.],
      [SharePoint], [Team shared document library — controlled access, audit trail.],
      [Teams Integration], [Chat, Video Call, File Share all in one — no email for quick queries.],
      [Work Ethics], [Use company email for official work only. Never store client data on personal drives. Lock screen (#kbd[Win+L]) when leaving your desk. Never share passwords.],
    )
  ]
)
#pagebreak()

// =============================================================================
// PAGE 08 — AUTHOR HUB & TOP 5 MNC TECHNICAL INTERVIEW Q&A
// =============================================================================
#app-banner("R   AUTHOR HUB — RAHUL PATEL", "जुड़ें · QR कोड स्कैन करें · टॉप 5 MNC तकनीकी साक्षात्कार Q&A", rgb("#047857"))
#v(2pt)

#grid(columns: (1.6fr, 2fr), gutter: 8pt,
  [
    #block(stroke: 0.6pt + dborder, fill: rgb("#F8FAFC"), radius: 4pt, inset: 6pt)[
      #align(center)[
        #text(size: 9pt, weight: "black", fill: navy)[राहुल पटेल]\
        #text(size: 7pt, weight: "bold", fill: blue)[संस्थापक और सिस्टम्स आर्किटेक्ट — RTechLab]\
        #v(2pt)
        #line(length: 60%, stroke: 0.5pt + rgb("#CBD5E1"))
        #v(2pt)
        #text(size: 6.6pt, fill: muted)[
          Director, IANT Computer Education, Palanpur, Gujarat\
          10+ Years Enterprise IT & Cloud Training\
          3,000+ Students Trained · M.Sc. IT\
          Specialisations: Microsoft 365 · Tally Prime\
          Networking · Python · Web Technologies\
          Gujarat No.1 Vocational IT Training Institute
        ]
        #v(3pt)
        #line(length: 70%, stroke: 0.6pt + rgb("#CBD5E1"))
        #v(3pt)
        #text(size: 7pt, weight: "bold", fill: navy)[RTechLab से जुड़ें — QR कोड स्कैन करें]
        #v(2pt)
        #grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 3pt,
          [#block(stroke: 0.6pt+dborder, fill: white, radius: 3pt, inset: 2pt)[#align(center)[#text(size: 5.5pt, weight: "bold", fill: rgb("#047857"))[🌐 Portfolio] \ #text(size: 5pt, fill: muted)[rtechlab.com]]]],
          [#block(stroke: 0.6pt+dborder, fill: white, radius: 3pt, inset: 2pt)[#align(center)[#text(size: 5.5pt, weight: "bold", fill: rgb("#FF0000"))[▶ YouTube] \ #text(size: 5pt, fill: muted)[\/\@RTechLab]]]],
          [#block(stroke: 0.6pt+dborder, fill: white, radius: 3pt, inset: 2pt)[#align(center)[#text(size: 5.5pt, weight: "bold", fill: rgb("#E1306C"))[📷 Instagram] \ #text(size: 5pt, fill: muted)[\/\@rtechlab]]]],
          [#block(stroke: 0.6pt+dborder, fill: white, radius: 3pt, inset: 2pt)[#align(center)[#text(size: 5.5pt, weight: "bold", fill: rgb("#25D366"))[💬 WhatsApp] \ #text(size: 5pt, fill: muted)[Community]]]],
        )
        #v(3pt)
        #text(size: 6.3pt, fill: muted, style: "italic")[
          "मेरा लक्ष्य: हर भारतीय छात्र — टियर-3 कस्बे से महानगर तक — को विश्वस्तरीय, किफायती, व्यावहारिक IT शिक्षा मिले। ₹22 की कीमत में ₹2,200 की गुणवत्ता। हमेशा।" — राहुल पटेल
        ]
      ]
    ]
  ],
  [
    #sub-banner("MNC PREP", "Top 5 Microsoft 365 Technical Interview Q&A — MNC, BPO & Corporate Jobs", rgb("#047857"))
    #table(
      columns: (2.5fr, 3.5fr),
      stroke: 0.6pt + dborder,
      fill: (col, row) => if row == 0 { navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 2.8pt,
      text(size: 6.5pt, weight: "bold", fill: white)[साक्षात्कार प्रश्न],
      text(size: 6.5pt, weight: "bold", fill: white)[मॉडल उत्तर — साक्षात्कार में यही कहें],

      [#text(weight: "bold", fill: out-c)[Q1.] What is XLOOKUP and why is it better than VLOOKUP?],
      [XLOOKUP searches any direction (left, right, up, down), doesn't break when columns are inserted, returns multiple columns in one formula, and supports reverse search. VLOOKUP only looks right and breaks when columns shift.],

      [#text(weight: "bold", fill: ppt-c)[Q2.] What is Slide Master in PowerPoint?],
      [Slide Master is a master template that controls fonts, colors, logo placement and layouts across ALL slides from one place. Changes to Slide Master apply instantly to every slide — saves hours of reformatting.],

      [#text(weight: "bold", fill: excel-c)[Q3.] Explain Power Query and when you use it.],
      [Power Query is an ETL engine inside Excel. I use it to connect to raw CSV or SQL data, clean it (remove nulls, fix data types, unpivot wide tables), merge tables, and load to Excel. Next month I just click Refresh All — full automation.],

      [#text(weight: "bold", fill: excel-c)[Q4.] What does the LET function do in Excel?],
      [LET() lets you name intermediate results as variables inside a formula. This avoids repeating complex sub-expressions multiple times, makes formulas 5x faster to calculate, and is much easier to audit and maintain.],

      [#text(weight: "bold", fill: out-c)[Q5.] How do you manage a large team inbox efficiently?],
      [I use the 4D system: Do (under 2 min), Delegate (not mine), Defer (calendar block for deep work), Delete or Archive. Combined with Outlook Rules to auto-sort emails, Focused Inbox, and an end-of-day goal of zero unread urgent emails.],
    )
  ]
)
