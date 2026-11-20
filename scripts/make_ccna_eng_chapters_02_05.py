import os

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
ENG_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301", "07_SOURCE_FILES", "English")

# CHAPTER 02
ch02 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 02 · PHYSICAL LAYER & CABLING STANDARDS]
= Chapter 2: Cabling Standards, Hardware Ports & Media

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Physical Layer transmission media, copper UTP twisted pair categories, T568A vs T568B termination pinouts, Straight-Through vs Crossover pinout math, Single-Mode vs Multi-Mode fiber optics, transceivers (SFP, SFP+, QSFP28), console ports, and collision vs broadcast domains.
]

#v(2pt)

== 2.1 Copper Transmission Media & Twisted Pair Physics
Copper cabling remains the backbone of enterprise campus access layers. Unshielded Twisted Pair (UTP) cancels Electromagnetic Interference (EMI) and radio frequency interference (RFI) via #hl[differential signaling across tightly twisted wire pairs].
- *Twisting Principle:* Current flowing through a wire generates an electromagnetic field. Twisting adjacent wires causes equal and opposite fields to cancel each other, mitigating crosstalk (NEXT - Near-End Crosstalk).
- *Attenuation & Velocity of Propagation:* High-frequency signals weaken as distance increases. Maximum channel link distance for certified Ethernet copper runs is strictly #hl[100 meters (90m solid horizontal run + 10m stranded patch cords)].

#v(2pt)

== 2.2 Ethernet Copper Standards & Bandwidth Ratings
#table(
  columns: (1fr, 1.2fr, 1.1fr, 2.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Standard*], [*Maximum Speed*], [*Frequency Bandwidth*], [*Enterprise Application & Characteristics*]),
  [Cat5e], [1,000 Mbps (1 Gbps)], [100 MHz], [1000BASE-T access layer standard. Uses all 4 wire pairs for full-duplex transmission.],
  [Cat6], [10 Gbps (up to 55m)], [250 MHz], [10GBASE-T support up to 55 meters; features internal longitudinal plastic spline separator.],
  [Cat6a], [10 Gbps (full 100m)], [500 MHz], [Eliminates Alien Crosstalk (ANEXT); primary standard for modern 802.11ax/Wi-Fi 7 APs.],
  [Cat8], [25 / 40 Gbps (30m)], [2,000 MHz (2 GHz)], [Shielded S/FTP datacenter Top-of-Rack (ToR) server switch interconnects only.]
)

#v(2pt)

== 2.3 TIA/EIA-568A vs TIA/EIA-568B Pinout Standards
Ethernet modular 8P8C (RJ45) terminations adhere to two standardized color codes:
- *T568A Pinout (1-8):* 1: White/Green, 2: Green, 3: White/Orange, 4: Blue, 5: White/Blue, 6: Orange, 7: White/Brown, 8: Brown.
- *T568B Pinout (1-8):* 1: White/Orange, 2: Orange, 3: White/Green, 4: Blue, 5: White/Blue, 6: Green, 7: White/Brown, 8: Brown.
- *Straight-Through Cable:* Both ends terminate with the #hl[same pinout] (A-to-A or B-to-B). Connects disparate Layer devices (PC to Switch, Router to Switch).
- *Crossover Cable:* One end terminates in T568A, the other in T568B (swapping pins 1/2 with 3/6). Connects identical Layer devices (Switch to Switch, Router to PC, Router to Router). Modern NICs feature *Auto-MDIX* to automatically detect and correct pinouts.

#pagebreak()

== 2.4 Optical Fiber Physics: Single-Mode vs Multi-Mode Fiber
When transmission distances exceed 100 meters or enterprise noise levels are severe, optical fiber is required:
- *Core Physics:* Light propagates through a glass silica core via #hl[Total Internal Reflection (TIR)], bounded by cladding with a lower refractive index.
- *Single-Mode Fiber (SMF):* Extremely thin core (9 $mu$m). Emits a single ray path via laser diode (1310nm / 1550nm). Negligible modal dispersion, enabling spans of #hl[10 km to 80+ km]. Standard for campus backbones and telco WANs (Yellow jacket).
- *Multi-Mode Fiber (MMF):* Wider core (50 $mu$m / 62.5 $mu$m). Light bounces across multiple ray paths via VCSEL LEDs (850nm). Susceptible to modal dispersion; distance limited to #hl[300m to 550m] (Aqua/Orange jacket).

#v(2pt)

== 2.5 Optical Transceiver Modules & Form Factors
#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Transceiver*], [*Max Throughput*], [*Connector Type*], [*Deployment Environment*]),
  [SFP (Mini-GBIC)], [1 Gbps], [Duplex LC], [Legacy 1000BASE-SX/LX campus aggregation links.],
  [SFP+], [10 Gbps], [Duplex LC], [Modern 10GBASE-SR/LR distribution uplinks and server NICs.],
  [SFP28], [25 Gbps], [Duplex LC], [Next-generation datacenter Leaf-to-Server connections.],
  [QSFP28], [100 Gbps], [MPO / Duplex LC], [Spine-to-Leaf 100G optical datacenter backbones.]
)

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/fiber-optic-duplex-lc.jpg",
  caption: "Figure 2.1: Duplex LC Optical Fiber connector with ceramic ferrule for high-speed SFP+ uplinks.",
  height: 52pt
)

#v(2pt)

== 2.6 Collision Domains vs Broadcast Domains
Understanding Layer 1 and Layer 2 boundary physics is foundational for network architecture:
1. *Collision Domain:* A physical network segment where data frames can collide if two endpoints transmit simultaneously.
   - *Legacy Hubs:* A hub is a Layer 1 multiport repeater; all ports share #hl[one single collision domain] (Half-Duplex CSMA/CD).
   - *Modern Switches:* A Layer 2 switch micro-segments traffic; #hl[each switch port is an independent collision domain] operating in Full-Duplex.
2. *Broadcast Domain:* A logical segment bounded by Layer 3 devices where a Layer 2 broadcast frame (`FFFF.FFFF.FFFF`) is forwarded.
   - Switches flood broadcasts out all ports within the same VLAN; an unsegmented switch is #hl[one single broadcast domain].
   - *Routers block Layer 2 broadcasts; each router interface terminates and bounds a broadcast domain*.

#pagebreak()

