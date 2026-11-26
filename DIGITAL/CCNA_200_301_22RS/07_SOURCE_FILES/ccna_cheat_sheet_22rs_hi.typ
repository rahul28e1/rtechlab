#set document(
  title: "RTechLab — Cisco CCNA 200-301 & Networking Quick Desk Cheat Sheet (Hindi)",
  author: "Rahul Patel — RTechLab Vocational Learning Systems",
)

#set page(
  paper: "a4",
  margin: (top: 9.5mm, bottom: 8mm, left: 8.5mm, right: 8.5mm),
  header-ascent: 2mm,
  footer-descent: 2mm,
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #set text(size: 7.2pt, fill: rgb("#475569"), font: ("Nirmala UI", "Segoe UI"))
      #grid(
        columns: (1fr, auto),
        align: (left + bottom, right + bottom),
        [
          #box(
            fill: rgb("#0f172a"),
            inset: (x: 5pt, y: 2pt),
            radius: 2pt,
            text(fill: rgb("#ffffff"), weight: "bold", size: 6.8pt)[RTechLab]
          )
          #h(4pt)
          #text(weight: "bold", fill: rgb("#0f172a"))[Cisco CCNA 200-301 & Networking]
          #text(fill: rgb("#64748b"))[ · 10-पेज त्वरित डेस्क गाइड (हिंदी संस्करण)]
        ],
        [
          #text(fill: rgb("#0284c7"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 डेस्क एडिशन]
        ]
      )
      #v(-3pt)
      #line(length: 100%, stroke: 0.6pt + rgb("#cbd5e1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
      #v(-2pt)
      #set text(size: 7pt, fill: rgb("#64748b"), font: ("Nirmala UI", "Segoe UI"))
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [© RTechLab Original Edition · सीखें · अभ्यास करें · जुड़ें · Free Subnetting & CLI Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[पेज #p / 10]]]
      )
    ]
  }
)

#set text(font: ("Nirmala UI", "Segoe UI"), size: 8.6pt, fill: rgb("#1e293b"))
#set par(leading: 0.71em, justify: false)

// --- HELPER COMPONENTS ---
#let section-banner(num, title, subtitle, bg: rgb("#0f172a"), accent: rgb("#0284c7")) = {
  box(
    width: 100%,
    fill: bg,
    radius: 3.5pt,
    inset: (x: 9pt, y: 6pt),
    stroke: (left: 4.5pt + accent),
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      gutter: 7pt,
      box(fill: accent, radius: 2.5pt, inset: (x: 6pt, y: 3pt))[
        #text(fill: white, weight: "bold", size: 8.8pt)[#num]
      ],
      text(fill: white, weight: "bold", size: 10.2pt)[#title],
      text(fill: rgb("#93c5fd"), size: 7.6pt, weight: "semibold")[#subtitle]
    )
  )
  v(6.5pt)
}

#let card(title, body, border: rgb("#cbd5e1"), head-bg: rgb("#f8fafc"), title-color: rgb("#0f172a"), pad: 8.8pt) = {
  box(
    width: 100%,
    fill: white,
    stroke: 0.65pt + border,
    radius: 4pt,
    [
      #box(
        width: 100%,
        fill: head-bg,
        inset: (x: 7.5pt, y: 4.5pt),
        stroke: (bottom: 0.5pt + border),
        radius: (top: 4pt),
        text(weight: "bold", size: 8.7pt, fill: title-color)[#title]
      )
      #box(width: 100%, inset: pad)[#body]
    ]
  )
}

#let cmd(code) = {
  box(
    fill: rgb("#0f172a"),
    inset: (x: 4pt, y: 1.8pt),
    radius: 2pt,
    text(font: "Consolas", size: 7.6pt, fill: rgb("#38bdf8"))[#code]
  )
}

#let hl-y(t) = box(fill: rgb("#fef08a"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#713f12"))[#t])
#let hl-g(t) = box(fill: rgb("#dcfce7"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#14532d"))[#t])
#let hl-b(t) = box(fill: rgb("#dbeafe"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#1e3a8a"))[#t])
#let hl-r(t) = box(fill: rgb("#fee2e2"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#7f1d1d"))[#t])

#let did-you-know(fact) = {
  box(
    width: 100%,
    fill: rgb("#fffbeb"),
    stroke: (left: 4pt + rgb("#f59e0b"), rest: 0.6pt + rgb("#fde68a")),
    radius: 3.5pt,
    inset: (x: 8.5pt, y: 6pt),
    text(size: 8.1pt, fill: rgb("#78350f"))[
      *💡 क्या आप जानते हैं?* #fact
    ]
  )
}

#let tbl(cols, headers, rows, pad-y: 4.2pt, fsize: 7.8pt) = {
  set text(size: fsize)
  table(
    columns: cols,
    inset: (x: 4.5pt, y: pad-y),
    stroke: 0.45pt + rgb("#cbd5e1"),
    fill: (_, y) => if y == 0 { rgb("#0f172a") } else if calc.odd(y) { rgb("#ffffff") } else { rgb("#f8fafc") },
    ..headers.map(h => text(fill: white, weight: "bold", size: fsize)[#h]),
    ..rows.flatten()
  )
}

// =========================================================================
// PAGE 1: FULL-BLEED CUSTOM COVER ARTWORK
// =========================================================================
#page(margin: 0mm, header: none, footer: none)[
  #place(top + left)[
    #image("02_BRAND_ASSETS/ccna_cover.jpg", width: 210mm, height: 297mm, fit: "cover")
  ]
]

#pagebreak()

// =========================================================================
// PAGE 2: NETWORK TYPES, TOPOLOGIES & ARCHITECTURES
// =========================================================================
#section-banner("01", "नेटवर्क के प्रकार, टोपोलॉजी और आर्किटेक्चर", "CCNA 200-301 Domain 1.0 · नेटवर्क फंडामेंटल्स")

