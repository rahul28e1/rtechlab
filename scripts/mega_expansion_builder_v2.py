# -*- coding: utf-8 -*-
"""
Mega Expansion Builder V2: Deepens all 11 topics to hit 52-56 pages
Standardized by Rahul Patel (Founder, RTechLab / IANT Palanpur)
Direct Contact: rahul.28e1@gmail.com
"""
import os

SCRIPTS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\scripts"

# =========================================================================
# PART 1: TOPICS 1 TO 4
# =========================================================================
part1_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part1.py")
with open(part1_file, "r", encoding="utf-8") as f:
    p1 = f.read()

ch1_add = """
== 1.9 Enterprise Comparison: Tally Silver vs Tally Gold vs Tally Prime Server
Corporate organizations choose their licensing tier based on network concurrency and multi-user data volume:

#table(
  columns: (1fr, 1.3fr, 1.3fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Capability]], [#text(weight: "bold", fill: white)[Tally Silver (Single User)]], [#text(weight: "bold", fill: white)[Tally Gold (Multi User)]], [#text(weight: "bold", fill: white)[Tally Prime Server]],
  [Concurrent Users], [1 User on 1 Machine], [Unlimited Users across LAN], [Dozens of high-speed concurrent users with dedicated server thread.],
  [Target Business], [Micro firms, solo accountants, traders.], [SMEs, CA firms, multi-branch stores.], [Large corporations, factories, retail chains.],
  [Database Throughput], [Standard desktop database engine.], [Standard shared LAN database.], [Enterprise-grade server with multi-threaded parallel queue.],
  [User Access Security], [Basic login password.], [Security Control with user roles.], [Advanced user activity monitoring and process isolation.],
  [Crash Resilience], [Standard desktop crash recovery.], [Network shared cache recovery.], [Zero downtime; isolated crash prevents server interruption.]
)

#v(6pt)
"""

ch2_add = """
== 2.8 Tally Prime Data Directory Architecture & File Structure
Inside the corporate data folder (e.g., `C:\\TallyPrime\\Data\\10000`), Tally Prime maintains its proprietary database structure:
- `Company.900`: Encrypted master metadata storing company name, fiscal calendar, currency, and security state.
- `Trans.900`: Core chronological transaction journal containing all voucher records and double-entry postings.
- `Manager.900`: Internal indexing file managing pointer arrays for rapid zero-latency search queries.
- `Audit.900`: Immutable statutory Edit Log tracking all voucher creations, modifications, and user timestamps.

#v(6pt)
"""

ch3_add = """
== 3.8 Comprehensive GST Statutory Return Filing Architecture
Under Indian GST compliance, regular taxpayers must adhere to a strict statutory filing calendar:

#table(
  columns: (0.9fr, 1.3fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Return Form]], [#text(weight: "bold", fill: white)[Statutory Due Date]], [#text(weight: "bold", fill: white)[Statutory Scope & Legal Purpose]],
  [GSTR-1], [11th of subsequent month], [Statement of Outward Supplies (B2B, B2C, Exports, HSN Summary). Populates buyer GSTR-2B.],
  [GSTR-3B], [20th of subsequent month], [Monthly self-assessed summary return, payment of tax liability, and claiming eligible ITC.],
  [GSTR-2B], [14th of subsequent month], [Static auto-generated ITC statement. 100% of claimed ITC must be reflected here.],
  [GSTR-4], [30th April following FY], [Annual return for Composition Scheme dealers (opted under Section 10).],
  [GSTR-7], [10th of subsequent month], [Return for authorities deducting TDS under GST Section 51 (2% deduction).],
  [GSTR-8], [10th of subsequent month], [Statement for E-Commerce operators collecting TCS under GST Section 52 (0.5% or 1%).],
  [GSTR-9], [31st December following FY], [Annual comprehensive reconciliation return for all regular registered taxpayers.],
  [GSTR-9C], [31st December following FY], [Statutory reconciliation statement certified by CA/CMA for turnover exceeding ₹5 Crores.]
)

#v(6pt)
"""

