#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#set document(
  title: "Tally Prime 50-Invoice Commercial Mega-Workbook",
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
          [#text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB] #text(size: 8pt, fill: rgb("#0E7490"), weight: "bold")[ | 50 Commercial Tax Invoices Workbook]],
          [#text(size: 7.5pt, fill: rgb("#64748B"))[Practical Accounting Series · Rahul Patel (IANT Palanpur)]]
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
          [#text(size: 6.8pt, fill: rgb("#64748B"))[#text(fill: rgb("#059669"))[●] Real Commercial Tax Invoices · APMC Mandi, Electronics B2B, Interstate IGST & TDS]],
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#64748B"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p])]
        )
      ]
    }
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 8.2pt, fill: rgb("#1E293B"))
#set par(justify: true, leading: 0.52em)

// ==================== WORKBOOK COVER (100% LIGHT THEME) ====================
#align(center)[
  #v(15pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), radius: 4pt, inset: (x: 10pt, y: 4pt), text(size: 8pt, weight: "bold", fill: rgb("#1D4ED8"))[OFFICIAL RTECHLAB & IANT PALANPUR PRACTICE SUITE])
  #v(10pt)
  #text(size: 24pt, weight: "black", fill: rgb("#0F172A"))[TALLY PRIME COMMERCIAL WORKBOOK]
  #v(4pt)
  #text(size: 13pt, weight: "bold", fill: rgb("#0E7490"))[50 Real-World Commercial Invoices & Practical Case Scenarios]
  #v(6pt)
  #text(size: 9pt, fill: rgb("#475569"))[APMC Agricultural Produce · Consumer Electronics · Multi-Rate B2B · Interstate IGST · TDS Deductions · Credit & Debit Notes]
  #v(10pt)
  #line(length: 60%, stroke: 1.5pt + rgb("#0E7490"))
  #v(8pt)
  #text(size: 9.5pt, weight: "bold", fill: rgb("#0F172A"))[Author: Rahul Patel] #text(size: 8.5pt, fill: rgb("#64748B"))[(Founder, RTechLab · Master Accounting Trainer, IANT Palanpur)]
]

#v(14pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 10pt,
  [
    #text(weight: "bold", size: 9.5pt, fill: rgb("#0F766E"))[HOW TO USE THIS PRACTICAL WORKBOOK IN YOUR TALLY LAB:]\
    1. *Create a New Practice Company in Tally Prime:* Set Company Name as `RTechLab Commercial Enterprises Ltd`, State as `Gujarat (24)`.\
    2. *Enable F11 Features:* Maintain Accounts = Yes, Bill-wise Details = Yes, Maintain Inventory = Yes, Enable GST = Yes (State: Gujarat 24).\
    3. *Execute Invoices Step-by-Step:* For each invoice, first create the Buyer/Seller Ledgers, Units of Measure, and Stock Items. Select the correct Voucher (#key-pill("F9") for Purchase, #key-pill("F8") for Sales, #key-pill("Alt + F6") for Credit Note, #key-pill("Alt + F5") for Debit Note).\
    4. *Verify Tax Accuracy:* In the voucher, verify that CGST, SGST, and IGST match the printed invoice totals to the exact paise.
  ]
)

#pagebreak()
= Part 1: APMC Agricultural Mandi Invoices (0% Exempt Commodities)

