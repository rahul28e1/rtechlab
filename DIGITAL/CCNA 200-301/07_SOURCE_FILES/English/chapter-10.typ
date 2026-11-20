#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 10 · MASTER PLACEMENT VAULT & VIVA GUIDE]
= Chapter 10: CCNA Top 50 MNC Interview Bank & Viva

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Comprehensive technical screening vault: 50 high-frequency placement questions with senior network architect model answers across all 6 CCNA domains (Cisco TAC, TCS, Infosys, Wipro, Airtel, Cognizant), 30 rapid-fire viva one-liners, exam strategy, and salary blueprint.
]

#v(2pt)

== 10.1 Network Fundamentals & Physical Layer (Q1 – Q8)
#interview-compact(num: 1, q: "Explain the difference between a collision domain and a broadcast domain.", a: "A collision domain is a physical network segment where frame collisions occur if two nodes transmit simultaneously; each switch port represents an independent collision domain. A broadcast domain is the logical area bounded by Layer 3 routers within which a broadcast frame (FFFF.FFFF.FFFF) is flooded to all nodes.", follow_up: "How many broadcast domains exist on a 24-port switch with 3 VLANs? Answer: Exactly 3.")
#interview-compact(num: 2, q: "What is the difference between Half-Duplex and Full-Duplex communication?", a: "Half-Duplex transmits in only one direction at a time and requires CSMA/CD to detect collisions (legacy hubs). Full-Duplex transmits and receives simultaneously across separate wire pairs, doubling throughput and completely eliminating collisions (switches).", follow_up: "What happens if autonegotiation fails? Answer: Port defaults to half-duplex, causing duplex mismatch.")
#interview-compact(num: 3, q: "Describe the encapsulation and de-encapsulation lifecycle across the OSI model.", a: "Data originates at Layer 7-5, is segmented with TCP/UDP port headers at Layer 4 (Segment), encapsulated with IP addresses at Layer 3 (Packet), framed with MAC addresses and FCS at Layer 2 (Frame), and converted to electrical/optical signals at Layer 1 (Bits). Receiver de-encapsulates in reverse order.", follow_up: "What layer does an IP router inspect? Answer: Layer 3 destination IP.")
#interview-compact(num: 4, q: "When is a Straight-Through cable used versus a Crossover cable?", a: "Straight-Through connects disparate Layer devices (PC to Switch, Switch to Router) using identical pinouts on both ends. Crossover connects like Layer devices (Switch to Switch, PC to Router) swapping pins 1/2 with 3/6. Auto-MDIX eliminates physical cable constraints dynamically.", follow_up: "Why do PC and router connect via crossover? Answer: Both transmit on pins 1/2.")
#interview-compact(num: 5, q: "What are the core differences between TCP and UDP?", a: "TCP (Transmission Control Protocol) is connection-oriented, reliable, orders packets, retransmits lost segments, and uses a 3-way handshake (SYN, SYN-ACK, ACK). UDP (User Datagram Protocol) is connectionless, unreliable, has minimal 8-byte header overhead, and is optimized for real-time VoIP and video streaming.", follow_up: "What protocol does DNS use? Answer: UDP 53 for queries, TCP 53 for zone transfers.")
#interview-compact(num: 6, q: "Explain the TCP 3-Way Handshake and 4-Way Teardown.", a: "Establishment: Client sends SYN (seq=x), server responds with SYN-ACK (seq=y, ack=x+1), client returns ACK (ack=y+1). Teardown: Client sends FIN, server ACKs, server sends FIN, client ACKs and waits 2MSL (Maximum Segment Lifetime).", follow_up: "What attack floods SYN without completing ACK? Answer: SYN Flood Denial of Service.")
#interview-compact(num: 7, q: "What are the distance and bandwidth constraints of Single-Mode vs Multi-Mode fiber?", a: "Single-Mode fiber (SMF, 9um core) uses laser light at 1310/1550nm to transmit up to 10-80+ km with negligible modal dispersion. Multi-Mode fiber (MMF, 50/62.5um core) uses LED/VCSEL at 850nm and is limited to 300-550m due to modal distortion.", follow_up: "What color is standard SMF patch cord? Answer: Yellow.")
#interview-compact(num: 8, q: "What is an MTU and what happens if a packet exceeds it?", a: "Maximum Transmission Unit (standard 1500 bytes for Ethernet). If a packet exceeds interface MTU and the Don't Fragment (DF) flag is set to 0, the router fragments it into smaller packets. If DF=1, the router drops it and returns ICMP Type 3 Code 4 (Fragmentation Needed).", follow_up: "What is Path MTU Discovery (PMTUD)? Answer: Method to discover lowest MTU along path.")

