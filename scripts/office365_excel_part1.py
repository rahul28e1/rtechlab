#!/usr/bin/env python3
# =============================================================================
# RTechLab Office 365 Publishing Engine — Excel Mastery (Chapters 11 to 16)
# Covers: Grid Architecture, Data Entry, Math, Conditional Aggregations,
#         Logical Decisions, Dynamic Arrays & XLOOKUP
# Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
# =============================================================================

import os

def generate_chapters(base_dir):
    eng_dir = os.path.join(base_dir, "English")
    hi_dir = os.path.join(base_dir, "Hindi")
    os.makedirs(eng_dir, exist_ok=True)
    os.makedirs(hi_dir, exist_ok=True)

    # =========================================================================
    # CHAPTER 11: Excel 365 Grid Architecture & Cell References (3 Pages)
    # =========================================================================
    ch11_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 11]
= Excel 365 Grid Architecture, Cell References & Name Manager

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Microsoft Excel 365 is the computational nervous system of global commerce. From corporate financial models and tax reconciliation to inventory supply chains, enterprise productivity hinges on mastering grid coordinates, mathematical reference locking, and semantic Name Manager architecture.
]

#v(2pt)

== 11.1 The Excel 365 Calculation Grid Anatomy

An Excel worksheet is an immense two-dimensional computational matrix comprising exactly 17,179,869,184 individual addressable cells:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Grid Component*], [*Structural Dimension & Boundaries*], [*Enterprise Navigation Shortcut*]),
  [Rows], [1 to 1,048,576 rows (Numbered vertically)], [`Ctrl + Down Arrow` (Jump to row 1,048,576)],
  [Columns], [1 to 16,384 columns (A through XFD)], [`Ctrl + Right Arrow` (Jump to column XFD)],
  [Active Cell], [Intersection of column letter and row number (e.g., C14)], [`Ctrl + Home` (Return instantly to cell A1)],
  [Name Box], [Displays active cell coordinates or assigned semantic name], [`Ctrl + F3` (Launch Name Manager console)],
  [Formula Bar], [Displays underlying mathematical formula or constant value], [`Ctrl + Shift + U` (Expand / Collapse Formula Bar)],
  [Worksheet Tabs], [Individual workbook canvas sheets (default: Sheet1)], [`Ctrl + PageDown / PageUp` (Switch active sheets)]
)

#v(2pt)
#formula-specimen(title: "GRID CELL ADDRESSING CONVENTION", formula: "=ColumnLetter & RowNumber (e.g. C14 = Column C, Row 14)", note: "Coordinates establish positional vectors for computational formula parsing.")
#v(2pt)

== 11.2 The 4 Cell Referencing Modes: Relative, Absolute & Mixed

The foundation of spreadsheet modeling is understanding how cell addresses transform when copied or dragged across cells:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Reference Type*], [*Syntax*], [*Behavior When Copied / Filled*], [*Enterprise Production Use Case*]),
  [Relative], [`A1`], [Both column and row shift dynamically based on distance.], [Multiplying Item Qty by Unit Price in adjacent rows.],
  [Absolute], [`$A$1`], [Both column and row are strictly locked with dollar signs.], [Referencing static GST Tax Rate (18%) in cell G1.],
  [Mixed (Row Locked)], [`A$1`], [Column shifts freely; row 1 remains permanently locked.], [Multiplication table headers; horizontal rate schedules.],
  [Mixed (Col Locked)], [`$A1`], [Column A is permanently locked; row shifts dynamically.], [Multi-year financial models referencing Item Name in Col A.]
)

#concept-box(title: "CRITICAL PRODUCTIVITY LEVER: THE F4 TOGGLE KEY", [
  While writing a formula, highlight any cell reference and tap the `F4` key repeatedly. Excel cycles dynamically: `A1` -> `$A$1` (Absolute) -> `A$1` (Row locked) -> `$A1` (Column locked) -> `A1` (Relative), saving thousands of manual typing clicks.
])

#pagebreak()

== 11.3 Enterprise Name Manager Architecture

Hardcoding obscure cell coordinates like `=B4 * $G$1` creates maintenance debt in corporate models. The *Name Manager* (`Formulas > Defined Names > Name Manager` or `Ctrl + F3`) replaces cryptic coordinates with readable business variables:

```
Amateur Formula:   =B4 * \$G\$1
Enterprise Formula: =Sales_Units * GST_Tax_Rate
```

*Rules for Creating Enterprise Defined Names*:
1. Names must begin with a letter or underscore (`_`). Never begin with a number or mathematical symbol.
2. Spaces are strictly prohibited; use CamelCase (`AnnualRevenue`) or snake_case (`Tax_Rate_2027`).
3. Names cannot collide with valid cell addresses (e.g., naming a variable `C100` triggers a fatal naming conflict).
4. *Scope Management*: Define scope at the *Workbook* level for universal variables, or *Worksheet* level for recurring monthly tabs.

#v(2pt)
#ribbon-specimen(path: "Formulas > Defined Names > Define Name", command: "Create Semantic Variable Identifier", shortcut: "Ctrl + Alt + F3")
#v(2pt)

== 11.4 Generating Bulk Named Ranges from Selection (`Ctrl + Shift + F3`)

When building financial tables with 20 columns, manually naming each column takes hours. Excel provides an automated bulk naming generator:
1. Highlight the entire data table including the top header row and leftmost column.
2. Press `Ctrl + Shift + F3` (or click `Formulas > Defined Names > Create from Selection`).
3. Check *Top row* (and *Left column* if dual-indexing).
4. Click *OK*. Excel automatically scans header text, converts spaces to underscores, and creates 20 named ranges bound to their respective column vectors in 1 millisecond!

#pagebreak()

== 11.5 Production Blueprint: Two-Way Multiplication Matrix Model

Below is the mathematical architecture of a two-way sensitivity pricing matrix using Mixed Cell References (`$B5 * C$4`):

#table(
  columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if x == 0 { rgb("#F1F5F9") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Units / Discount*], [*0% Discount (`C$4`)*], [*5% Discount (`D$4`)*], [*10% Discount (`E$4`)*], [*15% Discount (`F$4`)*]),
  [*100 Units (`$B5`)*], [₹ 50,000], [₹ 47,500], [₹ 45,000], [₹ 42,500],
  [*250 Units (`$B6`)*], [₹ 1,25,000], [₹ 1,18,750], [₹ 1,12,500], [₹ 1,06,250],
  [*500 Units (`$B7`)*], [₹ 2,50,000], [₹ 2,37,500], [₹ 2,25,000], [₹ 2,12,500],
  [*1,000 Units (`$B8`)*], [₹ 5,00,000], [₹ 4,75,000], [₹ 4,50,000], [₹ 4,25,000]
)

#v(2pt)
#formula-specimen(title: "SENSITIVITY MATRIX MASTER FORMULA (CELL C5)", formula: "=\$B5 * Unit_Price * (1 - C\$4)", note: "Column B is locked with \$B5; Row 4 is locked with C\$4. A single formula fills all 16 cells!")
#v(2pt)

== 11.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What is the maximum number of rows in an Excel 365 worksheet?", ans: "1,048,576 rows.")
    #short-qa(num: 2, q: "Which key cycles a cell reference through relative, absolute, and mixed modes?", ans: "F4 key.")
    #short-qa(num: 3, q: "Which key combination opens the Name Manager dialog console?", ans: "Ctrl + F3.")
    #short-qa(num: 4, q: "What shortcut creates named ranges automatically from selected table headers?", ans: "Ctrl + Shift + F3.")
  ],
  [
    #mcq(num: 1, q: "In cell reference \$C5, what happens when the formula is copied one column to the right?", a: "Changes to \$D5", b: "Remains permanently locked to column C (\$C6 if copied down)", c: "Returns #REF!", d: "Clears formula", ans: "B", expl: "The dollar sign preceding column C (\$C) permanently locks the column vector.")
    #mcq(num: 2, q: "What is the column letter of the very last column in Excel 365?", a: "ZZZ", b: "XFD", c: "FFF", d: "ALL", ans: "B", expl: "Excel columns run from A to XFD (total of 16,384 columns).")
    #mcq(num: 3, q: "Which of the following is an INVALID defined name in Excel?", a: "Tax_Rate_2027", b: "TotalRevenue", c: "2027_Revenue", d: "_DiscountRate", ans: "C", expl: "Defined names cannot begin with numeric digits; they must start with a letter or underscore.")
  ]
)

#v(2pt)

#spotlight-box("2027 MULTI-THREADED CALCULATION DEPENDENCY TREES", [
  Excel 365 executes asynchronous calculation across multi-core CPUs. When modifying a single cell in a 1,000,000-cell workbook, Excel's calculation engine constructs a directed acyclic graph (DAG) dependency tree, recalculating only cells directly impacted by the change in under 2 milliseconds.
])
"""

    ch11_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#059669"))[भाग 2: माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज मास्टरी · अध्याय 11]
= एक्सेल 365 ग्रिड आर्किटेक्चर, सेल रेफरेंस एवं नेम मैनेजर

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  माइक्रोसॉफ्ट एक्सेल 365 वैश्विक वाणिज्य की रीढ़ है। वित्तीय विश्लेषण, बैलेंस शीट निर्माण, टैक्स गणना और इन्वेंटरी मैनेजमेंट में उच्च उत्पादकता हासिल करने हेतु ग्रिड निर्देशांक, सेल रेफरेंस लॉकिंग तथा नेम मैनेजर आर्किटेक्चर में दक्षता प्राप्त करना अनिवार्य है।
]

#v(2pt)

== 11.1 एक्सेल 365 गणना ग्रिड संरचना

एक्सेल वर्कशीट एक विशाल द्वि-आयामी गणना मैट्रिक्स है जिसमें कुल 17,179,869,184 व्यक्तिगत सेल्स होते हैं:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*ग्रिड घटक*], [*संरचनात्मक सीमाएं एवं आयाम*], [*एंटरप्राइज नेविगेशन शॉर्टकट*]),
  [पंक्तियां (Rows)], [1 से 1,048,576 पंक्तियां (ऊर्ध्वाधर रूप से क्रमांकित)], [`Ctrl + Down Arrow` (अंतिम पंक्ति 1048576 पर जाना)],
  [कॉलम (Columns)], [1 से 16,384 कॉलम (A से लेकर XFD तक)], [`Ctrl + Right Arrow` (अंतिम कॉलम XFD पर जाना)],
  [सक्रिय सेल (Active Cell)], [कॉलम अक्षर और रो संख्या का प्रतिच्छेदन (उदा. C14)], [`Ctrl + Home` (तुरंत पहले सेल A1 पर लौटना)],
  [नेम बॉक्स (Name Box)], [सक्रिय सेल का पता अथवा निर्धारित नाम प्रदर्शित करता है।], [`Ctrl + F3` (नेम मैनेजर कंसोल खोलना)],
  [फॉर्मूला बार], [सेल में दर्ज वास्तविक गणितीय सूत्र अथवा मान दिखाता है।], [`Ctrl + Shift + U` (फॉर्मूला बार को बड़ा/छोटा करना)],
  [वर्कशीट टैब्स], [वर्कबुक के अलग-अलग शीट्स (डिफ़ॉल्ट: Sheet1)], [`Ctrl + PageDown / PageUp` (शीटों के बीच बदलना)]
)

#v(2pt)
#formula-specimen(title: "सेल पता निर्धारण परिपाटी", formula: "=कॉलम अक्षर व रो संख्या (उदा. C14 = कॉलम C, रो 14)", note: "यह निर्देशांक फॉर्मूला पार्सिंग हेतु मूलभूत आधार तय करते हैं।")
#v(2pt)

== 11.2 सेल रेफरेंस के 4 प्रकार: रिलेटिव, एब्सोल्यूट एवं मिक्स्ड

स्प्रेडशीट मॉडलिंग का आधार यह समझना है कि फॉर्मूला कॉपी करते समय सेल का पता कैसे बदलता है:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*रेफरेंस प्रकार*], [*सिंटैक्स*], [*कॉपी/ड्रैग करने पर व्यवहार*], [*कॉर्पोरेट उपयोग परिदृश्य*]),
  [Relative], [`A1`], [दूरी अनुसार कॉलम और रो दोनों स्वतः बदलते हैं।], [मात्रा और दर का गुणा करके कुल मूल्य निकालना।],
  [Absolute], [`$A$1`], [डॉलर (\$) चिन्ह लगाकर कॉलम और रो दोनों को स्थायी लॉक करना।], [सेल G1 में लिखे 18% GST टैक्स रेट को गुणा करना।],
  [Mixed (Row Locked)], [`A$1`], [कॉलम स्वतंत्र रूप से बदलता है; रो 1 स्थायी लॉक रहती है।], [पहाड़ा टेबल्स, क्षैतिज टैक्स स्लैब हेडर।],
  [Mixed (Col Locked)], [`$A1`], [कॉलम A स्थायी लॉक रहता है; रो नीचे की ओर बदलती है।], [कॉलम A में लिखे उत्पाद नाम को कई वर्षों के मॉडल में जोड़ना।]
)

#concept-box(title: "महत्वपूर्ण प्रोडक्टिविटी लीवर: F4 कुंजी का जादू", [
  फॉर्मूला लिखते समय किसी भी सेल पते पर कर्सर रखकर `F4` की दबाएं। एक्सेल बारी-बारी से बदलता है: `A1` -> `$A$1` (पूर्ण लॉक) -> `A$1` (रो लॉक) -> `$A1` (कॉलम लॉक) -> `A1` (अनलॉक)। इससे हाथ से डॉलर टाइप करने का समय बचता है।
])

#pagebreak()

== 11.3 एंटरप्राइज नेम मैनेजर (Name Manager) आर्किटेक्चर

कॉर्पोरेट फाइलों में `=B4 * $G$1` जैसे जटिल फॉर्मूले लिखना भ्रम पैदा करता है। *Name Manager* (`Formulas > Name Manager` अथवा `Ctrl + F3`) सेल निर्देशांकों को व्यावसायिक चरों (Variables) में बदलता है:

```
साधारण फॉर्मूला: =B4 * \$G\$1
पेशेवर फॉर्मूला:  =Sales_Units * GST_Tax_Rate
```

*नेम मैनेजर में नामकरण के कड़े नियम*:
1. नाम सदैव अक्षर (Letter) अथवा अंडरस्कोर (`_`) से शुरू होना चाहिए। संख्या या गणितीय चिन्ह से नहीं।
2. नाम के बीच में स्पेस (Space) देना पूर्णतः वर्जित है; CamelCase (`AnnualRevenue`) अथवा snake_case (`Tax_Rate`) का प्रयोग करें।
3. नाम किसी वास्तविक सेल पते (जैसे `C100`) जैसा नहीं हो सकता अन्यथा एरर आएगी।
4. *दायरा (Scope)*: सार्वभौमिक चरों हेतु *Workbook* स्तर चुनें, तथा मासिक शीट्स हेतु *Worksheet* स्तर।

#v(2pt)
#ribbon-specimen(path: "Formulas > Defined Names > Define Name", command: "सेमांटिक वेरिएबल पहचानकर्ता बनाना", shortcut: "Ctrl + Alt + F3")
#v(2pt)

== 11.4 चयन से स्वतः नाम उत्पन्न करना (`Ctrl + Shift + F3`)

यदि टेबल में 20 कॉलम हैं, तो प्रत्येक का अलग नाम बनाने में समय नष्ट न करें। एक्सेल का स्वचालित टूल प्रयोग करें:
1. पूरी डेटा टेबल को उसके शीर्ष हेडर कॉलम के साथ चुनें।
2. कीबोर्ड पर `Ctrl + Shift + F3` दबाएं (अथवा `Create from Selection` चुनें)।
3. *Top row* को चेक करें।
4. *OK* दबाते ही एक्सेल 1 मिलीसेकंड में हेडर के स्पेस को अंडरस्कोर में बदलकर 20 कॉलमों के नाम स्वतः पंजीकृत कर देता है!

#pagebreak()

== 11.5 प्रोडक्शन ब्लूप्रिंट: टू-वे संवेदनशीलता मूल्य निर्धारण मैट्रिक्स

नीचे मिक्स्ड सेल रेफरेंस (`$B5 * C$4`) द्वारा निर्मित वास्तविक कॉर्पोरेट डिस्काउंट टेबल दी गई है:

#table(
  columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if x == 0 { rgb("#F1F5F9") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*मात्रा / छूट*], [*0% छूट (`C$4`)*], [*5% छूट (`D$4`)*], [*10% छूट (`E$4`)*], [*15% छूट (`F$4`)*]),
  [*100 नग (`$B5`)*], [₹ 50,000], [₹ 47,500], [₹ 45,000], [₹ 42,500],
  [*250 नग (`$B6`)*], [₹ 1,25,000], [₹ 1,18,750], [₹ 1,12,500], [₹ 1,06,250],
  [*500 नग (`$B7`)*], [₹ 2,50,000], [₹ 2,37,500], [₹ 2,25,000], [₹ 2,12,500],
  [*1,000 नग (`$B8`)*], [₹ 5,00,000], [₹ 4,75,000], [₹ 4,50,000], [₹ 4,25,000]
)

#v(2pt)
#formula-specimen(title: "मास्टर फॉर्मूला (सेल C5)", formula: "=\$B5 * Unit_Price * (1 - C\$4)", note: "कॉलम B को \$B5 से तथा रो 4 को C\$4 से लॉक किया गया है। केवल एक फॉर्मूला पूरी टेबल भर देता है!")
#v(2pt)

== 11.6 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "एक्सेल 365 की एक वर्कशीट में अधिकतम कितनी पंक्तियाँ होती हैं?", ans: "1,048,576 पंक्तियाँ।")
    #short-qa(num: 2, q: "सेल रेफरेंस में डॉलर चिन्ह बारी-बारी बदलने वाली शॉर्टकट की कौन सी है?", ans: "F4 कुंजी।")
    #short-qa(num: 3, q: "नेम मैनेजर कंसोल खोलने का शॉर्टकट क्या है?", ans: "Ctrl + F3.")
    #short-qa(num: 4, q: "टेबल हेडर से स्वतः कई नाम बनाने का शॉर्टकट क्या है?", ans: "Ctrl + Shift + F3.")
  ],
  [
    #mcq(num: 1, q: "सेल रेफरेंस \$C5 को दाईं ओर कॉपी करने पर क्या होगा?", a: "\$D5 में बदलेगा", b: "कॉलम C (\$C) स्थायी रूप से लॉक रहेगा", c: "#REF! एरर आएगी", d: "मान शून्य होगा", ans: "B", expl: "कॉलम अक्षर से पहले लगा डॉलर चिन्ह (\$C) कॉलम को लॉक रखता है।")
    #mcq(num: 2, q: "एक्सेल 365 के सबसे अंतिम कॉलम का नाम क्या है?", a: "ZZZ", b: "XFD", c: "FFF", d: "ALL", ans: "B", expl: "एक्सेल में कॉलम A से XFD (कुल 16,384 कॉलम) तक होते हैं।")
    #mcq(num: 3, q: "नेम मैनेजर में निम्नलिखित में से कौन सा नाम अवैध (Invalid) है?", a: "Tax_Rate_2027", b: "TotalRevenue", c: "2027_Revenue", d: "_DiscountRate", ans: "C", expl: "एक्सेल में कोई भी नाम संख्या (Digit) से शुरू नहीं हो सकता।")
  ]
)

#v(2pt)

#spotlight-box("2027 मल्टी-थ्रेडेड डिपेंडेंसी गणना", [
  एक्सेल 365 मल्टी-कोर प्रोसेसर पर काम करता है। 10 लाख सेलों वाली वर्कबुक में जब किसी एक सेल का मान बदला जाता है, तो एक्सेल केवल उसी से प्रभावित होने वाले सेलों को 2 मिलीसेकंड में री-कैलकुलेट करता है।
])
"""

    with open(os.path.join(eng_dir, "chapter-11.typ"), "w", encoding="utf-8") as f:
        f.write(ch11_en)
    with open(os.path.join(hi_dir, "chapter-11.typ"), "w", encoding="utf-8") as f:
        f.write(ch11_hi)

    # =========================================================================
    # CHAPTER 12: Data Entry, Custom Formatting & Flash Fill (3 Pages)
    # =========================================================================
    ch12_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 12]
