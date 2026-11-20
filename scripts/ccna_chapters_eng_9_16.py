# -*- coding: utf-8 -*-
"""
RTechLab CCNA 200-301 Master Curriculum — English Chapters 09 to 16
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
"""

chapters_eng_9_16 = {}

# =============================================================================
# CHAPTER 09: Spanning Tree Protocol (STP/RSTP), PortFast & EtherChannel LACP Lab
# =============================================================================
chapters_eng_9_16[9] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 09 · SPANNING TREE PROTOCOL & ETHERCHANNEL]
= Chapter 9: Spanning Tree Protocol (STP/RSTP), PortFast & EtherChannel LACP Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Layer 2 bridging loops, broadcast storms, IEEE 802.1D STP vs 802.1w Rapid STP, Bridge ID math, PortFast, BPDU Guard, and Link Aggregation using IEEE 802.3ad LACP.
]

#v(2pt)

== 9.1 Layer 2 Redundancy Problems & The Need for STP
Redundant links between Layer 2 switches are essential to prevent single points of failure. However, without a control-plane protocol, redundant topologies create three fatal loop catastrophic conditions:
- *1. Broadcast Storms:* Ethernet frames have no TTL (Time-to-Live) field. A broadcast frame (e.g., ARP) loops endlessly through redundant links, consuming 100% of CPU and bandwidth within seconds.
- *2. Multiple Frame Copies:* A destination host receives multiple identical copies of unicast frames.
- *3. MAC Database Instability (Flapping):* Switches constantly overwrite port entries in their CAM tables as looped frames arrive on alternating interfaces.

#v(2pt)

== 9.2 Spanning Tree Protocol (STP IEEE 802.1D) Mechanics
STP eliminates loops by calculating a loop-free tree topology and placing redundant ports into a #hl[Blocking state]. Switches exchange Bridge Protocol Data Units (BPDUs) every 2 seconds:
- *Bridge ID (BID):* An 8-byte value composed of:
  - *Bridge Priority (4 bits):* Multiples of 4096 (default is `32768`).
  - *System ID Extension (12 bits):* The VLAN ID.
  - *MAC Address (48 bits):* The switch base MAC address.
- *Root Bridge Election:* The switch with the #hl[lowest Bridge ID] becomes the Root Bridge. If priorities match, the switch with the lowest MAC address wins.
- *Port Roles:*
  - *Root Port (RP):* Exactly one port on each non-root switch with the lowest path cost to the Root Bridge.
  - *Designated Port (DP):* One port per network segment with the best path to Root. All ports on Root Bridge are DPs (Forwarding).
  - *Non-Designated / Blocked Port (NDP):* Redundant ports placed into blocking mode to prevent loops.

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab05-stp-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 9.1: Lab 05 — Spanning Tree Root Bridge Election.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab11-etherchannel-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 9.2: Lab 11 — LACP 802.3ad Port-Channel Bundling.]
  ]
)

#pagebreak()

== 9.3 802.1D STP vs 802.1w Rapid STP (RSTP)
#table(
  columns: (1.5fr, 1.8fr, 1.8fr, 1.5fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Operational Metric*], [*Legacy STP (802.1D)*], [*Rapid STP (802.1w)*], [*Performance Gain*]),
  [Convergence Speed], [30 to 50 seconds (timer-based)], [Under 1 second (handshake-based)], [Sub-second failover],
  [Port States], [Blocking, Listening, Learning, Forwarding], [Discarding, Learning, Forwarding], [Fewer intermediate states],
  [Alternate Port Role], [None (treated as Blocking)], [Pre-computed backup to Root Port], [Instant failover upon RP link loss],
  [Backup Port Role], [None], [Backup to Designated Port], [Immediate shared media failover]
)

#v(2pt)

== 9.4 Edge Port Protection: PortFast & BPDU Guard
Connecting end-user PCs or servers to access ports triggers unnecessary STP recalculations. Engineers configure:
- *PortFast:* Bypasses Listening and Learning states, placing edge ports into #hl[Forwarding immediately]. Prevents DHCP timeout errors on client boot.
- *BPDU Guard:* Protects against unauthorized rogue switches. If a BPDU is received on a PortFast-enabled port, BPDU Guard immediately #hl[shuts down the port into err-disabled state].
#terminal-box([
```cisco
Switch(config)# interface range FastEthernet0/1 - 24
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# spanning-tree portfast
Switch(config-if-range)# spanning-tree bpduguard enable
```
])

#v(2pt)

