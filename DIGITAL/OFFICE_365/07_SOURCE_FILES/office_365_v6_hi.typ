// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE V6 (HI)
// Complete College & Corporate Desk Reference + 150 Shortcuts Poster (8 Pages)
// =============================================================================

#set document(
  title: "Microsoft 365 एंटरप्राइज़ क्विक डेस्क रेफरेंस और 150 शॉर्टकट (Hindi)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 8mm, bottom: 7.5mm, left: 7.5mm, right: 7.5mm),
  background: context {
    let p = counter(page).get().first()
    if p > 1 [
      #place(center + horizon)[
        #rotate(-35deg)[
          #text(size: 74pt, weight: "black", fill: rgb("#0F172A0A"))[RTECHLAB]
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
          #h(3pt)#text(size: 7.5pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 7.5pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 डेस्क रेफरेंस और 150 शॉर्टकट गाइड (हिंदी)]
        ],
        [
          #text(size: 6.8pt, weight: "bold", fill: rgb("#107C41"))[Word · Excel · PowerPoint · Outlook · Cloud]
          #text(size: 6.8pt, fill: rgb("#64748B"))[ · Rahul Patel]
        ]
      )
      #v(1pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(1pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.3pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] 150 प्रोडक्शन शॉर्टकट · प्रिंट कर डेस्क पर रखें · मुफ़्त टूल्स: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            stroke: 0.4pt + rgb("#CBD5E1"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.2pt),
            text(size: 6.5pt, weight: "bold", fill: rgb("#0F172A"))[पेज #p 8 में से]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
  size: 6.8pt,
  fill: rgb("#0F172A"),
  spacing: 100%
)

#set par(
  justify: false,
  leading: 0.36em,
  first-line-indent: 0pt
)

// Colors
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-word = rgb("#185ABD")
#let rtech-excel = rgb("#107C41")
#let rtech-ppt = rgb("#C43E1C")
#let rtech-outlook = rgb("#0078D4")
#let rtech-muted = rgb("#475569")
#let dark-border = rgb("#1E293B")

// Highlighters & Tags
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-o(body) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#body]]
#let kbd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.55pt + dark-border, radius: 2pt, inset: (x: 2pt, y: 0.5pt))[#text(size: 5.9pt, font: ("Consolas", "Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]
#let nb(n, c) = box(fill: c, inset: (x: 2pt, y: 0.7pt), radius: 2pt)[#text(fill: white, weight: "black", size: 5.4pt)[#n]]

#let app-banner(title, subtitle, color) = {
  block(width: 100%, fill: color, radius: 3pt, inset: (x: 6pt, y: 3.5pt))[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [#text(size: 9.2pt, weight: "black", fill: white)[#title]],
      [#text(size: 6.4pt, weight: "bold", fill: rgb("#FFFFFFCC"))[#subtitle]]
    )
  ]
  v(2pt)
}

#let section-banner(num: "PART", title: "TITLE", color: rtech-blue) = {
  v(2.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3pt + color, rest: 0.55pt + dark-border),
    radius: (right: 2.5pt),
    inset: (x: 5pt, y: 2.2pt),
    [
      #box(
        fill: color,
        radius: 2pt,
        inset: (x: 3.5pt, y: 1pt),
        text(size: 5.8pt, font: ("Consolas", "Nirmala UI", "Segoe UI"), weight: "black", fill: white)[#num]
      )
      #h(4pt)
      #text(size: 7.5pt, weight: "black", fill: rtech-navy)[#title]
    ]
  )
  v(1.5pt)
}

// =============================================================================
// PAGE 01: FULL-BLEED EXECUTIVE HERO COVER PAGE
// =============================================================================
#page(
  paper: "a4",
  margin: 0mm,
  header: none,
  footer: none,
  background: none,
)[
  #image("02_BRAND_ASSETS/office_365_cover_hero.png", width: 100%, height: 100%, fit: "cover")
]

// =============================================================================
// PAGE 02: SECTION 1 — MICROSOFT WORD 365 (VISUAL + WORKFLOWS + TOP KEYS)
// =============================================================================
#app-banner("सेक्शन 1  |  MICROSOFT WORD 365", "कॉर्पोरेट रिपोर्ट, कॉलेज थीसिस, ATS रिज्यूमे और ऑटोमेटेड डॉक्यूमेंट", rtech-word)

