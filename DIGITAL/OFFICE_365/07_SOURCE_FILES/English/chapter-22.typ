#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 22]
= What-If Analysis, Power Query ETL & 5 Enterprise Production Labs

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Advanced spreadsheet modeling extends beyond historical reporting into predictive scenario forecasting and automated ETL (Extract, Transform, Load) data pipelines. This capstone chapter covers Goal Seek, Power Query data transformation, and deploys 5 comprehensive corporate Excel production labs.
]

#v(2pt)

== 22.1 What-If Analysis Suite: Goal Seek & Scenario Manager

Located under `Data > Forecast > What-If Analysis`:
- *Goal Seek*: Reverse-solves equations. Instead of guessing: "What sales volume is required to achieve ₹ 10 Lakh net profit?", Goal Seek iteratively iterates the input variable cell until the formula output cell hits the exact target value.
- *Scenario Manager*: Stores multiple business scenarios (e.g., Best Case, Base Case, Worst Case) with varying raw material prices and exchange rates, generating a consolidated comparative executive summary.
- *Data Tables (Sensitivity Analysis)*: Generates 1-variable or 2-variable sensitivity grids calculating how variations in interest rate and loan tenure impact monthly EMI payments.

#v(2pt)
#ribbon-specimen(path: "Data > Forecast > What-If Analysis > Goal Seek", command: "Algorithmic Inverse Equation Solver", shortcut: "Alt + A + W + G")
#v(2pt)

== 22.2 Power Query Architecture (Get & Transform Data)

Power Query (`Data > Get & Transform Data`) is Excel's enterprise ETL pipeline. It automates repetitive data cleaning:

```
[Raw Disjoint Sources] (CSV, Web, SQL, Folder of 50 Excel Files)
                           │
                           ▼
             [Power Query Engine (M Language)]
  - Remove Top 4 Junk Rows       - Split Column by Delimiter
  - Promote First Row as Headers - Unpivot 12 Monthly Columns to Rows
  - Strip Trailing Whitespaces   - Change Data Types to Currency/Date
                           │
                           ▼
    [Clean Data Model Spilled Automatically to Worksheet]
```

- *The Magic of "Refresh All" (`Ctrl + Alt + F5`)*: Once a Power Query pipeline is configured, next month's messy 50,000-row file is processed in 1 click!

#pagebreak()

== 22.3 Corporate Production Lab 6: Automated Student Marksheet Model

#block(
  stroke: 0.5pt + rgb("#059669"),
  fill: rgb("#F0FDF4"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#059669"))[LAB 6: ACADEMIC EXAMINATION EVALUATOR & DYNAMIC RANK MATRIX]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Build an enterprise automated marksheet calculating Total, Percentage, Pass/Fail Status, Grade (`IFS`), and Rank (`RANK.EQ`).\
      *Execution Sequence*:
      1. *Grid Setup*: Columns: `Roll_No (A)`, `Name (B)`, `Math (C)`, `Science (D)`, `English (E)`.
      2. *Total & Percentage*: In F2: `=SUM(C2:E2)`. In G2: `=F2 / 300` (Format as Percentage with 1 decimal).
      3. *Pass / Fail Engine*: In H2: `=IF(AND(C2>=35, D2>=35, E2>=35), "PASS", "FAIL")`. Requires passing all individual subjects!
      4. *Multi-Tier Grade Formula*: In I2:
         ```
         =IF(H2="FAIL", "F", IFS(G2>=0.90, "A+", G2>=0.80, "A", G2>=0.70, "B", G2>=0.60, "C", TRUE, "D"))
         ```
      5. *Dynamic Rank*: In J2: `=IF(H2="FAIL", "N/A", RANK.EQ(F2, $F$2:$F$100, 0))`.
      6. *Conditional Formatting*: Highlight failing scores (< 35) in soft red fill.
    ]
  ]
)

#v(2pt)

