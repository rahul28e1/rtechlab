// =============================================================================
// CHAPTER 04: ACTIVE DIRECTORY DOMAIN SERVICES & DOMAIN CONTROLLER PROMOTION
// =============================================================================

[#metadata("ch4") <chapter-4>]

#chapter-header(
  chapter-num: "CHAPTER 04",
  category: "PART 4: Centralized Identity & Directory Services",
  title: "Active Directory Domain Services (AD DS) & Domain Controller Promotion",
  subtitle: "AD DS Core Architecture · Logical (Forest, Domain, OU) & Physical (Sites) Hierarchy · Add Roles Wizard · Root DC (corp.rtechlab.local) · DSRM Password · 5 FSMO Roles"
)

=== 4.1 What is Active Directory Domain Services? (Core Architecture)
In a legacy, unmanaged peer-to-peer Workgroup network, every computer maintains its own isolated local security database known as the SAM (Security Accounts Manager). If an organization employs 500 computers and onboards a new employee, an IT administrator would literally have to walk to all 500 machines to manually create that user account!

#mark-yellow[Active Directory Domain Services (AD DS) is Microsoft's distributed, centralized directory service that stores, organizes, and secures authentication credentials and access privileges for all users, computers, groups, and peripheral resources across an entire enterprise within a single master database.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "Directory Objects & The Schema")[
      Within Active Directory, every discrete network entity is represented as an #hl-yellow[Object] (e.g., User, Computer, Printer, Security Group). Objects possess properties termed #hl-green[Attributes] (e.g., GivenName, Mail, UserPrincipalName). The formal blueprint defining valid object classes and attributes is called the #hl-orange[Schema].
    ]
  ],
  [
    #info-box(title: "The Global Catalog (GC)")[
      A Global Catalog is an authoritative Domain Controller that maintains a distributed, partial attribute set (PAS) of all objects across every domain in the forest. It enables rapid, cross-domain directory searches and Universal Group membership resolution. #hl-green[Port: 3268 (LDAP GC)].
    ]
  ]
)

#v(4pt)

=== 4.2 AD Logical Architecture: Forest, Tree, Domain & OUs
The logical architecture of Active Directory dictates how network resources are organized for delegated administration and policy application:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ad_hierarchy_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 4.1: Active Directory Logical Hierarchy — Forest Root, Child Domains, Trees, and Organizational Units (OUs)]
]

#v(4pt)

1. #text(weight: "bold", fill: rtech-navy)[Forest:] The ultimate security boundary of Active Directory. All domains within a forest share a single common Schema, an overarching Global Catalog, and a unified Configuration partition.
2. #text(weight: "bold", fill: rtech-navy)[Tree:] A hierarchical grouping of one or more domains that share a contiguous DNS namespace (e.g., `rtechlab.local` and `delhi.rtechlab.local`).
3. #text(weight: "bold", fill: rtech-navy)[Domain:] The fundamental administrative and security boundary within a forest. In our lab, our root domain is designated as #hl-yellow[`corp.rtechlab.local`].
4. #text(weight: "bold", fill: rtech-navy)[Organizational Unit (OU):] A subdivision container created within a domain. Administrators structure OUs by department, function, or location to delegate administrative privileges and link Group Policy Objects (GPOs).

#v(6pt)

=== 4.3 AD Physical Architecture: Domain Controllers, Sites & Subnets
While the logical structure governs *how resources are grouped administratively*, the physical architecture governs *how directory data replicates across physical network circuits and hardware*:

- #text(weight: "bold", fill: rtech-blue)[Domain Controller (DC):] A physical or virtual server running the AD DS role that hosts a read-write replica of the Active Directory database (#hl-yellow[`ntds.dit`]).
- #text(weight: "bold", fill: rtech-navy)[Active Directory Sites:] Logical representations of high-speed, well-connected IP subnets (such as 'Mumbai-HQ Site' and 'Bangalore-Branch Site'). Sites govern inter-site WAN replication schedules, compress directory traffic over low-bandwidth links, and direct clients to the geographically closest DC during authentication.

#v(6pt)

