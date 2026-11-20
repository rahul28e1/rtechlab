# -*- coding: utf-8 -*-
import os
import subprocess
import shutil

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
CCNA_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301")
LAB_DIR = os.path.join(CCNA_DIR, "02_PRACTICAL_LAB_WORKBOOK")
SOURCE_FILE = os.path.join(LAB_DIR, "source", "practical-lab-workbook.typ")
PDF_OUT = os.path.join(LAB_DIR, "CCNA-200-301-Packet-Tracer-Lab-Workbook-Edition-1.pdf")
PUBLIC_PDF = os.path.join(BASE_DIR, "public", "downloads", "CCNA-200-301-Packet-Tracer-Lab-Workbook-Edition-1.pdf")

doc_header = '''#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab CCNA 200-301 Practical Lab Workbook (Edition 1)",
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

// Custom terminal output box
#let terminal-specimen(title: "CISCO IOS CLI OUTPUT SPECIMEN", body) = {
  block(
    width: 100%,
    stroke: 0.5pt + rgb("#334155"),
    fill: rgb("#0F172A"),
    radius: 4pt,
    inset: (x: 8pt, y: 5.5pt),
    spacing: 3pt,
    [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [#text(size: 7.2pt, weight: "bold", fill: rgb("#38BDF8"), font: "monospace")[> #title]],
        [#text(size: 6.2pt, fill: rgb("#94A3B8"), font: "monospace")[VT100 · 9600-8-N-1 · Cisco IOS-XE]]
      )
      #v(1.5pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#1E293B"))
      #v(2.5pt)
      #body
    ]
  )
}

#pagebreak()

= WORKBOOK BLUEPRINT & LAB ARCHITECTURE

#concept-box(title: "ENTERPRISE LAB METHODOLOGY")[
  At RTechLab, our foundational tenet is "Technology Made Practical". Passing the Cisco CCNA 200-301 certification exam and succeeding in enterprise technical screening interviews requires fluent terminal command-line muscle memory. This workbook provides 10 complete production-grade hands-on laboratory worksheets, featuring exact topology design schemas, full copy-paste configuration scripts, and industry verification commands used by Tier 1/2 NOC and TAC Engineers.
]

#v(4pt)

#table(
  columns: (1.1fr, 2.7fr, 1.2fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rtech-navy) } else { 0.5pt + rtech-border },
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else if calc.even(row) { rgb("#FFFFFF") } else { rgb("#F8FAFC") },
  inset: (x: 7pt, y: 5.2pt),
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
'''

# We build each lab as a clean modular string
labs = []