// Compact 8-Page Quick Index Strip
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 2.5pt, inset: (x: 4pt, y: 2.5pt))[
  #set text(size: 5.7pt, weight: "bold", fill: rtech-navy)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    [#box(fill: rtech-navy, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.1]] Cover & Roadmap],
    [#box(fill: rtech-word, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.2]] MS Word 365],
    [#box(fill: rtech-excel, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.3]] 24 Excel Formulas],
    [#box(fill: rtech-excel, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.4]] Power Query & Errors],
    [#box(fill: rtech-ppt, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.5]] PowerPoint 365],
    [#box(fill: rtech-navy, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.6]] ★ 150 Shortcuts Wall],
    [#box(fill: rtech-outlook, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.7]] Outlook, Cloud & AI],
    [#box(fill: rgb("#047857"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.8]] Author QR & MNC Q&A],
  )
]

#section-banner(num: "भाग 1.1", title: "विज़ुअल ब्लूप्रिंट: कंपनियाँ गलत फॉर्मेट वाले रिज्यूमे व रिपोर्ट क्यों रिजेक्ट करती हैं?", color: rtech-word)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/word_document_layout_visual.png", width: 84%)
  ]
]

#section-banner(num: "भाग 1.2", title: "कॉलेज रिपोर्ट, रिज्यूमे और ऑफिस जॉब्स के लिए 6 ज़रूरी Word वर्कफ़्लो", color: rtech-word)
#table(
  columns: (1.35fr, 2.25fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3.1pt,
  text(size: 6.6pt, weight: "bold", fill: white)[वर्कफ़्लो / टूल],
  text(size: 6.6pt, weight: "bold", fill: white)[कॉलेज और ऑफिस में क्यों ज़रूरी है?],
  text(size: 6.6pt, weight: "bold", fill: white)[सही तरीका (Click Path & Shortcut)],
  [#hl-b[1. Heading 1–3 + Auto TOC]], [हाथ से नंबर टाइप करने पर रिपोर्ट में नंबर बिगड़ जाते हैं। Auto-TOC 2 सेकंड में क्लिक करने योग्य इंडेक्स बनाता है।], [Home → Heading 1/2/3 (#kbd[Ctrl+Alt+1/2/3]) → References → Table of Contents → पेज अपडेट करने को #kbd[F9] दबाएं।],
  [#hl-o[2. Section vs Page Break]], [पूरी फ़ाइल घुमाए बिना पोर्ट्रेट रिपोर्ट के बीच में एक चौड़ा (Landscape) Excel चार्ट वाला पेज जोड़ें!], [Layout → Breaks → #hl-y[Next Page (Section Break)]. बार-बार Enter न दबाएं! नए पेज के लिए #kbd[Ctrl+Enter] चुनें।],
  [#hl-g[3. Mail Merge (500 लेटर)]], [एक Excel लिस्ट से 5 मिनट में 500 अलग-अलग कॉलेज सर्टिफिकेट, एडमिट कार्ड या HR ऑफर लेटर जनरेट करें।], [Mailings → Start Mail Merge → Letters → Select Recipients (Excel लिस्ट चुनें) → Insert Merge Field → Finish.],
  [4. Track Changes व Compare], [HR कॉन्ट्रैक्ट और टीचर थीसिस रिव्यू के लिए ज़रूरी—ओरिजिनल टेक्स्ट मिटाए बिना हर बदलाव को रंगों में दिखाता है।], [Review → Track Changes (#kbd[Ctrl+Shift+E]). दो फ़ाइलों का अंतर देखने के लिए Review → Compare का उपयोग करें।],
  [#hl-y[5. ATS रिज्यूमे व PDF लॉक]], [फैंसी डिज़ाइन वाले Canva रिज्यूमे MNC सॉफ्टवेयर में फेल होते हैं। साफ़ 1-इंच मार्जिन व Word टेबल 100% पास होते हैं।], [0.75–1" मार्जिन, 10.5pt Calibri/Segoe UI, साफ़ हेडिंग व बिना बॉर्डर वाली टेबल इस्तेमाल करें → PDF एक्सपोर्ट (#kbd[F12])।],
  [6. Footnotes, AutoText व लॉक], [रिसर्च पेपर में रेफरेंस (`Alt+Ctrl+F`) जोड़ें, 2 अक्षर में कंपनी पता लिखें (Quick Parts), व एडिटिंग पासवर्ड से लॉक करें।], [References → Insert Footnote; Review → Restrict Editing (केवल Comments की अनुमति दें)।],
)

#section-banner(num: "भाग 1.3", title: "टॉप 10 Word प्रोडक्शन शॉर्टकट (सभी 45 शॉर्टकट पेज 6 पर एक साथ)", color: rtech-word)
#table(
  columns: (1.05fr, 1.95fr, 1.05fr, 1.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  [#kbd[Ctrl+Shift+C / V]], [स्टाइल कॉपी और पेस्ट (Format Painter)],
  [#kbd[Ctrl+Space]], [#hl-o[सारी मैन्युअल फॉर्मेटिंग साफ़ करें]],
  [#kbd[Shift+F3]], [#hl-y[UPPER / lower / Title केस बदलें]],
  [#kbd[Ctrl+Enter]], [साफ़ नया पेज ब्रेक डालें],
  [#kbd[Ctrl+F / Ctrl+H]], [नेविगेशन पेन / थोक में टेक्स्ट बदलें],
  [#kbd[Alt+Shift+Up/Dn]], [#hl-g[पैराग्राफ या टेबल रो ऊपर/नीचे करें]],
  [#kbd[Ctrl+J]], [दोनों किनारों से बराबर (Justify) करें],
  [#kbd[F9]], [TOC, तारीख और सभी फ़ील्ड अपडेट करें],
  [#kbd[Ctrl+Shift+E]], [Track Changes चालू / बंद करें],
  [#kbd[Ctrl+Shift+G]], [तुरंत शब्द और पेज गिनती देखें],
)

#section-banner(num: "भाग 1.4", title: "कॉलेज थीसिस व कंपनी डॉक्यूमेंट की अंतिम जाँच सूची (PDF बनाने से पहले)", color: rtech-blue)
#table(
  columns: (1.4fr, 4.6fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  [#text(weight: "bold", fill: rtech-word)[1. अलग प्रथम पेज (Cover)]], [Header & Footer → 'Different First Page' चुनें ताकि पहले कवर पेज पर हेडर लाइन या 'Page 1' न आए!],
  [#text(weight: "bold", fill: rtech-word)[2. दोहरा पेज नंबर सेटअप]], [TOC के बाद Section Break लगाएं → 'Link to Previous' बंद करें → आगे `i, ii, iii` व अध्याय में `1, 2, 3` नंबर।],
  [#text(weight: "bold", fill: rtech-word)[3. चित्र व टेबल लॉक करें]], [चित्र चुनें → References → Insert Caption व Cross-Reference जोड़ें ताकि 'See Fig 2.1' कभी गलत न हो।],
  [#text(weight: "bold", fill: rtech-word)[4. बुकमार्क सहित PDF]], [Save As PDF → Options → 'Create bookmarks using Headings' चुनें — Adobe/Chrome में क्लिकेबल इंडेक्स बनेगा।],
  [#text(weight: "bold", fill: rtech-word)[5. गणित व CSV से टेबल]], [#kbd[Alt + =] से इंजीनियरिंग/गणित समीकरण डालें; 'Convert Text to Table' से कॉमा डेटा 1 क्लिक में टेबल बनाएं।],
)
#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [#box(width: 100%, fill: rgb("#DCFCE7"), stroke: 0.65pt + rtech-excel, radius: 2.5pt, inset: (x: 5pt, y: 2.5pt))[#text(size: 6.1pt, weight: "bold", fill: rgb("#166534"))[✅ ATS 100% पास: 1-कॉलम Word हेडिंग, साफ़ मार्जिन, PDF एक्सपोर्ट]]],
  [#box(width: 100%, fill: rgb("#FEE2E2"), stroke: 0.65pt + rgb("#DC2626"), radius: 2.5pt, inset: (x: 5pt, y: 2.5pt))[#text(size: 6.1pt, weight: "bold", fill: rgb("#991B1B"))[❌ ATS रिजेक्ट: 2-कॉलम Canva ग्राफिक्स, टेक्स्टबॉक्स व आइकन]]]
)
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: (left: 3.5pt + rtech-word, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-word)[💡 क्या आप जानते हैं? (रिज्यूमे तथ्य)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[HR रिक्रूटर किसी रिज्यूमे को औसतन केवल *7.4 सेकंड* देखते हैं! साफ़ 1-इंच मार्जिन, Heading Styles व क्लिकेबल PDF बुकमार्क आपका सिलेक्शन चांस दोगुना करते हैं।]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-मिनट अभ्यास: Word खोलें → 3 हेडिंग लिखें → Ctrl+Alt+1 → References → Table of Contents → F9 दबाएं!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-word)[🔥 "आपका साफ़-सुथरा डॉक्यूमेंट इंटरव्यू रूम में जाने से पहले ही आपकी काबिलियत बता देता है।"]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_word_desk.png", height: 64pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 03: SECTION 2A — EXCEL 365 FORMULAS + SPREADSHEET VISUAL
// =============================================================================
#app-banner("सेक्शन 2A  |  MICROSOFT EXCEL 365 — फॉर्मूला इंजन", "मॉडर्न लुकअप, डायनामिक ऐरे (#SPILL), LET स्पीड और डेटा क्लीनिंग", rtech-excel)

#section-banner(num: "भाग 2.1", title: "लाइव Excel ग्रिड विज़ुअल: Dynamic Array Spill और XLOOKUP कार्यप्रणाली", color: rtech-excel)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/excel_dynamic_array_grid.png", width: 96%)
  ]
]

#section-banner(num: "भाग 2.2", title: "ऑफिस और कॉलेज प्रैक्टिकल के 20 टॉप फॉर्मूले (सही सिंटैक्स + उदाहरण + उपयोग)", color: rtech-excel)
#table(
  columns: (1.15fr, 2.3fr, 2.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.5pt,
  text(size: 6.4pt, weight: "bold", fill: white)[नं. · फ़ंक्शन],
  text(size: 6.4pt, weight: "bold", fill: white)[फॉर्मूला सिंटैक्स और उदाहरण],
  text(size: 6.4pt, weight: "bold", fill: white)[आउटपुट और कॉलेज / ऑफिस उपयोग],
  [#hl-g[01. XLOOKUP]], [`=XLOOKUP(F2, A2:A50, D2:D50, "Missing")`], [#hl-y[VLOOKUP से बेहतर!] बाएँ-दाएँ कहीं भी खोजे; नए कॉलम से फॉर्मूला नहीं टूटता।],
  [02. XLOOKUP मल्टी-कॉल], [`=XLOOKUP(F2, A:A, B:D)`], [केवल 1 फॉर्मूले से Name, Dept और Salary तीनों कॉलम ऑटोमैटिक भर जाते हैं।],
  [#hl-b[03. 2-Way XLOOKUP]], [`=XLOOKUP(R, A2:A6, XLOOKUP(C, B1:F1, B2:F6))`], [पंक्ति (Product) और कॉलम (शहर) दोनों से रेट निकालता है — GST/कूरियर रेट हेतु।],
  [04. रिवर्स (नीचे से) सर्च], [`=XLOOKUP(ID, A:A, DateCol, , 0, -1)`], [`-1` लिखने से डेटा को बिना Sort किए सबसे ताज़ा (आखिरी) एंट्री तुरंत मिल जाती है।],
  [05. INDEX + MATCH], [`=INDEX(D2:D99, MATCH(F2, A2:A99, 0))`], [पुराने Excel (2016/2019) में भी चलता है। इंटरव्यू में XLOOKUP के साथ पूछा जाता है।],
  [06. VLOOKUP + IFERROR], [`=IFERROR(VLOOKUP(F2, A:D, 3, 0), "N/A")`], [पुरानी कंपनियों का मुख्य फॉर्मूला। हमेशा `0`/`FALSE` लगाएं और `IFERROR` में लपेटें।],
  [#hl-g[07. FILTER]], [`=FILTER(A2:D99, B2:B99="Paid", "None")`], [शर्त से मिलने वाली सभी पंक्तियाँ अपने आप अलग निकालता है (पेंडिंग फीस लिस्ट हेतु)।],
  [08. SORT + UNIQUE], [`=SORT(UNIQUE(A2:A99))`], [डुप्लीकेट नाम हटाकर A से Z क्रम में लाइव लिस्ट बनाता है — ड्रॉपडाउन के लिए बेस्ट।],
  [09. SEQUENCE], [`=SEQUENCE(10, 1, 1001, 1)`], [1001 से 1010 तक ऑटोमैटिक बिल नंबर या रोल नंबर सीरीज़ तुरंत तैयार करता है।],
  [#hl-b[10. LET (5x स्पीड)]], [`=LET(r,D2:D9, c,E2:E9, m,(r-c)/r, IF(m>0.2,"Hi","Lo"))`], [#hl-y[500% तेज़ गणना!] बड़े डेटा रेंज को वेरिएबल नाम देकर बार-बार गणना रोकता है।],
  [11. SUMIFS], [`=SUMIFS(Sales, Reg, "West", Yr, 2027)`], [जोड़ने वाली रेंज हमेशा सबसे पहले आती है! मासिक GST और ब्रांच सेल रिपोर्ट हेतु।],
  [12. COUNTIFS / AVGIFS], [`=COUNTIFS(Dept,"IT", Salary,">40000")`], [एक साथ कई शर्तों पर गिनती या औसत निकालने के लिए — कॉलेज व HR डैशबोर्ड हेतु।],
  [13. IFS (ग्रेडिंग)], [`=IFS(A2>=75,"Dist", A2>=60,"1st", TRUE,"Pass")`], [मार्कशीट ग्रेड या बोनस स्लैब बनाने का सबसे साफ़ तरीका (बिना उलझे ब्रैकेट के)।],
  [14. TEXTSPLIT], [`=TEXTSPLIT(A2, ",", ";")`], [कॉमा या सेमीकोलन से जुड़े टेक्स्ट को तुरंत अलग-अलग कॉलम व पंक्तियों में तोड़ता है।],
  [15. TEXTBEFORE/AFTER], [`=TEXTBEFORE(A2,"@")` / `=TEXTAFTER(A2,"@")`], [ईमेल ID से यूज़रनेम और कंपनी डोमेन 1 सेकंड में अलग करता है।],
  [16. TRIM + CLEAN], [`=TRIM(CLEAN(A2))`], [Tally या सॉफ्टवेयर से आए डेटा के फालतू स्पेस व छुपे चिन्ह तुरंत साफ़ करता है।],
  [17. TEXTJOIN], [`=TEXTJOIN(", ", TRUE, A2:A10)`], [खाली सेल छोड़कर (`TRUE`) सभी नामों को कॉमा के साथ एक सेल में जोड़ता है।],
  [18. TEXT फॉर्मेट], [`=TEXT(A2, "DD-MMM-YYYY")`], [टेक्स्ट के साथ तारीख (`25-Nov-2027`) जोड़ने पर तारीख को नंबर बनने से रोकता है।],
  [19. DATEDIF व WORKDAYS], [`=DATEDIF(DOB,TODAY(),"Y")` / `=NETWORKDAYS(A2,B2)`], [कर्मचारी की सही उम्र/कार्यकाल (वर्ष) और शनिवार-रविवार छोड़कर कुल कार्यदिवस गिनता है।],
  [20. ROUND (GST बिल)], [`=ROUND(Amt*0.18, 2)` / `=ROUNDUP(A2, 0)`], [18% GST को ठीक 2 दशमलव (पैसे) तक राउंड करने और बिलिंग स्लैब हेतु।],
  [#hl-b[21. PMT (लोन EMI)]], [`=PMT(9%/12, 60, -500000)`], [तुरंत ₹ मासिक EMI निकालने के लिए (ब्याज/12, महीने, `-लोन`). बैंकिंग व फाइनेंस का प्रिय।],
  [22. SUMPRODUCT], [`=SUMPRODUCT(Qty, Price)`], [बिना अलग Total कॉलम बनाए सीधे मात्रा × दर जोड़ता है — इन्वेंटरी व मार्कशीट हेतु।],
  [23. EOMONTH], [`=EOMONTH(InvDate, 0)` / `=EOMONTH(D2, 1)+20`], [महीने की अंतिम तारीख या अगले महीने की GSTR-3B देय तिथि (20 तारीख) निकालता है!],
  [#hl-g[24. AGGREGATE]], [`=AGGREGATE(9, 6, D2:D100)`], [`9`=SUM, `6`=`#N/A`/`#DIV/0!` एरर छोड़कर जोड़ना! गंदी शीट पर कभी फेल नहीं होता।],
)
#v(2.5pt)
#box(width: 100%, fill: rgb("#DCFCE7"), stroke: 0.7pt + rtech-excel, radius: 3pt, inset: (x: 6pt, y: 3.5pt))[
  #text(size: 6.4pt, weight: "bold", fill: rgb("#166534"))[★ डाइनैमिक स्पिल प्रो टिप (\# ऑपरेटर): यदि `=UNIQUE(A2:A100)` सेल `G2` से नीचे ऑटो-स्पिल हो रहा है, तो कहीं भी पूरे बदलते डेटा के लिए `=COUNTA(G2#)` या `=SORT(G2#)` लिखें! · 📥 मुफ़्त प्रैक्टिस फ़ाइल: #link("https://rtechlab.com/downloads/Office-365-Practice-Lab.xlsx")[*rtechlab.com/downloads/Office-365-Practice-Lab.xlsx*]]
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#F0FDF4"),
  stroke: (left: 3.5pt + rtech-excel, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-excel)[💡 क्या आप जानते हैं? (करियर तथ्य)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[भारत में *82% MIS, अकाउंट्स और डेटा जॉब इंटरव्यू* पहले राउंड में ही `XLOOKUP`, `SUMIFS` और `IFERROR` पूछते हैं! `LET()` फ़ॉर्मूला 5x तेज़ चलता है।]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-मिनट अभ्यास: 5 पंक्तियाँ (ID/Name/Salary) लिखें → `=XLOOKUP(E2, A2:A6, B2:D6)` डालकर 3 कॉलम स्पिल देखें!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-excel)[🔥 "एक बार Excel लॉजिक सीख लें—फिर फ़ॉर्मूले आपके लिए काम करेंगे जब दूसरे मैन्युअल टाइप करेंगे।"]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_excel_desk.png", height: 64pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 04: SECTION 2B — POWER QUERY ETL, ERROR DOCTOR & PIVOT MIS
// =============================================================================
#app-banner("सेक्शन 2B  |  MICROSOFT EXCEL 365 — ऑटोमेशन, पिवट और एरर समाधान", "Power Query ETL · 7 एरर समाधान · पिवट MIS · भारतीय ₹ फॉर्मेट", rtech-excel)

#section-banner(num: "भाग 2.3", title: "Power Query (ETL): 6-स्टेज ऑटोमेशन (बिना कोडिंग 5 घंटे की रिपोर्ट 5 सेकंड में!)", color: rtech-blue)
#table(
  columns: (0.45fr, 1.25fr, 2.3fr, 2fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
  inset: 3.1pt,
  text(size: 6.6pt, weight: "bold", fill: white)[स्टेप],
  text(size: 6.6pt, weight: "bold", fill: white)[प्रक्रिया (Action)],
  text(size: 6.6pt, weight: "bold", fill: white)[Excel के अंदर क्या सेट करें],
  text(size: 6.6pt, weight: "bold", fill: white)[ऑफिस / कॉलेज में लाभ],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[01]]], [#text(weight: "bold", fill: rtech-blue)[Extract (डेटा जोड़ें)]], [Data → Get Data → From Folder / CSV / SQL / PDF.], [30 अलग-अलग ब्रांच फ़ाइलें अपने आप 1 टेबल में जुड़ जाती हैं।],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[02]]], [#text(weight: "bold", fill: rtech-blue)[Promote व फ़िल्टर]], [Use First Row as Headers; खाली व सब-टोटल पंक्तियाँ अनचेक करें।], [हर महीने हाथ से कचरा पंक्तियाँ मिटाने का झंझट हमेशा के लिए ख़त्म।],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[03]]], [#text(weight: "bold", fill: rtech-blue)[#hl-y[Unpivot Columns]]], [ID कॉलम चुनें → Right-Click → #hl-g[Unpivot Other Columns].], [\#1 MNC इंटरव्यू स्किल! Jan–Dec चौड़ी टेबल को Pivot-रेडी बनाता है।],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[04]]], [#text(weight: "bold", fill: rtech-blue)[क्लीन व डेटा टाइप]], [Transform → Trim स्पेस; Date / ₹ Currency / Whole Number सेट करें।], [आगे किसी भी कैलकुलेशन में `#VALUE!` एरर आने की संभावना ज़ीरो!],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[05]]], [#text(weight: "bold", fill: rtech-blue)[Merge Queries]], [Home → Merge Queries → Left Outer Join (Sales + CustomerID).], [लाखों पंक्तियों पर धीमे VLOOKUP का सबसे तेज़ व ऑटोमैटिक विकल्प।],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[06]]], [#text(weight: "bold", fill: rtech-blue)[Close & Load]], [Sheet या Data Model में लोड करें। अगले महीने बस #hl-y[Refresh All] दबाएं।], [5 घंटे की मासिक रिपोर्टिंग का काम केवल 5 सेकंड में पूरा!],
)

#section-banner(num: "भाग 2.4", title: "Excel एरर डॉक्टर (10-सेकंड में ठीक करें) और 5-स्टेप पिवट MIS डैशबोर्ड", color: rtech-ppt)
#table(
  columns: (0.75fr, 2.35fr, 2.9fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3pt,
  text(size: 6.6pt, weight: "bold", fill: white)[एरर],
  text(size: 6.6pt, weight: "bold", fill: white)[असली कारण (क्यों आता है?)],
  text(size: 6.6pt, weight: "bold", fill: white)[10-सेकंड में सही करने का तरीका],
  [#text(weight: "bold", fill: rtech-ppt)[`#N/A`]], [खोजी जा रही ID मौजूद नहीं या नाम के पीछे खाली स्पेस है।], [`=TRIM()` चलाएं, टेक्स्ट/नंबर मैच करें, व `=IFERROR(..., "New")` में लपेटें।],
  [#text(weight: "bold", fill: rtech-ppt)[`#VALUE!`]], [टेक्स्ट वाले सेल में जोड़-घटाव (जैसे `"₹500"` + `100`) करना।], [अंकों के आगे से टेक्स्ट हटाएं या `A1+A2` की जगह `=SUM(A1:A5)` लिखें।],
  [#text(weight: "bold", fill: rtech-ppt)[`#REF!`]], [जिस कॉलम या रो से फॉर्मूला जुड़ा था, उसे डिलीट कर दिया गया।], [तुरंत #kbd[Ctrl+Z] करें या टूटे हुए सेल रेफरेंस को दोबारा चुनें।],
  [#text(weight: "bold", fill: rtech-ppt)[`#DIV/0!`]], [किसी संख्या को 0 या खाली सेल से भाग (Divide) देना।], [फॉर्मूला को `=IFERROR(Profit/Sales, 0)` में बंद कर दें।],
  [#text(weight: "bold", fill: rtech-ppt)[`#NAME?`]], [फॉर्मूला की स्पेलिंग गलत (`=XLOKUP`) या टेक्स्ट में कोट्स नहीं।], [स्पेलिंग जांचें; शब्दों के चारों ओर डबल कोट्स `"Delhi"` ज़रूर लगाएं।],
  [#text(weight: "bold", fill: rtech-ppt)[`#SPILL!`]], [डायनामिक फॉर्मूला के नीचे खुलने वाले क्षेत्र में कोई डेटा फँसा है।], [नीले डॉटेड बॉक्स के बीच से पुराने टेक्स्ट या मर्ज सेल हटाएं।],
  [#text(weight: "bold", fill: rtech-ppt)[`#####`]], [कॉलम की चौड़ाई कम है या तारीख घटाने पर माइनस में आ रही है।], [कॉलम चौड़ा करने के लिए #kbd[Alt+H+O+I] दबाएं; तारीख क्रम जांचें।],
)

#section-banner(num: "MIS PRO", title: "भाग 2.5 · 5-स्टेप पिवट MIS व भारतीय ₹ फॉर्मेट", color: rtech-excel)
#table(
  columns: (1.25fr, 4.75fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3pt,
  [#text(weight: "bold", fill: rtech-excel)[1 · #hl-g[Smart Table]]], [डेटा पर #kbd[Ctrl+T] दबाएं → नया डेटा जोड़ने पर पिवट अपने आप अपडेट होगा।],
  [#text(weight: "bold", fill: rtech-excel)[2 · Pivot Table]], [#kbd[Alt+N+V] दबाएं → Region को Rows में और Sales को Values में खींचें।],
  [#text(weight: "bold", fill: rtech-excel)[3 · Slicer बटन]], [Pivot Analyze → Insert Slicer (साल/विभाग) से इंटरैक्टिव फ़िल्टर बनाएं।],
  [#text(weight: "bold", fill: rtech-excel)[4 · भारतीय ₹ फॉर्मेट]], [#kbd[Ctrl+1] → Custom में #hl-b[`"₹ "##,##,##0`] डालें (लाख/करोड़ कॉमा के लिए)!],
  [#text(weight: "bold", fill: rtech-excel)[5 · Freeze Panes]], [B2 सेल चुनकर #kbd[Alt+W+F+F] दबाएं — स्क्रॉल करते समय हेडिंग लॉक रहेगी।],
  [#text(weight: "bold", fill: rtech-excel)[6 · Dropdown लिस्ट]], [#kbd[Alt+A+V+V] → List चुनें — शेयर शीट में गलत स्पेलिंग रुक जाएगी।],
)

#section-banner(num: "भाग 2.6", title: "लाइव ऑफिस केस स्टडी + टॉप 4 कंडीशनल फॉर्मेटिंग व शीट लॉक नियम", color: rtech-navy)
#table(
  columns: (1.45fr, 4.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3.2pt,
  [#text(weight: "bold", fill: rtech-navy)[#hl-y[लाइव केस: GST व सेल MIS]]], [1) Tally/बिलिंग से मासिक CSV निकालें → 2) Power Query (`Unpivot` + `Trim`) से साफ़ करें → 3) `XLOOKUP` से पार्टी GSTIN लाएं → 4) `Ctrl+T` पिवट + Slicer लगाएं → 5) 1-पेज PDF भेजें!],
  [#text(weight: "bold", fill: rtech-navy)[1. डुप्लीकेट बिल पकड़ें]], [Invoice कॉलम चुनें → #kbd[Alt+H+L+H+D] दबाएं — डुप्लीकेट बिल नंबर तुरंत लाल दिखेंगे!],
  [#text(weight: "bold", fill: rtech-navy)[2. ट्रैफिक लाइट KPI रंग]], [Conditional Formatting → Icon Sets (हरा/पीला/लाल) से टारगेट % को विज़ुअल बनाएं।],
  [#text(weight: "bold", fill: rtech-navy)[3. फॉर्मूला लॉक, इनपुट खुला]], [पीले इनपुट सेल चुनें → #kbd[Ctrl+1] → Protection → 'Locked' अनचेक करें → Review → Protect Sheet!],
  [#text(weight: "bold", fill: rtech-navy)[4. गलत एंट्री अलर्ट बॉक्स]], [Data Validation (#kbd[Alt+A+V+V]) → Custom `=A2>18` व पॉपअप एरर मैसेज जोड़ें।],
)
#v(2pt)
#box(width: 100%, fill: rgb("#EFF6FF"), stroke: 0.65pt + rtech-blue, radius: 2.5pt, inset: (x: 6pt, y: 2.5pt))[
  #text(size: 6.2pt, weight: "bold", fill: rtech-blue)[📥 मुफ़्त प्रैक्टिस फ़ाइल: #link("https://rtechlab.com/downloads/Office-365-Practice-Lab.xlsx")[*rtechlab.com/downloads/Office-365-Practice-Lab.xlsx*]]
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#F0FDF4"),
  stroke: (left: 3.5pt + rtech-excel, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-excel)[💡 क्या आप जानते हैं? (ऑटोमेशन तथ्य)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[Power Query हर सप्ताह ऑफिस एनालिस्ट के *6+ घंटे* बचाता है! एक बार `Unpivot` सेट करने पर अगले महीने 1 क्लिक में पूरी रिपोर्ट 5 सेकंड में बनती है।]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-मिनट अभ्यास: डेटा चुनें → `Ctrl+T` → `Alt+N+V` (Pivot) → Dept को Rows और Sales को Values में खींचें।]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-excel)[🔥 "रविवार को शीट सुधारने में समय न गँवाएं—Power Query से काम ऑटोमेट कर आगे बढ़ें!"]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_excel_desk.png", height: 80pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 05: SECTION 3 — POWERPOINT 365 (SLIDE MASTER, MORPH & PITCH DECK)
// =============================================================================
#app-banner("सेक्शन 3  |  MICROSOFT POWERPOINT 365", "कॉर्पोरेट पिच डेक, स्लाइड मास्टर ब्रांड लॉक और सिनेमैटिक Morph एनिमेशन", rtech-ppt)

#section-banner(num: "भाग 3.1", title: "Slide Master + Morph ब्लूप्रिंट (सामान्य छात्र बनाम कॉर्पोरेट एक्सपर्ट)", color: rtech-ppt)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/powerpoint_slide_master_morph.png", width: 96%)
  ]
]

#section-banner(num: "भाग 3.2", title: "प्रोफेशनल स्लाइड नियम व कॉलेज वाइवा / कंपनी पिच के लिए 5-स्लाइड फ़ॉर्मूला", color: rtech-ppt)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3pt,
  text(size: 6.5pt, weight: "bold", fill: white)[डिज़ाइन / संरचना नियम],
  text(size: 6.5pt, weight: "bold", fill: white)[MNC एक्सपर्ट तरीका (जॉब व A+ ग्रेड पाएं)],
  text(size: 6.5pt, weight: "bold", fill: white)[आम गलतियाँ जिनसे बचना चाहिए],
  [#hl-o[1. Slide Master लॉक]], [View → Slide Master की पहली मास्टर स्लाइड पर लोगो, फ़ॉन्ट व रंग एक बार सेट करें। सभी स्लाइड अपने आप ब्रांड होंगी!], [हर स्लाइड पर हाथ से लोगो कॉपी-पेस्ट करना—जिससे प्रेजेंटेशन में लोगो हिलता दिखता है।],
  [#hl-b[2. Morph (`!!ObjName`)]], [स्लाइड डुप्लीकेट करें → ऑब्जेक्ट बड़ा/स्थान बदलें → Transitions → Morph. Selection Pane (#kbd[Alt+F10]) में `!!Logo` नाम दें।], [हर बुलेट पॉइंट पर उड़ने व घूमने वाले भड़कीले एनिमेशन लगाना।],
  [#hl-y[3. 16:9 वाइडस्क्रीन + 6x6]], [हमेशा Design → 16:9 Widescreen चुनें। प्रति स्लाइड अधिकतम 6 लाइन व 6 शब्द लिखें — स्लाइड सिर्फ संकेत के लिए है।], [Word का पूरा पैराग्राफ स्लाइड पर चिपका देना और स्क्रीन से देखकर पढ़ना।],
  [4. पिक्सेल अलाइन व कलर], [ऑब्जेक्ट चुनकर #kbd[Alt+H+G+A] (Align) व #kbd[Alt+H+G+H] (समान दूरी) दबाएं; Eyedropper से लोगो का रंग उठाएं।], [अंदाज़े से बॉक्स रखना जिससे स्लाइड टेढ़ी-मेढ़ी व अव्यवस्थित दिखती है।],
  [#hl-g[5. 5-स्लाइड पिच ढाँचा]], [\#1 शीर्षक व उद्देश्य · \#2 समस्या व डेटा · \#3 समाधान आर्किटेक्चर · \#4 लाइव डेमो / लाभ · \#5 आगे की योजना व Q&A।], [मुख्य काम बताने से पहले 10 स्लाइड तक बेकार का इतिहास दिखाते रहना।],
  [6. Presenter View व कंप्रेस], [लैपटॉप पर अपने स्पीकर नोट्स व टाइमर देखें (#kbd[Alt+F5])। भेजने से पहले File → Info → Compress Media से MB 70% घटाएं।], [व्हाट्सएप पर 120MB की भारी फ़ाइल भेजना या हाथ में कागज़ की पर्ची लेकर पढ़ना।],
)

#section-banner(num: "भाग 3.3", title: "लाइव प्रेजेंटेशन कंट्रोल कीज़ (सभी 33 PPT शॉर्टकट पेज 6 पर दिए गए हैं!)", color: rtech-ppt)
#table(
  columns: (1.05fr, 1.95fr, 1.05fr, 1.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  [#kbd[F5 / Shift+F5]], [शुरू से / मौजूदा स्लाइड से शो चलाएं],
  [#kbd[B / W]], [#hl-o[Q&A के दौरान स्क्रीन काली / सफ़ेद करें]],
  [#kbd[Ctrl+L / Ctrl+P]], [#hl-y[लाइव लाल लेज़र पॉइंटर / पेन चलाएं]],
  [#kbd[Number + Enter]], [जैसे `5+Enter` दबाकर सीधे 5वीं स्लाइड पर जाएं],
)

#section-banner(num: "भाग 3.4", title: "कॉलेज वाइवा व कंपनी क्लाइंट मीटिंग जीतने का 5-स्लाइड सटीक फॉर्मूला", color: rtech-navy)
#table(
  columns: (0.7fr, 1.8fr, 2.85fr, 0.65fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if col in (0, 3) { center + horizon } else { left + horizon },
  inset: 2.6pt,
  text(size: 6.4pt, weight: "bold", fill: white)[स्लाइड],
  text(size: 6.4pt, weight: "bold", fill: white)[शीर्षक व मुख्य उद्देश्य],
  text(size: 6.4pt, weight: "bold", fill: white)[स्लाइड पर क्या विज़ुअल लगाएं],
  text(size: 6.4pt, weight: "bold", fill: white)[समय],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 1]], [दमदार शीर्षक + आपका नाम/टीम], [साफ़ 16:9 डार्क कवर + 1-लाइन में मुख्य प्रोजेक्ट मूल्य।], [#text(weight: "bold", fill: rtech-navy)[30 sec]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 2]], [असली समस्या (क्यों ज़रूरी है?)], [3 बड़े नंबर (जैसे `42% समय की बचत`) + समस्या आइकन।], [#text(weight: "bold", fill: rtech-navy)[1 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 3]], [आपका समाधान व आर्किटेक्चर], [SmartArt (`Alt+N+M`) वर्कफ़्लो या डायग्राम — अधिकतम 6 बुलेट।], [#text(weight: "bold", fill: rtech-navy)[1.5 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 4]], [लाइव डेमो / Excel डेटा प्रूफ], [लिंक्ड Excel चार्ट (`Ctrl+V` → Keep Formatting) + Morph ज़ूम।], [#text(weight: "bold", fill: rtech-navy)[2 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 5]], [लाभ / निष्कर्ष और Q&A], [पहले बनाम बाद (Before vs After) टेबल + QR लिंक। Q&A में #kbd[B] दबाएं!], [#text(weight: "bold", fill: rtech-navy)[1 min]],
)
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#FFF7ED"),
  stroke: (left: 3.5pt + rtech-ppt, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-ppt)[💡 क्या आप जानते हैं? (वाइवा व पिच तथ्य)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[इंसानी दिमाग टेक्स्ट से *60,000 गुना तेज़ी* से विज़ुअल्स समझता है! Slide Master + `!!Morph` + 6x6 नियम आपकी कॉलेज PPT को CEO-लेवल बनाता है।]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-मिनट अभ्यास: Slide 1 डुप्लीकेट करें → Slide 2 पर बॉक्स बड़ा करें → Transitions → Morph → `Shift+F5` दबाएं!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-ppt)[🔥 "अच्छी स्लाइड्स वक्ता की जगह नहीं लेतीं—वे आपके आत्मविश्वास को दोगुना करती हैं।"]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_ppt_stage.png", height: 76pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 06: ★ THE 150 PRODUCTION SHORTCUTS MASTER WALL (ALL ON ONE PAGE!) ★
// Word (001-045) + Excel (046-117) + PowerPoint (118-150) — Zero Blank Cells!
// =============================================================================
#app-banner("★  150 प्रोडक्शन शॉर्टकट्स मास्टर वॉल (एक पेज पोस्टर)  ★", "प्रिंट कर कीबोर्ड के पास लगाएं · Word (45) + Excel (72) + PowerPoint (33)", rtech-navy)

// Band 1: WORD (45 shortcuts = 15 rows x 3 pairs)
#block(width: 100%, fill: rtech-word, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[W  |  सेक्शन A : MICROSOFT WORD 365 — 45 प्रमुख डॉक्यूमेंट व थीसिस शॉर्टकट (001 – 045)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F8FAFC") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("001", rtech-word) #kbd[Ctrl + B / I / U]], [#hl-y[बोल्ड / इटैलिक / अंडरलाइन]],
    [#nb("002", rtech-word) #kbd[Ctrl + E / L / R]], [सेंटर / लेफ्ट / राइट अलाइन],
    [#nb("003", rtech-word) #kbd[Ctrl + J]], [#hl-g[पैराग्राफ जस्टिफाई (सीधे किनारे)]],
    [#nb("004", rtech-word) #kbd[Ctrl + 1 / 2 / 5]], [1.0 / 2.0 / 1.5 लाइन स्पेसिंग],
    [#nb("005", rtech-word) #kbd[Ctrl + Shift + >/<]], [फॉन्ट साइज बढ़ाएं / घटाएं],
    [#nb("006", rtech-word) #kbd[Ctrl + \] / \[]], [फॉन्ट साइज 1pt बढ़ाएं / घटाएं],
    [#nb("007", rtech-word) #kbd[Ctrl + Space]], [#hl-o[सभी मैन्युअल फॉर्मेटिंग हटाएं]],
    [#nb("008", rtech-word) #kbd[Ctrl + Q]], [पैराग्राफ फॉर्मेटिंग हटाएं],
    [#nb("009", rtech-word) #kbd[Ctrl + Shift + C]], [#hl-b[स्टाइल कॉपी (फॉर्मेट पेंटर)]],
    [#nb("010", rtech-word) #kbd[Ctrl + Shift + V]], [#hl-b[कॉपी की गई स्टाइल पेस्ट करें]],
    [#nb("011", rtech-word) #kbd[Shift + F3]], [#hl-y[केस बदलें (ABC / abc / Abc)]],
    [#nb("012", rtech-word) #kbd[Ctrl + Alt + 1/2/3]], [#hl-y[हेडिंग 1 / 2 / 3 लागू करें]],
    [#nb("013", rtech-word) #kbd[Ctrl + Shift + N]], [सामान्य (Normal) स्टाइल लगाएं],
    [#nb("014", rtech-word) #kbd[Ctrl + Enter]], [#hl-g[नया पेज ब्रेक डालें]],
    [#nb("015", rtech-word) #kbd[Ctrl + Shift + Enter]], [कॉलम ब्रेक डालें],
    [#nb("016", rtech-word) #kbd[Ctrl + Shift + Space]], [नॉन-ब्रेकिंग स्पेस डालें],
    [#nb("017", rtech-word) #kbd[Ctrl + Shift + -]], [नॉन-ब्रेकिंग हाइफन (-)],
    [#nb("018", rtech-word) #kbd[Ctrl + F]], [#hl-b[नेविगेशन पेन (हेडिंग खोजें)]],
    [#nb("019", rtech-word) #kbd[Ctrl + H]], [#hl-y[टेक्स्ट खोजें और बदलें (Replace)]],
    [#nb("020", rtech-word) #kbd[Ctrl + G / F5]], [सीधे पेज / लाइन पर जाएं],
    [#nb("021", rtech-word) #kbd[Ctrl + K]], [हाइपरलिंक (URL) जोड़ें],
    [#nb("022", rtech-word) #kbd[F7]], [स्पेलिंग और ग्रामर जांचें],
    [#nb("023", rtech-word) #kbd[Shift + F7]], [पर्यायवाची शब्द (Thesaurus)],
    [#nb("024", rtech-word) #kbd[Ctrl + Shift + E]], [#hl-o[ट्रैक चेंजेस चालू / बंद करें]],
    [#nb("025", rtech-word) #kbd[Alt + Ctrl + M]], [समीक्षा टिप्पणी (Comment) डालें],
    [#nb("026", rtech-word) #kbd[Alt + Shift + Up/Dn]], [#hl-g[पैरा या टेबल रो ऊपर/नीचे करें]],
    [#nb("027", rtech-word) #kbd[Alt + Shift + D / T]], [आज की तारीख / समय डालें],
    [#nb("028", rtech-word) #kbd[Alt + Shift + P]], [पेज नंबर फ़ील्ड डालें],
    [#nb("029", rtech-word) #kbd[F9]], [#hl-y[TOC और सभी फ़ील्ड अपडेट करें]],
    [#nb("030", rtech-word) #kbd[Alt + F9]], [फ़ील्ड कोड व्यू चालू/बंद करें],
    [#nb("031", rtech-word) #kbd[Ctrl + F9]], [खाली फ़ील्ड ब्रैकेट {} डालें],
    [#nb("032", rtech-word) #kbd[Alt + Ctrl + F / D]], [फुटनोट / एंडनोट डालें],
    [#nb("033", rtech-word) #kbd[Ctrl + Backspace/Del]], [पूरा पिछला / अगला शब्द मिटाएं],
    [#nb("034", rtech-word) #kbd[Ctrl + M / Shift+M]], [पैराग्राफ इंडेंट बढ़ाएं / घटाएं],
    [#nb("035", rtech-word) #kbd[Ctrl + = / Shift + +]], [सबस्क्रिप्ट / सुपरस्क्रिप्ट],
    [#nb("036", rtech-word) #kbd[Ctrl + Shift + L]], [तुरंत बुलेट लिस्ट लगाएं],
    [#nb("037", rtech-word) #kbd[Ctrl + Shift + G]], [शब्द और पेज गिनती देखें],
    [#nb("038", rtech-word) #kbd[Ctrl + Shift + 8]], [छुपे फ़ॉर्मैटिंग चिन्ह देखें],
    [#nb("039", rtech-word) #kbd[F4 / Ctrl + Y]], [#hl-g[पिछला कार्य दोबारा दोहराएं]],
    [#nb("040", rtech-word) #kbd[Ctrl + Alt + S]], [डॉक्यूमेंट विंडो को दो भाग में बांटें],
    [#nb("041", rtech-word) #kbd[Ctrl + Shift + F8]], [कॉलम के रूप में टेक्स्ट चुनें],
    [#nb("042", rtech-word) #kbd[Tab / Shift + Tab]], [टेबल के अगले / पिछले सेल में जाएं],
    [#nb("043", rtech-word) #kbd[Alt + F8]], [मैक्रो डायलॉग खोलें और चलाएं],
    [#nb("044", rtech-word) #kbd[Ctrl + F2 / Ctrl + P]], [प्रिंट प्रीव्यू और प्रिंट डायलॉग],
    [#nb("045", rtech-word) #kbd[Ctrl + S / F12]], [#hl-o[डॉक्यूमेंट सेव / Save As करें]],
  )
]
#v(3pt)

// Band 2: EXCEL (72 shortcuts = 24 rows x 3 pairs)
#block(width: 100%, fill: rtech-excel, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[X  |  सेक्शन B : MICROSOFT EXCEL 365 — 72 हाई-स्पीड अकाउंटिंग, MIS व फॉर्मूला शॉर्टकट (046 – 117)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F0FDF4") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("046", rtech-excel) #kbd[Ctrl + T]], [#hl-g[डेटा को स्मार्ट टेबल में बदलें]],
    [#nb("047", rtech-excel) #kbd[Alt + =]], [#hl-y[तुरंत AutoSum (=SUM) लगाएं]],
    [#nb("048", rtech-excel) #kbd[Ctrl + E]], [#hl-b[फ्लैश फिल (ऑटो पैटर्न भरें)]],
    [#nb("049", rtech-excel) #kbd[Ctrl + Alt + V → V]], [#hl-y[केवल वैल्यू पेस्ट करें (बिना फॉर्मूला)]],
    [#nb("050", rtech-excel) #kbd[Ctrl + Alt + V → E]], [पंक्तियों और कॉलम की अदला-बदली],
    [#nb("051", rtech-excel) #kbd[F4 (in Formula)]], [#hl-o[सेल लॉक (\$A\$1) साइकिल बदलें]],
    [#nb("052", rtech-excel) #kbd[F4 (in Sheet)]], [पिछला फॉर्मेट दोहराएं],
    [#nb("053", rtech-excel) #kbd[F2]], [#hl-g[सेल के अंदर फॉर्मूला एडिट करें]],
    [#nb("054", rtech-excel) #kbd[Alt + Enter]], [उसी सेल में नई लाइन शुरू करें],
    [#nb("055", rtech-excel) #kbd[Ctrl + D / Ctrl + R]], [नीचे (Down) / दाएं (Right) भरें],
    [#nb("056", rtech-excel) #kbd[Ctrl + Arrow Keys]], [#hl-b[डेटा टेबल के अंतिम छोर पर जाएं]],
    [#nb("057", rtech-excel) #kbd[Ctrl + Shift + Arrow]], [#hl-b[डेटा के अंतिम छोर तक चुनें]],
    [#nb("058", rtech-excel) #kbd[Ctrl + Home / End]], [सेल A1 या अंतिम सेल पर जाएं],
    [#nb("059", rtech-excel) #kbd[Shift + Space]], [पूरी वर्तमान पंक्ति (Row) चुनें],
    [#nb("060", rtech-excel) #kbd[Ctrl + Space]], [पूरा वर्तमान कॉलम चुनें],
    [#nb("061", rtech-excel) #kbd[Ctrl + A / Ctrl + \*]], [पूरा जुड़ा हुआ डेटा टेबल चुनें],
    [#nb("062", rtech-excel) #kbd[Ctrl + Shift + +]], [नई पंक्ति या कॉलम डालें],
    [#nb("063", rtech-excel) #kbd[Ctrl + - (Minus)]], [चुनी गई पंक्ति या कॉलम हटाएं],
    [#nb("064", rtech-excel) #kbd[Ctrl + 9 / Ctrl + 0]], [चुनी गई रो / कॉलम छुपाएं],
    [#nb("065", rtech-excel) #kbd[Ctrl + Shift + 9 / 0]], [छुपी हुई रो / कॉलम दिखाएं],
    [#nb("066", rtech-excel) #kbd[Ctrl + 1]], [#hl-y[Format Cells विंडो खोलें]],
    [#nb("067", rtech-excel) #kbd[Ctrl + Shift + \$]], [करेंसी (₹) फॉर्मेट लगाएं],
    [#nb("068", rtech-excel) #kbd[Ctrl + Shift + %]], [प्रतिशत (%) फॉर्मेट लगाएं],
    [#nb("069", rtech-excel) #kbd[Ctrl + Shift + \#]], [तारीख (DD-MMM-YY) फॉर्मेट],
    [#nb("070", rtech-excel) #kbd[Ctrl + Shift + !]], [कॉमा नंबर (1,000.00) फॉर्मेट],
    [#nb("071", rtech-excel) #kbd[Ctrl + 5]], [टेक्स्ट के बीच लाइन (Strike)],
    [#nb("072", rtech-excel) #kbd[Ctrl + Shift + &]], [सेल के चारों ओर बॉर्डर लगाएं],
    [#nb("073", rtech-excel) #kbd[Ctrl + Shift + \_]], [सेल से सभी बॉर्डर हटाएं],
    [#nb("074", rtech-excel) #kbd[Alt + H + O + I]], [#hl-g[कॉलम की चौड़ाई ऑटो-फ़िट करें]],
    [#nb("075", rtech-excel) #kbd[Alt + H + O + A]], [पंक्ति की ऊंचाई ऑटो-फ़िट करें],
    [#nb("076", rtech-excel) #kbd[Alt + H + M + C]], [चुने गए सेल मर्ज और सेंटर करें],
    [#nb("077", rtech-excel) #kbd[Alt + H + W]], [सेल में टेक्स्ट रैप (Wrap) करें],
    [#nb("078", rtech-excel) #kbd[Ctrl + Shift + L]], [#hl-y[फ़िल्टर बटन चालू / बंद करें]],
    [#nb("079", rtech-excel) #kbd[Alt + A + C]], [सभी लगे फ़िल्टर एक साथ साफ़ करें],
    [#nb("080", rtech-excel) #kbd[Alt + Down Arrow]], [फ़िल्टर या ड्रॉपडाउन लिस्ट खोलें],
    [#nb("081", rtech-excel) #kbd[Alt + N + V]], [#hl-g[डेटा से तुरंत पिवट टेबल बनाएं]],
    [#nb("082", rtech-excel) #kbd[Alt + F1]], [#hl-b[उसी शीट पर तुरंत चार्ट बनाएं]],
    [#nb("083", rtech-excel) #kbd[F11]], [नई शीट पर बड़ा चार्ट बनाएं],
    [#nb("084", rtech-excel) #kbd[Ctrl + ;]], [#hl-y[आज की स्थिर तारीख डालें]],
    [#nb("085", rtech-excel) #kbd[Ctrl + Shift + :]], [अभी का स्थिर समय डालें],
    [#nb("086", rtech-excel) #kbd[Ctrl + ~ (Tilde)]], [#hl-o[शीट के सभी फॉर्मूले एक साथ देखें]],
    [#nb("087", rtech-excel) #kbd[Ctrl + \[]], [फॉर्मूला में उपयोग हुए सेल चुनें],
    [#nb("088", rtech-excel) #kbd[Ctrl + \]]], [इस सेल पर निर्भर फॉर्मूले चुनें],
    [#nb("089", rtech-excel) #kbd[Shift + F3]], [फ़ंक्शन विज़ार्ड (fx) खोलें],
    [#nb("090", rtech-excel) #kbd[Alt + M + V]], [फॉर्मूला स्टेप-बाय-स्टेप जांचें],
    [#nb("091", rtech-excel) #kbd[Ctrl + Shift + U]], [फॉर्मूला बार बड़ा / छोटा करें],
    [#nb("092", rtech-excel) #kbd[F9 / Shift + F9]], [फॉर्मूले दोबारा कैलकुलेट करें],
    [#nb("093", rtech-excel) #kbd[Ctrl + PgDn / PgUp]], [अगली / पिछली शीट पर जाएं],
    [#nb("094", rtech-excel) #kbd[Shift + F11]], [नई खाली वर्कशीट जोड़ें],
    [#nb("095", rtech-excel) #kbd[Alt + H + O + R]], [मौजूदा शीट का नाम बदलें],
    [#nb("096", rtech-excel) #kbd[Alt + W + F + F]], [#hl-g[हेडर रो और कॉलम फ्रीज करें]],
    [#nb("097", rtech-excel) #kbd[Alt + W + VG]], [ग्रिडलाइन दिखाएं या छुपाएं],
    [#nb("098", rtech-excel) #kbd[Shift + F2]], [सेल नोट / कमेंट जोड़ें],
    [#nb("099", rtech-excel) #kbd[Ctrl + Alt + M]], [थ्रेडेड कमेंट (M365) जोड़ें],
    [#nb("100", rtech-excel) #kbd[Alt + Shift + Right]], [रो या कॉलम का ग्रुप बनाएं],
    [#nb("101", rtech-excel) #kbd[Alt + Shift + Left]], [रो या कॉलम का ग्रुप हटाएं],
    [#nb("102", rtech-excel) #kbd[Alt + A + M]], [#hl-y[डुप्लीकेट डेटा तुरंत हटाएं]],
    [#nb("103", rtech-excel) #kbd[Alt + A + E]], [टेक्स्ट को कॉलम में बांटें],
    [#nb("104", rtech-excel) #kbd[Alt + A + V + V]], [#hl-b[सेल ड्रॉपडाउन लिस्ट (Validation)]],
    [#nb("105", rtech-excel) #kbd[Alt + A + R + A]], [#hl-g[सभी डेटा और पिवट रिफ्रेश करें]],
    [#nb("106", rtech-excel) #kbd[Alt + H + L]], [कंडीशनल फॉर्मेटिंग (रंग नियम)],
    [#nb("107", rtech-excel) #kbd[Ctrl + K]], [वेब या शीट हाइपरलिंक डालें],
    [#nb("108", rtech-excel) #kbd[Ctrl + F3]], [नाम प्रबंधक (Named Ranges)],
    [#nb("109", rtech-excel) #kbd[Ctrl + Shift + F3]], [हेडर से ऑटो रेंज नाम बनाएं],
    [#nb("110", rtech-excel) #kbd[Alt + ;]], [#hl-o[केवल दिखने वाले सेल चुनें (सबटोटल)]],
    [#nb("111", rtech-excel) #kbd[F5 → Alt + S → K]], [खाली सेल चुनें (Go To Special)],
    [#nb("112", rtech-excel) #kbd[Ctrl + Enter]], [#hl-y[सभी चुने सेल में एक साथ भरें]],
    [#nb("113", rtech-excel) #kbd[Ctrl + F1]], [रिबन मेन्यू छुपाएं / दिखाएं],
    [#nb("114", rtech-excel) #kbd[Ctrl + P / F12]], [प्रिंट या Save As करें],
    [#nb("115", rtech-excel) #kbd[Ctrl + PageUp/Dn]], [वर्कशीट टैब तेजी से बदलें],
    [#nb("116", rtech-excel) #kbd[Ctrl + Tab]], [खुली एक्सेल फ़ाइलों में स्विच],
    [#nb("117", rtech-excel) #kbd[Ctrl + W / Alt+F4]], [वर्कबुक या एक्सेल बंद करें],
  )
]
#v(3pt)

// Band 3: POWERPOINT (33 shortcuts = 11 rows x 3 pairs)
#block(width: 100%, fill: rtech-ppt, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[P  |  सेक्शन C : MICROSOFT POWERPOINT 365 — 33 डिज़ाइन व प्रेजेंटर शॉर्टकट (118 – 150)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#FFF7ED") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("118", rtech-ppt) #kbd[Ctrl + M]], [#hl-y[नई स्लाइड जोड़ें]],
    [#nb("119", rtech-ppt) #kbd[Ctrl + D]], [#hl-g[स्लाइड या ऑब्जेक्ट डुप्लीकेट करें]],
    [#nb("120", rtech-ppt) #kbd[Ctrl + G]], [#hl-b[कई आकृतियों को ग्रुप करें]],
    [#nb("121", rtech-ppt) #kbd[Ctrl + Shift + G]], [ग्रुप को अलग-अलग (Ungroup) करें],
    [#nb("122", rtech-ppt) #kbd[Ctrl + Shift + C/V]], [ऑब्जेक्ट स्टाइल कॉपी / पेस्ट],
    [#nb("123", rtech-ppt) #kbd[Ctrl + Drag Mouse]], [खींचकर तुरंत कॉपी बनाएं],
    [#nb("124", rtech-ppt) #kbd[Shift + Drag]], [समान अनुपात में साइज बदलें],
    [#nb("125", rtech-ppt) #kbd[Alt + Arrow Keys]], [#hl-y[ऑब्जेक्ट को 1px सटीक सरकाएं]],
    [#nb("126", rtech-ppt) #kbd[Alt + H + G + A]], [#hl-g[ऑब्जेक्ट को ठीक बीच में रखें]],
    [#nb("127", rtech-ppt) #kbd[Alt + H + G + H/V]], [आकृतियों के बीच बराबर दूरी रखें],
    [#nb("128", rtech-ppt) #kbd[Alt + F10]], [#hl-b[सिलेक्शन पेन (लेयर क्रम) खोलें]],
    [#nb("129", rtech-ppt) #kbd[Ctrl + \] / \[]], [स्लाइड टेक्स्ट साइज बड़ा/छोटा करें],
    [#nb("130", rtech-ppt) #kbd[Alt + Shift + L/R]], [बुलेट पॉइंट लेवल आगे/पीछे करें],
    [#nb("131", rtech-ppt) #kbd[Alt + Shift + Up/Dn]], [बुलेट पॉइंट ऊपर या नीचे करें],
    [#nb("132", rtech-ppt) #kbd[Ctrl + Up / Down]], [स्लाइड को ऊपर या नीचे खिसकाएं],
    [#nb("133", rtech-ppt) #kbd[Ctrl + Home / End]], [पहली या आखिरी स्लाइड पर जाएं],
    [#nb("134", rtech-ppt) #kbd[F6 / Tab]], [स्लाइड के सभी एलिमेंट पर जाएं],
    [#nb("135", rtech-ppt) #kbd[Alt + N + P]], [स्लाइड में इमेज/फोटो डालें],
    [#nb("136", rtech-ppt) #kbd[Alt + J + P + X]], [#hl-o[फोटो का बैकग्राउंड तुरंत हटाएं]],
    [#nb("137", rtech-ppt) #kbd[Ctrl + K]], [स्लाइड पर हाइपरलिंक जोड़ें],
    [#nb("138", rtech-ppt) #kbd[Alt + W + L / M]], [नॉर्मल या स्लाइड मास्टर व्यू],
    [#nb("139", rtech-ppt) #kbd[Ctrl + Shift + G]], [स्लाइड गाइडलाइन्स दिखाएं/छुपाएं],
    [#nb("140", rtech-ppt) #kbd[F5]], [#hl-y[शुरू (Slide 1) से प्रेजेंटेशन चलाएं]],
    [#nb("141", rtech-ppt) #kbd[Shift + F5]], [#hl-g[मौजूदा स्लाइड से प्रेजेंटेशन चलाएं]],
    [#nb("142", rtech-ppt) #kbd[Alt + F5]], [#hl-b[प्रेजेंटर व्यू (नोट्स + टाइमर)]],
    [#nb("143", rtech-ppt) #kbd[B / W (in Show)]], [#hl-o[स्क्रीन काली/सफ़ेद कर फोकस पाएं]],
    [#nb("144", rtech-ppt) #kbd[Ctrl + L (in Show)]], [#hl-y[लाइव लाल लेज़र पॉइंटर चालू करें]],
    [#nb("145", rtech-ppt) #kbd[Ctrl + P / E (Show)]], [स्लाइड पर पेन से लिखें / मिटाएं],
    [#nb("146", rtech-ppt) #kbd[Number + Enter]], [नंबर दबाकर सीधे स्लाइड पर जाएं],
    [#nb("147", rtech-ppt) #kbd[G (during Show)]], [सभी स्लाइड का ग्रिड एक साथ देखें],
    [#nb("148", rtech-ppt) #kbd[Ctrl + S (in Show)]], [टाइटल से स्लाइड खोजकर खोलें],
    [#nb("149", rtech-ppt) #kbd[N / P (or Space)]], [अगली या पिछली स्लाइड पर जाएं],
    [#nb("150", rtech-ppt) #kbd[Esc]], [स्लाइड शो बंद कर एडिटर में लौटें],
  )
]
#v(2.5pt)
#block(width: 100%, fill: rtech-navy, inset: (x: 5pt, y: 1.8pt), radius: (top: 2pt))[
  #text(size: 6.5pt, weight: "black", fill: white)[⊞  |  बोनस : ऑफिस स्पीड के 6 Windows प्रो शॉर्टकट (Word, Excel व PPT के साथ उपयोग करें)]
]
#block(width: 100%)[
  #set text(size: 6pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F8FAFC") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2pt),
    [#nb("W1", rtech-navy) #kbd[Win + V]], [क्लिपबोर्ड हिस्ट्री (25 आइटम!)],
    [#nb("W2", rtech-navy) #kbd[Win+Shift+S]], [तुरंत स्क्रीनशॉट लें],
    [#nb("W3", rtech-navy) #kbd[Win + L]], [PC तुरंत लॉक करें (सुरक्षा)],
    [#nb("W4", rtech-navy) #kbd[Win + D]], [डेस्कटॉप दिखाएं / छुपाएं],
    [#nb("W5", rtech-navy) #kbd[Win + E]], [फ़ाइल एक्सप्लोरर खोलें],
    [#nb("W6", rtech-navy) #kbd[Alt + Tab]], [खुले ऐप्स तुरंत बदलें],
  )
]
#v(3pt)
#box(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.65pt + dark-border, radius: 2.5pt, inset: (x: 6pt, y: 3.5pt))[
  #text(size: 6.2pt, fill: rtech-navy)[हाइलाइटर गाइड:  #hl-y[एग्ज़ाम व इंटरव्यू ज़रूरी]   #hl-b[फॉर्मेटिंग व नेविगेशन]   #hl-g[टेबल, फॉर्मूले व डेटा पावर]   #hl-o[गलती रोकें]   |   ★ बोनस ट्रिक: बिना माउस काम करने को किसी भी ऐप में 1 बार #kbd[Alt] दबाएं!]
]
#v(1fr)
#grid(
  columns: (1fr, 1.15fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEFCE8"), stroke: (left: 3pt + rgb("#CA8A04"), rest: 0.6pt + dark-border), radius: 2.5pt, inset: 4pt)[
      #text(size: 6.3pt, weight: "bold", fill: rgb("#854D0E"))[💡 क्या आप जानते हैं? कीबोर्ड शॉर्टकट हर साल आपके *8 पूरे कार्यदिवस (64+ घंटे)* बचाते हैं!]
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#EFF6FF"), stroke: (left: 3pt + rtech-blue, rest: 0.6pt + dark-border), radius: 2.5pt, inset: 4pt)[
      #text(size: 6.3pt, style: "italic", weight: "bold", fill: rtech-navy)[🔥 "स्पीड से आत्मविश्वास आता है: रोज़ इस वॉल से सिर्फ 5 शॉर्टकट याद करें—30 दिन में आप 90% लोगों से तेज़ होंगे!"]
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 07: SECTION 4 — OUTLOOK 365, ONEDRIVE CLOUD & WORKPLACE ETHICS
// =============================================================================
#app-banner("सेक्शन 4  |  OUTLOOK 365, ONEDRIVE क्लाउड और वर्कप्लेस एथिक्स", "ईमेल अनुशासन · Exchange सर्वर सेटअप · रियल-टाइम क्लाउड को-ऑथरिंग", rtech-outlook)

#section-banner(num: "भाग 4.1", title: "Outlook 4D इनबॉक्स ज़ीरो व OneDrive क्लाउड वर्कफ़्लो ब्लूप्रिंट", color: rtech-outlook)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/outlook_cloud_workflow_visual.png", width: 96%)
  ]
]

#section-banner(num: "भाग 4.2", title: "Outlook अकाउंट सेटअप (Exchange vs IMAP), Quick Steps व टॉप 10 ईमेल कीज़", color: rtech-outlook)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.9pt,
  text(size: 6.5pt, weight: "bold", fill: white)[फ़ीचर / प्रोटोकॉल],
  text(size: 6.5pt, weight: "bold", fill: white)[कॉर्पोरेट कार्यप्रणाली (यह कैसे काम करता है)],
  text(size: 6.5pt, weight: "bold", fill: white)[प्रो एक्शन व शॉर्टकट],
  [#hl-b[Exchange (M365) vs IMAP]], [Exchange लैपटॉप व मोबाइल दोनों पर ईमेल, कैलेंडर और कॉन्टैक्ट सिंक रखता है। पुराना POP3 सर्वर से ईमेल मिटा देता है!], [ऑफिस में हमेशा Microsoft Exchange / 365 चुनें — POP3 से हमेशा बचें।],
  [#hl-y[Quick Steps व Rules]], [1 शॉर्टकट में Read मार्क + फ़ोल्डर में मूव + फ़्लैग करें! बैंक OTP व सर्वर अलर्ट को ऑटोमैटिक अलग फ़ोल्डर में भेजें।], [Home → Quick Steps → #kbd[Ctrl+Shift+1] सेट कर 1 सेकंड में रूटीन ईमेल निपटाएं।],
  [#hl-g[Scheduling Assistant]], [एक साथ 10 टीम सदस्यों का खाली कैलेंडर स्लॉट देखें! Delay Delivery से रात को लिखा मेल सुबह 9 AM पर भेजें।], [New Meeting → Scheduling Assistant; Options → Delay Delivery का उपयोग करें।],
  [टॉप 10 Outlook कीज़], [#kbd[Ctrl+N] नया आइटम · #kbd[Ctrl+Shift+M] नया मेल · #kbd[Ctrl+R] रिप्लाई · #kbd[Ctrl+Shift+R] रिप्लाई ऑल · #kbd[Ctrl+F] फॉरवर्ड।], [#kbd[Ctrl+Enter] भेजें · #kbd[Ctrl+1/2/3] मेल/कैलेंडर · #kbd[Ctrl+Q] Read · #kbd[Backspace] आर्काइव।],
)

#section-banner(num: "भाग 4.3", title: "1TB OneDrive क्लाउड गवर्नेंस और ऑफिस डिजिटल एथिक्स (नियम)", color: rtech-emerald)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.9pt,
  text(size: 6.5pt, weight: "bold", fill: white)[क्लाउड / एथिक्स स्तंभ],
  text(size: 6.5pt, weight: "bold", fill: white)[गोल्डन ऑफिस नियम (सीनियर्स फ्रेशर्स से क्या उम्मीद रखते हैं)],
  text(size: 6.5pt, weight: "bold", fill: white)[यह बड़ी गलती कभी न करें],
  [#hl-b[लाइव Co-Authoring + AutoSave]], [OneDrive/SharePoint में फ़ाइल रखें → AutoSave से हर अक्षर तुरंत सेव होता है; 5 लोग एक साथ 1 Excel पर काम करें!], [बार-बार `Report_Final_v2_new.xlsx` ईमेल पर भेजकर अलग-अलग कॉपी बनाना!],
  [#hl-g[180-दिन Version History]], [OneDrive में फ़ाइल पर Right-click → Version History से पुरानी सही फ़ाइल (डिलीट/ख़राब होने पर) वापस लाएं।], [सिर्फ डेस्कटॉप पर फ़ाइल रखकर बिजली जाने या क्रैश होने पर 8 घंटे की मेहनत खोना।],
  [#hl-o[मानक ISO फ़ाइल नाम]], [हमेशा साफ़ नाम लिखें: `2027-11-25_ClientName_GST_v1.0.xlsx` — जिससे ऑडिट व सर्च आसान हो।], [ज़रूरी ऑफिस काम को `abc123.xlsx`, `New Sheet.xlsx` या `Final_final2.xlsx` नाम से सेव करना।],
  [डेटा सुरक्षा व स्क्रीन लॉक], [सैलरी/क्लाइंट शीट हमेशा 'Specific People' से शेयर करें (कभी 'Anyone with link' नहीं)। सीट छोड़ते समय #kbd[Win+L] दबाएं!], [कंपनी का गोपनीय डेटा निजी WhatsApp/Gmail पर भेजना या कंप्यूटर खुला छोड़ देना।],
)

#section-banner(num: "भाग 4.4", title: "4 तैयार कॉर्पोरेट ईमेल टेम्पलेट्स + OneDrive आइकन व Microsoft Forms बोनस", color: rtech-blue)
#table(
  columns: (1.45fr, 4.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.9pt,
  [#hl-b[1. जॉब / इंटर्नशिप मेल]], [Subject: `Application: Accounts/MIS Trainee — [आपका नाम]` | शुरुआत: `Dear Hiring Manager, संलग्न है मेरा 1-पेज ATS रिज्यूमे। मैं XLOOKUP व Power Query रिपोर्ट ऑटोमेट करता हूँ...`],
  [#hl-g[2. छुट्टी (Leave) का ईमेल]], [Subject: `Leave Request: 28-Nov-2027 (1 Day) — [आपका नाम]` | संक्षिप्त कारण, काम किसे सौंपा है उनका नाम लिखें और आपातकाल में फोन उपलब्धता बताएं।],
  [#hl-o[3. क्लाइंट पेमेंट रिमाइंडर]], [Subject: `Gentle Reminder: Invoice #INV-204 (₹45,000) Due 25-Nov` | विनम्र भाषा + PDF बिल अटैच करें + NEFT/UPI विवरण स्पष्ट लिखें।],
  [4. OneDrive आइकन व Forms], [#hl-y[नीला बादल] = केवल ऑनलाइन (0 MB डिस्क) · हरा टिक = ऑफलाइन उपलब्ध · ठोस हरा = हमेशा सेव। Microsoft Forms से सर्वे डेटा सीधे Excel में आता है!],
)
#v(2pt)
#block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 2.5pt, inset: 3pt)[
  #text(size: 6.4pt, weight: "black", fill: rtech-navy)[🤖 2027 बोनस : 3 M365 Copilot / AI प्रॉम्प्ट्स]\
  #v(1.5pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 4pt,
    ..([#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-b[Word AI]: "इस 20-पेज कॉन्ट्रैक्ट के 5 मुख्य जोखिम बताएं"]]], [#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-g[Excel AI]: "Sheet1 व Sheet2 के लिए XLOOKUP + IFERROR लिखें"]]], [#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-o[PPT AI]: "इस डॉक्यूमेंट से 5-स्लाइड 16:9 पिच आउटलाइन बनाएं"]]])
  )
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: (left: 3.5pt + rtech-outlook, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-outlook)[💡 क्या आप जानते हैं? (ऑफिस तथ्य)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[ऑफिस कर्मचारी दिन का *28% समय* ईमेल में लगाते हैं! 4D इनबॉक्स ज़ीरो व Quick Steps (`Ctrl+Shift+1`) रोज़ आपके 1.5 घंटे बचाते हैं।]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-मिनट अभ्यास: OneDrive में फ़ाइल सेव करें → Right-click → Version History → 180-दिन रोलबैक देखें!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-outlook)[🔥 "साफ़ इनबॉक्स, सुरक्षित डेटा और सही कार्य-नैतिकता ऑफिस में आपका भरोसा पक्का करती है।"]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_cloud_team.png", height: 62pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 08: SECTION 5 — AUTHOR HUB, 4 LIVE QR CODES & TOP 8 MNC INTERVIEW Q&A
// =============================================================================
#app-banner("सेक्शन 5  |  लेखक मेंटरशिप हब, लाइव QR कोड और MNC इंटरव्यू प्रश्नोत्तर", "राहुल पटेल · IANT पालनपुर · डायरेक्ट QR चैनल · टॉप 6 कॉर्पोरेट Q&A", rgb("#047857"))

#section-banner(num: "भाग 5.1", title: "अपने मेंटर से मिलें: राहुल पटेल — क्लासरूम से कॉर्पोरेट जॉब तक का सेतु", color: rtech-navy)
#block(
  width: 100%,
  stroke: 0.65pt + dark-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: 5pt,
  [
    #grid(
      columns: (58pt, 1fr),
      gutter: 8pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-blue,
          radius: 5pt,
          clip: true,
          width: 52pt,
          height: 62pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 10pt, weight: "black", fill: rtech-navy)[Rahul Patel]\
        #v(1pt)
        #text(size: 7pt, weight: "bold", fill: rtech-blue)[संस्थापक एवं प्रमुख सिस्टम्स आर्किटेक्ट · RTechLab Publications]\
        #text(size: 7pt, weight: "bold", fill: rgb("#047857"))[निदेशक एवं सीनियर टेक्निकल एक्सपर्ट · IANT कंप्यूटर एजुकेशन, पालनपुर (गुजरात)]\
        #v(2pt)
        #text(size: 6.6pt, fill: rtech-navy)[*10+ वर्षों के गहन एंटरप्राइज़ IT, क्लाउड और कॉर्पोरेट प्रशिक्षण अनुभव* के साथ, राहुल ने छोटे शहरों के *3,000+ छात्रों* को देश की शीर्ष IT व अकाउंटिंग कंपनियों तक पहुँचाया है। उनका सपना है कि भारत के हर छात्र को *केवल ₹22 में ₹2,200 स्तर की प्रैक्टिकल शिक्षा* मिले।]
      ]
    )
  ]
)

#section-banner(num: "भाग 5.2", title: "QR कोड स्कैन करें: मुफ़्त टूल्स, वीडियो ट्यूटोरियल, पोर्टफोलियो व WhatsApp ग्रुप", color: rtech-blue)
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#F0F9FF"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rtech-blue)[लेखक पोर्टफोलियो]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[YouTube चैनल]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[`RTechLabOfficial` ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[Instagram हब]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[`rtechlabofficial` ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[WhatsApp कम्युनिटी]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[Join Channel ↗]]
      ]
    ]
  ],
)

#section-banner(num: "भाग 5.3", title: "MNC व BPO टेक्निकल इंटरव्यू के टॉप 6 प्रश्न और सटीक विजेता उत्तर", color: rtech-excel)
#table(
  columns: (2.05fr, 3.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  text(size: 6.5pt, weight: "bold", fill: white)[इंटरव्यू प्रश्न (MIS / IT / Accounts जॉब)],
  text(size: 6.5pt, weight: "bold", fill: white)[सटीक एक्सपर्ट उत्तर (इंटरव्यू में यही बोलें)],
  [#text(weight: "bold", fill: rtech-navy)[Q1: XLOOKUP हर तरह से VLOOKUP से बेहतर क्यों है?]], [XLOOKUP डिफ़ॉल्ट रूप से Exact Match करता है, बाएँ/दाएँ/ऊपर/नीचे खोजता है, एक साथ कई कॉलम लौटाता है, व नए कॉलम जोड़ने पर कभी टूटता नहीं है।],
  [#text(weight: "bold", fill: rtech-navy)[Q2: Word में Section Break और Page Break में क्या अंतर है?]], [Page Break सिर्फ टेक्स्ट को अगले पेज पर ले जाता है। Section Break नया स्वतंत्र खंड बनाता है—जिससे पोर्ट्रेट रिपोर्ट के बीच एक Landscape पेज जुड़ सकता है।],
  [#text(weight: "bold", fill: rtech-navy)[Q3: Power Query में 'Unpivot Columns' \#1 स्किल क्यों है?]], [यह Jan–Dec वाली चौड़ी टेबल को 2 वर्टिकल डेटाबेस कॉलम (Attribute व Value) में बदलता है—जो Pivot Table और Power BI मॉडल के लिए अनिवार्य है।],
  [#text(weight: "bold", fill: rtech-navy)[Q4: Excel में LET() फ़ंक्शन गणना को तेज़ कैसे बनाता है?]], [LET मध्यवर्ती रेंज को वेरिएबल नाम दे देता है जिससे Excel भारी रेंज को बार-बार कैलकुलेट करने के बजाय सिर्फ एक बार गिनकर 5x तेज़ परिणाम देता है।],
  [#text(weight: "bold", fill: rtech-navy)[Q5: PowerPoint में `!!Logo` के साथ Morph एनिमेशन कैसे काम करता है?]], [स्लाइड डुप्लीकेट कर दूसरी स्लाइड पर आकार/जगह बदलें और Morph ट्रांज़िशन लगाएं। Selection Pane में `!!` नाम देने से दोनों ऑब्जेक्ट स्मूथ मूव करते हैं।],
  [#text(weight: "bold", fill: rtech-navy)[Q6: Outlook में Inbox Zero का 4D नियम क्या है?]], [2 मिनट से कम काम हो तो Do (तुरंत करें); किसी और का हो तो Delegate करें; बड़े काम को Calendar पर Defer करें; और अनावश्यक मेल Delete/Archive करें।],
  [#text(weight: "bold", fill: rtech-navy)[Q7: Pivot Table और Power Query — कब क्या इस्तेमाल करें?]], [Power Query गंदी CSV/ERP फ़ाइलों को विश्लेषण से पहले साफ़, मर्ज व Unpivot करता है (ETL)। Pivot Table उस साफ़ डेटा का सारांश व चार्ट बनाता है।],
  [#text(weight: "bold", fill: rtech-navy)[Q8: फॉर्मूला लॉक रखकर यूज़र को केवल डेटा टाइप करने की अनुमति कैसे दें?]], [इनपुट सेल चुनें → `Ctrl+1` → Protection में 'Locked' अनचेक करें। फिर Review → Protect Sheet लगाएं। अब यूज़र फॉर्मूला कभी डिलीट नहीं कर पाएगा!],
)

#section-banner(num: "30-दिन प्लान", title: "30-दिन का ऑफिस 365 मास्टरी रोडमैप (रोज़ 15 मिनट अभ्यास = ऑफिस प्रो)", color: rtech-ppt)
#table(
  columns: (1.25fr, 4.75fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  [#hl-b[सप्ताह 1 · MS Word]], [अपना ATS रिज्यूमे और 1 कॉलेज रिपोर्ट `Heading 1–3`, `Auto-TOC`, Section Break से दोबारा बनाएं और PDF (#kbd[Ctrl+S] आदत) निकालें।],
  [#hl-g[सप्ताह 2 · फॉर्मूले]], [50-पंक्ति के सैंपल डेटा पर `XLOOKUP`, `FILTER`, `SUMIFS`, `TEXTSPLIT` व `LET` का अभ्यास करें जब तक `#N/A` एरर शून्य न हो जाए।],
  [#hl-y[सप्ताह 3 · PQ व PPT]], [1 Power Query `Unpivot` + पिवट Slicer डैशबोर्ड बनाएं, और केवल Slide Master से 5-स्लाइड 16:9 `Morph` प्रेजेंटेशन तैयार करें।],
  [#hl-o[सप्ताह 4 · 150 शॉर्टकट]], [पेज 6 को कीबोर्ड के पास रखें! रोज़ 10 शॉर्टकट अभ्यास कर 150 कीज़ को आदत बनाएं — फिर MNC इंटरव्यू Q&A दोहराएं!],
)
#v(1fr)
#block(width: 100%, fill: rgb("#F0FDF4"), stroke: (left: 3.5pt + rgb("#047857"), rest: 0.65pt + dark-border), radius: 3.5pt, inset: 5pt)[
  #grid(
    columns: (1.8fr, 0.9fr),
    gutter: 6pt,
    align: (left + horizon, center + horizon),
    [
      #text(size: 7pt, weight: "black", fill: rgb("#047857"))[🏆 RTECHLAB संकल्प व 30-दिन इंस्टाग्राम चैलेंज]\
      #v(2pt)
      #text(size: 6.45pt, weight: "bold", fill: rtech-navy)[रोज़ 15 मिनट अभ्यास = करियर में बड़ा बदलाव! 30 दिन में 150 शॉर्टकट मास्टर करें, अपने डेस्क पर पेज 6 की फोटो पोस्ट कर Instagram पर `@rtechlabofficial` को टैग करें!]
    ],
    [
      #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
        #image("02_BRAND_ASSETS/office_word_desk.png", height: 56pt, fit: "contain")
      ]
    ]
  )
]
#v(4pt)
#align(center)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 0.9pt + rtech-blue,
    radius: 3.5pt,
    inset: (x: 8pt, y: 4pt),
    text(size: 6.7pt, weight: "bold", fill: rtech-blue)[🚀 संपूर्ण मास्टरी के लिए 113-पेज की इलस्ट्रेटेड मास्टर बुक + 6 प्रैक्टिकल Excel टेम्पलेट्स (.xlsx) पाएँ: ₹49 बुक या ₹149 सूट #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]]
  )
]
