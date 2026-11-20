#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab CCNA 200-301 Interview Question Vault (Edition 1)",
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
  title: "CCNA 200-301 INTERVIEW VAULT",
  subtitle: "120 Formal Technical Screening Questions · Senior Architect Answers · MNC Rubrics",
  edition: "2027 CAREER ACCELERATOR EDITION · EDITION 1",
  series-pill: "RTECHLAB COMMERCIAL SUITE · INTERVIEW VAULT EDITION 1",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-CCNA-VAULT-ED1",
  logo-path: "/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "CCNA 200-301 Technical Interview Vault",
  edition: "2027 Career Accelerator Edition · Edition 1 Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-CCNA-VAULT-ED1"
)

#pagebreak()

= EXECUTIVE INTERVIEW STRATEGY & MNC SCREENING RUBRIC

#concept-box(title: "SENIOR ARCHITECT INTERVIEW METHODOLOGY")[
  Technical interviews at leading multi-national corporations (MNCs) such as Cisco Systems TAC, Tata Consultancy Services (TCS), Wipro, Infosys, Bharti Airtel, HCL, and Cognizant do not merely test rote memorization. Interviewers evaluate your structural understanding of packet lifecycles, Layer 2 loop avoidance, Layer 3 routing logic, fault isolation methodology, and protocol debugging under live production pressure.
]

#v(4pt)

#table(
  columns: (1fr, 1.4fr, 2.6fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rtech-navy) } else { 0.5pt + rtech-border },
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else if calc.even(row) { rgb("#FFFFFF") } else { rgb("#F8FAFC") },
  inset: (x: 7pt, y: 5.5pt),
  [*CCNA Domain*], [*Interview Weight*], [*High-Yield Evaluation Focus Areas*],
  [Domain 1: Network Fundamentals], [20%], [TCP 3-way handshake, OSI encapsulation, IPv4 subnetting in seconds, IPv6 EUI-64 & SLAAC.],
  [Domain 2: Network Access], [20%], [802.1Q trunking, Native VLAN hopping defense, Spanning Tree Root Bridge election, EtherChannel LACP.],
  [Domain 3: IP Connectivity], [25%], [Longest Prefix Match (LPM), Floating static route failover, OSPFv2 cost tuning, DR/BDR election.],
  [Domain 4: IP Services], [10%], [DHCP DORA 4-way flow, DHCP relay agent (ip helper-address), NAT/PAT overload port allocation.],
  [Domain 5: Security Fundamentals], [15%], [Standard vs Extended ACL placement, switchport port security violation modes, SSH v2 RSA hardening.],
  [Domain 6: Automation & Cloud], [10%], [Control plane vs Data plane, SDN controllers (DNA Center), REST APIs (GET/POST/PUT), JSON/YAML.]
)

#pagebreak()

= DOMAIN 1: NETWORK FUNDAMENTALS & OSI ARCHITECTURE (Q01 – Q20)

#interview-compact(num: 1, q: "Explain the life of a packet from a client browser to a web server across a routed network.", a: "1. Client resolves server domain to IP via DNS query (UDP 53). 2. Client initiates TCP 3-way handshake (SYN, SYN-ACK, ACK). 3. If destination IP is remote, client resolves default gateway MAC via ARP. 4. Frame travels to switch; switch forwards out trunk to default gateway router. 5. Router de-encapsulates Layer 2, inspects Layer 3 destination IP, performs Longest Prefix Match, decrements TTL, re-encapsulates in next-hop Layer 2 frame, and forwards.", follow_up: "What field changes at every Layer 3 hop? Answer: Source and Destination MAC addresses; IP addresses remain constant (unless NAT is used).")

#interview-compact(num: 2, q: "What is the difference between TCP Windowing and Flow Control?", a: "TCP Window Size (advertised in the TCP header) indicates how many bytes of data the receiver buffer can accept before requiring an acknowledgment. Flow control dynamically shrinks the window size (down to 0, pausing transmission) if the receiver CPU or application buffer becomes congested.", follow_up: "What is TCP Silly Window Syndrome? Answer: When receiver repeatedly advertises tiny 1-byte windows.")

