#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
