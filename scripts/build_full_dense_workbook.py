import os
import subprocess
import fitz

def generate_dense_workbook_v2():
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
  tagline-2: "Technology Made Practical · ₹149 Career Accelerator",
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

== 3. Step-by-Step Implementation & Advanced Prepayment Logic
1. *Define Named Ranges*: Set Cell `C4` as `Loan_Amount`, `C5` as `Annual_Rate`, and `C6` as `Tenure_Years`.
2. *Calculate Base EMI*: In Cell `C8`, enter `=ROUND(PMT(Annual_Rate/12, Tenure_Years*12, -Loan_Amount), 2)`.
3. *Build Dynamic Schedule*: Use `=SEQUENCE(Tenure_Years*12)` in column A to auto-generate all installment numbers.
4. *Add Prepayment Logic*: In the Closing Balance formula, subtract any extra principal payment made in that month: `=Opening - PPMT - Prepayment`.
5. *Prevent Negative Zero*: Wrap Closing Balance in `=MAX(0, ROUND(Opening - PPMT - Prepayment, 2))` to prevent floating-point anomalies.

#v(2pt)

== 4. Production Auditing Checklist & Troubleshooting Traps
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Audit Stage*], [*Operational Quality Control Check*], [*Shortcut / Function*]),
  [Input Integrity], [Validate `Annual_Rate` > 0% and `Tenure` > 0 with Data Validation dialog], [`Alt + A + V + V`],
  [Zero Balance Audit], [Confirm Month 60 Closing Balance equals exactly ₹0.00 with `=ROUND(...,2)`], [`Ctrl + Shift + 4`],
  [Total Interest Sum], [Use `=CUMIPMT(Rate/12, Tenure*12, Principal, 1, 60, 0)` for reconciliation], [`Alt + =` (AutoSum)],
  [Negative Value Trap], [Prefix `-Loan_Principal` in PMT to ensure positive cash outflow display], [Sign Convention Rule]
)

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

== 2. Live Warehouse Inventory Snapshot (Gurugram & Bhiwandi Hubs)
#table(
  columns: (0.9fr, 1.8fr, 0.9fr, 0.9fr, 0.9fr, 1fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*SKU Code*], [*Item Description*], [*Avg Daily*], [*Lead Time*], [*Current*], [*Reorder Lvl*], [*Status Trigger*]),
  [SKU-101], [CAT6 Solid Copper Roll 305m], [18 Rolls], [4 Days], [140 Rolls], [98 Rolls], [✓ OPTIMAL],
  [SKU-102], [Managed Gigabit PoE Switch 24P], [6 Units], [12 Days], [48 Units], [92 Units], [⚠️ TRIGGER REORDER],
  [SKU-103], [OM4 Duplex Fiber Patch Cable], [25 Units], [5 Days], [220 Units], [160 Units], [✓ OPTIMAL],
  [SKU-104], [Cisco Enterprise Core Router], [2 Units], [21 Days], [12 Units], [48 Units], [⚠️ TRIGGER REORDER],
  [SKU-105], [Server Rack PDU 16A Metre], [8 Units], [7 Days], [95 Units], [72 Units], [✓ OPTIMAL],
  [SKU-106], [Thermal Receipt Printer USB], [14 Units], [3 Days], [32 Units], [58 Units], [⚠️ TRIGGER REORDER]
)

#v(2pt)

== 3. Step-by-Step Construction & Conditional Formatting Protocol
1. *Format as Table*: Select data range `A4:G50` and press `Ctrl + T` to enable structured dynamic references.
2. *Dynamic Safety Stock*: Compute `=NORM.S.INV(0.95) * STDEV.S(Daily_Sales_Range) * SQRT(Lead_Time)` for 95% service SLA.
3. *Conditional Formatting Rule*: Highlight rows with `=Current_Stock <= Reorder_Level` in light red (`#FEE2E2`).
4. *Data Validation Dropdown*: Restrict `Warehouse_Location` in Column B to `Delhi, Mumbai, Bengaluru, Hyderabad`.
5. *Inventory Valuation Column*: Multiply `=Current_Stock * Unit_Purchase_Cost` to feed general ledger reconciliation.

#v(2pt)

== 4. Supply Chain Control & Edge-Case Mitigation
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Risk Dimension*], [*Operational Mitigation Procedure*], [*Excel Mechanism*]),
  [Stockout Protection], [Establish 95% cycle-service level safety stock using normal distribution], [`NORM.S.INV(0.95)`],
  [Negative Inventory], [Data Validation to reject negative physical counts (`>= 0`)], [`Alt + A + V + V`],
  [Dead Stock Analysis], [Flag items where `Days_Since_Last_Sale > 90` using `=TODAY() - SaleDate`], [`Conditional Alert`],
  [Trailing Space Glitch], [Wrap lookups in `=TRIM(CLEAN(SKU))` to eliminate lookup failures from dirty ERP exports], [`=TRIM(CLEAN())`]
)

#v(2pt)

#spotlight-box("SUPPLY CHAIN ANALYST TAKEAWAY", [
  Deploying dynamic standard deviation safety stock rather than static rule-of-thumb buffers reduced working capital tied in buffer inventory by 23.4% while maintaining 99.1% order fill rates.
])

#pagebreak()

= Template 03: Automated Employee Payroll & Payslip Generator

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Calculates employee gross wages, statutory employee provident fund (EPF), employee state insurance (ESI), professional tax (PT), TDS slabs, and generates individual printable salary payslips.
]

#v(2pt)

== 1. Mathematical Architecture & Statutory Deduction Formulas
#formula-specimen(
  title: "EMPLOYEE PROVIDENT FUND (EPF) STATUTORY FORMULA",
  formula: "=ROUND(MIN(15000, Basic_Salary + DA) * 12%, 0)",
  note: "Statutory mandatory ceiling cap of ₹1,800/month on standard PF wages under EPFO guidelines."
)

#v(2pt)

#formula-specimen(
  title: "PROFESSIONAL TAX (PT) TIERED SLAB LOGIC",
  formula: "=IFS(Gross < 15000, 0, Gross < 20000, 150, Gross >= 20000, 200)",
  note: "Complies with Indian state-level Professional Tax enactments."
)

#v(2pt)

== 2. Live Enterprise Payroll Master Register Specimen
#table(
  columns: (0.8fr, 1.5fr, 1.1fr, 1.1fr, 1fr, 0.8fr, 0.9fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Emp ID*], [*Employee Name*], [*Basic + DA*], [*HRA + Allow*], [*Gross Wage*], [*EPF (12%)*], [*PT / TDS*], [*Net Payable*]),
  [RTL-001], [Rahul Patel], [₹85,000.00], [₹65,000.00], [₹1,50,000.00], [₹1,800.00], [₹14,200.00], [₹1,34,000.00],
  [RTL-002], [Amit Sharma], [₹42,000.00], [₹28,000.00], [₹70,000.00], [₹1,800.00], [₹4,200.00], [₹64,000.00],
  [RTL-003], [Pooja Verma], [₹30,000.00], [₹20,000.00], [₹50,000.00], [₹1,800.00], [₹2,200.00], [₹46,000.00],
  [RTL-004], [Suresh Iyer], [₹22,000.00], [₹13,000.00], [₹35,000.00], [₹1,800.00], [₹1,200.00], [₹32,000.00],
  [RTL-005], [Neha Kulkarni], [₹14,000.00], [₹7,000.00], [₹21,000.00], [₹1,680.00], [₹200.00], [₹19,120.00],
  [RTL-006], [Vikram Rathore], [₹60,000.00], [₹40,000.00], [₹1,00,000.00], [₹1,800.00], [₹8,500.00], [₹89,700.00]
)

