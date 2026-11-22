# -*- coding: utf-8 -*-
"""
Expand Part 2 & Part 3 for Tally Prime Master Curriculum
"""
import os

SCRIPTS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\scripts"

# =========================================================================
# 1. Expand Part 2 (Topics 5, 6, 7)
# =========================================================================
part2_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part2.py")
with open(part2_file, "r", encoding="utf-8") as f:
    p2 = f.read()

s5_extra = """
== 5.7 The 10 Golden Rules of Voucher Alteration & Audit Trail (Edit Log)
Under statutory corporate governance rules mandated by the Ministry of Corporate Affairs (MCA), Indian companies must maintain computerized accounting software equipped with an inviolable *Audit Trail (Edit Log)* feature:
1. *Immutable Audit Trail:* Tally Prime Edit Log records every voucher creation, modification, and deletion with user identity, timestamp, and field-level change history.
2. *Zero Disablement:* Once enabled, the Edit Log cannot be disabled or tampered with by any administrator.
3. *Voucher Class Automation:* To eliminate data entry errors, accountants configure *Voucher Classes* in Sales and Purchase vouchers. A Voucher Class pre-defines the Sales Ledger, Input/Output Tax Ledgers, and automated Round-Off, allowing operators to enter only stock items while Tally calculates statutory taxes automatically!

#v(6pt)
"""

if "== 5.7 The 10 Golden Rules" not in p2:
    p2 = p2.replace("== 5.7 Summary & Key Revision Takeaways", s5_extra + "\n== 5.8 Summary & Key Revision Takeaways")
    p2 = p2.replace("== 5.8 High-Yield Exam", "== 5.9 High-Yield Exam")
    p2 = p2.replace("== 5.9 Practical Viva", "== 5.10 Practical Viva")

s6_extra = """
== 6.6 The Chart of Accounts Architecture & Custom Sub-Group Design
In multi-branch corporate enterprises, creating custom sub-groups under Tally's 28 predefined groups is essential for executive reporting:
- *Custom Debtors Groups:* Create *North Gujarat Debtors*, *South Gujarat Debtors*, and *Export Debtors* under parent *Sundry Debtors*. This allows sales managers to view region-wise outstanding debt instantly!
- *Custom Creditors Groups:* Create *Raw Material Suppliers* and *Service Providers* under parent *Sundry Creditors*.
- *Custom Expense Groups:* Create *Administrative Expenses* and *Selling & Distribution Expenses* under parent *Indirect Expenses* to analyze departmental cost run-rates.

#v(6pt)
"""

if "== 6.6 The Chart of Accounts" not in p2:
    p2 = p2.replace("== 6.6 Summary & Key Revision Takeaways", s6_extra + "\n== 6.7 Summary & Key Revision Takeaways")
    p2 = p2.replace("== 6.7 High-Yield Exam", "== 6.8 High-Yield Exam")
    p2 = p2.replace("== 6.8 Practical Viva", "== 6.9 Practical Viva")

s7_extra = """
== 7.6 Corporate Multi-Company Management & Group Company Creation
Large commercial conglomerates often manage multiple distinct legal entities (e.g., a manufacturing company and a trading subsidiary). Tally Prime provides *Group Company* functionality:
1. *Select Multi-Companies:* Load all individual child companies into Tally Prime memory.
2. *Create Group Company:* Press #key-pill("Alt + K") > *Create Group Company*. Select the child companies (e.g., `Ravi Private Limited` + `Jaimin Corporation`).
3. *Consolidated Reporting:* Tally automatically generates a single *Consolidated Balance Sheet* and *Consolidated Profit & Loss Account*, aggregating revenues, assets, and liabilities across all child entities with zero manual spreadsheet work!

#v(6pt)

== 7.7 Company Data Security & Backup Disaster Recovery Protocol
1. *Automated Daily Backups:* Press #key-pill("Alt + Y") > *Backup*. Designate an external hard drive or secure network NAS share. Tally packages company records into compressed `.tbk` archive files.
2. *Disaster Recovery Restore:* If a hard disk fails, reinstall Tally Prime, press #key-pill("Alt + Y") > *Restore*, specify the backup directory, and restore the company folder.
3. *Never Overwrite Live Data:* When testing historical scenarios, restore backups into a separate custom directory to prevent overwriting active operations!

#v(6pt)
"""

if "== 7.6 Corporate Multi-Company" not in p2:
    p2 = p2.replace("== 7.6 Summary & Key Revision Takeaways", s7_extra + "\n== 7.8 Summary & Key Revision Takeaways")
    p2 = p2.replace("== 7.7 High-Yield Exam", "== 7.9 High-Yield Exam")
    p2 = p2.replace("== 7.8 Practical Viva", "== 7.10 Practical Viva")

with open(part2_file, "w", encoding="utf-8") as f:
    f.write(p2)
print(f"Updated {part2_file} ({os.path.getsize(part2_file)} bytes)")

# =========================================================================
# 2. Expand Part 3 (Topics 8, 9, 10, 11)
# =========================================================================
part3_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part3.py")
with open(part3_file, "r", encoding="utf-8") as f:
    p3 = f.read()

