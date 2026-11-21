# -*- coding: utf-8 -*-
"""
Tally Prime 50-Invoice Commercial Mega-Workbook Generator
50 Authentic Commercial Invoices directly modeled after Rahul Patel's (IANT Palanpur) curriculum.
100% Light Theme · No Dark Backgrounds
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
"""

def generate_workbook_typst():
    typ = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#CBD5E1"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Page #p])]
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
    #text(weight: "bold", size: 9.5pt, fill: rgb("#0F766E"))[HOW TO USE THIS PRACTICAL WORKBOOK IN YOUR TALLY LAB:]\\
    1. *Create a New Practice Company in Tally Prime:* Set Company Name as `RTechLab Commercial Enterprises Ltd`, State as `Gujarat (24)`.\\
    2. *Enable F11 Features:* Maintain Accounts = Yes, Bill-wise Details = Yes, Maintain Inventory = Yes, Enable GST = Yes (State: Gujarat 24).\\
    3. *Execute Invoices Step-by-Step:* For each invoice, first create the Buyer/Seller Ledgers, Units of Measure, and Stock Items. Select the correct Voucher (#key-pill("F9") for Purchase, #key-pill("F8") for Sales, #key-pill("Alt + F6") for Credit Note, #key-pill("Alt + F5") for Debit Note).\\
    4. *Verify Tax Accuracy:* In the voucher, verify that CGST, SGST, and IGST match the printed invoice totals to the exact paise.
  ]
)

