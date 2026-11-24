// =============================================================================
// RTECHLAB MASTER CURRICULUM BLUEPRINT — CCNA 200-301 (ENGLISH EDITION 1)
// Page 2: Complete 16-Chapter In-Depth Production Curriculum
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[OFFICIAL CISCO CCNA 200-301 BLUEPRINT MAPPING · 16 IN-DEPTH MODULES]
= CCNA 200-301: Master 16-Module Curriculum

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Comprehensive curriculum mapping aligned with Cisco Systems CCNA 200-301 Official Blueprint, enterprise Tier 1/2 NOC operations, and multi-national technical interview screening. Standardized under the RTechLab 2027 Educational Framework.
]

#v(1.5pt)

#table(
  columns: (0.7fr, 2.3fr, 0.7fr, 3.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 2.5pt, y: 1.8pt),
  table.header(
    [*Module*],
    [*Core Academic Subject*],
    [*Focus*],
    [*High-Yield Technical Competencies & Production Lab Focus*]
  ),
  [Ch 01], [Enterprise Network Architectures & Topologies], [Theory], [3-Tier (Core, Dist, Access), 2-Tier Collapsed, Spine-Leaf (East-West), Cloud IaaS/PaaS/SaaS.],
  [Ch 02], [Physical Layer Media, Transceivers & Cabling], [Theory], [Cat5e/6/6a/8, T568A vs T568B pinouts, Straight vs Crossover, SMF vs MMF, SFP/SFP28, RJ45.],
  [Ch 03], [IPv4 Addressing, Subnetting & VLSM Design], [Math], [32-bit headers, CIDR /8 to /32, Magic Number formula, instant /24 to /30 chart, 5 VLSM labs.],
  [Ch 04], [IPv6 Complete Architecture & Transition], [Theory/Lab], [128-bit hex rules, GUA 2000::/3, LLA fe80::/10, ULA fc00::/7, EUI-64 math, SLAAC NDP, CLI.],
  [Ch 05], [Cisco Router Hardware, Memories & Boot Flow], [Hardware], [CPU, Bus, Ports, ROM (POST, Bootstrap, ROMMON), Flash OS, NVRAM startup, RAM running.],
  [Ch 06], [Cisco IOS CLI, Password Recovery & TFTP], [Lab], [CLI modes, Banners, SHA-256 secret, SSH v2, ROMMON 0x2142 bypass step-by-step, TFTP backup.],
  [Ch 07], [Layer 2 Switching, CAM Tables & Port Security], [Lab], [Frame learning, forwarding, flooding, CAM 300s aging, Port Security static/sticky/shutdown.],
  [Ch 08], [VLANs, 802.1Q Trunking & Native 999 Isolation], [Lab], [Broadcast domains, 4-byte 802.1Q tag (TPID/VID), Native VLAN hopping risk, Native 999 lab.],
  [Ch 09], [Spanning Tree (STP/RSTP 802.1w) & EtherChannel], [Lab], [Loops, Bridge ID math, Root election, 802.1D vs 802.1w RSTP, PortFast, BPDU Guard, LACP.],
  [Ch 10], [Inter-VLAN Routing: ROAS & Layer 3 SVI], [Lab], [ROAS subinterfaces (encapsulation dot1q), Layer 3 SVI (ip routing), routed ports (no switchport).],
  [Ch 11], [IPv4 Routing Tables, Static & Floating IP SLA], [Lab], [Longest Prefix Match, AD Table (0 to 255), Static routes, Floating failover with IP SLA ICMP.],
  [Ch 12], [Single & Multi-Area OSPFv2 Dynamic Routing], [Lab], [Dijkstra SPF, Area 0, 7 neighbor states, DR/BDR election, Cost 10^8/BW, 5 LSAs, OSPF CLI.],
  [Ch 13], [Enterprise IP Services: DHCP Server & NAT/PAT], [Lab], [DORA 4-way, DHCP server pools, DHCP relay (ip helper-address), PAT Overload with ACL.],
  [Ch 14], [Enterprise Security: Standard/Extended ACLs & FHRP], [Security], [Standard (1-99) vs Extended (100-199), placement rules, implicit deny, HSRP/VRRP, Syslog 0-7.],
  [Ch 15], [Packet Tracer, GNS3 & TAC Troubleshooting], [Triage], [Packet Tracer vs GNS3 emulation, Wireshark frame analysis, Cisco TAC 5-tier systematic triage.],
  [Ch 16], [CCNA Top 60 MNC Screening Vault & Viva Guide], [Interview], [60 Technical screening Q&As across 6 CCNA domains, rapid-fire viva one-liners, NOC playbook.]
)

#v(1.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(
      width: 100%,
      stroke: (left: 2pt + rgb("#059669")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 5pt, y: 3pt),
      [
        #text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[STUDY METHODOLOGY & LAB DISCIPLINE]\
        #v(1pt)
        #text(size: 6.5pt, fill: rgb("#1E293B"))[
          Every chapter features core theoretical foundations, authentic hardware schematics, production Packet Tracer / GNS3 topologies, and concludes with an Evaluation Dashboard (FAQs, Short-Answer Review, High-Yield MCQs, and 2027 Tech Spotlight).
        ]
      ]
    )
  ],
  [
    #block(
      width: 100%,
      stroke: (left: 2pt + rgb("#0284C7")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 5pt, y: 3pt),
      [
        #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[OFFICIAL AUTHOR & INDUSTRY ACCREDITATION]\
        #v(1pt)
        #text(size: 6.5pt, fill: rgb("#1E293B"))[
          Engineered by Rahul Patel (Founder & Chief Technology Architect, RTechLab). Incorporates real enterprise production network topologies, Cisco TAC troubleshooting playbooks, and personal CCNA engineering notes. Strictly 100% RTechLab branded.
        ]
      ]
    )
  ]
)