#grid(
  columns: (1.18fr, 0.82fr),
  gutter: 6.5pt,
  card(
    "आकार, दूरी और उपयोग के आधार पर नेटवर्क के प्रकार",
    tbl(
      (auto, auto, 1fr, auto),
      ("प्रकार", "पूरा नाम", "दायरा, माध्यम और मुख्य उपयोग", "रेंज"),
      (
        ([*PAN*], [Personal Area], [Bluetooth, Zigbee, NFC, USB; स्मार्टवॉच, ईयरबड्स, लैपटॉप], [1–10 m]),
        ([*LAN*], [Local Area], [Ethernet (`802.3`) और Switch; ऑफिस, घर, कंप्यूटर लैब], [100 m तक]),
        ([*WLAN*], [Wireless LAN], [Wi-Fi (`802.11ax/be`), Access Points (AP) और WLC], [30–100 m]),
        ([*CAN*], [Campus Area], [फाइबर बैकबोन से जुड़ी इमारतों का LAN; यूनिवर्सिटी/कैंपस], [1–5 km]),
        ([*MAN*], [Metro Area], [शहर भर में फैला हाई-स्पीड Metro Ethernet / फाइबर रिंग], [5–50 km]),
        ([*WAN*], [Wide Area], [लीज़्ड लाइन, MPLS, ब्रॉडबैंड, 5G से ग्लोबल ब्रांच कनेक्शन], [50+ km]),
        ([*SAN*], [Storage Area], [Fibre Channel / iSCSI द्वारा सर्वर के लिए हाई-स्पीड स्टोरेज], [डेटा सेंटर]),
        ([*VPN*], [Virtual Private], [पब्लिक इंटरनेट पर एन्क्रिप्टेड टनल (`IPsec` / `SSL` / `WireGuard`)], [ग्लोबल]),
        ([*SD-WAN*], [Software-Defined WAN], [सेंट्रल कंट्रोलर MPLS, ISP और LTE ट्रैफिक को स्मार्टली रूट करता है], [मल्टी-साइट]),
      ),
      pad-y: 4.6pt,
      fsize: 8.1pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "फिजिकल और लॉजिकल टोपोलॉजी (Visual Guide)",
    [
      #align(center)[#image("02_BRAND_ASSETS/ccna_topology_visual.png", width: 100%)]
      #v(4pt)
      #set text(size: 8.1pt)
      - *Star / Hub-Spoke:* सभी होस्ट सेंट्रल Switch से जुड़ते हैं। फॉल्ट ढूँढना आसान; सेंट्रल स्विच सिंगल पॉइंट ऑफ फेल्योर।
      - *Full Mesh:* हर नोड हर दूसरे नोड से जुड़ता है। लिंक्स = $n(n-1)/2$। अधिकतम रिडंडेंसी, अधिक खर्च।
      - *Partial Mesh:* मुख्य HQ साइट्स फुल मेश; ब्रांच साइट्स ड्यूल-होम्ड।
      - *Spine-Leaf (Data Center):* हर Leaf हर Spine से जुड़ता है — कम लेटेंसी और ECMP लोड बैलेंसिंग।
      - *Three-Tier Campus:* *Core* (हाई-स्पीड L3) → *Distribution* (पॉलिसी/रूटिंग) → *Access* (यूजर पोर्ट्स, PoE)।
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(12pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "ट्रांसमिशन मोड्स और कम्युनिकेशन प्रकार",
    [
      #tbl(
        (auto, 1fr),
        ("मोड / प्रकार", "व्यवहार और CCNA परीक्षा के मुख्य तथ्य"),
        (
          ([*Simplex*], [केवल एक तरफ डेटा (TV ब्रॉडकास्ट, कीबोर्ड)। कोई रिटर्न पाथ नहीं।]),
          ([*Half-Duplex*], [दोनों तरफ, पर एक समय में एक। *CSMA/CD* (Hubs)। टकराव संभव।]),
          ([*Full-Duplex*], [एक साथ Tx और Rx। *Switches*; शून्य कोलिजन।]),
          ([*Unicast*], [1-से-1 कम्युनिकेशन (निश्चित MAC/IP)।]),
          ([*Broadcast*], [1-से-सभी (सबनेट में: `FF:FF:FF:FF:FF:FF`, `255.255.255.255`)।]),
          ([*Multicast*], [1-से-ग्रुप (`224.0.0.0–239.255.255.255`, OSPF `224.0.0.5`)।]),
          ([*Anycast*], [1-से-सबसे नज़दीकी नोड (IPv6 / DNS रूट सर्वर)।]),
        ),
        pad-y: 4.5pt,
        fsize: 8.1pt
      )
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "कोलिजन डोमेन बनाम ब्रॉडकास्ट डोमेन",
    [
      #tbl(
        (auto, auto, auto),
        ("डिवाइस", "कोलिजन डोमेन", "ब्रॉडकास्ट डोमेन"),
        (
          ([*Hub / Repeater (L1)*], [1 साझा डोमेन], [1 साझा डोमेन]),
          ([*Bridge / L2 Switch*], [*प्रति स्विच पोर्ट 1*], [1 (VLAN के बिना)]),
          ([*L2 Switch + VLANs*], [प्रति स्विच पोर्ट 1], [*प्रति VLAN 1*]),
          ([*Router / L3 Switch*], [प्रति इंटरफ़ेस 1], [*प्रति इंटरफ़ेस / SVI 1*]),
        ),
        pad-y: 4.6pt,
        fsize: 8.1pt
      )
      #v(4pt)
      #set text(size: 8.1pt)
      - *CSMA/CD (Ethernet Half-Duplex):* भेजने से पहले सुनें; कोलिजन होने पर जैम सिग्नल + रैंडम बैकऑफ़।
      - *CSMA/CA (Wi-Fi `802.11`):* RTS/CTS और ACK फ्रेम से कोलिजन रोकता है।
      - *Store-and-Forward vs Cut-Through:* Store-and-Forward पूरा FCS (CRC) जाँचता है; Cut-Through केवल Dest MAC पढ़कर भेजता है।
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(12pt)
#card(
  "WAN तकनीक, SOHO बनाम Enterprise और क्लाउड वर्चुअलाइजेशन",
  [
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.1pt)
        *WAN कनेक्टिविटी:* *MPLS* (लेबल-स्विच्ड प्राइवेट WAN), *Metro Ethernet* (फाइबर L2/L3), *PPPoE/DOCSIS* (ब्रॉडबैंड), *GRE* (टनल), *IPsec* (एन्क्रिप्टेड VPN)।
      ],
      [
        #set text(size: 8.1pt)
        *SOHO vs Enterprise:* SOHO राउटर में मॉडेम, स्विच, NAT और Wi-Fi एक बॉक्स में होते हैं। Enterprise में ISP Router → NGFW → L3 Core → L2 Access + WLC अलग होते हैं।
      ],
      [
        #set text(size: 8.1pt)
        *वर्चुअलाइजेशन और क्लाउड:* *Type 1 Hypervisor* (ESXi, KVM, Hyper-V) सीधे हार्डवेयर पर चलता है; *vSwitch* VMs को NIC से जोड़ता है (`IaaS`, `PaaS`, `SaaS`)।
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(12pt)
#did-you-know[10 साइट्स के *Full Mesh* WAN में $10 times 9 / 2 = 45$ लिंक्स चाहिए! केवल 1 नई साइट जोड़ने पर 10 नए लिंक लगते हैं — इसलिए कंपनियाँ *Partial Mesh* या *SD-WAN* से 40–70% खर्च बचाती हैं।]

#pagebreak()

// =========================================================================
// PAGE 3: NETWORK DEVICES, CABLES, FIBER & HARDWARE PORTS
// =========================================================================
#section-banner("02", "नेटवर्क डिवाइस, केबल्स, फाइबर ऑप्टिक्स और PoE", "हार्डवेयर लेयर · L1–L7 डिवाइस, केबलिंग और बूट सीक्वेंस")

#card(
  "संपूर्ण नेटवर्क डिवाइस रेफरेंस (Layer 1 से Layer 7)",
  tbl(
    (auto, auto, 1fr, auto),
    ("डिवाइस", "OSI", "मुख्य कार्य, फॉरवर्डिंग टेबल और वास्तविक उपयोग", "परीक्षा का मुख्य बिंदु"),
    (
      ([*Repeater / Hub*], [L1], [इलेक्ट्रिकल सिग्नल को रीजेनरेट और सभी पोर्ट पर ब्रॉडकास्ट करता है], [Half-duplex; 1 कोलिजन डोमेन]),
      ([*Media Converter*], [L1], [कॉपर ईथरनेट (`RJ-45`) को फाइबर ऑप्टिक (`SFP/LC`) में बदलता है], [100 m से अधिक दूरी के लिए]),
      ([*Bridge*], [L2], [सॉफ्टवेयर आधारित 2–4 पोर्ट फ्रेम फॉरवर्डर (MAC टेबल से)], [अब ASIC Switch ने जगह ली]),
      ([*L2 Switch*], [L2], [*CAM / MAC Address Table* और ASIC से फ्रेम फॉरवर्ड करता है], [कोलिजन डोमेन तोड़ता है; VLANs]),
      ([*L3 Multilayer Switch*], [L2/L3], [हार्डवेयर स्पीड स्विचिंग + *SVIs* व *CEF* से इंटर-VLAN रूटिंग], [वायर-स्पीड रूटिंग]),
      ([*Router*], [L3], [*Routing Table* से अलग IP नेटवर्क्स को जोड़ता है; ब्रॉडकास्ट रोकता है], [ब्रॉडकास्ट डोमेन तोड़ता है]),
      ([*Firewall (NGFW)*], [L3–L7], [कनेक्शन स्टेट, ज़ोन, App-ID, IPS और URL फ़िल्टरिंग जाँचता है], [बाहर से अंदर Default-Deny]),
      ([*IDS / IPS*], [L3–L7], [*IDS* = पैसिव अलर्ट (SPAN/TAP); *IPS* = इनलाइन सक्रिय ब्लॉक], [सिग्नेचर व अनॉमली डिटेक्शन]),
      ([*Access Point (AP)*], [L1/L2], [वायरलेस `802.11` फ्रेम को वायर्ड `802.3` ईथरनेट से जोड़ता है], [Autonomous vs CAPWAP AP]),
      ([*WLC (Controller)*], [L2–L7], [Lightweight APs की सेटिंग, RF चैनल और रोमिंग कंट्रोल करता है], [CAPWAP UDP `5246/5247`]),
      ([*Modem / ONT*], [L1], [ISP की कोएक्स/DSL/फाइबर लाइन पर डिजिटल सिग्नल मॉड्यूलेट करता है], [DOCSIS / PPPoE / GPON ONT]),
      ([*Load Balancer*], [L4–L7], [सर्वर पूल में क्लाइंट ट्रैफिक बाँटता है; SSL ऑफलोड व हेल्थ चेक], [हाई अवेलेबिलिटी VIPs]),
    ),
    pad-y: 4.8pt,
    fsize: 8.0pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(10.5pt)

#grid(
  columns: (1.12fr, 0.88fr),
  gutter: 6.5pt,
  card(
    "ट्विस्टेड-पेयर कॉपर (UTP/STP) और पिनआउट्स",
    [
      #tbl(
        (auto, auto, auto, auto),
        ("श्रेणी", "अधिकतम गति", "बैंडविड्थ", "अधिकतम दूरी"),
        (
          ([*Cat 5e*], [1 Gbps (1000BASE-T)], [100 MHz], [100 m]),
          ([*Cat 6*], [10G (55m) / 1G (100m)], [250 MHz], [55 m / 100 m]),
          ([*Cat 6a*], [10 Gbps (10GBASE-T)], [500 MHz], [100 m]),
          ([*Cat 7 / 8*], [10G / 40 Gbps (DC)], [600 / 2000 MHz], [100 m / 30 m]),
        ),
        pad-y: 4.8pt,
        fsize: 8.0pt
      )
      #v(4pt)
      #set text(size: 8.0pt)
      - *T568B (सबसे प्रचलित):* `1:W-O, 2:O, 3:W-G, 4:B, 5:W-B, 6:G, 7:W-Br, 8:Br`
      - *T568A:* ऑरेंज व ग्रीन पेयर बदलते हैं (`1:W-G, 2:G, 3:W-O, 6:O`).
      - *Straight-Through:* अलग डिवाइस (PC ↔ Switch, Switch ↔ Router).
      - *Crossover:* समान डिवाइस (Switch ↔ Switch). *Auto-MDIX* आधुनिक पोर्ट्स पर ऑटो-डिटेक्ट करता है!
      - *Rollover (Console):* पिन 1–8 उल्टे (`9600 bps, 8N1`).
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "फाइबर ऑप्टिक केबल (SMF vs MMF) और SFP",
    [
      #tbl(
        (auto, 1fr, 1fr),
        ("विशेषता", "Single-Mode (SMF)", "Multimode (MMF)"),
        (
          ([*कोर साइज*], [8.3–10 µm (पतला)], [50 या 62.5 µm (चौड़ा)]),
          ([*लाइट स्रोत*], [Laser (1310 / 1550 nm)], [LED / VCSEL (850 nm)]),
          ([*जैकेट रंग*], [पीला (Yellow)], [ऑरेंज (OM1/2) · एक्वा (OM3/4)]),
          ([*दूरी*], [10–80+ km (WAN/CAN)], [300–550 m (LAN/DC)]),
          ([*लागत*], [ऑप्टिक्स महंगे, केबल सस्ती], [ऑप्टिक्स सस्ते, कम दूरी]),
        ),
        pad-y: 4.8pt,
        fsize: 8.0pt
      )
      #v(4pt)
      #set text(size: 8.0pt)
      - *ट्रांसीवर:* `SFP` (1G), `SFP+` (10G), `SFP28` (25G), `QSFP+` (40G), `QSFP28` (100G).
      - *कनेक्टर:* `LC` (छोटा डुप्लेक्स), `SC` (पुश-पुल), `ST` (बायोनेट).
      - *1000BASE-SX* = MMF (550 m) · *1000BASE-LX* = SMF (5–10 km).
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(10.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "Power over Ethernet (PoE) और फिजिकल एरर",
    [
      #tbl(
        (auto, auto, auto, auto),
        ("स्टैंडर्ड", "IEEE", "PSE Max", "PD आउटपुट"),
        (
          ([*PoE*], [`802.3af`], [15.4 W], [12.95 W (IP फोन)]),
          ([*PoE+*], [`802.3at`], [30.0 W], [25.5 W (Wi-Fi 6 AP)]),
          ([*PoE++*], [`802.3bt`], [60 / 90 W], [51 / 71.3 W (PTZ)]),
        ),
        pad-y: 4.6pt,
        fsize: 8.0pt
      )
      #v(3pt)
      #set text(size: 8.0pt)
      *काउंटर* (#cmd("show int g0/1")): *Runts* (`<64B`), *Giants* (`>1518B` MTU), *CRC* (खराब केबल/डुप्लेक्स मिसमैच)।
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "Cisco IOS मेमोरी और बूट सीक्वेंस",
    [
      #set text(size: 8.0pt)
      - *मेमोरी प्रकार:* *ROM* (POST + Bootstrap), *Flash* (IOS `.bin` इमेज), *NVRAM* (`startup-config`), *RAM* (`running-config`, MAC/Routing टेबल)।
      - *बूट क्रम:* `POST` → `Bootstrap` → `Flash` से IOS लोड → `NVRAM` से `startup-config` को `RAM` में लोड।
      - *Config Register:* `0x2102` (सामान्य बूट) · `0x2142` (पासवर्ड रिकवरी के लिए NVRAM बायपास)।
      - *सेव करें:* #cmd("copy running-config startup-config") या #cmd("wr")
    ],
    head-bg: rgb("#f1f5f9"),
    title-color: rgb("#0f172a")
  )
)

#v(10.5pt)
#did-you-know[कभी भी चालू फाइबर ऑप्टिक केबल या SFP पोर्ट में सीधे न देखें! Single-mode लेज़र *1310 nm / 1550 nm* (अदृश्य इंफ्रारेड) पर काम करते हैं और बिना दिखाई दिए रेटिना को स्थायी नुकसान पहुँचा सकते हैं।]

#pagebreak()

// =========================================================================
// PAGE 4: OSI MODEL, TCP/IP, ENCAPSULATION & PORTS
// =========================================================================
#section-banner("03", "OSI 7-लेयर मॉडल, TCP/IP, एनकैप्सुलेशन और पोर्ट्स", "प्रोटोकॉल स्टैक · PDUs, TCP हैंडशेक, पोर्ट्स और Wireshark")

#grid(
  columns: (0.95fr, 1.05fr),
  gutter: 6.5pt,
  card(
    "OSI vs TCP/IP विजुअल और एनकैप्सुलेशन फ्लो",
    [
      #align(center)[#image("02_BRAND_ASSETS/ccna_osi_visual.png", width: 100%)]
      #v(4pt)
      #set text(size: 8.3pt)
      #strong[याद रखने का सूत्र (7 → 1):] All People Seem To Need Data Processing. \
      #strong[Encapsulation (ऊपर → नीचे):] Data → #strong[Segment] (+TCP/UDP पोर्ट) → #strong[Packet] (+Src/Dst IP) → #strong[Frame] (+Src/Dst MAC + FCS) → #strong[Bits] (तार)। \
      #strong[De-encapsulation (नीचे → ऊपर):] NIC पहले FCS और Dest MAC जाँचता है, Router Dest IP और Host Dest Port पढ़ता है।
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "OSI 7 लेयर्स विस्तृत तालिका",
    tbl(
      (auto, auto, auto, 1fr),
      ("L", "लेयर", "PDU", "प्रोटोकॉल, हार्डवेयर और ट्रबलशूटिंग"),
      (
        ([*7*], [Application], [Data], [HTTP/S, DNS, DHCP, SSH, SMTP, SNMP, FTP]),
        ([*6*], [Presentation], [Data], [TLS/SSL एन्क्रिप्शन, JPEG, ASCII, UTF-8, Gzip]),
        ([*5*], [Session], [Data], [डायलॉग कंट्रोल, RPC, NetBIOS, SQL सेशन]),
        ([*4*], [Transport], [Segment], [TCP (भरोसेमंद) और UDP (तेज़); पोर्ट्स `0–65535`]),
        ([*3*], [Network], [Packet], [IPv4, IPv6, ICMP, OSPF, EIGRP, Router]),
        ([*2*], [Data Link], [Frame], [Ethernet `802.3`, `802.11`, VLAN `802.1Q`, MAC, Switch]),
        ([*1*], [Physical], [Bits], [Cat6, Fiber, SFP, वोल्टेज, Hub, Repeater]),
      ),
      pad-y: 5.5pt,
      fsize: 8.3pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(15pt)

#grid(
  columns: (0.92fr, 1.08fr),
  gutter: 6.5pt,
  card(
    "TCP बनाम UDP और 3-Way Handshake",
    [
      #tbl(
        (auto, 1fr, 1fr),
        ("विशेषता", "TCP (भरोसेमंद)", "UDP (तेज़)"),
        (
          ([*कनेक्शन*], [Connection-oriented (SYN/ACK)], [Connectionless]),
          ([*विश्वसनीयता*], [ACKs, Retransmit, Windowing], [Best-effort, कोई ACK नहीं]),
          ([*हेडर साइज*], [20–60 bytes], [8 bytes (कम ओवरहेड)]),
          ([*उपयोग*], [HTTP/S, SSH, FTP, SMTP, BGP], [DNS, DHCP, TFTP, VoIP]),
        ),
        pad-y: 6pt,
        fsize: 8.3pt
      )
      #v(4pt)
      #set text(size: 8.3pt)
      *TCP 3-Way Handshake:* Client `SYN` → Server `SYN-ACK` → Client `ACK`. \
      *TCP Teardown:* `FIN` → `ACK` → `FIN` → `ACK` (या तुरंत बंद के लिए `RST`)। \
      *पोर्ट रेंज:* Well-Known (`0–1023`), Registered (`1024–49151`), Dynamic (`49152–65535`)।
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "जरूरी TCP और UDP पोर्ट्स (CCNA परीक्षा के लिए)",
    tbl(
      (auto, auto, auto, auto, auto, auto),
      ("पोर्ट", "Proto", "सर्विस", "पोर्ट", "Proto", "सर्विस"),
      (
        ([*20/21*], [TCP], [FTP Data/Ctrl], [*123*], [UDP], [NTP (Time)]),
        ([*22*], [TCP], [SSH / SFTP], [*161/162*], [UDP], [SNMP / Trap]),
        ([*23*], [TCP], [Telnet (Plain)], [*389/636*], [TCP], [LDAP / LDAPS]),
        ([*25*], [TCP], [SMTP (Mail)], [*443*], [TCP], [HTTPS (TLS)]),
        ([*53*], [U/T], [DNS Query/Zone], [*445*], [TCP], [SMB / CIFS]),
        ([*67/68*], [UDP], [DHCP Srv/Cli], [*514*], [UDP], [Syslog]),
        ([*69*], [UDP], [TFTP], [*3389*], [TCP], [RDP]),
        ([*80*], [TCP], [HTTP], [*5060*], [U/T], [SIP (VoIP)]),
      ),
      pad-y: 6pt,
      fsize: 8.2pt
    ),
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(15pt)
#card(
  "Ethernet II फ्रेम, ARP और ट्रबलशूटिंग मेथड (Wireshark)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.3pt)
        *Ethernet Frame (64–1518B):* `Preamble (7B)` + `SFD (1B)` | *Dest MAC (6B)* | *Src MAC (6B)* | *802.1Q (4B)* | *EtherType (2B)* (`0x0800` IPv4, `0x86DD` IPv6, `0x0806` ARP) | *Data (46–1500B)* | *FCS (4B)*. \
        *ARP:* Broadcast `ARP Request` (`FF:FF:FF:FF:FF:FF`) → Unicast `ARP Reply`. देखें: #cmd("show arp") / `arp -a`.
      ],
      [
        #set text(size: 8.3pt)
        *OSI ट्रबलशूटिंग तरीके:*
        - *Bottom-Up (L1 → L7):* पहले केबल/लिंक LED → L2 VLAN/MAC → L3 IP/Ping → L4 पोर्ट → L7 ऐप।
        - *Top-Down (L7 → L1):* पहले ब्राउज़र/DNS टेस्ट करें।
        - *Wireshark फ़िल्टर:* `ip.addr == 10.1.1.5`, `tcp.port == 443`, `icmp`, `arp`, `dns`, `tcp.flags.syn == 1`.
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(15pt)
#did-you-know[पोर्ट `53` सामान्य DNS लुकअप (`< 512 bytes`) के लिए *UDP* का उपयोग करता है, लेकिन प्राइमरी और सेकेंडरी DNS सर्वर के बीच Zone Transfer (`AXFR`) या बड़े DNSSEC डेटा के लिए *TCP* पर स्विच हो जाता है!]

#pagebreak()

// =========================================================================
// PAGE 5: IPV4 ADDRESSING, BINARY, CLASSES & SPECIAL RANGES
// =========================================================================
#section-banner("04", "IPV4 एड्रेसिंग, बाइनरी गणित और विशेष रेंज", "32-बिट डॉटेड डेसिमल · क्लासेस, RFC 1918, APIPA और IOS जांच")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IPv4 क्लासेस (क्लासफुल) और डिफ़ॉल्ट मास्क",
    tbl(
      (auto, auto, auto, 1fr),
      ("क्लास", "पहला ऑक्टेट", "डिफ़ॉल्ट मास्क", "मुख्य उपयोग व नोट्स"),
      (
        ([*A*], [`1–126`], [`255.0.0.0` (`/8`)], [बड़े नेटवर्क; 1.67 करोड़ होस्ट/नेट]),
        ([*Loop*], [`127`], [`255.0.0.0` (`/8`)], [`127.0.0.1` लोकल TCP/IP स्टैक टेस्ट]),
        ([*B*], [`128–191`], [`255.255.0.0` (`/16`)], [मध्यम-बड़ी संस्थाएं; 65,534 होस्ट/नेट]),
        ([*C*], [`192–223`], [`255.255.255.0` (`/24`)], [छोटे LAN; 254 होस्ट/नेट]),
        ([*D*], [`224–239`], [N/A (Multicast)], [OSPF `224.0.0.5/6`, EIGRP `.10`, HSRP `.2`]),
        ([*E*], [`240–255`], [N/A (Reserved)], [रिसर्च और एक्सपेरिमेंट के लिए आरक्षित]),
      ),
      pad-y: 5.5pt,
      fsize: 8.1pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "प्राइवेट IPv4 (RFC 1918) और विशेष आरक्षित रेंज",
    tbl(
      (auto, auto, 1fr),
      ("रेंज नाम", "CIDR / रेंज", "उद्देश्य और व्यवहार"),
      (
        ([*RFC 1918 Cl A*], [`10.0.0.0/8`], [`10.0.0.0 – 10.255.255.255` (16.7M IPs)]),
        ([*RFC 1918 Cl B*], [`172.16.0.0/12`], [`172.16.0.0 – 172.31.255.255` (1.04M IPs)]),
        ([*RFC 1918 Cl C*], [`192.168.0.0/16`], [`192.168.0.0 – 192.168.255.255` (65K IPs)]),
        ([*APIPA (Link-Loc)*], [`169.254.0.0/16`], [DHCP सर्वर न मिलने पर डिवाइस स्वयं लेता है]),
        ([*CGNAT (RFC 6598)*], [`100.64.0.0/10`], [ISP Carrier-Grade NAT साझा एड्रेस स्पेस]),
        ([*Limited Bcast*], [`255.255.255.255`], [लोकल LAN ब्रॉडकास्ट (DHCP Discover)]),
      ),
      pad-y: 5.5pt,
      fsize: 8.1pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(12pt)

#card(
  "8-बिट बाइनरी पावर टेबल और तुरंत डेसिमल ↔ बाइनरी रूपांतरण",
  [
    #tbl(
      (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.35fr),
      ("Bit 7 ($2^7$)", "Bit 6 ($2^6$)", "Bit 5 ($2^5$)", "Bit 4 ($2^4$)", "Bit 3 ($2^3$)", "Bit 2 ($2^2$)", "Bit 1 ($2^1$)", "Bit 0 ($2^0$)", "वैध मास्क मान"),
      (
        ([*128*], [*64*], [*32*], [*16*], [*8*], [*4*], [*2*], [*1*], [`128, 192, 224, 240, 248, 252, 254, 255`]),
      ),
      pad-y: 5.5pt,
      fsize: 8.1pt
    )
    #v(4pt)
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.1pt)
        *उदाहरण `192` → बाइनरी:* `128 + 64 = 192` → `11000000`. \
        *उदाहरण `172` → बाइनरी:* `128 + 32 + 8 + 4 = 172` → `10101100`. \
        *उदाहरण `224` → बाइनरी:* `128 + 64 + 32 = 224` → `11100000` (3 नेटवर्क बिट्स)।
      ],
      [
        #set text(size: 8.1pt)
        *गोल्डन नियम:*
        - नेटवर्क बिट्स = सबनेट मास्क में `1` · होस्ट बिट्स ($h$) = `0` की संख्या।
        - उपयोगी होस्ट्स प्रति सबनेट = $2^h - 2$ (Network ID व Broadcast घटाकर)।
        - सबनेट्स की संख्या = $2^s$ (जहाँ $s$ = उधार लिए गए नेटवर्क बिट्स)।
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(12pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IPv4 पैकेट हेडर (20 Bytes) और ICMP",
    [
      #set text(size: 8.1pt)
      - *मुख्य फ़ील्ड्स:* Version (`4`), IHL, DSCP/ECN (QoS), Total Length, ID/Flags/Fragment Offset, *TTL* (हर राउटर हॉप पर 1 घटता है; `0` पर पैकेट ड्रॉप), *Protocol* (`1`=ICMP, `6`=TCP, `17`=UDP, `89`=OSPF), Checksum, Src IP, Dst IP.
      - *ICMP प्रकार:* Type `8` Echo Request, Type `0` Echo Reply, Type `3` Dest Unreachable, Type `11` Time Exceeded (`traceroute`).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "ANDing ऑपरेशन और नेटवर्क बनाम होस्ट ID",
    [
      #set text(size: 8.1pt)
      राउटर नेटवर्क ID खोजने के लिए बिटवाइज *AND* (`IP AND Mask`) करता है:
      - IP: `192.168.10.75` (`01001011`)
      - मास्क: `255.255.255.224` (`11100000`)
      - *परिणाम:* `192.168.10.64` (`01000000` = Network ID)
      - *Broadcast:* `192.168.10.95` · *उपयोगी:* `.65 – .94` (`30` होस्ट्स)।
    ],
    head-bg: rgb("#f1f5f9"),
    title-color: rgb("#0f172a")
  )
)

#v(12pt)
#card(
  "Cisco IOS इंटरफ़ेस IPv4 कॉन्फ़िगरेशन और कनेक्टिविटी चेकलिस्ट",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.1pt)
        - स्टैटिक IP दें: #cmd("int g0/0") → #cmd("ip address 10.1.1.1 255.255.255.0") → #cmd("no shutdown")
        - WAN पर DHCP क्लाइंट: #cmd("ip address dhcp")
        - स्थिति जांचें: #cmd("show ip interface brief") (`up/up` = L1 व L2 ठीक; `administratively down` = `no shut` भूल गए)।
      ],
      [
        #set text(size: 8.1pt)
        - *5-स्टेप पिंग जांच:* 1) `ping 127.0.0.1` (TCP/IP स्टैक) → 2) `ping <own IP>` (NIC) → 3) `ping <Default GW>` (LAN/VLAN) → 4) `ping 8.8.8.8` (Routing/NAT) → 5) `ping google.com` (DNS).
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(12pt)
#did-you-know[RFC 3021 के तहत *पॉइंट-टू-पॉइंट राउटर लिंक* पर `/31` (`255.255.255.254`) सबनेट उपयोग किया जा सकता है! भले ही $2^1 - 2 = 0$ हो, पर P2P लिंक पर दोनों IP काम करते हैं — इससे `/30` के मुकाबले 50% WAN IPv4 बचता है।]

#pagebreak()

// =========================================================================
// PAGE 6: IPV4 SUBNETTING MASTER CHART & VLSM SHORTCUTS
// =========================================================================
#section-banner("05", "IPV4 सबनेटिंग मास्टर चार्ट और VLSM शॉर्टकट्स", "30-सेकंड परीक्षा सबनेटिंग · /16 से /32, ब्लॉक साइज और अभ्यास")

#card(
  "संपूर्ण IPv4 CIDR / सबनेटिंग मास्टर चीट शीट (/24–/32 और /16–/23)",
  tbl(
    (auto, auto, auto, auto, auto, auto, auto),
    ("CIDR", "सबनेट मास्क", "वाइल्डकार्ड मास्क", "ब्लॉक साइज", "सबनेट्स", "कुल IP", "उपयोगी होस्ट्स"),
    (
      ([`/24`], [`255.255.255.0`], [`0.0.0.255`], [256 (4th oct)], [1 (/24)], [256], [*254*]),
      ([`/25`], [`255.255.255.128`], [`0.0.0.127`], [*128*], [2 (/24)], [128], [*126*]),
      ([`/26`], [`255.255.255.192`], [`0.0.0.63`], [*64*], [4 (/24)], [64], [*62*]),
      ([`/27`], [`255.255.255.224`], [`0.0.0.31`], [*32*], [8 (/24)], [32], [*30*]),
      ([`/28`], [`255.255.255.240`], [`0.0.0.15`], [*16*], [16 (/24)], [16], [*14*]),
      ([`/29`], [`255.255.255.248`], [`0.0.0.7`], [*8*], [32 (/24)], [8], [*6*]),
      ([`/30`], [`255.255.255.252`], [`0.0.0.3`], [*4*], [64 (/24)], [4], [*2 (WAN P2P)*]),
      ([`/31`], [`255.255.255.254`], [`0.0.0.1`], [*2*], [128 (/24)], [2], [*2 (RFC 3021)*]),
      ([`/32`], [`255.255.255.255`], [`0.0.0.0`], [*1*], [256 (/24)], [1], [*1 (Host/Loop)*]),
      ([`/23`], [`255.255.254.0`], [`0.0.1.255`], [*2 (3rd oct)*], [128 (/16)], [512], [*510*]),
      ([`/22`], [`255.255.252.0`], [`0.0.3.255`], [*4 (3rd oct)*], [64 (/16)], [1,024], [*1,022*]),
      ([`/21`], [`255.255.248.0`], [`0.0.7.255`], [*8 (3rd oct)*], [32 (/16)], [2,048], [*2,046*]),
      ([`/20`], [`255.255.240.0`], [`0.0.15.255`], [*16 (3rd oct)*], [16 (/16)], [4,096], [*4,094*]),
      ([`/16`], [`255.255.0.0`], [`0.0.255.255`], [*1 (2nd oct)*], [1 (/16)], [65,536], [*65,534*]),
    ),
    pad-y: 6.5pt,
    fsize: 8.4pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(14.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "30-सेकंड सबनेटिंग विधि (Magic Number = 256 - Mask)",
    [
      #set text(size: 8.4pt)
      *प्रश्न:* `172.16.45.138/27` का Network, Broadcast और Usable Range निकालें।
      1. *मुख्य ऑक्टेट:* `/27` चौथे ऑक्टेट में है (`255.255.255.224`)।
      2. *Magic Number (ब्लॉक साइज):* `256 - 224 = 32`।
      3. *32 के गुणज:* `0, 32, 64, 96, 128, 160...`
      4. *`138` कहाँ है:* `128` और `160` के बीच।
      5. *Network ID:* `172.16.45.128` · *अगला सबनेट:* `.160`
      6. *Broadcast ID:* `160 - 1` = `172.16.45.159`
      7. *उपयोगी रेंज:* `172.16.45.129` – `172.16.45.158` (30 होस्ट्स)।
      *वाइल्डकार्ड शॉर्टकट:* `255.255.255.255 - Mask = Wildcard` (`0` = मैच, `1` = अनदेखा)।
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "VLSM (Variable Length Subnet Mask) स्टेप-बाय-स्टेप",
    [
      #set text(size: 8.4pt)
      *नियम:* ओवरलैप से बचने के लिए हमेशा *सबसे बड़े होस्ट से छोटे* के क्रम में आवंटन करें!
      *उदाहरण:* 3 LAN + 1 WAN के लिए `192.168.10.0/24` बाँटें:
      - *LAN-A (100 होस्ट):* `/25` (126 उपयोगी) → `192.168.10.0/25` (`.0–.127`)
      - *LAN-B (50 होस्ट):* `/26` (62 उपयोगी) → `192.168.10.128/26` (`.128–.191`)
      - *LAN-C (20 होस्ट):* `/27` (30 उपयोगी) → `192.168.10.192/27` (`.192–.223`)
      - *WAN P2P (2 होस्ट):* `/30` (2 उपयोगी) → `192.168.10.224/30` (`.224–.227`)
      *Route Summarization:* लगातार सबनेट्स के कॉमन बिट्स लें (`.0/24` से `.3/24` → `192.168.0.0/22`)।
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(14.5pt)
#card(
  "4 हल किए गए CCNA परीक्षा सबनेटिंग अभ्यास (तुरंत पैटर्न पहचानें)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.4pt)
        - *अभ्यास 1 (तीसरा ऑक्टेट `/21`):* `10.50.19.42/21` का सबनेट व ब्रॉडकास्ट? मास्क `255.255.248.0`, ब्लॉक साइज `8` (`0, 8, 16, 24`)। `19` आता है `16–23` में। *Net:* `10.50.16.0`, *Bcast:* `10.50.23.255`।
        - *अभ्यास 2 (500 होस्ट्स चाहिए):* कौन-सा CIDR चुनें? `/24` = 254 (कम है), `/23` = 510 उपयोगी! `/23` (`255.255.254.0`) चुनें।
      ],
      [
        #set text(size: 8.4pt)
        - *अभ्यास 3 (क्या एक ही LAN में हैं?):* `192.168.5.60/26` और `192.168.5.70/26`? ब्लॉक `64`: `.60` है `0–63` में, `.70` है `64–127` में। *नहीं* — राउटर चाहिए!
        - *अभ्यास 4 (ACL वाइल्डकार्ड):* `10.20.16.0/22` के लिए वाइल्डकार्ड? मास्क `255.255.252.0` → वाइल्डकार्ड `0.0.3.255`।
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(14.5pt)
#did-you-know[CCNA परीक्षा में यदि *60 होस्ट्स* की जरूरत हो, तो `/27` (30 होस्ट्स) नहीं बल्कि `/26` (62 उपयोगी होस्ट्स) चुनें। हमेशा Network और Broadcast ID के लिए 2 घटाना याद रखें (सिवाय `/31` P2P लिंक के)!]

#pagebreak()

// =========================================================================
// PAGE 7: IPV6 COMPLETE MASTERY
// =========================================================================
#section-banner("06", "IPV6 संपूर्ण मास्टरी (128-बिट आर्किटेक्चर)", "हेक्साडेसिमल, ज़ीरो कम्प्रेशन, एड्रेस प्रकार, EUI-64 और SLAAC")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IPv6 फॉर्मेट और ज़ीरो कम्प्रेशन नियम",
    [
      #set text(size: 8.1pt)
      - *128-बिट हेक्साडेसिमल:* कोलन (`:`) से अलग 4 हेक्स अंकों के 8 समूह (हेक्स्टेट)। हर हेक्स अंक = 4 बिट्स (`0–9, A–F`)।
      - *कुल एड्रेस:* $2^(128) approx 3.4 times 10^(38)$ (NAT की जरूरत खत्म!)।
      - *नियम 1 (आगे के ज़ीरो हटाएँ):* `0db8` → `db8`, `0000` → `0`।
      - *नियम 2 (डबल कोलन `::`):* लगातार सभी-ज़ीरो हेक्स्टेट्स को `::` से बदलें (*एक एड्रेस में केवल एक बार!*)।
      - *उदाहरण:* `2001:0db8:0000:0000:0000:0000:0000:0001` → `2001:db8::1`
      - *IPv6 सबनेटिंग:* मानक LAN प्रीफिक्स `/64` है। ISP साइट को `/48` या `/56` देता है (65,536 या 256 `/64` LANs)।
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "IPv6 एड्रेस के प्रकार और आरक्षित प्रीफिक्स",
    tbl(
      (auto, auto, 1fr),
      ("एड्रेस प्रकार", "प्रीफिक्स", "दायरा और परीक्षा का मुख्य तथ्य"),
      (
        ([*Global Unicast (GUA)*], [`2000::/3`], [पब्लिकली रूटेबल इंटरनेट IPv6 (`2001:...`, `2606:...`)]),
        ([*Unique Local (ULA)*], [`FC00::/7`], [प्राइवेट आंतरिक IPv6 (`FD00::/8` लोकली जनरेटेड)]),
        ([*Link-Local (LLA)*], [`FE80::/10`], [हर IPv6 इंटरफ़ेस पर ऑटो-कॉन्फ़िगर; नॉन-रूटेबल]),
        ([*Multicast*], [`FF00::/8`], [`FF02::1` All Nodes, `FF02::2` All Routers, `::5/6` OSPFv3]),
        ([*Loopback*], [`::1/128`], [IPv4 के `127.0.0.1` के बराबर]),
        ([*Unspecified*], [`::/128`], [`0.0.0.0` के बराबर (DAD/DHCPv6 में उपयोग)]),
        ([*Default Route*], [`::/0`], [`0.0.0.0/0` के बराबर]),
      ),
      pad-y: 5.3pt,
      fsize: 8.0pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(11.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "EUI-64 इंटरफ़ेस ID (48-बिट MAC → 64-बिट IID)",
    [
      #set text(size: 8.1pt)
      दिया गया MAC `001A.2B3C.4D5E`:
      1. MAC को बीच से बाँटें: `001A:2B` और `3C:4D5E`।
      2. बीच में `FFFE` जोड़ें: `001A:2BFF:FE3C:4D5E`।
      3. पहले बाइट का *7वाँ बिट* (U/L बिट) पलटें: `00` (`0000 0000`) → `02` (`0000 0010`)।
      4. *परिणाम:* `021A:2BFF:FE3C:4D5E` (जैसे `FE80::021A:2BFF:FE3C:4D5E`)।
      *IOS कमांड:* #cmd("ipv6 address 2001:db8:1::/64 eui-64")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "SLAAC, NDP और DHCPv6 (IPv6 में कोई ब्रॉडकास्ट नहीं!)",
    [
      #set text(size: 8.1pt)
      - *NDP (Neighbor Discovery — ICMPv6):* ARP की जगह लेता है!
        - *RS (Type 133):* होस्ट राउटर से प्रीफिक्स पूछता है (`FF02::2`)।
        - *RA (Type 134):* राउटर `/64` प्रीफिक्स + डिफ़ॉल्ट गेटवे देता है।
        - *NS / NA (135/136):* IPv6 → MAC हल करता है व *DAD* चलाता है।
      - *SLAAC:* होस्ट RA प्रीफिक्स + EUI-64/रैंडम IID से खुद GUA बनाता है।
      - *Stateless DHCPv6:* SLAAC IP देता है; DHCPv6 DNS देता है (`O` फ्लैग)।
      - *Stateful DHCPv6:* DHCPv6 ही IP + DNS देता है (`M` फ्लैग)।
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(11.5pt)
#card(
  "IPv6 रूटिंग, ट्रांजिशन तकनीक और Cisco IOS कमांड्स",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.1pt)
        - IPv6 रूटिंग चालू करें: #cmd("ipv6 unicast-routing")
        - स्टैटिक GUA दें: #cmd("ipv6 address 2001:db8:10::1/64")
        - केवल Link-Local: #cmd("ipv6 enable") · स्टैटिक रूट: #cmd("ipv6 route ::/0 2001:db8:1::2")
        - *OSPFv3:* इंटरफ़ेस पर चलता है (#cmd("ipv6 ospf 1 area 0")); `FE80::` नेक्स्ट-हॉप उपयोग करता है।
      ],
      [
        #set text(size: 8.1pt)
        - इंटरफ़ेस जाँच: #cmd("show ipv6 interface brief")
        - रूट्स व NDP जाँच: #cmd("show ipv6 route") · #cmd("show ipv6 neighbors")
        - *ट्रांजिशन तकनीक:* *Dual-Stack* (IPv4+IPv6 साथ में), *Tunneling* (GRE/6to4), *NAT64* (IPv6 ↔ IPv4 अनुवाद)।
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(11.5pt)
#card(
  "IPv6 मल्टीकास्ट प्रसिद्ध एड्रेस और Anycast",
  [
    #tbl(
      (auto, auto, 1fr),
      ("एड्रेस", "स्कोप / लक्ष्य", "प्रोटोकॉल और परीक्षा उपयोग"),
      (
        ([`FF02::1`], [All Nodes (Link-Local)], [LAN पर IPv4 ब्रॉडकास्ट `255.255.255.255` की जगह]),
        ([`FF02::2`], [All Routers (Link-Local)], [होस्ट यहाँ Router Solicitation (RS) भेजते हैं]),
        ([`FF02::5` / `::6`], [OSPFv3 Routers / DR], [सभी OSPFv3 राउटर्स (`::5`) और DR/BDR (`::6`)]),
        ([`FF02::1:FFxx:xxxx`], [Solicited-Node Multicast], [NDP NS व DAD द्वारा उपयोग (IPv6 के अंतिम 24 बिट्स)]),
      ),
      pad-y: 5.3pt,
      fsize: 8.0pt
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(11.5pt)
#did-you-know[IPv6 में *ARP* और *IPv4 ब्रॉडकास्ट* पूरी तरह समाप्त हो जाते हैं! हर IPv6 इंटरफ़ेस पर स्वतः एक Link-Local एड्रेस (`FE80::/10`) बनता है, और राउटर रूटिंग टेबल में इसी `FE80::` को नेक्स्ट-हॉप गेटवे बनाते हैं।]

#pagebreak()

// =========================================================================
// PAGE 8: SWITCHING, VLANS, STP & ETHERCHANNEL
// =========================================================================
#section-banner("07", "स्विचिंग, VLANS, 802.1Q ट्रंक्स, STP और ETHERCHANNEL", "CCNA Domain 2.0 · लेयर 2 कैंपस स्विचिंग मास्टरी")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "स्विच ऑपरेशन और VLANs (802.1Q)",
    [
      #set text(size: 8.9pt)
      - *CAM / MAC टेबल:* स्विच आने वाले पोर्ट से *Source MAC* सीखता है (`300s` एजिंग)। अज्ञात यूनिकास्ट व ब्रॉडकास्ट को फ्लड करता है; ज्ञात को फॉरवर्ड करता है।
      - *VLANs:* 1 फिजिकल स्विच को कई L2 ब्रॉडकास्ट डोमेन में बाँटता है (`1–4094`; Normal `1–1005`, Extended `1006–4094`)।
      - *Access Port:* 1 Data VLAN (+ वैकल्पिक Voice VLAN) के लिए।
      - *802.1Q Trunk:* *4-बाइट टैग* (`TPID 0x8100` + `12-bit VLAN ID`) जोड़कर कई VLANs ले जाता है।
      - *Native VLAN (डिफ़ॉल्ट 1):* ट्रंक पर *बिना टैग (untagged)* जाता है। दोनों तरफ समान होना जरूरी! इसे किसी खाली VLAN (जैसे `999`) में बदलें।
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Spanning Tree Protocol (STP 802.1D बनाम RSTP 802.1w)",
    [
      #set text(size: 8.9pt)
      रिडंडेंट स्विच लूप्स में L2 ब्रॉडकास्ट स्टॉर्म व MAC फ्लैपिंग रोकता है।
      1. *1 Root Bridge चुनें:* सबसे कम *Bridge ID* (`Priority + MAC`; डिफ़ॉल्ट `32768`, स्टेप `4096`)।
      2. *Root Port (RP):* हर नॉन-रूट स्विच पर रूट तक सबसे अच्छा रास्ता (1 प्रति स्विच)।
      3. *Designated Port (DP):* हर सेगमेंट पर सबसे अच्छा पोर्ट (रूट ब्रिज के सभी पोर्ट DP होते हैं)।
      4. *Blocked / Alternate Port:* बाकी पोर्ट्स लूप रोकने के लिए यूजर ट्रैफिक ब्लॉक करते हैं।
      - *802.1D स्टेट्स (30–50s):* Blocking → Listening → Learning → Forwarding।
      - *RSTP 802.1w (< 2s):* Discarding → Learning → Forwarding।
      - *PortFast + BPDU Guard:* एक्सेस पोर्ट पर तुरंत लिंक-अप + अनधिकृत स्विच पर `err-disable` शटडाउन!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(18pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "EtherChannel (लिंक एग्रीगेशन — LACP और PAgP)",
    [
      #set text(size: 8.9pt)
      अधिक बैंडविड्थ और रिडंडेंसी के लिए *8 फिजिकल पोर्ट्स* को 1 लॉजिकल Port-Channel (`Po1`) में जोड़ता है (STP इसे 1 लिंक मानता है!)।
      #v(4pt)
      #tbl(
        (auto, auto, auto),
        ("प्रोटोकॉल", "स्टैंडर्ड", "मोड्स (दोनों तरफ मेल खाएँ!)"),
        (
          ([*LACP*], [`802.3ad` (Open)], [`Active` ↔ `Active` या `Passive`]),
          ([*PAgP*], [Cisco Prop.], [`Desirable` ↔ `Desirable` या `Auto`]),
          ([*Static*], [कोई नेगोशिएशन नहीं], [`On` ↔ `On`]),
        ),
        pad-y: 6pt,
        fsize: 8.9pt
      )
      #v(4pt)
      #set text(size: 8.9pt)
      *अनिवार्य शर्तें:* समान स्पीड, डुप्लेक्स, नेटिव/अलाउड VLANs और एक्सेस/ट्रंक मोड।
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "जरूरी Cisco IOS स्विचिंग कमांड्स",
    [
      #set text(size: 8.9pt)
      - VLAN बनाएँ: #cmd("vlan 10") → #cmd("name SALES")
      - Access + Voice: #cmd("switchport mode access") / #cmd("switchport access vlan 10") / #cmd("switchport voice vlan 20")
      - Trunk + Native: #cmd("switchport mode trunk") / #cmd("switchport trunk native vlan 999") / #cmd("switchport nonegotiate")
      - Root Primary: #cmd("spanning-tree vlan 10 root primary")
      - PortFast + BPDU: #cmd("spanning-tree portfast") / #cmd("spanning-tree bpduguard enable")
      - LACP बंडल: #cmd("channel-group 1 mode active")
      - जाँचें: #cmd("show vlan brief") · #cmd("show interfaces trunk") · #cmd("show spanning-tree") · #cmd("show etherchannel summary")
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(18pt)
#card(
  "DTP, VTP, CDP/LLDP और इंटर-VLAN रूटिंग (ROAS बनाम Layer 3 SVI)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.9pt)
        - *DTP (Dynamic Trunking):* `dynamic auto` + `auto` = Access; `desirable` + `auto` = Trunk। सुरक्षा के लिए हमेशा `mode trunk` + `nonegotiate` सेट करें।
        - *VTP:* VLAN डेटाबेस सिंक करता है। अनचाहे बदलाव से बचने के लिए `vtp mode transparent` रखें!
        - *CDP / LLDP:* L2 पड़ोसी खोज (`show cdp neighbors detail`, `lldp run`).
      ],
      [
        #set text(size: 8.9pt)
        - *Router-on-a-Stick (ROAS):* एक ट्रंक पर सब-इंटरफ़ेस (`g0/0.10`, `encapsulation dot1Q 10`, `ip address ...`)।
        - *L3 Switch (SVI):* #cmd("ip routing") + #cmd("interface vlan 10") → वायर-स्पीड इंटर-VLAN रूटिंग!
        - *Err-Disable रिकवरी:* #cmd("errdisable recovery cause bpduguard")
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(18pt)
#did-you-know[बिना STP वाले लूपेड लेयर 2 नेटवर्क में एक अकेला *Broadcast Storm* 1 सेकंड से कम समय में 10 Gbps लिंक्स और CPU को 100% भर सकता है, क्योंकि ईथरनेट फ्रेम में *कोई TTL फ़ील्ड नहीं* होता!]

#pagebreak()

// =========================================================================
// PAGE 9: ROUTING, OSPF, ACLS, NAT, SECURITY & AUTOMATION
// =========================================================================
#section-banner("08", "रूटिंग, OSPF, ACLS, NAT, सुरक्षा और ऑटोमेशन", "CCNA Domains 3, 4, 5 & 6 · लेयर 3, सर्विसेज, वायरलेस और SDN")

#grid(
  columns: (0.95fr, 1.05fr),
  gutter: 6.5pt,
  card(
    "Administrative Distance (AD) और Longest Prefix Match",
    [
      #tbl(
        (auto, auto, 1fr),
        ("रूट स्रोत", "AD", "मेट्रिक / चयन नियम"),
        (
          ([*Connected (`C`)*], [*0*], [सीधे जुड़ा हुआ इंटरफ़ेस]),
          ([*Static (`S`)*], [*1*], [मैनुअल नेक्स्ट-हॉप / एग्जिट इंटरफ़ेस]),
          ([*eBGP*], [*20*], [AS-Path और BGP गुण (इंटरनेट)]),
          ([*EIGRP (Int)*], [*90*], [बैंडविड्थ + डिले (कंपोजिट)]),
          ([*OSPF (`O`)*], [*110*], [Cost = Ref BW (`100 Mbps`) / Link BW]),
          ([*RIPv2 (`R`)*], [*120*], [हॉप काउंट (अधिकतम 15; 16 = अनरीचेबल)]),
          ([*Floating Static*], [*111+*], [OSPF से अधिक AD वाला बैकअप स्टैटिक रूट]),
        ),
        pad-y: 6.8pt,
        fsize: 8.9pt
      )
      #v(3pt)
      #set text(size: 8.9pt)
      *रूटिंग क्रम:* 1) *Longest Prefix Match* (`/26` हमेशा `/24` से जीतेगा!) → 2) सबसे कम *AD* → 3) सबसे कम *Metric*। \
      *डिफ़ॉल्ट रूट:* #cmd("ip route 0.0.0.0 0.0.0.0 203.0.113.1")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "OSPFv2 सिंगल-एरिया मास्टरी और FHRP",
    [
      #set text(size: 8.9pt)
      - *लिंक-स्टेट प्रोटोकॉल:* LSDB बनाता है → *Dijkstra SPF* एल्गोरिदम चलाकर रूटिंग टेबल बनाता है।
      - *Router ID प्राथमिकता:* 1) मैनुअल `router-id` → 2) सबसे बड़ा Loopback IP → 3) सबसे बड़ा सक्रिय फिजिकल IP।
      - *7 नेबर स्टेट्स:* `Down` → `Init` → `2-Way` (ब्रॉडकास्ट पर *DR/BDR चुनाव!*) → `ExStart` → `Exchange` → `Loading` → `Full`।
      - *अनिवार्य मिलान:* Area ID, सबनेट/मास्क, Hello/Dead (`10s/40s`), Auth, MTU; Router ID अलग होने चाहिए!
      - *कमांड्स:* #cmd("router ospf 1") → #cmd("router-id 1.1.1.1") → #cmd("network 10.0.0.0 0.0.0.255 area 0") → #cmd("passive-interface g0/0")
      - *जाँचें:* #cmd("show ip ospf neighbor") · #cmd("show ip route ospf")
      - *FHRP (गेटवे रिडंडेंसी):* *HSRP* (Cisco, Active/Standby) vs *VRRP* (Open, Master/Backup)।
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(19pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IP सर्विसेज (DHCP, DNS, NTP, SNMP, Syslog) और NAT/PAT",
    [
      #set text(size: 8.9pt)
      - *DHCP (DORA):* *D*iscover (Bcast) → *O*ffer → *R*equest → *A*ck। अलग सबनेट के लिए: #cmd("ip helper-address <DHCP-IP>")।
      - *NTP / Syslog / SNMP:* NTP घड़ी सिंक करता है (`Stratum 1–15`)। Syslog स्तर `0–7` (`0` Emergency → `6` Info → `7` Debug)। SNMPv3 में Auth + AES एन्क्रिप्शन।
      - *NAT / PAT:* Inside Local (प्राइवेट) ↔ Inside Global (पब्लिक)।
        - *Static NAT:* 1-से-1 सर्वर मैपिंग।
        - *PAT (Overload):* कई प्राइवेट IP, 1 पब्लिक IP व अलग TCP/UDP पोर्ट साझा करते हैं: #cmd("ip nat inside source list 1 interface g0/0 overload")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "ACLs, लेयर 2 सुरक्षा और नेटवर्क ऑटोमेशन",
    [
      #set text(size: 8.9pt)
      - *Standard ACL (`1–99`):* केवल *Source IP* फ़िल्टर; *Destination के पास* लगाएँ।
      - *Extended ACL (`100–199`):* Src/Dst IP, Proto, पोर्ट; *Source के पास* लगाएँ। अंत में छिपा `deny any` होता है!
      - *L2 सुरक्षा:* *Port Security* (MAC सीमित करें), *DHCP Snooping* (`trusted` अपलिंक), *DAI* (ARP स्पूफिंग रोकें)।
      - *SSH हार्डनिंग:* `ip domain-name`, `crypto key generate rsa`, `transport input ssh`.
      - *ऑटोमेशन (Domain 6):* *SDN* कंट्रोल प्लेन को डेटा प्लेन से अलग करता है। *REST APIs* (`GET/POST/PUT/DELETE`), *JSON*, *Ansible* (Agentless SSH/YAML), *Puppet/Chef* (Agent-based)।
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(19pt)
#card(
  "वायरलेस 802.11, सुरक्षा, QoS और डेटा फॉर्मेट्स (JSON/YAML/XML)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.9pt)
        - *Wi-Fi व सुरक्षा:* `802.11ac` (Wi-Fi 5), `802.11ax` (Wi-Fi 6)। 2.4 GHz नॉन-ओवरलैपिंग चैनल: *1, 6, 11*। *WPA2* (AES) vs *WPA3* (SAE)।
        - *QoS:* वॉइस/वीडियो को प्राथमिकता (`DSCP EF 46`, `<150ms` लेटेंसी)। *Shaping* बफर करता है; *Policing* ड्रॉप करता है।
      ],
      [
        #set text(size: 8.9pt)
        - *डेटा फॉर्मेट्स:* *JSON* (`{"vlan": 10}` REST APIs), *YAML* (Ansible इंडेंटेशन), *XML* (`<vlan>10</vlan>` NETCONF)।
        - *जाँच कमांड्स:* #cmd("show access-lists") · #cmd("show ip nat translations") · #cmd("show ip dhcp binding") · #cmd("show port-security")
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(19pt)
#did-you-know[आप IPv4/IPv6 सबनेटिंग, CIDR/वाइल्डकार्ड कैलकुलेशन और इंटरैक्टिव नेटवर्किंग लैब्स का मुफ्त अभ्यास *rtechlab.com/tools* पर कर सकते हैं — विशेष रूप से CCNA व Network+ छात्रों के लिए बनाया गया!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "टॉप 10 CCNA इंटरव्यू प्रश्न और RTECHLAB लेखक परिचय", "TAC / NOC इंटरव्यू तैयारी · प्रमाणपत्र, हमारा ध्येय और व्हाट्सएप हेल्प डेस्क")

#card(
  "टॉप 10 CCNA और नेटवर्किंग TAC/NOC इंटरव्यू प्रश्न-उत्तर",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.0pt)
        *1. Switch बनाम Router?* Switch 1 नेटवर्क में MAC टेबल से L2 फ्रेम भेजता है; Router अलग नेटवर्क्स में IP रूटिंग टेबल से L3 पैकेट भेजता है। \
        *2. ARP क्या है?* ज्ञात IPv4 एड्रेस से अज्ञात MAC एड्रेस पता करने का प्रोटोकॉल (Broadcast Request + Unicast Reply)। \
        *3. VLANs क्यों उपयोग करें?* ब्रॉडकास्ट डोमेन अलग करने, सुरक्षा बढ़ाने और विभागों को लॉजिकल रूप से बाँटने के लिए। \
        *4. Access बनाम Trunk पोर्ट?* Access 1 अनटैग्ड VLAN ले जाता है; Trunk `802.1Q` 4-बाइट टैग से कई VLANs ले जाता है। \
        *5. STP Root Bridge कैसे चुनता है?* सबसे कम Bridge ID (`Priority + MAC`); टाई होने पर सबसे कम Base MAC।
      ],
      [
        #set text(size: 8.0pt)
        *6. Longest Prefix Match बनाम AD?* राउटर हमेशा सबसे सटीक मास्क (`/27` बनाम `/24`) चुनता है; AD केवल *समान प्रीफिक्स* पर लागू होता है। \
        *7. OSPF `EXSTART/EXCHANGE` में क्यों अटकता है?* दोनों तरफ MTU मिसमैच या डुप्लीकेट Router ID होने पर। \
        *8. NAT बनाम PAT?* NAT 1-से-1 IP मैप करता है; PAT कई प्राइवेट IP को पोर्ट नंबर से 1 पब्लिक IP पर मैप करता है। \
        *9. `ip helper-address` का काम?* क्लाइंट के UDP DHCP Discover ब्रॉडकास्ट को यूनिकास्ट में बदलकर दूरस्थ DHCP सर्वर को भेजना। \
        *10. IPv6 Link-Local (`FE80::/10`)?* हर IPv6 पोर्ट पर स्वतः बनता है; लोकल लिंक, NDP और रूटिंग नेक्स्ट-हॉप के लिए।
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(13.5pt)

#card(
  "Cisco IOS त्वरित डिवाइस सुरक्षा और दैनिक कमांड्स",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.0pt)
        - होस्टनाम व बैनर: #cmd("hostname R1") · #cmd("banner motd #Authorized Only#")
        - सुरक्षित पासवर्ड: #cmd("enable secret RTech@2026") · #cmd("service password-encryption")
      ],
      [
        #set text(size: 8.0pt)
        - कंसोल टाइमआउट: #cmd("exec-timeout 5 0") · #cmd("logging synchronous")
        - DNS लुकअप बंद: #cmd("no ip domain-lookup") · कॉन्फ़िग मोड में जाँच: #cmd("do show ip int br")
      ]
    )
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(13.5pt)

// AUTHOR & RTECHLAB MOTTO BLOCK
#box(
  width: 100%,
  fill: rgb("#0f172a"),
  radius: 4.5pt,
  inset: 8pt,
  stroke: 1.2pt + rgb("#0284c7"),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 9pt,
      align: (center + horizon, left + horizon),
      box(
        radius: 4pt,
        clip: true,
        stroke: 1.8pt + rgb("#38bdf8"),
        image("02_BRAND_ASSETS/rahul-patel.jpg", width: 33mm)
      ),
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          [
            #text(fill: rgb("#38bdf8"), size: 11pt, weight: "bold")[Rahul Patel]
            #h(6pt)
            #box(fill: rgb("#0284c7"), radius: 2pt, inset: (x: 5pt, y: 2pt))[
              #text(fill: white, size: 7pt, weight: "bold")[Founder & Systems Architect, RTechLab]
            ]
          ],
          image("02_BRAND_ASSETS/rtechlab-header-logo.png", width: 31mm)
        )
        #v(3pt)
        #text(fill: rgb("#e2e8f0"), size: 8.1pt)[
          *प्रमाणित अनुभव व परीक्षाएँ:* #hl-b("CompTIA Network+ Exam Cleared") · #hl-g("Cisco CCNA 200-301 Exam Track") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · डायरेक्टर एवं लीड आईटी ट्रेनर, IANT कंप्यूटर एजुकेशन, पालनपुर · *10+ वर्षों का अनुभव · 3,000+ छात्र प्रशिक्षित*।
        ]
        #v(3.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 4pt),
          text(fill: rgb("#fef3c7"), size: 7.5pt)[
            *हमारा RTechLab ध्येय (Motto):* _"Technology Made Practical — सीखें, अभ्यास करें और जुड़ें। असली नेटवर्किंग ज्ञान डम्प्स रटने से नहीं, बल्कि वायर पर पैकेट्स को समझने से आता है। भारत में निर्मित ताकि हर छात्र को ₹22 में ₹2,200 जैसा प्रीमियम ज्ञान मिले।"_
          ]
        )
      ]
    )
  ]
)

#v(13.5pt)

// 4 SCANNABLE QR CODES
#card(
  "स्कैन करें और RTechLab से जुड़ें (मुफ्त लैब्स, टूल्स और अपडेट्स)",
  [
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 7pt,
      align: center,
      [
        #image("02_BRAND_ASSETS/qr_rahul_portfolio.png", width: 31mm)
        #v(2pt)
        #text(size: 8.1pt, weight: "bold", fill: rgb("#0f172a"))[RTechLab & Tools] \
        #link("https://rtechlab.com/tools")[#text(size: 6.8pt, fill: rgb("#0284c7"))[rtechlab.com/tools]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", width: 31mm)
        #v(2pt)
        #text(size: 8.1pt, weight: "bold", fill: rgb("#0f172a"))[YouTube लैब्स] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 6.8pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 31mm)
        #v(2pt)
        #text(size: 8.1pt, weight: "bold", fill: rgb("#0f172a"))[Instagram रील्स] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 6.8pt, fill: rgb("#db2777"))[Daily Tech Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 31mm)
        #v(2pt)
        #text(size: 8.1pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp चैनल] \
        #link("https://wa.me/917646892094")[#text(size: 6.8pt, fill: rgb("#16a34a"))[जॉब व नोट्स अलर्ट]]
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(13.5pt)

// WHATSAPP HELP DESK CTA
#box(
  width: 100%,
  fill: rgb("#dcfce7"),
  stroke: 1.2pt + rgb("#16a34a"),
  radius: 4.5pt,
  inset: (x: 9pt, y: 6pt),
  grid(
    columns: (auto, 1fr, auto),
    gutter: 9pt,
    align: (left + horizon, left + horizon, right + horizon),
    image("02_BRAND_ASSETS/whatsapp_logo.svg", width: 9.5mm),
    [
      #text(size: 8.8pt, weight: "bold", fill: rgb("#14532d"))[RTechLab छात्र हेल्प डेस्क और करियर मार्गदर्शन] \
      #text(size: 8.1pt, fill: rgb("#166534"))[Subnetting, Packet Tracer या CCNA/Network+ की तैयारी में कहीं अटक गए हैं? सीधे WhatsApp पर पूछें!]
    ],
    link("https://wa.me/917646892094")[
      #box(
        fill: rgb("#16a34a"),
        radius: 3.5pt,
        inset: (x: 9pt, y: 5pt),
        text(fill: white, weight: "bold", size: 8.6pt)[WhatsApp: +91 76468 92094]
      )
    ]
  )
)
