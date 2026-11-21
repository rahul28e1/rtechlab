#!/usr/bin/env python3
# =============================================================================
# RTechLab Office 365 Publishing Engine — Word Masterclass (Chapters 06 to 10)
# Covers: Layout, Headers/Footers, References TOC, Mail Merge & 5 Corporate Labs
# Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
# =============================================================================

import os

def generate_chapters(base_dir):
    eng_dir = os.path.join(base_dir, "English")
    hi_dir = os.path.join(base_dir, "Hindi")
    os.makedirs(eng_dir, exist_ok=True)
    os.makedirs(hi_dir, exist_ok=True)

    # =========================================================================
    # CHAPTER 06: Layout Tab: Section Breaks & Page Mechanics (3 Pages)
    # =========================================================================
    ch06_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 06]
= Layout Tab: Section Breaks, Multi-Column Flow & Page Setup Mechanics

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Document layout mechanics govern physical paper dimensions, printable margins, and multi-column magazine flows. The single most powerful, yet commonly misunderstood, engineering construct in Microsoft Word is the Section Break—the foundational mechanism enabling mixed page orientations and segregated header numbering.
]

#v(2pt)

== 6.1 Page Setup Architecture: Margins, Orientation & Paper Standards

Under `Layout > Page Setup`, Word allows micro-calibration of the physical canvas geometry:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Layout Parameter*], [*Standard Enterprise Values*], [*Operational Mechanics & Considerations*]),
  [Margins], [Normal (1"), Narrow (0.5"), Moderate, Mirrored], [Mirrored margins enforce "Inside / Outside" gutters for bound books.],
  [Gutter Margin], [0.3" to 0.6" added to Inside binding edge], [Prevents text from disappearing into spine when book is wire-bound.],
  [Orientation], [Portrait (8.27" × 11.69"), Landscape (11.69" × 8.27")], [Landscape accommodates wide 12-column financial balance sheets.],
  [Paper Size], [A4 (210 × 297 mm), Letter (8.5" × 11"), Legal], [A4 is standard in India & Europe; Letter dominates North America.],
  [Hyphenation], [None, Automatic, Manual], [Automatic inserts hyphens at syllable boundaries to eliminate white rivers.]
)

#v(2pt)
#ribbon-specimen(path: "Layout > Page Setup > Margins > Custom Margins", command: "Define Binding Gutter & Mirrored Geometry", shortcut: "Alt + P + M + A")
#v(2pt)

== 6.2 The Fundamental Dichotomy: Page Breaks vs. Section Breaks

Failing to distinguish between Page Breaks and Section Breaks is the #1 cause of broken corporate document formatting:

- *Page Break (`Ctrl + Enter`)*: Instructs Word to conclude the current page immediately and resume text at the top of the next page. *Crucially, headers, footers, margins, and orientation remain completely unified and identical.*
- *Section Break*: Creates a completely independent structural partitioning envelope within the `.docx` XML tree. Each Section maintains its own unique margins, page orientation, headers, footers, and page number sequences.

#concept-box(title: "CRITICAL ARCHITECTURAL RULE: SECTION BREAKS", [
  A Page Break only pushes text down. A Section Break creates an independent structural partition. You *cannot* change one page to Landscape or restart page numbering without inserting a Section Break first!
])

#pagebreak()

== 6.3 The 4 Section Break Variants & Their Engineering Scopes

Word 365 provides 4 distinct Section Break types under `Layout > Page Setup > Breaks`:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Section Break Type*], [*Internal Pagination Behavior*], [*Corporate Implementation Scenario*]),
  [Next Page], [Spawns a new section and simultaneously forces cursor to top of next physical page.], [Switching Chapter 2 from Portrait to Landscape for a wide financial table.],
  [Continuous], [Spawns a new section immediately on the exact same page without creating a page split.], [Switching from 1-column title to 3-column newsletter layout on the same page.],
  [Even Page], [Spawns a new section and forces next text onto the next available even-numbered page.], [Academic textbooks requiring chapters to begin strictly on left-hand pages.],
  [Odd Page], [Spawns a new section and forces next text onto the next odd-numbered (right) page.], [Publishing standard: Major chapters always start on a right-hand page (1, 3, 5).]
)

#v(2pt)
#ribbon-specimen(path: "Layout > Page Setup > Breaks > Next Page", command: "Insert Independent Structural Section Boundary", shortcut: "Alt + P + B + N")
#v(2pt)

== 6.4 Multi-Column Newspaper Flow Engineering

Under `Layout > Page Setup > Columns`, documents can be split into 2, 3, Left, or Right column matrices:
1. *Equal Width Columns*: Standard newsprint reading geometry (3.3" column width with 0.5" gutter).
2. *Line Between*: Inserts a continuous vertical rule separating columns (`Layout > Columns > More Columns > Line between`).
3. *Column Break (`Ctrl + Shift + Enter`)*: Forces text flow to terminate in Column 1 and resume instantly at the top of Column 2.
4. *Balancing Columns at End of Section*: In a 2-column layout, the last page often looks awkward with text filling the left column while the right remains completely blank. *Fix*: Insert a *Section Break (Continuous)* at the end of the text. Word instantly calculates equal vertical balance across both columns!

#pagebreak()

== 6.5 Production Workflow: Inserting a Single Landscape Page into a Portrait Document

This is the most common test in corporate MIS and administrative interviews. Follow this exact 5-step sequence:

```
Step 1: Place cursor at the bottom of Page 4 (Portrait)
Step 2: Navigate to Layout > Breaks > Section Breaks > Next Page (Cursor jumps to Page 5)
Step 3: While on Page 5, click Layout > Orientation > Landscape
Step 4: Paste wide financial spreadsheet table onto Page 5
Step 5: At the end of Page 5, click Layout > Breaks > Section Breaks > Next Page
Step 6: On Page 6, click Layout > Orientation > Portrait.
Result: Pages 1-4 are Portrait, Page 5 is Landscape, Pages 6+ are Portrait!
```

#v(2pt)

== 6.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which key combination inserts an instant hard Page Break?", ans: "Ctrl + Enter.")
    #short-qa(num: 2, q: "What break type allows mixing 1-column and 2-column text on the same page?", ans: "Section Break (Continuous).")
    #short-qa(num: 3, q: "What is the extra margin added to the inside binding edge of a book called?", ans: "Gutter Margin.")
    #short-qa(num: 4, q: "Which shortcut forces text to jump immediately to the top of the next column?", ans: "Ctrl + Shift + Enter.")
  ],
  [
    #mcq(num: 1, q: "To make only Page 5 landscape while keeping Page 4 portrait, what must be inserted before Page 5?", a: "Page Break", b: "Column Break", c: "Section Break (Next Page)", d: "Text Wrapping Break", ans: "C", expl: "Section Breaks isolate page geometry; Page Breaks preserve the parent orientation.")
    #mcq(num: 2, q: "In publishing, what type of section break ensures a new chapter always starts on a right-hand page?", a: "Continuous", b: "Odd Page Section Break", c: "Even Page Section Break", d: "Next Page", ans: "B", expl: "Odd page breaks force text to an odd-numbered (recto/right-hand) page.")
    #mcq(num: 3, q: "How do you balance uneven text columns at the very end of a newsletter document?", a: "Press Enter repeatedly", b: "Insert a Continuous Section Break at the end of the text", c: "Increase font size", d: "Change paper to Legal", ans: "B", expl: "A continuous section break forces Word's layout engine to equalize column heights.")
  ]
)

#v(2pt)

