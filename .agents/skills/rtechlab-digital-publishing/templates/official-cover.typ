// =============================================================================
// RTECHLAB OFFICIAL A4 COVER LAYOUT
// =============================================================================

#let rtech-cover(
  title: "Computer Hardware & System Architecture",
  subtitle: "The Visual Engineering Master Handbook (2027 Standard)",
  subject-pill: "OFFICIAL PUBLICATION · 2027 INDUSTRIAL EDITION",
  author: "Rahul Sir",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  reviewed-by: "RTechLab Systems Lab Directorate",
  edition: "2027.1 INDUSTRIAL RELEASE",
  logo-path: "/public/brand/rtechlab-logo-transparent.png",
  pillar-1-title: "SILICON & BUS ARCHITECTURE",
  pillar-1-items: ("Intel LGA 1851/1700 & AMD AM5", "DDR5 6400+ MT/s & On-Die PMIC", "PCIe 5.0 NVMe SSDs (14,000 MB/s)"),
  pillar-2-title: "POWER & FIELD DIAGNOSTICS",
  pillar-2-items: ("ATX 3.1 & 12V-2x6 GPU Cables", "16+1+1 DrMOS VRM Power Stages", "4-Step Hardware Fault Tree")
) = {
  block(
    width: 100%,
    height: 100%,
    stroke: 0.5pt + rgb(25, 36, 70, 15%),
    fill: rgb("#FDFDFE"),
    radius: 8pt,
    inset: 16mm,
    [
      // Header Brand Row
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #grid(
            columns: (auto, auto),
            gutter: 8pt,
            align: horizon,
            image(logo-path, width: 32pt),
            [
              #text(size: 9pt, weight: "bold", font: "Segoe UI", fill: rgb("#192446"))[RTECHLAB SYSTEMS LAB]\
              #text(size: 7.5pt, font: "Consolas", fill: rgb("#202B4D").lighten(40%))[ENTERPRISE IT SYSTEMS STANDARD]
            ]
          )
        ],
        [
          #text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#192446"))[EDITION 2027.1]\
          #text(size: 7pt, font: "Consolas", fill: rgb("#202B4D").lighten(50%))[ISO 9001:2015 AUDITED]
        ]
      )

      #v(20pt)

      // Subject Pill
      #box(
        fill: rgb(16, 185, 129, 10%),
        stroke: 0.5pt + rgb(16, 185, 129, 40%),
        inset: (x: 8pt, y: 3pt),
        radius: 12pt,
        text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#065F46"))[
          ● #subject-pill
        ]
      )

      #v(14pt)

      // Main Title & Subtitle
      #text(size: 26pt, weight: "black", fill: rgb("#192446"))[
        #title
      ]

      #v(8pt)

      #text(size: 13pt, weight: "bold", fill: rgb("#25B6F9"))[
        #subtitle
      ]

      #v(12pt)

      #text(size: 9pt, fill: rgb("#202B4D").lighten(20%))[
        Designed for Desktop Support Engineers, Systems Technicians, and Cloud Infrastructure Administrators. High-speed bus physics, physical macro inspection schematics, diagnostic decision trees, and 100+ company interview questions.
      ]

      #v(16pt)

      // Author Credit Box
      #block(
        width: 100%,
        stroke: 0.5pt + rgb(25, 36, 70, 15%),
        fill: white,
        radius: 6pt,
        inset: 10pt,
        [
          #text(size: 7.5pt, font: "Consolas", weight: "bold", fill: rgb("#202B4D").lighten(40%))[
            PRIMARY AUTHOR & ENGINEERING DIRECTORATE
          ]
          #v(3pt)
          #grid(
            columns: (1fr, auto),
            align: (left, right),
            [
              #text(size: 11pt, weight: "black", fill: rgb("#192446"))[#author]\
              #text(size: 8pt, fill: rgb("#202B4D").lighten(30%))[#author-title]
            ],
            [
              #text(size: 7.5pt, font: "Consolas", fill: rgb("#202B4D").lighten(40%))[Reviewed & Certified By]\
              #text(size: 8.5pt, weight: "bold", fill: rgb("#192446"))[#reviewed-by]
            ]
          )
        ]
      )

      #v(12pt)

      // Technical Pillars
      #grid(
        columns: (1fr, 1fr),
        gutter: 10pt,
        [
          #block(
            width: 100%,
            stroke: 0.5pt + rgb(25, 36, 70, 12%),
            fill: white,
            radius: 6pt,
            inset: 8pt,
            [
              #text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#10B981"))[⚡ #pillar-1-title]\
              #v(2pt)
              #for item in pillar-1-items [
                #text(size: 7.5pt, font: "Consolas", fill: rgb("#202B4D").lighten(25%))[• #item]\
              ]
            ]
          )
        ],
        [
          #block(
            width: 100%,
            stroke: 0.5pt + rgb(25, 36, 70, 12%),
            fill: white,
            radius: 6pt,
            inset: 8pt,
            [
              #text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#25B6F9"))[⚡ #pillar-2-title]\
              #v(2pt)
              #for item in pillar-2-items [
                #text(size: 7.5pt, font: "Consolas", fill: rgb("#202B4D").lighten(25%))[• #item]\
              ]
            ]
          )
        ]
      )

      #v(1fr)

      // Cover Footer
      #line(length: 100%, stroke: 0.5pt + rgb(25, 36, 70, 15%))
      #v(4pt)
      #grid(
        columns: (1fr, auto),
        text(size: 7.5pt, font: "Consolas", fill: rgb("#202B4D").lighten(40%))[
          From Silicon to Cloud · rtechlab.in · Confidential Industrial Distribution
        ],
        text(size: 7.5pt, font: "Consolas", weight: "bold", fill: rgb("#192446"))[
          2027 MASTER EDITION
        ]
      )
    ]
  )
}
