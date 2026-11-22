# -*- coding: utf-8 -*-
"""
Full English Curriculum Module Generator for Tally Prime Master Publication
Part 3: Topics 8 to 11 (Expanded for 50-60 Page Commercial Edition)
Standardized by Rahul Patel (Founder, RTechLab / IANT Palanpur)
Direct Contact: rahul.28e1@gmail.com
"""

def append_chapters_8_to_11(chapters):
    # =========================================================================
    # TOPIC 08
    # =========================================================================
    chapters[8] = """
= Topic 08: Types of Business Organizations & Corporate Case Studies

== 8.1 The Three Core Business Organization Models
Commercial accounting in Tally Prime adapts dynamically to the operational structure of an enterprise. Every corporate business entity falls into one of three structural categories:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Business Model]], [#text(weight: "bold", fill: white)[Operational Nature]], [#text(weight: "bold", fill: white)[Core Revenue Engine]], [#text(weight: "bold", fill: white)[Key Tally Prime Capabilities]],
  [1. Trading Concerns], [Purchase finished goods and resell them to retailers/consumers without altering their physical form.], [Gross Margin = Sales Revenue - Cost of Goods Sold (COGS).], [Stock items with units (Kgs, Pcs, Boxes), Godowns, batch tracking, standard sales/purchase invoices (Item Mode).],
  [2. Manufacturing Concerns], [Procure raw materials, combine them with labor and machine power, and manufacture finished products.], [Value Addition = Selling Price - (Raw Material Cost + Direct Labor + Factory Power).], [Bill of Materials (BOM), Manufacturing Journal (Alt+F7), WIP inventory, cost tracking, scrap recording.],
  [3. Service Providers], [Provide intangible professional skills, technology solutions, consultancy, or maintenance services.], [Operating Profit = Invoiced Fees - Administrative Overheads & Salaries.], [Accounting Invoice Mode (Ctrl+H), Services Accounting Codes (SAC), Service GST, TDS under Section 194J/194C.]
)

#v(6pt)

== 8.2 Comparative Accounting Architecture Matrix
#table(
  columns: (1.4fr, 1.5fr, 1.5fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Accounting Parameter]], [#text(weight: "bold", fill: white)[Trading Organization]], [#text(weight: "bold", fill: white)[Manufacturing Unit]], [#text(weight: "bold", fill: white)[Service Provider]],
  [Inventory Maintenance], [Mandatory (Finished Goods)], [Mandatory (Raw Materials, WIP, Finished)], [Not Required (Zero physical stock)],
  [Primary Invoice Mode], [Item Invoice (Ctrl+H)], [Item Invoice (Ctrl+H)], [Accounting Invoice (Ctrl+H)],
  [Core Voucher Trigger], [F9 Purchase -> F8 Sales], [Alt+F7 Mfg Journal -> F8 Sales], [F8 Sales (Accounting) -> F6 Receipt],
  [Statutory Coding], [HSN Codes (4 to 8 digits)], [HSN Codes on Raw & Finished Items], [SAC Codes (6 digits)],
  [Profit Determination], [Trading Account (Gross Profit)], [Manufacturing & Trading Accounts], [Directly Profit & Loss Account]
)

#v(6pt)

== 8.3 Corporate Case Studies from Rahul Sir's Field Curriculum
=== Case Study A: Unjha Mandi Agricultural Commodity Trading
- *Enterprise Profile:* *Maruti Agro Traders*, operating in the world-renowned agricultural commodity hub of Unjha Mandi (Patan/Mehsana district, Gujarat).
- *Operational Workflow:* The trader procures unbranded, unpackaged Jeera (Cumin Seeds) and Saunf (Fennel Seeds) in bulk gunny bags directly from local APMC farmers.
- *Accounting & Taxation Dynamics:*
  - Agricultural produce purchased directly from farmers is *exempt from GST (0% GST Slab)* under HSN 1209.
  - Vouchers: Inward Purchase recorded via *Purchase Exempted* voucher in Tally Prime.
  - When rebagged into 50-Kg commercial bags and sold to spices exporters in Mumbai, interstate billing is executed via *Interstate Exempted Sales* or *Taxable Invoices* if branded.

=== Case Study B: Morbi Ceramics Tile Manufacturing
- *Enterprise Profile:* *Ceramic Glaze Pvt. Ltd.*, Morbi, Gujarat (India's ceramic tile manufacturing capital).
- *Manufacturing Process:* The factory procures Raw Ball Clay, Feldspar Powder, and Chemical Pigments (Raw Materials), mixes them with water, presses them in hydraulic molds, glazes them, and bakes them in continuous gas kilns at 1200°C to produce finished Vitrified Tiles (600x600 mm).
- *Tally Prime Implementation:*
  - In F11 Features, *Bill of Materials (BOM)* is enabled.
  - A Stock Item named *Vitrified Tile 600x600* is created with a BOM specifying: For 1 Box (4 Tiles): Clay 18 Kg, Feldspar 4 Kg, Glaze 1.2 Kg, Power 2.5 Units.
  - When production occurs, the accountant records a *Manufacturing Journal (#key-pill("Alt + F7"))*. Tally automatically consumes raw material stocks and increases finished tile inventory!
  - Finished tiles attract *18% GST (CGST 9% + SGST 9%)* under HSN 6907.

=== Case Study C: RTechLab Digital & IANT IT Solutions
- *Enterprise Profile:* *RTechLab Solutions*, Palanpur, Gujarat.
- *Service Delivery:* Provides corporate enterprise IT consultancy, network cabling AMC (Annual Maintenance Contracts), and professional student training.
- *Tally Prime Implementation:*
  - No physical inventory tracking. All invoices are raised in *Accounting Invoice Mode (#key-pill("Ctrl + H"))*.
  - Under Section 194J, corporate clients deduct 10% TDS from invoices exceeding ₹30,000.
  - GST is billed under *SAC 998313* (Information Technology Consulting Services) at *18% GST*.

=== Case Study D: The 12-Month Corporate Operating Simulation
From Rahul Sir's 315-page *Professional Tally Prime* manual, every accountant must understand how monthly operations unfold across the fiscal year:
1. *Quarter 1 (April - June):* Company creation, opening balance entry, vendor purchase contracts, and advance customer billing.
2. *Quarter 2 (July - September):* Quarterly TDS return (Form 26Q for Q1 filed by July 31), half-yearly physical stock audit, and festive season inventory build-up.
3. *Quarter 3 (October - December):* Peak corporate sales, GSTR-1 & GSTR-3B monthly triangulations, and vendor payment settlements.
4. *Quarter 4 (January - March):* Advance tax installments, bad debt reviews, year-end depreciation provisions, Bank Reconciliation Statements (BRS), and Company Data Splitting on March 31st!

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 08 SUMMARY & KEY REVISION TAKEAWAYS]
    - Trading concerns buy and resell physical finished goods without alteration; utilize Item Invoice mode.
    - Manufacturing concerns convert raw materials into finished stock using *Bill of Materials (BOM)* and *Manufacturing Journal (Alt+F7)*.
    - Service providers bill intangible expertise without physical inventory using *Accounting Invoice mode (Ctrl+H)* and SAC codes.
    - Commodity traders (Unjha Mandi) frequently handle *0% Exempted GST* on raw agricultural grains and seeds.
    - Manufacturing units (Morbi Ceramics) track inventory conversion and component consumption through automated BOMs.
    - The annual corporate cycle requires disciplined compliance across all four quarters culminating in year-end audit closing.
  ]
)

#v(8pt)

// MCQS
== Topic 08: High-Yield Exam & Interview MCQs

1. *Which invoicing mode in Tally Prime is specifically designed for Service Providers who do not maintain physical inventory?*\\
   (A) Item Invoice Mode #h(10pt) (B) Accounting Invoice Mode #h(10pt) (C) Production Mode #h(10pt) (D) As Voucher Mode\\
   *Answer: (B)* | *Explanation:* Accounting Invoice Mode allows direct billing to ledger accounts without requiring stock items.

2. *What feature in Tally Prime defines the list and quantity of raw materials required to produce one unit of a finished product?*\\
   (A) Reorder Level #h(10pt) (B) Bill of Materials (BOM) #h(10pt) (C) Cost Category #h(10pt) (D) Batch Allocation\\
   *Answer: (B)* | *Explanation:* Bill of Materials (BOM) defines the exact recipe/components for manufactured finished goods.

3. *Which voucher is used by manufacturing factories (e.g., in Morbi) to record production from raw material to finished goods?*\\
   (A) Stock Journal with Manufacturing option (Alt + F7) #h(10pt) (B) Physical Stock (Ctrl + F7)\\
   (C) Purchase Voucher (F9) #h(10pt) (D) Delivery Note (Alt + F8)\\
   *Answer: (A)* | *Explanation:* Manufacturing Stock Journal converts raw material components into finished stock.

4. *What classification code is used on invoices for Services instead of HSN codes?*\\
   (A) TIN Code #h(10pt) (B) SAC (Services Accounting Code) #h(10pt) (C) IFSC Code #h(10pt) (D) NIC Code\\
   *Answer: (B)* | *Explanation:* Services Accounting Codes (SAC) are 6-digit codes used to categorize taxable services.

5. *Why are unbranded agricultural seeds traded in Unjha Mandi exempt from GST?*\\
   (A) Unjha is a tax-free union territory #h(10pt) (B) Agricultural produce at farm-gate level is classified under 0% Exempt slab\\
   (C) Tally does not support seeds #h(10pt) (D) Seeds are treated as services\\
   *Answer: (B)* | *Explanation:* Basic unprocessed agricultural seeds and staples carry a 0% GST statutory exemption.

6. *In a Trading business, what is the formula for calculating Gross Profit in the Trading Account?*\\
   (A) Sales - Net Profit #h(10pt) (B) Sales Revenue - Cost of Goods Sold (COGS)\\
   (C) Net Assets - Liabilities #h(10pt) (D) Cash Inflow - Cash Outflow\\
   *Answer: (B)* | *Explanation:* Gross Profit is the direct spread between sales revenue and the cost of goods sold.

7. *Which voucher category handles customer commitments prior to raising a sales invoice?*\\
   (A) Sales Order (Ctrl + F8) #h(10pt) (B) Delivery Note (Alt + F8) #h(10pt) (C) Memo Voucher #h(10pt) (D) F8 Sales\\
   *Answer: (A)* | *Explanation:* Sales Order (Ctrl+F8) records accepted customer purchase commitments.

8. *Which business sector is NOT required to maintain stock items, godowns, or units of measure in Tally Prime?*\\
   (A) Retail supermarkets #h(10pt) (B) Ceramic tile factories #h(10pt) (C) Chartered Accountancy & Legal firms #h(10pt) (D) Wholesale grain merchants\\
   *Answer: (C)* | *Explanation:* Professional consulting and legal firms provide services and do not hold physical stock.

9. *In manufacturing accounting, by-products and scrap materials generated during production are recorded on which side of the Manufacturing Journal?*\\
   (A) Left side (Source) #h(10pt) (B) Right side (By-products / Scrap) #h(10pt) (C) Narration only #h(10pt) (D) Balance Sheet\\
   *Answer: (B)* | *Explanation:* Tally's Manufacturing Journal provides a dedicated section on the right to value scrap output.

10. *Under the Indian financial calendar, in which quarter are year-end depreciation provisions and BRS closures mandatory?*\\
    (A) Quarter 1 (Apr-Jun) #h(10pt) (B) Quarter 2 (Jul-Sep) #h(10pt) (C) Quarter 3 (Oct-Dec) #h(10pt) (D) Quarter 4 (Jan-Mar)\\
    *Answer: (D)* | *Explanation:* Quarter 4 culminates on March 31st with statutory year-end audit adjustments and closures.

#v(6pt)

// VIVA & LAB
== Topic 08: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain how Bill of Materials (BOM) functions during production in Tally Prime.\\
  *Answer:* A BOM pre-defines the exact proportion of raw materials, packaging, and scrap required to manufacture one unit of finished stock. When an accountant enters the quantity of finished goods produced in a Manufacturing Journal, Tally automatically deducts the corresponding raw materials from stock and adds the finished goods.
- *Viva Q2:* How does an accountant toggle between Item Invoice and Accounting Invoice in Tally Prime?\\
  *Answer:* By opening the Sales (F8) or Purchase (F9) voucher and pressing #key-pill("Ctrl + H") (Change Mode), then selecting *Item Invoice* (for goods) or *Accounting Invoice* (for services).
- *Hands-On Lab Task:* In Tally Prime, create two stock items: *Jeera Seed 555 1Kg* with unit *Kgs* under Trading goods, and create a service ledger *Web Development Services* under *Direct Incomes* with SAC *998314*.
"""

    # =========================================================================
    # TOPIC 09
    # =========================================================================
    chapters[9] = """
= Topic 09: Practical Commercial Invoices (Item Mode vs Accounting Mode)

== 9.1 Invoicing Architecture & Statutory GST Rule 46
In corporate commerce, an *Invoice* is the legal tax document issued by a seller to a buyer establishing the obligation of payment and providing the legal proof required to claim *Input Tax Credit (ITC)* under Section 16 of the CGST Act.

Under *Rule 46 of the Central Goods and Services Tax Rules, 2017*, every Tax Invoice must contain the following 16 mandatory particulars:
1. Name, address, and GSTIN of the supplier.
2. A consecutive serial number (up to 16 characters) unique for a financial year.
3. Date of its issue.
4. Name, address, and GSTIN of the recipient (if registered).
5. Address of delivery and State Code (if recipient is un-registered and taxable value exceeds ₹50,000).
6. Harmonized System of Nomenclature (HSN) code for goods or Accounting Code (SAC) for services.
7. Description of goods or services.
8. Quantity in units and total value of supply.
9. Taxable value taking into account any discount or abatement.
10. Rate of tax (Central tax, State tax, Integrated tax, or cess).
11. Amount of tax charged in respect of taxable goods or services.
12. Place of supply along with the name of the State.
13. Signature or digital signature of the supplier or authorized representative.

Tally Prime provides three operational voucher modes, toggled instantly via #key-pill("Ctrl + H"):
1. *Item Invoice Mode:* Tailored for trading and manufacturing concerns. Displays columns for *Name of Item*, *Quantity*, *Rate*, *Per*, and *Amount*. Auto-calculates tax based on item GST rates.
2. *Accounting Invoice Mode:* Tailored for professional services, rent, consultancies, and contractors. Omits item and quantity columns; directly debits or credits ledger accounts with statutory SAC codes.
3. *As Voucher Mode:* Traditional double-entry Debit (*Dr.*) / Credit (*Cr.*) screen for non-inventory or non-tax adjustments.

#v(6pt)

== 9.2 Authentic Practical Commercial Invoices from Rahul Sir's Field Worksheets
The following five practical invoices represent authentic corporate transactions from Rahul Sir's training curriculum:

#v(4pt)

=== Invoice 01: Purchase Exempted (0% GST - Agricultural Goods)
#gst-tax-invoice-format(
  inv-no: "PUR-EX-01234",
  inv-date: "01-Apr-2025",
  seller-name: "KRISHI BEEJ BHANDAR",
  seller-gstin: "24ABCDE1234R1Z1",
  seller-address: "025, Near Small Building, Main Chowk, Palanpur - 385001",
  buyer-name: "RAVI PRIVATE LIMITED",
  buyer-gstin: "24AABCR1234A1Z5",
  buyer-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  items-rows: (
    [1], [JEERA SEED 555 1KG], [1209], [10 KGS], [230.00], [2,300.00], [0.00], [0.00], [2,300.00],
    [2], [TARAMIRA TMT OIL 1LTR], [1209], [05 LTR], [450.00], [2,250.00], [0.00], [0.00], [2,250.00]
  ),
  total-taxable: "4,550.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "0.00",
  grand-total: "4,550.00",
  in-words: "Rupees Four Thousand Five Hundred Fifty Only"
)

#v(6pt)

=== Invoice 02: Purchase GST (Intrastate 18% - Local Gujarat Supplier)
#gst-tax-invoice-format(
  inv-no: "BAYER-14582",
  inv-date: "02-Apr-2025",
  seller-name: "BAYER CROP SCIENCE LTD",
  seller-gstin: "24AABBC1478R1ZC",
  seller-address: "Near Main Bazar Chowk, Palanpur, Gujarat - 385001",
  buyer-name: "RAVI PRIVATE LIMITED",
  buyer-gstin: "24AABCR1234A1Z5",
  buyer-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  items-rows: (
    [1], [SURPASS 7007 CROP BIO-FEED], [3808], [15 PCS], [410.00], [6,150.00], [553.50], [553.50], [7,257.00],
    [2], [BIO-STIMULANT LIQUID 500ML], [3808], [08 PCS], [230.00], [1,840.00], [165.60], [165.60], [2,171.20]
  ),
  total-taxable: "7,990.00",
  cgst-amt: "719.10",
  sgst-amt: "719.10",
  igst-amt: "0.00",
  grand-total: "9,428.20",
  in-words: "Rupees Nine Thousand Four Hundred Twenty-Eight and Twenty Paise Only"
)

#v(6pt)

=== Invoice 03: Purchase Interstate IGST (18% - Maharashtra to Gujarat)
#gst-tax-invoice-format(
  inv-no: "TECH-MH-08858",
  inv-date: "01-May-2025",
  seller-name: "TECHWORLD EQUIPMENT PVT LTD",
  seller-gstin: "27AABCT9988M1Z2",
  seller-address: "Plot 45, MIDC Industrial Area, Andheri East, Mumbai - 400093",
  buyer-name: "RAVI PRIVATE LIMITED",
  buyer-gstin: "24AABCR1234A1Z5",
  buyer-address: "Near Ambaji Mandir, Main Chowk, Palanpur, Gujarat - 385001",
  items-rows: (
    [1], [SAMSUNG LCD MONITOR 21-INCH], [8471], [08 PCS], [4,000.00], [32,000.00], [-], [-], [37,760.00],
    [2], [LOGITECH WIRELESS COMBO MK240], [8471], [10 SETS], [1,200.00], [12,000.00], [-], [-], [14,160.00]
  ),
  total-taxable: "44,000.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "7,920.00",
  grand-total: "51,920.00",
  in-words: "Rupees Fifty-One Thousand Nine Hundred Twenty Only"
)

#v(6pt)

=== Invoice 04: Sales GST Tax Invoice (B2B Intrastate Supply)
#gst-tax-invoice-format(
  inv-no: "RTL-SALES-001",
  inv-date: "02-May-2025",
  seller-name: "RAVI PRIVATE LIMITED",
  seller-gstin: "24AABCR1234A1Z5",
  seller-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  buyer-name: "SHIVAM TRADERS",
  buyer-gstin: "24ABCDS9876Q1Z9",
  buyer-address: "Station Road, Commercial Complex, Palanpur - 385001",
  items-rows: (
    [1], [SURPASS 7007 CROP BIO-FEED], [3808], [10 PCS], [520.00], [5,200.00], [468.00], [468.00], [6,136.00],
    [2], [SAMSUNG LCD MONITOR 21-INCH], [8471], [04 PCS], [4,800.00], [19,200.00], [1,728.00], [1,728.00], [22,656.00]
  ),
  total-taxable: "24,400.00",
  cgst-amt: "2,196.00",
  sgst-amt: "2,196.00",
  igst-amt: "0.00",
  grand-total: "28,792.00",
  in-words: "Rupees Twenty-Eight Thousand Seven Hundred Ninety-Two Only"
)

#v(6pt)

=== Invoice 05: Sales Interstate IGST Invoice (B2B Export to Rajasthan)
#gst-tax-invoice-format(
  inv-no: "RTL-INTER-002",
  inv-date: "15-May-2025",
  seller-name: "RAVI PRIVATE LIMITED",
  seller-gstin: "24AABCR1234A1Z5",
  seller-address: "Near Ambaji Mandir, Main Chowk, Palanpur, Gujarat - 385001",
  buyer-name: "MARWAR AGRO CHEMICALS",
  buyer-gstin: "08AABCM5544K1Z3",
  buyer-address: "Industrial Area, Phase 2, Abu Road, Rajasthan - 307026",
  items-rows: (
    [1], [SURPASS 7007 CROP BIO-FEED], [3808], [25 PCS], [520.00], [13,000.00], [-], [-], [15,340.00],
    [2], [BIO-STIMULANT LIQUID 500ML], [3808], [20 PCS], [310.00], [6,200.00], [-], [-], [7,316.00]
  ),
  total-taxable: "19,200.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "3,456.00",
  grand-total: "22,656.00",
  in-words: "Rupees Twenty-Two Thousand Six Hundred Fifty-Six Only"
)

#v(6pt)

== 9.3 Step-by-Step Practical Data Entry in Tally Prime
To record a Tax Invoice with auto-calculating GST in Tally Prime:
1. Navigate to Gateway of Tally > *Vouchers* > press #key-pill("F9") for Purchase or #key-pill("F8") for Sales.
2. If the screen is not in Item Invoice mode, press #key-pill("Ctrl + H") and select *Item Invoice*.
3. *Supplier Invoice No & Date:* Enter vendor's original printed invoice number (e.g., `BAYER-14582`) and bill date.
4. *Party A/c Name:* Select the vendor (e.g., `Bayer Crop Science Ltd`). Press Enter to review dispatch and GST details.
5. *Purchase / Sales Ledger:* Select *Purchase GST @ 18%* (or appropriate statutory tax classification).
6. *Name of Item Table:* Select the stock item (e.g., `Surpass 7007`), enter Quantity (`15 PCS`), and Rate (`410.00`). Amount auto-populates as `₹6,150.00`.
7. Press Enter past the last item to move to the bottom Tax Ledgers section.
8. *Tax Ledgers:* Select *Input CGST* (Tally automatically calculates 9% = `₹553.50`) and select *Input SGST* (auto-calculates 9% = `₹553.50`).
9. *Bill-wise Details:* Select *New Ref* > accept the invoice number.
10. *Narration:* Type `Being goods purchased from Bayer Crop Science Ltd vide Invoice 14582`. Press #key-pill("Ctrl + A") to accept.

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 09 SUMMARY & KEY REVISION TAKEAWAYS]
    - An Invoice is the statutory tax instrument required under Section 31 of the CGST Act to validate Input Tax Credit (ITC).
    - Rule 46 prescribes 16 mandatory invoice particulars including consecutive serial numbers, GSTIN, and HSN codes.
    - Three modes: Item Invoice (goods with quantities), Accounting Invoice (services/SAC codes), As Voucher (Dr/Cr).
    - Toggle modes instantaneously with #key-pill("Ctrl + H") (Change Mode).
    - Intrastate invoices calculate *CGST + SGST* (50:50); Interstate invoices calculate *IGST* (full rate).
    - Tally Prime auto-calculates tax when ledgers are correctly grouped under *Duties & Taxes* with defined GST rates.
  ]
)

#v(8pt)

// MCQS
== Topic 09: High-Yield Exam & Interview MCQs

1. *Which keyboard shortcut changes the voucher mode between Item Invoice and Accounting Invoice?*\\
   (A) Alt + V #h(10pt) (B) Ctrl + H #h(10pt) (C) F12 #h(10pt) (D) Alt + H\\
   *Answer: (B)* | *Explanation:* Ctrl+H opens the Change Voucher Mode menu in Tally Prime.

2. *Under which section of the CGST Act, 2017 is a registered taxpayer required to issue a Tax Invoice?*\\
   (A) Section 10 #h(10pt) (B) Section 16 #h(10pt) (C) Section 31 #h(10pt) (D) Section 54\\
   *Answer: (C)* | *Explanation:* Section 31 of the CGST Act mandates the issuance of a formal Tax Invoice.

3. *In an Interstate Purchase invoice from Maharashtra (Code 27) to Gujarat (Code 24), which tax ledger must be selected?*\\
   (A) Input CGST #h(10pt) (B) Input SGST #h(10pt) (C) Input IGST #h(10pt) (D) UTGST\\
   *Answer: (C)* | *Explanation:* Interstate transactions between two different states attract Integrated GST (IGST).

4. *What happens if an accountant selects Output CGST on an interstate sales invoice in Tally Prime?*\\
   (A) Tally displays an error and closes #h(10pt) (B) The tax amount will calculate as ₹0.00 (mismatch warning)\\
   (C) Tally converts the customer to local #h(10pt) (D) No impact\\
   *Answer: (B)* | *Explanation:* Tally's statutory validation engine auto-checks state codes and leaves local tax as zero.

5. *What reference type should be selected in Bill-wise Details when recording a fresh purchase or sales invoice?*\\
   (A) Agst Ref #h(10pt) (B) New Ref #h(10pt) (C) Advance #h(10pt) (D) On Account\\
   *Answer: (B)* | *Explanation:* New Ref is chosen to assign a unique tracking number to a fresh invoice.

6. *Which document is issued by a registered taxpayer when selling 0% GST exempted agricultural goods?*\\
   (A) Tax Invoice #h(10pt) (B) Bill of Supply #h(10pt) (C) Delivery Challan #h(10pt) (D) Debit Note\\
   *Answer: (B)* | *Explanation:* Under GST law, a Bill of Supply is issued for exempted supplies instead of a Tax Invoice.

7. *What key is pressed during invoice entry to create a missing stock item or ledger on the fly without exiting?*\\
   (A) Alt + C #h(10pt) (B) Ctrl + C #h(10pt) (C) F4 #h(10pt) (D) Alt + M\\
   *Answer: (A)* | *Explanation:* Alt+C triggers instant secondary master creation from any input field.

8. *What is the maximum number of digits in an international standard HSN code for goods export/import?*\\
   (A) 4 #h(10pt) (B) 6 #h(10pt) (C) 8 #h(10pt) (D) 10\\
   *Answer: (C)* | *Explanation:* 8-digit HSN codes are standard for detailed statutory classification and international trade.

9. *Under CGST Rule 46, what is the maximum character length permitted for an invoice serial number?*\\
   (A) 10 characters #h(10pt) (B) 16 characters #h(10pt) (C) 20 characters #h(10pt) (D) Unlimited\\
   *Answer: (B)* | *Explanation:* CGST rules mandate invoice serial numbers cannot exceed 16 alphanumeric characters.

10. *When billing a buyer in Rajasthan (State Code 08) from Palanpur (State Code 24), what tax rate applies if product GST is 18%?*\\
    (A) CGST 9% + SGST 9% #h(10pt) (B) IGST 18% #h(10pt) (C) UTGST 18% #h(10pt) (D) Zero tax\\
    *Answer: (B)* | *Explanation:* Interstate supplies attract full integrated tax (IGST 18%).

#v(6pt)

// VIVA & LAB
== Topic 09: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Why does Tally Prime fail to auto-calculate GST tax amounts on an invoice?\\
  *Answer:* Common causes include: (1) Party state code is mismatched (e.g., interstate party with local CGST ledger); (2) GST rate not specified in item or ledger master; (3) Tax ledgers not grouped under *Duties & Taxes*; (4) Voucher date is earlier than GST statutory applicability date.
- *Viva Q2:* What is the purpose of Bill-wise Details (New Ref, Agst Ref, Advance, On Account)?\\
  *Answer:* Bill-wise details allow tracking outstanding receivables and payables on an invoice-by-invoice basis, enabling aged debtor analysis and accurate settlement tracking.
- *Hands-On Lab Task:* Open Tally Prime, record Invoice 02 (Bayer Crop Science Ltd) in F9 Purchase, ensure CGST (₹719.10) and SGST (₹719.10) auto-calculate, and verify the resulting ledger balance in *Display > Account Books > Ledger*.
"""

    # =========================================================================
    # TOPIC 10
    # =========================================================================
    chapters[10] = """
= Topic 10: 40+ Master Keyboard Shortcuts & Speed Drills

== 10.1 The Philosophy of Keyboard-Driven Productivity in Tally
A hallmark of an elite corporate accountant is keyboard speed. Tally Prime was architected with a fundamental design philosophy: *an accountant should never need to lift their hands from the keyboard to touch a mouse!* 

Every menu item, button, action, and report in Tally Prime is accessible through designated single keystrokes, function keys, or combinations with #key-pill("Alt") or #key-pill("Ctrl"). Mastering these shortcuts separates beginner data entry clerks from senior accounts executives who can process hundreds of invoices per hour.

#v(6pt)

== 10.2 Categorized 45+ Master Corporate Shortcut Reference Table
#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Category]], [#text(weight: "bold", fill: white)[Shortcut Key]], [#text(weight: "bold", fill: white)[Operational Function & Context]],
  [Universal Navigation], [#key-pill("Alt + G")], [Open 'Go To' search bar to access any report without closing active screen.],
  [Universal Navigation], [#key-pill("Esc")], [Go back to previous screen, cancel action, or exit report.],
  [Universal Navigation], [#key-pill("Enter")], [Select highlighted menu item, advance cursor to next input field.],
  [Universal Navigation], [#key-pill("Alt + F1 / Alt + F5")], [Toggle between Detailed (showing line items/sub-groups) and Condensed report views.],
  [Master Operations], [#key-pill("Alt + C")], [Create a new Ledger, Stock Item, or Unit on-the-fly directly from any voucher field.],
  [Master Operations], [#key-pill("Ctrl + Enter")], [Alter or edit the highlighted Master ledger or stock item directly from a report or voucher.],
  [Master Operations], [#key-pill("Alt + D")], [Permanently delete a voucher, ledger, stock item, or company (inside Alteration screen).],
  [Master Operations], [#key-pill("Ctrl + A")], [Instantly accept and save a voucher, ledger, or report configuration without pressing Enter repeatedly.],
  [Voucher Navigation], [#key-pill("F2")], [Change the active voucher transaction date.],
  [Voucher Navigation], [#key-pill("Alt + F2")], [Change the financial reporting period (From Date to To Date).],
  [Voucher Navigation], [#key-pill("F3")], [Switch between open companies, or select/load a different company.],
  [Voucher Navigation], [#key-pill("Ctrl + F3")], [Shut or close an open company.],
  [Accounting Vouchers], [#key-pill("F4")], [Contra Voucher (Cash to Bank, Bank to Cash, Bank to Bank transfers).],
  [Accounting Vouchers], [#key-pill("F5")], [Payment Voucher (Disbursing cash or bank funds for expenses/creditors).],
  [Accounting Vouchers], [#key-pill("F6")], [Receipt Voucher (Receiving cash or bank funds from customers/incomes).],
  [Accounting Vouchers], [#key-pill("F7")], [Journal Voucher (Purely non-cash adjustments, depreciation, bad debts, TDS).],
  [Accounting Vouchers], [#key-pill("F8")], [Sales Voucher (Tax invoice billing to customers).],
  [Accounting Vouchers], [#key-pill("F9")], [Purchase Voucher (Inward billing from suppliers/vendors).],
  [Accounting Vouchers], [#key-pill("F10")], [Other Vouchers list (Access inactive, payroll, and memorandum vouchers).],
  [Special Vouchers], [#key-pill("Alt + F5")], [Debit Note Voucher (Purchase returns / rate reductions from suppliers).],
  [Special Vouchers], [#key-pill("Alt + F6")], [Credit Note Voucher (Sales returns / discounts allowed to customers).],
  [Order Vouchers], [#key-pill("Ctrl + F8")], [Sales Order Voucher (Accepting formal customer purchase order).],
  [Order Vouchers], [#key-pill("Ctrl + F9")], [Purchase Order Voucher (Placing formal purchase order on supplier).],
  [Order Vouchers], [#key-pill("Alt + F8")], [Delivery Note (Goods delivery challan dispatched before sales invoice).],
  [Order Vouchers], [#key-pill("Alt + F9")], [Receipt Note (Goods receipt note GRN received before purchase invoice).],
  [Inventory Vouchers], [#key-pill("Alt + F7")], [Stock Journal (Inter-godown transfer of goods / Manufacturing assembly).],
  [Inventory Vouchers], [#key-pill("Ctrl + F7")], [Physical Stock (Recording audit stock counts to adjust book discrepancies).],
  [Mode & Layout], [#key-pill("Ctrl + H")], [Change Voucher Mode (Toggle between Item Invoice, Accounting Invoice, and As Voucher).],
  [Mode & Layout], [#key-pill("F12")], [Configure screen-specific layout, bill-wise rules, and statutory invoice options.],
  [Mode & Layout], [#key-pill("F11")], [Company Features (Enable/disable Accounting, Inventory, and GST/TDS taxation).],
  [Reporting & Audit], [#key-pill("Alt + P")], [Print active invoice, cheque, voucher, or financial report.],
  [Reporting & Audit], [#key-pill("Ctrl + P")], [Quick print current screen using default system printer settings.],
  [Reporting & Audit], [#key-pill("Alt + E")], [Export report or invoice to PDF, Excel (XLSX), XML, HTML, or CSV formats.],
  [Reporting & Audit], [#key-pill("Alt + M")], [Email invoice or outstanding statement directly via corporate SMTP email.],
  [Reporting & Audit], [#key-pill("Alt + F12")], [Apply advanced Range / Value filters on reports (e.g., vouchers > ₹1,00,000).],
  [Reporting & Audit], [#key-pill("Spacebar")], [Select or unselect an individual voucher line in reports for batch actions.],
  [Reporting & Audit], [#key-pill("Ctrl + Spacebar")], [Select all lines or unselect all lines in a report table.],
  [Reporting & Audit], [#key-pill("Shift + Enter")], [Drill down into a report item or expand a sub-group inline without opening a new window.],
  [Utility Operations], [#key-pill("Ctrl + N")], [Toggle the built-in mathematical calculator pane at the bottom of the screen.],
  [Data & Exchange], [#key-pill("Alt + Y")], [Data Menu (Backup, Restore, Split Data, Data Paths).],
  [Data & Exchange], [#key-pill("Alt + Z")], [Exchange Menu (Data synchronization with remote branch godowns).],
  [Advanced Shortcuts], [#key-pill("Ctrl + Alt + R")], [Rewrite or repair damaged company database records.],
  [Advanced Shortcuts], [#key-pill("Alt + W")], [Material Out voucher in Job Work workflows.],
  [Advanced Shortcuts], [#key-pill("Ctrl + W")], [Material In voucher in Job Work workflows.]
)

#v(6pt)

== 10.3 The 25-Scenario Rapid Keyboard Speed Drill
Test your corporate reaction speed by identifying the precise keystroke combination required for each scenario:

#table(
  columns: (0.4fr, 3fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Commercial Accounting Scenario]], [#text(weight: "bold", fill: white)[Required Keystroke]],
  [01], [You are entering a sales invoice and need to create a new customer ledger immediately], [#key-pill("Alt + C")],
  [02], [You need to switch an F8 Sales voucher from Item mode to Service/Accounting mode], [#key-pill("Ctrl + H")],
  [03], [You are on the Balance Sheet and want to see the detailed breakdown of all sub-groups], [#key-pill("Alt + F1") or #key-pill("Alt + F5")],
  [04], [You made an error in customer address and want to alter the master from inside an invoice], [#key-pill("Ctrl + Enter")],
  [05], [You want to save a 15-item invoice immediately without pressing Enter 30 times], [#key-pill("Ctrl + A")],
  [06], [You are entering a purchase bill and need to calculate `₹4,550 * 18%`], [#key-pill("Ctrl + N") (Calculator)],
  [07], [You want to change the voucher date from 01-Apr-2025 to 02-Apr-2025], [#key-pill("F2")],
  [08], [You want to change the entire financial reporting period from April 2025 to March 2026], [#key-pill("Alt + F2")],
  [09], [In the middle of a purchase bill, your manager asks for the current Bank balance], [#key-pill("Alt + G > Cash/Bank")],
  [10], [You recorded a duplicate payment voucher and need to delete it permanently], [#key-pill("Alt + D")],
  [11], [You received damaged goods back from a client against a sales bill], [#key-pill("Alt + F6") (Credit Note)],
  [12], [You returned defective materials back to a supplier], [#key-pill("Alt + F5") (Debit Note)],
  [13], [You want to transfer funds from Current Account to Bank Overdraft (OD) account], [#key-pill("F4") (Contra)],
  [14], [You want to export the Trial Balance directly into Microsoft Excel for an auditor], [#key-pill("Alt + E")],
  [15], [You want to print an official GST Tax Invoice with customized header settings], [#key-pill("Alt + P")],
  [16], [You want to enable GST taxation features in a newly created company], [#key-pill("F11 > Taxation")],
  [17], [You want to select multiple specific vouchers in Day Book for batch printing], [#key-pill("Spacebar")],
  [18], [You want to select ALL lines in a report table simultaneously], [#key-pill("Ctrl + Spacebar")],
  [19], [You want to close an open company to prevent unauthorized staff access], [#key-pill("Ctrl + F3")],
  [20], [You want to create a full offline data backup to an external USB hard drive], [#key-pill("Alt + Y > Backup")],
  [21], [You want to expand an individual group inline without opening a new page], [#key-pill("Shift + Enter")],
  [22], [You want to apply a filter in Day Book for vouchers exceeding ₹50,000], [#key-pill("Alt + F12")],
  [23], [You want to configure column display options on the active screen], [#key-pill("F12")],
  [24], [You want to quick-print the current report directly without preview], [#key-pill("Ctrl + P")],
  [25], [You want to open the complete list of all 24 voucher types], [#key-pill("F10")]
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
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 10 SUMMARY & KEY REVISION TAKEAWAYS]
    - Corporate accounting mastery requires pure keyboard speed without relying on the mouse.
    - Essential creation/edit: #key-pill("Alt+C") (create master on the fly), #key-pill("Ctrl+Enter") (alter active master), #key-pill("Alt+D") (delete), #key-pill("Ctrl+A") (instant accept).
    - Vouchers: #key-pill("F4") Contra, #key-pill("F5") Payment, #key-pill("F6") Receipt, #key-pill("F7") Journal, #key-pill("F8") Sales, #key-pill("F9") Purchase, #key-pill("Alt+F5") Debit Note, #key-pill("Alt+F6") Credit Note.
    - Navigation: #key-pill("Alt+G") Go To, #key-pill("Ctrl+H") Change Mode, #key-pill("Alt+F1") Detailed View, #key-pill("Ctrl+N") Calculator.
    - Output: #key-pill("Alt+P") Print, #key-pill("Alt+E") Export, #key-pill("Alt+M") Email.
  ]
)

#v(8pt)

// MCQS
== Topic 10: High-Yield Exam & Interview MCQs

1. *Which shortcut key creates a new ledger or stock item directly from within a voucher screen?*\\
   (A) Ctrl + C #h(10pt) (B) Alt + C #h(10pt) (C) Shift + C #h(10pt) (D) F10\\
   *Answer: (B)* | *Explanation:* Alt+C triggers instant on-the-fly master creation from any input field.

2. *Which shortcut instantly accepts and saves any voucher or screen without pressing Enter multiple times?*\\
   (A) Ctrl + S #h(10pt) (B) Ctrl + A #h(10pt) (C) Alt + S #h(10pt) (D) Alt + A\\
   *Answer: (B)* | *Explanation:* Ctrl+A immediately accepts and commits the current master or voucher.

3. *Which key toggles the mathematical calculator pane at the bottom of the screen?*\\
   (A) Alt + C #h(10pt) (B) Ctrl + N #h(10pt) (C) Ctrl + M #h(10pt) (D) F12\\
   *Answer: (B)* | *Explanation:* Ctrl+N activates the built-in mathematical calculation calculator.

4. *What is the shortcut to alter a highlighted ledger master directly from a report?*\\
   (A) Alt + Enter #h(10pt) (B) Ctrl + Enter #h(10pt) (C) Shift + Enter #h(10pt) (D) F4\\
   *Answer: (B)* | *Explanation:* Ctrl+Enter opens the Master Alteration screen for the highlighted entity.

5. *Which shortcut is used to shut or close an active company in Tally Prime?*\\
   (A) Alt + F1 #h(10pt) (B) Ctrl + F3 #h(10pt) (C) Alt + F4 #h(10pt) (D) Esc\\
   *Answer: (B)* | *Explanation:* Ctrl+F3 shuts an open company; F3 switches or selects open companies.

6. *Which shortcut toggles a report between Detailed and Condensed view?*\\
   (A) Alt + F1 or Alt + F5 #h(10pt) (B) Ctrl + D #h(10pt) (C) F12 #h(10pt) (D) Alt + V\\
   *Answer: (A)* | *Explanation:* Alt+F1 (or Alt+F5) toggles hierarchical expansion of sub-ledgers.

7. *What key is used to select or unselect a single voucher row in a table for batch operations?*\\
   (A) Enter #h(10pt) (B) Spacebar #h(10pt) (C) Tab #h(10pt) (D) Shift\\
   *Answer: (B)* | *Explanation:* Spacebar selects/unselects individual rows; Ctrl+Spacebar selects all rows.

8. *Which shortcut key changes the financial reporting period from Date to Date?*\\
   (A) F2 #h(10pt) (B) Alt + F2 #h(10pt) (C) Ctrl + F2 #h(10pt) (D) Shift + F2\\
   *Answer: (B)* | *Explanation:* F2 changes transaction date; Alt+F2 changes the reporting period interval.

9. *Which key combination expands or collapses a ledger group inline without opening a new drill-down window?*\\
   (A) Alt + Enter #h(10pt) (B) Shift + Enter #h(10pt) (C) Ctrl + Enter #h(10pt) (D) Spacebar\\
   *Answer: (B)* | *Explanation:* Shift+Enter expands the sub-accounts of a highlighted group inline on the current report.

10. *Which shortcut applies advanced Range and Value filters on reports (e.g. filtering vouchers > ₹1,00,000)?*\\
    (A) Alt + F12 #h(10pt) (B) Ctrl + F12 #h(10pt) (C) F12 #h(10pt) (D) Alt + F2\\
    *Answer: (A)* | *Explanation:* Alt+F12 opens the comprehensive multi-condition Range/Filter dialogue.

#v(6pt)

// VIVA & LAB
== Topic 10: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Describe the workflow of Alt+C versus Ctrl+Enter during invoice data entry.\\
  *Answer:* Alt+C is used to create a *brand new* ledger or item when it does not yet exist. Ctrl+Enter is used to *modify or edit* an existing ledger or item (e.g., updating GSTIN or address) without abandoning the voucher.
- *Viva Q2:* Why is Ctrl+A considered the most valuable speed shortcut in corporate accounting?\\
  *Answer:* Because entering a 20-item invoice or complex voucher requires advancing past hundreds of fields (taxes, discounts, narrations). Ctrl+A saves the entire voucher in a single keystroke from any point.
- *Hands-On Lab Task:* Open Tally Prime, go to Gateway of Tally, enter *Day Book*, press #key-pill("Spacebar") to select three vouchers, press #key-pill("Alt + P") to verify batch printing options, and press #key-pill("Esc") to return.
"""

    # =========================================================================
    # TOPIC 11
    # =========================================================================
    chapters[11] = """
= Topic 11: Corporate Bridge Highlights (BRS, Cost Centres, Data Splitting & GST Returns)

== 11.1 Bank Reconciliation Statement (BRS)
In commercial corporate enterprise, the bank balance shown in the company's internal *Cash Book (Bank Ledger)* rarely matches the actual balance reflected on the *Bank Passbook / Bank Statement* on any given day. 

A *Bank Reconciliation Statement (BRS)* is an auditable monthly statement prepared to identify, explain, and reconcile every divergence between the two balances.

=== Common Causes of Reconciliation Discrepancies
1. *Cheques Issued but Not Yet Presented for Payment:* The accountant debited the vendor and credited the bank upon issuing a cheque, but the vendor has not yet deposited it in their bank.
2. *Cheques Deposited but Not Yet Cleared:* The accountant recorded customer cheque receipts and debited the bank, but the clearing house has not yet credited the funds.
3. *Direct Debits by Bank:* Bank annual account maintenance charges, SMS alerts, ECS loan EMIs, or cheque return charges debited by the bank without prior physical notice.
4. *Direct Credits into Bank:* Customer NEFT/RTGS payments, direct interest earned, or dividend income deposited directly into the bank account.

#v(6pt)

=== Authentic Corporate Cheque Format
The following visual illustrates an authentic CTS-2010 corporate cheque issued by Ravi Private Limited:

#v(4pt)

#cheque-format(
  payee: "Krishi Beej Bhandar",
  amount-words: "Rupees Two Lakh Only",
  amount-num: "2,00,000.00",
  date-str: "0 1 0 4 2 0 2 5",
  bank-name: "HDFC BANK LIMITED",
  branch: "Palanpur Main Branch, Gujarat · IFSC: HDFC0001234",
  ac-no: "50100458921478",
  chq-no: "145821",
  company-name: "RAVI PRIVATE LIMITED"
)

#v(6pt)

=== Authentic Corporate Bank Statement
The corresponding bank statement issued by HDFC Bank illustrates the actual clearance dates:

#v(4pt)

#bank-statement-format(
  account-holder: "RAVI PRIVATE LIMITED",
  bank-name: "HDFC BANK LIMITED",
  account-no: "50100458921478",
  period: "01-Apr-2025 to 30-Apr-2025",
  rows: (
    [01-Apr-2025], [Opening Balance], [-], [-], [-], [1,50,000.00],
    [02-Apr-2025], [Cash Deposit - Sales Realization], [CHQ/5521], [-], [45,000.00], [1,95,000.00],
    [05-Apr-2025], [Cheque Clearing - Krishi Beej Bhandar], [145821], [2,00,000.00], [-], [-5,000.00 (OD)],
    [10-Apr-2025], [NEFT Inward - MediaLive Productions], [N102458], [-], [50,000.00], [45,000.00],
    [15-Apr-2025], [HDFC Bank Service & SMS Charges], [CHG/8812], [590.00], [-], [44,410.00],
    [28-Apr-2025], [Cheque Clearing - Office Rent], [145822], [15,000.00], [-], [29,410.00],
    [30-Apr-2025], [Quarterly Savings Interest Credit], [INT/3312], [-], [1,250.00], [30,660.00]
  )
)

#v(6pt)

=== Executing Auto-BRS in Tally Prime
Tally Prime features native *Electronic Bank Reconciliation (Auto-BRS)*:
1. From Banking menu, select *Bank Reconciliation* > select *HDFC Bank*.
2. Press #key-pill("Alt + O") (Import) > *Bank Statement* > select downloaded CSV/Excel bank file.
3. Tally automatically matches cheque numbers and amounts, entering the *Bank Date* automatically!
4. Unmatched items remain displayed, showing the exact reconciliation difference to the rupee.

#v(6pt)

== 11.2 Cost Centres & Cost Categories
Corporate enterprises operating multiple regional branches or business divisions must track revenues and expenses by departmental segments without creating hundreds of redundant ledger accounts.

- *Cost Category:* The broad organizational dimension (e.g., *Regional Branches*, *Sales Executives*, *Marketing Campaigns*).
- *Cost Centre:* The specific sub-unit under that category (e.g., under Branches: *Palanpur Branch*, *Ahmedabad Branch*, *Surat Branch*).
- *Practical Operation:* When recording an F5 Payment for Staff Salaries of ₹1,00,000, Tally prompts the operator to allocate the expense: Palanpur Branch ₹40,000, Ahmedabad Branch ₹35,000, Surat Branch ₹25,000. Financial P&L shows one Salary account, but Cost Centre reports reveal exact branch profitability!

#v(6pt)

== 11.3 Company Data Splitting (Financial Year-End Procedure)
At the conclusion of the statutory financial year (31st March), enterprise databases accumulate tens of thousands of vouchers, causing system slowdowns. Tally Prime provides *Split Company Data* via #key-pill("Alt + Y > Split"):
- *Splitting Mechanism:* Divides one multi-year database into two independent corporate companies (e.g., FY 2024-25 and FY 2025-26).
- *Data Integrity:* The closing balances of all ledgers and stock items on March 31st are automatically transformed into the opening balances of the new company on April 1st.
- *Verification Step:* Prior to splitting, run *Verify Data* to ensure zero unadjusted vouchers or ledger corruption exists.

#v(6pt)

== 11.4 Statutory GST Returns & Portal Reconciliation Workflow
A corporate accountant must manage three primary statutory returns on the GST Common Portal (#link("https://gst.gov.in")[gst.gov.in]):

#table(
  columns: (1.1fr, 1.3fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[GST Return]], [#text(weight: "bold", fill: white)[Filing Frequency]], [#text(weight: "bold", fill: white)[Statutory Purpose & Tally Prime Integration]],
  [GSTR-1], [Monthly (11th) / QRMP (13th)], [Statement of Outward Supplies (All B2B sales, B2C sales, exports, HSN summary). Exported directly from Tally Prime as a JSON payload for 1-click portal upload.],
  [GSTR-3B], [Monthly (20th of next month)], [Self-declared summary return of total sales, eligible Input Tax Credit (ITC), and net cash tax liability. Generated automatically from Tally Prime's GST Triangulation report.],
  [GSTR-2B], [Auto-generated (14th monthly)], [Static auto-drafted ITC statement generated by the portal based on suppliers' filed GSTR-1 returns. Reconciled in Tally Prime to identify defaulting vendors and prevent ITC loss.]
)

#v(6pt)

=== The Crucial Section 16(2)(aa) Statutory Rule
Under the CGST Act amendment to Section 16(2)(aa), a registered business is strictly *prohibited from claiming Input Tax Credit (ITC)* unless the vendor has actually uploaded the invoice in their GSTR-1 and the credit is reflected in the buyer's *GSTR-2B*. Reconciling purchase bills against GSTR-2B in Tally Prime protects corporations from severe interest penalties and disallowances!

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 11 SUMMARY & KEY REVISION TAKEAWAYS]
    - BRS reconciles the company's internal Cash Book bank balance with the actual Bank Statement.
    - Timing differences arise from unpresented cheques, uncleared deposits, direct bank charges, and interest.
    - Cost Centres and Cost Categories enable branch-wise and departmental profitability tracking without ledger clutter.
    - Split Company Data (#key-pill("Alt + Y > Split")) divides historical databases at year-end while rolling balances forward.
    - GST compliance requires filing *GSTR-1* (Sales), *GSTR-3B* (Monthly Summary & Tax Payment), and reconciling against *GSTR-2B* (Auto-drafted ITC).
    - Section 16(2)(aa) legally mandates that ITC can only be claimed if reflected in GSTR-2B.
  ]
)

#v(8pt)

// MCQS
== Topic 11: High-Yield Exam & Interview MCQs

1. *What is the primary objective of preparing a Bank Reconciliation Statement (BRS)?*\\
   (A) Calculate corporate income tax #h(10pt) (B) Reconcile differences between Cash Book bank balance and Bank Statement balance\\
   (C) Issue new cheques #h(10pt) (D) Close the company bank account\\
   *Answer: (B)* | *Explanation:* BRS identifies and explains timing and transaction variances between bank books and bank statements.

2. *If a cheque issued to a vendor is not yet presented at the bank, what is the effect on the Cash Book relative to the Passbook?*\\
   (A) Cash Book balance is lower than Passbook balance #h(10pt) (B) Cash Book balance is higher than Passbook balance\\
   (C) Both balances are identical #h(10pt) (D) Bank account gets locked\\
   *Answer: (A)* | *Explanation:* Cash Book immediately credits bank upon issuance; Passbook deducts only upon presentation.

3. *Which top-menu shortcut accesses Company Data Splitting at financial year end?*\\
   (A) Alt + K #h(10pt) (B) Alt + Y #h(10pt) (C) Alt + Z #h(10pt) (D) Ctrl + S\\
   *Answer: (B)* | *Explanation:* Alt+Y opens the Data Menu containing the Split Company Data feature.

4. *What feature allows an enterprise to track expenses across different branches (e.g., Palanpur vs Ahmedabad) without creating duplicate ledgers?*\\
   (A) Multi-Currency #h(10pt) (B) Cost Centres & Cost Categories #h(10pt) (C) Price Lists #h(10pt) (D) Tally Vault\\
   *Answer: (B)* | *Explanation:* Cost Centres allocate revenues and costs to specific business units or branches.

5. *Which GST return is an auto-drafted, static Input Tax Credit (ITC) statement generated on the 14th of each month?*\\
   (A) GSTR-1 #h(10pt) (B) GSTR-3B #h(10pt) (C) GSTR-2B #h(10pt) (D) Form 26Q\\
   *Answer: (C)* | *Explanation:* GSTR-2B is the official static monthly ITC statement generated by the GST portal.

6. *What is the standard monthly filing due date for GSTR-1 (Outward Supplies) for regular taxpayers?*\\
   (A) 7th of next month #h(10pt) (B) 11th of next month #h(10pt) (C) 20th of next month #h(10pt) (D) Last day of month\\
   *Answer: (B)* | *Explanation:* Regular monthly taxpayers must file outward sales in GSTR-1 by the 11th of the following month.

7. *What file format does Tally Prime export for direct 1-click JSON upload to the GST Offline Tool / Portal?*\\
   (A) DOCX #h(10pt) (B) JSON / Excel #h(10pt) (C) MP3 #h(10pt) (D) PPTX\\
   *Answer: (B)* | *Explanation:* Tally Prime exports GST return tables in JSON format for instant portal ingestion.

8. *What preliminary check must always be performed in Tally Prime before executing a Company Data Split?*\\
   (A) Delete all stock items #h(10pt) (B) Verify Company Data (#key-pill("Alt + Y > Verify")) #h(10pt) (C) Reinstall Windows #h(10pt) (D) Format hard drive\\
   *Answer: (B)* | *Explanation:* Verify Data audits voucher consistency and identifies any database errors prior to splitting.

9. *Under amended Section 16(2)(aa) of the CGST Act, when can a buyer claim Input Tax Credit?*\\
   (A) As soon as the invoice is received #h(10pt) (B) Only when the invoice appears in the buyer's GSTR-2B\\
   (C) Whenever the CA approves #h(10pt) (D) At the end of 5 years\\
   *Answer: (B)* | *Explanation:* Credit is legally restricted to invoices reflected in the buyer's auto-drafted GSTR-2B.

10. *When bank interest is credited directly to an account, what journal adjustment is made in Tally Prime?*\\
    (A) Dr. Bank A/c, Cr. Interest Income A/c #h(10pt) (B) Dr. Interest Income A/c, Cr. Bank A/c\\
    (C) Dr. Cash A/c, Cr. Bank A/c #h(10pt) (D) Dr. Capital A/c, Cr. Bank A/c\\
    *Answer: (A)* | *Explanation:* Real account (Bank balance increases: Debit) and Nominal account (Interest is income: Credit).

#v(6pt)

// VIVA & LAB
== Topic 11: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain the commercial danger of failing to reconcile GSTR-2B against purchase invoices.\\
  *Answer:* If a supplier fails to file their GSTR-1 or report an invoice, that invoice will not appear in GSTR-2B. Under Section 16(2)(aa) of the CGST Act, a buyer cannot claim Input Tax Credit (ITC) for invoices missing from GSTR-2B, leading to tax penalties and cash flow losses.
- *Viva Q2:* How does electronic Auto-BRS in Tally Prime save time compared to manual reconciliation?\\
  *Answer:* It imports digital bank statements (CSV/Excel), automatically matches cheque numbers and transaction amounts, populates the Bank Date across hundreds of entries in seconds, and highlights unmatched items for investigation.
- *Hands-On Lab Task:* In Tally Prime, go to *Banking > Bank Reconciliation*, select *HDFC Bank*, enter reconciliation dates for sample cheques, and observe the updated Net Balance as per Bank.
"""

    return chapters
