# -*- coding: utf-8 -*-
"""
Generate additional high-resolution Cisco Packet Tracer & GNS3 vector SVG network topologies:
- lab11-etherchannel-topology.svg
- lab12-ipv6-routing-topology.svg
- lab13-gns3-enterprise-topology.svg
- lab14-tac-troubleshooting-flowchart.svg
"""

import os

OUT_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab\DIGITAL\CCNA 200-301\07_SOURCE_FILES\03_VISUAL_ASSETS\packet-tracer-topologies"
os.makedirs(OUT_DIR, exist_ok=True)

# 1. EtherChannel LACP
svg11 = '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 190" width="100%" height="100%" style="background:#0F172A; border-radius:6px; font-family:'Segoe UI',sans-serif;">
  <rect x="0" y="0" width="780" height="24" fill="#1E293B" rx="6" ry="6"/>
  <circle cx="14" cy="12" r="4" fill="#EF4444"/>
  <circle cx="28" cy="12" r="4" fill="#F59E0B"/>
  <circle cx="42" cy="12" r="4" fill="#10B981"/>
  <text x="60" y="16" fill="#94A3B8" font-size="10" font-weight="bold">Cisco Packet Tracer — Lab 11: LACP EtherChannel (802.3ad) Link Aggregation</text>
  <rect x="700" y="5" width="68" height="14" fill="#0284C7" rx="3"/>
  <text x="705" y="15" fill="#FFFFFF" font-size="8" font-weight="bold">PACKET TRACER</text>

  <!-- SW1 -->
  <g transform="translate(90, 48)">
    <rect width="160" height="95" rx="5" fill="#1E293B" stroke="#0284C7" stroke-width="2"/>
    <rect x="0" y="0" width="160" height="20" fill="#0369A1" rx="5" ry="5"/>
    <text x="14" y="14" fill="#FFFFFF" font-size="10" font-weight="bold">SW1-DISTRIBUTION</text>
    <text x="12" y="38" fill="#38BDF8" font-size="8.5" font-weight="bold">Cisco Catalyst 3650</text>
    <text x="12" y="53" fill="#94A3B8" font-size="8">Port-channel 1 (Active)</text>
    <text x="12" y="68" fill="#10B981" font-size="8">LACP Mode: active</text>
    <text x="12" y="83" fill="#F59E0B" font-size="8">Trunk: VLAN 10,20,99</text>
  </g>

  <!-- Dual Cable Links with bundling ring -->
  <line x1="250" y1="80" x2="520" y2="80" stroke="#10B981" stroke-width="3"/>
  <line x1="250" y1="105" x2="520" y2="105" stroke="#10B981" stroke-width="3"/>

  <!-- Link Status Lights -->
  <circle cx="260" cy="80" r="4" fill="#22C55E"/>
  <circle cx="510" cy="80" r="4" fill="#22C55E"/>
  <circle cx="260" cy="105" r="4" fill="#22C55E"/>
  <circle cx="510" cy="105" r="4" fill="#22C55E"/>

  <!-- Aggregation Oval Ring -->
  <ellipse cx="385" cy="92.5" rx="42" ry="24" fill="none" stroke="#F59E0B" stroke-width="2" stroke-dasharray="3,3"/>
  <rect x="330" y="82" width="110" height="21" fill="#0F172A" rx="4" stroke="#F59E0B" stroke-width="1"/>
  <text x="338" y="96" fill="#F59E0B" font-size="9" font-weight="bold">Po1 (2 Gbps Aggregate)</text>

  <text x="268" y="74" fill="#94A3B8" font-size="7.5">Gi0/1</text>
  <text x="480" y="74" fill="#94A3B8" font-size="7.5">Gi0/1</text>
  <text x="268" y="119" fill="#94A3B8" font-size="7.5">Gi0/2</text>
  <text x="480" y="119" fill="#94A3B8" font-size="7.5">Gi0/2</text>

  <!-- SW2 -->
  <g transform="translate(520, 48)">
    <rect width="160" height="95" rx="5" fill="#1E293B" stroke="#0284C7" stroke-width="2"/>
    <rect x="0" y="0" width="160" height="20" fill="#0369A1" rx="5" ry="5"/>
    <text x="24" y="14" fill="#FFFFFF" font-size="10" font-weight="bold">SW2-ACCESS</text>
    <text x="12" y="38" fill="#38BDF8" font-size="8.5" font-weight="bold">Cisco Catalyst 2960</text>
    <text x="12" y="53" fill="#94A3B8" font-size="8">Port-channel 1 (Active)</text>
    <text x="12" y="68" fill="#10B981" font-size="8">LACP Mode: active</text>
    <text x="12" y="83" fill="#F59E0B" font-size="8">Trunk: VLAN 10,20,99</text>
  </g>

  <rect x="230" y="156" width="310" height="22" rx="4" fill="#1E293B" stroke="#334155" stroke-width="1"/>
  <text x="240" y="171" fill="#38BDF8" font-size="8.5" font-weight="bold">IEEE 802.3ad / 802.1AX: Load-Balances via src-dst-mac hash</text>
