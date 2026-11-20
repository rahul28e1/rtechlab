#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 08 · IP ROUTING & DYNAMIC OSPF]
= Chapter 8: IP Routing, Administrative Distance, Static & OSPF Routing

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Complete Layer 3 routing engineering: Longest Prefix Match (LPM) decision mechanics, Administrative Distance hierarchy, production Static & Floating Static routes, Inter-VLAN Routing with Router-on-a-Stick (ROAS), and in-depth Open Shortest Path First (OSPFv2) single and multi-area dynamic routing architectures with hands-on Cisco Packet Tracer laboratories.
]

#v(2pt)

== 8.1 IP Routing Decision Logic & Forwarding Mechanics
A router is a Layer 3 internetworking device that connects disparate broadcast domains. When an IPv4 packet arrives at an inbound interface, the router executes the following deterministic forwarding cycle:
- *1. Frame De-encapsulation:* Checks Frame Check Sequence (FCS) for physical transmission errors. Strips the incoming Layer 2 Ethernet header and trailer to reveal the Layer 3 IPv4 packet.
- *2. Destination IP Inspection:* Reads the 32-bit Destination IP address from the IPv4 header.
- *3. The Longest Prefix Match (LPM) Rule:* Searches the IP Routing Table for candidate routes matching the destination IP. #hl[The route with the longest (most specific) subnet mask is ALWAYS chosen], regardless of routing protocol or Administrative Distance!
  - *Example:* If the routing table contains `10.1.0.0/16` learned via OSPF and `10.1.1.0/24` learned via RIP, traffic destined for `10.1.1.50` matches `10.1.1.0/24` because `/24` is longer than `/16`.
- *4. TTL Decrement & Checksum Recalculation:* Decrements Time-to-Live (TTL) by 1. If TTL reaches 0, the packet is discarded and an ICMP Time Exceeded message (`Type 11, Code 0`) is transmitted back to the sender.
- *5. Layer 2 Re-encapsulation:* Resolves the next-hop IP's MAC address via the local ARP cache, constructs a brand new Ethernet header with its own egress interface MAC as Source and next-hop MAC as Destination, and transmits the frame out the exit interface.

#v(3pt)

== 8.2 Administrative Distance (AD) Master Hierarchy Table
Administrative Distance defines the #hl[trustworthiness of a routing information source]. When a router learns about the exact same destination prefix via multiple routing protocols, the route with the #hl[LOWEST Administrative Distance] is installed into the routing table:

#table(
  columns: (1.2fr, 0.8fr, 1.3fr, 2.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Route Source*], [*Default AD*], [*Algorithm / Metric*], [*Enterprise Characteristics*]),
  [Directly Connected], [0], [Physical Interface Link], [Hardware interface assigned an IP address and operational (`up/up`).],
  [Static Route], [1], [Manual Administrator Entry], [Configured via `ip route`; highest precedence over all dynamic protocols.],
  [eBGP (External BGP)], [20], [Path Vector (AS-Path)], [Inter-Autonomous System routing between enterprise edge and ISPs.],
  [EIGRP (Internal)], [90], [DUAL (Bandwidth + Delay)], [Cisco advanced distance-vector protocol; rapid convergence.],
  [OSPF], [#hl[110]], [Dijkstra SPF (Cost = $10^8 / "BW"$)], [Open standard link-state protocol; industry standard enterprise IGP.],
  [IS-IS], [115], [Dijkstra SPF (Cost metric)], [Service provider core backbone and large-scale data center routing.],
  [RIP (v1 / v2)], [120], [Bellman-Ford (Hop Count, max 15)], [Legacy distance-vector protocol; strictly limited to small networks.],
  [EIGRP (External)], [170], [Redistributed Routes], [Routes imported into EIGRP from external routing protocols.],
  [iBGP (Internal BGP)], [200], [Path Vector], [BGP routing between routers within the same Autonomous System.],
  [Unreachable], [255], [Untrusted], [Router will never install this route into the active routing table.]
)

#v(3pt)