#pagebreak()
"""

    # Real APMC Mandi Invoices (1-10)
    apmc_invoices = [
        ("01", "Purchase", "Shree Ambica Agro Commodities", "APMC Market Yard, Unjha - 384170", "24AAFFA1234F1Z2", "Unbranded Machine Cleaned Jeera (Cumin)", "1209", "50 Bags", "4,200.00", "2,10,000.00", "0%"),
        ("02", "Sales", "Patan Organic Spices & Seeds", "Gunj Bazar, Patan - 384265", "24AACCP9876P1Z3", "Raw Natural Isabgol Seeds (Grade A)", "1211", "100 Bags", "2,800.00", "2,80,000.00", "0%"),
        ("03", "Purchase", "Tharad Agro Producers Co-op", "APMC Yard, Tharad - 385565", "24AABCT5566T1Z8", "Fennel Seeds (Variyali Machine Cleaned)", "0909", "80 Bags", "3,500.00", "2,80,000.00", "0%"),
        ("04", "Sales", "Deesa Grain & Oilseeds Syndicate", "Highway Road, Deesa - 385535", "24AABCD4433D1Z4", "Castor Seeds (Divela Bold)", "1207", "60 Bags", "4,000.00", "2,40,000.00", "0%"),
        ("05", "Purchase", "Dhanera Farmers Mandi", "Station Road, Dhanera - 385310", "24AAEFD3322D1Z1", "Sesame Seeds (Til White Natural)", "1207", "40 Bags", "6,500.00", "2,60,000.00", "0%"),
        ("06", "Sales", "Ahmedabad Spices Wholesale Mart", "Kalupur Market, Ahmedabad - 380001", "24AAKPA8877A1Z9", "Fenugreek Seeds (Methi Dana)", "0910", "70 Bags", "2,500.00", "1,75,000.00", "0%"),
        ("07", "Purchase", "Radhanpur Agriculture Produce Co", "Gunj Bazar, Radhanpur - 385340", "24AAXPR2211R1Z5", "Desi Chana (Whole Brown Gram)", "0713", "120 Bags", "4,000.00", "4,80,000.00", "0%"),
        ("08", "Sales", "Surat Organic Food Hub", "Ring Road, Surat - 395002", "24AAOCS9988S1Z2", "Wheat Tukdi (Grade 1 Sharbati)", "1001", "200 Bags", "2,600.00", "5,20,000.00", "0%"),
        ("09", "Purchase", "Mansa APMC Grain Merchants", "Market Yard, Mansa - 382845", "24AAGPM6655M1Z7", "Green Millet (Hybrid Bajra Seeds)", "1008", "150 Bags", "2,200.00", "3,30,000.00", "0%"),
        ("10", "Sales", "Rajkot Oilseeds & Spices Exchange", "Danapith, Rajkot - 360001", "24AABCR1199R1Z3", "Groundnut in Pods (HPS Bold)", "1202", "90 Bags", "4,500.00", "4,05,000.00", "0%"),
    ]

    typ += """= Part 1: APMC Agricultural Mandi Invoices (0% Exempt Commodities)\n\n"""
    for inv in apmc_invoices:
        typ += f"""== Invoice {inv[0]}: Commercial Tax Invoice — {inv[1]} ({inv[5]})\n"""
        typ += f"""#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [
    *Party / Supplier:*\\
    *{inv[2]}*\\
    {inv[3]}\\
    *GSTIN:* {inv[4]} · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\\
    *RTechLab Commercial Enterprises Ltd*\\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\\
    *Invoice No:* RTL/APMC/{inv[0]} · *Date:* {int(inv[0])+3:02d}-Apr-2026\\
    *Place of Supply:* Gujarat (24) · *Tax Status:* Exempt (0%)
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 {{ rgb("#0E7490") }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[GST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [{inv[5]}], [{inv[6]}], [{inv[7]}], [{inv[8]}], [{inv[9]}], [{inv[10]}], [{inv[9]}],
  [*Total*], [*Net Commercial Invoice Amount*], [], [], [], [*₹{inv[9]}*], [*0%*], [*₹{inv[9]}*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE {inv[0]}")[
  *Voucher Type:* {"Purchase (F9)" if inv[1] == "Purchase" else "Sales (F8)"} -> Item Invoice Mode (#key-pill("Ctrl + H")).\\
  *Party Name:* `{inv[2]}` (Under: *{"Sundry Creditors" if inv[1] == "Purchase" else "Sundry Debtors"}*).\\
  *Account Ledger:* `{"APMC Purchase Exempt (0%)" if inv[1] == "Purchase" else "APMC Sales Exempt (0%)"}` (Under: *{"Purchase Accounts" if inv[1] == "Purchase" else "Sales Accounts"}*).\\
  *Stock Item:* `{inv[5]}` (Under: *Agro Commodities*, HSN: `{inv[6]}`, Taxability: *Exempt*).
]

#v(8pt)
"""

    typ += """#pagebreak()\n= Part 2: Consumer Electronics & IT Hardware Invoices (18% Standard GST)\n\n"""

    # Electronics Invoices (11-20)
    electronics_invoices = [
        ("11", "Purchase", "Shree Arbuda Electronics & Mobiles", "Station Road, Palanpur - 385001", "24ABCDF4321F1Z1", "Vivo Y200e 5G Smartphone", "8517", "10 Nos", "16,000.00", "1,60,000.00", "14,400.00", "1,88,800.00"),
        ("12", "Sales", "Banaskantha Digital Hub", "College Road, Palanpur - 385001", "24AABCB1122B1Z6", "Samsung 43-Inch 4K Smart LED TV", "8528", "5 Nos", "28,000.00", "1,40,000.00", "12,600.00", "1,65,200.00"),
        ("13", "Purchase", "Gujarat Infotech Wholesale", "C.G. Road, Ahmedabad - 380009", "24AAACI5544I1Z8", "HP 15s Intel Core i5 Laptop", "8471", "8 Nos", "44,000.00", "3,52,000.00", "31,680.00", "4,15,360.00"),
        ("14", "Sales", "Ambaji Cyber Cafe & Xerox", "Temple Road, Ambaji - 385110", "24AAJPA6677A1Z3", "Lenovo ThinkCentre Desktop PC", "8471", "4 Nos", "32,000.00", "1,28,000.00", "11,520.00", "1,51,040.00"),
        ("15", "Purchase", "Palanpur Memory & Storage Corp", "Delhi Gate, Palanpur - 385001", "24AABCP8899P1Z5", "Seagate 2TB External USB 3.0 HDD", "8471", "25 Nos", "4,200.00", "1,05,000.00", "9,450.00", "1,23,900.00"),
        ("16", "Sales", "Mehsana Computer Academy", "Modhera Road, Mehsana - 384002", "24AABCM3344M1Z2", "Dell 24-Inch IPS Borderless Monitor", "8528", "12 Nos", "9,500.00", "1,14,000.00", "10,260.00", "1,34,520.00"),
        ("17", "Purchase", "TechConnect Networking Systems", "Ashram Road, Ahmedabad - 380014", "24AAACT7788T1Z4", "D-Link 16-Port Gigabit Switch", "8517", "15 Nos", "3,800.00", "57,000.00", "5,130.00", "67,260.00"),
        ("18", "Sales", "Siddhpur Print Solutions", "Bindu Sarovar Road, Siddhpur - 384151", "24AABCS4455S1Z0", "Canon imageCLASS Laser Printer", "8443", "6 Nos", "14,500.00", "87,000.00", "7,830.00", "1,02,660.00"),
        ("19", "Purchase", "Galaxy Power Solutions", "GIDC, Chhatral, Gandhinagar - 382729", "24AAACG9900G1Z1", "Microtek 1000VA Line Interactive UPS", "8504", "20 Nos", "2,900.00", "58,000.00", "5,220.00", "68,440.00"),
        ("20", "Sales", "Palanpur Smart Devices", "Simla Gate, Palanpur - 385001", "24AABCP7766P1Z7", "Apple iPhone 15 (128GB Black)", "8517", "3 Nos", "65,000.00", "1,95,000.00", "17,550.00", "2,30,100.00"),
    ]

    for inv in electronics_invoices:
        typ += f"""== Invoice {inv[0]}: Commercial Tax Invoice — {inv[1]} ({inv[5]})\n"""
        typ += f"""#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [
    *Party / Supplier:*\\
    *{inv[2]}*\\
    {inv[3]}\\
    *GSTIN:* {inv[4]} · *State:* Gujarat (24)
  ],
  [
    *Trading Counterpart:*\\
    *RTechLab Commercial Enterprises Ltd*\\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\\
    *Invoice No:* RTL/ELEC/{inv[0]} · *Date:* {int(inv[0])+2:02d}-Apr-2026\\
    *Place of Supply:* Gujarat (24) · *GST Rate:* 18% (9% CGST + 9% SGST)
  ]
)

#table(
  columns: (0.4fr, 2.4fr, 0.8fr, 0.6fr, 1fr, 1.2fr, 1fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 {{ rgb("#0E7490") }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[CGST 9%]], [#text(weight: "bold", fill: white)[SGST 9%]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [{inv[5]}], [{inv[6]}], [{inv[7]}], [{inv[8]}], [{inv[9]}], [{inv[10]}], [{inv[10]}], [{inv[11]}],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹{inv[9]}*], [*₹{inv[10]}*], [*₹{inv[10]}*], [*₹{inv[11]}*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE {inv[0]}")[
  *Voucher:* {"Purchase (F9)" if inv[1] == "Purchase" else "Sales (F8)"} -> Item Invoice Mode (#key-pill("Ctrl + H")).\\
  *Tax Ledgers:* Select `CGST` and `SGST` (both under: *Duties & Taxes*, Type: `GST`, Percentage: `0%`).\\
  *Verification:* Press #key-pill("Alt + A") -> #key-pill("Alt + F1") to verify 9% CGST (₹{inv[10]}) and 9% SGST (₹{inv[10]}).
]

#v(8pt)
"""

    typ += """#pagebreak()\n= Part 3: Interstate B2B Trading Invoices (Integrated GST - IGST)\n\n"""

    # Interstate Invoices (21-30)
    interstate_invoices = [
        ("21", "Purchase", "Ply King Timber Mart", "Pune, Maharashtra - 411002", "27AAHCP1122P1Z4", "Maharashtra (27)", "Marine Grade Plywood (18mm 8x4)", "4412", "50 Sheets", "2,400.00", "1,20,000.00", "21,600.00", "1,41,600.00", "18%"),
        ("22", "Sales", "Marwar Network Solutions", "Jaipur, Rajasthan - 302001", "08AABCM7788M1Z5", "Rajasthan (08)", "Cisco Catalyst 24-Port Switch", "8517", "4 Nos", "28,000.00", "1,12,000.00", "20,160.00", "1,32,160.00", "18%"),
        ("23", "Purchase", "Kota Stone Natural Flooring", "Kota, Rajasthan - 324005", "08AAFCK3322K1Z9", "Rajasthan (08)", "Polished Kota Blue Stone Slabs", "6802", "1,000 SqFt", "45.00", "45,000.00", "2,250.00", "47,250.00", "5%"),
        ("24", "Sales", "Bangalore Tech Innovations", "Whitefield, Bangalore - 560066", "29AAACB4433B1Z2", "Karnataka (29)", "Industrial Edge Computing Gateways", "8471", "10 Nos", "18,500.00", "1,85,000.00", "33,300.00", "2,18,300.00", "18%"),
        ("25", "Purchase", "Mumbai Cotton Yarn Spinners", "Bhiwandi, Maharashtra - 421302", "27AAACM8877M1Z6", "Maharashtra (27)", "Combed Cotton Knitting Yarn (30s)", "5205", "1,500 Kgs", "260.00", "3,90,000.00", "19,500.00", "4,09,500.00", "5%"),
        ("26", "Sales", "Indore Agro Processing Corp", "Sanwer Road, Indore - 452015", "23AAACI9911I1Z4", "Madhya Pradesh (23)", "Stainless Steel Seed Sorting Sieves", "8437", "8 Units", "22,000.00", "1,76,000.00", "31,680.00", "2,07,680.00", "18%"),
        ("27", "Purchase", "Delhi Digital Displays Inc", "Nehru Place, New Delhi - 110019", "07AAACD5566D1Z8", "Delhi (07)", "Commercial Interactive Touch Kiosks", "8528", "4 Nos", "55,000.00", "2,20,000.00", "39,600.00", "2,59,600.00", "18%"),
        ("28", "Sales", "Udaipur Heritage Marble Emporium", "Sukher, Udaipur - 313001", "08AAACU1122U1Z3", "Rajasthan (08)", "Diamond Polishing Abrasive Bricks", "6804", "500 Pcs", "180.00", "90,000.00", "16,200.00", "1,06,200.00", "18%"),
        ("29", "Purchase", "Hyderabad Pharma Packaging", "Balanagar, Hyderabad - 500037", "36AAACH7744H1Z1", "Telangana (36)", "Aluminium Blister Packaging Foil", "7607", "400 Kgs", "340.00", "1,36,000.00", "24,480.00", "1,60,480.00", "18%"),
        ("30", "Sales", "Jaipur Handicrafts Exporters", "Sitapura, Jaipur - 302022", "08AAACJ4499J1Z0", "Rajasthan (08)", "Heavy Duty Corrugated Shipping Cartons", "4819", "2,000 Nos", "45.00", "90,000.00", "10,800.00", "1,00,800.00", "12%"),
    ]

    for inv in interstate_invoices:
        typ += f"""== Invoice {inv[0]}: Commercial Interstate Invoice — {inv[1]} ({inv[6]})\n"""
        typ += f"""#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [
    *Party / Supplier:*\\
    *{inv[2]}*\\
    {inv[3]}\\
    *GSTIN:* {inv[4]} · *State:* {inv[5]}
  ],
  [
    *Trading Counterpart:*\\
    *RTechLab Commercial Enterprises Ltd*\\
    Highway Road, Palanpur, Banaskantha, Gujarat - 385001\\
    *Invoice No:* RTL/IGST/{inv[0]} · *Date:* {int(inv[0])-1:02d}-Apr-2026\\
    *Place of Supply:* {inv[5]} · *Tax Type:* Integrated GST (IGST {inv[13]})
  ]
)

#table(
  columns: (0.4fr, 2.6fr, 0.8fr, 0.8fr, 1fr, 1.2fr, 1fr, 1.2fr),
  fill: (col, row) => if row == 0 {{ rgb("#0E7490") }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sr.]], [#text(weight: "bold", fill: white)[Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[Qty]], [#text(weight: "bold", fill: white)[Rate (₹)]], [#text(weight: "bold", fill: white)[Taxable (₹)]], [#text(weight: "bold", fill: white)[IGST]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [1], [{inv[6]}], [{inv[7]}], [{inv[8]}], [{inv[9]}], [{inv[10]}], [{inv[11]}], [{inv[12]}],
  [*Total*], [*Subtotal & Invoice Value*], [], [], [], [*₹{inv[10]}*], [*₹{inv[11]}*], [*₹{inv[12]}*]
)

#shortcut-box(title: "TALLY PRIME EXECUTION — INVOICE {inv[0]} (INTERSTATE IGST)")[
  *Voucher:* {"Purchase (F9)" if inv[1] == "Purchase" else "Sales (F8)"} -> Item Invoice Mode (#key-pill("Ctrl + H")).\\
  *Party Name:* `{inv[2]}` (State: *{inv[5]}*).\\
  *Tax Ledger:* `IGST` (Under: *Duties & Taxes*, Type: `GST`, Tax Type: `Integrated Tax`, Percentage: `0%`).\\
  *Result:* Because party state is outside Gujarat, Tally applies IGST (₹{inv[11]}) and suppresses CGST/SGST.
]

#v(8pt)
"""

    typ += """#pagebreak()\n= Part 4: Composite Multi-Tax Invoices with Discounts (Invoices 31 - 38)\n\n"""

    # Invoices 31-38
    composite_invoices = [
        ("31", "Composite FMCG & Hardware Invoice", "Palanpur Mega Mart", "24AABCP1199P1Z5", "10 Bags Jeera (0%) + 5 Tins Oil (5%) + 2 Printers (18%)", "68,200.00"),
        ("32", "Agro Commodities & Fertilizers Invoice", "Banaskantha Farmers Society", "24AAEFB2288B1Z7", "20 Bags Wheat (0%) + 10 Bags Urea (5%) + 1 Sprayer Pump (18%)", "54,600.00"),
        ("33", "School Uniforms & Computer Lab Supplies", "Palanpur English Medium School", "24AABCS8844S1Z1", "50 Uniforms (5%) + 10 Desktop PCs (18%) + Notebooks (0%)", "3,82,500.00"),
        ("34", "Textile Fabrics & Industrial Dye Invoices", "Surat Weaving Mill Ltd", "24AAACS3377S1Z0", "Cotton Yarn (5%) + Reactive Dyes (18%) + Grey Cotton (0%)", "2,48,000.00"),
        ("35", "Hospital Medical Equipment & Consumables", "Palanpur Civil Hospital Trust", "24AAATP4411P1Z9", "Life Saving Drugs (5%) + Ultrasound Monitor (18%) + Cotton Gauze (0%)", "4,12,000.00"),
        ("36", "Automobile Spare Parts & Engine Lubricants", "Gujarat Motors Workshop", "24AAACG6622G1Z3", "Engine Lubricant Oil (18%) + Rubber Fan Belts (18%) + Battery (18%)", "1,35,700.00"),
        ("37", "Restaurant Grocery & Kitchen Appliances", "Hotel Highway Palace", "24AABCH7711H1Z6", "Basmati Rice (0%) + Refined Sunflower Oil (5%) + Commercial Microwave (18%)", "89,400.00"),
        ("38", "Dairy Farming Feed & Automated Milking Machinery", "Banashree Dairy Farms", "24AAEFB9944B1Z8", "Cattle Feed Chaff (0%) + Mineral Mixture (5%) + Vacuum Milking Pump (18%)", "1,98,000.00"),
    ]

    for inv in composite_invoices:
        typ += f"""== Invoice {inv[0]}: Multi-Rate Commercial Tax Invoice — {inv[1]}\n"""
        typ += f"""#table(
  columns: (1fr, 1fr),
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [
    *Customer / Buyer:*\\
    *{inv[2]}*\\
    *GSTIN:* {inv[3]} · *State:* Gujarat (24)
  ],
  [
    *Issuer:*\\
    *RTechLab Commercial Enterprises Ltd*\\
    *Invoice No:* RTL/COMP/{inv[0]} · *Date:* 24-Apr-2026\\
    *Composition:* Multi-Tax Slabs (0%, 5%, 18%) · *Total Value:* ₹{inv[5]}
  ]
)

#block(
  fill: rgb("#F8FAFC"),
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 6pt,
  radius: 3pt,
  [
    *Items Billed in Single Invoice:* {inv[4]}\\
    *Trade Discount Applied:* 2% across taxable line items before tax calculation.\\
    *Solution Protocol:* In Tally Prime F11, enable *Use Discount Column in Invoices* = Yes. Add stock items with respective tax classifications (0%, 5%, 18%). Tally automatically calculates 2.5% CGST/SGST on 5% items and 9% CGST/SGST on 18% items in the same bill!
  ]
)

#v(8pt)
"""

    typ += """#pagebreak()\n= Part 5: Professional Service Invoices with TDS & Returns (Invoices 39 - 50)\n\n"""

    # TDS Invoices (39-44)
    tds_invoices = [
        ("39", "Section 194J", "CA R.K. Mehta & Associates", "Statutory Audit & GST Annual Audit Fees", "1,00,000.00", "10%", "10,000.00", "90,000.00"),
        ("40", "Section 194I", "Shree Balaji Commercial Real Estate", "Commercial Office Building Rent (Palanpur)", "40,000.00", "10%", "4,000.00", "36,000.00"),
        ("41", "Section 194C", "Gujarat Roadlines Logistics", "Heavy Transport Container Freight Charges", "65,000.00", "2%", "1,300.00", "63,700.00"),
        ("42", "Section 194C", "Creative Vision Advertising Agency", "Hoarding & Digital Billboard Media Production", "85,000.00", "2%", "1,700.00", "83,300.00"),
        ("43", "Section 194H", "Shree Krishna Commercial Brokerage", "APMC Commodity Broking & Mandi Commission", "25,000.00", "5%", "1,250.00", "23,750.00"),
        ("44", "Section 194J", "CyberShield IT Systems Pvt Ltd", "Enterprise ERP & Cloud Software Maintenance", "1,20,000.00", "2%", "2,400.00", "1,17,600.00"),
    ]

    for inv in tds_invoices:
        typ += f"""== Invoice {inv[0]}: Professional Service Invoice with TDS — {inv[1]} ({inv[2]})\n"""
        typ += f"""#table(
  columns: (1fr, 1fr),
  fill: rgb("#F0FDFA"),
  stroke: 0.5pt + rgb("#99F6E4"),
  inset: 5pt,
  [
    *Service Provider (Deductee):*\\
    *{inv[2]}*\\
    *Service Description:* {inv[3]}
  ],
  [
    *Deductor:*\\
    *RTechLab Commercial Enterprises Ltd*\\
    *Invoice No:* SRV/2026/{inv[0]} · *TDS Section:* {inv[1]}\\
    *TDS Rate:* {inv[5]} · *Challan Type:* ITNS 281
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 {{ rgb("#0E7490") }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Service Component]], [#text(weight: "bold", fill: white)[Gross Fee (₹)]], [#text(weight: "bold", fill: white)[TDS Deducted (₹)]], [#text(weight: "bold", fill: white)[Net Payable (₹)]],
  [{inv[3]}], [₹{inv[4]}], [₹{inv[6]} ({inv[5]})], [₹{inv[7]}],
  [*Journal Entry (F7)*], [*Dr. Expense A/c ₹{inv[4]}*], [*Cr. TDS Payable ₹{inv[6]}*], [*Cr. Party A/c ₹{inv[7]}*]
)

#v(8pt)
"""

    # Credit & Debit Notes (45-50)
    returns = [
        ("45", "Credit Note (Alt + F6)", "Sales Return", "Shree Arbuda Electronics", "1 No Vivo Y200e Smartphone (Defective)", "16,000.00", "2,880.00", "18,880.00", "RTL/ELEC/11"),
        ("46", "Credit Note (Alt + F6)", "Rate Difference", "Banaskantha Digital Hub", "Post-sale Volume Turnover Rebate", "10,000.00", "1,800.00", "11,800.00", "RTL/ELEC/12"),
        ("47", "Credit Note (Alt + F6)", "Sales Return", "Patan Organic Spices", "5 Bags Isabgol Seeds (Torn Packaging)", "14,000.00", "0.00", "14,000.00", "RTL/APMC/02"),
        ("48", "Credit Note (Alt + F6)", "Sales Return", "Ambaji Cyber Cafe", "1 No Lenovo Desktop PC (Motherboard issue)", "32,000.00", "5,760.00", "37,760.00", "RTL/ELEC/14"),
        ("49", "Debit Note (Alt + F5)", "Purchase Return", "Shree Arbuda Electronics", "1 No Vivo Y200e returned to vendor", "16,000.00", "2,880.00", "18,880.00", "SAE/2026/0491"),
        ("50", "Debit Note (Alt + F5)", "Purchase Return", "Ply King Timber Mart", "5 Sheets Plywood Damaged in Transit", "12,000.00", "2,160.00", "14,160.00", "PK/MH/2026/088"),
    ]

    for ret in returns:
        typ += f"""== Invoice {ret[0]}: {ret[1]} — {ret[2]} ({ret[3]})\n"""
        typ += f"""#table(
  columns: (1fr, 1fr),
  fill: rgb("#FFFBEB"),
  stroke: 0.5pt + rgb("#FDE68A"),
  inset: 5pt,
  [
    *Party Name:*\\
    *{ret[3]}*\\
    *Particulars:* {ret[4]}
  ],
  [
    *Adjustment Reference:*\\
    *Original Invoice No:* {ret[8]}\\
    *Voucher:* {ret[1]} · *Tax Impact:* Output/Input Tax Reversal
  ]
)

#table(
  columns: (2.5fr, 1.2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 {{ rgb("#0E7490") }} else if calc.even(row) {{ rgb("#F8FAFC") }} else {{ white }},
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reason for Adjustment]], [#text(weight: "bold", fill: white)[Taxable Value (₹)]], [#text(weight: "bold", fill: white)[GST Reversed (₹)]], [#text(weight: "bold", fill: white)[Total Adjustment (₹)]],
  [{ret[4]}], [₹{ret[5]}], [₹{ret[6]}], [₹{ret[7]}],
  [*Statutory Reporting*], [*Linked to {ret[8]}*], [*Table 9B of GSTR-1*], [*ITC Adjusted in GSTR-3B*]
)

#v(8pt)
"""

    # Final Author Motto & Congratulations Page
    typ += """#pagebreak()\n#rtech-final-page(lang: "en", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")\n"""

    return typ
