#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 03 · IPV4 ADDRESSING & VLSM SUBNETTING]
= Chapter 3: IPv4 Addressing, VLSM Subnetting & Design Mastery

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  32-bit IPv4 structure, binary-to-decimal conversion, classful vs classless CIDR, RFC 1918 private scopes, Magic Number formula, instant /24 to /30 reference table, and five step-by-step enterprise VLSM design scenarios.
]

#v(2pt)

== 3.1 32-Bit IPv4 Header & Addressing Architecture
An IPv4 address is a 32-bit binary number represented as four 8-bit octets in dotted-decimal format (e.g., `192.168.10.1`). Every IP address contains two components:
- *Network Portion:* Identifies the specific IP network/subnet. Defined by the subnet mask.
- *Host Portion:* Identifies the unique endpoint device interface on that network.
- *Subnet Mask:* A continuous sequence of binary 1s (network bits) followed by binary 0s (host bits). An IP address without a subnet mask is mathematically meaningless.

#v(2pt)

== 3.2 Legacy Classful IP Architecture vs CIDR
Historical RFC 791 classified addresses into five rigid categories before Classless Inter-Domain Routing (CIDR, RFC 1519) eliminated class boundaries:
- *Class A (0 – 127):* Default `/8` mask (`255.0.0.0`). 16,777,214 hosts per network. (`127.0.0.0/8` reserved for loopback testing).
- *Class B (128 – 191):* Default `/16` mask (`255.255.0.0`). 65,534 hosts per network.
- *Class C (192 – 223):* Default `/24` mask (`255.255.255.0`). 254 hosts per network.
- *Class D (224 – 239):* Reserved for Multicast groups (no subnet mask, no individual host assignment).
- *Class E (240 – 255):* Experimental and research reserve.
- *RFC 1918 Private Ranges:* Non-routable on the public Internet: `10.0.0.0/8`, `172.16.0.0/12` (`172.16.0.0` to `172.31.255.255`), and `192.168.0.0/16`.
- *APIPA (Automatic Private IP Addressing):* `169.254.0.0/16` self-assigned when DHCP fails.

#v(2pt)

== 3.3 The Magic Number Subnetting Method
To subnet instantly in under 15 seconds during exams and production outages, use the #hl[Magic Number Formula]:
1. Identify the *Interesting Octet* (the octet where the subnet mask is neither `255` nor `0`).
2. Calculate the *Magic Number (Block Size):* $text("Magic Number") = 256 - text("Subnet Mask Value in that Octet")$.
3. Multiples of this Magic Number determine all valid Network IDs ($0, M, 2M, 3M, dots$).
4. Broadcast Address is strictly $(text("Next Network ID") - 1)$.
5. Usable Host Range spans $(text("Network ID") + 1)$ to $(text("Broadcast Address") - 1)$.
6. Maximum Usable Hosts formula: $2^H - 2$, where $H$ is the number of host bits (binary 0s).

#pagebreak()

== 3.4 Instant /24 to /30 Quick Reference Matrix
#table(
  columns: (1fr, 1.8fr, 1.1fr, 1.4fr, 1.7fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  table.header([*CIDR*], [*Subnet Mask*], [*Block Size*], [*Usable Hosts*], [*Primary Production Application*]),
  [/24], [255.255.255.0], [256], [254 hosts], [Standard branch office LAN / user access segment],
  [/25], [255.255.255.128], [128], [126 hosts], [Subdivided building floor / medium department],
  [/26], [255.255.255.192], [64], [62 hosts], [Server cluster / development engineering pool],
  [/27], [255.255.255.224], [32], [30 hosts], [Executive management / VoIP phone subnet],
  [/28], [255.255.255.240], [16], [14 hosts], [DMZ public web/mail proxy tier],
  [/29], [255.255.255.248], [8], [6 hosts], [Firewall active/standby failover & HA sync],
  [/30], [255.255.255.252], [4], [2 hosts], [Dedicated point-to-point router serial/WAN link]
)

#v(2pt)

== 3.5 Step-by-Step Enterprise VLSM Design Scenario
*Scenario:* An enterprise network architect is allocated the private block #hl[`172.16.0.0/22`] (1,024 total addresses) and must design subnets for 4 requirements:
1. *Engineering HQ:* Requires 220 usable host addresses.
2. *Sales & Marketing:* Requires 110 usable host addresses.
3. *Customer Support:* Requires 50 usable host addresses.
4. *WAN Inter-Router Links:* Requires 4 point-to-point links (2 hosts each).

#v(2pt)

*Execution Rule: Always allocate from largest host requirement to smallest.*
- *Step 1: Engineering HQ (220 hosts).* Formula: $2^H - 2 >= 220$. For $H=8$, $2^8 - 2 = 254$. Subnet mask: $32 - 8 = bold("/24")$ (`255.255.255.0`).
  - Network ID: `172.16.0.0/24` | Usable: `172.16.0.1` – `172.16.0.254` | Broadcast: `172.16.0.255`.