</svg>'''

# 2. IPv6 Routing & Dual-Stack Topology
svg12 = '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 190" width="100%" height="100%" style="background:#0F172A; border-radius:6px; font-family:'Segoe UI',sans-serif;">
  <rect x="0" y="0" width="780" height="24" fill="#1E293B" rx="6" ry="6"/>
  <circle cx="14" cy="12" r="4" fill="#EF4444"/>
  <circle cx="28" cy="12" r="4" fill="#F59E0B"/>
  <circle cx="42" cy="12" r="4" fill="#10B981"/>
  <text x="60" y="16" fill="#94A3B8" font-size="10" font-weight="bold">Cisco Packet Tracer — Lab 12: IPv6 Dual-Stack &amp; OSPFv3 Dynamic Routing</text>
  <rect x="700" y="5" width="68" height="14" fill="#0284C7" rx="3"/>
  <text x="705" y="15" fill="#FFFFFF" font-size="8" font-weight="bold">PACKET TRACER</text>

  <!-- R1-EDGE -->
  <g transform="translate(60, 48)">
    <rect width="180" height="95" rx="5" fill="#1E293B" stroke="#8B5CF6" stroke-width="2"/>
    <rect x="0" y="0" width="180" height="20" fill="#6D28D9" rx="5" ry="5"/>
    <text x="14" y="14" fill="#FFFFFF" font-size="10" font-weight="bold">R1-EDGE-ROUTER</text>
    <text x="10" y="38" fill="#C4B5FD" font-size="8" font-weight="bold">IPv4: 192.168.1.1 /24</text>
    <text x="10" y="53" fill="#A78BFA" font-size="7.5">2001:db8:acad:1::1/64</text>
    <text x="10" y="68" fill="#F472B6" font-size="7.5">Link-Local: fe80::1</text>
    <text x="10" y="83" fill="#34D399" font-size="7.5">ipv6 unicast-routing</text>
  </g>

  <!-- Point to Point Dual-Stack WAN Link -->
  <line x1="240" y1="95" x2="520" y2="95" stroke="#8B5CF6" stroke-width="3"/>
  <circle cx="250" cy="95" r="4" fill="#22C55E"/>
  <circle cx="510" cy="95" r="4" fill="#22C55E"/>

  <rect x="300" y="65" width="170" height="48" rx="4" fill="#1E293B" stroke="#8B5CF6" stroke-width="1"/>
  <text x="312" y="80" fill="#C4B5FD" font-size="8" font-weight="bold">Point-to-Point WAN (Gi0/0/1)</text>
  <text x="312" y="93" fill="#38BDF8" font-size="7.5">IPv4: 10.0.0.0/30 (R1:.1, R2:.2)</text>
  <text x="312" y="106" fill="#A78BFA" font-size="7.5">IPv6: 2001:db8:acad:12::/64</text>

  <!-- R2-CORE -->
  <g transform="translate(520, 48)">
    <rect width="180" height="95" rx="5" fill="#1E293B" stroke="#8B5CF6" stroke-width="2"/>
    <rect x="0" y="0" width="180" height="20" fill="#6D28D9" rx="5" ry="5"/>
    <text x="24" y="14" fill="#FFFFFF" font-size="10" font-weight="bold">R2-CORE-ROUTER</text>
    <text x="10" y="38" fill="#C4B5FD" font-size="8" font-weight="bold">IPv4: 192.168.2.1 /24</text>
    <text x="10" y="53" fill="#A78BFA" font-size="7.5">2001:db8:acad:2::1/64</text>
    <text x="10" y="68" fill="#F472B6" font-size="7.5">Link-Local: fe80::2</text>
    <text x="10" y="83" fill="#34D399" font-size="7.5">OSPFv3 Area 0 Active</text>
  </g>

  <rect x="220" y="156" width="340" height="22" rx="4" fill="#1E293B" stroke="#334155" stroke-width="1"/>
  <text x="230" y="171" fill="#C4B5FD" font-size="8.5" font-weight="bold">OSPFv3 (RFC 5340) runs directly over Link-Local (fe80::) addresses</text>
</svg>'''

