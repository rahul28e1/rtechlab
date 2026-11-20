import os
import subprocess

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
CCNA_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301")
CAREER_DIR = os.path.join(CCNA_DIR, "04_CAREER_AND_SALARY_BLUEPRINT")
SOURCE_FILE = os.path.join(CAREER_DIR, "source", "career-and-salary-blueprint.typ")
PDF_OUT = os.path.join(CAREER_DIR, "CCNA-200-301-Network-Engineer-Career-Salary-Blueprint-Edition-1.pdf")

content = '''#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab Network Engineer Career & Salary Blueprint (Edition 1)",
  author: "Rahul Patel"
)

// COVER PAGE
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5(
  title: "NETWORK ENGINEER CAREER BLUEPRINT",
  subtitle: "2027 Indian IT Salary Matrix · NOC Career Ladders · 25 ATS Resume Bullets · Exam Roadmap",
  edition: "2027 CAREER ACCELERATOR EDITION · EDITION 1",
  series-pill: "RTECHLAB COMMERCIAL SUITE · CAREER BLUEPRINT EDITION 1",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-CCNA-CAREER-ED1",
  logo-path: "/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Network Engineer Career & Salary Blueprint",
  edition: "2027 Career Accelerator Edition · Edition 1 Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-CCNA-CAREER-ED1"
)

#pagebreak()

= 2027 ENTERPRISE NETWORK CAREER LADDER & SALARY MATRIX

#concept-box(title: "EXECUTIVE MARKET OVERVIEW (INDIA & GLOBAL)")[
  With the rapid explosion of cloud computing, edge datacenters, 5G enterprise networks, and AI cluster infrastructure, certified Cisco Network Engineers are in unprecedented demand. This blueprint outlines verified career ladders, compensation benchmarks across top Indian tech hubs (Bengaluru, Hyderabad, Pune, Gurgaon, Noida, Chennai), high-impact resume phrasing, and an intensive 6-week CCNA 200-301 exam roadmap.
]

#v(4pt)

== 1. Compensation Benchmarks by Experience & Role (India CTC)
#table(
  columns: (1.2fr, 1.1fr, 1.4fr, 2.3fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rtech-navy) } else { 0.5pt + rtech-border },
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else if calc.even(row) { rgb("#FFFFFF") } else { rgb("#F8FAFC") },
  inset: (x: 7pt, y: 5.5pt),
  [*Target Role*], [*Experience*], [*Annual CTC Range (INR)*], [*Core Technical Responsibility & Skills*]),
  [L1 Desktop / Network Support], [0–2 Years], [₹3.5L – ₹5.2L], [Layer 1 cabling, patch panels, basic switchport configs, ping/traceroute triage.],
  [NOC Network Engineer (Tier 2)], [2–4 Years], [₹5.5L – ₹8.5L], [24x7 enterprise monitoring, SolarWinds/PRTG, OSPF adjacency triage, VLANs, HSRP.],
  [Network Administrator], [4–7 Years], [₹9.0L – ₹14.0L], [Firewall rule changes (Palo Alto/Fortinet), multi-area OSPF, BGP peering, IPsec VPNs.],
  [Senior Network Engineer / TAC], [7–10 Years], [₹15.0L – ₹22.0L], [Cisco TAC packet trace analysis, Wireshark troubleshooting, SD-WAN, DNA Center.],
  [Enterprise Network Architect], [10+ Years], [₹24.0L – ₹40.0L+], [Campus 3-Tier/Spine-Leaf architecture design, cloud direct connects, capacity planning.]
)

#v(4pt)

== 2. Top Tier Hiring Enterprises & Service Providers
- *Global Tech Vendors:* Cisco Systems (TAC & Advanced Services), Juniper Networks, Arista Networks, Nokia.
- *Telecommunications & ISPs:* Bharti Airtel, Reliance Jio, Tata Communications, Orange Business Services, Vodafone Idea.
- *IT Services & SI Giants:* Tata Consultancy Services (TCS), Wipro, Infosys, Cognizant, HCL Technologies, Tech Mahindra, LTIMindtree.
- *Global In-House Centers (GICs):* JP Morgan Chase, Morgan Stanley, Amazon AWS, Microsoft Azure, Google Cloud.

#pagebreak()

= 25 HIGH-IMPACT ATS RESUME BULLET POINTS

#concept-box(title: "ATS OPTIMIZATION PRINCIPLE")[
  Applicant Tracking Systems (ATS) filter resumes using quantifiable metrics, action verbs, and exact Cisco technical keywords. Never write generic bullet points like _"Managed network switches"_. Use the structured STAR formula (Situation, Task, Action, Result) with real impact numbers.
]

#v(3pt)

== Network Implementation & Routing
- Engineered and deployed multi-area OSPFv2 across 45 campus Cisco Catalyst 9300 switches and ISR 4451 routers, achieving 99.99% network uptime.
- Configured and optimized BGP and floating static routes across dual Tier 1 ISP uplinks, reducing WAN failover time from 45 seconds to sub-second cutover.
- Implemented Router-on-a-Stick (ROAS) and Layer 3 Switch Virtual Interfaces (SVIs) for 16 corporate VLANs, isolating 1,200+ endpoints and containing broadcast domains.
- Tuned OSPF reference bandwidth to 10 Gbps and deployed passive-interface policies across 80+ access switchports to prevent unauthorized routing adjacencies.
- Designed and migrated legacy IPv4 campus subnets to dual-stack IPv4/IPv6 utilizing SLAAC and EUI-64 addressing for 2,500 enterprise endpoints.

== Switching, Spanning Tree & High Availability
- Standardized Spanning Tree Protocol across 32 distribution switches to Rapid PVST+ (802.1w), reducing Layer 2 network convergence from 50s to under 1 second.
- Hardened switch access ports against rogue loops and MAC flooding by enforcing PortFast, BPDU Guard, and 2-MAC sticky port security.
- Configured LACP (802.3ad) EtherChannel port-channels across redundant distribution links, aggregating 40 Gbps of backbone bisectional bandwidth.
- Deployed First Hop Redundancy Protocol (HSRP) with preemption and interface tracking, eliminating single points of failure for 4,000 corporate users.
- Isolated corporate Native VLAN to an unused VLAN ID (VLAN 999), mitigating double-tagging VLAN hopping vulnerabilities during security audit.

== Network Security, Access Control & Services
- Authored and deployed 150+ Standard and Extended Access Control Lists (ACLs), filtering unauthorized inter-VLAN web traffic and enforcing least-privilege access.
- Implemented Port Address Translation (PAT / NAT Overload) across redundant ISP interfaces, multiplexing 3,000 internal private hosts onto a public /29 pool.
- Configured enterprise DHCP server pools and routed DHCP relay agents (`ip helper-address`), centralizing address allocation for 12 branch locations.
- Deployed Dynamic ARP Inspection (DAI) and DHCP Snooping across 20 access switches, blocking unauthorized rogue DHCP servers and ARP poisoning attempts.
- Enforced SSH Version 2 with 2048-bit RSA keys, disabled insecure Telnet, and configured AAA TACACS+ authentication with Cisco ISE.

== Troubleshooting, NOC Operations & Automation
- Resolved 250+ escalated Tier 2 NOC network incidents within strict 1-hour SLA windows, utilizing Wireshark packet capture analysis and NetFlow telemetry.
- Automated switch VLAN provisioning and backup scripts using Python (`Netmiko` and `NAPALM`), reducing human deployment errors by 85%.
- Authored Python RESTCONF scripts to query Cisco Catalyst switch interface telemetry and push JSON configuration templates via central API.
- Diagnosed and resolved cyclic redundancy check (CRC) errors and duplex mismatches across fiber SFP+ links, restoring degraded 10GbE backbones.
- Successfully executed Cisco router password recovery (`confreg 0x2142`) and TFTP ROMMON flash restorations on 15 factory-reset production routers.

#pagebreak()

= CISCO CERTIFICATION ROADMAP & 6-WEEK STUDY SCHEDULE

#concept-box(title: "THE CISCO CAREER MATRIX")[
  The Cisco certification ecosystem provides a globally recognized credential validation path from entry-level to world-class expert architect.
]

#v(2pt)

== 1. The Cisco Enterprise Certification Journey
- *1. Cisco Certified Support Technician (CCST Networking):* Entry-level foundation; validates basic cabling, IP addressing, and endpoint connectivity.
- *2. Cisco Certified Network Associate (CCNA 200-301):* #hl[The global gold standard]. Validates routing, switching, wireless, security, and automation.
- *3. CCNP Enterprise (350-401 ENCOR + 300-410 ENARSI):* Professional level. Validates enterprise core routing (BGP, multi-area OSPF, QoS) and deep troubleshooting.
- *4. CCIE Enterprise Infrastructure:* Expert architect level. Rigorous 8-hour hands-on practical lab exam; commands elite global salaries.

#v(4pt)

== 2. The 6-Week CCNA 200-301 Intensive Study Master Schedule
#table(
  columns: (1fr, 1.8fr, 3.2fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rtech-navy) } else { 0.5pt + rtech-border },
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else if calc.even(row) { rgb("#FFFFFF") } else { rgb("#F8FAFC") },
  inset: (x: 7pt, y: 5.5pt),
  [*Week*], [*Core Focus Area*], [*Mandatory Daily Deliverables & Lab Practice*],
  [Week 1], [Network Fundamentals & Subnetting], [Master OSI 7 layers vs TCP/IP. Solve 50 subnetting problems using the Magic Number formula. Study IPv6 GUA, LLA, and EUI-64 math.],
  [Week 2], [Cisco CLI & Device Hardening], [Practice User to Privileged to Global config modes. Configure hostname, MOTD banner, enable secret, SSH v2 with 2048-bit RSA, and line timeouts.],
  [Week 3], [Switching, VLANs & Spanning Tree], [Configure VLANs 10/20, 802.1Q trunks, native VLAN 999. Tune Rapid PVST+ root bridge priority 4096. Test PortFast and BPDU Guard.],
  [Week 4], [IP Routing & OSPFv2 Mastery], [Deploy Router-on-a-Stick subinterfaces. Configure static, default (0.0.0.0/0), and floating routes. Deploy single/multi-area OSPFv2 with cost tuning.],
  [Week 5], [IP Services & Enterprise Security], [Build Cisco DHCP server pool and ip helper-address relay. Configure PAT overload. Deploy Standard and Extended ACLs and Port Security.],
  [Week 6], [Automation, Mock Exams & Interview Prep], [Study SDN, REST APIs, JSON/YAML. Review Top 50 MNC Placement Questions and 30 Viva One-Liners. Take 3 full 120-minute CCNA mock exams.]
)

#v(6pt)

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
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[EXAM DAY STRATEGY & TIME MANAGEMENT]\
        #v(1.5pt)
        #text(size: 7pt, fill: rgb("#1E293B"))[
          The CCNA 200-301 exam contains approximately 100–105 questions in 120 minutes (approx 70 seconds per question). Cisco does #hl[NOT allow backward navigation]! Never leave a question unanswered. Budget 10–12 minutes for hands-on performance lab configuration questions.
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
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[RTECHLAB LIFETIME SUPPORT & COMMUNITY]\
        #v(1.5pt)
        #text(size: 7pt, fill: rgb("#1E293B"))[
          Your journey does not end with certification. Connect with our nationwide student community, join live weekend labs, and access updated interview question vaults at #text(fill: rgb("#0284C7"), weight: "bold")[rtechlab.vercel.app/notes].
        ]
      ]
    )
  ]
)
'''

with open(SOURCE_FILE, "w", encoding="utf-8") as f:
    f.write(content)

print(f"[OK] Career blueprint source written to {SOURCE_FILE}")

# Compile
cmd = f'typst compile --root "{CCNA_DIR}" "{SOURCE_FILE}" "{PDF_OUT}"'
res = subprocess.run(cmd, shell=True, capture_output=True, text=True)
if res.returncode == 0:
    print(f"[SUCCESS] Career Blueprint compiled to {PDF_OUT}")
else:
    print(f"[ERROR] Compilation failed: {res.stderr}")