== 22.4 Corporate Production Lab 7: Enterprise GST Tax Invoice Generator

#block(
  stroke: 0.5pt + rgb("#0284C7"),
  fill: rgb("#F0F9FF"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#0284C7"))[LAB 7: STATUTORY GST TAX INVOICE WITH AUTOMATIC HSN TAX ENGINE]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Construct an audited B2B Tax Invoice calculating Taxable Value, CGST (9%), SGST (9%), IGST (18%), and Grand Total.\
      *Execution Sequence*:
      1. *Header Architecture*: Invoice No, Date (`=TODAY()`), Customer GSTIN, Place of Supply.
      2. *Item Grid*: S.No, Description, HSN Code, Qty, Unit Price, Amount (`=Qty * Unit Price`).
      3. *Tax Logic*: Check if Place of Supply is within state:
         - CGST (9%): `=IF(State="Karnataka", SubTotal * 0.09, 0)`
         - SGST (9%): `=IF(State="Karnataka", SubTotal * 0.09, 0)`
         - IGST (18%): `=IF(State<>"Karnataka", SubTotal * 0.18, 0)`
      4. *Grand Total*: `=SubTotal + CGST + SGST + IGST`.
      5. *Format*: Apply Indian currency masking `[₹] #,##,##0.00` across all monetary cells.
    ]
  ]
)

#pagebreak()

== 22.5 Corporate Production Lab 8: Monthly Employee Attendance Register

#block(
  stroke: 0.5pt + rgb("#D97706"),
  fill: rgb("#FFFBEB"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#D97706"))[LAB 8: 31-DAY ATTENDANCE TRACKER WITH CONDITIONAL PAYROLL DAYS]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Track 31-day shift attendance codes (`P`, `A`, `HD`, `WO`, `CL`) and calculate net payable salary days.\
      *Execution Sequence*:
      1. *Data Validation*: Apply List validation across daily cells (Columns C through AG): `P, A, HD, WO, CL`.
      2. *Present Count*: `=COUNTIF(C2:AG2, "P")`.
      3. *Weekly Off Count*: `=COUNTIF(C2:AG2, "WO")`.
      4. *Paid Leave Count*: `=COUNTIF(C2:AG2, "CL")`.
      5. *Half Day Count*: `=COUNTIF(C2:AG2, "HD") * 0.5`.
      6. *Payable Salary Days Formula*:
         ```
         =COUNTIF(C2:AG2, "P") + COUNTIF(C2:AG2, "WO") + COUNTIF(C2:AG2, "CL") + (COUNTIF(C2:AG2, "HD") * 0.5)
         ```
      7. *Conditional Formatting*: Auto-color Absent (`A`) in soft red, Present (`P`) in soft green, Weekly Off (`WO`) in blue.
    ]
  ]
)

#v(2pt)

== 22.6 Corporate Production Lab 9: Multi-Tier Enterprise Payroll Salary Slip

#block(
  stroke: 0.5pt + rgb("#7C3AED"),
  fill: rgb("#FAF5FF"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#7C3AED"))[LAB 9: INDIAN STATUTORY PAYROLL SLIP (PF, ESI, TDS & NET SALARY)]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Model an audited monthly salary slip incorporating Basic Pay, HRA, DA, PF, ESI, Professional Tax, and TDS.\
      *Execution Sequence*:
      1. *Earnings Grid*:
         - Basic Pay: Fixed base (e.g. ₹ 40,000)
         - HRA (House Rent Allowance): `=Basic * 0.40` (40% of Basic)
         - DA (Dearness Allowance): `=Basic * 0.15` (15% of Basic)
         - Special Allowance: Balancing figure
         - Gross Salary: `=SUM(Earnings_Range)`
      2. *Deductions Grid (Statutory Indian Law)*:
         - PF (Employee Provident Fund): `=MIN(Basic, 15000) * 0.12` (Capped at statutory wage ceiling)
         - ESI (Employee State Insurance): `=IF(Gross <= 21000, Gross * 0.0075, 0)` (0.75% if Gross <= 21k)
         - Professional Tax (PT): `=IF(Gross > 15000, 200, 0)`
         - TDS Income Tax: Calculated monthly tax slab deduction
         - Total Deductions: `=SUM(Deductions_Range)`
      3. *Net Take-Home Pay*: `=Gross_Salary - Total_Deductions`.
    ]
  ]
)

