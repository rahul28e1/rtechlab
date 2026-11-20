#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab CCNA 200-301 Packet Tracer Lab Workbook (Edition 1)",
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
  title: "CISCO CCNA 200-301 LAB WORKBOOK",
  subtitle: "10 Production Packet Tracer Labs · Complete CLI Configs · Verification Checklists",
  edition: "2027 CAREER ACCELERATOR EDITION · EDITION 1",
  series-pill: "RTECHLAB COMMERCIAL SUITE · PRODUCTION WORKBOOK EDITION 1",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-CCNA-LAB-ED1",
  logo-path: "/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "CCNA 200-301 Practical Lab Workbook",
  edition: "2027 Career Accelerator Edition · Edition 1 Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-CCNA-LAB-ED1"
)

#pagebreak()

= WORKBOOK BLUEPRINT & LAB ARCHITECTURE

#concept-box(title: "ENTERPRISE LAB METHODOLOGY")[
  At RTechLab, our foundational tenet is _"Technology Made Practical"_. Passing the Cisco CCNA 200-301 certification exam and succeeding in enterprise technical screening interviews requires fluent terminal command-line muscle memory. This workbook provides 10 complete production-grade hands-on laboratory worksheets, featuring exact topology design schemas, full copy-paste configuration scripts, and industry verification commands used by Tier 1/2 NOC and TAC Engineers.
]

#v(4pt)

#table(
  columns: (1.1fr, 2.7fr, 1.6fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rtech-navy) } else { 0.5pt + rtech-border },
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else if calc.even(row) { rgb("#FFFFFF") } else { rgb("#F8FAFC") },
  inset: (x: 7pt, y: 5.5pt),
  [*Lab Number*], [*Core Technical Skills & Production Tooling*], [*Industry Target Role*],
  [Lab 01: Baseline Hardening & SSH v2], [Hostname, MOTD banners, enable secret, RSA 2048-bit, SSH v2, line security], [Junior Network Tech],
  [Lab 02: Switch Port Security], [Sticky MAC learning, max host count, violation Protect / Restrict / Shutdown], [L1 Support, Security Analyst],
  [Lab 03: VLANs & 802.1Q Trunking], [VLAN database, switchport trunk encapsulation, native VLAN 999 isolation], [Network Admin, NOC Tech],
  [Lab 04: Router-on-a-Stick (ROAS)], [Subinterfaces (g0/0.10, g0/0.20), encapsulation dot1Q, default gateway routing], [Enterprise Network Engineer],
  [Lab 05: Spanning Tree & BPDU Guard], [Root Bridge priority 4096 tuning, Rapid PVST+ 802.1w, PortFast & BPDU Guard], [Tier 2 NOC Engineer],
  [Lab 06: Static & Floating Routes], [Static routing, default 0.0.0.0/0, floating backup route with AD 10 failover], [Network Systems Engineer],
  [Lab 07: Single & Multi-Area OSPFv2], [router-id, auto-cost reference-bandwidth 10000, passive-interface, DR/BDR], [Senior Network Engineer],
  [Lab 08: DHCP Server & Relay Agent], [ip dhcp pool, excluded-address, default-router, ip helper-address relay], [Systems Administrator],
  [Lab 09: NAT & PAT Overload], [Inside local/global, Standard ACL mapping, ip nat inside source list overload], [Edge Security Engineer],
  [Lab 10: Standard & Extended ACLs], [ACL 1-99 vs 100-199, port filtering (HTTP/SSH), wildcard mask math], [Cisco TAC Engineer]
)

#pagebreak()

= LAB 01: BASELINE HARDENING & ENTERPRISE SSH V2

== Objective
Configure a baseline security profile on an enterprise Cisco router: set hostname, MOTD legal banner, enable secret hashing, disable DNS lookups, configure console timeouts with logging synchronous, and deploy SSH Version 2 with a 2048-bit RSA keypair.

== 1. Lab Topology & Addressing
- *Device:* Cisco 2911 or 4000 Series Router (`R1`)
- *Management Host:* Admin Laptop connected via RJ45 Console and Ethernet LAN (`192.168.1.10/24`)
- *R1 Interface Gi0/0/0:* `192.168.1.1/24`

