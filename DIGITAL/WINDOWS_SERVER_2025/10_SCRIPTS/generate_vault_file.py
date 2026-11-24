import os

header = """#import "../../07_PUBLISHING_ENGINE/server-theme.typ": *

#set document(
  title: "Windows Server 2025 Top 50 MNC Systems Administrator Interview Vault",
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
          [#text(size: 8pt, weight: "black", fill: rtech-navy)[RTECHLAB] #text(size: 8pt, fill: rtech-blue, weight: "bold")[ | Top 50 MNC Systems Administrator Interview Vault]],
          [#text(size: 7.5pt, fill: rtech-muted)[MNC Placement Vault · Rahul Patel]]
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
          [#text(size: 7pt, fill: rtech-muted)[#text(fill: rtech-emerald)[●] Tested at TCS, Wipro, Infosys, Cognizant, HCL & Accenture · L1/L2/L3 Technical Q&A]],
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#CBD5E1"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rtech-navy)[Page #p])]
        )
      ]
    }
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 8.2pt, fill: rtech-text)
#set par(justify: true, leading: 0.48em)

// ==================== COVER BLOCK ====================
#align(center)[
  #v(4pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), radius: 4pt, inset: (x: 10pt, y: 3.5pt), text(size: 7.8pt, weight: "bold", fill: rgb("#1D4ED8"))[RTECHLAB CORPORATE INTERVIEW PREPARATION SERIES])
  #v(6pt)
  #text(size: 19pt, weight: "black", fill: rtech-navy)[WINDOWS SERVER 2025 & ACTIVE DIRECTORY] \\
  #text(size: 15pt, weight: "black", fill: rtech-blue)[TOP 50 MNC SYSTEMS ADMINISTRATOR INTERVIEW VAULT]
  #v(3pt)
  #text(size: 9.5pt, weight: "bold", fill: rtech-teal)[High-Yield Technical Questions & Practical Field Answers · TCS, Infosys, Wipro, Cognizant, Accenture, HCL]
  #v(4pt)
  #line(length: 60%, stroke: 1.5pt + rtech-blue)
  #v(3pt)
  #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[Curated by: Rahul Patel] #text(size: 8pt, fill: rtech-muted)[(Founder & Chief Technology Architect, RTechLab · Helpline: +91 76468 92094)]
]

#v(6pt)

#info-box(title: "HOW TO USE THIS INTERVIEW VAULT")[
  This vault contains the 50 most frequently asked technical scenarios across MNC technical rounds for L1/L2 Systems Administrator and Windows Server Infrastructure roles. Rather than simple textbook definitions, each answer is structured with *exact administrative console paths (`dsa.msc`, `gpmc.msc`, `dnsmgmt.msc`)*, *PowerShell cmdlets*, and *underlying architectural troubleshooting logic*.
]

#v(6pt)

#let qa-card(num: 1, tag: "TCS / L1", q: "", a: "", tip: "") = {
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: 0.6pt + rgb("#CBD5E1"),
    radius: 4pt,
    inset: (x: 8pt, y: 6pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 6pt,
        align: (horizon, horizon),
        [
          #box(fill: rtech-blue, radius: 2.5pt, inset: (x: 5pt, y: 2pt), text(size: 7.2pt, weight: "bold", fill: white)[Q#num])
        ],
        [
          #box(fill: rgb("#EFF6FF"), stroke: 0.5pt + rgb("#BFDBFE"), radius: 2.5pt, inset: (x: 5pt, y: 1.5pt))[#text(size: 7pt, weight: "bold", fill: rgb("#1D4ED8"))[#tag]]
          #h(4pt)
          #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[#q]
        ]
      )
      #v(3pt)
      #text(size: 8.1pt, fill: rtech-text)[#a]
      #if tip != "" [
        #v(2.5pt)
        #block(fill: rgb("#F0FDF4"), stroke: (left: 2.5pt + rtech-emerald), inset: (x: 6pt, y: 2.5pt), radius: (right: 2pt))[
          #text(size: 7.5pt, weight: "bold", fill: rtech-emerald)[💡 Pro-Tip for Interview: ]
          #text(size: 7.5pt, fill: rtech-navy)[#tip]
        ]
      ]
    ]
  )
}
"""

