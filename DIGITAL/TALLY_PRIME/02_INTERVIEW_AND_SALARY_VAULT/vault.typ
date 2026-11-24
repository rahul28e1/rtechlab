#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#set document(
  title: "Tally Prime Top 50 Corporate Accountant Interview Vault",
  author: "Rahul Patel"
)

#set page(
  paper: "a4",
  margin: (x: 12mm, top: 14mm, bottom: 13mm),
  fill: white,
  header: context {
    let p = counter(page).get().first()
    if p > 1 {
      block(width: 100%, stroke: (bottom: 0.5pt + rgb("#CBD5E1")), inset: (bottom: 2mm))[
        #grid(
          columns: (1fr, 1fr),
          align: (left, right),
          [#text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB] #text(size: 8pt, fill: rgb("#0E7490"), weight: "bold")[ | Top 50 Corporate Accountant Interview Vault]],
          [#text(size: 7.5pt, fill: rgb("#64748B"))[MNC & Big-4 Interview Prep · Rahul Patel]]
        )
      ]
    }
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 {
      block(width: 100%, stroke: (top: 0.5pt + rgb("#CBD5E1")), inset: (top: 2mm))[
        #grid(
          columns: (1fr, auto),
          align: (left, right),
          [#text(size: 6.8pt, fill: rgb("#64748B"))[#text(fill: rgb("#059669"))[●] High-Yield Corporate Q&A · Tally Prime, GST Portal, TDS & Year-End Audit]],
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#64748B"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p])]
        )
      ]
    }
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 8.2pt, fill: rgb("#1E293B"))
#set par(justify: true, leading: 0.48em)

// ==================== COVER BLOCK (LIGHT THEME) ====================
#align(center)[
  #v(8pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), radius: 4pt, inset: (x: 10pt, y: 3.5pt), text(size: 7.8pt, weight: "bold", fill: rgb("#1D4ED8"))[CORPORATE CAREER ACCELERATOR SERIES])
  #v(6pt)
  #text(size: 20pt, weight: "black", fill: rgb("#0F172A"))[TOP 50 CORPORATE ACCOUNTANT INTERVIEW VAULT]
  #v(3pt)
  #text(size: 11pt, weight: "bold", fill: rgb("#0E7490"))[High-Yield Questions & Practical Field Answers for Tally & Tax Interviews]
  #v(4pt)
  #text(size: 8.2pt, fill: rgb("#475569"))[Tested at Big-4 Firms, Tier-1 Manufacturing, FMCG Giants & Top Chartered Accountancy Practices]
  #v(6pt)
  #line(length: 60%, stroke: 1.5pt + rgb("#0E7490"))
  #v(4pt)
  #text(size: 8.8pt, weight: "bold", fill: rgb("#0F172A"))[Curated by: Rahul Patel] #text(size: 8pt, fill: rgb("#64748B"))[(IANT Palanpur & RTechLab)]
]

#v(8pt)

= Part 1: Core Tally Prime Architecture & Accounting Foundations (Q01 - Q12)

#concept-box(title: "Q01: What is the primary difference between Tally.ERP 9 and Tally Prime?")[
  *Answer:* Tally Prime introduced a redesigned top-bar navigation system (`Go To` - Alt+G), seamless multi-tasking (opening reports while keeping an unsaved voucher active), a unified single-window installer, enhanced print/export previewing, support for mouse operations, and direct API-driven integration for e-Invoicing and e-Way bills without third-party plugins.
]

#v(5pt)

#concept-box(title: "Q02: What are the 28 predefined groups in Tally Prime, and why is their classification critical?")[
  *Answer:* Tally Prime features 15 Primary Groups (9 Balance Sheet, 6 P&L) and 13 Secondary Groups. Their classification is critical because Tally automatically generates statutory financial statements based strictly on group hierarchy. A ledger classified under *Sundry Creditors* reports to Current Liabilities on the Balance Sheet; if mistakenly classified under *Direct Expenses*, it distorts Cost of Goods Sold and Gross Profit!
]

#v(5pt)

