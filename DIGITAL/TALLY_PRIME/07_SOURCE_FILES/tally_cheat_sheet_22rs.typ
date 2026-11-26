// =============================================================================
// RTECHLAB MASTER DESK REFERENCE & CHEAT SHEET — ₹22 SPECIAL PRODUCTIVITY EDITION
// Title: Tally Prime 2027: Corporate Accountant's Daily Desk Reference & Shortcut Cheat Sheet
// Language: Hindi (Authentic Corporate Hinglish with Standard Industry Terms)
// Author: Rahul Patel (Chief Technology Architect & Founder, RTechLab)
// Target: EXACTLY 8 PAGES (Bestseller Book Cover + Complete Reference Tables)
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
  radius: 2.2pt,
  inset: (x: 4pt, y: 1.8pt),
  text(size: 6.8pt, font: ("Consolas", "Courier New", "Segoe UI"), weight: "bold", fill: white)[#label]
)

#set page(
  paper: "a4",
  margin: (x: 10mm, top: 12mm, bottom: 10mm),
  fill: rtech-paper,

  // Subtle Premium Security Watermark (Only on Content Pages 2-8)
  background: context {
    let p = counter(page).get().first()
    if p > 1 {
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
                TALLY DESK SHEET · 2027 EDITION
              ]
            ]
          )
        )
      )
    }
  },

  // Running Header (Pages 2 to 8)
  header: context {
    let p = counter(page).get().first()
    if p > 1 {
      block(
        width: 100%,
        stroke: (bottom: 0.5pt + rgb("#CBD5E1")),
        inset: (bottom: 1.8mm),
        [
          #grid(
            columns: (1fr, auto),
            align: (left + horizon, right + horizon),
            [
              #box(height: 12pt, baseline: 1.5pt)[#image("../02_BRAND_ASSETS/rtechlab_official_logo.png", height: 12pt)]
              #h(4pt)
              #text(size: 8pt, weight: "black", fill: rtech-navy)[RTECHLAB]
              #text(size: 8pt, fill: rtech-emerald, weight: "bold")[ | Tally Prime 2027 Daily Desk Reference & Cheat Sheet]
            ],
            [
              #text(size: 7.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-blue, weight: "bold")[
                Professional Productivity Edition
              ]
              #text(size: 7.5pt, fill: rgb("#94A3B8"))[ · ]
              #text(size: 7.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-muted)[
                Rahul Patel
              ]
            ]
          )
        ]
      )
    }
  },

  // Running Footer (Pages 2 to 8)
  footer: context {
    let p = counter(page).get().first()
    if p > 1 {
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
                text(size: 7pt, weight: "black", fill: rtech-navy)[Page #p of 8]
              )
            ]
          )
        ]
      )
    }
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
  leading: 0.48em,
  first-line-indent: 0pt
)

// Section Banner
#let module-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-emerald) = {
  v(2.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3.5pt + color, rest: 0.5pt + rtech-border),
    radius: (right: 4pt),
    inset: (x: 7pt, y: 4pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 6pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 5pt, y: 1.8pt),
            text(size: 6.8pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 9.5pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(2.5pt)
}

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
  #text(size: 14pt, weight: "black", fill: rtech-navy)[विस्तृत विषय सूची एवं लेखांकन के 3 गोल्डन रूल्स]
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

  text(size: 7pt, weight: "bold", fill: white)[पेज सं.],
  text(size: 7pt, weight: "bold", fill: white)[अध्याय / विषय सामग्री (Topic Description)],
  text(size: 7pt, weight: "bold", fill: white)[मुख्य फोकस],

  [Page 1], [ऑफिशियल बेस्टसेलर बुक कवर एवं मुख्य मिशन], [Cover & Goals],
  [Page 2], [विषय सूची, 3 गोल्डन रूल्स एवं बैलेंस शीट समीकरण], [Rules & Equation],
  [Page 3], [Tally Prime के सभी 28 ग्रुप्स (15 प्राइमरी + 13 सेकेंडरी)], [All 28 Groups],
  [Page 4], [Tally Prime के सभी 24 वाउचर्स (क्रमांक 1 से 24) व मोड चेंज], [All 24 Vouchers],
  [Page 5], [आधुनिक GST संरचना (0%, 5%, 18%) व टैक्स इनवॉइस चेकलिस्ट], [GST & Invoice],
  [Page 6], [कॉर्पोरेट TDS मैट्रिक्स (194C, 194J, 194I) व बैंक चेक BRS चार्ट], [TDS & BRS Cheque],
  [Page 7], [शीर्ष 35 कीबोर्ड शॉर्टकट्स (क्रमांक 1 से 35) व ईयर-एंड ऑडिट], [Top 35 Hotkeys],
  [Page 8], [राहुल सर का संदेश, WhatsApp हेल्पलाइन व मेंटरशिप हब], [Mentorship & Tools],
)

#v(3pt)

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

#v(3pt)

#module-banner(num: "MODULE 02", title: "लेखांकन का मूलभूत बैलेंस शीट समीकरण (Fundamental Accounting Equation)", color: rtech-blue)

#block(
  width: 100%,
  stroke: 1pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #align(center)[
      #text(size: 9.5pt, weight: "black", fill: rtech-navy)[कुल संपत्तियां (Total Assets) = बाह्य देनदारियां (Liabilities) + स्वामी की पूंजी (Capital)]      #v(2pt)
      #text(size: 7.5pt, fill: rtech-muted)[
        व्यापार में प्रत्येक डेबिट का एक समान क्रेडिट अवश्य होता है। Balance Sheet के दोनों पक्षों का जोड़ हमेशा समान रहना चाहिए।
      ]
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 03: ALL 28 PREDEFINED GROUPS (15 Primary + 13 Secondary Divided)
// =============================================================================

#module-banner(num: "MODULE 03", title: "Tally Prime के सभी 28 ग्रुप्स : भाग 1 — 15 प्राइमरी ग्रुप्स (Primary Groups)", color: rtech-emerald)

#text(size: 7.5pt)[प्राइमरी ग्रुप्स वे मुख्य ग्रुप्स होते हैं जो सीधे Balance Sheet अथवा Profit & Loss अकाउंट से जुड़े होते हैं:]

