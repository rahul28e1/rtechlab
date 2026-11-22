// =============================================================================
// RTECHLAB MASTER TYPST THEME — TALLY PRIME & CORPORATE ACCOUNTING
// Unified Light Design System · Strict 100% Light Theme (NO Dark Backgrounds)
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
// =============================================================================

#let rtech-navy = rgb("#0F172A")        // Slate 900 (Main text)
#let rtech-teal = rgb("#0E7490")        // Cyan / Teal 700
#let rtech-cyan = rgb("#0284C7")        // Sky 600
#let rtech-accent = rgb("#0284C7")      // Sky 600
#let rtech-emerald = rgb("#059669")     // Emerald 600 (Accounting Green)
#let rtech-amber = rgb("#D97706")       // Amber 600 (Taxation / GST)
#let rtech-rose = rgb("#DC2626")        // Rose 600 (Alerts)
#let rtech-paper = white                // 100% PURE CLEAN WHITE (NO DARK BACKGROUNDS)
#let rtech-text = rgb("#1E293B")        // Slate 800
#let rtech-muted = rgb("#475569")       // Slate 600
#let rtech-border = rgb("#E2E8F0")      // Clean subtle border

// Master Book Setup Function
#let rtech-tally-book(
  title: "Tally Prime with GST & Corporate Accounting Master Guide",
  subtitle: "Double Entry Bookkeeping · 28 Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Invoices",
  author: "Rahul Patel",
  edition: "2027 Commercial Edition · RTechLab & IANT Publication",
  subject-code: "RTL-2027-TALLY-ED1",
  lang: "en",
  body
) = {
  set page(
    paper: "a4",
    margin: (x: 12mm, top: 15mm, bottom: 13mm),
    fill: rtech-paper,
    
    // Light Watermark on Content Pages
    background: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        place(
          center + horizon,
          rotate(
            -30deg,
            block(
              align(center)[
                #text(size: 34pt, weight: "black", fill: rgb(14, 116, 144, 3.5%), tracking: 3pt)[
                  RTECHLAB
                ]
                #v(3pt)
                #text(size: 14pt, weight: "bold", fill: rgb(15, 23, 42, 3%), tracking: 4pt)[
                  PRACTICAL ACCOUNTING GUIDE
                ]
              ]
            )
          )
        )
      }
    },
    
    // Universal Light Header
    header: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        block(
          width: 100%,
          stroke: (bottom: 0.5pt + rgb("#CBD5E1")),
          inset: (bottom: 2mm),
          [
            #grid(
              columns: (1fr, 1fr),
              align: (left, right),
              [
                #text(size: 8pt, weight: "black", fill: rtech-navy)[RTECHLAB]
                #text(size: 8pt, fill: rtech-teal, weight: "bold")[ | #title]
              ],
              [
                #text(size: 7.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-muted)[
                  #edition · #author
                ]
              ]
            )
          ]
        )
      }
    },
    
    // Universal Light Footer
    footer: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        block(
          width: 100%,
          stroke: (top: 0.5pt + rgb("#CBD5E1")),
          inset: (top: 2mm),
          [
            #grid(
              columns: (1fr, auto),
              align: (left, right),
              [
                #text(size: 6.8pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-muted)[
                  #text(fill: rtech-emerald)[●] Technology Made Practical · Learn. Practice. Innovate. · RTechLab & IANT
                ]
              ],
              [
                #box(
                  fill: rgb("#F1F5F9"),
                  stroke: 0.5pt + rgb("#CBD5E1"),
                  radius: 3pt,
                  inset: (x: 6pt, y: 2pt),
                  text(size: 7pt, weight: "bold", fill: rtech-navy)[Page #page-num]
                )
              ]
            )
          ]
        )
      }
    }
  )

  // Typography & Paragraph Styling
  set text(
    font: ("Segoe UI", "Nirmala UI", "Arial"),
    size: 8.5pt,
    fill: rtech-text,
    spacing: 115%,
    lang: lang
  )
  
  set par(
    justify: true,
    leading: 0.52em,
    first-line-indent: 0pt
  )

  // Heading Styles (Strictly Light Backgrounds)
  show heading.where(level: 1): it => block(
    width: 100%,
    stroke: (bottom: 1.5pt + rtech-teal),
    inset: (bottom: 3pt),
    spacing: 6pt,
    [
      #text(size: 12.5pt, weight: "black", fill: rtech-navy)[#it.body]
    ]
  )

  show heading.where(level: 2): it => block(
    width: 100%,
    inset: (top: 4pt, bottom: 2pt),
    spacing: 3.5pt,
    [
      #text(size: 9.8pt, weight: "bold", fill: rtech-navy)[#it.body]
    ]
  )

  show heading.where(level: 3): it => block(
    inset: (top: 2pt, bottom: 1pt),
    spacing: 2pt,
    [
      #text(size: 8.8pt, weight: "bold", fill: rtech-teal.darken(10%))[#it.body]
    ]
  )

  body
}