= Data Entry, Custom Number Formatting & Flash Fill AI Pattern Engine

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Data integrity dictates whether a spreadsheet functions as an executive asset or a liability. Understanding the fundamental distinction between a cell's underlying raw value and its formatted display mask, harnessing custom number formatting syntax, and leveraging Flash Fill pattern AI are essential workplace competencies.
]

#v(2pt)

== 12.1 The Fundamental Axiom: Stored Value vs. Display Mask

In Excel, what appears on screen is frequently distinct from what resides in memory:
- If cell A1 stores the decimal `0.185` and is formatted as Percentage with 0 decimals, the screen displays `19%`.
- However, any formula multiplying `A1 * 1000` evaluates mathematically to `185`, NOT `190`!
- *Number Formatting* alters visual presentation *without modifying mathematical precision*.
- *Rounding Functions* (`ROUND`, `TRUNC`) permanently truncate underlying memory precision.

#v(2pt)
#ribbon-specimen(path: "Home > Number > Format Cells Dialog", command: "Configure Deep Numeric Masking", shortcut: "Ctrl + 1")
#v(2pt)

== 12.2 Currency vs. Accounting Number Formats

Financial analysts must adhere strictly to corporate accounting presentation standards:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Feature / Behavior*], [*Currency Format (`$#,##0.00`)*], [Accounting Format (`_($* #,##0.00_)*`)]),
  [Currency Symbol Placement], [Floats immediately adjacent to number (e.g., `₹540.00`)], [Flush against the far-left cell border in a neat column],
  [Zero Value Representation], [Displays as explicit numeric `₹0.00`], [Renders as a clean accounting dash (`-`) for uncluttered ledgers],
  [Negative Numbers], [Supports red text, minus sign `-₹50`, or parentheses], [Enforces strict legal accounting parentheses `(₹ 50.00)`],
  [Right Decimal Alignment], [Varies if negative numbers use minus signs], [Guarantees decimals align perfectly across all rows]
)

#concept-box(title: "CRITICAL AUDIT RULE: ACCOUNTING DASHES", [
  Never type a literal hyphen `-` to indicate a zero balance! In accounting ledgers, format the column as *Accounting*. Excel will automatically render true mathematical zeros as elegant centered dashes while preserving their ability to be summed.
])

#pagebreak()

== 12.3 Custom Number Formatting Syntax: The 4-Section Architecture

The *Custom Number Format* engine (`Ctrl + 1 > Number > Custom`) allows developers to design proprietary display masks. The syntax comprises exactly 4 semi-colon delimited sections:

```
Syntax Structure:
<POSITIVE FORMAT> ; <NEGATIVE FORMAT> ; <ZERO FORMAT> ; <TEXT FORMAT>
```

#table(
  columns: (1.2fr, 2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Enterprise Token*], [*Format Code Specimen*], [*Rendered Screen Output & Enterprise Behavior*]),
  [Indian Currency & Colors], [`[Green]₹#,##,##0;[Red](₹#,##,##0);"-";@`], [Positives in Green; Negatives in Red parentheses; Zeros as dash.],
  [Preserve Leading Zeros], [`000000`], [Input `450` displays as `000450` (mandatory for 6-digit PIN codes).],
  [Conditional Color Scale], [`[>=100000][Blue]₹#,##,##0;[Red]₹#,##,##0`], [Highlights enterprise sales milestones exceeding 1 Lakh in blue.],
  [Hide Sensitive Data], [`;;;`], [Three semicolons completely hides cell contents from screen view!],
  [Date Formatting], [`dddd, mmmm dd, yyyy`], [Input `2027-04-15` renders as `Thursday, April 15, 2027`.]
)

#v(2pt)
#formula-specimen(title: "GSTIN TAX IDENTIFICATION NUMBER MASK", formula: "00\"-\"AAAAA0000A\"-\"0\"-\"A\"-\"A", note: "Forces 15-character statutory GST identification format across vendor master tables.")
#v(2pt)

== 12.4 Flash Fill AI Pattern Engine (`Ctrl + E`)

Introduced to eliminate tedious string concatenation formulas, *Flash Fill* (`Data > Flash Fill` or `Ctrl + E`) uses predictive pattern induction to transform text:

#table(
  columns: (1.8fr, 1.8fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Raw Input Data (Col A)*], [*Trained Target (Col B1)*], [*Flash Fill Output on Ctrl + E (Col B2:B)*]),
  [rahul.patel\@rtechlab.com], [Rahul Patel], [Extracts clean Proper Case First & Last names.],
  [KA-01-MJ-4521 (Bangalore)], [KA-01], [Extracts RTO district registration code.],
  [9876543210], [+91-98765-43210], [Injects international telecom dialing masks.],
  [Dell PowerEdge R760 Server], [Dell (Server)], [Combines brand and equipment category dynamically.]
)

#pagebreak()

== 12.5 AutoFill Handle & Custom Corporate Fill Series

Dragging the small green square in the bottom-right corner of an active cell activates *AutoFill*:
- *Linear Numeric Growth*: Type `100`, drag holding `Ctrl` (or enter `100` and `110`, highlight both and drag) to generate an arithmetic sequence.
- *Date Sequences*: Dragging a date provides contextual right-click options: *Fill Days*, *Fill Weekdays* (skips Saturday & Sunday automatically!), *Fill Months*, or *Fill Years*.
- *Custom Corporate Lists*: Navigate to `File > Options > Advanced > General > Edit Custom Lists`. Enter your company's departmental sequence: `HR, Engineering, Operations, QA, Marketing`. Now, typing `HR` and dragging AutoFill instantly populates all company divisions across the row!

#v(2pt)

== 12.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which shortcut opens the Format Cells dialog box?", ans: "Ctrl + 1.")
    #short-qa(num: 2, q: "What is the key shortcut to trigger the Flash Fill AI pattern engine?", ans: "Ctrl + E.")
    #short-qa(num: 3, q: "What custom formatting code completely hides cell contents from view?", ans: ";;; (Three consecutive semicolons).")
    #short-qa(num: 4, q: "In the 4-section custom format structure, what does the 2nd section control?", ans: "Negative numbers.")
  ],
  [
    #mcq(num: 1, q: "What is the primary visual difference between Currency and Accounting number formats?", a: "Currency is always green", b: "Accounting aligns currency symbols flush-left and displays zero as a dash", c: "Accounting deletes decimals", d: "Currency cannot do negative numbers", ans: "B", expl: "Accounting format separates the currency symbol and uses dashes for zeros to clean up financial ledgers.")
    #mcq(num: 2, q: "Which custom number format code ensures an input of 750 displays as a 6-digit number 000750?", a: "######", b: "000000", c: "??-???", d: "@000", ans: "B", expl: "The zero token forces leading zeros to display if digits are absent.")
    #mcq(num: 3, q: "When dragging a date with the AutoFill handle, how do you skip Saturdays and Sundays?", a: "Delete them manually", b: "Choose 'Fill Weekdays' from the AutoFill Options tag", c: "Press Shift while dragging", d: "Use Format Painter", ans: "B", expl: "'Fill Weekdays' automatically filters out weekend dates from the generated calendar series.")
  ]
)

#v(2pt)

#spotlight-box("2027 NEURAL FLASH FILL WITH NATURAL LANGUAGE", [
  Excel 365 Copilot AI enhances Flash Fill with conversational intent. If an analyst types: "Standardize all address fields by extracting city and state into separate columns while capitalizing acronyms", Copilot synthesizes the transformation across 50,000 rows without requiring sample manual training rows.
])
"""

    ch12_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#059669"))[भाग 2: माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज मास्टरी · अध्याय 12]
= डेटा एंट्री, कस्टम नंबर फॉर्मेटिंग एवं फ्लैश फिल AI इंजन

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  डेटा की प्रामाणिकता यह तय करती है कि स्प्रेडशीट एक विश्वसनीय कॉर्पोरेट संपत्ति बनेगी या जोखिम। सेल में सुरक्षित वास्तविक मान (Stored Value) और स्क्रीन पर दिखने वाले मास्क (Display Mask) के अंतर को समझना, कस्टम नंबर फॉर्मेटिंग कोड्स और फ्लैश फिल (Flash Fill) AI में महारत आधुनिक कार्यस्थल हेतु अनिवार्य है।
]

#v(2pt)

== 12.1 मौलिक सिद्धांत: वास्तविक मान (Stored Value) बनाम डिस्प्ले मास्क

एक्सेल में स्क्रीन पर जो दिखाई देता है, वह मेमोरी में सहेजे गए मान से अक्सर अलग होता है:
- यदि सेल A1 में `0.185` लिखा है और उसे बिना दशमलव के प्रतिशत फॉर्मेट दिया जाए, तो स्क्रीन पर `19%` दिखेगा।
- परंतु यदि किसी फॉर्मूले में `A1 * 1000` किया जाए, तो परिणाम `185` आएगा, `190` नहीं!
- *Number Formatting* गणितीय शुद्धता को बदले बिना केवल *दृश्य स्वरूप (Visual Presentation)* बदलती है।
- *Rounding Functions* (`ROUND`, `TRUNC`) मेमोरी में मौजूद वास्तविक मान को स्थायी रूप से बदल देते हैं।

#v(2pt)
#ribbon-specimen(path: "Home > Number > Format Cells Dialog", command: "गहन संख्या फॉर्मेटिंग कोड्स सेट करना", shortcut: "Ctrl + 1")
#v(2pt)

== 12.2 करेंसी (Currency) बनाम अकाउंटिंग (Accounting) फॉर्मेट्स

वित्तीय विश्लेषकों को कॉर्पोरेट अकाउंटिंग मानकों का कड़ाई से पालन करना पड़ता है:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*विशेषता / व्यवहार*], [*करेंसी फॉर्मेट (`$#,##0.00`)*], [अकाउंटिंग फॉर्मेट (`_($* #,##0.00_)*`)]),
  [मुद्रा चिन्ह का स्थान], [संख्या से बिल्कुल सटकर आता है (जैसे `₹540.00`)], [सेल के बिल्कुल बाएं किनारे पर एक सीध में आता है],
  [शून्य (Zero) का प्रदर्शन], [स्पष्ट रूप से `₹0.00` लिखा हुआ दिखता है], [लेजर को स्वच्छ रखने हेतु एक डैश (`-`) के रूप में दिखता है],
  [ऋणात्मक संख्याएं (Negative)], [माइनस चिन्ह `-₹50` अथवा लाल रंग का समर्थन], [कानूनी अकाउंटिंग ब्रैकेट्स `(₹ 50.00)` का उपयोग करता है],
  [दशमलव की सीध], [माइनस चिन्ह होने पर दशमलव थोड़ा खिसक सकता है], [सभी पंक्तियों में दशमलव बिंदु बिल्कुल एक सीध में रहते हैं]
)

#concept-box(title: "महत्वपूर्ण ऑडिट नियम: अकाउंटिंग डैश", [
  शून्य शेष दर्शाने हेतु सेल में हाथ से कभी भी माइनस (-) टाइप न करें! कॉलम को *Accounting* फॉर्मेट दें। एक्सेल वास्तविक शून्य को स्वतः सुंदर डैश (-) में बदल देगा और उसका योग भी सही निकलेगा।
])

#pagebreak()

== 12.3 कस्टम नंबर फॉर्मेटिंग सिंटैक्स: 4-भागों की संरचना

*Custom Number Format* टूल (`Ctrl + 1 > Number > Custom`) से मनचाहा डिस्प्ले मास्क बनाया जा सकता है। इसका सिंटैक्स सेमीकोलन (;) द्वारा 4 भागों में बंटा होता है:

```
सिंटैक्स संरचना:
<धनात्मक संख्या> ; <ऋणात्मक संख्या> ; <शून्य मान> ; <टेक्स्ट मान>
```

#table(
  columns: (1.2fr, 2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*एंटरप्राइज कोड*], [*फॉर्मेट कोड उदाहरण*], [*स्क्रीन पर परिणाम एवं कॉर्पोरेट व्यवहार*]),
  [भारतीय मुद्रा व रंग], [`[Green]₹#,##,##0;[Red](₹#,##,##0);"-";@`], [धनात्मक मान हरे रंग में; ऋणात्मक लाल कोष्ठक में; शून्य डैश में।],
  [शुरुआती शून्य बनाए रखना], [`000000`], [इनपुट `450` स्क्रीन पर `000450` दिखेगा (6-अंकीय पिनकोड हेतु)।],
  [सशर्त रंग स्केल], [`[>=100000][Blue]₹#,##,##0;[Red]₹#,##,##0`], [1 लाख से अधिक की बिक्री नीले रंग में; कम वाली लाल रंग में।],
  [डेटा पूर्णतः छिपाना], [`;;;`], [तीन सेमीकोलन लगाने से सेल की सामग्री स्क्रीन पर पूरी तरह गायब हो जाती है!],
  [दिनांक फॉर्मेटिंग], [`dddd, mmmm dd, yyyy`], [इनपुट `2027-04-15` स्क्रीन पर `गुरुवार, 15 अप्रैल 2027` दिखेगा।]
)

#v(2pt)
#formula-specimen(title: "GSTIN टैक्स पहचान कोड मास्क", formula: "00\"-\"AAAAA0000A\"-\"0\"-\"A\"-\"A", note: "वेंडर मास्टर डेटा में 15-अक्षरों का मानक GST नंबर फॉर्मेट लागू करता है।")
#v(2pt)

== 12.4 फ्लैश फिल (Flash Fill) AI पैटर्न इंजन (`Ctrl + E`)

जटिल फॉर्मूलों के बिना टेक्स्ट को अलग-अलग करने हेतु *Flash Fill* (`Data > Flash Fill` अथवा `Ctrl + E`) पैटर्न पहचान का उपयोग करता है:

#table(
  columns: (1.8fr, 1.8fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*कच्चा इनपुट डेटा (कॉलम A)*], [*पहला नमूना (कॉलम B1)*], [*Ctrl + E दबाने पर स्वतः परिणाम (B2:B)*]),
  [rahul.patel\@rtechlab.com], [Rahul Patel], [ईमेल से प्रथम व अंतिम नाम निकालकर प्रॉपर केस में लिखना।],
  [KA-01-MJ-4521 (Bangalore)], [KA-01], [गाड़ी नंबर से RTO जिला कोड अलग करना।],
  [9876543210], [+91-98765-43210], [साधारण मोबाइल नंबर में देश का डायलिंग कोड जोड़ना।],
  [Dell PowerEdge R760 Server], [Dell (Server)], [ब्रांड और उत्पाद श्रेणी को गतिशील रूप से जोड़ना।]
)

#pagebreak()

== 12.5 ऑटोफिल हैंडल (AutoFill) एवं कस्टम कॉर्पोरेट सीरीज

सेल के निचले दाएं कोने में मौजूद छोटे हरे बिंदु को खींचने पर *AutoFill* सक्रिय होता है:
- *संख्यात्मक श्रृंखला (Series)*: `100` लिखकर `Ctrl` दबाकर खींचें (अथवा `100` व `110` लिखकर दोनों को चुनकर खींचें) तो 10-10 की वृद्धि वाली श्रृंखला बनती है।
- *दिन व दिनांक*: दिनांक खींचने पर ऑप्शन्स में *Fill Weekdays* चुनें, जिससे शनिवार और रविवार स्वतः छूट जाते हैं और केवल कार्यदिवस आते हैं!
- *कस्टम कॉर्पोरेट सूचियां*: `File > Options > Advanced > Edit Custom Lists` में जाएं। अपनी कंपनी के विभागों की सूची दर्ज करें: `HR, IT, Accounts, Sales, Operations`। अब केवल `HR` लिखकर खींचने पर सभी विभाग स्वतः आ जाएंगे!

#v(2pt)

== 12.6 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Format Cells डायलॉग बॉक्स खोलने का शॉर्टकट क्या है?", ans: "Ctrl + 1.")
    #short-qa(num: 2, q: "फ्लैश फिल (Flash Fill) AI इंजन को सक्रिय करने का शॉर्टकट क्या है?", ans: "Ctrl + E.")
    #short-qa(num: 3, q: "सेल की सामग्री को स्क्रीन पर पूर्णतः छिपाने वाला कस्टम कोड क्या है?", ans: ";;; (तीन लगातार सेमीकोलन)।")
    #short-qa(num: 4, q: "कस्टम फॉर्मेटिंग की 4-भागों की संरचना में दूसरा भाग क्या नियंत्रित करता है?", ans: "ऋणात्मक संख्याएं (Negative numbers)।")
  ],
  [
    #mcq(num: 1, q: "करेंसी और अकाउंटिंग फॉर्मेट में मुख्य दृश्य अंतर क्या है?", a: "करेंसी हमेशा हरी होती है", b: "अकाउंटिंग में मुद्रा चिन्ह बाईं ओर सीधा रहता है और शून्य डैश (-) दिखता है", c: "अकाउंटिंग दशमलव हटा देता है", d: "करेंसी में माइनस नहीं होता", ans: "B", expl: "अकाउंटिंग लेजर को स्वच्छ रखने हेतु शून्य के स्थान पर डैश लगाता है।")
    #mcq(num: 2, q: "इनपुट 750 को 6-अंकीय 000750 के रूप में दर्शाने वाला कोड कौन सा है?", a: "######", b: "000000", c: "??-???", d: "@000", ans: "B", expl: "शून्य (0) टोकन अनुपस्थित स्थानों पर अनिवार्य रूप से शुरुआती शून्य जोड़ता है।")
    #mcq(num: 3, q: "ऑटोफिल से दिनांक खींचते समय शनिवार और रविवार को छोड़ने हेतु क्या चुनते हैं?", a: "मैन्युअल हटाना", b: "Fill Weekdays", c: "Shift दबाकर खींचना", d: "Format Painter", ans: "B", expl: "Fill Weekdays विकल्प केवल सोमवार से शुक्रवार के कार्यदिवस उत्पन्न करता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 न्यूरल फ्लैश फिल", [
  एक्सेल 365 कोपायलट AI फ्लैश फिल को प्राकृतिक भाषा से संचालित करता है। विश्लेषक द्वारा यह लिखने पर: "पते में से शहर और राज्य अलग कॉलम में निकालें और पिनकोड के आगे भारत जोड़ें", कोपायलट बिना किसी नमूने के 50,000 पंक्तियों का डेटा तुरंत शुद्ध कर देता है।
])
"""

    with open(os.path.join(eng_dir, "chapter-12.typ"), "w", encoding="utf-8") as f:
        f.write(ch12_en)
    with open(os.path.join(hi_dir, "chapter-12.typ"), "w", encoding="utf-8") as f:
        f.write(ch12_hi)

    # =========================================================================
    # CHAPTER 13: Core Mathematical & Statistical Functions (4 Pages)
    # =========================================================================
    ch13_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 13]
