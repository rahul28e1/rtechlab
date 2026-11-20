#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 01 · ENTERPRISE NETWORK ARCHITECTURE]
= Chapter 1: Network Architecture & Modern Topologies

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Foundations of enterprise network engineering: formal definitions, client-server vs peer-to-peer, physical vs logical topologies, Cisco 3-tier hierarchical architecture, 2-tier collapsed core, modern spine-leaf datacenter fabric, and wide area network (WAN) interconnects.
]

#v(2pt)

== 1.1 Enterprise Networking Fundamentals & Data Communication
A computer network is an #hl[interconnected collection of autonomous computing nodes] communicating via standardized physical media and protocols to exchange digital bitstreams.
- *Client-Server vs Peer-to-Peer (P2P):* In a *Client-Server* model, dedicated high-capacity systems (servers) host centralized directory, file, and web services, while client endpoints request resources subject to authentication and access control. In *P2P* networks, each host acts concurrently as both client and server without centralized administrative control, introducing security and manageability challenges at scale.
- *Physical vs Logical Topology:* The *Physical Topology* describes the actual spatial layout and cabling routes of network devices (racks, patch panels, conduits). The *Logical Topology* defines the transmission paths taken by data frames across the network fabric, regardless of physical cabling arrangement (e.g., physical star with a logical bus).

#v(2pt)

== 1.2 Comparison of Network Topologies & Failure Domains
#table(
  columns: (1fr, 1.3fr, 1.4fr, 2.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Topology*], [*Fault Tolerance*], [*Implementation Cost*], [*Enterprise Operational Characteristics*]),
  [Star], [High (Single host failure isolated)], [Moderate (Central switch required)], [Standard campus access architecture. Failure of central switch collapses segment; mitigated by dual-homing.],
  [Full Mesh], [Maximum ($N(N-1)/2$ physical links)], [Prohibitive at scale], [Used in enterprise Core and WAN edge. Every node connects to all others; zero downtime on single link failure.],
  [Partial Mesh], [High (Redundant uplinks)], [Balanced / Practical], [Standard enterprise WAN and distribution layer. Core nodes have redundant backup paths to key sites.],
  [Bus / Ring], [Low (Single break disrupts bus)], [Low / Legacy], [Legacy Ethernet (10BASE2/5) and Token Ring / FDDI. Rarely deployed in modern high-speed enterprise LANs.]
)

#v(2pt)

== 1.3 The Cisco 3-Tier Hierarchical Network Design Model
To build predictable, scalable, and manageable enterprise campuses, Cisco developed the 3-Tier model:
- *Core Layer (High-Speed Backbone):* Engineered for maximum throughput and zero packet filtering. Its sole duty is to switch packets between distribution blocks as fast as possible using high-capacity L3 switches, redundant power supplies, and hot-swappable supervisor modules.
- *Distribution Layer (Policy & Routing Boundary):* Aggregates access layer switches, terminates VLANs, executes inter-VLAN routing, enforces Access Control Lists (ACLs), manages QoS prioritization, and defines boundary security filters.
- *Access Layer (Endpoint Connectivity):* Delivers network access to end-user workstations, IP phones, wireless access points (APs), and network printers. Enforces port security, 802.1X authentication, and PoE (Power over Ethernet).


#v(3pt)


== 1.4 The 2-Tier Collapsed Core Architecture
In small to mid-sized enterprises (under 500 users) or branch offices, a full 3-tier hierarchy introduces unnecessary hardware expense and latency.
- *Design Concept:* The Core and Distribution layers are physically combined into a single unified switching tier known as the #hl[Collapsed Core].
- *Advantages:* Cuts initial capital expenditure (CapEx) and power consumption by half, simplifies routing protocols, reduces rack footprint, and minimizes management overhead while retaining dual-homed uplink redundancy from the access tier.
- *Constraint:* Scalability is bounded. When port density or routing table size exceeds collapsed switch capacity, modular migration back to 3-tier is required.

#v(2pt)