#pagebreak()

== 10.2 IPv4 Subnetting & IPv6 Architecture (Q9 – Q17)
#interview-compact(num: 9, q: "How do you calculate the usable hosts and network ID for 172.16.85.120/26?", a: "A /26 mask is 255.255.255.192. Magic Number is 256 - 192 = 64. Subnet multiples are 0, 64, 128. Host .120 falls in subnet 172.16.85.64. Broadcast address is .127. Usable host range is 172.16.85.65 through 172.16.85.126 (62 usable hosts).", follow_up: "What is the wildcard mask? Answer: 0.0.0.63.")
#interview-compact(num: 10, q: "What are the three RFC 1918 Private IP address blocks?", a: "Class A: 10.0.0.0/8 (10.0.0.0 - 10.255.255.255); Class B: 172.16.0.0/12 (172.16.0.0 - 172.31.255.255); Class C: 192.168.0.0/16 (192.168.0.0 - 192.168.255.255). These are not routable on the public Internet without NAT.", follow_up: "What is 169.254.0.0/16 used for? Answer: APIPA link-local failover.")
#interview-compact(num: 11, q: "Explain Variable Length Subnet Masking (VLSM) and its primary design rule.", a: "VLSM allows different subnet masks across the same network address space to minimize wasted IPs. The fundamental golden rule is to sort subnets in descending order of required host count (largest to smallest) before allocating prefixes.", follow_up: "Why not allocate /30 links first? Answer: It fragments contiguous address blocks.")
#interview-compact(num: 12, q: "What are the compression rules defined in RFC 5952 for IPv6?", a: "Rule 1: Leading zeros within any 16-bit hextet must be omitted (e.g. :0042: becomes :42:). Rule 2: A single contiguous sequence of all-zero hextets can be replaced with '::' exactly once per address.", follow_up: "Compress 2001:0db8:0000:0000:0001:0000:0000:0002. Answer: 2001:db8::1:0:0:2.")
#interview-compact(num: 13, q: "What is an IPv6 Link-Local Address (LLA) and what is its prefix?", a: "An LLA (prefix fe80::/10) is mandatory on all IPv6 interfaces, used strictly for communication within the local link (NDP neighbor discovery, routing protocol next-hop addresses). It is non-routable beyond the local physical subnet.", follow_up: "Can two interfaces on different routers have fe80::1? Answer: Yes, scope is link-local only.")
#interview-compact(num: 14, q: "How is an IPv6 EUI-64 Interface Identifier generated from a 48-bit MAC?", a: "The 48-bit MAC address is split into two 24-bit halves, the 16-bit hex constant 0xFFFE is inserted in the middle, and the 7th bit (Universal/Local flag) of the first byte is inverted (toggled from 0 to 1).", follow_up: "Convert MAC 00:11:22:33:44:55. Answer: 0211:22ff:fe33:4455.")
#interview-compact(num: 15, q: "Explain Stateless Address Autoconfiguration (SLAAC) in IPv6.", a: "A host transmits an ICMPv6 Router Solicitation (RS) to multicast ff02::2. The local router responds with a Router Advertisement (RA) to ff02::1 providing the /64 network prefix. The client generates its own 64-bit host ID and performs Duplicate Address Detection (DAD).", follow_up: "Does SLAAC require a DHCP server? Answer: No, it is completely stateless.")
#interview-compact(num: 16, q: "What replaces ARP broadcasts in IPv6?", a: "IPv6 replaces broadcast ARP with the Neighbor Discovery Protocol (NDP), utilizing ICMPv6 Neighbor Solicitation (NS) sent to a targeted Solicited-Node Multicast address (ff02::1:ffxx:xxxx) and Neighbor Advertisement (NA).", follow_up: "Why is NDP superior to ARP? Answer: Eliminates CPU-interrupting broadcasts.")
#interview-compact(num: 17, q: "What are the three primary IPv4-to-IPv6 transition mechanisms?", a: "1. Dual-Stack: Devices run both IPv4 and IPv6 stacks concurrently. 2. Tunneling: Encapsulating IPv6 packets inside IPv4 headers (6to4, GRE). 3. Translation: Converting IPv6 headers to IPv4 headers using NAT64 and DNS64.", follow_up: "Which is preferred for enterprise networks? Answer: Dual-Stack.")