#spotlight-box("2027 LIQUID RESPONSIVE PRINT ENGINES", [
  Modern Word 365 incorporates dynamic reflow intelligence. When switching a multi-column document between A4 and mobile viewport reading modes, Section Breaks dynamically compute whether to preserve columnization or reflow into fluid single-column responsive cards without breaking table anchors.
])
"""

    ch06_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 06]
= लेआउट टैब: सेक्शन ब्रेक्स, मल्टी-कॉलम फ्लो एवं पेज सेटअप मैकेनिक्स

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  डॉक्यूमेंट लेआउट मैकेनिक्स भौतिक कागज़ के आकार, मुद्रण मार्जिन और बहु-कॉलम समाचार पत्रिका लेआउट को नियंत्रित करता है। माइक्रोसॉफ्ट वर्ड का सबसे शक्तिशाली और अक्सर गलत समझा जाने वाला फीचर है 'सेक्शन ब्रेक' (Section Break)—वह आधारभूत ढांचा जो अलग-अलग पेज ओरिएंटेशन और हेडर नंबरिंग को संभव बनाता है।
]

#v(2pt)

== 6.1 पेज सेटअप संरचना: मार्जिन, ओरिएंटेशन एवं पेपर मानक

`Layout > Page Setup` के अंतर्गत कैनवास के आयामों को सूक्ष्मता से निर्धारित किया जाता है:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*लेआउट पैरामीटर*], [*मानक कॉर्पोरेट मान*], [*कार्यप्रणाली एवं सावधानियां*]),
  [Margins], [Normal (1"), Narrow (0.5"), Moderate, Mirrored], [Mirrored मार्जिन किताबों के लिए अंदर/बाहर का अनुपात सेट करता है।],
  [Gutter Margin], [बाइंडिंग वाले अंदरूनी किनारे पर 0.3" से 0.6" जोड़ना], [किताब सिलने अथवा स्पाइरल बाइंडिंग में टेक्स्ट को दबने से बचाता है।],
  [Orientation], [Portrait (8.27" × 11.69"), Landscape (11.69" × 8.27")], [लैंडस्केप चौड़ी वित्तीय बैलेंस शीट टेबल्स हेतु उपयुक्त है।],
  [Paper Size], [A4 (210 × 297 mm), Letter (8.5" × 11"), Legal], [भारत व यूरोप में A4 मानक है; उत्तरी अमेरिका में Letter चलता है।],
  [Hyphenation], [None, Automatic, Manual], [पंक्ति के अंत में शब्दों को हाइफ़न (-) लगाकर तोड़ना ताकि रिक्त स्थान न छूटे।]
)

#v(2pt)
#ribbon-specimen(path: "Layout > Page Setup > Margins > Custom Margins", command: "गटर मार्जिन व बाइंडिंग स्पेस सेट करना", shortcut: "Alt + P + M + A")
#v(2pt)

== 6.2 मौलिक अंतर: पेज ब्रेक (Page Break) बनाम सेक्शन ब्रेक (Section Break)

पेज ब्रेक और सेक्शन ब्रेक में भ्रम होना ही कॉर्पोरेट दस्तावेज़ों का लेआउट बिगड़ने का सबसे बड़ा कारण है:

- *पेज ब्रेक (`Ctrl + Enter`)*: वर्तमान पेज को तुरंत समाप्त करके कर्सर को अगले पेज के शीर्ष पर भेजता है। *महत्वपूर्ण बात यह है कि दोनों पेजों के हेडर, फुटर, मार्जिन और ओरिएंटेशन पूरी तरह से एक समान रहते हैं।*
- *सेक्शन ब्रेक*: दस्तावेज़ के आंतरिक XML ढांचे में एक स्वतंत्र संरचनात्मक दीवार बनाता है। प्रत्येक सेक्शन के अपने स्वतंत्र मार्जिन, ओरिएंटेशन (पोर्ट्रेट/लैंडस्केप), हेडर, फुटर और पेज नंबरिंग हो सकते हैं।

#concept-box(title: "महत्वपूर्ण आर्किटेक्चरल नियम: सेक्शन ब्रेक्स", [
  पेज ब्रेक केवल टेक्स्ट को नीचे धकेलता है। सेक्शन ब्रेक एक अलग प्रशासनिक ब्लॉक बनाता है। आप बिना सेक्शन ब्रेक लगाए किसी एक पेज को लैंडस्केप नहीं कर सकते और न ही पेज नंबर 1 से दोबारा शुरू कर सकते हैं!
])

#pagebreak()

== 6.3 सेक्शन ब्रेक के 4 प्रकार एवं उनकी कार्यप्रणाली

वर्ड 365 में `Layout > Page Setup > Breaks` के तहत 4 प्रकार के सेक्शन ब्रेक उपलब्ध हैं:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*सेक्शन ब्रेक प्रकार*], [*पेजिनेशन व्यवहार*], [*कॉर्पोरेट उपयोग परिदृश्य*]),
  [Next Page], [नया सेक्शन बनाकर कर्सर को अगले भौतिक पेज के शीर्ष पर भेजता है।], [चौड़ी वित्तीय टेबल हेतु पेज 2 को पोर्ट्रेट से लैंडस्केप करना।],
  [Continuous], [उसी पेज पर बिना पेज तोड़े तुरंत नया स्वतंत्र सेक्शन शुरू करता है।], [उसी पेज पर 1-कॉलम शीर्षक के नीचे 3-कॉलम न्यूज़लेटर शुरू करना।],
  [Even Page], [नया सेक्शन बनाकर टेक्स्ट को अगले उपलब्ध सम-संख्या (Even) पेज पर भेजता है।], [अकादमिक पुस्तकें जहां अध्याय हमेशा बाएं पेज से शुरू होने हों।],
  [Odd Page], [नया सेक्शन बनाकर टेक्स्ट को अगले विषम-संख्या (Odd) पेज पर ले जाता है।], [प्रकाशन मानक: सभी मुख्य अध्याय हमेशा दाएं पेज (1, 3, 5) से शुरू होते हैं।]
)

#v(2pt)
#ribbon-specimen(path: "Layout > Page Setup > Breaks > Next Page", command: "स्वतंत्र सेक्शन सीमा प्रविष्ट करना", shortcut: "Alt + P + B + N")
#v(2pt)

== 6.4 मल्टी-कॉलम न्यूज़पेपर लेआउट इंजीनियरिंग

`Layout > Page Setup > Columns` के तहत टेक्स्ट को 2, 3, अथवा असमान कॉलमों में बांटा जाता है:
1. *Equal Width Columns*: समाचार पत्रों का मानक पठन प्रारूप (3.3" चौड़ाई और 0.5" गटर)।
2. *Line Between*: कॉलमों के बीच एक सुंदर ऊर्ध्वाधर विभाजक रेखा जोड़ना (`Layout > Columns > More Columns > Line between`)।
3. *Column Break (`Ctrl + Shift + Enter`)*: कॉलम 1 के टेक्स्ट को वहीं रोककर कर्सर को तुरंत कॉलम 2 के शीर्ष पर भेजना।
4. *कॉलमों को संतुलित करना (Balance Columns)*: दो-कॉलम लेआउट में अंतिम पेज पर अक्सर बायाँ कॉलम भर जाता है और दायाँ बिल्कुल खाली रहता है। *समाधान*: टेक्स्ट के ठीक अंत में *Section Break (Continuous)* लगाएं। वर्ड तुरंत दोनों कॉलमों की ऊंचाई को बराबर संतुलित कर देता है!

#pagebreak()

== 6.5 प्रोडक्शन वर्कफ्लो: पोर्ट्रेट दस्तावेज़ के बीच में 1 लैंडस्केप पेज जोड़ना

MIS और प्रशासनिक साक्षात्कारों में यह सबसे अधिक पूछा जाने वाला प्रश्न है। इस 6-चरणीय प्रक्रिया का पालन करें:

```
चरण 1: पेज 4 (पोर्ट्रेट) के अंतिम पैराग्राफ पर कर्सर रखें
चरण 2: Layout > Breaks > Section Breaks > Next Page पर क्लिक करें (कर्सर पेज 5 पर जाएगा)
चरण 3: पेज 5 पर रहते हुए Layout > Orientation > Landscape चुनें
चरण 4: अपनी चौड़ी वित्तीय बैलेंस शीट टेबल पेज 5 पर पेस्ट करें
चरण 5: पेज 5 की टेबल के नीचे Layout > Breaks > Section Breaks > Next Page लगाएं
चरण 6: पेज 6 पर जाकर Layout > Orientation > Portrait चुन लें।
परिणाम: पेज 1-4 पोर्ट्रेट रहेंगे, केवल पेज 5 लैंडस्केप होगा, और पेज 6 से पुनः पोर्ट्रेट हो जाएगा!
```

#v(2pt)

== 6.6 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "तत्काल पेज ब्रेक लगाने का शॉर्टकट क्या है?", ans: "Ctrl + Enter.")
    #short-qa(num: 2, q: "एक ही पेज पर 1-कॉलम और 2-कॉलम का मिश्रण करने वाला ब्रेक कौन सा है?", ans: "Section Break (Continuous).")
    #short-qa(num: 3, q: "किताब की बाइंडिंग में दबने से बचाने के लिए अतिरिक्त जोड़े जाने वाले मार्जिन को क्या कहते हैं?", ans: "Gutter Margin.")
    #short-qa(num: 4, q: "टेक्स्ट को अगले कॉलम के शीर्ष पर भेजने का शॉर्टकट क्या है?", ans: "Ctrl + Shift + Enter.")
  ],
  [
    #mcq(num: 1, q: "पेज 4 को पोर्ट्रेट रखते हुए केवल पेज 5 को लैंडस्केप बनाने हेतु क्या जोड़ना अनिवार्य है?", a: "Page Break", b: "Column Break", c: "Section Break (Next Page)", d: "Text Wrapping Break", ans: "C", expl: "सेक्शन ब्रेक पेज ओरिएंटेशन को स्वतंत्र करता है; सामान्य पेज ब्रेक से यह संभव नहीं।")
    #mcq(num: 2, q: "किताब में नया अध्याय सदैव दाईं ओर (विषम पेज) से शुरू करने हेतु कौन सा ब्रेक लगाते हैं?", a: "Continuous", b: "Odd Page Section Break", c: "Even Page Section Break", d: "Next Page", ans: "B", expl: "Odd Page ब्रेक टेक्स्ट को अगले विषम (1, 3, 5...) पेज पर ले जाता है।")
    #mcq(num: 3, q: "न्यूज़लेटर के अंत में दोनों कॉलमों की लंबाई को बराबर संतुलित करने का उपाय क्या है?", a: "बार-बार Enter दबाना", b: "टेक्स्ट के अंत में Continuous Section Break लगाना", c: "फॉन्ट बढ़ाना", d: "मार्जिन घटाना", ans: "B", expl: "कंटीन्यूअस सेक्शन ब्रेक वर्ड के इंजन को दोनों कॉलमों की ऊंचाई बराबर करने का निर्देश देता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 रिस्पॉन्सिव प्रिंट इंजन", [
  वर्ड 365 में डायनामिक री-फ्लो इंटेलिजेंस उपलब्ध है। जब किसी बहु-कॉलम दस्तावेज़ को A4 से मोबाइल स्क्रीन व्यू में बदला जाता है, तो सेक्शन ब्रेक कॉलमों को स्वतः पहचान कर उन्हें तरल सिंगल-कॉलम रिस्पॉन्सिव कार्ड्स में बदल देते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-06.typ"), "w", encoding="utf-8") as f:
        f.write(ch06_en)
    with open(os.path.join(hi_dir, "chapter-06.typ"), "w", encoding="utf-8") as f:
        f.write(ch06_hi)

    # =========================================================================
    # CHAPTER 07: Design Tab & Header/Footer Engineering (3 Pages)
    # =========================================================================
    ch07_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 07]
= Design Tab, Watermarks & Multi-Tier Header/Footer Engineering

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Header and footer architecture represents the apex of corporate publishing polish. Unlinking "Same as Previous" headers, establishing distinct Frontmatter Roman numerals (i, ii, iii) vs. Arabic chapter numbering (1, 2, 3), and embedding secure corporate watermarks are essential competencies for master authors.
]

#v(2pt)

== 7.1 Design Tab: Corporate Themes, Color Palettes & Watermarks

The *Design Tab* controls universal document cosmetics:
- *Document Themes*: Packages of coordinating fonts (Headings + Body) and 12-color palettes (Primary, Secondary, 6 Accents, Dark/Light neutrals, Hyperlinks).
- *Watermarks (`Design > Watermark`)*: Embeds semi-transparent security stamps (e.g., `CONFIDENTIAL`, `DO NOT COPY`, or custom corporate vector logos) rotated at -45° across every printed page.
- *Page Borders & Color*: Frame pages with elegant 0.5pt rules or tinted paper fills.

#v(2pt)
#ribbon-specimen(path: "Design > Watermark > Custom Watermark", command: "Embed High-Security Text or Graphic Watermark", shortcut: "Alt + G + P + W")
#v(2pt)

== 7.2 Header & Footer Mechanics: The Contextual Ribbon

Double-clicking the top or bottom margin opens the *Header & Footer* contextual ribbon:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Control Switch*], [*Architectural Function*], [*Enterprise Publishing Role*]),
  [Different First Page], [Suppresses headers/footers on Page 1 of the section.], [Hides headers/footers on cover pages and chapter title pages.],
  [Different Odd & Even], [Separates headers for left-hand (Even) and right-hand (Odd) pages.], [Book layout: Book title on left; Chapter title on right.],
  [Link to Previous], [Inherits header content from preceding section.], [Enabled by default; *MUST BE UNLINKED* to isolate chapter headers.],
  [Header from Top (0.5")], [Calibrates distance from top paper edge to header baseline.], [Ensures headers sit comfortably above printable body margins.],
  [Footer from Bottom (0.5")], [Calibrates distance from bottom paper edge to footer text.], [Guarantees page number sits within hardware printer margins.]
)

#concept-box(title: "CRITICAL OPERATIONAL TRAP: 'LINK TO PREVIOUS'", [
  By default, every new Section Break inherits headers from Section 1 via the active `Link to Previous` toggle. If you edit the header in Section 2 without toggling `Link to Previous` off, your changes will propagate backwards and overwrite Section 1!
])

#pagebreak()

== 7.3 Multi-Tier Page Numbering: Roman (Frontmatter) vs. Arabic (Body)

In professional book and report publishing:
- Cover page has *no page number*.
- Frontmatter (Executive Summary, Table of Contents, Acknowledgments) uses lower-case Roman numerals: i, ii, iii, iv.
- Chapter 1 onwards resets and uses standard Arabic numerals: 1, 2, 3....

*The Flawless 6-Step Implementation Protocol*:
1. Insert a *Section Break (Next Page)* between the Table of Contents and Chapter 1.
2. Navigate to Chapter 1, double-click the footer, and click *Link to Previous* to *turn it off* (severing the link).
3. In Chapter 1 footer, go to `Header & Footer > Page Number > Format Page Numbers`.
4. Set *Number format* to `1, 2, 3...` and select *Start at: 1*.
5. Return to the Table of Contents footer (Section 1).
6. Set *Format Page Numbers* to `i, ii, iii...` and select *Start at: i*. Check *Different First Page* to suppress numbering on the Cover page.

#v(2pt)
#ribbon-specimen(path: "Header & Footer > Page Number > Format Page Numbers", command: "Configure Roman vs Arabic Starting Index", shortcut: "Alt + J + H + P + F")
#v(2pt)

== 7.4 Running Headers with Dynamic Chapter Titles (STYLEREF Field)

Instead of manually typing chapter names into headers across 100 pages (which creates massive maintenance debt), corporate documents utilize dynamic fields:

```
Field Syntax: { STYLEREF "Heading 1" }
```

*How to Insert Dynamic Field*:
1. Inside the header, place the cursor where you want the chapter title to appear.
2. Press `Ctrl + F9` to insert field braces `{ }`.
3. Type `STYLEREF "Heading 1"` inside the braces.
4. Press `F9` to evaluate the field.
5. *Result*: Word automatically reads whichever `Heading 1` is active on that specific page and prints its exact title in the header! When headings change, the headers update automatically!

#pagebreak()

== 7.5 Production Blueprint: Corporate Two-Tier Header & Footer Structure

Below is the exact architectural specification used by Fortune 500 enterprises for boardroom report layouts:

```
TOP RUNNING HEADER (0.5" from top edge):
[Left: RTECHLAB | Confidential]             [Right: { STYLEREF "Heading 1" }]
───────────────────────────────────────────────────────────────────────────── (0.5pt Border)

[Page Canvas: 1" Margins Left / Right / Top / Bottom]

───────────────────────────────────────────────────────────────────────────── (0.5pt Border)
BOTTOM RUNNING FOOTER (0.5" from bottom edge):
[Left: Enterprise Architecture Report 2027]  [Right: Page { PAGE } of { NUMPAGES }]
```

#v(2pt)

== 7.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which toggle button must be disabled before changing the header in Section 2?", ans: "'Link to Previous' button.")
    #short-qa(num: 2, q: "Which setting hides page numbers on the first page of a section?", ans: "'Different First Page'.")
    #short-qa(num: 3, q: "Which dynamic field code prints the active chapter heading in the running header?", ans: "{ STYLEREF \"Heading 1\" }.")
    #short-qa(num: 4, q: "Which key evaluates and refreshes selected field codes in Word?", ans: "F9 key.")
  ],
  [
    #mcq(num: 1, q: "To display page numbers in 'Page 4 of 25' format, which two fields are combined?", a: "{ CURRENT } and { TOTAL }", b: "{ PAGE } and { NUMPAGES }", c: "{ NUM } and { COUNT }", d: "{ INDEX } and { MAX }", ans: "B", expl: "{ PAGE } inserts the current page number; { NUMPAGES } inserts total document pages.")
    #mcq(num: 2, q: "What happens if you edit a header in Section 2 while 'Link to Previous' is active?", a: "Section 2 header disappears", b: "The edit propagates backwards, overwriting Section 1", c: "Word displays an error", d: "Document converts to PDF", ans: "B", expl: "Linked headers share the identical XML stream; editing one modifies all linked sections.")
    #mcq(num: 3, q: "Where is the Watermark tool located in Word 365?", a: "Home Tab", b: "Insert Tab", c: "Design Tab", d: "Review Tab", ans: "C", expl: "Watermarks, Themes, and Document Formatting reside on the Design Tab.")
  ]
)

#v(2pt)

#spotlight-box("2027 CRYPTOGRAPHIC DYNAMIC WATERMARKING", [
  Word 365 Enterprise supports dynamic recipient-bound watermarking. When emailing sensitive financial reports, Word injects the recipient's email address, IP address, and access timestamp invisibly into the background watermark, discouraging unauthorized leaks and cell phone screen photography.
])
"""

    ch07_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 07]
= डिजाइन टैब, वॉटरमार्क एवं बहुस्तरीय हेडर/फुटर इंजीनियरिंग

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  हेडर और फुटर आर्किटेक्चर कॉर्पोरेट प्रकाशन की भव्यता का शिखर है। पिछले सेक्शन के हेडर का लिंक तोड़ना (Unlink 'Same as Previous'), प्रस्तावना हेतु रोमन अंक (i, ii, iii) तथा मुख्य अध्यायों हेतु अरेबिक संख्या (1, 2, 3) लगाना, और सुरक्षित वॉटरमार्क जोड़ना पेशेवर रचनाकारों हेतु अनिवार्य कौशल हैं।
]

#v(2pt)

== 7.1 डिजाइन टैब: कॉर्पोरेट थीम्स, कलर पैलेट्स एवं वॉटरमार्क

*Design Tab* दस्तावेज़ के सार्वभौमिक स्वरूप को नियंत्रित करता है:
- *डॉक्यूमेंट थीम्स*: फॉन्ट्स और 12-रंगीन पैलेट्स का समन्वित सेट (प्राइमरी, सेकेंडरी, एक्सेंट्स, बैकग्राउंड)।
- *वॉटरमार्क (`Design > Watermark`)*: सभी पेजों पर -45° झुका हुआ अर्ध-पारदर्शी सुरक्षा पाठ (जैसे `CONFIDENTIAL`, `DO NOT COPY` अथवा कंपनी का लोगो) जोड़ना।
- *पेज बॉर्डर्स व रंग*: पेजों के चारों ओर सुरुचिपूर्ण 0.5pt की बॉर्डर अथवा हल्का रंगीन शेडिंग जोड़ना।

