import matplotlib.pyplot as plt
import matplotlib.patches as patches

# 1. IIS & RDS Architecture
fig, ax = plt.subplots(figsize=(10, 5), dpi=300)
ax.set_facecolor('#F8FAFC')
fig.patch.set_facecolor('#F8FAFC')
ax.axis('off')

ax.text(0.5, 0.93, 'Enterprise IIS 10.x Web Server & Remote Desktop Services (RDS)', 
        ha='center', va='center', fontsize=14, fontweight='bold', color='#0F172A', fontname='Segoe UI')
ax.text(0.5, 0.86, 'Web Application Hosting, HTTPS SSL Binding & Centralized VDI / Session Host Environment', 
        ha='center', va='center', fontsize=9.5, color='#475569', fontname='Segoe UI')

rect1 = patches.FancyBboxPatch((0.04, 0.12), 0.44, 0.68, boxstyle='round,pad=0.02,rounding_size=0.03',
                               linewidth=1.3, edgecolor='#0284C7', facecolor='#FFFFFF')
ax.add_patch(rect1)
ax.text(0.26, 0.74, 'IIS 10.x Web Server & Secure FTP', ha='center', va='center', fontsize=10, fontweight='bold', color='#0284C7')
desc1 = '• World Wide Web Publishing Service (W3SVC)\n• Port 80 (HTTP) & Port 443 (HTTPS SSL/TLS)\n• Application Pools (Worker Process w3wp.exe)\n• Virtual Directories & Internal Portal Hosting\n• Secure FTP Server with User Isolation'
ax.text(0.06, 0.44, desc1, ha='left', va='center', fontsize=7.8, color='#334155', fontname='Segoe UI')

rect2 = patches.FancyBboxPatch((0.52, 0.12), 0.44, 0.68, boxstyle='round,pad=0.02,rounding_size=0.03',
                               linewidth=1.3, edgecolor='#059669', facecolor='#FFFFFF')
ax.add_patch(rect2)
ax.text(0.74, 0.74, 'Remote Desktop Services (RDS / VDI)', ha='center', va='center', fontsize=10, fontweight='bold', color='#059669')
desc2 = '• RD Web Access: Browser Portal for RemoteApps\n• RD Gateway: Encapsulates RDP over HTTPS (443)\n• RD Connection Broker: Session Reconnect & LB\n• RD Session Host: Runs Multi-User Desktops\n• RD Licensing Server: Per-User / Per-Device CALs'
ax.text(0.54, 0.44, desc2, ha='left', va='center', fontsize=7.8, color='#334155', fontname='Segoe UI')

plt.tight_layout()
plt.savefig('DIGITAL/WINDOWS_SERVER_2025/02_BRAND_ASSETS/screenshots/iis_rds_architecture.png', bbox_inches='tight', dpi=300)
plt.close()

# 2. Server 2025 Flagship & Azure Arc
fig, ax = plt.subplots(figsize=(10, 5), dpi=300)
ax.set_facecolor('#F8FAFC')
fig.patch.set_facecolor('#F8FAFC')
ax.axis('off')

ax.text(0.5, 0.93, 'Windows Server 2025 Next-Gen Flagship Architecture & Hybrid Azure Arc', 
        ha='center', va='center', fontsize=14, fontweight='bold', color='#0F172A', fontname='Segoe UI')
ax.text(0.5, 0.86, 'Hotpatching (Zero Reboot), 32KB AD Database, ReFS Next-Gen Storage & SMB over QUIC', 
        ha='center', va='center', fontsize=9.5, color='#475569', fontname='Segoe UI')

features = [
    ('Hotpatching', 'Patching memory in-place\nZero server reboots needed\nMaintains 99.999% uptime', '#0284C7'),
    ('32KB AD DB Page', 'ntds.dit upgraded from 8KB\n300% faster LDAP & Kerberos\nLargest AD boost in 25 years', '#059669'),
    ('SMB over QUIC', 'File sharing over UDP 443\nZero VPN required for remote\nEncrypted TLS 1.3 tunneling', '#D97706'),
    ('Next-Gen S2D', 'NVMe Native Acceleration\nReFS Dedup & Compression\nHyper-Converged Infrastructure', '#0284C7'),
    ('Azure Arc Bridge', 'Single control plane in cloud\nGovernance & Defender for Cloud\nLive compliance monitoring', '#0F172A')
]

for idx, (title, desc, col) in enumerate(features):
    x = 0.04 + idx * 0.19
    rect = patches.FancyBboxPatch((x, 0.15), 0.175, 0.62, boxstyle='round,pad=0.02,rounding_size=0.03',
                                  linewidth=1.4, edgecolor=col, facecolor='#FFFFFF')
    ax.add_patch(rect)
    ax.text(x + 0.087, 0.70, title, ha='center', va='center', fontsize=9, fontweight='bold', color=col, fontname='Segoe UI')
    ax.text(x + 0.087, 0.42, desc, ha='center', va='center', fontsize=7.2, color='#334155', fontname='Segoe UI', multialignment='center')

plt.tight_layout()
plt.savefig('DIGITAL/WINDOWS_SERVER_2025/02_BRAND_ASSETS/screenshots/server2025_azure_hotpatching.png', bbox_inches='tight', dpi=300)
plt.close()

