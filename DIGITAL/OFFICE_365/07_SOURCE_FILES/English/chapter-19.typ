#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 19]
= Data Validation, Cascading Dependent Dropdowns & Audit Diagnostics

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Defensive spreadsheet engineering requires preventing corrupted, misspelled, or out-of-range data from entering worksheets at the moment of keystroke input. Data Validation enforces input contracts, powers interactive in-cell dropdowns, and structures cascading dependent menus.
]

#v(2pt)

== 19.1 Data Validation Architecture & Verification Criteria

Located under `Data > Data Tools > Data Validation` (`Alt + A + V + V`), the engine restricts input across 7 validation categories:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Validation Type*], [*Mathematical Validation Rule*], [*Enterprise Operational Control*]),
  [Whole Number], [Restricts entry to integers between $min$ and $max$.], [Warehouse inventory order quantities (e.g. 1 to 500).],
  [Decimal], [Permits floating-point currency and percentages.], [Employee commission rates between 0.01 and 0.25.],
  [List], [Constrains entry strictly to items in a designated list.], [Department names, product categories, Indian States.],
  [Date], [Restricts dates to valid past or future intervals.], [Disallowing future invoice dates or dates prior to FY 2027.],
  [Text Length], [Restricts string length to exact integer count.], [Mandating exact 10-digit PAN or 12-digit Aadhaar inputs.],
  [Custom Formula], [Evaluates custom formula; permits entry if formula returns `TRUE`.], [Preventing duplicate employee IDs via `=COUNTIF(...)<=1`.]
)

#v(2pt)
#ribbon-specimen(path: "Data > Data Tools > Data Validation", command: "Configure Input Integrity Criteria", shortcut: "Alt + A + V + V")
#v(2pt)

== 19.2 The 3 Error Alert Enforcement Styles

When a user attempts an unauthorized input, Excel's *Error Alert* dialog enforces policy:
- *Stop (Red Octagon with White X)*: **Hard Wall**. Completely blocks input. The user cannot proceed until they enter valid data or press `Esc`. (Mandatory for financial accounting models).
- *Warning (Yellow Triangle with !)*: **Soft Wall**. Warns the user of deviation, but presents "Yes / No / Cancel" allowing intentional overrides.
- *Information (Blue Circle with i)*: **Advisory Only**. Informs the user of standard policy but defaults to accepting the rogue input.

#pagebreak()

== 19.3 In-Cell Dropdown Menus: Static vs. Dynamic Table Linking

Dropdown menus eliminate spelling errors in corporate records:
- *Static List*: In Data Validation, choose *List*, and type comma-separated items into the *Source* box:
  ```
  Bangalore, Mumbai, Delhi, Hyderabad, Chennai
  ```
- *Dynamic Range Linking*: Point *Source* to a cell range: `=MasterData!$A$2:$A$50`.
- *Structured Table Linking*: To make the dropdown dynamically absorb newly added rows without manual range adjustments:
  1. Convert master list to an official Excel Table (`Ctrl + T`) named `CityTable`.
  2. In Data Validation Source, enter `=INDIRECT("CityTable[CityName]")`.

#v(2pt)
#formula-specimen(title: "DYNAMIC TABLE DROPDOWN SOURCE", formula: "=INDIRECT(\"DepartmentList[DeptName]\")", note: "Automatically expands dropdown list when HR adds new company departments to the master table.")
#v(2pt)

== 19.4 Cascading Dependent Dropdown Menus (The INDIRECT Engine)

In corporate procurement, selecting a Category (e.g. "Hardware") must dynamically update a second dropdown to display only relevant Items ("Laptops", "Servers", "Switches"):

*The Step-by-Step Enterprise Protocol*:
1. **Set Up Category Lists**: In a reference sheet, create columns for each category with the category name as the header:
   - Column A: `Hardware` (Rows below: Laptop, Server, Switch, Router)
   - Column B: `Software` (Rows below: Windows 11, Office 365, Antivirus, Adobe)
   - Column C: `Services` (Rows below: Cloud Backup, Annual AMC, Pentesting)
2. **Create Named Ranges (`Ctrl + Shift + F3`)**: Highlight all columns, press `Ctrl + Shift + F3`, and check *Top row*. Excel creates three named ranges named `Hardware`, `Software`, and `Services`.
3. **Primary Dropdown**: In Cell `A2`, set Data Validation List pointing to `=$A$1:$C$1` (Hardware, Software, Services).
4. **Dependent Dropdown**: In Cell `B2`, set Data Validation List with Source:
   ```
   =INDIRECT(A2)
   ```