== 9.5 EtherChannel / Link Aggregation (IEEE 802.3ad LACP)
EtherChannel bundles up to 8 physical Ethernet links into a single logical link (Port-Channel). STP views the bundle as a single port, preventing blocking and multiplying bandwidth:
#terminal-box([
```cisco
! Switch A (LACP Active):
SwitchA(config)# interface range GigabitEthernet0/1 - 2
SwitchA(config-if-range)# channel-group 1 mode active
! Switch B (LACP Passive or Active):
SwitchB(config)# interface range GigabitEthernet0/1 - 2
SwitchB(config-if-range)# channel-group 1 mode passive
! Configure the resulting logical Port-Channel:
SwitchA(config)# interface port-channel 1
SwitchA(config-if)# switchport mode trunk
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("Why is PortFast dangerous on links connected to other switches?", "If a switch is connected to a PortFast port without BPDU Guard, loops will not be detected during the normal 30-second listening/learning phase, causing an instantaneous broadcast storm that can crash the campus network.")
#faq-box("What is the difference between LACP mode 'active' and 'passive'?", "In LACP (IEEE 802.3ad), 'active' actively initiates negotiation by sending LACP packets. 'passive' only responds if contacted. If both sides are configured as 'passive', the EtherChannel bundle will never form.")
#faq-box("How does EtherChannel load balance traffic across bundled links?", "EtherChannel uses a mathematical hash algorithm based on source MAC, destination MAC, source IP, or destination IP/port. A single TCP/UDP conversation always flows across the same physical member link to prevent out-of-order packets.")

#v(2pt)

== Short-Answer Technical Review
1. *State the formula for calculating Bridge ID in PVST+:* $ "Bridge ID" = "Bridge Priority" + "VLAN ID" + "MAC Address" $.
2. *Identify the port state that Rapid STP eliminates completely:* Listening and Blocking states are merged into the *Discarding* state.
3. *What action does BPDU Guard execute when an unauthorized switch is connected to an edge port?* It immediately error-disables the interface (`err-disabled`).
4. *Name the open standard protocol for link aggregation:* IEEE 802.3ad Link Aggregation Control Protocol (LACP).

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "Which Cisco IOS command ensures that a specific switch becomes the primary Root Bridge for VLAN 10 regardless of other switches?",
  ("spanning-tree vlan 10 priority 0", "spanning-tree vlan 10 root primary", "spanning-tree vlan 10 cost 1", "spanning-tree root force"),
  1,
  "'spanning-tree vlan 10 root primary' automatically lowers the switch priority to 24,576 or 4,096 below the current root to win election."
)

#mcq-item(
  "An engineer bundles two 1-Gbps links into an EtherChannel. How does Spanning Tree treat the bundle?",
  ("As two separate ports, blocking one", "As a single logical 2-Gbps link", "As an inactive backup link", "As a Layer 3 routed interface"),
  1,
  "STP treats the entire Port-Channel bundle as a single logical interface, preventing blocking while doubling available bandwidth."
)

#mcq-item(
  "How long does it take for legacy 802.1D STP to transition a port from Blocking to Forwarding?",
  ("Under 1 second", "15 seconds", "30 to 50 seconds", "60 seconds"),
  2,
  "Legacy STP takes 20 seconds (Max Age) + 15 seconds (Listening) + 15 seconds (Learning) = 30 to 50 seconds total convergence time."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Radia Perlman, The Mother of the Internet", "Dr. Radia Perlman invented the Spanning Tree Algorithm in 1985 at Digital Equipment Corporation. She wrote a famous poem, 'Algorhyme', explaining that 'a tree is created by an algorithm... where frames may freely run.'")

#spotlight-box("2027 Tech Spotlight: Cisco Multi-chassis EtherChannel (vPC & StackWise-Virtual)", "Traditional EtherChannel is limited to a single physical switch chassis. Cisco Virtual PortChannel (vPC) and StackWise-Virtual allow links to terminate on two distinct physical core switches simultaneously, achieving active-active multi-chassis link aggregation.")
'''

# =============================================================================
# CHAPTER 10: Inter-VLAN Routing: Router-on-a-Stick (ROAS) & Layer 3 SVI Lab
# =============================================================================
chapters_eng_9_16[10] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 10 · INTER-VLAN ROUTING & SVI SWITCHING]
= Chapter 10: Inter-VLAN Routing: Router-on-a-Stick (ROAS) & Layer 3 SVI Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Inter-VLAN routing principles, Router-on-a-Stick (ROAS) subinterface architecture, 802.1Q encapsulation mapping, Multilayer Switch Virtual Interfaces (SVIs), routed ports (`no switchport`), and complete Packet Tracer lab implementation.
]

#v(2pt)

== 10.1 Why VLANs Require Layer 3 Routing
VLANs segment switches into isolated Layer 2 broadcast domains. By design, #hl[a switch cannot forward traffic between different VLANs at Layer 2]. For a host in VLAN 10 (Engineering) to communicate with a host in VLAN 20 (Finance), a Layer 3 routing device must forward the packet across subnet boundaries:
- The source host compares destination IP with its own subnet mask.
- Recognizing the destination is on a foreign subnet, the host forwards the frame to its #hl[Default Gateway MAC address].
- The router decapsulates the Layer 2 frame, examines the Layer 3 destination IP, performs a routing table lookup, re-encapsulates the packet into a new Layer 2 frame for the destination VLAN, and forwards it.

#v(2pt)

== 10.2 Router-on-a-Stick (ROAS) Architecture
In smaller networks lacking expensive Layer 3 switches, Inter-VLAN routing is accomplished via a single physical router link called #hl[Router-on-a-Stick (ROAS)]:
- A single physical Ethernet interface on the router (e.g., `GigabitEthernet0/0/0`) connects to an 802.1Q trunk port on the switch.
- The physical interface is divided into logical software subinterfaces (e.g., `G0/0/0.10`, `G0/0/0.20`).
- Each subinterface is mapped to an 802.1Q VLAN tag using `encapsulation dot1q <vlan_id>` and assigned an IP address that serves as the default gateway for that VLAN.

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab04-roas-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 10.1: Packet Tracer Lab 04 — Router-on-a-Stick (ROAS) Subinterface Topology.]
]

#pagebreak()

== 10.3 Complete ROAS Production CLI Configuration
#terminal-box([
```cisco
! Router Configuration:
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# no ip address
Router(config-if)# no shutdown
Router(config-if)# exit

! Subinterface for VLAN 10 (Engineering):
Router(config)# interface GigabitEthernet0/0/0.10
Router(config-subif)# encapsulation dot1q 10
Router(config-subif)# ip address 192.168.10.1 255.255.255.0

! Subinterface for VLAN 20 (Finance):
Router(config)# interface GigabitEthernet0/0/0.20
Router(config-subif)# encapsulation dot1q 20
Router(config-subif)# ip address 192.168.20.1 255.255.255.0

! Subinterface for Native VLAN 999:
Router(config)# interface GigabitEthernet0/0/0.999
Router(config-subif)# encapsulation dot1q 999 native
Router(config-subif)# ip address 192.168.99.1 255.255.255.0
```
])

#v(2pt)

== 10.4 Layer 3 Multilayer Switch Inter-VLAN Routing (SVIs)
In enterprise campus cores, ROAS creates a bottleneck because all inter-VLAN traffic must travel up and down a single physical cable. #hl[Multilayer Switches (MLS)] route packets internally in silicon hardware via Switch Virtual Interfaces (SVIs) at wire speed:
#table(
  columns: (1.5fr, 2.2fr, 2.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Feature / Metric*], [*Router-on-a-Stick (ROAS)*], [*Layer 3 Switch SVI Routing*]),
  [Throughput & Speed], [Bottlenecked by single router link (1 Gbps)], [Hardware ASIC routing at line rate (10G/40G/100G)],
  [Latency], [High (two traversals of physical link)], [Extremely low (routed internally on backplane)],
  [Hardware Cost], [Low (uses existing router and L2 switch)], [Higher (requires Multilayer Layer 3 switch)]
)

#v(2pt)

#terminal-box([
```cisco
! Enable Layer 3 Routing Engine globally:
MultilayerSwitch(config)# ip routing

! Create Switch Virtual Interfaces (SVIs):
MultilayerSwitch(config)# interface vlan 10
MultilayerSwitch(config-if)# ip address 192.168.10.1 255.255.255.0
MultilayerSwitch(config-if)# no shutdown
MultilayerSwitch(config)# interface vlan 20
MultilayerSwitch(config-if)# ip address 192.168.20.1 255.255.255.0
MultilayerSwitch(config-if)# no shutdown

! Convert physical port into routed port (Layer 3 port):
MultilayerSwitch(config)# interface GigabitEthernet0/24
MultilayerSwitch(config-if)# no switchport
MultilayerSwitch(config-if)# ip address 10.0.0.1 255.255.255.252
MultilayerSwitch(config-if)# no shutdown
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("Why must 'encapsulation dot1q <vlan>' be entered before 'ip address' on subinterfaces?", "Cisco IOS requires the subinterface to know which VLAN framing tag it is handling before binding an IP address. Attempting to enter 'ip address' first will produce an immediate IOS error.")
#faq-box("What happens if you forget 'ip routing' on a Multilayer Switch?", "The switch will continue switching Layer 2 frames within individual VLANs, but will refuse to route packets between different VLAN SVIs. Host pings to default gateways will succeed, but inter-VLAN pings will fail.")
#faq-box("Can an SVI be UP/DOWN?", "An SVI remains in 'UP/DOWN' state until at least one physical access or trunk port assigned to that VLAN is in an active 'UP/UP' forwarding state. This prevents blackholing traffic.")

#v(2pt)

