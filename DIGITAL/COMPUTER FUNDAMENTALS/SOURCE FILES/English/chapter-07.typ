#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-cyan)[CHAPTER 07 · COMPUTER NETWORKS & PROTOCOLS]
= Chapter 7: Data Communications, Networks & Internet Protocols

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Network topologies, 7-Layer OSI and TCP/IP reference architectures, TCP 3-way handshake vs UDP, IPv4 vs IPv6 addressing, CIDR subnetting, ARP, DNS resolution hierarchy, and Wi-Fi 7 Multi-Link Operation (MLO).
]

#v(2pt)

== 7.1 Network Topologies & Network Hardware Infrastructure
A computer network connects autonomous computing nodes to exchange data packets:
- *Network Scale:* PAN (Personal Area Network: Bluetooth/UWB $<10$ m); LAN (Local Area Network: Ethernet/Wi-Fi within a building); MAN (Metropolitan Area Network: municipal fiber rings); WAN (Wide Area Network: global Internet backbones).
- *Physical Topologies:*
  - *Star Topology:* All client nodes connect to a central network switch via point-to-point links. Dominant LAN standard; single cable failure isolates only one device without taking down the network.
  - *Bus Topology:* Legacy shared backbone coaxial cable with terminating resistors. Low cost; single cable break severs the entire network; prone to signal reflections.
  - *Ring Topology:* Nodes connected in a circular closed loop passing tokens (Token Ring). Predictable latency; single node failure breaks communication.
  - *Mesh Topology:* Nodes interconnected via redundant point-to-point links. Full mesh provides $N(N-1)/2$ physical links, offering maximum fault tolerance for military and core ISP backbones.
- *Core Network Hardware:*
  - *Hub (Layer 1):* Electrical repeater; broadcasts incoming bits across all physical ports simultaneously, creating a single shared collision domain.
  - *Switch (Layer 2):* High-speed frame forwarder; inspects physical MAC addresses in frame headers, maintaining an internal CAM table to forward traffic only to designated destination ports, eliminating collisions.
  - *Router (Layer 3):* Internetworking gateway; inspects logical IP packet headers, maintains routing tables, and forwards packets between disparate subnets across WANs.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg",
  caption: "Figure 7.1: Enterprise 24-port Gigabit Ethernet managed switch showing RJ-45 ports and fiber SFP uplink bays.",
  height: 48pt
)

#v(2pt)

== 7.2 The 7-Layer OSI Model vs The 4-Layer TCP/IP Model
#table(
  columns: (1fr, 1.2fr, 1.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.5pt,
  table.header([*OSI Layer*], [*TCP/IP Equivalent*], [*Data Protocol Unit (PDU)*], [*Primary Engineering Protocols & Function*]),
  [7. Application], [Application], [Data / Message], [HTTP, HTTPS, DNS, SSH, SMTP, FTP; user application network interfaces.],
  [6. Presentation], [Application], [Data / Message], [TLS/SSL encryption, data compression, JPEG/MPEG data formatting.],
  [5. Session], [Application], [Data / Message], [RPC, NetBIOS; establishes, manages, and tears down dialog sessions.],
  [4. Transport], [Transport], [Segment (TCP) / Datagram (UDP)], [TCP (reliable, flow control), UDP (unreliable, low latency); Port addressing.],
  [3. Network], [Internet], [Packet], [IPv4, IPv6, ICMP, IPsec, BGP, OSPF; logical addressing and path routing.],
  [2. Data Link], [Network Access], [Frame], [Ethernet (IEEE 802.3), Wi-Fi (802.11); MAC addressing and CRC checksums. Standard Ethernet MTU is 1500 bytes (IP payload); full frame is 1518 bytes (1522B with 802.1Q VLAN); default TCP MSS is 1460 bytes.],
  [1. Physical], [Network Access], [Bits (Electrical/Optical)], [RJ-45 Cat6, fiber-optic LC, transceivers; binary electrical and light signaling.]
)

#pagebreak()