// -----------------------------------------------------------------------------
// VISUAL CALLOUT COMPONENTS (100% LIGHT THEME · NO DARK BACKGROUNDS)
// -----------------------------------------------------------------------------

#let concept-box(title: "CORE ACCOUNTING CONCEPT", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-teal, rest: 0.5pt + rgb("#CBD5E1")),
    fill: rgb("#F8FAFC"),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5pt),
    spacing: 3.5pt,
    [
      #text(size: 7.8pt, weight: "bold", fill: rtech-teal.darken(15%))[#title]\
      #v(2pt)
      #text(size: 7.5pt, fill: rtech-text)[#body]
    ]
  )
}

#let rule-box(title: "GOLDEN RULE OF ACCOUNTING", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-emerald, rest: 0.5pt + rgb("#A7F3D0")),
    fill: rgb("#F0FDF4"),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5pt),
    spacing: 3.5pt,
    [
      #text(size: 7.8pt, weight: "bold", fill: rtech-emerald.darken(25%))[#title]\
      #v(2pt)
      #text(size: 7.5pt, fill: rtech-text)[#body]
    ]
  )
}

#let gst-box(title: "GST COMPLIANCE & STATUTORY NOTE", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-amber, rest: 0.5pt + rgb("#FDE68A")),
    fill: rgb("#FFFBEB"),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5pt),
    spacing: 3.5pt,
    [
      #text(size: 7.8pt, weight: "bold", fill: rtech-amber.darken(25%))[#title]\
      #v(2pt)
      #text(size: 7.5pt, fill: rtech-text)[#body]
    ]
  )
}

#let tds-box(title: "TDS COMPLIANCE RULE (INCOME TAX ACT)", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-teal, rest: 0.5pt + rgb("#99F6E4")),
    fill: rgb("#F0FDFA"),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5pt),
    spacing: 3.5pt,
    [
      #text(size: 7.8pt, weight: "bold", fill: rtech-teal.darken(25%))[#title]\
      #v(2pt)
      #text(size: 7.5pt, fill: rtech-text)[#body]
    ]
  )
}

#let shortcut-box(title: "TALLY PRIME SHORTCUT KEY & NAVIGATION", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-cyan, rest: 0.5pt + rgb("#BAE6FD")),
    fill: rgb("#F0F9FF"),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5pt),
    spacing: 3.5pt,
    [
      #text(size: 7.8pt, weight: "bold", fill: rtech-cyan.darken(25%))[#title]\
      #v(2pt)
      #text(size: 7.5pt, fill: rtech-text)[#body]
    ]
  )
}

#let warning-box(title: "ACCOUNTING & AUDIT ALERT", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-rose, rest: 0.5pt + rgb("#FECDD3")),
    fill: rgb("#FFF1F2"),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5pt),
    spacing: 3.5pt,
    [
      #text(size: 7.8pt, weight: "bold", fill: rtech-rose.darken(25%))[#title]\
      #v(2pt)
      #text(size: 7.3pt, fill: rtech-text)[#body]
    ]
  )
}

#let key-pill(key) = {
  box(
    fill: rgb("#F1F5F9"),
    stroke: 0.5pt + rgb("#CBD5E1"),
    radius: 2pt,
    inset: (x: 4pt, y: 1.5pt),
    baseline: 0pt,
    text(size: 6.8pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rtech-navy)[#key]
  )
}

// -----------------------------------------------------------------------------
// COMMERCIAL BANKING & INVOICE FORMAT COMPONENTS (PRACTICAL VISUALS)
// -----------------------------------------------------------------------------

