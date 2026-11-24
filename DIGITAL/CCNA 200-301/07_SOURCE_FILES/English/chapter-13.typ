#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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
