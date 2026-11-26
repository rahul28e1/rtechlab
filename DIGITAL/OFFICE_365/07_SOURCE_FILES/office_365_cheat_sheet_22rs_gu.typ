// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE PRODUCTIVITY DESK CHEAT SHEET (GUJARATI V4)
// Exactly 8 Pages · Printable Daily Desk Companion · Edition 1 (2027)
// Author: Rahul Patel (Founder & Systems Architect, RTechLab)
// =============================================================================

#set document(
  title: "Microsoft 365 Enterprise Desk Reference & Cheat Sheet (Gujarati)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 8.5mm, bottom: 7.5mm, left: 8.5mm, right: 8.5mm),
  background: context {
    let p = counter(page).get().first()
    if p > 1 [
      #place(center + horizon)[
        #rotate(-35deg)[
          #text(size: 76pt, weight: "black", fill: rgb("#0F172A0B"))[RTECHLAB]
        ]
      ]
    ]
  },
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 11pt, baseline: 1.5pt)[#image("02_BRAND_ASSETS/rtechlab_official_badge_logo.png", height: 11pt)]
          #h(3pt)
          #text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 8pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 વ્યવસાયિક ડેઇલી ડેસ્ક રેફરન્સ અને ચીટ શીટ]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#107C41"))[વર્ડ · એક્સેલ · પાવરપોઇન્ટ · આઉટલુક · ક્લાઉડ]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · રાહુલ પટેલ]
        ]
      )
      #v(1.5pt)
      #line(length: 100%, stroke: 0.6pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(1.5pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.6pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] ટેકનોલોજી વ્યવહારિક સ્વરૂપમાં · પ્રિન્ટ કરી ડેસ્ક પર રાખો · નિઃશુલ્ક ટૂલ્સ: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.5pt),
            text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[પૃષ્ઠ #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
  size: 7.0pt,
  fill: rgb("#0F172A"),
  spacing: 100%,
  lang: "gu"
)

#set par(
  justify: true,
  leading: 0.40em,
  first-line-indent: 0pt
)

// Brand Palette
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-word = rgb("#185ABD")
#let rtech-excel = rgb("#107C41")
#let rtech-ppt = rgb("#C43E1C")
#let rtech-outlook = rgb("#0078D4")
#let rtech-muted = rgb("#475569")
#let dark-border = rgb("#1E293B")
#let med-border = rgb("#334155")

// Highlighters
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-o(body) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#body]]
#let kbd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.6pt + dark-border, radius: 2pt, inset: (x: 2.5pt, y: 0.8pt))[#text(size: 6.6pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-blue) = {
  v(1.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3.5pt + color, rest: 0.6pt + dark-border),
    radius: (right: 3pt),
    inset: (x: 5pt, y: 2.5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 4pt, y: 1.2pt),
            text(size: 6.2pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 8.2pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(1pt)
}

// =============================================================================
// PAGE 01: THE EXECUTIVE MASTER COVER PAGE & COMPREHENSIVE INDEX (GUJARATI)
// =============================================================================

