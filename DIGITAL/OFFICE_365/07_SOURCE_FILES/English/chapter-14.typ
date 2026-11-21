#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