#v(2pt)
#ribbon-specimen(path: "Design > Watermark > Custom Watermark", command: "उच्च-सुरक्षा टेक्स्ट अथवा इमेज वॉटरमार्क लगाना", shortcut: "Alt + G + P + W")
#v(2pt)

== 7.2 हेडर एवं फुटर मैकेनिक्स: प्रासंगिक रिबन का विश्लेषण

पेज के ऊपरी अथवा निचले मार्जिन पर डबल-क्लिक करने पर *Header & Footer* रिबन खुलता है:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*कंट्रोल स्विच*], [*आर्किटेक्चरल कार्यप्रणाली*], [*कॉर्पोरेट प्रकाशन में भूमिका*]),
  [Different First Page], [सेक्शन के पहले पेज पर हेडर व फुटर को छिपाता है।], [कवर पेज और अध्याय के मुख्य शीर्षक पेज को स्वच्छ रखना।],
  [Different Odd & Even], [बाएं (सम) और दाएं (विषम) पेजों के लिए अलग-अलग हेडर बनाता है।], [पुस्तक लेआउट: बाएं पेज पर पुस्तक का नाम; दाएं पर अध्याय का नाम।],
  [Link to Previous], [पिछले सेक्शन के हेडर को हूबहू कॉपी करता है।], [डिफ़ॉल्ट रूप से चालू; *अध्याय बदलने पर इसे बंद करना अनिवार्य है*।],
  [Header from Top (0.5")], [कागज़ के ऊपरी किनारे से हेडर की दूरी सेट करता है।], [हेडर को प्रिंटिंग मार्जिन के भीतर सुरक्षित रखता है।],
  [Footer from Bottom (0.5")], [कागज़ के निचले किनारे से फुटर की दूरी तय करता है।], [पेज नंबर को प्रिंटर के हार्डवेयर मार्जिन में कटने से बचाता है।]
)

#concept-box(title: "अत्यंत महत्वपूर्ण परिचालन चेतावनी: 'LINK TO PREVIOUS'", [
  डिफ़ॉल्ट रूप से प्रत्येक नया सेक्शन ब्रेक पिछले सेक्शन के हेडर से जुड़ा रहता है (`Link to Previous` ऑन रहता है)। यदि आप सेक्शन 2 में जाकर हेडर बदलेंगे और यह बटन बंद नहीं करेंगे, तो आपका बदलाव सेक्शन 1 में भी चला जाएगा और पुराना हेडर मिट जाएगा!
])

#pagebreak()

== 7.3 बहुस्तरीय पेज नंबरिंग: रोमन (प्रस्तावना) बनाम अरेबिक (मुख्य अध्याय)

पेशेवर किताबों और वार्षिक रिपोर्ट्स में:
- कवर पेज पर *कोई पेज नंबर नहीं* होता।
- प्रस्तावना (कार्यकारी सारांश, टेबल ऑफ कंटेंट्स) में छोटे रोमन अंक प्रयुक्त होते हैं: i, ii, iii, iv।
- अध्याय 1 से संख्या पुनः 1 से शुरू होती है और अरेबिक अंकों का प्रयोग होता है: 1, 2, 3...।

#v(1.5pt)
*इसकी अचूक 6-चरणीय प्रक्रिया*:
1. टेबल ऑफ कंटेंट्स और अध्याय 1 के बीच *Section Break (Next Page)* लगाएं।
2. अध्याय 1 के पहले पेज के फुटर पर डबल-क्लिक करें, और *Link to Previous* बटन दबाकर *उसे बंद कर दें*।
3. अध्याय 1 के फुटर में `Header & Footer > Page Number > Format Page Numbers` पर जाएं।
4. *Number format* को `1, 2, 3...` चुनें और *Start at: 1* सेट करें।
5. अब टेबल ऑफ कंटेंट्स वाले फुटर (सेक्शन 1) में जाएं।
6. वहां *Format Page Numbers* में `i, ii, iii...` चुनें और *Start at: i* रखें। कवर पेज पर नंबर छिपाने हेतु *Different First Page* चेक कर दें।

#v(2pt)
#ribbon-specimen(path: "Header & Footer > Page Number > Format Page Numbers", command: "रोमन व अरेबिक प्रारंभिक संख्या कॉन्फ़िगर करना", shortcut: "Alt + J + H + P + F")
#v(2pt)

== 7.4 डायनामिक अध्याय शीर्षक हेडर (STYLEREF फील्ड कोड)

100 पेजों पर प्रत्येक अध्याय का नाम हेडर में हाथ से टाइप करने के बजाय डायनामिक फील्ड का उपयोग करें:

```
फील्ड सिंटैक्स: { STYLEREF "Heading 1" }
```

*डायनामिक फील्ड जोड़ने का तरीका*:
1. हेडर के भीतर उस स्थान पर कर्सर रखें जहाँ अध्याय का नाम चाहिए।
2. कीबोर्ड पर `Ctrl + F9` दबाएं जिससे फील्ड ब्रैकेट्स `{ }` दिखाई देंगे।
3. ब्रैकेट्स के भीतर `STYLEREF "Heading 1"` टाइप करें।
4. फील्ड को सक्रिय करने हेतु `F9` की दबाएं।
5. *परिणाम*: उस पेज पर जो भी `Heading 1` होगी, वर्ड स्वतः उसका नाम हेडर में प्रदर्शित करेगा! हेडिंग बदलते ही हेडर अपने आप बदल जाएगा।

#pagebreak()

== 7.5 प्रोडक्शन ब्लूप्रिंट: कॉर्पोरेट टू-टियर हेडर एवं फुटर संरचना

नीचे फॉर्च्यून 500 कंपनियों की बोर्डरूम रिपोर्ट्स हेतु प्रयुक्त मानक हेडर/फुटर लेआउट दिया गया है:

```
शीर्ष रनिंग हेडर (ऊपरी किनारे से 0.5 इंच):
[बाएं: RTECHLAB | गोपनीय]                    [दाएं: { STYLEREF "Heading 1" }]
───────────────────────────────────────────────────────────────────────────── (0.5pt बॉर्डर)

[पेज कैनवास: चारों तरफ 1 इंच मार्जिन]

───────────────────────────────────────────────────────────────────────────── (0.5pt बॉर्डर)
निचला रनिंग फुटर (निचले किनारे से 0.5 इंच):
[बाएं: एंटरप्राइज आर्किटेक्चर रिपोर्ट 2027]    [दाएं: Page { PAGE } of { NUMPAGES }]
```

#v(2pt)

== 7.6 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "सेक्शन 2 का हेडर बदलने से पहले कौन सा बटन बंद करना अनिवार्य है?", ans: "'Link to Previous' बटन।")
    #short-qa(num: 2, q: "सेक्शन के पहले पेज पर पेज नंबर छिपाने वाली सेटिंग कौन सी है?", ans: "'Different First Page'.")
    #short-qa(num: 3, q: "हेडर में सक्रिय अध्याय शीर्षक स्वतः प्रदर्शित करने वाला फील्ड कोड कौन सा है?", ans: "{ STYLEREF \"Heading 1\" }.")
    #short-qa(num: 4, q: "वर्ड में चयनित फील्ड कोड्स को रीफ्रेश/अपडेट करने वाली की कौन सी है?", ans: "F9 कुंजी।")
  ],
  [
    #mcq(num: 1, q: "'Page 4 of 25' प्रारूप में पेज नंबर दर्शाने हेतु किन दो फील्ड्स का मेल किया जाता है?", a: "{ CURRENT } व { TOTAL }", b: "{ PAGE } व { NUMPAGES }", c: "{ NUM } व { COUNT }", d: "{ INDEX } व { MAX }", ans: "B", expl: "{ PAGE } वर्तमान पेज नंबर देता है और { NUMPAGES } कुल पेजों की संख्या।")
    #mcq(num: 2, q: "यदि 'Link to Previous' चालू रहते हुए सेक्शन 2 का हेडर बदला जाए तो क्या होगा?", a: "सेक्शन 2 हेडर मिट जाएगा", b: "बदलाव पिछले सेक्शन में भी चला जाएगा और सेक्शन 1 ओवरराइट होगा", c: "वर्ड क्रैश हो जाएगा", d: "दस्तावेज़ लॉक होगा", ans: "B", expl: "लिंक्ड हेडर एक ही XML डेटा साझा करते हैं; एक बदलने से सभी बदल जाते हैं।")
    #mcq(num: 3, q: "वर्ड 365 में वॉटरमार्क टूल किस रिबन टैब पर स्थित है?", a: "Home Tab", b: "Insert Tab", c: "Design Tab", d: "Review Tab", ans: "C", expl: "वॉटरमार्क, थीम्स और स्टाइल सेट्स Design Tab पर स्थित होते हैं।")
  ]
)

#v(2pt)

#spotlight-box("2027 डायनामिक वॉटरमार्किंग", [
  वर्ड 365 एंटरप्राइज अब प्राप्तकर्ता-आधारित डायनामिक वॉटरमार्किंग का समर्थन करता है। संवेदनशील वित्तीय रिपोर्ट ईमेल करते समय वर्ड बैकग्राउंड में प्राप्तकर्ता का ईमेल, IP पता और समय अदृश्य रूप से जोड़ देता है जिससे मोबाइल से फोटो खींचकर लीक करना असंभव हो जाता है।
])
"""

    with open(os.path.join(eng_dir, "chapter-07.typ"), "w", encoding="utf-8") as f:
        f.write(ch07_en)
    with open(os.path.join(hi_dir, "chapter-07.typ"), "w", encoding="utf-8") as f:
        f.write(ch07_hi)

    # =========================================================================
    # CHAPTER 08: References Tab: Auto-TOC, Citations & Index (3 Pages)
    # =========================================================================
    ch08_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 08]
= References Tab: Automatic Table of Contents, Citations, Footnotes & Index

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Academic dissertations, enterprise whitepapers, and legal briefs depend on rigorous bibliographic referencing and automated structural tables. Never manually type page numbers into a Table of Contents. Word's programmatic References engine automates TOC generation, APA/IEEE citations, cross-references, and back-of-book indexing.
]

#v(2pt)

== 8.1 Automatic Table of Contents (TOC) Architecture

The *Table of Contents* engine (`References > Table of Contents`) scans the document's XML tree for semantic heading styles (`Heading 1`, `Heading 2`, `Heading 3`) and compiles an interactive, hyperlinked directory:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*TOC Variant*], [*Structural Characteristics*], [*Enterprise Implementation Scenario*]),
  [Automatic Table 1], [Labeled "Contents"; reads Headings 1-3; inserts dotted tab leaders.], [Standard corporate reports, business proposals.],
  [Automatic Table 2], [Labeled "Table of Contents"; identical programmatic compilation.], [Academic research publications, technical manuals.],
  [Custom Table of Contents], [User specifies display levels (1-9), tab leader style, and custom styles.], [Legal documents requiring inclusion of custom "Clause" styles.],
  [Manual Table], [Static dummy placeholder text requiring manual typing.], [*AVOID IN ENTERPRISE*: High risk of outdated page references.]
)

#v(2pt)
#ribbon-specimen(path: "References > Table of Contents > Update Table", command: "Synchronize Page Numbers or Entire TOC", shortcut: "F9 / Alt + S + U")
#v(2pt)

== 8.2 Updating the TOC & The F9 Synchronization Protocol

When headings are edited or paragraphs expand across new pages, the TOC becomes desynchronized.
- Click `References > Update Table` (or select TOC and press `F9`).
- *Update page numbers only*: Ultra-fast; refreshes page numbers while preserving manual text overrides.
- *Update entire table*: Completely rebuilds the directory tree, pulling in newly authored headings and modifying renamed titles.

#concept-box(title: "CRITICAL PRE-FLIGHT RULE: TOC HYPERLINKS", [
  All entries in Word's Automatic TOC function as live clickable hyperlinks (`Ctrl + Click` to jump directly to Chapter 14). When exported via `File > Export > Create PDF`, these hyperlinks remain fully interactive in Adobe Acrobat and web browsers.
])

#pagebreak()

== 8.3 Footnotes vs. Endnotes Architecture

Word 365 provides two academic citation mechanisms under `References > Footnotes`:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Note Type*], [*Shortcut*], [*Placement & Numbering Standard*], [*Enterprise Usage*]),
  [Footnote], [`Alt + Ctrl + F`], [Bottom of the exact same physical page; numbered 1, 2, 3...], [Immediate source clarification, legal definitions, caveats.],
  [Endnote], [`Alt + Ctrl + D`], [Very end of document (or end of section); numbered i, ii, iii...], [Exhaustive academic references, archival citations.]
)

#v(2pt)

== 8.4 Citations & Automated Bibliography Generation

Manual bibliography formatting violates publishing standards. Word incorporates an automated citation management database:
1. *Insert Citation (`References > Citations & Bibliography > Insert Citation`)*:
   - Select Source Type: *Book*, *Journal Article*, *Report*, *Website*, or *Conference Proceeding*.
   - Fill Author, Title, Year, City, and Publisher metadata.
   - Word inserts an in-text parenthetical citation (e.g., `(Patel, 2027)`).
2. *Citation Styles*: Switch dynamically between *APA 7th Edition*, *IEEE* (bracketed numbers `[1]`), *Chicago*, or *Harvard*. Word reformats all citations instantly!
3. *Generate Bibliography*: Click `References > Bibliography` to spawn a fully formatted alphabetical references list at the document's conclusion.

#v(2pt)
#ribbon-specimen(path: "References > Citations & Bibliography > Style", command: "Switch Citation Schema (APA 7th vs IEEE)", shortcut: "Alt + S + C + Y")
#v(2pt)

== 8.5 Captions, Table of Figures & Cross-References

Enterprise reports require structured visual indexing:
- *Insert Caption (`References > Captions > Insert Caption`)*: Attaches dynamic labels to graphics: *Figure 1: Enterprise Network Architecture* or *Table 3: Q3 Financial Balance Sheet*.
- *Cross-Reference (`References > Captions > Cross-reference`)*: References items inline (e.g., "as demonstrated in Figure 1 on page 14"). If Figure 1 moves to page 22, the inline text updates automatically upon pressing `F9`!
- *Table of Figures*: Generates a dedicated list of all diagrams and tables with their respective page numbers.

#pagebreak()

== 8.6 Indexing Mechanics: Marking Entries & Compiling Back-of-Book Index

An Index allows readers to look up specialized terminology alphabetically:
1. Highlight the target keyword (e.g., "Dynamic Arrays").
2. Press `Alt + Shift + X` to open the *Mark Index Entry* dialog.
3. Click *Mark* (or *Mark All* to index every occurrence throughout the book). Word injects a hidden field code: `{ XE "Dynamic Arrays" }`.
4. At the end of the document, navigate to `References > Index > Insert Index`.
5. Choose 2 columns, indented style, and click *OK*. Word compiles a professional, multi-column alphabetical index with accurate page numbers!

#v(2pt)

== 8.7 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which shortcut inserts an immediate Footnote at the bottom of the page?", ans: "Alt + Ctrl + F.")
    #short-qa(num: 2, q: "Which key shortcut opens the Mark Index Entry dialog?", ans: "Alt + Shift + X.")
    #short-qa(num: 3, q: "Which heading styles are captured by default in Word's Automatic Table 1?", ans: "Heading 1, Heading 2, and Heading 3.")
    #short-qa(num: 4, q: "Which citation format uses bracketed numeric markers like [1] and [2]?", ans: "IEEE style.")
  ],
  [
    #mcq(num: 1, q: "What is the shortcut to insert an Endnote at the end of a document?", a: "Ctrl + E", b: "Alt + Ctrl + D", c: "Alt + Shift + E", d: "Ctrl + Shift + F", ans: "B", expl: "Alt + Ctrl + D creates an endnote placed at the end of the document.")
    #mcq(num: 2, q: "What happens when you hold Ctrl and click on an entry in Word's Automatic Table of Contents?", a: "Deletes the heading", b: "Jumps directly to that section in the document", c: "Opens Print dialog", d: "Copies text", ans: "B", expl: "TOC entries function as internal hyperlinked anchors.")
    #mcq(num: 3, q: "Which tool automatically updates inline references when a figure moves to a new page?", a: "Bookmark", b: "Cross-reference", c: "SmartArt", d: "Format Painter", ans: "B", expl: "Cross-references track target items dynamically via internal field bookmarks.")
  ]
)

#v(2pt)

#spotlight-box("2027 AUTOMATED AI CITATION INTEGRITY CHECKING", [
  Word 365 Enterprise connects to Microsoft Academic & PubMed repositories. Copilot automatically verifies whether cited research papers have been retracted, flags broken digital object identifiers (DOIs), and converts arbitrary text references into standard APA 7th metadata entries.
])
"""

    ch08_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 08]
