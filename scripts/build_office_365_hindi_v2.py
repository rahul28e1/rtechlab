import os
import shutil
import subprocess
import fitz  # PyMuPDF

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SOURCE_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\07_SOURCE_FILES")
ASSETS_DIR = os.path.join(SOURCE_DIR, "02_BRAND_ASSETS")
OUTPUT_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION")
PREVIEWS_DIR = os.path.join(OUTPUT_DIR, "previews_hi")
os.makedirs(SOURCE_DIR, exist_ok=True)
os.makedirs(ASSETS_DIR, exist_ok=True)
os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(PREVIEWS_DIR, exist_ok=True)

typ_path = os.path.join(SOURCE_DIR, "office_365_cheat_sheet_22rs_hi.typ")
pdf_path = os.path.join(OUTPUT_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-Hindi.pdf")
public_pdf = os.path.join(BASE_DIR, r"public\downloads\Office-365-Quick-Desk-Reference-Cheat-Sheet-Hindi.pdf")

typst_content = r'''// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE PRODUCTIVITY DESK CHEAT SHEET (HINDI)
// Exactly 8 Pages · Printable Daily Desk Companion · Edition 1
// Author: Rahul Patel (Founder & Lead Systems Architect, RTechLab)
// Official Portal: https://rtechlab.com
// =============================================================================

#set document(
  title: "Microsoft 365 Enterprise Desk Reference & Cheat Sheet (Hindi)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 11mm, bottom: 9mm, left: 9.5mm, right: 9.5mm),
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 11pt, baseline: 1pt)[#image("02_BRAND_ASSETS/favicon-32x32.png", height: 11pt)]
          #h(4pt)
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
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.4pt + rgb("#E2E8F0"))
      #v(2.5pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.8pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] टेक्नोलॉजी व्यावहारिक रूप में · प्रिंट कर डेस्क पर रखें · निःशुल्क टूल्स: #link("https://rtechlab.com/hi/tools")[*rtechlab.com/hi/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 6pt, y: 1.5pt),
            text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[पृष्ठ #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
  size: 7.4pt,
  fill: rgb("#1E293B"),
  spacing: 100%,
  lang: "hi"
)

#set par(
  justify: true,
  leading: 0.44em,
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
#let rtech-muted = rgb("#64748B")
#let rtech-border = rgb("#E2E8F0")

// Reusable UI Macros
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-o(body) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#body]]
#let kbd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#CBD5E1"), radius: 2pt, inset: (x: 3pt, y: 1pt))[#text(size: 6.8pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-blue) = {
  v(2.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3pt + color, rest: 0.4pt + rtech-border),
    radius: (right: 3pt),
    inset: (x: 6pt, y: 3.5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 4.5pt, y: 1.5pt),
            text(size: 6.5pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 8.8pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(2pt)
}

// =============================================================================
// PAGE 01: THE EXECUTIVE MASTER COVER PAGE (HINDI)
// =============================================================================

#align(center)[
  #v(2pt)
  #text(size: 9pt, weight: "black", tracking: 2pt, fill: rtech-blue)[RTECHLAB वोकेशनल लर्निंग सिस्टम्स]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[प्रौद्योगिकी व्यावहारिक रूप में · गुजरात #1 वोकेशनल आर्किटेक्चर ट्रैक · एडिशन 1]
  #v(2pt)
  #line(length: 100%, stroke: 0.8pt + rgb("#E2E8F0"))
  #v(5pt)

  // Author & Institute Tagline
  #text(size: 11pt, weight: "black", fill: rtech-navy)[लेखक: राहुल पटेल (Rahul Patel)]\
  #v(1pt)
  #text(size: 7.8pt, fill: rtech-muted)[
    डायरेक्टर एवं सीनियर टेक्निकल एक्सपर्ट, IANT कंप्यूटर एजुकेशन, पालनपुर · 10+ वर्ष IT उद्योग अनुभव · 3,000+ छात्र प्रशिक्षित
  ]

  #v(6pt)
  #line(length: 22%, stroke: 1.5pt + rtech-blue)
  #v(6pt)

  // Microsoft 365 Official Suite Visual
  #image("02_BRAND_ASSETS/microsoft_365_official_suite_logo.png", width: 92%)

  #v(6pt)

  // Bestseller Bold Title
  #text(size: 22pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rtech-navy, tracking: 0.5pt)[
    माइक्रोसॉफ्ट 365 एंटरप्राइज
  ]
  #v(2pt)
  #text(size: 12pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rtech-blue, tracking: 0.5pt)[
    व्यावसायिक कॉर्पोरेट डेली डेस्क रेफरेंस व अल्टीमेट चीट शीट
  ]
  #v(2.5pt)
  #text(size: 8pt, weight: "bold", fill: rtech-muted)[
    एडवांस्ड एक्सेल 365 (डायनामिक ऐरे व XLOOKUP) · वर्ड कॉर्पोरेट स्टाइलिंग · एग्जीक्यूटिव पावरपॉइंट · आउटलुक इनबॉक्स जीरो · क्लाउड टीम वर्क
  ]

  #v(5pt)

  // Bestseller Seal Pill
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#38BDF8"),
    radius: 16pt,
    inset: (x: 12pt, y: 2.5pt),
    text(size: 6.8pt, weight: "black", fill: rgb("#0369A1"), tracking: 0.5pt)[
      ★ कॉर्पोरेट एग्जीक्यूटिव्स, MIS एनालिस्ट्स और कॉमर्स व IT छात्रों हेतु #1 दैनिक डेस्क गाइड ★
    ]
  )

  #v(6pt)

  // Mindset & Compounding Growth Quotations Box (Atomic Habits & Think and Grow Rich Inspired)
  #block(
    width: 95%,
    stroke: 1.2pt + rgb("#38BDF8"),
    fill: rgb("#F0F9FF"),
    radius: 6pt,
    inset: (x: 10pt, y: 6pt),
    [
      #grid(
        columns: (1fr, 1fr),
        gutter: 10pt,
        [
          #text(size: 7.2pt, weight: "black", fill: rtech-blue)[⚡ दैनिक चक्रवृद्धि उत्पादकता नियम (Atomic Habits सिद्धांत):]\
          #v(2pt)
          #text(size: 6.8pt, fill: rtech-navy, style: "italic")[
            "आधुनिक कॉर्पोरेट जगत में सफलता दैनिक सूक्ष्म-आदतों का परिणाम है। अपने फॉर्मूले और कीबोर्ड शॉर्टकट्स को रोज़ाना केवल 1% बेहतर बनाना एक वर्ष में 37 गुना अधिक उत्पादकता प्रदान करता है।"
          ]
        ],
        [
          #text(size: 7.2pt, weight: "black", fill: rgb("#047857"))[🎯 व्यावहारिक ज्ञान ही असली शक्ति है (Think & Grow Rich):]\
          #v(2pt)
          #text(size: 6.8pt, fill: rtech-navy, style: "italic")[
            "इंसान का दिमाग जिस चीज़ की कल्पना कर सकता है और उस पर विश्वास कर सकता है, उसे हासिल भी कर सकता है। ज्ञान केवल संभावित शक्ति है; यह वास्तविक शक्ति तब बनता है जब इसे सटीक फॉर्मूलों व दैनिक कार्य निष्पादन में बदला जाए।"
          ]
        ]
      )
    ]
  )

  #v(6pt)

  // 4-Pillar Key Stats Badges
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 6pt,
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[100+]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-excel)[हॉटकीज व शॉर्टकट]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[35+]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-blue)[डायनामिक फॉर्मूले]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[5 APPS]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-word)[एंटरप्राइज सुइट]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[100%]\
          #text(size: 6.5pt, weight: "bold", fill: rgb("#047857"))[MNC प्लेसमेंट रेडी]
        ]
      )
    ]
  )

  #v(6pt)

  // Quick Multi-Page Index Directory Bar
  #block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: (x: 6pt, y: 4pt),
    [
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center,
        [#text(size: 6.5pt, weight: "bold", fill: rtech-excel)[P2: डायनामिक फॉर्मूले]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-excel)[P3: डेटा क्लीनिंग]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-blue)[P4: शॉर्टकट्स व PQ]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-word)[P5: वर्ड स्टाइलिंग]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-ppt)[P6: PPT मास्टर]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-outlook)[P7: आउटलुक व क्लाउड]],
        [#text(size: 6.5pt, weight: "bold", fill: rgb("#047857"))[P8: इंटरव्यू व लेखक]],
      )
    ]
  )
]

#pagebreak()

// =============================================================================
// PAGE 02: MODERN EXCEL 365 CORE FORMULA ENGINE & DYNAMIC ARRAYS (HINDI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[एक्सेल 365: अगली पीढ़ी के डायनामिक ऐरे व लुकअप फॉर्मूले]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[मॉडर्न कैलकुलेशन इंजन · स्पिल रेंज (`#`) · टू-वे मैट्रिक्स लुकअप · `LET` से 5x तेज़ गणना]
]

#section-banner(num: "फॉर्मूला संरचना", title: "आधुनिक डायनामिक ऐरे बनाम पुराना एरे मॉडल (CSE)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.7fr, 2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[फीचर / कॉन्सेप्ट],
  text(size: 7pt, weight: "bold", fill: white)[Excel 365 में कार्यप्रणाली],
  text(size: 7pt, weight: "bold", fill: white)[पुराने Excel से मुख्य अंतर],

  [#text(weight: "bold", fill: rtech-excel)[Dynamic Array Spill]],
  [सिर्फ 1 सेल में फॉर्मूला लिखने पर पूरा टेबल रिजल्ट अपने-आप कई रो व कॉलम में फैल (Spill) जाता है। चारों तरफ नीली बॉर्डर दिखती है।],
  [पहले पूरी रेंज चुनकर #kbd[Ctrl+Shift+Enter] (CSE) दबाना पड़ता था।],

  [#text(weight: "bold", fill: rtech-blue)[Spilled Range Ref (`#`)]],
  [`=A2#` लिखने से पूरे परिणामी स्पिल टेबल का ऑटोमैटिक रेफरेंस मिल जाता है। अगर डेटा बढ़ेगा, तो downstream फॉर्मूले तुरंत अपडेट होंगे।],
  [मैन्युअल रूप से रेंज को बार-बार ड्रैग करना पड़ता था।],

  [#text(weight: "bold", fill: rtech-word)[#text(fill: rtech-excel)[#kbd[#`#SPILL!`]] Error]],
  [जब फॉर्मूले के फैलने वाले रास्ते में कोई दूसरा टेक्स्ट, नंबर या स्पेस आ जाता है, तो यह एरर आता है। सामने वाले सेल को खाली करते ही ठीक हो जाता है।],
  [पुराने में केवल एक अधूरा रिजल्ट आता था या `#VALUE!` एरर।],
)

#section-banner(num: "लुकअप मास्टरी", title: "XLOOKUP मास्टरी (VLOOKUP व INDEX-MATCH का संपूर्ण विकल्प)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.2fr, 2.5fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[फंक्शन व सिंटैक्स],
  text(size: 7pt, weight: "bold", fill: white)[कॉर्पोरेट परिदृश्य (Scenario)],
  text(size: 7pt, weight: "bold", fill: white)[प्रो-टिप / तकनीकी लाभ],

  [#text(weight: "bold", fill: rtech-excel)[`=XLOOKUP(...)`]\
  #text(size: 6.2pt)[(lookup, lkp_arr, ret_arr, [not_found], [match], [search])]],
  [बिना कॉलम नंबर गिने कर्मचारी आईडी से सैलरी खोजना:\
  #hl-g[`=XLOOKUP(F2, A2:A500, D2:D500, "Not Found")`]],
  [#hl-y[बाय-डिफ़ॉल्ट सटीक मिलान (Exact Match)]। बाईं तरफ भी खोज सकता है; नया कॉलम इंसर्ट करने पर कभी फॉर्मूला नहीं टूटता।],

  [#text(weight: "bold", fill: rtech-excel)[Multi-Column XLOOKUP]],
  [एक ही फॉर्मूले से नाम, विभाग और CTC तीनों एक साथ निकालना:\
  #hl-g[`=XLOOKUP(F2, A2:A500, B2:D500)`]],
  [3 अलग-अलग VLOOKUP लगाने की जगह केवल 1 फॉर्मूला तीनों कॉलम में अपने-आप रिजल्ट फैला देता है!],

  [#text(weight: "bold", fill: rtech-blue)[Two-Way Matrix Lookup\ (2D ग्रिड खोज)]],
  [रो में प्रोडक्ट और कॉलम में रीजन के आधार पर मूल्य खोजना:\
  #hl-b[`=XLOOKUP(A10, A2:A6, XLOOKUP(B9, B1:F1, B2:F6))`]],
  [नेस्टेड XLOOKUP रो व कॉलम दोनों हेडर को एक साथ प्रोसेस करता है। पुराने `=INDEX(..., MATCH(), MATCH())` को पूरी तरह रिप्लेस करता है।],

  [#text(weight: "bold", fill: rtech-muted)[रिवर्स सर्च\ (`search_mode = -1`)]],
  [ग्राहक का सबसे अंतिम (Latest) इनवॉइस बिल खोजना:\
  #hl-g[`=XLOOKUP(G2, Cust_Col, Date_Col, , 0, -1)`]],
  [डेटा को बिना सॉर्ट किए नीचे से ऊपर की ओर खोजता है, जिससे सबसे ताज़ा लेनदेन तुरंत मिल जाता है।],
)

#section-banner(num: "डायनामिक टूल्स", title: "FILTER, UNIQUE, SORT व उच्च-गति LET फंक्शन", color: rtech-excel)

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[फंक्शन],
  text(size: 7pt, weight: "bold", fill: white)[कॉर्पोरेट फॉर्मूला उदाहरण],
  text(size: 7pt, weight: "bold", fill: white)[परिणाम व सर्वोत्तम उपयोग],

  [#text(weight: "bold", fill: rtech-excel)[`FILTER`]\ #text(size: 6.2pt)[मल्टी-कंडीशन एक्सट्रैक्ट]],
  [#hl-g[`=FILTER(A2:D100, (B2:B100="IT")*(D2:D100>=50000), "No Records")`]],
  [AND लॉजिक के लिए `*` और OR के लिए `+` लगाएं। बिना पिवट टेबल के लाइव फिल्टर टेबल तैयार होती है।],

  [#text(weight: "bold", fill: rtech-blue)[`UNIQUE`]\ #text(size: 6.2pt)[डुप्लिकेट हटाना]],
  [#hl-b[`=SORT(UNIQUE(FILTER(C2:C100, C2:C100<>"")))`]],
  [ग्राहकों के शहरों से डुप्लिकेट्स हटाकर केवल अनूठी लिस्ट को A से Z क्रम में 1 सेकंड में सॉर्ट करता है।],

  [#text(weight: "bold", fill: rtech-ppt)[`SORTBY`]\ #text(size: 6.2pt)[मल्टी-कॉलम सॉर्ट]],
  [#hl-o[`=SORTBY(A2:C50, B2:B50, 1, C2:C50, -1)`]],
  [कर्मचारियों को पहले विभाग अनुसार (A-Z) और फिर सैलरी अनुसार (घटते क्रम) व्यवस्थित करता है।],

  [#text(weight: "bold", fill: rtech-excel)[`LET`]\ #text(size: 6.2pt)[वेरिएबल डिक्लेरेशन]],
  [#hl-g[`=LET(rev, D2:D100, cogs, E2:E100, margin, (rev-cogs)/rev, IF(margin>0.2, "High", "Low"))`]],
  [#hl-y[गणना की गति 500% बढ़ाता है]। जटिल गणनाओं को वेरिएबल बनाकर सिर्फ एक बार प्रोसेस करता है।],

  [#text(weight: "bold", fill: rtech-word)[`SEQUENCE`]\ #text(size: 6.2pt)[ऑटो सीरियल नंबर]],
  [#hl-b[`=SEQUENCE(COUNTA(A2:A100), 1, 1001, 1)`]],
  [ऑटोमैटिक बिल नंबर (1001, 1002...) बनाता है जो नया डेटा आते ही अपने-आप नीचे बढ़ता जाता है।],
)

#pagebreak()

// =============================================================================
// PAGE 03: EXCEL DATA CLEANING, TEXT FUNCTIONS & CONDITIONAL LOGIC (HINDI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[एक्सेल 365: कॉर्पोरेट डेटा हाइजीन, टेक्स्ट विभाजन व लॉजिक्स]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[बिना फ्लैश फिल के टेक्स्ट अलग करना · मल्टी-कंडीशन एग्रीगेशन · कस्टम सेल फॉर्मेटिंग]
]

#section-banner(num: "टेक्स्ट विभाजन", title: "आधुनिक टेक्स्ट फंक्शन्स (TEXTSPLIT, TEXTBEFORE, TEXTAFTER)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[फंक्शन],
  text(size: 7pt, weight: "bold", fill: white)[फॉर्मूला उदाहरण],
  text(size: 7pt, weight: "bold", fill: white)[व्यावहारिक उपयोग],

  [#text(weight: "bold", fill: rtech-excel)[`TEXTBEFORE`]],
  [#hl-g[`=TEXTBEFORE(A2, "@")`]],
  [ईमेल आईडी में से यूजरनेम अलग करना (`rahul.patel@rtechlab.com` $->$ `rahul.patel`)।],

  [#text(weight: "bold", fill: rtech-excel)[`TEXTAFTER`]],
  [#hl-g[`=TEXTAFTER(A2, "@")`]],
  [कंपनी डोमेन अलग निकालना (`rtechlab.com`) बिना किसी कठिन फॉर्मूले के।],

  [#text(weight: "bold", fill: rtech-blue)[`TEXTSPLIT`]],
  [#hl-b[`=TEXTSPLIT(A2, ",", ";")`]],
  [कॉमा या सेमीकोलन से जुड़े शब्दों को एक साथ कई रो व कॉलम में विभाजित करता है।],

  [#text(weight: "bold", fill: rtech-word)[`TEXTJOIN`]],
  [#hl-b[`=TEXTJOIN(", ", TRUE, FILTER(A2:A50, B2:B50="Pending"))`]],
  [पेंडिंग बिलों या ऑर्डर्स की सूची को एक ही सेल में कॉमा लगाकर समरी रिपोर्ट बनाता है।],
)

#section-banner(num: "मल्टी-कंडीशन एग्रीगेशन", title: "SUMIFS, COUNTIFS, AVERAGEIFS व आधुनिक लॉजिकल राउटिंग", color: rtech-excel)

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[फंक्शन],
  text(size: 7pt, weight: "bold", fill: white)[सिंटैक्स व फॉर्मूला],
  text(size: 7pt, weight: "bold", fill: white)[कॉर्पोरेट बेस्ट प्रैक्टिस],

  [#text(weight: "bold", fill: rtech-excel)[`SUMIFS`]],
  [#hl-g[`=SUMIFS(Sales, Region, "West", Date, ">=2027-01-01")`]],
  [Sum_Range हमेशा #hl-y[सबसे पहले] आती है। लॉजिकल ऑपरेटरों को हमेशा कोट्स (`">=2027-01-01"`) में रखें।],

  [#text(weight: "bold", fill: rtech-excel)[`COUNTIFS`]],
  [#hl-g[`=COUNTIFS(Status, "Delivered", Amount, ">10000")`]],
  [सफल और बड़े ऑर्डरों की कुल संख्या गिनना। खाली सेल न गिनने के लिए `"*"` का प्रयोग करें।],

  [#text(weight: "bold", fill: rtech-blue)[`IFS`]],
  [#hl-b[`=IFS(A2>=90, "Distinction", A2>=75, "First", TRUE, "Pass")`]],
  [बिना उलझे नेस्टेड `IF` के क्रमवार शर्तें जांचना। अंत में हमेशा डिफ़ॉल्ट के लिए `TRUE` लगाएं।],

  [#text(weight: "bold", fill: rtech-word)[`SWITCH`]],
  [#hl-b[`=SWITCH(B2, 1, "Q1-North", 2, "Q2-South", 3, "Q3-East", "Other")`]],
  [किसी मान के बदले सटीक कोड या नाम सेट करना। नेस्टेड `IF` से कहीं अधिक साफ और पढ़ने योग्य।],
)

#section-banner(num: "नंबर फॉर्मेटिंग व दिनांक", title: "कॉर्पोरेट कस्टम फॉर्मेटिंग कोड्स व दिनांक इंजन", color: rtech-excel)

#table(
  columns: (1.6fr, 2.4fr, 2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[कस्टम फॉर्मेट कोड],
  text(size: 7pt, weight: "bold", fill: white)[स्क्रीन पर कैसा दिखेगा?],
  text(size: 7pt, weight: "bold", fill: white)[व्यावसायिक उपयोगिता],

  [#text(font: ("Consolas", "Segoe UI"))[`#,##0;[Red]-#,##0;"-";@`]],
  [धनात्मक: `1,250` · ऋणात्मक: #text(fill: red)[`-450`] · शून्य: `-` · टेक्स्ट: `@`],
  [#hl-y[कॉर्पोरेट MIS गोल्ड स्टैंडर्ड]। शून्य को साफ डैश दिखाता है और घाटे को लाल रंग में।],

  [#text(font: ("Consolas", "Segoe UI"))[`₹#,##0.00;[Red]-₹#,##0.00;"Free"`]],
  [भारतीय रुपये के प्रतीक और 2 दशमलव स्थानों के साथ।],
  [इनवॉइस बिलिंग, बैंक स्टेटमेंट व बही-खाता लेजर।],

  [#text(font: ("Consolas", "Segoe UI"))[`00000` या `+91-00000-00000`]],
  [पिन कोड या कर्मचारी आईडी में आगे का शून्य (0) सुरक्षित रखता है।],
  [पिन `003841` को `3841` होने से रोकता है।],

  [#text(weight: "bold", fill: rtech-excel)[`=EOMONTH(A2, 0)`]],
  [दी गई तारीख के महीने का अंतिम दिन (Last Day) देता है।],
  [GST रिटर्न फाइलिंग और पेरोल कटऑफ डेट्स के लिए अनिवार्य।],

  [#text(weight: "bold", fill: rtech-blue)[`=EDATE(A2, 3)`]],
  [दी गई तारीख से ठीक 3 महीने बाद की सटीक तारीख निकालता है।],
  [त्रैमासिक लाइसेंस रिन्यूअल, बीमा व वारंटी समाप्ति।],
)

#pagebreak()

// =============================================================================
// PAGE 04: EXCEL SHORTCUTS & POWER QUERY (HINDI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[एक्सेल 365: कार्यस्थल शॉर्टकट्स व पावर क्वेरी (ETL) पाइपलाइन]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[शीर्ष 30 हाई-स्पीड हॉटकीज · स्वचालित 6-चरणीय डेटा रीशेपिंग पाइपलाइन · शून्य-VBA ऑटोमेशन]
]

#section-banner(num: "शीर्ष शॉर्टकट्स", title: "अकाउंटेंट्स व MIS हेतु शीर्ष 30 हाई-स्पीड कीबोर्ड शॉर्टकट्स", color: rtech-excel)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.35pt + rtech-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 3.2pt,

      text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट],
      text(size: 6.8pt, weight: "bold", fill: white)[क्या कार्य करता है?],

      [#kbd[Ctrl + T]], [चुने गए डेटा को आधिकारिक टेबल में बदलना],
      [#kbd[Ctrl + Alt + V] $->$ #kbd[V]], [केवल मान (Values) पेस्ट करना (फॉर्मूला हटाकर)],
      [#kbd[Alt + =]], [तुरंत ऑटो-सम (`SUM` फॉर्मूला लगाना)],
      [#kbd[F4]], [सेल रेफरेंस लॉक करना (`\$A\$1` $->$ `A\$1` $->$ `\$A1` $->$ `A1`)],
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
      stroke: 0.35pt + rtech-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 3.2pt,

      text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट],
      text(size: 6.8pt, weight: "bold", fill: white)[क्या कार्य करता है?],

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

#section-banner(num: "पावर क्वेरी (ETL)", title: "स्वचालित 6-चरणीय कॉर्पोरेट डेटा रीशेपिंग पाइपलाइन", color: rtech-blue)

#table(
  columns: (0.7fr, 1.4fr, 2.5fr, 1.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[चरण],
  text(size: 7pt, weight: "bold", fill: white)[पाइपलाइन एक्शन],
  text(size: 7pt, weight: "bold", fill: white)[बैकग्राउंड में क्या होता है?],
  text(size: 7pt, weight: "bold", fill: white)[व्यावसायिक लाभ],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[01]]],
  [#text(weight: "bold", fill: rtech-blue)[डेटा प्राप्त करें (Extract)]],
  [CSV, एक्सेल फोल्डर, SQL डेटाबेस या SAP एक्सपोर्ट से #text(weight: "bold")[Data $->$ Get Data] द्वारा लिंक करें।],
  [विभिन्न फाइलों को 1 जगह जोड़ता है।],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[02]]],
  [#text(weight: "bold", fill: rtech-blue)[हेडर प्रमोट व फिल्टर]],
  [पहली रो को हेडर बनाएं; खाली रो व गैर-ज़रूरी समरी रो को एक क्लिक में फिल्टर करके हटाएं।],
  [मैन्युअल फाइल क्लीनिंग हमेशा के लिए खत्म।],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[03]]],
  [#text(weight: "bold", fill: rtech-emerald)[#hl-y[Unpivot Columns]]],
  [ID कॉलम चुनकर #text(weight: "bold")[Unpivot Other Columns] करें। चौड़े मंथली टेबल (Jan, Feb...) को 2 कॉलम डेटाबेस में बदलता है।],
  [#hl-g[पावर क्वेरी का #1 कौशल]। बेहतरीन पिवट टेबल बनाने योग्य बनाता है।],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[04]]],
  [#text(weight: "bold", fill: rtech-blue)[विभाजित व ट्रांसफॉर्म]],
  [टेक्स्ट को अलग करें, खाली स्पेस ट्रिम करें और सख्त डेटा टाइप (Date, Number, Text) तय करें।],
  [फॉर्मूलों में `#VALUE!` एरर नहीं आता।],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[05]]],
  [#text(weight: "bold", fill: rtech-ppt)[क्वेरीज़ मर्ज करें]],
  [Customer ID के आधार पर सेल्स टेबल और कस्टमर मास्टर का लेफ्ट आउटर जॉइन करें।],
  [लाखों पंक्तियों के लिए VLOOKUP का ऑटो विकल्प।],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[06]]],
  [#text(weight: "bold", fill: rtech-excel)[क्लोज व लोड]],
  [साफ डेटा को एक्सेल टेबल या सीधे #text(weight: "bold")[PowerPivot डेटा मॉडल] में बिना फाइल का आकार बढ़ाए लोड करें।],
  [#hl-y[अगले महीने केवल 'Refresh All' दबाएं]—पूरी रिपोर्ट 5 सेकंड में अपडेट!],
)

#pagebreak()

// =============================================================================
// PAGE 05: MICROSOFT WORD 365: LEGAL STYLES & AUTOMATION (HINDI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[वर्ड 365: लीगल मल्टी-लेवल नंबरिंग, सेक्शन ब्रेक्स व मेल मर्ज]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[त्रुटिहीन मल्टी-पेज फॉर्मेटिंग · लैंडस्केप पेज जोड़ना · 1 मिनट में 1000+ लेटर्स · शीर्ष 15 वर्ड कीज]
]

#section-banner(num: "स्टाइल संरचना", title: "हेडिंग स्टाइल व नंबरिंग लिंकेज (नंबरिंग बिगड़ने का पक्का इलाज)", color: rtech-word)

#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[स्ट्रक्चरल घटक],
  text(size: 7pt, weight: "bold", fill: white)[कॉर्पोरेट डॉक्यूमेंट नियम],
  text(size: 7pt, weight: "bold", fill: white)[Word 365 में कैसे सेट करें?],

  [#text(weight: "bold", fill: rtech-word)[Heading 1, 2, 3 लिंकेज]],
  [नंबर कभी हाथ से टाइप न करें! मल्टीलेवल लिस्ट को सीधे हेडिंग स्टाइल से लिंक करें।],
  [#kbd[Multilevel List] $->$ #kbd[Define New Multilevel List] $->$ #kbd[More] $->$ #hl-y[Link level to style: Heading 1]। लेवल 2 व 3 के लिए दोहराएं।],

  [#text(weight: "bold", fill: rtech-blue)[ऑटोमैटिक इंडेक्स (TOC)]],
  [विषय-सूची (Table of Contents) बिना पेज नंबर टाइप किए 1-क्लिक में अपने-आप बनेगी।],
  [#text(weight: "bold")[References $->$ Table of Contents $->$ Automatic Table 1] चुनें। अपडेट करने के लिए #kbd[F9] दबाएं।],

  [#text(weight: "bold", fill: rtech-emerald)[नेविगेशन पेन कंट्रोल]],
  [100+ पेज के लंबे कॉन्ट्रैक्ट्स में सीधे चैप्टर्स को ड्रैग करके रीऑर्डर करना।],
  [#kbd[Ctrl + F] दबाकर #kbd[Headings] चुनें। सीधे हेडिंग को ऊपर-नीचे ड्रैग करके पूरे चैप्टर का स्थान बदलें!],
)

#section-banner(num: "सेक्शन ब्रेक्स", title: "सेक्शन ब्रेक बनाम पेज ब्रेक (पोर्ट्रेट के बीच में लैंडस्केप पेज)", color: rtech-word)

#table(
  columns: (1.3fr, 2.2fr, 2.5fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ब्रेक का प्रकार],
  text(size: 7pt, weight: "bold", fill: white)[कीबोर्ड / नेविगेशन पाथ],
  text(size: 7pt, weight: "bold", fill: white)[महत्वपूर्ण अंतर व नियम],

  [#text(weight: "bold", fill: rtech-word)[पेज ब्रेक (Page Break)]],
  [#kbd[Ctrl + Enter]],
  [टेक्स्ट को अगले पेज पर भेजता है। हेडर, फुटर, पेज नंबर और ओरिएंटेशन #hl-y[पूरी तरह समान] रहते हैं।],

  [#text(weight: "bold", fill: rtech-ppt)[सेक्शन ब्रेक\ (Next Page)]],
  [#text(weight: "bold")[Layout $->$ Breaks $->$ Section Breaks $->$ Next Page]],
  [दस्तावेज का स्वतंत्र हिस्सा बनाता है। चौड़े टेबल हेतु सिर्फ उस पेज को #hl-b[Portrait से Landscape] करने देता है।],

  [#text(weight: "bold", fill: rtech-emerald)[हेडर अलग करना\ ('Link to Previous')]],
  [सेक्शन 2 के हेडर पर डबल-क्लिक करें $->$ रिबन पर #kbd[Link to Previous] को बंद करें।],
  [#hl-g[सबसे महत्वपूर्ण कदम]! सेक्शन 2 में अलग शीर्षक डालने या पेज नंबरिंग को 1 से फिर शुरू करने देता है।],
)

#section-banner(num: "मेल मर्ज पाइपलाइन", title: "स्वचालित 5-चरणीय बल्क लेटर व इनवॉइस पाइपलाइन", color: rtech-word)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[चरण 1: डेटा रेडी]\
      #v(1.5pt)
      एक्सेल के पहले रो में साफ हेडर हों (`Name`, `Address`, `Salary`, `Email`)।
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[चरण 2: फाइल जोड़ें]\
      #v(1.5pt)
      Word: #text(weight: "bold")[Mailings $->$ Select Recipients $->$ Use Existing List]। एक्सेल चुनें।
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[चरण 3: फील्ड इंसर्ट]\
      #v(1.5pt)
      कर्सर रखें $->$ #text(weight: "bold")[Insert Merge Field] $->$ `<<Name>>` आदि चुनें।
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[चरण 4: प्रीव्यू]\
      #v(1.5pt)
      #kbd[Preview Results] पर क्लिक कर अलग-अलग रिकॉर्ड्स की जांच करें।
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.5pt + rgb("#86EFAC"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-excel)[चरण 5: फिनिश]\
      #v(1.5pt)
      #kbd[Finish & Merge] $->$ 1 क्लिक में 1,000+ व्यक्तिगत लेटर्स या PDF तैयार!
    ]
  ],
)

#v(2pt)
#section-banner(num: "वर्ड शॉर्टकट्स", title: "माइक्रोसॉफ्ट वर्ड हेतु शीर्ष 15 दैनिक शॉर्टकट्स", color: rtech-word)

#table(
  columns: (1fr, 1.4fr, 1fr, 1.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.8pt, weight: "bold", fill: white)[कार्य],
  text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.8pt, weight: "bold", fill: white)[कार्य],

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
)

#pagebreak()

// =============================================================================
// PAGE 06: POWERPOINT 365: PITCH DECK ARCHITECTURE & MORPH (HINDI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[पावरपॉइंट 365: एग्जीक्यूटिव डेक स्टैंडर्ड्स, स्लाइड मास्टर व मॉर्फ]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[स्लाइड मास्टर कॉर्पोरेट लॉकिंग · मॉर्फ द्वारा स्मूथ ऐप एनिमेशन · शीर्ष 15 प्रेजेंटर कीज]
]

#section-banner(num: "स्लाइड मास्टर", title: "कंपनी ब्रांडिंग लॉक (टीम द्वारा स्लाइड लेआउट खराब होने से बचाएं)", color: rtech-ppt)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[घटक],
  text(size: 7pt, weight: "bold", fill: white)[कॉन्फ़िगरेशन का सही तरीका],
  text(size: 7pt, weight: "bold", fill: white)[व्यावसायिक लाभ],

  [#text(weight: "bold", fill: rtech-ppt)[Slide Master Access]],
  [#text(weight: "bold")[View $->$ Slide Master] में जाएं। सबसे ऊपर वाली मुख्य स्लाइड पर कंपनी लोगो, फॉन्ट और कलर स्कीम सेट करें।],
  [लोगो और बैकग्राउंड हमेशा के लिए लॉक हो जाते हैं, प्रेजेंटर गलती से भी उन्हें हिला या मिटा नहीं सकता।],

  [#text(weight: "bold", fill: rtech-blue)[कस्टम प्लेसहोल्डर्स]],
  [#kbd[Insert Placeholder] $->$ टेक्स्ट, पिक्चर, चार्ट या टेबल बॉक्स जोड़ें। सही पैडिंग और आकार पहले से सेट रखें।],
  [टीम के सदस्य सीधे #hl-y['Click to add picture'] करेंगे—लेआउट कभी टेढ़ा-मेढ़ा नहीं होगा।],

  [#text(weight: "bold", fill: rtech-emerald)[पहलू अनुपात (16:9)]],
  [हमेशा #text(weight: "bold")[Widescreen 16:9] (#kbd[Design $->$ Slide Size $->$ Widescreen]) का प्रयोग करें। पुराना 4:3 न चुनें।],
  [आधुनिक LED टीवी, लैपटॉप और प्रोजेक्टर पर दोनों तरफ काली पट्टियां नहीं आतीं।],
)

#section-banner(num: "मॉर्फ ट्रांज़िशन", title: "बिना जटिल एनिमेशन के सिनेमाई स्मूथ ट्रांज़िशन", color: rtech-ppt)

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[मॉर्फ तकनीक],
  text(size: 7pt, weight: "bold", fill: white)[3 स्टेप्स में कैसे बनाएं?],
  text(size: 7pt, weight: "bold", fill: white)[स्क्रीन पर कैसा असर दिखता है?],

  [#text(weight: "bold", fill: rtech-ppt)[ऑब्जेक्ट मूवमेंट व साइज]],
  [1. स्लाइड 1 बनाएं $->$ 2. स्लाइड को डुप्लिकेट करें (#kbd[Ctrl+D]) $->$ 3. स्लाइड 2 पर ऑब्जेक्ट का स्थान या आकार बदलें $->$ 4. #text(weight: "bold")[Transitions $->$ Morph] लगाएं।],
  [बिना मोशन पाथ बनाए ऑब्जेक्ट एक स्लाइड से दूसरी स्लाइड पर तैरते हुए आसानी से पहुंच जाता है।],

  [#text(weight: "bold", fill: rtech-blue)[नेम टैगिंग (`!!`)]],
  [Selection Pane (#kbd[Alt+F10]) में दोनों अलग आकारों को एक ही नाम दें, जैसे स्लाइड 1 पर गोले को `!!Logo` और स्लाइड 2 पर तारे को `!!Logo`।],
  [#hl-y[अलग-अलग आकार एक-दूसरे में पिघलकर बदल जाते हैं]! उच्च-स्तरीय प्रभाव।],

  [#text(weight: "bold", fill: rtech-excel)[ज़ूम-इन प्रोडक्ट फोकस]],
  [स्लाइड 1 पर ऐप का छोटा स्क्रीनशॉट रखें। डुप्लिकेट स्लाइड 2 पर उसे 300% बड़ा कर किसी एक कार्ड पर फोकस करें $->$ Morph लगाएं।],
  [बिना वीडियो एडिटिंग सॉफ्टवेयर के प्रेजेंटेशन में कैमरा ज़ूम जैसा प्रभाव पैदा होता है।],
)

#section-banner(num: "PPT शॉर्टकट्स", title: "प्रेजेंटर्स व डिजाइनर्स हेतु शीर्ष 15 डेक शॉर्टकट्स", color: rtech-ppt)

#table(
  columns: (1.1fr, 2.4fr, 1.1fr, 2.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.8pt, weight: "bold", fill: white)[कार्य],
  text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.8pt, weight: "bold", fill: white)[कार्य],

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
)

#pagebreak()

// =============================================================================
// PAGE 07: MICROSOFT 365 CLOUD & OUTLOOK INBOX ZERO (HINDI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[माइक्रोसॉफ्ट 365: क्लाउड टीमवर्क व आउटलुक इनबॉक्स जीरो]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[OneDrive रियल-टाइम को-ऑथरिंग · फाइल वर्जन हिस्ट्री · 4D ईमेल प्रबंधन · कॉर्पोरेट कैलेंडर]
]

#section-banner(num: "क्लाउड टीमवर्क", title: "रियल-टाइम को-ऑथरिंग व शेयरपॉइंट / वनड्राइव नियम", color: rtech-blue)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[क्लाउड क्षमता],
  text(size: 7pt, weight: "bold", fill: white)[Microsoft 365 में कैसे काम करता है?],
  text(size: 7pt, weight: "bold", fill: white)[सुरक्षा व बेस्ट प्रैक्टिस],

  [#text(weight: "bold", fill: rtech-blue)[Real-Time Co-Authoring]],
  [टीम के कई सदस्य एक ही एक्सेल या वर्ड फाइल पर एक साथ काम करते हैं। स्क्रीन पर अलग-अलग रंगों के लाइव कर्सर दिखाई देते हैं।],
  [ईमेल में `Report_Final_v2_Approved.xlsx` जैसी दर्जनों डुप्लिकेट फाइलों के चक्कर से हमेशा की मुक्ति!],

  [#text(weight: "bold", fill: rtech-emerald)[Version History]],
  [ऊपर टाइटल बार पर क्लिक कर #kbd[Version History] चुनें। पुरानी किसी भी तारीख का वर्जन 1 क्लिक में रिस्टोर कर सकते हैं।],
  [गलती से डेटा डिलीट होने पर सुरक्षा कवच। हर सेव ऐतिहासिक बैकअप बन जाता है।],

  [#text(weight: "bold", fill: rtech-ppt)[Sharing Permissions]],
  [लिंक प्रकार: 1. #text(weight: "bold")[Anyone with the link] (पब्लिक), 2. #text(weight: "bold")[People in organization], 3. #text(weight: "bold")[Specific People]।],
  [#hl-y[कंपनी वित्तीय डेटा कभी 'Anyone' लिंक से शेयर न करें]! हमेशा एक्सपायरी डेट सेट करें और डाउनलोड ब्लॉक रखें।],

  [#text(weight: "bold", fill: rtech-word)[Excel Web vs Desktop]],
  [एक्सेल ऑनलाइन में बेसिक फॉर्मूले, को-ऑथरिंग और ऑफिस स्क्रिप्ट्स (TypeScript) चलते हैं। डेस्कटॉप में भारी मैक्रोज़ और पावरपिवट चलते हैं।],
  [टीम वर्क के लिए ऑनलाइन चलाएं; भारी डेटा एनालिसिस के लिए डेस्कटॉप एक्सेल खोलें।],
)

#section-banner(num: "आउटलुक इनबॉक्स जीरो", title: "ईमेल प्रबंधन का 4D कॉर्पोरेट फॉर्मूला", color: rtech-outlook)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.8pt + rgb("#38BDF8"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[1. DO IT (< 2 MINS)]\
      #v(2pt)
      अगर किसी ईमेल का उत्तर 2 मिनट से कम में दिया जा सकता है, तो #hl-y[उसे तुरंत निपटाएं]।
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.8pt + rgb("#86EFAC"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-excel)[2. DELEGATE]\
      #v(2pt)
      संबंधित जिम्मेदार व्यक्ति को डेडलाइन के साथ फॉरवर्ड करें और खुद #kbd[\@WaitingFor] में डालें।
    ]
  ],
  [
    #block(fill: rgb("#FEF3C7"), stroke: 0.8pt + rgb("#FCD34D"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B45309"))[3. DEFER (CALENDAR)]\
      #v(2pt)
      अगर 15 मिनट से अधिक का काम है, तो ईमेल को #kbd[Calendar] पर ड्रैग करके टाइम-ब्लॉक बुक करें।
    ]
  ],
  [
    #block(fill: rgb("#FFE4E6"), stroke: 0.8pt + rgb("#FDA4AF"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#E11D48"))[4. DELETE / ARCHIVE]\
      #v(2pt)
      सूचना वाले मेल, न्यूज़लेटर। #kbd[Backspace] दबाकर आर्काइव करें। इनबॉक्स को शून्य रखें।
    ]
  ],
)

#v(2pt)
#section-banner(num: "आउटलुक पावर टूल्स", title: "क्विक स्टेप्स, ऑटो रूल्स व कीबोर्ड गतिवर्धक", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[आउटलुक फीचर],
  text(size: 6.8pt, weight: "bold", fill: white)[कैसे सेट करें?],
  text(size: 6.8pt, weight: "bold", fill: white)[उच्च-उपयोगिता शॉर्टकट],

  [#text(weight: "bold", fill: rtech-outlook)[Quick Steps]],
  [Home $->$ Quick Steps $->$ New। एक क्लिक में: पढ़ा हुआ मार्क करना + फोल्डर में डालना + फ्लैग लगाना।],
  [रोज़ाना आने वाले मेल को साफ़ करने हेतु शॉर्टकट #kbd[Ctrl + Shift + 1] लगाएं।],

  [#text(weight: "bold", fill: rtech-blue)[ऑटोमैटिक रूल्स]],
  [Home $->$ Rules $->$ Create Rule। सर्वर अलर्ट या बैंक अलर्ट सीधे अलग फोल्डर में चले जाएं।],
  [इनबॉक्स को सिर्फ मुख्य इंसानी बातचीत के लिए खाली रखता है।],

  [#text(weight: "bold", fill: rtech-emerald)[Scheduling Assistant]],
  [New Meeting $->$ Scheduling Assistant। टीम के सभी लोगों का खाली व व्यस्त समय एक साथ देखें।],
  [बार-बार "आप कब फ्री हैं?" पूछने वाले ईमेल हमेशा के लिए बंद।],

  [#text(weight: "bold", fill: rtech-navy)[शीर्ष आउटलुक कीज]],
  [#kbd[Ctrl+Shift+M] (नया ईमेल) · #kbd[Ctrl+N] (नया आइटम) · #kbd[Ctrl+R] (रिप्लाई) · #kbd[Ctrl+Shift+R] (रिप्लाई ऑल)],
  [#kbd[Ctrl+1] (मेल) · #kbd[Ctrl+2] (कैलेंडर) · #kbd[Ctrl+3] (कॉन्टैक्ट्स) · #kbd[Backspace] (1-टच आर्काइव)],
)

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB & MNC INTERVIEW VAULT (HINDI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[RTECHLAB लेखक मेंटरशिप हब व MNC इंटरव्यू वॉल्ट]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[आधिकारिक लेखक प्रोफाइल · डायरेक्ट पोर्टफोलियो व सोशल हब · प्लेसमेंट तैयारी चेकलिस्ट]
]

#section-banner(num: "लेखक परिचय", title: "लेखक: राहुल पटेल — संस्थापक एवं सीनियर टेक्निकल एक्सपर्ट", color: rtech-navy)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  fill: rgb("#F8FAFC"),
  radius: 5pt,
  inset: 6pt,
  [
    #grid(
      columns: (65pt, 1fr),
      gutter: 9pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-blue,
          radius: 6pt,
          clip: true,
          width: 58pt,
          height: 68pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 10pt, weight: "black", fill: rtech-navy)[राहुल पटेल (Rahul Patel)]\
        #v(0.5pt)
        #text(size: 7.2pt, weight: "bold", fill: rtech-blue)[संस्थापक एवं मुख्य सिस्टम्स आर्किटेक्ट · RTechLab Publications]\
        #text(size: 7.2pt, weight: "bold", fill: rgb("#047857"))[डायरेक्टर एवं सीनियर टेक्निकल एक्सपर्ट · IANT COMPUTER EDUCATION, PALANPUR]\
        #v(1.5pt)
        #text(size: 6.8pt, fill: rtech-navy)[
          *10 से अधिक वर्षों के गहन तकनीकी व शिक्षण अनुभव* के साथ, राहुल ने गुजरात और भारत भर में *3,000 से अधिक छात्रों* को कंप्यूटर नेटवर्किंग, सिस्को CCNA, क्लाउड इंफ्रास्ट्रक्चर और कॉर्पोरेट MIS सिस्टम्स में प्रशिक्षित किया है। उन्होंने ₹22 डेस्क रेफरेंस सीरीज़ की शुरुआत इसलिए की ताकि हर महत्वाकांक्षी छात्र को उच्च स्तरीय तकनीकी ज्ञान बेहद किफायती दाम पर उपलब्ध हो सके।
        ]
      ]
    )
  ]
)

#section-banner(num: "कम्युनिटी चैनल्स", title: "लेखक पोर्टफोलियो, यूट्यूब व आधिकारिक चैनल्स के सीधे लिंक्स", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [
    #block(
      stroke: 0.8pt + rgb("#38BDF8"),
      fill: rgb("#F0F9FF"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rtech-blue)[लेखक पोर्टफोलियो]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#FDA4AF"),
      fill: rgb("#FFF1F2"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#E11D48"))[यूट्यूब चैनल]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#F472B6"),
      fill: rgb("#FDF2F8"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#DB2777"))[इंस्टाग्राम हब]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#86EFAC"),
      fill: rgb("#F0FDF4"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#166534"))[व्हाट्सएप कम्युनिटी]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[फ्री कम्युनिटी एक्सेस ↗]]
        ]
      ]
    )
  ],
)

#section-banner(num: "MNC इंटरव्यू वॉल्ट", title: "MNCs में पूछे जाने वाले शीर्ष 5 MIS व Office 365 प्रश्न एवं मॉडल उत्तर", color: rtech-excel)

#table(
  columns: (2.2fr, 3.8fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[तकनीकी इंटरव्यू प्रश्न (Asked in Top MNCs)],
  text(size: 7pt, weight: "bold", fill: white)[सीनियर एग्जीक्यूटिव मॉडल उत्तर],

  [#text(weight: "bold", fill: rtech-navy)[प्र.1: XLOOKUP क्यों VLOOKUP से बेहतर माना जाता है?]],
  [XLOOKUP में डिफ़ॉल्ट सटीक मिलान होता है, यह बाईं तरफ भी खोज सकता है, `#N/A` को अपने-आप संभालता है, एक साथ कई कॉलम निकालता है और बीच में नया कॉलम जोड़ने पर कभी नहीं टूटता।],

  [#text(weight: "bold", fill: rtech-navy)[प्र.2: पेज ब्रेक की जगह सेक्शन ब्रेक कब इस्तेमाल करना चाहिए?]],
  [पेज ब्रेक केवल टेक्स्ट को अगले पेज पर भेजता है। सेक्शन ब्रेक एक स्वतंत्र लेआउट जोन बनाता है, जिससे किसी एक पेज को पोर्ट्रेट के बीच में लैंडस्केप किया जा सके और हेडर/फुटर अलग किए जा सकें।],

  [#text(weight: "bold", fill: rtech-navy)[प्र.3: पावर क्वेरी में 'Unpivot Columns' का क्या काम है?]],
  [यह चौड़े मैट्रिक्स टेबल (महीनों के कॉलम) को सामान्यीकृत 2-कॉलम डेटाबेस स्ट्रक्चर (Attribute व Value) में बदलता है, जिससे सही पिवट टेबल और डेटा मॉडल बनाए जा सकें।],

  [#text(weight: "bold", fill: rtech-navy)[प्र.4: मॉर्फ ट्रांज़िशन सामान्य एनिमेशन से कैसे अलग है?]],
  [सामान्य एनिमेशन में हर ऑब्जेक्ट पर अलग से मोशन पाथ लगाना पड़ता है। मॉर्फ दो स्लाइडों की तुलना कर अपने-आप एक जैसे नाम वाले ऑब्जेक्ट्स का आकार, रंग और स्थान स्मूथली बदल देता है।],

  [#text(weight: "bold", fill: rtech-navy)[प्र.5: आउटलुक में इनबॉक्स जीरो का 4D नियम क्या है?]],
  [2 मिनट से कम का काम हो तो तुरंत करें (Do); दूसरों को सौंपें (Delegate); बाद के लिए कैलेंडर पर शेड्यूल करें (Defer); बाकी सब डिलीट या आर्काइव करें (Delete) ताकि इनबॉक्स खाली रहे।],
)

#v(2pt)
#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 0.8pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 10pt, y: 3pt),
    text(size: 7pt, weight: "bold", fill: rtech-blue)[
      🚀 क्या आप संपूर्ण 113 पेजों की विस्तृत किताब व 6 असली एक्सेल प्रैक्टिस फाइल्स (.xlsx) चाहते हैं? ₹49 मास्टर बुक या ₹149 करियर सुइट पर अपग्रेड करें: #link("https://rtechlab.com/hi/notes")[*rtechlab.com/hi/notes*]
    ]
  )
]
'''

with open(typ_path, "w", encoding="utf-8") as f:
    f.write(typst_content)

print(f"✓ Typst source written to: {typ_path}")

cmd = ["typst", "compile", typ_path, pdf_path]
print(f"Compiling: {' '.join(cmd)}")
res = subprocess.run(cmd, capture_output=True, text=True)
if res.returncode != 0:
    print("Compilation error:", res.stderr)
    exit(1)

print(f"✓ PDF successfully compiled to: {pdf_path}")

# Verify exact page count with PyMuPDF
doc = fitz.open(pdf_path)
page_count = len(doc)
print(f"=== VERIFICATION: Total Pages = {page_count} ===")
doc.close()

# Copy to public downloads
with open(pdf_path, "rb") as fsrc, open(public_pdf, "wb") as fdst:
    fdst.write(fsrc.read())

print(f"✓ Copied to public download path: {public_pdf}")
