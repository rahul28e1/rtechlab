# -*- coding: utf-8 -*-
"""
Enrich English CCNA chapters to eliminate all blank pages and provide deep, professional content.
"""
import os

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\DIGITAL\CCNA 200-301\07_SOURCE_FILES\English"

def enrich_ch01():
    fpath = os.path.join(BASE_DIR, "chapter-01.typ")
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    addition = '''
== 1.6 Enterprise Topology Architecture Comparison Matrix
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Topology Model*], [*Target Scale*], [*Layer 2 / 3 Boundary*], [*Production Engineering Characteristics*]),
  [Three-Tier Hierarchical], [Large Enterprise (1000+ hosts)], [Routed at Core/Distribution], [Strict segregation: Core (high-speed transport), Distribution (policy/routing), Access (endpoints).],
  [Two-Tier Collapsed Core], [Medium/SMB (50 - 500 hosts)], [Routed at Collapsed Tier], [Combines Core and Distribution into single physical or VSS/StackWise switch pair. Cost-effective.],
  [Spine-Leaf (Clos)], [Datacenter & Cloud Fabrics], [Routed at Leaf Switches (L3)], [Every Leaf connects to every Spine. Deterministic 2-hop East-West traffic latency. Loop-free without STP.],
  [SOHO Architecture], [Branch / Home (1 - 25 hosts)], [Routed at Edge Gateway], [Integrated single-chassis router/switch/firewall/AP appliance. Uplink via single broadband/LTE ISP.]
)

#v(3pt)

== 1.7 Cloud Service & Deployment Models Reference Matrix
Cloud computing shifts enterprise workloads from physical on-premises datacenters to shared or private virtualization pools:
#table(
  columns: (1fr, 1.3fr, 1.5fr, 2.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Model*], [*Management Boundary*], [*Customer Responsibility*], [*Enterprise Example & CCNA Relevance*]),
  [IaaS (Infrastructure)], [Hardware / Hypervisor], [OS, Middleware, Apps, Data], [AWS EC2, Cisco Cloud Services Router (CSR1000v), Azure VM.],
  [PaaS (Platform)], [Underlying OS & Runtimes], [Application Code & Data], [AWS Elastic Beanstalk, Google App Engine. No OS maintenance.],
  [SaaS (Software)], [Entire Stack Managed], [User Access & Configuration], [Cisco Webex, Microsoft 365, Salesforce. Complete turnkey service.],
  [Private Cloud], [On-Premises Dedicated], [Total Stack Control & SLA], [VMware vSphere / OpenStack deployed in corporate datacenter.],
  [Hybrid Cloud], [Interconnected Public/Private], [Unified Security & Orchestration], [On-premises database connected via AWS Direct Connect / IPsec VPN.]
)

#v(3pt)

== 1.8 Network Performance Metrics & Quality of Service (QoS)
Network performance is objectively measured across four core metrics governed by Service Level Agreements (SLAs):
- *Bandwidth vs Throughput:* *Bandwidth* is the theoretical maximum data transfer capacity of a physical medium (e.g. 1 Gbps GigabitEthernet). *Throughput* is the actual rate of successfully delivered application data payload after subtracting Layer 2/3/4 header overhead, collisions, and retransmissions.
- *Latency (Delay):* The elapsed time required for a packet to travel from source to destination. Sources include *Propagation Delay* (speed of light in copper/fiber: ~5 microseconds per kilometer), *Serialization Delay* (time to push bits onto wire), and *Queuing Delay* (time waiting in switch buffers).
- *Jitter (Delay Variation):* The statistical variance in packet arrival times. High jitter causes audio distortion and video stuttering in Real-Time Transport Protocol (RTP) voice/video streams.
- *Packet Loss:* Percentage of packets discarded due to link congestion or buffer overflow. Enterprise VoIP requires packet loss under #hl[1%], latency under #hl[150 ms], and jitter under #hl[30 ms].
'''
    # Insert before FAQs
    idx = text.find("== Comprehensive Review, FAQs")
    if idx != -1:
        text = text[:idx] + addition + "\n" + text[idx:]
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)
        print("[OK] Enriched Chapter 1")