== Short-Answer Technical Review
1. *State the command required to enable Layer 3 packet forwarding on a Cisco Catalyst switch:* `ip routing`.
2. *Explain the command 'no switchport' on a Multilayer switch interface:* Converts a Layer 2 switchport into a pure Layer 3 routed interface with its own dedicated IP address.
3. *Identify the command that binds a subinterface to VLAN 30 with 802.1Q tagging:* `encapsulation dot1q 30`.
4. *Why does Router-on-a-Stick introduce link contention in heavy traffic networks?* Traffic between VLANs must traverse the same physical uplink twice (ingress and egress), halving available bandwidth.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer configures a subinterface on a router for VLAN 20 but forgets to enter 'no shutdown' on the parent physical interface. What is the status of the subinterface?",
  ("Up/Up", "Up/Down", "Administratively Down", "Testing"),
  2,
  "Subinterfaces inherit the physical state of the parent interface; if the parent is administratively down, all subinterfaces remain down."
)

#mcq-item(
  "Which command transforms an interface on a Cisco Catalyst 3850 into a dedicated Layer 3 interface capable of accepting an IP address directly?",
  ("switchport mode routed", "no switchport", "ip routing enable", "encapsulation dot1q"),
  1,
  "'no switchport' disables Layer 2 switching on that port and converts it into a Layer 3 routed port."
)

#mcq-item(
  "What is the default operational state of an SVI if no physical switchports are currently active in that VLAN?",
  ("Up/Up", "Down/Down", "Up/Down", "Err-disabled"),
  1,
  "An SVI stays down/down until at least one physical port in that VLAN is UP and in the STP forwarding state."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? CEF (Cisco Express Forwarding)", "Layer 3 switches do not use the CPU to route packets. Cisco Express Forwarding (CEF) pre-compiles the Routing Table into a Forwarding Information Base (FIB) and pre-computes ARP into an Adjacency Table, allowing ASICs to route at full wire speed.")

#spotlight-box("2027 Tech Spotlight: Anycast Gateway in EVPN-VXLAN", "Modern datacenter fabrics eliminate the centralized default gateway bottleneck. Anycast Gateway assigns the exact same virtual IP and virtual MAC address to every leaf switch, so virtual machines experience zero latency when routing across subnets.")
'''

# =============================================================================
# CHAPTER 11: IPv4 Routing Tables, Static Routes & Floating Failover with IP SLA Lab
# =============================================================================
chapters_eng_9_16[11] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 11 · IP ROUTING, STATIC ROUTES & IP SLA]
= Chapter 11: IPv4 Routing Tables, Static Routes & Floating Failover with IP SLA Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Routing table architecture, route lookup logic, Longest Prefix Match (LPM), Administrative Distance hierarchy, next-hop vs exit-interface, default routing, and production Floating Static Route failover with IP SLA ICMP tracking.
]

#v(2pt)

== 11.1 The Routing Table & Route Lookup Logic
A router is a Layer 3 device that makes forwarding decisions based on destination IP addresses:
- *Longest Prefix Match (LPM) Rule:* If multiple routes exist to a destination, the router strictly forwards the packet using the route with the #hl[longest (most specific) subnet mask], regardless of Administrative Distance or metric!
  - Example: Given destination `10.1.5.50`, between `10.0.0.0/8` and `10.1.5.0/24`, the router #hl[always selects 10.1.5.0/24].
- *Routing Table Codes:* `L` = Local (router's own /32 interface IP), `C` = Connected, `S` = Static, `O` = OSPF, `D` = EIGRP, `B` = BGP, `*` = Candidate Default Route.

#v(2pt)

== 11.2 Administrative Distance (AD) Complete Hierarchy
Administrative Distance defines the #hl[trustworthiness of the routing information source] (lower is more trustworthy):
#table(
  columns: (1.5fr, 1.2fr, 3.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Routing Protocol / Source*], [*Default AD*], [*Architectural Trust & Usage*]),
  [Directly Connected Interface], [0], [Physical link up with IP address assigned. Absolute trust.],
  [Static Route], [1], [Manually configured path by network administrator.],
  [External BGP (eBGP)], [20], [Inter-Autonomous System routing across Internet carriers.],
  [EIGRP (Internal)], [90], [Cisco advanced distance-vector enterprise protocol.],
  [OSPF], [110], [Industry standard open link-state routing protocol.],
  [IS-IS], [115], [Link-state protocol favored by major Internet Service Providers.],
  [RIP], [120], [Legacy distance-vector protocol (metric is hop count).],
  [EIGRP (External)], [170], [Routes redistributed into EIGRP from external sources.],
  [Internal BGP (iBGP)], [200], [Intra-AS BGP routing across enterprise backbone routers.],
  [Unusable / Unknown], [255], [Untrusted route; router will never install into routing table.]
)

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab06-routing-failover-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 11.1: Packet Tracer Lab 06 — Dual-ISP Floating Failover with IP SLA Tracking.]
]

#pagebreak()

== 11.3 Static Route Types & Syntax
Static routes provide deterministic traffic engineering without protocol overhead:
- *Next-Hop Static Route:* `ip route 10.1.0.0 255.255.0.0 192.168.1.2` (Requires recursive routing table lookup to find exit interface).
- *Directly Connected Static Route:* `ip route 10.1.0.0 255.255.0.0 GigabitEthernet0/0/1` (Requires proxy ARP on broadcast networks).
- *Fully Specified Static Route:* `ip route 10.1.0.0 255.255.0.0 GigabitEthernet0/0/1 192.168.1.2` (Best practice on multi-access links).
- *Default Route (Gateway of Last Resort):* Matches all packets when no specific route exists:
  `ip route 0.0.0.0 0.0.0.0 <next-hop>`

#v(2pt)

== 11.4 Production Floating Static Route with IP SLA ICMP Tracking
A standard Floating Static Route has a manually elevated Administrative Distance (e.g., AD 10). However, if an upstream ISP router fails beyond the local physical port, the local interface remains UP, and traffic is blackholed!
- *Solution: Cisco IP SLA (Service Level Agreement) Tracking:*
  The router actively pings an Internet target (e.g., `8.8.8.8`) every 5 seconds. If the ping fails, the tracking object drops, and the router #hl[instantly uninstalls the primary route and activates the floating backup route]:
#terminal-box([
```cisco
! Step 1: Configure IP SLA probe to ping Google DNS:
Edge-RTR(config)# ip sla 1
Edge-RTR(config-ip-sla)# icmp-echo 8.8.8.8 source-interface GigabitEthernet0/0/0
Edge-RTR(config-ip-sla)# frequency 5
Edge-RTR(config-ip-sla)# exit
Edge-RTR(config)# ip sla schedule 1 life forever start-time now

! Step 2: Bind IP SLA probe to Track Object 1:
Edge-RTR(config)# track 1 ip sla 1 reachability
Edge-RTR(config-track)# exit

! Step 3: Primary Default Route tied to Track 1:
Edge-RTR(config)# ip route 0.0.0.0 0.0.0.0 198.51.100.1 track 1

! Step 4: Floating Backup Default Route with Administrative Distance 10:
Edge-RTR(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.2 10
```
])

#v(2pt)

== 11.5 Route Verification & Troubleshooting Commands
#terminal-box([
```cisco
Edge-RTR# show ip route
Gateway of last resort is 198.51.100.1 to network 0.0.0.0
S*    0.0.0.0/0 [1/0] via 198.51.100.1
Edge-RTR# show track 1
Track 1
  IP SLA 1 reachability
  Reachability is Up
  1 change, last change 00:04:12
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("What is the difference between Administrative Distance and Metric?", "Administrative Distance selects the best routing protocol when multiple protocols offer routes to the exact same network. Metric selects the best path among multiple routes discovered by the SAME routing protocol.")
#faq-box("Why is a floating static route not visible in 'show ip route' during normal operation?", "A floating static route has a higher Administrative Distance (e.g., 10) than the primary route (AD 1). Cisco IOS only installs the most trustworthy route into the routing table. It only appears when the primary route fails.")
#faq-box("What is a recursive lookup?", "When a static route specifies only a next-hop IP address, the router must perform a second lookup in the routing table to find which physical exit interface reaches that next-hop IP.")

#v(2pt)

== Short-Answer Technical Review
1. *State the rule routers use when deciding between routes with different prefix lengths:* Longest Prefix Match (LPM) rule — the route with the most specific (longest) subnet mask is always chosen.
2. *Identify the default Administrative Distance of OSPF:* 110.
3. *What is the purpose of an IP SLA tracking object in routing failover?* It actively monitors end-to-end reachability beyond the local link, removing a failed primary static route even when the physical interface stays up.
4. *Write the Cisco IOS command for a default static route via next-hop 192.168.1.1:* `ip route 0.0.0.0 0.0.0.0 192.168.1.1`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "A router's routing table contains 10.0.0.0/8 via OSPF (AD 110) and 10.1.2.0/24 via RIP (AD 120). A packet arrives destined for 10.1.2.55. Which path will the router select?",
  ("OSPF path because it has lower AD", "RIP path because of Longest Prefix Match", "Both paths with ECMP load balancing", "The packet is dropped"),
  1,
  "Longest Prefix Match (/24 vs /8) always takes precedence over Administrative Distance during packet forwarding."
)

#mcq-item(
  "What is the Administrative Distance of a static route configured with 'ip route 10.0.0.0 255.0.0.0 192.168.1.1 50'?",
  ("1", "50", "110", "0"),
  1,
  "The integer appended to the end of a static route command overrides the default AD of 1 with the specified value (50)."
)

#mcq-item(
  "Which routing protocol source has an Administrative Distance of 90?",
  ("Internal BGP", "External BGP", "Internal EIGRP", "OSPF"),
  2,
  "Internal EIGRP has an Administrative Distance of 90."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The World's Full Internet BGP Table", "Global Internet Core Routers do not use default routes. As of 2027, the global Internet BGP routing table exceeds 980,000 active IPv4 routes and 210,000 IPv6 routes, requiring specialized TCAM memory in carrier chassis.")

#spotlight-box("2027 Tech Spotlight: Cisco SD-WAN Dynamic Path Selection", "Enterprise branch routers no longer rely solely on IP SLA ping probes. Cisco SD-WAN continuously measures jitter, packet loss, and latency on every link in real-time, dynamically steering Zoom and Microsoft Teams traffic to the lowest-latency ISP.")
'''