== 8.3 Static Routing, Default Routes & Floating Static Routes
Static routes are manually coded path entries ideal for stub networks, small branch offices, and predictable WAN connections:
- *Standard Static Route Syntax:*
  `Router(config)# ip route [destination-network] [subnet-mask] [next-hop-ip | exit-interface] [distance]`
  - *Next-Hop IP:* `ip route 172.16.1.0 255.255.255.0 10.0.0.2` (Requires recursive route lookup).
  - *Directly Attached (Exit Interface):* `ip route 172.16.1.0 255.255.255.0 GigabitEthernet0/0/1` (Generates ARP requests for every destination host).
  - *Fully Specified (Best Practice):* `ip route 172.16.1.0 255.255.255.0 GigabitEthernet0/0/1 10.0.0.2`
- *Default Route (Gateway of Last Resort):* Matches #hl[all packets] that do not have a specific route in the routing table:
  `Router(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.1` (Directs all internet traffic to the upstream ISP gateway).
- *Floating Static Route (Backup Failover):* A static route configured with an Administrative Distance higher than the primary routing protocol. As long as the primary link is healthy, the floating route remains hidden. If the primary route drops, the floating route is installed instantly:
  `Router(config)# ip route 0.0.0.0 0.0.0.0 198.51.100.2 10` (Floating route with AD 10).

#v(3pt)

== 8.4 Hands-On Practical Lab: Static & Floating Backup Failover
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy high-availability enterprise WAN connectivity between HQ-RTR and Branch-RTR. Primary traffic traverses high-speed Gigabit Fiber (AD 1); an automatic failover to Cellular/LTE WAN (Floating Static Route AD 10) triggers if the primary fiber link drops.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab06-routing-failover-topology.svg", width: 95%)
#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*Subnet Mask*], [*Role / Notes*],
  [HQ-RTR], [Gi0/0/0], [192.168.10.1], [255.255.255.0], [HQ LAN Default Gateway],
  [HQ-RTR], [Gi0/0/1], [10.0.0.1], [255.255.255.252], [Primary Metro-Ethernet Fiber Link (AD 1)],
  [HQ-RTR], [Gi0/0/2], [10.0.1.1], [255.255.255.252], [Secondary 4G/LTE Backup Link (AD 10)],
  [Branch-RTR], [Gi0/0/0], [192.168.20.1], [255.255.255.0], [Branch LAN Default Gateway],
  [Branch-RTR], [Gi0/0/1], [10.0.0.2], [255.255.255.252], [Primary Metro-Ethernet Fiber Link (AD 1)],
  [Branch-RTR], [Gi0/0/2], [10.0.1.2], [255.255.255.252], [Secondary 4G/LTE Backup Link (AD 10)]
)

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[HQ Router Production Configuration:]
```cisco
HQ-RTR(config)# ip route 192.168.20.0 255.255.255.0 10.0.0.2
HQ-RTR(config)# ip route 192.168.20.0 255.255.255.0 10.0.1.2 10
HQ-RTR(config)# ip route 0.0.0.0 0.0.0.0 10.0.0.2
HQ-RTR(config)# ip route 0.0.0.0 0.0.0.0 10.0.1.2 10
```

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Branch Router Production Configuration:]
```cisco
Branch-RTR(config)# ip route 192.168.10.0 255.255.255.0 10.0.0.1
Branch-RTR(config)# ip route 192.168.10.0 255.255.255.0 10.0.1.1 10
Branch-RTR(config)# ip route 0.0.0.0 0.0.0.0 10.0.0.1
Branch-RTR(config)# ip route 0.0.0.0 0.0.0.0 10.0.1.1 10
```

