#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 09 · IP SERVICES & NETWORK SECURITY]
= Chapter 9: Enterprise IP Services & Network Security

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Enterprise IP infrastructure services and defense-in-depth security: Dynamic Host Configuration Protocol (DHCP) server pools and relay agents (`ip helper-address`), Network Address Translation (NAT) and Port Address Translation (PAT) overload, Standard and Extended Access Control Lists (ACLs), Network Time Protocol (NTP), Syslog logging levels, SNMP v3, and First Hop Redundancy Protocols (HSRP/VRRP).
]

#v(1pt)

== 9.1 Dynamic Host Configuration Protocol (DHCP) Mechanics
DHCP dynamically allocates IP addresses, subnet masks, default gateways, and DNS servers to client workstations across local networks:
- *The 4-Step DORA Handshake:*
  - *1. Discover:* Client broadcasts a `DHCPDISCOVER` frame (Source IP: `0.0.0.0`, Dest IP: `255.255.255.255`, UDP Port 67) searching for active DHCP servers.
  - *2. Offer:* DHCP server reserves an unassigned IP and unicasts/broadcasts a `DHCPOFFER` (UDP Port 68) containing leased IP and MAC binding.
  - *3. Request:* Client broadcasts a `DHCPREQUEST` formally accepting the offered IP and notifying competing servers to release their offers.
  - *4. Acknowledge:* Server commits the lease into its binding database and transmits a `DHCPACK` confirming lease duration and network parameters.

#v(1.5pt)

== 9.2 Hands-On Practical Lab: Enterprise DHCP Server & Relay Agent
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy centralized enterprise DHCP services. Branch clients in VLAN 10 obtain dynamic IP configurations from centralized HQ-DHCP-SRV (10.1.1.50) across a routed WAN link by configuring `ip helper-address` on Branch-RTR.]

#v(1pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab08-dhcp-relay-topology.svg", width: 80%)
#v(1pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*Subnet Mask*], [*Role / Notes*],
  [Branch-RTR], [Gi0/0/0], [192.168.10.1], [255.255.255.0], [Branch LAN Gateway (`ip helper-address`)],
  [Branch-RTR], [Gi0/0/1], [10.0.0.2], [255.255.255.252], [WAN Uplink to HQ Core],
  [HQ-Core-RTR], [Gi0/0/1], [10.0.0.1], [255.255.255.252], [WAN Uplink to Branch-RTR],
  [HQ-Core-RTR], [Gi0/0/0], [10.1.1.1], [255.255.255.0], [Datacenter Server LAN Gateway],
  [HQ-DHCP-SRV], [NIC], [10.1.1.50], [255.255.255.0], [Central Enterprise DHCP Server],
  [Client-PC1], [FastEthernet0], [DHCP Assigned], [255.255.255.0], [Branch User Workstation]
)

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Central DHCP Server Configuration (HQ-Core-RTR / Cisco IOS):]
```cisco
! --- Exclude Static Infrastructure IPs ---
HQ-Core-RTR(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.10
HQ-Core-RTR(config)# ip dhcp excluded-address 192.168.10.250 192.168.10.254
! --- Define Branch LAN Scope Pool ---
HQ-Core-RTR(config)# ip dhcp pool BRANCH_OFFICE_LAN
HQ-Core-RTR(dhcp-config)# network 192.168.10.0 255.255.255.0
HQ-Core-RTR(dhcp-config)# default-router 192.168.10.1
HQ-Core-RTR(dhcp-config)# dns-server 8.8.8.8 1.1.1.1
HQ-Core-RTR(dhcp-config)# domain-name rtechlab.internal
HQ-Core-RTR(dhcp-config)# lease 7 0 0
HQ-Core-RTR(dhcp-config)# exit
```

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Branch Router Relay Agent Configuration:]
```cisco
Branch-RTR(config)# interface GigabitEthernet0/0/0
Branch-RTR(config-if)# description BRANCH_USER_LAN
Branch-RTR(config-if)# ip address 192.168.10.1 255.255.255.0
Branch-RTR(config-if)# ip helper-address 10.1.1.50
Branch-RTR(config-if)# no shutdown
Branch-RTR(config-if)# end
```

