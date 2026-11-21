# -*- coding: utf-8 -*-
"""
Tally Prime Top 50 Interview Vault & Career Salary Blueprint Generators
100% Light Theme · No Dark Backgrounds
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
"""

def generate_vault_typst():
    typ = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#set document(
  title: "Tally Prime Top 50 Corporate Accountant Interview Vault",
  author: "Rahul Patel"
)

#set page(
  paper: "a4",
  margin: (x: 12mm, top: 16mm, bottom: 14mm),
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
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#CBD5E1"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p])]
        )
      ]
    }
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 8.5pt, fill: rgb("#1E293B"))
#set par(justify: true, leading: 0.52em)

// ==================== COVER BLOCK (LIGHT THEME) ====================
#align(center)[
  #v(15pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), radius: 4pt, inset: (x: 10pt, y: 4pt), text(size: 8pt, weight: "bold", fill: rgb("#1D4ED8"))[CORPORATE CAREER ACCELERATOR SERIES])
  #v(10pt)
  #text(size: 22pt, weight: "black", fill: rgb("#0F172A"))[TOP 50 CORPORATE ACCOUNTANT INTERVIEW VAULT]
  #v(4pt)
  #text(size: 12pt, weight: "bold", fill: rgb("#0E7490"))[High-Yield Questions & Practical Field Answers for Tally & Tax Interviews]
  #v(6pt)
  #text(size: 8.8pt, fill: rgb("#475569"))[Tested at Big-4 Firms, Tier-1 Manufacturing, FMCG Giants & Top Chartered Accountancy Practices]
  #v(10pt)
  #line(length: 60%, stroke: 1.5pt + rgb("#0E7490"))
  #v(6pt)
  #text(size: 9.5pt, weight: "bold", fill: rgb("#0F172A"))[Curated by: Rahul Patel] #text(size: 8.5pt, fill: rgb("#64748B"))[(IANT Palanpur & RTechLab)]
]

#v(14pt)

= Part 1: Core Tally Prime Architecture & Accounting (Q01 - Q12)

#concept-box(title: "Q01: What is the primary difference between Tally.ERP 9 and Tally Prime?")[
  *Answer:* Tally Prime introduced a redesigned top-bar navigation system (`Go To` - Alt+G), seamless multi-tasking (opening reports while keeping an unsaved voucher active), a unified single-window installer, enhanced print/export previewing, support for mouse operations, and direct API-driven integration for e-Invoicing and e-Way bills without third-party plugins.
]

#v(6pt)

#concept-box(title: "Q02: What are the 28 predefined groups in Tally Prime, and why is their classification critical?")[
  *Answer:* Tally Prime features 15 Primary Groups (9 Balance Sheet, 6 P&L) and 13 Secondary Groups. Their classification is critical because Tally automatically generates statutory financial statements based strictly on group hierarchy. A ledger classified under *Sundry Creditors* reports to Current Liabilities on the Balance Sheet; if mistakenly classified under *Direct Expenses*, it distorts Cost of Goods Sold and Gross Profit!
]

#v(6pt)

#concept-box(title: "Q03: Explain the 4 bill-wise reference types available in Sundry Debtors & Creditors.")[
  *Answer:*
  1. *New Ref:* Assigned when issuing a new sales or purchase invoice.
  2. *Agst Ref (Against Reference):* Selected during receipt or payment to settle a specific prior bill number, maintaining clear age-wise outstanding balances.
  3. *Advance:* Used when cash/bank is received or paid prior to invoice generation.
  4. *On Account:* Used for lump-sum transfers where the payer does not specify invoice linkage.
]

#v(6pt)

#concept-box(title: "Q04: When do you use Contra Voucher (F4) versus Journal Voucher (F7)?")[
  *Answer:* *Contra (F4)* is strictly reserved for internal cash and bank transfers (Cash to Bank deposit, Bank cash withdrawal, or Inter-bank transfer) with zero third-party impact. *Journal (F7)* is used for all non-cash adjustments (depreciation, accruals, bad debts, credit purchases of fixed assets, and TDS booking).
]

#v(6pt)

#concept-box(title: "Q05: How does Tally Prime handle Negative Cash and Negative Stock warnings?")[
  *Answer:* When cash payouts exceed recorded cash-in-hand, or when sales quantities exceed available godown stock, Tally triggers a high-visibility red warning prompt. In corporate audit, negative cash indicates unrecorded cash inflows or delayed ledger postings, while negative stock indicates billing before inward receipt notes are processed.
]

#pagebreak()

