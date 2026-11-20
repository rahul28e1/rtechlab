#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 07 · LAYER 2 SWITCHING & PORT SECURITY]
= Chapter 7: Layer 2 Switching, CAM Tables & Port Security Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Layer 2 frame forwarding logic, Content Addressable Memory (CAM) table mechanics, MAC flooding vulnerabilities, and enterprise switchport port-security configuration with violation recovery.
]

#v(2pt)

== 7.1 Layer 2 Transparent Bridging & Switch Logic
Ethernet switches forward frames based on 48-bit MAC addresses. A switch executes four foundational operations:
- *1. Learn (Source MAC):* When an Ethernet frame enters a switch port, the switch inspects the #hl[Source MAC Address]. If not present in its CAM table, it records the MAC address, interface port, and VLAN with a 300-second aging timer.
- *2. Forward (Known Unicast Destination):* The switch inspects the #hl[Destination MAC Address]. If found in the CAM table, it transmits the frame strictly out that single associated port.
- *3. Filter:* If the destination MAC resides on the same port segment that originated the frame, the switch silently discards it, preventing unnecessary link congestion.
- *4. Flood (Unknown Unicast, Multicast, Broadcast):* If the destination MAC is not in the CAM table, or is a broadcast (`FF:FF:FF:FF:FF:FF`), the switch #hl[floods the frame out all ports belonging to that VLAN except the incoming port].

#v(2pt)

== 7.2 CAM Table Architecture & MAC Address Table Aging
The Content Addressable Memory (CAM) table allows 1-clock-cycle hardware lookup. The default aging timer for inactive dynamic MAC entries in Cisco IOS is #hl[300 seconds (5 minutes)].
#terminal-box([
```cisco
Switch# show mac address-table
          Mac Address Table
-------------------------------------------
Vlan    Mac Address       Type        Ports
----    -----------       --------    -----
  10    001b.782a.8c11    DYNAMIC     Gi0/1
  10    001b.782a.8c22    DYNAMIC     Gi0/2
Total Mac Addresses for this module: 2
```
])

#v(2pt)

#grid(
  columns: (1fr, 1.3fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 7.1: Production Enterprise Gigabit Access Switch.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab02-port-security-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 7.2: Lab 02 — Switchport Port Security Topology.]
  ]
)

#pagebreak()

== 7.3 Layer 2 Attacks: MAC Flooding & CAM Table Exhaustion
In a *CAM Table Overflow Attack*, an attacker floods the switch with tens of thousands of bogus, randomized source MAC addresses per second (using tools like `macof`).
- *Consequence:* The switch CAM table fills to capacity. Unable to learn new addresses, the switch falls back to behaving like a legacy hub, #hl[flooding all incoming frames out every port]. The attacker can then capture sensitive traffic using a packet sniffer.
- *Defense:* Implement #hl[Switchport Port Security] to restrict the number of learned MAC addresses per interface.

#v(2pt)

== 7.4 Switchport Port Security Complete CLI Implementation
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Violation Mode*], [*Frame Forwarding*], [*Violation Counter*], [*Syslog / SNMP Trap & Status*]),
  [`Protect`], [Drops unauthorized frames], [Does not increment], [No alerts generated. Port remains UP.],
  [`Restrict`], [Drops unauthorized frames], [Increments counter], [Generates Syslog & SNMP trap. Port remains UP.],
  [`Shutdown` (Default)], [Drops all traffic], [Increments counter], [Generates Syslog. Immediately disables port into `err-disabled`.]
)

#v(2pt)

#terminal-box([
```cisco
Switch(config)# interface GigabitEthernet0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport port-security
Switch(config-if)# switchport port-security maximum 2
Switch(config-if)# switchport port-security mac-address sticky
Switch(config-if)# switchport port-security violation restrict
Switch(config-if)# exit
! Global Automated Err-Disable Recovery:
Switch(config)# errdisable recovery cause psecure-violation
Switch(config)# errdisable recovery interval 30
```
])

#v(2pt)

== 7.5 Port Security Verification & Troubleshooting
#terminal-box([
```cisco
Switch# show port-security interface GigabitEthernet0/1
Port Security              : Enabled
Port Status                : Secure-up
Violation Mode             : Restrict
Aging Time                 : 0 mins
Secure MACAddress-Max(Count) : 2
Security Violation Count   : 0
Sticky MAC Addresses       : 1
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("Why must 'switchport mode access' be entered before enabling port security?", "By default, Cisco switch ports operate in dynamic desirable or dynamic auto DTP mode. Port security is only supported on static access or static trunk ports; attempting to enable it on dynamic ports triggers an IOS syntax error.")
#faq-box("What is the advantage of 'mac-address sticky' over static MAC configuration?", "'sticky' allows the switch to automatically learn the connected device's MAC address from the first frame received and instantly write it into running-config, saving hours of manual MAC entry.")
#faq-box("How do you recover an interface in 'err-disabled' state without automated recovery?", "An engineer must manually enter the interface configuration submode and issue 'shutdown' followed by 'no shutdown'.")

#v(2pt)

== Short-Answer Technical Review
1. *State the default violation mode for Cisco port security:* `Shutdown`.
2. *Identify the aging timer for dynamic CAM table entries in Cisco IOS:* 300 seconds (5 minutes).
3. *Explain the operational difference between Restrict and Protect violation modes:* Both drop unauthorized frames, but Restrict increments the violation counter and sends Syslog/SNMP traps, whereas Protect drops frames silently.
4. *What command enables automatic recovery for interfaces disabled by port security violations?* `errdisable recovery cause psecure-violation`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "A switch port configured with port security encounters a violation. The port immediately turns amber and its status shows 'err-disabled'. Which violation mode is active?",
  ("Protect", "Restrict", "Shutdown", "Monitor"),
  2,
  "Shutdown mode immediately places the port into an err-disabled state upon security violation."
)

#mcq-item(
  "Which command automatically saves dynamically learned MAC addresses directly into the running configuration?",
  ("switchport port-security mac-address dynamic", "switchport port-security mac-address sticky", "switchport mac-address-table permanent", "switchport security learn auto"),
  1,
  "'mac-address sticky' converts dynamic MAC learning into persistent configuration entries."
)

#mcq-item(
  "What type of network attack is directly mitigated by enabling switchport port-security with a maximum of 2 MAC addresses?",
  ("ARP Poisoning", "CAM Table Flooding / Overflow", "DHCP Starvation", "VLAN Hopping"),
  1,
  "Port security prevents attackers from flooding thousands of random MAC addresses to overflow the switch CAM table."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? TCAM vs CAM Tables", "Standard CAM tables look up exact binary matches (0 or 1) for Layer 2 MAC addresses. Ternary CAM (TCAM) evaluates a third state: 'Don't Care' (X). TCAM allows Layer 3 switches to evaluate complex ACL rules and subnet masks in a single clock cycle.")

#spotlight-box("2027 Tech Spotlight: 802.1X Dynamic VLAN Assignment & Cisco ISE", "Static port security is being superseded in modern zero-trust campuses by IEEE 802.1X Network Access Control. When a user authenticates via Cisco Identity Services Engine (ISE), the switch dynamically assigns the port to that user's specific role-based VLAN.")
