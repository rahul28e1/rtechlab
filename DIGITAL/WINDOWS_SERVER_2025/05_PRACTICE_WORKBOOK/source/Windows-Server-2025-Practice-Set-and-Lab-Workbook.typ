#import "../../07_PUBLISHING_ENGINE/server-theme.typ": *

#set document(
  title: "Windows Server 2025 Practice Set & Hands-On Enterprise Lab Workbook",
  author: "Rahul Patel"
)

#set page(
  paper: "a4",
  margin: (x: 11mm, top: 13mm, bottom: 12mm),
  fill: white,
  
  // Official RTechLab Light Watermark on All Content Pages
  background: context {
    let p = counter(page).get().first()
    place(
      center + horizon,
      rotate(
        -32deg,
        block(
          align(center)[
            #text(size: 38pt, weight: "black", fill: rgb(2, 132, 199, 4.5%), tracking: 3pt)[
              RTECHLAB
            ]
            #v(5pt)
            #text(size: 11pt, weight: "bold", fill: rgb(15, 23, 42, 3.5%), tracking: 4pt)[
              ENTERPRISE LAB WORKBOOK · RAHUL PATEL
            ]
          ]
        )
      )
    )
  },

  header: context {
    let p = counter(page).get().first()
    block(width: 100%, stroke: (bottom: 0.6pt + rgb("#CBD5E1")), inset: (bottom: 2mm))[
      #grid(
        columns: (auto, 1fr, auto),
        align: (left + horizon, left + horizon, right + horizon),
        [#image("../../02_BRAND_ASSETS/rtechlab-header-logo.png", height: 11pt)],
        [#h(6pt) #text(size: 7.5pt, weight: "bold", fill: rtech-navy)[RTechLab Systems Lab] #text(size: 7.5pt, fill: rtech-blue)[ | Windows Server 2025 Hands-On Production Workbook]],
        [#text(size: 7pt, fill: rtech-muted)[Rahul Patel · Support: +91 76468 92094]]
      )
    ]
  },
  
  footer: context {
    let p = counter(page).get().first()
    block(width: 100%, stroke: (top: 0.6pt + rgb("#CBD5E1")), inset: (top: 2mm))[
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [#text(size: 7pt, fill: rtech-muted)[#text(fill: rtech-emerald)[●] 16 Enterprise Production Labs · Step-by-Step PowerShell Automation · WDS PXE Boot · Live Verification Checklists]],
        [#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Page #p of 9]]
      )
    ]
  }
)

#set text(font: "Segoe UI", size: 8pt, fill: rtech-text)

// =============================================================================
// PAGE 01: WORKBOOK MISSION & LAB 01: ISOLATED ENTERPRISE TOPOLOGY SETUP
// =============================================================================
#align(center)[
  #box(fill: rgb("#EFF6FF"), stroke: 1pt + rgb("#BAE6FD"), radius: 3pt, inset: (x: 8pt, y: 3pt))[
    #text(size: 8pt, weight: "black", fill: rtech-blue)[OFFICIAL RTECHLAB INDUSTRIAL SYSTEMS & INFRASTRUCTURE WORKBOOK]
  ]
  #v(2pt)
  #text(size: 15pt, weight: "black", fill: rtech-navy)[Windows Server 2025 Hands-On Lab Workbook]
  #v(1.5pt)
  #text(size: 8pt, fill: rtech-muted)[16 End-to-End Enterprise Production Labs: Active Directory DS, GPO Lockdown, DHCP Failover, WDS Network PXE Boot & Azure Arc]
  #v(3pt)
  #line(length: 100%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(2pt)

#info-box(title: "Enterprise Lab Architecture & Hardware Prerequisites")[
  To execute these 16 production labs without hardware bottlenecks, configure an isolated Virtual Network (Host-Only or Internal Network) with subnet *192.168.10.0/24*. Required host resources: Intel Core i5/i7 or AMD Ryzen 5/7 (6+ cores), 16GB+ RAM (allocating 4GB to DC, 4GB to Member Server, 2GB to Client), and 120GB SSD storage. Disconnect external bridged Wi-Fi adapters from lab VMs to prevent rogue DHCP leases from escaping into your local home router!
]

#v(3pt)

#align(center)[
  #image("../../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png", width: 78%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.1: Enterprise Multi-VM Isolated Network Architecture (Internal VNet `192.168.10.0/24` with DC, Member Server & Client)]
]

