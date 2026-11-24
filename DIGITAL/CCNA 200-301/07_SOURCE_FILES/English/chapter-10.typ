#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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