if "== 1.9 Enterprise Comparison" not in p1:
    p1 = p1.replace("== Topic 01: High-Yield Exam", ch1_add + "\n== Topic 01: High-Yield Exam")

if "== 2.8 Tally Prime Data" not in p1:
    p1 = p1.replace("== Topic 02: High-Yield Exam", ch2_add + "\n== Topic 02: High-Yield Exam")

if "== 3.8 Comprehensive GST" not in p1:
    p1 = p1.replace("== Topic 03: High-Yield Exam", ch3_add + "\n== Topic 03: High-Yield Exam")

with open(part1_file, "w", encoding="utf-8") as f:
    f.write(p1)
print(f"Expanded Part 1: {os.path.getsize(part1_file)} bytes")

# =========================================================================
# PART 2: TOPICS 5 TO 7
# =========================================================================
part2_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part2.py")
with open(part2_file, "r", encoding="utf-8") as f:
    p2 = f.read()

ch5_add = """
== 5.8 Advanced Voucher Scenarios: Compound Invoicing with Trade & Cash Discounts
In corporate trading, transactions often combine commercial trade discounts and cash discounts:
- *Commercial Scenario:* Sold 20 Pcs Samsung Monitors @ ₹6,500 = ₹1,30,000. Allowed 5% Trade Discount on invoice face (Taxable Value = ₹1,23,500). Charged 18% GST (CGST ₹11,115 + SGST ₹11,115 = ₹1,45,730). Offered 2% Cash Discount if paid within 7 days.
- *Cash Receipt within 7 Days:* Customer pays via NEFT. Cash Discount of 2% on taxable value (₹2,470) is granted via Credit Note or Journal Voucher, and net cash of ₹1,43,260 is debited in Receipt (F6).

#v(6pt)
"""

ch6_add = """
== 6.7 Comprehensive Corporate Balance Sheet & P&L Group Classification Matrix
Mastering these advanced group classifications guarantees success in senior corporate accounting interviews:

#table(
  columns: (1.5fr, 1.5fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Complex Corporate Account]], [#text(weight: "bold", fill: white)[Correct Tally Prime Group]], [#text(weight: "bold", fill: white)[Statement]],
  [Capital Work-in-Progress (CWIP)], [Fixed Assets], [Balance Sheet],
  [Preliminary Incorporation Expenses], [Misc. Expenses (Asset)], [Balance Sheet],
  [Provision for Income Tax], [Provisions / Current Liab], [Balance Sheet],
  [Proposed Dividend A/c], [Provisions / Current Liab], [Balance Sheet],
  [Bills Receivable A/c], [Current Assets], [Balance Sheet],
  [Bills Payable A/c], [Current Liabilities], [Balance Sheet],
  [Unearned Advance Consulting Revenue], [Current Liabilities], [Balance Sheet],
  [Prepaid Fire Insurance Premium], [Current Assets], [Balance Sheet],
  [Inter-Company Current Account], [Branch / Divisions], [Balance Sheet],
  [Security Deposit with Electricity Board], [Deposits (Asset)], [Balance Sheet]
)

#v(6pt)
"""

ch7_add = """
== 7.7 Tally Vault AES Encryption & Lost Password Protocol
Tally Vault utilizes standard Advanced Encryption Standard (AES) with a 128-bit key. 
- *Database Transformation:* When Tally Vault is enabled, company data files (`Company.900`, `Trans.900`) are encrypted at the sector level. File names are obfuscated, and the company name in the Tally directory is replaced with a unique 5-digit ID (e.g., `10008`).
- *Security Mandate:* Because Tally Solutions maintains a zero-knowledge architecture, no master backdoors exist. If an administrator loses a Tally Vault password, the database is permanently rendered unreadable. Always document vault keys in secure corporate key-management vaults!

#v(6pt)
"""

if "== 5.8 Advanced Voucher Scenarios" not in p2:
    p2 = p2.replace("== 5.8 Summary & Key Revision Takeaways", ch5_add + "\n== 5.9 Summary & Key Revision Takeaways")
    p2 = p2.replace("== 5.9 High-Yield Exam", "== 5.10 High-Yield Exam")
    p2 = p2.replace("== 5.10 Practical Viva", "== 5.11 Practical Viva")

