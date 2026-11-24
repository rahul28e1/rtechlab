// =============================================================================
// RTECHLAB OFFICIAL A4 COVER — WINDOWS SERVER 2025 MASTER SUITE (HINDI / HINGLISH)
// 100% Clean Academic Light Theme · Microsoft Enterprise Blue Aesthetics
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-server-cover(
  title: "माइक्रोसॉफ्ट विंडोज सर्वर 2025 एवं एक्टिव डायरेक्टरी",
  subtitle: "क्लाइंट-सर्वर आर्किटेक्चर · AD DS डोमेन कंट्रोलर · ग्रुप पॉलिसी (GPO) · DNS एवं DHCP · स्टोरेज स्पेसेस · हाइब्रिड अज़ूर आर्क · टॉप 50 MNC प्लेसमेंट वॉल्ट",
  edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1 (Server 2025 Ready)",
  series-pill: "ऑफिशियल आरटेक लैब प्रमाणित सिस्टम एडमिनिस्ट्रेशन गाइड",
  author: "राहुल पटेल",
  author-title: "चीफ टेक्नोलॉजी आर्किटेक्ट एवं फाउंडर, RTechLab",
  lang-tag: "हिंदी / हिंग्लिश मास्टर संस्करण (HINDI BILINGUAL EDITION)",
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
        stroke: 2.5pt + rgb("#0284C7"),
        inset: 10mm,
        fill: white,
        [
          // Header Logo & Pill
          #grid(
            columns: (auto, 1fr),
            align: (left + horizon, right + horizon),
            [
              #image(logo-path, width: 46mm)
            ],
            [
              #box(
                fill: rgb("#EFF6FF"),
                stroke: 1pt + rgb("#BFDBFE"),
                radius: 4pt,
                inset: (x: 8pt, y: 3.5pt),
                text(size: 7pt, weight: "bold", fill: rgb("#1D4ED8"))[#series-pill]
              )
            ]
          )

          #v(10pt)

          // Title Block
          #align(left)[
            #box(
              fill: rgb("#F0F9FF"),
              stroke: 1pt + rgb("#BAE6FD"),
              radius: 3pt,
              inset: (x: 6pt, y: 2.5pt),
              text(size: 7.5pt, weight: "bold", fill: rgb("#0369A1"))[#lang-tag]
            )
            #v(6pt)
            #text(size: 21pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rgb("#0F172A"), tracking: 0.3pt)[
              #title
            ]
            #v(4pt)
            #text(size: 9.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "bold", fill: rgb("#0284C7"))[
              #subtitle
            ]
            #v(6pt)
            #line(length: 100%, stroke: 1.5pt + rgb("#0284C7"))
          ]

          #v(8pt)

          // 4 Core Highlight Pillars
          #grid(
            columns: (1fr, 1fr),
            gutter: 8pt,
            [
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#64748B"),
                radius: 4pt,
                inset: 8pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[🌲 Active Directory & GPO Mastery]
                  #v(2pt)
                  #text(size: 7.5pt, fill: rgb("#475569"))[
                    AD DS Forest, Tree, Domain Controllers, OUs, Security Groups, FSMO 5 Roles, and Group Policy Lockdown.
                  ]
                ]
              )
            ],
            [
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#64748B"),
                radius: 4pt,
                inset: 8pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[🌐 Enterprise Network Services]
                  #v(2pt)
                  #text(size: 7.5pt, fill: rgb("#475569"))[
                    DNS Forward/Reverse Zones, Scavenging, DHCP Scope, Reservations, Failover & IIS Web Hosting.
                  ]
                ]
              )
            ],
            [
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#64748B"),
                radius: 4pt,
                inset: 8pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[☁️ Windows Server 2025 & Azure Arc]
                  #v(2pt)
                  #text(size: 7.5pt, fill: rgb("#475569"))[
                    Hotpatching, 32KB AD Database Page Size, Next-Gen Storage Spaces Direct, Hybrid Cloud Management.
                  ]
                ]
              )
            ],
            [
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 0.5pt + rgb("#64748B"),
                radius: 4pt,
                inset: 8pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[🏆 Top 50 MNC Placement Vault]
                  #v(2pt)
                  #text(size: 7.5pt, fill: rgb("#475569"))[
                    Real L1/L2 System Administrator, Desktop Support & NOC scenario questions asked in Wipro, Infosys & TCS.
                  ]
                ]
              )
            ]
          )

          #v(10pt)

          // Center Graphic Frame
          #align(center)[
            #block(
              stroke: 0.5pt + rgb("#64748B"),
              radius: 4pt,
              fill: rgb("#F8FAFC"),
              inset: 4pt,
              [
                #image("../02_BRAND_ASSETS/screenshots/client_server_architecture.png", width: 88%)
              ]
            )
          ]

          #v(10pt)

          // Footer Block: Author & Edition Details
          #align(bottom)[
            #line(length: 100%, stroke: 0.6pt + rgb("#CBD5E1"))
            #v(4pt)
            #grid(
              columns: (1fr, auto),
              align: (left + horizon, right + horizon),
              [
                #text(size: 8.5pt, weight: "bold", fill: rgb("#0F172A"))[#author]
                #h(6pt)
                #text(size: 7.5pt, fill: rgb("#475569"))[| #author-title]
                #v(1.5pt)
                #text(size: 7pt, fill: rgb("#64748B"))[
                  Verified Academic Standard · Zero-Fluff Practical Curriculum · RTechLab Publications
                ]
              ],
              [
                #box(
                  fill: rgb("#0F172A"),
                  radius: 3pt,
                  inset: (x: 8pt, y: 4pt),
                  text(size: 7pt, weight: "bold", fill: white)[#edition]
                )
              ]
            )
          ]
        ]
      )
    ]
  )
}