== 1.5 Modern Data Center Fabric: Spine-Leaf Architecture
Traditional 3-tier Spanning Tree designs create unpredictable latency bottlenecks for East-West traffic (server-to-server traffic within modern virtualized clusters). Modern datacenters employ the *Spine-Leaf (Clos)* topology:
- *Leaf Switches (Top-of-Rack / ToR):* Every server connects directly to Leaf switches. Leaf switches never connect to other Leafs.
- *Spine Switches (High-Speed Fabric Core):* Every Leaf switch connects to #hl[every single Spine switch]. Spine switches never connect to other Spines.
- *Predictable 2-Hop Latency:* Any server communicates with any other server across the datacenter in exactly *2 network hops* (Leaf $arrow$ Spine $arrow$ Leaf).
- *Equal-Cost Multi-Path (ECMP):* Eliminates Spanning Tree link blocking. All uplink connections remain active concurrently, delivering massive bisectional bandwidth.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg",
  caption: "Figure 1.1: Enterprise Spine-Leaf Datacenter Fabric with redundant Top-of-Rack (ToR) fiber uplinks.",
  height: 52pt
)

#v(2pt)

== 1.6 Wide Area Network (WAN) Architectures & SOHO Edge
Modern enterprise communication extends far beyond local physical campuses:
1. *Point-to-Point Leased Lines (T1/E1, Metro Ethernet):* Dedicated, unshared bandwidth between two geographic endpoints; high reliability and security but expensive monthly recurring cost.
2. *MPLS (Multiprotocol Label Switching):* Service-provider managed label-switched wide area network enabling guaranteed SLA metrics, traffic engineering, and private Layer 3 VPN connectivity.
3. *SD-WAN (Software-Defined WAN):* Decouples control plane from underlying transport (Broadband, 4G/5G, MPLS), dynamically routing packets based on real-time jitter, packet loss, and application SLAs.
4. *Small Office / Home Office (SOHO):* Integrates modem, router, firewall, 4-port Gigabit switch, and Wi-Fi access point into a single customer-premises equipment (CPE) appliance using NAT/PAT.


#v(3pt)


== 1.7 Network Topologies & Operational Metrics Matrix
#table(
  columns: (1fr, 1.3fr, 1.1fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Architecture*], [*Primary Traffic Flow*], [*Redundancy Protocol*], [*Key Design Rule & Constraint*]),
  [3-Tier Campus], [North-South (User to Internet/DC)], [HSRP / VRRP / STP], [Never configure packet filtering or ACLs on Core tier; keep Core pure high-speed packet switching.],
  [Collapsed Core], [North-South & Local Inter-VLAN], [StackWise / VSS], [Ideal for 200–500 users. L3 routing and ACL policy enforced directly on the collapsed core switches.],
  [Spine-Leaf], [East-West (Server to Server)], [ECMP L3 Routing (BGP/OSPF)], [Leaf switches must connect to every Spine; no Leaf-to-Leaf or Spine-to-Spine interconnections allowed.],
  [SD-WAN Edge], [Dynamic Multi-Path WAN], [IPsec VPN Tunnels], [Applies application-aware routing over commodity internet; automatically steers VoIP over best-latency link.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "North-South vs East-West Traffic")[
      *North-South Traffic:* Traffic entering or exiting the datacenter boundary (e.g., external user accessing a web portal via firewall and internet router).      *East-West Traffic:* Traffic moving laterally between servers, storage nodes, and microservices inside the datacenter (e.g., API backend querying database cluster). Spine-Leaf optimizes East-West traffic.
    ]
  ],
  [
    #concept-box(title: "Three-Tier Redundancy Rule")[
      In a production 3-Tier design, each Access switch MUST maintain redundant physical uplinks to *two distinct Distribution switches*. Spanning Tree Protocol (STP) blocks one link to prevent Layer 2 loops while First Hop Redundancy Protocols (HSRP/VRRP) provide instant default-gateway failover.
    ]
  ]
)

