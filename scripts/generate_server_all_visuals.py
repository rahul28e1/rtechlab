import os
import matplotlib.pyplot as plt
import matplotlib.patches as patches

output_dir = r"DIGITAL\WINDOWS_SERVER_2025\02_BRAND_ASSETS\screenshots"
os.makedirs(output_dir, exist_ok=True)

plt.rcParams['font.sans-serif'] = 'DejaVu Sans'
plt.rcParams['axes.edgecolor'] = '#CBD5E1'

# -----------------------------------------------------------------------------
# 6. ACTIVE DIRECTORY HIERARCHY (FOREST, TREE, DOMAIN, OU)
# -----------------------------------------------------------------------------
def create_ad_hierarchy():
    fig, ax = plt.subplots(figsize=(10, 5), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.6, "Active Directory Logical Architecture: Forest, Domain & OU Structure", 
            ha='center', va='center', fontsize=14, weight='bold', color='#0F172A')
    ax.text(5, 4.25, "RTechLab Systems Architecture · Scalable Identity & Administrative Boundaries", 
            ha='center', va='center', fontsize=8.5, color='#0284C7', weight='bold')

    # Forest Outer Box
    forest_box = patches.FancyBboxPatch((0.5, 0.4), 9.0, 3.6, boxstyle="round,pad=0.08", 
                                        fc='#FFFFFF', ec='#0284C7', lw=2, ls='--')
    ax.add_patch(forest_box)
    ax.text(1.8, 3.75, "FOREST: rtechlab.corp (Root Forest Boundary)", ha='center', va='center', 
            fontsize=8.5, weight='bold', color='#0284C7')

    # Root Domain (Triangle or Pentagon style box)
    root_domain = patches.FancyBboxPatch((0.9, 0.7), 4.1, 2.7, boxstyle="round,pad=0.08", 
                                         fc='#F0F9FF', ec='#0284C7', lw=1.5)
    ax.add_patch(root_domain)
    ax.text(2.95, 3.15, "ROOT DOMAIN: rtechlab.corp (PDC / Schema)", ha='center', va='center', 
            fontsize=8.5, weight='bold', color='#0F172A')

    # Child Domain
    child_domain = patches.FancyBboxPatch((5.3, 0.7), 3.9, 2.7, boxstyle="round,pad=0.08", 
                                          fc='#F0FDF4', ec='#059669', lw=1.5)
    ax.add_patch(child_domain)
    ax.text(7.25, 3.15, "CHILD DOMAIN: india.rtechlab.corp", ha='center', va='center', 
            fontsize=8.5, weight='bold', color='#0F172A')

    # Trust Relationship Arrow
    ax.annotate("", xy=(5.3, 2.05), xytext=(5.0, 2.05),
                arrowprops=dict(arrowstyle="<->", color='#D97706', lw=2.5))
    ax.text(5.15, 2.3, "Two-Way\nTransitive Trust", ha='center', va='center', fontsize=6.5, weight='bold', color='#D97706')

    # OUs inside Root Domain
    ous_root = [
        ("OU: Corporate HR", "Users, Payroll Policy", 1.2, 2.1),
        ("OU: IT Admins", "Server Admins & Tier-1", 1.2, 1.1),
        ("OU: Workstations", "Laptops & GPO Lockdowns", 3.0, 2.1),
        ("OU: Domain Servers", "Exchange, SQL, Web", 3.0, 1.1),
    ]
    for name, desc, ox, oy in ous_root:
        ou_box = patches.FancyBboxPatch((ox, oy - 0.3), 1.7, 0.65, boxstyle="round,pad=0.04", 
                                        fc='#FFFFFF', ec='#94A3B8', lw=1)
        ax.add_patch(ou_box)
        ax.text(ox + 0.85, oy + 0.12, name, ha='center', va='center', fontsize=7, weight='bold', color='#0F172A')
        ax.text(ox + 0.85, oy - 0.12, desc, ha='center', va='center', fontsize=5.8, color='#64748B')

    # OUs inside Child Domain
    ous_child = [
        ("OU: Branch Users", "Regional Employees", 5.5, 2.1),
        ("OU: Branch Devices", "Local PC Asset Policy", 5.5, 1.1),
        ("OU: Branch DC", "RODC (Read-Only DC)", 7.3, 2.1),
        ("OU: Retail POS", "Kiosk Lockdown GPO", 7.3, 1.1),
    ]
    for name, desc, ox, oy in ous_child:
        ou_box = patches.FancyBboxPatch((ox, oy - 0.3), 1.7, 0.65, boxstyle="round,pad=0.04", 
                                        fc='#FFFFFF', ec='#94A3B8', lw=1)
        ax.add_patch(ou_box)
        ax.text(ox + 0.85, oy + 0.12, name, ha='center', va='center', fontsize=7, weight='bold', color='#0F172A')
        ax.text(ox + 0.85, oy - 0.12, desc, ha='center', va='center', fontsize=5.8, color='#64748B')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 5)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "ad_hierarchy_architecture.png"), dpi=300)
    plt.close()
    print("Generated ad_hierarchy_architecture.png")