# LAB 1
labs.append('''= LAB 01: BASELINE HARDENING & ENTERPRISE SSH V2

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy enterprise baseline security on Cisco 2911 router: configure MOTD banner, enable secret SHA-256 hash, disable DNS lookups, enforce console line timeouts with logging synchronous, and deploy SSH Version 2 with a 2048-bit RSA keypair.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab01-ssh-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & Interface Addressing Schema
#table(
  columns: (1fr, 1.1fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*Subnet Mask*], [*Role / Notes*],
  [R1-EDGE-CORE], [Gi0/0/0], [192.168.1.1], [255.255.255.0], [Management Gateway, SSH Server],
  [Admin-Laptop], [FastEthernet0], [192.168.1.10], [255.255.255.0], [Admin PC, PuTTY / SSH Client],
  [Admin-Laptop], [RS232 (COM)], [N/A (Console)], [N/A], [Light-Blue Rollover to R1 RJ45 Console]
)

== 2. Production Configuration Script (Copy-Paste Ready)
```cisco
Router> enable
Router# configure terminal
R1-EDGE-CORE(config)# hostname R1-EDGE-CORE
R1-EDGE-CORE(config)# no ip domain-lookup
R1-EDGE-CORE(config)# banner motd # AUTHORIZED SESSIONS MONITORED. #
R1-EDGE-CORE(config)# enable secret CiscoSecret2027!
R1-EDGE-CORE(config)# service password-encryption
R1-EDGE-CORE(config)# line console 0
R1-EDGE-CORE(config-line)# password ConsolePass2027! ; login
R1-EDGE-CORE(config-line)# exec-timeout 5 0 ; logging synchronous ; exit
R1-EDGE-CORE(config)# ip domain-name rtechlab.internal
R1-EDGE-CORE(config)# crypto key generate rsa modulus 2048
R1-EDGE-CORE(config)# ip ssh version 2
R1-EDGE-CORE(config)# username netadmin privilege 15 secret AdminSecure2027!
R1-EDGE-CORE(config)# line vty 0 4
R1-EDGE-CORE(config-line)# transport input ssh ; login local
R1-EDGE-CORE(config-line)# exec-timeout 10 0 ; logging synchronous ; exit
R1-EDGE-CORE(config)# interface GigabitEthernet0/0/0
R1-EDGE-CORE(config-if)# description MGMT_LAN_INTERFACE
R1-EDGE-CORE(config-if)# ip address 192.168.1.1 255.255.255.0 ; no shutdown
R1-EDGE-CORE(config-if)# end
R1-EDGE-CORE# copy running-config startup-config
```

== 3. Terminal Verification & Output Specimen
#terminal-specimen(title: "R1-EDGE-CORE# show ip ssh")[
```text
SSH Enabled - version 2.0
Authentication timeout: 120 secs; Authentication retries: 3
Minimum expected Diffie-Hellman key size : 2048 bits
IOS Keys in SECSH format(ssh-rsa, base64 encoded): rtechlab.internal:2048
R1-EDGE-CORE# show ip interface brief | include up
GigabitEthernet0/0/0       192.168.1.1     YES manual up                    up
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *Never skip 'ip domain-name':* The crypto engine requires a valid domain name concatenated with the hostname to form the Fully Qualified Domain Name (FQDN) for the RSA certificate keypair. Without a domain name, `crypto key generate rsa` will fail with error: `% Please define a domain-name first`.
]
''')

# LAB 2
labs.append('''= LAB 02: SWITCH PORT SECURITY & MAC VIOLATION TRIAGE

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy Layer 2 switchport security on Cisco Catalyst 2960 switch: limit maximum MAC addresses to 2 per port, learn addresses dynamically via sticky, configure shutdown violation mode, and triage err-disabled ports.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab02-port-security-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & Interface Addressing Schema
#table(
  columns: (1fr, 1.1fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*MAC Address*], [*VLAN*], [*Port Security Status*],
  [SW1-ACCESS], [Fa0/1], [0011.2233.4455 (Sticky)], [VLAN 10], [Max 2 MACs, Violation: Shutdown],
  [PC-1 (Auth)], [FastEthernet0], [0011.2233.4455], [VLAN 10], [Authorized Corporate Workstation],
  [Rogue-Laptop], [FastEthernet0], [DEAD.BEEF.CAFE], [VLAN 10], [Unrecognized Attacker Device (Triggers Trip)]
)

== 2. Production Configuration Script
```cisco
Switch> enable
Switch# configure terminal
Switch(config)# hostname SW1-ACCESS
SW1-ACCESS(config)# interface FastEthernet0/1
SW1-ACCESS(config-if)# description SECURE_CORPORATE_PORT
SW1-ACCESS(config-if)# switchport mode access
SW1-ACCESS(config-if)# switchport access vlan 10
SW1-ACCESS(config-if)# switchport port-security
SW1-ACCESS(config-if)# switchport port-security maximum 2
SW1-ACCESS(config-if)# switchport port-security mac-address sticky
SW1-ACCESS(config-if)# switchport port-security violation shutdown
SW1-ACCESS(config-if)# end
SW1-ACCESS# copy running-config startup-config
```

== 3. Terminal Verification & Err-Disabled Triage
#terminal-specimen(title: "SW1-ACCESS# show port-security interface FastEthernet0/1")[
```text
Port Security              : Enabled
Port Status                : Secure-shutdown
Violation Mode             : Shutdown
Aging Time                 : 0 mins
Max MAC Addresses          : 2
Total MAC Addresses        : 2
Configured MAC Addresses   : 0
Sticky MAC Addresses       : 1 (0011.2233.4455)
Last Source Address:Vlan   : dead.beef.cafe:10
Security Violation Count   : 1
%PM-4-ERR_DISABLE: psecure-violation error detected on Fa0/1, putting Fa0/1 in err-disable state
```
]

== 4. Triage & Interface Recovery Procedure
#terminal-specimen(title: "Recovery Commands After Rogue Disconnection")[
```text
SW1-ACCESS(config)# interface FastEthernet0/1
SW1-ACCESS(config-if)# shutdown
SW1-ACCESS(config-if)# no shutdown
%LINK-3-UPDOWN: Interface FastEthernet0/1, changed state to up
%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/1, changed state to up
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *Why Shutdown vs Restrict:* In banking, financial, and healthcare networks, `shutdown` is strictly mandated by PCI-DSS. With `restrict`, an attacker can still attempt brute-force layer 2 probing while generating syslog floods. `shutdown` cuts physical laser/copper signaling immediately, turning the switch LED amber.
]
''')

