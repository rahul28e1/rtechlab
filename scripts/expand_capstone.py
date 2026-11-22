# -*- coding: utf-8 -*-
"""
Expand Capstone Project in mega_capstone_eng.py to bring total pages to 53-54
"""
import os

filepath = r"c:\Users\Rahul\Videos\My projects\RtechLab\scripts\mega_capstone_eng.py"
with open(filepath, "r", encoding="utf-8") as f:
    text = f.read()

capstone_extra = """
== C.8 Phase 7: The 10 Capstone Commercial Invoices Breakdown
Every trainee must generate and audit the following 10 commercial invoices within the capstone company:

#table(
  columns: (0.5fr, 1fr, 1.3fr, 1fr, 1fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Inv \#]], [#text(weight: "bold", fill: white)[Date & Type]], [#text(weight: "bold", fill: white)[Party Name & GSTIN]], [#text(weight: "bold", fill: white)[Taxable Val]], [#text(weight: "bold", fill: white)[GST Tax]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [PUR-01], [04-Apr · Pur], [Avni Pvt Ltd (24AABCA5544P1Z3)], [₹8,00,000], [CGST+SGST 18%], [₹9,44,000],
  [PUR-02], [05-Apr · Pur], [Vishnu Tech (29AABCV7788M1Z4)], [₹5,40,000], [IGST 18%], [₹6,37,200],
  [PUR-03], [06-Apr · Pur], [Avni Pvt Ltd (24AABCA5544P1Z3)], [₹2,30,000], [CGST+SGST 18%], [₹2,71,400],
  [SAL-01], [12-Apr · Sale], [Maheshwari (24AABCM3344R1Z1)], [₹4,25,000], [CGST+SGST 18%], [₹5,01,500],
  [SAL-02], [14-Apr · Sale], [Mumbai IT (27AAACM4455N1Z9)], [₹2,64,000], [IGST 18%], [₹3,11,520],
  [CN-01], [15-Apr · C/N], [Maheshwari (24AABCM3344R1Z1)], [-₹85,000], [CGST+SGST 18%], [-₹1,00,300],
  [DN-01], [16-Apr · D/N], [Avni Pvt Ltd (24AABCA5544P1Z3)], [-₹40,000], [CGST+SGST 18%], [-₹47,200],
  [SRV-01], [22-Apr · Sale], [Jaimin Corp (24AABCJ6677K1Z0)], [₹75,000], [CGST+SGST 18%], [₹88,500],
  [EXP-01], [28-Apr · Pur], [Airtel Broadband (24AAACA0123P1Z0)], [₹4,000], [CGST+SGST 18%], [₹4,720],
  [RNT-01], [30-Apr · Jrn], [Shri Arvindbhai (Landlord)], [₹25,000], [TDS Sec 194I 10%], [₹22,500 (Net)]
)

#v(6pt)

== C.9 Phase 8: Tripartite GST Returns Reconciliation Audit
In accordance with statutory corporate auditing mandates, the trainee must reconcile the company's internal accounting books against statutory GST portal filings:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reconciliation Field]], [#text(weight: "bold", fill: white)[As per Tally Prime Books]], [#text(weight: "bold", fill: white)[As per Portal (1/3B/2B)]], [#text(weight: "bold", fill: white)[Audit Variance]],
  [Total Outward Taxable Value], [₹6,79,000.00], [₹6,79,000.00 (GSTR-1)], [₹0.00 (Matched)],
  [Output CGST Liability], [₹37,350.00], [₹37,350.00 (GSTR-3B)], [₹0.00 (Matched)],
  [Output SGST Liability], [₹37,350.00], [₹37,350.00 (GSTR-3B)], [₹0.00 (Matched)],
  [Output IGST Liability], [₹47,520.00], [₹47,520.00 (GSTR-3B)], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (CGST)], [₹89,460.00], [₹89,460.00 (GSTR-2B)], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (SGST)], [₹89,460.00], [₹89,460.00 (GSTR-2B)], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (IGST)], [₹97,200.00], [₹97,200.00 (GSTR-2B)], [₹0.00 (Matched)],
  [Net Tax Payable in Cash (PMT-06)], [₹0.00 (Excess ITC c/f)], [₹0.00 (Cash Ledger)], [₹0.00 (Carried Forward)]
)

#v(6pt)

== C.10 Comprehensive Corporate Capstone Self-Assessment Drill (15 Questions)
1. *What is the primary function of the Bill of Materials (BOM) during workstation assembly?*\\
   *Answer:* It pre-programs the technical recipe of components, automatically deducting raw stock from the central godown and capitalizing finished assembly value without manual data entry.
2. *Why was TDS under Section 194I deducted on the ₹25,000 office rent?*\\
   *Answer:* Under Section 194I of the Income Tax Act, corporate entities paying commercial rent exceeding ₹2,40,000 annually must deduct 10% TDS from the landlord.
3. *What is the purpose of GSTR-2B in Phase 8?*\\
   *Answer:* It provides an inviolable, auto-drafted statement of eligible Input Tax Credit uploaded by suppliers, ensuring compliance with Section 16(2)(aa).
4. *How is inter-godown transfer recorded in Tally Prime?*\\
   *Answer:* Via the Stock Journal voucher (Alt+F7), specifying the Source Godown on the left and the Destination Godown on the right.
5. *Why is TDS Receivable categorized under Current Assets on the Balance Sheet?*\\
   *Answer:* Because it represents advance tax withheld by clients that will be offset against the company's corporate tax liability when filing ITR-6.

#v(6pt)
"""

if "== C.8 Phase 7" not in text:
    text = text.replace("== C.8 Capstone Assessment & Viva", capstone_extra + "\n== C.11 Capstone Assessment & Viva")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(text)

print(f"Updated {filepath} ({os.path.getsize(filepath)} bytes)")
