// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — CISCO CCNA 200-301 (EDITION 1)
// Premium International Academic & Enterprise Certification Textbook Edition
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5(
  title: "CISCO CCNA 200-301 MASTER GUIDE",
  subtitle: "Enterprise Routing, Switching, Subnetting, OSPF, VLANs, Security & Placement Vault",
  edition: "2027 MASTER EDITION · EDITION 1",
  series-pill: "OFFICIAL RTECHLAB COMMERCIAL PUBLICATION · CCNA 200-301 MASTER",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-CCNA-ED1",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "../03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg"
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
                text(size: 6.5pt, weight: "bold", fill: rgb("#10B981"))[#series-pill]
              )
            ]
          )

          #v(10pt)

          // --- Book Title Block ---
          #align(left)[
            #text(size: 8.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"), tracking: 2pt)[
              CISCO CERTIFIED NETWORK ASSOCIATE · INDUSTRY BLUEPRINT
            ]
            #v(4pt)
            #text(size: 24pt, font: "Segoe UI", weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(4pt)
            #text(size: 10.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[
              #subtitle
            ]
            #v(2pt)
            #line(length: 100%, stroke: 1.5pt + rgb("#059669"))
          ]

          #v(8pt)

          // --- Hero Datacenter / Networking Visual ---
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
                      #text(fill: rgb("#10B981"))[●] Enterprise Core & Spine-Leaf Datacenter Architecture · 100GbE Optical Interconnects
                    ],
                    #text(size: 6.5pt, weight: "bold", fill: rgb("#10B981"), font: "Segoe UI")[
                      INFRASTRUCTURE SPECIMEN
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
                stroke: 0.5pt + rgb("#64748B"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[16 In-Depth Modules]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[Architecture, Subnetting, IPv6, Cisco CLI, VLANs, OSPF & GNS3]
                ]
              )
            ],
            [
              #block(
                width: 100%,
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#64748B"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#059669"))[Subnetting Magic]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[Instant /24 to /30 Cheat Sheet & VLSM Step-by-Step]
                ]
              )
            ],
            [
              #block(
                width: 100%,
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#64748B"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[60+ MNC Q&As]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[Cisco TAC, TCS, Wipro, Airtel Placement Solutions]
                ]
              )
            ],
            [
              #block(
                width: 100%,
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#64748B"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#7C3AED"))[Production Labs]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[Real IOS Commands, ROMMON 0x2142, TFTP Rescue]
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
              #text(size: 6.5pt, weight: "bold", fill: rgb("#059669"))[#tagline-1 · #tagline-2]
            ],
            [
              #box(
                fill: rgb("#ECFDF5"),
                stroke: 0.5pt + rgb("#059669"),
                radius: 3pt,
                inset: (x: 8pt, y: 4pt),
                align(right)[
                  #text(size: 8pt, weight: "black", fill: rgb("#059669"))[#edition]\
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