#v(2pt)
#terminal-specimen(title: "HQ-RTR# show ip route static (Primary Fiber Up vs Down)")[
```text
Codes: L - local, C - connected, S - static, * - candidate default
Gateway of last resort is 10.0.0.2 to network 0.0.0.0
S*    0.0.0.0/0 [1/0] via 10.0.0.2, GigabitEthernet0/0/1
S     192.168.20.0/24 [1/0] via 10.0.0.2, GigabitEthernet0/0/1
! --- When Gi0/0/1 goes down, Floating Route activates automatically: ---
HQ-RTR# show ip route static
Gateway of last resort is 10.0.1.2 to network 0.0.0.0
S*    0.0.0.0/0 [10/0] via 10.0.1.2, GigabitEthernet0/0/2
S     192.168.20.0/24 [10/0] via 10.0.1.2, GigabitEthernet0/0/2
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP: IP SLA WITH TRACKING")[
  *Why basic floating routes can fail:* If the fiber interface remains physically `up/up` but intermediate provider hops lose connectivity, basic static routes will NOT fail over! Solution: configure *IP SLA (Service Level Agreement)* with ping probes:
  `HQ-RTR(config)# ip sla 1 ; icmp-echo 10.0.0.2 ; frequency 5 ; exit`
  `HQ-RTR(config)# ip sla schedule 1 life forever start-time now`
  `HQ-RTR(config)# track 1 ip sla 1 reachability ; exit`
  `HQ-RTR(config)# ip route 192.168.20.0 255.255.255.0 10.0.0.2 track 1`
  When ICMP echo fails, Track 1 drops immediately, pulling the primary route and activating the backup!
]

#v(3pt)

== 8.5 Inter-VLAN Routing: Router-on-a-Stick (ROAS) & Layer 3 SVIs
Switches operate at Layer 2 and cannot route traffic between separate VLANs without a Layer 3 routing engine. There are two industry-standard methods:
1. *Router-on-a-Stick (ROAS):* A single physical router interface connects to a switch trunk port. The physical interface is divided into virtual *subinterfaces*, each configured with 802.1Q encapsulation and assigned an IP address serving as the default gateway for that VLAN.
2. *Layer 3 Switch Switched Virtual Interfaces (SVIs):* Multilayer switches (e.g. Cisco Catalyst 3650/3850) perform line-rate hardware routing via ASICs using `interface vlan <id>` and `ip routing`.

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab04-roas-topology.svg", width: 95%)
#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*802.1Q Tag*], [*Role / Notes*],
  [R1-ROAS], [Gi0/0/0], [Unassigned], [N/A], [Physical Trunk Link to SW1 (no shutdown)],
  [R1-ROAS], [Gi0/0/0.10], [192.168.10.1/24], [VLAN 10], [Default Gateway for Engineering LAN],
  [R1-ROAS], [Gi0/0/0.20], [192.168.20.1/24], [VLAN 20], [Default Gateway for Sales LAN],
  [R1-ROAS], [Gi0/0/0.999], [192.168.99.1/24], [VLAN 999 native], [Isolated Native VLAN Gateway],
  [SW1-ACCESS], [Fa0/1 - 10], [Unassigned], [Access VLAN 10], [Engineering User Workstations],
  [SW1-ACCESS], [Fa0/11 - 20], [Unassigned], [Access VLAN 20], [Sales User Workstations],
  [SW1-ACCESS], [Gi0/1], [Unassigned], [802.1Q Trunk], [Uplink Trunk to R1 Gi0/0/0]
)

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Router-on-a-Stick CLI Configuration:]
```cisco
! --- Router Subinterfaces Configuration ---
R1-ROAS(config)# interface GigabitEthernet0/0/0
R1-ROAS(config-if)# no ip address
R1-ROAS(config-if)# no shutdown
R1-ROAS(config-if)# exit
R1-ROAS(config)# interface GigabitEthernet0/0/0.10
R1-ROAS(config-subif)# encapsulation dot1Q 10
R1-ROAS(config-subif)# ip address 192.168.10.1 255.255.255.0
R1-ROAS(config-subif)# exit
R1-ROAS(config)# interface GigabitEthernet0/0/0.20
R1-ROAS(config-subif)# encapsulation dot1Q 20
R1-ROAS(config-subif)# ip address 192.168.20.1 255.255.255.0
R1-ROAS(config-subif)# exit
R1-ROAS(config)# interface GigabitEthernet0/0/0.999
R1-ROAS(config-subif)# encapsulation dot1Q 999 native
R1-ROAS(config-subif)# ip address 192.168.99.1 255.255.255.0
R1-ROAS(config-subif)# end
! --- Catalyst Switch Trunk Uplink Configuration ---
SW1-ACCESS(config)# interface GigabitEthernet0/1
SW1-ACCESS(config-if)# switchport mode trunk
SW1-ACCESS(config-if)# switchport trunk native vlan 999
SW1-ACCESS(config-if)# switchport trunk allowed vlan 10,20,999
SW1-ACCESS(config-if)# end
```