def enrich_ch02():
    fpath = os.path.join(BASE_DIR, "chapter-02.typ")
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    addition = '''
== 2.6 Optical Transceiver Form Factors & Fiber Specifications
Modern Cisco switches utilize modular hot-swappable optical transceivers to connect campus and datacenter fiber links:
#table(
  columns: (1fr, 1.1fr, 1.4fr, 1.3fr, 2.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Transceiver*], [*Max Speed*], [*Fiber Media*], [*Max Distance*], [*Common Enterprise Application*]),
  [1000BASE-SX], [1 Gbps], [Multimode (OM2/OM3)], [550 meters], [Intra-building building distribution uplinks (850nm laser).],
  [1000BASE-LX], [1 Gbps], [Single-Mode (OS2)], [10 km], [Campus backbone and metropolitan interconnects (1310nm).],
  [10GBASE-SR], [10 Gbps], [Multimode (OM3/OM4)], [300 - 400 meters], [Datacenter top-of-rack switch to server uplinks (SFP+).],
  [10GBASE-LR], [10 Gbps], [Single-Mode (OS2)], [10 km], [Long-haul campus core and WAN point-to-point connections.],
  [40GBASE-SR4], [40 Gbps], [Multimode MPO/MTP], [100 meters], [High-density QSFP+ spine-leaf switch interconnects.],
  [100GBASE-LR4], [100 Gbps], [Single-Mode Duplex LC], [10 km], [Hyperscale cloud datacenter and telecom core backbones.]
)

#v(3pt)

== 2.7 Twisted-Pair Category Standards & Pinout Reference
#table(
  columns: (1.1fr, 1.3fr, 1.3fr, 1.1fr, 2.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Category*], [*Max Speed*], [*Bandwidth*], [*Max Reach*], [*Shielding & Recommended Deployment*]),
  [Cat 5e], [1 Gbps], [100 MHz], [100 meters], [UTP; legacy basic desktop connectivity.],
  [Cat 6], [1 Gbps / 10 Gbps], [250 MHz], [100m (1G) / 55m (10G)], [UTP/STP with internal spline separator; enterprise horizontal cabling.],
  [Cat 6a], [10 Gbps], [500 MHz], [100 meters], [F/UTP or STP; high-performance 10G enterprise workstations & Wi-Fi 6/7 APs.],
  [Cat 7 / 8], [25G / 40 Gbps], [600 - 2000 MHz], [30 meters (Cat 8)], [S/FTP fully shielded; datacenter top-of-rack server patching.]
)

#v(3pt)

== 2.8 Power over Ethernet (PoE) IEEE Standards & Power Budgets
Power over Ethernet delivers direct electrical current alongside data over twisted-pair copper cabling, eliminating external AC power supplies for remote devices:
- *IEEE 802.3af (PoE Type 1):* Provides up to #hl[15.4 Watts] at switch port (delivers 12.95W to device over Cat3/5). Powers basic VoIP phones and stationary IP security cameras.
- *IEEE 802.3at (PoE+ Type 2):* Delivers up to #hl[30.0 Watts] at switch port (25.5W to device). Powers dual-band 802.11ac Wi-Fi access points and pan-tilt-zoom (PTZ) surveillance cameras.
- *IEEE 802.3bt (PoE++ Type 3 / 4 / 4PPoE):*
  - *Type 3:* Up to #hl[60 Watts] per port using all 4 pairs. Powers video conferencing screens and multi-radio Wi-Fi 6 APs.
  - *Type 4 (Universal PoE):* Up to #hl[90 - 100 Watts] per port. Powers smart LED lighting fixtures, thin clients, and industrial IoT controllers.
- *Cisco CLI PoE Verification:*
  `Switch# show power inline` ; `Switch# show power inline GigabitEthernet0/1`
'''
    idx = text.find("== Comprehensive Review, FAQs")
    if idx != -1:
        text = text[:idx] + addition + "\n" + text[idx:]
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)
        print("[OK] Enriched Chapter 2")

