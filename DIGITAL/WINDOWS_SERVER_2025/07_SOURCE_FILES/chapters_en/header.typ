#import "../07_PUBLISHING_ENGINE/server-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-server.typ": rtech-server-cover

// Set up the Master Book Wrapper
#show: rtech-server-book.with(
  title: "Windows Server 2025 & Active Directory Master Handbook",
  subtitle: "Client-Server Architecture · AD DS Domain Controller · Group Policy (GPO) · DNS & DHCP · Storage Spaces · Hybrid Azure Arc · Top 50 MNC Placement Vault",
  author: "Rahul Patel",
  edition: "2027 Master Commercial Edition · Edition 1 (Server 2025 Flagship)",
  subject-code: "RTL-2027-WINSRV-ED1",
  lang: "en"
)

// =============================================================================
// PAGE 01: OFFICIAL MASTER COVER PAGE
// =============================================================================
#rtech-server-cover(
  title: "Microsoft Windows Server 2025 & Active Directory",
  subtitle: "Client-Server Architecture · AD DS Domain Controller · Group Policy (GPO) · DNS & DHCP · Storage Spaces · Hybrid Azure Arc · Top 50 MNC Placement Vault",
  edition: "2027 Master Commercial Edition · Edition 1 (Server 2025 Ready)",
  series-pill: "Official RTechLab Certified Systems Administration Guide",
  author: "Rahul Patel",
  author-title: "Chief Technology Architect & Founder, RTechLab",
  lang-tag: "ENGLISH COMPLETE MASTER EDITION (INTERNATIONAL EDITION)"
)

#pagebreak()


