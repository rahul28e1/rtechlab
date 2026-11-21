#!/usr/bin/env python3
# =============================================================================
# RTechLab Office 365 Publishing Engine — Excel Mastery (Chapters 17 to 22)
# Covers: Text Processing, Date/Time, Data Validation, Conditional Formatting,
#         Pivot Tables & Slicers, What-If Analysis, Power Query & 5 Labs
# Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
# =============================================================================

import os

def generate_chapters(base_dir):
    eng_dir = os.path.join(base_dir, "English")
    hi_dir = os.path.join(base_dir, "Hindi")
    os.makedirs(eng_dir, exist_ok=True)
    os.makedirs(hi_dir, exist_ok=True)

    # =========================================================================
    # CHAPTER 17: Advanced Text & String Processing Functions (4 Pages)
    # =========================================================================
    ch17_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 17]
= Advanced Text, String Manipulation & Data Sanitization Engines

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Real-world corporate data exported from enterprise ERPs, SAP, or web portals is notoriously fragmented, populated with irregular whitespace, concatenated names, and mixed delimiters. Mastering modern text joining, substring slicing, pattern searching, and data cleansing functions transforms dirty records into pristine data pipelines.
]

#v(2pt)

== 17.1 Modern String Joining: TEXTJOIN vs. CONCAT vs. Ampersand (&)

In legacy Excel, combining 20 cells required typing `=A1 & ", " & B1 & ", " & C1...` or the cumbersome `=CONCATENATE`. In Excel 365, the `=TEXTJOIN` function redefines string merging:

```
Syntax: =TEXTJOIN( delimiter , ignore_empty , text1 , [text2]... )
```

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function / Operator*], [*Operational Mechanics*], [*Enterprise Behavior & Advantages*]),
  [`TEXTJOIN`], [Merges ranges with a universal delimiter; skips blanks automatically.], [Merges entire column `=TEXTJOIN(", ", TRUE, A2:A50)` in 1 step!],
  [`CONCAT`], [Combines ranges of cells without delimiters.], [Replaces obsolete CONCATENATE; accepts full ranges `=CONCAT(B2:D2)`.],
  [`&` (Ampersand)], [Low-level string concatenation operator.], [Ideal for quick 2-token joins (e.g. `="Total: " & C10`).]
)

#v(2pt)
#formula-specimen(title: "DELIMITED VENDOR LIST TEXTJOIN", formula: "=TEXTJOIN(\"; \", TRUE, Vendor_Names_Col)", note: "Builds a semicolon-delimited recipient list for bulk Outlook emailing, skipping empty cells.")
#v(2pt)

== 17.2 The TEXT Function: Dynamic Formatting Inside Sentences

When numerical quantities, dates, or currency amounts are joined with text strings via ampersand, Excel strips their formatting and displays raw serial numbers:
- `="Today is " & TODAY()` -> Displays: `Today is 46388` (Unacceptable in corporate reports!)
- *The Fix*: Use the `=TEXT` function to enforce custom masks:
  ```
  ="Invoice generated on " & TEXT(TODAY(), "dddd, mmmm dd, yyyy") & " for amount " & TEXT(C2, "₹ #,##,##0.00")
  ```
  *Result*: "Invoice generated on Thursday, April 15, 2027 for amount ₹ 1,45,000.00".

#pagebreak()

== 17.3 Substring Slicing Mechanics: LEFT, RIGHT, MID & LEN

Slicing fixed or variable character tokens from structured product SKUs or employee codes:

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function Syntax*], [*Operational Action*], [*Enterprise Specimen (Target: "RTL-SRV-2027")*]),
  [`=LEFT(text, [num_chars])`], [Extracts characters starting from far left.], [`=LEFT(A2, 3)` returns `"RTL"` (Company prefix).],
  [`=RIGHT(text, [num_chars])`], [Extracts characters starting from far right.], [`=RIGHT(A2, 4)` returns `"2027"` (Fiscal year).],
  [`=MID(text, start, num)`], [Extracts characters from any internal index.], [`=MID(A2, 5, 3)` returns `"SRV"` (Server category).],
  [`=LEN(text)`], [Returns total character count including spaces.], [`=LEN(A2)` returns `12` characters.]
)

#v(2pt)
#concept-box(title: "CRITICAL TEXT-TO-NUMBER CONVERSION: VALUE FUNCTION", [
  Tokens extracted using `LEFT`, `RIGHT`, or `MID` are treated by Excel as **text strings**, even if they consist purely of digits! Any mathematical formula evaluating `=LEFT("100", 2) + 5` may fail in legacy models. Wrap extracted numeric substrings in `=VALUE(...)` or multiply by `1` (e.g., `=LEFT(A2, 2) * 1`) to cast them back into real numbers.
])

#v(2pt)

== 17.4 Searching for Delimiters: FIND vs. SEARCH

To extract variable-length substrings (such as extracting a first name when names have different character counts), you must dynamically find the position of the separating space:

#table(
  columns: (1fr, 1.3fr, 2.7fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function*], [*Case Sensitivity*], [*Matching Characteristics*], [*Wildcard Support*]),
  [`FIND`], [Case-Sensitive], [Exact match: `=FIND("P", "Rahul Patel")` returns 7. `=FIND("p", "Rahul Patel")` throws `#VALUE!`.], [No],
  [`SEARCH`], [Case-Insensitive], [Lenient match: `=SEARCH("patel", "Rahul Patel")` returns 7 without error.], [Yes (`*`, `?`)]
)

#pagebreak()

== 17.5 Dynamic Name Extraction Formula: Slicing Variable Strings

When separating "Rahul Patel" into First Name and Last Name across 5,000 employee records, combine `LEFT`, `RIGHT`, `MID`, `FIND`, and `LEN`:

- *Dynamic First Name Extraction*:
  ```
  =LEFT(A2, FIND(" ", A2) - 1)
  ```
  Finds the space at index 6, subtracts 1, and takes the leftmost 5 characters -> `"Rahul"`.
- *Dynamic Last Name Extraction*:
  ```
  =RIGHT(A2, LEN(A2) - FIND(" ", A2))
  ```
  Total length (11) minus space position (6) = 5 characters from the right -> `"Patel"`.
- *Dynamic Corporate Email Domain Extraction* (e.g. from `rahul.patel@rtechlab.com`):
  ```
  =MID(A2, FIND("@", A2) + 1, LEN(A2) - FIND("@", A2))
  ```
  Extracts everything after the `@` symbol -> `"rtechlab.com"`.