#let cheque-format(
  payee: "Krishi Beej Bhandar",
  amount-words: "Rupees Two Lakh Only",
  amount-num: "2,00,000.00",
  date-str: "0 1 0 4 2 0 2 5",
  bank-name: "HDFC BANK LIMITED",
  branch: "Palanpur Main Branch, Gujarat · IFSC: HDFC0001234",
  ac-no: "50100458921478",
  chq-no: "145821",
  company-name: "RAVI PRIVATE LIMITED"
) = {
  block(
    width: 100%,
    stroke: 1.5pt + rgb("#0E7490"),
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: 8pt,
    spacing: 5pt,
    [
      // Top row: Crossing & Bank Details & Date
      #grid(
        columns: (1fr, 2.5fr, 1.4fr),
        align: (left + top, center + top, right + top),
        [
          #box(
            stroke: (right: 1pt + rgb("#475569")),
            inset: (right: 5pt),
            [
              #text(size: 6.5pt, weight: "black", fill: rgb("#0F172A"))[\/\/ A/C PAYEE ONLY \/\/]\
              #text(size: 5.5pt, fill: rgb("#64748B"))[NOT NEGOTIABLE]
            ]
          )
        ],
        [
          #text(size: 8.5pt, weight: "black", fill: rgb("#0E7490"))[#bank-name]\
          #text(size: 6pt, fill: rgb("#475569"))[#branch]
        ],
        [
          #text(size: 5.5pt, weight: "bold", fill: rgb("#475569"))[DATE: ]
          #box(
            fill: white,
            stroke: 0.5pt + rgb("#64748B"),
            inset: (x: 3pt, y: 1.5pt),
            text(size: 6.5pt, weight: "bold", font: "Consolas", fill: rgb("#0F172A"))[#date-str]
          )
        ]
      )
      
      #v(3pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(2pt)
      
      // Pay line
      #grid(
        columns: (auto, 1fr, auto),
        gutter: 4pt,
        align: (left + horizon, left + horizon, right + horizon),
        [#text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[PAY:]],
        [#box(width: 100%, stroke: (bottom: 0.5pt + rgb("#94A3B8")), inset: (bottom: 1.5pt))[#text(size: 7.2pt, weight: "bold", fill: rgb("#0369A1"))[#payee]]],
        [#text(size: 6.5pt, style: "italic", fill: rgb("#64748B"))[OR BEARER]]
      )
      
      #v(3pt)
      
      // Rupees in words line & Amount Box
      #grid(
        columns: (auto, 1fr, auto),
        gutter: 4pt,
        align: (left + horizon, left + horizon, right + horizon),
        [#text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[RUPEES:]],
        [#box(width: 100%, stroke: (bottom: 0.5pt + rgb("#94A3B8")), inset: (bottom: 1.5pt))[#text(size: 6.8pt, style: "italic", fill: rgb("#334155"))[#amount-words]]],
        [
          #box(
            fill: rgb("#EFF6FF"),
            stroke: 1.2pt + rgb("#1D4ED8"),
            radius: 2pt,
            inset: (x: 5pt, y: 3pt),
            [#text(size: 8pt, weight: "black", fill: rgb("#1D4ED8"))[₹ #amount-num]]
          )
        ]
      )
      
      #v(3pt)
      
      // A/c No and Signatory
      #grid(
        columns: (1fr, 1fr),
        align: (left + bottom, right + bottom),
        [
          #text(size: 6.5pt, weight: "bold", fill: rgb("#475569"))[A/C NO.: ]
          #box(fill: white, stroke: 0.5pt + rgb("#94A3B8"), inset: (x: 3pt, y: 1pt))[
            #text(size: 7pt, weight: "bold", font: "Consolas", fill: rgb("#0F172A"))[#ac-no]
          ]
        ],
        [
          #text(size: 6.2pt, weight: "bold", fill: rgb("#475569"))[For #company-name]\
          #v(8pt)
          #text(size: 6pt, style: "italic", fill: rgb("#64748B"))[Authorised Signatory]
        ]
      )
      
      #v(2pt)
      // MICR Band
      #rect(
        width: 100%,
        fill: rgb("#F1F5F9"),
        stroke: (top: 0.5pt + rgb("#CBD5E1")),
        inset: 2pt,
        align(center)[
          #text(size: 6.5pt, font: "Consolas", tracking: 1.5pt, fill: rgb("#334155"))[
            ⑈ #chq-no ⑈  385240002 ⑆  000124 ⑈  10
          ]
        ]
      )
    ]
  )
}

