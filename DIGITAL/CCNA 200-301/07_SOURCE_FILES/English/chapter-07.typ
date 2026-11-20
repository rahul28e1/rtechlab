#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 07 · SWITCHING, VLANS & SPANNING TREE]
= Chapter 7: Switching, VLANs, Trunking (802.1Q), Port Security & STP

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Ethernet switching foundations: CAM table address learning, flooding, and aging; VLAN segmentation; switchport port security violation modes; 802.1Q trunking and native VLAN security; Spanning Tree Protocol (STP 802.1D vs RSTP 802.1w), Root Bridge priority election math, PortFast, BPDU Guard, and EtherChannel link aggregation with hands-on Cisco Packet Tracer laboratories.
]

#v(2pt)

== 7.1 Layer 2 Switch Logic & CAM Table Mechanics
A Layer 2 switch operates as a multiport bridge, inspecting incoming Ethernet frames to make intelligent forwarding decisions:
- *1. Learning:* As frames enter an interface, the switch reads the #hl[Source MAC address]. If the address is not present in its *Content Addressable Memory (CAM) Table*, it binds the Source MAC, port number, and VLAN ID with a default aging timer of #hl[300 seconds (5 minutes)].
- *2. Forwarding Decision:* The switch examines the #hl[Destination MAC address]:
  - *Known Unicast:* If Destination MAC is in CAM, the frame is forwarded #hl[strictly out the specific outbound port].
  - *Unknown Unicast:* If Destination MAC is not in CAM, the switch #hl[floods the frame out all ports] belonging to the same VLAN except the receiving port.
  - *Broadcast / Multicast:* Flooded out all ports within the source VLAN (`FFFF.FFFF.FFFF`).
- *3. Aging:* Entries unused for 300 seconds are purged to preserve table space and adapt to host mobility.

#v(3pt)

== 7.2 Virtual Local Area Networks (VLANs) & Segmentation
A VLAN is a logical broadcast domain created within physical switches:
- *Why VLANs:* Without VLANs, all switch ports belong to a single broadcast domain. A broadcast storm from one malfunctioning host degrades bandwidth across the entire building. VLANs isolate traffic by department (Engineering, Sales, Management, Voice), enforce security boundaries, and simplify QoS prioritization.
- *VLAN Numbering Ranges:*
  - *Default VLAN (VLAN 1):* Factory default for all switch ports; cannot be renamed or deleted. Carries CDP, STP, and VTP frames.
  - *Normal Range (VLAN 2–1005):* Standard campus enterprise range. Stored in non-volatile flash memory in the #hl[`flash:vlan.dat`] file.
  - *Extended Range (VLAN 1006–4094):* Used by service providers and large datacenters. Stored directly in `running-config`.

#v(3pt)

== 7.3 Hands-On Practical Lab: Switch Port Security & Sticky MAC
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Harden Layer 2 access ports against rogue device attachment on Cisco Catalyst 2960 switch. Limit port FastEthernet0/1 to a maximum of 2 MAC addresses, learn authorized addresses dynamically via sticky learning, and enforce shutdown violation mode.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab02-port-security-topology.svg", width: 88%)
#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*MAC Address*], [*VLAN*], [*Operational Role*],
  [SW1-ACCESS], [Fa0/1], [Connected Host], [VLAN 10], [Access Port with Port Security Enabled],
  [Auth-PC1], [FastEthernet0], [0050.7966.6801], [VLAN 10], [Authorized Employee Workstation (Sticky Learned)],
  [Auth-Laptop], [FastEthernet0], [0050.7966.6802], [VLAN 10], [Authorized Corporate Laptop (Sticky Learned)],
  [Rogue-Laptop], [FastEthernet0], [00D0.FF11.2233], [VLAN 10], [Unauthorized Attacker (Triggers Err-Disable)]
)

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Catalyst 2960 Switch Port Security Configuration:]
```cisco
SW1-ACCESS(config)# interface FastEthernet0/1
SW1-ACCESS(config-if)# switchport mode access
SW1-ACCESS(config-if)# switchport access vlan 10
SW1-ACCESS(config-if)# switchport port-security
SW1-ACCESS(config-if)# switchport port-security maximum 2
SW1-ACCESS(config-if)# switchport port-security mac-address sticky
SW1-ACCESS(config-if)# switchport port-security violation shutdown
SW1-ACCESS(config-if)# end
```

