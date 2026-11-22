# -*- coding: utf-8 -*-
"""
Mega Expansion Builder V3: Expands English Curriculum to 52-56 Pages
Standardized by Rahul Patel (Founder, RTechLab / IANT Palanpur)
Direct Contact: rahul.28e1@gmail.com
"""
import os

SCRIPTS_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\scripts"

# =========================================================================
# 1. Expand Part 1 (Ch 2 & Ch 3)
# =========================================================================
part1_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part1.py")
with open(part1_file, "r", encoding="utf-8") as f:
    p1 = f.read()

ch2_add2 = """
== 2.9 The 10 Foundational Principles of Chart of Accounts in Tally Prime
A properly structured Chart of Accounts (COA) is the backbone of flawless computerized bookkeeping:
1. *Zero Duplicate Accounts:* Never create multiple ledgers for the same vendor or customer. Utilize sub-groups or cost centres instead.
2. *Precise Statutory Grouping:* Ensure every tax ledger is nested under *Duties & Taxes* to allow automated tax algorithms to fire correctly.
3. *Consistent Naming Conventions:* Standardize nomenclature (e.g., `Customer Name (City)` or `Vendor Name Pvt Ltd`).
4. *Mandatory Bill-by-Bill Activation:* Always set *Maintain balances bill-by-bill* to *Yes* for all Sundry Debtors and Sundry Creditors.
5. *Statutory Address & PIN Integrity:* Always enter full postal addresses and correct 6-digit PIN codes to support automated E-Way bill distance calculation.
6. *PAN & GSTIN Synchronization:* Verify that the 10-character PAN embedded within the 15-digit GSTIN matches the party's income tax records.
7. *Bank Account Allocation:* Enter valid IFSC codes and branch names for seamless automated e-payments and BRS import.
8. *Opening Balance Audit:* Ensure debit and credit opening balances balance out to zero difference; unallocated differences report to Suspense A/c!
9. *Default Currency Assignment:* Lock base currency symbol to ₹ for domestic ledgers and configure forex rates for foreign suppliers.
10. *Periodic Inactive Account Purging:* Regularly mark dormant ledgers as inactive to streamline data entry dropdowns.

#v(6pt)
"""

if "== 2.9 The 10 Foundational" not in p1:
    p1 = p1.replace("== Topic 02: High-Yield Exam", ch2_add2 + "\n== Topic 02: High-Yield Exam")

with open(part1_file, "w", encoding="utf-8") as f:
    f.write(p1)

# =========================================================================
# 2. Expand Part 2 (Ch 6 & Ch 7)
# =========================================================================
part2_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part2.py")
with open(part2_file, "r", encoding="utf-8") as f:
    p2 = f.read()

ch6_add2 = """
== 6.9 Step-by-Step Trial Balance Audit & Discrepancy Rectification Drill
The Trial Balance is the ultimate litmus test of mathematical and double-entry accuracy in Tally Prime. 
- *Accessing the Trial Balance:* Navigate to *Gateway of Tally > Display More Reports > Trial Balance* (Shortcut: #key-pill("Alt + G") > type "Trial").
- *Expanding Details:* Press #key-pill("Alt + F1") or #key-pill("Alt + F5") to reveal all underlying secondary groups and ledgers.
- *Detecting Negative Balances:* Tally Prime displays credit balances in debit accounts (or vice versa) with a negative sign or highlighted in red:
  - *Negative Cash Balance:* Indicates cash payments were recorded before capital or sales receipts were posted. Rectify by re-sequencing transaction dates or recording cash infusions.
  - *Negative Stock Balance:* Indicates sales invoices were generated before purchase inward entries were posted. Rectify by checking purchase voucher dates!
  - *Suspense Account Clearance:* If Suspense A/c contains a balance, drill down with #key-pill("Enter"), locate the unidentified debit/credit, trace the source bank statement, and reallocate to the correct customer or expense ledger.

#v(6pt)
"""

ch7_add2 = """
== 7.8 Corporate Security Management: User Roles & Permissions Setup
In a professional corporate accounts department, multiple employees access Tally Prime simultaneously. To prevent fraud, accidental data deletion, or unauthorized access to sensitive financial figures, the administrator configures role-based access:
1. *Enable Security Control:* During company creation (or via #key-pill("Alt + K") > *Security*), set *Control User Access to Company Data* to *Yes*. Provide Administrator Username and secure Password.
2. *Define Security Levels:* Navigate to #key-pill("Alt + K") > *User Roles*. Tally Prime provides default roles: *Owner* and *Data Entry*. Create custom roles such as *Billing Clerk*, *Storekeeper*, and *Tax Auditor*.
3. *Configure Disallow / Allow Permissions:*
   - *Billing Clerk:* Allow *Full Access* to *Sales Vouchers* and *Receipt Vouchers*. Disallow access to *Profit & Loss Account*, *Balance Sheet*, and *Bank Accounts*.
   - *Storekeeper:* Allow access strictly to *Stock Journal*, *Physical Stock*, and *Inventory Reports*. Disallow all financial accounting vouchers.
   - *Junior Accountant:* Disallow *Back-Dated Vouchers* older than 3 days to prevent alteration of closed monthly accounts!
4. *Create User Accounts:* Navigate to #key-pill("Alt + K") > *Users and Passwords*. Assign unique usernames and passwords to each staff member linked to their designated security role.

#v(6pt)
"""

if "== 6.9 Step-by-Step Trial Balance" not in p2:
    p2 = p2.replace("== 6.8 Summary & Key Revision Takeaways", ch6_add2 + "\n== 6.8 Summary & Key Revision Takeaways")