#concept-box(title: "Q03: Explain the 4 bill-wise reference types available in Sundry Debtors & Creditors.")[
  *Answer:*
  1. *New Ref:* Assigned when issuing a new sales or purchase invoice.
  2. *Agst Ref (Against Reference):* Selected during receipt or payment to settle a specific prior bill number, maintaining clear age-wise outstanding balances.
  3. *Advance:* Used when cash/bank is received or paid prior to invoice generation.
  4. *On Account:* Used for lump-sum transfers where the payer does not specify invoice linkage.
]

#v(5pt)

#concept-box(title: "Q04: When do you use Contra Voucher (F4) versus Journal Voucher (F7)?")[
  *Answer:* *Contra (F4)* is strictly reserved for internal cash and bank transfers (Cash to Bank deposit, Bank cash withdrawal, or Inter-bank transfer) with zero third-party impact. *Journal (F7)* is used for all non-cash adjustments (depreciation, accruals, bad debts, credit purchases of fixed assets, and TDS booking).
]

#v(5pt)

#concept-box(title: "Q05: How does Tally Prime handle Negative Cash and Negative Stock warnings?")[
  *Answer:* When cash payouts exceed recorded cash-in-hand, or when sales quantities exceed available godown stock, Tally triggers a high-visibility red warning prompt. In corporate audit, negative cash indicates unrecorded cash inflows or delayed ledger postings, while negative stock indicates billing before inward receipt notes are processed.
]

#v(5pt)

#concept-box(title: "Q06: What are the 3 Types of Accounts and their Golden Rules of Accounting?")[
  *Answer:*
  - *Personal Account:* Relates to individuals, firms, banks, and representative accounts. *Rule:* Debit the Receiver, Credit the Giver.
  - *Real Account:* Relates to tangible and intangible business assets (Machinery, Cash, Furniture, Patents). *Rule:* Debit what comes in, Credit what goes out.
  - *Nominal Account:* Relates to expenses, losses, revenues, and gains (Rent, Salary, Interest, Commission). *Rule:* Debit all expenses and losses, Credit all incomes and gains.
]

#v(5pt)

#concept-box(title: "Q07: What is the difference between a Ledger and a Group in Tally Prime?")[
  *Answer:* A *Group* is an accounting classification container that determines where transactions roll up in the Balance Sheet or Profit & Loss statement (e.g., *Current Liabilities*, *Fixed Assets*). A *Ledger* is the actual individual book of account under a group (e.g., *HDFC Bank A/c*, *Office Rent A/c*, *Patel Brothers A/c*) used directly in voucher data entry.
]

#v(5pt)

#concept-box(title: "Q08: What are the two pre-defined ledgers automatically created in Tally Prime?")[
  *Answer:* Tally Prime creates two permanent ledgers automatically when a new company is initialized: *Cash* (under *Cash-in-hand*) and *Profit & Loss A/c* (under *Primary*). All other ledgers (Bank accounts, Capital, Debtors, Creditors, Taxes) must be created by the user.
]

#v(5pt)

#concept-box(title: "Q09: How does the Cactus in-memory database engine work in Tally Prime?")[
  *Answer:* Tally utilizes a proprietary object-oriented database engine called *Cactus*. Unlike relational databases (e.g., SQL) that require disk queries and table joins, Cactus loads the entire hierarchical company tree into RAM, enabling real-time arithmetical recalculations and instant Balance Sheet updates across millions of transactions with zero query latency.
]

#v(5pt)

#concept-box(title: "Q10: What is the significance of the Go To (Alt+G) feature compared to traditional menu navigation?")[
  *Answer:* `Go To` (Alt+G) allows non-disruptive universal multi-tasking. An accountant can pause in the middle of entering a 20-item sales voucher, press Alt+G, look up a customer's ledger balance or stock summary, print an old invoice, and press Esc to immediately resume the active voucher without losing unposted data.
]

#v(5pt)

#concept-box(title: "Q11: What is the difference between Capital Account and Drawings in Tally?")[
  *Answer:* *Capital Account* reflects funds and economic assets invested by the business owner/proprietor into the enterprise (Credit balance). *Drawings* represents funds or goods withdrawn by the owner for personal non-commercial use (Debit balance). In Tally, Drawings is classified under the *Capital Account* group and is deducted from owner's equity on the Balance Sheet.
]