= Core Mathematical, Statistical & Precision Rounding Engines

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Mathematical computation in Excel requires rigorous understanding of aggregation algorithms, blank-cell handling, truncation logic, and subtotal evaluation over filtered datasets. This chapter masterclasses Excel's foundational calculation functions.
]

#v(2pt)

== 13.1 Basic Aggregations: SUM, AVERAGE, MIN, MAX & AutoSum

Under `Home > Editing > AutoSum` (`Alt + =`), Excel injects basic aggregation vectors:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function Syntax*], [*Computational Formula & Rules*], [*Enterprise Operational Behavior*]),
  [`=SUM(range)`], [Sums all numeric values in continuous or disjoint ranges.], [Ignores text strings and blank cells automatically.],
  [`=AVERAGE(range)`], [Calculates arithmetic mean: SUM(range) / COUNT(range).], [Excludes empty cells; counts cells containing explicit 0.],
  [`=MIN(range)`], [Extracts absolute smallest algebraic value in set.], [Handles negative numbers correctly (e.g. -50 < 0).],
  [`=MAX(range)`], [Extracts absolute largest algebraic value in set.], [Rapidly identifies peak quarterly sales volume.],
  [`=PRODUCT(r1, r2)`], [Multiplies all arguments together: a × b × c.], [Calculating compound growth or line item totals.]
)

#v(2pt)
#formula-specimen(title: "AUTOSUM RAPID INJECTION SHORTCUT", formula: "Alt + = (Select target cell below numbers and press Alt and Equal)", note: "Excel automatically detects numeric range boundaries above or to the left.")
#v(2pt)

== 13.2 The Counting Family: COUNT vs. COUNTA vs. COUNTBLANK

A classic interview test is distinguishing the behaviors of Excel's counting functions:

#table(
  columns: (1fr, 1.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function*], [*Evaluation Criteria*], [*Behavior on Text, Dates, Booleans & Empty Cells*]),
  [`=COUNT(A1:A10)`], [Counts NUMERIC values only.], [Counts numbers and dates. Completely ignores text strings, errors, and blank cells.],
  [`=COUNTA(A1:A10)`], [Counts NON-EMPTY cells.], [Counts text, numbers, dates, booleans (`TRUE`/`FALSE`), errors (`#N/A`), and formulas returning `""`.],
  [`=COUNTBLANK(A1:A10)`], [Counts completely EMPTY cells.], [Counts unpopulated blank cells and formulas that return empty text strings `""`.]
)

#concept-box(title: "CRITICAL FORMULA TRAP: COUNTA COUNTS EMPTY STRINGS", [
  If cell B2 contains the formula `=IF(A2>0, "Active", "")` and returns empty text `""`, *COUNTA counts that cell as populated*! To count cells with visible text only, use `=COUNTIF(B2:B100, "?*")`.
])

#pagebreak()

== 13.3 Precision Rounding: ROUND, ROUNDUP, ROUNDDOWN & INT

Financial balance sheets require balancing totals to the nearest rupee or paisa. Excel provides 6 distinct rounding engines:

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function Syntax*], [*Rounding Logic*], [*Computational Specimen (Input: 145.678)*]),
  [`=ROUND(num, 2)`], [Standard 5/4 arithmetic rounding.], [`=ROUND(145.678, 2)` evaluates to `145.68`. If 3rd decimal < 5, rounds down.],
  [`=ROUNDUP(num, 2)`], [Forces rounding away from zero.], [`=ROUNDUP(145.671, 2)` evaluates to `145.68` (even with 1 in 3rd place).],
  [`=ROUNDDOWN(num, 2)`], [Forces rounding toward zero.], [`=ROUNDDOWN(145.679, 2)` evaluates to `145.67` (truncates excess).],
  [`=ROUND(num, -2)`], [Rounds to nearest hundred (10²).], [`=ROUND(145.678, -2)` evaluates to `100`. `=ROUND(185, -2)` evaluates to `200`.],
  [`=INT(number)`], [Rounds DOWN to nearest integer.], [`=INT(145.99)` evaluates to `145`. `=INT(-5.2)` evaluates to `-6`!],
  [`=TRUNC(number, 0)`], [Simply lops off fractional digits.], [`=TRUNC(145.99)` evaluates to `145`. `=TRUNC(-5.2)` evaluates to `-5`.]
)

#v(2pt)
#formula-specimen(title: "CEILING & FLOOR BATCH LOGISTICS FORMULAS", formula: "=CEILING.MATH(Quantity, 50)  |  =FLOOR.MATH(Quantity, 50)", note: "Forces procurement quantities into multiples of 50-unit pallet containers.")
#v(2pt)

== 13.4 Statistical Rankings: LARGE, SMALL & RANK.EQ

When compiling student marks or executive sales leaderboards:
- `=RANK.EQ(number, ref, [order])`: Returns the rank of a value within a list.
  - `order = 0` (or omitted): Highest number ranks #1 (Standard academic score rank).
  - `order = 1`: Lowest number ranks #1 (Golf scores or marathon race timing).
- `=LARGE(array, k)`: Returns the k-th largest value in a dataset (`=LARGE(B2:B100, 1)` is highest; `=LARGE(B2:B100, 2)` is runner-up).
- `=SMALL(array, k)`: Returns the k-th smallest value in a dataset (`=SMALL(B2:B100, 1)` is absolute minimum).

#pagebreak()

== 13.5 The Master Filter Aggregator: SUBTOTAL Function

When analyzing filtered Excel tables, standard `=SUM(C2:C100)` fails catastrophically: it continues summing rows that were hidden by the filter!

*The Enterprise Protocol*: Use the `=SUBTOTAL` function:

```
Syntax: =SUBTOTAL(function_num, ref1, [ref2], ...)
```

#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Operation*], [*Standard Code (Includes Hidden)*], [*100-Series Code (Ignores Hidden)*], [*Enterprise Production Behavior*]),
  [AVERAGE], [`1`], [`101`], [Calculates mean of visible filtered rows only.],
  [COUNT], [`2`], [`102`], [Counts numeric values in visible filtered rows.],
  [COUNTA], [`3`], [`103`], [Counts populated cells in visible filtered rows.],
  [MAX], [`4`], [`104`], [Finds maximum value among visible filtered rows.],
  [MIN], [`5`], [`105`], [Finds minimum value among visible filtered rows.],
  [SUM], [`9`], [`109`], [*MANDATORY*: Sums visible filtered amounts; ignores manual/filter hidden rows!]
)

#v(2pt)
#formula-specimen(title: "ENTERPRISE AUDITED TOTAL FORMULA", formula: "=SUBTOTAL(109, Invoice_Amount_Range)", note: "Always utilize function code 109 to guarantee filtered invoices calculate correctly.")
#v(2pt)

== 13.6 Remainder Math & Alternating Rows: MOD Function

The `=MOD(number, divisor)` function returns the mathematical remainder after division:
- `=MOD(17, 5)` evaluates to `2` (since 17 = 5 × 3 + 2).
- *Detecting Even / Odd Rows*: `=MOD(ROW(), 2) = 0` evaluates to `TRUE` on even rows (2, 4, 6) and `FALSE` on odd rows. This is the exact formula powering custom zebra-striping in Conditional Formatting!

#pagebreak()

== 13.7 Production Blueprint: Academic Marksheet Calculation Matrix

Below is a verified production marksheet model illustrating mathematical aggregation and ranking:

#table(
  columns: (1fr, 2.2fr, 1.1fr, 1.1fr, 1.1fr, 1.3fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Roll No*], [*Student Full Name*], [*Math (C)*], [*Sci (D)*], [*Eng (E)*], [*Total (=SUM)*], [*Rank (=RANK.EQ)*]),
  [101], [Rahul Patel], [95], [92], [88], [275], [Rank 1],
  [102], [Amit Sharma], [88], [76], [82], [246], [Rank 3],
  [103], [Pooja Verma], [91], [89], [90], [270], [Rank 2],
  [104], [Vikas Gupta], [65], [70], [68], [203], [Rank 4]
)

#v(2pt)
#formula-specimen(title: "STUDENT RANK FORMULA (CELL G2)", formula: "=RANK.EQ(F2, $F$2:$F$5, 0)", note: "Locks total column range with absolute reference \$F\$2:\$F\$5 to prevent range shifting.")
#v(2pt)

== 13.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which function counts cells containing numbers and dates only?", ans: "COUNT function.")
    #short-qa(num: 2, q: "What does formula =ROUND(145.678, -1) evaluate to?", ans: "150 (rounds to nearest 10).")
    #short-qa(num: 3, q: "Which SUBTOTAL function code sums visible rows while excluding hidden rows?", ans: "Function code 109.")
    #short-qa(num: 4, q: "Which key shortcut instantly injects the AutoSum formula?", ans: "Alt + = (Alt and Equal).")
  ],
  [
    #mcq(num: 1, q: "If cell A1 contains =\"\" (an empty text string), what does =COUNTA(A1) return?", a: "0", b: "1", c: "#VALUE!", d: "Blank", ans: "B", expl: "COUNTA counts any cell containing a formula, even if the formula evaluates to an empty string.")
    #mcq(num: 2, q: "What is the difference between INT(-4.2) and TRUNC(-4.2)?", a: "No difference", b: "INT returns -5; TRUNC returns -4", c: "INT returns -4; TRUNC returns -5", d: "Both return 0", ans: "B", expl: "INT rounds down away from zero for negatives (-5); TRUNC simply removes fractional digits (-4).")
    #mcq(num: 3, q: "Which formula calculates the 3rd highest sales score in column B?", a: "=MAX(B2:B100, 3)", b: "=LARGE(B2:B100, 3)", c: "=TOP(B2:B100, 3)", d: "=RANK(B2:B100, 3)", ans: "B", expl: "=LARGE(range, k) returns the k-th largest value in a dataset.")
  ]
)

#v(2pt)

