#import "../../07_PUBLISHING_ENGINE/server-theme.typ": *

#set document(
  title: "Windows Server 2025 Systems Administrator Career & Salary Blueprint",
  author: "Rahul Patel"
)

#set page(
  paper: "a4",
  margin: (x: 12mm, top: 14mm, bottom: 12mm),
  fill: white,
  header: context {
    let p = counter(page).get().first()
    if p > 1 {
      block(width: 100%, stroke: (bottom: 0.5pt + rgb("#CBD5E1")), inset: (bottom: 2mm))[
        #grid(
          columns: (1fr, auto),
          align: (left, right),
          [#text(size: 8pt, weight: "black", fill: rtech-navy)[RTECHLAB] #text(size: 8pt, fill: rtech-blue, weight: "bold")[ | Windows Server 2025 Systems Administrator Career & Salary Blueprint]],
          [#text(size: 7.5pt, fill: rtech-muted)[Executive Career Blueprint · Rahul Patel]]
        )
      ]
    }
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 {
      block(width: 100%, stroke: (top: 0.5pt + rgb("#CBD5E1")), inset: (top: 2mm))[
        #grid(
          columns: (1fr, auto),
          align: (left, right),
          [#text(size: 7pt, fill: rtech-muted)[#text(fill: rtech-emerald)[●] Corporate Career Ladder, Tier-1/2/3 Salaries, AZ-800/801 Certifications & Freelance AMC Blueprint]],
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#64748B"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rtech-navy)[Page #p])]
        )
      ]
    }
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 8.2pt, fill: rtech-text)
#set par(justify: true, leading: 0.50em)

// ==================== PAGE 1 ====================
#align(center)[
  #v(4pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), radius: 4pt, inset: (x: 10pt, y: 3.5pt), text(size: 7.8pt, weight: "bold", fill: rgb("#1D4ED8"))[RTECHLAB SYSTEMS & INFRASTRUCTURE ACADEMY · OFFICIAL CAREER SUITE])
  #v(6pt)
  #text(size: 19pt, weight: "black", fill: rtech-navy)[WINDOWS SERVER 2025 & HYBRID CLOUD] \
  #text(size: 15pt, weight: "black", fill: rtech-blue)[SYSTEMS ADMINISTRATOR CAREER & SALARY BLUEPRINT]
  #v(3pt)
  #text(size: 9.5pt, weight: "bold", fill: rtech-teal)[2027 Indian & Global Compensation Matrix · Tier-1/2/3 Cities · L1 to Cloud Architect Ladder · AZ-800/801 Path · SME AMC Guide]
  #v(5pt)
  #line(length: 60%, stroke: 1.5pt + rtech-blue)
  #v(3pt)
  #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[Author: Rahul Patel] #text(size: 8pt, fill: rtech-muted)[(Founder & Chief Technology Architect, RTechLab · Helpline: +91 76468 92094)]
]

#v(6pt)

#info-box(title: "EXECUTIVE SUMMARY & 2027 INFRASTRUCTURE MARKET SHIFT")[
  Enterprise computing in 2026–2027 is experiencing the most significant infrastructure transition in a decade. Over 85% of Fortune 500 and Indian enterprise corporations are modernizing legacy on-premises servers to *Microsoft Windows Server 2025* integrated with *Azure Arc Hybrid Management*. The demand for Systems Administrators who master Active Directory, Group Policy Objects (GPO), Hotpatching (zero-reboot servicing), SMB over QUIC, and Disaster Recovery has surged by 42% across TCS, Wipro, Infosys, Cognizant, and global MNC GCCs (Global Capability Centers).
]

#v(6pt)

== 1. The 4-Tier Systems Administrator Career Ladder