= रेफरेंस टैब: ऑटोमैटिक टेबल ऑफ कंटेंट्स, साइटेशन्स, फुटनोट्स एवं इंडेक्स

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  अकादमिक शोध पत्र, कॉर्पोरेट रिपोर्ट्स और कानूनी दस्तावेज़ सटीक संदर्भों और स्वचालित अनुक्रमणिका पर निर्भर करते हैं। टेबल ऑफ कंटेंट्स (TOC) में पेज नंबर कभी हाथ से टाइप न करें। वर्ड का प्रोग्रामेटिक रेफरेंस इंजन स्वचालित अनुक्रमणिका, APA/IEEE साइटेशन्स, क्रॉस-रेफरेंस और पुस्तक के अंत का इंडेक्स तैयार करता है।
]

#v(2pt)

== 8.1 ऑटोमैटिक टेबल ऑफ कंटेंट्स (TOC) आर्किटेक्चर

*Table of Contents* टूल (`References > Table of Contents`) दस्तावेज़ के सेमांटिक हेडिंग स्टाइल्स (`Heading 1`, `Heading 2`, `Heading 3`) को स्कैन करके एक इंटरएक्टिव, हाइपरलिंक्ड सूची बनाता है:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*TOC प्रारूप*], [*संरचनात्मक विशेषताएं*], [*कॉर्पोरेट उपयोग*]),
  [Automatic Table 1], [शीर्षक "Contents"; हेडिंग 1-3 को जोड़ता है; डॉटेड लीडर लाइन बनाता है।], [मानक कॉर्पोरेट रिपोर्ट्स, व्यावसायिक प्रस्ताव।],
  [Automatic Table 2], [शीर्षक "Table of Contents"; समान प्रोग्रामेटिक संरचना।], [अकादमिक शोध पत्र, तकनीकी मैनुअल्स।],
  [Custom TOC], [यूज़र स्तरों की संख्या (1-9), लीडर स्टाइल व कस्टम स्टाइल्स तय कर सकता है।], [कानूनी दस्तावेज़ जहां विशेष "धारा" स्टाइल्स शामिल करने हों।],
  [Manual Table], [डमी टेक्स्ट जिसे हाथ से टाइप करना पड़ता है।], [*कॉर्पोरेट में वर्जित*: पेज नंबर गलत होने का भारी जोखिम।]
)

#v(2pt)
#ribbon-specimen(path: "References > Table of Contents > Update Table", command: "पेज नंबर अथवा सम्पूर्ण TOC को सिंक्रनाइज़ करना", shortcut: "F9 / Alt + S + U")
#v(2pt)

== 8.2 TOC को अपडेट करना एवं F9 सिंक्रनाइज़ेशन प्रोटोकॉल

जब हेडिंग्स बदली जाती हैं या नए पैराग्राफ जुड़ने से पेज बदल जाते हैं, तो अनुक्रमणिका असंतुलित हो जाती है:
- `References > Update Table` पर क्लिक करें (अथवा TOC चुनकर `F9` दबाएं)।
- *Update page numbers only*: अत्यंत तीव्र; केवल पेज नंबर अपडेट करता है और यदि कोई मैन्युअल संपादन किया हो तो उसे सुरक्षित रखता है।
- *Update entire table*: पूरे इंडेक्स ट्री को दोबारा स्कैन करता है, नई जोड़ी गई हेडिंग्स को शामिल करता है और बदले हुए शीर्षकों को सही करता है।

#concept-box(title: "महत्वपूर्ण प्री-फ्लाइट नियम: TOC हाइपरलिंक्स", [
  वर्ड की ऑटोमैटिक अनुक्रमणिका में प्रत्येक प्रविष्टि एक सक्रिय हाइपरलिंक होती है (`Ctrl + Click` करके सीधे अध्याय पर कूद सकते हैं)। जब फाइल को `File > Export > Create PDF` द्वारा PDF बनाया जाता है, तो यह लिंक्स मोबाइल और कंप्यूटर पर भी क्लिक करने योग्य रहते हैं।
])

#pagebreak()

== 8.3 फुटनोट्स (Footnotes) बनाम एंडनोट्स (Endnotes) आर्किटेक्चर

वर्ड 365 में `References > Footnotes` के तहत दो संदर्भ प्रणालियां उपलब्ध हैं:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*नोट प्रकार*], [*शॉर्टकट*], [*स्थान एवं संख्या मानक*], [*कॉर्पोरेट उपयोग*]),
  [Footnote], [`Alt + Ctrl + F`], [उसी भौतिक पेज के निचले भाग पर; संख्या 1, 2, 3...], [कठिन शब्दों के अर्थ, कानूनी स्पष्टीकरण, स्रोत संदर्भ।],
  [Endnote], [`Alt + Ctrl + D`], [दस्तावेज़ (अथवा सेक्शन) के बिल्कुल अंत में; संख्या i, ii, iii...], [विस्तृत अकादमिक संदर्भ, अभिलेखीय ग्रंथसूची।]
)

#v(2pt)

== 8.4 साइटेशन्स एवं स्वचालित बिब्लियोग्राफी (ग्रंथसूची) निर्माण

ग्रंथसूची हाथ से लिखना प्रकाशन मानकों का उल्लंघन है। वर्ड का संदर्भ प्रबंधन डेटाबेस:
1. *Insert Citation (`References > Citations & Bibliography > Insert Citation`)*:
   - स्रोत प्रकार चुनें: *Book*, *Journal Article*, *Report*, *Website*।
   - लेखक, शीर्षक, वर्ष, शहर और प्रकाशक का डेटा दर्ज करें।
   - वर्ड टेक्स्ट के भीतर ब्रैकेटेड साइटेशन (जैसे `(Patel, 2027)`) जोड़ देता है।
2. *साइटेशन शैलियाँ*: *APA 7th Edition*, *IEEE* (नंबर वाले ब्रैकेट्स `[1]`), *Chicago* अथवा *Harvard* में तुरंत बदलें।
3. *ग्रंथसूची उत्पन्न करना*: `References > Bibliography` पर क्लिक करते ही दस्तावेज़ के अंत में वर्णमाला क्रम में सुव्यवस्थित संपूर्ण संदर्भ सूची तैयार हो जाती है।

#v(2pt)
#ribbon-specimen(path: "References > Citations & Bibliography > Style", command: "साइटेशन प्रारूप बदलना (APA बनाम IEEE)", shortcut: "Alt + S + C + Y")
#v(2pt)

== 8.5 कैप्शन्स, टेबल ऑफ फिगर्स एवं क्रॉस-रेफरेंस

कॉर्पोरेट रिपोर्ट्स में चित्रों और टेबल्स की अनुक्रमणिका अनिवार्य होती है:
- *Insert Caption (`References > Captions > Insert Caption`)*: चित्रों के नीचे डायनामिक लेबल जोड़ना: *Figure 1: एंटरप्राइज नेटवर्क आर्किटेक्चर*।
- *Cross-Reference (`References > Captions > Cross-reference`)*: टेक्स्ट के बीच में चित्र का संदर्भ देना (उदा. "जैसा कि पेज 14 पर चित्र 1 में दर्शाया गया है")। यदि चित्र पेज 22 पर चला जाए, तो `F9` दबाते ही टेक्स्ट स्वतः अपडेट हो जाता है!
- *Table of Figures*: सभी चित्रों और टेबल्स की समर्पित पेज-वार सूची तैयार करना।

#pagebreak()

== 8.6 इंडेक्सिंग मैकेनिक्स: शब्दों को मार्क करना एवं बैक-ऑफ-बुक इंडेक्स

इंडेक्स पाठकों को मुख्य तकनीकी शब्दों को वर्णमाला क्रम में खोजने में सहायता करता है:
1. लक्षित शब्द (जैसे "Dynamic Arrays") को चुनें।
2. कीबोर्ड पर `Alt + Shift + X` दबाकर *Mark Index Entry* डायलॉग खोलें।
3. *Mark* (अथवा पूरे दस्तावेज़ में खोजने हेतु *Mark All*) पर क्लिक करें। वर्ड एक गुप्त कोड `{ XE "Dynamic Arrays" }` जोड़ता है।
4. दस्तावेज़ के अंत में जाकर `References > Index > Insert Index` पर क्लिक करें।
5. 2 कॉलम, इंडेंटेड स्टाइल चुनें और *OK* दबाएं। वर्ड सटीक पेज नंबरों के साथ पेशेवर वर्णमाला इंडेक्स तैयार कर देगा!

#v(2pt)

== 8.7 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "पेज के निचले भाग पर तुरंत Footnote प्रविष्ट करने का शॉर्टकट क्या है?", ans: "Alt + Ctrl + F.")
    #short-qa(num: 2, q: "Mark Index Entry डायलॉग खोलने का शॉर्टकट क्या है?", ans: "Alt + Shift + X.")
    #short-qa(num: 3, q: "वर्ड की Automatic Table 1 डिफ़ॉल्ट रूप से किन हेडिंग्स को शामिल करती है?", ans: "Heading 1, Heading 2, एवं Heading 3.")
    #short-qa(num: 4, q: "[1] और [2] जैसे अंकीय संदर्भों का उपयोग करने वाला साइटेशन फॉर्मेट कौन सा है?", ans: "IEEE स्टाइल।")
  ],
  [
    #mcq(num: 1, q: "दस्तावेज़ के बिल्कुल अंत में Endnote जोड़ने का शॉर्टकट क्या है?", a: "Ctrl + E", b: "Alt + Ctrl + D", c: "Alt + Shift + E", d: "Ctrl + Shift + F", ans: "B", expl: "Alt + Ctrl + D दस्तावेज़ के अंत में एंडनोट जोड़ता है।")
    #mcq(num: 2, q: "ऑटोमैटिक टेबल ऑफ कंटेंट्स के किसी आइटम पर Ctrl दबाकर क्लिक करने पर क्या होता है?", a: "हेडिंग डिलीट होती है", b: "कर्सर सीधे दस्तावेज़ के उस अध्याय पर पहुँच जाता है", c: "प्रिंट डायलॉग खुलता है", d: "कॉपी होता है", ans: "B", expl: "TOC के सभी आइटम आंतरिक हाइपरलिंक की तरह कार्य करते हैं।")
    #mcq(num: 3, q: "चित्र के नए पेज पर जाने पर टेक्स्ट में लिखे उसके संदर्भ को स्वतः अपडेट करने वाला टूल कौन सा है?", a: "Bookmark", b: "Cross-reference", c: "SmartArt", d: "Format Painter", ans: "B", expl: "क्रॉस-रेफरेंस आंतरिक बुकमार्क के माध्यम से जुड़े रहते हैं और F9 दबाने पर अपडेट होते हैं।")
  ]
)

