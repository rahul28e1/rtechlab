#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 03 · IPV4 ADDRESSING & SUBNETTING]
= Chapter 3: IPv4 Masterclass, Subnetting & VLSM Cheat Sheet

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Mastery of IPv4 32-bit addressing: binary-to-decimal math, Classful architecture (A, B, C, D, E), RFC 1918 Private IP ranges, CIDR slash notation, the 256 Magic Number calculation formula, the instant /24 to /30 subnetting cheat sheet, and 5 step-by-step solved VLSM enterprise scenarios.
]

#v(2pt)

== 3.1 IPv4 32-Bit Structure & Classful Architecture
An IPv4 address consists of #hl[32 binary bits divided into four 8-bit octets], separated by periods (dotted-decimal notation, e.g., `192.168.1.1`).
- *Total Address Space:* $2^{32} = 4,294,967,296$ unique theoretical IP addresses.
- *Octet Binary Weightings (8-Bit Radix):* 128 · 64 · 32 · 16 · 8 · 4 · 2 · 1. Any decimal number 0 to 255 is formed by summing active bit values (e.g., $192 = 128 + 64$; $168 = 128 + 32 + 8$).
- *Historical Classful Boundaries:*
  - *Class A (1 to 126):* Default Mask `255.0.0.0` (/8). 126 Networks, $16,777,214$ hosts per net.
  - *Class B (128 to 191):* Default Mask `255.255.0.0` (/16). 16,384 Networks, 65,534 hosts per net.
  - *Class C (192 to 223):* Default Mask `255.255.255.0` (/24). 2,097,152 Networks, 254 hosts per net.
  - *Class D (224 to 239):* Reserved for Multicast (no host subnet masks).
  - *Class E (240 to 255):* Reserved for Experimental / Research purposes.

#v(2pt)

== 3.2 RFC 1918 Private IP Ranges & Special Reserved Addresses
#table(
  columns: (1fr, 1.4fr, 1.2fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Class*], [*RFC 1918 Private Address Block*], [*CIDR Prefix*], [*Enterprise Application*]),
  [Class A], [`10.0.0.0` – `10.255.255.255`], [`10.0.0.0/8`], [Large corporate enterprise networks, datacenter VPCs (16.7M IPs).],
  [Class B], [`172.16.0.0` – `172.31.255.255`], [`172.16.0.0/12`], [Mid-sized enterprise branches, university campuses (1M IPs).],
  [Class C], [`192.168.0.0` – `192.168.255.255`], [`192.168.0.0/16`], [SOHO, home Wi-Fi routers, small branch offices (65K IPs).],
  [Loopback], [`127.0.0.1` – `127.255.255.254`], [`127.0.0.0/8`], [Internal host TCP/IP stack diagnostic testing.],
  [APIPA], [`169.254.0.1` – `169.254.255.254`], [`169.254.0.0/16`], [Auto-assigned when host fails to reach DHCP server (Link-Local).]
)

#v(2pt)

== 3.3 CIDR Notation & Subnet Mask Bit Mechanics
In 1993, RFC 1519 introduced *Classless Inter-Domain Routing (CIDR)* to halt address exhaustion:
- *Subnet Mask:* A 32-bit string of continuous binary `1`s followed by continuous `0`s. Binary `1`s identify the #hl[Network ID bits]; binary `0`s identify the #hl[Host ID bits].
- *The ANDing Process:* Routers determine if a destination IP is local or remote by performing a bitwise Boolean AND between the destination IP and the subnet mask ($1 text("AND") 1 = 1$; any $text("AND") 0 = 0$).
- *Host Formula:* $text("Usable Hosts") = 2^H - 2$ (where $H$ is the number of Host bits `0`). The subtraction of 2 accounts for the *Network ID* (all host bits 0) and the *Directed Broadcast Address* (all host bits 1).

#pagebreak()

== 3.4 The RTechLab "Magic Number" Subnetting Formula
Subnetting can be solved mentally in under 10 seconds without converting to binary using the #hl[Magic Number rule]:
- *Step 1: Identify the Interesting Octet.* Look at the subnet mask. The octet that contains a number other than `255` or `0` is the *Interesting Octet*. (For `/24` to `/30`, the interesting octet is the 4th octet).
- *Step 2: Calculate the Magic Number (Block Size):*
  $ "Magic Number" = 256 - "Interesting Octet Value" $
