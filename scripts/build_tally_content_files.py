# -*- coding: utf-8 -*-
"""
Builder for Tally Prime 11-Topic Master Content Modules
Generates:
  - scripts/tally_content_eng.py
  - scripts/tally_content_hi.py
  - scripts/tally_content_gu.py
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
"""

import os

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SCRIPTS_DIR = os.path.join(BASE_DIR, "scripts")

def generate_english():
    return '''# -*- coding: utf-8 -*-
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

Bharat Goenka founded *Peutronics Financial Services* in Bangalore in 1986 and developed the world\'s first "codeless" accounting software called *The Accountant*. In 1999, Peutronics was formally renamed *Tally Solutions Pvt. Ltd.* Today, headquartered in Bangalore, Tally dominates the Indian business landscape with over *80% market share* across MSMEs, manufacturing plants, retail chains, and Chartered Accountancy firms.

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
4. The unified installer detects existing installations. Click *Install* (default directory: `C:\\Program Files\\TallyPrime`).
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
*Tally Prime* is India\'s premier enterprise resource planning (ERP) and business management software. It seamlessly integrates financial accounting, inventory management, statutory tax compliance (GST & TDS), banking automation, purchase/sales order processing, and payroll into a unified, lightning-fast application.

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
  The hallmark innovation of Tally Prime is *Go To* (#key-pill("Alt + G")). In older software, if you were in the middle of entering a 30-item purchase bill and a customer walked in asking for their balance, you had to cancel or save the incomplete voucher. In Tally Prime, you simply press #key-pill("Alt + G"), type "Balance Sheet" or "Ledger Voucher", review or print the customer\'s account, and press *Esc* to return directly to your active, unsaved purchase voucher without losing a single keystroke!
]
"""

    # TOPIC 03
    chapters[3] = """
= Topic 03: Comprehensive GST & TDS Foundation (Full Details & Slabs)

== 3.1 Understanding Goods and Services Tax (GST)
Implemented on *1st July 2017* via the *101st Constitutional Amendment Act*, the Goods and Services Tax (GST) dismantled India\'s fragmented indirect tax web (Central Excise, Service Tax, State VAT, Entry Tax, Luxury Tax) under the motto *"One Nation, One Tax, One Market"*.

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
  [Sec 194C], [Payments to Contractors / Subcontractors], [1% (Ind/HUF)\\ 2% (Companies)], [Single contract exceeding ₹30,000 or aggregate FY payments exceeding ₹1,00,000. Applies to transport, catering, advertising.],
  [Sec 194J], [Fees for Professional or Technical Services], [10% (Prof)\\ 2% (Tech/BPO)], [Aggregate payment exceeding ₹30,000 per financial year. Applies to CA audit fees, legal charges, IT programming services.],
  [Sec 194I], [Rent of Land, Building or Machinery], [10% (Land/Bldg)\\ 2% (Plant/Mach)], [Aggregate rent exceeding ₹2,40,000 per financial year per payee.],
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
  [Personal Account], [*Debit the Receiver*\\ (જે વ્યક્તિ લાભ મેળવે તેને ઉધાર કરો / पाने वाले को डेबिट करो)], [*Credit the Giver*\\ (જે વ્યક્તિ લાભ આપે તેને જમા કરો / देने वाले को क्रेडिट करो)],
  [Real Account], [*Debit what comes in*\\ (ધંધામાં જે માલ/મિલકત આવે તે ઉધાર / जो वस्तु व्यापार में आए उसे डेबिट)], [*Credit what goes out*\\ (ધંધામાંથી જે માલ/મિલકત જાય તે જમા / जो वस्तु व्यापार से जाए उसे क्रेडिट)],
  [Nominal Account], [*Debit all expenses and losses*\\ (ધંધાના તમામ ખર્ચ કે નુકસાન ઉધાર કરો / सभी खर्चों एवं हानियों को डेबिट)], [*Credit all incomes and gains*\\ (ધંધાની તમામ આવક કે ઉપજ જમા કરો / सभी आय एवं लाभों को क्रेडिट)]
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
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[15 PRIMARY GROUPS:]\\
      1. Capital Account\\
      2. Loans (Liability)\\
      3. Current Liabilities\\
      4. Fixed Assets\\
      5. Current Assets\\
      6. Investments\\
      7. Miscellaneous Expenses (Asset)\\
      8. Suspense Account\\
      9. Branch / Divisions\\
      10. Sales Accounts\\
      11. Purchase Accounts\\
      12. Direct Incomes\\
      13. Indirect Incomes\\
      14. Direct Expenses\\
      15. Indirect Expenses
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), inset: 8pt, radius: 4pt)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#1D4ED8"))[13 SECONDARY (SUB) GROUPS:]\\
      1. Reserves & Surplus (under Capital Account)\\
      2. Bank OD A/c (under Loans Liability)\\
      3. Secured Loans (under Loans Liability)\\
      4. Unsecured Loans (under Loans Liability)\\
      5. Duties & Taxes (under Current Liabilities)\\
      6. Provisions (under Current Liabilities)\\
      7. Sundry Creditors (under Current Liabilities)\\
      8. Bank Accounts (under Current Assets)\\
      9. Cash-in-Hand (under Current Assets)\\
      10. Deposits (Asset) (under Current Assets)\\
      11. Loans & Advances (Asset) (under Current Assets)\\
      12. Stock-in-Hand (under Current Assets)\\
      13. Sundry Debtors (under Current Assets)
    ]
  ]
)

== 6.3 Exhaustive 50+ Ledger-to-Group Mapping Table
Directly modeled from Rahul Sir\'s authoritative classroom practice sheets:
#table(
  columns: (0.4fr, 2.2fr, 1.8fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Commercial Ledger Name]], [#text(weight: "bold", fill: white)[Tally Group Classification]], [#text(weight: "bold", fill: white)[Financial Statement & Nature]],
  [01], [Salman\'s Capital A/c], [Capital Account], [Balance Sheet (Owner\'s Equity)],
  [02], [Partner\'s Drawings A/c], [Capital Account], [Balance Sheet (Deducted from Equity)],
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
2. *Company Data Path:* Default storage directory (e.g., `C:\\ProgramData\\TallyPrime\\Data` or network drive).
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

Speed and keyboard fluidity distinguish novice data-entry operators from elite corporate accountants. Here are the 40+ authentic keyboard shortcuts directly curated from Rahul Sir\'s official IANT Palanpur handbook:

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
  [#key-pill("Ctrl + T")], [Post-Dated Voucher], [Flag voucher as post-dated for future cheques without affecting today\'s books.],
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
- *GSTR-2B Matching:* A static auto-generated ITC statement compiled on the 14th of each month reflecting supplies uploaded by vendors. *Golden Rule:* If a vendor has not uploaded their sales bill in GSTR-1, it will not appear in your GSTR-2B, and claiming ITC is legally barred under Section 16(2)(aa)! Tally Prime\'s *Reconciliation Report* matches purchase books with JSON from the GST portal in seconds.

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
'''

