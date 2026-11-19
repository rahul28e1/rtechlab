// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — ENGLISH V5.1.3 (COMMERCIAL MASTER RELEASE)
// Premium International Academic Textbook Edition
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5(
  title: "COMPUTER FUNDAMENTALS",
  subtitle: "Complete Learning & Technical Interview Guide",
  edition: "2027 MASTER EDITION",
  series-pill: "OFFICIAL COMMERCIAL PUBLICATION · V5.1.3 PRODUCTION MASTER",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-FUND-V5.1.3",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "../03_VISUAL_ASSETS/authentic-hardware-photographs/motherboard-atx-overview.jpg"
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
                text(size: 6.5pt, weight: "bold", fill: rgb("#38BDF8"))[#series-pill]
              )
            ]
          )

          #v(10pt)

          // --- Book Title Block ---
          #align(left)[
            #text(size: 8.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"), tracking: 2pt)[
              ACADEMIC & PROFESSIONAL COMPUTER SCIENCE SERIES
            ]
            #v(4pt)
            #text(size: 26pt, font: "Segoe UI", weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(4pt)
            #text(size: 11pt, font: "Segoe UI", weight: "bold", fill: rgb("#4F46E5"))[
              #subtitle
            ]
            #v(2pt)
            #line(length: 100%, stroke: 1.5pt + rgb("#0284C7"))
          ]

          #v(8pt)

          // --- Hero Motherboard Visual ---
          #align(center)[
            #block(
              width: 100%,
              stroke: 1pt + rgb("#CBD5E1"),
              radius: 4pt,
              fill: rgb("#0F172A"),
              inset: 3pt,
              [
                #image(hero-photo-path, width: 100%, height: 75mm, fit: "cover")
                #v(2pt)
                #grid(
                  columns: (1fr, auto),
                  align: (left, right),
                  inset: (x: 4pt, bottom: 2pt),
                  [
                    #text(size: 6.5pt, fill: rgb("#94A3B8"), font: "Segoe UI")[
                      #text(fill: rgb("#38BDF8"))[●] High-Density ATX Architecture · Socket AM5 / LGA1851 · PCIe 5.0 / DDR5 Micro-Traces
                    ],
                    #text(size: 6.5pt, weight: "bold", fill: rgb("#38BDF8"), font: "Segoe UI")[
                      HARDWARE LAB SPECIMEN
                    ]
                  ]
                )
              ]
            )
          ]

          #v(8pt)

          // --- 4-Pillar Feature Matrix ---
          #grid(
            columns: (1fr, 1fr, 1fr, 1fr),
            gutter: 6pt,
            [
              #block(
                width: 100%,
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#CBD5E1"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[10 Chapters]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[Architecture, Silicon, Memory, OS & Security]
                ]
              )
            ],
            [
              #block(
                width: 100%,
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#CBD5E1"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[50 Interview Q&As]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[Formal Senior Placement Solutions & Follow-ups]
                ]
              )
            ],
            [
              #block(
                width: 100%,
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#CBD5E1"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#4F46E5"))[30 Viva One-Liners]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[Oral Exam Drills & Exam Cram Summaries]
                ]
              )
            ],
            [
              #block(
                width: 100%,
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#CBD5E1"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#059669"))[2027 Frontier]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[NPU TOPS, CXL 3.1, Wi-Fi 7 & NIST PQC]
                ]
              )
            ]
          )

          #v(1fr)

          // --- Bottom Author & Brand Bar ---
          #line(length: 100%, stroke: 0.75pt + rgb("#E2E8F0"))
          #v(4pt)
          #grid(
            columns: (1fr, 1fr),
            align: (left + horizon, right + horizon),
            [
              #text(size: 8.5pt, weight: "bold", fill: rgb("#0F172A"))[Author: #author]\
              #text(size: 6.8pt, fill: rgb("#64748B"))[#author-title]\
              #text(size: 6.5pt, weight: "bold", fill: rgb("#0284C7"))[#tagline-1 · #tagline-2]
            ],
            [
              #box(
                fill: rgb("#EEF2FF"),
                stroke: 0.5pt + rgb("#4F46E5"),
                radius: 3pt,
                inset: (x: 8pt, y: 4pt),
                align(right)[
                  #text(size: 8pt, weight: "black", fill: rgb("#4F46E5"))[#edition]\
                  #text(size: 6.5pt, font: "Segoe UI", fill: rgb("#64748B"))[Subject Code: #subject-code]
                ]
              )
            ]
          )
        ]
      )
    ]
  )
}
