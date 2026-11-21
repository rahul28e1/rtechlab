import os

def generate_ppt_chapters(base_dir):
    eng_dir = os.path.join(base_dir, "English")
    hi_dir = os.path.join(base_dir, "Hindi")
    os.makedirs(eng_dir, exist_ok=True)
    os.makedirs(hi_dir, exist_ok=True)

    # =========================================================================
    # CHAPTER 23: PowerPoint 365 Architecture, 6x6 Rule & Typography (3 Pages)
    # =========================================================================
    ch23_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 23]
= PowerPoint 365 Architecture, The 6x6 Corporate Rule & Visual Typography

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  PowerPoint 365 is not a digital teleprompter; it is a high-stakes visual communication tool designed to persuade, inform, and drive executive alignment. Modern corporate decks reject dense text paragraphs in favor of cognitive visual hierarchy, golden ratio layouts, and crisp typography.
]

#v(2pt)

== 23.1 The Modern PowerPoint 365 Workspace & Canvas Geometry

Navigating PowerPoint efficiently requires understanding canvas aspect ratios and delivery surfaces:
- *16:9 Widescreen Canvas*: The undisputed global standard (`13.333 in × 7.5 in` or `33.867 cm × 19.05 cm`) optimized for 4K conference room monitors, laptop screens, and virtual boardrooms.
- *4:3 Standard Canvas*: Legacy format (`10 in × 7.5 in`), strictly reserved for older classroom projection bulbs or iPad-specific kiosks.
- *Ruler, Guides & Smart Grid*: Press `Shift + F9` to toggle the alignment grid. Smart Guides appear dynamically as orange alignment snapping indicators, ensuring pixel-perfect spacing between cards and icons.
- *Design Ideas / Designer Engine*: Microsoft 365's integrated neural visual layout engine that transforms plain bulleted text into professional infographic arrangements with a single click.

#v(2pt)
#ribbon-specimen(path: "Design > Customize > Slide Size", command: "Widescreen 16:9 Canvas", shortcut: "Alt + G > S")
#v(2pt)

== 23.2 The Sacred 6x6 Presentation Rule & Cognitive Load Theory

Executive audiences make decisions in seconds. Cognitive overload occurs when slides resemble technical manuals:
- *The 6x6 Golden Rule*: No more than *6 bullet points per slide*, and no more than *6 words per bullet point*.
- *The 3-Second Rule*: A stakeholder must instantly comprehend the slide's central takeaway within 3 seconds of viewing.
- *Headline + Paragraph Trap*: Never write full conversational sentences. Use high-impact telegraphic phrases paired with visual metric badges.

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Design Dimension*], [*Amateur Presentation Mistake*], [*2027 Executive Presentation Standard*]),
  [Information Density], [15 bullet points filling the entire canvas.], [1 core headline, 3 structured metric cards.],
  [Typography Hierarchy], [Same font size throughout; low contrast.], [40pt bold headline, 16pt clean supporting text.],
  [Visual Anchor], [Random clip art or blurry stock photos.], [High-resolution vector SVG icon or data chart.],
  [Color Discipline], [Rainbow of 8 unbranded colors.], [Strict 3-color palette: Primary, Dark Slate, Accent.]
)

#pagebreak()

== 23.3 Typography Hierarchy & Legibility Standards

Fonts communicate brand authority and psychological tone. In professional presentations:
- *Title Hierarchy*: 36pt to 44pt Bold (Sans-serif: *Segoe UI*, *Plus Jakarta Sans*, *Inter*, or *Montserrat*).
- *Subtitle / Subheading*: 20pt to 24pt Medium.
- *Body Text / Descriptions*: 14pt to 16pt Regular (Never drop below 12pt for live auditorium screens).
- *Pairing Principle*: Pair a geometric sans-serif heading (*Segoe UI Variable*) with a clean neutral body typeface. Never use decorative fonts (*Comic Sans*, *Papyrus*) in corporate environments.
- *Text Contrast*: Maintain minimum 4.5:1 WCAG contrast ratio. Use pure white text (`#FFFFFF`) on deep navy/charcoal backgrounds, or dark slate (`#0F172A`) on light gray backgrounds.

#v(2pt)

== 23.4 The 4 Universal Corporate Deck Archetypes

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("1. C-SUITE EXECUTIVE BRIEFING", [
      High-level strategic updates for the Board of Directors.
      - *Structure*: 5-10 slides max. Focus on ROI, quarterly EBITDA, risk mitigations, and capital expenditure approvals.
      - *Visuals*: High-contrast KPI metric cards, clean waterfall charts, zero fluff.
    ])
    #v(3pt)
    #callout-box("2. VENTURE CAPITAL INVESTOR PITCH", [
      Fundraising decks designed to secure seed or growth rounds.
      - *Structure*: 12 slides (Problem, Solution, TAM/SAM/SOM Market Size, Traction, Business Model, Team, Ask).
      - *Visuals*: Hockey-stick growth charts, customer testimonials, clean product mockups.
    ])
  ],
  [
    #callout-box("3. TECHNICAL & ENGINEERING PROPOSAL", [
      System architecture, cloud migration, and RFP solutions.
      - *Structure*: Problem statement, proposed topology, SLA milestones, security compliance, phased budget.
      - *Visuals*: Detailed network topology diagrams, timeline Gantt charts, security certification badges.
    ])
    #v(3pt)
    #callout-box("4. SALES & CLIENT CAPABILITY DECK", [
      Commercial pitch to prospective enterprise enterprise clients.
      - *Structure*: Client pain points, our competitive advantage, case studies, pricing tiers, next steps.
      - *Visuals*: Before-and-after transformation metrics, prominent client logos, actionable call-to-action.
    ])
  ]
)

#pagebreak()

== 23.5 Production Blueprint: Executive KPI Slide Layout Architecture

Below is the standard 3-column metric layout used in Fortune 500 board decks:

#table(
  columns: (1.5fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else { rgb("#F8FAFC") },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 4pt),
  table.header([*METRIC CARD 01*], [*METRIC CARD 02*], [*METRIC CARD 03*]),
  [
    #text(size: 16pt, weight: "bold", fill: rgb("#059669"))[₹42.8 Cr] \
    #text(size: 8pt, weight: "bold")[Annual Recurring Revenue] \
    #text(size: 7pt, fill: rgb("#64748B"))[+28.4% YoY enterprise expansion across APAC region.]
  ],
  [
    #text(size: 16pt, weight: "bold", fill: rgb("#2563EB"))[99.98%] \
    #text(size: 8pt, weight: "bold")[Core Platform SLA Uptime] \
    #text(size: 7pt, fill: rgb("#64748B"))[Zero critical outages during peak Q3 transaction cycles.]
  ],
  [
    #text(size: 16pt, weight: "bold", fill: rgb("#D97706"))[14.2 Mos] \
    #text(size: 8pt, weight: "bold")[Customer Payback Period] \
    #text(size: 7pt, fill: rgb("#64748B"))[CAC reduced by 18% through automated onboarding.]
  ]
)

#v(3pt)

== 23.6 Evaluation Dashboard: Technical MCQs & Review Q&A

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What is the standard aspect ratio for modern PowerPoint presentations?", ans: "16:9 Widescreen.")
    #short-qa(num: 2, q: "What does the 6x6 presentation rule dictate?", ans: "Max 6 bullets per slide, max 6 words per bullet.")
    #short-qa(num: 3, q: "What keyboard shortcut toggles alignment gridlines in PowerPoint?", ans: "Shift + F9 shortcut.")
    #short-qa(num: 4, q: "What is the recommended minimum body text font size for live presentations?", ans: "14pt to 16pt (minimum 12pt).")
  ],
  [
    #mcq(num: 1, q: "Which aspect ratio should be used when presenting on modern conference monitors and laptops?", a: "4:3 Standard", b: "16:9 Widescreen", c: "1:1 Square", d: "9:16 Vertical", ans: "B", expl: "16:9 is the universal standard for widescreen displays and video conferencing.")
    #mcq(num: 2, q: "What is the purpose of PowerPoint Designer (Design Ideas)?", a: "To spell check slides", b: "To automatically transform text into professional visual layouts using AI", c: "To compress video files", d: "To export slides to PDF", ans: "B", expl: "Designer leverages neural design templates to auto-format text into visual cards and diagrams.")
    #mcq(num: 3, q: "Why is high contrast (minimum 4.5:1) critical in slide typography?", a: "To increase file size", b: "To ensure legibility across projectors with ambient glare and for visually impaired viewers", c: "To enable animation", d: "To unlock transitions", ans: "B", expl: "Projectors often wash out colors; strong contrast ensures readability under bright lighting.")
  ]
)

#v(2pt)

