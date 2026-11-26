#set document(
  title: "RTechLab — Cisco CCNA 200-301 & Networking Quick Desk Cheat Sheet (English)",
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
      #set text(size: 7.2pt, fill: rgb("#475569"), font: "Segoe UI")
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
          #text(fill: rgb("#64748b"))[ · 10-Page Quick Desk Reference (English)]
        ],
        [
          #text(fill: rgb("#0284c7"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 Desk Edition]
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
      #set text(size: 7pt, fill: rgb("#64748b"), font: "Segoe UI")
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [© RTechLab Original Edition · Learn · Practice · Connect · Free Subnetting & CLI Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[Page #p of 10]]]
      )
    ]
  }
)

#set text(font: "Segoe UI", size: 9.3pt, fill: rgb("#1e293b"))
#set par(leading: 0.68em, justify: false)

// --- HELPER COMPONENTS ---
#let section-banner(num, title, subtitle, bg: rgb("#0f172a"), accent: rgb("#0284c7")) = {
  box(
    width: 100%,
    fill: bg,
    radius: 3.5pt,
    inset: (x: 9pt, y: 6.5pt),
    stroke: (left: 4.5pt + accent),
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      gutter: 7pt,
      box(fill: accent, radius: 2.5pt, inset: (x: 6pt, y: 3pt))[
        #text(fill: white, weight: "bold", size: 9pt)[#num]
      ],
      text(fill: white, weight: "bold", size: 10.8pt)[#title],
      text(fill: rgb("#93c5fd"), size: 8pt, weight: "semibold")[#subtitle]
    )
  )
  v(7.5pt)
}

#let card(title, body, border: rgb("#cbd5e1"), head-bg: rgb("#f8fafc"), title-color: rgb("#0f172a"), pad: 8.5pt) = {
  box(
    width: 100%,
    fill: white,
    stroke: 0.65pt + border,
    radius: 4pt,
    [
      #box(
        width: 100%,
        fill: head-bg,
        inset: (x: 8pt, y: 5pt),
        stroke: (bottom: 0.5pt + border),
        radius: (top: 4pt),
        text(weight: "bold", size: 9.1pt, fill: title-color)[#title]
      )
      #box(width: 100%, inset: pad)[#body]
    ]
  )
}

#let cmd(code) = {
  box(
    fill: rgb("#0f172a"),
    inset: (x: 4.5pt, y: 2.2pt),
    radius: 2pt,
    text(font: "Consolas", size: 8pt, fill: rgb("#38bdf8"))[#code]
  )
}

#let hl-y(t) = box(fill: rgb("#fef08a"), inset: (x: 3pt, y: 1pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#713f12"))[#t])
#let hl-g(t) = box(fill: rgb("#dcfce7"), inset: (x: 3pt, y: 1pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#14532d"))[#t])
#let hl-b(t) = box(fill: rgb("#dbeafe"), inset: (x: 3pt, y: 1pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#1e3a8a"))[#t])
#let hl-r(t) = box(fill: rgb("#fee2e2"), inset: (x: 3pt, y: 1pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#7f1d1d"))[#t])

#let did-you-know(fact) = {
  box(
    width: 100%,
    fill: rgb("#fffbeb"),
    stroke: (left: 4pt + rgb("#f59e0b"), rest: 0.6pt + rgb("#fde68a")),
    radius: 3.5pt,
    inset: (x: 9pt, y: 7pt),
    text(size: 8.6pt, fill: rgb("#78350f"))[
      *💡 Did You Know?* #fact
    ]
  )
}

