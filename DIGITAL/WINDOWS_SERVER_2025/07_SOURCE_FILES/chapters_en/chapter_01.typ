// =============================================================================
// CHAPTER 01: INTRODUCTION, ARCHITECTURE, TYPES & EVOLUTION
// =============================================================================

[#metadata("ch1") <chapter-1>]

#chapter-header(
  chapter-num: "CHAPTER 01",
  category: "PART 1: Foundation Theory & Architecture",
  title: "Server Architecture, Server Types & 32-Year Evolution of Windows Server",
  subtitle: "Client-Server Model · 8 Primary Server Types · Physical vs Virtual vs Azure Arc Hybrid · Complete Evolution from 1993 to 2025"
)

#v(1.5pt)

=== 1.1 What is a Server? (Core Architecture)
The distinction between an everyday personal computer and an enterprise server is not merely a matter of hardware specifications, but fundamentally defined by its #hl-yellow[Role and Availability].

#mark-yellow[A server is a high-performance central computer or software program engineered to continuously deliver services, network resources, data, and security policies to client computers across an enterprise network 24 hours a day, 7 days a week (24/7/365).]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "Definition of a Client")[
      A client is an end-user workstation, laptop, or mobile endpoint that initiates a service request (#hl-green[Request]) to a server over the network. Common examples: your web browser, Microsoft Outlook email client, or File Explorer.
    ]
  ],
  [
    #info-box(title: "Definition of a Server")[
      A server is a dedicated central system that continuously listens for incoming client requests (#hl-green[Listening on Ports]), authenticates the requestor, and returns the appropriate service response (#hl-green[Response]).
    ]
  ]
)

#v(1pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/client_server_architecture.png", width: 55%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 1.1: Enterprise Client-Server Network Architecture — Central Active Directory, Core Switching, and Client Endpoints]
]

#v(1.5pt)

=== 1.2 The 8 Primary Server Roles Deployed in Corporate Networks
In any multinational corporation (MNC) or financial institution, no single machine handles every service. Enterprise workloads are segmented across specialized server roles:

1. #text(weight: "bold", fill: rtech-navy)[Domain Controller (AD DS):] Serves as the central identity authority of the entire enterprise. User credentials, password policies, computer trust accounts, and security baselines are authenticated here. #hl-green[Ports: 88 (Kerberos), 389 (LDAP)].
2. #text(weight: "bold", fill: rtech-navy)[File & Storage Server:] Centralizes enterprise data storage. Compartmentalized access permissions for departments (HR, Finance, Engineering) are enforced via NTFS and SMB shares. #hl-green[Port: 445 (SMB)].
3. #text(weight: "bold", fill: rtech-navy)[Web Server (IIS / Apache):] Hosts internal corporate intranets, public web portals, REST APIs, and enterprise web applications. #hl-green[Ports: 80 (HTTP), 443 (HTTPS)].
4. #text(weight: "bold", fill: rtech-navy)[Database Server (MS SQL / Oracle):] Processes relational databases, banking ledgers, customer records (CRM), and transactional ERP datasets. #hl-green[Port: 1433 (SQL Server)].
5. #text(weight: "bold", fill: rtech-navy)[DNS Server (Domain Name System):] Resolves human-readable hostnames (e.g., `portal.rtechlab.local`) into routable IP addresses (`192.168.1.50`). #hl-green[Port: 53 (UDP/TCP)].
6. #text(weight: "bold", fill: rtech-navy)[DHCP Server (Dynamic Host Configuration Protocol):] Automatically allocates and leases IP configurations, default gateways, and subnet masks to joining endpoints. #hl-green[UDP Ports: 67, 68].
7. #text(weight: "bold", fill: rtech-navy)[Mail Server (Exchange Server):] Manages enterprise email routing, mailbox databases, message hygiene, and calendar scheduling. #hl-green[Ports: 25 (SMTP), 587, 993 (IMAP)].
8. #text(weight: "bold", fill: rtech-navy)[Proxy & Security Gateway (Firewall Server):] Filters outbound corporate internet access, enforces content security policies, and blocks unauthorized web destinations. #hl-green[Port: 8080].