#pagebreak()

== 10.3 Cisco IOS Architecture & Device Hardening (Q18 – Q26)
#interview-compact(num: 18, q: "What are the four primary memory types on a Cisco router and their roles?", a: "ROM stores POST, Bootstrap, and ROMMON mini-OS. Flash memory stores the Cisco IOS system image (.bin). NVRAM stores startup-config and configuration register. RAM stores running-config, routing tables, and ARP buffers (volatile).", follow_up: "Which memory is erased when power is lost? Answer: RAM.")
#interview-compact(num: 19, q: "Describe the 5 stages of the Cisco router boot sequence.", a: "1. POST executes from ROM. 2. Bootstrap loader initializes hardware. 3. IOS image is located (Flash, TFTP, or ROMMON). 4. IOS image is loaded into RAM. 5. Configuration register is checked: if 0x2102, loads startup-config from NVRAM; if 0x2142, enters setup dialog.", follow_up: "What mode is entered if flash is empty? Answer: ROMMON mode.")
#interview-compact(num: 20, q: "How do you recover a lost Cisco router password without wiping configuration?", a: "Interrupt boot with Break key into ROMMON. Issue 'confreg 0x2142' and 'reset'. In user exec, type enable. Copy startup-config to running-config. Configure new enable secret. Reset register to 0x2102 ('config-register 0x2102'). Save via 'copy run start'.", follow_up: "What happens if you run 'copy run start' before 'copy start run'? Answer: NVRAM config is wiped!")
#interview-compact(num: 21, q: "What is the difference between enable password and enable secret?", a: "enable password uses weak reversible Type 7 encryption or plaintext. enable secret uses irreversible cryptographic hashes (MD5 Type 5 or SHA-256 Type 8/9). Cisco IOS always prioritizes enable secret over enable password.", follow_up: "What does 'service password-encryption' do? Answer: Obfuscates plaintext passwords into Type 7.")
#interview-compact(num: 22, q: "What configuration commands are required to enable SSH v2 on a Cisco router?", a: "1. 'hostname R1', 2. 'ip domain-name test.com', 3. 'crypto key generate rsa modulus 2048', 4. 'ip ssh version 2', 5. 'username admin secret Pass123', 6. under line vty 0 4: 'transport input ssh' and 'login local'.", follow_up: "Why is domain-name mandatory? Answer: RSA keys require an FQDN to bind.")
#interview-compact(num: 23, q: "What is the purpose of 'logging synchronous' and 'exec-timeout 5 0' on line console 0?", a: "logging synchronous prevents unsolicited system log output from breaking up command typing. exec-timeout 5 0 automatically terminates idle console sessions after 5 minutes and 0 seconds of inactivity to enforce physical security.", follow_up: "What does 'exec-timeout 0 0' mean? Answer: Session never times out (security risk).")
#interview-compact(num: 24, q: "Compare Cisco Discovery Protocol (CDP) and Link Layer Discovery Protocol (LLDP).", a: "CDP is Cisco-proprietary, enabled by default, sends periodic multicast every 60s. LLDP is vendor-neutral IEEE 802.1AB standard used across mixed vendors. Both share device ID, port ID, capabilities, IP address, and platform info.", follow_up: "Why disable CDP on public ports? Answer: Prevents leaking reconnaissance data.")
#interview-compact(num: 25, q: "What is the function of the 'do' command in Cisco IOS CLI?", a: "The 'do' prefix allows privileged exec commands (such as 'do show ip int brief' or 'do show run') to be executed directly from within any configuration sub-mode without exiting back to privileged exec.", follow_up: "Can tab completion be used with 'do'? Answer: In modern IOS-XE versions, yes.")
#interview-compact(num: 26, q: "How do you recover a Cisco switch when the administrator password is unknown?", a: "Unplug switch power cord, hold the front-panel Mode button while reconnecting power. Release when SYST LED turns solid green. Issue 'flash_init', 'rename flash:config.text flash:config.old', and 'boot'. Rename back in IOS and change password.", follow_up: "Why rename config.text? Answer: Switch bootloader bypasses startup configuration.")

