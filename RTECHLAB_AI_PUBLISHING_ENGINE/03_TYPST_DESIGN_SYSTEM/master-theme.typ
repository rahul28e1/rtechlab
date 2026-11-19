// =============================================================================
// RTECHLAB MASTER TYPST THEME (2027 INDUSTRIAL EDITION)
// Official Design System for Technical Handbooks & 100+ Page Textbooks
// Author: Rahul Sir & RTechLab Engineering Directorate
// =============================================================================

#let rtech-navy = rgb("#192446")
#let rtech-cyan = rgb("#25B6F9")
#let rtech-violet = rgb("#7A25CA")
#let rtech-paper = rgb("#FDFDFE")
#let rtech-text = rgb("#202B4D")
#let rtech-emerald = rgb("#10B981")
#let rtech-amber = rgb("#F59E0B")
#let rtech-rose = rgb("#EF4444")
#let rtech-border = rgb(25, 36, 70, 12%)

// Document Setup Function
#let rtech-book(
  title: "Technical Handbook",
  subtitle: "Visual Engineering Master Edition",
  author: "Rahul Sir & RTechLab Team",
  edition: "2027 Industrial Edition",
  subject-code: "RTL-2027-ENG",
  body
) = {
  // Page Geometry & Background
  set page(
    paper: "a4",
    margin: (x: 15mm, top: 20mm, bottom: 18mm),
    fill: rtech-paper,
    
    // Universal Running Header
    header: context {
      let page-num = counter(page).get().first()
      // Skip running header on cover page
      if page-num > 1 {
        block(
          width: 100%,
          stroke: (bottom: 0.5pt + rtech-border),
          inset: (bottom: 2mm),
          [
            #grid(
              columns: (1fr, 1fr),
              align: (left, right),
              [
                #text(size: 8.5pt, weight: "bold", fill: rtech-cyan)[RTECHLAB]
                #text(size: 8.5pt, fill: rtech-text.lighten(30%))[ | #title]
              ],
              [
                #text(size: 8pt, font: "Consolas", fill: rtech-text.lighten(40%))[
                  #edition · Author: Rahul Sir
                ]
              ]
            )
          ]
        )
      }
    },
    
    // Universal Running Footer
    footer: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        block(
          width: 100%,
          stroke: (top: 0.5pt + rtech-border),
          inset: (top: 2mm),
          [
            #grid(
              columns: (1.2fr, 1fr, auto),
              align: (left, center, right),
              [
                #text(size: 8pt, font: "Consolas", fill: rtech-text.lighten(40%))[
                  ● Technology Made Practical · rtechlab.in
                ]
              ],
              [
                #text(size: 7.5pt, font: "Consolas", fill: rtech-text.lighten(50%))[
                  Licensed Digital Edition · #subject-code
                ]
              ],
              [
                #box(
                  fill: rtech-navy.lighten(92%),
                  inset: (x: 5pt, y: 2pt),
                  radius: 3pt,
                  text(size: 8pt, weight: "bold", font: "Consolas", fill: rtech-navy)[
                    Page #page-num
                  ]
                )
              ]
            )
          ]
        )
      }
    },
    
    // Anti-Piracy Watermark Background
    background: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        place(
          center + horizon,
          rotate(-25deg,
            text(
              fill: rgb(25, 36, 70, 3.5%),
              size: 15pt,
              font: "Segoe UI",
              weight: "bold",
              tracking: 0.25em
            )[
              OFFICIAL RTECHLAB MASTER EDITION · AUTHOR: RAHUL SIR · 2027 LICENSED COPY
            ]
          )
        )
      }
    }
  )

  // Typography Rules
  set text(
    font: ("Segoe UI", "Nirmala UI", "Calibri", "Arial"),
    size: 9.5pt,
    fill: rtech-text,
    lang: "en",
    spacing: 115%
  )

  set par(
    justify: true,
    leading: 0.65em
  )

  show heading.where(level: 1): it => block(
    above: 10pt, below: 8pt,
    text(size: 16pt, weight: "bold", fill: rtech-navy, it.body)
  )

  show heading.where(level: 2): it => block(
    above: 8pt, below: 6pt,
    text(size: 12pt, weight: "bold", fill: rtech-navy.lighten(10%), it.body)
  )

  show raw.where(block: false): it => box(
    fill: rtech-navy.lighten(94%),
    inset: (x: 2.5pt, y: 1pt),
    radius: 2.5pt,
    baseline: 0%,
    text(fill: rtech-cyan.darken(20%), size: 7.5pt, font: "Consolas", weight: "bold", it)
  )

  show raw.where(block: true): it => block(
    fill: rgb(20, 26, 45, 96%),
    inset: (x: 8pt, y: 6pt),
    radius: 4pt,
    width: 100%,
    text(fill: rgb("#38BDF8"), size: 8.5pt, font: "Consolas", it)
  )

  body
}