s8_extra = """
== 8.6 Detailed Cost Sheet & Breakeven Analysis for Manufacturing Units
In manufacturing accounting, the production cost lifecycle follows a rigorous multi-stage hierarchy:
1. *Prime Cost:* Raw Materials Consumed + Direct Factory Wages + Direct Manufacturing Expenses.
2. *Factory / Works Cost:* Prime Cost + Factory Overheads (power, machinery maintenance, supervisor salaries).
3. *Cost of Production:* Works Cost + Administrative Office Overheads.
4. *Total Cost of Sales:* Cost of Production + Selling and Distribution Overheads (freight outward, advertising).
5. *Profit:* Net Invoiced Sales Revenue minus Total Cost of Sales.

#v(6pt)
"""

if "== 8.6 Detailed Cost Sheet" not in p3:
    p3 = p3.replace("== 8.6 Summary & Key Revision Takeaways", s8_extra + "\n== 8.7 Summary & Key Revision Takeaways")
    p3 = p3.replace("== 8.7 High-Yield Exam", "== 8.8 High-Yield Exam")
    p3 = p3.replace("== 8.8 Practical Viva", "== 8.9 Practical Viva")

s9_extra = """
== 9.4 Automated Round-Off Ledger Configuration in Invoices
In commercial invoicing, statutory tax calculations frequently yield fractional paise amounts (e.g., ₹81,420.38). Corporate standards dictate rounding total invoices to the nearest whole rupee:
- *Round-Off Ledger Creation:* Create ledger *Round Off* under group *Indirect Expenses*.
- *Type of Ledger:* Select *Invoice Rounding* with *Normal Rounding* and rounding limit set to `1.00`.
- *Automated Execution:* When selected at the bottom of the invoice, Tally Prime automatically detects whether to add or subtract the fractional difference (e.g., subtracting ₹0.38 or adding ₹0.12), ensuring invoice totals match banking payment portals down to the exact rupee!

#v(6pt)
"""

if "== 9.4 Automated Round-Off" not in p3:
    p3 = p3.replace("== 9.4 Summary & Key Revision Takeaways", s9_extra + "\n== 9.5 Summary & Key Revision Takeaways")
    p3 = p3.replace("== 9.5 High-Yield Exam", "== 9.6 High-Yield Exam")
    p3 = p3.replace("== 9.6 Practical Viva", "== 9.7 Practical Viva")

s10_extra = """
== 10.4 Senior Accountant Secret Power Shortcuts
Beyond basic navigation, senior accounting professionals leverage advanced keyboard combinations:
- #key-pill("Ctrl + Alt + B") *(Basis of Values):* Alters reporting parameters on the fly (e.g., viewing P&L on cash basis vs accrual basis, or toggling stock valuation from FIFO to Average Cost).
- #key-pill("Ctrl + Alt + H") *(Change View):* Switches report layouts instantly (e.g., viewing monthly ledger summary, daily movement, or quarterly column views).
- #key-pill("Ctrl + J") *(Exception Reports):* Highlights anomalies such as negative stock balances, overdue customer bills, unallocated vouchers, and mismatched GSTINs.
- #key-pill("Alt + V") *(Master View):* Quickly verifies underlying ledger attributes without leaving statutory report screens.

#v(6pt)
"""

if "== 10.4 Senior Accountant Secret" not in p3:
    p3 = p3.replace("== 10.4 Summary & Key Revision Takeaways", s10_extra + "\n== 10.5 Summary & Key Revision Takeaways")
    p3 = p3.replace("== 10.5 High-Yield Exam", "== 10.6 High-Yield Exam")
    p3 = p3.replace("== 10.6 Practical Viva", "== 10.7 Practical Viva")

s11_extra = """
== 11.6 Comprehensive GST Annual Return (GSTR-9) & Reconciliation (GSTR-9C)
At the end of each financial year, regular registered corporate taxpayers must perform annual statutory reconciliation:
1. *GSTR-9 (Annual Return):* Aggregates outward supplies, inward procurement, taxes paid, and ITC claimed across all 12 monthly GSTR-3B and GSTR-1 returns filed during the financial year.
2. *GSTR-9C (Reconciliation Statement):* A statutory reconciliation between the audited commercial financial statements (Balance Sheet & P&L certified by a Chartered Accountant) and the GST Portal returns.
3. *Section 16(4) Statutory Deadline:* ITC pertaining to any invoice of a financial year must be claimed on or before 30th November following the end of the financial year. Any unclaimed ITC lapses permanently after this cutoff date!

#v(6pt)
"""

if "== 11.6 Comprehensive GST Annual" not in p3:
    p3 = p3.replace("== 11.6 Summary & Key Revision Takeaways", s11_extra + "\n== 11.7 Summary & Key Revision Takeaways")
    p3 = p3.replace("== 11.7 High-Yield Exam", "== 11.8 High-Yield Exam")
    p3 = p3.replace("== 11.8 Practical Viva", "== 11.9 Practical Viva")

with open(part3_file, "w", encoding="utf-8") as f:
    f.write(p3)
print(f"Updated {part3_file} ({os.path.getsize(part3_file)} bytes)")
