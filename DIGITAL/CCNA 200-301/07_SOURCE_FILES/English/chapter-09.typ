#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
