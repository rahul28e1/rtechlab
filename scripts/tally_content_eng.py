# -*- coding: utf-8 -*-
"""
Tally Prime Master Curriculum — English Edition (11 Comprehensive Topics)
Standardized by Rahul Patel (Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab)
"""

def get_english_chapters():
    chapters = {}

    # TOPIC 01
    chapters[1] = """
= Topic 01: History of Tally, Evolution & Downloading Tally Prime

== 1.1 The Genesis of Tally: A Proud Indian Innovation
The story of Tally represents one of the most remarkable journeys in Indian software engineering. In 1986, *Shyam Sundar Goenka* (running a textile machinery company in Bangalore) was struggling with manual paper-based bookkeeping. Frustrated by the lack of simple accounting software that did not require complex computer programming, he challenged his son, *Bharat Goenka* (a mathematics graduate), to build a software that an ordinary Indian accountant could operate in plain English without knowing programming code.

Bharat Goenka founded *Peutronics Financial Services* in Bangalore in 1986 and developed the world's first "codeless" accounting software called *The Accountant*. In 1999, Peutronics was formally renamed *Tally Solutions Pvt. Ltd.* Today, headquartered in Bangalore, Tally dominates the Indian business landscape with over *80% market share* across MSMEs, manufacturing plants, retail chains, and Chartered Accountancy firms.

#concept-box(title: "The Historical Evolution of Tally Software")[
  - *Tally 4.5 (1990s):* DOS-based, keyboard-driven double-entry bookkeeping without graphical mouse support.
  - *Tally 5.4 (1998):* Transitioned to 32-bit Windows operating systems, introducing graphical interface.
  - *Tally 6.3 (2001):* Added rudimentary data communication, multi-lingual printing, and audio-visual help.
  - *Tally 7.2 (2005):* Integrated state-level Value Added Tax (VAT), Service Tax, and central Excise duties.
  - *Tally 8.1 & 9 (2006):* Added multi-currency, point-of-sale (POS), and multi-lingual Indian script input.
  - *Tally.ERP 9 (2009 - 2020):* The monumental ERP workhorse of India, adding Payroll, Remote Access, and GST in 2017.
  - *Tally Prime (2020 - Present):* Complete ground-up redesign featuring top-bar navigation, multi-tasking (Alt+G), unified single-window installer, and native e-Invoicing/e-Way bill automation.
]

== 1.2 How to Download & Install Tally Prime
To download the authentic, digitally signed release of Tally Prime:
1. Open any modern web browser (Google Chrome, Microsoft Edge, Mozilla Firefox) and navigate to the official portal: #link("https://tallysolutions.com")[tallysolutions.com].
2. Click on the top-right *Download* button to obtain the latest setup executable: `Setup.exe` (approx. 45 MB).
3. Run `Setup.exe` as Administrator on a Windows 10/11 64-bit PC.
4. The unified installer detects existing installations. Click *Install* (default directory: `C:\Program Files\TallyPrime`).
5. Launch Tally Prime from the desktop shortcut or Start Menu.

== 1.3 Tally Prime Licensing Modes
When launching Tally Prime, you are presented with four licensing startup options:
#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[License Edition]], [#text(weight: "bold", fill: white)[User Access Limit]], [#text(weight: "bold", fill: white)[Operational Features & Restrictions]],
  [Silver Edition (Single User)], [1 Active Machine at a time], [Full commercial functionality for standalone desktop/laptop PCs. Ideal for small retail shops, trading concerns, and solo practitioners.],
  [Gold Edition (Multi-User)], [Unlimited Users on Local LAN], [Enables concurrent multi-user access across multiple office computers connected via Ethernet/Wi-Fi local network. Standard for CA firms, corporate accounts departments, and factories.],
  [Educational Mode], [Single User (Free of Cost)], [Designed specifically for students, schools, and training institutes like IANT Palanpur. *Critical Restriction:* Vouchers can only be entered on the *1st, 2nd, and 31st day* of any calendar month. All double-entry and reporting features remain 100% functional!],
  [Rental Mode], [Monthly / Quarterly Subscription], [Allows businesses to lease Silver or Gold licenses for short seasonal durations without permanent capital investment.]
)
"""

    # TOPIC 02
    chapters[2] = """
= Topic 02: What is Tally Prime & System Architecture

== 2.1 What is Tally Prime?
*Tally Prime* is India's premier enterprise resource planning (ERP) and business management software. It seamlessly integrates financial accounting, inventory management, statutory tax compliance (GST & TDS), banking automation, purchase/sales order processing, and payroll into a unified, lightning-fast application.

Unlike conventional accounting packages that require rigid ledger numbering codes or database query scripts, Tally Prime allows accountants to record transactions in natural commercial terms. Entering a payment voucher instantly updates the cash/bank book, customer ledger, trial balance, profit & loss statement, balance sheet, and statutory GST returns in real time!

== 2.2 The Proprietary "Cactus" In-Memory Database Engine
The unmatched speed and responsiveness of Tally Prime are powered by its proprietary in-memory database architecture, internally known as the *Cactus Engine*:
- *Zero-Latency In-Memory Processing:* Traditional ERP systems (e.g., SAP, Oracle) rely on external relational database management systems (RDBMS like SQL/PostgreSQL) with tables, foreign keys, and disk queries. Tally holds the entire hierarchical chart of accounts and transaction tree directly in RAM (Random Access Memory).
- *Instant Real-Time Recalculation:* When a sales invoice is saved, Cactus recalculates financial ratios, stock valuations (FIFO, Weighted Average), and tax ledgers across years of data in milliseconds.
- *Extensibility via TDL (Tally Definition Language):* Every screen, menu, report, invoice format, and voucher in Tally Prime is written in TDL, enabling rapid customization, custom invoice layouts, and API integrations.

== 2.3 Interface Architecture & Navigation Mastery
Tally Prime features an intuitive top-bar menu that stays accessible across every screen:
#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Top Menu Element]], [#text(weight: "bold", fill: white)[Keyboard Shortcut]], [#text(weight: "bold", fill: white)[Operational Function]],
  [Company Menu], [#key-pill("Alt + K")], [Create, alter, select, shut, or configure company data paths and security credentials.],
  [Data Menu], [#key-pill("Alt + Y")], [Manage data backups, restore archive files, split company data at year-end, and repair corrupted databases.],
  [Exchange Menu], [#key-pill("Alt + Z")], [Synchronize multi-branch data between head office and regional godowns/retail outlets.],
  [Import Menu], [#key-pill("Alt + O")], [Import ledgers, stock items, transactions, and electronic bank statements (CSV/XML).],
  [Export Menu], [#key-pill("Alt + E")], [Export invoices and financial statements into PDF, Excel, XML, HTML, or CSV formats.],
  [Email Menu], [#key-pill("Alt + M")], [Dispatch invoices, outstanding statements, and customer ledgers directly via corporate SMTP email.],
  [Print Menu], [#key-pill("Alt + P")], [Print formal tax invoices, cheques, vouchers, and statutory audit balance sheets.],
  [Help Menu], [#key-pill("F1")], [Access TallyHelp documentation, keyboard shortcut lists, license management, and software update wizards.]
)

#v(6pt)

#concept-box(title: "The Universal Search & Multi-Tasking Revolution: Go To (Alt + G)")[
  The hallmark innovation of Tally Prime is *Go To* (#key-pill("Alt + G")). In older software, if you were in the middle of entering a 30-item purchase bill and a customer walked in asking for their balance, you had to cancel or save the incomplete voucher. In Tally Prime, you simply press #key-pill("Alt + G"), type "Balance Sheet" or "Ledger Voucher", review or print the customer's account, and press *Esc* to return directly to your active, unsaved purchase voucher without losing a single keystroke!
]
"""

    # TOPIC 03
    chapters[3] = """
= Topic 03: Comprehensive GST & TDS Foundation (Full Details & Slabs)

== 3.1 Understanding Goods and Services Tax (GST)
Implemented on *1st July 2017* via the *101st Constitutional Amendment Act*, the Goods and Services Tax (GST) dismantled India's fragmented indirect tax web (Central Excise, Service Tax, State VAT, Entry Tax, Luxury Tax) under the motto *"One Nation, One Tax, One Market"*.

GST is an *indirect, destination-based, comprehensive multi-stage consumption tax*. The tax revenue accrues to the state where the goods or services are actually consumed (*Place of Supply*), rather than where they originated.

== 3.2 Dual GST Framework: Intrastate vs Interstate
India adopted a dual GST model to maintain fiscal federalism between the Centre and States:
- *Intrastate Supply (Within Same State, e.g., Gujarat to Gujarat):*
  $ "Total GST" = "CGST (Central Tax 50%)" + "SGST (State Tax 50%)" $
- *Interstate Supply (Between Different States, e.g., Gujarat to Maharashtra/Delhi):*
  $ "Total GST" = "IGST (Integrated Tax 100%)" $
  IGST is collected by the Central Government and apportioned to the destination consumer state.
- *Union Territory Supply (e.g., Daman & Diu, Ladakh):*
  $ "Total GST" = "CGST" + "UTGST" $

== 3.3 Modern Rationalized GST Slabs (What Falls Under What)
Modern GST rates are systematically structured to protect essential commodities while fairly taxing luxury goods:
#table(
  columns: (0.9fr, 1.4fr, 2.7fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[GST Slab]], [#text(weight: "bold", fill: white)[Commercial Category]], [#text(weight: "bold", fill: white)[Exact Commodities, Services & Practical Field Examples]],
  [0% (00 Slab)], [Nil-Rated & Fully Exempt APMC Goods], [Unbranded fresh agricultural produce directly from farmers/APMC Mandis: unbranded cumin (jeera), psyllium husk (isabgol), fresh vegetables, fresh unpasteurized milk, curd, unbranded wheat and rice, salt, organic manure, and basic municipal education/healthcare services.],
  [5% (05 Slab)], [Essential Daily Items & Mass Transport], [Packaged edible oils (mustard, groundnut, sunflower oil), tea leaves, coffee beans, spices (packaged cumin, turmeric), basic footwear priced under ₹1,000, cotton textiles/fabrics, railway economy passenger travel, goods transport agency (GTA) services, and life-saving pharmaceuticals/vaccines.],
  [18% (18 Slab)], [Standard Industrial Goods & Corporate Services], [IT hardware, desktop computers, laptops, servers, smartphones, consumer electronics, industrial machinery, software subscriptions, CA/legal consulting fees, commercial transport, and hotel room accommodation exceeding ₹1,000 per night.],
  [12% & 28%], [Specialized & Luxury/Sin Goods], [*12%:* Specific processed foods, dairy machinery, fruit juices. *28% + Compensation Cess:* Luxury motor cars, racing vehicles, pan masala, tobacco products, and aerated carbonated beverages.]
)

== 3.4 Input Tax Credit (ITC) & Utilization Mechanism
Input Tax Credit (ITC) prevents tax cascading ("tax on tax"). When a business buys goods, the tax paid (*Input GST*) can be offset against tax collected on sales (*Output GST*).
#concept-box(title: "Statutory Order of ITC Utilization (Section 49)")[
  1. *Input IGST* must first be utilized 100% against Output IGST, and any surplus can offset Output CGST or SGST in any proportion.
  2. *Input CGST* is utilized next against Output CGST, and any surplus against Output IGST (*Input CGST can NEVER offset SGST!*).
  3. *Input SGST* is utilized last against Output SGST, and any surplus against Output IGST (*Input SGST can NEVER offset CGST!*).
]

== 3.5 What is TDS (Tax Deducted at Source)?
Governed by the *Income Tax Act, 1961*, TDS ensures regular income tax collection at the very point of income generation. The entity making a payment (*Deductor*) deducts tax from the payee (*Deductee*) and remits it directly to the Central Government treasury using a 10-digit alphanumeric *Tax Deduction and Collection Account Number (TAN)*.

#table(
  columns: (0.9fr, 1.4fr, 1.1fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Section]], [#text(weight: "bold", fill: white)[Nature of Payment]], [#text(weight: "bold", fill: white)[TDS Rate]], [#text(weight: "bold", fill: white)[Statutory Threshold & Applicability]],
  [Sec 194C], [Payments to Contractors / Subcontractors], [1% (Ind/HUF)\ 2% (Companies)], [Single contract exceeding ₹30,000 or aggregate FY payments exceeding ₹1,00,000. Applies to transport, catering, advertising.],
  [Sec 194J], [Fees for Professional or Technical Services], [10% (Prof)\ 2% (Tech/BPO)], [Aggregate payment exceeding ₹30,000 per financial year. Applies to CA audit fees, legal charges, IT programming services.],
  [Sec 194I], [Rent of Land, Building or Machinery], [10% (Land/Bldg)\ 2% (Plant/Mach)], [Aggregate rent exceeding ₹2,40,000 per financial year per payee.],
  [Sec 194H], [Commission or Brokerage], [5%], [Aggregate commission exceeding ₹15,000 per financial year.],
  [Sec 206AA], [Mandatory PAN Requirement], [*Flat 20%*], [If the payee fails to furnish a valid Permanent Account Number (PAN), TDS must be deducted at a penalty rate of 20%!]
)

*Deposit & Filing Timelines:* Monthly TDS must be deposited via *Challan ITNS 281* by the *7th of the following month* (30th April for March). Quarterly returns must be filed via *Form 26Q* (Non-salaries) and *Form 24Q* (Salaries) on the TRACES/Income Tax portal.
"""

    # TOPIC 04
    chapters[4] = """
= Topic 04: Ledgers, Types of Accounts & Golden Rules of Accounting

== 4.1 What is a Ledger?
In double-entry bookkeeping and Tally Prime, a *Ledger* is the fundamental individual accounting record where all transactions affecting a specific asset, liability, equity, income, or expense are recorded. Every commercial invoice, payment, receipt, or journal adjustment must reference at least two ledgers (one Debited and one Credited) to maintain arithmetical balance.

== 4.2 The Three Fundamental Types of Accounts
Every financial transaction in the commercial world falls into one of three classical account types:
1. *Personal Accounts (વ્યક્તિગત ખાતા / व्यक्तिगत खाते):* Accounts relating to natural human beings (e.g., Rahul Patel A/c, Ramesh A/c), artificial corporate persons (e.g., HDFC Bank Ltd., Reliance Industries Ltd., Tata Motors Ltd.), and representative personal accounts (e.g., Outstanding Salary A/c, Prepaid Rent A/c).
2. *Real Accounts (માલ-મિલકતના ખાતા / वास्तविक खाते):* Accounts relating to tangible property and economic assets owned by the business (e.g., Cash A/c, Plant & Machinery A/c, Computer & Server A/c, Office Furniture A/c, Stock A/c) and intangible assets (Goodwill, Copyrights, Patents).
3. *Nominal Accounts (ઉપજ-ખર્ચના ખાતા / नाममात्र खाते):* Accounts relating to business expenses, losses, revenues, and gains (e.g., Office Rent A/c, Staff Salary A/c, Interest Received A/c, Discount Allowed A/c, Commission Received A/c).

== 4.3 The Golden Rules of Accounting
Formulated by Franciscan mathematician *Luca Pacioli* in 1494, these three timeless rules govern all double-entry accounting in Tally Prime:
#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 6pt,
  [#text(weight: "bold", fill: white)[Account Type]], [#text(weight: "bold", fill: white)[Debit Rule (ડૉ. / नाम)]], [#text(weight: "bold", fill: white)[Credit Rule (જ. / जमा)]],
  [Personal Account], [*Debit the Receiver*\ (જે વ્યક્તિ લાભ મેળવે તેને ઉધાર કરો / पाने वाले को डेबिट करो)], [*Credit the Giver*\ (જે વ્યક્તિ લાભ આપે તેને જમા કરો / देने वाले को क्रेडिट करो)],
  [Real Account], [*Debit what comes in*\ (ધંધામાં જે માલ/મિલકત આવે તે ઉધાર / जो वस्तु व्यापार में आए उसे डेबिट)], [*Credit what goes out*\ (ધંધામાંથી જે માલ/મિલકત જાય તે જમા / जो वस्तु व्यापार से जाए उसे क्रेडिट)],
  [Nominal Account], [*Debit all expenses and losses*\ (ધંધાના તમામ ખર્ચ કે નુકસાન ઉધાર કરો / सभी खर्चों एवं हानियों को डेबिट)], [*Credit all incomes and gains*\ (ધંધાની તમામ આવક કે ઉપજ જમા કરો / सभी आय एवं लाभों को क्रेडिट)]
)

== 4.4 20 Practical Dr / Cr Examples with Step-by-Step Accounting Logic
#table(
  columns: (0.4fr, 2.4fr, 1.2fr, 1.2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Business Transaction]], [#text(weight: "bold", fill: white)[Debit Ledger]], [#text(weight: "bold", fill: white)[Credit Ledger]], [#text(weight: "bold", fill: white)[Core Accounting Rule & Reasoning]],
  [01], [Started business with Cash ₹5,00,000], [Cash A/c (₹5L)], [Capital A/c (₹5L)], [Real A/c (Cash comes in = Dr) | Personal A/c (Owner gives funds = Cr)],
  [02], [Deposited cash ₹2,00,000 in HDFC Bank], [HDFC Bank A/c], [Cash A/c], [Personal A/c (Bank receives = Dr) | Real A/c (Cash goes out = Cr)],
  [03], [Purchased office computer for cash ₹45,000], [Computer A/c], [Cash A/c], [Real A/c (Asset comes in = Dr) | Real A/c (Cash goes out = Cr)],
  [04], [Purchased goods for cash ₹50,000], [Purchase A/c], [Cash A/c], [Nominal A/c (Purchase cost = Dr) | Real A/c (Cash goes out = Cr)],
  [05], [Purchased goods on credit from Rajesh Bros ₹1,20,000], [Purchase A/c], [Rajesh Bros A/c], [Nominal A/c (Expense = Dr) | Personal A/c (Supplier gives goods = Cr)],
  [06], [Sold goods for cash ₹40,000], [Cash A/c], [Sales A/c], [Real A/c (Cash comes in = Dr) | Nominal A/c (Sales revenue = Cr)],
  [07], [Sold goods on credit to Mehta Traders ₹95,000], [Mehta Traders A/c], [Sales A/c], [Personal A/c (Customer receives = Dr) | Nominal A/c (Revenue = Cr)],
  [08], [Paid office rent by cheque ₹18,000], [Office Rent A/c], [HDFC Bank A/c], [Nominal A/c (Expense = Dr) | Personal A/c (Bank pays = Cr)],
  [09], [Paid staff salaries in cash ₹35,000], [Salary A/c], [Cash A/c], [Nominal A/c (Expense = Dr) | Real A/c (Cash goes out = Cr)],
  [10], [Received commission by cheque ₹12,000], [HDFC Bank A/c], [Commission A/c], [Personal A/c (Bank receives = Dr) | Nominal A/c (Income = Cr)],
  [11], [Owner withdrew cash for personal use ₹15,000], [Drawings A/c], [Cash A/c], [Personal A/c (Owner receives = Dr) | Real A/c (Cash goes out = Cr)],
  [12], [Paid Rajesh Bros ₹1,18,000 in full settlement (Discount ₹2,000)], [Rajesh Bros (₹1.2L)], [Cash / Discount Rec.], [Personal (Dr Receiver) | Real (Cr Cash ₹1.18L) | Nominal (Cr Discount ₹2k)],
  [13], [Received from Mehta Traders ₹93,500 (Discount ₹1,500)], [Cash / Discount All.], [Mehta Traders], [Real (Dr Cash ₹93.5k) | Nominal (Dr Discount ₹1.5k) | Personal (Cr Giver)],
  [14], [Depreciation charged on office computer ₹4,500], [Depreciation A/c], [Computer A/c], [Nominal A/c (Loss = Dr) | Real A/c (Asset value reduces = Cr)],
  [15], [Paid electricity bill for office in cash ₹4,200], [Electricity Exp A/c], [Cash A/c], [Nominal A/c (Expense = Dr) | Real A/c (Cash goes out = Cr)],
  [16], [Sold old damaged office furniture for cash ₹8,000], [Cash A/c], [Furniture A/c], [Real A/c (Cash comes in = Dr) | Real A/c (Asset goes out = Cr)],
  [17], [Goods destroyed by accidental warehouse fire ₹10,000], [Loss by Fire A/c], [Purchase A/c], [Nominal A/c (Loss = Dr) | Real/Nominal (Goods value reduced = Cr)],
  [18], [Paid carriage inward on purchased goods ₹3,500], [Carriage Inward A/c], [Cash A/c], [Nominal A/c (Direct expense = Dr) | Real A/c (Cash goes out = Cr)],
  [19], [Interest credited by bank into current account ₹2,400], [HDFC Bank A/c], [Bank Interest Rec.], [Personal A/c (Bank balance increases = Dr) | Nominal A/c (Income = Cr)],
  [20], [Withdrew cash from HDFC Bank for office petty cash ₹25,000], [Cash A/c], [HDFC Bank A/c], [Real A/c (Cash comes in = Dr) | Personal A/c (Bank gives = Cr)]
)
"""

    # TOPIC 05
    chapters[5] = """
= Topic 05: Vouchers & The 4 Main Voucher Categories

== 5.1 What is a Voucher?
In accounting and Tally Prime, a *Voucher* is the formal legal document that records the details of a financial or inventory transaction. Vouchers serve as verifiable audit proof for statutory tax auditors and Chartered Accountants.

== 5.2 The 4 Main Voucher Categories in Tally Prime
Every voucher in Tally Prime belongs to one of four distinct functional categories:
1. *Accounting Vouchers:* Vouchers that record purely financial inflows, outflows, and double-entry adjustments without altering physical stock quantities.
2. *Inventory Vouchers:* Vouchers that record the physical movement, receipt, delivery, or transfer of goods between warehouses without immediately altering ledger financial balances.
3. *Order Vouchers:* Commercial commitments (Purchase Orders and Sales Orders) entered before the actual delivery or invoicing of merchandise.
4. *Non-Accounting / Memo Vouchers:* Provisional entries (Memorandum Vouchers and Reversing Journals) used for future forecasting, budgeting, and draft review that do not impact financial books until converted.

== 5.3 Complete Reference: 24 Vouchers & Keyboard Shortcuts
#table(
  columns: (0.9fr, 1.4fr, 1.1fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Shortcut]], [#text(weight: "bold", fill: white)[Voucher Name]], [#text(weight: "bold", fill: white)[Category]], [#text(weight: "bold", fill: white)[Operational Purpose & Transaction Example]],
  [#key-pill("F4")], [Contra Voucher], [Accounting], [Internal cash & bank transfers: depositing cash into bank, withdrawing cash from bank, or transferring funds between HDFC and SBI.],
  [#key-pill("F5")], [Payment Voucher], [Accounting], [Payments to vendors, expense payouts, salaries, rent, and government tax deposits (Challan 281/GST) via Cash or Bank.],
  [#key-pill("F6")], [Receipt Voucher], [Accounting], [Inflow of funds from customers, capital introduction, interest received, or loan proceeds via Cash or Bank.],
  [#key-pill("F7")], [Journal Voucher], [Accounting], [Non-cash adjustment entries: booking depreciation, prepaid expenses, year-end provisions, and TDS deduction bookings.],
  [#key-pill("F8")], [Sales Voucher], [Accounting], [Recording sale of merchandise or services to customers. Supports Item Invoice, Accounting Invoice, and As Voucher modes.],
  [#key-pill("F9")], [Purchase Voucher], [Accounting], [Recording inward purchase of raw materials, trade stock, or capital assets from suppliers with GST verification.],
  [#key-pill("Alt + F5")], [Debit Note], [Accounting], [Purchase returns of defective goods to suppliers, or claiming price reductions and debit adjustments from vendors.],
  [#key-pill("Alt + F6")], [Credit Note], [Accounting], [Sales returns received from customers, or issuing credit adjustments for volume discounts or damaged goods.],
  [#key-pill("Alt + F7")], [Stock Journal], [Inventory], [Transferring stock from Central Godown to Branch Godown, or recording consumption & production in manufacturing.],
  [#key-pill("Ctrl + F7")], [Physical Stock], [Inventory], [Recording actual physical stock counts during warehouse audits to auto-reconcile stock discrepancies.],
  [#key-pill("Alt + F8")], [Delivery Note], [Inventory], [Generating Delivery Challan when dispatching physical merchandise to customers prior to issuing final tax invoice.],
  [#key-pill("Alt + F9")], [Receipt Note (GRN)], [Inventory], [Recording Goods Receipt Note when receiving raw materials or stock from suppliers prior to purchase bill arrival.],
  [#key-pill("Ctrl + F8")], [Rejections Out], [Inventory], [Returning rejected, defective, or incorrect stock back to the supplier before the purchase bill is recorded.],
  [#key-pill("Ctrl + F9")], [Rejections In], [Inventory], [Receiving goods rejected and returned by customers before the sales invoice is finalized.],
  [#key-pill("Ctrl + F4")], [Purchase Order], [Order], [Placing formal legal purchase orders with suppliers specifying expected items, delivery dates, and contracted prices.],
  [#key-pill("Ctrl + F5")], [Sales Order], [Order], [Booking formal sales orders received from corporate customers specifying delivery schedules and agreed rates.],
  [#key-pill("Ctrl + F10")], [Memorandum], [Non-Accounting], [Recording provisional or suspense entries that do not affect the Balance Sheet or P&L until formally converted.],
  [#key-pill("F10")], [Other Vouchers], [Master Menu], [Accessing the complete list of all 24 vouchers, including payroll, job work, and attendance registers.]
)
"""

    # TOPIC 06
    chapters[6] = """
= Topic 06: Groups & Mapping of Ledgers to Groups

== 6.1 What is a Group in Tally Prime?
A *Group* is an accounting classification container that dictates where a ledger account reports in the statutory financial statements (*Balance Sheet* or *Profit & Loss Account*). Tally Prime comes pre-configured with *28 Predefined Groups* (15 Primary Groups and 13 Secondary Groups).

Correct group classification is the absolute foundation of reliable accounting. If an accountant erroneously creates a supplier ledger under *Direct Expenses* instead of *Sundry Creditors*, Cost of Goods Sold is artificially inflated, Gross Profit is distorted, and the Balance Sheet liabilities become legally defective!

== 6.2 The 15 Primary Groups & 13 Secondary Groups
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(fill: rgb("#F0FDFA"), stroke: 1pt + rgb("#99F6E4"), inset: 8pt, radius: 4pt)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[15 PRIMARY GROUPS:]\
      1. Capital Account\
      2. Loans (Liability)\
      3. Current Liabilities\
      4. Fixed Assets\
      5. Current Assets\
      6. Investments\
      7. Miscellaneous Expenses (Asset)\
      8. Suspense Account\
      9. Branch / Divisions\
      10. Sales Accounts\
      11. Purchase Accounts\
      12. Direct Incomes\
      13. Indirect Incomes\
      14. Direct Expenses\
      15. Indirect Expenses
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), inset: 8pt, radius: 4pt)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#1D4ED8"))[13 SECONDARY (SUB) GROUPS:]\
      1. Reserves & Surplus (under Capital Account)\
      2. Bank OD A/c (under Loans Liability)\
      3. Secured Loans (under Loans Liability)\
      4. Unsecured Loans (under Loans Liability)\
      5. Duties & Taxes (under Current Liabilities)\
      6. Provisions (under Current Liabilities)\
      7. Sundry Creditors (under Current Liabilities)\
      8. Bank Accounts (under Current Assets)\
      9. Cash-in-Hand (under Current Assets)\
      10. Deposits (Asset) (under Current Assets)\
      11. Loans & Advances (Asset) (under Current Assets)\
      12. Stock-in-Hand (under Current Assets)\
      13. Sundry Debtors (under Current Assets)
    ]
  ]
)

== 6.3 Exhaustive 50+ Ledger-to-Group Mapping Table
Directly modeled from Rahul Sir's authoritative classroom practice sheets:
#table(
  columns: (0.4fr, 2.2fr, 1.8fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Commercial Ledger Name]], [#text(weight: "bold", fill: white)[Tally Group Classification]], [#text(weight: "bold", fill: white)[Financial Statement & Nature]],
  [01], [Salman's Capital A/c], [Capital Account], [Balance Sheet (Owner's Equity)],
  [02], [Partner's Drawings A/c], [Capital Account], [Balance Sheet (Deducted from Equity)],
  [03], [HDFC Bank Current A/c], [Bank Accounts], [Balance Sheet (Current Asset)],
  [04], [SBI Cash Credit / Overdraft A/c], [Bank OD A/c], [Balance Sheet (Loans Liability)],
  [05], [Petty Cash A/c], [Cash-in-hand], [Balance Sheet (Current Asset)],
  [06], [Plant & Heavy Machinery A/c], [Fixed Assets], [Balance Sheet (Long-Term Asset)],
  [07], [Office Computers & Laptops A/c], [Fixed Assets], [Balance Sheet (Fixed Asset)],
  [08], [Office Furniture & Fixtures A/c], [Fixed Assets], [Balance Sheet (Fixed Asset)],
  [09], [Mehta Traders A/c (Customer)], [Sundry Debtors], [Balance Sheet (Current Asset - Receivable)],
  [10], [Rajesh Brothers A/c (Customer)], [Sundry Debtors], [Balance Sheet (Current Asset - Receivable)],
  [11], [Patel Electronics A/c (Supplier)], [Sundry Creditors], [Balance Sheet (Current Liability - Payable)],
  [12], [Ambica Trading Co. A/c (Supplier)], [Sundry Creditors], [Balance Sheet (Current Liability - Payable)],
  [13], [Output CGST / SGST / IGST A/c], [Duties & Taxes], [Balance Sheet (Current Liability)],
  [14], [Input CGST / SGST / IGST A/c], [Duties & Taxes], [Balance Sheet (Tax Credit Asset)],
  [15], [TDS Payable on Contractor (194C)], [Duties & Taxes], [Balance Sheet (Current Liability)],
  [16], [TDS Payable on Prof Fees (194J)], [Duties & Taxes], [Balance Sheet (Current Liability)],
  [17], [Security Deposit on Office Rent], [Deposits (Asset)], [Balance Sheet (Current Asset - Refundable)],
  [18], [Electricity Deposit to Electricity Board], [Deposits (Asset)], [Balance Sheet (Long-Term Deposit Asset)],
  [19], [Short-Term Advance to Staff], [Loans & Advances (Asset)], [Balance Sheet (Current Asset)],
  [20], [Advance to Raw Material Supplier], [Loans & Advances (Asset)], [Balance Sheet (Current Asset)],
  [21], [Term Loan from Bank of Baroda], [Secured Loans], [Balance Sheet (Long-Term Liability)],
  [22], [Loan from Friend / Director], [Unsecured Loans], [Balance Sheet (Unsecured Liability)],
  [23], [Fixed Deposit (FD) with SBI], [Investments], [Balance Sheet (Investment Asset)],
  [24], [Investment in Equity Shares / Mutual Funds], [Investments], [Balance Sheet (Investment Asset)],
  [25], [Factory Workers Wages A/c], [Direct Expenses], [Trading Account (Affects Gross Profit)],
  [26], [Freight & Carriage Inward A/c], [Direct Expenses], [Trading Account (Added to Cost of Goods)],
  [27], [Factory Power, Coal & Fuel A/c], [Direct Expenses], [Trading Account (Direct Production Cost)],
  [28], [Staff & Executive Salary A/c], [Indirect Expenses], [Profit & Loss Account (Operating Expense)],
  [29], [Office Rent & Property Tax A/c], [Indirect Expenses], [Profit & Loss Account (Administration)],
  [30], [Office Electricity & Internet Bill], [Indirect Expenses], [Profit & Loss Account (Utility Expense)],
  [31], [Chartered Accountant Audit Fees], [Indirect Expenses], [Profit & Loss Account (Professional Cost)],
  [32], [Depreciation on Fixed Assets], [Indirect Expenses], [Profit & Loss Account (Non-Cash Expense)],
  [33], [Trade Sales Local 18% A/c], [Sales Accounts], [Trading Account (Operating Revenue)],
  [34], [Interstate Sales IGST A/c], [Sales Accounts], [Trading Account (Operating Revenue)],
  [35], [Sales Return (Return Inward) A/c], [Sales Accounts], [Trading Account (Deducted from Gross Sales)],
  [36], [Trade Purchase Local 18% A/c], [Purchase Accounts], [Trading Account (Cost of Inventory)],
  [37], [Purchase Return (Return Outward) A/c], [Purchase Accounts], [Trading Account (Deducted from Purchases)],
  [38], [Cash Discount Allowed to Customers], [Indirect Expenses], [Profit & Loss Account (Financial Expense)],
  [39], [Cash Discount Received from Suppliers], [Indirect Incomes], [Profit & Loss Account (Financial Gain)],
  [40], [Bank Interest Received on Current/FD], [Indirect Incomes], [Profit & Loss Account (Non-Operating Income)],
  [41], [Bad Debts Written Off A/c], [Indirect Expenses], [Profit & Loss Account (Financial Loss)],
  [42], [Provision for Doubtful Debts A/c], [Provisions], [Balance Sheet (Offset against Debtors)],
  [43], [Outstanding Office Rent Payable], [Provisions / Current Liab], [Balance Sheet (Current Liability)],
  [44], [Prepaid Insurance Policy A/c], [Loans & Advances (Asset)], [Balance Sheet (Current Asset)],
  [45], [General Reserve Fund], [Reserves & Surplus], [Balance Sheet (Retained Earnings)],
  [46], [Mumbai Branch Office A/c], [Branch / Divisions], [Balance Sheet (Inter-Branch Clearing)],
  [47], [Office Stationery & Printing A/c], [Indirect Expenses], [Profit & Loss Account (Administrative Expense)],
  [48], [Business Travelling & Conveyance], [Indirect Expenses], [Profit & Loss Account (Selling & Marketing)],
  [49], [Bank Service & Cheque Charges], [Indirect Expenses], [Profit & Loss Account (Finance Cost)],
  [50], [Unidentified Inward Remittance], [Suspense Account], [Balance Sheet (Temporary Unclassified)]
)
"""

    # TOPIC 07
    chapters[7] = """
= Topic 07: Company & Company Creation in Tally Prime

== 7.1 What is a "Company" in Tally Prime?
In Tally Prime, a *Company* is the independent legal and financial accounting container that holds a complete chart of accounts, master ledgers, stock items, voucher registers, and statutory tax configurations for a specific enterprise. Each company maintains its own distinct financial year, base currency, and security credentials.

== 7.2 Step-by-Step Company Creation Workflow
To create a corporate company in Tally Prime:
1. From the *Gateway of Tally*, press #key-pill("Alt + K") (Company Menu) and select *Create* (or press #key-pill("F3") -> *Create Company*).
2. *Company Data Path:* Default storage directory (e.g., `C:\ProgramData\TallyPrime\Data` or network drive).
3. *Company Name:* Enter the legal business name (e.g., `Ravi Private Limited` or `Shree Ambica Agro Traders`).
4. *Mailing Name & Address:* Auto-fills with company name. Enter full street address, city, and pin code (e.g., `Shop 14, APMC Market Yard, Highway Road, Palanpur - 385001`).
5. *State & Country:* Select *Gujarat* and *India*.
   #concept-box(title: "CRITICAL STATUTORY NOTE: STATE CODE MATTERS!")[
     Selecting the state determines your *State Code* (e.g., `24` for Gujarat, `27` for Maharashtra). Tally automatically uses this state code to calculate CGST+SGST for local trade or IGST for interstate commerce!
   ]
6. *Financial Year Beginning From:* Enter `01-Apr-2026` (Standard Indian fiscal year: 1st April to 31st March).
7. *Books Beginning From:* Enter the date when actual accounting begins in Tally (usually `01-Apr-2026`).
8. *Security / Tally Vault:* Set *Control User Access to Company Data = Yes*. Enter Administrator Username and secure Password.
9. *Base Currency Information:* Currency Symbol `₹`, Formal Name `INR`, Number of Decimal Places `2`. Press #key-pill("Ctrl + A") to save and create the company!

== 7.3 Statutory Features Configuration: F11 Menu
Immediately after company creation, Tally Prime opens the *F11: Features* screen:
- *Accounting Features:* Maintain Accounts = `Yes`, Enable Bill-wise Details = `Yes`.
- *Inventory Features:* Maintain Inventory = `Yes`, Integrate Accounts with Inventory = `Yes`.
- *Statutory & Taxation (GST):*
  - Enable Goods and Services Tax (GST) = `Yes`.
  - State: `Gujarat` | Registration Type: `Regular` | Assessee of Other Territory: `No`.
  - GSTIN / UIN: Enter 15-digit GSTIN (e.g., `24AABCR1234F1Z5`).
  - Periodicity of GSTR-1: `Monthly` (or `Quarterly` for QRMP scheme).
  - e-Way Bill Applicable: `Yes` (Threshold Limit: `₹50,000`).
- *TDS Configuration:* Enable Tax Deducted at Source (TDS) = `Yes`. Enter TAN (e.g., `AHMR12345D`), Deductor Type: `Company` or `Individual`. Press #key-pill("Ctrl + A") to lock statutory configurations.
"""

    # TOPIC 08
    chapters[8] = """
= Topic 08: Types of Business Organizations & Accounting Treatment

Commercial enterprises in India operate under three fundamental operational models:

== 8.1 Trading Concerns (વેપારી પેઢી / व्यापारिक संस्थाएं)
*Definition:* Businesses that purchase finished commercial goods from manufacturers or wholesale distributors and resell them to retailers or end-consumers at a profit margin without altering the physical form of the goods.
#concept-box(title: "Field Case Example: Shree Ambica Agro Traders, Unjha APMC Mandi")[
  - *Business Activity:* Procurement of agricultural commodities (cumin/jeera, psyllium husk/isabgol, fennel seeds) from local North Gujarat farmers at 0% GST, sorting/cleaning, and distributing in 50 KG bags to domestic and export buyers.
  - *Accounting Setup in Tally:*
    - *Units of Measure:* `KGS` (Kilograms), `QNTL` (Quintals), `BAG` (Bags of 50 KGs).
    - *Stock Items:* Unbranded Jeera Grade-A (HSN 0909, GST 0%), Packaged Roasted Cumin (HSN 0909, GST 5%).
    - *Voucher Workflow:* Purchase (F9) -> Sales (F8) with batch-wise expiry tracking.
]

== 8.2 Manufacturing Concerns (ઉત્પાદન એકમો / विनिर्माण संस्थाएं)
*Definition:* Entities that procure raw materials, utilize factory labor, machinery, electricity, and industrial fuel to convert raw inputs into completely new finished goods.
#concept-box(title: "Field Case Example: Morbi Ceramic Tiles Pvt. Ltd., Morbi Cluster")[
  - *Business Activity:* Procuring raw ball clay, feldspar, glaze chemicals, and natural gas. Converting raw materials via hydraulic presses and kilns into glazed vitrified porcelain floor tiles.
  - *Accounting Setup in Tally:*
    - *Bill of Materials (BOM):* Pre-defined recipe in Tally specifying that 1 Box of 600x1200mm Tiles requires 28 KG Clay + 2.5 KG Glaze + 1.2 SCM Gas + ₹45 Labor.
    - *Godown Hierarchy:* Central Raw Material Godown -> Production Floor -> Finished Goods Yard.
    - *Voucher Workflow:* Stock Journal (#key-pill("Alt + F7")) using *Manufacturing Journal* mode to auto-consume raw materials and produce finished tiles.
]

== 8.3 Service Organizations (સેવાકીય સંસ્થાઓ / सेवा प्रदाता)
*Definition:* Organizations delivering intangible professional, technical, logistical, or financial services without trading in physical stock inventory.
#concept-box(title: "Field Case Example: Ahmedabad Cloud Tech & CA Advisory LLP")[
  - *Business Activity:* Providing software development, corporate tax audits, cloud hosting, and IT consultancy services across India.
  - *Accounting Setup in Tally:* Zero inventory stock items. Pure service ledgers configured with 6-digit SAC (Services Accounting Code) codes (e.g., SAC 998314 for IT Consulting at 18% GST).
  - *Invoicing:* Billed strictly via *Accounting Invoice* mode (#key-pill("Ctrl + H")) with Section 194J TDS deductions.
]
"""

    # TOPIC 09
    chapters[9] = """
= Topic 09: Practical Invoices (Inventory Invoices vs Accounting Invoices)

In Tally Prime, the invoice mode is toggled using the universal Change Mode shortcut: #key-pill("Ctrl + H").

== 9.1 Inventory Invoices (Item Invoice Mode)
*When to Use:* Essential for trading and manufacturing businesses where physical stock items are bought or sold with specific Quantities, Rates, Units of Measure, and HSN codes.
#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Invoice Field]], [#text(weight: "bold", fill: white)[Practical Field Configuration & Entry Step]],
  [Voucher Mode], [Open Sales (#key-pill("F8")), press #key-pill("Ctrl + H") and select *Item Invoice*.],
  [Party A/c Name], [Select Sundry Debtor (e.g., `Alpha Infotech Pvt Ltd`, Gujarat State Code 24).],
  [Sales Ledger], [Select `Sales Local Taxable 18%` (or allow item-based auto tax allocation).],
  [Item Table], [Select Stock Item (e.g., `Dell Latitude 3420 Laptop`). Specify Godown, Quantity (5 Nos), and Rate (₹52,000/No). Taxable Value = ₹2,60,000.],
  [Tax Ledgers], [Below the item line, select `Output CGST` (9% = ₹23,400) and `Output SGST` (9% = ₹23,400). Total Invoice Value = *₹3,06,800*.],
  [E-Way Bill & Print], [If invoice value exceeds ₹50,000, Tally prompts for e-Way Bill dispatch details. Press #key-pill("Ctrl + A") to save and #key-pill("Alt + P") to print.]
)

== 9.2 Accounting Invoices (Service Invoice Mode)
*When to Use:* Mandatory for professional service firms, rent billing, freight forwarding, and AMC maintenance contracts where no physical inventory moves.
#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Invoice Field]], [#text(weight: "bold", fill: white)[Practical Field Configuration & Entry Step]],
  [Voucher Mode], [Open Sales (#key-pill("F8")), press #key-pill("Ctrl + H") and select *Accounting Invoice*.],
  [Party A/c Name], [Select Corporate Client (e.g., `Apex Global Mumbai`, Maharashtra State Code 27).],
  [Particulars (Ledger)], [Select service ledger `IT Consulting & System Architecture` (SAC 998314). Enter Amount = ₹50,000.00.],
  [Tax Ledger], [Because Party State (27) != Company State (24), select `Output IGST` (18% = ₹9,000.00). Total = *₹59,000.00*.],
  [TDS Deduction], [Client deducts 10% TDS under Section 194J (₹5,000) on taxable value, remitting net ₹54,000 via NEFT.]
)
"""

    # TOPIC 10
    chapters[10] = """
= Topic 10: Master Keyboard Shortcuts of Tally Prime

Speed and keyboard fluidity distinguish novice data-entry operators from elite corporate accountants. Here are the 40+ authentic keyboard shortcuts directly curated from Rahul Sir's official IANT Palanpur handbook:

#table(
  columns: (1fr, 1.4fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[Shortcut Key]], [#text(weight: "bold", fill: white)[Function in Tally Prime]], [#text(weight: "bold", fill: white)[Corporate Accounting Practical Usage]],
  [#key-pill("Alt + G")], [Go To (Universal Search)], [Open any report or create masters on-the-fly without leaving active voucher.],
  [#key-pill("Ctrl + G")], [Switch To], [Switch completely to another report or menu screen.],
  [#key-pill("Esc")], [Escape / Go Back], [Close currently active popup or return to previous screen.],
  [#key-pill("Alt + K")], [Company Top Menu], [Create, alter, select, shut companies, or configure security.],
  [#key-pill("F2")], [Change Date], [Change the voucher date during daily transaction recording.],
  [#key-pill("Alt + F2")], [Change Financial Period], [Change accounting period (e.g., from 01-Apr-2026 to 31-Mar-2027).],
  [#key-pill("F3")], [Switch Company], [Switch active company from the list of loaded companies.],
  [#key-pill("Alt + F3")], [Select / Open Company], [Select and open another company from local disk or network path.],
  [#key-pill("Alt + Y")], [Data Menu], [Access backup, restore, split company data, and repair tools.],
  [#key-pill("Alt + Z")], [Exchange Menu], [Synchronize multi-branch data between head office and regional stores.],
  [#key-pill("Alt + O")], [Import Menu], [Import masters, voucher data, and electronic bank statements.],
  [#key-pill("Alt + E")], [Export Menu], [Export reports to PDF, Excel, CSV, or XML formats.],
  [#key-pill("Alt + M")], [Email Menu], [Email tax invoices and ledger account statements directly to clients.],
  [#key-pill("Alt + P")], [Print Menu], [Print tax invoices, cheques, vouchers, and financial statements.],
  [#key-pill("F1")], [Help Menu], [Open TallyHelp documentation, keyboard guides, and upgrade wizards.],
  [#key-pill("F4")], [Contra Voucher], [Record cash-to-bank deposits, withdrawals, and inter-bank transfers.],
  [#key-pill("F5")], [Payment Voucher], [Record payments to suppliers, operational expenses, and tax deposits.],
  [#key-pill("F6")], [Receipt Voucher], [Record inward funds from customers, loans, and business incomes.],
  [#key-pill("F7")], [Journal Voucher], [Record non-cash adjustments, depreciation, prepaid deferrals, and TDS.],
  [#key-pill("F8")], [Sales Voucher], [Issue sales invoices for merchandise or professional services.],
  [#key-pill("F9")], [Purchase Voucher], [Record inward purchases of goods, raw materials, or trade inventory.],
  [#key-pill("Alt + F5")], [Debit Note], [Record purchase returns of defective stock or vendor debit notes.],
  [#key-pill("Alt + F6")], [Credit Note], [Record sales returns from customers or post-sale credit allowances.],
  [#key-pill("Alt + F7")], [Stock Journal], [Inter-godown stock transfers and manufacturing consumption/production.],
  [#key-pill("Ctrl + F7")], [Physical Stock], [Record physical stock count discrepancies during warehouse audit.],
  [#key-pill("Alt + F8")], [Delivery Note], [Generate delivery challan for goods dispatched before final bill.],
  [#key-pill("Alt + F9")], [Receipt Note (GRN)], [Record goods received from suppliers before invoice arrival.],
  [#key-pill("Ctrl + F4")], [Purchase Order], [Generate legal purchase orders issued to vendors.],
  [#key-pill("Ctrl + F5")], [Sales Order], [Record sales orders received from corporate customers.],
  [#key-pill("F10")], [Other Vouchers], [Display complete master directory of all 24 voucher types.],
  [#key-pill("F11")], [Company Features], [Enable statutory GST, TDS, multi-currency, and inventory features.],
  [#key-pill("F12")], [Configuration], [Screen-specific configuration (hide/show fields, narration, buyer details).],
  [#key-pill("Alt + C")], [Secondary Create / Calc], [Create a ledger or stock item on-the-fly inside voucher / Open calculator.],
  [#key-pill("Ctrl + Enter")], [Alter Master from Voucher], [Open and modify any ledger or item master directly from the voucher line.],
  [#key-pill("Ctrl + A")], [Accept & Save Instantly], [Save and post the current screen or voucher immediately.],
  [#key-pill("Alt + D")], [Delete Voucher / Master], [Permanently delete a voucher, ledger, or stock item (if unused).],
  [#key-pill("Alt + X")], [Cancel Voucher], [Cancel a voucher while keeping voucher number intact for audit sequence.],
  [#key-pill("Ctrl + H")], [Change Voucher Mode], [Toggle between Item Invoice, Accounting Invoice, and As Voucher.],
  [#key-pill("Ctrl + I")], [More Details], [Input sub-details (e-Way bill, vehicle number, dispatch location).],
  [#key-pill("Alt + R")], [Recall Narration], [Copy the narration entered in the previous voucher of the same type.],
  [#key-pill("Ctrl + T")], [Post-Dated Voucher], [Flag voucher as post-dated for future cheques without affecting today's books.],
  [#key-pill("Spacebar")], [Select / Deselect Row], [Select one or multiple transaction rows in reports for batch printing/export.]
)
"""

    # TOPIC 11
    chapters[11] = """
= Topic 11: Professional Intermediate Highlights (Bridge to Corporate Accounting)

To bridge the gap between junior bookkeeping and senior corporate accounting, every student must understand four vital corporate practices:

== 11.1 GST Reforms & Statutory Returns Reconciliation
Corporate accountants do not merely create invoices—they reconcile books with the GST Common Portal:
- *GSTR-1:* Monthly statement of Outward Supplies (Sales) filed by the 11th of the following month.
- *GSTR-3B:* Self-declared monthly tax summary return filed by the 20th, offsetting Output Tax against eligible ITC.
- *GSTR-2B Matching:* A static auto-generated ITC statement compiled on the 14th of each month reflecting supplies uploaded by vendors. *Golden Rule:* If a vendor has not uploaded their sales bill in GSTR-1, it will not appear in your GSTR-2B, and claiming ITC is legally barred under Section 16(2)(aa)! Tally Prime's *Reconciliation Report* matches purchase books with JSON from the GST portal in seconds.

== 11.2 Bank Reconciliation Statement (BRS)
The bank balance shown in company books rarely matches the balance on the bank statement due to timing differences:
- *Cheques issued but not yet presented for payment by suppliers.*
- *Cheques deposited into bank but not yet cleared/credited.*
- *Direct bank charges, ECS loan EMIs, or interest credited directly by bank.*
*How to Reconcile in Tally:* Navigate to *Gateway of Tally -> Banking -> Bank Reconciliation*. Enter the actual *Bank Clearance Date* against each transaction. Tally auto-reconciles the difference to zero! Tally Prime also supports *Auto BRS* by importing digital CSV/MT940 statements directly from HDFC, SBI, ICICI, and Axis banks.

== 11.3 Cost Centres & Cost Categories
In corporate enterprises, management needs to track profitability by branch, department, or construction project without cluttering the Balance Sheet with hundreds of redundant ledgers:
- *Cost Category:* The broad organizational division (e.g., `Regional Branches` or `Marketing Projects`).
- *Cost Centre:* The specific unit under the category (e.g., `Ahmedabad Branch`, `Surat Branch`, `Palanpur Hub`).
When recording an operational expense (e.g., ₹60,000 in *Travelling Expenses*), Tally prompts for Cost Centre allocation: Ahmedabad (₹30k), Surat (₹20k), Palanpur (₹10k). Management obtains departmental P&L reports instantly!

== 11.4 Year-End Closing & Company Data Splitting
On 31st March, certified corporate accountants finalize financial statements:
1. Pass depreciation adjustments on fixed assets as per Companies Act and IT Act.
2. Provide for outstanding expenses (March salaries, electricity, audit fees).
3. Defer unexpired prepaid expenses (insurance, software annual licenses).
4. Perform physical stock inventory audit and reconcile book stock.
5. *Company Data Splitting (#key-pill("Alt + Y") -> Split):* At the start of the new financial year (1st April), split the historical database. Tally archives the preceding year and creates a clean new company where closing balances roll forward as opening balances!
"""

    return chapters
