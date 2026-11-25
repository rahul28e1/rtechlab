// =============================================================================
// CHAPTER 03: POST-INSTALLATION HARDENING & BASELINE CONFIGURATION
// =============================================================================

[#metadata("ch3") <chapter-3>]

#chapter-header(
  chapter-num: "CHAPTER 03",
  category: "PART 3: Server Baseline & Hardening",
  title: "Post-Installation Baseline Configuration & Server Hardening",
  subtitle: "#hl-yellow[Server Manager] Dashboard Navigation · Computer Renaming (SRV-2025-DC01) · Static IPv4 & DNS · Remote Desktop (RDP) & NLA Security · Firewall Ports · NTP Clock Synchronization"
)

=== 3.1 #hl-yellow[Server Manager] Dashboard Navigation
Immediately upon logging into Windows Server, #hl-yellow[Server Manager] launches automatically. This is Microsoft's primary centralized management console, empowering administrators to oversee, provision, and configure local server resources and remote servers across the network from a single pane of glass.

The left-hand navigation pane provides core administrative views:
1. #text(weight: "bold", fill: rtech-navy)[Dashboard:] Displays a high-level operational summary of overall server health, active alert events, services status, and installed roles.
2. #text(weight: "bold", fill: rtech-navy)[Local Server:] Centralizes the local host's identity properties (Computer Name, Workgroup/Domain status), network adapter bindings, Remote Desktop state, Windows Update cadence, and Windows Defender settings.
3. #text(weight: "bold", fill: rtech-navy)[All Servers:] Enumerates all remote member servers managed within the administrative server pool.
4. #text(weight: "bold", fill: rtech-navy)[Roles and Server Groups:] Dedicated management tabs are dynamically appended here as enterprise roles (such as AD DS, DNS, or DHCP) are provisioned.

#v(1pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_hardening_architecture.png", width: 32%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 3.1: Windows Server 2025 5-Stage Post-Installation Baseline Hardening & Configuration Flow]
]

#v(1pt)

=== 3.2 Enterprise Server Naming Conventions
By default, the Windows Server installation wizard assigns an arbitrary, randomly generated alphanumeric NetBIOS name (e.g., `WIN-7K9A3B58Z1`). In production enterprise datacenters, a server must never retain an unmanaged default name, particularly when designated to operate as a Domain Controller.

#warning-box(title: "The Golden Rule: Rename the Server BEFORE Domain Controller Promotion")[
  Once an operating system is promoted to an Active Directory Domain Controller, renaming the computer object becomes substantially more complex and error-prone because #hl-orange[Kerberos] Service Principal Names (SPNs), DNS SRV resource records, and directory database metadata bind directly to the original hostname. Therefore, #hl-orange[always assign the permanent production hostname prior to initiating DC promotion].
]

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[Enterprise Host Naming Standards:]\
    - #hl-green[`SRV-2025-DC01`]: Primary Domain Controller (Headquarters Data Center)\
    - #hl-green[`SRV-2025-DC02`]: Secondary / Backup Domain Controller\
    - #hl-green[`SRV-2025-FS01`]: Enterprise File & Storage Cluster Node\
    - #hl-green[`SRV-2025-WEB01`]: Production IIS Web Application Server
  ]
)

#v(1pt)
*Step-by-Step Server Renaming Procedure:*
1. Open #hl-yellow[Server Manager] and click #hl-yellow[Local Server] in the left navigation pane.
2. Click the randomly assigned name link next to #text(weight: "bold")[Computer name] (e.g., `WIN-XXXXX`).
3. In the System Properties dialog, click the #hl-green['Change...'] button.
4. In the Computer name field, enter the standardized enterprise hostname: #hl-yellow[`SRV-2025-DC01`].
5. Click 'OK'. The system will notify you that a restart is required to apply changes. Do not reboot immediately (we will configure static IP addressing first and reboot once).

#v(1.5pt)

=== 3.3 Static IPv4 & DNS Addressing Configuration
An enterprise server is an architectural service provider. If a server receives its IP address dynamically via DHCP and that lease expires or changes, connected client endpoints will immediately lose domain authentication, mapped departmental file shares, and DNS resolution. Consequently, #hl-yellow[every enterprise infrastructure server must be assigned a fixed, static IPv4 address].

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "Training Lab Subnet Plan")[
      - #text(weight: "bold")[IP Address:] #hl-green[`192.168.1.10`]
      - #text(weight: "bold")[Subnet Mask:] #hl-green[`255.255.255.0 (/24)`]
      - #text(weight: "bold")[Default Gateway:] #hl-green[`192.168.1.1`]
      - #text(weight: "bold")[Preferred DNS:] #hl-yellow[`127.0.0.1`] (Loopback)
      - #text(weight: "bold")[Alternate DNS:] #hl-green[`192.168.1.10`]
    ]
  ],
  [
    #warning-box(title: "The Mandatory DNS Loopback Rule")[
      Because this server will host the authoritative Active Directory integrated DNS zone, Preferred DNS must point to #hl-orange[`127.0.0.1`] (or the server's own static IP). If you configure a public DNS server such as `8.8.8.8` (Google DNS), Active Directory domain join and #hl-orange[Kerberos] service locator lookups will completely fail!
    ]
  ]
)

