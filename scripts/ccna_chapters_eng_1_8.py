# -*- coding: utf-8 -*-
"""
RTechLab CCNA 200-301 Master Curriculum — English Chapters 01 to 08
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
"""

chapters_eng_1_8 = {}

# =============================================================================
# CHAPTER 01: Modern Enterprise Network Architectures & Digital Topologies
# =============================================================================
chapters_eng_1_8[1] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 01 · NETWORK ARCHITECTURE & TOPOLOGIES]
= Chapter 1: Enterprise Network Architecture & Topologies

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Enterprise network models, three-tier hierarchical architecture, two-tier collapsed core, modern datacenter spine-and-leaf designs, cloud topologies, WAN connectivity options, and foundational physical versus logical network topologies.
]

#v(2pt)

== 1.1 The Cisco Three-Tier Hierarchical Model
Modern corporate networks require high availability, deterministic latency, and modular scalability. To prevent unmanageable spaghetti cabling and broadcast storms, Cisco established the #hl[Three-Tier Hierarchical Architecture]:
- *Core Layer (Network Backbone):* The high-speed switching backbone of the campus. Its singular objective is to switch packets as fast as possible between distribution blocks and the enterprise edge. #hl[Never apply packet filtering, ACLs, QoS policing, or VLAN routing at the core], as inspection overhead induces latency and jitter. Core switches utilize redundant power supplies, hot-swappable supervisor engines, and 40G/100G optical links.
- *Distribution Layer (Policy Boundary):* The intelligence boundary between access and core. It terminates Layer 2 VLANs, routes between subnets (Inter-VLAN routing), enforces security access control lists (ACLs), aggregates dual-homed access switches, and manages First Hop Redundancy Protocols (HSRP/VRRP).
- *Access Layer (Workgroup Edge):* Where end devices (workstations, IP phones, Wi-Fi 6/7 Access Points, IoT sensors) physically interface with the network. Provides port security, 802.1X network access control, Power over Ethernet (PoE/PoE+), and initial QoS packet classification.

#v(2pt)

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Hierarchical Layer*], [*Primary Mission & Role*], [*Hardware Form Factors & Protocols*]),
  [Core Layer], [High-speed transport backbone without packet inspection], [Cisco Catalyst 9500/9600, Nexus 9300, 100G QSFP28, OSPF/IS-IS],
  [Distribution Layer], [Routing boundary, ACL filtering, QoS, VLAN termination], [Cisco Catalyst 9300/9400, SVI/ROAS, HSRP, 10G/25G SFP28 uplinks],
  [Access Layer], [User port connectivity, PoE delivery, Port Security, 802.1X], [Catalyst 9200, 1G copper UTP, 802.3at PoE+ (30W), 802.3bt (90W)]
)

#v(2pt)

== 1.2 Two-Tier Collapsed Core Architecture
In Small-to-Medium Businesses (SMBs) or branch offices with fewer than 500 users, deploying a separate physical core and distribution layer is financially unjustified. The #hl[Collapsed Core Topology] fuses the core and distribution functions into a single logical switching tier.
- *Advantages:* Reduced capital expenditure (CapEx), lower power consumption, fewer rack units required, simplified spanning tree and routing topology.
- *Limitation:* Less modular expandability when scaling past 2,000 active endpoints.

#v(2pt)

== 1.3 Datacenter Spine-and-Leaf Architecture (Clos Fabric)
Traditional three-tier architectures were optimized for North-South traffic (user-to-server). Modern microservices, Kubernetes clusters, and distributed databases produce overwhelming #hl[East-West traffic (server-to-server)]. The Spine-Leaf architecture solves oversubscription:
- *Leaf Tier:* Every leaf switch connects to every spine switch in a full mesh. Servers connect exclusively to leaf switches.
- *Spine Tier:* Spine switches connect only to leaf switches, never to servers or other spines.
- *Predictable Latency:* Any server is strictly #hl[two hops away] from any other server in the fabric. Equal-Cost Multi-Path (ECMP) routing utilizes all physical uplinks simultaneously without Spanning Tree blocking.

#pagebreak()

== 1.4 Cloud Architectures & Deployment Models
Enterprise workloads increasingly span on-premises datacenters and multi-cloud providers (AWS, Microsoft Azure, Google Cloud Platform):
- *Infrastructure as a Service (IaaS):* Cloud provider manages physical hardware, virtualization, and datacenters. Enterprise engineers provision and manage virtual machines, virtual networks (VPC/VNet), routing tables, and firewalls.
- *Platform as a Service (PaaS):* Provider manages underlying OS, runtime, and scaling. Engineers deploy application code without server maintenance.
- *Software as a Service (SaaS):* Fully managed end-user applications delivered via web browsers (e.g., Microsoft 365, Salesforce).

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg", width: 85%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 1.1: Production Enterprise Datacenter Spine-Leaf & Server Aggregation Racks.]
]

#v(2pt)

== 1.5 Physical vs Logical Topologies & WAN Connections
A network's *Physical Topology* describes actual cable runs and hardware locations. The *Logical Topology* illustrates how data frames flow through the network regardless of physical placement.
- *Point-to-Point:* Direct dedicated connection between two nodes (e.g., leased line or GRE tunnel).
- *Star & Extended Star Topology:* All edge endpoints connect radially to central access switches. Dominates all modern campus LANs.
- *Full Mesh Topology:* Every node connects directly to every other node ($N(N-1)/2$ links). Maximum fault tolerance, highest cost.
- *Dual-Homed WAN Edge:* Edge routers connect to two separate Internet Service Providers (ISPs) using BGP or Floating Static Routes with IP SLA to eliminate single points of network failure.

#pagebreak()

== Student Technical FAQs
#faq-box("Why is packet filtering forbidden at the Core Layer?", "The Core Layer is designed purely for wire-speed switching. Applying ACLs, deep packet inspection, or NAT forces CPU microcode interrupts, which introduces latency and jitter into the entire campus backbone.")
#faq-box("How does Spine-Leaf eliminate Spanning Tree Protocol (STP)?", "Spine-Leaf operates Layer 3 routing (such as OSPF, BGP, or IS-IS) down to the leaf switches. Because Layer 3 uses Equal-Cost Multi-Path (ECMP) to load balance across all links, loops are prevented mathematically via TTL expiration, eliminating blocked STP ports.")
#faq-box("What is the difference between North-South and East-West traffic?", "North-South traffic flows between clients on the Internet/campus and internal servers. East-West traffic flows horizontally between servers inside the datacenter, such as database replication and microservice API calls.")

#v(2pt)

== Short-Answer Technical Review
1. *Define the primary responsibility of the Cisco Distribution Layer:* Routing between VLANs, enforcing ACL security policies, aggregating access switches, and providing redundancy.
2. *Calculate the number of links required for a 6-node Full Mesh topology:* $N(N-1)/2 = 6(5)/2 = 15$ physical links.
3. *Identify two primary characteristics of a Collapsed Core design:* Combines Core and Distribution into one tier; ideal for small-to-midsize campuses to reduce hardware cost.
4. *Explain the role of ECMP in modern datacenter fabrics:* Equal-Cost Multi-Pathing allows traffic to be dynamically distributed across all spine switches simultaneously without blocking.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An enterprise network engineer needs to connect 8 branch offices to headquarters with full redundancy. Which topology provides the highest fault tolerance?",
  ("Hub-and-Spoke", "Bus Topology", "Full Mesh", "Ring Topology"),
  2,
  "Full Mesh provides direct interconnected links between all nodes, ensuring that the failure of any single link never disconnects a site."
)

#mcq-item(
  "At which layer of the Cisco Three-Tier Hierarchical Model is 802.1Q Inter-VLAN routing typically performed?",
  ("Access Layer", "Distribution Layer", "Core Layer", "Physical Layer"),
  1,
  "The Distribution layer is the Layer 2/3 boundary where default gateways (SVIs) and inter-VLAN routing reside."
)

#mcq-item(
  "What is the maximum hop count between any two servers connected to a Spine-and-Leaf fabric?",
  ("1 Hop", "2 Hops", "3 Hops", "Variable depending on STP state"),
  1,
  "In a standard two-tier Spine-Leaf fabric, a frame travels Leaf 1 -> Spine -> Leaf 2, which is strictly a 2-hop journey."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The Death of Spanning Tree in Datacenters", "Traditional datacenters lost up to 50% of their purchased network bandwidth because Spanning Tree Protocol forcibly blocked redundant uplinks to prevent loops. Modern datacenters utilize Leaf-Spine fabrics running VXLAN with BGP EVPN control planes, keeping 100% of uplinks actively forwarding.")

