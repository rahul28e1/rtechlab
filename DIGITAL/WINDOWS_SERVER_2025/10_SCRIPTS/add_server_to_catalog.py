with open("src/data/notesCatalog.js", "r", encoding="utf-8") as f:
    catalog_content = f.read()

server_entry = """  {
    id: 'server2025',
    code: 'RTL-2027-WINSRV',
    badge: 'HOT 2027 · SERVER 2025 & AD DS',
    badgeColor: 'text-[#0284C7] bg-[#0284C7]/10 border-[#0284C7]/30',
    title: 'Microsoft Windows Server 2025 & Active Directory Administration',
    titleHi: 'माइक्रोसॉफ्ट विंडोज सर्वर 2025 एवं एक्टिव डायरेक्टरी प्रशासन (Master Suite)',
    tagline: 'Active Directory (AD DS), Group Policy (GPO), DNS & DHCP, Hotpatching, 32KB AD DB, SMB over QUIC, ₹18 LPA Salary Blueprint & Top 50 MNC Placement Vault',
    taglineHi: 'एक्टिव डायरेक्टरी (AD DS), ग्रुप पॉलिसी (GPO), DNS व DHCP, हॉटपैचिंग, ReFS, हाइब्रिड अज़ूर आर्क, ₹18 LPA सैलरी ब्लूप्रिंट एवं टॉप 50 MNC प्लेसमेंट वॉल्ट',
    price: 49,
    bundlePrice: 149,
    pages: '140 Pages (Complete 6-in-1 Master Suite)',
    pagesNum: 140,
    edition: 'Edition 1 (2027 Server 2025 Enterprise Edition)',
    author: 'Rahul Patel (Founder & Chief Architect, RTechLab)',
    accentColor: '#0284C7',
    previewPdfEn: '/downloads/Windows-Server-2025-English-Master-Guide.pdf',
    fullPdfEn: '/downloads/Windows-Server-2025-English-Master-Guide.pdf',
    previewPdfHi: '/downloads/Windows-Server-2025-Hindi-Master-Guide.pdf',
    fullPdfHi: '/downloads/Windows-Server-2025-Hindi-Master-Guide.pdf',
    bundleZip: '/downloads/Windows-Server-2025-Career-Accelerator-Bundle.zip',
    photoHighlights: [
      'Client-Server Architecture: 8 Core Enterprise Roles (DC, DNS, DHCP, File, IIS, RDS)',
      'Isolated Multi-VM Virtual Network Topology & VirtualBox/Hyper-V Lab Setup',
      'Active Directory Logical & Physical Hierarchy: Forests, Domains, Sites & OUs',
      'The 5 FSMO Roles: Schema, Domain Naming, PDC Emulator, RID & Infrastructure',
      'Tiered OU Structure, Bulk User Provisioning & AGDLP Access Control Framework',
      'Client Endpoint Domain Join (Win 10/11) & Kerberos Authentication Protocol',
      'Group Policy Engine: LSDOU Processing, Removable USB Lockdown & LAPS',
      'DHCP DORA 4-Step Protocol, Scope Options (003/006/015) & 80/20 Failover',
      'AD-Integrated DNS Zones, Forwarders & Aging/Scavenging Automation',
      'File Server Resource Manager (FSRM) Hard Quotas & Anti-Ransomware Screening',
      'IIS 10.x Web Server, SSL/TLS HTTPS Port 443 Binding & Secure FTP User Isolation',
      'Server 2025 Flagship: Zero-Reboot Hotpatching, 32KB AD DB & SMB over QUIC',
      'Enterprise 3-2-1 Backup Strategy, wbadmin Automation & 1-Click AD Recycle Bin',
      'Top 50 MNC Systems Administrator Placement Vault & Real Field Incident Fixes',
      '2027 Compensation Matrix: L1 to Cloud Architect (₹3.5 LPA to ₹18+ LPA)',
      'High-Income Freelance & Corporate SME AMC Blueprint (₹50k to ₹1.5L/Month)'
    ],
    chapters: [
      {
        num: '01',
        title: 'Server Architecture, Types & 32-Year Evolution',
        titleHi: 'सर्वर आर्किटेक्चर, सर्वर के प्रकार एवं 32-वर्षीय इतिहास',
        pages: 'Page 04',
        topics: [
          'Client-Server Model vs Distributed P2P',
          '8 Core Enterprise Roles: DC, DNS, DHCP, File, Web, DB, RDS, Backup',
          'Physical Bare-Metal vs Hyper-V vs Hybrid Azure Arc',
          '1993 NT 3.1 to 2025 Evolution Timeline & Win 11 vs Server 2025',
          '5 Practice MCQs, 5 MNC Placement Interview Questions & Takeaways'
        ]
      },
      {
        num: '02',
        title: 'Hands-On Lab Setup: Server 2025 ISO & VM Config',
        titleHi: 'प्रैक्टिकल होम लैब सेटअप: Server 2025 ISO एवं VM कॉन्फ़िगरेशन',
        pages: 'Page 09',
        topics: [
          'Hardware Requirements & Virtualization (VT-x/AMD-V) Verification',
          'RTechLab Isolated Virtual Network Topology & Subnet Design',
          'Microsoft Evaluation Center 180-Day ISO Download',
          'VirtualBox VM Setup: 4GB RAM, 2 vCPUs, Dynamic VHDX',
          'Desktop Experience vs Minimal Core Installation & First Boot'
        ]
      },
      {
        num: '03',
        title: 'Post-Installation Baseline & Hardening',
        titleHi: 'पोस्ट-इंस्टॉलेशन कॉन्फ़िगरेशन एवं सर्वर हार्डनिंग',
        pages: 'Page 14',
        topics: [
          'Server Manager Dashboard Navigation & Role Management',
          'Standard Host Naming Convention (`SRV-2025-DC01`)',
          'Enterprise Static IPv4 & Loopback DNS Assignment (127.0.0.1)',
          'Enabling Remote Desktop (RDP) & Network Level Authentication (NLA)',
          'Windows Defender Firewall Baseline & NTP Clock Sync'
        ]
      },
      {
        num: '04',
        title: 'Active Directory Domain Services & Root DC Promotion',
        titleHi: 'एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) एवं DC प्रमोशन',
        pages: 'Page 18',
        topics: [
          'What is AD DS: Centralized Identity, Kerberos & `ntds.dit`',
          'Logical Architecture (Forest, Domain, OU) vs Physical Sites',
          'Step-by-Step Add Roles Wizard & Promoting `corp.rtechlab.local`',
          'Directory Services Restore Mode (DSRM) Password Importance',
          'The 5 FSMO Roles: Forest-Wide vs Domain-Wide Master Architecture'
        ]
      },
      {
        num: '05',
        title: 'ADUC Console: OUs, Domain Users & Groups (AGDLP)',
        titleHi: 'ADUC कंसोल: OUs, डोमेन यूजर्स एवं सिक्योरिटी ग्रुप्स',
        pages: 'Page 23',
        topics: [
          'ADUC (`dsa.msc`) Console Overview & Object Navigation',
          'Designing Enterprise Tiered OU Hierarchy (IT, HR, Finance)',
          'User Lifecycle: Password Complexity, Expiry & Account Lockout',
          'Security Groups vs Distribution Groups (Group Types & Scopes)',
          'AGDLP Role-Based Access Control & Bulk PowerShell Creation'
        ]
      },
      {
        num: '06',
        title: 'Client Domain Join Walkthrough & Kerberos Test',
        titleHi: 'क्लाइंट मशीन (Win 10/11) डोमेन जॉइन वॉकथ्रू',
        pages: 'Page 27',
        topics: [
          'Client Prerequisites & Operating System Edition Requirements',
          'The Golden DNS Rule: Pointing Primary DNS to DC IP (192.168.1.10)',
          'Verifying Connectivity & `nslookup` SRV Locator Records',
          'Step-by-Step Domain Join Procedure via System Properties (`sysdm.cpl`)',
          'Top 5 Domain Join Errors, Root Causes & First Domain Login'
        ]
      },
      {
        num: '07',
        title: 'Group Policy Objects (GPO) & Security Baseline',
        titleHi: 'ग्रुप पॉलिसी ऑब्जेक्ट्स (GPO): एंटरप्राइज सुरक्षा नियंत्रण',
        pages: 'Page 31',
        topics: [
          'What is GPO: Centralized Configuration & Governance',
          'GPMC Console (`gpmc.msc`) & Computer vs User Configurations',
          'LSDOU Inheritance Hierarchy, Block Inheritance & Enforced (No Override)',
          'Lab 1: Password Policy GPO, Lab 2: Removable USB Lockdown GPO',
          'Lab 3: Wallpaper Deployment, `gpupdate /force` & `gpresult` Reports'
        ]
      },
      {
        num: '08',
        title: 'DHCP Server Role: Scopes, Reservations & Failover',
        titleHi: 'DHCP सर्वर कॉन्फ़िगरेशन: स्कोप, रिज़र्वेशन एवं फेलओवर',
        pages: 'Page 35',
        topics: [
          'Why DHCP: Eliminating Manual IP Conflicts & Rogue DHCP Protection',
          'Technical Breakdown of 4-Step DORA Protocol (Discover, Offer, Request, Ack)',
          'Installing DHCP Role & Authorizing in Active Directory',
          'Creating Scopes: IP Range, Subnet Mask, Lease Duration & Exclusions',
          'Configuring Scope Options (003, 006, 015) & 80/20 Failover Clusters'
        ]
      },
      {
        num: '09',
        title: 'DNS Server Architecture: Zones, Records & Scavenging',
        titleHi: 'DNS सर्वर आर्किटेक्चर: ज़ोन, रिकॉर्ड्स एवं स्कैवेंजिंग',
        pages: 'Page 39',
        topics: [
          'Enterprise Role of DNS & Integration with Active Directory',
          'AD-Integrated Zones: Multi-Master Replication & Secure Dynamic Updates',
          'Forward Lookup Zones vs Reverse Lookup Zones (PTR)',
          'Core Resource Records: A, AAAA, PTR, CNAME, MX & SRV Records',
          'Root Hints vs Forwarders, DNS Aging & Automated Scavenging'
        ]
      },
      {
        num: '10',
        title: 'File Server (FSRM), NTFS Permissions & Quotas',
        titleHi: 'फाइल सर्वर (FSRM), NTFS अनुमतियां एवं कोटा प्रबंधन',
        pages: 'Page 43',
        topics: [
          'Enterprise File Servers & SMB 3.1.1 Protocol Overview',
          'Share vs NTFS Permissions: The Most Restrictive Rule Formula',
          'Installing File Server Resource Manager (FSRM) Role Service',
          'Hard Storage Quotas vs Soft Quotas (85% Warning Threshold)',
          'Active File Screening: Blocking Ransomware Extensions (*.crypto, *.locky)'
        ]
      },
      {
        num: '11',
        title: 'IIS 10.x Web Server, SSL HTTPS & Remote Desktop',
        titleHi: 'IIS वेब सर्वर, SSL HTTPS बाइंडिंग एवं RDS',
        pages: 'Page 47',
        topics: [
          'Introduction to IIS 10.x Architecture & Isolated Application Pools',
          'Creating Intranet Web Portals & Site Port Bindings',
          'Generating SSL/TLS Certificate & Port 443 HTTPS Binding',
          'Configuring Secure FTP Server & User Isolation Directories',
          'Remote Desktop Services (RDS / VDI) 5-Role High-Availability Architecture'
        ]
      },
      {
        num: '12',
        title: 'Server 2025 Next-Gen Features & Hybrid Azure Arc',
        titleHi: 'Server 2025 नेक्स्ट-जेन फीचर्स एवं हाइब्रिड अज़ूर आर्क',
        pages: 'Page 50',
        topics: [
          'The 5 Flagship Server 2025 Innovations Overview',
          'Live Hotpatching: Applying Security Patches in Memory Without Rebooting',
          '32KB AD DS Database Page Size: 10x Replication & Object Capacity',
          'Next-Gen ReFS Storage Deduplication & Real-Time Block Compression',
          'SMB over QUIC (Zero-VPN Remote Access) & Azure Arc Hybrid Onboarding'
        ]
      },
      {
        num: '13',
        title: 'Enterprise Disaster Recovery & AD Recycle Bin',
        titleHi: 'सर्वर बैकअप, डिज़ास्टर रिकवरी एवं AD रीसायकल बिन',
        pages: 'Page 53',
        topics: [
          'The 3-2-1 Enterprise Backup Rule: 3 Copies, 2 Media, 1 Offsite/Cloud',
          'Installing & Configuring Windows Server Backup Role',
          'Full Server Backup vs System State Backup on Domain Controllers',
          'Enabling Active Directory Recycle Bin & 1-Click Online Object Restore',
          'Automated Command-Line Backup Scripts using PowerShell & `wbadmin`'
        ]
      },
      {
        num: '14',
        title: 'Top 50 MNC Placement Vault & ITIL SLA Guide',
        titleHi: 'टॉप 50 MNC प्लेसमेंट वॉल्ट एवं L1/L2 इंटरव्यू परिदृश्य',
        pages: 'Page 57',
        topics: [
          'L1 and L2 Systems Administrator Daily Corporate Operations',
          'Enterprise Ticketing Workflows (ServiceNow, Jira) & ITIL SLAs',
          'TCS, Wipro, Infosys 50 High-Yield Interview Technical Scenarios',
          'Systems Administrator Career Growth Ladder: L1 to Principal Architect',
          '2027 Compensation Benchmarks & Salary Negotiation Rebuttals'
        ]
      }
    ]
  },
"""

if "id: 'server2025'" not in catalog_content and 'id: "server2025"' not in catalog_content:
    # Insert right at the top of NOTES_SUBJECTS
    target = "export const NOTES_SUBJECTS = [\n"
    catalog_content = catalog_content.replace(target, target + server_entry)
    with open("src/data/notesCatalog.js", "w", encoding="utf-8") as f:
        f.write(catalog_content)
    print("Added server2025 to src/data/notesCatalog.js!")
else:
    print("server2025 already present in notesCatalog.js")
