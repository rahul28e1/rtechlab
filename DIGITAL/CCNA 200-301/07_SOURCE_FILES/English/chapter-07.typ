#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 07 · SWITCHING, VLANS & SPANNING TREE]
= Chapter 7: Switching, VLANs, Trunking (802.1Q) & STP

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Ethernet switching foundations: CAM table address learning, flooding, and aging; VLAN segmentation; 802.1Q trunking and native VLAN security; Router-on-a-Stick inter-VLAN routing; Spanning Tree Protocol (STP 802.1D vs RSTP 802.1w), Root Bridge election math, and PortFast / BPDU Guard.
]

#v(2pt)

== 7.1 Layer 2 Switch Logic & CAM Table Mechanics
A Layer 2 switch operates as a multiport bridge, inspecting incoming Ethernet frames to make intelligent forwarding decisions:
- *1. Learning:* As frames enter an interface, the switch reads the #hl[Source MAC address]. If the address is not present in its *Content Addressable Memory (CAM) Table*, it binds the Source MAC, port number, and VLAN ID with a default aging timer of #hl[300 seconds (5 minutes)].
- *2. Forwarding Decision:* The switch examines the #hl[Destination MAC address]:
  - *Known Unicast:* If Destination MAC is in CAM, the frame is forwarded #hl[strictly out the specific outbound port].
  - *Unknown Unicast:* If Destination MAC is not in CAM, the switch #hl[floods the frame out all ports] belonging to the same VLAN except the receiving port.
  - *Broadcast / Multicast:* Flooded out all ports within the source VLAN (`FFFF.FFFF.FFFF`).
- *3. Aging:* Entries unused for 300 seconds are purged to preserve table space and adapt to host movement.

#v(2pt)

== 7.2 Virtual Local Area Networks (VLANs) & Segmentation
A VLAN is a logical broadcast domain created within physical switches:
- *Why VLANs:* Without VLANs, all switch ports belong to a single broadcast domain. A broadcast storm from one malfunctioning host degrades bandwidth across the entire building. VLANs isolate traffic by department (HR, Finance, Guest, Voice), enforce security boundaries, and simplify QoS prioritization.
- *VLAN Numbering Ranges:*
  - *Default VLAN (VLAN 1):* Factory default for all switch ports; cannot be renamed or deleted.
  - *Normal Range (VLAN 2–1005):* Standard campus enterprise range. Stored in non-volatile flash memory in the #hl[`flash:vlan.dat`] file.
  - *Extended Range (VLAN 1006–4094):* Used by service providers and large datacenters. Stored directly in `running-config`.

#v(2pt)

== 7.3 Access Ports vs 802.1Q Trunk Ports
Switch interfaces are configured in one of two fundamental operational modes:
- *Access Port:* Belongs to exactly #hl[one single data VLAN] (plus optional Voice VLAN). Connected to end-user workstations, printers, and servers. Transmits untagged Ethernet frames.
- *Trunk Port:* Point-to-point link carrying traffic for #hl[multiple VLANs simultaneously] between switches or between switch and router. Employs the industry-standard *IEEE 802.1Q* encapsulation tag.
- *The 802.1Q Tag Structure (4 Bytes):* Inserted between Source MAC and EtherType:
  - *TPID (Tag Protocol Identifier - 16 bits):* Set to hex `0x8100` to indicate an 802.1Q frame.
  - *PCP (Priority Code Point - 3 bits):* Quality of Service (CoS) marking (0 to 7) for VoIP prioritization.
  - *VID (VLAN Identifier - 12 bits):* Identifies the VLAN (values 1 to 4094; $2^{12} = 4096$).
- *Native VLAN Security:* Frames belonging to the Native VLAN traverse the 802.1Q trunk #hl[without an 802.1Q tag]. Security Best Practice: Never use default VLAN 1 for the Native VLAN; assign an unused dummy VLAN (e.g. VLAN 999) to prevent double-tagging VLAN hopping attacks: `switchport trunk native vlan 999`.

#pagebreak()