#v(2pt)

#spotlight-box("2027 AI साइटेशन सत्यापन", [
  वर्ड 365 एंटरप्राइज माइक्रोसॉफ्ट एकेडमिक और पबमेड रिपॉजिटरी से सीधे जुड़ा है। कोपायलट AI स्वचालित रूप से जांचता है कि कहीं संदर्भित शोध पत्र निरस्त (Retracted) तो नहीं हुआ, और टूटे हुए DOI लिंक्स को तुरंत सही करता है।
])
"""

    with open(os.path.join(eng_dir, "chapter-08.typ"), "w", encoding="utf-8") as f:
        f.write(ch08_en)
    with open(os.path.join(hi_dir, "chapter-08.typ"), "w", encoding="utf-8") as f:
        f.write(ch08_hi)

    # =========================================================================
    # CHAPTER 09: Mailings Tab: Enterprise Mail Merge Engine (4 Pages)
    # =========================================================================
    ch09_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 09]
= Mailings Tab: Enterprise Mail Merge Engine & Automated Document Dispatch

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Mail Merge is the enterprise engine of bulk personalization. It allows a single master template letter, payslip, certificate, or legal notice to dynamically synthesize data from thousands of records in an Excel database. Mastering data source binding, merge field syntax, conditional rules, and batch output dispatch is a mandatory core competency for office administrators, HR executives, and corporate analysts.
]

#v(2pt)

== 9.1 The Mail Merge Architecture & Pipeline Anatomy

The Mail Merge engine operates as a pipeline merging two distinct digital assets into an individualized output stream:

```
[Master Template Document] (.docx)       [Enterprise Excel Database] (.xlsx)
Contains static text, branding,           Contains tabular structured records:
headers, signatures & <<Fields>>          (First_Name, City, CTC, Email, Pan_No)
                     │                                   │
                     └─────────────────┬─────────────────┘
                                       ▼
                       [Mail Merge Processing Engine]
                       Evaluates IF...THEN...ELSE Rules
                       Formats Currency & Dates (@ ₹,0.00)
                                       │
                     ┌─────────────────┴─────────────────┐
                     ▼                                   ▼
        [Individual Documents (.docx)]       [Bulk Outlook Direct Email]
         5,000 Merged Printable Pages         5,000 HTML/PDF Personalized Mails
```

#v(2pt)

== 9.2 The 6-Step Universal Mail Merge Protocol

Word 365 streamlines bulk generation through the *Mailings Tab* or the *Step-by-Step Mail Merge Wizard* (`Mailings > Start Mail Merge > Step-by-Step Mail Merge Wizard`):

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Pipeline Stage*], [*Operational Action on Mailings Tab*], [*Enterprise Quality Assurance Rule*]),
  [1. Select Document Type], [`Start Mail Merge > Letters / Envelopes / Labels / Directory`], [Letters for appointment orders; Envelopes for postage delivery.],
  [2. Select Recipients], [`Select Recipients > Use an Existing List...`], [Browse to corporate Excel file; select designated worksheet tab.],
  [3. Filter & Sort Recipients], [`Edit Recipient List > Filter by State / CTC / Active Status`], [Strip duplicate employee IDs and filter out terminated staff.],
  [4. Insert Merge Fields], [`Write & Insert Fields > Insert Merge Field («First_Name»)`], [Insert specific field placeholders within body paragraphs.],
  [5. Preview Results], [`Preview Results > Navigate records with << < > >> arrows`], [Audit 5-10 records to verify text spacing around merged names.],
  [6. Finish & Merge], [`Finish & Merge > Edit Individual Documents / Print / Send Email`], [Generate master printable `.docx` file containing all merged pages.]
)

#v(2pt)
#ribbon-specimen(path: "Mailings > Start Mail Merge > Select Recipients", command: "Connect to External Excel Data Source", shortcut: "Alt + M + R + E")

#pagebreak()

== 9.3 Preparing & Sanitizing the Excel Data Source

90% of Mail Merge failures originate from poorly structured Excel sheets. Follow these strict data hygiene rules:
1. *Row 1 Must Be Column Headers*: Never put company titles, merged cells, or blank rows above the headers. Cell `A1` must be `Candidate_Name`, `B1` must be `Designation`, `C1` must be `Annual_CTC`.
2. *No Merged Cells Anywhere*: Merged cells in the data table corrupt the ODBC/OLEDB database connector, resulting in blank merge fields.
3. *Explicit Data Formatting*: Format zip codes as Text (`00000`) so leading zeros are not stripped (e.g., `01234` becoming `1234`).
4. *Close Excel File Before Merging*: Word requires exclusive read access. If the Excel sheet is open and locked by another user, Word will trigger a database connection error.

#v(2pt)
#ribbon-specimen(path: "Mailings > Start Mail Merge > Edit Recipient List", command: "Filter, Sort & Remove Duplicates", shortcut: "Alt + M + D")
#v(2pt)

== 9.4 Conditional Logic Rules: `IF...THEN...ELSE...` Field Mechanics

Enterprise letters require dynamic sentences based on recipient attributes. Under `Mailings > Write & Insert Fields > Rules`, click *If...Then...Else...*:

```
Rule Syntax:
IF { MERGEFIELD Performance_Rating } >= 4.5
   THEN "You have been awarded an annual performance bonus of ₹ 1,50,000."
   ELSE "We encourage you to review your quarterly targets with your manager."
```

*Advanced Rule Types*:
- *Ask... & Fill-in...*: Prompts the user for a manual input value once during generation (e.g., prompt for "Today's Dispatch Date").
- *Skip Record If...*: Automatically drops records matching a specific condition (e.g., `Skip Record If Balance_Due = 0` to avoid mailing paid-up customers).
- *Merge Record Number (`{ MERGEREC }`)*: Inserts sequential serial numbers on printed tickets or certificates.

#pagebreak()

== 9.5 Fixing Number, Date & Currency Formatting Switches (`\#`, `\@`)

A notorious bug in Word Mail Merge is that numbers formatted as `₹ 75,000.00` in Excel frequently import into Word as raw unformatted numbers like `75000` or `75000.00000000001`.

*The Professional Fix Using Dynamic Picture Switches*:
1. Select the merge field (e.g., `«Annual_CTC»`) and press `Shift + F9` to reveal the underlying field code:
   ```
   { MERGEFIELD Annual_CTC }
   ```
2. Manually append a formatting picture switch inside the brackets:
   - For Currency with Commas: `{ MERGEFIELD Annual_CTC \# "₹ #,##,##0.00" }`
   - For Dates (DD-MM-YYYY): `{ MERGEFIELD Joining_Date \@ "dddd, MMMM dd, yyyy" }`
   - For Zip Codes with Leading Zeros: `{ MERGEFIELD Pincode \# "000000" }`
3. Press `F9` to re-evaluate the field.
4. *Result*: The number formats flawlessly with Indian currency commas and exact decimals!

#v(2pt)
#concept-box(title: "CRITICAL KEYBOARD SHORTCUT: SHIFT + F9 vs ALT + F9", [
  - `Shift + F9`: Toggles the field code for the *single selected field*.
  - `Alt + F9`: Toggles field codes globally across the *entire document*. Pressing `Alt + F9` allows instant inspection of all merge switches at once.
])

#pagebreak()

== 9.6 Production Blueprint: Corporate Appointment Letter Merge Template

Below is the verified master template structure for an Enterprise Offer Letter:

```
RTECHLAB SYSTEMS PRIVATE LIMITED
Bangalore Core Technology Center · Karnataka 560100

Date: { DATE \@ "MMMM dd, yyyy" }

To,
{ MERGEFIELD Candidate_Name }
{ MERGEFIELD Address_Line_1 }
{ MERGEFIELD City }, { MERGEFIELD State } - { MERGEFIELD Pincode }

Subject: Formal Appointment Order for the position of { MERGEFIELD Job_Title }

Dear { MERGEFIELD Candidate_Name },

We are pleased to offer you the position of { MERGEFIELD Job_Title } in the 
{ MERGEFIELD Department } Division of RTechLab Systems. Your primary work location 
will be { MERGEFIELD Work_Location }, reporting on { MERGEFIELD Joining_Date \@ "dd-MM-yyyy" }.

Your annual Cost to Company (CTC) is finalized at { MERGEFIELD Annual_CTC \# "₹ #,##,##0" } 
({ MERGEFIELD CTC_In_Words }), payable in monthly installments as detailed in Annexure A.

{ IF { MERGEFIELD Relocation_Required } = "YES" "A relocation allowance of ₹ 50,000 will be credited with your first salary." "" }

Please sign the duplicate copy of this letter as confirmation of your acceptance.

Warm regards,
Rahul Patel
Founder & Chief Technology Architect, RTechLab
```

#v(2pt)

== 9.7 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which key combination toggles field codes for the active selected field?", ans: "Shift + F9.")
    #short-qa(num: 2, q: "Which switch formats an Excel merge number as currency with commas?", ans: "\\# \"₹ #,##,##0.00\".")
    #short-qa(num: 3, q: "Which Mail Merge rule skips sending letters to recipients with zero balance?", ans: "'Skip Record If...' rule.")
    #short-qa(num: 4, q: "Why must the Excel database file be closed before executing Mail Merge?", ans: "Word requires exclusive read access; open files trigger OLEDB lock conflicts.")
  ],
  [
    #mcq(num: 1, q: "What is the key shortcut to toggle ALL field codes in the entire document?", a: "Ctrl + F9", b: "Alt + F9", c: "Shift + F9", d: "F9", ans: "B", expl: "Alt + F9 globally switches between displaying field codes and field results.")
    #mcq(num: 2, q: "In a Mail Merge Excel spreadsheet, where must the column names be located?", a: "Row 5", b: "Anywhere in column A", c: "Strictly in Row 1", d: "In the footer", ans: "C", expl: "Row 1 must strictly contain clean column header identifiers.")
    #mcq(num: 3, q: "Which finish option generates a single master document containing all individual personalized letters?", a: "Print Documents", b: "Edit Individual Documents", c: "Send Email Messages", d: "Save As Template", ans: "B", expl: "Edit Individual Documents merges all records into one large editable file separated by Section Breaks.")
  ]
)

#v(2pt)

#spotlight-box("2027 CLOUD BULK DISPATCH AUTOMATION", [
  Word 365 integrates with Microsoft Power Automate and Outlook Graph APIs. Instead of sending emails sequentially from local desktop Outlook, Mail Merge jobs can be dispatched to Azure Cloud Workers, sending 25,000 personalized PDF invoices with digital signatures in under 3 minutes.
])
"""

    ch09_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 09]
= मेलिंग्स टैब: एंटरप्राइज मेल मर्ज इंजन एवं स्वचालित दस्तावेज़ प्रेषण

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  मेल मर्ज (Mail Merge) थोक वैयक्तिकरण (Bulk Personalization) का इंजन है। यह एक ही मास्टर पत्र, सैलरी स्लिप, प्रमाण पत्र अथवा कानूनी नोटिस को एक्सेल डेटाबेस के हजारों रिकॉर्ड्स से जोड़कर तुरंत अलग-अलग व्यक्तिगत दस्तावेज़ तैयार करता है। डेटा सोर्स जोड़ना, मर्ज फील्ड्स, कंडीशनल रूल्स और बैच डिस्पैच में दक्षता कार्यालय सहायकों, HR प्रबंधकों और विश्लेषकों हेतु अनिवार्य है।
]

#v(2pt)

== 9.1 मेल मर्ज आर्किटेक्चर एवं पाइपलाइन संरचना

मेल मर्ज दो भिन्न डिजिटल संपत्तियों को मिलाकर एक व्यक्तिगत आउटपुट स्ट्रीम तैयार करता है:

```
[मास्टर टेम्पलेट दस्तावेज़] (.docx)           [एंटरप्राइज एक्सेल डेटाबेस] (.xlsx)
स्थिर टेक्स्ट, कंपनी लोगो, हेडर, हस्ताक्षर     टेबल्स में संरचित रिकॉर्ड्स:
एवं «मर्ज फील्ड्स» धारण करता है               (उम्मीदवार_नाम, पद, वेतन, ईमेल, पता)
               │                                            │
               └──────────────────────┬─────────────────────┘
                                      ▼
                          [मेल मर्ज प्रोसेसिंग इंजन]
                          IF...THEN...ELSE शर्तों का मूल्यांकन
                          मुद्रा एवं दिनांक फॉर्मेटिंग स्विच लागू करना
                                      │
                     ┌────────────────┴────────────────┐
                     ▼                                 ▼
        [व्यक्तिगत दस्तावेज़ (.docx)]        [थोक आउटलुक ईमेल प्रेषण]
         हजारों अलग-अलग प्रिंट पेपर्स         हजारों व्यक्तिगत HTML/PDF ईमेल्स
```

#v(2pt)

== 9.2 सार्वभौमिक 6-चरणीय मेल मर्ज प्रोटोकॉल

