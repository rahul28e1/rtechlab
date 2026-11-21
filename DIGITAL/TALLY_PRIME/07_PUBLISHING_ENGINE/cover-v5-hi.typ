// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — TALLY PRIME MASTER EDITION (HINDI)
// 100% Light Theme · No Dark Backgrounds
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
// =============================================================================

#let rtech-tally-cover-hi(
  title: "टैली प्राइम विद जीएसटी एवं कॉर्पोरेट अकाउंटिंग",
  subtitle: "डबल एंट्री बुककीपिंग · 28 पूर्व-निर्धारित ग्रुप्स · 24 वाउचर्स · आधुनिक जीएसटी स्लैब्स (0%, 5%, 18%) · टीडीएस · 50 प्रैक्टिकल इनवॉइस",
  edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1",
  series-pill: "ऑफिशियल आरटेक लैब एवं आईएएनटी प्रमाणित प्रकाशन",
  author: "राहुल पटेल",
  author-title: "फाउंडर एवं चीफ टेक्नोलॉजी आर्किटेक्ट, RTechLab | कॉर्पोरेट अकाउंटिंग ट्रेनर",
  lang-tag: "हिंदी मास्टर एडिशन (HINDI COMPLETE EDITION)",
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
            #text(size: 23pt, font: ("Segoe UI", "Nirmala UI", "Arial"), weight: "black", fill: rgb("#0F172A"), tracking: 0.5pt)[
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
                  #text(weight: "bold", size: 9pt, fill: rgb("#0F766E"))[✔ डबल एंट्री और सुनहरे नियम]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[व्यक्तिगत, वास्तविक व नाममात्र खाते, डेबिट-क्रेडिट के सुनहरे नियम, 28 ग्रुप्स और 24 वाउचर्स का सरल हिंदी विश्लेषण।]
                ]
              )
              #v(6pt)
              #block(
                fill: rgb("#FFFBEB"),
                stroke: 1pt + rgb("#FDE68A"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#B45309"))[✔ आधुनिक जीएसटी स्लैब व नियम]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[00% (मुक्त कृषि जींस), 05% (आवश्यक सामग्री) और 18% (मानक इलेक्ट्रॉनिक्स) का विस्तृत नियम एवं अंतर्राज्यीय आईजीएसटी।]
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
                  #text(weight: "bold", size: 9pt, fill: rgb("#1D4ED8"))[✔ टीडीएस कॉर्पोरेट अनुपालन]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[धारा 194C ठेकेदार, 194J व्यावसायिक शुल्क, 194I किराया, चालान 281 बैंक भुगतान, पैन अनिवार्यता और फॉर्म 26Q।]
                ]
              )
              #v(6pt)
              #block(
                fill: rgb("#F8FAFC"),
                stroke: 1pt + rgb("#E2E8F0"),
                inset: 8pt,
                radius: 4pt,
                [
                  #text(weight: "bold", size: 9pt, fill: rgb("#0F172A"))[✔ 50 वास्तविक इनवॉइस व अभ्यास]\
                  #v(2pt)
                  #text(size: 7.2pt, fill: rgb("#334155"))[श्री वर्मा के 50 लेनदेन, सलमान ट्रेडिंग 18 ग्रुप्स, ऊंझा एपीएमसी जीरा/इसबगोल, इलेक्ट्रॉनिक्स एवं वित्तीय वर्ष क्लोजिंग।]
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
                आईआईटी/आईटी एवं कॉर्पोरेट अकाउंटिंग के प्रमुख ट्रेनर, आईएएनटी पालनपुर। गुजरात एवं संपूर्ण भारत के 1,000+ से अधिक छात्रों को कॉर्पोरेट जगत में अकाउंटेंट और सीए फर्मों में स्थापित किया। यह हैंडबुक जमीनी स्तर के प्रैक्टिकल अकाउंटिंग अनुभव का सार है।
              ]\
              #v(6pt)
              #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
              #v(4pt)
              #grid(
                columns: (1fr, 1fr),
                [#text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[प्रमाणित प्रकाशक:] #text(size: 7pt, fill: rgb("#64748B"))[आरटेक लैब प्लेटफॉर्म्स]],
                [#text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[आधिकारिक वेबसाइट:] #text(size: 7pt, fill: rgb("#0284C7"))[rtechlab.vercel.app]]
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
                  #text(size: 6.8pt, fill: rgb("#475569"))[सम्पूर्ण प्रैक्टिकल संस्करण · टैली प्राइम 4.x / 5.x एवं नए जीएसटी नियमों (2026-2027) हेतु पूरी तरह अद्यतित]
                ],
                [
                  #box(
                    fill: rgb("#059669"),
                    radius: 2pt,
                    inset: (x: 6pt, y: 3pt),
                    text(size: 7pt, weight: "bold", fill: white)[आजीवन अपडेट्स शामिल]
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