def enrich_ch03():
    fpath = os.path.join(BASE_DIR, "chapter-03.typ")
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    addition = '''
== 3.6 IPv4 Subnetting & Wildcard Mask Fast-Lookup Super Matrix
#table(
  columns: (0.8fr, 1.5fr, 1.4fr, 1.1fr, 1.2fr, 1fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*CIDR*], [*Subnet Mask*], [*Wildcard Mask*], [*Total IPs*], [*Usable Hosts*], [*Block Size*]),
  [/24], [255.255.255.0], [0.0.0.255], [256], [254], [256],
  [/25], [255.255.255.128], [0.0.0.127], [128], [126], [128],
  [/26], [255.255.255.192], [0.0.0.63], [64], [62], [64],
  [/27], [255.255.255.224], [0.0.0.31], [32], [30], [32],
  [/28], [255.255.255.240], [0.0.0.15], [16], [14], [16],
  [/29], [255.255.255.248], [0.0.0.7], [8], [6], [8],
  [/30], [255.255.255.252], [0.0.0.3], [4], [2 (Point-to-Point)], [4],
  [/31], [255.255.255.254], [0.0.0.1], [2], [2 (RFC 3021 Routers)], [2],
  [/32], [255.255.255.255], [0.0.0.0], [1], [1 (Single Host / Loopback)], [1]
)

#v(3pt)

== 3.7 Special & Reserved IPv4 Address Blocks Architecture
Beyond standard classful and RFC 1918 private addressing, specific IPv4 blocks are globally reserved by IANA:
- *Loopback Block (`127.0.0.0/8`):* `127.0.0.1` represents the local host TCP/IP stack. Packets sent to `127.0.0.1` never exit the physical NIC. Used for software testing and internal process communication.
- *APIPA / Link-Local (`169.254.0.0/16` - RFC 3927):* Automatic Private IP Addressing. When a DHCP client broadcasts `DHCPDISCOVER` and receives no response after 60 seconds, the OS self-assigns an address in `169.254.1.0` - `169.254.254.255`. APIPA allows local subnet communication but cannot reach the default gateway or Internet!
- *Documentation / Test Ranges (RFC 5737):* `192.0.2.0/24` (TEST-NET-1), `198.51.100.0/24` (TEST-NET-2), and `203.0.113.0/24` (TEST-NET-3). Reserved strictly for educational textbooks and vendor configuration examples; never routable on the public Internet.
- *Carrier-Grade NAT (CGNAT - RFC 6598):* `100.64.0.0/10` (`100.64.0.0` - `100.127.255.255`). Used by mobile network operators and ISPs to perform massive shared address translation between customer CPE routers and the ISP core.
'''
    idx = text.find("== Comprehensive Review, FAQs")
    if idx != -1:
        text = text[:idx] + addition + "\n" + text[idx:]
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)
        print("[OK] Enriched Chapter 3")