वर्ड 365 में *Mailings Tab* अथवा विज़ार्ड (`Mailings > Start Mail Merge > Step-by-Step Mail Merge Wizard`) से कार्य किया जाता है:

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*पाइपलाइन चरण*], [*Mailings टैब पर की जाने वाली कार्रवाई*], [*कॉर्पोरेट गुणवत्ता नियंत्रण नियम*]),
  [1. दस्तावेज़ प्रकार चुनें], [`Start Mail Merge > Letters / Envelopes / Labels / Directory`], [नियुक्ति पत्र हेतु Letters; डाक लिफाफों हेतु Envelopes।],
  [2. प्राप्तकर्ता सूची जोड़ें], [`Select Recipients > Use an Existing List...`], [कंपनी की एक्सेल स्प्रेडशीट चुनें और सही वर्कशीट टैब निर्दिष्ट करें।],
  [3. प्राप्तकर्ता सूची फ़िल्टर करें], [`Edit Recipient List > Filter by State / CTC / Active Status`], [डुप्लिकेट कर्मचारियों को हटाएं और केवल सक्रिय कर्मियों को चुनें।],
  [4. मर्ज फील्ड्स जोड़ें], [`Write & Insert Fields > Insert Merge Field («नाम»)`], [दस्तावेज़ के पैराग्राफ में आवश्यक स्थानों पर फील्ड प्लेसहोल्डर्स डालें।],
  [5. परिणामों का पूर्वावलोकन], [`Preview Results > << < > >> तीरों से रिकॉर्ड्स जांचें`], [5-10 रिकॉर्ड्स देखकर जांचें कि नाम के आगे-पीछे स्पेस सही है या नहीं।],
  [6. मर्ज पूर्ण करें], [`Finish & Merge > Edit Individual Documents / Print / Send Email`], [सभी पेजों को मिलाकर एक मास्टर प्रिंट फाइल तैयार करें।]
)

#v(2pt)
#ribbon-specimen(path: "Mailings > Start Mail Merge > Select Recipients", command: "बाहरी एक्सेल डेटाबेस से कनेक्ट करना", shortcut: "Alt + M + R + E")

#pagebreak()

== 9.3 एक्सेल डेटा सोर्स तैयार करना एवं डेटा स्वच्छता

मेल मर्ज की 90% असफलताएं अव्यवस्थित एक्सेल फाइलों के कारण होती हैं। इन नियमों का कड़ाई से पालन करें:
1. *पंक्ति 1 में केवल कॉलम हेडर होने चाहिए*: हेडर के ऊपर कंपनी का नाम, खाली पंक्तियाँ अथवा मर्ज किए गए सेल कभी न रखें। सेल `A1` में `Candidate_Name`, `B1` में `Designation` होना चाहिए।
2. *पूरी शीट में कहीं भी सेल मर्ज (Merge) न हों*: मर्ज सेल डेटाबेस कनेक्टर को भ्रष्ट कर देते हैं जिससे वर्ड में फील्ड्स खाली आने लगते हैं।
3. *स्पष्ट डेटा फॉर्मेटिंग*: पिन कोड को Text फॉर्मेट (`00000`) में रखें ताकि शुरुआती शून्य न हटे (जैसे `01234` का `1234` न बने)।
4. *मर्ज करने से पूर्व एक्सेल फाइल बंद कर दें*: वर्ड को फाइल पर अनन्य (Exclusive) रीड एक्सेस चाहिए। यदि एक्सेल खुला रहेगा तो फाइल लॉक त्रुटि आएगी।

#v(2pt)
#ribbon-specimen(path: "Mailings > Start Mail Merge > Edit Recipient List", command: "डेटा को फ़िल्टर, सॉर्ट व डुप्लिकेट मुक्त करना", shortcut: "Alt + M + D")
#v(2pt)

== 9.4 सशर्त लॉजिक रूल्स: `IF...THEN...ELSE...` फील्ड मैकेनिक्स

कॉर्पोरेट पत्रों में उम्मीदवार के गुणों के आधार पर गतिशील वाक्य जोड़े जाते हैं (`Mailings > Rules > If...Then...Else...`):

```
सशर्त नियम सिंटैक्स:
IF { MERGEFIELD Performance_Rating } >= 4.5
   THEN "आपको ₹ 1,50,000 का वार्षिक परफॉर्मेंस बोनस प्रदान किया जाता है।"
   ELSE "आपको अपने त्रैमासिक लक्ष्यों की समीक्षा प्रबंधक के साथ करने की सलाह दी जाती है।"
```

*उन्नत नियम प्रकार*:
- *Ask... व Fill-in...*: मर्ज के समय उपयोगकर्ता से कोई मैन्युअल मान दर्ज करने को कहना (उदा. आज की डिस्पैच तिथि)।
- *Skip Record If...*: विशिष्ट शर्त पूरी होने पर पत्र न बनाना (उदा. `Skip Record If Balance = 0` ताकि चुकता ग्राहकों को तकादा पत्र न जाए)।
- *Merge Record Number (`{ MERGEREC }`)*: प्रिंट होने वाले प्रमाण पत्रों पर क्रम संख्या (Serial No.) छापना।

#pagebreak()

== 9.5 संख्या, तिथि एवं मुद्रा फॉर्मेटिंग सुधारना (`\#`, `\@` पिक्चर स्विच)

वर्ड मेल मर्ज की सबसे कुख्यात समस्या यह है कि एक्सेल में `₹ 75,000.00` दिखने वाली संख्या वर्ड में केवल `75000` या `75000.00000000001` के रूप में आयात हो जाती है।

*पिक्चर स्विच (Picture Switch) द्वारा पेशेवर समाधान*:
1. वर्ड में उस फील्ड (जैसे `«Annual_CTC»`) को चुनें और कीबोर्ड पर `Shift + F9` दबाएं जिससे फील्ड कोड दिखेगा:
   ```
   { MERGEFIELD Annual_CTC }
   ```
2. कोष्ठक के भीतर अंतिम भाग में मैन्युअल रूप से पिक्चर स्विच जोड़ें:
   - भारतीय मुद्रा व कॉमा हेतु: `{ MERGEFIELD Annual_CTC \# "₹ #,##,##0.00" }`
   - दिनांक (DD-MM-YYYY) हेतु: `{ MERGEFIELD Joining_Date \@ "dddd, MMMM dd, yyyy" }`
   - 6-अंकीय पिनकोड हेतु: `{ MERGEFIELD Pincode \# "000000" }`
3. पुनः `F9` की दबाकर फील्ड को सक्रिय कर दें।
4. *परिणाम*: संख्या तुरंत भारतीय मुद्रा के सटीक कॉमा और दशमलव के साथ प्रदर्शित होगी!

#v(2pt)
#concept-box(title: "महत्वपूर्ण कीबोर्ड शॉर्टकट: SHIFT + F9 बनाम ALT + F9", [
  - `Shift + F9`: केवल *चयनित एकल फील्ड* का कोड दिखाता अथवा छिपाता है।
  - `Alt + F9`: पूरे दस्तावेज़ के *सभी फील्ड कोड्स* को एक साथ दिखाता है। `Alt + F9` दबाकर आप पूरे पत्र के सभी स्विच एक नजर में देख सकते हैं।
])

#pagebreak()

== 9.6 प्रोडक्शन ब्लूप्रिंट: कॉर्पोरेट नियुक्ति पत्र मेल मर्ज टेम्पलेट

नीचे कॉर्पोरेट नियुक्ति पत्र हेतु सत्यापित मास्टर टेम्पलेट संरचना दी गई है:

```
RTECHLAB SYSTEMS PRIVATE LIMITED
बैंगलोर कोर टेक्नोलॉजी सेंटर · कर्नाटक 560100

दिनांक: { DATE \@ "dd MMMM, yyyy" }

सेवा में,
{ MERGEFIELD Candidate_Name }
{ MERGEFIELD Address_Line_1 }
{ MERGEFIELD City }, { MERGEFIELD State } - { MERGEFIELD Pincode }

विषय: { MERGEFIELD Job_Title } पद हेतु औपचारिक नियुक्ति पत्र

प्रिय { MERGEFIELD Candidate_Name },

हमें आपको RTechLab Systems के { MERGEFIELD Department } विभाग में 
{ MERGEFIELD Job_Title } के पद पर नियुक्त करते हुए अत्यंत हर्ष हो रहा है। 
आपकी कार्यस्थली { MERGEFIELD Work_Location } होगी और कार्यभार ग्रहण करने की 
तिथि { MERGEFIELD Joining_Date \@ "dd-MM-yyyy" } निर्धारित की गई है।

आपका वार्षिक वेतन (CTC) { MERGEFIELD Annual_CTC \# "₹ #,##,##0" } 
({ MERGEFIELD CTC_In_Words }) तय किया गया है, जिसका विस्तृत विवरण अनुलग्नक-ए में है।

{ IF { MERGEFIELD Relocation_Required } = "YES" "स्थानांतरण भत्ता के रूप में ₹ 50,000 आपके प्रथम माह के वेतन के साथ देय होगा।" "" }

कृपया इस पत्र की प्रतिलिपि पर हस्ताक्षर कर अपनी स्वीकृति प्रेषित करें।

सादर,
राहुल पटेल (Rahul Patel)
संस्थापक एवं मुख्य तकनीकी वास्तुकार, RTechLab
```

#v(2pt)

== 9.7 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "चयनित एकल फील्ड के कोड को देखने/छिपाने का शॉर्टकट क्या है?", ans: "Shift + F9.")
    #short-qa(num: 2, q: "एक्सेल से आए नंबर को मुद्रा और कॉमा में बदलने वाला स्विच क्या है?", ans: "\\# \"₹ #,##,##0.00\".")
    #short-qa(num: 3, q: "शून्य बकाया वाले ग्राहकों को पत्र न भेजने वाला नियम कौन सा है?", ans: "'Skip Record If...' नियम।")
    #short-qa(num: 4, q: "मेल मर्ज से पूर्व एक्सेल फाइल बंद करना क्यों आवश्यक है?", ans: "वर्ड को विशेष अनन्य रीड एक्सेस चाहिए; खुली फाइल कनेक्शन रोकती है।")
  ],
  [
    #mcq(num: 1, q: "पूरे दस्तावेज़ के सभी फील्ड कोड्स को एक साथ चालू/बंद करने का शॉर्टकट क्या है?", a: "Ctrl + F9", b: "Alt + F9", c: "Shift + F9", d: "F9", ans: "B", expl: "Alt + F9 पूरे दस्तावेज़ में कोड और परिणाम के बीच स्विच करता है।")
    #mcq(num: 2, q: "मेल मर्ज हेतु एक्सेल शीट में कॉलम शीर्षक कहाँ होने चाहिए?", a: "पंक्ति 5 में", b: "कॉलम A में", c: "अनिवार्य रूप से पंक्ति 1 में", d: "फुटर में", ans: "C", expl: "कॉलम हेडिंग्स अनिवार्य रूप से पहली पंक्ति में होनी चाहिए।")
    #mcq(num: 3, q: "सभी उम्मीदवारों के पत्रों को मिलाकर एक बड़ा संपादन योग्य दस्तावेज़ बनाने वाला विकल्प कौन सा है?", a: "Print Documents", b: "Edit Individual Documents", c: "Send Email Messages", d: "Save Template", ans: "B", expl: "Edit Individual Documents सभी रिकॉर्ड्स को सेक्शन ब्रेक से जोड़कर एक फाइल बनाता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 क्लाउड थोक प्रेषण ऑटोमेशन", [
  वर्ड 365 अब माइक्रोसॉफ्ट पावर ऑटोमेट और आउटलुक ग्राफ API से सीधे जुड़ा है। कंप्यूटर से एक-एक ईमेल भेजने के बजाय मेल मर्ज जॉब को अज़्योर क्लाउड पर भेजा जाता है, जहां 3 मिनट में डिजिटल हस्ताक्षर लगे 25,000 PDF बिल स्वतः ईमेल हो जाते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-09.typ"), "w", encoding="utf-8") as f:
        f.write(ch09_en)
    with open(os.path.join(hi_dir, "chapter-09.typ"), "w", encoding="utf-8") as f:
        f.write(ch09_hi)

    # =========================================================================
    # CHAPTER 10: Review, View & 5 Corporate Word Labs (4 Pages)
    # =========================================================================
    ch10_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 10]
= Review Tab, Document Governance & 5 Corporate Production Labs

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Enterprise document lifecycle management requires strict auditing governance, collaborative redlining, version comparison, and tamper-resistant password protection. This capstone chapter covers the Review Tab mechanisms and deploys 5 comprehensive real-world production labs.
]

#v(2pt)

== 10.1 Review Tab Architecture: Track Changes & Redline Auditing

Collaborative contract negotiation relies on Word's *Track Changes* engine (`Review > Tracking > Track Changes` or `Ctrl + Shift + E`):

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Tracking Lever*], [*Operational Mechanics & Scope*], [*Enterprise Collaboration Role*]),
  [Track Changes (`Ctrl + Shift + E`)], [Logs all character insertions, deletions, and formatting edits.], [M&A contract negotiation between opposing corporate legal teams.],
  [Display for Review], [Simple Markup (red bar in margin), All Markup, No Markup, Original.], [Simple Markup provides clean reading while keeping edits tracked.],
  [Reviewing Pane], [Vertical or horizontal sidebar tallying all revisions, authors & times.], [Comprehensive executive audit of legal counter-proposals.],
  [Accept / Reject Engine], [Accept/Reject current change, or Accept All Changes in Document.], [Finalizing clean copy before executive signature and distribution.],
  [Compare Documents], [Compares two separate versions of a `.docx` file into a redline delta.], [Detecting sneaky unauthorized edits made without Track Changes enabled.]
)

#v(2pt)
#ribbon-specimen(path: "Review > Compare > Compare Documents", command: "Algorithmic Legal Redline Delta Comparison", shortcut: "Alt + R + M + C")
#v(2pt)

== 10.2 Restrict Editing & Enterprise Document Protection

Under `Review > Protect > Restrict Editing`, administrators enforce security boundaries:
1. *Formatting Restrictions*: Restricts document styling to a pre-approved corporate Style Set, preventing rogue fonts.
2. *Editing Restrictions*:
   - *No changes (Read only)*: Entire document is locked against all edits.
   - *Filling in forms*: Protects all document text, allowing users to interact *only with form fields and dropdowns*.
   - *Comments only*: Users can read and attach comment bubbles but cannot alter a single character of body text.
   - *Tracked changes*: Forces Track Changes permanently on; users cannot make edits without logging their identity.