#pagebreak()

== 22.7 Corporate Production Lab 10: Executive Sales KPI Interactive Dashboard

#block(
  stroke: 0.5pt + rgb("#059669"),
  fill: rgb("#ECFDF5"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#059669"))[LAB 10: EXECUTIVE BI KPI DASHBOARD WITH DUAL SLICERS & DYNAMIC CHARTS]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Build an interactive C-Suite executive sales dashboard featuring Pivot Tables, Slicers, and linked KPI visualizations.\
      *Execution Sequence*:
      1. *Table Conversion*: Select raw 10,000-row sales log; press `Ctrl + T` to name it `SalesData`.
      2. *Pivot Table 1 (Regional Breakdown)*: Rows: Region; Values: Sum of Sales, Count of Invoices.
      3. *Pivot Table 2 (Product Performance)*: Rows: Category; Values: Sum of Margin (% of Column Total).
      4. *Insert Slicers*: Add Slicer for `Fiscal_Year` and `Sales_Rep`.
      5. *Report Connections*: Right-click each Slicer -> Report Connections -> Link to BOTH Pivot Tables.
      6. *Pivot Charts*: Build Clustered Column Chart for regional sales and Donut Chart for categories.
      7. *Testing*: Click "2027" on Slicer; all charts, metrics, and tables update simultaneously in 50ms!
    ]
  ]
)

#v(2pt)

== 22.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which tool reverse-solves an input cell value to hit a specific formula target?", ans: "Goal Seek (Data > What-If Analysis > Goal Seek).")
    #short-qa(num: 2, q: "What is the global shortcut to refresh all Power Query and Pivot Table connections?", ans: "Ctrl + Alt + F5.")
    #short-qa(num: 3, q: "Under Indian statutory payroll rules, what is the employee PF contribution rate?", ans: "12% of Basic Pay (capped at statutory wage ceiling).")
    #short-qa(num: 4, q: "Which Power Query transformation converts 12 monthly columns into rows?", ans: "Unpivot Columns.")
  ],
  [
    #mcq(num: 1, q: "In Goal Seek, which cell must contain a formula?", a: "By changing cell", b: "Set cell", c: "To value", d: "Any cell", ans: "B", expl: "'Set cell' must strictly contain a formula whose output Goal Seek attempts to solve.")
    #mcq(num: 2, q: "What is the primary architectural advantage of Power Query over manual copy-pasting?", a: "Makes file green", b: "All transformation steps are recorded and execute automatically upon clicking 'Refresh'", c: "Eliminates need for Excel", d: "Prints faster", ans: "B", expl: "Power Query records an ETL script in M code, allowing instant re-execution on new data files.")
    #mcq(num: 3, q: "In Lab 7 GST Invoice, which tax is charged when goods are sold to an out-of-state customer?", a: "CGST only", b: "SGST only", c: "Integrated GST (IGST)", d: "No tax", ans: "C", expl: "Inter-state sales attract IGST (Integrated Goods and Services Tax).")
  ]
)

#v(2pt)

#spotlight-box("2027 AUTOMATED ETL DATA WEBSOCKET PIPELINES", [
  Power Query in Excel 365 natively consumes Apache Kafka and Microsoft Fabric Lakehouse delta tables. Financial analysts can stream enterprise ledger transactions directly into the Excel data model with continuous micro-batch refreshes without third-party ODBC drivers.
])
