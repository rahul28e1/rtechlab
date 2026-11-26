// =============================================================================
// RTECHLAB TALLY PRIME 2027 ULTIMATE DESK CHEAT SHEET (ENGLISH EDITION)
// Micro-Transaction Master Desk Companion (A4 · Exactly 8 Pages · Printable)
// Author: Rahul Patel (Chief Technology Architect & Founder, RTechLab Publications)
// Official Portal: https://rtechlab.vercel.app
// =============================================================================

#set document(
  title: "Tally Prime 2027 Ultimate Desk Reference & Cheat Sheet (English)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 12mm, bottom: 10mm, left: 10mm, right: 10mm),
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 12pt, baseline: 1.5pt)[#image("../02_BRAND_ASSETS/rtechlab_official_logo.png", height: 12pt)]
          #h(4pt)
          #text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 8pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7.5pt, weight: "bold", fill: rgb("#047857"))[Tally Prime 2027 Daily Desk Reference & Cheat Sheet]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Professional Productivity Edition]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · Rahul Patel]
        ]
      )
      #v(2pt)
      #line(length: 100%, stroke: 0.6pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.4pt + rgb("#E2E8F0"))
      #v(3pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.8pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#059669"))[●] Technology Made Practical · Print & Keep on Your Accounting Desk · Free Tools: #link("https://rtechlab.vercel.app/tools")[*rtechlab.vercel.app/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 6pt, y: 2pt),
            text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Segoe UI", "Arial"),
  size: 7.6pt,
  fill: rgb("#1E293B"),
  spacing: 100%
)

// Brand Palette
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-amber = rgb("#D97706")
#let rtech-rose = rgb("#E11D48")
#let rtech-muted = rgb("#64748B")
#let rtech-border = rgb("#E2E8F0")

// Reusable UI Macros
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 1pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 1pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 1pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]

#let module-banner(num: "MODULE 01", title: "", color: rtech-emerald) = [
  #rect(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 4pt + color, top: 0.5pt + rgb("#E2E8F0"), bottom: 0.5pt + rgb("#E2E8F0"), right: 0.5pt + rgb("#E2E8F0")),
    radius: (right: 4pt),
    inset: (x: 7pt, y: 3.5pt)
  )[
    #box(fill: color, radius: 2pt, inset: (x: 5pt, y: 1.5pt))[
      #text(size: 6.5pt, weight: "black", fill: white)[#num]
    ]
    #h(6pt)
    #text(size: 9pt, weight: "bold", fill: rtech-navy)[#title]
  ]
  #v(2pt)
]

#let keypill(label, col: rtech-navy) = [
  #box(
    fill: col,
    radius: 3pt,
    inset: (x: 4.5pt, y: 1.5pt)
  )[#text(size: 6.8pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#label]]
]

// =============================================================================
// PAGE 01: FULL-BLEED 4K EXECUTIVE HERO COVER PAGE
// =============================================================================
#page(
  paper: "a4",
  margin: 0mm,
  header: none,
  footer: none,
)[
  #image("../02_BRAND_ASSETS/tally_prime_cover_hero.png", width: 100%, height: 100%, fit: "cover")
]


// =============================================================================
// PAGE 02: TABLE OF CONTENTS & 3 GOLDEN RULES (With Balance Sheet Equation)
// =============================================================================

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 2.5pt),
    text(size: 7.5pt, weight: "bold", fill: rtech-blue)[⚡ RTechLab Professional Cheat Sheet · Table-First Navigation Index]
  )
  #v(2pt)
  #text(size: 14pt, weight: "black", fill: rtech-navy)[Comprehensive Table of Contents & 3 Golden Accounting Rules]
  #v(2pt)
  #line(length: 100%, stroke: 1pt + rtech-emerald)
]

#v(2pt)

// 8-Page Table of Contents
#table(
  columns: (1fr, 3.2fr, 1.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, right).at(col) + horizon },
  inset: 3.2pt,

  text(size: 7pt, weight: "bold", fill: white)[Page No.],
  text(size: 7pt, weight: "bold", fill: white)[Module / Topic Description],
  text(size: 7pt, weight: "bold", fill: white)[Key Focus Area],

  [Page 1], [Official Bestseller Book Cover & Primary Mission Statement], [Cover & Goals],
  [Page 2], [Table of Contents, 3 Golden Rules & Accounting Equation], [Rules & Equation],
  [Page 3], [All 28 Tally Prime Groups (15 Primary + 13 Secondary)], [All 28 Groups],
  [Page 4], [All 24 Tally Prime Vouchers (Numbered 1 to 24) & Mode Guide], [All 24 Vouchers],
  [Page 5], [Modern GST Framework (0%, 5%, 18%) & Rule 46 Tax Invoice], [GST & Invoice],
  [Page 6], [Corporate TDS Matrix (194C, 194J, 194I) & CTS Cheque BRS Chart], [TDS & BRS Cheque],
  [Page 7], [Top 35 Keyboard Shortcuts (Numbered 1 to 35) & Year-End Audit], [Top 35 Hotkeys],
  [Page 8], [Rahul Sir's Mentorship Letter, WhatsApp Helpline & Tools], [Mentorship & Tools],
)

#v(3pt)

#module-banner(num: "MODULE 01", title: "Double Entry Bookkeeping: The 3 Golden Rules", color: rtech-emerald)