3. *Start Enforcement*: Protect with an AES-256 password to lock the administrative settings.

#pagebreak()

== 10.3 Corporate Production Lab 1: Executive Annual Business Report

#block(
  stroke: 0.5pt + rgb("#0284C7"),
  fill: rgb("#F0F9FF"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#0284C7"))[LAB 1: ANNUAL STRATEGIC REPORT BLUEPRINT (30-PAGE ENTERPRISE SPEC)]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Build an audited 30-page annual shareholder report incorporating multi-tier pagination, corporate styles, and automated indexing.\
      *Execution Sequence*:
      1. *Page 1 (Cover Page)*: Insert `Insert > Pages > Cover Page` (Facet style). Tag Company: RTechLab Systems; Title: Annual Report 2027. Set `Different First Page` to eliminate headers/footers.
      2. *Page 2 (Executive Summary)*: Apply `Heading 1` (Aptos Display 20pt Bold `#0F172A`). Line spacing 1.15, Spacing After 8pt.
      3. *Page 3 (Table of Contents)*: Insert `Layout > Breaks > Section Break (Next Page)`. Insert `References > Table of Contents > Automatic Table 1`.
      4. *Header/Footer Partitioning*: In Section 2 (Pages 2-3), format footers as Roman numerals (i, ii) starting at i.
      5. *Page 4 (Chapter 1)*: Insert `Layout > Breaks > Section Break (Next Page)`. Double-click footer, click *Link to Previous* to *Turn Off*. Format page numbers as Arabic (1, 2, 3) starting at 1.
      6. *Dynamic Running Header*: In Section 3 header, insert `{ STYLEREF "Heading 1" }` on right, separated by a 0.5pt rule.
      7. *Final Build*: Press `Ctrl + A` and tap `F9` to synchronize all page counts. Export to PDF via `File > Export`.
    ]
  ]
)

#v(2pt)

== 10.4 Corporate Production Lab 2: Modern ATS-Optimized Professional Resume

#block(
  stroke: 0.5pt + rgb("#059669"),
  fill: rgb("#ECFDF5"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#059669"))[LAB 2: ATS-COMPLIANT EXECUTIVE RESUME / CV SPECIFICATION]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Create a high-converting, ATS (Applicant Tracking System) compliant resume with zero formatting bleed.\
      *Execution Sequence*:
      1. *Canvas Geometry*: `Layout > Margins > Narrow` (0.5" Top, Bottom, Left, Right). Single-column layout (multi-column layouts fail OCR parsers).
      2. *Header Block*: Name in `Heading 1` (22pt Bold). Contact strip beneath using tab leaders: Phone | Email | LinkedIn | Bangalore, India.
      3. *Structural Sections*: Section titles (Summary, Technical Skills, Professional Experience, Education) tagged strictly with `Heading 2` (12pt Bold, `#0F172A` with 0.75pt bottom border rule).
      4. *Core Experience Matrix*: Clean table without vertical borders (`Borders > Inside Horizontal Border only`). Left column: Company & Title; Right column (Right-aligned): Dates & Location.
      5. *Bullet Deliverables*: Apply `List Bullet` with strong action verbs (Engineered, Architected, Reduced).
      6. *ATS Pre-Flight Audit*: Save as `.docx` and test text extraction in Notepad to confirm zero character scrambling.
    ]
  ]
)

#pagebreak()

== 10.5 Corporate Production Lab 3: Bulk Employee Offer Letters via Mail Merge

#block(
  stroke: 0.5pt + rgb("#D97706"),
  fill: rgb("#FFFBEB"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#D97706"))[LAB 3: BULK HR APPOINTMENT DISPATCH INTEGRATION]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Merge 250 appointment letters from an Excel candidate database with custom CTC and relocation logic.\
      *Execution Sequence*:
      1. *Data Source Setup*: Create `candidates.xlsx` with headers `Candidate_Name`, `Address`, `City`, `CTC`, `Joining_Date`, `Relocation`. Save and close Excel.
      2. *Connect Source*: In Word master template, go to `Mailings > Select Recipients > Use an Existing List` and select `candidates.xlsx`.
      3. *Insert Placeholders*: Insert `«Candidate_Name»`, `«City»`, and `«Joining_Date»`.
      4. *Apply Picture Switches*: Select `«CTC»`, press `Shift + F9`, and edit to `{ MERGEFIELD CTC \# "₹ #,##,##0" }`. Edit joining date to `{ MERGEFIELD Joining_Date \@ "dd-MM-yyyy" }`.
      5. *Conditional Relocation Clause*: Click `Mailings > Rules > If...Then...Else...`. Set: IF `Relocation` = `"YES"`, THEN "A relocation grant of ₹ 50,000 is authorized.", ELSE "".
      6. *Preview & Batch Dispatch*: Navigate 5 records. Click `Finish & Merge > Edit Individual Documents > All`. Save compiled 250-page print run.
    ]
  ]
)

#v(2pt)

== 10.6 Corporate Production Lab 4: Legal Non-Disclosure Agreement (NDA) with Form Locking

#block(
  stroke: 0.5pt + rgb("#7C3AED"),
  fill: rgb("#FAF5FF"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#7C3AED"))[LAB 4: TAMPER-PROOF LEGAL NDA WITH RESTRICTED FORM FIELDS]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Author a commercial Non-Disclosure Agreement where counter-parties can only enter their corporate name and signature date.\
      *Execution Sequence*:
      1. *Enable Developer Tab*: `File > Options > Customize Ribbon > Check 'Developer'`.
      2. *Insert Content Controls*: Under `Developer > Controls`, insert a *Plain Text Content Control* for `[Vendor Corporate Name]` and a *Date Picker Content Control* for `[Agreement Effective Date]`.
      3. *Properties Lock*: Select the content control, click *Properties*, and check *Content control cannot be deleted*.
      4. *Enforce Document Locking*: Go to `Review > Protect > Restrict Editing`. Check *Allow only this type of editing in the document* and select *Filling in forms*.
      5. *Activate Password*: Click *Yes, Start Enforcing Protection*. Set administrative master password.
      6. *Verification*: Attempt to edit legal clauses; Word blocks all keystrokes while allowing smooth form input!
    ]
  ]
)

#pagebreak()

== 10.7 Corporate Production Lab 5: Professional Certificate of Achievement

#block(
  stroke: 0.5pt + rgb("#059669"),
  fill: rgb("#F0FDF4"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#059669"))[LAB 5: HIGH-SECURITY CORPORATE CERTIFICATE DESIGN]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Design an executive Certificate of Achievement with vector borders, seal watermark, and Mail Merge recipient binding.\
      *Execution Sequence*:
      1. *Orientation & Geometry*: `Layout > Orientation > Landscape`. Margins: 0.75" on all four sides.
      2. *Architectural Border*: `Design > Page Borders`. Choose Art or Triple-line rule (3pt weight, `#0F172A` Navy with `#0284C7` inner border).
      3. *Corporate Header*: Insert company logo centered. Text: "RTECHLAB SYSTEMS LAB" in 14pt Aptos Display tracking 3pt.
      4. *Certificate Title*: "CERTIFICATE OF ACHIEVEMENT" in 28pt Bold `#0F172A`. Subtitle: "PROUDLY PRESENTED TO".
      5. *Merge Name Holder*: Insert `«Student_Name»` in 24pt Georgia Bold with subtle bottom underline.
      6. *Verification Seal*: Insert circular gold seal SVG (`Wrap Text > Behind Text`).
      7. *Digital Signature Strip*: Dual signature blocks at bottom: Left (Technical Director), Right (Chief Architect Rahul Patel).
    ]
  ]
)

#v(2pt)

== 10.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which key combination toggles Track Changes mode on/off instantly?", ans: "Ctrl + Shift + E.")
    #short-qa(num: 2, q: "Which restriction mode locks body text while permitting form field entry?", ans: "'Filling in forms' restriction mode.")
    #short-qa(num: 3, q: "Which tool algorithmically compares two documents to reveal unrecorded edits?", ans: "Review > Compare > Compare Documents.")
    #short-qa(num: 4, q: "Which tab houses Content Controls for interactive date pickers?", ans: "Developer Tab.")
  ],
  [
    #mcq(num: 1, q: "What is the primary technical reason ATS resume screeners reject multi-column resumes?", a: "Too colorful", b: "OCR text parsing engines read across columns horizontally, scrambling employment history", c: "File size is too small", d: "Word crashes", ans: "B", expl: "Applicant Tracking Systems parse text left-to-right, garbling parallel column text.")
    #mcq(num: 2, q: "In Track Changes, which display mode hides redline markups while keeping edits active?", a: "All Markup", b: "Original", c: "Simple Markup", d: "No Markup", ans: "C", expl: "Simple Markup shows a clean draft with red margin indicators where edits occurred.")
    #mcq(num: 3, q: "To allow third parties to fill in date pickers but prevent text alteration, which tool is used?", a: "Inspect Document", b: "Restrict Editing > Filling in forms", c: "Split Window", d: "Drop Cap", ans: "B", expl: "'Filling in forms' locks all canvas regions except designated form content controls.")
  ]
)

#v(2pt)