= Part 2: GST Statutory Compliance & Portal Audit (Q13 - Q25)

#gst-box(title: "Q13: Explain the destination-based principle of GST and how Tally determines CGST/SGST vs IGST.")[
  *Answer:* GST is levied where goods or services are consumed (*Place of Supply*). Tally Prime compares the *Company State Code* (e.g., Gujarat 24) with the *Party State Code*:
  - If Party State == 24 (Intrastate) -> CGST (50%) + SGST (50%) are applied.
  - If Party State != 24 (Interstate e.g., Maharashtra 27) -> IGST (100%) is applied automatically.
]

#v(6pt)

#gst-box(title: "Q14: What are the current primary GST slabs and how do you configure them in Tally?")[
  *Answer:* Under current rationalization, the three primary workhorse slabs are:
  - *0% (Exempt):* Unbranded APMC agricultural commodities, fresh milk, vegetables, basic healthcare/education.
  - *5% (Essentials):* Packaged edible oils, domestic transport, basic footwear under ₹1,000, medicines.
  - *18% (Standard):* IT hardware, smartphones, consumer electronics, professional services, software.
  *Configuration:* Tax rates should be defined at the *Stock Item Master* level with proper HSN codes. Statutory tax ledgers (`CGST`, `SGST`, `IGST`) must remain set to `0%` in their masters so Tally auto-computes the tax based on the item line!
]

#v(6pt)

#gst-box(title: "Q15: What is the difference between GSTR-1, GSTR-3B, and GSTR-2B?")[
  *Answer:*
  - *GSTR-1:* Monthly/quarterly statement of *Outward Supplies (Sales)* filed by the seller.
  - *GSTR-3B:* Monthly self-declared summary return for tax payment, offsetting output tax against eligible Input Tax Credit (ITC).
  - *GSTR-2B:* Auto-drafted, static ITC statement generated on the 14th of each month reflecting purchases uploaded by suppliers in their GSTR-1. Accountants must reconcile Tally purchase registers with GSTR-2B before claiming ITC!
]

#v(6pt)

#gst-box(title: "Q16: What is Blocked ITC under Section 17(5) of the CGST Act?")[
  *Answer:* Section 17(5) specifies purchases where input tax credit cannot be claimed even if used for business:
  1. Motor vehicles for passenger transport (capacity <= 13 persons, unless used for transportation business or driving school).
  2. Food and beverages, outdoor catering, health insurance, gym memberships.
  3. Goods lost, stolen, destroyed, written off, or disposed of as free gifts/samples.
  4. Works contract services for construction of immovable property (other than plant and machinery).
]

#v(6pt)

#gst-box(title: "Q17: How is an e-Way Bill generated in Tally Prime?")[
  *Answer:* In Tally Prime, set *Track e-Way Bill* = Yes in F11. For any consignment where the taxable value exceeds ₹50,000 (interstate) or state-specific threshold, Tally prompts for Transporter ID, Vehicle Number, and Distance. Users can directly export JSON for the NIC portal or generate the e-Way bill in real time via Tally's direct GSP integration.
]

#pagebreak()

= Part 3: TDS Compliance & Tax Audit (Q26 - Q38)

#tds-box(title: "Q26: What is the purpose of TDS and who is liable to deduct it?")[
  *Answer:* Tax Deducted at Source (TDS) ensures regular tax inflow to the government and minimizes tax evasion. Any business entity (whose turnover exceeded ₹1 Crore in the preceding FY) making payments exceeding statutory thresholds for contractors, rent, professional services, or commission must deduct TDS and possess a valid 10-digit *Tax Deduction Account Number (TAN)*.
]

#v(6pt)

#tds-box(title: "Q27: Compare Section 194C and Section 194J.")[
  *Answer:*
  - *Section 194C (Contractor Works):* Applies to physical contracts (transportation, advertising production, catering, security guards). Threshold: ₹30,000 single contract or ₹1,00,000 aggregate FY. Rate: *1%* for Individuals/HUF, *2%* for Companies.
  - *Section 194J (Professional / Technical Fees):* Applies to intellectual/technical services (CA audit fees, legal consultancy, IT development). Threshold: ₹30,000 per FY. Rate: *10%* for professional services; *2%* for technical services/call centres.
]

#v(6pt)

#tds-box(title: "Q28: What is the penalty under Section 206AA if a payee fails to provide PAN?")[
  *Answer:* Under Section 206AA, if the deductee fails to furnish a valid PAN to the deductor, TDS must be deducted at the higher of:
  1. The rate specified in the relevant Act provision, or
  2. *Flat 20% (Non-PAN Penalty Rate)*.
]

