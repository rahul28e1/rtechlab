// =============================================================================
// RTECHLAB TALLY PRIME 2027 ULTIMATE DESK CHEAT SHEET (GUJARATI EDITION)
// Micro-Transaction Master Desk Companion (A4 · Exactly 8 Pages · Printable)
// Author: Rahul Patel (Chief Technology Architect & Founder, RTechLab Publications)
// Official Portal: https://rtechlab.vercel.app
// =============================================================================

#set document(
  title: "Tally Prime 2027 Ultimate Desk Reference & Cheat Sheet (Gujarati)",
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
          #text(size: 7.5pt, weight: "bold", fill: rgb("#047857"))[Tally Prime 2027 ડેઇલી ડેસ્ક રેફરન્સ અને ચીટ શીટ]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Professional Productivity Edition]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · રાહુલ પટેલ]
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
            #text(fill: rgb("#059669"))[●] ટેકનોલોજી મેડ પ્રેક્ટિકલ · તમારા એકાઉન્ટિંગ ટેબલ પર પ્રિન્ટ કરીને રાખો · ફ્રી ટૂલ્સ: #link("https://rtechlab.vercel.app/tools")[*rtechlab.vercel.app/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 6pt, y: 2pt),
            text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[પેજ #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
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
// PAGE 02: TABLE OF CONTENTS & 3 GOLDEN RULES (GUJARATI)
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
  #text(size: 14pt, weight: "black", fill: rtech-navy)[વિગતવાર વિષય સૂચિ અને નામાના 3 સુવર્ણ નિયમો (Golden Rules)]
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

  text(size: 7pt, weight: "bold", fill: white)[પેજ નં.],
  text(size: 7pt, weight: "bold", fill: white)[પ્રકરણ / વિષય સામગ્રી (Topic Description)],
  text(size: 7pt, weight: "bold", fill: white)[મુખ્ય ફોકસ],

  [Page 1], [ઓફિશિયલ બેસ્ટસેલર બુક કવર અને મુખ્ય મિશન], [Cover & Goals],
  [Page 2], [વિષય સૂચિ, 3 ગોલ્ડન રૂલ્સ અને પાકા સરવૈયાનું સમીકરણ], [Rules & Equation],
  [Page 3], [Tally Prime ના તમામ 28 ગ્રુપ્સ (15 પ્રાઇમરી + 13 સેકેન્ડરી)], [All 28 Groups],
  [Page 4], [Tally Prime ના તમામ 24 વાઉચર્સ (ક્રમાંક 1 થી 24) અને મોડ ગાઇડ], [All 24 Vouchers],
  [Page 5], [આધુનિક GST માળખું (0%, 5%, 18%) અને ટેક્સ ઇનવોઇસ ચેકલિસ્ટ], [GST & Invoice],
  [Page 6], [કોર્પોરેટ TDS મેટ્રિક્સ (194C, 194J, 194I) અને બેંક ચેક BRS ચાર્ટ], [TDS & BRS Cheque],
  [Page 7], [ટોપ 35 કીબોર્ડ શોર્ટકટ્સ (ક્રમાંક 1 થી 35) અને વર્ષાંત ઓડિટ], [Top 35 Hotkeys],
  [Page 8], [રાહુલ સરનો સંદેશ, WhatsApp હેલ્પલાઇન અને ટૂલ્સ હબ], [Mentorship & Tools],
)

#v(3pt)

#module-banner(num: "MODULE 01", title: "દ્વિનોંધી નામા પદ્ધતિના 3 સુવર્ણ નિયમો (The 3 Golden Rules)", color: rtech-emerald)

