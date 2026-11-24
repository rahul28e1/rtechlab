// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — MICROSOFT OFFICE 365 (GUJARATI EDITION 1)
// Premium International Academic & Enterprise Certification Textbook Edition
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5-gu(
  title: "માઈક્રોસોફ્ટ ઓફિસ 365 માસ્ટર ગાઇડ",
  subtitle: "વર્ડ · એક્સેલ · પાવરપોઇન્ટ · કોપાયલટ AI · એન્ટરપ્રાઇઝ એનાલિટિક્સ અને ઓટોમેશન વોલ્ટ",
  edition: "2027 માસ્ટર આવૃત્તિ · આવૃત્તિ 1 (ગુજરાતી)",
  series-pill: "ઓફિશિયલ RTECHLAB કોમર્શિયલ પબ્લિકેશન · ઓફિસ 365 એન્ટરપ્રાઇઝ",
  author: "રાહુલ પટેલ (Rahul Patel)",
  author-title: "સંસ્થાપક અને ચીફ ટેકનિકલ આર્કિટેક્ટ, RTechLab",
  tagline-1: "શીખો. પ્રેક્ટિસ કરો. ઇનોવેટ કરો.",
  tagline-2: "Enterprise Productivity Made Practical.",
  subject-code: "RTL-2027-O365-ED1-GU",
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
            #text(size: 8.5pt, font: ("Shruti", "Segoe UI", "Nirmala UI"), weight: "bold", fill: rgb("#0284C7"), tracking: 2pt)[
              એન્ટરપ્રાઇઝ પ્રોડક્ટિવિટી અને બિઝનેસ ઇન્ટેલિજન્સ સ્યુટ
            ]
            #v(4pt)
            #text(size: 20pt, font: ("Shruti", "Segoe UI", "Nirmala UI"), weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(4pt)
            #text(size: 9.5pt, font: ("Shruti", "Segoe UI", "Nirmala UI"), weight: "bold", fill: rgb("#059669"))[
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
                    #text(size: 6.5pt, fill: rgb("#94A3B8"), font: ("Shruti", "Segoe UI", "Nirmala UI"))[
                      #text(fill: rgb("#38BDF8"))[●] આધુનિક એન્ટરપ્રાઇઝ કમ્પ્યુટિંગ આર્કિટેક્ચર · ઓફિસ 365 ક્લાઉડ ઇકોસિસ્ટમ અને કો-ઓથરિંગ
                    ],
                    #text(size: 6.5pt, weight: "bold", fill: rgb("#38BDF8"), font: ("Shruti", "Segoe UI", "Nirmala UI"))[
                      ડિજિટલ વર્કપ્લેસ સ્પેસિમેન
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
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#0284C7"), font: ("Shruti", "Segoe UI"))[માઇક્રોસોફ્ટ વર્ડ]\
                  #text(size: 5.5pt, fill: rgb("#64748B"), font: ("Shruti", "Segoe UI"))[સ્ટાઇલ, TOC અને મેઇલ મર્જ]
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
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#059669"), font: ("Shruti", "Segoe UI"))[માઇક્રોસોફ્ટ એક્સેલ]\
                  #text(size: 5.5pt, fill: rgb("#64748B"), font: ("Shruti", "Segoe UI"))[XLOOKUP, એરે અને પીવોટ]
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
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#D97706"), font: ("Shruti", "Segoe UI"))[પાવરપોઇન્ટ 365]\
                  #text(size: 5.5pt, fill: rgb("#64748B"), font: ("Shruti", "Segoe UI"))[મોર્ફ, માસ્ટર્સ અને પિચ ડેક]
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
                  #text(size: 6.5pt, weight: "bold", fill: rgb("#7C3AED"), font: ("Shruti", "Segoe UI"))[કોપાયલટ AI 2027]\
                  #text(size: 5.5pt, fill: rgb("#64748B"), font: ("Shruti", "Segoe UI"))[પ્રોમ્પ્ટિંગ અને ક્લાઉડ ઓટોમેશન]
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
              #text(size: 8pt, font: ("Shruti", "Segoe UI", "Nirmala UI"), weight: "bold", fill: rgb("#0F172A"))[
                #author
              ]\
              #text(size: 6.5pt, font: ("Shruti", "Segoe UI", "Nirmala UI"), fill: rgb("#64748B"))[
                #author-title
              ]
            ],
            [
              #text(size: 7.5pt, font: ("Shruti", "Segoe UI", "Nirmala UI"), weight: "bold", fill: rgb("#0284C7"))[
                #edition
              ]\
              #text(size: 6pt, font: ("Shruti", "Segoe UI", "Nirmala UI"), fill: rgb("#64748B"))[
                વિષય કોડ: #subject-code · #tagline-1
              ]
            ]
          )
        ]
      )
    ]
  )
}