#v(6pt)

#tds-box(title: "Q29: Explain the due dates for TDS payment and quarterly return filing.")[
  *Answer:*
  - *Monthly Payment (Challan ITNS 281):* Due by the *7th of the following month* (except March TDS, which is due by *30th April*).
  - *Quarterly Returns (Form 26Q / 24Q):* Q1 (Apr-Jun) due 31st July; Q2 (Jul-Sep) due 31st October; Q3 (Oct-Dec) due 31st January; Q4 (Jan-Mar) due 31st May. Late filing attracts a fee of ₹200/day under Section 234E!
]

#pagebreak()

= Part 4: Advanced Audit, BRS & Year-End Finalization (Q39 - Q50)

#warning-box(title: "Q39: How do you identify and resolve discrepancies in Bank Reconciliation (BRS)?")[
  *Answer:* Discrepancies arise from uncredited cheques, unpresented cheques, direct bank charges, or automated ECS debits. In Tally Prime, navigate to *Banking -> Bank Reconciliation*, input the *Bank Date* against each cleared cheque, and verify that the *Balance as per Company Books* reconciles to the *Balance as per Bank Statement* with zero difference.
]

#v(6pt)

#warning-box(title: "Q40: What steps are mandatory before closing financial books on 31st March?")[
  *Answer:*
  1. Pass depreciation entries on all Fixed Assets as per Companies Act / IT Act.
  2. Provide for outstanding expenses (March salaries, electricity, audit fees).
  3. Defer unexpired prepaid expenses (insurance, software annual licenses).
  4. Reconcile GST ITC in books with annual GSTR-2B.
  5. Conduct physical inventory verification and pass stock adjustments via Physical Stock voucher (#key-pill("Ctrl + F7")).
  6. Split Company Data or create a new FY company in Tally to roll balances forward.
]

#v(6pt)

#warning-box(title: "Q41: What is the difference between Trade Discount and Cash Discount in Tally Prime?")[
  *Answer:*
  - *Trade Discount:* Allowed at the time of purchase/sale to encourage volume buying. It is deducted directly from the gross catalogue price and is *not recorded in a separate ledger account*. In Tally, enable *Use Discount Column in Invoices* in F11.
  - *Cash Discount:* Offered to incentivize prompt payment within credit terms. It is recorded as a separate ledger (*Discount Allowed* under Indirect Expenses or *Discount Received* under Indirect Incomes) via Journal (F7) or Receipt/Payment vouchers.
]