#v(2pt)
#formula-specimen(title: "DOMAIN EXTRACTION MASTER FORMULA", formula: "=MID(A2, FIND(\"@\", A2) + 1, 255)", note: "Passing 255 as character count extracts all remaining characters to the end of the email string.")
#v(2pt)

== 17.6 Data Sanitization Suite: TRIM, CLEAN & Case Normalization

Dirty database dumps often fail exact VLOOKUP or XLOOKUP matches because of invisible trailing spaces.
- `=TRIM(text)`: Strips all leading, trailing, and duplicate spaces, leaving strictly single spaces between words. (Mandatory pre-processing step for all lookup keys!).
- `=CLEAN(text)`: Strips non-printable ASCII control characters ($0$ through $31$) imported from mainframe databases.
- `=PROPER(text)`: Converts messy text like `"rAhUL pATel"` into clean corporate title case `"Rahul Patel"`.
- `=UPPER(text)` & `=LOWER(text)`: Standardizes tax identification numbers (PAN/GSTIN) into uppercase.

#pagebreak()

== 17.7 Data Tab: Text to Columns Wizard

Under `Data > Data Tools > Text to Columns` (`Alt + A + E`), Excel provides a non-formula dialog to split delimited columns into adjacent fields:
1. *Delimited*: Split by Tab, Semicolon, Comma, Space, or custom characters (e.g. `/` or `-`).
2. *Fixed Width*: Drag vertical break lines across a monospace data preview.
3. *Column Data Format*: Set date columns to `YMD` or `DMY` to prevent international date corruption, or format postal codes as `Text` to preserve leading zeros.

#v(2pt)

== 17.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which text function joins a range of cells using a delimiter while skipping blank cells?", ans: "TEXTJOIN function.")
    #short-qa(num: 2, q: "What is the key difference between FIND and SEARCH functions?", ans: "FIND is case-sensitive; SEARCH is case-insensitive and supports wildcards.")
    #short-qa(num: 3, q: "Which function converts text into proper title case with capitalized first letters?", ans: "PROPER function.")
    #short-qa(num: 4, q: "Why does =\"Due: \" & TODAY() display a 5-digit number instead of a date?", ans: "Ampersand strips visual formatting; use =\"Due: \" & TEXT(TODAY(), \"dd-mm-yyyy\").")
  ],
  [
    #mcq(num: 1, q: "What does formula =TRIM(\"  RTechLab   Systems  \") return?", a: "\"RTechLabSystems\"", b: "\"RTechLab Systems\"", c: "\"  RTechLab   Systems  \"", d: "#VALUE!", ans: "B", expl: "TRIM strips leading, trailing, and redundant middle spaces, preserving single spaces.")
    #mcq(num: 2, q: "If cell A1 contains 'INV-2027-450', which formula extracts the year '2027'?", a: "=LEFT(A1, 4)", b: "=MID(A1, 5, 4)", c: "=RIGHT(A1, 4)", d: "=EXTRACT(A1, 5, 4)", ans: "B", expl: "Starting at position 5 for 4 characters extracts '2027'.")
    #mcq(num: 3, q: "Which tool splits a column containing 'City, State' into two columns without writing formulas?", a: "Data Validation", b: "Text to Columns", c: "Consolidate", d: "Scenario Manager", ans: "B", expl: "Text to Columns (Data > Text to Columns) parses delimited text across adjacent columns.")
  ]
)

#v(2pt)

