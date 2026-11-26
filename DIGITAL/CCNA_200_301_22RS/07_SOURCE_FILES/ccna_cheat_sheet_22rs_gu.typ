#set document(
  title: "RTechLab — Cisco CCNA 200-301 & Networking Quick Desk Cheat Sheet (Gujarati)",
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
          #text(fill: rgb("#64748b"))[ · 10-પેજ ક્વિક ડેસ્ક ગાઈડ (ગુજરાતી આવૃત્તિ)]
        ],
        [
          #text(fill: rgb("#0284c7"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 ડેસ્ક એડિશન]
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
        [© RTechLab Original Edition · શીખો · પ્રેક્ટિસ કરો · જોડાઓ · Free Subnetting & CLI Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[પેજ #p / 10]]]
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
      *💡 શું તમે જાણો છો?* #fact
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
#section-banner("01", "નેટવર્કના પ્રકારો, ટોપોલોજી અને આર્કિટેક્ચર", "CCNA 200-301 Domain 1.0 · નેટવર્ક ફંડામેન્ટલ્સ")

#grid(
  columns: (1.18fr, 0.82fr),
  gutter: 6.5pt,
  card(
    "કદ, અંતર અને હેતુ મુજબ નેટવર્કના પ્રકારો",
    tbl(
      (auto, auto, 1fr, auto),
      ("પ્રકાર", "પૂરું નામ", "વ્યાપ, માધ્યમ અને મુખ્ય ઉપયોગ", "રેન્જ"),
      (
        ([*PAN*], [Personal Area], [Bluetooth, Zigbee, NFC, USB; સ્માર્ટવોચ, ઇયરબડ્સ, લેપટોપ], [1–10 m]),
        ([*LAN*], [Local Area], [Ethernet (`802.3`) અને Switch; ઓફિસ, ઘર, કમ્પ્યુટર લેબ], [100 m સુધી]),
        ([*WLAN*], [Wireless LAN], [Wi-Fi (`802.11ax/be`), Access Points (AP) અને WLC], [30–100 m]),
        ([*CAN*], [Campus Area], [ફાઇબર બેકબોનથી જોડાયેલ બિલ્ડિંગ LANs; યુનિવર્સિટી], [1–5 km]),
        ([*MAN*], [Metro Area], [શહેરભરમાં ફેલાયેલ હાઇ-સ્પીડ Metro Ethernet / ફાઇબર રિંગ], [5–50 km]),
        ([*WAN*], [Wide Area], [લીઝ્ડ લાઇન, MPLS, બ્રોડબેન્ડ, 5G દ્વારા ગ્લોબલ બ્રાન્ચ કનેક્શન], [50+ km]),
        ([*SAN*], [Storage Area], [Fibre Channel / iSCSI દ્વારા સર્વર માટે હાઇ-સ્પીડ સ્ટોરેજ], [ડેટા સેન્ટર]),
        ([*VPN*], [Virtual Private], [પબ્લિક ઇન્ટરનેટ પર એન્ક્રિપ્ટેડ ટનલ (`IPsec` / `SSL` / `WireGuard`)], [ગ્લોબલ]),
        ([*SD-WAN*], [Software-Defined WAN], [સેન્ટ્રલ કંટ્રોલર MPLS, ISP અને LTE ટ્રાફિકને સ્માર્ટ રીતે રૂટ કરે છે], [મલ્ટી-સાઇટ]),
      ),
      pad-y: 4.6pt,
      fsize: 8.1pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "ફિઝિકલ અને લોજિકલ ટોપોલોજી (Visual Guide)",
    [
      #align(center)[#image("02_BRAND_ASSETS/ccna_topology_visual.png", width: 100%)]
      #v(4pt)
      #set text(size: 8.1pt)
      - *Star / Hub-Spoke:* બધા હોસ્ટ સેન્ટ્રલ Switch સાથે જોડાય છે. ફોલ્ટ શોધવું સરળ; સેન્ટ્રલ સ્વિચ સિંગલ પોઇન્ટ ઓફ ફેલ્યોર.
      - *Full Mesh:* દરેક નોડ દરેક અન્ય નોડ સાથે જોડાય છે. લિંક્સ = $n(n-1)/2$. મહત્તમ રિડન્ડન્સી, વધુ ખર્ચ.
      - *Partial Mesh:* મુખ્ય HQ સાઇટ્સ ફુલ મેશ; બ્રાન્ચ સાઇટ્સ ડ્યુઅલ-હોમ્ડ.
      - *Spine-Leaf (Data Center):* દરેક Leaf દરેક Spine સાથે જોડાય છે — ઓછી લેટન્સી અને ECMP લોડ બેલેન્સિંગ.
      - *Three-Tier Campus:* *Core* (હાઇ-સ્પીડ L3) → *Distribution* (પોલિસી/રૂટિંગ) → *Access* (યુઝર પોર્ટ્સ, PoE).
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
    "ટ્રાન્સમિશન મોડ્સ અને કમ્યુનિકેશન પ્રકારો",
    [
      #tbl(
        (auto, 1fr),
        ("મોડ / પ્રકાર", "વર્તન અને CCNA પરીક્ષાના મુખ્ય મુદ્દા"),
        (
          ([*Simplex*], [માત્ર એક તરફ ડેટા (TV બ્રોડકાસ્ટ, કીબોર્ડ). કોઈ રિટર્ન પાથ નહીં.]),
          ([*Half-Duplex*], [બંને તરફ, પણ એક સમયે એક. *CSMA/CD* (Hubs). ટકરાવ શક્ય.]),
          ([*Full-Duplex*], [એક સાથે Tx અને Rx. *Switches*; શૂન્ય કોલિઝન.]),
          ([*Unicast*], [1-થી-1 કમ્યુનિકેશન (ચોક્કસ MAC/IP).]),
          ([*Broadcast*], [1-થી-બધા (સબનેટમાં: `FF:FF:FF:FF:FF:FF`, `255.255.255.255`).]),
          ([*Multicast*], [1-થી-ગ્રુપ (`224.0.0.0–239.255.255.255`, OSPF `224.0.0.5`).]),
          ([*Anycast*], [1-થી-સૌથી નજીકનો નોડ (IPv6 / DNS રૂટ સર્વર).]),
        ),
        pad-y: 4.5pt,
        fsize: 8.1pt
      )
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "કોલિઝન ડોમેન વિરુદ્ધ બ્રોડકાસ્ટ ડોમેન",
    [
      #tbl(
        (auto, auto, auto),
        ("ડિવાઇસ", "કોલિઝન ડોમેન", "બ્રોડકાસ્ટ ડોમેન"),
        (
          ([*Hub / Repeater (L1)*], [1 શેર કરેલ ડોમેન], [1 શેર કરેલ ડોમેન]),
          ([*Bridge / L2 Switch*], [*દરેક સ્વિચ પોર્ટ દીઠ 1*], [1 (VLAN વિના)]),
          ([*L2 Switch + VLANs*], [દરેક સ્વિચ પોર્ટ દીઠ 1], [*દરેક VLAN દીઠ 1*]),
          ([*Router / L3 Switch*], [દરેક ઇન્ટરફેસ દીઠ 1], [*દરેક ઇન્ટરફેસ / SVI દીઠ 1*]),
        ),
        pad-y: 4.6pt,
        fsize: 8.1pt
      )
      #v(4pt)
      #set text(size: 8.1pt)
      - *CSMA/CD (Ethernet Half-Duplex):* મોકલતા પહેલા સાંભળો; કોલિઝન થાય તો જામ સિગ્નલ + રેન્ડમ બેકઓફ.
      - *CSMA/CA (Wi-Fi `802.11`):* RTS/CTS અને ACK ફ્રેમથી કોલિઝન અટકાવે છે.
      - *Store-and-Forward vs Cut-Through:* Store-and-Forward આખું FCS (CRC) તપાસે છે; Cut-Through માત્ર Dest MAC વાંચીને મોકલે છે.
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(12pt)
#card(
  "WAN ટેક્નોલોજી, SOHO વિરુદ્ધ Enterprise અને ક્લાઉડ વર્ચ્યુઅલાઇઝેશન",
  [
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.1pt)
        *WAN કનેક્ટિવિટી:* *MPLS* (લેબલ-સ્વિચ્ડ પ્રાઇવેટ WAN), *Metro Ethernet* (ફાઇબર L2/L3), *PPPoE/DOCSIS* (બ્રોડબેન્ડ), *GRE* (ટનલ), *IPsec* (એન્ક્રિપ્ટેડ VPN).
      ],
      [
        #set text(size: 8.1pt)
        *SOHO vs Enterprise:* SOHO રાઉટરમાં મોડેમ, સ્વિચ, NAT અને Wi-Fi એક જ બોક્સમાં હોય છે. Enterprise માં ISP Router → NGFW → L3 Core → L2 Access + WLC અલગ હોય છે.
      ],
      [
        #set text(size: 8.1pt)
        *વર્ચ્યુઅલાઇઝેશન અને ક્લાઉડ:* *Type 1 Hypervisor* (ESXi, KVM, Hyper-V) સીધું હાર્ડવેર પર ચાલે છે; *vSwitch* VMs ને NIC સાથે જોડે છે (`IaaS`, `PaaS`, `SaaS`).
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(12pt)
#did-you-know[10 સાઇટ્સના *Full Mesh* WAN માં $10 times 9 / 2 = 45$ લિંક્સ જોઈએ! ફક્ત 1 નવી સાઇટ ઉમેરવા પર 10 નવી લિંક્સ લાગે છે — તેથી કંપનીઓ *Partial Mesh* અથવા *SD-WAN* દ્વારા 40–70% ખર્ચ બચાવે છે.]

#pagebreak()

// =========================================================================
// PAGE 3: NETWORK DEVICES, CABLES, FIBER & HARDWARE PORTS
// =========================================================================
#section-banner("02", "નેટવર્ક ડિવાઇસીસ, કેબલ્સ, ફાઇબર ઓપ્ટિક્સ અને PoE", "હાર્ડવેર લેયર · L1–L7 ડિવાઇસ, કેબલિંગ અને બૂટ સિક્વન્સ")

#card(
  "સંપૂર્ણ નેટવર્ક ડિવાઇસ રેફરન્સ (Layer 1 થી Layer 7)",
  tbl(
    (auto, auto, 1fr, auto),
    ("ડિવાઇસ", "OSI", "મુખ્ય કાર્ય, ફોરવર્ડિંગ ટેબલ અને વાસ્તવિક ઉપયોગ", "પરીક્ષાનો મુખ્ય મુદ્દો"),
    (
      ([*Repeater / Hub*], [L1], [ઇલેક્ટ્રિકલ સિગ્નલને રીજનરેટ અને બધા પોર્ટ પર બ્રોડકાસ્ટ કરે છે], [Half-duplex; 1 કોલિઝન ડોમેન]),
      ([*Media Converter*], [L1], [કોપર ઇથરનેટ (`RJ-45`) ને ફાઇબર ઓપ્ટિક (`SFP/LC`) માં ફેરવે છે], [100 m થી વધુ અંતર માટે]),
      ([*Bridge*], [L2], [સોફ્ટવેર આધારિત 2–4 પોર્ટ ફ્રેમ ફોરવર્ડર (MAC ટેબલથી)], [હવે ASIC Switch એ સ્થાન લીધું]),
      ([*L2 Switch*], [L2], [*CAM / MAC Address Table* અને ASIC થી ફ્રેમ ફોરવર્ડ કરે છે], [કોલિઝન ડોમેન તોડે છે; VLANs]),
      ([*L3 Multilayer Switch*], [L2/L3], [હાર્ડવેર સ્પીડ સ્વિચિંગ + *SVIs* અને *CEF* થી ઇન્ટર-VLAN રૂટિંગ], [વાયર-સ્પીડ રૂટિંગ]),
      ([*Router*], [L3], [*Routing Table* થી અલગ IP નેટવર્ક્સ જોડે છે; બ્રોડકાસ્ટ રોકે છે], [બ્રોડકાસ્ટ ડોમેન તોડે છે]),
      ([*Firewall (NGFW)*], [L3–L7], [કનેક્શન સ્ટેટ, ઝોન, App-ID, IPS અને URL ફિલ્ટરિંગ તપાસે છે], [બહારથી અંદર Default-Deny]),
      ([*IDS / IPS*], [L3–L7], [*IDS* = પેસિવ એલર્ટ (SPAN/TAP); *IPS* = ઇનલાઇન સક્રિય બ્લોક], [સિગ્નેચર અને અનોમલી ડિટેક્શન]),
      ([*Access Point (AP)*], [L1/L2], [વાયરલેસ `802.11` ફ્રેમને વાયર્ડ `802.3` ઇથરનેટ સાથે જોડે છે], [Autonomous vs CAPWAP AP]),
      ([*WLC (Controller)*], [L2–L7], [Lightweight APs ની સેટિંગ્સ, RF ચેનલ અને રોમિંગ કંટ્રોલ કરે છે], [CAPWAP UDP `5246/5247`]),
      ([*Modem / ONT*], [L1], [ISP ની કોએક્સ/DSL/ફાઇબર લાઇન પર ડિજિટલ સિગ્નલ મોડ્યુલેટ કરે છે], [DOCSIS / PPPoE / GPON ONT]),
      ([*Load Balancer*], [L4–L7], [સર્વર પૂલમાં ક્લાયન્ટ ટ્રાફિક વહેંચે છે; SSL ઓફલોડ અને હેલ્થ ચેક], [હાઇ અવેલેબિલિટી VIPs]),
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
    "ટ્વિસ્ટેડ-પેર કોપર (UTP/STP) અને પિનઆઉટ્સ",
    [
      #tbl(
        (auto, auto, auto, auto),
        ("કેટેગરી", "મહત્તમ ગતિ", "બેન્ડવિડ્થ", "મહત્તમ અંતર"),
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
      - *T568B (સૌથી પ્રચલિત):* `1:W-O, 2:O, 3:W-G, 4:B, 5:W-B, 6:G, 7:W-Br, 8:Br`
      - *T568A:* ઓરેન્જ અને ગ્રીન પેર બદલાય છે (`1:W-G, 2:G, 3:W-O, 6:O`).
      - *Straight-Through:* અલગ ડિવાઇસ (PC ↔ Switch, Switch ↔ Router).
      - *Crossover:* સમાન ડિવાઇસ (Switch ↔ Switch). *Auto-MDIX* આધુનિક પોર્ટ્સ પર ઓટો-ડિટેક્ટ કરે છે!
      - *Rollover (Console):* પિન 1–8 ઊલટા (`9600 bps, 8N1`).
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "ફાઇબર ઓપ્ટિક કેબલ (SMF vs MMF) અને SFP",
    [
      #tbl(
        (auto, 1fr, 1fr),
        ("વિશેષતા", "Single-Mode (SMF)", "Multimode (MMF)"),
        (
          ([*કોર સાઇઝ*], [8.3–10 µm (પાતળો)], [50 કે 62.5 µm (પહોળો)]),
          ([*લાઇટ સ્રોત*], [Laser (1310 / 1550 nm)], [LED / VCSEL (850 nm)]),
          ([*જેકેટ રંગ*], [પીળો (Yellow)], [ઓરેન્જ (OM1/2) · એક્વા (OM3/4)]),
          ([*અંતર*], [10–80+ km (WAN/CAN)], [300–550 m (LAN/DC)]),
          ([*ખર્ચ*], [ઓપ્ટિક્સ મોંઘા, કેબલ સસ્તી], [ઓપ્ટિક્સ સસ્તા, ઓછું અંતર]),
        ),
        pad-y: 4.8pt,
        fsize: 8.0pt
      )
      #v(4pt)
      #set text(size: 8.0pt)
      - *ટ્રાન્સીવર:* `SFP` (1G), `SFP+` (10G), `SFP28` (25G), `QSFP+` (40G), `QSFP28` (100G).
      - *કનેક્ટર:* `LC` (નાનું ડ્યુપ્લેક્સ), `SC` (પુશ-પુલ), `ST` (બાયોનેટ).
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
    "Power over Ethernet (PoE) અને ફિઝિકલ એરર",
    [
      #tbl(
        (auto, auto, auto, auto),
        ("સ્ટાન્ડર્ડ", "IEEE", "PSE Max", "PD આઉટપુટ"),
        (
          ([*PoE*], [`802.3af`], [15.4 W], [12.95 W (IP ફોન)]),
          ([*PoE+*], [`802.3at`], [30.0 W], [25.5 W (Wi-Fi 6 AP)]),
          ([*PoE++*], [`802.3bt`], [60 / 90 W], [51 / 71.3 W (PTZ)]),
        ),
        pad-y: 4.6pt,
        fsize: 8.0pt
      )
      #v(3pt)
      #set text(size: 8.0pt)
      *કાઉન્ટર* (#cmd("show int g0/1")): *Runts* (`<64B`), *Giants* (`>1518B` MTU), *CRC* (ખરાબ કેબલ/ડ્યુપ્લેક્સ મિસમેચ).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "Cisco IOS મેમોરી અને બૂટ સિક્વન્સ",
    [
      #set text(size: 8.0pt)
      - *મેમોરી પ્રકાર:* *ROM* (POST + Bootstrap), *Flash* (IOS `.bin` ઇમેજ), *NVRAM* (`startup-config`), *RAM* (`running-config`, MAC/Routing ટેબલ).
      - *બૂટ ક્રમ:* `POST` → `Bootstrap` → `Flash` માંથી IOS લોડ → `NVRAM` માંથી `startup-config` ને `RAM` માં લોડ.
      - *Config Register:* `0x2102` (સામાન્ય બૂટ) · `0x2142` (પાસવર્ડ રિકવરી માટે NVRAM બાયપાસ).
      - *સેવ કરો:* #cmd("copy running-config startup-config") અથવા #cmd("wr")
    ],
    head-bg: rgb("#f1f5f9"),
    title-color: rgb("#0f172a")
  )
)

#v(10.5pt)
#did-you-know[ક્યારેય ચાલુ ફાઇબર ઓપ્ટિક કેબલ કે SFP પોર્ટમાં સીધું ન જોવું! Single-mode લેઝર *1310 nm / 1550 nm* (અદૃશ્ય ઇન્ફ્રારેડ) પર કામ કરે છે અને દેખાયા વિના આંખના રેટિનાને કાયમી નુકસાન કરી શકે છે.]

#pagebreak()

// =========================================================================
// PAGE 4: OSI MODEL, TCP/IP, ENCAPSULATION & PORTS
// =========================================================================
#section-banner("03", "OSI 7-લેયર મોડેલ, TCP/IP, એન્કેપ્સુલેશન અને પોર્ટ્સ", "પ્રોટોકોલ સ્ટેક · PDUs, TCP હેન્ડશેક, પોર્ટ્સ અને Wireshark")

#grid(
  columns: (0.95fr, 1.05fr),
  gutter: 6.5pt,
  card(
    "OSI vs TCP/IP વિઝ્યુઅલ અને એન્કેપ્સુલેશન ફ્લો",
    [
      #align(center)[#image("02_BRAND_ASSETS/ccna_osi_visual.png", width: 100%)]
      #v(4pt)
      #set text(size: 8.3pt)
      #strong[યાદ રાખવાનું સૂત્ર (7 → 1):] All People Seem To Need Data Processing. \
      #strong[Encapsulation (ઉપર → નીચે):] Data → #strong[Segment] (+TCP/UDP પોર્ટ) → #strong[Packet] (+Src/Dst IP) → #strong[Frame] (+Src/Dst MAC + FCS) → #strong[Bits] (વાયર). \
      #strong[De-encapsulation (નીચે → ઉપર):] NIC પહેલા FCS અને Dest MAC તપાસે છે, Router Dest IP અને Host Dest Port વાંચે છે.
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "OSI 7 લેયર્સ વિગતવાર ટેબલ",
    tbl(
      (auto, auto, auto, 1fr),
      ("L", "લેયર", "PDU", "પ્રોટોકોલ, હાર્ડવેર અને ટ્રબલશૂટિંગ"),
      (
        ([*7*], [Application], [Data], [HTTP/S, DNS, DHCP, SSH, SMTP, SNMP, FTP]),
        ([*6*], [Presentation], [Data], [TLS/SSL એન્ક્રિપ્શન, JPEG, ASCII, UTF-8, Gzip]),
        ([*5*], [Session], [Data], [ડાયલોગ કંટ્રોલ, RPC, NetBIOS, SQL સેશન]),
        ([*4*], [Transport], [Segment], [TCP (વિશ્વસનીય) અને UDP (ઝડપી); પોર્ટ્સ `0–65535`]),
        ([*3*], [Network], [Packet], [IPv4, IPv6, ICMP, OSPF, EIGRP, Router]),
        ([*2*], [Data Link], [Frame], [Ethernet `802.3`, `802.11`, VLAN `802.1Q`, MAC, Switch]),
        ([*1*], [Physical], [Bits], [Cat6, Fiber, SFP, વોલ્ટેજ, Hub, Repeater]),
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
    "TCP વિરુદ્ધ UDP અને 3-Way Handshake",
    [
      #tbl(
        (auto, 1fr, 1fr),
        ("વિશેષતા", "TCP (વિશ્વસનીય)", "UDP (ઝડપી)"),
        (
          ([*કનેક્શન*], [Connection-oriented (SYN/ACK)], [Connectionless]),
          ([*વિશ્વસનીયતા*], [ACKs, Retransmit, Windowing], [Best-effort, કોઈ ACK નહીં]),
          ([*હેડર સાઇઝ*], [20–60 bytes], [8 bytes (ઓછો ઓવરહેડ)]),
          ([*ઉપયોગ*], [HTTP/S, SSH, FTP, SMTP, BGP], [DNS, DHCP, TFTP, VoIP]),
        ),
        pad-y: 6pt,
        fsize: 8.3pt
      )
      #v(4pt)
      #set text(size: 8.3pt)
      *TCP 3-Way Handshake:* Client `SYN` → Server `SYN-ACK` → Client `ACK`. \
      *TCP Teardown:* `FIN` → `ACK` → `FIN` → `ACK` (અથવા તરત બંધ માટે `RST`). \
      *પોર્ટ રેન્જ:* Well-Known (`0–1023`), Registered (`1024–49151`), Dynamic (`49152–65535`).
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "મહત્વના TCP અને UDP પોર્ટ્સ (CCNA પરીક્ષા માટે)",
    tbl(
      (auto, auto, auto, auto, auto, auto),
      ("પોર્ટ", "Proto", "સર્વિસ", "પોર્ટ", "Proto", "સર્વિસ"),
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
  "Ethernet II ફ્રેમ, ARP અને ટ્રબલશૂટિંગ પદ્ધતિ (Wireshark)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.3pt)
        *Ethernet Frame (64–1518B):* `Preamble (7B)` + `SFD (1B)` | *Dest MAC (6B)* | *Src MAC (6B)* | *802.1Q (4B)* | *EtherType (2B)* (`0x0800` IPv4, `0x86DD` IPv6, `0x0806` ARP) | *Data (46–1500B)* | *FCS (4B)*. \
        *ARP:* Broadcast `ARP Request` (`FF:FF:FF:FF:FF:FF`) → Unicast `ARP Reply`. જુઓ: #cmd("show arp") / `arp -a`.
      ],
      [
        #set text(size: 8.3pt)
        *OSI ટ્રબલશૂટિંગ પદ્ધતિઓ:*
        - *Bottom-Up (L1 → L7):* પહેલા કેબલ/લિંક LED → L2 VLAN/MAC → L3 IP/Ping → L4 પોર્ટ → L7 એપ.
        - *Top-Down (L7 → L1):* પહેલા બ્રાઉઝર/DNS ટેસ્ટ કરો.
        - *Wireshark ફિલ્ટર:* `ip.addr == 10.1.1.5`, `tcp.port == 443`, `icmp`, `arp`, `dns`, `tcp.flags.syn == 1`.
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(15pt)
#did-you-know[પોર્ટ `53` સામાન્ય DNS લુકઅપ (`< 512 bytes`) માટે *UDP* વાપરે છે, પરંતુ પ્રાઇમરી અને સેકન્ડરી DNS સર્વર વચ્ચે Zone Transfer (`AXFR`) અથવા મોટા DNSSEC ડેટા માટે *TCP* પર સ્વિચ થાય છે!]

#pagebreak()

// =========================================================================
// PAGE 5: IPV4 ADDRESSING, BINARY, CLASSES & SPECIAL RANGES
// =========================================================================
#section-banner("04", "IPV4 એડ્રેસિંગ, બાઇનરી ગણિત અને ખાસ રેન્જ", "32-બિટ ડોટેડ ડેસિમલ · ક્લાસ, RFC 1918, APIPA અને IOS તપાસ")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IPv4 ક્લાસ (ક્લાસફુલ) અને ડિફોલ્ટ માસ્ક",
    tbl(
      (auto, auto, auto, 1fr),
      ("ક્લાસ", "પ્રથમ ઓક્ટેટ", "ડિફોલ્ટ માસ્ક", "મુખ્ય ઉપયોગ અને નોંધ"),
      (
        ([*A*], [`1–126`], [`255.0.0.0` (`/8`)], [મોટા નેટવર્ક; 1.67 કરોડ હોસ્ટ/નેટ]),
        ([*Loop*], [`127`], [`255.0.0.0` (`/8`)], [`127.0.0.1` લોકલ TCP/IP સ્ટેક ટેસ્ટ]),
        ([*B*], [`128–191`], [`255.255.0.0` (`/16`)], [મધ્યમ-મોટી સંસ્થાઓ; 65,534 હોસ્ટ/નેટ]),
        ([*C*], [`192–223`], [`255.255.255.0` (`/24`)], [નાના LAN; 254 હોસ્ટ/નેટ]),
        ([*D*], [`224–239`], [N/A (Multicast)], [OSPF `224.0.0.5/6`, EIGRP `.10`, HSRP `.2`]),
        ([*E*], [`240–255`], [N/A (Reserved)], [રિસર્ચ અને પ્રયોગો માટે અનામત]),
      ),
      pad-y: 5.5pt,
      fsize: 8.1pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "પ્રાઇવેટ IPv4 (RFC 1918) અને ખાસ અનામત રેન્જ",
    tbl(
      (auto, auto, 1fr),
      ("રેન્જ નામ", "CIDR / રેન્જ", "હેતુ અને વર્તન"),
      (
        ([*RFC 1918 Cl A*], [`10.0.0.0/8`], [`10.0.0.0 – 10.255.255.255` (16.7M IPs)]),
        ([*RFC 1918 Cl B*], [`172.16.0.0/12`], [`172.16.0.0 – 172.31.255.255` (1.04M IPs)]),
        ([*RFC 1918 Cl C*], [`192.168.0.0/16`], [`192.168.0.0 – 192.168.255.255` (65K IPs)]),
        ([*APIPA (Link-Loc)*], [`169.254.0.0/16`], [DHCP સર્વર ન મળે ત્યારે ડિવાઇસ જાતે લે છે]),
        ([*CGNAT (RFC 6598)*], [`100.64.0.0/10`], [ISP Carrier-Grade NAT શેર કરેલ એડ્રેસ સ્પેસ]),
        ([*Limited Bcast*], [`255.255.255.255`], [લોકલ LAN બ્રોડકાસ્ટ (DHCP Discover)]),
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
  "8-બિટ બાઇનરી પાવર ટેબલ અને ઝડપી ડેસિમલ ↔ બાઇનરી રૂપાંતર",
  [
    #tbl(
      (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.35fr),
      ("Bit 7 ($2^7$)", "Bit 6 ($2^6$)", "Bit 5 ($2^5$)", "Bit 4 ($2^4$)", "Bit 3 ($2^3$)", "Bit 2 ($2^2$)", "Bit 1 ($2^1$)", "Bit 0 ($2^0$)", "માન્ય માસ્ક કિંમતો"),
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
        *ઉદાહરણ `192` → બાઇનરી:* `128 + 64 = 192` → `11000000`. \
        *ઉદાહરણ `172` → બાઇનરી:* `128 + 32 + 8 + 4 = 172` → `10101100`. \
        *ઉદાહરણ `224` → બાઇનરી:* `128 + 64 + 32 = 224` → `11100000` (3 નેટવર્ક બિટ્સ).
      ],
      [
        #set text(size: 8.1pt)
        *ગોલ્ડન નિયમો:*
        - નેટવર્ક બિટ્સ = સબનેટ માસ્કમાં `1` · હોસ્ટ બિટ્સ ($h$) = `0` ની સંખ્યા.
        - ઉપયોગી હોસ્ટ્સ પ્રતિ સબનેટ = $2^h - 2$ (Network ID અને Broadcast બાદ).
        - સબનેટ્સની સંખ્યા = $2^s$ (જ્યાં $s$ = ઉછીના લીધેલા નેટવર્ક બિટ્સ).
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
    "IPv4 પેકેટ હેડર (20 Bytes) અને ICMP",
    [
      #set text(size: 8.1pt)
      - *મુખ્ય ફીલ્ડ્સ:* Version (`4`), IHL, DSCP/ECN (QoS), Total Length, ID/Flags/Fragment Offset, *TTL* (દરેક રાઉટર હોપ પર 1 ઘટે છે; `0` પર પેકેટ ડ્રોપ), *Protocol* (`1`=ICMP, `6`=TCP, `17`=UDP, `89`=OSPF), Checksum, Src IP, Dst IP.
      - *ICMP પ્રકાર:* Type `8` Echo Request, Type `0` Echo Reply, Type `3` Dest Unreachable, Type `11` Time Exceeded (`traceroute`).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "ANDing ઓપરેશન અને નેટવર્ક વિરુદ્ધ હોસ્ટ ID",
    [
      #set text(size: 8.1pt)
      રાઉટર નેટવર્ક ID શોધવા માટે બિટવાઇઝ *AND* (`IP AND Mask`) કરે છે:
      - IP: `192.168.10.75` (`01001011`)
      - માસ્ક: `255.255.255.224` (`11100000`)
      - *પરિણામ:* `192.168.10.64` (`01000000` = Network ID)
      - *Broadcast:* `192.168.10.95` · *ઉપયોગી:* `.65 – .94` (`30` હોસ્ટ્સ).
    ],
    head-bg: rgb("#f1f5f9"),
    title-color: rgb("#0f172a")
  )
)

#v(12pt)
#card(
  "Cisco IOS ઇન્ટરફેસ IPv4 કોન્ફિગરેશન અને કનેક્ટિવિટી ચેકલિસ્ટ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.1pt)
        - સ્ટેટિક IP આપો: #cmd("int g0/0") → #cmd("ip address 10.1.1.1 255.255.255.0") → #cmd("no shutdown")
        - WAN પર DHCP ક્લાયન્ટ: #cmd("ip address dhcp")
        - સ્થિતિ તપાસો: #cmd("show ip interface brief") (`up/up` = L1 અને L2 બરાબર; `administratively down` = `no shut` બાકી).
      ],
      [
        #set text(size: 8.1pt)
        - *5-સ્ટેપ પિંગ તપાસ:* 1) `ping 127.0.0.1` (TCP/IP સ્ટેક) → 2) `ping <own IP>` (NIC) → 3) `ping <Default GW>` (LAN/VLAN) → 4) `ping 8.8.8.8` (Routing/NAT) → 5) `ping google.com` (DNS).
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(12pt)
#did-you-know[RFC 3021 મુજબ *પોઇન્ટ-ટુ-પોઇન્ટ રાઉટર લિંક* પર `/31` (`255.255.255.254`) સબનેટ વાપરી શકાય છે! ભલે $2^1 - 2 = 0$ થાય, પણ P2P લિંક પર બંને IP કામ કરે છે — જે `/30` ની સરખામણીમાં 50% WAN IPv4 બચાવે છે.]

#pagebreak()

// =========================================================================
// PAGE 6: IPV4 SUBNETTING MASTER CHART & VLSM SHORTCUTS
// =========================================================================
#section-banner("05", "IPV4 સબનેટિંગ માસ્ટર ચાર્ટ અને VLSM શોર્ટકટ્સ", "30-સેકન્ડ પરીક્ષા સબનેટિંગ · /16 થી /32, બ્લોક સાઇઝ અને મહાવરો")

#card(
  "સંપૂર્ણ IPv4 CIDR / સબનેટિંગ માસ્ટર ચીટ શીટ (/24–/32 અને /16–/23)",
  tbl(
    (auto, auto, auto, auto, auto, auto, auto),
    ("CIDR", "સબનેટ માસ્ક", "વાઇલ્ડકાર્ડ માસ્ક", "બ્લોક સાઇઝ", "સબનેટ્સ", "કુલ IP", "ઉપયોગી હોસ્ટ્સ"),
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
    "30-સેકન્ડ સબનેટિંગ રીત (Magic Number = 256 - Mask)",
    [
      #set text(size: 8.4pt)
      *પ્રશ્ન:* `172.16.45.138/27` નો Network, Broadcast અને Usable Range શોધો.
      1. *મુખ્ય ઓક્ટેટ:* `/27` ચોથા ઓક્ટેટમાં છે (`255.255.255.224`).
      2. *Magic Number (બ્લોક સાઇઝ):* `256 - 224 = 32`.
      3. *32 ના ગુણાંક:* `0, 32, 64, 96, 128, 160...`
      4. *`138` ક્યાં છે:* `128` અને `160` ની વચ્ચે.
      5. *Network ID:* `172.16.45.128` · *આગલું સબનેટ:* `.160`
      6. *Broadcast ID:* `160 - 1` = `172.16.45.159`
      7. *ઉપયોગી રેન્જ:* `172.16.45.129` – `172.16.45.158` (30 હોસ્ટ્સ).
      *વાઇલ્ડકાર્ડ શોર્ટકટ:* `255.255.255.255 - Mask = Wildcard` (`0` = મેચ, `1` = અવગણો).
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "VLSM (Variable Length Subnet Mask) સ્ટેપ-બાય-સ્ટેપ",
    [
      #set text(size: 8.4pt)
      *નિયમ:* ઓવરલેપ ટાળવા હંમેશા *સૌથી મોટા હોસ્ટથી નાના* ક્રમમાં ફાળવણી કરો!
      *ઉદાહરણ:* 3 LAN + 1 WAN માટે `192.168.10.0/24` વહેંચો:
      - *LAN-A (100 હોસ્ટ):* `/25` (126 ઉપયોગી) → `192.168.10.0/25` (`.0–.127`)
      - *LAN-B (50 હોસ્ટ):* `/26` (62 ઉપયોગી) → `192.168.10.128/26` (`.128–.191`)
      - *LAN-C (20 હોસ્ટ):* `/27` (30 ઉપયોગી) → `192.168.10.192/27` (`.192–.223`)
      - *WAN P2P (2 હોસ્ટ):* `/30` (2 ઉપયોગી) → `192.168.10.224/30` (`.224–.227`)
      *Route Summarization:* સળંગ સબનેટ્સના કોમન બિટ્સ લો (`.0/24` થી `.3/24` → `192.168.0.0/22`).
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(14.5pt)
#card(
  "4 ઉકેલેલા CCNA પરીક્ષા સબનેટિંગ દાખલા (ઝડપી પેટર્ન ઓળખો)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.4pt)
        - *દાખલો 1 (ત્રીજો ઓક્ટેટ `/21`):* `10.50.19.42/21` નું સબનેટ અને બ્રોડકાસ્ટ? માસ્ક `255.255.248.0`, બ્લોક સાઇઝ `8` (`0, 8, 16, 24`). `19` આવે `16–23` માં. *Net:* `10.50.16.0`, *Bcast:* `10.50.23.255`.
        - *દાખલો 2 (500 હોસ્ટ્સ જોઈએ):* કયો CIDR પસંદ કરશો? `/24` = 254 (ઓછા છે), `/23` = 510 ઉપયોગી! `/23` (`255.255.254.0`) પસંદ કરો.
      ],
      [
        #set text(size: 8.4pt)
        - *દાખલો 3 (શું એક જ LAN માં છે?):* `192.168.5.60/26` અને `192.168.5.70/26`? બ્લોક `64`: `.60` છે `0–63` માં, `.70` છે `64–127` માં. *ના* — રાઉટર જોઈએ!
        - *દાખલો 4 (ACL વાઇલ્ડકાર્ડ):* `10.20.16.0/22` માટે વાઇલ્ડકાર્ડ? માસ્ક `255.255.252.0` → વાઇલ્ડકાર્ડ `0.0.3.255`.
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(14.5pt)
#did-you-know[CCNA પરીક્ષામાં જો *60 હોસ્ટ્સ* ની જરૂર હોય, તો `/27` (30 હોસ્ટ્સ) નહીં પણ `/26` (62 ઉપયોગી હોસ્ટ્સ) પસંદ કરો. હંમેશા Network અને Broadcast ID માટે 2 બાદ કરવાનું યાદ રાખો (સિવાય `/31` P2P લિંક)!]

#pagebreak()

// =========================================================================
// PAGE 7: IPV6 COMPLETE MASTERY
// =========================================================================
#section-banner("06", "IPV6 સંપૂર્ણ માસ્ટરી (128-બિટ આર્કિટેક્ચર)", "હેક્ઝાડેસિમલ, ઝીરો કમ્પ્રેશન, એડ્રેસ પ્રકાર, EUI-64 અને SLAAC")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IPv6 ફોર્મેટ અને ઝીરો કમ્પ્રેશન નિયમો",
    [
      #set text(size: 8.1pt)
      - *128-બિટ હેક્ઝાડેસિમલ:* કોલન (`:`) થી અલગ 4 હેક્સ અંકોના 8 સમૂહ (હેક્સ્ટેટ). દરેક હેક્સ અંક = 4 બિટ્સ (`0–9, A–F`).
      - *કુલ એડ્રેસ:* $2^(128) approx 3.4 times 10^(38)$ (NAT ની જરૂર પૂરી!).
      - *નિયમ 1 (આગળના ઝીરો દૂર કરો):* `0db8` → `db8`, `0000` → `0`.
      - *નિયમ 2 (ડબલ કોલન `::`):* સળંગ બધા-ઝીરો હેક્સ્ટેટ્સને `::` થી બદલો (*એક એડ્રેસમાં માત્ર એક જ વાર!*).
      - *ઉદાહરણ:* `2001:0db8:0000:0000:0000:0000:0000:0001` → `2001:db8::1`
      - *IPv6 સબનેટિંગ:* સ્ટાન્ડર્ડ LAN પ્રિફિક્સ `/64` છે. ISP સાઇટને `/48` અથવા `/56` આપે છે (65,536 કે 256 `/64` LANs).
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "IPv6 એડ્રેસના પ્રકારો અને અનામત પ્રિફિક્સ",
    tbl(
      (auto, auto, 1fr),
      ("એડ્રેસ પ્રકાર", "પ્રિફિક્સ", "વ્યાપ અને પરીક્ષાનો મુખ્ય મુદ્દો"),
      (
        ([*Global Unicast (GUA)*], [`2000::/3`], [પબ્લિકલી રૂટેબલ ઇન્ટરનેટ IPv6 (`2001:...`, `2606:...`)]),
        ([*Unique Local (ULA)*], [`FC00::/7`], [પ્રાઇવેટ આંતરિક IPv6 (`FD00::/8` લોકલી જનરેટેડ)]),
        ([*Link-Local (LLA)*], [`FE80::/10`], [દરેક IPv6 ઇન્ટરફેસ પર ઓટો-કોન્ફિગર; નોન-રૂટેબલ]),
        ([*Multicast*], [`FF00::/8`], [`FF02::1` All Nodes, `FF02::2` All Routers, `::5/6` OSPFv3]),
        ([*Loopback*], [`::1/128`], [IPv4 ના `127.0.0.1` ની સમકક્ષ]),
        ([*Unspecified*], [`::/128`], [`0.0.0.0` ની સમકક્ષ (DAD/DHCPv6 માં ઉપયોગ)]),
        ([*Default Route*], [`::/0`], [`0.0.0.0/0` ની સમકક્ષ]),
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
    "EUI-64 ઇન્ટરફેસ ID (48-બિટ MAC → 64-બિટ IID)",
    [
      #set text(size: 8.1pt)
      આપેલ MAC `001A.2B3C.4D5E`:
      1. MAC ને વચ્ચેથી વહેંચો: `001A:2B` અને `3C:4D5E`.
      2. વચ્ચે `FFFE` ઉમેરો: `001A:2BFF:FE3C:4D5E`.
      3. પહેલા બાઇટનો *7મો બિટ* (U/L બિટ) ઉલટાવો: `00` (`0000 0000`) → `02` (`0000 0010`).
      4. *પરિણામ:* `021A:2BFF:FE3C:4D5E` (જેમ કે `FE80::021A:2BFF:FE3C:4D5E`).
      *IOS કમાન્ડ:* #cmd("ipv6 address 2001:db8:1::/64 eui-64")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "SLAAC, NDP અને DHCPv6 (IPv6 માં કોઈ બ્રોડકાસ્ટ નહીં!)",
    [
      #set text(size: 8.1pt)
      - *NDP (Neighbor Discovery — ICMPv6):* ARP ની જગ્યા લે છે!
        - *RS (Type 133):* હોસ્ટ રાઉટર પાસેથી પ્રિફિક્સ પૂછે છે (`FF02::2`).
        - *RA (Type 134):* રાઉટર `/64` પ્રિફિક્સ + ડિફોલ્ટ ગેટવે આપે છે.
        - *NS / NA (135/136):* IPv6 → MAC ઉકેલે છે અને *DAD* ચલાવે છે.
      - *SLAAC:* હોસ્ટ RA પ્રિફિક્સ + EUI-64/રેન્ડમ IID થી જાતે GUA બનાવે છે.
      - *Stateless DHCPv6:* SLAAC IP આપે છે; DHCPv6 DNS આપે છે (`O` ફ્લેગ).
      - *Stateful DHCPv6:* DHCPv6 જ IP + DNS આપે છે (`M` ફ્લેગ).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(11.5pt)
#card(
  "IPv6 રૂટિંગ, ટ્રાન્ઝિશન ટેક્નોલોજી અને Cisco IOS કમાન્ડ્સ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.1pt)
        - IPv6 રૂટિંગ ચાલુ કરો: #cmd("ipv6 unicast-routing")
        - સ્ટેટિક GUA આપો: #cmd("ipv6 address 2001:db8:10::1/64")
        - માત્ર Link-Local: #cmd("ipv6 enable") · સ્ટેટિક રૂટ: #cmd("ipv6 route ::/0 2001:db8:1::2")
        - *OSPFv3:* ઇન્ટરફેસ પર ચાલે છે (#cmd("ipv6 ospf 1 area 0")); `FE80::` નેક્સ્ટ-હોપ વાપરે છે.
      ],
      [
        #set text(size: 8.1pt)
        - ઇન્ટરફેસ તપાસ: #cmd("show ipv6 interface brief")
        - રૂટ્સ અને NDP તપાસ: #cmd("show ipv6 route") · #cmd("show ipv6 neighbors")
        - *ટ્રાન્ઝિશન ટેક્નોલોજી:* *Dual-Stack* (IPv4+IPv6 સાથે), *Tunneling* (GRE/6to4), *NAT64* (IPv6 ↔ IPv4 અનુવાદ).
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(11.5pt)
#card(
  "IPv6 મલ્ટિકાસ્ટ પ્રખ્યાત એડ્રેસ અને Anycast",
  [
    #tbl(
      (auto, auto, 1fr),
      ("એડ્રેસ", "સ્કોપ / લક્ષ્ય", "પ્રોટોકોલ અને પરીક્ષા ઉપયોગ"),
      (
        ([`FF02::1`], [All Nodes (Link-Local)], [LAN પર IPv4 બ્રોડકાસ્ટ `255.255.255.255` ની જગ્યાએ]),
        ([`FF02::2`], [All Routers (Link-Local)], [હોસ્ટ અહીં Router Solicitation (RS) મોકલે છે]),
        ([`FF02::5` / `::6`], [OSPFv3 Routers / DR], [બધા OSPFv3 રાઉટર્સ (`::5`) અને DR/BDR (`::6`)]),
        ([`FF02::1:FFxx:xxxx`], [Solicited-Node Multicast], [NDP NS અને DAD દ્વારા ઉપયોગ (IPv6 ના છેલ્લા 24 બિટ્સ)]),
      ),
      pad-y: 5.3pt,
      fsize: 8.0pt
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(11.5pt)
#did-you-know[IPv6 માં *ARP* અને *IPv4 બ્રોડકાસ્ટ* સંપૂર્ણપણે નાબૂદ થાય છે! દરેક IPv6 ઇન્ટરફેસ પર આપમેળે એક Link-Local એડ્રેસ (`FE80::/10`) બને છે, અને રાઉટર રૂટિંગ ટેબલમાં આ `FE80::` ને જ નેક્સ્ટ-હોપ ગેટવે બનાવે છે.]

#pagebreak()

// =========================================================================
// PAGE 8: SWITCHING, VLANS, STP & ETHERCHANNEL
// =========================================================================
#section-banner("07", "સ્વિચિંગ, VLANS, 802.1Q ટ્રંક્સ, STP અને ETHERCHANNEL", "CCNA Domain 2.0 · લેયર 2 કેમ્પસ સ્વિચિંગ માસ્ટરી")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "સ્વિચ ઓપરેશન અને VLANs (802.1Q)",
    [
      #set text(size: 8.9pt)
      - *CAM / MAC ટેબલ:* સ્વિચ આવતા પોર્ટ પરથી *Source MAC* શીખે છે (`300s` એજિંગ). અજાણ્યા યુનિકાસ્ટ અને બ્રોડકાસ્ટને ફ્લડ કરે છે; જાણીતાને ફોરવર્ડ કરે છે.
      - *VLANs:* 1 ફિઝિકલ સ્વિચને અનેક L2 બ્રોડકાસ્ટ ડોમેનમાં વહેંચે છે (`1–4094`; Normal `1–1005`, Extended `1006–4094`).
      - *Access Port:* 1 Data VLAN (+ વૈકલ્પિક Voice VLAN) માટે.
      - *802.1Q Trunk:* *4-બાઇટ ટેગ* (`TPID 0x8100` + `12-bit VLAN ID`) ઉમેરીને અનેક VLANs લઈ જાય છે.
      - *Native VLAN (ડિફોલ્ટ 1):* ટ્રંક પર *ટેગ વિના (untagged)* જાય છે. બંને છેડે સરખો હોવો જરૂરી! તેને ખાલી VLAN (જેમ કે `999`) માં બદલો.
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Spanning Tree Protocol (STP 802.1D વિરુદ્ધ RSTP 802.1w)",
    [
      #set text(size: 8.9pt)
      રિડન્ડન્ટ સ્વિચ લૂપ્સમાં L2 બ્રોડકાસ્ટ સ્ટોર્મ અને MAC ફ્લેપિંગ અટકાવે છે.
      1. *1 Root Bridge પસંદ કરો:* સૌથી ઓછું *Bridge ID* (`Priority + MAC`; ડિફોલ્ટ `32768`, સ્ટેપ `4096`).
      2. *Root Port (RP):* દરેક નોન-રૂટ સ્વિચ પર રૂટ સુધીનો શ્રેષ્ઠ રસ્તો (1 પ્રતિ સ્વિચ).
      3. *Designated Port (DP):* દરેક સેગમેન્ટ પર શ્રેષ્ઠ પોર્ટ (રૂટ બ્રિજના બધા પોર્ટ DP હોય છે).
      4. *Blocked / Alternate Port:* બાકીના પોર્ટ્સ લૂપ રોકવા યુઝર ટ્રાફિક બ્લોક કરે છે.
      - *802.1D સ્ટેટ્સ (30–50s):* Blocking → Listening → Learning → Forwarding.
      - *RSTP 802.1w (< 2s):* Discarding → Learning → Forwarding.
      - *PortFast + BPDU Guard:* એક્સેસ પોર્ટ પર તરત લિંક-અપ + અનધિકૃત સ્વિચ પર `err-disable` શટડાઉન!
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
    "EtherChannel (લિંક એગ્રીગેશન — LACP અને PAgP)",
    [
      #set text(size: 8.9pt)
      વધુ બેન્ડવિડ્થ અને રિડન્ડન્સી માટે *8 ફિઝિકલ પોર્ટ્સ* ને 1 લોજિકલ Port-Channel (`Po1`) માં જોડે છે (STP તેને 1 લિંક ગણે છે!).
      #v(4pt)
      #tbl(
        (auto, auto, auto),
        ("પ્રોટોકોલ", "સ્ટાન્ડર્ડ", "મોડ્સ (બંને બાજુ મેચ થવા જોઈએ!)"),
        (
          ([*LACP*], [`802.3ad` (Open)], [`Active` ↔ `Active` કે `Passive`]),
          ([*PAgP*], [Cisco Prop.], [`Desirable` ↔ `Desirable` કે `Auto`]),
          ([*Static*], [કોઈ નેગોશિએશન નહીં], [`On` ↔ `On`]),
        ),
        pad-y: 6pt,
        fsize: 8.9pt
      )
      #v(4pt)
      #set text(size: 8.9pt)
      *ફરજિયાત શરતો:* સરખી સ્પીડ, ડ્યુપ્લેક્સ, નેટિવ/અલાઉડ VLANs અને એક્સેસ/ટ્રંક મોડ.
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "જરૂરી Cisco IOS સ્વિચિંગ કમાન્ડ્સ",
    [
      #set text(size: 8.9pt)
      - VLAN બનાવો: #cmd("vlan 10") → #cmd("name SALES")
      - Access + Voice: #cmd("switchport mode access") / #cmd("switchport access vlan 10") / #cmd("switchport voice vlan 20")
      - Trunk + Native: #cmd("switchport mode trunk") / #cmd("switchport trunk native vlan 999") / #cmd("switchport nonegotiate")
      - Root Primary: #cmd("spanning-tree vlan 10 root primary")
      - PortFast + BPDU: #cmd("spanning-tree portfast") / #cmd("spanning-tree bpduguard enable")
      - LACP બંડલ: #cmd("channel-group 1 mode active")
      - તપાસો: #cmd("show vlan brief") · #cmd("show interfaces trunk") · #cmd("show spanning-tree") · #cmd("show etherchannel summary")
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(18pt)
#card(
  "DTP, VTP, CDP/LLDP અને ઇન્ટર-VLAN રૂટિંગ (ROAS વિરુદ્ધ Layer 3 SVI)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.9pt)
        - *DTP (Dynamic Trunking):* `dynamic auto` + `auto` = Access; `desirable` + `auto` = Trunk. સુરક્ષા માટે હંમેશા `mode trunk` + `nonegotiate` સેટ કરો.
        - *VTP:* VLAN ડેટાબેઝ સિંક કરે છે. અણધાર્યા ફેરફાર ટાળવા `vtp mode transparent` રાખો!
        - *CDP / LLDP:* L2 પાડોશી શોધ (`show cdp neighbors detail`, `lldp run`).
      ],
      [
        #set text(size: 8.9pt)
        - *Router-on-a-Stick (ROAS):* એક ટ્રંક પર સબ-ઇન્ટરફેસ (`g0/0.10`, `encapsulation dot1Q 10`, `ip address ...`).
        - *L3 Switch (SVI):* #cmd("ip routing") + #cmd("interface vlan 10") → વાયર-સ્પીડ ઇન્ટર-VLAN રૂટિંગ!
        - *Err-Disable રિકવરી:* #cmd("errdisable recovery cause bpduguard")
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(18pt)
#did-you-know[STP વિનાના લૂપ્ડ લેયર 2 નેટવર્કમાં એક માત્ર *Broadcast Storm* 1 સેકન્ડથી ઓછા સમયમાં 10 Gbps લિંક્સ અને CPU ને 100% ભરી શકે છે, કારણ કે ઇથરનેટ ફ્રેમમાં *કોઈ TTL ફીલ્ડ હોતું નથી*!]

#pagebreak()

// =========================================================================
// PAGE 9: ROUTING, OSPF, ACLS, NAT, SECURITY & AUTOMATION
// =========================================================================
#section-banner("08", "રૂટિંગ, OSPF, ACLS, NAT, સુરક્ષા અને ઓટોમેશન", "CCNA Domains 3, 4, 5 & 6 · લેયર 3, સર્વિસિસ, વાયરલેસ અને SDN")

#grid(
  columns: (0.95fr, 1.05fr),
  gutter: 6.5pt,
  card(
    "Administrative Distance (AD) અને Longest Prefix Match",
    [
      #tbl(
        (auto, auto, 1fr),
        ("રૂટ સ્રોત", "AD", "મેટ્રિક / પસંદગી નિયમ"),
        (
          ([*Connected (`C`)*], [*0*], [સીધું જોડાયેલ ઇન્ટરફેસ]),
          ([*Static (`S`)*], [*1*], [મેન્યુઅલ નેક્સ્ટ-હોપ / એક્ઝિટ ઇન્ટરફેસ]),
          ([*eBGP*], [*20*], [AS-Path અને BGP ગુણધર્મો (ઇન્ટરનેટ)]),
          ([*EIGRP (Int)*], [*90*], [બેન્ડવિડ્થ + ડિલે (કમ્પોઝિટ)]),
          ([*OSPF (`O`)*], [*110*], [Cost = Ref BW (`100 Mbps`) / Link BW]),
          ([*RIPv2 (`R`)*], [*120*], [હોપ કાઉન્ટ (મહત્તમ 15; 16 = અનરીચેબલ)]),
          ([*Floating Static*], [*111+*], [OSPF થી વધુ AD વાળો બેકઅપ સ્ટેટિક રૂટ]),
        ),
        pad-y: 6.8pt,
        fsize: 8.9pt
      )
      #v(3pt)
      #set text(size: 8.9pt)
      *રૂટિંગ ક્રમ:* 1) *Longest Prefix Match* (`/26` હંમેશા `/24` થી જીતે!) → 2) સૌથી ઓછું *AD* → 3) સૌથી ઓછું *Metric*. \
      *ડિફોલ્ટ રૂટ:* #cmd("ip route 0.0.0.0 0.0.0.0 203.0.113.1")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "OSPFv2 સિંગલ-એરિયા માસ્ટરી અને FHRP",
    [
      #set text(size: 8.9pt)
      - *લિંક-સ્ટેટ પ્રોટોકોલ:* LSDB બનાવે છે → *Dijkstra SPF* અલ્ગોરિધમ ચલાવીને રૂટિંગ ટેબલ બનાવે છે.
      - *Router ID પ્રાથમિકતા:* 1) મેન્યુઅલ `router-id` → 2) સૌથી મોટું Loopback IP → 3) સૌથી મોટું સક્રિય ફિઝિકલ IP.
      - *7 નેબર સ્ટેટ્સ:* `Down` → `Init` → `2-Way` (બ્રોડકાસ્ટ પર *DR/BDR ચૂંટણી!*) → `ExStart` → `Exchange` → `Loading` → `Full`.
      - *ફરજિયાત મેચ:* Area ID, સબનેટ/માસ્ક, Hello/Dead (`10s/40s`), Auth, MTU; Router ID અલગ હોવા જોઈએ!
      - *કમાન્ડ્સ:* #cmd("router ospf 1") → #cmd("router-id 1.1.1.1") → #cmd("network 10.0.0.0 0.0.0.255 area 0") → #cmd("passive-interface g0/0")
      - *તપાસો:* #cmd("show ip ospf neighbor") · #cmd("show ip route ospf")
      - *FHRP (ગેટવે રિડન્ડન્સી):* *HSRP* (Cisco, Active/Standby) vs *VRRP* (Open, Master/Backup).
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
    "IP સર્વિસિસ (DHCP, DNS, NTP, SNMP, Syslog) અને NAT/PAT",
    [
      #set text(size: 8.9pt)
      - *DHCP (DORA):* *D*iscover (Bcast) → *O*ffer → *R*equest → *A*ck. અલગ સબનેટ માટે: #cmd("ip helper-address <DHCP-IP>").
      - *NTP / Syslog / SNMP:* NTP ઘડિયાળ સિંક કરે છે (`Stratum 1–15`). Syslog સ્તર `0–7` (`0` Emergency → `6` Info → `7` Debug). SNMPv3 માં Auth + AES એન્ક્રિપ્શન.
      - *NAT / PAT:* Inside Local (પ્રાઇવેટ) ↔ Inside Global (પબ્લિક).
        - *Static NAT:* 1-થી-1 સર્વર મેપિંગ.
        - *PAT (Overload):* ઘણા પ્રાઇવેટ IP, 1 પબ્લિક IP અને અલગ TCP/UDP પોર્ટ શેર કરે છે: #cmd("ip nat inside source list 1 interface g0/0 overload")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "ACLs, લેયર 2 સુરક્ષા અને નેટવર્ક ઓટોમેશન",
    [
      #set text(size: 8.9pt)
      - *Standard ACL (`1–99`):* માત્ર *Source IP* ફિલ્ટર; *Destination ની નજીક* લગાવો.
      - *Extended ACL (`100–199`):* Src/Dst IP, Proto, પોર્ટ; *Source ની નજીક* લગાવો. અંતે છુપો `deny any` હોય છે!
      - *L2 સુરક્ષા:* *Port Security* (MAC મર્યાદિત કરો), *DHCP Snooping* (`trusted` અપલિંક), *DAI* (ARP સ્પૂફિંગ રોકો).
      - *SSH હાર્ડનિંગ:* `ip domain-name`, `crypto key generate rsa`, `transport input ssh`.
      - *ઓટોમેશન (Domain 6):* *SDN* કંટ્રોલ પ્લેનને ડેટા પ્લેનથી અલગ કરે છે. *REST APIs* (`GET/POST/PUT/DELETE`), *JSON*, *Ansible* (Agentless SSH/YAML), *Puppet/Chef* (Agent-based).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(19pt)
#card(
  "વાયરલેસ 802.11, સુરક્ષા, QoS અને ડેટા ફોર્મેટ્સ (JSON/YAML/XML)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.9pt)
        - *Wi-Fi અને સુરક્ષા:* `802.11ac` (Wi-Fi 5), `802.11ax` (Wi-Fi 6). 2.4 GHz નોન-ઓવરલેપિંગ ચેનલ: *1, 6, 11*. *WPA2* (AES) vs *WPA3* (SAE).
        - *QoS:* વોઇસ/વીડિયોને પ્રાથમિકતા (`DSCP EF 46`, `<150ms` લેટન્સી). *Shaping* બફર કરે છે; *Policing* ડ્રોપ કરે છે.
      ],
      [
        #set text(size: 8.9pt)
        - *ડેટા ફોર્મેટ્સ:* *JSON* (`{"vlan": 10}` REST APIs), *YAML* (Ansible ઇન્ડેન્ટેશન), *XML* (`<vlan>10</vlan>` NETCONF).
        - *તપાસ કમાન્ડ્સ:* #cmd("show access-lists") · #cmd("show ip nat translations") · #cmd("show ip dhcp binding") · #cmd("show port-security")
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(19pt)
#did-you-know[તમે IPv4/IPv6 સબનેટિંગ, CIDR/વાઇલ્ડકાર્ડ ગણતરી અને ઇન્ટરએક્ટિવ નેટવર્કિંગ લેબ્સનો મફત મહાવરો *rtechlab.com/tools* પર કરી શકો છો — ખાસ કરીને CCNA અને Network+ વિદ્યાર્થીઓ માટે બનાવ્યું છે!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "ટોપ 10 CCNA ઇન્ટરવ્યુ પ્રશ્નો અને RTECHLAB લેખક પરિચય", "TAC / NOC ઇન્ટરવ્યુ તૈયારી · પ્રમાણપત્રો, અમારો ધ્યેય અને વોટ્સએપ હેલ્પ ડેસ્ક")

#card(
  "ટોપ 10 CCNA અને નેટવર્કિંગ TAC/NOC ઇન્ટરવ્યુ પ્રશ્ન-જવાબ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.0pt)
        *1. Switch વિરુદ્ધ Router?* Switch 1 નેટવર્કમાં MAC ટેબલથી L2 ફ્રેમ મોકલે છે; Router અલગ નેટવર્ક્સમાં IP રૂટિંગ ટેબલથી L3 પેકેટ મોકલે છે. \
        *2. ARP શું છે?* જાણીતા IPv4 એડ્રેસ પરથી અજાણ્યું MAC એડ્રેસ શોધવાનો પ્રોટોકોલ (Broadcast Request + Unicast Reply). \
        *3. VLANs કેમ વાપરીએ?* બ્રોડકાસ્ટ ડોમેન અલગ કરવા, સુરક્ષા વધારવા અને વિભાગોને લોજિકલ રીતે વહેંચવા માટે. \
        *4. Access વિરુદ્ધ Trunk પોર્ટ?* Access 1 અનટેગ્ડ VLAN લઈ જાય છે; Trunk `802.1Q` 4-બાઇટ ટેગથી અનેક VLANs લઈ જાય છે. \
        *5. STP Root Bridge કેવી રીતે પસંદ કરે છે?* સૌથી ઓછું Bridge ID (`Priority + MAC`); ટાઇ થાય તો સૌથી ઓછું Base MAC.
      ],
      [
        #set text(size: 8.0pt)
        *6. Longest Prefix Match વિરુદ્ધ AD?* રાઉટર હંમેશા સૌથી ચોક્કસ માસ્ક (`/27` વિરુદ્ધ `/24`) પસંદ કરે છે; AD માત્ર *સરખા પ્રિફિક્સ* પર લાગુ પડે છે. \
        *7. OSPF `EXSTART/EXCHANGE` માં કેમ અટકે છે?* બંને છેડે MTU મિસમેચ અથવા ડુપ્લિકેટ Router ID હોય ત્યારે. \
        *8. NAT વિરુદ્ધ PAT?* NAT 1-થી-1 IP મેપ કરે છે; PAT અનેક પ્રાઇવેટ IP ને પોર્ટ નંબરથી 1 પબ્લિક IP પર મેપ કરે છે. \
        *9. `ip helper-address` નું કામ?* ક્લાયન્ટના UDP DHCP Discover બ્રોડકાસ્ટને યુનિકાસ્ટમાં ફેરવીને દૂરના DHCP સર્વરને મોકલવું. \
        *10. IPv6 Link-Local (`FE80::/10`)?* દરેક IPv6 પોર્ટ પર આપમેળે બને છે; લોકલ લિંક, NDP અને રૂટિંગ નેક્સ્ટ-હોપ માટે.
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(13.5pt)

#card(
  "Cisco IOS ઝડપી ડિવાઇસ સુરક્ષા અને દૈનિક કમાન્ડ્સ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.0pt)
        - હોસ્ટનામ અને બેનર: #cmd("hostname R1") · #cmd("banner motd #Authorized Only#")
        - સુરક્ષિત પાસવર્ડ: #cmd("enable secret RTech@2026") · #cmd("service password-encryption")
      ],
      [
        #set text(size: 8.0pt)
        - કન્સોલ ટાઇમઆઉટ: #cmd("exec-timeout 5 0") · #cmd("logging synchronous")
        - DNS લુકઅપ બંધ: #cmd("no ip domain-lookup") · કોન્ફિગ મોડમાં તપાસ: #cmd("do show ip int br")
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
          *પ્રમાણિત અનુભવ અને પરીક્ષાઓ:* #hl-b("CompTIA Network+ Exam Cleared") · #hl-g("Cisco CCNA 200-301 Exam Track") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · ડાયરેક્ટર અને લીડ IT ટ્રેનર, IANT કમ્પ્યુટર એજ્યુકેશન, પાલનપુર · *10+ વર્ષનો અનુભવ · 3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત*.
        ]
        #v(3.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 4pt),
          text(fill: rgb("#fef3c7"), size: 7.5pt)[
            *અમારો RTechLab ધ્યેય (Motto):* _"Technology Made Practical — શીખો, પ્રેક્ટિસ કરો અને જોડાઓ. સાચું નેટવર્કિંગ જ્ઞાન ડમ્પ્સ ગોખવાથી નહીં, પરંતુ વાયર પર પેકેટ્સને સમજવાથી આવે છે. ભારતમાં નિર્મિત જેથી દરેક વિદ્યાર્થીને ₹22 માં ₹2,200 જેવું પ્રીમિયમ જ્ઞાન મળે."_
          ]
        )
      ]
    )
  ]
)

#v(13.5pt)

// 4 SCANNABLE QR CODES
#card(
  "સ્કેન કરો અને RTechLab સાથે જોડાઓ (મફત લેબ્સ, ટૂલ્સ અને અપડેટ્સ)",
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
        #text(size: 8.1pt, weight: "bold", fill: rgb("#0f172a"))[YouTube લેબ્સ] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 6.8pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 31mm)
        #v(2pt)
        #text(size: 8.1pt, weight: "bold", fill: rgb("#0f172a"))[Instagram રીલ્સ] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 6.8pt, fill: rgb("#db2777"))[Daily Tech Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 31mm)
        #v(2pt)
        #text(size: 8.1pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp ચેનલ] \
        #link("https://wa.me/917646892094")[#text(size: 6.8pt, fill: rgb("#16a34a"))[જોબ અને નોટ્સ એલર્ટ]]
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
      #text(size: 8.8pt, weight: "bold", fill: rgb("#14532d"))[RTechLab વિદ્યાર્થી હેલ્પ ડેસ્ક અને કરિયર માર્ગદર્શન] \
      #text(size: 8.1pt, fill: rgb("#166534"))[Subnetting, Packet Tracer કે CCNA/Network+ ની તૈયારીમાં ક્યાંય અટવાયા છો? સીધું WhatsApp પર પૂછો!]
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