# LAB 3
labs.append('''= LAB 03: VLANS, 802.1Q TRUNKING & NATIVE VLAN ISOLATION

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy segmented VLAN architecture on Cisco Catalyst switches: create Sales (VLAN 10) and Engineering (VLAN 20), establish an IEEE 802.1Q trunk link with explicit VLAN pruning, and secure the Native VLAN using an unused ID (VLAN 999).]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab03-vlan-trunking-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & Interface Addressing Schema
#table(
  columns: (1.1fr, 1.1fr, 1.4fr, 1.2fr, 2.2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*VLAN ID*], [*Operational Mode*],
  [SW1-CORE], [Gi0/1], [Trunk], [10, 20, 999], [802.1Q Trunk, Native VLAN 999],
  [SW1-CORE], [Fa0/10], [N/A (Access)], [VLAN 10], [Access Mode (Sales Department)],
  [SW1-CORE], [Fa0/20], [N/A (Access)], [VLAN 20], [Access Mode (Engineering Department)],
  [SW2-ACCESS], [Gi0/1], [Trunk], [10, 20, 999], [802.1Q Trunk, Native VLAN 999],
  [PC-Sales-1], [NIC], [192.168.10.10/24], [VLAN 10], [Sales Host 1 (Gateway 192.168.10.1)]
)

== 2. Production Configuration Script (SW1 and SW2)
```cisco
Switch# configure terminal
Switch(config)# vlan 10
Switch(config-vlan)# name SALES_DEPT
Switch(config)# vlan 20
Switch(config-vlan)# name ENG_DEPT
Switch(config)# vlan 999
Switch(config-vlan)# name UNUSED_NATIVE_TRUNK
Switch(config-vlan)# exit
! --- Access Port Assignments ---
Switch(config)# interface range FastEthernet0/1 - 10
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 10
Switch(config)# interface range FastEthernet0/11 - 20
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 20
! --- Trunk Port Hardening ---
Switch(config)# interface GigabitEthernet0/1
Switch(config-if)# switchport mode trunk
Switch(config-if)# switchport trunk native vlan 999
Switch(config-if)# switchport trunk allowed vlan 10,20,999
Switch(config-if)# switchport nonegotiate
Switch(config-if)# end
```

== 3. Terminal Verification & Output Specimen
#terminal-specimen(title: "SW1-CORE# show interfaces trunk")[
```text
Port        Mode             Encapsulation  Status        Native vlan
Gi0/1       on               802.1q         trunking      999

Port        Vlans allowed on trunk
Gi0/1       10,20,999

Port        Vlans allowed and active in management domain
Gi0/1       10,20,999

Port        Vlans in spanning tree forwarding state and not pruned
Gi0/1       10,20,999
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *VLAN Hopping Mitigation:* Double-tagging attacks exploit switch trunk ports where the Native VLAN matches user access VLANs. By configuring an unused dummy VLAN (e.g. 999) as the Native VLAN and setting `switchport nonegotiate` (disabling DTP), you completely neutralize double-encapsulated 802.1Q packet traversal.
]
''')