== Invoice 01: Commercial Tax Invoice — Purchase (Unbranded Machine Cleaned Jeera (Cumin))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Shree Ambica Agro Commodities*\
    APMC Market Yard, Unjha - 384170\
    *GSTIN:* 24AAFFA1234F1Z2 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/01 · *Date:* 04-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Unbranded Machine Cleaned Jeera (Cumin)], [1209], [50 Bags], [4,200.00], [2,10,000.00], [0%], [2,10,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹2,10,000.00*], [*0%*], [*₹2,10,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 01")[
  *Voucher Type:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Shree Ambica Agro Commodities` (Under: *Sundry Creditors*).\
  *Account Ledger:* `APMC Purchase Exempt (0%)` (Under: *Purchase Accounts*).\
  *Stock Item:* `Unbranded Machine Cleaned Jeera (Cumin)` (Under: *Agro Commodities*, HSN: `1209`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 02: Commercial Tax Invoice — Sales (Raw Natural Isabgol Seeds (Grade A))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Patan Organic Spices & Seeds*\
    Gunj Bazar, Patan - 384265\
    *GSTIN:* 24AACCP9876P1Z3 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/02 · *Date:* 05-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Raw Natural Isabgol Seeds (Grade A)], [1211], [100 Bags], [2,800.00], [2,80,000.00], [0%], [2,80,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹2,80,000.00*], [*0%*], [*₹2,80,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 02")[
  *Voucher Type:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Patan Organic Spices & Seeds` (Under: *Sundry Debtors*).\
  *Account Ledger:* `APMC Sales Exempt (0%)` (Under: *Sales Accounts*).\
  *Stock Item:* `Raw Natural Isabgol Seeds (Grade A)` (Under: *Agro Commodities*, HSN: `1211`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 03: Commercial Tax Invoice — Purchase (Fennel Seeds (Variyali Machine Cleaned))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Tharad Agro Producers Co-op*\
    APMC Yard, Tharad - 385565\
    *GSTIN:* 24AABCT5566T1Z8 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/03 · *Date:* 06-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Fennel Seeds (Variyali Machine Cleaned)], [0909], [80 Bags], [3,500.00], [2,80,000.00], [0%], [2,80,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹2,80,000.00*], [*0%*], [*₹2,80,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 03")[
  *Voucher Type:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Tharad Agro Producers Co-op` (Under: *Sundry Creditors*).\
  *Account Ledger:* `APMC Purchase Exempt (0%)` (Under: *Purchase Accounts*).\
  *Stock Item:* `Fennel Seeds (Variyali Machine Cleaned)` (Under: *Agro Commodities*, HSN: `0909`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 04: Commercial Tax Invoice — Sales (Castor Seeds (Divela Bold))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Deesa Grain & Oilseeds Syndicate*\
    Highway Road, Deesa - 385535\
    *GSTIN:* 24AABCD4433D1Z4 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/04 · *Date:* 07-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Castor Seeds (Divela Bold)], [1207], [60 Bags], [4,000.00], [2,40,000.00], [0%], [2,40,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹2,40,000.00*], [*0%*], [*₹2,40,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 04")[
  *Voucher Type:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Deesa Grain & Oilseeds Syndicate` (Under: *Sundry Debtors*).\
  *Account Ledger:* `APMC Sales Exempt (0%)` (Under: *Sales Accounts*).\
  *Stock Item:* `Castor Seeds (Divela Bold)` (Under: *Agro Commodities*, HSN: `1207`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 05: Commercial Tax Invoice — Purchase (Sesame Seeds (Til White Natural))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Dhanera Farmers Mandi*\
    Station Road, Dhanera - 385310\
    *GSTIN:* 24AAEFD3322D1Z1 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/05 · *Date:* 08-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Sesame Seeds (Til White Natural)], [1207], [40 Bags], [6,500.00], [2,60,000.00], [0%], [2,60,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹2,60,000.00*], [*0%*], [*₹2,60,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 05")[
  *Voucher Type:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Dhanera Farmers Mandi` (Under: *Sundry Creditors*).\
  *Account Ledger:* `APMC Purchase Exempt (0%)` (Under: *Purchase Accounts*).\
  *Stock Item:* `Sesame Seeds (Til White Natural)` (Under: *Agro Commodities*, HSN: `1207`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 06: Commercial Tax Invoice — Sales (Fenugreek Seeds (Methi Dana))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Ahmedabad Spices Wholesale Mart*\
    Kalupur Market, Ahmedabad - 380001\
    *GSTIN:* 24AAKPA8877A1Z9 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/06 · *Date:* 09-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Fenugreek Seeds (Methi Dana)], [0910], [70 Bags], [2,500.00], [1,75,000.00], [0%], [1,75,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹1,75,000.00*], [*0%*], [*₹1,75,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 06")[
  *Voucher Type:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Ahmedabad Spices Wholesale Mart` (Under: *Sundry Debtors*).\
  *Account Ledger:* `APMC Sales Exempt (0%)` (Under: *Sales Accounts*).\
  *Stock Item:* `Fenugreek Seeds (Methi Dana)` (Under: *Agro Commodities*, HSN: `0910`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 07: Commercial Tax Invoice — Purchase (Desi Chana (Whole Brown Gram))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Radhanpur Agriculture Produce Co*\
    Gunj Bazar, Radhanpur - 385340\
    *GSTIN:* 24AAXPR2211R1Z5 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/07 · *Date:* 10-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Desi Chana (Whole Brown Gram)], [0713], [120 Bags], [4,000.00], [4,80,000.00], [0%], [4,80,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹4,80,000.00*], [*0%*], [*₹4,80,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 07")[
  *Voucher Type:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Radhanpur Agriculture Produce Co` (Under: *Sundry Creditors*).\
  *Account Ledger:* `APMC Purchase Exempt (0%)` (Under: *Purchase Accounts*).\
  *Stock Item:* `Desi Chana (Whole Brown Gram)` (Under: *Agro Commodities*, HSN: `0713`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 08: Commercial Tax Invoice — Sales (Wheat Tukdi (Grade 1 Sharbati))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Surat Organic Food Hub*\
    Ring Road, Surat - 395002\
    *GSTIN:* 24AAOCS9988S1Z2 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/08 · *Date:* 11-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Wheat Tukdi (Grade 1 Sharbati)], [1001], [200 Bags], [2,600.00], [5,20,000.00], [0%], [5,20,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹5,20,000.00*], [*0%*], [*₹5,20,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 08")[
  *Voucher Type:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Surat Organic Food Hub` (Under: *Sundry Debtors*).\
  *Account Ledger:* `APMC Sales Exempt (0%)` (Under: *Sales Accounts*).\
  *Stock Item:* `Wheat Tukdi (Grade 1 Sharbati)` (Under: *Agro Commodities*, HSN: `1001`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 09: Commercial Tax Invoice — Purchase (Green Millet (Hybrid Bajra Seeds))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Mansa APMC Grain Merchants*\
    Market Yard, Mansa - 382845\
    *GSTIN:* 24AAGPM6655M1Z7 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/09 · *Date:* 12-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Green Millet (Hybrid Bajra Seeds)], [1008], [150 Bags], [2,200.00], [3,30,000.00], [0%], [3,30,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹3,30,000.00*], [*0%*], [*₹3,30,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 09")[
  *Voucher Type:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Mansa APMC Grain Merchants` (Under: *Sundry Creditors*).\
  *Account Ledger:* `APMC Purchase Exempt (0%)` (Under: *Purchase Accounts*).\
  *Stock Item:* `Green Millet (Hybrid Bajra Seeds)` (Under: *Agro Commodities*, HSN: `1008`, Taxability: *Exempt*).
]

#v(8pt)
== Invoice 10: Commercial Tax Invoice — Sales (Groundnut in Pods (HPS Bold))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Rajkot Oilseeds & Spices Exchange*\
    Danapith, Rajkot - 360001\
    *GSTIN:* 24AABCR1199R1Z3 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/APMC/10 · *Date:* 13-Apr-2026\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Groundnut in Pods (HPS Bold)], [1202], [90 Bags], [4,500.00], [4,05,000.00], [0%], [4,05,000.00],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹4,05,000.00*], [*0%*], [*₹4,05,000.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 10")[
  *Voucher Type:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Rajkot Oilseeds & Spices Exchange` (Under: *Sundry Debtors*).\
  *Account Ledger:* `APMC Sales Exempt (0%)` (Under: *Sales Accounts*).\
  *Stock Item:* `Groundnut in Pods (HPS Bold)` (Under: *Agro Commodities*, HSN: `1202`, Taxability: *Exempt*).
]

#v(8pt)
#pagebreak()
= Part 2: Consumer Electronics & IT Hardware Invoices (18% Standard GST)

== Invoice 11: Commercial Tax Invoice — Purchase (Vivo Y200e 5G Smartphone)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Shree Arbuda Electronics & Mobiles*\
    Station Road, Palanpur - 385001\
    *GSTIN:* 24ABCDF4321F1Z1 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/11 · *Date:* 13-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Vivo Y200e 5G Smartphone], [8517], [10 Nos], [16,000.00], [1,60,000.00], [14,400.00], [14,400.00], [1,88,800.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,60,000.00*], [*₹14,400.00*], [*₹14,400.00*], [*₹1,88,800.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 11")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹14,400.00) and 9% SGST (₹14,400.00).
]

#v(8pt)
== Invoice 12: Commercial Tax Invoice — Sales (Samsung 43-Inch 4K Smart LED TV)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Banaskantha Digital Hub*\
    College Road, Palanpur - 385001\
    *GSTIN:* 24AABCB1122B1Z6 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/12 · *Date:* 14-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Samsung 43-Inch 4K Smart LED TV], [8528], [5 Nos], [28,000.00], [1,40,000.00], [12,600.00], [12,600.00], [1,65,200.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,40,000.00*], [*₹12,600.00*], [*₹12,600.00*], [*₹1,65,200.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 12")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹12,600.00) and 9% SGST (₹12,600.00).
]

#v(8pt)
== Invoice 13: Commercial Tax Invoice — Purchase (HP 15s Intel Core i5 Laptop)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Gujarat Infotech Wholesale*\
    C.G. Road, Ahmedabad - 380009\
    *GSTIN:* 24AAACI5544I1Z8 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/13 · *Date:* 15-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [HP 15s Intel Core i5 Laptop], [8471], [8 Nos], [44,000.00], [3,52,000.00], [31,680.00], [31,680.00], [4,15,360.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹3,52,000.00*], [*₹31,680.00*], [*₹31,680.00*], [*₹4,15,360.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 13")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹31,680.00) and 9% SGST (₹31,680.00).
]

#v(8pt)
== Invoice 14: Commercial Tax Invoice — Sales (Lenovo ThinkCentre Desktop PC)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Ambaji Cyber Cafe & Xerox*\
    Temple Road, Ambaji - 385110\
    *GSTIN:* 24AAJPA6677A1Z3 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/14 · *Date:* 16-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Lenovo ThinkCentre Desktop PC], [8471], [4 Nos], [32,000.00], [1,28,000.00], [11,520.00], [11,520.00], [1,51,040.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,28,000.00*], [*₹11,520.00*], [*₹11,520.00*], [*₹1,51,040.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 14")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹11,520.00) and 9% SGST (₹11,520.00).
]

#v(8pt)
== Invoice 15: Commercial Tax Invoice — Purchase (Seagate 2TB External USB 3.0 HDD)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Palanpur Memory & Storage Corp*\
    Delhi Gate, Palanpur - 385001\
    *GSTIN:* 24AABCP8899P1Z5 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/15 · *Date:* 17-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Seagate 2TB External USB 3.0 HDD], [8471], [25 Nos], [4,200.00], [1,05,000.00], [9,450.00], [9,450.00], [1,23,900.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,05,000.00*], [*₹9,450.00*], [*₹9,450.00*], [*₹1,23,900.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 15")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹9,450.00) and 9% SGST (₹9,450.00).
]