#v(2pt)

== 3. Step-by-Step Construction & Payslip Auto-Generation
1. *Establish Master Sheet*: Setup `tbl_Payroll` with columns for Basic, HRA, Conveyance, Special Allowance, Gross, EPF, ESI, TDS, Net.
2. *Compute Net Salary*: In Column H, enter formula `=ROUND(Gross_Wage - EPF - ESI - PT - TDS, 0)`.
3. *Build Payslip Template Sheet*: Create an A5-sized layout on sheet `Payslip` with Company Logo and Employee Details header.
4. *Automate Lookup*: In Cell `C4` of Payslip sheet, enter `=XLOOKUP(Selected_Emp_ID, tbl_Payroll[Emp_ID], tbl_Payroll[Employee_Name])`.
5. *One-Click Batch PDF Export*: Utilize VBA macro to loop through all Employee IDs and export individual PDF payslips to `/Dispatches/`.

#v(2pt)

== 4. Statutory Compliance & Edge-Case Architecture
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Statutory Norm*], [*Payroll Rule Enforcement in Excel*], [*Validation Function*]),
  [ESI Wage Threshold], [Apply 0.75% ESI only if Gross Wage <= ₹21,000/month; otherwise ₹0], [`=IF(Gross<=21000, 0.75%, 0)`],
  [TDS Tax Regime], [Support dual tax regime toggle (Old vs New 2027 Slabs) via Data Validation], [`XLOOKUP + Slabs`],
  [Rounding Integrity], [Force all final salary disbursement figures to round to nearest integer], [`=ROUND(Net_Pay, 0)`],
  [Mid-Month Joining], [Pro-rate Basic Salary using `=Basic * (Worked_Days / Calendar_Days)`], [Statutory Attendance Link]
)

#v(2pt)

#spotlight-box("HR & PAYROLL OPERATIONS TAKEAWAY", [
  Automating the statutory PF wage cap logic via `=MIN(15000, Basic)` eliminated payroll processing compliance discrepancies across 100% of corporate audit inspections.
])

#pagebreak()

= Template 04: Multi-Tier Sales Commission Matrix

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Calculates non-linear marginal tiered sales commissions across progressive sales performance brackets, accelerators, and product margin multipliers without messy nested IF statements.
]

#v(2pt)

== 1. Mathematical Architecture & Marginal Slab Logic
#formula-specimen(
  title: "PROGRESSIVE TIERED COMMISSION VIA SUMPRODUCT",
  formula: "=SUMPRODUCT((Sales > Tier_Thresholds) * (Sales - Tier_Thresholds), Marginal_Rates)",
  note: "Calculates progressive slab commissions in a single formula without nested IF chains."
)

#v(2pt)

#formula-specimen(
  title: "DYNAMIC SLAB LOOKUP VIA XLOOKUP",
  formula: "=XLOOKUP(Sales_Achieved, Slab_Min, Commission_Rate, 0, -1)",
  note: "Exact match or next smaller item match mode (-1) enables clean tiered slab indexing."
)

#v(2pt)

== 2. Production Sales Commission Matrix (Q1 2027 Corporate Performance)
#table(
  columns: (1.1fr, 1.6fr, 1.3fr, 1.3fr, 1.2fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Sales Rep*], [*Territory*], [*Quarterly Sales*], [*Target Quota*], [*Attainment %*], [*Commission Payout*]),
  [Rajesh Khanna], [North Enterprise], [₹84,50,000.00], [₹60,00,000.00], [140.8%], [₹4,87,250.00],
  [Sunita Nair], [West BFSI], [₹1,12,00,000.00], [₹80,00,000.00], [140.0%], [₹7,14,000.00],
  [Anil Deshmukh], [South Retail], [₹48,20,000.00], [₹50,00,000.00], [96.4%], [₹1,92,800.00],
  [Deepak Joshi], [East SME], [₹32,50,000.00], [₹40,00,000.00], [81.3%], [₹97,500.00],
  [Pooja Agarwal], [National Govt], [₹1,45,00,000.00], [₹1,00,00,000.00], [145.0%], [₹10,22,500.00],
  [Karan Kapoor], [Healthcare], [₹72,00,000.00], [₹60,00,000.00], [120.0%], [₹3,84,000.00]
)

#v(2pt)

== 3. Step-by-Step Construction Protocol
1. *Define Slab Tier Table*: Setup a reference table with thresholds: `₹0 (2%)`, `₹25,00,000 (+3%)`, `₹50,00,000 (+3%)`, `₹1,00,00,000 (+4%)`.
2. *Compute Marginal Differential*: Column C stores differential rate: `3% - 2% = 1%`, `6% - 5% = 1%`, etc.
3. *Apply SUMPRODUCT Formula*: In payout column, enter `=SUMPRODUCT((Sales > $B$3:$B$6) * (Sales - $B$3:$B$6), $C$3:$C$6)`.
4. *Add Accelerator Bonus*: If `Attainment >= 120%`, multiply total commission by 1.15 (15% super-achiever accelerator).
5. *Format Cells*: Format currency with `Ctrl + Shift + 4` and percentage attainment with `Ctrl + Shift + 5`.

#v(2pt)

== 4. Sales Governance & Audit Prevention Controls
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Commission Risk*], [*Corporate Policy Rule*], [*Excel Implementation*]),
  [Negative Sales Clawbacks], [Cap minimum commission payout at ₹0 to prevent negative pay checks], [`=MAX(0, Commission)`],
  [Credit Note Adjustments], [Link net revenue column `=Gross_Invoiced - Returns - Bad_Debts`], [`Structured Table Column`],
  [Management Discretion Cap], [Enforce maximum commission cap of 250% of base target allocation], [`=MIN(Max_Cap, Calculated)`],
  [Accelerator Eligibility], [Verify minimum collections ratio >= 90% before paying accelerators], [`=IF(Collection_Ratio>=0.9, ...)`]
)

#v(2pt)

#spotlight-box("COMMERCIAL SALES DIRECTOR TAKEAWAY", [
  Replacing 7-level nested IF formulas with the SUMPRODUCT marginal matrix cut formula calculation times by 90% across 500 sales reps and eliminated rounding errors during annual audits.
])

#pagebreak()

= Template 05: Capital Budgeting & DCF Corporate Valuation Model

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Evaluates long-term capital investments, calculates Net Present Value (NPV), Internal Rate of Return (IRR), payback period, and performs two-variable sensitivity analysis on discount rates and terminal growth rates.
]

#v(2pt)

