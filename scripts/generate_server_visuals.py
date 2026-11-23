import os
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

output_dir = r"DIGITAL\WINDOWS_SERVER_2025\02_BRAND_ASSETS\screenshots"
os.makedirs(output_dir, exist_ok=True)

# Set global aesthetic
plt.rcParams['font.sans-serif'] = 'DejaVu Sans'
plt.rcParams['axes.edgecolor'] = '#CBD5E1'

# -----------------------------------------------------------------------------
# 1. CLIENT-SERVER ARCHITECTURE INFOGRAPHIC
# -----------------------------------------------------------------------------
def create_client_server_architecture():
    fig, ax = plt.subplots(figsize=(10, 5), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')
    
    # Title
    ax.text(5, 4.6, "Client-Server Enterprise Network Architecture", ha='center', va='center', 
            fontsize=15, weight='bold', color='#0F172A')
    ax.text(5, 4.3, "RTechLab Systems Engineering · Centralized Authentication & Resource Management", 
            ha='center', va='center', fontsize=9, color='#0284C7', weight='bold')

    # Draw Clients on the Left
    clients = [
        ("Client 01\nWin 11 Pro\n(192.168.1.101)", 3.4),
        ("Client 02\nWin 10 Ent\n(192.168.1.102)", 2.4),
        ("Client 03\nBilling Dept\n(192.168.1.103)", 1.4),
        ("Client 04\nMac / Mobile\n(192.168.1.104)", 0.4),
    ]
    
    for label, y in clients:
        box = patches.FancyBboxPatch((0.5, y - 0.35), 2.0, 0.7, boxstyle="round,pad=0.08", 
                                     fc='#FFFFFF', ec='#0284C7', lw=1.5)
        ax.add_patch(box)
        ax.text(1.5, y, label, ha='center', va='center', fontsize=7.5, weight='bold', color='#1E293B')
        
    # Draw Switch in the Center
    switch_box = patches.FancyBboxPatch((3.7, 1.2), 2.2, 1.8, boxstyle="round,pad=0.1", 
                                        fc='#0F172A', ec='#38BDF8', lw=2)
    ax.add_patch(switch_box)
    ax.text(4.8, 2.5, "CORE GIGABIT\nENTERPRISE SWITCH", ha='center', va='center', 
            fontsize=9.5, weight='black', color='#38BDF8')
    ax.text(4.8, 1.7, "Layer 2/3 Switching\nVLANs & Trunking\n10 Gbps Uplinks", ha='center', va='center', 
            fontsize=7.5, color='#94A3B8')

    # Draw Server on the Right
    server_box = patches.FancyBboxPatch((7.0, 0.6), 2.6, 3.2, boxstyle="round,pad=0.12", 
                                        fc='#0284C7', ec='#0369A1', lw=2.5)
    ax.add_patch(server_box)
    ax.text(8.3, 3.4, "MICROSOFT\nWINDOWS SERVER 2025", ha='center', va='center', 
            fontsize=10.5, weight='black', color='#FFFFFF')
    
    services = [
        "[AD DS] Active Directory Identity",
        "[GPO] Group Policy Security",
        "[DNS/DHCP] Network Automation",
        "[SMB] Enterprise File Server",
        "[SEC] Kerberos & NTLM Auth",
        "[CLOUD] Azure Arc Hybrid Connected"
    ]
    for i, s in enumerate(services):
        s_box = patches.FancyBboxPatch((7.15, 2.6 - i*0.36), 2.3, 0.28, boxstyle="round,pad=0.04", 
                                       fc='#FFFFFF', ec='#E2E8F0', lw=0.8)
        ax.add_patch(s_box)
        ax.text(8.3, 2.74 - i*0.36, s, ha='center', va='center', fontsize=7, weight='bold', color='#0F172A')

    # Draw Connection Arrows
    for _, y in clients:
        ax.annotate("", xy=(3.7, 2.1), xytext=(2.5, y),
                    arrowprops=dict(arrowstyle="<->", color='#0284C7', lw=1.2, ls='--'))
        
    ax.annotate("", xy=(7.0, 2.1), xytext=(5.9, 2.1),
                arrowprops=dict(arrowstyle="<->", color='#059669', lw=2.5))
    ax.text(6.45, 2.3, "10G Fiber", ha='center', va='center', fontsize=7.5, weight='bold', color='#059669')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 5)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "client_server_architecture.png"), dpi=300)
    plt.close()
    print("Generated client_server_architecture.png")