== 2. Configuration Script (Copy-Paste Ready)
```bash
Router> enable
Router# configure terminal
Router(config)# hostname R1-EDGE-CORE
R1-EDGE-CORE(config)# no ip domain-lookup
R1-EDGE-CORE(config)# banner motd # AUTHORIZED PERSONNEL ONLY. ALL SESSIONS MONITORED. #
R1-EDGE-CORE(config)# enable secret CiscoSecret2027!
R1-EDGE-CORE(config)# service password-encryption

! --- Console Hardening ---
R1-EDGE-CORE(config)# line console 0
R1-EDGE-CORE(config-line)# password ConsolePass2027!
R1-EDGE-CORE(config-line)# login
R1-EDGE-CORE(config-line)# exec-timeout 5 0
R1-EDGE-CORE(config-line)# logging synchronous
R1-EDGE-CORE(config-line)# exit

! --- SSH v2 Deployment ---
R1-EDGE-CORE(config)# ip domain-name rtechlab.internal
R1-EDGE-CORE(config)# crypto key generate rsa modulus 2048
R1-EDGE-CORE(config)# ip ssh version 2
R1-EDGE-CORE(config)# username netadmin privilege 15 secret AdminSecure2027!

R1-EDGE-CORE(config)# line vty 0 4
R1-EDGE-CORE(config-line)# transport input ssh
R1-EDGE-CORE(config-line)# login local
R1-EDGE-CORE(config-line)# exec-timeout 10 0
R1-EDGE-CORE(config-line)# logging synchronous
R1-EDGE-CORE(config-line)# exit

! --- Interface Configuration ---
R1-EDGE-CORE(config)# interface GigabitEthernet0/0/0
R1-EDGE-CORE(config-if)# description MANAGEMENT_LAN
R1-EDGE-CORE(config-if)# ip address 192.168.1.1 255.255.255.0
R1-EDGE-CORE(config-if)# no shutdown
R1-EDGE-CORE(config-if)# end
R1-EDGE-CORE# copy running-config startup-config
```

== 3. Verification & Troubleshooting
- `show ip ssh` — Verifies SSH enabled - version 2.0 and authentication timeout.
- `show ip interface brief` — Confirms Gi0/0/0 status is `up/up`.
- `ssh -l netadmin 192.168.1.1` — Connects from client terminal; verify password prompt.

#pagebreak()

= LAB 02: SWITCH PORT SECURITY & MAC VIOLATION TRIAGE

== Objective
Deploy Layer 2 switchport port security on a Cisco Catalyst 2960 switch: limit MAC addresses to 2 per port, learn addresses dynamically via `sticky`, and configure `shutdown` and `restrict` violation modes.

== 1. Lab Topology & Addressing
- *Device:* Cisco Catalyst 2960 Switch (`SW1`)
- *Authorized PC 1:* MAC `0011.2233.4455`, connected to FastEthernet0/1
- *Unauthorized Attacker Laptop:* MAC `DEAD.BEEF.CAFE`

== 2. Configuration Script
```bash
Switch> enable
Switch# configure terminal
Switch(config)# hostname SW1-ACCESS
SW1-ACCESS(config)# interface FastEthernet0/1
SW1-ACCESS(config-if)# description SECURE_USER_ACCESS
SW1-ACCESS(config-if)# switchport mode access
SW1-ACCESS(config-if)# switchport access vlan 10
SW1-ACCESS(config-if)# switchport port-security
SW1-ACCESS(config-if)# switchport port-security maximum 2
SW1-ACCESS(config-if)# switchport port-security mac-address sticky
SW1-ACCESS(config-if)# switchport port-security violation shutdown
SW1-ACCESS(config-if)# end
SW1-ACCESS# copy running-config startup-config
```

== 3. Triage & Err-Disabled Recovery
1. When unauthorized laptop connects, port enters `err-disabled` and LED turns amber.
2. Verify violation: `show port-security interface FastEthernet0/1`
3. Disconnect rogue device and restore port:
```bash
SW1-ACCESS(config)# interface FastEthernet0/1
SW1-ACCESS(config-if)# shutdown
SW1-ACCESS(config-if)# no shutdown
```

#pagebreak()

= LAB 03: VLANS, 802.1Q TRUNKING & NATIVE VLAN ISOLATION

== Objective
Create segmented VLANs for Sales (VLAN 10), Engineering (VLAN 20), and Management (VLAN 99), establish an 802.1Q trunk link between two Catalyst switches, and secure the Native VLAN using an unused ID (VLAN 999).