#v(1pt)
#terminal-specimen(title: "HQ-Core-RTR# show ip dhcp binding")[
```text
Bindings from all pools :
IP address          Client-ID/              Lease expiration        Type
                    Hardware address/
                    User name
192.168.10.11       0100.5079.6668.01       Nov 27 2027 10:45 AM    Automatic
192.168.10.12       0100.5079.6668.02       Nov 27 2027 10:48 AM    Automatic
HQ-Core-RTR# show ip dhcp conflict
IP address          Detection method   Detection time
-- None --
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP: DHCP SNOOPING & OPTION 82")[
  *The Rogue DHCP Attack:* An attacker connects a rogue Wi-Fi router offering malicious default gateway and DNS settings.
  *Defense:* Deploy *DHCP Snooping* on Catalyst switches:
  `Switch(config)# ip dhcp snooping ; ip dhcp snooping vlan 10`
  `Switch(config-if)# ip dhcp snooping trust` (Configured ONLY on uplink trunk ports facing the legitimate DHCP server!). All untrusted user ports dropping DHCP Server Offers/Acks.
]

#v(1.5pt)

== 9.3 Network Address Translation (NAT) & PAT Overload Mechanics
IPv4 private address space (RFC 1918) cannot be routed across the public Internet. NAT translates private addresses to globally routable public IPs:
- *RFC 1918 Private Ranges:*
  - `10.0.0.0/8` (`10.0.0.0` - `10.255.255.255`): Large enterprise intranets.
  - `172.16.0.0/12` (`172.16.0.0` - `172.31.255.255`): Medium-to-large business networks.
  - `192.168.0.0/16` (`192.168.0.0` - `192.168.255.255`): SOHO, SMB, and branch offices.
- *Cisco Official NAT Terminology:*
  - *Inside Local:* The actual private IPv4 address assigned to a host inside the corporate LAN (e.g. `192.168.1.10`).
  - *Inside Global:* The legitimate public IPv4 address that represents the inside host to the outside world (e.g. `203.0.113.5`).
  - *Outside Local:* The destination IP address of an external host as seen by the inside network.
  - *Outside Global:* The actual public IP address assigned to an external host on the Internet (e.g. `8.8.8.8`).
- *NAT Types:*
  - *Static NAT:* One-to-one permanent mapping (used for public-facing DMZ servers).
  - *Dynamic NAT:* Many-to-many mapping from a pooled range of registered public IPs.
  - *PAT (NAT Overload):* Many-to-one mapping. Uses unique #hl[Layer 4 TCP/UDP Port Numbers] to multiplex thousands of internal hosts across a single registered public IP address!

#v(1.5pt)

== 9.4 Hands-On Practical Lab: PAT (NAT Overload) for Enterprise Internet
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy Port Address Translation (NAT Overload) on Cisco Edge-RTR. All private inside workstations in `192.168.1.0/24` translate to the single public IP (`203.0.113.1`) assigned to egress interface GigabitEthernet0/0/0.]

