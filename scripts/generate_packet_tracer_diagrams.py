# -*- coding: utf-8 -*-
"""
Generates 10 authentic Cisco Packet Tracer style SVG network topologies for the CCNA Lab Workbook.
"""
import os

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
CCNA_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301")
TOPOLOGY_DIR = os.path.join(CCNA_DIR, "07_SOURCE_FILES", "03_VISUAL_ASSETS", "packet-tracer-topologies")
os.makedirs(TOPOLOGY_DIR, exist_ok=True)

def make_svg(width=720, height=220, elements=""):
    return f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {width} {height}" width="100%" height="100%" style="background:#F8FAFC; border-radius:6px; font-family:'Segoe UI',Roboto,Helvetica,sans-serif;">
  <defs>
    <!-- Grid Pattern -->
    <pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse">
      <path d="M 20 0 L 0 0 0 20" fill="none" stroke="#E2E8F0" stroke-width="0.8"/>
    </pattern>
    <filter id="shadow" x="-5%" y="-5%" width="115%" height="115%">
      <feDropShadow dx="1" dy="2" stdDeviation="2" flood-color="#0F172A" flood-opacity="0.12"/>
    </filter>
  </defs>
  <rect width="{width}" height="{height}" fill="url(#grid)" rx="6"/>
  <!-- Status Bar / Packet Tracer Canvas Header -->
  <rect x="0" y="0" width="{width}" height="24" fill="#0F172A" rx="6 6 0 0"/>
  <circle cx="14" cy="12" r="4" fill="#EF4444"/>
  <circle cx="26" cy="12" r="4" fill="#F59E0B"/>
  <circle cx="38" cy="12" r="4" fill="#10B981"/>
  <text x="54" y="16" fill="#94A3B8" font-size="11" font-weight="600" font-family="monospace">Cisco Packet Tracer v8.2 · Real-Time Physical Workspace</text>
  <rect x="{width-110}" y="4" width="102" height="16" fill="#1E293B" rx="3"/>
  <text x="{width-104}" y="15" fill="#38BDF8" font-size="9.5" font-family="monospace">● Link Status: UP</text>
  {elements}