#interview-compact(num: 3, q: "Explain the differences between Cat5e, Cat6, and Cat6a cabling in enterprise environments.", a: "Cat5e operates at 100 MHz, supporting 1 Gbps up to 100 meters. Cat6 operates at 250 MHz, supporting 10 Gbps up to 55 meters (or 1G at 100m). Cat6a operates at 500 MHz, supporting full 10 Gbps across the entire 100-meter channel link while eliminating Alien Crosstalk (ANEXT).", follow_up: "Why does Cat6 have a plastic spline? Answer: Separates wire pairs internally to prevent NEXT.")

#interview-compact(num: 4, q: "How do you subnet 10.0.0.0/8 to provide 500 subnets with at least 100 hosts each?", a: "To get at least 100 hosts: $2^H - 2 ge 100 arrow H = 7$ bits ($2^7 - 2 = 126$ hosts). Host bits required = 7. Subnet bits = $32 - 7 = 25$. Mask = `/25` (`255.255.255.128`). Subnets created from `/8` to `/25`: $2^{25-8} = 2^{17} = 131,072$ subnets, vastly exceeding the 500 required.", follow_up: "What is the block size for /25? Answer: 128.")

#interview-compact(num: 5, q: "What is an IPv6 Solicited-Node Multicast address and how is it derived?", a: "It is an ICMPv6 multicast group used by Neighbor Discovery Protocol (NDP) to resolve MAC addresses without broadcasting. Prefix is `ff02::1:ff00:0/104`, formed by appending the last 24 bits (6 hex digits) of the target host's IPv6 address to `ff02::1:ff`.", follow_up: "Does NDP eliminate ARP? Answer: Yes, completely.")

#pagebreak()

= DOMAIN 2: SWITCHING, VLANS & TRUNKING (Q21 – Q40)

#interview-compact(num: 21, q: "What is a Native VLAN mismatch and what security risks does it create?", a: "When connected switches on an 802.1Q trunk have different Native VLANs configured (e.g. SW1 native vlan 10, SW2 native vlan 20), untagged traffic on SW1 will be placed into VLAN 20 on SW2. This causes cross-VLAN traffic leakage and enables VLAN Hopping attacks.", follow_up: "How do you identify a native VLAN mismatch? Answer: 'CDP-4-NATIVE_VLAN_MISMATCH' console error.")

#interview-compact(num: 22, q: "Explain the difference between Dynamic Desirable and Dynamic Auto in Cisco DTP.", a: "Dynamic Trunking Protocol (DTP) negotiates trunks automatically. 'Dynamic Desirable' actively asks the neighbor to trunk; 'Dynamic Auto' listens passively and only trunks if the neighbor requests it. Auto-to-Auto results in an Access port; Desirable-to-Auto forms a Trunk.", follow_up: "Security best practice for DTP? Answer: Disable it via 'switchport nonegotiate'.")

#interview-compact(num: 23, q: "How does Rapid PVST+ (802.1w) achieve sub-second convergence without timers?", a: "RSTP uses an active Proposal/Agreement handshake over full-duplex point-to-point links. When a new link comes up, the designated switch sends a Proposal; the receiving switch blocks all non-edge ports (Sync) and returns an Agreement, instantly transitioning the link to Forwarding.", follow_up: "What are the port states in RSTP? Answer: Discarding, Learning, Forwarding.")

#interview-compact(num: 24, q: "What is the difference between LACP and PAgP in EtherChannel?", a: "LACP (Link Aggregation Control Protocol) is an open IEEE 802.3ad standard (modes: Active, Passive). PAgP (Port Aggregation Protocol) is a Cisco proprietary standard (modes: Desirable, Auto). Active bundles up to 8 links with 8 standby links.", follow_up: "Can Active bundle with Passive? Answer: Yes, forms channel.")