#align(center)[
  // Top Header Banner with Official RTechLab Badge Logo
  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    align: (horizon, horizon),
    [
      #box(height: 28pt)[#image("02_BRAND_ASSETS/rtechlab_official_badge_logo.png", height: 28pt)]
    ],
    [
      #align(left)[
        #text(size: 11pt, weight: "black", tracking: 1.5pt, fill: rtech-blue)[RTECHLAB વોકેશનલ લર્નિંગ સિસ્ટમ્સ]\
        #text(size: 7pt, fill: rtech-muted)[ટેકનોલોજી વ્યવહારિક સ્વરૂપમાં · ગુજરાત #1 વોકેશનલ આર્કિટેક્ચર ટ્રેક · એડિશન 1 (2027)]
      ]
    ]
  )
  #v(1.5pt)
  #line(length: 100%, stroke: 0.8pt + rgb("#CBD5E1"))
  #v(2.5pt)

  // Author & Credentials
  #text(size: 10pt, weight: "black", fill: rtech-navy)[લેખક: રાહુલ પટેલ (સંસ્થાપક અને મુખ્ય સિસ્ટમ્સ આર્કિટેક્ટ)]\
  #text(size: 7.2pt, fill: rtech-muted)[
    ડિરેક્ટર અને સિનિયર ટેકનિકલ એક્સપર્ટ, IANT કોમ્પ્યુટર એજ્યુકેશન, પાલનપુર · 10+ વર્ષ IT ઉદ્યોગ અનુભવ · 3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત
  ]

  #v(3pt)
  #line(length: 20%, stroke: 1.5pt + rtech-blue)
  #v(3pt)

  // Original Microsoft 365 Logo
  #image("02_BRAND_ASSETS/microsoft_365_official_logo.png", width: 52%)

  #v(2.5pt)
  #text(size: 18pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rtech-navy, tracking: 0.5pt)[
    માઇક્રોસોફ્ટ 365 એન્ટરપ્રાઇઝ
  ]
  #v(1pt)
  #text(size: 10.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rtech-blue)[
    વ્યવસાયિક કોર્પોરેટ ડેઇલી ડેસ્ક રેફરન્સ અને અલ્ટીમેટ ચીટ શીટ
  ]
  #v(1pt)
  #text(size: 7.4pt, weight: "bold", fill: rtech-muted)[
    એડવાન્સ્ડ એક્સેલ 365 (ડાયનામિક એરે અને XLOOKUP) · વર્ડ કોર્પોરેટ સ્ટાઇલિંગ · એક્ઝિક્યુટિવ પાવરપોઇન્ટ · આઉટલુક ઇનબોક્સ ઝીરો · ક્લાઉડ ટીમવર્ક
  ]

  #v(3pt)

  // Bestseller Seal
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#0284C7"),
    radius: 12pt,
    inset: (x: 10pt, y: 2pt),
    text(size: 6.8pt, weight: "black", fill: rgb("#0369A1"))[
      ★ કોર્પોરેટ એક્ઝિક્યુટિવ્સ, MIS એનાલિસ્ટ્સ અને કોમર્સ તથા IT વિદ્યાર્થીઓ માટે #1 દૈનિક ડેસ્ક ગાઇડ ★
    ]
  )

  #v(3.5pt)

  // OFFICIAL 8-PAGE COURSE INDEX (Point-to-Point with Exact Page Numbers)
  #block(
    width: 100%,
    stroke: 0.8pt + dark-border,
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: (x: 6pt, y: 4pt),
    [
      #align(center)[
        #text(size: 7.6pt, weight: "black", fill: rtech-navy)[📑 સત્તાવાર 8-પૃષ્ઠીય ડેસ્ક રેફરન્સ અને ચીટ શીટ વિષય-સૂચિ (અનુક્રમણિકા)]
      ]
      #v(2pt)
      #table(
        columns: (0.7fr, 1.6fr, 3.7fr),
        stroke: 0.65pt + dark-border,
        fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F1F5F9") } else { white },
        align: (col, row) => if col == 0 { center } else { left + horizon },
        inset: 2.8pt,

        text(size: 6.8pt, weight: "bold", fill: white)[પૃષ્ઠ નંબર],
        text(size: 6.8pt, weight: "bold", fill: white)[મોડ્યુલનું નામ],
        text(size: 6.8pt, weight: "bold", fill: white)[મુખ્ય કોન્સેપ્ટ્સ અને વિઝ્યુઅલ આર્ટિફેક્ટ્સ],

        [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 1]]],
        [#text(weight: "bold", fill: rtech-blue)[એક્ઝિક્યુટિવ કવર અને બ્લુપ્રિન્ટ]],
        [સત્તાવાર M365 અને RTechLab બ્રાન્ડિંગ, લેખક ક્રેડેન્શિયલ્સ, પબ્લિશિંગ વિઝન અને સમગ્ર ઇન્ડેક્સ.],

        [#box(fill: rtech-word, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 2]]],
        [#text(weight: "bold", fill: rtech-word)[MS વર્ડ 365 આર્કિટેક્ચર]],
        [હેડિંગ સ્ટાઇલ લિંકેજ (1-3), સેક્શન બ્રેક વિરુદ્ધ પેજ બ્રેક, #hl-y[ડોક્યુમેન્ટ લેઆઉટ વિઝ્યુઅલ], મેઇલ મર્જ અને 16 કીઝ.],

        [#box(fill: rtech-excel, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 3]]],
        [#text(weight: "bold", fill: rtech-excel)[એક્સેલ મોડર્ન ફોર્મ્યુલા એન્જિન]],
        [ડાયનામિક એરે (`#`), `XLOOKUP` (2-Way અને રિવર્સ), `FILTER`, `UNIQUE`, `LET`, #hl-g[એક્સેલ ડાયનામિક ગ્રીડ વિઝ્યુઅલ] અને `SUMIFS`.],

        [#box(fill: rtech-excel, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 4]]],
        [#text(weight: "bold", fill: rtech-excel)[એક્સેલ શોર્ટકટ્સ અને પાવર ક્વેરી]],
        [ટોચના 30 હાઇ-સ્પીડ MIS હોટકીઝ + 6-તબક્કાની સ્વચાલિત ETL ડેટા રીશેપિંગ પાઇપલાઇન (Unpivot, Merge, Load).],

        [#box(fill: rtech-ppt, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 5]]],
        [#text(weight: "bold", fill: rtech-ppt)[પાવરપોઇન્ટ કોર્પોરેટ ડેક]],
        [સ્લાઇડ માસ્ટર બ્રાન્ડ લોકિંગ, 16:9 રેશિયો, #hl-o[સ્લાઇડ માસ્ટર અને મોર્ફ વિઝ્યુઅલ] (`!!Logo`), અને 16 પ્રેઝન્ટર કીઝ.],

        [#box(fill: rtech-outlook, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 6]]],
        [#text(weight: "bold", fill: rtech-outlook)[આઉટલુક સેટઅપ અને 4D નિયમ]],
        [કોર્પોરેટ એકાઉન્ટ રૂપરેખાંકન, 4D ઇનબોક્સ ઝીરો પ્રોટોકોલ (Do, Delegate, Defer, Delete), રૂલ્સ અને શેડ્યુલિંગ.],

        [#box(fill: rtech-blue, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 7]]],
        [#text(weight: "bold", fill: rtech-blue)[ક્લાઉડ, વનડ્રાઇવ અને કાર્ય નૈતિકતા]],
        [M365 ઓનલાઇન લાભો, 1TB વનડ્રાઇવ સિંક, વર્ઝન રિસ્ટોર, #hl-b[ક્લાઉડ ગવર્નન્સ વિઝ્યુઅલ] અને કાર્યસ્થળ નૈતિકતા.],

        [#box(fill: rgb("#047857"), inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 8]]],
        [#text(weight: "bold", fill: rgb("#047857"))[લેખક હબ અને MNC ઇન્ટરવ્યુ]],
        [રાહુલ પટેલ પ્રોફાઇલ, 4 સ્કેનેબલ QR હબ (પોર્ટફોલિયો, યુટ્યુબ, ઇન્સ્ટા, વ્હોટ્સએપ) + ટોચના 5 MNC MIS Q&A.],
      )
    ]
  )

  #v(3pt)

  // Bottom 4-Pillar Stats
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 5pt,
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[100+]\
        #text(size: 6pt, weight: "bold", fill: rtech-excel)[હોટકીઝ અને શોર્ટકટ્સ]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[35+]\
        #text(size: 6pt, weight: "bold", fill: rtech-blue)[ડાયનામિક ફોર્મ્યુલા]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[4 BLUEPRINTS]\
        #text(size: 6pt, weight: "bold", fill: rtech-word)[વિઝ્યુઅલ સ્નેપશોટ્સ]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[100%]\
        #text(size: 6pt, weight: "bold", fill: rgb("#047857"))[MNC પ્લેસમેન્ટ રેડી]
      ]
    ]
  )
]

#pagebreak()

// =============================================================================
// PAGE 02: MICROSOFT WORD 365: LEGAL STYLES & SHORTCUTS (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[વર્ડ 365: કોર્પોરેટ લીગલ આર્કિટેક્ચર, સેક્શન બ્રેક્સ અને ચીટ શીટ]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[દોષરહિત મલ્ટી-પેજ ફોર્મેટિંગ · લેન્ડસ્કેપ પેજ ઉમેરવું · 1 મિનિટમાં 1000+ પત્રો · ટોચની 16 વર્ડ કીઝ]
]

#section-banner(num: "POINT 01", title: "હેડિંગ સ્ટાઇલ અને નંબરિંગ લિંકેજ (નંબરિંગ બગડવાનો પાકો ઉકેલ)", color: rtech-word)

#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[સ્ટ્રક્ચરલ ઘટક],
  text(size: 6.8pt, weight: "bold", fill: white)[કોર્પોરેટ ડોક્યુમેન્ટ નિયમ],
  text(size: 6.8pt, weight: "bold", fill: white)[Word 365 માં કેવી રીતે સેટ કરવું?],

  [#text(weight: "bold", fill: rtech-word)[1. Heading 1, 2, 3 લિંકેજ]],
  [નંબર ક્યારેય હાથેથી ટાઇપ ન કરો! મલ્ટીલેવલ લિસ્ટને સીધા હેડિંગ સ્ટાઇલ સાથે લિંક કરો જેથી 100+ પેજમાં નંબરિંગ ન બગડે.],
  [#kbd[Multilevel List] $->$ #kbd[Define New Multilevel List] $->$ #kbd[More] $->$ #hl-y[Link level to style: Heading 1]। લેવલ 2 અને 3 માટે પુનરાવર્તન કરો.],

  [#text(weight: "bold", fill: rtech-blue)[2. ઓટોમેટિક અનુક્રમણિકા (TOC)]],
  [વિષય-સૂચિ (Table of Contents) પેજ નંબર ટાઇપ કર્યા વગર 1-ક્લિકમાં આપમેળે બનશે.],
  [#text(weight: "bold")[References $->$ Table of Contents $->$ Automatic Table 1] પસંદ કરો. અપડેટ કરવા માટે #kbd[F9] દબાવો.],

  [#text(weight: "bold", fill: rtech-emerald)[3. નેવિગેશન પેન કંટ્રોલ]],
  [100+ પેજના લાંબા કરારમાં પ્રકરણોને ડ્રેગ કરીને સીધા પુનઃક્રમિત કરવા.],
  [#kbd[Ctrl + F] દબાવી #kbd[Headings] પસંદ કરો. સીધા હેડિંગને ઉપર-નીચે ડ્રેગ કરીને આખા પ્રકરણનું સ્થાન બદલો!],
)

#v(1.5pt)
// Authentic Visual Snapshot: Word Document Architecture
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/word_document_layout_visual.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "માઇક્રોસોફ્ટ વર્ડ માટે ટોચના 16 દૈનિક શોર્ટકટ્સ ચીટ શીટ", color: rtech-word)

#table(
  columns: (1.1fr, 1.4fr, 1.1fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.6pt,

  text(size: 6.6pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.6pt, weight: "bold", fill: white)[કાર્ય],
  text(size: 6.6pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.6pt, weight: "bold", fill: white)[કાર્ય],

  [#kbd[Ctrl + Shift + C / V]], [ફોર્મેટ પેઇન્ટર કોપી / પેસ્ટ],
  [#kbd[Shift + F3]], [કેસ બદલવો (નાના $->$ પ્રથમ મોટો $->$ બધા મોટા)],
  [#kbd[Ctrl + Enter]], [સ્વચ્છ પેજ બ્રેક ઉમેરવો],
  [#kbd[Alt + Shift + D]], [આજની તારીખ ઉમેરવી],
  [#kbd[Ctrl + F]], [નેવિગેશન અને સર્ચ પેન ખોલવું],
  [#kbd[Ctrl + H]], [ફાઇન્ડ એન્ડ રિપ્લેસ વિન્ડો],
  [#kbd[Ctrl + K]], [હાઇપરલિંક ઉમેરવી],
  [#kbd[Ctrl + E] / #kbd[Ctrl + L]], [સેન્ટર અલાઇન / લેફ્ટ અલાઇન],
  [#kbd[Ctrl + J]], [જસ્ટિફાય (બંને બાજુ સરખા માર્જિન)],
  [#kbd[Ctrl + Shift + > / <]], [ફોન્ટ સાઇઝ વધારવી / ઘટાડવી],
  [#kbd[Ctrl + Space]], [મેન્યુઅલ ફોર્મેટિંગ હટાવી સામાન્ય કરવું],
  [#kbd[Ctrl + 1] / #kbd[Ctrl + 2]], [સિંગલ લાઇન સ્પેસ / ડબલ સ્પેસ],
  [#kbd[F7]], [સ્પેલિંગ અને ગ્રામર ચેકર],
  [#kbd[Ctrl + Shift + E]], [ટ્રેક ચેન્જીસ (Track Changes) ઓન/ઓફ],
  [#kbd[Alt + Shift + Up / Down]], [પેરાગ્રાફ કે રો ને ઉપર-નીચે ખસેડવી],
  [#kbd[Ctrl + Backspace / Del]], [આગળનો / પાછળનો સમગ્ર શબ્દ ભૂંસવો],
)

#pagebreak()

// =============================================================================
// PAGE 03: MODERN EXCEL 365: ADVANCE FORMULA CHEATSHEET (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[એક્સેલ 365: નેક્સ્ટ જનરેશન એડવાન્સ્ડ ફોર્મ્યુલા અને ડાયનામિક ગણતરીઓ]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[સ્પિલ રેન્જ (`#`) · ટુ-વે મેટ્રિક્સ લુકઅપ · LET દ્વારા 5x ઝડપી ગણતરી · ટેક્સ્ટ વિભાજન અને લોજિક્સ]
]

#section-banner(num: "POINT 01", title: "XLOOKUP માસ્ટરી (VLOOKUP, HLOOKUP અને INDEX-MATCH નો સંપૂર્ણ વિકલ્પ)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ફંક્શન અને સિન્ટેક્સ],
  text(size: 6.8pt, weight: "bold", fill: white)[કોર્પોરેટ દ્રશ્ય (Scenario)],
  text(size: 6.8pt, weight: "bold", fill: white)[પ્રો-ટીપ / ટેકનિકલ લાભ],

  [#text(weight: "bold", fill: rtech-excel)[1. `=XLOOKUP(...)`\ #text(size: 5.6pt)[(lookup, lkp_arr, ret_arr, [if_nf], [match], [search])]]],
  [કોલમ નંબર ગણ્યા વિના એમ્પ્લોયી ID પરથી પગાર શોધવો:\
  #hl-g[`=XLOOKUP(F2, A2:A500, D2:D500, "Not Found")`]],
  [#hl-y[બાય-ડિફોલ્ટ ચોક્કસ મેળ (Exact Match)]। ડાબી બાજુ પણ શોધી શકે છે; નવી કોલમ ઉમેરવાથી ફોર્મ્યુલા ક્યારેય તૂટતો નથી.],

  [#text(weight: "bold", fill: rtech-excel)[2. Multi-Column Spill]],
  [એક જ ફોર્મ્યુલાથી નામ, ડિપાર્ટમેન્ટ અને CTC ત્રણેય એકસાથે મેળવવા:\
  #hl-g[`=XLOOKUP(F2, A2:A500, B2:D500)`]],
  [3 અલગ VLOOKUP ને બદલે ફક્ત 1 ફોર્મ્યુલા ત્રણેય કોલમમાં પરિણામ આપમેળે સ્પિલ કરી દે છે!],

  [#text(weight: "bold", fill: rtech-blue)[3. Two-Way Matrix Lookup\ (2D ગ્રીડ સર્ચ)]],
  [રોમાં પ્રોડક્ટ અને કોલમમાં રીજન આધારે મૂલ્ય શોધવું:\
  #hl-b[`=XLOOKUP(A10, A2:A6, XLOOKUP(B9, B1:F1, B2:F6))`]],
  [નેસ્ટેડ XLOOKUP રો અને કોલમ બંને હેડર પ્રોસેસ કરે છે. જૂના `=INDEX(..., MATCH(), MATCH())` ને સંપૂર્ણ રિપ્લેસ કરે છે.],

  [#text(weight: "bold", fill: rtech-muted)[4. રિવર્સ સર્ચ\ (`search_mode = -1`)]],
  [ગ્રાહકનું સૌથી છેલ્લું (લેટેસ્ટ) ઇનવોઇસ બિલ શોધવું:\
  #hl-g[`=XLOOKUP(G2, Cust_Col, Date_Col, , 0, -1)`]],
  [ડેટા સોર્ટ કર્યા વગર નીચેથી ઉપરની તરફ શોધે છે, જેથી સૌથી તાજો વ્યવહાર તરત મળી જાય છે.],
)

#v(1.5pt)
// Authentic Visual Snapshot: Excel Dynamic Array Grid & Formula Bar
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/excel_dynamic_array_grid.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "આધુનિક ટેક્સ્ટ ફંક્શન્સ, મલ્ટી-કન્ડિશન એગ્રીગેશન અને LET એન્જિન", color: rtech-excel)

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ફંક્શન],
  text(size: 6.8pt, weight: "bold", fill: white)[ફોર્મ્યુલા ઉદાહરણ],
  text(size: 6.8pt, weight: "bold", fill: white)[વ્યવહારિક ઉપયોગ],

  [#text(weight: "bold", fill: rtech-excel)[1. `TEXTSPLIT`]],
  [#hl-g[`=TEXTSPLIT(A2, ",", ";")`]],
  [અલ્પવિરામ કે અર્ધવિરામથી જોડાયેલા શબ્દોને એકસાથે અનેક રો અને કોલમમાં વિભાજિત કરે છે.],

  [#text(weight: "bold", fill: rtech-excel)[2. `TEXTBEFORE` / `AFTER`]],
  [#hl-g[`=TEXTBEFORE(A2, "@")`] / #hl-b[`=TEXTAFTER(A2, "@")`]],
  [ઇમેઇલ ID માંથી યુઝરનેમ (`rahul.patel`) અને કંપની ડોમેન (`rtechlab.com`) અલગ કાઢવું.],

  [#text(weight: "bold", fill: rtech-blue)[3. `FILTER` + `UNIQUE`]],
  [#hl-b[`=SORT(UNIQUE(FILTER(A2:A100, B2:B100="Completed")))`]],
  [ગ્રાહકોમાંથી ડુપ્લિકેટ્સ હટાવી અનોખી યાદીને A થી Z ક્રમમાં 1 સેકન્ડમાં સોર્ટ કરે છે.],

  [#text(weight: "bold", fill: rtech-ppt)[4. `LET` (5x ગતિ એન્જિન)]],
  [#hl-o[`=LET(rev, D2:D100, cost, E2:E100, m, (rev-cost)/rev, IF(m>0.2, "High", "Low"))`]],
  [#hl-y[ગણતરીની ઝડપ 500% વધારે છે]। જટિલ ગણતરીઓને વેરિયેબલ બનાવી માત્ર એક જ વાર પ્રોસેસ કરે છે.],

  [#text(weight: "bold", fill: rtech-excel)[5. `SUMIFS` / `COUNTIFS`]],
  [#hl-g[`=SUMIFS(Sales, Region, "West", Date, ">=2027-01-01")`]],
  [Sum_Range હંમેશા #hl-y[સૌ પ્રથમ] આવે છે. લોજિકલ ઓપરેટર્સ અવતરણ ચિહ્નો (`">=2027-01-01"`) માં રાખો.],
)

#pagebreak()

// =============================================================================
// PAGE 04: EXCEL SHORTCUTS & POWER QUERY (ETL) PIPELINE (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[એક્સેલ 365: ટોચના 30 કાર્યસ્થળ શોર્ટકટ્સ અને પાવર ક્વેરી (ETL) પાઇપલાઇન]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[એકાઉન્ટન્ટ્સ માટે હાઇ-સ્પીડ હોટકીઝ · સ્વચાલિત 6-તબક્કાની ETL પાઇપલાઇન · શૂન્ય-VBA ઓટોમેશન]
]

#section-banner(num: "POINT 01", title: "એકાઉન્ટન્ટ્સ અને MIS માટે ટોચના 30 હાઇ-સ્પીડ કીબોર્ડ શોર્ટકટ્સ", color: rtech-excel)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.65pt + dark-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 2.8pt,

      text(size: 6.6pt, weight: "bold", fill: white)[શોર્ટકટ],
      text(size: 6.6pt, weight: "bold", fill: white)[શું કાર્ય કરે છે?],

      [#kbd[Ctrl + T]], [પસંદ કરેલા ડેટાને સત્તાવાર ટેબલમાં ફેરવવો],
      [#kbd[Ctrl + Alt + V] $->$ #kbd[V]], [માત્ર વેલ્યુઝ (Values) પેસ્ટ કરવી (ફોર્મ્યુલા હટાવીને)],
      [#kbd[Alt + =]], [તરત જ ઓટો-સમ (`SUM` ફોર્મ્યુલા) લગાવવો],
      [#kbd[F4]], [સેલ રેફરન્સ લોક કરવો (`\$A\$1` to `A1`)],
      [#kbd[Ctrl + 1]], [ફોર્મેટ સેલ્સ ડાયલોગ બોક્સ ખોલવું],
      [#kbd[Alt + H + O + I]], [કોલમ પહોળાઈ ઓટો-ફિટ કરવી],
      [#kbd[Ctrl + એરો કીઝ]], [ડેટા ટેબલના અંતિમ છેડે ઝડપથી પહોંચવું],
      [#kbd[Ctrl + Shift + એરો]], [સમગ્ર ટેબલ ડેટા એકસાથે સિલેક્ટ કરવો],
      [#kbd[Ctrl + D] / #kbd[Ctrl + R]], [ઉપરનો ફોર્મ્યુલા નીચે / ડાબેથી જમણે ભરવો],
      [#kbd[Ctrl + E]], [ફ્લેશ ફિલ (Flash Fill) પેટર્ન લાગુ કરવી],
      [#kbd[Ctrl + ~]], [શીટના તમામ સેલ્સમાં ફોર્મ્યુલા દર્શાવવા/છુપાવવા],
      [#kbd[Ctrl + ;] / #kbd[Ctrl + Shift + :]], [આજની તારીખ / વર્તમાન સમય ઉમેરવો],
      [#kbd[Shift + Space]], [સમગ્ર રો (Row) પસંદ કરવી],
      [#kbd[Ctrl + Space]], [સમગ્ર કોલમ (Column) પસંદ કરવી],
      [#kbd[Ctrl + -] / #kbd[Ctrl + Shift + +]], [રો/કોલમ ડિલીટ કરવી / નવી ઉમેરવી],
    )
  ],
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.65pt + dark-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 2.8pt,

      text(size: 6.6pt, weight: "bold", fill: white)[શોર્ટકટ],
      text(size: 6.6pt, weight: "bold", fill: white)[શું કાર્ય કરે છે?],

      [#kbd[Alt + A + C]], [લાગુ કરેલા તમામ ડેટા ફિલ્ટર્સ દૂર કરવા],
      [#kbd[Alt + H + V + E]], [ટ્રાન્સપોઝ પેસ્ટ (રો ને કોલમમાં ફેરવવી)],
      [#kbd[F2]], [સેલને સીધા એડિટ મોડમાં ખોલવો],
      [#kbd[Alt + Enter]], [સેલની અંદર નવી લાઇન શરૂ કરવી],
      [#kbd[Ctrl + F1]], [રિબન મેનૂ છુપાવવું કે દર્શાવવું],
      [#kbd[Ctrl + PageDown / Up]], [વર્કબુકની શીટ્સ વચ્ચે આગળ-પાછળ જવું],
      [#kbd[Ctrl + K]], [હાઇપરલિંક ઉમેરવી],
      [#kbd[Ctrl + Shift + L]], [ઓટો-ફિલ્ટર ડ્રોપડાઉન એરો ઓન/ઓફ કરવું],
      [#kbd[F12]], [Save As વિન્ડો સીધી ખોલવી],
      [#kbd[Ctrl + W] / #kbd[Ctrl + N]], [ફાઇલ બંધ કરવી / નવી વર્કબુક ખોલવી],
      [#kbd[Alt + N + V]], [ડેટામાંથી નવી પિવટ ટેબલ બનાવવી],
      [#kbd[Ctrl + 5]], [ટેક્સ્ટ પર સ્ટ્રાઇકથ્રૂ (ચેકો) લગાવવો],
      [#kbd[Shift + F2]], [સેલમાં નવી નોટ કે કમેન્ટ ઉમેરવી],
      [#kbd[Alt + H + M + C]], [સેલ્સને મર્જ અને સેન્ટર કરવા],
      [#kbd[Ctrl + Shift + \$]], [કરન્સી (નાણાકીય) ફોર્મેટ લાગુ કરવું],
    )
  ]
)

#section-banner(num: "POINT 02", title: "પાવર ક્વેરી (ETL): સ્વચાલિત 6-તબક્કાની કોર્પોરેટ ડેટા રીશેપિંગ પાઇપલાઇન", color: rtech-blue)

#table(
  columns: (0.7fr, 1.4fr, 2.5fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[તબક્કો],
  text(size: 6.8pt, weight: "bold", fill: white)[પાઇપલાઇન એક્શન],
  text(size: 6.8pt, weight: "bold", fill: white)[બેકગ્રાઉન્ડમાં શું થાય છે?],
  text(size: 6.8pt, weight: "bold", fill: white)[વ્યવસાયિક લાભ],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[01]]],
  [#text(weight: "bold", fill: rtech-blue)[ડેટા લિંક કરો]],
  [CSV, એક્સેલ ફોલ્ડર, SQL ડેટાબેઝ કે SAP એક્સપોર્ટ સાથે #text(weight: "bold")[Data $->$ Get Data] દ્વારા જોડો.],
  [જુદી જુદી ફાઇલોને 1 સ્થળે જોડે છે.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[02]]],
  [#text(weight: "bold", fill: rtech-blue)[હેડર પ્રમોટ અને ફિલ્ટર]],
  [પ્રથમ રો ને હેડર બનાવો; ખાલી રો અને સમરી રો ને 1 ક્લિકમાં ફિલ્ટર કરી દૂર કરો.],
  [મેન્યુઅલ ફાઇલ ક્લિનિંગ હંમેશ માટે બંધ.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[03]]],
  [#text(weight: "bold", fill: rtech-emerald)[#hl-y[Unpivot Columns]]],
  [ID કોલમ પસંદ કરી #text(weight: "bold")[Unpivot Other Columns] કરો. પહોળી મંથલી ટેબલને 2 કોલમ ડેટાબેઝમાં બદલે છે.],
  [#hl-g[પાવર ક્વેરીનું #1 કૌશલ્ય]। ઉત્કૃષ્ટ પિવટ ટેબલ બનાવવા સક્ષમ બનાવે છે.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[04]]],
  [#text(weight: "bold", fill: rtech-blue)[વિભાજિત અને ટ્રાન્સફોર્મ]],
  [ટેક્સ્ટ અલગ કરો, વધારાની સ્પેસ ટ્રિમ કરો અને ચોક્કસ ડેટા ટાઇપ (Date, Number, Text) નક્કી કરો.],
  [ફોર્મ્યુલામાં ક્યારેય `#VALUE!` એરર આવતી નથી.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[05]]],
  [#text(weight: "bold", fill: rtech-ppt)[ક્વેરીઝ મર્જ કરો]],
  [Customer ID આધારે સેલ્સ ટેબલ અને કસ્ટમર માસ્ટરનું લેફ્ટ આઉટર જોઇન કરો.],
  [લાખો પંક્તિઓ માટે VLOOKUP નો શ્રેષ્ઠ વિકલ્પ.],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[06]]],
  [#text(weight: "bold", fill: rtech-excel)[ક્લોઝ અને લોડ]],
  [સ્વચ્છ ડેટાને એક્સેલ ટેબલ કે સીધા #text(weight: "bold")[PowerPivot ડેટા મોડેલ] માં લોડ કરો.],
  [#hl-y[આવતા મહિને ફક્ત 'Refresh All' દબાવો]—સમગ્ર રિપોર્ટ 5 સેકન્ડમાં અપડેટ!],
)

#pagebreak()

// =============================================================================
// PAGE 05: POWERPOINT 365: SLIDE MASTER, MORPH & SHORTCUTS (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[પાવરપોઇન્ટ 365: એક્ઝિક્યુટિવ ડેક સ્ટાન્ડર્ડ્સ, સ્લાઇડ માસ્ટર અને મોર્ફ]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[સ્લાઇડ માસ્ટર કોર્પોરેટ લોકિંગ (16:9) · મોર્ફ દ્વારા સરળ એપ એનિમેશન (`!!`) · ટોચની 16 પ્રેઝન્ટર કીઝ]
]

#section-banner(num: "POINT 01", title: "કંપની બ્રાન્ડિંગ લોક (ટીમ દ્વારા સ્લાઇડ લેઆઉટ બગડતું અટકાવો)", color: rtech-ppt)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ઘટક],
  text(size: 6.8pt, weight: "bold", fill: white)[કોન્ફિગરેશનની સાચી પદ્ધતિ],
  text(size: 6.8pt, weight: "bold", fill: white)[વ્યવસાયિક લાભ],

  [#text(weight: "bold", fill: rtech-ppt)[1. Slide Master Access]],
  [#text(weight: "bold")[View $->$ Slide Master] માં જાઓ. સૌથી ઉપરની મુખ્ય સ્લાઇડ પર કંપની લોગો, ફોન્ટ અને કલર સ્કીમ સેટ કરો.],
  [લોગો અને બેકગ્રાઉન્ડ હંમેશ માટે લોક થાય છે, પ્રેઝન્ટર ભૂલથી પણ તેને ખસેડી કે ડિલીટ કરી શકતો નથી.],

  [#text(weight: "bold", fill: rtech-blue)[2. કસ્ટમ પ્લેસહોલ્ડર્સ]],
  [#kbd[Insert Placeholder] $->$ ટેક્સ્ટ, પિક્ચર, ચાર્ટ કે ટેબલ બોક્સ ઉમેરો. યોગ્ય પેડિંગ અને કદ અગાઉથી નક્કી રાખો.],
  [ટીમના સભ્યો સીધા #hl-y['Click to add picture'] કરશે—લેઆઉટ ક્યારેય આડુંઅવળું નહીં થાય.],

  [#text(weight: "bold", fill: rtech-emerald)[3. એસ્પેક્ટ રેશિયો (16:9)]],
  [હંમેશા #text(weight: "bold")[Widescreen 16:9] (#kbd[Design $->$ Slide Size $->$ Widescreen]) વાપરો. જૂનું 4:3 ન પસંદ કરો.],
  [આધુનિક LED ટીવી, લેપટોપ અને પ્રોજેક્ટર પર બંને બાજુ કાળી પટ્ટીઓ આવતી નથી.],
)

#v(1.5pt)
// Authentic Visual Snapshot: PowerPoint Slide Master & Morph
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/powerpoint_slide_master_morph.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "પ્રેઝન્ટર્સ અને ડિઝાઇનર્સ માટે ટોચના 16 ડેક શોર્ટકટ્સ ચીટ શીટ", color: rtech-ppt)

#table(
  columns: (1.1fr, 1.4fr, 1.1fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.6pt,

  text(size: 6.6pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.6pt, weight: "bold", fill: white)[કાર્ય],
  text(size: 6.6pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.6pt, weight: "bold", fill: white)[કાર્ય],

  [#kbd[Ctrl + D]], [ઓબ્જેક્ટ કે સ્લાઇડ ડુપ્લિકેટ કરવી],
  [#kbd[Shift + Drag]], [સંપૂર્ણ સીધું વર્તુળ, ચોરસ કે લાઇન દોરવી],
  [#kbd[Ctrl + Shift + G]], [ગ્રૂપ કરેલા આકારોને અનગ્રૂપ કરવા],
  [#kbd[Ctrl + G]], [પસંદ કરેલા આકારોનું ગ્રૂપ બનાવવું],
  [#kbd[F5]], [શરૂઆતથી પૂર્ણ સ્ક્રીન સ્લાઇડ શો શરૂ કરવો],
  [#kbd[Shift + F5]], [વર્તમાન સ્લાઇડ પરથી શો શરૂ કરવો],
  [#kbd[B] (શો માં)], [સ્ક્રીનને સંપૂર્ણ બ્લેક કરવી (સ્પીકર પર ધ્યાન દોરવા)],
  [#kbd[W] (શો માં)], [સ્ક્રીનને સંપૂર્ણ વ્હાઇટ કરવી],
  [#kbd[Ctrl + L] (શો માં)], [માઉસને લાઇવ લેસર પોઇન્ટર બનાવવું],
  [#kbd[Ctrl + P] (શો માં)], [સ્લાઇડ પર પેનથી લખવા પેન ટૂલ ઓન],
  [#kbd[Ctrl + E] (શો માં)], [પેનથી લખેલા નિશાનો ભૂંસવા],
  [#kbd[Alt + F10]], [Selection Pane ખોલવું (લેયર્સ જોવા)],
  [#kbd[Ctrl + Shift + C/V]], [આકારની સ્ટાઇલ કોપી કરી બીજા પર લગાવવી],
  [#kbd[Alt + Shift + Left/Right]], [બુલેટ પોઇન્ટ્સનું લેવલ ઘટાડવું કે વધારવું],
  [#kbd[Ctrl + Up / Down]], [સ્લાઇડને ઉપર કે નીચે ખસેડવી],
  [#kbd[Esc]], [સ્લાઇડ શો તરત જ બંધ કરી એડિટરમાં પરત ફરવું],
)

#pagebreak()

// =============================================================================
// PAGE 06: OUTLOOK ENTERPRISE SETUP & INBOX ZERO (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[આઉટલુક 365: કોર્પોરેટ એકાઉન્ટ સેટઅપ, 4D ઇનબોક્સ ઝીરો અને શેડ્યુલિંગ]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[એક્સચેન્જ સર્વર વિરુદ્ધ IMAP · 4D ઇમેઇલ ટ્રાયજ સિસ્ટમ · ઓટોમેટિક રૂલ્સ અને ક્વિક સ્ટેપ્સ · 15 હોટકીઝ]
]

#section-banner(num: "POINT 01", title: "કોર્પોરેટ એકાઉન્ટ રૂપરેખાંકન: એક્સચેન્જ સર્વર વિરુદ્ધ IMAP/POP3", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[પ્રોટોકોલ / ફીચર],
  text(size: 6.8pt, weight: "bold", fill: white)[કાર્યપદ્ધતિ અને સેટઅપ],
  text(size: 6.8pt, weight: "bold", fill: white)[કોર્પોરેટ ભલામણ],

  [#text(weight: "bold", fill: rtech-outlook)[1. Microsoft Exchange / M365]],
  [તમામ ડિવાઇસ પર #hl-y[ઇમેઇલ, કેલેન્ડર, કોન્ટેક્ટ્સ અને ટાસ્ક] નું ActiveSync દ્વારા બંને બાજુ સંપૂર્ણ સિંક્રોનાઇઝેશન.],
  [#hl-g[કોર્પોરેટ ગોલ્ડ સ્ટાન્ડર્ડ]। ટીમ શેડ્યુલિંગ, શેર્ડ મેઇલબોક્સ અને સર્વર રૂલ્સ સક્ષમ કરે છે.],

  [#text(weight: "bold", fill: rtech-blue)[2. IMAP (ઇન્ટરનેટ મેસેજ)]],
  [ઇમેઇલ ફોલ્ડર્સ સિંક થાય છે, પરંતુ #text(weight: "bold")[કેલેન્ડર અને કોન્ટેક્ટ્સ માત્ર લોકલ કમ્પ્યુટર પર રહે છે] (`.ost` ફાઇલ).],
  [વ્યક્તિગત Gmail/Yahoo માટે યોગ્ય; ટીમ સંકલન માટે મર્યાદિત.],

  [#text(weight: "bold", fill: rtech-muted)[3. POP3 (જૂની આર્કિટેક્ચર)]],
  [ઇમેઇલને એક કમ્પ્યુટર પર ડાઉનલોડ કરી સર્વર પરથી ડિલીટ કરે છે. ફોન કે વેબ પર કોઈ સિંક થતું નથી.],
  [#hl-o[આધુનિક ઓફિસમાં ન વાપરવું]। ડેટા નુકસાનનું મોટું જોખમ.],
)

#section-banner(num: "POINT 02", title: "ઇમેઇલ વ્યવસ્થાપનનો 4D કોર્પોરેટ ફોર્મ્યુલા (Inbox Zero)", color: rtech-outlook)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rtech-blue)[1. DO IT (< 2 MINS)]\
      #v(1.5pt)
      જો કોઈ ઇમેઇલનો ઉત્તર 2 મિનિટથી ઓછા સમયમાં આપી શકાય, તો #hl-y[તેને તુરંત પૂર્ણ કરો].
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rtech-excel)[2. DELEGATE]\
      #v(1.5pt)
      સંબંધિત જવાબદાર વ્યક્તિને ડેડલાઇન સાથે ફોરવર્ડ કરો અને પોતાને #kbd[\@WaitingFor] માં મૂકો.
    ]
  ],
  [
    #block(fill: rgb("#FEF3C7"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#B45309"))[3. DEFER (CALENDAR)]\
      #v(1.5pt)
      જો 15 મિનિટથી વધુ સમયનું કાર્ય હોય, તો ઇમેઇલને #kbd[Calendar] પર ડ્રેગ કરી ટાઇમ-સ્લોટ બુક કરો.
    ]
  ],
  [
    #block(fill: rgb("#FFE4E6"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#E11D48"))[4. DELETE / ARCHIVE]\
      #v(1.5pt)
      માહિતી મેઇલ, ન્યૂઝલેટર. #kbd[Backspace] દબાવી આર્કાઇવ કરો. ઇનબોક્સને શૂન્ય રાખો.
    ]
  ],
)

#section-banner(num: "POINT 03", title: "ક્વિક સ્ટેપ્સ, ઓટો રૂલ્સ અને આઉટલુક કીબોર્ડ ગતિવર્ધક", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[આઉટલુક ફીચર],
  text(size: 6.8pt, weight: "bold", fill: white)[કેવી રીતે સેટ કરવું?],
  text(size: 6.8pt, weight: "bold", fill: white)[ઉચ્ચ ઉપયોગિતા શોર્ટકટ],

  [#text(weight: "bold", fill: rtech-outlook)[1. Quick Steps]],
  [Home $->$ Quick Steps $->$ New. એક ક્લિકમાં: વંચાયેલ માર્ક કરવું + ફોલ્ડરમાં મૂકવું + ફ્લેગ લગાવવો.],
  [રોજિંદા આવતા મેઇલ્સ ક્લિયર કરવા માટે શોર્ટકટ #kbd[Ctrl + Shift + 1] વાપરો.],

  [#text(weight: "bold", fill: rtech-blue)[2. ઓટોમેટિક રૂલ્સ]],
  [Home $->$ Rules $->$ Create Rule. સર્વર એલર્ટ કે બેંક એલર્ટ સીધા અલગ ફોલ્ડરમાં ચાલ્યા જાય.],
  [ઇનબોક્સને માત્ર મહત્વપૂર્ણ માનવીય સંવાદ માટે ખાલી રાખે છે.],

  [#text(weight: "bold", fill: rtech-emerald)[3. Scheduling Assistant]],
  [New Meeting $->$ Scheduling Assistant. ટીમના તમામ સભ્યોનો મુક્ત અને વ્યસ્ત સમય એકસાથે જુઓ.],
  [વારંવાર "તમે ક્યારે ફ્રી છો?" પૂછતા ઇમેઇલ્સ હંમેશ માટે બંધ.],

  [#text(weight: "bold", fill: rtech-navy)[4. ટોચની આઉટલુક કીઝ]],
  [#kbd[Ctrl+Shift+M] (નવો ઇમેઇલ) · #kbd[Ctrl+N] (નવી આઇટમ) · #kbd[Ctrl+R] (રિપ્લાય) · #kbd[Ctrl+Shift+R] (રિપ્લાય ઓલ)],
  [#kbd[Ctrl+1] (મેઇલ) · #kbd[Ctrl+2] (કેલેન્ડર) · #kbd[Ctrl+3] (કોન્ટેક્ટ્સ) · #kbd[Backspace] (1-ટચ આર્કાઇવ)],
)

#pagebreak()

// =============================================================================
// PAGE 07: MICROSOFT 365 CLOUD, ONEDRIVE & WORKPLACE ETHICS (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[માઇક્રોસોફ્ટ 365: ક્લાઉડ ટીમવર્ક, વનડ્રાઇવ ગવર્નન્સ અને કાર્ય નૈતિકતા]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[OneDrive રિયલ-ટાઇમ કો-ઓથરિંગ · 1TB ક્લાઉડ સ્ટોરેજ · ફાઇલ વર્ઝન રોલબેક · એન્ટરપ્રાઇઝ ડેટા એથિક્સ]
]

#section-banner(num: "POINT 01", title: "માઇક્રોસોફ્ટ 365 ઓનલાઇન અને ક્લાઉડના વ્યવસાયિક લાભો", color: rtech-blue)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ક્લાઉડ ક્ષમતા],
  text(size: 6.8pt, weight: "bold", fill: white)[Microsoft 365 માં કેવી રીતે કાર્ય કરે છે?],
  text(size: 6.8pt, weight: "bold", fill: white)[સુરક્ષા અને બેસ્ટ પ્રેક્ટિસ],

  [#text(weight: "bold", fill: rtech-blue)[1. Real-Time Co-Authoring]],
  [ટીમના અનેક સભ્યો એક જ એક્સેલ કે વર્ડ ફાઇલ પર એકસાથે કાર્ય કરે છે. સ્ક્રીન પર અલગ રંગના જીવંત કર્સર્સ દેખાય છે.],
  [ઇમેઇલમાં `Report_Final_v2_Approved.xlsx` જેવી ડઝનબંધ ડુપ્લિકેટ ફાઇલોની માથાકૂટમાંથી કાયમી મુક્તિ!],

  [#text(weight: "bold", fill: rtech-emerald)[2. Continuous AutoSave]],
  [ઉપર ડાબી બાજુ ઓટો-સેવ ટોગલ દરેક ફેરફારને ક્લાઉડમાં રિયલ-ટાઇમ સેવ કરતું રહે છે.],
  [કમ્પ્યુટર બંધ થવા, ક્રેશ થવા કે પાવર જવા પર ડેટા ક્યારેય નષ્ટ થતો નથી.],

  [#text(weight: "bold", fill: rtech-ppt)[3. ગમે ત્યાં બ્રાઉઝરથી એક્સેસ]],
  [વેબ બ્રાઉઝર (#link("https://office.com")[*office.com*]) થી કોઈપણ મેક, આઇપેડ, લિનક્સ કે ફોન પરથી ફાઇલો ખોલી એડિટ કરો.],
  [મુસાફરી કે વર્ક-ફ્રોમ-હોમ દરમિયાન તત્કાલ કાર્ય કરવાની સ્વતંત્રતા.],

  [#text(weight: "bold", fill: rtech-word)[4. વેબ વિરુદ્ધ ડેસ્કટોપ]],
  [એક્સેલ ઓનલાઇનમાં બેઝિક ફોર્મ્યુલા, કો-ઓથરિંગ અને ઓફિસ સ્ક્રિપ્ટ્સ ચાલે છે. ડેસ્કટોપમાં ભારે મેક્રોઝ અને પાવરપિવટ.],
  [ટીમવર્ક માટે ઓનલાઇન ચલાવો; ઊંડાણપૂર્વકના ડેટા એનાલિસિસ માટે ડેસ્કટોપ એક્સેલ ખોલો.],
)

#v(1.5pt)
// Authentic Visual Snapshot: Cloud Ecosystem & 4D Triage
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/outlook_cloud_workflow_visual.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "કાર્યસ્થળ સહયોગ નૈતિકતા અને કોર્પોરેટ ડેટા ગવર્નન્સ", color: rtech-emerald)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[નૈતિક ધોરણ],
  text(size: 6.8pt, weight: "bold", fill: white)[વ્યવસાયિક અભ્યાસ નિયમ],
  text(size: 6.8pt, weight: "bold", fill: white)[સામાન્ય ભૂલો જેનાથી બચવું],

  [#text(weight: "bold", fill: rtech-navy)[1. પ્રમાણિત ફાઇલ નામકરણ]],
  [ISO માળખું અપનાવો: `YYYY-MM-DD_Client_Project_v1.0.xlsx`। મોટા ફેરફાર પર વર્ઝન નંબર વધારો.],
  [`Final.xlsx`, `Final2.xlsx` કે `test.xlsx` ક્યારેય ન રાખવું. ઓડિટ ટ્રેઇલ નષ્ટ થાય છે.],

  [#text(weight: "bold", fill: rtech-emerald)[2. ડેટા ગોપનીયતા]],
  [કંપનીના નાણાકીય ડેટા કે સેલરી શીટને ક્યારેય પબ્લિક 'Anyone with link' થી શેર ન કરવી.],
  [પબ્લિક ઇન્ડેક્સિંગથી ડેટા બ્રીચ અને કાનૂની દંડનું જોખમ ઊભું થાય છે.],

  [#text(weight: "bold", fill: rtech-blue)[3. વ્યવસાયિક ઇમેઇલ શિષ્ટાચાર]],
  [સ્પષ્ટ વિષય લખો (`Action Req: Q3 Budget Review by 5 PM`). 'Reply All' માત્ર જરૂરી હોય ત્યારે જ કરવું.],
  [ગુસ્સામાં મેઇલ ન લખવો; ઓલ કેપ્સ (ચીસ પાડવી) ન લખવું; બલ્ક ઇમેઇલમાં હંમેશા BCC નો આદર કરવો.],
)

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB & MNC INTERVIEW VAULT (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[RTECHLAB લેખક મેન્ટરશિપ હબ અને MNC ઇન્ટરવ્યુ વોલ્ટ]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[સત્તાવાર લેખક પ્રોફાઇલ · ડાયરેક્ટ પોર્ટફોલિયો અને સોશિયલ હબ · ટોચના 5 MNC MIS પ્રશ્નો અને જવાબો]
]

#section-banner(num: "POINT 01", title: "લેખક પરિચય: રાહુલ પટેલ — સંસ્થાપક અને સિનિયર ટેકનિકલ એક્સપર્ટ", color: rtech-navy)

#block(
  width: 100%,
  stroke: 0.65pt + dark-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: 5pt,
  [
    #grid(
      columns: (56pt, 1fr),
      gutter: 7pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-blue,
          radius: 5pt,
          clip: true,
          width: 50pt,
          height: 60pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 9.5pt, weight: "black", fill: rtech-navy)[રાહુલ પટેલ (Rahul Patel)]\
        #v(0.5pt)
        #text(size: 6.8pt, weight: "bold", fill: rtech-blue)[સંસ્થાપક અને મુખ્ય સિસ્ટમ્સ આર્કિટેક્ટ · RTechLab Publications]\
        #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[ડિરેક્ટર અને સિનિયર ટેકનિકલ એક્સપર્ટ · IANT COMPUTER EDUCATION, PALANPUR]\
        #v(1.5pt)
        #text(size: 6.5pt, fill: rtech-navy)[
          *10 થી વધુ વર્ષોના ઊંડાણપૂર્વકના ટેકનિકલ અને શિક્ષણ અનુભવ* સાથે, રાહુલે ગુજરાત અને સમગ્ર ભારતમાં *3,000 થી વધુ વિદ્યાર્થીઓ* ને કોમ્પ્યુટર નેટવર્કિંગ, સિસ્કો CCNA, ક્લાઉડ ઇન્ફ્રાસ્ટ્રક્ચર અને કોર્પોરેટ MIS સિસ્ટમ્સમાં તાલીમ આપી છે. તેમણે ₹22 ડેસ્ક રેફરન્સ શ્રેણીની શરૂઆત એટલા માટે કરી જેથી દરેક મહત્વાકાંક્ષી વિદ્યાર્થીને ઉચ્ચ સ્તરીય ટેકનિકલ જ્ઞાન અત્યંત પોસાય તેવા ભાવે ઉપલબ્ધ થઈ શકે.
        ]
      ]
    )
  ]
)

#section-banner(num: "POINT 02", title: "લેખક પોર્ટફોલિયો, યુટ્યુબ, ઇન્સ્ટાગ્રામ અને કોમ્યુનિટી સીધી લિંક્સ", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [
    #block(
      stroke: 0.65pt + dark-border,
      fill: rgb("#F0F9FF"),
      radius: 4pt,
      inset: 3.5pt,
      [
        #align(center)[
          #box(height: 48pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 48pt)]
          #v(1.5pt)
          #text(size: 6.6pt, weight: "black", fill: rtech-blue)[લેખક પોર્ટફોલિયો]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.65pt + dark-border,
      fill: rgb("#FFF1F2"),
      radius: 4pt,
      inset: 3.5pt,
      [
        #align(center)[
          #box(height: 48pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 48pt)]
          #v(1.5pt)
          #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[યુટ્યુબ ચેનલ]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.65pt + dark-border,
      fill: rgb("#FDF2F8"),
      radius: 4pt,
      inset: 3.5pt,
      [
        #align(center)[
          #box(height: 48pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 48pt)]
          #v(1.5pt)
          #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[ઇન્સ્ટાગ્રામ હબ]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.65pt + dark-border,
      fill: rgb("#F0FDF4"),
      radius: 4pt,
      inset: 3.5pt,
      [
        #align(center)[
          #box(height: 48pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 48pt)]
          #v(1.5pt)
          #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[વ્હોટ્સએપ કોમ્યુનિટી]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[ફ્રી કોમ્યુનિટી એક્સેસ ↗]]
        ]
      ]
    )
  ],
)

#section-banner(num: "POINT 03", title: "MNCs માં પૂછાતા ટોચના 5 MIS અને Office 365 પ્રશ્નો તથા મોડેલ જવાબો", color: rtech-excel)

#table(
  columns: (2.2fr, 3.8fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ટેકનિકલ ઇન્ટરવ્યુ પ્રશ્નો (Asked in Top MNCs)],
  text(size: 6.8pt, weight: "bold", fill: white)[સિનિયર એક્ઝિક્યુટિવ મોડેલ ઉત્તરો],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.1: XLOOKUP શા માટે VLOOKUP કરતાં બહેતર માનવામાં આવે છે?]],
  [XLOOKUP માં ડિફોલ્ટ ચોક્કસ મેળ (Exact Match) હોય છે, તે ડાબી બાજુ પણ શોધી શકે છે, `#N/A` આપમેળે હેન્ડલ કરે છે, એકસાથે અનેક કોલમ્સ લાવે છે અને નવી કોલમ ઉમેરવાથી ક્યારેય તૂટતો નથી.],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.2: પેજ બ્રેકને બદલે સેક્શન બ્રેક ક્યારે વાપરવો જોઈએ?]],
  [પેજ બ્રેક માત્ર લખાણને આગળના પેજ પર મોકલે છે. સેક્શન બ્રેક એક સ્વતંત્ર લેઆઉટ ઝોન બનાવે છે, જેથી પોર્ટ્રેટ વચ્ચે કોઈ એક પેજને લેન્ડસ્કેપ કરી શકાય અને હેડર/ફૂટર અલગ કરી શકાય.],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.3: પાવર ક્વેરીમાં 'Unpivot Columns' નું શું કાર્ય છે?]],
  [તે પહોળી મેટ્રિક્સ ટેબલ (મહિનાઓની કોલમો) ને પ્રમાણિત 2-કોલમ ડેટાબેઝ માળખા (Attribute અને Value) માં ફેરવે છે, જેથી ઉત્તમ પિવટ ટેબલ અને ડેટા મોડેલ બનાવી શકાય.],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.4: મોર્ફ ટ્રાન્ઝિશન સામાન્ય એનિમેશનથી કેવી રીતે અલગ છે?]],
  [સામાન્ય એનિમેશનમાં દરેક ઓબ્જેક્ટ પર અલગથી મોશન પાથ આપવો પડે છે. મોર્ફ બે સ્લાઇડ્સની સરખામણી કરી સમાન નામવાળા ઓબ્જેક્ટ્સનું કદ, રંગ અને સ્થાન આપમેળે સ્મૂધલી બદલી નાખે છે.],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.5: આઉટલુકમાં ઇનબોક્સ ઝીરોનો 4D નિયમ શું છે?]],
  [2 મિનિટથી ઓછું કાર્ય હોય તો તુરંત કરવું (Do); અન્યને સોંપવું (Delegate); પછીના સમય માટે કેલેન્ડર પર શિડ્યુલ કરવું (Defer); બાકી બધું ડિલીટ કે આર્કાઇવ કરવું (Delete) જેથી ઇનબોક્સ ખાલી રહે.],
)

#v(1.5pt)
#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 0.8pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 2.5pt),
    text(size: 6.6pt, weight: "bold", fill: rtech-blue)[
      🚀 શું તમે સંપૂર્ણ 113 પેજની વિસ્તૃત પુસ્તક અને 6 સાચી એક્સેલ પ્રેક્ટિસ ફાઇલ્સ (.xlsx) મેળવવા માંગો છો? ₹49 માસ્ટર બુક કે ₹149 કરિયર સ્યુટ પર અપગ્રેડ કરો: #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]
    ]
  )
]