# LAB 4
labs.append('''= LAB 04: INTER-VLAN ROUTING WITH ROUTER-ON-A-STICK (ROAS)

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Establish Inter-VLAN routing between isolated subnets (Sales VLAN 10 and Engineering VLAN 20) using a single physical router interface partitioned into 802.1Q subinterfaces with IP default gateways.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab04-roas-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & Interface Addressing Schema
#table(
  columns: (1fr, 1.2fr, 1.6fr, 1.4fr, 1.8fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*Subnet Mask*], [*Encapsulation / Role*],
  [R1-ROAS], [Gi0/0/0], [No IP Assigned], [N/A], [Physical Trunk Link to Switch],
  [R1-ROAS], [Gi0/0/0.10], [192.168.10.1], [255.255.255.0], [dot1Q VLAN 10 Gateway],
  [R1-ROAS], [Gi0/0/0.20], [192.168.20.1], [255.255.255.0], [dot1Q VLAN 20 Gateway],
  [PC-Sales], [NIC], [192.168.10.50], [255.255.255.0], [VLAN 10 Host (GW 192.168.10.1)],
  [PC-Eng], [NIC], [192.168.20.50], [255.255.255.0], [VLAN 20 Host (GW 192.168.20.1)]
)

== 2. Production Configuration Script
```cisco
! --- Router R1-ROAS Configuration ---
R1# configure terminal
R1(config)# interface GigabitEthernet0/0/0
R1(config-if)# no ip address
R1(config-if)# no shutdown
R1(config-if)# exit
! --- Sales Gateway Subinterface ---
R1(config)# interface GigabitEthernet0/0/0.10
R1(config-subif)# description SALES_VLAN10_GATEWAY
R1(config-subif)# encapsulation dot1Q 10
R1(config-subif)# ip address 192.168.10.1 255.255.255.0
! --- Engineering Gateway Subinterface ---
R1(config)# interface GigabitEthernet0/0/0.20
R1(config-subif)# description ENG_VLAN20_GATEWAY
R1(config-subif)# encapsulation dot1Q 20
R1(config-subif)# ip address 192.168.20.1 255.255.255.0
R1(config-subif)# end
! --- Switch Uplink Trunk ---
SW1(config)# interface GigabitEthernet0/1
SW1(config-if)# switchport mode trunk
SW1(config-if)# switchport trunk allowed vlan 10,20
```

== 3. Terminal Verification & Output Specimen
#terminal-specimen(title: "R1-ROAS# show ip route connected")[
```text
C    192.168.10.0/24 is directly connected, GigabitEthernet0/0/0.10
L    192.168.10.1/32 is directly connected, GigabitEthernet0/0/0.10
C    192.168.20.0/24 is directly connected, GigabitEthernet0/0/0.20
L    192.168.20.1/32 is directly connected, GigabitEthernet0/0/0.20

Cisco Packet Tracer Host Ping Test:
PC-Sales> ping 192.168.20.50
Reply from 192.168.20.50: bytes=32 time=2ms TTL=127 (Ping Success: 100%)
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *Order of Operations Warning:* In Cisco IOS, you MUST configure `encapsulation dot1Q [vlan]` before typing the `ip address` command on a subinterface. If you attempt to enter an IP address first, the CLI will reject it with: `% Configuring IP routing on a LAN subinterface is only allowed if that subinterface is already configured as part of an 802.10, 802.1Q, or ISL vLAN`.
]
''')