=== 4.4 Hands-On Lab: Installing the AD DS Server Role via Wizard
We will now install the Active Directory Domain Services role on our prepared virtual machine `SRV-2025-DC01`:

1. Launch Server Manager, click the #hl-green['Manage'] menu at the top-right corner, and select #hl-yellow['Add Roles and Features'].
2. On the 'Before You Begin' page, click 'Next'.
3. For Installation Type, select #hl-yellow['Role-based or feature-based installation'] and click 'Next'.
4. Under Server Selection, verify that your machine #hl-green[`SRV-2025-DC01 (192.168.1.10)`] is highlighted in the server pool, then click 'Next'.
5. In the Server Roles tree, check the box for #mark-yellow[Active Directory Domain Services].
6. In the pop-up dialog 'Add features that are required for Active Directory Domain Services' (which includes RSAT administration tools), click #hl-green['Add Features'], then click 'Next'.
7. On the Features page, retain the default selections and click 'Next'.
8. On the Confirmation page, leave 'Restart the destination server automatically if required' unchecked and click #hl-green['Install'].
9. The role installation will conclude in approximately 2 to 3 minutes. Click 'Close'.

#v(6pt)

=== 4.5 Hands-On Lab: Promoting the Server to a Root Domain Controller
Installing the role binaries does not automatically make the server a Domain Controller. It must be formally promoted:

1. Click the yellow notification flag (#text(weight: "bold", fill: rtech-amber)[⚠️ Notification Flag]) at the top of Server Manager.
2. Click the highlighted blue action link: #mark-green[Promote this server to a domain controller].
3. #text(weight: "bold")[Deployment Configuration:] Because this is our first domain, select the third radio button: #hl-yellow['Add a new forest'].
   - In the Root domain name field, type: #hl-green[`corp.rtechlab.local`]. Click 'Next'.
4. #text(weight: "bold")[Domain Controller Options:]
   - Forest & Domain functional levels: Set to #hl-green[Windows Server 2025] (unlocking modern directory security algorithms).
   - Ensure 'Domain Name System (DNS) server' and 'Global Catalog (GC)' remain checked.
   - #text(weight: "bold", fill: rtech-navy)[Directory Services Restore Mode (DSRM) Password:] This is the emergency master recovery password used when restoring AD databases offline. Assign a strong recovery password (e.g., #hl-green[`Dsrm@2025!`]). Click 'Next'.
5. #text(weight: "bold")[DNS Options:] A warning stating 'A delegation for this DNS server cannot be created...' will appear. This is normal in private top-level domains; ignore it and click 'Next'.
6. #text(weight: "bold")[Additional Options:] The wizard automatically derives the legacy NetBIOS domain name: #hl-yellow[`CORP`]. Click 'Next'.
7. #text(weight: "bold")[Paths:] Retain the default directory storage paths for the database, log files, and SYSVOL (`C:\Windows\NTDS` and `C:\Windows\SYSVOL`). Click 'Next'.
8. #text(weight: "bold")[Prerequisites Check:] The system validates all deployment baselines. A green banner will confirm: #hl-green['All prerequisite checks passed successfully'].
9. Click the #mark-green[Install] button at the bottom of the wizard!
10. The installer configures AD DS, writes directory partitions, and automatically initiates a system reboot. Upon restart, the logon screen displays: #hl-yellow[`CORP\Administrator`]. Your enterprise Domain Controller is now live!

#v(6pt)

=== 4.6 The 5 FSMO Master Roles Architecture
Although Active Directory utilizes a multi-master replication model (allowing objects to be authored on any DC), five specialized operations require strict single-master coordination to prevent database corruption and replication collision. These are termed #hl-yellow[FSMO (Flexible Single Master Operations)] roles:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/fsmo_roles_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 4.2: FSMO 5 Master Roles Architecture — 2 Forest-Wide and 3 Domain-Wide Operations Roles]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[FSMO Role Architecture Reference (MNC Interview Vault):]\
    - #text(weight: "bold", fill: rtech-blue)[Forest-Wide Roles (Exactly 1 DC per Forest):]
      1. #text(weight: "bold")[Schema Master:] Coordinates all schema modifications, additions, and class/attribute updates across the entire forest (e.g., during Exchange or Lync schema prep).
      2. #text(weight: "bold")[Domain Naming Master:] Authorizes the creation, renaming, or decommission of domains and application directory partitions within the forest.
    - #text(weight: "bold", fill: rtech-emerald)[Domain-Wide Roles (Exactly 1 DC per Domain):]
      3. #text(weight: "bold")[PDC Emulator (Most Critical Role):] Serves as the authoritative domain master for Kerberos password updates, immediate lockout processing, authoritative NTP time synchronization, and Group Policy editing.
      4. #text(weight: "bold")[RID Master (Relative ID Master):] Allocates pools of 500 Relative Identifiers (RIDs) to each Domain Controller, ensuring security principals (Users, Groups, Computers) never receive duplicate Security Identifiers (SIDs).
      5. #text(weight: "bold")[Infrastructure Master:] Updates cross-domain object references (such as inter-domain group memberships) by maintaining mappings between object GUIDs and SIDs in multi-domain environments.
  ]
)

