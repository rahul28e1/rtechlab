#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 12 · OSPF DYNAMIC ROUTING ARCHITECTURE]
= Chapter 12: Single & Multi-Area OSPFv2 Dynamic Routing Architecture Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Link-State protocol foundations, Dijkstra Shortest Path First (SPF) algorithm, OSPF Area 0 backbone hierarchy, 5 LSA types, 7 neighbor adjacency states, DR/BDR election math, cost calculation, and production OSPFv2 CLI lab.
]

#v(2pt)

== 12.1 Open Shortest Path First (OSPFv2) Fundamentals
OSPFv2 (RFC 2328) is an open-standard #hl[Link-State Dynamic Routing Protocol] widely deployed in enterprise networks:
- *Link-State Logic:* Unlike Distance-Vector protocols that share full routing tables periodically (routing by rumor), OSPF routers advertise the status and cost of their links via Link-State Advertisements (LSAs).
- *Dijkstra's SPF Algorithm:* Every router in the same OSPF area possesses an identical Link-State Database (LSDB). Each router runs Dijkstra's algorithm using itself as the root to construct a loop-free Shortest Path Tree.
- *Two-Tier Area Hierarchy:*
  - *Backbone Area (Area 0 / 0.0.0.0):* The central core of OSPF. All other non-backbone areas #hl[must physically connect directly to Area 0] to prevent routing loops.
  - *Standard Non-Backbone Areas:* Segment the network into manageable blocks, containing SPF recalculations and memory usage within the local area.
  - *Area Border Router (ABR):* A router with interfaces in both Area 0 and a non-backbone area.

#v(2pt)

== 12.2 OSPF 7 Neighbor Adjacency States
To form an adjacency and exchange routing information, OSPF neighbors transition through 7 states:
#table(
  columns: (1.2fr, 4.8fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*Neighbor State*], [*Operational Milestone & Exchange Protocol*]),
  [`Down`], [No OSPF Hello packets received from the neighbor.],
  [`Init`], [Hello received from neighbor, but local Router-ID is not yet listed in the neighbor's Hello.],
  [`2-Way`], [Bi-directional communication established (local Router-ID seen in neighbor Hello). DR/BDR election occurs on multi-access links. DROTHER routers remain in 2-Way state with each other.],
  [`ExStart`], [First step of database synchronization. Routers negotiate Master/Slave relationship and initial Database Description (DBD) sequence number based on highest Router-ID.],
  [`Exchange`], [Routers exchange Database Description (DBD) packets containing summary headers of their LSDB.],
  [`Loading`], [Routers request missing or newer link-state information using Link State Requests (LSR), answered by Link State Updates (LSU).],
  [`Full`], [LSDBs are completely synchronized. Adjacency is fully operational and routes are calculated.]
)

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab07-ospf-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 12.1: Packet Tracer Lab 07 — Single & Multi-Area OSPFv2 Routing Topology.]
]

#pagebreak()

== 12.3 DR & BDR Election on Broadcast Multi-Access Networks
On multi-access networks (Ethernet), if every router formed full adjacencies with every other router, $N(N-1)/2$ adjacencies would overload the network with redundant LSUs.
- *Designated Router (DR):* Central router that receives all LSAs and updates other routers.
- *Backup Designated Router (BDR):* Hot standby that assumes DR duties if the primary DR fails.
- *Multicast Groups:* DROTHER routers send LSUs to #hl[`224.0.0.6`] (All DR Routers). The DR broadcasts updates to #hl[`224.0.0.5`] (All OSPF Routers).
- *Election Criteria (Non-Preemptive):*
  1. #hl[Highest OSPF Interface Priority] (`ip ospf priority 0-255`, default `1`). A priority of `0` permanently disqualifies the router from becoming DR/BDR.
  2. #hl[Highest Router-ID (Tiebreaker):]
     - Manual Router-ID (`router-id X.X.X.X`) takes first priority.
     - Highest IPv4 address on any active Loopback interface.
     - Highest IPv4 address on any active physical interface.

#v(2pt)

== 12.4 OSPF Metric / Cost Calculation
OSPF uses *Cost* as its metric, inversely proportional to interface bandwidth:
$ "Cost" = "Reference Bandwidth" / "Interface Bandwidth" = 10^8 / "Bandwidth (in bps)" $
- 100 Mbps (FastEthernet) = Cost 1.
- 1 Gbps (GigabitEthernet) = Cost 1 (Capped by default reference bandwidth!).
- *Fixing 1G/10G Metric Disparity:* Must issue `auto-cost reference-bandwidth 1000` (or `10000`) on all routers.