== 2.7 Console Cables & Out-of-Band Management Hardware
When a brand new Cisco router or switch is delivered from the factory without an IP address, *Out-of-Band (OOB)* management is required:
- *Rollover Console Cable (RJ45 to DB9 / USB):* Pin 1 connects to Pin 8, Pin 2 to Pin 7, reversing all pins. Connects laptop COM port to the Cisco RJ45 CONSOLE port.
- *USB Console Ports (Mini-B / Type-C):* Modern Cisco Catalyst 9000 switches feature integrated mini-USB or Type-C console ports requiring the Silicon Labs CP210x serial driver.
- *Serial Terminal Settings:* Baud Rate: #hl[9600 bps], Data Bits: 8, Parity: None, Stop Bits: 1, Flow Control: None (abbreviated *9600-8-N-1*).

#v(2pt)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Device Type*], [*OSI Operating Layer*], [*Collision Domains*], [*Broadcast Domains*]),
  [Hub / Repeater], [Layer 1 (Physical)], [1 (Shared across all ports)], [1 (All ports shared)],
  [Bridge], [Layer 2 (Data Link)], [1 per port], [1 (Shared across bridge)],
  [Switch], [Layer 2 (Data Link)], [#hl[1 per port (Full Duplex)]], [1 per VLAN (Switches flood broadcasts)],
  [Router], [Layer 3 (Network)], [1 per port], [#hl[1 per port (Routers break broadcasts)]]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "CSMA/CD Mechanism (Half Duplex)")[
      Carrier Sense Multiple Access with Collision Detection:\
      1. *Listen before Talk:* Host senses carrier voltage.\
      2. *Contention:* If wire idle, host transmits frame.\
      3. *Collision Detect:* If simultaneous transmit occurs, jam signal emitted; hosts wait random truncated binary exponential backoff time. Full-Duplex disables CSMA/CD.
    ]
  ],
  [
    #concept-box(title: "Fiber LC Cleaning & Eye Safety Warning")[
      Always inspect optical connectors with a fiberscope before insertion; microscopic dust blocks laser photons and cracks ferrule faces.\
      #text(fill: rtech-rose, weight: "bold")[NEVER LOOK DIRECTLY INTO AN ACTIVE FIBER PORT!] Invisible infrared laser emissions (1310/1550nm) cause irreversible retinal thermal burns.
    ]
  ]
)

#v(2pt)

