#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *

// =============================================================================
// CHAPTER 07: COMPUTER NETWORKS, OSI MODEL, TCP/IP & SUBNETTING
// =============================================================================

#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 07 · NETWORKING & INTERNET]
= Chapter 7: Computer Networks, OSI Model & Internet Protocols

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  A rigorous technical deep-dive into network architectures, transmission media, the 7-Layer OSI model, TCP 3-way handshakes, IPv4 subnetting algorithms, and DNS web resolution.
]

#v(2pt)

== 7.1 Networking Fundamentals: Geographies, Topologies & Media
A computer network is an interconnected group of autonomous computational devices communicating across physical or wireless transmission media using standardized communication protocols:

#v(2pt)

#analogy-box(title: "The Global Postal & Courier System Analogy")[
  To visualize how data travels across the Internet:
  - #strong[Data Packet:] A #hl[Sealed Envelope]. Contains the sender's letter inside.
  - #strong[MAC Address:] The recipient's #hl[Physical Fingerprint]. Burned into their hardware network card.
  - #strong[IP Address:] The recipient's #hl[Postal Street Address]. Indicates their current location in the world.
  - #strong[Router:] The #hl[Sorting Post Office]. Inspects zip codes and routes envelopes down the fastest highway.
  - #strong[Fiber Optic Cables:] The #hl[Supersonic Airplanes] carrying billions of envelopes at the speed of light!
]

#v(2pt)

#dual-photo(
  img1: "/public/images/notes/photos/network-switch-gigabit.jpg",
  cap1: "Figure 7.1: Enterprise 24-Port Gigabit Ethernet Switch (Layer 2 MAC Forwarding)",
  img2: "/public/images/notes/photos/fiber-optic-duplex-lc.jpg",
  cap2: "Figure 7.2: Duplex LC Fiber Optic Patch Cable (Total Internal Reflection)",
  height: 65pt
)

#v(2pt)