# =============================================================================
# CHAPTER 12: Single & Multi-Area OSPFv2 Dynamic Routing Architecture Lab
# =============================================================================
chapters_eng_9_16[12] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
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
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
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
'''

# =============================================================================
# CHAPTER 13: Enterprise IP Services: Cisco IOS DHCP Server, DHCP Relay & NAT/PAT Lab
# =============================================================================
chapters_eng_9_16[13] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 13 · ENTERPRISE IP SERVICES: DHCP & NAT/PAT]
= Chapter 13: Enterprise IP Services: Cisco IOS DHCP Server, DHCP Relay & NAT/PAT Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  DHCP DORA 4-way handshake, Cisco IOS DHCP Server configuration, DHCP Relay Agent (`ip helper-address`), IPv4 address preservation, and Port Address Translation (PAT / NAT Overload) lab implementation.
]

#v(2pt)

== 13.1 Dynamic Host Configuration Protocol (DHCP) Operation
DHCP automates IPv4 address, subnet mask, default gateway, and DNS configuration on client endpoints:
- *The DORA 4-Way Handshake:*
  - *1. Discover (Client to Server):* Client broadcasts `DHCPDISCOVER` to `255.255.255.255` on UDP port 67 (Source IP `0.0.0.0:68`).
  - *2. Offer (Server to Client):* DHCP server reserves an IP and unicassts/broadcasts `DHCPOFFER` to client.
  - *3. Request (Client to Server):* Client broadcasts `DHCPREQUEST` formalizing its acceptance of the offered lease.
  - *4. Acknowledgment (Server to Client):* Server sends `DHCPACK` confirming lease duration and network parameters.

#v(2pt)

== 13.2 Cisco IOS DHCP Server Configuration
#terminal-box([
```cisco
! Exclude static addresses (gateways, printers, servers):
Router(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.20
! Configure the active DHCP address pool:
Router(config)# ip dhcp pool Engineering_Pool
Router(config-dhcp)# network 192.168.10.0 255.255.255.0
Router(config-dhcp)# default-router 192.168.10.1
Router(config-dhcp)# dns-server 8.8.8.8 1.1.1.1
Router(config-dhcp)# domain-name rtechlab.com
Router(config-dhcp)# lease 7 0 0
```
])

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab08-dhcp-relay-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 13.1: Lab 08 — DHCP Relay Multi-VLAN Topology.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab09-pat-nat-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 13.2: Lab 09 — PAT / NAT Overload Enterprise Gateway.]
  ]
)

#pagebreak()

== 13.3 DHCP Relay Agent (`ip helper-address`)
Routers drop broadcast packets at Layer 3. If the corporate DHCP server resides in a centralized server farm on a different VLAN, client `DHCPDISCOVER` broadcasts will be discarded at the router interface!
- *The Solution:* Configure `ip helper-address <DHCP_Server_IP>` on the client-facing router interface.
- The router intercepts client broadcast UDP port 67 packets, converts them into #hl[unicast packets], and forwards them directly to the central DHCP server.

#v(2pt)

== 13.4 Network Address Translation (NAT) & PAT
NAT preserves public IPv4 space and conceals internal private network addressing:
#table(
  columns: (1.2fr, 1.6fr, 3.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*NAT Type*], [*Mapping Ratio*], [*Production Use Case & Operation*]),
  [Static NAT], [One-to-One (1:1)], [Maps one private IP permanently to one public IP. Used for inbound DMZ servers (Web/Mail).],
  [Dynamic NAT], [Many-to-Many], [Maps private hosts to a pool of public IPs on a first-come, first-served basis.],
  [PAT / Overload], [Many-to-One (N:1)], [Translates thousands of private IPs to a #hl[single public IP] by tracking unique source Layer 4 port numbers.]
)

#v(2pt)

== 13.5 Production PAT / NAT Overload CLI Lab
#terminal-box([
```cisco
! Step 1: Identify Inside and Outside Interfaces:
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# ip nat inside
Edge-RTR(config-if)# exit
Edge-RTR(config)# interface GigabitEthernet0/0/1
Edge-RTR(config-if)# ip nat outside
Edge-RTR(config-if)# exit

! Step 2: Define ACL matching internal private hosts:
Edge-RTR(config)# access-list 1 permit 192.168.0.0 0.0.255.255

! Step 3: Enable PAT Overload onto public egress interface:
Edge-RTR(config)# ip nat inside source list 1 interface GigabitEthernet0/0/1 overload
```
])

#v(2pt)

== 13.6 NAT Verification & Translation Table Inspection
#terminal-box([
```cisco
Edge-RTR# show ip nat translations
Pro Inside global          Inside local           Outside local        Outside global
tcp 203.0.113.5:49152      192.168.10.50:49152    198.51.100.10:80     198.51.100.10:80
tcp 203.0.113.5:49153      192.168.10.51:49153    198.51.100.20:443    198.51.100.20:443
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("What is the difference between Inside Local and Inside Global addresses?", "Inside Local is the actual private RFC 1918 IP address assigned to an internal workstation. Inside Global is the translated public IP address that represents the internal device on the public Internet.")
#faq-box("How many concurrent connections can a single public IP support under PAT?", "PAT tracks connections using 16-bit Layer 4 port numbers. Theoretically, up to approximately 65,000 concurrent translation sessions can be multiplexed over a single public IPv4 address.")
#faq-box("Which UDP ports does DHCP utilize?", "DHCP clients broadcast on UDP port 68; DHCP servers listen on UDP port 67.")

#v(2pt)

== Short-Answer Technical Review
1. *State the correct sequence of the four-step DHCP handshake:* Discover -> Offer -> Request -> Acknowledge (DORA).
2. *Identify the command that forwards DHCP broadcast requests across a router:* `ip helper-address <DHCP_Server_IP>` configured on the client's gateway interface.
3. *What keyword in the NAT configuration enables Port Address Translation (PAT)?* `overload`.
4. *Write the Cisco IOS command to clear all active dynamic NAT translation entries:* `clear ip nat translation *`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer configures a Cisco router as a DHCP server. Which command ensures the default gateway IP 192.168.1.1 is never assigned to a workstation?",
  ("ip dhcp exclude 192.168.1.1", "ip dhcp excluded-address 192.168.1.1", "no ip dhcp pool 192.168.1.1", "deny host 192.168.1.1"),
  1,
  "'ip dhcp excluded-address' prevents the DHCP server from leasing specified static addresses."
)

#mcq-item(
  "Under Cisco NAT terminology, what is the term for the IP address of an outside destination host as it appears to devices on the internal private network?",
  ("Inside Local", "Inside Global", "Outside Local", "Outside Global"),
  2,
  "Outside Local is the IP address of an external host as known to devices on the internal network."
)

#mcq-item(
  "Which protocol translation method allows 500 enterprise users to browse the Internet simultaneously using a single public IPv4 address?",
  ("Static NAT", "Dynamic NAT", "PAT (NAT Overload)", "BGP Route Reflection"),
  2,
  "PAT (Port Address Translation) multiplexes thousands of private connections onto a single public IP using unique Layer 4 port numbers."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Carrier-Grade NAT (CGNAT)", "Because IPv4 addresses are exhausted, major cellular and broadband ISPs place entire cities behind massive carrier-grade NAT systems (RFC 6598, using the shared `100.64.0.0/10` address block), performing double NAT before packets reach the public web.")

#spotlight-box("2027 Tech Spotlight: NAT64 / DNS64 Transition", "Modern cellular networks operate IPv6-only internal cores. NAT64 routers convert outbound IPv6 requests into legacy IPv4 packets, enabling IPv6 mobile phones to access legacy IPv4-only web servers seamlessly.")
'''