#v(1pt)
*Configuring Static IP Addressing:*
1. Press `Win + R` to open the Run prompt and type: #hl-green[`ncpa.cpl`] (Network Connections).
2. Right-click the active 'Ethernet' network interface and select #hl-yellow[Properties].
3. Highlight #text(weight: "bold")[Internet Protocol Version 4 (TCP/IPv4)] and click 'Properties'.
4. Select the 'Use the following IP address' radio button and enter the lab subnet parameters listed above.
5. Click 'OK' -> 'Close'. Now restart the server to fully initialize both the new hostname and static network configuration.

#v(1.5pt)

=== 3.4 Remote Desktop (RDP - #hl-green[Port 3389]) & NLA Security
In enterprise datacenters, physical servers reside securely inside climate-controlled, restricted-access server rooms. Systems administrators never sit physically in front of individual server consoles; all administrative workflows are conducted over #hl-yellow[Remote Desktop Protocol (RDP)].

*Enabling and Securing RDP:*
1. Navigate to #hl-yellow[Server Manager] -> #hl-yellow[Local Server].
2. Click the 'Disabled' status link adjacent to #text(weight: "bold")[Remote Desktop].
3. In the Remote tab of System Properties, select #hl-green['Allow remote connections to this computer'].
4. Verify that the checkbox #mark-orange['Allow connections only from computers running Remote Desktop with Network Level Authentication (recommended)'] remains strictly checked.
5. Click 'OK' to save.

#pro-tip(title: "Why Network Level Authentication (NLA) is Mission Critical")[
  Without NLA, an unauthorized client can establish an unauthenticated RDP channel with the server and launch denial-of-service (DoS) or brute-force exploits directly against the Windows logon screen. NLA forces the client to complete TLS cryptographic authentication and validate credentials before the server instantiates an interactive session. RDP listens on #hl-green[TCP Port 3389] by default.
]

#v(1.5pt)

=== 3.5 Windows Defender Firewall Port Hardening
By default, the Windows Defender Firewall profile strictly blocks all inbound ICMP Echo Requests (Ping). In an isolated laboratory or testing environment, enabling Ping is essential for verifying network reachability:

1. Press `Win + R`, type #hl-green[`wf.msc`] (Windows Defender Firewall with Advanced Security), and press Enter.
2. Select #hl-yellow[Inbound Rules] in the left hierarchy tree.
3. Locate the pre-defined rule: #text(weight: "bold")[File and Printer Sharing (Echo Request - ICMPv4-In)].
4. Right-click the rule and select #hl-green[Enable Rule]. Your virtual machine will now respond to ICMP ping echo packets from other lab workstations.

#v(1.5pt)

=== 3.6 Time Zone & NTP Clock Synchronization (#hl-orange[Kerberos] Time Skew Rule)
The entire security architecture of #hl-yellow[Active Directory Domain Services] relies on the #hl-yellow[Kerberos v5] authentication protocol. #hl-orange[Kerberos] embeds precise timestamps within authentication tickets (TGT / TGS) to defeat credential replay attacks across the network.

#warning-box(title: "The 5-Minute #hl-orange[Kerberos] Clock Skew (Classic Interview Trap)")[
  If the internal clock difference between a Domain Controller and a joining workstation exceeds #hl-orange[5 minutes (Clock Skew)], #hl-orange[Kerberos] authentication tickets are instantly rejected, completely locking users out of domain logons and shared enterprise resources!
]

*NTP Diagnostic & Configuration Commands:*
- Query current time synchronization state: #hl-green[`w32tm /query /status`]
- Synchronize with an authoritative external NTP reference:
```cmd
w32tm /config /manualpeerlist:"pool.ntp.org" /syncfromflags:manual /reliable:yes /update
net stop w32time && net start w32time
w32tm /resync
```

#v(1pt)

// =============================================================================
// CHAPTER 03 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  In Windows Server 2025, Microsoft has dramatically tightened baseline security defaults: legacy #hl-yellow[NTLMv1] authentication is blocked outright, and #hl-yellow[SMB Signing] is now enforced as mandatory across all editions by default. This eliminates enterprise exposure to Man-in-the-Middle (MitM) credential tampering and NTLM relay attacks without requiring custom administrative Group Policies!
]

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 03 Practice Multiple Choice Questions (MCQs)]
#v(1.5pt)

#mcq-item(
  num: "1",
  q: "According to Microsoft best practices, which prerequisite task is mandatory before promoting a server to an Active Directory Domain Controller?",
  optA: "Installing IIS Web Server",
  optB: "Assigning a permanent computer hostname and static IPv4 configuration",
  optC: "Permanently disabling Windows Defender Firewall",
  optD: "Installing third-party antivirus software",
  ans: "B",
  exp: "Modifying hostnames and IP bindings post-promotion causes severe SPN and DNS registration conflicts; hardening must precede promotion."
)

#v(1.5pt)