#v(2pt)

== 1.8 Summary of Enterprise Network Roles & Boundaries
Enterprise network architecture establishes clear boundaries between operational domains:
1. *Campus LAN:* High-bandwidth, low-latency infrastructure owned and operated internally by the enterprise.
2. *Enterprise Edge:* The security perimeter hosting DMZ servers, next-generation firewalls (NGFW), border routers, and VPN concentrators.
3. *Service Provider Core:* The carrier infrastructure (Tier 1 ISPs, telecom providers) transporting transit traffic across transatlantic fiber cables and national backbones.


#v(3pt)



== 1.6 Enterprise Topology Architecture Comparison Matrix
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Topology Model*], [*Target Scale*], [*Layer 2 / 3 Boundary*], [*Production Engineering Characteristics*]),
  [Three-Tier Hierarchical], [Large Enterprise (1000+ hosts)], [Routed at Core/Distribution], [Strict segregation: Core (high-speed transport), Distribution (policy/routing), Access (endpoints).],
  [Two-Tier Collapsed Core], [Medium/SMB (50 - 500 hosts)], [Routed at Collapsed Tier], [Combines Core and Distribution into single physical or VSS/StackWise switch pair. Cost-effective.],
  [Spine-Leaf (Clos)], [Datacenter & Cloud Fabrics], [Routed at Leaf Switches (L3)], [Every Leaf connects to every Spine. Deterministic 2-hop East-West traffic latency. Loop-free without STP.],
  [SOHO Architecture], [Branch / Home (1 - 25 hosts)], [Routed at Edge Gateway], [Integrated single-chassis router/switch/firewall/AP appliance. Uplink via single broadband/LTE ISP.]
)

#v(3pt)

== 1.7 Cloud Service & Deployment Models Reference Matrix
Cloud computing shifts enterprise workloads from physical on-premises datacenters to shared or private virtualization pools:
#table(
  columns: (1fr, 1.3fr, 1.5fr, 2.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Model*], [*Management Boundary*], [*Customer Responsibility*], [*Enterprise Example & CCNA Relevance*]),
  [IaaS (Infrastructure)], [Hardware / Hypervisor], [OS, Middleware, Apps, Data], [AWS EC2, Cisco Cloud Services Router (CSR1000v), Azure VM.],
  [PaaS (Platform)], [Underlying OS & Runtimes], [Application Code & Data], [AWS Elastic Beanstalk, Google App Engine. No OS maintenance.],
  [SaaS (Software)], [Entire Stack Managed], [User Access & Configuration], [Cisco Webex, Microsoft 365, Salesforce. Complete turnkey service.],
  [Private Cloud], [On-Premises Dedicated], [Total Stack Control & SLA], [VMware vSphere / OpenStack deployed in corporate datacenter.],
  [Hybrid Cloud], [Interconnected Public/Private], [Unified Security & Orchestration], [On-premises database connected via AWS Direct Connect / IPsec VPN.]
)

#v(3pt)