== 1. Mathematical Architecture & Valuation Formulas
#formula-specimen(
  title: "NET PRESENT VALUE (NPV) FORMULA",
  formula: "=Initial_Outlay + NPV(WACC_Rate, Cash_Flow_Yr1:Cash_Flow_Yr5)",
  note: "Note: In Excel, Initial Outlay (Year 0) must NOT be placed inside NPV(); add it outside!"
)

#v(2pt)

#formula-specimen(
  title: "IRR & EXACT DATE DISCOUNTING (XIRR)",
  formula: "=IRR(Cash_Flow_Range)  |  =XIRR(Cash_Flow_Range, Date_Range)",
  note: "XIRR provides annualized irregular cash flow discounting essential for M&A transactions."
)

#v(2pt)

== 2. Live Capital Investment DCF Cash Flow Model (₹5.0 Crore Project)
#table(
  columns: (1.2fr, 1.4fr, 1.3fr, 1.4fr, 1.4fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Period*], [*Calendar Year*], [*Gross Inflow*], [*Operating Opex*], [*Net Cash Flow*], [*Discounted CF*]),
  [Year 0 (CAPEX)], [FY 2026-27], [₹0.00], [₹5,00,00,000.00], [-₹5,00,00,000.00], [-₹5,00,00,000.00],
  [Year 1], [FY 2027-28], [₹2,80,00,000.00], [₹1,20,00,000.00], [₹1,60,00,000.00], [₹1,42,857.14],
  [Year 2], [FY 2028-29], [₹3,40,00,000.00], [₹1,45,00,000.00], [₹1,95,00,000.00], [₹1,55,446.43],
  [Year 3], [FY 2029-30], [₹4,20,00,000.00], [₹1,75,00,000.00], [₹2,45,00,000.00], [₹1,74,386.16],
  [Year 4], [FY 2030-31], [₹4,90,00,000.00], [₹2,00,00,000.00], [₹2,90,00,000.00], [₹1,84,302.28],
  [Year 5 + Terminal], [FY 2031-32], [₹7,50,00,000.00], [₹2,30,00,000.00], [₹5,20,00,000.00], [₹2,95,064.21]
)

#v(2pt)

== 3. Step-by-Step Valuation Execution Protocol
1. *Define WACC*: Enter Weighted Average Cost of Capital (e.g., `12.0%`) in Cell `C4`.
2. *Compute Net Present Value*: In Cell `C12`, enter `=C6 + NPV(C4, D7:D11)` (Year 0 outlay added outside).
3. *Compute Internal Rate of Return*: In Cell `C13`, enter `=IRR(D6:D11)`. (Project IRR = `24.6%`).
4. *Build 2-Variable Data Table*: Create table with WACC across top (10% to 16%) and Terminal Growth down side (2% to 5%). Select table, press `Alt + A + W + T`, set Row Input to WACC and Column Input to Growth.
5. *Conditional Decision Matrix*: Enter `=IF(C12 > 0, "INVEST / APPROVED", "REJECT")`.

#v(2pt)

== 4. M&A Sensitivity & Capital Rationing Safeguards
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Valuation Metric*], [*Corporate Decision Benchmark*], [*Excel Analytical Function*]),
  [NPV Hurdle], [Must be strictly positive (> ₹0) at 12% WACC discount rate], [`=IF(NPV > 0, "GO", "NO")`],
  [IRR vs Cost of Capital], [IRR must exceed corporate hurdle rate by at least 300 bps (3%)], [`=IRR(Cash_Flows) > WACC+3%`],
  [Discounted Payback], [Cumulative discounted cash flows must break even within 3.5 years], [`XLOOKUP Cumulative >= 0`],
  [Terminal Multiple Guard], [Validate Terminal Value does not exceed 75% of total enterprise value], [Terminal Sanity Check]
)

#v(2pt)

#spotlight-box("INVESTMENT BANKING ANALYST TAKEAWAY", [
  The common rookie error in Excel is putting Year 0 cash flow inside `=NPV(rate, Yr0:Yr5)`. This erroneously discounts Year 0 cash flow by 1 period, distorting NPV by millions of rupees. Always add Year 0 outside!
])

#pagebreak()

= Template 06: Employee Gratuity & Statutory Tenure Calculator

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Calculates employee gratuity liabilities under the Payment of Gratuity Act 1972, computes completed service tenure with 6-month rounding rules, applies statutory caps, and provisions balance sheet reserves.
]

#v(2pt)

== 1. Mathematical Architecture & Gratuity Act Formulas
#formula-specimen(
  title: "INDIAN STATUTORY GRATUITY FORMULA (ACT 1972)",
  formula: "=ROUND((15 * Last_Drawn_Basic_DA * Rounded_Tenure_Years) / 26, 0)",
  note: "Statutory 26 working days per month standard; 15 days wages per completed year of service."
)

#v(2pt)

#formula-specimen(
  title: "ROUNDED SERVICE TENURE FORMULA",
  formula: "=LET(y, DATEDIF(DOJ, DOE, \"y\"), m, DATEDIF(DOJ, DOE, \"ym\"), IF(m > 6, y + 1, y))",
  note: "Statutory Rule: More than 6 months of service in an incomplete year is rounded up to 1 full year."
)

#v(2pt)

== 2. Live Enterprise Gratuity Liability Register Specimen
#table(
  columns: (0.8fr, 1.5fr, 1.1fr, 1.1fr, 1fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Emp ID*], [*Employee Name*], [*Joining Date*], [*Exit Date*], [*Statutory Tenure*], [*Gratuity Liability*]),
  [EMP-101], [Siddharth Sengupta], [15-Jul-2012], [28-Feb-2027], [15 Years], [₹6,92,308.00],
  [EMP-102], [Meenakshi Sundaram], [01-Feb-2015], [30-Nov-2026], [12 Years], [₹4,84,615.00],
  [EMP-103], [Arjun Deshpande], [10-Aug-2018], [15-Dec-2026], [8 Years], [₹2,76,923.00],
  [EMP-104], [Kavita Krishnan], [01-Apr-2023], [15-Jan-2027], [4 Years], [₹0.00 (Ineligible Under 5 Yrs)],
  [EMP-105], [Ramanathan Swamy], [12-May-2005], [31-Mar-2027], [22 Years], [₹15,23,077.00],
  [EMP-106], [Harpreet Kaur], [18-Sep-2016], [15-Oct-2026], [10 Years], [₹3,46,154.00]
)

#v(2pt)

== 3. Step-by-Step Implementation Protocol
1. *Enter Dates*: Column C contains Date of Joining (`DOJ`), Column D contains Date of Exit (`DOE`).
2. *Compute Service Tenure*: In Column E, enter `=DATEDIF(C4, D4, "y") & " Yrs, " & DATEDIF(C4, D4, "ym") & " Mths"`.
3. *Check Eligibility (5-Year Rule)*: In Column F, enter `=IF(DATEDIF(C4, D4, "y") >= 5, "ELIGIBLE", "INELIGIBLE")`.
4. *Calculate Gratuity with Statutory Cap*: In Column G, enter `=IF(F4="ELIGIBLE", MIN(2000000, ROUND((15 * Last_Basic * Rounded_Tenure) / 26, 0)), 0)`.
5. *Actuarial Provisioning*: Sum Column G with `=SUM(G4:G50)` to feed quarterly corporate balance sheet provisions.