</svg>'''

# Router icon helper
def router(x, y, label="R1", model="Cisco 2911"):
    return f'''
    <g transform="translate({x},{y})" filter="url(#shadow)">
      <circle cx="35" cy="35" r="30" fill="#0284C7" stroke="#0369A1" stroke-width="2.5"/>
      <path d="M 20 35 L 50 35 M 35 20 L 35 50 M 23 23 L 47 47 M 23 47 L 47 23" stroke="#FFFFFF" stroke-width="2.5" stroke-linecap="round"/>
      <circle cx="35" cy="35" r="7" fill="#0284C7" stroke="#FFFFFF" stroke-width="2"/>
      <text x="35" y="77" text-anchor="middle" fill="#0F172A" font-size="11.5" font-weight="700">{label}</text>
      <text x="35" y="90" text-anchor="middle" fill="#64748B" font-size="9" font-family="monospace">{model}</text>
    </g>'''

# Switch icon helper
def switch(x, y, label="SW1", model="Catalyst 2960"):
    return f'''
    <g transform="translate({x},{y})" filter="url(#shadow)">
      <rect x="0" y="10" width="70" height="42" rx="5" fill="#0D9488" stroke="#0F766E" stroke-width="2.5"/>
      <path d="M 12 25 L 30 25 M 24 20 L 30 25 L 24 30" stroke="#FFFFFF" stroke-width="2" fill="none"/>
      <path d="M 58 25 L 40 25 M 46 20 L 40 25 L 46 30" stroke="#FFFFFF" stroke-width="2" fill="none"/>
      <path d="M 12 37 L 30 37 M 18 32 L 12 37 L 18 42" stroke="#FFFFFF" stroke-width="2" fill="none"/>
      <path d="M 58 37 L 40 37 M 52 32 L 58 37 L 52 42" stroke="#FFFFFF" stroke-width="2" fill="none"/>
      <text x="35" y="68" text-anchor="middle" fill="#0F172A" font-size="11.5" font-weight="700">{label}</text>
      <text x="35" y="81" text-anchor="middle" fill="#64748B" font-size="9" font-family="monospace">{model}</text>
    </g>'''

# PC / Workstation icon helper
def pc(x, y, label="PC1", ip="192.168.1.10"):
    return f'''
    <g transform="translate({x},{y})" filter="url(#shadow)">
      <rect x="5" y="5" width="50" height="34" rx="3" fill="#334155" stroke="#1E293B" stroke-width="2"/>
      <rect x="9" y="9" width="42" height="26" fill="#38BDF8"/>
      <polygon points="22,39 38,39 42,47 18,47" fill="#64748B"/>
      <rect x="12" y="47" width="36" height="3" rx="1" fill="#475569"/>
      <text x="30" y="64" text-anchor="middle" fill="#0F172A" font-size="11" font-weight="700">{label}</text>
      <text x="30" y="76" text-anchor="middle" fill="#0284C7" font-size="8.5" font-family="monospace">{ip}</text>
    </g>'''

# Cloud / Internet icon helper
def cloud(x, y, label="Internet ISP", ip="203.0.113.1"):
    return f'''
    <g transform="translate({x},{y})" filter="url(#shadow)">
      <path d="M 25 35 A 15 15 0 0 1 50 20 A 22 22 0 0 1 85 24 A 18 18 0 0 1 100 42 A 16 16 0 0 1 90 58 L 25 58 A 16 16 0 0 1 25 35 Z" fill="#E0F2FE" stroke="#0284C7" stroke-width="2.5"/>
      <text x="58" y="42" text-anchor="middle" fill="#0369A1" font-size="11" font-weight="700">{label}</text>
      <text x="58" y="53" text-anchor="middle" fill="#64748B" font-size="8.5" font-family="monospace">{ip}</text>
    </g>'''

# Link line helper
def link(x1, y1, x2, y2, color="#0F172A", style="", p1_lbl="", p2_lbl="", subnet=""):
    cx = (x1 + x2) / 2
    cy = (y1 + y2) / 2
    dash = 'stroke-dasharray="4,4"' if style == "dashed" else ('stroke-dasharray="8,4"' if style == "serial" else "")
    res = f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="{color}" stroke-width="2.5" {dash}/>'
    # Green triangle Packet Tracer indicators
    res += f'<polygon points="{x1+8},{y1-4} {x1+8},{y1+4} {x1+15},{y1}" fill="#10B981"/>'
    res += f'<polygon points="{x2-8},{y2-4} {x2-8},{y2+4} {x2-15},{y2}" fill="#10B981"/>'
    if p1_lbl:
        res += f'<text x="{x1+18}" y="{y1-6}" fill="#475569" font-size="9" font-weight="600" font-family="monospace">{p1_lbl}</text>'
    if p2_lbl:
        res += f'<text x="{x2-38}" y="{y2-6}" fill="#475569" font-size="9" font-weight="600" font-family="monospace">{p2_lbl}</text>'
    if subnet:
        res += f'<rect x="{cx-65}" y="{cy-18}" width="130" height="18" rx="4" fill="#FFFFFF" stroke="#CBD5E1" stroke-width="1"/>'
        res += f'<text x="{cx}" y="{cy-5}" text-anchor="middle" fill="#047857" font-size="9" font-weight="700" font-family="monospace">{subnet}</text>'
    return res

print("Generating 10 Lab Topology SVGs...")

# LAB 1: SSH Baseline Hardening
elem1 = f'''
  {link(140, 110, 480, 110, color="#2563EB", p1_lbl="Console / Gi0/1", p2_lbl="Gi0/0/0", subnet="192.168.1.0/24")}
  <!-- Console Cable (Light Blue) -->
  <path d="M 140 120 C 220 180, 400 180, 480 120" fill="none" stroke="#38BDF8" stroke-width="2" stroke-dasharray="6,3"/>
  <rect x="250" y="160" width="130" height="18" rx="4" fill="#F0F9FF" stroke="#38BDF8" stroke-width="1"/>
  <text x="315" y="173" text-anchor="middle" fill="#0284C7" font-size="9" font-weight="700">Rollover Console Cable</text>
  {pc(80, 75, "Admin-Laptop", "192.168.1.10/24")}
  {router(480, 75, "R1-EDGE-CORE", "Cisco 2911 (SSH v2)")}