# -----------------------------------------------------------------------------
# 7. FSMO 5 ROLES TOPOLOGY INFOGRAPHIC
# -----------------------------------------------------------------------------
def create_fsmo_roles():
    fig, ax = plt.subplots(figsize=(10, 5), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.6, "Active Directory FSMO (Flexible Single Master Operation) Roles", 
            ha='center', va='center', fontsize=14, weight='bold', color='#0F172A')
    ax.text(5, 4.25, "Top MNC Placement Interview Concept · Forest-Wide (2) vs Domain-Wide (3) Roles", 
            ha='center', va='center', fontsize=8.5, color='#0284C7', weight='bold')

    # Forest-Wide Box (Left)
    fw_box = patches.FancyBboxPatch((0.5, 0.4), 4.2, 3.6, boxstyle="round,pad=0.08", 
                                    fc='#F0F9FF', ec='#0284C7', lw=1.8)
    ax.add_patch(fw_box)
    ax.text(2.6, 3.7, "FOREST-WIDE ROLES (Only 1 per Forest)", ha='center', va='center', 
            fontsize=8.5, weight='black', color='#0369A1')

    roles_fw = [
        ("1. Schema Master", "Controls the Active Directory Master Schema blueprint (Classes & Attributes). Modification requires Schema Admins group rights."),
        ("2. Domain Naming Master", "Controls the addition or removal of domains and application directory partitions in the forest.")
    ]
    for idx, (title, desc) in enumerate(roles_fw):
        y = 2.5 - idx * 1.3
        r_box = patches.FancyBboxPatch((0.8, y), 3.6, 1.0, boxstyle="round,pad=0.04", fc='#FFFFFF', ec='#BAE6FD', lw=1)
        ax.add_patch(r_box)
        ax.text(2.6, y + 0.78, title, ha='center', va='center', fontsize=8, weight='bold', color='#0F172A')
        ax.text(2.6, y + 0.38, desc, ha='center', va='center', fontsize=6.8, color='#334155', linespacing=1.3)

    # Domain-Wide Box (Right)
    dw_box = patches.FancyBboxPatch((5.3, 0.4), 4.2, 3.6, boxstyle="round,pad=0.08", 
                                    fc='#F0FDF4', ec='#059669', lw=1.8)
    ax.add_patch(dw_box)
    ax.text(7.4, 3.7, "DOMAIN-WIDE ROLES (1 per Domain)", ha='center', va='center', 
            fontsize=8.5, weight='black', color='#047857')

    roles_dw = [
        ("3. PDC Emulator", "Master time sync (NTP), password change coordinator, GPO editing target, and account lockout authority."),
        ("4. RID Master", "Allocates Relative ID (RID) pools (blocks of 500) to domain controllers for new security principals (users, groups)."),
        ("5. Infrastructure Master", "Updates cross-domain object references (Phantom objects). Should NOT run on Global Catalog unless single DC.")
    ]
    for idx, (title, desc) in enumerate(roles_dw):
        y = 2.6 - idx * 0.95
        r_box = patches.FancyBboxPatch((5.5, y), 3.8, 0.8, boxstyle="round,pad=0.04", fc='#FFFFFF', ec='#BBF7D0', lw=1)
        ax.add_patch(r_box)
        ax.text(7.4, y + 0.62, title, ha='center', va='center', fontsize=7.8, weight='bold', color='#0F172A')
        ax.text(7.4, y + 0.28, desc, ha='center', va='center', fontsize=6.5, color='#334155', linespacing=1.2)

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 5)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "fsmo_roles_architecture.png"), dpi=300)
    plt.close()
    print("Generated fsmo_roles_architecture.png")

