#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 16 · CCNA TOP 60 MNC INTERVIEW VAULT]
= Chapter 16: CCNA Top 60 MNC Technical Screening Interview Vault & Viva Guide

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Comprehensive technical screening question bank, Senior Network Architect model answers across all six CCNA domains, rapid-fire viva one-liners, and the First 90-Day NOC engineering playbook.
]

#v(2pt)

== 16.1 Cisco CCNA 200-301 Exam Domain Breakdown
Technical hiring managers at Cisco TAC, TCS, Infosys, Wipro, HCL, and global NOCs evaluate candidates across six official blueprint domains:
- *Domain 1: Network Fundamentals (20%):* Components, cabling, IPv4/IPv6, virtualization, and cloud architectures.
- *Domain 2: Network Access (20%):* VLANs, 802.1Q trunking, STP/RSTP, EtherChannel, and wireless LAN architectures.
- *Domain 3: IP Connectivity (25%):* Routing tables, static routing, floating failovers, and single/multi-area OSPFv2.
- *Domain 4: IP Services (10%):* DHCP, NAT/PAT, NTP, SNMP, and Syslog enterprise logging.
- *Domain 5: Security Fundamentals (15%):* ACLs, Port Security, 802.1X, AAA, VPNs, and wireless encryption.
- *Domain 6: Automation & Programmability (10%):* REST APIs, JSON data structures, Ansible, DNA Center, and Git.

#v(2pt)

== 16.2 Top 60 MNC Technical Screening Questions & Architect Answers
#table(
  columns: (0.7fr, 2.3fr, 3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*No.*], [*MNC Technical Interview Question*], [*Senior Network Architect Model Answer*]),
  [Q01], [What is the difference between Collision Domain and Broadcast Domain?], [A collision domain is a physical network segment where frame collisions can occur (broken per switch port). A broadcast domain is the scope of a broadcast frame (broken by routers and VLANs).],
  [Q02], [Explain the 5 stages of the Cisco router boot sequence.], [1. POST diagnostics in ROM, 2. Bootstrap loader execution, 3. Locate IOS in Flash/TFTP/ROM, 4. Load & decompress IOS into RAM, 5. Read startup-config from NVRAM or prompt for Setup mode.],
  [Q03], [How do you recover a lost router password without losing config?], [Interrupt boot into ROMMON, change register to `0x2142` with `confreg 0x2142`, reset router, copy startup-config to running-config, reset secret, restore register `0x2102`, and save.],
  [Q04], [What is the difference between Administrative Distance and Metric?], [AD defines the trustworthiness of the route source (e.g., Connected=0, Static=1, OSPF=110). Metric determines the best path among routes within the exact same routing protocol.],
  [Q05], [How does the Longest Prefix Match (LPM) rule operate?], [When a router evaluates multiple routes to a destination IP, it always forwards using the route with the most specific subnet mask, regardless of Administrative Distance.],
  [Q06], [Explain the 7 states of OSPF neighbor adjacency.], [Down -> Init (Hello received) -> 2-Way (bi-directional seen, DR/BDR elected) -> ExStart (master/slave) -> Exchange (DBD headers) -> Loading (LSR/LSU) -> Full (synchronized LSDB).],
  [Q07], [Why does OSPF elect a DR and BDR on broadcast multi-access links?], [To reduce adjacency overhead from $N(N-1)/2$ full mesh adjacencies to $N-1$ adjacencies, preventing broadcast storm flooding of Link-State Updates.],
  [Q08], [What is the difference between Static NAT, Dynamic NAT, and PAT?], [Static NAT is 1:1 permanent mapping; Dynamic NAT is many-to-many pool mapping; PAT (Overload) multiplexes thousands of private IPs onto a single public IP using Layer 4 ports.],
  [Q09], [Why must Standard ACLs be placed near the destination?], [Standard ACLs filter strictly on source IP address. Placing them near the source blocks that host from accessing all other network resources and the Internet.],
  [Q10], [How does BPDU Guard protect an access layer switch?], [If an unauthorized switch is connected to a PortFast-enabled port and transmits a BPDU, BPDU Guard immediately error-disables the interface, preventing Spanning Tree loops.],
  [Q11], [Explain the difference between 802.1D STP and 802.1w RSTP.], [Legacy STP converges in 30–50s using timers. RSTP converges in under 1 second using an active proposal/agreement handshake and pre-computed Alternate Ports.],
  [Q12], [What is a Floating Static Route and how is it configured?], [A backup static route configured with a higher Administrative Distance (e.g., `ip route 0.0.0.0 0.0.0.0 <ISP2> 10`) that only installs when the primary route (AD 1) drops.]
)