// =============================================================================
// PAGE 02: MASTER TABLE OF CONTENTS — PART 1 (Core Infrastructure & Directory Services)
// =============================================================================
[#metadata("toc") <table-of-contents>]

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 3pt),
    text(size: 8pt, weight: "bold", fill: rtech-blue)[MASTER TABLE OF CONTENTS · PART 1 (CHAPTERS 01 TO 07) · PAGE 1 / 2]
  )
  #v(2.5pt)
  #text(size: 17pt, weight: "black", fill: rtech-navy)[Master Table of Contents — Part 1 (Chapters 01 to 07)]
  #v(2pt)
  #text(size: 8.2pt, fill: rtech-muted)[(Click any chapter to jump directly to that page · Chapters 08 to 14 continue on Page 03)]
  #v(4pt)
  #line(length: 100%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(3pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  radius: 6pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 9pt, y: 7.5pt),
  [
    #grid(
      columns: (1fr, auto),
      row-gutter: 8pt,
      align: (left, right + horizon),
      
      [#link(<chapter-1>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 01: Server Architecture, Server Types & 32-Year Windows Server Evolution]] \
       #text(size: 7.2pt, fill: rtech-muted)[Client-Server Model · 8 Enterprise Server Roles · Physical vs Virtual vs Azure Arc · NT 3.1 to 2025 Evolution · Win 11 vs Server 2025 · Practice MCQs & MNC Vault]],
      [#link(<chapter-1>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 04 →]]],

      [#link(<chapter-2>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 02: Hands-On Enterprise Lab Setup: Server 2025 ISO & VM Configuration]] \
       #text(size: 7.2pt, fill: rtech-muted)[Hardware Specifications · Isolated VNet Topology · Microsoft 180-Day Evaluation ISO · VirtualBox VM Creation · Desktop Experience vs Core · First Boot & MCQs]],
      [#link(<chapter-2>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 09 →]]],

      [#link(<chapter-3>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 03: Post-Installation Baseline Configuration & Server Hardening]] \
       #text(size: 7.2pt, fill: rtech-muted)[Server Manager Dashboard · Standard Host Naming (`SRV-2025-DC01`) · Static IPv4 & DNS Assignment · RDP with NLA · Firewall Hardening · NTP Clock Sync · MCQs]],
      [#link(<chapter-3>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 14 →]]],

      [#link(<chapter-4>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 04: Active Directory Domain Services (AD DS) & Domain Controller Promotion]] \
       #text(size: 7.2pt, fill: rtech-muted)[AD DS Core Architecture · Logical (Forest, Domain, OU) vs Physical (Sites) Hierarchy · Role Installation Wizard · Root DC (`corp.rtechlab.local`) · DSRM · 5 FSMO Roles]],
      [#link(<chapter-4>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 18 →]]],

      [#link(<chapter-5>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 05: ADUC Console: Managing OUs, Domain Users & Security Groups]] \
       #text(size: 7.2pt, fill: rtech-muted)[ADUC (`dsa.msc`) · Corporate Tiered OU Hierarchy · Domain User Provisioning · Account Lockout Policies · Security vs Distribution Groups · AGDLP Model · Bulk PowerShell]],
      [#link(<chapter-5>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 23 →]]],

      [#link(<chapter-6>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 06: Client Machine (Windows 10/11) Domain Join Walkthrough]] \
       #text(size: 7.2pt, fill: rtech-muted)[Client Prerequisites · Golden DNS IP Mapping Rule · Connectivity & `nslookup` SRV Tests · Workgroup to Domain Migration · Top 5 Join Errors & Fixes · First Domain Login]],
      [#link(<chapter-6>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 27 →]]],

      [#link(<chapter-7>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 07: Group Policy Objects (GPO): Enterprise Security & Endpoint Control]] \
       #text(size: 7.2pt, fill: rtech-muted)[GPMC Console (`gpmc.msc`) · LSDOU Hierarchy · Block Inheritance & Enforced · Lab 1: Password Policy · Lab 2: Removable Storage USB Lockdown · Lab 3: Wallpaper · `gpupdate`]],
      [#link(<chapter-7>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 31 →]]]
    )
  ]
)

#v(4pt)
#info-box(title: "Part 1 Executive Curriculum Summary (Foundation & Identity)")[
  In Part 1, you will master enterprise core architecture, isolated VM lab setup, server hardening baseline, Active Directory Domain Services (AD DS), Root DC promotion, user/group lifecycle management, endpoint domain joining, and Group Policy (GPO) security enforcement with complete operational confidence.
]

#v(3pt)
#link(<toc-part2>)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 1.2pt + rtech-blue,
    radius: 5pt,
    inset: (x: 9pt, y: 5.5pt),
    [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 8.5pt, weight: "black", fill: rtech-navy)[👉 Chapters 08 to 14 (DHCP, DNS, FSRM, IIS, Azure Arc, Backup & MNC Placement Vault)] \
          #text(size: 7.2pt, fill: rtech-muted)[Continue to Page 03 for Master Index Part 2 or click here directly]
        ],
        [
          #box(
            fill: rtech-blue,
            radius: 3pt,
            inset: (x: 8pt, y: 4pt),
            text(size: 8pt, weight: "bold", fill: white)[View Page 03 (Part 2) →]
          )
        ]
      )
    ]
  )
]

#pagebreak()


// =============================================================================
// PAGE 03: MASTER TABLE OF CONTENTS — PART 2 (Network Services, Cloud, Backup & Placement)
// =============================================================================
[#metadata("toc2") <toc-part2>]

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 3pt),
    text(size: 8pt, weight: "bold", fill: rtech-blue)[MASTER TABLE OF CONTENTS · PART 2 (CHAPTERS 08 TO 14 + APPENDIX) · PAGE 2 / 2]
  )
  #v(2.5pt)
  #text(size: 17pt, weight: "black", fill: rtech-navy)[Master Table of Contents — Part 2 (Chapters 08 to 14 + Appendix)]
  #v(2pt)
  #text(size: 8.2pt, fill: rtech-muted)[(Network Infrastructure, Storage Spaces, IIS 10.x, Hybrid Azure Arc, Disaster Recovery & MNC Interview Vault)]
  #v(4pt)
  #line(length: 100%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  radius: 6pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 9pt, y: 8pt),
  [
    #grid(
      columns: (1fr, auto),
      row-gutter: 8.5pt,
      align: (left, right + horizon),

      [#link(<chapter-8>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 08: DHCP Server Role: Scopes, Exclusions, Reservations & Failover]] \
       #text(size: 7.2pt, fill: rtech-muted)[DORA 4-Step Process · AD Authorization · IPv4 Scopes · Subnet Mask · Lease Duration · Exclusion Ranges · MAC Reservations · 80/20 Split-Scope vs Failover Cluster]],
      [#link(<chapter-8>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 35 →]]],

      [#link(<chapter-9>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 09: DNS Server Architecture: Forward/Reverse Zones, Records & Scavenging]] \
       #text(size: 7.2pt, fill: rtech-muted)[Enterprise DNS Role · AD-Integrated Zones · Forward vs Reverse Lookup · A, PTR, CNAME, MX & SRV Records · Root Hints vs Forwarders · Aging & Scavenging]],
      [#link(<chapter-9>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 39 →]]],

      [#link(<chapter-10>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 10: File Server Resource Manager (FSRM), NTFS Permissions & Quota Management]] \
       #text(size: 7.2pt, fill: rtech-muted)[Shared Folders · SMB 3.1.1 · Share vs NTFS Permissions (Most Restrictive Rule) · FSRM Role · Hard vs Soft Quota · Ransomware File Screening · Storage Reports]],
      [#link(<chapter-10>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 43 →]]],

      [#link(<chapter-11>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 11: IIS 10.x Web Server, Secure FTP & Remote Desktop Services (RDS)]] \
       #text(size: 7.2pt, fill: rtech-muted)[IIS 10.x Architecture · Internal Intranet Portal · SSL/TLS HTTPS Certificate Binding · Secure FTP User Isolation · Remote Desktop Services (RDS) Architecture]],
      [#link(<chapter-11>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 47 →]]],

      [#link(<chapter-12>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 12: Windows Server 2025 Next-Gen Features, ReFS & Hybrid Azure Arc]] \
       #text(size: 7.2pt, fill: rtech-muted)[5 Flagship Server 2025 Features · Hotpatching (Zero-Reboot Patching) · 32KB AD DB Page Size · Next-Gen S2D & ReFS Dedup · SMB over QUIC · Azure Arc Onboarding]],
      [#link(<chapter-12>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 50 →]]],

      [#link(<chapter-13>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 13: Enterprise Backup, Disaster Recovery & Active Directory Recycle Bin]] \
       #text(size: 7.2pt, fill: rtech-muted)[3-2-1 Enterprise Backup Strategy · Windows Server Backup · Full vs System State Backup · Enabling AD Recycle Bin · 1-Click Online Restore · `wbadmin` Scripting]],
      [#link(<chapter-13>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 53 →]]],

      [#link(<chapter-14>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Chapter 14: Top 50 MNC Systems Administrator Placement Vault & L1/L2 Scenarios]] \
       #text(size: 7.2pt, fill: rtech-muted)[L1/L2 Day-in-the-Life & Ticketing Tools (ServiceNow, Jira) · 50 Real MNC Technical Scenarios & Field Fixes (TCS, Wipro, Infosys) · Salary Blueprint]],
      [#link(<chapter-14>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 57 →]]],

      [#link(<appendix-academy>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[Appendix: RTechLab Systems & Infrastructure Academy, Author Profile & Blessings]] \
       #text(size: 7.2pt, fill: rtech-muted)[Message from Rahul Patel (Founder & Author) · Mission Statement · 24x7 Student Helpline · Commitment to Excellence]],
      [#link(<appendix-academy>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[Page 60 →]]]
    )
  ]
)

#v(4pt)
#pro-tip(title: "Smart 1-Tap Jump Navigation System")[
  Every page header in this master handbook contains an active embedded link to #text(weight: "bold", fill: rtech-blue)[⮌ Master Index]. You can return instantly to this Table of Contents from anywhere in the book.
]

#v(3pt)
#link(<table-of-contents>)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 4pt,
    inset: (x: 8pt, y: 4.5pt),
    align(center)[
      #text(size: 8pt, weight: "bold", fill: rtech-blue)[⮌ Return to Master Index Part 1 (Chapters 01 to 07 · Page 02)]
    ]
  )
]

#pagebreak()