# LAB 5
labs.append('''= LAB 05: SPANNING TREE TUNING, PORTFAST & BPDU GUARD

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Tune Rapid PVST+ (802.1w) across redundant Catalyst switches: force SW1 as Root Bridge for VLAN 10 (priority 4096), SW2 as Root for VLAN 20 (priority 4096), and harden access ports with PortFast and BPDU Guard.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab05-stp-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & STP Priority Schema
#table(
  columns: (1fr, 1.2fr, 1.3fr, 1.5fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Switch*], [*STP Mode*], [*VLAN 10 Priority*], [*VLAN 20 Priority*], [*Role / Operational State*],
  [SW1-CORE], [Rapid-PVST], [4096 (Root)], [8192 (Backup)], [VLAN 10 Primary Root Bridge],
  [SW2-DISTR], [Rapid-PVST], [8192 (Backup)], [4096 (Root)], [VLAN 20 Primary Root Bridge],
  [SW3-ACCESS], [Rapid-PVST], [32768 (Default)], [32768 (Default)], [Access Switch (Root Port Gi0/1, Blk Gi0/2)],
  [Access Ports], [Edge Ports], [PortFast Enabled], [BPDU Guard ON], [Immediate FWD, Error-Disables on BPDU]
)

== 2. Production Configuration Script
```cisco
! --- SW1: Root Primary for VLAN 10 ---
SW1(config)# spanning-tree mode rapid-pvst
SW1(config)# spanning-tree vlan 10 priority 4096
SW1(config)# spanning-tree vlan 20 priority 8192
! --- SW2: Root Primary for VLAN 20 ---
SW2(config)# spanning-tree mode rapid-pvst
SW2(config)# spanning-tree vlan 10 priority 8192
SW2(config)# spanning-tree vlan 20 priority 4096
! --- Access Ports Hardening (SW3) ---
SW3(config)# interface range FastEthernet0/1 - 24
SW3(config-if-range)# switchport mode access
SW3(config-if-range)# spanning-tree portfast
SW3(config-if-range)# spanning-tree bpduguard enable
```

== 3. Terminal Verification & Output Specimen
#terminal-specimen(title: "SW1-CORE# show spanning-tree vlan 10")[
```text
VLAN0010
  Spanning tree enabled protocol rstp
  Root ID    Priority    4106  (Priority 4096 + Sys-ID-Ext 10)
             Address     0001.42a1.8800
             This bridge is the root
             Hello Time   2 sec  Max Age 20 sec  Forward Delay 15 sec

Interface        Role Sts Cost      Prio.Nbr Type
---------------- ---- --- --------- -------- --------------------------------
Gi0/1            Desg FWD 4         128.1    P2p
Gi0/2            Desg FWD 4         128.2    P2p
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *The 4096 Rule:* Bridge priority can NEVER be set to an arbitrary number. Because IEEE 802.1t reserves the lowest 12 bits for the Extended System ID (VLAN ID 0-4095), the priority field uses only the 4 most significant bits. Therefore, priorities MUST be multiples of 4096 (0, 4096, 8192, 12288, 16384, ... 32768, 61440).
]
''')

# LAB 6
labs.append('''= LAB 06: STATIC ROUTING, DEFAULT & FLOATING BACKUP

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy enterprise static routing with automatic link failover: configure primary static routes over a high-speed fiber link (AD 1), a default route to the ISP gateway, and a secondary floating static route (AD 10) over a backup cellular link.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab06-routing-failover-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & Route Table Schema
#table(
  columns: (1fr, 1.5fr, 1.4fr, 1.2fr, 1.9fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Route Type*], [*Destination Prefix*], [*Next-Hop IP*], [*Admin Distance*], [*Failover Behavior*],
  [Default Route], [0.0.0.0/0], [203.0.113.1 (ISP)], [AD 1], [Gateway of Last Resort],
  [Primary Static], [192.168.20.0/24], [10.1.1.2 (Fiber)], [AD 1], [Installed in FIB during normal state],
  [Floating Backup], [192.168.20.0/24], [10.2.2.2 (Cellular)], [AD 10], [Dormant; floats to active if fiber fails]
)

== 2. Production Configuration Script (HQ Router)
```cisco
HQ-RTR# configure terminal
HQ-RTR(config)# hostname HQ-RTR
! --- Primary High-Speed Path (Default AD 1) ---
HQ-RTR(config)# ip route 192.168.20.0 255.255.255.0 10.1.1.2
! --- Internet Gateway Default Route ---
HQ-RTR(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.1
! --- Secondary Floating Backup Route (AD 10) ---
HQ-RTR(config)# ip route 192.168.20.0 255.255.255.0 10.2.2.2 10
HQ-RTR(config)# end
HQ-RTR# copy running-config startup-config
```

== 3. Terminal Verification & Failover Simulation
#terminal-specimen(title: "HQ-RTR# show ip route static (Normal State)")[
```text
Gateway of last resort is 203.0.113.1 to network 0.0.0.0
S*    0.0.0.0/0 [1/0] via 203.0.113.1
S     192.168.20.0/24 [1/0] via 10.1.1.2  [Primary fiber active; backup hidden]

Simulation: Fail primary fiber: HQ-RTR(config)# interface Gi0/0/1 -> shutdown
HQ-RTR# show ip route static (Failover State)
S     192.168.20.0/24 [10/0] via 10.2.2.2 [Floating route immediately installed!]
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *Next-Hop IP vs Exit Interface:* On multi-access Ethernet segments, never configure `ip route 192.168.20.0 255.255.255.0 GigabitEthernet0/0/1` without a next-hop IP. The router will assume every single host in the remote subnet is directly connected, generating an ARP broadcast storm that exhausts router CPU and CAM memory.
]
''')