#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Network Scope*], [*Geographic Radius*], [*Standard Media & Industrial Use Case*]),
  [#strong[1. PAN (Personal)]], [1 to 10 meters], [Bluetooth 5.3, NFC, UWB. Connects smartwatches, headphones, smartphones.],
  [#strong[2. LAN (Local)]], [10m to 1 km (Building)], [Cat6/Cat6a ($1 - 10 " Gbps"$), Wi-Fi 6E/7. Workstations and printers in office.],
  [#strong[3. MAN (Metropolitan)]], [5 km to 50 km (City)], [Single-Mode Fiber rings. Connects campuses, bank branches, cable TV.],
  [#strong[4. WAN (Wide Area)]], [Worldwide / Global], [Undersea submarine cables, satellite (Starlink), BGP backbone. The Internet!]
)

#pagebreak()

// PAGE 2 OF CHAPTER 7: THE 7-LAYER OSI MODEL & TCP 3-WAY HANDSHAKE
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 07 · NETWORKING & INTERNET]
== 7.2 The 7-Layer OSI Reference Model vs TCP/IP Protocol Stack
Formulated by the ISO, the OSI model decomposes network communication into seven independent modular layers:

#v(2pt)

#table(
  columns: (0.5fr, 1.3fr, 1fr, 1.8fr, 1.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*No.*], [*OSI Layer*], [*PDU Unit*], [*Primary Protocols*], [*Active Hardware Device*]),
  [7], [#strong[Application]], [Data], [HTTP/3, HTTPS, DNS, SMTP, SSH, FTP], [Gateway, Web Browser],
  [6], [#strong[Presentation]], [Data], [TLS/SSL, ASCII, UTF-8, JPEG, MP4], [Cryptographic Subsystem],
  [5], [#strong[Session]], [Data], [RPC, NetBIOS, PPTP, Sockets], [OS Socket API],
  [4], [#strong[Transport]], [#hl[Segment]], [TCP (Reliable), UDP (Fast)], [Firewall, L4 Balancer],
  [3], [#strong[Network]], [#hl[Packet]], [IPv4, IPv6, ICMP, ARP, OSPF, BGP], [#hl[Router, L3 Switch]],
  [2], [#strong[Data Link]], [#hl[Frame]], [Ethernet (802.3), Wi-Fi (802.11)], [#hl[Switch, Bridge, NIC]],
  [1], [#strong[Physical]], [#hl[Bit]], [Voltages, Radio Frequencies, Light], [Hub, Repeater, Cables]
)

#v(2pt)

== 7.3 Transport Layer: TCP 3-Way Handshake vs UDP Datagrams
The Transport Layer establishes end-to-end communication between applications using Port numbers:

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(stroke: 0.5pt + rtech-border, fill: white, radius: 4pt, inset: 5pt)[
      #text(weight: "bold", size: 8pt, fill: rtech-navy)[TCP 3-Way Handshake:]\
      #v(1.5pt)
      1. #strong[Step 1 (SYN):] Client sends packet with `SYN=1` and sequence number $X$.\
      2. #strong[Step 2 (SYN-ACK):] Server replies with `SYN=1, ACK=1`, acknowledging $X+1$ and proposing sequence $Y$.\
      3. #strong[Step 3 (ACK):] Client replies with `ACK=1`, acknowledging $Y+1$.\
      #hl[Connection Established! Transmission begins.]
    ]
  ],
  [
    #block(stroke: 0.5pt + rtech-border, fill: white, radius: 4pt, inset: 5pt)[
      #text(weight: "bold", size: 8pt, fill: rtech-navy)[TCP vs UDP Tradeoff:]\
      #v(1.5pt)
      - #strong[TCP:] Connection-oriented, guarantees packet order, retransmits lost packets, flow control. Used for Web (HTTPS), email, banking.\
      - #strong[UDP:] Connectionless, zero handshake overhead, no retransmissions. Blazing fast! Used for VoIP, video streaming, gaming, DNS.
    ]
  ]
)

#pagebreak()

// PAGE 3 OF CHAPTER 7: IP ADDRESSING, SUBNETTING & WEB REQUEST JOURNEY
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 07 · NETWORKING & INTERNET]
== 7.4 IPv4 Addressing, RFC 1918 Private Ranges & Subnetting
An IPv4 address is a #hl[32-bit binary number] displayed in dotted-decimal format (4 octets, e.g. `192.168.1.1`).
- #strong[Private Ranges:] Class A (`10.0.0.0/8`), Class B (`172.16.0.0/12`), Class C (`192.168.0.0/16`), Loopback (`127.0.0.1`).

#v(2pt)

#block(stroke: 0.5pt + rtech-cyan, fill: rtech-paper, radius: 4pt, inset: 4.5pt)[
  #text(weight: "bold", size: 8pt, fill: rtech-navy)[Solved Subnetting: Divide `192.168.10.0/24` into 4 Equal Subnets (/26):]\
  - #strong[Borrow Bits:] $2^2 = 4 arrow$ Prefix #hl[/26] (`255.255.255.192`) | #strong[Block Size:] 64 | #strong[Usable Hosts:] $64 - 2 = #hl[62]$\
  - #strong[Subnet 1:] `192.168.10.0` (Usable: `.1 - .62`, Bcast: `.63`) | #strong[Subnet 2:] `192.168.10.64` (Usable: `.65 - .126`, Bcast: `.127`)\
  - #strong[Subnet 3:] `192.168.10.128` (Usable: `.129 - .190`, Bcast: `.191`) | #strong[Subnet 4:] `192.168.10.192` (Usable: `.193 - .254`, Bcast: `.255`)
]

#v(2pt)

== 7.5 The 8-Step Lifecycle of a Web Request
When a user types `https://rtechlab.com` and hits Enter:
1. #strong[Cache & DNS Resolution:] Browser checks local cache -> queries Recursive DNS (e.g. `8.8.8.8`) -> Root, TLD, Authoritative DNS to resolve IP.
2. #strong[ARP & Gateway Routing:] Address Resolution Protocol maps router gateway IP to physical 48-bit MAC address for LAN frame delivery.
3. #strong[TCP & TLS Handshake:] Client & server complete TCP 3-way handshake (`SYN->SYN-ACK->ACK`) over port 443 -> TLS 1.3 negotiates AES-256 session keys.
4. #strong[HTTP Response & DOM Render:] Browser transmits encrypted `GET / HTTP/2` request -> Server returns HTML `200 OK` -> Engine paints pixels!

#pagebreak()

// PAGE 4 OF CHAPTER 7: EVALUATION LAB (FAQS, Q&A, MCQS, FACT, QR)
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 07 · PRACTICE & EVALUATION LAB]
= Chapter 7 Comprehensive Review, FAQs & Evaluation Lab

#v(1.5pt)

== 1. Frequently Asked Student Questions (FAQs)
#faq-item(
  q: "What is the difference between a MAC address and an IP address?",
  a: "A MAC address is a 48-bit physical identifier burned into the NIC for local LAN delivery (Layer 2). An IP address is a logical 32-bit (IPv4) or 128-bit (IPv6) address assigned dynamically by routers for global Internet routing (Layer 3)."
)
#faq-item(
  q: "Why do we need IPv6 if IPv4 is still widely used?",
  a: "IPv4 is limited to $2^{32} approx 4.29$ billion addresses, which are officially exhausted. IPv6 uses 128 bits ($approx 3.4 times 10^{38}$ addresses), providing virtually infinite unique addresses for every device on Earth."
)
#faq-item(
  q: "Can a Network Switch replace a Router in a home network?",
  a: "No. A switch operates at Layer 2 forwarding frames using MAC addresses. A router operates at Layer 3 routing packets between different subnets and translating private IPs to the public Internet via NAT."
)

