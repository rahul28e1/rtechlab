// =============================================================================
// RTECHLAB MASTER CURRICULUM BLUEPRINT — CCNA 200-301 (ENGLISH EDITION 1)
// Page 2: Complete 10-Chapter Syllabus & Cisco Exam Architecture
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[OFFICIAL CISCO CCNA 200-301 BLUEPRINT MAPPING]
= CCNA 200-301: Master 10-Chapter Curriculum

#text(size: 8.5pt, fill: rgb("#1E293B").lighten(20%))[
  Comprehensive curriculum mapping aligned with Cisco Systems CCNA 200-301 Official Blueprint, enterprise network engineering certifications, Tier 1/2 NOC operations, and multi-national technical interview screening. Standardized under the RTechLab 2027 Educational Framework.
]

#v(3pt)

#table(
  columns: (0.7fr, 2.2fr, 0.9fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: 3.5pt,
  table.header(
    [*Chapter*],
    [*Core Academic Subject*],
    [*Pages*],
    [*High-Yield Technical Competencies & Exam Focus*]
  ),
  [Ch 01], [Enterprise Network Architecture & Topologies], [03 – 06], [3-Tier Hierarchical (Core, Dist, Access), 2-Tier Collapsed Core, Spine-Leaf, SOHO, WAN, Star vs Mesh vs Point-to-Point.],
  [Ch 02], [Physical Layer, Cabling & Port Standards], [07 – 10], [UTP Cat5e/6/6a pinouts (T568A vs T568B), Straight vs Crossover, Fiber SMF vs MMF, SFP/SFP28, Console RJ45/USB, Collision/Broadcast domains.],
  [Ch 03], [IPv4 Addressing, Subnetting & VLSM Cheat Sheet], [11 – 14], [32-bit IPv4 headers, Classful vs CIDR (/8 to /32), Magic Number 256 formula, instant /24 to /30 chart, 5 solved enterprise VLSM scenarios.],
  [Ch 04], [IPv6 Complete Architecture & Transition], [15 – 18], [128-bit hex compression rules, GUA 2000::/3, LLA fe80::/10, ULA fc00::/7, Multicast ff00::/8, EUI-64 MAC conversion, SLAAC NDP vs Stateful DHCPv6.],
  [Ch 05], [Cisco IOS Architecture, Memory & Boot Sequence], [19 – 22], [ROM microcode, Flash OS, NVRAM startup, RAM running, 5-stage boot sequence, config-register 0x2102 vs 0x2142 bypass, ROMMON recovery & tftpdnld.],
  [Ch 06], [Production Cisco CLI Commands & Hardening], [23 – 26], [User > Privileged > Global > Interface modes, MOTD banners, service password-encryption, crypto key RSA 2048-bit, SSH v2, CDP & LLDP neighbor triage.],
  [Ch 07], [Switching, VLANs, Trunking (802.1Q) & STP], [27 – 30], [VLAN segmentation, Access vs 802.1Q Trunk, Native VLAN security, Router-on-a-Stick subinterfaces, Spanning Tree STP 802.1D / RSTP 802.1w, Root Bridge math.],
  [Ch 08], [IP Routing, Administrative Distance & OSPFv2], [31 – 34], [Longest prefix match, Static & Default route 0.0.0.0/0, Floating static AD failover, Administrative Distance Table, OSPFv2 cost 10^8/BW, DR/BDR, Multi-area OSPF.],
  [Ch 09], [Enterprise IP Services & Network Security], [35 – 38], [DHCP Server pools & ip helper-address relay, NAT / PAT Overload, Standard (1-99) vs Extended (100-199) ACLs, Port Security violation modes, password recovery.],
  [Ch 10], [CCNA Top 50 MNC Placement Bank & Viva Guide], [39 – 45], [50 Cisco TAC, TCS, Infosys, Wipro interview questions with Senior Architect model answers, 30 rapid-fire viva one-liners, exam strategy & salary blueprint.]
)

#v(3pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      width: 100%,
      stroke: (left: 2.5pt + rgb("#059669")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 6pt, y: 4pt),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[STUDY METHODOLOGY & LAB DISCIPLINE]\
        #v(1.5pt)
        #text(size: 7pt, fill: rgb("#1E293B"))[
          Every chapter adheres to an exacting 4-page pedagogical architecture: core theoretical foundations and authentic hardware schematics on Pages 1–3, concluded on Page 4 by an Evaluation Dashboard featuring *3 Student FAQs*, *4 Short-Answer Review Questions*, *5 High-Yield MCQs*, *Did You Know facts*, and a *2027 Tech Spotlight*.
        ]
      ]
    )
  ],
  [
    #block(
      width: 100%,
      stroke: (left: 2.5pt + rgb("#0284C7")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 6pt, y: 4pt),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[OFFICIAL AUTHOR & INDUSTRY ACCREDITATION]\
        #v(1.5pt)
        #text(size: 7pt, fill: rgb("#1E293B"))[
          Engineered by Rahul Patel (Founder & Chief Technology Architect, RTechLab). Incorporates real enterprise production network topologies, Cisco TAC troubleshooting playbooks, and university diploma alignment. Free from third-party watermarks or unauthorized logos.
        ]
      ]
    )
  ]
)