#v(2pt)
#terminal-specimen(title: "R1-ROAS# show ip route connected")[
```text
C    192.168.10.0/24 is directly connected, GigabitEthernet0/0/0.10
L    192.168.10.1/32 is directly connected, GigabitEthernet0/0/0.10
C    192.168.20.0/24 is directly connected, GigabitEthernet0/0/0.20
L    192.168.20.1/32 is directly connected, GigabitEthernet0/0/0.20
C    192.168.99.0/24 is directly connected, GigabitEthernet0/0/0.999
L    192.168.99.1/32 is directly connected, GigabitEthernet0/0/0.999
```
]

#v(3pt)

== 8.6 Open Shortest Path First (OSPFv2) Link-State Architecture
OSPF (RFC 2328) is an open-standard, classless link-state dynamic routing protocol engineered for high scalability and rapid convergence:
- *The Link-State Principle:* Unlike distance-vector protocols that share whole routing tables with immediate neighbors ("routing by rumor"), OSPF routers flood *Link-State Advertisements (LSAs)*. Every router in an area builds an identical map of the network topology called the *Link-State Database (LSDB)*.
- *Dijkstra's SPF Algorithm:* Each router independently runs the Shortest Path First (SPF) algorithm, placing itself at the root of the tree to calculate the lowest-cost loop-free path to every destination prefix.
- *OSPF Cost Metric Formula:*
  $ "Cost" = "Reference Bandwidth" / "Interface Bandwidth" = (100 "Mbps") / "Interface Bandwidth" = 10^8 / "BW (bps)" $
  - *10 Mbps Ethernet:* $100 / 10 = #hl[10]$
  - *100 Mbps FastEthernet:* $100 / 100 = #hl[1]$
  - *1 Gbps GigabitEthernet:* $100 / 1000 = 0.1 arrow #hl[1]$ (Default reference bandwidth cannot distinguish between 100M and 1G!).
  - *Production Tuning:* In all modern gigabit/10G networks, you MUST tune reference bandwidth:
    `Router(config-router)# auto-cost reference-bandwidth 10000` (Sets baseline to 10,000 Mbps = 10 Gbps).

#v(3pt)