'''
with open(os.path.join(TOPOLOGY_DIR, "lab01-ssh-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem1))

# LAB 2: Switch Port Security
elem2 = f'''
  {link(130, 75, 330, 110, color="#10B981", p1_lbl="NIC", p2_lbl="Fa0/1", subnet="Authorized MAC")}
  {link(130, 155, 330, 110, color="#EF4444", p1_lbl="NIC", p2_lbl="Fa0/2", subnet="Rogue Attacker")}
  {pc(70, 45, "PC-1 (Authorized)", "MAC: 0011.2233.4455")}
  {pc(70, 125, "Hacker-Laptop", "MAC: DEAD.BEEF.CAFE")}
  {switch(330, 80, "SW1-ACCESS", "Catalyst 2960 (PortSec)")}
  <!-- Err-disabled callout -->
  <rect x="440" y="90" width="160" height="42" rx="4" fill="#FEF2F2" stroke="#EF4444" stroke-width="1.5"/>
  <text x="450" y="106" fill="#B91C1C" font-size="9.5" font-weight="700">● Violation: SHUTDOWN</text>
  <text x="450" y="122" fill="#7F1D1D" font-size="8.5" font-family="monospace">Fa0/2 -> err-disabled (Amber)</text>
'''
with open(os.path.join(TOPOLOGY_DIR, "lab02-port-security-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem2))

# LAB 3: VLANs & Trunking
elem3 = f'''
  {link(90, 70, 220, 100, color="#059669", p1_lbl="Fa0/1", p2_lbl="Fa0/10", subnet="VLAN 10 (Sales)")}
  {link(90, 150, 220, 100, color="#2563EB", p1_lbl="Fa0/1", p2_lbl="Fa0/20", subnet="VLAN 20 (Eng)")}
  {link(290, 100, 470, 100, color="#7C3AED", p1_lbl="Gi0/1", p2_lbl="Gi0/1", subnet="802.1Q TRUNK (Native 999)")}
  {link(540, 100, 630, 100, color="#059669", p1_lbl="Fa0/10", p2_lbl="NIC", subnet="VLAN 10")}
  {pc(30, 45, "PC-Sales-1", "192.168.10.10")}
  {pc(30, 125, "PC-Eng-1", "192.168.20.10")}
  {switch(220, 75, "SW1-CORE", "Catalyst 2960")}
  {switch(470, 75, "SW2-ACCESS", "Catalyst 2960")}
  {pc(630, 75, "PC-Sales-2", "192.168.10.11")}
'''
with open(os.path.join(TOPOLOGY_DIR, "lab03-vlan-trunking-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem3))

# LAB 4: Router-on-a-Stick
elem4 = f'''
  {link(130, 65, 300, 100, color="#059669", p1_lbl="Fa0/1", p2_lbl="Fa0/10", subnet="VLAN 10 (Sales)")}
  {link(130, 145, 300, 100, color="#2563EB", p1_lbl="Fa0/1", p2_lbl="Fa0/20", subnet="VLAN 20 (Eng)")}
  {link(370, 100, 520, 100, color="#7C3AED", p1_lbl="Gi0/1", p2_lbl="Gi0/0/0", subnet="802.1Q ROAS Trunk")}
  {pc(70, 40, "PC-Sales", "192.168.10.50/24")}
  {pc(70, 120, "PC-Eng", "192.168.20.50/24")}
  {switch(300, 75, "SW1-2960", "Access Switch")}
  {router(520, 70, "R1-ROAS", "Cisco 2911 Router")}
  <!-- Subinterface callout -->
  <rect x="530" y="160" width="165" height="42" rx="4" fill="#F8FAFC" stroke="#0284C7" stroke-width="1"/>
  <text x="540" y="176" fill="#0369A1" font-size="8.5" font-family="monospace">g0/0/0.10: 192.168.10.1 (V10)</text>
  <text x="540" y="192" fill="#0369A1" font-size="8.5" font-family="monospace">g0/0/0.20: 192.168.20.1 (V20)</text>
