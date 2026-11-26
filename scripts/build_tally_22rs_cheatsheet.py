import subprocess, os, shutil
from pypdf import PdfReader

BASE_DIR = r"C:\Users\Rahul\Videos\My projects\RtechLab"
typ_path = os.path.join(BASE_DIR, r"DIGITAL\TALLY_PRIME\07_SOURCE_FILES\tally_cheat_sheet_22rs.typ")
out_pdf = os.path.join(BASE_DIR, r"DIGITAL\TALLY_PRIME\01_CORE_MASTER_EDITION\Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-Edition-1.pdf")
pub_pdf = os.path.join(BASE_DIR, r"public\downloads\Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-Edition-1.pdf")

content = '''// =============================================================================
// RTECHLAB LUXURY QUICK DESK REFERENCE & CHEAT SHEET — ₹22 SPECIAL EDITION
// Title: Tally Prime 2027: Corporate Accountant's Daily Desk Reference & Shortcut Cheat Sheet
// Language: Hindi / Hinglish with Authentic Corporate English Terminology
// Author: Rahul Patel (Chief Technology Architect & Founder, RTechLab)
// Target: EXACTLY 6 PAGES (High-Density, Printable Laminated Desk Mat Layout)
// =============================================================================

#let rtech-navy = rgb("#0F172A")        // Slate 900
#let rtech-blue = rgb("#0284C7")        // Sky 600
#let rtech-emerald = rgb("#059669")     // Accounting Emerald Green
#let rtech-amber = rgb("#D97706")       // Taxation Amber Gold
#let rtech-rose = rgb("#DC2626")        // Rose Alert Red
#let rtech-text = rgb("#1E293B")        // Slate 800
#let rtech-muted = rgb("#475569")       // Slate 600
#let rtech-border = rgb("#CBD5E1")      // Slate 300
#let rtech-paper = white                // 100% Pure White

// Highlighters
#let hl-y(body) = highlight(fill: rgb("#FEF08A"), radius: 2pt)[#body]
#let hl-g(body) = highlight(fill: rgb("#DCFCE7"), radius: 2pt)[#body]
#let hl-o(body) = highlight(fill: rgb("#FFEDD5"), radius: 2pt)[#body]
#let mark-y(body) = highlight(fill: rgb("#FEF9C3"), radius: 2pt)[#underline(stroke: 1.5pt + rgb("#EAB308"), offset: 1.8pt)[#body]]

#let keypill(label, col: rtech-navy) = box(
  fill: col,
  radius: 2.5pt,
  inset: (x: 4.5pt, y: 2pt),
  text(size: 7.2pt, font: ("Consolas", "Courier New", "Segoe UI"), weight: "bold", fill: white)[#label]
)

#set page(
  paper: "a4",
  margin: (x: 10mm, top: 12mm, bottom: 10mm),
  fill: rtech-paper,

  // Subtle Premium Security Watermark
  background: context {
    let p = counter(page).get().first()
    place(
      center + horizon,
      rotate(
        -30deg,
        block(
          align(center)[
            #text(size: 38pt, weight: "black", fill: rgb(2, 132, 199, 3.5%), tracking: 4pt)[
              RTECHLAB
            ]
            #v(4pt)
            #text(size: 13pt, weight: "bold", fill: rgb(15, 23, 42, 3%), tracking: 5pt)[
              DESK CHEAT SHEET · 2027 EDITION
            ]
          ]
        )
      )
    )
  },

  // Running Header
  header: context {
    let p = counter(page).get().first()
    block(
      width: 100%,
      stroke: (bottom: 0.5pt + rgb("#CBD5E1")),
      inset: (bottom: 1.8mm),
      [
        #grid(
          columns: (1fr, auto),
          align: (left, right),
          [
            #text(size: 8pt, weight: "black", fill: rtech-navy)[RTECHLAB]
            #text(size: 8pt, fill: rtech-emerald, weight: "bold")[ | Tally Prime 2027 Daily Desk Reference & Hotkey Sheet]
          ],
          [
            #text(size: 7.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-blue, weight: "bold")[
              ₹22 Special Productivity Edition
            ]
            #text(size: 7.5pt, fill: rgb("#94A3B8"))[ · ]
            #text(size: 7.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-muted)[
              Rahul Patel
            ]
          ]
        )
      ]
    )
  },

  // Running Footer
  footer: context {
    let p = counter(page).get().first()
    block(
      width: 100%,
      stroke: (top: 0.5pt + rgb("#CBD5E1")),
      inset: (top: 1.8mm),
      [
        #grid(
          columns: (1fr, auto),
          align: (left, right),
          [
            #text(size: 6.8pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-muted)[
              #text(fill: rtech-emerald)[●] Technology Made Practical · Print & Keep on Your Accounting Desk · Free Tools: #link("https://rtechlab.vercel.app/tools")[#text(fill: rtech-blue, weight: "bold")[rtechlab.vercel.app/tools]]
            ]
          ],
          [
            #box(
              fill: rgb("#F1F5F9"),
              stroke: 0.5pt + rgb("#64748B"),
              radius: 3pt,
              inset: (x: 5pt, y: 1.5pt),
              text(size: 7pt, weight: "black", fill: rtech-navy)[Page #p of 6]
            )
          ]
        )
      ]
    )
  }
)

#set text(
  font: ("Segoe UI", "Nirmala UI", "Arial"),
  size: 8.2pt,
  fill: rtech-text,
  spacing: 110%,
  lang: "hi"
)

#set par(
  justify: true,
  leading: 0.50em,
  first-line-indent: 0pt
)

// Section Banner
#let module-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-emerald) = {
  v(3pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3.5pt + color, rest: 0.5pt + rtech-border),
    radius: (right: 4pt),
    inset: (x: 8pt, y: 4.5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 6pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 5pt, y: 2pt),
            text(size: 6.8pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 9.8pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(3pt)
}

// =============================================================================
// PAGE 01: QUICK INDEX, GOLDEN RULES & 28 PREDEFINED GROUPS MATRIX
// =============================================================================

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 2.5pt),
    text(size: 7.5pt, weight: "bold", fill: rtech-blue)[⚡ RTechLab Professional Cheat Sheet · 100% Practical Table-First Edition]
  )
  #v(2pt)
  #text(size: 15pt, weight: "black", fill: rtech-navy)[Tally Prime: व्यावसायिक अकाउंटेंट डेली डेस्क रेफरेंस]
  #v(1.5pt)
  #text(size: 7.8pt, fill: rtech-muted)[24 वाउचर्स · 28 ग्रुप्स · गोल्डन रूल्स · आधुनिक GST स्लैब · TDS दरें · Top 35 हॉटकीज · वर्षान्त फाइनल अकाउंट्स]
  #v(3pt)
  #line(length: 100%, stroke: 1pt + rtech-emerald)
]

#v(2pt)

// Quick Mini Navigation Index Bar
#block(
  width: 100%,
  stroke: 0.5pt + rtech-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 6pt, y: 3.5pt),
  [
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      align: center,
      [#text(size: 7pt, weight: "bold", fill: rtech-emerald)[P1: रूल्स व 28 ग्रुप्स]],
      [#text(size: 7pt, weight: "bold", fill: rtech-blue)[P2: 24 वाउचर्स मास्टर]],
      [#text(size: 7pt, weight: "bold", fill: rtech-amber)[P3: GST व E-इनवॉइस]],
      [#text(size: 7pt, weight: "bold", fill: rtech-rose)[P4: TDS सेक्शन व दरें]],
      [#text(size: 7pt, weight: "bold", fill: rtech-navy)[P5: Top 35 शॉर्टकट्स]],
    )
  ]
)

#module-banner(num: "MODULE 01", title: "दोहरा लेखा प्रणाली के 3 गोल्डन रूल्स (The 3 Golden Rules)", color: rtech-emerald)

#table(
  columns: (1.2fr, 2fr, 1.4fr, 1.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 4.2pt,

  text(size: 7.2pt, weight: "bold", fill: white)[खाते का प्रकार (Account Type)],
  text(size: 7.2pt, weight: "bold", fill: white)[लेखांकन का मूल नियम (Golden Rule)],
  text(size: 7.2pt, weight: "bold", fill: white)[डेबिट कब करें? (Dr)],
  text(size: 7.2pt, weight: "bold", fill: white)[क्रेडिट कब करें? (Cr)],

  [#text(weight: "bold", fill: rtech-blue)[1. व्यक्तिगत खाता]\ (Personal Account)],
  [#hl-y[पाने वाले को नाम (Debit) करो,] \ #hl-y[देने वाले को जमा (Credit) करो।]],
  [#text(fill: rtech-emerald, weight: "bold")[Debit the Receiver]\ (उदा. Ramesh Dr)],
  [#text(fill: rtech-rose, weight: "bold")[Credit the Giver]\ (उदा. To Suresh)],

  [#text(weight: "bold", fill: rtech-emerald)[2. वास्तविक खाता]\ (Real Account)],
  [#hl-g[व्यापार में आने वाली संपत्ति को Debit,] \ #hl-g[व्यापार से जाने वाली संपत्ति को Credit।]],
  [#text(fill: rtech-emerald, weight: "bold")[What Comes In Dr]\ (उदा. Cash / Machinery)],
  [#text(fill: rtech-rose, weight: "bold")[What Goes Out Cr]\ (उदा. To Cash)],

  [#text(weight: "bold", fill: rtech-amber)[3. नाममात्र खाता]\ (Nominal Account)],
  [#hl-o[सभी खर्चों एवं हानियों को Debit करो,] \ #hl-o[सभी आय, लाभ एवं आमदनी को Credit करो।]],
  [#text(fill: rtech-emerald, weight: "bold")[Expenses & Losses Dr]\ (उदा. Salary / Rent Dr)],
  [#text(fill: rtech-rose, weight: "bold")[Incomes & Gains Cr]\ (उदा. To Interest / Commission)],
)

#v(1pt)
#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 0.5pt + rgb("#BAE6FD"),
    radius: 2pt,
    inset: (x: 8pt, y: 2pt),
    text(size: 7.2pt, weight: "black", fill: rtech-blue)[गोल्डन समीकरण: कुल संपत्तियां (Assets) = बाह्य देनदारियां (Liabilities) + स्वामी की पूंजी (Capital)]
  )
]

#module-banner(num: "MODULE 02", title: "Tally Prime के 28 पूर्व-निर्धारित ग्रुप्स (28 Master Groups)", color: rtech-blue)

#table(
  columns: (1.5fr, 1.1fr, 1.2fr, 2.2fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.8pt,

  text(size: 7.2pt, weight: "bold", fill: white)[ग्रुप का नाम (Tally Group)],
  text(size: 7.2pt, weight: "bold", fill: white)[प्रकृति (Nature)],
  text(size: 7.2pt, weight: "bold", fill: white)[प्राइमरी / सब-ग्रुप],
  text(size: 7.2pt, weight: "bold", fill: white)[वाणिज्यिक लेजर का उदाहरण (Commercial Example)],

  [#text(weight: "bold")[Capital Account]], [Balance Sheet], [Primary (Liab)], [मालिक की पूंजी (Proprietor Capital), Drawings A/c],
  [#text(weight: "bold")[Loans (Liability)]], [Balance Sheet], [Primary (Liab)], [Bank Term Loan (SBI, HDFC), Unsecured Friend Loan],
  [#text(weight: "bold")[Current Liabilities]], [Balance Sheet], [Primary (Liab)], [वे सभी देनदारियां जो 12 माह में चुकानी हैं],
  [#text(weight: "bold", fill: rtech-rose)[Sundry Creditors]], [Balance Sheet], [Sub: Current Liab], [#hl-y[लेनदार / सप्लायर] जिनसे उधारी पर माल खरीदा],
  [#text(weight: "bold")[Duties & Taxes]], [Balance Sheet], [Sub: Current Liab], [#hl-o[CGST, SGST, IGST, TDS Payable], TCS A/c],
  [#text(weight: "bold")[Provisions]], [Balance Sheet], [Sub: Current Liab], [Provision for Tax, Provision for Depreciation],
  [#text(weight: "bold")[Fixed Assets]], [Balance Sheet], [Primary (Asset)], [व्यापारिक संपत्तियां: Computer, Furniture, Machinery],
  [#text(weight: "bold")[Current Assets]], [Balance Sheet], [Primary (Asset)], [वे संपत्तियां जो 1 वर्ष के भीतर नकदी बन सकती हैं],
  [#text(weight: "bold", fill: rtech-emerald)[Sundry Debtors]], [Balance Sheet], [Sub: Current Assets], [#hl-g[देनदार / ग्राहक] जिन्हें उधारी पर माल बेचा गया],
  [#text(weight: "bold")[Bank Accounts]], [Balance Sheet], [Sub: Current Assets], [चालू व बचत खाते: SBI Current A/c, ICICI A/c],
  [#text(weight: "bold")[Cash-in-Hand]], [Balance Sheet], [Sub: Current Assets], [तिजोरी में रखी नकदी: Cash A/c, Petty Cash],
  [#text(weight: "bold")[Stock-in-Hand]], [Balance Sheet], [Sub: Current Assets], [दुकान/गोदाम में रखा अविक्रित माल (Closing Stock)],
  [#text(weight: "bold")[Purchase Accounts]], [Trading P&L], [Primary (Exp)], [माल की खरीद (Local Purchase, Interstate Purchase)],
  [#text(weight: "bold")[Sales Accounts]], [Trading P&L], [Primary (Inc)], [माल की बिक्री (Local Sales GST, Export Sales)],
  [#text(weight: "bold")[Direct Expenses]], [Trading P&L], [Primary (Exp)], [उत्पादन से जुड़े खर्च: Freight Inward, Factory Wages],
  [#text(weight: "bold")[Indirect Expenses]], [Profit & Loss], [Primary (Exp)], [ऑफिस खर्च: Office Rent, Staff Salary, Tea & Snacks],
  [#text(weight: "bold")[Direct Incomes]], [Trading P&L], [Primary (Inc)], [फैक्ट्री सीधे जॉब-वर्क या व्यावसायिक डिलीवरी शुल्क],
  [#text(weight: "bold")[Indirect Incomes]], [Profit & Loss], [Primary (Inc)], [अन्य आमदनी: Bank Interest Received, Discount Received],
)

#v(2pt)
#text(size: 6.8pt, fill: rtech-muted)[#text(fill: rtech-amber, weight: "bold")[★ प्रो-टिप:] लेजर बनाते समय यदि ग्रुप गलत चुन लिया जाए, तो Balance Sheet और P&L दोनों गलत हो जाते हैं। संशय होने पर 'F12' दबाकर ग्रुप विवरण जांचें।]

#pagebreak()

// =============================================================================
// PAGE 02: 24 TALLY PRIME VOUCHER KEYS & ACCOUNTING WORKFLOW CHEAT SHEET
// =============================================================================

#module-banner(num: "MODULE 03", title: "Tally Prime के 24 वाउचर्स एवं त्वरित चयन गाइड (24 Voucher Guide)", color: rtech-blue)

#text(size: 7.8pt)[Tally Prime में वित्तीय और स्टॉक लेन-देन दर्ज करने के लिए गेटवे ऑफ टैली से #hl-y[`V` (Vouchers)] दबाएं। नीचे सभी फंक्शन कीज का त्वरित गाइड है:]

#v(2pt)

#table(
  columns: (1fr, 1.4fr, 2.4fr, 1.2fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 4pt,

  text(size: 7.2pt, weight: "bold", fill: white)[शॉर्टकट की],
  text(size: 7.2pt, weight: "bold", fill: white)[वाउचर का नाम],
  text(size: 7.2pt, weight: "bold", fill: white)[व्यावसायिक उपयोग एवं नियम (Usage & Purpose)],
  text(size: 7.2pt, weight: "bold", fill: white)[गोल्डन उदाहरण],

  [#keypill("F4", col: rtech-blue)],
  [#text(weight: "bold")[Contra Voucher]],
  [#hl-y[केवल बैंक और कैश का आंतरिक लेन-देन।] बैंक में नकद जमा, बैंक से नकद निकासी, या बैंक से बैंक ट्रांसफर।],
  [Bank Dr / Cash Cr\ Cash Dr / Bank Cr],

  [#keypill("F5", col: rtech-rose)],
  [#text(weight: "bold")[Payment Voucher]],
  [#hl-o[व्यापार से धन का बाहर जाना।] सप्लायर को भुगतान, ऑफिस किराया, वेतन, या बिजली बिल का नकद/चेक द्वारा भुगतान।],
  [Rent Dr / Cash Cr\ Vendor Dr / Bank Cr],

  [#keypill("F6", col: rtech-emerald)],
  [#text(weight: "bold")[Receipt Voucher]],
  [#hl-g[व्यापार में धन का अंदर आना।] ग्राहक से बकाया वसूली, बैंक ब्याज प्राप्त होना, या मालिक द्वारा अतिरिक्त पूंजी लाना।],
  [Bank Dr / Customer Cr\ Cash Dr / Capital Cr],

  [#keypill("F7", col: rtech-navy)],
  [#text(weight: "bold")[Journal Voucher]],
  [#hl-y[गैर-नकद समायोजन (Non-cash Adjustment)।] संपत्तियों का मूल्यह्रास (Depreciation), त्रुटि सुधार, उधारी पर संपत्ति खरीद।],
  [Depreciation Dr / Fixed Asset Cr],

  [#keypill("F8", col: rtech-emerald)],
  [#text(weight: "bold")[Sales Voucher]],
  [#hl-g[माल अथवा सेवाओं की बिक्री।] चाहे नकद हो या उधारी। इसी वाउचर से GST टैक्स इनवॉइस जेनरेट होता है।],
  [Debtor / Cash Dr\ To Sales / To GST],

  [#keypill("F9", col: rtech-amber)],
  [#text(weight: "bold")[Purchase Voucher]],
  [#hl-o[माल अथवा कच्चे माल की इनवर्ड खरीद।] सप्लायर का बिल नंबर और तारीख दर्ज करके GST ITC क्लेम करने के लिए।],
  [Purchase Dr / GST Dr\ To Creditor / Bank],

  [#keypill("Alt + F5", col: rtech-navy)],
  [#text(weight: "bold", fill: rtech-rose)[Debit Note]],
  [#hl-o[खरीद वापसी (Purchase Return)] या सप्लायर को बिल राशि कम करने हेतु डेबिट करना (उदा. खराब माल लौटाया)।],
  [Supplier Dr\ To Purchase Return],

  [#keypill("Alt + F6", col: rtech-navy)],
  [#text(weight: "bold", fill: rtech-emerald)[Credit Note]],
  [#hl-g[बिक्री वापसी (Sales Return)] अथवा ग्राहक को छूट/दर अंतर देने के लिए इनवॉइस वैल्यू घटाना।],
  [Sales Return Dr\ To Customer Cr],

  [#keypill("Alt + F7", col: rtech-navy)],
  [#text(weight: "bold")[Stock Journal]],
  [#hl-y[इन्वेंट्री का स्थान परिवर्तन।] एक गोदाम (Godown A) से दूसरे गोदाम (Godown B) में ट्रांसफर या मैन्युफैक्चरिंग।],
  [Destination Godown\ Source Godown],

  [#keypill("Alt + F8", col: rtech-navy)],
  [#text(weight: "bold")[Delivery Note]],
  [बिक्री चालान। बिना तुरंत इनवॉइस बनाए केवल माल को ग्राहक तक भेजने के लिए (Delivery Challan)।],
  [Customer Tracker],

  [#keypill("Alt + F9", col: rtech-navy)],
  [#text(weight: "bold")[Receipt Note]],
  [आवक चालान। सप्लायर से माल गोदाम में प्राप्त हुआ लेकिन पक्का बिल (Invoice) अभी नहीं आया।],
  [Goods Inward Track],

  [#keypill("Alt + F10", col: rtech-navy)],
  [#text(weight: "bold")[Physical Stock]],
  [दुकान या गोदाम में वास्तविक गिनती (Physical Count) के बाद बुक स्टॉक को एक्चुअल स्टॉक से मिलाना।],
  [Actual Qty Match],

  [#keypill("Ctrl + F8", col: rtech-navy)],
  [#text(weight: "bold")[Rejection Out]],
  [चालान पर आए माल में से खराब सामान को बिल बनने से पहले ही सप्लायर को वापस लौटाना।],
  [Pre-Bill Return],

  [#keypill("Ctrl + F9", col: rtech-navy)],
  [#text(weight: "bold")[Rejection In]],
  [डिलीवरी चालान पर ग्राहक को भेजे गए माल में से ग्राहक द्वारा खारिज माल को वापस लेना।],
  [Pre-Bill Rejection],
)

#v(3pt)

#module-banner(num: "MODULE 04", title: "वाउचर मोड परिवर्तन: Ctrl + H (Change Mode Master Trick)", color: rtech-amber)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 5pt,
      radius: 3pt,
      [
        #text(weight: "bold", fill: rtech-blue)[1. Item Invoice Mode:]\
        #text(size: 7pt, fill: rtech-muted)[दुकानों व ट्रेडिंग के लिए बेस्ट। इसमें आइटम का नाम, गोदाम, मात्रा (Qty), दर (Rate) और GST टैक्स अलग-अलग दिखते हैं।]
      ]
    )
  ],
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 5pt,
      radius: 3pt,
      [
        #text(weight: "bold", fill: rtech-emerald)[2. Accounting Invoice Mode:]\
        #text(size: 7pt, fill: rtech-muted)[सर्विस इंडस्ट्री (CA, कंसल्टेंट, किराया) के लिए। इसमें बिना क्वांटिटी (Qty) के सीधे सेवा शुल्क व GST जोड़ा जाता है।]
      ]
    )
  ],
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 5pt,
      radius: 3pt,
      [
        #text(weight: "bold", fill: rtech-navy)[3. As Voucher Mode:]\
        #text(size: 7pt, fill: rtech-muted)[पारंपरिक डेबिट (Dr/By) और क्रेडिट (Cr/To) फॉर्मेट। अकाउंटेंट जिन्हें सीधे जर्नल स्टाइल में एंट्री पसंद है।]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 03: MODERN GST FRAMEWORK (0%, 5%, 18%) & COMMERCIAL E-INVOICING
// =============================================================================

#module-banner(num: "MODULE 05", title: "आधुनिक GST संरचना एवं टैक्स लेजर मैपिंग (Modern GST Framework)", color: rtech-amber)

#text(size: 7.8pt)[Tally Prime में GST लागू करने का स्वर्णिम नियम: माल राज्य के अंदर बिक रहा है या राज्य के बाहर:]

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      stroke: 1pt + rgb("#BAE6FD"),
      fill: rgb("#F0F9FF"),
      inset: 6pt,
      radius: 4pt,
      [
        #text(size: 8.5pt, weight: "bold", fill: rtech-blue)[A. अंतःराज्य बिक्री (Intra-State Sale)]\
        #v(2pt)
        #text(size: 7.2pt)[*नियम:* जब विक्रेता और खरीदार दोनों #hl-y[एक ही राज्य] के हों (उदा. गुजरात से गुजरात)।\
        *टैक्स लेजर्स:* कर 50-50% दो भागों में बंटता है:\
        - #hl-g[CGST (Central Tax)]: 50% केंद्र सरकार को\
        - #hl-g[SGST (State Tax)]: 50% राज्य सरकार को\
        *उदा. 18% GST पर:* 9% CGST + 9% SGST लगेगा।]
      ]
    )
  ],
  [
    #block(
      stroke: 1pt + rgb("#FED7AA"),
      fill: rgb("#FFF7ED"),
      inset: 6pt,
      radius: 4pt,
      [
        #text(size: 8.5pt, weight: "bold", fill: rtech-amber)[B. अंतरराज्यीय बिक्री (Inter-State Sale)]\
        #v(2pt)
        #text(size: 7.2pt)[*नियम:* जब विक्रेता और खरीदार #hl-o[दो अलग राज्यों] के हों (उदा. गुजरात से महाराष्ट्र)।\
        *टैक्स लेजर्स:* केवल एक एकीकृत कर लगेगा:\
        - #hl-o[IGST (Integrated Tax)]: पूरा 100% टैक्स\
        *उदा. 18% GST पर:* सीधा 18% IGST जुड़ेगा। (CGST व SGST शून्य रहेंगे)।]
      ]
    )
  ]
)

#v(3pt)

#module-banner(num: "MODULE 06", title: "व्यावसायिक GST दर मैट्रिक्स (GST Slabs by Commodity)", color: rtech-emerald)

#table(
  columns: (1.1fr, 2fr, 1.4fr, 1.5fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 4pt,

  text(size: 7.2pt, weight: "bold", fill: white)[GST स्लैब],
  text(size: 7.2pt, weight: "bold", fill: white)[प्रमुख वस्तुएं एवं उद्योग (Commodities)],
  text(size: 7.2pt, weight: "bold", fill: white)[HSN/SAC कोड उदाहरण],
  text(size: 7.2pt, weight: "bold", fill: white)[Tally Prime एंट्री SOP],

  [#keypill("0% (Nil/Exempt)", col: rtech-navy)],
  [कृषि उत्पाद (APMC जीरा, इसबगोल, अनाज, ताजी सब्जियां, अनब्रांडेड आटा, दूध)],
  [HSN 0909 (Jeera)\ HSN 1211 (Isabgol)],
  [Taxability: #hl-g[Exempt / Nil Rated]\ कोई CGST/SGST नहीं जुड़ेगा।],

  [#keypill("5% Slab", col: rtech-amber)],
  [ब्रांडेड पैकेज्ड खाद्यान्न, चाय पत्ती, चीनी, कोयला, 1000 रु. से कम के जूते/कपड़े, ट्रांसपोर्ट],
  [HSN 0902 (Tea)\ HSN 1701 (Sugar)],
  [Intra: #hl-y[2.5% CGST + 2.5% SGST]\ Inter: #hl-y[5% IGST]],

  [#keypill("12% Slab", col: rtech-blue)],
  [प्रोसेस्ड फूड, घी, मक्खन, दवाइयां, मोबाइल फोन (पहले), स्टेशनरी आइटम्स],
  [HSN 0405 (Butter)\ HSN 3004 (Medicines)],
  [Intra: #hl-o[6% CGST + 6% SGST]\ Inter: #hl-o[12% IGST]],

  [#keypill("18% Slab", col: rtech-emerald)],
  [#hl-g[सर्वाधिक प्रयुक्त!] इलेक्ट्रॉनिक्स, कंप्यूटर हार्डवेयर, IT सर्विसेज, AC रेस्टोरेंट, इंडस्ट्रियल गुड्स],
  [HSN 8471 (Computers)\ SAC 9983 (IT Services)],
  [Intra: #hl-g[9% CGST + 9% SGST]\ Inter: #hl-g[18% IGST]],

  [#keypill("28% Slab", col: rtech-rose)],
  [विलासिता वस्तुएं: लग्जरी कारें, सीमेंट, तंबाकू, कोल्ड ड्रिंक, ऑनलाइन गेमिंग],
  [HSN 8703 (Motor Cars)\ HSN 2523 (Cement)],
  [Intra: 14% CGST + 14% SGST\ (+ उपकर/Cess यदि लागू हो)],
)

#v(3pt)

#module-banner(num: "MODULE 07", title: "Rule 46 टैक्स इनवॉइस अनिवार्यताएं (Tax Invoice Mandatory Checklist)", color: rtech-navy)

#block(
  width: 100%,
  stroke: 0.5pt + rtech-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 10pt,
      [
        #text(size: 7.5pt)[
          - #text(weight: "bold")[1. क्रमिक बिल नंबर (Invoice No):] वित्तीय वर्ष में अधिकतम 16 अक्षरों का अनूठा नंबर (उदा. `RTL/26-27/0042`)।
          - #text(weight: "bold")[2. जारी करने की तिथि (Date):] माल डिस्पेच से पूर्व या उसी दिन।
          - #text(weight: "bold")[3. सप्लायर विवरण:] नाम, पता और 15-अंकों का आधिकारिक GSTIN।
          - #text(weight: "bold")[4. ग्राहक विवरण:] नाम, पता, GSTIN और राज्य का नाम व कोड।
        ]
      ],
      [
        #text(size: 7.5pt)[
          - #text(weight: "bold")[5. प्लेस ऑफ सप्लाई (Place of Supply - POS):] कर निर्धारण का मूल।
          - #text(weight: "bold")[6. HSN/SAC कोड:] 5 करोड़ टर्नओवर पर 4-अंक, 5 करोड़ से अधिक पर 6-अंक।
          - #text(weight: "bold")[7. कर विभाजन:] टैक्सेबल वैल्यू, टैक्स दर, CGST, SGST व IGST।
          - #text(weight: "bold")[8. डिजिटल सिग्नेचर / QR कोड:] ई-इनवॉइसिंग हेतु अनिवार्य।
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 04: CORPORATE TDS SECTIONS & RATES MATRIX (FY 2026-27)
// =============================================================================

#module-banner(num: "MODULE 08", title: "कॉर्पोरेट TDS दरें एवं सीमाएं (Corporate TDS Master Reference)", color: rtech-rose)

#text(size: 7.8pt)[TDS (Tax Deducted at Source) आयकर अधिनियम के तहत भुगतानकर्ता द्वारा काटा जाने वाला अग्रिम कर है:]

#v(2pt)

#table(
  columns: (1.2fr, 2.2fr, 1.2fr, 1.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 4.2pt,

  text(size: 7.2pt, weight: "bold", fill: white)[TDS सेक्शन],
  text(size: 7.2pt, weight: "bold", fill: white)[भुगतान की प्रकृति (Nature of Payment)],
  text(size: 7.2pt, weight: "bold", fill: white)[TDS दर (Rate)],
  text(size: 7.2pt, weight: "bold", fill: white)[वार्षिक छूट सीमा (Threshold)],

  [#text(weight: "bold", fill: rtech-rose)[Section 194C]],
  [ठेकेदार / उप-ठेकेदार भुगतान (Advertising, Transport, Building, Job Work)],
  [#hl-o[1%] (व्यक्ति/HUF)\ #hl-o[2%] (कंपनी/फर्म)],
  [एकल बिल > ₹30,000\ या वर्ष में कुल > ₹1,00,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 194J]],
  [पेशेवर एवं तकनीकी शुल्क (CA, वकील, इंजीनियर, सॉफ्टवेयर कंसल्टेंट, डायरेक्टर फीस)],
  [#hl-o[10%] (पेशेवर सेवा)\ #hl-o[2%] (तकनीकी सेवा)],
  [वित्तीय वर्ष में > ₹30,000 (डायरेक्टर फीस पर कोई सीमा नहीं)],

  [#text(weight: "bold", fill: rtech-rose)[Section 194I]],
  [किराया भुगतान (कार्यालय, दुकान, गोदाम, फैक्ट्री या प्लांट और मशीनरी)],
  [#hl-o[2%] (मशीनरी)\ #hl-o[10%] (जमीन/भवन)],
  [वित्तीय वर्ष में कुल किराया > ₹2,40,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 194H]],
  [कमीशन अथवा ब्रोकरेज (दलाली, प्रॉपर्टी एजेंट कमीशन, डायरेक्ट सेलिंग)],
  [#hl-o[5%]],
  [वित्तीय वर्ष में कुल कमीशन > ₹15,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 194Q]],
  [माल की खरीद पर क्रेता द्वारा TDS (क्रेता का टर्नओवर > ₹10 करोड़ हो)],
  [#hl-o[0.1%]],
  [एक सप्लायर से वार्षिक खरीद > ₹50,00,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 194A]],
  [ब्याज भुगतान (बैंक ब्याज अथवा सावधि जमा / अनसिक्योर्ड लोन पर ब्याज)],
  [#hl-o[10%]],
  [बैंक: ₹40,000 (सीनियर सिटीजन ₹50k), अन्य: ₹5,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 206AA]],
  [#mark-y[दंडात्मक नियम:] यदि वेंडर वैध PAN कार्ड जमा नहीं कराता],
  [#keypill("20% Flat", col: rtech-rose)],
  [कोई छूट सीमा नहीं (No Threshold)],
)

#v(3pt)

#module-banner(num: "MODULE 09", title: "Tally Prime में TDS की 3-चरणीय व्यावहारिक प्रविष्टि (3-Step TDS Flow)", color: rtech-emerald)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  [
    #block(
      stroke: 0.8pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 6pt,
      radius: 4pt,
      [
        #text(size: 8pt, weight: "bold", fill: rtech-navy)[चरण 1: खर्च व बिल की बुकिंग]\
        #v(2pt)
        #text(size: 7pt)[*वाउचर:* #hl-y[Journal (F7)]\
        - Audit Fee Dr (खर्च पूरा)\
        - #text(fill: rtech-rose)[To TDS Payable Cr (10% कटा)]\
        - #text(fill: rtech-emerald)[To CA Ramesh & Co. Cr (90% शुद्ध देय)]]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 6pt,
      radius: 4pt,
      [
        #text(size: 8pt, weight: "bold", fill: rtech-navy)[चरण 2: वेंडर को शुद्ध भुगतान]\
        #v(2pt)
        #text(size: 7pt)[*वाउचर:* #hl-o[Payment (F5)]\
        - CA Ramesh & Co. Dr (90%)\
        - To Bank Current A/c Cr\
        *(वेंडर का खाता शून्य हो गया, TDS लायबिलिटी में खड़ा रहा)*]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 6pt,
      radius: 4pt,
      [
        #text(size: 8pt, weight: "bold", fill: rtech-navy)[चरण 3: सरकारी चालान 281]\
        #v(2pt)
        #text(size: 7pt)[*वाउचर:* #hl-g[Payment (F5) -> Auto Fill]\
        - TDS Payable Dr\
        - To Bank A/c Cr\
        *(अगले माह की 7 तारीख तक चालान ITNS 281 से जमा करें)*]
      ]
    )
  ]
)

#v(3pt)

#module-banner(num: "MODULE 10", title: "Form 26Q त्रैमासिक रिटर्न कैलेंडर (TDS Return Deadlines)", color: rtech-navy)

#table(
  columns: (1fr, 2fr, 2fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.8pt,

  text(size: 7.2pt, weight: "bold", fill: white)[तिमाही (Quarter)],
  text(size: 7.2pt, weight: "bold", fill: white)[अवधि (Period)],
  text(size: 7.2pt, weight: "bold", fill: white)[फॉर्म 26Q जमा करने की अंतिम तिथि (Due Date)],

  [Q1 (Quarter 1)], [1 अप्रैल से 30 जून], [#hl-g[31 जुलाई] (विलंब शुल्क: ₹200 प्रतिदिन)],
  [Q2 (Quarter 2)], [1 जुलाई से 30 सितंबर], [#hl-g[31 अक्टूबर]],
  [Q3 (Quarter 3)], [1 अक्टूबर से 31 दिसंबर], [#hl-g[31 जनवरी]],
  [Q4 (Quarter 4)], [1 जनवरी से 31 मार्च], [#hl-g[31 मई] (वार्षिक मिलान हेतु अतिरिक्त समय)],
)

#pagebreak()

// =============================================================================
// PAGE 05: TOP 35 UNIVERSAL TALLY PRIME HOTKEYS & YEAR-END AUDIT PROTOCOL
// =============================================================================

#module-banner(num: "MODULE 11", title: "शीर्ष 35 यूनिवर्सल Tally Prime कीबोर्ड शॉर्टकट्स (Top 35 Hotkeys)", color: rtech-emerald)

#text(size: 7.8pt)[माउस का प्रयोग बंद करें! प्रो-अकाउंटेंट केवल कीबोर्ड शॉर्टकट्स से सामान्य व्यक्ति से 5 गुना तेजी से काम करते हैं:]

#v(2pt)

#table(
  columns: (1fr, 1.8fr, 1fr, 1.8fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 7pt, weight: "bold", fill: white)[कार्य (Action)],
  text(size: 7pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 7pt, weight: "bold", fill: white)[कार्य (Action)],

  [#keypill("Alt + G", col: rtech-blue)],
  [#hl-y[GoTo मास्टर सर्च] (किसी भी रिपोर्ट में कूदें)],
  [#keypill("Ctrl + A", col: rtech-blue)],
  [#hl-g[1-क्लिक सेव] (बिना एंटर-एंटर दबाए)],

  [#keypill("Alt + C", col: rtech-emerald)],
  [#hl-y[त्वरित लेजर/आइटम निर्माण] (वाउचर के अंदर)],
  [#keypill("Ctrl + Enter", col: rtech-emerald)],
  [#hl-y[मास्टर ऑल्टर] (रिपोर्ट से सीधे बदलाव)],

  [#keypill("Alt + D", col: rtech-amber)],
  [वाउचर अथवा लेजर को डिलीट करना],
  [#keypill("Alt + F1 / F5", col: rtech-amber)],
  [विस्तृत (Detailed Tree View) देखना],

  [#keypill("F2", col: rtech-navy)],
  [वाउचर अथवा रिपोर्ट की तारीख बदलना],
  [#keypill("Alt + F2", col: rtech-navy)],
  [वित्तीय अवधि (Period - 01-04 से 31-03)],

  [#keypill("Ctrl + N", col: rtech-navy)],
  [इन-बिल्ट कैलकुलेटर खोलना/बंद करना],
  [#keypill("Ctrl + Alt + C", col: rtech-navy)],
  [Tally में टेक्स्ट कॉपी करना (Legacy)],

  [#keypill("Ctrl + Alt + V", col: rtech-navy)],
  [Tally में टेक्स्ट पेस्ट करना (Legacy)],
  [#keypill("Alt + R", col: rtech-navy)],
  [रिपोर्ट में से लाइन को अस्थायी छुपाना (Hide)],

  [#keypill("Alt + U", col: rtech-navy)],
  [छुपाई गई लाइन को पुनः दिखाना (Unhide)],
  [#keypill("Spacebar", col: rtech-navy)],
  [एक लाइन का चयन (Select / Deselect)],

  [#keypill("Ctrl + Space", col: rtech-navy)],
  [पूरी रिपोर्ट की सभी लाइन्स एक साथ चुनना],
  [#keypill("Alt + P", col: rtech-navy)],
  [इनवॉइस / रिपोर्ट का प्रिंट निकालना],

  [#keypill("Ctrl + P", col: rtech-navy)],
  [वर्तमान खुली स्क्रीन का तुरंत प्रिंट],
  [#keypill("Alt + E", col: rtech-navy)],
  [PDF, Excel, XML अथवा JPEG में Export],

  [#keypill("Alt + M", col: rtech-navy)],
  [Tally से सीधे क्लाइंट को ईमेल भेजना],
  [#keypill("F12", col: rtech-navy)],
  [स्क्रीन की कॉन्फ़िगरेशन सेटिंग्स बदलना],
)

#v(3pt)

#module-banner(num: "MODULE 12", title: "वर्षान्त फाइनल अकाउंट्स 5-चरणीय ऑडिट चेकलिस्ट (Year-End Audit Protocol)", color: rtech-navy)

#block(
  width: 100%,
  stroke: 0.5pt + rtech-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 7.5pt)[
      - #hl-g[1. बैंक समाधान (BRS Check):] 31 मार्च को बैंक पासबुक और Tally बैंक लेजर का शेष हूबहू शून्य अंतर के साथ मिलना चाहिए (`F5 -> Reconcile`)।
      - #hl-y[2. मूल्यह्रास प्रविष्टि (Depreciation Entry):] सभी संपत्तियों पर कंपनी अधिनियम व आयकर नियमानुसार 31 मार्च को जर्नल (F7) में डेप्रिसिएशन चार्ज करें।
      - #hl-o[3. क्लोजिंग स्टॉक सत्यापन (Closing Stock Valuation):] 'Cost or Net Realizable Value, whichever is lower' के आधार पर स्टॉक का अंतिम मूल्यांकन।
      - #hl-g[4. GST इनपुट टैक्स क्रेडिट मिलान:] GSTR-2B में दिखाई दे रहे ITC से Tally बुक्स के CGST, SGST, IGST का पाई-पाई मिलान करें।
      - #hl-y[5. अंतिम P&L व बैलेंस शीट जांच:] कोई भी खाता 'Suspense Account' या 'Difference in Opening Balances' में नहीं छूटा होना चाहिए।
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 06: RAHUL SIR'S MENTORSHIP MESSAGE, FREE TOOLS HUB & SMART UPGRADE
// =============================================================================

#v(8pt)

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 10pt, y: 3.5pt),
    text(size: 8.5pt, weight: "bold", fill: rtech-blue)[👨‍🏫 राहुल सर का संदेश · RTechLab स्टूडेंट मेंटरशिप एवं कम्युनिटी]
  )
]

#v(4pt)

#grid(
  columns: (auto, 1fr),
  gutter: 12pt,
  align: (top, left),
  [
    #block(
      stroke: 1.5pt + rtech-emerald,
      radius: 6pt,
      clip: true,
      [
        #image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 34mm)
      ]
    )
    #v(3pt)
    #align(center)[
      #text(size: 8pt, weight: "bold", fill: rtech-navy)[राहुल पटेल (Rahul Patel)]\
      #text(size: 6.8pt, fill: rtech-muted)[चीफ टेक्नोलॉजी आर्किटेक्ट\
      फाउंडर, RTechLab Publications]
    ]
  ],
  [
    #text(size: 10.5pt, weight: "black", fill: rtech-navy)[प्रिय विद्यार्थी एवं भावी अकाउंट्स लीडर,]
    
    #v(3pt)
    #text(size: 8pt, fill: rtech-text)[
      अकाउंटिंग केवल डेबिट-क्रेडिट की एंट्री करना नहीं है; यह किसी भी व्यापार की रीढ़ की हड्डी होती है। एक अच्छा अकाउंटेंट वह होता है जो व्यापार के हर एक रुपये का हिसाब सही रखे और GST व TDS के नियमों का 100% अनुपालन सुनिश्चित करे।

      इस *₹22 के क्विक डेस्क रेफरेंस* को तैयार करने का हमारा एकमात्र उद्देश्य यह था कि जब आप ऑफिस की कुर्सी पर बैठे हों या इंटरव्यू की तैयारी कर रहे हों, तो आपको 50 जगह गूगल करने या वीडियो खोजने में समय बर्बाद न करना पड़े। यह 6 पेज आपकी टेबल पर होने का मतलब है कि आपके पास एक सीनियर अकाउंटेंट का दिमाग हमेशा मौजूद है।
    ]
  ]
)

#v(6pt)

// Helpline & Community Box
#block(
  width: 100%,
  stroke: 1pt + rgb("#86EFAC"),
  fill: rgb("#F0FDF4"),
  radius: 6pt,
  inset: (x: 10pt, y: 7pt),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (horizon, horizon),
      [
        #text(size: 22pt)[📱]
      ],
      [
        #text(size: 9pt, weight: "black", fill: rtech-emerald)[ऑफिशियल WhatsApp स्टूडेंट हेल्पलाइन एवं कम्युनिटी सपोर्ट]\
        #v(1.5pt)
        #text(size: 7.5pt, fill: rtech-text)[
          यदि आपको अकाउंटिंग एंट्री, GST सेटिंग्स या करियर में कोई भी संशय हो, तो हमारी ऑफिशियल हेल्पलाइन पर संपर्क करें:\
          - #text(weight: "bold")[WhatsApp हेल्पलाइन:] #hl-g[+91 76468 92094] (चैट-ओनली पॉलिसी · त्वरित समाधान)\
          - #text(weight: "bold")[ऑफिशियल WhatsApp कम्युनिटी चैनल:] #link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[#text(fill: rtech-blue, weight: "bold")[यहाँ क्लिक करके RTechLab चैनल जॉइन करें →]]
        ]
      ]
    )
  ]
)

#v(6pt)

// Free Cloud Tools Recommendation Box
#block(
  width: 100%,
  stroke: 1pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 6pt,
  inset: (x: 10pt, y: 7pt),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (horizon, horizon),
      [
        #text(size: 22pt)[🛠️]
      ],
      [
        #text(size: 9pt, weight: "black", fill: rtech-blue)[RTechLab के 100% फ्री इंटरएक्टिव टूल्स पर अभ्यास करें]\
        #v(1.5pt)
        #text(size: 7.5pt, fill: rtech-text)[
          वेबसाइट पर रोजाना अपनी तकनीकी दक्षता बढ़ाने के लिए हमारे फ्री ब्राउज़र टूल्स का उपयोग करें:\
          - #text(weight: "bold")[Daily 10-Second Technical Quiz:] हर रोज़ 1 नया टेक्निकल सवाल और अपना स्कोर देखें।\
          - #text(weight: "bold")[Free Engineering Tools Hub:] Subnet Calculator, DNS Lookup, IP Info, Binary Converter।\
          - #text(weight: "bold")[वेबसाइट डायरेक्ट लिंक:] #link("https://rtechlab.vercel.app/tools")[#text(fill: rtech-blue, weight: "bold")[rtechlab.vercel.app/tools]]
        ]
      ]
    )
  ]
)

#v(6pt)

// 🚀 The Smart Upgrade Hook (₹27 Extra to get the 51-Page Master Edition)
#block(
  width: 100%,
  stroke: 1.5pt + rtech-amber,
  fill: rgb("#FFFBEB"),
  radius: 6pt,
  inset: (x: 10pt, y: 8pt),
  [
    #grid(
      columns: (auto, 1fr, auto),
      gutter: 10pt,
      align: (horizon, horizon, horizon),
      [
        #text(size: 24pt)[📘]
      ],
      [
        #text(size: 9.5pt, weight: "black", fill: rtech-amber.darken(10%))[क्या आप 50 कमर्शियल इनवॉइस और इंटरव्यू में महारत चाहते हैं?]\
        #v(2pt)
        #text(size: 7.5pt, fill: rtech-text)[
          इस क्विक डेस्क शीट के बाद, यदि आप वास्तविक व्यापारिक बिलिंग (APMC कृषि उपज, जीरा/इसबगोल, इलेक्ट्रॉनिक्स, बैंक समाधान और टॉप 50 MNC कॉर्पोरेट इंटरव्यू प्रश्न) शून्य से सीखना चाहते हैं, तो हमारे *51-पेज के सम्पूर्ण Tally Prime Master Guide* में अपग्रेड करें!
        ]
      ],
      [
        #box(
          fill: rtech-emerald,
          radius: 4pt,
          inset: (x: 8pt, y: 6pt),
          align: center,
          [
            #link("https://rtechlab.vercel.app/notes")[
              #text(size: 7.5pt, weight: "black", fill: white)[अपग्रेड सिर्फ ₹27 में →]\
              #v(1pt)
              #text(size: 6.5pt, fill: rgb("#DCFCE7"))[(₹49 मास्टर गाइड)]
            ]
          ]
        )
      ]
    )
  ]
)

#v(8pt)
#align(center)[
  #text(size: 7pt, fill: rtech-muted)[
    © 2027 RTechLab Publications · All Rights Reserved · Unauthorized Resale or Redistribution is Strictly Prohibited.
  ]
]
'''

with open(typ_path, "w", encoding="utf-8") as f:
    f.write(content)

print(f"Wrote Typst file to {typ_path} ({len(content.splitlines())} lines)")

cmd = ['typst', 'compile', '--root', BASE_DIR, typ_path, out_pdf]
print('Running:', ' '.join(cmd))
res = subprocess.run(cmd, capture_output=True, text=True)

if res.returncode == 0:
    reader = PdfReader(out_pdf)
    pages = len(reader.pages)
    print(f"SUCCESS! Compiled PDF has {pages} pages.")
    shutil.copy2(out_pdf, pub_pdf)
    print("Copied to public/downloads.")
else:
    print("COMPILATION FAILED:")
    print(res.stderr)