# -----------------------------------------------------------------------------
# 2. TYPES OF ENTERPRISE SERVERS INFOGRAPHIC
# -----------------------------------------------------------------------------
def create_types_of_servers():
    fig, ax = plt.subplots(figsize=(10, 5.8), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 5.4, "8 Essential Types of Enterprise Servers", ha='center', va='center', 
            fontsize=15, weight='bold', color='#0F172A')
    ax.text(5, 5.05, "Core Server Roles & IANA Default Ports Operating in Global Corporate Networks", 
            ha='center', va='center', fontsize=9, color='#0284C7', weight='bold')

    roles = [
        ("DOMAIN CONTROLLER", "AD DS, Kerberos, LDAP\nUser & Computer Identity", "Port 88, 389", "#0284C7"),
        ("WEB SERVER (IIS)", "Hosts Corporate Portals\nASP.NET & Web Apps", "Port 80, 443", "#0E7490"),
        ("FILE & STORAGE SERVER", "NTFS Shared Folders\nQuotas & File Screening", "Port 445 (SMB)", "#059669"),
        ("DATABASE SERVER", "MS SQL Server / MySQL\nTransactional Storage", "Port 1433, 3306", "#7C3AED"),
        ("DNS SERVER", "Resolves Names to IPs\nForward & Reverse Lookup", "Port 53 (UDP/TCP)", "#2563EB"),
        ("DHCP SERVER", "Automatic IP Leases\nDORA Process & Failover", "UDP 67, 68", "#D97706"),
        ("MAIL SERVER", "Exchange Server / SMTP\nEmail Routing & Mailboxes", "Port 25, 587, 993", "#EA580C"),
        ("PROXY & FIREWALL", "Traffic Filter, Security\nContent Inspection & VPN", "Port 8080, 443", "#DC2626"),
    ]

    for idx, (title, desc, port, color) in enumerate(roles):
        row = idx // 4
        col = idx % 4
        x = 0.5 + col * 2.35
        y = 3.3 - row * 1.8

        box = patches.FancyBboxPatch((x, y), 2.15, 1.5, boxstyle="round,pad=0.08", 
                                     fc='#FFFFFF', ec=color, lw=1.8)
        ax.add_patch(box)

        # Header tag
        tag = patches.FancyBboxPatch((x, y + 1.15), 2.15, 0.35, boxstyle="round,pad=0.04", 
                                     fc=color, ec=color)
        ax.add_patch(tag)
        ax.text(x + 1.075, y + 1.32, title, ha='center', va='center', fontsize=8, weight='bold', color='#FFFFFF')

        # Desc
        ax.text(x + 1.075, y + 0.65, desc, ha='center', va='center', fontsize=7.2, color='#334155', linespacing=1.3)

        # Port badge
        p_box = patches.FancyBboxPatch((x + 0.2, y + 0.12), 1.75, 0.28, boxstyle="round,pad=0.03", 
                                       fc='#F1F5F9', ec='#CBD5E1', lw=0.8)
        ax.add_patch(p_box)
        ax.text(x + 1.075, y + 0.26, port, ha='center', va='center', fontsize=7.2, weight='bold', color=color)

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 5.8)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "types_of_servers_infographic.png"), dpi=300)
    plt.close()
    print("Generated types_of_servers_infographic.png")