== 7.4 Inter-VLAN Routing: Router-on-a-Stick (ROAS)
Because Layer 2 switches cannot route traffic between separate VLANs, an external Layer 3 routing engine is required:
- *The ROAS Architecture:* A single physical Gigabit Ethernet interface on a Cisco router connects to an 802.1Q trunk port on the switch.
- *Logical Subinterfaces:* The router physical interface is divided into virtual subinterfaces (e.g., `g0/0/0.10` and `g0/0/0.20`), each assigned to a specific VLAN tag and serving as that VLAN's *Default Gateway*.
- *Production CLI Configuration:*
  ```bash
  ! --- Switch Trunk Configuration ---
  Switch(config)# interface GigabitEthernet0/1
  Switch(config-if)# switchport mode trunk
  Switch(config-if)# switchport trunk allowed vlan 10,20,30
  
  ! --- Router-on-a-Stick Configuration ---
  Router(config)# interface GigabitEthernet0/0/0
  Router(config-if)# no ip address
  Router(config-if)# no shutdown
  Router(config)# interface GigabitEthernet0/0/0.10
  Router(config-subif)# encapsulation dot1Q 10
  Router(config-subif)# ip address 192.168.10.1 255.255.255.0
  Router(config)# interface GigabitEthernet0/0/0.20
  Router(config-subif)# encapsulation dot1Q 20
  Router(config-subif)# ip address 192.168.20.1 255.255.255.0
  ```

#v(2pt)

== 7.5 Spanning Tree Protocol (STP 802.1D): Looping Prevention
When redundant physical links are connected between switches to prevent single points of failure, catastrophic Layer 2 hazards emerge:
- *1. Broadcast Storms:* Switches flood broadcasts endlessly in a circular loop, consuming 100% of link bandwidth and freezing switch CPUs within seconds.
- *2. CAM Table Instability (MAC Thrashing):* The same source MAC arrives simultaneously on multiple ports, causing the switch to constantly overwrite CAM entries.
- *3. Multiple Frame Copies:* Destination hosts receive duplicated unnumbered frames, corrupting upper-layer TCP stacks.
- *STP Solution:* STP creates a loop-free logical topology by calculating spanning tree metrics and placing redundant backup ports into a #hl[Blocking state]. If the primary link fails, STP recalculates and unblocks the backup port.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg",
  caption: "Figure 7.1: Enterprise Catalyst Switch executing Spanning Tree root bridge election across fiber trunks.",
  height: 52pt
)

#v(2pt)

== 7.6 The STP Root Bridge Election Math
In any broadcast domain, all switches participate in electing a single master switch called the #hl[Root Bridge]:
- *Election Rule:* The switch with the #hl[LOWEST Bridge ID (BID)] wins the election and becomes the Root Bridge.
- *Bridge ID Components (8 Bytes Total):*
  $ "Bridge ID" = "Bridge Priority (2 Bytes)" + "System ID Extension (VLAN ID)" + "Base MAC Address (6 Bytes)" $
- *Default Priority:* `32768`. Because Cisco switches run Per-VLAN Spanning Tree (PVST+), the priority is incremented by the VLAN ID: for VLAN 10, priority is $32768 + 10 = #hl[32778]$.
- *Deterministic Root Engineering:* Never allow random MAC addresses to decide the Root Bridge! Force the core switch to win by lowering its priority:
  `Switch(config)# spanning-tree vlan 10 priority 4096` (Must be configured in increments of 4096!).

#pagebreak()

== 7.7 STP Port Roles, Port States & RSTP (802.1w) Convergence
Once the Root Bridge is elected, switches evaluate path costs to assign roles to every active switch port:
- *1. Root Port (RP):* Exactly #hl[one Root Port per non-root switch]. The port with the lowest cumulative Path Cost to the Root Bridge. Always in Forwarding state.
- *2. Designated Port (DP):* Exactly #hl[one Designated Port per physical segment]. The port that forwards frames from that segment toward the Root. All ports on the Root Bridge are Designated Ports. Always in Forwarding state.
- *3. Alternate / Blocking Port (AP/BLK):* Redundant loop ports; drops data frames but listens to BPDUs to detect link failures.

#v(2pt)

#table(
  columns: (1.1fr, 1.3fr, 1.3fr, 2.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*STP Standard*], [*Convergence Time*], [*Operational States*], [*Key Features & Handshake*]),
  [Legacy 802.1D], [30 to 50 Seconds], [Blocking $arrow$ Listening $arrow$ Learning $arrow$ Forwarding], [Timers: Max Age 20s, Forward Delay 15s. Very slow for modern voice/video.],
  [RSTP 802.1w], [#hl[Under 1 Second]], [Discarding $arrow$ Learning $arrow$ Forwarding], [Proposal/Agreement handshake. Instant cutover on link failure.],
  [Rapid PVST+], [Under 1 Second], [Discarding $arrow$ Learning $arrow$ Forwarding], [Cisco default; runs an independent fast 802.1w instance per VLAN.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "Spanning Tree PortFast")[
      Configured strictly on access ports connected to end hosts (PCs, printers):      `Switch(config-if)# spanning-tree portfast`      Bypasses the 30-second Listening/Learning delays and transitions port to #hl[Forwarding immediately]. Prevents DHCP timeout failures on booting workstations!
    ]
  ],
  [
    #concept-box(title: "BPDU Guard Security Defense")[
      Configured in tandem with PortFast to prevent rogue switches:      `Switch(config-if)# spanning-tree bpduguard enable`      If any device connects to this port and transmits an STP BPDU frame, the switch immediately disables the port into #hl[err-disabled state] to protect topology!
    ]
  ]
)

