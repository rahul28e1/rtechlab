// =============================================================================
// RTECHLAB MICROSOFT 365 ENTERPRISE V6 (GU)
// Complete College & Corporate Desk Reference + 150 Shortcuts Poster (8 Pages)
// =============================================================================

#set document(
  title: "Microsoft 365 એન્ટરપ્રાઇઝ ક્વિક ડેસ્ક રેફરન્સ અને 150 શોર્ટકટ (Gujarati)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 8mm, bottom: 7.5mm, left: 7.5mm, right: 7.5mm),
  background: context {
    let p = counter(page).get().first()
    if p > 1 [
      #place(center + horizon)[
        #rotate(-35deg)[
          #text(size: 74pt, weight: "black", fill: rgb("#0F172A0A"))[RTECHLAB]
        ]
      ]
    ]
  },
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 11pt, baseline: 1.5pt)[#image("02_BRAND_ASSETS/rtechlab_official_badge_logo.png", height: 11pt)]
          #h(3pt)#text(size: 7.5pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 7.5pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[Microsoft 365 ડેસ્ક રેફરન્સ અને 150 શોર્ટકટ ગાઇડ (ગુજરાતી)]
        ],
        [
          #text(size: 6.8pt, weight: "bold", fill: rgb("#107C41"))[Word · Excel · PowerPoint · Outlook · Cloud]
          #text(size: 6.8pt, fill: rgb("#64748B"))[ · Rahul Patel]
        ]
      )
      #v(1pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(1pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.3pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#0284C7"))[●] 150 પ્રોડક્શન શોર્ટકટ · પ્રિન્ટ કરી ડેસ્ક પર રાખો · ફ્રી ટૂલ્સ: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            stroke: 0.4pt + rgb("#CBD5E1"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.2pt),
            text(size: 6.5pt, weight: "bold", fill: rgb("#0F172A"))[પાનું #p 8 માંથી]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
  size: 6.8pt,
  fill: rgb("#0F172A"),
  spacing: 100%
)

#set par(
  justify: false,
  leading: 0.36em,
  first-line-indent: 0pt
)

// Colors
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-word = rgb("#185ABD")
#let rtech-excel = rgb("#107C41")
#let rtech-ppt = rgb("#C43E1C")
#let rtech-outlook = rgb("#0078D4")
#let rtech-muted = rgb("#475569")
#let dark-border = rgb("#1E293B")

// Highlighters & Tags
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-o(body) = box(fill: rgb("#FFEDD5"), inset: (x: 2pt, y: 0.6pt), radius: 2pt)[#text(fill: rgb("#9A3412"), weight: "bold")[#body]]
#let kbd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.55pt + dark-border, radius: 2pt, inset: (x: 2pt, y: 0.5pt))[#text(size: 5.9pt, font: ("Consolas", "Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]
#let nb(n, c) = box(fill: c, inset: (x: 2pt, y: 0.7pt), radius: 2pt)[#text(fill: white, weight: "black", size: 5.4pt)[#n]]

#let app-banner(title, subtitle, color) = {
  block(width: 100%, fill: color, radius: 3pt, inset: (x: 6pt, y: 3.5pt))[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [#text(size: 9.2pt, weight: "black", fill: white)[#title]],
      [#text(size: 6.4pt, weight: "bold", fill: rgb("#FFFFFFCC"))[#subtitle]]
    )
  ]
  v(2pt)
}

#let section-banner(num: "PART", title: "TITLE", color: rtech-blue) = {
  v(2.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3pt + color, rest: 0.55pt + dark-border),
    radius: (right: 2.5pt),
    inset: (x: 5pt, y: 2.2pt),
    [
      #box(
        fill: color,
        radius: 2pt,
        inset: (x: 3.5pt, y: 1pt),
        text(size: 5.8pt, font: ("Consolas", "Nirmala UI", "Segoe UI"), weight: "black", fill: white)[#num]
      )
      #h(4pt)
      #text(size: 7.5pt, weight: "black", fill: rtech-navy)[#title]
    ]
  )
  v(1.5pt)
}

// =============================================================================
// PAGE 01: FULL-BLEED EXECUTIVE HERO COVER PAGE
// =============================================================================
#page(
  paper: "a4",
  margin: 0mm,
  header: none,
  footer: none,
  background: none,
)[
  #image("02_BRAND_ASSETS/office_365_cover_hero.png", width: 100%, height: 100%, fit: "cover")
]

// =============================================================================
// PAGE 02: SECTION 1 — MICROSOFT WORD 365 (VISUAL + WORKFLOWS + TOP KEYS)
// =============================================================================
#app-banner("સેક્શન 1  |  MICROSOFT WORD 365", "કોર્પોરેટ રિપોર્ટ, કોલેજ થીસીસ, ATS રિઝ્યુમે અને ઓટોમેટેડ ડોક્યુમેન્ટ્સ", rtech-word)