#spotlight-box("2027 DYNAMIC ULTRA-WIDE DISPLAY ADAPTATION", [
  PowerPoint 365 Enterprise dynamically scales slide canvases to 21:9 Ultra-Wide video walls and multi-monitor boardroom command centers, preserving vector SVG fidelity and grid alignment without pixelation.
])
"""

    ch23_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[भाग 3: माइक्रोसॉफ्ट पावरपॉइंट 365 मास्टरक्लास · अध्याय 23]
= पावरपॉइंट 365 संरचना, 6x6 कॉर्पोरेट नियम एवं विजुअल टाइपोग्राफी

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  पावरपॉइंट केवल डिजिटल टेलीप्रॉम्प्टर नहीं है; यह अधिकारियों एवं निवेशकों को प्रभावित करने वाला एक उच्च-स्तरीय विजुअल संचार उपकरण है। आधुनिक कॉर्पोरेट प्रस्तुतियां लंबे अनुच्छेदों के स्थान पर स्पष्ट विजुअल पदानुक्रम, गोल्डन रेशियो लेआउट तथा सुरुचिपूर्ण टाइपोग्राफी का उपयोग करती हैं।
]

#v(2pt)

== 23.1 आधुनिक पावरपॉइंट 365 कार्यक्षेत्र एवं कैनवास ज्यामिति

कुशलतापूर्वक स्लाइड डिजाइन करने हेतु कैनवास आस्पेक्ट रेशियो और स्क्रीन प्रकार को समझना अनिवार्य है:
- *16:9 वाइडस्क्रीन कैनवास (Widescreen)*: आधुनिक 4K मॉनिटरों, लैपटॉपों तथा ऑनलाइन जूम बैठकों का वैश्विक मानक (`13.333 in × 7.5 in`)।
- *4:3 स्टैंडर्ड कैनवास (Standard)*: पुराना प्रारूप (`10 in × 7.5 in`), जो केवल पुराने प्रोजेक्टरों या विशेष टैबलेट कियोस्क तक सीमित है।
- *रूलर, गाइड्स एवं स्मार्ट ग्रिड*: अलाइनमेंट ग्रिड चालू करने हेतु `Shift + F9` दबाएं। ऑब्जेक्ट खिसकाते समय नारंगी स्मार्ट गाइड्स स्वतः प्रकट होकर सटीक दूरी बनाए रखती हैं।
- *डिजाइन आइडियाज (Designer)*: ऑफिस 365 का AI इंजन, जो साधारण बुलेट पॉइंट्स को एक क्लिक में आकर्षक इन्फोग्राफिक कार्ड्स में परिवर्तित कर देता है।

#v(2pt)
#ribbon-specimen(path: "डिजाइन > कस्टमाइज़ > स्लाइड साइज", command: "वाइडस्क्रीन 16:9 कैनवास", shortcut: "Alt + G > S")
#v(2pt)

== 23.2 पवित्र 6x6 प्रस्तुति नियम एवं संज्ञानात्मक भार सिद्धांत

कॉर्पोरेट अधिकारी सेकंडों में निर्णय लेते हैं। यदि स्लाइड किसी तकनीकी किताब जैसी दिखेगी, तो श्रोता भ्रमित हो जाएंगे:
- *6x6 का स्वर्णिम नियम (Golden Rule)*: एक स्लाइड पर अधिकतम *6 बुलेट पॉइंट्स*, तथा प्रत्येक बुलेट में अधिकतम *6 शब्द* होने चाहिए।
- *3-सेकंड का नियम*: दर्शक को स्लाइड देखते ही 3 सेकंड के भीतर उसका मुख्य संदेश समझ में आ जाना चाहिए।
- *लंबे वाक्यों का जाल*: कभी भी पूरे व्याकरणिक वाक्य न लिखें। केवल उच्च-प्रभाव वाले वाक्यांश लिखें और साथ में संख्यात्मक मेट्रिक्स का प्रयोग करें।

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*डिजाइन आयाम*], [*नौसिखिया प्रस्तुति की गलती*], [*2027 कार्यकारी प्रस्तुति मानक*]),
  [सूचना घनत्व], [पूरी स्लाइड पर 15 लंबे बुलेट पॉइंट्स भरना।], [1 मुख्य शीर्षक, 3 संरचित वित्तीय मेट्रिक कार्ड।],
  [टाइपोग्राफी], [सभी जगह एक समान फोंट; कमजोर कंट्रास्ट।], [40pt बोल्ड शीर्षक, 16pt स्पष्ट सहायक विवरण।],
  [विजुअल तत्व], [धुंधली क्लिप आर्ट या बेमेल स्टॉक फोटो।], [उच्च-रिज़ॉल्यूशन वेक्टर SVG आइकन या डेटा चार्ट।],
  [रंगों का अनुशासन], [8 अलग-अलग भड़कीले रंगों की भरमार।], [कठोर 3-रंग पैलेट: प्राथमिक ब्रांड, डार्क स्लेट, एक्सेंट।]
)

#pagebreak()

== 23.3 टाइपोग्राफी पदानुक्रम एवं पठनीयता मानक

फोंट प्रस्तुति के अधिकार और पेशेवर प्रतिष्ठा को दर्शाते हैं। कॉर्पोरेट मानकों के अनुसार:
- *शीर्षक पदानुक्रम (Title)*: 36pt से 44pt बोल्ड (सैंस-सेरिफ: *Segoe UI*, *Plus Jakarta Sans*, *Inter*, अथवा *Montserrat*)।
- *उप-शीर्षक (Subtitle)*: 20pt से 24pt मीडियम।
- *बॉडी टेक्स्ट (Body Text)*: 14pt से 16pt रेगुलर (ऑडिटोरियम स्क्रीन पर 12pt से नीचे कभी न जाएं)।
- *फोंट पेयरिंग सिद्धांत*: बोल्ड आधुनिक शीर्षक के साथ साफ-सुथरा बॉडी फोंट जोड़ें। कभी भी अनौपचारिक फोंट्स (*Comic Sans*, *Papyrus*) का उपयोग न करें।
- *टेक्स्ट कंट्रास्ट*: न्यूनतम 4.5:1 का कंट्रास्ट अनुपात बनाए रखें। गहरे नीले या काले बैकग्राउंड पर शुद्ध सफेद टेक्स्ट (`#FFFFFF`) तथा हल्के बैकग्राउंड पर गहरा स्लेट (`#0F172A`) प्रयोग करें।

#v(2pt)

== 23.4 कॉर्पोरेट प्रस्तुतियों के 4 सार्वभौमिक प्रारूप

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("1. बोर्ड ऑफ डायरेक्टर्स ब्रीफिंग", [
      कंपनी निदेशक मंडल हेतु उच्च-स्तरीय रणनीतिक अपडेट।
      - *संरचना*: 5-10 स्लाइड्स। वित्तीय आरओआई, तिमाही मुनाफा, जोखिम समाधान तथा बजट आवंटन पर ध्यान।
      - *विजुअल्स*: उच्च-कंट्रास्ट केपीआई मेट्रिक कार्ड, साफ वॉटरफॉल चार्ट्स।
    ])
    #v(3pt)
    #callout-box("2. वेंचर कैपिटल इन्वेस्टर पिच", [
      स्टार्टअप फंडिंग राउंड हासिल करने हेतु पिच डेक।
      - *संरचना*: 12 स्लाइड्स (समस्या, समाधान, बाजार आकार TAM/SAM, ट्रैक्शन, बिजनेस मॉडल, टीम, फंडिंग मांग)।
      - *विजुअल्स*: तीव्र विकास चार्ट, ग्राहक प्रशंसापत्र, उत्पाद के साफ मॉकअप।
    ])
  ],
  [
    #callout-box("3. तकनीकी एवं इंजीनियरिंग प्रस्ताव", [
      सिस्टम आर्किटेक्चर, क्लाउड माइग्रेशन तथा टेंडर प्रस्ताव।
      - *संरचना*: समस्या विवरण, प्रस्तावित टोपोलॉजी, एसएलए माइलस्टोन्स, सुरक्षा अनुपालन, चरणबद्ध लागत।
      - *विजुअल्स*: विस्तृत नेटवर्क टोपोलॉजी, गैंट चार्ट्स, सुरक्षा प्रमाणन बैज।
    ])
    #v(3pt)
    #callout-box("4. बिक्री एवं कॉर्पोरेट क्षमता डेक", [
      संभावित ग्राहकों को सेवाएं व उत्पाद बेचने हेतु पिच।
      - *संरचना*: ग्राहक की मुख्य समस्याएं, हमारी यूएसपी, केस स्टडीज, मूल्य निर्धारण टीयर्स, कॉल-टू-एक्शन।
      - *विजुअल्स*: परिणाम मेट्रिक्स, प्रमुख कंपनियों के लोगो, संपर्क बटन।
    ])
  ]
)

#pagebreak()

== 23.5 व्यावहारिक ब्लूप्रिंट: कार्यकारी केपीआई कार्ड्स लेआउट आर्किटेक्चर

फॉर्च्यून 500 बोर्डरूम में प्रयोग होने वाला आधुनिक 3-कॉलम मेट्रिक लेआउट:

#table(
  columns: (1.5fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else { rgb("#F8FAFC") },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 4pt),
  table.header([*मेट्रिक कार्ड 01*], [*मेट्रिक कार्ड 02*], [*मेट्रिक कार्ड 03*]),
  [
    #text(size: 16pt, weight: "bold", fill: rgb("#059669"))[₹42.8 करोड़] \
    #text(size: 8pt, weight: "bold")[वार्षिक आवर्ती राजस्व (ARR)] \
    #text(size: 7pt, fill: rgb("#64748B"))[एशिया-प्रशांत क्षेत्र में +28.4% वार्षिक एंटरप्राइज विस्तार।]
  ],
  [
    #text(size: 16pt, weight: "bold", fill: rgb("#2563EB"))[99.98%] \
    #text(size: 8pt, weight: "bold")[कोर प्लेटफॉर्म एसएलए अपटाइम] \
    #text(size: 7pt, fill: rgb("#64748B"))[तीसरी तिमाही के पीक लेन-देन में शून्य रुकावट।]
  ],
  [
    #text(size: 16pt, weight: "bold", fill: rgb("#D97706"))[14.2 माह] \
    #text(size: 8pt, weight: "bold")[ग्राहक भुगतान वापसी अवधि] \
    #text(size: 7pt, fill: rgb("#64748B"))[स्वचालित ऑनबोर्डिंग द्वारा ग्राहक अधिग्रहण लागत में 18% कमी।]
  ]
)

#v(3pt)

== 23.6 मूल्यांकन डैशबोर्ड: तकनीकी बहुविकल्पीय प्रश्न (MCQs)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "आधुनिक पावरपॉइंट प्रस्तुतियों का मानक आस्पेक्ट रेशियो क्या है?", ans: "16:9 वाइडस्क्रीन (Widescreen)।")
    #short-qa(num: 2, q: "प्रस्तुति का 6x6 नियम क्या निर्धारित करता है?", ans: "अधिकतम 6 बुलेट पॉइंट्स, प्रति बुलेट अधिकतम 6 शब्द।")
    #short-qa(num: 3, q: "पावरपॉइंट में अलाइनमेंट ग्रिड टॉगल करने का शॉर्टकट क्या है?", ans: "Shift + F9 शॉर्टकट।")
    #short-qa(num: 4, q: "लाइव प्रेजेंटेशन में बॉडी टेक्स्ट का न्यूनतम फोंट साइज क्या होना चाहिए?", ans: "14pt से 16pt (न्यूनतम 12pt)।")
  ],
  [
    #mcq(num: 1, q: "आधुनिक मॉनिटरों और वीडियो कॉन्फ्रेंसिंग हेतु किस आस्पेक्ट रेशियो का प्रयोग करना चाहिए?", a: "4:3 स्टैंडर्ड", b: "16:9 वाइडस्क्रीन", c: "1:1 चौकोर", d: "9:16 वर्टिकल", ans: "B", expl: "16:9 आधुनिक वाइडस्क्रीन डिस्प्ले का सार्वभौमिक वैश्विक मानक है।")
    #mcq(num: 2, q: "पावरपॉइंट डिजाइनर (Design Ideas) का मुख्य कार्य क्या है?", a: "स्पेलिंग चेक करना", b: "AI द्वारा टेक्स्ट को स्वचालित रूप से सुंदर विजुअल कार्ड्स में बदलना", c: "वीडियो का आकार छोटा करना", d: "पीडीएफ में निर्यात करना", ans: "B", expl: "डिजाइनर कृत्रिम बुद्धिमत्ता का उपयोग करके सामग्री को आकर्षक लेआउट में ढालता है।")
    #mcq(num: 3, q: "स्लाइड टाइपोग्राफी में उच्च कंट्रास्ट (कम से कम 4.5:1) क्यों अनिवार्य है?", a: "फाइल बड़ी करने हेतु", b: "प्रोजेक्टर की तेज रोशनी में भी अक्षरों को स्पष्ट व पठनीय बनाए रखने हेतु", c: "एनीमेशन सक्षम करने हेतु", d: "ट्रांजिशन अनलॉक करने हेतु", ans: "B", expl: "कमजोर कंट्रास्ट प्रोजेक्टर पर धुल जाता है; उच्च कंट्रास्ट स्पष्ट पठनीयता सुनिश्चित करता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 डायनामिक अल्ट्रा-वाइड डिस्प्ले अनुकूलन", [
  पावरपॉइंट 365 एंटरप्राइज अब स्लाइड कैनवास को 21:9 अल्ट्रा-वाइड वीडियो वॉल तथा मल्टी-मॉनिटर कमांड सेंटरों के अनुसार स्वतः स्केल करता है, जिससे वेक्टर SVG और ग्रिड बिना किसी पिक्सलेशन के पूरी तरह शार्प रहते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-23.typ"), "w", encoding="utf-8") as f:
        f.write(ch23_en)
    with open(os.path.join(hi_dir, "chapter-23.typ"), "w", encoding="utf-8") as f:
        f.write(ch23_hi)

    # =========================================================================
    # CHAPTER 24: Slide Master Architecture & Custom Brand Layouts (3 Pages)
    # =========================================================================
    ch24_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 24]
= Slide Master Architecture, Custom Layouts & Brand Template Engineering

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Creating 100-slide enterprise decks without the Slide Master leads to formatting chaos, broken alignment, and mismatched brand fonts. Slide Master architecture enforces centralized typography, automated page numbering, protected corporate logos, and locked layout placeholders.
]

#v(2pt)

== 24.1 The Two-Tier Slide Master Hierarchy

Entering Slide Master mode (`View` > `Slide Master`):
- *The Parent Slide Master (Top-Level Node)*:
  - Represented by the large top slide in the thumbnail pane.
  - Changes made here cascade universally to every single layout in the entire presentation.
  - Setting the primary font family (*Segoe UI Variable*), background fill, and corporate logo placement here guarantees 100% deck-wide consistency.
- *Child Layout Masters (Derivative Nodes)*:
  - Indented beneath the parent master (e.g. *Title Slide*, *Title and Content*, *Section Header*, *Two Content*, *Comparison*).
  - Custom modifications here apply strictly to slides assigned that specific layout archetype.

#v(2pt)
#ribbon-specimen(path: "View > Master Views > Slide Master", command: "Parent Master & Layout Editor", shortcut: "Alt + W > M")
#v(2pt)

== 24.2 Engineered Placeholders vs. Static Text Boxes

Amateurs insert regular text boxes on master slides; professionals insert dynamic *Placeholders*:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Placeholder Type*], [*Operational Behavior on Live Slide*], [*Enterprise Production Utility*]),
  [Content], [Multi-purpose prompt allowing text, table, chart, SmartArt, picture, or video.], [Universal body slides.],
  [Text], [Pre-formatted text block with hierarchical bullet indentation and tab stops.], [Executive summary takeaways.],
  [Picture / Image], [Single-click image picker that automatically centers and crops to placeholder bounds.], [Team headshots & product photos.],
  [Chart], [Launches Excel chart builder with pre-configured corporate color palette.], [Financial earnings metrics.],
  [Table], [Prompts for row/column count and applies locked corporate table formatting.], [SLA comparison grids.]
)

#pagebreak()

== 24.3 Building a Protected Corporate Brand Template (.potx)

When distributing templates to 5,000 corporate employees, the design must be resilient against accidental tampering:
- *Color Theme Palette*: Define 2 Dark colors, 2 Light colors, and 6 Accent colors under `Colors` > `Customize Colors`.
- *Locked Elements*: Place corporate watermarks, background diagonal grid lines, and confidentiality legal notices on the parent master. On live slides, regular users cannot click, nudge, or accidentally delete these elements.
- *Dynamic Footers*: Configure the 3 standard footer zones:
  - *Date Zone*: Dynamic update or fixed release timestamp.
  - *Footer Text*: `CONFIDENTIAL · RTECHLAB ENTERPRISE REVIEW ONLY`.
  - *Slide Number*: Automated `<#>` field.
- *Saving the Template*: Save the file as a PowerPoint Template (`.potx`). When double-clicked, it spawns a fresh `Presentation1.pptx` instance, leaving the original master file untouched.

#v(2pt)
#ribbon-specimen(path: "Slide Master > Background > Colors", command: "Custom Brand Theme Palette", shortcut: "Alt + M > T")
#v(2pt)

== 24.4 Managing Multiple Slide Masters in One Deck

Complex enterprise decks frequently combine dark-themed section divider slides with light-themed content slides:
- *Insert Slide Master*: Click `Insert Slide Master` to create an independent second master tree.
- *Dark Master Theme*: Style Master 2 with `#0F172A` deep navy fill, white typography, and vibrant cyan accents for major milestone transitions.
- *Preserve Master*: Right-click the master thumbnail and select *Preserve Master* (indicated by a pushpin icon). This prevents PowerPoint from automatically purging the master if no active slides currently reference it.

#pagebreak()

== 24.5 Production Blueprint: Corporate Brand Master Specifications

#table(
  columns: (1.5fr, 1.8fr, 2.7fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*Master Component*], [*Design Parameter*], [*Production Configuration Detail*]),
  [Header Title Placeholder], [40pt Bold, Segoe UI], [Color: `#0F172A`, Margin: Top 0.8 in, Left 0.8 in, Auto-fit disabled.],
  [Body Content Placeholder], [16pt Regular / 24pt Line Spacing], [Color: `#334155`, Multi-level bullet list with custom square bullets.],
  [Corporate Emblem Anchor], [Top-Right Corner (`1.2 in × 0.4 in`)], [Transparent PNG logo anchored on Parent Master, locked from user selection.],
  [Confidentiality Banner], [Bottom Footer (8pt Uppercase)], [Locked text: `RTECHLAB 2027 CONFIDENTIAL · ALL RIGHTS RESERVED` + Automated `<#>`.]
)

#v(3pt)

== 24.6 Evaluation Dashboard: Technical MCQs & Review Q&A

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What is the key difference between the parent master and child layout masters?", ans: "Parent changes apply universally; child changes apply only to that layout.")
    #short-qa(num: 2, q: "What file extension is used to save reusable corporate PowerPoint templates?", ans: ".potx template extension.")
    #short-qa(num: 3, q: "Why should an image placeholder be used instead of inserting a regular picture?", ans: "Placeholders automatically crop and position images consistently across slides.")
    #short-qa(num: 4, q: "What does the 'Preserve Master' feature prevent?", ans: "Prevents unused masters from being auto-deleted.")
  ],
  [
    #mcq(num: 1, q: "Where must a corporate logo be placed so it appears automatically across every slide and cannot be edited by normal users?", a: "On Slide 1 in Normal view", b: "On the Top Parent Slide Master", c: "In the Slide Notes section", d: "In the Quick Access Toolbar", ans: "B", expl: "Elements placed on the top parent slide master cascade to all layouts and are locked in normal view.")
    #mcq(num: 2, q: "Which file format spawns an unsaved new presentation (.pptx) when opened by an employee?", a: ".pptm", b: ".potx", c: ".ppsx", d: ".pdf", ans: "B", expl: ".potx is the PowerPoint template format designed to protect the source template.")
    #mcq(num: 3, q: "What happens when you delete a text placeholder on the Parent Slide Master?", a: "The entire presentation is deleted", b: "The title/body text field vanishes from all derived layouts", c: "PowerPoint crashes", d: "Text converts to an image", ans: "B", expl: "Deleting a placeholder on the parent cascades down to all child layouts.")
  ]
)

#v(2pt)

#spotlight-box("2027 ENTERPRISE CLOUD BRAND KIT SYNCHRONIZATION", [
  PowerPoint 365 connects directly to corporate Azure AD Brand Kits. When executive leadership updates the corporate color palette or typography in the Microsoft 365 Admin Center, thousands of distributed `.potx` templates update dynamically in real time.
])
"""

    ch24_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[भाग 3: माइक्रोसॉफ्ट पावरपॉइंट 365 मास्टरक्लास · अध्याय 24]