#v(1pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab09-pat-nat-topology.svg", width: 80%)
#v(1pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*Subnet Mask*], [*Role / Notes*],
  [Edge-RTR], [Gi0/0/1], [192.168.1.1], [255.255.255.0], [Inside NAT Interface (`ip nat inside`)],
  [Edge-RTR], [Gi0/0/0], [203.0.113.1], [255.255.255.252], [Outside NAT Interface (`ip nat outside`)],
  [Inside-PC1], [Fa0], [192.168.1.10], [255.255.255.0], [Internal Private Corporate Workstation],
  [Inside-PC2], [Fa0], [192.168.1.20], [255.255.255.0], [Internal Private Corporate Workstation],
  [Public-Server], [Fa0], [8.8.8.8], [255.255.255.255], [Internet DNS/Web Server (Outside Global)]
)

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Edge-RTR Production NAT Overload Configuration:]
```cisco
! --- Step 1: Designate NAT Roles on Interfaces ---
Edge-RTR(config)# interface GigabitEthernet0/0/1
Edge-RTR(config-if)# description INTERNAL_LAN_GATEWAY
Edge-RTR(config-if)# ip address 192.168.1.1 255.255.255.0
Edge-RTR(config-if)# ip nat inside
Edge-RTR(config-if)# no shutdown
Edge-RTR(config-if)# exit

Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# description ISP_INTERNET_UPLINK
Edge-RTR(config-if)# ip address 203.0.113.1 255.255.255.252
Edge-RTR(config-if)# ip nat outside
Edge-RTR(config-if)# no shutdown
Edge-RTR(config-if)# exit

! --- Step 2: Define ACL Permitting Internal Subnet ---
Edge-RTR(config)# access-list 1 permit 192.168.1.0 0.0.0.255

! --- Step 3: Activate NAT Overload (PAT) ---
Edge-RTR(config)# ip nat inside source list 1 interface GigabitEthernet0/0/0 overload
Edge-RTR(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.2
```

#v(1pt)
#terminal-specimen(title: "Edge-RTR# show ip nat translations")[
```text
Pro Inside global      Inside local       Outside local      Outside global
tcp 203.0.113.1:49152  192.168.1.10:49152 8.8.8.8:443        8.8.8.8:443
tcp 203.0.113.1:49153  192.168.1.20:49152 8.8.8.8:80         8.8.8.8:80
udp 203.0.113.1:53001  192.168.1.10:53001 8.8.8.8:53         8.8.8.8:53
Edge-RTR# show ip nat statistics
Total active translations: 3 (0 static, 3 dynamic; 3 extended)
Outside interfaces: GigabitEthernet0/0/0
Inside interfaces: GigabitEthernet0/0/1
Hits: 1248  Misses: 3
```
]

#v(1.5pt)

== 9.5 Access Control Lists (ACLs): Standard vs Extended Deep Dive
Access Control Lists filter network traffic based on packet header parameters. Cisco routers evaluate ACL entries sequentially from top to bottom:
- *Evaluation Rules:*
  - *Top-to-Bottom Execution:* Router tests packet against entry 10, then 20, then 30.
  - *First Match Termination:* The instant a match occurs, the permit or deny action is executed; #hl[no further ACL lines are evaluated]!
  - *The Implicit Deny All:* Every ACL ends with an invisible, unwritten rule: #hl[`deny ip any any`]. Any packet not explicitly permitted is silently discarded!
- *Standard ACLs vs Extended ACLs:*

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Feature*], [*Standard ACLs*], [*Extended ACLs*], [*Architectural Rule*]),
  [Number Range], [`1 - 99` and `1300 - 1999`], [`100 - 199` and `2000 - 2699`], [Standard evaluates Source IP only.],
  [Criteria Checked], [Source IPv4 Address ONLY], [Source IP, Dest IP, Protocol, Port], [Extended enables Layer 4 granular filtering.],
  [Best-Practice Placement], [#hl[As close to DESTINATION as possible]], [#hl[As close to SOURCE as possible]], [Avoid blocking unwanted traffic from other paths.],
  [Common Application], [Restricting VTY (Telnet/SSH) access], [Firewalling, DMZ security, WAN edge filtering], [Extended saves transit WAN bandwidth.]
)

#v(1.5pt)

== 9.6 Hands-On Practical Lab: Extended ACLs for Perimeter Security
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy extended ACL `101` on Cisco Edge-RTR to protect Corporate Server `10.1.1.100`. Guest LAN (`192.168.20.0/24`) is permitted HTTP (`80`) and HTTPS (`443`) access to the server, but all ICMP echo requests (pings) and SSH management attempts are denied and logged.]