== 8.7 OSPF Router ID (RID) Election Hierarchy & The 7 Adjacency States
Every OSPF router requires a unique 32-bit dotted-decimal Router ID. The Router ID is determined via the following 3-step hierarchy:
1. #hl[Manual CLI Configuration:] `Router(config-router)# router-id 1.1.1.1` (Highest precedence; mandatory enterprise best practice).
2. *Highest IPv4 Address on any Active Loopback Interface:* Loopbacks never experience physical link flaps.
3. *Highest IPv4 Address on any Active Physical Interface:* Evaluated across interfaces in `up/up` operational state.

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[The 7 OSPF Adjacency States:]
- *1. Down:* No OSPF Hello packets received from the neighbor.
- *2. Init:* Hello packet received from neighbor, but local Router ID is not yet listed in the neighbor's Hello packet.
- *3. 2-Way:* Bi-directional communication established (local RID seen in neighbor's Hello). On multi-access broadcast networks, DR and BDR elections take place at this state.
- *4. ExStart:* Master/Slave relationship and initial Database Description (DBD) sequence numbers negotiated. The router with higher RID becomes Master.
- *5. Exchange:* Routers exchange DBD packets describing their LSDB summaries. #hl[An MTU mismatch causes routers to hang permanently in ExStart or Exchange state!]
- *6. Loading:* Routers send Link-State Requests (LSR) for missing routes; neighbors reply with Link-State Updates (LSU).
- *7. Full:* Link-State Databases are completely synchronized. Full adjacency reached!

#v(3pt)

== 8.8 DR / BDR Election Mechanics on Broadcast Multi-Access Networks
On broadcast multi-access Ethernet networks, forming full mesh adjacencies between $N$ routers creates $N(N-1)/2$ connections, causing severe LSA flooding overhead. OSPF solves this by electing a *Designated Router (DR)* and *Backup Designated Router (BDR)*:
- *DR / BDR Communication:*
  - Non-DR routers (*DROthers*) form Full adjacencies #hl[ONLY with the DR and BDR]. DROther routers maintain `2-Way` state with each other.
  - DROthers transmit LSUs to the multicast address #hl[`224.0.0.6` (All DR Routers)].
  - The DR floods updates back to all routers using #hl[`224.0.0.5` (All OSPF Routers)].
- *DR Election Rule:* Highest OSPF Interface Priority (default `1`; priority `0` permanently disqualifies router) $arrow$ Highest Router ID.
- *Non-Preemptive Election:* If a router with a higher RID boots after the DR has already been elected, it does NOT usurp the DR role!

#v(3pt)

== 8.9 Multi-Area OSPF Architecture & LSA Types 1–5
Large enterprise networks divide OSPF into hierarchical areas to restrict SPF recalculations and contain LSA flooding:
- *Area 0 (Backbone Area):* The central core of OSPF. #hl[All other areas (Area 1, Area 2) MUST connect physically or logically to Area 0]!
- *Router Types in Multi-Area OSPF:*
  - *Internal Router:* All interfaces reside within the same single area.
  - *Area Border Router (ABR):* Interfaces connect to multiple areas (at least one in Area 0); summarizes routes between areas.
  - *Autonomous System Boundary Router (ASBR):* Connects OSPF to external routing domains (e.g., BGP, EIGRP, Static routes).

#v(2pt)

#table(
  columns: (1fr, 1.3fr, 1.5fr, 2.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*LSA Type*], [*LSA Name*], [*Originating Router*], [*Flooding Scope*]),
  [Type 1], [Router LSA], [Every OSPF Router], [Within local area only; describes router links, interfaces, and costs.],
  [Type 2], [Network LSA], [Designated Router (DR)], [Within local area only; describes multi-access segment subnet and attached routers.],
  [Type 3], [Summary LSA], [Area Border Router (ABR)], [Flooded into other areas; advertises inter-area network prefixes.],
  [Type 4], [ASBR Summary LSA], [Area Border Router (ABR)], [Advertises route to the ASBR into adjacent areas.],
  [Type 5], [Autonomous System External], [AS Boundary Router (ASBR)], [Flooded across entire OSPF domain; advertises external redistributed routes.]
)

#v(3pt)

== 8.10 Hands-On Practical Lab: Single & Multi-Area OSPFv2 Routing
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy enterprise OSPFv2 dynamic routing across 3 Cisco routers (R1-HQ, R2-CORE, R3-BRANCH). Configure static Router IDs, tune auto-cost reference-bandwidth to 10 Gbps, deploy passive-interfaces on user access subnets, and verify full neighbor adjacencies.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab07-ospf-topology.svg", width: 95%)
#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*Subnet Mask*], [*OSPF Area / Role*],
  [R1-HQ], [Gi0/0/0], [192.168.10.1], [255.255.255.0], [Area 0 (Passive User LAN)],
  [R1-HQ], [Gi0/0/1], [10.0.0.1], [255.255.255.252], [Area 0 (WAN Link to R2-CORE)],
  [R2-CORE], [Gi0/0/1], [10.0.0.2], [255.255.255.252], [Area 0 (WAN Link to R1-HQ)],
  [R2-CORE], [Gi0/0/2], [10.0.1.1], [255.255.255.252], [Area 0 (WAN Link to R3-BRANCH)],
  [R3-BRANCH], [Gi0/0/2], [10.0.1.2], [255.255.255.252], [Area 0 (WAN Link to R2-CORE)],
  [R3-BRANCH], [Gi0/0/0], [192.168.30.1], [255.255.255.0], [Area 0 (Passive User LAN)]
)

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[R1-HQ Router Production Configuration:]
```cisco
R1-HQ(config)# router ospf 1
R1-HQ(config-router)# router-id 1.1.1.1
R1-HQ(config-router)# auto-cost reference-bandwidth 10000
R1-HQ(config-router)# network 10.0.0.0 0.0.0.3 area 0
R1-HQ(config-router)# network 192.168.10.0 0.0.0.255 area 0
R1-HQ(config-router)# passive-interface GigabitEthernet0/0/0
R1-HQ(config-router)# exit
```

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[R2-CORE Router Production Configuration:]
```cisco
R2-CORE(config)# router ospf 1
R2-CORE(config-router)# router-id 2.2.2.2
R2-CORE(config-router)# auto-cost reference-bandwidth 10000
R2-CORE(config-router)# network 10.0.0.0 0.0.0.3 area 0
R2-CORE(config-router)# network 10.0.1.0 0.0.0.3 area 0
R2-CORE(config-router)# exit
```

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[R3-BRANCH Router Production Configuration:]
```cisco
R3-BRANCH(config)# router ospf 1
R3-BRANCH(config-router)# router-id 3.3.3.3
R3-BRANCH(config-router)# auto-cost reference-bandwidth 10000
R3-BRANCH(config-router)# network 10.0.1.0 0.0.0.3 area 0
R3-BRANCH(config-router)# network 192.168.30.0 0.0.0.255 area 0
R3-BRANCH(config-router)# passive-interface GigabitEthernet0/0/0
R3-BRANCH(config-router)# exit
```

