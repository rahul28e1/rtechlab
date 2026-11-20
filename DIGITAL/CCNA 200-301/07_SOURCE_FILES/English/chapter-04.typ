#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 04 · IPV6 ARCHITECTURE & TRANSITION]
= Chapter 4: IPv6 Complete Architecture, EUI-64 & Transition

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  128-bit IPv6 address structure, hexadecimal compression rules, address scopes (Global Unicast, Link-Local, Unique Local, Multicast), Modified EUI-64 math, Neighbor Discovery Protocol (NDP), SLAAC vs DHCPv6, and dual-stack CLI configuration.
]

#v(2pt)

== 4.1 The 128-Bit IPv6 Architecture
IPv6 expands the address space from IPv4's $2^{32}$ (4.3 billion) to an astronomical #hl[$2^{128}$ (approx. $3.4 times 10^{38}$ addresses)]. An IPv6 address is represented as eight 16-bit blocks called *hextets* separated by colons, written in hexadecimal notation:
`2001:0db8:85a3:0000:0000:8a2e:0370:7334`

#v(2pt)

== 4.2 Two Mandatory Hexadecimal Compression Rules
RFC 4291 mandates two rules to simplify long IPv6 strings:
- *Rule 1: Omission of Leading Zeros:* Within any individual 16-bit hextet, leading zeros may be omitted. Trailing zeros #hl[cannot] be omitted (`:0042:` becomes `:42:`, but `:4200:` remains `:4200:`).
- *Rule 2: Double Colon Compression (::):* A single contiguous sequence of one or more all-zero hextets can be replaced with a double colon `::`. #hl[This rule can only be applied ONCE per address] to prevent ambiguity during expansion.
- *Compression Example:*
  - Original: `2001:0db8:0000:0000:0000:0000:0000:0001`
  - Rule 1 (Omit leading zeros): `2001:db8:0:0:0:0:0:1`
  - Rule 2 (Double colon): #hl[`2001:db8::1`]

#v(2pt)

== 4.3 IPv6 Address Types & Scopes
Unlike IPv4, #hl[IPv6 has no broadcast addresses]. All broadcast functionality is replaced by targeted Multicast:
#table(
  columns: (1.4fr, 1.3fr, 3.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Address Type*], [*Prefix / Range*], [*Scope & Operational Characteristics*]),
  [Global Unicast (GUA)], [`2000::/3`], [Globally routable public Internet addresses assigned by RIRs. Standard format: /48 Global Routing Prefix + /16 Subnet ID + /64 Interface ID.],
  [Link-Local (LLA)], [`fe80::/10`], [Non-routable mandatory local-link addresses (`fe80::` to `febf::`). Used for routing protocol peering (OSPFv3, BGP) and default gateway identification.],
  [Unique Local (ULA)], [`fc00::/7` (`fd00::/8`)], [Private routable addresses within enterprise intranet. Equivalent of IPv4 RFC 1918. Not routable on the public Internet.],
  [Multicast], [`ff00::/8`], [One-to-many communication. `ff02::1` = All Nodes, `ff02::2` = All Routers, `ff02::5` = OSPFv3 Routers, `ff02::6` = OSPFv3 DR/BDR.],
  [Loopback], [`::1/128`], [Internal testing address (equivalent to IPv4 `127.0.0.1`).],
  [Unspecified], [`::/128`], [Source address used before obtaining an address during initialization.]
)

#pagebreak()

== 4.4 Modified EUI-64 Host Identifier Calculation
The 64-bit Interface ID can be automatically derived from the device's 48-bit MAC address using #hl[Modified EUI-64]:
- *Step 1:* Split the 48-bit MAC address into two equal 24-bit halves (OUI and NIC identifier).
- *Step 2:* Insert the 16-bit hex value #hl[`FF-FE`] directly between the two halves, forming 64 bits.
- *Step 3:* #hl[Invert the 7th bit (Universal/Local bit)] of the first byte (if 0, make it 1; if 1, make it 0).
- *Worked Example:*
  - Given MAC Address: `00:1B:78:2A:8C:11`
  - First Byte in Binary: `00` hex = `0000 0000` binary.
  - Invert 7th Bit: `0000 0010` binary = `02` hex.
  - Insert `FFFE`: Resulting EUI-64 Interface ID = #hl[`021B:78FF:FE2A:8C11`].
  - Link-Local Address: `fe80::21b:78ff:fe2a:8c11`.

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab12-ipv6-routing-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 4.1: Enterprise IPv6 Dual-Stack & OSPFv3 Lab Topology.]
]

#v(2pt)