#spotlight-box("2027 MATRIX COMPUTATION IN DYNAMIC EXCEL ENGINES", [
  Excel 365 natively handles vector matrix operations without legacy `Ctrl + Shift + Enter` array brackets. Functions like `=MMULT`, `=TRANSPOSE`, and dynamic aggregations now spill results across contiguous cells dynamically with hardware SIMD AVX-512 acceleration.
])
"""

    ch13_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#059669"))[भाग 2: माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज मास्टरी · अध्याय 13]
= कोर गणितीय, सांख्यिकीय एवं सटीक राउंडिंग इंजन

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  एक्सेल में गणितीय गणना हेतु एग्रीगेशन एल्गोरिदम, रिक्त सेल मूल्यांकन, दशमलव ट्रंकेशन और फ़िल्टर किए गए डेटा पर सब-टोटल की गहरी समझ आवश्यक है। यह अध्याय एक्सेल के मूलभूत गणना इंजनों का गहन विश्लेषण प्रस्तुत करता है।
]

#v(2pt)

== 13.1 मूलभूत एग्रीगेशन्स: SUM, AVERAGE, MIN, MAX एवं ऑटोसम

`Home > Editing > AutoSum` (`Alt + =`) के अंतर्गत बुनियादी गणना टूल्स उपलब्ध हैं:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फॉर्मूला सिंटैक्स*], [*गणना नियम एवं व्यवहार*], [*कॉर्पोरेट उपयोग*]),
  [`=SUM(range)`], [रेंज के सभी संख्यात्मक मानों को जोड़ता है।], [टेक्स्ट और खाली सेलों को स्वतः छोड़ देता है।],
  [`=AVERAGE(range)`], [अंकगणितीय औसत निकालता है: योग / कुल संख्या।], [खाली सेल छोड़ता है; 0 लिखे सेल को औसत में गिनता है।],
  [`=MIN(range)`], [रेंज में से सबसे छोटा बीजगणितीय मान खोजता है।], [ऋणात्मक संख्याओं को सही पहचानता है (-50 < 0)।],
  [`=MAX(range)`], [रेंज में से सबसे बड़ा मान निकालता है।], [उच्चतम बिक्री अथवा अधिकतम अंक तुरंत खोजना।],
  [`=PRODUCT(r1, r2)`], [सभी तर्कों को आपस में गुणा करता है।], [चक्रवृद्धि ब्याज दर अथवा बिल के कुल मूल्य की गणना।]
)

#v(2pt)
#formula-specimen(title: "ऑटोसम (AUTOSUM) शॉर्टकट", formula: "Alt + = (संख्याओं के नीचे वाले सेल पर Alt और बराबर का चिन्ह दबाएं)", note: "एक्सेल ऊपर अथवा बाईं ओर की संख्याओं को स्वतः पहचान लेता है।")
#v(2pt)

== 13.2 काउंटिंग परिवार: COUNT बनाम COUNTA बनाम COUNTBLANK

साक्षात्कारों में एक्सेल के तीनों काउंटिंग फंक्शन्स का अंतर बार-बार पूछा जाता है:

#table(
  columns: (1fr, 1.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फंक्शन*], [*गणना कसौटी*], [*टेक्स्ट, दिनांक, बूलियन व खाली सेलों पर व्यवहार*]),
  [`=COUNT(A1:A10)`], [केवल NUMERIC (संख्या) मान गिनता है।], [संख्याओं और तारीखों को गिनता है। टेक्स्ट, एरर्स और खाली सेलों को छोड़ देता है।],
  [`=COUNTA(A1:A10)`], [गैर-रिक्त (NON-EMPTY) सेलों को गिनता है।], [टेक्स्ट, संख्या, तारीख, TRUE/FALSE, एरर्स और `""` लौटाने वाले फॉर्मूलों को भी गिनता है।],
  [`=COUNTBLANK(A1:A10)`], [पूरी तरह खाली (EMPTY) सेल गिनता है।], [रिक्त सेलों तथा खाली स्ट्रिंग `""` वाले सेलों की संख्या गिनता है।]
)

#concept-box(title: "महत्वपूर्ण फॉर्मूला जाल: COUNTA खाली स्ट्रिंग को भी गिनता है", [
  यदि सेल B2 में `=IF(A2>0, "Active", "")` फॉर्मूला लगा है और वह खाली टेक्स्ट `""` लौटा रहा है, तो *COUNTA उसे भरा हुआ सेल मानकर गिन लेगा*! केवल दृश्य टेक्स्ट गिनने हेतु `=COUNTIF(B2:B100, "?*")` का प्रयोग करें।
])

#pagebreak()

== 13.3 दशमलव शुद्धता राउंडिंग: ROUND, ROUNDUP, ROUNDDOWN एवं INT

वित्तीय बैलेंस शीट्स में पैसे की पाई-पाई का हिसाब रखने हेतु 6 राउंडिंग फंक्शन्स दिए गए हैं:

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फॉर्मूला सिंटैक्स*], [*राउंडिंग तर्क*], [*गणना उदाहरण (इनपुट: 145.678)*]),
  [`=ROUND(num, 2)`], [मानक 5/4 गणितीय राउंडिंग।], [`=ROUND(145.678, 2)` का उत्तर `145.68` होगा। तीसरा अंक < 5 होने पर नीचे झुकेगा।],
  [`=ROUNDUP(num, 2)`], [सदैव ऊपर (शून्य से दूर) राउंड करता है।], [`=ROUNDUP(145.671, 2)` का उत्तर `145.68` होगा (भले ही तीसरा अंक 1 हो)।],
  [`=ROUNDDOWN(num, 2)`], [सदैव नीचे (शून्य की ओर) काटता है।], [`=ROUNDDOWN(145.679, 2)` का उत्तर `145.67` होगा (अतिरिक्त अंक काट देगा)।],
  [`=ROUND(num, -2)`], [निकटतम सैकड़ा (100) पर राउंड करता है।], [`=ROUND(145.678, -2)` का उत्तर `100` होगा। `=ROUND(185, -2)` का `200` होगा।],
  [`=INT(number)`], [निकटतम छोटे पूर्णांक पर लाता है।], [`=INT(145.99)` का `145` होगा। ऋणात्मक में `=INT(-5.2)` का उत्तर `-6` होगा!],
  [`=TRUNC(number, 0)`], [दशमलव के बाद के अंक सीधे हटा देता है।], [`=TRUNC(145.99)` का `145` होगा। ऋणात्मक में `=TRUNC(-5.2)` का `-5` होगा।]
)

#v(2pt)
#formula-specimen(title: "लॉजिस्टिक्स पैकेजिंग फॉर्मूला (CEILING व FLOOR)", formula: "=CEILING.MATH(मात्रा, 50)  |  =FLOOR.MATH(मात्रा, 50)", note: "खरीद मात्रा को 50-नग वाले कार्टन के गुणक (Multiples) में ढालना।")
#v(2pt)

== 13.4 सांख्यिकीय रैंकिंग: LARGE, SMALL एवं RANK.EQ

छात्रों के अंक अथवा सेल्स टीमों की रैंक निर्धारित करते समय:
- `=RANK.EQ(संख्या, रेफरेंस, [क्रम])`: किसी सूची में संख्या की रैंक बताता है।
  - `क्रम = 0` (अथवा खाली): सबसे बड़ी संख्या को रैंक 1 मिलती है (मानक परीक्षा परिणाम)।
  - `क्रम = 1`: सबसे छोटी संख्या को रैंक 1 मिलती है (दौड़ प्रतियोगिता का समय)।
- `=LARGE(array, k)`: डेटासेट में k-वां सबसे बड़ा मान निकालता है (`=LARGE(B2:B100, 2)` द्वितीय स्थान)।
- `=SMALL(array, k)`: k-वां सबसे छोटा मान निकालता है (`=SMALL(B2:B100, 1)` न्यूनतम मान)।

#pagebreak()

== 13.5 मास्टर फ़िल्टर एग्रीगेटर: SUBTOTAL फंक्शन

फ़िल्टर की गई टेबल्स में साधारण `=SUM(C2:C100)` उपयोग करने पर भारी भूल होती है: यह फ़िल्टर द्वारा छिपाई गई पंक्तियों को भी जोड़ लेता है!

*कॉर्पोरेट मानक*: सदैव `=SUBTOTAL` फंक्शन का प्रयोग करें:

```
सिंटैक्स: =SUBTOTAL(फंक्शन_कोड, ref1, ...)
```

#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*कार्य*], [*साधारण कोड (छिपे मान शामिल)*], [*100-सीरीज कोड (छिपे मान छोड़कर)*], [*कॉर्पोरेट उत्पादन व्यवहार*]),
  [AVERAGE], [`1`], [`101`], [केवल दृश्यमान (Visible) पंक्तियों का औसत निकालता है।],
  [COUNT], [`2`], [`102`], [केवल दृश्यमान पंक्तियों की संख्या गिनता है।],
  [COUNTA], [`3`], [`103`], [केवल दृश्यमान भरे हुए सेलों को गिनता है।],
  [MAX], [`4`], [`104`], [दृश्यमान पंक्तियों में से अधिकतम मान खोजता है।],
  [MIN], [`5`], [`105`], [दृश्यमान पंक्तियों में से न्यूनतम मान खोजता है।],
  [SUM], [`9`], [`109`], [*अनिवार्य*: केवल स्क्रीन पर दिखने वाले बिलों को जोड़ता है; छिपे मान छोड़ता है!]
)

#v(2pt)
#formula-specimen(title: "ऑडिट-सत्यापित कुल योग फॉर्मूला", formula: "=SUBTOTAL(109, Invoice_Amount_Range)", note: "फ़िल्टर लगाने पर सही योग प्राप्त करने हेतु सदैव कोड 109 का उपयोग करें।")
#v(2pt)

== 13.6 शेषफल गणित एवं एकांतर पंक्तियाँ: MOD फंक्शन

`=MOD(संख्या, भाजक)` भाग देने के बाद बचा हुआ शेषफल (Remainder) लौटाता है:
- `=MOD(17, 5)` का उत्तर `2` आएगा (क्योंकि 17 = 5 x 3 + 2)।
- *सम व विषम पंक्तियों की पहचान*: `=MOD(ROW(), 2) = 0` सम पंक्तियों (2, 4, 6) पर `TRUE` देता है। कंडीशनल फॉर्मेटिंग में जेब्रा स्ट्रिपिंग (एकांतर रंगीन लाइन) बनाने का यही मूल फॉर्मूला है!

#pagebreak()

== 13.7 प्रोडक्शन ब्लूप्रिंट: शैक्षणिक मार्कशीट गणना मॉडल

नीचे मार्कशीट का सत्यापित मॉडल दिया गया है जिसमें एग्रीगेशन और रैंकिंग फॉर्मूले लागू हैं:

#table(
  columns: (1fr, 2.2fr, 1.1fr, 1.1fr, 1.1fr, 1.3fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*रोल नं*], [*विद्यार्थी का नाम*], [*गणित (C)*], [*विज्ञान (D)*], [*अंग्रेजी (E)*], [*कुल योग (=SUM)*], [*रैंक (=RANK.EQ)*]),
  [101], [राहुल पटेल], [95], [92], [88], [275], [रैंक 1],
  [102], [अमित शर्मा], [88], [76], [82], [246], [रैंक 3],
  [103], [पूजा वर्मा], [91], [89], [90], [270], [रैंक 2],
  [104], [विकास गुप्ता], [65], [70], [68], [203], [रैंक 4]
)

#v(2pt)
#formula-specimen(title: "विद्यार्थी रैंक फॉर्मूला (सेल G2)", formula: "=RANK.EQ(F2, $F$2:$F$5, 0)", note: "रेंज को खिसकने से रोकने हेतु \$F\$2:\$F\$5 पर एब्सोल्यूट लॉक लगाया गया है।")
#v(2pt)

== 13.8 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "केवल संख्या और तारीख वाले सेलों को गिनने वाला फंक्शन कौन सा है?", ans: "COUNT फंक्शन।")
    #short-qa(num: 2, q: "=ROUND(145.678, -1) का मान क्या होगा?", ans: "150 (निकटतम दहाई 10 पर राउंड)।")
    #short-qa(num: 3, q: "छिपी पंक्तियों को छोड़कर केवल दृश्यमान सेलों को जोड़ने वाला सब-टोटल कोड क्या है?", ans: "फंक्शन कोड 109।")
    #short-qa(num: 4, q: "ऑटोसम (AutoSum) फॉर्मूला तुरंत प्रविष्ट करने का शॉर्टकट क्या है?", ans: "Alt + = (Alt और बराबर की)।")
  ],
  [
    #mcq(num: 1, q: "यदि सेल A1 में =\"\" (खाली स्ट्रिंग) लिखा है, तो =COUNTA(A1) क्या लौटाएगा?", a: "0", b: "1", c: "#VALUE!", d: "Blank", ans: "B", expl: "COUNTA किसी भी फॉर्मूला युक्त सेल को भरा हुआ मानता है चाहे परिणाम खाली ही क्यों न हो।")
    #mcq(num: 2, q: "INT(-4.2) और TRUNC(-4.2) में क्या अंतर है?", a: "कोई अंतर नहीं", b: "INT का उत्तर -5 होगा; TRUNC का -4 होगा", c: "INT का -4 होगा; TRUNC का -5 होगा", d: "दोनों शून्य होंगे", ans: "B", expl: "INT ऋणात्मक में नीचे की ओर (-5) जाता है; TRUNC केवल दशमलव हटाकर -4 देता है।")
    #mcq(num: 3, q: "कॉलम B में तीसरा सबसे बड़ा सेल्स रिकॉर्ड निकालने वाला फॉर्मूला कौन सा है?", a: "=MAX(B2:B100, 3)", b: "=LARGE(B2:B100, 3)", c: "=TOP(B2:B100, 3)", d: "=RANK(B2:B100, 3)", ans: "B", expl: "=LARGE(range, k) डेटासेट में k-वां सबसे बड़ा मान निकालता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 डायनामिक मैट्रिक्स गणना", [
  एक्सेल 365 में पुराने `Ctrl + Shift + Enter` के बिना सीधे मैट्रिक्स ऑपरेशन्स संभव हैं। `=MMULT` और `=TRANSPOSE` आधुनिक AVX-512 हार्डवेयर एक्सेलेरेशन द्वारा लाखों सेलों के मैट्रिक्स गुणन को मिलीसेकंड में हल करते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-13.typ"), "w", encoding="utf-8") as f:
        f.write(ch13_en)
    with open(os.path.join(hi_dir, "chapter-13.typ"), "w", encoding="utf-8") as f:
        f.write(ch13_hi)

    # =========================================================================
    # CHAPTER 14: Conditional Aggregation Engines (4 Pages)
    # =========================================================================
    ch14_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 14]
= Conditional Aggregation Engines: COUNTIF, SUMIF & Multi-Criteria IFS

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Enterprise business intelligence rarely requires indiscriminate summation; decisions rely on targeted conditional metrics (e.g., total Q4 sales in South Zone for product X by senior agents). Mastering single-criterion and multi-criteria conditional aggregations is mandatory for financial analysts and MIS managers.
]

#v(2pt)

== 14.1 Single-Condition Aggregations: COUNTIF, SUMIF & AVERAGEIF

Single-condition functions evaluate an explicit logical criterion across a designated evaluation range:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function*], [*Syntax Structure*], [*Computational Evaluation Mechanics*]),
  [`COUNTIF`], [`=COUNTIF(range, criteria)`], [Counts cells satisfying condition (e.g. `=COUNTIF(D2:D100, ">=50")`).],
  [`SUMIF`], [`=SUMIF(range, criteria, [sum_range])`], [Evaluates criteria on `range`; if true, sums corresponding `sum_range`.],
  [`AVERAGEIF`], [`=AVERAGEIF(range, criteria, [avg_range])`], [Calculates arithmetic mean of values meeting criteria; ignores blanks.]
)

#v(2pt)
#formula-specimen(title: "CRITERIA STRING CONCATENATION PROTOCOL", formula: "=SUMIF(Salary_Range, \">=\"&Threshold_Cell, Bonus_Range)", note: "Logical comparison operators MUST be enclosed in quotes and joined to cell references via ampersand (&).")
#v(2pt)

== 14.2 The Critical Syntax Inversion: SUMIF vs. SUMIFS

A primary pitfall tripping up enterprise spreadsheet developers is the structural inversion of arguments between single and plural functions:

```
Single SUMIF Syntax:   =SUMIF( criteria_range , criteria , [sum_range] )
Plural  SUMIFS Syntax:  =SUMIFS( sum_range , criteria_range1 , criteria1 , [range2, crit2]... )
```

#concept-box(title: "MANDATORY ARCHITECTURAL RULE: SUMIFS PUTS SUM_RANGE FIRST", [
  In `=SUMIF`, the `sum_range` is optional and placed at the very end. In `=SUMIFS`, the `sum_range` is *mandatory and placed first*! Why? Because `=SUMIFS` accepts up to 127 pairs of criteria ranges, requiring the target numeric vector to be declared upfront.
])

#pagebreak()

== 14.3 Multi-Criteria Aggregations: COUNTIFS, SUMIFS & AVERAGEIFS

The multi-criteria suite evaluates simultaneous logical `AND` conditions across multiple independent columns:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function*], [*Enterprise Business Query*], [*Production Formula Specimen*]),
  [`COUNTIFS`], [Count orders from "Bangalore" over ₹ 50,000], [`=COUNTIFS(City_Col, "Bangalore", Amount_Col, ">=50000")`],
  [`SUMIFS`], [Sum Q4 hardware sales in South Zone by agent "Rahul"], [`=SUMIFS(Sales_Col, Zone_Col, "South", Rep_Col, "Rahul", Date_Col, ">=2027-10-01")`],
  [`AVERAGEIFS`], [Average score of BCA students with > 85% attendance], [`=AVERAGEIFS(Score_Col, Course_Col, "BCA", Attend_Col, ">=0.85")`]
)

#v(2pt)
#formula-specimen(title: "DATE-BOUNDED FISCAL RANGE SUMIFS", formula: "=SUMIFS(Sales, Dates, \">=2027-04-01\", Dates, \"<=2028-03-31\")", note: "Calculates total Indian Fiscal Year revenue by bracketing dates with two boundary conditions.")
#v(2pt)

== 14.4 Wildcard Matching Engines in Criteria (`*`, `?`, `~`)

When querying unstructured string databases, conditional aggregation functions support regular expression wildcards:

#table(
  columns: (1fr, 1.2fr, 2.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Wildcard*], [*Character*], [*Matching Behavioral Rule*], [*Enterprise Specimen*]),
  [Asterisk], [`*`], [Matches any sequence of zero or more characters.], [`=COUNTIF(A:A, "*Dell*")` finds any Dell product],
  [Question Mark], [`?`], [Matches exactly one single character.], [`=SUMIF(B:B, "Model-?4", C:C)` finds Model-A4, Model-B4],
  [Tilde (Escape)], [`~`], [Negates wildcard behavior to search for literal `*` or `?`.], [`=COUNTIF(A:A, "*~?*")` finds cells with literal `?`]
)

#pagebreak()

== 14.5 Production Blueprint: Multi-Branch Regional Sales Analysis

Below is an authentic corporate sales ledger evaluated using dynamic `SUMIFS` and `COUNTIFS`:

#table(
  columns: (0.8fr, 1.3fr, 1.5fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Invoice*], [*Region*], [*Product Category*], [*Sales Units*], [*Invoice Value*]),
  [INV-101], [South (Bangalore)], [Server Infrastructure], [12], [₹ 54,00,000],
  [INV-102], [North (Delhi)], [Networking Switching], [45], [₹ 22,50,000],
  [INV-103], [South (Chennai)], [Server Infrastructure], [08], [₹ 36,00,000],
  [INV-104], [South (Bangalore)], [Cybersecurity Firewall], [15], [₹ 18,75,000]
)

#v(2pt)
#formula-specimen(title: "TOTAL SOUTH REGION SERVER REVENUE", formula: "=SUMIFS(E2:E5, B2:E5, \"South*\", C2:C5, \"Server*\")", note: "Utilizes asterisk wildcards to capture Bangalore & Chennai under 'South*' for ₹ 90,00,000 total.")
#v(2pt)

== 14.6 Handling Blank, Non-Blank & Dynamic Thresholds

- *Count Non-Blank Text Cells*: `=COUNTIF(A2:A100, "*")` counts cells containing text while ignoring numbers.
- *Count All Populated Cells*: `=COUNTIF(A2:A100, "<>")` counts all cells not strictly equal to blank.
- *Dynamic Cell Reference Criteria*: When the criteria threshold resides in cell `H1`:
  ```
  Correct:   =COUNTIF(D2:D100, ">=" & H1)
  Incorrect: =COUNTIF(D2:D100, ">=H1")   <-- Searches literally for string "H1"!
  ```

#pagebreak()

== 14.7 Production Blueprint: Employee Attendance Calculation Sheet

In monthly HR payroll sheets, attendance codes are tallied using conditional aggregations:

#table(
  columns: (1fr, 2.2fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 1fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 2.5pt, y: 2pt),
  table.header([*Emp ID*], [*Employee Name*], [*D1*], [*D2*], [*D3*], [*D4*], [*P Count*], [*Payable Days*]),
  [EMP-01], [Rahul Patel], [P], [P], [P], [P], [4], [4.0 Days],
  [EMP-02], [Sneha Sharma], [P], [A], [P], [HD], [2], [2.5 Days],
  [EMP-03], [Praveen Kumar], [P], [P], [WO], [P], [3], [4.0 Days]
)

#v(2pt)
#formula-specimen(title: "ATTENDANCE PAYABLE FORMULA (ROW 2)", formula: "=COUNTIF(C2:F2, \"P\") + COUNTIF(C2:F2, \"WO\") + (COUNTIF(C2:F2, \"HD\") * 0.5)", note: "Counts Full Present (P) + Weekly Offs (WO) + Half Days (HD x 0.5) for precise payroll calculation.")
#v(2pt)

== 14.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Where is the sum_range located in SUMIF vs SUMIFS?", ans: "Last in SUMIF; FIRST in SUMIFS.")
    #short-qa(num: 2, q: "Which wildcard matches any sequence of characters in criteria?", ans: "Asterisk (*).")
    #short-qa(num: 3, q: "How do you search for a literal question mark in COUNTIF?", ans: "Use tilde escape: ~?")
    #short-qa(num: 4, q: "What is the correct syntax to link comparison operator >= to cell G5?", ans: "\">=\" & G5.")
  ],
  [
    #mcq(num: 1, q: "What does =COUNTIF(A1:A50, \"<>\") evaluate?", a: "Counts blank cells", b: "Counts all non-blank cells", c: "Returns syntax error", d: "Counts cells equal to zero", ans: "B", expl: "\"<>\" represents 'not equal to nothing', counting all non-empty cells.")
    #mcq(num: 2, q: "Which formula sums column C where column A is 'North' AND column B is > 100?", a: "=SUMIF(A:A, \"North\", C:C, B:B, \">100\")", b: "=SUMIFS(C:C, A:A, \"North\", B:B, \">100\")", c: "=SUMIF(C:C, A:A, \"North\")", d: "=TOTAL(C:C)", ans: "B", expl: "SUMIFS handles multiple criteria and mandates sum_range (C:C) as the first argument.")
    #mcq(num: 3, q: "Why does =COUNTIF(B2:B50, \">H1\") fail to calculate threshold from cell H1?", a: "H1 must be lowercase", b: "The cell reference is trapped inside quotes and evaluated as literal text 'H1'", c: "COUNTIF cannot do >", d: "B50 is too large", ans: "B", expl: "Cell references must be concatenated outside quotes via ampersand: \">=\"&H1.")
  ]
)

#v(2pt)

#spotlight-box("2027 HIGH-PERFORMANCE VECTOR AGGREGATIONS", [
  Excel 365 processes `SUMIFS` queries using columnar vectorized SIMD instructions. In datasets exceeding 2,000,000 rows, multi-criteria filtering executes in under 12 milliseconds directly in CPU L3 cache without incurring paging bottlenecks.
])
"""

    ch14_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#059669"))[भाग 2: माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज मास्टरी · अध्याय 14]