#v(2pt)
#terminal-specimen(title: "SW1-ACCESS# show port-security interface FastEthernet0/1")[
```text
Port Security              : Enabled
Port Status                : Secure-down (err-disabled)
Violation Mode             : Shutdown
Aging Time                 : 0 mins
Max MAC Addresses          : 2
Total MAC Addresses        : 2
Configured MAC Addresses   : 0
Sticky MAC Addresses       : 2
Last Source Address:Vlan   : 00D0.FF11.2233:10
Security Violation Count   : 1
! --- Recovering from Err-Disabled State: ---
SW1-ACCESS(config)# interface FastEthernet0/1
SW1-ACCESS(config-if)# shutdown
SW1-ACCESS(config-if)# no shutdown
```
]

#concept-box(title: "PORT SECURITY VIOLATION MODES MATRIX")[
  - *Protect:* Silently drops frames from unauthorized MACs. No Syslog message generated; violation counter does NOT increment.
  - *Restrict:* Drops unauthorized frames, generates an immediate Syslog/SNMP alert, and increments the Security Violation Counter.
  - *Shutdown (Default):* Drops frames, sends Syslog alert, increments counter, and immediately transitions the port into #hl[`err-disabled`] state (LED turns amber). Requires manual `shutdown` / `no shutdown` to reset.
]

#v(3pt)

== 7.4 Access Ports vs 802.1Q Trunk Ports & Native VLAN Isolation
Switch interfaces operate in one of two fundamental administrative trunking modes:
- *Access Port:* Belongs to exactly #hl[one VLAN] and connects end-user devices (PCs, printers, IP phones). Strips all VLAN tagging before transmission so end hosts receive standard untagged Ethernet frames.
- *Trunk Port (IEEE 802.1Q):* Carries traffic for #hl[multiple VLANs simultaneously] across a single physical link connecting switches or routers. Inserts a *4-byte 802.1Q Tag* into the Ethernet header, which includes a 12-bit VLAN ID (allowing $2^{12} = 4096$ VLANs).
- *The Native VLAN & VLAN Hopping Attacks:*
  - By default, IEEE 802.1Q transmits frames belonging to the *Native VLAN (VLAN 1)* without an 802.1Q tag.
  - *VLAN Hopping Attack:* An attacker sends double-tagged frames (`Outer Tag: VLAN 1, Inner Tag: VLAN 20`). The switch strips the outer tag and forwards the packet into VLAN 20!
  - *Defense:* #hl[Change the Native VLAN to an unused, dedicated ID (e.g. VLAN 999)] on all trunk links and tag native traffic:
    `Switch(config-if)# switchport trunk native vlan 999`
    `Switch(config)# vlan dot1q tag native`

#v(3pt)

== 7.5 Hands-On Practical Lab: VLANs & 802.1Q Trunking
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy enterprise VLAN segmentation across SW1-CORE and SW2-ACCESS switches. Configure VLAN 10 (Engineering) and VLAN 20 (Sales), provision 802.1Q trunking on Gigabit uplink, and isolate Native VLAN to 999.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab03-vlan-trunking-topology.svg", width: 88%)
#v(2pt)

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Catalyst Switch Trunking & VLAN Database Configuration:]
```cisco
! --- Step 1: Create VLANs on SW1 & SW2 ---
SW1-CORE(config)# vlan 10
SW1-CORE(config-vlan)# name ENGINEERING_DEPT
SW1-CORE(config-vlan)# vlan 20
SW1-CORE(config-vlan)# name SALES_MARKETING
SW1-CORE(config-vlan)# vlan 999
SW1-CORE(config-vlan)# name ISOLATED_NATIVE_TRUNK
SW1-CORE(config-vlan)# exit

! --- Step 2: Configure 802.1Q Trunk Uplink ---
SW1-CORE(config)# interface GigabitEthernet0/1
SW1-CORE(config-if)# description UPLINK_TO_SW2
SW1-CORE(config-if)# switchport mode trunk
SW1-CORE(config-if)# switchport trunk native vlan 999
SW1-CORE(config-if)# switchport trunk allowed vlan 10,20,999
SW1-CORE(config-if)# end
```

#v(2pt)
#terminal-specimen(title: "SW1-CORE# show interfaces trunk")[
```text
Port        Mode             Encapsulation  Status        Native vlan
Gi0/1       on               802.1q         trunking      999

Port        Vlans allowed on trunk
Gi0/1       10,20,999

Port        Vlans in spanning tree forwarding state and not pruned
Gi0/1       10,20,999
```
]

#v(3pt)