#spotlight-box("2027 Tech Spotlight: Cisco Silicon One & AI Fabric Topologies", "Next-generation AI/ML cluster workloads demand ultra-low latency lossy-free networks using RoCEv2 (RDMA over Converged Ethernet). Cisco Silicon One architecture delivers 51.2 Tbps single-chip routing capacity to power multi-gigawatt AI training datacenters.")
'''

# =============================================================================
# CHAPTER 02: Cabling Standards, Optical Transceivers & Physical Media
# =============================================================================
chapters_eng_1_8[2] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 02 · PHYSICAL MEDIA & CABLING STANDARDS]
= Chapter 2: Cabling Standards, Hardware Ports & Media

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Physical Layer transmission media, copper UTP twisted pair categories, T568A vs T568B termination pinouts, Straight-Through vs Crossover pinout math, Single-Mode vs Multi-Mode optical fiber, transceivers, console connections, and collision vs broadcast domains.
]

#v(2pt)

== 2.1 Copper Transmission Media & Twisted Pair Physics
Copper cabling remains the backbone of enterprise campus access layers. Unshielded Twisted Pair (UTP) cancels Electromagnetic Interference (EMI) and radio frequency interference (RFI) via #hl[differential signaling across tightly twisted wire pairs]:
- *Twisting Principle:* Current flowing through a wire generates an electromagnetic field. Twisting adjacent wires causes equal and opposite fields to cancel each other, mitigating Near-End Crosstalk (NEXT).
- *Channel Link Distance:* Maximum certified Ethernet copper channel distance is strictly #hl[100 meters (90m solid horizontal run + 10m stranded patch cords)].

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

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/rj45-connector-cat6.jpg", width: 92%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 2.1: Precision Cat6 RJ45 8P8C Connector.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/fiber-optic-duplex-lc.jpg", width: 92%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 2.2: Duplex LC Optical Fiber Termination.]
  ]
)

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

== 2.6 Console Ports & Collision vs Broadcast Domains
- *Console Ports:* Out-of-band management access. Cisco routers provide RJ45 rollover console ports (9600 baud, 8 data bits, no parity, 1 stop bit, no flow control: 9600-8-N-1) and modern USB Type-B / Type-C console interfaces.
- *Collision Domain:* A physical network segment where packets can collide. Legacy hubs formed a single collision domain. Every switch port creates a #hl[separate collision domain] operating in full duplex.
- *Broadcast Domain:* The scope across which a broadcast frame (e.g., ARP, DHCP) propagates. Switches forward broadcasts across all ports in the same VLAN. Routers #hl[break broadcast domains] at Layer 3.

#pagebreak()

== Student Technical FAQs
#faq-box("Why does Single-Mode fiber transmit so much farther than Multi-Mode fiber?", "Single-Mode fiber has a microscopic 9-micron core that permits only a single ray of laser light to travel straight down the center. Multi-Mode fiber has a wider 50-micron core where light bounces at multiple angles, causing modal dispersion that degrades the signal over distance.")
#faq-box("Does Auto-MDIX make crossover cables obsolete in modern production?", "Yes. Auto-MDIX automatically senses the required transmit/receive pinout on modern NICs and switch ports. However, crossover pinout theory remains a critical CCNA exam requirement.")
#faq-box("How many broadcast domains exist on a 24-port switch with default configuration?", "Exactly one. By default, all 24 ports belong to VLAN 1. Creating separate VLANs is required to segment the switch into multiple broadcast domains.")

#v(2pt)

== Short-Answer Technical Review
1. *State the maximum channel link distance for certified Cat6 copper Ethernet:* 100 meters (90 meters permanent horizontal solid link + 10 meters patch cords).
2. *Identify the pins swapped when converting a T568A cable to T568B:* Pins 1 and 2 swap with pins 3 and 6 (Green pair swaps with Orange pair).
3. *Name the standard transceiver form factor used for 10 Gigabit Ethernet uplinks:* SFP+ (Enhanced Small Form-Factor Pluggable).
4. *Distinguish how switches and routers affect collision and broadcast domains:* A switch breaks collision domains per port but preserves broadcast domains; a router breaks both collision and broadcast domains per interface.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer is terminating an RJ45 connector using T568B. Which color wire must be placed into Pin 1?",
  ("White/Green", "White/Orange", "Solid Orange", "White/Blue"),
  1,
  "In the T568B standard, Pin 1 is White/Orange and Pin 2 is Orange."
)

#mcq-item(
  "Which optical fiber connector features a small form-factor push-pull latching mechanism commonly used with SFP/SFP+ transceivers?",
  ("SC Connector", "ST Connector", "Duplex LC Connector", "BNC Connector"),
  2,
  "The Duplex LC (Lucent Connector) is the universal standard for SFP, SFP+, and SFP28 optical modules."
)

#mcq-item(
  "A network has a 48-port Layer 2 switch with 3 VLANs configured: VLAN 10 (16 ports), VLAN 20 (16 ports), and VLAN 30 (16 ports). How many broadcast domains exist?",
  ("1", "3", "48", "16"),
  1,
  "Each configured VLAN constitutes a separate Layer 2 broadcast domain. Therefore, 3 VLANs create exactly 3 broadcast domains."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Why Copper Wire Pairs Have Different Twist Rates", "Inside a high-grade Cat6a cable, each of the four wire pairs is twisted at a slightly different twist rate (turns per inch). This mathematical offset prevents electromagnetic coupling between adjacent pairs inside the same outer jacket.")

#spotlight-box("2027 Tech Spotlight: Co-Packaged Optics (CPO)", "At 800 Gbps and 1.6 Tbps datacenter speeds, transmitting electrical signals across circuit boards wastes excessive power. Co-Packaged Optics mounts the optical laser engine directly onto the silicon switch ASIC substrate, slashing energy consumption by 30%.")
'''

# =============================================================================
# CHAPTER 03: IPv4 Addressing, VLSM Subnetting Mastery & Enterprise Design
# =============================================================================
chapters_eng_1_8[3] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 03 · IPV4 ADDRESSING & VLSM SUBNETTING]
= Chapter 3: IPv4 Addressing, VLSM Subnetting & Design Mastery

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  32-bit IPv4 structure, binary-to-decimal conversion, classful vs classless CIDR, RFC 1918 private scopes, Magic Number formula, instant /24 to /30 reference table, and five step-by-step enterprise VLSM design scenarios.
]

#v(2pt)

== 3.1 32-Bit IPv4 Header & Addressing Architecture
An IPv4 address is a 32-bit binary number represented as four 8-bit octets in dotted-decimal format (e.g., `192.168.10.1`). Every IP address contains two components:
- *Network Portion:* Identifies the specific IP network/subnet. Defined by the subnet mask.
- *Host Portion:* Identifies the unique endpoint device interface on that network.
- *Subnet Mask:* A continuous sequence of binary 1s (network bits) followed by binary 0s (host bits). An IP address without a subnet mask is mathematically meaningless.

#v(2pt)

== 3.2 Legacy Classful IP Architecture vs CIDR
Historical RFC 791 classified addresses into five rigid categories before Classless Inter-Domain Routing (CIDR, RFC 1519) eliminated class boundaries:
- *Class A (0 – 127):* Default `/8` mask (`255.0.0.0`). 16,777,214 hosts per network. (`127.0.0.0/8` reserved for loopback testing).
- *Class B (128 – 191):* Default `/16` mask (`255.255.0.0`). 65,534 hosts per network.
- *Class C (192 – 223):* Default `/24` mask (`255.255.255.0`). 254 hosts per network.
- *Class D (224 – 239):* Reserved for Multicast groups (no subnet mask, no individual host assignment).
- *Class E (240 – 255):* Experimental and research reserve.
- *RFC 1918 Private Ranges:* Non-routable on the public Internet: `10.0.0.0/8`, `172.16.0.0/12` (`172.16.0.0` to `172.31.255.255`), and `192.168.0.0/16`.
- *APIPA (Automatic Private IP Addressing):* `169.254.0.0/16` self-assigned when DHCP fails.