#v(5pt)

#concept-box(title: "Q12: How do you configure and enable Bill-wise Details for Sundry Creditors & Debtors in F11?")[
  *Answer:* Press `F11` (Company Features) -> set *Maintain Accounts = Yes* and *Enable Bill-wise Details = Yes*. Then, inside each Debtor or Creditor ledger creation screen, set *Maintain balances bill-by-bill = Yes*. This unlocks the bill reference sub-screen (`New Ref`, `Agst Ref`, `Advance`, `On Account`) on every voucher.
]

#v(10pt)

= Part 2: GST Statutory Compliance, Invoicing & Portal Audit (Q13 - Q25)

#gst-box(title: "Q13: Explain the destination-based principle of GST and how Tally determines CGST/SGST vs IGST.")[
  *Answer:* GST is levied where goods or services are consumed (*Place of Supply*). Tally Prime compares the *Company State Code* (e.g., Gujarat 24) with the *Party State Code*:
  - If Party State == 24 (Intrastate) -> CGST (50%) + SGST (50%) are applied.
  - If Party State != 24 (Interstate e.g., Maharashtra 27) -> IGST (100%) is applied automatically.
]

#v(5pt)

#gst-box(title: "Q14: What are the current primary GST slabs (0%, 5%, 18%) and how do you configure them in Tally?")[
  *Answer:* Under current rationalization, the primary workhorse slabs are:
  - *0% (Exempt):* Unbranded APMC agricultural commodities, fresh milk, vegetables, basic healthcare/education.
  - *5% (Essentials):* Packaged edible oils, domestic transport, basic footwear under ₹1,000, medicines.
  - *18% (Standard):* IT hardware, smartphones, consumer electronics, professional services, software.
  *Configuration:* Tax rates should be defined at the *Stock Item Master* level with proper HSN codes. Statutory tax ledgers (`CGST`, `SGST`, `IGST`) must remain set to `0%` in their masters so Tally auto-computes the tax based on the item line!
]

#v(5pt)

#gst-box(title: "Q15: What is the difference between GSTR-1, GSTR-3B, and GSTR-2B?")[
  *Answer:*
  - *GSTR-1:* Monthly/quarterly statement of *Outward Supplies (Sales)* filed by the seller.
  - *GSTR-3B:* Monthly self-declared summary return for tax payment, offsetting output tax against eligible Input Tax Credit (ITC).
  - *GSTR-2B:* Auto-drafted, static ITC statement generated on the 14th of each month reflecting purchases uploaded by suppliers in their GSTR-1. Accountants must reconcile Tally purchase registers with GSTR-2B before claiming ITC!
]

#v(5pt)

#gst-box(title: "Q16: What is Blocked ITC under Section 17(5) of the CGST Act?")[
  *Answer:* Section 17(5) specifies purchases where input tax credit cannot be claimed even if used for business:
  1. Motor vehicles for passenger transport (capacity <= 13 persons, unless used for transportation business or driving school).
  2. Food and beverages, outdoor catering, health insurance, gym memberships.
  3. Goods lost, stolen, destroyed, written off, or disposed of as free gifts/samples.
  4. Works contract services for construction of immovable property (other than plant and machinery).
]

#v(5pt)

#gst-box(title: "Q17: How is an e-Way Bill generated in Tally Prime?")[
  *Answer:* In Tally Prime, set *Track e-Way Bill* = Yes in F11. For any consignment where the taxable value exceeds ₹50,000 (interstate) or state-specific threshold, Tally prompts for Transporter ID, Vehicle Number, and Distance. Users can directly export JSON for the NIC portal or generate the e-Way bill in real time via Tally's direct GSP integration.
]

#v(5pt)

#gst-box(title: "Q18: What is the threshold limit and procedure for generating e-Invoices in Tally Prime?")[
  *Answer:* Businesses with aggregate annual turnover exceeding ₹5 Crore in any preceding financial year must generate e-Invoices for all B2B transactions. In Tally Prime, configure e-Invoicing in F11 with API credentials. On saving a B2B sales voucher, Tally connects to the Invoice Registration Portal (IRP), obtains the 64-character Invoice Reference Number (IRN) and signed QR code, and prints them on the invoice.
]