# =============================================================================
# CHAPTER 14: Enterprise Network Security: Standard & Extended ACLs, Remote SSH & AAA
# =============================================================================
chapters_eng_9_16[14] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 14 · NETWORK SECURITY & ACCESS CONTROL LISTS]
= Chapter 14: Enterprise Network Security: Standard & Extended ACLs, Remote SSH & AAA

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Access Control List (ACL) mechanics, Standard vs Extended ACL rules, placement guidelines, First Hop Redundancy Protocols (HSRP/VRRP), NTP synchronization, Syslog severity levels, and SNMPv3 security.
]

#v(2pt)

== 14.1 Access Control List (ACL) Architectural Rules
Access Control Lists (ACLs) are ordered series of permit and deny statements applied to router interfaces to filter packets:
- *Sequential Processing:* Cisco IOS evaluates ACL statements #hl[strictly from top to bottom]. Once a match occurs, the permit or deny action is immediately executed, and no further lines are checked.
- *The Implicit Deny Any:* At the very end of every ACL is an invisible, hardwired rule: #hl[`deny ip any any`]. If a packet does not match any configured permit statement, it is silently dropped!
- *Interface Direction:*
  - *Inbound ACL (`in`):* Packets are filtered #hl[before] routing table lookup, saving router CPU cycles.
  - *Outbound ACL (`out`):* Packets are routed first, then filtered before being transmitted out the exit interface.

#v(2pt)

== 14.2 Standard vs Extended ACLs & Placement Rules
#table(
  columns: (1.3fr, 1.4fr, 1.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*ACL Category*], [*Numbered Range*], [*Filtering Criteria*], [*Gold Standard Placement Rule*]),
  [Standard ACL], [1 – 99 & 1300 – 1999], [Filters strictly on #hl[Source IP Address] only], [Place #hl[closest to the destination] to prevent blocking legitimate traffic elsewhere.],
  [Extended ACL], [100 – 199 & 2000 – 2699], [Filters on Protocol, Source IP, Destination IP, & Port], [Place #hl[closest to the source] to discard unwanted packets before wasting network bandwidth.]
)

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab10-extended-acl-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 14.1: Packet Tracer Lab 10 — Extended Access Control List Enterprise Security Topology.]
]

#pagebreak()

== 14.3 Extended ACL Production CLI Lab
*Objective:* Permit Engineering (`192.168.10.0/24`) to access Finance Server (`172.16.1.100`) via HTTPS (TCP 443) only. Block all other traffic from Engineering to Finance, but permit all other general Internet access:
#terminal-box([
```cisco
! Configure Named Extended ACL:
Edge-RTR(config)# ip access-list extended SECURE_FINANCE_ACCESS
Edge-RTR(config-ext-nacl)# 10 permit tcp 192.168.10.0 0.0.0.255 host 172.16.1.100 eq 443
Edge-RTR(config-ext-nacl)# 20 deny ip 192.168.10.0 0.0.0.255 host 172.16.1.100
Edge-RTR(config-ext-nacl)# 30 permit ip 192.168.10.0 0.0.0.255 any
Edge-RTR(config-ext-nacl)# exit

! Apply Inbound on the Engineering Gateway Interface:
Edge-RTR(config)# interface GigabitEthernet0/0/0.10
Edge-RTR(config-subif)# ip access-group SECURE_FINANCE_ACCESS in
```
])