if "== 6.7 Comprehensive Corporate" not in p2:
    p2 = p2.replace("== 6.7 Summary & Key Revision Takeaways", ch6_add + "\n== 6.8 Summary & Key Revision Takeaways")
    p2 = p2.replace("== 6.8 High-Yield Exam", "== 6.9 High-Yield Exam")
    p2 = p2.replace("== 6.9 Practical Viva", "== 6.10 Practical Viva")

if "== 7.7 Tally Vault AES Encryption" not in p2:
    p2 = p2.replace("== 7.8 Summary & Key Revision Takeaways", ch7_add + "\n== 7.9 Summary & Key Revision Takeaways")
    p2 = p2.replace("== 7.9 High-Yield Exam", "== 7.10 High-Yield Exam")
    p2 = p2.replace("== 7.10 Practical Viva", "== 7.11 Practical Viva")

with open(part2_file, "w", encoding="utf-8") as f:
    f.write(p2)
print(f"Expanded Part 2: {os.path.getsize(part2_file)} bytes")

# =========================================================================
# PART 3: TOPICS 8 TO 11
# =========================================================================
part3_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part3.py")
with open(part3_file, "r", encoding="utf-8") as f:
    p3 = f.read()

ch8_add = """
== 8.7 Corporate Case Study 4: E-Commerce Marketplace Vendor (TCS Sec 52)
*Enterprise Profile:* Palanpur Handicrafts & Textiles selling via Amazon / Flipkart.
- *Commercial Mechanism:* Goods sold to customers nationwide. E-commerce operator collects customer funds, deducts *TCS (Tax Collected at Source) @ 1% under GST Section 52*, deducts marketplace commission @ 15% + 18% GST, and remits net funds.
- *Tally Prime Accounting Workflow:*
  1. Record Sales Voucher (F8) to customer with Interstate IGST or Intrastate CGST/SGST.
  2. Debit *TCS Receivable under GST A/c* (Current Asset) for 1% withheld by Amazon.
  3. Debit *Marketplace Commission Expense A/c* and *Input GST A/c* via Purchase Voucher (F9).
  4. Reconcile net bank remittances in Receipt Voucher (F6) against monthly marketplace settlement statements.

#v(6pt)
"""

ch9_add = """
== 9.5 Practical Lab Dataset: 10 Student Invoicing Exercises
Enter the following 10 commercial invoicing scenarios into Tally Prime, verifying automated GST calculation and tax splits:
1. *Local Purchase 5% GST:* Procured 50 bags Cattle Feed @ ₹800 from Banas Dairy Co-op (HSN `2309`, CGST 2.5%, SGST 2.5%).
2. *Local Sales 5% GST:* Sold 20 bags Cattle Feed @ ₹1,100 to Palanpur Dairy Farm (Inv \#SAL-010).
3. *Interstate Purchase 12% GST:* Procured 10 units Computer Printers @ ₹14,000 from Pune Hardware Ltd (Maharashtra, HSN `8443`, IGST 12%).
4. *Interstate Sales 12% GST:* Sold 4 units Computer Printers @ ₹19,500 to Mount Abu Resort (Rajasthan, IGST 12%).
5. *Local Purchase 28% GST:* Procured 2 units Daikin 1.5 Ton Split AC @ ₹38,000 from Ahmedabad Distributors (HSN `8415`, CGST 14%, SGST 14%).
6. *Capital Goods Invoicing:* Capitalized Daikin ACs under *Office Equipment (Fixed Assets)* with 100% ITC eligibility.
7. *Export Sales (LUT / Zero Rated):* Exported 500 handloom shawls @ \$30 to London Fashion LLC under Letter of Undertaking (LUT) with 0% IGST.
8. *Purchase from Unregistered Dealer (URD):* Purchased office broom and mop sets ₹1,200 from local street vendor (Exempt from RCM under Section 9(4)).
9. *Debit Note for Rate Difference:* Supplier overcharged ₹500 per printer; issued Debit Note (Alt+F5) for ₹2,000 + 12% IGST.
10. *Credit Note for Damage Allowance:* Granted ₹3,000 damage discount to Mount Abu Resort via Credit Note (Alt+F6) with 12% IGST reversal.

#v(6pt)
"""