#pagebreak()
#rtech-final-page(lang: "en", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")
"""
    return typ

def generate_blueprint_typst():
    typ = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#set document(
  title: "Tally Corporate Accountant Career & Salary Blueprint",
  author: "Rahul Patel"
)

#set page(
  paper: "a4",
  margin: (x: 12mm, top: 16mm, bottom: 14mm),
  fill: white,
  header: context {
    let p = counter(page).get().first()
    if p > 1 {
      block(width: 100%, stroke: (bottom: 0.5pt + rgb("#CBD5E1")), inset: (bottom: 2mm))[
        #grid(
          columns: (1fr, 1fr),
          align: (left, right),
          [#text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB] #text(size: 8pt, fill: rgb("#0E7490"), weight: "bold")[ | Corporate Accountant Career & Salary Blueprint]],
          [#text(size: 7.5pt, fill: rgb("#64748B"))[Career Roadmap · Rahul Patel (IANT Palanpur)]]
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
          [#text(size: 6.8pt, fill: rgb("#64748B"))[#text(fill: rgb("#059669"))[●] Corporate Hierarchy, Salary Slabs, High-Income Skills & Freelance Practice]],
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#CBD5E1"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p])]
        )
      ]
    }
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 8.5pt, fill: rgb("#1E293B"))
#set par(justify: true, leading: 0.52em)

// ==================== COVER BLOCK (LIGHT THEME) ====================
#align(center)[
  #v(15pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), radius: 4pt, inset: (x: 10pt, y: 4pt), text(size: 8pt, weight: "bold", fill: rgb("#1D4ED8"))[RTECHLAB CAREER ACCELERATOR BLUEPRINT])
  #v(10pt)
  #text(size: 22pt, weight: "black", fill: rgb("#0F172A"))[CORPORATE ACCOUNTANT CAREER & SALARY BLUEPRINT]
  #v(4pt)
  #text(size: 12pt, weight: "bold", fill: rgb("#059669"))[From Tally Operator to Chief Financial Controller & High-Income Freelance Consultant]
  #v(6pt)
  #text(size: 8.8pt, fill: rgb("#475569"))[Salary Benchmarks across Tier 1, 2, and 3 Hubs · Career Progression · High-Income Skills Matrix]
  #v(10pt)
  #line(length: 60%, stroke: 1.5pt + rgb("#0E7490"))
  #v(6pt)
  #text(size: 9.5pt, weight: "bold", fill: rgb("#0F172A"))[Author: Rahul Patel] #text(size: 8.5pt, fill: rgb("#64748B"))[(IANT Palanpur Lead Trainer & Founder, RTechLab)]
]

#v(14pt)

= 1. The Corporate Accounting Career Hierarchy & Salary Slabs

#table(
  columns: (1.2fr, 1.4fr, 1.2fr, 1.4fr, 2.2fr),
  fill: (col, row) => if row == 0 {{ rgb("#0E7490") }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[Career Stage]], [#text(weight: "bold", fill: white)[Corporate Designation]], [#text(weight: "bold", fill: white)[Experience]], [#text(weight: "bold", fill: white)[Salary Range (INR)]], [#text(weight: "bold", fill: white)[Core Expected Responsibilities]],
  [Tier 1: Entry], [Junior Accounts Executive / Tally Operator], [0 - 2 Years], [₹2,40,000 - ₹3,80,000 PA], [Daily voucher entry (Contra, Payment, Receipt), basic sales/purchase invoicing, bank deposit tracking, petty cash maintenance.],
  [Tier 2: Mid-Level], [Senior Tally & GST Accountant], [2 - 5 Years], [₹4,20,000 - ₹6,50,000 PA], [Multi-location inventory tracking, GSTR-1 & GSTR-3B filing, monthly BRS reconciliation, TDS deduction & challan 281 payments.],
  [Tier 3: Lead], [Assistant Finance Manager / Tax Supervisor], [5 - 8 Years], [₹7,00,000 - ₹10,50,000 PA], [Balance Sheet finalization, statutory audit facilitation, working capital forecasting, GSTR-9 annual return, departmental tax hearings.],
  [Tier 4: Executive], [Chief Financial Officer (CFO) / Controller], [8+ Years], [₹12,00,000 - ₹24,00,000+ PA], [Overall financial strategy, treasury management, banking consortium limits, corporate tax planning, Board of Directors reporting.]
)

#v(10pt)

= 2. The High-Income Freelance Accounting Practice Blueprint
In regions like Gujarat, Maharashtra, and Rajasthan, thousands of MSME manufacturing units, APMC mandi traders, and retail chains prefer outsourcing accounting to certified independent practitioners:

#concept-box(title: "HOW TO BUILD A ₹1,00,000+/MONTH FREELANCE TALLY PRACTICE")[
  - *Target Client Profile:* 15 to 25 local trading concerns, ceramic units, APMC merchants, or retail shops.
  - *Monthly Retainer Pricing:* Charge ₹3,500 to ₹7,500/month per business for:
    1. Weekly Tally Prime data entry and voucher audit.
    2. Monthly GSTR-1 and GSTR-3B filing.
    3. Monthly Bank Reconciliation Statement (BRS).
    4. Quarterly TDS Return (Form 26Q) and Challan 281 compliance.
  - *Math to ₹1,00,000/Month:*
    $ 20 "Clients" times ₹5,000 "Average Retainer" = bold("₹1,00,000 per Month Net Retainer Income!") $
  - *Tools Required:* 1 Core i5/i7 Laptop, Tally Prime Gold/Silver License, Excel Power Query, and RTechLab Master Guides for reference.
]

#v(10pt)

= 3. Essential Resume & Portfolio Checklist for Top Hiring
To stand out among thousands of applicants, ensure your resume highlights:
1. *Tally Prime 4.x / 5.x Mastery:* Multi-location godowns, bill-wise tracking, batch-wise expiry.
2. *Statutory Tax Practicality:* Verified hands-on filing experience for GSTR-1, GSTR-3B, and GSTR-2B reconciliation.
3. *Direct TDS Experience:* Practical knowledge of Sections 194C, 194J, 194I, Challan 281, and Form 26Q.
4. *Year-End Audit Readiness:* Ability to pass 31st March adjustment entries, depreciation, and company data splitting.
5. *Institutional Certification:* Backed by IANT Palanpur and RTechLab's Certified Master Accounting credential.

#pagebreak()
#rtech-final-page(lang: "en", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")
"""
    return typ
