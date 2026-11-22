# -*- coding: utf-8 -*-
"""
Corporate Capstone Project Generator for Tally Prime Master Curriculum
Standardized by Rahul Patel (Founder, RTechLab / IANT Palanpur)
Direct Contact: rahul.28e1@gmail.com
"""

def get_capstone_chapter():
    return r"""
= Corporate Capstone Project: End-to-End Enterprise Simulation

== C.1 Project Overview & Statutory Corporate Profile
This comprehensive Capstone Project simulates the complete commercial accounting, inventory management, statutory taxation, and financial auditing lifecycle of a multi-crore private limited company in Gujarat. Students and accounting trainees must execute this simulation directly in Tally Prime from company incorporation to the audited annual Balance Sheet.

#v(6pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1.2pt + rgb("#0E7490"),
  radius: 4pt,
  inset: 10pt,
  [
    #text(weight: "black", size: 9pt, fill: rgb("#0E7490"))[CORPORATE PROFILE: RAVI GLOBAL ENTERPRISES PRIVATE LIMITED]\\
    #v(3pt)
    - *Corporate Identity Number (CIN):* `U72900GJ2025PTC148921` · *Date of Incorporation:* 01-Apr-2025
    - *Registered Corporate Address:* Near Ambaji Mandir, Main Chowk, Palanpur, Banaskantha, Gujarat - 385001
    - *Statutory Tax Registrations:*
      - *GSTIN:* `24AABCR9876Q1Z2` (State Code: 24 - Gujarat, Taxpayer Type: Regular)
      - *Permanent Account Number (PAN):* `AABCR9876Q` · *Tax Deduction Account Number (TAN):* `AHMR01234F`
    - *Authorized Share Capital:* ₹25,00,000 (2,50,000 Equity Shares of ₹10 each)
    - *Paid-up Share Capital:* ₹10,00,000 (1,00,000 Equity Shares of ₹10 each introduced by promoters)
    - *Primary Bankers:* HDFC Bank Limited (Palanpur Branch, Current A/c No: `50200048192841`, IFSC: `HDFC0001824`)
    - *Business Domain:* Integrated multi-vertical enterprise operating computer hardware trading, high-tech IT consulting services, and commercial computer assembly manufacturing.
  ]
)

#v(6pt)

== C.2 Phase 1: Company Creation & System Configuration in Tally Prime
1. *Create Company:* Press #key-pill("Alt + K") > *Create*. Enter Company Name: `Ravi Global Enterprises Pvt Ltd`, State: `Gujarat` (Code 24), Pincode: `385001`, Financial Year Beginning: `01-Apr-2025`, Books Beginning: `01-Apr-2025`.
2. *Configure F11 Features:*
   - *Maintain Accounts:* `Yes` · *Enable Bill-wise Entry:* `Yes` · *Enable Cost Centres:* `Yes`.
   - *Maintain Inventory:* `Yes` · *Integrate Accounts with Inventory:* `Yes`.
   - *Enable Goods and Services Tax (GST):* `Yes` > Set State to `Gujarat`, enter GSTIN `24AABCR9876Q1Z2`.
   - *Enable Tax Deducted at Source (TDS):* `Yes` > Enter TAN `AHMR01234F`, Deductor Type: `Company`.
3. *Configure Security Control:* Set *Control User Access to Company Data* to `Yes`, define Administrator username as `Admin` and set a secure corporate password.

#v(6pt)

== C.3 Phase 2: Master Chart of Accounts (35 Foundational Ledgers)
Create the following 35 foundational ledgers in Tally Prime, ensuring exact group assignments and statutory settings:

#table(
  columns: (0.4fr, 1.8fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Ledger Account Name]], [#text(weight: "bold", fill: white)[Parent Group]], [#text(weight: "bold", fill: white)[Statutory / Bill-wise Setup]],
  [01], [Equity Share Capital A/c], [Capital Account], [No],
  [02], [General Reserve A/c], [Reserves & Surplus], [No],
  [03], [HDFC Bank Current A/c], [Bank Accounts], [Set Bank Details, IFSC HDFC0001824],
  [04], [ICICI Bank Operating A/c], [Bank Accounts], [Set Bank Details, IFSC ICIC0000412],
  [05], [Office Petty Cash A/c], [Cash-in-hand], [Opening: ₹25,000],
  [06], [Office Premises Building], [Fixed Assets], [Depreciation: 10% WDV],
  [07], [Computer Systems & Servers], [Fixed Assets], [Depreciation: 40% WDV],
  [08], [Office Furniture & Fixtures], [Fixed Assets], [Depreciation: 10% WDV],
  [09], [Avni Private Limited], [Sundry Creditors], [Gujarat · GSTIN: 24AABCA5544P1Z3 · Bill-by-Bill: Yes],
  [10], [Vishnu Technologies Pvt Ltd], [Sundry Creditors], [Karnataka · GSTIN: 29AABCV7788M1Z4 · Bill-by-Bill: Yes],
  [11], [Maheshwari Enterprises], [Sundry Debtors], [Gujarat · GSTIN: 24AABCM3344R1Z1 · Bill-by-Bill: Yes],
  [12], [Mumbai IT Infrastructure Hub], [Sundry Debtors], [Maharashtra · GSTIN: 27AAACM4455N1Z9 · Bill-by-Bill: Yes],
  [13], [Jaimin Corporation (Client)], [Sundry Debtors], [Gujarat · GSTIN: 24AABCJ6677K1Z0 · Bill-by-Bill: Yes],
  [14], [Shri Arvindbhai Patel (Landlord)], [Sundry Creditors], [PAN: ABCPA1234F · TDS Sec 194I applicable],
  [15], [Input CGST A/c], [Duties & Taxes], [GST > Central Tax],
  [16], [Input SGST A/c], [Duties & Taxes], [GST > State Tax],
  [17], [Input IGST A/c], [Duties & Taxes], [GST > Integrated Tax],
  [18], [Output CGST A/c], [Duties & Taxes], [GST > Central Tax],
  [19], [Output SGST A/c], [Duties & Taxes], [GST > State Tax],
  [20], [Output IGST A/c], [Duties & Taxes], [GST > Integrated Tax],
  [21], [TDS Payable Sec 194C], [Duties & Taxes], [TDS > 194C (Contractors)],
  [22], [TDS Payable Sec 194J], [Duties & Taxes], [TDS > 194J (Professional)],
  [23], [TDS Payable Sec 194I], [Duties & Taxes], [TDS > 194I (Rent)],
  [24], [Sales GST 18% A/c], [Sales Accounts], [GST Applicable · 18%],
  [25], [Sales Interstate IGST 18%], [Sales Accounts], [GST Applicable · 18%],
  [26], [Sales Exempt (0% GST)], [Sales Accounts], [GST Applicable · 0%],
  [27], [Purchase GST 18% A/c], [Purchase Accounts], [GST Applicable · 18%],
  [28], [Purchase Interstate IGST 18%], [Purchase Accounts], [GST Applicable · 18%],
  [29], [IT Consulting Revenue A/c], [Direct Incomes], [SAC: 998314 · 18% GST],
  [30], [Factory Labour Wages], [Direct Expenses], [Cost Centres: Factory],
  [31], [Freight & Carriage Inward], [Direct Expenses], [Appropriate to items],
  [32], [Office Staff Salaries], [Indirect Expenses], [Cost Centres: Admin],
  [33], [Office Premises Rent], [Indirect Expenses], [TDS Sec 194I applicable],
  [34], [High-Speed Internet Expense], [Indirect Expenses], [18% GST applicable],
  [35], [Round Off A/c], [Indirect Expenses], [Invoice Rounding · Normal · 1.00]
)

#v(6pt)

== C.4 Phase 3: Stock Items & Multi-Godown Warehouse Setup
1. *Create Godowns:*
   - `Palanpur Central Godown` (Primary warehouse for bulk raw components).
   - `Palanpur Retail Showroom` (Showroom for finished assemblies and retail merchandise).
2. *Units of Measure (UoM):* Create simple unit `Pcs` (Formal Name: *Pieces*, UQC: *PCS-PIECES*) and `Box` (UQC: *BOX-BOXES*).
3. *Stock Items Registry:*

#table(
  columns: (0.4fr, 1.8fr, 0.8fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Stock Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[GST Rate]], [#text(weight: "bold", fill: white)[Standard Cost / Price]],
  [01], [Intel Core i7 14th Gen Processor], [847150], [18%], [Cost: ₹24,000 · MRP: ₹31,000],
  [02], [Gigabyte Z790 Motherboard], [847150], [18%], [Cost: ₹16,000 · MRP: ₹21,500],
  [03], [Corsair 32GB DDR5 Gaming RAM], [847330], [18%], [Cost: ₹7,500 · MRP: ₹10,200],
  [04], [Samsung 2TB NVMe M.2 SSD], [847170], [18%], [Cost: ₹8,000 · MRP: ₹11,500],
  [05], [Cooler Master 750W Gold SMPS], [847180], [18%], [Cost: ₹5,500 · MRP: ₹7,800],
  [06], [NZXT ATX Mid-Tower Cabinet], [847330], [18%], [Cost: ₹6,000 · MRP: ₹8,500],
  [07], [Samsung 24\" IPS LED Monitor], [847160], [18%], [Cost: ₹6,500 · MRP: ₹8,500],
  [08], [Logitech Wireless Keyboard Combo], [847160], [18%], [Cost: ₹1,200 · MRP: ₹1,650],
  [09], [Cisco 24-Port Gigabit Switch], [851762], [18%], [Cost: ₹18,500 · MRP: ₹24,000],
  [10], [Apex Pro AI Workstation (BOM)], [847141], [18%], [Manufactured Assembly]
)

#v(6pt)

== C.5 Phase 4: The 30 Master Operating Simulation Transactions
Execute the following 30 comprehensive corporate transactions in chronological sequence across April and May 2025:

#table(
  columns: (0.4fr, 0.7fr, 2.5fr, 0.8fr, 0.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Date]], [#text(weight: "bold", fill: white)[Commercial Transaction Particulars]], [#text(weight: "bold", fill: white)[Voucher]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [01], [01-Apr], [Promoters deposited ₹10,00,000 equity share capital into HDFC Bank], [Receipt (F6)], [10,00,000],
  [02], [01-Apr], [Transferred ₹2,00,000 from HDFC Bank to ICICI Bank to establish operating fund], [Contra (F4)], [2,00,000],
  [03], [02-Apr], [Withdrew liquid cash ₹50,000 from HDFC Bank for office petty cash box], [Contra (F4)], [50,000],
  [04], [02-Apr], [Paid ₹1,50,000 commercial office deposit to Landlord Shri Arvindbhai via cheque], [Payment (F5)], [1,50,000],
  [05], [03-Apr], [Procured office furniture & executive chairs from Wood Art Palanpur in cash], [Payment (F5)], [45,000],
  [06], [04-Apr], [Procured 20 Intel i7 CPUs & 20 Gigabyte Motherboards from Avni Pvt Ltd (Inv \#801) + 18% GST], [Purchase (F9)], [9,44,000],
  [07], [05-Apr], [Procured 40 Corsair RAM & 30 Samsung SSDs from Vishnu Tech (Karnataka, Inv \#512) + 18% IGST], [Purchase (F9)], [6,37,200],
  [08], [06-Apr], [Procured 20 SMPS & 20 Cabinets from Avni Pvt Ltd (Inv \#815) + 18% GST], [Purchase (F9)], [2,71,400],
  [09], [08-Apr], [Paid ₹8,500 transport freight inward in cash to Palanpur Roadlines], [Payment (F5)], [8,50],
  [10], [10-Apr], [Transferred raw components for 10 Workstations from Central Godown to Retail Showroom], [Stock Journal], [Transferred],
  [11], [11-Apr], [Manufactured 10 units Apex Pro AI Workstations using Stock Journal BOM], [Stock Journal], [Assembly],
  [12], [12-Apr], [Sold 5 units Apex Pro AI Workstations @ ₹85,000 to Maheshwari Enterprises (Inv \#001) + 18% GST], [Sales (F8)], [5,01,500],
  [13], [14-Apr], [Sold 3 units Apex Pro AI Workstations @ ₹88,000 to Mumbai IT Hub (Inv \#002) + 18% IGST], [Sales (F8)], [3,11,520],
  [14], [15-Apr], [Maheshwari Enterprises returned 1 workstation due to transit scratch (Credit Note)], [Credit Note], [1,00,300],
  [15], [16-Apr], [Returned defective components to Avni Pvt Ltd (Debit Note \#DN-01)], [Debit Note], [47,200],
  [16], [18-Apr], [Received RTGS from Maheshwari Enterprises for net invoice balance], [Receipt (F6)], [4,01,200],
  [17], [20-Apr], [Issued cheque \#450105 to Avni Pvt Ltd in partial settlement of accounts], [Payment (F5)], [5,00,000],
  [18], [22-Apr], [Raised professional IT consulting invoice to Jaimin Corp (SAC 998314) + 18% GST], [Sales (F8)], [88,500],
  [19], [25-Apr], [Jaimin Corp paid consulting bill via NEFT after deducting 10% TDS (Sec 194J)], [Receipt (F6)], [81,000],
  [20], [28-Apr], [Paid monthly high-speed enterprise broadband bill via HDFC net banking + 18% GST], [Payment (F5)], [4,720],
  [21], [30-Apr], [Credited monthly office staff salaries ₹65,000 (To be disbursed 1st May)], [Journal (F7)], [65,000],
  [22], [30-Apr], [Booked monthly office rent ₹25,000 to Shri Arvindbhai; deducted 10% TDS (Sec 194I)], [Journal (F7)], [25,000],
  [23], [01-May], [Disbursed staff salaries via HDFC Bank direct account transfer], [Payment (F5)], [65,000],
  [24], [02-May], [Issued cheque \#450121 of ₹22,500 to Shri Arvindbhai for net rent], [Payment (F5)], [22,500],
  [25], [07-May], [Deposited April TDS collections (₹2,500 Sec 194I + ₹7,500 Sec 194J) via Challan 281], [Payment (F5)], [10,000],
  [26], [10-May], [Received full RTGS settlement from Mumbai IT Infrastructure Hub], [Receipt (F6)], [3,11,520],
  [27], [15-May], [Issued NEFT remittance to Vishnu Technologies (Karnataka) for full balance], [Payment (F5)], [6,37,200],
  [28], [20-May], [Reconciled GSTR-3B for April: Offset Input CGST/SGST/IGST against Output liabilities], [Journal (F7)], [GST Offset],
  [29], [25-May], [Bank debited semi-annual current account maintenance and ledger charges], [Payment (F5)], [1,180],
  [30], [31-May], [Bank credited interest dividend on automatic sweep fixed deposit in HDFC Bank], [Receipt (F6)], [4,850]
)

#v(6pt)

== C.6 Phase 5: Bank Reconciliation Statement (BRS) Audit
On 31-May-2025, the company's HDFC Bank Passbook balance displays ₹4,78,220, whereas Tally Prime's Cash Book displays ₹4,55,720. 
- *Audit Investigation:*
  1. Cheque \#450121 of ₹22,500 issued to Landlord Shri Arvindbhai on 02-May was presented at bank on 04-June.
  2. Interest credit of ₹4,850 was credited by bank on 31-May but entered in Tally on 01-June.
- *Reconciliation Execution:* Navigate to *Gateway of Tally > Banking > Bank Reconciliation*, enter bank clearance dates, and verify that *Balance as per Bank* reconciles to zero variance!

#v(6pt)

== C.7 Phase 6: Audited Annual Financial Statements

=== 1. Manufacturing & Trading Account for the Period Ended 31-May-2025
#table(
  columns: (2fr, 1fr, 2fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Particulars (Debit)]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Particulars (Credit)]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [To Opening Stock], [0.00], [By Sales Accounts (Net)], [7,24,000.00],
  [To Raw Material Purchases], [15,81,200.00], [By Closing Stock (Valued at Cost)], [11,45,000.00],
  [To Factory Labour & Freight], [8,500.00], [], [],
  [To *Gross Profit c/d*], [*2,79,300.00*], [], [],
  [*Total*], [*18,69,000.00*], [*Total*], [*18,69,000.00*]
)

#v(6pt)

=== 2. Profit & Loss Account for the Period Ended 31-May-2025
#table(
  columns: (2fr, 1fr, 2fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Particulars (Debit)]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Particulars (Credit)]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [To Office Staff Salaries], [65,000.00], [By Gross Profit b/d], [2,79,300.00],
  [To Office Premises Rent], [25,000.00], [By IT Consulting Revenue], [75,000.00],
  [To High-Speed Internet], [4,000.00], [By Bank Interest Income], [4,850.00],
  [To Bank Service Charges], [1,000.00], [], [],
  [To Depreciation on Fixed Assets], [12,500.00], [], [],
  [To *Net Profit transferred to Capital*], [*2,51,650.00*], [], [],
  [*Total*], [*3,59,150.00*], [*Total*], [*3,59,150.00*]
)

#v(6pt)

=== 3. Audited Corporate Balance Sheet as at 31-May-2025
#table(
  columns: (2fr, 1fr, 2fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Capital & Liabilities]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Property & Assets]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [Equity Share Capital], [10,00,000.00], [Fixed Assets (Net of Dep.)], [1,82,500.00],
  [Profit & Loss Account (Net Profit)], [2,51,650.00], [Office Premises Security Deposit], [1,50,000.00],
  [Sundry Creditors (Trade Payables)], [3,97,000.00], [Closing Stock Inventory], [11,45,000.00],
  [Statutory Taxes & Duties Payable], [4,120.00], [Sundry Debtors (Receivables)], [0.00],
  [], [], [TDS Receivable (Tax Asset)], [7,500.00],
  [], [], [HDFC Bank Current Balance], [4,55,720.00],
  [], [], [Cash-in-hand (Petty Cash)], [12,050.00],
  [*Total Liabilities*], [*16,52,770.00*], [*Total Assets*], [*16,52,770.00*]
)

#v(6pt)


== C.8 Phase 7: The 10 Capstone Commercial Invoices Breakdown
Every trainee must generate and audit the following 10 commercial invoices within the capstone company:

#table(
  columns: (0.5fr, 1fr, 1.3fr, 1fr, 1fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Inv \#]], [#text(weight: "bold", fill: white)[Date & Type]], [#text(weight: "bold", fill: white)[Party Name & GSTIN]], [#text(weight: "bold", fill: white)[Taxable Val]], [#text(weight: "bold", fill: white)[GST Tax]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [PUR-01], [04-Apr · Pur], [Avni Pvt Ltd (24AABCA5544P1Z3)], [₹8,00,000], [CGST+SGST 18%], [₹9,44,000],
  [PUR-02], [05-Apr · Pur], [Vishnu Tech (29AABCV7788M1Z4)], [₹5,40,000], [IGST 18%], [₹6,37,200],
  [PUR-03], [06-Apr · Pur], [Avni Pvt Ltd (24AABCA5544P1Z3)], [₹2,30,000], [CGST+SGST 18%], [₹2,71,400],
  [SAL-01], [12-Apr · Sale], [Maheshwari (24AABCM3344R1Z1)], [₹4,25,000], [CGST+SGST 18%], [₹5,01,500],
  [SAL-02], [14-Apr · Sale], [Mumbai IT (27AAACM4455N1Z9)], [₹2,64,000], [IGST 18%], [₹3,11,520],
  [CN-01], [15-Apr · C/N], [Maheshwari (24AABCM3344R1Z1)], [-₹85,000], [CGST+SGST 18%], [-₹1,00,300],
  [DN-01], [16-Apr · D/N], [Avni Pvt Ltd (24AABCA5544P1Z3)], [-₹40,000], [CGST+SGST 18%], [-₹47,200],
  [SRV-01], [22-Apr · Sale], [Jaimin Corp (24AABCJ6677K1Z0)], [₹75,000], [CGST+SGST 18%], [₹88,500],
  [EXP-01], [28-Apr · Pur], [Airtel Broadband (24AAACA0123P1Z0)], [₹4,000], [CGST+SGST 18%], [₹4,720],
  [RNT-01], [30-Apr · Jrn], [Shri Arvindbhai (Landlord)], [₹25,000], [TDS Sec 194I 10%], [₹22,500 (Net)]
)

#v(6pt)

== C.9 Phase 8: Tripartite GST Returns Reconciliation Audit
In accordance with statutory corporate auditing mandates, the trainee must reconcile the company's internal accounting books against statutory GST portal filings:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reconciliation Field]], [#text(weight: "bold", fill: white)[As per Tally Prime Books]], [#text(weight: "bold", fill: white)[As per Portal (1/3B/2B)]], [#text(weight: "bold", fill: white)[Audit Variance]],
  [Total Outward Taxable Value], [₹6,79,000.00], [₹6,79,000.00 (GSTR-1)], [₹0.00 (Matched)],
  [Output CGST Liability], [₹37,350.00], [₹37,350.00 (GSTR-3B)], [₹0.00 (Matched)],
  [Output SGST Liability], [₹37,350.00], [₹37,350.00 (GSTR-3B)], [₹0.00 (Matched)],
  [Output IGST Liability], [₹47,520.00], [₹47,520.00 (GSTR-3B)], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (CGST)], [₹89,460.00], [₹89,460.00 (GSTR-2B)], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (SGST)], [₹89,460.00], [₹89,460.00 (GSTR-2B)], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (IGST)], [₹97,200.00], [₹97,200.00 (GSTR-2B)], [₹0.00 (Matched)],
  [Net Tax Payable in Cash (PMT-06)], [₹0.00 (Excess ITC c/f)], [₹0.00 (Cash Ledger)], [₹0.00 (Carried Forward)]
)

#v(6pt)

== C.10 Comprehensive Corporate Capstone Self-Assessment Drill (15 Questions)
1. *What is the primary function of the Bill of Materials (BOM) during workstation assembly?*\
   *Answer:* It pre-programs the technical recipe of components, automatically deducting raw stock from the central godown and capitalizing finished assembly value without manual data entry.
2. *Why was TDS under Section 194I deducted on the ₹25,000 office rent?*\
   *Answer:* Under Section 194I of the Income Tax Act, corporate entities paying commercial rent exceeding ₹2,40,000 annually must deduct 10% TDS from the landlord.
3. *What is the purpose of GSTR-2B in Phase 8?*\
   *Answer:* It provides an inviolable, auto-drafted statement of eligible Input Tax Credit uploaded by suppliers, ensuring compliance with Section 16(2)(aa).
4. *How is inter-godown transfer recorded in Tally Prime?*\
   *Answer:* Via the Stock Journal voucher (Alt+F7), specifying the Source Godown on the left and the Destination Godown on the right.
5. *Why is TDS Receivable categorized under Current Assets on the Balance Sheet?*\
   *Answer:* Because it represents advance tax withheld by clients that will be offset against the company's corporate tax liability when filing ITR-6.

#v(6pt)


== C.11 Phase 9: Financial Ratio Analysis & Corporate Solvency Audit
Corporate management and statutory auditors analyze key financial ratios to evaluate liquidity, profitability, and operational efficiency:

#table(
  columns: (1.4fr, 1.2fr, 1fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Financial Ratio]], [#text(weight: "bold", fill: white)[Mathematical Formula]], [#text(weight: "bold", fill: white)[Result]], [#text(weight: "bold", fill: white)[Corporate Health Interpretation]],
  [Current Ratio], [Current Assets / Current Liab], [4.12 : 1], [Exceptional liquidity. Exceeds standard 2:1 corporate benchmark.],
  [Quick Ratio], [Quick Assets / Current Liab], [1.25 : 1], [Liquid cash and receivables comfortably cover immediate obligations.],
  [Gross Profit Margin], [(Gross Profit / Sales) × 100], [38.58%], [Robust manufacturing trade margin after raw material assembly.],
  [Net Profit Margin], [(Net Profit / Total Rev) × 100], [31.50%], [High operational profitability and tight overhead expense control.],
  [Debt-Equity Ratio], [Total Debt / Shareholder Equity], [0.32 : 1], [Highly conservative capital structure; very low solvency risk.]
)

#v(8pt)

== C.12 Statutory Audit Certificate & Corporate Training Endorsement
#block(
  fill: rgb("#F8FAFC"),
  stroke: 1.5pt + rgb("#0E7490"),
  radius: 6pt,
  inset: 12pt,
  [
    #align(center)[
      #text(weight: "black", size: 10pt, fill: rgb("#0E7490"))[INSTITUTE OF ACCOUNTING & NETWORK TECHNOLOGY (IANT PALANPUR)]\
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[CERTIFICATE OF PRACTICAL CORPORATE AUDIT & ERP MASTERY]\
      #v(4pt)
      #text(size: 7.2pt, style: "italic", fill: rgb("#64748B"))[Issued in Joint Academic Partnership with RTechLab Commercial Learning Systems]
    ]
    #v(6pt)
    #text(size: 8pt, fill: rgb("#334155"))[
      This is to certify that the candidate has successfully executed the complete end-to-end accounting simulation for *Ravi Global Enterprises Private Limited* in Tally Prime. The candidate has demonstrated verified competency in:
    ]
    #v(3pt)
    - Double-entry multi-currency bookkeeping across all 6 core voucher types (Contra, Payment, Receipt, Journal, Sales, Purchase).
    - Multi-location godown inventory tracking with Bill of Materials (BOM) computer assembly manufacturing.
    - Statutory GST compliance: Rule 46 Tax Invoicing, GSTR-1, GSTR-3B monthly tax computation, and 100% GSTR-2B reconciliation.
    - Statutory Income Tax compliance: TDS withholding under Sections 194C, 194J, and 194I, with quarterly Form 26Q reconciliation.
    - Bank Reconciliation Statement (BRS) audit, verifying zero discrepancy against commercial bank records.
    - Preparation and analysis of audited final financial statements (Trading Account, Profit & Loss Account, and Schedule III Balance Sheet).
    #v(10pt)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[Corporate Trainer Evaluation:] *DISTINCTION (GRADE A+)*\
        #text(size: 7pt, fill: rgb("#64748B"))[Practical Verification ID: RTECH-TALLY-2027-VAL]
      ],
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0E7490"))[Rahul Patel]\
        #text(size: 6.8pt, fill: rgb("#475569"))[Lead Corporate Accounting Trainer · IANT Palanpur\Founder, RTechLab]
      ]
    )
  ]
)

#v(6pt)

== C.13 Capstone Assessment & Viva Interview Evaluation
- *Evaluation Q1:* In Phase 4, why was TDS under Section 194J deducted on the IT consulting fee of ₹75,000 but not on the computer hardware sales?\\
  *Model Answer:* Section 194J strictly applies to fees for professional and technical services rendered by corporate and individual consultants. Sale of physical computer hardware is a sale of goods governed by GST and Section 194Q/206C(1H), not Section 194J.
- *Evaluation Q2:* How did the Bill of Materials (BOM) in Phase 2 ensure inventory integrity during workstation assembly?\\
  *Model Answer:* The BOM linked 1 unit of Apex Pro AI Workstation to 1 CPU, 1 Motherboard, 2 RAM sticks, 1 SSD, 1 SMPS, and 1 Cabinet. When 10 workstations were assembled via the Stock Journal, Tally automatically deducted exactly 10 CPUs, 10 Motherboards, 20 RAMs, and 10 SSDs from the raw materials godown without requiring manual data entry, eliminating human stock count errors.
- *Evaluation Q3:* Explain the statutory rationale of reflecting ₹7,500 TDS in the Balance Sheet under Current Assets.\\
  *Model Answer:* The ₹7,500 TDS withheld by Jaimin Corporation under Section 194J represents income tax paid in advance to the Central Government on behalf of Ravi Global Enterprises. It is a legitimate financial asset that will be claimed as a tax credit against the company's advance tax or final corporate income tax liability when filing ITR-6.
- *Hands-On Capstone Certification Assignment:* Create `Ravi Global Enterprises Pvt Ltd` in your local Tally Prime installation, record all 30 transactions, generate the Trial Balance, verify that total debits and credits equal ₹38,42,190, export the Balance Sheet to PDF, and submit your project report for formal IANT / RTechLab Corporate Certification!
"""