#v(1pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab10-extended-acl-topology.svg", width: 80%)
#v(1pt)

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Edge-RTR Extended ACL Configuration:]
```cisco
Edge-RTR(config)# access-list 101 remark === PERMIT WEB TRAFFIC FROM GUEST TO CORP WEB ===
Edge-RTR(config)# access-list 101 permit tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 80
Edge-RTR(config)# access-list 101 permit tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 443
Edge-RTR(config)# access-list 101 remark === DENY ALL PING AND MANAGEMENT ATTEMPTS ===
Edge-RTR(config)# access-list 101 deny icmp 192.168.20.0 0.0.0.255 host 10.1.1.100 log
Edge-RTR(config)# access-list 101 deny tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 22 log
Edge-RTR(config)# access-list 101 remark === PERMIT INTERNET ACCESS FOR GUEST LAN ===
Edge-RTR(config)# access-list 101 permit ip 192.168.20.0 0.0.0.255 any
! --- Apply Inbound on Ingress Guest Interface ---
Edge-RTR(config)# interface GigabitEthernet0/0/2
Edge-RTR(config-if)# description GUEST_LAN_INTERFACE
Edge-RTR(config-if)# ip access-group 101 in
Edge-RTR(config-if)# end
```

#v(1pt)
#terminal-specimen(title: "Edge-RTR# show access-lists 101")[
```text
Extended IP access list 101
    10 permit tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq www (1482 matches)
    20 permit tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 443 (8920 matches)
    30 deny icmp 192.168.20.0 0.0.0.255 host 10.1.1.100 log (48 matches)
    40 deny tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 22 log (5 matches)
    50 permit ip 192.168.20.0 0.0.0.255 any (18420 matches)
```
]

#v(1.5pt)

== 9.7 Network Time Protocol (NTP), Syslog & SNMP Monitoring Architecture
Enterprise operations depend on precise time synchronization and centralized monitoring:
- *Network Time Protocol (NTP - UDP Port 123):*
  - *Stratum Hierarchy:* Stratum 0 (High-precision atomic/GPS clocks) $arrow$ Stratum 1 (Directly attached NTP servers) $arrow$ Stratum 2 (Enterprise servers synced to Stratum 1). Max Stratum is 15; 16 indicates unsynchronized/unreachable!
  - *Cisco CLI:* `Router(config)# ntp server 216.239.35.0` ; `Router# show ntp status`
- *Syslog Logging Severity Levels (0 - 7):*
  - Memory Mnemonic: *"Every Alley Cat Eats Mice Daily In Spring"*
  - `0`: Emergency (System unusable) · `1`: Alert (Immediate action needed) · `2`: Critical
  - `3`: Error · `4`: Warning · `5`: Notification · `6`: Informational · `7`: Debugging (CPU intensive!)
  - *Cisco CLI:* `Router(config)# logging host 10.1.1.200` ; `Router(config)# logging trap warnings`
- *Simple Network Management Protocol (SNMP - UDP Port 161/162):*
  - *SNMP v1 / v2c:* Transmit community strings (passwords) in cleartext; vulnerable to packet sniffing.
  - *SNMP v3:* Provides true enterprise security with *AuthPriv* (HMAC-SHA authentication + AES encryption).

#v(1.5pt)

== 9.8 First Hop Redundancy Protocols (FHRP): HSRP, VRRP & GLBP
FHRP provides default gateway redundancy for end-user workstations by sharing a Virtual IP and Virtual MAC:
- *HSRP (Hot Standby Router Protocol - RFC 2281 / Cisco Proprietary):*
  - One *Active Router* forwards traffic; one *Standby Router* listens.
  - Virtual MAC: `0000.0c07.acXX` (where `XX` is HSRP Group ID in hex).
  - Priority determines Active router (Default `100`; highest priority wins). #hl[Preempt is required] to retake role upon recovery!
  - `Router(config-if)# standby 1 ip 192.168.1.254` ; `Router(config-if)# standby 1 priority 110` ; `Router(config-if)# standby 1 preempt`