questions = [
    # Domain 1: Active Directory & FSMO (1 to 10)
    (1, "TCS / L1-L2", "What is Active Directory Domain Services (AD DS) and why is it essential in an enterprise?",
     "AD DS is Microsoft's centralized directory service and identity store that stores information about network objects (users, computers, groups, printers) in a hierarchical database (`ntds.dit`). It provides centralized identity, single sign-on (SSO), Kerberos v5 authentication, and administrative policy delegation across the enterprise network.",
     "Always mention `ntds.dit` (the database file) and Kerberos v5 — interviewers want to see that you know the internal mechanisms, not just the marketing pitch."),

    (2, "Infosys / L2", "Name the 5 FSMO roles and explain the difference between Forest-wide and Domain-wide roles.",
     "The 5 Flexible Single Master Operation (FSMO) roles prevent multi-master update conflicts: Forest-Wide (1 per forest): 1. Schema Master (controls AD schema updates), 2. Domain Naming Master (governs adding/removing domains). Domain-Wide (1 per domain): 3. PDC Emulator (manages password updates, Kerberos sync, time sync), 4. RID Master (allocates pools of Relative IDs for new SIDs), 5. Infrastructure Master (translates cross-domain object GUIDs/SIDs).",
     "State that the PDC Emulator is the busiest FSMO role. To check FSMO roles in CLI, run `netdom query fsmo`."),

    (3, "Wipro / L2", "What is the difference between a Security Group and a Distribution Group?",
     "Security Groups can be assigned NTFS and share permissions to secure resources, and can also be used as distribution lists for email. Distribution Groups cannot be assigned security permissions or access control lists (ACLs) and are strictly utilized for broadcast email distribution lists in Exchange/Outlook.",
     "Mention the AGDLP principle: Accounts -> Global Groups -> Domain Local Groups -> Permissions."),

    (4, "Cognizant / L1", "A user account gets locked out repeatedly after 3 incorrect attempts. How do you investigate the root cause?",
     "1. In ADUC (`dsa.msc`), check user properties -> Account -> clear 'Unlock account'. 2. Check Security Event Log on the PDC Emulator DC for Event ID 4740 (Account Lockout) to identify the caller computer name/IP. 3. On the caller computer, check for cached credentials in Windows Credential Manager, stale mapped network drives, mobile phone Wi-Fi/email sync, or automated background services running under that user account.",
     "Event ID 4740 on the PDC is the gold standard answer that impresses MNC panel leads."),

    (5, "Accenture / L2", "What is the difference between Transferring vs Seizing a FSMO role?",
     "Transferring is a graceful, planned migration of a FSMO role between two online, communicating Domain Controllers using MMC snap-ins or `Move-ADDirectoryServerOperationMasterRole`. Seizing is an emergency, one-way takeover performed using `ntdsutil` or PowerShell (`-Force`) when the existing role holder DC suffers catastrophic hardware failure and will never come back online.",
     "Crucial warning: Once you seize Schema Master, RID Master, or Domain Naming Master, never bring the old offline DC back onto the network! It will cause USN rollback and database corruption."),

    (6, "HCL / L1-L2", "What happens when a client computer attempts to authenticate if the PDC Emulator DC is down?",
     "Normal user authentication continues because Active Directory is a multi-master database, meaning other Domain Controllers can authenticate logons. However: 1. Password changes cannot be immediately verified across DCs. 2. Account lockouts cannot be processed centrally. 3. Time synchronization via NTP will be interrupted.",
     "Clarify that user login does NOT stop, debunking a very common junior misconception!"),

    (7, "TCS / L2", "Explain the AGDLP strategy for managing enterprise group memberships.",
     "AGDLP stands for: Accounts go into Global groups (representing business roles, e.g., 'Finance-Dept'), Global groups go into Domain Local groups (representing resource access, e.g., 'DL-FinanceFolder-ReadWrite'), and Permissions (NTFS ACLs) are assigned to the Domain Local group. This prevents ACL bloat and maintains clean role-based access control.",
     "AGDLP is a top favorite question in TCS, Infosys, and Cognizant Level-2 interviews."),

    (8, "Infosys / L1", "How do you bulk create 200 users in Active Directory without manually clicking through ADUC?",
     "Prepare a CSV file with columns: `SamAccountName`, `GivenName`, `Surname`, `UserPrincipalName`, `Department`, `Path`. Then run the PowerShell cmdlet `Import-Csv 'C:\\users.csv' | ForEach-Object { New-ADUser -SamAccountName $_.SamAccountName -GivenName $_.GivenName -Surname $_.Surname -UserPrincipalName $_.UserPrincipalName -AccountPassword (ConvertTo-SecureString 'TempPass123!' -AsPlainText -Force) -Enabled $true -Path $_.Path }`.",
     "Mentioning `New-ADUser` with `Import-Csv` demonstrates that you are an automation-ready sysadmin."),

    (9, "Cognizant / L2", "What is Kerberos authentication and what are its key components?",
     "Kerberos is the default enterprise authentication protocol in Active Directory (port 88). Key components: 1. Key Distribution Center (KDC) hosted on Domain Controllers. 2. Authentication Service (AS) which issues Ticket Granting Tickets (TGT). 3. Ticket Granting Service (TGS) which grants Service Tickets for specific network resources. Mutual authentication prevents man-in-the-middle attacks.",
     "Remember: Kerberos requires strict time synchronization. If time delta exceeds 5 minutes, Kerberos fails!"),

    (10, "Wipro / L2", "What is an Organizational Unit (OU) vs a Container in Active Directory?",
     "An OU (Organizational Unit) can have Group Policy Objects (GPO) linked to it, and administrative permissions can be delegated over it. A default Container (like `CN=Users` or `CN=Computers`) cannot have GPOs directly linked to it and lacks full delegation capabilities. OUs have a folder icon with a book in ADUC.",
     "Mention that production best practice is to move new objects out of `CN=Computers` into custom corporate OUs."),

    # Domain 2: Group Policy & Security (11 to 20)
    (11, "TCS / L2", "Explain the LSDOU processing order in Group Policy Objects (GPO).",
     "GPOs are processed in the following deterministic sequence: 1. Local Policy -> 2. Site Policy -> 3. Domain Policy -> 4. Organizational Unit (OU) Policy (from parent OU down to child sub-OUs). The last processed GPO wins in case of conflicting settings, meaning a child OU policy takes precedence over a domain policy by default.",
     "LSDOU mnemonic is universally asked. Mention that Enforce overrides LSDOU."),

    (12, "Infosys / L2", "What is the difference between 'Block Inheritance' and 'Enforced' in Group Policy?",
     "'Block Inheritance' is applied at the OU level to prevent higher-level GPOs (Site, Domain, parent OU) from passing settings down to child objects. 'Enforced' (formerly 'No Override') is set on a specific GPO link; it forces the GPO settings to apply down the entire tree regardless of any Block Inheritance settings below.",
     "Enforced GPOs have a padlock icon in GPMC (`gpmc.msc`)."),

    (13, "Cognizant / L1-L2", "How do you deploy a GPO to block USB Mass Storage drives on all corporate client machines?",
     "1. Open GPMC (`gpmc.msc`). 2. Create and link a GPO to the Target Workstations OU (e.g., 'GPO-Sec-Block-USB'). 3. Navigate to: `Computer Configuration -> Policies -> Administrative Templates -> System -> Removable Storage Access`. 4. Enable: 'All Removable Storage classes: Deny all access'. 5. Execute `gpupdate /force` on clients to apply immediately.",
     "Mention you can exclude IT administrator groups using Security Filtering or WMI filtering."),

    (14, "Accenture / L2", "A user complains that a new GPO is not applying to their machine. What command line tools do you use to troubleshoot?",
     "1. Run `gpresult /r` in cmd/PowerShell to view applied and denied GPOs and security group memberships. 2. Run `gpresult /h C:\\gp-report.html` to generate a detailed HTML diagnostic report showing exact winning settings and failure reasons. 3. Check Event Viewer -> `Applications and Services Logs -> Microsoft -> Windows -> GroupPolicy -> Operational`.",
     "`gpresult /h` is the definitive corporate troubleshooting answer."),

    (15, "HCL / L1", "What does `gpupdate /force` do and how does it differ from a standard background GPO refresh?",
     "By default, Windows clients refresh GPOs in the background every 90 minutes with a randomized 0-30 minute offset, processing only modified policies. `gpupdate /force` forces the client to reapply ALL policies (both Computer and User) immediately from the Domain Controller, regardless of whether changes were made.",
     "Note: Software installation or folder redirection GPOs will prompt for a logout or reboot."),

    (16, "Wipro / L2", "What is WMI Filtering in Group Policy and when do you use it?",
     "WMI (Windows Management Instrumentation) Filtering allows administrators to dynamically restrict a GPO based on system hardware or OS attributes (e.g., `SELECT * FROM Win32_OperatingSystem WHERE Version LIKE '10.0.22%'`). It ensures a policy applies only to Windows 11 machines, or only to 64-bit laptops, within the same OU.",
     "WMI queries add a slight logon latency, so use sparingly in large production forests."),

    (17, "TCS / L2", "What is Microsoft LAPS (Local Administrator Password Solution)?",
     "LAPS automatically manages and rotates the password of the local administrator account on domain-joined computers. It sets a unique, complex, randomized password for each computer and securely stores it in a confidential attribute in Active Directory, mitigating Pass-the-Hash and lateral movement attacks across workstations.",
     "Windows Server 2025 has native built-in Windows LAPS with Azure Entra ID and AD DS integration."),

    (18, "Infosys / L1", "Where is the Default Domain Policy located and what should it be used for?",
     "The Default Domain Policy is linked at the root of the Domain and stored in the `SYSVOL` folder under its GUID (`{31B2F340-016D-11D2-945F-00C04FB984F9}`). It should ONLY be used for domain-wide Account Policies (Password Complexity, Minimum Password Length, Account Lockout Threshold) and Kerberos policies. Do not put desktop wallpaper or drive maps here!",
     "Best practice rule: Never clutter the Default Domain Policy. Create separate custom GPOs."),

    (19, "Cognizant / L2", "What is SYSVOL and what causes SYSVOL replication failure?",
     "SYSVOL is a shared folder present on all Domain Controllers (`C:\\Windows\\SYSVOL\\sysvol\\domain.com`) that stores GPO templates and login scripts. It is replicated across DCs using DFS-R (Distributed File System Replication). Replication fails due to: 1. DNS misconfiguration (SRV records). 2. Dirty shutdown causing DFS-R database corruption. 3. Port 135/445 firewall blockage.",
     "Event ID 2212 and 2213 in DFS-R logs indicate dirty shutdowns requiring non-authoritative recovery."),

    (20, "Accenture / L2", "What is GPO Loopback Processing Mode and when is it required?",
     "Normally, User Configuration GPOs follow the user account's OU. Loopback Processing Mode forces the user policies linked to the *Computer's* OU to apply to any user logging onto that specific machine. It is used on shared environments like Remote Desktop Session Hosts (RDS), Citrix terminal servers, and kiosk/lab PCs.",
     "Two modes: 'Replace' (discards user's normal GPOs) vs 'Merge' (combines computer-based user policies)."),

    # Domain 3: DNS, DHCP & Core Networking (21 to 30)
    (21, "TCS / L1", "Explain the DHCP DORA process step-by-step.",
     "DORA stands for: 1. Discover (Client broadcasts on UDP 67 to locate a DHCP server). 2. Offer (DHCP server broadcasts/unicasts on UDP 68 offering an IP address and lease terms). 3. Request (Client broadcasts accepting the specific offer). 4. Acknowledge (DHCP server confirms lease and transmits subnet mask, gateway, and DNS options).",
     "Mention DHCP ports: Server listens on UDP 67, Client listens on UDP 68."),

    (22, "Infosys / L2", "Why must a DHCP server be 'Authorized' in Active Directory?",
     "Authorization prevents 'Rogue DHCP servers' from distributing incorrect IP configurations or malicious gateways (Man-in-the-Middle attacks) to domain clients. When a Windows DHCP server starts, it queries Active Directory. If its IP is not listed in the authorized DHCP directory in AD DS, the DHCP service automatically disables itself.",
     "To authorize in PowerShell: `Add-DhcpServerInDC -DnsName dc01.corp.local -IPAddress 192.168.1.10`."),

    (23, "Wipro / L2", "What is the difference between an AD-Integrated DNS Zone and a Standard Primary Zone?",
     "An Active Directory-Integrated Zone stores DNS records inside the Active Directory database (`ntds.dit`), enabling multi-master updates across all Domain Controllers and automatic replication over existing AD replication topology with Kerberos encryption. A Standard Primary Zone stores records in a text file (`.dns`) on a single master server, creating a single point of failure.",
     "AD-Integrated zones also support Secure Dynamic Updates, blocking unauthorized record poisoning."),

    (24, "Cognizant / L1-L2", "What are the common DNS Record types and their specific roles?",
     "1. `A Record`: Maps hostname to IPv4 address. 2. `AAAA Record`: Maps hostname to IPv6 address. 3. `PTR Record`: Reverse lookup (maps IP address to FQDN). 4. `CNAME Record`: Canonical name (alias for another hostname). 5. `MX Record`: Mail Exchanger record for routing email. 6. `SRV Record`: Service locator record identifying servers hosting specific services (e.g., LDAP `_ldap._tcp.dc._msdcs`).",
     "Active Directory cannot function without SRV records; clients use them to locate Domain Controllers."),

    (25, "HCL / L1", "A domain client cannot resolve intranet server names. What command line steps do you take to troubleshoot?",
     "1. Check client IP config: `ipconfig /all` to verify assigned DNS server IP. 2. Test resolution: `nslookup filesrv.corp.local` to see which DNS server answers. 3. Flush client resolver cache: `ipconfig /flushdns`. 4. Test network connectivity: `ping <DNS-IP>` and test DNS port 53 via `Test-NetConnection -ComputerName <DNS-IP> -Port 53`. 5. Register DNS: `ipconfig /registerdns`.",
     "If `nslookup` returns `UnKnown server`, client is pointing to the wrong DNS server."),

    (26, "Accenture / L2", "What is DNS Scavenging and why is it critical in enterprise networks?",
     "Scavenging is the automated deletion of stale, obsolete DNS resource records left behind by de-provisioned or DHCP-leased machines. Without scavenging, DNS databases suffer from accumulation of orphan records, causing name resolution errors, IP conflicts, and replication bloat.",
     "Scavenging involves: 'No-refresh interval' (records cannot refresh) + 'Refresh interval' + Aging."),

    (27, "TCS / L2", "What is an 80/20 DHCP split scope vs DHCP Failover Clustering?",
     "The legacy 80/20 rule splits an IP pool across two servers (Server A holds 80%, Server B holds 20% with exclusions). In modern Windows Server (2012–2025), DHCP Failover is the standard: two servers share 100% of the scope in either 'Load Balancing' (50/50 active-active traffic distribution) or 'Hot Standby' (active-passive with instant lease state synchronization).",
     "Always recommend DHCP Failover with Hot Standby for high-availability enterprise designs."),

    (28, "Infosys / L1-L2", "What is a DHCP Reservation and how does it differ from a Static IP?",
     "A DHCP Reservation assigns a fixed, permanent IP address to a specific device based on its MAC (Hardware) address via the DHCP server, while the client machine remains configured for automatic DHCP. A Static IP is manually configured on the device's network adapter interface without DHCP server awareness.",
     "Reservations centralize IP management; if the default gateway changes, reservations update automatically!"),

    (29, "Cognizant / L2", "What are Root Hints vs DNS Forwarders?",
     "Root Hints are pre-configured IP addresses of the 13 authoritative internet root server clusters used as a last resort to resolve internet domains through iterative queries. Forwarders are specific external DNS servers (like ISP DNS or `8.8.8.8` / `1.1.1.1`) to which the local DNS server directly forwards unresolved public queries, reducing WAN bandwidth and speeding up resolution via external caching.",
     "Best practice: Configure Forwarders and keep Root Hints as an automated fallback."),

    (30, "Wipro / L2", "What happens when a domain client receives an APIPA IP address (169.254.x.x)?",
     "APIPA (Automatic Private IP Addressing) indicates that the client broadcasted DHCP Discover packets, but received NO response from any DHCP server on the local broadcast domain. The client assigns itself a link-local address in the `169.254.0.1` to `169.254.255.254` range, losing routing and internet connectivity.",
     "Immediate diagnostic: Check DHCP server status, DHCP scope exhaustion, or VLAN/switch port trunk issues."),

    # Domain 4: Storage, FSRM, IIS & Server 2025 (31 to 40)
    (31, "TCS / L2", "What is the difference between Share Permissions and NTFS Permissions?",
     "Share Permissions apply only when accessing files over the network (UNC path `\\\\server\\share`) and offer basic levels (Read, Change, Full Control). NTFS Permissions apply both locally and over the network, providing granular file-level security (Modify, Read & Execute, List Folder, Write).",
     "Golden Rule: The 'Most Restrictive' permission wins when both apply!"),

    (32, "Infosys / L2", "What is File Server Resource Manager (FSRM) and what are its core capabilities?",
     "FSRM is a Windows Server role service that enables administrators to manage and classify storage on file servers. Core features: 1. Quota Management (Hard and Soft storage limits). 2. File Screening (preventing users from saving MP3, AVI, or ransomware extensions). 3. Storage Reports (identifying duplicate or stale files).",
     "FSRM can send automated email notifications to IT when users hit 85% of their storage quota."),

    (33, "Cognizant / L2", "How do you configure FSRM to protect a file server against Ransomware?",
     "1. In FSRM, create a File Screen Group containing known ransomware extensions (e.g., `*.crypto`, `*.locky`, `*.wannacry`). 2. Create an Active File Screen on user shares. 3. Configure the command tab to run a PowerShell script that instantly disables the infected user's AD account and alerts the security operations team.",
     "Mention Active Screening (blocks file write) vs Passive Screening (audits/logs only)."),

    (34, "Accenture / L2", "Explain Hard Quota vs Soft Quota in FSRM.",
     "A Hard Quota strictly prohibits users from writing new files once the storage limit (e.g., 10 GB) is reached, returning an 'Out of disk space' error. A Soft Quota allows users to exceed the allocated limit without disruption, but generates event log warnings, administrative email alerts, and triggers automated storage reports.",
     "Soft quotas are ideal for capacity planning and monitoring department storage consumption."),

    (35, "HCL / L1-L2", "What is Internet Information Services (IIS) and how do you bind an SSL/TLS Certificate to a Website?",
     "IIS is Microsoft's enterprise web and application server hosting HTTP, HTTPS, and FTP services. To bind an SSL/TLS certificate: 1. In IIS Manager (`inetmgr`), select the Website. 2. Under Actions, click 'Bindings...' -> 'Add...'. 3. Select Type: `https`, Port: `443`. 4. Select the installed SSL certificate from the dropdown and click OK.",
     "Always ensure port 443 is allowed inbound in Windows Defender Firewall."),

    (36, "Wipro / L2", "What is Server 2025 Hotpatching and why is it a game-changer for enterprise infrastructure?",
     "Hotpatching allows Windows Server 2025 to apply security updates in-memory to running processes without requiring an operating system reboot. This eliminates monthly scheduled maintenance downtime windows, keeps mission-critical domain controllers and file servers online 24/7/365, and ensures zero interruption to enterprise workloads.",
     "Hotpatching requires Azure Arc enrollment and reduces planned reboots to quarterly baselines."),

    (37, "TCS / L2", "What is SMB over QUIC in Windows Server 2025?",
     "SMB over QUIC provides secure, zero-VPN file sharing for remote mobile workers over the internet. It encapsulates SMB 3.1.1 protocol traffic inside QUIC (UDP port 443) with mandatory TLS 1.3 encryption, replacing legacy insecure SMB over TCP 445 and eliminating the need for complex VPN client tunnels.",
     "Windows Server 2025 Standard and Datacenter now support SMB over QUIC natively."),

    (38, "Infosys / L2", "What is the new Active Directory Database Page Size in Windows Server 2025?",
     "Windows Server 2025 introduces a 32 KB database page size for `ntds.dit` (upgraded from the legacy 8 KB page size used since Windows 2000). This eliminates the 2 MB object size ceiling, supports multi-valued attributes up to 10,000+ entries, and drastically boosts directory performance and replication throughput.",
     "This is a flagship feature of Windows Server 2025 that only high-caliber sysadmins know!"),

    (39, "Cognizant / L2", "What is Azure Arc and how does it connect on-premises Windows Server 2025 to the cloud?",
     "Azure Arc is a hybrid management bridge that projects on-premises physical and virtual servers into Azure Resource Manager (ARM) using the Connected Machine Agent. It allows administrators to manage on-prem servers from the Azure Portal, apply Azure Policy baselines, monitor logs via Azure Monitor, and automate Hotpatching.",
     "Azure Arc bridges traditional on-prem Windows Server sysadmins into high-income Hybrid Cloud roles."),

    (40, "Accenture / L2", "What is ReFS (Resilient File System) Deduplication and Compression in Server 2025?",
     "ReFS is Microsoft's next-generation file system designed for maximum data availability and integrity. In Windows Server 2025, native ReFS Data Deduplication and Compression identifies duplicate data blocks across virtual hard disks (VHD/VHDX) and file shares, freeing up to 60-80% of enterprise storage space without performance penalty.",
     "ReFS also features automated data scrubbing that self-heals corrupted bit-rot blocks in real time."),

    # Domain 5: Disaster Recovery & Incident Scenarios (41 to 50)
    (41, "TCS / L2-L3", "An administrator accidentally deletes an Organizational Unit (OU) containing 50 users. How do you recover it in under 2 minutes?",
     "If Active Directory Recycle Bin is enabled: 1. Open Active Directory Administrative Center (`dsac.exe`). 2. Navigate to the Deleted Objects container. 3. Locate the deleted OU, right-click, and select 'Restore'. 4. Select the deleted user accounts and click 'Restore'. All objects, group memberships, SIDs, and password hashes are instantly restored online without rebooting or taking down the DC.",
     "In PowerShell: `Get-ADObject -Filter 'isDeleted -eq $true' -IncludeDeletedObjects | Restore-ADObject`."),

    (42, "Infosys / L2", "What is the 3-2-1 Enterprise Backup Rule?",
     "The 3-2-1 rule dictates: Keep at least 3 copies of your critical enterprise data, stored on 2 different storage media types (e.g., local server RAID and separate NAS/tape), with at least 1 copy stored securely offsite or in cloud immutable storage (like Azure Blob Storage) to protect against ransomware or physical facility disasters.",
     "Every senior infrastructure architect quotes the 3-2-1 rule in disaster recovery interviews."),

    (43, "Wipro / L2", "What is a System State Backup and what components does it include on a Domain Controller?",
     "A System State Backup captures all vital OS and directory configuration databases required to rebuild a server to its exact working state. On a Domain Controller, it contains: 1. Active Directory database (`ntds.dit`). 2. SYSVOL folder. 3. System Registry. 4. Boot files and system startup files. 5. COM+ Class Registration database. 6. Certificate Services database (if installed).",
     "Use `wbadmin start systemstatebackup -backupTarget:E:` in command prompt or PowerShell."),

    (44, "Cognizant / L2", "What is Authoritative Restore vs Non-Authoritative Restore in Active Directory?",
     "Non-Authoritative Restore is the default: when a DC is restored from backup, it replicates the latest changes from other active DCs in the domain. Authoritative Restore is used when an object was accidentally deleted across all DCs: the administrator boots into DSRM (Directory Services Restore Mode), restores the backup, and uses `ntdsutil` to increment the USN (Update Sequence Number) of the deleted object so it replicates out to all other DCs as the authoritative winning copy.",
     "Authoritative restore is performed using `ntdsutil` inside DSRM mode."),

    (45, "HCL / L1-L2", "What is DSRM (Directory Services Restore Mode) and when do you use it?",
     "DSRM is a safe-mode boot state for Windows Server Domain Controllers where the Active Directory database (`ntds.dit`) is taken offline. It is used to perform maintenance operations, database defragmentation (`esentutl`), authoritative restores, or recovery when the AD database is corrupted. The DSRM password is set during initial DC promotion.",
     "To reset a forgotten DSRM password without rebooting, run `ntdsutil -> set dsrm password`."),

    (46, "Accenture / L2", "How do you verify Active Directory replication health between multiple Domain Controllers?",
     "Run `repadmin /replsummary` to get a high-level summary of replication errors and delta times across all DCs in the forest. To perform a detailed check on a specific DC, run `repadmin /showrepl`. Event IDs 1311, 1864, or 2042 in the Directory Service event log indicate replication failures requiring immediate investigation.",
     "`repadmin /replsummary` is the single most important health-check command in enterprise AD."),

    (47, "TCS / L1", "A user cannot log in and gets 'The trust relationship between this workstation and the primary domain failed'. How do you resolve this?",
     "This occurs when the computer account's secure channel password in Active Directory does not match the local computer's stored password (often due to restoring a VM snapshot or machine being offline for >30 days). Fix: 1. Log in using local administrator credentials. 2. Open PowerShell as Admin and run `Reset-ComputerMachinePassword -Credential (Get-Credential)`. Alternatively, unjoin from domain to workgroup and rejoin.",
     "`Reset-ComputerMachinePassword` fixes the issue in 10 seconds without rebooting or unjoining!"),

    (48, "Infosys / L2", "What is a USN Rollback and why is restoring a virtual Domain Controller snapshot dangerous?",
     "Every AD transaction increments an Update Sequence Number (USN). If an administrator reverts a virtual DC snapshot, the DC's USN goes backward in time while other DCs have advanced. When the reverted DC attempts to replicate, replication halts to prevent database inconsistency, isolating the DC in a 'USN Rollback' quarantine state.",
     "Server 2025 has VM-GenerationID protection, but snapshots should NEVER replace supported backups!"),

    (49, "Cognizant / L2", "How do you automate daily backups of Windows Server using PowerShell and Task Scheduler?",
     "1. Create a script `Backup.ps1` using the Windows Server Backup module: `wbadmin start backup -backupTarget:E: -include:C: -allCritical -systemState -quiet`. 2. Open Task Scheduler (`taskschd.msc`). 3. Create a task running under `NT AUTHORITY\\SYSTEM` with highest privileges triggered daily at 02:00 AM. 4. Action: `powershell.exe -ExecutionPolicy Bypass -File C:\\Scripts\\Backup.ps1`.",
     "Always verify backup exit codes and configure automated email alerts on failure."),

    (50, "Wipro / L2", "Describe your step-by-step approach when an entire department reports network and server outage on Monday morning.",
     "1. *Triage & Scope*: Check if issue is isolated to one floor, switch, or entire building. 2. *Physical & Layer 1*: Verify switch power, uplink cables, and server room lights. 3. *Core Services (DHCP/DNS)*: Check if clients have valid IPs or APIPA (`169.254.x.x`), test DNS resolution with `nslookup`. 4. *Domain Controller*: Check DC accessibility, ping gateway, verify AD DS and DNS services are running. 5. *Communication*: Update IT service desk (ServiceNow) with an initial broadcast acknowledging the issue, estimated resolution time, and root-cause action.",
     "This situational question tests your ITIL troubleshooting mindset, composure, and communication.")
]