= स्लाइड मास्टर संरचना, कस्टम लेआउट्स एवं ब्रांड टेम्पलेट इंजीनियरिंग

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  स्लाइड मास्टर का उपयोग किए बिना 100 स्लाइड्स की कॉर्पोरेट प्रस्तुति तैयार करने से लेआउट में बिखराव, फोंट की विसंगति तथा लोगो का मिसअलाइनमेंट होता है। स्लाइड मास्टर संरचना केंद्रीय टाइपोग्राफी, स्वचालित पृष्ठ संख्या, सुरक्षित लोगो तथा पूर्वनिर्धारित प्लेसहोल्डर्स सुनिश्चित करती है।
]

#v(2pt)

== 24.1 दो-स्तरीय स्लाइड मास्टर पदानुक्रम (Hierarchy)

स्लाइड मास्टर मोड में प्रवेश (`View` > `Slide Master`):
- *मुख्य पैरेंट स्लाइड मास्टर (Parent Slide Master)*:
  - थंबनेल पेन में सबसे ऊपर स्थित बड़ा स्लाइड।
  - यहां किए गए सभी परिवर्तन प्रस्तुति के प्रत्येक लेआउट पर स्वतः लागू हो जाते हैं।
  - प्राथमिक फोंट (*Segoe UI Variable*), बैकग्राउंड रंग तथा कंपनी लोगो यहां सेट करने से 100% एकरूपता बनी रहती है।
- *चाइल्ड लेआउट मास्टर्स (Child Layouts)*:
  - पैरेंट के नीचे जुड़े हुए छोटे लेआउट्स (जैसे *Title Slide*, *Title and Content*, *Section Header*, *Two Content*)।
  - यहां किए गए परिवर्तन केवल उसी विशिष्ट लेआउट वाली स्लाइड्स पर लागू होते हैं।

#v(2pt)
#ribbon-specimen(path: "व्यू > मास्टर व्यूज > स्लाइड मास्टर", command: "पैरेंट मास्टर एवं लेआउट एडिटर", shortcut: "Alt + W > M")
#v(2pt)

== 24.2 डायनामिक प्लेसहोल्डर बनाम साधारण टेक्स्ट बॉक्स

साधारण उपयोगकर्ता मास्टर पर सामान्य टेक्स्ट बॉक्स बना देते हैं, जबकि पेशेवर *प्लेसहोल्डर्स* जोड़ते हैं:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*प्लेसहोल्डर प्रकार*], [*लाइव स्लाइड पर व्यवहार*], [*कॉर्पोरेट उपयोगिता*]),
  [कंटेंट (Content)], [बहुउद्देशीय प्रॉम्प्ट: टेक्स्ट, तालिका, चार्ट, स्मार्टआर्ट, चित्र या वीडियो।], [मानक बॉडी स्लाइड्स।],
  [टेक्स्ट (Text)], [पदानुक्रमित बुलेट लेवल्स एवं टैब सेटिंग्स से युक्त टेक्स्ट ब्लॉक।], [कार्यकारी सारांश के मुख्य बिंदु।],
  [पिक्चर (Picture)], [एक-क्लिक इमेज पिकर जो फोटो को तय आकार में स्वतः क्रॉप कर देता है।], [टीम मेंबर्स के हेडशॉट्स एवं उत्पाद फोटो।],
  [चार्ट (Chart)], [ब्रांड कलर पैलेट के साथ सीधे एक्सेल चार्ट बिल्डर खोलता है।], [तिमाही वित्तीय परिणाम मेट्रिक्स।],
  [टेबल (Table)], [पंक्तियों व स्तंभों की संख्या पूछकर ब्रांडेड तालिका बनाता है।], [तुलनात्मक विश्लेषण ग्रिड।]
)

#pagebreak()

== 24.3 सुरक्षित कॉर्पोरेट ब्रांड टेम्पलेट (.potx) का निर्माण

हजारों कर्मचारियों के लिए कंपनी टेम्पलेट तैयार करते समय डिजाइन को सुरक्षित रखना आवश्यक है:
- *कलर थीम पैलेट*: `Colors` > `Customize Colors` में जाकर 2 डार्क, 2 लाइट तथा 6 एक्सेंट रंग सेट करें।
- *सुरक्षित तत्व (Locked Elements)*: कंपनी वॉटरमार्क, ग्रिडलाइन्स तथा कॉपीराइट नोटिस को पैरेंट मास्टर पर रखें। साधारण स्लाइड पर काम करते समय कर्मचारी इन पर क्लिक करके इन्हें हटा नहीं सकते।
- *डायनामिक फुटर्स*: 3 मुख्य फुटर फील्ड्स कॉन्फ़िगर करें:
  - *दिनांक*: स्वतः अपडेट होने वाली या निश्चित रिलीज तिथि।
  - *फुटर टेक्स्ट*: `गोपनीय · केवल आरटेक लैब आंतरिक समीक्षा हेतु`।
  - *स्लाइड संख्या*: स्वचालित `<#>` फील्ड।
- *टेम्पलेट सेव करना*: फाइल को पावरपॉइंट टेम्पलेट (`.potx`) के रूप में सेव करें। कर्मचारी जब इस पर डबल-क्लिक करेंगे, तो एक नई अनटाइटल्ड `.pptx` फाइल खुलेगी, जिससे मूल टेम्पलेट सुरक्षित रहता है।

#v(2pt)
#ribbon-specimen(path: "स्लाइड मास्टर > बैकग्राउंड > रंग", command: "कस्टम ब्रांड थीम कलर पैलेट", shortcut: "Alt + M > T")
#v(2pt)

== 24.4 एक ही डेक में एकाधिक स्लाइड मास्टर्स का प्रबंधन

जटिल कॉर्पोरेट डेक में डार्क थीम वाले सेक्शन डिवाइडर तथा लाइट थीम वाले कंटेंट पेज होते हैं:
- *नया स्लाइड मास्टर जोड़ें*: `Insert Slide Master` पर क्लिक करके एक पूरी दूसरी स्वतंत्र मास्टर शाखा बनाएं।
- *डार्क मास्टर थीम*: मास्टर 2 को गहरे नीले `#0F172A` बैकग्राउंड, सफेद फोंट तथा सियान एक्सेंट के साथ डिजाइन करें।
- *मास्टर सुरक्षित रखें (Preserve Master)*: थंबनेल पर राइट-क्लिक करके *Preserve Master* चुनें। इससे यदि किसी स्लाइड में वह लेआउट तुरंत इस्तेमाल न भी हो रहा हो, तब भी पावरपॉइंट उसे स्वतः डिलीट नहीं करता।

#pagebreak()

== 24.5 व्यावहारिक ब्लूप्रिंट: कॉर्पोरेट ब्रांड मास्टर विनिर्देश (Specs)

#table(
  columns: (1.5fr, 1.8fr, 2.7fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*मास्टर घटक*], [*डिजाइन पैरामीटर*], [*कॉन्फ़िगरेशन विवरण*]),
  [शीर्षक प्लेसहोल्डर], [40pt बोल्ड, Segoe UI], [रंग: `#0F172A`, मार्जिन: टॉप 0.8 इंच, लेफ्ट 0.8 इंच, ऑटो-फिट बंद।],
  [बॉडी कंटेंट प्लेसहोल्डर], [16pt रेगुलर / 24pt लाइन स्पेसिंग], [रंग: `#334155`, कस्टम चौकोर बुलेट्स के साथ मल्टी-लेवल सूची।],
  [कंपनी लोगो], [ऊपरी दाएं कोने में (`1.2 in × 0.4 in`)], [पैरेंट मास्टर पर लॉक पारदर्शी PNG लोगो, साधारण दृश्य में अन-क्लिकेबल।],
  [गोपनीयता फुटर], [निचला फुटर (8pt कैपिटल)], [लॉक्ड टेक्स्ट: `RTECHLAB 2027 CONFIDENTIAL` + स्वचालित पृष्ठ संख्या `<#>`।]
)

#v(3pt)

== 24.6 मूल्यांकन डैशबोर्ड: तकनीकी बहुविकल्पीय प्रश्न (MCQs)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "पैरेंट मास्टर और चाइल्ड लेआउट में मुख्य अंतर क्या है?", ans: "पैरेंट के बदलाव सभी पर लागू होते हैं; चाइल्ड के केवल उसी लेआउट पर।")
    #short-qa(num: 2, q: "पुनः प्रयोज्य कॉर्पोरेट टेम्पलेट को किस एक्सटेंशन में सेव किया जाता है?", ans: ".potx एक्सटेंशन में।")
    #short-qa(num: 3, q: "साधारण पिक्चर की जगह पिक्चर प्लेसहोल्डर का उपयोग क्यों किया जाता है?", ans: "यह छवियों को तय आकार में स्वतः क्रॉप व संरेखित करता है।")
    #short-qa(num: 4, q: "'Preserve Master' फीचर क्या करता है?", ans: "अप्रयुक्त मास्टर लेआउट्स को स्वतः डिलीट होने से बचाता है।")
  ],
  [
    #mcq(num: 1, q: "कंपनी का लोगो कहां रखना चाहिए ताकि वह सभी स्लाइड्स पर दिखे और कोई कर्मचारी उसे हटा न सके?", a: "स्लाइड 1 पर साधारण व्यू में", b: "शीर्ष पैरेंट स्लाइड मास्टर पर", c: "नोट्स सेक्शन में", d: "क्विक एक्सेस टूलबार में", ans: "B", expl: "पैरेंट स्लाइड मास्टर पर रखे गए तत्व सभी स्लाइड्स पर लॉक रहते हैं।")
    #mcq(num: 2, q: "कर्मचारियों द्वारा खोलने पर एक नई अनसेव्ड (.pptx) फाइल बनाने वाला फॉर्मेट कौन सा है?", a: ".pptm", b: ".potx", c: ".ppsx", d: ".pdf", ans: "B", expl: ".potx पावरपॉइंट टेम्पलेट फॉर्मेट है जो मूल फाइल को सुरक्षित रखता है।")
    #mcq(num: 3, q: "पैरेंट स्लाइड मास्टर से टाइटल प्लेसहोल्डर हटाने पर क्या होता है?", a: "पूरी फाइल डिलीट हो जाती है", b: "शीर्षक सभी संबंधित लेआउट्स से गायब हो जाता है", c: "सॉफ्टवेयर क्रैश हो जाता है", d: "टेक्स्ट इमेज में बदल जाता है", ans: "B", expl: "पैरेंट पर किया गया बदलाव सभी चाइल्ड लेआउट्स में तुरंत लागू हो जाता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 एंटरप्राइज क्लाउड ब्रांड किट सिंक्रोनाइज़ेशन", [
  पावरपॉइंट 365 अब सीधे माइक्रोसॉफ्ट 365 एडमिन सेंटर में होस्ट किए गए ब्रांड किट से जुड़ता है। जब मुख्यालय में ब्रांड रंग या फोंट बदले जाते हैं, तो दुनिया भर में काम कर रहे सभी कर्मचारियों के `.potx` टेम्पलेट्स तुरंत क्लाउड से अपडेट हो जाते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-24.typ"), "w", encoding="utf-8") as f:
        f.write(ch24_en)
    with open(os.path.join(hi_dir, "chapter-24.typ"), "w", encoding="utf-8") as f:
        f.write(ch24_hi)

    # =========================================================================
    # CHAPTER 25: Visual Design, Boolean Shapes & SmartArt (3 Pages)
    # =========================================================================
    ch25_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 25]
= Vector Graphic Engineering, Boolean Shape Operations & SmartArt Systems

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Executive communication demands customized visual metaphors that generic stock illustrations cannot deliver. PowerPoint's Boolean Merge Shapes engine transforms basic geometric primitives into sophisticated vector diagrams, iconography, and multi-tier organizational architectures.
]

#v(2pt)

== 25.1 The 5 Boolean Merge Shape Operations

PowerPoint includes a full-fledged vector pathfinder engine (`Shape Format` > `Merge Shapes`). By selecting two or more overlapping vector shapes:
- *Union*: Combines all selected shapes into a single unified outline path, dissolving internal boundaries.
- *Combine*: Merges shapes into one object, but *punches a transparent hole* where the shapes overlap (XOR logic).
- *Fragment*: Breaks overlapping shapes into every discrete intersecting polygon, creating separate editable sub-shapes.
- *Intersect*: Keeps *only* the region where all selected shapes overlap, discarding all outer perimeters.
- *Subtract*: Cuts away the shape selected *second* from the shape selected *first* (order of selection is critical!).

#v(2pt)
#ribbon-specimen(path: "Shape Format > Insert Shapes > Merge Shapes", command: "Boolean Union, Fragment, Subtract", shortcut: "Alt + JD > M")
#v(2pt)

== 25.2 Professional Vector Iconography & SVG Manipulation

Modern 2027 slide decks use Scalable Vector Graphics (SVG) instead of rasterized JPEGs or PNGs:
- *Scalability*: SVGs render via mathematical coordinates, maintaining razor-sharp edges on 8K display walls without pixelation.
- *Convert to Shape*: Right-click any inserted SVG icon and select *Convert to Shape*. PowerPoint immediately breaks the SVG into native PowerPoint vector paths.
- *Granular Customization*: Once converted, individual sub-paths (e.g. changing just the gear tooth color or an arrow tip) can be recolored using the brand palette.

#table(
  columns: (1.2fr, 2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Boolean Tool*], [*Mathematical Action*], [*Real-World Slide Design Application*]),
  [Union], [Path addition (A ∪ B)], [Creating custom multi-prong cloud or server cluster icons.],
  [Subtract], [Difference set (A - B)], [Cutting a circular picture window out of a solid dark background card.],
  [Fragment], [Full intersection split], [Creating custom pie wedges, Venn diagram slices, or multi-colored gears.],
  [Intersect], [Intersection set (A ∩ B)], [Cropping an intricate photographic texture precisely inside geometric typography.]
)

