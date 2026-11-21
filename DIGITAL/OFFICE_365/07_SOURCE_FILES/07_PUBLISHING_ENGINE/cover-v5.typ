// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — MICROSOFT OFFICE 365 (EDITION 1)
// Premium International Academic & Enterprise Certification Textbook Edition
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5(
  title: "MICROSOFT OFFICE 365 MASTER GUIDE",
  subtitle: "Word · Excel · PowerPoint · Copilot AI · Enterprise Analytics & Automation Vault",
  edition: "2027 MASTER EDITION · EDITION 1",
  series-pill: "OFFICIAL RTECHLAB COMMERCIAL PUBLICATION · OFFICE 365 ENTERPRISE",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-O365-ED1",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "../03_VISUAL_ASSETS/authentic-hardware-photographs/desktop-pc-workstation.jpg"
) = {
  block(
    width: 100%,
    height: 100%,
    fill: rgb("#F8FAFC"),
    inset: 0pt,
    outset: 0pt,
    [
      // Outer Geometric Accent Border
      #rect(
        width: 100%,
        height: 100%,
        stroke: 1.5pt + rgb("#0F172A"),
        inset: 12mm,
        fill: white,
        radius: 0pt,
        [
          // --- Top Header Bar ---
          #grid(
            columns: (auto, 1fr),
            align: (left + horizon, right + horizon),
            [
              #image(logo-path, width: 44mm)
            ],
            [
              #box(
                fill: rgb("#0F172A"),
                radius: 3pt,
                inset: (x: 8pt, y: 3.5pt),
                text(size: 6.5pt, weight: "bold", fill: rgb("#0284C7"))[#series-pill]
              )
            ]
          )

          #v(10pt)

          // --- Book Title Block ---
          #align(left)[
            #text(size: 8.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"), tracking: 2pt)[
              ENTERPRISE PRODUCTIVITY & BUSINESS INTELLIGENCE SUITE
            ]
            #v(4pt)
            #text(size: 23pt, font: "Segoe UI", weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(4pt)
            #text(size: 10.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[
              #subtitle
            ]
            #v(2pt)
            #line(length: 100%, stroke: 1.5pt + rgb("#0284C7"))
          ]

          #v(8pt)

          // --- Hero Enterprise Workplace Visual ---
          #align(center)[
            #block(
              width: 100%,
              stroke: 1pt + rgb("#CBD5E1"),
              radius: 4pt,
              fill: rgb("#0F172A"),
              inset: 3pt,
              [
                #image(hero-photo-path, width: 100%, height: 74mm, fit: "cover")
                #v(2pt)
                #grid(
                  columns: (1fr, auto),
                  align: (left, right),
                  inset: (x: 4pt, bottom: 2pt),
                  [
                    #text(size: 6.5pt, fill: rgb("#94A3B8"), font: "Segoe UI")[
                      #text(fill: rgb("#38BDF8"))[●] Modern Enterprise Computing Architecture · Office 365 Cloud Ecosystem & Co-Authoring
                    ],
                    #text(size: 6.5pt, weight: "bold", fill: rgb("#38BDF8"), font: "Segoe UI")[
                      DIGITAL WORKPLACE SPECIMEN
                    ]
                  ]
                )
              ]
            )
          ]

          #v(8pt)

          // --- Curriculum Feature Badges ---
          #grid(
            columns: (1fr, 1fr, 1fr, 1fr),
            gutter: 5pt,
            [
              #box(
                width: 100%,
                fill: rgb("#F0F9FF"),
                stroke: 0.5pt + rgb("#BAE6FD"),
                radius: 3pt,
                inset: (x: 4pt, y: 5pt),
                align(center)[
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#0284C7"))[MICROSOFT WORD]\
                  #text(size: 5.5pt, fill: rgb("#64748B"))[Styles, TOC & Mail Merge]
                ]
              )
            ],
            [
              #box(
                width: 100%,
                fill: rgb("#ECFDF5"),
                stroke: 0.5pt + rgb("#A7F3D0"),
                radius: 3pt,
                inset: (x: 4pt, y: 5pt),
                align(center)[
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#059669"))[MICROSOFT EXCEL]\
                  #text(size: 5.5pt, fill: rgb("#64748B"))[XLOOKUP, Arrays & Pivots]
                ]
              )
            ],
            [
              #box(
                width: 100%,
                fill: rgb("#FFFBEB"),
                stroke: 0.5pt + rgb("#FDE68A"),
                radius: 3pt,
                inset: (x: 4pt, y: 5pt),
                align(center)[
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#D97706"))[POWERPOINT 365]\
                  #text(size: 5.5pt, fill: rgb("#64748B"))[Morph, Masters & Pitch Decks]
                ]
              )
            ],
            [
              #box(
                width: 100%,
                fill: rgb("#F5F3FF"),
                stroke: 0.5pt + rgb("#DDD6FE"),
                radius: 3pt,
                inset: (x: 4pt, y: 5pt),
                align(center)[
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#7C3AED"))[COPILOT AI 2027]\
                  #text(size: 5.5pt, fill: rgb("#64748B"))[Prompting & Cloud Automation]
                ]
              )
            ]
          )

          #v(7pt)

          // --- Bottom Meta Bar ---
          #line(length: 100%, stroke: 0.5pt + rgb("#E2E8F0"))
          #v(4pt)
          #grid(
            columns: (1fr, 1fr),
            align: (left, right),
            [
              #text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rgb("#0F172A"))[
                #author
              ]\
              #text(size: 6.5pt, font: "Segoe UI", fill: rgb("#64748B"))[
                #author-title
              ]
            ],
            [
              #text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[
                #edition
              ]\
              #text(size: 6pt, font: "Segoe UI", fill: rgb("#64748B"))[
                Subject Code: #subject-code · #tagline-1
              ]
            ]
          )
        ]
      )
    ]
  )
}