- *Step 2: Sales & Marketing (110 hosts).* Formula: $2^H - 2 >= 110$. For $H=7$, $2^7 - 2 = 126$. Subnet mask: $32 - 7 = bold("/25")$ (`255.255.255.128`).
  - Next available: `172.16.1.0/25` | Usable: `172.16.1.1` – `172.16.1.126` | Broadcast: `172.16.1.127`.
- *Step 3: Customer Support (50 hosts).* Formula: $2^H - 2 >= 50$. For $H=6$, $2^6 - 2 = 62$. Subnet mask: $32 - 6 = bold("/26")$ (`255.255.255.192`).
  - Next available: `172.16.1.128/26` | Usable: `172.16.1.129` – `172.16.1.190` | Broadcast: `172.16.1.191`.
- *Step 4: WAN Links (2 hosts each).* Formula: $2^H - 2 = 2$. For $H=2$, $2^2 - 2 = 2$. Subnet mask: $32 - 2 = bold("/30")$ (`255.255.255.252`).
  - WAN 1: `172.16.1.192/30` (`172.16.1.193` – `172.16.1.194`, Broadcast: `.195`)
  - WAN 2: `172.16.1.196/30` (`172.16.1.197` – `172.16.1.198`, Broadcast: `.199`)
  - WAN 3: `172.16.1.200/30` (`172.16.1.201` – `172.16.1.202`, Broadcast: `.203`)
  - WAN 4: `172.16.1.204/30` (`172.16.1.205` – `172.16.1.206`, Broadcast: `.207`)

#pagebreak()

== Student Technical FAQs
#faq-box("Why do we subtract 2 in the usable host formula (2^H - 2)?", "The very first address where all host bits are zero represents the Network ID. The final address where all host bits are binary 1s is the Directed Broadcast Address. Neither can ever be assigned to an end host interface.")
#faq-box("Can /31 subnets be used on point-to-point links?", "Yes, RFC 3021 permits /31 subnets (mask 255.255.255.254, 2 total addresses) exclusively on point-to-point links where broadcast is unnecessary, conserving IP space in massive enterprise backbones.")
#faq-box("What is the difference between classful subnetting and VLSM?", "Classful subnetting enforces the exact same subnet mask across every subnet, causing severe address waste. VLSM (Variable Length Subnet Masking) allows different subnets within the same major network to use customized masks tailored to exact host requirements.")

#v(2pt)

== Short-Answer Technical Review
1. *Determine the valid host range for the subnet containing 192.168.5.85/28:* Subnet mask `/28` has block size $256 - 240 = 16$. Multiples: $0, 16, 32, 48, 64, bold(80), 96$. Network ID is `192.168.5.80/28`. Usable host range: `192.168.5.81` to `192.168.5.94`. Broadcast: `192.168.5.95`.
2. *State the RFC 1918 private address ranges:* `10.0.0.0/8`, `172.16.0.0/12`, and `192.168.0.0/16`.
3. *Identify the default subnet mask for an unsubnetted Class B address:* `255.255.0.0` (`/16`).
4. *Calculate the wildcard mask corresponding to subnet mask 255.255.255.224:* Invert each octet from 255: $255.255.255.255 - 255.255.255.224 = bold(0.0.0.31)$.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer must subnet 10.50.0.0/16 to support at least 500 hosts per subnet while maximizing the number of subnets. Which CIDR prefix should be chosen?",
  ("/22", "/23", "/24", "/25"),
  1,
  "Formula: 2^H - 2 >= 500. For H=9: 2^9 - 2 = 510 hosts. Prefix length = 32 - 9 = /23 (mask 255.255.254.0)."
)

#mcq-item(
  "Which IP address is a valid usable host address within the 172.20.32.0/20 network?",
  ("172.20.32.0", "172.20.47.255", "172.20.40.100", "172.20.48.1"),
  2,
  "/20 has block size 16 in the 3rd octet. Subnet range: 172.20.32.0 to 172.20.47.255. 172.20.40.100 is valid within this usable range."
)

#mcq-item(
  "A host with IP 169.254.10.20 cannot reach the Internet. What is the root cause?",
  ("DNS misconfiguration", "APIPA auto-assignment due to DHCP failure", "Duplicate IP conflict", "Default gateway ACL drop"),
  1,
  "169.254.0.0/16 is APIPA. When a host fails to receive a DHCP Offer, it self-assigns an APIPA address and cannot route beyond the local link."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The \$50 Billion IPv4 Address Exhaustion", "IANA officially allocated its last IPv4 /8 blocks in February 2011. Today, clean /24 IPv4 address blocks trade on commercial broker markets for over \$55 per individual IP address, driving aggressive IPv6 migration.")

#spotlight-box("2027 Tech Spotlight: AI-Driven Automated IPAM Systems", "Modern cloud-native enterprises manage millions of dynamic container IP endpoints using Infoblox and NetBox IPAM integrated with Kubernetes CNI (Container Network Interface) plugins to automate zero-collision subnet provisioning.")
