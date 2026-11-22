# -*- coding: utf-8 -*-
"""
Full English Curriculum Module Generator for Tally Prime Master Publication
Part 2: Topics 4 to 7 (Expanded for 50-60 Page Commercial Edition)
Standardized by Rahul Patel (Founder, RTechLab / IANT Palanpur)
Direct Contact: rahul.28e1@gmail.com
"""

def append_chapters_4_to_7(chapters):
    # =========================================================================
    # TOPIC 04
    # =========================================================================
    chapters[4] = """
= Topic 04: Ledgers, Types of Accounts & Golden Rules of Accounting

== 4.1 What is a Ledger in Accounting?
In double-entry financial accounting, a *Ledger* is the principal book or permanent computerized record that aggregates all financial transactions pertaining to a specific individual, vendor, customer, asset, liability, expense, or revenue head. 

Without ledgers, financial statements cannot be prepared. While a Journal chronologically records daily commercial events, the Ledger categorizes those events into dedicated individual accounts. In Tally Prime, every single transaction requires at least two ledgers: one ledger to be debited (*Dr.*) and another ledger to be credited (*Cr.*).

By default, when a new company is created, Tally Prime automatically creates exactly *two predefined ledgers*:
1. *Cash A/c:* Grouped under *Cash-in-hand* (represents physical liquid currency).
2. *Profit & Loss A/c:* Grouped directly under *Primary* (accumulates net operating earnings and retains capital balances).
All other ledgers—such as Bank accounts, Suppliers, Customers, Sales, Purchases, and Expenses—must be created by the accountant.

#v(6pt)

== 4.2 The Fundamental Accounting Equation
Every double-entry transaction maintains mathematical equilibrium across the balance sheet, expressed through the *Fundamental Accounting Equation*:

$ "Assets" = "Liabilities" + "Capital" $

When the proprietor introduces capital, Cash (Asset) increases, and Capital (Owner's Equity) increases equally. When goods are bought on credit, Stock (Asset) increases, and Sundry Creditors (Liability) increases. Every debit entry is matched by an equal credit entry, ensuring the Trial Balance始终 maintains perfect balance!

#v(6pt)

== 4.3 The Three Fundamental Classes of Accounts & The 3 Golden Rules
Modern accounting traces its foundation to the Italian mathematician *Fra Luca Pacioli* (1494), who formalized the Double Entry System. All commercial transactions are classified into three universal classes of accounts, each governed by its inviolable *Golden Rule*:

#table(
  columns: (1.2fr, 1.4fr, 1.3fr, 2.1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Account Class]], [#text(weight: "bold", fill: white)[Definition & Coverage]], [#text(weight: "bold", fill: white)[Inviolable Golden Rule]], [#text(weight: "bold", fill: white)[Corporate Examples]],
  [1. Personal Account], [Relates to legal persons, individuals, corporate firms, banks, and institutions.], [*Debit the Receiver*\\ *Credit the Giver*], [Ravi Private Ltd, Ram & Co., HDFC Bank, SBI Bank, Salman's Capital, Drawings A/c.],
  [2. Real Account], [Relates to tangible and intangible assets and property owned by the business entity.], [*Debit what Comes In*\\ *Credit what Goes Out*], [Cash, Office Furniture, Plant & Machinery, Delivery Vans, Computers, Patents, Trademarks.],
  [3. Nominal Account], [Relates to business operating expenses, losses, revenues, gains, and commissions.], [*Debit all Expenses & Losses*\\ *Credit all Incomes & Gains*], [Office Rent, Staff Salary, Electricity Expenses, Consulting Fees, Commission Earned, Interest Income.]
)

#v(6pt)

== 4.4 Practical Proof: 30 Detailed Dr/Cr Transaction Analyses
To master ledger creation, an accountant must analyze which two accounts are affected and apply the corresponding Golden Rule:

#table(
  columns: (0.4fr, 2.3fr, 1.2fr, 1.1fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Commercial Transaction]], [#text(weight: "bold", fill: white)[Accounts Affected]], [#text(weight: "bold", fill: white)[Account Class]], [#text(weight: "bold", fill: white)[Debit / Credit]],
  [1], [Proprietor started business with cash ₹5,00,000], [Cash A/c\\ Capital A/c], [Real\\ Personal], [Dr. Cash (Comes in)\\ Cr. Capital (Giver)],
  [2], [Opened current account in HDFC Bank depositing ₹1,00,000 cash], [HDFC Bank A/c\\ Cash A/c], [Personal\\ Real], [Dr. HDFC Bank (Receiver)\\ Cr. Cash (Goes out)],
  [3], [Purchased office furniture for ₹25,000 paying by HDFC cheque], [Furniture A/c\\ HDFC Bank A/c], [Real\\ Personal], [Dr. Furniture (Comes in)\\ Cr. HDFC Bank (Giver)],
  [4], [Purchased goods for cash ₹40,000], [Purchase A/c\\ Cash A/c], [Nominal / Real\\ Real], [Dr. Purchase (Expense)\\ Cr. Cash (Goes out)],
  [5], [Purchased goods on credit from Krishi Beej Bhandar ₹50,000], [Purchase A/c\\ Krishi Beej Bhandar], [Nominal\\ Personal], [Dr. Purchase (Expense)\\ Cr. Supplier (Giver)],
  [6], [Sold goods for cash ₹35,000], [Cash A/c\\ Sales A/c], [Real\\ Nominal], [Dr. Cash (Comes in)\\ Cr. Sales (Income)],
  [7], [Sold goods on credit to Shivam Traders ₹60,000], [Shivam Traders A/c\\ Sales A/c], [Personal\\ Nominal], [Dr. Customer (Receiver)\\ Cr. Sales (Income)],
  [8], [Paid office rent ₹15,000 by HDFC cheque], [Rent Expense A/c\\ HDFC Bank A/c], [Nominal\\ Personal], [Dr. Rent (Expense)\\ Cr. HDFC Bank (Giver)],
  [9], [Paid staff salaries ₹20,000 in cash], [Salary Expense A/c\\ Cash A/c], [Nominal\\ Real], [Dr. Salary (Expense)\\ Cr. Cash (Goes out)],
  [10], [Received consulting fees ₹75,000 by NEFT in HDFC Bank], [HDFC Bank A/c\\ Consulting Income A/c], [Personal\\ Nominal], [Dr. HDFC Bank (Receiver)\\ Cr. Consulting (Income)],
  [11], [Withdrew ₹10,000 cash from HDFC Bank for office use], [Cash A/c\\ HDFC Bank A/c], [Real\\ Personal], [Dr. Cash (Comes in)\\ Cr. HDFC Bank (Giver)],
  [12], [Proprietor withdrew ₹5,00,0 cash for personal domestic use], [Drawings A/c\\ Cash A/c], [Personal\\ Real], [Dr. Drawings (Receiver)\\ Cr. Cash (Goes out)],
  [13], [Paid electricity bill ₹4,500 in cash], [Electricity Expense A/c\\ Cash A/c], [Nominal\\ Real], [Dr. Electricity (Expense)\\ Cr. Cash (Goes out)],
  [14], [Received ₹50,000 cheque from Shivam Traders against invoice], [HDFC Bank A/c\\ Shivam Traders], [Personal\\ Personal], [Dr. HDFC Bank (Receiver)\\ Cr. Shivam (Giver)],
  [15], [Paid ₹45,000 cheque to Krishi Beej Bhandar in settlement], [Krishi Beej Bhandar\\ HDFC Bank A/c], [Personal\\ Personal], [Dr. Supplier (Receiver)\\ Cr. HDFC Bank (Giver)],
  [16], [Purchased computer printer for ₹8,500 in cash], [Computer & Printer A/c\\ Cash A/c], [Real\\ Real], [Dr. Asset (Comes in)\\ Cr. Cash (Goes out)],
  [17], [Paid internet charges to GTPL ₹5,900 by cash], [Internet Expense A/c\\ Cash A/c], [Nominal\\ Real], [Dr. Internet (Expense)\\ Cr. Cash (Goes out)],
  [18], [Received commission ₹12,000 by cheque deposited in HDFC], [HDFC Bank A/c\\ Commission Income A/c], [Personal\\ Nominal], [Dr. HDFC Bank (Receiver)\\ Cr. Commission (Income)],
  [19], [HDFC Bank deducted bank charges ₹590 from account], [Bank Charges A/c\\ HDFC Bank A/c], [Nominal\\ Personal], [Dr. Bank Charges (Expense)\\ Cr. HDFC Bank (Giver)],
  [20], [Charged 10% depreciation on office furniture ₹2,500], [Depreciation Expense A/c\\ Furniture Asset A/c], [Nominal\\ Real], [Dr. Depreciation (Loss)\\ Cr. Furniture (Value decreases)],
  [21], [Purchased trading goods ₹1,00,000 with 18% GST (CGST 9% + SGST 9%)], [Purchase A/c, Input CGST, Input SGST\\ Vendor A/c], [Nominal, Current Asset\\ Personal], [Dr. Purchase 1L, Dr. CGST 9k, Dr. SGST 9k\\ Cr. Vendor 1.18L],
  [22], [Sold goods ₹1,50,000 with 18% GST to client on credit], [Debtor A/c\\ Sales A/c, Output CGST, Output SGST], [Personal\\ Nominal, Liability], [Dr. Debtor 1.77L\\ Cr. Sales 1.5L, Cr. CGST 13.5k, Cr. SGST 13.5k],
  [23], [Booked professional audit fee ₹50,000 deducting 10% TDS (194J)], [Audit Fee A/c\\ CA Firm A/c, TDS Payable], [Nominal\\ Personal, Liability], [Dr. Audit Fee 50k\\ Cr. CA Firm 45k, Cr. TDS 5k],
  [24], [Deposited TDS of ₹5,000 via Challan 281 through HDFC Bank], [TDS Payable A/c\\ HDFC Bank A/c], [Liability\\ Personal], [Dr. TDS Payable 5k\\ Cr. HDFC Bank 5k],
  [25], [Customer bad debt written off as irrecoverable ₹8,000], [Bad Debts Expense A/c\\ Debtor A/c], [Nominal\\ Personal], [Dr. Bad Debts (Loss)\\ Cr. Debtor (Asset reduced)],
  [26], [Recovered ₹4,000 cash from previously written-off debtor], [Cash A/c\\ Bad Debts Recovered A/c], [Real\\ Nominal], [Dr. Cash (Comes in)\\ Cr. Bad Debts Recovered (Income)],
  [27], [Paid fire insurance premium ₹12,000 for 12 months by cheque], [Prepaid Insurance A/c\\ HDFC Bank A/c], [Asset\\ Personal], [Dr. Prepaid Insurance (Asset)\\ Cr. HDFC Bank (Giver)],
  [28], [Accrued interest on Fixed Deposit ₹3,500 due but not yet received], [Accrued Interest A/c\\ Interest Income A/c], [Asset\\ Nominal], [Dr. Accrued Interest (Asset)\\ Cr. Interest (Income)],
  [29], [Goods destroyed by accidental warehouse fire ₹15,000], [Loss by Fire A/c\\ Purchase A/c], [Nominal\\ Nominal / Real], [Dr. Loss by Fire (Loss)\\ Cr. Purchase (Stock reduced)],
  [30], [Settled supplier bill of ₹10,000 by paying ₹9,700 cash (₹300 discount)], [Supplier A/c\\ Cash A/c, Discount Received], [Personal\\ Real, Nominal], [Dr. Supplier 10k\\ Cr. Cash 9.7k, Cr. Discount 300]
)

#v(6pt)

== 4.5 The 50-Transaction Corporate Practice Set (Mr. Verma Enterprise)
To build real industry confidence, every trainee must record the complete, authentic 50-transaction workflow of *Mr. Verma Enterprise* standardized from Rahul Sir's corporate training curriculum:

#table(
  columns: (0.4fr, 3fr, 1.2fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Practical Business Transaction Description]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Target Voucher]],
  [01], [Mr. Verma opened a current account in HDFC Bank depositing cash], [1,00,000.00], [F4 Contra],
  [02], [Paid office rent by HDFC cheque to Landlord], [2,500.00], [F5 Payment],
  [03], [Paid miscellaneous office expenses in cash], [150.00], [F5 Payment],
  [04], [Received consulting fees by cash from client], [96,000.00], [F6 Receipt],
  [05], [Paid electricity bill by HDFC cheque], [9,500.00], [F5 Payment],
  [06], [Deposited surplus cash into HDFC Bank], [30,000.00], [F4 Contra],
  [07], [Paid vendor Raj & Co. towards outstanding balance], [11,500.00], [F5 Payment],
  [08], [Paid office telephone and broadband expense by cheque], [7,500.00], [F5 Payment],
  [09], [Received IT consulting fee from overseas client via wire transfer], [1,50,000.00], [F6 Receipt],
  [10], [Received annual maintenance service charges by cheque], [15,000.00], [F6 Receipt],
  [11], [Purchased GTPL broadband fiber connection for office in cash], [5,900.00], [F5 Payment],
  [12], [Paid salary to office assistant Ramesh in cash], [1,000.00], [F5 Payment],
  [13], [Received cash from Shah & Co. towards previous dues], [1,200.00], [F6 Receipt],
  [14], [Paid mobile phone corporate connection bill in cash], [3,500.00], [F5 Payment],
  [15], [Transferred funds from HDFC Bank to Bank of Baroda account], [60,000.00], [F4 Contra],
  [16], [Bank charges debited by HDFC Bank for cheque book issuance], [5,000.00], [F5 Payment],
  [17], [Paid electricity maintenance charges in cash], [850.00], [F5 Payment],
  [18], [Received cheque from Alfatech Solutions towards services], [30,000.00], [F6 Receipt],
  [19], [Paid Rehana for content creation services by cheque], [1,500.00], [F5 Payment],
  [20], [Paid Raj Travels for employee corporate conveyance by cheque], [10,000.00], [F5 Payment],
  [21], [Raised service tax invoice on MediaLive Productions for media work], [50,000.00], [F8 Sales (Accounting)],
  [22], [Paid factory electricity bill in cash], [21,750.00], [F5 Payment],
  [23], [Received travel invoice from Raj Travels (₹3,150 cab + ₹4,450 tours)], [7,600.00], [F9 Purchase],
  [24], [Deposited cash into HDFC Bank account], [75,000.00], [F4 Contra],
  [25], [Paid mobile recharge bill by cheque], [1,470.00], [F5 Payment],
  [26], [Received term loan sanction from SBI Bank credited to account], [2,00,000.00], [F6 Receipt],
  [27], [Paid office deep cleaning services by cheque], [3,000.00], [F5 Payment],
  [28], [Paid office refreshments and tea pantry supplies in cash], [800.00], [F5 Payment],
  [29], [Received sales commission income by cheque], [50,000.00], [F6 Receipt],
  [30], [Paid office executive furniture invoice by cheque], [6,000.00], [F5 Payment],
  [31], [Withdrew cash from HDFC Bank for office petty cash use], [25,000.00], [F4 Contra],
  [32], [Paid vendor Ram & Co. by cheque], [13,000.00], [F5 Payment],
  [33], [Paid newspaper and digital advertising expenses by cheque], [9,000.00], [F5 Payment],
  [34], [Received management consultancy fees by cheque], [75,000.00], [F6 Receipt],
  [35], [Received server maintenance charges by cheque], [20,000.00], [F6 Receipt],
  [36], [Purchased laser printer for office use in cash], [7,000.00], [F5 Payment],
  [37], [Paid salary to Suresh in cash], [2,000.00], [F5 Payment],
  [38], [Received cash from client Gupta & Co.], [3,000.00], [F6 Receipt],
  [39], [Paid office internet lease line bill by cheque], [5,000.00], [F5 Payment],
  [40], [Transferred funds from HDFC Bank to ICICI Bank account], [50,000.00], [F4 Contra],
  [41], [Paid ICICI Bank annual account maintenance charges], [4,000.00], [F5 Payment],
  [42], [Paid office sanitization charges in cash], [1,200.00], [F5 Payment],
  [43], [Received cheque from Tech Solutions against service invoice], [40,000.00], [F6 Receipt],
  [44], [Paid Meena for design consultancy by cheque], [1,800.00], [F5 Payment],
  [45], [Paid Patel Travels by cheque for corporate outstation tour], [15,000.00], [F5 Payment],
  [46], [Raised service invoice on TechWorld for web portal engineering], [60,000.00], [F8 Sales (Accounting)],
  [47], [Paid office godown rent in cash], [25,000.00], [F5 Payment],
  [48], [Proprietor introduced additional capital in cash], [1,50,000.00], [F6 Receipt],
  [49], [Raised consulting invoice on Kabir & Sons], [25,000.00], [F8 Sales (Accounting)],
  [50], [Withdrew cash from bank for proprietor personal medical expenses], [7,000.00], [F4 / F5 Payment]
)

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 04 SUMMARY & KEY REVISION TAKEAWAYS]
    - A Ledger is the permanent record aggregating financial transactions under an individual identity or head.
    - Accounting Equation: $"Assets" = "Liabilities" + "Capital"$. Every debit entry must equal its corresponding credit.
    - Tally Prime auto-creates *Cash* (Cash-in-hand) and *Profit & Loss A/c* (Primary) upon company creation.
    - The 3 Golden Rules: Personal (Dr Receiver, Cr Giver); Real (Dr Comes in, Cr Goes out); Nominal (Dr Expenses & Losses, Cr Incomes & Gains).
    - Mastering the 50-transaction *Mr. Verma Enterprise* workflow equips an accountant to record any commercial business scenario.
  ]
)

#v(8pt)

// MCQS
== Topic 04: High-Yield Exam & Interview MCQs

1. *Which two ledgers are automatically created by Tally Prime upon creating a new company?*\\
   (A) Sales and Purchase #h(10pt) (B) Cash and Profit & Loss #h(10pt) (C) Bank and Cash #h(10pt) (D) Capital and Drawings\\
   *Answer: (B)* | *Explanation:* Tally Prime creates Cash and Profit & Loss accounts by default in every company.

2. *What is the Golden Rule for a Personal Account?*\\
   (A) Debit what comes in, Credit what goes out #h(10pt) (B) Debit the Receiver, Credit the Giver\\
   (C) Debit all expenses, Credit all incomes #h(10pt) (D) Debit assets, Credit liabilities\\
   *Answer: (B)* | *Explanation:* Personal accounts represent entities; the receiver is debited and the giver is credited.

3. *Rent paid to a landlord falls under which class of account?*\\
   (A) Personal Account #h(10pt) (B) Real Account #h(10pt) (C) Nominal Account #h(10pt) (D) Representative Account\\
   *Answer: (C)* | *Explanation:* Rent is an operating business expenditure, classified as a Nominal Account.

4. *Office furniture purchased for cash is an example of which account class?*\\
   (A) Nominal Account #h(10pt) (B) Real Account #h(10pt) (C) Personal Account #h(10pt) (D) Debtors Account\\
   *Answer: (B)* | *Explanation:* Furniture is a tangible property/asset owned by the business, making it a Real Account.

5. *When Mr. Verma deposits ₹30,000 cash into HDFC Bank, which ledger account is credited?*\\
   (A) HDFC Bank A/c #h(10pt) (B) Cash A/c #h(10pt) (C) Capital A/c #h(10pt) (D) Suspense A/c\\
   *Answer: (B)* | *Explanation:* Real account rule: Credit what goes out. Cash goes out of the cash box into the bank.

6. *Drawings Account (money withdrawn by the owner for personal domestic use) is classified as:*\\
   (A) Nominal Account #h(10pt) (B) Real Account #h(10pt) (C) Personal Account #h(10pt) (D) Asset Account\\
   *Answer: (C)* | *Explanation:* Drawings represents the individual proprietor/owner, hence it is a Personal Account.

7. *Who formalized the modern Double Entry Bookkeeping system in 1494?*\\
   (A) Adam Smith #h(10pt) (B) Fra Luca Pacioli #h(10pt) (C) John Maynard Keynes #h(10pt) (D) Bharat Goenka\\
   *Answer: (B)* | *Explanation:* Fra Luca Pacioli published the foundational principles of double-entry bookkeeping in Venice.

8. *If a business receives ₹50,000 commission by cheque, which account is debited?*\\
   (A) Commission Income A/c #h(10pt) (B) Bank A/c #h(10pt) (C) Cash A/c #h(10pt) (D) Capital A/c\\
   *Answer: (B)* | *Explanation:* The receiving bank account is debited as the receiver of the funds.

9. *In the fundamental accounting equation (Assets = Liabilities + Capital), if assets increase by ₹50,000 without liability change, what happens to Capital?*\\
   (A) Decreases by ₹50,000 #h(10pt) (B) Increases by ₹50,000 #h(10pt) (C) Remains unchanged #h(10pt) (D) Doubled\\
   *Answer: (B)* | *Explanation:* By equation equilibrium, an increase in assets directly increases owner's capital.

10. *Under which class of account is 'Input CGST' or 'Output SGST' classified?*\\
    (A) Real Account #h(10pt) (B) Personal Account (Government) #h(10pt) (C) Nominal Account #h(10pt) (D) Fictitious Account\\
    *Answer: (B)* | *Explanation:* Tax accounts represent liabilities or receivables vis-a-vis the Government tax department (Personal).

#v(6pt)

// VIVA & LAB
== Topic 04: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* State the difference between Real and Nominal accounts with two commercial examples of each.\\
  *Answer:* Real accounts represent tangible assets owned by the firm (e.g., Cash, Machinery). Nominal accounts represent expenses, losses, revenues, and gains (e.g., Salary Paid, Interest Received).
- *Viva Q2:* Why is the Capital Account treated as a Personal Account rather than a Liability Account?\\
  *Answer:* Under the Business Entity Concept, the owner is legally distinct from the enterprise. The Capital Account represents the owner as a person who gave funds to the business.
- *Hands-On Lab Task:* In Tally Prime, go to Gateway of Tally > *Create > Ledger*, and create three ledgers: *HDFC Bank* under *Bank Accounts*, *Office Rent* under *Indirect Expenses*, and *Ram & Co.* under *Sundry Creditors*.
"""

    # =========================================================================
    # TOPIC 05
    # =========================================================================
    chapters[5] = """
= Topic 05: Vouchers & The 4 Major Voucher Categories (24 Vouchers)

== 5.1 What is a Voucher in Tally Prime?
In corporate accounting, a *Voucher* is an authentic, auditable electronic document that records a financial transaction, establishing the statutory paper trail required by company law and tax authorities. Every commercial transaction recorded in Tally Prime is executed through a specific voucher type tailored to the commercial nature of that event.

Tally Prime features *24 predefined voucher types* categorized into *4 core functional groups*.

#v(6pt)

== 5.2 The Four Primary Voucher Categories
#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Voucher Category]], [#text(weight: "bold", fill: white)[Primary Operational Scope]], [#text(weight: "bold", fill: white)[Voucher Types Included & Key Functions]],
  [1. Accounting Vouchers], [Record purely financial fund flows, cash/bank transfers, non-cash adjustments, and billing.], [Contra (F4), Payment (F5), Receipt (F6), Journal (F7), Sales (F8), Purchase (F9).],
  [2. Inventory Vouchers], [Track physical movement, location transfer, and quantity adjustments of goods.], [Stock Journal (Alt+F7), Physical Stock (Ctrl+F7), Rejections In (Ctrl+F6), Rejections Out (Alt+F6).],
  [3. Order Vouchers], [Record commercial purchase and sales commitments before physical goods move.], [Sales Order (Ctrl+F8), Purchase Order (Ctrl+F9), Delivery Note (Alt+F8), Receipt Note (Alt+F9).],
  [4. Non-Accounting / Memos], [Temporary, conditional, or memorandum records that do not impact final financial books.], [Memorandum Voucher, Reversing Journal.]
)

#v(6pt)

== 5.3 Complete Master Reference Table: All 24 Vouchers in Tally Prime
#table(
  columns: (0.4fr, 1.4fr, 1.1fr, 1.1fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Voucher Type]], [#text(weight: "bold", fill: white)[Shortcut Key]], [#text(weight: "bold", fill: white)[Category]], [#text(weight: "bold", fill: white)[Commercial Usage & Accounting Impact]],
  [01], [Contra Voucher], [#key-pill("F4")], [Accounting], [Fund transfers between Cash and Bank or between two Bank accounts.],
  [02], [Payment Voucher], [#key-pill("F5")], [Accounting], [Payments made for expenses, vendor settlements, or asset purchases via cash/bank.],
  [03], [Receipt Voucher], [#key-pill("F6")], [Accounting], [Monies received from customers, capital introduction, or incomes via cash/bank.],
  [04], [Journal Voucher], [#key-pill("F7")], [Accounting], [Non-cash adjustments: depreciation, bad debts, TDS deduction, and year-end entries.],
  [05], [Sales Voucher], [#key-pill("F8")], [Accounting], [Billing goods or services to customers on cash or credit terms.],
  [06], [Purchase Voucher], [#key-pill("F9")], [Accounting], [Inward billing of trading stock, consumables, or expenses from vendors.],
  [07], [Credit Note], [#key-pill("Alt + F6")], [Accounting], [Sales returns, rate rebates, or discounts allowed to customers.],
  [08], [Debit Note], [#key-pill("Alt + F5")], [Accounting], [Purchase returns, vendor rejections, or rate reductions received from suppliers.],
  [09], [Sales Order], [#key-pill("Ctrl + F8")], [Order], [Customer purchase orders accepted; establishes committed sales pipeline.],
  [10], [Purchase Order], [#key-pill("Ctrl + F9")], [Order], [Formal order placed on vendor specifying item, rate, delivery date.],
  [11], [Delivery Note], [#key-pill("Alt + F8")], [Order / Inv.], [Challan issued when goods are physically dispatched to buyer before invoice.],
  [12], [Receipt Note], [#key-pill("Alt + F9")], [Order / Inv.], [Inward goods receipt note (GRN) when stock arrives before supplier bill.],
  [13], [Stock Journal], [#key-pill("Alt + F7")], [Inventory], [Transfer of goods between godowns, or manufacturing raw materials into finished stock.],
  [14], [Physical Stock], [#key-pill("Ctrl + F7")], [Inventory], [Recording physical stock counts during audit to adjust book variances.],
  [15], [Rejections In], [#key-pill("Ctrl + F6")], [Inventory], [Defective goods returned by customer prior to raising a sales invoice.],
  [16], [Rejections Out], [#key-pill("Alt + F6")], [Inventory], [Defective goods returned to vendor prior to raising a purchase invoice.],
  [17], [Memorandum (Memo)], [#key-pill("F10 > Memo")], [Memo], [Suspense or temporary transactions not yet affecting final financial statements.],
  [18], [Reversing Journal], [#key-pill("F10 > Rev Jnl")], [Memo], [Entries recorded on specific audit dates that automatically reverse next day.],
  [19], [Job Work In Order], [#key-pill("Ctrl + F8")], [Job Work], [Processing third-party raw materials on job-work contract basis.],
  [20], [Job Work Out Order], [#key-pill("Ctrl + F9")], [Job Work], [Dispatching company materials to external processors for job operations.],
  [21], [Material In], [#key-pill("Ctrl + W")], [Job Work], [Receiving processed components back from external job-work contractor.],
  [22], [Material Out], [#key-pill("Alt + W")], [Job Work], [Dispatching components to subcontractor job-work unit.],
  [23], [Payroll Voucher], [#key-pill("Ctrl + F4")], [Payroll], [Processing monthly employee salary sheets, PF, ESI, and professional tax.],
  [24], [Attendance Voucher], [#key-pill("Ctrl + F5")], [Payroll], [Recording present days, overtime hours, and production units for employees.]
)

#v(6pt)

== 5.4 Single Entry Mode vs Double Entry Mode in Vouchers
In Tally Prime, accountants can toggle between two data entry modes using #key-pill("Ctrl + H"):

#table(
  columns: (1.3fr, 1.8fr, 1.9fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Operational Feature]], [#text(weight: "bold", fill: white)[Single Entry Mode]], [#text(weight: "bold", fill: white)[Double Entry Mode (Dr / Cr)]],
  [Account Header], [Top field specifies the Cash or Bank account paying/receiving.], [No header; every line item explicitly selects Dr or Cr.],
  [Speed & Simplicity], [Faster for bulk payments or cash registers; fewer keystrokes.], [Mandatory for complex split transactions, journals, and audit transparency.],
  [Applicable Vouchers], [Available exclusively for Contra (F4), Payment (F5), Receipt (F6).], [Available across ALL voucher types (F4 to F9).],
  [Audit Best Practice], [Suitable for daily petty cash entries and retail counters.], [Universal standard for Chartered Accountants and corporate accounts.]
)

#v(6pt)

== 5.5 Practical Voucher Walkthrough: Step-by-Step Recording
=== 1. Contra Voucher (#key-pill("F4"))
- *Purpose:* Used exclusively when money moves between Cash and Bank or between Bank and Bank.
- *Rule of Thumb:* Cash and Bank ledgers are the ONLY ledgers permitted in an F4 Contra voucher!
- *Example:* Deposited ₹20,000 cash into SBI Bank Account.
  - In Double Entry Mode: *Dr.* SBI Bank A/c ₹20,000 | *Cr.* Cash A/c ₹20,000.

=== 2. Payment Voucher (#key-pill("F5"))
- *Purpose:* Used when cash is disbursed or a cheque/online transfer is made from a bank account.
- *Example:* Paid office rent ₹10,000 by HDFC Bank cheque.
  - In Double Entry Mode: *Dr.* Office Rent Expense A/c ₹10,000 | *Cr.* HDFC Bank A/c ₹10,000.

=== 3. Receipt Voucher (#key-pill("F6"))
- *Purpose:* Used when funds enter the business via cash, cheque, NEFT, RTGS, or UPI.
- *Example:* Received ₹45,000 consulting fee from client in HDFC Bank.
  - In Double Entry Mode: *Dr.* HDFC Bank A/c ₹45,000 | *Cr.* Consulting Fees Income A/c ₹45,000.

=== 4. Journal Voucher (#key-pill("F7"))
- *Purpose:* The non-cash adjustment workhorse. Never involves Cash or Bank!
- *Example:* Providing 10% annual depreciation on computer equipment costing ₹50,000.
  - *Dr.* Depreciation Expense A/c ₹5,000 | *Cr.* Computer Asset A/c ₹5,000.

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 05 SUMMARY & KEY REVISION TAKEAWAYS]
    - Vouchers provide the auditable foundation for every commercial event in Tally Prime.
    - 4 Core Categories: Accounting (F4-F9), Inventory (Alt+F7, Ctrl+F7), Order Processing (Ctrl+F8/F9), Non-Accounting (Memo).
    - *Contra (#key-pill("F4"))* exclusively records Cash-to-Bank, Bank-to-Cash, and Bank-to-Bank transfers.
    - *Payment (#key-pill("F5"))* records cash/bank disbursements; *Receipt (#key-pill("F6"))* records cash/bank inflows.
    - *Journal (#key-pill("F7"))* records purely non-cash adjustments (depreciation, bad debts, TDS deductions).
    - Toggle between Single Entry and Double Entry modes using #key-pill("Ctrl + H").
  ]
)

#v(8pt)

// MCQS
== Topic 05: High-Yield Exam & Interview MCQs

1. *Which voucher is used when cash is deposited into or withdrawn from a bank account?*\\
   (A) Payment (F5) #h(10pt) (B) Receipt (F6) #h(10pt) (C) Contra (F4) #h(10pt) (D) Journal (F7)\\
   *Answer: (C)* | *Explanation:* Contra (F4) is reserved exclusively for fund movements between cash and bank accounts.

2. *Can a Cash ledger be debited or credited inside a standard Journal Voucher (F7)?*\\
   (A) Yes, always #h(10pt) (B) Only in Educational Mode #h(10pt) (C) No, Journal vouchers are strictly non-cash #h(10pt) (D) Only with F12\\
   *Answer: (C)* | *Explanation:* By accounting standard, Journal (F7) is designed for non-cash and non-bank adjustments.

3. *Which keyboard shortcut invokes the Credit Note voucher for sales returns in Tally Prime?*\\
   (A) Alt + F5 #h(10pt) (B) Alt + F6 #h(10pt) (C) Ctrl + F8 #h(10pt) (D) Ctrl + F6\\
   *Answer: (B)* | *Explanation:* Alt+F6 opens the Credit Note voucher; Alt+F5 opens the Debit Note voucher.

4. *What voucher type is used to record the physical movement of stock between two godowns?*\\
   (A) Physical Stock #h(10pt) (B) Stock Journal (Alt + F7) #h(10pt) (C) Delivery Note #h(10pt) (D) Purchase Voucher\\
   *Answer: (B)* | *Explanation:* Stock Journal (Alt+F7) records godown-to-godown stock transfers and manufacturing assembly.

5. *Which shortcut changes the voucher mode between Item Invoice, Accounting Invoice, and As Voucher?*\\
   (A) Alt + M #h(10pt) (B) Ctrl + H #h(10pt) (C) F12 #h(10pt) (D) Alt + V\\
   *Answer: (B)* | *Explanation:* Ctrl+H (Change Mode) switches layout modes across all transaction screens.

6. *When a customer returns damaged goods before an invoice is issued, which voucher is recorded?*\\
   (A) Rejections In (Ctrl + F6) #h(10pt) (B) Rejections Out #h(10pt) (C) Credit Note #h(10pt) (D) Purchase Return\\
   *Answer: (A)* | *Explanation:* Rejections In records goods returned by a customer prior to invoice generation.

7. *Which voucher type is used to record monthly staff salaries, PF, and employee allowances?*\\
   (A) Payment Voucher #h(10pt) (B) Payroll Voucher (Ctrl + F4) #h(10pt) (C) Attendance Voucher #h(10pt) (D) Contra Voucher\\
   *Answer: (B)* | *Explanation:* Payroll Voucher (Ctrl+F4) processes detailed salary slips with statutory deductions.

8. *What key is pressed to view 'Other Vouchers' not shown on the primary right-hand sidebar?*\\
   (A) F10 #h(10pt) (B) Alt + F10 #h(10pt) (C) Ctrl + F10 #h(10pt) (D) Esc\\
   *Answer: (A)* | *Explanation:* F10 displays the comprehensive list of all active and inactive voucher types.

9. *In Single Entry mode, which ledger appears in the top 'Account' header field of a Payment voucher?*\\
   (A) Expense Ledger #h(10pt) (B) Supplier Ledger #h(10pt) (C) Bank or Cash Ledger #h(10pt) (D) Capital Ledger\\
   *Answer: (C)* | *Explanation:* The Account header specifies the source disbursing cash or bank ledger.

10. *When goods are delivered to a buyer accompanied by a delivery challan prior to invoicing, which voucher is raised?*\\
    (A) Sales Voucher #h(10pt) (B) Delivery Note (Alt + F8) #h(10pt) (C) Material Out #h(10pt) (D) Stock Journal\\
    *Answer: (B)* | *Explanation:* Delivery Note (Alt+F8) records goods dispatched under challan before billing.

#v(6pt)

// VIVA & LAB
== Topic 05: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain the commercial difference between a Debit Note and a Credit Note.\\
  *Answer:* A Debit Note (Alt+F5) is issued to a vendor when returning defective purchased goods or demanding a price reduction. A Credit Note (Alt+F6) is issued to a customer acknowledging sales returns or granting price concessions.
- *Viva Q2:* When should an accountant record an entry in F7 Journal rather than F5 Payment?\\
  *Answer:* F5 Payment is used whenever cash or bank funds leave the business. F7 Journal is used when no liquid cash or bank transfer occurs—such as booking depreciation, writing off bad debts, or adjusting prepayments.
- *Hands-On Lab Task:* From Gateway of Tally, go to *Vouchers*, press #key-pill("F4") for Contra, and transfer ₹10,000 from *Cash* to *HDFC Bank*. Press #key-pill("Ctrl + A") to accept.
"""

    # =========================================================================
    # TOPIC 06
    # =========================================================================
    chapters[6] = """
= Topic 06: Groups & Complete Ledger Mapping System (28 Groups)

== 6.1 What is a Group in Tally Prime?
In Tally Prime, a *Group* is an organizational classification container that aggregates ledger accounts of identical accounting characteristics. Every ledger created in Tally Prime *must* belong to exactly one Group.

The group assigned to a ledger determines two critical financial outcomes:
1. *Financial Statement Destination:* Whether the ledger balance reflects in the *Balance Sheet* (as an Asset or Liability) or in the *Profit & Loss Account* (as Income or Expense).
2. *Calculation Behavior:* Whether the balance carries forward across financial years (Balance Sheet items) or closes out to Net Profit/Loss at the end of the year (Revenue/Expense items).

Tally Prime comes pre-configured with exactly *28 Predefined Groups*, divided into *15 Primary Groups* and *13 Secondary Groups (Sub-groups)*.

#v(6pt)

== 6.2 The 15 Primary Groups in Tally Prime
Primary groups form the top tier of the chart of accounts and report directly to either the Balance Sheet or Profit & Loss:

#table(
  columns: (0.4fr, 1.4fr, 1.2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Primary Group Name]], [#text(weight: "bold", fill: white)[Financial Destination]], [#text(weight: "bold", fill: white)[Accounting Nature & Scope]],
  [01], [Capital Account], [Balance Sheet (Liabilities)], [Proprietor/partner equity, share capital, and partner drawings.],
  [02], [Loans (Liability)], [Balance Sheet (Liabilities)], [Term borrowings, bank OD facilities, secured and unsecured debts.],
  [03], [Current Liabilities], [Balance Sheet (Liabilities)], [Short-term operating debts due within 12 months (creditors, taxes, bills payable).],
  [04], [Fixed Assets], [Balance Sheet (Assets)], [Long-term tangible assets used in business (land, machinery, furniture, vehicles).],
  [05], [Investments], [Balance Sheet (Assets)], [Surplus funds invested in shares, mutual funds, government bonds, or fixed deposits.],
  [06], [Current Assets], [Balance Sheet (Assets)], [Liquid assets convertible to cash within 12 months (debtors, cash, bank, stock).],
  [07], [Branch / Divisions], [Balance Sheet (Liabilities/Assets)], [Inter-branch current accounts tracking head-office to regional godown transfers.],
  [08], [Misc. Expenses (Asset)], [Balance Sheet (Assets)], [Fictitious assets and preliminary incorporation expenses written off over years.],
  [09], [Suspense Account], [Balance Sheet (Liabilities/Assets)], [Unidentified receipts or payments temporarily parked pending audit clarification.],
  [10], [Sales Accounts], [Profit & Loss (Income / Trading)], [Gross turnover from sale of trading stock, manufactured goods, and scrap.],
  [11], [Purchase Accounts], [Profit & Loss (Expenses / Trading)], [Cost of raw materials, trading merchandise, and inward freight purchases.],
  [12], [Direct Incomes], [Profit & Loss (Income / Trading)], [Revenues directly linked to factory output or core operations (e.g., job work charges).],
  [13], [Indirect Incomes], [Profit & Loss (Income)], [Non-operational business earnings (interest earned, discount received, rent received).],
  [14], [Direct Expenses], [Profit & Loss (Expenses / Trading)], [Expenses directly incurred in manufacturing or bringing goods to saleable condition (factory wages, power, freight inward).],
  [15], [Indirect Expenses], [Profit & Loss (Expenses)], [Administrative, selling, financial, and office overheads (rent, salaries, advertising, bank charges).]
)

#v(6pt)

== 6.3 The 13 Secondary Groups (Sub-Groups)
Secondary groups sit nested underneath primary groups to provide granular reporting:

#table(
  columns: (0.4fr, 1.5fr, 1.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Secondary Group]], [#text(weight: "bold", fill: white)[Parent Primary Group]], [#text(weight: "bold", fill: white)[Typical Ledgers Assigned]],
  [16], [Reserves & Surplus], [Capital Account], [General Reserve, Retained Earnings, Capital Reserve.],
  [17], [Bank OD / OCC A/c], [Loans (Liability)], [Bank Overdraft accounts, Cash Credit loan facilities.],
  [18], [Secured Loans], [Loans (Liability)], [Bank term loans against mortgage of factory or vehicles.],
  [19], [Unsecured Loans], [Loans (Liability)], [Borrowings from directors, friends, relatives without collateral.],
  [20], [Duties & Taxes], [Current Liabilities], [CGST, SGST, IGST, TDS Payable, TCS, Customs Duty.],
  [21], [Provisions], [Current Liabilities], [Provision for Income Tax, Provision for Depreciation.],
  [22], [Sundry Creditors], [Current Liabilities], [Suppliers and vendors from whom goods/services are bought on credit.],
  [23], [Bank Accounts], [Current Assets], [Commercial savings and current accounts in commercial banks.],
  [24], [Cash-in-hand], [Current Assets], [Main Cash Book, Branch Cash, Imprest Petty Cash fund.],
  [25], [Stock-in-hand], [Current Assets], [Opening and closing raw materials, WIP, and finished inventory.],
  [26], [Sundry Debtors], [Current Assets], [Clients and customers to whom goods/services are sold on credit.],
  [27], [Deposits (Asset)], [Current Assets], [Office rent deposit, electricity meter security deposit, telephone deposits.],
  [28], [Loans & Advances (Asset)], [Current Assets], [Salary advance to employees, advance to suppliers, GST input advance.]
)

#v(6pt)

== 6.4 Master Corporate Ledger-to-Group Mapping Directory (60+ Real Accounts)
Standardized from Rahul Sir's corporate accounting manual, this reference table maps 60 practical corporate ledgers to their exact predefined Tally groups:

#table(
  columns: (0.4fr, 2fr, 1.6fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.2pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Ledger Account Name]], [#text(weight: "bold", fill: white)[Correct Tally Prime Group]], [#text(weight: "bold", fill: white)[Statement]],
  [01], [Salman's Capital Account], [Capital Account], [Balance Sheet],
  [02], [Proprietor's Drawings Account], [Capital Account], [Balance Sheet],
  [03], [HDFC Bank Current Account], [Bank Accounts], [Balance Sheet],
  [04], [State Bank of India OD Account], [Bank OD A/c], [Balance Sheet],
  [05], [Petty Cash Imprest Fund], [Cash-in-hand], [Balance Sheet],
  [06], [Krishi Beej Bhandar (Supplier)], [Sundry Creditors], [Balance Sheet],
  [07], [Bayer Crop Science Ltd (Supplier)], [Sundry Creditors], [Balance Sheet],
  [08], [Shivam Traders (Customer)], [Sundry Debtors], [Balance Sheet],
  [09], [MediaLive Productions (Client)], [Sundry Debtors], [Balance Sheet],
  [10], [Factory Plant & Machinery], [Fixed Assets], [Balance Sheet],
  [11], [Executive Office Furniture], [Fixed Assets], [Balance Sheet],
  [12], [Commercial Delivery Van], [Fixed Assets], [Balance Sheet],
  [13], [Fixed Deposit in HDFC Bank], [Investments], [Balance Sheet],
  [14], [Equity Shares in Reliance Industries], [Investments], [Balance Sheet],
  [15], [Office Electricity Meter Deposit], [Deposits (Asset)], [Balance Sheet],
  [16], [Building Security Deposit to Landlord], [Deposits (Asset)], [Balance Sheet],
  [17], [Salary Advance to Staff Ramesh], [Loans & Advances (Asset)], [Balance Sheet],
  [18], [Output CGST @ 9%], [Duties & Taxes], [Balance Sheet],
  [19], [Output SGST @ 9%], [Duties & Taxes], [Balance Sheet],
  [20], [Output IGST @ 18%], [Duties & Taxes], [Balance Sheet],
  [21], [Input CGST @ 9%], [Duties & Taxes], [Balance Sheet],
  [22], [Input SGST @ 9%], [Duties & Taxes], [Balance Sheet],
  [23], [Input IGST @ 18%], [Duties & Taxes], [Balance Sheet],
  [24], [TDS Payable on Professional Fees (194J)], [Duties & Taxes], [Balance Sheet],
  [25], [TDS Payable on Contractor Works (194C)], [Duties & Taxes], [Balance Sheet],
  [26], [Provision for Corporate Income Tax], [Provisions], [Balance Sheet],
  [27], [Unsecured Loan from Director], [Unsecured Loans], [Balance Sheet],
  [28], [HDFC Bank Commercial Vehicle Loan], [Secured Loans], [Balance Sheet],
  [29], [General Reserve Account], [Reserves & Surplus], [Balance Sheet],
  [30], [Local Purchase GST @ 18%], [Purchase Accounts], [Trading A/c],
  [31], [Interstate Purchase IGST @ 18%], [Purchase Accounts], [Trading A/c],
  [32], [Exempted Purchase (0% GST)], [Purchase Accounts], [Trading A/c],
  [33], [Local Sales GST @ 18%], [Sales Accounts], [Trading A/c],
  [34], [Interstate Sales IGST @ 18%], [Sales Accounts], [Trading A/c],
  [35], [Exempted Sales (0% GST)], [Sales Accounts], [Trading A/c],
  [36], [Factory Worker Wages], [Direct Expenses], [Trading A/c],
  [37], [Freight Inward on Raw Materials], [Direct Expenses], [Trading A/c],
  [38], [Factory Power & Fuel Charges], [Direct Expenses], [Trading A/c],
  [39], [Customs Import Clearing Charges], [Direct Expenses], [Trading A/c],
  [40], [Office Staff Salaries], [Indirect Expenses], [Profit & Loss],
  [41], [Office Building Rent], [Indirect Expenses], [Profit & Loss],
  [42], [Broadband & Internet Charges (GTPL)], [Indirect Expenses], [Profit & Loss],
  [43], [Corporate Travel Expenses (Raj Travels)], [Indirect Expenses], [Profit & Loss],
  [44], [Bank Account Service Charges], [Indirect Expenses], [Profit & Loss],
  [45], [Advertising & Marketing Campaigns], [Indirect Expenses], [Profit & Loss],
  [46], [Annual Depreciation on Furniture], [Indirect Expenses], [Profit & Loss],
  [47], [Professional Legal & Audit Fees], [Indirect Expenses], [Profit & Loss],
  [48], [Interest Earned on Savings Bank], [Indirect Incomes], [Profit & Loss],
  [49], [Cash Discount Received from Suppliers], [Indirect Incomes], [Profit & Loss],
  [50], [Scrap Material Sales Income], [Direct / Indirect Incomes], [Profit & Loss],
  [51], [Employer Contribution to PF], [Indirect Expenses], [Profit & Loss],
  [52], [Employees PF Payable], [Current Liabilities], [Balance Sheet],
  [53], [Professional Tax Payable (P-Tax)], [Duties & Taxes], [Balance Sheet],
  [54], [Commission Paid to Sales Agents], [Indirect Expenses], [Profit & Loss],
  [55], [Discount Allowed to Customers], [Indirect Expenses], [Profit & Loss],
  [56], [Bad Debts Written Off], [Indirect Expenses], [Profit & Loss],
  [57], [Bad Debts Recovered], [Indirect Incomes], [Profit & Loss],
  [58], [Interest Paid on Bank Loan], [Indirect Expenses], [Profit & Loss],
  [59], [Prepaid Fire Insurance], [Current Assets], [Balance Sheet],
  [60], [Outstanding Office Electricity Bill], [Provisions / Current Liab.], [Balance Sheet]
)

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 06 SUMMARY & KEY REVISION TAKEAWAYS]
    - A Group is a classification container dictating whether an account belongs to the Balance Sheet or Profit & Loss.
    - 28 Predefined Groups: 15 Primary Groups (9 Balance Sheet, 6 P&L) and 13 Secondary Sub-groups.
    - Direct Expenses (factory wages, power, inward freight) affect Gross Profit in Trading Account.
    - Indirect Expenses (office rent, salaries, bank charges) affect Net Profit in Profit & Loss Account.
    - Duties & Taxes, Sundry Debtors, Sundry Creditors, and Bank Accounts are sub-groups under Current Liabilities/Assets.
  ]
)

#v(8pt)

// MCQS
== Topic 06: High-Yield Exam & Interview MCQs

1. *How many total predefined groups are built into Tally Prime?*\\
   (A) 15 #h(10pt) (B) 24 #h(10pt) (C) 28 #h(10pt) (D) 32\\
   *Answer: (C)* | *Explanation:* Tally Prime features exactly 28 predefined groups (15 Primary + 13 Secondary).

2. *Under which group must an Input CGST or Output SGST ledger be created?*\\
   (A) Current Assets #h(10pt) (B) Duties & Taxes #h(10pt) (C) Indirect Expenses #h(10pt) (D) Provisions\\
   *Answer: (B)* | *Explanation:* All statutory tax ledgers belong under the Duties & Taxes sub-group.

3. *Factory worker wages are classified under which group in Tally Prime?*\\
   (A) Indirect Expenses #h(10pt) (B) Direct Expenses #h(10pt) (C) Current Liabilities #h(10pt) (D) Misc Expenses\\
   *Answer: (B)* | *Explanation:* Factory wages directly contribute to manufacturing output, making it a Direct Expense.

4. *Under which group should an office broadband bill paid to GTPL be classified?*\\
   (A) Direct Expenses #h(10pt) (B) Indirect Expenses #h(10pt) (C) Sundry Creditors #h(10pt) (D) Utility Assets\\
   *Answer: (B)* | *Explanation:* Broadband is an administrative office operational overhead (Indirect Expense).

5. *Under which parent group does the secondary group 'Sundry Debtors' reside?*\\
   (A) Current Assets #h(10pt) (B) Current Liabilities #h(10pt) (C) Investments #h(10pt) (D) Capital Account\\
   *Answer: (A)* | *Explanation:* Sundry Debtors are customers owing money to the business, nested under Current Assets.

6. *Salman's Capital Account belongs to which group?*\\
   (A) Loans (Liability) #h(10pt) (B) Capital Account #h(10pt) (C) Reserves & Surplus #h(10pt) (D) Current Liabilities\\
   *Answer: (B)* | *Explanation:* Owner's equity is categorized under the primary group Capital Account.

7. *What is the financial statement destination of 'Office Electricity Meter Security Deposit'?*\\
   (A) Profit & Loss (Expense) #h(10pt) (B) Balance Sheet (Assets under Deposits) #h(10pt) (C) Current Liabilities #h(10pt) (D) Trading A/c\\
   *Answer: (B)* | *Explanation:* Security deposits are recoverable funds, classified under Deposits (Asset) on the Balance Sheet.

8. *Which group should be selected for an unbilled temporary payment undergoing audit verification?*\\
   (A) Provisions #h(10pt) (B) Suspense Account #h(10pt) (C) Sundry Debtors #h(10pt) (D) Branch/Divisions\\
   *Answer: (B)* | *Explanation:* Suspense Account temporarily holds unclassified receipts or disbursements.

9. *Freight Inward on purchase of raw materials belongs to which group?*\\
   (A) Indirect Expenses #h(10pt) (B) Direct Expenses #h(10pt) (C) Purchase Accounts #h(10pt) (D) Current Assets\\
   *Answer: (B)* | *Explanation:* Freight Inward directly adds to the cost of bringing inventory to the premises (Direct Expense).

10. *Under which group is an employer's monthly contribution to employee Provident Fund (PF) classified?*\\
    (A) Current Liabilities #h(10pt) (B) Indirect Expenses #h(10pt) (C) Provisions #h(10pt) (D) Capital Account\\
    *Answer: (B)* | *Explanation:* Employer PF contribution is a corporate administrative employee overhead (Indirect Expense).

#v(6pt)

// VIVA & LAB
== Topic 06: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* What is the fundamental difference between Direct Expenses and Indirect Expenses in Tally Prime?\\
  *Answer:* Direct Expenses (factory wages, inward freight, manufacturing fuel) are directly involved in producing goods and reflect in the Trading Account affecting Gross Profit. Indirect Expenses (office rent, staff salaries, marketing) are administrative overheads that reflect in the Profit & Loss Account affecting Net Profit.
- *Viva Q2:* Can a user create custom groups in Tally Prime, and under what circumstances?\\
  *Answer:* Yes, users can create sub-groups under any existing primary or secondary group (e.g., creating "North Gujarat Debtors" under Sundry Debtors) to organize regional reporting.
- *Hands-On Lab Task:* In Tally Prime, go to *Chart of Accounts > Groups*, inspect the tree hierarchy of all 28 groups, and locate *Duties & Taxes* under *Current Liabilities*.
"""

    # =========================================================================
    # TOPIC 07
    # =========================================================================
    chapters[7] = """
= Topic 07: Company Creation, Alteration, Deletion & Security Architecture

== 7.1 What is a Company in Tally Prime?
In Tally Prime, a *Company* represents the supreme operational and legal data boundary for an enterprise. It houses all charts of accounts, voucher transactions, inventory masters, statutory tax configurations, and financial statements. A single installation of Tally Prime can maintain hundreds of distinct companies (e.g., different corporate subsidiaries or distinct financial years) without data contamination.

#v(6pt)

#align(center)[
  #box(
    stroke: 1pt + rgb("#CBD5E1"),
    radius: 4pt,
    clip: true,
    image("../../02_BRAND_ASSETS/catalog/p14_x62_2240x1106.png", width: 140mm)
  )
  #v(2pt)
  #text(size: 6.8pt, fill: rgb("#475569"), style: "italic")[Figure 7.1: Master Company Creation Screen in Tally Prime.]
]

#v(6pt)

== 7.2 Step-by-Step Corporate Company Creation Procedure
To create an authentic corporate entity in Tally Prime:
1. From Gateway of Tally, press #key-pill("Alt + K") (Company Menu) and select *Create Company* (or press #key-pill("F3 > Create Company")).
2. *Company Data Path:* The directory path where database files are stored (default: `C:\\Program Files\\TallyPrime\\Data`).
3. *Company Name:* Enter legal registered entity name (e.g., `Ravi Private Limited`).
4. *Mailing Name:* Used on printed invoices and cheques (defaults to Company Name).
5. *Address:* Street address, landmark, and city (e.g., `Near Ambaji Mandir, Main Chowk, Palanpur`).
6. *State:* Select *Gujarat*. *Crucial Compliance Step:* Selecting Gujarat automatically links State Code *24* and configures CGST + SGST tax engines!
7. *Country:* India. *Pincode:* `385001`.
8. *Contact Details:* Telephone (`02742-252534`), Mobile (`7046015165`), Email (`ravi@gmail.com`), Website (`www.ravi.com`).
9. *Financial Year Beginning From:* The formal accounting year begins on *01-Apr-2025*.
10. *Books Beginning From:* Date from which transaction entries commence (usually `01-Apr-2025`).
11. *Base Currency Symbol:* `₹` | *Formal Name:* `INR`.
12. Press #key-pill("Ctrl + A") to accept and save company creation.

#v(6pt)

== 7.3 Configuring F11 Company Features
Immediately after creating a company, Tally Prime presents the *Company Features (#key-pill("F11"))* screen:

#align(center)[
  #box(
    stroke: 1pt + rgb("#CBD5E1"),
    radius: 4pt,
    clip: true,
    image("../../02_BRAND_ASSETS/catalog/p15_x69_2002x1066.png", width: 140mm)
  )
  #v(2pt)
  #text(size: 6.8pt, fill: rgb("#475569"), style: "italic")[Figure 7.2: F11 Company Features Configuration Screen in Tally Prime.]
]

- *Accounting Features:* Maintain Accounts (Yes), Enable Bill-wise entry (Yes - essential for tracking outstanding creditor and debtor invoices).
- *Inventory Features:* Maintain Inventory (Yes - enables stock items and quantities), Integrate Accounts with Inventory (Yes - auto-updates closing stock in Balance Sheet).
- *Taxation Features:* Enable Goods and Services Tax (GST) (Yes - prompts for GSTIN, State Gujarat 24, monthly/quarterly filing periodicity).

#v(6pt)

== 7.4 Altering and Deleting Companies
=== 1. Company Alteration (#key-pill("Alt + K > Alter"))
When a corporate client updates their mobile number, GSTIN, or registered head office:
- Press #key-pill("Alt + K"), select *Alter*, choose the target company, navigate to the specific field, edit the details, and press #key-pill("Ctrl + A") to save.

=== 2. Company Deletion (#key-pill("Alt + D"))
#warning-box(title: "CRITICAL AUDIT WARNING: IRREVERSIBLE ACTION")[
  Deleting a company permanently erases its database folder from the hard drive! Ensure an offline backup (#key-pill("Alt + Y > Backup")) is created prior to deletion.
]
- Press #key-pill("Alt + K") > select *Alter* > press Enter to open the Company Alteration screen.
- Press #key-pill("Alt + D").
- Tally Prime displays the confirmation dialogue: *Delete? (Yes/No)*. Press Enter (or `Y`).
- A second confirmation dialogue appears: *Are you sure? (Yes/No)*. Press Enter to permanently delete the company.

#v(6pt)

== 7.5 Security Architecture: Administrator Password & Tally Vault
Tally Prime provides dual-layer security architecture to protect confidential financial records:

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #rect(
      width: 100%,
      stroke: 1pt + rgb("#0E7490"),
      fill: rgb("#F8FAFC"),
      radius: 4pt,
      inset: 8pt,
      [
        #text(weight: "black", size: 8pt, fill: rgb("#0E7490"))[1. Security Control / User Access]\\
        #v(3pt)
        #text(size: 7.2pt, fill: rgb("#334155"))[
          - Set *Control User Access to Company Data* to *Yes*.
          - Define *Administrator Username* and strong *Password*.
          - Enables creation of sub-users (Data Entry Operator, Auditor).
          - Generates *Tally Audit Trail* tracking which user created or altered every voucher.
        ]
      ]
    )
  ],
  [
    #rect(
      width: 100%,
      stroke: 1pt + rgb("#0E7490"),
      fill: rgb("#F8FAFC"),
      radius: 4pt,
      inset: 8pt,
      [
        #text(weight: "black", size: 8pt, fill: rgb("#0E7490"))[2. Tally Vault Military Encryption]\\
        #v(3pt)
        #text(size: 7.2pt, fill: rgb("#334155"))[
          - Uses *AES 128-bit / 256-bit* data encryption.
          - Hides company name from Company Selection List—displays only `*****` and assigns a 5-digit number (e.g., `10002`).
          - *Zero-Backdoor Warning:* If the Tally Vault password is lost, data recovery is mathematically impossible!
        ]
      ]
    )
  ]
)

#v(6pt)

== 7.6 Practical Company Creation & Maintenance Workshop (5 Live Cases)
Every student must execute the following five corporate company creations, alterations, and security configurations from Rahul Sir's lab notes:

=== Case 01: Ravi Private Limited
- *Company Name:* Ravi Private Limited | *Mailing Name:* Ravi Private Limited
- *Address:* Near Ambaji Mandir, Main Chowk, Palanpur | *State:* Gujarat | *Pincode:* 385001
- *Contact:* Phone: 02742-252534 | Mobile: 7046015165 | Email: `ravi@gmail.com` | Web: `www.ravi.com`
- *Financial Year:* 01-Apr-2025 | *Books Beginning:* 01-Apr-2025
- *Security:* Enable Security Control -> Admin Username: `rahul` | Password: `Iant@2025`

=== Case 02: Jaimin Corporation
- *Company Name:* Jaimin Corporation | *Address:* Near Cozy Tower, #476/44, Palanpur
- *State:* Gujarat (Code 24) | *Pincode:* 385001 | *Mobile:* 7046015169 | *Email:* `ccfabric@gmail.com`
- *Financial Year:* 01-Apr-2025 | *Books Beginning:* 01-Apr-2025

=== Case 03: Maheshwari Industrial Supplies
- *Company Name:* Maheshwari | *Address:* Jindal Road, Sarkanda, BSNL Road, Palanpur
- *State:* Gujarat | *Pincode:* 385001 | *Mobile:* 7046015165 | *Email:* `maheshwari@gmail.com`
- *Financial Year:* 01-Apr-2025 | *Books Beginning:* 01-Apr-2025

=== Case 04: Agwan Commercial Company
- *Company Name:* Agwan Company | *Address:* New Road, Exchange Office, Old Tower Road, Palanpur
- *State:* Gujarat | *Pincode:* 385001 | *Mobile:* 7046015157 | *Email:* `agwan@gmail.com`
- *Financial Year:* 01-Apr-2025 | *Books Beginning:* 01-Apr-2025

=== Case 05: TATA Communication (Regional Branch)
- *Company Name:* TATA Communication | *Address:* #413/25, Nayi Sadak, Ahmedabad
- *State:* Gujarat | *Pincode:* 385555 | *Mobile:* 7046015123 | *Email:* `tata@gmail.com`
- *Financial Year:* 01-Apr-2025 | *Books Beginning:* 01-Apr-2025

=== Alteration & Deletion Hands-On Drills
1. *Alter Company 2 (Jaimin Corporation):* Change address to `#403/2, Pariwar Mangalam, Old Bus Stand, Deesa Highway, Palanpur - 385002`. Update Mobile to `7956043330`.
2. *Alter Company 1 (Ravi Private Limited):* Update Company Name to `Ravi Private Limited (FY 2025-26)`. Update website to `www.raviindia.com`.
3. *Deletion Drill:* Create a temporary practice company named `Temp Demo Ltd`. Open Company Alteration screen, press #key-pill("Alt + D"), and confirm both prompts to delete.

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 07 SUMMARY & KEY REVISION TAKEAWAYS]
    - A Company is the master database container in Tally Prime; multiple companies can coexist simultaneously.
    - Company creation: #key-pill("Alt + K > Create"); selecting *State: Gujarat* auto-links State Code *24* and GST rules.
    - Standard Indian Financial Year begins on *01-Apr* of the calendar year.
    - F11 Features configure Accounting, Inventory, and Taxation modules immediately after creation.
    - Alter company via #key-pill("Alt + K > Alter"); permanently delete company via #key-pill("Alt + D") inside Alteration screen.
    - Dual security: *Security Control* sets up Administrator credentials and audit trails; *Tally Vault* encrypts data with AES and hides the company name (`*****`).
  ]
)

#v(8pt)

// MCQS
== Topic 07: High-Yield Exam & Interview MCQs

1. *Which keyboard shortcut accesses the Company Menu to create, alter, or select companies?*\\
   (A) Alt + K #h(10pt) (B) Ctrl + K #h(10pt) (C) Alt + F3 #h(10pt) (D) Alt + C\\
   *Answer: (A)* | *Explanation:* Alt+K opens the top Company Menu in Tally Prime.

2. *Which shortcut key is used inside the Company Alteration screen to permanently delete a company?*\\
   (A) Ctrl + D #h(10pt) (B) Alt + D #h(10pt) (C) Shift + Del #h(10pt) (D) Alt + X\\
   *Answer: (B)* | *Explanation:* Alt+D triggers the deletion prompt across masters and vouchers in Tally Prime.

3. *What happens to a company name on the Company Selection List when Tally Vault is enabled?*\\
   (A) It turns red #h(10pt) (B) It is displayed as asterisks (\\*\\*\\*\\*\\*) with a 5-digit number\\
   (C) It disappears completely from the drive #h(10pt) (D) It requires a USB dongle\\
   *Answer: (B)* | *Explanation:* Tally Vault masks the company name with asterisks and assigns a unique 5-digit code.

4. *Can a forgotten Tally Vault password be reset by Tally technical support?*\\
   (A) Yes, via OTP #h(10pt) (B) Yes, using master key #h(10pt) (C) No, data cannot be recovered without the password #h(10pt) (D) Yes, via email\\
   *Answer: (C)* | *Explanation:* Tally Vault uses strong zero-backdoor encryption; lost passwords cannot be recovered.

5. *In Indian statutory corporate accounting, the Financial Year begins on:*\\
   (A) 01-Jan #h(10pt) (B) 01-Apr #h(10pt) (C) 01-Jul #h(10pt) (D) 01-Nov (Diwali)\\
   *Answer: (B)* | *Explanation:* The official financial year in India runs from April 1st to March 31st.

6. *Which key is used to switch between already opened companies in Tally Prime?*\\
   (A) F1 #h(10pt) (B) F2 #h(10pt) (C) F3 #h(10pt) (D) F4\\
   *Answer: (C)* | *Explanation:* F3 allows switching between active loaded companies or selecting another company.

7. *What is the primary function of enabling Security Control in Tally Prime?*\\
   (A) Prevent GST calculations #h(10pt) (B) Establish administrator credentials and track audit modifications\\
   (C) Speed up printing #h(10pt) (D) Lock the software to 1 PC only\\
   *Answer: (B)* | *Explanation:* Security Control allows role-based user management and tracks voucher audit trails.

8. *If Books Beginning Date is set to 01-Jul-2025, can transactions be recorded on 15-May-2025?*\\
   (A) Yes, anytime #h(10pt) (B) No, transactions cannot precede the Books Beginning Date\\
   (C) Only in Educational Mode #h(10pt) (D) Only with CA permission\\
   *Answer: (B)* | *Explanation:* Tally disallows recording vouchers prior to the Books Beginning Date.

9. *Which function key opens the Company Features menu in Tally Prime?*\\
   (A) F10 #h(10pt) (B) F11 #h(10pt) (C) F12 #h(10pt) (D) Alt + F11\\
   *Answer: (B)* | *Explanation:* F11 accesses Company Features (Accounting, Inventory, Taxation).

10. *What is the difference between F11 Features and F12 Configuration in Tally Prime?*\\
    (A) F11 applies to the entire company; F12 applies to screen-specific display options\\
    (B) F11 is for printing; F12 is for GST #h(10pt) (C) They are identical #h(10pt) (D) F12 is only for CA users\\
    *Answer: (A)* | *Explanation:* F11 sets company-wide operational modules; F12 configures active screen preferences.

#v(6pt)

// VIVA & LAB
== Topic 07: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain the distinction between Financial Year Beginning Date and Books Beginning Date.\\
  *Answer:* Financial Year Beginning Date is the statutory fiscal year (e.g., 01-Apr-2025). Books Beginning Date is the actual day when the enterprise started recording entries (e.g., if a new business was incorporated on 01-Oct-2025, its books begin on 01-Oct-2025).
- *Viva Q2:* Why must an accountant exercise extreme caution when using Tally Vault?\\
  *Answer:* Because Tally Vault encrypts the database using AES encryption without a recovery backdoor; if the administrator forgets the password, the entire corporate database is permanently lost.
- *Hands-On Lab Task:* In Tally Prime, press #key-pill("Alt + K > Create"), set up *Ravi Private Limited* (Palanpur, Gujarat, State Code 24, FY 01-Apr-2025), and configure company features via #key-pill("F11").
"""

    return chapters