def generate_hindi():
    return '''# -*- coding: utf-8 -*-
"""
Tally Prime Master Curriculum — Hindi Edition (11 Comprehensive Topics)
Standardized by Rahul Patel (Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab)
"""

def get_hindi_chapters():
    chapters = {}

    # TOPIC 01
    chapters[1] = """
= अध्याय 01: टैली का इतिहास, विकास एवं टैली प्राइम डाउनलोडिंग

== 1.1 टैली का प्रादुर्भाव: एक गौरवशाली भारतीय नवाचार
टैली का इतिहास भारतीय सॉफ्टवेयर उद्योग की सबसे प्रेरक कहानियों में से एक है। वर्ष 1986 में, बैंगलोर के कपड़ा मशीनरी व्यवसायी *श्याम सुंदर गोयनका* जी अपने दैनिक व्यापारिक हिसाब-किताब की कागजी जटिलताओं से बेहद परेशान थे। उस समय उपलब्ध एकाउंटिंग सॉफ्टवेयर चलाने के लिए जटिल कंप्यूटर प्रोग्रामिंग और कोडिंग की आवश्यकता होती थी। उन्होंने अपने सुपुत्र *भरत गोयनका* (गणित स्नातक) के सामने एक चुनौती रखी कि वे एक ऐसा सॉफ्टवेयर बनाएं जिसे एक साधारण भारतीय मुनीम या व्यापारी बिना किसी प्रोग्रामिंग ज्ञान के, सरल अंग्रेजी में संचालित कर सके।

भरत गोयनका जी ने 1986 में बैंगलोर में *प्यूट्रोनिक्स फाइनेंशियल सर्विसेज (Peutronics)* की स्थापना की और विश्व का पहला "कोडलेस" एकाउंटिंग सॉफ्टवेयर बनाया जिसका नाम *द एकाउंटेंट (The Accountant)* रखा गया। 1999 में कंपनी का नाम बदलकर औपचारिक रूप से *टैली सॉल्यूशंस प्राइवेट लिमिटेड (Tally Solutions Pvt. Ltd.)* कर दिया गया। आज बैंगलोर स्थित टैली सॉल्यूशंस भारत के एमएसएमई, विनिर्माण कारखानों, खुदरा श्रृंखलाओं और सीए फर्मों में *80% से अधिक बाजार हिस्सेदारी* के साथ एकाउंटिंग का निर्विवाद सम्राट है।

#concept-box(title: "टैली सॉफ्टवेयर की ऐतिहासिक विकास यात्रा")[
  - *टैली 4.5 (1990 का दशक):* डॉस (DOS) आधारित, कीबोर्ड संचालित बुनियादी बहीखाता प्रणाली।
  - *टैली 5.4 (1998):* विंडोज ऑपरेटिंग सिस्टम पर आधारित पहला ग्राफिकल यूजर इंटरफेस संस्करण।
  - *टैली 6.3 (2001):* डेटा संचार, बहुभाषी प्रिंटिंग एवं शुरुआती सहायता प्रणाली से युक्त।
  - *टैली 7.2 (2005):* राज्य स्तरीय वैट (VAT), सर्विस टैक्स एवं केंद्रीय उत्पाद शुल्क का एकीकरण।
  - *टैली 8.1 एवं 9 (2006):* बहु-मुद्रा (Multi-currency) एवं पॉइंट ऑफ सेल (POS) रिटेल बिलिंग।
  - *टैली.ईआरपी 9 (2009 - 2020):* भारत का सबसे लोकप्रिय ईआरपी वर्कहॉर्स, जिसमें 2017 में ऐतिहासिक जीएसटी जोड़ा गया।
  - *टैली प्राइम (2020 - वर्तमान):* नए रूप में पुनर्जीवित, जिसमें आधुनिक टॉप-बार नेविगेशन, मल्टी-टास्किंग (Alt+G), एकीकृत इंस्टॉलर और सीधे ई-इनवॉइसिंग व ई-वे बिल की सुविधा शामिल है।
]

== 1.2 टैली प्राइम कैसे डाउनलोड एवं इंस्टॉल करें
आधिकारिक एवं डिजिटल रूप से हस्ताक्षरित टैली प्राइम डाउनलोड करने की सरल प्रक्रिया:
1. अपने कंप्यूटर पर कोई भी वेब ब्राउज़र (Google Chrome, Edge) खोलें और आधिकारिक वेबसाइट पर जाएं: #link("https://tallysolutions.com")[tallysolutions.com]।
2. होमपेज पर शीर्ष दाईं ओर दिए गए *Download* बटन पर क्लिक करें। नवीनतम `Setup.exe` फाइल (लगभग 45 MB) डाउनलोड होगी।
3. डाउनलोड की गई `Setup.exe` पर राइट क्लिक करके *Run as Administrator* चुनें।
4. एकीकृत इंस्टॉलर आपके सिस्टम की जांच करेगा। *Install* बटन पर क्लिक करें (डिफ़ॉल्ट डायरेक्टरी: `C:\\Program Files\\TallyPrime`)।
5. इंस्टॉलेशन पूर्ण होने पर डेस्कटॉप आइकन से टैली प्राइम शुरू करें।

== 1.3 टैली प्राइम के लाइसेंसिंग प्रकार
टैली प्राइम शुरू करते समय आपको चार स्टार्टअप विकल्प मिलते हैं:
#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[लाइसेंस संस्करण]], [#text(weight: "bold", fill: white)[यूजर एक्सेस सीमा]], [#text(weight: "bold", fill: white)[व्यावहारिक विशेषताएं एवं नियम]],
  [सिल्वर एडिशन (सिंगल यूजर)], [एक समय में 1 कंप्यूटर], [स्टैंडअलोन कंप्यूटर हेतु पूर्ण व्यावसायिक लाइसेंस। छोटे रिटेल स्टोर, व्यक्तिगत व्यापारियों एवं स्वतंत्र अकाउंटेंट्स के लिए आदर्श।],
  [गोल्ड एडिशन (मल्टी-यूजर)], [लोकल लैन पर असीमित कंप्यूटर], [लोकल एरिया नेटवर्क (LAN) से जुड़े सभी ऑफिस कंप्यूटरों पर एक साथ असीमित कार्य की सुविधा। सीए फर्मों, कॉरपोरेट कार्यालयों और बड़े कारखानों का मानक।],
  [एजुकेशनल मोड], [सिंगल यूजर (पूर्णतः निःशुल्क)], [विद्यार्थियों एवं आईएएनटी पालनपुर जैसे संस्थानों हेतु विशेष रूप से डिजाइन। *महत्वपूर्ण प्रतिबंध:* वाउचर्स केवल माह की *1, 2 और 31 तारीख* को ही प्रविष्ट किए जा सकते हैं। सभी एकाउंटिंग नियम एवं रिपोर्ट्स शत-प्रतिशत चालू रहती हैं!],
  [रेंटल मोड], [मासिक / त्रैमासिक सदस्यता], [अस्थायी या मौसमी व्यापार हेतु बिना पूर्ण पूंजी निवेश के अल्पकालिक लाइसेंसिंग सुविधा।]
)
"""

    # TOPIC 02
    chapters[2] = """
= अध्याय 02: टैली प्राइम क्या है एवं इसका सिस्टम आर्किटेक्चर

== 2.1 टैली प्राइम क्या है?
*टैली प्राइम* भारत का अग्रणी बिजनेस मैनेजमेंट एवं ईआरपी सॉफ्टवेयर है। यह वित्तीय एकाउंटिंग, इन्वेंटरी (स्टॉक) नियंत्रण, सांविधिक कर अनुपालन (जीएसटी एवं टीडीएस), बैंकिंग समाधान, खरीद-बिक्री ऑर्डर और पेरोल को एक ही सरल एप्लीकेशन में समाहित करता है।

अन्य सॉफ्टवेयरों के विपरीत जहाँ लंबे एकाउंटिंग कोड याद रखने पड़ते हैं, टैली प्राइम में लेनदेन को स्वाभाविक व्यावसायिक भाषा में दर्ज किया जाता है। एक सामान्य सेल्स इनवॉइस दर्ज करते ही ग्राहक का खाता, स्टॉक समरी, ट्रायल बैलेंस, लाभ-हानि खाता, बैलेंस शीट और जीएसटी रिटर्न पलक झपकते ही स्वतः अपडेट हो जाते हैं!

== 2.2 इन-मेमोरी "कैक्टस (Cactus)" डेटाबेस इंजन
टैली प्राइम की अद्‍भुत गति इसके स्वदेशी इन-मेमोरी डेटाबेस इंजन *कैक्टस (Cactus)* पर आधारित है:
- *शून्य लेटेंसी इन-मेमोरी प्रोसेसिंग:* रिलेशनल डेटाबेस (जैसे SQL/Oracle) डिस्क पर बार-बार क्वेरी चलाते हैं। इसके विपरीत टैली पूरी कंपनी के चार्ट ऑफ एकाउंट्स और वाउचर्स को सीधे कंप्यूटर की रैम (RAM) में लोड करता है।
- *रीयल-टाइम री-कैलकुलेशन:* जब भी कोई इनवॉइस सुरक्षित होती है, कैक्टस इंजन लाखों प्रविष्टियों के बीच तुरंत वित्तीय अनुपातों और स्टॉक मूल्यांकन (FIFO, भारित औसत) की सटीक गणना मिलीसेकंड में कर देता है।
- *टीडीएल (Tally Definition Language) विस्तारण:* टैली की प्रत्येक स्क्रीन, रिपोर्ट और इनवॉइस फॉर्मेट टीडीएल में कोडित है, जिससे इसे किसी भी उद्योग की आवश्यकतानुसार आसानी से कस्टमाइज किया जा सकता है।

== 2.3 इंटरफेस आर्किटेक्चर एवं टॉप-बार नेविगेशन
टैली प्राइम का आधुनिक टॉप-बार मेनू हर स्क्रीन पर उपलब्ध रहता है:
#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[टॉप मेनू घटक]], [#text(weight: "bold", fill: white)[कीबोर्ड शॉर्टकट]], [#text(weight: "bold", fill: white)[व्यावहारिक कार्य]],
  [कंपनी मेनू], [#key-pill("Alt + K")], [कंपनी बनाना, बदलना, चुनना, बंद करना और यूजर पासवर्ड सेट करना।],
  [डेटा मेनू], [#key-pill("Alt + Y")], [कंपनी डेटा का बैकअप लेना, रिस्टोर करना, डेटा विभाजित (Split) करना एवं रिपेयर करना।],
  [एक्सचेंज मेनू], [#key-pill("Alt + Z")], [शाखाओं और प्रधान कार्यालय के बीच ऑनलाइन डेटा सिंक्रोनाइजेशन करना।],
  [इंपोर्ट मेनू], [#key-pill("Alt + O")], [लेजर, स्टॉक आइटम, लेनदेन एवं बैंक ई-स्टेटमेंट सीधे आयात करना।],
  [एक्सपोर्ट मेनू], [#key-pill("Alt + E")], [रिपोर्ट्स और इनवॉइस को पीडीएफ, एक्सेल, एक्सएमएल या सीएसवी में निर्यात करना।],
  [ईमेल मेनू], [#key-pill("Alt + M")], [टैली स्क्रीन से सीधे ग्राहक को इनवॉइस या लेजर स्टेटमेंट ईमेल करना।],
  [प्रिंट मेनू], [#key-pill("Alt + P")], [टैक्स इनवॉइस, चेक, वाउचर और बैलेंस शीट को सीधे प्रिंट करना।],
  [हेल्प मेनू], [#key-pill("F1")], [टैली हेल्प विषय, शॉर्टकट सूची, लाइसेंस रिन्यूअल और सॉफ्टवेयर अपडेट खोलना।]
)

#v(6pt)

#concept-box(title: "क्रांतिकारी यूनिवर्सल मल्टी-टास्किंग: गो-टू (Alt + G)")[
  टैली प्राइम की सबसे बड़ी ताकत *Go To* (#key-pill("Alt + G")) है। पुराने सिस्टम में 25 आइटमों का बिल बनाते समय यदि कोई ग्राहक लेजर मांगने आ जाए तो बिल रद्द करना पड़ता था। टैली प्राइम में आप सीधे #key-pill("Alt + G") दबाकर लेजर देख सकते हैं, प्रिंट कर सकते हैं और *Esc* दबाकर बिना कोई डेटा खोए वापस अपने उसी अधूरे बिल पर लौट सकते हैं!
]
"""

    # TOPIC 03
    chapters[3] = """
= अध्याय 03: संपूर्ण जीएसटी एवं टीडीएस आधारशिला (विस्तृत नियम व स्लैब्स)

== 3.1 माल एवं सेवा कर (जीएसटी) का मूल सिद्धांत
*1 जुलाई 2017* को *101वें संविधान संशोधन अधिनियम* द्वारा भारत में जीएसटी लागू किया गया, जिसने पुराने अप्रत्यक्ष करों (एक्साइज, वैट, सर्विस टैक्स, एंट्री टैक्स) को समाप्त कर *"एक राष्ट्र, एक कर, एक बाजार"* की स्थापना की।

जीएसटी एक *अप्रत्यक्ष, गंतव्य-आधारित (Destination-based), व्यापक बहु-स्तरीय उपभोग कर* है। कर का राजस्व उस राज्य को मिलता है जहाँ वस्तु या सेवा का अंतिम उपभोग होता है (*Place of Supply*)।

== 3.2 दोहरा जीएसटी ढांचा: इंट्रा-स्टेट बनाम इंटर-स्टेट
भारत के संघीय ढांचे को सुरक्षित रखने हेतु दोहरी जीएसटी प्रणाली अपनाई गई है:
- *इंट्रा-स्टेट आपूर्ति (एक ही राज्य के भीतर, जैसे गुजरात से गुजरात):*
  $ "कुल जीएसटी" = "CGST (केंद्रीय कर 50%)" + "SGST (राज्य कर 50%)" $
- *इंटर-स्टेट आपूर्ति (दो अलग राज्यों के बीच, जैसे गुजरात से महाराष्ट्र/दिल्ली):*
  $ "कुल जीएसटी" = "IGST (एकीकृत कर 100%)" $
- *केंद्र शासित प्रदेश (जैसे दमन व दीव, लद्दाख):*
  $ "कुल जीएसटी" = "CGST" + "UTGST" $

== 3.3 आधुनिक तर्कसंगत जीएसटी स्लैब्स (किसमें क्या आता है)
#table(
  columns: (0.9fr, 1.4fr, 2.7fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[जीएसटी स्लैब]], [#text(weight: "bold", fill: white)[व्यापारिक श्रेणी]], [#text(weight: "bold", fill: white)[सटीक वस्तुएं, सेवाएं एवं व्यावहारिक उदाहरण]],
  [0% (00 स्लैब)], [करमुक्त कच्ची कृषि जींस एवं बुनियादी सेवाएं], [एपीएमसी मंडी से सीधे किसानों की गैर-ब्रांडेड खुली कृषि जींस: कच्चा जीरा, ईसबगोल, ताजी हरी सब्जियां, कच्चा अदूषित दूध, खुला दही, नमक, खुला अनाज, जैविक खाद और बुनियादी स्वास्थ्य/शिक्षा सेवाएं।],
  [5% (05 स्लैब)], [दैनिक आवश्यक सामग्री एवं जन-परिवहन], [पैक्ड खाद्य तेल (सरसों, मूंगफली, सोयाबीन), चाय पत्ती, कॉफी बीन्स, पैक्ड मसाले (जीरा पाउडर, हल्दी), ₹1,000 से कम मूल्य के जूते-चप्पल, सूती कपड़ा, रेलवे स्लीपर/इकोनॉमी टिकट, माल परिवहन (GTA), एवं जीवनरक्षक दवाएं।],
  [18% (18 स्लैब)], [मानक औद्योगिक उत्पाद व कॉरपोरेट सेवाएं], [आईटी हार्डवेयर, डेस्कटॉप कंप्यूटर, लैपटॉप, सर्वर, स्मार्टफोन, इलेक्ट्रॉनिक्स, औद्योगिक मशीनरी, सॉफ्टवेयर, सीए एवं कानूनी सलाह शुल्क, टेलीकॉम और ₹1,000 से अधिक मूल्य के होटल कमरे।],
  [12% व 28%], [विशिष्ट खाद्य एवं विलासिता/हानिकारक उत्पाद], [*12%:* प्रोसेस्ड फूड, डेयरी मशीनरी। *28% + उपकर (Cess):* विलासिता कारें, रेसिंग बाइक, पान मसाला, सिगरेट-तंबाकू उत्पाद और कार्बोनेटेड शीतल पेय।]
)

== 3.4 इनपुट टैक्स क्रेडिट (ITC) एवं इसका समायोजन क्रम
व्यापार में कर पर कर (Tax on Tax) रोकने हेतु इनपुट टैक्स क्रेडिट (ITC) दिया जाता है। खरीद पर चुकाए गए टैक्स (*Input GST*) को बिक्री पर एकत्रित टैक्स (*Output GST*) से घटाया जाता है।
#concept-box(title: "आईटीसी उपयोग का वैधानिक नियम (धारा 49)")[
  1. *Input IGST* का उपयोग सर्वप्रथम 100% Output IGST के विरुद्ध होगा। शेष राशि को CGST या SGST से किसी भी अनुपात में घटा सकते हैं।
  2. *Input CGST* का उपयोग Output CGST से होगा, और शेष Output IGST से (*Input CGST कभी भी SGST से नहीं घट सकता!*)।
  3. *Input SGST* का उपयोग Output SGST से होगा, और शेष Output IGST से (*Input SGST कभी भी CGST से नहीं घट सकता!*)।
]

== 3.5 टीडीएस (Tax Deducted at Source) क्या है?
*आयकर अधिनियम, 1961* के तहत टीडीएस का उद्देश्य आय उत्पन्न होते ही उस पर कर की कटौती करना है। भुगतानकर्ता (*Deductor*) भुगतान की जाने वाली राशि से निर्धारित प्रतिशत काटकर सरकार के खाते में जमा करता है। इसके लिए 10-अंकीय *TAN (Tax Deduction Account Number)* अनिवार्य है।

#table(
  columns: (0.9fr, 1.4fr, 1.1fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[धारा]], [#text(weight: "bold", fill: white)[भुगतान की प्रकृति]], [#text(weight: "bold", fill: white)[टीडीएस दर]], [#text(weight: "bold", fill: white)[वार्षिक छूट सीमा एवं नियम]],
  [धारा 194C], [ठेकेदारों एवं उप-ठेकेदारों को भुगतान], [1% (व्यक्ति/HUF)\\ 2% (कंपनियां)], [एकल अनुबंध ₹30,000 से अधिक या वित्तीय वर्ष में कुल ₹1,00,000 से अधिक। माल ढुलाई, विज्ञापन, कैटरिंग पर लागू।],
  [धारा 194J], [व्यावसायिक एवं तकनीकी सेवा शुल्क], [10% (प्रोफेशनल)\\ 2% (तकनीकी/BPO)], [वित्तीय वर्ष में कुल भुगतान ₹30,000 से अधिक। सीए ऑडिट फीस, लीगल फीस, सॉफ्टवेयर डेवलपमेंट पर लागू।],
  [धारा 194I], [जमीन, भवन या मशीनरी का किराया], [10% (जमीन/भवन)\\ 2% (प्लांट/मशीन)], [वित्तीय वर्ष में कुल किराया ₹2,40,000 से अधिक होने पर लागू।],
  [धारा 194H], [कमीशन या दलाली भुगतान], [5%], [वित्तीय वर्ष में कुल कमीशन ₹15,000 से अधिक होने पर।],
  [धारा 206AA], [पैन कार्ड की अनिवार्यता], [*सीधे 20%*], [यदि भुगतान पाने वाला व्यक्ति अपना वैध पैन कार्ड प्रस्तुत नहीं करता, तो अनिवार्य रूप से 20% की दंडात्मक दर से टीडीएस कटेगा!]
)

*जमा व रिटर्न नियम:* काटा गया टीडीएस अगले माह की *7 तारीख* तक *चालान ITNS 281* द्वारा बैंक में जमा होता है। गैर-वेतन भुगतान हेतु *फॉर्म 26Q* में त्रैमासिक रिटर्न दाखिल किया जाता है।
"""

    # TOPIC 04
    chapters[4] = """
= अध्याय 04: लेजर, खातों के प्रकार एवं एकाउंटिंग के सुनहरे नियम

== 4.1 लेजर (खाता) क्या है?
डबल एंट्री बुककीपिंग और टैली में *लेजर* वह व्यक्तिगत बहीखाता रिकॉर्ड है जहाँ किसी विशिष्ट संपत्ति, दायित्व, पूंजी, आय अथवा व्यय से संबंधित सभी वित्तीय लेनदेन क्रमबद्ध रूप से दर्ज किए जाते हैं। प्रत्येक लेनदेन में कम से कम दो लेजर (एक डेबिट और एक क्रेडिट) प्रभावित होते हैं।

== 4.2 खातों के तीन मूलभूत प्रकार
व्यापारिक जगत के सभी खाते तीन श्रेणियों में विभाजित हैं:
1. *व्यक्तिगत खाते (Personal Accounts):* जीवित व्यक्तियों के खाते (जैसे राहुल पटेल खाता, रमेश खाता), कृत्रिम संस्थागत कानूनी खाते (जैसे एचडीएफसी बैंक लि., रिलायंस इंडस्ट्रीज, टाटा मोटर्स), एवं प्रतिनिधिक खाते (अदत्त वेतन खाता, पूर्वदत्त किराया खाता)।
2. *वास्तविक खाते (Real Accounts):* व्यापार की सभी भौतिक व अभौतिक संपत्तियों के खाते (जैसे रोकड़/कैश खाता, मशीनरी खाता, कंप्यूटर खाता, ऑफिस फर्नीचर खाता, गुडविल खाता)।
3. *नाममात्र खाते (Nominal Accounts):* व्यापार के सभी खर्चों, हानियों, आमदनी और लाभों के खाते (जैसे किराया खाता, वेतन खाता, ब्याज मिला खाता, छूट दी खाता, कमीशन खाता)।

== 4.3 एकाउंटिंग के सुनहरे नियम (Golden Rules of Accounting)
1494 में ल्यूका पैसिओली द्वारा रचित ये तीन स्वर्णिम नियम पूरी दुनिया की एकाउंटिंग का आधार हैं:
#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 6pt,
  [#text(weight: "bold", fill: white)[खाते का प्रकार]], [#text(weight: "bold", fill: white)[डेबिट का नियम (Dr.)]], [#text(weight: "bold", fill: white)[क्रेडिट का नियम (Cr.)]],
  [व्यक्तिगत खाता (Personal)], [*पाने वाले को डेबिट करो*\\ (Debit the Receiver)], [*देने वाले को क्रेडिट करो*\\ (Credit the Giver)],
  [वास्तविक खाता (Real)], [*जो वस्तु व्यापार में आए उसे डेबिट करो*\\ (Debit what comes in)], [*जो वस्तु व्यापार से जाए उसे क्रेडिट करो*\\ (Credit what goes out)],
  [नाममात्र खाता (Nominal)], [*सभी खर्चों एवं हानियों को डेबिट करो*\\ (Debit all expenses and losses)], [*सभी आय एवं लाभों को क्रेडिट करो*\\ (Credit all incomes and gains)]
)

== 4.4 20 व्यावहारिक Dr/Cr उदाहरण एवं एकाउंटिंग तर्क
#table(
  columns: (0.4fr, 2.4fr, 1.2fr, 1.2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[क्र.]], [#text(weight: "bold", fill: white)[व्यापारिक लेनदेन]], [#text(weight: "bold", fill: white)[डेबिट लेजर]], [#text(weight: "bold", fill: white)[क्रेडिट लेजर]], [#text(weight: "bold", fill: white)[एकाउंटिंग नियम एवं कारण]],
  [01], [₹5,00,000 नकद लगाकर व्यापार शुरू किया], [Cash A/c (₹5L)], [Capital A/c (₹5L)], [Real (कैश व्यापार में आया = Dr) | Personal (मालिक ने दिया = Cr)],
  [02], [एचडीएफसी बैंक में ₹2,00,000 नकद जमा किए], [HDFC Bank A/c], [Cash A/c], [Personal (बैंक पाने वाला = Dr) | Real (कैश गया = Cr)],
  [03], [व्यापार हेतु ₹45,000 का ऑफिस कंप्यूटर नकद खरीदा], [Computer A/c], [Cash A/c], [Real (कंप्यूटर संपत्ति आई = Dr) | Real (कैश गया = Cr)],
  [04], [₹50,000 का माल नकद खरीदा], [Purchase A/c], [Cash A/c], [Nominal (खरीद खर्च = Dr) | Real (कैश गया = Cr)],
  [05], [राजेश ब्रदर्स से ₹1,20,000 का माल उधार खरीदा], [Purchase A/c], [Rajesh Bros A/c], [Nominal (खर्च = Dr) | Personal (राजेश माल देने वाला = Cr)],
  [06], [₹40,000 का माल नकद बेचा], [Cash A/c], [Sales A/c], [Real (कैश आया = Dr) | Nominal (बिक्री आमदनी = Cr)],
  [07], [मेहता ट्रेडर्स को ₹95,000 का माल उधार बेचा], [Mehta Traders A/c], [Sales A/c], [Personal (मेहता पाने वाला = Dr) | Nominal (बिक्री आय = Cr)],
  [08], [ऑफिस किराया ₹18,000 चेक द्वारा दिया], [Office Rent A/c], [HDFC Bank A/c], [Nominal (किराया खर्च = Dr) | Personal (बैंक देने वाला = Cr)],
  [09], [कर्मचारियों को ₹35,000 नकद वेतन दिया], [Salary A/c], [Cash A/c], [Nominal (वेतन खर्च = Dr) | Real (कैश गया = Cr)],
  [10], [चेक द्वारा कमीशन मिला ₹12,000], [HDFC Bank A/c], [Commission A/c], [Personal (बैंक पाने वाला = Dr) | Nominal (कमीशन आय = Cr)],
  [11], [मालिक ने निजी उपयोग हेतु ₹15,000 नकद निकाले], [Drawings A/c], [Cash A/c], [Personal (मालिक पाने वाला = Dr) | Real (कैश गया = Cr)],
  [12], [राजेश ब्रदर्स को ₹1,18,000 दिए, ₹2,000 छूट मिली], [Rajesh Bros (₹1.2L)], [Cash / Discount Rec.], [Personal (Dr) | Real (Cr Cash ₹1.18L) | Nominal (Cr लाभ ₹2k)],
  [13], [मेहता ट्रेडर्स से ₹93,500 मिले, ₹1,500 छूट दी], [Cash / Discount All.], [Mehta Traders], [Real (Dr Cash ₹93.5k) | Nominal (Dr हानि ₹1.5k) | Personal (Cr)],
  [14], [कंप्यूटर पर ₹4,500 मूल्यह्रास (Depreciation) लगाया], [Depreciation A/c], [Computer A/c], [Nominal (हानि = Dr) | Real (संपत्ति का मूल्य घटा = Cr)],
  [15], [बिजली बिल का नकद भुगतान किया ₹4,200], [Electricity Exp A/c], [Cash A/c], [Nominal (खर्च = Dr) | Real (कैश गया = Cr)],
  [16], [पुराना ऑफिस फर्नीचर ₹8,000 में नकद बेचा], [Cash A/c], [Furniture A/c], [Real (कैश आया = Dr) | Real (फर्नीचर गया = Cr)],
  [17], [गोदाम में आग लगने से ₹10,000 का माल नष्ट हुआ], [Loss by Fire A/c], [Purchase A/c], [Nominal (हानि = Dr) | Real/Nominal (माल कम हुआ = Cr)],
  [18], [माल खरीद पर ₹3,500 भाड़ा (Carriage Inward) दिया], [Carriage Inward A/c], [Cash A/c], [Nominal (प्रत्यक्ष खर्च = Dr) | Real (कैश गया = Cr)],
  [19], [बैंक ने चालू खाते में ₹2,400 ब्याज जमा किया], [HDFC Bank A/c], [Bank Interest Rec.], [Personal (बैंक बैलेंस बढ़ा = Dr) | Nominal (ब्याज आय = Cr)],
  [20], [ऑफिस पेटी कैश हेतु बैंक से ₹25,000 निकाले], [Cash A/c], [HDFC Bank A/c], [Real (कैश आया = Dr) | Personal (बैंक देने वाला = Cr)]
)
"""

    # TOPIC 05
    chapters[5] = """
= अध्याय 05: वाउचर्स एवं वाउचर्स की 4 प्रमुख श्रेणियां

== 5.1 वाउचर क्या है?
एकाउंटिंग और टैली प्राइम में *वाउचर* वह औपचारिक कानूनी दस्तावेज या प्रविष्टि पर्ची है जो किसी वित्तीय या इन्वेंटरी लेनदेन के पूर्ण विवरण को प्रमाणित करती है। आयकर और जीएसटी ऑडिट में वाउचर ही मुख्य साक्ष्य होते हैं।

== 5.2 वाउचर्स की 4 मुख्य श्रेणियां
1. *एकाउंटिंग वाउचर्स (Accounting Vouchers):* शुद्ध वित्तीय लेनदेन (रोकड़, बैंक, जर्नल) जो बिना स्टॉक बदले खातों को प्रभावित करते हैं।
2. *इन्वेंटरी वाउचर्स (Inventory Vouchers):* भौतिक माल की प्राप्ति, प्रेषण या गोदाम हस्तांतरण के वाउचर (स्टॉक जर्नल, डिलीवरी नोट)।
3. *ऑर्डर वाउचर्स (Order Vouchers):* अग्रिम व्यापारिक प्रतिबद्धताएं (परचेज ऑर्डर एवं सेल्स ऑर्डर)।
4. *नॉन-एकाउंटिंग / मेमो वाउचर्स (Memo Vouchers):* अनंतिम प्रविष्टियां (मेमोरेंडम, रिवर्सिंग जर्नल) जो अंतिम खातों को प्रभावित नहीं करतीं।

== 5.3 24 प्रमुख वाउचर्स एवं शॉर्टकट कुंजियां
#table(
  columns: (0.9fr, 1.4fr, 1.1fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[शॉर्टकट]], [#text(weight: "bold", fill: white)[वाउचर का नाम]], [#text(weight: "bold", fill: white)[श्रेणी]], [#text(weight: "bold", fill: white)[उपयोग एवं व्यावहारिक उदाहरण]],
  [#key-pill("F4")], [कॉन्ट्रा (Contra)], [एकाउंटिंग], [कैश-बैंक के आंतरिक लेनदेन: बैंक में कैश जमा, बैंक से नकद निकासी, या एक बैंक से दूसरे बैंक में ट्रांसफर।],
  [#key-pill("F5")], [पेमेंट (Payment)], [एकाउंटिंग], [सप्लायरों को भुगतान, वेतन, किराया, बिजली बिल एवं टैक्स चालान का नकद या बैंक द्वारा भुगतान।],
  [#key-pill("F6")], [रिसीट (Receipt)], [एकाउंटिंग], [ग्राहकों से नकद/चेक प्राप्ति, मालिक की पूंजी, ब्याज एवं आमदनी की प्राप्तियां।],
  [#key-pill("F7")], [जर्नल (Journal)], [एकाउंटिंग], [गैर-नकद समायोजन: मूल्यह्रास, अदत्त खर्चों का प्रावधान, टीडीएस कटौती एवं संपत्तियों की उधार खरीद।],
  [#key-pill("F8")], [सेल्स (Sales)], [एकाउंटिंग], [ग्राहकों को माल या पेशेवर सेवाओं की बिक्री का बिल।],
  [#key-pill("F9")], [परचेज (Purchase)], [एकाउंटिंग], [सप्लायरों से कच्चा माल, व्यापारिक स्टॉक या पूंजीगत संपत्तियों की खरीद।],
  [#key-pill("Alt + F5")], [डेबिट नोट (Debit Note)], [एकाउंटिंग], [सप्लायर को खराब माल की वापसी (Purchase Return) या बिल राशि में कटौती का समायोजन।],
  [#key-pill("Alt + F6")], [क्रेडिट नोट (Credit Note)], [एकाउंटिंग], [ग्राहक द्वारा माल वापसी (Sales Return) स्वीकार करना या बिक्री उपरांत छूट देना।],
  [#key-pill("Alt + F7")], [स्टॉक जर्नल (Stock Journal)], [इन्वेंटरी], [माल को मुख्य गोदाम से शाखा गोदाम में भेजना या विनिर्माण में कच्चे माल से पक्का माल बनाना।],
  [#key-pill("Ctrl + F7")], [फिजिकल स्टॉक (Physical Stock)], [इन्वेंटरी], [वार्षिक ऑडिट में गोदाम के वास्तविक स्टॉक की गिनती दर्ज कर विसंगति दूर करना।],
  [#key-pill("Alt + F8")], [डिलीवरी नोट (Delivery Note)], [इन्वेंटरी], [अंतिम बिल बनने से पहले ग्राहक को माल भेजते समय डिलीवरी चालान निकालना।],
  [#key-pill("Alt + F9")], [रिसीट नोट (GRN)], [इन्वेंटरी], [सप्लायर से माल आते ही गोदाम में माल प्राप्ति रसीद (GRN) दर्ज करना।],
  [#key-pill("Ctrl + F8")], [रिजेक्शन्स आउट], [इन्वेंटरी], [बिल बनने से पहले खराब माल सप्लायर को तुरंत वापस भेजना।],
  [#key-pill("Ctrl + F9")], [रिजेक्शन्स इन], [इन्वेंटरी], [बिल बनने से पहले ग्राहक द्वारा अस्वीकार किया गया माल वापस लेना।],
  [#key-pill("Ctrl + F4")], [परचेज ऑर्डर], [ऑर्डर], [सप्लायर को माल भेजने हेतु कानूनी खरीद ऑर्डर जारी करना।],
  [#key-pill("Ctrl + F5")], [सेल्स ऑर्डर], [ऑर्डर], [ग्राहक से मिला औपचारिक आपूर्ति ऑर्डर बुक करना।],
  [#key-pill("Ctrl + F10")], [मेमोरेंडम वाउचर], [नॉन-एकाउंटिंग], [संदेहास्पद या याददाश्त प्रविष्टि जो अंतिम खातों में नहीं जुड़ती।],
  [#key-pill("F10")], [अन्य वाउचर्स (Other)], [मास्टर मेनू], [टैली के सभी 24 वाउचर्स की संपूर्ण सूची देखना।]
)
"""

    # TOPIC 06
    chapters[6] = """
= अध्याय 06: ग्रुप्स एवं लेजर्स की ग्रुप मैपिंग

== 6.1 टैली प्राइम में ग्रुप क्या है?
टैली में *ग्रुप (Group)* एक वर्गीकरण श्रेणी है जो यह तय करती है कि कोई लेजर बैलेंस शीट या लाभ-हानि खाते में किस शीर्ष के तहत प्रदर्शित होगा। टैली में *28 पूर्व-निर्धारित ग्रुप्स* होते हैं (15 प्राथमिक और 13 द्वितीयक)।

यदि कोई अकाउंटेंट सप्लायर का लेजर *Sundry Creditors* के बजाय *Direct Expenses* में बना दे, तो ट्रेडिंग खाते में लागत बढ़ जाएगी और बैलेंस शीट के दायित्व गलत हो जाएंगे!

== 6.2 15 प्राथमिक एवं 13 द्वितीयक ग्रुप्स
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(fill: rgb("#F0FDFA"), stroke: 1pt + rgb("#99F6E4"), inset: 8pt, radius: 4pt)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[15 प्राथमिक ग्रुप्स (Primary):]\\
      1. Capital Account\\
      2. Loans (Liability)\\
      3. Current Liabilities\\
      4. Fixed Assets\\
      5. Current Assets\\
      6. Investments\\
      7. Misc. Expenses (Asset)\\
      8. Suspense Account\\
      9. Branch / Divisions\\
      10. Sales Accounts\\
      11. Purchase Accounts\\
      12. Direct Incomes\\
      13. Indirect Incomes\\
      14. Direct Expenses\\
      15. Indirect Expenses
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), inset: 8pt, radius: 4pt)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#1D4ED8"))[13 द्वितीयक ग्रुप्स (Secondary):]\\
      1. Reserves & Surplus (Capital के तहत)\\
      2. Bank OD A/c (Loans Liab के तहत)\\
      3. Secured Loans (Loans Liab के तहत)\\
      4. Unsecured Loans (Loans Liab के तहत)\\
      5. Duties & Taxes (Current Liab के तहत)\\
      6. Provisions (Current Liab के तहत)\\
      7. Sundry Creditors (Current Liab के तहत)\\
      8. Bank Accounts (Current Assets के तहत)\\
      9. Cash-in-Hand (Current Assets के तहत)\\
      10. Deposits (Asset) (Current Assets के तहत)\\
      11. Loans & Advances (Asset) (Current Assets)\\
      12. Stock-in-Hand (Current Assets के तहत)\\
      13. Sundry Debtors (Current Assets के तहत)
    ]
  ]
)

== 6.3 50+ प्रामाणिक लेजर-ग्रुप मैपिंग तालिका
राहुल सर के शिक्षण नोट्स से सीधे संकलित:
#table(
  columns: (0.4fr, 2.2fr, 1.8fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[क्र.]], [#text(weight: "bold", fill: white)[लेजर का नाम]], [#text(weight: "bold", fill: white)[टैली ग्रुप वर्गीकरण]], [#text(weight: "bold", fill: white)[वित्तीय रिपोर्ट व प्रकृति]],
  [01], [सलमान कैपिटल खाता (Salman\'s Capital)], [Capital Account], [बैलेंस शीट (मालिक की पूंजी)],
  [02], [पार्टनर आहरण खाता (Drawings A/c)], [Capital Account], [बैलेंस शीट (पूंजी से घटेगा)],
  [03], [एचडीएफसी बैंक चालू खाता (HDFC Bank)], [Bank Accounts], [बैलेंस शीट (चालू संपत्ति)],
  [04], [एसबीआई कैश क्रेडिट/ओवरड्राफ्ट (SBI CC/OD)], [Bank OD A/c], [बैलेंस शीट (ऋण दायित्व)],
  [05], [पेटी कैश खाता (Petty Cash)], [Cash-in-hand], [बैलेंस शीट (चालू संपत्ति)],
  [06], [प्लांट एवं भारी मशीनरी (Plant & Machinery)], [Fixed Assets], [बैलेंस शीट (स्थाई संपत्ति)],
  [07], [ऑफिस कंप्यूटर एवं लैपटॉप], [Fixed Assets], [बैलेंस शीट (स्थाई संपत्ति)],
  [08], [ऑफिस फर्नीचर एवं फिटिंग्स], [Fixed Assets], [बैलेंस शीट (स्थाई संपत्ति)],
  [09], [मेहता ट्रेडर्स (ग्राहक/देनदार)], [Sundry Debtors], [बैलेंस शीट (चालू संपत्ति - प्राप्य)],
  [10], [राजेश ब्रदर्स (ग्राहक/देनदार)], [Sundry Debtors], [बैलेंस शीट (चालू संपत्ति - प्राप्य)],
  [11], [पटेल इलेक्ट्रॉनिक्स (सप्लायर/लेनदार)], [Sundry Creditors], [बैलेंस शीट (चालू दायित्व - देय)],
  [12], [अंबिका ट्रेडिंग कंपनी (सप्लायर)], [Sundry Creditors], [बैलेंस शीट (चालू दायित्व - देय)],
  [13], [Output CGST / SGST / IGST A/c], [Duties & Taxes], [बैलेंस शीट (चालू दायित्व - देय कर)],
  [14], [Input CGST / SGST / IGST A/c], [Duties & Taxes], [बैलेंस शीट (कर छूट संपत्ति - ITC)],
  [15], [ठेकेदार टीडीएस देय (TDS Sec 194C)], [Duties & Taxes], [बैलेंस शीट (चालू दायित्व)],
  [16], [प्रोफेशनल फीस टीडीएस (TDS Sec 194J)], [Duties & Taxes], [बैलेंस शीट (चालू दायित्व)],
  [17], [दुकान किराया सुरक्षा जमा (Security Deposit)], [Deposits (Asset)], [बैलेंस शीट (वापसी योग्य संपत्ति)],
  [18], [बिजली बोर्ड सुरक्षा जमा (Electricity Deposit)], [Deposits (Asset)], [बैलेंस शीट (दीर्घकालिक जमा)],
  [19], [स्टाफ को अल्पकालिक अग्रिम (Staff Advance)], [Loans & Advances (Asset)], [बैलेंस शीट (चालू संपत्ति)],
  [20], [सप्लायर को माल अग्रिम (Advance to Vendor)], [Loans & Advances (Asset)], [बैलेंस शीट (चालू संपत्ति)],
  [21], [बैंक ऑफ बड़ौदा टर्म लोन], [Secured Loans], [बैलेंस शीट (सुरक्षित ऋण दायित्व)],
  [22], [मित्र/डायरेक्टर से लिया गया लोन], [Unsecured Loans], [बैलेंस शीट (असुरक्षित ऋण)],
  [23], [एसबीआई बैंक सावधि जमा (Bank FD)], [Investments], [बैलेंस शीट (निवेश संपत्ति)],
  [24], [शेयर एवं म्यूचुअल फंड निवेश], [Investments], [बैलेंस शीट (निवेश संपत्ति)],
  [25], [कारखाना मजदूर मजदूरी (Factory Wages)], [Direct Expenses], [ट्रेडिंग खाता (सकल लाभ प्रभावित)],
  [26], [खरीद पर माल ढुलाई (Freight Inward)], [Direct Expenses], [ट्रेडिंग खाता (उत्पाद लागत)],
  [27], [फैक्ट्री पावर, कोयला एवं ईंधन], [Direct Expenses], [ट्रेडिंग खाता (प्रत्यक्ष उत्पादन खर्च)],
  [28], [ऑफिस स्टाफ वेतन (Salary A/c)], [Indirect Expenses], [लाभ-हानि खाता (प्रशासनिक खर्च)],
  [29], [ऑफिस किराया (Office Rent)], [Indirect Expenses], [लाभ-हानि खाता (प्रशासनिक खर्च)],
  [30], [बिजली एवं इंटरनेट बिल (Electricity)], [Indirect Expenses], [लाभ-हानि खाता (यूटिलिटी खर्च)],
  [31], [सीए ऑडिट फीस (Audit Fees)], [Indirect Expenses], [लाभ-हानि खाता (पेशेवर खर्च)],
  [32], [मशीनरी पर घिसावट (Depreciation)], [Indirect Expenses], [लाभ-हानि खाता (गैर-नकद खर्च)],
  [33], [स्थानीय माल बिक्री (Sales Local 18%)], [Sales Accounts], [ट्रेडिंग खाता (व्यापारिक आय)],
  [34], [अंतर्राज्यीय बिक्री (Sales Interstate)], [Sales Accounts], [ट्रेडिंग खाता (व्यापारिक आय)],
  [35], [बिक्री वापसी (Sales Return)], [Sales Accounts], [ट्रेडिंग खाता (बिक्री में से घटेगा)],
  [36], [स्थानीय माल खरीद (Purchase Local 18%)], [Purchase Accounts], [ट्रेडिंग खाता (व्यापारिक खर्च)],
  [37], [खरीद वापसी (Purchase Return)], [Purchase Accounts], [ट्रेडिंग खाता (खरीद में से घटेगा)],
  [38], [ग्राहकों को दी गई नकद छूट (Discount All.)], [Indirect Expenses], [लाभ-हानि खाता (वित्तीय खर्च)],
  [39], [सप्लायरों से मिली नकद छूट (Discount Rec.)], [Indirect Incomes], [लाभ-हानि खाता (वित्तीय लाभ)],
  [40], [बैंक ब्याज आय (Interest Received)], [Indirect Incomes], [लाभ-हानि खाता (अन्य आय)],
  [41], [डूबत ऋण (Bad Debts Written Off)], [Indirect Expenses], [लाभ-हानि खाता (वित्तीय हानि)],
  [42], [डूबत ऋण हेतु प्रावधान (Provision Bad Debts)], [Provisions], [बैलेंस शीट (देनदारों से घटेगा)],
  [43], [अदत्त किराया (Outstanding Rent)], [Provisions / Current Liab], [बैलेंस शीट (चालू दायित्व)],
  [44], [पूर्वदत्त बीमा (Prepaid Insurance)], [Loans & Advances (Asset)], [बैलेंस शीट (चालू संपत्ति)],
  [45], [सामान्य संचय (General Reserve)], [Reserves & Surplus], [बैलेंस शीट (संचित लाभ)],
  [46], [मुंबई शाखा खाता (Branch Account)], [Branch / Divisions], [बैलेंस शीट (अंतर-शाखा समाशोधन)],
  [47], [ऑफिस स्टेशनरी एवं छपाई], [Indirect Expenses], [लाभ-हानि खाता (प्रशासनिक खर्च)],
  [48], [व्यापारिक यात्रा खर्च (Conveyance)], [Indirect Expenses], [लाभ-हानि खाता (विक्रय खर्च)],
  [49], [बैंक सेवा शुल्क (Bank Charges)], [Indirect Expenses], [लाभ-हानि खाता (वित्तीय खर्च)],
  [50], [अज्ञात आवक (Suspense Account)], [Suspense Account], [बैलेंस शीट (अस्थायी खाता)]
)
"""

    # TOPIC 07
    chapters[7] = """
= अध्याय 07: कंपनी एवं टैली प्राइम में कंपनी निर्माण प्रक्रिया

== 7.1 कंपनी क्या है?
टैली प्राइम में *कंपनी* एक स्वतंत्र कानूनी व वित्तीय लेखांकन इकाई है। प्रत्येक कंपनी का अपना अलग चार्ट ऑफ एकाउंट्स, लेजर्स, स्टॉक आइटम, वाउचर रजिस्टर, वित्तीय वर्ष और यूजर सुरक्षा पासवर्ड होता है।

== 7.2 चरणबद्ध कंपनी निर्माण प्रक्रिया
1. *गेटवे ऑफ टैली* से #key-pill("Alt + K") (कंपनी मेनू) दबाएं और *Create* चुनें (या #key-pill("F3") दबाकर *Create Company* चुनें)।
2. *Company Data Path:* डेटा सुरक्षित रखने का फोल्डर (जैसे `C:\\ProgramData\\TallyPrime\\Data`)।
3. *Company Name:* फर्म का कानूनी नाम लिखें (उदा. `Ravi Private Limited` या `Shree Ambica Agro Traders`)।
4. *Address:* पूरा पता, शहर एवं पिनकोड लिखें (उदा. `दुकान नं. 14, एपीएमसी मार्केट यार्ड, हाईवे रोड, पालनपुर - 385001`)।
5. *State & Country:* राज्य में *Gujarat* एवं देश में *India* चुनें।
   #concept-box(title: "अति महत्वपूर्ण वैधानिक नियम: राज्य कोड का महत्व")[
     राज्य चुनते ही टैली उसका *State Code* (जैसे गुजरात हेतु `24`, महाराष्ट्र हेतु `27`) सेट कर लेता है। इसी कोड के आधार पर टैली स्वतः तय करता है कि लोकल बिल में CGST+SGST लगेगा या बाहर के बिल में IGST!
   ]
6. *Financial Year Beginning From:* भारतीय वित्तीय वर्ष की शुरुआत `01-Apr-2026` लिखें।
7. *Books Beginning From:* जिस दिन से टैली में हिसाब लिखना शुरू कर रहे हैं (सामान्यतः `01-Apr-2026`)।
8. *Security / Tally Vault:* *Control User Access to Company Data = Yes* करें। एडमिनिस्ट्रेटर यूजरनेम और पासवर्ड दर्ज करें।
9. *Base Currency:* मुद्रा प्रतीक `₹`, औपचारिक नाम `INR`, दशमलव स्थान `2`। #key-pill("Ctrl + A") दबाकर कंपनी सेव करें।

== 7.3 F11 फीचर्स एवं वैधानिक जीएसटी सेटअप
कंपनी बनते ही तुरंत *F11: Features* स्क्रीन खुलती है:
- *Accounting Features:* Maintain Accounts = `Yes`, Enable Bill-wise Details = `Yes`।
- *Inventory Features:* Maintain Inventory = `Yes`, Integrate Accounts with Inventory = `Yes`।
- *Statutory & Taxation (GST):*
  - Enable Goods and Services Tax (GST) = `Yes`।
  - State: `Gujarat` | Registration: `Regular`।
  - GSTIN/UIN: 15-अंकीय जीएसटी नंबर दर्ज करें (उदा. `24AABCR1234F1Z5`)।
  - Periodicity of GSTR-1: `Monthly`। E-Way Bill Applicable = `Yes` (सीमा: `₹50,000`)।
- *TDS Configuration:* Enable TDS = `Yes`। TAN नंबर दर्ज करें। #key-pill("Ctrl + A") दबाकर सुरक्षित करें।
"""

    # TOPIC 08
    chapters[8] = """
= अध्याय 08: व्यावसायिक संगठनों के प्रकार एवं एकाउंटिंग प्रणाली

== 8.1 ट्रेडिंग संस्थाएं (व्यापारिक फर्में)
*परिभाषा:* जो संस्थाएं तैयार माल थोक में खरीदती हैं और बिना रूप बदले खुदरा या अन्य व्यापारियों को लाभ जोड़कर बेचती हैं।
#concept-box(title: "व्यावहारिक केस: श्री अंबिका एग्रो ट्रेडर्स, ऊंझा एपीएमसी मंडी")[
  - *व्यापार:* उत्तर गुजरात के किसानों से एपीएमसी मंडी में कच्ची कृषि जींस (जीरा, ईसबगोल, सौंफ) 0% जीएसटी पर खरीदना, सफाई-पैकिंग कर 50 किलो की बोरियों में बेचना।
  - *टैली में सेटअप:*
    - *माप की इकाइयां (Units):* `KGS` (किलो), `QNTL` (क्विंटल), `BAG` (50 किलो की बोरी)।
    - *स्टॉक आइटम:* Unbranded Jeera Grade-A (HSN 0909, GST 0%), Packaged Cumin (HSN 0909, GST 5%)।
    - *वाउचर:* Purchase (F9) और Sales (F8) में बैच एवं एक्सपायरी का प्रबंधन।
]

== 8.2 मैन्युफैक्चरिंग संस्थाएं (विनिर्माण उद्योग)
*परिभाषा:* जो संस्थाएं कच्चा माल खरीदकर मशीनरी, श्रम और बिजली/गैस की सहायता से नया उत्पाद बनाती हैं।
#concept-box(title: "व्यावहारिक केस: मोरबी सिरामिक टाइल्स प्रा. लि., मोरबी क्लस्टर")[
  - *व्यापार:* कच्ची क्ले, फेल्डस्पार, ग्लेज़ केमिकल और प्राकृतिक गैस खरीदकर 600x1200mm की विट्रिफाइड फ्लोर टाइल्स बनाना।
  - *टैली में सेटअप:*
    - *बिल ऑफ मटीरियल्स (BOM):* टाइल के 1 बॉक्स का फॉर्मूला (28 किलो मिट्टी + 2.5 किलो ग्लेज़ + 1.2 यूनिट गैस + ₹45 मजदूरी)।
    - *गोदाम ढांचा:* कच्चा माल गोदाम -> उत्पादन फ्लोर -> तैयार माल यार्ड।
    - *वाउचर:* Stock Journal (#key-pill("Alt + F7")) में *Manufacturing Journal* वाउचर।
]

== 8.3 सेवा प्रदाता संस्थाएं (सर्विस सेक्टर)
*परिभाषा:* बिना किसी भौतिक माल के अमूर्त बौद्धिक, पेशेवर या तकनीकी सेवाएं प्रदान करने वाली संस्थाएं।
#concept-box(title: "व्यावहारिक केस: अहमदाबाद क्लाउड टेक एवं सीए एडवाइजरी")[
  - *व्यापार:* सॉफ्टवेयर डेवलपमेंट, क्लाउड होस्टिंग, कॉरपोरेट ऑडिट एवं टैक्स कंसल्टेंसी।
  - *टैली सेटअप:* बिना स्टॉक आइटम के शुद्ध 6-अंकीय SAC कोड (जैसे SAC 998314 आईटी कंसल्टिंग पर 18% जीएसटी)। बिलिंग सीधे *Accounting Invoice* (#key-pill("Ctrl + H")) द्वारा 10% टीडीएस कटौती के साथ।
]
"""

    # TOPIC 09
    chapters[9] = """
= अध्याय 09: प्रैक्टिकल इनवॉइस (इन्वेंटरी इनवॉइस बनाम एकाउंटिंग इनवॉइस)

टैली प्राइम में इनवॉइस का मोड बदलने का मास्टर शॉर्टकट है: #key-pill("Ctrl + H") (Change Mode)।

== 9.1 इन्वेंटरी इनवॉइस (Item Invoice Mode)
*कब उपयोग करें:* जब भौतिक सामान (क्वांटिटी, रेट, HSN और जीएसटी सहित) खरीदा या बेचा जाए।
#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[इनवॉइस फील्ड]], [#text(weight: "bold", fill: white)[व्यावहारिक प्रविष्टि एवं नियम]],
  [वाउचर मोड], [सेल्स वाउचर (#key-pill("F8")) में #key-pill("Ctrl + H") दबाकर *Item Invoice* चुनें।],
  [Party A/c Name], [देनदार ग्राहक चुनें (उदा. `अल्फा इन्फोटेक प्रा. लि.`, गुजरात कोड 24)।],
  [Sales Ledger], [`Sales Local 18%` लेजर चुनें।],
  [Name of Item], [स्टॉक आइटम चुनें (उदा. `Dell Latitude Laptop`)। गोदाम, मात्रा (5 Nos) एवं दर (₹52,000/No) लिखें। करयोग्य मूल्य = ₹2,60,000।],
  [टैक्स लेजर्स], [आइटम तालिका के नीचे `Output CGST` (9% = ₹23,400) एवं `Output SGST` (9% = ₹23,400) लगाएं। कुल बिल = *₹3,06,800*।],
  [ई-वे बिल व प्रिंट], [₹50,000 से ऊपर होने पर ई-वे बिल विवरण भरें। #key-pill("Ctrl + A") से सुरक्षित कर #key-pill("Alt + P") से प्रिंट निकालें।]
)

== 9.2 एकाउंटिंग इनवॉइस (Accounting Invoice Mode)
*कब उपयोग करें:* जब बिना किसी भौतिक सामान के केवल पेशेवर सेवाएं, दुकान किराया या परामर्श शुल्क का बिल बनाना हो।
#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[इनवॉइस फील्ड]], [#text(weight: "bold", fill: white)[व्यावहारिक प्रविष्टि एवं नियम]],
  [वाउचर मोड], [सेल्स वाउचर (#key-pill("F8")) में #key-pill("Ctrl + H") दबाकर *Accounting Invoice* चुनें।],
  [Party A/c Name], [कॉरपोरेट क्लाइंट चुनें (उदा. `एपेक्स ग्लोबल मुंबई`, महाराष्ट्र कोड 27)।],
  [Particulars (लेजर)], [सर्विस लेजर `IT Consulting Services` (SAC 998314) चुनें। राशि दर्ज करें = ₹50,000.00।],
  [टैक्स लेजर], [ग्राहक महाराष्ट्र (27) का होने के कारण `Output IGST` (18% = ₹9,000.00) लगाएं। कुल बिल = *₹59,000.00*।],
  [टीडीएस कटौती], [क्लाइंट धारा 194J के तहत ₹5,000 (10%) टीडीएस काटकर ₹54,000 का बैंक भुगतान करेगा।]
)
"""

    # TOPIC 10
    chapters[10] = """
= अध्याय 10: टैली प्राइम की मास्टर कीबोर्ड शॉर्टकट्स

राहुल सर के आईएएनटी पालनपुर हैंडबुक से संकलित 40+ प्रामाणिक कीबोर्ड शॉर्टकट्स:

#table(
  columns: (1fr, 1.4fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[शॉर्टकट कुंजी]], [#text(weight: "bold", fill: white)[टैली प्राइम में कार्य]], [#text(weight: "bold", fill: white)[व्यावहारिक उपयोग]],
  [#key-pill("Alt + G")], [Go To (यूनिवर्सल सर्च)], [बिल रोके बिना कोई भी रिपोर्ट खोलना या मास्टर बनाना।],
  [#key-pill("Ctrl + G")], [Switch To], [वर्तमान स्क्रीन छोड़कर सीधे दूसरी रिपोर्ट पर जाना।],
  [#key-pill("Esc")], [Escape / बाहर आएं], [चालू स्क्रीन या पॉपअप बंद करके पिछली स्क्रीन पर लौटना।],
  [#key-pill("Alt + K")], [कंपनी टॉप मेनू], [कंपनी बनाना, बदलना, चुनना, बंद करना और पासवर्ड सेट करना।],
  [#key-pill("F2")], [दिनांक बदलें], [दैनिक लेनदेन की तारीख बदलना।],
  [#key-pill("Alt + F2")], [वित्तीय अवधि बदलें], [एकाउंटिंग वर्ष बदलना (जैसे 01-Apr-2026 से 31-Mar-2027)।],
  [#key-pill("F3")], [कंपनी स्विच करें], [खुली हुई कंपनियों में से दूसरी कंपनी पर स्विच करना।],
  [#key-pill("Alt + F3")], [कंपनी चुनें/खोलें], [कंप्यूटर फोल्डर से नई कंपनी सिलेक्ट करना।],
  [#key-pill("Alt + Y")], [डेटा मेनू], [डेटा बैकअप, रिस्टोर एवं वर्ष विभाजन (Split) मेनू।],
  [#key-pill("Alt + Z")], [एक्सचेंज मेनू], [शाखाओं के बीच डेटा सिंक्रोनाइजेशन।],
  [#key-pill("Alt + O")], [इंपोर्ट मेनू], [मास्टर्स, वाउचर और बैंक ई-स्टेटमेंट आयात करना।],
  [#key-pill("Alt + E")], [एक्सपोर्ट मेनू], [रिपोर्ट्स को पीडीएफ या एक्सेल में एक्सपोर्ट करना।],
  [#key-pill("Alt + M")], [ईमेल मेनू], [ग्राहक को बिल या खाता स्टेटमेंट ईमेल करना।],
  [#key-pill("Alt + P")], [प्रिंट मेनू], [बिल, चेक और वाउचर प्रिंट करना।],
  [#key-pill("F1")], [हेल्प मेनू], [टैली हेल्प और सॉफ्टवेयर अपडेट खोलना।],
  [#key-pill("F4")], [कॉन्ट्रा वाउचर], [कैश-बैंक के आंतरिक ट्रांसफर दर्ज करना।],
  [#key-pill("F5")], [पेमेंट वाउचर], [सप्लायरों, खर्चों एवं टैक्स का भुगतान।],
  [#key-pill("F6")], [रिसीट वाउचर], [ग्राहकों से नकद या चेक प्राप्तियां।],
  [#key-pill("F7")], [जर्नल वाउचर], [गैर-नकद समायोजन, टीडीएस कटौती व घिसावट।],
  [#key-pill("F8")], [सेल्स वाउचर], [ग्राहकों को माल या सेवा बिक्री का बिल।],
  [#key-pill("F9")], [परचेज वाउचर], [सप्लायरों से माल व संपत्ति की खरीद।],
  [#key-pill("Alt + F5")], [डेबिट नोट], [खरीद वापसी (Purchase Return) दर्ज करना।],
  [#key-pill("Alt + F6")], [क्रेडिट नोट], [बिक्री वापसी (Sales Return) दर्ज करना।],
  [#key-pill("Alt + F7")], [स्टॉक जर्नल], [गोदाम ट्रांसफर एवं मैन्युफैक्चरिंग उत्पादन।],
  [#key-pill("Ctrl + F7")], [फिजिकल स्टॉक], [गोदाम के वास्तविक स्टॉक का भौतिक सत्यापन।],
  [#key-pill("Alt + F8")], [डिलीवरी नोट], [बिल बनने से पहले डिलीवरी चालान जारी करना।],
  [#key-pill("Alt + F9")], [रिसीट नोट (GRN)], [गोदाम में माल प्राप्ति रसीद बनाना।],
  [#key-pill("Ctrl + F4")], [परचेज ऑर्डर], [सप्लायर को खरीद ऑर्डर भेजना।],
  [#key-pill("Ctrl + F5")], [सेल्स ऑर्डर], [ग्राहक का बिक्री ऑर्डर दर्ज करना।],
  [#key-pill("F10")], [अन्य वाउचर्स], [सभी 24 वाउचर्स की संपूर्ण सूची देखना।],
  [#key-pill("F11")], [कंपनी फीचर्स], [जीएसटी, टीडीएस और इन्वेंटरी फीचर्स चालू करना।],
  [#key-pill("F12")], [कॉन्फ़िगरेशन], [स्क्रीन अनुसार आवश्यक विवरण छुपाना या दिखाना।],
  [#key-pill("Alt + C")], [मास्टर बनाएं / कैलकुलेटर], [वाउचर के भीतर ही नया लेजर बनाना / कैलकुलेटर खोलना।],
  [#key-pill("Ctrl + Enter")], [लेजर में सुधार (Alter)], [वाउचर में रहते हुए किसी भी लेजर में संशोधन करना।],
  [#key-pill("Ctrl + A")], [तुरंत सेव करें], [स्क्रीन या वाउचर को एक ही क्लिक में सेव करना।],
  [#key-pill("Alt + D")], [डिलीट करें], [किसी भी अप्रयुक्त लेजर या वाउचर को हटाना।],
  [#key-pill("Alt + X")], [वाउचर रद्द करें], [ऑडिट क्रम बनाए रखते हुए वाउचर कैंसिल करना।],
  [#key-pill("Ctrl + H")], [मोड बदलें (Change Mode)], [Item Invoice, Accounting Invoice और As Voucher में बदलना।],
  [#key-pill("Ctrl + I")], [More Details], [ई-वे बिल व वाहन संख्या जैसे अतिरिक्त विवरण जोड़ना।],
  [#key-pill("Alt + R")], [पिछला विवरण लाएं], [पिछले वाउचर का Narration पुनः लाना।],
  [#key-pill("Ctrl + T")], [पोस्ट-डेटेड वाउचर], [भविष्य की तारीख का चेक रिकॉर्ड करना।],
  [#key-pill("Spacebar")], [पंक्ति चुनें], [रिपोर्ट में एक या अधिक प्रविष्टियों का चयन करना।]
)
"""

    # TOPIC 11
    chapters[11] = """
= अध्याय 11: कॉरपोरेट ब्रिज विषय (व्यावसायिक एकाउंटिंग की ओर कदम)

एक साधारण डेटा एंट्री ऑपरेटर से पेशेवर कॉरपोरेट अकाउंटेंट बनने हेतु चार प्रमुख विषय:

== 11.1 जीएसटी सुधार एवं रिटर्न मिलान
कॉरपोरेट जगत में केवल बिल बनाना पर्याप्त नहीं, बल्कि सरकारी पोर्टल से मिलान अनिवार्य है:
- *GSTR-1:* मासिक बिक्री का विवरण जो प्रत्येक माह की 11 तारीख तक भरा जाता है।
- *GSTR-3B:* मासिक स्व-घोषित सारांश रिटर्न जो 20 तारीख तक टैक्स भुगतान हेतु भरा जाता है।
- *GSTR-2B मिलान:* प्रत्येक माह की 14 तारीख को पोर्टल पर जनरेट होने वाला इनपुट टैक्स क्रेडिट स्टेटमेंट। *सुनहरा नियम:* यदि सप्लायर ने अपने GSTR-1 में आपका बिल नहीं चढ़ाया तो वह आपके GSTR-2B में नहीं दिखेगा, और धारा 16(2)(aa) के तहत आप उसका आईटीसी क्लेम नहीं कर सकते! टैली प्राइम का जीएसटी रिकंसिलिएशन टूल कुछ ही सेकंड में पूरे परचेज रजिस्टर का पोर्टल से मिलान कर देता है।

== 11.2 बैंक समाधान विवरण (Bank Reconciliation - BRS)
कैश बुक के बैंक खाते और बैंक की पासबुक/स्टेटमेंट में हमेशा अंतर रहता है:
- *चेक जारी कर दिया पर सप्लायर ने बैंक में नहीं लगाया (Unpresented cheques)।*
- *चेक बैंक में जमा किया पर अभी तक क्लियर नहीं हुआ (Uncredited cheques)।*
- *बैंक द्वारा सीधे काटा गया चार्ज या सीधे जमा किया गया ब्याज।*
*टैली में समाधान:* *Gateway of Tally -> Banking -> Bank Reconciliation* में जाएं। प्रत्येक चेक के सामने बैंक स्टेटमेंट की वास्तविक निकासी तारीख (*Bank Date*) डालें। अंतर शून्य हो जाएगा! टैली प्राइम में बैंक की एक्सेल/सीएसवी फाइल सीधे इंपोर्ट करके ऑटो-बीआरएस की सुविधा भी उपलब्ध है।

== 11.3 कॉस्ट सेंटर एवं कॉस्ट कैटेगरी (Cost Centres & Cost Categories)
कॉरपोरेट कंपनियां शाखाओं, विभागों या प्रोजेक्ट्स के अनुसार लाभ-हानि का विश्लेषण करती हैं:
- *Cost Category:* मुख्य श्रेणी (उदा. `Regional Branches`)।
- *Cost Centre:* उप-इकाई (उदा. `Ahmedabad Branch`, `Surat Branch`, `Palanpur Hub`)।
जब ₹60,000 *Travelling Expense* का भुगतान होता है, तो टैली पूछता है कि किस ब्रांच का कितना खर्च है (अहमदाबाद ₹30k, सूरत ₹20k, पालनपुर ₹10k)। इससे बिना अलग लेजर बनाए हर शाखा का खर्च अलग से ट्रैक हो जाता है!

== 11.4 वित्तीय वर्ष क्लोजिंग एवं डेटा विभाजन (Data Splitting)
31 मार्च को वित्तीय वर्ष समाप्त होने पर कॉरपोरेट अकाउंटेंट की मुख्य जिम्मेदारियां:
1. सभी संपत्तियों पर कंपनी अधिनियम एवं आयकर नियमों के अनुसार घिसावट (Depreciation) लगाना।
2. मार्च माह के अदत्त वेतन, बिजली बिल और ऑडिट फीस का प्रावधान (Provision) करना।
3. पूर्वदत्त बीमा को अगले वर्ष हेतु स्थगित करना।
4. गोदाम के वास्तविक स्टॉक का मिलान कर अंतर ठीक करना।
5. *कंपनी डेटा स्प्लिट (#key-pill("Alt + Y") -> Split):* 1 अप्रैल को नए वित्तीय वर्ष में प्रवेश करते समय डेटा को दो भागों में बांटना, जिससे पुराना डेटा सुरक्षित रहे और 31 मार्च के अंतिम शेष नए वर्ष के ओपनिंग बैलेंस बन जाएं!
"""

    return chapters
'''

