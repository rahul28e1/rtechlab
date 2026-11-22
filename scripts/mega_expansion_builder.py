# -*- coding: utf-8 -*-
"""
Mega Content Expander: Brings English Curriculum to 54-56 Pages
Standardized by Rahul Patel (Founder, RTechLab / IANT Palanpur)
"""
import os
import re

SCRIPTS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\scripts"

# 1. Expand Part 1 (Topics 1 to 4)
part1_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part1.py")
with open(part1_file, "r", encoding="utf-8") as f:
    p1 = f.read()

# Section 1 additions
s1_extra = """
== 1.7 Chronological Feature Evolution Matrix from Peutronics 1986 to Tally Prime 5.0
#table(
  columns: (1fr, 0.8fr, 1.2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Tally Edition]], [#text(weight: "bold", fill: white)[Release Year]], [#text(weight: "bold", fill: white)[Operating System]], [#text(weight: "bold", fill: white)[Milestone Capabilities & Architectural Leaps]],
  [The Accountant], [1986], [MS-DOS 3.3], [First codeless accounting software developed by Bharat Goenka in Bangalore.],
  [Tally 4.5], [1992], [MS-DOS], [Financial accounting engine with basic stock inventory; widely adopted by Indian traders.],
  [Tally 5.4], [1996], [Windows 95/NT], [Transition from DOS to native 32-bit graphical Windows interface; automated trial balance.],
  [Tally 6.3], [2001], [Windows 98/2000], [Introduction of Indian Value Added Tax (VAT), multi-currency, and ODBC connectivity.],
  [Tally 7.2], [2005], [Windows XP], [Integrated statutory compliance for state-level VAT across all Indian states and Union Territories.],
  [Tally 8.1], [2006], [Windows XP/Vista], [Multi-lingual user interface with 10 Indian regional languages and POS billing.],
  [Tally 9.0], [2006], [Windows XP/7], [Integrated ERP capabilities: Payroll processing, TDS, FBT, and multi-cost centre budgeting.],
  [Tally.ERP 9], [2009], [Windows 7/8/10], [Remote access, Tally.NET, banking automation, and comprehensive GST support in 2017.],
  [Tally Prime 1.0], [2020], [Windows 64-bit], [Complete modern UI redesign, Go To (Alt+G) multi-tasking, top navigation bar.],
  [Tally Prime 2.0-3.0], [2021-2023], [Windows 10/11], [WhatsApp integration, connected e-invoicing and e-way bill generation, multi-GSTIN.],
  [Tally Prime 4.x-5.x], [2024-2027], [Windows 11 / Server], [Connected banking APIs, instantaneous payment reconciliation, and modern audit trail.]
)

#v(6pt)

== 1.8 Enterprise Multi-User LAN Deployment with Tally Gateway Server (TGS)
In corporate enterprises where dozens of accounts executives, billing operators, and storekeepers work simultaneously, Tally Prime Gold operates via a client-server architecture powered by the *Tally Gateway Server (TGS)*:
1. *Dedicated License Server:* One host machine on the local area network (LAN) acts as the License Server, running the TGS service bound to TCP port `9000`.
2. *Static IP Binding:* The server is assigned a dedicated static private IP address (e.g., `192.168.1.100`), ensuring uninterrupted connectivity for client workstations.
3. *Client Configuration:* Workstations install Tally Prime and select *Select Existing License > Connect to Tally Gateway Server*, specifying the server IP and port `9000`.
4. *Data Centralization:* The shared company database resides in a shared network folder with strict Windows NTFS read/write permissions, preventing unauthorized file manipulation while permitting multi-user concurrent access.

#v(6pt)
"""

if "== 1.7 Chronological" not in p1:
    p1 = p1.replace("== Topic 01: High-Yield Exam & Interview MCQs", s1_extra + "\n== Topic 01: High-Yield Exam & Interview MCQs")

