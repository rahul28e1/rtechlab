// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — TALLY PRIME MASTER EDITION (HINDI)
// 100% Light Theme · No Dark Backgrounds
// Academic Curriculum Focus · No Self-Promotion on Front
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
// =============================================================================

#let rtech-tally-cover-hi(
  title: "टैली प्राइम विद जीएसटी एवं कॉर्पोरेट अकाउंटिंग",
  subtitle: "डबल एंट्री बुककीपिंग · 28 पूर्व-निर्धारित ग्रुप्स · 24 वाउचर्स · आधुनिक जीएसटी स्लैब्स (0%, 5%, 18%) · टीडीएस · 50 प्रैक्टिकल इनवॉइस",
  edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1",
  series-pill: "ऑफिशियल आरटेक लैब एवं आईएएनटी प्रमाणित प्रकाशन",
  author: "राहुल पटेल",
  author-title: "लीड कॉर्पोरेट अकाउंटिंग ट्रेनर, IANT पालनपुर | फाउंडर, RTechLab",
  lang-tag: "हिंदी मास्टर एडिशन (HINDI COMPLETE EDITION)",
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
            #text(size: 21pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
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
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[✔ डबल एंट्री और सुनहरे नियम]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[व्यक्तिगत, वास्तविक व नाममात्र खाते, डेबिट-क्रेडिट के सुनहरे नियम, 28 ग्रुप्स और 24 वाउचर्स का सरल हिंदी विश्लेषण।]
                ]
              )
              #v(5pt)
              #block(
                fill: rgb("#FFFBEB"),
                stroke: 1pt + rgb("#FDE68A"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#B45309"))[✔ आधुनिक जीएसटी स्लैब व नियम]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[00% (मुक्त कृषि जींस), 05% (आवश्यक सामग्री) और 18% (मानक इलेक्ट्रॉनिक्स) का विस्तृत नियम एवं अंतर्राज्यीय आईजीएसटी।]
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
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#1D4ED8"))[✔ टीडीएस कॉर्पोरेट अनुपालन]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[धारा 194C ठेकेदार, 194J व्यावसायिक शुल्क, 194I किराया, चालान 281 बैंक भुगतान, पैन अनिवार्यता और फॉर्म 26Q।]
                ]
              )
              #v(5pt)
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 1pt + rgb("#E2E8F0"),
                inset: 7pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[✔ 50 वास्तविक इनवॉइस व अभ्यास]\
                  #v(2pt)
                  #text(size: 7pt, fill: rgb("#334155"))[श्री वर्मा के 50 लेनदेन, सलमान ट्रेडिंग 18 ग्रुप्स, ऊंझा एपीएमसी जीरा/इसबगोल, इलेक्ट्रॉनिक्स एवं वित्तीय वर्ष क्लोजिंग।]
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
              #text(size: 8.5pt, weight: "black", fill: rgb("#0F172A"))[संपूर्ण 11-विषय व्यावहारिक कॉर्पोरेट पाठ्यक्रम रूपरेखा]\
              #v(4pt)
              #grid(
                columns: (1fr, 1fr),
                gutter: 6pt,
                [
                  #text(size: 6.8pt, fill: rgb("#334155"))[
                    *01. टैली का इतिहास व विकास:* भरत गोयनका, 80% बाजार हिस्सेदारी, लाइसेंसिंग\\
                    *02. सिस्टम आर्किटेक्चर:* कैक्टस डेटाबेस इंजन, टॉप मेनू, गो-टू (Alt+G)\\
                    *03. जीएसटी व टीडीएस आधारशिला:* 0%, 5%, 18% स्लैब्स, धारा 194C/J/I/H, 26Q\\
                    *04. खातों के सुनहरे नियम:* व्यक्तिगत, वास्तविक, नाममात्र व 20+ Dr/Cr प्रमाण\\
                    *05. 24 वाउचर्स व शॉर्टकट्स:* अकाउंटिंग, इन्वेंटरी, ऑर्डर व मेमो श्रेणियां\\
                    *06. 28 पूर्व-निर्धारित ग्रुप्स:* 15 प्राथमिक + 13 द्वितीयक व 50+ लेजर मैपिंग्स
                  ]
                ],
                [
                  #text(size: 6.8pt, fill: rgb("#334155"))[
                    *07. कंपनी निर्माण प्रक्रिया:* चरणबद्ध निर्माण, गुजरात कोड 24, F11 व F12 सेटअप\\
                    *08. व्यावसायिक संगठन प्रकार:* ट्रेडिंग, मैन्युफैक्चरिंग एवं सेवा क्षेत्र\\
                    *09. प्रैक्टिकल इनवॉइस निर्माण:* इन्वेंटरी इनवॉइस बनाम अकाउंटिंग इनवॉइस\\
                    *10. मास्टर शॉर्टकट्स:* उच्च गति डाटा एंट्री हेतु 40+ कॉर्पोरेट शॉर्टकट्स\\
                    *11. कॉर्पोरेट ब्रिज विषय:* GSTR-1/3B/2B मिलान, बैंक समाधान (BRS), कॉस्ट सेंटर
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
                  #text(size: 7.2pt, weight: "bold", fill: rgb("#166534"))[पाठ्यक्रम निर्माण: राहुल पटेल] #text(size: 6.8pt, fill: rgb("#15803D"))[· लीड कॉर्पोरेट अकाउंटिंग ट्रेनर, IANT पालनपुर]\
                  #text(size: 6.5pt, fill: rgb("#475569"))[कॉमर्स विद्यार्थियों, बी.कॉम/एम.कॉम, सीए आर्टिकल्स, अकाउंट्स एग्जीक्यूटिव्स एवं व्यापारियों हेतु विशेष रूप से तैयार]
                ],
                [
                  #box(
                    fill: rgb("#DCFCE7"),
                    stroke: 0.5pt + rgb("#86EFAC"),
                    radius: 2pt,
                    inset: (x: 5pt, y: 2.5pt),
                    text(size: 6.5pt, weight: "bold", fill: rgb("#166534"))[100% प्रैक्टिकल]
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
                  #text(size: 6.5pt, fill: rgb("#475569"))[सम्पूर्ण प्रैक्टिकल संस्करण · टैली प्राइम 4.x / 5.x एवं नए जीएसटी नियमों (2026-2027) हेतु पूरी तरह अद्यतित]
                ],
                [
                  #box(
                    fill: rgb("#059669"),
                    radius: 2pt,
                    inset: (x: 6pt, y: 3pt),
                    text(size: 6.8pt, weight: "bold", fill: white)[आजीवन अपडेट्स शामिल]
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