#let tbl(cols, headers, rows, pad-y: 5pt, fsize: 8.4pt) = {
  set text(size: fsize)
  table(
    columns: cols,
    inset: (x: 5pt, y: pad-y),
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
// PAGE 2: NETWORK TYPES, TOPOLOGIES & ENTERPRISE ARCHITECTURE
// =========================================================================
#section-banner("01", "NETWORK TYPES, TOPOLOGIES & ARCHITECTURES", "CCNA 200-301 Domain 1.0 · Network Fundamentals")

#grid(
  columns: (1.18fr, 0.82fr),
  gutter: 6.5pt,
  card(
    "Types of Networks by Scale, Scope & Purpose",
    tbl(
      (auto, auto, 1fr, auto),
      ("Type", "Full Name", "Scope, Media & Typical Use Case", "Range"),
      (
        ([*PAN*], [Personal Area], [Bluetooth, Zigbee, NFC, USB; smartwatch, earbuds, laptop], [1–10 m]),
        ([*LAN*], [Local Area], [Ethernet (`802.3`) & Switch; single office, home, school lab], [Up to 100 m]),
        ([*WLAN*], [Wireless LAN], [Wi-Fi (`802.11ax/be`) via Access Points & WLC], [30–100 m]),
        ([*CAN*], [Campus Area], [Interconnected building LANs via fiber backbone; universities], [1–5 km]),
        ([*MAN*], [Metro Area], [High-speed Metro Ethernet / Fiber rings across a city], [5–50 km]),
        ([*WAN*], [Wide Area], [Leased lines, MPLS, Broadband, 5G connecting branches globally], [50+ km]),
        ([*SAN*], [Storage Area], [Fibre Channel / iSCSI dedicated block storage for servers], [Data Center]),
        ([*VPN*], [Virtual Private], [Encrypted tunnel (`IPsec` / `SSL` / `WireGuard`) over public WAN], [Global]),
        ([*SD-WAN*], [Software-Defined WAN], [Centralized controller steers traffic across MPLS, ISP, LTE], [Multi-Site]),
      ),
      pad-y: 4.1pt,
      fsize: 7.8pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Physical & Logical Topologies Visual",
    [
      #align(center)[#image("02_BRAND_ASSETS/ccna_topology_visual.png", width: 100%)]
      #v(6pt)
      #set text(size: 7.9pt)
      - *Star / Hub-Spoke:* All hosts connect to central Switch. Easy fault isolation; central switch = single point of failure.
      - *Full Mesh:* Every node connects to every node. Links = $n(n-1)/2$. Max redundancy, high cabling/WAN cost.
      - *Partial Mesh:* Core/HQ WAN sites fully meshed; branch sites dual-homed.
      - *Spine-Leaf (Data Center):* Every Leaf connects to every Spine — predictable low latency & ECMP load balancing.
      - *Three-Tier Campus:* *Core* (high-speed L3) → *Distribution* (policy/routing) → *Access* (user ports, PoE).
      - *Two-Tier (Collapsed Core):* Core + Distribution merged into one L3 switch pair for SMBs.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(6.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "Transmission Modes & Switching Methods",
    [
      #tbl(
        (auto, 1fr),
        ("Mode / Method", "Behavior & CCNA Exam Key Fact"),
        (
          ([*Simplex*], [One-way only (TV broadcast, keyboard). Zero return path.]),
          ([*Half-Duplex*], [Two-way, one at a time. Uses *CSMA/CD* (Hubs). Collisions possible.]),
          ([*Full-Duplex*], [Simultaneous Tx & Rx on separate pairs. *Switches*; 0 collisions.]),
          ([*Unicast*], [1-to-1 communication (specific MAC/IP).]),
          ([*Broadcast*], [1-to-All in subnet (`FF:FF:FF:FF:FF:FF`, `255.255.255.255`).]),
          ([*Multicast*], [1-to-Group (`224.0.0.0–239.255.255.255`, OSPF `224.0.0.5`).]),
          ([*Anycast*], [1-to-Nearest (IPv6 / DNS root servers sharing same IP).]),
        ),
        pad-y: 4.1pt,
        fsize: 7.8pt
      )
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "Collision Domain vs Broadcast Domain",
    [
      #tbl(
        (auto, auto, auto),
        ("Device", "Collision Domains", "Broadcast Domains"),
        (
          ([*Hub / Repeater (L1)*], [1 shared domain], [1 shared domain]),
          ([*Bridge / L2 Switch*], [*1 per switch port*], [1 (unless VLANs used)]),
          ([*L2 Switch + VLANs*], [1 per switch port], [*1 per VLAN*]),
          ([*Router / L3 Switch*], [1 per interface], [*1 per interface / SVI*]),
        ),
        pad-y: 4.1pt,
        fsize: 7.8pt
      )
      #v(6pt)
      #set text(size: 7.9pt)
      - *CSMA/CD (Ethernet Half-Duplex):* Listen before send; if collision occurs, send jam signal + random backoff.
      - *CSMA/CA (Wi-Fi `802.11`):* Avoids collisions using RTS/CTS & ACK frames.
      - *Store-and-Forward vs Cut-Through:* Store-and-Forward checks FCS (CRC) before forwarding; Cut-Through forwards after Dest MAC.
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(6.5pt)
#card(
  "WAN Technologies, SOHO vs Enterprise & Cloud Virtualization",
  [
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 7.9pt)
        *WAN Connectivity:* *MPLS* (label-switched private WAN), *Metro Ethernet* (fiber L2/L3), *PPPoE/DOCSIS* (broadband), *GRE* (unencrypted tunnel), *IPsec* (encrypted VPN).
      ],
      [
        #set text(size: 7.9pt)
        *SOHO vs Enterprise:* SOHO combines Modem, Router, 4-port Switch, NAT/FW & Wi-Fi in 1 box. Enterprise separates ISP Router → NGFW → L3 Core → L2 Access + WLC.
      ],
      [
        #set text(size: 7.9pt)
        *Virtualization & Cloud:* *Type 1 Hypervisor* (ESXi, KVM, Hyper-V) runs on bare metal; *vSwitch* bridges VMs to NICs (`IaaS`, `PaaS`, `SaaS`, Direct Connect).
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(6.5pt)
#did-you-know[In a *Full Mesh* WAN of 10 sites, you need $10 times 9 / 2 = 45$ links! Adding just 1 more site requires 10 new links — which is why enterprises use *Partial Mesh* or *SD-WAN* overlays to cut WAN costs by 40–70%.]

#pagebreak()

// =========================================================================
// PAGE 3: NETWORK DEVICES, CABLES, FIBER & HARDWARE PORTS
// =========================================================================
#section-banner("02", "NETWORK DEVICES, CABLES, FIBER OPTICS & POE", "Hardware Layer · L1–L7 Appliances, Cabling & Boot Sequence")

#card(
  "Complete Network Devices Reference (Layer 1 to Layer 7)",
  tbl(
    (auto, auto, 1fr, auto),
    ("Device", "OSI", "Core Function, Forwarding Table & Real-World Role", "Key Exam Fact"),
    (
      ([*Repeater / Hub*], [L1], [Regenerates/broadcasts electrical bits to all ports; no intelligence], [Half-duplex; 1 collision domain]),
      ([*Media Converter*], [L1], [Converts copper Ethernet (`RJ-45`) to fiber optic (`SFP/LC`)], [Extends reach beyond 100 m]),
      ([*Bridge*], [L2], [Software-based 2–4 port frame forwarder using MAC table], [Replaced by hardware ASIC Switches]),
      ([*L2 Switch*], [L2], [Forwards frames via *CAM / MAC Address Table* using ASICs], [Breaks collision domains; VLANs]),
      ([*L3 Multilayer Switch*], [L2/L3], [Hardware-rate switching + inter-VLAN routing via *SVIs* & *CEF*], [Routing at wire speed]),
      ([*Router*], [L3], [Connects different IP networks using *Routing Table*; drops broadcasts], [Breaks broadcast domains]),
      ([*Firewall (Stateful/NGFW)*], [L3–L7], [Inspects connections, zones, App-ID, IPS, URL filtering], [Default-deny outside-to-inside]),
      ([*IDS / IPS*], [L3–L7], [*IDS* = passive copy (SPAN/TAP) alerts; *IPS* = inline active drop], [Signature & anomaly detection]),
      ([*Access Point (AP)*], [L1/L2], [Bridges wireless `802.11` frames to wired `802.3` Ethernet], [Autonomous vs CAPWAP Lightweight]),
      ([*WLC (Controller)*], [L2–L7], [Centralizes config, RF channels, roaming for Lightweight APs], [Uses CAPWAP UDP `5246/5247`]),
      ([*Modem / ONT*], [L1], [Modulates/demodulates digital bits over coax/DSL/fiber ISP lines], [DOCSIS / PPPoE / GPON ONT]),
      ([*Load Balancer / Proxy*], [L4–L7], [Distributes client requests across server pools; SSL offload], [Health checks & HA VIPs]),
    ),
    pad-y: 4.9pt,
    fsize: 7.7pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(8.5pt)

#grid(
  columns: (1.12fr, 0.88fr),
  gutter: 6.5pt,
  card(
    "Twisted-Pair Copper (UTP/STP) & Pinouts",
    [
      #tbl(
        (auto, auto, auto, auto),
        ("Category", "Max Speed", "Bandwidth", "Max Distance"),
        (
          ([*Cat 5e*], [1 Gbps (1000BASE-T)], [100 MHz], [100 m]),
          ([*Cat 6*], [10G (55m) / 1G (100m)], [250 MHz], [55 m / 100 m]),
          ([*Cat 6a*], [10 Gbps (10GBASE-T)], [500 MHz], [100 m]),
          ([*Cat 7 / 8*], [10G / 40 Gbps (DC)], [600 / 2000 MHz], [100 m / 30 m]),
        ),
        pad-y: 4.9pt,
        fsize: 7.7pt
      )
      #v(8.5pt)
      #set text(size: 7.8pt)
      - *T568B (Most Common):* `1:W-O, 2:O, 3:W-G, 4:B, 5:W-B, 6:G, 7:W-Br, 8:Br`
      - *T568A:* Swaps Orange & Green (`1:W-G, 2:G, 3:W-O, 6:O`).
      - *Straight-Through:* Unlike devices (PC ↔ Switch, Switch ↔ Router).
      - *Crossover:* Like devices (Switch ↔ Switch). *Auto-MDIX* auto-fixes on modern ports!
      - *Rollover (Console):* Pins 1–8 reversed (`9600 bps, 8N1`).
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "Fiber Optic Cables (SMF vs MMF) & SFP",
    [
      #tbl(
        (auto, 1fr, 1fr),
        ("Feature", "Single-Mode (SMF)", "Multimode (MMF)"),
        (
          ([*Core Size*], [8.3–10 µm (tiny)], [50 or 62.5 µm (wider)]),
          ([*Light*], [Laser (1310 / 1550 nm)], [LED / VCSEL (850 nm)]),
          ([*Jacket*], [Yellow], [Orange (OM1/2) · Aqua (OM3/4)]),
          ([*Reach*], [10–80+ km (WAN/CAN)], [300–550 m (LAN/DC)]),
          ([*Cost*], [High optics, low cable], [Low optics, short run]),
        ),
        pad-y: 4.9pt,
        fsize: 7.7pt
      )
      #v(8.5pt)
      #set text(size: 7.8pt)
      - *Transceivers:* `SFP` (1G), `SFP+` (10G), `SFP28` (25G), `QSFP+` (40G), `QSFP28` (100G).
      - *Connectors:* `LC` (small duplex), `SC` (push-pull), `ST` (bayonet).
      - *1000BASE-SX* = MMF (550 m) · *1000BASE-LX* = SMF (5–10 km).
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(8.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "Power over Ethernet (PoE) & Physical Errors",
    [
      #tbl(
        (auto, auto, auto, auto),
        ("Standard", "IEEE", "PSE Max", "PD Delivered"),
        (
          ([*PoE*], [`802.3af`], [15.4 W], [12.95 W (IP Phones)]),
          ([*PoE+*], [`802.3at`], [30.0 W], [25.5 W (Wi-Fi 6 AP)]),
          ([*PoE++*], [`802.3bt`], [60 / 90 W], [51 / 71.3 W (PTZ/Thin)]),
        ),
        pad-y: 4.9pt,
        fsize: 7.7pt
      )
      #v(5pt)
      #set text(size: 7.8pt)
      *Counters* (#cmd("show int g0/1")): *Runts* (`<64B` collision), *Giants* (`>1518B` MTU), *CRC* (bad cable/duplex mismatch).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "Cisco IOS Memory & Boot Sequence",
    [
      #set text(size: 7.8pt)
      - *Memory Types:* *ROM* (POST + Bootstrap), *Flash* (IOS `.bin` image), *NVRAM* (`startup-config`), *RAM* (`running-config`, MAC/Routing tables).
      - *Boot Order:* `POST` → `Bootstrap` → Load IOS from `Flash` → Load `startup-config` from `NVRAM` into `RAM`.
      - *Config Register:* `0x2102` (normal boot) · `0x2142` (bypass NVRAM for password recovery!).
      - *Save Config:* #cmd("copy running-config startup-config") or #cmd("wr")
    ],
    head-bg: rgb("#f1f5f9"),
    title-color: rgb("#0f172a")
  )
)

#v(8.5pt)
#did-you-know[Never look directly into an active fiber optic cable or SFP port! Single-mode lasers operate at *1310 nm / 1550 nm* (invisible infrared) and can permanently damage your retina without any visible light warning.]

#pagebreak()

// =========================================================================
// PAGE 4: OSI MODEL, TCP/IP, ENCAPSULATION & PORTS
// =========================================================================
#section-banner("03", "OSI 7-LAYER MODEL, TCP/IP, ENCAPSULATION & PORTS", "Protocol Stack · PDUs, TCP Handshake, Ports & Wireshark")

#grid(
  columns: (0.95fr, 1.05fr),
  gutter: 6.5pt,
  card(
    "OSI vs TCP/IP Visual & Encapsulation Flow",
    [
      #align(center)[#image("02_BRAND_ASSETS/ccna_osi_visual.png", width: 100%)]
      #v(6pt)
      #set text(size: 8.4pt)
      #strong[Mnemonic (7 → 1):] All People Seem To Need Data Processing. \
      #strong[Encapsulation (Top → Down):] Data → #strong[Segment] (+TCP/UDP Port) → #strong[Packet] (+Src/Dst IP) → #strong[Frame] (+Src/Dst MAC + FCS) → #strong[Bits] (Wire). \
      #strong[De-encapsulation (Bottom → Up):] Receiving NIC checks FCS & Dest MAC, strips L2, Router checks Dest IP, Host checks Dest Port.
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "OSI 7 Layers Deep-Dive Table",
    tbl(
      (auto, auto, auto, 1fr),
      ("L", "Layer", "PDU", "Protocols, Hardware & Troubleshooting"),
      (
        ([*7*], [Application], [Data], [HTTP/S, DNS, DHCP, SSH, SMTP, SNMP, FTP]),
        ([*6*], [Presentation], [Data], [TLS/SSL encryption, JPEG, ASCII, UTF-8, Gzip]),
        ([*5*], [Session], [Data], [Dialog control, RPC, NetBIOS, SQL sessions]),
        ([*4*], [Transport], [Segment], [TCP (reliable) & UDP (fast); Port numbers `0–65535`]),
        ([*3*], [Network], [Packet], [IPv4, IPv6, ICMP, OSPF, EIGRP, Router]),
        ([*2*], [Data Link], [Frame], [Ethernet `802.3`, `802.11`, VLAN `802.1Q`, MAC, Switch]),
        ([*1*], [Physical], [Bits], [Cat6, Fiber, SFP, Voltages, Hub, Repeater]),
      ),
      pad-y: 5.4pt,
      fsize: 8.4pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(9pt)

#grid(
  columns: (0.92fr, 1.08fr),
  gutter: 6.5pt,
  card(
    "TCP vs UDP & 3-Way Handshake",
    [
      #tbl(
        (auto, 1fr, 1fr),
        ("Feature", "TCP (Reliable)", "UDP (Fast)"),
        (
          ([*Connection*], [Connection-oriented (SYN/ACK)], [Connectionless]),
          ([*Reliability*], [ACKs, Retransmit, Windowing], [Best-effort, no ACKs]),
          ([*Header*], [20–60 bytes], [8 bytes (low overhead)]),
          ([*Use Cases*], [HTTP/S, SSH, FTP, SMTP, BGP], [DNS, DHCP, TFTP, VoIP]),
        ),
        pad-y: 5.5pt,
        fsize: 8.4pt
      )
      #v(6pt)
      #set text(size: 8.4pt)
      *TCP 3-Way Handshake:* Client `SYN` → Server `SYN-ACK` → Client `ACK`. \
      *TCP Teardown:* `FIN` → `ACK` → `FIN` → `ACK` (or `RST` for immediate abort). \
      *Port Ranges:* Well-Known (`0–1023`), Registered (`1024–49151`), Dynamic (`49152–65535`).
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "Must-Know TCP & UDP Ports (CCNA Exam Gold)",
    tbl(
      (auto, auto, auto, auto, auto, auto),
      ("Port", "Proto", "Service", "Port", "Proto", "Service"),
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
      pad-y: 5.5pt,
      fsize: 8.3pt
    ),
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(9pt)
#card(
  "Ethernet II Frame, ARP & Troubleshooting Methodology (Wireshark)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.4pt)
        *Ethernet Frame (64–1518B):* `Preamble (7B)` + `SFD (1B)` | *Dest MAC (6B)* | *Src MAC (6B)* | *802.1Q (4B)* | *EtherType (2B)* (`0x0800` IPv4, `0x86DD` IPv6, `0x0806` ARP) | *Data (46–1500B)* | *FCS (4B)*. \
        *ARP:* Broadcast `ARP Request` (`FF:FF:FF:FF:FF:FF`) → Unicast `ARP Reply`. View: #cmd("show arp") / `arp -a`.
      ],
      [
        #set text(size: 8.4pt)
        *OSI Troubleshooting Approaches:*
        - *Bottom-Up (L1 → L7):* Check cable/link LED → L2 VLAN/MAC → L3 IP/Ping → L4 Port → L7 App.
        - *Top-Down (L7 → L1):* Test browser/DNS first.
        - *Wireshark Filters:* `ip.addr == 10.1.1.5`, `tcp.port == 443`, `icmp`, `arp`, `dns`, `tcp.flags.syn == 1`.
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(9pt)
#did-you-know[Port `53` uses *UDP* for fast standard DNS lookups (`< 512 bytes`), but switches to *TCP* for DNS Zone Transfers (`AXFR`) between primary & secondary DNS servers or large DNSSEC responses!]

#pagebreak()

// =========================================================================
// PAGE 5: IPV4 ADDRESSING, BINARY, CLASSES & SPECIAL RANGES
// =========================================================================
#section-banner("04", "IPV4 ADDRESSING, BINARY MATH & SPECIAL RANGES", "32-Bit Dotted Decimal · Classes, RFC 1918, APIPA & IOS Verification")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IPv4 Classes (Classful Legacy) & Default Masks",
    tbl(
      (auto, auto, auto, 1fr),
      ("Class", "1st Octet", "Default Mask", "Primary Usage & Notes"),
      (
        ([*A*], [`1–126`], [`255.0.0.0` (`/8`)], [Huge networks; 16.7M hosts/net]),
        ([*Loop*], [`127`], [`255.0.0.0` (`/8`)], [`127.0.0.1` local TCP/IP stack test]),
        ([*B*], [`128–191`], [`255.255.0.0` (`/16`)], [Medium-large orgs; 65,534 hosts/net]),
        ([*C*], [`192–223`], [`255.255.255.0` (`/24`)], [Small LANs; 254 hosts/net]),
        ([*D*], [`224–239`], [N/A (Multicast)], [OSPF `224.0.0.5/6`, EIGRP `.10`, HSRP `.2`]),
        ([*E*], [`240–255`], [N/A (Reserved)], [Experimental & research]),
      ),
      pad-y: 4.5pt,
      fsize: 7.8pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Private IPv4 (RFC 1918) & Special Reserved Ranges",
    tbl(
      (auto, auto, 1fr),
      ("Range Name", "CIDR / Range", "Purpose & Behavior"),
      (
        ([*RFC 1918 Cl A*], [`10.0.0.0/8`], [`10.0.0.0 – 10.255.255.255` (16.7M IPs)]),
        ([*RFC 1918 Cl B*], [`172.16.0.0/12`], [`172.16.0.0 – 172.31.255.255` (1.04M IPs)]),
        ([*RFC 1918 Cl C*], [`192.168.0.0/16`], [`192.168.0.0 – 192.168.255.255` (65K IPs)]),
        ([*APIPA (Link-Loc)*], [`169.254.0.0/16`], [Self-assigned when DHCP server unreachable]),
        ([*CGNAT (RFC 6598)*], [`100.64.0.0/10`], [ISP Carrier-Grade NAT shared address space]),
        ([*Limited Bcast*], [`255.255.255.255`], [Local LAN broadcast (DHCP Discover)]),
      ),
      pad-y: 4.5pt,
      fsize: 7.8pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(10.5pt)

#card(
  "8-Bit Binary Power Table & Instant Decimal ↔ Binary Conversion",
  [
    #tbl(
      (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.35fr),
      ("Bit 7 ($2^7$)", "Bit 6 ($2^6$)", "Bit 5 ($2^5$)", "Bit 4 ($2^4$)", "Bit 3 ($2^3$)", "Bit 2 ($2^2$)", "Bit 1 ($2^1$)", "Bit 0 ($2^0$)", "Valid Mask Octets"),
      (
        ([*128*], [*64*], [*32*], [*16*], [*8*], [*4*], [*2*], [*1*], [`128, 192, 224, 240, 248, 252, 254, 255`]),
      ),
      pad-y: 4.5pt,
      fsize: 8.3pt
    )
    #v(10.5pt)
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.2pt)
        *Example: `192` → Binary:* `128 + 64 = 192` → `11000000`. \
        *Example: `172` → Binary:* `128 + 32 + 8 + 4 = 172` → `10101100`. \
        *Example: `224` → Binary:* `128 + 64 + 32 = 224` → `11100000` (3 network bits).
      ],
      [
        #set text(size: 8.2pt)
        *Golden Rules:*
        - Network Bits = `1`s in Subnet Mask · Host Bits ($h$) = `0`s in Subnet Mask.
        - Usable Hosts per Subnet = $2^h - 2$ (subtract Network ID & Broadcast).
        - Number of Subnets = $2^s$ (where $s$ = borrowed network bits).
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(10.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IPv4 Packet Header (20 Bytes) & ICMP Essentials",
    [
      #set text(size: 8.2pt)
      - *Key Fields:* Version (`4`), IHL, DSCP/ECN (QoS), Total Length, ID/Flags/Fragment Offset, *TTL* (decremented by 1 per hop; drops at `0` with ICMP Time Exceeded), *Protocol* (`1`=ICMP, `6`=TCP, `17`=UDP, `89`=OSPF), Checksum, Src IP, Dst IP.
      - *ICMP Types:* Type `8` Echo Request, Type `0` Echo Reply, Type `3` Dest Unreachable, Type `11` Time Exceeded (`traceroute`).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "ANDing Operation & Network vs Host ID",
    [
      #set text(size: 8.2pt)
      Routers perform bitwise *AND* (`IP AND Mask`) to find the Network ID:
      - IP: `192.168.10.75` (`01001011`)
      - Mask: `255.255.255.224` (`11100000`)
      - *Result:* `192.168.10.64` (`01000000` = Network ID)
      - *Broadcast:* `192.168.10.95` · *Usable:* `.65 – .94` (`30` hosts).
    ],
    head-bg: rgb("#f1f5f9"),
    title-color: rgb("#0f172a")
  )
)

#v(10.5pt)
#card(
  "Cisco IOS Interface IPv4 Configuration & Connectivity Checklist",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.2pt)
        - Assign Static IP: #cmd("int g0/0") → #cmd("ip address 10.1.1.1 255.255.255.0") → #cmd("no shutdown")
        - DHCP Client on WAN: #cmd("ip address dhcp")
        - Verify Status: #cmd("show ip interface brief") (`up/up` = L1 & L2 OK; `administratively down` = forgot `no shut`).
      ],
      [
        #set text(size: 8.2pt)
        - *5-Step Ping Check:* 1) `ping 127.0.0.1` (TCP/IP stack) → 2) `ping <own IP>` (NIC) → 3) `ping <Default GW>` (LAN/VLAN) → 4) `ping 8.8.8.8` (Routing/NAT) → 5) `ping google.com` (DNS).
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(10.5pt)
#did-you-know[RFC 3021 allows `/31` (`255.255.255.254`) subnets on *point-to-point router links*! Even though $2^1 - 2 = 0$, both IPs are usable on a P2P serial/Ethernet link, saving 50% of WAN IPv4 space compared to `/30`.]

#pagebreak()

// =========================================================================
// PAGE 6: IPV4 SUBNETTING MASTER CHART & VLSM SHORTCUTS
// =========================================================================
#section-banner("05", "IPV4 SUBNETTING MASTER CHART & VLSM", "30-Second Exam Subnetting · /16 to /32, Block Size & Solved Drills")

#card(
  "Complete IPv4 CIDR / Subnetting Master Cheat Sheet (/24–/32 & /16–/23)",
  tbl(
    (auto, auto, auto, auto, auto, auto, auto),
    ("CIDR", "Subnet Mask", "Wildcard Mask", "Block Size", "Subnets", "Total IPs", "Usable Hosts"),
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
    pad-y: 6.4pt,
    fsize: 8.4pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(12pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "30-Second Subnetting Method (Magic Number)",
    [
      #set text(size: 8.4pt)
      *Problem:* Find Network, Broadcast, First & Last Host for `172.16.45.138/27`.
      1. *Interesting Octet:* `/27` is in 4th octet (`255.255.255.224`).
      2. *Magic Number (Block Size):* `256 - 224 = 32`.
      3. *Multiples of 32:* `0, 32, 64, 96, 128, 160...`
      4. *Locate `138`:* Falls between `128` and `160`.
      5. *Network ID:* `172.16.45.128` · *Next Subnet:* `.160`
      6. *Broadcast ID:* `160 - 1` = `172.16.45.159`
      7. *Usable Range:* `172.16.45.129` – `172.16.45.158` (30 hosts).
      *Wildcard Shortcut:* `255.255.255.255 - Mask = Wildcard` (`0` = match, `1` = ignore).
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "VLSM (Variable Length Subnet Mask) Step-by-Step",
    [
      #set text(size: 8.4pt)
      *Rule:* Always allocate from *LARGEST host requirement to SMALLEST* to avoid overlaps!
      *Example:* Given `192.168.10.0/24` for 3 LANs + 1 WAN:
      - *LAN-A (100 hosts):* Needs `/25` (126 usable) → `192.168.10.0/25` (`.0–.127`)
      - *LAN-B (50 hosts):* Needs `/26` (62 usable) → `192.168.10.128/26` (`.128–.191`)
      - *LAN-C (20 hosts):* Needs `/27` (30 usable) → `192.168.10.192/27` (`.192–.223`)
      - *WAN P2P (2 hosts):* Needs `/30` (2 usable) → `192.168.10.224/30` (`.224–.227`)
      *Route Summarization:* Find common prefix bits of contiguous subnets (e.g. `.0/24` to `.3/24` → `192.168.0.0/22`).
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(12pt)
#card(
  "4 Solved CCNA Exam Subnetting Drills (Instant Pattern Recognition)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.4pt)
        - *Drill 1 (3rd-Octet `/21`):* What is the subnet & broadcast of `10.50.19.42/21`? Mask `255.255.248.0`, Block Size `8` in 3rd octet (`0, 8, 16, 24`). `19` is in `16–23`. *Net:* `10.50.16.0`, *Bcast:* `10.50.23.255`.
        - *Drill 2 (Need 500 Hosts):* What CIDR fits 500 hosts? `/24` = 254 (too small), `/23` = 510 usable! Pick `/23` (`255.255.254.0`).
      ],
      [
        #set text(size: 8.4pt)
        - *Drill 3 (Same Subnet Check):* Are `192.168.5.60/26` and `192.168.5.70/26` in same LAN? Block `64`: `.60` is in `0–63`, `.70` is in `64–127`. *NO* — they need a Router!
        - *Drill 4 (Wildcard for ACL):* Match `10.20.16.0/22`: Mask `255.255.252.0` → Wildcard `0.0.3.255`.
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(12pt)
#did-you-know[In CCNA exams, if you need *60 hosts*, don't pick `/27` (30 hosts) — pick `/26` (62 usable hosts). Always remember to subtract 2 for Network & Broadcast IDs unless it is a `/31` P2P link!]

#pagebreak()

// =========================================================================
// PAGE 7: IPV6 COMPLETE MASTERY
// =========================================================================
#section-banner("06", "IPV6 COMPLETE MASTERY (128-BIT ARCHITECTURE)", "Hexadecimal, Zero Compression, Address Types, EUI-64 & SLAAC")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IPv6 Format & Zero Compression Rules",
    [
      #set text(size: 7.7pt)
      - *128-bit Hexadecimal:* 8 groups (hextets) of 4 hex digits separated by colons (`:`). Each hex digit = 4 bits (`0–9, A–F`).
      - *Total Addresses:* $2^(128) approx 3.4 times 10^(38)$ (eliminates NAT!).
      - *Rule 1 (Omit Leading Zeros):* `0db8` → `db8`, `0000` → `0`.
      - *Rule 2 (Double Colon `::`):* Replace consecutive all-zero hextets with `::` (*ONLY ONCE* per address!).
      - *Example:* `2001:0db8:0000:0000:0000:0000:0000:0001` → `2001:db8::1`
      - *IPv6 Subnetting:* Standard LAN prefix is `/64` (64-bit Network + 64-bit Interface ID). ISPs assign `/48` or `/56` to sites (65,536 or 256 `/64` LANs).
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "IPv6 Address Types & Reserved Prefixes",
    tbl(
      (auto, auto, 1fr),
      ("Address Type", "Prefix", "Scope & Exam Key Fact"),
      (
        ([*Global Unicast (GUA)*], [`2000::/3`], [Publicly routable internet IPv6 (`2001:...`, `2606:...`)]),
        ([*Unique Local (ULA)*], [`FC00::/7`], [Private internal IPv6 (`FD00::/8` locally generated)]),
        ([*Link-Local (LLA)*], [`FE80::/10`], [Auto-configured on every IPv6 interface; non-routable]),
        ([*Multicast*], [`FF00::/8`], [`FF02::1` All Nodes, `FF02::2` All Routers, `::5/6` OSPFv3]),
        ([*Loopback*], [`::1/128`], [Equivalent to IPv4 `127.0.0.1`]),
        ([*Unspecified*], [`::/128`], [Equivalent to `0.0.0.0` (used during DAD/DHCPv6)]),
        ([*Default Route*], [`::/0`], [Equivalent to `0.0.0.0/0`]),
      ),
      pad-y: 3.3pt,
      fsize: 7.6pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(9.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "EUI-64 Interface ID (48-bit MAC → 64-bit IID)",
    [
      #set text(size: 7.7pt)
      Given MAC `001A.2B3C.4D5E`:
      1. Split MAC in half: `001A:2B` and `3C:4D5E`.
      2. Insert `FFFE` in middle: `001A:2BFF:FE3C:4D5E`.
      3. Flip the *7th bit* (U/L bit) of first byte: `00` (`0000 0000`) → `02` (`0000 0010`).
      4. *Result:* `021A:2BFF:FE3C:4D5E` (e.g. `FE80::021A:2BFF:FE3C:4D5E`).
      *IOS Command:* #cmd("ipv6 address 2001:db8:1::/64 eui-64")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "SLAAC, NDP & DHCPv6 (No Broadcasts in IPv6!)",
    [
      #set text(size: 7.7pt)
      - *NDP (Neighbor Discovery — ICMPv6):* Replaces ARP!
        - *RS (Type 133):* Host asks routers for prefix (`FF02::2`).
        - *RA (Type 134):* Router replies with `/64` prefix + default gateway.
        - *NS / NA (135/136):* Resolves IPv6 → MAC & runs *DAD* (Duplicate Address Detection).
      - *SLAAC:* Host auto-builds GUA from RA prefix + EUI-64/random IID.
      - *Stateless DHCPv6:* SLAAC gives IP; DHCPv6 gives DNS (`O` flag).
      - *Stateful DHCPv6:* DHCPv6 gives IP + DNS (`M` flag).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(9.5pt)
#card(
  "IPv6 Routing, Transition Mechanisms & Cisco IOS Commands",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 7.4pt)
        - Enable IPv6 routing: #cmd("ipv6 unicast-routing")
        - Assign static GUA: #cmd("ipv6 address 2001:db8:10::1/64")
        - Enable Link-Local only: #cmd("ipv6 enable")
        - IPv6 Static Route: #cmd("ipv6 route ::/0 2001:db8:1::2")
        - *OSPFv3:* Configured per-interface (#cmd("ipv6 ospf 1 area 0")); uses `FE80::` next-hops and `FF02::5/6`.
      ],
      [
        #set text(size: 7.4pt)
        - Verify interface IPs: #cmd("show ipv6 interface brief")
        - Verify IPv6 routes: #cmd("show ipv6 route")
        - Verify NDP (ARP eqv): #cmd("show ipv6 neighbors")
        - *Transition Tech:* *Dual-Stack* (IPv4+IPv6 simultaneously), *Tunneling* (IPv6-over-IPv4 GRE/6to4), *NAT64* (translates IPv6 ↔ IPv4).
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(8pt)
#card(
  "IPv6 Multicast Well-Known Addresses & Anycast",
  [
    #tbl(
      (auto, auto, 1fr),
      ("Address", "Scope / Target", "Protocol & Exam Usage"),
      (
        ([`FF02::1`], [All Nodes (Link-Local)], [Replaces IPv4 broadcast `255.255.255.255` on LAN]),
        ([`FF02::2`], [All Routers (Link-Local)], [Hosts send Router Solicitation (RS) here]),
        ([`FF02::5` / `::6`], [OSPFv3 Routers / DR], [All OSPFv3 routers (`::5`) & DR/BDR (`::6`)]),
        ([`FF02::A`], [EIGRPv6 Routers], [All EIGRP for IPv6 routers on the link]),
        ([`FF02::1:FFxx:xxxx`], [Solicited-Node Multicast], [Used by NDP NS & DAD (last 24 bits of IPv6)]),
      ),
      pad-y: 4pt,
      fsize: 8.2pt
    )
    #v(4pt)
    #set text(size: 8.3pt)
    *Anycast:* Multiple servers/routers share the *same Unicast IPv6 address*; packets route to the topologically *nearest* node (e.g., global DNS root servers & CDNs).
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(8pt)
#did-you-know[IPv6 completely eliminates *ARP* and *IPv4 Broadcasts*! Every IPv6 interface automatically has a Link-Local address (`FE80::/10`), and routers use that `FE80::` Link-Local address as the next-hop gateway in routing tables.]

#pagebreak()

// =========================================================================
// PAGE 8: SWITCHING, VLANS, STP & ETHERCHANNEL
// =========================================================================
#section-banner("07", "SWITCHING, VLANS, 802.1Q TRUNKS, STP & ETHERCHANNEL", "CCNA Domain 2.0 · Layer 2 Campus Switching Mastery")

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "Switch Operations & VLANs (802.1Q)",
    [
      #set text(size: 8.8pt)
      - *CAM / MAC Table:* Switch learns *Source MAC* on ingress port (`300s` aging). Floods unknown unicast & broadcasts; forwards known unicast; filters if Src & Dst are on same port.
      - *VLANs:* Split 1 physical switch into multiple L2 broadcast domains (`1–4094`; Normal `1–1005`, Extended `1006–4094`).
      - *Access Port:* Belongs to 1 Data VLAN (+ optional Voice VLAN).
      - *802.1Q Trunk:* Carries multiple VLANs by inserting a *4-byte tag* (`TPID 0x8100` + `PRI` + `DEI` + `12-bit VLAN ID`).
      - *Native VLAN (Default 1):* Sent *untagged* across trunks. Must match on both ends! Best practice: change to unused VLAN (e.g., `999`).
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Spanning Tree Protocol (STP 802.1D vs RSTP 802.1w)",
    [
      #set text(size: 8.8pt)
      Prevents L2 broadcast storms & MAC flapping in redundant switch loops.
      1. *Elect 1 Root Bridge:* Lowest *Bridge ID* (`Priority + MAC`; default priority `32768`, step `4096`).
      2. *Root Port (RP):* Best path to Root on every non-root switch (1 per switch).
      3. *Designated Port (DP):* Best port per segment (all ports on Root Bridge are DP).
      4. *Blocked / Alternate Port:* Non-RP, non-DP ports block user traffic.
      - *802.1D States (30–50s):* Blocking → Listening → Learning → Forwarding.
      - *RSTP 802.1w (< 2s):* Discarding → Learning → Forwarding.
      - *PortFast + BPDU Guard:* Enable on access ports for instant PC link-up + `err-disable` shutdown if rogue switch sends BPDU!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(14.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "EtherChannel (Link Aggregation — LACP & PAgP)",
    [
      #set text(size: 8.8pt)
      Bundles up to *8 physical ports* into 1 logical Port-Channel (`Po1`) for higher bandwidth & redundancy (STP treats it as 1 link!).
      #v(5pt)
      #tbl(
        (auto, auto, auto),
        ("Protocol", "Standard", "Modes (Must Match!)"),
        (
          ([*LACP*], [`802.3ad` (Open)], [`Active` ↔ `Active` or `Passive`]),
          ([*PAgP*], [Cisco Prop.], [`Desirable` ↔ `Desirable` or `Auto`]),
          ([*Static*], [No negotiation], [`On` ↔ `On`]),
        ),
        pad-y: 6.5pt,
        fsize: 8.8pt
      )
      #v(5pt)
      #set text(size: 8.8pt)
      *Requirements:* Same speed, duplex, native/allowed VLANs, access/trunk mode.
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "Essential Cisco IOS Switching Commands",
    [
      #set text(size: 8.8pt)
      - Create VLAN: #cmd("vlan 10") → #cmd("name SALES")
      - Access + Voice: #cmd("switchport mode access") / #cmd("switchport access vlan 10") / #cmd("switchport voice vlan 20")
      - Trunk + Native: #cmd("switchport mode trunk") / #cmd("switchport trunk native vlan 999") / #cmd("switchport nonegotiate")
      - Root Primary: #cmd("spanning-tree vlan 10 root primary")
      - PortFast + BPDU: #cmd("spanning-tree portfast") / #cmd("spanning-tree bpduguard enable")
      - LACP Bundle: #cmd("channel-group 1 mode active")
      - Verify: #cmd("show vlan brief") · #cmd("show interfaces trunk") · #cmd("show spanning-tree") · #cmd("show etherchannel summary")
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(14.5pt)
#card(
  "DTP, VTP, CDP/LLDP & Inter-VLAN Routing (ROAS vs Layer 3 SVI)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.8pt)
        - *DTP (Dynamic Trunking):* `dynamic auto` + `auto` = Access; `desirable` + `auto` = Trunk. Always hardcode `mode trunk` + `nonegotiate` for security.
        - *VTP:* Syncs VLAN DB (Server/Client/Transparent). Set `vtp mode transparent` to avoid accidental VLAN wipes!
        - *CDP / LLDP:* L2 neighbor discovery (`show cdp neighbors detail`, `lldp run`).
      ],
      [
        #set text(size: 8.8pt)
        - *Router-on-a-Stick (ROAS):* Subinterfaces (`g0/0.10`, `encapsulation dot1Q 10`, `ip address ...`) over 1 trunk.
        - *L3 Switch (SVI):* Enable #cmd("ip routing") + #cmd("interface vlan 10") → wire-speed inter-VLAN routing!
        - *Err-Disable Recovery:* #cmd("errdisable recovery cause bpduguard")
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(14.5pt)
#did-you-know[A single *Broadcast Storm* on a looped Layer 2 network without STP can saturate 10 Gbps links to 100% CPU in under 1 second because Ethernet frames have *no TTL field*!]

#pagebreak()

// =========================================================================
// PAGE 9: ROUTING (OSPF, AD, NAT, ACLS, SECURITY, WIRELESS & AUTOMATION)
// =========================================================================
#section-banner("08", "ROUTING, OSPF, ACLS, NAT, SECURITY & AUTOMATION", "CCNA Domains 3, 4, 5 & 6 · L3, Services, Wireless, Security & SDN")

#grid(
  columns: (0.95fr, 1.05fr),
  gutter: 6.5pt,
  card(
    "Administrative Distance (AD) & Longest Prefix Match",
    [
      #tbl(
        (auto, auto, 1fr),
        ("Route Source", "AD", "Metric / Selection Rule"),
        (
          ([*Connected (`C`)*], [*0*], [Directly attached interface]),
          ([*Static (`S`)*], [*1*], [Manual next-hop / exit interface]),
          ([*eBGP*], [*20*], [AS-Path & BGP attributes (Internet)]),
          ([*EIGRP (Int)*], [*90*], [Bandwidth + Delay (Composite)]),
          ([*OSPF (`O`)*], [*110*], [Cost = Ref BW (`100 Mbps`) / Link BW]),
          ([*RIPv2 (`R`)*], [*120*], [Hop Count (max 15; 16 = unreachable)]),
          ([*Floating Static*], [*111+*], [Backup static route with AD > OSPF]),
        ),
        pad-y: 5.5pt,
        fsize: 8.3pt
      )
      #v(5pt)
      #set text(size: 8.4pt)
      *Routing Order:* 1) *Longest Prefix Match* (`/26` beats `/24`!) → 2) Lowest *AD* → 3) Lowest *Metric*. \
      *Default Route:* #cmd("ip route 0.0.0.0 0.0.0.0 203.0.113.1")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "OSPFv2 Single-Area Mastery & FHRP",
    [
      #set text(size: 8.4pt)
      - *Link-State Protocol:* Builds LSDB → runs *Dijkstra SPF* algorithm → routing table.
      - *Router ID Priority:* 1) Manual `router-id` → 2) Highest Loopback IP → 3) Highest active physical IP.
      - *7 Neighbor States:* `Down` → `Init` → `2-Way` (*DR/BDR election* on broadcast Ethernet!) → `ExStart` → `Exchange` → `Loading` → `Full`.
      - *Neighbor Requirements:* Same Area ID, Subnet/Mask, Hello/Dead (`10s/40s`), Auth, MTU; Unique Router IDs!
      - *Commands:* #cmd("router ospf 1") → #cmd("router-id 1.1.1.1") → #cmd("network 10.0.0.0 0.0.0.255 area 0") → #cmd("passive-interface g0/0")
      - *Verify:* #cmd("show ip ospf neighbor") · #cmd("show ip route ospf")
      - *FHRP (Gateway Redundancy):* *HSRP* (Cisco, Active/Standby, Hello `3s/10s`) vs *VRRP* (Open, Master/Backup).
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(9pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6.5pt,
  card(
    "IP Services (DHCP, DNS, NTP, SNMP, Syslog) & NAT/PAT",
    [
      #set text(size: 8.4pt)
      - *DHCP (DORA):* *D*iscover (Bcast) → *O*ffer → *R*equest → *A*ck. Across routers: #cmd("ip helper-address <DHCP-IP>") on SVI/router port.
      - *NTP / Syslog / SNMP:* NTP syncs clocks (`Stratum 1–15`). Syslog severity `0–7` (`0` Emergency → `6` Info → `7` Debug). SNMPv3 adds auth + AES encryption.
      - *NAT / PAT:* Inside Local (private) ↔ Inside Global (public).
        - *Static NAT:* 1-to-1 server mapping.
        - *PAT (Overload):* Many private IPs share 1 public IP via unique TCP/UDP ports: #cmd("ip nat inside source list 1 interface g0/0 overload")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "ACLs, Layer 2 Security & Network Automation",
    [
      #set text(size: 8.4pt)
      - *Standard ACL (`1–99`):* Filters *Source IP only*; place *closest to Destination*.
      - *Extended ACL (`100–199`):* Filters Src/Dst IP, Proto, Port; place *closest to Source*. Implicit `deny any` at end!
      - *L2 Security:* *Port Security* (limits MACs, `shutdown`/`restrict`), *DHCP Snooping* (`trusted` uplink), *DAI* (stops ARP spoofing).
      - *SSH Hardening:* `ip domain-name`, `crypto key generate rsa`, `transport input ssh`.
      - *Automation (Domain 6):* *SDN* splits Control Plane (Controller) from Data Plane (Switches). *REST APIs* (`GET/POST/PUT/DELETE`), *JSON* (`{"key":"val"}`), *Ansible* (Agentless SSH/YAML), *Puppet/Chef* (Agent-based).
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(9pt)
#card(
  "Wireless 802.11 Standards, Security & QoS Essentials",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.4pt)
        - *Wi-Fi Standards:* `802.11n` (Wi-Fi 4, 2.4/5 GHz), `802.11ac` (Wi-Fi 5, 5 GHz), `802.11ax` (Wi-Fi 6/6E, OFDMA). Non-overlapping 2.4 GHz channels: *1, 6, 11*.
        - *Wireless Security:* *WPA2* (AES-CCMP) vs *WPA3* (SAE + GCMP). Personal (PSK) vs Enterprise (`802.1X` RADIUS).
      ],
      [
        #set text(size: 8.4pt)
        - *QoS (Quality of Service):* Prioritizes Voice/Video (`DSCP EF 46`, `<150ms` latency, `<30ms` jitter, `<1%` loss).
        - *Shaping vs Policing:* *Shaping* buffers excess traffic (smooth); *Policing* drops/remarks excess traffic (hard cap).
      ]
    )
  ],
  head-bg: rgb("#f1f5f9"),
  title-color: rgb("#0f172a")
)

#v(8pt)
#card(
  "Automation Data Formats (JSON vs YAML vs XML) & IOS Verification",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.2pt)
        - *JSON:* Lightweight key-value `{"vlan": 10}` & arrays `[10, 20]` — standard for *REST APIs*.
        - *YAML:* Human-readable indentation (`vlan: 10`) — used by *Ansible* playbooks.
        - *XML:* Tag-based (`<vlan>10</vlan>`) — used by *NETCONF / SOAP*.
      ],
      [
        #set text(size: 8.2pt)
        - *Verify ACLs:* #cmd("show access-lists") · #cmd("show ip interface g0/0")
        - *Verify NAT:* #cmd("show ip nat translations") · #cmd("show ip nat statistics")
        - *Verify DHCP/Security:* #cmd("show ip dhcp binding") · #cmd("show port-security")
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(8pt)
#did-you-know[You can practice IPv4/IPv6 Subnetting, CIDR/Wildcard calculations, and interactive network labs free on *rtechlab.com/tools* — built specifically for CCNA & Network+ aspirants!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 CCNA INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "TOP 10 CCNA INTERVIEW Q&A & RTECHLAB AUTHOR PROFILE", "TAC / NOC Interview Prep · Credentials, Motto & Direct Support")

#card(
  "Top 10 CCNA & Networking TAC/NOC Interview Questions",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.4pt)
        *1. Switch vs Router?* Switch forwards L2 frames via MAC table inside 1 network; Router forwards L3 packets via IP routing table across networks. \
        *2. What is ARP?* Resolves known IPv4 address to unknown MAC address using broadcast Request + unicast Reply. \
        *3. Why use VLANs?* Isolate broadcast domains, improve security, and segment departments logically on one switch. \
        *4. Access vs Trunk port?* Access carries 1 untagged VLAN; Trunk carries multiple VLANs using `802.1Q` 4-byte tags. \
        *5. How does STP pick Root Bridge?* Lowest Bridge ID (`Priority + MAC`). Tiebreaker is lowest Base MAC address.
      ],
      [
        #set text(size: 8.4pt)
        *6. Longest Prefix Match vs AD?* Router ALWAYS picks the most specific subnet mask (`/27` over `/24`) first; AD only breaks ties for the *exact same* prefix. \
        *7. Why OSPF stuck in `EXSTART/EXCHANGE`?* MTU mismatch between neighbors or duplicate Router IDs. \
        *8. NAT vs PAT?* NAT maps 1-to-1 private-to-public IP; PAT maps many private IPs to 1 public IP using unique port numbers. \
        *9. `ip helper-address` purpose?* Converts client UDP DHCP Discover broadcasts into unicast packets sent to a remote DHCP server. \
        *10. IPv6 Link-Local (`FE80::/10`)?* Auto-generated on every IPv6 interface for local link communication, NDP, and routing next-hops.
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(8pt)

#card(
  "Cisco IOS Quick Device Hardening & Daily Survival Commands",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 7pt,
      [
        #set text(size: 8.4pt)
        - Hostname & Banner: #cmd("hostname R1") · #cmd("banner motd #Authorized Only#")
        - Secure Enable: #cmd("enable secret RTech@2026") · #cmd("service password-encryption")
      ],
      [
        #set text(size: 8.4pt)
        - Console / VTY Timeout: #cmd("exec-timeout 5 0") · #cmd("logging synchronous")
        - Disable DNS Lookup: #cmd("no ip domain-lookup") · Run `show` in config: #cmd("do show ip int br")
      ]
    )
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(11.5pt)

// AUTHOR & RTECHLAB MOTTO BLOCK
#box(
  width: 100%,
  fill: rgb("#0f172a"),
  radius: 4.5pt,
  inset: 8.5pt,
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
          image("02_BRAND_ASSETS/rtechlab-header-logo.png", width: 32mm)
        )
        #v(5pt)
        #text(fill: rgb("#e2e8f0"), size: 8.4pt)[
          *Verified Industry Track & Certifications:* #hl-b("CompTIA Network+ Exam Cleared") · #hl-g("Cisco CCNA 200-301 Exam Track") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · Director & Lead IT Trainer, IANT Computer Education, Palanpur · *10+ Years IT Experience · 3,000+ Students Trained*.
        ]
        #v(6pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 4.5pt),
          text(fill: rgb("#fef3c7"), size: 7.7pt)[
            *Our RTechLab Motto:* _"Technology Made Practical — Learn, Practice & Connect. Real networking mastery comes from understanding packets on the wire, not memorizing dumps. Built in India so every student gets ₹2,200-grade clarity for ₹22."_
          ]
        )
      ]
    )
  ]
)

#v(11.5pt)

// 4 SCANNABLE QR CODES
#card(
  "Scan & Connect with RTechLab Ecosystem (Free Labs, Tools & Updates)",
  [
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 7pt,
      align: center,
      [
        #image("02_BRAND_ASSETS/qr_rahul_portfolio.png", width: 29.5mm)
        #v(2pt)
        #text(size: 8.4pt, weight: "bold", fill: rgb("#0f172a"))[RTechLab & Tools] \
        #link("https://rtechlab.com/tools")[#text(size: 6.9pt, fill: rgb("#0284c7"))[rtechlab.com/tools]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", width: 29.5mm)
        #v(2pt)
        #text(size: 8.4pt, weight: "bold", fill: rgb("#0f172a"))[YouTube Labs] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 6.9pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 29.5mm)
        #v(2pt)
        #text(size: 8.4pt, weight: "bold", fill: rgb("#0f172a"))[Instagram Reels] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 6.9pt, fill: rgb("#db2777"))[Daily Tech Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 29.5mm)
        #v(2pt)
        #text(size: 8.4pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp Channel] \
        #link("https://wa.me/917646892094")[#text(size: 6.9pt, fill: rgb("#16a34a"))[Job & Note Alerts]]
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(11.5pt)

// WHATSAPP HELP DESK CTA
#box(
  width: 100%,
  fill: rgb("#dcfce7"),
  stroke: 1.2pt + rgb("#16a34a"),
  radius: 4.5pt,
  inset: (x: 9pt, y: 6.5pt),
  grid(
    columns: (auto, 1fr, auto),
    gutter: 9pt,
    align: (left + horizon, left + horizon, right + horizon),
    image("02_BRAND_ASSETS/whatsapp_logo.svg", width: 9.5mm),
    [
      #text(size: 9pt, weight: "bold", fill: rgb("#14532d"))[RTechLab Student Help Desk & Career Guidance] \
      #text(size: 8.4pt, fill: rgb("#166534"))[Stuck on Subnetting, Packet Tracer, or CCNA/Network+ prep? Message our desk directly on WhatsApp!]
    ],
    link("https://wa.me/917646892094")[
      #box(
        fill: rgb("#16a34a"),
        radius: 3.5pt,
        inset: (x: 9pt, y: 5pt),
        text(fill: white, weight: "bold", size: 8.8pt)[WhatsApp: +91 76468 92094]
      )
    ]
  )
)