= कंडीशनल एग्रीगेशन इंजन: COUNTIF, SUMIF एवं बहु-शर्त IFS

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  कॉर्पोरेट बिजनेस इंटेलिजेंस में बिना शर्त के कुल योग निकालने की आवश्यकता कम ही होती है; व्यावसायिक निर्णय विशिष्ट शर्तों पर निर्भर करते हैं (उदा. दक्षिण क्षेत्र में उत्पाद X की कुल बिक्री)। एकल-शर्त और बहु-शर्त कंडीशनल एग्रीगेशन्स में महारत हासिल करना डेटा एनालिस्ट्स और MIS प्रबंधकों हेतु अनिवार्य है।
]

#v(2pt)

== 14.1 एकल-शर्त एग्रीगेशन्स: COUNTIF, SUMIF एवं AVERAGEIF

एकल-शर्त फंक्शन्स किसी निर्दिष्ट रेंज पर दी गई तार्किक शर्त का मूल्यांकन करते हैं:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फंक्शन*], [*सिंटैक्स संरचना*], [*मूल्यांकन कार्यप्रणाली*]),
  [`COUNTIF`], [`=COUNTIF(रेंज, शर्त)`], [शर्त पूरी करने वाले सेलों की संख्या गिनता है (उदा. `=COUNTIF(D2:D100, ">=50")`)।],
  [`SUMIF`], [`=SUMIF(रेंज, शर्त, [योग_रेंज])`], [रेंज पर शर्त जांचता है; सत्य होने पर योग_रेंज के संगत सेलों को जोड़ता है।],
  [`AVERAGEIF`], [`=AVERAGEIF(रेंज, शर्त, [औसत_रेंज])`], [शर्त पूरी करने वाले मानों का औसत निकालता है; खाली सेल छोड़ता है।]
)

#v(2pt)
#formula-specimen(title: "शर्त स्ट्रिंग कॉनकेटनेशन प्रोटोकॉल", formula: "=SUMIF(Salary_Range, \">=\"&Threshold_Cell, Bonus_Range)", note: "तुलनात्मक ऑपरेटरों (>=) को कोट्स में रखना और सेल पते को ampersand (&) से जोड़ना अनिवार्य है।")
#v(2pt)

== 14.2 महत्वपूर्ण सिंटैक्स अंतर: SUMIF बनाम SUMIFS

एक्सेल डेवलपर्स के बीच सबसे आम गलती एकल और बहु-शर्त फंक्शन्स के तर्कों (Arguments) के क्रम में भ्रम होना है:

```
एकल SUMIF सिंटैक्स: =SUMIF( जांच_रेंज , शर्त , [योग_रेंज] )
बहु-शर्त SUMIFS सिंटैक्स: =SUMIFS( योग_रेंज , जांच_रेंज1 , शर्त1 , [रेंज2, शर्त2]... )
```

#concept-box(title: "अनिवार्य नियम: SUMIFS में योग_रेंज सबसे पहले आती है", [
  `=SUMIF` में जोड़ने वाली रेंज (`sum_range`) अंत में आती है। परंतु `=SUMIFS` में जोड़ने वाली रेंज *अनिवार्य रूप से सबसे पहले लिखी जाती है*! ऐसा इसलिए है क्योंकि `=SUMIFS` में आगे 127 अलग-अलग शर्तें जोड़ी जा सकती हैं, अतः जिस कॉलम को जोड़ना है उसे प्रारंभ में ही घोषित करना पड़ता है।
])

#pagebreak()

== 14.3 बहु-शर्त एग्रीगेशन्स: COUNTIFS, SUMIFS एवं AVERAGEIFS

बहु-शर्त परिवार कई स्वतंत्र कॉलमों पर एक साथ `AND` लॉजिक का मूल्यांकन करता है:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फंक्शन*], [*कॉर्पोरेट व्यावसायिक प्रश्न*], [*उत्पादन फॉर्मूला उदाहरण*]),
  [`COUNTIFS`], [बैंगलोर से आए ₹ 50,000 से अधिक के ऑर्डर गिनना], [`=COUNTIFS(City_Col, "Bangalore", Amount_Col, ">=50000")`],
  [`SUMIFS`], [दक्षिण क्षेत्र में राहुल द्वारा की गई Q4 बिक्री का योग], [`=SUMIFS(Sales_Col, Zone_Col, "South", Rep_Col, "Rahul", Date_Col, ">=2027-10-01")`],
  [`AVERAGEIFS`], [BCA के उन छात्रों का औसत अंक जिनकी उपस्थिति > 85% है], [`=AVERAGEIFS(Score_Col, Course_Col, "BCA", Attend_Col, ">=0.85")`]
)

#v(2pt)
#formula-specimen(title: "वित्तीय वर्ष दिनांक सीमा SUMIFS", formula: "=SUMIFS(Sales, Dates, \">=2027-04-01\", Dates, \"<=2028-03-31\")", note: "प्रारंभिक और अंतिम तिथि की दोहरी शर्त लगाकर भारतीय वित्तीय वर्ष का कुल राजस्व निकालना।")
#v(2pt)

== 14.4 शर्तों में वाइल्डकार्ड्स (Wildcards) का उपयोग

असंरचित टेक्स्ट डेटाबेस में खोज करते समय वाइल्डकार्ड्स अत्यंत उपयोगी होते हैं:

#table(
  columns: (1fr, 1.2fr, 2.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*वाइल्डकार्ड*], [*प्रतीक*], [*मिलान नियम*], [*कॉर्पोरेट उदाहरण*]),
  [Asterisk], [`*`], [शून्य अथवा अधिक किसी भी अक्षर से मेल खाता है।], [`=COUNTIF(A:A, "*Dell*")` किसी भी Dell उत्पाद को खोजेगा],
  [Question Mark], [`?`], [सटीक रूप से किसी एक अक्षर का मिलान करता है।], [`=SUMIF(B:B, "Model-?4", C:C)` Model-A4, B4 खोजेगा],
  [Tilde (Escape)], [`~`], [वाइल्डकार्ड को निष्क्रिय कर वास्तविक `*` अथवा `?` खोजता है।], [`=COUNTIF(A:A, "*~?*")` प्रश्नचिन्ह युक्त सेल खोजेगा]
)

#pagebreak()

== 14.5 प्रोडक्शन ब्लूप्रिंट: बहु-शाखा क्षेत्रीय बिक्री विश्लेषण

नीचे गतिशील `SUMIFS` और `COUNTIFS` द्वारा मूल्यांकित वास्तविक कॉर्पोरेट लेजर दिया गया है:

#table(
  columns: (0.8fr, 1.3fr, 1.5fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*इनवॉइस*], [*क्षेत्र (Region)*], [*उत्पाद श्रेणी*], [*बिक्री नग*], [*इनवॉइस मूल्य*]),
  [INV-101], [South (Bangalore)], [सर्वर इन्फ्रास्ट्रक्चर], [12], [₹ 54,00,000],
  [INV-102], [North (Delhi)], [नेटवर्किंग स्विचिंग], [45], [₹ 22,50,000],
  [INV-103], [South (Chennai)], [सर्वर इन्फ्रास्ट्रक्चर], [08], [₹ 36,00,000],
  [INV-104], [South (Bangalore)], [साइबर सुरक्षा फ़ायरवॉल], [15], [₹ 18,75,000]
)

#v(2pt)
#formula-specimen(title: "दक्षिण क्षेत्र में सर्वर की कुल बिक्री", formula: "=SUMIFS(E2:E5, B2:B5, \"South*\", C2:C5, \"सर्वर*\")", note: "एस्ट्रिस्क वाइल्डकार्ड (South*) बैंगलोर व चेन्नई दोनों को शामिल कर कुल ₹ 90,00,000 की गणना करता है।")
#v(2pt)

== 14.6 रिक्त, गैर-रिक्त एवं गतिशील शर्तों का प्रबंधन

- *टेक्स्ट वाले भरे हुए सेल गिनना*: `=COUNTIF(A2:A100, "*")` केवल टेक्स्ट युक्त सेलों को गिनता है और संख्याओं को छोड़ देता है।
- *सभी भरे हुए सेल गिनना*: `=COUNTIF(A2:A100, "<>")` खाली न होने वाले सभी सेलों को गिनता है।
- *सेल रेफरेंस वाली गतिशील शर्त*: जब शर्त किसी सेल `H1` में लिखी हो:
  ```
  सही तरीका:   =COUNTIF(D2:D100, ">=" & H1)
  गलत तरीका:   =COUNTIF(D2:D100, ">=H1")   <-- यह शब्द "H1" को अक्षरशः खोजेगा!
  ```

#pagebreak()

== 14.7 प्रोडक्शन ब्लूप्रिंट: कर्मचारी मासिक उपस्थिति रजिस्टर

HR पेरोल शीट्स में उपस्थिति कोड्स की गणना हेतु कंडीशनल एग्रीगेशन का उपयोग किया जाता है:

#table(
  columns: (1fr, 2.2fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 1fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 2.5pt, y: 2pt),
  table.header([*कर्मचारी ID*], [*कर्मचारी का नाम*], [*D1*], [*D2*], [*D3*], [*D4*], [*P संख्या*], [*वेतन देय दिवस*]),
  [EMP-01], [राहुल पटेल], [P], [P], [P], [P], [4], [4.0 दिन],
  [EMP-02], [स्नेहा शर्मा], [P], [A], [P], [HD], [2], [2.5 दिन],
  [EMP-03], [प्रवीण कुमार], [P], [P], [WO], [P], [3], [4.0 दिन]
)

#v(2pt)
#formula-specimen(title: "वेतन देय दिवस फॉर्मूला (पंक्ति 2)", formula: "=COUNTIF(C2:F2, \"P\") + COUNTIF(C2:F2, \"WO\") + (COUNTIF(C2:F2, \"HD\") * 0.5)", note: "पूर्ण उपस्थिति (P) + साप्ताहिक अवकाश (WO) + हाफ डे (HD x 0.5) जोड़कर सटीक पेरोल दिन निकालना।")
#v(2pt)

== 14.8 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "SUMIF और SUMIFS में sum_range का स्थान कहाँ होता है?", ans: "SUMIF में अंत में; SUMIFS में सबसे पहले।")
    #short-qa(num: 2, q: "शर्तों में किसी भी अक्षर श्रृंखला से मेल खाने वाला वाइल्डकार्ड कौन सा है?", ans: "एस्ट्रिस्क (*)।")
    #short-qa(num: 3, q: "COUNTIF में वास्तविक प्रश्नचिन्ह (?) खोजने का तरीका क्या है?", ans: "टिल्डे चिन्ह का प्रयोग: ~?")
    #short-qa(num: 4, q: "तुलनात्मक ऑपरेटर >= को सेल G5 से जोड़ने का सही सिंटैक्स क्या है?", ans: "\">=\" & G5.")
  ],
  [
    #mcq(num: 1, q: "=COUNTIF(A1:A50, \"<>\") क्या परिणाम देता है?", a: "खाली सेल गिनता है", b: "सभी गैर-रिक्त (Non-blank) सेलों को गिनता है", c: "सिंटैक्स एरर देता है", d: "शून्य गिनता है", ans: "B", expl: "\"<>\" का अर्थ है 'रिक्त के बराबर नहीं', अतः यह सभी भरे सेलों की गणना करता है।")
    #mcq(num: 2, q: "कॉलम A में 'North' और कॉलम B में > 100 होने पर कॉलम C को जोड़ने वाला फॉर्मूला कौन सा है?", a: "=SUMIF(A:A, \"North\", C:C, B:B, \">100\")", b: "=SUMIFS(C:C, A:A, \"North\", B:B, \">100\")", c: "=SUMIF(C:C, A:A, \"North\")", d: "=TOTAL(C:C)", ans: "B", expl: "SUMIFS बहु-शर्तों को संभालता है और जोड़ने वाली रेंज (C:C) सबसे पहले लेता है।")
    #mcq(num: 3, q: "=COUNTIF(B2:B50, \">H1\") सेल H1 के मान का उपयोग करने में असफल क्यों होता है?", a: "H1 छोटा लिखा है", b: "सेल पता कोट्स के भीतर फंस गया है और अक्षरशः 'H1' के रूप में पढ़ा जा रहा है", c: "COUNTIF > नहीं कर सकता", d: "रेंज गलत है", ans: "B", expl: "सेल पते को कोट्स से बाहर ampersand द्वारा जोड़ना अनिवार्य है: \">=\"&H1।")
  ]
)