== 1. Lab Topology
- `SW1` (Core) connected to `SW2` (Access) via GigabitEthernet0/1
- VLAN 10 (Sales: `192.168.10.0/24`) $|$ VLAN 20 (Engineering: `192.168.20.0/24`) $|$ Native VLAN 999

== 2. Configuration Script (Apply on SW1 and SW2)
```bash
Switch(config)# vlan 10
Switch(config-vlan)# name SALES_DEPT
Switch(config)# vlan 20
Switch(config-vlan)# name ENG_DEPT
Switch(config)# vlan 999
Switch(config-vlan)# name UNUSED_NATIVE_TRUNK
Switch(config-vlan)# exit

! --- Trunk Port Configuration ---
Switch(config)# interface GigabitEthernet0/1
Switch(config-if)# switchport mode trunk
Switch(config-if)# switchport trunk native vlan 999
Switch(config-if)# switchport trunk allowed vlan 10,20,999
Switch(config-if)# no shutdown
```

== 3. Verification Commands
- `show vlan brief` — Verifies VLAN names and active status.
- `show interfaces trunk` — Confirms 802.1Q encapsulation, native VLAN 999, and allowed VLAN list.

#pagebreak()

= LAB 04: INTER-VLAN ROUTING WITH ROUTER-ON-A-STICK (ROAS)

== Objective
Route traffic between isolated VLAN 10 and VLAN 20 using a single physical router interface partitioned into logical subinterfaces with 802.1Q tagging.

== 1. Configuration Script
```bash
! --- Router-on-a-Stick Configuration (R1) ---
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# no ip address
Router(config-if)# no shutdown
Router(config-if)# exit

Router(config)# interface GigabitEthernet0/0/0.10
Router(config-subif)# description SALES_VLAN10_GATEWAY
Router(config-subif)# encapsulation dot1Q 10
Router(config-subif)# ip address 192.168.10.1 255.255.255.0

Router(config)# interface GigabitEthernet0/0/0.20
Router(config-subif)# description ENG_VLAN20_GATEWAY
Router(config-subif)# encapsulation dot1Q 20
Router(config-subif)# ip address 192.168.20.1 255.255.255.0
Router(config-subif)# end
```

== 2. Verification
- From PC in VLAN 10 (`192.168.10.50`), ping default gateway `192.168.10.1`.
- Ping across subnets to PC in VLAN 20 (`192.168.20.50`). First ping may drop during ARP resolution; subsequent pings achieve 100% success!

#pagebreak()

= LAB 05: SPANNING TREE TUNING, PORTFAST & BPDU GUARD

== Objective
Tune Per-VLAN Spanning Tree priority so `SW1` becomes the Root Bridge for VLAN 10 (priority 4096), configure Rapid PVST+ (802.1w), and secure access ports with PortFast and BPDU Guard.

== 1. Configuration Script
```bash
! --- Root Bridge Tuning on SW1 ---
SW1(config)# spanning-tree mode rapid-pvst
SW1(config)# spanning-tree vlan 10 priority 4096
SW1(config)# spanning-tree vlan 20 priority 8192

! --- PortFast & BPDU Guard on Access Ports ---
SW1(config)# interface range FastEthernet0/1 - 10
SW1(config-if-range)# switchport mode access
SW1(config-if-range)# switchport access vlan 10
SW1(config-if-range)# spanning-tree portfast
SW1(config-if-range)# spanning-tree bpduguard enable
SW1(config-if-range)# end
```

== 2. Verification
- `show spanning-tree vlan 10` — Displays: `"This bridge is the root"`, Bridge ID priority 4106 (4096 + VLAN 10).

#pagebreak()

= LAB 06: STATIC ROUTING, DEFAULT & FLOATING BACKUP

== Objective
Configure static routing between HQ and Branch office with a primary Gigabit link and a secondary Floating Static Route (AD 10) for automatic failover.

== 1. Configuration Script (HQ Router)
```bash
! --- Primary Route via High-Speed Link (AD 1 Default) ---
HQ-RTR(config)# ip route 192.168.20.0 255.255.255.0 10.1.1.2

! --- Default Route to Internet ISP ---
HQ-RTR(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.1

! --- Floating Static Backup Route via Cellular WAN (AD 10) ---
HQ-RTR(config)# ip route 192.168.20.0 255.255.255.0 10.2.2.2 10
```