#v(1pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/types_of_servers_infographic.png", width: 55%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 1.2: 8 Major Enterprise Server Types, Operational Roles, and Default IANA Port Numbers]
]

#v(1.5pt)

=== 1.3 Physical Bare-Metal vs Virtual Machines vs Cloud Servers (Azure & Hybrid)
Modern enterprise infrastructure utilizes three primary paradigms for server operating system deployment:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/physical_virtual_cloud_comparison.png", width: 55%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 1.3: Three Server Deployment Paradigms — Physical Bare-Metal, Hyper-V Virtualization, and Azure Hybrid Cloud]
]

#v(1pt)

- #text(weight: "bold", fill: rtech-navy)[1. Physical Server (On-Premises Bare-Metal):] The operating system is deployed directly on physical enterprise hardware (such as Dell PowerEdge or HPE ProLiant rack servers). Ideal for ultra-heavy monolithic databases, but results in severe hardware underutilization and high power footprints.
- #text(weight: "bold", fill: rtech-navy)[2. Virtual Machines (Hyper-V / VMware ESXi):] A Type-1 bare-metal hypervisor divides physical compute resources into 10 to 30 independent virtual machines, ensuring over 85% hardware resource efficiency and instant snapshot rollbacks.
- #text(weight: "bold", fill: rtech-navy)[3. Microsoft Azure & Hybrid Cloud (Azure Arc):] #mark-green[The defining breakthrough of Windows Server 2025 is native Azure Arc onboarding.] On-premises physical and virtual servers can be managed through Azure Resource Manager, enabling centralized compliance policies and #hl-yellow[Hotpatching] (applying security updates directly in memory without rebooting the server)!

#v(1.5pt)

=== 1.4 The 32-Year Evolution of Windows Server (1993 to 2025)
Microsoft launched its first 32-bit server operating system in 1993 under the name Windows NT 3.1 Advanced Server. Over three decades culminating in Windows Server 2025, it has evolved into the world's premier enterprise operating system:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_evolution_timeline.png", width: 55%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 1.4: Windows Server 32-Year Historical Evolution Timeline — From NT 4.0 to Modern Server 2025]
]

#v(1pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[Key Historical Milestones:]\
    - #text(weight: "bold", fill: rtech-blue)[Windows NT 4.0 (1996):] First introduced the familiar Windows 95 graphical user interface, PDC/BDC domain trust architecture, and WINS naming services.
    - #text(weight: "bold", fill: rtech-emerald)[Windows 2000 Server (2000):] #hl-yellow[The watershed year!] Debut of Active Directory (AD DS), dynamic DNS integration, Kerberos authentication, and Group Policy Objects (GPO).
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2008 / R2 (2008):] Launched the modern virtualization era with #hl-green[Microsoft Hyper-V], PowerShell scripting, and the minimal-footprint #hl-orange[Server Core] edition.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2012 / R2 (2012):] Introduced the modern Server Manager dashboard, Storage Spaces, and high-performance SMB 3.0 protocol enhancements.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2016 (2016):] Debut of Windows Containers (Docker support), Nano Server, and hyper-converged Storage Spaces Direct (S2D).
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2019 (2019):] Web-based Windows Admin Center (WAC), System Insights predictive analytics, and hybrid cloud integration.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2022 (2022):] Secured-Core Server hardware security, default TLS 1.3 encryption, and SMB over QUIC for boundaryless remote access.
    - #text(weight: "bold", fill: rtech-blue)[Windows Server 2025 (Latest Flagship):] #hl-yellow[Hotpatching for All] (zero-reboot servicing), #hl-yellow[32KB Active Directory database page size] (first major AD query performance leap in 25 years), next-gen Storage Spaces Direct deduplication and compression, and native Wi-Fi support.
  ]
)