if "== 7.8 Corporate Security Management" not in p2:
    p2 = p2.replace("== 7.9 Summary & Key Revision Takeaways", ch7_add2 + "\n== 7.9 Summary & Key Revision Takeaways")

with open(part2_file, "w", encoding="utf-8") as f:
    f.write(p2)

# =========================================================================
# 3. Expand Part 3 (Ch 8, Ch 10, Ch 11)
# =========================================================================
part3_file = os.path.join(SCRIPTS_DIR, "mega_content_eng_part3.py")
with open(part3_file, "r", encoding="utf-8") as f:
    p3 = f.read()

ch8_add2 = """
== 8.8 Multi-Location Inventory & Godown Management Architecture
Medium and large commercial enterprises store physical merchandise across multiple warehouses, retail outlets, and distribution hubs:
- *Activating Godowns:* Navigate to *Gateway of Tally > Create > Godowns* (or press #key-pill("F11") to verify inventory features).
- *Defining Warehouse Hierarchy:*
  - Primary Godowns: `Palanpur Central Warehouse`, `Ahmedabad Regional Depot`.
  - Sub-Godowns: `Raw Materials Section A`, `Finished Goods Section B`, `Damaged Goods Quarantine`.
- *Inter-Godown Transfer via Stock Journal (Alt+F7):*
  When transferring 100 Pcs computer components from Central Warehouse to Retail Showroom:
  - Select *Stock Journal* voucher.
  - Left Side (Source / Consumption): Specify `Palanpur Central Warehouse`, item name, and quantity.
  - Right Side (Destination / Production): Specify `Retail Showroom Godown`, item name, and quantity.
  Tally Prime instantaneously adjusts physical stock at both locations without altering total company asset value!

#v(6pt)
"""

ch10_add2 = """
== 10.6 The Master 30-Second Speed Run for Corporate Accounts Executives
Senior corporate accountants complete routine workflows in seconds by combining sequential shortcuts:
1. *5-Second Trial Balance Audit:* Press #key-pill("Alt + G") > type "Trial" > press #key-pill("Enter") > press #key-pill("Alt + F1") to expand all groups.
2. *10-Second Customer Outstanding Statement:* Press #key-pill("Alt + G") > type "Ledger Out" > select customer > press #key-pill("Alt + P") > press #key-pill("I") for instant print preview.
3. *8-Second Duplicate Invoice Recording:* Open recurring monthly invoice in Day Book > press #key-pill("Alt + 2") > press #key-pill("F2") to change date > press #key-pill("Ctrl + A") to save!
4. *7-Second Cash Flow Analysis:* Press #key-pill("Alt + G") > type "Cash Flow" > press #key-pill("Alt + F2") for date range > press #key-pill("Ctrl + H") for quarterly summary.

#v(6pt)
"""

ch11_add2 = """
== 11.8 The Complete Year-End Statutory Financial Audit Checklist
Before closing corporate financial books on 31st March, corporate accountants must execute this rigorous 12-point audit checklist:
1. *Bank Reconciliation (BRS):* Reconcile 100% of commercial bank accounts down to the last paisa. Investigate unpresented cheques older than 3 months (stale cheques).
2. *Physical Stock Verification:* Conduct warehouse physical count; record discrepancies using *Physical Stock Voucher* (Ctrl+F7).
3. *Depreciation Calculation:* Charge statutory depreciation on all fixed assets according to Companies Act Schedule II or Income Tax Act rules via Journal (F7).
4. *Prepaid & Accrued Expenses:* Reclassify unexpired insurance premiums into *Prepaid Expenses* (Current Assets) and unpaid salaries into *Provisions*.
5. *Debtor & Creditor Ledger Confirmations:* Dispatch balance confirmation statements to major suppliers and customers; reconcile differences.
6. *Bad Debts Write-Off:* Identify irrecoverable debts and write off to *Bad Debts A/c* via Journal Voucher.
7. *GST Portal Reconciliation:* Reconcile outward turnover in GSTR-1 against GSTR-3B and books. Verify that 100% of claimed ITC is reflected in GSTR-2B.
8. *TDS Reconciliation:* Match TDS deducted against Form 26AS / AIS on the Income Tax portal.
9. *Foreign Exchange Revaluation:* Revalue unhedged foreign currency debtors/creditors at closing exchange rates as per AS-11.
10. *Closing Stock Valuation:* Value closing stock at *Cost or Net Realizable Value (NRV), whichever is lower*.
11. *Verify Data Integrity:* Run #key-pill("Alt + Y") > *Split > Verify Data* to ensure zero unadjusted database pointers.
12. *Lock Back-Dated Vouchers:* Set security lock date to 31-Mar-2025 to freeze audited books against tampering!

#v(6pt)
"""

if "== 8.8 Multi-Location Inventory" not in p3:
    p3 = p3.replace("== 8.8 Summary & Key Revision Takeaways", ch8_add2 + "\n== 8.8 Summary & Key Revision Takeaways")

if "== 10.6 The Master 30-Second" not in p3:
    p3 = p3.replace("== 10.6 Summary & Key Revision Takeaways", ch10_add2 + "\n== 10.6 Summary & Key Revision Takeaways")

if "== 11.8 The Complete Year-End" not in p3:
    p3 = p3.replace("== 11.8 Summary & Key Revision Takeaways", ch11_add2 + "\n== 11.8 Summary & Key Revision Takeaways")

with open(part3_file, "w", encoding="utf-8") as f:
    f.write(p3)

print("Expansion V3 successfully written to parts 1, 2, 3!")