def enrich_ch04():
    fpath = os.path.join(BASE_DIR, "chapter-04.typ")
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    addition = '''
== 4.6 IPv6 Address Types & Scope Architecture Matrix
IPv6 eliminates broadcast addressing entirely, relying on Unicast, Anycast, and Multicast:
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Address Type*], [*Binary Prefix / Range*], [*Operational Scope*], [*CCNA Production Role*]),
  [Global Unicast (GUA)], [`2000::/3` (`2000::` - `3fff::`)], [Public Internet], [Globally routable unique public addresses assigned to enterprise interfaces.],
  [Link-Local (LLA)], [`fe80::/10` (`fe80::` - `febf::`)], [Single Local Link], [Mandatory auto-generated address; used as next-hop for routing protocols (OSPFv3).],
  [Unique Local (ULA)], [`fc00::/7` (`fc00::` - `fdff::`)], [Internal Enterprise Site], [Equivalent to RFC 1918 private IPv4. Not routed on the public Internet.],
  [Loopback], [`::1/128`], [Local Node Internal], [Tests local TCP/IP stack; equivalent to IPv4 127.0.0.1.],
  [Unspecified], [`::/128`], [Local Node Initialization], [Used as source address during initial boot before obtaining an IP.],
  [All-Nodes Multicast], [`ff02::1`], [Link-Local All Hosts], [Reaches all IPv6-enabled devices on the local segment (broadcast replacement).],
  [All-Routers Multicast], [`ff02::2`], [Link-Local All Routers], [Reaches all active IPv6 routers on the link (RS destination).]
)

#v(3pt)

== 4.7 EUI-64 Interface ID Generation Mechanics
Under Modified EUI-64, a host automatically creates a unique 64-bit Interface ID from its 48-bit physical MAC address:
1. *Step 1:* Split the 48-bit MAC address into two 24-bit halves. (Example MAC: `00:50:79:66:68:01` $arrow$ `00:50:79` and `66:68:01`).
2. *Step 2:* Insert the 16-bit hex constant #hl[`FF-FE`] directly into the center: `0050:79FF:FE66:6801`.
3. *Step 3:* Invert the 7th bit (Universal/Local bit) of the first byte:
   - First byte hex `00` = binary `0000 0000`.
   - Invert bit 7 (counting from left bit 1): binary `0000 0010` = hex `02`.
   - Final EUI-64 Interface ID: #hl[`0250:79ff:fe66:6801`].
- Combined with Link-Local prefix `fe80::/64`, the full Link-Local IP is `fe80::250:79ff:fe66:6801`.

#v(3pt)

== 4.8 IPv4 to IPv6 Migration & Coexistence Mechanisms
Complete transition to IPv6 takes years; three coexistence technologies are tested on CCNA 200-301:
- *1. Dual-Stack (Recommended):* Interfaces are configured simultaneously with an IPv4 address and an IPv6 address. Devices communicate natively over IPv4 with legacy hosts and IPv6 with modern services:
  `Router(config-if)# ip address 192.168.1.1 255.255.255.0`
  `Router(config-if)# ipv6 address 2001:db8:acad:1::1/64`
- *2. Tunneling (6to4 / GRE):* Encapsulates native IPv6 packets inside standard IPv4 headers to cross legacy IPv4-only ISP backbones.
- *3. Translation (NAT64 / DNS64):* Translates IPv6 packets to IPv4 packets at the border router, allowing IPv6-only clients to communicate with legacy IPv4-only web servers without software changes.
'''
    idx = text.find("== Comprehensive Review, FAQs")
    if idx != -1:
        text = text[:idx] + addition + "\n" + text[idx:]
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)
        print("[OK] Enriched Chapter 4")

def enrich_ch05():
    fpath = os.path.join(BASE_DIR, "chapter-05.typ")
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    addition = '''
== 5.8 Cisco Enterprise Router Hardware Architecture
Modern Cisco branch and edge routers feature modular architectures:
#table(
  columns: (1fr, 1.4fr, 1.4fr, 2.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Hardware Series*], [*Target Deployment*], [*Architecture Type*], [*Enterprise Characteristics*]),
  [Cisco ISR 1000 Series], [Small Branch & SOHO], [Fixed Appliance (Fanless option)], [Integrated LTE/5G wireless, 4-8 Gigabit ports, built-in security & SD-WAN.],
  [Cisco ISR 4000 Series], [Medium to Large Enterprise], [Modular Multicore IOS-XE], [Dedicated control, data, and service planes. NIM and SM-X expansion slots.],
  [Cisco Catalyst 8000], [Edge, Datacenter & Cloud], [Next-Gen SD-WAN Edge Platform], [High-density 10G/40G/100G interfaces, hardware cryptographic acceleration.],
  [Cisco ASR 1000 Series], [Enterprise WAN Aggregation], [Cisco QuantumFlow Processor], [Hardware-accelerated traffic inspection, deep QoS, and broadband aggregation.]
)

#v(3pt)

== 5.9 Cisco Hardware Health & Diagnostic CLI Commands
#table(
  columns: (1.3fr, 1.3fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Diagnostic Command*], [*Operational Output*], [*Triage & Analysis Target*]),
  [`show version`], [IOS release, uptime, config-register], [Verifies software image file, total RAM/NVRAM, and boot register.],
  [`show inventory`], [Chassis model, serial numbers, SFP modules], [Retrieves hardware serial numbers for Cisco TAC warranty service calls.],
  [`show environment`], [Internal fan RPM, PSU status, temperatures], [Monitors thermal sensors and power supply redundancy status.],
  [`show processes cpu sorted`], [Active processes sorted by CPU utilization], [Identifies rogue software tasks or broadcast loops consuming CPU cycles.],
  [`show memory statistics`], [Total, used, and free processor RAM], [Triages memory leak bugs and buffer exhaustion crashes.],
  [`show file systems`], [Available storage drives (`flash:`, `nvram:`)], [Checks free disk space before transferring new IOS-XE `.bin` images.]
)
'''
    idx = text.find("== Comprehensive Review, FAQs")
    if idx != -1:
        text = text[:idx] + addition + "\n" + text[idx:]
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)
        print("[OK] Enriched Chapter 5")

