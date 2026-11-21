#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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


#v(3pt)
#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-ribbon-display.png", width: 95%, height: 80pt, fit: "contain")
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 12.1: Microsoft Excel 365 Ribbon Display Options & Formula Bar Telemetry.
  ]
]

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