#spotlight-box("2027 REGEX PATTERN FUNCTIONS IN EXCEL 365", [
  Excel 365 natively incorporates regular expression functions: `=REGEXTEST(text, pattern)`, `=REGEXEXTRACT(text, pattern)`, and `=REGEXREPLACE(text, pattern, replacement)`. Analysts can extract Indian PAN numbers (`[A-Z]{5}[0-9]{4}[A-Z]`) or telephone numbers using concise standard regex syntax directly in grid formulas.
])
"""

    ch17_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#059669"))[भाग 2: माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज मास्टरी · अध्याय 17]
= एडवांस्ड टेक्स्ट, स्ट्रिंग मैनिपुलेशन एवं डेटा स्वच्छता इंजन

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  कॉर्पोरेट ERP, SAP अथवा वेब पोर्टल्स से एक्सपोर्ट किया गया डेटा अक्सर अव्यवस्थित, अतिरिक्त रिक्त स्थानों (Spaces) से भरा और मिले-जुले अक्षरों वाला होता है। आधुनिक टेक्स्ट जॉइनिंग, सबस्ट्रिंग स्लाइसिंग, पैटर्न सर्चिंग और डेटा सैनिटाइजेशन में महारत हासिल करना डेटा पाइपलाइन्स को त्रुटिहीन बनाने हेतु अनिवार्य है।
]

#v(2pt)

== 17.1 आधुनिक स्ट्रिंग संयोजन: TEXTJOIN बनाम CONCAT बनाम Ampersand (&)

पुराने एक्सेल में 20 सेलों को जोड़ने हेतु `=A1 & ", " & B1...` लिखना पड़ता था। एक्सेल 365 में `=TEXTJOIN` ने इस प्रक्रिया को बदल दिया है:

```
सिंटैक्स: =TEXTJOIN( विभाजक_चिन्ह , खाली_सेल_छोड़ें , text1 , [text2]... )
```

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फंक्शन / ऑपरेटर*], [*कार्यप्रणाली*], [*कॉर्पोरेट उपयोग एवं लाभ*]),
  [`TEXTJOIN`], [निर्दिष्ट विभाजक (Delimiter) से पूरी रेंज जोड़ता है; खाली सेल छोड़ता है।], [पूरे कॉलम को एक सेकंड में जोड़ना: `=TEXTJOIN(", ", TRUE, A2:A50)`।],
  [`CONCAT`], [बिना किसी विभाजक के पूरी रेंज को जोड़ता है।], [पुराने CONCATENATE का आधुनिक रूप; पूरी रेंज `=CONCAT(B2:D2)` स्वीकार करता है।],
  [`&` (Ampersand)], [दो स्ट्रिंग्स को जोड़ने वाला आधारभूत ऑपरेटर।], [त्वरित 2-शब्दों के जोड़ हेतु उपयुक्त (उदा. `="कुल योग: " & C10`)।]
)

#v(2pt)
#formula-specimen(title: "वेंडर ईमेल सूची TEXTJOIN फॉर्मूला", formula: "=TEXTJOIN(\"; \", TRUE, Vendor_Names_Col)", note: "आउटलुक में थोक ईमेल भेजने हेतु सभी वेंडरों की सेमीकोलन युक्त सूची तैयार करता है।")
#v(2pt)

== 17.2 TEXT फंक्शन: वाक्यों के भीतर गतिशील संख्या व दिनांक फॉर्मेटिंग

जब संख्याओं अथवा तारीखों को ampersand (&) द्वारा टेक्स्ट से जोड़ा जाता है, तो एक्सेल उनकी फॉर्मेटिंग हटाकर कच्चा सीरियल नंबर दिखाता है:
- `="आज की तिथि: " & TODAY()` -> परिणाम: `आज की तिथि: 46388` (कॉर्पोरेट रिपोर्ट्स में अस्वीकार्य!)
- *समाधान*: कस्टम फॉर्मेट लागू करने हेतु `=TEXT` फंक्शन का उपयोग करें:
  ```
  ="इनवॉइस दिनांक " & TEXT(TODAY(), "dddd, mmmm dd, yyyy") & " कुल राशि " & TEXT(C2, "₹ #,##,##0.00")
  ```
  *परिणाम*: "इनवॉइस दिनांक गुरुवार, 15 अप्रैल 2027 कुल राशि ₹ 1,45,000.00"।

#pagebreak()

== 17.3 सबस्ट्रिंग स्लाइसिंग मैकेनिक्स: LEFT, RIGHT, MID एवं LEN

उत्पाद कोड (SKU) अथवा कर्मचारी ID से विशिष्ट भाग अलग करना:

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फॉर्मूला सिंटैक्स*], [*कार्यात्मक क्रिया*], [*कॉर्पोरेट उदाहरण (लक्षित मान: "RTL-SRV-2027")*]),
  [`=LEFT(text, [अक्षर_संख्या])`], [बिल्कुल बाईं ओर से अक्षर निकालता है।], [`=LEFT(A2, 3)` का उत्तर `"RTL"` (कंपनी कोड) होगा।],
  [`=RIGHT(text, [अक्षर_संख्या])`], [बिल्कुल दाईं ओर से अक्षर निकालता है।], [`=RIGHT(A2, 4)` का उत्तर `"2027"` (वर्ष) होगा।],
  [`=MID(text, प्रारंभ, संख्या)`], [किसी भी आंतरिक स्थान से अक्षर निकालता है।], [`=MID(A2, 5, 3)` का उत्तर `"SRV"` (सर्वर श्रेणी) होगा।],
  [`=LEN(text)`], [स्पेस सहित कुल अक्षरों की संख्या बताता है।], [`=LEN(A2)` का उत्तर `12` अक्षर होगा।]
)

#v(2pt)
#concept-box(title: "महत्वपूर्ण टेक्स्ट-टू-नंबर नियम: VALUE फंक्शन", [
  `LEFT`, `RIGHT`, अथवा `MID` द्वारा निकाले गए अंक एक्सेल द्वारा **टेक्स्ट (Text)** माने जाते हैं! गणितीय गणना करने हेतु निकाले गए अंकों को `=VALUE(...)` के भीतर रखें अथवा 1 से गुणा करें (जैसे `=LEFT(A2, 2) * 1`) ताकि वे वास्तविक संख्या में बदल जाएं।
])

#v(2pt)

== 17.4 विभाजक खोजना: FIND बनाम SEARCH

परिवर्तनशील लंबाई वाले टेक्स्ट (जैसे अलग-अलग लंबाई के प्रथम नाम) में से शब्द अलग करने हेतु स्पेस का स्थान खोजना पड़ता है:

#table(
  columns: (1fr, 1.3fr, 2.7fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फंक्शन*], [*केस संवेदनशीलता*], [*मिलान व्यवहार*], [*वाइल्डकार्ड समर्थन*]),
  [`FIND`], [Case-Sensitive], [अक्षरशः मिलान: `=FIND("P", "Rahul Patel")` 7 देगा। `=FIND("p", ...)` एरर देगा।], [नहीं],
  [`SEARCH`], [Case-Insensitive], [उदार मिलान: `=SEARCH("patel", "Rahul Patel")` बिना एरर के 7 लौटाएगा।], [हाँ (`*`, `?`)]
)

#pagebreak()

== 17.5 डायनामिक नाम निष्कर्षण फॉर्मूला: परिवर्तनशील शब्दों को अलग करना

5,000 कर्मचारियों के "Rahul Patel" जैसे नामों को First Name और Last Name में अलग करने हेतु फंक्शन्स का संयोजन करें:

- *डायनामिक प्रथम नाम निष्कर्षण*:
  ```
  =LEFT(A2, FIND(" ", A2) - 1)
  ```
  स्पेस का स्थान (6) खोजकर 1 घटाता है और बाईं ओर से 5 अक्षर निकालता है -> `"Rahul"`।
- *डायनामिक अंतिम नाम निष्कर्षण*:
  ```
  =RIGHT(A2, LEN(A2) - FIND(" ", A2))
  ```
  कुल लंबाई (11) में से स्पेस का स्थान (6) घटाकर दाईं ओर से 5 अक्षर निकालता है -> `"Patel"`।
- *कॉर्पोरेट ईमेल से डोमेन अलग करना* (`rahul.patel@rtechlab.com` से):
  ```
  =MID(A2, FIND("@", A2) + 1, 255)
  ```
  `@` के बाद के सभी 255 अक्षरों को निकालता है -> `"rtechlab.com"`।

#v(2pt)
#formula-specimen(title: "मास्टर ईमेल डोमेन निष्कर्षण", formula: "=MID(A2, FIND(\"@\", A2) + 1, 255)", note: "संख्या 255 देने से @ चिन्ह के बाद का संपूर्ण अंत तक का टेक्स्ट सुरक्षित निकल आता है।")
#v(2pt)

== 17.6 डेटा स्वच्छता सुइट: TRIM, CLEAN एवं केस मानकीकरण

डेटाबेस से आयात किए गए टेक्स्ट में अक्सर अंत में अदृश्य स्पेस लगे होते हैं जिससे VLOOKUP या XLOOKUP फेल हो जाते हैं:
- `=TRIM(text)`: शब्दों के आगे, पीछे और बीच के अनावश्यक सभी स्पेस हटाकर केवल एक-एक स्पेस छोड़ता है। (लुकअप लगाने से पूर्व यह सबसे महत्वपूर्ण सुरक्षा कदम है!)।
- `=CLEAN(text)`: मेनफ्रेम से आए गैर-प्रिंट होने वाले ASCII कोड्स (0 से 31) को मिटाता है।
- `=PROPER(text)`: अव्यवस्थित टेक्स्ट `"rAhUL pATel"` को शुद्ध कॉर्पोरेट टाइटल केस `"Rahul Patel"` में बदलता है।
- `=UPPER(text)` व `=LOWER(text)`: पैन कार्ड अथवा GSTIN नंबरों को बड़े अक्षरों में मानकीकृत करना।

#pagebreak()

== 17.7 डेटा टैब: टेक्स्ट टू कॉलम्स विज़ार्ड (Text to Columns)

`Data > Data Tools > Text to Columns` (`Alt + A + E`) बिना फॉर्मूला लिखे एक कॉलम के डेटा को अलग-अलग कॉलमों में बांटता है:
1. *Delimited*: कॉमा, टैब, स्पेस, अथवा कस्टम चिन्ह (जैसे `/` या `-`) से डेटा को काटना।
2. *Fixed Width*: मोनोस्पेस डेटा के बीच में विभाजक रेखा खींचकर काटना।
3. *कॉलम डेटा फॉर्मेट*: दिनांक कॉलम को `DMY` फॉर्मेट देना ताकि भारतीय तारीखें न बिगड़ें, तथा पिन कोड को `Text` फॉर्मेट देना ताकि शुरुआती शून्य न मिटे।

#v(2pt)

== 17.8 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "खाली सेलों को छोड़कर बाकी सेलों को विभाजक चिन्ह से जोड़ने वाला फंक्शन कौन सा है?", ans: "TEXTJOIN फंक्शन।")
    #short-qa(num: 2, q: "FIND और SEARCH में मुख्य अंतर क्या है?", ans: "FIND केस-सेंसिटिव है; SEARCH केस-इनसेंसिटिव है और वाइल्डकार्ड्स का समर्थन करता है।")
    #short-qa(num: 3, q: "प्रत्येक शब्द का पहला अक्षर बड़ा (Title Case) करने वाला फंक्शन कौन सा है?", ans: "PROPER फंक्शन।")
    #short-qa(num: 4, q: "=\"दिनांक: \" & TODAY() तारीख के स्थान पर 5-अंकीय संख्या क्यों दिखाता है?", ans: "Ampersand फॉर्मेटिंग हटा देता है; =\"दिनांक: \" & TEXT(TODAY(), \"dd-mm-yyyy\") प्रयोग करें।")
  ],
  [
    #mcq(num: 1, q: "=TRIM(\"  RTechLab   Systems  \") का मान क्या होगा?", a: "\"RTechLabSystems\"", b: "\"RTechLab Systems\"", c: "\"  RTechLab   Systems  \"", d: "#VALUE!", ans: "B", expl: "TRIM आगे-पीछे के सभी स्पेस और बीच के अनावश्यक स्पेस हटाकर केवल एकल स्पेस छोड़ता है।")
    #mcq(num: 2, q: "सेल A1 में 'INV-2027-450' लिखा है। वर्ष '2027' निकालने का सही फॉर्मूला क्या है?", a: "=LEFT(A1, 4)", b: "=MID(A1, 5, 4)", c: "=RIGHT(A1, 4)", d: "=EXTRACT(A1, 5, 4)", ans: "B", expl: "5वें स्थान से 4 अक्षर निकालने पर '2027' प्राप्त होगा।")
    #mcq(num: 3, q: "'शहर, राज्य' वाले कॉलम को बिना फॉर्मूले के दो अलग कॉलमों में बांटने वाला टूल कौन सा है?", a: "Data Validation", b: "Text to Columns", c: "Consolidate", d: "Scenario Manager", ans: "B", expl: "Text to Columns (Data टैब) विभाजित टेक्स्ट को अगल-बगल के कॉलमों में बांट देता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 रेगुलर एक्सप्रेशन (REGEX) फंक्शन्स", [
  एक्सेल 365 अब नेटिव रेगुलर एक्सप्रेशन फंक्शन्स का समर्थन करता है: `=REGEXTEST`, `=REGEXEXTRACT`, और `=REGEXREPLACE`। विश्लेषक भारतीय पैन कार्ड (`[A-Z]{5}[0-9]{4}[A-Z]`) अथवा ईमेल पतों को जटिल स्ट्रिंग फॉर्मूलों के बिना सीधे रेगेक्स पैटर्न द्वारा निकाल सकते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-17.typ"), "w", encoding="utf-8") as f:
        f.write(ch17_en)
    with open(os.path.join(hi_dir, "chapter-17.typ"), "w", encoding="utf-8") as f:
        f.write(ch17_hi)

    # =========================================================================
    # =========================================================================
    # CHAPTER 18: Date, Time, Financial & Statistical Analysis (4 Pages)
    # =========================================================================
# =========================================================================
    # CHAPTER 18: Date, Time, Financial & Statistical Analysis (4 Pages)
    # =========================================================================
    ch18_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 18]
= Date, Time, Financial Engineering & Advanced Statistical Analysis

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Date and time handling, statutory financial amortization, capital budgeting (NPV/IRR), and empirical statistical analysis form the backbone of corporate decision-making. Excel's serial number engine and advanced financial algorithms guarantee mathematical precision across global multi-currency operations.
]

#v(2pt)

== 18.1 The Excel Serial Date & Time Representation Architecture

Underneath all user formatting, Excel treats dates strictly as sequential positive integers and times as fractional decimals:
- *Serial Base System*: Day `1` corresponds precisely to `January 1, 1900`.
- Every subsequent calendar day increments the integer by `1`. For example, `January 1, 2027` is stored internally as integer `46388`.
- *Time as Decimals*: A standard 24-hour day equals `1.0`. Therefore:
  - `6:00 AM` = 6 / 24 = `0.25`
  - `12:00 PM (Noon)` = 12 / 24 = `0.50`
  - `6:00 PM` = 18 / 24 = `0.75`
- A compound timestamp like `2027-01-01 12:00 PM` is represented internally as floating-point `46388.50`.

#v(2pt)
#formula-specimen(title: "CURRENT DYNAMIC TIMESTAMPS", formula: "=TODAY() [Volatile Date]   |   =NOW() [Volatile Date + Time]", note: "Recalculates dynamically every time the workbook is computed or any cell value changes.")
#v(2pt)

== 18.2 Date & Time Decomposition & Assembly: YEAR, MONTH, DAY, DATE

- `=YEAR(date)`: Returns the 4-digit integer year (e.g., `2027`).
- `=MONTH(date)`: Returns integer month (1 for January to 12 for December).
- `=DAY(date)`: Returns day of the month (1 to 31).
- `=HOUR(time)`, `=MINUTE(time)`, `=SECOND(time)`: Extract temporal components.
- *Safe Date Assembly*: Never write dates as text strings like `"04/05/2027"` (which causes fatal bugs between US MM/DD and Indian/UK DD/MM OS regional formats). Always build dates programmatically using `=DATE(year, month, day)`:
  ```
  =DATE(2027, 4, 15)
  ```

#table(
  columns: (1.2fr, 2.5fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Function*], [*Operational Syntax & Behavior*], [*Production Financial Use Case*]),
  [`=DATE(Y, M, D)`], [Constructs a serial date safely from integer tokens.], [Generating standardized contract start dates.],
  [`=TIME(H, M, S)`], [Constructs a serial time fraction safely.], [Calculating standard factory shift boundaries.],
  [`=WEEKDAY(dt, [type])`], [Returns 1-7 indicating day of week.], [Audit checks for unauthorized weekend transactions.],
  [`=ISOWEEKNUM(dt)`], [Returns ISO-8601 calendar week number (1-53).], [Enterprise supply chain batch tracking.]
)

#pagebreak()

== 18.3 The Secret DATEDIF Function: Exact Age & Tenure Calculations

The undocumented, yet universally supported, `=DATEDIF` function calculates the exact elapsed time between two dates across discrete units:

```
Syntax: =DATEDIF( start_date , end_date , "unit" )
```

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Unit*], [*Interval Measured*], [*Operational Output Description*], [*Production Specimen*]),
  [`"Y"`], [Complete Years], [Total elapsed full years between dates.], [Employee completed service tenure.],
  [`"M"`], [Complete Months], [Total elapsed full months across the span.], [Loan amortization term elapsed.],
  [`"D"`], [Complete Days], [Total calendar elapsed days (identical to `end - start`).], [Project duration tally.],
  [`"YM"`], [Remaining Months], [Months remaining after subtracting complete years.], [Age calculation: Months component.],
  [`"MD"`], [Remaining Days], [Days remaining after subtracting complete months.], [Age calculation: Days component.]
)

#v(2pt)
#formula-specimen(title: "COMPREHENSIVE EMPLOYEE AGE / TENURE STRING", formula: "=DATEDIF(DOB, TODAY(), \"Y\") & \" Yrs, \" & DATEDIF(DOB, TODAY(), \"YM\") & \" Mos, \" & DATEDIF(DOB, TODAY(), \"MD\") & \" Days\"", note: "Outputs perfect Human Resources tenure string: '28 Yrs, 4 Mos, 12 Days'.")
#v(2pt)

== 18.4 Business Days & Project Scheduling: WORKDAY & NETWORKDAYS

Standard calendar arithmetic includes weekends. Corporate project management requires calculating working days only:
- `=NETWORKDAYS(start_date, end_date, [holidays])`: Computes net working days between dates, automatically excluding Saturdays and Sundays. Passing a range of declared public corporate holidays subtracts them from the total.
- `=NETWORKDAYS.INTL(start, end, [weekend], [holidays])`: Allows custom weekend configurations (e.g., Sunday-only weekends or Middle-East Friday/Saturday weekends).
- `=WORKDAY(start_date, days, [holidays])`: Takes a project start date and adds $N$ working days, returning the exact projected completion date.
- `=EDATE(start_date, months)`: Jumps exactly $N$ months into the future or past (essential for bond coupon dates or warranty expiration).
- `=EOMONTH(start_date, months)`: Calculates the exact last calendar day of the month (e.g. `=EOMONTH(TODAY(), 0)` returns the final day of the current billing cycle).

#pagebreak()

== 18.5 Enterprise Financial Engineering: Loan Amortization (PMT, IPMT, PPMT)

Corporate finance requires exact monthly installment calculations and loan schedule separation:
- `=PMT(rate, nper, pv, [fv], [type])`: Calculates the fixed periodic payment for an annuity or loan.
  - *Rate*: Interest rate per period (for annual rate $12\%$, monthly rate is `12% / 12` = `1%`).
  - *Nper*: Total number of payment periods (e.g., 5-year loan = `5 * 12` = `60` months).
  - *PV*: Present value / Principal amount (entered as positive or negative cash flow).
- `=IPMT(rate, per, nper, pv)`: Returns the *interest portion* of a specific payment period `per`.
- `=PPMT(rate, per, nper, pv)`: Returns the *principal repayment portion* of a specific payment period `per`.
- *Mathematical Identity*: `=PMT(...) = IPMT(...) + PPMT(...)` holds exactly for every single installment period.

#v(2pt)
#formula-specimen(title: "MONTHLY EMI FORMULA FOR RS. 10 LAKH CORPORATE LOAN", formula: "=PMT(9.5%/12, 5*12, -1000000)", note: "Outputs exact monthly EMI of Rs. 21,001.91 at 9.5% annual rate over 60 months.")
#v(2pt)

== 18.6 Capital Budgeting & Investment Valuation: NPV & IRR

When evaluating corporate capital projects, investments, or corporate acquisitions:
- `=NPV(discount_rate, value1, [value2], ...)`: Calculates Net Present Value based on discounted future cash inflows.
  - *Warning*: In Excel, `NPV` assumes the first cash flow arrives at period 1. The initial period 0 investment must be subtracted *outside* the function: `=NPV(rate, Year1:Year5) + Initial_Outlay_Yr0`.
- `=IRR(values, [guess])`: Calculates Internal Rate of Return where Net Present Value equals zero.

#table(
  columns: (1fr, 1.5fr, 1.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Period*], [*Project Alpha Cash Flow*], [*Discounted @ 10%*], [*Cumulative Position*]),
  [Year 0], [-₹10,00,000 (Capex)], [-₹10,00,000], [-₹10,00,000 (Initial Outlay)],
  [Year 1], [+₹3,00,000], [+₹2,72,727], [-₹7,27,273],
  [Year 2], [+₹4,00,000], [+₹3,30,579], [-₹3,96,694],
  [Year 3], [+₹5,00,000], [+₹3,75,657], [-₹21,037],
  [Year 4], [+₹4,00,000], [+₹2,73,205], [+₹2,52,168 (NPV = +₹2.52L, Accept!)]
)

#pagebreak()

== 18.7 Statistical Analysis: Variance, Standard Deviation & Normality

Executive decision-making relies on statistical validation of datasets:
- `=AVERAGE(range)` / `=MEDIAN(range)` / `=MODE.SNGL(range)`: Central tendency metrics.
- `=STDEV.S(range)`: Sample standard deviation (used when evaluating a sample of transactions).
- `=STDEV.P(range)`: Population standard deviation (used when measuring 100% of the complete dataset).
- `=VAR.S(range)` / `=VAR.P(range)`: Variance measurement of data dispersion.
- `=PERCENTILE.INC(range, k)`: Returns the $k$-th percentile (e.g. $k = 0.90$ reveals 90th percentile performance).
- `=CORREL(array1, array2)`: Computes Pearson correlation coefficient between two numeric variables (-1 to +1).

#v(2pt)

== 18.8 Evaluation Dashboard: Technical MCQs & Knowledge Check

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What integer serial number represents January 1, 1900 in Excel?", ans: "Serial number 1.")
    #short-qa(num: 2, q: "Which DATEDIF unit code calculates remaining months excluding complete years?", ans: "\"YM\" unit code.")
    #short-qa(num: 3, q: "Why must initial year 0 outlay be added outside Excel's =NPV() function?", ans: "Because NPV assumes cash flows begin at period 1.")
    #short-qa(num: 4, q: "What is the mathematical relationship between PMT, IPMT, and PPMT?", ans: "PMT = IPMT + PPMT for every period.")
  ],
  [
    #mcq(num: 1, q: "In Excel's serial date system, what decimal value represents 12:00 PM (Noon)?", a: "0.12", b: "0.50", c: "12.0", d: "0.24", ans: "B", expl: "A 24-hour day equals 1.0; 12 hours is exactly half a day (0.50).")
    #mcq(num: 2, q: "Which function calculates project completion date after 45 business working days excluding weekends?", a: "=DATEADD", b: "=WORKDAY", c: "=EDATE", d: "=EOMONTH", ans: "B", expl: "=WORKDAY adds working business days skipping weekends and holidays.")
    #mcq(num: 3, q: "Which function calculates the principal repayment component of an EMI in month 12?", a: "=PMT", b: "=PPMT", c: "=IPMT", d: "=PV", ans: "B", expl: "PPMT extracts the exact principal repayment portion for period per.")
  ]
)

#v(2pt)

#spotlight-box("2027 CLOUD REAL-TIME MONTE CARLO RISK SIMULATIONS", [
  Excel 365 Enterprise integrates Python in Excel (`=PY`) and cloud Monte Carlo simulations. Financial analysts can simulate 10,000 project cash flow scenarios with stochastic interest rates and inflation variables in seconds, calculating probabilistic Value at Risk (VaR) without third-party legacy add-ins.
])
"""

    with open(os.path.join(eng_dir, "chapter-18.typ"), "w", encoding="utf-8") as f:
        f.write(ch18_en)