#pagebreak()

== 16.3 Rapid-Fire Technical Viva One-Liners
1. *Subnet Mask /28 host capacity:* Exactly 14 usable host addresses ($2^4 - 2 = 14$).
2. *Default Configuration Register:* `0x2102` (Boots from Flash and reads NVRAM).
3. *OSPF All Routers Multicast:* `224.0.0.5`; *OSPF All DR Routers Multicast:* `224.0.0.6`.
4. *HSRP Virtual MAC Prefix:* `0000.0c07.acXX` (where XX is the hex group number).
5. *Ethernet Channel Link Limit:* 100 meters certified channel distance for copper UTP.
6. *Command to enable IPv6 routing:* `ipv6 unicast-routing` in global configuration.
7. *802.1Q Tag Size:* 4 bytes (32 bits), inserted between Source MAC and EtherType.
8. *CAM Table Aging Time:* 300 seconds (5 minutes) for dynamic MAC address entries.
9. *DHCP Client and Server Ports:* Client broadcasts on UDP 68; Server listens on UDP 67.
10. *Number of VLANs supported by 802.1Q:* 4,096 VLANs (12-bit VID field: 1 to 4094 usable).

#v(2pt)

== 16.4 The First 90-Day Enterprise NOC Playbook
Securing your first Network Engineer position is only the beginning. Excel in your first 90 days with this operational framework:
- *Days 1–30: Passive Discovery & Network Mapping:*
  - Document all Layer 2/3 diagrams, IPAM allocations, and VLAN matrices.
  - Master internal ticketing workflows (ServiceNow / Jira Service Management).
  - Memorize critical infrastructure assets (Core switches, firewalls, ISP circuit IDs).
- *Days 31–60: Active Triage & Systematic Incident Response:*
  - Apply the Cisco TAC 5-tier methodology to resolve Tier 1/2 tickets systematically.
  - Never execute unverified configuration commands in production without peer review.
  - Always capture baseline `show running-config` before and after scheduled maintenance windows.
- *Days 61–90: Automation & Infrastructure Optimization:*
  - Automate routine configuration backups and audit checks using Python and Netmiko.
  - Identify recurring network bottlenecks and propose architectural solutions to senior architects.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "During a technical interview, you are asked: 'What is the primary operational advantage of spine-and-leaf over traditional 3-tier architecture?' What is the best answer?",
  ("Spine-and-leaf is cheaper to cable", "Spine-and-leaf provides deterministic 2-hop latency and high bandwidth for East-West datacenter traffic without STP blocking", "Spine-and-leaf uses less power", "Spine-and-leaf eliminates routers"),
  1,
  "Spine-Leaf delivers non-blocking, equal-cost multi-pathing (ECMP) optimized for server-to-server (East-West) traffic."
)

#mcq-item(
  "Which command provides complete cryptographic verification of an IOS binary image against its published Cisco MD5 hash?",
  ("verify /md5 flash:c2900-universalk9-mz.bin", "check hash flash:ios.bin", "crypto verify ios", "show flash md5"),
  0,
  "'verify /md5 flash:<filename>' computes the cryptographic MD5 hash of an IOS binary file to detect corruption."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The Meaning of CCNA on Your Resume", "Over 1.5 million engineers have passed the Cisco Certified Network Associate exam since its inception in 1998. It remains the most widely recognized networking credential across global Fortune 500 enterprises.")

#spotlight-box("2027 Tech Spotlight: Infrastructure as Code (IaC) & NetDevOps", "Modern Network Engineers no longer configure devices one CLI command at a time. NetDevOps applies software development practices — Git repositories, CI/CD automated test pipelines, and Terraform / Ansible automation — to deploy global enterprise networks in minutes.")