#v(2pt)

#spotlight-box("2027 हाई-परफॉर्मेंस वेक्टर एग्रीगेशन", [
  एक्सेल 365 आधुनिक CPU की SIMD वेक्टर गणना का उपयोग करता है। 20 लाख पंक्तियों वाले विशाल डेटाबेस में बहु-शर्त SUMIFS क्वेरी बिना किसी विलंब के मात्र 12 मिलीसेकंड में परिणाम प्रस्तुत करती है।
])
"""

    with open(os.path.join(eng_dir, "chapter-14.typ"), "w", encoding="utf-8") as f:
        f.write(ch14_en)
    with open(os.path.join(hi_dir, "chapter-14.typ"), "w", encoding="utf-8") as f:
        f.write(ch14_hi)

    # =========================================================================
    # CHAPTER 15: Logical Decision Engines & Error Trapping (4 Pages)
    # =========================================================================
    ch15_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 15]
= Logical Decision Engines, Modern IFS, SWITCH & Error Trapping

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Algorithmic decision-making transforms passive spreadsheets into dynamic expert systems. From multi-tiered employee payroll tax brackets to grade classifications, mastering Boolean logic (`AND`, `OR`, `NOT`), nested logic, the modern `IFS` and `SWITCH` functions, and defensive error trapping (`IFERROR`) is essential.
]

#v(2pt)

== 15.1 The Foundational IF Function Architecture

The `=IF` function evaluates a condition and branches computational execution down one of two paths:

```
Syntax: =IF( logical_test , value_if_true , [value_if_false] )
```

- `logical_test`: Any expression evaluating to boolean `TRUE` or `FALSE` (e.g., `Score >= 35`).
- `value_if_true`: Returned if test evaluates to `TRUE`. Can return a constant (`"Pass"`), a calculation (`Salary * 0.10`), or another nested function.
- `value_if_false`: Returned if test evaluates to `FALSE`. If omitted and test fails, Excel returns literal `FALSE`.

#v(2pt)
#formula-specimen(title: "ACADEMIC PASS / FAIL LOGICAL EVALUATOR", formula: "=IF(Score_Cell >= 35, \"PASS\", \"FAIL\")", note: "Enforces 35% minimum passing threshold across examination registers.")
#v(2pt)

== 15.2 Boolean Compound Operators: AND, OR & NOT

Complex business policies rarely hinge on a single metric; they require compound conditions:

#table(
  columns: (1fr, 1.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Operator*], [*Logical Evaluation Rule*], [*Enterprise Production Formula Specimen*]),
  [`AND`], [Returns `TRUE` strictly if *ALL* arguments are true.], [`=IF(AND(Attendance>=0.85, Marks>=75), "Honors", "Standard")`],
  [`OR`], [Returns `TRUE` if *ANY ONE* argument evaluates to true.], [`=IF(OR(Exp>=5, Certification="CCNA"), "Shortlist", "Reject")`],
  [`NOT`], [Inverts boolean state (`TRUE` -> `FALSE`; `FALSE` -> `TRUE`).], [`=IF(NOT(Credit_Rating="Default"), "Authorize Loan", "Deny")`]
)

#concept-box(title: "CRITICAL OPERATIONAL TIP: AND INSIDE IF", [
  Never write `=IF(A1 > 50 AND B1 > 50, ...)`—this is invalid Excel syntax! In Excel, `AND` and `OR` are functions that precede their arguments: `=IF(AND(A1>50, B1>50), ...)`.
])

#pagebreak()

== 15.3 The Death of Nested IF: Modern IFS Function

Historically, handling multi-tier grading required nightmare nested formulas with 7 closing parentheses:

```
Legacy Nested IF:
=IF(E2>=90, "A+", IF(E2>=80, "A", IF(E2>=70, "B", IF(E2>=60, "C", IF(E2>=50, "D", "Fail")))))
```

In Office 365, Microsoft introduced the modern `=IFS` function, evaluating condition-value pairs sequentially without nesting:

```
Modern IFS Syntax:
=IFS( logical_test1, value1 , [logical_test2, value2]... )
```

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Marks Range*], [*Grade Award*], [*Modern IFS Formula Snippet*]),
  [90% to 100%], [Grade A+ (Distinction)], [`E2 >= 90, "A+"`],
  [80% to 89%], [Grade A (Excellent)], [`E2 >= 80, "A"`],
  [70% to 79%], [Grade B (Good)], [`E2 >= 70, "B"`],
  [60% to 69%], [Grade C (Satisfactory)], [`E2 >= 60, "C"`],
  [Under 50%], [Grade F (Needs Improvement)], [`TRUE, "F" (Catch-all default argument)`]
)

#v(2pt)
#formula-specimen(title: "THE IFS CATCH-ALL DEFAULT ARGUMENT", formula: "=IFS(Score>=90, \"A\", Score>=60, \"B\", TRUE, \"Fail\")", note: "Since IFS lacks a dedicated 'else' parameter, appending TRUE as the final test creates a catch-all safety net.")
#v(2pt)

== 15.4 The SWITCH Function: Clean Exact Value Matching

When mapping discrete integer codes (e.g., Department IDs or Regional Office codes) to text names, `=SWITCH` eliminates repetitive condition testing:

```
Syntax: =SWITCH( expression , val1, result1 , [val2, result2]... , [default] )
```

*Enterprise Example*:
`=SWITCH(Dept_Code, 101, "Engineering", 102, "Human Resources", 103, "Finance", "Unknown Department")`

#pagebreak()

== 15.5 Enterprise Error Diagnostics & Defensive Trapping: IFERROR

When formulas encounter invalid operations (e.g., division by zero or unmatched lookups), Excel halts execution and displays cryptic error tokens:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Error Code*], [*Root Engineering Cause*], [*Enterprise Resolution / Defensive Trap*]),
  [`#DIV/0!`], [Formula attempts division by zero or an empty cell.], [Trap via `=IFERROR(Revenue / Units, 0)`.],
  [`#N/A`], [Lookup function fails to find exact target value.], [Trap via `=IFNA(XLOOKUP(...), "Not Found")`.],
  [`#VALUE!`], [Wrong data type; mathematical operation performed on text.], [Audit numeric formatting; clean trailing spaces via `TRIM`.],
  [`#REF!`], [Referenced cell or sheet was deleted permanently.], [Undo deletion or re-anchor broken cell vectors.],
  [`#NAME?`], [Typo in function name (e.g., `=SUMM(A1:A10)`).], [Correct misspelled formula keyword.],
  [`#NUM!`], [Number too large/small, or invalid math (e.g. square root of -1).], [Check iterative calculation boundaries.]
)

#v(2pt)
#formula-specimen(title: "DEFENSIVE PRODUCTION WRAPPER", formula: "=IFERROR(Dangerous_Calculation_Formula, \"Alternative Value or 0\")", note: "Prevents unsightly error codes from cascading through executive presentation dashboards.")
#v(2pt)

== 15.6 Information Functions: ISBLANK, ISNUMBER & ISTEXT

Information functions evaluate cell contents and return boolean `TRUE` or `FALSE`:
- `=ISBLANK(cell)`: Validates whether a cell is strictly unpopulated.
- `=ISNUMBER(cell)`: Validates whether data is truly numeric (catches numbers accidentally stored as text).
- `=ISTEXT(cell)`: Validates textual string values.

#pagebreak()

== 15.7 Production Blueprint: Corporate Income Tax Bracket Computation

Below is the computational model for corporate employee tax slab deduction utilizing `IFS`:

#table(
  columns: (1.2fr, 1.8fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Taxable Income Bracket*], [*Applicable Tax Rate*], [*Slab Base Tax*], [*Production Formula Segment*]),
  [Up to ₹ 3,00,000], [0% (Nil)], [₹ 0], [`Taxable_Income <= 300000, 0`],
  [₹ 3,00,001 to ₹ 7,00,000], [5% on excess over 3L], [₹ 0], [`Taxable_Income <= 700000, (Taxable_Income - 300000) * 0.05`],
  [₹ 7,00,001 to ₹ 10,00,000], [10% + ₹ 20,000], [₹ 20,000], [`Taxable_Income <= 1000000, 20000 + (Taxable_Income - 700000) * 0.10`],
  [Above ₹ 10,00,000], [20% + ₹ 50,000], [₹ 50,000], [`TRUE, 50000 + (Taxable_Income - 1000000) * 0.20`]
)

#v(2pt)
#formula-specimen(title: "MASTER TAX COMPUTATION FORMULA", formula: "=IFS(C2<=300000, 0, C2<=700000, (C2-300000)*0.05, C2<=1000000, 20000+(C2-700000)*0.10, TRUE, 50000+(C2-1000000)*0.20)", note: "Flawlessly computes multi-tier progressive taxation without requiring VBA macros.")
#v(2pt)

== 15.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "How do you create a catch-all default condition at the end of an IFS function?", ans: "Add TRUE as the final condition: TRUE, \"Default Value\".")
    #short-qa(num: 2, q: "Which function traps division-by-zero errors and replaces them with a zero?", ans: "IFERROR function.")
    #short-qa(num: 3, q: "What causes the #NAME? error in an Excel worksheet?", ans: "Misspelled function name or unquoted text string.")
    #short-qa(num: 4, q: "Which logical function returns TRUE only if all conditions are satisfied?", ans: "AND function.")
  ],
  [
    #mcq(num: 1, q: "What does formula =IF(AND(10>5, 20<15), \"Yes\", \"No\") evaluate to?", a: "Yes", b: "No", c: "TRUE", d: "#VALUE!", ans: "B", expl: "AND requires ALL tests to be true; since 20<15 is false, the entire AND fails, returning 'No'.")
    #mcq(num: 2, q: "What error appears when a referenced cell is permanently deleted from the grid?", a: "#NULL!", b: "#REF!", c: "#N/A", d: "#DIV/0!", ans: "B", expl: "#REF! signals an invalid coordinate reference caused by deleted rows or columns.")
    #mcq(num: 3, q: "Which function is optimized for mapping exact discrete integer codes without repetitive IF tests?", a: "CHOOSE", b: "SWITCH", c: "CONVERT", d: "MATCH", ans: "B", expl: "=SWITCH evaluates a single expression against a sequence of values and results.")
  ]
)

#v(2pt)

#spotlight-box("2027 FORMULA SELF-HEALING ENGINES", [
  Excel 365 Copilot AI introduces automated semantic formula repair. When a user accidentally writes `=VLOOKUP` targeting a shifted column or introduces a `#REF!` error by deleting a subtotal row, Copilot diagnoses the broken dependency graph and proposes a corrected formula.
])
"""

    ch15_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#059669"))[भाग 2: माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज मास्टरी · अध्याय 15]
= लॉजिकल डिसीजन इंजन, मॉडर्न IFS, SWITCH एवं एरर ट्रैपिंग

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  तार्किक निर्णय क्षमता सामान्य स्प्रेडशीट को गतिशील विशेषज्ञ प्रणाली में बदल देती है। कर्मचारियों के वेतन टैक्स स्लैब, मार्कशीट ग्रेड निर्धारण, बूलियन लॉजिक (`AND`, `OR`, `NOT`), नेस्टेड फॉर्मूलों के विकल्प के रूप में आधुनिक `IFS` और `SWITCH` फंक्शन, तथा एरर ट्रैपिंग (`IFERROR`) में दक्षता हासिल करना प्रत्येक विश्लेषक हेतु अनिवार्य है।
]

#v(2pt)

== 15.1 मूलभूत IF फंक्शन की संरचना

`=IF` फंक्शन किसी शर्त का परीक्षण करता है और परिणाम सत्य अथवा असत्य होने पर दो अलग-अलग मार्ग चुनता है:

```
सिंटैक्स: =IF( तार्किक_शर्त , सत्य_होने_पर_मान , [असत्य_होने_पर_मान] )
```

- `तार्किक_शर्त`: कोई भी अभिव्यक्ति जो `TRUE` अथवा `FALSE` लौटाए (उदा. `अंक >= 35`)।
- `सत्य_होने_पर_मान`: शर्त पूरी होने पर लौटाया जाने वाला मान (उदा. `"PASS"` अथवा कमीशन गणना)।
- `असत्य_होने_पर_मान`: शर्त पूरी न होने पर लौटाया जाने वाला मान (उदा. `"FAIL"`)। इसे न लिखने पर एक्सेल literal `FALSE` दिखाता है।

#v(2pt)
#formula-specimen(title: "परीक्षा पास/फेल लॉजिकल फॉर्मूला", formula: "=IF(Score_Cell >= 35, \"PASS\", \"FAIL\")", note: "परीक्षा रजिस्टर में 35% न्यूनतम उत्तीर्णांक की शर्त लागू करता है।")
#v(2pt)

== 15.2 बूलियन संयुक्त ऑपरेटर: AND, OR एवं NOT

व्यावसायिक निर्णय अक्सर एक से अधिक शर्तों के समन्वय पर निर्भर करते हैं:

#table(
  columns: (1fr, 1.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*ऑपरेटर*], [*तार्किक मूल्यांकन नियम*], [*कॉर्पोरेट उत्पादन फॉर्मूला उदाहरण*]),
  [`AND`], [केवल तब `TRUE` देता है जब *सभी* शर्तें सत्य हों।], [`=IF(AND(उपस्थिति>=0.85, अंक>=75), "सम्मान", "सामान्य")`],
  [`OR`], [यदि *कोई एक भी* शर्त सत्य हो तो `TRUE` देता है।], [`=IF(OR(अनुभव>=5, प्रमाणन="CCNA"), "चयनित", "अस्वीकृत")`],
  [`NOT`], [बूलियन स्थिति को उलट देता है (`TRUE` को `FALSE` में)।], [`=IF(NOT(क्रेडिट_रेटिंग="डिफ़ॉल्ट"), "ऋण स्वीकृत", "अस्वीकृत")`]
)

#concept-box(title: "अत्यंत महत्वपूर्ण सिंटैक्स नियम: IF के भीतर AND का प्रयोग", [
  एक्सेल में `=IF(A1 > 50 AND B1 > 50, ...)` कभी न लिखें—यह अवैध है! एक्सेल में `AND` और `OR` फंक्शन होते हैं जो अपने तर्कों से पहले आते हैं: `=IF(AND(A1>50, B1>50), ...)`.
])

#pagebreak()

== 15.3 नेस्टेड IF की विदाई: आधुनिक IFS फंक्शन

पहले बहुस्तरीय ग्रेडिंग निकालने हेतु 7 कोष्ठकों वाले जटिल नेस्टेड IF लिखने पड़ते थे:

```
पुराना नेस्टेड IF:
=IF(E2>=90, "A+", IF(E2>=80, "A", IF(E2>=70, "B", IF(E2>=60, "C", IF(E2>=50, "D", "Fail")))))
```

ऑफिस 365 में माइक्रोसॉफ्ट ने आधुनिक `=IFS` फंक्शन पेश किया, जो बिना नेस्टिंग के क्रमबद्ध रूप से शर्तों की जांच करता है:

```
मॉडर्न IFS सिंटैक्स:
=IFS( शर्त1, मान1 , [शर्त2, मान2]... )
```

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*प्रतिशत अंक सीमा*], [*प्रदत्त ग्रेड*], [*आधुनिक IFS फॉर्मूला खंड*]),
  [90% से 100%], [Grade A+ (विशिष्ट योग्यता)], [`E2 >= 90, "A+"`],
  [80% से 89%], [Grade A (उत्कृष्ट)], [`E2 >= 80, "A"`],
  [70% से 79%], [Grade B (उत्तम)], [`E2 >= 70, "B"`],
  [60% से 69%], [Grade C (संतोषजनक)], [`E2 >= 60, "C"`],
  [50% से कम], [Grade F (अनुत्तीर्ण)], [`TRUE, "F" (डिफ़ॉल्ट सुरक्षा नियम)`]
)

#v(2pt)
#formula-specimen(title: "IFS डिफ़ॉल्ट कैच-ऑल नियम", formula: "=IFS(Score>=90, \"A\", Score>=60, \"B\", TRUE, \"Fail\")", note: "IFS में अलग से 'Else' नहीं होता; अंत में TRUE जोड़कर अंतिम डिफ़ॉल्ट मान सेट किया जाता है।")
#v(2pt)