#v(2pt)
#terminal-specimen(title: "R1-HQ# show ip ospf neighbor & show ip route ospf")[
```text
R1-HQ# show ip ospf neighbor
Neighbor ID     Pri   State           Dead Time   Address         Interface
2.2.2.2           1   FULL/DR         00:00:36    10.0.0.2        GigabitEthernet0/0/1
R1-HQ# show ip route ospf
      10.0.0.0/8 is variably subnetted, 4 subnets, 2 masks
O        10.0.1.0/30 [110/20] via 10.0.0.2, 00:04:12, GigabitEthernet0/0/1
O     192.168.30.0/24 [110/30] via 10.0.0.2, 00:04:12, GigabitEthernet0/0/1
R1-HQ# ping 192.168.30.1
Sending 5, 100-byte ICMP Echos to 192.168.30.1, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 1/2/4 ms
```
]

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "OSPF Passive Interface Command")[
      Prevents OSPF Hello packets from exiting access ports connected to end users:
      `Router(config-router)# passive-interface Gi0/0/0`
      Saves CPU cycles, prevents rogue router adjacencies, but continues advertising the subnet into OSPF!
    ]
  ],
  [
    #concept-box(title: "OSPF Wildcard Mask Math")[
      OSPF network statements require an inverted subnet mask (*Wildcard Mask*):
      $ "Wildcard" = 255.255.255.255 - "Subnet Mask" $
      - /24 mask (`255.255.255.0`) $arrow$ #hl[`0.0.0.255`]
      - /30 mask (`255.255.255.252`) $arrow$ #hl[`0.0.0.3`]
    ]
  ]
)

#v(3pt)

== 8.11 OSPF Neighbor Adjacency Troubleshooting Checklist
If two OSPF routers fail to reach the `FULL` adjacency state, verify these 5 critical parameters:
1. *Subnet Mask Mismatch:* Connected interfaces MUST share the identical primary IPv4 subnet and mask.
2. *Hello & Dead Timers Mismatch:* Default is Hello 10s / Dead 40s on broadcast links. If timers diverge, neighbor drops.
3. *Area ID & Area Type Mismatch:* Interfaces must belong to the exact same Area number (e.g. Area 0) and type (normal vs stub).
4. *MTU Size Mismatch:* If Interface MTUs do not match, the routers become stuck in `ExStart` or `Exchange` state.
5. *Duplicate Router IDs:* If two routers share the identical Router ID, LSA flooding collapses and adjacency flaps.