#pagebreak()

== 10.4 Switching, VLANs, Trunking & STP (Q27 – Q35)
#interview-compact(num: 27, q: "Explain the three core functions of a Layer 2 switch.", a: "1. Address Learning: Records Source MAC and port in CAM table (aging 300s). 2. Forwarding/Filtering: Forwards known unicast strictly out destination port; filters frames from looping. 3. Flooding: Floods unknown unicast, broadcast, and multicast out all ports in the same VLAN.", follow_up: "What causes a MAC address table overflow? Answer: MAC Flooding attack.")
#interview-compact(num: 28, q: "What is a VLAN and why is it implemented in campus enterprise networks?", a: "A VLAN is a logical broadcast domain created within physical switches. It segments traffic by department, contains broadcast storms, enhances security isolation, and allows QoS policies without requiring physical recabling.", follow_up: "Where is the normal-range VLAN database stored? Answer: flash:vlan.dat.")
#interview-compact(num: 29, q: "Describe the IEEE 802.1Q frame tagging format and Native VLAN security.", a: "802.1Q inserts a 4-byte tag into the Ethernet header containing TPID (0x8100), PCP/CoS (3 bits), and VLAN ID (12 bits, up to 4094 VLANs). Native VLAN traffic is untagged. Best practice: change native VLAN to an unused ID (e.g. 999) to prevent VLAN hopping.", follow_up: "What error occurs if native VLANs mismatch across a trunk? Answer: Native VLAN Mismatch CDP alarm.")
#interview-compact(num: 30, q: "How does Router-on-a-Stick (ROAS) perform Inter-VLAN routing?", a: "A single physical Gigabit interface connects to a switch trunk. The router interface is divided into logical subinterfaces (e.g. g0/0.10, g0/0.20), each configured with 'encapsulation dot1Q [vlan]' and assigned an IP acting as that VLAN's default gateway.", follow_up: "What is an alternative to ROAS? Answer: Layer 3 Switch with Switched Virtual Interfaces (SVIs).")
#interview-compact(num: 31, q: "What network hazards occur when redundant Layer 2 switch links lack Spanning Tree?", a: "1. Broadcast Storms (endless frame looping saturates 100% bandwidth). 2. CAM Table Instability / MAC thrashing (switch constantly overwrites MAC port mappings). 3. Multiple Frame Copies arriving out of order at destination endpoints.", follow_up: "Does Layer 2 Ethernet have a TTL field like IP? Answer: No, frames loop infinitely.")
#interview-compact(num: 32, q: "Explain the STP Root Bridge election math.", a: "The switch with the lowest Bridge ID (BID) wins. BID = Bridge Priority (2 bytes) + Extended System ID / VLAN ID + Base MAC (6 bytes). Default priority is 32768. To force a switch to become root, configure 'spanning-tree vlan [x] priority 4096' (multiples of 4096).", follow_up: "What is the priority for VLAN 20 if default? Answer: 32768 + 20 = 32788.")
#interview-compact(num: 33, q: "Differentiate between Root Port (RP), Designated Port (DP), and Blocking Port.", a: "Root Port (RP): One port per non-root switch with lowest cumulative path cost to Root Bridge; always Forwarding. Designated Port (DP): One port per segment forwarding traffic toward Root; all Root Bridge ports are DPs. Blocking Port: Redundant loop path; drops data frames.", follow_up: "How many Root Ports does a Root Bridge have? Answer: Exactly 0.")
#interview-compact(num: 34, q: "Compare STP (802.1D) and Rapid STP (RSTP 802.1w) convergence.", a: "802.1D takes 30-50 seconds (Blocking 20s, Listening 15s, Learning 15s, Forwarding) relying on static timers. RSTP (802.1w) converges in under 1 second using an active Proposal/Agreement handshake on point-to-point full-duplex links.", follow_up: "What are RSTP port states? Answer: Discarding, Learning, Forwarding.")
#interview-compact(num: 35, q: "What is the purpose of Spanning Tree PortFast and BPDU Guard?", a: "PortFast transitions access ports immediately from Discarding to Forwarding, bypassing 30s delays to prevent DHCP timeouts on booting PCs. BPDU Guard protects PortFast ports: if any device transmits a BPDU (rogue switch), the port is shut down into err-disabled state.", follow_up: "Should PortFast be enabled on trunk ports? Answer: NEVER, causes broadcast loops.")

