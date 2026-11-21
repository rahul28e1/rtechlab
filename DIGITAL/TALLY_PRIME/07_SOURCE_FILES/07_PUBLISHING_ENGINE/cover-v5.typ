// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — TALLY PRIME MASTER EDITION (EDITION 1)
// 100% Light Theme · No Dark Backgrounds
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
// =============================================================================

#let rtech-tally-cover(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  subtitle: "Double Entry Bookkeeping · 28 Predefined Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Commercial Invoices",
  edition: "2027 MASTER COMMERCIAL EDITION · EDITION 1",
  series-pill: "OFFICIAL RTECHLAB & IANT CERTIFIED PUBLICATION",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab | Certified Corporate Accountant",
  lang-tag: "ENGLISH MASTER EDITION",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg"
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
        inset: 12mm,
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

          #v(14pt)

          // Title Block
          #align(left)[
            #box(
              fill: rgb("#F0FDFA"),
              stroke: 1pt + rgb("#99F6E4"),
              radius: 2pt,
              inset: (x: 6pt, y: 2.5pt),
              text(size: 7.5pt, weight: "bold", fill: rgb("#0F766E"))[#lang-tag]
            )
            #v(6pt)
            #text(size: 24pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
              #title
            ]
            #v(4pt)
            #text(size: 10.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "bold", fill: rgb("#059669"))[
              #subtitle
            ]
            #v(6pt)
            #line(length: 100%, stroke: 2pt + rgb("#0E7490"))
          ]

          #v(10pt)

          // Feature Grid Highlights
          #grid(
            columns: (1fr, 1fr),
            gutter: 10pt,
            [
              #block(
                fill: rgb("#F0FDFA"),
                stroke: 1pt + rgb("#99F6E4"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#0F766E"))[✔ Double Entry Bookkeeping & Rules]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[Complete coverage of Personal, Real & Nominal accounts, Golden Rules, 28 Predefined Groups and 24 Vouchers.]
                ]
              )
              #v(6pt)
              #block(
                fill: rgb("#FFFBEB"),
                stroke: 1pt + rgb("#FDE68A"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#B45309"))[✔ Modern GST Slabs & Rules]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[Detailed 0% (Exempt), 5% (Essentials), and 18% (Standard) breakdown + interstate IGST and CGST/SGST sets.]
                ]
              )
            ],
            [
              #block(
                fill: rgb("#EFF6FF"),
                stroke: 1pt + rgb("#BFDBFE"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#1D4ED8"))[✔ TDS Corporate Compliance]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[Sections 194C, 194J, 194I, Challan ITNS 281 bank payment, PAN threshold, and Form 26Q quarterly returns.]
                ]
              )
              #v(6pt)
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 1pt + rgb("#E2E8F0"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#0F172A"))[✔ 50 Real Invoices & Practice Sets]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[Mr. Verma's 50 entries, Salman's 18 group sets, APMC Mandi, Electronics B2B, Debit/Credit Notes, and Year-End BRS.]
                ]
              )
            ]
          )

          #v(16pt)

          // Author Card
          #grid(
            columns: (52mm, 1fr),
            gutter: 14pt,
            align: (center + horizon, left + horizon),
            [
              #box(
                clip: true,
                radius: 4pt,
                stroke: 2pt + rgb("#0E7490"),
                image(photo-path, width: 48mm, height: 56mm, fit: "cover")
              )
            ],
            [
              #text(size: 14pt, weight: "black", fill: rgb("#0F172A"))[#author]\
              #v(2pt)
              #text(size: 8.5pt, weight: "bold", fill: rgb("#0E7490"))[#author-title]\
              #v(4pt)
              #text(size: 7.5pt, fill: rgb("#475569"))[
                Expert IT Educator & Lead Instructor at IANT Palanpur. Mentored thousands of students into top accounting, banking, and IT engineering roles across India. This master handbook synthesizes 10+ years of corporate accounting and student coaching experience into an exhaustive, highly practical blueprint.
              ]\
              #v(6pt)
              #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
              #v(4pt)
              #grid(
                columns: (1fr, 1fr),
                [#text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Verified Publisher:] #text(size: 7pt, fill: rgb("#64748B"))[RTechLab Platforms]],
                [#text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[Official Portal:] #text(size: 7pt, fill: rgb("#0284C7"))[rtechlab.vercel.app]]
              )
            ]
          )

          #v(12pt)

          // Footer Banner (100% Light Themed)
          #block(
            width: 100%,
            fill: rgb("#F0FDFA"),
            stroke: 1.5pt + rgb("#0E7490"),
            inset: (x: 10pt, y: 7pt),
            radius: 4pt,
            [
              #grid(
                columns: (1fr, auto),
                align: (left + horizon, right + horizon),
                [
                  #text(size: 8pt, weight: "bold", fill: rgb("#0F172A"))[#edition]\
                  #text(size: 6.8pt, fill: rgb("#475569"))[Comprehensive Practice Edition · Verified for Tally Prime 4.x / 5.x & GST Portal 2026-2027]
                ],
                [
                  #box(
                    fill: rgb("#059669"),
                    radius: 2pt,
                    inset: (x: 6pt, y: 3pt),
                    text(size: 7pt, weight: "bold", fill: white)[LIFETIME UPDATES INCLUDED]
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