# =========================================================================
    # CHAPTER 18: Date, Time, Financial & Statistical Analysis (Hindi - 4 Pages)
    # =========================================================================
    ch18_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[भाग 2: माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज मास्टरी · अध्याय 18]
= दिनांक, समय, वित्तीय इंजीनियरिंग एवं उन्नत सांख्यिकीय विश्लेषण

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  दिनांक एवं समय गणना, वैधानिक वित्तीय ऋण किस्त (EMI), पूंजीगत बजटिंग (NPV/IRR) तथा सांख्यिकीय विचलन (Standard Deviation) कॉर्पोरेट डेटा विश्लेषण के मजबूत आधारस्तंभ हैं। एक्सेल का सीरियल नंबर इंजन एवं उन्नत वित्तीय एल्गोरिदम वैश्विक मल्टी-करेंसी परिदृश्यों में पूर्ण गणितीय सटीकता सुनिश्चित करते हैं।
]

#v(2pt)

== 18.1 एक्सेल की आंतरिक सीरियल दिनांक एवं समय गणना संरचना

सभी बाह्य फॉर्मेटिंग के पीछे, एक्सेल दिनांक को केवल एक धनात्मक पूर्णांक (Integer) तथा समय को एक दशमलव भिन्न (Decimal) के रूप में देखता है:
- *सीरियल बेस सिस्टम*: दिन `1` का अर्थ है `1 जनवरी 1900`।
- इसके बाद का प्रत्येक दिन पूर्णांक में `1` की वृद्धि करता है। उदाहरणार्थ, `1 जनवरी 2027` आंतरिक रूप से `46388` है।
- *समय दशमलव के रूप में*: पूरा 24 घंटे का दिन `1.0` के बराबर होता है:
  - `सुबह 6:00 बजे` = 6 / 24 = `0.25`
  - `दोपहर 12:00 बजे` = 12 / 24 = `0.50`
  - `शाम 6:00 बजे` = 18 / 24 = `0.75`