#v(5pt)

#gst-box(title: "Q19: How do you configure HSN / SAC codes and tax rates at the Stock Item vs Ledger level?")[
  *Answer:* For physical inventory items, configure HSN codes and GST rates inside the *Stock Item Master* (or *Stock Group Master*). For pure service transactions with no inventory, configure SAC codes and GST rates directly inside the *Sales/Income or Purchase/Expense Ledger Master*.
]

#v(5pt)

#gst-box(title: "Q20: What is the difference between Item Invoice, Accounting Invoice, and As Voucher mode (Ctrl+H)?")[
  *Answer:* Press `Ctrl + H` inside Sales (F8) or Purchase (F9) to toggle modes:
  - *Item Invoice:* Required for trading/manufacturing where stock items, quantities, rates, and units are billed.
  - *Accounting Invoice:* Used for professional services, rent, or maintenance where ledgers are debited/credited without inventory items.
  - *As Voucher:* Used for traditional double-entry debit/credit format.
]

#v(5pt)

#gst-box(title: "Q21: How do you record an Interstate Purchase with IGST and verify ITC in GSTR-3B?")[
  *Answer:* Create the supplier ledger with state set outside company state (e.g., Maharashtra 27). In Purchase Voucher (F9), select the supplier, stock items, and select the *Input IGST* ledger. After saving, go to *Gateway of Tally -> Display More Reports -> Statutory Reports -> GST Reports -> GSTR-3B* to confirm that the taxable amount and IGST reflect under *Eligible ITC -> All other ITC*.
]

#v(5pt)

#gst-box(title: "Q22: When is a Debit Note (Alt+F5) issued under GST versus a Credit Note (Alt+F6)?")[
  *Answer:*
  - *Debit Note (Alt+F5):* Issued by a buyer when returning defective goods to a supplier (*Purchase Return*) or by a seller when under-charging a customer on an earlier invoice.
  - *Credit Note (Alt+F6):* Issued by a seller when accepting goods returned by a customer (*Sales Return*) or granting post-sale volume discounts, reducing output GST liability.
]

#v(5pt)

#gst-box(title: "Q23: How do you handle RCM (Reverse Charge Mechanism) transactions in Tally Prime?")[
  *Answer:* Under RCM (e.g., Goods Transport Agency services, legal services by advocates), the recipient is liable to pay GST directly to the government. In Tally, mark *Applicable for Reverse Charge = Yes* in the expense ledger. Tally flags the liability in GSTR-3B under Table 3.1(d). The accountant passes a Journal entry (F7) raising GST liability and booking corresponding ITC.
]

#v(5pt)

#gst-box(title: "Q24: What is the difference between Nil-Rated, Exempted, and Non-GST supplies?")[
  *Answer:*
  - *Nil-Rated Supplies:* Goods or services attracting 0% GST under statutory tariff schedule (e.g., unbranded grains, fresh vegetables).
  - *Exempted Supplies:* Items specifically exempt from GST by government notification (e.g., healthcare services, residential house rent).
  - *Non-GST Supplies:* Commodities outside the legal scope of the GST Act entirely (e.g., petroleum crude, diesel, petrol, aviation fuel, alcohol for human consumption).
]

#v(5pt)

#gst-box(title: "Q25: What is the statutory order of Input Tax Credit (ITC) utilization under GST rules?")[
  *Answer:*
  1. *IGST Credit* must first be utilized 100% against Output IGST, and the remaining IGST credit can be used against CGST or SGST in any proportion.
  2. *CGST Credit* is utilized next against Output CGST, and any balance against Output IGST (CGST credit can never offset SGST).
  3. *SGST Credit* is utilized last against Output SGST, and any balance against Output IGST (SGST credit can never offset CGST).
]

#v(10pt)

= Part 3: TDS Compliance, Salary & Statutory Deductions (Q26 - Q38)