# -----------------------------------------------------------------------------
# 8. GROUP POLICY INHERITANCE: LSDOU ARCHITECTURE
# -----------------------------------------------------------------------------
def create_gpo_inheritance():
    fig, ax = plt.subplots(figsize=(10, 4.8), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.5, "Group Policy Processing Order: The LSDOU Inheritance Engine", 
            ha='center', va='center', fontsize=14, weight='bold', color='#0F172A')
    ax.text(5, 4.15, "Order of Application: Local -> Site -> Domain -> OU (Last Applied Policy Wins)", 
            ha='center', va='center', fontsize=8.5, color='#0284C7', weight='bold')

    steps = [
        ("1. LOCAL GPO", "Processed 1st (Lowest Priority)\nLocal security policy on the PC", "#64748B", 0.6),
        ("2. SITE GPO", "Processed 2nd\nActive Directory Physical Site level", "#0284C7", 2.9),
        ("3. DOMAIN GPO", "Processed 3rd\nApplies to all computers in Domain", "#0E7490", 5.2),
        ("4. OU GPO", "Processed 4th (HIGHEST PRIORITY)\nDepartment-specific override policies", "#059669", 7.5),
    ]

    for title, desc, color, x in steps:
        box = patches.FancyBboxPatch((x, 1.6), 1.9, 2.0, boxstyle="round,pad=0.08", 
                                     fc='#FFFFFF', ec=color, lw=2)
        ax.add_patch(box)

        # Header tag
        tag = patches.FancyBboxPatch((x, 3.25), 1.9, 0.35, boxstyle="round,pad=0.03", fc=color, ec=color)
        ax.add_patch(tag)
        ax.text(x + 0.95, 3.42, title, ha='center', va='center', fontsize=7.8, weight='bold', color='#FFFFFF')

        ax.text(x + 0.95, 2.4, desc, ha='center', va='center', fontsize=7, color='#334155', linespacing=1.3)

    # Connecting Arrows
    for arrow_x in [2.5, 4.8, 7.1]:
        ax.annotate("", xy=(arrow_x + 0.38, 2.6), xytext=(arrow_x, 2.6),
                    arrowprops=dict(arrowstyle="->", color='#0284C7', lw=2.5))

    # Bottom Override Rule Banner
    b_banner = patches.FancyBboxPatch((0.6, 0.4), 8.8, 0.9, boxstyle="round,pad=0.06", 
                                      fc='#FEF3C7', ec='#F59E0B', lw=1.5)
    ax.add_patch(b_banner)
    ax.text(5, 0.98, "CRITICAL ENTERPRISE GPO EXCEPTIONS (Interview Golden Rules):", 
            ha='center', va='center', fontsize=8, weight='black', color='#92400E')
    ax.text(5, 0.66, "1. Enforced (No Override): Wins over everything, even Child OU policies.\n2. Block Inheritance: Stops higher policies from reaching the OU (unless Enforced).", 
            ha='center', va='center', fontsize=7.2, color='#78350F', linespacing=1.2)

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.8)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "gpo_inheritance_lsdou.png"), dpi=300)
    plt.close()
    print("Generated gpo_inheritance_lsdou.png")

# -----------------------------------------------------------------------------
# 9. DHCP DORA PROCESS INFOGRAPHIC
# -----------------------------------------------------------------------------
def create_dhcp_dora():
    fig, ax = plt.subplots(figsize=(10, 4.5), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.2, "DHCP 4-Step DORA Process & Packet Exchange", 
            ha='center', va='center', fontsize=14, weight='bold', color='#0F172A')
    ax.text(5, 3.85, "How Client Machines Automatically Acquire IP Addresses from Windows Server", 
            ha='center', va='center', fontsize=8.5, color='#0284C7', weight='bold')

    # Client on left
    c_box = patches.FancyBboxPatch((0.5, 0.5), 1.8, 2.9, boxstyle="round,pad=0.06", fc='#FFFFFF', ec='#0284C7', lw=2)
    ax.add_patch(c_box)
    ax.text(1.4, 3.0, "CLIENT PC\n(Windows 11)", ha='center', va='center', fontsize=8.5, weight='bold', color='#0F172A')
    ax.text(1.4, 2.1, "0.0.0.0 : 68 (UDP)\nMAC: AA:BB:CC...\nRequesting IP", ha='center', va='center', fontsize=6.8, color='#64748B')

    # Server on right
    s_box = patches.FancyBboxPatch((7.7, 0.5), 1.8, 2.9, boxstyle="round,pad=0.06", fc='#0284C7', ec='#0369A1', lw=2)
    ax.add_patch(s_box)
    ax.text(8.6, 3.0, "DHCP SERVER\n(Server 2025)", ha='center', va='center', fontsize=8.5, weight='bold', color='#FFFFFF')
    ax.text(8.6, 2.1, "192.168.1.1 : 67\nScope Pool: /24\nLease Time: 8 Days", ha='center', va='center', fontsize=6.8, color='#E0F2FE')

    # 4 Arrows in Middle
    steps = [
        ("DISCOVER (Broadcast 255.255.255.255)", 2.9, True, "#0284C7"),
        ("OFFER (Unicast / Broadcast: Offers 192.168.1.105)", 2.2, False, "#059669"),
        ("REQUEST (Broadcast: Accepts 192.168.1.105)", 1.5, True, "#0284C7"),
        ("ACKNOWLEDGE (Final Lease & DNS/Gateway Options)", 0.8, False, "#059669")
    ]

    for label, y, client_to_server, color in steps:
        if client_to_server:
            ax.annotate("", xy=(7.7, y), xytext=(2.3, y),
                        arrowprops=dict(arrowstyle="->", color=color, lw=2.2))
            ax.text(5.0, y + 0.18, label, ha='center', va='center', fontsize=7.2, weight='bold', color=color)
        else:
            ax.annotate("", xy=(2.3, y), xytext=(7.7, y),
                        arrowprops=dict(arrowstyle="->", color=color, lw=2.2))
            ax.text(5.0, y + 0.18, label, ha='center', va='center', fontsize=7.2, weight='bold', color=color)

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.5)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "dhcp_dora_process.png"), dpi=300)
    plt.close()
    print("Generated dhcp_dora_process.png")

