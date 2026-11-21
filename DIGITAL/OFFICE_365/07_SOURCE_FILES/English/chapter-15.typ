#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
