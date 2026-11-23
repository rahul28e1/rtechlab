import os
import matplotlib.pyplot as plt
import matplotlib.patches as patches

output_dir = r"DIGITAL\WINDOWS_SERVER_2025\02_BRAND_ASSETS\screenshots"
os.makedirs(output_dir, exist_ok=True)

plt.rcParams['font.sans-serif'] = 'DejaVu Sans'
plt.rcParams['axes.edgecolor'] = '#CBD5E1'

# -----------------------------------------------------------------------------
# 1. LAB SETUP TOPOLOGY (HOST PC + VIRTUAL MACHINES)
# -----------------------------------------------------------------------------
def create_lab_topology():
    fig, ax = plt.subplots(figsize=(10, 4.8), dpi=300)
    ax.set_facecolor('#F8FAFC')
    fig.patch.set_facecolor('#F8FAFC')

    ax.text(5, 4.4, "Student Enterprise Home Lab Topology (Isolated Virtual Network)", 
            ha='center', va='center', fontsize=14, weight='bold', color='#0F172A')
    ax.text(5, 4.05, "Physical Host Running VirtualBox / Hyper-V with Domain Controller & Client PC", 
            ha='center', va='center', fontsize=8.5, color='#0284C7', weight='bold')

    # Host Machine Box
    host_box = patches.FancyBboxPatch((0.5, 0.4), 9.0, 3.3, boxstyle="round,pad=0.08", 
                                      fc='#FFFFFF', ec='#0F172A', lw=2)
    ax.add_patch(host_box)
    ax.text(5, 3.45, "PHYSICAL HOST PC (Windows 11 / 10 · 16 GB RAM · Intel/AMD VT-x Enabled)", 
            ha='center', va='center', fontsize=8.5, weight='black', color='#0F172A')

    # Internal Virtual Switch Box
    vswitch = patches.FancyBboxPatch((0.8, 1.8), 8.4, 0.65, boxstyle="round,pad=0.04", 
                                     fc='#0284C7', ec='#0369A1', lw=1.2)
    ax.add_patch(vswitch)
    ax.text(5, 2.12, "ISOLATED VIRTUAL SWITCH / NAT NETWORK (Subnet: 192.168.1.0/24)", 
            ha='center', va='center', fontsize=8.5, weight='bold', color='#FFFFFF')

    # VM 1: Domain Controller
    vm1 = patches.FancyBboxPatch((1.2, 0.6), 3.4, 1.05, boxstyle="round,pad=0.04", 
                                 fc='#F0F9FF', ec='#0284C7', lw=1.5)
    ax.add_patch(vm1)
    ax.text(2.9, 1.38, "VM 1: PRIMARY DOMAIN CONTROLLER", ha='center', va='center', fontsize=7.8, weight='black', color='#0284C7')
    ax.text(2.9, 1.12, "OS: Windows Server 2025 Datacenter", ha='center', va='center', fontsize=6.8, color='#334155')
    ax.text(2.9, 0.88, "IP: 192.168.1.10 (Static) · DNS: 127.0.0.1", ha='center', va='center', fontsize=6.8, weight='bold', color='#059669')
    ax.text(2.9, 0.68, "RAM: 4096 MB · 2 vCPU · VHD: 60 GB", ha='center', va='center', fontsize=6.2, color='#64748B')

    # VM 2: Client PC
    vm2 = patches.FancyBboxPatch((5.4, 0.6), 3.4, 1.05, boxstyle="round,pad=0.04", 
                                 fc='#F0FDF4', ec='#059669', lw=1.5)
    ax.add_patch(vm2)
    ax.text(7.1, 1.38, "VM 2: ENTERPRISE CLIENT WORKSTATION", ha='center', va='center', fontsize=7.8, weight='black', color='#059669')
    ax.text(7.1, 1.12, "OS: Windows 11 / 10 Pro (Domain Joined)", ha='center', va='center', fontsize=6.8, color='#334155')
    ax.text(7.1, 0.88, "IP: 192.168.1.105 (DHCP) · DNS: 192.168.1.10", ha='center', va='center', fontsize=6.8, weight='bold', color='#0284C7')
    ax.text(7.1, 0.68, "RAM: 2048 MB · 1 vCPU · VHD: 40 GB", ha='center', va='center', fontsize=6.2, color='#64748B')

    # Connect VMs to vSwitch
    ax.plot([2.9, 2.9], [1.65, 1.8], color='#0284C7', lw=2)
    ax.plot([7.1, 7.1], [1.65, 1.8], color='#059669', lw=2)

    # WAN / Router connection to vSwitch
    ax.annotate("", xy=(5.0, 2.45), xytext=(5.0, 3.1),
                arrowprops=dict(arrowstyle="->", color='#D97706', lw=1.8))
    ax.text(5.6, 2.78, "NAT Internet Access\n(Optional Lab Update)", ha='center', va='center', fontsize=6.5, color='#D97706')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 4.8)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "lab_topology_virtualbox.png"), dpi=300)
    plt.close()
    print("Generated lab_topology_virtualbox.png")