'''
with open(os.path.join(TOPOLOGY_DIR, "lab04-roas-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem4))

# LAB 5: Spanning Tree
elem5 = f'''
  {link(340, 60, 180, 145, color="#10B981", p1_lbl="Gi0/1", p2_lbl="Gi0/1", subnet="FWD (Cost 4)")}
  {link(380, 60, 540, 145, color="#10B981", p1_lbl="Gi0/2", p2_lbl="Gi0/1", subnet="FWD (Cost 4)")}
  {link(210, 160, 510, 160, color="#F59E0B", style="dashed", p1_lbl="Gi0/2 FWD", p2_lbl="Gi0/2 BLK", subnet="STP BLOCKED LINK")}
  {switch(325, 30, "SW1 (Root Bridge)", "Priority: 4096")}
  {switch(150, 125, "SW2 (Designated)", "Priority: 32768")}
  {switch(500, 125, "SW3 (Blocking)", "Priority: 32768")}
  <!-- Amber block dot on SW3 Gi0/2 -->
  <circle cx="510" cy="160" r="5" fill="#EF4444"/>
'''
with open(os.path.join(TOPOLOGY_DIR, "lab05-stp-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem5))

# LAB 6: Static & Floating Routes
elem6 = f'''
  {link(130, 100, 310, 100, color="#2563EB", p1_lbl="Gi0/0/1", p2_lbl="Gi0/0/1", subnet="Primary Fiber (AD 1)")}
  <path d="M 130 115 C 220 180, 220 180, 310 115" fill="none" stroke="#F59E0B" stroke-width="2.5" stroke-dasharray="6,4"/>
  <rect x="160" y="150" width="130" height="18" rx="4" fill="#FFFBEB" stroke="#F59E0B" stroke-width="1"/>
  <text x="225" y="163" text-anchor="middle" fill="#B45309" font-size="9" font-weight="700">Floating Backup (AD 10)</text>
  {link(380, 100, 520, 100, color="#059669", p1_lbl="Gi0/0/0", p2_lbl="WAN", subnet="Default 0.0.0.0/0")}
  {router(70, 70, "HQ-RTR", "10.1.1.1/30")}
  {router(310, 70, "Branch-RTR", "10.1.1.2/30")}
  {cloud(520, 75, "Internet ISP", "203.0.113.1")}
'''
with open(os.path.join(TOPOLOGY_DIR, "lab06-routing-failover-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem6))

# LAB 7: OSPFv2 Dynamic Routing
elem7 = f'''
  {link(130, 100, 290, 100, color="#10B981", p1_lbl="Gi0/0/1", p2_lbl="Gi0/0/1", subnet="10.0.0.0/30 (Cost 10)")}
  {link(350, 100, 510, 100, color="#10B981", p1_lbl="Gi0/0/2", p2_lbl="Gi0/0/1", subnet="10.0.0.4/30 (Cost 10)")}
  {link(100, 135, 100, 160, color="#64748B", style="dashed", p1_lbl="g0/0/0", p2_lbl="", subnet="")}
  <rect x="35" y="165" width="130" height="22" rx="4" fill="#F1F5F9" stroke="#94A3B8" stroke-width="1"/>
  <text x="100" y="180" text-anchor="middle" fill="#475569" font-size="9" font-weight="700">Passive LAN 192.168.10.0</text>
  {router(70, 70, "R1 (RID 1.1.1.1)", "Area 0 Backbone")}
  {router(290, 70, "R2 (DR 2.2.2.2)", "Area 0 Backbone")}
  {router(510, 70, "R3 (BDR 3.3.3.3)", "Area 0 Backbone")}