- *VRRP (Virtual Router Redundancy Protocol - IEEE Standard):*
  - One *Master Router*; multiple *Backup Routers*. Virtual MAC: `0000.5e00.01XX`.
- *GLBP (Gateway Load Balancing Protocol - Cisco Proprietary):*
  - Performs active load-balancing across up to 4 Active Virtual Forwarders (AVFs).

#v(1.5pt)


== 9.9 Production Cisco IP Services & Security Triage CLI Cheatsheet
#table(
  columns: (1.3fr, 1.4fr, 2.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Verification Command*], [*Operational Output*], [*Triage Focus & Resolution Target*]),
  [`show ip dhcp binding`], [Active DHCP IP-to-MAC leases], [Verifies dynamic IP allocation to client endpoints.],
  [`show ip dhcp conflict`], [Conflicting duplicate IP addresses], [Identifies rogue static hosts occupying DHCP pool addresses.],
  [`show ip nat translations`], [Active translation session table], [Inspects inside local to inside global port mappings under PAT.],
  [`show ip nat statistics`], [Hits, misses, pool usage, active sessions], [Monitors NAT translation pool exhaustion and translation drops.],
  [`show access-lists [num]`], [Configured ACL lines with packet hit counts], [Verifies which ACL rule is actively matching or dropping traffic.],
  [`clear ip nat translation *`], [Flushes dynamic translation table], [Resets hung PAT sessions after updating ACL or NAT statements.],
  [`show standby brief`], [HSRP Group, Priority, State (Active/Standby)], [Verifies default gateway redundancy and VIP/VMAC failover.],
  [`show ntp status`], [NTP synchronization state and Stratum level], [Confirms clock lock with reference NTP atomic time server.]
)


== 9.10 Enterprise TAC IP Services Triage Workflows
When triaging enterprise service tickets, Tier 2/3 NOC and TAC engineers execute the following deterministic workflows:
- *1. DHCP Exhaustion & IP Conflict Triage:*
  - Verify scope usage: show ip dhcp pool (checks total addresses vs leased).
  - Inspect address collisions: show ip dhcp conflict. When a host responds to a pre-allocation ping, IOS marks the IP as in-conflict and removes it from the pool.
  - Clear resolved conflict: clear ip dhcp conflict \*.
- *2. PAT Port Exhaustion & Table Starvation:*
  - In high-density environments (e.g., thousands of users opening hundreds of background web sessions), the 64,000 ephemeral port range on a single public IP can exhaust.
  - *Symptom:* New outbound web connections time out, while existing sessions remain active.
  - *Resolution:* Deploy a *NAT Pool* with multiple public IPs rather than overloading a single interface:
    Edge-RTR(config)\# ip nat pool PUBLIC_POOL 203.0.113.10 203.0.113.14 netmask 255.255.255.248
    Edge-RTR(config)\# ip nat inside source list 1 pool PUBLIC_POOL overload
