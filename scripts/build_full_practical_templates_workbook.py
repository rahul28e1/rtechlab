import os
import subprocess
import fitz

def build_full_templates_workbook():
    out_dir = 'DIGITAL/OFFICE_365/02_PRACTICAL_EXCEL_TEMPLATES'
    os.makedirs(out_dir, exist_ok=True)
    typ_path = os.path.join(out_dir, "templates_guide.typ")
    pdf_out = os.path.join(out_dir, "Office-365-Practical-Excel-Templates-Workbook-Guide.pdf")

    typ_src = r"""#import "../07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "Excel 365 Enterprise Practical Templates Workbook Guide (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5(
  title: "EXCEL 365 PRACTICAL TEMPLATES WORKBOOK",
  subtitle: "12 Production Enterprise Workbooks · Complete Schemas, Advanced Formulas & Corporate Deployments",
  edition: "2027 CAREER ACCELERATOR DELIVERABLE · EDITION 1",
  series-pill: "RTECHLAB COMMERCIAL SUITE · PRACTICAL WORKBOOK GUIDE",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-O365-EXCEL-LABS",
  logo-path: "/DIGITAL/OFFICE_365/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-365-full-workspace.png"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Excel 365 Practical Templates Workbook",
  edition: "2027 Master Edition · Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-O365-EXCEL-LABS"
)

#pagebreak()

= Enterprise Practical Excel Templates Catalog & Architecture

#concept-box(title: "PRACTICAL WORKBOOK ARCHITECTURE · RTECHLAB 2027")[
  This standalone workbook deliverable provides complete formula architectures, data schema layouts, and operational instructions for 12 commercial-grade Excel workbooks included in the RTechLab ₹149 Career Accelerator Bundle. Each template has been pre-built, debugged, and standardized to Fortune 500 corporate financial modeling standards.
]

#v(2pt)

== 1. Master Enterprise Workbooks Directory
#table(
  columns: (0.7fr, 2.2fr, 2.1fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Tmpl No.*], [*Enterprise Template Name*], [*Core Formulas & Functions*], [*Corporate Target Deployment*]),
  [TMP-01], [Loan Amortization & Debt EMI Schedule], [PMT, IPMT, PPMT, ROUND, CUMIPMT], [Retail Banking, Corporate Debt Schedules],
  [TMP-02], [Dynamic Inventory & Reorder Tracker], [XLOOKUP, IF, NORM.S.INV, STDEV.S], [Supply Chain, Multi-Branch Warehouses],
  [TMP-03], [Automated Employee Payroll & Payslip], [IFS, ROUND, DATEDIF, VLOOKUP], [HR Operations, Statutory PF/ESI/TDS],
  [TMP-04], [Multi-Tier Sales Commission Matrix], [SUMPRODUCT, IFS, XLOOKUP, LET], [B2B Corporate Sales & Incentive Slabs],
  [TMP-05], [Capital Budgeting & DCF Valuation], [NPV, IRR, XNPV, XIRR, Data Tables], [M&A Due Diligence, Corporate Expansion],
  [TMP-06], [Employee Gratuity & Tenure Calculator], [DATEDIF, YEARFRAC, IF, EOMONTH], [HR Compliance & Payment of Gratuity Act],
  [TMP-07], [Interactive C-Suite Executive KPI Board], [PivotTables, Slicers, GETPIVOTDATA], [Boardroom Reviews, Quarterly Earnings],
  [TMP-08], [Multi-Source Power Query Reconciliation], [M-Code ETL, Anti-Join, Fuzzy Merge], [Financial Audit, Bank Statement Matching],
  [TMP-09], [Automated Commercial B2B GST Invoice], [XLOOKUP, TEXTJOIN, Form Controls], [Accounts Receivable, Vendor Billing],
  [TMP-10], [Dynamic Project Gantt Chart Model], [WORKDAY.INTL, NETWORKDAYS, Cond. Fmt], [Agile & Waterfall Project Timelines],
  [TMP-11], [Statistical Quality Control (SPC) Model], [AVERAGE, STDEV.S, NORM.DIST, Z-Score], [Manufacturing Six Sigma Defect Analysis],
  [TMP-12], [2027 Copilot AI Python Financial Model], [=PY, pandas, seaborn, linear_model], [Predictive Cash Flow & Churn Modeling]
)

#v(2pt)

== 2. Financial Modeling Hygiene & Color Conventions
All workbooks strictly enforce standard corporate financial modeling color conventions:
- *Blue Font (`#0000FF`)*: User Input Cells (raw variables that users can modify).
- *Black Font (`#000000`)*: Calculation & Formula Cells (locked and protected against accidental edits).
- *Green Font (`#008000`)*: External Workbook & Cross-Sheet References.
- *Light Gray Fill (`#F1F5F9`)*: Non-editable Metadata, Headers & Summary Rows.

#v(2pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-365-full-workspace.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure: Live Microsoft Excel 365 Grid showing Standard Formula Bar, Table Architecture & Copilot AI Sidebar.
  ]
]

#pagebreak()

= Template 01: Loan Amortization & Debt EMI Schedule

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Calculates exact monthly Equated Monthly Installments (EMI), separates each installment into interest and principal repayments, and dynamically updates repayment schedules when lump-sum prepayments are introduced.
]

#v(2pt)

== 1. Mathematical Architecture & Core Formulas
#formula-specimen(
  title: "MONTHLY EMI CALCULATION FORMULA",
  formula: "=PMT(Annual_Rate / 12, Total_Tenure_Years * 12, -Loan_Principal)",
  note: "Calculates the uniform monthly repayment required to amortize principal to zero."
)

#v(2pt)

#formula-specimen(
  title: "PERIOD INTEREST & PRINCIPAL ISOLATION",
  formula: "=IPMT(Rate/12, Period, Tenure*12, -Principal)  |  =PPMT(Rate/12, Period, Tenure*12, -Principal)",
  note: "Mathematical law: In every period, PMT = IPMT + PPMT."
)

#v(2pt)

== 2. Live Corporate Loan Amortization Schedule (₹10,00,000 @ 9.5% for 5 Years)
#table(
  columns: (0.8fr, 1.3fr, 1.2fr, 1.3fr, 1.3fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Month*], [*Opening Principal*], [*Monthly EMI*], [*Interest (IPMT)*], [*Principal (PPMT)*], [*Closing Principal*]),
  [Month 01], [₹10,00,000.00], [₹21,001.91], [₹7,916.67], [₹13,085.24], [₹9,86,914.76],
  [Month 02], [₹9,86,914.76], [₹21,001.91], [₹7,813.08], [₹13,188.83], [₹9,73,725.93],
  [Month 03], [₹9,73,725.93], [₹21,001.91], [₹7,708.66], [₹13,293.25], [₹9,60,432.68],
  [Month 04], [₹9,60,432.68], [₹21,001.91], [₹7,603.43], [₹13,398.48], [₹9,47,034.20],
  [Month 05], [₹9,47,034.20], [₹21,001.91], [₹7,497.35], [₹13,504.56], [₹9,33,529.64],
  [Month 12], [₹8,49,850.12], [₹21,001.91], [₹6,727.98], [₹14,273.93], [₹8,35,576.19],
  [Month 24], [₹6,68,230.45], [₹21,001.91], [₹5,290.16], [₹15,711.75], [₹6,52,518.70],
  [Month 36], [₹4,68,110.30], [₹21,001.91], [₹3,705.87], [₹17,296.04], [₹4,50,814.26],
  [Month 48], [₹2,47,560.80], [₹21,001.91], [₹1,959.86], [₹19,042.05], [₹2,28,518.75],
  [Month 60], [₹20,836.98], [₹21,001.91], [₹164.93], [₹20,836.98], [₹0.00 (Fully Paid)]
)

#v(2pt)

== 3. Step-by-Step Implementation Protocol
1. *Define Named Ranges*: Set Cell `C4` as `Loan_Amount`, `C5` as `Annual_Rate`, and `C6` as `Tenure_Years`.
2. *Calculate Base EMI*: In Cell `C8`, enter `=ROUND(PMT(Annual_Rate/12, Tenure_Years*12, -Loan_Amount), 2)`.
3. *Build Dynamic Schedule*: Use `=SEQUENCE(Tenure_Years*12)` in column A to auto-generate all installment numbers.
4. *Add Prepayment Logic*: In the Closing Balance formula, subtract any extra principal payment made in that month: `=Opening - PPMT - Prepayment`.

#v(2pt)

#spotlight-box("FINANCIAL ANALYST TAKEAWAY", [
  Introducing a single ₹1,00,000 prepayment at Month 12 reduces total interest paid across the loan tenure by ₹42,380 and slashes repayment duration by 7 full calendar months.
])

#pagebreak()

= Template 02: Multi-Location Warehouse Dynamic Inventory Tracker

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Automates inventory stock reconciliation across multiple warehouse fulfillment centers, monitors consumption lead times, calculates dynamic safety stock, and fires automated reorder triggers.
]

#v(2pt)

== 1. Mathematical Architecture & Formula Blueprint
#formula-specimen(
  title: "DYNAMIC REORDER LEVEL WITH SAFETY STOCK",
  formula: "=ROUNDUP((Average_Daily_Sales * Lead_Time_Days) + Safety_Stock, 0)",
  note: "Guarantees fulfillment continuity during peak supplier delivery delays."
)

#v(2pt)

#formula-specimen(
  title: "AUTOMATED REORDER STATUS TRIGGER",
  formula: "=IF(Current_Stock <= Reorder_Level, \"TRIGGER REORDER\", \"OPTIMAL\")",
  note: "Drives automated Conditional Formatting alert badges on executive inventory monitors."
)

#v(2pt)

== 2. Live Warehouse Inventory Specimen Register
#table(
  columns: (1fr, 1.8fr, 1.1fr, 1fr, 1fr, 1.1fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*SKU Code*], [*Product Description*], [*Warehouse*], [*Current*], [*Safety*], [*Reorder*], [*Order Status*]),
  [SKU-101], [Enterprise Server Blade 1U], [Bengaluru HQ], [14 Units], [10 Units], [25 Units], [TRIGGER REORDER],
  [SKU-102], [48-Port PoE+ Gigabit Switch], [Gurgaon Hub], [42 Units], [15 Units], [30 Units], [OPTIMAL],
  [SKU-103], [Cat6 UTP Patch Cable (305m)], [Hyderabad DC], [08 Boxes], [12 Boxes], [20 Boxes], [TRIGGER REORDER],
  [SKU-104], [10G SFP+ Optical Transceiver], [Mumbai West], [85 Units], [20 Units], [40 Units], [OPTIMAL],
  [SKU-105], [Rackmount Online UPS 3kVA], [Pune Core], [03 Units], [04 Units], [08 Units], [TRIGGER REORDER],
  [SKU-106], [Dual-Band Enterprise AP], [Bengaluru HQ], [55 Units], [15 Units], [25 Units], [OPTIMAL]
)

#v(2pt)

== 3. Step-by-Step Implementation Protocol
1. *Establish Data Validation*: Restrict the `Warehouse` column to a dropdown list: `Bengaluru HQ, Gurgaon Hub, Hyderabad DC, Mumbai West, Pune Core`.
2. *Automate Reorder Point*: In Column F, enter `=(Daily_Demand * Lead_Days) + Safety_Stock`.
3. *Configure Conditional Formatting*: Highlight cells containing `"TRIGGER REORDER"` with soft red fill (`#FEE2E2`) and bold red text (`#DC2626`).
4. *Calculate Economic Order Quantity (EOQ)*: `=ROUND(SQRT((2 * Annual_Demand * Order_Cost) / Holding_Cost), 0)`.

#v(2pt)

#spotlight-box("SUPPLY CHAIN BEST PRACTICE", [
  Setting safety stock based on statistical standard deviation (`=NORM.S.INV(Service_Level) * STDEV.S * SQRT(Lead_Time)`) maintains a 99% order fulfillment rate while slashing excess inventory holding costs by 22%.
])

#pagebreak()

= Template 03: Automated Corporate Employee Payroll & Payslip Engine

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Calculates monthly employee earnings, statutory retiral deductions (Provident Fund, ESI, Professional Tax), income tax withholding (TDS Section 192), and auto-generates printable corporate payslips.
]

#v(2pt)

== 1. Mathematical Architecture & Statutory Deductions
- *Basic Salary*: 40% – 50% of monthly Gross CTC.
- *House Rent Allowance (HRA)*: 50% of Basic for Metro cities; 40% for Non-Metro cities.
- *Employee Provident Fund (EPF)*: `=MIN(Basic_Salary, 15000) * 12%` (statutory ceiling ₹1,800/month) or 12% on actual basic.
- *Employee State Insurance (ESIC)*: `=IF(Gross_Salary <= 21000, Gross_Salary * 0.75%, 0)`.
- *Professional Tax (PT)*: Slab-based; typically ₹200/month (₹300 in February for select states).

#v(2pt)

== 2. Live Corporate Payroll Register Specimen
#table(
  columns: (1fr, 1.4fr, 1.2fr, 1.1fr, 1fr, 1.1fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Emp ID*], [*Employee Name*], [*Department*], [*Gross CTC*], [*PF (12%)*], [*TDS (IT)*], [*Net Disbursed*]),
  [EMP-081], [Vikram Malhotra], [Technology], [₹85,000.00], [₹4,080.00], [₹6,500.00], [₹74,220.00],
  [EMP-082], [Pooja Sharma], [MIS Analytics], [₹65,000.00], [₹3,120.00], [₹3,200.00], [₹58,480.00],
  [EMP-083], [Rohan Deshmukh], [Finance & Accounts], [₹55,000.00], [₹2,640.00], [₹2,100.00], [₹50,060.00],
  [EMP-084], [Ananya Sen], [Human Resources], [₹48,000.00], [₹2,304.00], [₹1,200.00], [₹44,296.00],
  [EMP-085], [Suresh Kumar], [Operations], [₹38,000.00], [₹1,824.00], [₹400.00], [₹35,576.00]
)

#v(2pt)

== 3. 1-Click Printable Employee Payslip Architecture
Using `XLOOKUP`, an independent printable slip sheet references the employee database instantly:
```
Employee Name:  =XLOOKUP(Selected_ID, Emp_Database[ID], Emp_Database[Name])
Department:     =XLOOKUP(Selected_ID, Emp_Database[ID], Emp_Database[Dept])
Basic Salary:   =XLOOKUP(Selected_ID, Emp_Database[ID], Emp_Database[Basic])
Net Take-Home:  =XLOOKUP(Selected_ID, Emp_Database[ID], Emp_Database[Net_Pay])
```

#v(2pt)

#spotlight-box("STATUTORY COMPLIANCE ASSURANCE", [
  This template incorporates the latest 2027 Indian Finance Act statutory tax slabs (New Tax Regime Section 115BAC), ensuring zero audit penalties during annual corporate payroll compliance audits.
])

#pagebreak()

= Template 04: Multi-Tier B2B Sales Commission Matrix

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Calculates progressive tiered sales incentives for enterprise business development executives, enforcing slab-based commission rates without complex multi-nested IF statements.
]

#v(2pt)

== 1. Mathematical Architecture & Core Formulas
Traditional modeling uses messy nested `IF` chains. The modern enterprise approach uses `SUMPRODUCT` with rate differentials:

#formula-specimen(
  title: "PROGRESSIVE TIERED COMMISSION FORMULA",
  formula: "=SUMPRODUCT(--(Gross_Sales > Slabs), Gross_Sales - Slabs, Rate_Differentials)",
  note: "Accurately calculates progressive marginal commissions across unlimited incentive tiers."
)

#v(2pt)

== 2. Commission Slab Structure & Rate Differentials
#table(
  columns: (1fr, 1.5fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Slab Tier*], [*Sales Threshold Range*], [*Marginal Commission Rate*], [*Incremental Differential*]),
  [Tier 1], [₹0 to ₹5,00,000], [3.0%], [3.0% (Base)],
  [Tier 2], [₹5,00,001 to ₹10,00,000], [5.0%], [2.0% (5% - 3%)],
  [Tier 3], [₹10,00,001 to ₹20,00,000], [8.0%], [3.0% (8% - 5%)],
  [Tier 4], [₹20,00,001 and above], [12.0%], [4.0% (12% - 8%)]
)

#v(2pt)

== 3. Live Quarterly Sales Leaderboard Specimen
#table(
  columns: (1fr, 1.4fr, 1.4fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Rep ID*], [*Account Executive*], [*Achieved Sales*], [*Earned Commission*], [*Effective Rate*]),
  [REP-01], [Arjun Mehta], [₹28,50,000.00], [₹2,22,000.00], [7.79%],
  [REP-02], [Sneha Patel], [₹18,00,000.00], [₹1,04,000.00], [5.78%],
  [REP-03], [Rahul Nair], [₹12,40,000.00], [₹59,200.00], [4.77%],
  [REP-04], [Divya Iyer], [₹7,80,000.00], [₹29,000.00], [3.72%],
  [REP-05], [Amit Verma], [₹4,20,000.00], [₹12,600.00], [3.00%]
)

#v(2pt)

#spotlight-box("ENTERPRISE INCENTIVE DESIGN", [
  Progressive slab modeling motivates sales executives to surpass higher quotas because higher marginal rates reward over-performance without penalizing base deal profitability.
])

#pagebreak()

= Template 05: Corporate Capital Budgeting & DCF Valuation Model

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Evaluates multi-crore enterprise capital expenditure (CapEx) proposals, calculating Net Present Value (NPV), Internal Rate of Return (IRR), and Payback Period to guide executive investment decisions.
]

#v(2pt)

== 1. Mathematical Architecture & Core Formulas
#formula-specimen(
  title: "NET PRESENT VALUE & INTERNAL RATE OF RETURN",
  formula: "=NPV(Hurdle_Rate, Cash_Flows_Y1_to_Y5) + Initial_Outlay_Y0  |  =IRR(Cash_Flows_Y0_to_Y5)",
  note: "Year 0 capital expenditure MUST be added outside the NPV function to avoid erroneous discounting."
)

#v(2pt)

== 2. Live 5-Year Capital Project Cash Flow Model (₹50,00,000 Initial Outlay)
#table(
  columns: (1fr, 1.4fr, 1.4fr, 1.4fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Period*], [*Calendar Year*], [*Gross Inflow*], [*Net Cash Flow*], [*Discounted CF (11%)*]),
  [Year 0], [Initial Outlay], [₹0.00], [-₹50,00,000.00], [-₹50,00,000.00],
  [Year 1], [Projected Y1], [₹24,00,000.00], [₹14,50,000.00], [₹13,06,306.31],
  [Year 2], [Projected Y2], [₹31,00,000.00], [₹18,20,000.00], [₹14,77,152.83],
  [Year 3], [Projected Y3], [₹38,00,000.00], [₹22,40,000.00], [₹16,37,886.08],
  [Year 4], [Projected Y4], [₹42,00,000.00], [₹24,80,000.00], [₹16,33,654.74],
  [Year 5], [Terminal Y5], [₹45,00,000.00], [₹27,50,000.00], [₹16,32,002.11]
)

#v(2pt)

== 3. Executive Decision Metrics Dashboard
#table(
  columns: (1.5fr, 1.5fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Financial Metric*], [*Calculated Value*], [*Investment Decision Rule & Interpretation*]),
  [Net Present Value (NPV)], [₹26,87,002.07], [NPV > 0: Project creates ₹26.87L in net enterprise value #hl[(APPROVE)].],
  [Internal Rate of Return (IRR)], [27.42%], [IRR exceeds corporate hurdle rate of 11.0% by 16.42% #hl[(APPROVE)].],
  [Discounted Payback Period], [3.28 Years], [Full capital outlay recovered well within 5-year project lifecycle.],
  [Profitability Index (PI)], [1.54], [Project generates ₹1.54 of discounted value for every ₹1.00 invested.]
)

#v(2pt)

#spotlight-box("C-SUITE VALUATION PRINCIPLE", [
  For corporate transactions with irregular cash flow dates, replace `NPV` and `IRR` with `=XNPV(Rate, Values, Dates)` and `=XIRR(Values, Dates)` to guarantee exact day-count discounting accuracy.
])

#pagebreak()

= Template 06: Indian Statutory Gratuity & Tenure Calculator

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Automates the calculation of employee statutory gratuity liabilities in full compliance with the Payment of Gratuity Act 1972, factoring in completed years of service and the statutory cap of ₹20,00,000.
]

#v(2pt)

== 1. Statutory Formula & Mathematical Framework
Under Section 4(2) of the Payment of Gratuity Act 1972, for organizations covered under the Act:

#formula-specimen(
  title: "STATUTORY GRATUITY FORMULA (INDIA)",
  formula: "=(15 * Last_Drawn_Basic_and_DA * Completed_Years) / 26",
  note: "26 represents the statutory number of working days in a month. 15 represents 15 days of wages."
)

#v(2pt)

- *Rounding Rule*: A tenure fraction exceeding 6 months is rounded UP to the next full year (e.g. 7 years 7 months = 8 completed years).
- *Eligibility*: Mandatory minimum of 5 continuous years of corporate service.
- *Statutory Ceiling*: Maximum tax-exempt gratuity payable is capped at ₹20,00,000.

#v(2pt)

== 2. Live Employee Gratuity Liability Specimen Schedule
#table(
  columns: (1fr, 1.4fr, 1.2fr, 1.2fr, 1.2fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Emp ID*], [*Employee Name*], [*Date of Join*], [*Date of Exit*], [*Tenure (Years)*], [*Gratuity Disbursed*]),
  [EMP-101], [Rajesh Khanna], [15-Jul-2012], [31-Jan-2027], [15 Years], [₹4,75,961.54],
  [EMP-102], [Sunita Menon], [01-Feb-2010], [15-Oct-2026], [17 Years], [₹6,86,538.46],
  [EMP-103], [Manoj Tiwari], [10-Mar-2018], [28-Feb-2027], [9 Years], [₹2,70,000.00],
  [EMP-104], [Kavita Krishnan], [01-Apr-2023], [15-Jan-2027], [4 Years], [₹0.00 (Ineligible)],
  [EMP-105], [Devendra Roy], [01-Aug-2002], [31-Dec-2026], [24 Years], [₹14,53,846.15]
)

#v(2pt)

== 3. Step-by-Step Excel Construction
1. *Exact Tenure in Days*: `=DATEDIF(Date_Join, Date_Exit, "Y") + IF(DATEDIF(Date_Join, Date_Exit, "YM") >= 6, 1, 0)`.
2. *Eligibility Check*: `=IF(Tenure_Years >= 5, "ELIGIBLE", "INELIGIBLE")`.
3. *Final Gratuity Amount*: `=IF(Tenure >= 5, MIN(ROUND((15 * Basic_DA * Tenure) / 26, 2), 2000000), 0)`.

#v(2pt)

#spotlight-box("AUDIT COMPLIANCE ADVICE", [
  Unfunded gratuity liabilities must be provisioned annually on corporate balance sheets in accordance with Ind AS 19 (Employee Benefits) actuarial valuation standards.
])

#pagebreak()

= Template 07: Interactive C-Suite Sales KPI Executive Dashboard

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  A consolidated single-screen executive control board aggregating monthly enterprise sales, product category profitability, customer acquisition cost, and gross margins using dynamic PivotTables, Slicers, and Timelines.
]

#v(2pt)

== 1. Dashboard Visual Hierarchy & Architecture
An executive C-Suite dashboard must follow the *Top-to-Bottom, Left-to-Right Hierarchy*:
- *Top 20%*: Executive KPI Cards (Total Revenue, Gross Profit %, Customer Count, Average Order Value).
- *Middle 50%*: Core Comparative Charts (Revenue by Region: Clustered Bar; Monthly Trend: Smooth Line Chart).
- *Right 30%*: Interactive Filter Pane (Synchronized Slicers for Regional Hubs, Customer Tiers, and Timeline filter).

#v(2pt)

== 2. Dynamic Card Formulas via GETPIVOTDATA
To make KPI summary cards completely immune to PivotTable layout changes, use structured `GETPIVOTDATA`:
```
Total Revenue Card:   =GETPIVOTDATA("Revenue", Pivot_Sheet!$A$3)
Gross Profit Card:    =GETPIVOTDATA("Profit", Pivot_Sheet!$A$3) / GETPIVOTDATA("Revenue", Pivot_Sheet!$A$3)
Active Client Count:  =GETPIVOTDATA("Client_ID", Pivot_Sheet!$A$3)
```

#v(2pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-pivottable-sample.png", width: 95%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure: Live Normalized Data Source driving Executive PivotTable Analytics and Interactive KPI Cards.
  ]
]

#v(2pt)

== 3. Dashboard Deployment Checklist
1. Disable gridlines (`View > Show > Gridlines [Uncheck]`) for a clean presentation canvas.
2. Link Slicers across all underlying PivotTables via `Slicer Settings > Report Connections [Select All]`.
3. Lock non-interactive shapes and cards using `Format Cells > Protection > Locked`.

#v(2pt)

#spotlight-box("EXECUTIVE REPORTING PRINCIPLE", [
  Never force senior management to scroll vertically or horizontally. A world-class boardroom dashboard fits cleanly within a standard 16:9 widescreen display at 100% zoom.
])

#pagebreak()

= Template 08: Multi-Source Power Query Automated Bank Reconciliation

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Automates the tedious monthly reconciliation of internal ERP accounting ledgers against bank statement CSV exports, utilizing Power Query anti-join queries to isolate unpresented cheques and uncredited deposits in seconds.
]

#v(2pt)

== 1. Automated ETL Pipeline Architecture
```
[Raw Bank Statement CSV]  ──┐
                             ├──> [Power Query M-Engine] ──> [Full Anti-Join] ──> [Discrepancy Ledger]
[Internal ERP Ledger CSV] ──┘      (Clean, Normalize, Trim)
```

#v(2pt)

== 2. Core M-Code Transformation Steps
1. *Ingestion & Typecasting*: Converts transaction dates to `datetime`, trims whitespace from cheque numbers, and ensures amounts are typed as `Currency.Type`.
2. *Merge Queries (Left Anti-Join)*: Matches transactions where `ERP[Cheque_No] = Bank[Cheque_No]` and `ERP[Amount] = Bank[Amount]`.
3. *Output Segregation*: Generates 3 clean output tables:
   - *Table A*: Reconciled Transactions (100% match on Cheque No. and Amount).
   - *Table B*: Unpresented Cheques (Issued in ERP, not yet debited by Bank).
   - *Table C*: Direct Bank Debits / Interest Credits (Present in Bank, missing in ERP).

#v(2pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-pivottable-create.png", width: 92%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure: Loading Cleaned Power Query Relational Data into Excel Data Model for 1-Click Refresh Reconciliation.
  ]
]

#v(2pt)

#spotlight-box("FINANCIAL AUDIT BENEFIT", [
  What previously consumed 14 analyst hours across monthly financial closes is reduced to a 45-second 1-click execution: dropping new bank CSVs into the monitored folder and clicking `Data > Refresh All`.
])

#pagebreak()

= Template 09: Automated Commercial B2B GST Invoice & Tax Engine

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Generates standardized commercial B2B tax invoices with dynamic HSN code lookup, automated CGST/SGST vs IGST branching, number-to-words currency translation, and dynamic payment QR codes.
]

#v(2pt)

== 1. Mathematical Architecture & Tax Branching Logic
In India, GST taxation is governed by the location of the supplier vs the place of supply:

#formula-specimen(
  title: "INTRA-STATE VS INTER-STATE TAX BRANCHING",
  formula: "=IF(Supplier_State = Customer_State, \"INTRA-STATE (CGST 9% + SGST 9%)\", \"INTER-STATE (IGST 18%)\")",
  note: "Guarantees 100% statutory tax ledger segregation for GST portal returns (GSTR-1 & GSTR-3B)."
)

#v(2pt)

== 2. Live Commercial Tax Invoice Line Item Specimen
#table(
  columns: (0.7fr, 2.2fr, 1.1fr, 0.8fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Item*], [*Description of Goods / Services*], [*HSN/SAC*], [*Qty*], [*Unit Rate*], [*Taxable Amt*], [*Total with GST*]),
  [01], [Enterprise Cloud Migration Services], [998313], [1 Job], [₹2,50,000.00], [₹2,50,000.00], [₹2,95,000.00],
  [02], [Cisco Catalyst 9300 48-Port Switch], [851762], [2 Nos], [₹1,85,000.00], [₹3,70,000.00], [₹4,36,600.00],
  [03], [Cat6 UTP Ethernet Spool (305m)], [854449], [10 Bxs], [₹8,500.00], [₹85,000.00], [₹1,00,300.00],
  [04], [24x7 Enterprise NOC Support SLA], [998314], [1 Qtr], [₹1,20,000.00], [₹1,20,000.00], [₹1,41,600.00]
)

#v(2pt)

== 3. Dynamic Number-to-Words Conversion Architecture
Using custom VBA or LAMBDA functions, the numeric total `=SUM(G12:G15)` translates into words:
`"Indian Rupees Nine Lakh Seventy-Three Thousand Five Hundred Only"`.

#v(2pt)

#spotlight-box("INVOICING HYGIENE MANDATE", [
  Always export the completed invoice directly to PDF (`File > Export > Create PDF/XPS`) rather than emailing `.xlsx` spreadsheets to clients, preventing accidental alterations to bank coordinates or tax calculations.
])

#pagebreak()

= Template 10: Dynamic Project Gantt Chart with Working-Day Calendars

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Tracks complex enterprise project milestones, dependencies, and delivery deadlines, calculating true calendar completion dates using customized non-working days and official holiday schedules.
]

#v(2pt)

== 1. Mathematical Architecture & Core Formulas
#formula-specimen(
  title: "DYNAMIC END-DATE CALCULATION",
  formula: "=WORKDAY.INTL(Start_Date, Duration_Days, 1, Corporate_Holidays)",
  note: "Parameter '1' enforces standard Saturday/Sunday weekends. Custom binary strings support bespoke shifts."
)

#v(2pt)

#formula-specimen(
  title: "CONDITIONAL FORMATTING GANTT BAR TRIGGER",
  formula: "=AND(Calendar_Date >= Task_Start, Calendar_Date <= Task_End)",
  note: "Applied across 60-day calendar headers to automatically illuminate visual project progress bars."
)

#v(2pt)

== 2. Live Project Milestone Schedule Specimen
#table(
  columns: (0.8fr, 2.3fr, 1.2fr, 1fr, 1.2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Task No.*], [*Project Milestone / Phase*], [*Start Date*], [*Duration*], [*End Date*], [*% Done*]),
  [TSK-01], [Enterprise Architecture Requirements], [01-Feb-2027], [10 Days], [12-Feb-2027], [100% ✓],
  [TSK-02], [Data Model & Power Query Pipeline Setup], [15-Feb-2027], [15 Days], [05-Mar-2027], [85% ⏳],
  [TSK-03], [Word & PowerPoint Template Integration], [01-Mar-2027], [12 Days], [16-Mar-2027], [40% ⏳],
  [TSK-04], [User Acceptance Testing & Security Audit], [15-Mar-2027], [10 Days], [26-Mar-2027], [0%],
  [TSK-05], [Commercial Production Deployment], [29-Mar-2027], [05 Days], [02-Apr-2027], [0%]
)

#v(2pt)

== 3. Step-by-Step Construction Guide
1. Create a dynamic calendar header in row 6 starting from `=Project_Start` and propagating with `=E6+1`.
2. Format the header using Custom Format `ddd` (displays Mon, Tue, Wed) and `dd` below it.
3. Select the calendar grid range (`E7:Z20`) and add a Conditional Formatting rule: `=AND(E$6 >= $C7, E$6 <= $D7)`. Set fill to enterprise blue (`#0284C7`).

#v(2pt)

#spotlight-box("AGILE PROJECT MANAGEMENT TIP", [
  Incorporate a % Complete progress bar using in-cell Data Bars (`Conditional Formatting > Data Bars > Gradient Fill`) to give stakeholders an instant visual pulse of task completion without complex Gantt software.
])

#pagebreak()

= Template 11: Statistical Process Control (SPC) Quality Model

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Monitors manufacturing tolerances, server latency SLAs, and transactional defect rates using Six Sigma statistical control charts (X-Bar, UCL, LCL, Cp, and Cpk indices).
]

#v(2pt)

== 1. Mathematical Architecture & Six Sigma Formulas
#formula-specimen(
  title: "UPPER AND LOWER STATISTICAL CONTROL LIMITS",
  formula: "UCL = Mean + (3 * Sigma)  |  LCL = Mean - (3 * Sigma)",
  note: "Captures 99.73% of normal process variation. Points beyond limits trigger out-of-control investigation."
)

#v(2pt)

#formula-specimen(
  title: "PROCESS CAPABILITY INDICES (CP & CPK)",
  formula: "Cp = (USL - LSL) / (6 * Sigma)  |  Cpk = MIN((USL - Mean)/(3*Sigma), (Mean - LSL)/(3*Sigma))",
  note: "A Cpk >= 1.33 represents an elite Six Sigma manufacturing benchmark (fewer than 3.4 defects per million)."
)

#v(2pt)

== 2. Live Quality Control Sample Data Specimen (100mm Target ± 2mm)
#table(
  columns: (1fr, 1.4fr, 1.4fr, 1.4fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Sample No.*], [*Observed Value*], [*Mean Target*], [*UCL (+3σ)*], [*Defect Status*]),
  [Sample 01], [100.12 mm], [100.00 mm], [101.80 mm], [✓ IN CONTROL],
  [Sample 02], [99.85 mm], [100.00 mm], [101.80 mm], [✓ IN CONTROL],
  [Sample 03], [100.45 mm], [100.00 mm], [101.80 mm], [✓ IN CONTROL],
  [Sample 04], [101.95 mm], [100.00 mm], [101.80 mm], [⚠️ OUT OF CONTROL],
  [Sample 05], [99.60 mm], [100.00 mm], [101.80 mm], [✓ IN CONTROL]
)

#v(2pt)

== 3. Step-by-Step Construction Guide
1. Compute Sample Mean: `=AVERAGE(Data_Range)`.
2. Compute Sample Standard Deviation: `=STDEV.S(Data_Range)`.
3. Compute Control Limits: `=Mean + (3 * StDev)` and `=Mean - (3 * StDev)`.
4. Plot as a 2D Line Chart with steady horizontal lines representing Mean, UCL, and LCL.

#v(2pt)

#spotlight-box("SIX SIGMA PRINCIPLE", [
  Any single sample point breaching the ±3-sigma control boundary represents a "Special Cause" assignable variation requiring root-cause engineering review.
])

#pagebreak()

= Template 12: 2027 Python in Excel (=PY) Predictive Model

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Leverages native Microsoft 365 Python integration (`=PY`) to perform machine learning regressions, customer churn predictions, and automated statistical correlations directly inside standard Excel spreadsheets.
]

#v(2pt)

== 1. Python in Excel Architecture & Syntax
Entering `=PY` into any Excel 365 cell converts the input field into a secure Python execution container running in the Microsoft Cloud:
```python
# Cell D2: Native Python in Excel Execution
import pandas as pd
import seaborn as sns
from sklearn.linear_model import LogisticRegression

# 1. Load Excel Table directly into pandas DataFrame
df = xl("Customer_Data[#All]", headers=True)

# 2. Train Logistic Regression Model on Churn Drivers
X = df[['Tenure_Months', 'Monthly_Charges', 'Support_Tickets']]
y = df['Churned']
model = LogisticRegression().fit(X, y)

# 3. Output Churn Probabilities back to Excel Grid
df['Churn_Risk'] = model.predict_proba(X)[:, 1]
df[['Customer_ID', 'Churn_Risk']].sort_values(by='Churn_Risk', ascending=False)
```

#v(2pt)

== 2. Live Predictive Churn Ranking Output
#table(
  columns: (1fr, 1.4fr, 1.4fr, 1.4fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Cust ID*], [*Tenure (Months)*], [*Monthly Bill*], [*Support Tickets*], [*Churn Risk Probability*]),
  [CUST-901], [03 Months], [₹4,500.00], [08 Tickets], [87.4% #hl[(HIGH RISK)]],
  [CUST-902], [06 Months], [₹3,200.00], [05 Tickets], [64.2% #hl[(MEDIUM)]],
  [CUST-903], [24 Months], [₹1,800.00], [01 Ticket], [12.1% (LOW RISK)],
  [CUST-904], [36 Months], [₹2,100.00], [00 Tickets], [04.5% (LOW RISK)],
  [CUST-905], [02 Months], [₹5,000.00], [06 Tickets], [81.9% #hl[(HIGH RISK)]]
)

#v(2pt)

#spotlight-box("FRONTIER 2027 EXCEL CAPABILITY", [
  Python in Excel runs seamlessly without installing local Python distributions, virtual environments, or third-party DLLs. Results recalculate automatically as underlying spreadsheet data changes.
])

#pagebreak()

= Financial Modeling Hygiene, Error Trapping & Audit Standards

#concept-box(title: "CORPORATE AUDIT STANDARDS")[
  An un-audited financial model is an operational corporate hazard. Wall Street and Fortune 500 audit teams enforce rigorous validation checks to guarantee formula integrity before presenting workbooks to senior leadership.
]

#v(2pt)

== 1. Top 7 Excel Formula Errors & Resilient Fixes
#table(
  columns: (1fr, 2.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Error Code*], [*Root Cause / Mechanism*], [*Enterprise Resilient Fix*]),
  [`#N/A`], [Lookup function fails to locate target key in source range.], [Wrap formula in `=XLOOKUP(..., "Not Found")` or `=IFNA(..., 0)`],
  [`#VALUE!`], [Mathematical operation attempted on text-formatted cell.], [Use `=VALUE(Cell)` or check for hidden leading apostrophes/spaces.],
  [`#REF!`], [Formula references cell coordinate that has been deleted.], [Undo deletion immediately (`Ctrl + Z`); rebuild reference using Tables.],
  [`#DIV/0!`], [Formula attempts division by zero or empty blank cell.], [Wrap in `=IF(Denominator = 0, 0, Numerator / Denominator)`.],
  [`#NAME?`], [Typo in function name or unquoted text string.], [Check spelling (e.g. `XLOOKUP` vs `XLOKUP`) and enclose strings in quotes.],
  [`#NUM!`], [Number too large or financial iteration fails to converge.], [Verify cash flow signs in `=IRR` or adjust rate guesses.],
  [`#SPILL!`], [Dynamic array cannot expand due to obstructing cell.], [Clear all cells, values, or merged cells in the expansion bounding box.]
)

#v(2pt)

== 2. Formula Auditing Key Shortcuts
- *Trace Precedents (`Ctrl + [`)*: Highlights all input cells feeding the active formula.
- *Trace Dependents (`Ctrl + ]`)*: Highlights all downstream formulas that depend on the active cell.
- *Evaluate Formula (`Alt + M + V`)*: Opens step-by-step calculation debugger to observe intermediate formula results.
- *Show Formulas (`Ctrl + ~`)*: Toggles entire worksheet between calculated values and raw underlying formulas.

#v(2pt)

#spotlight-box("GOLDEN RULE OF SPREADSHEET AUDITING", [
  Never hardcode assumptions inside formulas (e.g. `=A1 * 1.18`). Always store assumptions in dedicated, clearly labeled input parameter cells (`Tax_Rate = 18%`) and reference the parameter cell dynamically.
])

#pagebreak()

= Template Deployment Checklist & Lifetime Support

#concept-box(title: "10-POINT PRE-FLIGHT DEPLOYMENT CHECKLIST")[
  Before emailing or publishing any of the 12 practical workbooks to your manager, executive board, or client, execute this mandatory verification checklist.
]

#v(2pt)

== 1. Enterprise Pre-Flight Verification Protocol
#table(
  columns: (0.7fr, 2.2fr, 3.1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Check No.*], [*Verification Dimension*], [*Mandatory Operational Action Required*]),
  [01], [Circular Reference Check], [Navigate to `Formulas > Error Checking > Circular References`. Must show zero circular loops.],
  [02], [Formula Error Scan], [Press `F5 > Special > Formulas > Errors`. Verify zero `#N/A`, `#REF!`, or `#VALUE!` cells exist.],
  [03], [Hardcoded Values Audit], [Ensure zero numbers are hardcoded inside formula strings; all inputs must link to cells.],
  [04], [Data Validation Integrity], [Verify all dropdown lists, date constraints, and number ranges reject invalid user entries.],
  [05], [Print Area Standardization], [Set explicit Print Areas (`Page Layout > Print Area > Set`) and verify `Fit to 1 Page Wide`.],
  [06], [Formatting Hygiene], [Ensure all currency amounts display `₹` symbols and consistent 2-decimal formatting.],
  [07], [Sheet Protection], [Lock formula cells and unlock only input cells (`Review > Protect Sheet`).],
  [08], [Document Inspector Scan], [Execute `File > Info > Check for Issues > Inspect Document` to strip personal author metadata.],
  [09], [File Naming Convention], [Use standard format: `ProjectName_Department_YYYYMMDD_v1.0.xlsx`.],
  [10], [Cloud Backup & Versioning], [Save to OneDrive/SharePoint with AutoSave enabled to guarantee version history.]
)

#v(2pt)

== 2. RTechLab Lifetime Ecosystem & Support Channels
#table(
  columns: (1.5fr, 2fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Resource Channel*], [*Access URL / Coordinate*], [*Community Deliverables & Engagement*]),
  [Official Web Platform], [https://rtechlab.vercel.app], [Access latest digital releases, course updates & downloadable workbooks.],
  [Student Notes Portal], [https://rtechlab.vercel.app/notes], [Quarterly curriculum errata updates & bonus practical case studies.],
  [Direct Mentorship Support], [rahul.28e1\@gmail.com], [Direct technical clarification and formula troubleshooting with author team.],
  [Live Weekend Masterclasses], [Quarterly Community Invitations], [Live walkthroughs of complex financial modeling & Power Query workflows.]
)

#v(2pt)

#spotlight-box("THE ₹149 CAREER ACCELERATOR BUNDLE COMMITMENT", [
  You own all 12 pre-built `.xlsx` templates with lifetime personal and commercial deployment rights. Customize them with your company logo, modify formula parameters, and deploy them across your professional projects. Technology Made Practical · Learn. Practice. Innovate.
])
"""

    with open(typ_path, "w", encoding="utf-8") as f:
        f.write(typ_src)

    print(f"Compiling 16-Page Practical Templates Workbook to {pdf_out}...")
    res = subprocess.run(['typst', 'compile', '--root', '.', typ_path, pdf_out], capture_output=True, text=True)
    if res.returncode != 0:
        print("Compilation ERROR:", res.stderr)
        return False
    else:
        doc = fitz.open(pdf_out)
        print(f"✓ Practical Templates Workbook compiled successfully: {len(doc)} pages ({pdf_out})")
        for i in range(len(doc)):
            p = doc[i]
            blocks = [b for b in p.get_text('blocks') if 'RTECHLAB' not in b[4] and 'C E R T I F I E D' not in b[4] and b[1] >= 45 and b[3] <= 795]
            if blocks:
                max_y = max(b[3] for b in blocks)
                fill = ((max_y - 50) / 740) * 100
                print(f"  Page {i+1}: {fill:.1f}% fill (bottom y={max_y:.1f})")
        return True

if __name__ == "__main__":
    build_full_templates_workbook()