#interview-compact(num: 25, q: "What conditions must match across physical interfaces before forming an EtherChannel?", a: "1. Identical speed and duplex. 2. Identical switchport mode (all access or all trunk). 3. If access, identical VLAN ID. 4. If trunk, identical native VLAN and identical allowed VLAN list. 5. Identical STP cost.", follow_up: "What happens if one port speed differs? Answer: Port is placed in 'susp' (suspended) state.")

#pagebreak()

= DOMAIN 3: IP CONNECTIVITY & OSPF ROUTING (Q41 – Q60)

#interview-compact(num: 41, q: "Why does Longest Prefix Match (LPM) supersede Administrative Distance?", a: "Administrative Distance determines which route source is trusted when different protocols learn the exact same prefix. LPM determines which route in the active routing table is mathematically the most specific match for an incoming packet's destination IP.", follow_up: "If table has 10.1.0.0/16 (AD 90) and 10.1.1.0/24 (AD 110), packet for 10.1.1.1 chooses which? Answer: 10.1.1.0/24.")

#interview-compact(num: 42, q: "What are the 7 OSPF neighbor adjacency states in sequential order?", a: "1. Down: No Hello received. 2. Init: Hello received from neighbor, but local RID not listed. 3. 2-Way: Bi-directional communication confirmed (DR/BDR elected here). 4. ExStart: Master/Slave determined for DBD exchange. 5. Exchange: DBD packets describe LSDB. 6. Loading: LSR and LSU packets request and send missing LSAs. 7. Full: LSDBs are 100% identical.", follow_up: "In what state do DROthers stay with each other? Answer: 2-Way state.")

#interview-compact(num: 43, q: "Explain the difference between OSPF LSA Type 1, Type 2, and Type 3.", a: "Type 1 (Router LSA): Generated by every router, describes its own links and cost within its local area. Type 2 (Network LSA): Generated by the Designated Router (DR), lists all routers connected to the multi-access segment. Type 3 (Summary LSA): Generated by an Area Border Router (ABR), advertises inter-area networks into adjacent areas.", follow_up: "What generates Type 5 LSAs? Answer: Autonomous System Boundary Router (ASBR).")

#interview-compact(num: 44, q: "What causes two OSPF routers to fail to form a Full adjacency?", a: "1. Subnet mask mismatch. 2. Hello / Dead interval mismatch. 3. Area ID mismatch. 4. OSPF authentication password mismatch. 5. MTU mismatch (causes hang in ExStart). 6. Duplicate Router ID.", follow_up: "How do you bypass MTU check? Answer: 'ip ospf mtu-ignore'.")

#interview-compact(num: 45, q: "What is an OSPF Passive Interface and when is it configured?", a: "A passive interface prevents OSPF from transmitting Hello packets out that port, conserving CPU and bandwidth while preventing unauthorized neighbor relationships. Crucially, the interface subnet continues to be advertised into the OSPF domain. Applied on user LAN ports.", follow_up: "CLI command? Answer: 'passive-interface [interface]'.")

#pagebreak()

= DOMAIN 4: IP SERVICES (DHCP, NAT & NTP) (Q61 – Q80)

#interview-compact(num: 61, q: "Explain how a DHCP Relay Agent (ip helper-address) works at the packet level.", a: "When a client broadcasts a DHCPDISCOVER (src: 0.0.0.0, dst: 255.255.255.255, UDP 67), the router interface configured with 'ip helper-address [server-ip]' intercepts the broadcast, inserts its own interface IP into the 'giaddr' (Gateway IP Address) field, converts the packet to unicast, and routes it to the DHCP server.", follow_up: "Why is giaddr critical? Answer: It tells the DHCP server which IP subnet pool to draw from!")