#mcq-item(
  num: "2",
  q: "On which default IANA port does the Remote Desktop Protocol (RDP) listen for incoming administrative connections?",
  optA: "TCP #hl-green[Port 80]",
  optB: "TCP #hl-green[Port 443]",
  optC: "TCP #hl-green[Port 3389]",
  optD: "#hl-green[UDP Port 53]",
  ans: "C",
  exp: "TCP #hl-green[Port 3389] is the official IANA port assigned to Microsoft Terminal Services and Remote Desktop Protocol."
)

#v(1.5pt)

#mcq-item(
  num: "3",
  q: "What is the maximum allowable Kerberos authentication clock skew between a Domain Controller and a domain member client?",
  optA: "1 Minute",
  optB: "5 Minutes",
  optC: "15 Minutes",
  optD: "30 Minutes",
  ans: "B",
  exp: "The Kerberos v5 security protocol enforces a maximum 5-minute time tolerance window to prevent replay attacks."
)

#v(1.5pt)

#mcq-item(
  num: "4",
  q: "Which Microsoft Management Console run shortcut opens the Network Connections adapter configuration window directly?",
  optA: "devmgmt.msc",
  optB: "ncpa.cpl",
  optC: "firewall.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "Executing `ncpa.cpl` directly opens the Network Connections control panel applet."
)

#v(1.5pt)

#mcq-item(
  num: "5",
  q: "What is the primary security objective of enabling Network Level Authentication (NLA) in Remote Desktop?",
  optA: "Doubling internet connection bandwidth",
  optB: "Authenticating user credentials before initializing a full graphical RDP session",
  optC: "Eliminating the need for user passwords",
  optD: "Muting remote desktop audio streams",
  ans: "B",
  exp: "NLA performs front-channel credential authentication via CredSSP, preventing unauthorized denial-of-service session creation."
)

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Vault (High-Yield Questions)]
#v(1.5pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'What catastrophic failure occurs if a Domain Controller's Preferred DNS is configured with 8.8.8.8 (Google Public DNS)?'",
  a: "Answer: If a Domain Controller points to Google DNS, it will query public internet root servers for its own internal Active Directory SRV records (_ldap._tcp, _kerberos._tcp). Because those enterprise records exist only within internal AD DNS zones, resolution fails completely. As a result, the DC cannot locate directory partners, replication halts, and client workstations cannot authenticate to the domain. The Preferred DNS must always point to 127.0.0.1 or an internal AD-integrated DNS server.",
  tip: "A renowned troubleshooting scenario frequently asked in L2 Systems Administrator interviews at Wipro and TCS."
)

#v(1.5pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'A client workstation reports Kerberos Error: Time Skew Too Great (0x25). How do you resolve this?'",
  a: "Answer: This error signifies that the client's internal clock has drifted more than 5 minutes from the Domain Controller acting as the PDC Emulator. To remediate, open an elevated command prompt on the client and execute 'w32tm /resync /force' to force an immediate NTP resync against the DC. If the condition persists, inspect the client's time zone settings and motherboard CMOS battery.",
  tip: "A standard frontline operational scenario for L1/L2 desktop support and infrastructure engineers."
)

#v(1.5pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'Is changing the default RDP port from 3389 to an obfuscated port (e.g., 53389) sufficient for enterprise server security?'",
  a: "Answer: Port obfuscation merely deters trivial automated port scanners (Security through Obscurity); it does not provide cryptographic security. Enterprise production standards require enabling Network Level Authentication (NLA), restricting RDP endpoints behind enterprise VPNs or Azure Bastion, and enforcing Multi-Factor Authentication (MFA) with conditional access policies.",
  tip: "Providing this mature perspective proves you understand defense-in-depth security principles."
)

#v(1.5pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'What is the official Windows command-line utility used to inspect the active time synchronization status on a server?'",
  a: "Answer: The command 'w32tm /query /status' provides full diagnostic telemetry, including the active NTP reference source, poll interval, precision, and timestamp of the last successful synchronization.",
  tip: "Direct command-line fluency is heavily tested in practical enterprise infrastructure technical assessments."
)

#v(1.5pt)

#interview-item(
  num: "5",
  q: "Interviewer: 'What is the operational definition of Server Hardening, and what four baseline tasks does it encompass?'",
  a: "Answer: Server Hardening is the systematic practice of securing an operating system by eliminating vulnerabilities and reducing the overall attack surface. The four foundational tasks include: 1. Disabling or renaming default accounts and enforcing complex passwords, 2. Disabling unneeded services and ports, 3. Tightening inbound/outbound firewall rules, and 4. Enforcing continuous patch management and #hl-yellow[Hotpatching].",
  tip: "A cornerstone architectural question in infrastructure compliance and security interviews."
)

#v(1pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 03 Key Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - Assigning a standardized hostname and static IPv4 configuration prior to DC promotion is an essential engineering prerequisite.
      - The DNS loopback address `127.0.0.1` is the foundation of AD DS name resolution; never configure external public DNS on a Domain Controller.
      - Network Level Authentication (NLA) for RDP and NTP clock synchronization form the bedrock of Kerberos enterprise security.
    ]
  ]
)

#pagebreak()