#v(2pt)

== 3.3 The Magic Number Subnetting Method
To subnet instantly in under 15 seconds during exams and production outages, use the #hl[Magic Number Formula]:
1. Identify the *Interesting Octet* (the octet where the subnet mask is neither `255` nor `0`).
2. Calculate the *Magic Number (Block Size):* $text("Magic Number") = 256 - text("Subnet Mask Value in that Octet")$.
3. Multiples of this Magic Number determine all valid Network IDs ($0, M, 2M, 3M, dots$).
4. Broadcast Address is strictly $(text("Next Network ID") - 1)$.
5. Usable Host Range spans $(text("Network ID") + 1)$ to $(text("Broadcast Address") - 1)$.
6. Maximum Usable Hosts formula: $2^H - 2$, where $H$ is the number of host bits (binary 0s).

#pagebreak()

== 3.4 Instant /24 to /30 Quick Reference Matrix
#table(
  columns: (1fr, 1.8fr, 1.1fr, 1.4fr, 1.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3.5pt,
  table.header([*CIDR*], [*Subnet Mask*], [*Block Size*], [*Usable Hosts*], [*Primary Production Application*]),
  [/24], [255.255.255.0], [256], [254 hosts], [Standard branch office LAN / user access segment],
  [/25], [255.255.255.128], [128], [126 hosts], [Subdivided building floor / medium department],
  [/26], [255.255.255.192], [64], [62 hosts], [Server cluster / development engineering pool],
  [/27], [255.255.255.224], [32], [30 hosts], [Executive management / VoIP phone subnet],
  [/28], [255.255.255.240], [16], [14 hosts], [DMZ public web/mail proxy tier],
  [/29], [255.255.255.248], [8], [6 hosts], [Firewall active/standby failover & HA sync],
  [/30], [255.255.255.252], [4], [2 hosts], [Dedicated point-to-point router serial/WAN link]
)

#v(2pt)

== 3.5 Step-by-Step Enterprise VLSM Design Scenario
*Scenario:* An enterprise network architect is allocated the private block #hl[`172.16.0.0/22`] (1,024 total addresses) and must design subnets for 4 requirements:
1. *Engineering HQ:* Requires 220 usable host addresses.
2. *Sales & Marketing:* Requires 110 usable host addresses.
3. *Customer Support:* Requires 50 usable host addresses.
4. *WAN Inter-Router Links:* Requires 4 point-to-point links (2 hosts each).

#v(2pt)

*Execution Rule: Always allocate from largest host requirement to smallest.*
- *Step 1: Engineering HQ (220 hosts).* Formula: $2^H - 2 >= 220$. For $H=8$, $2^8 - 2 = 254$. Subnet mask: $32 - 8 = bold("/24")$ (`255.255.255.0`).
  - Network ID: `172.16.0.0/24` | Usable: `172.16.0.1` – `172.16.0.254` | Broadcast: `172.16.0.255`.
- *Step 2: Sales & Marketing (110 hosts).* Formula: $2^H - 2 >= 110$. For $H=7$, $2^7 - 2 = 126$. Subnet mask: $32 - 7 = bold("/25")$ (`255.255.255.128`).
  - Next available: `172.16.1.0/25` | Usable: `172.16.1.1` – `172.16.1.126` | Broadcast: `172.16.1.127`.
- *Step 3: Customer Support (50 hosts).* Formula: $2^H - 2 >= 50$. For $H=6$, $2^6 - 2 = 62$. Subnet mask: $32 - 6 = bold("/26")$ (`255.255.255.192`).
  - Next available: `172.16.1.128/26` | Usable: `172.16.1.129` – `172.16.1.190` | Broadcast: `172.16.1.191`.
- *Step 4: WAN Links (2 hosts each).* Formula: $2^H - 2 = 2$. For $H=2$, $2^2 - 2 = 2$. Subnet mask: $32 - 2 = bold("/30")$ (`255.255.255.252`).
  - WAN 1: `172.16.1.192/30` (`172.16.1.193` – `172.16.1.194`, Broadcast: `.195`)
  - WAN 2: `172.16.1.196/30` (`172.16.1.197` – `172.16.1.198`, Broadcast: `.199`)
  - WAN 3: `172.16.1.200/30` (`172.16.1.201` – `172.16.1.202`, Broadcast: `.203`)
  - WAN 4: `172.16.1.204/30` (`172.16.1.205` – `172.16.1.206`, Broadcast: `.207`)

#pagebreak()

== Student Technical FAQs
#faq-box("Why do we subtract 2 in the usable host formula (2^H - 2)?", "The very first address where all host bits are zero represents the Network ID. The final address where all host bits are binary 1s is the Directed Broadcast Address. Neither can ever be assigned to an end host interface.")
#faq-box("Can /31 subnets be used on point-to-point links?", "Yes, RFC 3021 permits /31 subnets (mask 255.255.255.254, 2 total addresses) exclusively on point-to-point links where broadcast is unnecessary, conserving IP space in massive enterprise backbones.")
#faq-box("What is the difference between classful subnetting and VLSM?", "Classful subnetting enforces the exact same subnet mask across every subnet, causing severe address waste. VLSM (Variable Length Subnet Masking) allows different subnets within the same major network to use customized masks tailored to exact host requirements.")

#v(2pt)

== Short-Answer Technical Review
1. *Determine the valid host range for the subnet containing 192.168.5.85/28:* Subnet mask `/28` has block size $256 - 240 = 16$. Multiples: $0, 16, 32, 48, 64, bold(80), 96$. Network ID is `192.168.5.80/28`. Usable host range: `192.168.5.81` to `192.168.5.94`. Broadcast: `192.168.5.95`.
2. *State the RFC 1918 private address ranges:* `10.0.0.0/8`, `172.16.0.0/12`, and `192.168.0.0/16`.
3. *Identify the default subnet mask for an unsubnetted Class B address:* `255.255.0.0` (`/16`).
4. *Calculate the wildcard mask corresponding to subnet mask 255.255.255.224:* Invert each octet from 255: $255.255.255.255 - 255.255.255.224 = bold(0.0.0.31)$.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer must subnet 10.50.0.0/16 to support at least 500 hosts per subnet while maximizing the number of subnets. Which CIDR prefix should be chosen?",
  ("/22", "/23", "/24", "/25"),
  1,
  "Formula: 2^H - 2 >= 500. For H=9: 2^9 - 2 = 510 hosts. Prefix length = 32 - 9 = /23 (mask 255.255.254.0)."
)

#mcq-item(
  "Which IP address is a valid usable host address within the 172.20.32.0/20 network?",
  ("172.20.32.0", "172.20.47.255", "172.20.40.100", "172.20.48.1"),
  2,
  "/20 has block size 16 in the 3rd octet. Subnet range: 172.20.32.0 to 172.20.47.255. 172.20.40.100 is valid within this usable range."
)

#mcq-item(
  "A host with IP 169.254.10.20 cannot reach the Internet. What is the root cause?",
  ("DNS misconfiguration", "APIPA auto-assignment due to DHCP failure", "Duplicate IP conflict", "Default gateway ACL drop"),
  1,
  "169.254.0.0/16 is APIPA. When a host fails to receive a DHCP Offer, it self-assigns an APIPA address and cannot route beyond the local link."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The \\$50 Billion IPv4 Address Exhaustion", "IANA officially allocated its last IPv4 /8 blocks in February 2011. Today, clean /24 IPv4 address blocks trade on commercial broker markets for over \\$55 per individual IP address, driving aggressive IPv6 migration.")

