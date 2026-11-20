#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 08 · IP ROUTING & DYNAMIC OSPF]
= Chapter 8: IP Routing, Administrative Distance & OSPF

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Routing fundamentals: Longest Prefix Match (LPM) algorithm, static routes, default routes (0.0.0.0/0), floating static routes, Administrative Distance hierarchy, and in-depth Open Shortest Path First (OSPFv2) single and multi-area dynamic routing.
]

#v(2pt)

== 8.1 IP Routing Decision Logic & Forwarding Mechanics
A router is a Layer 3 internetworking device that connects disparate broadcast domains. When an IPv4 packet arrives at an inbound interface, the router executes the following deterministic forwarding cycle:
- *1. Frame De-encapsulation:* Checks Frame Check Sequence (FCS) for physical transmission errors. Strips the incoming Layer 2 Ethernet header and trailer to reveal the Layer 3 IPv4 packet.
- *2. Destination IP Inspection:* Reads the 32-bit Destination IP address.
- *3. The Longest Prefix Match (LPM) Rule:* Searches the IP Routing Table for candidate routes matching the destination IP. #hl[The route with the longest (most specific) subnet mask is ALWAYS chosen], regardless of routing protocol or Administrative Distance!
  - *Example:* If routing table contains `10.1.0.0/16` (OSPF) and `10.1.1.0/24` (RIP), traffic destined for `10.1.1.50` matches `10.1.1.0/24` because `/24` is longer than `/16`.
- *4. TTL Decrement & Checksum:* Decrements Time-to-Live (TTL) by 1. If TTL reaches 0, the packet is discarded and an ICMP Time Exceeded message (`Type 11, Code 0`) is transmitted to the sender.
- *5. Layer 2 Re-encapsulation:* Resolves the next-hop IP's MAC address via ARP cache, constructs a brand new Ethernet header, and transmits the frame out the exit interface.

#v(2pt)

== 8.2 Administrative Distance (AD) Master Hierarchy Table
Administrative Distance defines the #hl[trustworthiness of a routing information source]. When a router learns about the exact same destination prefix via multiple routing protocols, the route with the #hl[LOWEST Administrative Distance] is installed into the routing table:
#table(
  columns: (1.2fr, 0.9fr, 1.2fr, 2.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Route Source*], [*Default AD*], [*Algorithm / Metric*], [*Enterprise Characteristics*]),
  [Directly Connected], [0], [Physical Interface Link], [Hardware interface assigned an IP address and active (`up/up`).],
  [Static Route], [1], [Manual Administrator Entry], [Configured via `ip route`; highest precedence over dynamic protocols.],
  [eBGP (External BGP)], [20], [Path Vector (AS-Path)], [Inter-Autonomous System routing between ISPs and cloud providers.],
  [EIGRP (Internal)], [90], [DUAL (Bandwidth + Delay)], [Cisco advanced distance-vector protocol; fast convergence.],
  [OSPF], [#hl[110]], [Dijkstra SPF (Cost = $10^8 / "BW"$)], [Open standard link-state protocol; industry standard enterprise IGP.],
  [IS-IS], [115], [Dijkstra SPF (Cost metric)], [Service provider core backbone routing protocol.],
  [RIP (v1 / v2)], [120], [Bellman-Ford (Hop Count, max 15)], [Legacy distance-vector protocol; limited to small networks.],
  [EIGRP (External)], [170], [Redistributed Routes], [Routes imported into EIGRP from external routing protocols.],
  [iBGP (Internal BGP)], [200], [Path Vector], [BGP routing between routers within the same Autonomous System.],
  [Unreachable], [255], [Untrusted], [Router will never install this route into the routing table.]
)

#pagebreak()

== 8.3 Static Routing, Default Routes & Floating Static Routes
Static routes are manually coded path entries ideal for stub networks, small branch offices, and predictable WAN connections:
- *Standard Static Route Syntax:*
  `Router(config)# ip route [destination-network] [subnet-mask] [next-hop-ip | exit-interface]`
  - *Next-Hop IP:* `ip route 172.16.1.0 255.255.255.0 10.0.0.2` (Requires recursive route lookup).
  - *Directly Attached (Exit Interface):* `ip route 172.16.1.0 255.255.255.0 GigabitEthernet0/0/1` (Generates ARP requests for every destination).
  - *Fully Specified (Best Practice):* `ip route 172.16.1.0 255.255.255.0 GigabitEthernet0/0/1 10.0.0.2`
- *Default Route (Gateway of Last Resort):* Matches #hl[all packets] that do not have a specific route in the routing table:
  `Router(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.1` (Points all internet traffic to the ISP gateway).
- *Floating Static Route (Backup Failover):* A static route configured with an Administrative Distance higher than the primary routing protocol. As long as the primary link is healthy, the floating route remains hidden. If the primary route drops, the floating route is installed instantly:
  `Router(config)# ip route 0.0.0.0 0.0.0.0 198.51.100.2 10` (Floating route with AD 10).

#v(2pt)