- *Step 3: Multiples of Magic Number.* Subnet Network IDs always start at `0` and increment by the Magic Number: $0, M, 2M, 3M, dots$
- *Step 4: Determine Boundaries.* For any given subnet:
  - *Network ID:* The multiple of $M$ that is less than or equal to the host IP.
  - *Next Subnet Network ID:* The subsequent multiple of $M$.
  - *Broadcast Address:* One less than the next subnet Network ID.
  - *Usable Host Range:* From `Network ID + 1` to `Broadcast ID - 1`.

#v(2pt)

== 3.5 The CCNA Master Subnetting Cheat Sheet (/24 to /30)
#table(
  columns: (0.7fr, 1.4fr, 0.9fr, 1fr, 1.1fr, 1fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*CIDR*], [*Subnet Mask*], [*Magic No*], [*Total IPs*], [*Usable Hosts*], [*Application*]),
  [/24], [`255.255.255.0`], [256], [256], [254], [Standard LAN subnet],
  [/25], [`255.255.255.128`], [128], [128], [126], [Mid-sized department],
  [/26], [`255.255.255.192`], [64], [64], [62], [Branch office floor],
  [/27], [`255.255.255.224`], [32], [32], [30], [Server farm / DMZ],
  [/28], [`255.255.255.240`], [16], [16], [14], [Management VLAN],
  [/29], [`255.255.255.248`], [8], [8], [6], [Public WAN gateway pool],
  [/30], [`255.255.255.252`], [4], [4], [#hl[2]], [Point-to-Point WAN link],
  [/31], [`255.255.255.254`], [2], [2], [2 (RFC 3021)], [P2P Links (No broadcast)],
  [/32], [`255.255.255.255`], [1], [1], [1 (Host)], [Router Loopback interface]
)

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg",
  caption: "Figure 3.1: Enterprise Managed Switch terminating multiple routed /24 and /27 VLAN subnets.",
  height: 52pt
)

#v(2pt)

== 3.6 Variable Length Subnet Masking (VLSM) Strategy
VLSM allows an engineer to allocate different subnet masks to different segments of the same network address space, eliminating wasted host addresses.
- *The Golden Rule of VLSM:* Always sort requirements in #hl[descending order of required host count] (Largest to Smallest) before allocating addresses!
- If you allocate small subnets first, larger contiguous blocks cannot be formed without overlapping.

#pagebreak()

== 3.7 Solved VLSM Enterprise Case Study
*Scenario:* Design subnets for enterprise network `192.168.10.0/24` with the following departmental requirements:
1. Sales Department: 55 Hosts $|$ 2. Engineering Lab: 28 Hosts $|$ 3. Management: 12 Hosts $|$ 4. Router P2P Link 1: 2 Hosts $|$ 5. Router P2P Link 2: 2 Hosts.

#v(1.5pt)

#table(
  columns: (1fr, 0.9fr, 0.9fr, 1.2fr, 1.1fr, 1.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.5pt,
  table.header([*Department*], [*Needed*], [*Mask*], [*Network ID*], [*Usable Range*], [*Broadcast ID*]),
  [1. Sales], [55], [/26 (62)], [`192.168.10.0`], [`.1` – `.62`], [`192.168.10.63`],
  [2. Engineering], [28], [/27 (30)], [`192.168.10.64`], [`.65` – `.94`], [`192.168.10.95`],
  [3. Management], [12], [/28 (14)], [`192.168.10.96`], [`.97` – `.110`], [`192.168.10.111`],
  [4. P2P Link 1], [2], [/30 (2)], [`192.168.10.112`], [`.113` – `.114`], [`192.168.10.115`],
  [5. P2P Link 2], [2], [/30 (2)], [`192.168.10.116`], [`.117` – `.118`], [`192.168.10.119`],
  [Unallocated], [Free], [/25+], [`192.168.10.120`], [Free for future growth], [`192.168.10.255`]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "Magic Number Worked Example")[
      *Target IP:* `172.16.45.195/27`      - /27 mask = `255.255.255.224`      - Interesting Octet = 4th octet (224)      - Magic Number = $256 - 224 = 32$      - Multiples of 32: $0, 32, 64, 96, 128, 160, 192, 224$      - 195 lies between 192 and 224.      - *Network ID:* `172.16.45.192`      - *Broadcast ID:* `172.16.45.223`      - *Usable Range:* `172.16.45.193` to `.222`
    ]
  ],
  [
    #concept-box(title: "Subnetting Formula Proof")[
      *Number of Subnets created:* $2^S$      (where $S$ is borrowed subnet bits `1`)      *Number of Usable Hosts:* $2^H - 2$      (where $H$ is remaining host bits `0`)      *Example:* Borrowing 3 bits from /24 yields a /27 subnet:      - Subnets = $2^3 = 8$ subnets      - Hosts per net = $2^5 - 2 = 30$ hosts.
    ]
  ]
)