def generate_gujarati():
    return '''# -*- coding: utf-8 -*-
"""
Tally Prime Master Curriculum — Gujarati Edition (11 Comprehensive Topics)
Standardized by Rahul Patel (Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab)
"""

def get_gujarati_chapters():
    chapters = {}

    # TOPIC 01
    chapters[1] = """
= પ્રકરણ 01: ટેલીનો ઇતિહાસ, વિકાસ અને ટેલી પ્રાઇમ ડાઉનલોડિંગ પદ્ધતિ

== 1.1 ટેલીનો ઉદ્ભવ: એક ગૌરવપૂર્ણ ભારતીય સંશોધન
ટેલીનો ઇતિહાસ ભારતીય સોફ્ટવેર જગતની એક પ્રેરણાદાયી ગાથા છે. વર્ષ 1986 માં, બેંગ્લોર ખાતે ટેક્સટાઇલ મશીનરીનો વેપાર કરતા *શ્યામ સુંદર ગોયનકા* રોજેરોજના હિસાબ-કિતાબની મુશ્કેલીઓથી ત્રસ્ત હતા. તે સમયે ઉપલબ્ધ કોમ્પ્યુટર પ્રોગ્રામિંગ ખૂબ અઘરું હતું. તેમણે તેમના પુત્ર *ભરત ગોયનકા* (ગણિત સ્નાતક) ને એક એવું સોફ્ટવેર બનાવવાનો પડકાર આપ્યો જે કોઈ પણ સામાન્ય ભારતીય મુનીમ કે એકાઉન્ટન્ટ સરળ અંગ્રેજીમાં ચલાવી શકે.

ભરત ગોયનકાએ 1986 માં બેંગ્લોર ખાતે *Peutronics Financial Services* ની સ્થાપના કરી અને વિશ્વનું સૌપ્રથમ કોડલેસ એકાઉન્ટિંગ સોફ્ટવેર બનાવ્યું, જેનું નામ *ધ એકાઉન્ટન્ટ (The Accountant)* રાખવામાં આવ્યું. 1999 માં કંપનીનું નામ બદલીને *ટેલી સોલ્યુશન્સ પ્રાઇવેટ લિમિટેડ (Tally Solutions Pvt. Ltd.)* કરવામાં આવ્યું. આજે ટેલી સમગ્ર ભારતમાં એમએસએમઇ એકમો, કારખાનાઓ, વેપારી પેઢીઓ અને સીએ ફર્મોમાં *80% થી વધુ માર્કેટ શેર* સાથે અગ્રેસર છે.

#concept-box(title: "ટેલી સોફ્ટવેરની ઐતિહાસિક સફર")[
  - *ટેલી 4.5 (1990 નો દાયકો):* ડોસ (DOS) આધારિત, કીબોર્ડ સંચાલિત મૂળભૂત નામા પદ્ધતિ.
  - *ટેલી 5.4 (1998):* વિન્ડોઝ ઓપરેટિંગ સિસ્ટમ પર ગ્રાફિકલ ઇન્ટરફેસ ધરાવતી આવૃત્તિ.
  - *ટેલી 6.3 (2001):* ડેટા કોમ્યુનિકેશન અને બહુભાષી પ્રિન્ટિંગની સુવિધા.
  - *ટેલી 7.2 (2005):* રાજ્યોના વેટ (VAT) અને સર્વિસ ટેક્સ સાથેનું એકીકરણ.
  - *ટેલી 8.1 અને 9 (2006):* બહુ-ચલણ (Multi-currency) અને પોઇન્ટ ઓફ સેલ (POS) બિલિંગ.
  - *ટેલી.ઇઆરપી 9 (2009 - 2020):* સમગ્ર ભારતનું પ્રખ્યાત બિઝનેસ સોફ્ટવેર, જેમાં 2017 માં જીએસટી ઉમેરાયું.
  - *ટેલી પ્રાઇમ (2020 - વર્તમાન):* સંપૂર્ણ આધુનિક પુનઃરચના, ટોપ-બાર મેનૂ, મલ્ટી-ટાસ્કિંગ (Alt+G), અને ડાયરેક્ટ ઈ-ઇનવોઇસિંગ તથા ઈ-વે બિલ સિસ્ટમ.
]

== 1.2 ટેલી પ્રાઇમ કેવી રીતે ડાઉનલોડ અને ઇન્સ્ટોલ કરવું
ટેલી પ્રાઇમ ડાઉનલોડ કરવાની અધિકૃત પદ્ધતિ:
1. તમારા કોમ્પ્યુટરમાં બ્રાઉઝર ખોલો અને ઓફિશિયલ વેબસાઇટ પર જાઓ: #link("https://tallysolutions.com")[tallysolutions.com].
2. વેબસાઇટ પર ટોપ-રાઇટ આપેલા *Download* બટન પર ક્લિક કરો. નવીનતમ સેટઅપ ફાઇલ `Setup.exe` ડાઉનલોડ થશે.
3. ડાઉનલોડ થયેલ `Setup.exe` પર રાઇટ ક્લિક કરીને *Run as Administrator* આપો.
4. સિંગલ-વિન્ડો ઇન્સ્ટોલરમાં *Install* પર ક્લિક કરો (ડિફોલ્ટ પાથ: `C:\\Program Files\\TallyPrime`).
5. ઇન્સ્ટોલેશન પૂર્ણ થતાં ડેસ્કટોપ આઇકોન પરથી ટેલી પ્રાઇમ શરૂ કરો.

== 1.3 ટેલી પ્રાઇમ લાયસન્સિંગના પ્રકારો
#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[લાયસન્સ આવૃત્તિ]], [#text(weight: "bold", fill: white)[યુઝર એક્સેસ મર્યાદા]], [#text(weight: "bold", fill: white)[વ્યવહારુ વિશેષતાઓ અને નિયમો]],
  [સિલ્વર એડિશન (સિંગલ યુઝર)], [1 કોમ્પ્યુટર પર સક્રિય], [નાની રિટેલ દુકાનો, વ્યક્તિગત વેપારીઓ અને એકાઉન્ટન્ટ્સ માટે સંપૂર્ણ વ્યાપારી લાયસન્સ.],
  [ગોલ્ડ એડિશન (મલ્ટી-યુઝર)], [લોકલ લેન (LAN) પર અમર્યાદિત], [ઓફિસના સ્થાનિક નેટવર્ક સાથે જોડાયેલા અનેક કોમ્પ્યુટર્સ પર એક સાથે કામ કરવા માટે. સીએ ફર્મ્સ, કોર્પોરેટ કચેરીઓ અને ફેક્ટરીઓનું સ્ટાન્ડર્ડ.],
  [એજ્યુકેશનલ મોડ], [સિંગલ યુઝર (સંપૂર્ણ મફત)], [વિદ્યાર્થીઓ અને આઇએએનટી પાલનપુર જેવા સંસ્થાઓ માટે ખાસ તૈયાર. *મુખ્ય મર્યાદા:* વાઉચર્સ માત્ર મહિનાની *1, 2 અને 31 તારીખે* જ દાખલ કરી શકાય છે. બાકી તમામ એકાઉન્ટિંગ અને રિપોર્ટિંગ સંપૂર્ણ ચાલુ રહે છે!],
  [રેન્ટલ મોડ], [માસિક / ત્રિમાસિક ભાડાપટ્ટો], [હંગામી અથવા મોસમી વ્યવસાય માટે સંપૂર્ણ ખરીદી વગર લાયસન્સ વાપરવાની સગવડ.]
)
"""

    # TOPIC 02
    chapters[2] = """
= પ્રકરણ 02: ટેલી પ્રાઇમ શું છે અને તેનું સિસ્ટમ આર્કિટેક્ચર

== 2.1 ટેલી પ્રાઇમ શું છે?
*ટેલી પ્રાઇમ* એ ભારતનું અગ્રણી બિઝનેસ મેનેજમેન્ટ અને ઇઆરપી સોફ્ટવેર છે. તે નાણાકીય એકાઉન્ટિંગ, ઇન્વેન્ટરી વ્યવસ્થાપન, કરવેરા પાલન (જીએસટી અને ટીડીએસ), બેંકિંગ ઓટોમેશન, ખરીદ-વેચાણ ઓર્ડર અને પેરોલને એક જ પ્લેટફોર્મ પર જોડે છે.

કોઈ પણ જટિલ કોડિંગ વગર સામાન્ય વ્યવહારિક ભાષામાં વ્યવહારો નોંધવામાં આવે છે. એક સેલ્સ બિલ બનાવતાં જ ગ્રાહકનું ખાતું, સ્ટોક સમરી, કાચું સરવૈયું, નફા-નુકસાન ખાતું, પાકું સરવૈયું અને જીએસટી રિટર્ન ક્ષણવારમાં આપોઆપ અપડેટ થઈ જાય છે!

== 2.2 ઇન-મેમરી "કેક્ટસ (Cactus)" ડેટાબેઝ એન્જિન
ટેલી પ્રાઇમની અતિ ઝડપી કામગીરી તેના સ્વદેશી ઇન-મેમરી ડેટાબેઝ એન્જિન *કેક્ટસ (Cactus)* ને આભારી છે:
- *ઝીરો લેટન્સી ઇન-મેમરી પ્રોસેસિંગ:* આરડીબીએમએસ (SQL) જેવી હાર્ડ ડિસ્ક ક્વેરીઓના બદલે ટેલી કંપનીના સમગ્ર ડેટા ટ્રીને સીધો રેમ (RAM) માં લોડ કરે છે.
- *રીયલ-ટાઇમ ગણતરી:* સેલ્સ બિલ સેવ થતાં જ કેક્ટસ એન્જિન કરોડો એન્ટ્રીઓ વચ્ચે સ્ટોક વેલ્યુએશન (FIFO/એવરેજ) અને કરવેરા ખાતાઓની પુનઃગણતરી મિલીસેકન્ડમાં કરે છે.
- *ટીડીએલ (TDL) સુવિધા:* ટેલીની દરેક સ્ક્રીન અને ઇનવોઇસ TDL માં તૈયાર થયેલ હોવાથી તેને જરૂરિયાત મુજબ સરળતાથી કસ્ટમાઇઝ કરી શકાય છે.

== 2.3 ઇન્ટરફેસ અને ટોપ-બાર નેવિગેશન
#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[ટોપ મેનૂ ઘટક]], [#text(weight: "bold", fill: white)[કીબોર્ડ શોર્ટકટ]], [#text(weight: "bold", fill: white)[વ્યવહારુ કાર્ય]],
  [કંપની મેનૂ], [#key-pill("Alt + K")], [કંપની બનાવવી, સુધારવી, પસંદ કરવી, બંધ કરવી અને પાસવર્ડ સેટ કરવા.],
  [ડેટા મેનૂ], [#key-pill("Alt + Y")], [ડેટા બેકઅપ, રિસ્ટોર, વર્ષાંતે કંપની વિભાજન (Split) અને ડેટા રિપેર.],
  [એક્સચેન્જ મેનૂ], [#key-pill("Alt + Z")], [મુખ્ય કચેરી અને શાખાઓ વચ્ચે ઓનલાઇન ડેટા સિન્ક્રોનાઇઝેશન.],
  [ઇમ્પોર્ટ મેનૂ], [#key-pill("Alt + O")], [લેજર્સ, સ્ટોક આઇટમ્સ અને બેંક ઈ-સ્ટેટમેન્ટ સીધા આયાત કરવા.],
  [એક્સપોર્ટ મેનૂ], [#key-pill("Alt + E")], [રિપોર્ટ્સ અને બિલોને પીડીએફ, એક્સેલ કે સીએસવી ફોર્મેટમાં નિકાસ કરવા.],
  [ઈમેલ મેનૂ], [#key-pill("Alt + M")], [ટેલી સ્ક્રીન પરથી સીધા ગ્રાહકને બિલ કે ખાતાવહી ઈમેલ કરવી.],
  [પ્રિન્ટ મેનૂ], [#key-pill("Alt + P")], [ટેક્સ ઇનવોઇસ, ચેક, વાઉચર્સ અને પાકું સરવૈયું પ્રિન્ટ કરવું.],
  [હેલ્પ મેનૂ], [#key-pill("F1")], [ટેલી હેલ્પ માર્ગદર્શિકા, શોર્ટકટ્સ લિસ્ટ અને સોફ્ટવેર અપડેટ ખોલવા.]
)

#v(6pt)

#concept-box(title: "સાર્વત્રિક મલ્ટી-ટાસ્કિંગ: ગો-ટૂ (Alt + G)")[
  ટેલી પ્રાઇમનું સૌથી મોટું આકર્ષણ *Go To* (#key-pill("Alt + G")) છે. મોટું બિલ બનાવતી વખતે જો કોઈ ગ્રાહક લેજર માંગે, તો બિલ રદ કર્યા વગર સીધું #key-pill("Alt + G") દબાવી લેજર જોઈ/પ્રિન્ટ કરી શકાય છે અને *Esc* દબાવતાં જ તમે ફરીથી તમારા અધૂરા બિલ પર પાછા આવી જાઓ છો!
]
"""

    # TOPIC 03
    chapters[3] = """
= પ્રકરણ 03: સંપૂર્ણ જીએસટી અને ટીડીએસ પાયો (વિગતવાર નિયમો અને સ્લેબ્સ)

== 3.1 ગુડ્ઝ એન્ડ સર્વિસિસ ટેક્સ (જીએસટી)
*1 જુલાઈ 2017* ના રોજ *101મા બંધારણીય સુધારા કાયદા* દ્વારા ભારતમાં જીએસટી અમલી બન્યો. તેણે જૂના પરોક્ષ કરવેરા (વેટ, સર્વિસ ટેક્સ, એક્સાઇઝ) નાબૂદ કરી *"એક રાષ્ટ્ર, એક કર, એક બજાર"* નું નિર્માણ કર્યું.

જીએસટી એ *પરોક્ષ, ગંતવ્ય-આધારિત (Destination-based), બહુ-તબક્કાવાર ઉપભોગ કર* છે. કરની આવક જે રાજ્યમાં માલ કે સેવાનો અંતિમ વપરાશ થાય (*Place of Supply*) તે રાજ્યને મળે છે.

== 3.2 દ્વિ-સ્તરીય જીએસટી માળખું
- *ઇન્ટ્રા-સ્ટેટ સપ્લાય (રાજ્યની અંદર, દા.ત. ગુજરાતથી ગુજરાત):*
  $ "કુલ જીએસટી" = "CGST (કેન્દ્ર 50%)" + "SGST (રાજ્ય 50%)" $
- *ઇન્ટર-સ્ટેટ સપ્લાય (બે રાજ્યો વચ્ચે, દા.ત. ગુજરાતથી મહારાષ્ટ્ર/દિલ્હી):*
  $ "કુલ જીએસટી" = "IGST (સંકલિત કર 100%)" $
- *કેન્દ્રશાસિત પ્રદેશ (દા.ત. દમણ અને દીવ):*
  $ "કુલ જીએસટી" = "CGST" + "UTGST" $

== 3.3 આધુનિક તર્કબદ્ધ જીએસટી સ્લેબ્સ (કઈ વસ્તુમાં કેટલો ટેક્સ)
#table(
  columns: (0.9fr, 1.4fr, 2.7fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[જીએસટી સ્લેબ]], [#text(weight: "bold", fill: white)[વેપારિક શ્રેણી]], [#text(weight: "bold", fill: white)[વસ્તુઓ, સેવાઓ અને વાસ્તવિક ઉદાહરણો]],
  [0% (00 સ્લેબ)], [કરમુક્ત ખેત પેદાશો અને મૂળભૂત સેવાઓ], [એપીએમસી ઊંઝા મંડીના ખેડૂતોનું ખુલ્લું જીરું, ઇસબગોલ, વરિયાળી, તાજા શાકભાજી, તાજું દૂધ, મીઠું, ખુલ્લા અનાજ, દેશી ખાતર અને પ્રાથમિક શિક્ષણ/આરોગ્ય સેવાઓ.],
  [5% (05 સ્લેબ)], [દૈનિક જરૂરિયાતો અને સામૂહિક પરિવહન], [પેક્ડ ખાદ્ય તેલ (સીંગતેલ, કપાસિયા, સૂર્યમુખી), ચા પત્તી, મસાલા (પેક્ડ જીરું પાવડર, હળદર), ₹1,000 થી ઓછી કિંમતના પગરખાં, સુતરાઉ કાપડ, રેલવે સ્લીપર ટિકિટ, માલ પરિવહન (GTA), અને જીવનરક્ષક દવાઓ.],
  [18% (18 સ્લેબ)], [સ્ટાન્ડર્ડ ઔદ્યોગિક માલ અને કોર્પોરેટ સેવાઓ], [આઇટી હાર્ડવેર, ડેસ્કટોપ કોમ્પ્યુટર્સ, લેપટોપ, સર્વર્સ, સ્માર્ટફોન, ઇલેક્ટ્રોનિક્સ, ઔદ્યોગિક મશીનરી, સોફ્ટવેર, સીએ/વકીલ કન્સલ્ટન્સી ફી અને ₹1,000 થી વધુ ભાડાની હોટેલ રૂમ.],
  [12% અને 28%], [ખાસ ખાદ્ય અને લક્ઝરી/હાનિકારક ચીજો], [*12%:* પ્રોસેસ્ડ ફૂડ, ડેરી મશીનરી. *28% + સેસ (Cess):* લક્ઝરી મોટરકારો, રેસિંગ બાઇક, પાન મસાલા, તમાકુ ઉત્પાદનો અને સોફ્ટ ડ્રિંક્સ.]
)

== 3.4 ઇનપુટ ટેક્સ ક્રેડિટ (ITC) અને નિયમો
ખરીદી પર ચૂકવેલ ટેક્સ (*Input GST*) ને વેચાણ પર મળેલા ટેક્સ (*Output GST*) સામે બાદ મેળવવો તે ITC છે.
#concept-box(title: "આઇટીસી ઉપયોગનો કાયદાકીય ક્રમ (કલમ 49)")[
  1. *Input IGST* નો ઉપયોગ સૌપ્રથમ 100% Output IGST સામે કરવો. બાકીની રકમ CGST કે SGST સામે બાદ મળશે.
  2. *Input CGST* નો ઉપયોગ Output CGST સામે, અને વધે તો Output IGST સામે (*CGST કદી SGST સામે બાદ ન મળે!*).
  3. *Input SGST* નો ઉપયોગ Output SGST સામે, અને વધે તો Output IGST સામે (*SGST કદી CGST સામે બાદ ન મળે!*).
]

== 3.5 ટીડીએસ (Tax Deducted at Source) શું છે?
*ઇન્કમટેક્સ એક્ટ, 1961* હેઠળ આવક ઉત્પન્ન થાય ત્યારે જ ટેક્સ કાપવામાં આવે છે. ચૂકવનાર પેઢી (*Deductor*) નિર્ધારિત ટકા કાપીને સરકારના ખાતામાં જમા કરે છે. આ માટે 10-અંકી *TAN (ટેક્સ ડિડક્શન એકાઉન્ટ નંબર)* અનિવાર્ય છે.

#table(
  columns: (0.9fr, 1.4fr, 1.1fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[કલમ]], [#text(weight: "bold", fill: white)[ચુકવણીનો પ્રકાર]], [#text(weight: "bold", fill: white)[ટીડીએસ દર]], [#text(weight: "bold", fill: white)[વાર્ષિક મર્યાદા અને નિયમો]],
  [કલમ 194C], [કોન્ટ્રાક્ટર અને પેટા-કોન્ટ્રાક્ટર્સ], [1% (વ્યક્તિ/HUF)\\ 2% (કંપનીઓ)], [સિંગલ બિલ ₹30,000 કે વાર્ષિક કુલ ₹1,00,000 થી વધુ. ટ્રાન્સપોર્ટ, કેટરિંગ, જાહેરાત.],
  [કલમ 194J], [પ્રોફેશનલ કે ટેકનિકલ સેવાઓ], [10% (પ્રોફેશનલ)\\ 2% (ટેકનિકલ/BPO)], [વાર્ષિક કુલ ચુકવણી ₹30,000 થી વધુ. સીએ ઓડિટ ફી, કાનૂની ફી, સોફ્ટવેર ડેવલપમેન્ટ.],
  [કલમ 194I], [જમીન, મકાન કે મશીનરીનું ભાડું], [10% (જમીન/મકાન)\\ 2% (પ્લાન્ટ/મશીન)], [નાણાકીય વર્ષમાં કુલ ભાડું ₹2,40,000 થી વધુ થાય ત્યારે.],
  [કલમ 194H], [કમિશન કે દલાલી], [5%], [વાર્ષિક કુલ કમિશન ₹15,000 થી વધુ થાય ત્યારે.],
  [કલમ 206AA], [પાન કાર્ડની અનિવાર્યતા], [*ફ્લેટ 20%*], [જો નાણાં મેળવનાર પાન કાર્ડ ન આપે, તો ફરજિયાત 20% દંડાત્મક દરે ટીડીએસ કપાશે!]
)

*ચુકવણી અને રિટર્ન:* કાપેલો ટીડીએસ દર માસની *7 તારીખ* સુધીમાં *ચલણ ITNS 281* દ્વારા બેંકમાં ભરાય છે. ત્રિમાસિક રિટર્ન *ફોર્મ 26Q* માં ભરાય છે.
"""

    # TOPIC 04
    chapters[4] = """
= પ્રકરણ 04: લેજર, ખાતાઓના પ્રકાર અને નામાના સુવર્ણ નિયમો

== 4.1 લેજર (ખાતાવહી ખાતું) શું છે?
નામા પદ્ધતિ અને ટેલીમાં *લેજર* એ મૂળભૂત હિસાબી ખાતું છે જ્યાં ચોક્કસ મિલકત, દેવું, મૂડી, આવક કે ખર્ચના વ્યવહારો નોંધાય છે. દરેક એન્ટ્રીમાં ઓછામાં ઓછા બે ખાતા (એક ઉધાર અને એક જમા) સંકળાયેલા હોય છે.

== 4.2 ખાતાઓના ત્રણ મુખ્ય પ્રકારો
1. *વ્યક્તિગત ખાતા (Personal Accounts):* જીવંત વ્યક્તિઓના ખાતા (દા.ત. રાહુલ પટેલ ખાતું, રમેશ ખાતું), કાનૂની કૃત્રિમ સંસ્થાઓના ખાતા (દા.ત. એચડીએફસી બેંક, રિલાયન્સ ઇન્ડસ્ટ્રીઝ, ટાટા મોટર્સ), અને પ્રતિનિધિ ખાતા (ચૂકવવાનો બાકી પગાર, અગાઉથી ચૂકવેલ ભાડું).
2. *માલ-મિલકતના ખાતા (Real Accounts):* વેપારની તમામ દૃશ્ય-અદૃશ્ય મિલકતોના ખાતા (દા.ત. રોકડ ખાતું, પ્લાન્ટ-મશીનરી ખાતું, કોમ્પ્યુટર ખાતું, ફર્નિચર ખાતું, પાઘડી ખાતું).
3. *ઉપજ-ખર્ચના ખાતા (Nominal Accounts):* વેપારના તમામ ખર્ચા, નુકસાન, આવકો અને નફાના ખાતા (દા.ત. પગાર ખાતું, ભાડા ખાતું, મળેલ વ્યાજ, મળેલ કમિશન, આપેલ વટાવ).

== 4.3 નામાના સુવર્ણ નિયમો (Golden Rules of Accounting)
#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 6pt,
  [#text(weight: "bold", fill: white)[ખાતાનો પ્રકાર]], [#text(weight: "bold", fill: white)[ઉધારનો નિયમ (Dr.)]], [#text(weight: "bold", fill: white)[જમાનો નિયમ (Cr.)]],
  [વ્યક્તિગત ખાતું (Personal)], [*મેળવનાર ખાતે ઉધાર કરો*\\ (Debit the Receiver)], [*આપનાર ખાતે જમા કરો*\\ (Credit the Giver)],
  [માલ-મિલકત ખાતું (Real)], [*આવે તે ઉધાર કરો*\\ (Debit what comes in)], [*જાય તે જમા કરો*\\ (Credit what goes out)],
  [ઉપજ-ખર્ચ ખાતું (Nominal)], [*ખર્ચ કે નુકસાન ઉધાર કરો*\\ (Debit expenses & losses)], [*આવક કે નફો જમા કરો*\\ (Credit incomes & gains)]
)

== 4.4 20 વ્યવહારુ Dr/Cr ઉદાહરણો અને હિસાબી તર્ક
#table(
  columns: (0.4fr, 2.4fr, 1.2fr, 1.2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[ક્ર.]], [#text(weight: "bold", fill: white)[ધંધાકીય વ્યવહાર]], [#text(weight: "bold", fill: white)[ઉધાર લેજર (Dr)]], [#text(weight: "bold", fill: white)[જમા લેજર (Cr)]], [#text(weight: "bold", fill: white)[નામાનો નિયમ અને કારણ]],
  [01], [₹5,00,000 રોકડા લાવી ધંધો શરૂ કર્યો], [Cash A/c (₹5L)], [Capital A/c (₹5L)], [Real (રોકડ આવી = Dr) | Personal (માલિક આપનાર = Cr)],
  [02], [એચડીએફસી બેંકમાં ₹2,00,000 રોકડા ભર્યા], [HDFC Bank A/c], [Cash A/c], [Personal (બેંક લેનાર = Dr) | Real (રોકડ ગઈ = Cr)],
  [03], [ધંધા માટે ₹45,000 નું કોમ્પ્યુટર રોકડેથી ખરીદ્યું], [Computer A/c], [Cash A/c], [Real (મિલકત આવી = Dr) | Real (રોકડ ગઈ = Cr)],
  [04], [₹50,000 નો માલ રોકડેથી ખરીદ્યો], [Purchase A/c], [Cash A/c], [Nominal (ખરીદ ખર્ચ = Dr) | Real (રોકડ ગઈ = Cr)],
  [05], [રાજેશ બ્રધર્સ પાસેથી ₹1,20,000 નો માલ શાખ પર ખરીદ્યો], [Purchase A/c], [Rajesh Bros A/c], [Nominal (ખર્ચ = Dr) | Personal (રાજેશ આપનાર = Cr)],
  [06], [₹40,000 નો માલ રોકડેથી વેચ્યો], [Cash A/c], [Sales A/c], [Real (રોકડ આવી = Dr) | Nominal (વેચાણ આવક = Cr)],
  [07], [મહેતા ટ્રેડર્સને ₹95,000 નો માલ શાખ પર વેચ્યો], [Mehta Traders A/c], [Sales A/c], [Personal (મહેતા લેનાર = Dr) | Nominal (આવક = Cr)],
  [08], [ઓફિસ ભાડું ₹18,000 ચેકથી ચૂકવ્યું], [Office Rent A/c], [HDFC Bank A/c], [Nominal (ખર્ચ = Dr) | Personal (બેંકે ચૂકવ્યા = Cr)],
  [09], [કર્મચારીઓને ₹35,000 રોકડ પગાર ચૂકવ્યો], [Salary A/c], [Cash A/c], [Nominal (ખર્ચ = Dr) | Real (રોકડ ગઈ = Cr)],
  [10], [કમિશનનો ચેક મળ્યો ₹12,000], [HDFC Bank A/c], [Commission A/c], [Personal (બેંક લેનાર = Dr) | Nominal (આવક = Cr)],
  [11], [માલિકે અંગત વપરાશ માટે ₹15,000 રોકડા ઉપાડ્યા], [Drawings A/c], [Cash A/c], [Personal (માલિક લેનાર = Dr) | Real (રોકડ ગઈ = Cr)],
  [12], [રાજેશ બ્રધર્સને ₹1,18,000 ચૂકવી હિસાબ ચુકતે કર્યો], [Rajesh Bros (₹1.2L)], [Cash / Discount Rec.], [Personal (Dr) | Real (Cr Cash ₹1.18L) | Nominal (Cr કસર ₹2k)],
  [13], [મહેતા ટ્રેડર્સ પાસેથી ₹93,500 મળ્યા, ₹1,500 વટાવ આપ્યો], [Cash / Discount All.], [Mehta Traders], [Real (Dr Cash ₹93.5k) | Nominal (Dr વટાવ ₹1.5k) | Personal (Cr)],
  [14], [ઓફિસ કોમ્પ્યુટર પર ₹4,500 ઘસારો માંડી વાળ્યો], [Depreciation A/c], [Computer A/c], [Nominal (નુકસાન = Dr) | Real (મિલકત ઘટી = Cr)],
  [15], [ઓફિસ લાઈટ બિલ ₹4,200 રોકડેથી ચૂકવ્યું], [Electricity Exp A/c], [Cash A/c], [Nominal (ખર્ચ = Dr) | Real (રોકડ ગઈ = Cr)],
  [16], [જૂનું ફર્નિચર ₹8,000 માં રોકડેથી વેચ્યું], [Cash A/c], [Furniture A/c], [Real (રોકડ આવી = Dr) | Real (ફર્નિચર ગયું = Cr)],
  [17], [આગમાં ₹10,000 નો માલ બળીને ખાખ થયો], [Loss by Fire A/c], [Purchase A/c], [Nominal (નુકસાન = Dr) | Real/Nominal (માલ ઘટ્યો = Cr)],
  [18], [ખરીદેલ માલનું આવક માલ ગાડાભાડું ₹3,500 ચૂકવ્યું], [Carriage Inward A/c], [Cash A/c], [Nominal (પ્રત્યક્ષ ખર્ચ = Dr) | Real (રોકડ ગઈ = Cr)],
  [19], [બેંકે ચાલુ ખાતામાં ₹2,400 વ્યાજ જમા કર્યું], [HDFC Bank A/c], [Bank Interest Rec.], [Personal (બેંક શિલક વધી = Dr) | Nominal (આવક = Cr)],
  [20], [પેટી કેશ માટે બેંકમાંથી ₹25,000 રોકડા ઉપાડ્યા], [Cash A/c], [HDFC Bank A/c], [Real (રોકડ આવી = Dr) | Personal (બેંક આપનાર = Cr)]
)
"""

    # TOPIC 05
    chapters[5] = """
= પ્રકરણ 05: વાઉચર્સ અને વાઉચર્સની 4 મુખ્ય શ્રેણીઓ

== 5.1 વાઉચર શું છે?
એકાઉન્ટિંગ અને ટેલી પ્રાઇમમાં *વાઉચર* એ નાણાકીય કે સ્ટોકના વ્યવહારને સાબિત કરતો મૂળ દસ્તાવેજ છે. ઓડિટમાં વાઉચર મુખ્ય પુરાવો ગણાય છે.

== 5.2 વાઉચર્સની 4 મુખ્ય શ્રેણીઓ
1. *એકાઉન્ટિંગ વાઉચર્સ:* શુદ્ધ નાણાકીય લેવડ-દેવડના વાઉચર્સ (F4, F5, F6, F7, F8, F9).
2. *ઇન્વેન્ટરી વાઉચર્સ:* ગોડાઉન વચ્ચે માલની હેરફેર કે ઉત્પાદન નોંધતા વાઉચર્સ (સ્ટોક જર્નલ, ડિલિવરી નોટ).
3. *ઓર્ડર વાઉચર્સ:* ખરીદ-વેચાણ માટેના સત્તાવાર ઓર્ડર્સ (પરચેઝ ઓર્ડર, સેલ્સ ઓર્ડર).
4. *નોન-એકાઉન્ટિંગ / મેમો વાઉચર્સ:* કામચલાઉ યાદીઓ (મેમોરેન્ડમ, રિવર્સિંગ જર્નલ).

== 5.3 24 મુખ્ય વાઉચર્સ અને શોર્ટકટ્સ
#table(
  columns: (0.9fr, 1.4fr, 1.1fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[શોર્ટકટ]], [#text(weight: "bold", fill: white)[વાઉચરનું નામ]], [#text(weight: "bold", fill: white)[શ્રેણી]], [#text(weight: "bold", fill: white)[ઉપયોગ અને વ્યવહારુ ઉદાહરણ]],
  [#key-pill("F4")], [કોન્ટ્રા (Contra)], [એકાઉન્ટિંગ], [બેંક-કેશના આંતરિક વ્યવહારો: બેંકમાં રોકડા ભર્યા, બેંકમાંથી ઉપાડ્યા કે બેંકો વચ્ચે ફેરબદલ.],
  [#key-pill("F5")], [પેમેન્ટ (Payment)], [એકાઉન્ટિંગ], [વેપારીઓને ચુકવણી, પગાર, ભાડું, લાઇટ બિલ અને સરકારી ટેક્સ ચલણ ભરવું.],
  [#key-pill("F6")], [રિસીટ (Receipt)], [એકાઉન્ટિંગ], [ગ્રાહકો પાસેથી રોકડા કે ચેક મળ્યા, મૂડી આવી, વ્યાજ કે કમિશન મળ્યું.],
  [#key-pill("F7")], [જર્નલ (Journal)], [એકાઉન્ટિંગ], [બિન-રોકડ હવાલા: મિલકત પર ઘસારો, બાકી ખર્ચા, ટીડીએસ કપાત અને ઉધાર મિલકત ખરીદી.],
  [#key-pill("F8")], [સેલ્સ (Sales)], [એકાઉન્ટિંગ], [ગ્રાહકોને માલ કે સેવા વેચાણનું પાકું જીએસટી બિલ બનાવવું.],
  [#key-pill("F9")], [પરચેઝ (Purchase)], [એકાઉન્ટિંગ], [વેપારીઓ પાસેથી માલ, કાચો માલ કે મિલકત ખરીદી બિલ નોંધવું.],
  [#key-pill("Alt + F5")], [ડેબિટ નોટ (Debit Note)], [એકાઉન્ટિંગ], [વેપારીને માલ પરત કર્યો (ખરીદ પરત) અથવા બિલમાં ભાવ ઘટાડો લીધો.],
  [#key-pill("Alt + F6")], [ક્રેડિટ નોટ (Credit Note)], [એકાઉન્ટિંગ], [ગ્રાહકે માલ પાછો આપ્યો (વેચાણ પરત) અથવા ગ્રાહકને વળતર આપ્યું.],
  [#key-pill("Alt + F7")], [સ્ટોક જર્નલ], [ઇન્વેન્ટરી], [મુખ્ય ગોડાઉનમાંથી શાખામાં માલ મોકલવો અથવા ફેક્ટરી ઉત્પાદન એન્ટ્રી કરવી.],
  [#key-pill("Ctrl + F7")], [ફિઝિકલ સ્ટોક], [ઇન્વેન્ટરી], [ઓડિટ સમયે ગોડાઉનમાં રહેલા ખરેખર સ્ટોકની ગણતરી નોંધી મેળવણું કરવું.],
  [#key-pill("Alt + F8")], [ડિલિવરી નોટ], [ઇન્વેન્ટરી], [પાકું બિલ બન્યા પહેલાં ગ્રાહકને માલ મોકલતી વખતે ચલણ બનાવવું.],
  [#key-pill("Alt + F9")], [રિસીટ નોટ (GRN)], [ઇન્વેન્ટરી], [સપ્લાયર પાસેથી માલ આવતાં જ ગોડાઉનમાં માલ સ્વીકાર રસીદ (GRN) બનાવવી.],
  [#key-pill("Ctrl + F8")], [રિજેક્શન્સ આઉટ], [ઇન્વેન્ટરી], [બિલ બન્યા પહેલાં ખરાબ માલ સપ્લાયરને સીધો પરત કરવો.],
  [#key-pill("Ctrl + F9")], [રિજેક્શન્સ ઇન], [ઇન્વેન્ટરી], [બિલ બન્યા પહેલાં ગ્રાહકે પરત કરેલ ખરાબ માલ ગોડાઉનમાં પાછો લેવો.],
  [#key-pill("Ctrl + F4")], [પરચેઝ ઓર્ડર], [ઓર્ડર], [વેપારીને માલ મોકલવા માટે લેખિત ખરીદ ઓર્ડર આપવો.],
  [#key-pill("Ctrl + F5")], [સેલ્સ ઓર્ડર], [ઓર્ડર], [ગ્રાહક પાસેથી મળેલ સત્તાવાર વેચાણ ઓર્ડર નોંધવો.],
  [#key-pill("Ctrl + F10")], [મેમોરેન્ડમ વાઉચર], [નોન-એકાઉન્ટિંગ], [કામચલાઉ યાદી જે નફા-નુકસાન કે સરવૈયામાં ભળતી નથી.],
  [#key-pill("F10")], [અન્ય વાઉચર્સ (Other)], [માસ્ટર મેનૂ], [ટેલીના તમામ 24 વાઉચર્સની સંપૂર્ણ ડિરેક્ટરી ખોલવી.]
)
"""

    # TOPIC 06
    chapters[6] = """
= પ્રકરણ 06: ગ્રુપ્સ અને લેજર્સનું ગ્રુપ મેપિંગ

== 6.1 ટેલી પ્રાઇમમાં ગ્રુપ શું છે?
ટેલીમાં *ગ્રુપ (Group)* એ ખાતાઓનું વર્ગીકરણ છે જે નક્કી કરે છે કે કયું ખાતું પાકા સરવૈયામાં કે નફા-નુકસાન ખાતામાં ક્યાં દર્શાવવામાં આવશે. ટેલીમાં *28 પૂર્વ-નિર્ધારિત ગ્રુપ્સ* આપેલા છે (15 પ્રાથમિક અને 13 ગૌણ).

જો ભૂલથી સપ્લાયરનું ખાતું *Sundry Creditors* ના બદલે *Direct Expenses* માં બનાવવામાં આવે, તો વેપાર ખાતામાં ખર્ચ વધી જશે અને પાકા સરવૈયામાં દેવું ખોટું દેખાશે!

== 6.2 15 પ્રાથમિક અને 13 ગૌણ ગ્રુપ્સ
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(fill: rgb("#F0FDFA"), stroke: 1pt + rgb("#99F6E4"), inset: 8pt, radius: 4pt)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[15 પ્રાથમિક ગ્રુપ્સ (Primary):]\\
      1. Capital Account\\
      2. Loans (Liability)\\
      3. Current Liabilities\\
      4. Fixed Assets\\
      5. Current Assets\\
      6. Investments\\
      7. Misc. Expenses (Asset)\\
      8. Suspense Account\\
      9. Branch / Divisions\\
      10. Sales Accounts\\
      11. Purchase Accounts\\
      12. Direct Incomes\\
      13. Indirect Incomes\\
      14. Direct Expenses\\
      15. Indirect Expenses
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), inset: 8pt, radius: 4pt)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#1D4ED8"))[13 ગૌણ ગ્રુપ્સ (Secondary):]\\
      1. Reserves & Surplus (Capital હેઠળ)\\
      2. Bank OD A/c (Loans Liab હેઠળ)\\
      3. Secured Loans (Loans Liab હેઠળ)\\
      4. Unsecured Loans (Loans Liab હેઠળ)\\
      5. Duties & Taxes (Current Liab હેઠળ)\\
      6. Provisions (Current Liab હેઠળ)\\
      7. Sundry Creditors (Current Liab હેઠળ)\\
      8. Bank Accounts (Current Assets હેઠળ)\\
      9. Cash-in-Hand (Current Assets હેઠળ)\\
      10. Deposits (Asset) (Current Assets હેઠળ)\\
      11. Loans & Advances (Asset) (Current Assets)\\
      12. Stock-in-Hand (Current Assets હેઠળ)\\
      13. Sundry Debtors (Current Assets હેઠળ)
    ]
  ]
)

== 6.3 50+ મહત્વપૂર્ણ લેજર-ગ્રુપ મેપિંગ લિસ્ટ
રાહુલ સરના ક્લાસરૂમ નોટ્સ પરથી સંકલિત:
#table(
  columns: (0.4fr, 2.2fr, 1.8fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[ક્ર.]], [#text(weight: "bold", fill: white)[લેજરનું નામ]], [#text(weight: "bold", fill: white)[ટેલી ગ્રુપ વર્ગીકરણ]], [#text(weight: "bold", fill: white)[નાણાકીય રિપોર્ટ અને સ્વરૂપ]],
  [01], [સલમાનનું મૂડી ખાતું (Salman\'s Capital)], [Capital Account], [પાકું સરવૈયું (માલિકની મૂડી)],
  [02], [ભાગીદાર ઉપાડ ખાતું (Drawings A/c)], [Capital Account], [પાકું સરવૈયું (મૂડીમાંથી બાદ)],
  [03], [એચડીએફસી બેંક ચાલુ ખાતું (HDFC Bank)], [Bank Accounts], [પાકું સરવૈયું (ચાલુ મિલકત)],
  [04], [એસબીઆઈ કેશ ક્રેડિટ/ઓવરડ્રાફ્ટ (SBI OD)], [Bank OD A/c], [પાકું સરવૈયું (લોન દેવું)],
  [05], [પેટી કેશ ખાતું (Petty Cash)], [Cash-in-hand], [પાકું સરવૈયું (ચાલુ મિલકત)],
  [06], [પ્લાન્ટ અને ભારે મશીનરી ખાતું], [Fixed Assets], [પાકું સરવૈયું (કાયમી મિલકત)],
  [07], [ઓફિસ કોમ્પ્યુટર્સ અને લેપટોપ્સ], [Fixed Assets], [પાકું સરવૈયું (કાયમી મિલકત)],
  [08], [ઓફિસ ફર્નિચર અને ફિટિંગ્સ], [Fixed Assets], [પાકું સરવૈયું (કાયમી મિલકત)],
  [09], [મહેતા ટ્રેડર્સ (ગ્રાહક/દેવાદાર)], [Sundry Debtors], [પાકું સરવૈયું (લેણું - ચાલુ મિલકત)],
  [10], [રાજેશ બ્રધર્સ (ગ્રાહક/દેવાદાર)], [Sundry Debtors], [પાકું સરવૈયું (લેણું - ચાલુ મિલકત)],
  [11], [પટેલ ઇલેક્ટ્રોનિક્સ (વેપારી/લેણદાર)], [Sundry Creditors], [પાકું સરવૈયું (દેવું - ચાલુ જવાબદારી)],
  [12], [અંબિકા ટ્રેડિંગ કંપની (સપ્લાયર)], [Sundry Creditors], [પાકું સરવૈયું (દેવું - ચાલુ જવાબદારી)],
  [13], [Output CGST / SGST / IGST A/c], [Duties & Taxes], [પાકું સરવૈયું (સરકારને ચૂકવવાપાત્ર કર)],
  [14], [Input CGST / SGST / IGST A/c], [Duties & Taxes], [પાકું સરવૈયું (ટેક્સ ક્રેડિટ લેણું)],
  [15], [કોન્ટ્રાક્ટર ટીડીએસ દેવું (Sec 194C)], [Duties & Taxes], [પાકું સરવૈયું (ચાલુ જવાબદારી)],
  [16], [પ્રોફેશનલ ફી ટીડીએસ (Sec 194J)], [Duties & Taxes], [પાકું સરવૈયું (ચાલુ જવાબદારી)],
  [17], [દુકાન ભાડા ડિપોઝિટ (Security Deposit)], [Deposits (Asset)], [પાકું સરવૈયું (પરત મળવાપાત્ર અનામત)],
  [18], [ઇલેક્ટ્રિસિટી બોર્ડ ડિપોઝિટ], [Deposits (Asset)], [પાકું સરવૈયું (લાંબાગાળાની ડિપોઝિટ)],
  [19], [સ્ટાફને આપેલ એડવાન્સ (Staff Advance)], [Loans & Advances (Asset)], [પાકું સરવૈયું (ચાલુ મિલકત)],
  [20], [સપ્લાયરને માલ પેટે એડવાન્સ], [Loans & Advances (Asset)], [પાકું સરવૈયું (ચાલુ મિલકત)],
  [21], [બેંક ઓફ બરોડા મુદતી લોન], [Secured Loans], [પાકું સરવૈયું (તારણવાળી લોન)],
  [22], [મિત્ર પાસેથી લીધેલી લોન], [Unsecured Loans], [પાકું સરવૈયું (બિનતારણ લોન)],
  [23], [એસબીઆઈ બેંક ફિક્સ ડિપોઝિટ (FD)], [Investments], [પાકું સરવૈયું (રોકાણ મિલકત)],
  [24], [શેરબજાર અને મ્યુચ્યુઅલ ફંડ રોકાણ], [Investments], [પાકું સરવૈયું (રોકાણ મિલકત)],
  [25], [ફેક્ટરી મજૂરોની મજૂરી (Factory Wages)], [Direct Expenses], [વેપાર ખાતું (કાચો નફો નક્કી કરે)],
  [26], [ખરીદીનું આવક માલ ગાડાભાડું], [Direct Expenses], [વેપાર ખાતું (માલની પડતર કિંમત)],
  [27], [ફેક્ટરી પાવર અને કોલસો બળતણ], [Direct Expenses], [વેપાર ખાતું (ઉત્પાદન ખર્ચ)],
  [28], [ઓફિસ સ્ટાફનો પગાર (Salary)], [Indirect Expenses], [નફા-નુકસાન ખાતું (વહીવટી ખર્ચ)],
  [29], [ઓફિસ દુકાનનું ભાડું (Office Rent)], [Indirect Expenses], [નફા-નુકસાન ખાતું (વહીવટી ખર્ચ)],
  [30], [લાઈટ બિલ અને ઈન્ટરનેટ ખર્ચ], [Indirect Expenses], [નફા-નુકસાન ખાતું (યુટિલિટી ખર્ચ)],
  [31], [સીએ ઓડિટ ફી (Audit Fees)], [Indirect Expenses], [નફા-નુકસાન ખાતું (પ્રોફેશનલ ખર્ચ)],
  [32], [મિલકત પર માંડી વાળેલ ઘસારો], [Indirect Expenses], [નફા-નુકસાન ખાતું (બિન-રોકડ ખર્ચ)],
  [33], [સ્થાનિક માલ વેચાણ (Sales Local 18%)], [Sales Accounts], [વેપાર ખાતું (મુખ્ય વેચાણ આવક)],
  [34], [આંતરરાજ્ય વેચાણ (Sales Interstate)], [Sales Accounts], [વેપાર ખાતું (મુખ્ય વેચાણ આવક)],
  [35], [વેચાણ પરત (Sales Return)], [Sales Accounts], [વેપાર ખાતું (વેચાણમાંથી બાદ)],
  [36], [સ્થાનિક માલ ખરીદી (Purchase Local)], [Purchase Accounts], [વેપાર ખાતું (માલ ખરીદી ખર્ચ)],
  [37], [ખરીદ પરત (Purchase Return)], [Purchase Accounts], [વેપાર ખાતું (ખરીદીમાંથી બાદ)],
  [38], [ગ્રાહકને આપેલ રોકડ વટાવ (Discount All.)], [Indirect Expenses], [નફા-નુકસાન ખાતું (નાણાકીય ખર્ચ)],
  [39], [સપ્લાયર પાસેથી મળેલ વટાવ (Discount Rec.)], [Indirect Incomes], [નફા-નુકસાન ખાતું (નાણાકીય ઉપજ)],
  [40], [બેંક વ્યાજ આવક (Interest Received)], [Indirect Incomes], [નફા-નુકસાન ખાતું (અન્ય આવક)],
  [41], [ઘાલખાધ નુકસાન (Bad Debts)], [Indirect Expenses], [નફા-નુકસાન ખાતું (નાણાકીય નુકસાન)],
  [42], [ઘાલખાધ અનામત (Provision Bad Debts)], [Provisions], [પાકું સરવૈયું (દેવાદારોમાંથી બાદ)],
  [43], [ચૂકવવાનું બાકી ભાડું (Outstanding Rent)], [Provisions / Current Liab], [પાકું સરવૈયું (ચાલુ જવાબદારી)],
  [44], [અગાઉથી ચૂકવેલ વીમો (Prepaid Insurance)], [Loans & Advances (Asset)], [પાકું સરવૈયું (ચાલુ મિલકત)],
  [45], [સામાન્ય અનામત (General Reserve)], [Reserves & Surplus], [પાકું સરવૈયું (નફામાંથી અનામત)],
  [46], [મુંબઈ શાખા ખાતું (Branch Account)], [Branch / Divisions], [પાકું સરવૈયું (શાખા લેવડ-દેવડ)],
  [47], [સ્ટેશનરી અને છાપકામ ખર્ચ], [Indirect Expenses], [નફા-નુકસાન ખાતું (વહીવટી ખર્ચ)],
  [48], [વેપારિક મુસાફરી ખર્ચ (Travelling)], [Indirect Expenses], [નફા-નુકસાન ખાતું (વેચાણ ખર્ચ)],
  [49], [બેંક ચાર્જિસ (Bank Charges)], [Indirect Expenses], [નફા-નુકસાન ખાતું (નાણાકીય ખર્ચ)],
  [50], [ઉપલક ખાતું (Suspense Account)], [Suspense Account], [પાકું સરવૈયું (કામચલાઉ ખાતું)]
)
"""

    # TOPIC 07
    chapters[7] = """
= પ્રકરણ 07: કંપની અને ટેલી પ્રાઇમમાં કંપની બનાવવાની પદ્ધતિ

== 7.1 કંપની શું છે?
ટેલી પ્રાઇમમાં *કંપની* એ સ્વતંત્ર હિસાબી એકમ છે. દરેક કંપનીની પોતાની અલગ ખાતાવહી, સ્ટોક આઇટમ્સ, વાઉચર્સ, નાણાકીય વર્ષ અને પાસવર્ડ સુરક્ષા હોય છે.

== 7.2 તબક્કાવાર કંપની બનાવવાની પદ્ધતિ
1. *ગેટવે ઓફ ટેલી* પરથી #key-pill("Alt + K") (કંપની મેનૂ) દબાવી *Create* પસંદ કરો (અથવા #key-pill("F3") દબાવી *Create Company*).
2. *Company Data Path:* ડેટા સાચવવાનો પાથ (દા.ત. `C:\\ProgramData\\TallyPrime\\Data`).
3. *Company Name:* પેઢીનું સત્તાવાર નામ લખો (દા.ત. `Ravi Private Limited` અથવા `Shree Ambica Agro Traders`).
4. *Address:* સરનામું, શહેર અને પિનકોડ લખો (દા.ત. `દુકાન નં. 14, એપીએમસી માર્કેટ યાર્ડ, હાઇવે રોડ, પાલનપુર - 385001`).
5. *State & Country:* રાજ્યમાં *Gujarat* અને દેશમાં *India* પસંદ કરો.
   #concept-box(title: "અતિ મહત્વનો નિયમ: સ્ટેટ કોડનું મહત્વ")[
     રાજ્ય તરીકે ગુજરાત પસંદ કરવાથી ટેલી આપોઆપ સ્ટેટ કોડ `24` ફાળવે છે. તેના આધારે ટેલી નક્કી કરે છે કે ગુજરાતના બિલમાં CGST+SGST લાગશે કે બહારના બિલમાં IGST!
   ]
6. *Financial Year Beginning From:* ભારતીય નાણાકીય વર્ષની શરૂઆત `01-Apr-2026` દાખલ કરો.
7. *Books Beginning From:* હિસાબો લખવાની શરૂઆત તારીખ (સામાન્ય રીતે `01-Apr-2026`).
8. *Security / Tally Vault:* *Control User Access to Company Data = Yes* કરી એડમિનિસ્ટ્રેટર યુઝરનેમ અને પાસવર્ડ સેટ કરો.
9. *Base Currency:* કરન્સી સિમ્બોલ `₹`, ફોર્મલ નામ `INR`, દશાંશ સ્થળ `2` રાખી #key-pill("Ctrl + A") થી સેવ કરો.

== 7.3 F11 ફીચર્સ અને જીએસટી સેટઅપ
કંપની બનતાં જ *F11: Features* સ્ક્રીન ખૂલે છે:
- *Accounting Features:* Maintain Accounts = `Yes`, Enable Bill-wise Details = `Yes`.
- *Inventory Features:* Maintain Inventory = `Yes`, Integrate Accounts with Inventory = `Yes`.
- *Statutory & Taxation (GST):*
  - Enable Goods and Services Tax (GST) = `Yes`.
  - State: `Gujarat` | Registration: `Regular`.
  - GSTIN/UIN: 15-અંકી જીએસટી નંબર લખો (દા.ત. `24AABCR1234F1Z5`).
  - Periodicity of GSTR-1: `Monthly`. E-Way Bill = `Yes` (મર્યાદા: `₹50,000`).
- *TDS Configuration:* Enable TDS = `Yes`. TAN નંબર દાખલ કરી #key-pill("Ctrl + A") થી સેવ કરો.
"""

    # TOPIC 08
    chapters[8] = """
= પ્રકરણ 08: વ્યાપારિક સંગઠનોના પ્રકાર અને હિસાબી પદ્ધતિ

== 8.1 ટ્રેડિંગ પેઢીઓ (વેપારી પેઢીઓ)
*વ્યાખ્યા:* જે પેઢીઓ તૈયાર માલ જથ્થાબંધ ખરીદીને તેનું સ્વરૂપ બદલ્યા વિના નફો ઉમેરીને છૂટક કે અન્ય વેપારીઓને વેચે છે.
#concept-box(title: "વાસ્તવિક કેસ: શ્રી અંબિકા એગ્રો ટ્રેડર્સ, ઊંઝા એપીએમસી")[
  - *વેપાર:* ઉત્તર ગુજરાતના ખેડૂતો પાસેથી એપીએમસી ઊંઝા ખાતે 0% જીએસટી પર કાચું જીરું, ઇસબગોલ, વરિયાળી ખરીદી, સોર્ટિંગ-ગ્રેડિંગ કરી 50 કિલોની ગુણોમાં પેક કરીને વેચવું.
  - *ટેલી સેટઅપ:*
    - *યુનિટ્સ (Units):* `KGS` (કિલો), `QNTL` (ક્વિન્ટલ), `BAG` (50 કિલોની ગુણ).
    - *સ્ટોક આઇટમ્સ:* Unbranded Jeera Grade-A (HSN 0909, GST 0%), Packaged Cumin (HSN 0909, GST 5%).
    - *વાઉચર્સ:* Purchase (F9) અને Sales (F8) માં બેચ તથા એક્સપાયરી ટ્રેકિંગ.
]

== 8.2 મેન્યુફેક્ચરિંગ એકમો (ઉત્પાદન કારખાના)
*વ્યાખ્યા:* જે પેઢીઓ કાચો માલ ખરીદી, મશીનરી, શ્રમ અને વીજળી/ગેસના વપરાશ દ્વારા નવો તૈયાર માલ બનાવે છે.
#concept-box(title: "વાસ્તવિક કેસ: મોરબી સિરામિક ટાઇલ્સ પ્રા. લિ., મોરબી ક્લસ્ટર")[
  - *વેપાર:* કાચી માટી, કેમિકલ્સ અને નેચરલ ગેસની મદદથી હાઇડ્રોલિક પ્રેસ અને ભઠ્ઠીમાં 600x1200mm ની વિટ્રિફાઇડ ફ્લોર ટાઇલ્સ બનાવવી.
  - *ટેલી સેટઅપ:*
    - *બિલ ઓફ મટીરિયલ્સ (BOM):* 1 બોક્સ ટાઇલ્સ બનાવવા 28 કિલો માટી + 2.5 કિલો ગ્લેઝ + 1.2 યુનિટ ગેસ + ₹45 મજૂરીની પૂર્વ-નિર્ધારિત રેસિપી.
    - *ગોડાઉન:* કાચા માલનું ગોડાઉન -> પ્રોડક્શન ફ્લોર -> ફિનિશ્ડ ગુડ્ઝ ગોડાઉન.
    - *વાઉચર:* Stock Journal (#key-pill("Alt + F7")) માં *Manufacturing Journal* મોડ.
]

== 8.3 સર્વિસ સંસ્થાઓ (સેવા ક્ષેત્ર)
*વ્યાખ્યા:* કોઈપણ ભૌતિક માલ વગર માત્ર અમૂર્ત વ્યાવસાયિક, ટેકનિકલ કે કન્સલ્ટિંગ સેવાઓ આપતી સંસ્થાઓ.
#concept-box(title: "વાસ્તવિક કેસ: અમદાવાદ ક્લાઉડ ટેક અને સીએ એડવાઇઝરી એલએલપી")[
  - *વેપાર:* સોફ્ટવેર ડેવલપમેન્ટ, ક્લાઉડ સર્વર્સ અને સીએ ઓડિટ સેવાઓ.
  - *ટેલી સેટઅપ:* કોઈ સ્ટોક આઇટમ નહિ. 6-અંકી SAC કોડ (SAC 998314 આઇટી સર્વિસ પર 18% જીએસટી). બિલિંગ *Accounting Invoice* (#key-pill("Ctrl + H")) દ્વારા 10% ટીડીએસ કપાત સાથે.
]
"""

    # TOPIC 09
    chapters[9] = """
= પ્રકરણ 09: પ્રેક્ટિકલ ઇનવોઇસિંગ (ઇન્વેન્ટરી ઇનવોઇસ વિરુદ્ધ એકાઉન્ટિંગ ઇનવોઇસ)

ટેલી પ્રાઇમમાં ઇનવોઇસ મોડ બદલવા માટેનો સાર્વત્રિક શોર્ટકટ: #key-pill("Ctrl + H") (Change Mode).

== 9.1 ઇન્વેન્ટરી ઇનવોઇસ (Item Invoice Mode)
*ક્યારે વાપરવું:* જ્યારે ભૌતિક માલસામાન (જથ્થો, ભાવ, યુનિટ, HSN અને જીએસટી સાથે) ખરીદવો કે વેચવો હોય.
#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[ઇનવોઇસ ફીલ્ડ]], [#text(weight: "bold", fill: white)[વ્યવહારુ એન્ટ્રી અને નિયમ]],
  [વાઉચર મોડ], [સેલ્સ વાઉચર (#key-pill("F8")) માં #key-pill("Ctrl + H") દબાવી *Item Invoice* પસંદ કરો.],
  [Party A/c Name], [ગ્રાહકનું ખાતું પસંદ કરો (દા.ત. `આલ્ફા ઇન્ફોટેક પ્રા. લિ.`, ગુજરાત કોડ 24).],
  [Sales Ledger], [`Sales Local 18%` લેજર પસંદ કરો.],
  [Name of Item], [સ્ટોક આઇટમ પસંદ કરો (દા.ત. `Dell Latitude Laptop`). ગોડાઉન, જથ્થો (5 Nos) અને ભાવ (₹52,000/No). કરપાત્ર રકમ = ₹2,60,000.],
  [ટેક્સ લેજર્સ], [આઇટમ ટેબલની નીચે `Output CGST` (9% = ₹23,400) અને `Output SGST` (9% = ₹23,400) લગાવો. કુલ બિલ = *₹3,06,800*.],
  [ઈ-વે બિલ અને પ્રિન્ટ], [₹50,000 થી વધુ રકમ હોવાથી ઈ-વે બિલ વિગત ભરો. #key-pill("Ctrl + A") થી સેવ કરી #key-pill("Alt + P") થી પ્રિન્ટ મેળવો.]
)

== 9.2 એકાઉન્ટિંગ ઇનવોઇસ (Accounting Invoice Mode)
*ક્યારે વાપરવું:* જ્યારે કોઈ માલ વગર માત્ર કન્સલ્ટિંગ ફી, ઓફિસ ભાડું કે સર્વિસનું બિલ બનાવવું હોય.
#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[ઇનવોઇસ ફીલ્ડ]], [#text(weight: "bold", fill: white)[વ્યવહારુ એન્ટ્રી અને નિયમ]],
  [વાઉચર મોડ], [સેલ્સ વાઉચર (#key-pill("F8")) માં #key-pill("Ctrl + H") દબાવી *Accounting Invoice* પસંદ કરો.],
  [Party A/c Name], [કોર્પોરેટ ક્લાયન્ટ પસંદ કરો (દા.ત. `એપેક્સ ગ્લોબલ મુંબઈ`, મહારાષ્ટ્ર કોડ 27).],
  [Particulars (લેજર)], [સર્વિસ લેજર `IT Consulting Services` (SAC 998314) પસંદ કરો. રકમ = ₹50,000.00.],
  [ટેક્સ લેજર], [પાર્ટી બહારના રાજ્યની હોવાથી `Output IGST` (18% = ₹9,000.00) લગાવો. કુલ બિલ = *₹59,000.00*.],
  [ટીડીએસ કપાત], [ક્લાયન્ટ કલમ 194J મુજબ ₹5,000 (10%) ટીડીએસ કાપીને ₹54,000 બેંક ટ્રાન્સફર કરશે.]
)
"""

    # TOPIC 10
    chapters[10] = """
= પ્રકરણ 10: ટેલી પ્રાઇમના માસ્ટર કીબોર્ડ શોર્ટકટ્સ

રાહુલ સરના આઇએએનટી પાલનપુર પુસ્તકમાંથી સંકલિત 40+ સત્તાવાર શોર્ટકટ્સ:

#table(
  columns: (1fr, 1.4fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[શોર્ટકટ કી]], [#text(weight: "bold", fill: white)[ટેલી પ્રાઇમમાં કાર્ય]], [#text(weight: "bold", fill: white)[વ્યવહારુ ઉપયોગ]],
  [#key-pill("Alt + G")], [Go To (સાર્વત્રિક સર્ચ)], [ચાલુ બિલમાંથી બહાર નીકળ્યા વિના કોઈ પણ રિપોર્ટ કે લેજર ખોલવું.],
  [#key-pill("Ctrl + G")], [Switch To], [હાલની સ્ક્રીન છોડીને સીધા બીજા રિપોર્ટ પર જવું.],
  [#key-pill("Esc")], [Escape / પાછા જાઓ], [ચાલુ સ્ક્રીન બંધ કરી પાછળની સ્ક્રીન પર જવું.],
  [#key-pill("Alt + K")], [કંપની ટોપ મેનૂ], [કંપની બનાવવી, બદલવી, પસંદ કરવી, બંધ કરવી અને સિક્યોરિટી.],
  [#key-pill("F2")], [તારીખ બદલો], [રોજિંદા વ્યવહારની તારીખ બદલવી.],
  [#key-pill("Alt + F2")], [નાણાકીય ગાળો બદલો], [હિસાબી વર્ષ બદલવું (01-Apr-2026 થી 31-Mar-2027).],
  [#key-pill("F3")], [કંપની સ્વિચ કરો], [ખુલેલી કંપનીઓમાંથી બીજી કંપની પર જવું.],
  [#key-pill("Alt + F3")], [કંપની પસંદ કરો], [કોમ્પ્યુટર ફોલ્ડરમાંથી નવી કંપની ખોલવી.],
  [#key-pill("Alt + Y")], [ડેટા મેનૂ], [ડેટા બેકઅપ, રિસ્ટોર અને વર્ષાંત વિભાજન.],
  [#key-pill("Alt + Z")], [એક્સચેન્જ મેનૂ], [શાખાઓ વચ્ચે ડેટા સિન્ક્રોનાઇઝેશન.],
  [#key-pill("Alt + O")], [ઇમ્પોર્ટ મેનૂ], [લેજર્સ, વાઉચર્સ અને બેંક સ્ટેટમેન્ટ આયાત કરવા.],
  [#key-pill("Alt + E")], [એક્સપોર્ટ મેનૂ], [રિપોર્ટ્સને પીડીએફ કે એક્સેલમાં એક્સપોર્ટ કરવા.],
  [#key-pill("Alt + M")], [ઈમેલ મેનૂ], [બિલ કે ખાતાવહી સીધી ક્લાયન્ટને ઈમેલ કરવી.],
  [#key-pill("Alt + P")], [પ્રિન્ટ મેનૂ], [બિલ, ચેક અને વાઉચર્સ પ્રિન્ટ કરવા.],
  [#key-pill("F1")], [હેલ્પ મેનૂ], [ટેલી હેલ્પ અને સોફ્ટવેર અપગ્રેડ ગાઇડ.],
  [#key-pill("F4")], [કોન્ટ્રા વાઉચર], [કેશ-બેંકના આંતરિક ટ્રાન્સફર નોંધવા.],
  [#key-pill("F5")], [પેમેન્ટ વાઉચર], [વેપારીઓ, ખર્ચા અને ટેક્સ ચલણ ભરવા.],
  [#key-pill("F6")], [રિસીટ વાઉચર], [ગ્રાહકો પાસેથી રોકડા કે ચેક મળ્યા તે નોંધવા.],
  [#key-pill("F7")], [જર્નલ વાઉચર], [બિન-રોકડ હવાલા, ટીડીએસ કપાત અને ઘસારો.],
  [#key-pill("F8")], [સેલ્સ વાઉચર], [ગ્રાહકોને માલ કે સેવા વેચાણનું બિલ.],
  [#key-pill("F9")], [પરચેઝ વાઉચર], [વેપારીઓ પાસેથી માલ કે મિલકત ખરીદી.],
  [#key-pill("Alt + F5")], [ડેબિટ નોટ], [ખરીદ પરત (Purchase Return) નોંધવી.],
  [#key-pill("Alt + F6")], [ક્રેડિટ નોટ], [વેચાણ પરત (Sales Return) નોંધવી.],
  [#key-pill("Alt + F7")], [સ્ટોક જર્નલ], [ગોડાઉન ટ્રાન્સફર અને ફેક્ટરી ઉત્પાદન.],
  [#key-pill("Ctrl + F7")], [ફિઝિકલ સ્ટોક], [ગોડાઉનમાં માલનો ભૌતિક જથ્થો ચકાસવો.],
  [#key-pill("Alt + F8")], [ડિલિવરી નોટ], [બિલ બન્યા પહેલાં ડિલિવરી ચલણ કાઢવું.],
  [#key-pill("Alt + F9")], [રિસીટ નોટ (GRN)], [ગોડાઉનમાં માલ સ્વીકાર રસીદ બનાવવી.],
  [#key-pill("Ctrl + F4")], [પરચેઝ ઓર્ડર], [વેપારીને ખરીદ ઓર્ડર મોકલવો.],
  [#key-pill("Ctrl + F5")], [સેલ્સ ઓર્ડર], [ગ્રાહકનો વેચાણ ઓર્ડર બુક કરવો.],
  [#key-pill("F10")], [અન્ય વાઉચર્સ], [તમામ 24 વાઉચર્સની ડિરેક્ટરી ખોલવી.],
  [#key-pill("F11")], [કંપની ફીચર્સ], [જીએસટી, ટીડીએસ અને સ્ટોક ફીચર્સ ચાલુ કરવા.],
  [#key-pill("F12")], [કોન્ફિગરેશન], [સ્ક્રીન મુજબ વધારાની વિગતો દર્શાવવી.],
  [#key-pill("Alt + C")], [ઓન-ધ-ફ્લાય ક્રિએટ / કેલ્સી], [વાઉચર બનાવતાં જ નવું લેજર બનાવવું / કેલ્ક્યુલેટર ખોલવું.],
  [#key-pill("Ctrl + Enter")], [લેજરમાં સુધારો (Alter)], [વાઉચરની અંદરથી જ લેજર સુધારવું.],
  [#key-pill("Ctrl + A")], [ઝડપી સેવ કરો], [સ્ક્રીન કે વાઉચરને એક જ ક્લિકમાં સેવ કરવું.],
  [#key-pill("Alt + D")], [ડિલીટ કરો], [કોઈપણ બિનજરૂરી લેજર કે વાઉચર રદ કરવું.],
  [#key-pill("Alt + X")], [વાઉચર કેન્સલ કરો], [ઓડિટ નંબર જાળવી રાખી વાઉચર રદ કરવું.],
  [#key-pill("Ctrl + H")], [મોડ બદલો], [Item Invoice, Accounting Invoice અને As Voucher વચ્ચે ફેરવવું.],
  [#key-pill("Ctrl + I")], [More Details], [ઈ-વે બિલ, વાહન નંબર જેવી વધારાની વિગતો ઉમેરવી.],
  [#key-pill("Alt + R")], [પાછલી વિગત લાવો], [અગાઉના વાઉચરનું Narration લાવી મૂકવું.],
  [#key-pill("Ctrl + T")], [પોસ્ટ-ડેટેડ વાઉચર], [ભવિષ્યની તારીખનો ચેક બુક કરવો.],
  [#key-pill("Spacebar")], [પંક્તિ પસંદ કરો], [રિપોર્ટમાં એક કે વધુ વ્યવહારો સિલેક્ટ કરવા.]
)
"""

    # TOPIC 11
    chapters[11] = """
= પ્રકરણ 11: કોર્પોરેટ બ્રિજ વિષયો (પ્રોફેશનલ એકાઉન્ટિંગ તરફ પ્રયાણ)

એક સાધારણ ઓપરેટરમાંથી ઉચ્ચ પગારદાર કોર્પોરેટ એકાઉન્ટન્ટ બનવા માટે આ ચાર વિષયો આવશ્યક છે:

== 11.1 જીએસટી સુધારા અને રિટર્ન મેળવણું
- *GSTR-1:* દર મહિનાની 11 તારીખ સુધીમાં ભરાતું માસિક વેચાણ રિટર્ન.
- *GSTR-3B:* દર મહિનાની 20 તારીખ સુધીમાં ટેક્સ ચુકવણી માટે ભરાતું સારાંશ રિટર્ન.
- *GSTR-2B મેળવણું:* દર મહિનાની 14 તારીખે પોર્ટલ પર આપોઆપ જનરેટ થતું ઇનપુટ ટેક્સ ક્રેડિટ સ્ટેટમેન્ટ. *સુવર્ણ નિયમ:* જો વેપારી તેના GSTR-1 માં તમારું બિલ ન ચડાવે તો તે તમારા GSTR-2B માં નહિ દેખાય, અને કલમ 16(2)(aa) મુજબ તેનો ટેક્સ ક્રેડિટ બાદ નહિ મળે! ટેલી પ્રાઇમનું રિકન્સિલિયેશન ટૂલ મિનિટોમાં આ મેળવણું કરી આપે છે.

== 11.2 બેંક રિકન્સિલિયેશન સ્ટેટમેન્ટ (BRS)
રોકડમેળ મુજબની બેંક શિલક અને પાસબુક શિલક વચ્ચે હંમેશા તફાવત રહે છે:
- *વેપારીને ચેક આપ્યો પણ તેણે બેંકમાં હજુ રજૂ નથી કર્યો (Unpresented cheques).*
- *ગ્રાહકનો ચેક બેંકમાં ભર્યો પણ હજુ જમા નથી થયો (Uncredited cheques).*
- *બેંકે સીધા કાપેલા ચાર્જિસ કે સીધું જમા કરેલું વ્યાજ.*
*ટેલીમાં મેળવણું:* *Gateway of Tally -> Banking -> Bank Reconciliation* માં જઈ દરેક વ્યવહાર સામે પાસબુકની સાચી તારીખ (*Bank Date*) લખતાં જ તફાવત શૂન્ય થઈ જાય છે! ટેલીમાં બેંક સ્ટેટમેન્ટ સીધું આયાત કરીને ઓટો-બીઆરએસ પણ થઈ શકે છે.

== 11.3 કોસ્ટ સેન્ટર્સ અને કોસ્ટ કેટેગરીઝ
કંપનીઓ શાખાઓ કે પ્રોજેક્ટ્સ મુજબ નફા-નુકસાન અલગથી ટ્રેક કરે છે:
- *Cost Category:* મુખ્ય વર્ગ (દા.ત. `Regional Branches`).
- *Cost Centre:* શાખા (દા.ત. `Ahmedabad Branch`, `Surat Branch`, `Palanpur Hub`).
જ્યારે ₹60,000 *Travelling Expenses* ચૂકવાય, ત્યારે ટેલી પૂછે છે કે કઈ શાખાનો કેટલો ખર્ચ છે (અમદાવાદ ₹30k, સુરત ₹20k, પાલનપુર ₹10k). અલગ લેજર્સ બનાવ્યા વગર જ દરેક શાખાનો અલગ ખર્ચ મળી જાય છે!

== 11.4 નાણાકીય વર્ષ ક્લોઝિંગ અને ડેટા સ્પ્લિટ (Data Splitting)
31 માર્ચે નાણાકીય વર્ષ પૂરું થતાં એકાઉન્ટન્ટની મુખ્ય ફરજો:
1. મિલકતો પર ઘસારો (Depreciation) ગણવો.
2. માર્ચ મહિનાના બાકી પગાર અને લાઇટ બિલની જોગવાઈ (Provision) કરવી.
3. અગાઉથી ચૂકવેલ વીમાની રકમ આવતા વર્ષ માટે મુલતવી રાખવી.
4. ગોડાઉનમાં રહેલા ખરેખર સ્ટોકની ગણતરી કરી મેળવણું કરવું.
5. *કંપની ડેટા સ્પ્લિટ (#key-pill("Alt + Y") -> Split):* 1 એપ્રિલે નવા વર્ષમાં પ્રવેશતી વખતે જૂના ડેટામાંથી નવું વર્ષ અલગ કરવું, જેથી જૂનો ડેટા સચવાઈ રહે અને 31 માર્ચની આખર શિલક નવા વર્ષની શરૂઆતની શિલક બની જાય!
"""

    return chapters
'''

if __name__ == "__main__":
    print("Generating scripts/tally_content_eng.py...")
    with open(os.path.join(SCRIPTS_DIR, "tally_content_eng.py"), "w", encoding="utf-8") as f:
        f.write(generate_english())

    print("Generating scripts/tally_content_hi.py...")
    with open(os.path.join(SCRIPTS_DIR, "tally_content_hi.py"), "w", encoding="utf-8") as f:
        f.write(generate_hindi())

    print("Generating scripts/tally_content_gu.py...")
    with open(os.path.join(SCRIPTS_DIR, "tally_content_gu.py"), "w", encoding="utf-8") as f:
        f.write(generate_gujarati())

    print("All 3 content files generated successfully!")