#pagebreak()

== 10.5 IP Routing, OSPF, NAT & Security Services (Q36 – Q43)
#interview-compact(num: 36, q: "Explain the Longest Prefix Match (LPM) rule in routing table lookups.", a: "When a packet arrives, the router searches for matching destination prefixes. The route with the longest (most specific) subnet mask is ALWAYS chosen. E.g., for destination 10.1.1.5, route 10.1.1.0/24 wins over 10.1.0.0/16 and 10.0.0.0/8, regardless of Administrative Distance.", follow_up: "What route matches if no specific prefix matches? Answer: Default route 0.0.0.0/0.")
#interview-compact(num: 37, q: "What is a Floating Static Route and how is it configured?", a: "A floating static route is a backup route configured with an Administrative Distance higher than the primary dynamic routing protocol. It remains inactive in the background until the primary route fails: 'ip route 0.0.0.0 0.0.0.0 10.1.1.2 115' (backup for OSPF AD 110).", follow_up: "Why is it called floating? Answer: It floats into the routing table upon failure.")
#interview-compact(num: 38, q: "Explain how OSPF calculates link cost and why auto-cost reference-bandwidth is required.", a: "OSPF Cost = Reference Bandwidth / Interface Bandwidth (default 100 Mbps / BW). FastEthernet (100M) cost = 1; GigabitEthernet (1000M) cost = 0.1 which rounds to 1! 'auto-cost reference-bandwidth 10000' changes reference to 10 Gbps, giving Gigabit cost 10 and 10G cost 1.", follow_up: "Does changing reference-bandwidth need to be done on all routers? Answer: YES, strictly.")
#interview-compact(num: 39, q: "Describe the OSPF Router ID (RID) election criteria.", a: "1. Manual configuration via 'router-id [x.x.x.x]'. 2. Highest IPv4 address on any active Loopback interface. 3. Highest IPv4 address on any active physical interface in up/up operational state.", follow_up: "Why prefer Loopback interfaces? Answer: Loopbacks never drop or flap physically.")
#interview-compact(num: 40, q: "Explain the role of the OSPF Designated Router (DR) and Backup DR (BDR).", a: "On broadcast multi-access Ethernet, DR prevents full-mesh N(N-1)/2 flooding. Non-DR routers (DROther) form Full adjacencies only with DR and BDR. DROthers send updates to 224.0.0.6 (All DRs); DR floods updates to all routers via 224.0.0.5.", follow_up: "How is DR elected? Answer: Highest OSPF Priority (default 1), then highest RID.")
#interview-compact(num: 41, q: "Why must all non-backbone areas connect directly to Area 0 in Multi-Area OSPF?", a: "Area 0 acts as the central transit exchange. Forcing all inter-area traffic through Area 0 prevents routing loops by enforcing a split-horizon loop-free topology between areas. If physical connection is broken, an OSPF Virtual Link through a transit area is required.", follow_up: "What router connects Area 0 to Area 1? Answer: Area Border Router (ABR).")
#interview-compact(num: 42, q: "Explain the 4-step DHCP DORA process and DHCP Relay Agent.", a: "Discover (client broadcast UDP 67), Offer (server unicast UDP 68), Request (client broadcast UDP 67), Acknowledge (server unicast UDP 68). Because routers block broadcasts, 'ip helper-address [server-ip]' converts client Discover into unicast forwarded to the remote DHCP server.", follow_up: "What port does the relay agent forward to? Answer: UDP port 67 on the server.")
#interview-compact(num: 43, q: "What is the difference between Standard ACL and Extended ACL?", a: "Standard ACLs (1-99) filter strictly on Source IP address and must be placed as close to the Destination as possible. Extended ACLs (100-199) filter on Protocol, Source IP, Source Port, Dest IP, and Dest Port, and must be placed as close to the Source as possible.", follow_up: "What is at the end of every ACL? Answer: Implicit Deny All (deny ip any any).")