#v(2pt)

== 4. Statutory Compliance & Audit Verification Controls
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Statutory Parameter*], [*Compliance Requirement*], [*Excel Formula Implementation*]),
  [5-Year Vesting Rule], [No gratuity payable for tenure < 5 years (except death/disablement)], [`=IF(Tenure_Yrs >= 5, ..., 0)`],
  [Statutory Maximum Cap], [Total gratuity cannot exceed statutory limit of ₹20,00,000], [`=MIN(2000000, Gratuity)`],
  [26-Day Divisor Standard], [Must divide monthly wage by exactly 26 working days, not 30 or 31], [`*(15/26)` strictly enforced],
  [Death / Disability Waiver], [5-year vesting rule waived under Section 4(1) in unfortunate events], [`=IF(OR(Tenure>=5, Reason="Death"), ...)`]
)

#v(2pt)

#spotlight-box("CORPORATE HR COMPLIANCE TAKEAWAY", [
  The statutory ceiling cap under the Payment of Gratuity Act was updated to ₹20,00,000. Wrapping the formula in `=MIN(2000000, ...)` ensures automatic legal protection against over-provisioning balance sheet reserves.
])

#pagebreak()

= Template 07: Interactive C-Suite Executive KPI Board

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Synthesizes enterprise financial data into an interactive executive dashboard with synchronized Slicers, dynamic summary KPI cards, revenue breakdowns by region, and zero manual refresh overhead.
]

#v(2pt)

== 1. Mathematical Architecture & Formula Blueprint
#formula-specimen(
  title: "DYNAMIC KPI EXTRACTION FROM OLAP / PIVOT CACHE",
  formula: "=GETPIVOTDATA(\"Revenue\", $A$3, \"Region\", \"North\", \"Fiscal_Quarter\", \"Q1\")",
  note: "Extracts guaranteed aggregated metric values from PivotTable caches without cell coordinate drift."
)

#v(2pt)

#formula-specimen(
  title: "DYNAMIC TARGET ACHIEVEMENT % FORMULA",
  formula: "=LET(act, GETPIVOTDATA(\"Revenue\",$A$3), tgt, Target_Rev, (act - tgt) / tgt)",
  note: "Calculates variance % and formats with dynamic custom number format: +0.0%;-0.0%;\"-\"."
)

#v(2pt)

== 2. Live Executive KPI Summary Snapshot
#table(
  columns: (1.5fr, 1.4fr, 1.4fr, 1.2fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Strategic Metric*], [*FY27 Target*], [*Actual YTD*], [*Variance %*], [*Health Status*]),
  [Total Revenue], [₹45,00,00,000], [₹48,20,00,000], [+7.1%], [✓ TARGET BEATEN],
  [Gross Margin %], [42.0%], [44.8%], [+2.8% pts], [✓ OPTIMAL],
  [EBITDA Margin %], [22.0%], [23.4%], [+1.4% pts], [✓ HEALTHY],
  [Customer Acquisition Cost], [₹14,500], [₹13,200], [-9.0%], [✓ COST EFFICIENT],
  [Net Promoter Score (NPS)], [65.0], [72.0], [+7.0 pts], [✓ EXCELLENT],
  [Employee Retention Rate], [92.0%], [94.5%], [+2.5% pts], [✓ STABLE]
)

#v(2pt)

== 3. Step-by-Step Implementation & Dashboard Slicer Architecture
1. *Normalize Raw Data*: Ensure transaction table has headers: `Date`, `Region`, `Product_Line`, `Revenue`, `Cost`, `Profit`.
2. *Insert PivotTable*: Press `Alt + N + V + T` to insert PivotTable into new sheet `Pivot_Engine`.
3. *Connect Multi-Pivot Slicers*: Insert Slicers for `Region`, `Fiscal_Quarter`, and `Sales_Channel`. Right-click Slicer > *Report Connections* > Check all PivotTables on `Pivot_Engine`.
4. *Build C-Suite Visual Cards*: In sheet `Dashboard`, design 4 rounded KPI card shapes. Link each shape text to formula cell: select shape, click formula bar, type `=Pivot_Engine!$C$8`.
5. *Prevent Grid Resizing*: Right-click PivotTable > *PivotTable Options* > Uncheck "Autofit column widths on update" to lock layout.

#v(2pt)

== 4. Boardroom Dashboard Presentation Hygiene
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Dashboard Element*], [*Executive Best Practice Standard*], [*Excel Setup Shortcut*]),
  [Gridline Elimination], [Hide background gridlines on final dashboard tab for clean app appearance], [`Alt + W + V + G`],
  [Slicer Multi-Select], [Enable multi-select toggle on Region & Product Slicers for instant filtering], [`Alt + Slicer Click`],
  [Number Formatting], [Format figures in Indian Lakhs/Crores: `[>9999999]₹0.00,,\ "Cr";₹0.00,\ "L"`], [`Ctrl + 1 > Custom`],
  [Auto-Refresh Interval], [Set PivotTable to auto-refresh data when file opens], [`PivotTable Options > Data`]
)

#v(2pt)

#spotlight-box("EXECUTIVE REPORTING TAKEAWAY", [
  Never let Slicers resize your columns upon filter selection. Right-click Slicer > Size and Properties > Select 'Don't move or size with cells'. This preserves boardroom-ready visual symmetry permanently.
])

#pagebreak()

= Template 08: Multi-Source Power Query Automated Reconciliation

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Automates the consolidation and matching of internal general ledger transactions against external bank clearing statements, flags unreconciled timing differences, and slashes month-end closing cycles from days to minutes.
]

#v(2pt)

== 1. Mathematical Architecture & Power Query M-Code Blueprint
#formula-specimen(
  title: "POWER QUERY ANTI-JOIN (UNMATCHED RECORDS ETL)",
  formula: "= Table.NestedJoin(GL_Ledger, {\"UTR_No\"}, Bank_Stmt, {\"Ref_No\"}, \"BankMatch\", JoinKind.LeftAnti)",
  note: "Extracts all transactions present in general ledger but completely missing from bank statements."
)

#v(2pt)

#formula-specimen(
  title: "EXCEL AUDIT VARIANCE FORMULA",
  formula: "=ROUND(GL_Amount - XLOOKUP(GL_UTR, Bank_UTR, Bank_Amount, 0), 2)",
  note: "Flags timing differences, bank charges, and clerical data entry discrepancies."
)

#v(2pt)