== 7.6 Spanning Tree Protocol (STP 802.1D) & Root Bridge Election Math
Redundant Layer 2 links create physical loops. Without loop prevention, broadcast frames circulate endlessly, resulting in catastrophic *Broadcast Storms* and MAC Table Thrashing that crash switches within seconds:
- *The Bridge ID (BID) Structure (8 Bytes):*
  - *Bridge Priority (2 Bytes / 16 bits):* 4-bit Priority field (configured in increments of #hl[`4096`]; default `32768`) + 12-bit *System ID Extension* (equals the VLAN ID).
  - *Base MAC Address (6 Bytes):* The switch hardware backplane MAC address.
  - $ "Bridge ID" = "Priority (e.g. 32768)" + "VLAN ID (e.g. 10)" + "MAC Address" $
- *Root Bridge Election Rule:* The switch with the #hl[LOWEST Bridge ID] wins the election and becomes the Root Bridge for that VLAN!
  - Priority is evaluated first: `32768` (default) vs `4096` (tuned). Lower wins!
  - If priority is tied, the switch with the lowest numeric MAC address wins.
- *Root Bridge CLI Tuning:*
  `Switch(config)# spanning-tree vlan 10 root primary` (Sets priority to `24576` or 4096 below lowest current).
  `Switch(config)# spanning-tree vlan 10 priority 4096` (Manually forces lowest priority; industry best practice!).

#v(3pt)

== 7.7 STP Port Roles, Port States & Rapid PVST+ (802.1w)
After Root Bridge election, every non-root switch determines its port roles:
- *STP Port Roles:*
  - *Root Port (RP):* Exactly ONE port per non-root switch with the lowest cumulative Root Path Cost to the Root Bridge. Always forwards.
  - *Designated Port (DP):* Exactly ONE port per segment with the lowest path cost. Always forwards. (All ports on Root Bridge are DP!).
  - *Alternate / Blocking Port (AP):* Redundant loop-free standby port. Drops traffic to break loops; listens for BPDUs.
- *STP 802.1D vs RSTP 802.1w Comparison:*

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Feature*], [*Legacy STP (802.1D)*], [*Rapid STP (802.1w / PVST+)*], [*Engineering Significance*]),
  [Convergence Time], [30 to 50 seconds (slow)], [Under 1 to 2 seconds (subsecond)], [Prevents prolonged enterprise network outages.],
  [Port States], [Blocking $arrow$ Listening $arrow$ Learning $arrow$ Forwarding], [Discarding $arrow$ Learning $arrow$ Forwarding], [RSTP eliminates Listening state entirely.],
  [Mechanism], [Passive timer countdown (Forward Delay 15s)], [Active Proposal-Agreement Handshake], [Immediate sync between point-to-point switches.],
  [Cisco Default], [`spanning-tree mode pvst`], [`spanning-tree mode rapid-pvst`], [Rapid-PVST+ is standard on all modern Cisco switches.]
)

#v(3pt)

== 7.8 Hands-On Practical Lab: Spanning Tree Tuning, PortFast & BPDU Guard
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Tune Spanning Tree topology on 3-switch redundant ring. Elect SW1 as Root Bridge by configuring priority `4096`. Deploy PortFast and BPDU Guard on all edge workstation access ports to eliminate 30-second DHCP negotiation delays.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab05-stp-topology.svg", width: 88%)
#v(2pt)

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Catalyst Switch STP Root & PortFast Configuration:]
```cisco
! --- SW1: Force Root Bridge Election ---
SW1-CORE(config)# spanning-tree mode rapid-pvst
SW1-CORE(config)# spanning-tree vlan 1,10,20 priority 4096

! --- SW2 / SW3: Deploy PortFast & BPDU Guard on Access Ports ---
SW2-ACCESS(config)# interface range FastEthernet0/1 - 24
SW2-ACCESS(config-if-range)# switchport mode access
SW2-ACCESS(config-if-range)# spanning-tree portfast
SW2-ACCESS(config-if-range)# spanning-tree bpduguard enable
SW2-ACCESS(config-if-range)# end
```

#v(2pt)
#terminal-specimen(title: "SW1-CORE# show spanning-tree vlan 10")[
```text
VLAN0010
  Spanning tree enabled protocol rstp
  Root ID    Priority    4106 (Priority 4096 + sys-id-ext 10)
             Address     0001.42a1.1100
             This bridge is the root
             Hello Time   2 sec  Max Age 20 sec  Forward Delay 15 sec

  Bridge ID  Priority    4106 (Priority 4096 + sys-id-ext 10)
             Address     0001.42a1.1100

Interface           Role Sts Cost      Prio.Nbr Type
------------------- ---- --- --------- -------- --------------------------------
Gi0/1               Desg FWD 4         128.1    P2p
Gi0/2               Desg FWD 4         128.2    P2p
```
]

#v(3pt)

== 7.9 EtherChannel (Link Aggregation - 802.3ad)
EtherChannel bundles up to 8 active parallel Ethernet links into a single logical channel (`Port-channel 1`), multiplying bandwidth and preventing STP from blocking redundant uplinks:
- *Negotiation Protocols:*
  - *LACP (Link Aggregation Control Protocol - IEEE 802.3ad):* Open standard. Modes: `active` (initiates) and `passive` (listens).
  - *PAgP (Port Aggregation Protocol - Cisco Proprietary):* Modes: `desirable` (initiates) and `auto` (listens).
  - *Static:* `mode on` (no protocol negotiation; prone to misconfigurations).