#v(2pt)

== 7.8 Essential Switching & STP Verification Commands
- `show vlan brief` — Lists all configured VLANs, VLAN names, and associated access member ports.
- `show interfaces trunk` — Displays active 802.1Q trunk ports, native VLANs, and permitted VLAN list.
- `show mac address-table dynamic` — Displays learned dynamic MAC addresses, ports, and associated VLANs.
- `show spanning-tree vlan [vlan-id]` — Identifies Root Bridge ID, local Bridge ID, Root Port, and port states (FWD/BLK).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What happens if the Native VLAN does not match on both ends of an 802.1Q trunk?", a: "A Native VLAN Mismatch error is generated via CDP. Untagged frames entering one VLAN will leak into a different VLAN at the other end, creating cross-VLAN traffic leakage and security vulnerabilities.")
#faq-item(q: "Why must spanning-tree portfast NEVER be enabled on switch-to-switch trunk ports?", a: "PortFast bypasses loop detection. If enabled on a redundant link between switches, a catastrophic Layer 2 broadcast storm will instantly paralyze the network.")
#faq-item(q: "How does Rapid Spanning Tree Protocol (RSTP) converge so much faster than 802.1D?", a: "RSTP eliminates static 15-second timer delays by utilizing an explicit point-to-point Proposal/Agreement synchronization handshake between adjacent switches.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Where does a Cisco Catalyst switch store its normal-range VLAN database?", ans: "In flash memory inside the flash:vlan.dat file.")
#short-q(num: 2, q: "How many bytes does the IEEE 802.1Q tag add to an Ethernet frame?", ans: "4 Bytes (32 bits).")
#short-q(num: 3, q: "What is the default bridge priority value for Per-VLAN Spanning Tree on VLAN 1?", ans: "32769 (Priority 32768 + System ID Extension 1).")
#short-q(num: 4, q: "Which command places an err-disabled port back into operation?", ans: "shutdown followed immediately by no shutdown.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "What metric is used as the ultimate tie-breaker during the Spanning Tree Root Bridge election if all switches share the same priority?", a: "Lowest IP address", b: "Lowest MAC address", c: "Highest port speed", d: "Longest system uptime", ans: "B", expl: "If bridge priorities are identical (e.g. default 32768), the switch with the lowest numerical MAC address wins.")
#mcq(num: 2, q: "Which operational port mode in 802.1Q trunking carries untagged data frames?", a: "Access VLAN", b: "Voice VLAN", c: "Native VLAN", d: "Management VLAN", ans: "C", expl: "802.1Q trunks transmit frames belonging to the Native VLAN without an 802.1Q header tag.")
#mcq(num: 3, q: "What is the default CAM table aging timer on Cisco Catalyst switches?", a: "60 seconds", b: "120 seconds", c: "300 seconds (5 minutes)", d: "3600 seconds", ans: "C", expl: "If a learned MAC address does not emit frames for 300 seconds, the entry is automatically aged out of CAM.")
#mcq(num: 4, q: "What router subinterface command specifies the 802.1Q VLAN tag for Router-on-a-Stick inter-VLAN routing?", a: "switchport trunk dot1q", b: "encapsulation dot1Q [vlan-id]", c: "vlan dot1q [vlan-id]", d: "ip dot1q enable", ans: "B", expl: "Under the subinterface (e.g. g0/0.10), 'encapsulation dot1Q 10' tells IOS to bind that subinterface to VLAN 10.")
#mcq(num: 5, q: "What action does BPDU Guard execute when a Spanning Tree BPDU frame is detected on a PortFast enabled access port?", a: "Silently drops the BPDU frame", b: "Forwards BPDU to the Root Bridge", c: "Immediately transitions the port to err-disabled state", d: "Demotes the port to half-duplex", ans: "C", expl: "BPDU Guard prevents rogue switch loops by shutting the port down into err-disabled state upon receiving any BPDU.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The VLAN 1 Architecture Trap")[
      Cisco switches always process control traffic (CDP, VTP, PAgP) over VLAN 1 even if VLAN 1 is removed from the trunk allowed list!
    ]
  ],
  [
    #tech-spotlight-box(title: "EVPN-VXLAN Datacenter Overlays")[
      Modern cloud datacenters replace STP entirely with VXLAN (Virtual Extensible LAN), encapsulating Layer 2 Ethernet frames inside UDP Layer 3 packets!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