#v(2pt)

== 14.4 First Hop Redundancy Protocols (HSRP & VRRP)
Default gateway failures halt enterprise communications. FHRP groups two physical routers into a single Virtual IP (VIP):
- *Hot Standby Router Protocol (HSRP - RFC 2281):* Cisco proprietary. Active router forwards traffic; Standby router monitors via Hellos (3s/10s). Virtual MAC format: `0000.0c07.acXX` (where `XX` is the hex group number).
- *Preemption:* By default, an offline active router that recovers will #hl[not] reclaim its active role unless `standby <group> preempt` is explicitly configured.
#terminal-box([
```cisco
RouterA(config-if)# standby 1 ip 192.168.10.254
RouterA(config-if)# standby 1 priority 110
RouterA(config-if)# standby 1 preempt
```
])

#v(2pt)

== 14.5 Enterprise Network Management: Syslog & SNMP
- *Syslog Severity Levels (0 to 7):* Mnemonic: *"Every Alley Cat Eats Wet Noodles In Daytime"*
  (0: Emergency, 1: Alert, 2: Critical, 3: Error, 4: Warning, 5: Notice, 6: Informational, 7: Debug).
- *SNMP Versions:* SNMPv1/v2c use insecure plaintext community strings. #hl[SNMPv3] provides authentication and encryption via SHA and AES (`authPriv` security model).

#pagebreak()

== Student Technical FAQs
#faq-box("Why must Standard ACLs be placed closest to the destination?", "Standard ACLs evaluate only the source IP address. If an engineer placed a Standard ACL close to the source to block access to one server, it would inadvertently block that source from accessing all other networks and the Internet!")
#faq-box("What is the effect of the 'established' keyword in an Extended ACL?", "The 'established' keyword permits incoming TCP packets only if the ACK or RST control flag is set, allowing return responses to internally initiated sessions while blocking externally initiated connections.")
#faq-box("Why is NTP synchronization critical before reviewing Syslog files?", "If router and switch internal clocks drift apart, forensic log correlation during a security breach or network outage becomes impossible.")

#v(2pt)

== Short-Answer Technical Review
1. *State the numbered range for Standard IPv4 Access Control Lists:* 1 – 99 and 1300 – 1999.
2. *Identify the virtual MAC address prefix used by HSRP version 1:* `0000.0c07.acXX` (where XX represents the HSRP group number).
3. *What is Syslog Severity Level 4?* Warning.
4. *Which security level of SNMPv3 provides both cryptographic authentication and data encryption?* `authPriv`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer enters the command 'access-list 10 permit 192.168.1.0 0.0.0.255' but configures no other lines. What happens to packets from 10.0.0.5?",
  ("They are permitted", "They are dropped by the implicit deny", "They are forwarded to the CPU", "They trigger an alert"),
  1,
  "Because of the invisible implicit deny at the end of every ACL, any traffic not explicitly permitted is silently dropped."
)

#mcq-item(
  "Which FHRP protocol is an open IEEE industry standard that assigns the virtual MAC address 0000.5e00.01XX?",
  ("HSRP", "GLBP", "VRRP (Virtual Router Redundancy Protocol)", "CARP"),
  2,
  "VRRP (RFC 5798) is the open standard First Hop Redundancy Protocol utilizing virtual MAC 0000.5e00.01XX."
)

#mcq-item(
  "Where should an Extended ACL designed to block specific traffic from a single department be applied for maximum network efficiency?",
  ("Closest to the destination", "Closest to the source", "On the Core switch", "On the Internet edge firewall"),
  1,
  "Extended ACLs should always be placed closest to the traffic source to conserve network bandwidth and router processing power."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The Meaning of 'Established' in TCP Firewalls", "Before modern stateful firewalls existed, early Cisco router firewalls relied exclusively on Extended ACLs containing the 'established' keyword. It inspected byte 13 of the TCP header to ensure the ACK bit was set.")