== 2.8 Common Physical Layer Troubleshooting Commands
To diagnose physical layer faults on Cisco IOS devices:
- `show interfaces status` — Displays port speed, duplex, duplex mismatch errors, and SFP transceiver presence.
- `show interfaces [interface] | include CRC` — CRC errors indicate faulty copper crimps, damaged patch panels, or electromagnetic noise.
- `show controllers [interface]` — Identifies connected cable type (DTE vs DCE on legacy serial cables).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why does Single-Mode fiber transmit much further than Multi-Mode fiber?", a: "Single-Mode fiber has an ultra-narrow core (9um) that permits only a single wavelength path, eliminating modal dispersion. Multi-Mode fiber has a wide core where multiple light rays reflect at different angles, creating modal distortion over distance.")
#faq-item(q: "What causes a duplex mismatch and what are the symptoms?", a: "A duplex mismatch occurs when one port is set to Full-Duplex and the other to Half-Duplex (often due to failed autonegotiation). Symptoms include severe packet loss, late collisions, and degraded throughput.")
#faq-item(q: "What is the certified maximum distance for Category 6 copper cable at 10 Gbps?", a: "Cat6 supports 10 Gbps up to 55 meters in standard environments (37 meters in high-crosstalk bundles). Cat6a is required for full 100-meter 10GBASE-T runs.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "State the standardized terminal serial port configuration for Cisco console connections.", ans: "9600 Baud, 8 Data Bits, No Parity, 1 Stop Bit, No Flow Control (9600-8-N-1).")
#short-q(num: 2, q: "How many collision domains does an unmanaged 24-port Gigabit Ethernet switch create?", ans: "24 collision domains (one per active full-duplex port).")
#short-q(num: 3, q: "Which TIA/EIA pinout standard starts with White/Orange and Orange on pins 1 and 2?", ans: "TIA/EIA-568B.")
#short-q(num: 4, q: "What metric does an optical time-domain reflectometer (OTDR) measure?", ans: "Fiber link attenuation, reflectance, fusion splice loss, and exact distance to physical breaks.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which device breaks both collision domains and broadcast domains on every physical interface?", a: "Layer 2 Switch", b: "Ethernet Hub", c: "Network Router", d: "Wireless Access Point", ans: "C", expl: "Routers terminate Layer 2 broadcast domains and provide dedicated full-duplex collision domains per interface.")
#mcq(num: 2, q: "What color jacket conventionally identifies Single-Mode optical fiber patch cords?", a: "Aqua (50/125)", b: "Orange (62.5/125)", c: "Yellow (9/125)", d: "Violet (OM4)", ans: "C", expl: "Single-Mode fiber (OS1/OS2) is standardized with a bright yellow outer PVC/LSZH jacket.")
#mcq(num: 3, q: "What type of cable connects a Cisco router Gigabit interface directly to a laptop Ethernet port without Auto-MDIX?", a: "Straight-Through Cable", b: "Crossover Cable", c: "Rollover Cable", d: "Null Modem Cable", ans: "B", expl: "Router NICs and PC NICs transmit on pins 1/2 and receive on pins 3/6; a Crossover cable is required to align TX to RX.")
#mcq(num: 4, q: "Which optical transceiver form factor supports 100 Gbps Ethernet throughput using 4 parallel 25G channels?", a: "SFP", b: "SFP+", c: "XFP", d: "QSFP28", ans: "D", expl: "Quad Small Form-factor Pluggable 28 (QSFP28) aggregates four 25 Gbps electrical lanes to deliver 100 Gbps.")
#mcq(num: 5, q: "What symptom on a Cisco switch interface indicates that a copper cable is receiving excessive noise or faulty crimping?", a: "Input buffer drops", b: "Increasing CRC errors", c: "Gi0/1 line protocol down (disabled)", d: "High CPU utilization", ans: "B", expl: "Cyclic Redundancy Check (CRC) errors indicate corrupted frame check sequences (FCS) caused by physical noise or bad crimps.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The 100-Meter Physics Wall")[
      Ethernet's 100m limit is governed by the round-trip slot time in CSMA/CD to guarantee collision detection before transmission finishes!
    ]
  ],
  [
    #tech-spotlight-box(title: "Co-Packaged Optics (CPO)")[
      Modern 800G/1.6T AI switches mount lasers directly onto the silicon substrate next to the ASIC die to eliminate copper trace signal losses.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
'''

# CHAPTER 03
ch03 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 03 · IPV4 ADDRESSING & SUBNETTING]
= Chapter 3: IPv4 Masterclass, Subnetting & VLSM Cheat Sheet

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Mastery of IPv4 32-bit addressing: binary-to-decimal math, Classful architecture (A, B, C, D, E), RFC 1918 Private IP ranges, CIDR slash notation, the 256 Magic Number calculation formula, the instant /24 to /30 subnetting cheat sheet, and 5 step-by-step solved VLSM enterprise scenarios.
]

#v(2pt)

== 3.1 IPv4 32-Bit Structure & Classful Architecture
An IPv4 address consists of #hl[32 binary bits divided into four 8-bit octets], separated by periods (dotted-decimal notation, e.g., `192.168.1.1`).
- *Total Address Space:* $2^{32} = 4,294,967,296$ unique theoretical IP addresses.
- *Octet Binary Weightings (8-Bit Radix):* 128 · 64 · 32 · 16 · 8 · 4 · 2 · 1. Any decimal number 0 to 255 is formed by summing active bit values (e.g., $192 = 128 + 64$; $168 = 128 + 32 + 8$).
- *Historical Classful Boundaries:*
  - *Class A (1 to 126):* Default Mask `255.0.0.0` (/8). 126 Networks, $16,777,214$ hosts per net.
  - *Class B (128 to 191):* Default Mask `255.255.0.0` (/16). 16,384 Networks, 65,534 hosts per net.
  - *Class C (192 to 223):* Default Mask `255.255.255.0` (/24). 2,097,152 Networks, 254 hosts per net.
  - *Class D (224 to 239):* Reserved for Multicast (no host subnet masks).
  - *Class E (240 to 255):* Reserved for Experimental / Research purposes.

#v(2pt)

== 3.2 RFC 1918 Private IP Ranges & Special Reserved Addresses
#table(
  columns: (1fr, 1.4fr, 1.2fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Class*], [*RFC 1918 Private Address Block*], [*CIDR Prefix*], [*Enterprise Application*]),
  [Class A], [`10.0.0.0` – `10.255.255.255`], [`10.0.0.0/8`], [Large corporate enterprise networks, datacenter VPCs (16.7M IPs).],
  [Class B], [`172.16.0.0` – `172.31.255.255`], [`172.16.0.0/12`], [Mid-sized enterprise branches, university campuses (1M IPs).],
  [Class C], [`192.168.0.0` – `192.168.255.255`], [`192.168.0.0/16`], [SOHO, home Wi-Fi routers, small branch offices (65K IPs).],
  [Loopback], [`127.0.0.1` – `127.255.255.254`], [`127.0.0.0/8`], [Internal host TCP/IP stack diagnostic testing.],
  [APIPA], [`169.254.0.1` – `169.254.255.254`], [`169.254.0.0/16`], [Auto-assigned when host fails to reach DHCP server (Link-Local).]
)

#v(2pt)

== 3.3 CIDR Notation & Subnet Mask Bit Mechanics
In 1993, RFC 1519 introduced *Classless Inter-Domain Routing (CIDR)* to halt address exhaustion:
- *Subnet Mask:* A 32-bit string of continuous binary `1`s followed by continuous `0`s. Binary `1`s identify the #hl[Network ID bits]; binary `0`s identify the #hl[Host ID bits].
- *The ANDing Process:* Routers determine if a destination IP is local or remote by performing a bitwise Boolean AND between the destination IP and the subnet mask ($1 text("AND") 1 = 1$; any $text("AND") 0 = 0$).
- *Host Formula:* $text("Usable Hosts") = 2^H - 2$ (where $H$ is the number of Host bits `0`). The subtraction of 2 accounts for the *Network ID* (all host bits 0) and the *Directed Broadcast Address* (all host bits 1).

#pagebreak()

== 3.4 The RTechLab "Magic Number" Subnetting Formula
Subnetting can be solved mentally in under 10 seconds without converting to binary using the #hl[Magic Number rule]:
- *Step 1: Identify the Interesting Octet.* Look at the subnet mask. The octet that contains a number other than `255` or `0` is the *Interesting Octet*. (For `/24` to `/30`, the interesting octet is the 4th octet).
- *Step 2: Calculate the Magic Number (Block Size):*
  $ "Magic Number" = 256 - "Interesting Octet Value" $
- *Step 3: Multiples of Magic Number.* Subnet Network IDs always start at `0` and increment by the Magic Number: $0, M, 2M, 3M, dots$
- *Step 4: Determine Boundaries.* For any given subnet:
  - *Network ID:* The multiple of $M$ that is less than or equal to the host IP.
  - *Next Subnet Network ID:* The subsequent multiple of $M$.
  - *Broadcast Address:* One less than the next subnet Network ID.
  - *Usable Host Range:* From `Network ID + 1` to `Broadcast ID - 1`.

#v(2pt)

== 3.5 The CCNA Master Subnetting Cheat Sheet (/24 to /30)
#table(
  columns: (0.7fr, 1.4fr, 0.9fr, 1fr, 1.1fr, 1fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*CIDR*], [*Subnet Mask*], [*Magic No*], [*Total IPs*], [*Usable Hosts*], [*Application*]),
  [/24], [`255.255.255.0`], [256], [256], [254], [Standard LAN subnet],
  [/25], [`255.255.255.128`], [128], [128], [126], [Mid-sized department],
  [/26], [`255.255.255.192`], [64], [64], [62], [Branch office floor],
  [/27], [`255.255.255.224`], [32], [32], [30], [Server farm / DMZ],
  [/28], [`255.255.255.240`], [16], [16], [14], [Management VLAN],
  [/29], [`255.255.255.248`], [8], [8], [6], [Public WAN gateway pool],
  [/30], [`255.255.255.252`], [4], [4], [#hl[2]], [Point-to-Point WAN link],
  [/31], [`255.255.255.254`], [2], [2], [2 (RFC 3021)], [P2P Links (No broadcast)],
  [/32], [`255.255.255.255`], [1], [1], [1 (Host)], [Router Loopback interface]
)

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg",
  caption: "Figure 3.1: Enterprise Managed Switch terminating multiple routed /24 and /27 VLAN subnets.",
  height: 52pt
)

#v(2pt)

== 3.6 Variable Length Subnet Masking (VLSM) Strategy
VLSM allows an engineer to allocate different subnet masks to different segments of the same network address space, eliminating wasted host addresses.
- *The Golden Rule of VLSM:* Always sort requirements in #hl[descending order of required host count] (Largest to Smallest) before allocating addresses!
- If you allocate small subnets first, larger contiguous blocks cannot be formed without overlapping.

#pagebreak()

== 3.7 Solved VLSM Enterprise Case Study
*Scenario:* Design subnets for enterprise network `192.168.10.0/24` with the following departmental requirements:
1. Sales Department: 55 Hosts $|$ 2. Engineering Lab: 28 Hosts $|$ 3. Management: 12 Hosts $|$ 4. Router P2P Link 1: 2 Hosts $|$ 5. Router P2P Link 2: 2 Hosts.

#v(1.5pt)

#table(
  columns: (1fr, 0.9fr, 0.9fr, 1.2fr, 1.1fr, 1.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.5pt,
  table.header([*Department*], [*Needed*], [*Mask*], [*Network ID*], [*Usable Range*], [*Broadcast ID*]),
  [1. Sales], [55], [/26 (62)], [`192.168.10.0`], [`.1` – `.62`], [`192.168.10.63`],
  [2. Engineering], [28], [/27 (30)], [`192.168.10.64`], [`.65` – `.94`], [`192.168.10.95`],
  [3. Management], [12], [/28 (14)], [`192.168.10.96`], [`.97` – `.110`], [`192.168.10.111`],
  [4. P2P Link 1], [2], [/30 (2)], [`192.168.10.112`], [`.113` – `.114`], [`192.168.10.115`],
  [5. P2P Link 2], [2], [/30 (2)], [`192.168.10.116`], [`.117` – `.118`], [`192.168.10.119`],
  [Unallocated], [Free], [/25+], [`192.168.10.120`], [Free for future growth], [`192.168.10.255`]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "Magic Number Worked Example")[
      *Target IP:* `172.16.45.195/27`\
      - /27 mask = `255.255.255.224`\
      - Interesting Octet = 4th octet (224)\
      - Magic Number = $256 - 224 = 32$\
      - Multiples of 32: $0, 32, 64, 96, 128, 160, 192, 224$\
      - 195 lies between 192 and 224.\
      - *Network ID:* `172.16.45.192`\
      - *Broadcast ID:* `172.16.45.223`\
      - *Usable Range:* `172.16.45.193` to `.222`
    ]
  ],
  [
    #concept-box(title: "Subnetting Formula Proof")[
      *Number of Subnets created:* $2^S$\
      (where $S$ is borrowed subnet bits `1`)\
      *Number of Usable Hosts:* $2^H - 2$\
      (where $H$ is remaining host bits `0`)\
      *Example:* Borrowing 3 bits from /24 yields a /27 subnet:\
      - Subnets = $2^3 = 8$ subnets\
      - Hosts per net = $2^5 - 2 = 30$ hosts.
    ]
  ]
)

#v(2pt)

== 3.8 Practical Cisco IOS Interface Addressing Commands
To assign IPv4 addresses and verify subnetting on Cisco routers:
```bash
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ip address 192.168.10.1 255.255.255.192
Router(config-if)# no shutdown
Router(config-if)# exit
Router# show ip interface brief | include up
```

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why do we subtract 2 in the host formula (2^H - 2)?", a: "The first address in any subnet represents the Network ID (all host bits 0) and the last address represents the Directed Broadcast Address (all host bits 1). Neither can be assigned to an individual host NIC.")
#faq-item(q: "What is the Magic Number for a /29 subnet mask?", a: "A /29 mask has 29 ones, making the 4th octet 248. The Magic Number is 256 - 248 = 8. Each subnet increments by 8, yielding 6 usable hosts.")
#faq-item(q: "Can two different departments in an enterprise use the same IP address range?", a: "Only if they reside in isolated VRF (Virtual Routing and Forwarding) instances or separate private NAT domains. Within a flat routed campus, duplicate IP addresses cause ARP conflicts and routing blackholes.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Identify the RFC standard that defines Private IPv4 address blocks.", ans: "RFC 1918.")
#short-q(num: 2, q: "What is the network ID and broadcast ID of host 10.1.50.85/26?", ans: "Network ID: 10.1.50.64; Broadcast ID: 10.1.50.127 (Block size 64).")
#short-q(num: 3, q: "How many usable host IP addresses are provided by a /30 subnet?", ans: "Exactly 2 usable hosts (2^2 - 2 = 2).")
#short-q(num: 4, q: "What special address range is represented by 169.254.0.0/16?", ans: "Automatic Private IP Addressing (APIPA) link-local range.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which subnet mask provides at least 50 usable host IP addresses while wasting the minimum number of addresses?", a: "255.255.255.128 (/25)", b: "255.255.255.192 (/26)", c: "255.255.255.224 (/27)", d: "255.255.255.240 (/28)", ans: "B", expl: "/26 provides 2^6 - 2 = 62 usable hosts, which satisfies the 50-host requirement with minimal waste. /27 only provides 30 hosts.")
#mcq(num: 2, q: "What is the Broadcast Address for the subnet containing host 192.168.1.135 with subnet mask 255.255.255.224?", a: "192.168.1.143", b: "192.168.1.159", c: "192.168.1.191", d: "192.168.1.255", ans: "B", expl: "Block size is 32 (256 - 224). Subnet boundaries are 0, 32, 64, 96, 128, 160. Host 135 is in subnet 128. Broadcast is 159.")
#mcq(num: 3, q: "Which address is a valid RFC 1918 private IPv4 address?", a: "172.32.10.1", b: "192.169.1.5", c: "172.25.100.50", d: "11.0.0.1", ans: "C", expl: "Class B private range spans 172.16.0.0 through 172.31.255.255. 172.25.100.50 falls squarely within this range.")
#mcq(num: 4, q: "When performing Variable Length Subnet Masking (VLSM), what is the first rule of allocation?", a: "Allocate point-to-point links first", b: "Sort departments from largest host requirement to smallest", c: "Assign /24 masks to all interfaces", d: "Convert all IP addresses to hexadecimal", ans: "B", expl: "VLSM requires assigning the largest subnets first to prevent address fragmentation and overlapping subnet blocks.")
#mcq(num: 5, q: "What is the purpose of the bitwise Boolean AND operation performed by a router during packet forwarding?", a: "To calculate packet checksums", b: "To determine if the destination IP is on the local subnet or requires a default gateway", c: "To encrypt the payload", d: "To negotiate port speed", ans: "B", expl: "The router ANDs the destination IP with the subnet mask to determine the target Network ID for routing table lookup.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The RFC 3021 /31 Breakthrough")[
      RFC 3021 allows /31 subnets (2 addresses, no network or broadcast address) strictly on point-to-point links, saving millions of IPv4 addresses worldwide!
    ]
  ],
  [
    #tech-spotlight-box(title: "Carrier-Grade NAT (CGNAT)")[
      ISPs assign RFC 6598 addresses (`100.64.0.0/10`) to home routers to share a single public IPv4 address across thousands of mobile subscribers.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
'''

# CHAPTER 04
ch04 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 04 · IPV6 ARCHITECTURE & TRANSITION]
= Chapter 4: IPv6 Complete Architecture & Transition

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Comprehensive IPv6 architecture: 128-bit hexadecimal addressing, RFC 5952 compression rules, address classifications (GUA, LLA, ULA, Multicast), EUI-64 MAC address conversion algorithm, SLAAC Neighbor Discovery Protocol (NDP), stateful DHCPv6, and dual-stack coexistence mechanisms.
]