- अतः `2027-01-01 12:00 PM` आंतरिक रूप से दशमलव संख्या `46388.50` है।

#v(2pt)
#formula-specimen(title: "वर्तमान गतिशील दिनांक व समय फॉर्मूला", formula: "=TODAY() [गतिशील दिनांक]   |   =NOW() [गतिशील दिनांक + समय]", note: "वर्कबुक में किसी भी सेल का मान बदलने या रीकैलकुलेट होने पर यह स्वतः अपडेट हो जाता है।")
#v(2pt)

== 18.2 दिनांक व समय का विखंडन एवं संयोजन: YEAR, MONTH, DAY, DATE

- `=YEAR(date)`: 4 अंकों का वर्ष प्रदान करता है (जैसे `2027`)।
- `=MONTH(date)`: माह का पूर्णांक प्रदान करता है (1 से 12 तक)।
- `=DAY(date)`: माह का दिन प्रदान करता है (1 से 31 तक)।
- `=HOUR(time)`, `=MINUTE(time)`, `=SECOND(time)`: समय के घंटे, मिनट और सेकंड निकालते हैं।
- *सुरक्षित दिनांक संयोजन*: दिनांक को कभी भी टेक्स्ट स्ट्रिंग `"04/05/2027"` के रूप में न लिखें (जिससे अमेरिकी MM/DD तथा भारतीय DD/MM में भ्रम पैदा होता है)। सदैव `=DATE(year, month, day)` का प्रयोग करें:
  ```
  =DATE(2027, 4, 15)
  ```