5. *Result*: When the user selects "Hardware" in A2, `=INDIRECT(A2)` resolves to the named range `Hardware`, instantly populating B2 with Laptops, Servers, and Switches!

#pagebreak()

== 19.5 Custom Validation Formulas: Advanced Integrity Rules

Custom validation rules evaluate Boolean expressions, permitting input only when the formula returns `TRUE`:

- *Preventing Duplicate Entries in Column A (Unique Employee ID)*:
  ```
  =COUNTIF($A:$A, A1) <= 1
  ```
  If a user attempts to type an existing Employee ID, Excel immediately triggers the Stop Alert!
- *Disallowing Weekend Dates*:
  ```
  =WEEKDAY(B2, 2) <= 5
  ```
  Rejects dates falling on Saturday or Sunday.
- *Restricting Uppercase Input Only*:
  ```
  =EXACT(A2, UPPER(A2))
  ```
  Ensures statutory tax codes are entered strictly in capital letters.

#v(2pt)
#formula-specimen(title: "UNIQUE ENTRY VALIDATION RULE", formula: "=COUNTIF($A:$A, A1) <= 1", note: "Blocks duplicate invoice numbers or employee IDs at the point of data entry.")
#v(2pt)

== 19.6 Auditing Legacy Sheets: Circle Invalid Data Tool

When inheriting existing worksheets with thousands of unvalidated rows, applying Data Validation rules does not retroactively delete pre-existing bad data.

*How to Audit*:
1. Apply the desired validation criteria to the column.
2. Click `Data > Data Tools > Data Validation > Circle Invalid Data`.
3. Excel draws high-visibility red ellipses around every cell that violates the rule!
4. Once rogue cells are corrected, click *Clear Validation Circles*.

#pagebreak()

== 19.7 Production Blueprint: Corporate Purchase Order Entry Form

Below is an authentic purchase order form featuring cascading validation and unique constraint enforcement:

#table(
  columns: (1fr, 1.8fr, 2.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Field Name*], [*Input Cell*], [*Applied Validation Architecture*], [*Enforcement Behavior*]),
  [PO Number], [Cell B2], [Custom: `=COUNTIF($B:$B, B2)<=1`], [Stop Alert: "Duplicate PO Number detected!"],
  [Vendor Category], [Cell B3], [List: `=CategoryList`], [In-cell dropdown: Hardware, Software, Services],
  [Item Description], [Cell B4], [Dependent List: `=INDIRECT(B3)`], [Cascades based on Category chosen in Cell B3],
  [Order Quantity], [Cell B5], [Whole Number: Between 1 and 100], [Rejects zero, negative, or non-integer quantities]
)

#v(2pt)

== 19.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which error alert style completely blocks invalid data entry?", ans: "Stop Alert (Red Octagon).")
    #short-qa(num: 2, q: "Which function enables cascading dependent dropdowns from a parent cell?", ans: "INDIRECT function.")
    #short-qa(num: 3, q: "Which tool highlights existing rogue data in a worksheet with red circles?", ans: "Data > Data Validation > Circle Invalid Data.")
    #short-qa(num: 4, q: "What custom formula enforces unique values across column A?", ans: "=COUNTIF($A:$A, A1) <= 1.")
  ],
  [
    #mcq(num: 1, q: "What happens when a user enters invalid data into a cell protected by an Information Alert?", a: "Input is completely blocked", b: "A message appears, but accepting the alert allows the invalid data to be saved", c: "Computer restarts", d: "Cell is formatted red", ans: "B", expl: "Information alerts are advisory only; they inform the user but do not reject the entry.")
    #mcq(num: 2, q: "Why must named ranges match parent dropdown category names when using =INDIRECT(A1)?", a: "To save memory", b: "INDIRECT evaluates the text in A1 as the pointer to that specific named range", c: "Required by Windows", d: "To enable printing", ans: "B", expl: "INDIRECT dynamically resolves text strings into addressable named ranges.")
    #mcq(num: 3, q: "Which validation type ensures an employee PAN card input is exactly 10 characters long?", a: "Whole Number", b: "Text Length", c: "Custom Formula", d: "Decimal", ans: "B", expl: "Text Length validation permits setting criteria to 'equal to 10'.")
  ]
)

#v(2pt)

#spotlight-box("2027 CLOUD-MANAGED METADATA VALIDATION", [
  Excel 365 Enterprise links Data Validation directly to Microsoft Purview data governance catalogs. When typing client names, Excel validates entries against live enterprise Azure AD entity stores, auto-completing GST identification numbers and legal entity codes in real-time.
])