# -----------------------------------------------------------------------------
# 3. WINDOWS SERVER EVOLUTION TIMELINE (1993 TO 2025)
# -----------------------------------------------------------------------------
def create_server_evolution_timeline():
    fig, ax = plt.subplots(figsize=(10, 5.2), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.8, "The Complete Evolution of Microsoft Windows Server", ha='center', va='center', 
            fontsize=15, weight='bold', color='#0F172A')
    ax.text(5, 4.45, "32 Years of Enterprise Operating System Innovation (1993 – 2025)", 
            ha='center', va='center', fontsize=9, color='#0284C7', weight='bold')

    # Main timeline axis
    ax.plot([0.6, 9.4], [2.5, 2.5], color='#94A3B8', lw=3, zorder=1)

    milestones = [
        ("1993", "Windows NT 3.1", "First 32-bit OS\nSecurity Subsystem", 0.9, True),
        ("1996", "Windows NT 4.0", "Win 95 Explorer GUI\nDomain Architecture", 1.8, False),
        ("2000", "Server 2000", "Birth of Active Directory\nDNS & Group Policy", 2.7, True),
        ("2003", "Server 2003", "Server 2003 R2, VSS\n.NET Framework Engine", 3.6, False),
        ("2008", "Server 2008", "Birth of Hyper-V\nServer Core (No GUI)", 4.5, True),
        ("2012", "Server 2012", "Modern Server Manager\nStorage Spaces, SMB 3.0", 5.4, False),
        ("2016", "Server 2016", "Windows Containers\nNano Server, ReFS", 6.3, True),
        ("2019", "Server 2019", "Windows Admin Center\nHybrid Cloud Gateway", 7.2, False),
        ("2022", "Server 2022", "Secured-Core Server\nTLS 1.3, QUIC Protocol", 8.1, True),
        ("2025", "Server 2025", "Hotpatching for All\n32KB AD DB, Azure Arc", 9.0, False),
    ]

    for year, name, highlight, x, is_top in milestones:
        # Dot on timeline
        color = '#0284C7' if year in ['2000', '2008', '2025'] else '#475569'
        size = 80 if year in ['2000', '2008', '2025'] else 40
        ax.scatter(x, 2.5, s=size, color=color, zorder=3, edgecolors='#FFFFFF', linewidths=1.5)

        y_box = 2.85 if is_top else 0.85
        y_line_end = 2.85 if is_top else 2.15
        
        # Guide line
        ax.plot([x, x], [2.5, y_line_end], color='#CBD5E1', lw=1, ls=':')

        box_color = '#0284C7' if year == '2025' else ('#059669' if year in ['2000', '2008'] else '#FFFFFF')
        text_color = '#FFFFFF' if year in ['2025', '2000', '2008'] else '#0F172A'
        border_color = '#0369A1' if year == '2025' else ('#047857' if year in ['2000', '2008'] else '#CBD5E1')

        box = patches.FancyBboxPatch((x - 0.42, y_box), 0.84, 1.25, boxstyle="round,pad=0.04", 
                                     fc=box_color, ec=border_color, lw=1.2)
        ax.add_patch(box)

        ax.text(x, y_box + 1.05, year, ha='center', va='center', fontsize=8, weight='black', color=text_color)
        ax.text(x, y_box + 0.72, name, ha='center', va='center', fontsize=6.8, weight='bold', color=text_color)
        sub_text_color = '#E0F2FE' if year in ['2025', '2000', '2008'] else '#64748B'
        ax.text(x, y_box + 0.32, highlight, ha='center', va='center', fontsize=5.8, color=sub_text_color, linespacing=1.2)

    ax.set_xlim(0.2, 9.8)
    ax.set_ylim(0.4, 5.2)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "server_evolution_timeline.png"), dpi=300)
    plt.close()
    print("Generated server_evolution_timeline.png")

# -----------------------------------------------------------------------------
# 4. PHYSICAL VS VIRTUAL VS AZURE CLOUD COMPARISON
# -----------------------------------------------------------------------------
def create_physical_virtual_cloud():
    fig, ax = plt.subplots(figsize=(10, 4.8), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.4, "Physical Bare-Metal vs Virtual Machine vs Azure Cloud", ha='center', va='center', 
            fontsize=15, weight='bold', color='#0F172A')
    ax.text(5, 4.05, "The 3 Deployment Models for Microsoft Windows Server 2025", 
            ha='center', va='center', fontsize=9, color='#0284C7', weight='bold')

    models = [
        ("1. PHYSICAL (BARE-METAL)", [
            "Hardware: Dell PowerEdge / HP Rack",
            "Operating System directly on Silicon",
            "Highest Performance, Zero Hypervisor Tax",
            "Single Point of Failure per Machine",
            "Slow Disaster Recovery (Hours/Days)",
            "Best For: Massive SQL DBs & Hyper-V Hosts"
        ], "#0F172A", 0.6),
        ("2. VIRTUAL MACHINE (HYPER-V)", [
            "Hardware runs Type-1 Hypervisor",
            "Multiple Virtual Machines on 1 Server",
            "Live Migration & Instant VM Snapshots",
            "Hardware utilization 80%+ (Cost Saver)",
            "Failover Cluster High Availability",
            "Best For: Standard Enterprise DCs & Apps"
        ], "#0284C7", 3.8),
        ("3. AZURE & HYBRID CLOUD", [
            "Azure Virtual Machines (IaaS Cloud)",
            "Azure Arc: Manage On-Prem Server via Cloud",
            "Hotpatching: Zero-Reboot Security Updates",
            "Auto-scaling & Geo-Redundant Backups",
            "Pay-As-You-Go Monthly Billing",
            "Best For: Modern Cloud & Hybrid IT"
        ], "#059669", 7.0),
    ]

    for title, points, color, x in models:
        box = patches.FancyBboxPatch((x, 0.4), 2.6, 3.3, boxstyle="round,pad=0.08", 
                                     fc='#FFFFFF', ec=color, lw=2)
        ax.add_patch(box)

        # Header tag
        tag = patches.FancyBboxPatch((x, 3.25), 2.6, 0.45, boxstyle="round,pad=0.04", 
                                     fc=color, ec=color)
        ax.add_patch(tag)
        ax.text(x + 1.3, 3.48, title, ha='center', va='center', fontsize=8.5, weight='bold', color='#FFFFFF')

        # Points
        for idx, pt in enumerate(points):
            y_pt = 2.9 - idx * 0.45
            bullet = patches.Circle((x + 0.18, y_pt + 0.04), 0.04, color=color)
            ax.add_patch(bullet)
            ax.text(x + 0.3, y_pt + 0.04, pt, ha='left', va='center', fontsize=7.2, color='#1E293B', linespacing=1.2)

    ax.set_xlim(0, 10.2)
    ax.set_ylim(0, 4.8)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "physical_virtual_cloud_comparison.png"), dpi=300)
    plt.close()
    print("Generated physical_virtual_cloud_comparison.png")

