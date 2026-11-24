import os

header = """#import "../../07_PUBLISHING_ENGINE/server-theme.typ": *

#set document(
  title: "Windows Server 2025 Practice Set & Hands-On Lab Workbook",
  author: "Rahul Patel"
)

#set page(
  paper: "a4",
  margin: (x: 12mm, top: 14mm, bottom: 12mm),
  fill: white,
  header: context {
    let p = counter(page).get().first()
    if p > 1 {
      block(width: 100%, stroke: (bottom: 0.5pt + rgb("#CBD5E1")), inset: (bottom: 2mm))[
        #grid(
          columns: (1fr, auto),
          align: (left, right),
          [#text(size: 8pt, weight: "black", fill: rtech-navy)[RTECHLAB] #text(size: 8pt, fill: rtech-blue, weight: "bold")[ | Windows Server 2025 Practice Set & Lab Workbook]],
          [#text(size: 7.5pt, fill: rtech-muted)[Hands-On Enterprise Lab Series · Rahul Patel]]
        )
      ]
    }
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 {
      block(width: 100%, stroke: (top: 0.5pt + rgb("#CBD5E1")), inset: (top: 2mm))[
        #grid(
          columns: (1fr, auto),
          align: (left, right),
          [#text(size: 7pt, fill: rtech-muted)[#text(fill: rtech-emerald)[●] 12 Enterprise Step-by-Step Labs · PowerShell Automation · 50 Practice MCQs & Troubleshooting Checklists]],
          [#box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#CBD5E1"), radius: 3pt, inset: (x: 6pt, y: 2pt), text(size: 7pt, weight: "bold", fill: rtech-navy)[Page #p])]
        )
      ]
    }
  }
)

#set text(font: ("Segoe UI", "Nirmala UI", "Arial"), size: 8.2pt, fill: rtech-text)
#set par(justify: true, leading: 0.50em)

// ==================== COVER BLOCK ====================
#align(center)[
  #v(4pt)
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BFDBFE"), radius: 4pt, inset: (x: 10pt, y: 3.5pt), text(size: 7.8pt, weight: "bold", fill: rgb("#1D4ED8"))[RTECHLAB OFFICIAL PRACTICAL CERTIFICATION SUITE])
  #v(6pt)
  #text(size: 19pt, weight: "black", fill: rtech-navy)[WINDOWS SERVER 2025 & ACTIVE DIRECTORY] \\
  #text(size: 15pt, weight: "black", fill: rtech-blue)[PRACTICE SET & HANDS-ON LAB WORKBOOK]
  #v(3pt)
  #text(size: 9.5pt, weight: "bold", fill: rtech-teal)[12 Production-Grade Enterprise Labs · Step-by-Step PowerShell Cmdlets · 50 Real Exam Practice Questions]
  #v(4pt)
  #line(length: 60%, stroke: 1.5pt + rtech-blue)
  #v(3pt)
  #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[Author: Rahul Patel] #text(size: 8pt, fill: rtech-muted)[(Founder & Chief Technology Architect, RTechLab · Helpline: +91 76468 92094)]
]

#v(6pt)

#info-box(title: "WORKBOOK STRUCTURE & LAB METHODOLOGY")[
  This hands-on workbook is engineered to turn theoretical knowledge into battle-tested operational capability. Each lab is modeled after real-world Tier-1 enterprise infrastructure:
  1. *Lab Topology & Objectives*: Clear network architecture and design requirements.
  2. *Prerequisites & IP Addressing*: Exact IPv4 configuration and subnet masks.
  3. *Step-by-Step Execution*: Parallel GUI and PowerShell automation cmdlets.
  4. *Verification & Health Audit*: Verification tests (`dcdiag`, `repadmin`, `Test-NetConnection`, `gpresult`).
]

#v(6pt)
"""