def enrich_ch06():
    fpath = os.path.join(BASE_DIR, "chapter-06.typ")
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    addition = '''
== 6.7 Interface Speed, Duplex & Error Counters Diagnostic Matrix
When Ethernet interfaces experience physical link issues, `show interfaces` reports critical error counters:
#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Error Metric*], [*Physical Root Cause*], [*Engineering Remediation & Triage*]),
  [Runts], [Frames smaller than 64-byte minimum], [Caused by collisions, faulty NIC drivers, or transceiver electrical noise.],
  [Giants], [Frames exceeding 1518-byte MTU limit], [Host transmitting baby-giant or jumbo frames without interface MTU adjustment.],
  [CRC Errors], [Corrupted checksum in Ethernet trailer], [Defective Cat6 cable, bad RJ45 crimp, electromagnetic interference (EMI), or bad SFP.],
  [Late Collisions], [Collision occurring after first 64 bytes], [#hl[Duplex Mismatch!] One side is set to Half-Duplex while the other is Full-Duplex.],
  [Input Errors], [Total sum of runts, giants, and CRC errors], [Replace patch cord, clean fiber optical endfaces, or inspect switch ASIC port.]
)
'''
    idx = text.find("== Comprehensive Review, FAQs")
    if idx != -1:
        text = text[:idx] + addition + "\n" + text[idx:]
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)
        print("[OK] Enriched Chapter 6")

def enrich_ch09():
    fpath = os.path.join(BASE_DIR, "chapter-09.typ")
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    addition = '''
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
'''
    idx = text.find("== Comprehensive Review, FAQs")
    if idx != -1:
        text = text[:idx] + addition + "\n" + text[idx:]
        with open(fpath, "w", encoding="utf-8") as f:
            f.write(text)
        print("[OK] Enriched Chapter 9")

def enrich_ch10():
    fpath = os.path.join(BASE_DIR, "chapter-10.typ")
    with open(fpath, "r", encoding="utf-8") as f:
        text = f.read()

    addition = '''
#faq-item(q: "How do you triage an MTU black hole in an enterprise WAN?", a: "An MTU black hole occurs when an intermediate router has a smaller MTU (e.g. 1400 on a VPN tunnel) and drops packets with the 'Don't Fragment' (DF) bit set, while ICMP 'Fragmentation Needed' packets are blocked by upstream firewalls. Triage by executing 'ping <ip> size 1500 df-bit' and decrementing packet size until ping succeeds. Fix by configuring 'ip tcp adjust-mss 1360' on the tunnel interface.")

#faq-item(q: "What causes asymmetric routing in multi-homed BGP networks, and how is it resolved?", a: "Asymmetric routing occurs when traffic exits via ISP-A but returns via ISP-B due to differing upstream BGP routing policies. While IP is inherently asymmetric, stateful firewalls drop returning packets because no initial SYN was recorded. Fix by tuning BGP Local Preference for outbound traffic and AS-Path Prepending or MED for inbound traffic to ensure symmetrical paths.")

#faq-item(q: "Explain the architectural difference between VXLAN overlay and 802.1Q VLANs in 2027 datacenters.", a: "Traditional 802.1Q VLANs use a 12-bit tag limited to 4,096 broadcast domains and rely on Spanning Tree to block redundant links. VXLAN (Virtual Extensible LAN) is an encapsulation protocol that wraps Layer 2 Ethernet frames inside Layer 3 UDP packets (Port 4789). It features a 24-bit VNI supporting 16.7 million segments and routes across Spine-Leaf underlay fabrics using ECMP, eliminating Spanning Tree entirely.")
'''
    # Append before final review/end
    text = text.rstrip() + "\n" + addition
    with open(fpath, "w", encoding="utf-8") as f:
        f.write(text)
    print("[OK] Enriched Chapter 10")

enrich_ch01()
enrich_ch02()
enrich_ch03()
enrich_ch04()
enrich_ch05()
enrich_ch06()
enrich_ch09()
enrich_ch10()
print("All chapters enriched successfully!")