#v(2pt)

== 4.1 The Impetus for IPv6 & The 128-Bit Address Space
The exponential growth of the global Internet, mobile smartphones, and IoT devices rapidly exhausted the 4.3 billion IPv4 address pool.
- *Address Space Scale:* IPv6 expands address length from 32 bits to #hl[128 bits], yielding $2^{128} approx 3.4 times 10^{38}$ unique IP addresses (340 undecillion addresses)—sufficient to assign millions of IPs to every square millimeter of the Earth's surface.
- *Hexadecimal Representation:* An IPv6 address is written as 32 hexadecimal digits grouped into #hl[8 hextets of 4 hex digits each], separated by colons (e.g., `2001:0db8:85a3:0000:0000:8a2e:0370:7334`). Each hex digit represents 4 binary bits (nibble); each hextet represents 16 bits ($8 times 16 = 128$ bits).

#v(2pt)

== 4.2 RFC 5952 Address Compression Rules
To simplify writing and reading 128-bit addresses, two mandatory compression rules apply:
- *Rule 1: Omission of Leading Zeros:* Any leading zeros within a 16-bit hextet can be dropped. Trailing zeros must NOT be omitted. (E.g., `:0042:` becomes `:42:`; `:0000:` becomes `:0:`).
- *Rule 2: Double Colon (`::`) for Contiguous Zeros:* A contiguous sequence of one or more all-zero hextets can be replaced with a double colon (`::`). #hl[This rule can only be applied ONCE per address] to prevent ambiguous expansion.
  - *Example:* `2001:0db8:0000:0000:0000:0000:1428:57ab` $arrow$ #hl[`2001:db8::1428:57ab`]
  - *Loopback Address:* `0000:0000:0000:0000:0000:0000:0000:0001` $arrow$ #hl[`::1`]
  - *Unspecified Default Route:* `0000:0000:0000:0000:0000:0000:0000:0000` $arrow$ #hl[`::`]

