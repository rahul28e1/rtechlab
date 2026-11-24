// =============================================================================
// CHAPTER 06: CLIENT DOMAIN JOIN & AUTHENTICATION WALKTHROUGH
// =============================================================================

[#metadata("ch6") <chapter-6>]

#chapter-header(
  chapter-num: "CHAPTER 06",
  category: "Part 6: Endpoint Integration & Authentication (Client Domain Join & Authentication)",
  title: "Joining a Client Machine (Windows 10/11) to the Domain (Domain Join Walkthrough)",
  subtitle: "Client Prerequisites · Golden DNS IP Mapping Rule · Network Connectivity & nslookup Tests · Workgroup to Domain Migration · Top 5 Join Errors & Fixes · First Domain Login"
)

=== 6.1 Client Workstation Prerequisites
Once the Domain Controller and user accounts are provisioned, the subsequent phase is joining employee laptop and desktop workstations to the Active Directory domain to apply centralized governance and security policies.

#warning-box(title: "Windows Edition Restrictions (Windows Home Edition Trap)")[
  Microsoft Windows 10/11 #hl-orange[Home Edition can NEVER be joined to an Active Directory domain.] Joining an Active Directory domain strictly mandates #mark-green[Windows 10/11 Pro, Enterprise, or Education] editions.
]

#v(4pt)
*Lab Client Machine Specifications:*
- VM Name: #hl-yellow[`CLT-WIN11-01`]
- Operating System: Windows 11 Pro 64-bit
- Network Adapter: Internal Network (identical network fabric where `SRV-2025-DC01` operates)

#v(6pt)

=== 6.2 Pointing Client DNS IP to the Domain Controller (The #1 Golden Rule)
Approximately 99% of domain joining failures encountered by students and junior IT engineers stem from this single misconfiguration:

#mark-yellow[A client machine can NEVER locate an Active Directory domain until its network adapter's 'Preferred DNS Server' points directly to the IP address of the Domain Controller!]

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/domain_join_flow.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 6.1: Client Machine Domain Join 5-Step Lifecycle — DNS Mapping, Discovery, Authentication, and Initial Interactive Logon]
]

#v(4pt)

*Client Network Configuration:*
1. On the client machine, launch Run (`Win + R`) and enter: #hl-green[`ncpa.cpl`].
2. Right-click Ethernet adapter -> Properties -> select #hl-yellow[Internet Protocol Version 4 (TCP/IPv4)] -> Properties.
3. IP Address: #hl-green[`192.168.1.50`]
4. Subnet Mask: #hl-green[`255.255.255.0`]
5. Default Gateway: #hl-green[`192.168.1.1`]
6. #text(weight: "bold", fill: rtech-navy)[Preferred DNS Server:] #mark-orange[`192.168.1.10`] (the IP address of our Root DC).

#v(6pt)

=== 6.3 Network Connectivity and DNS Resolution Tests (Pre-flight Checks)
Prior to initiating the Domain Join Wizard, performing two pre-flight validation tests in Command Prompt is mandatory:

1. #text(weight: "bold")[Ping Connectivity Test:]
```cmd
ping 192.168.1.10
```
Receiving active ICMP replies confirms that physical/virtual Layer 2 and Layer 3 network connectivity is fully operational.

2. #text(weight: "bold")[DNS and SRV Record Resolution Test:]
```cmd
nslookup corp.rtechlab.local
```
If the DNS response resolves to Server: `SRV-2025-DC01.corp.rtechlab.local` and Address: `192.168.1.10`, the client workstation is fully prepared to discover the Domain Controller.

#v(6pt)

=== 6.4 Migrating from Workgroup to Domain (Full Join Walkthrough)
1. On the client machine, launch Run (`Win + R`) and enter: #hl-green[`sysdm.cpl`] (System Properties).
2. On the 'Computer Name' tab, click the #hl-yellow['Change...'] button below.
3. Under Computer name, specify: #hl-yellow[`CLT-WIN11-01`].
4. Under 'Member of', switch the selection from 'Workgroup' to the #mark-yellow[Domain] radio button.
5. Enter the target domain name: #hl-green[`corp.rtechlab.local`] and click 'OK'.
6. A Windows Security credential prompt appears. Provide Domain Admin credentials:
   - Username: #hl-yellow[`corp.rtechlab.local\Administrator`] (or simply `Administrator`)
   - Password: #hl-green[`P@ssw0rd2025!`]