== 7.3 Transport Protocols: TCP 3-Way Handshake vs UDP
#table(
  columns: (1fr, 1.6fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Engineering Attribute*], [*TCP (Transmission Control Protocol)*], [*UDP (User Datagram Protocol)*]),
  [Connection Style], [#hl[Connection-Oriented]; mandates 3-way handshake prior to data], [#hl[Connectionless]; transmits datagrams immediately without setup],
  [Reliability Level], [Reliable byte stream; acknowledges receipt and retransmits lost packets\[\*\]], [Unreliable best-effort; packets may arrive out-of-order or drop],
  [Header Overhead], [20 to 60 bytes (sequence numbers, ACKs, window size, flags)], [Only 8 bytes (source/destination ports, length, checksum)],
  [Flow & Congestion Control], [Sliding window protocol, dynamic back-off (AIMD, BBR)], [None; transmits at application rate regardless of network congestion],
  [Primary Applications], [Web pages (HTTPS), file transfer (SFTP), email (SMTP), SSH], [Live video streaming, VoIP telephony, multiplayer gaming, DNS queries]
)

#v(2pt)

#concept-box(title: "The TCP 3-Way Handshake & Teardown Protocol")[
  - *Establishment:* 1. Client transmits Synchronize packet: `SYN = 1, Seq = X`; 2. Server acknowledges: `SYN = 1, ACK = 1, Ack = X+1, Seq = Y`; 3. Client acknowledges: `ACK = 1, Ack = Y+1`.
  - *Teardown (4-Way):* 1. Client sends `FIN`; 2. Server sends `ACK`; 3. Server sends its own `FIN`; 4. Client sends `ACK` and enters `TIME_WAIT` state to ensure final ACK was safely delivered.
  - *Delivery Reality Qualification:* TCP provides reliable stream delivery under operational network paths; it cannot deliver packets if physical links are severed or routers crash.
]

#v(2pt)

== 7.4 Logical IP Addressing: IPv4, IPv6 & CIDR Subnetting
- *IPv4 Addressing:* 32-bit binary number expressed in dotted-decimal format (e.g., `192.168.1.1`). Total address space is $2^{32} approx 4.29$ billion addresses.
- *Private IP Ranges (RFC 1918):* Non-routable across the public Internet; translated via NAT/PAT:
  - Class A: `10.0.0.0` to `10.255.255.255` (`10.0.0.0/8`, 16.7 million hosts).
  - Class B: `172.16.0.0` to `172.31.255.255` (`172.16.0.0/12`, 1.04 million hosts).
  - Class C: `192.168.0.0` to `192.168.255.255` (`192.168.0.0/16`, 65,536 hosts).
- *IPv6 Addressing:* 128-bit hexadecimal addressing separated by colons (e.g., `2001:0db8:85a3::8a2e:0370:7334`). Total pool is $2^{128} approx 3.4 times 10^{38}$ addresses, eliminating the need for NAT and integrating IPsec by default.
- *Subnetting Mechanics (CIDR):* A host performs a bitwise logical `AND` between its IP address and the Subnet Mask. E.g., for `/26` (Mask `255.255.255.192`), the host portion contains $32 - 26 = 6$ bits, providing $2^6 - 2 = 62$ usable host IP addresses (subtracting network and broadcast addresses).

#pagebreak()

== 7.5 Address Resolution Protocol (ARP) & DNS Resolution Hierarchy
- *Address Resolution Protocol (ARP):* Bridges Layer 3 and Layer 2. To transmit an IP packet across a local Ethernet subnet, a host broadcasts an `ARP Request` (`FF:FF:FF:FF:FF:FF`) asking: *"Who has IP 192.168.1.1? Tell 192.168.1.50"*. The target host returns a unicast `ARP Reply` containing its physical 48-bit MAC address. Hosts cache mappings in a local ARP table.
- *Domain Name System (DNS) Resolution Hierarchy:* Queries operate over UDP port 53. Modern EDNS0 (RFC 6891) allows buffer advertising. Per RFC 9715 (Jan 2025), DNS Flag Day 2020 established a conservative 1232-byte fragmentation-avoidance recommendation (1280B IPv6 min MTU - 40B IPv6 - 8B UDP), while ~1400 bytes serves as an operational resolver ceiling to avoid fragmentation on 1500B Ethernet links with tunnel overhead. Responses exceeding buffer capacity set the Truncation flag (`TC=1`), prompting TCP port 53 fallback.
  1. Client browser checks local cache and OS DNS resolver cache.
  2. Queries Recursive Resolver (ISP or `1.1.1.1` / `8.8.8.8`).
  3. Recursive resolver queries Root Nameserver (`.`), receiving TLD server IP.
  4. Queries TLD Nameserver (`.com`), receiving Authoritative Nameserver IP.
  5. Queries Authoritative Nameserver, receiving `A` record (IPv4) or `AAAA` record (IPv6).

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/fiber-optic-duplex-lc.jpg",
  caption: "Figure 7.2: Duplex LC single-mode fiber-optic cable transmitting gigabit data pulses over kilometers without electrical attenuation.",
  height: 48pt
)