#pagebreak()

== 25.3 Converting Bullets to SmartArt & Deconstructing to Shapes

SmartArt provides structured layout algorithms for organizational charts, process funnels, and cyclical systems:
- *Convert Text to SmartArt*: Select any bulleted list, right-click, and choose `Convert to SmartArt Graphic`. PowerPoint instantly maps bullets to process chevrons or hierarchy trees.
- *The "SmartArt Prison" Trap*: Default SmartArt graphics look rigid and standardized.
- *Professional Deconstruction*:
  1. Select the SmartArt graphic.
  2. Press `Ctrl + Shift + G` (Ungroup) once to convert SmartArt into a grouped collection of standard PowerPoint shapes.
  3. Press `Ctrl + Shift + G` a second time to break all elements into individual free-floating vector shapes.
  4. Now apply custom drop shadows, bespoke card radii, and independent animation triggers without layout constraints!

#v(2pt)

== 25.4 The 4 Fundamental SmartArt Diagram Categories

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("PROCESS & ROADMAP FLOWS", [
      Linear workflows, milestone timelines, and agile sprints.
      - *Layouts*: Chevron Process, Step-Down Process, Timeline.
      - *Rule*: Flow must strictly proceed from left to right (or top to bottom in vertical formats).
    ])
    #v(3pt)
    #callout-box("HIERARCHY & ORG STRUCTURES", [
      Corporate reporting trees, cloud component inheritance, and taxonomy.
      - *Layouts*: Organization Chart, Horizontal Hierarchy.
      - *Rule*: Limit vertical depth to 3 levels per slide to preserve font legibility.
    ])
  ],
  [
    #callout-box("CYCLE & FEEDBACK LOOPS", [
      Continuous improvement, DevOps loops, and product lifecycles.
      - *Layouts*: Block Cycle, Continuous Cycle, Radial Venn.
      - *Rule*: Ensure arrow directional continuity aligns with operational reality.
    ])
    #v(3pt)
    #callout-box("MATRIX & PYRAMID MODELS", [
      Prioritization quadrants (Eisenhower matrix) and Maslow hierarchies.
      - *Layouts*: 2x2 Grid Matrix, Segmented Pyramid.
      - *Rule*: Clearly label horizontal (effort) and vertical (impact) axes.
    ])
  ]
)

#pagebreak()

== 25.5 Production Blueprint: Bespoke 4-Step Agile Delivery Pipeline

Below is a custom-engineered pipeline diagram created via Boolean Fragment and converted SmartArt:

#table(
  columns: (1.2fr, 1.2fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else { rgb("#F8FAFC") },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 4pt),
  table.header([*STAGE 1: DISCOVERY*], [*STAGE 2: ARCHITECTURE*], [*STAGE 3: SPRINT DEV*], [*STAGE 4: DEPLOYMENT*]),
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#0284C7"))[Phase 01 · Week 1-2] \
    - Stakeholder interviews \
    - Data schema audit \
    - Security SLA baseline
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#059669"))[Phase 02 · Week 3-4] \
    - Azure tenant design \
    - IAM role mapping \
    - CI/CD pipeline spec
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#D97706"))[Phase 03 · Week 5-8] \
    - Microservice build \
    - Unit test coverage > 90% \
    - Bi-weekly demo review
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#7C3AED"))[Phase 04 · Week 9-10] \
    - Blue/Green zero-downtime \
    - CloudWatch telemetry \
    - Client sign-off handover
  ]
)

#v(3pt)

== 25.6 Evaluation Dashboard: Technical MCQs & Review Q&A

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which Merge Shapes operation cuts away overlapping areas creating a transparent hole?", ans: "Combine (XOR logic).")
    #short-qa(num: 2, q: "What keyboard shortcut ungroups SmartArt or grouped vector shapes?", ans: "Ctrl + Shift + G.")
    #short-qa(num: 3, q: "Why are SVG files preferred over PNGs in modern 2027 slide decks?", ans: "SVGs scale infinitely without pixelation and can convert to editable native shapes.")
    #short-qa(num: 4, q: "In the Subtract operation, which shape is cut away?", ans: "The shape selected second is cut from the shape selected first.")
  ],
  [
    #mcq(num: 1, q: "What happens when you select an SVG icon and click 'Convert to Shape'?", a: "It deletes the icon", b: "It breaks the SVG into fully editable native PowerPoint vector paths", c: "It converts it into an animated GIF", d: "It uploads it to OneDrive", ans: "B", expl: "'Convert to Shape' decomposes vector SVGs into native Microsoft drawing objects.")
    #mcq(num: 2, q: "Which Boolean tool splits multiple overlapping shapes into every single intersecting polygon?", a: "Union", b: "Fragment", c: "Subtract", d: "Intersect", ans: "B", expl: "Fragment slices every intersection into separate, independently movable pieces.")
    #mcq(num: 3, q: "How many times must you press Ctrl+Shift+G on a SmartArt graphic to break it into individual loose shapes?", a: "Once", b: "Twice", c: "Three times", d: "Never", ans: "B", expl: "First ungrouping turns SmartArt into a shape group; second ungrouping releases all individual shapes.")
  ]
)

#v(2pt)