#spotlight-box("2027 Tech Spotlight: AI-Driven Automated IPAM Systems", "Modern cloud-native enterprises manage millions of dynamic container IP endpoints using Infoblox and NetBox IPAM integrated with Kubernetes CNI (Container Network Interface) plugins to automate zero-collision subnet provisioning.")
'''

# =============================================================================
# CHAPTER 04: IPv6 Architecture, EUI-64 Addressing & Enterprise Migration
# =============================================================================
chapters_eng_1_8[4] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 04 · IPV6 ARCHITECTURE & TRANSITION]
= Chapter 4: IPv6 Complete Architecture, EUI-64 & Transition

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  128-bit IPv6 address structure, hexadecimal compression rules, address scopes (Global Unicast, Link-Local, Unique Local, Multicast), Modified EUI-64 math, Neighbor Discovery Protocol (NDP), SLAAC vs DHCPv6, and dual-stack CLI configuration.
]

#v(2pt)

== 4.1 The 128-Bit IPv6 Architecture
IPv6 expands the address space from IPv4's $2^{32}$ (4.3 billion) to an astronomical #hl[$2^{128}$ (approx. $3.4 times 10^{38}$ addresses)]. An IPv6 address is represented as eight 16-bit blocks called *hextets* separated by colons, written in hexadecimal notation:
`2001:0db8:85a3:0000:0000:8a2e:0370:7334`

#v(2pt)

== 4.2 Two Mandatory Hexadecimal Compression Rules
RFC 4291 mandates two rules to simplify long IPv6 strings:
- *Rule 1: Omission of Leading Zeros:* Within any individual 16-bit hextet, leading zeros may be omitted. Trailing zeros #hl[cannot] be omitted (`:0042:` becomes `:42:`, but `:4200:` remains `:4200:`).
- *Rule 2: Double Colon Compression (::):* A single contiguous sequence of one or more all-zero hextets can be replaced with a double colon `::`. #hl[This rule can only be applied ONCE per address] to prevent ambiguity during expansion.
- *Compression Example:*
  - Original: `2001:0db8:0000:0000:0000:0000:0000:0001`
  - Rule 1 (Omit leading zeros): `2001:db8:0:0:0:0:0:1`
  - Rule 2 (Double colon): #hl[`2001:db8::1`]

#v(2pt)

== 4.3 IPv6 Address Types & Scopes
Unlike IPv4, #hl[IPv6 has no broadcast addresses]. All broadcast functionality is replaced by targeted Multicast:
#table(
  columns: (1.4fr, 1.3fr, 3.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Address Type*], [*Prefix / Range*], [*Scope & Operational Characteristics*]),
  [Global Unicast (GUA)], [`2000::/3`], [Globally routable public Internet addresses assigned by RIRs. Standard format: /48 Global Routing Prefix + /16 Subnet ID + /64 Interface ID.],
  [Link-Local (LLA)], [`fe80::/10`], [Non-routable mandatory local-link addresses (`fe80::` to `febf::`). Used for routing protocol peering (OSPFv3, BGP) and default gateway identification.],
  [Unique Local (ULA)], [`fc00::/7` (`fd00::/8`)], [Private routable addresses within enterprise intranet. Equivalent of IPv4 RFC 1918. Not routable on the public Internet.],
  [Multicast], [`ff00::/8`], [One-to-many communication. `ff02::1` = All Nodes, `ff02::2` = All Routers, `ff02::5` = OSPFv3 Routers, `ff02::6` = OSPFv3 DR/BDR.],
  [Loopback], [`::1/128`], [Internal testing address (equivalent to IPv4 `127.0.0.1`).],
  [Unspecified], [`::/128`], [Source address used before obtaining an address during initialization.]
)

#pagebreak()

== 4.4 Modified EUI-64 Host Identifier Calculation
The 64-bit Interface ID can be automatically derived from the device's 48-bit MAC address using #hl[Modified EUI-64]:
- *Step 1:* Split the 48-bit MAC address into two equal 24-bit halves (OUI and NIC identifier).
- *Step 2:* Insert the 16-bit hex value #hl[`FF-FE`] directly between the two halves, forming 64 bits.
- *Step 3:* #hl[Invert the 7th bit (Universal/Local bit)] of the first byte (if 0, make it 1; if 1, make it 0).
- *Worked Example:*
  - Given MAC Address: `00:1B:78:2A:8C:11`
  - First Byte in Binary: `00` hex = `0000 0000` binary.
  - Invert 7th Bit: `0000 0010` binary = `02` hex.
  - Insert `FFFE`: Resulting EUI-64 Interface ID = #hl[`021B:78FF:FE2A:8C11`].
  - Link-Local Address: `fe80::21b:78ff:fe2a:8c11`.

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab12-ipv6-routing-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 4.1: Enterprise IPv6 Dual-Stack & OSPFv3 Lab Topology.]
]

#v(2pt)

== 4.5 SLAAC vs DHCPv6 & Neighbor Discovery Protocol (NDP)
IPv6 replaces ARP with the #hl[Neighbor Discovery Protocol (NDP)], operating via ICMPv6:
- *Router Solicitation (RS - Type 133):* Host multicasts to `ff02::2` requesting network prefix.
- *Router Advertisement (RA - Type 134):* Router periodically multicasts prefix information to `ff02::1`.
- *Neighbor Solicitation (NS - Type 135) & Neighbor Advertisement (NA - Type 136):* Replaces IPv4 ARP.
- *SLAAC (Stateless Address Autoconfiguration):* Host generates its own IP using the prefix from RA + EUI-64/Random 64-bit ID. No state kept on router.
- *Stateful DHCPv6:* Central DHCPv6 server leases full IPv6 address and DNS server settings.

#v(2pt)

== 4.6 Cisco IOS IPv6 CLI Configuration
#terminal-box([
```cisco
Router(config)# ipv6 unicast-routing
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ipv6 address 2001:db8:acad:1::1/64
Router(config-if)# ipv6 address fe80::1 link-local
Router(config-if)# no shutdown
Router(config)# ipv6 route ::/0 GigabitEthernet0/0/1 2001:db8:acad:99::2
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("Why must 'ipv6 unicast-routing' be entered first on Cisco routers?", "By default, Cisco IOS routers act as IPv6 hosts and will not forward IPv6 packets between interfaces or send Router Advertisements (RAs) until 'ipv6 unicast-routing' is globally enabled.")
#faq-box("Why does IPv6 eliminate the Broadcast address completely?", "Broadcasts interrupt every single device on the local network to process the frame in software. IPv6 replaces broadcasts with Solicited-Node Multicasts, so only devices subscribed to that specific multicast group process the packet.")
#faq-box("Why is the 7th bit inverted in EUI-64 calculation?", "In standard IEEE 48-bit MAC addresses, the 7th bit set to 0 indicates globally unique hardware. In EUI-64, setting bit 7 to 1 signifies universal administrative scope, matching Internet engineering conventions.")

#v(2pt)

== Short-Answer Technical Review
1. *Compress the following IPv6 address to its shortest legal format: 2001:0000:0000:0ab0:0000:0000:0000:0001:* `2001:0:0:ab0::1` (Rule 2 can only be applied once; compressing the rightmost three zero hextets yields the shortest legal string).
2. *Identify the IPv6 address scope corresponding to fe80::/10:* Link-Local Unicast address.
3. *State the two ICMPv6 messages utilized by SLAAC:* Router Solicitation (RS, Type 133) and Router Advertisement (RA, Type 134).
4. *Calculate the EUI-64 Interface ID for MAC address 50:06:04:12:34:56:* First byte `50` (`0101 0000`) with 7th bit inverted = `52` (`0101 0010`). Insert FFFE = `5206:04FF:FE12:3456`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "Which IPv6 address represents the equivalent of the IPv4 default route 0.0.0.0 0.0.0.0?",
  ("::1/128", "::/0", "fe80::/10", "ff02::1/128"),
  1,
  "::/0 specifies all zeros prefix length 0, representing the IPv6 default route (Gateway of Last Resort)."
)

#mcq-item(
  "What is the Solicited-Node Multicast prefix used by IPv6 Neighbor Discovery?",
  ("ff02::1", "ff02::2", "ff02::1:ff00:0/104", "fe80::/10"),
  2,
  "Solicited-Node Multicast addresses take the prefix ff02::1:ff00:0/104 combined with the low-order 24 bits of the target IPv6 address."
)

#mcq-item(
  "An engineer configures an IPv6 interface. Which type of address is automatically generated even if no static address or DHCP server is configured?",
  ("Global Unicast Address", "Unique Local Address", "Link-Local Address", "Anycast Address"),
  2,
  "As soon as IPv6 is enabled on an interface, Cisco IOS automatically generates a Link-Local address (fe80::/10) using EUI-64."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The Scale of the IPv6 Address Space", "With 2^128 addresses, IPv6 can allocate over 667 quadrillion addresses for every square millimeter of the Earth's surface, ensuring humans will never exhaust addresses even with trillions of IoT sensors.")

#spotlight-box("2027 Tech Spotlight: SRv6 (Segment Routing over IPv6)", "Modern telecom carriers and hyperscale clouds are replacing complex MPLS networks with Segment Routing over IPv6 (SRv6). Network paths, traffic engineering policies, and security firewalls are encoded directly into the IPv6 packet header extension.")
'''