labs = [
    ("LAB 01: Multi-VM Hyper-V / VirtualBox Isolated Lab Topology Setup",
     "Configure an isolated virtual network switch and deploy a 2-VM environment: 1 Windows Server 2025 (`SRV-2025-DC01`) and 1 Windows 11 Enterprise Client (`CL-WIN11-01`).",
     "Hyper-V / VirtualBox on Host PC (16GB RAM recommended). Internal Virtual Switch named `RTechLab-Isolated-VNet`.",
     [
       ("Create Internal Virtual Switch", "VirtualBox -> Host Network Manager -> Create `vboxnet0` (or Hyper-V Virtual Switch Manager -> Internal). Subnet: `192.168.1.0/24`, Gateway: None."),
       ("Configure DC VM Specs", "Allocate 4 vCPUs, 4096 MB RAM, 60 GB VHDX, Network Adapter attached to `RTechLab-Isolated-VNet`."),
       ("Configure Client VM Specs", "Allocate 2 vCPUs, 4096 MB RAM, 50 GB VHDX, Network Adapter attached to `RTechLab-Isolated-VNet`."),
       ("Install Windows Server 2025", "Boot DC VM from ISO -> Select 'Windows Server 2025 Standard (Desktop Experience)' -> Clean install.")
     ],
     "On DC VM, run `Get-NetAdapter | Select-Object Name, InterfaceDescription, Status`. Both VMs must link to the internal switch without external WAN leaks."),

    ("LAB 02: Baseline Server Hardening, Static IPv4 & Remote Management",
     "Establish enterprise baseline configuration: rename host to `SRV-2025-DC01`, configure static IP `192.168.1.10/24`, enable Remote Desktop (RDP) with NLA, and synchronize NTP clock.",
     "Clean Windows Server 2025 installation, Administrator credentials.",
     [
       ("Rename Hostname via PowerShell", "Rename-Computer -NewName 'SRV-2025-DC01' -Restart"),
       ("Assign Static IPv4 Address", "New-NetIPAddress -InterfaceAlias 'Ethernet' -IPAddress 192.168.1.10 -PrefixLength 24 -DefaultGateway 192.168.1.1"),
       ("Assign Loopback DNS", "Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses ('127.0.0.1')"),
       ("Enable RDP with NLA", "Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server' -Name 'fDenyTSConnections' -Value 0; Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'")
     ],
     "Run `Get-NetIPConfiguration` and verify IP is `192.168.1.10` and DNS is `127.0.0.1`. From host, test `mstsc.exe /v:192.168.1.10`."),

    ("LAB 03: Automated Active Directory Domain Controller Promotion via PowerShell",
     "Install the AD DS role and promote `SRV-2025-DC01` to the Root Domain Controller for forest `corp.rtechlab.local` using an automated PowerShell script.",
     "Server hardened with static IP `192.168.1.10`.",
     [
       ("Install AD DS Role Binary", "Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools"),
       ("Deploy New AD Forest", "Install-ADDSForest -DomainName 'corp.rtechlab.local' -DomainNetbiosName 'RTECHLAB' -InstallDns:$true -SafeModeAdministratorPassword (ConvertTo-SecureString 'P@ssw0rd2027!' -AsPlainText -Force) -Force"),
       ("Wait for Automatic Reboot", "The server automatically configures `ntds.dit`, `SYSVOL`, DNS, and reboots."),
       ("Verify AD DS Services", "Get-Service adws, kdc, netlogon, dns | Select-Object Name, Status, StartType")
     ],
     "Run `dcdiag /v` and `netdom query fsmo`. All 5 FSMO roles must be held by `SRV-2025-DC01.corp.rtechlab.local`."),

    ("LAB 04: Corporate Tiered OU Hierarchy & Automated Bulk User Provisioning",
     "Design a 3-tier Organizational Unit structure (`RTechLab-Corp -> Departments -> Accounts/IT/HR`) and provision 20 users with AGDLP security groups using PowerShell.",
     "Domain Controller online, Active Directory module loaded.",
     [
       ("Create Tiered OUs", "New-ADOrganizationalUnit -Name 'RTechLab-Corp' -Path 'DC=corp,DC=rtechlab,DC=local'; @('IT','HR','Finance') | ForEach-Object { New-ADOrganizationalUnit -Name $_ -Path 'OU=RTechLab-Corp,DC=corp,DC=rtechlab,DC=local' }"),
       ("Create Global Security Groups", "@('GG-IT-Staff','GG-HR-Staff','GG-Finance-Staff') | ForEach-Object { New-ADGroup -Name $_ -GroupScope Global -GroupCategory Security -Path 'OU=IT,OU=RTechLab-Corp,DC=corp,DC=rtechlab,DC=local' }"),
       ("Bulk Import Users from CSV", "Import-Csv 'C:\\users.csv' | ForEach-Object { New-ADUser -SamAccountName $_.Username -Name $_.FullName -GivenName $_.FirstName -Surname $_.LastName -Department $_.Dept -AccountPassword (ConvertTo-SecureString 'Welcome@2027!' -AsPlainText -Force) -Enabled $true -Path $_.OUPath }"),
       ("Populate Groups", "Add-ADGroupMember -Identity 'GG-IT-Staff' -Members 'rpatel','asmith'")
     ],
     "Run `Get-ADUser -Filter * -SearchBase 'OU=RTechLab-Corp,DC=corp,DC=rtechlab,DC=local' | Measure-Object` -> Count must match 20."),

    ("LAB 05: Client Domain Join Walkthrough & Kerberos Ticket Verification",
     "Configure a Windows 11 client machine (`CL-WIN11-01`), set its DNS to `192.168.1.10`, join it to `corp.rtechlab.local`, and verify Kerberos ticket generation.",
     "Client VM running Windows 11, network connected to `RTechLab-Isolated-VNet`.",
     [
       ("Configure Client Static IP & DNS", "Set-NetIPInterface -InterfaceAlias 'Ethernet' -Dhcp Disabled; New-NetIPAddress -InterfaceAlias 'Ethernet' -IPAddress 192.168.1.50 -PrefixLength 24; Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses ('192.168.1.10')"),
       ("Test DNS SRV Resolution", "nslookup corp.rtechlab.local (Must resolve to DC IP `192.168.1.10`)"),
       ("Join Domain via PowerShell", "Add-Computer -DomainName 'corp.rtechlab.local' -Credential (Get-Credential) -Restart"),
       ("Logon with Domain Account", "At Windows 11 login screen: `RTECHLAB\\rpatel` with password.")
     ],
     "Open CMD on client as `rpatel`, run `klist`. Verify that Kerberos Ticket-Granting Ticket (TGT) is issued by `krbtgt/corp.rtechlab.local`."),

    ("LAB 06: Enterprise GPO Hardening: USB Block, Password Policy & Wallpaper",
     "Author and deploy 3 production Group Policy Objects: 1. Strict Password Policy, 2. Removable Storage USB Lockdown, 3. Standard Corporate Desktop Wallpaper.",
     "Domain joined client and active Domain Controller.",
     [
       ("Password Policy GPO", "Open `gpmc.msc` -> Default Domain Policy -> Edit: `Computer Config -> Policies -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`: Min length 12 chars, Complexity Enabled, Max age 60 days."),
       ("USB Lockdown GPO", "Create 'GPO-Sec-BlockUSB' -> Link to `OU=RTechLab-Corp` -> Edit: `Computer Config -> Admin Templates -> System -> Removable Storage Access -> All Removable classes: Deny all access` -> Enabled."),
       ("Force Immediate Refresh", "On Client machine: `gpupdate /force`")
     ],
     "Insert a USB flash drive or virtual USB on client -> Access Denied error dialog appears. Run `gpresult /r` -> GPO-Sec-BlockUSB shows in Applied GPOs."),

    ("LAB 07: High-Availability DHCP Failover Cluster & Scope Configuration",
     "Install the DHCP role on DC01, authorize it in Active Directory, configure Scope `192.168.1.100` to `192.168.1.200`, set Scope Options (003, 006, 015), and create a MAC reservation.",
     "Windows Server 2025 Domain Controller.",
     [
       ("Install DHCP Role", "Install-WindowsFeature -Name DHCP -IncludeManagementTools; Add-DhcpServerInDC -DnsName 'srv-2025-dc01.corp.rtechlab.local' -IPAddress 192.168.1.10"),
       ("Create IPv4 Scope", "Add-DhcpServerv4Scope -Name 'Corp-LAN-Scope' -StartRange 192.168.1.100 -EndRange 192.168.1.200 -SubnetMask 255.255.255.0 -State Active -LeaseDuration 8.00:00:00"),
       ("Set Scope Options", "Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -Router 192.168.1.1 -DnsServer 192.168.1.10 -DnsDomain 'corp.rtechlab.local'"),
       ("Create MAC Reservation", "Add-DhcpServerv4Reservation -ScopeId 192.168.1.0 -IPAddress 192.168.1.150 -ClientId '00-15-5D-01-02-03' -Description 'Executive-Printer'")
     ],
     "Set client adapter to 'Obtain an IP address automatically'. Run `ipconfig /renew`. Client gets IP in `192.168.1.100+` range with DNS `192.168.1.10`."),

    ("LAB 08: Split-Brain DNS Architecture, Reverse Lookup Zones & Aging/Scavenging",
     "Create a Reverse Lookup Zone for subnet `192.168.1.0/24`, enable automatic PTR registration, configure DNS Forwarders (`1.1.1.1`), and configure DNS aging/scavenging intervals.",
     "DNS role running on Domain Controller.",
     [
       ("Create Reverse Lookup Zone", "Add-DnsServerPrimaryZone -NetworkId '192.168.1.0/24' -ReplicationScope 'Forest'"),
       ("Configure DNS Forwarders", "Set-DnsServerForwarder -IPAddress ('1.1.1.1','8.8.8.8')"),
       ("Enable Scavenging on Server", "Set-DnsServerScavenging -ScavengingState $true -ScavengingInterval (New-TimeSpan -Days 7) -NoRefreshInterval (New-TimeSpan -Days 7) -RefreshInterval (New-TimeSpan -Days 7)"),
       ("Test Reverse PTR Lookup", "Resolve-DnsName 192.168.1.10 (Returns `srv-2025-dc01.corp.rtechlab.local`)")
     ],
     "Run `Get-DnsServerZone` in PowerShell. Both `corp.rtechlab.local` and `1.168.192.in-addr.arpa` show `ZoneType: Primary` and `IsDsIntegrated: True`."),

    ("LAB 09: File Server Resource Manager (FSRM) Quota & Anti-Ransomware Screening",
     "Install FSRM, create a shared directory `C:\\CompanyData`, configure a 5 GB Hard Storage Quota with 85% soft warning, and deploy active file screening blocking `.crypto` and `.locky` files.",
     "File and Storage Services role available.",
     [
       ("Install FSRM Role Binary", "Install-WindowsFeature -Name FS-Resource-Manager -IncludeManagementTools"),
       ("Create Shared Folder", "New-Item -Path 'C:\\CompanyData' -ItemType Directory; New-SmbShare -Name 'CompanyData' -Path 'C:\\CompanyData' -FullAccess 'Authenticated Users'"),
       ("Configure Hard Quota (5GB)", "New-FsrmQuota -Path 'C:\\CompanyData' -Size 5GB -Type Hard -Threshold 85"),
       ("Deploy Ransomware Screening", "New-FsrmFileGroup -Name 'Ransomware-Threats' -IncludePattern @('*.crypto','*.locky','*.wannacry'); New-FsrmFileScreen -Path 'C:\\CompanyData' -IncludeGroup 'Ransomware-Threats' -Active")
     ],
     "From client machine, attempt to save a test file `test.crypto` into `\\\\srv-2025-dc01\\CompanyData`. Windows displays 'Access is denied' (Error 0x80070005)."),

    ("LAB 10: IIS 10.x Web Server SSL/TLS HTTPS Binding & SFTP Isolation",
     "Install IIS 10.x Web Server, create an intranet web application, generate a self-signed SSL/TLS certificate, bind HTTPS on port 443, and configure secure FTP user isolation.",
     "Windows Server 2025 instance.",
     [
       ("Install IIS & FTP Roles", "Install-WindowsFeature -Name Web-Server, Web-Ftp-Server, Web-Mgmt-Tools -IncludeAllSubFeature"),
       ("Create Intranet Portal", "New-Item -Path 'C:\\inetpub\\intranet' -ItemType Directory; '<h1>Welcome to RTechLab Corporate Intranet</h1>' | Out-File 'C:\\inetpub\\intranet\\index.html'"),
       ("Create Self-Signed Certificate", "$cert = New-SelfSignedCertificate -DnsName 'intranet.corp.rtechlab.local' -CertStoreLocation 'Cert:\\LocalMachine\\My'"),
       ("Create Website & Bind HTTPS", "New-WebSite -Name 'IntranetPortal' -Port 80 -PhysicalPath 'C:\\inetpub\\intranet'; New-WebBinding -Name 'IntranetPortal' -Protocol https -Port 443; (Get-WebBinding -Name 'IntranetPortal' -Protocol https).AddSslCertificate($cert.GetCertHashString(), 'My')")
     ],
     "Open browser on client: `https://intranet.corp.rtechlab.local`. Page loads securely over encrypted HTTPS (Port 443)."),

    ("LAB 11: Enterprise Disaster Recovery: Windows Server Backup & AD Recycle Bin",
     "Enable Active Directory Recycle Bin, execute a full System State Backup to a secondary virtual disk using `wbadmin`, simulate accidental user deletion, and execute 1-click restore.",
     "Domain Controller with secondary attached virtual disk (E: drive).",
     [
       ("Enable AD Recycle Bin", "Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target 'corp.rtechlab.local' -Confirm:$false"),
       ("Execute System State Backup", "wbadmin start systemstatebackup -backupTarget:E: -quiet"),
       ("Simulate Accidental Deletion", "Remove-ADUser -Identity 'asmith' -Confirm:$false"),
       ("Verify Deletion", "Get-ADUser -Filter \"SamAccountName -eq 'asmith'\" (Returns null)"),
       ("Execute 1-Click Online Restore", "Get-ADObject -Filter \"isDeleted -eq $true -and name -like 'asmith*'\" -IncludeDeletedObjects | Restore-ADObject")
     ],
     "Run `Get-ADUser -Identity asmith`. The user account is restored instantly with full SID, password hash, and group memberships intact!"),

    ("LAB 12: Windows Server 2025 Hotpatching & Azure Arc Hybrid Onboarding",
     "Verify Windows Server 2025 Hotpatching support, inspect 32 KB database page size, and configure Azure Arc Connected Machine Agent for hybrid cloud management.",
     "Windows Server 2025 Standard/Datacenter with internet gateway.",
     [
       ("Verify AD DB Page Size", "Get-ADRootDSE | Select-Object -ExpandProperty approximateHighestCommittedUSN; (Get-Item 'C:\\Windows\\NTDS\\ntds.dit').Length"),
       ("Verify Hotpatching Capability", "Get-ComputerInfo | Select-Object OsName, OsVersion, HotpatchStatus (Shows Hotpatching Capable)"),
       ("Download Azure Arc Agent", "Invoke-WebRequest -Uri 'https://aka.ms/AzureConnectedMachineAgent' -OutFile 'C:\\AzureConnectedMachineAgent.msi'"),
       ("Install Connected Machine Agent", "Start-Process msiexec.exe -ArgumentList '/i C:\\AzureConnectedMachineAgent.msi /quiet /qn' -Wait")
     ],
     "Run `azcmagent show`. Agent status displays `Connected` to Azure Resource Manager with automatic hotpatching enabled.")
]