== 4.5 SLAAC vs DHCPv6 & Neighbor Discovery Protocol (NDP)
IPv6 replaces ARP with the #hl[Neighbor Discovery Protocol (NDP)], operating via ICMPv6:
- *Router Solicitation (RS - Type 133):* Host multicasts to `ff02::2` requesting network prefix.
- *Router Advertisement (RA - Type 134):* Router periodically multicasts prefix information to `ff02::1`.
- *Neighbor Solicitation (NS - Type 135) & Neighbor Advertisement (NA - Type 136):* Replaces IPv4 ARP.
- *SLAAC (Stateless Address Autoconfiguration):* Host generates its own IP using the prefix from RA + EUI-64/Random 64-bit ID. No state kept on router.
- *Stateful DHCPv6:* Central DHCPv6 server leases full IPv6 address and DNS server settings.

#v(2pt)

== 4.6 Cisco IOS IPv6 CLI Configuration
#terminal-box([
```cisco
Router(config)# ipv6 unicast-routing
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ipv6 address 2001:db8:acad:1::1/64
Router(config-if)# ipv6 address fe80::1 link-local
Router(config-if)# no shutdown
Router(config)# ipv6 route ::/0 GigabitEthernet0/0/1 2001:db8:acad:99::2
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("Why must 'ipv6 unicast-routing' be entered first on Cisco routers?", "By default, Cisco IOS routers act as IPv6 hosts and will not forward IPv6 packets between interfaces or send Router Advertisements (RAs) until 'ipv6 unicast-routing' is globally enabled.")
#faq-box("Why does IPv6 eliminate the Broadcast address completely?", "Broadcasts interrupt every single device on the local network to process the frame in software. IPv6 replaces broadcasts with Solicited-Node Multicasts, so only devices subscribed to that specific multicast group process the packet.")
#faq-box("Why is the 7th bit inverted in EUI-64 calculation?", "In standard IEEE 48-bit MAC addresses, the 7th bit set to 0 indicates globally unique hardware. In EUI-64, setting bit 7 to 1 signifies universal administrative scope, matching Internet engineering conventions.")

#v(2pt)

== Short-Answer Technical Review
1. *Compress the following IPv6 address to its shortest legal format: 2001:0000:0000:0ab0:0000:0000:0000:0001:* `2001:0:0:ab0::1` (Rule 2 can only be applied once; compressing the rightmost three zero hextets yields the shortest legal string).
2. *Identify the IPv6 address scope corresponding to fe80::/10:* Link-Local Unicast address.
3. *State the two ICMPv6 messages utilized by SLAAC:* Router Solicitation (RS, Type 133) and Router Advertisement (RA, Type 134).
4. *Calculate the EUI-64 Interface ID for MAC address 50:06:04:12:34:56:* First byte `50` (`0101 0000`) with 7th bit inverted = `52` (`0101 0010`). Insert FFFE = `5206:04FF:FE12:3456`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "Which IPv6 address represents the equivalent of the IPv4 default route 0.0.0.0 0.0.0.0?",
  ("::1/128", "::/0", "fe80::/10", "ff02::1/128"),
  1,
  "::/0 specifies all zeros prefix length 0, representing the IPv6 default route (Gateway of Last Resort)."
)

#mcq-item(
  "What is the Solicited-Node Multicast prefix used by IPv6 Neighbor Discovery?",
  ("ff02::1", "ff02::2", "ff02::1:ff00:0/104", "fe80::/10"),
  2,
  "Solicited-Node Multicast addresses take the prefix ff02::1:ff00:0/104 combined with the low-order 24 bits of the target IPv6 address."
)

#mcq-item(
  "An engineer configures an IPv6 interface. Which type of address is automatically generated even if no static address or DHCP server is configured?",
  ("Global Unicast Address", "Unique Local Address", "Link-Local Address", "Anycast Address"),
  2,
  "As soon as IPv6 is enabled on an interface, Cisco IOS automatically generates a Link-Local address (fe80::/10) using EUI-64."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The Scale of the IPv6 Address Space", "With 2^128 addresses, IPv6 can allocate over 667 quadrillion addresses for every square millimeter of the Earth's surface, ensuring humans will never exhaust addresses even with trillions of IoT sensors.")

#spotlight-box("2027 Tech Spotlight: SRv6 (Segment Routing over IPv6)", "Modern telecom carriers and hyperscale clouds are replacing complex MPLS networks with Segment Routing over IPv6 (SRv6). Network paths, traffic engineering policies, and security firewalls are encoded directly into the IPv6 packet header extension.")