# -----------------------------------------------------------------------------
# 2. SERVER 2025 INSTALLATION WIZARD SIMULATION (EDITION SELECTION)
# -----------------------------------------------------------------------------
def create_os_selection_screen():
    fig, ax = plt.subplots(figsize=(10, 5.2), dpi=300)
    ax.set_facecolor('#004E98')  # Windows Setup Classic Purple/Blue
    fig.patch.set_facecolor('#004E98')

    # Setup Window Box
    win_box = patches.FancyBboxPatch((1.0, 0.5), 8.0, 4.2, boxstyle="round,pad=0.06", 
                                     fc='#FFFFFF', ec='#1E293B', lw=1.5)
    ax.add_patch(win_box)

    # Window Title Bar
    t_bar = patches.FancyBboxPatch((1.0, 4.25), 8.0, 0.45, boxstyle="round,pad=0.02", fc='#F1F5F9', ec='#CBD5E1')
    ax.add_patch(t_bar)
    ax.text(1.2, 4.47, "Windows Server Setup", ha='left', va='center', fontsize=8.5, weight='bold', color='#0F172A')

    # Heading inside setup
    ax.text(1.3, 3.9, "Select the operating system you want to install", ha='left', va='center', 
            fontsize=11, weight='bold', color='#0F172A')

    # OS Table
    headers = ["Operating System", "Architecture", "Date Modified"]
    ax.plot([1.3, 8.7], [3.6, 3.6], color='#CBD5E1', lw=0.8)
    ax.text(1.4, 3.45, headers[0], ha='left', va='center', fontsize=7.2, weight='bold', color='#475569')
    ax.text(5.5, 3.45, headers[1], ha='left', va='center', fontsize=7.2, weight='bold', color='#475569')
    ax.text(7.2, 3.45, headers[2], ha='left', va='center', fontsize=7.2, weight='bold', color='#475569')
    ax.plot([1.3, 8.7], [3.3, 3.3], color='#CBD5E1', lw=0.8)

    editions = [
        ("Windows Server 2025 Standard", "x64", "Server Core (CLI Only)", False),
        ("Windows Server 2025 Standard (Desktop Experience)", "x64", "Full GUI Administration", False),
        ("Windows Server 2025 Datacenter", "x64", "Server Core (CLI Only)", False),
        ("Windows Server 2025 Datacenter (Desktop Experience)", "x64", "SELECTED: Full GUI + Unlimited VMs", True),
    ]

    for idx, (name, arch, note, is_sel) in enumerate(editions):
        y = 3.05 - idx * 0.45
        if is_sel:
            sel_box = patches.FancyBboxPatch((1.3, y - 0.15), 7.4, 0.38, boxstyle="square,pad=0", 
                                             fc='#0284C7', ec='#0284C7')
            ax.add_patch(sel_box)
            ax.text(1.4, y + 0.04, name, ha='left', va='center', fontsize=7.5, weight='black', color='#FFFFFF')
            ax.text(5.6, y + 0.04, arch, ha='left', va='center', fontsize=7.5, weight='bold', color='#FFFFFF')
            ax.text(7.0, y + 0.04, note, ha='left', va='center', fontsize=6.8, weight='bold', color='#FEF08A')
        else:
            ax.text(1.4, y + 0.04, name, ha='left', va='center', fontsize=7.2, color='#1E293B')
            ax.text(5.6, y + 0.04, arch, ha='left', va='center', fontsize=7.2, color='#64748B')
            ax.text(7.0, y + 0.04, note, ha='left', va='center', fontsize=6.5, color='#94A3B8')

    # Description Callout at bottom of wizard
    desc_box = patches.FancyBboxPatch((1.3, 0.8), 7.4, 0.75, boxstyle="round,pad=0.03", 
                                      fc='#F8FAFC', ec='#E2E8F0', lw=0.8)
    ax.add_patch(desc_box)
    ax.text(1.4, 1.35, "Description:", ha='left', va='center', fontsize=7, weight='bold', color='#0F172A')
    ax.text(1.4, 1.05, "This option installs the complete Windows graphical environment ('Desktop Experience'). It includes\nServer Manager, Active Directory Administrative Tools, and full graphical MMC consoles.", 
            ha='left', va='center', fontsize=6.8, color='#334155', linespacing=1.2)

    # Next / Cancel Buttons
    next_btn = patches.FancyBboxPatch((7.6, 0.55), 1.1, 0.22, boxstyle="round,pad=0.02", fc='#0284C7', ec='#0284C7')
    ax.add_patch(next_btn)
    ax.text(8.15, 0.66, "Next >", ha='center', va='center', fontsize=7.5, weight='bold', color='#FFFFFF')

    ax.set_xlim(0, 10)
    ax.set_ylim(0, 5.2)
    ax.axis('off')
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, "server_setup_os_selection.png"), dpi=300)
    plt.close()
    print("Generated server_setup_os_selection.png")

if __name__ == "__main__":
    create_lab_topology()
    create_os_selection_screen()
    print("Lab setup visuals generated successfully!")