#v(8pt)
== Invoice 16: Commercial Tax Invoice — Sales (Dell 24-Inch IPS Borderless Monitor)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Mehsana Computer Academy*\
    Modhera Road, Mehsana - 384002\
    *GSTIN:* 24AABCM3344M1Z2 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/16 · *Date:* 18-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Dell 24-Inch IPS Borderless Monitor], [8528], [12 Nos], [9,500.00], [1,14,000.00], [10,260.00], [10,260.00], [1,34,520.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,14,000.00*], [*₹10,260.00*], [*₹10,260.00*], [*₹1,34,520.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 16")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹10,260.00) and 9% SGST (₹10,260.00).
]

#v(8pt)
== Invoice 17: Commercial Tax Invoice — Purchase (D-Link 16-Port Gigabit Switch)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *TechConnect Networking Systems*\
    Ashram Road, Ahmedabad - 380014\
    *GSTIN:* 24AAACT7788T1Z4 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/17 · *Date:* 19-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [D-Link 16-Port Gigabit Switch], [8517], [15 Nos], [3,800.00], [57,000.00], [5,130.00], [5,130.00], [67,260.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹57,000.00*], [*₹5,130.00*], [*₹5,130.00*], [*₹67,260.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 17")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹5,130.00) and 9% SGST (₹5,130.00).
]

