#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#64748B"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p])]
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
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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