# =============================================================================
# CHAPTER 05: Cisco Router Hardware, Memories (ROM/Flash/NVRAM/RAM) & 5-Stage Boot Flow
# =============================================================================
chapters_eng_1_8[5] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 05 · CISCO ROUTER HARDWARE & BOOT PROCESS]
= Chapter 5: Cisco Router Hardware Architecture, Memories & 5-Stage Boot Flow

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Detailed Cisco router physical hardware components, ports (Console, AUX, Serial WIC, GigabitEthernet), memory hierarchy (ROM, Flash, NVRAM, RAM), 5-stage boot sequence, and configuration register (0x2102 vs 0x2142).
]

#v(2pt)

== 5.1 Cisco Router Internal Hardware Architecture
A Cisco router is a specialized computing system engineered for high-throughput packet forwarding:
- *Central Processing Unit (CPU):* Executes Cisco IOS operating system instructions, runs routing protocol algorithms (OSPF Dijkstra, EIGRP DUAL), manages ARP tables, and handles control-plane management tasks.
- *System Bus:* High-speed interconnect that transfers packets between network interface controllers and central processing units.
- *Physical Ports & Interfaces:*
  - *Console Port:* Out-of-band serial RJ45 or USB connection for initial setup and recovery when network connectivity is lost.
  - *Auxiliary (AUX) Port:* Out-of-band RJ45 port for connecting analog modems for remote dial-in rescue.
  - *Gigabit / FastEthernet Ports:* Fixed or modular Layer 3 Ethernet interfaces for LAN and router-to-router connections.
  - *WAN Interface Cards (WIC / NIM):* Modular expansion slots supporting high-speed serial links, T1/E1, and cellular LTE/5G.

#v(2pt)

== 5.2 The Four Router Memory Types
#table(
  columns: (1.1fr, 1.3fr, 3.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Memory Type*], [*Volatility & Nature*], [*Primary Contents & Architectural Purpose*]),
  [ROM (Read-Only Memory)], [Non-Volatile (Permanent)], [Contains factory microcode: POST diagnostics, Bootstrap loader program, Mini-IOS (RxBoot), and ROMMON (ROM Monitor emergency maintenance mode).],
  [Flash Memory], [Non-Volatile (Electronically Erasable)], [Stores full Cisco IOS operating system binary images (`.bin`). Survives power cycles and reboots. Can store multiple IOS versions and backup files.],
  [NVRAM], [Non-Volatile (Battery-Backed SRAM)], [Stores the permanent #hl[`startup-config`] file and the 16-bit Configuration Register setting. Content remains intact without AC power.],
  [RAM / DRAM], [Volatile (Erased on power loss)], [Active working memory. Stores #hl[`running-config`], active routing tables, ARP cache tables, packet buffers, and running operating system code.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/motherboard-atx-overview.jpg", width: 92%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 5.1: High-Speed System Bus & Controller Motherboard.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/ram-dimm-module.jpg", width: 92%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 5.2: Volatile DRAM System Memory Module.]
  ]
)

#pagebreak()

== 5.3 The 5-Stage Cisco Router Boot Sequence
When a Cisco router is powered on, it executes a rigorous five-stage startup routine to initialize hardware, decompress the operating system, and load the active running configuration:
- *Stage 1: Power-On Self-Test (POST):*
  - Hardwired diagnostic code stored in ROM executes immediately.
  - Tests hardware subsystems: CPU registers, memory controllers, backplane buses, and network interfaces.
  - Verification: Front panel LED indicators flash amber, then turn solid green upon passing POST.
- *Stage 2: Bootstrap Loader Program Execution:*
  - Bootstrap instructions in ROM execute to coordinate the operating system boot process.
  - Reads the 16-bit *Configuration Register* from NVRAM to determine where to locate the Cisco IOS image.
- *Stage 3: Locate Cisco IOS Operating System:*
  - Router searches for a valid IOS image following this strict fallback order:
    1. #hl[Flash Memory] (Standard default location).
    2. #hl[TFTP Network Server] (If Flash is corrupt or boot system commands specify network boot).
    3. #hl[ROMMON / Mini-IOS in ROM] (Fallback recovery mode if no valid image is found).
- *Stage 4: Load & Decompress IOS into RAM:*
  - Once the `.bin` image is located, it is loaded into volatile RAM and dynamically decompressed.
  - Operating system kernel takes control of all CPU, switching, and routing hardware resources.
- *Stage 5: Search for & Apply Configuration:*
  - Bootstrap checks the Configuration Register (specifically bit 6):
    - *If Normal (0x2102):* Router searches NVRAM for #hl[`startup-config`]. If found, copies it into RAM as `running-config`.
    - *If NVRAM is Empty or Register is 0x2142:* Router attempts TFTP network boot. If no TFTP response, prompts user with:
      `Would you like to enter the initial configuration dialog? [yes/no]:` (Setup Mode).

#v(2pt)

== 5.4 The Configuration Register & Bit Values
The Configuration Register is a 16-bit software register stored in NVRAM that dictates router boot behavior:
#table(
  columns: (1.2fr, 1.2fr, 3.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Register Value*], [*Boot Field Bits*], [*Operational Behavior & Diagnostic Application*]),
  [`0x2102`], [Bit 6 = 0, Bits 0-3 = 2], [Normal enterprise operation. Loads IOS from Flash and reads `startup-config` from NVRAM. Default console 9600 baud.],
  [`0x2142`], [Bit 6 = 1 (0x0040)], [Password recovery bypass. Ignores NVRAM `startup-config` during boot, entering Setup dialog while keeping config safe.],
  [`0x2100`], [Bits 0-3 = 0], [Diagnostic mode. Boots directly into ROMMON prompt (`rommon 1 >`) for manual disaster recovery.],
  [`0x2101`], [Bits 0-3 = 1], [Boots subset mini-IOS (RxBoot) stored in ROM for TFTP emergency re-flashing.]
)

#pagebreak()

== Student Technical FAQs
#faq-box("What happens if a router loses power while saving configuration?", "If power fails during 'copy running-config startup-config', the startup-config in NVRAM may become corrupted. Upon reboot, the router will fail Stage 5 and enter the initial configuration dialog. Restoring from a TFTP backup is required.")
#faq-box("Why is Cisco IOS compressed on Flash memory?", "Flash memory chips are expensive compared to DRAM. Compressing the IOS image into a '.bin' archive saves valuable Flash storage. During Stage 4, the Bootstrap uncompresses the kernel into DRAM.")
#faq-box("What is the difference between warm boot (reload) and cold boot?", "A cold boot occurs when the power switch is cycled; it forces full ROM POST diagnostics. A warm boot ('reload' command) bypasses low-level hardware POST and immediately restarts the Bootstrap loader.")

#v(2pt)

== Short-Answer Technical Review
1. *Identify the memory component that stores the startup-config:* NVRAM (Non-Volatile RAM).
2. *State the five stages of the Cisco router boot sequence in correct order:* 1. POST -> 2. Bootstrap Execution -> 3. Locate IOS -> 4. Load & Decompress IOS into RAM -> 5. Search & Apply Configuration.
3. *Explain what Configuration Register 0x2142 instructs the router to do:* Bit 6 instructs the Bootstrap loader to bypass/ignore the `startup-config` stored in NVRAM during boot.
4. *Where does a router search for IOS if Flash memory is empty or corrupted?* It falls back to searching for a network TFTP server, and if that fails, drops into ROMMON.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "During which stage of the router boot sequence are the CPU registers, memory controllers, and interfaces tested?",
  ("Bootstrap Execution", "POST (Power-On Self-Test)", "IOS Decompression", "NVRAM Read"),
  1,
  "POST runs microcode tests from ROM to verify hardware integrity before any software loads."
)

#mcq-item(
  "An engineer makes changes to interface descriptions. Which memory holds these changes before any write command is entered?",
  ("Flash", "NVRAM", "RAM", "ROM"),
  2,
  "Active changes are made to the running-config, which resides strictly in volatile RAM."
)