#spotlight-box("2027 3D PROCEDURAL SHAPES & SPATIAL ASSETS", [
  PowerPoint 365 natively renders glTF/GLB 3D models with real-time physical lighting. Engineers can rotate 3D jet engines or architectural BIM models 360 degrees directly on the slide during live stakeholder reviews.
])
"""

    ch25_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[भाग 3: माइक्रोसॉफ्ट पावरपॉइंट 365 मास्टरक्लास · अध्याय 25]
= वेक्टर ग्राफिक इंजीनियरिंग, बूलियन शेप ऑपरेशंस एवं स्मार्टआर्ट सिस्टम्स

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  कॉर्पोरेट प्रस्तुतियों में अनूठे विजुअल सिंबल्स की आवश्यकता होती है जो साधारण क्लिप आर्ट से संभव नहीं हैं। पावरपॉइंट का बूलियन 'मर्ज शेप्स' (Merge Shapes) इंजन साधारण ज्यामितीय आकृतियों को जटिल वेक्टर डायग्राम, कस्टम आइकन तथा बहु-स्तरीय संगठनात्मक संरचनाओं में बदल देता है।
]

#v(2pt)

== 25.1 बूलियन मर्ज शेप्स (Merge Shapes) के 5 मुख्य ऑपरेशंस

पावरपॉइंट में संपूर्ण वेक्टर पाथफाइंडर टूल शामिल है (`Shape Format` > `Merge Shapes`)। दो या अधिक आकृतियों को चुनकर:
- *यूनियन (Union)*: सभी चुनी गई आकृतियों को जोड़कर एक एकल संयुक्त बाहरी पथ बनाता है, आंतरिक रेखाएं मिट जाती हैं।
- *कंबाइन (Combine)*: आकृतियों को एक बनाता है, परंतु जहां वे एक-दूसरे को ओवरलैप करती हैं वहां *पारदर्शी छेद* कर देता है (XOR लॉजिक)।
- *फ्रेगमेंट (Fragment)*: ओवरलैप करने वाले सभी हिस्सों को अलग-अलग स्वतंत्र बहुभुज (Polygons) में काट देता है।
- *इंटरसेक्ट (Intersect)*: केवल उस क्षेत्र को रखता है जहां सभी आकृतियां आपस में मिलती हैं, बाकी सब हटा देता है।
- *सबट्रैक्ट (Subtract)*: *पहले* चुनी गई आकृति में से *दूसरी* चुनी गई आकृति के क्षेत्र को काटकर अलग कर देता है।

#v(2pt)
#ribbon-specimen(path: "शेप फॉर्मेट > इन्सर्ट शेप्स > मर्ज शेप्स", command: "बूलियन यूनियन, फ्रेगमेंट, सबट्रैक्ट", shortcut: "Alt + JD > M")
#v(2pt)

== 25.2 पेशेवर वेक्टर आइकनोग्राफी एवं SVG संपादन

आधुनिक 2027 प्रेजेंटेशन में साधारण फोटो (JPEG/PNG) के स्थान पर स्केलेबल वेक्टर ग्राफिक्स (SVG) का प्रयोग होता है:
- *असीमित स्केलेबिलिटी*: SVG गणितीय निर्देशांकों पर आधारित होते हैं, अतः 8K स्क्रीन पर भी पिक्सल कभी नहीं फटते।
- *कन्वर्ट टू शेप (Convert to Shape)*: SVG आइकन पर राइट-क्लिक करके *Convert to Shape* चुनें। पावरपॉइंट तुरंत उसे संपादन योग्य वेक्टर पाथ में बदल देता है।
- *व्यक्तिगत कस्टमाइज़ेशन*: बदलने के बाद, आप आइकन के किसी एक हिस्से (जैसे गियर के दांत या तीर की नोक) का रंग अलग से बदल सकते हैं।

#table(
  columns: (1.2fr, 2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*बूलियन टूल*], [*गणितीय कार्य*], [*व्यावहारिक स्लाइड डिजाइन उपयोग*]),
  [यूनियन], [आकृतियों का योग (A ∪ B)], [कस्टम क्लाउड आइकन या सर्वर क्लस्टर डायग्राम बनाना।],
  [सबट्रैक्ट], [क्षेत्र का घटाव (A - B)], [डार्क कार्ड के बीच में फोटो हेतु पारदर्शी गोल खिड़की काटना।],
  [फ्रेगमेंट], [संपूर्ण विखंडन], [कस्टम वेन आरेख स्लाइस, पाई चार्ट टुकड़े या बहुरंगी गियर्स बनाना।],
  [इंटरसेक्ट], [उभयनिष्ठ क्षेत्र (A ∩ B)], [किसी शब्द (Typography) के भीतर सुंदर फोटो बनावट भरना।]
)

#pagebreak()

== 25.3 बुलेट बिंदुओं को स्मार्टआर्ट में बदलना एवं उन्हें मुक्त करना

स्मार्टआर्ट संगठनात्मक चार्ट्स, कार्यप्रवाहों तथा चक्रीय प्रक्रियाओं हेतु स्वतः लेआउट बनाता है:
- *टेक्स्ट को स्मार्टआर्ट में बदलना*: बुलेट सूची पर राइट-क्लिक करें और `Convert to SmartArt Graphic` चुनें। टेक्स्ट तुरंत सुंदर चेवरॉन या ट्री में बदल जाता है।
- *स्मार्टआर्ट का बंधन*: डिफ़ॉल्ट स्मार्टआर्ट देखने में कठोर और सामान्य लगता है।
- *पेशेवर विखंडन (Deconstruction)*:
  1. स्मार्टआर्ट ग्राफिक को चुनें।
  2. `Ctrl + Shift + G` (Ungroup) दबाएं — यह स्मार्टआर्ट को साधारण ग्रुप में बदल देगा।
  3. पुनः `Ctrl + Shift + G` दबाएं — अब सभी आकृतियां पूरी तरह स्वतंत्र वेक्टर शेप्स बन जाएंगी।
  4. अब आप अपनी इच्छानुसार ड्रॉप शैडो, कस्टम कोने तथा मनचाहे एनिमेशन बिना किसी पाबंदी के लगा सकते हैं!

#v(2pt)

== 25.4 स्मार्टआर्ट डायग्राम्स की 4 प्रमुख श्रेणियां

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("प्रक्रिया एवं रोडमैप (Process)", [
      रैखिक कार्यप्रवाह, माइलस्टोन टाइमलाइन तथा स्प्रिंट्स।
      - *लेआउट्स*: Chevron Process, Step-Down, Timeline।
      - *नियम*: प्रवाह अनिवार्य रूप से बाएं से दाएं होना चाहिए।
    ])
    #v(3pt)
    #callout-box("पदानुक्रम एवं संगठन चार्ट (Hierarchy)", [
      कंपनी रिपोर्टिंग संरचना, क्लाउड आर्किटेक्चर एवं टैक्सोनॉमी।
      - *लेआउट्स*: Organization Chart, Horizontal Hierarchy।
      - *नियम*: पठनीयता बनाए रखने हेतु गहराई 3 स्तरों तक सीमित रखें।
    ])
  ],
  [
    #callout-box("चक्रीय एवं फीडबैक लूप (Cycle)", [
      निरंतर सुधार (Kaizen), DevOps लूप्स तथा जीवनचक्र।
      - *लेआउट्स*: Block Cycle, Continuous Cycle, Radial Venn।
      - *नियम*: तीरों की दिशा वास्तविक परिचालन के अनुरूप होनी चाहिए।
    ])
    #v(3pt)
    #callout-box("मैट्रिक्स एवं पिरामिड (Matrix)", [
      प्राथमिकता चतुर्थांश (2x2 Matrix) तथा आवश्यकता पिरामिड।
      - *लेआउट्स*: 2x2 Grid Matrix, Segmented Pyramid।
      - *नियम*: क्षैतिज (प्रयास) तथा लंबवत (प्रभाव) अक्ष स्पष्ट रूप से लेबल हों।
    ])
  ]
)

#pagebreak()

== 25.5 व्यावहारिक ब्लूप्रिंट: कस्टम 4-चरणीय एजाइल डिलीवरी पाइपलाइन

बूलियन फ्रेगमेंट एवं विखंडित स्मार्टआर्ट द्वारा निर्मित पेशेवर रोडमैप:

#table(
  columns: (1.2fr, 1.2fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else { rgb("#F8FAFC") },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 4pt),
  table.header([*चरण 1: खोज एवं ऑडिट*], [*चरण 2: आर्किटेक्चर*], [*चरण 3: स्प्रिंट विकास*], [*चरण 4: डिप्लॉयमेंट*]),
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#0284C7"))[फेज 01 · सप्ताह 1-2] \
    - हितधारक साक्षात्कार \
    - डेटा स्कीमा ऑडिट \
    - सुरक्षा एसएलए बेसलाइन
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#059669"))[फेज 02 · सप्ताह 3-4] \
    - एज्योर टेनेंट डिजाइन \
    - IAM रोल मैपिंग \
    - CI/CD पाइपलाइन योजना
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#D97706"))[फेज 03 · सप्ताह 5-8] \
    - माइक्रोसर्विस निर्माण \
    - यूनिट टेस्ट कवरेज > 90% \
    - द्विसाप्ताहिक डेमो रिव्यू
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#7C3AED"))[फेज 04 · सप्ताह 9-10] \
    - शून्य रुकावट माइग्रेशन \
    - क्लाउड मॉनिटरिंग \
    - अंतिम क्लाइंट हैंडओवर
  ]
)

#v(3pt)

== 25.6 मूल्यांकन डैशबोर्ड: तकनीकी बहुविकल्पीय प्रश्न (MCQs)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "ओवरलैप होने वाले हिस्से में छेद बनाने वाला बूलियन टूल कौन सा है?", ans: "कंबाइन (Combine / XOR logic)।")
    #short-qa(num: 2, q: "स्मार्टआर्ट या वेक्टर ग्रुप को अनग्रुप करने का शॉर्टकट क्या है?", ans: "Ctrl + Shift + G शॉर्टकट।")
    #short-qa(num: 3, q: "आधुनिक 2027 डेक में PNG की तुलना में SVG को प्राथमिकता क्यों दी जाती है?", ans: "SVG असीमित रूप से शार्प रहते हैं और संपादन योग्य आकृतियों में बदल जाते हैं।")
    #short-qa(num: 4, q: "सबट्रैक्ट ऑपरेशन में कौन सी आकृति कटती है?", ans: "बाद में चुनी गई आकृति पहले चुनी गई आकृति से कटती है।")
  ],
  [
    #mcq(num: 1, q: "SVG आइकन पर 'Convert to Shape' करने से क्या होता है?", a: "आइकन डिलीट हो जाता है", b: "यह पूरी तरह संपादन योग्य पावरपॉइंट वेक्टर आकृतियों में बदल जाता है", c: "यह जीआईएफ बन जाता है", d: "यह क्लाउड पर अपलोड हो जाता है", ans: "B", expl: "'कन्वर्ट टू शेप' वेक्टर फाइलों को सामान्य पावरपॉइंट आकृतियों में तोड़ देता है।")
    #mcq(num: 2, q: "सभी ओवरलैपिंग हिस्सों को अलग-अलग टुकड़ों में काटने वाला बूलियन टूल कौन सा है?", a: "यूनियन", b: "फ्रेगमेंट", c: "सबट्रैक्ट", d: "इंटरसेक्ट", ans: "B", expl: "फ्रेगमेंट सभी कटाव बिंदुओं पर स्वतंत्र आकृतियां बना देता है।")
    #mcq(num: 3, q: "स्मार्टआर्ट को अलग-अलग खुली आकृतियों में बदलने हेतु कितनी बार Ctrl+Shift+G दबाना पड़ता है?", a: "एक बार", b: "दो बार", c: "तीन बार", d: "कभी नहीं", ans: "B", expl: "पहली बार अनग्रुप करने से ग्रुप बनता है; दूसरी बार में सभी आकृतियां पूरी तरह स्वतंत्र हो जाती हैं।")
  ]
)

#v(2pt)

#spotlight-box("2027 3D प्रोसीजरल मॉडल एवं स्थानिक संपत्तियां", [
  पावरपॉइंट 365 glTF/GLB 3D मॉडल्स को सीधे स्लाइड पर रेंडर करता है। इंजीनियर लाइव मीटिंग के दौरान 3D जेट इंजन या आर्किटेक्चरल मॉडल को 360 डिग्री घुमाकर हर कोण से प्रदर्शित कर सकते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-25.typ"), "w", encoding="utf-8") as f:
        f.write(ch25_en)
    with open(os.path.join(hi_dir, "chapter-25.typ"), "w", encoding="utf-8") as f:
        f.write(ch25_hi)

    # =========================================================================
    # CHAPTER 26: Transitions & The 2027 Morph Revolution (3 Pages)
    # =========================================================================
    ch26_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 26]
= Slide Transitions, Cinematic Motion & The 2027 Morph Revolution

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Legacy presentation transitions (such as *Curtains*, *Checkerboard*, or *Dissolve*) appear juvenile and distract from corporate authority. The *Morph Transition* in Microsoft 365 creates seamless, physics-based cinematic motion by automatically interpolating matching objects across slides without complex animation timelines.
]

#v(2pt)

== 26.1 Morph Mechanics: Automatic Coordinate Interpolation

How Morph calculates motion:
1. When you duplicate a slide and move, resize, recolor, or rotate an object on Slide 2.
2. Applying the `Morph` transition to Slide 2 instructs PowerPoint's graphics engine to calculate the delta vectors.
3. During the slide change, PowerPoint renders a fluid, 60fps interpolation between State A and State B.
4. *Effect Options*: Choose between *Objects* (moves matching shapes/images), *Words* (reorganizes identical words across sentences), or *Characters* (transforms individual letters into new anagrams).

#v(2pt)
#ribbon-specimen(path: "Transitions > Transition to This Slide > Morph", command: "Cinematic Coordinate Interpolation", shortcut: "Alt + T > M")
#v(2pt)

== 26.2 The Secret Double-Exclamation `!!` Forced Morph Technique

Normally, Morph only transforms identical objects. If you want a square on Slide 1 to smoothly morph into a circle on Slide 2, standard Morph will fade out the square and fade in the circle:
- *The Solution: The Selection Pane (`Alt + F10`)*:
  1. Open the Selection Pane on Slide 1.
  2. Rename the square to `!!HeroShape`.
  3. Go to Slide 2 and rename the completely different circle to the exact same name: `!!HeroShape`.
- *The Magic*: The double exclamation mark prefix (`!!`) commands PowerPoint to force a geometrical vertex interpolation between the two entirely distinct shapes!

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Morph Application*], [*Slide 1 Setup*], [*Slide 2 Setup & Animated Outcome*]),
  [Seamless Data Zoom], [High-level world map showing 5 data centers.], [Zoomed-in map focused exclusively on Singapore DC with telemetry cards.],
  [Device Mockup Rotate], [Front-facing smartphone mockup showcasing app.], [Smartphone rotated 45 degrees revealing cloud infrastructure backend.],
  [Number Ticker Animation], [Metric showing `Rs. 10 Lakh` ARR.], [Metric showing `Rs. 50 Lakh` ARR (Interpolates with Character Morph).],
  [Progress Bar Advance], [Horizontal bar shape with width `2.0 in` (20%).], [Same bar shape lengthened to `8.0 in` (80% milestone achievement).]
)

#pagebreak()

== 26.3 Professional Transition Discipline: Fade vs. Push vs. Wipe

While Morph powers cinematic focal storytelling, standard slide-to-slide progression must remain subtle and invisible:
- *Fade (0.50s - 0.70s)*: The gold standard for corporate presentations. Provides a gentle, clean dissolve that keeps the audience focused entirely on the content.
- *Push / Wipe*: Ideal for chronological timelines or process stages. Always ensure directional logic matches reading order: *From Right* for forward progression; *From Left* for retrospective reviews.
- *Banned Transitions in Enterprise Decks*: Never use *Origami*, *Airplane*, *Curtains*, *Page Curl*, or *Fracture*. They erode executive credibility and induce cognitive fatigue.

#v(2pt)

== 26.4 Interactive Presentation Navigation: Zoom Links & Summary Slides

PowerPoint 365 introduces dynamic non-linear presentation workflows via the *Zoom* feature (`Insert` > `Zoom`):

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("SUMMARY ZOOM", [
      Creates an executive landing dashboard slide containing live miniature thumbnails of all major deck sections.
      - *Interactive Drilldown*: Click any section card during the board meeting to instantly zoom into that deep-dive deck.
      - *Return to Summary*: Automatically zooms back out to the main executive overview when the section finishes.
    ])
  ],
  [
    #callout-box("SLIDE & SECTION ZOOM", [
      Embeds a clickable visual portal to any specific slide or module.
      - *Use Case*: Answering unexpected stakeholder questions about deep financial assumptions without flipping through 50 linear slides.
      - *Appearance*: Can be styled as a clean icon or card with background graphics hidden.
    ])
  ]
)

#pagebreak()

== 26.5 Production Blueprint: Executive Product Reveal Sequence

Step-by-step choreography for a multi-slide Morph product showcase:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*Sequence Stage*], [*Visual Architecture Setup*], [*Morph Transition Parameters*]),
  [Slide 01: Hero Intro], [Large 3D cloud server vector centered at `100%` scale, Title: "Next-Gen Cloud Architecture".], [Standard 0.50s Fade transition from introductory agenda.],
  [Slide 02: Deep-Dive], [Server vector shrinks to `40%` and moves smoothly to Top-Left corner. 3 security cards glide in from off-canvas right.], [Morph Transition enabled. Duration: `1.25s`. Effect Option: `Objects`.],
  [Slide 03: Performance], [Security cards exit off-canvas left; server vector morphs into a glowing database cylinder named `!!ProductCore`.], [Morph Transition enabled. Duration: `1.00s`. Automatic vertex transformation via `!!` naming.]
)

#v(3pt)

== 26.6 Evaluation Dashboard: Technical MCQs & Review Q&A

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What naming convention forces PowerPoint Morph to transform two completely different shapes?", ans: "Prepend double exclamation marks (e.g. !!HeroShape).")
    #short-qa(num: 2, q: "What keyboard shortcut opens the Selection Pane?", ans: "Alt + F10.")
    #short-qa(num: 3, q: "What are the 3 Morph Effect Options?", ans: "Objects, Words, and Characters.")
    #short-qa(num: 4, q: "Which feature creates a non-linear interactive dashboard slide with live thumbnail links?", ans: "Summary Zoom feature.")
  ],
  [
    #mcq(num: 1, q: "Which transition effect is considered the professional gold standard for subtle, clean corporate slide changes?", a: "Curtains", b: "Fade", c: "Airplane", d: "Checkerboard", ans: "B", expl: "Fade (0.5s) provides an elegant, distraction-free visual transition.")
    #mcq(num: 2, q: "In the Selection Pane, what does !!ObjectA tell PowerPoint to do during a Morph transition?", a: "Delete the object", b: "Force geometric morphing even if the shapes on Slide 1 and Slide 2 are different", c: "Play a loud sound effect", d: "Export the slide as an MP4", ans: "B", expl: "The !! prefix links disparate shapes across slides for vertex interpolation.")
    #mcq(num: 3, q: "How does Summary Zoom behave when you finish presenting a specific section?", a: "It exits PowerPoint", b: "It automatically zooms back out to the high-level summary overview", c: "It loops back to Slide 1", d: "It blacks out the screen", ans: "B", expl: "Summary Zoom features 'Return to Zoom', returning automatically to the executive dashboard.")
  ]
)

#v(2pt)

#spotlight-box("2027 REAL-TIME GPU ACCELERATED CAMERA MOTION", [
  PowerPoint 365 leverages DirectX 12 hardware acceleration to render camera perspective shifts and 60 FPS Morph transitions with zero stutter, even during multi-stream Microsoft Teams videoconferences.
])
"""

    ch26_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[भाग 3: माइक्रोसॉफ्ट पावरपॉइंट 365 मास्टरक्लास · अध्याय 26]
= स्लाइड ट्रांजिशन्स, सिनेमैटिक मोशन एवं 2027 मॉर्फ (Morph) क्रांति

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  पुराने जमाने के ट्रांजिशन्स (जैसे पर्दे खुलना *Curtains*, चेकरबोर्ड या हवाई जहाज उड़ना) गंभीर बैठकों में बच्चों जैसे लगते हैं। माइक्रोसॉफ्ट 365 का *मॉर्फ ट्रांजिशन (Morph)* जटिल एनिमेशन टाइमलाइन के बिना स्लाइड्स के बीच आकृतियों को स्वतः ट्रैक करके 60fps की शानदार सिनेमैटिक गतिशीलता प्रदान करता है।
]

#v(2pt)

== 26.1 मॉर्फ ट्रांजिशन की कार्यप्रणाली: स्वतः निर्देशांक इंटरपोलेशन

मॉर्फ मोशन की गणना कैसे करता है:
1. जब आप स्लाइड 1 को डुप्लिकेट करके स्लाइड 2 पर किसी वस्तु का आकार, स्थान, रंग या घुमाव बदलते हैं।
2. स्लाइड 2 पर `Morph` ट्रांजिशन लागू करने पर पावरपॉइंट दोनों स्थितियों के बीच की दूरी को स्वतः माप लेता है।
3. स्लाइड बदलते समय, पावरपॉइंट वस्तु को स्थिति A से स्थिति B तक अत्यंत सहजता से गतिमान करता है।
4. *इफेक्ट ऑप्शंस (Effect Options)*: *Objects* (आकृतियों/छवियों को हिलाता है), *Words* (समान शब्दों को नए स्थान पर ले जाता है), अथवा *Characters* (अक्षरों को नए शब्दों में बदलता है)।

#v(2pt)
#ribbon-specimen(path: "ट्रांजिशन्स > ट्रांजिशन टू दिस स्लाइड > मॉर्फ", command: "सिनेमैटिक निर्देशांक इंटरपोलेशन", shortcut: "Alt + T > M")
#v(2pt)

== 26.2 गुप्त डबल-विस्मयादिबोधक `!!` फोर्स्ड मॉर्फ तकनीक

सामान्यतः, मॉर्फ केवल समान वस्तुओं को गति देता है। यदि आप चाहते हैं कि स्लाइड 1 का चौकोर डब्बा स्लाइड 2 पर एक गोल वृत्त में बदल जाए, तो सामान्य मॉर्फ चौकोर को गायब करके गोल को ले आएगा:
- *समाधान: सिलेक्शन पेन (`Alt + F10`)*:
  1. स्लाइड 1 पर सिलेक्शन पेन खोलें (`Alt + F10`)।
  2. चौकोर डब्बे का नाम बदलकर `!!HeroShape` रख दें।
  3. स्लाइड 2 पर जाएं और उस गोल वृत्त का नाम भी बिल्कुल वही रखें: `!!HeroShape`।