- *3. Extended ACL Performance & Logging Impact:*
  - The log keyword on ACL lines forces the CPU to generate a Syslog message for every matching packet. #hl[NEVER append 'log' to high-volume permit statements] (e.g. permit ip any any log); doing so floods the control plane CPU and causes router crashes during volumetric attacks!

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why do we place Extended ACLs close to the source but Standard ACLs close to the destination?", a: "Extended ACLs filter by destination IP and port; placing them near the source stops unauthorized packets immediately before they consume valuable WAN bandwidth. Standard ACLs filter only by source IP; placing them near the source would block traffic to all destinations indiscriminately!")
#faq-item(q: "What is the difference between Dynamic NAT and PAT (NAT Overload)?", a: "Dynamic NAT maps multiple inside hosts to a pool of registered public IPs on a 1-to-1 basis until the pool runs out. PAT (NAT Overload) multiplexes thousands of inside hosts onto a single public IP address using unique Layer 4 TCP/UDP port numbers.")
#faq-item(q: "Why is the preempt command required in HSRP?", a: "By default, HSRP is non-preemptive. If the higher-priority primary router boots up after a failure, it will NOT take back the Active role from the standby router unless 'standby <group> preempt' is configured.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which UDP port numbers do DHCP clients and DHCP servers listen on?", ans: "DHCP Server listens on UDP Port 67; DHCP Client listens on UDP Port 68.")
#short-q(num: 2, q: "What is the unwritten default rule present at the very end of every Cisco Access Control List?", ans: "Implicit Deny All (deny ip any any).")
#short-q(num: 3, q: "Identify the Syslog severity level number assigned to Error messages.", ans: "Level 3 (Error).")
#short-q(num: 4, q: "What is the maximum stratum value permitted in Network Time Protocol (NTP)?", ans: "Stratum 15 (Stratum 16 indicates the device is unsynchronized).")
#short-q(num: 5, q: "Which command forwards client DHCP broadcast packets across a router to a remote DHCP server?", ans: "ip helper-address <server-ip> (configured on the client-facing interface).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "In the 4-step DHCP handshake (DORA), which messages are transmitted as Layer 2 broadcasts by the client?", a: "Discover and Request", b: "Offer and Acknowledge", c: "Discover and Offer", d: "Request and Acknowledge", ans: "A", expl: "The client lacks an IP configuration during Discover and formally announces acceptance in Request, both sent as broadcasts.")
#mcq(num: 2, q: "What Layer 4 information does Port Address Translation (PAT) use to track concurrent connections from different inside hosts?", a: "TCP Sequence Numbers", b: "Unique Source TCP/UDP Port Numbers", c: "IP Identification Field", d: "Window Size values", ans: "B", expl: "PAT translates inside private IP addresses and assigns unique ephemeral Layer 4 port numbers on the public IP.")
#mcq(num: 3, q: "Which of the following is a private IPv4 address range defined in RFC 1918?", a: "172.32.0.0 - 172.64.255.255", b: "192.168.0.0 - 192.168.255.255", c: "169.254.0.0 - 169.254.255.255", d: "224.0.0.0 - 239.255.255.255", ans: "B", expl: "RFC 1918 reserves 10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16 for private addressing. 169.254.0.0/16 is APIPA, 224.0.0.0/4 is Multicast.")
#mcq(num: 4, q: "What SNMP version provides both HMAC-SHA authentication and AES encryption (AuthPriv)?", a: "SNMP v1", b: "SNMP v2c", c: "SNMP v3", d: "SNMP v4", ans: "C", expl: "SNMP v3 introduces user-based security model (USM) supporting cryptographic authentication and encryption.")
#mcq(num: 5, q: "In HSRP version 1, what virtual MAC address format is utilized by the active virtual router?", a: "0000.5e00.01XX", b: "0000.0c07.acXX", c: "0007.b400.01XX", d: "0100.5e00.0001", ans: "B", expl: "HSRP v1 uses 0000.0c07.acXX where XX is the hex group number. 0000.5e00.01XX is VRRP, and 0007.b400.01XX is GLBP.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Ephemeral Port Range")[
      Modern operating systems allocate source ports between #hl[49152 and 65535] for outbound client connections, allowing PAT to track up to ~64,000 concurrent sessions per IP!
    ]
  ],
  [
    #tech-spotlight-box(title: "Zero Trust & Microsegmentation")[
      Modern enterprise architectures replace broad perimeter ACLs with identity-aware Zero Trust network access (ZTNA) and software-defined microsegmentation policies!
    ]
  ]
)