// ── CALLOUT BOX COMPONENTS ───────────────────────────────────────────────────

// Concept Box (Cyan Theme)
#let concept-box(title: "Core Concept", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-cyan, rest: 0.5pt + rgb(37, 182, 249, 25%)),
    fill: rgb(37, 182, 249, 4%),
    inset: 8pt,
    radius: (right: 5pt),
    spacing: 6pt,
    [
      #text(weight: "bold", size: 9pt, fill: rtech-navy, font: "Segoe UI")[⚡ #upper(title)]
      #v(2pt)
      #text(size: 9pt, fill: rtech-text)[#body]
    ]
  )
}

// Real-World Analogy Box (Violet Theme)
#let analogy-box(title: "Real-World Mental Model", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-violet, rest: 0.5pt + rgb(122, 37, 202, 25%)),
    fill: rgb(122, 37, 202, 4%),
    inset: 8pt,
    radius: (right: 5pt),
    spacing: 6pt,
    [
      #text(weight: "bold", size: 9pt, fill: rtech-violet, font: "Segoe UI")[💡 #upper(title)]
      #v(2pt)
      #text(size: 9pt, fill: rtech-text)[#body]
    ]
  )
}

// Practical Lab Box (Emerald Theme)
#let practical-box(title: "Field Diagnostic Step", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-emerald, rest: 0.5pt + rgb(16, 185, 129, 25%)),
    fill: rgb(16, 185, 129, 4%),
    inset: 8pt,
    radius: (right: 5pt),
    spacing: 6pt,
    [
      #text(weight: "bold", size: 9pt, fill: rgb("#065F46"), font: "Segoe UI")[🛠️ #upper(title)]
      #v(2pt)
      #text(size: 9pt, fill: rtech-text)[#body]
    ]
  )
}

// Warning Box (Amber Theme)
#let warning-box(title: "Common Student Trap & Field Blunder", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-amber, rest: 0.5pt + rgb(245, 158, 11, 35%)),
    fill: rgb(245, 158, 11, 5%),
    inset: 8pt,
    radius: (right: 5pt),
    spacing: 6pt,
    [
      #text(weight: "bold", size: 9pt, fill: rgb("#92400E"), font: "Segoe UI")[⚠️ #upper(title)]
      #v(2pt)
      #text(size: 9pt, fill: rtech-text)[#body]
    ]
  )
}

// ── REAL PHOTOGRAPHIC & COMPACT DISPLAY COMPONENTS ────────────────────────────

// Elegant Compact Photo Card (Zero Clutter, Single-Line Caption)
#let photo-card(img-path, caption: "", height: 85pt, credit: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 6pt,
    inset: 4pt,
    spacing: 5pt,
    [
      #align(center)[
        #image(img-path, height: height, fit: "contain")
      ]
      #if caption != "" [
        #v(1.5pt)
        #align(center)[
          #text(size: 7.5pt, font: "Segoe UI", weight: "medium", fill: rtech-text.lighten(15%))[
            #caption
          ]
          #if credit != "" [
            #text(size: 6.5pt, font: "Consolas", fill: rtech-text.lighten(50%))[ (#credit)]
          ]
        ]
      ]
    ]
  )
}

// Side-by-Side Dual Photos
#let dual-photo(img1: "", cap1: "", img2: "", cap2: "", height: 75pt) = {
  grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    photo-card(img1, caption: cap1, height: height),
    photo-card(img2, caption: cap2, height: height)
  )
}