#v(1.5pt)

=== 1.5 Client OS (Windows 11) vs Server OS (Windows Server 2025)
Novice administrators often ask: *"If both Windows 11 and Server 2025 share the common Windows NT kernel, why can't we simply use Windows 11 as a server?"*

At the architectural kernel level, substantial internal differences distinguish the two platforms:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/windows_client_vs_server_architecture.png", width: 55%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 1.5: Architectural Comparison — Windows 11 Pro vs Windows Server 2025 Datacenter]
]

#v(1pt)

#warning-box(title: "Hard-Coded Inbound Network Connection Limit (Interview Trap)")[
  In Windows 11 or Windows 10, the operating system kernel imposes a strict hard-coded limit of #hl-orange[only 20 concurrent inbound connections]. When a 21st computer attempts to connect to a file share or print spooler, the connection is instantly rejected with a network error. In contrast, Windows Server 2025 permits #hl-green[unlimited concurrent network connections] limited only by available system hardware.
]

#v(1.5pt)

=== 1.6 The 3 Core Editions of Windows Server 2025 (Editions Comparison)
1. #text(weight: "bold", fill: rtech-navy)[Essentials Edition:] Built for small offices with up to 25 users and 50 devices. Does not require user-based Client Access Licenses (CALs).
2. #text(weight: "bold", fill: rtech-navy)[Standard Edition:] Designed for physical environments or lightly virtualized infrastructure. Utilizes core-based licensing and allows up to #hl-green[2 Virtual Machines (VMs)] per fully licensed host.
3. #text(weight: "bold", fill: rtech-navy)[Datacenter Edition:] Engineered for enterprise datacenters, private cloud deployments, and hyper-converged infrastructure (HCI). Includes #mark-green[unlimited virtual machines], Storage Spaces Direct (S2D), and Shielded Virtual Machines.

#v(1pt)

// =============================================================================
// CHAPTER 01 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  From Windows 2000 Server through Windows Server 2022, the internal database page size of Active Directory's core database file (#hl-yellow[`ntds.dit`]) remained fixed at #text(weight: "bold")[8 KB] for 25 continuous years. In Windows Server 2025, Microsoft increased this page size to #text(weight: "bold")[32 KB], delivering an over 300% query performance acceleration in enterprise environments with high-volume directory operations!
]

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 01 Practice Multiple Choice Questions (MCQs)]
#v(1.5pt)

#mcq-item(
  num: "1",
  q: "In which Windows Server edition were Active Directory Domain Services (AD DS) and Group Policy first introduced?",
  optA: "Windows NT 4.0",
  optB: "Windows 2000 Server",
  optC: "Windows Server 2003",
  optD: "Windows Server 2008",
  ans: "B",
  exp: "Active Directory Domain Services and Group Policy debuted in the year 2000 with the landmark release of Windows 2000 Server."
)

#v(1.5pt)

#mcq-item(
  num: "2",
  q: "What is the hard-coded maximum concurrent inbound network connection limit in a client operating system like Windows 11?",
  optA: "10 Connections",
  optB: "20 Connections",
  optC: "100 Connections",
  optD: "Unlimited",
  ans: "B",
  exp: "Desktop client editions of Windows enforce a kernel-level licensing limit of at most 20 concurrent inbound network connections."
)

#v(1.5pt)

#mcq-item(
  num: "3",
  q: "Which breakthrough feature of Windows Server 2025 enables security updates to be applied in volatile memory without rebooting the server?",
  optA: "Storage Spaces Direct",
  optB: "Hotpatching",
  optC: "Hyper-V Live Migration",
  optD: "DirectAccess",
  ans: "B",
  exp: "Hotpatching patches binaries in active memory, eliminating reboot downtime for monthly cumulative security servicing."
)