# Section 2 additions
s2_extra = """
== 2.6 The 4 Operational Quadrants of the Gateway of Tally
The Gateway of Tally (GOT) is the central command console of Tally Prime. It is divided into 4 primary operational quadrants:

#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Quadrant]], [#text(weight: "bold", fill: white)[Menu Options]], [#text(weight: "bold", fill: white)[Operational Capabilities & Business Function]],
  [1. Masters], [Create, Alter, Chart of Accounts], [Create and modify foundational accounting accounts (Ledgers, Groups), inventory items (Stock Items, Units, Godowns, Categories), statutory tax rates, and payroll heads.],
  [2. Transactions], [Vouchers, Day Book], [Record daily commercial operations (Sales, Purchase, Payment, Receipt, Contra, Journal). Day Book displays all daily chronological vouchers with drill-down audit capability.],
  [3. Utilities], [Banking], [Access Cheque Printing, Cheque Register, Post-Dated Cheque Management, Bank Reconciliation Statement (BRS), and Deposit Slips.],
  [4. Reports], [Balance Sheet, P&L, Stock Summary, Ratio Analysis], [Generate executive statutory financial statements: Balance Sheet (financial position), Profit & Loss Account (operating net income), Stock Summary (inventory valuation), and Ratio Analysis (liquidity and solvency).]
)

#v(6pt)

== 2.7 Global F12 Configuration vs Company-Wide F11 Features Architecture
Understanding the fundamental boundary between F11 and F12 is a hallmark of an advanced corporate accountant:
- *F11 Company Features (Company Level):* System-wide operational switches enabled per company. For example, enabling GST, enabling TDS, activating multi-currency, or activating Cost Centres. Once enabled in F11, the feature becomes accessible across all vouchers and masters.
- *F12 Configurations (Screen Level):* Context-specific user interface preferences that alter how a specific screen behaves. For example, configuring whether to provide supplier invoice numbers, show ledger current balances, or display buyer contact details during voucher entry. Pressing F12 on the Balance Sheet shows Balance Sheet options; pressing F12 in Sales Voucher shows Sales Invoice options!

#v(6pt)
"""

if "== 2.6 The 4 Operational Quadrants" not in p1:
    p1 = p1.replace("== Topic 02: High-Yield Exam & Interview MCQs", s2_extra + "\n== Topic 02: High-Yield Exam & Interview MCQs")

# Section 3 additions
s3_extra = """
== 3.6 Statutory Input Tax Credit (ITC) Rules under Section 16 & Blocked ITC (Sec 17(5))
Input Tax Credit (ITC) is the core mechanism that prevents cascading taxation under GST. However, claiming ITC is subject to strict statutory preconditions:

#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Statutory Dimension]], [#text(weight: "bold", fill: white)[Legal Precondition under CGST Act, 2017]],
  [Possession of Tax Invoice], [The buyer must possess a valid legal Tax Invoice, Debit Note, or Bill of Entry issued by an approved registered supplier under Rule 46.],
  [Physical Receipt of Goods], [Goods or services must have been physically received. In "Bill To - Ship To" scenarios, receipt by the designated third party qualifies.],
  [Tax Actually Paid to Government], [The supplier must have deposited the collected tax with the Government via cash or eligible ITC in their monthly GSTR-3B return.],
  [GSTR-2B Matching (Sec 16(2)(aa))], [ITC is strictly restricted to invoices uploaded by the supplier in GSTR-1 and appearing in the buyer's auto-drafted GSTR-2B statement.],
  [Blocked ITC under Section 17(5)], [ITC is permanently prohibited on: Motor vehicles for transport of persons (seating <= 13), Food & beverages, Outdoor catering, Health insurance, Membership of clubs, Personal gifts/free samples, and Goods lost, stolen, or destroyed!]
)

#v(6pt)

== 3.7 GST Invoicing Compliance: E-Way Bills & E-Invoicing Thresholds
1. *E-Way Bill (Rule 138):* Mandatory electronic consignment note generated on the e-way bill portal for any movement of goods whose consignment value exceeds *₹50,000* (Interstate or Intrastate in Gujarat). Contains Part A (Consignor/Consignee GSTIN, HSN, Value) and Part B (Vehicle number, Transporter ID).
2. *E-Invoicing (Rule 48(4)):* Mandatory for businesses with aggregate annual turnover exceeding *₹5 Crores* in any preceding financial year. Invoices must be reported to the Invoice Registration Portal (IRP), which authenticates the payload and generates a 64-character *Invoice Reference Number (IRN)* and a cryptographically signed *QR Code* printed on the invoice!

#v(6pt)
"""

if "== 3.6 Statutory Input Tax Credit" not in p1:
    p1 = p1.replace("== Topic 03: High-Yield Exam & Interview MCQs", s3_extra + "\n== Topic 03: High-Yield Exam & Interview MCQs")

with open(part1_file, "w", encoding="utf-8") as f:
    f.write(p1)

print(f"Updated {part1_file} ({os.path.getsize(part1_file)} bytes)")