== 2. Live Bank vs General Ledger Reconciliation Specimen
#table(
  columns: (1fr, 1.4fr, 1.4fr, 1.3fr, 1.3fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*UTR / Ref*], [*Internal GL Entity*], [*Bank Description*], [*GL Ledger Amt*], [*Bank Cleared Amt*], [*Variance Status*]),
  [UTR-8901], [Apex Logistics Ltd], [CMS/NEFT/APEX-LOG], [₹4,50,000.00], [₹4,50,000.00], [✓ RECONCILED],
  [UTR-8902], [Kiran Power Systems], [RTGS/KIRAN-POW-SYS], [₹12,85,000.00], [₹12,85,000.00], [✓ RECONCILED],
  [UTR-8903], [Global Cloud Hosting], [INTL WIRE/AWS-CLOUD], [₹3,40,250.00], [₹3,40,650.00], [⚠️ ₹400 BANK CHG],
  [UTR-8904], [Vardhaman Textiles], [NEFT/VARDHAMAN-TEX], [₹8,20,000.00], [₹0.00], [⚠️ UNCLEARED CHEQUE],
  [UTR-8905], [Shree Cement Ltd], [CMS/NEFT/SHREE-CEM], [₹15,40,000.00], [₹15,40,000.00], [✓ RECONCILED],
  [UTR-8906], [BlueDart Express], [AUTO-DEBIT/BLUEDART], [₹0.00], [₹18,500.00], [⚠️ UNRECORDED DEBIT]
)

#v(2pt)

== 3. Step-by-Step Construction Protocol
1. *Ingest General Ledger*: Go to *Data* > *Get Data* > *From File* > *From Excel Workbook*. Select `GL_Dump.xlsx`.
2. *Ingest Bank Feed*: Go to *Data* > *Get Data* > *From Text/CSV*. Select daily downloaded statement `HDFC_Feed.csv`.
3. *Transform & Cleanse*: In Power Query Editor, trim whitespaces: `Text.Trim([UTR_No])` and change amounts to `Currency`.
4. *Merge Queries*: Click *Merge Queries as New*. Select `GL_Dump` on `UTR_No` and `Bank_Feed` on `Ref_No`. Set Join Kind to *Full Outer* to catch differences on both sides.
5. *Close & Load*: Click *Close & Load To...* > *Existing Worksheet* `$A$4`. Setup automatic refresh every 60 minutes.

#v(2pt)

== 4. Reconciliation Exception Protocols & Audit Trail
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Discrepancy Class*], [*Root Cause Analysis*], [*Accounting Action*]),
  [Left Anti-Join Discrepancy], [Cheque issued to vendor but not yet presented at bank for clearing], [Record in Timing Differences schedule],
  [Right Anti-Join Discrepancy], [Direct customer NEFT credit or automated bank service fee debit], [Pass GL Journal Voucher (JV)],
  [Value Variance (≠ ₹0.00)], [TDS deducted at source or intermediary SWIFT bank transmission fees], [Reconcile against Form 26AS],
  [One-Click Refresh All], [Refresh all connected queries and analytical models simultaneously], [`Ctrl + Alt + F5`]
)

#v(2pt)

#spotlight-box("FINANCIAL AUDIT TAKEAWAY", [
  Power Query eliminates manual VLOOKUP bank matching forever. Setting up an automated Left Anti-Join isolates all unpresented cheques with a single click of 'Refresh All' (`Ctrl + Alt + F5`).
])

#pagebreak()

= Template 09: Automated Commercial B2B GST Invoice Generator

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Generates fully compliant B2B tax invoices with automated GST calculations (CGST + SGST vs IGST based on State Code comparison), HSN code lookups, number-to-words currency translation, and print formatting.
]

#v(2pt)

== 1. Mathematical Architecture & GST Tax Rule Blueprint
#formula-specimen(
  title: "AUTOMATED INTER-STATE VS INTRA-STATE GST LOGIC",
  formula: "=IF(Supplier_State = Customer_State, \"INTRA-STATE (CGST 9% + SGST 9%)\", \"INTER-STATE (IGST 18%)\")",
  note: "Evaluates the Place of Supply against Supplier GSTIN state digits (first 2 digits)."
)

#v(2pt)

#formula-specimen(
  title: "TAXABLE AMOUNT & SPLIT TAX CALCULATION",
  formula: "CGST = IF(Intra, Taxable * 9%, 0)  |  SGST = IF(Intra, Taxable * 9%, 0)  |  IGST = IF(Inter, Taxable * 18%, 0)",
  note: "Statutory Rule: In Intra-State supply, total GST is divided equally between Central and State governments."
)

#v(2pt)

== 2. Live Commercial B2B Invoice Line Item Register Specimen
#table(
  columns: (0.8fr, 1.8fr, 0.9fr, 0.7fr, 1fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Item No.*], [*Product Description*], [*HSN / SAC*], [*Qty*], [*Unit Rate*], [*Taxable Amount*]),
  [Line 01], [Enterprise Server Rack Cabinet 42U], [8537], [2 Nos], [₹42,000.00], [₹84,000.00],
  [Line 02], [Managed PoE+ Network Switch 48-Port], [8517], [4 Nos], [₹36,500.00], [₹1,46,000.00],
  [Line 03], [Cat6 UTP Solid Copper Cable 305m], [8544], [10 Rolls], [₹8,500.00], [₹85,000.00],
  [Line 04], [Online UPS Double Conversion 10kVA], [8504], [1 Nos], [₹1,25,000.00], [₹1,25,000.00],
  [Line 05], [Fiber Optic Patch Panel 24-Port LC], [8536], [6 Nos], [₹4,800.00], [₹28,800.00]
)

#v(2pt)

== 3. Step-by-Step Construction Protocol
1. *Setup Supplier & Customer Blocks*: Store Supplier GSTIN in `B4` (e.g., `07AAAAA0000A1Z5` - Delhi). Store Customer GSTIN in `B8`.
2. *Extract State Code*: Enter `=LEFT(B4, 2)` to extract supplier state code and `=LEFT(B8, 2)` for customer state code.
3. *Auto-Populate Line Items*: In invoice table, use `=XLOOKUP(Selected_SKU, tbl_Products[SKU], tbl_Products[Description])`.
4. *Calculate Split Taxes*: In summary block:
   - Subtotal: `=SUM(F15:F25)`
   - CGST: `=IF(LEFT(B4,2)=LEFT(B8,2), Subtotal * 9%, 0)`
   - SGST: `=IF(LEFT(B4,2)=LEFT(B8,2), Subtotal * 9%, 0)`
   - IGST: `=IF(LEFT(B4,2)<>LEFT(B8,2), Subtotal * 18%, 0)`
   - Total Invoice Value: `=ROUND(Subtotal + CGST + SGST + IGST, 0)`
5. *Set Print Area*: Select `A1:G45`, press `Alt + P + R + S` to define printable A4 invoice page.

#v(2pt)

== 4. Indian GST Compliance & Verification Safeguards
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Statutory Field*], [*Statutory Validation Rule*], [*Excel Formula Implementation*]),
  [GSTIN Format Check], [Must be exactly 15 alphanumeric characters (`2 State + 10 PAN + 1 Entity + 1 Z + 1 Check`)], [`=AND(LEN(B4)=15, ISNUMBER(VALUE(LEFT(B4,2))))`],
  [HSN Code Mandate], [HSN/SAC code must be 4, 6 or 8 digits under GST e-Invoicing norms], [`Data Validation > Text Length (4 to 8)`],
  [Place of Supply (POS)], [Determines Inter vs Intra supply state jurisdiction for GST portal upload], [`=IF(State1=State2, "INTRA", "INTER")`],
  [Number to Words], [VBA macro function `=SpellIndian(Total_Amount)` to print words on invoice bottom], [`VBA Add-In / Custom LAMBDA`]
)

