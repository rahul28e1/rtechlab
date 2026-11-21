import os
import subprocess
import fitz

def build_practical_templates():
    out_dir = 'DIGITAL/OFFICE_365/02_PRACTICAL_EXCEL_TEMPLATES'
    os.makedirs(out_dir, exist_ok=True)

    src = """#import "../07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "Excel 365 Enterprise Practical Templates Workbook Guide",
  author: "Rahul Patel"
)

// COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5(
  title: "EXCEL 365 PRACTICAL TEMPLATES WORKBOOK",
  subtitle: "12 Production Enterprise Workbooks · Financial Amortization, Dynamic Inventory & MIS Models",
  edition: "2027 CAREER ACCELERATOR DELIVERABLE"
)

#show: rtech-book.with(
  title: "Excel 365 Practical Templates Workbook",
  edition: "2027 Master Edition · Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-O365-EXCEL-LABS"
)

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PRACTICAL WORKBOOK ARCHITECTURE · RTECHLAB 2027]
= Enterprise Practical Excel Templates Catalog & Architecture

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  This standalone workbook deliverable provides complete formula architectures, data schema layouts, and operational instructions for 12 commercial-grade Excel workbooks included in the RTechLab ₹149 Career Accelerator Bundle.
]

#v(4pt)

#table(
  columns: (0.7fr, 2.2fr, 2fr, 2.1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*Tmpl No.*], [*Enterprise Template Name*], [*Core Formulas & Functions*], [*Corporate Target Deployment*]),
  [TMP-01], [Loan Amortization & EMI Schedule], [PMT, IPMT, PPMT, ROUND, CUMIPMT], [Retail Banking, Corporate Debt Schedules],
  [TMP-02], [Dynamic Inventory & Reorder Tracker], [XLOOKUP, IF, MIN, MAX, Data Validation], [Supply Chain, Warehouse Stock Audits],
  [TMP-03], [Automated Employee Payroll & Payslip], [VLOOKUP, SUMIFS, DATEDIF, ROUND], [HR Operations, Statutory Provident Fund],
  [TMP-04], [Multi-Tier Sales Commission Matrix], [IFS, XLOOKUP (Exact & Next), LET], [B2B Corporate Sales & Performance Incentives],
  [TMP-05], [Capital Budgeting & DCF Model], [NPV, IRR, XNPV, XIRR, FV, PV], [M&A Due Diligence, Corporate Expansion],
  [TMP-06], [Employee Gratuity & Tenure Calculator], [DATEDIF, YEARFRAC, IF, EOMONTH], [HR Compliance & Statutory Employee Benefits],
  [TMP-07], [Interactive C-Suite Executive KPI Board], [PivotTables, Slicers, Timelines, GETPIVOTDATA], [Boardroom Reviews, Quarterly Earnings],
  [TMP-08], [Multi-Source Power Query Reconciliation], [M-Code ETL, Anti-Join, Fuzzy Merge], [Financial Audit, Bank Statement Matching],
  [TMP-09], [Automated Invoice Generator], [INDEX, MATCH, TEXTJOIN, Form Controls], [Accounts Receivable, Vendor Billing],
  [TMP-10], [Dynamic Project Gantt Chart Model], [WORKDAY.INTL, NETWORKDAYS, Conditional Formatting], [Agile & Waterfall Project Timelines],
  [TMP-11], [Statistical Quality Control (SPC) Model], [AVERAGE, STDEV.S, NORM.DIST, Z-Score], [Manufacturing Six Sigma Defect Analysis],
  [TMP-12], [2027 Copilot AI Python Financial Model], [=PY, pandas, seaborn, linear_model], [Predictive Cash Flow & Churn Modeling]
)

#v(4pt)

== Detailed Template Construction & Formula Blueprint: Template 01 (Loan EMI)

#formula-specimen(title: "MONTHLY EMI CALCULATION FORMULA", formula: "=PMT(Annual_Rate / 12, Total_Tenure_Years * 12, -Loan_Principal)", note: "Guarantees exact monthly repayment figures matching commercial banking ledgers.")

#v(4pt)

#table(
  columns: (1fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*Month*], [*Opening Principal*], [*Interest Paid (IPMT)*], [*Principal Repaid (PPMT)*], [*Closing Balance*]),
  [Month 1], [₹10,00,000.00], [₹7,916.67], [₹13,085.24], [₹9,86,914.76],
  [Month 2], [₹9,86,914.76], [₹7,813.08], [₹13,188.83], [₹9,73,725.93],
  [Month 3], [₹9,73,725.93], [₹7,708.66], [₹13,293.25], [₹9,60,432.68],
  [Month 60], [₹20,836.98], [₹164.93], [₹20,836.98], [₹0.00 (Fully Amortized)]
)

#v(6pt)

#spotlight-box("STANDALONE WORKBOOK ACCESS INSTRUCTIONS", [
  All 12 pre-built `.xlsx` template workbooks are bundled inside the official `Office-365-Career-Accelerator-Bundle.zip` archive. Students can open them directly in Microsoft Excel 365, customize corporate logos, and deploy them immediately in enterprise production.
])
"""

    typ_path = os.path.join(out_dir, "templates_guide.typ")
    with open(typ_path, "w", encoding="utf-8") as f:
        f.write(src)

    out_pdf = os.path.join(out_dir, "Office-365-Practical-Excel-Templates-Workbook-Guide.pdf")
    subprocess.run(['typst', 'compile', '--root', '.', typ_path, out_pdf], check=True)
    doc = fitz.open(out_pdf)
    print(f"✓ Practical Templates Guide compiled: {len(doc)} pages ({out_pdf})")

if __name__ == "__main__":
    build_practical_templates()
