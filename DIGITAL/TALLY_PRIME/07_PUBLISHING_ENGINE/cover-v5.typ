// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — TALLY PRIME MASTER EDITION (EDITION 1)
// 100% Light Theme · No Dark Backgrounds
// Academic Curriculum Focus · No Self-Promotion on Front
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
// =============================================================================

#let rtech-tally-cover(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  subtitle: "Double Entry Bookkeeping · 28 Predefined Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Commercial Invoices",
  edition: "2027 MASTER COMMERCIAL EDITION · EDITION 1",
  series-pill: "OFFICIAL RTECHLAB & IANT CERTIFIED PUBLICATION",
  author: "Rahul Patel",
  author-title: "Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab",
  lang-tag: "ENGLISH MASTER EDITION",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png"
) = {
  block(
    width: 100%,
    height: 100%,
    fill: white,
    inset: 0pt,
    outset: 0pt,
    [
      #rect(
        width: 100%,
        height: 100%,
        stroke: 2pt + rgb("#0E7490"),
        inset: 11mm,
        fill: white,
        [
          // Header
          #grid(
            columns: (auto, 1fr),
            align: (left + horizon, right + horizon),
            [
              #image(logo-path, width: 44mm)
            ],
            [
              #box(
                fill: rgb("#EFF6FF"),
                stroke: 1pt + rgb("#BFDBFE"),
                radius: 3pt,
                inset: (x: 8pt, y: 3.5pt),
                text(size: 6.8pt, weight: "bold", fill: rgb("#1D4ED8"))[#series-pill]
              )
            ]
          )

          #v(10pt)

          // Title Block
          #align(left)[
            #box(
              fill: rgb("#F0FDFA"),
              stroke: 1pt + rgb("#99F6E4"),
              radius: 2pt,
              inset: (x: 6pt, y: 2.5pt),
              text(size: 7.5pt, weight: "bold", fill: rgb("#0F766E"))[#lang-tag]
            )
            #v(5pt)
            #text(size: 22pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(3pt)
            #text(size: 9.8pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "bold", fill: rgb("#059669"))[
              #subtitle
            ]
            #v(5pt)
            #line(length: 100%, stroke: 1.5pt + rgb("#0E7490"))
          ]

          #v(8pt)

          // Feature Grid Highlights
          #grid(
            columns: (1fr, 1fr),
            gutter: 8pt,
            [
              #block(
                fill: rgb("#F0FDFA"),
                stroke: 1pt + rgb("#99F6E4"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[✔ Double Entry Bookkeeping & Rules]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[Complete coverage of Personal, Real & Nominal accounts, Golden Rules, 28 Predefined Groups and 24 Vouchers.]
                ]
              )
              #v(5pt)
              #block(
                fill: rgb("#FFFBEB"),
                stroke: 1pt + rgb("#FDE68A"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#B45309"))[✔ Modern GST Slabs & Rules]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[Detailed 0% (Exempt), 5% (Essentials), and 18% (Standard) breakdown + interstate IGST and CGST/SGST sets.]
                ]
              )
            ],
            [
              #block(
                fill: rgb("#EFF6FF"),
                stroke: 1pt + rgb("#BFDBFE"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#1D4ED8"))[✔ TDS Corporate Compliance]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[Sections 194C, 194J, 194I, Challan ITNS 281 bank payment, PAN threshold, and Form 26Q quarterly returns.]
                ]
              )
              #v(5pt)
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 1pt + rgb("#E2E8F0"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[✔ 50 Real Invoices & Practice Sets]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[Mr. Verma's 50 entries, Salman's 18 group sets, APMC Mandi, Electronics B2B, Debit/Credit Notes, and Year-End BRS.]
                ]
              )
            ]
          )

          #v(8pt)

          // 11 Core Curriculum Domains (Replaces Author Photo Card on Front)
          #block(
            width: 100%,
            fill: rgb("#F8FAFC"),
            stroke: 1.2pt + rgb("#CBD5E1"),
            inset: 8pt,
            radius: 4pt,
            [
              #text(size: 8.5pt, weight: "black", fill: rgb("#0F172A"))[EXHAUSTIVE 11-TOPIC COMMERCIAL CURRICULUM ARCHITECTURE]\
              #v(4pt)
              #grid(
                columns: (1fr, 1fr),
                gutter: 6pt,
                [
                  #text(size: 6.8pt, fill: rgb("#334155"))[
                    *01. History & Evolution:* Bharat Goenka, 80% Market Share, Silver/Gold/Edu\\
                    *02. System Architecture:* Cactus Database Engine, Top Menu, Go To (Alt+G)\\
                    *03. GST & TDS Foundation:* 0%, 5%, 18% Slabs, Sec 194C/J/I/H, Form 26Q\\
                    *04. Golden Rules of Accounts:* Personal, Real, Nominal & 20+ Dr/Cr Proofs\\
                    *05. 24 Vouchers & Shortcuts:* Accounting, Inventory, Order & Memo Categories\\
                    *06. 28 Predefined Groups:* 15 Primary + 13 Secondary & 50+ Ledger Mappings
                  ]
                ],
                [
                  #text(size: 6.8pt, fill: rgb("#334155"))[
                    *07. Company Creation:* Step-by-Step, Gujarat Code 24, FY, F11 & F12 Config\\
                    *08. Types of Business:* Trading Concerns, Manufacturing & Professional Service\\
                    *09. Practical Invoicing:* Inventory Invoices (Item Mode) vs Accounting Invoices\\
                    *10. Master Shortcuts:* 40+ Corporate Shortcuts for High-Speed Accounting\\
                    *11. Corporate Bridge:* GSTR-1/3B/2B, Bank Reconciliation (BRS), Cost Centres
                  ]
                ]
              )
            ]
          )

          #v(8pt)

          // Institutional Endorsement & Course Credentials
          #block(
            width: 100%,
            fill: rgb("#F0FDF4"),
            stroke: 1pt + rgb("#BBF7D0"),
            inset: (x: 9pt, y: 6pt),
            radius: 3pt,
            [
              #grid(
                columns: (1fr, auto),
                align: (left + horizon, right + horizon),
                [
                  #text(size: 7.2pt, weight: "bold", fill: rgb("#166534"))[Curriculum Standardized by Rahul Patel] #text(size: 6.8pt, fill: rgb("#15803D"))[· Lead Corporate Accounting Trainer at IANT Palanpur]\
                  #text(size: 6.5pt, fill: rgb("#475569"))[Designed for B.Com/M.Com Students, Commerce Scholars, CA Articles, Accounts Executives & Business Owners]
                ],
                [
                  #box(
                    fill: rgb("#DCFCE7"),
                    stroke: 0.5pt + rgb("#86EFAC"),
                    radius: 2pt,
                    inset: (x: 5pt, y: 2.5pt),
                    text(size: 6.5pt, weight: "bold", fill: rgb("#166534"))[100% PRACTICAL LAB]
                  )
                ]
              )
            ]
          )

          #v(8pt)

          // Footer Banner (100% Light Themed)
          #block(
            width: 100%,
            fill: rgb("#F0FDFA"),
            stroke: 1.5pt + rgb("#0E7490"),
            inset: (x: 9pt, y: 6pt),
            radius: 4pt,
            [
              #grid(
                columns: (1fr, auto),
                align: (left + horizon, right + horizon),
                [
                  #text(size: 7.8pt, weight: "bold", fill: rgb("#0F172A"))[#edition]\
                  #text(size: 6.5pt, fill: rgb("#475569"))[Comprehensive Practice Edition · Verified for Tally Prime 4.x / 5.x & GST Portal 2026-2027]
                ],
                [
                  #box(
                    fill: rgb("#059669"),
                    radius: 2pt,
                    inset: (x: 6pt, y: 3pt),
                    text(size: 6.8pt, weight: "bold", fill: white)[LIFETIME UPDATES INCLUDED]
                  )
                ]
              )
            ]
          )
        ]
      )
    ]
  )
}