- *चमत्कार*: नाम के आगे लगा दो बार विस्मयादिबोधक चिह्न (`!!`) पावरपॉइंट को दोनों भिन्न आकृतियों के कोनों (Vertices) को आपस में मिलाकर रूपांतरित करने का आदेश देता है!

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*मॉर्फ अनुप्रयोग*], [*स्लाइड 1 सेटअप*], [*स्लाइड 2 सेटअप एवं परिणाम*]),
  [सीमलेस डेटा ज़ूम], [5 डेटा सेंटर्स दर्शाने वाला विश्व मानचित्र।], [सिंगापुर डेटा सेंटर पर ज़ूम-इन होकर विस्तृत टेलीमेट्री कार्ड्स दिखाना।],
  [डिवाइस 3D घुमाव], [सामने से दिखता हुआ सीधा स्मार्टफोन।], [स्मार्टफोन 45 डिग्री घूमकर क्लाउड सर्वर बैकएंड प्रदर्शित करता है।],
  [संख्यात्मक काउंटर], [मेट्रिक: `₹10 लाख` राजस्व।], [मेट्रिक: `₹50 लाख` राजस्व (कैरेक्टर मॉर्फ द्वारा अक्षरों का स्वतः बदलाव)।],
  [प्रगति पट्टी (Progress Bar)], [2.0 इंच चौड़ाई वाली नीली पट्टी (20% काम)।], [वही पट्टी स्वतः बढ़कर 8.0 इंच (80% लक्ष्य प्राप्ति) हो जाती है।]
)

#pagebreak()

== 26.3 पेशेवर ट्रांजिशन अनुशासन: Fade बनाम Push बनाम Wipe

मॉर्फ का उपयोग मुख्य दृश्य कहानियों हेतु होता है, जबकि सामान्य स्लाइड्स बदलने हेतु शांत ट्रांजिशन्स का प्रयोग होना चाहिए:
- *फेड (Fade - 0.50s से 0.70s)*: कॉर्पोरेट प्रस्तुतियों का स्वर्ण मानक। यह स्क्रीन पर बिना भटकाव के शालीनता से नई स्लाइड लाता है।
- *पुश / वाइप (Push / Wipe)*: कालानुक्रमिक टाइमलाइन हेतु उपयुक्त। प्रवाह सदैव पढ़ने की दिशा में रखें: आगे बढ़ने हेतु *From Right*; पुरानी समीक्षा हेतु *From Left*।
- *प्रतिबंधित बचकाने ट्रांजिशन्स*: कॉर्पोरेट मीटिंग में कभी भी *Origami*, *Airplane*, *Curtains* (पर्दे) या *Page Curl* का प्रयोग न करें। इनसे पेशेवर विश्वसनीयता समाप्त होती है।

#v(2pt)

== 26.4 इंटरएक्टिव प्रेजेंटेशन नेविगेशन: ज़ूम (Zoom) लिंक्स

पावरपॉइंट 365 गैर-रैखिक (Non-linear) प्रस्तुतियां देने हेतु *ज़ूम* टूल प्रदान करता है (`Insert` > `Zoom`):

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("समरी ज़ूम (SUMMARY ZOOM)", [
      एक मुख्य डैशबोर्ड स्लाइड बनाता है जिस पर सभी महत्वपूर्ण सेक्शन्स के लाइव थंबनेल कार्ड्स होते हैं।
      - *इंटरएक्टिव क्लिक*: बोर्ड मीटिंग में किसी भी कार्ड पर क्लिक करते ही स्क्रीन सीधे उस विस्तृत भाग में ज़ूम-इन हो जाती है।
      - *वापसी*: सेक्शन समाप्त होते ही स्क्रीन स्वतः मुख्य समरी डैशबोर्ड पर वापस ज़ूम-आउट हो जाती है।
    ])
  ],
  [
    #callout-box("स्लाइड एवं सेक्शन ज़ूम (SECTION ZOOM)", [
      किसी भी विशिष्ट स्लाइड या मॉड्यूल का क्लिकेबल पोर्टल बनाता है।
      - *उपयोग*: यदि कोई अधिकारी अचानक किसी वित्तीय बिंदु पर सवाल पूछ ले, तो बिना 50 स्लाइड्स पलटे सीधे उस स्लाइड पर पहुंचा जा सकता है।
      - *दिखावट*: इसे सुंदर आइकन या कार्ड के रूप में स्टाइल किया जा सकता है।
    ])
  ]
)

#pagebreak()

== 26.5 व्यावहारिक ब्लूप्रिंट: उत्पाद अनावरण सिनेमैटिक क्रम

मल्टी-स्लाइड मॉर्फ द्वारा किसी उत्पाद या तकनीक का प्रस्तुतीकरण:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*क्रम का चरण*], [*विजुअल लेआउट सेटअप*], [*मॉर्फ ट्रांजिशन पैरामीटर्स*]),
  [स्लाइड 01: मुख्य अनावरण], [केंद्र में बड़ा 3D क्लाउड सर्वर (100% आकार), शीर्षक: "नेक्स्ट-जेन क्लाउड आर्किटेक्चर"।], [एजेंडा से 0.50 सेकंड का शालीन फेड (Fade) ट्रांजिशन।],
  [स्लाइड 02: गहन विवरण], [सर्वर छोटा होकर 40% आकार में ऊपर बाएं कोने में जाता है; दाएं से 3 सुरक्षा कार्ड्स स्लाइड होते हैं।], [मॉर्फ ट्रांजिशन चालू। अवधि: `1.25s`। इफेक्ट: `Objects`।],
  [स्लाइड 03: प्रदर्शन डेटा], [सुरक्षा कार्ड्स बाएं निकल जाते हैं; सर्वर का रूप बदलकर `!!ProductCore` डेटाबेस सिलेंडर बन जाता है।], [मॉर्फ ट्रांजिशन चालू। अवधि: `1.00s`। `!!` नेमिंग द्वारा स्वतः रूपांतरण।]
)

#v(3pt)

== 26.6 मूल्यांकन डैशबोर्ड: तकनीकी बहुविकल्पीय प्रश्न (MCQs)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "दो अलग आकृतियों के बीच मॉर्फ लागू करने हेतु नाम के आगे क्या लगाया जाता है?", ans: "दो बार विस्मयादिबोधक चिह्न (जैसे !!HeroShape)।")
    #short-qa(num: 2, q: "सिलेक्शन पेन (Selection Pane) खोलने का शॉर्टकट क्या है?", ans: "Alt + F10 शॉर्टकट।")
    #short-qa(num: 3, q: "मॉर्फ के 3 इफेक्ट ऑप्शंस कौन से हैं?", ans: "Objects, Words, एवं Characters।")
    #short-qa(num: 4, q: "इंटरएक्टिव डैशबोर्ड बनाने वाला पावरपॉइंट फीचर कौन सा है?", ans: "समरी ज़ूम (Summary Zoom)।")
  ],
  [
    #mcq(num: 1, q: "कॉर्पोरेट प्रस्तुतियों में शांत व पेशेवर स्लाइड बदलाव हेतु कौन सा ट्रांजिशन अनुशंसित है?", a: "Curtains", b: "Fade", c: "Airplane", d: "Fracture", ans: "B", expl: "Fade (0.5s) बिना भटकाव के शालीन प्रस्तुति सुनिश्चित करता है।")
    #mcq(num: 2, q: "सिलेक्शन पेन में !!Object नाम देने से मॉर्फ पर क्या प्रभाव पड़ता है?", a: "ऑब्जेक्ट डिलीट हो जाता है", b: "भिन्न आकृतियों के बीच भी स्वतः रूपांतरण (Vertex Morph) लागू हो जाता है", c: "तेज आवाज आती है", d: "वीडियो बन जाता है", ans: "B", expl: "!! उपसर्ग दो अलग आकृतियों को आपस में जोड़कर मॉर्फ करने का संकेत देता है।")
    #mcq(num: 3, q: "समरी ज़ूम में किसी सेक्शन की स्लाइड्स समाप्त होने पर क्या होता है?", a: "पावरपॉइंट बंद हो जाता है", b: "स्क्रीन स्वतः वापस मुख्य समरी डैशबोर्ड पर ज़ूम-आउट हो जाती है", c: "स्लाइड 1 पर लौट जाता है", d: "स्क्रीन काली हो जाती है", ans: "B", expl: "समरी ज़ूम में 'Return to Zoom' फीचर स्वतः मुख्य ओवरव्यू पर ले आता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 रियल-टाइम GPU त्वरित कैमरा मोशन", [
  पावरपॉइंट 365 में DirectX 12 हार्डवेयर एक्सेलेरेशन शामिल है, जिससे माइक्रोसॉफ्ट टीम्स पर लाइव शेयरिंग के दौरान भी 60 FPS मॉर्फ ट्रांजिशन बिना किसी लैग के सहजता से चलते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-26.typ"), "w", encoding="utf-8") as f:
        f.write(ch26_en)
    with open(os.path.join(hi_dir, "chapter-26.typ"), "w", encoding="utf-8") as f:
        f.write(ch26_hi)

    # =========================================================================
    # CHAPTER 27: Dynamic Animations, Timings & Media (3 Pages)
    # =========================================================================
    ch27_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 27]
= Dynamic Object Animation Choreography, Triggers & Enterprise Media

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Slide animation should never be decorative theater; its sole purpose is to control the rate of audience information consumption (gating cognitive focus). Professional animation engineering synchronizes entrance cues, emphasis highlights, audio narration, and interactive click triggers.
]

#v(2pt)

== 27.1 The 4 Animation Archetypes & The Animation Pane

Opening the Animation Pane (`Animations` > `Animation Pane`):
- *Entrance (Green)*: Controls how an element enters the canvas (e.g. *Fade*, *Fly In*, *Zoom*).
- *Emphasis (Yellow)*: Draws attention to an already visible element (e.g. *Pulse*, *Grow/Shrink*, *Color Wave*).
- *Exit (Red)*: Removes an element from the canvas when its narrative phase concludes (e.g. *Fade Out*).
- *Motion Paths (Dotted Lines)*: Translates an object across custom linear, curved, or looped trajectories.

#v(2pt)
#ribbon-specimen(path: "Animations > Advanced Animation > Animation Pane", command: "Timing Choreography & Triggers", shortcut: "Alt + A > C")
#v(2pt)

== 27.2 The 3 Critical Timing Triggers: On Click vs. With Previous vs. After Previous

Mastery of corporate timing separates clumsy presentations from broadcast-quality demonstrations:
- *On Click*: Pauses execution until the presenter physically advances (click, spacebar, or presentation remote). Use this strictly for major discussion milestones where audience dialogue is expected.
- *With Previous*: Executes *simultaneously* with the animation preceding it. Essential for multi-element choreography (e.g. fading in an icon while sliding up its title card).
- *After Previous*: Executes *automatically* the moment the preceding animation completes. Ideal for cascading metric reveals without requiring repetitive clicks.
- *Delay & Duration Tuning*: Set entrance durations between `0.30s` and `0.50s`. Anything slower than `0.75s` feels sluggish and drains executive momentum.

#table(
  columns: (1.2fr, 2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Animation Tool*], [*Technical Function*], [*Production Slide Application*]),
  [Animation Painter], [Copies entire animation stack, timings, and delays to another shape.], [Replicating entrance timing across 6 KPI metric cards in 10 seconds.],
  [Interactive Trigger], [Binds an animation to fire only when a specific onscreen object is clicked.], [Building interactive software simulation popups and FAQ accordions.],
  [Smooth Start / End], [Adds cubic ease-in / ease-out deceleration to motion paths.], [Making flying cards stop with natural physical inertia instead of abrupt stops.],
  [Auto-Reverse], [Causes an emphasis pulse to return automatically to original state.], [Highlighting a critical risk node before returning to normal palette.]
)

#pagebreak()

== 27.3 Media Engineering: Video & Audio Integration

Video and audio must play reliably without codec errors during high-stakes board presentations:
- *Container Standards*: Use MP4 containers with H.264 video compression and AAC audio.
- *Video Tools*: Under `Video Format` and `Playback`:
  - *Trim Video*: Set precise In/Out markers inside PowerPoint without external video editing software.
  - *Fade In / Fade Out*: Apply a 0.5s audio/video fade to prevent abrupt audio blasts.
  - *Poster Frame*: Choose a crisp, branded frame to display before playback starts (prevents black screens).
- *Compress Media*: Run `File` > `Info` > `Compress Media` (`1080p` Full HD). This shrinks 500MB raw smartphone videos down to 25MB while preserving crystal-clear playback.

#v(2pt)

== 27.4 Interactive Software Demonstrations via Bookmark Triggers

PowerPoint allows syncing animation events directly to specific timestamp bookmarks in an embedded video:

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("1. ADD VIDEO BOOKMARK", [
      Play the embedded software recording. At the exact second a key feature appears (e.g. `00:14`), click `Add Bookmark` under the Playback tab.
      - Places an amber marker pin directly on the video scrubber bar.
    ])
  ],
  [
    #callout-box("2. BIND CALLOUT TRIGGER", [
      Select an explanatory callout card on the slide. Set its Entrance animation to `Trigger` > `On Bookmark` > `Bookmark 1`.
      - As the video plays, the callout card pops up automatically the moment the scrubber hits `00:14`!
    ])
  ]
)

#pagebreak()

== 27.5 Production Blueprint: Sequential Staggered Card Entrance

Below is the standard Fortune 500 timing choreography for revealing 3 product feature pillars:

#table(
  columns: (1.2fr, 1.5fr, 1.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*Animated Element*], [*Animation Effect*], [*Start Condition*], [*Timing Parameters*]),
  [Pillar 01 (Cloud Core)], [Fade + Fly In (Up)], [Start: On Click], [Duration: `0.40s`, Smooth End: `0.20s`],
  [Pillar 02 (Zero Trust)], [Fade + Fly In (Up)], [Start: After Previous], [Duration: `0.40s`, Delay: `0.10s`],
  [Pillar 03 (AI Copilot)], [Fade + Fly In (Up)], [Start: After Previous], [Duration: `0.40s`, Delay: `0.10s`],
  [Feature Highlight Badge], [Grow / Shrink (105%)], [Start: After Previous], [Duration: `0.30s`, Auto-Reverse: `True`]
)

#v(3pt)

