#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#set document(
  title: "Tally Prime Advanced TDS & Form 26Q Practice Workbook",
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
          [#text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB] #text(size: 8pt, fill: rgb("#0E7490"), weight: "bold")[ | Advanced TDS & Form 26Q Practice Workbook]],
          [#text(size: 7.5pt, fill: rgb("#64748B"))[Statutory Tax Compliance · Rahul Patel (IANT Palanpur)]]
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
          [#text(size: 6.8pt, fill: rgb("#64748B"))[#text(fill: rgb("#059669"))[●] Sections 194C, 194J, 194I, 194H, 194Q · Challan ITNS 281 & Form 26Q]],
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#64748B"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p])]
        )
      ]
    }
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 8.5pt, fill: rgb("#1E293B"))
#set par(justify: true, leading: 0.52em)

// ==================== COVER BLOCK ====================
#align(center)[
  #v(15pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), radius: 4pt, inset: (x: 10pt, y: 4pt), text(size: 8pt, weight: "bold", fill: rgb("#1D4ED8"))[CORPORATE TAXATION & STATUTORY AUDIT SERIES])
  #v(10pt)
  #text(size: 22pt, weight: "black", fill: rgb("#0F172A"))[ADVANCED TDS & FORM 26Q WORKBOOK]
  #v(4pt)
  #text(size: 12pt, weight: "bold", fill: rgb("#0E7490"))[Live Field Practice Set: Sections 194C, 194J, 194I, 194H, 194Q & Challan 281]
  #v(6pt)
  #text(size: 8.8pt, fill: rgb("#475569"))[Corporate Booking via Journal (F7) · Challan ITNS 281 Bank Payment (F5) · Form 26Q NSDL Return Preparation]
  #v(10pt)
  #line(length: 60%, stroke: 1.5pt + rgb("#0E7490"))
  #v(6pt)
  #text(size: 9.5pt, weight: "bold", fill: rgb("#0F172A"))[Author: Rahul Patel] #text(size: 8.5pt, fill: rgb("#64748B"))[(IANT Palanpur Lead Accounting Trainer & Founder, RTechLab)]
]

#v(14pt)

= Part 1: Statutory TDS Thresholds & Rates Master Reference

#table(
  columns: (1fr, 2fr, 1.4fr, 1.4fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[Section]], [#text(weight: "bold", fill: white)[Nature of Commercial Payment]], [#text(weight: "bold", fill: white)[Threshold Limit]], [#text(weight: "bold", fill: white)[Individual / HUF]], [#text(weight: "bold", fill: white)[Company / Firm]],
  [Section 194C], [Contractors & Transport Sub-contractors], [₹30,000 (Single) / ₹1,00,000 (FY)], [1.00%], [2.00%],
  [Section 194J(a)], [Professional Fees (CA, Legal, Medical, Architect)], [₹30,000 per FY], [10.00%], [10.00%],
  [Section 194J(b)], [Technical Services & Royalty Payments], [₹30,000 per FY], [2.00%], [2.00%],
  [Section 194I(a)], [Rent of Plant, Machinery or Industrial Equipment], [₹2,40,000 per FY], [2.00%], [2.00%],
  [Section 194I(b)], [Rent of Land, Commercial Building or Furniture], [₹2,40,000 per FY], [10.00%], [10.00%],
  [Section 194H], [Commission, Brokerage or Consignment Charges], [₹15,000 per FY], [5.00%], [5.00%],
  [Section 194Q], [TDS on Purchase of Goods exceeding ₹50 Lakhs], [₹50,00,000 per FY], [0.10%], [0.10%],
  [Section 206AA], [Higher Rate for Non-Furnishing of Valid PAN], [No Threshold], [Flat 20.00%], [Flat 20.00%]
)

#v(10pt)

= Part 2: 10 Comprehensive Real-World TDS Case Scenarios