- *Cisco CLI:*
  `Switch(config)# interface range Gi0/1 - 2 ; channel-group 1 mode active`
  `Switch(config)# interface port-channel 1 ; switchport mode trunk`

#v(3pt)

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What is the danger of enabling PortFast on a trunk link between switches?", a: "PortFast bypasses the standard listening and learning STP states, immediately transitioning the interface to Forwarding. If enabled on a link connected to another switch, an instantaneous Layer 2 loop and broadcast storm will crash the entire LAN!")
#faq-item(q: "Why does BPDU Guard shut down a port if it receives a BPDU?", a: "Access ports with PortFast are designated strictly for end-user workstations. If a BPDU frame arrives, it proves someone plugged an unauthorized switch or rogue router into the wall jack. BPDU Guard immediately err-disables the port to preserve topology stability.")
#faq-item(q: "Why are STP priorities configured in increments of 4096?", a: "The 16-bit Priority field is divided into a 4-bit Bridge Priority and a 12-bit System ID Extension (VLAN ID). The 4 most significant bits represent $2^{12} = 4096$, meaning valid priority values are 0, 4096, 8192, 12288, up to 61440.")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "What is the default aging timer for an entry in a Cisco switch CAM table?", ans: "300 seconds (5 minutes).")
#short-q(num: 2, q: "Where is the normal-range VLAN database stored in Cisco Catalyst switches?", ans: "flash:vlan.dat (in non-volatile flash memory).")
#short-q(num: 3, q: "What is the standard IEEE protocol number for VLAN Trunking encapsulation?", ans: "IEEE 802.1Q (commonly referred to as dot1Q).")
#short-q(num: 4, q: "Which port security violation mode drops unauthorized frames, generates a Syslog message, but does NOT shut down the port?", ans: "Restrict mode.")
#short-q(num: 5, q: "What is the IEEE open standard protocol for dynamic link aggregation / EtherChannel?", ans: "IEEE 802.3ad / 802.1AX (LACP - Link Aggregation Control Protocol).")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "What action does a switch take when receiving a frame with an unknown destination unicast MAC address?", a: "Drops the frame immediately", b: "Floods the frame out all ports within the same VLAN except the receiving port", c: "Sends an ICMP Redirect message", d: "Stores the frame in NVRAM until resolved", ans: "B", expl: "Unknown unicast frames are flooded to all ports in the source VLAN to locate the destination host via ARP.")
#mcq(num: 2, q: "Which command assigns a switchport to VLAN 20 and configures it for end-user connection?", a: "switchport mode trunk ; switchport access vlan 20", b: "switchport mode access ; switchport access vlan 20", c: "vlan 20 access-mode", d: "switchport trunk native vlan 20", ans: "B", expl: "An access port is configured using switchport mode access, followed by switchport access vlan <id>.")
#mcq(num: 3, q: "In Spanning Tree Protocol (STP), what two components compose the 8-byte Bridge ID (BID)?", a: "IP Address and Port Number", b: "2-byte Priority (including System ID Extension) and 6-byte Base MAC Address", c: "Serial Number and Hostname", d: "Root Path Cost and Hello Timer", ans: "B", expl: "The BID consists of a 2-byte Priority field (4-bit priority + 12-bit VLAN extension) and the switch's 6-byte hardware MAC address.")
#mcq(num: 4, q: "What state will an access port transition to if BPDU Guard is enabled and a BPDU is received?", a: "Listening", b: "Blocking", c: "err-disabled (Secure-down)", d: "Forwarding", ans: "C", expl: "BPDU Guard err-disables the interface to prevent unauthorized switches from injecting BPDUs into access ports.")
#mcq(num: 5, q: "Which pair of PAgP modes will successfully negotiate an active EtherChannel bundle?", a: "auto and auto", b: "desirable and auto", c: "passive and active", d: "on and auto", ans: "B", expl: "In PAgP, at least one side must be in 'desirable' mode to initiate negotiation. 'passive and active' is LACP syntax.")

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The VLAN 1 Security Vulnerability")[
      Factory-default VLAN 1 cannot be deleted. Best-practice hardening requires moving all user traffic to other VLANs (10, 20) and setting native VLAN to an unused ID (999)!
    ]
  ],
  [
    #tech-spotlight-box(title: "VXLAN in Modern Data Centers")[
      Modern hyperscale clouds replace legacy 4,096 VLAN limits with VXLAN (Virtual Extensible LAN), encapsulating Layer 2 frames in Layer 3 UDP to support 16 million network segments!
    ]
  ]
)