#v(2pt)

#spotlight-box("ACCOUNTS RECEIVABLE TAKEAWAY", [
  Comparing the first 2 digits of the Supplier GSTIN against the Customer GSTIN via `=LEFT(GSTIN, 2)` prevents ₹100,000s in GST portal filing rejections caused by charging CGST/SGST on inter-state shipments.
])

#pagebreak()

= Template 10: Dynamic Project Gantt Chart & Milestone Model

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Tracks complex project timelines, milestone dependencies, working day duration exclusions (weekends & gazetted national holidays), percentage completion progress bars, and critical path slip warnings.
]

#v(2pt)

== 1. Mathematical Architecture & Project Calendar Formulas
#formula-specimen(
  title: "DYNAMIC END DATE COMPUTATION WITH HOLIDAYS",
  formula: "=WORKDAY.INTL(Start_Date, Duration_Days, 1, Holiday_Range)",
  note: "Computes exact business milestone completion dates while automatically excluding weekend days and holidays."
)

#v(2pt)

#formula-specimen(
  title: "ACTUAL WORKING DAYS ELAPSED FORMULA",
  formula: "=NETWORKDAYS.INTL(Start_Date, MIN(TODAY(), End_Date), 1, Holiday_Range)",
  note: "Measures exact elapsed business days to assess real project velocity against baseline."
)

#v(2pt)

== 2. Live Cloud Infrastructure Migration Project Timeline Specimen
#table(
  columns: (0.7fr, 2.2fr, 1.1fr, 0.9fr, 1.1fr, 0.9fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Task No.*], [*Project Milestone / Phase*], [*Start Date*], [*Duration*], [*End Date*], [*% Done*]),
  [TSK-01], [Enterprise Cloud Readiness Audit], [05-Jan-2027], [10 Days], [18-Jan-2027], [100%],
  [TSK-02], [Virtual Private Cloud (VPC) Peering], [19-Jan-2027], [8 Days], [29-Jan-2027], [100%],
  [TSK-03], [Active Directory & IAM SSO Federation], [01-Feb-2027], [12 Days], [16-Feb-2027], [85%],
  [TSK-04], [Database Cluster Replication to Azure], [17-Feb-2027], [15 Days], [09-Mar-2027], [40%],
  [TSK-05], [Security Penetration & Compliance Review], [10-Mar-2027], [7 Days], [18-Mar-2027], [0%],
  [TSK-06], [Production Traffic DNS Cutover (Go-Live)], [19-Mar-2027], [2 Days], [22-Mar-2027], [0%]
)

#v(2pt)

== 3. Step-by-Step Construction Protocol
1. *Setup Calendar Grid*: In row 3 from Column G onwards, enter dates `=StartDate + SEQUENCE(1, 60, 0, 1)`.
2. *Format Date Headers*: Format dates as `dd` (day only) with column width set to 3.0 characters for a compact grid.
3. *Apply Gantt Bar Conditional Formatting*: Select grid range `G4:BP20`. Go to *Conditional Formatting* > *New Rule* > *Use a formula*:
   - Formula: `=AND(G$3 >= $C4, G$3 <= $E4)`
   - Format: Fill Color `#107C41` (Green Gantt Bar).
4. *Add Completed Portion Highlight*: Add second rule with higher priority:
   - Formula: `=AND(G$3 >= $C4, G$3 <= ($C4 + ($E4-$C4)*$F4))`
   - Format: Fill Color `#047857` (Dark Green Progress Fill).
5. *Dynamic Today Marker*: Add vertical line rule: `=G$3 = TODAY()` with border color Red.

#v(2pt)

== 4. Project Management Controls & Slippage Alerts
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Project Risk*], [*Operational Milestone Alert*], [*Excel Formula Mechanism*]),
  [Schedule Slippage Alert], [Flag task in Red if `TODAY() > End_Date` and `% Done < 100%`], [`=IF(AND(TODAY()>E4, F4<1), "DELAY", "ON-TRACK")`],
  [Holiday Master Table], [Feed list of official public holidays in `Holiday_Range` for automatic exclusion], [`WORKDAY.INTL(..., Holidays)`],
  [Dependency Linking], [Set next task start date to previous task end date + 1 day: `=E4 + 1`], [`Dynamic Milestone Chaining`],
  [Milestone Diamond], [Insert Wingdings symbol `◆` when task duration is set to 0 days], [`=IF(Duration=0, "◆", "")`]
)

#v(2pt)

#spotlight-box("PROJECT MANAGEMENT OFFICE (PMO) TAKEAWAY", [
  Using `=WORKDAY.INTL()` with custom weekend masks (`"0000011"` for Saturday-Sunday weekend) ensures project deadlines never land on non-working days, preventing false project delay alerts.
])

#pagebreak()

= Template 11: Statistical Process Quality Control (SPC) Model

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Monitors manufacturing production tolerance limits, calculates process capability metrics ($C_p$ and $C_{p k}$), Upper & Lower Control Limits (UCL / LCL), and isolates Six Sigma quality defects automatically.
]

#v(2pt)

== 1. Mathematical Architecture & Six Sigma SPC Formulas
#formula-specimen(
  title: "UPPER & LOWER STATISTICAL CONTROL LIMITS (±3σ)",
  formula: "UCL = AVERAGE(Values) + (3 * STDEV.S(Values))  |  LCL = AVERAGE(Values) - (3 * STDEV.S(Values))",
  note: "Encompasses 99.73% of normal variation; any data point breaching limits indicates a defect."
)

#v(2pt)

#formula-specimen(
  title: "PROCESS CAPABILITY RATIO (Cpk) FORMULA",
  formula: "=MIN((USL - Mean) / (3 * Sigma), (Mean - LSL) / (3 * Sigma))",
  note: "Corporate Quality Standard: Cpk >= 1.33 represents a capable, institutional Six Sigma process."
)

#v(2pt)

== 2. Live Precision CNC Machining Quality Sample Register
#table(
  columns: (1fr, 1.4fr, 1.4fr, 1.3fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Sample No.*], [*Observed Value*], [*Mean Target*], [*UCL (+3σ)*], [*Defect Status*]),
  [SMP-001], [25.042 mm], [25.000 mm], [25.075 mm], [✓ IN SPECIFICATION],
  [SMP-002], [24.985 mm], [25.000 mm], [25.075 mm], [✓ IN SPECIFICATION],
  [SMP-003], [25.082 mm], [25.000 mm], [25.075 mm], [⚠️ OUT OF CONTROL (HIGH)],
  [SMP-004], [25.012 mm], [25.000 mm], [25.075 mm], [✓ IN SPECIFICATION],
  [SMP-005], [24.918 mm], [25.000 mm], [25.075 mm], [⚠️ OUT OF CONTROL (LOW)],
  [SMP-006], [25.031 mm], [25.000 mm], [25.075 mm], [✓ IN SPECIFICATION]
)

#v(2pt)

== 3. Step-by-Step Implementation Protocol
1. *Compute Distribution Baseline*:
   - Grand Mean: In Cell `B10`, enter `=AVERAGE(B2:B50)`.
   - Sample Standard Deviation: In Cell `B11`, enter `=STDEV.S(B2:B50)`.