== 8.4 Open Shortest Path First (OSPFv2) Link-State Architecture
OSPF (RFC 2328) is a vendor-neutral, classless link-state dynamic routing protocol engineered for scalability and rapid convergence:
- *The Link-State Concept:* Unlike distance-vector protocols that share whole routing tables with immediate neighbors ("routing by rumor"), OSPF routers flood *Link-State Advertisements (LSAs)*. Every router builds an identical map of the entire network topology called the *Link-State Database (LSDB)*.
- *Dijkstra's SPF Algorithm:* Each router runs the Shortest Path First (SPF) calculation independently, placing itself at the root of the tree to calculate the lowest-cost loop-free path to every destination prefix.
- *OSPF Cost Metric Formula:*
  $ "Cost" = "Reference Bandwidth" / "Interface Bandwidth" = (100 "Mbps") / "Interface Bandwidth" = 10^8 / "BW (bps)" $
  - *10 Mbps Ethernet:* $100 / 10 = #hl[10]$
  - *100 Mbps FastEthernet:* $100 / 100 = #hl[1]$
  - *1 Gbps GigabitEthernet:* $100 / 1000 = 0.1 arrow #hl[1]$ (Default reference bandwidth cannot distinguish between 100M and 1G!).
  - *Production Tuning:* You MUST adjust reference bandwidth in gigabit networks: `Router(config-router)# auto-cost reference-bandwidth 10000` (Sets base to 10 Gbps).

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg",
  caption: "Figure 8.1: Core Campus Distribution Routers establishing OSPFv2 full neighbor adjacencies.",
  height: 52pt
)

#v(2pt)

== 8.5 OSPF Router ID (RID) Election Order
Every OSPF router must have a unique 32-bit dotted-decimal Router ID. The Router ID is determined via the following 3-step hierarchy:
1. #hl[Manual CLI Configuration:] `Router(config-router)# router-id 1.1.1.1` (Highest precedence; highly recommended).
2. *Highest IPv4 Address on any Active Loopback Interface:* Loopbacks never experience physical link flaps.
3. *Highest IPv4 Address on any Active Physical Interface:* Evaluated across interfaces in `up/up` operational state.

#pagebreak()

== 8.6 OSPF Adjacency States & DR/BDR Election Mechanics
On broadcast multi-access networks (Ethernet), forming full mesh adjacencies between $N$ routers creates $N(N-1)/2$ connections, causing severe LSA flooding overhead. OSPF solves this by electing a *Designated Router (DR)* and *Backup Designated Router (BDR)*:
- *Adjacency States:* Down $arrow$ Init $arrow$ 2-Way (DR/BDR elected) $arrow$ ExStart $arrow$ Exchange $arrow$ Loading $arrow$ #hl[Full].
- *DR / BDR Roles:*
  - Non-DR routers (*DROther*) form Full adjacencies #hl[ONLY with the DR and BDR]. DROther routers form `2-Way` state with each other.
  - DROthers transmit LSUs to the multicast address #hl[`224.0.0.6` (All DR Routers)].
  - The DR floods updates back to all routers using #hl[`224.0.0.5` (All OSPF Routers)].
- *DR Election Rule:* Highest OSPF Interface Priority (default `1`; priority `0` disqualifies router) $arrow$ Highest Router ID.
- *Non-Preemptive Election:* If a router with a higher RID boots after the DR has already been elected, it does NOT usurp the DR role!

#v(2pt)

== 8.7 Multi-Area OSPF & Backbone Area 0 Architecture
Large enterprise networks divide OSPF into hierarchical areas to restrict SPF recalculations and contain LSA flooding:
- *Area 0 (Backbone Area):* The central core of OSPF. #hl[All other areas (Area 1, Area 2) MUST connect physically or logically to Area 0]!
- *Router Types in Multi-Area OSPF:*
  - *Internal Router:* All interfaces reside within the same single area.
  - *Area Border Router (ABR):* Interfaces connect to multiple areas (at least one in Area 0); summarizes routes between areas.
  - *Autonomous System Boundary Router (ASBR):* Connects OSPF to external routing domains (e.g., BGP, EIGRP, Static routes).

#v(2pt)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*LSA Type*], [*LSA Name*], [*Originating Router*], [*Flooding Scope*]),
  [Type 1], [Router LSA], [Every OSPF Router], [Within local area only; describes router links and costs.],
  [Type 2], [Network LSA], [Designated Router (DR)], [Within local area only; describes multi-access segment routers.],
  [Type 3], [Summary LSA], [Area Border Router (ABR)], [Flooded into other areas; advertises inter-area network prefixes.],
  [Type 4], [ASBR Summary LSA], [Area Border Router (ABR)], [Advertises route to the ASBR into other areas.],
  [Type 5], [Autonomous System External], [AS Boundary Router (ASBR)], [Flooded across entire OSPF domain; advertises external redistributed routes.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "OSPF Passive Interface Command")[
      Prevents OSPF Hello packets from exiting access ports connected to end users:      `Router(config-router)# passive-interface GigabitEthernet0/0/0`      Saves CPU cycles, prevents rogue router adjacencies, but continues advertising the subnet into OSPF!
    ]
  ],
  [
    #concept-box(title: "OSPF Wildcard Mask Math")[
      OSPF network statements require an inverted subnet mask (*Wildcard Mask*):      $ "Wildcard" = 255.255.255.255 - "Subnet Mask" $      - /24 mask (`255.255.255.0`) $arrow$ #hl[`0.0.0.255`]      - /26 mask (`255.255.255.192`) $arrow$ #hl[`0.0.0.63`]
    ]
  ]
)