footer = """
#v(8pt)
#pro-tip(title: "RAHUL PATEL'S FINAL INTERVIEW STRATEGY")[
  Remember: MNC technical panels do not expect you to remember every obscure syntax, but they strictly evaluate whether you have *hands-on troubleshooting logic*. When answering, always describe what you would verify first (Event Logs, Network Connectivity, DNS), state the exact tool or console you would use (`dsa.msc`, `gpmc.msc`, `repadmin`), and explain how you would confirm the fix.

  For mock interviews, resume screening, or personal guidance, reach out to *Rahul Patel* directly on our 24x7 Student Helpline: *+91 76468 92094* (WhatsApp) or *rahul.28e1\\@gmail.com*.
]
"""

output_path = "DIGITAL/WINDOWS_SERVER_2025/04_INTERVIEW_AND_QUESTION_VAULT/source/Windows-Server-2025-Top-50-MNC-Interview-Vault.typ"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(header)
    for q in questions:
        num, tag, q_text, a_text, tip = q
        card = f'\n#qa-card(num: {num}, tag: "{tag}", q: "{q_text}", a: "{a_text}", tip: "{tip}")\n'
        f.write(card)
        if num in [5, 10, 15, 20, 25, 30, 35, 40, 45]:
            f.write("\n#pagebreak()\n")
    f.write(footer)

print(f"Generated {output_path} with 50 questions!")