# -----------------------------------------------------------------------------
# 10. NTFS PERMISSIONS VS SHARE PERMISSIONS MATRIX
# -----------------------------------------------------------------------------
def create_ntfs_vs_share():
    fig, ax = plt.subplots(figsize=(10, 4.8), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.4, "NTFS Permissions vs Share Permissions: Effective Access Formula", 
            ha='center', va='center', fontsize=14, weight='bold', color='#0F172A')
    ax.text(5, 4.05, "The #1 Enterprise File Security Rule: 'Most Restrictive Permission Always Wins'", 
            ha='center', va='center', fontsize=8.5, color='#0284C7', weight='bold')

    headers = ["Access Scenario", "Share Permission", "NTFS Permission", "Effective Result", "SysAdmin Reason"]
    rows = [
        ("Network User A", "Read Only", "Full Control", "READ ONLY", "Share restricts network access"),
        ("Network User B", "Full Control", "Read Only", "READ ONLY", "NTFS restricts folder access"),
        ("Network User C", "Change (Modify)", "Modify (Write)", "MODIFY (WRITE)", "Both allow write & modify"),
        ("Local Console Login", "Read Only", "Full Control", "FULL CONTROL", "Share permissions bypass on local PC!"),
        ("Deny Permission Set", "Full Control", "DENY Write", "ACCESS DENIED", "Explicit DENY overrides all ALLOWs!")
    ]

    # Header boxes
    widths = [1.8, 1.6, 1.6, 1.8, 2.2]
    xs = [0.5, 2.3, 3.9, 5.5, 7.3]

    for i in range(5):
        h_box = patches.FancyBboxPatch((xs[i], 3.4), widths[i] - 0.05, 0.4, boxstyle="round,pad=0.03", 
                                       fc='#0F172A', ec='#0F172A')
        ax.add_patch(h_box)
        ax.text(xs[i] + widths[i]/2 - 0.025, 3.6, headers[i], ha='center', va='center', 
                fontsize=7.2, weight='bold', color='#FFFFFF')

    for idx, r in enumerate(rows):
        y = 2.9 - idx * 0.42
        bg_col = '#FFFFFF' if idx % 2 == 0 else '#F1F5F9'

        r_box = patches.FancyBboxPatch((0.5, y - 0.05), 9.0, 0.38, boxstyle="square,pad=0", 
                                       fc=bg_col, ec='#CBD5E1', lw=0.6)
        ax.add_patch(r_box)

        ax.text(xs[0] + 0.1, y + 0.14, r[0], ha='left', va='center', fontsize=7, weight='bold', color='#0F172A')
        ax.text(xs[1] + widths[1]/2, y + 0.14, r[1], ha='center', va='center', fontsize=6.8, color='#475569')
        ax.text(xs[2] + widths[2]/2, y + 0.14, r[2], ha='center', va='center', fontsize=6.8, color='#475569')
        
        eff_color = '#DC2626' if 'DENIED' in r[3] else ('#059669' if 'FULL' in r[3] or 'MODIFY' in r[3] else '#0284C7')
        ax.text(xs[3] + widths[3]/2, y + 0.14, r[3], ha='center', va='center', fontsize=6.8, weight='black', color=eff_color)
        ax.text(xs[4] + 0.1, y + 0.14, r[4], ha='left', va='center', fontsize=6.5, color='#334155')

    # Bottom Formula
    f_box = patches.FancyBboxPatch((0.5, 0.4), 9.0, 0.42, boxstyle="round,pad=0.04", 
                                   fc='#EFF6FF', ec='#0284C7', lw=1.2)
    ax.add_patch(f_box)
    ax.text(5, 0.61, "GOLDEN FORMULA: Effective Network Permission = Min(Share Permission, NTFS Permission)", 
            ha='center', va='center', fontsize=8, weight='black', color='#0369A1')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.8)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "ntfs_vs_share_matrix.png"), dpi=300)
    plt.close()
    print("Generated ntfs_vs_share_matrix.png")

if __name__ == "__main__":
    create_ad_hierarchy()
    create_fsmo_roles()
    create_gpo_inheritance()
    create_dhcp_dora()
    create_ntfs_vs_share()
    print("All enterprise architecture graphics generated successfully!")