#interview-compact(num: 62, q: "What is the difference between Static NAT, Dynamic NAT, and PAT?", a: "Static NAT: 1-to-1 permanent mapping between a private IP and public IP (used for inbound web/mail servers). Dynamic NAT: 1-to-1 mapping from a pool of public IPs on a first-come, first-served basis. PAT (Port Address Translation / NAT Overload): Many-to-1 mapping multiplexed via unique source port numbers.", follow_up: "What port range does PAT use? Answer: Ephemeral ports 1024 to 65535.")

#interview-compact(num: 63, q: "Explain the purpose of Network Time Protocol (NTP) in enterprise logging and security.", a: "NTP synchronizes device clocks across the enterprise (Stratum hierarchy). Accurate time synchronization is critical for correlating security incidents across firewalls, authentication servers, and syslog servers, and for validating X.509 digital certificate expiration dates.", follow_up: "What port does NTP use? Answer: UDP port 123.")

#interview-compact(num: 64, q: "What is SNMP (Simple Network Management Protocol) and what are its versions?", a: "SNMP monitors network device health (CPU, bandwidth, errors) using Managers and Agents with MIBs (Management Information Bases). v1/v2c transmit community strings in clear plaintext (security risk). v3 provides message integrity, authentication (SHA), and encryption (AES-256).", follow_up: "What is an SNMP Trap? Answer: Unsolicited alert sent by agent to manager on UDP 162.")

#interview-compact(num: 65, q: "What is Syslog and what are its 8 severity levels?", a: "Syslog (UDP 514) logs system event messages. Severity levels 0 to 7: 0: Emergency, 1: Alert, 2: Critical, 3: Error, 4: Warning, 5: Notice, 6: Informational, 7: Debugging (mnemonic: 'Every Adult Cat Eats Warm Noodles In Darkness').", follow_up: "Which level generates the most CPU overhead? Answer: Level 7 (Debugging).")

#pagebreak()

= DOMAIN 5: NETWORK SECURITY & ACCESS CONTROL (Q81 – Q100)

#interview-compact(num: 81, q: "What is the difference between a Standard ACL and an Extended ACL in Cisco IOS?", a: "Standard ACLs (1–99, 1300–1999) evaluate ONLY Source IP address; place close to the destination. Extended ACLs (100–199, 2000–2699) evaluate Protocol (TCP/UDP/ICMP), Source IP/Port, and Destination IP/Port; place close to the source.", follow_up: "How do you calculate wildcard masks? Answer: Invert subnet mask (255.255.255.255 - Mask).")

#interview-compact(num: 82, q: "What is DHCP Snooping and how does it prevent rogue DHCP server attacks?", a: "DHCP Snooping is a Layer 2 security feature on switches that classifies ports as Trusted (uplinks to legitimate DHCP servers) or Untrusted (user access ports). The switch drops DHCP Offer and Ack packets arriving on untrusted ports, preventing rogue servers from hijacking default gateways.", follow_up: "What table does DHCP Snooping build? Answer: DHCP Snooping Binding Database.")

#interview-compact(num: 83, q: "What is Dynamic ARP Inspection (DAI) and how does it prevent ARP Poisoning?", a: "DAI intercepts all ARP requests and replies on untrusted ports and validates the IP-to-MAC binding against the trusted DHCP Snooping binding table. If an attacker attempts to claim another host's IP with a spoofed MAC (gratuitous ARP), DAI drops the frame and emits an alarm.", follow_up: "What prerequisite does DAI require? Answer: DHCP Snooping must be enabled first.")

#interview-compact(num: 84, q: "Explain the three AAA framework components (Authentication, Authorization, Accounting).", a: "Authentication: Verifies who the user is (username/password, MFA). Authorization: Determines what resources and commands the user is allowed to access (privilege levels, command authorization). Accounting: Records what the user actually did, tracking commands executed and session durations via TACACS+ or RADIUS.", follow_up: "Which protocol separates Authentication and Authorization? Answer: TACACS+ (TCP 49).")