7. Within 5 to 10 seconds, a welcome confirmation dialog appears:
   #align(center)[#box(fill: rgb("#DCFCE7"), stroke: 1pt + rgb("#86EFAC"), radius: 4pt, inset: 6pt)[
     #text(size: 9pt, weight: "black", fill: rgb("#166534"))[✓ Welcome to the corp.rtechlab.local domain.]
   ]]
8. Click 'OK' -> acknowledge 'You must restart your computer to apply these changes' -> click #hl-green['Restart Now'].

#v(6pt)

=== 6.5 Top 5 Domain Join Errors and Precise Technical Fixes
Domain join errors occur frequently in both enterprise production environments and technical interviews:

1. #text(weight: "bold", fill: rtech-rose)[Error 1: 'An Active Directory Domain Controller for the domain could not be contacted':]
   - *Root Cause:* The client's Preferred DNS does not point to the DC (the client is using public DNS 8.8.8.8 or home router DNS).
   - *Resolution:* Launch `ncpa.cpl` and explicitly configure Preferred DNS to `192.168.1.10`.
2. #text(weight: "bold", fill: rtech-rose)[Error 2: 'The network path was not found (0x80070035)':]
   - *Root Cause:* Windows Firewall on the Domain Controller is blocking SMB (Port 445) or RPC endpoint ports.
   - *Resolution:* Enable the 'File and Printer Sharing' firewall rules on the Domain Controller.
3. #text(weight: "bold", fill: rtech-rose)[Error 3: 'There is a time and/or date difference between the client and server':]
   - *Root Cause:* Kerberos clock drift exceeds the maximum 5-minute skew tolerance between the client and DC.
   - *Resolution:* Synchronize system clock and time zone with the DC or run `w32tm /resync`.
4. #text(weight: "bold", fill: rtech-rose)[Error 4: 'Access is denied':]
   - *Root Cause:* The supplied user credentials lack authorization to join computer accounts to the domain.
   - *Resolution:* Use Domain Admins credentials or explicitly delegate join permissions on the target OU.
5. #text(weight: "bold", fill: rtech-rose)[Error 5: 'The computer account already exists in the domain':]
   - *Root Cause:* An existing computer object with identical hostname exists in ADUC with a mismatched SID.
   - *Resolution:* Delete or reset the stale computer account in ADUC and retry.

#v(6pt)

=== 6.6 System Restart and Initial Domain User Interactive Logon
Following the reboot, the client workstation lock screen transitions to the enterprise domain login interface:

1. On the lock screen, click #mark-yellow['Other user'] in the lower-left corner.
2. The interface displays: *Sign in to: CORP*.
3. Username: #hl-green[`rpatel`] (the user account provisioned in Chapter 05).
4. Password: #hl-green[`Welcome@2025#`].
5. A prompt appears immediately: #text(weight: "bold", fill: rtech-blue)['The user\'s password must be changed before signing in'].
6. Click 'OK'. The user inputs their private, secure password (e.g., #hl-green[`MySecurePass@2025`]).
7. Windows initializes a new domain user profile (`C:\Users\rpatel`) and loads the desktop environment!
8. For verification, launch Command Prompt and run: #hl-green[`whoami`]. The output confirms: #mark-green[`corp\rpatel`].

#v(8pt)

// =============================================================================
// CHAPTER 06 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  When a computer joins a domain, a dedicated machine account (`CLT-WIN11-01$`) is created in Active Directory. Did you know that the secure channel password between the workstation and the Domain Controller #hl-yellow[rotates automatically in the background every 30 days]? If an endpoint remains disconnected from the enterprise network for over 90 days, the secure trust relationship breaks, causing the infamous 'Trust Relationship Failed' error!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 06 Practice Multiple Choice Questions (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "Which edition of Windows is strictly prohibited from joining an Active Directory domain?",
  optA: "Windows 11 Enterprise",
  optB: "Windows 11 Pro",
  optC: "Windows 11 Home Edition",
  optD: "Windows 11 Education",
  ans: "C",
  exp: "Windows Home Edition deliberately lacks corporate domain joining and Group Policy integration capabilities."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "What is the most prevalent root cause for the 'Domain Controller could not be contacted' error during client domain join?",
  optA: "Defective client keyboard hardware",
  optB: "The client's Preferred DNS does not point to the Domain Controller IP",
  optC: "The client machine lacks 16 GB of physical RAM",
  optD: "Google Chrome is not installed on the system",
  ans: "B",
  exp: "Clients locate DC SRV locator records exclusively via Active Directory DNS; an incorrect DNS configuration prevents domain discovery."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "Which shortcut command opens the System Properties dialog to rename and join a computer to a domain?",
  optA: "ncpa.cpl",
  optB: "sysdm.cpl",
  optC: "appwiz.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "sysdm.cpl (System Properties) launches the dialog used for computer renaming and domain membership changes."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Which command is executed on a client machine to inspect the currently logged-on user and domain context?",
  optA: "getmac",
  optB: "whoami",
  optC: "hostname",
  optD: "netstat",
  ans: "B",
  exp: "The whoami command outputs the current user's security domain and account identity (e.g., corp\\rpatel)."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "At what standard interval is the machine account secure channel password automatically rotated between a domain member and the DC?",
  optA: "7 days",
  optB: "30 days",
  optC: "90 days",
  optD: "365 days",
  ans: "B",
  exp: "The NetLogon service automatically renegotiates the computer account password every 30 days by default."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Questions (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'A client workstation reports: 'The trust relationship between this workstation and the primary domain failed.' How do you resolve this without disjoining and rejoining the domain?'",
  a: "Answer: This occurs when the workstation's local machine password diverges from the password registered in Active Directory (often caused by reverting VM snapshots or prolonged offline status exceeding 30 days). Log in with local administrator credentials and run PowerShell: 'Reset-ComputerMachinePassword -Credential (Get-Credential)' or 'Test-ComputerSecureChannel -Repair'. This repairs the Kerberos trust channel in place without requiring unjoining or rebooting.",
  tip: "This exact scenario is asked in virtually 100% of L2 Desktop and Enterprise Support interviews at Wipro, Infosys, and HCL."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'By default, how many computer accounts can a standard, non-administrative domain user join to the domain?'",
  a: "Answer: By default, Active Directory grants every 'Authenticated User' permission to join up to 10 computer workstations to the domain via the 'ms-DS-MachineAccountQuota' attribute. However, in hardened enterprise environments, security policies set this quota to 0 using ADSI Edit, delegating domain-join privileges strictly to designated IT support technicians on designated OUs.",
  tip: "Demonstrating knowledge of ms-DS-MachineAccountQuota showcases deep directory architecture mastery."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'What are Cached Credentials on a client machine, and what security implications do they present?'",
  a: "Answer: When mobile employees disconnect from the corporate network (e.g., Working from Home), they can still authenticate because Windows caches the password hashes of the last 10 successful interactive logons locally in LSA secrets ('Cached Logons'). While enabling offline mobility, cached credentials can be targeted by local dumping attacks (e.g., Mimikatz). In high-security environments, GPOs limit cached logon count.",
  tip: "This question bridges endpoint administration with cybersecurity and remote workforce protection."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'Which network protocols and port numbers are utilized during the Domain Join process?'",
  a: "Answer: Domain Join relies on several core protocols: 1. DNS (Port 53) to discover DC SRV locator records, 2. Kerberos (Port 88) for authentication, 3. LDAP (Port 389) to create the computer object in ADUC, and 4. SMB (Port 445) and RPC (Port 135 / dynamic RPC ports) for directory transport and policy replication.",
  tip: "A classic interview question designed to evaluate cross-domain network and server infrastructure fluency."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "Interviewer: 'On the client logon screen, how do you force authentication against the local machine SAM database instead of the domain?'",
  a: "Answer: To authenticate against the local SAM database rather than the domain, prefix the username with '.\\' (e.g., '.\\Administrator') or type the local computer name (e.g., 'CLT-WIN11-01\\Administrator'). Typing '.\\' automatically toggles the logon domain context to the local workstation.",
  tip: "A fundamental operational skill tested in all IT helpdesk and desktop support practical evaluations."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 06 Key Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - The client workstation's Preferred DNS MUST point to the Domain Controller IP; without this mapping, Active Directory domain discovery fails.
      - Upon joining, a dedicated machine account (`CLT-WIN11-01$`) is created, and the trust channel password automatically refreshes every 30 days.
      - `whoami` and `Test-ComputerSecureChannel` serve as the primary diagnostic tools for validating enterprise domain authentication.
    ]
  ]
)

#pagebreak()
