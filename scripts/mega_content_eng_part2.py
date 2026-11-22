# -*- coding: utf-8 -*-
"""
Mega Content Generator for Tally Prime Master Curriculum — English Edition (Part 2: Topics 5 to 7)
Commercial Grade (50-60 Pages Standardized by Rahul Patel, Founder RTechLab & IANT Palanpur)
Direct Official Contact: rahul.28e1@gmail.com
"""

def append_chapters_5_to_7(chapters):
    # =========================================================================
    # TOPIC 05: Vouchers & The 4 Major Voucher Categories (24 Vouchers)
    # =========================================================================
    chapters[5] = """
= Topic 05: Vouchers & The 4 Major Voucher Categories (24 Vouchers)

== 5.1 What is a Voucher in Tally Prime?
In financial accounting, a *Voucher* is the primary documentary evidence or electronic accounting instrument that records the details of a commercial transaction—including the date, parties involved, amounts debited and credited, ledger accounts affected, statutory tax breakups, and narrative description (*Narration*).

In Tally Prime, every single business transaction must be entered through an appropriate Voucher type. Unlike generic accounting software that forces all entries through a complicated journal, Tally Prime provides *24 specialized voucher types* optimized for rapid data entry, automated ledger posting, statutory tax calculation, and real-time inventory updates.

#v(6pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[THE GOLDEN WORKFLOW OF VOUCHER ENTRY IN TALLY PRIME:]\\
    1. Select Voucher Type (#key-pill("F4") to #key-pill("F9") or press #key-pill("F10") for Other Vouchers).\\
    2. Set Transaction Date by pressing #key-pill("F2").\\
    3. Choose Voucher Mode via #key-pill("Ctrl + H") (*As Voucher*, *As Item Invoice*, or *As Accounting Invoice*).\\
    4. Specify Debit / Credit ledgers or select Party Account Name.\\
    5. Enter Item particulars (Quantity, Rate, HSN) or Service descriptions.\\
    6. Attach statutory tax ledgers (*CGST*, *SGST*, *IGST*, *TDS*).\\
    7. Enter detailed descriptive *Narration* and press #key-pill("Ctrl + A") to save and post immediately!
  ]
)

#v(6pt)

== 5.2 The 4 Major Categories of Vouchers (24 Predefined Vouchers)
Tally Prime categorizes its 24 voucher types into 4 distinct functional operational domains:

#table(
  columns: (1.2fr, 0.8fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Voucher Category]], [#text(weight: "bold", fill: white)[Key Vouchers]], [#text(weight: "bold", fill: white)[Operational Purpose & Business Application]],
  [1. Accounting Vouchers], [F4 to F9], [Handles core double-entry monetary transactions: Cash/Bank fund transfers (Contra), Vendor payments, Customer receipts, Non-cash adjustments (Journal), Sales, and Purchases.],
  [2. Inventory Vouchers], [Alt+F7 to Alt+F9], [Tracks physical movement of goods without monetary payment: Stock transfers between godowns (Stock Journal), physical stock counts, goods received notes, and delivery notes.],
  [3. Order Vouchers], [Ctrl+F8, Ctrl+F9], [Records customer purchase commitments: Sales Orders and Purchase Orders. These do not affect financial books or current stock until executed.],
  [4. Non-Accounting / Memo], [Ctrl+F7, Ctrl+F4], [Memorandum vouchers for temporary reminders, Reversing Journals for month-end accruals, and Optional vouchers for draft scenarios.]
)

#v(6pt)

== 5.3 Complete Master Table: All 24 Vouchers with Keyboard Shortcuts
Every professional corporate accountant must memorize the full registry of Tally Prime vouchers:

#table(
  columns: (0.4fr, 1.3fr, 0.9fr, 2.2fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Voucher Name]], [#text(weight: "bold", fill: white)[Shortcut]], [#text(weight: "bold", fill: white)[Accounting & Commercial Impact]],
  [1], [Contra], [#key-pill("F4")], [Pure Cash-to-Bank, Bank-to-Cash, or Bank-to-Bank transfers. Zero third-party involvement.],
  [2], [Payment], [#key-pill("F5")], [All cash or bank payments to suppliers, employee salaries, rents, utilities, and taxes.],
  [3], [Receipt], [#key-pill("F6")], [All cash or cheque/NEFT collections from customers, capital receipts, and incomes.],
  [4], [Journal], [#key-pill("F7")], [Non-cash adjustment entries, depreciation, bad debts write-offs, and year-end closing.],
  [5], [Sales], [#key-pill("F8")], [Invoicing goods or services sold to customers (Cash or Credit) with GST calculation.],
  [6], [Purchase], [#key-pill("F9")], [Recording raw materials, merchandise, or services purchased from vendors with ITC.],
  [7], [Credit Note], [#key-pill("Alt + F6")], [Sales returns from customers, post-sale trade discounts, or rate difference credits.],
  [8], [Debit Note], [#key-pill("Alt + F5")], [Purchase returns to suppliers, rejection of defective goods, or debiting vendor for shortage.],
  [9], [Sales Order], [#key-pill("Ctrl + F8")], [Recording formal commercial purchase orders received from clients prior to delivery.],
  [10], [Purchase Order], [#key-pill("Ctrl + F9")], [Issuing formal purchase orders to approved suppliers for procurement scheduling.],
  [11], [Delivery Note], [#key-pill("Alt + F8")], [Delivery challan sent with goods dispatched to customers prior to final invoice.],
  [12], [Receipt Note], [#key-pill("Alt + F9")], [Goods Inward Note (GRN) recording physical delivery of goods from suppliers.],
  [13], [Rejections Out], [#key-pill("Alt + F5")], [Returning rejected defective items to vendor before invoice generation.],
  [14], [Rejections In], [#key-pill("Ctrl + F5")], [Accepting rejected goods returned by clients prior to final credit note.],
  [15], [Stock Journal], [#key-pill("Alt + F7")], [Inter-godown transfers (Source to Destination) and Manufacturing Bill of Materials (BOM).],
  [16], [Physical Stock], [#key-pill("Ctrl + F7")], [Physical inventory audit count to align system stock with actual warehouse count.],
  [17], [Material In], [#key-pill("Ctrl + F7")], [Tracking raw materials received from job-workers under GST job-work rules.],
  [18], [Material Out], [#key-pill("Alt + F7")], [Tracking dispatch of semi-finished goods sent to external job-workers.],
  [19], [Job Work Order In], [#key-pill("Ctrl + F8")], [Receiving job work processing orders from principal manufacturers.],
  [20], [Job Work Order Out], [#key-pill("Ctrl + F9")], [Issuing job work processing contracts to secondary fabricators.],
  [21], [Memorandum], [#key-pill("Ctrl + F7")], [Non-accounting reminder entries that do not alter financial ledgers or stock.],
  [22], [Reversing Journal], [#key-pill("Ctrl + F4")], [Temporary provisions that automatically reverse on the first day of the next month.],
  [23], [Payroll Voucher], [#key-pill("Ctrl + F4")], [Automated monthly salary calculation, PF, ESI, Professional Tax, and net disbursements.],
  [24], [Attendance Voucher], [#key-pill("Ctrl + F5")], [Recording employee working days, overtime hours, and leaves for payroll processing.]
)

#v(6pt)

== 5.4 Voucher Modes: As Voucher vs Item Invoice vs Accounting Invoice
One of the most revolutionary innovations of Tally Prime is the *Change Mode* feature accessed via #key-pill("Ctrl + H"). This allows accountants to toggle between three distinct input interfaces:

#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Voucher Mode]], [#text(weight: "bold", fill: white)[Keyboard Key]], [#text(weight: "bold", fill: white)[When to Use in Corporate Practice]],
  [Item Invoice], [#key-pill("Ctrl + H") > Item], [Standard trading and manufacturing mode. Requires selecting *Stock Items*, Quantity, Units of Measure (Pcs, Kgs), and Rates. Essential for GST invoices with HSN summary.],
  [Accounting Invoice], [#key-pill("Ctrl + H") > Accounting], [Used exclusively for *Service Providers* (IT consulting, audit fees, freight, rent) where no physical goods are transferred. Ledgers are debited directly with SAC codes.],
  [As Voucher], [#key-pill("Ctrl + H") > Voucher], [Traditional double-entry mode displaying explicit *Dr.* / *Cr.* (or *To* / *By*) lines. Preferred by senior accountants for complex journal adjustments and contra vouchers.]
)

#v(6pt)

== 5.5 Step-by-Step Practical Walkthroughs of the 6 Core Accounting Vouchers

=== 1. Contra Voucher (F4) — The Golden Cash/Bank Engine
*Rule:* Only Cash and Bank accounts can be debited and credited in Contra. No customer, vendor, or expense ledger is permitted!
- *Scenario:* Deposited ₹50,000 liquid cash into HDFC Bank Current A/c.
- *Entry:* Debit: *HDFC Bank Current A/c* ₹50,000 | Credit: *Cash A/c* ₹50,000.
- *Tally Denomination Screen:* Tally Prime automatically opens the Bank Allocation window to record currency denominations (e.g., 25 notes of ₹2000, or 100 notes of ₹500).

=== 2. Payment Voucher (F5) — Outward Remittances
*Rule:* The receiving party or expense ledger is Debited (*Dr.*), and Cash/Bank is Credited (*Cr.*).
- *Scenario:* Paid ₹15,000 office rent to Landlord Shri Arvindbhai via cheque from HDFC Bank.
- *Entry:* Debit: *Office Rent Expense A/c* ₹15,000 | Credit: *HDFC Bank Current A/c* ₹15,000.
- *Cheque Detail Window:* Record Cheque No. (e.g., `450121`), Instrument Date, and Favouring Name.

=== 3. Receipt Voucher (F6) — Inward Collections
*Rule:* Cash or Bank ledger is Debited (*Dr.*), and Customer or Income ledger is Credited (*Cr.*).
- *Scenario:* Received NEFT of ₹85,000 from Ravi Enterprises against sales invoice \#INV-104.
- *Entry:* Debit: *HDFC Bank Current A/c* ₹85,000 | Credit: *Ravi Enterprises (Sundry Debtors)* ₹85,000.
- *Bill-wise Details:* Select *Against Reference* (`Agst Ref`) and tag invoice \#INV-104 to clear the debtor balance!

=== 4. Journal Voucher (F7) — Pure Adjustment Engine
*Rule:* Strictly non-cash and non-bank transactions! Used for depreciation, interest accrual, rectification, and year-end provisions.
- *Scenario:* Charged 15% depreciation on office computers costing ₹60,000 (Depreciation = ₹9,000).
- *Entry:* Debit: *Depreciation Expense A/c* ₹9,000 | Credit: *Computers (Fixed Asset) A/c* ₹9,000.

=== 5. Sales Voucher (F8) — Revenue & Invoicing Engine
*Rule:* Customer (Sundry Debtor) or Cash is Debited (*Dr.*), Sales A/c is Credited (*Cr.*), and Output Tax ledgers are Credited (*Cr.*).
- *Scenario:* Sold 10 Pcs Samsung Monitors @ ₹8,000 each to Maheshwari Traders (Palanpur) + 18% GST (CGST 9% + SGST 9%).
- *Entry:*
  - Debit: *Maheshwari Traders* (Sundry Debtors) ₹94,400
  - Credit: *Sales GST 18% A/c* ₹80,000
  - Credit: *Output CGST 9% A/c* ₹7,200
  - Credit: *Output SGST 9% A/c* ₹7,200

=== 6. Purchase Voucher (F9) — Inward Procurement & ITC
*Rule:* Purchase A/c is Debited (*Dr.*), Input Tax ledgers are Debited (*Dr.*), and Supplier (Sundry Creditor) is Credited (*Cr.*).
- *Scenario:* Purchased 5 Pcs HP Laser Printers @ ₹12,000 from Avni Pvt Ltd + 18% GST.
- *Entry:*
  - Debit: *Purchase GST 18% A/c* ₹60,000
  - Debit: *Input CGST 9% A/c* ₹5,400
  - Debit: *Input SGST 9% A/c* ₹5,400
  - Credit: *Avni Pvt Ltd* (Sundry Creditors) ₹70,800

#v(6pt)

== 5.6 Practical Dataset: 25 Commercial Voucher Transactions
Enter the following 25 commercial transactions into Tally Prime, ensuring exact voucher selection and bill-wise references:

#table(
  columns: (0.4fr, 2.5fr, 0.8fr, 0.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Commercial Transaction Narrative]], [#text(weight: "bold", fill: white)[Voucher]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [01], [Proprietor introduced additional capital via cheque into HDFC Bank], [Receipt (F6)], [₹2,50,000],
  [02], [Withdrew liquid cash from HDFC Bank for office petty cash box], [Contra (F4)], [₹25,000],
  [03], [Purchased office stationery from Palanpur Book Depot in cash], [Payment (F5)], [₹3,200],
  [04], [Purchased 15 Dell Keyboards on credit from Tech Supply Co. (Inv \#882)], [Purchase (F9)], [₹18,000],
  [05], [Sold 5 Dell Keyboards for cash to walk-in customer], [Sales (F8)], [₹7,500],
  [06], [Transferred funds from HDFC Bank Current A/c to ICICI Bank A/c], [Contra (F4)], [₹60,000],
  [07], [Issued cheque \#602101 to Tech Supply Co. in full settlement of Inv \#882], [Payment (F5)], [₹18,000],
  [08], [Sold 10 Dell Keyboards on credit to Modern School (Inv \#001)], [Sales (F8)], [₹15,000],
  [09], [Modern School returned 2 defective keyboards (Issued Credit Note)], [Credit Note], [₹3,000],
  [10], [Received RTGS from Modern School for net invoice balance], [Receipt (F6)], [₹12,000],
  [11], [Returned 2 defective keyboards to Tech Supply Co. (Debit Note)], [Debit Note], [₹2,400],
  [12], [Paid high-speed fiber broadband bill via HDFC Bank net banking], [Payment (F5)], [₹2,800],
  [13], [Charged annual depreciation on office furniture], [Journal (F7)], [₹6,500],
  [14], [Deposited cash sales collections of the week into ICICI Bank], [Contra (F4)], [₹35,000],
  [15], [Paid monthly office electricity bill via UPI from HDFC Bank], [Payment (F5)], [₹4,750],
  [16], [Purchased licensed accounting software via corporate credit card], [Purchase (F9)], [₹21,240],
  [17], [Received interest dividend on fixed deposit credited in HDFC Bank], [Receipt (F6)], [₹3,600],
  [18], [Proprietor withdrew cash from office petty cash for personal grocery], [Payment (F5)], [₹5,000],
  [19], [Paid staff salaries for the month via HDFC Bank direct transfer], [Payment (F5)], [₹48,000],
  [20], [Received advance consulting deposit from Jaimin Corp via cheque], [Receipt (F6)], [₹30,000],
  [21], [Bank debited semi-annual current account maintenance charges], [Payment (F5)], [₹850],
  [22], [Raised service invoice to Jaimin Corp for corporate accounting setup], [Sales (F8)], [₹50,000],
  [23], [Adjusted advance deposit against Jaimin Corp sales invoice], [Journal (F7)], [₹30,000],
  [24], [Received balance payment from Jaimin Corp via IMPS], [Receipt (F6)], [₹20,000],
  [25], [Transferred surplus funds from ICICI Bank back to HDFC Bank], [Contra (F4)], [₹40,000]
)

#v(6pt)


== 5.7 The 10 Golden Rules of Voucher Alteration & Audit Trail (Edit Log)
Under statutory corporate governance rules mandated by the Ministry of Corporate Affairs (MCA), Indian companies must maintain computerized accounting software equipped with an inviolable *Audit Trail (Edit Log)* feature:
1. *Immutable Audit Trail:* Tally Prime Edit Log records every voucher creation, modification, and deletion with user identity, timestamp, and field-level change history.
2. *Zero Disablement:* Once enabled, the Edit Log cannot be disabled or tampered with by any administrator.
3. *Voucher Class Automation:* To eliminate data entry errors, accountants configure *Voucher Classes* in Sales and Purchase vouchers. A Voucher Class pre-defines the Sales Ledger, Input/Output Tax Ledgers, and automated Round-Off, allowing operators to enter only stock items while Tally calculates statutory taxes automatically!

#v(6pt)


== 5.8 Advanced Voucher Scenarios: Compound Invoicing with Trade & Cash Discounts
In corporate trading, transactions often combine commercial trade discounts and cash discounts:
- *Commercial Scenario:* Sold 20 Pcs Samsung Monitors @ ₹6,500 = ₹1,30,000. Allowed 5% Trade Discount on invoice face (Taxable Value = ₹1,23,500). Charged 18% GST (CGST ₹11,115 + SGST ₹11,115 = ₹1,45,730). Offered 2% Cash Discount if paid within 7 days.
- *Cash Receipt within 7 Days:* Customer pays via NEFT. Cash Discount of 2% on taxable value (₹2,470) is granted via Credit Note or Journal Voucher, and net cash of ₹1,43,260 is debited in Receipt (F6).

#v(6pt)

== 5.9 Summary & Key Revision Takeaways
- *Voucher Selection Principle:* Every commercial transaction has exactly one optimal voucher type. Contra is restricted strictly to Cash and Bank.
- *Modes Matter:* Use *Item Invoice* for stock goods, *Accounting Invoice* for pure services, and *As Voucher* for double-entry debits and credits.
- *Bill-wise References:* Always tag *Against Reference* (`Agst Ref`) when recording payments or receipts to ensure customer outstanding balances remain 100% accurate!

#v(6pt)

== 5.10 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [Which keyboard shortcut opens the Contra Voucher in Tally Prime?\\
  (A) F5 (B) F4 (C) F6 (D) F7], [*Correct: (B) F4*\\
  Contra handles internal fund transfers between cash and bank accounts.],
  [02], [Which of the following transactions CANNOT be recorded in a Contra Voucher?\\
  (A) Cash deposited in SBI (B) Cash withdrawn from HDFC\\
  (C) Rent paid to landlord in cash (D) Transfer from SBI to HDFC], [*Correct: (C) Rent paid to landlord in cash*\\
  Rent payment involves an expense ledger and must be recorded in Payment (F5).],
  [03], [Which key toggles between Item Invoice, Accounting Invoice, and As Voucher?\\
  (A) Ctrl+F (B) Alt+V (C) Ctrl+H (D) Alt+H], [*Correct: (C) Ctrl+H*\\
  Ctrl+H is the global Change Mode shortcut across all Tally Prime vouchers.],
  [04], [A customer returns defective goods previously sold on credit. Which voucher is used?\\
  (A) Debit Note (B) Credit Note (C) Journal (D) Receipt], [*Correct: (B) Credit Note (Alt+F6)*\\
  Credit Note reduces customer receivables and reverses the original sales credit.],
  [05], [Depreciation on plant and machinery is recorded in which voucher type?\\
  (A) Payment (B) Purchase (C) Journal (D) Contra], [*Correct: (C) Journal (F7)*\\
  Journal records non-cash adjustments that do not involve cash or bank ledgers.],
  [06], [Which voucher type is used to record inter-godown physical stock transfers?\\
  (A) Physical Stock (B) Stock Journal (C) Delivery Note (D) Receipt Note], [*Correct: (B) Stock Journal (Alt+F7)*\\
  Stock Journal has Source (Consumption) and Destination (Production) columns.],
  [07], [When recording customer payment against an old bill, which reference type is selected?\\
  (A) New Ref (B) Advance (C) Agst Ref (D) On Account], [*Correct: (C) Agst Ref*\\
  Against Reference links the receipt directly to the specific pending invoice number.],
  [08], [Which shortcut opens the master list of all inactive and active vouchers?\\
  (A) F10 (B) F11 (C) F12 (D) Alt+F10], [*Correct: (A) F10 (Other Vouchers)*\\
  F10 opens the master list of all 24 vouchers, allowing users to activate hidden types.],
  [09], [What is the primary function of a Memorandum Voucher (Ctrl+F7)?\\
  (A) Post provisional tax (B) Maintain reminder without altering books\\
  (C) Reconcile bank (D) Calculate payroll], [*Correct: (B) Maintain reminder without altering books*\\
  Memorandum entries do not post to trial balances until converted to regular vouchers.],
  [10], [What shortcut immediately saves a voucher without pressing Enter through all fields?\\
  (A) Ctrl+S (B) Ctrl+A (C) Alt+S (D) Alt+A], [*Correct: (B) Ctrl+A*\\
  Ctrl+A is the universal quick-accept shortcut throughout Tally Prime.]
)

#v(6pt)

== 5.11 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* What is the fundamental operational difference between a Payment Voucher (F5) and a Journal Voucher (F7)?\\
  *Model Answer:* A Payment Voucher strictly involves an outflow of funds from either a Cash or Bank ledger. A Journal Voucher is strictly for non-cash and non-bank transactions such as depreciation, provisions, bad debts write-offs, and inter-ledger adjustments.
- *Viva Q2:* When should a corporate accountant record an invoice in *Accounting Invoice* mode instead of *Item Invoice* mode?\\
  *Model Answer:* Accounting Invoice mode is used when billing intangible services (such as legal consulting, audit fees, freight, or software development) where no physical goods, quantities, or units of measure (UoM) exist.
- *Viva Q3:* Explain the accounting rationale of a Debit Note vs a Credit Note from a buyer's perspective.\\
  *Model Answer:* When a buyer receives damaged goods from a supplier, the buyer issues a Debit Note (Alt+F5) to debit the supplier's account and reduce current liabilities. Conversely, the supplier will record that return as a Credit Note (Alt+F6).
- *Hands-On Lab Task:* Open Tally Prime, press #key-pill("F10") (Other Vouchers), inspect all inactive voucher types, activate *Credit Note* and *Debit Note*, and record a purchase return of 2 Dell Keyboards to Tech Supply Co. using #key-pill("Alt + F5").
"""

    # =========================================================================
    # TOPIC 06: Groups & Complete Ledger Mapping System (28 Groups)
    # =========================================================================
    chapters[6] = """
= Topic 06: Groups & Complete Ledger Mapping System (28 Groups)

== 6.1 What is a Group in Tally Prime?
In financial bookkeeping, an *Account Group* is a hierarchical category or parent classification under which individual ledger accounts of similar nature are organized. 

Groups determine where an account appears in the statutory financial statements:
- Ledgers grouped under *Capital*, *Liabilities*, or *Assets* flow directly into the *Balance Sheet*.
- Ledgers grouped under *Purchase*, *Sales*, *Direct Expenses*, or *Indirect Expenses* flow into the *Profit & Loss Account*.

Tally Prime provides *28 Predefined Groups* out of the box. These 28 groups are designed to accommodate 100% of Indian accounting standards and international financial reporting requirements without requiring users to create new primary groups.

#v(6pt)

== 6.2 The Master Hierarchy: 15 Primary Groups & 13 Secondary Groups
The 28 predefined groups are structured into a 2-tier hierarchy:
1. *15 Primary Groups:* Top-level financial categories that report directly to the Balance Sheet (9 groups) or Profit & Loss Statement (6 groups).
2. *13 Secondary / Sub-Groups:* Subsidiary groups nested under specific primary groups to provide granular reporting (e.g., *Bank Accounts* is nested under *Current Assets*).

#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Classification]], [#text(weight: "bold", fill: white)[Group Count]], [#text(weight: "bold", fill: white)[Predefined Groups Included]],
  [Primary Groups (Balance Sheet)], [9 Primary Groups], [Capital Account, Loans (Liability), Current Liabilities, Fixed Assets, Investments, Current Assets, Branch / Divisions, Misc. Expenses (Asset), Suspense A/c.],
  [Primary Groups (Profit & Loss)], [6 Primary Groups], [Sales Accounts, Purchase Accounts, Direct Incomes, Direct Expenses, Indirect Incomes, Indirect Expenses.],
  [Secondary / Sub-Groups], [13 Sub-Groups], [Reserves & Surplus (under Capital), Secured Loans (under Loans), Unsecured Loans, Bank OD A/c, Duties & Taxes (under Current Liabilities), Provisions, Sundry Creditors, Bank Accounts (under Current Assets), Cash-in-hand, Deposits (Asset), Loans & Advances (Asset), Stock-in-hand, Sundry Debtors.]
)

#v(6pt)

== 6.3 The Factory Gate Rule: Direct vs Indirect Expenses & Incomes
One of the most frequent errors made by junior accountants is misclassifying expenses between *Direct Expenses* and *Indirect Expenses*. In corporate accounting interviews, this is tested rigorously!

#table(
  columns: (1fr, 1.8fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Dimension]], [#text(weight: "bold", fill: white)[Direct Expenses / Incomes]], [#text(weight: "bold", fill: white)[Indirect Expenses / Incomes]],
  [Definition], [All costs incurred *inside the factory gate* or directly connected with manufacturing, procurement, and bringing goods to sellable condition.], [All operational, administrative, selling, financial, and distribution costs incurred *after the goods are ready for sale* or in head office.],
  [Statement Impact], [Debited to the *Trading Account* to calculate *Gross Profit (GP)*.], [Debited to the *Profit & Loss Account* to calculate *Net Profit (NP)*.],
  [Standard Examples], [Factory wages, Carriage Inward, Freight Inward, Factory fuel and power, Customs duty on raw materials, Primary packaging, Coal/Gas.], [Office salaries, Office rent, Electricity, Audit fees, Advertising, Bank charges, Carriage Outward, Sales commission, Depreciation, Telephone charges.]
)

#v(6pt)

== 6.4 Comprehensive 70+ Ledger-to-Group Mapping Table
This master reference table covers the exact group assignment for all commercial ledgers used across corporate offices:

#table(
  columns: (0.4fr, 1.6fr, 1.6fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Ledger Account Name]], [#text(weight: "bold", fill: white)[Correct Tally Prime Group]], [#text(weight: "bold", fill: white)[Financial Statement]],
  [01], [Salman's Capital A/c], [Capital Account], [Balance Sheet (Liab)],
  [02], [Proprietor Drawings A/c], [Capital Account], [Balance Sheet (Liab)],
  [03], [General Reserve A/c], [Reserves & Surplus], [Balance Sheet (Liab)],
  [04], [HDFC Bank Current A/c], [Bank Accounts], [Balance Sheet (Asset)],
  [05], [SBI Cash Credit (CC) A/c], [Bank OD A/c], [Balance Sheet (Liab)],
  [06], [Petty Cash A/c], [Cash-in-hand], [Balance Sheet (Asset)],
  [07], [Office Furniture A/c], [Fixed Assets], [Balance Sheet (Asset)],
  [08], [Plant & Machinery A/c], [Fixed Assets], [Balance Sheet (Asset)],
  [09], [Delivery Van A/c], [Fixed Assets], [Balance Sheet (Asset)],
  [10], [Software Trademark A/c], [Fixed Assets (Intangible)], [Balance Sheet (Asset)],
  [11], [Shares in TATA Motors], [Investments], [Balance Sheet (Asset)],
  [12], [Fixed Deposit in Bank (3 Yrs)], [Investments / Deposits], [Balance Sheet (Asset)],
  [13], [Ravi Enterprises (Customer)], [Sundry Debtors], [Balance Sheet (Asset)],
  [14], [Jaimin Corp (Client)], [Sundry Debtors], [Balance Sheet (Asset)],
  [15], [Avni Pvt Ltd (Supplier)], [Sundry Creditors], [Balance Sheet (Liab)],
  [16], [Tech Supply Co. (Vendor)], [Sundry Creditors], [Balance Sheet (Liab)],
  [17], [Input CGST A/c], [Duties & Taxes], [Balance Sheet (Asset/Liab)],
  [18], [Input SGST A/c], [Duties & Taxes], [Balance Sheet (Asset/Liab)],
  [19], [Input IGST A/c], [Duties & Taxes], [Balance Sheet (Asset/Liab)],
  [20], [Output CGST A/c], [Duties & Taxes], [Balance Sheet (Liab)],
  [21], [Output SGST A/c], [Duties & Taxes], [Balance Sheet (Liab)],
  [22], [Output IGST A/c], [Duties & Taxes], [Balance Sheet (Liab)],
  [23], [TDS Payable Sec 194C], [Duties & Taxes], [Balance Sheet (Liab)],
  [24], [TDS Payable Sec 194J], [Duties & Taxes], [Balance Sheet (Liab)],
  [25], [Electricity Security Deposit], [Deposits (Asset)], [Balance Sheet (Asset)],
  [26], [Office Premises Rent Deposit], [Deposits (Asset)], [Balance Sheet (Asset)],
  [27], [Advance to Staff Suresh], [Loans & Advances (Asset)], [Balance Sheet (Asset)],
  [28], [Advance to Raw Material Vendor], [Loans & Advances (Asset)], [Balance Sheet (Asset)],
  [29], [Bank Term Loan (HDFC)], [Secured Loans], [Balance Sheet (Liab)],
  [30], [Mortgage Loan on Building], [Secured Loans], [Balance Sheet (Liab)],
  [31], [Unsecured Loan from Director], [Unsecured Loans], [Balance Sheet (Liab)],
  [32], [Loan from Friend Mohan], [Unsecured Loans], [Balance Sheet (Liab)],
  [33], [Salary Payable A/c], [Provisions / Current Liab], [Balance Sheet (Liab)],
  [34], [Audit Fees Payable A/c], [Provisions], [Balance Sheet (Liab)],
  [35], [Sales GST 18% A/c], [Sales Accounts], [Profit & Loss (Credit)],
  [36], [Sales Interstate IGST 18%], [Sales Accounts], [Profit & Loss (Credit)],
  [37], [Sales Exempt (0% GST)], [Sales Accounts], [Profit & Loss (Credit)],
  [38], [Sales Returns (Inward) A/c], [Sales Accounts], [Profit & Loss (Credit -)],
  [39], [Purchase GST 18% A/c], [Purchase Accounts], [Profit & Loss (Debit)],
  [40], [Purchase Interstate IGST 18%], [Purchase Accounts], [Profit & Loss (Debit)],
  [41], [Purchase Exempt (0% GST)], [Purchase Accounts], [Profit & Loss (Debit)],
  [42], [Purchase Returns (Outward) A/c], [Purchase Accounts], [Profit & Loss (Debit -)],
  [43], [Factory Labour Wages], [Direct Expenses], [Trading A/c (Debit)],
  [44], [Freight / Carriage Inward], [Direct Expenses], [Trading A/c (Debit)],
  [45], [Factory Power & Fuel], [Direct Expenses], [Trading A/c (Debit)],
  [46], [Customs Import Duty], [Direct Expenses], [Trading A/c (Debit)],
  [47], [Factory Machinery Repairs], [Direct Expenses], [Trading A/c (Debit)],
  [48], [Primary Packaging Material], [Direct Expenses], [Trading A/c (Debit)],
  [49], [Office Staff Salaries], [Indirect Expenses], [Profit & Loss (Debit)],
  [50], [Office Premises Rent], [Indirect Expenses], [Profit & Loss (Debit)],
  [51], [Electricity Expenses], [Indirect Expenses], [Profit & Loss (Debit)],
  [52], [Printing & Stationery], [Indirect Expenses], [Profit & Loss (Debit)],
  [53], [Advertising & Marketing], [Indirect Expenses], [Profit & Loss (Debit)],
  [54], [Bank Service Charges], [Indirect Expenses], [Profit & Loss (Debit)],
  [55], [Audit Fees Expense], [Indirect Expenses], [Profit & Loss (Debit)],
  [56], [Legal & Professional Fees], [Indirect Expenses], [Profit & Loss (Debit)],
  [57], [Carriage Outward], [Indirect Expenses], [Profit & Loss (Debit)],
  [58], [Depreciation on Fixed Assets], [Indirect Expenses], [Profit & Loss (Debit)],
  [59], [Bad Debts Written Off], [Indirect Expenses], [Profit & Loss (Debit)],
  [60], [Discount Allowed A/c], [Indirect Expenses], [Profit & Loss (Debit)],
  [61], [Interest Received on FD], [Indirect Incomes], [Profit & Loss (Credit)],
  [62], [Commission Income Received], [Indirect Incomes], [Profit & Loss (Credit)],
  [63], [Discount Received from Vendor], [Indirect Incomes], [Profit & Loss (Credit)],
  [64], [Profit on Sale of Old Car], [Indirect Incomes], [Profit & Loss (Credit)],
  [65], [Scrap Sales (Direct)], [Direct Incomes], [Trading A/c (Credit)]
)

#v(6pt)

== 6.5 Practical Classification Worksheet for Students
Classify the following 10 complex corporate accounts into their exact Tally Prime groups:
1. *Prepaid Insurance Premium:* `Current Assets` (since benefit extends into future financial year).
2. *Outstanding Factory Electricity:* `Current Liabilities / Provisions` (liability incurred but unpaid).
3. *Accrued Interest on Bank Deposits:* `Current Assets` (income earned but not yet credited by bank).
4. *Machinery Installation Charges:* Debited to `Fixed Assets` (capitalized cost before asset is put to use).
5. *Trade License Fee paid to Municipality:* `Indirect Expenses` (administrative operational compliance).
6. *Provision for Bad & Doubtful Debts:* `Provisions` (deducted from Debtors on Balance Sheet).
7. *Godown Fire Insurance Premium:* `Indirect Expenses` (administrative risk protection).
8. *Directors Remuneration:* `Indirect Expenses` (governance overhead).
9. *GST Compensation Cess Input:* `Duties & Taxes` (eligible for ITC against cess liability).
10. *Unclaimed Customer Dividends:* `Current Liabilities` (held in trust on behalf of shareholders).

#v(6pt)


== 6.6 The Chart of Accounts Architecture & Custom Sub-Group Design
In multi-branch corporate enterprises, creating custom sub-groups under Tally's 28 predefined groups is essential for executive reporting:
- *Custom Debtors Groups:* Create *North Gujarat Debtors*, *South Gujarat Debtors*, and *Export Debtors* under parent *Sundry Debtors*. This allows sales managers to view region-wise outstanding debt instantly!
- *Custom Creditors Groups:* Create *Raw Material Suppliers* and *Service Providers* under parent *Sundry Creditors*.
- *Custom Expense Groups:* Create *Administrative Expenses* and *Selling & Distribution Expenses* under parent *Indirect Expenses* to analyze departmental cost run-rates.

#v(6pt)


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


== 6.9 Step-by-Step Trial Balance Audit & Discrepancy Rectification Drill
The Trial Balance is the ultimate litmus test of mathematical and double-entry accuracy in Tally Prime. 
- *Accessing the Trial Balance:* Navigate to *Gateway of Tally > Display More Reports > Trial Balance* (Shortcut: #key-pill("Alt + G") > type "Trial").
- *Expanding Details:* Press #key-pill("Alt + F1") or #key-pill("Alt + F5") to reveal all underlying secondary groups and ledgers.
- *Detecting Negative Balances:* Tally Prime displays credit balances in debit accounts (or vice versa) with a negative sign or highlighted in red:
  - *Negative Cash Balance:* Indicates cash payments were recorded before capital or sales receipts were posted. Rectify by re-sequencing transaction dates or recording cash infusions.
  - *Negative Stock Balance:* Indicates sales invoices were generated before purchase inward entries were posted. Rectify by checking purchase voucher dates!
  - *Suspense Account Clearance:* If Suspense A/c contains a balance, drill down with #key-pill("Enter"), locate the unidentified debit/credit, trace the source bank statement, and reallocate to the correct customer or expense ledger.

#v(6pt)

== 6.8 Summary & Key Revision Takeaways
- *Groups Govern Financial Reports:* Tally Prime automatically builds the Balance Sheet and Profit & Loss statement based entirely on group attachments.
- *Primary vs Secondary:* 15 Primary groups form the top branches of the Chart of Accounts; 13 Secondary groups offer sub-categorization.
- *Factory Gate Rule:* Direct expenses increase Cost of Goods Sold (COGS) and reduce Gross Profit; Indirect expenses reduce Net Profit.

#v(6pt)

== 6.9 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [How many predefined groups exist in a fresh company in Tally Prime?\\
  (A) 15 (B) 24 (C) 28 (D) 32], [*Correct: (C) 28 Predefined Groups*\\
  Tally Prime provides exactly 15 Primary groups and 13 Secondary sub-groups.],
  [02], [Under which group is a customer account created in Tally Prime?\\
  (A) Sundry Creditors (B) Sundry Debtors (C) Current Liabilities (D) Sales], [*Correct: (B) Sundry Debtors*\\
  Sundry Debtors represents trade receivables from whom money is due for credit sales.],
  [03], [Under which group is Input CGST classified in Tally Prime?\\
  (A) Indirect Expenses (B) Current Assets (C) Duties & Taxes (D) Provisions], [*Correct: (C) Duties & Taxes*\\
  All tax accounts (CGST, SGST, IGST, TDS, TCS) are grouped under Duties & Taxes.],
  [04], [Which of the following is categorized as a Direct Expense in Tally Prime?\\
  (A) Office Telephone (B) Factory Wages (C) Audit Fees (D) Bank Charges], [*Correct: (B) Factory Wages*\\
  Factory wages are incurred inside the manufacturing facility and affect Gross Profit.],
  [05], [Under which group is Bank Overdraft (OD) categorized?\\
  (A) Current Assets (B) Bank Accounts (C) Bank OD A/c (D) Secured Loans], [*Correct: (C) Bank OD A/c*\\
  Bank OD is a sub-group under Loans (Liability) reflecting credit limits.],
  [06], [Which group holds a temporary account created to balance an unequal Trial Balance?\\
  (A) Suspense A/c (B) Misc. Expenses (C) Branch/Divisions (D) Provisions], [*Correct: (A) Suspense A/c*\\
  Suspense A/c temporarily absorbs unverified ledger differences pending investigation.],
  [07], [What is the parent group of Reserves & Surplus in Tally Prime?\\
  (A) Current Liabilities (B) Capital Account (C) Investments (D) Loans], [*Correct: (B) Capital Account*\\
  Reserves & Surplus is a secondary sub-group nested under Capital Account.],
  [08], [Carriage Outward is categorized under which group?\\
  (A) Direct Expenses (B) Indirect Expenses (C) Fixed Assets (D) Current Assets], [*Correct: (B) Indirect Expenses*\\
  Carriage Outward is a selling and distribution expense incurred after the sale.],
  [09], [Where can an accountant view the entire hierarchical tree of groups in Tally Prime?\\
  (A) Day Book (B) Chart of Accounts (C) F11 Features (D) Audit Trail], [*Correct: (B) Chart of Accounts*\\
  Gateway of Tally > Chart of Accounts > Ledgers reveals the entire group tree.],
  [10], [Can a user create new sub-groups under existing groups in Tally Prime?\\
  (A) No, strictly 28 groups only (B) Yes, unlimited custom sub-groups\\
  (C) Only with CA license (D) Only in Educational mode], [*Correct: (B) Yes, unlimited custom sub-groups*\\
  Users can create custom sub-groups (e.g., North Gujarat Debtors under Sundry Debtors).]
)

#v(6pt)

== 6.10 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Why is Carriage Inward grouped under Direct Expenses while Carriage Outward is grouped under Indirect Expenses?\\
  *Model Answer:* Carriage Inward is freight paid to bring raw materials into the business premises to prepare them for sale, making it part of the prime cost of goods sold (COGS). Carriage Outward is delivery freight paid to transport sold goods to the customer, making it a post-production distribution expense.
- *Viva Q2:* What happens to the Balance Sheet if an accountant accidentally groups Office Furniture under Indirect Expenses?\\
  *Model Answer:* If Office Furniture is misclassified under Indirect Expenses, the asset value is entirely wiped from the Balance Sheet, and current year profits are heavily understated by the full asset purchase price instead of being capitalized and depreciated over its useful life.
- *Viva Q3:* What is the significance of the *Duties & Taxes* group in automated GST calculation?\\
  *Model Answer:* Tally Prime's statutory tax calculation algorithms recognize ledgers grouped under Duties & Taxes with GST type (*Central Tax*, *State Tax*, *Integrated Tax*). It automatically applies statutory tax rates on taxable item values in invoices without requiring manual percentage calculation.
- *Hands-On Lab Task:* In Tally Prime, navigate to *Gateway of Tally > Chart of Accounts > Groups*. Inspect the 28 default groups, press #key-pill("Alt + C"), and create a custom sub-group called *Palanpur Retail Debtors* nested under parent group *Sundry Debtors*.
"""

    # =========================================================================
    # TOPIC 07: Company Creation, Alteration, Deletion & Security Architecture
    # =========================================================================
    chapters[7] = """
= Topic 07: Company Creation, Alteration, Deletion & Security Architecture

== 7.1 What is a Company in Tally Prime?
In Tally Prime, a *Company* is the highest-level operational entity or electronic database workspace that encapsulates all financial ledgers, stock items, transactions, statutory tax profiles, user permissions, and audit logs of a business enterprise.

Before any accounting entry can be made, a company must be created. Tally Prime assigns every company a unique *5-digit system folder number* (starting from `10000`, `10001`, `10002` onwards) located in the data directory (default path: `C:\\Program Files\\TallyPrime\\Data` or user-defined path `C:\\TallyPrime\\Data`).

#v(6pt)

== 7.2 Field-by-Field Breakdown of the Company Creation Screen
To create a new company, press #key-pill("Alt + K") (Company Menu) and select *Create*:

#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Screen Field]], [#text(weight: "bold", fill: white)[Recommended Value]], [#text(weight: "bold", fill: white)[Commercial Significance & Statutory Rule]],
  [Company Data Path], [`C:\\TallyPrime\\Data`], [Physical disk location where company records and encrypted transaction files are stored.],
  [Company Name], [e.g., `Ravi Private Limited`], [Official business legal name as registered under the Companies Act or GST Portal.],
  [Mailing Name], [Auto-populates], [Name printed on all external commercial tax invoices, cheques, and customer statements.],
  [Address], [Full registered address], [Must match physical address on GST registration certificate including building and street.],
  [State / Province], [*Gujarat* (Code: `24`)], [CRITICAL! Governs automated GST calculation (Intrastate CGST+SGST vs Interstate IGST).],
  [Country & Pincode], [`India` · `385001`], [Sets standard base currency symbol (₹) and statutory Indian tax rules.],
  [Telephone & Mobile], [e.g., `7046015165`], [Printed in invoice headers for buyer communication and delivery coordination.],
  [Email & Website], [`ravi@gmail.com`], [Official communication email for automated digital invoice dispatch.],
  [Financial Year Beginning], [`01-Apr-2025`], [Indian statutory financial year always begins on 1st April of the starting year.],
  [Books Beginning From], [`01-Apr-2025`], [Date on which enterprise commenced computerized accounting in Tally Prime.]
)

#v(6pt)

== 7.3 Altering and Deleting Companies in Tally Prime
- *Altering Company Details:* Press #key-pill("Alt + K") > *Alter*. Select the company from the list. You can update address, mobile numbers, email, or enable security passwords. Press #key-pill("Ctrl + A") to save modifications.
- *Deleting a Company Permanently:*
  #block(
    fill: rgb("#FEF2F2"),
    stroke: 1pt + rgb("#FECACA"),
    radius: 4pt,
    inset: 8pt,
    [
      #text(weight: "bold", size: 8.5pt, fill: rgb("#991B1B"))[DANGER: COMPANY DELETION IS PERMANENT! CAUTION REQUIRED!:]\\
      1. Navigate to #key-pill("Alt + K") > *Alter* and open the target company.\\
      2. On the Alteration screen, press #key-pill("Alt + D").\\
      3. Tally displays prompt: *Delete? Yes or No*. Press #key-pill("Enter") or #key-pill("Y").\\
      4. Tally displays second confirmation prompt: *Are you sure? Yes or No*. Press #key-pill("Enter").\\
      The entire 5-digit data folder is permanently deleted from the disk! Always create a backup (#key-pill("Alt + Y") > *Backup*) before deleting any company!
    ]
  )

#v(6pt)

== 7.4 Security Architecture: Security Control vs Tally Vault
Tally Prime features two powerful independent layers of corporate data protection:

#table(
  columns: (1fr, 1.8fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Security Feature]], [#text(weight: "bold", fill: white)[Security Control (User Roles & Access)]], [#text(weight: "bold", fill: white)[Tally Vault (Database AES Encryption)]],
  [Primary Purpose], [Internal access control and role segregation among staff members (Admin, Data Entry, Billing, Auditor).], [Total military-grade cryptographic encryption of the company database files on the hard drive.],
  [Company Visibility], [Company name remains visible in the *Select Company* list. Requires username and password to open.], [Company name is completely masked in the Select Company list as asterisks (`*****`) and given a unique folder ID.],
  [User Permissions], [Administrator can restrict data entry operators from viewing Profit & Loss, altering old vouchers, or exporting data.], [Prevents unauthorized hackers or external IT staff from copying data files or reading raw XML/DB files.],
  [Recovery Option], [Administrator can reset passwords of sub-users and assign new roles.], [UNRECOVERABLE! If the Tally Vault password is lost, even Tally Solutions engineers cannot decrypt or restore the data!]
)

#v(6pt)

== 7.5 Practical Lab Dataset: 5 Authentic Companies from Rahul Sir's Course
Create the following 5 complete commercial companies in Tally Prime, following the exact master data from Rahul Patel Sir's corporate syllabus:

#table(
  columns: (0.4fr, 1.5fr, 1.5fr, 1.1fr, 0.9fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Co.]], [#text(weight: "bold", fill: white)[Legal Business Name]], [#text(weight: "bold", fill: white)[Registered Address]], [#text(weight: "bold", fill: white)[Contact Details]], [#text(weight: "bold", fill: white)[FY & PIN]],
  [01], [Ravi Private Limited], [Near Ambaji Mandir, Main Chowk, Palanpur], [Ph: 252-534234 · Mob: 7046015165 · ravi\@gmail.com], [01-Apr-25 · PIN: 385001],
  [02], [Jaimin Corporation], [Near Cozy Tower, \#476/44, Palanpur], [Ph: 253-786432 · Mob: 7046015169 · ccfabric\@gmail.com], [01-Apr-25 · PIN: 385001],
  [03], [Maheshwari Enterprises], [Jindal Road, Sarkanda, Bsnl Road, Palanpur], [Ph: 252-537777 · Mob: 7046015165 · maheshwari\@gmail.com], [01-Apr-25 · PIN: 385001],
  [04], [Agwan Company], [New Road, Exchange Office, Old Tower Road, Palanpur], [Ph: 252-537123 · Mob: 7046015157 · agwan\@gmail.com], [01-Apr-25 · PIN: 385001],
  [05], [TATA Communication], [\#413/25, Nayi Sadak, Ahmedabad, Gujarat], [Ph: 252-537789 · Mob: 7046015123 · tata\@gmail.com], [01-Apr-25 · PIN: 385555]
)

#v(6pt)

=== Mandatory Practical Exercises on Above Companies:
1. *Company Alteration Drill 1 (Jaimin Corporation):*
   - Change Address to: `\#403/2, Pariwar Mangalam, Old Bus Stop, Deesa Highway, Palanpur`.
   - Update PIN Code to: `385002`. Update Mobile to: `1234567890`. Save with #key-pill("Ctrl + A").
2. *Company Alteration Drill 2 (Ravi Private Limited):*
   - Change Company Legal Name to: `Ravi Private Limited (FY 25-26)`.
   - Update Website to: `www.raviindia.com`. Update Mobile to: `9999999990`.
3. *Company Deletion Drill:*
   - Create a dummy test company named `Delete Me Co.`.
   - Navigate to #key-pill("Alt + K") > *Alter*, open `Delete Me Co.`, press #key-pill("Alt + D"), and verify permanent deletion.

#v(6pt)


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


== 7.7 Tally Vault AES Encryption & Lost Password Protocol
Tally Vault utilizes standard Advanced Encryption Standard (AES) with a 128-bit key. 
- *Database Transformation:* When Tally Vault is enabled, company data files (`Company.900`, `Trans.900`) are encrypted at the sector level. File names are obfuscated, and the company name in the Tally directory is replaced with a unique 5-digit ID (e.g., `10008`).
- *Security Mandate:* Because Tally Solutions maintains a zero-knowledge architecture, no master backdoors exist. If an administrator loses a Tally Vault password, the database is permanently rendered unreadable. Always document vault keys in secure corporate key-management vaults!

#v(6pt)


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


== 7.9 Statutory MCA Audit Trail (Edit Log) Compliance Mandate
Under notification *GSR 235(E)* issued by the Ministry of Corporate Affairs (MCA), with effect from 1st April 2023, every company registered under the Companies Act 2013 must use accounting software featuring an unalterable audit trail:
- *Tally Prime Edit Log Edition:* Tally Solutions offers a specialized release titled *TallyPrime Edit Log*. In this release, the audit trail feature is hard-coded and cannot be disabled under any circumstances, even by the company administrator.
- *Tracking Every Change:* When an accounts clerk edits an invoice, changes a ledger amount, or deletes a voucher, Tally logs:
  1. The exact timestamp of the modification.
  2. The username of the operator who executed the change.
  3. The previous field values alongside the new altered values.
- *Auditor's Statutory Report (CARO):* Company statutory auditors must explicitly certify in their annual audit report whether the client operated accounting software with an unbroken audit trail throughout the financial year!

#v(6pt)

== 7.9 Summary & Key Revision Takeaways
- *Creation Prerequisite:* Company creation is the gateway to Tally Prime accounting. State selection (Gujarat Code 24) is paramount for accurate GST calculations.
- *Alteration vs Deletion:* Press #key-pill("Alt + K") > *Alter* to update details. Press #key-pill("Alt + D") on the Alteration screen to delete permanently.
- *Security Prudence:* Use Security Control for multi-user role segregation. Use Tally Vault for cryptographic confidentiality, but never lose the password!

#v(6pt)

== 7.10 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [Which keyboard shortcut opens the Company Menu in Tally Prime?\\
  (A) Alt+C (B) Alt+K (C) Ctrl+K (D) Alt+F3], [*Correct: (B) Alt+K*\\
  Alt+K is the universal top-bar Company menu shortcut in Tally Prime.],
  [02], [How many digits are assigned to a company data folder in Tally Prime?\\
  (A) 4 Digits (B) 5 Digits (C) 6 Digits (D) 8 Digits], [*Correct: (B) 5 Digits (e.g., 10000, 10001)*\\
  Tally assigns sequential 5-digit numbered folders on the hard drive.],
  [03], [Which key combination is pressed on the Company Alteration screen to delete a company?\\
  (A) Ctrl+D (B) Alt+X (C) Alt+D (D) Shift+Delete], [*Correct: (C) Alt+D*\\
  Alt+D deletes any master, ledger, voucher, or company when in alter mode.],
  [04], [In India, what is the standard statutory date for Financial Year Beginning?\\
  (A) 01-Jan (B) 01-Apr (C) 01-Jul (D) 01-Oct], [*Correct: (B) 01-Apr*\\
  Under Indian tax law, the financial year runs from 1st April to 31st March.],
  [05], [Why is accurate State selection mandatory during Company Creation in Tally Prime?\\
  (A) Sets font language (B) Determines CGST/SGST vs IGST\\
  (C) Sets system clock (D) Controls backup frequency], [*Correct: (B) Determines CGST/SGST vs IGST*\\
  Tally matches the company state with the customer state to determine tax type.],
  [06], [What happens to a company name in the Select Company list when protected by Tally Vault?\\
  (A) Highlighted in red (B) Hidden as asterisks (\\*\\*\\*\\*\\*) with a number\\
  (C) Moved to recycle bin (D) Exported to PDF], [*Correct: (B) Hidden as asterisks (\\*\\*\\*\\*\\*) with a number*\\
  Tally Vault conceals the company name to prevent identification by unauthorized users.],
  [07], [What happens if an accountant forgets the Tally Vault password?\\
  (A) OTP sent to registered mobile (B) Password reset by Admin\\
  (C) Data is permanently unrecoverable (D) Auto-unlocks after 24 hours], [*Correct: (C) Data is permanently unrecoverable*\\
  Due to strong AES encryption, lost Tally Vault passwords cannot be recovered.],
  [08], [Which shortcut switches between already opened companies in Tally Prime?\\
  (A) F1 (B) F2 (C) F3 (D) Alt+F3], [*Correct: (C) F3 (Select Company)*\\
  F3 allows accountants to switch between loaded companies instantaneously.],
  [09], [Which feature allows an administrator to prevent junior staff from altering back-dated vouchers?\\
  (A) Tally Audit & Back-dated Lock (B) Tally Vault\\
  (C) F11 GST (D) Data Split], [*Correct: (A) Tally Audit & Back-dated Lock*\\
  Security Control allows setting a cutoff date beyond which vouchers cannot be edited.],
  [10], [Can a company's financial year beginning date be altered once transactions are recorded?\\
  (A) Yes, anytime (B) No, alters chronological integrity\\
  (C) Only with CA approval (D) Only in Gold edition], [*Correct: (B) No, alters chronological integrity*\\
  Once transactions are recorded, financial year beginning cannot be moved arbitrarily.]
)

#v(6pt)

== 7.11 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain the critical operational distinction between *Financial Year Beginning From* and *Books Beginning From*.\\
  *Model Answer:* *Financial Year Beginning From* is the official statutory tax year (always 1st April in India). *Books Beginning From* is the actual date on which the enterprise started operating or commenced recording computerized accounts in Tally Prime (e.g., if a new business opens on 1st November 2025, FY is 01-Apr-2025 but Books Beginning is 01-Nov-2025).
- *Viva Q2:* How does Tally Prime determine whether to calculate CGST + SGST or IGST automatically during voucher entry?\\
  *Model Answer:* Tally Prime compares the *State* specified in the Company Creation profile with the *State* specified in the Party Ledger (Customer or Supplier). If both states match (e.g., both are Gujarat), it triggers Intrastate CGST + SGST. If the states differ, it triggers Interstate IGST.
- *Viva Q3:* What precautions must an accountant take before executing a company deletion with Alt+D?\\
  *Model Answer:* Because deletion via Alt+D permanently erases the physical database folder from the hard disk with zero recovery option, the accountant must first perform a full company backup via #key-pill("Alt + Y") > *Backup* to an external drive or cloud storage.
- *Hands-On Lab Task:* In Tally Prime, create Company 1 (*Ravi Private Limited*) using the exact specifications in Section 7.5. Press #key-pill("F11") to inspect Company Features, enable GST with Gujarat State Code `24`, and verify that the 5-digit company folder number appears correctly in the data path.
"""
    return chapters