#mcq-item(
  "What is the default Configuration Register value for a standard production Cisco router?",
  ("0x2100", "0x2102", "0x2142", "0x2101"),
  1,
  "0x2102 is the factory default value that boots IOS from Flash and reads startup-config from NVRAM."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Why NVRAM Uses Lithium Batteries", "Traditional NVRAM chips utilize small lithium coin batteries embedded directly inside the SRAM package to retain configuration memory during facility power outages. Modern enterprise routers utilize Non-Volatile Flash-backed MRAM.")

#spotlight-box("2027 Tech Spotlight: Cisco Secure Boot & Hardware Root of Trust", "Modern Cisco Catalyst 8000 and 9000 routers feature Anchor Crypto Hardware Root of Trust. At Stage 1, a tamper-proof hardware chip cryptographically verifies digital signatures on microcode and IOS images to prevent malware bootkits.")
'''

# =============================================================================
# CHAPTER 06: Cisco IOS CLI Navigation, Password Recovery (0x2142) & TFTP Disaster Recovery
# =============================================================================
chapters_eng_1_8[6] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 06 · CISCO IOS CLI & DISASTER RECOVERY]
= Chapter 6: Cisco IOS CLI Modes, Password Recovery (0x2142) & TFTP Disaster Recovery

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Cisco IOS CLI navigation hierarchy, foundational security hardening, step-by-step password recovery via ROMMON confreg 0x2142, and TFTP backup and restoration disaster recovery workflows.
]

#v(2pt)

== 6.1 Cisco IOS CLI Command Hierarchy
The Cisco Internetwork Operating System (IOS) organizes command execution into a strict permission hierarchy:
- *User EXEC Mode (`Router>`):* Read-only basic monitoring. Permits basic ping, traceroute, and limited show commands.
- *Privileged EXEC Mode (`Router#`):* Administrative control. Accessed via `enable`. Permits configuration viewing (`show running-config`), file manipulation, debugging, and reload.
- *Global Configuration Mode (`Router(config)#`):* System-wide parameters. Accessed via `configure terminal`.
- *Interface Configuration Submode (`Router(config-if)#`):* Specific port parameters (IP addressing, duplex, speed).
- *Line Configuration Submode (`Router(config-line)#`):* Management lines (`line console 0`, `line vty 0 4`).

#v(2pt)

== 6.2 Essential Security Hardening Configuration
#terminal-box([
```cisco
Router(config)# hostname Edge-RTR
Edge-RTR(config)# enable algorithm-type sha256 secret Cisco#123Secure!
Edge-RTR(config)# service password-encryption
Edge-RTR(config)# banner motd # AUTHORIZED ACCESS ONLY - VIOLATORS PROSECUTED #
Edge-RTR(config)# line console 0
Edge-RTR(config-line)# password ConsolePass#1
Edge-RTR(config-line)# login
Edge-RTR(config-line)# logging synchronous
Edge-RTR(config-line)# exec-timeout 5 0
Edge-RTR(config)# ip domain-name rtechlab.lan
Edge-RTR(config)# crypto key generate rsa modulus 2048
Edge-RTR(config)# ip ssh version 2
Edge-RTR(config)# username admin privilege 15 secret AdminPass#2027
Edge-RTR(config)# line vty 0 4
Edge-RTR(config-line)# transport input ssh
Edge-RTR(config-line)# login local
```
])

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab01-ssh-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 6.1: Packet Tracer Lab 01 — Secure Out-of-Band SSH Management Topology.]
]

#pagebreak()

== 6.3 Step-by-Step Password Recovery Procedure (Exact CLI Prompts)
When administrative credentials are lost, the router password must be recovered without losing the production configuration:
- *Step 1: Physical Console Connection:* Connect rollover console cable from PC COM/USB port to router Console port. Open PuTTY configured for `9600-8-N-1`.
- *Step 2: Interrupt Boot Sequence:* Power cycle the router. Within 60 seconds of boot, press `Break` (or `Ctrl+Break` in PuTTY) to interrupt bootstrap and enter ROMMON mode.
- *Step 3: Modify Configuration Register:*
  At the `rommon 1 >` prompt, instruct the router to bypass NVRAM startup-config on next boot:
  #terminal-box([
```cisco
rommon 1 > confreg 0x2142
rommon 2 > reset
```
  ])
- *Step 4: Bypass Initial Setup Dialog:*
  The router reboots with factory defaults into RAM. Answer `no` when prompted:
  `Would you like to enter the initial configuration dialog? [yes/no]: no`
- *Step 5: Enter Privileged Mode & Restore Configuration:*
  #hl[CRITICAL STEP: Do NOT enter 'configure terminal' first!] Copy startup-config from NVRAM into RAM so existing IP addresses and interface settings are preserved:
  #terminal-box([
```cisco
Router> enable
Router# copy startup-config running-config
```
  ])
- *Step 6: Reset Secret & Re-enable Interfaces:*
  #terminal-box([
```cisco
Edge-RTR# configure terminal
Edge-RTR(config)# enable secret NewMasterPassword#2027
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# no shutdown
```
  ])
- *Step 7: Reset Configuration Register to Normal (0x2102):*
  #hl[MANDATORY STEP: If forgotten, the router will ignore its configuration on every future reboot!]
  #terminal-box([
```cisco
Edge-RTR(config)# config-register 0x2102
Edge-RTR(config)# exit
Edge-RTR# copy running-config startup-config
Edge-RTR# reload
```
  ])

#v(2pt)

== 6.4 TFTP Server Backup & Disaster Recovery
Production disaster recovery requires central off-box backups of configurations and operating system images:
#table(
  columns: (1.5fr, 4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Disaster Recovery Task*], [*Production Cisco IOS CLI Command*]),
  [Backup Running Config to TFTP], [`Edge-RTR# copy running-config tftp://192.168.1.50/Edge-RTR-cfg-backup`],
  [Restore Running Config from TFTP], [`Edge-RTR# copy tftp://192.168.1.50/Edge-RTR-cfg-backup running-config`],
  [Backup Flash IOS Image to TFTP], [`Edge-RTR# copy flash:c2900-universalk9-mz.bin tftp://192.168.1.50/`],
  [Restore / Flash IOS from TFTP], [`Edge-RTR# copy tftp://192.168.1.50/c2900-universalk9-mz.bin flash:`],
  [Verify IOS File Integrity Checksum], [`Edge-RTR# verify /md5 flash:c2900-universalk9-mz.bin`]
)

#pagebreak()

== Student Technical FAQs
#faq-box("What happens if you enter 'configure terminal' instead of 'copy startup-config running-config' during password recovery?", "Entering global configuration directly writes a blank config into RAM. If you then save, you will completely overwrite and permanently destroy the entire production startup-config!")
#faq-box("Why must interfaces be manually re-enabled after password recovery?", "When startup-config is loaded into running-config while the router is in bypass mode, Cisco IOS administratively shuts down all physical interfaces as a safety measure. You must issue 'no shutdown' on required interfaces.")
#faq-box("What is the difference between 'enable password' and 'enable secret'?", "'enable password' uses weak reversible Type 7 Vigenere encryption. 'enable secret' uses irreversible Type 5 MD5 or Type 9 SHA-256 cryptographic hashes.")

#v(2pt)

== Short-Answer Technical Review
1. *State the command to generate 2048-bit RSA keys for SSH on Cisco IOS:* `crypto key generate rsa modulus 2048`.
2. *Identify the exact ROMMON command used to bypass the startup-config:* `confreg 0x2142`.
3. *Why is the command 'config-register 0x2102' required at the end of password recovery?* To restore normal boot behavior so the router reads the saved startup-config from NVRAM on subsequent power cycles.
4. *Explain the purpose of 'logging synchronous' under line console 0:* It prevents unsolicited system log messages from interrupting and splitting the command line currently being typed by the engineer.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer is connected to a router via console and needs to enter ROMMON mode. What must be done?",
  ("Send the Break signal within 60 seconds of powering on", "Hold down the mode button for 30 seconds", "Type 'reload --rommon'", "Delete the IOS image from Flash"),
  0,
  "Sending a Break sequence via terminal emulator during POST interrupts the bootstrap loader and drops the router into ROMMON."
)

#mcq-item(
  "Which command encrypts all existing plaintext passwords in the configuration file using Cisco Type 7 reversible hashing?",
  ("enable secret", "service password-encryption", "crypto key generate rsa", "ip ssh version 2"),
  1,
  "'service password-encryption' obfuscates all plaintext line and enable passwords using Type 7 algorithm."
)

#mcq-item(
  "After changing the secret during password recovery, what is the final command before reloading to make the new password permanent?",
  ("copy startup-config running-config", "copy running-config startup-config", "erase startup-config", "write memory erase"),
  1,
  "'copy running-config startup-config' saves the new password and restored configuration into NVRAM."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Why Type 7 Passwords Are Never Secure", "Cisco Type 7 password encryption uses a fixed XOR key table that was reverse-engineered in 1995. Any Type 7 password hash can be decrypted instantly in 0.001 seconds using public web decoders. Always use Type 8 (PBKDF2) or Type 9 (SHA-256).")

#spotlight-box("2027 Tech Spotlight: Zero Touch Provisioning (ZTP)", "Modern enterprise networks no longer use manual console cables to configure new hardware. Cisco Zero Touch Provisioning (ZTP) uses DHCP Option 43 and Python scripts to automatically download authenticated configurations from cloud portals upon first boot.")
'''

