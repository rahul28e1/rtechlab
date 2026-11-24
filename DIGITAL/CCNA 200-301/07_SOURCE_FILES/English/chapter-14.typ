#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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