#v(2pt)

== 8.8 Production Cisco OSPFv2 Configuration Template
```bash
Router(config)# router ospf 1
Router(config-router)# router-id 1.1.1.1
Router(config-router)# auto-cost reference-bandwidth 10000
Router(config-router)# network 192.168.10.0 0.0.0.255 area 0
Router(config-router)# network 10.0.0.0 0.0.0.3 area 0
Router(config-router)# passive-interface GigabitEthernet0/0/0
Router# show ip ospf neighbor
Router# show ip ospf interface brief
```

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What causes two OSPF routers to get stuck in ExStart or Exchange state?", a: "An MTU mismatch on connected interfaces is the most common cause. Both routers negotiate Maximum Transmission Unit during ExStart; if MTUs do not match, Database Description (DBD) packets are dropped.")
#faq-item(q: "Why does the Longest Prefix Match rule override Administrative Distance?", a: "LPM is a fundamental Layer 3 routing rule: a more specific route (e.g. /28) is mathematically a better match for an exact destination host than a broad summary route (e.g. /16), regardless of route source.")
#faq-item(q: "Can a router with OSPF priority 0 ever become a DR or BDR?", a: "No. Setting OSPF interface priority to 0 ('ip ospf priority 0') permanently disqualifies the interface from participating in the DR/BDR election, forcing it to remain a DROther.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "What is the default Administrative Distance of OSPF in Cisco IOS?", ans: "110.")
#short-q(num: 2, q: "Identify the destination IPv4 multicast address used to send OSPF packets to All OSPF Routers.", ans: "224.0.0.5.")
#short-q(num: 3, q: "What is the wildcard mask for a subnet with mask 255.255.255.240 (/28)?", ans: "0.0.0.15 (Formula: 255.255.255.255 - 255.255.255.240 = 0.0.0.15).")
#short-q(num: 4, q: "Which OSPF router type connects a local non-backbone area to Backbone Area 0?", ans: "Area Border Router (ABR).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which routing table entry will a Cisco router select to forward a packet destined for IP 192.168.1.68?", a: "192.168.1.0/24 [1/0] via 10.1.1.1", b: "192.168.1.64/28 [110/20] via 10.2.2.2", c: "192.168.1.64/26 [90/3000] via 10.3.3.3", d: "0.0.0.0/0 [1/0] via 10.4.4.4", ans: "B", expl: "Longest Prefix Match dictates that the longest mask (/28) wins over /26, /24, and /0, regardless of the routing protocol.")
#mcq(num: 2, q: "What is the primary purpose of configuring a Floating Static Route?", a: "To load balance traffic across unequal bandwidth paths", b: "To provide an automatic backup route that activates only when the primary route fails", c: "To inject default routes into BGP", d: "To prevent routing loops in multi-area OSPF", ans: "B", expl: "Floating static routes have a higher Administrative Distance than primary routes, serving as standby failover paths.")
#mcq(num: 3, q: "What metric algorithm does OSPF use to determine the best path to a destination network?", a: "Hop count", b: "Bandwidth and Delay composite", c: "Dijkstra Shortest Path First (SPF) Cost based on link bandwidth", d: "Path Vector AS-Path length", ans: "C", expl: "OSPF runs Dijkstra's algorithm to calculate cumulative path Cost based on reference bandwidth / interface bandwidth.")
#mcq(num: 4, q: "In what order does a Cisco router select its OSPF Router ID if not manually configured via the router-id command?", a: "Highest IP on any physical interface, then highest loopback", b: "Lowest MAC address, then highest IP", c: "Highest IPv4 address on any active Loopback, then highest IPv4 on any active physical interface", d: "First IP address configured in the network statement", ans: "C", expl: "OSPF prioritizes manual RID first, then highest loopback IP, and finally highest active physical interface IP.")
#mcq(num: 5, q: "What state do two OSPF DROther routers maintain with each other on a broadcast multi-access Ethernet network?", a: "Full", b: "2-Way", c: "Loading", d: "Attempt", ans: "B", expl: "DROther routers form Full adjacencies strictly with the DR and BDR; with each other, they stop at 2-Way state.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Dead Interval Multiplier")[
      By default, OSPF Dead Interval is exactly #hl[4 times the Hello interval] (Hello 10s, Dead 40s on broadcast links). If intervals do not match between neighbors, adjacency fails!
    ]
  ],
  [
    #tech-spotlight-box(title: "BGP in the Data Center")[
      Modern hyperscale cloud operators (Google, Amazon) use eBGP (Border Gateway Protocol) rather than OSPF to route across their internal Clos spine-leaf fabrics!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