#v(1.5pt)

#table(
  columns: (0.5fr, 1.6fr, 1.1fr, 2.8fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, left, left).at(col) + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[क्र.],
  text(size: 6.8pt, weight: "bold", fill: white)[प्राइमरी ग्रुप का नाम],
  text(size: 6.8pt, weight: "bold", fill: white)[प्रकृति (Nature)],
  text(size: 6.8pt, weight: "bold", fill: white)[वाणिज्यिक लेजर का उदाहरण एवं विवरण (Commercial Ledger Example)],

  [1], [#text(weight: "bold")[Capital Account]], [Balance Sheet], [मालिक की पूंजी (Proprietor Capital), पार्टनर्स कैपिटल, Drawings A/c],
  [2], [#text(weight: "bold")[Loans (Liability)]], [Balance Sheet], [बैंक टर्म लोन (SBI/HDFC Business Loan), अनसिक्योर्ड लोन],
  [3], [#text(weight: "bold")[Current Liabilities]], [Balance Sheet], [वे सभी देनदारियां जो 12 महीने के अंदर चुकानी हैं],
  [4], [#text(weight: "bold")[Fixed Assets]], [Balance Sheet], [स्थायी संपत्तियां: Computer, Machinery, Furniture, Office Building],
  [5], [#text(weight: "bold")[Current Assets]], [Balance Sheet], [चालू संपत्तियां जो 1 वर्ष के भीतर नकदी बन सकती हैं],
  [6], [#text(weight: "bold")[Misc. Expenses (Asset)]], [Balance Sheet], [प्रारंभिक व्यय (Preliminary Expenses) जिनका अमॉर्टाइजेशन बाकी है],
  [7], [#text(weight: "bold")[Branch / Divisions]], [Balance Sheet], [कंपनी की अन्य शाखाओं (Ahmedabad/Surat Branch) के आपसी खाते],
  [8], [#text(weight: "bold")[Suspense Account]], [Balance Sheet], [अस्थायी अज्ञात लेन-देन (साल के अंत में शून्य होना अनिवार्य)],
  [9], [#text(weight: "bold")[Investments]], [Balance Sheet], [शेयर, म्यूचुअल फंड, सावधि जमा (FD), सरकारी बॉन्ड्स में निवेश],
  [10], [#text(weight: "bold")[Sales Accounts]], [Trading P&L], [माल अथवा सेवाओं की कुल बिक्री (Local Sales GST, Export Sales)],
  [11], [#text(weight: "bold")[Purchase Accounts]], [Trading P&L], [माल की कुल खरीद (Local GST Purchase, Interstate Purchase)],
  [12], [#text(weight: "bold")[Direct Incomes]], [Trading P&L], [फैक्ट्री सीधे जॉब वर्क, डिलीवरी चार्जेस या सर्विस रेवेन्यू],
  [13], [#text(weight: "bold")[Indirect Incomes]], [Profit & Loss], [अन्य आमदनी: Bank Interest, Rent Received, Discount Received],
  [14], [#text(weight: "bold")[Direct Expenses]], [Trading P&L], [उत्पादन व माल लाने से जुड़े खर्च: Freight Inward, Factory Wages, Coal/Power],
  [15], [#text(weight: "bold")[Indirect Expenses]], [Profit & Loss], [ऑफिस व एडमिन खर्च: Office Rent, Staff Salary, Tea & Snacks, Audit Fee],
)

#v(2.5pt)

#module-banner(num: "MODULE 04", title: "Tally Prime के सभी 28 ग्रुप्स : भाग 2 — 13 सेकेंडरी सब-ग्रुप्स (Secondary Groups)", color: rtech-blue)

#text(size: 7.5pt)[सेकेंडरी ग्रुप्स वे सब-ग्रुप्स होते हैं जो किसी प्राइमरी ग्रुप के अंतर्गत बनाए जाते हैं:]

#v(1.5pt)

#table(
  columns: (0.5fr, 1.6fr, 1.5fr, 2.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, left, left).at(col) + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[क्र.],
  text(size: 6.8pt, weight: "bold", fill: white)[सेकेंडरी सब-ग्रुप का नाम],
  text(size: 6.8pt, weight: "bold", fill: white)[मूल प्राइमरी ग्रुप (Parent)],
  text(size: 6.8pt, weight: "bold", fill: white)[व्यावसायिक लेजर का उदाहरण],

  [1], [#text(weight: "bold")[Reserves & Surplus]], [Capital Account], [संचित लाभ (General Reserve, Retained Earnings)],
  [2], [#text(weight: "bold")[Bank OD / OCC A/c]], [Loans (Liability)], [बैंक ओवरड्राफ्ट खाता (SBI OD Account - लिमिट लोन)],
  [3], [#text(weight: "bold")[Secured Loans]], [Loans (Liability)], [बंधक लोन (मशीनरी अथवा गोदाम गिरवी रखकर लिया गया कर्ज)],
  [4], [#text(weight: "bold")[Unsecured Loans]], [Loans (Liability)], [मित्रों, रिश्तेदारों अथवा निदेशकों से बिना गारंटी का कर्ज],
  [5], [#text(weight: "bold", fill: rtech-amber)[Duties & Taxes]], [Current Liabilities], [#hl-o[CGST, SGST, IGST, TDS Payable], TCS टैक्स लेजर्स],
  [6], [#text(weight: "bold")[Provisions]], [Current Liabilities], [Provision for Income Tax, Provision for Bad Debts],
  [7], [#text(weight: "bold", fill: rtech-rose)[Sundry Creditors]], [Current Liabilities], [#hl-y[सप्लायर / लेनदार] जिनसे उधारी पर माल या सेवा ली गई],
  [8], [#text(weight: "bold")[Bank Accounts]], [Current Assets], [बैंक चालू व बचत खाते: SBI Current A/c, HDFC A/c],
  [9], [#text(weight: "bold")[Cash-in-Hand]], [Current Assets], [तिजोरी में रखी नकद राशि: Cash A/c, Petty Cash A/c],
  [10], [#text(weight: "bold")[Deposits (Asset)]], [Current Assets], [सुरक्षा जमा: Electricity Security Deposit, Shop Rent Deposit],
  [11], [#text(weight: "bold")[Loans & Advances (Asset)]], [Current Assets], [स्टाफ को दिया गया सैलरी एडवांस, सप्लायर को अग्रिम भुगतान],
  [12], [#text(weight: "bold")[Stock-in-Hand]], [Current Assets], [दुकान/गोदाम में रखा अविक्रित माल (Closing Stock)],
  [13], [#text(weight: "bold", fill: rtech-emerald)[Sundry Debtors]], [Current Assets], [#hl-g[ग्राहक / देनदार] जिन्हें उधारी पर माल या सेवा बेची गई],
)

#v(1pt)
#text(size: 6.8pt, fill: rtech-muted)[#text(fill: rtech-emerald, weight: "bold")[कुल योग:] 15 प्राइमरी ग्रुप्स + 13 सेकेंडरी सब-ग्रुप्स = #hl-g[कुल 28 ग्रुप्स]। Tally में नया ग्रुप 'Alt + C' से भी बनाया जा सकता है।]

#pagebreak()

// =============================================================================
// PAGE 04: ALL 24 VOUCHERS IN TALLY PRIME (Numbered 1 to 24)
// =============================================================================

#module-banner(num: "MODULE 05", title: "Tally Prime के सभी 24 वाउचर्स (क्रमांक 1 से 24 सम्पूर्ण मास्टर गाइड)", color: rtech-blue)

#text(size: 7.5pt)[Tally Prime में वित्तीय और स्टॉक लेन-देन दर्ज करने के लिए गेटवे ऑफ टैली से #hl-y[`V` (Vouchers)] दबाएं। नीचे सभी 24 वाउचर्स 1 से 24 तक पूर्णतः वर्गीकृत हैं:]

#v(1.5pt)

#table(
  columns: (0.5fr, 1.2fr, 1.5fr, 2.8fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, center, left, left).at(col) + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[क्र.],
  text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट की],
  text(size: 6.8pt, weight: "bold", fill: white)[वाउचर का नाम],
  text(size: 6.8pt, weight: "bold", fill: white)[व्यावसायिक उपयोग एवं नियम (Purpose & Usage)],

  [1], [#keypill("F4", col: rtech-blue)], [#text(weight: "bold")[Contra Voucher]], [#hl-y[केवल बैंक और कैश का आंतरिक लेन-देन।] बैंक में नकद जमा, निकासी, बैंक-टू-बैंक।],
  [2], [#keypill("F5", col: rtech-rose)], [#text(weight: "bold")[Payment Voucher]], [#hl-o[व्यापार से धन बाहर जाना।] सप्लायर भुगतान, वेतन, ऑफिस किराया नकद/चेक द्वारा।],
  [3], [#keypill("F6", col: rtech-emerald)], [#text(weight: "bold")[Receipt Voucher]], [#hl-g[व्यापार में धन अंदर आना।] ग्राहकों से वसूली, बैंक ब्याज, मालिक द्वारा पूंजी लाना।],
  [4], [#keypill("F7", col: rtech-navy)], [#text(weight: "bold")[Journal Voucher]], [#hl-y[गैर-नकद समायोजन।] संपत्तियों पर डेप्रिसिएशन, अशुद्धि सुधार, उधारी संपत्ति खरीद।],
  [5], [#keypill("F8", col: rtech-emerald)], [#text(weight: "bold")[Sales Voucher]], [#hl-g[माल व सेवा की बिक्री।] नकद अथवा उधारी। GST टैक्स इनवॉइस जारी करने हेतु।],
  [6], [#keypill("F9", col: rtech-amber)], [#text(weight: "bold")[Purchase Voucher]], [#hl-o[माल व कच्चे माल की इनवर्ड खरीद।] सप्लायर इनवॉइस दर्ज कर GST ITC क्लेम करने हेतु।],
  [7], [#keypill("Alt + F5", col: rtech-rose)], [#text(weight: "bold", fill: rtech-rose)[Debit Note]], [#hl-o[खरीद वापसी (Purchase Return)] या सप्लायर को डेबिट करना (खराब माल लौटाया)।],
  [8], [#keypill("Alt + F6", col: rtech-emerald)], [#text(weight: "bold", fill: rtech-emerald)[Credit Note]], [#hl-g[बिक्री वापसी (Sales Return)] या ग्राहक को छूट/दर अंतर देने के लिए इनवॉइस घटाना।],
  [9], [#keypill("Ctrl + F4", col: rtech-navy)], [#text(weight: "bold")[Payroll Voucher]], [कर्मचारियों के मासिक वेतन, भत्तों, PF, ESIC की ऑटोमैटिक प्रविष्टि।],
  [10], [#keypill("Ctrl + F7", col: rtech-navy)], [#text(weight: "bold")[Reversing Journal]], [वित्तीय वर्ष अंत में पोस्ट-डेटेड समायोजन जो अगले दिन स्वतः रिवर्स हो जाते हैं।],
  [11], [#keypill("Alt + F7", col: rtech-blue)], [#text(weight: "bold")[Stock Journal]], [#hl-y[गोदाम ट्रांसफर।] एक गोदाम से दूसरे गोदाम में माल भेजना या मैन्युफैक्चरिंग।],
  [12], [#keypill("Alt + F8", col: rtech-blue)], [#text(weight: "bold")[Delivery Note]], [बिक्री डिलीवरी चालान। बिना तुरंत बिल बनाए माल को ग्राहक तक भेजना।],
  [13], [#keypill("Alt + F9", col: rtech-blue)], [#text(weight: "bold")[Receipt Note]], [आवक चालान। सप्लायर से माल गोदाम में पहुंचा लेकिन पक्का बिल अभी बाकी है।],
  [14], [#keypill("Ctrl + F8", col: rtech-rose)], [#text(weight: "bold")[Rejection Out]], [चालान पर आए माल में से खराब माल को बिल बनने से पहले सप्लायर को लौटाना।],
  [15], [#keypill("Ctrl + F9", col: rtech-emerald)], [#text(weight: "bold")[Rejection In]], [ग्राहक को भेजे माल में से अस्वीकृत माल को बिल बनने से पूर्व वापस लेना।],
  [16], [#keypill("Alt + F10", col: rtech-navy)], [#text(weight: "bold")[Physical Stock]], [गोदाम में वास्तविक भौतिक गिनती के बाद बुक स्टॉक को एक्चुअल से मिलाना।],
  [17], [#keypill("Ctrl + F2", col: rtech-navy)], [#text(weight: "bold")[Material In]], [जॉब वर्क हेतु बाहर से माल प्राप्त होना या कार्य समाप्ति पर माल वापस आना।],
  [18], [#keypill("Ctrl + F3", col: rtech-navy)], [#text(weight: "bold")[Material Out]], [जॉब वर्कर को कच्चे माल की प्रोसेसिंग हेतु माल बाहर भेजना।],
  [19], [#keypill("Alt + F4", col: rtech-amber)], [#text(weight: "bold")[Purchase Order]], [सप्लायर को आधिकारिक खरीद आदेश (PO) भेजना (दर, मात्रा, डिलीवरी तिथि)।],
  [20], [#keypill("Alt + F5", col: rtech-emerald)], [#text(weight: "bold")[Sales Order]], [ग्राहक से बिक्री आदेश (SO) प्राप्त होना जिसे बाद में चालान/बिल में बदला जाएगा।],
  [21], [#keypill("Ctrl + F5", col: rtech-navy)], [#text(weight: "bold")[Attendance Voucher]], [कर्मचारियों के उपस्थित दिन (Present/Absent/Overtime) दर्ज करना।],
  [22], [#keypill("Ctrl + F6", col: rtech-navy)], [#text(weight: "bold")[Job Work Order]], [तृतीय पक्ष को जॉब वर्क प्रोसेस का आधिकारिक कार्य आदेश सौंपना।],
  [23], [#keypill("Alt + F10", col: rtech-muted)], [#text(weight: "bold")[Memorandum Voucher]], [अस्थायी गैर-खाता प्रविष्टि (खातों में दर्ज नहीं होती; केवल याददाश्त के लिए)।],
  [24], [#keypill("Ctrl + L", col: rtech-muted)], [#text(weight: "bold")[Optional Voucher]], [काल्पनिक परिदृश्यों (Forecasting) की प्रविष्टि जो अंतिम खातों को प्रभावित नहीं करती।],
)

#v(2.5pt)

#module-banner(num: "MODULE 06", title: "वाउचर मोड परिवर्तन: Ctrl + H (Change Mode Master Trick)", color: rtech-amber)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 4pt,
      radius: 3pt,
      [
        #text(weight: "bold", fill: rtech-blue)[1. Item Invoice Mode:]        #text(size: 6.8pt, fill: rtech-muted)[ट्रेडिंग व दुकानों के लिए। आइटम नाम, गोदाम, मात्रा (Qty), दर और GST टैक्स अलग-अलग दिखते हैं।]
      ]
    )
  ],
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 4pt,
      radius: 3pt,
      [
        #text(weight: "bold", fill: rtech-emerald)[2. Accounting Invoice Mode:]        #text(size: 6.8pt, fill: rtech-muted)[सर्विस इंडस्ट्री (CA, वकील, सॉफ्टवेयर) हेतु। बिना क्वांटिटी के सीधे सेवा शुल्क व GST जोड़ा जाता है।]
      ]
    )
  ],
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 4pt,
      radius: 3pt,
      [
        #text(weight: "bold", fill: rtech-navy)[3. As Voucher Mode:]        #text(size: 6.8pt, fill: rtech-muted)[पारंपरिक डेबिट (Dr/By) और क्रेडिट (Cr/To) फॉर्मेट। अकाउंटेंट्स जिन्हें सीधे जर्नल स्टाइल में एंट्री पसंद है।]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 05: MODERN GST FRAMEWORK (0%, 5%, 18%) & AUTHENTIC TAX INVOICE
// =============================================================================

#module-banner(num: "MODULE 07", title: "आधुनिक GST संरचना एवं टैक्स लेजर मैपिंग (Modern GST Framework)", color: rtech-amber)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      stroke: 1pt + rgb("#BAE6FD"),
      fill: rgb("#F0F9FF"),
      inset: 5pt,
      radius: 4pt,
      [
        #text(size: 8.2pt, weight: "bold", fill: rtech-blue)[A. अंतःराज्य बिक्री (Intra-State Sale)]        #v(1.5pt)
        #text(size: 7.2pt)[*नियम:* जब विक्रेता और खरीदार #hl-y[एक ही राज्य] के हों (उदा. गुजरात से गुजरात)।        *टैक्स लेजर्स:* कर 50-50% दो भागों में बंटता है:        - #hl-g[CGST (Central Tax)]: 50% केंद्र सरकार को        - #hl-g[SGST (State Tax)]: 50% राज्य सरकार को        *उदा. 18% GST:* 9% CGST + 9% SGST जुड़ेगा।]
      ]
    )
  ],
  [
    #block(
      stroke: 1pt + rgb("#FED7AA"),
      fill: rgb("#FFF7ED"),
      inset: 5pt,
      radius: 4pt,
      [
        #text(size: 8.2pt, weight: "bold", fill: rtech-amber)[B. अंतरराज्यीय बिक्री (Inter-State Sale)]        #v(1.5pt)
        #text(size: 7.2pt)[*नियम:* जब विक्रेता और खरीदार #hl-o[दो अलग राज्यों] के हों (उदा. गुजरात से महाराष्ट्र)।        *टैक्स लेजर्स:* केवल एक एकीकृत कर लगेगा:        - #hl-o[IGST (Integrated Tax)]: पूरा 100% टैक्स        *उदा. 18% GST:* सीधा 18% IGST जुड़ेगा (CGST व SGST शून्य)।]
      ]
    )
  ]
)

#v(2pt)

#module-banner(num: "MODULE 08", title: "व्यावसायिक GST दर मैट्रिक्स (GST Slabs by Commodity)", color: rtech-emerald)

#table(
  columns: (1fr, 2fr, 1.4fr, 1.6fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[GST स्लैब],
  text(size: 6.8pt, weight: "bold", fill: white)[प्रमुख वस्तुएं एवं उद्योग (Commodities)],
  text(size: 6.8pt, weight: "bold", fill: white)[HSN/SAC कोड],
  text(size: 6.8pt, weight: "bold", fill: white)[Tally Prime एंट्री SOP],

  [#keypill("0% (Nil)", col: rtech-navy)], [कृषि उपज (APMC जीरा, इसबगोल, अनाज, ताजी सब्जियां, दूध)], [HSN 0909 / HSN 1211], [Taxability: #hl-g[Exempt / Nil Rated]],
  [#keypill("5% Slab", col: rtech-amber)], [पैकेज्ड खाद्यान्न, चाय, चीनी, कोयला, 1000 रु. से कम कपड़े, ट्रांसपोर्ट], [HSN 0902 / HSN 1701], [Intra: #hl-y[2.5% + 2.5%] | Inter: #hl-y[5%]],
  [#keypill("12% Slab", col: rtech-blue)], [प्रोसेस्ड फूड, घी, मक्खन, दवाइयां, मोबाइल पार्ट्स, स्टेशनरी], [HSN 0405 / HSN 3004], [Intra: #hl-o[6% + 6%] | Inter: #hl-o[12%]],
  [#keypill("18% Slab", col: rtech-emerald)], [#hl-g[सर्वाधिक प्रयुक्त!] इलेक्ट्रॉनिक्स, कंप्यूटर, IT सर्विसेज, AC रेस्टोरेंट], [HSN 8471 / SAC 9983], [Intra: #hl-g[9% + 9%] | Inter: #hl-g[18%]],
  [#keypill("28% Slab", col: rtech-rose)], [विलासिता वस्तुएं: लग्जरी कारें, सीमेंट, तंबाकू, कोल्ड ड्रिंक], [HSN 8703 / HSN 2523], [Intra: 14% + 14% (+ Cess यदि लागू हो)],
)

#v(3pt)

// Live Graphic Illustration: GST Invoice Visual
#align(center)[
  #block(
    stroke: 0.6pt + rgb("#CBD5E1"),
    radius: 4pt,
    fill: white,
    inset: 3pt,
    [
      #image("../02_BRAND_ASSETS/gst_invoice_structure.png", width: 96%)
    ]
  )
  #text(size: 6.8pt, fill: rtech-muted, style: "italic")[चित्र 5.1: Rule 46 के तहत आधिकारिक GST टैक्स इनवॉइस — सप्लायर/क्रेता GSTIN, HSN कोड एवं CGST/SGST ब्रेकडाउन]
]

#v(2pt)

#module-banner(num: "MODULE 09", title: "Rule 46 टैक्स इनवॉइस 8 अनिवार्य शर्तें (Mandatory Invoice Checklist)", color: rtech-navy)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #text(size: 7.2pt)[
      - *1. क्रमिक बिल नंबर (Invoice No):* वित्तीय वर्ष में अधिकतम 16 अक्षर (`RTL/26-27/0042`)।
      - *2. जारी करने की तिथि (Date):* माल डिस्पेच से पूर्व अथवा उसी दिन।
      - *3. सप्लायर विवरण:* नाम, पता और 15-अंकों का आधिकारिक GSTIN।
      - *4. ग्राहक विवरण:* नाम, पता, GSTIN और राज्य का नाम व कोड (उदा. 24 Gujarat)।
    ]
  ],
  [
    #text(size: 7.2pt)[
      - *5. प्लेस ऑफ सप्लाई (POS):* कर निर्धारण का मूल (Intra vs Inter-state)।
      - *6. HSN/SAC कोड:* 5 करोड़ टर्नओवर पर 4-अंक, 5 करोड़ से अधिक पर 6-अंक।
      - *7. कर विभाजन:* टैक्सेबल वैल्यू, टैक्स दर, CGST, SGST व IGST अलग-अलग।
      - *8. डिजिटल सिग्नेचर / QR कोड:* B2B ई-इनवॉइसिंग हेतु अनिवार्य।
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 06: CORPORATE TDS SECTIONS MATRIX & CTS-2010 BANK CHEQUE VISUAL
// =============================================================================

#module-banner(num: "MODULE 10", title: "कॉर्पोरेट TDS दरें एवं धाराएं (Corporate TDS Master Matrix FY 2026-27)", color: rtech-rose)

#text(size: 7.5pt)[TDS (Tax Deducted at Source) आयकर अधिनियम के तहत भुगतानकर्ता द्वारा काटा जाने वाला अनिवार्य अग्रिम कर है:]

#v(1.5pt)

#table(
  columns: (1.2fr, 2.2fr, 1.2fr, 1.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 6.8pt, weight: "bold", fill: white)[TDS सेक्शन],
  text(size: 6.8pt, weight: "bold", fill: white)[भुगतान की प्रकृति (Nature of Payment)],
  text(size: 6.8pt, weight: "bold", fill: white)[TDS दर (Rate)],
  text(size: 6.8pt, weight: "bold", fill: white)[वार्षिक छूट सीमा (Threshold)],

  [#text(weight: "bold", fill: rtech-rose)[Section 194C]], [ठेकेदार / ट्रांसपोर्ट / विज्ञापन / जॉब वर्क भुगतान], [#hl-o[1%] (व्यक्ति/HUF)\ #hl-o[2%] (कंपनी/फर्म)], [एकल बिल > ₹30,000\ या वर्ष में कुल > ₹1,00,000],
  [#text(weight: "bold", fill: rtech-rose)[Section 194J]], [पेशेवर व तकनीकी शुल्क (CA, वकील, सॉफ्टवेयर कंसल्टेंट)], [#hl-o[10%] (पेशेवर सेवा)\ #hl-o[2%] (तकनीकी सेवा)], [वित्तीय वर्ष में > ₹30,000\ (डायरेक्टर फीस पर कोई सीमा नहीं)],
  [#text(weight: "bold", fill: rtech-rose)[Section 194I]], [किराया भुगतान (ऑफिस, दुकान, गोदाम, प्लांट व मशीनरी)], [#hl-o[2%] (मशीनरी)\ #hl-o[10%] (जमीन/भवन)], [वित्तीय वर्ष में कुल किराया > ₹2,40,000],
  [#text(weight: "bold", fill: rtech-rose)[Section 194H]], [कमीशन अथवा ब्रोकरेज (दलाली, प्रॉपर्टी एजेंट कमीशन)], [#hl-o[5%]], [वित्तीय वर्ष में कुल कमीशन > ₹15,000],
  [#text(weight: "bold", fill: rtech-rose)[Section 194Q]], [माल की खरीद पर खरीदार द्वारा TDS (टर्नओवर > ₹10 करोड़)], [#hl-o[0.1%]], [एक सप्लायर से वार्षिक खरीद > ₹50,00,000],
  [#text(weight: "bold", fill: rtech-rose)[Section 194A]], [ब्याज भुगतान (सावधि जमा / अनसिक्योर्ड लोन पर ब्याज)], [#hl-o[10%]], [बैंक: ₹40,000 (सीनियर ₹50k), अन्य: ₹5,000],
  [#text(weight: "bold", fill: rtech-rose)[Section 206AA]], [#mark-y[दंडात्मक नियम:] यदि वेंडर वैध PAN कार्ड नहीं देता], [#keypill("20% Flat", col: rtech-rose)], [कोई छूट सीमा नहीं (No Threshold)],
)

#v(3pt)

// Live Graphic Illustration: Bank Cheque CTS-2010 Visual
#align(center)[
  #block(
    stroke: 0.6pt + rgb("#CBD5E1"),
    radius: 4pt,
    fill: white,
    inset: 3pt,
    [
      #image("../02_BRAND_ASSETS/bank_cheque_reconciliation.png", width: 96%)
    ]
  )
  #text(size: 6.8pt, fill: rtech-muted, style: "italic")[चित्र 6.1: CTS-2010 मानक बैंक चेक एवं बैंक समाधान (BRS) — A/c Payee क्रॉसिंग, MICR बैंड एवं चेक नंबर ट्रैकिंग]
]

#v(2pt)

#module-banner(num: "MODULE 11", title: "Tally Prime में TDS प्रविष्टि एवं Form 26Q कैलेंडर", color: rtech-emerald)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: rgb("#F8FAFC"),
      inset: 5pt,
      radius: 3pt,
      [
        #text(size: 7.5pt, weight: "bold", fill: rtech-navy)[TDS 3-स्टेप अकाउंटिंग फ्लो:]        #text(size: 6.8pt)[
          - *1. बिल बुकिंग (F7 Journal):* Audit Fee Dr / To TDS Payable Cr / To CA Party Cr          - *2. वेंडर पेमेंट (F5 Payment):* CA Party Dr / To Bank Cr (नेट 90% भुगतान)          - *3. सरकारी चालान (F5 Stat Payment):* TDS Payable Dr / To Bank Cr (चालान 281)
        ]
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
        #text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Form 26Q त्रैमासिक रिटर्न ड्यू डेट्स:]        #text(size: 6.8pt)[
          - *Q1 (Apr-Jun):* #hl-g[31 जुलाई] (विलंब शुल्क: ₹200 प्रतिदिन)          - *Q2 (Jul-Sep):* #hl-g[31 अक्टूबर]          - *Q3 (Oct-Dec):* #hl-g[31 जनवरी]          - *Q4 (Jan-Mar):* #hl-g[31 मई] (वार्षिक फाइनल मिलान)
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 07: TOP 35 UNIVERSAL TALLY PRIME HOTKEYS & YEAR-END AUDIT
// =============================================================================

#module-banner(num: "MODULE 12", title: "शीर्ष 35 Tally Prime कीबोर्ड शॉर्टकट्स (क्रमांक 1 से 35 सम्पूर्ण सूची)", color: rtech-emerald)

#text(size: 7.5pt)[माउस का प्रयोग बंद करें! प्रो-अकाउंटेंट केवल कीबोर्ड शॉर्टकट्स से सामान्य व्यक्ति से 5 गुना तेजी से काम करते हैं:]

#v(1.5pt)

#table(
  columns: (0.4fr, 1fr, 1.8fr, 0.4fr, 1fr, 1.8fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, center, left, center, center, left).at(col) + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[क्र.],
  text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.8pt, weight: "bold", fill: white)[कार्य (Action Description)],
  text(size: 6.8pt, weight: "bold", fill: white)[क्र.],
  text(size: 6.8pt, weight: "bold", fill: white)[शॉर्टकट],
  text(size: 6.8pt, weight: "bold", fill: white)[कार्य (Action Description)],

  [1], [#keypill("Alt + G", col: rtech-blue)], [#hl-y[GoTo मास्टर सर्च] (किसी भी रिपोर्ट में)],
  [19], [#keypill("Alt + E", col: rtech-navy)], [Excel, PDF, XML में Export],

  [2], [#keypill("Ctrl + A", col: rtech-blue)], [#hl-g[1-क्लिक ऑटो सेव] (बिना एंटर दबाए)],
  [20], [#keypill("Alt + M", col: rtech-navy)], [Tally से सीधे पार्टी को ईमेल भेजना],

  [3], [#keypill("Alt + C", col: rtech-emerald)], [#hl-y[त्वरित निर्माण] (लेजर/स्टॉक आइटम)],
  [21], [#keypill("Alt + Z", col: rtech-navy)], [ज़ूम इन / ज़ूम आउट टॉगल],

  [4], [#keypill("Ctrl + Enter", col: rtech-emerald)], [#hl-y[मास्टर ऑल्टर] (रिपोर्ट से सीधा बदलाव)],
  [22], [#keypill("Esc", col: rtech-navy)], [वर्तमान स्क्रीन से बाहर निकलना],

  [5], [#keypill("Alt + D", col: rtech-amber)], [वाउचर अथवा लेजर डिलीट करना],
  [23], [#keypill("Ctrl+Alt+C", col: rtech-navy)], [Tally में टेक्स्ट कॉपी करना],

  [6], [#keypill("Alt + F1", col: rtech-amber)], [विस्तृत (Detailed Tree View)],
  [24], [#keypill("Ctrl+Alt+V", col: rtech-navy)], [Tally में टेक्स्ट पेस्ट करना],

  [7], [#keypill("Alt + F5", col: rtech-amber)], [कंडेंस्ड / डिटेल्ड टॉगल व्यू],
  [25], [#keypill("Alt + I", col: rtech-navy)], [रिपोर्ट में नया कॉलम जोड़ना],

  [8], [#keypill("F2", col: rtech-navy)], [वाउचर अथवा रिपोर्ट तारीख बदलना],
  [26], [#keypill("Alt + A", col: rtech-navy)], [नया वाउचर जोड़ना (Add Voucher)],

  [9], [#keypill("Alt + F2", col: rtech-navy)], [वित्तीय अवधि (Period - 01-04 से 31-03)],
  [27], [#keypill("Alt + 2", col: rtech-navy)], [डुप्लीकेट वाउचर बनाना],

  [10], [#keypill("F12", col: rtech-navy)], [स्क्रीन कॉन्फ़िगरेशन सेटिंग्स बदलना],
  [28], [#keypill("Alt + X", col: rtech-navy)], [वाउचर निरस्त/कैंसिल करना],

  [11], [#keypill("Ctrl + H", col: rtech-blue)], [वाउचर मोड चेंज (Item, Acc, Voucher)],
  [29], [#keypill("F11", col: rtech-navy)], [कंपनी फीचर्स (GST, TDS इनेबल)],

  [12], [#keypill("Ctrl + N", col: rtech-navy)], [इन-बिल्ट कैलकुलेटर ऑन/ऑफ],
  [30], [#keypill("F1", col: rtech-navy)], [कंपनी सेलेक्ट / स्विच करना],

  [13], [#keypill("Alt + R", col: rtech-navy)], [रिपोर्ट से लाइन अस्थायी छुपाना (Hide)],
  [31], [#keypill("Alt + F1", col: rtech-navy)], [सक्रिय कंपनी बंद/शट करना],

  [14], [#keypill("Alt + U", col: rtech-navy)], [छुपाई गई लाइन पुनः दिखाना (Unhide)],
  [32], [#keypill("Ctrl + F1", col: rtech-navy)], [पेरोल / अटेंडेंस रजिस्टर खोलना],

  [15], [#keypill("Spacebar", col: rtech-navy)], [एक लाइन सेलेक्ट / डी-सेलेक्ट],
  [33], [#keypill("Alt + F12", col: rtech-navy)], [रिपोर्ट में कस्टम रेंज फ़िल्टर],

  [16], [#keypill("Ctrl+Space", col: rtech-navy)], [पूरी रिपोर्ट की सभी लाइन्स चुनना],
  [34], [#keypill("Ctrl + Q", col: rtech-navy)], [Tally Prime से बाहर निकलना (Quit)],

  [17], [#keypill("Alt + P", col: rtech-navy)], [इनवॉइस / रिपोर्ट का प्रिंट निकालना],
  [35], [#keypill("PgUp / PgDn", col: rtech-navy)], [पिछला / अगला वाउचर देखना],

  [18], [#keypill("Ctrl + P", col: rtech-navy)], [वर्तमान खुली स्क्रीन का तुरंत प्रिंट],
  [], [], []
)

#v(2.5pt)

#module-banner(num: "MODULE 13", title: "वर्षान्त फाइनल अकाउंट्स 5-चरणीय ऑडिट प्रोटोकॉल (Year-End Audit Protocol)", color: rtech-navy)

#block(
  width: 100%,
  stroke: 0.5pt + rtech-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 7.2pt)[
      - #hl-g[1. बैंक समाधान (BRS Check):] 31 मार्च को बैंक पासबुक और Tally बैंक लेजर का शेष शून्य अंतर से मिलना चाहिए (`F5 -> Reconcile`)।
      - #hl-y[2. मूल्यह्रास प्रविष्टि (Depreciation Entry):] सभी संपत्तियों पर कंपनी व आयकर नियमानुसार 31 मार्च को जर्नल (F7) में डेप्रिसिएशन चार्ज करें।
      - #hl-o[3. क्लोजिंग स्टॉक सत्यापन (Closing Stock):] 'Cost or Market Price, whichever is lower' के आधार पर अंतिम स्टॉक मूल्यांकन।
      - #hl-g[4. GST ITC मिलान:] GSTR-2B में दिखाई दे रहे इनपुट टैक्स क्रेडिट से Tally बुक्स के CGST, SGST, IGST का पाई-पाई मिलान करें।
      - #hl-y[5. अंतिम P&L व बैलेंस शीट जांच:] कोई भी खाता 'Suspense Account' या 'Difference in Opening Balances' में नहीं छूटा होना चाहिए।
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 08: RAHUL SIR'S MENTORSHIP MESSAGE, FREE TOOLS HUB & SMART UPGRADE
// =============================================================================

#v(6pt)

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
          #text(size: 8.2pt, weight: "bold", fill: rtech-blue)[राहुल सर का संदेश · RTechLab स्टूडेंट मेंटरशिप एवं कम्युनिटी]
        ]
      )
    ]
  )
]

#v(4pt)

// Tight Alignment: Image + Message Side-by-Side (Zero Gap)
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
        #text(size: 8pt, weight: "black", fill: rtech-navy)[राहुल पटेल (Rahul Patel)]        #v(1.5pt)
        #box(
          fill: rgb("#EFF6FF"),
          stroke: 0.8pt + rgb("#BFDBFE"),
          radius: 2.5pt,
          inset: (x: 4pt, y: 1.5pt),
          text(size: 6.2pt, weight: "black", fill: rgb("#1D4ED8"))[🏅 Tally Certified Trainer (TCT)]
        )        #v(1.5pt)
        #text(size: 6.5pt, fill: rtech-muted)[चीफ टेक्नोलॉजी आर्किटेक्ट]        #text(size: 6.2pt, fill: rtech-muted)[फाउंडर, RTechLab Publications]
      ]
    ]
  ],
  [
    #text(size: 10.5pt, weight: "black", fill: rtech-navy)[प्रिय विद्यार्थी एवं भावी अकाउंट्स लीडर,]    #v(3pt)
    #text(size: 7.8pt, fill: rtech-text)[
      अकाउंटिंग केवल डेबिट-क्रेडिट की एंट्री करना नहीं है; यह किसी भी व्यापार की रीढ़ की हड्डी होती है। एक अच्छा अकाउंटेंट वह होता है जो व्यापार के हर एक रुपये का हिसाब सही रखे और GST व TDS के नियमों का 100% अनुपालन सुनिश्चित करे।

      इस *अल्टीमेट क्विक डेस्क रेफरेंस (Quick Desk Reference)* को तैयार करने का हमारा एकमात्र उद्देश्य यह था कि जब आप ऑफिस की कुर्सी पर बैठे हों या इंटरव्यू की तैयारी कर रहे हों, तो आपको 50 जगह गूगल करने या वीडियो खोजने में समय बर्बाद न करना पड़े। यह 8 पेज आपकी टेबल पर होने का मतलब है कि आपके पास एक सीनियर अकाउंटेंट का दिमाग हमेशा मौजूद है।

      लगातार अभ्यास करते रहें, नया सीखते रहें और अपने अकाउंटिंग बुक्स हमेशा स्वच्छ एवं ऑडिटेड रखें!
    ]

    #v(3.5pt)
    #block(
      width: 100%,
      fill: rgb("#F8FAFC"),
      stroke: (left: 3pt + rtech-blue, rest: 0.5pt + rgb("#CBD5E1")),
      radius: (right: 4pt),
      inset: (x: 7pt, y: 4.5pt),
      [
        #text(size: 7.2pt, weight: "black", fill: rtech-navy)[🏆 ऑथर प्रोफाइल एवं शिक्षण विशेषज्ञता (Author Credentials & Track Record):]        #v(2pt)
        #grid(
          columns: (1fr, 1.15fr),
          gutter: 6pt,
          [
            - *Owner & Director:* IANT पालनपुर
            - *10+ वर्ष का अनुभव:* IT एवं वोकेशनल ट्रेनिंग
          ],
          [
            - *3,000+ छात्र प्रशिक्षित:* गुजरात भर में
            - *मास्टर फैकल्टी:* Tally Essential (L1, L2, L3) व Professional
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
                  text(size: 6pt, weight: "black", fill: rtech-blue)[पोर्टफोलियो साइट]
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

#v(6pt)

// Helpline & Community Box
#block(
  width: 100%,
  stroke: 1pt + rgb("#86EFAC"),
  fill: rgb("#F0FDF4"),
  radius: 5pt,
  inset: (x: 10pt, y: 6pt),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (horizon, horizon),
      [
        #text(size: 22pt)[📱]
      ],
      [
        #text(size: 8.8pt, weight: "black", fill: rtech-emerald)[ऑफिशियल WhatsApp स्टूडेंट हेल्पलाइन एवं कम्युनिटी सपोर्ट]        #v(1.5pt)
        #text(size: 7.2pt, fill: rtech-text)[
          यदि आपको अकाउंटिंग एंट्री, GST सेटिंग्स या करियर में कोई भी संशय हो, तो हमारी ऑफिशियल हेल्पलाइन पर संपर्क करें:          - #text(weight: "bold")[WhatsApp हेल्पलाइन:] #hl-g[+91 76468 92094] (चैट-ओनली पॉलिसी · त्वरित समाधान)          - #text(weight: "bold")[ऑफिशियल WhatsApp कम्युनिटी चैनल:] #link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[#text(fill: rtech-blue, weight: "bold")[यहाँ क्लिक करके RTechLab चैनल जॉइन करें →]]
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
  radius: 5pt,
  inset: (x: 10pt, y: 6pt),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align: (horizon, horizon),
      [
        #text(size: 22pt)[🛠️]
      ],
      [
        #text(size: 8.8pt, weight: "black", fill: rtech-blue)[RTechLab के 100% फ्री इंटरएक्टिव टूल्स पर अभ्यास करें]        #v(1.5pt)
        #text(size: 7.2pt, fill: rtech-text)[
          वेबसाइट पर रोजाना अपनी तकनीकी दक्षता बढ़ाने के लिए हमारे फ्री ब्राउज़र टूल्स का उपयोग करें:          - #text(weight: "bold")[Daily 10-Second Technical Quiz:] हर रोज़ 1 नया सवाल और तुरंत रिजल्ट देखें।          - #text(weight: "bold")[Free Engineering Tools Hub:] Subnet Calculator, DNS Lookup, IP Info, Binary Converter।          - #text(weight: "bold")[वेबसाइट डायरेक्ट लिंक:] #link("https://rtechlab.vercel.app/tools")[#text(fill: rtech-blue, weight: "bold")[rtechlab.vercel.app/tools]]
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
  radius: 5pt,
  inset: (x: 10pt, y: 7pt),
  [
    #grid(
      columns: (auto, 1fr, auto),
      gutter: 10pt,
      align: (horizon, horizon, horizon),
      [
        #text(size: 24pt)[📘]
      ],
      [
        #text(size: 9pt, weight: "black", fill: rtech-amber.darken(10%))[क्या आप 50 कमर्शियल इनवॉइस और इंटरव्यू में महारत चाहते हैं?]        #v(2pt)
        #text(size: 7.2pt, fill: rtech-text)[
          इस क्विक डेस्क शीट के बाद, यदि आप वास्तविक व्यापारिक बिलिंग (APMC कृषि उपज, जीरा/इसबगोल, इलेक्ट्रॉनिक्स, बैंक समाधान और टॉप 50 MNC कॉर्पोरेट इंटरव्यू प्रश्न) शून्य से सीखना चाहते हैं, तो हमारे *51-पेज के सम्पूर्ण Tally Prime Master Guide* में अपग्रेड करें!
        ]
      ],
      [
        #box(
          fill: rtech-emerald,
          radius: 4pt,
          inset: (x: 8pt, y: 6pt),
          [
            #link("https://rtechlab.vercel.app/notes")[
              #text(size: 7.5pt, weight: "black", fill: white)[अपग्रेड सिर्फ ₹27 में →]              #v(1pt)
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