#table(
  columns: (1.2fr, 2fr, 1.4fr, 1.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 4.2pt,

  text(size: 7.2pt, weight: "bold", fill: white)[ખાતાનો પ્રકાર (Account Type)],
  text(size: 7.2pt, weight: "bold", fill: white)[નામાનો મૂળભૂત નિયમ (Golden Rule)],
  text(size: 7.2pt, weight: "bold", fill: white)[ઉધાર ક્યારે કરવું? (Dr)],
  text(size: 7.2pt, weight: "bold", fill: white)[જમા ક્યારે કરવું? (Cr)],

  [#text(weight: "bold", fill: rtech-blue)[1. વ્યક્તિ ખાતું]\ (Personal Account)],
  [#hl-y[લેનાર ખાતે ઉધાર (Debit) કરો,] \ #hl-y[આપનાર ખાતે જમા (Credit) કરો.]],
  [#text(fill: rtech-emerald, weight: "bold")[Debit the Receiver]\ (દા.ત. Ramesh Dr)],
  [#text(fill: rtech-rose, weight: "bold")[Credit the Giver]\ (દા.ત. To Suresh)],

  [#text(weight: "bold", fill: rtech-emerald)[2. માલ-મિલકત ખાતું]\ (Real Account)],
  [#hl-g[આવે તે ઉધાર (Debit) કરો,] \ #hl-g[જાય તે જમા (Credit) કરો.]],
  [#text(fill: rtech-emerald, weight: "bold")[What Comes In Dr]\ (દા.ત. Cash / Machinery)],
  [#text(fill: rtech-rose, weight: "bold")[What Goes Out Cr]\ (દા.ત. To Cash)],

  [#text(weight: "bold", fill: rtech-amber)[3. ઊપજ-ખર્ચ ખાતું]\ (Nominal Account)],
  [#hl-y[ખર્ચ કે નુકસાન ઉધાર કરો,] \ #hl-y[આવક કે લાભ જમા કરો.]],
  [#text(fill: rtech-emerald, weight: "bold")[Expenses & Losses Dr]\ (દા.ત. Salary / Rent Dr)],
  [#text(fill: rtech-rose, weight: "bold")[Incomes & Gains Cr]\ (દા.ત. To Interest / Comm.)]
)

#v(3pt)

#module-banner(num: "MODULE 02", title: "મૂળભૂત હિસાબી સમીકરણ (Fundamental Accounting Equation)", color: rtech-blue)

#align(center)[
  #block(
    width: 100%,
    fill: rgb("#F0F9FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 4pt,
    inset: (x: 10pt, y: 7pt),
    [
      #text(size: 10pt, weight: "black", fill: rtech-navy)[કુલ મિલકતો (Total Assets) = બાહ્ય દેવાં (Liabilities) + માલિકની મૂડી (Capital)]\
      #v(3pt)
      #text(size: 7.5pt, fill: rtech-muted)[
        વેપારમાં દરેક ઉધારનો સમાન જમા વ્યવહાર હોય છે. પાકા સરવૈયાની બંને બાજુઓ હંમેશા સરખી રહેવી અનિવાર્ય છે!
      ]
    ]
  )
]

#pagebreak()

// =============================================================================
// PAGE 03: ALL 28 TALLY PRIME GROUPS (GUJARATI)
// =============================================================================

#module-banner(num: "MODULE 03", title: "Tally Prime ના તમામ 28 ગ્રુપ્સ : ભાગ 1 — 15 પ્રાઇમરી ગ્રુપ્સ", color: rtech-emerald)

#text(size: 7.2pt, fill: rtech-muted)[
  પ્રાઇમરી ગ્રુપ્સ તે મુખ્ય ગ્રુપ્સ છે જે સીધા પાકા સરવૈયા અથવા નફા-નુકસાન ખાતા સાથે જોડાયેલા હોય છે:
]
#v(2pt)

#table(
  columns: (0.5fr, 2fr, 1.8fr, 3.5fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, left, left).at(col) + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ક્ર.],
  text(size: 6.8pt, weight: "bold", fill: white)[પ્રાઇમરી ગ્રુપનું નામ],
  text(size: 6.8pt, weight: "bold", fill: white)[સ્વરૂપ (Nature)],
  text(size: 6.8pt, weight: "bold", fill: white)[વાણિજ્યિક લેજરનું ઉદાહરણ અને વિગત],

  [1], [*Capital Account*], [પાકું સરવૈયું], [માલિકની મૂડી (Proprietor Capital), પાર્ટનર્સ કેપિટલ, ઉપાડ ખાતું (Drawings)],
  [2], [*Loans (Liability)*], [પાકું સરવૈયું], [બેંક ટર્મ લોન (SBI/HDFC), ડિરેક્ટર લોન, અનસિક્યોર્ડ લોન],
  [3], [*Current Liabilities*], [પાકું સરવૈયું], [ટૂંકા ગાળાનાં તમામ દેવાં જે 12 મહિનામાં ચૂકવવાના હોય છે],
  [4], [*Fixed Assets*], [પાકું સરવૈયું], [કાયમી મિલકતો: મશીનરી, કમ્પ્યુટર, ઓફિસ ફર્નિચર, બિલ્ડિંગ],
  [5], [*Current Assets*], [પાકું સરવૈયું], [ચાલુ મિલકતો જે 1 વર્ષની અંદર રોકડમાં ફેરવાઈ શકે છે],
  [6], [*Misc. Expenses (Asset)*], [પાકું સરવૈયું], [પ્રાથમિક ખર્ચ (Preliminary Expenses) જેનું રાઇટ-ઓફ બાકી હોય],
  [7], [*Branch / Divisions*], [પાકું સરવૈયું], [કંપનીની અન્ય શાખાઓ (અમદાવાદ / સુરત શાખા) ના પરસ્પર ખાતાં],
  [8], [*Suspense Account*], [પાકું સરવૈયું], [અજ્ઞાત લેવડ-દેવડ (વર્ષના અંતે આ ખાતું શૂન્ય હોવું ફરજિયાત છે)],
  [9], [*Investments*], [પાકું સરવૈયું], [શેર, મ્યુચ્યુઅલ ફંડ, ફિક્સ્ડ ડિપોઝિટ (FD), સરકારી બોન્ડ્સ],
  [10], [*Sales Accounts*], [વેપાર ખાતું], [માલ અથવા સેવાઓનું કુલ વેચાણ (લોકલ GST વેચાણ, એક્સપોર્ટ વેચાણ)],
  [11], [*Purchase Accounts*], [વેપાર ખાતું], [માલ અથવા કાચા માલની કુલ ખરીદી (સ્થાનિક GST અને આંતરરાજ્ય)],
  [12], [*Direct Incomes*], [વેપાર ખાતું], [ફેક્ટરી સીધી આવક: જોબ વર્ક આવક, ડિલિવરી ભાડું, સર્વિસ રેવન્યુ],
  [13], [*Indirect Incomes*], [નફા-નુકસાન ખાતું], [અન્ય આવકો: બેંક વ્યાજ, મળેલ કમિશન, મળેલ ભાડું, મળેલ વટાવ],
  [14], [*Direct Expenses*], [વેપાર ખાતું], [ઉત્પાદન અને માલ લાવવાના ખર્ચા: મજૂરી, આવક માલ ગાડાભાડું, પાવર],
  [15], [*Indirect Expenses*], [નફા-નુકસાન ખાતું], [ઓફિસ અને વહીવટી ખર્ચા: પગાર, ઓફિસ ભાડું, સ્ટેશનરી, ઓડિટ ફી],
)

#v(3pt)

#module-banner(num: "MODULE 04", title: "Tally Prime ના તમામ 28 ગ્રુપ્સ : ભાગ 2 — 13 સેકેન્ડરી સબ-ગ્રુપ્સ", color: rtech-blue)

#text(size: 7.2pt, fill: rtech-muted)[
  સેકેન્ડરી સબ-ગ્રુપ્સ તે ગ્રુપ્સ છે જે કોઈ પ્રાઇમરી ગ્રુપ હેઠળ ચોક્કસ વર્ગીકરણ માટે બનાવવામાં આવે છે:
]
#v(2pt)

#table(
  columns: (0.5fr, 2fr, 2fr, 3.5fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, left, left).at(col) + horizon },
  inset: 2.8pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ક્ર.],
  text(size: 6.8pt, weight: "bold", fill: white)[સેકેન્ડરી સબ-ગ્રુપનું નામ],
  text(size: 6.8pt, weight: "bold", fill: white)[મૂળ પ્રાઇમરી ગ્રુપ (Parent)],
  text(size: 6.8pt, weight: "bold", fill: white)[વાણિજ્યિક લેજરનું ઉદાહરણ],

  [1], [*Reserves & Surplus*], [Capital Account], [અનામત અને વધારો (સામાન્ય અનામત, રાખી મૂકેલ કમાણી)],
  [2], [*Bank OD / OCC A/c*], [Loans (Liability)], [બેંક ઓવરડ્રાફ્ટ ખાતું (SBI OD Account - ક્રેડિટ લિમિટ)],
  [3], [*Secured Loans*], [Loans (Liability)], [તારણવાળી લોન (મશીનરી કે ગોડાઉન સ્ટોક ગિરવે મૂકી લીધેલ લોન)],
  [4], [*Unsecured Loans*], [Loans (Liability)], [મિત્રો, સગાંઓ કે ડિરેક્ટર્સ પાસેથી કોઈ ગેરંટી વગર લીધેલ લોન],
  [5], [*Duties & Taxes*], [Current Liabilities], [CGST, SGST, IGST, TDS Payable, TCS કરવેરા લેજર્સ],
  [6], [*Provisions*], [Current Liabilities], [જોગવાઈઓ: ઇન્કમટેક્સ જોગવાઈ, શંકાસ્પદ દેવાં અનામત],
  [7], [*Sundry Creditors*], [Current Liabilities], [#hl-y[લેણદારો / સપ્લાયર્સ] જેમની પાસેથી ઉધાર માલ કે સેવા ખરીદી હોય],
  [8], [*Bank Accounts*], [Current Assets], [બેંક ચાલુ અને બચત ખાતાં: SBI કરન્ટ એકાઉન્ટ, HDFC બેંક ખાતું],
  [9], [*Cash-in-Hand*], [Current Assets], [તિજોરીમાં રોકડ સિલક: મુખ્ય રોકડ ખાતું, પેટી કેશ],
  [10], [*Deposits (Asset)*], [Current Assets], [સિક્યોરિટી ડિપોઝિટ: વીજળી ડિપોઝિટ, દુકાન ડિપોઝિટ],
  [11], [*Loans & Advances (Asset)*], [Current Assets], [કર્મચારીઓને આપેલી એડવાન્સ સેલરી, વેપારીઓને એડવાન્સ ચુકવણી],
  [12], [*Stock-in-Hand*], [Current Assets], [ગોડાઉનમાં પડેલ આખર સ્ટોક (Closing Stock Value)],
  [13], [*Sundry Debtors*], [Current Assets], [#hl-g[દેવાદારો / ગ્રાહકો] જેમને ઉધાર માલ કે સેવા વેચી હોય],
)

#v(2pt)
#text(size: 7.2pt, weight: "bold", fill: rtech-emerald)[
  કુલ સરવાળો: 15 પ્રાઇમરી ગ્રુપ્સ + 13 સેકેન્ડરી સબ-ગ્રુપ્સ = કુલ 28 ગ્રુપ્સ. Tally માં નવું ગ્રુપ 'Alt + C' થી બનાવી શકાય છે.
]

#pagebreak()

// =============================================================================
// PAGE 04: ALL 24 VOUCHERS (GUJARATI)
// =============================================================================

#module-banner(num: "MODULE 05", title: "Tally Prime ના તમામ 24 વાઉચર્સ (ક્રમાંક 1 થી 24 સંપૂર્ણ માસ્ટર ગાઇડ)", color: rtech-blue)

#text(size: 7.2pt, fill: rtech-muted)[
  ગેટવે ઓફ ટેલી પરથી #hl-y[V (Vouchers)] દબાવો. નીચે તમામ 24 વાઉચર્સનું વ્યવસાયિક વર્ગીકરણ આપેલ છે:
]
#v(2pt)

#table(
  columns: (0.4fr, 1.2fr, 2.2fr, 4.2fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, center, left, left).at(col) + horizon },
  inset: 2.6pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ક્ર.],
  text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.8pt, weight: "bold", fill: white)[વાઉચરનું નામ],
  text(size: 6.8pt, weight: "bold", fill: white)[વાણિજ્યિક ઉપયોગ અને નિયમ (Purpose & Rules)],

  [1], [#keypill("F4", col: rtech-blue)], [*Contra Voucher*], [#hl-y[માત્ર બેંક અને રોકડ વચ્ચેની આંતરિક લેવડદેવડ]: બેંકમાં રોકડા ભર્યા, બેંકમાંથી રોકડા ઉપાડ્યા.],
  [2], [#keypill("F5", col: rtech-rose)], [*Payment Voucher*], [#hl-y[વેપારમાંથી નાણાં ચૂકવવા]: સપ્લાયરને ચુકવણી, પગાર, ભાડું, ટેક્સ ચુકવણી રોકડ/ચેકથી.],
  [3], [#keypill("F6", col: rtech-emerald)], [*Receipt Voucher*], [#hl-y[વેપારમાં નાણાં આવવા]: ગ્રાહકો પાસેથી ઉઘરાણી, બેંક વ્યાજ, માલિકે લાવેલી મૂડી.],
  [4], [#keypill("F7", col: rgb("#334155"))], [*Journal Voucher*], [#hl-y[બિન-રોકડ હવાલા]: મિલકતો પર ઘસારો (Depreciation), ભૂલ સુધારણા નોંધ, ઉધાર મિલકત ખરીદી.],
  [5], [#keypill("F8", col: rtech-emerald)], [*Sales Voucher*], [#hl-g[માલ કે સેવાનું વેચાણ]: રોકડ અથવા ઉધાર વેચાણ બિલ GST કરવેરા ગણતરી સાથે.],
  [6], [#keypill("F9", col: rtech-amber)], [*Purchase Voucher*], [#hl-b[માલ કે કાચા માલની ખરીદી]: સપ્લાયર ઇનવોઇસ નોંધીને GST ITC ક્લેમ કરવા માટે.],
  [7], [#keypill("Alt + F5", col: rtech-rose)], [*Debit Note*], [ખરીદ પરત (Purchase Return) અથવા સપ્લાયરને ડેબિટ કરવા.],
  [8], [#keypill("Alt + F6", col: rtech-emerald)], [*Credit Note*], [વેચાણ પરત (Sales Return) અથવા ગ્રાહકને ભાવફેર/ડિસ્કાઉન્ટ જમા આપવા.],
  [9], [#keypill("Ctrl + F4", col: rgb("#1E293B"))], [*Payroll Voucher*], [કર્મચારીઓનો માસિક પગાર, ભથ્થાં, PF, ESIC ઓટોમેટિક પ્રક્રિયા કરવા.],
  [10], [#keypill("Ctrl + F7", col: rgb("#1E293B"))], [*Reversing Journal*], [નાણાકીય વર્ષના અંતે પોસ્ટ-ડેટેડ જોગવાઈઓ જે બીજા દિવસે રિવર્સ થાય છે.],
  [11], [#keypill("Alt + F7", col: rtech-blue)], [*Stock Journal*], [#hl-y[ગોડાઉન સ્ટોક ટ્રાન્સફર]: એક ગોડાઉનમાંથી બીજા ગોડાઉનમાં માલ મોકલવા અથવા ઉત્પાદન નોંધ.],
  [12], [#keypill("Alt + F8", col: rtech-blue)], [*Delivery Note*], [વેચાણ ડિલિવરી ચલણ: પાકા બિલ પહેલાં માલ ગ્રાહકને પહોંચાડતી વખતે.],
  [13], [#keypill("Alt + F9", col: rtech-blue)], [*Receipt Note*], [આવક ચલણ: સપ્લાયર પાસેથી માલ આવ્યો પરંતુ પાકું બિલ પછીથી આવવાનું હોય.],
  [14], [#keypill("Ctrl + F8", col: rtech-rose)], [*Rejection Out*], [નુકસાનીવાળો માલ સપ્લાયરને બિલ બન્યા પહેલાં જ પરત કરી દેવા માટે.],
  [15], [#keypill("Ctrl + F9", col: rtech-emerald)], [*Rejection In*], [ગ્રાહક દ્વારા પરત કરાયેલ ખામીયુક્ત માલ બિલિંગ પહેલાં સ્વીકારવા માટે.],
  [16], [#keypill("Alt + F10", col: rgb("#0F172A"))], [*Physical Stock*], [ગોડાઉનમાં પ્રત્યક્ષ ભૌતિક સ્ટોકની ગણતરી ટેલી સ્ટોક સાથે મેળવવા માટે.],
  [17], [#keypill("Ctrl + F2", col: rgb("#0F172A"))], [*Material In*], [જોબ વર્ક માટે મોકલેલ માલ કામ પૂરું થયા પછી ફેક્ટરીમાં પાછો આવવો.],
  [18], [#keypill("Ctrl + F3", col: rgb("#0F172A"))], [*Material Out*], [પ્રોસેસિંગ માટે કાચો માલ જોબ વર્કરને ફેક્ટરી બહાર મોકલવો.],
  [19], [#keypill("Alt + F4", col: rtech-amber)], [*Purchase Order*], [સપ્લાયરને અધિકૃત ખરીદ ઓર્ડર (PO) મોકલવો (જથ્થો, ભાવ, ડિલિવરી તારીખ).],
  [20], [#keypill("Alt + F5", col: rtech-emerald)], [*Sales Order*], [ગ્રાહક પાસેથી મળેલ વેચાણ ઓર્ડર (SO) જે બાદમાં બિલમાં કન્વર્ટ થાય છે.],
  [21], [#keypill("Ctrl + F5", col: rgb("#0F172A"))], [*Attendance Voucher*], [કર્મચારીઓની હાજરી/ગેરહાજરી અને ઓવરટાઇમના કલાકો નોંધવા માટે.],
  [22], [#keypill("Ctrl + F6", col: rgb("#0F172A"))], [*Job Work Order*], [ત્રીજા પક્ષને ચોક્કસ ઔદ્યોગિક પ્રક્રિયા કરવાનો જોબ વર્ક ઓર્ડર સોંપવો.],
  [23], [#keypill("Alt + F10", col: rgb("#334155"))], [*Memorandum Voucher*], [બિન-હિસાબી યાદી નોંધ; જ્યાં સુધી રૂપાંતર ન થાય ત્યાં સુધી ખાતાઓને અસર કરતી નથી.],
  [24], [#keypill("Ctrl + L", col: rgb("#0F172A"))], [*Optional Voucher*], [કાલ્પનિક અનુમાન પ્રવિષ્ટિ (Forecasting) જે અંતિમ હિસાબોને અસર કરતી નથી.]
)

#v(2pt)

#module-banner(num: "MODULE 06", title: "વાઉચર મોડ પરિવર્તન: Ctrl + H (Change Mode Master Trick)", color: rtech-amber)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  [
    #block(stroke: 0.8pt + rtech-border, fill: rgb("#F8FAFC"), inset: 5pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-blue)[1. Item Invoice Mode:]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-muted)[વેપાર માટે: આઇટમનું નામ, ગોડાઉન, જથ્થો (Qty), ભાવ અને GST કરવેરા અલગ-અલગ દેખાય.]
    ]
  ],
  [
    #block(stroke: 0.8pt + rtech-border, fill: rgb("#F8FAFC"), inset: 5pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-emerald)[2. Accounting Invoice Mode:]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-muted)[સર્વિસ ઇન્ડસ્ટ્રી (CA, વકીલ, સોફ્ટવેર) માટે: જથ્થા વગર સીધી સેવા ફી સાથે GST ઉમેરાય.]
    ]
  ],
  [
    #block(stroke: 0.8pt + rtech-border, fill: rgb("#F8FAFC"), inset: 5pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-navy)[3. As Voucher Mode:]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-muted)[પરંપરાગત ઉધાર (Dr/By) અને જમા (Cr/To) ફોર્મેટ: જેમને જર્નલ સ્ટાઇલમાં એન્ટ્રી ગમે છે.]
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 05: MODERN GST STRUCTURE & RULE 46 (GUJARATI)
// =============================================================================

#module-banner(num: "MODULE 07", title: "આધુનિક GST માળખું અને ટેક્સ લેજર મેપિંગ (Modern GST Framework)", color: rtech-amber)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.8pt + rgb("#BAE6FD"), inset: 6pt, radius: 4pt)[
      #text(weight: "bold", size: 7.5pt, fill: rtech-blue)[A. રાજ્ય અંદર વેચાણ (Intra-State Supply)]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-navy)[
        *નિયમ:* જ્યારે વિક્રેતા અને ગ્રાહક એક જ રાજ્યના હોય (દા.ત. ગુજરાતથી ગુજરાત). ટેક્સ બે સરખા ભાગમાં વહેંચાય છે: *CGST* (કેન્દ્ર 50%) + *SGST* (રાજ્ય 50%).\
        *દા.ત. 18% દર:* 9% CGST + 9% SGST.
      ]
    ]
  ],
  [
    #block(fill: rgb("#FEF3C7"), stroke: 0.8pt + rgb("#FDE68A"), inset: 6pt, radius: 4pt)[
      #text(weight: "bold", size: 7.5pt, fill: rtech-amber)[B. આંતરરાજ્ય વેચાણ (Inter-State Supply)]\
      #v(2pt)
      #text(size: 6.8pt, fill: rtech-navy)[
        *નિયમ:* જ્યારે વિક્રેતા અને ગ્રાહક અલગ-અલગ રાજ્યોના હોય (દા.ત. ગુજરાતથી મહારાષ્ટ્ર). પૂરો 100% ટેક્સ *IGST* હેઠળ લેવામાં આવે છે.\
        *દા.ત. 18% દર:* પૂરો 18% IGST (CGST અને SGST શૂન્ય રહેશે).
      ]
    ]
  ]
)

#v(2pt)

#module-banner(num: "MODULE 08", title: "વાણિજ્યિક GST દર મેટ્રિક્સ (GST Slabs by Commodity)", color: rtech-emerald)

#table(
  columns: (1fr, 2.8fr, 1.8fr, 2.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, left, center, left).at(col) + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[GST સ્લેબ],
  text(size: 6.8pt, weight: "bold", fill: white)[મુખ્ય ચીજવસ્તુઓ અને ઉદ્યોગ],
  text(size: 6.8pt, weight: "bold", fill: white)[HSN / SAC કોડ],
  text(size: 6.8pt, weight: "bold", fill: white)[Tally Prime રૂપરેખા SOP],

  [#keypill("0% (Nil)", col: rgb("#0F172A"))],
  [ખેત પેદાશ (APMC જીરું, અનાજ, કઠોળ, તાજા શાકભાજી, કાચું દૂધ)],
  [HSN 0909 / HSN 1211],
  [Taxability: *Exempt / Nil Rated*],

  [#keypill("5% Slab", col: rtech-amber)],
  [પેક્ડ ખાદ્યસામગ્રી, ચા, ખાંડ, કોલસો, ₹1000 થી સસ્તા કપડાં, ટ્રાન્સપોર્ટ],
  [HSN 0902 / HSN 1701],
  [Intra: #hl-y[2.5% + 2.5%] | Inter: #hl-y[5%]],

  [#keypill("12% Slab", col: rtech-blue)],
  [પ્રોસેસ્ડ ફૂડ, ઘી, માખણ, દવાઓ, મોબાઇલ પાર્ટ્સ, સ્ટેશનરી],
  [HSN 0405 / HSN 3004],
  [Intra: #hl-b[6% + 6%] | Inter: #hl-b[12%]],

  [#keypill("18% Slab", col: rtech-emerald)],
  [સૌથી વધુ વપરાશ! ઇલેક્ટ્રોનિક્સ, કમ્પ્યુટર, IT સોફ્ટવેર, AC રેસ્ટોરન્ટ],
  [HSN 8471 / SAC 9983],
  [Intra: #hl-g[9% + 9%] | Inter: #hl-g[18%]],

  [#keypill("28% Slab", col: rtech-rose)],
  [મોજશોખની વસ્તુઓ: લક્ઝરી કાર, સિમેન્ટ, તમાકુ, કોલ્ડ ડ્રિંક્સ],
  [HSN 8703 / HSN 2523],
  [Intra: 14% + 14% (+ Cess જો લાગુ હોય)],
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
  #text(size: 6.5pt, fill: rtech-muted, style: "italic")[આકૃતિ 5.1: Rule 46 અનુસાર સત્તાવાર GST ટેક્સ ઇનવોઇસ — સપ્લાયર/ગ્રાહક GSTIN, HSN કોડ અને CGST/SGST વિભાજન]
]

#v(2pt)

#module-banner(num: "MODULE 09", title: "Rule 46 ટેક્સ ઇનવોઇસ 8 અનિવાર્ય શરતો (Mandatory Invoice Checklist)", color: rtech-navy)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    - *1. ક્રમિક બિલ નંબર (Invoice No):* નાણાકીય વર્ષમાં વધુમાં વધુ 16 અક્ષર (અદ્વિતીય).
    - *2. જારી કરવાની તારીખ (Date):* માલ રવાના કરતાં પહેલાં કે તે જ દિવસે.
    - *3. સપ્લાયર વિગતો:* પેઢીનું નામ, સરનામું અને 15-અંકનો સત્તાવાર GSTIN.
    - *4. ગ્રાહક વિગતો:* નામ, સરનામું, GSTIN અને રાજ્ય કોડ (દા.ત. 24 Gujarat).
  ],
  [
    - *5. સપ્લાય સ્થળ (POS):* કર નક્કી કરવાનો આધાર (Intra vs Inter-state).
    - *6. HSN/SAC કોડ:* ટર્નઓવર મુજબ 4-અંક અથવા 6-અંકનો સચોટ કોડ.
    - *7. કર વિભાજન:* ટેક્સેબલ વેલ્યુ, CGST, SGST કે IGST ની અલગ રકમ.
    - *8. ડિજિટલ સહી / QR કોડ:* B2B ઈ-ઇનવોઇસિંગ માટે અનિવાર્ય QR કોડ.
  ]
)

#pagebreak()

// =============================================================================
// PAGE 06: CORPORATE TDS MASTER MATRIX & CTS CHEQUE (GUJARATI)
// =============================================================================

#module-banner(num: "MODULE 10", title: "કોર્પોરેટ TDS દરો અને કલમો (Corporate TDS Master Matrix FY 2026-27)", color: rtech-rose)

#text(size: 7.2pt, fill: rtech-muted)[
  TDS (Tax Deducted at Source) આવકવેરા કાયદા હેઠળ ચુકવણી વખતે કાપવો ફરજિયાત છે:
]
#v(2pt)

#table(
  columns: (1.4fr, 3.2fr, 1.8fr, 2.6fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (left, left, center, left).at(col) + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[TDS કલમ (Section)],
  text(size: 6.8pt, weight: "bold", fill: white)[ચુકવણીનું સ્વરૂપ (Nature of Payment)],
  text(size: 6.8pt, weight: "bold", fill: white)[TDS દર (Rate)],
  text(size: 6.8pt, weight: "bold", fill: white)[વાર્ષિક છૂટ મર્યાદા (Threshold)],

  [#text(weight: "bold", fill: rtech-rose)[Section 194C]],
  [કોન્ટ્રાક્ટર / ટ્રાન્સપોર્ટ / જાહેરાત / જોબ વર્ક],
  [1% (વ્યક્તિ/HUF) \ 2% (કંપની/પેઢી)],
  [એકલ બિલ > ₹30,000 \ અથવા વર્ષમાં કુલ > ₹1,00,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 194J]],
  [પ્રોફેશનલ વ ફી (CA, વકીલ, સોફ્ટવેર કન્સલ્ટન્ટ)],
  [10% (પ્રોફેશનલ) \ 2% (ટેકનિકલ સેવા)],
  [વર્ષમાં > ₹30,000 \ (ડિરેક્ટર ફી પર કોઈ મર્યાદા નથી)],

  [#text(weight: "bold", fill: rtech-rose)[Section 194I]],
  [ભાડાની ચુકવણી (ઓફિસ, દુકાન, ગોડાઉન, મશીનરી)],
  [2% (મશીનરી) \ 10% (જમીન/મકાન)],
  [નાણાકીય વર્ષમાં કુલ ભાડું > ₹2,40,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 194H]],
  [કમિશન અથવા દલાલી (પ્રોપર્ટી બ્રોકરેજ)],
  [5%],
  [વર્ષમાં કુલ કમિશન > ₹15,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 194Q]],
  [માલની ખરીદી પર TDS (ટર્નઓવર > ₹10 કરોડ)],
  [0.1%],
  [સપ્લાયર પાસેથી વાર્ષિક ખરીદી > ₹50,00,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 194A]],
  [વ્યાજ ચુકવણી (ફિક્સ્ડ ડિપોઝિટ / અનસિક્યોર્ડ લોન)],
  [10%],
  [બેંક: ₹40,000 (વરિષ્ઠ ₹50k), અન્ય: ₹5,000],

  [#text(weight: "bold", fill: rtech-rose)[Section 206AA]],
  [#hl-y[દંડાત્મક દર:] જો વેન્ડર માન્ય PAN કાર્ડ ન આપે],
  [#keypill("20% Flat", col: rtech-rose)],
  [કોઈ છૂટ મર્યાદા નથી (તમામ બિલ પર સીધો 20%)]
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
  #text(size: 6.5pt, fill: rtech-muted, style: "italic")[આકૃતિ 6.1: CTS-2010 માનક બેંક ચેક અને બેંક સમાધાન (BRS) — A/c Payee ક્રોસિંગ, MICR બેન્ડ અને ચેક નંબર ટ્રેકિંગ]
]

#v(2pt)

#module-banner(num: "MODULE 11", title: "Tally Prime માં TDS એન્ટ્રી પ્રવાહ અને Form 26Q કેલેન્ડર", color: rtech-emerald)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(stroke: 0.5pt + rtech-border, fill: rgb("#F8FAFC"), inset: 6pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-navy)[TDS 3-તબક્કા હિસાબી ફ્લો:]\
      #v(2pt)
      - *1. બિલ બુકિંગ (F7 Journal):* Audit Fee Dr / To TDS Payable Cr / To CA Party Cr
      - *2. વેન્ડર ચુકવણી (F5 Payment):* CA Party Dr / To Bank Cr (નેટ 90% રકમ)
      - *3. સરકારી ચલણ (F5 Stat Payment):* TDS Payable Dr / To Bank Cr (ચલણ 281)
    ]
  ],
  [
    #block(stroke: 0.5pt + rtech-border, fill: rgb("#F8FAFC"), inset: 6pt, radius: 3pt)[
      #text(weight: "bold", size: 7.2pt, fill: rtech-navy)[Form 26Q ત્રિમાસિક રિટર્ન ડ્યૂ ડેટ્સ:]\
      #v(2pt)
      - *Q1 (Apr-Jun):* #text(weight: "bold", fill: rtech-emerald)[31મી જુલાઈ] (વિલંબ શુલ્ક ₹200 પ્રતિ દિન)
      - *Q2 (Jul-Sep):* #text(weight: "bold", fill: rtech-emerald)[31મી ઓક્ટોબર]
      - *Q3 (Oct-Dec):* #text(weight: "bold", fill: rtech-emerald)[31મી જાન્યુઆરી]
      - *Q4 (Jan-Mar):* #text(weight: "bold", fill: rtech-emerald)[31મી મે] (વાર્ષિક આખરી મિલાન)
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 07: TOP 35 KEYBOARD SHORTCUTS & AUDIT (GUJARATI)
// =============================================================================

#module-banner(num: "MODULE 12", title: "ટોપ 35 Tally Prime કીબોર્ડ શોર્ટકટ્સ (ક્રમાંક 1 થી 35 સંપૂર્ણ યાદી)", color: rtech-emerald)

#text(size: 7.2pt, fill: rtech-muted)[
  માઉસનો ઉપયોગ બંધ કરો! પ્રોફેશનલ એકાઉન્ટન્ટ કીબોર્ડ શોર્ટકટ્સથી 5 ગણી ઝડપે કામ કરે છે:
]
#v(2pt)

#table(
  columns: (0.4fr, 1.2fr, 2.4fr, 0.4fr, 1.2fr, 2.4fr),
  stroke: 0.4pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { (center, center, left, center, center, left).at(col) + horizon },
  inset: 2.7pt,

  text(size: 6.8pt, weight: "bold", fill: white)[ક્ર.],
  text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.8pt, weight: "bold", fill: white)[કાર્ય (Action Description)],
  text(size: 6.8pt, weight: "bold", fill: white)[ક્ર.],
  text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.8pt, weight: "bold", fill: white)[કાર્ય (Action Description)],

  [1], [#keypill("Alt + G", col: rtech-blue)], [#hl-y[GoTo માસ્ટર સર્ચ] (કોઈપણ રિપોર્ટ)],
  [19], [#keypill("Alt + E")], [Excel, PDF, XML માં એક્સપોર્ટ],

  [2], [#keypill("Ctrl + A", col: rtech-emerald)], [#hl-b[1-ક્લિક ઓટો સેવ] (Enter દબાવ્યા વિના)],
  [20], [#keypill("Alt + M")], [Tally માંથી સીધો પાર્ટીને ઇમેઇલ],

  [3], [#keypill("Alt + C", col: rtech-emerald)], [#hl-g[ત્વરિત સર્જન] (લેજર/સ્ટોક આઇટમ)],
  [21], [#keypill("Alt + Z")], [ઝૂમ ઇન / ઝૂમ આઉટ ટૉગલ],

  [4], [#keypill("Ctrl + Enter", col: rtech-emerald)], [#hl-y[માસ્ટર ઓલ્ટર] (રિપોર્ટમાંથી સુધારો)],
  [22], [#keypill("Esc")], [પાછલી સ્ક્રીન પર પાછા આવવું],

  [5], [#keypill("Alt + D", col: rtech-amber)], [વાઉચર કે લેજર ડિલીટ કરવું],
  [23], [#keypill("Ctrl+Alt+C")], [ટેલીમાં લખાણ કોપી કરવું],

  [6], [#keypill("Alt + F1", col: rtech-amber)], [વિગતવાર વ્યૂ (Detailed Tree View)],
  [24], [#keypill("Ctrl+Alt+V")], [ટેલીમાં લખાણ પેસ્ટ કરવું],

  [7], [#keypill("Alt + F5", col: rtech-amber)], [કન્ડેન્સ્ડ / ડિટેઈલ્ડ ટૉગલ વ્યૂ],
  [25], [#keypill("Alt + I")], [રિપોર્ટમાં નવો કોલમ ઉમેરવો],

  [8], [#keypill("F2", col: rgb("#0F172A"))], [વાઉચર કે રિપોર્ટની તારીખ બદલવી],
  [26], [#keypill("Alt + A")], [રજિસ્ટરમાં નવું વાઉચર ઉમેરવું],

  [9], [#keypill("Alt + F2", col: rgb("#0F172A"))], [નાણાકીય ગાળો (01-04 થી 31-03)],
  [27], [#keypill("Alt + 2")], [ડુપ્લિકેટ વાઉચર બનાવવું],

  [10], [#keypill("F12", col: rtech-blue)], [સ્ક્રીન કોન્ફિગરેશન સેટિંગ્સ],
  [28], [#keypill("Alt + X")], [વાઉચર રદ/કેન્સલ કરવું (નંબર જળવાય)],

  [11], [#keypill("Ctrl + H", col: rtech-blue)], [વાઉચર મોડ બદલવો (Item, Acc, Vou)],
  [29], [#keypill("F11")], [કંપની ફીચર્સ (GST, TDS)],

  [12], [#keypill("Ctrl + N", col: rgb("#0F172A"))], [ઇન-બિલ્ટ કેલ્ક્યુલેટર ચાલુ/બંધ],
  [30], [#keypill("F1")], [કંપની પસંદ કરવી / બદલવી],

  [13], [#keypill("Alt + R", col: rgb("#0F172A"))], [રિપોર્ટમાંથી લાઇન છુપાવવી (Hide)],
  [31], [#keypill("Alt + F1")], [ચાલુ કંપની બંધ કરવી (Shut)],

  [14], [#keypill("Alt + U", col: rgb("#0F172A"))], [છુપાવેલી લાઇન પુનઃ બતાવવી (Unhide)],
  [32], [#keypill("Ctrl + F1")], [પેરોલ / હાજરી રજિસ્ટર ખોલવું],

  [15], [#keypill("Spacebar", col: rgb("#0F172A"))], [એક લાઇન સિલેક્ટ / ડી-સિલેક્ટ],
  [33], [#keypill("Alt + F12")], [રિપોર્ટમાં કસ્ટમ રેન્જ ફિલ્ટર],

  [16], [#keypill("Ctrl+Space", col: rgb("#0F172A"))], [બધી લાઇન્સ એકસાથે પસંદ કરવી],
  [34], [#keypill("Ctrl + Q")], [ટેલી પ્રાઇમમાંથી બહાર નીકળવું],

  [17], [#keypill("Alt + P", col: rtech-blue)], [ચાલુ ઇનવોઇસ/રિપોર્ટ પ્રિન્ટ],
  [35], [#keypill("PgUp / PgDn")], [પાછલું / આગળનું વાઉચર જોવું],

  [18], [#keypill("Ctrl + P", col: rtech-blue)], [ખુલ્લી સ્ક્રીનની ત્વરિત પ્રિન્ટ],
  [], [], []
)

#v(3pt)

#module-banner(num: "MODULE 13", title: "વાર્ષિક ફાઇનલ એકાઉન્ટ્સ 5-તબક્કા ઓડિટ પ્રોટોકોલ (Year-End Audit Protocol)", color: rtech-navy)

#block(fill: rgb("#F8FAFC"), stroke: 0.5pt + rtech-border, inset: 6pt, radius: 4pt)[
  - *1. બેંક સમાધાન (BRS Check):* 31મી માર્ચે બેંક પાસબુક અને ટેલી બેંક લેજર સિલક શૂન્ય તફાવત સાથે મળવી જોઈએ (#keypill("F5 -> Reconcile")).
  - *2. #hl-y[ઘસારા હવાલા નોંધ (Depreciation Entry F7)]:* કંપની અને આવકવેરા નિયમો અનુસાર તમામ મશીનરી, કમ્પ્યુટર પર ઘસારો ગણો.
  - *3. આખર સ્ટોક ચકાસણી (Closing Stock):* 'મૂળ કિંમત કે બજાર કિંમત, બેમાંથી જે ઓછી હોય' તેના આધારે સ્ટોક મૂલ્યાંકન.
  - *4. #hl-g[GST ITC મિલાન]:* GSTR-2B પોર્ટલ ડેટા સાથે ટેલી પુસ્તકોના CGST, SGST, IGST ઇનપુટ ટેક્સ ક્રેડિટનું પાઇ-પાઇ મિલાન કરો.
  - *5. #hl-y[અંતિમ P&L અને પાકું સરવૈયું ચકાસણી]:* કોઈ પણ ખાતું 'Suspense Account' કે 'Difference in Opening Balances' માં બાકી ન હોવું જોઈએ.
]

#pagebreak()

// =============================================================================
// PAGE 08: RAHUL SIR'S MENTORSHIP MESSAGE (GUJARATI)
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
          #text(size: 8.2pt, weight: "bold", fill: rtech-blue)[રાહુલ સરનો અંગત સંદેશ · RTechLab મેન્ટરશિપ અને કોમ્યુનિટી હબ]
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
        #text(size: 8pt, weight: "black", fill: rtech-navy)[રાહુલ પટેલ (Rahul Patel)]\
        #v(1.5pt)
        #box(
          fill: rgb("#EFF6FF"),
          stroke: 0.8pt + rgb("#BFDBFE"),
          radius: 2.5pt,
          inset: (x: 4pt, y: 1.5pt),
          text(size: 6.2pt, weight: "black", fill: rgb("#1D4ED8"))[🏅 Tally Certified Trainer (TCT)]
        )\
        #v(1.5pt)
        #text(size: 6.5pt, fill: rtech-muted)[ચીફ ટેકનોલોજી આર્કિટેક્ટ]\
        #text(size: 6.2pt, fill: rtech-muted)[ફાઉન્ડર, RTechLab Publications]
      ]
    ]
  ],
  [
    #text(size: 11pt, weight: "black", fill: rtech-navy)[પ્રિય વિદ્યાર્થી અને ભાવી એકાઉન્ટ્સ લીડર,]\
    #v(3pt)
    #text(size: 7.8pt, fill: rgb("#334155"))[
      એકાઉન્ટિંગ માત્ર ઉધાર-જમાની એન્ટ્રી કરવી નથી; તે કોઈપણ વેપારની કરોડરજ્જુ છે. એક શ્રેષ્ઠ એકાઉન્ટન્ટ તે છે જે વેપારના એક-એક રૂપિયાનો સચોટ હિસાબ રાખે અને GST તથા TDS ના નિયમોનું 100% પાલન સુનિશ્ચિત કરે.

      આ *અલ્ટીમેટ ક્વિક ડેસ્ક રેફરન્સ (Quick Desk Reference)* તૈયાર કરવાનો અમારો એકમાત્ર ઉદ્દેશ્ય એ હતો કે જ્યારે તમે ઓફિસની ખુરશી પર બેઠા હોવ કે ઇન્ટરવ્યુની તૈયારી કરી રહ્યા હોવ, ત્યારે તમારે 50 જગ્યાએ ગૂગલ કરવામાં કે વિડિયો શોધવામાં સમય બગાડવો ન પડે. આ 8 પેજ તમારી ટેબલ પર હોવાનો મતલબ છે કે તમારી પાસે એક સિનિયર એકાઉન્ટન્ટનું મગજ હંમેશા હાજર છે.

      સતત અભ્યાસ કરતા રહો, નવું શીખતા રહો અને તમારા હિસાબી ચોપડાઓ હંમેશા સ્વચ્છ અને ઓડિટેડ રાખો!
    ]

    #v(3.5pt)
    #block(
      width: 100%,
      fill: rgb("#F8FAFC"),
      stroke: (left: 3pt + rtech-blue, rest: 0.5pt + rgb("#CBD5E1")),
      radius: (right: 4pt),
      inset: (x: 7pt, y: 4.5pt),
      [
        #text(size: 7.2pt, weight: "black", fill: rtech-navy)[🏆 ઓથર પ્રોફાઇલ અને શિક્ષણ વિશેષજ્ઞતા (Author Credentials):]\
        #v(2pt)
        #grid(
          columns: (1fr, 1.15fr),
          gutter: 6pt,
          [
            - *Owner & Director:* IANT પાલનપુર
            - *10+ વર્ષનો અનુભવ:* IT અને વોકેશનલ ટ્રેનિંગ
          ],
          [
            - *3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત:* ગુજરાતભરમાં
            - *માસ્ટર ફેકલ્ટી:* Tally Essential (L1, L2, L3) અને Professional
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
                  text(size: 6pt, weight: "black", fill: rtech-blue)[પોર્ટફોલિયો સાઇટ]
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
        #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[ઓફિશિયલ WhatsApp સ્ટુડન્ટ હેલ્પલાઇન અને કોમ્યુનિટી સપોર્ટ]\
        #v(1pt)
        #text(size: 7.2pt, fill: rtech-navy)[
          એકાઉન્ટિંગ એન્ટ્રી, GST સેટિંગ્સ કે કારકિર્દી અંગે કોઈ પણ શંકા હોય તો સંપર્ક કરો:
          *WhatsApp હેલ્પલાઇન:* #text(weight: "black", fill: rtech-emerald)[+91 76468 92094] (ચેટ-ઓન્લી પોલિસી · ત્વરિત સમાધાન) · *ઓફિશિયલ WhatsApp ચેનલ:* #link("https://chat.whatsapp.com/G5g27K35i8b0U5L009G96t")[*અહીં ક્લિક કરીને RTechLab ચેનલ જોઈન કરો →*]
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
        #text(size: 8.5pt, weight: "bold", fill: rtech-blue)[RTechLab ના 100% ફ્રી ઇન્ટરેક્ટિવ ટૂલ્સ પર અભ્યાસ કરો]\
        #v(1pt)
        #text(size: 7.2pt, fill: rtech-navy)[
          રોજિંદા ટેકનિકલ નોલેજ વધારવા માટે બ્રાઉઝર ટૂલ્સનો ઉપયોગ કરો: *ડેઇલી 10-સેકન્ડ ટેકનિકલ ક્વિઝ* (રોજ 1 નવો પ્રશ્ન અને તાત્કાલિક પરિણામ) · *ફ્રી એન્જિનિયરિંગ ટૂલ્સ હબ:* Subnet Calculator, DNS Lookup, IP Info, Binary Converter · *ડાયરેક્ટ લિંક:* #link("https://rtechlab.vercel.app/tools")[*rtechlab.vercel.app/tools*]
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
        #text(size: 8.8pt, weight: "black", fill: rgb("#B45309"))[શું આપ 50 વાસ્તવિક ઇનવોઇસ અને ઇન્ટરવ્યુમાં નિપુણતા મેળવવા માંગો છો?]\
        #v(1pt)
        #text(size: 7.2pt, fill: rtech-navy)[
          જો આપ વાસ્તવિક બિલિંગ (APMC કૃષિ પેદાશ, ઇલેક્ટ્રોનિક્સ, બેંક BRS) અને ટોપ 50 MNC કોર્પોરેટ ઇન્ટરવ્યુ પ્રશ્નો શીખવા માંગતા હોવ, તો અમારા *51-પેજના સંપૂર્ણ Tally Prime Master Guide* માં અપગ્રેડ કરો!
        ]
      ],
      [
        #link("https://rtechlab.vercel.app/notes")[
          #box(
            fill: rgb("#047857"),
            radius: 4pt,
            inset: (x: 10pt, y: 6pt),
            [
              #text(size: 8pt, weight: "black", fill: white)[માત્ર ₹27 માં અપગ્રેડ કરો →]\
              #v(1pt)
              #text(size: 6.5pt, fill: rgb("#A7F3D0"))[(₹49 માસ્ટર ગાઇડ)]
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