#tds-box(title: "Q26: What is the purpose of TDS and who is liable to deduct it?")[
  *Answer:* Tax Deducted at Source (TDS) ensures regular tax inflow to the government and minimizes tax evasion. Any business entity (whose turnover exceeded ₹1 Crore in the preceding FY) making payments exceeding statutory thresholds for contractors, rent, professional services, or commission must deduct TDS and possess a valid 10-digit *Tax Deduction Account Number (TAN)*.
]

#v(5pt)

#tds-box(title: "Q27: Compare Section 194C (Contractor) and Section 194J (Professional Fees) thresholds and rates.")[
  *Answer:*
  - *Section 194C (Contractor Works):* Applies to physical contracts (transportation, advertising production, catering, security guards). Threshold: ₹30,000 single contract or ₹1,00,000 aggregate FY. Rate: *1%* for Individuals/HUF, *2%* for Companies.
  - *Section 194J (Professional / Technical Fees):* Applies to intellectual/technical services (CA audit fees, legal consultancy, IT development). Threshold: ₹30,000 per FY. Rate: *10%* for professional services; *2%* for technical services/call centres.
]

#v(5pt)

#tds-box(title: "Q28: What is the penalty under Section 206AA if a payee fails to provide PAN?")[
  *Answer:* Under Section 206AA, if the deductee fails to furnish a valid PAN to the deductor, TDS must be deducted at the higher of:
  1. The rate specified in the relevant Act provision, or
  2. *Flat 20% (Non-PAN Penalty Rate)*.
]

#v(5pt)

#tds-box(title: "Q29: Explain the due dates for TDS payment (Challan 281) and quarterly return filing (Form 26Q).")[
  *Answer:*
  - *Monthly Payment (Challan ITNS 281):* Due by the *7th of the following month* (except March TDS, which is due by *30th April*).
  - *Quarterly Returns (Form 26Q / 24Q):* Q1 (Apr-Jun) due 31st July; Q2 (Jul-Sep) due 31st October; Q3 (Oct-Dec) due 31st January; Q4 (Jan-Mar) due 31st May. Late filing attracts a fee of ₹200/day under Section 234E!
]

#v(5pt)

#tds-box(title: "Q30: What is Section 194I and what are its threshold limits for Land/Building vs Machinery?")[
  *Answer:* Section 194I governs TDS on rent payments. The threshold limit is *₹2,40,000 per financial year*. The applicable deduction rates are:
  - *10%* on Rent of Land, Building, or Furniture & Fixtures.
  - *2%* on Rent of Plant, Machinery, or Industrial Equipment.
]

#v(5pt)

#tds-box(title: "Q31: What is Section 194H and when does TDS apply to Commission or Brokerage?")[
  *Answer:* Section 194H applies to payments of commission or brokerage to residents. The statutory threshold is *₹15,000 per financial year*, and the deduction rate is *5%*. No surcharge or health and education cess is added to payments made to residents.
]

#v(5pt)

#tds-box(title: "Q32: How do you configure Nature of Payment and TDS ledgers in Tally Prime?")[
  *Answer:* Enable TDS in `F11` and enter TAN. Go to *Gateway of Tally -> Create -> TDS Nature of Payments* (e.g., *Fees for Professional or Technical Services - 194J*), specify section, code, threshold limit, and tax rate. In the expense ledger, select *Is TDS Applicable = Applicable* and link the Nature of Payment.
]

#v(5pt)

#tds-box(title: "Q33: How do you record a booking entry with TDS deduction in a Journal Voucher (F7)?")[
  *Answer:* In Journal Voucher (F7):
  - *Debit:* Expense Account (e.g., Audit Fees A/c ₹50,000)
  - *Credit:* Deductee / CA Firm Ledger (₹45,000 net payable)
  - *Credit:* TDS Payable under Section 194J A/c (₹5,000 statutory deduction).
  Tally auto-generates the TDS deduction bill reference.
]

#v(5pt)

#tds-box(title: "Q34: How is TDS deposited with the government via Net Banking using Challan ITNS 281?")[
  *Answer:* Go to the Protean (NSDL) / Income Tax portal, select *Challan ITNS 281*, choose Major Head (0020 for Companies, 0021 for Non-Companies), select Minor Head (200 for normal deduction), enter TAN, select Assessment Year, enter section code (e.g., 94J), pay via Net Banking, and record the CIN (Challan Identification Number) and BSR code in Tally.
]

