// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — TALLY PRIME MASTER EDITION (GUJARATI)
// 100% Light Theme · No Dark Backgrounds
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
// =============================================================================

#let rtech-tally-cover-gu(
  title: "ટેલી પ્રાઇમ વિથ જીએસટી અને કોર્પોરેટ એકાઉન્ટિંગ",
  subtitle: "ડબલ એન્ટ્રી બુકકીપિંગ · 28 પ્રીડિફાઇન્ડ ગ્રુપ્સ · 24 વાઉચર્સ · આધુનિક GST સ્લેબ્સ (0%, 5%, 18%) · TDS · 50 પ્રેક્ટિકલ ઇનવોઇસ",
  edition: "2027 માસ્ટર કોમર્શિયલ આવૃત્તિ · આવૃત્તિ 1",
  series-pill: "ઓફિશિયલ આરટેક લેબ અને આઇએએનટી પ્રમાણિત પ્રકાશન",
  author: "રાહુલ પટેલ",
  author-title: "સ્થાપક અને ચીફ ટેકનોલોજી આર્કિટેક્ટ, RTechLab | કોર્પોરેટ એકાઉન્ટિંગ ટ્રેનર",
  lang-tag: "ગુજરાતી માસ્ટર આવૃત્તિ (GUJARATI COMPLETE EDITION)",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg"
) = {
  block(
    width: 100%,
    height: 100%,
    fill: white,
    inset: 0pt,
    outset: 0pt,
    [
      #rect(
        width: 100%,
        height: 100%,
        stroke: 2pt + rgb("#0E7490"),
        inset: 12mm,
        fill: white,
        [
          // Header
          #grid(
            columns: (auto, 1fr),
            align: (left + horizon, right + horizon),
            [
              #image(logo-path, width: 44mm)
            ],
            [
              #box(
                fill: rgb("#EFF6FF"),
                stroke: 1pt + rgb("#BFDBFE"),
                radius: 3pt,
                inset: (x: 8pt, y: 3.5pt),
                text(size: 6.8pt, weight: "bold", fill: rgb("#1D4ED8"))[#series-pill]
              )
            ]
          )

          #v(14pt)

          // Title Block
          #align(left)[
            #box(
              fill: rgb("#F0FDFA"),
              stroke: 1pt + rgb("#99F6E4"),
              radius: 2pt,
              inset: (x: 6pt, y: 2.5pt),
              text(size: 7.5pt, weight: "bold", fill: rgb("#0F766E"))[#lang-tag]
            )
            #v(6pt)
            #text(size: 23pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(4pt)
            #text(size: 10.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "bold", fill: rgb("#059669"))[
              #subtitle
            ]
            #v(6pt)
            #line(length: 100%, stroke: 2pt + rgb("#0E7490"))
          ]

          #v(10pt)

          // Feature Grid Highlights
          #grid(
            columns: (1fr, 1fr),
            gutter: 10pt,
            [
              #block(
                fill: rgb("#F0FDFA"),
                stroke: 1pt + rgb("#99F6E4"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#0F766E"))[✔ ડબલ એન્ટ્રી અને સુવર્ણ નિયમો]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[વ્યક્તિગત, માલ-મિલકત અને ઉપજ-ખર્ચ ખાતા, ઉધાર-જમાના સુવર્ણ નિયમો, 28 ગ્રુપ્સ અને 24 વાઉચર્સની ગુજરાતી સમજૂતી.]
                ]
              )
              #v(6pt)
              #block(
                fill: rgb("#FFFBEB"),
                stroke: 1pt + rgb("#FDE68A"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#B45309"))[✔ આધુનિક GST સ્લેબ્સ અને નિયમો]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[00% (કરમુક્ત કૃષિ પાક), 05% (આવશ્યક વસ્તુઓ) અને 18% (સ્ટાન્ડર્ડ ઇલેક્ટ્રોનિક્સ) નું સંપૂર્ણ વિશ્લેષણ અને IGST.]
                ]
              )
            ],
            [
              #block(
                fill: rgb("#EFF6FF"),
                stroke: 1pt + rgb("#BFDBFE"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#1D4ED8"))[✔ TDS કોર્પોરેટ કાયદાકીય નિયમો]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[કલમ 194C કોન્ટ્રાક્ટર, 194J વ્યવસાયિક ફી, 194I ભાડું, ચલણ ITNS 281 બેંક પેમેન્ટ, પાન કાર્ડ અને ફોર્મ 26Q.]
                ]
              )
              #v(6pt)
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 1pt + rgb("#E2E8F0"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#0F172A"))[✔ 50 ઓરિજિનલ ઇનવોઇસ અને પ્રેક્ટિસ]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[શ્રી વર્માના 50 વ્યવહારો, સલમાન ટ્રેડિંગ 18 ગ્રુપ્સ, ઊંઝા APMC જીરું/ઇસબગૂલ, ઇલેક્ટ્રોનિક્સ અને યર-એન્ડ BRS.]
                ]
              )
            ]
          )

          #v(16pt)

          // Author Card
          #grid(
            columns: (52mm, 1fr),
            gutter: 14pt,
            align: (center + horizon, left + horizon),
            [
              #box(
                clip: true,
                radius: 4pt,
                stroke: 2pt + rgb("#0E7490"),
                image(photo-path, width: 48mm, height: 56mm, fit: "cover")
              )
            ],
            [
              #text(size: 14pt, weight: "black", fill: rgb("#0F172A"))[#author]\
              #v(2pt)
              #text(size: 8.5pt, weight: "bold", fill: rgb("#0E7490"))[#author-title]\
              #v(4pt)
              #text(size: 7.5pt, fill: rgb("#475569"))[
                આઈટી અને કોર્પોરેટ એકાઉન્ટિંગના મુખ્ય ટ્રેનર, આઈએએનટી પાલનપુર. ગુજરાતભરના હજારો વિદ્યાર્થીઓને સફળ એકાઉન્ટન્ટ અને ટેક્સ કન્સલ્ટન્ટ બનાવ્યા. આ પુસ્તક ગુજરાતના વ્યવસાયો અને ટેલી પ્રાઇમના સાચા કોર્પોરેટ અનુભવ પર આધારિત છે.
              ]\
              #v(6pt)
              #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
              #v(4pt)
              #grid(
                columns: (1fr, 1fr),
                [#text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[પ્રમાણિત પ્રકાશક:] #text(size: 7pt, fill: rgb("#64748B"))[આરટેક લેબ પ્લેટફોર્મ્સ]],
                [#text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[સત્તાવાર પોર્ટલ:] #text(size: 7pt, fill: rgb("#0284C7"))[rtechlab.vercel.app]]
              )
            ]
          )

          #v(12pt)

          // Footer Banner (100% Light Themed)
          #block(
            width: 100%,
            fill: rgb("#F0FDFA"),
            stroke: 1.5pt + rgb("#0E7490"),
            inset: (x: 10pt, y: 7pt),
            radius: 4pt,
            [
              #grid(
                columns: (1fr, auto),
                align: (left + horizon, right + horizon),
                [
                  #text(size: 8pt, weight: "bold", fill: rgb("#0F172A"))[#edition]\
                  #text(size: 6.8pt, fill: rgb("#475569"))[સંપૂર્ણ પ્રેક્ટિકલ આવૃત્તિ · ટેલી પ્રાઇમ 4.x / 5.x અને નવા GST નિયમો (2026-2027) માટે તૈયાર]
                ],
                [
                  #box(
                    fill: rgb("#059669"),
                    radius: 2pt,
                    inset: (x: 6pt, y: 3pt),
                    text(size: 7pt, weight: "bold", fill: white)[આજીવન અપડેટ્સ સામેલ]
                  )
                ]
              )
            ]
          )
        ]
      )
    ]
  )
}