#v(8pt)
== Invoice 18: Commercial Tax Invoice — Sales (Canon imageCLASS Laser Printer)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Siddhpur Print Solutions*\
    Bindu Sarovar Road, Siddhpur - 384151\
    *GSTIN:* 24AABCS4455S1Z0 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/18 · *Date:* 20-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Canon imageCLASS Laser Printer], [8443], [6 Nos], [14,500.00], [87,000.00], [7,830.00], [7,830.00], [1,02,660.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹87,000.00*], [*₹7,830.00*], [*₹7,830.00*], [*₹1,02,660.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 18")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹7,830.00) and 9% SGST (₹7,830.00).
]

#v(8pt)
== Invoice 19: Commercial Tax Invoice — Purchase (Microtek 1000VA Line Interactive UPS)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Galaxy Power Solutions*\
    GIDC, Chhatral, Gandhinagar - 382729\
    *GSTIN:* 24AAACG9900G1Z1 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/19 · *Date:* 21-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Microtek 1000VA Line Interactive UPS], [8504], [20 Nos], [2,900.00], [58,000.00], [5,220.00], [5,220.00], [68,440.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹58,000.00*], [*₹5,220.00*], [*₹5,220.00*], [*₹68,440.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 19")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹5,220.00) and 9% SGST (₹5,220.00).
]

#v(8pt)
== Invoice 20: Commercial Tax Invoice — Sales (Apple iPhone 15 (128GB Black))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Palanpur Smart Devices*\
    Simla Gate, Palanpur - 385001\
    *GSTIN:* 24AABCP7766P1Z7 · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/ELEC/20 · *Date:* 22-Apr-2026\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Apple iPhone 15 (128GB Black)], [8517], [3 Nos], [65,000.00], [1,95,000.00], [17,550.00], [17,550.00], [2,30,100.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,95,000.00*], [*₹17,550.00*], [*₹17,550.00*], [*₹2,30,100.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 20")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹17,550.00) and 9% SGST (₹17,550.00).
]

#v(8pt)
#pagebreak()
= Part 3: Interstate B2B Trading Invoices (Integrated GST - IGST)