#v(1.5pt)

== 2. Short-Answer Review Questions with Verified Answers
#short-qa(
  num: 1,
  q: "State the seven layers of the OSI model in order from Layer 1 to Layer 7.",
  a: "1. Physical, 2. Data Link, 3. Network, 4. Transport, 5. Session, 6. Presentation, 7. Application."
)
#short-qa(
  num: 2,
  q: "What are the three flags exchanged during a TCP connection handshake?",
  a: "1. SYN (Synchronize), 2. SYN-ACK (Synchronize-Acknowledge), 3. ACK (Acknowledge)."
)
#short-qa(
  num: 3,
  q: "Why are the first and last IP addresses in an IPv4 subnet reserved?",
  a: "The first address identifies the Network ID; the last address is the Directed Broadcast ID."
)
#short-qa(
  num: 4,
  q: "What is the operational difference between TCP and UDP?",
  a: "TCP is connection-oriented, reliable and retransmits lost packets; UDP is connectionless, fast, and does not retransmit."
)

#v(1.5pt)

== 3. 5 High-Yield Chapter 7 Multiple-Choice Questions (MCQs)
#mcq(num: 1, q: "At which OSI layer does an Ethernet Network Switch primarily operate?", a: "Layer 1", b: "Layer 2 (Data Link)", c: "Layer 3", d: "Layer 4", ans: "B", expl: "Switches operate at Layer 2 (Data Link Layer), inspecting MAC addresses.")
#mcq(num: 2, q: "How many usable host IP addresses are provided by a /28 IPv4 subnet?", a: "14", b: "16", c: "30", d: "62", ans: "A", expl: "A /28 subnet has 4 host bits: $2^4 - 2 = 16 - 2 = 14$ usable hosts.")
#mcq(num: 3, q: "Which protocol translates domain names into numeric IP addresses?", a: "DHCP", b: "ARP", c: "DNS", d: "FTP", ans: "C", expl: "DNS translates human-readable domain names into IP addresses.")
#mcq(num: 4, q: "What port number is standard for encrypted web traffic using HTTPS?", a: "Port 21", b: "Port 25", c: "Port 80", d: "Port 443", ans: "D", expl: "Port 443 is the standard port for encrypted HTTPS web traffic.")
#mcq(num: 5, q: "Which of the following is an RFC 1918 Private IPv4 address?", a: "8.8.8.8", b: "192.168.1.100", c: "1.1.1.1", d: "172.33.10.5", ans: "B", expl: "`192.168.0.0/16` is designated for private local area networks.")

#v(1.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #fact-box(title: "Undersea Cables Carry the World's Internet")[
      Over #hl[99% of all international Internet data traffic] travels across 1.4 million km of deep-sea submarine fiber-optic cables on ocean floors, wrapped in armored steel!
    ]
  ],
  [
    #tool-qr-card(
      tool-name: "RTechLab Interactive IPv4 Subnet Calculator",
      tool-desc: "Calculate subnet masks, CIDR blocks, and host ranges live online:",
      qr-img: "/public/images/notes/qr-tool-subnet-calculator.svg",
      tool-url: "http://localhost:5173/tools/subnet-calculator"
    )
  ]
)