'''
with open(os.path.join(TOPOLOGY_DIR, "lab07-ospf-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem7))

# LAB 8: DHCP Server & Relay
elem8 = f'''
  {link(120, 100, 270, 100, color="#3B82F6", p1_lbl="NIC", p2_lbl="Gi0/0/0", subnet="DHCPDISCOVER (Broadcast)")}
  {link(340, 100, 500, 100, color="#10B981", p1_lbl="Gi0/0/1", p2_lbl="Gi0/0/0", subnet="ip helper-address (Unicast)")}
  {pc(60, 70, "Client PC", "DHCP Client")}
  {router(270, 70, "Branch-RTR", "Relay Agent")}
  {router(500, 70, "HQ-DHCP-SRV", "Pool: 192.168.30.0/24")}
'''
with open(os.path.join(TOPOLOGY_DIR, "lab08-dhcp-relay-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem8))

# LAB 9: PAT (NAT Overload)
elem9 = f'''
  {link(120, 100, 290, 100, color="#10B981", p1_lbl="Fa0/1", p2_lbl="Gi0/0/0 (inside)", subnet="Inside Local: 192.168.10.50")}
  {link(360, 100, 520, 100, color="#2563EB", p1_lbl="Gi0/0/1 (outside)", p2_lbl="Internet", subnet="Inside Global: 203.0.113.1:10523")}
  {pc(60, 70, "Private PC", "192.168.10.50")}
  {router(290, 70, "Edge-RTR", "PAT Overload")}
  {cloud(520, 70, "Public Web Server", "142.250.190.46:443")}
'''
with open(os.path.join(TOPOLOGY_DIR, "lab09-pat-nat-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem9))

# LAB 10: Extended ACLs
elem10 = f'''
  {link(90, 65, 250, 100, color="#EF4444", p1_lbl="NIC", p2_lbl="Gi0/0.50", subnet="Guest VLAN 50 (DENIED HTTP/S)")}
  {link(90, 145, 250, 100, color="#10B981", p1_lbl="NIC", p2_lbl="Gi0/0.10", subnet="Staff VLAN 10 (PERMITTED)")}
  {link(320, 100, 500, 100, color="#2563EB", p1_lbl="Gi0/0/1", p2_lbl="NIC", subnet="Corporate Server Farm")}
  {pc(30, 40, "Guest Laptop", "192.168.50.15")}
  {pc(30, 120, "Staff Workstation", "192.168.10.15")}
  {router(250, 70, "R1-BORDER", "ACL 105 Applied IN")}
  <!-- Server box -->
  <g transform="translate(500, 65)" filter="url(#shadow)">
    <rect x="0" y="0" width="70" height="50" rx="4" fill="#1E293B" stroke="#0EA5E9" stroke-width="2"/>
    <line x1="10" y1="12" x2="60" y2="12" stroke="#38BDF8" stroke-width="2"/>
    <line x1="10" y1="24" x2="60" y2="24" stroke="#38BDF8" stroke-width="2"/>
    <line x1="10" y1="36" x2="60" y2="36" stroke="#38BDF8" stroke-width="2"/>
    <circle cx="58" cy="12" r="2" fill="#10B981"/>
    <circle cx="58" cy="24" r="2" fill="#10B981"/>
    <text x="35" y="65" text-anchor="middle" fill="#0F172A" font-size="10.5" font-weight="700">Corp Server</text>
    <text x="35" y="78" text-anchor="middle" fill="#0284C7" font-size="8.5" font-family="monospace">10.1.1.100</text>
  </g>
'''
with open(os.path.join(TOPOLOGY_DIR, "lab10-extended-acl-topology.svg"), "w", encoding="utf-8") as f:
    f.write(make_svg(elements=elem10))

print("[SUCCESS] All 10 SVG topology diagrams generated successfully in:", TOPOLOGY_DIR)