#table(
  columns: (1.2fr, 2.5fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*फॉर्मूला*], [*सिंटैक्स एवं कार्यप्रणाली*], [*कॉर्पोरेट उपयोगिता*]),
  [`=DATE(Y, M, D)`], [पूर्णांकों से सुरक्षित सीरियल दिनांक बनाता है।], [मानकीकृत अनुबंध आरंभ तिथियां बनाना।],
  [`=TIME(H, M, S)`], [घंटे, मिनट, सेकंड से सटीक समय भिन्न बनाता है।], [कारखाने की शिफ्ट टाइमिंग का प्रबंधन।],
  [`=WEEKDAY(dt, [type])`], [सप्ताह का दिन (1-7) लौटाता है।], [सप्ताहांत में अनधिकृत लेन-देन का ऑडिट।],
  [`=ISOWEEKNUM(dt)`], [ISO-8601 मानक सप्ताह संख्या (1-53) लौटाता है।], [सप्लाई चेन लॉजिस्टिक्स बैच ट्रैकिंग।]
)

#pagebreak()

== 18.3 गुप्त DATEDIF फंक्शन: सटीक आयु एवं सेवा अवधि (Tenure) की गणना

एक्सेल का अत्यंत लोकप्रिय व गुप्त फंक्शन `=DATEDIF` दो तिथियों के बीच पूर्ण समयावधि निकालता है:

