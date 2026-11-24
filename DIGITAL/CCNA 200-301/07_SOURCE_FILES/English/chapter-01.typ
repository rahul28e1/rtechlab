#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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
