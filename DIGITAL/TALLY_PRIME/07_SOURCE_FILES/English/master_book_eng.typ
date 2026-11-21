#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-tally-cover
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-tally-cover-hi
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-tally-cover-gu

#set document(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  author: "Rahul Patel"
)

// COVER PAGE
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-tally-cover(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  subtitle: "Double Entry Bookkeeping · 28 Predefined Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Invoices",
  edition: "2027 MASTER COMMERCIAL EDITION · EDITION 1",
  series-pill: "OFFICIAL RTECHLAB & IANT CERTIFIED PUBLICATION",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab | Lead Accounting Trainer, IANT Palanpur",
  lang-tag: "ENGLISH MASTER EDITION",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg"
)

#pagebreak()

// MASTER BOOK SETTINGS
#show: rtech-tally-book.with(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  subtitle: "Double Entry Bookkeeping · 28 Groups · 24 Vouchers · Modern GST Slabs (0%, 5%, 18%) · TDS · 50 Invoices",
  author: "Rahul Patel",
  edition: "2027 Master Commercial Edition",
  lang: "en"
)


= Author's Foreword & Institutional Endorsement

#grid(
  columns: (32mm, 1fr),
  gutter: 12pt,
  align: (center + horizon, left + horizon),
  [
    #box(
      clip: true,
      radius: 4pt,
      stroke: 1.5pt + rgb("#0E7490"),
      image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 30mm, height: 38mm, fit: "cover")
    )
  ],
  [
    #text(size: 11pt, weight: "black", fill: rgb("#0F172A"))[Rahul Patel]\
    #text(size: 8pt, weight: "bold", fill: rgb("#0E7490"))[Founder, RTechLab · Master Corporate Accounting Trainer, IANT Palanpur]\
    #v(3pt)
    #text(size: 7.5pt, fill: rgb("#475569"))[
      "Accounting is the universal language of business. Over the past decade of training thousands of students across Gujarat and nationwide, I have observed that textbooks often drown learners in abstract theory while failing to prepare them for the realities of modern ERP systems. This handbook was built to bridge that gap permanently—uniting Luca Pacioli's timeless double-entry rules with modern Tally Prime 4.x/5.x and the rationalized GST tax slabs."
    ]
  ]
)

#v(8pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[INSTITUTIONAL CURRICULAR HIGHLIGHTS:]\
    - *Full Double-Entry Parity:* 28 predefined groups, 24 vouchers, and complete Golden Rules analysis.
    - *Modern GST Rationalization:* Full coverage of 0% Exempt APMC commodities, 5% Essentials, and 18% Standard IT/Electronics.
    - *Corporate TDS Integration:* Sections 194C, 194J, 194I, Challan ITNS 281, and Form 26Q return filing.
    - *Real Field Practice:* Mr. Verma's 50 real transactions and Salman Trading Co. 18 group case scenarios.
  ]
)


#pagebreak()

= Chapter 01: Fundamentals of Accounting & Double-Entry Bookkeeping

== 1.1 What is Accounting?
Accounting is universally defined as the systematic art of identifying, recording, classifying, summarizing, and interpreting financial transactions and events of a business entity. In modern enterprise resource planning (ERP) environments such as *Tally Prime*, accounting transforms raw business transactions (purchases, sales, bank deposits, salary payouts) into statutory financial statements—namely the *Trading Account*, *Profit & Loss Account*, and the *Balance Sheet*.

#concept-box(title: "The Financial Accounting Cycle")[
  *Step 1: Identifying Transactions* (Invoices, vouchers, receipts, bank statements)\
  *Step 2: Recording in Journals* (Debit and Credit entry in books of prime entry)\
  *Step 3: Posting to Ledgers* (Classifying into individual debtor, creditor, bank, and expense ledgers)\
  *Step 4: Trial Balance Preparation* (Verifying arithmetical equality of Total Debits = Total Credits)\
  *Step 5: Adjustments & Closing Entries* (Prepaid expenses, depreciation, outstanding liabilities)\
  *Step 6: Financial Statements* (Balance Sheet, Profit & Loss A/c, Cash Flow Statement)
]

== 1.2 Core Accounting Terminology
Every certified accountant and Tally operator must possess flawless clarity on the core foundational terms:

#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Accounting Term]], [#text(weight: "bold", fill: white)[Practical Corporate Definition]],
  [Capital (Equity)], [The total monetary value or assets invested by the business owner/proprietor into the business to start or expand operations. Represented under the *Capital Account* group in Tally.],
  [Drawings], [Monetary funds or commercial goods withdrawn by the business owner for personal, non-commercial use. Treated as a direct reduction from Capital.],
  [Assets (Current & Fixed)], [Economic resources owned by the business yielding future economic benefits. *Fixed Assets* (Machinery, Computers, Office Furniture) are held long-term for operations. *Current Assets* (Cash, Bank balance, Debtors, Stock) are converted into cash within one financial year.],
  [Liabilities], [Financial debts and contractual obligations owed by the enterprise to outside parties (Creditors, Bank Overdraft, Term Loans, Outstanding Rent).],
  [Sundry Debtors (Customers)], [Persons or entities to whom the business has sold goods or provided services on credit, and from whom money is receivable in the future.],
  [Sundry Creditors (Suppliers)], [Suppliers, vendors, or entities from whom goods or raw materials have been purchased on credit, and to whom payment is legally payable.],
  [Revenue & Income], [Gross inflow of cash, receivables, or other consideration arising in the course of ordinary activities (Gross Sales, Commission received, Discount received).],
  [Expenses (Direct & Indirect)], [Costs incurred in business operations. *Direct Expenses* (Wages, Freight Inward, Factory Power) directly affect cost of goods sold. *Indirect Expenses* (Office Rent, Staff Salaries, Electricity, Depreciation) relate to administration and selling.]
)

== 1.3 Types of Business Organizations
1. *Trading Concerns:* Businesses that purchase finished goods at wholesale rates and sell them to retailers or end-consumers at retail rates with a profit margin (e.g., Electronics showroom, FMCG distributor, APMC Mandi commodity merchant).
2. *Manufacturing Concerns:* Entities that procure raw materials, utilize labor and factory machinery to convert them into finished goods, and distribute the manufactured products (e.g., Textile mills, Ceramic manufacturing in Morbi, Pharmaceutical production).
3. *Service Providers:* Organizations delivering intangible professional, technical, or financial services without dealing directly in physical goods (e.g., Chartered Accountant firms, Software agencies, Transportation & Logistics, Educational institutes).
#pagebreak()

= Chapter 02: The Three Golden Rules of Accounting & Double Entry System

