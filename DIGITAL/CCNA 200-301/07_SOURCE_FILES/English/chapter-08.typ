#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
