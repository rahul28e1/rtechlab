import re

def translate_body():
    with open("DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/English/master_book_en.typ", "r", encoding="utf-8") as f:
        text = f.read()

    trans = [
        # Chapter 1
        ("एक साधारण कंप्यूटर और एक एंटरप्राइज सर्वर के बीच का अंतर केवल हार्डवेयर का नहीं, बल्कि उसकी #hl-yellow[भूमिका (Role) और उपलब्धता (Availability)] का होता है।",
         "The fundamental distinction between a standard desktop computer and an enterprise server lies not merely in physical hardware specifications, but in its #hl-yellow[operational Role and High Availability (99.999% Uptime)]."),
        
        ("सर्वर एक ऐसा शक्तिशाली केंद्रीय कंप्यूटर या सॉफ्टवेयर प्रोग्राम होता है जो नेटवर्क पर अन्य कंप्यूटरों (जिन्हें क्लाइंट्स कहा जाता है) को विभिन्न सेवाएं, संसाधन, डेटा एवं सुरक्षा नीतियां 24 घंटे, सातों दिन (24/7/365) निरंतर प्रदान करता है।",
         "A server is a dedicated, high-performance central computer system or software service that delivers network services, identity, data resources, and enterprise security policies to client computers 24 hours a day, 7 days a week (24/7/365) without interruption."),
        
        ("क्लाइंट (Client) की परिभाषा", "Client Definition & Role"),
        ("क्लाइंट वह एंड-यूजर मशीन (लैपटॉप, डेस्कटॉप, स्मार्टफोन) होती है जो सर्वर से किसी सेवा के लिए अनुरोध (#hl-green[Request]) भेजती है। उदाहरण: आपका वेब ब्राउज़र, आउटलुक ईमेल क्लाइंट, या फाइल एक्सप्लोरर।",
         "A client is an end-user endpoint (laptop, workstation, smartphone) that initiates requests (#hl-green[Requests]) for network resources or services. Examples include web browsers, Microsoft Outlook, and File Explorer."),
        
        ("सर्वर (Server) की परिभाषा", "Server Definition & Role"),
        ("सर्वर वह केंद्रीय सिस्टम है जो क्लाइंट्स के अनुरोधों को सुनता है (#hl-green[Listening on Ports]), उनकी प्रामाणिकता जांचता है, और संबंधित सेवा का प्रत्युत्तर (#hl-green[Response]) वापस भेजता है।",
         "A server is a central enterprise system that listens for client requests (#hl-green[Listening on Ports]), validates client identity, and delivers authoritative responses (#hl-green[Responses]) back across the network."),
        
        ("किसी भी बहुराष्ट्रीय कंपनी (MNC) या बैंक में केवल एक ही सर्वर सब कुछ नहीं करता। विशिष्ट कार्यों के लिए सर्वर को अलग-अलग भूमिकाएं दी जाती हैं:",
         "In modern enterprise architectures, no single machine handles all operations. Workloads are distributed across specialized server roles:"),
        
        ("1. डोमेन कंट्रोलर (Domain Controller / Active Directory Server):", "1. Domain Controller (AD DS / Active Directory Server):"),
        ("पूरे कॉर्पोरेट नेटवर्क का दिल। सभी कर्मचारियों के यूजर अकाउंट्स, पासवर्ड्स और कंप्यूटरों को केंद्रीय रूप से प्रमाणित करता है।",
         "The central brain of enterprise identity. Authoritatively manages all domain user accounts, passwords, computers, and Kerberos authentication."),
        
        ("2. डीएनएस सर्वर (Domain Name System Server):", "2. DNS Server (Domain Name System Server):"),
        ("नेटवर्क का टेलीफोन डायरेक्टरी। कंप्यूटर नामों को आईपी एड्रेस में बदलता है (उदा. `portal.rtechlab.local` -> `192.168.1.50`)।",
         "The enterprise name resolution engine. Translates human-friendly hostnames into IP addresses (e.g., `portal.rtechlab.local` -> `192.168.1.50`)."),
        
        ("3. डीएचसीपी सर्वर (Dynamic Host Configuration Protocol Server):", "3. DHCP Server (Dynamic Host Configuration Protocol):"),
        ("नेटवर्क से जुड़ने वाले नए लैपटॉप और डेस्कटॉप को स्वचालित रूप से आईपी एड्रेस, सबनेट मास्क और डिफॉल्ट गेटवे प्रदान करता है।",
         "Automates IP management by dynamically leasing IP addresses, subnet masks, gateways, and DNS settings to network endpoints."),
        
        ("4. फाइल एवं स्टोरेज सर्वर (File & Storage Server):", "4. File & Storage Server (FSRM / SMB 3.1.1):"),
        ("कंपनी के सभी विभागों (HR, Accounts, Sales) की फाइलों को सुरक्षित रूप से स्टोर करता है और अनुमतियों (NTFS Permissions) के आधार पर एक्सेस देता है।",
         "Provides centralized, secure network storage with departmental share and NTFS access controls, quotas, and ransomware screening."),
        
        ("5. वेब सर्वर (Web Server / IIS):", "5. Web Server (IIS 10.x / Application Server):"),
        ("कंपनी के आंतरिक पोर्टल्स (Intranet), वेब एप्लिकेशन्स और एपीआई को होस्ट करता है (उदा. माइक्रोसॉफ्ट IIS या अपाचे)।",
         "Hosts enterprise intranet portals, web applications, and internal APIs over secure HTTPS (Port 443) using Microsoft IIS 10.x."),
        
        ("6. डेटाबेस सर्वर (Database Server):", "6. Database Server (Microsoft SQL Server / Oracle):"),
        ("ERP, CRM और बिलिंग सॉफ्टवेयर के डेटाबेस (उदा. Microsoft SQL Server या Oracle) को 24/7 सुरक्षित और प्रोसेस करता है।",
         "Houses high-performance relational databases (Microsoft SQL Server, PostgreSQL) supporting enterprise ERP, CRM, and billing systems."),
        
        ("7. रिमोट डेस्कटॉप सर्वर (Remote Desktop Services / RDS):", "7. Remote Desktop Services Server (RDS / VDI):"),
        ("कर्मचारियों को घर से या किसी भी डिवाइस से सर्वर पर होस्ट किए गए वर्चुअल डेस्कटॉप और सॉफ्टवेयर चलाने की अनुमति देता है।",
         "Enables secure remote work by hosting centralized virtual desktops and published applications accessed over RDP/TLS."),
        
        ("8. बैकअप एवं डिज़ास्टर रिकवरी सर्वर (Backup Server):", "8. Backup & Disaster Recovery Server:"),
        ("पूरे नेटवर्क का स्वचालित बैकअप लेता है ताकि हार्डवेयर फेलियर या रैनसमवेयर अटैक की स्थिति में डेटा को तुरंत रीस्टोर किया जा सके।",
         "Maintains automated, immutable 3-2-1 backups of domain controllers, databases, and file shares for rapid disaster recovery."),
        
        # Deployment Models
        ("सर्वर डिप्लॉयमेंट मॉडल का चयन कंपनी के बजट, सुरक्षा आवश्यकताओं और कार्यभार के आधार पर किया जाता है:",
         "Server deployment architectures are selected based on organizational budget, compliance mandates, and workload elasticity:"),
        
        ("फिजिकल ऑन-प्रिमाइसेस सर्वर (Bare-Metal Physical Server)", "Physical On-Premises Server (Bare-Metal Hardware)"),
        ("हार्डवेयर का मालिक खुद संगठन होता है (डेल, एचपीई, लेनोवो रैक सर्वर)। उच्च प्रदर्शन और आंतरिक सुरक्षा, लेकिन उच्च प्रारंभिक लागत (CapEx)।",
         "The enterprise purchases and owns dedicated physical rack servers (Dell PowerEdge, HPE ProLiant). Zero hypervisor latency, but requires upfront CapEx."),
        
        ("वर्चुअलाइज्ड सर्वर (On-Premises Virtualization via Hyper-V / VMware)", "Virtualized Server (Hyper-V / VMware ESXi)"),
        ("एक ही शक्तिशाली फिजिकल सर्वर पर हाइपरवाइजर (Hyper-V) के माध्यम से कई वर्चुअल सर्वर (VMs) एक साथ चलाए जाते हैं। 80% लागत की बचत।",
         "A single bare-metal server runs a Type-1 hypervisor (Hyper-V), hosting multiple isolated virtual machines (VMs). Maximizes resource utilization."),
        
        ("हाइब्रिड एवं क्लाउड सर्वर (Azure Arc Connected Infrastructure)", "Hybrid & Cloud Server (Azure Arc Connected Infrastructure)"),
        ("स्थानीय सर्वर को माइक्रोसॉफ्ट अज़ूर क्लाउड से जोड़कर एक ही डैशबोर्ड से प्रबंधित करना। Server 2025 का सबसे शक्तिशाली मॉडल।",
         "Bridges on-premises infrastructure with Microsoft Azure Cloud, enabling unified monitoring, Hotpatching, and governance from the Azure Portal."),

        # Evolution timeline
        ("माइक्रोसॉफ्ट ने 1993 में पहला विंडोज सर्वर ओएस लॉन्च किया था। पिछले 32 वर्षों में यह एक साधारण फाइल-शेयरिंग सिस्टम से विश्व-स्तरीय क्लाउड प्लेटफॉर्म बन चुका है:",
         "Microsoft debuted enterprise server computing in 1993 with Windows NT 3.1 Advanced Server. Over 32 years, it has transformed into a global hybrid platform:"),
        
        ("1993: Windows NT 3.1 Advanced Server — 32-बिट प्री-एम्प्टिव मल्टीटास्किंग और NTFS फाइल सिस्टम की ऐतिहासिक शुरुआत।",
         "1993: Windows NT 3.1 Advanced Server — The historic debut of 32-bit pre-emptive multitasking and the NTFS file system."),
        ("1996: Windows NT 4.0 Server — विंडोज 95 जैसा ग्राफिकल यूजर इंटरफेस (GUI) और डोमेन आर्किटेक्चर की नींव।",
         "1996: Windows NT 4.0 Server — Introduced the Windows 95 GUI to server administration and established basic domain models."),
        ("2000: Windows 2000 Server — #hl-green[एक्टिव डायरेक्टरी (Active Directory)] और ग्रुप पॉलिसी (GPO) का क्रांतिकारी जन्म।",
         "2000: Windows 2000 Server — The revolutionary birth of #hl-green[Active Directory (AD DS)], Kerberos v5, and Group Policy (GPO)."),
        ("2003: Windows Server 2003 — वॉल्यूम शैडो कॉपी (VSS), 64-बिट सपोर्ट और मजबूत सुरक्षा।",
         "2003: Windows Server 2003 — Volume Shadow Copy (VSS), native 64-bit architecture, and role-based Server Configuration Wizard."),
        ("2008 / 2008 R2: Windows Server 2008 — #hl-green[Hyper-V वर्चुअलाइजेशन] और सर्वर कोर (Server Core) का आगमन।",
         "2008 / 2008 R2: Windows Server 2008 — Introduced #hl-green[Hyper-V virtualization], Server Core, and PowerShell automation."),
        ("2012 / 2012 R2: Windows Server 2012 — मॉडर्न सर्वर मैनेजर, स्टोरेज स्पेसेस (Storage Spaces) और SMB 3.0।",
         "2012 / 2012 R2: Windows Server 2012 — Overhauled Server Manager, Storage Spaces Direct (S2D), and resilient SMB 3.0."),
        ("2016: Windows Server 2016 — विंडोज कंटेनर्स, नैनो सर्वर और शील्डेड वीएम्स।",
         "2016: Windows Server 2016 — Windows Server Containers, Docker engine integration, Nano Server, and Shielded VMs."),
        ("2019: Windows Server 2019 — अज़ूर नेटवर्क एडेप्टर, विंडोज एडमिन सेंटर (WAC) और सिस्टम इनसाइट्स।",
         "2019: Windows Server 2019 — Hybrid Azure Network Adapter, Windows Admin Center (WAC), and predictive System Insights."),
        ("2022: Windows Server 2022 — एडवांस्ड मल्टी-लेयर सिक्योर्ड-कोर सर्वर और TLS 1.3 एन्क्रिप्शन।",
         "2022: Windows Server 2022 — Secured-core server security baselines, hardware-root of trust, and default TLS 1.3."),
        ("2025: Windows Server 2025 — #hl-yellow[हॉटपैचिंग (Zero-Reboot)], 32KB AD DB पेज साइज, SMB over QUIC और अज़ूर आर्क हाइब्रिड।",
         "2025: Windows Server 2025 — #hl-yellow[Hotpatching (Zero-Reboot)], 32KB AD DB Page Size, SMB over QUIC, and Native Azure Arc."),

        # Chapter 2 Lab Setup
        ("होम लैब सेटअप की न्यूनतम एवं अनुशंसित हार्डवेयर आवश्यकताएं:", "Minimum & Recommended Hardware Specifications for Home Lab:"),
        ("प्रोसेसर (CPU): Intel Core i3 / i5 / i7 या AMD Ryzen (वर्चुअलाइजेशन VT-x / AMD-V सक्षम होना अनिवार्य)।",
         "Processor (CPU): Intel Core i3/i5/i7 or AMD Ryzen with hardware virtualization (VT-x / AMD-V) enabled in BIOS/UEFI."),
        ("रैम (RAM): न्यूनतम 8 GB (16 GB अत्यधिक अनुशंसित — ताकि DC को 4GB और क्लाइंट को 4GB दिया जा सके)।",
         "Memory (RAM): Minimum 8 GB (16 GB recommended to allocate 4 GB to DC01 and 4 GB to Win 11 Client simultaneously)."),
        ("स्टोरेज (Disk): 100 GB मुक्त एसएसडी स्पेस (SSD Storage अत्यंत आवश्यक ताकि वीएम तेजी से बूट हो)।",
         "Storage (SSD): Minimum 100 GB free SSD disk space for responsive virtual machine disk I/O."),
        ("हाइपरवाइजर सॉफ्टवेयर: Oracle VM VirtualBox (100% फ्री) अथवा Windows 10/11 Pro का इन-बिल्ट Hyper-V।",
         "Hypervisor Platform: Oracle VM VirtualBox (Open Source) or Windows 10/11 Pro native Hyper-V."),

        # Lab Steps
        ("स्टेप 1: Microsoft Evaluation Center से ISO डाउनलोड करें", "Step 1: Download Windows Server 2025 Evaluation ISO from Microsoft"),
        ("स्टेप 2: VirtualBox में नई VM बनाएं", "Step 2: Create a New Virtual Machine in VirtualBox"),
        ("स्टेप 3: वर्चुअल नेटवर्क एडेप्टर कॉन्फ़िगर करें", "Step 3: Configure Isolated Virtual Network Switch"),
        ("स्टेप 4: ओएस इंस्टॉलेशन प्रक्रिया शुरू करें", "Step 4: Execute Clean Operating System Installation"),
        ("स्टेप 5: एडमिनिस्ट्रेटर पासवर्ड सेट करें", "Step 5: Configure Built-in Enterprise Administrator Password"),
        
        # Chapter 3 Post install
        ("कंप्यूटर का नामकरण (Computer Naming Convention)", "Standard Enterprise Host Naming Convention"),
        ("डिफ़ॉल्ट रूप से विंडोज सर्वर को `WIN-XYZ12345` जैसा रैंडम नाम मिलता है। उत्पादन परिवेश में इसे तुरंत एक मानक नाम (जैसे `SRV-2025-DC01`) में बदलना अनिवार्य है।",
         "By default, Windows assigns a random hostname such as `WIN-XYZ12345`. In enterprise production, it is mandatory to assign a deterministic hostname (e.g., `SRV-2025-DC01`) before role promotion."),
        ("स्टैटिक आईपी क्यों अनिवार्य है? (Why Static IP is Mandatory)", "Why a Static IP Address is Mandatory for Infrastructure Servers"),
        ("एक डोमेन कंट्रोलर और डीएनएस सर्वर को कभी भी डीएचसीपी से डायनामिक आईपी नहीं मिलना चाहिए। यदि सर्वर का आईपी बदल गया, तो नेटवर्क के सभी 500+ कंप्यूटर डोमेन से डिस्कनेक्ट हो जाएंगे।",
         "A Domain Controller and DNS server must never use dynamic DHCP addressing. If a DC's IP changes, all 500+ domain client workstations instantly fail authentication and lose network services."),

        # Chapter 4 AD DS
        ("एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) क्या है?", "What is Active Directory Domain Services (AD DS)?"),
        ("एक्टिव डायरेक्टरी माइक्रोसॉफ्ट का एंटरप्राइज आइडेंटिटी मैनेजमेंट और डायरेक्टरी सर्विस सिस्टम है। यह एक सेंट्रलाइज्ड डेटाबेस (`ntds.dit`) में पूरे कॉर्पोरेट नेटवर्क के सभी ऑब्जेक्ट्स (यूजर, कंप्यूटर, ग्रुप्स, प्रिंटर्स) की जानकारी सुरक्षित रखता है।",
         "Active Directory is Microsoft's centralized directory service and enterprise identity database (`ntds.dit`). It provides authoritative single sign-on (SSO), Kerberos v5 security authentication, and administrative delegation across all network objects."),
        
        ("5 FSMO रोल्स (Flexible Single Master Operations)", "The 5 FSMO Roles (Flexible Single Master Operations)"),
        ("1. स्कीमा मास्टर (Schema Master): पूरे फॉरेस्ट में केवल एक। AD डेटाबेस के नियमों और ऑब्जेक्ट क्लास को नियंत्रित करता है।",
         "1. Schema Master: Exactly 1 per forest. Governs schema attribute classes and structure across the entire enterprise directory."),
        ("2. डोमेन नेमिंग मास्टर (Domain Naming Master): पूरे फॉरेस्ट में केवल एक। नए डोमेन जोड़ने या हटाने की अनुमति देता है।",
         "2. Domain Naming Master: Exactly 1 per forest. Governs adding, removing, or renaming domains within the forest tree."),
        ("3. पीडीसी एमुलेटर (PDC Emulator): प्रति डोमेन एक। सबसे व्यस्त रोल! पासवर्ड बदलाव, टाइम सिंक (NTP) और अकाउंट लॉकआउट संभालता है।",
         "3. PDC Emulator: 1 per domain. The busiest role! Manages immediate password changes, Kerberos synchronization, time sync, and account lockouts."),
        ("4. आरआईडी मास्टर (RID Master): प्रति डोमेन एक। नए ऑब्जेक्ट्स के लिए रिलेटिव आईडी पूल आवंटित करता है।",
         "4. RID Master: 1 per domain. Allocates pools of Relative Identifiers (RIDs) to DCs for unique Security Identifier (SID) creation."),
        ("5. इंफ्रास्ट्रक्चर मास्टर (Infrastructure Master): प्रति डोमेन एक। क्रॉस-डोमेन ऑब्जेक्ट रेफरेंस और GUID/SID मैपिंग करता है।",
         "5. Infrastructure Master: 1 per domain. Handles phantom record updates and cross-domain group-to-user SID mappings."),

        # Chapter 5 ADUC
        ("एंटरप्राइज OU (Organizational Unit) पदानुक्रम", "Designing Enterprise Tiered Organizational Unit (OU) Hierarchy"),
        ("एक संगठनात्मक इकाई (OU) एक्टिव डायरेक्टरी के अंदर का एक विशेष फोल्डर कंटेनर है जिसका उपयोग दो प्रमुख कार्यों के लिए किया जाता है: 1. ग्रुप पॉलिसी (GPO) लिंक करना, और 2. प्रशासनिक अनुमतियों का डेलीगेशन (Delegation) करना।",
         "An Organizational Unit (OU) is a specialized directory container designed for two critical enterprise functions: 1. Linking Group Policy Objects (GPOs), and 2. Delegating administrative authority to department leads."),
        ("AGDLP मॉडल (Role-Based Access Control)", "The Industry-Standard AGDLP Access Control Framework"),
        ("A = Accounts (उपयोगकर्ता अकाउंट्स) -> G = Global Groups (विभाग स्तर के ग्रुप्स) -> DL = Domain Local Groups (संसाधन एक्सेस ग्रुप्स) -> P = Permissions (NTFS परमिशन)।",
         "A = Accounts (User identities) -> G = Global Groups (Department membership) -> DL = Domain Local Groups (Resource access) -> P = Permissions (NTFS ACLs applied to Domain Local groups)."),

        # Chapter 6 Domain Join
        ("क्लाइंट डीएनएस का सुनहरा नियम (The Golden DNS Rule)", "The Golden Enterprise DNS Rule for Domain Joining"),
        ("क्लाइंट मशीन का प्राइमरी डीएनएस आईपी हमेशा आपके डोमेन कंट्रोलर का आईपी (`192.168.1.10`) होना चाहिए। यदि क्लाइंट पर 8.8.8.8 या राउटर का आईपी लगा होगा, तो वह कभी भी `corp.rtechlab.local` को नहीं ढूंढ पाएगा।",
         "A client endpoint's primary DNS address MUST point to the authoritative Domain Controller IP (`192.168.1.10`). If a client uses public DNS (e.g., `8.8.8.8`), it cannot locate AD SRV records and domain join fails."),

        # Chapter 7 GPO
        ("ग्रुप पॉलिसी का LSDOU नियम (LSDOU Processing Order)", "The Deterministic LSDOU Processing Order in Group Policy"),
        ("ग्रुप पॉलिसी निम्नलिखित निश्चित क्रम में प्रोसेस होती है: 1. Local Policy -> 2. Site Policy -> 3. Domain Policy -> 4. Organizational Unit (OU) Policy। सबसे अंत में प्रोसेस होने वाली पॉलिसी सबसे ऊपर लागू होती है (Child OU Policy wins)।",
         "GPOs are processed in a strict sequence: 1. Local Policy -> 2. Site Policy -> 3. Domain Policy -> 4. Organizational Unit (OU) Policy. The last applied policy takes precedence in setting conflicts."),

        # Chapter 8 DHCP
        ("DORA 4-स्टेप लीज प्रक्रिया", "The Technical 4-Step DORA Lease Protocol Lifecycle"),
        ("1. Discover (क्लाइंट ब्रॉडकास्ट भेजता है), 2. Offer (डीएचसीपी सर्वर आईपी ऑफर करता है), 3. Request (क्लाइंट उस आईपी को स्वीकार करता है), 4. Acknowledgment (सर्वर लीज कन्फर्म करता है)।",
         "1. Discover (Client broadcasts on UDP 67), 2. Offer (DHCP server offers IP on UDP 68), 3. Request (Client accepts lease), 4. Acknowledgment (Server confirms allocation)."),

        # Chapter 9 DNS
        ("एक्टिव डायरेक्टरी-इंटीग्रेटेड ज़ोन के लाभ", "Key Architectural Advantages of AD-Integrated DNS Zones"),
        ("डेटाबेस AD के साथ `ntds.dit` में सुरक्षित रहता है, सभी डोमेन कंट्रोलर्स पर मल्टी-मास्टर अपडेट्स होते हैं, और सिक्योर डायनामिक अपडेट्स (Secure Dynamic Updates) से अनधिकृत आईपी हाईजैकिंग रुकती है।",
         "DNS records are stored directly within `ntds.dit`, enabling multi-master replication across all DCs with Kerberos encryption and Secure Dynamic Updates to prevent IP spoofing."),

        # Chapter 10 FSRM
        ("शेयर vs NTFS परमिशन का इफेक्टिव फॉर्मूला", "The Most Restrictive Rule: Share vs NTFS Permissions"),
        ("जब कोई यूजर नेटवर्क शेयर के जरिए फाइल एक्सेस करता है, तो शेयर परमिशन और NTFS परमिशन दोनों लागू होती हैं। विंडोज हमेशा दोनों में से सबसे अधिक प्रतिबंधात्मक (#hl-orange[Most Restrictive]) परमिशन लागू करता है।",
         "When accessing resources over a network UNC share, both Share and NTFS permissions evaluate simultaneously. Windows strictly enforces the #hl-orange[Most Restrictive] permission between the two."),

        # Chapter 11 IIS
        ("एसएसएल/टीएलएस (SSL/TLS) HTTPS बाइंडिंग", "SSL/TLS HTTPS Binding & Certificate Management on IIS 10.x"),
        ("एचटीटीपीएस (HTTPS) पोर्ट 443 पर काम करता है और ब्राउज़र तथा सर्वर के बीच के पूरे ट्रैफिक को टीएलएस एन्क्रिप्शन से सुरक्षित रखता है, जिससे पासवर्ड स्निफिंग रुकती है।",
         "HTTPS operates over TCP Port 443, securing web communication via modern TLS encryption and preventing man-in-the-middle sniffing of credentials and enterprise data."),

        # Chapter 12 Server 2025
        ("हॉटपैचिंग (Hotpatching) का तकनीकी जादू", "The Operational Architecture of Server 2025 Live Hotpatching"),
        ("हॉटपैचिंग के माध्यम से विंडोज सर्वर 2025 रनिंग मेमोरी में बिना ऑपरेटिंग सिस्टम रीबूट किए सिक्योरिटी पैच लगा देता है। सर्वर 24x7 बिना डाउनटाइम के चलता रहता है।",
         "Hotpatching patches memory binaries of running processes without requiring an operating system reboot, eliminating monthly downtime maintenance windows for critical DCs."),

        # Chapter 13 Backup
        ("3-2-1 एंटरप्राइज बैकअप रणनीति", "The Industry-Standard 3-2-1 Enterprise Backup Rule"),
        ("3 डेटा कॉपियां रखें, 2 अलग-अलग मीडिया प्रकारों पर स्टोर करें (लोकल सर्वर + एनएएस/टेप), और कम से कम 1 कॉपी ऑफसाइट अथवा क्लाउड में सुरक्षित रखें।",
         "Maintain 3 copies of critical enterprise data, stored on 2 different storage media types, with at least 1 immutable copy preserved offsite or in cloud storage."),

        # Chapter 14 Placement
        ("एमएनसी सिस्टम एडमिनिस्ट्रेटर इंटरव्यू क्रैक करने का गोल्डन रूल", "The Golden Rule for MNC Systems Administrator Technical Interviews"),
        ("इंटरव्यू में कभी भी सिर्फ थ्योरी परिभाषा न बोलें। हमेशा यह बताएं कि आप कौन सा कंसोल खोलेंगे (`dsa.msc`, `gpmc.msc`), कौन सा कमांड चलाएंगे (`gpresult`, `dcdiag`), और समस्या का रूट-कॉज कैसे ढूंढेंगे।",
         "Never recite dry textbook definitions in MNC interviews. Always explain the exact MMC console path (`dsa.msc`, `gpmc.msc`), the troubleshooting cmdlet (`gpresult`, `dcdiag`), and your systematic root-cause elimination logic.")
    ]

    for src, dst in trans:
        text = text.replace(src, dst)

    output_file = "DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/English/master_book_en.typ"
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(text)

    print("Translated body text to English!")

if __name__ == "__main__":
    translate_body()