#table(
  columns: (1.2fr, 2fr, 1.4fr, 1.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 4.2pt,

  text(size: 7.2pt, weight: "bold", fill: white)[Account Type],
  text(size: 7.2pt, weight: "bold", fill: white)[Fundamental Golden Rule],
  text(size: 7.2pt, weight: "bold", fill: white)[When to Debit (Dr)?],
  text(size: 7.2pt, weight: "bold", fill: white)[When to Credit (Cr)?],

  [#text(weight: "bold", fill: rtech-blue)[1. Personal Account]],
  [#hl-y[Debit the Receiver,] \ #hl-y[Credit the Giver.]],
  [#text(fill: rtech-emerald, weight: "bold")[Debit the Receiver]\ (e.g. Ramesh Dr)],
  [#text(fill: rtech-rose, weight: "bold")[Credit the Giver]\ (e.g. To Suresh)],

  [#text(weight: "bold", fill: rtech-emerald)[2. Real Account]],
  [#hl-g[Debit what comes in,] \ #hl-g[Credit what goes out.]],
  [#text(fill: rtech-emerald, weight: "bold")[What Comes In Dr]\ (e.g. Cash / Machinery)],
  [#text(fill: rtech-rose, weight: "bold")[What Goes Out Cr]\ (e.g. To Cash)],

  [#text(weight: "bold", fill: rtech-amber)[3. Nominal Account]],
  [#hl-y[Debit all expenses & losses,] \ #hl-y[Credit all incomes & gains.]],
  [#text(fill: rtech-emerald, weight: "bold")[Expenses & Losses Dr]\ (e.g. Salary / Rent Dr)],
  [#text(fill: rtech-rose, weight: "bold")[Incomes & Gains Cr]\ (e.g. To Interest / Comm.)]
)

#v(3pt)

#module-banner(num: "MODULE 02", title: "Fundamental Accounting Equation (Balance Sheet Equation)", color: rtech-blue)

#align(center)[
  #block(
    width: 100%,
    fill: rgb("#F0F9FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 4pt,
    inset: (x: 10pt, y: 7pt),
    [
      #text(size: 10pt, weight: "black", fill: rtech-navy)[Total Assets = External Liabilities + Owner's Equity (Capital)]\
      #v(3pt)
      #text(size: 7.5pt, fill: rtech-muted)[
        Every debit transaction must have an equal and corresponding credit. The Balance Sheet must perpetually remain balanced!
      ]
    ]
  )
]

#pagebreak()

// =============================================================================
// PAGE 03: ALL 28 TALLY PRIME GROUPS (15 Primary + 13 Secondary)
// =============================================================================

#module-banner(num: "MODULE 03", title: "All 28 Tally Prime Groups: Part 1 — 15 Primary Groups", color: rtech-emerald)

#text(size: 7.2pt, fill: rtech-muted)[
  Primary Groups directly impact the fundamental Balance Sheet or Profit & Loss Statement:
]
#v(2pt)

#table(
  columns: (0.5fr, 2fr, 1.8fr, 3.5fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, left, left).at(col) + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[No.],
  text(size: 6.8pt, weight: "bold", fill: white)[Primary Group Name],
  text(size: 6.8pt, weight: "bold", fill: white)[Statement Nature],
  text(size: 6.8pt, weight: "bold", fill: white)[Commercial Ledger Example & Description],

  [1], [*Capital Account*], [Balance Sheet], [Proprietor's Capital, Partner's Capital, Share Capital, Drawings A/c],
  [2], [*Loans (Liability)*], [Balance Sheet], [Bank Term Loans (SBI/HDFC), Director Loans, Unsecured Loans],
  [3], [*Current Liabilities*], [Balance Sheet], [Short-term obligations payable within 12 operating months],
  [4], [*Fixed Assets*], [Balance Sheet], [Tangible Assets: Machinery, Computer, Office Furniture & Fixtures],
  [5], [*Current Assets*], [Balance Sheet], [Liquid assets convertible to cash within 1 operating year],
  [6], [*Misc. Expenses (Asset)*], [Balance Sheet], [Unamortized preliminary & incorporation expenses],
  [7], [*Branch / Divisions*], [Balance Sheet], [Inter-branch accounts (Ahmedabad / Surat / Mumbai Branches)],
  [8], [*Suspense Account*], [Balance Sheet], [Unidentified debit/credit transactions (Must be ZERO at year-end)],
  [9], [*Investments*], [Balance Sheet], [Mutual Funds, Fixed Deposits (FD), Govt Sovereign Bonds],
  [10], [*Sales Accounts*], [Trading P&L], [Total revenue from sales of goods/services (Local GST, Export Sales)],
  [11], [*Purchase Accounts*], [Trading P&L], [Total purchases of trading stock & raw materials (GST Inward)],
  [12], [*Direct Incomes*], [Trading P&L], [Direct factory receipts: Job work charges, Freight collected],
  [13], [*Indirect Incomes*], [Profit & Loss], [Non-operating revenue: Bank Interest, Rent Received, Cash Discount],
  [14], [*Direct Expenses*], [Trading P&L], [Factory & manufacturing costs: Wages, Freight Inward, Factory Power],
  [15], [*Indirect Expenses*], [Profit & Loss], [Admin & Selling costs: Office Rent, Staff Salary, Audit Fees, Advertising],
)

#v(3pt)

#module-banner(num: "MODULE 04", title: "All 28 Tally Prime Groups: Part 2 — 13 Secondary Sub-Groups", color: rtech-blue)

#text(size: 7.2pt, fill: rtech-muted)[
  Secondary Sub-Groups are nested directly beneath specific Primary Groups for granular ledger classification:
]
#v(2pt)

#table(
  columns: (0.5fr, 2fr, 2fr, 3.5fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, left, left).at(col) + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[No.],
  text(size: 6.8pt, weight: "bold", fill: white)[Secondary Sub-Group Name],
  text(size: 6.8pt, weight: "bold", fill: white)[Parent Primary Group],
  text(size: 6.8pt, weight: "bold", fill: white)[Commercial Ledger Example],

  [1], [*Reserves & Surplus*], [Capital Account], [General Reserve, Retained Earnings, Capital Reserve],
  [2], [*Bank OD / OCC A/c*], [Loans (Liability)], [Bank Overdraft Account (SBI OD / Cash Credit Limit Account)],
  [3], [*Secured Loans*], [Loans (Liability)], [Hypothecated Bank Loans against machinery or warehouse inventory],
  [4], [*Unsecured Loans*], [Loans (Liability)], [Clean personal loans from friends, relatives, or directors without collateral],
  [5], [*Duties & Taxes*], [Current Liabilities], [CGST, SGST, IGST, TDS Payable, TCS Tax Ledgers],
  [6], [*Provisions*], [Current Liabilities], [Provision for Income Tax, Provision for Doubtful Debts],
  [7], [*Sundry Creditors*], [Current Liabilities], [#hl-y[Suppliers / Vendors] from whom raw materials/goods were bought on credit],
  [8], [*Bank Accounts*], [Current Assets], [Commercial Current & Savings Accounts: SBI Current A/c, HDFC A/c],
  [9], [*Cash-in-Hand*], [Current Assets], [Physical cash in vault: Main Cash A/c, Petty Cash Drawer],
  [10], [*Deposits (Asset)*], [Current Assets], [Security Deposits: Electricity Deposit, Shop Security Deposit],
  [11], [*Loans & Advances (Asset)*], [Current Assets], [Advances given: Staff Salary Advance, Vendor Supply Advances],
  [12], [*Stock-in-Hand*], [Current Assets], [Inventory stored in warehouse/godown (Closing Stock Valuation)],
  [13], [*Sundry Debtors*], [Current Assets], [#hl-g[Customers / Buyers] to whom goods/services were sold on credit],
)

#v(2pt)
#text(size: 7.2pt, weight: "bold", fill: rtech-emerald)[
  Total Master Verification: 15 Primary Groups + 13 Secondary Groups = Exactly 28 Predefined Groups. New groups created via 'Alt + C'.
]

#pagebreak()

// =============================================================================
// PAGE 04: ALL 24 VOUCHERS (Numbered 1 to 24) & VOUCHER MODES
// =============================================================================

#module-banner(num: "MODULE 05", title: "All 24 Tally Prime Vouchers (Complete Master Guide 1 to 24)", color: rtech-blue)

#text(size: 7.2pt, fill: rtech-muted)[
  Press #hl-y[V (Vouchers)] from Gateway of Tally. All 24 standard commercial vouchers are classified below:
]
#v(2pt)

#table(
  columns: (0.4fr, 1.2fr, 2.2fr, 4.2fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, center, left, left).at(col) + horizon },
  inset: 2.6pt,

  text(size: 6.8pt, weight: "bold", fill: white)[No.],
  text(size: 6.8pt, weight: "bold", fill: white)[Hotkey],
  text(size: 6.8pt, weight: "bold", fill: white)[Voucher Type],
  text(size: 6.8pt, weight: "bold", fill: white)[Corporate Accounting Purpose & Rules],

  [1], [#keypill("F4", col: rtech-blue)], [*Contra Voucher*], [#hl-y[Internal Cash & Bank Transfers Only]: Cash deposit into bank, bank-to-bank transfer.],
  [2], [#keypill("F5", col: rtech-rose)], [*Payment Voucher*], [#hl-y[Outflow of funds]: Payment to vendor, salary, rent, statutory taxes via cash/bank.],
  [3], [#keypill("F6", col: rtech-emerald)], [*Receipt Voucher*], [#hl-y[Inflow of funds]: Customer collections, bank interest received, proprietor capital.],
  [4], [#keypill("F7", col: rgb("#334155"))], [*Journal Voucher*], [#hl-y[Non-Cash Adjustments]: Fixed asset depreciation, rectifications, credit asset purchase.],
  [5], [#keypill("F8", col: rtech-emerald)], [*Sales Voucher*], [#hl-g[Sales of Goods/Services]: Cash or credit sales invoicing with auto GST tax calculation.],
  [6], [#keypill("F9", col: rtech-amber)], [*Purchase Voucher*], [#hl-b[Purchase of Goods/Services]: Recording inward supply invoices & claiming GST ITC.],
  [7], [#keypill("Alt + F5", col: rtech-rose)], [*Debit Note*], [Purchase Return to vendor or supplier price escalation adjustment.],
  [8], [#keypill("Alt + F6", col: rtech-emerald)], [*Credit Note*], [Sales Return from customer, post-sale trade discounts, rate rebate adjustment.],
  [9], [#keypill("Ctrl + F4", col: rgb("#1E293B"))], [*Payroll Voucher*], [Processing employee salaries, HRA, PF, ESIC deductions automatically.],
  [10], [#keypill("Ctrl + F7", col: rgb("#1E293B"))], [*Reversing Journal*], [Year-end provision entries auto-reversed on the next financial day.],
  [11], [#keypill("Alt + F7", col: rtech-blue)], [*Stock Journal*], [#hl-y[Warehouse Stock Transfer]: Transfer of stock between godowns or manufacturing BOM.],
  [12], [#keypill("Alt + F8", col: rtech-blue)], [*Delivery Note*], [Outward dispatch challan sent with goods before the final sales tax invoice.],
  [13], [#keypill("Alt + F9", col: rtech-blue)], [*Receipt Note*], [Goods Receipt Note (GRN) received from supplier before actual purchase invoice arrives.],
  [14], [#keypill("Ctrl + F8", col: rtech-rose)], [*Rejection Out*], [Damaged goods returned to vendor before entering the commercial purchase ledger.],
  [15], [#keypill("Ctrl + F9", col: rtech-emerald)], [*Rejection In*], [Defective goods returned by customer prior to raising a credit note.],
  [16], [#keypill("Alt + F10", col: rgb("#0F172A"))], [*Physical Stock*], [Recording physical godown stock count discrepancies vs actual book balance.],
  [17], [#keypill("Ctrl + F2", col: rgb("#0F172A"))], [*Material In*], [Receiving finished goods or raw materials back from job-worker factory.],
  [18], [#keypill("Ctrl + F3", col: rgb("#0F172A"))], [*Material Out*], [Sending raw materials out to contractor for job-work processing.],
  [19], [#keypill("Alt + F4", col: rtech-amber)], [*Purchase Order*], [Formal purchase order (PO) issued to vendor with rate, quantity & delivery dates.],
  [20], [#keypill("Alt + F5", col: rtech-emerald)], [*Sales Order*], [Sales order (SO) accepted from customer prior to dispatch challan/invoicing.],
  [21], [#keypill("Ctrl + F5", col: rgb("#0F172A"))], [*Attendance Voucher*], [Recording employee present/absent days, production units & overtime hours.],
  [22], [#keypill("Ctrl + F6", col: rgb("#0F172A"))], [*Job Work Order*], [Official contractual assignment order issued to third-party manufacturing process.],
  [23], [#keypill("Alt + F10", col: rgb("#334155"))], [*Memorandum Voucher*], [Non-accounting reminder entry; doesn't affect financial books until converted.],
  [24], [#keypill("Ctrl + L", col: rgb("#0F172A"))], [*Optional Voucher*], [What-if scenario analysis voucher; excluded from P&L until marked Regular.]
)

#v(2pt)

#module-banner(num: "MODULE 06", title: "Voucher Mode Switching: Ctrl + H (Change Mode Master Trick)", color: rtech-amber)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  [
    #block(stroke: 0.8pt + rtech-border, fill: rgb("#F8FAFC"), inset: 5pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-blue)[1. Item Invoice Mode:]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-muted)[Standard retail/wholesale with Item Name, Godown, Qty, Rate & separate GST taxes.]
    ]
  ],
  [
    #block(stroke: 0.8pt + rtech-border, fill: rgb("#F8FAFC"), inset: 5pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-emerald)[2. Accounting Invoice Mode:]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-muted)[Service industry (CA, Advocates, Software) where billing is done without inventory items.]
    ]
  ],
  [
    #block(stroke: 0.8pt + rtech-border, fill: rgb("#F8FAFC"), inset: 5pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-navy)[3. As Voucher Mode:]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-muted)[Traditional Debit/Credit (Dr/By & Cr/To) interface preferred by classic bookkeepers.]
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 05: MODERN GST STRUCTURE & RULE 46 TAX INVOICE CHECKLIST
// =============================================================================

#module-banner(num: "MODULE 07", title: "Modern GST Architecture & Tax Ledger Mapping", color: rtech-amber)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.8pt + rgb("#BAE6FD"), inset: 6pt, radius: 4pt)[
      #text(weight: "bold", size: 7.5pt, fill: rtech-blue)[A. Intra-State Supply (Within Same State)]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-navy)[
        *Rule:* When Supplier & Buyer belong to the same state (e.g., Gujarat to Gujarat). Tax is split 50-50 into *CGST* (Central Tax 50%) + *SGST* (State Tax 50%).\
        *Example (18% Rate):* 9% CGST + 9% SGST.
      ]
    ]
  ],
  [
    #block(fill: rgb("#FEF3C7"), stroke: 0.8pt + rgb("#FDE68A"), inset: 6pt, radius: 4pt)[
      #text(weight: "bold", size: 7.5pt, fill: rtech-amber)[B. Inter-State Supply (Between Different States)]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-navy)[
        *Rule:* When Supplier & Buyer belong to different states (e.g., Gujarat to Maharashtra). 100% tax is levied under *IGST* (Integrated Tax).\
        *Example (18% Rate):* 18% IGST directly (CGST & SGST remain 0.00).
      ]
    ]
  ]
)

#v(2pt)

#module-banner(num: "MODULE 08", title: "Commercial GST Slab Rates by Commodity (HSN/SAC Mapping)", color: rtech-emerald)

#table(
  columns: (1fr, 2.8fr, 1.8fr, 2.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, center, left).at(col) + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[GST Slab],
  text(size: 6.8pt, weight: "bold", fill: white)[Commercial Commodities & Services],
  text(size: 6.8pt, weight: "bold", fill: white)[HSN / SAC Code],
  text(size: 6.8pt, weight: "bold", fill: white)[Tally Prime Configuration SOP],

  [#keypill("0% (Nil)", col: rgb("#0F172A"))],
  [Fresh APMC Jeera, Unprocessed Grains, Fresh Vegetables, Raw Milk],
  [HSN 0909 / HSN 1211],
  [Taxability: *Exempt / Nil Rated*],

  [#keypill("5% Slab", col: rtech-amber)],
  [Packaged Food, Tea, Sugar, Edible Coal, Fabric under ₹1000, Transport],
  [HSN 0902 / HSN 1701],
  [Intra: #hl-y[2.5% + 2.5%] | Inter: #hl-y[5%]],

  [#keypill("12% Slab", col: rtech-blue)],
  [Processed Food, Butter, Ghee, Medicines, Mobile Phones & Parts],
  [HSN 0405 / HSN 3004],
  [Intra: #hl-b[6% + 6%] | Inter: #hl-b[12%]],

  [#keypill("18% Slab", col: rtech-emerald)],
  [Most Widely Used! Electronics, Computers, IT Software, AC Restaurants],
  [HSN 8471 / SAC 9983],
  [Intra: #hl-g[9% + 9%] | Inter: #hl-g[18%]],

  [#keypill("28% Slab", col: rtech-rose)],
  [Luxury Goods: Luxury Cars, Cement, Tobacco, Carbonated Soft Drinks],
  [HSN 8703 / HSN 2523],
  [Intra: 14% + 14% (+ Compensation Cess)],
)

#v(2pt)

// Authentic GST Invoice Graphic Box
#align(center)[
  #block(
    width: 100%,
    stroke: 0.8pt + rtech-border,
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/gst_invoice_structure.png", width: 95%)
    ]
  )
]

#v(1pt)
#align(center)[
  #text(size: 6.5pt, fill: rtech-muted, style: "italic")[Figure 5.1: Rule 46 Compliant Commercial GST Tax Invoice — Showing Supplier/Buyer GSTIN, HSN & CGST/SGST Breakdown]
]

#v(2pt)

#module-banner(num: "MODULE 09", title: "Rule 46 Tax Invoice 8 Mandatory Compliance Conditions", color: rtech-navy)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    - *1. Sequential Invoice No:* Max 16 alphanumeric characters unique for FY.
    - *2. Date of Issue:* Date when invoice was generated or goods dispatched.
    - *3. Supplier Details:* Legal Trade Name, Address & 15-digit GSTIN.
    - *4. Recipient Details:* Name, Address, GSTIN & State Code (e.g. 24 Gujarat).
  ],
  [
    - *5. Place of Supply (POS):* Crucial for Intra-state vs Inter-state determination.
    - *6. HSN/SAC Code:* 4-digit (turnover < ₹5 Cr) or 6-digit (turnover >= ₹5 Cr).
    - *7. Tax Segregation:* Breakup of Taxable Value, CGST, SGST & IGST.
    - *8. Digital Signature / QR Code:* Mandatory B2B e-Invoicing QR Code.
  ]
)

#pagebreak()

// =============================================================================
// PAGE 06: CORPORATE TDS MASTER MATRIX & CTS CHEQUE BRS VISUAL
// =============================================================================

#module-banner(num: "MODULE 10", title: "Corporate TDS Master Matrix FY 2026-27 (Rates & Thresholds)", color: rtech-rose)

#text(size: 7.2pt, fill: rtech-muted)[
  TDS (Tax Deducted at Source) must be mandatorily deducted at payment or credit by commercial entities:
]
#v(2pt)

#table(
  columns: (1.4fr, 3.2fr, 1.8fr, 2.6fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (left, left, center, left).at(col) + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[TDS Section],
  text(size: 6.8pt, weight: "bold", fill: white)[Nature of Payment],
  text(size: 6.8pt, weight: "bold", fill: white)[TDS Rate (%)],
  text(size: 6.8pt, weight: "bold", fill: white)[Annual Exemption Limit (Threshold)],

  [#text(weight: "bold", fill: rtech-rose)[Section 194C]],
  [Contractor / Transporter / Advertising / Job Work],
  [1% (Indiv/HUF) \ 2% (Co/Firm)],
  [Single Bill > ₹30,000 \ or Aggregate > ₹1,00,000 / year],

  [#text(weight: "bold", fill: rtech-rose)[Section 194J]],
  [Professional Fees (CA, Advocate, Software Consultant)],
  [10% (Prof. Fees) \ 2% (Tech Service)],
  [> ₹30,000 in FY \ (No limit for Director Fees)],

  [#text(weight: "bold", fill: rtech-rose)[Section 194I]],
  [Commercial Rent (Office, Shop, Godown, Plant & Machinery)],
  [2% (Machinery) \ 10% (Land/Building)],
  [Total Rent > ₹2,40,000 in FY],

  [#text(weight: "bold", fill: rtech-rose)[Section 194H]],
  [Commission or Brokerage (Real Estate Agent Commission)],
  [5%],
  [Total Commission > ₹15,000 in FY],

  [#text(weight: "bold", fill: rtech-rose)[Section 194Q]],
  [Purchase of Commercial Goods (Buyer Turnover > ₹10 Cr)],
  [0.1%],
  [Aggregate purchase from vendor > ₹50,00,000 in FY],

  [#text(weight: "bold", fill: rtech-rose)[Section 194A]],
  [Interest other than Securities (Fixed Deposits / Unsecured Loan)],
  [10%],
  [Bank: ₹40,000 (Senior ₹50k), Others: ₹5,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 206AA]],
  [#hl-y[Penal Rate:] If Vendor fails to provide valid PAN Card],
  [#keypill("20% Flat", col: rtech-rose)],
  [No Exemption Threshold (Flat 20% on all bills)]
)

#v(2pt)

// Authentic CTS-2010 Cheque Graphic Box
#align(center)[
  #block(
    width: 100%,
    stroke: 0.8pt + rtech-border,
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/bank_cheque_reconciliation.png", width: 96%)
    ]
  )
]

#v(1pt)
#align(center)[
  #text(size: 6.5pt, fill: rtech-muted, style: "italic")[Figure 6.1: CTS-2010 Standard Bank Cheque & Bank Reconciliation (BRS) — A/c Payee Crossing, MICR Band & Cheque Number Tracking]
]

#v(2pt)

#module-banner(num: "MODULE 11", title: "Tally Prime TDS Posting Flow & Form 26Q Due Dates", color: rtech-emerald)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(stroke: 0.5pt + rtech-border, fill: rgb("#F8FAFC"), inset: 6pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-navy)[Standard 3-Step TDS Posting SOP:]\
      #v(2pt)
      - *1. Bill Booking (F7 Journal):* Audit Fee Dr / To TDS Payable Cr / To CA Party Cr
      - *2. Vendor Payment (F5 Payment):* CA Party Dr / To Bank Cr (Net 90% payment)
      - *3. Govt Challan (F5 Stat Payment):* TDS Payable Dr / To Bank Cr (Challan 281)
    ]
  ],
  [
    #block(stroke: 0.5pt + rtech-border, fill: rgb("#F8FAFC"), inset: 6pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-navy)[Form 26Q Quarterly Return Calendar:]\
      #v(2pt)
      - *Q1 (Apr-Jun):* Due on #text(weight: "bold", fill: rtech-emerald)[31st July] (Late fee ₹200/day)
      - *Q2 (Jul-Sep):* Due on #text(weight: "bold", fill: rtech-emerald)[31st October]
      - *Q3 (Oct-Dec):* Due on #text(weight: "bold", fill: rtech-emerald)[31st January]
      - *Q4 (Jan-Mar):* Due on #text(weight: "bold", fill: rtech-emerald)[31st May] (Annual final reconciliation)
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 07: TOP 35 KEYBOARD SHORTCUTS & YEAR-END AUDIT PROTOCOL
// =============================================================================

#module-banner(num: "MODULE 12", title: "Top 35 Tally Prime Keyboard Shortcuts (Complete 1 to 35 List)", color: rtech-emerald)

#text(size: 7.2pt, fill: rtech-muted)[
  Ditch the mouse! Pro accountants operate Tally Prime 5x faster exclusively using keyboard shortcuts:
]
#v(2pt)

#table(
  columns: (0.4fr, 1.2fr, 2.4fr, 0.4fr, 1.2fr, 2.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, center, left, center, center, left).at(col) + horizon },
  inset: 2.7pt,

  text(size: 6.8pt, weight: "bold", fill: white)[No.],
  text(size: 6.8pt, weight: "bold", fill: white)[Hotkey],
  text(size: 6.8pt, weight: "bold", fill: white)[Action Description],
  text(size: 6.8pt, weight: "bold", fill: white)[No.],
  text(size: 6.8pt, weight: "bold", fill: white)[Hotkey],
  text(size: 6.8pt, weight: "bold", fill: white)[Action Description],

  [1], [#keypill("Alt + G", col: rtech-blue)], [#hl-y[GoTo Master Search] (Any report)],
  [19], [#keypill("Alt + E")], [Export to Excel, PDF, XML],

  [2], [#keypill("Ctrl + A", col: rtech-emerald)], [#hl-b[1-Click Auto Save] (Without Enter)],
  [20], [#keypill("Alt + M")], [Direct Email report to party],

  [3], [#keypill("Alt + C", col: rtech-emerald)], [#hl-g[Instant Creation] (Ledger/Stock Item)],
  [21], [#keypill("Alt + Z")], [Zoom In / Zoom Out toggle],

  [4], [#keypill("Ctrl + Enter", col: rtech-emerald)], [#hl-y[Master Alter] (Edit ledger from report)],
  [22], [#keypill("Esc")], [Exit to previous screen],

  [5], [#keypill("Alt + D", col: rtech-amber)], [Delete Voucher or Ledger],
  [23], [#keypill("Ctrl+Alt+C")], [Copy text in Tally],

  [6], [#keypill("Alt + F1", col: rtech-amber)], [Detailed Tree View],
  [24], [#keypill("Ctrl+Alt+V")], [Paste text in Tally],

  [7], [#keypill("Alt + F5", col: rtech-amber)], [Condensed / Detailed Toggle View],
  [25], [#keypill("Alt + I")], [Insert New Column in Report],

  [8], [#keypill("F2", col: rgb("#0F172A"))], [Change Voucher / Report Date],
  [26], [#keypill("Alt + A")], [Add Voucher to existing register],

  [9], [#keypill("Alt + F2", col: rgb("#0F172A"))], [Change Period (01-04 to 31-03)],
  [27], [#keypill("Alt + 2")], [Duplicate existing voucher],

  [10], [#keypill("F12", col: rtech-blue)], [Screen Configuration Settings],
  [28], [#keypill("Alt + X")], [Cancel Voucher (Preserves serial)],

  [11], [#keypill("Ctrl + H", col: rtech-blue)], [Voucher Mode Change (Item/Ac/Vou)],
  [29], [#keypill("F11")], [Company Features (GST, TDS)],

  [12], [#keypill("Ctrl + N", col: rgb("#0F172A"))], [In-Built Calculator On/Off],
  [30], [#keypill("F1")], [Select / Switch Company],

  [13], [#keypill("Alt + R", col: rgb("#0F172A"))], [Hide Line Item from Report],
  [31], [#keypill("Alt + F1")], [Shut / Close Active Company],

  [14], [#keypill("Alt + U", col: rgb("#0F172A"))], [Unhide Previously Hidden Line],
  [32], [#keypill("Ctrl + F1")], [Open Payroll / Attendance Register],

  [15], [#keypill("Spacebar", col: rgb("#0F172A"))], [Select / Deselect a single line],
  [33], [#keypill("Alt + F12")], [Custom Range Filter in Report],

  [16], [#keypill("Ctrl+Space", col: rgb("#0F172A"))], [Select All Lines at once],
  [34], [#keypill("Ctrl + Q")], [Quick Quit Tally Prime],

  [17], [#keypill("Alt + P", col: rtech-blue)], [Print current invoice/report],
  [35], [#keypill("PgUp / PgDn")], [View Previous / Next Voucher],

  [18], [#keypill("Ctrl + P", col: rtech-blue)], [Immediate Print of open screen],
  [], [], []
)

#v(3pt)

#module-banner(num: "MODULE 13", title: "5-Step Year-End Financial Audit Protocol (March 31st Checklist)", color: rtech-navy)

#block(fill: rgb("#F8FAFC"), stroke: 0.5pt + rtech-border, inset: 6pt, radius: 4pt)[
  - *1. Bank Reconciliation Statement (BRS Check):* Balance between physical bank passbook & Tally bank ledger must match with zero unmapped difference (#keypill("F5 -> Reconcile")).
  - *2. #hl-y[Depreciation Posting (Year-End F7 Journal)]:* Pass depreciation on all plant, equipment & computer assets as per IT Act / Companies Act schedules.
  - *3. Physical Closing Stock Verification:* Value ending inventory at 'Cost or Net Realizable Value, whichever is lower'.
  - *4. #hl-g[GST ITC Reconciliation]:* Cross-check purchase register ITC with GSTR-2B portal data down to the exact rupee.
  - *5. #hl-y[Final Balance Sheet & P&L Review]:* Verify that Suspense Account and 'Difference in Opening Balances' are exactly ZERO.
]

#pagebreak()

// =============================================================================
// PAGE 08: RAHUL SIR'S MENTORSHIP MESSAGE, HELPLINE & TOOLS
// =============================================================================

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 4pt,
    inset: (x: 10pt, y: 3pt),
    [
      #grid(
        columns: (auto, auto),
        gutter: 6pt,
        align: (horizon, horizon),
        [
          #image("../02_BRAND_ASSETS/rtechlab_official_logo.png", height: 13pt)
        ],
        [
          #text(size: 8.2pt, weight: "bold", fill: rtech-blue)[Rahul Sir's Personal Message · RTechLab Mentorship & Community Hub]
        ]
      )
    ]
  )
]

#v(8pt)

// Tight Two-Column Author Block
#grid(
  columns: (36mm, 1fr),
  gutter: 12pt,
  align: (top + left, top + left),
  [
    #block(
      width: 36mm,
      stroke: 1.5pt + rtech-emerald,
      radius: 6pt,
      clip: true,
      [
        #image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 36mm)
      ]
    )
    #v(3pt)
    #block(width: 36mm)[
      #align(center)[
        #text(size: 8pt, weight: "black", fill: rtech-navy)[Rahul Patel]\
        #v(1.5pt)
        #box(
          fill: rgb("#EFF6FF"),
          stroke: 0.8pt + rgb("#BFDBFE"),
          radius: 2.5pt,
          inset: (x: 4pt, y: 1.5pt),
          text(size: 6.2pt, weight: "black", fill: rgb("#1D4ED8"))[🏅 Tally Certified Trainer (TCT)]
        )\
        #v(1.5pt)
        #text(size: 6.5pt, fill: rtech-muted)[Chief Technology Architect]\
        #text(size: 6.2pt, fill: rtech-muted)[Founder, RTechLab Publications]
      ]
    ]
  ],
  [
    #text(size: 11pt, weight: "black", fill: rtech-navy)[Dear Student & Future Accounts Leader,]\
    #v(3pt)
    #text(size: 7.8pt, fill: rgb("#334155"))[
      Accounting is never just about debit and credit data entry; it is the financial backbone of every commercial enterprise. A great accountant is one who accounts for every single rupee accurately while guaranteeing 100% statutory compliance with GST and TDS regulations.

      Our single mission behind engineering this *Ultimate Quick Desk Reference* was simple: when you sit at your office desk or prepare for an interview, you should never have to waste time searching through 50 random Google links or YouTube videos. Having this 8-page reference on your desk means you permanently carry the mind of a senior corporate accountant with you.

      Keep practicing, stay curious, and always keep your accounting books clean and audited!
    ]

    #v(3.5pt)
    #block(
      width: 100%,
      fill: rgb("#F8FAFC"),
      stroke: (left: 3pt + rtech-blue, rest: 0.5pt + rgb("#CBD5E1")),
      radius: (right: 4pt),
      inset: (x: 7pt, y: 4.5pt),
      [
        #text(size: 7.2pt, weight: "black", fill: rtech-navy)[🏆 Author Profile & Master Trainer Credentials:]\
        #v(2pt)
        #grid(
          columns: (1fr, 1.15fr),
          gutter: 6pt,
          [
            - *Owner & Director:* IANT Palanpur
            - *10+ Years Experience:* IT & Vocational Training
          ],
          [
            - *3,000+ Students Mentored:* Across Gujarat
            - *Master Faculty:* Tally Essential (L1, L2, L3) & Professional
          ]
        )
        #v(2.5pt)
        #line(length: 100%, stroke: 0.4pt + rgb("#E2E8F0"))
        #v(2pt)
        #grid(
          columns: (1.1fr, 1.25fr, 1.2fr),
          gutter: 4pt,
          align: (center + horizon, center + horizon, center + horizon),
          [
            #link("https://rahulprofile28.netlify.app/")[
              #box(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BFDBFE"), radius: 2.5pt, inset: (x: 4.5pt, y: 2.5pt))[
                #grid(
                  columns: (auto, auto),
                  gutter: 3pt,
                  align: horizon,
                  image("../02_BRAND_ASSETS/icon_website.png", height: 7.5pt),
                  text(size: 6pt, weight: "black", fill: rtech-blue)[Portfolio Website]
                )
              ]
            ]
          ],
          [
            #link("https://www.youtube.com/@RTechLabOfficial")[
              #box(fill: rgb("#FEF2F2"), stroke: 0.5pt + rgb("#FECACA"), radius: 2.5pt, inset: (x: 4.5pt, y: 2.5pt))[
                #grid(
                  columns: (auto, auto),
                  gutter: 3pt,
                  align: horizon,
                  image("../02_BRAND_ASSETS/icon_youtube.png", height: 7.5pt),
                  text(size: 6pt, weight: "black", fill: rgb("#DC2626"))[\@RTechLabOfficial]
                )
              ]
            ]
          ],
          [
            #link("https://www.instagram.com/rtechlabofficial/")[
              #box(fill: rgb("#FDF2F8"), stroke: 0.5pt + rgb("#FBCFE8"), radius: 2.5pt, inset: (x: 4.5pt, y: 2.5pt))[
                #grid(
                  columns: (auto, auto),
                  gutter: 3pt,
                  align: horizon,
                  image("../02_BRAND_ASSETS/icon_instagram.png", height: 7.5pt),
                  text(size: 6pt, weight: "black", fill: rgb("#DB2777"))[\@rtechlabofficial]
                )
              ]
            ]
          ]
        )
      ]
    )
  ]
)

#v(8pt)

// Helpline & Community Box
#block(
  width: 100%,
  fill: rgb("#F0FDF4"),
  stroke: 1pt + rgb("#86EFAC"),
  radius: 4pt,
  inset: (x: 10pt, y: 7pt),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (center + horizon, left + horizon),
      [
        #text(size: 18pt)[📱]
      ],
      [
        #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[Official WhatsApp Student Helpline & Community Support]\
        #v(1pt)
        #text(size: 7.2pt, fill: rtech-navy)[
          Have doubts in accounting entries, GST settings, or career guidance? Contact our official helpline:
          *WhatsApp Helpline:* #text(weight: "black", fill: rtech-emerald)[+91 76468 92094] (Chat-Only Policy · Swift Resolution) · *Official WhatsApp Community:* #link("https://chat.whatsapp.com/G5g27K35i8b0U5L009G96t")[*Click Here to Join Official RTechLab Channel →*]
        ]
      ]
    )
  ]
)

#v(5pt)

// Free Tools Box
#block(
  width: 100%,
  fill: rgb("#F0F9FF"),
  stroke: 1pt + rgb("#BAE6FD"),
  radius: 4pt,
  inset: (x: 10pt, y: 7pt),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (center + horizon, left + horizon),
      [
        #text(size: 18pt)[🛠️]
      ],
      [
        #text(size: 8.5pt, weight: "bold", fill: rtech-blue)[Practice on 100% Free Interactive Web Tools]\
        #v(1pt)
        #text(size: 7.2pt, fill: rtech-navy)[
          Boost your technical speed daily with our in-browser practical tools: *Daily 10-Second Technical Quiz* (1 new question & instant result daily) · *Free Engineering Tools Hub:* Subnet Calculator, DNS Lookup, IP Info, Binary Converter · *Direct Link:* #link("https://rtechlab.vercel.app/tools")[*rtechlab.vercel.app/tools*]
        ]
      ]
    )
  ]
)

#v(5pt)

// Upgrade to Full 51-Page Master Guide Hook
#block(
  width: 100%,
  fill: rgb("#FFFBEB"),
  stroke: 1.2pt + rgb("#F59E0B"),
  radius: 4pt,
  inset: (x: 10pt, y: 8pt),
  [
    #grid(
      columns: (auto, 1fr, auto),
      gutter: 10pt,
      align: (center + horizon, left + horizon, right + horizon),
      [
        #text(size: 22pt)[📘]
      ],
      [
        #text(size: 8.8pt, weight: "black", fill: rgb("#B45309"))[Want to Master 50 Practical Invoices & Job Interviews?]\
        #v(1pt)
        #text(size: 7.2pt, fill: rtech-navy)[
          If you want to learn real-world commercial billing (APMC commodities, electronics, BRS) & Top 50 MNC corporate interview questions from scratch, upgrade to our *51-Page Comprehensive Tally Prime Master Guide*!
        ]
      ],
      [
        #link("https://rtechlab.vercel.app/notes")[
          #box(
            fill: rgb("#047857"),
            radius: 4pt,
            inset: (x: 10pt, y: 6pt),
            [
              #text(size: 8pt, weight: "black", fill: white)[Upgrade for Just ₹27 →]\
              #v(1pt)
              #text(size: 6.5pt, fill: rgb("#A7F3D0"))[(₹49 Master Guide)]
            ]
          )
        ]
      ]
    )
  ]
)

#v(10pt)

#align(center)[
  #text(size: 6.8pt, fill: rtech-muted)[
    © 2027 RTechLab Publications · All Rights Reserved · Unauthorized Resale or Redistribution is Strictly Prohibited.
  ]
]