== 27.6 Evaluation Dashboard: Technical MCQs & Review Q&A

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which tool quickly copies animations from one object to multiple other objects?", ans: "Animation Painter.")
    #short-qa(num: 2, q: "What timing trigger allows two animations to play at the exact same instant?", ans: "Start: With Previous.")
    #short-qa(num: 3, q: "What is the recommended duration range for professional entrance animations?", ans: "0.30s to 0.50s.")
    #short-qa(num: 4, q: "How do you prevent a video from showing a blank black rectangle before playing?", ans: "Set a custom Poster Frame.")
  ],
  [
    #mcq(num: 1, q: "Which animation timing setting automatically triggers an effect immediately when the previous effect finishes?", a: "On Click", b: "With Previous", c: "After Previous", d: "On Double Click", ans: "C", expl: "After Previous chains animations sequentially without user intervention.")
    #mcq(num: 2, q: "What video format and codec is globally recommended for seamless PowerPoint 365 playback?", a: ".avi with DivX", b: ".mp4 with H.264 and AAC audio", c: ".wmv legacy", d: ".flv Flash", ans: "B", expl: "H.264 MP4 is the universal hardware-accelerated video standard.")
    #mcq(num: 3, q: "What happens when you compress media via File > Info > Compress Media in PowerPoint?", a: "The audio is muted", b: "PowerPoint transcodes embedded videos to standard 1080p/720p, drastically shrinking presentation file size", c: "The presentation converts to a zip file", d: "Animations are removed", ans: "B", expl: "Media Compression reduces file bloat while maintaining crisp playback resolution.")
  ]
)

#v(2pt)

#spotlight-box("2027 REAL-TIME EMBEDDED WEB RUNTIMES", [
  PowerPoint 365 Enterprise enables embedding live, interactive WebGL dashboards and power apps directly onto slides. Presenters can filter live operational databases without switching browser tabs.
])
"""

    ch27_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[भाग 3: माइक्रोसॉफ्ट पावरपॉइंट 365 मास्टरक्लास · अध्याय 27]
= डायनामिक ऑब्जेक्ट एनिमेशन, टाइमिंग ट्रिगर्स एवं एंटरप्राइज मीडिया

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  स्लाइड एनिमेशन कभी भी मनोरंजन का नाटक नहीं होना चाहिए; इसका एकमात्र उद्देश्य दर्शकों के ध्यान (Cognitive Focus) को नियंत्रित करना है। पेशेवर एनिमेशन इंजीनियरिंग प्रवेश प्रभावों, हाइलाइट्स, बैकग्राउंड ऑडियो तथा इंटरएक्टिव क्लिक ट्रिगर्स को एक लय में जोड़ती है।
]

#v(2pt)

== 27.1 एनिमेशन की 4 प्रमुख श्रेणियां एवं एनिमेशन पेन

एनिमेशन पेन खोलना (`Animations` > `Animation Pane`):
- *एंट्रेंस (हरा - Entrance)*: वस्तु स्क्रीन पर कैसे प्रकट होगी (जैसे *Fade*, *Fly In*, *Zoom*)।
- *एम्फैसिस (पीला - Emphasis)*: पहले से मौजूद वस्तु पर ध्यान आकर्षित करना (जैसे *Pulse*, *Grow/Shrink*)।
- *एग्जिट (लाल - Exit)*: काम पूरा होने पर वस्तु को स्क्रीन से हटाना (जैसे *Fade Out*)।
- *मोशन पाथ्स (Motion Paths)*: वस्तु को तय रेखा, वक्र या लूप में गतिमान करना।

#v(2pt)
#ribbon-specimen(path: "एनिमेशन्स > उन्नत एनिमेशन > एनिमेशन पेन", command: "टाइमिंग कोरियोग्राफी एवं ट्रिगर्स", shortcut: "Alt + A > C")
#v(2pt)

== 27.2 तीन महत्वपूर्ण टाइमिंग ट्रिगर्स: On Click vs. With Previous vs. After Previous

कॉर्पोरेट स्तर की टाइमिंग साधारण स्लाइड को टीवी प्रसारण जैसी गुणवत्ता देती है:
- *ऑन क्लिक (On Click)*: वक्ता द्वारा क्लिक करने या रिमोट का बटन दबाने तक रुकता है। इसका उपयोग केवल वहां करें जहां दर्शकों से चर्चा की आवश्यकता हो।
- *विद प्रीवियस (With Previous)*: पिछले एनिमेशन के साथ *एक ही समय पर* चलता है। कार्ड ऊपर उठने के साथ-साथ टेक्स्ट फेड-इन करने हेतु अनिवार्य।
- *आफ्टर प्रीवियस (After Previous)*: पिछला प्रभाव समाप्त होते ही *स्वतः* शुरू हो जाता है। बिना बार-बार क्लिक किए क्रमिक कार्ड्स प्रदर्शित करने हेतु उत्तम।
- *अवधि (Duration)*: पेशेवर एनिमेशन की गति `0.30s` से `0.50s` के बीच रखें। `0.75s` से धीमा प्रभाव उबाऊ लगने लगता है।

#table(
  columns: (1.2fr, 2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*एनिमेशन टूल*], [*तकनीकी कार्य*], [*व्यावहारिक कॉर्पोरेट उपयोग*]),
  [एनिमेशन पेंटर], [किसी वस्तु के सभी एनिमेशन व टाइमिंग दूसरी वस्तु पर कॉपी करता है।], [10 सेकंड में 6 अलग-अलग केपीआई कार्ड्स पर एक जैसा एनिमेशन लगाना।],
  [इंटरएक्टिव ट्रिगर], [एनिमेशन तभी चलेगा जब स्क्रीन की किसी खास वस्तु पर क्लिक किया जाए।], [सॉफ्टवेयर सिम्युलेटर, एफएक्यू ड्रॉपडाउन तथा इंटरएक्टिव पॉपअप बनाना।],
  [स्मूथ स्टार्ट / एंड], [मोशन पाथ में भौतिक मंदन (Ease-in/Ease-out) जोड़ता है।], [कार्ड्स को झटके से रुकने के बजाय प्राकृतिक ब्रेक लगाकर रोकना।],
  [ऑटो-रिवर्स], [एम्फैसिस प्रभाव को पूरा होने के बाद स्वतः सामान्य स्थिति में लाता है।], [जोखिम चेतावनी को चमकाकर पुनः शांत करना।]
)

#pagebreak()

== 27.3 मीडिया इंजीनियरिंग: वीडियो एवं ऑडियो का निर्बाध एकीकरण

महत्वपूर्ण बैठकों में वीडियो अटकने या ऑडियो न बजने जैसी समस्याओं से बचने हेतु:
- *मानक वीडियो प्रारूप*: H.264 वीडियो कंप्रेशन तथा AAC ऑडियो युक्त MP4 कंटेनर का उपयोग करें।
- *वीडियो संपादन टूल्स* (`Video Format` एवं `Playback` टैब):
  - *ट्रिम वीडियो (Trim Video)*: बिना किसी बाहरी सॉफ्टवेयर के पावरपॉइंट के अंदर ही वीडियो की शुरुआत व अंत काटें।
  - *फेड इन / फेड आउट*: वीडियो शुरू व समाप्त होते समय 0.5 सेकंड का साउंड फेड लगाएं ताकि झटके से तेज आवाज न आए।
  - *पोस्टर फ्रेम (Poster Frame)*: वीडियो शुरू होने से पहले दिखने वाला ब्रांडेड थंबनेल सेट करें (स्क्रीन काली नहीं दिखेगी)।
- *मीडिया कंप्रेस करें*: `File` > `Info` > `Compress Media` (`1080p`). यह 500MB की भारी मोबाइल वीडियो को 25MB में बदल देता है।

#v(2pt)

== 27.4 बुकमार्क ट्रिगर्स द्वारा इंटरएक्टिव सॉफ्टवेयर प्रदर्शन

पावरपॉइंट वीडियो के किसी खास सेकंड पर स्लाइड के अन्य तत्वों को सक्रिय कर सकता है:

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("1. वीडियो में बुकमार्क जोड़ें", [
      वीडियो चलाएं। जिस सेकंड पर महत्वपूर्ण फीचर दिखे (जैसे `00:14`), वहां Playback टैब में `Add Bookmark` पर क्लिक करें।
      - टाइमर बार पर एक पीली पिन लग जाएगी।
    ])
  ],
  [
    #callout-box("2. कॉलआउट ट्रिगर सेट करें", [
      स्लाइड पर व्याख्यात्मक कार्ड चुनें। उसके एंट्रेंस एनिमेशन को `Trigger` > `On Bookmark` > `Bookmark 1` पर सेट करें।
      - वीडियो चलते ही जैसे ही सुई 00:14 पर पहुंचेगी, कार्ड स्वतः पॉपअप हो जाएगा!
    ])
  ]
)

#pagebreak()

== 27.5 व्यावहारिक ब्लूप्रिंट: उत्पाद स्तंभों का क्रमिक एनिमेशन क्रम

फॉर्च्यून 500 बोर्डरूम में 3 उत्पाद स्तंभों को प्रस्तुत करने की मानक कोरियोग्राफी:

#table(
  columns: (1.2fr, 1.5fr, 1.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*एनिमेटेड घटक*], [*एनिमेशन प्रभाव*], [*आरंभ शर्त (Start)*], [*समय निर्धारण (Timing)*]),
  [स्तंभ 01 (क्लाउड कोर)], [Fade + Fly In (Up)], [Start: On Click], [अवधि: `0.40s`, स्मूथ एंड: `0.20s`],
  [स्तंभ 02 (जीरो ट्रस्ट)], [Fade + Fly In (Up)], [Start: After Previous], [अवधि: `0.40s`, डिले: `0.10s`],
  [स्तंभ 03 (AI कोपायलट)], [Fade + Fly In (Up)], [Start: After Previous], [अवधि: `0.40s`, डिले: `0.10s`],
  [फीचर हाइलाइट बैज], [Grow / Shrink (105%)], [Start: After Previous], [अवधि: `0.30s`, ऑटो-रिवर्स: `True`]
)

#v(3pt)

== 27.6 मूल्यांकन डैशबोर्ड: तकनीकी बहुविकल्पीय प्रश्न (MCQs)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "एक वस्तु के सभी एनिमेशन दूसरी वस्तु पर तुरंत कॉपी करने वाला टूल कौन सा है?", ans: "एनिमेशन पेंटर (Animation Painter)।")
    #short-qa(num: 2, q: "दो एनिमेशन एक साथ चलाने हेतु कौन सा स्टार्ट ऑप्शन चुना जाता है?", ans: "Start: With Previous।")
    #short-qa(num: 3, q: "पेशेवर एंट्रेंस एनिमेशन की मानक अनुशंसित अवधि क्या है?", ans: "0.30 से 0.50 सेकंड।")
    #short-qa(num: 4, q: "वीडियो चलने से पहले काली स्क्रीन दिखने से रोकने हेतु क्या सेट किया जाता है?", ans: "पोस्टर फ्रेम (Poster Frame)।")
  ],
  [
    #mcq(num: 1, q: "पिछला प्रभाव समाप्त होते ही बिना क्लिक किए स्वतः चलने वाला टाइमिंग विकल्प कौन सा है?", a: "On Click", b: "With Previous", c: "After Previous", d: "On Hover", ans: "C", expl: "After Previous पिछले प्रभाव के समाप्त होते ही तुरंत नया प्रभाव चालू कर देता है।")
    #mcq(num: 2, q: "पावरपॉइंट 365 में सुरक्षित व सहज वीडियो प्लेबैक हेतु कौन सा प्रारूप अनुशंसित है?", a: ".avi DivX", b: ".mp4 (H.264 + AAC)", c: ".wmv", d: ".flv Flash", ans: "B", expl: "H.264 MP4 आधुनिक हार्डवेयर-त्वरित प्लेबैक का वैश्विक मानक है।")
    #mcq(num: 3, q: "File > Info > Compress Media विकल्प चुनने से क्या लाभ होता है?", a: "ऑडियो बंद हो जाता है", b: "वीडियो फाइल का आकार घट जाता है जिससे प्रेजेंटेशन का आकार छोटा व हल्का हो जाता है", c: "फाइल जिप बन जाती है", d: "एनिमेशन हट जाते हैं", ans: "B", expl: "मीडिया कंप्रेशन वीडियो रिज़ॉल्यूशन को संतुलित करके फाइल का भारीपन समाप्त कर देता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 रियल-टाइम एम्बेडेड वेब रनटाइम्स", [
  पावरपॉइंट 365 एंटरप्राइज अब सीधे स्लाइड पर लाइव वेब एप्लिकेशन तथा WebGL 3D डैशबोर्ड चलाने की सुविधा देता है। वक्ता मीटिंग के दौरान बिना ब्राउज़र खोले सीधे स्लाइड के भीतर ही लाइव डेटाबेस को फिल्टर कर सकते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-27.typ"), "w", encoding="utf-8") as f:
        f.write(ch27_en)
    with open(os.path.join(hi_dir, "chapter-27.typ"), "w", encoding="utf-8") as f:
        f.write(ch27_hi)

    # =========================================================================
    # CHAPTER 28: Presentation Delivery & 3 PPT Production Labs (3 Pages)
    # =========================================================================
    ch28_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 28]
= Executive Delivery Dynamics, Presenter View & 3 End-to-End Production Labs

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  A brilliant deck fails if the delivery falters. Master Presenter View navigation, laser pointers, rehearsal coach AI, and execute 3 complete commercial production labs: an Investor Pitch Deck, a Corporate Product Launch, and an Interactive Corporate Training Module.
]

#v(2pt)

== 28.1 Presenter View Navigation & Keyboard Controls (`Alt + F5`)

When plugged into dual monitors or video conferencing:
- *Presenter View*: Your private command center showing the current slide, upcoming preview, elapsed timer, and speaking notes.
- *Secret Keyboard Shortcuts During Live Slideshow*:
  - `B` key: Instantly *Blacks out* the display (draws all audience eyes directly back to the presenter).
  - `W` key: Instantly *Whites out* the display.
  - `Ctrl + L`: Activates the digital *Laser Pointer*.
  - `Ctrl + P`: Activates the live annotation *Pen* to circle critical chart figures.
  - `Ctrl + E`: Activates the *Eraser*.
  - `Number + Enter`: Jumps directly to slide number without flipping through intermediaries (e.g. `2` + `4` + `Enter` jumps to Slide 24).
- *Speaker Coach AI*: Microsoft 365's real-time rehearsal coach that analyzes pace (words per minute), pitch variation, filler words ("um", "ah"), and insensitive phrasing.

#pagebreak()

== 28.2 Production Lab 01: Series-A Venture Capital Pitch Deck (12 Slides)

Engineered for startup founders seeking ₹10 Crore to ₹50 Crore investment rounds:

#table(
  columns: (1fr, 1.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Slide No.*], [*Slide Objective*], [*Visual Architecture & Master Layout Configuration*]),
  [Slide 01], [Vision Title], [Dark Navy `#0F172A` background, 44pt title, tagline, logo emblem.],
  [Slide 02], [The Problem], [3 customer pain point cards with red alert accent icons.],
  [Slide 03], [The Solution], [Product screenshot mockup, 3 value pillars with green check badges.],
  [Slide 04], [Market Size], [TAM (₹80K Cr) > SAM (₹12K Cr) > SOM (₹1.5K Cr) concentric circles via Merge Shapes.],
  [Slide 05], [Traction & Growth], [High-impact ARR line chart showing 280% YoY expansion.],
  [Slide 06], [Business Model], [Subscription tier pricing table, customer lifetime value (LTV:CAC = 4.2x).],
  [Slide 07], [Competition Matrix], [2x2 quadrant positioning our product in top-right leader category.],
  [Slide 08], [Go-to-Market], [Horizontal 4-step B2B sales pipeline with milestone dates.],
  [Slide 09], [Core Leadership], [4 circular headshot picture placeholders with LinkedIn badges.],
  [Slide 10], [Financial Model], [3-year forward EBITDA & cash flow projections table.],
  [Slide 11], [The Ask / Funding], [Clear metric card: "Seeking ₹25 Cr for 15% equity", funds allocation donut chart.],
  [Slide 12], [Executive Close], [Founding contact information, QR code to investor data room.]
)

#v(2pt)

== 28.3 Production Lab 02: Enterprise Cloud Product Launch Deck

Designed for Chief Technology Officers presenting major software overhauls:
- *Color Palette*: Deep Slate (`#0B132B`), Electric Cyan (`#00F0FF`), and Crisp White.
- *Visual Climax*: Slide 3 features a 3D cloud database that rotates and zooms using the *Morph Transition* (`!!ProductCore`) as feature bullets fly in staggered at 0.4s intervals.

#pagebreak()

== 28.4 Production Lab 03: Interactive Corporate Training Deck

Using Hyperlinks and Zoom bookmarks for self-paced employee training:
- *Interactive Menu*: Top navigation bar with clickable tabs: *Module 1: Policy*, *Module 2: Compliance*, *Module 3: Security Exam*.
- *Branching Logic*: Answering an assessment question incorrectly jumps to a remediation slide before allowing progress.

#v(2pt)

== 28.5 Evaluation Dashboard: Comprehensive PowerPoint 365 Mastery MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What key during a live slideshow blacks out the screen?", ans: "The 'B' key.")
    #short-qa(num: 2, q: "What keyboard shortcut activates the digital laser pointer?", ans: "Ctrl + L.")
    #short-qa(num: 3, q: "How do you jump directly to Slide 15 during a live presentation?", ans: "Type 15 and press Enter.")
    #short-qa(num: 4, q: "What is the recommended LTV:CAC ratio in venture capital pitch decks?", ans: "3.0x or higher (4.2x in Lab 1).")
  ],
  [
    #mcq(num: 1, q: "Which tool analyzes speech rate, filler words, and vocal pitch during rehearsal?", a: "Spell Checker", b: "Speaker Coach AI", c: "Translator", d: "Accessibility Checker", ans: "B", expl: "Speaker Coach AI listens to speech audio and returns real-time delivery metrics.")
    #mcq(num: 2, q: "What keyboard shortcut activates the annotation pen tool during a live presentation?", a: "Ctrl + P", b: "Ctrl + L", c: "Ctrl + A", d: "Ctrl + Z", ans: "A", expl: "Ctrl + P turns the cursor into an interactive ink drawing pen.")
    #mcq(num: 3, q: "In an investor pitch deck, what does the SOM metric represent?", a: "Social Media Metrics", b: "Serviceable Obtainable Market (the realistic near-term target market share)", c: "Standard Operating Margin", d: "Source of Money", ans: "B", expl: "SOM is the portion of SAM that can realistically be captured.")
  ]
)

#v(2pt)

#spotlight-box("2027 IMMERSIVE MIXED REALITY & SPATIAL PRESENTATIONS", [
  PowerPoint 365 Enterprise exports presentation scenes directly to Microsoft Mesh and Apple Vision Pro spatial environments, enabling global remote teams to walk around holographic 3D product prototypes during live pitches.
])
"""

    ch28_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[भाग 3: माइक्रोसॉफ्ट पावरपॉइंट 365 मास्टरक्लास · अध्याय 28]