# 3. GNS3 Enterprise Architecture Topology
svg13 = '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 190" width="100%" height="100%" style="background:#090D16; border-radius:6px; font-family:'Segoe UI',sans-serif;">
  <rect x="0" y="0" width="780" height="24" fill="#1E293B" rx="6" ry="6"/>
  <circle cx="14" cy="12" r="4" fill="#EF4444"/>
  <circle cx="28" cy="12" r="4" fill="#F59E0B"/>
  <circle cx="42" cy="12" r="4" fill="#10B981"/>
  <text x="60" y="16" fill="#94A3B8" font-size="10" font-weight="bold">GNS3 Network Simulation Environment — Cisco IOS c7200 Enterprise Topology</text>
  <rect x="690" y="5" width="78" height="14" fill="#2563EB" rx="3"/>
  <text x="696" y="15" fill="#FFFFFF" font-size="8" font-weight="bold">GNS3 SERVER</text>

  <!-- Cloud NAT Node -->
  <g transform="translate(50, 48)">
    <rect width="130" height="95" rx="5" fill="#1E293B" stroke="#3B82F6" stroke-width="2"/>
    <rect x="0" y="0" width="130" height="20" fill="#1D4ED8" rx="5" ry="5"/>
    <text x="14" y="14" fill="#FFFFFF" font-size="9" font-weight="bold">CLOUD-NAT-0</text>
    <text x="10" y="40" fill="#93C5FD" font-size="8">Real PC Network Card</text>
    <text x="10" y="55" fill="#94A3B8" font-size="7.5">Host NAT Gateway</text>
    <text x="10" y="70" fill="#10B981" font-size="7.5">192.168.122.1</text>
    <text x="10" y="85" fill="#F59E0B" font-size="7.5">Internet Breakout</text>
  </g>

  <line x1="180" y1="95" x2="280" y2="95" stroke="#3B82F6" stroke-width="2.5" stroke-dasharray="4,2"/>

  <!-- c7200 Core Router -->
  <g transform="translate(280, 48)">
    <rect width="180" height="95" rx="5" fill="#1E293B" stroke="#0284C7" stroke-width="2"/>
    <rect x="0" y="0" width="180" height="20" fill="#0284C7" rx="5" ry="5"/>
    <text x="14" y="14" fill="#FFFFFF" font-size="9.5" font-weight="bold">R1-c7200-EDGE (IOS 15.2)</text>
    <text x="10" y="38" fill="#38BDF8" font-size="8">f0/0: 192.168.122.50 (DHCP)</text>
    <text x="10" y="53" fill="#94A3B8" font-size="7.5">f1/0: 10.10.10.1/24 (Trunk)</text>
    <text x="10" y="68" fill="#F59E0B" font-size="7.5">PAT Overload + OSPFv2</text>
    <text x="10" y="83" fill="#10B981" font-size="7.5">Dynamips Emulated MIPS64</text>
  </g>

  <line x1="460" y1="95" x2="560" y2="95" stroke="#10B981" stroke-width="2.5"/>

  <!-- IOU L2 Switch & Linux Host -->
  <g transform="translate(560, 48)">
    <rect width="165" height="95" rx="5" fill="#1E293B" stroke="#10B981" stroke-width="2"/>
    <rect x="0" y="0" width="165" height="20" fill="#059669" rx="5" ry="5"/>
    <text x="14" y="14" fill="#FFFFFF" font-size="9" font-weight="bold">SW-IOU-L2 + Docker Host</text>
    <text x="10" y="38" fill="#6EE7B7" font-size="8">Cisco IOU L2 Enterprise</text>
    <text x="10" y="53" fill="#94A3B8" font-size="7.5">e0/0 Trunk to c7200</text>
    <text x="10" y="68" fill="#94A3B8" font-size="7.5">e0/1 VPCS1 (VLAN 10)</text>
    <text x="10" y="83" fill="#F59E0B" font-size="7.5">e0/2 Ubuntu ZTP / Netmiko</text>
  </g>

  <rect x="200" y="156" width="380" height="22" rx="4" fill="#1E293B" stroke="#334155" stroke-width="1"/>
  <text x="210" y="171" fill="#38BDF8" font-size="8.5" font-weight="bold">GNS3 runs actual production Cisco IOS / IOU binaries with Wireshark packet capture</text>