#tds-box(title: "CASE SCENARIO 01: SECTION 194J PROFESSIONAL FEES (CA AUDIT BILL)")[
  *Scenario:* On 15-May-2026, RTechLab Commercial Enterprises Ltd receives a bill of ₹1,50,000 + 18% GST (CGST ₹13,500 + SGST ₹13,500 = ₹1,77,000) from CA Rahul Mehta & Associates for annual statutory audit.\
  *Statutory Rule:* Under Section 194J, TDS @ 10% is deducted *only on the basic professional fee* (₹1,50,000), NOT on the GST portion!\
  *TDS Amount:* ₹1,50,000 x 10% = *₹15,000.00*.\
  *Tally Prime Journal Entry (F7):*\
  - Dr. `Audit Fees A/c` (Indirect Expenses) -> ₹1,50,000.00\
  - Dr. `CGST Input Tax Credit` (Duties & Taxes) -> ₹13,500.00\
  - Dr. `SGST Input Tax Credit` (Duties & Taxes) -> ₹13,500.00\
  - Cr. `CA Rahul Mehta & Associates` (Sundry Creditors) -> ₹1,62,000.00\
  - Cr. `TDS on Professional Fees 194J` (Duties & Taxes) -> ₹15,000.00
]

#v(8pt)

#tds-box(title: "CASE SCENARIO 02: SECTION 194I COMMERCIAL BUILDING RENT")[
  *Scenario:* On 01-Jun-2026, the company credits monthly office rent of ₹50,000 to building owner Shri Shanti Swaroop Patel (Annual Rent = ₹6,00,000, exceeding ₹2,40,000 threshold).\
  *TDS Calculation:* ₹50,000 x 10% = *₹5,000.00*.\
  *Tally Prime Journal Entry (F7):*\
  - Dr. `Office Rent Expense` (Indirect Expenses) -> ₹50,000.00\
  - Cr. `Shri Shanti Swaroop Patel` (Sundry Creditors) -> ₹45,000.00\
  - Cr. `TDS on Rent 194I` (Duties & Taxes) -> ₹5,000.00
]

#v(8pt)

#tds-box(title: "CASE SCENARIO 03: SECTION 194C TRANSPORT CONTRACTOR")[
  *Scenario:* On 20-Jun-2026, Gujarat Roadlines Logistics submits a transportation freight bill of ₹80,000 (Corporate Transporter).\
  *TDS Calculation:* As a Private Limited company, TDS rate is 2%: ₹80,000 x 2% = *₹1,600.00*.\
  *Tally Prime Journal Entry (F7):*\
  - Dr. `Freight Inward / Transport Exp` (Direct Expenses) -> ₹80,000.00\
  - Cr. `Gujarat Roadlines Logistics` (Sundry Creditors) -> ₹78,400.00\
  - Cr. `TDS on Contractors 194C` (Duties & Taxes) -> ₹1,600.00
]

#pagebreak()

= Part 3: Bank Payment via Challan ITNS 281 & Form 26Q Quarterly Return

#concept-box(title: "TDS REMITTANCE WORKFLOW VIA CHALLAN ITNS 281")[
  1. *Due Date:* By the 7th of the following month (e.g. May TDS must be paid by 7th June).\
  2. *Voucher Type in Tally Prime:* Payment Voucher (#key-pill("F5")).\
  3. *Statutory Payment Helper:* Press #key-pill("Ctrl + F") -> Select *Statutory Payment* -> Type of Duty: `TDS` -> Period: `1-May-2026 to 31-May-2026` -> Section: `194J` -> Nature of Payment: `Fees for Professional/Technical Services`.\
  4. *Accounting Entry:*\
     - Dr. `TDS on Professional Fees 194J` -> ₹15,000.00\
     - Cr. `HDFC Bank Current A/c` -> ₹15,000.00\
  5. *Challan Details Prompt:* Enter BSR Code (e.g., `0510012`), Challan No (`00492`), Cheque No (`102934`), and Payment Date (`06-Jun-2026`).
]

#v(10pt)

#concept-box(title: "PREPARING & AUDITING FORM 26Q QUARTERLY RETURN")[
  1. *Navigate:* `Gateway of Tally -> Display More Reports -> Statutory Reports -> TDS Reports -> Form 26Q`.\
  2. *Verification Checklist:*\
     - *Included Transactions:* All journal entries where TDS was deducted must show under Included.\
     - *Uncertain Transactions (Corrections Needed):* Must be ZERO! If any show here, it indicates missing deductee PAN, invalid TAN, or unmapped Nature of Payment.\
     - *Deduction at Normal Rate vs Lower/Higher Rate:* Reconcile with PAN master.\
  3. *Exporting e-TDS Text File:* Press #key-pill("Alt + E") -> Export e-TDS file. Validate using NSDL File Validation Utility (FVU) for error-free portal submission!
]

#pagebreak()
#rtech-final-page(lang: "en", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")