# -----------------------------------------------------------------------------
# 5. WINDOWS CLIENT (WIN 11) VS SERVER 2025 ARCHITECTURE
# -----------------------------------------------------------------------------
def create_client_vs_server():
    fig, ax = plt.subplots(figsize=(10, 4.8), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.4, "Architectural Comparison: Windows 11 Pro vs Windows Server 2025", ha='center', va='center', 
            fontsize=15, weight='bold', color='#0F172A')
    ax.text(5, 4.05, "Why Workstations Cannot Replace Enterprise Servers in Production", 
            ha='center', va='center', fontsize=9, color='#0284C7', weight='bold')

    headers = ["Feature Metric", "Windows 11 Pro (Client OS)", "Windows Server 2025 (Server OS)"]
    table_data = [
        ("Primary Goal", "Single User Productivity, Apps, Gaming", "Multi-User 24/7 Network Services & Storage"),
        ("Max RAM Support", "Up to 2 TB RAM (Physical Limit)", "Up to 24 TB RAM (Extreme Virtualization Scale)"),
        ("CPU Sockets", "Max 2 Physical CPU Sockets", "Up to 64 Physical CPU Sockets"),
        ("Max Logical Cores", "Max 128 / 256 Processor Threads", "Up to 2,048 Logical Processor Cores"),
        ("Inbound Connections", "Hard-Coded Limit: Max 20 Devices", "Unlimited Concurrent Network Connections"),
        ("OS Scheduling Mode", "Foreground UI Apps Priority (Smoothness)", "Background Services & Network Packet Priority"),
        ("Active Directory", "Client Only (Can only JOIN domain)", "Can HOST Active Directory (Domain Controller)"),
        ("Reboot Tolerance", "Monthly Mandatory Reboots for Updates", "Hotpatching Engine (Zero-Reboot Patching)")
    ]

    # Draw table header
    h_box1 = patches.FancyBboxPatch((0.5, 3.4), 2.5, 0.4, boxstyle="round,pad=0.03", fc='#0F172A', ec='#0F172A')
    h_box2 = patches.FancyBboxPatch((3.1, 3.4), 3.1, 0.4, boxstyle="round,pad=0.03", fc='#475569', ec='#475569')
    h_box3 = patches.FancyBboxPatch((6.3, 3.4), 3.2, 0.4, boxstyle="round,pad=0.03", fc='#0284C7', ec='#0284C7')
    ax.add_patch(h_box1)
    ax.add_patch(h_box2)
    ax.add_patch(h_box3)
    ax.text(1.75, 3.6, headers[0], ha='center', va='center', fontsize=8, weight='bold', color='#FFFFFF')
    ax.text(4.65, 3.6, headers[1], ha='center', va='center', fontsize=8, weight='bold', color='#FFFFFF')
    ax.text(7.9, 3.6, headers[2], ha='center', va='center', fontsize=8, weight='bold', color='#FFFFFF')

    for idx, (col1, col2, col3) in enumerate(table_data):
        y = 3.0 - idx * 0.35
        bg_col = '#FFFFFF' if idx % 2 == 0 else '#F1F5F9'

        r_box = patches.FancyBboxPatch((0.5, y - 0.05), 9.0, 0.32, boxstyle="square,pad=0", fc=bg_col, ec='#E2E8F0', lw=0.6)
        ax.add_patch(r_box)

        ax.text(0.7, y + 0.1, col1, ha='left', va='center', fontsize=7.2, weight='bold', color='#0F172A')
        ax.text(3.3, y + 0.1, col2, ha='left', va='center', fontsize=7.0, color='#475569')
        ax.text(6.5, y + 0.1, col3, ha='left', va='center', fontsize=7.0, weight='bold', color='#0369A1')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.8)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "windows_client_vs_server_architecture.png"), dpi=300)
    plt.close()
    print("Generated windows_client_vs_server_architecture.png")

if __name__ == "__main__":
    create_client_server_architecture()
    create_types_of_servers()
    create_server_evolution_timeline()
    create_physical_virtual_cloud()
    create_client_vs_server()
    print("All Chapter 1 architectural diagrams generated successfully!")