# LAB 7
labs.append('''= LAB 07: OSPFv2 DYNAMIC ROUTING & COST TUNING

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy Single-Area OSPFv2 across an enterprise routed backbone: configure deterministic 32-bit Router IDs, tune the reference bandwidth to 10 Gbps (10000 Mbps) for gigabit cost differentiation, and configure passive-interfaces on user LANs.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab07-ospf-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & OSPF Area 0 Schema
#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.3fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Router*], [*Router ID*], [*Active Subnets*], [*OSPF Area*], [*Cost Tuning / Features*],
  [R1-CORE], [1.1.1.1], [10.0.0.0/30, 192.168.10.0/24], [Area 0], [Passive-interface Gi0/0/0, Ref-BW 10000],
  [R2-DIST], [2.2.2.2], [10.0.0.0/30, 10.0.0.4/30], [Area 0], [Elected DR on multi-access backbone],
  [R3-DIST], [3.3.3.3], [10.0.0.4/30, 192.168.30.0/24], [Area 0], [Elected BDR, Passive user LAN]
)

== 2. Production Configuration Script
```cisco
R1# configure terminal
R1(config)# router ospf 1
R1(config-router)# router-id 1.1.1.1
R1(config-router)# auto-cost reference-bandwidth 10000
% OSPF: Reference bandwidth is changed. Please ensure reference bandwidth
%       is consistent across all routers in the OSPF network.
R1(config-router)# network 10.0.0.0 0.0.0.3 area 0
R1(config-router)# network 192.168.10.0 0.0.0.255 area 0
R1(config-router)# passive-interface GigabitEthernet0/0/0
R1(config-router)# end
```

== 3. Terminal Verification & Output Specimen
#terminal-specimen(title: "R1-CORE# show ip ospf neighbor")[
```text
Neighbor ID     Pri   State           Dead Time   Address         Interface
2.2.2.2           1   FULL/DR         00:00:35    10.0.0.2        GigabitEthernet0/0/1

R1-CORE# show ip route ospf
O     10.0.0.4/30 [110/20] via 10.0.0.2, 00:04:12, GigabitEthernet0/0/1
O     192.168.30.0/24 [110/21] via 10.0.0.2, 00:04:12, GigabitEthernet0/0/1
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *The Default Reference Bandwidth Trap:* Default OSPF reference bandwidth is 100 Mbps (10^8 bps). Under this default, a 100 Mbps link has cost 1, but a 1 Gbps (1000 Mbps) link also rounds to cost 1! Without `auto-cost reference-bandwidth 10000`, OSPF treats a 100M link and a 1G link as identical cost!
]
''')

# LAB 8
labs.append('''= LAB 08: ENTERPRISE DHCP SERVER & RELAY AGENT

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy centralized Cisco IOS DHCP services and configure an `ip helper-address` DHCP relay agent on a remote branch router to forward UDP 67/68 client discovery broadcasts across Layer 3 boundaries.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab08-dhcp-relay-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & DHCP Pool Schema
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 1.4fr, 1.6fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Service Role*], [*Pool Network*], [*Excluded Range*], [*Relay Target*],
  [HQ-DHCP-SRV], [Central DHCP Server], [192.168.30.0/24], [.1 to .10, .254], [DNS 8.8.8.8, Lease 7 days],
  [Branch-RTR], [DHCP Relay Agent], [N/A (Forwarder)], [N/A], [ip helper-address 10.1.1.1],
  [Client-PC], [DHCP Client], [Auto-Assigned], [N/A], [DORA Broadcasts on Gi0/0/0]
)

== 2. Production Configuration Script
```cisco
! --- Central DHCP Server (HQ-DHCP-SRV) ---
HQ-SRV(config)# ip dhcp excluded-address 192.168.30.1 192.168.30.10
HQ-SRV(config)# ip dhcp excluded-address 192.168.30.254
HQ-SRV(config)# ip dhcp pool BRANCH_CLIENT_POOL
HQ-SRV(config-dhcp)# network 192.168.30.0 255.255.255.0
HQ-SRV(config-dhcp)# default-router 192.168.30.1
HQ-SRV(config-dhcp)# dns-server 8.8.8.8 1.1.1.1
HQ-SRV(config-dhcp)# domain-name rtechlab.internal
HQ-SRV(config-dhcp)# lease 7 0 0
! --- Branch Router Relay Agent (Branch-RTR) ---
Branch-RTR(config)# interface GigabitEthernet0/0/0
Branch-RTR(config-if)# description CLIENT_FACING_LAN
Branch-RTR(config-if)# ip helper-address 10.1.1.1
```

== 3. Terminal Verification & Output Specimen
#terminal-specimen(title: "HQ-DHCP-SRV# show ip dhcp binding")[
```text
IP address       Client-ID/Hardware address      Lease expiration        Type
192.168.30.11    0100.5079.6668.00               Nov 27 2027 08:30 AM    Automatic
192.168.30.12    0100.5079.6668.01               Nov 27 2027 08:32 AM    Automatic

Branch-RTR# show ip interface GigabitEthernet0/0/0 | include Helper
  Helper address is 10.1.1.1
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *The Giaddr Mechanism:* How does the central DHCP server know which IP subnet pool to draw from when receiving a unicast packet? When `ip helper-address` intercepts the broadcast, it inserts the IP address of the ingress interface into the `giaddr` (Gateway IP Address) field of the DHCP packet header. The server matches `giaddr` to the corresponding pool!
]
''')

