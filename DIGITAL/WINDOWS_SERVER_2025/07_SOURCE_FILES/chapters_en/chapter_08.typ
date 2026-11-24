// =============================================================================
// CHAPTER 08: DHCP SERVER ROLE: SCOPES, RESERVATIONS & FAILOVER
// =============================================================================

[#metadata("ch8") <chapter-8>]

#chapter-header(
  chapter-num: "CHAPTER 08",
  category: "Part 8: Dynamic Host Configuration (Dynamic Host Configuration)",
  title: "DHCP Server Configuration: Scopes, Exclusions, Reservations & Failover",
  subtitle: "DORA 4-Step Process · AD Authorization · IPv4 Scopes · Subnet Masks · Lease Duration · Exclusion Ranges · MAC Reservations · 80/20 Split-Scope & Failover Clustering"
)

=== 8.1 What is DHCP? and the 4-Step DORA Process
When a new laptop or smartphone connects to an enterprise Wi-Fi network or LAN cable, it requires a unique IP address, subnet mask, default gateway, and DNS server addresses to communicate across the network fabric.

#mark-yellow[Dynamic Host Configuration Protocol (DHCP) is a client-server networking protocol that automatically assigns IP addresses and network configuration parameters to client endpoints for a specified time period (Lease).]

The IP lease allocation lifecycle between a client and a DHCP server is known as the #hl-yellow[DORA Process]:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dhcp_dora_process.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 8.1: DHCP 4-Step DORA Lifecycle — Discover, Offer, Request, and Acknowledge (UDP Ports 67/68)]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[The 4 Steps of the DORA Process (Core MNC Interview Decider):]\
    - #text(weight: "bold", fill: rtech-blue)[1. D (DHCPDISCOVER):] The client possesses no IP address. It broadcasts across the network with source IP `0.0.0.0` and destination IP `255.255.255.255`: *\"Is there an active DHCP server on this network?\"* #hl-green[UDP Port: 67].
    - #text(weight: "bold", fill: rtech-emerald)[2. O (DHCPOFFER):] The DHCP server retrieves an available, unassigned IP address from its active pool and transmits an offer: *\"I have IP 192.168.1.100 available. Would you like to lease it?\"* #hl-green[UDP Port: 68].
    - #text(weight: "bold", fill: rtech-amber)[3. R (DHCPREQUEST):] The client accepts the offer and broadcasts back: *\"Yes, I accept the lease for IP 192.168.1.100 offered by server 192.168.1.10!\"*
    - #text(weight: "bold", fill: rtech-blue)[4. A (DHCPACK):] The DHCP server issues an acknowledgement, registers the IP lease in its database, and delivers default gateway, subnet mask, and DNS server options.
  ]
)

#v(6pt)

=== 8.2 DHCP Server Role Installation & Active Directory Authorization
1. In Server Manager -> navigate to #hl-green[Manage -> Add Roles and Features].
2. Under Server Roles, check #mark-yellow[DHCP Server].
3. Include 'Add Features' (DHCP RSAT Management Tools) and proceed through 'Next' -> 'Next' -> 'Install'.
4. Once installation finishes, click the yellow notification flag -> select #hl-yellow['Complete DHCP Configuration'].
5. In the Post-Install Configuration Wizard, the #text(weight: "bold", fill: rtech-navy)[Authorization] screen appears. Click 'Commit' so our Domain Controller authorizes this DHCP server within Active Directory.

#warning-box(title: "Rogue DHCP Server Prevention (Enterprise Security Mechanism)")[
  If an unauthorized employee or rogue user connects a personal router or unapproved DHCP server to the corporate network (Rogue DHCP Server), Windows Domain Controllers actively detect it. Active Directory automatically shuts down unauthorized Windows DHCP services to prevent IP conflicts, rogue routing, and Man-in-the-Middle attacks.
]

#v(6pt)

=== 8.3 Configuring an IPv4 Scope
A Scope defines the valid contiguous range of IP addresses that a DHCP server leases to clients on a subnet:

1. In Server Manager -> Tools -> launch the #hl-yellow[DHCP] console (or enter #mark-green[`dhcpmgmt.msc`] in Run).
2. Expand server node `SRV-2025-DC01` -> right-click #text(weight: "bold")[IPv4] -> select #hl-green[New Scope...].
3. Scope Name: #hl-yellow[`RTechLab-LAN-Scope`].
4. #text(weight: "bold")[IP Address Range (IP Pool):]
   - Start IP address: #hl-green[`192.168.1.100`]
   - End IP address: #hl-green[`192.168.1.200`]
   - Length: #hl-green[`24`], Subnet mask: #hl-green[`255.255.255.0`]