#pagebreak()

== 10.6 Advanced Security & Top 15 Viva Rapid-Fire One-Liners (Q44 – Q50 & Viva 1–15)
#interview-compact(num: 44, q: "Explain Port Address Translation (PAT / NAT Overload) and Inside Local vs Global.", a: "PAT maps multiple private inside local IPs to a single public inside global IP by tracking unique Layer 4 source ports (>1024). Inside Local is private client IP; Inside Global is public ISP IP on outside router interface.", follow_up: "How many translations can PAT support? Answer: Up to ~64,000 ephemeral ports.")
#interview-compact(num: 45, q: "Explain the three Switch Port Security violation modes.", a: "1. Protect: Silently drops frames from unauthorized MACs; no log. 2. Restrict: Drops frames, generates syslog/SNMP trap, increments violation counter. 3. Shutdown: Drops frames, generates syslog, immediately disables port into err-disabled state (amber LED).", follow_up: "Which mode is Cisco default? Answer: Shutdown mode.")
#interview-compact(num: 46, q: "What is EtherChannel and what protocols negotiate it?", a: "EtherChannel bundles up to 8 active parallel physical Ethernet links into a single logical link, multiplying bandwidth and providing instant fault tolerance without STP blocking. Negotiated via LACP (IEEE 802.3ad open standard) or PAgP (Cisco proprietary).", follow_up: "What LACP modes establish a channel? Answer: Active-Active or Active-Passive.")
#interview-compact(num: 47, q: "What is First Hop Redundancy Protocol (FHRP) and HSRP?", a: "Hot Standby Router Protocol (HSRP, RFC 2281) provides default gateway redundancy. Active and Standby routers share a Virtual IP and Virtual MAC (0000.0c07.acXX). If Active fails, Standby takes over forwarding transparently in under 3 seconds.", follow_up: "What enables faster failover? Answer: HSRP Preemption and tuning timers.")
#interview-compact(num: 48, q: "What is the difference between Control Plane, Data Plane, and Management Plane?", a: "Data Plane (Forwarding): Processes and forwards transit packets in hardware ASICs (routing table lookups, ACL filtering). Control Plane: Determines forwarding logic via software protocols (OSPF, BGP, STP). Management Plane: Handles administrative access (SSH, SNMP, HTTPS).", follow_up: "Which plane does Software-Defined Networking (SDN) centralize? Answer: Control Plane.")
#interview-compact(num: 49, q: "What is Cisco DNA Center and how does Intent-Based Networking function?", a: "Cisco DNA Center is a centralized network controller managing enterprise fabrics via APIs. It translates business intent (e.g. 'Isolate Guest Wi-Fi') into automated network configurations pushed across all switches and routers using RESTCONF/NETCONF.", follow_up: "What data formats do controller REST APIs return? Answer: JSON and YAML.")
#interview-compact(num: 50, q: "Explain the difference between Symmetric and Asymmetric Cryptography.", a: "Symmetric uses a single shared secret key for encryption and decryption (AES-256, fast, bulk data). Asymmetric uses a mathematically linked keypair: public key encrypts, private key decrypts (RSA, ECC, slow, used for key exchange and digital signatures).", follow_up: "Which does IPsec Phase 1 use? Answer: Asymmetric Diffie-Hellman to exchange symmetric keys.")