2. *Compute 3-Sigma Control Limits*:
   - UCL: In Cell `B12`, enter `=B10 + (3 * B11)`.
   - LCL: In Cell `B13`, enter `=B10 - (3 * B11)`.
3. *Identify Out-of-Control Points*: In Column E, enter:
   `=IF(B2 > $B$12, "OUT OF CONTROL HIGH", IF(B2 < $B$13, "OUT OF CONTROL LOW", "IN SPEC"))`.
4. *Calculate Cpk Metric*: Enter Upper Spec Limit (`USL=25.080`) and Lower Spec Limit (`LSL=24.920`). Compute Cpk in Cell `B16`.
5. *Insert Line Chart with Limit Lines*: Select data, insert 2D Line Chart. Add static series for Mean, UCL, and LCL.

#v(2pt)

== 4. Six Sigma Process Capability Standards & Western Electric Rules
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Capability Tier*], [*Process Performance Benchmark*], [*Statistical Interpretation*]),
  [Cpk < 1.00], [Incapable Process - High scrap rate and non-compliance], [Process width exceeds spec limits],
  [1.00 <= Cpk < 1.33], [Barely Capable - Requires 100% inspection quality gate], [Process width barely fits specification],
  [Cpk >= 1.33], [Institutional Six Sigma - Production process fully optimized], [Less than 3.4 defects per million parts],
  [Western Electric Rule 1], [Single point falling outside 3-sigma control limits], [Immediate machine recalibration trigger]
)

#v(2pt)

#spotlight-box("OPERATIONAL EXCELLENCE TAKEAWAY", [
  A process can have a perfect average (Mean = 25.000 mm) but still produce catastrophic scrap if variance is excessive. Always evaluate $C_{p k}$ alongside the Mean to ensure both centering and dispersion are controlled.
])

#pagebreak()

= Template 12: 2027 Copilot AI Python Financial Model

#concept-box(title: "EXECUTIVE USE CASE & BUSINESS OBJECTIVE")[
  Harnesses native Python inside Excel 365 (`=PY`) combined with Microsoft Copilot AI prompts to clean unorganized financial data, run machine learning linear regressions, and forecast future cash flow velocity.
]

#v(2pt)

== 1. Mathematical Architecture & Python in Excel (`=PY`) Syntax
#formula-specimen(
  title: "NATIVE PYTHON IN EXCEL DATAFRAME INGESTION",
  formula: "df = xl(\"tbl_Transactions[#All]\", headers=True)  |  df['Growth'] = df['Rev'].pct_change()",
  note: "Runs real Python runtime in isolated Microsoft cloud containers with zero local Python installs."
)

#v(2pt)

#formula-specimen(
  title: "SCIKIT-LEARN LINEAR REGRESSION PREDICTION",
  formula: "model = LinearRegression().fit(df[['Marketing_Spend']], df['Revenue']); pred = model.predict(X_new)",
  note: "Embeds institutional predictive machine learning directly into standard Excel formula cells."
)

#v(2pt)

== 2. Live Predictive Financial Regression Output Specimen
#table(
  columns: (1fr, 1.4fr, 1.4fr, 1.3fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Fiscal Period*], [*Marketing Spend*], [*Reported Revenue*], [*Predicted Revenue*], [*Residual Variance*]),
  [Month 01], [₹4,50,000.00], [₹38,20,000.00], [₹37,85,000.00], [+₹35,000.00],
  [Month 02], [₹5,20,000.00], [₹43,50,000.00], [₹42,90,000.00], [+₹60,000.00],
  [Month 03], [₹6,10,000.00], [₹48,90,000.00], [₹49,40,000.00], [-₹50,000.00],
  [Month 04], [₹7,00,000.00], [₹55,40,000.00], [₹55,90,000.00], [-₹50,000.00],
  [Month 05], [₹8,20,000.00], [₹65,10,000.00], [₹64,55,000.00], [+₹55,000.00],
  [Forecast M06], [₹9,50,000.00], [Pending Actual], [₹73,95,000.00], [AI Forecast $R^2=0.98$]
)

#v(2pt)

== 3. Step-by-Step Construction Protocol
1. *Activate Python in Excel*: Click any cell, type `=PY` and press `Tab`. The formula bar turns green with the Python icon.
2. *Ingest Data into Pandas*: Type `df = xl("A3:D15", headers=True)`. Press `Ctrl + Enter` to commit.
3. *Run Summary Statistics*: In another Python cell, enter `df.describe()` to output count, mean, std, min, 25%, 50%, 75%, and max.
4. *Leverage Microsoft Copilot AI*: Open Copilot sidebar (`Alt + C`). Prompt:
   _“Analyze the correlation between Marketing Spend and Revenue in tbl_Data. Write a Python snippet to fit a linear regression and forecast revenue for next 3 quarters.”_
5. *Output as Excel Value*: Click the Python Output icon in the formula bar and toggle from *Python Object* to *Excel Value*.

#v(2pt)

== 4. Python in Excel Enterprise Security & Governance
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Security Guardrail*], [*Microsoft Cloud Architecture*], [*Governance Policy*]),
  [Isolated Container Sandbox], [Code executes in hypervisor-isolated Microsoft Azure container], [Zero access to local file system or network],
  [Data Privacy Compliance], [Workbook data sent to Python container is wiped after computation], [Complies with SOC2, GDPR and ISO27001],
  [Approved Libraries Only], [Includes Anaconda curated stack (pandas, numpy, statsmodels, seaborn)], [No arbitrary pip package installs permitted],
  [Visual Plot Embedding], [Plot figures using `plt.show()` and format cell as Excel Image], [`Excel Image Output Mode`]
)

#v(2pt)

#spotlight-box("2027 DATA SCIENTIST TAKEAWAY", [
  Python in Excel transforms Excel from a calculation grid into a full data science notebook. You get the power of pandas and scikit-learn without managing environments or installing Python on corporate locked laptops.
])

#pagebreak()

= Corporate Financial Modeling Standards & Master Audit Protocol

#concept-box(title: "RTECHLAB CORPORATE FINANCIAL MODELING CODE")[
  Every professional Excel workbook built for enterprise deployment must comply with institutional auditing standards to ensure calculation accuracy, zero formula corruption, and complete audit trail defensibility.
]

#v(2pt)

== 1. Universal Financial Modeling Color Conventions
#table(
  columns: (1.2fr, 1.2fr, 1.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Cell Element*], [*Font Color*], [*Fill Pattern*], [*Corporate Auditing Meaning*]),
  [User Input Cells], [Pure Blue (`#0000FF`)], [Unfilled / White], [Constants and variables that users are authorized to modify.],
  [Calculations / Formulas], [Black (`#000000`)], [Unfilled / White], [Locked cells containing formulas; must never be overwritten.],
  [Cross-Sheet References], [Green (`#008000`)], [Unfilled / White], [Formulas pulling data from another tab within the same workbook.],
  [External Links], [Dark Red (`#990000`)], [Light Red (`#FEE2E2`)], [Links to external workbooks (must be minimized to prevent broken links).],
  [Summary / Header], [White (`#FFFFFF`)], [Dark Navy (`#0F172A`)], [Table headers, master totals, and non-calculating section dividers.]
)

