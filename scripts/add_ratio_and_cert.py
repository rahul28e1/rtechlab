# -*- coding: utf-8 -*-
"""
Add Ratio Analysis & Audit Certification to mega_capstone_eng.py
"""
import os

filepath = r"c:\Users\Rahul\Videos\My projects\RtechLab\scripts\mega_capstone_eng.py"
with open(filepath, "r", encoding="utf-8") as f:
    text = f.read()

extra_cap = """
== C.11 Phase 9: Financial Ratio Analysis & Corporate Solvency Audit
Corporate management and statutory auditors analyze key financial ratios to evaluate liquidity, profitability, and operational efficiency:

#table(
  columns: (1.4fr, 1.2fr, 1fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Financial Ratio]], [#text(weight: "bold", fill: white)[Mathematical Formula]], [#text(weight: "bold", fill: white)[Result]], [#text(weight: "bold", fill: white)[Corporate Health Interpretation]],
  [Current Ratio], [Current Assets / Current Liab], [4.12 : 1], [Exceptional liquidity. Exceeds standard 2:1 corporate benchmark.],
  [Quick Ratio], [Quick Assets / Current Liab], [1.25 : 1], [Liquid cash and receivables comfortably cover immediate obligations.],
  [Gross Profit Margin], [(Gross Profit / Sales) * 100], [38.58%], [Robust manufacturing trade margin after raw material assembly.],
  [Net Profit Margin], [(Net Profit / Total Rev) * 100], [31.50%], [High operational profitability and tight overhead expense control.],
  [Debt-Equity Ratio], [Total Debt / Shareholder Equity], [0.32 : 1], [Highly conservative capital structure; very low solvency risk.]
)

#v(8pt)

== C.12 Statutory Audit Certificate & Corporate Training Endorsement
#block(
  fill: rgb("#F8FAFC"),
  stroke: 1.5pt + rgb("#0E7490"),
  radius: 6pt,
  inset: 12pt,
  [
    #align(center)[
      #text(weight: "black", size: 10pt, fill: rgb("#0E7490"))[INSTITUTE OF ACCOUNTING & NETWORK TECHNOLOGY (IANT PALANPUR)]\\
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[CERTIFICATE OF PRACTICAL CORPORATE AUDIT & ERP MASTERY]\\
      #v(4pt)
      #text(size: 7.2pt, style: "italic", fill: rgb("#64748B"))[Issued in Joint Academic Partnership with RTechLab Commercial Learning Systems]
    ]
    #v(6pt)
    #text(size: 8pt, fill: rgb("#334155"))[
      This is to certify that the candidate has successfully executed the complete end-to-end accounting simulation for *Ravi Global Enterprises Private Limited* in Tally Prime. The candidate has demonstrated verified competency in:
    ]
    #v(3pt)
    - Double-entry multi-currency bookkeeping across all 6 core voucher types (Contra, Payment, Receipt, Journal, Sales, Purchase).
    - Multi-location godown inventory tracking with Bill of Materials (BOM) computer assembly manufacturing.
    - Statutory GST compliance: Rule 46 Tax Invoicing, GSTR-1, GSTR-3B monthly tax computation, and 100% GSTR-2B reconciliation.
    - Statutory Income Tax compliance: TDS withholding under Sections 194C, 194J, and 194I, with quarterly Form 26Q reconciliation.
    - Bank Reconciliation Statement (BRS) audit, verifying zero discrepancy against commercial bank records.
    - Preparation and analysis of audited final financial statements (Trading Account, Profit & Loss Account, and Schedule III Balance Sheet).
    #v(10pt)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[Corporate Trainer Evaluation:] *DISTINCTION (GRADE A+)*\\
        #text(size: 7pt, fill: rgb("#64748B"))[Practical Verification ID: RTECH-TALLY-2027-VAL]
      ],
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0E7490"))[Rahul Patel]\\
        #text(size: 6.8pt, fill: rgb("#475569"))[Lead Corporate Accounting Trainer · IANT Palanpur\\Founder, RTechLab]
      ]
    )
  ]
)

#v(6pt)
"""

if "== C.11 Phase 9" not in text:
    text = text.replace("== C.11 Capstone Assessment & Viva", extra_cap + "\n== C.13 Capstone Assessment & Viva")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(text)

print(f"Updated {filepath} ({os.path.getsize(filepath)} bytes)")