```
सिंटैक्स: =DATEDIF( start_date , end_date , "unit" )
```

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*इकाई (Unit)*], [*मापी गई अवधि*], [*परिणाम का विवरण*], [*व्यावहारिक उदाहरण*]),
  [`"Y"`], [पूर्ण वर्ष], [दो तिथियों के बीच बीते हुए कुल पूर्ण वर्ष।], [कर्मचारी की कुल सेवा अवधि।],
  [`"M"`], [पूर्ण माह], [दो तिथियों के बीच बीते हुए कुल पूर्ण महीने।], [ऋण भुगतान की पूर्ण किस्त अवधि।],
  [`"D"`], [पूर्ण दिन], [कुल बीते हुए कैलेंडर दिन (`end - start` के समान)।], [प्रोजेक्ट कार्यदिवस गणना।],
  [`"YM"`], [शेष माह], [पूर्ण वर्षों को घटाने के पश्चात बचे हुए शेष महीने।], [आयु गणना का माह घटक।],
  [`"MD"`], [शेष दिन], [पूर्ण महीनों को घटाने के पश्चात बचे हुए शेष दिन।], [आयु गणना का दिन घटक।]
)

#v(2pt)
#formula-specimen(title: "कर्मचारी की सटीक आयु व कार्यकाल स्ट्रिंग फॉर्मूला", formula: "=DATEDIF(DOB, TODAY(), \"Y\") & \" वर्ष, \" & DATEDIF(DOB, TODAY(), \"YM\") & \" माह, \" & DATEDIF(DOB, TODAY(), \"MD\") & \" दिन\"", note: "एचआर हेतु सटीक सेवा विवरण स्ट्रिंग तैयार करता है: '28 वर्ष, 4 माह, 12 दिन'।")
#v(2pt)

== 18.4 कार्यदिवस एवं परियोजना अनुसूची: WORKDAY एवं NETWORKDAYS

साधारण कैलेंडर गणना में सप्ताहांत शामिल होते हैं। व्यावसायिक प्रोजेक्ट में केवल कार्यदिवसों की आवश्यकता होती है:
- `=NETWORKDAYS(start_date, end_date, [holidays])`: शनिवार और रविवार को छोड़कर कुल शुद्ध कार्यदिवस निकालता है। सरकारी छुट्टियों की रेंज देने पर उन्हें भी घटा देता है।
- `=NETWORKDAYS.INTL(start, end, [weekend], [holidays])`: अनुकूलित सप्ताहांत (जैसे केवल रविवार या मध्य-पूर्व शुक्रवार/शनिवार) को कॉन्फ़िगर करने की सुविधा देता है।
- `=WORKDAY(start_date, days, [holidays])`: आरंभ तिथि में $N$ कार्यदिवस जोड़कर प्रोजेक्ट समाप्ति की सटीक तिथि बताता है।
- `=EDATE(start_date, months)`: सटीक $N$ महीने आगे या पीछे की तिथि निकालता है (वारंटी या बांड कूपन हेतु)।
- `=EOMONTH(start_date, months)`: किसी भी माह की अंतिम कैलेंडर तिथि निकालता है (जैसे बिलिंग चक्र का अंतिम दिन)।

#pagebreak()

== 18.5 कॉर्पोरेट वित्तीय इंजीनियरिंग: ऋण परिशोधन (PMT, IPMT, PPMT)

वित्तीय प्रबंधन में मासिक किस्त (EMI) तथा मूलधन व ब्याज का पृथक्करण अनिवार्य होता है:
- `=PMT(rate, nper, pv, [fv], [type])`: किसी ऋण अथवा वार्षिकी की निश्चित मासिक किस्त निकालता है।
  - *Rate*: प्रति अवधि ब्याज दर (यदि वार्षिक दर 12% है, तो मासिक दर `12% / 12` = `1%`)।
  - *Nper*: किस्तों की कुल संख्या (5 वर्ष का ऋण = `5 * 12` = `60` माह)।
  - *PV*: वर्तमान मूल्य / ऋण राशि (कैश फ्लो के आधार पर धनात्मक या ऋणात्मक)।
- `=IPMT(rate, per, nper, pv)`: किसी विशिष्ट किस्त `per` में शामिल *ब्याज की राशि* निकालता है।
- `=PPMT(rate, per, nper, pv)`: किसी विशिष्ट किस्त `per` में शामिल *मूलधन की राशि* निकालता है।
- *गणितीय नियम*: प्रत्येक किस्त अवधि में `=PMT(...) = IPMT(...) + PPMT(...)` शत-प्रतिशत सत्य होता है।