#v(5pt)

#tds-box(title: "Q35: What is the difference between Form 24Q and Form 26Q?")[
  *Answer:*
  - *Form 24Q:* Quarterly return for TDS deducted on *Salaries* (Section 192). It includes Annexure I (deductee-wise details) and Annexure II (annual salary computation in Q4).
  - *Form 26Q:* Quarterly return for all *Non-Salary* payments to resident Indians (Sections 194C, 194J, 194I, 194H, 194A).
]

#v(5pt)

#tds-box(title: "Q36: What is Form 16A and how does a deductor generate and issue it to deductees?")[
  *Answer:* Form 16A is the official quarterly TDS certificate issued to non-salary deductees proving tax deducted and deposited into the central treasury. Deductors download signed Form 16A text files directly from the TRACES portal after Form 26Q is accepted and issue them to payees within 15 days of the quarterly due date.
]

#v(5pt)

#tds-box(title: "Q37: What is the late filing fee under Section 234E and interest penalty under Section 201(1A)?")[
  *Answer:*
  - *Section 234E:* Late filing fee of *₹200 per day* for every day of delay until the quarterly return is filed, capped at the total TDS amount.
  - *Section 201(1A):* Interest at *1% per month* (or part of month) for delayed deduction of TDS from the date tax was deductible to actual deduction date, and *1.5% per month* for delayed payment from deduction date to actual deposit date.
]

#v(5pt)

#tds-box(title: "Q38: How do you record lower or nil TDS deduction under Section 197 in Tally Prime?")[
  *Answer:* When a payee obtains a lower/nil deduction certificate from the Assessing Officer under Section 197, open the Party Ledger Master in Tally, enable *Use Advanced TDS Entries = Yes*, enter the Certificate Number, valid period, and approved lower rate. Tally will automatically deduct TDS at the lower specified rate during voucher entry.
]

#v(10pt)

= Part 4: Corporate Audit, BRS, Inventory & Year-End Finalization (Q39 - Q50)

#warning-box(title: "Q39: How do you identify and resolve discrepancies in Bank Reconciliation (BRS)?")[
  *Answer:* Discrepancies arise from uncredited cheques, unpresented cheques, direct bank charges, or automated ECS debits. In Tally Prime, navigate to *Banking -> Bank Reconciliation*, input the *Bank Date* against each cleared cheque, and verify that the *Balance as per Company Books* reconciles to the *Balance as per Bank Statement* with zero difference.
]

#v(5pt)

#warning-box(title: "Q40: What steps are mandatory before closing financial books on 31st March?")[
  *Answer:*
  1. Pass depreciation entries on all Fixed Assets as per Companies Act / IT Act.
  2. Provide for outstanding expenses (March salaries, electricity, audit fees).
  3. Defer unexpired prepaid expenses (insurance, software annual licenses).
  4. Reconcile GST ITC in books with annual GSTR-2B.
  5. Conduct physical inventory verification and pass stock adjustments via Physical Stock voucher (#key-pill("Ctrl + F7")).
  6. Split Company Data or create a new FY company in Tally to roll balances forward.
]

#v(5pt)

#warning-box(title: "Q41: What is the difference between Trade Discount and Cash Discount in Tally Prime?")[
  *Answer:*
  - *Trade Discount:* Allowed at the time of purchase/sale to encourage volume buying. It is deducted directly from the gross catalogue price and is *not recorded in a separate ledger account*. In Tally, enable *Use Discount Column in Invoices* in F11.
  - *Cash Discount:* Offered to incentivize prompt payment within credit terms. It is recorded as a separate ledger (*Discount Allowed* under Indirect Expenses or *Discount Received* under Indirect Incomes) via Journal (F7) or Receipt/Payment vouchers.
]

#v(5pt)

#warning-box(title: "Q42: What is the function of Cost Centres and Cost Categories, and when are they used?")[
  *Answer:* *Cost Categories* and *Cost Centres* allow businesses to allocate income and expenses across branches, departments, sales executives, or construction projects without multiplying ledger accounts. For example, a single *Travelling Expense* ledger entry can be proportionally allocated to *Ahmedabad Branch*, *Surat Branch*, and *Palanpur Branch* cost centres.
]