ch10_add = """
== 10.5 Senior Audit & Verification Keyboard Shortcuts
During statutory CA audits, senior accountants rely on specialized audit shortcuts:
- #key-pill("Alt + J") *(Statutory Audit Analysis):* Toggles audit status of vouchers (On Hold, Clarified, Verified).
- #key-pill("Alt + 2") *(Duplicate Voucher):* Instantly creates an exact duplicate of the highlighted voucher for rapid recurring monthly entries!
- #key-pill("Alt + A") *(Add Voucher):* Inserts a new voucher into the Day Book at the exact chronological date position.
- #key-pill("Alt + I") *(Insert Voucher):* Inserts a voucher between two existing voucher numbers.
- #key-pill("Ctrl + Alt + R") *(Rewrite Data):* Initiates database rewrite to repair corrupted indexes.

#v(6pt)
"""

ch11_add = """
== 11.7 Corporate GST Audit & Litigation Defense Protocol
In modern corporate practice, tax authorities issue automated electronic notices (Form ASMT-10) for discrepancies between returns:
1. *GSTR-3B vs GSTR-1 Discrepancy:* Outward tax declared in 3B is less than sales reported in GSTR-1. Reconcile monthly using Tally Prime's *GST Return Analysis*.
2. *GSTR-3B vs GSTR-2B Discrepancy:* ITC claimed in 3B exceeds eligible ITC reflected in GSTR-2B. Under Section 16(2)(aa), excess ITC must be reversed in Table 4(B)(2) with 18% penal interest under Section 50.
3. *DRC-03 Voluntary Settlement:* Any tax shortfall or interest liability is voluntarily settled on the GST Portal using Form DRC-03 and recorded in Tally Prime via Payment Voucher (F5) with GST Payment type *Voluntary*.

#v(6pt)
"""

if "== 8.7 Corporate Case Study 4" not in p3:
    p3 = p3.replace("== 8.7 Summary & Key Revision Takeaways", ch8_add + "\n== 8.8 Summary & Key Revision Takeaways")
    p3 = p3.replace("== 8.8 High-Yield Exam", "== 8.9 High-Yield Exam")
    p3 = p3.replace("== 8.9 Practical Viva", "== 8.10 Practical Viva")

if "== 9.5 Practical Lab Dataset" not in p3:
    p3 = p3.replace("== 9.5 Summary & Key Revision Takeaways", ch9_add + "\n== 9.6 Summary & Key Revision Takeaways")
    p3 = p3.replace("== 9.6 High-Yield Exam", "== 9.7 High-Yield Exam")
    p3 = p3.replace("== 9.7 Practical Viva", "== 9.8 Practical Viva")

if "== 10.5 Senior Audit & Verification" not in p3:
    p3 = p3.replace("== 10.5 Summary & Key Revision Takeaways", ch10_add + "\n== 10.6 Summary & Key Revision Takeaways")
    p3 = p3.replace("== 10.6 High-Yield Exam", "== 10.7 High-Yield Exam")
    p3 = p3.replace("== 10.7 Practical Viva", "== 10.8 Practical Viva")

if "== 11.7 Corporate GST Audit" not in p3:
    p3 = p3.replace("== 11.7 Summary & Key Revision Takeaways", ch11_add + "\n== 11.8 Summary & Key Revision Takeaways")
    p3 = p3.replace("== 11.8 High-Yield Exam", "== 11.9 High-Yield Exam")
    p3 = p3.replace("== 11.9 Practical Viva", "== 11.10 Practical Viva")

with open(part3_file, "w", encoding="utf-8") as f:
    f.write(p3)
print(f"Expanded Part 3: {os.path.getsize(part3_file)} bytes")
