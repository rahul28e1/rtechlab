# -*- coding: utf-8 -*-
"""
Upgrade intro_block in build_all_tally_assets.py to 3 structured pages for EN, HI, GU
"""
import os

filepath = r"c:\Users\Rahul\Videos\My projects\RtechLab\scripts\build_all_tally_assets.py"
with open(filepath, "r", encoding="utf-8") as f:
    text = f.read()

# 1. English intro block
eng_intro = '''        intro_block = """
= Course Architecture & Academic Framework

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1.2pt + rgb("#0E7490"),
  radius: 4pt,
  inset: 10pt,
  [
    #text(weight: "black", size: 9pt, fill: rgb("#0E7490"))[OFFICIAL RTECHLAB & IANT INSTITUTIONAL ACCREDITATION:]\\
    #v(3pt)
    #text(size: 8pt, fill: rgb("#334155"))[
      This master publication represents the standardized commercial curriculum developed by Rahul Patel (Lead Corporate Accounting Trainer at IANT Palanpur and Founder of RTechLab). Bridging the critical chasm between conventional classroom theory and real-world corporate accounting practice, this syllabus prepares accounting students, CA articles, and working professionals for high-velocity corporate roles.
    ]
  ]
)

#v(8pt)

== Institutional Mission & Pedagogical Standards
Every chapter, transaction, and statutory case study in this handbook adheres to three uncompromising institutional benchmarks:
1. *100% Statutory Alignment:* Formatted strictly according to Central Goods and Services Tax Act 2017 (CGST Rule 46), Income Tax Act 1961 (Sections 194C, 194J, 194I, 194H), and MCA Audit Trail mandates.
2. *Real-World Commercial Fidelity:* Zero artificial placeholders. Every invoice, GSTIN, PAN, and bank voucher replicates live Indian corporate accounting operations across Gujarat, Maharashtra, and Karnataka.
3. *Zero-Mouse Keyboard Proficiency:* Students are trained to operate Tally Prime exclusively via high-speed keyboard shortcuts, achieving 3x to 5x higher workplace productivity.

#v(10pt)

== National Statutory Accounting Regulatory Alignment
#table(
  columns: (1.2fr, 1.3fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Regulatory Body]], [#text(weight: "bold", fill: white)[Governing Legislation]], [#text(weight: "bold", fill: white)[Curriculum Integration & Practical Impact]],
  [GST Council & CBIC], [CGST / SGST / IGST Acts 2017], [Rule 46 Tax Invoices, Section 16(2)(aa) GSTR-2B matching, E-Way bills, and E-Invoicing.],
  [CBDT / Income Tax], [Income Tax Act, 1961], [TDS withholding under 194C/J/I, Form 26Q quarterly returns, Section 206AA penal rates.],
  [Ministry of Corporate Affairs], [Companies Act, 2013], [Audit Trail (Edit Log) rule, Schedule III vertical balance sheets, and depreciation schedules.],
  [Institute of Chartered Accountants], [Indian Accounting Standards (Ind AS)], [Luca Pacioli double-entry rules, accrual concepts, and valuation of closing stock (NRV).]
)

#pagebreak()

= The 11-Topic Curriculum Roadmap & Competency Matrix

#table(
  columns: (0.7fr, 1.8fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Topic]], [#text(weight: "bold", fill: white)[Curriculum Domain]], [#text(weight: "bold", fill: white)[Core Practical Learning Outcomes]],
  [Topic 01], [History of Tally & Licensing], [Bharat Goenka, 80% market share, download from tallysolutions.com, Silver/Gold/Edu mode, TGS LAN.],
  [Topic 02], [What is Tally Prime & Architecture], [Cactus in-memory DB, Top menu (Alt+K/Y/Z/O/E/M/P), Go To (Alt+G) multi-tasking, 4 GOT quadrants.],
  [Topic 03], [Comprehensive GST & TDS Foundation], [CGST+SGST vs IGST, 0% Exempt, 5% Essentials, 18% Standard slabs, Sec 194C/J/I/H, Form 26Q schedule.],
  [Topic 04], [Ledgers, Accounts & Golden Rules], [Personal, Real & Nominal accounts, Luca Pacioli rules, Mr. Verma 50-transaction workflow, 20 cash entries.],
  [Topic 05], [Vouchers & 4 Main Categories], [Accounting, Inventory, Order & Memo categories, 24 vouchers with shortcuts, Edit Log audit trail.],
  [Topic 06], [Groups & Complete Ledger Mapping], [15 Primary + 13 Secondary groups, 70+ real account mappings (Salman, HDFC, Taxes), Trial Balance audit.],
  [Topic 07], [Company & Step-by-Step Creation], [Company creation, Gujarat Code 24, FY beginning, Tally Vault AES encryption, 5 practical companies.],
  [Topic 08], [Types of Business Organizations], [Trading concerns (Unjha Mandi), Manufacturing with BOM (Morbi Ceramics), Service providers, E-commerce.],
  [Topic 09], [Practical Commercial Invoices], [6 authentic invoices rendered: Purchase Exempt, GST 18%, Interstate IGST, Sales GST, Sales IGST, Services.],
  [Topic 10], [Master Keyboard Shortcuts (50+)], [General navigation, master alteration, voucher shortcuts, report generation, and 30-second speed runs.],
  [Topic 11], [Corporate Bridge Highlights], [GST portal returns (GSTR-1/3B/2B), BRS bank reconciliation, CTS-2010 cheque, Cost Centres, Data Split.]
)

#v(8pt)

== Professional Competency Assessment Standards
Students completing this curriculum are evaluated on a 4-tier grading scale:
- *Distinction (> 90%):* Demonstrates instant zero-mouse shortcut fluency, flawless GSTR-2B reconciliation, and complete mastery of BOM manufacturing.
- *First Class (75% - 89%):* Accurately passes all 6 voucher types, creates error-free multi-state GST invoices, and resolves Trial Balance variances.
- *Corporate Pass (60% - 74%):* Successfully records basic cash/bank vouchers, generates Day Book reports, and explains the 3 Golden Rules.
"""'''

# Replace intro_block in text
idx1 = text.find('intro_block = """\n= Course Architecture & 11-Topic Curriculum Roadmap')
if idx1 != -1:
    idx2 = text.find('elif lang == "hi":')
    text = text[:idx1] + eng_intro + "\n    " + text[idx2:]
    print("Replaced English intro block successfully!")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(text)

print("Updated build_all_tally_assets.py successfully!")