#v(1.5pt)

#mcq-item(
  num: "4",
  q: "What was the default Active Directory (ntds.dit) database page size from Windows 2000 to Server 2022, and what is it in Server 2025?",
  optA: "Increased from 4 KB to 16 KB",
  optB: "Increased from 8 KB to 32 KB",
  optC: "Increased from 16 KB to 64 KB",
  optD: "Increased from 32 KB to 128 KB",
  ans: "B",
  exp: "Server 2025 upgrades the legacy 8 KB page size to 32 KB, boosting complex LDAP query speeds by up to 300%."
)

#v(1.5pt)

#mcq-item(
  num: "5",
  q: "How many virtual machine operating system environments (VMs) are licensed under a standard Windows Server 2025 Standard edition license on a licensed host?",
  optA: "Only 1 VM",
  optB: "Maximum 2 VMs",
  optC: "Maximum 8 VMs",
  optD: "Unlimited VMs",
  ans: "B",
  exp: "Windows Server 2025 Standard grants rights to run up to 2 virtual machines per fully licensed host, whereas Datacenter grants unlimited VMs."
)

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Vault (High-Yield Questions)]
#v(1.5pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'What is the fundamental difference between the thread scheduler in a Client OS (Windows 11) and a Server OS (Server 2025)?'",
  a: "Answer: A Client OS thread scheduler prioritizes 'Foreground Interactive Applications' (such as web browsers, office productivity apps, and media) to ensure zero UI latency for the local user. In contrast, a Server OS kernel scheduler prioritizes 'Background Services, System Processes, and Network I/O', ensuring hundreds of simultaneous remote client requests are processed without queue starvation.",
  tip: "A classic question frequently asked in L1/L2 Desktop Support and Systems Administrator screening at Wipro and Infosys."
)

#v(1.5pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'From a licensing perspective, what is the single most critical difference between Windows Server 2025 Standard and Datacenter editions?'",
  a: "Answer: Standard edition licenses allow running a maximum of 2 virtual machine instances (VMs) on the licensed physical host. In contrast, Datacenter edition permits running an unlimited number of Windows Server virtual machines on the licensed physical host, making it the industry standard for virtualization and cloud datacenters.",
  tip: "A foundational requirement for enterprise virtualization architects and infrastructure administrators alike."
)

#v(1.5pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'What direct enterprise performance advantage does the new 32KB AD DS database page size provide in Windows Server 2025?'",
  a: "Answer: For 25 years, the ntds.dit database used an 8 KB page size. The 32 KB page size in Windows Server 2025 allows up to four times more directory data to be loaded in a single disk I/O operation. In large enterprise forests with thousands of accounts, this reduces disk thrashing and improves Kerberos authentication and LDAP query throughput by up to 300%.",
  tip: "Demonstrating knowledge of 32KB AD architecture instantly establishes your elite technical credentials in L2/L3 MNC interviews."
)

#v(1.5pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'What is Azure Arc and how does it bridge on-premises Windows Servers into the Microsoft cloud?'",
  a: "Answer: Azure Arc acts as an enterprise bridge that registers physical and virtual servers hosted in on-premises datacenters or branch offices directly with Azure Resource Manager. This allows administrators to manage on-premises Windows Servers as native Azure resources, governing them with unified Azure Policy, Defender for Cloud, Log Analytics, and Hotpatching without requiring data migration.",
  tip: "Extremely relevant for hybrid cloud administrator roles at TCS, Accenture, and Cognizant."
)

#v(1pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 01 Key Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - Enterprise servers are architected and optimized to process 24/7/365 background services and high-concurrency client requests.
      - Active Directory was born in Windows 2000 Server; Windows Server 2025 represents its most advanced iteration with 32KB pages and Hotpatching.
      - Production enterprise deployments favor Server Core for its reduced attack surface, while Desktop Experience is preferred in learning labs.
    ]
  ]
)

#pagebreak()