#interview-compact(num: 85, q: "What is the difference between TACACS+ and RADIUS?", a: "TACACS+ is Cisco proprietary, uses TCP port 49, separates AAA into distinct modular functions, and encrypts the ENTIRE packet payload. RADIUS is an open IETF standard (UDP 1812/1813), combines Authentication and Authorization, and encrypts only the password field.", follow_up: "Which is preferred for device administration? Answer: TACACS+.")

#pagebreak()

= DOMAIN 6: AUTOMATION, PROGRAMMABILITY & CLOUD (Q101 – Q120)

#interview-compact(num: 101, q: "Explain the difference between the Control Plane and Data Plane in SDN.", a: "Data Plane (Forwarding): Physical hardware ASICs that forward packets based on forwarding tables (FIB). Control Plane: Software logic (OSPF, BGP, STP) that builds the forwarding tables. Software-Defined Networking (SDN) decouples the control plane from distributed hardware and centralizes it into a software controller.", follow_up: "What is the Management Plane? Answer: Administrative access interfaces (CLI, GUI, APIs).")

#interview-compact(num: 102, q: "What is the difference between RESTCONF and NETCONF?", a: "Both are programmatic network APIs based on the YANG data modeling language. NETCONF (RFC 6241) uses SSH transport and XML formatting. RESTCONF (RFC 8040) is an HTTP-based RESTful implementation using standard HTTP verbs (GET, POST, PUT, DELETE) and JSON or XML payloads.", follow_up: "What data modeling language do they share? Answer: YANG (RFC 6020).")

#interview-compact(num: 103, q: "What are the common HTTP verbs used in RESTful network APIs?", a: "GET: Retrieve data (equivalent to 'show' commands). POST: Create a new resource (e.g. create a new VLAN or interface). PUT: Replace/update an existing resource entirely. PATCH: Partially update an existing resource. DELETE: Remove a resource (equivalent to 'no' commands).", follow_up: "What HTTP status code indicates success with data? Answer: 200 OK (201 Created for POST).")

#interview-compact(num: 104, q: "What is the difference between JSON and YAML data formats?", a: "JSON (JavaScript Object Notation) uses curly braces `{}` and square brackets `[]` with key-value pairs; strictly machine-readable. YAML (YAML Ain't Markup Language) uses clean whitespace indentation without braces; highly human-readable, widely used in Ansible playbooks and Kubernetes manifests.", follow_up: "Which is stricter about indentation? Answer: YAML.")

#interview-compact(num: 105, q: "Explain the difference between Ansible, Puppet, and Chef in configuration management.", a: "Ansible is agentless (uses SSH/Python) and operates via push-based playbooks written in YAML. Puppet is agent-based, pull-based, and uses a declarative domain-specific language (DSL). Chef is agent-based, pull-based, and uses procedural Ruby recipes.", follow_up: "Which is most popular in network engineering? Answer: Ansible (because network switches lack agent install access).")

#interview-compact(num: 106, q: "What is Cisco DNA Center and what is its role in SDA (Software-Defined Access)?", a: "Cisco DNA Center is an enterprise network management controller providing automation, analytics, and policy. In SD-Access, it builds a campus overlay network using LISP (Locator/ID Separation Protocol) for control plane, VXLAN for data plane, and TrustSec for group-based security policies.", follow_up: "What protocol encapsulates packets in SDA? Answer: VXLAN.")

#interview-compact(num: 107, q: "What is an Overlay network versus an Underlay network?", a: "The Underlay is the physical Layer 3 routed network infrastructure (cables, spine-leaf switches, routers running OSPF/BGP). The Overlay is a logical virtualized network built on top of the underlay using encapsulation tunnels (e.g., VXLAN, GRE, IPsec) to transport customer traffic independent of physical topology.", follow_up: "Does the underlay know about customer VLANs? Answer: No, underlay only routes tunnel packets.")