#v(2pt)

== 7.6 Modern Wireless Standards: Wi-Fi 7 (802.11be) & MLO
The IEEE 802.11be standard (Wi-Fi 7) introduces extreme throughput enhancements over Wi-Fi 6E:
- *320 MHz Ultra-Wide Channels:* Doubles channel width in the 6 GHz band, doubling raw data throughput.
- *4096-QAM (4K-QAM):* Encodes 12 bits per constellation symbol (a 20% increase over Wi-Fi 6's 1024-QAM).
- *Multi-Link Operation (MLO):* Prior Wi-Fi devices connected to only a single band (2.4 GHz, 5 GHz, or 6 GHz). Wi-Fi 7 MLO enables client devices to transmit and receive data packets across #hl[multiple radio bands simultaneously]!
  - *Simultaneous Transmit & Receive (STR):* Dual active radios transmit independently on 5 GHz and 6 GHz, slashing latency to $<5$ ms.
  - *Enhanced Multi-Link Single Radio (eMLSR):* Dynamically switches links based on instantaneous channel interference.

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why is UDP used for online gaming and live streaming instead of TCP?", a: "UDP omits connection setup and retransmissions. In live gaming, an old dropped packet is useless because the game state has already advanced; low latency is paramount.")
#faq-item(q: "What is the difference between a MAC address and an IP address?", a: "A MAC address is a permanent physical Layer 2 address burned into the NIC. An IP address is a logical Layer 3 address assigned dynamically by network routers.")
#faq-item(q: "How does Wi-Fi 7 Multi-Link Operation (MLO) reduce gaming latency?", a: "MLO bonds 5 GHz and 6 GHz channels simultaneously. If one frequency experiences interference, packets traverse the alternate band instantly without stalling.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which OSI reference model layer handles end-to-end flow control and TCP segments?", ans: "Layer 4 (Transport Layer).")
#short-q(num: 2, q: "How many total bits comprise an IPv6 logical address?", ans: "128 bits.")
#short-q(num: 3, q: "What is the broadcast MAC address in Ethernet networking?", ans: "FF:FF:FF:FF:FF:FF.")
#short-q(num: 4, q: "How many usable host IP addresses are provided by a /28 CIDR subnet?", ans: "14 usable hosts (2^4 - 2 = 14).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "What packet is sent by a client to initiate the classic TCP 3-way handshake?", a: "ACK", b: "SYN", c: "FIN", d: "RST", ans: "B", expl: "The client begins connection establishment by transmitting a SYN (Synchronize) packet containing an initial sequence number.")
#mcq(num: 2, q: "Which network device operates at Layer 2 to switch frames based on hardware MAC addresses?", a: "Repeater Hub", b: "Network Switch", c: "Gateway Router", d: "Passive Splitter", ans: "B", expl: "A Layer 2 switch maintains a MAC address CAM table to forward frames directly to target ports.")
#mcq(num: 3, q: "Which IPv4 address range is designated as a private non-routable Class C network under RFC 1918?", a: "10.0.0.0/8", b: "172.16.0.0/12", c: "192.168.0.0/16", d: "127.0.0.0/8", ans: "C", expl: "192.168.0.0/16 is the standard Class C private IP range utilized in home and office LANs.")
#mcq(num: 4, q: "What protocol maps a known Layer 3 logical IP address to a physical Layer 2 MAC address?", a: "DNS", b: "DHCP", c: "ARP", d: "ICMP", ans: "C", expl: "Address Resolution Protocol (ARP) broadcasts requests on local subnets to resolve hardware MAC addresses.")
#mcq(num: 5, q: "What modulation technology allows Wi-Fi 7 to encode 12 bits per symbol across 320 MHz channels?", a: "BPSK", b: "16-QAM", c: "1024-QAM", d: "4096-QAM (4K-QAM)", ans: "D", expl: "Wi-Fi 7 implements 4096-QAM, delivering a 20% throughput increase over Wi-Fi 6.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "IPv4 Address Exhaustion")[
      IANA allocated the final unassigned IPv4 address blocks in 2011. Today, CGNAT and rapid IPv6 adoption sustain global Internet expansion!
    ]
  ],
  [
    #tech-spotlight-box(title: "QUIC Protocol & HTTP/3")[
      HTTP/3 replaces TCP with QUIC over UDP, executing cryptographic handshakes and data requests in a single round trip (0-RTT)!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
