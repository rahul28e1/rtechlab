// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — HINDI V5.1.4 (COMMERCIAL MASTER RELEASE)
// Premium International Academic Textbook Edition (Devanagari)
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-hindi-v5(
  title: "कंप्यूटर फंडामेंटल्स",
  subtitle: "संपूर्ण शिक्षण एवं तकनीकी साक्षात्कार मार्गदर्शिका",
  edition: "2027 मास्टर एडिशन · V5.1.4",
  series-pill: "आधिकारिक वाणिज्यिक प्रकाशन · V5.1.4 उत्पादन मास्टर",
  author: "Rahul Patel",
  author-title: "संस्थापक एवं मुख्य प्रौद्योगिकी वास्तुकार, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-FUND-V5.1.4",
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
            #text(size: 8.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"), tracking: 1.5pt)[
              अकादमिक एवं व्यावसायिक कंप्यूटर विज्ञान श्रृंखला
            ]
            #v(4pt)
            #text(size: 26pt, font: "Nirmala UI", weight: "bold", fill: rgb("#0F172A"))[
              #title
            ]
            #v(4pt)
            #text(size: 11pt, font: "Nirmala UI", weight: "bold", fill: rgb("#4F46E5"))[
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
                      #text(fill: rgb("#38BDF8"))[●] हाई-डेंसिटी ATX आर्किटेक्चर · सॉकेट AM5 / LGA1851 · PCIe 5.0 / DDR5 माइक्रो-ट्रेसेस
                    ],
                    #text(size: 6.5pt, weight: "bold", fill: rgb("#38BDF8"), font: "Segoe UI")[
                      हार्डवेयर लैब नमूना
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
                  #text(size: 6.3pt, fill: rgb("#64748B"))[आर्किटेक्चर, सिलिकॉन, मेमोरी, OS व सुरक्षा]
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
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[50 साक्षात्कार प्रश्न]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[वरिष्ठ कॉर्पोरेट मॉडल उत्तर एवं फॉलो-अप]
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
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#4F46E5"))[30 मौखिक प्रश्न]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[वाइवा-वोस अभ्यास व मुख्य परीक्षा सारांश]
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
                  #text(size: 7.5pt, weight: "bold", fill: rgb("#059669"))[2027 आधुनिक तकनीक]\
                  #v(1pt)
                  #text(size: 6.3pt, fill: rgb("#64748B"))[NPU TOPS, CXL 3.1, Wi-Fi 7 व NIST PQC]
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
                  #text(size: 6.5pt, font: "Segoe UI", fill: rgb("#64748B"))[विषय कोड: #subject-code]
                ]
              )
            ]
          )
        ]
      )
    ]
  )
}