#v(2pt)

== 10.7 Top 15 Viva-Voce One-Liners (Part 1: 1–15)
#short-qa(num: 1, q: "What is the certified length limit of Cat6 copper Ethernet?", a: "100 meters (90m horizontal solid core + 10m patch cords).")
#short-qa(num: 2, q: "What is the broadcast MAC address?", a: "FFFF.FFFF.FFFF (48 binary ones).")
#short-qa(num: 3, q: "What is the default console baud rate on Cisco devices?", a: "9600 bps (9600-8-N-1).")
#short-qa(num: 4, q: "What command saves running-config to NVRAM?", a: "copy running-config startup-config (or write memory).")
#short-qa(num: 5, q: "What Configuration Register value ignores NVRAM during boot?", a: "0x2142 (Bit 6 set).")
#short-qa(num: 6, q: "What is the Administrative Distance of a static route?", a: "1.")
#short-qa(num: 7, q: "What is the default Administrative Distance of OSPF?", a: "110.")
#short-qa(num: 8, q: "What transport protocol and port does DNS query use?", a: "UDP Port 53.")
#short-qa(num: 9, q: "What protocol resolves an IP address to a physical MAC address?", a: "Address Resolution Protocol (ARP).")
#short-qa(num: 10, q: "What is the purpose of the 802.1Q Native VLAN?", a: "Carries untagged legacy traffic across an 802.1Q trunk.")
#short-qa(num: 11, q: "How many usable hosts exist in a /28 subnet?", a: "14 usable hosts (2^4 - 2 = 14).")
#short-qa(num: 12, q: "What multicast address reaches All OSPF Routers?", a: "224.0.0.5.")
#short-qa(num: 13, q: "What does an MTU mismatch between OSPF neighbors cause?", a: "Routers get stuck in ExStart / Exchange state.")
#short-qa(num: 14, q: "What is the default Spanning Tree bridge priority on VLAN 1?", a: "32769 (Base priority 32768 + Sys-ID-Ext 1).")
#short-qa(num: 15, q: "What does the command 'ip routing' do on a Layer 3 switch?", a: "Enables the Layer 3 IP routing engine between VLAN SVIs.")

#pagebreak()