== 2.1 The Philosophy of Double Entry Bookkeeping
Introduced by Italian mathematician Luca Pacioli in 1494, the *Double Entry System* dictates that every financial transaction has two equal and opposite effects: a *Debit (Dr.)* and a *Credit (Cr.)*.
$ "Total Debits" = "Total Credits" $
In Tally Prime, every journal entry, sales invoice, and bank payment enforces this immutable mathematical balance.

== 2.2 Classification of Accounts
Every ledger in commercial commerce falls into one of three distinct categories:
1. *Personal Accounts (વ્યક્તિગત ખાતા / व्यक्तिगत खाते):* Relate to individual persons, firms, companies, banks, or representative entities (e.g., Mr. Verma A/c, Reliance Industries Ltd, HDFC Bank, Outstanding Salary A/c).
2. *Real Accounts (માલ-મિલકત ખાતા / वास्तविक खाते):* Relate to tangible or intangible properties and assets owned by the enterprise (e.g., Cash A/c, Computer & Server A/c, Office Furniture A/c, Machinery A/c, Trademark/Patent A/c).
3. *Nominal Accounts (ઉપજ-ખર્ચ ખાતા / नाममात्र खाते):* Relate to all business expenditures, operating losses, revenue inflows, and financial gains (e.g., Salary Paid A/c, Office Rent A/c, Interest Received A/c, Commission Received A/c, Bad Debts A/c).

== 2.3 The Three Golden Rules of Accounting
#rule-box(title: "THE THREE GOLDEN RULES (MEMORIZE FOR LIFETIME ACCOUNTS)")[
  *1. Personal Account Rule:*
  $ "Debit the Receiver" quad <---> quad "Credit the Giver" $
  *(पाने वाले को नाम (Debit) करें · देने वाले को जमा (Credit) करें)*\
  *(લેનાર ખાતે ઉધાર (Debit) કરો · આપનાર ખાતે જમા (Credit) કરો)*

  *2. Real Account Rule:*
  $ "Debit what comes in" quad <---> quad "Credit what goes out" $
  *(व्यापार में जो वस्तु/सम्पत्ति आए उसे Debit करें · जो बाहर जाए उसे Credit करें)*\
  *(ધંધામાં જે આવે તે ઉધાર (Debit) કરો · જે જાય તે જમા (Credit) કરો)*

  *3. Nominal Account Rule:*
  $ "Debit all Expenses & Losses" quad <---> quad "Credit all Incomes & Gains" $
  *(सभी खर्च एवं हानियों को Debit करें · सभी आय एवं लाभ को Credit करें)*\
  *(બધા ખર્ચ અને નુકસાન ઉધાર (Debit) કરો · બધી આવક અને નફો જમા (Credit) કરો)*
]

== 2.4 Practical Analysis of 10 Core Transaction Entries
#table(
  columns: (2.2fr, 1.2fr, 1.2fr, 2.4fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[Transaction Description]], [#text(weight: "bold", fill: white)[Debit (Dr.)]], [#text(weight: "bold", fill: white)[Credit (Cr.)]], [#text(weight: "bold", fill: white)[Reasoning / Rule Applied]],
  [Proprietor invested ₹5,00,000 Cash], [Cash A/c], [Capital A/c], [Cash comes in (Real); Proprietor gives (Personal)],
  [Opened Current Account in HDFC with ₹1,00,000], [HDFC Bank A/c], [Cash A/c], [HDFC receives (Personal); Cash goes out (Real)],
  [Purchased Office Computers for ₹45,000 Cash], [Computer A/c], [Cash A/c], [Computer comes in (Real); Cash goes out (Real)],
  [Purchased Goods worth ₹80,000 on credit from Rajesh Bros], [Purchase A/c], [Rajesh Bros A/c], [Purchase is expense (Nominal); Rajesh gives (Personal)],
  [Sold Goods worth ₹1,20,000 on credit to Mehta Traders], [Mehta Traders A/c], [Sales A/c], [Mehta receives (Personal); Sales is income (Nominal)],
  [Paid Office Rent of ₹15,000 by HDFC Cheque], [Rent Expense A/c], [HDFC Bank A/c], [Rent is expense (Nominal); Bank gives funds (Personal)],
  [Received ₹50,000 NEFT from Mehta Traders], [HDFC Bank A/c], [Mehta Traders A/c], [Bank receives funds (Personal); Mehta gives (Personal)],
  [Paid Staff Salaries ₹35,000 via NetBanking], [Salary A/c], [HDFC Bank A/c], [Salary is expense (Nominal); Bank gives (Personal)],
  [Proprietor withdrew ₹10,000 Cash for personal home use], [Drawings A/c], [Cash A/c], [Proprietor receives (Personal); Cash goes out (Real)],
  [Paid Electricity Bill ₹4,200 Cash], [Electricity Exp A/c], [Cash A/c], [Electricity is expense (Nominal); Cash goes out (Real)]
)
#pagebreak()

= Chapter 03: Architecture of Tally Prime 4.x/5.x & Company Creation

== 3.1 Understanding Tally Prime Architecture
*Tally Prime* is engineered on the proprietary *Tally Definition Language (TDL)* and runs on a lightning-fast in-memory database engine (*Cactus*). The interface is divided into:
- *Top Navigation Ribbon:* Contains `Company` (Alt+K), `Data` (Alt+Y), `Exchange` (Alt+Z), `Go To` (Alt+G), `Import` (Alt+O), `Export` (Alt+E), `Email` (Alt+M), and `Print` (Alt+P).
- *Gateway of Tally (GOT):* The central operational dashboard categorised into *Masters* (Create, Alter, Chart of Accounts), *Transactions* (Vouchers, Day Book), and *Utilities / Reports* (Banking, Balance Sheet, Profit & Loss, Stock Summary, Ratio Analysis, Display More Reports).

== 3.2 Step-by-Step Corporate Company Creation
#shortcut-box(title: "COMPANY CREATION WORKFLOW")[
  1. Launch Tally Prime -> Press #key-pill("Alt + K") (Company Menu) -> Select *Create*.
  2. *Company Data Path:* Default is `C:\Program Files\TallyPrime\Data` or custom server path.
  3. *Company Name:* Enter legal registered name (e.g., `RTechLab Solutions Pvt Ltd`).
  4. *Mailing Name & Address:* Mention full corporate address with Pin Code (e.g., `Palanpur, Banaskantha, Gujarat - 385001`).
  5. *State & Country:* Select `Gujarat (24)` and `India`. State code 24 is mandatory for accurate CGST/SGST vs IGST calculation!
  6. *Financial Year Beginning From:* Typically `1-Apr-2026`.
  7. *Books Beginning From:* Date from which accounts are actually computerized (e.g., `1-Apr-2026`).
  8. *Security / TallyVault:* Set TallyVault password for database encryption or enable user-level security control with Admin rights.
  9. *Base Currency Symbol:* `₹`, Formal Name: `INR`.
  10. Press #key-pill("Ctrl + A") to save and accept company creation.
]