5. #text(weight: "bold")[Lease Duration:] Configured to #hl-yellow[8 days] by default. An 8-day lease is optimal for wired corporate office workstations, whereas public guest Wi-Fi in airports or cafeterias typically uses 2 to 4 hours.

#v(6pt)

=== 8.4 Exclusion Ranges & Essential DHCP Options
- #text(weight: "bold", fill: rtech-rose)[Add Exclusions and Delay (Exclusion Ranges):] If specific addresses within the scope must be withheld from dynamic client assignment (e.g., for lab test benches or static devices), exclude them:
  - Enter Start IP: `192.168.1.150` to End IP: `192.168.1.160` and click 'Add'.
- #text(weight: "bold", fill: rtech-navy)[Configure DHCP Options:]
  - #text(weight: "bold", fill: rtech-blue)[Option 003 (Router / Default Gateway):] Enter `192.168.1.1` and click 'Add'.
  - #text(weight: "bold", fill: rtech-emerald)[Option 006 (DNS Servers):] Add `192.168.1.10` (our AD DNS Server) as primary.
  - #text(weight: "bold", fill: rtech-amber)[Option 015 (Domain Name):] Enter `corp.rtechlab.local`.
6. Select 'Yes, I want to activate this scope now' and click 'Finish'!

#v(6pt)

=== 8.5 MAC Address Reservations (Reservations for Network Printers)
Enterprise network printers, scanners, and surveillance cameras must never change IP addresses; otherwise, users lose connectivity. We configure static MAC Reservations:

1. In the DHCP console, expand your active scope -> right-click the #hl-yellow[Reservations] container -> select #hl-green[New Reservation...].
2. Reservation name: #hl-yellow[`HP-Network-Printer-HR`].
3. IP address: #hl-green[`192.168.1.105`].
4. MAC address: Enter the printer's 12-digit hexadecimal MAC address (e.g., `00155D01A23B`).
5. Supported types: Select #hl-yellow['Both (DHCP and BOOTP)'] and click 'Add'.
Whenever this printer powers on, the DHCP server recognizes its unique MAC address and consistently binds it to the dedicated IP `192.168.1.105`!

#v(6pt)

=== 8.6 High Availability: DHCP 80/20 Split-Scope & Failover Clustering
If a single DHCP server crashes, client leases will expire and network connectivity across the organization halts. Two architectural safeguards prevent this:

1. #text(weight: "bold", fill: rtech-navy)[80/20 Split-Scope Rule (Legacy Standard):] The primary DC hosts 80% of the IP scope while a secondary DC hosts the remaining 20% of the same subnet pool, providing basic redundancy if the primary fails.
2. #text(weight: "bold", fill: rtech-emerald)[Modern DHCP Failover (Windows Server 2025):]
   - Right-click the IPv4 Scope -> select #hl-green[Configure Failover...].
   - Select partner server (`SRV-2025-DC02`).
   - Select operational mode:
     - #text(weight: "bold")[Load Balance Mode:] Both servers actively distribute IP requests simultaneously (e.g., 50:50 ratio).
     - #text(weight: "bold")[Hot Standby Mode:] The active server handles 100% of client traffic while the standby server monitors heartbeats and assumes lease management immediately if the primary fails.

#v(8pt)