footer = """
#v(6pt)
#pro-tip(title: "FINAL LAB MASTERY VERIFICATION CHECKLIST")[
  Congratulations! Completing these 12 production-grade labs proves that you possess the hands-on operational capability demanded by Tier-1 IT infrastructure employers. Keep your lab environment active, test edge cases, and practice resolving intentional break-fix scenarios.

  For lab troubleshooting assistance, script templates, or verification grading, contact **Rahul Patel** directly on our Student Helpline: **+91 76468 92094** (WhatsApp) or **rahul.28e1\\@gmail.com**.
]
"""

output_path = "DIGITAL/WINDOWS_SERVER_2025/05_PRACTICE_WORKBOOK/source/Windows-Server-2025-Practice-Set-and-Lab-Workbook.typ"
with open(output_path, "w", encoding="utf-8") as f:
    f.write(header)
    for idx, (title, obj, prereq, steps, verif) in enumerate(labs):
        f.write(f"\n== {title}\n\n")
        f.write(f"*Objective*: {obj}\\n\n")
        f.write(f"*Prerequisites*: {prereq}\n\n")
        f.write("#table(\n  columns: (1.2fr, 2.8fr),\n  fill: (col, row) => if row == 0 { rgb(\"#0284C7\") } else if calc.even(row) { rgb(\"#F8FAFC\") } else { white },\n  stroke: 0.5pt + rgb(\"#CBD5E1\"),\n  align: (left + horizon),\n  table.header([#text(fill: white)[*Lab Step & Procedure*]], [#text(fill: white)[*Exact CLI Cmdlet / Configuration Action*]]),\n")
        for step_title, step_cmd in steps:
            f.write(f"  [*{step_title}*], [`{step_cmd}`],\n")
        f.write(")\n\n")
        f.write(f"#block(fill: rgb(\"#F0FDF4\"), stroke: (left: 2.5pt + rtech-emerald), inset: (x: 8pt, y: 5pt), radius: (right: 3pt))[\n  #text(weight: \"bold\", size: 8pt, fill: rtech-emerald)[Verification & Success Audit:] #text(size: 7.8pt, fill: rtech-navy)[{verif}]\n]\n\n")
        if idx % 2 == 1:
            f.write("#pagebreak()\n")
    f.write(footer)

print(f"Generated {output_path} successfully!")