# 3. Backup & Disaster Recovery Flow
fig, ax = plt.subplots(figsize=(10, 5), dpi=300)
ax.set_facecolor('#F8FAFC')
fig.patch.set_facecolor('#F8FAFC')
ax.axis('off')

ax.text(0.5, 0.93, 'Enterprise Backup Strategy & Active Directory Recycle Bin Architecture', 
        ha='center', va='center', fontsize=14, fontweight='bold', color='#0F172A', fontname='Segoe UI')
ax.text(0.5, 0.86, '3-2-1 Enterprise Backup Principle, System State Recovery & Zero-Reboot Object Restoration', 
        ha='center', va='center', fontsize=9.5, color='#475569', fontname='Segoe UI')

rect1 = patches.FancyBboxPatch((0.04, 0.12), 0.44, 0.68, boxstyle='round,pad=0.02,rounding_size=0.03',
                               linewidth=1.3, edgecolor='#0284C7', facecolor='#FFFFFF')
ax.add_patch(rect1)
ax.text(0.26, 0.74, 'Windows Server Backup & 3-2-1 Rule', ha='center', va='center', fontsize=10, fontweight='bold', color='#0284C7')
desc1 = '• 3 Copies of Data on 2 Different Media with 1 Offsite\n• System State Backup: Registry, Boot Files, SYSVOL, AD\n• VSS (Volume Shadow Copy) Application-Consistent\n• Bare Metal Recovery (BMR) for Total Hardware Loss\n• wbadmin start systemstatebackup CLI automation'
ax.text(0.06, 0.44, desc1, ha='left', va='center', fontsize=7.8, color='#334155', fontname='Segoe UI')

rect2 = patches.FancyBboxPatch((0.52, 0.12), 0.44, 0.68, boxstyle='round,pad=0.02,rounding_size=0.03',
                               linewidth=1.3, edgecolor='#059669', facecolor='#FFFFFF')
ax.add_patch(rect2)
ax.text(0.74, 0.74, 'Active Directory Recycle Bin', ha='center', va='center', fontsize=10, fontweight='bold', color='#059669')
desc2 = '• Enable-ADOptionalFeature Recycle Bin Feature\n• Live Instant Object Restoration in 1 Click\n• Preserves all SIDs, Group Memberships & Passwords\n• Zero Domain Controller Reboot or DSRM needed\n• Deleted Object Lifetime default: 180 Days'
ax.text(0.54, 0.44, desc2, ha='left', va='center', fontsize=7.8, color='#334155', fontname='Segoe UI')

plt.tight_layout()
plt.savefig('DIGITAL/WINDOWS_SERVER_2025/02_BRAND_ASSETS/screenshots/backup_disaster_recovery_flow.png', bbox_inches='tight', dpi=300)
plt.close()

# 4. Career Matrix
fig, ax = plt.subplots(figsize=(10, 5), dpi=300)
ax.set_facecolor('#F8FAFC')
fig.patch.set_facecolor('#F8FAFC')
ax.axis('off')

ax.text(0.5, 0.93, 'RTechLab Enterprise System Administrator Career Roadmap & Growth Ladder', 
        ha='center', va='center', fontsize=14, fontweight='bold', color='#0F172A', fontname='Segoe UI')
ax.text(0.5, 0.86, 'L1 Desktop/Support -> L2 System Administrator -> L3 Infrastructure Architect Career Milestones', 
        ha='center', va='center', fontsize=9.5, color='#475569', fontname='Segoe UI')

levels = [
    ('Level 1: Desktop Support', '• ADUC User Onboarding\n• Domain Join & DNS Fixes\n• Password & Lockout\n• Basic GPO gpupdate\n• Exp: 0 - 2 Yrs (3-5 LPA)', '#0284C7'),
    ('Level 2: SysAdmin', '• Domain Controller Setup\n• GPO Security Hardening\n• DHCP & DNS Architecture\n• FSRM Quotas & Permissions\n• Exp: 2 - 5 Yrs (6-12 LPA)', '#059669'),
    ('Level 3: Senior Infra Admin', '• Multi-Domain Forest & FSMO\n• DFSR SYSVOL Recovery\n• Hybrid Azure Arc\n• High Availability & S2D\n• Exp: 5 - 8 Yrs (14-22 LPA)', '#D97706'),
    ('Enterprise Architect', '• Cloud & Hybrid Strategy\n• Zero Trust Identity & Kerberos\n• Global Disaster Recovery\n• CISO Security Governance\n• Exp: 8+ Yrs (25-45+ LPA)', '#0F172A')
]

for idx, (title, desc, col) in enumerate(levels):
    x = 0.04 + idx * 0.235
    rect = patches.FancyBboxPatch((x, 0.15), 0.22, 0.62, boxstyle='round,pad=0.02,rounding_size=0.03',
                                  linewidth=1.4, edgecolor=col, facecolor='#FFFFFF')
    ax.add_patch(rect)
    ax.text(x + 0.11, 0.70, title, ha='center', va='center', fontsize=8.8, fontweight='bold', color=col, fontname='Segoe UI')
    ax.text(x + 0.02, 0.42, desc, ha='left', va='center', fontsize=7.2, color='#334155', fontname='Segoe UI')

plt.tight_layout()
plt.savefig('DIGITAL/WINDOWS_SERVER_2025/02_BRAND_ASSETS/screenshots/sysadmin_career_matrix.png', bbox_inches='tight', dpi=300)
plt.close()

print('All 4 diagrams created successfully!')