#v(2pt)

== 4.3 IPv6 Address Scope & Classification Matrix
#table(
  columns: (1.2fr, 1.2fr, 1.2fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Address Type*], [*Prefix / Range*], [*Scope*], [*Enterprise Functional Role*]),
  [Global Unicast (GUA)], [`2000::/3` (`2000` to `3FFF`)], [Public Internet], [Globally routable public addresses assigned by RIRs. Equivalent to public IPv4.],
  [Link-Local (LLA)], [`fe80::/10` (`fe80` to `febf`)], [Local Physical Link], [Mandatory on every IPv6 interface; used for routing neighbor discovery, next-hops.],
  [Unique Local (ULA)], [`fc00::/7` (commonly `fd00::`)], [Internal Enterprise], [Private enterprise routing (RFC 4193). Equivalent to RFC 1918 private IPv4.],
  [Multicast], [`ff00::/8`], [Variable Scope], [Delivers packets to multiple nodes. #hl[Replaces all IPv4 broadcast traffic!]],
  [Loopback], [`::1/128`], [Local Host], [Internal stack verification. Equivalent to `127.0.0.1` in IPv4.]
)

#pagebreak()

== 4.4 The Modified EUI-64 Auto-Configuration Algorithm
When configuring an interface IPv6 address, Cisco routers can automatically construct a 64-bit Interface Identifier from the device's physical 48-bit MAC address using the #hl[Modified EUI-64 algorithm]:
- *Step 1: Split the 48-bit MAC Address.* Divide the MAC into two 24-bit halves (OUI and NIC identifier). E.g., `00:1A:2B:3C:4D:5E` splits into `001A:2B` and `3C:4D5E`.
- *Step 2: Insert Hex `FFFE`.* Insert the 16-bit hex constant `FFFE` between the two halves: `001A:2BFF:FE3C:4D5E`.
- *Step 3: Invert the 7th Bit (U/L Bit).* Convert the first byte (`00` hex = `0000 0000` binary) and invert the 7th bit (Universal/Local flag, bit position 2 from right in the byte): `0000 0010` binary = `02` hex.
- *Resulting EUI-64 Identifier:* #hl[`021a:2bff:fe3c:4d5e`]. Appended to a `/64` prefix, it forms a complete 128-bit IPv6 address!

#v(2pt)

== 4.5 SLAAC vs DHCPv6 Address Allocation Mechanics
IPv6 endpoints acquire addresses through two primary stateless and stateful mechanisms:
1. *Stateless Address Autoconfiguration (SLAAC):*
   - Host sends an ICMPv6 *Router Solicitation (RS)* multicast to `ff02::2` (All Routers).
   - Local Cisco router responds with an ICMPv6 *Router Advertisement (RA)* to `ff02::1` (All Nodes), providing the `/64` network prefix and default gateway address.
   - Host generates its own 64-bit Interface ID (via random privacy extension or EUI-64) and performs *Duplicate Address Detection (DAD)* via Neighbor Solicitation (NS).
2. *Stateful DHCPv6:* Router sets Managed Configuration (`M-flag = 1`) in the RA; client queries a dedicated DHCPv6 server for IP lease, DNS server, and domain search lists.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg",
  caption: "Figure 4.1: Cloud Enterprise Backbone running native Dual-Stack IPv4/IPv6 BGP routing.",
  height: 52pt
)

#v(2pt)

== 4.6 Important Well-Known IPv6 Multicast Addresses
Because IPv6 completely eliminates broadcasts, essential network services utilize reserved multicast groups:
- `ff02::1` — *All-Nodes Multicast Scope:* Reaches every IPv6-enabled host on the local physical link.
- `ff02::2` — *All-Routers Multicast Scope:* Reaches every IPv6 router on the local link.
- `ff02::5` — *OSPFv3 All OSPF Routers:* Reaches all OSPFv3 speaking routers.
- `ff02::6` — *OSPFv3 Designated Routers:* Reaches OSPFv3 DR and BDR routers.
- `ff02::1:ffxx:xxxx` — *Solicited-Node Multicast:* Used for ARP replacement (NDP address resolution).

#pagebreak()