// =============================================================================
// CHAPTER 08 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  DHCP broadcast traffic cannot cross Layer 3 routers. In large enterprises spanning 10 distinct VLANs or physical buildings, do you need a separate DHCP server on every floor? Absolutely not! Network engineers enable #hl-yellow[DHCP Relay Agents] on Cisco routers or switches (Cisco command: `ip helper-address 192.168.1.10`), which converts client broadcast packets into unicast packets routed directly to the centralized DHCP server!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 08 Practice Multiple Choice Questions (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "What is the correct full form of the 4-step DHCP IP allocation process known as DORA?",
  optA: "Domain, Origin, Routing, Access",
  optB: "Discover, Offer, Request, Acknowledge",
  optC: "Detect, Open, Receive, Assign",
  optD: "Data, Output, Response, Authentication",
  ans: "B",
  exp: "DORA stands for: DHCPDISCOVER, DHCPOFFER, DHCPREQUEST, and DHCPACK."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "Which UDP port number is used by client computers when transmitting DHCPDISCOVER broadcast packets?",
  optA: "UDP Port 53",
  optB: "UDP Port 67",
  optC: "UDP Port 80",
  optD: "UDP Port 445",
  ans: "B",
  exp: "DHCP servers listen on UDP Port 67, while DHCP clients receive server responses on UDP Port 68."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "Under DHCP Scope Options, which official option code assigns the 'Default Gateway (Router)' IP address to client computers?",
  optA: "Option 003",
  optB: "Option 006",
  optC: "Option 015",
  optD: "Option 066",
  ans: "A",
  exp: "Option 003 designates the Router / Default Gateway, while Option 006 designates DNS Servers."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Which mechanism guarantees that network printers and mission-critical endpoints automatically receive identical, dedicated IP addresses on every reboot?",
  optA: "Exclusion Range",
  optB: "MAC Address Reservation",
  optC: "APIPA Auto-IP",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "MAC Address Reservation maps a device's physical MAC address to a fixed IP lease within the DHCP scope."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "If no DHCP server responds on the network, which automatic IP address range does a Windows 11 client assign via APIPA?",
  optA: "10.0.0.1 to 10.0.0.254",
  optB: "169.254.0.1 to 169.254.255.254",
  optC: "192.168.1.1 to 192.168.1.254",
  optD: "172.16.0.1 to 172.16.0.254",
  ans: "B",
  exp: "APIPA allocates addresses from the 169.254.0.0/16 subnet, signaling DHCP discovery failure."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Questions (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'A client workstation received an IP address of 169.254.x.x. What does this mean, and how do you resolve it?'",
  a: "Answer: 169.254.x.x is an APIPA (Automatic Private IP Addressing) address. It signifies that the client broadcast a DHCPDISCOVER packet, but no DHCP server responded. Troubleshooting procedure: 1. Verify physical cable and VLAN port connectivity, 2. Inspect the DHCP server scope to determine whether the address pool is completely exhausted, 3. Execute 'ipconfig /release' and 'ipconfig /renew' to initiate a fresh DORA cycle.",
  tip: "This is the single most commonly asked network troubleshooting question in L1/L2 support interviews at HCL, Infosys, and TCS."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'When does the DHCP Lease Renewal process begin, and what are the T1 and T2 timers?'",
  a: "Answer: At 50% of the lease duration (T1 Timer - e.g., after 4 days of an 8-day lease), the client sends a unicast 'DHCPREQUEST' to the originating DHCP server to renew the lease. If the originating server fails to respond, then at 87.5% of the lease duration (T2 Timer - day 7), the client transitions to broadcast mode, seeking a renewal from any available DHCP server. If 100% of the lease expires without renewal, the IP is immediately released.",
  tip: "Explaining internal protocol timers demonstrates deep technical mastery beyond basic administration."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'What is a Rogue DHCP Server, and how does Active Directory Authorization neutralize it?'",
  a: "Answer: A Rogue DHCP server is an unauthorized server that dishes out incorrect IP addresses and gateways, enabling Man-in-the-Middle (MitM) attacks or causing network-wide denial of service. In an Active Directory domain, all Windows DHCP servers must be authorized in AD (listed in the AD Configuration partition). When an unauthorized Windows server starts DHCP, it queries AD; if unauthorized, its DHCP service automatically halts.",
  tip: "High-value enterprise cybersecurity and network infrastructure question."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'How do you enable clients located on remote subnets across a router to receive IP leases from a centralized DHCP server?'",
  a: "Answer: Because DHCP broadcasts cannot traverse routers, a 'DHCP Relay Agent' is configured on the default gateway router of the remote subnet (configured as 'ip helper-address <DHCP-IP>' on Cisco devices). The relay agent intercepts client broadcasts and forwards them as unicast packets directly to the centralized DHCP server.",
  tip: "A classic interview question assessing cross-domain routing and server integration."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "In Windows Server 2025, what is the architectural difference between 'Load Balance' and 'Hot Standby' modes in DHCP Failover?",
  a: "Answer: In Load Balance mode, both partner servers are active simultaneously, serving client lease requests in a configured ratio (e.g., 50:50), making it ideal for multi-server enterprise LANs. In Hot Standby mode, one server serves as the primary active lease provider while the partner remains idle (standby); the secondary server only assumes lease handling if the primary server fails heartbeats (ideal for Hub-and-Spoke branch office architectures).",
  tip: "Core question evaluating high-availability, clustering, and disaster recovery expertise."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 08 Key Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - The DHCP Server role automates IP configuration parameters via the DORA lifecycle, delivering essential parameters including Default Gateway (Option 003) and DNS (Option 006).
      - Deploy MAC Address Reservations for network printers and fixed appliances; never configure manual static IPs inside dynamic DHCP pools.
      - An APIPA address (169.254.x.x) unequivocally diagnoses DHCP service unavailability, scope exhaustion, or physical link failure.
    ]
  ]
)

#pagebreak()