#spotlight-box("2027 Tech Spotlight: Cisco TrustSec & Security Group Tags (SGT)", "Modern enterprise fabrics are replacing cumbersome IP-based ACLs with Cisco TrustSec. Routers and switches stamp a 16-bit Security Group Tag (SGT) directly into the Layer 2 frame, allowing centralized role-based security policies regardless of IP address.")
'''

# =============================================================================
# CHAPTER 15: Cisco Packet Tracer & GNS3 Enterprise Simulation & Systematic TAC Troubleshooting
# =============================================================================
chapters_eng_9_16[15] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 15 · PACKET TRACER, GNS3 & TAC TROUBLESHOOTING]
= Chapter 15: Cisco Packet Tracer & GNS3 Enterprise Simulation & TAC Troubleshooting Masterclass

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Comparison of simulation vs hardware emulation (Packet Tracer vs GNS3/EVE-NG), hybrid enterprise topologies, Wireshark deep frame capture, and the 5-tier systematic Cisco TAC troubleshooting methodology.
]

#v(2pt)

== 15.1 Simulation vs Emulation: Packet Tracer vs GNS3 / EVE-NG
Mastering network engineering requires comprehensive virtualization tools:
- *Cisco Packet Tracer (Simulator):* A lightweight application that *simulates* network behavior in software. Ideal for CCNA study, visual protocol inspection, and rapid topology creation. Limitation: Only implements a subset of real Cisco IOS commands.
- *GNS3 / EVE-NG (Emulators):* Virtualization environments that *emulate* real computer hardware. GNS3 executes #hl[genuine, unmodified Cisco IOS binary images] (via Dynamips or Cisco IOU/IOL) and supports real Linux Docker containers, Palo Alto firewalls, and Python automation engines.
- *Wireshark Packet Analysis:* GNS3 permits native packet capture on any virtual wire, enabling deep-dive inspection of raw hex headers, TCP handshakes, and OSPF LSA updates.

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab13-gns3-enterprise-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 15.1: Lab 13 — GNS3 Multi-Tier Enterprise Emulation Topology.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab14-tac-troubleshooting-flowchart.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 15.2: Lab 14 — Cisco TAC 5-Tier Systematic Triage Flowchart.]
  ]
)

#pagebreak()

== 15.2 The Cisco TAC 5-Tier Systematic Troubleshooting Triage
When enterprise networks fail, ad-hoc guessing causes prolonged downtime. The Cisco Technical Assistance Center (TAC) enforces a structured, layer-by-layer troubleshooting methodology:
- *Tier 1: Physical Layer (Layer 1) Verification:*
  - Inspect link LEDs, verify cable pinouts, test SFP transceivers, check for duplex/speed mismatches.
  - Command: `show interfaces GigabitEthernet0/1`
  - Look for: `GigabitEthernet0/1 is down, line protocol is down` (Physical cable disconnected or remote interface shut). `input errors`, `CRC`, and `late collisions` indicate duplex mismatch or damaged copper cable.
- *Tier 2: Data Link Layer (Layer 2) Triage:*
  - Check VLAN assignment, verify trunk encapsulation and allowed VLANs, inspect Native VLAN consistency, confirm Spanning Tree state.
  - Commands: `show mac address-table`, `show interfaces trunk`, `show spanning-tree vlan 10`
  - Look for: Ports stuck in `Discarding` or `err-disabled`.
- *Tier 3: Network Layer (Layer 3) & Routing Triage:*
  - Confirm IP addressing and subnet masks, verify ARP resolution, inspect the Routing Table using Longest Prefix Match, verify OSPF neighbor states.
  - Commands: `show ip interface brief`, `show ip arp`, `show ip route`, `show ip ospf neighbor`
  - Look for: Missing default gateway, OSPF neighbors stuck in `Init` or `ExStart`.
- *Tier 4: Transport Layer (Layer 4) & Security Filtering:*
  - Confirm TCP/UDP port listening status, verify that Access Control Lists are not dropping legitimate traffic, check NAT translation tables.
  - Commands: `show access-lists`, `show ip nat translations`
  - Look for: Rapidly incrementing deny counters on ACL lines.
- *Tier 5: Application Layer (Layer 7) & Name Resolution:*
  - Verify DNS resolution, test DHCP lease states, verify NTP clock synchronization.
  - Commands: `ping`, `traceroute`, `show ntp status`

#v(2pt)

== 15.3 Essential Production Troubleshooting Commands Matrix
#table(
  columns: (1.5fr, 4.5fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Triage Objective*], [*Primary Cisco IOS Verification Command*]),
  [Interface IP & Physical Link State], [`Router# show ip interface brief`],
  [Inspect Interface Hardware & Errors], [`Router# show interfaces GigabitEthernet0/1`],
  [Evaluate Active Routing Decisions], [`Router# show ip route | include 0.0.0.0`],
  [Verify Dynamic OSPF Neighbors], [`Router# show ip ospf neighbor`],
  [Inspect Switchport Port Security], [`Switch# show port-security interface GigabitEthernet0/1`],
  [Review Active NAT Translations], [`Router# show ip nat translations`],
  [Trace Path Hops & Detect Blackholes], [`Router# traceroute 8.8.8.8 numeric`],
  [Disable All Active Debugging], [`Router# undebug all` (or `un all`)]
)

#pagebreak()

== Student Technical FAQs
#faq-box("Why is 'debug' dangerous in production networks?", "'debug' commands run at the highest CPU interrupt priority. Running 'debug ip packet' or 'debug all' on a busy enterprise core router can drive CPU utilization to 100%, causing total control-plane collapse and network reboot. Always use specific debugs with ACL filters, and remember 'undebug all'.")
#faq-box("What does 'line protocol is down' mean when the interface is physically UP?", "If the interface is UP (Layer 1 good) but line protocol is DOWN (Layer 2 bad), it indicates a Layer 2 framing mismatch, clock rate issue on serial links, keepalive failure, or encapsulation mismatch (such as HDLC vs PPP).")
#faq-box("How does traceroute work at the packet level?", "Traceroute sends UDP or ICMP probes with incrementing TTL values starting at TTL=1. Each intermediate router decrements TTL to 0, drops the packet, and returns an ICMP Time Exceeded (Type 11) message, revealing the router's IP address.")

#v(2pt)

== Short-Answer Technical Review
1. *State the symptom of a duplex mismatch on an Ethernet switch interface:* High input errors, CRC checksum errors, and late collisions displayed in `show interfaces`.
2. *Identify the command that terminates all active debug processes on a Cisco router:* `undebug all` (or `no debug all`).
3. *What does the 'show ip interface brief' status 'administratively down, line protocol down' indicate?* The interface has been manually disabled using the `shutdown` configuration command.
4. *Distinguish between Packet Tracer and GNS3 in terms of execution engine:* Packet Tracer simulates software behavior; GNS3 emulates actual hardware executing genuine Cisco IOS operating system images.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer issues 'ping 192.168.1.1' from a PC. The ping fails. The engineer then pings 127.0.0.1 and it succeeds. What does this confirm?",
  ("The default gateway is operational", "The local TCP/IP protocol stack is properly installed on the PC", "The physical network cable is connected", "DNS is functioning"),
  1,
  "Pinging the internal loopback address (127.0.0.1) tests and verifies that the local operating system TCP/IP stack is functioning correctly."
)

#mcq-item(
  "Which Cisco IOS show command provides an instant single-screen summary of all interface IP addresses and their Layer 1 / Layer 2 operational statuses?",
  ("show running-config interface", "show interfaces summary", "show ip interface brief", "show ip status"),
  2,
  "'show ip interface brief' is the most ubiquitous command for viewing IP addresses and interface up/down states."
)

#mcq-item(
  "What is the root cause when 'show interfaces' reports a high number of late collisions on an Ethernet link?",
  ("Cable exceeding 100-meter distance limit or duplex mismatch", "Incorrect VLAN configuration", "Spanning tree loop", "MTU size mismatch"),
  0,
  "Late collisions occur when an interface operating in half-duplex detects a collision after transmitting 64 bytes, caused by excessive cable length or duplex mismatch."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The History of Ping", "Mike Muuss wrote the original 'ping' utility in December 1983. He named it after the sound of sonar pulses used in submarine echolocation, because the tool emits ICMP Echo Request pulses to detect remote hosts.")

#spotlight-box("2027 Tech Spotlight: AI-Powered Network Observability (Cisco ThousandEyes)", "Modern enterprise NOCs no longer troubleshoot manually with ping and traceroute. Cisco ThousandEyes and Cisco DNA Center deploy synthetic agents across the global Internet to pinpoint fiber cuts and cloud ISP outages before end users notice.")
'''

# =============================================================================
# CHAPTER 16: CCNA Top 60 MNC Technical Screening Interview Vault & Viva Guide
# =============================================================================
chapters_eng_9_16[16] = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 16 · CCNA TOP 60 MNC INTERVIEW VAULT]
= Chapter 16: CCNA Top 60 MNC Technical Screening Interview Vault & Viva Guide

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Comprehensive technical screening question bank, Senior Network Architect model answers across all six CCNA domains, rapid-fire viva one-liners, and the First 90-Day NOC engineering playbook.
]

#v(2pt)

== 16.1 Cisco CCNA 200-301 Exam Domain Breakdown
Technical hiring managers at Cisco TAC, TCS, Infosys, Wipro, HCL, and global NOCs evaluate candidates across six official blueprint domains:
- *Domain 1: Network Fundamentals (20%):* Components, cabling, IPv4/IPv6, virtualization, and cloud architectures.
- *Domain 2: Network Access (20%):* VLANs, 802.1Q trunking, STP/RSTP, EtherChannel, and wireless LAN architectures.
- *Domain 3: IP Connectivity (25%):* Routing tables, static routing, floating failovers, and single/multi-area OSPFv2.
- *Domain 4: IP Services (10%):* DHCP, NAT/PAT, NTP, SNMP, and Syslog enterprise logging.
- *Domain 5: Security Fundamentals (15%):* ACLs, Port Security, 802.1X, AAA, VPNs, and wireless encryption.
- *Domain 6: Automation & Programmability (10%):* REST APIs, JSON data structures, Ansible, DNA Center, and Git.