== 1.8 Network Performance Metrics & Quality of Service (QoS)
Network performance is objectively measured across four core metrics governed by Service Level Agreements (SLAs):
- *Bandwidth vs Throughput:* *Bandwidth* is the theoretical maximum data transfer capacity of a physical medium (e.g. 1 Gbps GigabitEthernet). *Throughput* is the actual rate of successfully delivered application data payload after subtracting Layer 2/3/4 header overhead, collisions, and retransmissions.
- *Latency (Delay):* The elapsed time required for a packet to travel from source to destination. Sources include *Propagation Delay* (speed of light in copper/fiber: ~5 microseconds per kilometer), *Serialization Delay* (time to push bits onto wire), and *Queuing Delay* (time waiting in switch buffers).
- *Jitter (Delay Variation):* The statistical variance in packet arrival times. High jitter causes audio distortion and video stuttering in Real-Time Transport Protocol (RTP) voice/video streams.
- *Packet Loss:* Percentage of packets discarded due to link congestion or buffer overflow. Enterprise VoIP requires packet loss under #hl[1%], latency under #hl[150 ms], and jitter under #hl[30 ms].

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why should ACLs never be configured on the Cisco 3-Tier Core Layer?", a: "The Core layer is optimized exclusively for maximum packet throughput and low latency. Processing ACLs requires CPU cycles and packet inspection that create severe throughput bottlenecks.")
#faq-item(q: "What is the primary operational advantage of Spine-Leaf over traditional 3-Tier?", a: "Spine-Leaf guarantees consistent 2-hop latency for server-to-server (East-West) traffic and utilizes Equal-Cost Multi-Path (ECMP) so all links are actively forwarding without STP blocking.")
#faq-item(q: "When should an engineer select a Collapsed Core over a 3-Tier design?", a: "Collapsed Core is ideal for small to mid-sized campuses (under 500 users) where budget, power, and physical space do not justify separate physical core switches.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Name the three functional layers of the classic Cisco Hierarchical Model.", ans: "Core Layer, Distribution Layer, and Access Layer.")
#short-q(num: 2, q: "How many physical links are required in a full-mesh topology with 8 nodes?", ans: "28 physical links (Formula: N(N-1)/2 = 8*7/2 = 28).")
#short-q(num: 3, q: "What traffic pattern dominates modern cloud and virtualized datacenters?", ans: "East-West traffic (server-to-server and microservice communication).")
#short-q(num: 4, q: "Which network layer enforces 802.1X port security and Power over Ethernet (PoE)?", ans: "The Access Layer.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which tier in the Cisco 3-tier model is responsible for routing policy, VLAN termination, and ACL enforcement?", a: "Core Layer", b: "Distribution Layer", c: "Access Layer", d: "Physical Layer", ans: "B", expl: "The Distribution Layer aggregates access switches and enforces security boundaries, routing policies, and QoS.")
#mcq(num: 2, q: "In a Spine-Leaf datacenter fabric, which device-to-device connection is strictly PROHIBITED?", a: "Leaf to Server", b: "Leaf to Spine", c: "Spine to Spine", d: "Leaf to Storage Array", ans: "C", expl: "In Spine-Leaf Clos architecture, Spines never connect to other Spines, and Leafs never connect to other Leafs.")
#mcq(num: 3, q: "What is the main benefit of a 2-Tier Collapsed Core architecture?", a: "Eliminates need for Layer 3 routing", b: "Reduces cost, cabling, and hardware footprint while maintaining redundancy", c: "Provides infinite horizontal scalability", d: "Replaces Ethernet with InfiniBand", ans: "B", expl: "Collapsed Core combines Core and Distribution into one tier, reducing hardware cost and complexity for smaller networks.")
#mcq(num: 4, q: "How many network hops are traversed between any two servers in a Spine-Leaf network?", a: "1 hop", b: "Exactly 2 hops", c: "3 to 5 hops depending on STP", d: "Variable based on MTU", ans: "B", expl: "Traffic travels from source Leaf to Spine, then directly to destination Leaf, ensuring a deterministic 2-hop journey.")
#mcq(num: 5, q: "Which WAN technology decouples the control plane from physical hardware and dynamically routes over broadband and MPLS?", a: "Frame Relay", b: "ATM", c: "SD-WAN", d: "Dial-up ISDN", ans: "C", expl: "Software-Defined WAN (SD-WAN) virtualizes WAN connections and dynamically routes traffic based on real-time link quality.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Bisectional Bandwidth Rule")[
      In a non-blocking Spine-Leaf fabric, the total uplink bandwidth from Leafs to Spines must equal or exceed total downlink bandwidth to servers to prevent congestion!
    ]
  ],
  [
    #tech-spotlight-box(title: "AI Cluster InfiniBand & 800G Fabrics")[
      Modern generative AI training datacenters utilize 800 Gbps optical transceivers and Ultra Ethernet / InfiniBand fabrics with sub-microsecond latency.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