== 15.4 SWITCH फंक्शन: सटीक मान मिलान

संख्यात्मक कोड्स (जैसे विभाग कोड 101, 102) को सीधे नामों में बदलने हेतु `=SWITCH` फंक्शन बार-बार IF लिखने की आवश्यकता समाप्त करता है:

```
सिंटैक्स: =SWITCH( व्यंजक , मान1, परिणाम1 , [मान2, परिणाम2]... , [डिफ़ॉल्ट] )
```

*कॉर्पोरेट उदाहरण*:
`=SWITCH(Dept_Code, 101, "इंजीनियरिंग", 102, "मानव संसाधन", 103, "वित्त", "अज्ञात विभाग")`

#pagebreak()

== 15.5 कॉर्पोरेट एरर डायग्नोस्टिक्स एवं रक्षात्मक ट्रैपिंग: IFERROR

जब फॉर्मूले में कोई अवैध गणना होती है (जैसे शून्य से भाग देना), तो एक्सेल स्क्रीन पर भयानक एरर कोड्स दिखाता है:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*एरर कोड*], [*मूल तकनीकी कारण*], [*कॉर्पोरेट समाधान एवं सुरक्षा*]),
  [`#DIV/0!`], [शून्य अथवा खाली सेल से भाग देने का प्रयास।], [`=IFERROR(राजस्व / मात्रा, 0)` लगाएं।],
  [`#N/A`], [लुकअप फंक्शन को तालिका में मान नहीं मिला।], [`=IFNA(XLOOKUP(...), "उपलब्ध नहीं")` लगाएं।],
  [`#VALUE!`], [गलत डेटा प्रकार; टेक्स्ट को गणितीय रूप से जोड़ना।], [कस्टम फॉर्मेटिंग सुधारें; `TRIM` से स्पेस हटाएं।],
  [`#REF!`], [फॉर्मूले से जुड़ा सेल अथवा शीट हमेशा के लिए डिलीट हो गई।], [डिलीशन पूर्ववत करें अथवा सही सेल जोड़ें।],
  [`#NAME?`], [फंक्शन के नाम में स्पेलिंग की गलती (जैसे `=SUMM(...)`)।], [फंक्शन का सही नाम लिखें।],
  [`#NUM!`], [संख्या बहुत बड़ी/छोटी है या अवैध गणित (ऋणात्मक का वर्गमूल)।], [गणना सीमा की जांच करें।]
)

#v(2pt)
#formula-specimen(title: "सुरक्षित उत्पादन फॉर्मूला आवरण", formula: "=IFERROR(जोखिम_युक्त_फॉर्मूला, \"वैकल्पिक सुरक्षित मान अथवा 0\")", note: "डैशबोर्ड पर भद्दी एरर्स दिखने से रोकता है।")
#v(2pt)

== 15.6 सूचना फंक्शन्स: ISBLANK, ISNUMBER एवं ISTEXT

सेल की प्रकृति की जांच करके `TRUE` अथवा `FALSE` लौटाते हैं:
- `=ISBLANK(सेल)`: जांचता है कि क्या सेल पूरी तरह खाली है।
- `=ISNUMBER(सेल)`: जांचता है कि डेटा वास्तव में संख्या है या टेक्स्ट के रूप में सहेजा गया है।
- `=ISTEXT(सेल)`: टेक्स्ट मानों की पहचान करता है।

#pagebreak()

== 15.7 प्रोडक्शन ब्लूप्रिंट: कॉर्पोरेट आयकर स्लैब गणना

नीचे कर्मचारियों के आयकर स्लैब की गणना हेतु `IFS` द्वारा निर्मित मॉडल दिया गया है:

#table(
  columns: (1.2fr, 1.8fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*कर योग्य आय स्लैब*], [*लागू आयकर दर*], [*आधार टैक्स*], [*उत्पादन फॉर्मूला खंड*]),
  [₹ 3,00,000 तक], [0% (शून्य)], [₹ 0], [`कर_योग्य_आय <= 300000, 0`],
  [₹ 3,00,001 से ₹ 7,00,000], [3 लाख से अधिक पर 5%], [₹ 0], [`कर_योग्य_आय <= 700000, (आय - 300000) * 0.05`],
  [₹ 7,00,001 से ₹ 10,00,000], [10% + ₹ 20,000], [₹ 20,000], [`कर_योग्य_आय <= 1000000, 20000 + (आय - 700000) * 0.10`],
  [₹ 10,00,000 से अधिक], [20% + ₹ 50,000], [₹ 50,000], [`TRUE, 50000 + (आय - 1000000) * 0.20`]
)

#v(2pt)
#formula-specimen(title: "मास्टर आयकर गणना फॉर्मूला", formula: "=IFS(C2<=300000, 0, C2<=700000, (C2-300000)*0.05, C2<=1000000, 20000+(C2-700000)*0.10, TRUE, 50000+(C2-1000000)*0.20)", note: "बिना किसी VBA मैक्रो के प्रगतिशील बहु-स्लैब टैक्स की सटीक गणना करता है।")
#v(2pt)

== 15.8 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "IFS फंक्शन के अंत में डिफ़ॉल्ट स्थिति बनाने हेतु क्या जोड़ते हैं?", ans: "अंत में TRUE, \"डिफ़ॉल्ट मान\" जोड़ते हैं।")
    #short-qa(num: 2, q: "शून्य से भाग देने वाली एरर को शून्य में बदलने वाला फंक्शन कौन सा है?", ans: "IFERROR फंक्शन।")
    #short-qa(num: 3, q: "एक्सेल में #NAME? एरर आने का मुख्य कारण क्या है?", ans: "फंक्शन के नाम में स्पेलिंग की गलती अथवा बिना कोट्स का टेक्स्ट।")
    #short-qa(num: 4, q: "केवल तभी TRUE लौटाने वाला फंक्शन कौन सा है जब सभी शर्तें सत्य हों?", ans: "AND फंक्शन।")
  ],
  [
    #mcq(num: 1, q: "=IF(AND(10>5, 20<15), \"Yes\", \"No\") का मान क्या होगा?", a: "Yes", b: "No", c: "TRUE", d: "#VALUE!", ans: "B", expl: "AND में सभी शर्तें सत्य होनी चाहिए; चूंकि 20<15 असत्य है, अतः परिणाम 'No' आएगा।")
    #mcq(num: 2, q: "जब वर्कशीट से कोई संदर्भित सेल हमेशा के लिए डिलीट हो जाता है तो कौन सी एरर आती है?", a: "#NULL!", b: "#REF!", c: "#N/A", d: "#DIV/0!", ans: "B", expl: "#REF! सेल का पता नष्ट होने पर प्रदर्शित होता है।")
    #mcq(num: 3, q: "संख्यात्मक कोड्स को सीधे टेक्स्ट नामों से जोड़ने हेतु कौन सा आधुनिक फंक्शन अनुकूलित है?", a: "CHOOSE", b: "SWITCH", c: "CONVERT", d: "MATCH", ans: "B", expl: "=SWITCH एक ही व्यंजक की तुलना कई मानों से करके तुरंत परिणाम देता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 फॉर्मूला स्वतः सुधार इंजन", [
  एक्सेल 365 कोपायलट AI फॉर्मूला रिपेयर तकनीक से लैस है। यदि कोई उपयोगकर्ता गलती से टूटी हुई रेंज या गलत स्पेलिंग लिखता है, तो कोपायलट त्रुटि को पहचान कर सही फॉर्मूले का सुझाव देता है।
])
"""

    with open(os.path.join(eng_dir, "chapter-15.typ"), "w", encoding="utf-8") as f:
        f.write(ch15_en)
    with open(os.path.join(hi_dir, "chapter-15.typ"), "w", encoding="utf-8") as f:
        f.write(ch15_hi)

    # =========================================================================
    # CHAPTER 16: Dynamic Arrays & Modern Lookups: XLOOKUP (5 Pages)
    # =========================================================================
    ch16_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 16]
= Dynamic Arrays, The Spill Revolution & Modern Lookups: XLOOKUP

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  The introduction of Dynamic Array calculation engines represents the most profound architectural transformation in Microsoft Excel's 40-year history. Formulas now return multi-cell results that "spill" automatically across adjoining grids. Coupled with the complete retirement of fragile legacy VLOOKUP in favor of modern XLOOKUP, this chapter details the modern lookup and array manipulation paradigm.
]

#v(2pt)

== 16.1 The Dynamic Array Revolution & The Spill Range Operator (`#`)

In legacy Excel (pre-2021), writing a formula that returned multiple values required highlighting a fixed grid range and pressing `Ctrl + Shift + Enter` to instantiate array braces `{ }`.

*The Modern Excel 365 Reality*:
- A formula entered into a single cell (e.g., `=UNIQUE(A2:A100)`) evaluates dynamically and *spills* into as many adjacent rows and columns as required to display the full dataset.
- The boundary of spilled results is indicated by a thin blue border called the *Spill Border*.
- *The Spill Range Operator (`#`)*: If cell `E2` contains a dynamic array formula spilling down to `E20`, referencing `E2#` dynamically captures the *entire spilled vector*! If the source data expands and `E2` spills down to `E50`, `E2#` automatically expands in real-time!

#v(2pt)
#formula-specimen(title: "DYNAMIC ARRAY SPILL RANGE NOTATION", formula: "=SUM(E2#)   |   =COUNTA(E2#)", note: "The hash (#) operator dynamically tracks the variable boundary of any spilled array calculation.")
#v(2pt)

== 16.2 Anatomy of the `#SPILL!` Error & Resolution Protocol

When a dynamic array formula attempts to spill its results, but one or more target cells in the spill path are obstructed by existing text, formatting, or merged cells, Excel throws the `#SPILL!` error:

- *Root Causes*:
  1. *Cell Collision*: A user typed a rogue character (even an invisible space) into a cell in the spill path.
  2. *Merged Cells*: Dynamic arrays cannot spill across merged cells.
  3. *Table Boundary*: Dynamic arrays cannot spill inside official Excel Tables (`Ctrl + T`).
- *Resolution*: Select the formula cell. Excel illuminates the intended spill boundary with a dotted line. Clear the obstructing cells, and the formula instantly populates!

#pagebreak()

== 16.3 The Complete Retirement of VLOOKUP & HLOOKUP

For decades, `VLOOKUP` was the staple of spreadsheet data querying. However, in enterprise computing, `VLOOKUP` suffers from fatal structural vulnerabilities:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*VLOOKUP Vulnerability*], [*Technical Root Cause*], [*XLOOKUP Modern Superiority*]),
  [Hardcoded Column Index], [Requires hardcoded integer (e.g. `col_index = 4`). Inserting a new column corrupts the formula silently!], [Uses vector ranges (`return_array`). Inserting columns shifts references automatically.],
  [Cannot Look to the Left], [Lookup vector must strictly be the first leftmost column of table array.], [Can look left, right, up, or down freely.],
  [Dangerous Approximate Default], [Defaults to Approximate Match (`TRUE`) if 4th argument omitted, returning wrong data!], [Defaults strictly to *Exact Match*.],
  [No Native Error Trapping], [Returns `#N/A` if not found; requires wrapping inside bulky `IFERROR`], [Has built-in `[if_not_found]` argument.],
  [Cannot Search in Reverse], [Searches strictly top-to-bottom.], [Supports bottom-to-top reverse search (`search_mode = -1`).]
)

#v(2pt)
#ribbon-specimen(path: "Formulas > Lookup & Reference > XLOOKUP", command: "Modern 6-Parameter Data Querying Engine", shortcut: "Alt + M + O + X")
#v(2pt)

== 16.4 The 6-Parameter Modern XLOOKUP Masterclass

The `=XLOOKUP` function consolidates VLOOKUP, HLOOKUP, LOOKUP, and INDEX/MATCH into a single, high-performance engine:

```
Syntax:
=XLOOKUP( lookup_value , lookup_array , return_array , [if_not_found] , [match_mode] , [search_mode] )
```

#table(
  columns: (1.2fr, 1.2fr, 3.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Parameter*], [*Mandatory?*], [*Operational Engineering Mechanics & Options*]),
  [`lookup_value`], [Yes], [The search key (e.g. Employee ID, Stock SKU, Customer Name).],
  [`lookup_array`], [Yes], [Single column or row vector where the search key is located.],
  [`return_array`], [Yes], [Column or row vector containing the data values to retrieve.],
  [`[if_not_found]`], [Optional], [Custom fallback value if match fails (e.g. `"Not Found"` or `0`). Eliminates IFERROR!],
  [`[match_mode]`], [Optional], [`0` = Exact match (Default); `-1` = Exact or next smaller; `1` = Exact or next larger; `2` = Wildcard match.],
  [`[search_mode]`], [Optional], [`1` = First-to-last (Default); `-1` = Last-to-first (Reverse search); `2` = Binary sort ascending; `-2` = Binary sort descending.]
)

#pagebreak()

== 16.5 Advanced XLOOKUP: Two-Way Matrix Lookup & Wildcards

- *Two-Way 2D Grid Lookup (Replacing INDEX/MATCH)*: To locate a value at the dynamic intersection of a specific Employee row and a specific Month column, nest two XLOOKUP functions:
  ```
  =XLOOKUP( Target_Employee , Employee_List , XLOOKUP( Target_Month , Month_Headers , Data_Matrix ) )
  ```
  The inner XLOOKUP identifies the target month column vector; the outer XLOOKUP extracts the specific employee's value!
- *Wildcard Matching (`match_mode = 2`)*:
  ```
  =XLOOKUP("*Dell R760*", Equipment_Descriptions, Unit_Prices, "Not Stocked", 2)
  ```
- *Reverse Bottom-to-Top Search (`search_mode = -1`)*: When retrieving the *most recent* transaction in an append-only sales log:
  ```
  =XLOOKUP(Customer_ID, Log_CustomerID, Log_Amount, 0, 0, -1)
  ```

#v(2pt)
#formula-specimen(title: "TWO-WAY MATRIX 2D LOOKUP SPECIMEN", formula: "=XLOOKUP(H2, A2:A50, XLOOKUP(H3, B1:F1, B2:F50))", note: "Row key in H2, Column header key in H3. Evaluates 2D coordinates in O(1) time.")
#v(2pt)

== 16.6 Legacy Fallback Architecture: INDEX + MATCH

When authoring models that must maintain backwards compatibility with Excel 2013/2016 machines running on legacy corporate workstations, enterprise standards mandate `INDEX` + `MATCH`:

```
Syntax: =INDEX( return_range , MATCH( lookup_value , lookup_range , 0 ) )
```

- `=MATCH(val, range, 0)` scans the lookup range and returns the relative row position as an integer (e.g. Row 14).
- `=INDEX(range, row_num)` extracts the data residing at row 14 of the return vector.

#pagebreak()

== 16.7 The Dynamic Array Function Suite: FILTER, UNIQUE, SORT & SEQUENCE

Modern Excel 365 includes a native database querying and array manipulation suite:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function*], [*Syntax*], [*Enterprise Operational Capabilities*]),
  [`FILTER`], [`=FILTER(array, include, [if_empty])`], [Live dynamic query extraction. Extracts all records matching multi-condition criteria without SQL or macros!],
  [`UNIQUE`], [`=UNIQUE(array, [by_col], [exactly_once])`], [Instant programmatic deduplication. Spills unique list of vendors, clients, or product categories.],
  [`SORT`], [`=SORT(array, [sort_index], [sort_order])`], [Alphabetizes or sorts data dynamically. `sort_order = 1` (Ascending) or `-1` (Descending).],
  [`SORTBY`], [`=SORTBY(array, by_array1, [order1]...)`], [Sorts target dataset based on the values of an independent parallel column.],
  [`SEQUENCE`], [`=SEQUENCE(rows, [columns], [start], [step])`], [Generates an arithmetic sequence of numbers (e.g. `=SEQUENCE(100, 1, 1001, 1)` builds 100 serial IDs).]
)

#v(2pt)
#formula-specimen(title: "ENTERPRISE LIVE FILTER & SORT PIPELINE", formula: "=SORT(FILTER(Staff_Table, (Department_Col=\"IT\") * (Salary_Col>=75000), \"No Matches\"), 3, -1)", note: "Dynamically extracts and descendingly sorts high-earning IT personnel in real-time.")
#v(2pt)

== 16.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What symbol references the entire spilled range of a dynamic array formula in cell B2?", ans: "B2# (Hash operator).")
    #short-qa(num: 2, q: "What error appears when text obstructs the cells where a dynamic array needs to spill?", ans: "#SPILL! error.")
    #short-qa(num: 3, q: "What is the default match mode in XLOOKUP?", ans: "Exact match (match_mode = 0).")
    #short-qa(num: 4, q: "Which function dynamically extracts unique, deduplicated values from a list?", ans: "UNIQUE function.")
  ],
  [
    #mcq(num: 1, q: "Why is XLOOKUP architecturally immune to column insertion errors that break VLOOKUP?", a: "It uses colors", b: "It references actual range vectors (return_array) rather than a hardcoded column integer", c: "It converts data to PDF", d: "It requires macros", ans: "B", expl: "VLOOKUP breaks because col_index is a static number; XLOOKUP references vector ranges that shift dynamically.")
    #mcq(num: 2, q: "In XLOOKUP, how do you search from bottom-to-top to find the most recent transaction?", a: "Set match_mode to -1", b: "Set search_mode to -1", c: "Use REVERSE function", d: "Sort table descending", ans: "B", expl: "search_mode = -1 instructs XLOOKUP to perform a bottom-up reverse vector scan.")
    #mcq(num: 3, q: "Which formula dynamically extracts all employees in the 'Sales' department without VBA?", a: "=FIND(Staff, \"Sales\")", b: "=FILTER(Staff, Department=\"Sales\", \"None\")", c: "=SEARCH(Staff, \"Sales\")", d: "=INDEX(Staff, \"Sales\")", ans: "B", expl: "=FILTER evaluates a boolean inclusion array and spills all matching rows.")
  ]
)

#v(2pt)

#spotlight-box("2027 PYTHON IN EXCEL INTEGRATION", [
  Excel 365 natively executes embedded Python (`=PY()`) running within secure Azure Cloud containers. Analysts can pass dynamic array outputs (e.g. `=PY(xl("A1#").describe())`) directly into Pandas dataframes and Scikit-learn statistical models, returning rich interactive plots back into the worksheet grid.
])
"""

    ch16_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#059669"))[भाग 2: माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज मास्टरी · अध्याय 16]