#v(3pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 01: Hypervisor Isolated Virtual Network & VM Environment Deployment]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Provision three isolated virtual machines (`SRV-2025-DC01`, `SRV-2025-MBR01`, `CLI-WIN11-01`) attached to an isolated internal network adapter to simulate a real corporate datacenter environment without impacting physical production networks.
    ]
    #v(3pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[Execution Steps & CLI Automation:]
    #text(size: 7.2pt)[
      1. Launch Oracle VM VirtualBox or Microsoft Hyper-V Manager. Navigate to *Tools -> Network Manager -> Host-Only / Internal Networks*.
      2. Create new internal switch named `RTechLab-VNet10` with IPv4 subnet `192.168.10.0/24`. Ensure DHCP server on the hypervisor virtual switch is *Disabled* (we will configure enterprise Windows DHCP in Lab 08).
      3. Create VM 1: `SRV-2025-DC01` (4 vCPUs, 4096MB RAM, 60GB VHDX, Network Adapter set to `RTechLab-VNet10`).
      4. Create VM 2: `SRV-2025-MBR01` (2 vCPUs, 4096MB RAM, 60GB VHDX, Network Adapter set to `RTechLab-VNet10`).
      5. Create VM 3: `CLI-WIN11-01` (2 vCPUs, 4096MB RAM, 60GB VHDX, TPM 2.0 & Secure Boot enabled).
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] All three virtual machines communicate over isolated layer-2 broadcast domain `RTechLab-VNet10`.
      - [x] Hypervisor built-in NAT/DHCP is completely disabled to avoid rogue DORA lease conflicts.
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 02: LAB 02 & LAB 03
// =============================================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 02: Windows Server 2025 OS Deployment: Server Core vs Desktop Experience]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Mount official Windows Server 2025 Evaluation ISO, understand architectural differences during setup, and install Windows Server 2025 Datacenter Desktop Experience.
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/server_setup_os_selection.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.2: Windows Setup OS Selection Screen — Standard vs Datacenter Desktop Experience]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[Execution Steps & CLI Automation:]
    #text(size: 7.2pt)[
      1. Attach `Windows_Server_2025_Eval.iso` to VM optical drive and boot VM into Windows Setup (EFI Boot).
      2. Select *Language: English (United States)* -> *Keyboard: US*. Click *Install Now*.
      3. When prompted, select *Windows Server 2025 Datacenter (Desktop Experience)*. (Server Core eliminates GUI, consuming only 512MB RAM and reducing attack surface by 60%, but Desktop Experience is required for hands-on visual mastery).
      4. Select *Custom: Install Microsoft Server Operating System only (advanced)*. Partition the 60GB drive into unallocated space and proceed.
      5. Post-installation, assign enterprise local administrator password meeting complexity standards: `P@ssw0rd2025!`.
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] OS boots to Ctrl+Alt+Del secure login screen without driver errors.
      - [x] Run `winver` to confirm Windows Server Version 24H2 (OS Build 26100.x).
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 03: Post-Installation Server Hardening, Static IP & Baseline Configuration]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Eliminate random default server names (`WIN-XXXXXX`), configure static enterprise IPv4 addressing, enable Remote Desktop with NLA, and synchronize NTP clock.
    ]
    #v(3pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[PowerShell Hardening Script (Execute as Administrator):]
    ```powershell
    # 1. Rename host to standard corporate DC naming convention and restart
    Rename-Computer -NewName "SRV-2025-DC01" -Restart -Force

    # 2. Configure Static IPv4 on production interface (after reboot)
    $Nic = Get-NetAdapter | Where-Object Status -eq "Up"
    New-NetIPAddress -InterfaceIndex $Nic.ifIndex -IPAddress 192.168.10.10 `
      -PrefixLength 24 -DefaultGateway 192.168.10.1
    Set-DnsClientServerAddress -InterfaceIndex $Nic.ifIndex -ServerAddresses 127.0.0.1, 192.168.10.10

    # 3. Enable Remote Desktop (RDP) with Network Level Authentication (NLA)
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' `
      -Name "fDenyTSConnections" -Value 0
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' `
      -Name "UserAuthentication" -Value 1

    # 4. Sync Server Clock with NTP Pool
    w32tm /config /manualpeerlist:"pool.ntp.org" /syncfromflags:manual /reliable:yes /update
    Restart-Service w32time ; w32tm /resync
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Run `hostname` -> returns `SRV-2025-DC01`. Run `ipconfig /all` -> IPv4 is `192.168.10.10/24`.
      - [x] Test RDP connectivity from client machine via `mstsc /v:192.168.10.10` with NLA enforced.
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 03: LAB 04 & LAB 05
// =============================================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 04: Active Directory Domain Services (AD DS) Role Installation & Root DC Promotion]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Install AD DS binaries and promote `SRV-2025-DC01` to the Root Domain Controller of a new Active Directory Forest named `corp.rtechlab.local` using Server 2025 Forest Functional Level.
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/ad_hierarchy_architecture.png", width: 66%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.3: Active Directory Logical Hierarchy — Forest Root Domain, Child Domains & Tiered OUs]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[PowerShell AD DS Promotion Automation:]
    ```powershell
    # Install AD DS Binaries and RSAT Management Tools
    Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

    # Promote to Root Domain Controller in New Forest
    Import-Module ADDSDeployment
    Install-ADDSForest `
      -CreateDnsDelegation:$false `
      -DatabasePath "C:\Windows\NTDS" `
      -DomainMode "WinThreshold" `
      -DomainName "corp.rtechlab.local" `
      -DomainNetbiosName "CORP" `
      -ForestMode "WinThreshold" `
      -InstallDns:$true `
      -LogPath "C:\Windows\NTDS" `
      -NoRebootOnCompletion:$false `
      -SysvolPath "C:\Windows\SYSVOL" `
      -SafeModeAdministratorPassword (ConvertTo-SecureString "DSRM@P@ssw0rd2025!" -AsPlainText -Force) `
      -Force:$true
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Run `Get-ADDomainController -Identity SRV-2025-DC01` to verify operational status.
      - [x] Execute `netdom query fsmo` -> confirms all 5 FSMO roles reside on `SRV-2025-DC01.corp.rtechlab.local`.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 05: Enterprise Tiered OU Hierarchy, Bulk User Provisioning & AGDLP Model]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Build a secure 3-Tier OU structure (`Tier 0 - Admins`, `Tier 1 - Servers`, `Tier 2 - Endpoints/Users`) and implement the AGDLP access control framework for file permissions.
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/ou_hierarchy_agdlp.png", width: 66%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.4: Enterprise AGDLP Role-Based Access Control Architecture (Accounts -> Global -> Domain Local -> Permissions)]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[PowerShell Bulk OU & User Provisioning:]
    ```powershell
    # 1. Create Enterprise Tiered OU Structure
    New-ADOrganizationalUnit -Name "RTechLab_Corp" -Path "DC=corp,DC=rtechlab,DC=local"
    $ParentOU = "OU=RTechLab_Corp,DC=corp,DC=rtechlab,DC=local"
    @("Tier0_Admins", "Tier1_Servers", "Tier2_Workstations", "Departments", "Security_Groups") | ForEach-Object {
      New-ADOrganizationalUnit -Name $_ -Path $ParentOU
    }
    @("IT", "Finance", "HR", "Sales") | ForEach-Object {
      New-ADOrganizationalUnit -Name $_ -Path "OU=Departments,$ParentOU"
    }

    # 2. Implement AGDLP Security Groups for Finance
    New-ADGroup -Name "GG_Finance_Users" -GroupScope Global -Path "OU=Security_Groups,$ParentOU"
    New-ADGroup -Name "DL_Finance_Share_RW" -GroupScope DomainLocal -Path "OU=Security_Groups,$ParentOU"
    Add-ADGroupMember -Identity "DL_Finance_Share_RW" -Members "GG_Finance_Users"

    # 3. Create Sample Domain User & Add to Global Group
    $SecPass = ConvertTo-SecureString "User@2025RTech!" -AsPlainText -Force
    New-ADUser -Name "Rahul Sharma" -SamAccountName "rsharma" -UserPrincipalName "rsharma@corp.rtechlab.local" `
      -Path "OU=IT,OU=Departments,$ParentOU" -AccountPassword $SecPass -Enabled $true -PasswordNeverExpires $false
    Add-ADGroupMember -Identity "GG_Finance_Users" -Members "rsharma"
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Run `Get-ADOrganizationalUnit -Filter * -SearchBase $ParentOU` to confirm complete directory tree.
      - [x] Run `Get-ADGroupMember -Identity "DL_Finance_Share_RW"` -> verifies nested membership via `GG_Finance_Users`.
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 04: LAB 06 & LAB 07
// =============================================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 06: Client Machine (Windows 10/11) Enterprise Domain Join Walkthrough]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Configure client DNS resolving to DC, test SRV records, join client workstation `CLI-WIN11-01` to `corp.rtechlab.local`, and verify Kerberos ticket acquisition (`klist`).
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/domain_join_flow.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.5: Client Domain Join Protocol Flow — DNS SRV Resolution, LDAP Ping & Machine Account Creation]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[Execution Steps & Client CLI Automation:]
    ```powershell
    # On Client (CLI-WIN11-01): Point Primary DNS to DC IP (Golden Rule)
    $ClientNic = Get-NetAdapter | Where-Object Status -eq "Up"
    Set-DnsClientServerAddress -InterfaceIndex $ClientNic.ifIndex -ServerAddresses 192.168.10.10

    # Test DNS SRV record resolution for Active Directory Kerberos
    nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.rtechlab.local

    # Execute Enterprise Domain Join (prompting for Domain Admin credentials)
    $Credential = Get-Credential
    Add-Computer -DomainName "corp.rtechlab.local" -Credential $Credential `
      -OUPath "OU=Tier2_Workstations,OU=RTechLab_Corp,DC=corp,DC=rtechlab,DC=local" -Restart -Force
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Client computer reboots and displays `Sign in to: CORP` on lock screen.
      - [x] Log in as `CORP\rsharma`. Run `klist` in Command Prompt to inspect issued TGT Kerberos ticket.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 07: Group Policy Objects (GPO): Removable Storage Lockdown & Password Policies]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Enforce corporate security baseline using GPMC: disable USB flash drive write access for workstations, enforce 14-character passwords, and automate policy refresh (`gpupdate /force`).
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/gpo_inheritance_lsdou.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.6: Group Policy Hierarchy & LSDOU Processing Precedence (Local -> Site -> Domain -> OU)]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[Execution Steps & GPO Automation:]
    #text(size: 7.2pt)[
      1. On `SRV-2025-DC01`, open *Group Policy Management (`gpmc.msc`)*.
      2. Right-click `OU=Tier2_Workstations` -> select *Create a GPO in this domain, and Link it here...* Name it: `GPO_Workstation_Security_Baseline`.
      3. Right-click GPO -> *Edit*. Navigate to: *Computer Configuration -> Administrative Templates -> System -> Removable Storage Access*.
      4. Locate policy: *Removable Disks: Deny write access* -> Set to *Enabled*. (Prevents data exfiltration and USB ransomware vectors).
      5. Navigate to *Default Domain Policy -> Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Account Policies -> Password Policy*: Enforce Minimum Password Length = 14 characters, Account Lockout Threshold = 5 invalid attempts.
      6. On Client machine, open PowerShell as Admin and execute `gpupdate /force`.
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Run `gpresult /r` on client -> confirms `GPO_Workstation_Security_Baseline` applied under Computer Settings.
      - [x] Insert virtual USB drive on client -> verify write access is denied with "Access Denied" dialog.
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 05: LAB 08 & LAB 09
// =============================================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 08: Enterprise DHCP Server: Scope Options & High-Availability Failover]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Install DHCP Server role on Windows Server 2025, authorize in Active Directory, configure Scope `192.168.10.100-200` with Scope Options (003, 006, 015), and build an 80/20 Failover Partner.
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/dhcp_dora_process.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.7: DHCP DORA 4-Step Handshake Protocol & Enterprise Split-Scope Architecture]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[PowerShell Enterprise DHCP Script:]
    ```powershell
    # 1. Install DHCP Role and RSAT Management Tools
    Install-WindowsFeature -Name DHCP -IncludeManagementTools

    # 2. Authorize DHCP Server in Active Directory Forest
    Add-DhcpServerInDC -DnsName "SRV-2025-DC01.corp.rtechlab.local" -IPAddress 192.168.10.10

    # 3. Create Enterprise IPv4 Scope
    Add-DhcpServerv4Scope -Name "RTechLab_Office_VNet10" -StartRange 192.168.10.100 `
      -EndRange 192.168.10.200 -SubnetMask 255.255.255.0 -State Active -LeaseDuration (New-TimeSpan -Days 8)

    # 4. Configure Essential Scope Options
    Set-DhcpServerv4OptionValue -ScopeId 192.168.10.0 `
      -OptionId 3 -Value 192.168.10.1 `          # Router / Default Gateway
      -OptionId 6 -Value 192.168.10.10 `         # DNS Server
      -OptionId 15 -Value "corp.rtechlab.local"   # DNS Domain Name

    # 5. Create Static DHCP Reservation for Network Printer
    Add-DhcpServerv4Reservation -ScopeId 192.168.10.0 -IPAddress 192.168.10.150 `
      -ClientId "00-11-22-33-44-55" -Name "HP_ColorLaserJet_Floor2" -Description "Static Printer Reservation"
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] On client machine, run `ipconfig /renew` -> receives lease in `192.168.10.100-200` range.
      - [x] Run `Get-DhcpServerv4Lease -ScopeId 192.168.10.0` on DC -> client hostname and MAC appear in active leases table.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 09: Active Directory-Integrated DNS: Forward/Reverse Zones & Scavenging]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Create Reverse Lookup Zone (`10.168.192.in-addr.arpa`), configure CNAME / A records, set external forwarders (`1.1.1.1`, `8.8.8.8`), and automate stale record scavenging.
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/dns_architecture_zones.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.8: Active Directory-Integrated DNS Architecture — Secure Dynamic Updates & Multi-Master Replication]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[PowerShell DNS Configuration Script:]
    ```powershell
    # 1. Create Active Directory-Integrated Reverse Lookup Zone
    Add-DnsServerPrimaryZone -NetworkId "192.168.10.0/24" -ReplicationScope "Forest"

    # 2. Add Corporate Host (A) and PTR Records
    Add-DnsServerResourceRecordA -Name "intranet" -ZoneName "corp.rtechlab.local" `
      -IPv4Address 192.168.10.25 -CreatePtr

    # 3. Add Alias (CNAME) Record for Web Services
    Add-DnsServerResourceRecordCName -Name "portal" -ZoneName "corp.rtechlab.local" `
      -HostNameAlias "intranet.corp.rtechlab.local"

    # 4. Configure Public DNS Forwarders (Cloudflare & Google)
    Set-DnsServerForwarder -IPAddress 1.1.1.1, 8.8.8.8 -PassThru

    # 5. Enable DNS Aging and Automatic Scavenging (7 Days No-Refresh / 7 Days Refresh)
    Set-DnsServerZoneAging -ZoneName "corp.rtechlab.local" -Aging $true -NoRefreshInterval (New-TimeSpan -Days 7) `
      -RefreshInterval (New-TimeSpan -Days 7)
    Set-DnsServerScavenging -ScavengingState $true -ScavengingInterval (New-TimeSpan -Days 7)
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Run `Resolve-DnsName portal.corp.rtechlab.local` -> resolves to `192.168.10.25`.
      - [x] Reverse lookup test: `Resolve-DnsName 192.168.10.25` -> returns `intranet.corp.rtechlab.local`.
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 06: LAB 10 & LAB 11
// =============================================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 10: File Server Resource Manager (FSRM): Quotas & Anti-Ransomware Screening]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Install FSRM role, enforce 5GB Hard Quotas on shared department folders, and deploy real-time passive/active file screening to block `.locky`, `.crypto`, `.wnry` ransomware extensions.
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/ntfs_vs_share_matrix.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.9: File Server Access Control — Share Permissions vs NTFS Security Precedence Matrix]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[PowerShell FSRM Hardening Automation:]
    ```powershell
    # 1. Install File Server Resource Manager Role
    Install-WindowsFeature -Name FS-Resource-Manager -IncludeManagementTools

    # 2. Create Shared Department Data Directory
    New-Item -ItemType Directory -Path "C:\CorporateData\Finance" -Force
    New-SmbShare -Name "FinanceData$" -Path "C:\CorporateData\Finance" `
      -FullAccess "CORP\Domain Admins" -ChangeAccess "CORP\DL_Finance_Share_RW"

    # 3. Create 5GB Hard Quota on Finance Share
    New-FsrmQuota -Path "C:\CorporateData\Finance" -Size 5GB -Type Hard

    # 4. Create Anti-Ransomware File Screening Group
    New-FsrmFileGroup -Name "Ransomware_Signatures" `
      -IncludePattern @("*.locked", "*.crypto", "*.wnry", "*.locky", "*.encrypted")

    # 5. Apply Active File Screen (Blocks file creation immediately)
    New-FsrmFileScreen -Path "C:\CorporateData\Finance" -IncludeGroup "Ransomware_Signatures" -Active
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Attempt to copy file `budget.docx.wnry` into `\\SRV-2025-DC01\FinanceData$` -> Windows blocks operation with Access Denied.
      - [x] Check Event Viewer -> Applications and Services Logs -> Microsoft -> Windows -> FSRM -> event generated.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 11: IIS 10.0 Web Server Hosting, HTTPS SSL Binding & Application Pool Security]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Install IIS Web Server, create dedicated Application Pool with isolated identity, generate self-signed SSL/TLS certificate, and bind secure HTTPS on Port 443.
    ]
    #v(3pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[PowerShell IIS Deployment & SSL Binding:]
    ```powershell
    # 1. Install IIS Role with Management Tools
    Install-WindowsFeature -Name Web-Server -IncludeManagementTools

    # 2. Create Web Content Directory and Sample Landing Page
    New-Item -ItemType Directory -Path "C:\inetpub\RTechLabPortal" -Force
    Set-Content -Path "C:\inetpub\RTechLabPortal\index.html" `
      -Value "<html><body><h1>Welcome to RTechLab Enterprise Portal (IIS 10.0)</h1></body></html>"

    # 3. Create Dedicated Isolated Application Pool
    Import-Module WebAdministration
    New-WebAppPool -Name "PortalAppPool"
    Set-ItemProperty -Path "IIS:\AppPools\PortalAppPool" -Name "processModel.identityType" -Value "ApplicationPoolIdentity"

    # 4. Create Self-Signed SSL Certificate for HTTPS
    $Cert = New-SelfSignedCertificate -DnsName "portal.corp.rtechlab.local" `
      -CertStoreLocation "cert:\LocalMachine\My"

    # 5. Create Secure HTTPS Web Site
    New-WebSite -Name "RTechLabPortal" -Port 443 -Protocol https `
      -PhysicalPath "C:\inetpub\RTechLabPortal" -ApplicationPool "PortalAppPool" `
      -SslFlags 0 -CertificateThumbprint $Cert.Thumbprint
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] From client browser, navigate to `https://portal.corp.rtechlab.local` -> secure page renders over Port 443.
      - [x] Verify Application Pool runs under sandboxed `IIS AppPool\PortalAppPool` virtual account.
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 07: LAB 12 & LAB 13
// =============================================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 12: Remote Desktop Services (RDS), Session Collections & RemoteApp Publishing]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Deploy RDS Session Host role, create a Session Collection for Finance, publish RemoteApp programs (Excel, Notepad, Accounting tool), and test web access via RD Web (`https://server/rdweb`).
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/iis_rds_architecture.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.10: Remote Desktop Services (RDS) Multi-Tier Enterprise Architecture (RD Web, Gateway, Broker & Session Host)]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[Execution Steps & RDS PowerShell Script:]
    ```powershell
    # 1. Install Remote Desktop Session Host & Web Access Roles
    Install-WindowsFeature -Name RDS-RD-Server, RDS-Web-Access -IncludeManagementTools

    # 2. In Server Manager, deploy Quick-Start Session-Based RDS Deployment
    # 3. Create Session Collection named "Finance_Desktops" restricted to GG_Finance_Users
    # 4. Publish Core Corporate RemoteApp Programs
    New-RDRemoteApp -CollectionName "Finance_Desktops" -DisplayName "Corporate Calculator" `
      -FilePath "C:\Windows\System32\calc.exe" -Alias "calc"

    New-RDRemoteApp -CollectionName "Finance_Desktops" -DisplayName "PowerShell Admin Console" `
      -FilePath "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Alias "powershell"
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Open web browser on client machine and navigate to `https://SRV-2025-DC01.corp.rtechlab.local/rdweb`.
      - [x] Log in as `CORP\rsharma` -> launch published RemoteApp; verify app executes on server while rendering on client.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 13: Hyper-V Virtualization: NAT Virtual Switch & Nested VM Deployment]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Enable Hyper-V hypervisor, construct an internal NAT Virtual Switch with automated address translation, and script automated VM provisioning with dynamically expanding VHDX storage.
    ]
    #v(3pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[PowerShell Hyper-V Automation Script:]
    ```powershell
    # 1. Install Hyper-V Role & PowerShell Module
    Install-WindowsFeature -Name Hyper-V, Hyper-V-PowerShell -IncludeManagementTools -Restart

    # 2. Create Internal Virtual Switch
    New-VMSwitch -Name "HyperV_Internal_Switch" -SwitchType Internal

    # 3. Configure Default Gateway on NAT Virtual Interface
    $NatNic = Get-NetAdapter | Where-Object Name -like "*HyperV_Internal_Switch*"
    New-NetIPAddress -InterfaceIndex $NatNic.ifIndex -IPAddress 192.168.100.1 -PrefixLength 24

    # 4. Create NAT Network Object for External Outbound Internet Access
    New-NetNat -Name "HyperV_NAT_Network" -InternalIPInterfaceAddressPrefix "192.168.100.0/24"

    # 5. Provision Automated Production VM
    New-VM -Name "VM-AppServer-01" -MemoryStartupBytes 4GB -Generation 2 `
      -NewVHDPath "C:\HyperV_Disks\AppServer01.vhdx" -NewVHDSizeBytes 50GB `
      -SwitchName "HyperV_Internal_Switch"
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Run `Get-VM` in PowerShell -> confirms `VM-AppServer-01` created in Generation 2 UEFI mode.
      - [x] Test outbound ping from nested VM through NAT gateway `192.168.100.1`.
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 08: LAB 14 & LAB 15 (WDS PXE BOOT & AZURE ARC)
// =============================================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 14: Windows Deployment Services (WDS): PXE Network Boot & OS Imaging]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Install WDS role, configure PXE boot response for client bare-metal machines, import `boot.wim` and `install.wim` from Server 2025 ISO, and deploy operating systems across LAN without USB drives.
    ]
    #v(3pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[Execution Steps & WDS CLI Configuration:]
    ```powershell
    # 1. Install Windows Deployment Services Role
    Install-WindowsFeature -Name WDS -IncludeManagementTools

    # 2. Initialize WDS RemoteInstall Directory
    wdsutil /Initialize-Server /REMINST:"C:\RemoteInstall"

    # 3. Configure PXE Answer Policy (Respond to all known and unknown client computers)
    wdsutil /Set-Server /AnswerClients:All

    # 4. Add Boot Image (from mounted Server 2025 ISO: D:\sources\boot.wim)
    wdsutil /Add-Image /ImageFile:"D:\sources\boot.wim" /ImageType:Boot /Name:"Windows Server 2025 Boot Image"

    # 5. Create Image Group and Add Operating System Install Image
    wdsutil /Add-ImageGroup /ImageGroup:"Production_Servers"
    wdsutil /Add-Image /ImageFile:"D:\sources\install.wim" /ImageType:Install `
      /ImageGroup:"Production_Servers" /SingleImage:"Windows Server 2025 Datacenter (Desktop Experience)"

    # 6. Configure DHCP Option 66 (TFTP Server) & Option 67 (Bootfile Name) if DHCP is separate
    # In same-server setups: wdsutil /Set-Server /UseDHCPPorts:No /DHCPPort60:Yes
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Boot a new blank VM with Network PXE Boot enabled (F12) -> contacts WDS TFTP server.
      - [x] Verify Windows PE bootstrap loads over network and displays Windows Server 2025 installation wizard!
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 15: Windows Server 2025 Hotpatching & Hybrid Azure Arc Connected Machine Agent]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Onboard on-premises Windows Server 2025 instance to Azure Arc Resource Manager, inspect Hybrid Runbook Worker, and enable Hotpatching to install critical security updates without rebooting.
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/server2025_azure_hotpatching.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.11: Windows Server 2025 Next-Gen Features — Azure Arc Governance, Hotpatching & SMB over QUIC]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[Execution Steps & Azure Connected Machine Agent Onboarding:]
    ```powershell
    # 1. Download Azure Connected Machine Agent Onboarding Package
    Invoke-WebRequest -Uri "https://aka.ms/AzureConnectedMachineAgent" -OutFile "AzureConnectedMachineAgent.msi"
    msiexec /i AzureConnectedMachineAgent.msi /qn

    # 2. Connect On-Prem Server to Azure Arc Resource Group
    & "$env:ProgramFiles\AzureConnectedMachineAgent\azcmagent.exe" connect `
      --service-principal-id "<AZURE_SP_ID>" `
      --service-principal-secret "<AZURE_SP_SECRET>" `
      --resource-group "RTechLab_Hybrid_Infra" `
      --tenant-id "<AZURE_TENANT_ID>" `
      --location "centralindia" `
      --subscription-id "<AZURE_SUBSCRIPTION_ID>"

    # 3. Check Arc Agent Connection Status
    & "$env:ProgramFiles\AzureConnectedMachineAgent\azcmagent.exe" show
    ```
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-emerald)[Verification Checklist:]
    #text(size: 7.2pt)[
      - [x] Run `azcmagent check` -> reports agent connected and heartbeating to Azure Resource Manager.
      - [x] In Azure Portal -> Azure Arc -> Servers -> verify `SRV-2025-DC01` appears with Status: *Connected*.
    ]
  ]
)

#pagebreak()

// =============================================================================
// PAGE 09: LAB 16 & SYSADMIN CLI COMMAND REFERENCE MATRIX
// =============================================================================
#block(
  width: 100%,
  stroke: 1pt + rgb("#CBD5E1"),
  radius: 5pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 8pt, y: 6pt),
  [
    #text(weight: "black", size: 9pt, fill: rtech-navy)[LAB 16: Disaster Recovery: Active Directory Recycle Bin, VSS & Bare-Metal Recovery]     #v(2pt)
    #text(size: 7.5pt)[
      *Objective:* Enable optional AD Recycle Bin feature, simulate accidental deletion of corporate user accounts and OUs, restore objects with full SID / group memberships intact, and execute VSS system state backup.
    ]
    #v(3pt)
    #align(center)[
      #image("../../02_BRAND_ASSETS/screenshots/backup_disaster_recovery_flow.png", width: 68%)
      #v(1pt)
      #text(size: 7pt, fill: rtech-muted, style: "italic")[Figure W.12: Enterprise Disaster Recovery Architecture — VSS Shadow Copies, AD Recycle Bin & Bare-Metal wbadmin]
    ]
    #v(2pt)
    #text(weight: "bold", size: 7.8pt, fill: rtech-blue)[Disaster Recovery Automation Script:]
    ```powershell
    # 1. Enable Active Directory Recycle Bin (Forest-wide irreversible command)
    Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target 'corp.rtechlab.local' -Force

    # 2. Simulate Disaster: Delete User Account
    Remove-ADUser -Identity "rsharma" -Confirm:$false

    # 3. Instant 100% Granular Recovery from Deleted Objects Container
    Get-ADObject -Filter 'isDeleted -eq $true -and name -ne "Deleted Objects"' -IncludeDeletedObjects |
      Restore-ADObject

    # 4. Execute Full System State Backup to Dedicated VHD
    Install-WindowsFeature -Name Windows-Server-Backup -IncludeManagementTools
    wbadmin start systemstatebackup -backupTarget:E: -quiet
    ```
  ]
)

#v(4pt)

#text(weight: "black", size: 9pt, fill: rtech-navy)[Essential Systems Administrator CLI & PowerShell Cmdlet Quick-Reference Matrix]
#v(2pt)

#table(
  columns: (1.2fr, 2.8fr, 1fr),
  stroke: 0.5pt + rgb("#64748B"),
  fill: (col, row) => if row == 0 { rgb("#E2E8F0") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  inset: (x: 5pt, y: 3.5pt),
  align: (left, left, center),
  
  [#text(weight: "bold", fill: white, size: 7.5pt)[PowerShell / CLI Command]],
  [#text(weight: "bold", fill: white, size: 7.5pt)[Enterprise Production Purpose & Function]],
  [#text(weight: "bold", fill: white, size: 7.5pt)[Scope]],

  [`netdom query fsmo`], [Queries all 5 FSMO role holders across the Active Directory Forest], [Domain],
  [`dcdiag /v /c /q`], [Executes comprehensive diagnostic health check on all Domain Controller services], [DC Health],
  [`repadmin /showrepl`], [Displays Active Directory inbound replication status and partner latency], [Replication],
  [`repadmin /syncall /AdeP`], [Forces immediate synchronization across all directory partition partners], [Replication],
  [`gpupdate /force`], [Forces immediate background refresh of Computer and User Group Policy objects], [Client/GPO],
  [`gpresult /r /v`], [Generates verbose RSoP report of all applied GPOs and security groups on endpoint], [GPO Triage],
  [`Test-ComputerSecureChannel`], [Verifies and repairs broken trust relationship between client machine and DC], [Trust],
  [`Get-SmbOpenFile | Close-SmbOpenFile`], [Inspects and terminates locked SMB file handles on File Server], [Storage],
  [`Clear-DnsServerCache`], [Purges local DNS server cache memory to force authoritative resolution], [DNS],
  [`w32tm /query /status`], [Displays local time source and NTP synchronization offset in milliseconds], [Clock Sync]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1pt + rgb("#0284C7"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #text(size: 8pt, weight: "black", fill: rtech-navy)[LAB WORKBOOK COMPLETION & ENTERPRISE SIGN-OFF]         #text(size: 7.2pt, fill: rtech-muted)[
          Student Name: #box(width: 110pt, stroke: (bottom: 0.8pt + rgb("#94A3B8")))[ ] · Date: #box(width: 60pt, stroke: (bottom: 0.8pt + rgb("#94A3B8")))[ ] · Verified by Rahul Patel (RTechLab Architect)
        ]
      ],
      [
        #text(size: 7.2pt, weight: "bold", fill: rtech-blue)[24x7 Help: +91 76468 92094 · rahul.28e1\@gmail.com]
      ]
    )
  ]
)