#v(2pt)

== 3.8 Practical Cisco IOS Interface Addressing Commands
To assign IPv4 addresses and verify subnetting on Cisco routers:
```bash
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ip address 192.168.10.1 255.255.255.192
Router(config-if)# no shutdown
Router(config-if)# exit
Router# show ip interface brief | include up
```

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why do we subtract 2 in the host formula (2^H - 2)?", a: "The first address in any subnet represents the Network ID (all host bits 0) and the last address represents the Directed Broadcast Address (all host bits 1). Neither can be assigned to an individual host NIC.")
#faq-item(q: "What is the Magic Number for a /29 subnet mask?", a: "A /29 mask has 29 ones, making the 4th octet 248. The Magic Number is 256 - 248 = 8. Each subnet increments by 8, yielding 6 usable hosts.")
#faq-item(q: "Can two different departments in an enterprise use the same IP address range?", a: "Only if they reside in isolated VRF (Virtual Routing and Forwarding) instances or separate private NAT domains. Within a flat routed campus, duplicate IP addresses cause ARP conflicts and routing blackholes.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Identify the RFC standard that defines Private IPv4 address blocks.", ans: "RFC 1918.")
#short-q(num: 2, q: "What is the network ID and broadcast ID of host 10.1.50.85/26?", ans: "Network ID: 10.1.50.64; Broadcast ID: 10.1.50.127 (Block size 64).")
#short-q(num: 3, q: "How many usable host IP addresses are provided by a /30 subnet?", ans: "Exactly 2 usable hosts (2^2 - 2 = 2).")
#short-q(num: 4, q: "What special address range is represented by 169.254.0.0/16?", ans: "Automatic Private IP Addressing (APIPA) link-local range.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which subnet mask provides at least 50 usable host IP addresses while wasting the minimum number of addresses?", a: "255.255.255.128 (/25)", b: "255.255.255.192 (/26)", c: "255.255.255.224 (/27)", d: "255.255.255.240 (/28)", ans: "B", expl: "/26 provides 2^6 - 2 = 62 usable hosts, which satisfies the 50-host requirement with minimal waste. /27 only provides 30 hosts.")
#mcq(num: 2, q: "What is the Broadcast Address for the subnet containing host 192.168.1.135 with subnet mask 255.255.255.224?", a: "192.168.1.143", b: "192.168.1.159", c: "192.168.1.191", d: "192.168.1.255", ans: "B", expl: "Block size is 32 (256 - 224). Subnet boundaries are 0, 32, 64, 96, 128, 160. Host 135 is in subnet 128. Broadcast is 159.")
#mcq(num: 3, q: "Which address is a valid RFC 1918 private IPv4 address?", a: "172.32.10.1", b: "192.169.1.5", c: "172.25.100.50", d: "11.0.0.1", ans: "C", expl: "Class B private range spans 172.16.0.0 through 172.31.255.255. 172.25.100.50 falls squarely within this range.")
#mcq(num: 4, q: "When performing Variable Length Subnet Masking (VLSM), what is the first rule of allocation?", a: "Allocate point-to-point links first", b: "Sort departments from largest host requirement to smallest", c: "Assign /24 masks to all interfaces", d: "Convert all IP addresses to hexadecimal", ans: "B", expl: "VLSM requires assigning the largest subnets first to prevent address fragmentation and overlapping subnet blocks.")
#mcq(num: 5, q: "What is the purpose of the bitwise Boolean AND operation performed by a router during packet forwarding?", a: "To calculate packet checksums", b: "To determine if the destination IP is on the local subnet or requires a default gateway", c: "To encrypt the payload", d: "To negotiate port speed", ans: "B", expl: "The router ANDs the destination IP with the subnet mask to determine the target Network ID for routing table lookup.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The RFC 3021 /31 Breakthrough")[
      RFC 3021 allows /31 subnets (2 addresses, no network or broadcast address) strictly on point-to-point links, saving millions of IPv4 addresses worldwide!
    ]
  ],
  [
    #tech-spotlight-box(title: "Carrier-Grade NAT (CGNAT)")[
      ISPs assign RFC 6598 addresses (`100.64.0.0/10`) to home routers to share a single public IPv4 address across thousands of mobile subscribers.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