#v(2pt)

== 12.5 The Five Primary OSPF LSA Types
#table(
  columns: (1fr, 1.4fr, 1.3fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*LSA Type*], [*LSA Name*], [*Originating Router*], [*Flooding Boundary & Scope*]),
  [Type 1], [Router LSA], [Every internal router], [Flooded only within the originating area.],
  [Type 2], [Network LSA], [DR on multi-access link], [Flooded only within the originating area.],
  [Type 3], [Summary LSA], [ABR (Area Border Router)], [Advertises inter-area routes into other areas.],
  [Type 4], [ASBR Summary LSA], [ABR], [Advertises how to reach an ASBR across areas.],
  [Type 5], [AS External LSA], [ASBR], [Advertises external redistributed routes (e.g., from BGP).]
)

#v(2pt)

== 12.6 Production OSPFv2 CLI Configuration Lab
#terminal-box([
```cisco
Router(config)# router ospf 1
Router(config-router)# router-id 1.1.1.1
Router(config-router)# auto-cost reference-bandwidth 1000
Router(config-router)# network 10.1.1.0 0.0.0.255 area 0
Router(config-router)# network 192.168.10.0 0.0.0.255 area 0
Router(config-router)# passive-interface GigabitEthernet0/0/2
Router(config-router)# default-information originate
Router(config-router)# exit
! Set DR priority on multi-access transit link:
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ip ospf priority 255
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("Why must 'passive-interface' be configured on user-facing LAN ports?", "Sending OSPF Hello packets out access ports toward end-user PCs wastes CPU and bandwidth. Worse, an attacker could connect a rogue router and inject false routes into the enterprise network.")
#faq-box("Why is OSPF DR/BDR election non-preemptive?", "If election were preemptive, adding a new router with a higher priority would force a DR renegotiation, tearing down active neighbor relationships and disrupting packet forwarding.")
#faq-box("What four parameters must match between OSPF neighbors to form an adjacency?", "1. Area ID, 2. Subnet and Subnet Mask, 3. Hello and Dead intervals (default 10s/40s), and 4. Authentication credentials / Stub flags.")

#v(2pt)

== Short-Answer Technical Review
1. *State the formula for calculating OSPF wildcard mask from a subnet mask:* Subtract each octet of the subnet mask from 255 (e.g., $255.255.255.0 -> bold(0.0.0.255)$).
2. *Identify the multicast IP address used by DROTHER routers to transmit LSUs to the DR:* `224.0.0.6`.
3. *What is the function of the command 'default-information originate' in OSPF?* Injects a default route (`0.0.0.0/0`) into the OSPF domain if a default route is already present in the router's routing table.
4. *Name the LSA Type generated by an Area Border Router (ABR) to describe inter-area networks:* Type 3 Summary LSA.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "Two OSPF routers are directly connected via Gigabit Ethernet. Router A has Hello/Dead timers of 10s/40s, while Router B has 15s/60s. What will happen?",
  ("They form full adjacency", "They stay in 2-Way state", "They will never form an adjacency and remain in Down/Init state", "They negotiate the lowest timer"),
  2,
  "OSPF Hello and Dead intervals must match exactly; mismatched timers prevent adjacency formation."
)

#mcq-item(
  "Which OSPF state indicates that bi-directional communication has been established and DR/BDR election has occurred?",
  ("Init", "2-Way", "ExStart", "Full"),
  1,
  "The 2-Way state confirms bi-directional communication and is where DR/BDR election takes place."
)

#mcq-item(
  "What is the default OSPF cost for a 10 Gigabit Ethernet link under the default reference bandwidth?",
  ("10", "1", "0.1", "100"),
  1,
  "Under default reference bandwidth (100 Mbps), any link speed >= 100 Mbps (including 1G and 10G) truncates to a cost of 1."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Why Area 0 is Called the Backbone", "In OSPF, the rule prohibiting inter-area traffic from bypassing Area 0 is a mathematical loop prevention mechanism. It forces all area-to-area traffic into a strict star topology, preventing the split-horizon loops common to distance-vector protocols.")

#spotlight-box("2027 Tech Spotlight: OSPFv3 Address Families", "OSPFv3 (RFC 5838) supports both IPv4 and IPv6 routing within a single protocol process using Address Families (AF), simplifying dual-stack enterprise migrations.")