== 10.8 Viva-Voce One-Liners (Part 2: 16–30) & 2027 CCNA Exam Strategy
#short-qa(num: 16, q: "What is the IPv6 loopback address?", a: "::1/128.")
#short-qa(num: 17, q: "What does APIPA address 169.254.x.x signify?", a: "Client failed to reach a DHCP server.")
#short-qa(num: 18, q: "What port security mode puts an offending interface into err-disabled?", a: "Shutdown mode.")
#short-qa(num: 19, q: "What is the default aging time of a Cisco switch CAM table entry?", a: "300 seconds (5 minutes).")
#short-qa(num: 20, q: "Which command generates 2048-bit RSA keys for SSH?", a: "crypto key generate rsa modulus 2048.")
#short-qa(num: 21, q: "What is the default hello and dead interval for OSPF on broadcast links?", a: "Hello 10 seconds, Dead 40 seconds.")
#short-qa(num: 22, q: "What Cisco command displays interface line status and IP addresses concisely?", a: "show ip interface brief.")
#short-qa(num: 23, q: "What does the command 'no ip domain-lookup' prevent?", a: "Prevents 30-second CLI hangs when mistyping invalid commands.")
#short-qa(num: 24, q: "What is the wildcard mask for subnet mask 255.255.255.252 (/30)?", a: "0.0.0.3.")
#short-qa(num: 25, q: "What is the HSRP virtual MAC address prefix for version 1?", a: "0000.0c07.acXX (where XX is group number in hex).")
#short-qa(num: 26, q: "What protocol replaces Telnet to provide encrypted remote management?", a: "SSH Version 2 (TCP Port 22).")
#short-qa(num: 27, q: "What does BPDU Guard do when receiving a BPDU on a PortFast port?", a: "Immediately shuts down the port into err-disabled state.")
#short-qa(num: 28, q: "What command configures a default static route pointing to 10.0.0.1?", a: "ip route 0.0.0.0 0.0.0.0 10.0.0.1.")
#short-qa(num: 29, q: "What is the first step in the 4-step DHCP address allocation process?", a: "DHCPDISCOVER broadcast from client.")
#short-qa(num: 30, q: "What is the default reference bandwidth in OSPF?", a: "100 Mbps (10^8 bps).")

#v(2pt)

== 10.9 Cisco CCNA 200-301 Exam Blueprint & 2027 Salary Matrix
#table(
  columns: (1.5fr, 1.2fr, 1.4fr, 2.1fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*CCNA 200-301 Exam Domain*], [*Exam Weight*], [*Study Priority*], [*Key Verification Skills*]),
  [1. Network Fundamentals], [20%], [High], [OSI/TCPIP, cabling, IPv4/IPv6 subnetting, wireless architecture.],
  [2. Network Access], [20%], [Critical], [VLANs, 802.1Q trunks, STP/RSTP root bridge, EtherChannel LACP.],
  [3. IP Connectivity], [25%], [Maximum], [Routing table LPM, static/default routes, OSPFv2 single/multi-area.],
  [4. IP Services], [10%], [Medium], [DHCP server/relay, NAT/PAT overload, NTP, SNMP, SSH v2.],
  [5. Security Fundamentals], [15%], [High], [Standard/Extended ACLs, port security violation, DAI, DHCP snooping.],
  [6. Automation & Programmability], [10%], [Emerging], [REST APIs, JSON data structures, DNA Center, Chef/Puppet/Ansible.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "2027 Enterprise Salary Blueprint (India)")[
      - *L1 Network Support Engineer:* ₹3.5L – ₹5.2L CTC      - *NOC Network Engineer (Tier 2):* ₹5.5L – ₹8.5L CTC      - *Senior Network Administrator:* ₹9.0L – ₹14.0L CTC      - *Enterprise Network Architect / TAC:* ₹15.0L – ₹24.0L+ CTC      _Top Hiring MNCs: Cisco TAC, TCS, Wipro, Infosys, Airtel, Jio, HCL, Orange Business Services._
    ]
  ],
  [
    #concept-box(title: "Final Author Sign-Off & Congratulations")[
      *Congratulations!* You have completed the comprehensive 45-Page *RTechLab CCNA 200-301 Master Guide*.      Master every CLI syntax block, lab topology, and interview explanation in this guide. Technology made practical is your ultimate competitive advantage in the global enterprise IT industry.      #v(2pt)
      *Rahul Patel* · _Founder & Chief Technology Architect, RTechLab_
    ]
  ]
)