# LAB 9
labs.append('''= LAB 09: PAT (NAT OVERLOAD) FOR ENTERPRISE INTERNET

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy Port Address Translation (PAT / NAT Overload) on an enterprise edge router: define inside private subnets via standard ACL, designate inside/outside roles, and dynamically overload private hosts onto a public WAN IP.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab09-pat-nat-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & NAT Address Mapping Schema
#table(
  columns: (1fr, 1.3fr, 1.4fr, 1.3fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*NAT Role*], [*Interface*], [*IP Address*], [*Translation Type*], [*Operational Description*],
  [Inside Local], [Gi0/0/0], [192.168.10.50], [Private RFC 1918], [Internal Workstation IP],
  [Inside Global], [Gi0/0/1], [203.0.113.1:10523], [Public Routable], [Router Outside WAN Interface (Overload)],
  [Outside Global], [Internet], [142.250.190.46:443], [Public Server], [Target Destination Web Server (Google)]
)

== 2. Production Configuration Script
```cisco
Edge-RTR# configure terminal
! --- Step 1: Standard ACL Matching Private Subnets ---
Edge-RTR(config)# access-list 1 permit 192.168.10.0 0.0.0.255
! --- Step 2: Configure PAT Overload onto WAN Interface ---
Edge-RTR(config)# ip nat inside source list 1 interface GigabitEthernet0/0/1 overload
! --- Step 3: Designate Inside and Outside Interfaces ---
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# ip nat inside
Edge-RTR(config)# interface GigabitEthernet0/0/1
Edge-RTR(config-if)# ip nat outside
Edge-RTR(config-if)# end
```

== 3. Terminal Verification & Output Specimen
#terminal-specimen(title: "Edge-RTR# show ip nat translations")[
```text
Pro  Inside global         Inside local          Outside local         Outside global
tcp  203.0.113.1:10523     192.168.10.50:10523   142.250.190.46:443    142.250.190.46:443
tcp  203.0.113.1:10524     192.168.10.51:10524   142.250.190.46:443    142.250.190.46:443

Edge-RTR# show ip nat statistics
Total active translations: 2 (0 static, 2 dynamic; 2 extended)
Outside interfaces: GigabitEthernet0/0/1
Inside interfaces: GigabitEthernet0/0/0
Hits: 1242  Misses: 2
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *The Overload Keyword:* If you forget the `overload` keyword at the end of `ip nat inside source list 1 interface Gi0/0/1`, Cisco IOS treats it as dynamic 1-to-1 NAT! The very first private PC will consume the single WAN IP, and all other computers on the LAN will be blocked from accessing the internet! Always append `overload`.
]
''')

