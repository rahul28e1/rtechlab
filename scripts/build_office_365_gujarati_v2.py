import os
import shutil
import subprocess
import fitz  # PyMuPDF

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SOURCE_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\07_SOURCE_FILES")
ASSETS_DIR = os.path.join(SOURCE_DIR, "02_BRAND_ASSETS")
OUTPUT_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION")
PREVIEWS_DIR = os.path.join(OUTPUT_DIR, "previews_gu")
os.makedirs(SOURCE_DIR, exist_ok=True)
os.makedirs(ASSETS_DIR, exist_ok=True)
os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(PREVIEWS_DIR, exist_ok=True)

typ_path = os.path.join(SOURCE_DIR, "office_365_cheat_sheet_22rs_gu.typ")
pdf_path = os.path.join(OUTPUT_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf")
public_pdf = os.path.join(BASE_DIR, r"public\downloads\Office-365-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf")

typst_content = r'''// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE PRODUCTIVITY DESK CHEAT SHEET (GUJARATI)
// Exactly 8 Pages · Printable Daily Desk Companion · Edition 1
// Author: Rahul Patel (Founder & Lead Systems Architect, RTechLab)
// Official Portal: https://rtechlab.com
// =============================================================================

#set document(
  title: "Microsoft 365 Enterprise Desk Reference & Cheat Sheet (Gujarati)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 11mm, bottom: 9mm, left: 9.5mm, right: 9.5mm),
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 11pt, baseline: 1pt)[#image("02_BRAND_ASSETS/favicon-32x32.png", height: 11pt)]
          #h(4pt)
          #text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 8pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 વ્યવસાયિક ડેઇલી ડેસ્ક રેફરન્સ અને ચીટ શીટ]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#107C41"))[વર્ડ · એક્સેલ · પાવરપોઇન્ટ · આઉટલુક · ક્લાઉડ]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · રાહુલ પટેલ]
        ]
      )
      #v(1.5pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.4pt + rgb("#E2E8F0"))
      #v(2.5pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.8pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] ટેકનોલોજી વ્યવહારિક સ્વરૂપમાં · પ્રિન્ટ કરી ડેસ્ક પર રાખો · નિઃશુલ્ક ટૂલ્સ: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 6pt, y: 1.5pt),
            text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[પૃષ્ઠ #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
  size: 7.4pt,
  fill: rgb("#1E293B"),
  spacing: 100%,
  lang: "gu"
)

#set par(
  justify: true,
  leading: 0.44em,
  first-line-indent: 0pt
)

// Brand Palette
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-word = rgb("#185ABD")
#let rtech-excel = rgb("#107C41")
#let rtech-ppt = rgb("#C43E1C")
#let rtech-outlook = rgb("#0078D4")
#let rtech-muted = rgb("#64748B")
#let rtech-border = rgb("#E2E8F0")

// Reusable UI Macros
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-o(body) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#body]]
#let kbd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#CBD5E1"), radius: 2pt, inset: (x: 3pt, y: 1pt))[#text(size: 6.8pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-blue) = {
  v(2.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3pt + color, rest: 0.4pt + rtech-border),
    radius: (right: 3pt),
    inset: (x: 6pt, y: 3.5pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 4.5pt, y: 1.5pt),
            text(size: 6.5pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 8.8pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(2pt)
}

// =============================================================================
// PAGE 01: THE EXECUTIVE MASTER COVER PAGE (GUJARATI)
// =============================================================================

#align(center)[
  #v(2pt)
  #text(size: 9pt, weight: "black", tracking: 2pt, fill: rtech-blue)[RTECHLAB વોકેશનલ લર્નિંગ સિસ્ટમ્સ]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[ટેકનોલોજી વ્યવહારિક સ્વરૂપમાં · ગુજરાત #1 વોકેશનલ આર્કિટેક્ચર ટ્રેક · એડિશન 1]
  #v(2pt)
  #line(length: 100%, stroke: 0.8pt + rgb("#E2E8F0"))
  #v(5pt)

  // Author & Institute Tagline
  #text(size: 11pt, weight: "black", fill: rtech-navy)[લેખક: રાહુલ પટેલ (Rahul Patel)]\
  #v(1pt)
  #text(size: 7.8pt, fill: rtech-muted)[
    ડિરેક્ટર અને સિનિયર ટેકનિકલ એક્સપર્ટ, IANT કોમ્પ્યુટર એજ્યુકેશન, પાલનપુર · 10+ વર્ષ IT ઉદ્યોગ અનુભવ · 3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત
  ]

  #v(6pt)
  #line(length: 22%, stroke: 1.5pt + rtech-blue)
  #v(6pt)

  // Microsoft 365 Official Suite Visual
  #image("02_BRAND_ASSETS/microsoft_365_official_suite_logo.png", width: 92%)

  #v(6pt)

  // Bestseller Bold Title
  #text(size: 22pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rtech-navy, tracking: 0.5pt)[
    માઇક્રોસોફ્ટ 365 એન્ટરપ્રાઇઝ
  ]
  #v(2pt)
  #text(size: 12pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rtech-blue, tracking: 0.5pt)[
    વ્યવસાયિક કોર્પોરેટ ડેઇલી ડેસ્ક રેફરન્સ અને અલ્ટીમેટ ચીટ શીટ
  ]
  #v(2.5pt)
  #text(size: 8pt, weight: "bold", fill: rtech-muted)[
    એડવાન્સ્ડ એક્સેલ 365 (ડાયનામિક એરે અને XLOOKUP) · વર્ડ કોર્પોરેટ સ્ટાઇલિંગ · એક્ઝિક્યુટિવ પાવરપોઇન્ટ · આઉટલુક ઇનબોક્સ ઝીરો · ક્લાઉડ ટીમવર્ક
  ]

  #v(5pt)

  // Bestseller Seal Pill
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#38BDF8"),
    radius: 16pt,
    inset: (x: 12pt, y: 2.5pt),
    text(size: 6.8pt, weight: "black", fill: rgb("#0369A1"), tracking: 0.5pt)[
      ★ કોર્પોરેટ એક્ઝિક્યુટિવ્સ, MIS એનાલિસ્ટ્સ અને કોમર્સ તથા IT વિદ્યાર્થીઓ માટે #1 દૈનિક ડેસ્ક ગાઇડ ★
    ]
  )

  #v(6pt)

  // Mindset & Compounding Growth Quotations Box (Atomic Habits & Think and Grow Rich Inspired)
  #block(
    width: 95%,
    stroke: 1.2pt + rgb("#38BDF8"),
    fill: rgb("#F0F9FF"),
    radius: 6pt,
    inset: (x: 10pt, y: 6pt),
    [
      #grid(
        columns: (1fr, 1fr),
        gutter: 10pt,
        [
          #text(size: 7.2pt, weight: "black", fill: rtech-blue)[⚡ દૈનિક ચક્રવૃદ્ધિ ઉત્પાદકતા નિયમ (Atomic Habits સિદ્ધાંત):]\
          #v(2pt)
          #text(size: 6.8pt, fill: rtech-navy, style: "italic")[
            "આધુનિક કોર્પોરેટ વિશ્વમાં સફળતા એ દૈનિક સૂક્ષ્મ-આદતોનું પરિણામ છે. તમારા ફોર્મ્યુલા અને કીબોર્ડ શોર્ટકટ્સને દરરોજ માત્ર 1% બહેતર બનાવવું એક વર્ષમાં 37 ગણી વધુ ઉત્પાદકતા પ્રદાન કરે છે."
          ]
        ],
        [
          #text(size: 7.2pt, weight: "black", fill: rgb("#047857"))[🎯 વ્યવહારિક જ્ઞાન જ સાચી શક્તિ છે (Think & Grow Rich):]\
          #v(2pt)
          #text(size: 6.8pt, fill: rtech-navy, style: "italic")[
            "માનવ મગજ જે બાબતની કલ્પના કરી શકે છે અને તેના પર વિશ્વાસ કરી શકે છે, તે હાંસલ કરી શકે છે. જ્ઞાન માત્ર સંભવિત શક્તિ છે; તે વાસ્તવિક શક્તિ ત્યારે બને છે જ્યારે તેને ચોક્કસ ફોર્મ્યુલા અને દૈનિક કાર્ય અમલીકરણમાં પરિવર્તિત કરવામાં આવે."
          ]
        ]
      )
    ]
  )

  #v(6pt)

  // 4-Pillar Key Stats Badges
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 6pt,
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[100+]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-excel)[હોટકીઝ અને શોર્ટકટ્સ]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[35+]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-blue)[ડાયનામિક ફોર્મ્યુલા]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[5 APPS]\
          #text(size: 6.5pt, weight: "bold", fill: rtech-word)[એન્ટરપ્રાઇઝ સ્યુટ]
        ]
      )
    ],
    [
      #block(
        stroke: 0.8pt + rgb("#CBD5E1"),
        fill: rgb("#F8FAFC"),
        radius: 4pt,
        inset: 4pt,
        [
          #text(size: 11pt, weight: "black", fill: rtech-navy)[100%]\
          #text(size: 6.5pt, weight: "bold", fill: rgb("#047857"))[MNC પ્લેસમેન્ટ રેડી]
        ]
      )
    ]
  )

  #v(6pt)

  // Quick Multi-Page Index Directory Bar
  #block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: (x: 6pt, y: 4pt),
    [
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center,
        [#text(size: 6.5pt, weight: "bold", fill: rtech-excel)[P2: ડાયનામિક ફોર્મ્યુલા]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-excel)[P3: ડેટા ક્લિનિંગ]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-blue)[P4: શોર્ટકટ્સ અને PQ]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-word)[P5: વર્ડ સ્ટાઇલિંગ]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-ppt)[P6: PPT માસ્ટર]],
        [#text(size: 6.5pt, weight: "bold", fill: rtech-outlook)[P7: આઉટલુક અને ક્લાઉડ]],
        [#text(size: 6.5pt, weight: "bold", fill: rgb("#047857"))[P8: ઇન્ટરવ્યુ અને લેખક]],
      )
    ]
  )
]

#pagebreak()

// =============================================================================
// PAGE 02: MODERN EXCEL 365 CORE FORMULA ENGINE & DYNAMIC ARRAYS (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[એક્સેલ 365: નેક્સ્ટ જનરેશન ડાયનામિક એરે અને લુકઅપ ફોર્મ્યુલા]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[મોડર્ન કેલ્ક્યુલેશન એન્જિન · સ્પિલ રેન્જ (`#`) · ટુ-વે મેટ્રિક્સ લુકઅપ · `LET` દ્વારા 5x ઝડપી ગણતરી]
]

#section-banner(num: "ફોર્મ્યુલા માળખું", title: "આધુનિક ડાયનામિક એરે વિરુદ્ધ જૂનું એરે મોડેલ (CSE)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.7fr, 2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ફીચર / કોન્સેપ્ટ],
  text(size: 7pt, weight: "bold", fill: white)[Excel 365 માં કાર્યપદ્ધતિ],
  text(size: 7pt, weight: "bold", fill: white)[જૂના Excel થી મુખ્ય તફાવત],

  [#text(weight: "bold", fill: rtech-excel)[Dynamic Array Spill]],
  [ફક્ત 1 સેલમાં ફોર્મ્યુલા લખવાથી સમગ્ર ટેબલ પરિણામ આપમેળે વિવિધ રો અને કોલમમાં વિસ્તરી (Spill) જાય છે. ચારે તરફ વાદળી બોર્ડર દેખાય છે.],
  [પહેલાં સમગ્ર રેન્જ પસંદ કરીને #kbd[Ctrl+Shift+Enter] (CSE) દબાવવું પડતું હતું.],

  [#text(weight: "bold", fill: rtech-blue)[Spilled Range Ref (`#`)]],
  [`=A2#` લખવાથી સમગ્ર પરિણામી સ્પિલ ટેબલનો આપમેળે સંદર્ભ મળી જાય છે. ડેટા વધતાં downstream ફોર્મ્યુલા તુરંત અપડેટ થાય છે.],
  [મેન્યુઅલ રીતે રેન્જને વારંવાર ડ્રેગ કરવી પડતી હતી.],

  [#text(weight: "bold", fill: rtech-word)[#text(fill: rtech-excel)[#kbd[#`#SPILL!`]] Error]],
  [જ્યારે ફોર્મ્યુલાના વિસ્તરણ માર્ગમાં અન્ય કોઈ ટેક્સ્ટ, નંબર કે સ્પેસ હોય ત્યારે આ એરર આવે છે. સામેવાળા સેલ ખાલી કરતાં જ ઠીક થઈ જાય છે.],
  [જૂનામાં ફક્ત અધૂરું પરિણામ આવતું અથવા `#VALUE!` એરર આવતી.],
)

#section-banner(num: "લુકઅપ માસ્ટરી", title: "XLOOKUP માસ્ટરી (VLOOKUP અને INDEX-MATCH નો સંપૂર્ણ વિકલ્પ)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.2fr, 2.5fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ફંક્શન અને સિન્ટેક્સ],
  text(size: 7pt, weight: "bold", fill: white)[કોર્પોરેટ દ્રશ્ય (Scenario)],
  text(size: 7pt, weight: "bold", fill: white)[પ્રો-ટીપ / ટેકનિકલ લાભ],

  [#text(weight: "bold", fill: rtech-excel)[`=XLOOKUP(...)`]\
  #text(size: 6.2pt)[(lookup, lkp_arr, ret_arr, [not_found], [match], [search])]],
  [કોલમ નંબર ગણ્યા વિના એમ્પ્લોયી ID પરથી પગાર શોધવો:\
  #hl-g[`=XLOOKUP(F2, A2:A500, D2:D500, "Not Found")`]],
  [#hl-y[બાય-ડિફોલ્ટ ચોક્કસ મેળ (Exact Match)]। ડાબી બાજુ પણ શોધી શકે છે; નવી કોલમ ઉમેરવાથી ફોર્મ્યુલા ક્યારેય તૂટતો નથી.],

  [#text(weight: "bold", fill: rtech-excel)[Multi-Column XLOOKUP]],
  [એક જ ફોર્મ્યુલાથી નામ, ડિપાર્ટમેન્ટ અને CTC ત્રણેય એકસાથે મેળવવા:\
  #hl-g[`=XLOOKUP(F2, A2:A500, B2:D500)`]],
  [3 અલગ VLOOKUP ને બદલે ફક્ત 1 ફોર્મ્યુલા ત્રણેય કોલમમાં પરિણામ આપમેળે સ્પિલ કરી દે છે!],

  [#text(weight: "bold", fill: rtech-blue)[Two-Way Matrix Lookup\ (2D ગ્રીડ સર્ચ)]],
  [રોમાં પ્રોડક્ટ અને કોલમમાં રીજન આધારે મૂલ્ય શોધવું:\
  #hl-b[`=XLOOKUP(A10, A2:A6, XLOOKUP(B9, B1:F1, B2:F6))`]],
  [નેસ્ટેડ XLOOKUP રો અને કોલમ બંને હેડર પ્રોસેસ કરે છે. જૂના `=INDEX(..., MATCH(), MATCH())` ને સંપૂર્ણ રિપ્લેસ કરે છે.],

  [#text(weight: "bold", fill: rtech-muted)[રિવર્સ સર્ચ\ (`search_mode = -1`)]],
  [ગ્રાહકનું સૌથી છેલ્લું (લેટેસ્ટ) ઇનવોઇસ બિલ શોધવું:\
  #hl-g[`=XLOOKUP(G2, Cust_Col, Date_Col, , 0, -1)`]],
  [ડેટા સોર્ટ કર્યા વગર નીચેથી ઉપરની તરફ શોધે છે, જેથી સૌથી તાજો વ્યવહાર તરત મળી જાય છે.],
)

#section-banner(num: "ડાયનામિક ટૂલ્સ", title: "FILTER, UNIQUE, SORT અને ઉચ્ચ-ગતિ LET ફંક્શન", color: rtech-excel)

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ફંક્શન],
  text(size: 7pt, weight: "bold", fill: white)[કોર્પોરેટ ફોર્મ્યુલા ઉદાહરણ],
  text(size: 7pt, weight: "bold", fill: white)[પરિણામ અને શ્રેષ્ઠ ઉપયોગ],

  [#text(weight: "bold", fill: rtech-excel)[`FILTER`]\ #text(size: 6.2pt)[મલ્ટી-કન્ડિશન એક્સટ્રેક્ટ]],
  [#hl-g[`=FILTER(A2:D100, (B2:B100="IT")*(D2:D100>=50000), "No Records")`]],
  [AND લોજિક માટે `*` અને OR માટે `+` વાપરો. પિવટ ટેબલ વિના જીવંત ફિલ્ટર ટેબલ બને છે.],

  [#text(weight: "bold", fill: rtech-blue)[`UNIQUE`]\ #text(size: 6.2pt)[ડુપ્લિકેટ્સ દૂર કરવા]],
  [#hl-b[`=SORT(UNIQUE(FILTER(C2:C100, C2:C100<>"")))`]],
  [ગ્રાહકોના શહેરોમાંથી ડુપ્લિકેટ્સ હટાવી અનોખી યાદીને A થી Z ક્રમમાં 1 સેકન્ડમાં સોર્ટ કરે છે.],

  [#text(weight: "bold", fill: rtech-ppt)[`SORTBY`]\ #text(size: 6.2pt)[મલ્ટી-કોલમ સોર્ટ]],
  [#hl-o[`=SORTBY(A2:C50, B2:B50, 1, C2:C50, -1)`]],
  [કર્મચારીઓને પ્રથમ વિભાગ પ્રમાણે (A-Z) અને ત્યારબાદ પગાર પ્રમાણે (ઉતરતા ક્રમમાં) ગોઠવે છે.],

  [#text(weight: "bold", fill: rtech-excel)[`LET`]\ #text(size: 6.2pt)[વેરિયેબલ ડિક્લેરેશન]],
  [#hl-g[`=LET(rev, D2:D100, cogs, E2:E100, margin, (rev-cogs)/rev, IF(margin>0.2, "High", "Low"))`]],
  [#hl-y[ગણતરીની ઝડપ 500% વધારે છે]। જટિલ ગણતરીઓને વેરિયેબલ બનાવી માત્ર એક જ વાર પ્રોસેસ કરે છે.],

  [#text(weight: "bold", fill: rtech-word)[`SEQUENCE`]\ #text(size: 6.2pt)[ઓટો સીરીયલ નંબર]],
  [#hl-b[`=SEQUENCE(COUNTA(A2:A100), 1, 1001, 1)`]],
  [ઓટોમેટિક બિલ નંબર (1001, 1002...) બનાવે છે જે નવો ડેટા ઉમેરાતાં આપમેળે વધતો રહે છે.],
)

#pagebreak()

// =============================================================================
// PAGE 03: EXCEL DATA CLEANING, TEXT FUNCTIONS & CONDITIONAL LOGIC (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[એક્સેલ 365: કોર્પોરેટ ડેટા હાઇજીન, ટેક્સ્ટ વિભાજન અને લોજિક્સ]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[ફ્લેશ ફિલ વગર ટેક્સ્ટ અલગ કરવો · મલ્ટી-કન્ડિશન એગ્રીગેશન · કસ્ટમ સેલ ફોર્મેટિંગ]
]

#section-banner(num: "ટેક્સ્ટ વિભાજન", title: "આધુનિક ટેક્સ્ટ ફંક્શન્સ (TEXTSPLIT, TEXTBEFORE, TEXTAFTER)", color: rtech-excel)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ફંક્શન],
  text(size: 7pt, weight: "bold", fill: white)[ફોર્મ્યુલા ઉદાહરણ],
  text(size: 7pt, weight: "bold", fill: white)[વ્યવહારિક ઉપયોગ],

  [#text(weight: "bold", fill: rtech-excel)[`TEXTBEFORE`]],
  [#hl-g[`=TEXTBEFORE(A2, "@")`]],
  [ઇમેઇલ ID માંથી યુઝરનેમ અલગ કરવું (`rahul.patel@rtechlab.com` $->$ `rahul.patel`)।],

  [#text(weight: "bold", fill: rtech-excel)[`TEXTAFTER`]],
  [#hl-g[`=TEXTAFTER(A2, "@")`]],
  [કંપની ડોમેન અલગ કાઢવું (`rtechlab.com`) કોઈપણ અઘરા ફોર્મ્યુલા વગર।],

  [#text(weight: "bold", fill: rtech-blue)[`TEXTSPLIT`]],
  [#hl-b[`=TEXTSPLIT(A2, ",", ";")`]],
  [અલ્પવિરામ કે અર્ધવિરામથી જોડાયેલા શબ્દોને એકસાથે અનેક રો અને કોલમમાં વિભાજિત કરે છે. ],

  [#text(weight: "bold", fill: rtech-word)[`TEXTJOIN`]],
  [#hl-b[`=TEXTJOIN(", ", TRUE, FILTER(A2:A50, B2:B50="Pending"))`]],
  [પેન્ડિંગ બિલો કે ઓર્ડર્સની યાદીને એક જ સેલમાં અલ્પવિરામ સાથે જોડી સમરી રિપોર્ટ બનાવે છે.],
)

#section-banner(num: "મલ્ટી-કન્ડિશન એગ્રીગેશન", title: "SUMIFS, COUNTIFS, AVERAGEIFS અને આધુનિક લોજિકલ રૂટિંગ", color: rtech-excel)

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ફંક્શન],
  text(size: 7pt, weight: "bold", fill: white)[સિન્ટેક્સ અને ફોર્મ્યુલા],
  text(size: 7pt, weight: "bold", fill: white)[કોર્પોરેટ બેસ્ટ પ્રેક્ટિસ],

  [#text(weight: "bold", fill: rtech-excel)[`SUMIFS`]],
  [#hl-g[`=SUMIFS(Sales, Region, "West", Date, ">=2027-01-01")`]],
  [Sum_Range હંમેશા #hl-y[સૌ પ્રથમ] આવે છે. લોજિકલ ઓપરેટર્સ હંમેશા અવતરણ ચિહ્નો (`">=2027-01-01"`) માં રાખો.],

  [#text(weight: "bold", fill: rtech-excel)[`COUNTIFS`]],
  [#hl-g[`=COUNTIFS(Status, "Delivered", Amount, ">10000")`]],
  [સફળ અને મોટા ઓર્ડરોની કુલ સંખ્યા ગણવી. ખાલી સેલ ન ગણવા માટે `"*"` નો ઉપયોગ કરો.],

  [#text(weight: "bold", fill: rtech-blue)[`IFS`]],
  [#hl-b[`=IFS(A2>=90, "Distinction", A2>=75, "First", TRUE, "Pass")`]],
  [ગૂંચવણભર્યા નેસ્ટેડ `IF` વગર ક્રમિક શરતો તપાસવી. અંતે ડિફોલ્ટ મૂલ્ય માટે હંમેશા `TRUE` વાપરો.],

  [#text(weight: "bold", fill: rtech-word)[`SWITCH`]],
  [#hl-b[`=SWITCH(B2, 1, "Q1-North", 2, "Q2-South", 3, "Q3-East", "Other")`]],
  [ચોક્કસ વેલ્યુ સામે નિર્ધારિત કોડ કે નામ સેટ કરવું. નેસ્ટેડ `IF` કરતાં ઘણું સ્વચ્છ અને વાંચવા યોગ્ય.],
)

#section-banner(num: "નંબર ફોર્મેટિંગ અને તારીખ", title: "કોર્પોરેટ કસ્ટમ ફોર્મેટિંગ કોડ્સ અને તારીખ એન્જિન", color: rtech-excel)

#table(
  columns: (1.6fr, 2.4fr, 2fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[કસ્ટમ ફોર્મેટ કોડ],
  text(size: 7pt, weight: "bold", fill: white)[સ્ક્રીન પર કેવું દેખાશે?],
  text(size: 7pt, weight: "bold", fill: white)[વ્યવસાયિક ઉપયોગિતા],

  [#text(font: ("Consolas", "Segoe UI"))[`#,##0;[Red]-#,##0;"-";@`]],
  [ધન: `1,250` · ઋણ: #text(fill: red)[`-450`] · શૂન્ય: `-` · ટેક્સ્ટ: `@`],
  [#hl-y[કોર્પોરેટ MIS ગોલ્ડ સ્ટાન્ડર્ડ]। શૂન્યને સ્વચ્છ ડેશ બતાવે છે અને નુકસાનને લાલ રંગમાં દર્શાવે છે.],

  [#text(font: ("Consolas", "Segoe UI"))[`₹#,##0.00;[Red]-₹#,##0.00;"Free"`]],
  [ભારતીય રૂપિયા પ્રતીક અને 2 દશાંશ સ્થળો સાથે.],
  [ઇનવોઇસ બિલિંગ, બેંક સ્ટેટમેન્ટ અને નાણાકીય ખાતાવહી.],

  [#text(font: ("Consolas", "Segoe UI"))[`00000` અથવા `+91-00000-00000`]],
  [પિનકોડ કે એમ્પ્લોયી ID માં આગળનો શૂન્ય (0) સાચવી રાખે છે.],
  [પિન `003841` ને `3841` થતાં અટકાવે છે.],

  [#text(weight: "bold", fill: rtech-excel)[`=EOMONTH(A2, 0)`]],
  [આપેલી તારીખના મહિનાનો છેલ્લો દિવસ (Last Day) આપે છે.],
  [GST રિટર્ન ફાઇલિંગ અને પેરોલ કટઓફ તારીખો માટે અનિવાર્ય.],

  [#text(weight: "bold", fill: rtech-blue)[`=EDATE(A2, 3)`]],
  [આપેલી તારીખથી બરાબર 3 મહિના પછીની ચોક્કસ તારીખ શોધે છે.],
  [ત્રિમાસિક લાયસન્સ રિન્યુઅલ, વીમા અને વોરંટી સમાપ્તિ.],
)

#pagebreak()

// =============================================================================
// PAGE 04: EXCEL SHORTCUTS & POWER QUERY (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[એક્સેલ 365: કાર્યસ્થળ શોર્ટકટ્સ અને પાવર ક્વેરી (ETL) પાઇપલાઇન]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[ટોચની 30 હાઇ-સ્પીડ હોટકીઝ · સ્વચાલિત 6-તબક્કાની ડેટા રીશેપિંગ પાઇપલાઇન · શૂન્ય-VBA ઓટોમેશન]
]

#section-banner(num: "ટોચના શોર્ટકટ્સ", title: "એકાઉન્ટન્ટ્સ અને MIS માટે ટોચના 30 હાઇ-સ્પીડ કીબોર્ડ શોર્ટકટ્સ", color: rtech-excel)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.35pt + rtech-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 3.2pt,

      text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
      text(size: 6.8pt, weight: "bold", fill: white)[શું કાર્ય કરે છે?],

      [#kbd[Ctrl + T]], [પસંદ કરેલા ડેટાને સત્તાવાર ટેબલમાં ફેરવવો],
      [#kbd[Ctrl + Alt + V] $->$ #kbd[V]], [માત્ર વેલ્યુઝ (Values) પેસ્ટ કરવી (ફોર્મ્યુલા હટાવીને)],
      [#kbd[Alt + =]], [તરત જ ઓટો-સમ (`SUM` ફોર્મ્યુલા) લગાવવો],
      [#kbd[F4]], [સેલ રેફરન્સ લોક કરવો (`\$A\$1` $->$ `A\$1` $->$ `\$A1` $->$ `A1`)],
      [#kbd[Ctrl + 1]], [ફોર્મેટ સેલ્સ ડાયલોગ બોક્સ ખોલવું],
      [#kbd[Alt + H + O + I]], [કોલમ પહોળાઈ ઓટો-ફિટ કરવી],
      [#kbd[Ctrl + એરો કીઝ]], [ડેટા ટેબલના અંતિમ છેડે ઝડપથી પહોંચવું],
      [#kbd[Ctrl + Shift + એરો]], [સમગ્ર ટેબલ ડેટા એકસાથે સિલેક્ટ કરવો],
      [#kbd[Ctrl + D] / #kbd[Ctrl + R]], [ઉપરનો ફોર્મ્યુલા નીચે / ડાબેથી જમણે ભરવો],
      [#kbd[Ctrl + E]], [ફ્લેશ ફિલ (Flash Fill) પેટર્ન લાગુ કરવી],
      [#kbd[Ctrl + ~]], [શીટના તમામ સેલ્સમાં ફોર્મ્યુલા દર્શાવવા/છુપાવવા],
      [#kbd[Ctrl + ;] / #kbd[Ctrl + Shift + :]], [આજની તારીખ / વર્તમાન સમય ઉમેરવો],
      [#kbd[Shift + Space]], [સમગ્ર રો (Row) પસંદ કરવી],
      [#kbd[Ctrl + Space]], [સમગ્ર કોલમ (Column) પસંદ કરવી],
      [#kbd[Ctrl + -] / #kbd[Ctrl + Shift + +]], [રો/કોલમ ડિલીટ કરવી / નવી ઉમેરવી],
    )
  ],
  [
    #table(
      columns: (1.2fr, 2fr),
      stroke: 0.35pt + rtech-border,
      fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
      align: (left + horizon, left + horizon),
      inset: 3.2pt,

      text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
      text(size: 6.8pt, weight: "bold", fill: white)[શું કાર્ય કરે છે?],

      [#kbd[Alt + A + C]], [લાગુ કરેલા તમામ ડેટા ફિલ્ટર્સ દૂર કરવા],
      [#kbd[Alt + H + V + E]], [ટ્રાન્સપોઝ પેસ્ટ (રો ને કોલમમાં ફેરવવી)],
      [#kbd[F2]], [સેલને સીધા એડિટ મોડમાં ખોલવો],
      [#kbd[Alt + Enter]], [સેલની અંદર નવી લાઇન શરૂ કરવી],
      [#kbd[Ctrl + F1]], [રિબન મેનૂ છુપાવવું કે દર્શાવવું],
      [#kbd[Ctrl + PageDown / Up]], [વર્કબુકની શીટ્સ વચ્ચે આગળ-પાછળ જવું],
      [#kbd[Ctrl + K]], [હાઇપરલિંક ઉમેરવી],
      [#kbd[Ctrl + Shift + L]], [ઓટો-ફિલ્ટર ડ્રોપડાઉન એરો ઓન/ઓફ કરવું],
      [#kbd[F12]], [Save As વિન્ડો સીધી ખોલવી],
      [#kbd[Ctrl + W] / #kbd[Ctrl + N]], [ફાઇલ બંધ કરવી / નવી વર્કબુક ખોલવી],
      [#kbd[Alt + N + V]], [ડેટામાંથી નવી પિવટ ટેબલ બનાવવી],
      [#kbd[Ctrl + 5]], [ટેક્સ્ટ પર સ્ટ્રાઇકથ્રૂ (ચેકો) લગાવવો],
      [#kbd[Shift + F2]], [સેલમાં નવી નોટ કે કમેન્ટ ઉમેરવી],
      [#kbd[Alt + H + M + C]], [સેલ્સને મર્જ અને સેન્ટર કરવા],
      [#kbd[Ctrl + Shift + \$]], [કરન્સી (નાણાકીય) ફોર્મેટ લાગુ કરવું],
    )
  ]
)

#section-banner(num: "પાવર ક્વેરી (ETL)", title: "સ્વચાલિત 6-તબક્કાની કોર્પોરેટ ડેટા રીશેપિંગ પાઇપલાઇન", color: rtech-blue)

#table(
  columns: (0.7fr, 1.4fr, 2.5fr, 1.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[તબક્કો],
  text(size: 7pt, weight: "bold", fill: white)[પાઇપલાઇન એક્શન],
  text(size: 7pt, weight: "bold", fill: white)[બેકગ્રાઉન્ડમાં શું થાય છે?],
  text(size: 7pt, weight: "bold", fill: white)[વ્યવસાયિક લાભ],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[01]]],
  [#text(weight: "bold", fill: rtech-blue)[ડેટા લિંક કરો (Extract)]],
  [CSV, એક્સેલ ફોલ્ડર, SQL ડેટાબેઝ કે SAP એક્સપોર્ટ સાથે #text(weight: "bold")[Data $->$ Get Data] દ્વારા જોડો.],
  [જુદી જુદી ફાઇલોને 1 સ્થળે જોડે છે.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[02]]],
  [#text(weight: "bold", fill: rtech-blue)[હેડર પ્રમોટ અને ફિલ્ટર]],
  [પ્રથમ રો ને હેડર બનાવો; ખાલી રો અને બિનજરૂરી સમરી રો ને 1 ક્લિકમાં ફિલ્ટર કરી દૂર કરો.],
  [મેન્યુઅલ ફાઇલ ક્લિનિંગ હંમેશ માટે બંધ.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[03]]],
  [#text(weight: "bold", fill: rtech-emerald)[#hl-y[Unpivot Columns]]],
  [ID કોલમ પસંદ કરી #text(weight: "bold")[Unpivot Other Columns] કરો. પહોળી મંથલી ટેબલને 2 કોલમ ડેટાબેઝમાં બદલે છે.],
  [#hl-g[પાવર ક્વેરીનું #1 કૌશલ્ય]। ઉત્કૃષ્ટ પિવટ ટેબલ બનાવવા સક્ષમ બનાવે છે.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[04]]],
  [#text(weight: "bold", fill: rtech-blue)[વિભાજિત અને ટ્રાન્સફોર્મ]],
  [ટેક્સ્ટ અલગ કરો, વધારાની સ્પેસ ટ્રિમ કરો અને ચોક્કસ ડેટા ટાઇપ (Date, Number, Text) નક્કી કરો.],
  [ફોર્મ્યુલામાં ક્યારેય `#VALUE!` એરર આવતી નથી.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[05]]],
  [#text(weight: "bold", fill: rtech-ppt)[ક્વેરીઝ મર્જ કરો]],
  [Customer ID આધારે સેલ્સ ટેબલ અને કસ્ટમર માસ્ટરનું લેફ્ટ આઉટર જોઇન કરો.],
  [લાખો પંક્તિઓ માટે VLOOKUP નો શ્રેષ્ઠ વિકલ્પ.],

  [#box(fill: rtech-navy, inset: 2.5pt, radius: 2pt)[#text(fill: white, weight: "black")[06]]],
  [#text(weight: "bold", fill: rtech-excel)[ક્લોઝ અને લોડ]],
  [સ્વચ્છ ડેટાને એક્સેલ ટેબલ કે સીધા #text(weight: "bold")[PowerPivot ડેટા મોડેલ] માં ફાઇલ સાઇઝ વધાર્યા વિના લોડ કરો.],
  [#hl-y[આવતા મહિને ફક્ત 'Refresh All' દબાવો]—સમગ્ર રિપોર્ટ 5 સેકન્ડમાં અપડેટ!],
)

#pagebreak()

// =============================================================================
// PAGE 05: MICROSOFT WORD 365: LEGAL STYLES & AUTOMATION (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[વર્ડ 365: લીગલ મલ્ટી-લેવલ નંબરિંગ, સેક્શન બ્રેક્સ અને મેઇલ મર્જ]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[દોષરહિત મલ્ટી-પેજ ફોર્મેટિંગ · લેન્ડસ્કેપ પેજ ઉમેરવું · 1 મિનિટમાં 1000+ પત્રો · ટોચની 15 વર્ડ કીઝ]
]

#section-banner(num: "સ્ટાઇલ માળખું", title: "હેડિંગ સ્ટાઇલ અને નંબરિંગ લિંકેજ (નંબરિંગ બગડવાનો પાકો ઉકેલ)", color: rtech-word)

#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[સ્ટ્રક્ચરલ ઘટક],
  text(size: 7pt, weight: "bold", fill: white)[કોર્પોરેટ ડોક્યુમેન્ટ નિયમ],
  text(size: 7pt, weight: "bold", fill: white)[Word 365 માં કેવી રીતે સેટ કરવું?],

  [#text(weight: "bold", fill: rtech-word)[Heading 1, 2, 3 લિંકેજ]],
  [નંબર ક્યારેય હાથેથી ટાઇપ ન કરો! મલ્ટીલેવલ લિસ્ટને સીધા હેડિંગ સ્ટાઇલ સાથે લિંક કરો.],
  [#kbd[Multilevel List] $->$ #kbd[Define New Multilevel List] $->$ #kbd[More] $->$ #hl-y[Link level to style: Heading 1]। લેવલ 2 અને 3 માટે પુનરાવર્તન કરો.],

  [#text(weight: "bold", fill: rtech-blue)[ઓટોમેટિક અનુક્રમણિકા (TOC)]],
  [વિષય-સૂચિ (Table of Contents) પેજ નંબર ટાઇપ કર્યા વગર 1-ક્લિકમાં આપમેળે બનશે.],
  [#text(weight: "bold")[References $->$ Table of Contents $->$ Automatic Table 1] પસંદ કરો. અપડેટ કરવા માટે #kbd[F9] દબાવો.],

  [#text(weight: "bold", fill: rtech-emerald)[નેવિગેશન પેન કંટ્રોલ]],
  [100+ પેજના લાંબા કરારમાં પ્રકરણોને ડ્રેગ કરીને સીધા પુનઃક્રમિત કરવા.],
  [#kbd[Ctrl + F] દબાવી #kbd[Headings] પસંદ કરો. સીધા હેડિંગને ઉપર-નીચે ડ્રેગ કરીને આખા પ્રકરણનું સ્થાન બદલો!],
)

#section-banner(num: "સેક્શન બ્રેક્સ", title: "સેક્શન બ્રેક વિરુદ્ધ પેજ બ્રેક (પોર્ટ્રેટ વચ્ચે લેન્ડસ્કેપ પેજ ઉમેરવું)", color: rtech-word)

#table(
  columns: (1.3fr, 2.2fr, 2.5fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[બ્રેકનો પ્રકાર],
  text(size: 7pt, weight: "bold", fill: white)[કીબોર્ડ / નેવિગેશન પાથ],
  text(size: 7pt, weight: "bold", fill: white)[મહત્વપૂર્ણ તફાવત અને નિયમ],

  [#text(weight: "bold", fill: rtech-word)[પેજ બ્રેક (Page Break)]],
  [#kbd[Ctrl + Enter]],
  [ટેક્સ્ટને આગલા પેજ પર મોકલે છે. હેડર, ફૂટર, પેજ નંબર અને ઓરિએન્ટેશન #hl-y[સંપૂર્ણ સમાન] રહે છે.],

  [#text(weight: "bold", fill: rtech-ppt)[સેક્શન બ્રેક\ (Next Page)]],
  [#text(weight: "bold")[Layout $->$ Breaks $->$ Section Breaks $->$ Next Page]],
  [દસ્તાવેજનો સ્વતંત્ર ભાગ બનાવે છે. પહોળા ટેબલ માટે માત્ર તે પેજને #hl-b[Portrait થી Landscape] કરવા દે છે.],

  [#text(weight: "bold", fill: rtech-emerald)[હેડર અલગ કરવું\ ('Link to Previous')]],
  [સેક્શન 2 ના હેડર પર ડબલ-ક્લિક કરો $->$ રિબન પર #kbd[Link to Previous] બંધ કરો.],
  [#hl-g[સૌથી મહત્વનું પગલું]! સેક્શન 2 માં અલગ શીર્ષક મૂકવા કે પેજ નંબરિંગ ફરી 1 થી શરૂ કરવાની છૂટ આપે છે.],
)

#section-banner(num: "મેઇલ મર્જ પાઇપલાઇન", title: "સ્વચાલિત 5-તબક્કાની બલ્ક લેટર અને ઇનવોઇસ પાઇપલાઇન", color: rtech-word)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[તબક્કો 1: ડેટા રેડી]\
      #v(1.5pt)
      એક્સેલની પ્રથમ રો માં સ્પષ્ટ હેડર રાખો (`Name`, `Address`, `Salary`, `Email`).
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[તબક્કો 2: ફાઇલ જોડો]\
      #v(1.5pt)
      Word: #text(weight: "bold")[Mailings $->$ Select Recipients $->$ Use Existing List]. એક્સેલ પસંદ કરો.
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[તબક્કો 3: ફીલ્ડ ઉમેરો]\
      #v(1.5pt)
      કર્સ મૂકો $->$ #text(weight: "bold")[Insert Merge Field] $->$ `<<Name>>` વગેરે પસંદ કરો.
    ]
  ],
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BAE6FD"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-blue)[તબક્કો 4: પ્રિવ્યૂ]\
      #v(1.5pt)
      #kbd[Preview Results] પર ક્લિક કરી અલગ રેકોર્ડ્સ ચકાસો.
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.5pt + rgb("#86EFAC"), radius: 3pt, inset: 3.5pt)[
      #text(size: 6.8pt, weight: "black", fill: rtech-excel)[તબક્કો 5: ફિનિશ]\
      #v(1.5pt)
      #kbd[Finish & Merge] $->$ 1 ક્લિકમાં 1,000+ વ્યક્તિગત પત્રો કે PDF તૈયાર!
    ]
  ],
)

#v(2pt)
#section-banner(num: "વર્ડ શોર્ટકટ્સ", title: "માઇક્રોસોફ્ટ વર્ડ માટે ટોચના 15 દૈનિક શોર્ટકટ્સ", color: rtech-word)

#table(
  columns: (1fr, 1.4fr, 1fr, 1.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 3pt,

  text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.8pt, weight: "bold", fill: white)[કાર્ય],
  text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.8pt, weight: "bold", fill: white)[કાર્ય],

  [#kbd[Ctrl + Shift + C / V]], [ફોર્મેટ પેઇન્ટર કોપી / પેસ્ટ],
  [#kbd[Shift + F3]], [કેસ બદલવો (નાના $->$ પ્રથમ મોટો $->$ બધા મોટા)],
  [#kbd[Ctrl + Enter]], [સ્વચ્છ પેજ બ્રેક ઉમેરવો],
  [#kbd[Alt + Shift + D]], [આજની તારીખ ઉમેરવી],
  [#kbd[Ctrl + F]], [નેવિગેશન અને સર્ચ પેન ખોલવું],
  [#kbd[Ctrl + H]], [ફાઇન્ડ એન્ડ રિપ્લેસ વિન્ડો],
  [#kbd[Ctrl + K]], [હાઇપરલિંક ઉમેરવી],
  [#kbd[Ctrl + E] / #kbd[Ctrl + L]], [સેન્ટર અલાઇન / લેફ્ટ અલાઇન],
  [#kbd[Ctrl + J]], [જસ્ટિફાય (બંને બાજુ સરખા માર્જિન)],
  [#kbd[Ctrl + Shift + > / <]], [ફોન્ટ સાઇઝ વધારવી / ઘટાડવી],
  [#kbd[Ctrl + Space]], [મેન્યુઅલ ફોર્મેટિંગ હટાવી સામાન્ય કરવું],
  [#kbd[Ctrl + 1] / #kbd[Ctrl + 2]], [સિંગલ લાઇન સ્પેસ / ડબલ સ્પેસ],
  [#kbd[F7]], [સ્પેલિંગ અને ગ્રામર ચેકર],
  [#kbd[Ctrl + Shift + E]], [ટ્રેક ચેન્જીસ (Track Changes) ઓન/ઓફ],
)

#pagebreak()

// =============================================================================
// PAGE 06: POWERPOINT 365: PITCH DECK ARCHITECTURE & MORPH (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[પાવરપોઇન્ટ 365: એક્ઝિક્યુટિવ ડેક સ્ટાન્ડર્ડ્સ, સ્લાઇડ માસ્ટર અને મોર્ફ]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[સ્લાઇડ માસ્ટર કોર્પોરેટ લોકિંગ · મોર્ફ દ્વારા સરળ એપ એનિમેશન · ટોચની 15 પ્રેઝન્ટર કીઝ]
]

#section-banner(num: "સ્લાઇડ માસ્ટર", title: "કંપની બ્રાન્ડિંગ લોક (ટીમ દ્વારા સ્લાઇડ લેઆઉટ બગડતું અટકાવો)", color: rtech-ppt)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ઘટક],
  text(size: 7pt, weight: "bold", fill: white)[કોન્ફિગરેશનની સાચી પદ્ધતિ],
  text(size: 7pt, weight: "bold", fill: white)[વ્યવસાયિક લાભ],

  [#text(weight: "bold", fill: rtech-ppt)[Slide Master Access]],
  [#text(weight: "bold")[View $->$ Slide Master] માં જાઓ. સૌથી ઉપરની મુખ્ય સ્લાઇડ પર કંપની લોગો, ફોન્ટ અને કલર સ્કીમ સેટ કરો.],
  [લોગો અને બેકગ્રાઉન્ડ હંમેશ માટે લોક થાય છે, પ્રેઝન્ટર ભૂલથી પણ તેને ખસેડી કે ડિલીટ કરી શકતો નથી.],

  [#text(weight: "bold", fill: rtech-blue)[કસ્ટમ પ્લેસહોલ્ડર્સ]],
  [#kbd[Insert Placeholder] $->$ ટેક્સ્ટ, પિક્ચર, ચાર્ટ કે ટેબલ બોક્સ ઉમેરો. યોગ્ય પેડિંગ અને કદ અગાઉથી નક્કી રાખો.],
  [ટીમના સભ્યો સીધા #hl-y['Click to add picture'] કરશે—લેઆઉટ ક્યારેય આડુંઅવળું નહીં થાય.],

  [#text(weight: "bold", fill: rtech-emerald)[એસ્પેક્ટ રેશિયો (16:9)]],
  [હંમેશા #text(weight: "bold")[Widescreen 16:9] (#kbd[Design $->$ Slide Size $->$ Widescreen]) વાપરો. જૂનું 4:3 ન પસંદ કરો.],
  [આધુનિક LED ટીવી, લેપટોપ અને પ્રોજેક્ટર પર બંને બાજુ કાળી પટ્ટીઓ આવતી નથી.],
)

#section-banner(num: "મોર્ફ ટ્રાન્ઝિશન", title: "જટિલ એનિમેશન વગર સિનેમેટિક સ્મૂધ ટ્રાન્ઝિશન", color: rtech-ppt)

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[મોર્ફ ટેકનિક],
  text(size: 7pt, weight: "bold", fill: white)[3 સ્ટેપ્સમાં કેવી રીતે બનાવવું?],
  text(size: 7pt, weight: "bold", fill: white)[સ્ક્રીન પર કેવી અસર દેખાય છે?],

  [#text(weight: "bold", fill: rtech-ppt)[ઓબ્જેક્ટ મૂવમેન્ટ અને સાઇઝ]],
  [1. સ્લાઇડ 1 બનાવો $->$ 2. સ્લાઇડ ડુપ્લિકેટ કરો (#kbd[Ctrl+D]) $->$ 3. સ્લાઇડ 2 પર ઓબ્જેક્ટનું સ્થાન કે કદ બદલો $->$ 4. #text(weight: "bold")[Transitions $->$ Morph] લગાવો.],
  [મોશન પાથ બનાવ્યા વિના ઓબ્જેક્ટ એક સ્લાઇડથી બીજી સ્લાઇડ પર તરતો પહોંચી જાય છે.],

  [#text(weight: "bold", fill: rtech-blue)[નેમ ટેગિંગ (`!!`)]],
  [Selection Pane (#kbd[Alt+F10]) માં બંને અલગ આકારોને સમાન નામ આપો, જેમ કે સ્લાઇડ 1 પર વર્તુળને `!!Logo` અને સ્લાઇડ 2 પર તારાને `!!Logo`.],
  [#hl-y[અલગ-અલગ આકારો એકબીજામાં પીગળીને રૂપાંતરિત થાય છે]! ઉચ્ચ કક્ષાની સિનેમેટિક અસર.],

  [#text(weight: "bold", fill: rtech-excel)[ઝૂમ-ઇન પ્રોડક્ટ ફોકસ]],
  [સ્લાઇડ 1 પર એપનો નાનો સ્ક્રીનશોટ રાખો. ડુપ્લિકેટ સ્લાઇડ 2 પર તેને 300% મોટો કરી કોઈ એક કાર્ડ પર ફોકસ કરો $->$ Morph લગાવો.],
  [વિડીયો એડિટિંગ સોફ્ટવેર વિના પ્રેઝન્ટેશનમાં કેમેરા ઝૂમ જેવી અસર ઊભી થાય છે.],
)

#section-banner(num: "PPT શોર્ટકટ્સ", title: "પ્રેઝન્ટર્સ અને ડિઝાઇનર્સ માટે ટોચના 15 ડેક શોર્ટકટ્સ", color: rtech-ppt)

#table(
  columns: (1.1fr, 2.4fr, 1.1fr, 2.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.8pt, weight: "bold", fill: white)[કાર્ય],
  text(size: 6.8pt, weight: "bold", fill: white)[શોર્ટકટ],
  text(size: 6.8pt, weight: "bold", fill: white)[કાર્ય],

  [#kbd[Ctrl + D]], [ઓબ્જેક્ટ કે સ્લાઇડ ડુપ્લિકેટ કરવી],
  [#kbd[Shift + Drag]], [સંપૂર્ણ સીધું વર્તુળ, ચોરસ કે લાઇન દોરવી],
  [#kbd[Ctrl + Shift + G]], [ગ્રૂપ કરેલા આકારોને અનગ્રૂપ કરવા],
  [#kbd[Ctrl + G]], [પસંદ કરેલા આકારોનું ગ્રૂપ બનાવવું],
  [#kbd[F5]], [શરૂઆતથી પૂર્ણ સ્ક્રીન સ્લાઇડ શો શરૂ કરવો],
  [#kbd[Shift + F5]], [વર્તમાન સ્લાઇડ પરથી શો શરૂ કરવો],
  [#kbd[B] (શો માં)], [સ્ક્રીનને સંપૂર્ણ બ્લેક કરવી (સ્પીકર પર ધ્યાન દોરવા)],
  [#kbd[W] (શો માં)], [સ્ક્રીનને સંપૂર્ણ વ્હાઇટ કરવી],
  [#kbd[Ctrl + L] (શો માં)], [માઉસને લાઇવ લેસર પોઇન્ટર બનાવવું],
  [#kbd[Ctrl + P] (શો માં)], [સ્લાઇડ પર પેનથી લખવા પેન ટૂલ ઓન],
  [#kbd[Ctrl + E] (શો માં)], [પેનથી લખેલા નિશાનો ભૂંસવા],
  [#kbd[Alt + F10]], [Selection Pane ખોલવું (લેયર્સ જોવા)],
  [#kbd[Ctrl + Shift + C/V]], [આકારની સ્ટાઇલ કોપી કરી બીજા પર લગાવવી],
  [#kbd[Alt + Shift + Left/Right]], [બુલેટ પોઇન્ટ્સનું લેવલ ઘટાડવું કે વધારવું],
)

#pagebreak()

// =============================================================================
// PAGE 07: MICROSOFT 365 CLOUD & OUTLOOK INBOX ZERO (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[માઇક્રોસોફ્ટ 365: ક્લાઉડ ટીમવર્ક અને આઉટલુક ઇનબોક્સ ઝીરો]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[OneDrive રિયલ-ટાઇમ કો-ઓથરિંગ · ફાઇલ વર્ઝન હિસ્ટ્રી · 4D ઇમેઇલ મેનેજમેન્ટ · કોર્પોરેટ કેલેન્ડર]
]

#section-banner(num: "ક્લાઉડ ટીમવર્ક", title: "રિયલ-ટાઇમ કો-ઓથરિંગ અને શેરપોઇન્ટ / વનડ્રાઇવ નિયમો", color: rtech-blue)

#table(
  columns: (1.3fr, 2.4fr, 2.3fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ક્લાઉડ ક્ષમતા],
  text(size: 7pt, weight: "bold", fill: white)[Microsoft 365 માં કેવી રીતે કાર્ય કરે છે?],
  text(size: 7pt, weight: "bold", fill: white)[સુરક્ષા અને બેસ્ટ પ્રેક્ટિસ],

  [#text(weight: "bold", fill: rtech-blue)[Real-Time Co-Authoring]],
  [ટીમના અનેક સભ્યો એક જ એક્સેલ કે વર્ડ ફાઇલ પર એકસાથે કાર્ય કરે છે. સ્ક્રીન પર અલગ રંગના જીવંત કર્સર્સ દેખાય છે.],
  [ઇમેઇલમાં `Report_Final_v2_Approved.xlsx` જેવી ડઝનબંધ ડુપ્લિકેટ ફાઇલોની માથાકૂટમાંથી કાયમી મુક્તિ!],

  [#text(weight: "bold", fill: rtech-emerald)[Version History]],
  [ઉપર ટાઇટલ બાર પર ક્લિક કરી #kbd[Version History] પસંદ કરો. જૂની કોઈપણ તારીખનું વર્ઝન 1 ક્લિકમાં પુનઃસ્થાપિત કરી શકાય છે.],
  [ભૂલથી ડેટા ડિલીટ થવા સામે મજબૂત સુરક્ષા કવચ. દરેક સેવ એક ઐતિહાસિક બેકઅપ બની જાય છે.],

  [#text(weight: "bold", fill: rtech-ppt)[Sharing Permissions]],
  [લિંકના પ્રકારો: 1. #text(weight: "bold")[Anyone with the link] (જાહેર), 2. #text(weight: "bold")[People in organization], 3. #text(weight: "bold")[Specific People].],
  [#hl-y[કંપની નાણાકીય ડેટા ક્યારેય 'Anyone' લિંકથી શેર ન કરવો]! હંમેશા એક્સપાયરી ડેટ સેટ કરો અને ડાઉનલોડ બ્લોક રાખો.],

  [#text(weight: "bold", fill: rtech-word)[Excel Web vs Desktop]],
  [એક્સેલ ઓનલાઇનમાં બેઝિક ફોર્મ્યુલા, કો-ઓથરિંગ અને ઓફિસ સ્ક્રિપ્ટ્સ (TypeScript) ચાલે છે. ડેસ્કટોપમાં ભારે મેક્રોઝ અને પાવરપિવટ ચાલે છે.],
  [ટીમવર્ક માટે ઓનલાઇન ચલાવો; ઊંડાણપૂર્વકના ડેટા એનાલિસિસ માટે ડેસ્કટોપ એક્સેલ ખોલો.],
)

#section-banner(num: "આઉટલુક ઇનબોક્સ ઝીરો", title: "ઇમેઇલ વ્યવસ્થાપનનો 4D કોર્પોરેટ ફોર્મ્યુલા", color: rtech-outlook)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 0.8pt + rgb("#38BDF8"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[1. DO IT (< 2 MINS)]\
      #v(2pt)
      જો કોઈ ઇમેઇલનો ઉત્તર 2 મિનિટથી ઓછા સમયમાં આપી શકાય, તો #hl-y[તેને તુરંત પૂર્ણ કરો].
    ]
  ],
  [
    #block(fill: rgb("#DCFCE7"), stroke: 0.8pt + rgb("#86EFAC"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-excel)[2. DELEGATE]\
      #v(2pt)
      સંબંધિત જવાબદાર વ્યક્તિને ડેડલાઇન સાથે ફોરવર્ડ કરો અને પોતાને #kbd[\@WaitingFor] માં મૂકો.
    ]
  ],
  [
    #block(fill: rgb("#FEF3C7"), stroke: 0.8pt + rgb("#FCD34D"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B45309"))[3. DEFER (CALENDAR)]\
      #v(2pt)
      જો 15 મિનિટથી વધુ સમયનું કાર્ય હોય, તો ઇમેઇલને #kbd[Calendar] પર ડ્રેગ કરી ટાઇમ-સ્લોટ બુક કરો.
    ]
  ],
  [
    #block(fill: rgb("#FFE4E6"), stroke: 0.8pt + rgb("#FDA4AF"), radius: 4pt, inset: 4.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#E11D48"))[4. DELETE / ARCHIVE]\
      #v(2pt)
      માહિતી મેઇલ, ન્યૂઝલેટર. #kbd[Backspace] દબાવી આર્કાઇવ કરો. ઇનબોક્સને શૂન્ય રાખો.
    ]
  ],
)

#v(2pt)
#section-banner(num: "આઉટલુક પાવર ટૂલ્સ", title: "ક્વિક સ્ટેપ્સ, ઓટો રૂલ્સ અને કીબોર્ડ ગતિવર્ધક", color: rtech-outlook)

#table(
  columns: (1.3fr, 2.3fr, 2.4fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if row == 0 { center } else { left + horizon },
  inset: 3.2pt,

  text(size: 6.8pt, weight: "bold", fill: white)[આઉટલુક ફીચર],
  text(size: 6.8pt, weight: "bold", fill: white)[કેવી રીતે સેટ કરવું?],
  text(size: 6.8pt, weight: "bold", fill: white)[ઉચ્ચ ઉપયોગિતા શોર્ટકટ],

  [#text(weight: "bold", fill: rtech-outlook)[Quick Steps]],
  [Home $->$ Quick Steps $->$ New. એક ક્લિકમાં: વંચાયેલ માર્ક કરવું + ફોલ્ડરમાં મૂકવું + ફ્લેગ લગાવવો.],
  [રોજિંદા આવતા મેઇલ્સ ક્લિયર કરવા માટે શોર્ટકટ #kbd[Ctrl + Shift + 1] વાપરો.],

  [#text(weight: "bold", fill: rtech-blue)[ઓટોમેટિક રૂલ્સ]],
  [Home $->$ Rules $->$ Create Rule. સર્વર એલર્ટ કે બેંક એલર્ટ સીધા અલગ ફોલ્ડરમાં ચાલ્યા જાય.],
  [ઇનબોક્સને માત્ર મહત્વપૂર્ણ માનવીય સંવાદ માટે ખાલી રાખે છે.],

  [#text(weight: "bold", fill: rtech-emerald)[Scheduling Assistant]],
  [New Meeting $->$ Scheduling Assistant. ટીમના તમામ સભ્યોનો મુક્ત અને વ્યસ્ત સમય એકસાથે જુઓ.],
  [વારંવાર "તમે ક્યારે ફ્રી છો?" પૂછતા ઇમેઇલ્સ હંમેશ માટે બંધ.],

  [#text(weight: "bold", fill: rtech-navy)[ટોચની આઉટલુક કીઝ]],
  [#kbd[Ctrl+Shift+M] (નવો ઇમેઇલ) · #kbd[Ctrl+N] (નવી આઇટમ) · #kbd[Ctrl+R] (રિપ્લાય) · #kbd[Ctrl+Shift+R] (રિપ્લાય ઓલ)],
  [#kbd[Ctrl+1] (મેઇલ) · #kbd[Ctrl+2] (કેલેન્ડર) · #kbd[Ctrl+3] (કોન્ટેક્ટ્સ) · #kbd[Backspace] (1-ટચ આર્કાઇવ)],
)

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB & MNC INTERVIEW VAULT (GUJARATI)
// =============================================================================

#align(center)[
  #text(size: 11pt, weight: "black", fill: rtech-navy)[RTECHLAB લેખક મેન્ટરશિપ હબ અને MNC ઇન્ટરવ્યુ વોલ્ટ]
  #v(1pt)
  #text(size: 7.2pt, fill: rtech-muted)[સત્તાવાર લેખક પ્રોફાઇલ · ડાયરેક્ટ પોર્ટફોલિયો અને સોશિયલ હબ · પ્લેસમેન્ટ તૈયારી ચેકલિસ્ટ]
]

#section-banner(num: "લેખક પરિચય", title: "લેખક: રાહુલ પટેલ — સંસ્થાપક અને સિનિયર ટેકનિકલ એક્સપર્ટ", color: rtech-navy)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  fill: rgb("#F8FAFC"),
  radius: 5pt,
  inset: 6pt,
  [
    #grid(
      columns: (65pt, 1fr),
      gutter: 9pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-blue,
          radius: 6pt,
          clip: true,
          width: 58pt,
          height: 68pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 10pt, weight: "black", fill: rtech-navy)[રાહુલ પટેલ (Rahul Patel)]\
        #v(0.5pt)
        #text(size: 7.2pt, weight: "bold", fill: rtech-blue)[સંસ્થાપક અને મુખ્ય સિસ્ટમ્સ આર્કિટેક્ટ · RTechLab Publications]\
        #text(size: 7.2pt, weight: "bold", fill: rgb("#047857"))[ડિરેક્ટર અને સિનિયર ટેકનિકલ એક્સપર્ટ · IANT COMPUTER EDUCATION, PALANPUR]\
        #v(1.5pt)
        #text(size: 6.8pt, fill: rtech-navy)[
          *10 થી વધુ વર્ષોના ઊંડાણપૂર્વકના ટેકનિકલ અને શિક્ષણ અનુભવ* સાથે, રાહુલે ગુજરાત અને સમગ્ર ભારતમાં *3,000 થી વધુ વિદ્યાર્થીઓ* ને કોમ્પ્યુટર નેટવર્કિંગ, સિસ્કો CCNA, ક્લાઉડ ઇન્ફ્રાસ્ટ્રક્ચર અને કોર્પોરેટ MIS સિસ્ટમ્સમાં તાલીમ આપી છે. તેમણે ₹22 ડેસ્ક રેફરન્સ શ્રેણીની શરૂઆત એટલા માટે કરી જેથી દરેક મહત્વાકાંક્ષી વિદ્યાર્થીને ઉચ્ચ સ્તરીય ટેકનિકલ જ્ઞાન અત્યંત પોસાય તેવા ભાવે ઉપલબ્ધ થઈ શકે.
        ]
      ]
    )
  ]
)

#section-banner(num: "કોમ્યુનિટી ચેનલ્સ", title: "લેખક પોર્ટફોલિયો, યુટ્યુબ અને સત્તાવાર ચેનલોની સીધી લિંક્સ", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  [
    #block(
      stroke: 0.8pt + rgb("#38BDF8"),
      fill: rgb("#F0F9FF"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rtech-blue)[લેખક પોર્ટફોલિયો]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#FDA4AF"),
      fill: rgb("#FFF1F2"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#E11D48"))[યુટ્યુબ ચેનલ]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#F472B6"),
      fill: rgb("#FDF2F8"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#DB2777"))[ઇન્સ્ટાગ્રામ હબ]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial]] ↗]
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.8pt + rgb("#86EFAC"),
      fill: rgb("#F0FDF4"),
      radius: 4pt,
      inset: 4.5pt,
      [
        #align(center)[
          #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 52pt)]
          #v(2pt)
          #text(size: 6.8pt, weight: "black", fill: rgb("#166534"))[વ્હોટ્સએપ કોમ્યુનિટી]\
          #text(size: 5.8pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[ફ્રી કોમ્યુનિટી એક્સેસ ↗]]
        ]
      ]
    )
  ],
)

#section-banner(num: "MNC ઇન્ટરવ્યુ વોલ્ટ", title: "MNCs માં પૂછાતા ટોચના 5 MIS અને Office 365 પ્રશ્નો તથા મોડેલ જવાબો", color: rtech-excel)

#table(
  columns: (2.2fr, 3.8fr),
  stroke: 0.35pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3.5pt,

  text(size: 7pt, weight: "bold", fill: white)[ટેકનિકલ ઇન્ટરવ્યુ પ્રશ્નો (Asked in Top MNCs)],
  text(size: 7pt, weight: "bold", fill: white)[સિનિયર એક્ઝિક્યુટિવ મોડેલ ઉત્તરો],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.1: XLOOKUP શા માટે VLOOKUP કરતાં બહેતર માનવામાં આવે છે?]],
  [XLOOKUP માં ડિફોલ્ટ ચોક્કસ મેળ (Exact Match) હોય છે, તે ડાબી બાજુ પણ શોધી શકે છે, `#N/A` આપમેળે હેન્ડલ કરે છે, એકસાથે અનેક કોલમ્સ લાવે છે અને નવી કોલમ ઉમેરવાથી ક્યારેય તૂટતો નથી.],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.2: પેજ બ્રેકને બદલે સેક્શન બ્રેક ક્યારે વાપરવો જોઈએ?]],
  [પેજ બ્રેક માત્ર લખાણને આગળના પેજ પર મોકલે છે. સેક્શન બ્રેક એક સ્વતંત્ર લેઆઉટ ઝોન બનાવે છે, જેથી પોર્ટ્રેટ વચ્ચે કોઈ એક પેજને લેન્ડસ્કેપ કરી શકાય અને હેડર/ફૂટર અલગ કરી શકાય.],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.3: પાવર ક્વેરીમાં 'Unpivot Columns' નું શું કાર્ય છે?]],
  [તે પહોળી મેટ્રિક્સ ટેબલ (મહિનાઓની કોલમો) ને પ્રમાણિત 2-કોલમ ડેટાબેઝ માળખા (Attribute અને Value) માં ફેરવે છે, જેથી ઉત્તમ પિવટ ટેબલ અને ડેટા મોડેલ બનાવી શકાય.],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.4: મોર્ફ ટ્રાન્ઝિશન સામાન્ય એનિમેશનથી કેવી રીતે અલગ છે?]],
  [સામાન્ય એનિમેશનમાં દરેક ઓબ્જેક્ટ પર અલગથી મોશન પાથ આપવો પડે છે. મોર્ફ બે સ્લાઇડ્સની સરખામણી કરી સમાન નામવાળા ઓબ્જેક્ટ્સનું કદ, રંગ અને સ્થાન આપમેળે સ્મૂધલી બદલી નાખે છે.],

  [#text(weight: "bold", fill: rtech-navy)[પ્ર.5: આઉટલુકમાં ઇનબોક્સ ઝીરોનો 4D નિયમ શું છે?]],
  [2 મિનિટથી ઓછું કાર્ય હોય તો તુરંત કરવું (Do); અન્યને સોંપવું (Delegate); પછીના સમય માટે કેલેન્ડર પર શિડ્યુલ કરવું (Defer); બાકી બધું ડિલીટ કે આર્કાઇવ કરવું (Delete) જેથી ઇનબોક્સ ખાલી રહે.],
)

#v(2pt)
#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 0.8pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 10pt, y: 3pt),
    text(size: 7pt, weight: "bold", fill: rtech-blue)[
      🚀 શું તમે સંપૂર્ણ 113 પેજની વિસ્તૃત પુસ્તક અને 6 સાચી એક્સેલ પ્રેક્ટિસ ફાઇલ્સ (.xlsx) મેળવવા માંગો છો? ₹49 માસ્ટર બુક કે ₹149 કરિયર સ્યુટ પર અપગ્રેડ કરો: #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]
    ]
  )
]
'''

with open(typ_path, "w", encoding="utf-8") as f:
    f.write(typst_content)

print(f"✓ Typst source written to: {typ_path}")

cmd = ["typst", "compile", typ_path, pdf_path]
print(f"Compiling: {' '.join(cmd)}")
res = subprocess.run(cmd, capture_output=True, text=True)
if res.returncode != 0:
    print("Compilation error:", res.stderr)
    exit(1)

print(f"✓ PDF successfully compiled to: {pdf_path}")

# Verify exact page count with PyMuPDF
doc = fitz.open(pdf_path)
page_count = len(doc)
print(f"=== VERIFICATION: Total Pages = {page_count} ===")
doc.close()

# Copy to public downloads
with open(pdf_path, "rb") as fsrc, open(public_pdf, "wb") as fdst:
    fdst.write(fsrc.read())

print(f"✓ Copied to public download path: {public_pdf}")