= कार्यकारी प्रस्तुति कौशल, प्रेजेंटर व्यू एवं 3 पूर्ण व्यावसायिक लैब्स

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  एक शानदार प्रेजेंटेशन भी व्यर्थ हो जाती है यदि उसकी डिलीवरी कमजोर हो। प्रेजेंटर व्यू, डिजिटल लेजर पॉइंटर, AI रिहर्सल कोच में महारत हासिल करें तथा 3 वास्तविक कॉर्पोरेट प्रोजेक्ट्स पूरे करें: वेंचर कैपिटल इन्वेस्टर पिच डेक, उत्पाद लॉन्च प्रस्तुति एवं इंटरएक्टिव कॉर्पोरेट प्रशिक्षण मॉड्यूल।
]

#v(2pt)

== 28.1 प्रेजेंटर व्यू नेविगेशन एवं लाइव शॉर्टकट्स (`Alt + F5`)

लैपटॉप को प्रोजेक्टर या ऑनलाइन कॉन्फ्रेंस से जोड़ते समय:
- *प्रेजेंटर व्यू (Presenter View)*: आपका निजी कंट्रोल पैनल जो वर्तमान स्लाइड, अगली आने वाली स्लाइड, टाइमर तथा आपके निजी स्पीकिंग नोट्स दिखाता है।
- *लाइव शो के गुप्त कीबोर्ड शॉर्टकट्स*:
  - `B` कुंजी: स्क्रीन को तुरंत *काला (Black)* कर देती है (दर्शकों का पूरा ध्यान वक्ता पर केंद्रित करने हेतु)।
  - `W` कुंजी: स्क्रीन को तुरंत *सफेद (White)* कर देती है।
  - `Ctrl + L`: डिजिटल *लेजर पॉइंटर* चालू करता है।
  - `Ctrl + P`: लाइव एनोटेशन *पेन* चालू करता है जिससे आप आंकड़ों पर गोला बना सकते हैं।
  - `Ctrl + E`: स्क्रीन इरेज़र चालू करता है।
  - `नंबर + Enter`: बिना बीच की स्लाइड्स पलटे सीधे उस नंबर की स्लाइड पर पहुंचाता है (जैसे `2` + `4` + `Enter` सीधे स्लाइड 24 खोल देगा)।
- *स्पीकर कोच AI (Speaker Coach)*: ऑफिस 365 का AI कोच जो बोलने की गति (शब्द प्रति मिनट), पिच, तथा अनावश्यक भराव शब्द ("उम्म", "आह") पकड़कर रिपोर्ट देता है।

#pagebreak()

== 28.2 प्रोडक्शन लैब 01: सीरीज-ए वेंचर कैपिटल इन्वेस्टर पिच (12 स्लाइड्स)

₹10 करोड़ से ₹50 करोड़ की स्टार्टअप फंडिंग हासिल करने हेतु विशेष रूप से डिजाइन की गई पिच:

#table(
  columns: (1fr, 1.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*स्लाइड क्र.*], [*स्लाइड का उद्देश्य*], [*विजुअल लेआउट एवं मास्टर आर्किटेक्चर*]),
  [स्लाइड 01], [विज़न एवं शीर्षक], [गहरा नेवी `#0F172A` बैकग्राउंड, 44pt शीर्षक, टैगलाइन, ब्रांड लोगो।],
  [स्लाइड 02], [मुख्य समस्या], [ग्राहक की 3 मुख्य समस्याएं दर्शाते हुए लाल चेतावनी आइकन कार्ड्स।],
  [स्लाइड 03], [हमारा समाधान], [सॉफ्टवेयर का मॉकअप, हरे टिक बैज के साथ 3 मुख्य मूल्य प्रस्ताव।],
  [स्लाइड 04], [बाजार का आकार], [मर्ज शेप्स द्वारा निर्मित TAM (₹80K Cr) > SAM (₹12K Cr) > SOM (₹1.5K Cr) वृत्त।],
  [स्लाइड 05], [ट्रैक्शन एवं विकास], [280% वार्षिक वृद्धि दर्शाता हुआ उच्च-प्रभाव वाला राजस्व लाइन चार्ट।],
  [स्लाइड 06], [बिजनेस मॉडल], [सब्सक्रिप्शन टीयर तालिका, ग्राहक लाइफटाइम वैल्यू (LTV:CAC = 4.2x)।],
  [स्लाइड 07], [प्रतिस्पर्धी मैट्रिक्स], [2x2 चतुर्थांश जिसमें हमारी कंपनी शीर्ष-दाएं लीडर स्थान पर हो।],
  [स्लाइड 08], [मार्केटिंग रणनीति], [माइलस्टोन तिथियों सहित 4-चरणीय B2B बिक्री पाइपलाइन रोडमैप।],
  [स्लाइड 09], [संस्थापक नेतृत्व], [लिंक्डइन बैज के साथ 4 गोल पिक्चर प्लेसहोल्डर्स।],
  [स्लाइड 10], [वित्तीय मॉडल], [आगामी 3 वर्षों का अनुमानित EBITDA तथा कैश फ्लो प्रोजेक्शन।],
  [स्लाइड 11], [फंडिंग मांग (The Ask)], [स्पष्ट कार्ड: "15% इक्विटी हेतु ₹25 करोड़", फंड आवंटन डोनट चार्ट।],
  [स्लाइड 12], [समापन व संपर्क], [संस्थापकों का संपर्क विवरण, इन्वेस्टर डेटा रूम का QR कोड।]
)

#v(2pt)

== 28.3 प्रोडक्शन लैब 02: एंटरप्राइज क्लाउड प्रोडक्ट लॉन्च डेक

मुख्य प्रौद्योगिकी अधिकारियों (CTO) द्वारा नए सॉफ्टवेयर अनावरण हेतु:
- *कलर पैलेट*: गहरा स्लेट (`#0B132B`), इलेक्ट्रिक सियान (`#00F0FF`), तथा चमकदार सफेद।
- *मुख्य विजुअल आकर्षण*: स्लाइड 3 पर 3D क्लाउड डेटाबेस जो *मॉर्फ ट्रांजिशन* (`!!ProductCore`) के साथ घूमता व ज़ूम होता है, और 0.4 सेकंड के अंतराल पर फीचर बुलेट्स स्क्रीन पर आते हैं।

#pagebreak()

== 28.4 प्रोडक्शन लैब 03: इंटरएक्टिव कॉर्पोरेट प्रशिक्षण डेक

हाइपरलिंक्स तथा ज़ूम बुकमार्क द्वारा स्व-अध्ययन प्रशिक्षण डेक:
- *इंटरएक्टिव मेनू*: शीर्ष पर क्लिक करने योग्य नेविगेशन बार: *मॉड्यूल 1: नीतियां*, *मॉड्यूल 2: अनुपालन*, *मॉड्यूल 3: सुरक्षा परीक्षा*।
- *शाखा लॉजिक (Branching Logic)*: प्रश्न का गलत उत्तर देने पर स्लाइड आगे बढ़ने के बजाय सुधारात्मक व्याख्या वाली स्लाइड पर स्वतः भेजती है।

#v(2pt)

== 28.5 मूल्यांकन डैशबोर्ड: संपूर्ण पावरपॉइंट 365 मास्टरी बहुविकल्पीय प्रश्न

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "लाइव प्रेजेंटेशन के दौरान स्क्रीन को तुरंत काला करने वाली कुंजी कौन सी है?", ans: "'B' कुंजी।")
    #short-qa(num: 2, q: "डिजिटल लेजर पॉइंटर चालू करने का शॉर्टकट क्या है?", ans: "Ctrl + L शॉर्टकट।")
    #short-qa(num: 3, q: "लाइव प्रेजेंटेशन में सीधे स्लाइड 15 पर कैसे जाते हैं?", ans: "15 लिखकर Enter दबाएं।")
    #short-qa(num: 4, q: "स्टार्टअप पिच डेक में अनुशंसित LTV:CAC अनुपात क्या है?", ans: "3.0x या अधिक (लैब 1 में 4.2x)।")
  ],
  [
    #mcq(num: 1, q: "प्रस्तुति अभ्यास के दौरान बोलने की गति और भराव शब्दों का AI विश्लेषण कौन करता है?", a: "स्पेल चेकर", b: "स्पीकर कोच AI", c: "ट्रांसलेटर", d: "एक्सेसिबिलिटी चेकर", ans: "B", expl: "स्पीकर कोच AI आवाज सुनकर लाइव डिलीवरी मेट्रिक्स प्रदान करता है।")
    #mcq(num: 2, q: "लाइव प्रेजेंटेशन के दौरान स्क्रीन पर लिखने वाला पेन चालू करने का शॉर्टकट क्या है?", a: "Ctrl + P", b: "Ctrl + L", c: "Ctrl + A", d: "Ctrl + Z", ans: "A", expl: "Ctrl + P कर्सर को लाइव डिजिटल इंक पेन में बदल देता है।")
    #mcq(num: 3, q: "इन्वेस्टर पिच में SOM का क्या अर्थ होता है?", a: "सोशल मीडिया मेट्रिक्स", b: "सर्विसिबल ऑब्टेनेबल मार्केट (प्रारंभिक प्राप्य बाजार)", c: "स्टैंडर्ड ऑपरेटिंग मार्जिन", d: "सोर्स ऑफ मनी", ans: "B", expl: "SOM कुल बाजार का वह हिस्सा है जिसे कंपनी तुरंत हासिल करने का लक्ष्य रखती है।")
  ]
)

#v(2pt)

#spotlight-box("2027 स्थानिक मिश्रित वास्तविकता प्रस्तुतियां", [
  पावरपॉइंट 365 एंटरप्राइज अब प्रस्तुतियों को माइक्रोसॉफ्ट मेश तथा एप्पल विज़न प्रो स्थानिक वातावरण में सीधे निर्यात करता है, जिससे दुनिया भर के निवेशक होलोग्राफिक 3D प्रोटोटाइप का वर्चुअल निरीक्षण कर सकते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-28.typ"), "w", encoding="utf-8") as f:
        f.write(ch28_en)
    with open(os.path.join(hi_dir, "chapter-28.typ"), "w", encoding="utf-8") as f:
        f.write(ch28_hi)

    print("PowerPoint Chapters 23 to 28 (18 Pages total) written successfully in English and Hindi.")

if __name__ == "__main__":
    generate_ppt_chapters("DIGITAL/OFFICE_365/07_SOURCE_FILES")