== 4.7 IPv4 to IPv6 Migration & Coexistence Strategies
Because immediate worldwide migration is impossible, enterprises deploy three standard transition mechanisms:
- *Dual-Stack Architecture:* Routers, switches, and endpoints run both IPv4 and IPv6 protocol stacks concurrently. Routing tables maintain independent IPv4 and IPv6 routes. The industry-recommended standard.
- *Tunneling (6to4, GRE, IPsec):* Encapsulates native IPv6 packets inside standard IPv4 packet headers to traverse legacy IPv4-only ISP backbones.
- *Translation (NAT64 / DNS64):* Translates IPv6-only client packets into IPv4 packets at the border firewall, allowing IPv6 devices to access legacy IPv4-only web servers.

#v(2pt)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Feature*], [*IPv4*], [*IPv6*], [*Architectural Improvement*]),
  [Address Size], [32 Bits (4 Octets)], [128 Bits (8 Hextets)], [Practically infinite address space; eliminates NAT requirements.],
  [Header Format], [Variable (20 to 60 bytes)], [Fixed 40 Bytes], [Hardware routers process fixed headers much faster in ASICs.],
  [Broadcast], [Broadly used (ARP, DHCP)], [#hl[Completely Eliminated]], [Replaced with efficient Multicast and Anycast.],
  [Address Resolution], [Broadcast ARP (`0806`)], [ICMPv6 NDP (Solicited-Node)], [Prevents switch flooding and host CPU interruptions.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "The Fixed 40-Byte IPv6 Header")[
      Unlike IPv4's variable-length header with optional fields, IPv6 features a strictly #hl[fixed 40-byte base header] consisting of: Version (4b), Traffic Class (8b), Flow Label (20b), Payload Length (16b), Next Header (8b), Hop Limit (8b), Source IP (128b), and Destination IP (128b). Optional extensions are chained via Next Header pointers.
    ]
  ],
  [
    #concept-box(title: "IPv6 Unicast Routing Activation")[
      By default, Cisco routers do NOT route IPv6 packets between interfaces! An engineer must explicitly enable the IPv6 routing engine in global configuration mode:\
      `Router(config)# ipv6 unicast-routing`\
      Without this command, the router acts merely as an IPv6 host and will not forward IPv6 traffic.
    ]
  ]
)

#v(2pt)

