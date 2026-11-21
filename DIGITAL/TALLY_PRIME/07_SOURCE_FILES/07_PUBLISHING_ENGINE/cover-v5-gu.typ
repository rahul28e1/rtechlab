// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — TALLY PRIME MASTER EDITION (GUJARATI)
// 100% Light Theme · No Dark Backgrounds
// Academic Curriculum Focus · No Self-Promotion on Front
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
// =============================================================================

#let rtech-tally-cover-gu(
  title: "ટેલી પ્રાઇમ વિથ જીએસટી અને કોર્પોરેટ એકાઉન્ટિંગ",
  subtitle: "ડબલ એન્ટ્રી બુકકીપિંગ · 28 પૂર્વ-નિર્ધારિત ગ્રુપ્સ · 24 વાઉચર્સ · આધુનિક જીએસટી સ્લેબ્સ (0%, 5%, 18%) · ટીડીએસ · 50 પ્રેક્ટિકલ ઇનવોઇસ",
  edition: "2027 માસ્ટર કોમર્શિયલ આવૃત્તિ · એડિશન 1",
  series-pill: "ઓફિશિયલ આરટેક લેબ અને આઇએએનટી પ્રમાણિત પ્રકાશન",
  author: "રાહુલ પટેલ",
  author-title: "લીડ કોર્પોરેટ એકાઉન્ટિંગ ટ્રેનર, IANT પાલનપુર | ફાઉન્ડર, RTechLab",
  lang-tag: "ગુજરાતી માસ્ટર એડિશન (GUJARATI COMPLETE EDITION)",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png"
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
        inset: 11mm,
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

          #v(10pt)

          // Title Block
          #align(left)[
            #box(
              fill: rgb("#F0FDFA"),
              stroke: 1pt + rgb("#99F6E4"),
              radius: 2pt,
              inset: (x: 6pt, y: 2.5pt),
              text(size: 7.5pt, weight: "bold", fill: rgb("#0F766E"))[#lang-tag]
            )
            #v(5pt)
            #text(size: 21pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(3pt)
            #text(size: 9.8pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "bold", fill: rgb("#059669"))[
              #subtitle
            ]
            #v(5pt)
            #line(length: 100%, stroke: 1.5pt + rgb("#0E7490"))
          ]

          #v(8pt)

          // Feature Grid Highlights
          #grid(
            columns: (1fr, 1fr),
            gutter: 8pt,
            [
              #block(
                fill: rgb("#F0FDFA"),
                stroke: 1pt + rgb("#99F6E4"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[✔ ડબલ એન્ટ્રી અને સુવર્ણ નિયમો]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[વ્યક્તિગત, માલ-મિલકત અને ઉપજ-ખર્ચ ખાતા, ઉધાર-જમાના સુવર્ણ નિયમો, 28 ગ્રુપ્સ અને 24 વાઉચર્સનું સરળ ગુજરાતી વિશ્લેષણ.]
                ]
              )
              #v(5pt)
              #block(
                fill: rgb("#FFFBEB"),
                stroke: 1pt + rgb("#FDE68A"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#B45309"))[✔ આધુનિક જીએસટી સ્લેબ અને નિયમો]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[00% (કરમુક્ત ઊંઝા મંડી એપીએમસી જીરું/ઇસબગોલ), 05% (આવશ્યક ચીજો) અને 18% (સ્ટાન્ડર્ડ ઇલેક્ટ્રોનિક્સ) વિગતવાર નિયમો.]
                ]
              )
            ],
            [
              #block(
                fill: rgb("#EFF6FF"),
                stroke: 1pt + rgb("#BFDBFE"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#1D4ED8"))[✔ ટીડીએસ કોર્પોરેટ પાલન]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[કલમ 194C કોન્ટ્રાક્ટર, 194J પ્રોફેશનલ ફી, 194I ભાડું, ચલણ 281 બેંક ચુકવણી, પાન કાર્ડ નિયમ અને ફોર્મ 26Q.]
                ]
              )
              #v(5pt)
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 1pt + rgb("#E2E8F0"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[✔ 50 વાસ્તવિક ઇનવોઇસ અને પ્રેક્ટિસ]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[શ્રી વર્માના 50 વ્યવહારો, સલમાન ટ્રેડિંગ 18 ગ્રુપ્સ, મોરબી સિરામિક્સ, ઇલેક્ટ્રોનિક્સ અને વર્ષાંત ક્લોઝિંગ સેટ.]
                ]
              )
            ]
          )

          #v(8pt)

          // 11 Core Curriculum Domains (Replaces Author Photo Card on Front)
          #block(
            width: 100%,
            fill: rgb("#F8FAFC"),
            stroke: 1.2pt + rgb("#CBD5E1"),
            inset: 8pt,
            radius: 4pt,
            [
              #text(size: 8.5pt, weight: "black", fill: rgb("#0F172A"))[સંપૂર્ણ 11-વિષય વ્યવહારુ કોર્પોરેટ અભ્યાસક્રમ બ્લુપ્રિન્ટ]\
              #v(4pt)
              #grid(
                columns: (1fr, 1fr),
                gutter: 6pt,
                [
                  #text(size: 6.8pt, fill: rgb("#334155"))[
                    *01. ટેલીનો ઇતિહાસ અને વિકાસ:* ભરત ગોયનકા, 80% બજાર હિસ્સો, લાયસન્સિંગ\\
                    *02. સિસ્ટમ આર્કિટેક્ચર:* કેક્ટસ ડેટાબેઝ એન્જિન, ટોપ મેનૂ, ગો-ટૂ (Alt+G)\\
                    *03. જીએસટી અને ટીડીએસ પાયો:* 0%, 5%, 18% સ્લેબ્સ, કલમ 194C/J/I/H, 26Q\\
                    *04. ખાતાઓના સુવર્ણ નિયમો:* વ્યક્તિગત, માલ-મિલકત, ઉપજ-ખર્ચ અને 20+ Dr/Cr પુરાવા\\
                    *05. 24 વાઉચર્સ અને શોર્ટકટ્સ:* એકાઉન્ટિંગ, ઇન્વેન્ટરી, ઓર્ડર અને મેમો શ્રેણીઓ\\
                    *06. 28 પૂર્વ-નિર્ધારિત ગ્રુપ્સ:* 15 પ્રાથમિક + 13 ગૌણ અને 50+ લેજર મેપિંગ્સ
                  ]
                ],
                [
                  #text(size: 6.8pt, fill: rgb("#334155"))[
                    *07. કંપની બનાવવાની પદ્ધતિ:* તબક્કાવાર નિર્માણ, ગુજરાત કોડ 24, F11 અને F12\\
                    *08. વ્યાપારિક સંગઠનોના પ્રકાર:* ટ્રેડિંગ, મેન્યુફેક્ચરિંગ અને સેવા ક્ષેત્ર\\
                    *09. પ્રેક્ટિકલ ઇનવોઇસિંગ:* ઇન્વેન્ટરી ઇનવોઇસ વિરુદ્ધ એકાઉન્ટિંગ ઇનવોઇસ\\
                    *10. માસ્ટર શોર્ટકટ્સ:* ઝડપી ડેટા એન્ટ્રી માટે 40+ કોર્પોરેટ શોર્ટકટ્સ\\
                    *11. કોર્પોરેટ બ્રિજ વિષયો:* GSTR-1/3B/2B મેળવણું, બેંક રિકન્સિલિયેશન (BRS), કોસ્ટ સેન્ટર
                  ]
                ]
              )
            ]
          )

          #v(8pt)

          // Institutional Endorsement & Course Credentials
          #block(
            width: 100%,
            fill: rgb("#F0FDF4"),
            stroke: 1pt + rgb("#BBF7D0"),
            inset: (x: 9pt, y: 6pt),
            radius: 3pt,
            [
              #grid(
                columns: (1fr, auto),
                align: (left + horizon, right + horizon),
                [
                  #text(size: 7.2pt, weight: "bold", fill: rgb("#166534"))[અભ્યાસક્રમ નિર્માતા: રાહુલ પટેલ] #text(size: 6.8pt, fill: rgb("#15803D"))[· લીડ કોર્પોરેટ એકાઉન્ટિંગ ટ્રેનર, IANT પાલનપુર]\
                  #text(size: 6.5pt, fill: rgb("#475569"))[કોમર્સ વિદ્યાર્થીઓ, બી.કોમ/એમ.કોમ, સીએ આર્ટિકલ્સ, એકાઉન્ટન્ટ્સ અને વેપારીઓ માટે વિશેષ તૈયાર]
                ],
                [
                  #box(
                    fill: rgb("#DCFCE7"),
                    stroke: 0.5pt + rgb("#86EFAC"),
                    radius: 2pt,
                    inset: (x: 5pt, y: 2.5pt),
                    text(size: 6.5pt, weight: "bold", fill: rgb("#166534"))[100% પ્રેક્ટિકલ]
                  )
                ]
              )
            ]
          )

          #v(8pt)

          // Footer Banner (100% Light Themed)
          #block(
            width: 100%,
            fill: rgb("#F0FDFA"),
            stroke: 1.5pt + rgb("#0E7490"),
            inset: (x: 9pt, y: 6pt),
            radius: 4pt,
            [
              #grid(
                columns: (1fr, auto),
                align: (left + horizon, right + horizon),
                [
                  #text(size: 7.8pt, weight: "bold", fill: rgb("#0F172A"))[#edition]\
                  #text(size: 6.5pt, fill: rgb("#475569"))[સંપૂર્ણ પ્રેક્ટિકલ આવૃત્તિ · ટેલી પ્રાઇમ 4.x / 5.x અને નવા જીએસટી નિયમો (2026-2027) માટે સંપૂર્ણ અદ્યતન]
                ],
                [
                  #box(
                    fill: rgb("#059669"),
                    radius: 2pt,
                    inset: (x: 6pt, y: 3pt),
                    text(size: 6.8pt, weight: "bold", fill: white)[આજીવન અપડેટ્સ સામેલ]
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