# =============================================================================
# CHAPTER 07: Layer 2 Switching, CAM Table Operations & Port Security Lab
# =============================================================================
chapters_eng_1_8[7] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 07 · LAYER 2 SWITCHING & PORT SECURITY]
= Chapter 7: Layer 2 Switching, CAM Tables & Port Security Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Layer 2 frame forwarding logic, Content Addressable Memory (CAM) table mechanics, MAC flooding vulnerabilities, and enterprise switchport port-security configuration with violation recovery.
]

#v(2pt)

== 7.1 Layer 2 Transparent Bridging & Switch Logic
Ethernet switches forward frames based on 48-bit MAC addresses. A switch executes four foundational operations:
- *1. Learn (Source MAC):* When an Ethernet frame enters a switch port, the switch inspects the #hl[Source MAC Address]. If not present in its CAM table, it records the MAC address, interface port, and VLAN with a 300-second aging timer.
- *2. Forward (Known Unicast Destination):* The switch inspects the #hl[Destination MAC Address]. If found in the CAM table, it transmits the frame strictly out that single associated port.
- *3. Filter:* If the destination MAC resides on the same port segment that originated the frame, the switch silently discards it, preventing unnecessary link congestion.
- *4. Flood (Unknown Unicast, Multicast, Broadcast):* If the destination MAC is not in the CAM table, or is a broadcast (`FF:FF:FF:FF:FF:FF`), the switch #hl[floods the frame out all ports belonging to that VLAN except the incoming port].

#v(2pt)

== 7.2 CAM Table Architecture & MAC Address Table Aging
The Content Addressable Memory (CAM) table allows 1-clock-cycle hardware lookup. The default aging timer for inactive dynamic MAC entries in Cisco IOS is #hl[300 seconds (5 minutes)].
#terminal-box([
```cisco
Switch# show mac address-table
          Mac Address Table
-------------------------------------------
Vlan    Mac Address       Type        Ports
----    -----------       --------    -----
  10    001b.782a.8c11    DYNAMIC     Gi0/1
  10    001b.782a.8c22    DYNAMIC     Gi0/2
Total Mac Addresses for this module: 2
```
])

#v(2pt)

#grid(
  columns: (1fr, 1.3fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 7.1: Production Enterprise Gigabit Access Switch.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab02-port-security-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 7.2: Lab 02 — Switchport Port Security Topology.]
  ]
)

#pagebreak()

== 7.3 Layer 2 Attacks: MAC Flooding & CAM Table Exhaustion
In a *CAM Table Overflow Attack*, an attacker floods the switch with tens of thousands of bogus, randomized source MAC addresses per second (using tools like `macof`).
- *Consequence:* The switch CAM table fills to capacity. Unable to learn new addresses, the switch falls back to behaving like a legacy hub, #hl[flooding all incoming frames out every port]. The attacker can then capture sensitive traffic using a packet sniffer.
- *Defense:* Implement #hl[Switchport Port Security] to restrict the number of learned MAC addresses per interface.

#v(2pt)

== 7.4 Switchport Port Security Complete CLI Implementation
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Violation Mode*], [*Frame Forwarding*], [*Violation Counter*], [*Syslog / SNMP Trap & Status*]),
  [`Protect`], [Drops unauthorized frames], [Does not increment], [No alerts generated. Port remains UP.],
  [`Restrict`], [Drops unauthorized frames], [Increments counter], [Generates Syslog & SNMP trap. Port remains UP.],
  [`Shutdown` (Default)], [Drops all traffic], [Increments counter], [Generates Syslog. Immediately disables port into `err-disabled`.]
)

#v(2pt)

#terminal-box([
```cisco
Switch(config)# interface GigabitEthernet0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport port-security
Switch(config-if)# switchport port-security maximum 2
Switch(config-if)# switchport port-security mac-address sticky
Switch(config-if)# switchport port-security violation restrict
Switch(config-if)# exit
! Global Automated Err-Disable Recovery:
Switch(config)# errdisable recovery cause psecure-violation
Switch(config)# errdisable recovery interval 30
```
])

#v(2pt)