#table(
  columns: (1.2fr, 1.8fr, 1.5fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  align: (left + horizon),
  table.header(
    [#text(fill: white)[*Career Level / Designation*]],
    [#text(fill: white)[*Core Enterprise Responsibilities*]],
    [#text(fill: white)[*Required Technical Stack*]],
    [#text(fill: white)[*Typical Experience & CTC*]]
  ),
  [#text(weight: "bold", fill: rtech-navy)[Level 1: Desktop Support & Junior Admin]],
  [End-user ticketing (ServiceNow), AD user creation, password reset, domain join, basic DHCP scope & printer management.],
  [Windows 10/11, Server Manager, ADUC (`dsa.msc`), Basic PowerShell, TCP/IP.],
  [0–2 Years \ #text(weight: "bold", fill: rtech-emerald)[₹3.2 LPA – ₹5.5 LPA]],

  [#text(weight: "bold", fill: rtech-navy)[Level 2: Systems & Network Administrator]],
  [Domain Controller promotion, GPO deployment, DNS/DHCP administration, FSRM quota management, server patching & system backup.],
  [Server 2022/2025, GPMC, DNS zones, Hyper-V, PowerShell automation, `wbadmin`.],
  [2–5 Years \ #text(weight: "bold", fill: rtech-emerald)[₹6.0 LPA – ₹10.5 LPA]],

  [#text(weight: "bold", fill: rtech-navy)[Level 3: Senior Enterprise Infrastructure Engineer]],
  [Multi-site AD replication, FSMO role management, PKI/SSL certificate deployment, clustering, high-availability IIS, hotpatching & DR audits.],
  [Server 2025, S2D, Azure Arc, Hotpatching, SMB over QUIC, Advanced PowerShell Scripting.],
  [5–9 Years \ #text(weight: "bold", fill: rtech-emerald)[₹11.0 LPA – ₹18.0 LPA]],

  [#text(weight: "bold", fill: rtech-navy)[Level 4: Principal Hybrid Cloud Architect]],
  [Enterprise hybrid architecture design, on-prem to Azure migration, zero-trust IAM, compliance & ITIL audit leadership.],
  [Azure Arc, Entra ID, SC-300, Terraform/ARM, Hybrid Identity, Enterprise Governance.],
  [9+ Years \ #text(weight: "bold", fill: rtech-emerald)[₹20.0 LPA – ₹38.0+ LPA]]
)

#v(6pt)

== 2. 2027 Indian & Global Compensation Matrix (City-by-City)

#table(
  columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#E2E8F0") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  align: (center + horizon),
  table.header(
    [#text(fill: white)[*Location / Tier*]],
    [#text(fill: white)[*Junior Admin (0-2 Yrs)*]],
    [#text(fill: white)[*Mid SysAdmin (2-5 Yrs)*]],
    [#text(fill: white)[*Sr. Admin (5-9 Yrs)*]],
    [#text(fill: white)[*Hybrid Architect (9+ Yrs)*]]
  ),
  [#align(left)[*Tier-1 Tech Hubs* \ (Bengaluru, Hyderabad, Pune, NCR, Mumbai)]],
  [₹3.8L – ₹5.8L],
  [₹7.0L – ₹11.5L],
  [₹13.0L – ₹19.5L],
  [₹22.0L – ₹40.0L],

  [#align(left)[*Tier-2 Cities* \ (Ahmedabad, Jaipur, Chandigarh, Kochi, Indore)]],
  [₹3.0L – ₹4.5L],
  [₹5.5L – ₹9.0L],
  [₹10.0L – ₹15.0L],
  [₹17.0L – ₹28.0L],

  [#align(left)[*Tier-3 Regional Hubs* \ (Palanpur, Surat, Vadodara, Rajkot, Nagpur)]],
  [₹2.4L – ₹3.8L],
  [₹4.5L – ₹7.2L],
  [₹8.0L – ₹12.5L],
  [₹14.0L – ₹22.0L],

  [#align(left)[*Gulf & Middle East* \ (Dubai, Abu Dhabi, Riyadh, Doha)]],
  [AED 5k–8k/mo \ (~₹14L–22L)],
  [AED 10k–16k/mo \ (~₹28L–44L)],
  [AED 18k–28k/mo \ (~₹50L–78L)],
  [AED 32k–50k/mo \ (~₹90L–1.4Cr)],

  [#align(left)[*Remote Global (US/UK/EU)* \ (Contract & Remote Operations)]],
  [\$2.5k–\$3.5k/mo \ (~₹25L–35L)],
  [\$4.5k–\$7.0k/mo \ (~₹45L–70L)],
  [\$8.0k–\$12k/mo \ (~₹80L–1.2Cr)],
  [\$14k–\$20k/mo \ (~₹1.4Cr–2.0Cr)]
)

#pagebreak()

// ==================== PAGE 2 ====================
== 3. Microsoft & Industry Certifications Blueprint

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(fill: rgb("#F0F9FF"), stroke: 1pt + rgb("#BAE6FD"), radius: 5pt, inset: 9pt)[
      #text(weight: "black", size: 9pt, fill: rtech-blue)[CORE TRACK 1: Windows Server Hybrid Core]
      #v(3pt)
      *Exam AZ-800: Administering Windows Server Hybrid Core Infrastructure*
      - Deploying & managing Active Directory Domain Services (AD DS) in on-premises and cloud environments.
      - Managing Windows Servers and workloads in a hybrid environment.
      - Managing virtual machines and containers.
      - Implementing and managing on-premises and hybrid networking infrastructure.
      - Managing storage and file services.
      #v(3pt)
      #text(size: 7.2pt, fill: rtech-muted)[*Passing Score*: 700/1000 · *Career Impact*: Qualifies directly for L2 SysAdmin (₹7L+ CTC)]
    ]
  ],
  [
    #block(fill: rgb("#F0FDF4"), stroke: 1pt + rgb("#BBF7D0"), radius: 5pt, inset: 9pt)[
      #text(weight: "black", size: 9pt, fill: rtech-emerald)[CORE TRACK 2: Windows Server Hybrid Advanced]
      #v(3pt)
      *Exam AZ-801: Configuring Windows Server Hybrid Advanced Services*
      - Securing Windows Server on-premises and hybrid infrastructures.
      - Implementing and managing Windows Server high availability.
      - Implementing disaster recovery (Azure Site Recovery, Backup).
      - Migrating servers and workloads.
      - Monitoring and troubleshooting Windows Server environments.
      #v(3pt)
      #text(size: 7.2pt, fill: rtech-muted)[*Passing Score*: 700/1000 · *Certification Credential*: Microsoft Certified Windows Server Hybrid Administrator Associate]
    ]
  ]
)

#v(6pt)

== 4. High-Income Freelance & SME AMC Rate Card (₹50,000 to ₹1,50,000/Month)

Small and medium enterprises (clinics, chartered accountants, educational institutes, manufacturing units, trading firms) do not hire full-time ₹10L/year SysAdmins. They outsource their server and network maintenance to certified freelance system administrators on annual maintenance contracts (AMC).

#table(
  columns: (1.5fr, 2fr, 1.2fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  align: (left + horizon),
  table.header(
    [#text(fill: white)[*Service Offering*]],
    [#text(fill: white)[*Scope of Work Deliverables*]],
    [#text(fill: white)[*Turnaround Time*]],
    [#text(fill: white)[*Commercial Rate Card*]]
  ),
  [*New Domain & AD Setup*],
  [Windows Server 2025 install, AD DS root DC promotion, OU hierarchy, user setup, client domain join (10-30 PCs), basic GPO security.],
  [2–3 Days],
  [#text(weight: "bold", fill: rtech-emerald)[₹25,000 – ₹45,000] (One-Time)],

  [*Monthly Enterprise AMC*],
  [Weekly server health check, Windows updates patching, backup verification, user account lifecycle, antivirus definition sync, remote RDP support.],
  [Monthly Recurring],
  [#text(weight: "bold", fill: rtech-emerald)[₹15,000 – ₹35,000 / Month] \ (Per Client, 3-5 clients = ₹1L+/mo)],

  [*Disaster Recovery & Backup*],
  [Automated daily 3-2-1 backup to NAS + Cloud storage, Active Directory Recycle Bin activation, Bare-metal test recovery drill.],
  [1–2 Days],
  [#text(weight: "bold", fill: rtech-emerald)[₹18,000 – ₹30,000] (One-Time)],

  [*Ransomware Hardening*],
  [FSRM file screening (blocking 100+ ransomware extensions), BitLocker enforcement GPO, AppLocker, USB mass storage blocking.],
  [1 Day],
  [#text(weight: "bold", fill: rtech-emerald)[₹15,000 – ₹25,000] (One-Time)],

  [*Server 2025 Azure Arc Integration*],
  [Azure Arc agent onboarding, Hotpatching configuration, Azure Monitor alert setup, cloud backup replication policy.],
  [2 Days],
  [#text(weight: "bold", fill: rtech-emerald)[₹30,000 – ₹55,000] (One-Time)]
)

#v(6pt)

== 5. High-Converting ATS Resume Keywords & Action Bullets

Recruiters at TCS, Infosys, Wipro, HCL, Cognizant, and Amazon use automated Applicant Tracking Systems (ATS) to filter resumes. Including these exact keywords and impact metrics guarantees an interview callback rate above 75%:

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(fill: rgb("#F8FAFC"), stroke: 0.5pt + rgb("#64748B"), radius: 4pt, inset: 8pt)[
      #text(weight: "black", size: 8.5pt, fill: rtech-navy)[Essential Technical ATS Keywords:]
      #v(2.5pt)
      - *Identity & Directory*: Active Directory Domain Services (AD DS), Domain Controller, Kerberos, LDAP, FSMO Roles, Group Policy Objects (GPO), AGDLP Model, AD Recycle Bin, DNS Forwarders.
      - *Networking & Core Roles*: DHCP Scopes, 80/20 Failover, DNS Aging & Scavenging, SRV Records, IIS 10.x, SSL/TLS, SFTP, SMB 3.1.1, SMB over QUIC.
      - *Storage & Security*: FSRM Quota Management, NTFS Permissions, BitLocker, Hotpatching, ReFS Deduplication, Hardening.
    ]
  ],
  [
    #block(fill: rgb("#F8FAFC"), stroke: 0.5pt + rgb("#64748B"), radius: 4pt, inset: 8pt)[
      #text(weight: "black", size: 8.5pt, fill: rtech-navy)[Proven Action Bullets for Your Resume:]
      #v(2.5pt)
      - "Architected and maintained multi-site Active Directory infrastructure supporting 450+ domain users with 99.98% service uptime across 2 physical locations."
      - "Automated user provisioning and deprovisioning workflows using PowerShell, reducing onboarding turnaround time from 4 hours to 8 minutes."
      - "Implemented enterprise GPO baseline including USB lockdown, LAPS password rotation, and screen lock policies, achieving 100% security audit compliance."
      - "Configured Windows Server Backup and Active Directory Recycle Bin, ensuring RPO under 24 hours and RTO under 30 minutes during critical drills."
    ]
  ]
)

#pagebreak()

// ==================== PAGE 3 ====================
== 6. The 6-Month Systems Administrator Mastery Roadmap (Month 1 to 6)

#table(
  columns: (1.2fr, 2.5fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  align: (left + horizon),
  table.header(
    [#text(fill: white)[*Timeline*]],
    [#text(fill: white)[*Key Focus Areas & Practical Milestones*]],
    [#text(fill: white)[*Tangible Portfolio Deliverable*]]
  ),
  [*Month 01: Core Networking & VM Lab*],
  [Master OSI model, IPv4 subnetting (`/24` to `/29`), private vs public IPs, VirtualBox & Hyper-V internal virtual networks, initial Server 2025 installation.],
  [Fully functional multi-VM private virtual network running on laptop with static IPs.],

  [*Month 02: Active Directory & Identity*],
  [Deploy root DC (`corp.rtechlab.local`), understand 5 FSMO roles, master ADUC (`dsa.msc`), design enterprise OU structure, implement AGDLP group strategy.],
  [Scripted creation of 50 enterprise users and 10 security groups via PowerShell CSV import.],

  [*Month 03: Endpoint Management & GPO*],
  [Windows 10/11 domain join, resolve DNS resolution bottlenecks, master GPMC (`gpmc.msc`), LSDOU processing hierarchy, enforce password and USB restriction GPOs.],
  [Live GPO hardening baseline verified on domain client with `gpresult /r` report.],

  [*Month 04: Core Infrastructure Services*],
  [Install & authorize DHCP server, configure 80/20 failover, configure AD-Integrated DNS zones, scavenging, root hints, install FSRM quota and ransomware file screening.],
  [Zero-broadcast DHCP lease automation and multi-zone DNS architecture with PTR records.],

  [*Month 05: Web, Remote Access & Backup*],
  [Configure IIS 10.x with self-signed SSL/TLS HTTPS binding, configure Remote Desktop Services (RDS), execute bare-metal Windows Server Backup & AD Recycle Bin restore.],
  [Tested 1-click restoration of accidentally deleted organizational unit (OU) with 20 accounts.],

  [*Month 06: MNC Interview Sprints & Placement*],
  [Complete all 50 MNC Placement Vault scenarios, practice live troubleshooting drills (account lockout, replication failure), optimize ATS resume, apply for L1/L2 roles.],
  [Polished GitHub/PDF portfolio of 10 completed enterprise labs ready for interviews.]
)

#v(6pt)

== 7. Corporate HR Salary Negotiation Scripts & Rebuttals

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BAE6FD"), radius: 4pt, inset: 8pt)[
      #text(weight: "black", size: 8.5pt, fill: rtech-navy)[Scenario 1: HR offers minimum ₹3.2 LPA for L1]
      #v(2pt)
      *Your Professional Response Script:* \
      "I appreciate the initial offer. However, given that I bring end-to-end practical competency in Active Directory domain management, GPO security policies, and PowerShell user automation demonstrated in my portfolio labs, I am confident I will reduce the team's ticket turnaround time from day one without requiring 3 months of baseline training. Based on industry benchmarks for candidates with hybrid server administration skills, I am targeting ₹4.5 LPA to ₹5.0 LPA to align with the value I will immediately deliver."
    ]
  ],
  [
    #block(fill: rgb("#F0FDF4"), stroke: 1pt + rgb("#BBF7D0"), radius: 4pt, inset: 8pt)[
      #text(weight: "black", size: 8.5pt, fill: rtech-navy)[Scenario 2: HR asks "You have limited MNC experience?"]
      #v(2pt)
      *Your Confident Field Rebuttal:* \
      "While I am transitioning into this specific enterprise team, my hands-on experience is grounded in real corporate configurations: I have built multi-VM isolated enterprise topologies, promoted Root Domain Controllers, configured DNS aging and scavenging, implemented FSRM ransomware screening, and executed full disaster recovery using Active Directory Recycle Bin and wbadmin. My focus has been 100% operational readiness rather than passive theoretical study."
    ]
  ]
)

#v(6pt)

#pro-tip(title: "RAHUL PATEL'S FINAL MENTORSHIP MESSAGE")[
  Dear Student, Systems Administration is a discipline where candidates who solely memorize theory consistently struggle, but those who possess genuine hands-on confidence—having deployed their own Domain Controllers in home labs, enforced granular GPOs, and resolved real-world replication errors—are selected in the very first interview round. Execute every single lab from our Master Handbook on your laptop. For personalized career mentorship, resume reviews, or technical interview coaching, reach out directly to our 24x7 helpline on WhatsApp at *+91 76468 92094* (https://wa.me/message/FUIEEQDZLUKVK1) or email *rahul.28e1\@gmail.com*!
]