== Invoice 21: Commercial Interstate Invoice — Purchase (Marine Grade Plywood (18mm 8x4))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Ply King Timber Mart*\
    Pune, Maharashtra - 411002\
    *GSTIN:* 27AAHCP1122P1Z4 · *State:* Maharashtra (27)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/21 · *Date:* 20-Apr-2026\
    *Place of Supply:* Maharashtra (27) · *Tax Type:* Integrated GST (IGST 18%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Marine Grade Plywood (18mm 8x4)], [4412], [50 Sheets], [2,400.00], [1,20,000.00], [21,600.00], [1,41,600.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,20,000.00*], [*₹21,600.00*], [*₹1,41,600.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 21 (INTERSTATE IGST)")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Ply King Timber Mart` (State: *Maharashtra (27)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹21,600.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 22: Commercial Interstate Invoice — Sales (Cisco Catalyst 24-Port Switch)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Marwar Network Solutions*\
    Jaipur, Rajasthan - 302001\
    *GSTIN:* 08AABCM7788M1Z5 · *State:* Rajasthan (08)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/22 · *Date:* 21-Apr-2026\
    *Place of Supply:* Rajasthan (08) · *Tax Type:* Integrated GST (IGST 18%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Cisco Catalyst 24-Port Switch], [8517], [4 Nos], [28,000.00], [1,12,000.00], [20,160.00], [1,32,160.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,12,000.00*], [*₹20,160.00*], [*₹1,32,160.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 22 (INTERSTATE IGST)")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Marwar Network Solutions` (State: *Rajasthan (08)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹20,160.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 23: Commercial Interstate Invoice — Purchase (Polished Kota Blue Stone Slabs)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Kota Stone Natural Flooring*\
    Kota, Rajasthan - 324005\
    *GSTIN:* 08AAFCK3322K1Z9 · *State:* Rajasthan (08)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/23 · *Date:* 22-Apr-2026\
    *Place of Supply:* Rajasthan (08) · *Tax Type:* Integrated GST (IGST 5%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Polished Kota Blue Stone Slabs], [6802], [1,000 SqFt], [45.00], [45,000.00], [2,250.00], [47,250.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹45,000.00*], [*₹2,250.00*], [*₹47,250.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 23 (INTERSTATE IGST)")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Kota Stone Natural Flooring` (State: *Rajasthan (08)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹2,250.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 24: Commercial Interstate Invoice — Sales (Industrial Edge Computing Gateways)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Bangalore Tech Innovations*\
    Whitefield, Bangalore - 560066\
    *GSTIN:* 29AAACB4433B1Z2 · *State:* Karnataka (29)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/24 · *Date:* 23-Apr-2026\
    *Place of Supply:* Karnataka (29) · *Tax Type:* Integrated GST (IGST 18%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Industrial Edge Computing Gateways], [8471], [10 Nos], [18,500.00], [1,85,000.00], [33,300.00], [2,18,300.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,85,000.00*], [*₹33,300.00*], [*₹2,18,300.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 24 (INTERSTATE IGST)")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Bangalore Tech Innovations` (State: *Karnataka (29)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹33,300.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 25: Commercial Interstate Invoice — Purchase (Combed Cotton Knitting Yarn (30s))
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Mumbai Cotton Yarn Spinners*\
    Bhiwandi, Maharashtra - 421302\
    *GSTIN:* 27AAACM8877M1Z6 · *State:* Maharashtra (27)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/25 · *Date:* 24-Apr-2026\
    *Place of Supply:* Maharashtra (27) · *Tax Type:* Integrated GST (IGST 5%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Combed Cotton Knitting Yarn (30s)], [5205], [1,500 Kgs], [260.00], [3,90,000.00], [19,500.00], [4,09,500.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹3,90,000.00*], [*₹19,500.00*], [*₹4,09,500.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 25 (INTERSTATE IGST)")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Mumbai Cotton Yarn Spinners` (State: *Maharashtra (27)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹19,500.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 26: Commercial Interstate Invoice — Sales (Stainless Steel Seed Sorting Sieves)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Indore Agro Processing Corp*\
    Sanwer Road, Indore - 452015\
    *GSTIN:* 23AAACI9911I1Z4 · *State:* Madhya Pradesh (23)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/26 · *Date:* 25-Apr-2026\
    *Place of Supply:* Madhya Pradesh (23) · *Tax Type:* Integrated GST (IGST 18%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Stainless Steel Seed Sorting Sieves], [8437], [8 Units], [22,000.00], [1,76,000.00], [31,680.00], [2,07,680.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,76,000.00*], [*₹31,680.00*], [*₹2,07,680.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 26 (INTERSTATE IGST)")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Indore Agro Processing Corp` (State: *Madhya Pradesh (23)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹31,680.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 27: Commercial Interstate Invoice — Purchase (Commercial Interactive Touch Kiosks)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Delhi Digital Displays Inc*\
    Nehru Place, New Delhi - 110019\
    *GSTIN:* 07AAACD5566D1Z8 · *State:* Delhi (07)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/27 · *Date:* 26-Apr-2026\
    *Place of Supply:* Delhi (07) · *Tax Type:* Integrated GST (IGST 18%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Commercial Interactive Touch Kiosks], [8528], [4 Nos], [55,000.00], [2,20,000.00], [39,600.00], [2,59,600.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹2,20,000.00*], [*₹39,600.00*], [*₹2,59,600.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 27 (INTERSTATE IGST)")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Delhi Digital Displays Inc` (State: *Delhi (07)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹39,600.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 28: Commercial Interstate Invoice — Sales (Diamond Polishing Abrasive Bricks)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Udaipur Heritage Marble Emporium*\
    Sukher, Udaipur - 313001\
    *GSTIN:* 08AAACU1122U1Z3 · *State:* Rajasthan (08)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/28 · *Date:* 27-Apr-2026\
    *Place of Supply:* Rajasthan (08) · *Tax Type:* Integrated GST (IGST 18%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Diamond Polishing Abrasive Bricks], [6804], [500 Pcs], [180.00], [90,000.00], [16,200.00], [1,06,200.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹90,000.00*], [*₹16,200.00*], [*₹1,06,200.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 28 (INTERSTATE IGST)")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Udaipur Heritage Marble Emporium` (State: *Rajasthan (08)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹16,200.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 29: Commercial Interstate Invoice — Purchase (Aluminium Blister Packaging Foil)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Hyderabad Pharma Packaging*\
    Balanagar, Hyderabad - 500037\
    *GSTIN:* 36AAACH7744H1Z1 · *State:* Telangana (36)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/29 · *Date:* 28-Apr-2026\
    *Place of Supply:* Telangana (36) · *Tax Type:* Integrated GST (IGST 18%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Aluminium Blister Packaging Foil], [7607], [400 Kgs], [340.00], [1,36,000.00], [24,480.00], [1,60,480.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹1,36,000.00*], [*₹24,480.00*], [*₹1,60,480.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 29 (INTERSTATE IGST)")[
  *Voucher:* Purchase (F9) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Hyderabad Pharma Packaging` (State: *Telangana (36)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹24,480.00) and suppresses CGST/SGST.
]

#v(8pt)
== Invoice 30: Commercial Interstate Invoice — Sales (Heavy Duty Corrugated Shipping Cartons)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Party / Supplier:*\
    *Jaipur Handicrafts Exporters*\
    Sitapura, Jaipur - 302022\
    *GSTIN:* 08AAACJ4499J1Z0 · *State:* Rajasthan (08)
  ],
  [
    *Trading Counterpart:*\
    *RTechLab Commercial Enterprises Ltd*\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\
    *Invoice No:* RTL/IGST/30 · *Date:* 29-Apr-2026\
    *Place of Supply:* Rajasthan (08) · *Tax Type:* Integrated GST (IGST 12%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [Heavy Duty Corrugated Shipping Cartons], [4819], [2,000 Nos], [45.00], [90,000.00], [10,800.00], [1,00,800.00],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹90,000.00*], [*₹10,800.00*], [*₹1,00,800.00*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE 30 (INTERSTATE IGST)")[
  *Voucher:* Sales (F8) -> Item Invoice Mode (#key-pill("Ctrl + H")).\
  *Party Name:* `Jaipur Handicrafts Exporters` (State: *Rajasthan (08)*).\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹10,800.00) and suppresses CGST/SGST.
]

#v(8pt)
#pagebreak()
= Part 4: Composite Multi-Tax Invoices with Discounts (Invoices 31 - 38)

== Invoice 31: Multi-Rate Commercial Tax Invoice — Composite FMCG & Hardware Invoice
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Customer / Buyer:*\
    *Palanpur Mega Mart*\
    *GSTIN:* 24AABCP1199P1Z5 · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* RTL/COMP/31 · *Date:* 24-Apr-2026\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹68,200.00
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* 10 Bags Jeera (0%) + 5 Tins Oil (5%) + 2 Printers (18%)\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
== Invoice 32: Multi-Rate Commercial Tax Invoice — Agro Commodities & Fertilizers Invoice
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Customer / Buyer:*\
    *Banaskantha Farmers Society*\
    *GSTIN:* 24AAEFB2288B1Z7 · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* RTL/COMP/32 · *Date:* 24-Apr-2026\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹54,600.00
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* 20 Bags Wheat (0%) + 10 Bags Urea (5%) + 1 Sprayer Pump (18%)\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
== Invoice 33: Multi-Rate Commercial Tax Invoice — School Uniforms & Computer Lab Supplies
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Customer / Buyer:*\
    *Palanpur English Medium School*\
    *GSTIN:* 24AABCS8844S1Z1 · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* RTL/COMP/33 · *Date:* 24-Apr-2026\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹3,82,500.00
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* 50 Uniforms (5%) + 10 Desktop PCs (18%) + Notebooks (0%)\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
== Invoice 34: Multi-Rate Commercial Tax Invoice — Textile Fabrics & Industrial Dye Invoices
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Customer / Buyer:*\
    *Surat Weaving Mill Ltd*\
    *GSTIN:* 24AAACS3377S1Z0 · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* RTL/COMP/34 · *Date:* 24-Apr-2026\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹2,48,000.00
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* Cotton Yarn (5%) + Reactive Dyes (18%) + Grey Cotton (0%)\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
== Invoice 35: Multi-Rate Commercial Tax Invoice — Hospital Medical Equipment & Consumables
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Customer / Buyer:*\
    *Palanpur Civil Hospital Trust*\
    *GSTIN:* 24AAATP4411P1Z9 · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* RTL/COMP/35 · *Date:* 24-Apr-2026\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹4,12,000.00
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* Life Saving Drugs (5%) + Ultrasound Monitor (18%) + Cotton Gauze (0%)\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
== Invoice 36: Multi-Rate Commercial Tax Invoice — Automobile Spare Parts & Engine Lubricants
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Customer / Buyer:*\
    *Gujarat Motors Workshop*\
    *GSTIN:* 24AAACG6622G1Z3 · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* RTL/COMP/36 · *Date:* 24-Apr-2026\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹1,35,700.00
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* Engine Lubricant Oil (18%) + Rubber Fan Belts (18%) + Battery (18%)\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
== Invoice 37: Multi-Rate Commercial Tax Invoice — Restaurant Grocery & Kitchen Appliances
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Customer / Buyer:*\
    *Hotel Highway Palace*\
    *GSTIN:* 24AABCH7711H1Z6 · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* RTL/COMP/37 · *Date:* 24-Apr-2026\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹89,400.00
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* Basmati Rice (0%) + Refined Sunflower Oil (5%) + Commercial Microwave (18%)\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
== Invoice 38: Multi-Rate Commercial Tax Invoice — Dairy Farming Feed & Automated Milking Machinery
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 5pt,
  [
    *Customer / Buyer:*\
    *Banashree Dairy Farms*\
    *GSTIN:* 24AAEFB9944B1Z8 · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* RTL/COMP/38 · *Date:* 24-Apr-2026\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹1,98,000.00
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#64748B"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* Cattle Feed Chaff (0%) + Mineral Mixture (5%) + Vacuum Milking Pump (18%)\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
#pagebreak()
= Part 5: Professional Service Invoices with TDS & Returns (Invoices 39 - 50)

== Invoice 39: Professional Service Invoice with TDS — Section 194J (CA R.K. Mehta & Associates)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F0FDFA"),
  stroke: 0.5pt + rgb("#99F6E4"),
  inset: 5pt,
  [
    *Service Provider (Deductee):*\
    *CA R.K. Mehta & Associates*\
    *Service Description:* Statutory Audit & GST Annual Audit Fees
  ],
  [
    *Deductor:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* SRV/2026/39 · *TDS Section:* Section 194J\
    *TDS Rate:* 10% · *Challan Type:* ITNS 281
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Service Component]], [#text(weight: "bold", fill: white)[Gross Fee (₹)]], [#text(weight: "bold", fill: white)[TDS Deducted (₹)]], [#text(weight: "bold", fill: white)[Net Payable (₹)]],
  [Statutory Audit & GST Annual Audit Fees], [₹1,00,000.00], [₹10,000.00 (10%)], [₹90,000.00],
  [*Journal Entry (F7)*], [*Dr. Expense A/c ₹1,00,000.00*], [*Cr. TDS Payable ₹10,000.00*], [*Cr. Party A/c ₹90,000.00*]
)

#v(8pt)
== Invoice 40: Professional Service Invoice with TDS — Section 194I (Shree Balaji Commercial Real Estate)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F0FDFA"),
  stroke: 0.5pt + rgb("#99F6E4"),
  inset: 5pt,
  [
    *Service Provider (Deductee):*\
    *Shree Balaji Commercial Real Estate*\
    *Service Description:* Commercial Office Building Rent (Palanpur)
  ],
  [
    *Deductor:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* SRV/2026/40 · *TDS Section:* Section 194I\
    *TDS Rate:* 10% · *Challan Type:* ITNS 281
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Service Component]], [#text(weight: "bold", fill: white)[Gross Fee (₹)]], [#text(weight: "bold", fill: white)[TDS Deducted (₹)]], [#text(weight: "bold", fill: white)[Net Payable (₹)]],
  [Commercial Office Building Rent (Palanpur)], [₹40,000.00], [₹4,000.00 (10%)], [₹36,000.00],
  [*Journal Entry (F7)*], [*Dr. Expense A/c ₹40,000.00*], [*Cr. TDS Payable ₹4,000.00*], [*Cr. Party A/c ₹36,000.00*]
)

#v(8pt)
== Invoice 41: Professional Service Invoice with TDS — Section 194C (Gujarat Roadlines Logistics)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F0FDFA"),
  stroke: 0.5pt + rgb("#99F6E4"),
  inset: 5pt,
  [
    *Service Provider (Deductee):*\
    *Gujarat Roadlines Logistics*\
    *Service Description:* Heavy Transport Container Freight Charges
  ],
  [
    *Deductor:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* SRV/2026/41 · *TDS Section:* Section 194C\
    *TDS Rate:* 2% · *Challan Type:* ITNS 281
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Service Component]], [#text(weight: "bold", fill: white)[Gross Fee (₹)]], [#text(weight: "bold", fill: white)[TDS Deducted (₹)]], [#text(weight: "bold", fill: white)[Net Payable (₹)]],
  [Heavy Transport Container Freight Charges], [₹65,000.00], [₹1,300.00 (2%)], [₹63,700.00],
  [*Journal Entry (F7)*], [*Dr. Expense A/c ₹65,000.00*], [*Cr. TDS Payable ₹1,300.00*], [*Cr. Party A/c ₹63,700.00*]
)

#v(8pt)
== Invoice 42: Professional Service Invoice with TDS — Section 194C (Creative Vision Advertising Agency)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F0FDFA"),
  stroke: 0.5pt + rgb("#99F6E4"),
  inset: 5pt,
  [
    *Service Provider (Deductee):*\
    *Creative Vision Advertising Agency*\
    *Service Description:* Hoarding & Digital Billboard Media Production
  ],
  [
    *Deductor:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* SRV/2026/42 · *TDS Section:* Section 194C\
    *TDS Rate:* 2% · *Challan Type:* ITNS 281
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Service Component]], [#text(weight: "bold", fill: white)[Gross Fee (₹)]], [#text(weight: "bold", fill: white)[TDS Deducted (₹)]], [#text(weight: "bold", fill: white)[Net Payable (₹)]],
  [Hoarding & Digital Billboard Media Production], [₹85,000.00], [₹1,700.00 (2%)], [₹83,300.00],
  [*Journal Entry (F7)*], [*Dr. Expense A/c ₹85,000.00*], [*Cr. TDS Payable ₹1,700.00*], [*Cr. Party A/c ₹83,300.00*]
)

#v(8pt)
== Invoice 43: Professional Service Invoice with TDS — Section 194H (Shree Krishna Commercial Brokerage)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F0FDFA"),
  stroke: 0.5pt + rgb("#99F6E4"),
  inset: 5pt,
  [
    *Service Provider (Deductee):*\
    *Shree Krishna Commercial Brokerage*\
    *Service Description:* APMC Commodity Broking & Mandi Commission
  ],
  [
    *Deductor:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* SRV/2026/43 · *TDS Section:* Section 194H\
    *TDS Rate:* 5% · *Challan Type:* ITNS 281
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Service Component]], [#text(weight: "bold", fill: white)[Gross Fee (₹)]], [#text(weight: "bold", fill: white)[TDS Deducted (₹)]], [#text(weight: "bold", fill: white)[Net Payable (₹)]],
  [APMC Commodity Broking & Mandi Commission], [₹25,000.00], [₹1,250.00 (5%)], [₹23,750.00],
  [*Journal Entry (F7)*], [*Dr. Expense A/c ₹25,000.00*], [*Cr. TDS Payable ₹1,250.00*], [*Cr. Party A/c ₹23,750.00*]
)

#v(8pt)
== Invoice 44: Professional Service Invoice with TDS — Section 194J (CyberShield IT Systems Pvt Ltd)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#F0FDFA"),
  stroke: 0.5pt + rgb("#99F6E4"),
  inset: 5pt,
  [
    *Service Provider (Deductee):*\
    *CyberShield IT Systems Pvt Ltd*\
    *Service Description:* Enterprise ERP & Cloud Software Maintenance
  ],
  [
    *Deductor:*\
    *RTechLab Commercial Enterprises Ltd*\
    *Invoice No:* SRV/2026/44 · *TDS Section:* Section 194J\
    *TDS Rate:* 2% · *Challan Type:* ITNS 281
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Service Component]], [#text(weight: "bold", fill: white)[Gross Fee (₹)]], [#text(weight: "bold", fill: white)[TDS Deducted (₹)]], [#text(weight: "bold", fill: white)[Net Payable (₹)]],
  [Enterprise ERP & Cloud Software Maintenance], [₹1,20,000.00], [₹2,400.00 (2%)], [₹1,17,600.00],
  [*Journal Entry (F7)*], [*Dr. Expense A/c ₹1,20,000.00*], [*Cr. TDS Payable ₹2,400.00*], [*Cr. Party A/c ₹1,17,600.00*]
)

#v(8pt)
== Invoice 45: Credit Note (Alt + F6) — Sales Return (Shree Arbuda Electronics)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#FFFBEB"),
  stroke: 0.5pt + rgb("#FDE68A"),
  inset: 5pt,
  [
    *Party Name:*\
    *Shree Arbuda Electronics*\
    *Particulars:* 1 No Vivo Y200e Smartphone (Defective)
  ],
  [
    *Adjustment Reference:*\
    *Original Invoice No:* RTL/ELEC/11\
    *Voucher:* Credit Note (Alt + F6) · *Tax Impact:* Output/Input Tax Reversal
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reason for Adjustment]], [#text(weight: "bold", fill: white)[Taxable Value (₹)]], [#text(weight: "bold", fill: white)[GST Reversed (₹)]], [#text(weight: "bold", fill: white)[Total Adjustment (₹)]],
  [1 No Vivo Y200e Smartphone (Defective)], [₹16,000.00], [₹2,880.00], [₹18,880.00],
  [*Statutory Reporting*], [*Linked to RTL/ELEC/11*], [*Table 9B of GSTR-1*], [*ITC Adjusted in GSTR-3B*]
)

#v(8pt)
== Invoice 46: Credit Note (Alt + F6) — Rate Difference (Banaskantha Digital Hub)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#FFFBEB"),
  stroke: 0.5pt + rgb("#FDE68A"),
  inset: 5pt,
  [
    *Party Name:*\
    *Banaskantha Digital Hub*\
    *Particulars:* Post-sale Volume Turnover Rebate
  ],
  [
    *Adjustment Reference:*\
    *Original Invoice No:* RTL/ELEC/12\
    *Voucher:* Credit Note (Alt + F6) · *Tax Impact:* Output/Input Tax Reversal
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reason for Adjustment]], [#text(weight: "bold", fill: white)[Taxable Value (₹)]], [#text(weight: "bold", fill: white)[GST Reversed (₹)]], [#text(weight: "bold", fill: white)[Total Adjustment (₹)]],
  [Post-sale Volume Turnover Rebate], [₹10,000.00], [₹1,800.00], [₹11,800.00],
  [*Statutory Reporting*], [*Linked to RTL/ELEC/12*], [*Table 9B of GSTR-1*], [*ITC Adjusted in GSTR-3B*]
)

#v(8pt)
== Invoice 47: Credit Note (Alt + F6) — Sales Return (Patan Organic Spices)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#FFFBEB"),
  stroke: 0.5pt + rgb("#FDE68A"),
  inset: 5pt,
  [
    *Party Name:*\
    *Patan Organic Spices*\
    *Particulars:* 5 Bags Isabgol Seeds (Torn Packaging)
  ],
  [
    *Adjustment Reference:*\
    *Original Invoice No:* RTL/APMC/02\
    *Voucher:* Credit Note (Alt + F6) · *Tax Impact:* Output/Input Tax Reversal
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reason for Adjustment]], [#text(weight: "bold", fill: white)[Taxable Value (₹)]], [#text(weight: "bold", fill: white)[GST Reversed (₹)]], [#text(weight: "bold", fill: white)[Total Adjustment (₹)]],
  [5 Bags Isabgol Seeds (Torn Packaging)], [₹14,000.00], [₹0.00], [₹14,000.00],
  [*Statutory Reporting*], [*Linked to RTL/APMC/02*], [*Table 9B of GSTR-1*], [*ITC Adjusted in GSTR-3B*]
)

#v(8pt)
== Invoice 48: Credit Note (Alt + F6) — Sales Return (Ambaji Cyber Cafe)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#FFFBEB"),
  stroke: 0.5pt + rgb("#FDE68A"),
  inset: 5pt,
  [
    *Party Name:*\
    *Ambaji Cyber Cafe*\
    *Particulars:* 1 No Lenovo Desktop PC (Motherboard issue)
  ],
  [
    *Adjustment Reference:*\
    *Original Invoice No:* RTL/ELEC/14\
    *Voucher:* Credit Note (Alt + F6) · *Tax Impact:* Output/Input Tax Reversal
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reason for Adjustment]], [#text(weight: "bold", fill: white)[Taxable Value (₹)]], [#text(weight: "bold", fill: white)[GST Reversed (₹)]], [#text(weight: "bold", fill: white)[Total Adjustment (₹)]],
  [1 No Lenovo Desktop PC (Motherboard issue)], [₹32,000.00], [₹5,760.00], [₹37,760.00],
  [*Statutory Reporting*], [*Linked to RTL/ELEC/14*], [*Table 9B of GSTR-1*], [*ITC Adjusted in GSTR-3B*]
)

#v(8pt)
== Invoice 49: Debit Note (Alt + F5) — Purchase Return (Shree Arbuda Electronics)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#FFFBEB"),
  stroke: 0.5pt + rgb("#FDE68A"),
  inset: 5pt,
  [
    *Party Name:*\
    *Shree Arbuda Electronics*\
    *Particulars:* 1 No Vivo Y200e returned to vendor
  ],
  [
    *Adjustment Reference:*\
    *Original Invoice No:* SAE/2026/0491\
    *Voucher:* Debit Note (Alt + F5) · *Tax Impact:* Output/Input Tax Reversal
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reason for Adjustment]], [#text(weight: "bold", fill: white)[Taxable Value (₹)]], [#text(weight: "bold", fill: white)[GST Reversed (₹)]], [#text(weight: "bold", fill: white)[Total Adjustment (₹)]],
  [1 No Vivo Y200e returned to vendor], [₹16,000.00], [₹2,880.00], [₹18,880.00],
  [*Statutory Reporting*], [*Linked to SAE/2026/0491*], [*Table 9B of GSTR-1*], [*ITC Adjusted in GSTR-3B*]
)

#v(8pt)
== Invoice 50: Debit Note (Alt + F5) — Purchase Return (Ply King Timber Mart)
#table(
  columns: (1fr, 1fr),
  fill: rgb("#FFFBEB"),
  stroke: 0.5pt + rgb("#FDE68A"),
  inset: 5pt,
  [
    *Party Name:*\
    *Ply King Timber Mart*\
    *Particulars:* 5 Sheets Plywood Damaged in Transit
  ],
  [
    *Adjustment Reference:*\
    *Original Invoice No:* PK/MH/2026/088\
    *Voucher:* Debit Note (Alt + F5) · *Tax Impact:* Output/Input Tax Reversal
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reason for Adjustment]], [#text(weight: "bold", fill: white)[Taxable Value (₹)]], [#text(weight: "bold", fill: white)[GST Reversed (₹)]], [#text(weight: "bold", fill: white)[Total Adjustment (₹)]],
  [5 Sheets Plywood Damaged in Transit], [₹12,000.00], [₹2,160.00], [₹14,160.00],
  [*Statutory Reporting*], [*Linked to PK/MH/2026/088*], [*Table 9B of GSTR-1*], [*ITC Adjusted in GSTR-3B*]
)

#v(8pt)
#pagebreak()
#rtech-final-page(lang: "en", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")