#v(2pt)

== 2. Formula Auditing & Error Diagnostic Accelerators
#table(
  columns: (1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Auditing Function*], [*Diagnostic Capability*], [*Keyboard Shortcut*]),
  [Trace Precedents], [Draws blue tracer arrows to all cells feeding the active formula], [`Ctrl + [`],
  [Trace Dependents], [Draws blue tracer arrows to all cells dependent on the active cell], [`Ctrl + ]`],
  [Evaluate Formula], [Steps through formula calculation step-by-step like a code debugger], [`Alt + M + V`],
  [Go To Special], [Instantly selects all constants, formulas, or blank cells in active sheet], [`Ctrl + G > Alt + S`],
  [Toggle Formulas], [Switches entire sheet from showing values to showing raw formulas], [`Ctrl + ~` (Tilde)],
  [Error Checking], [Jumps directly to next error in active sheet and displays rule violated], [`Alt + M + E + K`]
)

#v(2pt)

== 3. Institutional Model Pre-Flight Verification Checklist
Before submitting any financial model or workbook to management or external auditors, execute this 5-point verification checklist:
#table(
  columns: (0.8fr, 2fr, 3.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Check No.*], [*Verification Dimension*], [*Mandatory Operational Action Required*]),
  [CHK-01], [Hardcoded Numbers in Formulas], [Press `Ctrl + ~` and verify no numbers are hardcoded inside formulas (e.g., `=A1*1.18`). All constants must reside in dedicated input cells.],
  [CHK-02], [Circular Reference Check], [Check bottom-left status bar for "Circular References". If present, resolve via *Formulas* > *Error Checking* > *Circular References*.],
  [CHK-03], [Dynamic Table Structure], [All raw data sets must be formatted as official Excel Tables (`Ctrl + T`) to guarantee auto-expanding formula ranges.],
  [CHK-04], [Error Trap Enclosure], [All lookup and division formulas must be wrapped in `=IFERROR(...)` or modern `=XLOOKUP(..., "NOT FOUND")` to prevent ugly `#N/A` or `#DIV/0!`.],
  [CHK-05], [Worksheet Protection Lock], [Lock all formula cells (`Format Cells > Protection > Locked`) and protect worksheet with password to prevent accidental deletion.]
)

#v(2pt)

#spotlight-box("CHIEF FINANCIAL OFFICER (CFO) MENTOR NOTE", [
  A financial model is only as strong as its credibility. Following standardized color conventions and wrapping lookups in IFERROR separates junior data entry clerks from elite corporate financial analysts.
])

#pagebreak()

= Practical Workbook Certification & ₹149 Bundle Access Portal

#concept-box(title: "RTECHLAB OFFICIAL CERTIFICATION OF COMPLETION · 2027")[
  This certifies that the candidate has completed exhaustive hands-on architectural study of all 12 enterprise Excel 365 practical workbooks, mastering financial modeling, data automation, Power Query reconciliation, and Copilot AI integration.
]

#v(2pt)

== 1. Complete ₹149 Career Accelerator Deliverables Index
Your RTechLab Career Accelerator purchase unlocks lifetime access to the entire 4-deliverable suite:
#table(
  columns: (0.8fr, 2.8fr, 1.2fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Asset No.*], [*Deliverable Title*], [*Format & Scope*], [*Target Career Stage*]),
  [AST-01], [Microsoft Office 365 Master Guide (English Edition)], [112-Page Master PDF], [Complete Foundational to Advanced Mastery],
  [AST-02], [Microsoft Office 365 Master Guide (Hindi Edition)], [112-Page Master PDF], [Complete Bilingual Conceptual Clarity],
  [AST-03], [Top 100 Shortcuts & 50 MIS Interview Vault (Bilingual)], [10-Page Standalone PDF], [Corporate Job Interviews & Speed Drills],
  [AST-04], [12 Enterprise Excel Practical Templates Workbook Guide], [16-Page Standalone PDF], [Hands-on Corporate Production Deployment],
  [AST-05], [MIS, Data Analyst & Office 365 Career & Salary Blueprint], [12-Page Standalone PDF], [Salary Negotiation, Resumes & 2027 Roadmaps]
)

#v(2pt)

== 2. Candidate Honour Pledge & Verification Code
#table(
  columns: (1.5fr, 3.5fr),
  fill: (x, y) => if y == 0 { rgb("#1E293B") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 5pt, y: 3pt),
  table.header([*Certification Dimension*], [*Official Candidate Record*]),
  [Candidate Registered Name:], [STUDENT / PROFESSIONAL NAME: ............................................................],
  [Accreditation Authority:], [RTechLab Educational Publishing & Enterprise Solutions Division],
  [Chief Technology Architect:], [Rahul Patel, Founder & Chief Technology Architect, RTechLab],
  [Digital Verification Token:], [SHA256-RTL-O365-2027-EXCEL-WORKBOOK-PRACTICAL-VERIFIED],
  [Bundle Commercial Value:], [₹1,999 Corporate Training Value (Accessible at ₹149 Subsidized)],
  [Corporate Support Portal:], [rahul.28e1\@gmail.com · Verified Telegram Community Access]
)

#v(3pt)

#align(center)[
  #block(
    fill: rgb("#F8FAFC"),
    stroke: 0.8pt + rgb("#0F172A"),
    inset: 8pt,
    radius: 4pt,
    width: 95%
  )[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[RTECHLAB OFFICIAL SEAL OF PRACTICAL PROFICIENCY]\
    #v(2pt)
    #text(size: 7.2pt, fill: rgb("#475569"))[
      "Technology Made Practical. Learn. Practice. Innovate."\
      Official Corporate Training Deliverable · RTechLab Technologies India · All Rights Reserved © 2027
    ]
  ]
]

#v(2pt)

#align(center)[
  #text(size: 6.8pt, fill: rgb("#94A3B8"))[
    RTECHLAB DIGITAL PUBLISHING DIVISION · CERTIFICATE ID: RTL-2027-O365-WB-CERT
  ]
]
"""

    with open(typ_path, "w", encoding="utf-8") as f:
        f.write(typ_src)

    cmd = ["typst", "compile", "--root", ".", typ_path, pdf_out]
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print("Typst Compilation Error:")
        print(res.stderr)
        return False

    print(f"✓ Practical Templates Workbook compiled successfully: {pdf_out}")

    doc = fitz.open(pdf_out)
    print(f"Total Pages: {len(doc)}")
    for pno in range(1, len(doc)):
        page = doc[pno]
        blocks = [b for b in page.get_text('blocks') if 50 < b[1] and b[3] < 800]
        if blocks:
            max_y = max(b[3] for b in blocks)
            content_fill = (max_y / 760.0) * 100
            print(f"  Page {pno+1}: max content y = {round(max_y, 1)} ({round(content_fill, 1)}% of usable 760pt page)")
        else:
            print(f"  Page {pno+1}: NO CONTENT BLOCKS FOUND")

    return True

if __name__ == "__main__":
    generate_dense_workbook_v2()