// Yellow Highlighter Component for High-Yield Exam Points
#let hl(body) = {
  highlight(
    fill: rgb("#FEF08A"),
    radius: 2pt,
    top-edge: "ascender",
    bottom-edge: "descender"
  )[#text(weight: "bold", fill: rgb("#1C1917"))[#body]]
}

// Intuitive Mental Model Analogy Box
#let analogy-box(title: "Real-Life Mental Model", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("#3B82F6"), rest: 0.5pt + rgb(59, 130, 246, 25%)),
    fill: rgb(59, 130, 246, 4%),
    inset: 7pt,
    radius: (right: 5pt),
    spacing: 5pt,
    [
      #text(weight: "bold", size: 8.5pt, fill: rgb("#1D4ED8"), font: "Segoe UI")[🧠 REAL-LIFE ANALOGY: #upper(title)]
      #v(1.5pt)
      #text(size: 8.5pt, fill: rtech-text)[#body]
    ]
  )
}

// Chapter FAQ Component
#let faq-item(q: "", a: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 4pt,
    inset: 5.5pt,
    spacing: 3pt,
    [
      #text(size: 8pt, weight: "bold", fill: rtech-navy)[❓ Q: #q]\
      #v(1pt)
      #text(size: 7.5pt, fill: rtech-text.lighten(15%))[#strong[Ans:] #a]
    ]
  )
}

// Short Review Question with Answer Component
#let short-qa(num: 1, q: "", a: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 4pt,
    inset: 5pt,
    spacing: 2.5pt,
    [
      #text(size: 7.8pt, font: "Consolas", weight: "bold", fill: rtech-navy)[#num. #q]\
      #v(1pt)
      #text(size: 7.2pt, fill: rtech-text.lighten(15%))[#text(weight: "bold", fill: rtech-emerald.darken(15%))[Explanation:] #a]
    ]
  )
}

// Interesting Fact Box ("Did You Know?")
#let fact-box(title: "Did You Know?", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("#F59E0B"), rest: 0.5pt + rgb(245, 158, 11, 25%)),
    fill: rgb(245, 158, 11, 4%),
    inset: 7pt,
    radius: (right: 5pt),
    spacing: 5pt,
    [
      #text(weight: "bold", size: 8.5pt, fill: rgb("#92400E"), font: "Segoe UI")[💡 #upper(title)]
      #v(1.5pt)
      #text(size: 8.5pt, fill: rtech-text)[#body]
    ]
  )
}

// Student Pro Tip Box
#let tip-box(title: "Student Pro Tip", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-emerald, rest: 0.5pt + rgb(16, 185, 129, 25%)),
    fill: rgb(16, 185, 129, 4%),
    inset: 7pt,
    radius: (right: 5pt),
    spacing: 5pt,
    [
      #text(weight: "bold", size: 8.5pt, fill: rgb("#065F46"), font: "Segoe UI")[🎯 #upper(title)]
      #v(1.5pt)
      #text(size: 8.5pt, fill: rtech-text)[#body]
    ]
  )
}

// Direct Website Tool QR Card
#let tool-qr-card(tool-name: "Binary & Hex Converter", tool-desc: "Try this interactive calculation tool directly on RTechLab:", qr-img: "/public/images/notes/qr-tool-binary-converter.svg", tool-url: "http://localhost:5173/tools/binary-converter") = {
  block(
    width: 100%,
    stroke: 1pt + rtech-cyan,
    fill: white,
    radius: 6pt,
    inset: 7pt,
    spacing: 6pt,
    [
      #grid(
        columns: (1fr, 60pt),
        gutter: 10pt,
        align: (left + horizon, center + horizon),
        [
          #text(size: 7.5pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[RTECHLAB INTERACTIVE WEB TOOL]
          #v(1pt)
          #text(size: 10pt, weight: "bold", fill: rtech-navy)[#tool-name]
          #v(2pt)
          #text(size: 8pt, fill: rtech-text.lighten(20%))[#tool-desc]
          #v(2pt)
          #text(size: 7.5pt, font: "Consolas", fill: rtech-text.lighten(40%))[
            Direct URL: #link(tool-url)[#underline(tool-url)]
          ]
        ],
        [
          #image(qr-img, width: 55pt)
          #v(1pt)
          #text(size: 6pt, font: "Consolas", fill: rtech-text.lighten(50%))[SCAN TO OPEN]
        ]
      )
    ]
  )
}