# LAB 10
labs.append('''= LAB 10: EXTENDED ACCESS CONTROL LISTS (ACLS)

#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy an Extended Access Control List (ACL 105) on an enterprise edge router: block all HTTP (port 80) and HTTPS (port 443) traffic from Guest LAN to the Corporate Server, while permitting DNS, ICMP, and public internet access.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab10-extended-acl-topology.svg", width: 100%)
#v(2pt)

== 1. Topology & Access Policy Schema
#table(
  columns: (1.1fr, 1.4fr, 1.4fr, 1.1fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Source Subnet*], [*Destination Host*], [*Protocol / Port*], [*Action*], [*Security Intent*],
  [192.168.50.0/24 (Guest)], [10.1.1.100 (Corp SRV)], [TCP 80 (HTTP)], [DENY], [Block unencrypted intranet access],
  [192.168.50.0/24 (Guest)], [10.1.1.100 (Corp SRV)], [TCP 443 (HTTPS)], [DENY], [Block encrypted corporate web app],
  [192.168.50.0/24 (Guest)], [Any (0.0.0.0/0)], [IP Any], [PERMIT], [Allow all other Internet and DNS traffic]
)

== 2. Production Configuration Script
```cisco
R1-BORDER# configure terminal
! --- Define Extended ACL 105 ---
R1-BORDER(config)# access-list 105 remark BLOCK_GUEST_HTTP_TO_CORP_SERVER
R1-BORDER(config)# access-list 105 deny tcp 192.168.50.0 0.0.0.255 host 10.1.1.100 eq 80
R1-BORDER(config)# access-list 105 remark BLOCK_GUEST_HTTPS_TO_CORP_SERVER
R1-BORDER(config)# access-list 105 deny tcp 192.168.50.0 0.0.0.255 host 10.1.1.100 eq 443
R1-BORDER(config)# access-list 105 remark PERMIT_ALL_OTHER_INTERNET_TRAFFIC
R1-BORDER(config)# access-list 105 permit ip any any
! --- Apply Inbound on Guest Interface (Closest to Source) ---
R1-BORDER(config)# interface GigabitEthernet0/0/0.50
R1-BORDER(config-subif)# ip access-group 105 in
R1-BORDER(config-subif)# end
```

== 3. Terminal Verification & Output Specimen
#terminal-specimen(title: "R1-BORDER# show access-lists 105")[
```text
Extended IP access list 105
    10 deny tcp 192.168.50.0 0.0.0.255 host 10.1.1.100 eq www (24 matches)
    20 deny tcp 192.168.50.0 0.0.0.255 host 10.1.1.100 eq 443 (18 matches)
    30 permit ip any any (532 matches)

Verification Test: Guest Laptop (192.168.50.15) -> Web Browser to http://10.1.1.100
Result: "Connection Timed Out" (Blocked by ACL 105)
Guest Laptop -> ping 8.8.8.8
Reply from 8.8.8.8: bytes=32 time=12ms TTL=118 (Permitted by rule 30)
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP")[
  *The Golden Rule of ACL Placement:* Standard ACLs evaluate ONLY Source IP and must be placed as close to the DESTINATION as possible to avoid inadvertently blocking traffic to other servers. Extended ACLs evaluate Protocol and Destination Port, so they should be placed as close to the SOURCE as possible to stop unwanted traffic before it consumes WAN bandwidth.
]
''')

output_typ = doc_header
for lab in labs:
    output_typ += "\n#pagebreak()\n" + lab

with open(SOURCE_FILE, "w", encoding="utf-8") as f:
    f.write(output_typ)

print(f"[OK] Assembled complete rich lab workbook to: {SOURCE_FILE}")

# Compile PDF with Typst
typst_cmd = ["typst", "compile", "--root", CCNA_DIR, SOURCE_FILE, PDF_OUT]
print("Running:", " ".join(typst_cmd))
res = subprocess.run(typst_cmd, capture_output=True, text=True)
if res.returncode != 0:
    print("[ERROR] Typst compile failed:", res.stderr)
else:
    print("[SUCCESS] Compiled PDF:", PDF_OUT)
    shutil.copyfile(PDF_OUT, PUBLIC_PDF)
    print("[OK] Copied to public/downloads/!")

    # Verify page count and file size
    import fitz
    doc = fitz.open(PDF_OUT)
    print(f"[VERIFICATION] Total pages: {len(doc)}, File size: {os.path.getsize(PDF_OUT)} bytes")
