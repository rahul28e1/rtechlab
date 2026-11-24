// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — MICROSOFT OFFICE 365 (HINDI EDITION 1)
// Premium International Academic & Enterprise Certification Textbook Edition
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5-hi(
  title: "माइक्रोसॉफ्ट ऑफिस 365 मास्टर गाइड",
  subtitle: "वर्ड · एक्सेल · पावरपॉइंट · कोपायलट AI · एंटरप्राइज एनालिटिक्स एवं ऑटोमेशन वॉल्ट",
  edition: "2027 मास्टर संस्करण · संस्करण 1",
  series-pill: "ऑफिशियल RTECHLAB कमर्शियल पब्लिकेशन · ऑफिस 365 एंटरप्राइज",
  author: "राहुल पटेल (Rahul Patel)",
  author-title: "संस्थापक एवं मुख्य तकनीकी वास्तुकार, RTechLab",
  tagline-1: "सीखें. अभ्यास करें. नवाचार करें.",
  tagline-2: "टेक्नोलॉजी मेड प्रैक्टिकल.",
  subject-code: "RTL-2027-O365-ED1-HI",
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
            #text(size: 8.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"), tracking: 2pt)[
              एंटरप्राइज प्रोडक्टिविटी एवं बिजनेस इंटेलिजेंस सुइट
            ]
            #v(4pt)
            #text(size: 21pt, font: ("Nirmala UI", "Segoe UI"), weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(4pt)
            #text(size: 10pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#059669"))[
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
                    #text(size: 6.5pt, fill: rgb("#94A3B8"), font: ("Nirmala UI", "Segoe UI"))[
                      #text(fill: rgb("#38BDF8"))[●] आधुनिक एंटरप्राइज कम्प्यूटिंग आर्किटेक्चर · ऑफिस 365 क्लाउड इकोसिस्टम एवं को-ऑथरिंग
                    ],
                    #text(size: 6.5pt, weight: "bold", fill: rgb("#38BDF8"), font: "Segoe UI")[
                      डिजिटल वर्कप्लेस स्पेसिमेन
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
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#0284C7"))[माइक्रोसॉफ्ट वर्ड]\
                  #text(size: 5.5pt, fill: rgb("#64748B"))[स्टाइल्स, TOC व मेल मर्ज]
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
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#059669"))[माइक्रोसॉफ्ट एक्सेल]\
                  #text(size: 5.5pt, fill: rgb("#64748B"))[XLOOKUP, एरे व पिवट]
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
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#D97706"))[पावरपॉइंट 365]\
                  #text(size: 5.5pt, fill: rgb("#64748B"))[मॉर्फ, मास्टर्स व पिच डेक]
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
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#7C3AED"))[कोपायलट AI 2027]\
                  #text(size: 5.5pt, fill: rgb("#64748B"))[प्रॉम्प्टिंग व क्लाउड ऑटोमेशन]
                ]
              )
            ]
          )

          #v(7pt)

          // --- Bottom Meta Bar ---
          #line(length: 100%, stroke: 0.5pt + rgb("#64748B"))
          #v(4pt)
          #grid(
            columns: (1fr, 1fr),
            align: (left, right),
            [
              #text(size: 8pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[
                #author
              ]\
              #text(size: 6.5pt, font: ("Nirmala UI", "Segoe UI"), fill: rgb("#64748B"))[
                #author-title
              ]
            ],
            [
              #text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[
                #edition
              ]\
              #text(size: 6pt, font: ("Nirmala UI", "Segoe UI"), fill: rgb("#64748B"))[
                विषय कोड: #subject-code · #tagline-1
              ]
            ]
          )
        ]
      )
    ]
  )
}