// Global MCQ Component
#let mcq(num: 1, q: "", a: "", b: "", c: "", d: "", ans: "", expl: "") = {
  block(stroke: 0.5pt + rtech-border, fill: white, radius: 4pt, inset: 4.5pt, spacing: 2pt)[
    #text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Q#num: #q]\
    #text(size: 7pt, fill: rtech-text)[A) #a | B) #b | C) #c | D) #d]\
    #text(size: 6.5pt, fill: rtech-emerald.darken(15%))[*Answer: Option #ans* | #expl]
  ]
}

// Tier-1 MNC Interview Card
#let interview-card(
  num: none,
  company: "MNC Screening",
  role: "Systems Engineer",
  question: "",
  answer: "",
  q: none,
  a: none
) = {
  let final-q = if q != none { q } else { question }
  let final-a = if a != none { a } else { answer }
  let num-prefix = if num != none [Q#num: ] else []
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 6pt,
    inset: 7pt,
    spacing: 4pt,
    [
      #grid(
        columns: (1fr, auto),
        text(size: 8pt, weight: "bold", fill: rtech-amber.darken(15%), font: "Consolas")[🏢 #upper(company) · #upper(role)],
        text(size: 7.5pt, fill: rtech-text.lighten(40%))[Technical Screening Round]
      )
      #v(2pt)
      #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[#num-prefix “#final-q”]
      #v(2pt)
      #block(
        fill: rtech-navy.lighten(96%),
        stroke: 0.5pt + rtech-navy.lighten(85%),
        inset: 5pt,
        radius: 4pt,
        text(size: 8pt, fill: rtech-text)[
          #strong[Senior Model Answer:] #final-a
        ]
      )
    ]
  )
}

// RTechLab Practice Lab Box (With Chapter QR Code)
#let practice-lab-card(chapter-title: "Chapter Practice", qr-img: "", practice-url: "http://localhost:5173/practice", mcq-count: 25) = {
  block(
    width: 100%,
    stroke: 1.5pt + rtech-cyan,
    fill: white,
    radius: 8pt,
    inset: 10pt,
    spacing: 10pt,
    [
      #grid(
        columns: (1fr, 75pt),
        gutter: 12pt,
        [
          #text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[RTECHLAB PRACTICE LAB · LIVE QUIZ ENGINE]
          #v(1pt)
          #text(size: 13pt, weight: "bold", fill: rtech-navy)[Scan & Test Your Knowledge]
          #v(3pt)
          #text(size: 8.5pt, fill: rtech-text.lighten(20%))[
            Reinforce this chapter's concepts through our interactive question bank. Instant scoring, detailed engineering breakdowns, and why-distractors-fail analysis.
          ]
          #v(4pt)
          #grid(
            columns: (auto, auto, auto),
            gutter: 8pt,
            text(size: 7.5pt, font: "Consolas", fill: rtech-emerald.darken(10%))[✓ #mcq-count Questions],
            text(size: 7.5pt, font: "Consolas", fill: rtech-violet)[✓ Basic / Int / Adv],
            text(size: 7.5pt, font: "Consolas", fill: rtech-cyan.darken(20%))[✓ English & Hindi]
          )
          #v(4pt)
          #text(size: 8pt, font: "Consolas", fill: rtech-text.lighten(30%))[
            Direct Web Link: #link(practice-url)[#underline(practice-url)]
          ]
        ],
        [
          #align(center + horizon)[
            #image(qr-img, width: 70pt)
            #v(2pt)
            #text(size: 6.5pt, font: "Consolas", fill: rtech-text.lighten(50%))[SCAN TO PRACTICE]
          ]
        ]
      )
    ]
  )
}