#v(4pt)
#pro-tip(title: "1-Second Command to Query All 5 FSMO Roles")[
  In Command Prompt, execute: #hl-green[`netdom query fsmo`] — this instantly outputs the exact Domain Controller hostnames holding all five master roles!
]

#v(6pt)

=== 4.7 Internal AD Database Storage & Health Diagnostics
- #text(weight: "bold", fill: rtech-navy)[`ntds.dit` (New Technology Directory Services Database):] The core Active Directory relational database file, located in `C:\Windows\NTDS\`. Built on the Extensible Storage Engine (ESE / Jet Blue). In Windows Server 2025, its default database page size is expanded to 32 KB.
- #text(weight: "bold", fill: rtech-navy)[`SYSVOL` Share:] Stored at `C:\Windows\SYSVOL\`. A network-shared directory replicated across all domain controllers via Distributed File System Replication (DFSR). Houses all Group Policy Templates (GPTs) and logon/logoff batch scripts.
- #text(weight: "bold", fill: rtech-navy)[Health Verification Diagnostics:] Open an elevated Command Prompt and execute #hl-green[`dcdiag /v`]. This executes over 30 rigorous internal health tests (including Connectivity, Advertising, Replications, and FrsSysvol) to certify 100% DC integrity.

#v(8pt)

// =============================================================================
// CHAPTER 04 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  In the early era of Windows NT 4.0, the enterprise directory database was merely a flat SAM registry hive strictly capped at 40,000 total objects. In Windows 2000, Microsoft integrated the high-performance Jet Blue ESE database engine from Microsoft Exchange. Today, Windows Server 2025's Active Directory database effortlessly scales to #hl-yellow[over 2 Billion directory objects] within a single enterprise forest with zero query degradation!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 04 Practice Multiple Choice Questions (MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "Which two of the 5 FSMO roles operate at the Forest-Wide scope, meaning only one instance exists across the entire forest?",
  optA: "PDC Emulator and RID Master",
  optB: "Schema Master and Domain Naming Master",
  optC: "Infrastructure Master and PDC Emulator",
  optD: "RID Master and Infrastructure Master",
  ans: "B",
  exp: "Schema Master and Domain Naming Master are forest-unique; the remaining three roles exist once per individual domain."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "What is the official filename and file extension of the primary Active Directory database?",
  optA: "activedirectory.mdf",
  optB: "ntds.dit",
  optC: "sam.dat",
  optD: "ad_database.db",
  ans: "B",
  exp: "The core database file is `ntds.dit`, representing the Directory Information Tree managed by the ESE Jet Blue engine."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "Which FSMO role handles urgent password changes, authoritative domain time synchronization, and account lockout processing?",
  optA: "Schema Master",
  optB: "Domain Naming Master",
  optC: "PDC Emulator",
  optD: "Infrastructure Master",
  ans: "C",
  exp: "The PDC Emulator is the most active FSMO role, handling password changes, time synchronization, and default GPO editing."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Which official command-line utility displays the current role owners of all 5 FSMO master roles across the enterprise in seconds?",
  optA: "ipconfig /all",
  optB: "netdom query fsmo",
  optC: "gpresult /v",
  optD: "dcdiag /test:dns",
  ans: "B",
  exp: "The command `netdom query fsmo` queries the directory and outputs all five master role owners instantly."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "Which dedicated network port does the Global Catalog (GC) utilize to listen for cross-domain search queries?",
  optA: "Port 80 (HTTP)",
  optB: "Port 389 (Standard LDAP)",
  optC: "Port 3268 (LDAP GC)",
  optD: "Port 445 (SMB)",
  ans: "C",
  exp: "Standard LDAP queries use Port 389, while Global Catalog queries across the entire forest use Port 3268 (or 3269 over SSL)."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Vault (High-Yield Questions)]