== 3.3 Mastering F11 (Company Features)
Immediately upon company creation, Tally Prime opens the *F11: Company Features* screen. To configure corporate operations, press #key-pill("F11"):
- *Accounting Features:* Maintain Accounts (Yes), Enable Bill-wise Details (Yes), Enable Cost Centres (Yes for departmental budgeting).
- *Inventory Features:* Maintain Inventory (Yes), Integrate Accounts with Inventory (Yes), Enable Multiple Price Levels (Yes), Enable Batches (Yes for pharmaceutical/FMCG expiry tracking), Enable Job Order Processing (Yes).
- *Taxation Features:* Enable Goods and Services Tax (GST) (Yes), Enable Tax Deducted at Source (TDS) (Yes), Enable Tax Collected at Source (TCS) (Optional).
#pagebreak()

= Chapter 04: The 28 Predefined Groups & Chart of Accounts Hierarchy

== 4.1 What are Groups in Tally Prime?
Groups are classification categories that dictate how individual ledger accounts behave and where they report on the financial statements. Tally Prime provides *28 Predefined Groups*, divided into:
- *15 Primary Groups* (9 Balance Sheet groups + 6 Profit & Loss groups)
- *13 Secondary (Sub) Groups* (Sub-classifications of primary groups)

== 4.2 Comprehensive Matrix of the 28 Predefined Groups
#table(
  columns: (0.4fr, 1.4fr, 1.1fr, 1fr, 2.1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Group Name]], [#text(weight: "bold", fill: white)[Type]], [#text(weight: "bold", fill: white)[Reports To]], [#text(weight: "bold", fill: white)[Typical Commercial Ledgers]],
  [1], [Capital Account], [Primary], [Balance Sheet], [Proprietor Capital, Partner Share, Share Capital],
  [2], [Reserves & Surplus], [Secondary], [Capital Account], [General Reserve, Retained Earnings, Capital Reserve],
  [3], [Current Assets], [Primary], [Balance Sheet], [Prepaid Insurance, Accrued Interest, Advance Tax],
  [4], [Bank Accounts], [Secondary], [Current Assets], [SBI Current A/c, HDFC Bank, ICICI Bank],
  [5], [Cash-in-Hand], [Secondary], [Current Assets], [Main Cash A/c, Petty Cash A/c],
  [6], [Deposits (Asset)], [Secondary], [Current Assets], [Office Rent Deposit, Electricity Security Deposit],
  [7], [Loans & Advances (Asset)], [Secondary], [Current Assets], [Staff Salary Advance, Vendor Security Advances],
  [8], [Stock-in-Hand], [Secondary], [Current Assets], [Opening Stock, Raw Materials Inventory, Closing Stock],
  [9], [Sundry Debtors], [Secondary], [Current Assets], [Mehta Traders, Patel Brothers, Customer Ledgers],
  [10], [Current Liabilities], [Primary], [Balance Sheet], [Outstanding Expenses, GST Payable, TDS Payable],
  [11], [Duties & Taxes], [Secondary], [Current Liabilities], [CGST, SGST, IGST, TDS 194C, TDS 194J],
  [12], [Provisions], [Secondary], [Current Liabilities], [Provision for Income Tax, Provision for Bad Debts],
  [13], [Sundry Creditors], [Secondary], [Current Liabilities], [Rajesh & Sons, APMC Vendors, Raw Material Suppliers],
  [14], [Fixed Assets], [Primary], [Balance Sheet], [Office Building, Plant & Machinery, Computers, ACs],
  [15], [Investments], [Primary], [Balance Sheet], [Fixed Deposits (FDs), Mutual Funds, Govt Bonds],
  [16], [Loans (Liability)], [Primary], [Balance Sheet], [Long-term Business Borrowings],
  [17], [Bank OD A/c], [Secondary], [Loans (Liability)], [Bank Overdraft, Cash Credit (CC) Facility Limits],
  [18], [Secured Loans], [Secondary], [Loans (Liability)], [HDFC Commercial Vehicle Loan, Machinery Mortgage Loan],
  [19], [Unsecured Loans], [Secondary], [Loans (Liability)], [Directors Loan, Friends & Relatives Borrowing],
  [20], [Suspense Account], [Primary], [Balance Sheet], [Unidentified Bank Credit/Debit discrepancies],
  [21], [Branch / Divisions], [Primary], [Balance Sheet], [Ahmedabad Branch A/c, Surat Branch A/c],
  [22], [Sales Accounts], [Primary], [Profit & Loss], [Local Sales (GST), Interstate Sales (IGST), Export Sales],
  [23], [Purchase Accounts], [Primary], [Profit & Loss], [Local Purchase (GST), Interstate Purchase (IGST)],
  [24], [Direct Incomes], [Primary], [Trading / P&L], [Freight Inward recovery, Job Work charges received],
  [25], [Direct Expenses], [Primary], [Trading A/c], [Factory Wages, Factory Power, Freight Inward],
  [26], [Indirect Incomes], [Primary], [Profit & Loss], [Interest on Bank FDs, Discount Received, Rental Income],
  [27], [Indirect Expenses], [Primary], [Profit & Loss], [Staff Salaries, Office Rent, Electricity, Audit Fees, Depreciation],
  [28], [Misc. Expenses (Asset)], [Primary], [Balance Sheet], [Preliminary Formation Expenses not yet written off]
)
#pagebreak()

= Chapter 05: Master Ledger Creation & Banking Configuration

== 5.1 The Art of Creating Corporate Ledgers
In Tally Prime, a *Ledger* is the actual book of record for each individual account. To create ledgers:
*Gateway of Tally -> Masters -> Create -> Ledger* (or press #key-pill("Alt + G") -> `Create Master` -> `Ledger`).

== 5.2 Vital Sub-Fields in Ledger Master
1. *Name:* Clean official name (e.g., `HDFC Bank Current A/c No 50200012345678`).
2. *Under Group:* Select the appropriate group from the 28 predefined groups. *Never misclassify a ledger group; an incorrect group corrupts Balance Sheet and Tax computations!*
3. *Maintain Balances Bill-by-Bill:* Must be set to *Yes* for all Sundry Debtors and Sundry Creditors. This enables:
   - *New Ref:* Assigned when issuing a new invoice.
   - *Agst Ref (Against Reference):* Selected when receiving payment or clearing bills, linking money directly to bill numbers!
   - *Advance:* Used for advance receipts/payments before billing.
   - *On Account:* Used for unreferenced lump-sum transactions.
4. *Credit Period & Credit Limit:* Set commercial credit days (e.g., 30 Days) and maximum monetary limit. Tally will warn or block sales vouchers if credit limits are breached.
5. *Banking Details:* Provide Bank Account Number, IFSC Code, Client Code, and Swift Code for e-payments and automated BRS.
6. *Mailing & Statutory Details:* Complete Street Address, State (with State Code e.g. Gujarat 24), PIN Code, PAN/IT Number, and GSTIN (15-character alphanumeric GST Identification Number).

#warning-box(title: "CRITICAL AUDIT RULE: GSTIN STRUCTURE VERIFICATION")[
  A valid Indian GSTIN consists of 15 characters:
  `24AAAAA0000A1Z5`
  - First 2 digits: State Code (e.g., 24 for Gujarat, 27 for Maharashtra, 08 for Rajasthan).
  - Next 10 characters: Business PAN (e.g., `AAAAA0000A`).
  - 13th character: Entity number of business within the state.
  - 14th character: Letter `Z` by default.
  - 15th character: Checksum validation digit.
]
#pagebreak()

