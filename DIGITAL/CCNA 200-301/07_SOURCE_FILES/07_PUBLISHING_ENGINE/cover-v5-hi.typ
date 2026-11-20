// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — CISCO CCNA 200-301 (HINDI/DEVANAGARI)
// Premium International Academic & Enterprise Certification Textbook Edition
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-hindi-v5(
  title: "सिस्को CCNA 200-301 मास्टर गाइड",
  subtitle: "एंटरप्राइज रूटिंग, स्विचिंग, सबनेटिंग, OSPF, VLAN, सुरक्षा एवं प्लेसमेंट वॉल्ट",
  edition: "2027 मास्टर एडिशन · एडिशन 1",
  series-pill: "आधिकारिक RTECHLAB वाणिज्यिक प्रकाशन · CCNA 200-301 मास्टर",
  author: "Rahul Patel",
  author-title: "संस्थापक एवं मुख्य प्रौद्योगिकी वास्तुकार, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-CCNA-ED1-HI",
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
            #text(size: 8.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"), tracking: 1.5pt)[
              CISCO CERTIFIED NETWORK ASSOCIATE · उद्योग ब्लूप्रिंट
            ]
            #v(4pt)
            #text(size: 22pt, font: "Nirmala UI", weight: "bold", fill: rgb("#0F172A"))[
              #title
            ]
            #v(4pt)
            #text(size: 10pt, font: "Nirmala UI", weight: "bold", fill: rgb("#0284C7"))[
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
                    #text(size: 6.5pt, fill: rgb("#94A3B8"), font: "Nirmala UI")[
                      #text(fill: rgb("#10B981"))[●] एंटरप्राइज कोर एवं स्पाइन-लीफ डेटा सेंटर आर्किटेक्चर · 100GbE ऑप्टिकल इंटरकनेक्ट्स
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
                stroke: 0.5pt + rgb("#CBD5E1"),
                radius: 3pt,
                inset: 5pt,
                [
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[10 संपूर्ण अध्याय]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[आर्किटेक्चर, सबनेटिंग, IPv6, सिस्को CLI, VLAN एवं OSPF]
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
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#059669"))[सबनेटिंग मैजिक]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[इंस्टेंट /24 से /30 चीट शीट एवं चरणबद्ध VLSM विधि]
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
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[50 MNC साक्षात्कार]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[सिस्को TAC, TCS, Wipro, Airtel तकनीकी समाधान]
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
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#7C3AED"))[प्रैक्टिकल लैब्स]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[वास्तविक IOS कमांड्स, ROMMON 0x2142, TFTP रिकवरी]
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
              #text(size: 8.5pt, weight: "bold", fill: rgb("#0F172A"))[लेखक: #author]\
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