#v(5pt)

#warning-box(title: "Q43: How do you handle Inter-Godown Stock Transfers using a Stock Journal (Alt+F7)?")[
  *Answer:* Open Stock Journal (`Alt + F7`). On the left pane (*Source / Consumption*), select the godown from which stock is being dispatched, item name, quantity, and rate. On the right pane (*Destination / Production*), select the receiving godown, item name, quantity, and rate. Saving the voucher transfers physical inventory instantly without impacting the financial P&L.
]

#v(5pt)

#warning-box(title: "Q44: What is Bill of Materials (BOM) in Tally Prime, and how is it used in Manufacturing concerns?")[
  *Answer:* A *Bill of Materials (BOM)* defines the standard recipe of raw materials, components, and labor required to manufacture one unit of a finished product. In manufacturing businesses (e.g., Morbi ceramic tiles or PC assembly), selecting the finished good in a Manufacturing Journal auto-populates the exact required raw materials from the warehouse.
]

#v(5pt)

#warning-box(title: "Q45: How do you verify arithmetical accuracy and resolve mismatches in the Trial Balance?")[
  *Answer:* Navigate to *Gateway of Tally -> Display More Reports -> Trial Balance*. If Total Debit does not equal Total Credit, Tally creates a *Diff in Opening Balances* line under Suspense Account. Check for one-sided opening balance entries, investigate unclassified ledgers, and verify foreign currency exchange differences.
]

#v(5pt)

#warning-box(title: "Q46: What is the difference between Depreciation under the Companies Act vs Income Tax Act?")[
  *Answer:*
  - *Companies Act 2013:* Computed based on the useful life of the asset (Straight Line Method - SLM or Written Down Value - WDV) and debited to the statutory Profit & Loss account.
  - *Income Tax Act 1961:* Computed on the *Block of Assets* concept at statutory block rates (e.g., Computers 40%, Plant & Machinery 15%) under Section 32 using WDV method for tax assessment.
]

#v(5pt)

#warning-box(title: "Q47: How does Tally Prime handle security levels, user roles, and Tally Vault encryption?")[
  *Answer:* In `Alt + K` (Company Menu) -> *User Roles & Users*, administrators can create role-based profiles (e.g., Data Entry Operator, Auditor). Permissions can be restricted to specific voucher types or reports. *Tally Vault* provides AES-256 standard encryption, disguising the company name in the company selection list as a numeric ID (e.g., `Company 10005`).
]

#v(5pt)

#warning-box(title: "Q48: How do you perform Company Data Splitting at the beginning of a new financial year?")[
  *Answer:* Press `Alt + Y` (Data Menu) -> *Split -> Verify Company Data* to test for errors. Once validated, select *Split Data*, choose the split date (e.g., `01-Apr-2027`). Tally creates two separate companies: one containing historic data and the second starting with verified closing balances rolled forward as opening balances.
]

#v(5pt)

#warning-box(title: "Q49: What is the procedure for taking automated backups (Alt+Y) and restoring data in Tally?")[
  *Answer:* Press `Alt + Y` (Data) -> *Backup*. Select the Destination Path (e.g., external drive or cloud sync folder) and select the companies to back up. Tally compiles the data into compressed `.TBK` archive files. To recover data, navigate to `Alt + Y` -> *Restore*, point to the backup directory, and restore the company database.
]

#v(5pt)

#warning-box(title: "Q50: How do you export Tally reports to Excel/PDF and configure email dispatch directly from Tally?")[
  *Answer:*
  - *Export (Alt+E):* Press Alt+E -> *Current*, select File Format (*PDF*, *Excel Spreadsheet*, *XML*, *CSV*), configure destination path, and export formatted reports.
  - *Email (Alt+M):* Configure corporate SMTP settings (Host: `smtp.gmail.com`, Port: 465/587, SSL = Yes), enter sender and recipient email addresses, and dispatch password-protected invoice PDFs directly to clients from the voucher screen.
]

#pagebreak()
#rtech-final-page(lang: "en", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")