// Compact 8-Page Quick Index Strip
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 2.5pt, inset: (x: 4pt, y: 2.5pt))[
  #set text(size: 5.7pt, weight: "bold", fill: rtech-navy)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    [#box(fill: rtech-navy, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.1]] Cover & Roadmap],
    [#box(fill: rtech-word, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.2]] MS Word 365],
    [#box(fill: rtech-excel, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.3]] 24 Excel Formulas],
    [#box(fill: rtech-excel, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.4]] Power Query & Errors],
    [#box(fill: rtech-ppt, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.5]] PowerPoint 365],
    [#box(fill: rtech-navy, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.6]] ★ 150 Shortcuts Wall],
    [#box(fill: rtech-outlook, inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.7]] Outlook, Cloud & AI],
    [#box(fill: rgb("#047857"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt)[#text(fill: white)[P.8]] Author QR & MNC Q&A],
  )
]

#section-banner(num: "ભાગ 1.1", title: "વિઝ્યુઅલ બ્લુપ્રિન્ટ: કંપનીઓ ખોટી ફોર્મેટ વાળા રિઝ્યુમે અને રિપોર્ટ કેમ રિજેક્ટ કરે છે?", color: rtech-word)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/word_document_layout_visual.png", width: 84%)
  ]
]

#section-banner(num: "ભાગ 1.2", title: "કોલેજ રિપોર્ટ, રિઝ્યુમે અને ઓફિસ જોબ્સ માટે 6 જરૂરી Word વર્કફ્લો", color: rtech-word)
#table(
  columns: (1.35fr, 2.25fr, 2.4fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3.1pt,
  text(size: 6.6pt, weight: "bold", fill: white)[વર્કફ્લો / ટૂલ],
  text(size: 6.6pt, weight: "bold", fill: white)[કોલેજ અને ઓફિસમાં કેમ જરૂરી છે?],
  text(size: 6.6pt, weight: "bold", fill: white)[સાચી રીત (Click Path & Shortcut)],
  [#hl-b[1. Heading 1–3 + Auto TOC]], [હાથથી નંબર લખવાથી રિપોર્ટમાં નંબર વિખેરાઈ જાય છે. Auto-TOC 2 સેકન્ડમાં ક્લિકેબલ ઇન્ડેક્સ બનાવે છે.], [Home → Heading 1/2/3 (#kbd[Ctrl+Alt+1/2/3]) → References → Table of Contents → અપડેટ માટે #kbd[F9] દબાવો.],
  [#hl-o[2. Section vs Page Break]], [આખી ફાઇલ ફેરવ્યા વગર પોર્ટ્રેટ રિપોર્ટની વચ્ચે એક પહોળું (Landscape) Excel ટેબલ પેજ ઉમેરો!], [Layout → Breaks → #hl-y[Next Page (Section Break)]. વારંવાર Enter ન દબાવો! નવા પેજ માટે #kbd[Ctrl+Enter] વાપરો.],
  [#hl-g[3. Mail Merge (500 લેટર)]], [એક Excel લિસ્ટમાંથી 5 મિનિટમાં 500 અલગ-અલગ કોલેજ સર્ટિફિકેટ કે HR ઓફર લેટર તૈયાર કરો.], [Mailings → Start Mail Merge → Letters → Select Recipients (Excel લિસ્ટ પસંદ કરો) → Insert Field → Finish.],
  [4. Track Changes અને Compare], [HR કોન્ટ્રાક્ટ અને ટીચર થીસીસ રિવ્યુ માટે જરૂરી—મૂળ લખાણ કાઢ્યા વગર દરેક ફેરફાર રંગમાં બતાવે છે.], [Review → Track Changes (#kbd[Ctrl+Shift+E]). બે ફાઇલની સરખામણી માટે Review → Compare વાપરો.],
  [#hl-y[5. ATS રિઝ્યુમે અને PDF લોક]], [ફેન્સી Canva રિઝ્યુમે MNC સોફ્ટવેરમાં ફેલ થાય છે. સાદા 1-ઇંચ માર્જિન અને Word ટેબલ 100% પાસ થાય છે.], [0.75–1" માર્જિન, 10.5pt Calibri/Segoe UI અને બોર્ડર વગરના ટેબલ વાપરો → PDF એક્સપોર્ટ (#kbd[F12]) કરો.],
  [6. Footnotes, AutoText અને લોક], [રિસર્ચ પેપરમાં રેફરન્સ (`Alt+Ctrl+F`) ઉમેરો, 2 અક્ષરમાં કંપની એડ્રેસ લખો (Quick Parts), અને પાસવર્ડ લોક લગાવો.], [References → Insert Footnote; Review → Restrict Editing (ફક્ત Comments ની મંજૂરી આપો).],
)

#section-banner(num: "ભાગ 1.3", title: "ટોપ 10 Word પ્રોડક્શન શોર્ટકટ (તમામ 45 શોર્ટકટ પાના 6 પર એકસાથે)", color: rtech-word)
#table(
  columns: (1.05fr, 1.95fr, 1.05fr, 1.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  [#kbd[Ctrl+Shift+C / V]], [સ્ટાઇલ કોપી અને પેસ્ટ (Format Painter)],
  [#kbd[Ctrl+Space]], [#hl-o[બધી મેન્યુઅલ ફોર્મેટિંગ સાફ કરો]],
  [#kbd[Shift+F3]], [#hl-y[UPPER / lower / Title કેસ બદલો]],
  [#kbd[Ctrl+Enter]], [ચોખ્ખો નવો પેજ બ્રેક ઉમેરો],
  [#kbd[Ctrl+F / Ctrl+H]], [નેવિગેશન પેન / એકસાથે ટેક્સ્ટ બદલો],
  [#kbd[Alt+Shift+Up/Dn]], [#hl-g[ફકરો કે ટેબલ રો ઉપર-નીચે કરો]],
  [#kbd[Ctrl+J]], [બંને બાજુથી સરખું (Justify) અલાઇન],
  [#kbd[F9]], [TOC, તારીખ અને બધા ફીલ્ડ અપડેટ કરો],
  [#kbd[Ctrl+Shift+E]], [Track Changes ચાલુ / બંધ કરો],
  [#kbd[Ctrl+Shift+G]], [તાત્કાલિક શબ્દો અને પેજ ગણતરી જુઓ],
)

#section-banner(num: "ભાગ 1.4", title: "કોલેજ થીસીસ અને કંપની ડોક્યુમેન્ટ સબમિટ કરતા પહેલાની ચેકલિસ્ટ (PDF અગાઉ)", color: rtech-blue)
#table(
  columns: (1.4fr, 4.6fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  [#text(weight: "bold", fill: rtech-word)[1. અલગ પ્રથમ પેજ (Cover)]], [Header & Footer → 'Different First Page' પસંદ કરો જેથી પહેલા કવર પેજ પર હેડર કે 'Page 1' ન આવે!],
  [#text(weight: "bold", fill: rtech-word)[2. બેવડા પેજ નંબર સેટઅપ]], [TOC પછી Section Break મૂકો → 'Link to Previous' બંધ કરો → આગળ `i, ii, iii` અને ચેપ્ટરમાં `1, 2, 3` નંબર.],
  [#text(weight: "bold", fill: rtech-word)[3. ચિત્ર અને ટેબલ લોક કરો]], [ચિત્ર પસંદ કરી References → Insert Caption અને Cross-Reference મૂકો જેથી 'See Fig 2.1' ક્યારેય ખોટું ન પડે.],
  [#text(weight: "bold", fill: rtech-word)[4. બુકમાર્ક સાથે PDF]], [Save As PDF → Options → 'Create bookmarks using Headings' ચાલુ રાખો — Adobe/Chrome માં ક્લિકેબલ ઇન્ડેક્સ બનશે.],
  [#text(weight: "bold", fill: rtech-word)[5. ગણિત અને CSV થી ટેબલ]], [#kbd[Alt + =] થી એન્જિનિયરિંગ/ગણિત સમીકરણ ઉમેરો; 'Convert Text to Table' થી કોમા ડેટા 1 ક્લિકમાં ટેબલ બનાવો.],
)
#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [#box(width: 100%, fill: rgb("#DCFCE7"), stroke: 0.65pt + rtech-excel, radius: 2.5pt, inset: (x: 5pt, y: 2.5pt))[#text(size: 6.1pt, weight: "bold", fill: rgb("#166534"))[✅ ATS 100% પાસ: 1-કોલમ Word હેડિંગ, ચોખ્ખા માર્જિન, PDF એક્સપોર્ટ]]],
  [#box(width: 100%, fill: rgb("#FEE2E2"), stroke: 0.65pt + rgb("#DC2626"), radius: 2.5pt, inset: (x: 5pt, y: 2.5pt))[#text(size: 6.1pt, weight: "bold", fill: rgb("#991B1B"))[❌ ATS રિજેક્ટ: 2-કોલમ Canva ગ્રાફિક્સ, ટેક્સ્ટબોક્સ અને આઇકન]]]
)
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: (left: 3.5pt + rtech-word, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-word)[💡 શું તમે જાણો છો? (રિઝ્યુમે હકીકત)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[HR રિક્રુટર કોઈપણ રિઝ્યુમેને સરેરાશ ફક્ત *7.4 સેકન્ડ* જુએ છે! ચોખ્ખા 1-ઇંચ માર્જિન, Heading Styles અને ક્લિકેબલ PDF બુકમાર્ક તમારી પસંદગીની તક બમણી કરે છે.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-મિનિટ પ્રેક્ટિસ: Word ખોલો → 3 હેડિંગ લખો → Ctrl+Alt+1 → References → Table of Contents → F9 દબાવો!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-word)[🔥 "તમારું ચોખ્ખું ડોક્યુમેન્ટ ઇન્ટરવ્યુ રૂમમાં પ્રવેશતા પહેલા જ તમારી ક્ષમતા બતાવી દે છે."]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_word_desk.png", height: 64pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 03: SECTION 2A — EXCEL 365 FORMULAS + SPREADSHEET VISUAL
// =============================================================================
#app-banner("સેક્શન 2A  |  MICROSOFT EXCEL 365 — ફોર્મ્યુલા એન્જિન", "મોડર્ન લુકઅપ, ડાયનેમિક એરે (#SPILL), LET સ્પીડ અને ડેટા ક્લિનિંગ", rtech-excel)

#section-banner(num: "ભાગ 2.1", title: "લાઇવ Excel ગ્રીડ વિઝ્યુઅલ: Dynamic Array Spill અને XLOOKUP કાર્યપદ્ધતિ", color: rtech-excel)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/excel_dynamic_array_grid.png", width: 96%)
  ]
]

#section-banner(num: "ભાગ 2.2", title: "ઓફિસ અને કોલેજ પ્રેક્ટિકલના 20 ટોપ ફોર્મ્યુલા (સાચું સિન્ટેક્સ + ઉદાહરણ + ઉપયોગ)", color: rtech-excel)
#table(
  columns: (1.15fr, 2.3fr, 2.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.5pt,
  text(size: 6.4pt, weight: "bold", fill: white)[નં. · ફંક્શન],
  text(size: 6.4pt, weight: "bold", fill: white)[ફોર્મ્યુલા સિન્ટેક્સ અને ઉદાહરણ],
  text(size: 6.4pt, weight: "bold", fill: white)[આઉટપુટ અને કોલેજ / ઓફિસ ઉપયોગ],
  [#hl-g[01. XLOOKUP]], [`=XLOOKUP(F2, A2:A50, D2:D50, "Missing")`], [#hl-y[VLOOKUP થી શ્રેષ્ઠ!] ડાબે-જમણે ગમે ત્યાં શોધે; નવી કોલમથી ફોર્મ્યુલા તૂટતી નથી.],
  [02. XLOOKUP મલ્ટી-કોલ], [`=XLOOKUP(F2, A:A, B:D)`], [ફક્ત 1 ફોર્મ્યુલાથી Name, Dept અને Salary ત્રણેય કોલમ ઓટોમેટિક ભરાઈ જાય છે.],
  [#hl-b[03. 2-Way XLOOKUP]], [`=XLOOKUP(R, A2:A6, XLOOKUP(C, B1:F1, B2:F6))`], [રો (Product) અને કોલમ (શહેર) બંને મુજબ રેટ શોધે — GST અને કુરિયર રેટ માટે.],
  [04. રિવર્સ (નીચેથી) સર્ચ], [`=XLOOKUP(ID, A:A, DateCol, , 0, -1)`], [`-1` લખવાથી ડેટા Sort કર્યા વગર સૌથી છેલ્લી (તાજેતરની) એન્ટ્રી તરત મળે છે.],
  [05. INDEX + MATCH], [`=INDEX(D2:D99, MATCH(F2, A2:A99, 0))`], [જૂના Excel (2016/2019) માં પણ ચાલે છે. ઇન્ટરવ્યુમાં XLOOKUP સાથે પૂછાય છે.],
  [06. VLOOKUP + IFERROR], [`=IFERROR(VLOOKUP(F2, A:D, 3, 0), "N/A")`], [જૂની કંપનીઓનું મુખ્ય ફોર્મ્યુલા. હંમેશા `0`/`FALSE` અને `IFERROR` સાથે વાપરો.],
  [#hl-g[07. FILTER]], [`=FILTER(A2:D99, B2:B99="Paid", "None")`], [શરત મુજબની બધી રો ઓટોમેટિક અલગ તારવે છે (બાકી ફી લિસ્ટ માટે બેસ્ટ).],
  [08. SORT + UNIQUE], [`=SORT(UNIQUE(A2:A99))`], [ડુપ્લિકેટ કાઢી A થી Z ક્રમમાં લાઇવ લિસ્ટ બનાવે — ડ્રોપડાઉન સોર્સ માટે શ્રેષ્ઠ.],
  [09. SEQUENCE], [`=SEQUENCE(10, 1, 1001, 1)`], [1001 થી 1010 સુધી ઓટોમેટિક બિલ નંબર કે રોલ નંબર સીરીઝ તરત બનાવે છે.],
  [#hl-b[10. LET (5x સ્પીડ)]], [`=LET(r,D2:D9, c,E2:E9, m,(r-c)/r, IF(m>0.2,"Hi","Lo"))`], [#hl-y[500% ઝડપી ગણતરી!] મોટી રેન્જને વેરિએબલ નામ આપી વારંવાર ગણતરી અટકાવે છે.],
  [11. SUMIFS], [`=SUMIFS(Sales, Reg, "West", Yr, 2027)`], [સરવાળાની રેન્જ હંમેશા પ્રથમ આવે! માસિક GST અને બ્રાન્ચ સેલ રિપોર્ટ માટે.],
  [12. COUNTIFS / AVGIFS], [`=COUNTIFS(Dept,"IT", Salary,">40000")`], [એક સાથે અનેક શરતો મુજબ ગણતરી કે સરેરાશ કાઢવા — કોલેજ અને HR માટે.],
  [13. IFS (ગ્રેડિંગ)], [`=IFS(A2>=75,"Dist", A2>=60,"1st", TRUE,"Pass")`], [માર્કશીટ ગ્રેડ કે બોનસ સ્લેબ બનાવવાની સૌથી સરળ રીત.],
  [14. TEXTSPLIT], [`=TEXTSPLIT(A2, ",", ";")`], [કોમા કે સેમિકોલન વાળા ટેક્સ્ટને તરત અલગ કોલમ અને રો માં વહેંચે છે.],
  [15. TEXTBEFORE/AFTER], [`=TEXTBEFORE(A2,"@")` / `=TEXTAFTER(A2,"@")`], [ઇમેઇલ ID માંથી યુઝરનેમ અને કંપની ડોમેન 1 સેકન્ડમાં અલગ કરે છે.],
  [16. TRIM + CLEAN], [`=TRIM(CLEAN(A2))`], [Tally કે સોફ્ટવેરના ડેટામાંથી વધારાની સ્પેસ અને છુપા ચિહ્નો તરત સાફ કરે છે.],
  [17. TEXTJOIN], [`=TEXTJOIN(", ", TRUE, A2:A10)`], [ખાલી સેલ છોડીને (`TRUE`) બધા નામોને કોમા સાથે એક જ સેલમાં જોડે છે.],
  [18. TEXT ફોર્મેટ], [`=TEXT(A2, "DD-MMM-YYYY")`], [ટેક્સ્ટ સાથે તારીખ (`25-Nov-2027`) જોડતી વખતે તારીખને નંબર બનતા અટકાવે છે.],
  [19. DATEDIF & WORKDAYS], [`=DATEDIF(DOB,TODAY(),"Y")` / `=NETWORKDAYS(A2,B2)`], [કર્મચારીની ઉંમર/અનુભવ (વર્ષ) અને શનિ-રવિ સિવાયના કામના દિવસો ગણે છે.],
  [20. ROUND (GST બિલ)], [`=ROUND(Amt*0.18, 2)` / `=ROUNDUP(A2, 0)`], [18% GST ને ચોક્કસ 2 દશાંશ (પૈસા) સુધી રાઉન્ડ કરવા અને બિલિંગ સ્લેબ માટે.],
  [#hl-b[21. PMT (લોન EMI)]], [`=PMT(9%/12, 60, -500000)`], [તાત્કાલિક ₹ માસિક EMI ગણવા માટે (વ્યાજ/12, મહિના, `-લોન`). બેંકિંગ અને ફાઇનાન્સ માટે ખાસ.],
  [22. SUMPRODUCT], [`=SUMPRODUCT(Qty, Price)`], [અલગ Total કોલમ બનાવ્યા વગર સીધું જથ્થો × ભાવ ગણી સરવાળો કરે — બિલિંગ અને માર્કશીટ માટે.],
  [23. EOMONTH], [`=EOMONTH(InvDate, 0)` / `=EOMONTH(D2, 1)+20`], [મહિનાની છેલ્લી તારીખ અથવા આવતા મહિનાની GSTR-3B છેલ્લી તારીખ (20 તારીખ) શોધે છે!],
  [#hl-g[24. AGGREGATE]], [`=AGGREGATE(9, 6, D2:D100)`], [`9`=SUM, `6`=`#N/A`/`#DIV/0!` એરર છોડીને સરવાળો! ખરાબ ડેટામાં પણ ક્યારેય અટકતું નથી.],
)
#v(2.5pt)
#box(width: 100%, fill: rgb("#DCFCE7"), stroke: 0.7pt + rtech-excel, radius: 3pt, inset: (x: 6pt, y: 3.5pt))[
  #text(size: 6.4pt, weight: "bold", fill: rgb("#166534"))[★ ડાયનેમિક સ્પિલ પ્રો ટિપ (\# ઓપરેટર): જો `=UNIQUE(A2:A100)` સેલ `G2` થી નીચે ઓટો-સ્પિલ થતું હોય, તો બદલાતી રેન્જ માટે ગમે ત્યાં `=COUNTA(G2#)` કે `=SORT(G2#)` લખો! · 📥 ફ્રી પ્રેક્ટિસ ફાઇલ: #link("https://rtechlab.com/downloads/Office-365-Practice-Lab.xlsx")[*rtechlab.com/downloads/Office-365-Practice-Lab.xlsx*]]
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#F0FDF4"),
  stroke: (left: 3.5pt + rtech-excel, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-excel)[💡 શું તમે જાણો છો? (કરિયર હકીકત)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[ભારતમાં *82% MIS, એકાઉન્ટ્સ અને ડેટા જોબ ઇન્ટરવ્યુ* પહેલા રાઉન્ડમાં જ `XLOOKUP`, `SUMIFS` અને `IFERROR` પૂછે છે! `LET()` ફોર્મ્યુલા 5x ઝડપી ચાલે છે.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-મિનિટ પ્રેક્ટિસ: 5 લાઇન (ID/Name/Salary) લખો → `=XLOOKUP(E2, A2:A6, B2:D6)` નાખી 3 કોલમ સ્પિલ જુઓ!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-excel)[🔥 "એકવાર Excel લોજિક શીખી લો—પછી ફોર્મ્યુલા તમારા માટે કામ કરશે જ્યારે બીજા મેન્યુઅલ ટાઇપ કરશે."]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_excel_desk.png", height: 64pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 04: SECTION 2B — POWER QUERY ETL, ERROR DOCTOR & PIVOT MIS
// =============================================================================
#app-banner("સેક્શન 2B  |  MICROSOFT EXCEL 365 — ઓટોમેશન, પિવટ અને એરર ઉકેલ", "Power Query ETL · 7 એરર ઉકેલ · પિવટ MIS · ભારતીય ₹ ફોર્મેટ", rtech-excel)

#section-banner(num: "ભાગ 2.3", title: "Power Query (ETL): 6-સ્ટેજ ઓટોમેશન (કોડિંગ વગર 5 કલાકનો રિપોર્ટ 5 સેકન્ડમાં!)", color: rtech-blue)
#table(
  columns: (0.45fr, 1.25fr, 2.3fr, 2fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
  inset: 3.1pt,
  text(size: 6.6pt, weight: "bold", fill: white)[સ્ટેપ],
  text(size: 6.6pt, weight: "bold", fill: white)[પ્રક્રિયા (Action)],
  text(size: 6.6pt, weight: "bold", fill: white)[Excel ની અંદર શું સેટ કરવું],
  text(size: 6.6pt, weight: "bold", fill: white)[ઓફિસ / કોલેજમાં ફાયદો],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[01]]], [#text(weight: "bold", fill: rtech-blue)[Extract (ડેટા જોડો)]], [Data → Get Data → From Folder / CSV / SQL / PDF.], [30 અલગ બ્રાન્ચ ફાઇલો ઓટોમેટિક 1 ટેબલમાં ભેગી થઈ જાય છે.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[02]]], [#text(weight: "bold", fill: rtech-blue)[Promote અને ફિલ્ટર]], [Use First Row as Headers; ખાલી અને સબ-ટોટલ રો અનચેક કરો.], [દર મહિને હાથથી વધારાની લાઇનો કાઢવાની મહેનત હંમેશા માટે બંધ.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[03]]], [#text(weight: "bold", fill: rtech-blue)[#hl-y[Unpivot Columns]]], [ID કોલમ પસંદ કરો → Right-Click → #hl-g[Unpivot Other Columns].], [\#1 MNC ઇન્ટરવ્યુ સ્કિલ! Jan–Dec પહોળા ટેબલને Pivot-રેડી બનાવે છે.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[04]]], [#text(weight: "bold", fill: rtech-blue)[ક્લિન અને ડેટા ટાઇપ]], [Transform → Trim સ્પેસ; Date / ₹ Currency / Whole Number સેટ કરો.], [આગળની ગણતરીમાં `#VALUE!` એરર આવવાની શક્યતા ઝીરો!],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[05]]], [#text(weight: "bold", fill: rtech-blue)[Merge Queries]], [Home → Merge Queries → Left Outer Join (Sales + CustomerID).], [લાખો લાઇનો પર ધીમા VLOOKUP નો સૌથી ઝડપી અને ઓટોમેટિક વિકલ્પ.],
  [#box(fill: rtech-navy, inset: (x: 3pt, y: 1.5pt), radius: 2pt)[#text(fill: white, weight: "black", size: 6.2pt)[06]]], [#text(weight: "bold", fill: rtech-blue)[Close & Load]], [Sheet કે Data Model માં લોડ કરો. આવતા મહિને ફક્ત #hl-y[Refresh All] દબાવો.], [5 કલાકનું માસિક રિપોર્ટિંગ કામ ફક્ત 5 સેકન્ડમાં પૂરું!],
)

#section-banner(num: "ભાગ 2.4", title: "Excel એરર ડોક્ટર (10-સેકન્ડમાં ઉકેલ) અને 5-સ્ટેપ પિવટ MIS ડેશબોર્ડ", color: rtech-ppt)
#table(
  columns: (0.75fr, 2.35fr, 2.9fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3pt,
  text(size: 6.6pt, weight: "bold", fill: white)[એરર],
  text(size: 6.6pt, weight: "bold", fill: white)[મુખ્ય કારણ (કેમ આવે છે?)],
  text(size: 6.6pt, weight: "bold", fill: white)[10-સેકન્ડમાં ઠીક કરવાની રીત],
  [#text(weight: "bold", fill: rtech-ppt)[`#N/A`]], [શોધવાની ID નથી અથવા નામ પાછળ ખાલી સ્પેસ રહી ગઈ છે.], [`=TRIM()` વાપરો, ટેક્સ્ટ/નંબર મેચ કરો, અને `=IFERROR(..., "New")` લગાવો.],
  [#text(weight: "bold", fill: rtech-ppt)[`#VALUE!`]], [ટેક્સ્ટ વાળા સેલમાં સરવાળો/બાદબાકી (જેમ કે `"₹500"` + `100`).], [આંકડા આગળથી ટેક્સ્ટ કાઢો અથવા `A1+A2` ની જગ્યાએ `=SUM(A1:A5)` લખો.],
  [#text(weight: "bold", fill: rtech-ppt)[`#REF!`]], [ફોર્મ્યુલા જે કોલમ કે રો સાથે જોડાયેલ હતું તે ડિલીટ થઈ ગઈ.], [તરત #kbd[Ctrl+Z] દબાવો અથવા તૂટેલ સેલ રેફરન્સ ફરી પસંદ કરો.],
  [#text(weight: "bold", fill: rtech-ppt)[`#DIV/0!`]], [કોઈપણ સંખ્યાને 0 કે ખાલી સેલ વડે ભાગવાનો (Divide) પ્રયાસ.], [ફોર્મ્યુલાને `=IFERROR(Profit/Sales, 0)` માં લખી દો.],
  [#text(weight: "bold", fill: rtech-ppt)[`#NAME?`]], [ફોર્મ્યુલાની સ્પેલિંગ ખોટી (`=XLOKUP`) કે ટેક્સ્ટમાં કોટ્સ નથી.], [સ્પેલિંગ તપાસો; શબ્દોની આજુબાજુ ડબલ કોટ્સ `"Delhi"` જરૂર લગાવો.],
  [#text(weight: "bold", fill: rtech-ppt)[`#SPILL!`]], [ડાયનેમિક ફોર્મ્યુલાની નીચે ખુલવાની જગ્યામાં કોઈ ડેટા નડે છે.], [બ્લુ ડોટેડ બોક્સમાંથી જૂનો ટેક્સ્ટ કે મર્જ સેલ દૂર કરો.],
  [#text(weight: "bold", fill: rtech-ppt)[`#####`]], [કોલમની પહોળાઈ ઓછી છે અથવા તારીખની બાદબાકી માઇનસમાં છે.], [કોલમ પહોળી કરવા #kbd[Alt+H+O+I] દબાવો; તારીખનો ક્રમ ચકાસો.],
)

#section-banner(num: "MIS PRO", title: "ભાગ 2.5 · 5-સ્ટેપ પિવટ MIS અને ભારતીય ₹ ફોર્મેટ", color: rtech-excel)
#table(
  columns: (1.25fr, 4.75fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3pt,
  [#text(weight: "bold", fill: rtech-excel)[1 · #hl-g[Smart Table]]], [ડેટા પર #kbd[Ctrl+T] દબાવો → નવો ડેટા ઉમેરતા પિવટ ઓટોમેટિક અપડેટ થશે.],
  [#text(weight: "bold", fill: rtech-excel)[2 · Pivot Table]], [#kbd[Alt+N+V] દબાવો → Region ને Rows માં અને Sales ને Values માં ખેંચો.],
  [#text(weight: "bold", fill: rtech-excel)[3 · Slicer બટન]], [Pivot Analyze → Insert Slicer (વર્ષ/વિભાગ) થી ક્લિકેબલ ડેશબોર્ડ બનાવો.],
  [#text(weight: "bold", fill: rtech-excel)[4 · ભારતીય ₹ ફોર્મેટ]], [#kbd[Ctrl+1] → Custom માં #hl-b[`"₹ "##,##,##0`] નાખો (લાખ/કરોડ કોમા માટે)!],
  [#text(weight: "bold", fill: rtech-excel)[5 · Freeze Panes]], [B2 સેલ પસંદ કરી #kbd[Alt+W+F+F] દબાવો — સ્ક્રોલ કરતી વખતે હેડિંગ લોક રહેશે.],
  [#text(weight: "bold", fill: rtech-excel)[6 · Dropdown લિસ્ટ]], [#kbd[Alt+A+V+V] → List પસંદ કરો — શેર્ડ શીટમાં ખોટી સ્પેલિંગ અટકી જશે.],
)

#section-banner(num: "ભાગ 2.6", title: "લાઇવ ઓફિસ કેસ સ્ટડી + ટોપ 4 કન્ડિશનલ ફોર્મેટિંગ અને શીટ લોક નિયમો", color: rtech-navy)
#table(
  columns: (1.45fr, 4.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 3.2pt,
  [#text(weight: "bold", fill: rtech-navy)[#hl-y[લાઇવ કેસ: GST અને સેલ MIS]]], [1) Tally/બિલિંગમાંથી માસિક CSV લો → 2) Power Query (`Unpivot` + `Trim`) થી સાફ કરો → 3) `XLOOKUP` થી પાર્ટી GSTIN લાવો → 4) `Ctrl+T` પિવટ + Slicer બનાવો → 5) 1-પેજ PDF મોકલો!],
  [#text(weight: "bold", fill: rtech-navy)[1. ડુપ્લિકેટ બિલ પકડો]], [Invoice કોલમ પસંદ કરો → #kbd[Alt+H+L+H+D] દબાવો — ડુપ્લિકેટ બિલ નંબર તરત લાલ દેખાશે!],
  [#text(weight: "bold", fill: rtech-navy)[2. ટ્રાફિક લાઇટ KPI કલર]], [Conditional Formatting → Icon Sets (લીલો/પીળો/લાલ) થી ટાર્ગેટ % ને વિઝ્યુઅલ બનાવો.],
  [#text(weight: "bold", fill: rtech-navy)[3. ફોર્મ્યુલા લોક, ઇનપુટ ખુલ્લું]], [પીળા ઇનપુટ સેલ પસંદ કરો → #kbd[Ctrl+1] → Protection → 'Locked' અનચેક કરો → Review → Protect Sheet!],
  [#text(weight: "bold", fill: rtech-navy)[4. ખોટી એન્ટ્રી એલર્ટ બોક્સ]], [Data Validation (#kbd[Alt+A+V+V]) → Custom `=A2>18` અને પોપઅપ એરર મેસેજ સેટ કરો.],
)
#v(2pt)
#box(width: 100%, fill: rgb("#EFF6FF"), stroke: 0.65pt + rtech-blue, radius: 2.5pt, inset: (x: 6pt, y: 2.5pt))[
  #text(size: 6.2pt, weight: "bold", fill: rtech-blue)[📥 ફ્રી પ્રેક્ટિસ ફાઇલ: #link("https://rtechlab.com/downloads/Office-365-Practice-Lab.xlsx")[*rtechlab.com/downloads/Office-365-Practice-Lab.xlsx*]]
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#F0FDF4"),
  stroke: (left: 3.5pt + rtech-excel, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-excel)[💡 શું તમે જાણો છો? (ઓટોમેશન હકીકત)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[Power Query દર અઠવાડિયે ઓફિસ એનાલિસ્ટના *6+ કલાક* બચાવે છે! એકવાર `Unpivot` સેટ કર્યા પછી આવતા મહિને 1 ક્લિકમાં આખો રિપોર્ટ 5 સેકન્ડમાં તૈયાર થાય છે.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-મિનિટ પ્રેક્ટિસ: ડેટા પસંદ કરો → `Ctrl+T` → `Alt+N+V` (Pivot) → Dept ને Rows અને Sales ને Values માં ખેંચો.]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-excel)[🔥 "રવિવારે શીટ સુધારવામાં સમય ન બગાડો—Power Query થી કામ ઓટોમેટ કરી આગળ વધો!"]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_excel_desk.png", height: 80pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 05: SECTION 3 — POWERPOINT 365 (SLIDE MASTER, MORPH & PITCH DECK)
// =============================================================================
#app-banner("સેક્શન 3  |  MICROSOFT POWERPOINT 365", "કોર્પોરેટ પિચ ડેક, સ્લાઇડ માસ્ટર બ્રાન્ડ લોક અને સિનેમેટિક Morph એનિમેશન", rtech-ppt)

#section-banner(num: "ભાગ 3.1", title: "Slide Master + Morph બ્લુપ્રિન્ટ (સામાન્ય વિદ્યાર્થી vs કોર્પોરેટ એક્સપર્ટ)", color: rtech-ppt)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/powerpoint_slide_master_morph.png", width: 96%)
  ]
]

#section-banner(num: "ભાગ 3.2", title: "પ્રોફેશનલ સ્લાઇડ નિયમો અને કોલેજ વાઇવા / કંપની પિચ માટે 5-સ્લાઇડ ફોર્મ્યુલા", color: rtech-ppt)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 3pt,
  text(size: 6.5pt, weight: "bold", fill: white)[ડિઝાઇન / સ્ટ્રક્ચર નિયમ],
  text(size: 6.5pt, weight: "bold", fill: white)[MNC એક્સપર્ટ રીત (જોબ અને A+ ગ્રેડ મેળવો)],
  text(size: 6.5pt, weight: "bold", fill: white)[આ સામાન્ય ભૂલો ક્યારેય ન કરો],
  [#hl-o[1. Slide Master લોક]], [View → Slide Master ની ટોચની માસ્ટર સ્લાઇડ પર લોગો, ફોન્ટ અને કલર એક જ વાર સેટ કરો. બધી સ્લાઇડમાં આવી જશે!], [દરેક સ્લાઇડ પર હાથથી લોગો કોપી-પેસ્ટ કરવો—જેનાથી સ્લાઇડ બદલતા લોગો હલતો દેખાય છે.],
  [#hl-b[2. Morph (`!!ObjName`)]], [સ્લાઇડ ડુપ્લિકેટ કરો → ઓબ્જેક્ટની સાઇઝ/જગ્યા બદલો → Transitions → Morph. Selection Pane (#kbd[Alt+F10]) માં `!!Logo` નામ આપો.], [દરેક બુલેટ પોઈન્ટ પર ઉડતા અને ફરતા ભડકીલા એનિમેશન લગાવવા.],
  [#hl-y[3. 16:9 વાઇડસ્ક્રીન + 6x6]], [હંમેશા Design → 16:9 Widescreen રાખો. દરેક સ્લાઇડ પર વધુમાં વધુ 6 લાઇન અને 6 શબ્દો લખો — આખો નિબંધ નહીં!], [Word નો આખો ફકરો સ્લાઇડ પર મૂકી પ્રોજેક્ટરમાંથી જોઈ-જોઈને વાંચવું.],
  [4. પિક્સેલ અલાઇન અને કલર], [ઓબ્જેક્ટ પસંદ કરી #kbd[Alt+H+G+A] (Align) અને #kbd[Alt+H+G+H] (સરખું અંતર) દબાવો; Eyedropper થી લોગો કલર લો.], [અંદાજે બોક્સ ગોઠવવા જેનાથી ચાર્ટ્સ આડા-અવળા અને બિનવ્યાવસાયિક દેખાય.],
  [#hl-g[5. 5-સ્લાઇડ પિચ માળખું]], [\#1 શીર્ષક અને હેતુ · \#2 સમસ્યા અને ડેટા · \#3 સોલ્યુશન આર્કિટેક્ચર · \#4 લાઇવ ડેમો / ફાયદો · \#5 પ્લાન અને Q&A.], [મુખ્ય કામ બતાવ્યા વગર 10 સ્લાઇડ સુધી બિનજરૂરી ઇતિહાસ બતાવવો.],
  [6. Presenter View અને કમ્પ્રેસ], [લેપટોપ પર તમારા સ્પીકર નોટ્સ અને ટાઇમર જુઓ (#kbd[Alt+F5]). મોકલતા પહેલા File → Info → Compress Media થી MB ઘટાડો.], [WhatsApp પર 120MB ની ભારે ફાઇલ મોકલવી કે હાથમાં કાગળની ચિઠ્ઠી લઈને વાંચવું.],
)

#section-banner(num: "ભાગ 3.3", title: "લાઇવ પ્રેઝન્ટેશન કંટ્રોલ કીઝ (તમામ 33 PPT શોર્ટકટ પાના 6 પર આપેલા છે!)", color: rtech-ppt)
#table(
  columns: (1.05fr, 1.95fr, 1.05fr, 1.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  inset: 2.8pt,
  [#kbd[F5 / Shift+F5]], [શરૂથી / હાલની સ્લાઇડથી શો ચલાવો],
  [#kbd[B / W]], [#hl-o[Q&A દરમિયાન સ્ક્રીન બ્લેક / વ્હાઇટ કરો]],
  [#kbd[Ctrl+L / Ctrl+P]], [#hl-y[લાઇવ લાલ લેઝર પોઇન્ટર / પેન વાપરો]],
  [#kbd[Number + Enter]], [જેમ કે `5+Enter` દબાવી સીધા 5મી સ્લાઇડ પર જાઓ],
)

#section-banner(num: "ભાગ 3.4", title: "કોલેજ વાઇવા અને કંપની ક્લાયન્ટ મીટિંગ જીતવાનું 5-સ્લાઇડ સચોટ ફોર્મ્યુલા", color: rtech-navy)
#table(
  columns: (0.7fr, 1.8fr, 2.85fr, 0.65fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (col, row) => if col in (0, 3) { center + horizon } else { left + horizon },
  inset: 2.6pt,
  text(size: 6.4pt, weight: "bold", fill: white)[સ્લાઇડ],
  text(size: 6.4pt, weight: "bold", fill: white)[શીર્ષક અને મુખ્ય હેતુ],
  text(size: 6.4pt, weight: "bold", fill: white)[સ્લાઇડ પર શું વિઝ્યુઅલ મૂકવું],
  text(size: 6.4pt, weight: "bold", fill: white)[સમય],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 1]], [દમદાર શીર્ષક + તમારું નામ/ટીમ], [ચોખ્ખું 16:9 ડાર્ક કવર + 1-લાઇનમાં પ્રોજેક્ટની મુખ્ય વેલ્યુ.], [#text(weight: "bold", fill: rtech-navy)[30 sec]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 2]], [અસલી સમસ્યા (કેમ જરૂરી છે?)], [3 મોટા આંકડા (દા.ત. `42% સમય બચત`) + સમસ્યા આઇકન.], [#text(weight: "bold", fill: rtech-navy)[1 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 3]], [તમારું સોલ્યુશન અને આર્કિટેક્ચર], [SmartArt (`Alt+N+M`) વર્કફ્લો કે ડાયાગ્રામ — મહત્તમ 6 બુલેટ.], [#text(weight: "bold", fill: rtech-navy)[1.5 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 4]], [લાઇવ ડેમો / Excel ડેટા પ્રૂફ], [લિંક્ડ Excel ચાર્ટ (`Ctrl+V` → Keep Formatting) + Morph ઝૂમ.], [#text(weight: "bold", fill: rtech-navy)[2 min]],
  [#text(weight: "bold", fill: rtech-ppt)[Slide 5]], [ફાયદો / નિષ્કર્ષ અને Q&A], [પહેલા vs પછી (Before vs After) ટેબલ + QR લિંક. Q&A માં #kbd[B] દબાવો!], [#text(weight: "bold", fill: rtech-navy)[1 min]],
)
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#FFF7ED"),
  stroke: (left: 3.5pt + rtech-ppt, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-ppt)[💡 શું તમે જાણો છો? (વાઇવા અને પિચ હકીકત)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[માનવ મગજ લખાણ કરતા *60,000 ગણી ઝડપે* વિઝ્યુઅલ્સ સમજે છે! Slide Master + `!!Morph` + 6x6 નિયમ તમારી કોલેજ PPT ને CEO-લેવલ બનાવે છે.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-મિનિટ પ્રેક્ટિસ: Slide 1 ડુપ્લિકેટ કરો → Slide 2 પર બોક્સ મોટું કરો → Transitions → Morph → `Shift+F5` દબાવો!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-ppt)[🔥 "સારી સ્લાઇડ્સ વક્તાનું સ્થાન નથી લેતી—તે તમારા આત્મવિશ્વાસને બમણો કરે છે."]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_ppt_stage.png", height: 76pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 06: ★ THE 150 PRODUCTION SHORTCUTS MASTER WALL (ALL ON ONE PAGE!) ★
// Word (001-045) + Excel (046-117) + PowerPoint (118-150) — Zero Blank Cells!
// =============================================================================
#app-banner("★  150 પ્રોડક્શન શોર્ટકટ્સ માસ્ટર વોલ (એક પેજ પોસ્ટર)  ★", "પ્રિન્ટ કરી કીબોર્ડ પાસે લગાવો · Word (45) + Excel (72) + PowerPoint (33)", rtech-navy)

// Band 1: WORD (45 shortcuts = 15 rows x 3 pairs)
#block(width: 100%, fill: rtech-word, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[W  |  સેક્શન A : MICROSOFT WORD 365 — 45 મુખ્ય ડોક્યુમેન્ટ અને થીસીસ શોર્ટકટ (001 – 045)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F8FAFC") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("001", rtech-word) #kbd[Ctrl + B / I / U]], [#hl-y[બોલ્ડ / ઇટાલિક / અન્ડરલાઇન]],
    [#nb("002", rtech-word) #kbd[Ctrl + E / L / R]], [સેન્ટર / લેફ્ટ / રાઇટ અલાઇન],
    [#nb("003", rtech-word) #kbd[Ctrl + J]], [#hl-g[ફકરો જસ્ટિફાય કરો]],
    [#nb("004", rtech-word) #kbd[Ctrl + 1 / 2 / 5]], [1.0 / 2.0 / 1.5 લાઇન સ્પેસ],
    [#nb("005", rtech-word) #kbd[Ctrl + Shift + >/<]], [ફોન્ટ સાઇઝ વધારો / ઘટાડો],
    [#nb("006", rtech-word) #kbd[Ctrl + \] / \[]], [ફોન્ટ સાઇઝ +/- 1 pt],
    [#nb("007", rtech-word) #kbd[Ctrl + Space]], [#hl-o[બધી ફોર્મેટિંગ સાફ કરો]],
    [#nb("008", rtech-word) #kbd[Ctrl + Q]], [ફકરાની ફોર્મેટિંગ કાઢો],
    [#nb("009", rtech-word) #kbd[Ctrl + Shift + C]], [#hl-b[સ્ટાઇલ કોપી (ફોર્મેટ પેઇન્ટર)]],
    [#nb("010", rtech-word) #kbd[Ctrl + Shift + V]], [#hl-b[કોપી કરેલ સ્ટાઇલ પેસ્ટ કરો]],
    [#nb("011", rtech-word) #kbd[Shift + F3]], [#hl-y[કેસ બદલો (ABC / abc)]],
    [#nb("012", rtech-word) #kbd[Ctrl + Alt + 1/2/3]], [#hl-y[હેડિંગ 1 / 2 / 3 લગાવો]],
    [#nb("013", rtech-word) #kbd[Ctrl + Shift + N]], [નોર્મલ સ્ટાઇલ લાગુ કરો],
    [#nb("014", rtech-word) #kbd[Ctrl + Enter]], [#hl-g[નવો પેજ બ્રેક ઉમેરો]],
    [#nb("015", rtech-word) #kbd[Ctrl + Shift + Enter]], [કોલમ બ્રેક ઉમેરો],
    [#nb("016", rtech-word) #kbd[Ctrl + Shift + Space]], [નોન-બ્રેકિંગ સ્પેસ],
    [#nb("017", rtech-word) #kbd[Ctrl + Shift + -]], [નોન-બ્રેકિંગ હાઇફન],
    [#nb("018", rtech-word) #kbd[Ctrl + F]], [#hl-b[નેવિગેશન પેન ખોલો]],
    [#nb("019", rtech-word) #kbd[Ctrl + H]], [#hl-y[ટેક્સ્ટ શોધો અને બદલો]],
    [#nb("020", rtech-word) #kbd[Ctrl + G / F5]], [સીધા પેજ / લાઇન પર જાઓ],
    [#nb("021", rtech-word) #kbd[Ctrl + K]], [હાઇપરલિંક ઉમેરો],
    [#nb("022", rtech-word) #kbd[F7]], [સ્પેલિંગ અને ગ્રામર તપાસો],
    [#nb("023", rtech-word) #kbd[Shift + F7]], [સમાનાર્થી શબ્દો જુઓ],
    [#nb("024", rtech-word) #kbd[Ctrl + Shift + E]], [#hl-o[ટ્રેક ચેન્જીસ ચાલુ / બંધ]],
    [#nb("025", rtech-word) #kbd[Alt + Ctrl + M]], [રિવ્યુ કોમેન્ટ ઉમેરો],
    [#nb("026", rtech-word) #kbd[Alt + Shift + Up/Dn]], [#hl-g[ફકરો / રો ઉપર-નીચે કરો]],
    [#nb("027", rtech-word) #kbd[Alt + Shift + D / T]], [આજની તારીખ / સમય ઉમેરો],
    [#nb("028", rtech-word) #kbd[Alt + Shift + P]], [પેજ નંબર ઉમેરો],
    [#nb("029", rtech-word) #kbd[F9]], [#hl-y[TOC અને ફીલ્ડ અપડેટ કરો]],
    [#nb("030", rtech-word) #kbd[Alt + F9]], [ફીલ્ડ કોડ્સ જુઓ],
    [#nb("031", rtech-word) #kbd[Ctrl + F9]], [ખાલી ફીલ્ડ કૌંસ ઉમેરો],
    [#nb("032", rtech-word) #kbd[Alt + Ctrl + F / D]], [ફૂટનોટ / એન્ડનોટ ઉમેરો],
    [#nb("033", rtech-word) #kbd[Ctrl + Backspace/Del]], [આગળ/પાછળનો આખો શબ્દ કાઢો],
    [#nb("034", rtech-word) #kbd[Ctrl + M / Shift+M]], [ઇન્ડેન્ટ વધારો / ઘટાડો],
    [#nb("035", rtech-word) #kbd[Ctrl + = / Shift + +]], [સબસ્ક્રિપ્ટ / સુપરસ્ક્રિપ્ટ],
    [#nb("036", rtech-word) #kbd[Ctrl + Shift + L]], [તાત્કાલિક બુલેટ લિસ્ટ],
    [#nb("037", rtech-word) #kbd[Ctrl + Shift + G]], [શબ્દો અને પેજ ગણતરી],
    [#nb("038", rtech-word) #kbd[Ctrl + Shift + 8]], [છુપા ફોર્મેટિંગ ચિહ્નો જુઓ],
    [#nb("039", rtech-word) #kbd[F4 / Ctrl + Y]], [#hl-g[છેલ્લું કામ રિપીટ કરો]],
    [#nb("040", rtech-word) #kbd[Ctrl + Alt + S]], [વિન્ડોને બે ભાગમાં વહેંચો],
    [#nb("041", rtech-word) #kbd[Ctrl + Shift + F8]], [કોલમ મુજબ ટેક્સ્ટ સિલેક્ટ],
    [#nb("042", rtech-word) #kbd[Tab / Shift + Tab]], [ટેબલના આગળ/પાછળ સેલ],
    [#nb("043", rtech-word) #kbd[Alt + F8]], [મેક્રો ડાયલોગ ખોલો],
    [#nb("044", rtech-word) #kbd[Ctrl + F2 / Ctrl + P]], [પ્રિન્ટ પ્રિવ્યૂ / પ્રિન્ટ],
    [#nb("045", rtech-word) #kbd[Ctrl + S / F12]], [#hl-o[સેવ / Save As કરો]],
  )
]
#v(3pt)

// Band 2: EXCEL (72 shortcuts = 24 rows x 3 pairs)
#block(width: 100%, fill: rtech-excel, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[X  |  સેક્શન B : MICROSOFT EXCEL 365 — 72 હાઇ-સ્પીડ એકાઉન્ટિંગ, MIS અને ફોર્મ્યુલા શોર્ટકટ (046 – 117)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F0FDF4") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("046", rtech-excel) #kbd[Ctrl + T]], [#hl-g[ડેટાને સ્માર્ટ ટેબલ બનાવો]],
    [#nb("047", rtech-excel) #kbd[Alt + =]], [#hl-y[તાત્કાલિક AutoSum લગાવો]],
    [#nb("048", rtech-excel) #kbd[Ctrl + E]], [#hl-b[ફ્લેશ ફિલ (ઓટો પેટર્ન)]],
    [#nb("049", rtech-excel) #kbd[Ctrl + Alt + V → V]], [#hl-y[ફક્ત વેલ્યુ પેસ્ટ કરો]],
    [#nb("050", rtech-excel) #kbd[Ctrl + Alt + V → E]], [રો અને કોલમ ટ્રાન્સપોઝ કરો],
    [#nb("051", rtech-excel) #kbd[F4 (in Formula)]], [#hl-o[સેલ લોક (\$A\$1) બદલો]],
    [#nb("052", rtech-excel) #kbd[F4 (in Sheet)]], [છેલ્લી ફોર્મેટિંગ રિપીટ કરો],
    [#nb("053", rtech-excel) #kbd[F2]], [#hl-g[સેલની અંદર ફોર્મ્યુલા એડિટ]],
    [#nb("054", rtech-excel) #kbd[Alt + Enter]], [એક જ સેલમાં નવી લાઇન],
    [#nb("055", rtech-excel) #kbd[Ctrl + D / Ctrl + R]], [નીચે / જમણે ફિલ કરો],
    [#nb("056", rtech-excel) #kbd[Ctrl + Arrow Keys]], [#hl-b[ડેટાની છેલ્લી બાજુ પર જાઓ]],
    [#nb("057", rtech-excel) #kbd[Ctrl + Shift + Arrow]], [#hl-b[ડેટાના છેડા સુધી સિલેક્ટ]],
    [#nb("058", rtech-excel) #kbd[Ctrl + Home / End]], [સેલ A1 / છેલ્લા સેલ પર જાઓ],
    [#nb("059", rtech-excel) #kbd[Shift + Space]], [આખી રો સિલેક્ટ કરો],
    [#nb("060", rtech-excel) #kbd[Ctrl + Space]], [આખો કોલમ સિલેક્ટ કરો],
    [#nb("061", rtech-excel) #kbd[Ctrl + A / Ctrl + \*]], [આખું ડેટા ટેબલ સિલેક્ટ],
    [#nb("062", rtech-excel) #kbd[Ctrl + Shift + +]], [નવી રો / કોલમ ઉમેરો],
    [#nb("063", rtech-excel) #kbd[Ctrl + - (Minus)]], [પસંદ કરેલ રો/કોલમ કાઢો],
    [#nb("064", rtech-excel) #kbd[Ctrl + 9 / Ctrl + 0]], [રો / કોલમ હાઇડ કરો],
    [#nb("065", rtech-excel) #kbd[Ctrl + Shift + 9 / 0]], [છુપી રો / કોલમ બતાવો],
    [#nb("066", rtech-excel) #kbd[Ctrl + 1]], [#hl-y[Format Cells વિન્ડો ખોલો]],
    [#nb("067", rtech-excel) #kbd[Ctrl + Shift + \$]], [કરન્સી (₹) ફોર્મેટ લગાવો],
    [#nb("068", rtech-excel) #kbd[Ctrl + Shift + %]], [ટકાવારી (%) ફોર્મેટ],
    [#nb("069", rtech-excel) #kbd[Ctrl + Shift + \#]], [તારીખ ફોર્મેટ લગાવો],
    [#nb("070", rtech-excel) #kbd[Ctrl + Shift + !]], [કોમા નંબર ફોર્મેટ],
    [#nb("071", rtech-excel) #kbd[Ctrl + 5]], [સ્ટ્રાઇકથ્રુ લાઇન લગાવો],
    [#nb("072", rtech-excel) #kbd[Ctrl + Shift + &]], [સેલની ફરતે બોર્ડર લગાવો],
    [#nb("073", rtech-excel) #kbd[Ctrl + Shift + \_]], [સેલની બોર્ડર હટાવો],
    [#nb("074", rtech-excel) #kbd[Alt + H + O + I]], [#hl-g[કોલમની પહોળાઈ ઓટો-ફિટ]],
    [#nb("075", rtech-excel) #kbd[Alt + H + O + A]], [રો ની ઊંચાઈ ઓટો-ફિટ કરો],
    [#nb("076", rtech-excel) #kbd[Alt + H + M + C]], [સેલ મર્જ અને સેન્ટર કરો],
    [#nb("077", rtech-excel) #kbd[Alt + H + W]], [સેલમાં ટેક્સ્ટ રેપ કરો],
    [#nb("078", rtech-excel) #kbd[Ctrl + Shift + L]], [#hl-y[ફિલ્ટર ચાલુ / બંધ કરો]],
    [#nb("079", rtech-excel) #kbd[Alt + A + C]], [બધા ફિલ્ટર સાફ કરો],
    [#nb("080", rtech-excel) #kbd[Alt + Down Arrow]], [ફિલ્ટર / ડ્રોપડાઉન ખોલો],
    [#nb("081", rtech-excel) #kbd[Alt + N + V]], [#hl-g[તાત્કાલિક પિવટ ટેબલ બનાવો]],
    [#nb("082", rtech-excel) #kbd[Alt + F1]], [#hl-b[એ જ શીટ પર ચार्ट બનાવો]],
    [#nb("083", rtech-excel) #kbd[F11]], [નવી શીટ પર ચાર્ટ બનાવો],
    [#nb("084", rtech-excel) #kbd[Ctrl + ;]], [#hl-y[આજની સ્થિર તારીખ ઉમેરો]],
    [#nb("085", rtech-excel) #kbd[Ctrl + Shift + :]], [હાલનો સ્થિર સમય ઉમેરો],
    [#nb("086", rtech-excel) #kbd[Ctrl + ~ (Tilde)]], [#hl-o[બધા ફોર્મ્યુલા એકસાથે જુઓ]],
    [#nb("087", rtech-excel) #kbd[Ctrl + \[]], [ફોર્મ્યુલાના મૂળ સેલ જુઓ],
    [#nb("088", rtech-excel) #kbd[Ctrl + \]]], [આધારિત ફોર્મ્યુલા જુઓ],
    [#nb("089", rtech-excel) #kbd[Shift + F3]], [ફંક્શન વિઝાર્ડ ખોલો],
    [#nb("090", rtech-excel) #kbd[Alt + M + V]], [ફોર્મ્યુલા સ્ટેપ બાય સ્ટેપ],
    [#nb("091", rtech-excel) #kbd[Ctrl + Shift + U]], [ફોર્મ્યુલા બાર મોટો/નાનો કરો],
    [#nb("092", rtech-excel) #kbd[F9 / Shift + F9]], [ફોર્મ્યુલા ફરી ગણતરી કરો],
    [#nb("093", rtech-excel) #kbd[Ctrl + PgDn / PgUp]], [આગળ / પાછળની શીટ પર જાઓ],
    [#nb("094", rtech-excel) #kbd[Shift + F11]], [નવી વર્કશીટ ઉમેરો],
    [#nb("095", rtech-excel) #kbd[Alt + H + O + R]], [શીટનું નામ બદલો],
    [#nb("096", rtech-excel) #kbd[Alt + W + F + F]], [#hl-g[હેડર રો/કોલમ ફ્રીઝ કરો]],
    [#nb("097", rtech-excel) #kbd[Alt + W + VG]], [ગ્રીડલાઇન બતાવો/છુપાવો],
    [#nb("098", rtech-excel) #kbd[Shift + F2]], [સેલ નોટ / કોમેન્ટ ઉમેરો],
    [#nb("099", rtech-excel) #kbd[Ctrl + Alt + M]], [થ્રેડેડ કોમેન્ટ ઉમેરો],
    [#nb("100", rtech-excel) #kbd[Alt + Shift + Right]], [રો / કોલમ ગ્રુપ બનાવો],
    [#nb("101", rtech-excel) #kbd[Alt + Shift + Left]], [રો / કોલમ અનગ્રુપ કરો],
    [#nb("102", rtech-excel) #kbd[Alt + A + M]], [#hl-y[ડુપ્લિકેટ ડેટા દૂર કરો]],
    [#nb("103", rtech-excel) #kbd[Alt + A + E]], [ટેક્સ્ટ ટુ કોલમ્સ વિઝાર્ડ],
    [#nb("104", rtech-excel) #kbd[Alt + A + V + V]], [#hl-b[ડેટા વેલિડેશન ડ્રોપડાઉન]],
    [#nb("105", rtech-excel) #kbd[Alt + A + R + A]], [#hl-g[બધા ડેટા અને પિવટ રિફ્રેશ]],
    [#nb("106", rtech-excel) #kbd[Alt + H + L]], [કન્ડિશનલ ફોર્મેટિંગ મેનુ],
    [#nb("107", rtech-excel) #kbd[Ctrl + K]], [હાઇપરલિંક ઉમેરો],
    [#nb("108", rtech-excel) #kbd[Ctrl + F3]], [નેમ મેનેજર ખોલો],
    [#nb("109", rtech-excel) #kbd[Ctrl + Shift + F3]], [હેડરથી રેન્જ નામ બનાવો],
    [#nb("110", rtech-excel) #kbd[Alt + ;]], [#hl-o[ફક્ત દેખાતા સેલ સિલેક્ટ]],
    [#nb("111", rtech-excel) #kbd[F5 → Alt + S → K]], [ખાલી સેલ સિલેક્ટ કરો],
    [#nb("112", rtech-excel) #kbd[Ctrl + Enter]], [#hl-y[બધા પસંદ કરેલ સેલમાં ભરો]],
    [#nb("113", rtech-excel) #kbd[Ctrl + F1]], [રિબન હાઇડ / શો કરો],
    [#nb("114", rtech-excel) #kbd[Ctrl + P / F12]], [પ્રિન્ટ / Save As કરો],
    [#nb("115", rtech-excel) #kbd[Ctrl + PageUp/Dn]], [વર્કશીટ ટેબ બદલો],
    [#nb("116", rtech-excel) #kbd[Ctrl + Tab]], [ખુલ્લી એક્સેલ ફાઇલો બદલો],
    [#nb("117", rtech-excel) #kbd[Ctrl + W / Alt+F4]], [ફાઇલ / એક્સેલ બંધ કરો],
  )
]
#v(3pt)

// Band 3: POWERPOINT (33 shortcuts = 11 rows x 3 pairs)
#block(width: 100%, fill: rtech-ppt, inset: (x: 5pt, y: 2.2pt), radius: (top: 2pt))[
  #text(size: 6.8pt, weight: "black", fill: white)[P  |  સેક્શન C : MICROSOFT POWERPOINT 365 — 33 ડિઝાઇન અને પ્રેઝેન્ટર શોર્ટકટ (118 – 150)]
]
#block(width: 100%)[
  #set text(size: 6.2pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#FFF7ED") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2.2pt),
    [#nb("118", rtech-ppt) #kbd[Ctrl + M]], [#hl-y[નવી સ્લાઇડ ઉમેરો]],
    [#nb("119", rtech-ppt) #kbd[Ctrl + D]], [#hl-g[સ્લાઇડ કે આકાર ડુપ્લિકેટ]],
    [#nb("120", rtech-ppt) #kbd[Ctrl + G]], [#hl-b[બધા આકારોને ગ્રુપ કરો]],
    [#nb("121", rtech-ppt) #kbd[Ctrl + Shift + G]], [ગ્રુપ કરેલા આકાર અલગ કરો],
    [#nb("122", rtech-ppt) #kbd[Ctrl + Shift + C/V]], [ઓબ્જેક્ટ સ્ટાઇલ કોપી/પેસ્ટ],
    [#nb("123", rtech-ppt) #kbd[Ctrl + Drag Mouse]], [ડ્રેગ કરીને ઝડપી કોપી કરો],
    [#nb("124", rtech-ppt) #kbd[Shift + Drag]], [સમાન રેશિયોમાં સાઇઝ બદલો],
    [#nb("125", rtech-ppt) #kbd[Alt + Arrow Keys]], [#hl-y[ઓબ્જેક્ટને 1px ખસેડો]],
    [#nb("126", rtech-ppt) #kbd[Alt + H + G + A]], [#hl-g[ઓબ્જેક્ટ સેન્ટર અલાઇન કરો]],
    [#nb("127", rtech-ppt) #kbd[Alt + H + G + H/V]], [આકારો વચ્ચે સરખું અંતર],
    [#nb("128", rtech-ppt) #kbd[Alt + F10]], [#hl-b[સિલેક્શન પેન ખોલો]],
    [#nb("129", rtech-ppt) #kbd[Ctrl + \] / \[]], [ટેક્સ્ટ સાઇઝ વધારો/ઘટાડો],
    [#nb("130", rtech-ppt) #kbd[Alt + Shift + L/R]], [બુલેટ લેવલ બદલો],
    [#nb("131", rtech-ppt) #kbd[Alt + Shift + Up/Dn]], [બુલેટ પોઈન્ટ ઉપર/નીચે],
    [#nb("132", rtech-ppt) #kbd[Ctrl + Up / Down]], [સ્લાઇડનો ક્રમ ઉપર/નીચે કરો],
    [#nb("133", rtech-ppt) #kbd[Ctrl + Home / End]], [પહેલી/છેલ્લી સ્લાઇડ પર જાઓ],
    [#nb("134", rtech-ppt) #kbd[F6 / Tab]], [સ્લાઇડના ભાગો પર જાઓ],
    [#nb("135", rtech-ppt) #kbd[Alt + N + P]], [સ્લાઇડમાં ફોટો ઉમેરો],
    [#nb("136", rtech-ppt) #kbd[Alt + J + P + X]], [#hl-o[ફોટોનું બેકગ્રાઉન્ડ હટાવો]],
    [#nb("137", rtech-ppt) #kbd[Ctrl + K]], [હાઇપરલિંક ઉમેરો],
    [#nb("138", rtech-ppt) #kbd[Alt + W + L / M]], [નોર્મલ / સ્લાઇડ માસ્ટર વ્યૂ],
    [#nb("139", rtech-ppt) #kbd[Ctrl + Shift + G]], [ગાઇડલાઇન્સ બતાવો/છુપાવો],
    [#nb("140", rtech-ppt) #kbd[F5]], [#hl-y[શરૂથી સ્લાઇડ શો ચલાવો]],
    [#nb("141", rtech-ppt) #kbd[Shift + F5]], [#hl-g[હાલની સ્લાઇડથી શો ચલાવો]],
    [#nb("142", rtech-ppt) #kbd[Alt + F5]], [#hl-b[પ્રેઝેન્ટર વ્યૂ (નોટ્સ સાથે)]],
    [#nb("143", rtech-ppt) #kbd[B / W (in Show)]], [#hl-o[સ્ક્રીન બ્લેક/વ્હાઇટ કરો]],
    [#nb("144", rtech-ppt) #kbd[Ctrl + L (in Show)]], [#hl-y[લાઇવ લેઝર પોઇન્ટર ચાલુ]],
    [#nb("145", rtech-ppt) #kbd[Ctrl + P / E (Show)]], [લાઇવ પેન / ઇરેઝર વાપરો],
    [#nb("146", rtech-ppt) #kbd[Number + Enter]], [સીધા સ્લાઇડ નંબર પર જાઓ],
    [#nb("147", rtech-ppt) #kbd[G (during Show)]], [બધી સ્લાઇડનું ગ્રીડ જુઓ],
    [#nb("148", rtech-ppt) #kbd[Ctrl + S (in Show)]], [ટાઇટલથી સ્લાઇડ શોધો],
    [#nb("149", rtech-ppt) #kbd[N / P (or Space)]], [આગળ / પાછળ સ્લાઇડ જાઓ],
    [#nb("150", rtech-ppt) #kbd[Esc]], [સ્લાઇડ શો બંધ કરો],
  )
]
#v(2.5pt)
#block(width: 100%, fill: rtech-navy, inset: (x: 5pt, y: 1.8pt), radius: (top: 2pt))[
  #text(size: 6.5pt, weight: "black", fill: white)[⊞  |  બોનસ : ઓફિસ સ્પીડ માટે 6 Windows પ્રો શોર્ટકટ (Word, Excel અને PPT સાથે વાપરો)]
]
#block(width: 100%)[
  #set text(size: 6pt, fill: rtech-navy)
  #table(
    columns: (0.98fr, 1.02fr, 0.98fr, 1.02fr, 0.98fr, 1.02fr),
    stroke: 0.5pt + dark-border,
    fill: (col, row) => if calc.even(row) { white } else { rgb("#F8FAFC") },
    align: (left + horizon),
    inset: (x: 2.2pt, y: 2pt),
    [#nb("W1", rtech-navy) #kbd[Win + V]], [ક્લિપબોર્ડ હિસ્ટ્રી (25 આઇટમ!)],
    [#nb("W2", rtech-navy) #kbd[Win+Shift+S]], [તાત્કાલિક સ્ક્રીનશોટ લો],
    [#nb("W3", rtech-navy) #kbd[Win + L]], [PC તરત લોક કરો (સુરક્ષા)],
    [#nb("W4", rtech-navy) #kbd[Win + D]], [ડેસ્કટોપ બતાવો / છુપાવો],
    [#nb("W5", rtech-navy) #kbd[Win + E]], [ફાઇલ એક્સપ્લોરર ખોલો],
    [#nb("W6", rtech-navy) #kbd[Alt + Tab]], [ખુલ્લી એપ્સ તરત બદલો],
  )
]
#v(3pt)
#box(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.65pt + dark-border, radius: 2.5pt, inset: (x: 6pt, y: 3.5pt))[
  #text(size: 6.2pt, fill: rtech-navy)[હાઇલાઇટર ગાઇડ:  #hl-y[એક્ઝામ અને ઇન્ટરવ્યુ ખાસ]   #hl-b[ફોર્મેટિંગ અને નેવિગેશન]   #hl-g[ટેબલ, ફોર્મ્યુલા અને ડેટા પાવર]   #hl-o[ભૂલ અટકાવે]   |   ★ બોનસ ટ્રિક: માઉસ વગર કામ કરવા કોઈપણ એપમાં 1 વાર #kbd[Alt] દબાવો!]
]
#v(1fr)
#grid(
  columns: (1fr, 1.15fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEFCE8"), stroke: (left: 3pt + rgb("#CA8A04"), rest: 0.6pt + dark-border), radius: 2.5pt, inset: 4pt)[
      #text(size: 6.3pt, weight: "bold", fill: rgb("#854D0E"))[💡 શું તમે જાણો છો? કીબોર્ડ શોર્ટકટ દર વર્ષે તમારા *8 પૂરા કામના દિવસો (64+ કલાક)* બચાવે છે!]
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#EFF6FF"), stroke: (left: 3pt + rtech-blue, rest: 0.6pt + dark-border), radius: 2.5pt, inset: 4pt)[
      #text(size: 6.3pt, style: "italic", weight: "bold", fill: rtech-navy)[🔥 "સ્પીડથી આત્મવિશ્વાસ આવે છે: રોજ આ વોલ પરથી ફક્ત 5 શોર્ટકટ યાદ કરો—30 દિવસમાં તમે 90% લોકોથી ઝડપી હશો!"]
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 07: SECTION 4 — OUTLOOK 365, ONEDRIVE CLOUD & WORKPLACE ETHICS
// =============================================================================
#app-banner("સેક્શન 4  |  OUTLOOK 365, ONEDRIVE ક્લાઉડ અને વર્કપ્લેસ એથિક્સ", "ઇમેઇલ શિસ્ત · Exchange સર્વર સેટઅપ · રિયલ-ટાઇમ ક્લાઉડ કો-ઓથરિંગ", rtech-outlook)

#section-banner(num: "ભાગ 4.1", title: "Outlook 4D ઇનબોક્સ ઝીરો અને OneDrive ક્લાઉડ વર્કફ્લો બ્લુપ્રિન્ટ", color: rtech-outlook)
#align(center)[
  #box(stroke: 0.65pt + dark-border, radius: 3pt, clip: true)[
    #image("02_BRAND_ASSETS/outlook_cloud_workflow_visual.png", width: 96%)
  ]
]

#section-banner(num: "ભાગ 4.2", title: "Outlook એકાઉન્ટ સેટઅપ (Exchange vs IMAP), Quick Steps અને ટોપ 10 કીઝ", color: rtech-outlook)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.9pt,
  text(size: 6.5pt, weight: "bold", fill: white)[ફીચર / પ્રોટોકોલ],
  text(size: 6.5pt, weight: "bold", fill: white)[કોર્પોરેટ કાર્યપદ્ધતિ (તે કેવી રીતે કામ કરે છે)],
  text(size: 6.5pt, weight: "bold", fill: white)[પ્રો એક્શન અને શોર્ટકટ],
  [#hl-b[Exchange (M365) vs IMAP]], [Exchange લેપટોપ અને મોબાઇલ બંને પર મેઇલ, કેલેન્ડર અને કોન્ટેક્ટ સિંક રાખે છે. જૂનો POP3 સર્વર પરથી મેઇલ કાઢી નાખે છે!], [ઓફિસમાં હંમેશા Microsoft Exchange / 365 પસંદ કરો — POP3 થી દૂર રહો.],
  [#hl-y[Quick Steps અને Rules]], [1 શોર્ટકટમાં Read માર્ક + ફોલ્ડરમાં મૂવ + ફ્લેગ કરો! બેંક OTP અને સર્વર એલર્ટ ઓટોમેટિક અલગ ફોલ્ડરમાં મોકલો.], [Home → Quick Steps → #kbd[Ctrl+Shift+1] સેટ કરી 1 સેકન્ડમાં રૂટિન મેઇલ ક્લિયર કરો.],
  [#hl-g[Scheduling Assistant]], [એકસાથે 10 ટીમ સભ્યોનો ખાલી કેલેન્ડર સમય જુઓ! Delay Delivery થી રાત્રે લખેલ મેઇલ સવારે 9 AM એ મોકલો.], [New Meeting → Scheduling Assistant; Options → Delay Delivery નો ઉપયોગ કરો.],
  [ટોપ 10 Outlook કીઝ], [#kbd[Ctrl+N] નવું આઇટમ · #kbd[Ctrl+Shift+M] નવો મેઇલ · #kbd[Ctrl+R] રિપ્લાય · #kbd[Ctrl+Shift+R] રિપ્લાય ઓલ · #kbd[Ctrl+F] ફોરવર્ડ.], [#kbd[Ctrl+Enter] મોકલો · #kbd[Ctrl+1/2/3] મેઇલ/કેલેન્ડર · #kbd[Ctrl+Q] Read · #kbd[Backspace] આર્કાઇવ.],
)

#section-banner(num: "ભાગ 4.3", title: "1TB OneDrive ક્લાઉડ ગવર્નન્સ અને ઓફિસ ડિજિટલ એથિક્સ (નિયમો)", color: rtech-emerald)
#table(
  columns: (1.35fr, 2.55fr, 2.1fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon, left + horizon),
  inset: 2.9pt,
  text(size: 6.5pt, weight: "bold", fill: white)[ક્લાઉડ / એથિક્સ સ્તંભ],
  text(size: 6.5pt, weight: "bold", fill: white)[ગોલ્ડન ઓફિસ નિયમ (સીનિયર્સ ફ્રેશર્સ પાસેથી શું અપેક્ષા રાખે છે)],
  text(size: 6.5pt, weight: "bold", fill: white)[આ મોટી ભૂલ ક્યારેય ન કરો],
  [#hl-b[લાઇવ Co-Authoring + AutoSave]], [OneDrive/SharePoint માં ફાઇલ રાખો → AutoSave થી દરેક અક્ષર તરત સેવ થાય છે; 5 લોકો એકસાથે 1 Excel પર કામ કરે!], [વારંવાર `Report_Final_v2_new.xlsx` ઇમેઇલ કરી અલગ-અલગ કોપી બનાવવી!],
  [#hl-g[180-દિવસ Version History]], [OneDrive માં ફાઇલ પર Right-click → Version History થી ડિલીટ કે ખરાબ થયેલી જૂની સાચી ફાઇલ પાછી મેળવો.], [ફક્ત ડેસ્કટોપ પર ફાઇલ રાખી પાવર કટ કે ક્રેશમાં 8 કલાકની મહેનત ગુમાવવી.],
  [#hl-o[માનક ISO ફાઇલ નામ]], [હંમેશા ચોખ્ખું નામ લખો: `2027-11-25_ClientName_GST_v1.0.xlsx` — જેથી ઓડિટ અને સર્ચ સરળ બને.], [મહત્વના ઓફિસ કામને `abc123.xlsx`, `New Sheet.xlsx` કે `Final_final2.xlsx` નામ આપવું.],
  [ડેટા સુરક્ષા અને સ્ક્રીન લોક], [પગાર કે ક્લાયન્ટ શીટ હંમેશા 'Specific People' થી શેર કરો ('Anyone with link' ક્યારેય નહીં). સીટ છોડતા પહેલા #kbd[Win+L] દબાવો!], [કંપનીનો ખાનગી ડેટા પર્સનલ WhatsApp/Gmail પર મોકલવો કે PC ખુલ્લું છોડી દેવું.],
)

#section-banner(num: "ભાગ 4.4", title: "4 તૈયાર કોર્પોરેટ ઇમેઇલ ટેમ્પલેટ્સ + OneDrive આઇકન અને Microsoft Forms બોનસ", color: rtech-blue)
#table(
  columns: (1.45fr, 4.55fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.9pt,
  [#hl-b[1. જોબ / ઇન્ટર્નશિપ મેઇલ]], [Subject: `Application: Accounts/MIS Trainee — [તમારું નામ]` | શરૂઆત: `Dear Hiring Manager, મારું 1-પેજ ATS રિઝ્યુમે જોડેલ છે. હું XLOOKUP અને Power Query રિપોર્ટ ઓટોમેટ કરું છું...`],
  [#hl-g[2. રજા (Leave) નો ઇમેઇલ]], [Subject: `Leave Request: 28-Nov-2027 (1 Day) — [તમારું નામ]` | ટૂંકું કારણ, કામ કોને સોંપ્યું છે તેમનું નામ લખો અને ઇમરજન્સીમાં ફોન ઉપલબ્ધતા જણાવો.],
  [#hl-o[3. ક્લાયન્ટ પેમેન્ટ રિમાઇન્ડર]], [Subject: `Gentle Reminder: Invoice #INV-204 (₹45,000) Due 25-Nov` | વિનમ્ર ભાષા + PDF બિલ જોડો + NEFT/UPI વિગત સ્પષ્ટ લખો.],
  [4. OneDrive આઇકન અને Forms], [#hl-y[બ્લુ વાદળ] = ફક્ત ઓનલાઇન (0 MB ડિસ્ક) · લીલો ટિક = ઓફલાઇન ઉપલબ્ધ · ઘાટો લીલો = હંમેશા સેવ. Microsoft Forms નો સર્વે ડેટા સીધો Excel માં આવે છે!],
)
#v(2pt)
#block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F8FAFC"), radius: 2.5pt, inset: 3pt)[
  #text(size: 6.4pt, weight: "black", fill: rtech-navy)[🤖 2027 બોનસ : 3 M365 Copilot / AI પ્રોમ્પ્ટ્સ]\
  #v(1.5pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 4pt,
    ..([#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-b[Word AI]: "આ 20-પેજ કોન્ટ્રાક્ટના 5 મુખ્ય જોખમ જણાવો"]]], [#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-g[Excel AI]: "Sheet1 અને Sheet2 માટે XLOOKUP + IFERROR લખો"]]], [#box(width:100%, fill:white, stroke:0.5pt+dark-border, radius:2pt, inset:2.5pt)[#text(size:5.9pt)[#hl-o[PPT AI]: "આ ડોક્યુમેન્ટમાંથી 5-સ્લાઇડ 16:9 પિચ આઉટલાઇન બનાવો"]]])
  )
]
#v(1fr)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: (left: 3.5pt + rtech-outlook, rest: 0.65pt + dark-border),
  radius: 3.5pt,
  inset: 4.5pt,
  [
    #grid(
      columns: (1.65fr, 1fr),
      gutter: 6pt,
      align: (left + horizon, center + horizon),
      [
        #text(size: 6.8pt, weight: "black", fill: rtech-outlook)[💡 શું તમે જાણો છો? (ઓફિસ હકીકત)]\
        #v(1.5pt)
        #text(size: 6.35pt, fill: rtech-navy)[ઓફિસ કર્મચારીઓ દિવસનો *28% સમય* ઇમેઇલમાં વિતાવે છે! 4D ઇનબોક્સ ઝીરો અને Quick Steps (`Ctrl+Shift+1`) રોજ તમારા 1.5 કલાક બચાવે છે.]\
        #v(2pt)
        #box(fill: white, stroke: 0.5pt + dark-border, radius: 2pt, inset: (x: 4pt, y: 2pt))[
          #text(size: 6.1pt, weight: "bold", fill: rtech-navy)[⚡ 2-મિનિટ પ્રેક્ટિસ: OneDrive માં ફાઇલ સેવ કરો → Right-click → Version History → 180-દિવસ રોલબેક જુઓ!]
        ]\
        #v(2pt)
        #text(size: 6.2pt, style: "italic", weight: "bold", fill: rtech-outlook)[🔥 "ચોખ્ખું ઇનબોક્સ, સુરક્ષિત ડેટા અને સારી કાર્ય-નીતિ ઓફિસમાં તમારો વિશ્વાસ મજબૂત બનાવે છે."]
      ],
      [
        #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
          #image("02_BRAND_ASSETS/office_cloud_team.png", height: 62pt, fit: "contain")
        ]
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 08: SECTION 5 — AUTHOR HUB, 4 LIVE QR CODES & TOP 8 MNC INTERVIEW Q&A
// =============================================================================
#app-banner("સેક્શન 5  |  લેખક મેન્ટરશિપ હબ, લાઇવ QR કોડ અને MNC ઇન્ટરવ્યુ Q&A", "રાહુલ પટેલ · IANT પાલનપુર · ડાયરેક્ટ QR ચેનલ · ટોપ 6 કોર્પોરેટ Q&A", rgb("#047857"))

#section-banner(num: "ભાગ 5.1", title: "તમારા મેન્ટરને મળો: રાહુલ પટેલ — ક્લાસરૂમથી કોર્પોરેટ જોબ સુધીનો સેતુ", color: rtech-navy)
#block(
  width: 100%,
  stroke: 0.65pt + dark-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: 5pt,
  [
    #grid(
      columns: (58pt, 1fr),
      gutter: 8pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-blue,
          radius: 5pt,
          clip: true,
          width: 52pt,
          height: 62pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 10pt, weight: "black", fill: rtech-navy)[Rahul Patel]\
        #v(1pt)
        #text(size: 7pt, weight: "bold", fill: rtech-blue)[સ્થાપક અને મુખ્ય સિસ્ટમ્સ આર્કિટેક્ટ · RTechLab Publications]\
        #text(size: 7pt, weight: "bold", fill: rgb("#047857"))[ડાયરેક્ટર અને સિનિયર ટેકનિકલ એક્સપર્ટ · IANT કમ્પ્યુટર એજ્યુકેશન, પાલનપુર (ગુજરાત)]\
        #v(2pt)
        #text(size: 6.6pt, fill: rtech-navy)[*10+ વર્ષના ઊંડા એન્ટરપ્રાઇઝ IT, ક્લાઉડ અને કોર્પોરેટ તાલીમ અનુભવ* સાથે, રાહુલે નાના શહેરોના *3,000+ વિદ્યાર્થીઓને* દેશની અગ્રણી IT અને એકાઉન્ટિંગ કંપનીઓમાં કારકિર્દી અપાવી છે. તેમનું સપનું છે કે ભારતના દરેક વિદ્યાર્થીને *ફક્ત ₹22 માં ₹2,200 કક્ષાનું પ્રેક્ટિકલ શિક્ષણ* મળે.]
      ]
    )
  ]
)

#section-banner(num: "ભાગ 5.2", title: "QR કોડ સ્કેન કરો: ફ્રી ટૂલ્સ, વિડિયો ટ્યુટોરિયલ, પોર્ટફોલિયો અને WhatsApp ગ્રુપ", color: rtech-blue)
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#F0F9FF"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rtech-blue)[લેખક પોર્ટફોલિયો]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[YouTube ચેનલ]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[`RTechLabOfficial` ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[Instagram હબ]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[`rtechlabofficial` ↗]]
      ]
    ]
  ],
  [
    #block(stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 50pt)]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[WhatsApp કોમ્યુનિટી]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[Join Channel ↗]]
      ]
    ]
  ],
)

#section-banner(num: "ભાગ 5.3", title: "MNC અને BPO ટેકનિકલ ઇન્ટરવ્યુના ટોપ 6 પ્રશ્નો અને સચોટ વિજેતા જવાબો", color: rtech-excel)
#table(
  columns: (2.05fr, 3.95fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if row == 0 { rtech-navy } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  text(size: 6.5pt, weight: "bold", fill: white)[ઇન્ટરવ્યુ પ્રશ્ન (MIS / IT / Accounts જોબ)],
  text(size: 6.5pt, weight: "bold", fill: white)[સચોટ એક્સપર્ટ જવાબ (ઇન્ટરવ્યુમાં આ જ બોલો)],
  [#text(weight: "bold", fill: rtech-navy)[Q1: XLOOKUP દરેક રીતે VLOOKUP કરતા કેમ ચડિયાતું છે?]], [XLOOKUP ડિફોલ્ટ રૂપે Exact Match કરે છે, ડાબે/જમણે/ઉપર/નીચે શોધે છે, એકસાથે અનેક કોલમ આપે છે અને નવી કોલમ ઉમેરતા તૂટતું નથી.],
  [#text(weight: "bold", fill: rtech-navy)[Q2: Word માં Section Break અને Page Break વચ્ચે શું તફાવત છે?]], [Page Break ફક્ત લખાણને આગળના પાને લઈ જાય છે. Section Break અલગ સ્વતંત્ર વિભાગ બનાવે છે—જેનાથી પોર્ટ્રેટ રિપોર્ટ વચ્ચે Landscape પેજ ઉમેરી શકાય.],
  [#text(weight: "bold", fill: rtech-navy)[Q3: Power Query માં 'Unpivot Columns' \#1 સ્કિલ કેમ ગણાય છે?]], [તે Jan–Dec વાળા પહોળા ટેબલને 2 ઊભા ડેટાબેઝ કોલમ (Attribute અને Value) માં ફેરવે છે—જે Pivot Table અને Power BI મોડેલ માટે ફરજિયાત છે.],
  [#text(weight: "bold", fill: rtech-navy)[Q4: Excel માં LET() ફંક્શન ગણતરીને ઝડપી કેવી રીતે બનાવે છે?]], [LET વચ્ચેની રેન્જને વેરિએબલ નામ આપે છે જેથી Excel ભારે રેન્જને વારંવાર ગણવાના બદલે ફક્ત એક જ વાર ગણી 5x ઝડપી પરિણામ આપે છે.],
  [#text(weight: "bold", fill: rtech-navy)[Q5: PowerPoint માં `!!Logo` સાથે Morph એનિમેશન કેવી રીતે કામ કરે છે?]], [સ્લાઇડ ડુપ્લિકેટ કરી બીજી સ્લાઇડ પર સાઇઝ/જગ્યા બદલો અને Morph ટ્રાન્ઝિશન લગાવો. Selection Pane માં `!!` નામ આપવાથી બંને ઓબ્જેક્ટ સ્મૂધ મૂવ થાય છે.],
  [#text(weight: "bold", fill: rtech-navy)[Q6: Outlook માં Inbox Zero નો 4D નિયમ શું છે?]], [2 મિનિટથી ઓછું કામ હોય તો Do (તરત કરો); બીજાનું કામ હોય તો Delegate કરો; મોટા કામને Calendar પર Defer કરો; બિનજરૂરી મેઇલ Delete/Archive કરો.],
  [#text(weight: "bold", fill: rtech-navy)[Q7: Pivot Table અને Power Query — ક્યારે શું વાપરવું?]], [Power Query ગંદી CSV/ERP ફાઇલોને વિશ્લેષણ પહેલા સાફ, મર્જ અને Unpivot કરે છે (ETL). Pivot Table તે સાફ ડેટાનો સારાંશ અને ચાર્ટ બનાવે છે.],
  [#text(weight: "bold", fill: rtech-navy)[Q8: ફોર્મ્યુલા લોક રાખીને યુઝરને ફક્ત ડેટા ટાઇપ કરવાની પરવાનગી કેવી રીતે આપવી?]], [ઇનપુટ સેલ પસંદ કરો → `Ctrl+1` → Protection માં 'Locked' અનચેક કરો. પછી Review → Protect Sheet લગાવો. હવે યુઝર ફોર્મ્યુલા ક્યારેય ડિલીટ નહીં કરી શકે!],
)

#section-banner(num: "30-દિવસ પ્લાન", title: "30-દિવસનો ઓફિસ 365 માસ્ટરી રોડમેપ (રોજ 15 મિનિટ પ્રેક્ટિસ = ઓફિસ પ્રો)", color: rtech-ppt)
#table(
  columns: (1.25fr, 4.75fr),
  stroke: 0.65pt + dark-border,
  fill: (col, row) => if calc.even(row) { rgb("#F8FAFC") } else { white },
  align: (left + horizon, left + horizon),
  inset: 2.8pt,
  [#hl-b[અઠવાડિયું 1 · MS Word]], [તમારું ATS રિઝ્યુમે અને 1 કોલેજ રિપોર્ટ `Heading 1–3`, `Auto-TOC`, Section Break થી ફરી બનાવો અને PDF (#kbd[Ctrl+S] ટેવ) કાઢો.],
  [#hl-g[અઠવાડિયું 2 · ફોર્મ્યુલા]], [50-લાઇન સેમ્પલ ડેટા પર `XLOOKUP`, `FILTER`, `SUMIFS`, `TEXTSPLIT` અને `LET` ની પ્રેક્ટિસ કરો જ્યાં સુધી `#N/A` એરર ઝીરો ન થાય.],
  [#hl-y[અઠવાડિયું 3 · PQ અને PPT]], [1 Power Query `Unpivot` + પિવટ Slicer ડેશબોર્ડ બનાવો, અને ફક્ત Slide Master થી 5-સ્લાઇડ 16:9 `Morph` પ્રેઝન્ટેશન તૈયાર કરો.],
  [#hl-o[અઠવાડિયું 4 · 150 શોર્ટકટ]], [પાનું 6 કીબોર્ડ પાસે રાખો! રોજ 10 શોર્ટકટ પ્રેક્ટિસ કરી 150 કીઝને આદત બનાવો — પછી MNC ઇન્ટરવ્યુ Q&A રિવાઇઝ કરો!],
)
#v(1fr)
#block(width: 100%, fill: rgb("#F0FDF4"), stroke: (left: 3.5pt + rgb("#047857"), rest: 0.65pt + dark-border), radius: 3.5pt, inset: 5pt)[
  #grid(
    columns: (1.8fr, 0.9fr),
    gutter: 6pt,
    align: (left + horizon, center + horizon),
    [
      #text(size: 7pt, weight: "black", fill: rgb("#047857"))[🏆 RTECHLAB સંકલ્પ અને 30-દિવસ ઇન્સ્ટાગ્રામ ચેલેન્જ]\
      #v(2pt)
      #text(size: 6.45pt, weight: "bold", fill: rtech-navy)[રોજ 15 મિનિટ પ્રેક્ટિસ = કરિયરમાં મોટો બદલાવ! 30 દિવસમાં 150 શોર્ટકટ માસ્ટર કરો, તમારા ડેસ્ક પર પેજ 6 નો ફોટો Instagram પર `@rtechlabofficial` ને ટેગ કરી શેર કરો!]
    ],
    [
      #box(fill: white, stroke: 0.55pt + dark-border, radius: 3pt, inset: 2pt)[
        #image("02_BRAND_ASSETS/office_word_desk.png", height: 56pt, fit: "contain")
      ]
    ]
  )
]
#v(4pt)
#align(center)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 0.9pt + rtech-blue,
    radius: 3.5pt,
    inset: (x: 8pt, y: 4pt),
    text(size: 6.7pt, weight: "bold", fill: rtech-blue)[🚀 સંપૂર્ણ માસ્ટરી માટે 113-પેજની ઇલસ્ટ્રેટેડ માસ્ટર બુક + 6 પ્રેક્ટિકલ Excel ટેમ્પલેટ્સ (.xlsx) મેળવો: ₹49 બુક કે ₹149 સૂટ #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]]
  )
]