#let bank-statement-format(
  account-holder: "RAVI PRIVATE LIMITED",
  bank-name: "HDFC BANK LIMITED",
  account-no: "50100458921478",
  period: "01-Apr-2025 to 30-Apr-2025",
  rows: ()
) = {
  block(
    width: 100%,
    stroke: 1pt + rgb("#0E7490"),
    radius: 4pt,
    inset: 6pt,
    spacing: 5pt,
    [
      #grid(
        columns: (1.5fr, 1fr),
        align: (left, right),
        [
          #text(size: 8pt, weight: "black", fill: rgb("#0E7490"))[#bank-name · STATEMENT OF ACCOUNT]\
          #text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[Account Holder: #account-holder] · #text(size: 6.5pt, fill: rgb("#475569"))[A/c: #account-no]
        ],
        [
          #text(size: 6.5pt, weight: "bold", fill: rgb("#475569"))[Statement Period:]\
          #text(size: 6.5pt, fill: rgb("#0369A1"))[#period]
        ]
      )
      #v(2pt)
      #table(
        columns: (0.7fr, 2.2fr, 0.9fr, 0.8fr, 0.8fr, 0.9fr),
        fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
        stroke: 0.3pt + rgb("#CBD5E1"),
        inset: 2.8pt,
        align: (col, row) => if row == 0 { center } else if col in (3, 4, 5) { right } else { left },
        [#text(size: 6.5pt, weight: "bold", fill: white)[Date]],
        [#text(size: 6.5pt, weight: "bold", fill: white)[Narration / Description]],
        [#text(size: 6.5pt, weight: "bold", fill: white)[Chq/Ref No.]],
        [#text(size: 6.5pt, weight: "bold", fill: white)[Withdrawal (Dr)]],
        [#text(size: 6.5pt, weight: "bold", fill: white)[Deposit (Cr)]],
        [#text(size: 6.5pt, weight: "bold", fill: white)[Balance (₹)]],
        ..rows
      )
    ]
  )
}

#let gst-tax-invoice-format(
  inv-no: "INV-2025-001",
  inv-date: "01-Apr-2025",
  seller-name: "RAVI PRIVATE LIMITED",
  seller-gstin: "24AABCR1234A1Z5",
  seller-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  buyer-name: "KRISHI BEEJ BHANDAR",
  buyer-gstin: "24ABCDE1234R1Z1",
  buyer-address: "025, Near Small Building, Main Chowk, Palanpur - 385001",
  items-rows: (),
  total-taxable: "4,550.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "0.00",
  grand-total: "4,550.00",
  in-words: "Rupees Four Thousand Five Hundred Fifty Only"
) = {
  block(
    width: 100%,
    stroke: 1.2pt + rgb("#0E7490"),
    radius: 4pt,
    inset: 5pt,
    spacing: 4pt,
    [
      // Invoice Heading
      #align(center)[
        #text(size: 8.5pt, weight: "black", fill: rgb("#0F172A"))[TAX INVOICE]\
        #text(size: 5.5pt, style: "italic", fill: rgb("#64748B"))[(Issued under Section 31 of Central Goods and Services Tax Act, 2017)]
      ]
      
      #v(2pt)
      // Invoice Meta & Parties
      #grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        [
          #box(
            width: 100%,
            stroke: 0.5pt + rgb("#CBD5E1"),
            fill: rgb("#F8FAFC"),
            inset: 4pt,
            radius: 2pt,
            [
              #text(size: 6pt, weight: "bold", fill: rgb("#0E7490"))[SUPPLIER / SELLER DETAILS:]\
              #text(size: 7.2pt, weight: "black", fill: rgb("#0F172A"))[#seller-name]\
              #text(size: 5.8pt, fill: rgb("#475569"))[#seller-address]\
              #text(size: 6.2pt, weight: "bold", fill: rgb("#0F172A"))[GSTIN: #seller-gstin] · State: Gujarat (Code 24)
            ]
          )
        ],
        [
          #box(
            width: 100%,
            stroke: 0.5pt + rgb("#CBD5E1"),
            fill: rgb("#F8FAFC"),
            inset: 4pt,
            radius: 2pt,
            [
              #text(size: 6pt, weight: "bold", fill: rgb("#0E7490"))[INVOICE & BUYER DETAILS:]\
              #text(size: 6.5pt, weight: "bold", fill: rgb("#0F172A"))[Invoice No: #inv-no] · #text(size: 6.5pt)[Date: #inv-date]\
              #text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[Billed To: #buyer-name]\
              #text(size: 5.8pt, fill: rgb("#475569"))[#buyer-address]\
              #text(size: 6.2pt, weight: "bold", fill: rgb("#0F172A"))[GSTIN: #buyer-gstin] · Place of Supply: Gujarat (24)
            ]
          )
        ]
      )
      
      #v(2pt)
      
      // Items Table
      #table(
        columns: (0.4fr, 2.2fr, 0.7fr, 0.6fr, 0.8fr, 0.9fr, 0.7fr, 0.7fr, 0.9fr),
        fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
        stroke: 0.3pt + rgb("#CBD5E1"),
        inset: 2.5pt,
        align: (col, row) => if row == 0 { center } else if col in (3, 4, 5, 6, 7, 8) { right } else { left },
        [#text(size: 5.8pt, weight: "bold", fill: white)[Sl.]],
        [#text(size: 5.8pt, weight: "bold", fill: white)[Description of Goods / Services]],
        [#text(size: 5.8pt, weight: "bold", fill: white)[HSN/SAC]],
        [#text(size: 5.8pt, weight: "bold", fill: white)[Qty]],
        [#text(size: 5.8pt, weight: "bold", fill: white)[Rate (₹)]],
        [#text(size: 5.8pt, weight: "bold", fill: white)[Taxable Val]],
        [#text(size: 5.8pt, weight: "bold", fill: white)[CGST]],
        [#text(size: 5.8pt, weight: "bold", fill: white)[SGST]],
        [#text(size: 5.8pt, weight: "bold", fill: white)[Total (₹)]],
        ..items-rows
      )
      
      #v(2pt)
      
      // Bottom Row: Words & Totals
      #grid(
        columns: (1.5fr, 1fr),
        gutter: 4pt,
        [
          #text(size: 5.8pt, weight: "bold", fill: rgb("#475569"))[Amount Chargeable in Words:]\
          #text(size: 6.5pt, style: "italic", weight: "bold", fill: rgb("#0F172A"))[#in-words]\
          #v(3pt)
          #text(size: 5.5pt, fill: rgb("#64748B"))[Declaration: We declare that this invoice shows actual price of the goods described and that all particulars are true and correct.]
        ],
        [
          #table(
            columns: (1.2fr, 1fr),
            stroke: 0.3pt + rgb("#CBD5E1"),
            fill: (col, row) => if row == 3 { rgb("#EFF6FF") } else { white },
            inset: 2pt,
            align: (left, right),
            [#text(size: 5.8pt)[Total Taxable Value]], [#text(size: 5.8pt, weight: "bold")[₹ #total-taxable]],
            [#text(size: 5.8pt)[Add: CGST]], [#text(size: 5.8pt)[₹ #cgst-amt]],
            [#text(size: 5.8pt)[Add: SGST / IGST]], [#text(size: 5.8pt)[₹ #{if igst-amt != "0.00" { igst-amt } else { sgst-amt }}]],
            [#text(size: 6.2pt, weight: "black", fill: rgb("#1D4ED8"))[Invoice Total]], [#text(size: 6.5pt, weight: "black", fill: rgb("#1D4ED8"))[₹ #grand-total]]
          )
        ]
      )
    ]
  )
}

// =============================================================================
// AUTHOR MOTTO, VISION, CONGRATULATIONS & BEST OF LUCK FINAL PAGE
// Strictly Light Mode (Pure White, Soft Border, Author Photo, Both Mottos)
// =============================================================================

#let rtech-final-page(
  lang: "en",
  photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png"
) = [
  #set page(
    paper: "a4",
    margin: (x: 14mm, top: 16mm, bottom: 14mm),
    fill: white,
    header: none,
    footer: none
  )

  #align(center)[
    #image(logo-path, width: 42mm)
    #v(6pt)
    #box(
      fill: rgb("#ECFDF5"),
      stroke: 1pt + rgb("#A7F3D0"),
      radius: 4pt,
      inset: (x: 12pt, y: 5pt),
      text(size: 9pt, weight: "black", fill: rgb("#065F46"))[
        #{
          if lang == "hi" [पाठ्यक्रम समापन प्रमाणन एवं लेखक का संदेश]
          else if lang == "gu" [અભ્યાસક્રમ પૂર્ણતા પ્રમાણપત્ર અને લેખકનો સંદેશ]
          else [CURRICULUM COMPLETION & AUTHOR'S FINAL MENTORSHIP MESSAGE]
        }
      ]
    )
  ]

  #v(10pt)

  // Author Photo & Personal Motto Card
  #rect(
    width: 100%,
    stroke: 1.5pt + rgb("#0E7490"),
    fill: rgb("#F8FAFC"),
    radius: 6pt,
    inset: 12pt,
    [
      #grid(
        columns: (42mm, 1fr),
        gutter: 14pt,
        align: (center + horizon, left + horizon),
        [
          #box(
            clip: true,
            radius: 6pt,
            stroke: 2pt + rgb("#0E7490"),
            image(photo-path, width: 40mm, height: 48mm, fit: "cover")
          )
          #v(4pt)
          #text(size: 9pt, weight: "black", fill: rgb("#0F172A"))[Rahul Patel]\\
          #text(size: 7pt, weight: "bold", fill: rgb("#0E7490"))[Founder, RTechLab · IANT Palanpur]
        ],
        [
          #text(size: 13pt, weight: "black", fill: rgb("#0F172A"))[
            #{
              if lang == "hi" [हार्दिक बधाई एवं शुभकामनाएं!]
              else if lang == "gu" [હૃદયપૂર્વક અભિનંદન અને શુભેચ્છાઓ!]
              else [Heartiest Congratulations & Best of Luck!]
            }
          ]
          #v(4pt)
          #text(size: 8.2pt, style: "italic", weight: "bold", fill: rgb("#059669"))[
            #{
              if lang == "hi" ["हिसाब में सच्चाई और नियमों में स्पष्टता ही एक सफल अकाउंटेंट की असली पहचान है।"]
              else if lang == "gu" ["હિસાબમાં પવિત્રતા અને નિયમોમાં ચોકસાઈ જ એક સફળ એકાઉન્ટન્ટની સાચી ઓળખ છે."]
              else ["Precision in accounts and integrity in tax compliance is the hallmark of a true corporate accountant."]
            }
          ]
          #v(5pt)
          #text(size: 7.6pt, fill: rgb("#334155"))[
            #{
              if lang == "hi" [
                प्रिय विद्यार्थी, आपने इस सम्पूर्ण हैंडबुक का अध्ययन करके अपने करियर की सबसे ठोस नींव रखी है। टैली प्राइम केवल एक सॉफ्टवेयर नहीं, बल्कि व्यापार का दर्पण है। अब समय है इन नियमों, वाउचर्स और जीएसटी स्लैब्स को अपनी प्रयोगशाला और कार्यक्षेत्र में क्रियान्वित करने का। मुझे पूर्ण विश्वास है कि आप कॉरपोरेट जगत में शीर्ष स्थान प्राप्त करेंगे।
              ]
              else if lang == "gu" [
                વ્હાલા વિદ્યાર્થી મિત્ર, આ સમગ્ર હેન્ડબુકનો અભ્યાસ પૂર્ણ કરવા બદલ ખૂબ ખૂબ અભિનંદન! ટેલી પ્રાઇમ એ માત્ર એક સોફ્ટવેર નથી પણ વેપારની કરોડરજ્જુ છે. હવે આ સુવર્ણ નિયમો, વાઉચર્સ અને જીએસટી સ્લેબ્સને તમારા પ્રેક્ટિકલ કાર્યક્ષેત્રમાં લાગુ કરવાનો સમય છે. મને પૂરો વિશ્વાસ છે કે તમે સફળતાના શિખરો સર કરશો.
              ]
              else [
                Dear Student, Congratulations on mastering this comprehensive curriculum! Tally Prime is not merely software—it is the operational backbone of global commerce. Now is the time to translate these double-entry rules, practical invoices, and statutory tax mechanisms into real-world excellence. You have my full confidence and backing.
              ]
            }
          ]
        ]
      )
    ]
  )

  #v(10pt)

  // Two Mottos Banner
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      #block(
        fill: rgb("#EFF6FF"),
        stroke: 1pt + rgb("#BFDBFE"),
        radius: 4pt,
        inset: 10pt,
        [
          #text(size: 8.5pt, weight: "black", fill: rgb("#1E40AF"))[RTECHLAB OFFICIAL MOTTO]\\
          #v(3pt)
          #text(size: 10.5pt, weight: "bold", fill: rgb("#0284C7"))[Technology Made Practical.]\\
          #text(size: 8.5pt, weight: "bold", fill: rgb("#059669"))[Learn. Practice. Innovate.]\\
          #v(3pt)
          #text(size: 7.2pt, fill: rgb("#475569"))[
            #{
              if lang == "hi" [जटिल तकनीकों और अकाउंटिंग को हर विद्यार्थी के लिए सरल, व्यावहारिक और परिणामोन्मुखी बनाना।]
              else if lang == "gu" [અઘરી ટેકનોલોજી અને એકાઉન્ટિંગને દરેક વિદ્યાર્થી માટે સરળ અને વ્યવહારુ બનાવવી.]
              else [Transforming complex technical and financial systems into actionable, career-defining practical skills.]
            }
          ]
        ]
      )
    ],
    [
      #block(
        fill: rgb("#FFFBEB"),
        stroke: 1pt + rgb("#FDE68A"),
        radius: 4pt,
        inset: 10pt,
        [
          #text(size: 8.5pt, weight: "black", fill: rgb("#92400E"))[RAHUL SIR'S PERSONAL VISION]\\
          #v(3pt)
          #text(size: 10.5pt, weight: "bold", fill: rgb("#B45309"))[Empowering Every Student to Lead.]\\
          #text(size: 8.5pt, weight: "bold", fill: rgb("#0E7490"))[From Palanpur to Global Corporates]\\
          #v(3pt)
          #text(size: 7.2pt, fill: rgb("#475569"))[
            #{
              if lang == "hi" [गुणवत्तापूर्ण शिक्षा केवल बड़े शहरों तक सीमित न रहे, बल्कि गुजरात के हर कोने तक पहुंचे।]
              else if lang == "gu" [શ્રેષ્ઠ શિક્ષણ માત્ર મોટા શહેરો સુધી સીમિત ન રહેતાં, ગુજરાતના દરેક વિદ્યાર્થી સુધી પહોંચે.]
              else [Democratizing premier corporate education so every dedicated student achieves financial independence.]
            }
          ]
        ]
      )
    ]
  )

  #v(10pt)

  // Direct Mentorship & Support Box
  #block(
    fill: rgb("#F0FDFA"),
    stroke: 1pt + rgb("#99F6E4"),
    radius: 4pt,
    inset: 10pt,
    [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 9pt, weight: "bold", fill: rgb("#0F766E"))[
            #{
              if lang == "hi" [आजीवन मेंटरशिप एवं कॉर्पोरेट सपोर्ट डेस्क:]
              else if lang == "gu" [આજીવન માર્ગદર્શન અને સપોર્ટ ડેસ્ક:]
              else [Lifetime Direct Mentorship Desk:]
            }
          ]\\
          #v(2pt)
          #text(size: 7.5pt, fill: rgb("#334155"))[
            Direct Email: *rahul.28e1\@gmail.com* · Official Platform: *rtechlab.vercel.app* · IANT Palanpur Hub
          ]
        ],
        [
          #box(
            fill: rgb("#059669"),
            radius: 3pt,
            inset: (x: 8pt, y: 4pt),
            text(size: 7.5pt, weight: "bold", fill: white)[
              #{
                if lang == "hi" [बेस्ट ऑफ लक!]
                else if lang == "gu" [બેસ્ટ ઓફ લક!]
                else [BEST OF LUCK!]
              }
            ]
          )
        ]
      )
    ]
  )
]