= डायनामिक एरे, स्पिल क्रांति एवं मॉडर्न लुकअप: XLOOKUP

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  डायनामिक एरे (Dynamic Array) गणना इंजन की शुरुआत एक्सेल के 40-वर्षीय इतिहास का सबसे बड़ा तकनीकी बदलाव है। अब एकल सेल में लिखा गया फॉर्मूला स्वतः कई सेलों में "स्पिल" (Spill) होकर परिणाम दिखाता है। पुराने व कमजोर VLOOKUP के स्थान पर आधुनिक XLOOKUP की पूर्ण स्थापना इस अध्याय का मुख्य केंद्र है।
]

#v(2pt)

== 16.1 डायनामिक एरे क्रांति एवं स्पिल ऑपरेटर (`#`)

पुराने एक्सेल में बहु-मान लौटाने वाले फॉर्मूलों हेतु रेंज चुनकर `Ctrl + Shift + Enter` दबाना पड़ता था।

*एक्सेल 365 का आधुनिक स्वरूप*:
- किसी एकल सेल में लिखा गया फॉर्मूला (जैसे `=UNIQUE(A2:A100)`) डेटा के अनुसार नीचे के जितने चाहे सेलों में स्वतः फैलकर (*Spill* होकर) परिणाम प्रस्तुत करता है।
- स्पिल क्षेत्र के चारों ओर एक पतली नीली बॉर्डर दिखाई देती है।
- *द स्पिल ऑपरेटर (`#`)*: यदि सेल `E2` में लिखा फॉर्मूला नीचे `E20` तक स्पिल हो रहा है, तो `E2#` लिखने से वह *पूरी स्पिल रेंज* को स्वतः पकड़ लेता है! यदि डेटा बढ़कर `E50` तक चला जाए, तो `E2#` अपने आप 50 पंक्तियों को शामिल कर लेगा!

#v(2pt)
#formula-specimen(title: "डायनामिक एरे स्पिल रेंज संकेतक", formula: "=SUM(E2#)   |   =COUNTA(E2#)", note: "हैश (#) चिन्ह गतिशील रूप से फैलने वाले एरे की सीमाओं को स्वतः ट्रैक करता है।")
#v(2pt)

== 16.2 `#SPILL!` एरर का विश्लेषण एवं समाधान

जब कोई डायनामिक एरे फॉर्मूला फैलना चाहता है, परंतु उसके रास्ते में किसी सेल में पहले से कोई टेक्स्ट, स्पेस अथवा मर्ज सेल मौजूद हो, तो एक्सेल `#SPILL!` एरर दिखाता है:

- *मूल कारण*:
  1. *सेल अवरोध*: रास्ते के किसी सेल में कोई पुराना अक्षर अथवा खाली स्पेस लिखा होना।
  2. *मर्ज किए गए सेल*: डायनामिक एरे मर्ज किए गए सेलों के आर-पार नहीं फैल सकते।
  3. *एक्सेल टेबल्स*: डायनामिक एरे आधिकारिक एक्सेल टेबल (`Ctrl + T`) के भीतर स्पिल नहीं हो सकते।
- *समाधान*: फॉर्मूला वाले सेल पर क्लिक करें। एक्सेल डॉटेड लाइन से अवरुद्ध क्षेत्र दिखाता है। रुकावट डालने वाले टेक्स्ट को डिलीट करते ही फॉर्मूला तुरंत स्पिल हो जाता है!

#pagebreak()

== 16.3 VLOOKUP एवं HLOOKUP की पूर्ण विदाई

दशकों तक `VLOOKUP` स्प्रेडशीट में डेटा खोजने का मुख्य साधन रहा। परंतु कॉर्पोरेट क्षेत्र में इसकी कई गंभीर कमियां थीं:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*VLOOKUP की कमजोरी*], [*तकनीकी कारण*], [*XLOOKUP की आधुनिक श्रेष्ठता*]),
  [कॉलम संख्या हार्डकोड होना], [कॉलम संख्या (उदा. 4) हाथ से लिखनी पड़ती थी। नया कॉलम जोड़ने पर पूरा फॉर्मूला गलत हो जाता था!], [वेक्टर रेंज का प्रयोग करता है। कॉलम जोड़ने पर भी सही काम करता है।],
  [बाईं ओर नहीं देख सकता], [लुकअप कॉलम अनिवार्य रूप से टेबल का सबसे बायां कॉलम होना चाहिए था।], [दाएं, बाएं, ऊपर, नीचे किसी भी दिशा में देख सकता है।],
  [खतरनाक Approximate डिफ़ॉल्ट], [चौथा तर्क न लिखने पर लगभग मिलान (TRUE) मान लेता था, जिससे गलत उत्तर आता था!], [डिफ़ॉल्ट रूप से strictly *Exact Match (सटीक मिलान)* करता है।],
  [कोई आंतरिक एरर हैंडलिंग नहीं], [डेटा न मिलने पर `#N/A` देता था; सुरक्षा हेतु `IFERROR` लगाना पड़ता था।], [आंतरिक `[if_not_found]` पैरामीटर उपलब्ध है।],
  [उल्टा नहीं खोज सकता], [हमेशा केवल ऊपर से नीचे की ओर खोजता था।], [नीचे से ऊपर उल्टा खोजने का समर्थन (`search_mode = -1`)]
)

#v(2pt)
#ribbon-specimen(path: "Formulas > Lookup & Reference > XLOOKUP", command: "आधुनिक 6-पैरामीटर डेटा क्वेरी इंजन", shortcut: "Alt + M + O + X")
#v(2pt)

== 16.4 आधुनिक XLOOKUP मास्टरक्लास: 6 पैरामीटर्स का विश्लेषण

`=XLOOKUP` फंक्शन VLOOKUP, HLOOKUP, और INDEX/MATCH तीनों को समाप्त कर एक शक्तिशाली इंजन प्रदान करता है:

```
सिंटैक्स:
=XLOOKUP( खोज_कुंजी , खोज_रेंज , परिणाम_रेंज , [यदि_न_मिले] , [मैच_मोड] , [सर्च_मोड] )
```

#table(
  columns: (1.2fr, 1.2fr, 3.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*पैरामीटर*], [*अनिवार्य?*], [*कार्यप्रणाली एवं विकल्प*]),
  [`खोज_कुंजी (lookup_value)`], [हाँ], [वह मान जिसे खोजना है (कर्मचारी ID, उत्पाद कोड, नाम)।],
  [`खोज_रेंज (lookup_array)`], [हाँ], [एकल कॉलम अथवा रो जहां वह मान स्थित है।],
  [`परिणाम_रेंज (return_array)`], [हाँ], [वह कॉलम अथवा रो जिसका डेटा परिणाम के रूप में वापस चाहिए।],
  [`[यदि_न_मिले]`], [ऐच्छिक], [मान न मिलने पर दिया जाने वाला संदेश (उदा. `"उपलब्ध नहीं"` या `0`)।],
  [`[मैच_मोड]`], [ऐच्छिक], [`0` = सटीक मिलान (डिफ़ॉल्ट); `-1` = सटीक अथवा अगला छोटा; `1` = सटीक अथवा अगला बड़ा; `2` = वाइल्डकार्ड।],
  [`[सर्च_मोड]`], [ऐच्छिक], [`1` = पहले से अंतिम (डिफ़ॉल्ट); `-1` = अंतिम से पहले (उल्टा नीचे से ऊपर खोजना)।]
)

#pagebreak()

== 16.5 एडवांस्ड XLOOKUP: टू-वे 2D मैट्रिक्स लुकअप एवं वाइल्डकार्ड्स

- *टू-वे 2D ग्रिड लुकअप (INDEX/MATCH का आधुनिक विकल्प)*: कर्मचारी की पंक्ति और माह के कॉलम के मिलान वाले सेल का मान निकालने हेतु दो XLOOKUP को नेस्ट किया जाता है:
  ```
  =XLOOKUP( कर्मचारी_नाम , कर्मचारी_सूची , XLOOKUP( माह_नाम , माह_शीर्षक , डेटा_मैट्रिक्स ) )
  ```
  आंतरिक XLOOKUP माह के कॉलम को चुनता है; बाहरी XLOOKUP कर्मचारी का मान निकालता है!
- *वाइल्डकार्ड लुकअप (`match_mode = 2`)*:
  ```
  =XLOOKUP("*Dell R760*", उत्पाद_विवरण, मूल्य_रेंज, "उपलब्ध नहीं", 2)
  ```
- *नीचे से ऊपर उल्टा खोजना (`search_mode = -1`)*: बहीखाते में ग्राहक का सबसे हालिया (अंतिम) लेन-देन खोजने हेतु:
  ```
  =XLOOKUP(ग्राहक_ID, बहीखाता_ग्राहक_ID, बहीखाता_राशि, 0, 0, -1)
  ```

#v(2pt)
#formula-specimen(title: "टू-वे मैट्रिक्स 2D लुकअप उदाहरण", formula: "=XLOOKUP(H2, A2:A50, XLOOKUP(H3, B1:F1, B2:F50))", note: "रो कुंजी H2 में, कॉलम शीर्षक H3 में। 2D निर्देशांकों का मान तुरंत निकालता है।")
#v(2pt)

== 16.6 पारंपरिक बैकवर्ड संगतता: INDEX + MATCH

पुराने एक्सेल 2013/2016 वाले कंप्यूटरों पर चलने वाली स्प्रेडशीट्स हेतु `INDEX` + `MATCH` का प्रयोग किया जाता है:

```
सिंटैक्स: =INDEX( परिणाम_रेंज , MATCH( खोज_कुंजी , खोज_रेंज , 0 ) )
```

- `=MATCH(कुंजी, रेंज, 0)` खोज कुंजी की पंक्ति संख्या (उदा. रो 14) बताता है।
- `=INDEX(रेंज, रो_संख्या)` परिणाम रेंज की 14वीं पंक्ति से मान निकाल कर देता है।

#pagebreak()

== 16.7 आधुनिक डायनामिक एरे सुइट: FILTER, UNIQUE, SORT एवं SEQUENCE

एक्सेल 365 में सीधे ग्रिड पर डेटाबेस जैसी शक्तिशाली क्वेरीज करने वाले फंक्शन्स दिए गए हैं:

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फंक्शन*], [*सिंटैक्स*], [*कॉर्पोरेट क्षमताएं*]),
  [`FILTER`], [`=FILTER(array, include, [if_empty])`], [बिना किसी SQL अथवा मैक्रो के बहु-शर्तों के आधार पर डेटा का लाइव निष्कर्षण।],
  [`UNIQUE`], [`=UNIQUE(array, [by_col], [exactly_once])`], [लिस्ट में से डुप्लिकेट हटाकर केवल अद्वितीय मानों की सूची स्पिल करना।],
  [`SORT`], [`=SORT(array, [sort_index], [sort_order])`], [डेटा को वर्णमाला अथवा संख्यानुसार आरोही (1) अथवा अवरोही (-1) क्रम में सजाना।],
  [`SORTBY`], [`=SORTBY(array, by_array1, [order1]...)`], [डेटा को किसी समानांतर दूसरे कॉलम के आधार पर क्रमबद्ध करना।],
  [`SEQUENCE`], [`=SEQUENCE(rows, [columns], [start], [step])`], [संख्याओं की श्रृंखला तैयार करना (उदा. 100 सीरियल नंबर एक सेकंड में बनाना)।]
)

#v(2pt)
#formula-specimen(title: "लाइव फ़िल्टर एवं सॉर्ट पाइपलाइन", formula: "=SORT(FILTER(Staff_Table, (Department_Col=\"IT\") * (Salary_Col>=75000), \"कोई रिकॉर्ड नहीं\"), 3, -1)", note: "75 हजार से अधिक वेतन वाले IT कर्मियों को छांटकर वेतन के घटते क्रम में सजाना।")
#v(2pt)

== 16.8 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "सेल B2 के पूरे स्पिल्ड एरे को संदर्भित करने वाला ऑपरेटर कौन सा है?", ans: "B2# (हैश ऑपरेटर)।")
    #short-qa(num: 2, q: "जब डायनामिक एरे के रास्ते में कोई टेक्स्ट रुकावट डालता है तो कौन सी एरर आती है?", ans: "#SPILL! एरर।")
    #short-qa(num: 3, q: "XLOOKUP में डिफ़ॉल्ट मैच मोड क्या होता है?", ans: "सटीक मिलान (Exact match, कोड 0)।")
    #short-qa(num: 4, q: "लिस्ट में से डुप्लिकेट मान हटाकर अद्वितीय सूची बनाने वाला फंक्शन कौन सा है?", ans: "UNIQUE फंक्शन।")
  ],
  [
    #mcq(num: 1, q: "XLOOKUP कॉलम जोड़ने पर भी क्यों नहीं टूटता, जबकि VLOOKUP टूट जाता है?", a: "रंग के कारण", b: "XLOOKUP हार्डकोड संख्या के बजाय वास्तविक रेंज वेक्टर को संदर्भित करता है", c: "PDF बनाता है", d: "मैक्रो चाहिए", ans: "B", expl: "VLOOKUP में कॉलम संख्या स्थिर होती है; XLOOKUP में रेंज कॉलम खिसकने पर स्वतः बदल जाती है।")
    #mcq(num: 2, q: "XLOOKUP में सबसे हालिया रिकॉर्ड खोजने हेतु नीचे से ऊपर उल्टा सर्च कैसे करते हैं?", a: "match_mode = -1", b: "search_mode = -1", c: "REVERSE फंक्शन", d: "सॉर्ट करके", ans: "B", expl: "search_mode = -1 XLOOKUP को नीचे से ऊपर की ओर उल्टी खोज करने का निर्देश देता है।")
    #mcq(num: 3, q: "बिना किसी VBA के 'Sales' विभाग के सभी कर्मचारियों को निकालने वाला फॉर्मूला कौन सा है?", a: "=FIND(Staff, \"Sales\")", b: "=FILTER(Staff, Department=\"Sales\", \"None\")", c: "=SEARCH(Staff, \"Sales\")", d: "=INDEX(Staff, \"Sales\")", ans: "B", expl: "=FILTER शर्त के अनुसार मेल खाने वाले सभी रिकॉर्ड्स को स्वचालित रूप से स्पिल करता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 एक्सेल में पायथन इंटीग्रेशन", [
  एक्सेल 365 सीधे अज़्योर क्लाउड पर एम्बेडेड पायथन (`=PY()`) चलाता है। उपयोगकर्ता स्पिल्ड एरे को सीधे पैंडास (Pandas) डेटाफ्रेम में भेजकर मशीन लर्निंग क्लस्टरिंग और उन्नत सांख्यिकीय ग्राफ्स सीधे ग्रिड पर प्राप्त कर सकते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-16.typ"), "w", encoding="utf-8") as f:
        f.write(ch16_en)
    with open(os.path.join(hi_dir, "chapter-16.typ"), "w", encoding="utf-8") as f:
        f.write(ch16_hi)

    print("Excel Chapters 11 to 16 (23 Pages total) written successfully in English and Hindi.")

if __name__ == "__main__":
    generate_chapters("DIGITAL/OFFICE_365/07_SOURCE_FILES")


if __name__ == "__main__":
    generate_chapters("DIGITAL/OFFICE_365/07_SOURCE_FILES")


if __name__ == "__main__":
    generate_chapters("DIGITAL/OFFICE_365/07_SOURCE_FILES")


if __name__ == "__main__":
    generate_chapters("DIGITAL/OFFICE_365/07_SOURCE_FILES")