#v(2pt)
#formula-specimen(title: "₹10 लाख कॉर्पोरेट ऋण हेतु मासिक EMI फॉर्मूला", formula: "=PMT(9.5%/12, 5*12, -1000000)", note: "9.5% वार्षिक ब्याज पर 60 माह के ऋण हेतु सटीक ₹21,001.91 की मासिक किस्त प्रदान करता है।")
#v(2pt)

== 18.6 पूंजीगत बजटिंग एवं निवेश मूल्यांकन: NPV एवं IRR

नए कॉर्पोरेट प्रोजेक्ट अथवा अधिग्रहण के वित्तीय मूल्यांकन हेतु:
- `=NPV(discount_rate, value1, [value2], ...)`: शुद्ध वर्तमान मूल्य (Net Present Value) निकालता है।
  - *महत्वपूर्ण चेतावनी*: एक्सेल में `NPV` यह मानता है कि पहला कैश फ्लो वर्ष 1 में आया है। अतः प्रारंभिक निवेश (Year 0 Outlay) को फंक्शन के बाहर जोड़ना अनिवार्य है: `=NPV(rate, Year1:Year5) + Initial_Outlay_Yr0`।
- `=IRR(values, [guess])`: आंतरिक प्रतिफल दर (Internal Rate of Return) निकालता है जहां NPV शून्य होता है।

#table(
  columns: (1fr, 1.5fr, 1.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*अवधि*], [*प्रोजेक्ट कैश फ्लो*], [*10% पर डिस्काउंटेड*], [*संचयी स्थिति*]),
  [वर्ष 0], [-₹10,00,000 (पूंजीगत खर्च)], [-₹10,00,000], [-₹10,00,000 (प्रारंभिक निवेश)],
  [वर्ष 1], [+₹3,00,000], [+₹2,72,727], [-₹7,27,273],
  [वर्ष 2], [+₹4,00,000], [+₹3,30,579], [-₹3,96,694],
  [वर्ष 3], [+₹5,00,000], [+₹3,75,657], [-₹21,037],
  [वर्ष 4], [+₹4,00,000], [+₹2,73,205], [+₹2,52,168 (NPV = +₹2.52L, स्वीकृत!)]
)

#pagebreak()

== 18.7 सांख्यिकीय विश्लेषण: प्रसरण, मानक विचलन एवं वितरण

डेटा विश्लेषण में विश्वसनीयता की जांच हेतु सांख्यिकीय गणनाएं:
- `=AVERAGE(range)` / `=MEDIAN(range)` / `=MODE.SNGL(range)`: केंद्रीय प्रवृत्ति (औसत, मध्यिका, बहुलक)।
- `=STDEV.S(range)`: नमूना मानक विचलन (Sample Standard Deviation - जब सीमित सैंपल का परीक्षण हो)।
- `=STDEV.P(range)`: संपूर्ण जनसंख्या मानक विचलन (Population Standard Deviation - जब 100% डेटा उपलब्ध हो)।
- `=VAR.S(range)` / `=VAR.P(range)`: डेटा फैलाव की माप (Variance)।
- `=PERCENTILE.INC(range, k)`: $k$-वां पर्सेंटाइल निकालता है (जैसे $k = 0.90$ शीर्ष 10% प्रदर्शन दर्शाता है)।
- `=CORREL(array1, array2)`: दो चरों के बीच पियर्सन सहसंबंध गुणांक (-1 से +1) निकालता है।

#v(2pt)

== 18.8 मूल्यांकन डैशबोर्ड: तकनीकी बहुविकल्पीय प्रश्न (MCQs)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "एक्सेल की आंतरिक सीरियल प्रणाली में 1 जनवरी 1900 का मान क्या है?", ans: "पूर्णांक संख्या 1।")
    #short-qa(num: 2, q: "पूर्ण वर्षों को घटाने के बाद बचे हुए शेष माह निकालने वाला DATEDIF कोड कौन सा है?", ans: "\"YM\" यूनिट कोड।")
    #short-qa(num: 3, q: "=NPV() फॉर्मूला लगाते समय प्रारंभिक निवेश वर्ष 0 को बाहर क्यों जोड़ा जाता है?", ans: "क्योंकि NPV प्रथम कैश फ्लो वर्ष 1 से मानता है।")
    #short-qa(num: 4, q: "PMT, IPMT तथा PPMT के मध्य क्या गणितीय संबंध है?", ans: "प्रत्येक किस्त में PMT = IPMT + PPMT होता है।")
  ],
  [
    #mcq(num: 1, q: "एक्सेल के आंतरिक सीरियल दिनांक सिस्टम में दोपहर 12:00 बजे का मान क्या होता है?", a: "0.12", b: "0.50", c: "12.0", d: "0.24", ans: "B", expl: "पूरा दिन 1.0 होता है; 12 घंटे आधा दिन अर्थात 0.50 होते हैं।")
    #mcq(num: 2, q: "सप्ताहांत व छुट्टियों को छोड़कर 45 कार्यदिवस जोड़ने वाला फॉर्मूला कौन सा है?", a: "=DATEADD", b: "=WORKDAY", c: "=EDATE", d: "=EOMONTH", ans: "B", expl: "=WORKDAY कार्यदिवसों को जोड़कर परियोजना समाप्ति तिथि देता है।")
    #mcq(num: 3, q: "12वें महीने की EMI में से केवल मूलधन (Principal) निकालने वाला फॉर्मूला कौन सा है?", a: "=PMT", b: "=PPMT", c: "=IPMT", d: "=PV", ans: "B", expl: "PPMT किसी विशिष्ट अवधि का केवल मूलधन घटक लौटाता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 क्लाउड रियल-टाइम मोंटे कार्लो सिमुलेशन", [
  एक्सेल 365 एंटरप्राइज अब पायथन (`=PY`) तथा क्लाउड मोंटे कार्लो सिमुलेशन को सीधे सपोर्ट करता है। वित्तीय विश्लेषक अनिश्चित ब्याज दरों व मुद्रास्फीति के आधार पर 10,000 निवेश परिदृश्यों का संभाव्यता परीक्षण (Value at Risk) सेकंडों में बिना किसी बाहरी ऐड-इन के कर सकते हैं।
])
"""

    with open(os.path.join(hi_dir, "chapter-18.typ"), "w", encoding="utf-8") as f:
        f.write(ch18_hi)