#v(3pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'What enterprise consequences occur if the Domain Controller hosting the PDC Emulator role experiences an unrecoverable crash?'",
  a: "Answer: The domain does not immediately fail, but significant operational anomalies emerge: 1. Password modifications made by users do not replicate immediately, causing authentication failures if they hit other DCs, 2. Bad password attempt counts will not trigger instant account lockouts, 3. Domain member clocks will begin drifting (leading to Kerberos time skew failures), and 4. Editing GPOs in GPMC will warn of a missing default DC. The PDC Emulator role must be seized to an online DC immediately.",
  tip: "A signature technical interview scenario for L2 Directory Services roles at HCL, Infosys, and Tech Mahindra."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'What is the operational distinction between Transferring and Seizing a FSMO role?'",
  a: "Answer: 'Transfer' is executed gracefully when both the source and target Domain Controllers are online, healthy, and communicating; ownership is reassigned with zero data loss. 'Seize' is an emergency procedure used exclusively when the source DC has suffered catastrophic physical hardware failure and cannot ever be recovered. Once a role is seized, the failed DC must never be brought back online.",
  tip: "A foundational question assessing disaster recovery preparedness and directory architecture."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'What is the DSRM (Directory Services Restore Mode) password, and how does it differ from the Domain Administrator password?'",
  a: "Answer: Domain Administrator credentials reside within the Active Directory database (ntds.dit). If the AD database becomes corrupted or if the server boots into Safe Mode / DSRM where AD DS services are offline, domain authentication cannot function. The DSRM password is a local administrator credential stored in the server's local SAM registry hive, used exclusively to access the machine offline and restore AD backups.",
  tip: "Proves you understand bare-metal disaster recovery and offline directory maintenance architecture."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'What is the primary function of the RID Master, and what occurs during RID Pool Exhaustion?'",
  a: "Answer: Whenever a new user, group, or computer object is created, it is assigned a globally unique SID (Domain SID + RID). The RID Master dispenses blocks of 500 RIDs to each DC. In standard 30-bit architectures, a domain provides approximately 1 billion RIDs. If rogue automated scripts create and delete millions of accounts, the RID pool can exhaust, halting all new object creation. Server 2025 safeguards this with expanded 31-bit RID spaces and early warning events.",
  tip: "Frequently asked in senior L2/L3 infrastructure architecture rounds at Cognizant and TCS."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "Interviewer: 'What is the purpose of the SYSVOL directory, and what replication engine synchronizes it across Domain Controllers?'",
  a: "Answer: SYSVOL is a shared directory present on all DCs that stores Group Policy Templates (GPTs), scripts, and policy definitions. In modern Windows Server versions, SYSVOL replication is powered by DFSR (Distributed File System Replication), which uses multi-master state-based replication and differential compression (the legacy FRS engine was deprecated after Server 2008).",
  tip: "Demonstrating thorough knowledge of DFSR and SYSVOL structure is essential for enterprise sysadmin roles."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 04 Key Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - AD DS serves as the centralized identity, authentication, and policy engine of an enterprise (Database: `ntds.dit`, Share: `SYSVOL`).
      - Among the 5 FSMO master roles, the PDC Emulator is critical for daily operations (passwords, time sync, and GPO editing).
      - `netdom query fsmo` and `dcdiag /v` are essential diagnostic utilities that every enterprise systems administrator must master.
    ]
  ]
)

#pagebreak()