#v(3pt)

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What causes two OSPF routers to get stuck in ExStart or Exchange state?", a: "An MTU mismatch on connected interfaces is the most common cause. Both routers negotiate Maximum Transmission Unit during ExStart; if MTUs do not match, Database Description (DBD) packets are dropped.")
#faq-item(q: "Why does the Longest Prefix Match rule override Administrative Distance?", a: "LPM is a fundamental Layer 3 routing rule: a more specific route (e.g. /28) is mathematically a better match for an exact destination host than a broad summary route (e.g. /16), regardless of route source.")
#faq-item(q: "Can a router with OSPF priority 0 ever become a DR or BDR?", a: "No. Setting OSPF interface priority to 0 ('ip ospf priority 0') permanently disqualifies the interface from participating in the DR/BDR election, forcing it to remain a DROther.")
#faq-item(q: "Why is Router-on-a-Stick physical interface left unnumbered?", a: "The physical interface on a ROAS router only acts as a Layer 2 pipe carrying 802.1Q tagged frames. IP addresses must be assigned directly to the logical subinterfaces where VLAN encapsulation is configured.")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "What is the default Administrative Distance of OSPF in Cisco IOS?", ans: "110.")
#short-q(num: 2, q: "Identify the destination IPv4 multicast address used to send OSPF packets to All OSPF Routers.", ans: "224.0.0.5.")
#short-q(num: 3, q: "What is the wildcard mask for a point-to-point /30 subnet (255.255.255.252)?", ans: "0.0.0.3 (Formula: 255.255.255.255 - 255.255.255.252 = 0.0.0.3).")
#short-q(num: 4, q: "Which OSPF router type connects a local non-backbone area to Backbone Area 0?", ans: "Area Border Router (ABR).")
#short-q(num: 5, q: "What command enables hardware IP routing on a Cisco Catalyst Layer 3 switch?", ans: "ip routing (configured in global configuration mode).")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which routing table entry will a Cisco router select to forward a packet destined for IP 192.168.1.68?", a: "192.168.1.0/24 [1/0] via 10.1.1.1", b: "192.168.1.64/28 [110/20] via 10.2.2.2", c: "192.168.1.64/26 [90/3000] via 10.3.3.3", d: "0.0.0.0/0 [1/0] via 10.4.4.4", ans: "B", expl: "Longest Prefix Match dictates that the longest mask (/28) wins over /26, /24, and /0, regardless of the routing protocol.")
#mcq(num: 2, q: "What is the primary purpose of configuring a Floating Static Route?", a: "To load balance traffic across unequal bandwidth paths", b: "To provide an automatic backup route that activates only when the primary route fails", c: "To inject default routes into BGP", d: "To prevent routing loops in multi-area OSPF", ans: "B", expl: "Floating static routes have a higher Administrative Distance than primary routes, serving as standby failover paths.")
#mcq(num: 3, q: "What metric algorithm does OSPF use to determine the best path to a destination network?", a: "Hop count", b: "Bandwidth and Delay composite", c: "Dijkstra Shortest Path First (SPF) Cost based on link bandwidth", d: "Path Vector AS-Path length", ans: "C", expl: "OSPF runs Dijkstra's algorithm to calculate cumulative path Cost based on reference bandwidth / interface bandwidth.")
#mcq(num: 4, q: "In what order does a Cisco router select its OSPF Router ID if not manually configured via the router-id command?", a: "Highest IP on any physical interface, then highest loopback", b: "Lowest MAC address, then highest IP", c: "Highest IPv4 address on any active Loopback, then highest IPv4 on any active physical interface", d: "First IP address configured in the network statement", ans: "C", expl: "OSPF prioritizes manual RID first, then highest loopback IP, and finally highest active physical interface IP.")
#mcq(num: 5, q: "What state do two OSPF DROther routers maintain with each other on a broadcast multi-access Ethernet network?", a: "Full", b: "2-Way", c: "Loading", d: "Attempt", ans: "B", expl: "DROther routers form Full adjacencies strictly with the DR and BDR; with each other, they stop at 2-Way state.")

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Dead Interval Multiplier")[
      By default, OSPF Dead Interval is exactly #hl[4 times the Hello interval] (Hello 10s, Dead 40s on broadcast links). If intervals do not match between neighbors, adjacency fails!
    ]
  ],
  [
    #tech-spotlight-box(title: "BGP in the Modern Data Center")[
      Modern hyperscale cloud operators (Google, Amazon) use eBGP rather than OSPF to route across their internal Clos spine-leaf fabrics for deterministic scale!
    ]
  ]
)
