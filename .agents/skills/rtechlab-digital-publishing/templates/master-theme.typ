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
    font: ("Segoe UI", "Calibri", "Arial"),
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

  show raw: it => block(
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

// Schematic Container
#let schematic-container(title: "Technical Schematic", figure-id: "FIG 1.0", img-path: "", caption: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 6pt,
    inset: 0pt,
    spacing: 8pt,
    [
      #block(
        fill: rtech-navy.lighten(94%),
        inset: (x: 8pt, y: 5pt),
        radius: (top: 6pt),
        [
          #grid(
            columns: (1fr, auto),
            text(size: 8.5pt, weight: "bold", fill: rtech-navy)[#figure-id: #upper(title)],
            text(size: 7.5pt, font: "Consolas", fill: rtech-text.lighten(40%))[300 DPI Vector Spec]
          )
        ]
      )
      #align(center)[
        #block(inset: 6pt)[
          #image(img-path, width: 92%)
        ]
      ]
      #if caption != "" [
        #block(
          inset: (x: 8pt, bottom: 6pt),
          text(size: 8pt, style: "italic", fill: rtech-text.lighten(30%))[#caption]
        )
      ]
    ]
  )
}

// Real Photographic Figure Container
#let photo-figure(
  title: "Real Hardware Component",
  figure-id: "PHOTO 1.0",
  img-path: "",
  caption: "",
  author: "Wikimedia Contributor",
  license: "CC BY-SA",
  img-width: 92%
) = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 6pt,
    inset: 0pt,
    spacing: 7pt,
    [
      #block(
        fill: rgb("#192446"),
        inset: (x: 8pt, y: 4.5pt),
        radius: (top: 6pt),
        [
          #grid(
            columns: (1fr, auto),
            text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#25B6F9"))[📷 #figure-id: #upper(title)],
            text(size: 7pt, font: "Consolas", fill: white.lighten(30%))[AUTHENTIC PHYSICAL CAPTURE]
          )
        ]
      )
      #align(center)[
        #block(inset: (x: 6pt, top: 4pt, bottom: 4pt))[
          #image(img-path, width: img-width)
        ]
      ]
      #block(
        inset: (x: 8pt, bottom: 5pt),
        [
          #grid(
            columns: (1fr, auto),
            gutter: 8pt,
            align: (left + horizon, right + horizon),
            [
              #if caption != "" [
                #text(size: 7.5pt, fill: rtech-text.lighten(20%))[#caption]
              ]
            ],
            [
              #box(
                fill: rtech-navy.lighten(94%),
                inset: (x: 4pt, y: 1.5pt),
                radius: 3pt,
                text(size: 6.5pt, font: "Consolas", fill: rtech-text.lighten(40%))[
                  Credit: #author · #license
                ]
              )
            ]
          )
        ]
      )
    ]
  )
}

// Tier-1 MNC Interview Card
#let interview-card(company: "MNC", role: "Support Engineer", question: "", answer: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 6pt,
    inset: 8pt,
    spacing: 5pt,
    [
      #grid(
        columns: (1fr, auto),
        text(size: 8pt, weight: "bold", fill: rtech-amber.darken(15%), font: "Consolas")[🏢 #upper(company) · #upper(role)],
        text(size: 7.5pt, fill: rtech-text.lighten(40%))[Technical Screening Round]
      )
      #v(2pt)
      #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[“#question”]
      #v(2pt)
      #block(
        fill: rtech-navy.lighten(96%),
        stroke: 0.5pt + rtech-navy.lighten(85%),
        inset: 6pt,
        radius: 4pt,
        text(size: 8pt, fill: rtech-text)[
          #strong[Senior Answer:] #answer
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