#v(2pt)

== 16.2 Top 60 MNC Technical Screening Questions & Architect Answers
#table(
  columns: (0.7fr, 2.3fr, 3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*No.*], [*MNC Technical Interview Question*], [*Senior Network Architect Model Answer*]),
  [Q01], [What is the difference between Collision Domain and Broadcast Domain?], [A collision domain is a physical network segment where frame collisions can occur (broken per switch port). A broadcast domain is the scope of a broadcast frame (broken by routers and VLANs).],
  [Q02], [Explain the 5 stages of the Cisco router boot sequence.], [1. POST diagnostics in ROM, 2. Bootstrap loader execution, 3. Locate IOS in Flash/TFTP/ROM, 4. Load & decompress IOS into RAM, 5. Read startup-config from NVRAM or prompt for Setup mode.],
  [Q03], [How do you recover a lost router password without losing config?], [Interrupt boot into ROMMON, change register to `0x2142` with `confreg 0x2142`, reset router, copy startup-config to running-config, reset secret, restore register `0x2102`, and save.],
  [Q04], [What is the difference between Administrative Distance and Metric?], [AD defines the trustworthiness of the route source (e.g., Connected=0, Static=1, OSPF=110). Metric determines the best path among routes within the exact same routing protocol.],
  [Q05], [How does the Longest Prefix Match (LPM) rule operate?], [When a router evaluates multiple routes to a destination IP, it always forwards using the route with the most specific subnet mask, regardless of Administrative Distance.],
  [Q06], [Explain the 7 states of OSPF neighbor adjacency.], [Down -> Init (Hello received) -> 2-Way (bi-directional seen, DR/BDR elected) -> ExStart (master/slave) -> Exchange (DBD headers) -> Loading (LSR/LSU) -> Full (synchronized LSDB).],
  [Q07], [Why does OSPF elect a DR and BDR on broadcast multi-access links?], [To reduce adjacency overhead from $N(N-1)/2$ full mesh adjacencies to $N-1$ adjacencies, preventing broadcast storm flooding of Link-State Updates.],
  [Q08], [What is the difference between Static NAT, Dynamic NAT, and PAT?], [Static NAT is 1:1 permanent mapping; Dynamic NAT is many-to-many pool mapping; PAT (Overload) multiplexes thousands of private IPs onto a single public IP using Layer 4 ports.],
  [Q09], [Why must Standard ACLs be placed near the destination?], [Standard ACLs filter strictly on source IP address. Placing them near the source blocks that host from accessing all other network resources and the Internet.],
  [Q10], [How does BPDU Guard protect an access layer switch?], [If an unauthorized switch is connected to a PortFast-enabled port and transmits a BPDU, BPDU Guard immediately error-disables the interface, preventing Spanning Tree loops.],
  [Q11], [Explain the difference between 802.1D STP and 802.1w RSTP.], [Legacy STP converges in 30–50s using timers. RSTP converges in under 1 second using an active proposal/agreement handshake and pre-computed Alternate Ports.],
  [Q12], [What is a Floating Static Route and how is it configured?], [A backup static route configured with a higher Administrative Distance (e.g., `ip route 0.0.0.0 0.0.0.0 <ISP2> 10`) that only installs when the primary route (AD 1) drops.]
)

#pagebreak()

== 16.3 Rapid-Fire Technical Viva One-Liners
1. *Subnet Mask /28 host capacity:* Exactly 14 usable host addresses ($2^4 - 2 = 14$).
2. *Default Configuration Register:* `0x2102` (Boots from Flash and reads NVRAM).
3. *OSPF All Routers Multicast:* `224.0.0.5`; *OSPF All DR Routers Multicast:* `224.0.0.6`.
4. *HSRP Virtual MAC Prefix:* `0000.0c07.acXX` (where XX is the hex group number).
5. *Ethernet Channel Link Limit:* 100 meters certified channel distance for copper UTP.
6. *Command to enable IPv6 routing:* `ipv6 unicast-routing` in global configuration.
7. *802.1Q Tag Size:* 4 bytes (32 bits), inserted between Source MAC and EtherType.
8. *CAM Table Aging Time:* 300 seconds (5 minutes) for dynamic MAC address entries.
9. *DHCP Client and Server Ports:* Client broadcasts on UDP 68; Server listens on UDP 67.
10. *Number of VLANs supported by 802.1Q:* 4,096 VLANs (12-bit VID field: 1 to 4094 usable).

#v(2pt)

== 16.4 The First 90-Day Enterprise NOC Playbook
Securing your first Network Engineer position is only the beginning. Excel in your first 90 days with this operational framework:
- *Days 1–30: Passive Discovery & Network Mapping:*
  - Document all Layer 2/3 diagrams, IPAM allocations, and VLAN matrices.
  - Master internal ticketing workflows (ServiceNow / Jira Service Management).
  - Memorize critical infrastructure assets (Core switches, firewalls, ISP circuit IDs).
- *Days 31–60: Active Triage & Systematic Incident Response:*
  - Apply the Cisco TAC 5-tier methodology to resolve Tier 1/2 tickets systematically.
  - Never execute unverified configuration commands in production without peer review.
  - Always capture baseline `show running-config` before and after scheduled maintenance windows.
- *Days 61–90: Automation & Infrastructure Optimization:*
  - Automate routine configuration backups and audit checks using Python and Netmiko.
  - Identify recurring network bottlenecks and propose architectural solutions to senior architects.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "During a technical interview, you are asked: 'What is the primary operational advantage of spine-and-leaf over traditional 3-tier architecture?' What is the best answer?",
  ("Spine-and-leaf is cheaper to cable", "Spine-and-leaf provides deterministic 2-hop latency and high bandwidth for East-West datacenter traffic without STP blocking", "Spine-and-leaf uses less power", "Spine-and-leaf eliminates routers"),
  1,
  "Spine-Leaf delivers non-blocking, equal-cost multi-pathing (ECMP) optimized for server-to-server (East-West) traffic."
)

#mcq-item(
  "Which command provides complete cryptographic verification of an IOS binary image against its published Cisco MD5 hash?",
  ("verify /md5 flash:c2900-universalk9-mz.bin", "check hash flash:ios.bin", "crypto verify ios", "show flash md5"),
  0,
  "'verify /md5 flash:<filename>' computes the cryptographic MD5 hash of an IOS binary file to detect corruption."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The Meaning of CCNA on Your Resume", "Over 1.5 million engineers have passed the Cisco Certified Network Associate exam since its inception in 1998. It remains the most widely recognized networking credential across global Fortune 500 enterprises.")

#spotlight-box("2027 Tech Spotlight: Infrastructure as Code (IaC) & NetDevOps", "Modern Network Engineers no longer configure devices one CLI command at a time. NetDevOps applies software development practices — Git repositories, CI/CD automated test pipelines, and Terraform / Ansible automation — to deploy global enterprise networks in minutes.")
'''
print("[OK] English Chapters 09 to 16 loaded successfully.")