= Chapter 06: The 24 Accounting & Inventory Vouchers

== 6.1 Understanding Vouchers in Tally Prime
A *Voucher* is the primary commercial source document evidencing a business transaction. Tally Prime provides *24 Predefined Voucher Types*, categorized into Accounting, Inventory, and Order vouchers.

== 6.2 Master Voucher Reference Table
#table(
  columns: (1fr, 1.4fr, 1.1fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[Voucher Type]], [#text(weight: "bold", fill: white)[Shortcut Key]], [#text(weight: "bold", fill: white)[Category]], [#text(weight: "bold", fill: white)[Primary Commercial Function]],
  [Contra], [#key-pill("F4")], [Accounting], [Fund transfers between Cash and Bank, or between Bank and Bank. No third party involved.],
  [Payment], [#key-pill("F5")], [Accounting], [All cash or bank payments made to vendors, expenses, assets, or statutory tax authorities.],
  [Receipt], [#key-pill("F6")], [Accounting], [All cash or bank receipts received from debtors, capital infusion, or income.],
  [Journal], [#key-pill("F7")], [Accounting], [Non-cash adjustment entries, depreciation, prepaid expenses, accruals, and TDS booking.],
  [Sales], [#key-pill("F8")], [Accounting/Inv], [Recording sales of goods or services. Supports Item Invoice, Accounting Invoice, and As Voucher modes.],
  [Purchase], [#key-pill("F9")], [Accounting/Inv], [Recording inward purchase of goods or services with supplier bill numbers and dates.],
  [Credit Note], [#key-pill("Alt + F6")], [Accounting], [Sales Returns, post-sale discounts, or rate difference adjustments allowed to customers.],
  [Debit Note], [#key-pill("Alt + F5")], [Accounting], [Purchase Returns, or claiming rate differences from suppliers.],
  [Delivery Note], [#key-pill("Alt + F8")], [Inventory], [Dispatching goods to customer prior to raising tax invoice (Challan out).],
  [Receipt Note], [#key-pill("Alt + F9")], [Inventory], [Receiving goods from vendor prior to receiving purchase bill (Challan in).],
  [Rejections Out], [#key-pill("Ctrl + F5")], [Inventory], [Rejecting and sending back damaged goods received via Receipt Note before purchase bill.],
  [Rejections In], [#key-pill("Ctrl + F6")], [Inventory], [Accepting returned damaged goods dispatched earlier via Delivery Note.],
  [Stock Journal], [#key-pill("Alt + F7")], [Inventory], [Inter-godown transfer of inventory from Source location to Destination location.],
  [Physical Stock], [#key-pill("Ctrl + F7")], [Inventory], [Recording physical stock audit counts to reconcile actual inventory with book stock.],
  [Sales Order], [#key-pill("Ctrl + F8")], [Order], [Recording customer order booking for goods to be delivered in future.],
  [Purchase Order], [#key-pill("Ctrl + F9")], [Order], [Placing official purchase order to vendor specifying rates, quantities, and delivery dates.]
)

== 6.3 Invoice Modes in Tally Prime (Change Mode: Ctrl + H)
- *Item Invoice Mode:* Used for trading and manufacturing when selling/purchasing physical goods with stock item names, quantity, rate, and unit of measure.
- *Accounting Invoice Mode:* Used for professional services (consultancy, audit fees, freight, advertising) without physical stock items.
- *As Voucher Mode:* Traditional Dr/Cr double-entry bookkeeping mode.
#pagebreak()

= Chapter 07: Foundational Practice Set 1: Mr. Verma's 50 Transactions

== 7.1 Real-World Corporate Simulation: Verma Enterprises
*Company Name:* Verma Enterprises\
*Financial Year:* 2026-2027 · *State:* Gujarat (24) · *Bank:* HDFC Bank Current A/c

#shortcut-box(title: "MR. VERMA TRANSACTIONS 1 TO 25 (PRACTICE PROTOCOL)")[
  Record each transaction in Tally Prime, identify the Voucher Type, Debit Ledger, and Credit Ledger:
]

#table(
  columns: (0.4fr, 3.2fr, 1.1fr, 1.1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Transaction Particulars]], [#text(weight: "bold", fill: white)[Voucher]], [#text(weight: "bold", fill: white)[Debit (Dr)]], [#text(weight: "bold", fill: white)[Credit (Cr)]],
  [1], [Mr. Verma deposited ₹10,000 cash into HDFC Bank.], [Contra (F4)], [HDFC Bank], [Cash],
  [2], [Mr. Verma withdrew ₹5,000 from HDFC Bank for office use.], [Contra (F4)], [Cash], [HDFC Bank],
  [3], [Mr. Verma transferred ₹15,000 from HDFC Bank to Axis Bank.], [Contra (F4)], [Axis Bank], [HDFC Bank],
  [4], [Mr. Verma deposited ₹20,000 cash into Axis Bank.], [Contra (F4)], [Axis Bank], [Cash],
  [5], [Mr. Verma withdrew ₹2,000 from Axis Bank for office use.], [Contra (F4)], [Cash], [Axis Bank],
  [6], [Mr. Verma transferred ₹8,000 from Axis Bank to HDFC Bank.], [Contra (F4)], [HDFC Bank], [Axis Bank],
  [7], [Mr. Verma deposited ₹12,000 cash into HDFC Bank.], [Contra (F4)], [HDFC Bank], [Cash],
  [8], [Mr. Verma withdrew ₹3,000 from HDFC Bank for office use.], [Contra (F4)], [Cash], [HDFC Bank],
  [9], [Mr. Verma transferred ₹10,000 from HDFC Bank to SBI Bank.], [Contra (F4)], [SBI Bank], [HDFC Bank],
  [10], [Mr. Verma deposited ₹18,000 cash into SBI Bank.], [Contra (F4)], [SBI Bank], [Cash],
  [11], [Mr. Verma paid office rent ₹12,000 by HDFC Bank Cheque.], [Payment (F5)], [Rent Expense], [HDFC Bank],
  [12], [Mr. Verma paid staff salary ₹25,000 via NEFT from Axis Bank.], [Payment (F5)], [Salary Expense], [Axis Bank],
  [13], [Mr. Verma paid electricity bill ₹3,500 in cash.], [Payment (F5)], [Electricity Exp], [Cash],
  [14], [Mr. Verma purchased office stationery ₹1,200 in cash.], [Payment (F5)], [Stationery Exp], [Cash],
  [15], [Mr. Verma paid internet broadband bill ₹1,500 by UPI.], [Payment (F5)], [Internet Exp], [HDFC Bank],
  [16], [Mr. Verma paid telephone bill ₹800 by cheque.], [Payment (F5)], [Telephone Exp], [HDFC Bank],
  [17], [Mr. Verma paid travelling expenses ₹2,500 in cash.], [Payment (F5)], [Travelling Exp], [Cash],
  [18], [Mr. Verma paid tea & refreshment expenses ₹650 in cash.], [Payment (F5)], [Tea Refreshment], [Cash],
  [19], [Mr. Verma paid advertising expenses ₹8,000 by cheque.], [Payment (F5)], [Advertising Exp], [Axis Bank],
  [20], [Mr. Verma paid courier charges ₹350 in cash.], [Payment (F5)], [Courier Exp], [Cash],
  [21], [Received consultancy commission ₹15,000 in cash.], [Receipt (F6)], [Cash], [Commission Income],
  [22], [Received interest on bank fixed deposit ₹4,500 credited to HDFC.], [Receipt (F6)], [HDFC Bank], [Interest Income],
  [23], [Received bad debts recovered ₹6,000 in cash.], [Receipt (F6)], [Cash], [Bad Debts Recov],
  [24], [Received dividend on investments ₹2,800 into Axis Bank.], [Receipt (F6)], [Axis Bank], [Dividend Income],
  [25], [Received rent from sublet warehouse ₹18,000 by cheque.], [Receipt (F6)], [HDFC Bank], [Rental Income]
)

== 7.2 Transactions 26 to 50: Advanced Vendor Payments & Adjustments
#table(
  columns: (0.4fr, 3.2fr, 1.1fr, 1.1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Transaction Particulars]], [#text(weight: "bold", fill: white)[Voucher]], [#text(weight: "bold", fill: white)[Debit (Dr)]], [#text(weight: "bold", fill: white)[Credit (Cr)]],
  [26], [Purchased Office Furniture worth ₹35,000 on credit from Royal Decor.], [Journal (F7)], [Furniture A/c], [Royal Decor],
  [27], [Depreciation charged on Office Furniture \@ 10% ₹3,500.], [Journal (F7)], [Depreciation Exp], [Furniture A/c],
  [28], [Purchased 5 Dell Laptops @₹42,000 each on credit from Infotech Ltd.], [Purchase (F9)], [Purchase A/c], [Infotech Ltd],
  [29], [Sold 3 Dell Laptops @₹52,000 each on credit to Apex Systems.], [Sales (F8)], [Apex Systems], [Sales A/c],
  [30], [Apex Systems returned 1 damaged Dell Laptop.], [Credit Note], [Sales Return], [Apex Systems],
  [31], [Returned the damaged Laptop back to Infotech Ltd.], [Debit Note], [Infotech Ltd], [Purchase Return],
  [32], [Paid Infotech Ltd ₹1,20,000 by HDFC cheque against bill.], [Payment (F5)], [Infotech Ltd], [HDFC Bank],
  [33], [Received ₹95,000 from Apex Systems in full settlement.], [Receipt (F6)], [HDFC Bank], [Apex Systems],
  [34], [Discount allowed to Apex Systems ₹9,000.], [Journal (F7)], [Discount Allowed], [Apex Systems],
  [35], [Paid Audit Fees ₹20,000 to CA Mehta by cheque.], [Payment (F5)], [Audit Fees], [HDFC Bank],
  [36], [Purchased Packing Materials ₹4,500 in cash.], [Payment (F5)], [Packing Exp], [Cash],
  [37], [Paid Freight Inward on raw materials ₹3,200 in cash.], [Payment (F5)], [Freight Inward], [Cash],
  [38], [Sold Scrap packaging boxes for ₹1,800 cash.], [Receipt (F6)], [Cash], [Scrap Sales],
  [39], [Withdrew ₹15,000 cash for personal medical expenses.], [Payment (F5)], [Drawings A/c], [Cash],
  [40], [Transferred ₹50,000 to Bank Fixed Deposit (FD) A/c.], [Payment (F5)], [FD Investment], [HDFC Bank],
  [41], [Paid Annual Trade License Fee ₹2,400 by cheque.], [Payment (F5)], [Trade License], [HDFC Bank],
  [42], [Paid Municipal Property Tax ₹5,600 by cheque.], [Payment (F5)], [Property Tax], [HDFC Bank],
  [43], [Purchased Air Conditioner for Managing Director Cabin ₹42,000.], [Payment (F5)], [Air Conditioner], [Axis Bank],
  [44], [Paid AC Installation & Piping Charges ₹2,500 cash.], [Payment (F5)], [Air Conditioner], [Cash],
  [45], [Received interest on Income Tax Refund ₹1,240 into HDFC.], [Receipt (F6)], [HDFC Bank], [Interest on Refund],
  [46], [Paid Insurance Premium for Office Building ₹8,500.], [Payment (F5)], [Insurance Exp], [HDFC Bank],
  [47], [Goods lost in transit due to accident ₹12,000.], [Journal (F7)], [Loss in Transit], [Purchase A/c],
  [48], [Insurance claim admitted by New India Assurance ₹9,500.], [Journal (F7)], [Insurance Co], [Loss in Transit],
  [49], [Received insurance claim settlement ₹9,500 in HDFC.], [Receipt (F6)], [HDFC Bank], [Insurance Co],
  [50], [Net unrecovered transit loss transferred to P&L ₹2,500.], [Journal (F7)], [P&L A/c], [Loss in Transit]
)
#pagebreak()

= Chapter 08: Practice Set 2: Salman Trading Co. 18 Group Transactions

== 8.1 Scenario & Chart of Accounts Verification
*Entity:* Salman Trading Corporation (Unjha, Gujarat)\
*Objective:* Verify accurate group assignment across 18 diverse commercial activities, ensuring a zero-discrepancy Trial Balance.

#table(
  columns: (0.4fr, 2.8fr, 1.4fr, 1.4fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Commercial Transaction]], [#text(weight: "bold", fill: white)[Primary Ledger]], [#text(weight: "bold", fill: white)[Tally Group]], [#text(weight: "bold", fill: white)[Nature]],
  [1], [Salman introduced Capital ₹10,00,000 in SBI Current A/c], [Salman Capital A/c], [Capital Account], [Liability],
  [2], [Took secured loan of ₹5,00,000 from Bank of Baroda], [BOB Term Loan A/c], [Secured Loans], [Liability],
  [3], [Deposited ₹1,00,000 cash for Electricity Security Deposit], [UGVCL Deposit A/c], [Deposits (Asset)], [Asset],
  [4], [Purchased Delivery Van for ₹4,50,000 via SBI Cheque], [Delivery Van A/c], [Fixed Assets], [Asset],
  [5], [Procured 100 bags Jeera @₹4,000/bag from APMC Merchant], [APMC Unjha Merchant], [Sundry Creditors], [Liability],
  [6], [Incurred APMC Mandi Tax Cess \@ 1% ₹4,000], [Mandi Cess Exp A/c], [Direct Expenses], [Expense],
  [7], [Paid unloading hamali/labour wages ₹2,500 in cash], [Wages A/c], [Direct Expenses], [Expense],
  [8], [Supplied 60 bags Jeera @₹5,200/bag on credit to Kutch Spices], [Kutch Spices A/c], [Sundry Debtors], [Asset],
  [9], [Paid Godown Rent ₹18,000 by NetBanking], [Godown Rent A/c], [Indirect Expenses], [Expense],
  [10], [Earned Commission on third-party spice brokerage ₹12,000], [Brokerage Income], [Indirect Incomes], [Income],
  [11], [Obtained Bank Overdraft Limit of ₹2,00,000 from SBI], [SBI Bank OD A/c], [Bank OD A/c], [Liability],
  [12], [Purchased 5-year National Savings Certificates (NSC) ₹50,000], [NSC Investment A/c], [Investments], [Asset],
  [13], [Advanced ₹20,000 loan to godown supervisor Ramesh], [Staff Advance A/c], [Loans & Advances (Asset)], [Asset],
  [14], [Received ₹1,500 cash from scrap gunny bags auction], [Scrap Sales A/c], [Indirect Incomes], [Income],
  [15], [Created Provision for Doubtful Debts \@ 5% ₹15,600], [Provision for Bad Debts], [Provisions], [Liability],
  [16], [Transferred ₹50,000 into General Reserve for expansion], [General Reserve A/c], [Reserves & Surplus], [Liability],
  [17], [Received unidentified NEFT credit of ₹14,200 in SBI], [Suspense A/c], [Suspense Account], [Temporary],
  [18], [Depreciation on Delivery Van \@ 15% ₹67,500], [Depreciation A/c], [Indirect Expenses], [Expense]
)
#pagebreak()

= Chapter 09: Inventory Management & Multi-Location Godowns

== 9.1 The Inventory Hierarchy in Tally Prime
Tally Prime integrates robust multi-location inventory management structured as:
$ "Units of Measure (UoM)" --> "Stock Groups" --> "Stock Categories" --> "Godowns/Locations" --> "Stock Items" $

== 9.2 Units of Measure (Simple vs. Compound)
- *Simple Units:* Single measurement units such as `Kgs` (Kilograms), `Nos` (Numbers), `Box` (Boxes), `Mtr` (Meters), `Ltr` (Liters). Decimal places must be configured accurately (e.g., 3 decimal places for `Kgs` to record `1.250 Kgs`).
- *Compound Units:* A compound relationship between two simple units:
  $ 1 "Box" = 50 "Nos" quad | quad 1 "Carton" = 24 "Pcs" quad | quad 1 "Ton" = 1000 "Kgs" $

== 9.3 Godown & Multi-Location Warehouse Configuration
In corporate commerce, businesses maintain central hubs and retail outlets. Enable Godowns via #key-pill("F11") -> `Enable Multi-Godowns` = *Yes*.
*Create Locations:*
1. `Central Warehouse (Unjha Mandi)`
2. `Palanpur Retail Outlet`
3. `Morbi Dispatch Yard`

#shortcut-box(title: "STOCK JOURNAL (ALT + F7) INTER-GODOWN TRANSFER")[
  When transferring stock between warehouses, press #key-pill("Alt + F7") to launch the *Stock Journal*.
  - *Source (Consumption):* Specify Godown where stock originates, Stock Item name, Quantity, and Rate.
  - *Destination (Production):* Specify Destination Godown where stock is delivered.
  - The Stock Journal updates individual warehouse balances without affecting Profit & Loss!
]

== 9.4 Batch-Wise Inventory & Expiry Dates (FMCG / Pharma)
For pharmaceuticals and food commodities, enable *Maintain Batches* and *Set Expiry Dates* in F11/F12.
When purchasing or selling stock items:
1. Provide *Batch Number* (e.g., `BATCH-2026-X01`).
2. Specify *Manufacturing Date* (e.g., `01-Apr-2026`).
3. Specify *Expiry Date* (e.g., `31-Mar-2028`).
Tally prevents billing of expired batches, preventing regulatory penalties.
#pagebreak()

= Chapter 10: Purchase & Sales Order Processing Workflow

== 10.1 The Corporate Procurement Cycle (Purchase Order Workflow)
Corporate organizations strictly forbid direct billing without formal purchase orders. The 5-stage procurement cycle is:

#concept-box(title: "THE 5-STAGE PURCHASE CYCLE")[
  *Stage 1: Purchase Order (Ctrl + F9)* -> Formal contract issued to supplier with agreed rate, terms, and delivery date.\
  *Stage 2: Receipt Note (Alt + F9)* -> Goods physically arrive at warehouse accompanied by Delivery Challan. Stock increases in warehouse; financial accounts not yet impacted.\
  *Stage 3: Rejections Out (Ctrl + F5)* -> Damaged, defective, or off-spec items returned to supplier before raising the bill.\
  *Stage 4: Purchase Bill (F9)* -> Supplier tax invoice received. Linked directly to Receipt Note tracking number! Financial liability booked in Sundry Creditors.\
  *Stage 5: Payment Voucher (F5)* -> Payment released via Bank/Cheque against the specific purchase bill reference.
]

== 10.2 The Corporate Order-to-Cash Cycle (Sales Order Workflow)
Similarly, enterprise sales follow a structured 5-stage cycle:
1. *Sales Order (Ctrl + F8):* Booking customer order with delivery schedules and agreed price list.
2. *Delivery Note (Alt + F8):* Dispatched from godown via transport challan. Stock decreases; invoice not yet billed.
3. *Rejections In (Ctrl + F6):* Customer rejects damaged transit pieces before final tax billing.
4. *Sales Invoice (F8):* Generating formal GST Tax Invoice automatically populating item quantities from Delivery Note tracking numbers.
5. *Receipt Voucher (F6):* Collecting payment from customer against the invoice reference.
#pagebreak()

= Chapter 11: Modern GST Masterclass (0% Exempt, 5% Essential, 18% Standard)

== 11.1 The Architecture of GST in India
The Goods and Services Tax (GST) is a destination-based consumption tax. Tax revenue accrues to the state where goods or services are consumed.
- *Intrastate Transaction (Within Gujarat State - State Code 24):*
  $ "Total GST" = "CGST (Central GST 50%)" + "SGST (State GST 50%)" $
- *Interstate Transaction (Gujarat to Maharashtra, Rajasthan, etc.):*
  $ "Total GST" = "IGST (Integrated GST 100%)" $

== 11.2 The Modern GST Slab Rationalization (2025-2027)
#gst-box(title: "CRITICAL REGULATORY TAX POLICY UPDATE")[
  In recent GST Council reforms, the complex historical 5-slab structure (0%, 5%, 12%, 18%, 28%) has undergone major structural rationalization to simplify compliance:
  - *The 3 Primary Active Workhorse Slabs:* *0% (Exempt)*, *5% (Essential Items)*, and *18% (Standard Commercial Goods & Services)*.
  - *The 12% Slab:* Merged predominantly into the 5% slab for merit goods or transitioned to 18% for processed items.
  - *The 28% Slab + Compensation Cess:* Retained exclusively for luxury automobiles, aerated sodas, and sin goods (tobacco, gaming).
  *For 95%+ of standard corporate and trading accountants, day-to-day accounting revolves around 0%, 5%, and 18%!*
]

== 11.3 Detailed Item-Wise GST Breakdown Table
#table(
  columns: (1fr, 1.4fr, 1.8fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[GST Slab]], [#text(weight: "bold", fill: white)[Tax Division (Local)]], [#text(weight: "bold", fill: white)[HSN/SAC Ranges]], [#text(weight: "bold", fill: white)[Covered Commodities & Services]],
  [0% (Nil / Exempt)], [Nil CGST + Nil SGST], [HSN 1209, 0701, 0401, 1001], [Unbranded APMC agricultural produce: Jeera (Cumin), Isabgol (Psyllium), Mustard seeds, Fennel (Saunf), Fresh milk, curd, unbranded wheat, fresh vegetables, educational services, healthcare services.],
  [5% (Essentials)], [2.5% CGST + 2.5% SGST (or 5% IGST)], [HSN 1515, 6401, 8708, 2701], [Packaged edible oils, mustard oil, cotton seed oil, basic footwear under ₹1,000, domestic transport services, railway freight, spices packaged in registered brand, coal, life-saving medicines.],
  [18% (Standard)], [9% CGST + 9% SGST (or 18% IGST)], [HSN 8517, 8471, 9983, 8528], [IT hardware & laptops, smartphones & mobile phones, computer peripherals, LED monitors, electronic components, software consulting, accounting & audit fees, hotel stays above ₹1,000, machinery parts.],
  [28% + Cess (Luxury)], [14% CGST + 14% SGST (or 28% IGST)], [HSN 8703, 2402], [Motor cars, racing motorcycles, pan masala, aerated sugary soft drinks, tobacco products, luxury yachts (historical luxury bracket).]
)
#pagebreak()

= Chapter 12: Real Commercial GST Invoicing & Tax Ledger Setup

== 12.1 Configuring GST in Tally Prime
To activate GST:
1. Press #key-pill("F11") -> *Enable Goods and Services Tax (GST)* = *Yes*.
2. *State:* Gujarat (24).
3. *Registration Type:* Regular (or Composition for turnover under ₹1.5 Cr).
4. *GSTIN/UIN:* Enter 15-character corporate GSTIN.
5. *Periodicity of GSTR-1:* Monthly (or Quarterly under QRMP).
6. Set *Tax Rate Details:* Press Yes to configure HSN/SAC and default GST rate, or configure item-wise at the stock item master level.

== 12.2 Creating Tax Ledgers (Duties & Taxes)
#warning-box(title: "CRITICAL LEDGER CONFIGURATION: DUTIES & TAXES")[
  Create three universal statutory tax ledgers under the *Duties & Taxes* group:
  1. *CGST:* Type of Duty: `GST` -> Tax Type: `Central Tax` -> Percentage: `0%` (Tally auto-calculates based on stock item!).
  2. *SGST:* Type of Duty: `GST` -> Tax Type: `State Tax` -> Percentage: `0%`.
  3. *IGST:* Type of Duty: `GST` -> Tax Type: `Integrated Tax` -> Percentage: `0%`.
  *Never hardcode 9% or 2.5% inside the ledger percentage field! Leaving it at 0% allows Tally to auto-compute 2.5%, 9%, or 14% dynamically based on the items in the invoice!*
]

== 12.3 Multi-Tax Rate Invoice Example (0%, 5%, and 18% on Same Bill)
In modern commerce, a single invoice frequently contains multiple tax rates:
- *Item A:* 10 Bags Unbranded Jeera Seeds @₹4,000 = ₹40,000 (0% Exempt)
- *Item B:* 5 Tins Edible Oil @₹2,000 = ₹10,000 (5% GST: 2.5% CGST + 2.5% SGST)
- *Item C:* 1 HP LaserJet Printer @₹15,000 = ₹15,000 (18% GST: 9% CGST + 9% SGST)

#table(
  columns: (2.5fr, 1.2fr, 1fr, 1fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[Taxable Value]], [#text(weight: "bold", fill: white)[CGST]], [#text(weight: "bold", fill: white)[SGST]], [#text(weight: "bold", fill: white)[Total Amount]],
  [Unbranded APMC Jeera (0%)], [₹40,000.00], [₹0.00], [₹0.00], [₹40,000.00],
  [Packaged Edible Oil (5%)], [₹10,000.00], [₹250.00 (2.5%)], [₹250.00 (2.5%)], [₹10,500.00],
  [HP LaserJet Printer (18%)], [₹15,000.00], [₹1,350.00 (9%)], [₹1,350.00 (9%)], [₹17,700.00],
  [*Subtotal & Total Invoice Value*], [*₹65,000.00*], [*₹1,600.00*], [*₹1,600.00*], [*₹68,200.00*]
)
#pagebreak()

= Chapter 13: TDS (Tax Deducted at Source) Corporate Essentials

== 13.1 What is TDS and Why Does it Exist?
*Tax Deducted at Source (TDS)* is an indirect collection mechanism governed by the *Income Tax Act, 1961*. Under this statutory mandate, any business entity or individual making specified payments (such as contractor charges, professional fees, rent, or brokerage) must deduct a prescribed tax percentage at source and remit it directly to the Central Government on behalf of the recipient.

== 13.2 Core TDS Sections Every Corporate Accountant Must Know
#table(
  columns: (1fr, 2.2fr, 1.5fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[Section]], [#text(weight: "bold", fill: white)[Nature of Payment]], [#text(weight: "bold", fill: white)[Threshold Exemption]], [#text(weight: "bold", fill: white)[TDS Rate]],
  [Section 194C], [Payments to Contractors & Sub-contractors (Transport, Civil works, Event management)], [₹30,000 (Single Contract) or ₹1,00,000 (Aggregate FY)], [1% for Individuals/HUF; 2% for Corporate Companies],
  [Section 194J], [Fees for Professional or Technical Services (CA audit fees, Legal, Software development)], [₹30,000 per financial year], [10% for Professional Services; 2% for Technical Services / Call Centers],
  [Section 194I], [Rent of Commercial Land, Building, or Furniture], [₹2,40,000 per financial year], [10% for Land/Building/Furniture; 2% for Plant & Machinery],
  [Section 194H], [Commission or Brokerage charges], [₹15,000 per financial year], [5% for all deductees],
  [Section 206AA], [Mandatory Non-PAN Penalty Rate], [No exemption], [*Flat 20%* if deductee fails to furnish valid PAN!]
)

== 13.3 TDS Accounting Workflow in Tally Prime
#tds-box(title: "THE 4-STEP TDS ACCOUNTING LIFECYCLE")[
  *Step 1: Booking Expense with TDS Deduction via Journal Voucher (F7):*
  $ "Debit: Professional Fees A/c (Nominal - Expense)" quad ₹1,00,000 $
  $ "Credit: CA Rahul Mehta & Associates (Personal - Sundry Creditor)" quad ₹90,000 $
  $ "Credit: TDS on Professional Fees 194J (Duties & Taxes)" quad ₹10,000 $

  *Step 2: Remitting TDS to Government via Bank Payment Voucher (F5):*
  Must be paid by the 7th of the following month using *Challan ITNS 281*.
  $ "Debit: TDS on Professional Fees 194J" quad ₹10,000 $
  $ "Credit: HDFC Bank Current A/c" quad ₹10,000 $

  *Step 3: Quarterly TDS Return Filing:*
  Reconcile transactions in Tally Prime's *Form 26Q* (for non-salary payments) or *Form 24Q* (for salaries) and export clean e-TDS text files for NSDL submission.
  
  *Step 4: Form 16A Issuance:*
  Generate TRACES Form 16A TDS certificate and furnish to the deductee within 15 days of return filing.
]
#pagebreak()

= Chapter 14: Debit Note, Credit Note & Purchase/Sales Returns

== 14.1 Commercial Purpose of Debit and Credit Notes
In business commerce, transactions do not always end with the initial invoice. Rejections, transit damages, rate discrepancies, and post-sale turnover discounts require statutory adjustments without altering the original tax invoice.
- *Credit Note (Alt + F6):* Issued by the SELLER to the buyer when:
  1. Buyer returns damaged or rejected goods (*Sales Return*).
  2. Seller offers post-sale discount or price reduction.
  3. Tax charged on original invoice was higher than actual.
- *Debit Note (Alt + F5):* Issued by the BUYER to the seller when:
  1. Buyer returns goods to vendor (*Purchase Return*).
  2. Seller undercharged in original invoice.

== 14.2 GST Statutory Implications of Credit & Debit Notes
Under Section 34 of the CGST Act, 2017:
- When a seller issues a Credit Note, their output GST tax liability is *reduced*, and the buyer's Input Tax Credit (ITC) must be *reversed*.
- In Tally Prime, every Credit Note and Debit Note must be linked to the *Original Invoice Number* and *Original Invoice Date* to reflect accurately in *Table 9B of GSTR-1*!
#pagebreak()

= Chapter 15: Financial Statements & Comprehensive Year-End Closing

== 15.1 The Holy Trinity of Financial Statements
1. *Trial Balance (Alt + G -> Trial Balance):* Verifies mathematical equality of debit and credit balances. Press #key-pill("F12") to expand opening balances, transactions, and closing balances.
2. *Profit & Loss Account (P&L):* Measures operational profitability over a financial period:
   $ "Gross Profit" = "Net Sales" - "Cost of Goods Sold (Opening Stock + Purchases + Direct Exp - Closing Stock)" $
   $ "Net Profit" = "Gross Profit" + "Indirect Incomes" - "Indirect Expenses" $
3. *Balance Sheet:* Reflects financial position at a specific point in time:
   $ "Total Capital & Liabilities" = "Total Assets" $

== 15.2 Mandatory 31st March Year-End Adjustment Entries
Prior to closing books on March 31st, a corporate accountant must record the following adjustment entries in the *Journal Voucher (F7)*:
1. *Depreciation on Fixed Assets:* Dr. Depreciation Expense | Cr. Respective Fixed Asset A/c.
2. *Prepaid Expenses:* Dr. Prepaid Insurance/Rent (Current Asset) | Cr. Insurance/Rent Expense.
3. *Outstanding Expenses:* Dr. Staff Salary / Electricity Exp | Cr. Salary / Electricity Payable (Current Liability).
4. *Accrued Incomes:* Dr. Accrued Interest (Current Asset) | Cr. Interest Income.

== 15.3 Splitting Company Data & Exporting for New Financial Year
When transitioning from FY 2025-2026 to FY 2026-2027:
- Navigate to `Alt + Y (Data)` -> *Split* -> *Split Company Data*.
- Select `1-Apr-2026` as the splitting date.
- Tally Prime automatically creates two clean companies: one for historical archive and one for the active new financial year with all closing balances carried forward as opening balances!
#pagebreak()

= Chapter 16: Bank Reconciliation Statement (BRS) & Audit Essentials

== 16.1 What is Bank Reconciliation Statement (BRS)?
BRS is an audit statement that reconciles discrepancies between the cash book bank balance maintained in Tally Prime and the actual balance shown in the bank's passbook/online statement.

== 16.2 Common Causes of Difference
1. *Cheques issued to suppliers but not yet presented for payment:* Cash book decreased; bank passbook higher.
2. *Cheques deposited into bank but not yet cleared/credited by bank:* Cash book increased; bank passbook lower.
3. *Direct bank debits (Bank charges, interest on overdraft, auto-debit ECS):* Bank passbook decreased; cash book not updated.
4. *Direct customer deposits into bank via NEFT/RTGS/UPI:* Bank passbook increased; cash book not updated until statement review.

== 16.3 Auto BRS in Tally Prime
Tally Prime supports *Auto Bank Reconciliation*:
1. Download e-Statement (CSV/Excel) from corporate internet banking portal (HDFC, SBI, ICICI).
2. Go to *Banking -> Bank Reconciliation* -> Select Bank Account.
3. Click *Import Bank Statement* (Alt + O) and select downloaded bank file.
4. Tally automatically matches voucher dates, cheque numbers, and transaction amounts, reconciling hundreds of entries within seconds!
#pagebreak()

#rtech-final-page(lang: "en", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")