</svg>'''

# 4. TAC Troubleshooting Flowchart
svg14 = '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 780 190" width="100%" height="100%" style="background:#0F172A; border-radius:6px; font-family:'Segoe UI',sans-serif;">
  <rect x="0" y="0" width="780" height="24" fill="#1E293B" rx="6" ry="6"/>
  <circle cx="14" cy="12" r="4" fill="#EF4444"/>
  <circle cx="28" cy="12" r="4" fill="#F59E0B"/>
  <circle cx="42" cy="12" r="4" fill="#10B981"/>
  <text x="60" y="16" fill="#94A3B8" font-size="10" font-weight="bold">Cisco TAC Enterprise 5-Tier Systematic Triage Flowchart</text>
  <rect x="690" y="5" width="78" height="14" fill="#DC2626" rx="3"/>
  <text x="698" y="15" fill="#FFFFFF" font-size="8" font-weight="bold">TAC ENGINE</text>

  <!-- Step 1 -->
  <g transform="translate(30, 48)">
    <rect width="125" height="90" rx="4" fill="#1E293B" stroke="#EF4444" stroke-width="1.5"/>
    <text x="10" y="20" fill="#F87171" font-size="9" font-weight="bold">1. Physical (L1)</text>
    <text x="10" y="38" fill="#94A3B8" font-size="7.5">LED Link Amber/Off?</text>
    <text x="10" y="52" fill="#94A3B8" font-size="7.5">`show interfaces`</text>
    <text x="10" y="66" fill="#CBD5E1" font-size="7">Cable/SFP replacement</text>
    <text x="10" y="80" fill="#10B981" font-size="7">up / up verified</text>
  </g>
  <text x="165" y="98" fill="#64748B" font-size="14">→</text>

  <!-- Step 2 -->
  <g transform="translate(185, 48)">
    <rect width="125" height="90" rx="4" fill="#1E293B" stroke="#F59E0B" stroke-width="1.5"/>
    <text x="10" y="20" fill="#FBBF24" font-size="9" font-weight="bold">2. Data Link (L2)</text>
    <text x="10" y="38" fill="#94A3B8" font-size="7.5">Port Security err-disable?</text>
    <text x="10" y="52" fill="#94A3B8" font-size="7.5">Trunk / Native VLAN 99?</text>
    <text x="10" y="66" fill="#CBD5E1" font-size="7">`show mac address-table`</text>
    <text x="10" y="80" fill="#10B981" font-size="7">STP Forwarding active</text>
  </g>
  <text x="320" y="98" fill="#64748B" font-size="14">→</text>

  <!-- Step 3 -->
  <g transform="translate(340, 48)">
    <rect width="125" height="90" rx="4" fill="#1E293B" stroke="#3B82F6" stroke-width="1.5"/>
    <text x="10" y="20" fill="#60A5FA" font-size="9" font-weight="bold">3. Network (L3)</text>
    <text x="10" y="38" fill="#94A3B8" font-size="7.5">IP &amp; Mask correct?</text>
    <text x="10" y="52" fill="#94A3B8" font-size="7.5">`show ip route`</text>
    <text x="10" y="66" fill="#CBD5E1" font-size="7">LPM matching check</text>
    <text x="10" y="80" fill="#10B981" font-size="7">Default gateway ping</text>
  </g>
  <text x="475" y="98" fill="#64748B" font-size="14">→</text>

  <!-- Step 4 -->
  <g transform="translate(495, 48)">
    <rect width="125" height="90" rx="4" fill="#1E293B" stroke="#8B5CF6" stroke-width="1.5"/>
    <text x="10" y="20" fill="#A78BFA" font-size="9" font-weight="bold">4. Routing / OSPF</text>
    <text x="10" y="38" fill="#94A3B8" font-size="7.5">`show ip ospf neighbor`</text>
    <text x="10" y="52" fill="#94A3B8" font-size="7.5">MTU / Area mismatch?</text>
    <text x="10" y="66" fill="#CBD5E1" font-size="7">Hello/Dead timers</text>
    <text x="10" y="80" fill="#10B981" font-size="7">Full/DR adjacency</text>
  </g>
  <text x="630" y="98" fill="#64748B" font-size="14">→</text>

  <!-- Step 5 -->
  <g transform="translate(645, 48)">
    <rect width="115" height="90" rx="4" fill="#1E293B" stroke="#10B981" stroke-width="1.5"/>
    <text x="10" y="20" fill="#34D399" font-size="9" font-weight="bold">5. Policy (L4-L7)</text>
    <text x="10" y="38" fill="#94A3B8" font-size="7.5">ACL implicit deny?</text>
    <text x="10" y="52" fill="#94A3B8" font-size="7.5">`show ip nat trans`</text>
    <text x="10" y="66" fill="#CBD5E1" font-size="7">DNS resolution test</text>
    <text x="10" y="80" fill="#10B981" font-size="7">End-to-End Traffic OK</text>
  </g>

  <rect x="220" y="156" width="340" height="22" rx="4" fill="#1E293B" stroke="#334155" stroke-width="1"/>
  <text x="230" y="171" fill="#38BDF8" font-size="8.5" font-weight="bold">Systematic bottom-up triage eliminates 90% of escalated enterprise tickets</text>
</svg>'''

files = [
    ("lab11-etherchannel-topology.svg", svg11),
    ("lab12-ipv6-routing-topology.svg", svg12),
    ("lab13-gns3-enterprise-topology.svg", svg13),
    ("lab14-tac-troubleshooting-flowchart.svg", svg14),
]

for fname, content in files:
    fpath = os.path.join(OUT_DIR, fname)
    with open(fpath, "w", encoding="utf-8") as f:
        f.write(content.strip())
    print(f"[OK] Generated {fname}")

print("All 4 new topologies generated successfully!")