== 7.5 Port Security Verification & Troubleshooting
#terminal-box([
```cisco
Switch# show port-security interface GigabitEthernet0/1
Port Security              : Enabled
Port Status                : Secure-up
Violation Mode             : Restrict
Aging Time                 : 0 mins
Secure MACAddress-Max(Count) : 2
Security Violation Count   : 0
Sticky MAC Addresses       : 1
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("Why must 'switchport mode access' be entered before enabling port security?", "By default, Cisco switch ports operate in dynamic desirable or dynamic auto DTP mode. Port security is only supported on static access or static trunk ports; attempting to enable it on dynamic ports triggers an IOS syntax error.")
#faq-box("What is the advantage of 'mac-address sticky' over static MAC configuration?", "'sticky' allows the switch to automatically learn the connected device's MAC address from the first frame received and instantly write it into running-config, saving hours of manual MAC entry.")
#faq-box("How do you recover an interface in 'err-disabled' state without automated recovery?", "An engineer must manually enter the interface configuration submode and issue 'shutdown' followed by 'no shutdown'.")

#v(2pt)

== Short-Answer Technical Review
1. *State the default violation mode for Cisco port security:* `Shutdown`.
2. *Identify the aging timer for dynamic CAM table entries in Cisco IOS:* 300 seconds (5 minutes).
3. *Explain the operational difference between Restrict and Protect violation modes:* Both drop unauthorized frames, but Restrict increments the violation counter and sends Syslog/SNMP traps, whereas Protect drops frames silently.
4. *What command enables automatic recovery for interfaces disabled by port security violations?* `errdisable recovery cause psecure-violation`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "A switch port configured with port security encounters a violation. The port immediately turns amber and its status shows 'err-disabled'. Which violation mode is active?",
  ("Protect", "Restrict", "Shutdown", "Monitor"),
  2,
  "Shutdown mode immediately places the port into an err-disabled state upon security violation."
)

#mcq-item(
  "Which command automatically saves dynamically learned MAC addresses directly into the running configuration?",
  ("switchport port-security mac-address dynamic", "switchport port-security mac-address sticky", "switchport mac-address-table permanent", "switchport security learn auto"),
  1,
  "'mac-address sticky' converts dynamic MAC learning into persistent configuration entries."
)

#mcq-item(
  "What type of network attack is directly mitigated by enabling switchport port-security with a maximum of 2 MAC addresses?",
  ("ARP Poisoning", "CAM Table Flooding / Overflow", "DHCP Starvation", "VLAN Hopping"),
  1,
  "Port security prevents attackers from flooding thousands of random MAC addresses to overflow the switch CAM table."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? TCAM vs CAM Tables", "Standard CAM tables look up exact binary matches (0 or 1) for Layer 2 MAC addresses. Ternary CAM (TCAM) evaluates a third state: 'Don't Care' (X). TCAM allows Layer 3 switches to evaluate complex ACL rules and subnet masks in a single clock cycle.")

#spotlight-box("2027 Tech Spotlight: 802.1X Dynamic VLAN Assignment & Cisco ISE", "Static port security is being superseded in modern zero-trust campuses by IEEE 802.1X Network Access Control. When a user authenticates via Cisco Identity Services Engine (ISE), the switch dynamically assigns the port to that user's specific role-based VLAN.")
'''

# =============================================================================
# CHAPTER 08: Enterprise VLANs, 802.1Q Trunking & Native VLAN 999 Isolation Lab
# =============================================================================
chapters_eng_1_8[8] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 08 · VLANS & 802.1Q TRUNKING]
= Chapter 8: Enterprise VLANs, 802.1Q Trunking & Native VLAN 999 Isolation Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Broadcast domain segmentation, IEEE 802.1Q frame tagging architecture, access vs trunk ports, Native VLAN security risks, VLAN hopping mitigation, and production Native VLAN 999 isolation lab.
]

#v(2pt)

== 8.1 Virtual LANs (VLANs) & Broadcast Containment
A Virtual Local Area Network (VLAN) is a logical partition of a physical Layer 2 switch. By default, all ports on a factory Cisco switch belong to #hl[VLAN 1].
- *Broadcast Containment:* Broadcast frames (such as ARP requests and DHCP discovers) propagate across all ports belonging to that specific VLAN, but #hl[never cross into another VLAN].
- *Security Segmentation:* Financial, HR, VoIP, and Guest traffic remain completely isolated at Layer 2 even when sharing the same physical switch hardware.
- *Departmental Flexibility:* Users in the same department can belong to the same IP subnet regardless of physical desk locations across multi-floor campus buildings.

#v(2pt)

== 8.2 IEEE 802.1Q Trunking Protocol & Frame Format
When traffic from multiple VLANs must traverse a single physical link between switches, #hl[VLAN Trunking] is required. The industry standard is IEEE 802.1Q:
- *4-Byte Tag Insertion:* 802.1Q inserts a 4-byte (32-bit) tag directly between the Source MAC address and the EtherType fields of the original Ethernet frame:
  - *TPID (Tag Protocol Identifier - 16 bits):* Set to `0x8100` to indicate an 802.1Q tagged frame.
  - *PCP (Priority Code Point - 3 bits):* Specifies 802.1p Quality of Service (QoS) Class of Service (CoS 0 to 7).
  - *DEI (Drop Eligible Indicator - 1 bit):* Indicates frames eligible for discard during congestion.
  - *VID (VLAN Identifier - 12 bits):* Identifies the VLAN (1 to 4094). Supports Normal Range (1–1005) and Extended Range (1006–4094).

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab03-vlan-trunking-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 8.1: Packet Tracer Lab 03 — Multi-VLAN 802.1Q Trunking & Native VLAN Isolation.]
]

#pagebreak()

== 8.3 The Native VLAN & Vulnerabilities (VLAN Hopping)
- *Native VLAN Concept:* Under 802.1Q, frames belonging to the *Native VLAN* (default VLAN 1) are transmitted across the trunk #hl[without any 802.1Q tag (untagged)]. If an untagged frame is received on a trunk port, it is assigned to the Native VLAN.
- *VLAN Hopping Attack (Double Tagging):*
  - An attacker on Native VLAN 1 crafts a frame with #hl[two 802.1Q tags]: Outer Tag = VLAN 1 (Native), Inner Tag = VLAN 20 (Target Victim).
  - When the first switch receives the frame, it strips the outer VLAN 1 tag and forwards the frame untagged across the trunk.
  - The second switch inspects the remaining inner tag (VLAN 20) and delivers the packet directly to the victim, bypassing Layer 3 firewalls!
- *Defense Strategy: Native VLAN 999 Isolation:*
  1. Never use default VLAN 1 for user traffic or trunking.
  2. Create a dedicated unused dummy VLAN (e.g., VLAN 999 or 888) and set it as the Native VLAN on all trunks.
  3. Force 802.1Q tagging on native frames globally: `vlan dot1q tag native`.
  4. Disable Dynamic Trunking Protocol (DTP) on all user access ports: `switchport nonegotiate`.

#v(2pt)

== 8.4 Production Enterprise VLAN & Trunking CLI Configuration
#terminal-box([
```cisco
! Configure Departmental VLANs:
Switch(config)# vlan 10
Switch(config-vlan)# name Engineering_LAN
Switch(config-vlan)# vlan 20
Switch(config-vlan)# name Finance_LAN
Switch(config-vlan)# vlan 999
Switch(config-vlan)# name Native_Trunk_Isolation
Switch(config-vlan)# exit

! Hardening 802.1Q Trunk Uplink:
Switch(config)# interface GigabitEthernet0/1
Switch(config-if)# switchport trunk encapsulation dot1q
Switch(config-if)# switchport mode trunk
Switch(config-if)# switchport trunk native vlan 999
Switch(config-if)# switchport trunk allowed vlan 10,20,999
Switch(config-if)# switchport nonegotiate
Switch(config-if)# exit

! Assigning Hardened Access Ports:
Switch(config)# interface range FastEthernet0/1 - 10
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 10
Switch(config-if-range)# switchport nonegotiate
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("What happens if the Native VLAN does not match on both ends of a trunk link?", "A Native VLAN mismatch causes traffic leaking between different VLANs and triggers continuous Cisco Discovery Protocol (CDP) warning logs ('%CDP-4-NATIVE_VLAN_MISMATCH'). Spanning Tree Protocol may also block the port to prevent loops.")
#faq-box("Why should Dynamic Trunking Protocol (DTP) be disabled?", "DTP automatically negotiates trunking. If an attacker connects a laptop running DTP negotiation tools, the switch port will automatically convert to a trunk, exposing all network VLANs to the attacker.")
#faq-box("What is the difference between Normal Range and Extended Range VLANs?", "Normal range VLANs (1–1005) are saved in the 'vlan.dat' file in Flash memory. Extended range VLANs (1006–4094) are saved directly in the running-config and require VTP version 3 or VTP transparent mode.")

#v(2pt)

== Short-Answer Technical Review
1. *State the size of the 802.1Q tag inserted into an Ethernet frame:* 4 bytes (32 bits).
2. *Identify the 12-bit field in an 802.1Q tag that specifies the VLAN:* VID (VLAN Identifier), supporting values from 1 to 4094.
3. *Why should user ports never be left in default VLAN 1?* VLAN 1 is vulnerable to VLAN hopping and unauthorized discovery via CDP/LLDP. Isolating users into dedicated VLANs enforces security.
4. *What command prevents a switch port from negotiating trunking via DTP?* `switchport nonegotiate`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer enters 'switchport trunk allowed vlan 10,20'. What happens to frames belonging to VLAN 30 on this trunk link?",
  ("They are dropped by the switch", "They are forwarded untagged", "They are forwarded on VLAN 1", "They trigger an error"),
  0,
  "The 'allowed vlan' list filters trunk traffic; any VLAN not explicitly allowed on the trunk is dropped."
)

#mcq-item(
  "Which field in the 802.1Q header is used to convey Quality of Service (QoS) Class of Service markings?",
  ("TPID", "PCP (Priority Code Point)", "DEI", "VID"),
  1,
  "The 3-bit Priority Code Point (PCP) field marks 802.1p Layer 2 Class of Service (CoS) values from 0 to 7."
)

#mcq-item(
  "What is the operational consequence of a Native VLAN mismatch across an 802.1Q trunk link?",
  ("Immediate physical link shutdown", "Traffic leaking between disparate VLANs and CDP error alerts", "Switch crashes and reloads", "Port enters err-disabled mode"),
  1,
  "A Native VLAN mismatch causes frames transmitted untagged by one switch to be read into a completely different VLAN by the neighboring switch."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Why Baby Giant Frames Exist", "Standard Ethernet Maximum Transmission Unit (MTU) is 1500 bytes. Adding the 4-byte 802.1Q tag increases frame size to 1504 bytes. Switches that support these frames without fragmentation are designed to handle 'Baby Giant' frames.")

#spotlight-box("2027 Tech Spotlight: VXLAN (Virtual Extensible LAN)", "Modern enterprise datacenters are moving beyond the 4094 VLAN limit using VXLAN (RFC 7348). VXLAN encapsulates Layer 2 Ethernet frames inside 50-byte Layer 3 UDP packets, supporting up to 16 million virtual network segments (VNIs).")
'''
print("[OK] English Chapters 01 to 08 loaded successfully.")