#spotlight-box("2027 AUTOMATED CONTRACT COMPLIANCE AUDITING", [
  Word 365 Copilot AI automates legal contract redlining. By prompting "Review this vendor NDA against our standard corporate risk playbook", Copilot identifies missing indemnification clauses, highlights unfavorable liability caps, and generates pre-tracked counter-amendments ready for legal counsel review.
])
"""

    ch10_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 10]
= रिव्यू टैब, दस्तावेज़ प्रशासन एवं 5 कॉर्पोरेट प्रोडक्शन लैब्स

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  कॉर्पोरेट दस्तावेज़ प्रबंधन हेतु सख्त ऑडिटिंग, सहयोगात्मक समीक्षा (Redlining), संस्करण तुलना और पासवर्ड सुरक्षा अनिवार्य है। यह समापन अध्याय रिव्यू टैब मैकेनिक्स का विश्लेषण करता है तथा 5 विस्तृत कॉर्पोरेट प्रोडक्शन लैब्स प्रस्तुत करता है।
]

#v(2pt)

== 10.1 रिव्यू टैब आर्किटेक्चर: ट्रैक चेंजेस एवं ऑडिटिंग

अनुबंधों की सहयोगात्मक समीक्षा वर्ड के *Track Changes* इंजन (`Review > Tracking > Track Changes` अथवा `Ctrl + Shift + E`) पर निर्भर करती है:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*ट्रैकिंग टूल*], [*कार्यप्रणाली एवं दायरा*], [*कॉर्पोरेट समीक्षा में भूमिका*]),
  [Track Changes (`Ctrl + Shift + E`)], [दस्तावेज़ में जोड़े गए, हटाए गए अथवा फॉर्मेट किए गए प्रत्येक अक्षर को रिकॉर्ड करता है।], [दो कंपनियों की कानूनी टीमों के बीच अनुबंध की शर्तों पर विचार-विमर्श।],
  [Display for Review], [Simple Markup (मार्जिन में लाल रेखा), All Markup, No Markup, Original।], [Simple Markup संपादन को चालू रखते हुए पढ़ने में बाधा नहीं डालता।],
  [Reviewing Pane], [सभी संपादनों, संपादकों के नाम व समय की विस्तृत ऊर्ध्वाधर अथवा क्षैतिज सूची।], [विधिक प्रति-प्रस्तावों का विस्तृत कार्यकारी ऑडिट।],
  [Accept / Reject Engine], [वर्तमान बदलाव को स्वीकार/अस्वीकार करना अथवा सभी को एक साथ लागू करना।], [हस्ताक्षर से पूर्व अंतिम स्वच्छ दस्तावेज़ तैयार करना।],
  [Compare Documents], [दो अलग-अलग फाइलों की तुलना करके बिना ट्रैक किए गए बदलावों को पकड़ना।], [चोरी-छिपे किए गए अनधिकृत संशोधनों को तुरंत पहचानना।]
)

#v(2pt)
#ribbon-specimen(path: "Review > Compare > Compare Documents", command: "दो दस्तावेज़ों की कानूनी तुलना व अंतर खोजना", shortcut: "Alt + R + M + C")
#v(2pt)

== 10.2 रेस्ट्रेक्ट एडिटिंग एवं एंटरप्राइज दस्तावेज़ सुरक्षा

`Review > Protect > Restrict Editing` के अंतर्गत सुरक्षा सीमाएं लागू की जाती हैं:
1. *फॉर्मेटिंग प्रतिबंध (Formatting Restrictions)*: केवल कंपनी-अनुमोदित स्टाइल्स के प्रयोग की अनुमति देना ताकि अनाधिकृत फॉन्ट न लगें।
2. *संपादन प्रतिबंध (Editing Restrictions)*:
   - *No changes (Read only)*: पूरे दस्तावेज़ को पूर्णतः लॉक करना (कोई बदलाव संभव नहीं)।
   - *Filling in forms*: पूरे दस्तावेज़ को लॉक करके उपयोगकर्ताओं को *केवल फॉर्म फील्ड्स और ड्रॉपडाउन भरने की अनुमति देना*।
   - *Comments only*: केवल टिप्पणी (Comment) जोड़ने की अनुमति; मुख्य सामग्री नहीं बदली जा सकती।
   - *Tracked changes*: ट्रैक चेंजेस को स्थायी रूप से ऑन करना ताकि कोई भी बिना अपनी पहचान दर्ज किए संपादन न कर सके।
3. *Start Enforcement*: सेटिंग्स को सुरक्षित करने हेतु AES-256 पासवर्ड दर्ज करें।

#pagebreak()

== 10.3 कॉर्पोरेट प्रोडक्शन लैब 1: कार्यकारी वार्षिक व्यावसायिक रिपोर्ट

#block(
  stroke: 0.5pt + rgb("#0284C7"),
  fill: rgb("#F0F9FF"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#0284C7"))[लैब 1: वार्षिक रणनीतिक रिपोर्ट ब्लूप्रिंट (30-पेज कॉर्पोरेट मानक)]\
    #v(1pt)
    #text(size: 7.2pt)[
      *उद्देश्य*: बहु-स्तरीय पेज नंबरिंग, स्टाइल्स और स्वचालित अनुक्रमणिका युक्त 30-पेज की वार्षिक रिपोर्ट तैयार करना।\
      *कार्यवाही अनुक्रम*:
      1. *पेज 1 (कवर पेज)*: `Insert > Pages > Cover Page` (Facet) लगाएं। शीर्षक: RTechLab Systems Annual Report 2027। `Different First Page` चालू करें।
      2. *पेज 2 (कार्यकारी सारांश)*: `Heading 1` (Aptos Display 20pt Bold `#0F172A`) लागू करें। लाइन स्पेसिंग 1.15, Spacing After 8pt रखें।
      3. *पेज 3 (अनुक्रमणिका)*: `Layout > Breaks > Section Break (Next Page)` लगाएं। `References > Table of Contents > Automatic Table 1` जोड़ें।
      4. *हेडर/फुटर विभाजन*: सेक्शन 2 (पेज 2-3) के फुटर में रोमन संख्या (i, ii) लगाएं जो i से शुरू हो।
      5. *पेज 4 (अध्याय 1)*: `Layout > Breaks > Section Break (Next Page)` लगाएं। फुटर पर डबल-क्लिक करके *Link to Previous* को *बंद करें*। पेज नंबरिंग को अरेबिक (1, 2, 3) पर 1 से रीसेट करें।
      6. *डायनामिक रनिंग हेडर*: सेक्शन 3 के हेडर में `{ STYLEREF "Heading 1" }` फील्ड जोड़ें।
      7. *अंतिम सिंक*: `Ctrl + A` दबाकर `F9` से सभी पेज नंबर अपडेट करें और PDF एक्सपोर्ट करें।
    ]
  ]
)

#v(2pt)

== 10.4 कॉर्पोरेट प्रोडक्शन लैब 2: आधुनिक ATS-अनुकूलित पेशेवर रिज्यूमे

#block(
  stroke: 0.5pt + rgb("#059669"),
  fill: rgb("#ECFDF5"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#059669"))[लैब 2: ATS-कम्प्लायंट एग्जीक्यूटिव रिज्यूमे / CV स्पेसिफिकेशन]\
    #v(1pt)
    #text(size: 7.2pt)[
      *उद्देश्य*: उच्च सफलता दर वाला, ATS (आवेदक ट्रैकिंग सिस्टम) अनुकूलित रिज्यूमे बनाना जो रोबोटिक सॉफ्टवेयर द्वारा सरलता से पढ़ा जा सके।\
      *कार्यवाही अनुक्रम*:
      1. *कैनवास लेआउट*: `Layout > Margins > Narrow` (चारों तरफ 0.5 इंच)। एकल-कॉलम लेआउट रखें (मल्टी-कॉलम ATS सॉफ्टवेयर में फेल हो जाते हैं)।
      2. *हेडर ब्लॉक*: नाम `Heading 1` (22pt Bold) में। नीचे संपर्क पट्टी: मोबाइल | ईमेल | लिंक्डइन | बैंगलोर, भारत।
      3. *संरचनात्मक अनुभाग*: अनुभाग शीर्षक (सारांश, तकनीकी कौशल, कार्य अनुभव, शिक्षा) अनिवार्य रूप से `Heading 2` (12pt Bold, `#0F172A` व 0.75pt निचली लाइन) से टैग करें।
      4. *अनुभव मैट्रिक्स*: बिना वर्टिकल लाइन वाली टेबल (`Borders > Inside Horizontal Border only`)। बायां कॉलम: कंपनी व पद; दायां कॉलम: अवधि व स्थान।
      5. *बुलेट उपलब्धियां*: क्रियात्मक शब्दों (Engineered, Architected, Managed) के साथ बुलेट लिस्ट लगाएं।
      6. *ATS ऑडिट*: फाइल को `.docx` सेव करें और नोटपैड में टेक्स्ट निकाल कर जांचें कि कोई शब्द इधर-उधर तो नहीं हुआ।
    ]
  ]
)

#pagebreak()

== 10.5 कॉर्पोरेट प्रोडक्शन लैब 3: मेल मर्ज द्वारा थोक नियुक्ति पत्र प्रेषण

#block(
  stroke: 0.5pt + rgb("#D97706"),
  fill: rgb("#FFFBEB"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#D97706"))[लैब 3: बल्क HR नियुक्ति पत्र प्रेषण इंटीग्रेशन]\
    #v(1pt)
    #text(size: 7.2pt)[
      *उद्देश्य*: एक्सेल उम्मीदवार डेटाबेस से 250 नियुक्ति पत्रों को कस्टम वेतन व शर्तों के साथ स्वतः तैयार करना।\
      *कार्यवाही अनुक्रम*:
      1. *डेटाबेस निर्माण*: `candidates.xlsx` फाइल बनाएं जिसमें हेडर `Candidate_Name`, `Address`, `City`, `CTC`, `Joining_Date`, `Relocation` हों। एक्सेल बंद करें।
      2. *सोर्स जोड़ना*: वर्ड मास्टर लेटर में जाकर `Mailings > Select Recipients > Use an Existing List` से `candidates.xlsx` चुनें।
      3. *प्लेसहोल्डर्स जोड़ना*: पत्र में `«Candidate_Name»`, `«City»`, और `«Joining_Date»` जोड़ें।
      4. *फॉर्मेटिंग स्विच लगाना*: `«CTC»` को चुनकर `Shift + F9` दबाएं और `{ MERGEFIELD CTC \# "₹ #,##,##0" }` लिखें।
      5. *सशर्त स्थानांतरण भत्ता*: `Mailings > Rules > If...Then...Else...` से शर्त लगाएं: यदि `Relocation` = `"YES"`, तो "स्थानांतरण अनुदान के रूप में ₹ 50,000 स्वीकृत है।" जोड़ें।
      6. *पूर्वावलोकन व मर्ज*: 5 रिकॉर्ड्स जांचें। `Finish & Merge > Edit Individual Documents > All` चुनकर 250-पेज की प्रिंट फाइल सेव करें।
    ]
  ]
)

#v(2pt)

== 10.6 कॉर्पोरेट प्रोडक्शन लैब 4: कानूनी गैर-प्रकटीकरण अनुबंध (NDA) एवं फॉर्म लॉकिंग

#block(
  stroke: 0.5pt + rgb("#7C3AED"),
  fill: rgb("#FAF5FF"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#7C3AED"))[लैब 4: छेड़छाड़-मुक्त कानूनी NDA एवं फॉर्म फील्ड्स लॉकिंग]\
    #v(1pt)
    #text(size: 7.2pt)[
      *उद्देश्य*: ऐसा कानूनी अनुबंध तैयार करना जिसमें दूसरा पक्ष कानूनी शर्तों को बदले बिना केवल अपनी कंपनी का नाम और दिनांक भर सके।\
      *कार्यवाही अनुक्रम*:
      1. *डेवलपर टैब चालू करें*: `File > Options > Customize Ribbon > 'Developer'` को चेक करें।
      2. *कंटेंट कंट्रोल्स जोड़ना*: `Developer > Controls` में जाकर वेंडर नाम हेतु *Plain Text Content Control* तथा दिनांक हेतु *Date Picker* जोड़ें।
      3. *सुरक्षा लॉक*: कंट्रोल की Properties में जाकर *Content control cannot be deleted* चेक करें।
      4. *संपादन प्रतिबंध लगाना*: `Review > Protect > Restrict Editing` में जाएं। *Allow only this type of editing* चेक करके *Filling in forms* चुनें।
      5. *पासवर्ड सक्रियण*: *Yes, Start Enforcing Protection* पर क्लिक करके मास्टर पासवर्ड सेट करें।
      6. *सत्यापन*: अनुबंध की शर्तों को एडिट करने का प्रयास करें; वर्ड कीस्ट्रोक्स ब्लॉक करेगा जबकि फॉर्म फील्ड्स में सामान्य टाइपिंग होगी!
    ]
  ]
)

#pagebreak()

== 10.7 कॉर्पोरेट प्रोडक्शन लैब 5: व्यावसायिक उपलब्धि प्रमाण पत्र

#block(
  stroke: 0.5pt + rgb("#059669"),
  fill: rgb("#F0FDF4"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#059669"))[लैब 5: उच्च-सुरक्षा कॉर्पोरेट प्रमाण पत्र डिजाइन]\
    #v(1pt)
    #text(size: 7.2pt)[
      *उद्देश्य*: वेक्टर बॉर्डर्स, सील वॉटरमार्क और मेल मर्ज से जुड़ा कार्यकारी उपलब्धि प्रमाण पत्र डिजाइन करना।\
      *कार्यवाही अनुक्रम*:
      1. *ओरिएंटेशन व मार्जिन*: `Layout > Orientation > Landscape`। चारों ओर 0.75 इंच मार्जिन रखें।
      2. *सुरुचिपूर्ण बॉर्डर*: `Design > Page Borders` में जाकर ट्रिपल-लाइन 3pt बॉर्डर (`#0F172A` नेवी व `#0284C7` स्यान) लगाएं।
      3. *शीर्ष हेडर*: कंपनी का लोगो केंद्र में लगाएं। टेक्स्ट: "RTECHLAB SYSTEMS LAB" (14pt Aptos Display, ट्रैकिंग 3pt)।
      4. *प्रमाण पत्र शीर्षक*: "CERTIFICATE OF ACHIEVEMENT" (28pt Bold `#0F172A`)। सबटाइटल: "गौरवपूर्वक प्रदान किया जाता है"।
      5. *मर्ज नाम होल्डर*: `«Student_Name»` को 24pt Georgia Bold में रेखांकित शैली में जोड़ें।
      6. *सुरक्षा सील*: पारदर्शी गोल्ड सील SVG इन्सर्ट करें (`Wrap Text > Behind Text`)।
      7. *डिजिटल हस्ताक्षर पट्टी*: नीचे दो हस्ताक्षर ब्लॉक: बाएँ (तकनीकी निदेशक), दाएँ (मुख्य तकनीकी वास्तुकार राहुल पटेल)।
    ]
  ]
)

#v(2pt)

== 10.8 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "ट्रैक चेंजेस मोड को तत्काल ऑन/ऑफ करने का शॉर्टकट क्या है?", ans: "Ctrl + Shift + E.")
    #short-qa(num: 2, q: "मुख्य टेक्स्ट लॉक रखकर केवल फॉर्म फील्ड्स भरने की अनुमति देने वाला मोड कौन सा है?", ans: "'Filling in forms' प्रतिबंध मोड।")
    #short-qa(num: 3, q: "दो अलग-अलग फाइलों की तुलना करके अनधिकृत बदलाव खोजने वाला टूल कौन सा है?", ans: "Review > Compare > Compare Documents.")
    #short-qa(num: 4, q: "इंटरएक्टिव डेट पिकर व फॉर्म कंट्रोल्स किस रिबन टैब पर होते हैं?", ans: "Developer Tab.")
  ],
  [
    #mcq(num: 1, q: "ATS सॉफ्टवेयर द्वारा बहु-कॉलम वाले रिज्यूमे को रिजेक्ट करने का मुख्य तकनीकी कारण क्या है?", a: "रंग अधिक होना", b: "OCR इंजन कॉलमों में क्षैतिज रूप से पढ़कर कार्य इतिहास को मिला देता है", c: "फाइल साइज छोटा होना", d: "वर्ड क्रैश होना", ans: "B", expl: "आवेदक ट्रैकिंग सिस्टम बाएं से दाएं पढ़ते हैं जिससे समानांतर कॉलमों का टेक्स्ट आपस में उलझ जाता है।")
    #mcq(num: 2, q: "ट्रैक चेंजेस में लाल रेखाओं को छुपाकर केवल स्वच्छ संपादन देखने वाला व्यू मोड कौन सा है?", a: "All Markup", b: "Original", c: "Simple Markup", d: "No Markup", ans: "C", expl: "Simple Markup मार्जिन में केवल लाल संकेत पट्टी दिखाता है और मुख्य टेक्स्ट स्वच्छ रखता है।")
    #mcq(num: 3, q: "दस्तावेज़ की सामग्री को सुरक्षित रखते हुए उपयोगकर्ताओं से केवल फॉर्म भरवाने का तरीका क्या है?", a: "Inspect Document", b: "Restrict Editing > Filling in forms", c: "Split Window", d: "Drop Cap", ans: "B", expl: "'Filling in forms' फॉर्म कंट्रोल्स के अतिरिक्त सभी कैनवास क्षेत्रों को लॉक कर देता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 AI अनुबंध अनुपालन ऑडिटिंग", [
  वर्ड 365 कोपायलट AI अनुबंधों की समीक्षा को पूरी तरह स्वचालित करता है। "हमारी मानक कॉर्पोरेट नीतियों के अनुसार इस NDA की समीक्षा करें" प्रॉम्प्ट देने पर कोपायलट अनुपस्थित क्षतिपूर्ति धाराओं को चिह्नित करता है और पूर्व-ट्रैक किए गए प्रति-संशोधन प्रस्तुत करता है।
])
"""

    with open(os.path.join(eng_dir, "chapter-10.typ"), "w", encoding="utf-8") as f:
        f.write(ch10_en)
    with open(os.path.join(hi_dir, "chapter-10.typ"), "w", encoding="utf-8") as f:
        f.write(ch10_hi)

    print("Word Chapters 06 to 10 (17 Pages total) generated successfully in English and Hindi.")

if __name__ == "__main__":
    generate_chapters("DIGITAL/OFFICE_365/07_SOURCE_FILES")
