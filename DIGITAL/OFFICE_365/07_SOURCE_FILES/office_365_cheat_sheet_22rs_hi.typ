// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE PRODUCTIVITY DESK CHEAT SHEET (HINDI V4)
// Exactly 8 Pages · Printable Daily Desk Companion · Edition 1 (2027)
// Author: Rahul Patel (Founder & Systems Architect, RTechLab)
// =============================================================================

#set document(
  title: "Microsoft 365 Enterprise Desk Reference & Cheat Sheet (Hindi)",
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
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 व्यावसायिक डेली डेस्क रेफरेंस व चीट शीट]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#107C41"))[वर्ड · एक्सेल · पावरपॉइंट · आउटलुक · क्लाउड]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · राहुल पटेल]
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
            #text(fill: rgb("#0284C7"))[●] टेक्नोलॉजी व्यावहारिक रूप में · प्रिंट कर डेस्क पर रखें · निःशुल्क टूल्स: #link("https://rtechlab.com/hi/tools")[*rtechlab.com/hi/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.5pt),
            text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[पृष्ठ #p of 8]
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
  lang: "hi"
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
// PAGE 01: THE EXECUTIVE MASTER COVER PAGE & COMPREHENSIVE INDEX (HINDI)
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
        #text(size: 11pt, weight: "black", tracking: 1.5pt, fill: rtech-blue)[RTECHLAB वोकेशनल लर्निंग सिस्टम्स]\
        #text(size: 7pt, fill: rtech-muted)[प्रौद्योगिकी व्यावहारिक रूप में · गुजरात #1 वोकेशनल आर्किटेक्चर ट्रैक · एडिशन 1 (2027)]
      ]
    ]
  )
  #v(1.5pt)
  #line(length: 100%, stroke: 0.8pt + rgb("#CBD5E1"))
  #v(2.5pt)

  // Author & Credentials
  #text(size: 10pt, weight: "black", fill: rtech-navy)[लेखक: राहुल पटेल (संस्थापक एवं मुख्य सिस्टम्स आर्किटेक्ट)]\
  #text(size: 7.2pt, fill: rtech-muted)[
    डायरेक्टर एवं सीनियर टेक्निकल एक्सपर्ट, IANT कंप्यूटर एजुकेशन, पालनपुर · 10+ वर्ष IT उद्योग अनुभव · 3,000+ छात्र प्रशिक्षित
  ]

  #v(3pt)
  #line(length: 20%, stroke: 1.5pt + rtech-blue)
  #v(3pt)

  // Original Microsoft 365 Logo
  #image("02_BRAND_ASSETS/microsoft_365_official_logo.png", width: 52%)

  #v(2.5pt)
  #text(size: 18pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rtech-navy, tracking: 0.5pt)[
    माइक्रोसॉफ्ट 365 एंटरप्राइज
  ]
  #v(1pt)
  #text(size: 10.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rtech-blue)[
    व्यावसायिक कॉर्पोरेट डेली डेस्क रेफरेंस व अल्टीमेट चीट शीट
  ]
  #v(1pt)
  #text(size: 7.4pt, weight: "bold", fill: rtech-muted)[
    एडवांस्ड एक्सेल 365 (डायनामिक ऐरे व XLOOKUP) · वर्ड कॉर्पोरेट स्टाइलिंग · एग्जीक्यूटिव पावरपॉइंट · आउटलुक इनबॉक्स जीरो · क्लाउड टीमवर्क
  ]

  #v(3pt)

  // Bestseller Seal
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#0284C7"),
    radius: 12pt,
    inset: (x: 10pt, y: 2pt),
    text(size: 6.8pt, weight: "black", fill: rgb("#0369A1"))[
      ★ कॉर्पोरेट एग्जीक्यूटिव्स, MIS एनालिस्ट्स और कॉमर्स व IT छात्रों हेतु #1 दैनिक डेस्क गाइड ★
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
        #text(size: 7.6pt, weight: "black", fill: rtech-navy)[📑 आधिकारिक 8-पृष्ठीय डेस्क रेफरेंस व चीट शीट विषय-सूची (इंडेक्स)]
      ]
      #v(2pt)
      #table(
        columns: (0.7fr, 1.6fr, 3.7fr),
        stroke: 0.65pt + dark-border,
        fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F1F5F9") } else { white },
        align: (col, row) => if col == 0 { center } else { left + horizon },
        inset: 2.8pt,

        text(size: 6.8pt, weight: "bold", fill: white)[पृष्ठ संख्या],
        text(size: 6.8pt, weight: "bold", fill: white)[मॉड्यूल का नाम],
        text(size: 6.8pt, weight: "bold", fill: white)[मुख्य अवधारणाएं व विज़ुअल आर्टिफैक्ट्स],

        [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 1]]],
        [#text(weight: "bold", fill: rtech-blue)[एग्जीक्यूटिव कवर व ब्लूप्रिंट]],
        [ऑफिशियल M365 व RTechLab ब्रांडिंग, लेखक क्रेडेंशियल्स, पब्लिशिंग विज़न व सम्पूर्ण इंडेक्स।],

        [#box(fill: rtech-word, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 2]]],
        [#text(weight: "bold", fill: rtech-word)[MS वर्ड 365 आर्किटेक्चर]],
        [हेडिंग स्टाइल लिंकेज (1-3), सेक्शन ब्रेक बनाम पेज ब्रेक, #hl-y[डॉक्यूमेंट लेआउट विज़ुअल], मेल मर्ज व 16 कीज।],

        [#box(fill: rtech-excel, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 3]]],
        [#text(weight: "bold", fill: rtech-excel)[एक्सेल मॉडर्न फॉर्मूला इंजन]],
        [डायनामिक ऐरे (`#`), `XLOOKUP` (2-Way व रिवर्स), `FILTER`, `UNIQUE`, `LET`, #hl-g[एक्सेल डायनामिक ग्रिड विज़ुअल] व `SUMIFS`।],

        [#box(fill: rtech-excel, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 4]]],
        [#text(weight: "bold", fill: rtech-excel)[एक्सेल शॉर्टकट्स व पावर क्वेरी]],
        [शीर्ष 30 हाई-स्पीड MIS हॉटकीज + 6-चरणीय स्वचालित ETL डेटा रीशेपिंग पाइपलाइन (Unpivot, Merge, Load)।],

        [#box(fill: rtech-ppt, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 5]]],
        [#text(weight: "bold", fill: rtech-ppt)[पावरपॉइंट कॉर्पोरेट डेक]],
        [स्लाइड मास्टर ब्रांड लॉकिंग, 16:9 रेशियो, #hl-o[स्लाइड मास्टर व मॉर्फ विज़ुअल] (`!!Logo`), और 16 प्रेजेंटर कीज।],

        [#box(fill: rtech-outlook, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 6]]],
        [#text(weight: "bold", fill: rtech-outlook)[आउटलुक सेटअप व 4D नियम]],
        [कॉर्पोरेट अकाउंट कॉन्फ़िगरेशन, 4D इनबॉक्स जीरो प्रोटोकॉल (Do, Delegate, Defer, Delete), रूल्स व शेड्यूलिंग।],

        [#box(fill: rtech-blue, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 7]]],
        [#text(weight: "bold", fill: rtech-blue)[क्लाउड, वनड्राइव व कार्य नैतिकता]],
        [M365 ऑनलाइन लाभ, 1TB वनड्राइव सिंक, वर्जन रिस्टोर, #hl-b[क्लाउड गवर्नेंस विज़ुअल] व कार्यस्थल नैतिकता।],

        [#box(fill: rgb("#047857"), inset: 2pt, radius: 2pt)[#text(fill: white, weight: "bold")[P. 8]]],
        [#text(weight: "bold", fill: rgb("#047857"))[लेखक हब व MNC इंटरव्यू]],
        [राहुल पटेल प्रोफाइल, 4 स्कैनेबल QR हब (पोर्टफोलियो, यूट्यूब, इंस्टा, व्हाट्सएप) + शीर्ष 5 MNC MIS Q&A।],
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
        #text(size: 6pt, weight: "bold", fill: rtech-excel)[हॉटकीज व शॉर्टकट]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[35+]\
        #text(size: 6pt, weight: "bold", fill: rtech-blue)[डायनामिक फॉर्मूले]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[4 BLUETRINTS]\
        #text(size: 6pt, weight: "bold", fill: rtech-word)[विज़ुअल स्नैपशॉट्स]
      ]
    ],
    [
      #block(stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 3pt, inset: 3pt)[
        #text(size: 9pt, weight: "black", fill: rtech-navy)[100%]\
        #text(size: 6pt, weight: "bold", fill: rgb("#047857"))[MNC प्लेसमेंट रेडी]
      ]
    ]
  )
]

#pagebreak()

// =============================================================================
// PAGE 02: MICROSOFT WORD 365: LEGAL STYLES & SHORTCUTS (HINDI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[वर्ड 365: कॉर्पोरेट लीगल आर्किटेक्चर, सेक्शन ब्रेक्स व चीट शीट]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[त्रुटिहीन मल्टी-पेज फॉर्मेटिंग · लैंडस्केप पेज जोड़ना · 1 मिनट में 1000+ लेटर्स · शीर्ष 16 वर्ड कीज]
]

#section-banner(num: "POINT 01", title: "हेडिंग स्टाइल व नंबरिंग लिंकेज (नंबरिंग बिगड़ने का पक्का इलाज)", color: rtech-word)

#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[स्ट्रक्चरल घटक],
  text(size: 6.8pt, weight: "bold", fill: white)[कॉर्पोरेट डॉक्यूमेंट नियम],
  text(size: 6.8pt, weight: "bold", fill: white)[Word 365 में कैसे सेट करें?],

  [#text(weight: "bold", fill: rtech-word)[1. Heading 1, 2, 3 लिंकेज]],
  [नंबर कभी हाथ से टाइप न करें! मल्टीलेवल लिस्ट को सीधे हेडिंग स्टाइल से लिंक करें ताकि 100+ पेज में नंबरिंग न बिगड़े।],
  [#kbd[Multilevel List] $->$ #kbd[Define New Multilevel List] $->$ #kbd[More] $->$ #hl-y[Link level to style: Heading 1]। लेवल 2 व 3 के लिए दोहराएं।],

  [#text(weight: "bold", fill: rtech-blue)[2. ऑटोमैटिक इंडेक्स (TOC)]],
  [विषय-सूची (Table of Contents) बिना पेज नंबर टाइप किए 1-क्लिक में अपने-आप बनेगी।],
  [#text(weight: "bold")[References $->$ Table of Contents $->$ Automatic Table 1] चुनें। अपडेट करने के लिए #kbd[F9] दबाएं।],

  [#text(weight: "bold", fill: rtech-emerald)[3. नेविगेशन पेन कंट्रोल]],
  [100+ पेज के लंबे कॉन्ट्रैक्ट्स में सीधे चैप्टर्स को ड्रैग करके रीऑर्डर करना।],
  [#kbd[Ctrl + F] दबाकर #kbd[Headings] चुनें। सीधे हेडिंग को ऊपर-नीचे ड्रैग करके पूरे चैप्टर का स्थान बदलें!],
)

#v(1.5pt)
// Authentic Visual Snapshot: Word Document Architecture
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/word_document_layout_visual.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "माइक्रोसॉफ्ट वर्ड हेतु शीर्ष 16 दैनिक शॉर्टकट्स चीट शीट", color: rtech-word)

#table(
  columns: (1.1fr, 1.4fr, 1.1fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.6pt,

  text(size: 6.6pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.6pt, weight: "bold", fill: white)[कार्य],
  text(size: 6.6pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.6pt, weight: "bold", fill: white)[कार्य],

  [#kbd[Ctrl + Shift + C / V]], [फॉर्मेट पेंटर कॉपी / पेस्ट],
  [#kbd[Shift + F3]], [केस बदलना (छोटा $->$ पहला बड़ा $->$ सब बड़े)],
  [#kbd[Ctrl + Enter]], [साफ पेज ब्रेक जोड़ना],
  [#kbd[Alt + Shift + D]], [आज की तारीख डालना],
  [#kbd[Ctrl + F]], [नेविगेशन व सर्च पेन खोलना],
  [#kbd[Ctrl + H]], [फाइंड एंड रिप्लेस विंडो],
  [#kbd[Ctrl + K]], [हाइपरलिंक इंसर्ट करना],
  [#kbd[Ctrl + E] / #kbd[Ctrl + L]], [सेंटर अलाइन / लेफ्ट अलाइन],
  [#kbd[Ctrl + J]], [जस्टिफाई (दोनों तरफ बराबर मार्जिन)],
  [#kbd[Ctrl + Shift + > / <]], [फॉन्ट साइज बढ़ाना / घटाना],
  [#kbd[Ctrl + Space]], [मैन्युअल फॉर्मेटिंग हटाकर नॉर्मल करना],
  [#kbd[Ctrl + 1] / #kbd[Ctrl + 2]], [सिंगल लाइन स्पेस / डबल स्पेस],
  [#kbd[F7]], [स्पेलिंग व ग्रामर चेकर],
  [#kbd[Ctrl + Shift + E]], [ट्रैक चेंजेज (Track Changes) ऑन/ऑफ],
  [#kbd[Alt + Shift + Up / Down]], [पैराग्राफ या रो को ऊपर-नीचे ले जाना],
  [#kbd[Ctrl + Backspace / Del]], [पिछला / अगला पूरा शब्द मिटाना],
)

#pagebreak()

// =============================================================================
// PAGE 03: MODERN EXCEL 365: ADVANCE FORMULA CHEATSHEET (HINDI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[एक्सेल 365: अगली पीढ़ी के एडवांस्ड फॉर्मूले व डायनामिक कैलकुलेशंस]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[स्पिल रेंज (`#`) · टू-वे मैट्रिक्स लुकअप · LET से 5x तेज़ गणना · टेक्स्ट विभाजन व लॉजिक्स]
]

#section-banner(num: "POINT 01", title: "XLOOKUP मास्टरी (VLOOKUP, HLOOKUP व INDEX-MATCH का संपूर्ण विकल्प)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[फंक्शन व सिंटैक्स],
  text(size: 6.8pt, weight: "bold", fill: white)[कॉर्पोरेट परिदृश्य (Scenario)],
  text(size: 6.8pt, weight: "bold", fill: white)[प्रो-टिप / तकनीकी लाभ],

  [#text(weight: "bold", fill: rtech-excel)[1. `=XLOOKUP(...)`\ #text(size: 5.6pt)[(lookup, lkp_arr, ret_arr, [if_nf], [match], [search])]]],
  [बिना कॉलम नंबर गिने कर्मचारी आईडी से सैलरी खोजना:\
  #hl-g[`=XLOOKUP(F2, A2:A500, D2:D500, "Not Found")`]],
  [#hl-y[बाय-डिफ़ॉल्ट सटीक मिलान]। बाईं तरफ भी खोज सकता है; नया कॉलम इंसर्ट करने पर कभी नहीं टूटता।],

  [#text(weight: "bold", fill: rtech-excel)[2. Multi-Column Spill]],
  [एक ही फॉर्मूले से नाम, विभाग और CTC तीनों एक साथ निकालना:\
  #hl-g[`=XLOOKUP(F2, A2:A500, B2:D500)`]],
  [3 अलग-अलग VLOOKUP लगाने की जगह केवल 1 फॉर्मूला तीनों कॉलम में अपने-आप रिजल्ट फैला देता है!],

  [#text(weight: "bold", fill: rtech-blue)[3. Two-Way Matrix Lookup\ (2D ग्रिड खोज)]],
  [रो में प्रोडक्ट और कॉलम में रीजन के आधार पर मूल्य खोजना:\
  #hl-b[`=XLOOKUP(A10, A2:A6, XLOOKUP(B9, B1:F1, B2:F6))`]],
  [नेस्टेड XLOOKUP रो व कॉलम दोनों हेडर प्रोसेस करता है। पुराने `=INDEX(..., MATCH(), MATCH())` का विकल्प।],

  [#text(weight: "bold", fill: rtech-muted)[4. रिवर्स सर्च\ (`search_mode = -1`)]],
  [ग्राहक का सबसे अंतिम (Latest) इनवॉइस बिल खोजना:\
  #hl-g[`=XLOOKUP(G2, Cust_Col, Date_Col, , 0, -1)`]],
  [डेटा को बिना सॉर्ट किए नीचे से ऊपर खोजता है, जिससे सबसे ताज़ा लेनदेन तुरंत मिल जाता है।],
)

#v(1.5pt)
// Authentic Visual Snapshot: Excel Dynamic Array Grid & Formula Bar
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/excel_dynamic_array_grid.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "आधुनिक टेक्स्ट फंक्शन्स, मल्टी-कंडीशन एग्रीगेशन व LET इंजन", color: rtech-excel)

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[फंक्शन],
  text(size: 6.8pt, weight: "bold", fill: white)[फॉर्मूला उदाहरण],
  text(size: 6.8pt, weight: "bold", fill: white)[व्यावहारिक उपयोग],

  [#text(weight: "bold", fill: rtech-excel)[1. `TEXTSPLIT`]],
  [#hl-g[`=TEXTSPLIT(A2, ",", ";")`]],
  [कॉमा या सेमीकोलन से जुड़े शब्दों को एक साथ कई रो व कॉलम में विभाजित करता है।],

  [#text(weight: "bold", fill: rtech-excel)[2. `TEXTBEFORE` / `AFTER`]],
  [#hl-g[`=TEXTBEFORE(A2, "@")`] / #hl-b[`=TEXTAFTER(A2, "@")`]],
  [ईमेल आईडी से यूजरनेम (`rahul.patel`) व कंपनी डोमेन (`rtechlab.com`) अलग निकालना।],

  [#text(weight: "bold", fill: rtech-blue)[3. `FILTER` + `UNIQUE`]],
  [#hl-b[`=SORT(UNIQUE(FILTER(A2:A100, B2:B100="Completed")))`]],
  [डुप्लिकेट्स हटाकर केवल अनूठी लिस्ट को A से Z क्रम में 1 सेकंड में सॉर्ट करता है।],

  [#text(weight: "bold", fill: rtech-ppt)[4. `LET` (5x गति इंजन)]],
  [#hl-o[`=LET(rev, D2:D100, cost, E2:E100, m, (rev-cost)/rev, IF(m>0.2, "High", "Low"))`]],
  [#hl-y[गणना की गति 500% बढ़ाता है]। जटिल गणनाओं को वेरिएबल बनाकर सिर्फ एक बार प्रोसेस करता है।],

  [#text(weight: "bold", fill: rtech-excel)[5. `SUMIFS` / `COUNTIFS`]],
  [#hl-g[`=SUMIFS(Sales, Region, "West", Date, ">=2027-01-01")`]],
  [Sum_Range हमेशा #hl-y[सबसे पहले] आती है। ऑपरेटरों को कोट्स (`">=2027-01-01"`) में रखें।],
)

#pagebreak()

// =============================================================================
// PAGE 04: EXCEL SHORTCUTS & POWER QUERY (ETL) PIPELINE (HINDI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[एक्सेल 365: शीर्ष 30 कार्यस्थल शॉर्टकट्स व पावर क्वेरी (ETL) पाइपलाइन]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[अकाउंटेंट्स हेतु हाई-स्पीड हॉटकीज · स्वचालित 6-चरणीय ETL पाइपलाइन · शून्य-VBA ऑटोमेशन]
]

#section-banner(num: "POINT 01", title: "अकाउंटेंट्स व MIS हेतु शीर्ष 30 हाई-स्पीड कीबोर्ड शॉर्टकट्स", color: rtech-excel)

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

      text(size: 6.6pt, weight: "bold", fill: white)[शॉर्टकट],
      text(size: 6.6pt, weight: "bold", fill: white)[क्या कार्य करता है?],

      [#kbd[Ctrl + T]], [चुने गए डेटा को आधिकारिक टेबल में बदलना],
      [#kbd[Ctrl + Alt + V] $->$ #kbd[V]], [केवल मान (Values) पेस्ट करना (फॉर्मूला हटाकर)],
      [#kbd[Alt + =]], [तुरंत ऑटो-सम (`SUM` फॉर्मूला लगाना)],
      [#kbd[F4]], [सेल रेफरेंस लॉक करना (`\$A\$1` to `A1`)],
      [#kbd[Ctrl + 1]], [फॉर्मेट सेल्स डायलॉग बॉक्स खोलना],
      [#kbd[Alt + H + O + I]], [कॉलम चौड़ाई ऑटो-फिट करना],
      [#kbd[Ctrl + एरो कीज]], [डेटा टेबल के अंतिम छोर पर तुरंत कूदना],
      [#kbd[Ctrl + Shift + एरो]], [पूरे टेबल डेटा को एक साथ सेलेक्ट करना],
      [#kbd[Ctrl + D] / #kbd[Ctrl + R]], [ऊपर का फॉर्मूला नीचे / बाईं से दाईं ओर भरना],
      [#kbd[Ctrl + E]], [फ्लैश फिल (Flash Fill) पैटर्न लागू करना],
      [#kbd[Ctrl + ~]], [शीट के सभी सेलों में फॉर्मूले दिखाना/छिपाना],
      [#kbd[Ctrl + ;] / #kbd[Ctrl + Shift + :]], [आज की तारीख / वर्तमान समय डालना],
      [#kbd[Shift + Space]], [पूरी रो (Row) चुनना],
      [#kbd[Ctrl + Space]], [पूरा कॉलम (Column) चुनना],
      [#kbd[Ctrl + -] / #kbd[Ctrl + Shift + +]], [रो/कॉलम डिलीट करना / नई जोड़ना],
    )
  ],
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.65pt + dark-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 2.8pt,

      text(size: 6.6pt, weight: "bold", fill: white)[शॉर्टकट],
      text(size: 6.6pt, weight: "bold", fill: white)[क्या कार्य करता है?],

      [#kbd[Alt + A + C]], [लगाए गए सभी डेटा फिल्टर्स हटाना],
      [#kbd[Alt + H + V + E]], [ट्रांसपोज पेस्ट (रो को कॉलम में पलटना)],
      [#kbd[F2]], [सेल को सीधे एडिट मोड में खोलना],
      [#kbd[Alt + Enter]], [सेल के अंदर नई लाइन शुरू करना],
      [#kbd[Ctrl + F1]], [रिबन मेनू को छिपाना या दिखाना],
      [#kbd[Ctrl + PageDown / Up]], [वर्कबुक की शीट्स के बीच आगे-पीछे जाना],
      [#kbd[Ctrl + K]], [हाइपरलिंक इंसर्ट करना],
      [#kbd[Ctrl + Shift + L]], [ऑटो-फिल्टर ड्रॉपडाउन तीर ऑन/ऑफ करना],
      [#kbd[F12]], [Save As विंडो सीधे खोलना],
      [#kbd[Ctrl + W] / #kbd[Ctrl + N]], [फाइल बंद करना / नई वर्कबुक खोलना],
      [#kbd[Alt + N + V]], [डेटा से नई पिवट टेबल बनाना],
      [#kbd[Ctrl + 5]], [टेक्स्ट पर स्ट्राइकथ्रू (काटने की लाइन) लगाना],
      [#kbd[Shift + F2]], [सेल में नया नोट या कमेंट जोड़ना],
      [#kbd[Alt + H + M + C]], [सेलों को मर्ज व सेंटर करना],
      [#kbd[Ctrl + Shift + \$]], [करेंसी (मुद्रा) फॉर्मेट लागू करना],
    )
  ]
)

#section-banner(num: "POINT 02", title: "पावर क्वेरी (ETL): स्वचालित 6-चरणीय कॉर्पोरेट डेटा रीशेपिंग पाइपलाइन", color: rtech-blue)

#table(
  columns: (0.7fr, 1.4fr, 2.5fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[चरण],
  text(size: 6.8pt, weight: "bold", fill: white)[पाइपलाइन एक्शन],
  text(size: 6.8pt, weight: "bold", fill: white)[बैकग्राउंड में क्या होता है?],
  text(size: 6.8pt, weight: "bold", fill: white)[व्यावसायिक लाभ],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[01]]],
  [#text(weight: "bold", fill: rtech-blue)[डेटा प्राप्त करें]],
  [CSV, एक्सेल फोल्डर, SQL डेटाबेस या SAP एक्सपोर्ट से #text(weight: "bold")[Data $->$ Get Data] द्वारा लिंक करें।],
  [विभिन्न फाइलों को 1 जगह जोड़ता है।],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[02]]],
  [#text(weight: "bold", fill: rtech-blue)[हेडर प्रमोट व फिल्टर]],
  [पहली रो को हेडर बनाएं; खाली रो व समरी रो को 1 क्लिक में फिल्टर करके हटाएं।],
  [मैन्युअल फाइल क्लीनिंग हमेशा के लिए खत्म।],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[03]]],
  [#text(weight: "bold", fill: rtech-emerald)[#hl-y[Unpivot Columns]]],
  [ID कॉलम चुनकर #text(weight: "bold")[Unpivot Other Columns] करें। चौड़े मंथली टेबल को 2 कॉलम डेटाबेस में बदलता है।],
  [#hl-g[पावर क्वेरी का #1 कौशल]। बेहतरीन पिवट टेबल बनाने योग्य बनाता है।],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[04]]],
  [#text(weight: "bold", fill: rtech-blue)[विभाजित व ट्रांसफॉर्म]],
  [टेक्स्ट को अलग करें, खाली स्पेस ट्रिम करें और सख्त डेटा टाइप (Date, Number, Text) तय करें।],
  [फॉर्मूलों में `#VALUE!` एरर नहीं आता।],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[05]]],
  [#text(weight: "bold", fill: rtech-ppt)[क्वेरीज़ मर्ज करें]],
  [Customer ID के आधार पर सेल्स टेबल और कस्टमर मास्टर का लेफ्ट आउटर जॉइन करें।],
  [लाखों पंक्तियों के लिए VLOOKUP का ऑटो विकल्प।],

  [#box(fill: rtech-navy, inset: 2pt, radius: 2pt)[#text(fill: white, weight: "black")[06]]],
  [#text(weight: "bold", fill: rtech-excel)[क्लोज व लोड]],
  [साफ डेटा को एक्सेल टेबल या सीधे #text(weight: "bold")[PowerPivot डेटा मॉडल] में लोड करें।],
  [#hl-y[अगले महीने केवल 'Refresh All' दबाएं]—पूरी रिपोर्ट 5 सेकंड में अपडेट!],
)

#pagebreak()

// =============================================================================
// PAGE 05: POWERPOINT 365: SLIDE MASTER, MORPH & SHORTCUTS (HINDI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[पावरपॉइंट 365: एग्जीक्यूटिव डेक स्टैंडर्ड्स, स्लाइड मास्टर व मॉर्फ]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[स्लाइड मास्टर कॉर्पोरेट लॉकिंग (16:9) · मॉर्फ द्वारा स्मूथ ऐप एनिमेशन (`!!`) · शीर्ष 16 प्रेजेंटर कीज]
]

#section-banner(num: "POINT 01", title: "कंपनी ब्रांडिंग लॉक (टीम द्वारा स्लाइड लेआउट खराब होने से बचाएं)", color: rtech-ppt)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[घटक],
  text(size: 6.8pt, weight: "bold", fill: white)[कॉन्फ़िगरेशन का सही तरीका],
  text(size: 6.8pt, weight: "bold", fill: white)[व्यावसायिक लाभ],

  [#text(weight: "bold", fill: rtech-ppt)[1. Slide Master Access]],
  [#text(weight: "bold")[View $->$ Slide Master] में जाएं। सबसे ऊपर वाली मुख्य स्लाइड पर कंपनी लोगो, फॉन्ट और कलर स्कीम सेट करें।],
  [लोगो और बैकग्राउंड हमेशा के लिए लॉक हो जाते हैं, प्रेजेंटर गलती से भी उन्हें हिला या मिटा नहीं सकता।],

  [#text(weight: "bold", fill: rtech-blue)[2. कस्टम प्लेसहोल्डर्स]],
  [#kbd[Insert Placeholder] $->$ टेक्स्ट, पिक्चर, चार्ट या टेबल बॉक्स जोड़ें। सही पैडिंग और आकार पहले से सेट रखें।],
  [टीम के सदस्य सीधे #hl-y['Click to add picture'] करेंगे—लेआउट कभी टेढ़ा-मेढ़ा नहीं होगा।],

  [#text(weight: "bold", fill: rtech-emerald)[3. पहलू अनुपात (16:9)]],
  [हमेशा #text(weight: "bold")[Widescreen 16:9] (#kbd[Design $->$ Slide Size $->$ Widescreen]) का प्रयोग करें। पुराना 4:3 न चुनें।],
  [आधुनिक LED टीवी, लैपटॉप और प्रोजेक्टर पर दोनों तरफ काली पट्टियां नहीं आतीं।],
)

#v(1.5pt)
// Authentic Visual Snapshot: PowerPoint Slide Master & Morph
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/powerpoint_slide_master_morph.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "प्रेजेंटर्स व डिजाइनर्स हेतु शीर्ष 16 डेक शॉर्टकट्स चीट शीट", color: rtech-ppt)

#table(
  columns: (1.1fr, 1.4fr, 1.1fr, 1.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.6pt,

  text(size: 6.6pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.6pt, weight: "bold", fill: white)[कार्य],
  text(size: 6.6pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.6pt, weight: "bold", fill: white)[कार्य],

  [#kbd[Ctrl + D]], [ऑब्जेक्ट या स्लाइड डुप्लिकेट करना],
  [#kbd[Shift + Drag]], [एकदम सीधा गोला, चौकोर या लाइन खींचना],
  [#kbd[Ctrl + Shift + G]], [ग्रुप किए गए आकारों को अनग्रुप करना],
  [#kbd[Ctrl + G]], [चुने गए आकारों का ग्रुप बनाना],
  [#kbd[F5]], [शुरुआत से फुल स्क्रीन स्लाइड शो शुरू करना],
  [#kbd[Shift + F5]], [वर्तमान स्लाइड से शो शुरू करना],
  [#kbd[B] (शो में)], [स्क्रीन को पूरी तरह ब्लैक करना (स्पीकर पर ध्यान खींचने)],
  [#kbd[W] (शो में)], [स्क्रीन को पूरी तरह व्हाइट करना],
  [#kbd[Ctrl + L] (शो में)], [माउस को लाइव लेजर पॉइंटर बनाना],
  [#kbd[Ctrl + P] (शो में)], [स्लाइड पर पेन से लिखने हेतु पेन टूल ऑन],
  [#kbd[Ctrl + E] (शो में)], [पेन से लिखे गए निशानों को मिटाना],
  [#kbd[Alt + F10]], [Selection Pane खोलना (लेयर्स देखने हेतु)],
  [#kbd[Ctrl + Shift + C/V]], [आकार की स्टाइल कॉपी कर दूसरे पर लगाना],
  [#kbd[Alt + Shift + Left/Right]], [बुलेट पॉइंट्स का लेवल घटाना या बढ़ाना],
  [#kbd[Ctrl + Up / Down]], [स्लाइड को ऊपर या नीचे स्थानांतरित करना],
  [#kbd[Esc]], [स्लाइड शो तुरंत बंद कर एडिटर में लौटना],
)

#pagebreak()

// =============================================================================
// PAGE 06: OUTLOOK ENTERPRISE SETUP & INBOX ZERO (HINDI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[आउटलुक 365: कॉर्पोरेट अकाउंट सेटअप, 4D इनबॉक्स जीरो व शेड्यूलिंग]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[एक्सचेंज सर्वर बनाम IMAP · 4D ईमेल ट्राइएज सिस्टम · स्वचालित रूल्स व क्विक स्टेप्स · शीर्ष 15 हॉटकीज]
]

#section-banner(num: "POINT 01", title: "कॉर्पोरेट अकाउंट कॉन्फ़िगरेशन: एक्सचेंज सर्वर बनाम IMAP/POP3", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[प्रोटोकॉल / फीचर],
  text(size: 6.8pt, weight: "bold", fill: white)[कार्यप्रणाली व सेटअप],
  text(size: 6.8pt, weight: "bold", fill: white)[कॉर्पोरेट सिफारिश],

  [#text(weight: "bold", fill: rtech-outlook)[1. Microsoft Exchange / M365]],
  [सभी डिवाइसों पर #hl-y[ईमेल, कैलेंडर, कॉन्टैक्ट्स और टास्क] का ActiveSync द्वारा दोनों तरफ पूर्ण सिंक्रोनाइजेशन।],
  [#hl-g[कॉर्पोरेट गोल्ड स्टैंडर्ड]। टीम शेड्यूलिंग, शेयरर्ड मेलबॉक्स और सर्वर रूल्स सक्षम करता है।],

  [#text(weight: "bold", fill: rtech-blue)[2. IMAP (इंटरनेट मैसेज)]],
  [ईमेल फोल्डर्स सिंक होते हैं, लेकिन #text(weight: "bold")[कैलेंडर और कॉन्टैक्ट्स सिर्फ लोकल कंप्यूटर पर रहते हैं] (`.ost` फाइल)।],
  [व्यक्तिगत Gmail/Yahoo हेतु ठीक; टीम समन्वय हेतु सीमित।],

  [#text(weight: "bold", fill: rtech-muted)[3. POP3 (पुरातन तकनीक)]],
  [ईमेल को एक कंप्यूटर पर डाउनलोड कर सर्वर से मिटा देता है। फोन या वेब पर कोई सिंक नहीं होता।],
  [#hl-o[आधुनिक ऑफिस में न इस्तेमाल करें]। डेटा लॉस का बड़ा खतरा।],
)

#section-banner(num: "POINT 02", title: "ईमेल प्रबंधन का 4D कॉर्पोरेट फॉर्मूला (Inbox Zero)", color: rtech-outlook)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rtech-blue)[1. DO IT (< 2 MINS)]\
      #v(1.5pt)
      अगर किसी ईमेल का उत्तर 2 मिनट से कम में दिया जा सकता है, तो #hl-y[उसे तुरंत निपटाएं]।
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rtech-excel)[2. DELEGATE]\
      #v(1.5pt)
      संबंधित जिम्मेदार व्यक्ति को डेडलाइन के साथ फॉरवर्ड करें और खुद #kbd[\@WaitingFor] में डालें।
    ]
  ],
  [
    #block(fill: rgb("#FEF3C7"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#B45309"))[3. DEFER (CALENDAR)]\
      #v(1.5pt)
      अगर 15 मिनट से अधिक का काम है, तो ईमेल को #kbd[Calendar] पर ड्रैग करके टाइम-ब्लॉक बुक करें।
    ]
  ],
  [
    #block(fill: rgb("#FFE4E6"), stroke: 0.65pt + dark-border, radius: 4pt, inset: 4.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#E11D48"))[4. DELETE / ARCHIVE]\
      #v(1.5pt)
      सूचना वाले मेल, न्यूज़लेटर। #kbd[Backspace] दबाकर आर्काइव करें। इनबॉक्स को शून्य रखें।
    ]
  ],
)

#section-banner(num: "POINT 03", title: "क्विक स्टेप्स, ऑटो रूल्स व आउटलुक कीबोर्ड गतिवर्धक", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[आउटलुक फीचर],
  text(size: 6.8pt, weight: "bold", fill: white)[कैसे सेट करें?],
  text(size: 6.8pt, weight: "bold", fill: white)[उच्च-उपयोगिता शॉर्टकट],

  [#text(weight: "bold", fill: rtech-outlook)[1. Quick Steps]],
  [Home $->$ Quick Steps $->$ New। एक क्लिक में: पढ़ा हुआ मार्क करना + फोल्डर में डालना + फ्लैग लगाना।],
  [रोज़ाना आने वाले मेल को साफ़ करने हेतु शॉर्टकट #kbd[Ctrl + Shift + 1] लगाएं।],

  [#text(weight: "bold", fill: rtech-blue)[2. ऑटोमैटिक रूल्स]],
  [Home $->$ Rules $->$ Create Rule। सर्वर अलर्ट या बैंक अलर्ट सीधे अलग फोल्डर में चले जाएं।],
  [इनबॉक्स को सिर्फ मुख्य इंसानी बातचीत के लिए खाली रखता है।],

  [#text(weight: "bold", fill: rtech-emerald)[3. Scheduling Assistant]],
  [New Meeting $->$ Scheduling Assistant। टीम के सभी लोगों का खाली व व्यस्त समय एक साथ देखें।],
  [बार-बार "आप कब फ्री हैं?" पूछने वाले ईमेल हमेशा के लिए बंद।],

  [#text(weight: "bold", fill: rtech-navy)[4. शीर्ष आउटलुक कीज]],
  [#kbd[Ctrl+Shift+M] (नया ईमेल) · #kbd[Ctrl+N] (नया आइटम) · #kbd[Ctrl+R] (रिप्लाई) · #kbd[Ctrl+Shift+R] (रिप्लाई ऑल)],
  [#kbd[Ctrl+1] (मेल) · #kbd[Ctrl+2] (कैलेंडर) · #kbd[Ctrl+3] (कॉन्टैक्ट्स) · #kbd[Backspace] (1-टच आर्काइव)],
)

#pagebreak()

// =============================================================================
// PAGE 07: MICROSOFT 365 CLOUD, ONEDRIVE & WORKPLACE ETHICS (HINDI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[माइक्रोसॉफ्ट 365: क्लाउड टीमवर्क, वनड्राइव गवर्नेंस व कार्य नैतिकता]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[OneDrive रियल-टाइम को-ऑथरिंग · 1TB क्लाउड स्टोरेज · फाइल वर्जन रोलबैक · एंटरप्राइज डेटा एथिक्स]
]

#section-banner(num: "POINT 01", title: "माइक्रोसॉफ्ट 365 ऑनलाइन व क्लाउड के व्यावसायिक लाभ", color: rtech-blue)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[क्लाउड क्षमता],
  text(size: 6.8pt, weight: "bold", fill: white)[Microsoft 365 में कैसे काम करता है?],
  text(size: 6.8pt, weight: "bold", fill: white)[सुरक्षा व बेस्ट प्रैक्टिस],

  [#text(weight: "bold", fill: rtech-blue)[1. Real-Time Co-Authoring]],
  [टीम के कई सदस्य एक ही एक्सेल या वर्ड फाइल पर एक साथ काम करते हैं। स्क्रीन पर अलग-अलग रंगों के लाइव कर्सर दिखाई देते हैं।],
  [ईमेल में `Report_Final_v2_Approved.xlsx` जैसी दर्जनों डुप्लिकेट फाइलों के चक्कर से हमेशा की मुक्ति!],

  [#text(weight: "bold", fill: rtech-emerald)[2. Continuous AutoSave]],
  [ऊपर बाईं तरफ ऑटो-सेव टॉगल हर बदलाव को क्लाउड में रियल-टाइम सेव करता रहता है।],
  [कंप्यूटर बंद होने, क्रैश होने या बिजली जाने पर डेटा कभी नष्ट नहीं होता।],

  [#text(weight: "bold", fill: rtech-ppt)[3. कहीं भी ब्राउज़र से एक्सेस]],
  [वेब ब्राउज़र (#link("https://office.com")[*office.com*]) से किसी भी मैक, आईपैड, लिनक्स या फोन से फाइलें खोलकर एडिट करें।],
  [यात्रा या वर्क-फ्रॉम-होम के दौरान तत्काल काम करने की स्वतंत्रता।],

  [#text(weight: "bold", fill: rtech-word)[4. वेब बनाम डेस्कटॉप]],
  [एक्सेल ऑनलाइन में बेसिक फॉर्मूले, को-ऑथरिंग और ऑफिस स्क्रिप्ट्स (TypeScript) चलते हैं। डेस्कटॉप में भारी मैक्रोज़ और पावरपिवट।],
  [टीम वर्क के लिए ऑनलाइन चलाएं; भारी डेटा एनालिसिस के लिए डेस्कटॉप एक्सेल खोलें।],
)

#v(1.5pt)
// Authentic Visual Snapshot: Cloud Ecosystem & 4D Triage
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/outlook_cloud_workflow_visual.png", width: 98%)
  ]
]
#v(1.5pt)

#section-banner(num: "POINT 02", title: "कार्यस्थल सहयोग नैतिकता व कॉर्पोरेट डेटा गवर्नेंस", color: rtech-emerald)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[नैतिक मानक],
  text(size: 6.8pt, weight: "bold", fill: white)[व्यावसायिक अभ्यास नियम],
  text(size: 6.8pt, weight: "bold", fill: white)[सामान्य गलतियां जिनसे बचें],

  [#text(weight: "bold", fill: rtech-navy)[1. मानकीकृत फाइल नामकरण]],
  [ISO प्रारूप अपनाएं: `YYYY-MM-DD_Client_Project_v1.0.xlsx`। बड़े बदलाव पर वर्जन नंबर बढ़ाएं।],
  [`Final.xlsx`, `Final2.xlsx` या `test.xlsx` कभी न रखें। ऑडिट ट्रेल नष्ट होती है।],

  [#text(weight: "bold", fill: rtech-emerald)[2. डेटा गोपनीयता]],
  [कंपनी के वित्तीय डेटा या सैलरी शीट को कभी पब्लिक 'Anyone with link' से शेयर न करें।],
  [पब्लिक इंडेक्सिंग से डेटा ब्रीच और कानूनी पेनाल्टी का खतरा पैदा होता है।],

  [#text(weight: "bold", fill: rtech-blue)[3. व्यावसायिक ईमेल शिष्टाचार]],
  [स्पष्ट विषय लिखें (`Action Req: Q3 Budget Review by 5 PM`)। 'Reply All' केवल आवश्यक होने पर करें।],
  [गुस्से में मेल न लिखें; ऑल कैप्स (चीखना) न लिखें; बल्क ईमेल में हमेशा BCC का सम्मान करें।],
)

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB & MNC INTERVIEW VAULT (HINDI)
// =============================================================================

#align(center)[
  #text(size: 10.5pt, weight: "black", fill: rtech-navy)[RTECHLAB लेखक मेंटरशिप हब व MNC इंटरव्यू वॉल्ट]
  #v(1pt)
  #text(size: 6.8pt, fill: rtech-muted)[आधिकारिक लेखक प्रोफाइल · डायरेक्ट पोर्टफोलियो व सोशल हब · शीर्ष 5 MNC MIS प्रश्न व उत्तर]
]

#section-banner(num: "POINT 01", title: "लेखक परिचय: राहुल पटेल — संस्थापक एवं सीनियर टेक्निकल एक्सपर्ट", color: rtech-navy)

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
        #text(size: 9.5pt, weight: "black", fill: rtech-navy)[राहुल पटेल (Rahul Patel)]\
        #v(0.5pt)
        #text(size: 6.8pt, weight: "bold", fill: rtech-blue)[संस्थापक एवं मुख्य सिस्टम्स आर्किटेक्ट · RTechLab Publications]\
        #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[डायरेक्टर एवं सीनियर टेक्निकल एक्सपर्ट · IANT COMPUTER EDUCATION, PALANPUR]\
        #v(1.5pt)
        #text(size: 6.5pt, fill: rtech-navy)[
          *10 से अधिक वर्षों के गहन तकनीकी व शिक्षण अनुभव* के साथ, राहुल ने गुजरात और भारत भर में *3,000 से अधिक छात्रों* को कंप्यूटर नेटवर्किंग, सिस्को CCNA, क्लाउड इंफ्रास्ट्रक्चर और कॉर्पोरेट MIS सिस्टम्स में प्रशिक्षित किया है। उन्होंने ₹22 डेस्क रेफरेंस सीरीज़ की शुरुआत इसलिए की ताकि हर महत्वाकांक्षी छात्र को उच्च स्तरीय तकनीकी ज्ञान बेहद किफायती दाम पर उपलब्ध हो सके।
        ]
      ]
    )
  ]
)

#section-banner(num: "POINT 02", title: "लेखक पोर्टफोलियो, यूट्यूब, इंस्टाग्राम व कम्युनिटी डायरेक्ट लिंक्स", color: rtech-blue)

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
          #text(size: 6.6pt, weight: "black", fill: rtech-blue)[लेखक पोर्टफोलियो]\
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
          #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[यूट्यूब चैनल]\
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
          #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[इंस्टाग्राम हब]\
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
          #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[व्हाट्सएप कम्युनिटी]\
          #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[फ्री कम्युनिटी एक्सेस ↗]]
        ]
      ]
    )
  ],
)

#section-banner(num: "POINT 03", title: "MNCs में पूछे जाने वाले शीर्ष 5 MIS व Office 365 प्रश्न एवं मॉडल उत्तर", color: rtech-excel)

#table(
  columns: (2.2fr, 3.8fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[तकनीकी इंटरव्यू प्रश्न (Asked in Top MNCs)],
  text(size: 6.8pt, weight: "bold", fill: white)[सीनियर एग्जीक्यूटिव मॉडल उत्तर],

  [#text(weight: "bold", fill: rtech-navy)[प्र.1: XLOOKUP क्यों VLOOKUP से बेहतर माना जाता है?]],
  [XLOOKUP में डिफ़ॉल्ट सटीक मिलान होता है, यह बाईं तरफ भी खोज सकता है, `#N/A` को अपने-आप संभालता है, एक साथ कई कॉलम निकालता है और बीच में नया कॉलम जोड़ने पर कभी नहीं टूटता।],

  [#text(weight: "bold", fill: rtech-navy)[प्र.2: पेज ब्रेक की जगह सेक्शन ब्रेक कब इस्तेमाल करना चाहिए?]],
  [पेज ब्रेक केवल टेक्स्ट को अगले पेज पर भेजता है। सेक्शन ब्रेक एक स्वतंत्र लेआउट जोन बनाता है, जिससे किसी एक पेज को पोर्ट्रेट के बीच में लैंडस्केप किया जा सके और हेडर/फुटर अलग किए जा सकें।],

  [#text(weight: "bold", fill: rtech-navy)[प्र.3: पावर क्वेरी में 'Unpivot Columns' का क्या काम है?]],
  [यह चौड़े मैट्रिक्स टेबल (महीनों के कॉलम) को सामान्यीकृत 2-कॉलम डेटाबेस स्ट्रक्चर (Attribute व Value) में बदलता है, जिससे सही पिवट टेबल और डेटा मॉडल बनाए जा सकें।],

  [#text(weight: "bold", fill: rtech-navy)[प्र.4: मॉर्फ ट्रांज़िशन सामान्य एनिमेशन से कैसे अलग है?]],
  [सामान्य एनिमेशन में हर ऑब्जेक्ट पर अलग से मोशन पाथ लगाना पड़ता है। मॉर्फ दो स्लाइडों की तुलना कर अपने-आप एक जैसे नाम वाले ऑब्जेक्ट्स (`!!Logo`) का आकार, रंग और स्थान स्मूथली बदल देता है।],

  [#text(weight: "bold", fill: rtech-navy)[प्र.5: आउटलुक में इनबॉक्स जीरो का 4D नियम क्या है?]],
  [2 मिनट से कम का काम हो तो तुरंत करें (Do); दूसरों को सौंपें (Delegate); बाद के लिए कैलेंडर पर शेड्यूल करें (Defer); बाकी सब डिलीट या आर्काइव करें (Delete) ताकि इनबॉक्स खाली रहे।],
)

#v(1.5pt)
#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 0.8pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 2.5pt),
    text(size: 6.6pt, weight: "bold", fill: rtech-blue)[
      🚀 क्या आप संपूर्ण 113 पेजों की विस्तृत किताब व 6 असली एक्सेल प्रैक्टिस फाइल्स (.xlsx) चाहते हैं? ₹49 मास्टर बुक या ₹149 करियर सुइट पर अपग्रेड करें: #link("https://rtechlab.com/hi/notes")[*rtechlab.com/hi/notes*]
    ]
  )
]