== 4.8 Cisco IOS IPv6 Production Configuration Template
```bash
Router(config)# ipv6 unicast-routing
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ipv6 address 2001:db8:acad:1::1/64
Router(config-if)# ipv6 address fe80::1 link-local
Router(config-if)# no shutdown
Router# show ipv6 interface brief
Router# show ipv6 route
```

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why can the double colon (::) only be used once in an IPv6 address?", a: "If used multiple times, it is mathematically impossible to determine how many all-zero hextets are represented by each double colon, creating address ambiguity.")
#faq-item(q: "What is the function of an IPv6 Link-Local Address (LLA)?", a: "Link-Local addresses (fe80::/10) are used exclusively for communication on the local physical link, including next-hop routing table entries, OSPFv3 neighbor adjacencies, and NDP discovery.")
#faq-item(q: "How does IPv6 discover MAC addresses without the ARP protocol?", a: "IPv6 replaces broadcast ARP with Neighbor Discovery Protocol (NDP) using ICMPv6 Neighbor Solicitation (NS) sent to a targeted Solicited-Node Multicast address.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Identify the starting hex prefix range for IPv6 Global Unicast Addresses (GUA).", ans: "2000::/3 (Hexadecimal range 2000 to 3FFF).")
#short-q(num: 2, q: "What 16-bit hex value is inserted into a MAC address during EUI-64 generation?", ans: "0xFFFE (inserted directly between the 3rd and 4th bytes of the MAC).")
#short-q(num: 3, q: "Which Cisco global configuration command is mandatory to enable IPv6 routing?", ans: "ipv6 unicast-routing.")
#short-q(num: 4, q: "What multicast address reaches all IPv6-enabled routers on the local link?", ans: "ff02::2 (All-Routers link-local multicast).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which compressed IPv6 address correctly represents 2001:0000:0000:00ab:0000:0000:0000:0001?", a: "2001::ab::1", b: "2001:0:0:ab::1", c: "2001::ab:0:0:0:1", d: "2001:00:00:ab::1", ans: "B", expl: "Double colon can only be used once; RFC 5952 dictates applying '::' to the longest run of zeros (the 3 zeros at the end), leaving the first zeros as single :0:0:.")
#mcq(num: 2, q: "What is the primary function of the IPv6 Link-Local address fe80::/10?", a: "Routing packets across the public Internet", b: "Local segment communication and dynamic routing protocol neighbor discovery", c: "Providing private enterprise addressing across WANs", d: "Configuring web server loopback interfaces", ans: "B", expl: "Link-Local addresses are mandatory and confined to a single link; they serve as next-hops for dynamic routing protocols.")
#mcq(num: 3, q: "What happens to the 7th bit of the MAC address during EUI-64 address generation?", a: "It is forced to binary 0", b: "It is inverted (toggled from 0 to 1 or 1 to 0)", c: "It is shifted 8 bits left", d: "It is discarded", ans: "B", expl: "Modified EUI-64 inverts the 7th bit (Universal/Local flag) of the first byte of the MAC address.")
#mcq(num: 4, q: "Which ICMPv6 message does a client broadcast/multicast when searching for an IPv6 router via SLAAC?", a: "Router Advertisement (RA)", b: "Router Solicitation (RS)", c: "Neighbor Advertisement (NA)", d: "Echo Request", ans: "B", expl: "The client emits an ICMPv6 Router Solicitation (RS) to multicast ff02::2 requesting network prefix parameters.")
#mcq(num: 5, q: "What is the total size of the base IPv6 packet header?", a: "20 Bytes", b: "Strictly 40 Bytes", c: "Variable between 20 and 60 bytes", d: "64 Bytes", ans: "B", expl: "IPv6 features a fixed 40-byte base header, accelerating ASIC routing table lookups compared to variable IPv4 headers.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The 340 Undecillion Universe")[
      340,282,366,920,938,463,463,374,607,431,768,211,456 addresses! If every atom on Earth had an IP address, we would still have billions left over!
    ]
  ],
  [
    #tech-spotlight-box(title: "IPv6-Only Cloud Datacenters")[
      Major tech enterprises (Meta, Microsoft, AWS) operate their internal datacenter spine-leaf fabrics purely on IPv6-only addressing to eliminate NAT complexity.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
'''

# CHAPTER 05
ch05 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 05 · CISCO IOS & BOOT SEQUENCE]
= Chapter 5: Cisco IOS Architecture, Memories & Boot Flow

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Internal hardware architecture of Cisco routing and switching engines: CPU, system bus, ROM, Flash, NVRAM, RAM, the 5-stage Cisco boot sequence, Configuration Register bit patterns (0x2102 vs 0x2142), ROMMON emergency recovery, TFTP rescue, and switch password recovery procedures.
]

#v(2pt)

== 5.1 Cisco Hardware Architecture & Memory Subsystems
A Cisco enterprise router is a specialized high-reliability computer executing Cisco Internetwork Operating System (IOS). Its operational state relies on four distinct memory architectures:
- *ROM (Read-Only Memory):* Non-volatile firmware chip. Stores:
  1. *Power-On Self-Test (POST):* Diagnostic microcode testing CPU, memory, and interface circuitry.
  2. *Bootstrap Loader:* Locates and transfers the Cisco IOS software image into RAM.
  3. *ROMMON (ROM Monitor):* Low-level mini-operating system invoked during corrupt flash or password recovery.
- *Flash Memory:* Electrically Erasable Programmable ROM (EEPROM / NAND Flash). Non-volatile; stores the #hl[Cisco IOS system image (`.bin` file)] and system crash dumps. Retains files across power cycles.
- *NVRAM (Non-Volatile RAM):* Battery/capacitor-backed memory. Stores the #hl[`startup-config` file] and the 16-bit software *Configuration Register*. Fast and persistent.
- *RAM (Random Access Memory / DRAM):* Volatile working memory. Stores the active #hl[`running-config`], routing tables, ARP cache, interface packet buffers, and running IOS execution space. Erased during reboot.

#v(2pt)

== 5.2 Cisco Memory Types Comparison Matrix
#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Memory Type*], [*Persistence*], [*Primary Contents*], [*Engineering Operational Role*]),
  [ROM], [Non-Volatile], [POST, Bootstrap, ROMMON], [Hardcoded factory microcode; executes hardware diagnostics on cold start.],
  [Flash], [Non-Volatile], [Cisco IOS (`c2900-universalk9.bin`)], [Permanent OS storage. Can hold multiple IOS images and web files.],
  [NVRAM], [Non-Volatile], [`startup-config`, Config-Register], [Retains saved device configurations and boot register parameters.],
  [RAM], [#hl[Volatile]], [`running-config`, Routing Tables], [High-speed working execution space; changes take effect here instantly.]
)

#v(2pt)

== 5.3 The 5-Stage Cisco Router Boot Sequence
When an engineer toggles the power switch on a Cisco router, it executes five sequential operational phases:
1. *Stage 1: POST (Power-On Self-Test):* Executes diagnostic microcode from ROM to verify CPU, DRAM, and physical bus controller integrity.
2. *Stage 2: Bootstrap Execution:* Bootstrap program initializes CPU registers and checks the *Configuration Register* in NVRAM.
3. *Stage 3: Locate the Cisco IOS Image:* Bootstrap searches for the IOS `.bin` image based on boot system commands:
   - *Primary:* Flash memory file system (`flash:`).
   - *Secondary:* TFTP network server across Ethernet.
   - *Fallback:* If no valid image is found, system drops to *ROMMON mode* (`rommon 1 >`).
4. *Stage 4: Load IOS into RAM:* The decompressed IOS image is transferred into high-speed system RAM; kernel takes control.
5. *Stage 5: Locate & Apply Configuration:* Bootstrap checks Configuration Register:
   - If `0x2102`: Loads `startup-config` from NVRAM into RAM as `running-config`.
   - If `0x2142`: Ignores NVRAM; launches interactive *Setup Dialog Wizard* (`Would you like to enter initial configuration dialog? [yes/no]:`).

#pagebreak()

== 5.4 The Configuration Register Architecture
The Configuration Register is a 16-bit hex register stored in NVRAM that controls how the router boots:
- *Bit 6 (`0x0040`):* Ignore NVRAM bit. When set to `1`, router bypasses `startup-config` during boot.
- *Bits 0–3 (Boot Field):*
  - `0x0` (Bit 0): Boots directly into ROMMON mode for maintenance.
  - `0x1` (Bit 1): Boots mini-IOS boot image from ROM.
  - `0x2` to `0xF` (Bits 2–15): Normal boot; executes `boot system` commands or boots first file in Flash.
- *Key Configuration Register Values:*
  - #hl[`0x2102`]: Normal production boot (reads NVRAM, boots from Flash, 9600 console baud rate).
  - #hl[`0x2142`]: Password recovery boot (ignores NVRAM startup-config, boots from Flash).

#v(2pt)

== 5.5 Step-by-Step Cisco Router Password Recovery Procedure
When administrative passwords are lost, an engineer resets credentials without losing the original configuration:
1. Connect laptop via serial console cable (9600-8-N-1).
2. Power cycle router; within 60 seconds of boot, send a #hl[Break Signal] (Ctrl+Break in PuTTY) to interrupt boot.
3. Router enters ROMMON mode prompt: `rommon 1 >`
4. Change config register to ignore NVRAM: `rommon 1 > confreg 0x2142`
5. Reset the router: `rommon 2 > reset`
6. Router boots to setup wizard; type `no` to enter user exec mode: `Router>`
7. Enter privileged exec: `Router> enable` (no password requested!).
8. #hl[CRITICAL STEP: Copy startup-config to running-config] to recover configurations without wiping:
   `Router# copy startup-config running-config`
9. Reconfigure admin password:
   `Router(config)# enable secret Cisco123!`
   `Router(config)# username admin privilege 15 secret CiscoAdmin2027`
10. #hl[RESET REGISTER TO NORMAL]:
    `Router(config)# config-register 0x2102`
11. Save modified config: `Router# copy running-config startup-config`

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/digital-multimeter-testing.jpg",
  caption: "Figure 5.1: Benchtop Diagnostic testing of Cisco router internal power rails during hardware triage.",
  height: 52pt
)

#v(2pt)

== 5.6 Emergency TFTP Rescue in ROMMON (`tftpdnld`)
If an engineer accidentally formats Flash (`delete flash:*`), the router cannot boot into IOS. It must be rescued via ROMMON:
```bash
rommon 1 > IP_ADDRESS=192.168.1.2
rommon 2 > IP_SUBNET_MASK=255.255.255.0
rommon 3 > DEFAULT_GATEWAY=192.168.1.1
rommon 4 > TFTP_SERVER=192.168.1.100
rommon 5 > TFTP_FILE=c2900-universalk9-mz.SPA.157-3.M3.bin
rommon 6 > tftpdnld
rommon 7 > boot flash:c2900-universalk9-mz.SPA.157-3.M3.bin
```

#pagebreak()

== 5.7 Cisco Catalyst Switch Password Recovery Architecture
Cisco Catalyst switches lack a ROMMON break key; instead, they feature a physical #hl[Mode Button] on the front panel:
1. Disconnect switch power cord.
2. Depress and hold the front-panel *Mode Button* while reconnecting the power cord.
3. Release the Mode button after the `SYST` LED blinks amber and turns solid green (approx 15 seconds).
4. Terminal displays switch bootloader prompt: `switch:`
5. Initialize flash file system: `switch: flash_init`
6. Load helper commands: `switch: load_helper`
7. In Catalyst switches, configuration is stored as a file in Flash (`config.text`). Rename it to bypass passwords:
   `switch: rename flash:config.text flash:config.old`
8. Boot the switch: `switch: boot`
9. Enter privileged mode (`enable`), restore file name, and change credentials:
   `Switch# rename flash:config.old flash:config.text`
   `Switch# copy flash:config.text system:running-config`
   `Switch(config)# enable secret CiscoSwitch2027`
   `Switch# copy running-config startup-config`

#v(2pt)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Operation*], [*Cisco Router Command*], [*Cisco Switch Command*], [*Operational Target*]),
  [Save Config], [`copy run start`], [`copy run start`], [Writes volatile RAM config to persistent NVRAM/Flash.],
  [Erase Config], [`erase startup-config`], [`write erase`], [Deletes NVRAM startup config; defaults device on reboot.],
  [View Image Files], [`dir flash:`], [`dir flash:`], [Inspects stored IOS `.bin` images and file sizes in Flash.],
  [Check Boot Reg], [`show version`], [`show boot`], [Displays active Configuration Register (e.g. 0x2102).]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "The Golden Rule of Password Recovery")[
      In Step 8 of password recovery, NEVER run `copy running-config startup-config` before loading the original configuration! Doing so overwrites NVRAM with a blank config, destroying all production IP addresses, VLANs, and routing configs! Always run `copy startup-config running-config` first!
    ]
  ],
  [
    #concept-box(title: "Config Register Bit 6 Math")[
      Hex `0x2102` = `0010 0001 0000 0010` binary.\
      Hex `0x2142` = `0010 0001 0100 0010` binary.\
      Notice bit 6 (value 4 in the third hex digit) is flipped to `1`. Bit 6 signals the Bootstrap loader to ignore NVRAM during boot!
    ]
  ]
)

#v(2pt)

== 5.8 Essential Diagnostic Verification Commands
- `show version` — Identifies IOS software release, system uptime, memory capacities (RAM/Flash), and active Configuration Register.
- `show running-config` — Dumps active configuration in DRAM.
- `show startup-config` — Displays saved configuration in NVRAM.
- `show file systems` — Lists available storage prefixes (`flash:`, `nvram:`, `system:`).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What is the difference between copy running-config startup-config and write memory?", a: "Both execute the identical operation: writing active RAM configurations to persistent NVRAM. 'copy run start' is the modern Cisco standard syntax; 'write memory' (wr) is legacy syntax preserved for backward compatibility.")
#faq-item(q: "Why did my router boot into the Initial Configuration Dialog wizard after rebooting?", a: "This occurs if NVRAM startup-config is empty or deleted, or if the Configuration Register is set to 0x2142 (bypassing NVRAM).")
#faq-item(q: "How can I test whether a Cisco router is experiencing memory corruption?", a: "Inspect 'show version' for unexpected crash reasons (bus error, parity error) and verify flash checksum integrity via 'verify /md5 flash:[ios-image.bin]'.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which memory component in a Cisco router is volatile and loses contents on power loss?", ans: "RAM (Random Access Memory / DRAM).")
#short-q(num: 2, q: "What Configuration Register value bypasses NVRAM during router startup?", ans: "0x2142.")
#short-q(num: 3, q: "Name the file in Flash where Cisco Catalyst switches store startup configurations.", ans: "flash:config.text.")
#short-q(num: 4, q: "Which terminal keystroke sends a break sequence in PuTTY to interrupt Cisco boot?", ans: "Control + Break (Ctrl+Break).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Where does a Cisco router store its permanent Cisco IOS operating system binary file (.bin)?", a: "NVRAM", b: "RAM", c: "Flash Memory", d: "ROM", ans: "C", expl: "Flash memory is non-volatile EEPROM/NAND storage used to hold one or more Cisco IOS software images.")
#mcq(num: 2, q: "During router password recovery, which command is critical to avoid wiping existing interface and routing configurations?", a: "copy running-config startup-config", b: "copy startup-config running-config", c: "erase startup-config", d: "write erase", ans: "B", expl: "Copying startup-config into running-config merges the saved production config into RAM so passwords can be safely updated without data loss.")
#mcq(num: 3, q: "What is the default production Configuration Register value for Cisco routers?", a: "0x2142", b: "0x2102", c: "0x2101", d: "0x2000", ans: "B", expl: "0x2102 tells the router to boot normally: read NVRAM startup-config, load IOS from Flash, and use 9600 console baud.")
#mcq(num: 4, q: "How is password recovery initiated on a Cisco Catalyst switch that lacks a serial break function?", a: "By typing break in terminal", b: "By depressing and holding the physical Mode button during power-on", c: "By flipping dip-switches on the back panel", d: "By shorting pins 1 and 8 on console", ans: "B", expl: "Holding the front Mode button during switch power-on halts bootloader execution at the 'switch:' prompt.")
#mcq(num: 5, q: "If a Cisco router fails to find a valid IOS image in Flash or on a TFTP server, which mode does it enter?", a: "Setup Dialog Wizard", b: "User Exec Mode (Router>)", c: "ROMMON Mode (rommon 1 >)", d: "Kernel Panic Shutdown", ans: "C", expl: "If no bootable IOS image is discovered, the Bootstrap loader drops the router into low-level ROM Monitor (ROMMON) mode.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The NVRAM Battery Lifecycle")[
      NVRAM relies on a tiny lithium backup cell on the motherboard. If the cell dies after 10+ years, the router boots cleanly into the setup wizard every cold reboot!
    ]
  ],
  [
    #tech-spotlight-box(title: "Cisco IOS-XE Linux Underlay")[
      Modern Cisco Catalyst 9000 switches run Cisco IOS-XE, which executes the classic IOS daemon as a containerized process inside an underlying CentOS/Yocto Linux kernel!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
'''

with open(os.path.join(ENG_DIR, "chapter-02.typ"), "w", encoding="utf-8") as f:
    f.write(ch02)
with open(os.path.join(ENG_DIR, "chapter-03.typ"), "w", encoding="utf-8") as f:
    f.write(ch03)
with open(os.path.join(ENG_DIR, "chapter-04.typ"), "w", encoding="utf-8") as f:
    f.write(ch04)
with open(os.path.join(ENG_DIR, "chapter-05.typ"), "w", encoding="utf-8") as f:
    f.write(ch05)

print("[OK] Chapters 02, 03, 04, 05 English successfully written.")