== 2. Failover Verification
1. `show ip route` — Primary route via `10.1.1.2` is installed; floating route is hidden.
2. Shutdown primary interface: `interface Gi0/0/1` $arrow$ `shutdown`.
3. Check `show ip route` — Floating route via `10.2.2.2 [10/0]` immediately appears in the routing table!

#pagebreak()

= LAB 07: OSPFv2 DYNAMIC ROUTING & COST TUNING

== Objective
Configure single-area and multi-area OSPFv2, manually define Router IDs, tune reference bandwidth to 10 Gbps, and configure passive interfaces.

== 1. Configuration Script
```bash
Router(config)# router ospf 1
Router(config-router)# router-id 1.1.1.1
Router(config-router)# auto-cost reference-bandwidth 10000
Router(config-router)# network 192.168.10.0 0.0.0.255 area 0
Router(config-router)# network 10.0.0.0 0.0.0.3 area 0
Router(config-router)# passive-interface GigabitEthernet0/0/0
Router(config-router)# end
```

== 2. Verification
- `show ip ospf neighbor` — Confirms neighbor state is `FULL/DR` or `FULL/BDR`.
- `show ip route ospf` — Displays learned OSPF routes with prefix `O`.

#pagebreak()

= LAB 08: ENTERPRISE DHCP SERVER & RELAY AGENT

== Objective
Configure a Cisco router as an enterprise DHCP server and deploy `ip helper-address` on a remote router to relay broadcast DHCPDISCOVER requests across Layer 3 boundaries.

== 1. Configuration Script (Central DHCP Router)
```bash
Router(config)# ip dhcp excluded-address 192.168.30.1 192.168.30.10
Router(config)# ip dhcp pool BRANCH_LAN
Router(config-dhcp)# network 192.168.30.0 255.255.255.0
Router(config-dhcp)# default-router 192.168.30.1
Router(config-dhcp)# dns-server 8.8.8.8
Router(config-dhcp)# domain-name rtechlab.internal
Router(config-dhcp)# lease 7
```

== 2. Branch Router Relay Agent Script
```bash
Branch-RTR(config)# interface GigabitEthernet0/0/0
Branch-RTR(config-if)# description CLIENT_FACING_LAN
Branch-RTR(config-if)# ip helper-address 10.1.1.1
```

#pagebreak()

= LAB 09: PAT (NAT OVERLOAD) FOR ENTERPRISE INTERNET

== Objective
Configure Port Address Translation (PAT / NAT Overload) to enable an entire private LAN (`192.168.10.0/24`) to access the public Internet using a single router WAN IP.

== 1. Configuration Script
```bash
! --- Step 1: Standard ACL Matching Private Subnet ---
Router(config)# access-list 1 permit 192.168.10.0 0.0.0.255

! --- Step 2: NAT Overload onto Public Interface ---
Router(config)# ip nat inside source list 1 interface GigabitEthernet0/0/1 overload

! --- Step 3: Designate NAT Roles ---
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ip nat inside
Router(config)# interface GigabitEthernet0/0/1
Router(config-if)# ip nat outside
Router(config-if)# end
```

== 2. Verification
- `show ip nat translations` — Verifies active translations: `tcp 203.0.113.1:10523 192.168.10.50:10523 142.250.190.46:443`.

#pagebreak()

= LAB 10: EXTENDED ACCESS CONTROL LISTS (ACLS)

== Objective
Deploy an Extended ACL to block all HTTP (port 80) and HTTPS (port 443) traffic from Guest VLAN (`192.168.50.0/24`) to Corporate Server (`10.1.1.100`), while permitting DNS and all other Internet traffic.

== 1. Configuration Script
```bash
Router(config)# access-list 105 remark BLOCK_GUEST_WEB_TO_CORP_SERVER
Router(config)# access-list 105 deny tcp 192.168.50.0 0.0.0.255 host 10.1.1.100 eq 80
Router(config)# access-list 105 deny tcp 192.168.50.0 0.0.0.255 host 10.1.1.100 eq 443
Router(config)# access-list 105 permit ip any any

! --- Apply Inbound on Guest Interface (Closest to Source) ---
Router(config)# interface GigabitEthernet0/0/0.50
Router(config-subif)# ip access-group 105 in
Router(config-subif)# end
```

== 2. Verification
- `show access-lists 105` — Confirms match counters: `deny tcp ... (14 matches)`.
