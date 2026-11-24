import os

def create_english_edition():
    with open("DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/English/master_book_en.typ", "r", encoding="utf-8") as f:
        content = f.read()

    # Let's clean up all Devanagari in master_book_en.typ systematically
    # Common Hindi words and connective phrases to English
    phrases = [
        # Chapter header categories
        ('भाग 1 : सिद्धांत एवं विकासक्रम (Foundation Architecture)', 'PART 1: FOUNDATION ARCHITECTURE & SYSTEM EVOLUTION'),
        ('भाग 2 : वर्चुअल लैब निर्माण (Hands-On Lab Setup)', 'PART 2: ENTERPRISE VIRTUAL LAB SETUP & FIRST BOOT'),
        ('भाग 3 : सर्वर बेसलाइन एवं सुरक्षा (Server Baseline & Hardening)', 'PART 3: SERVER BASELINE HARDENING & REMOTE ACCESS'),
        ('भाग 4 : केंद्रीय पहचान एवं डायरेक्टरी सर्विसेज (Identity & Directory Services)', 'PART 4: ACTIVE DIRECTORY DOMAIN SERVICES & DC PROMOTION'),
        ('भाग 5 : डायरेक्टरी ऑब्जेक्ट्स एवं एक्सेस कंट्रोल (Directory Objects & RBAC)', 'PART 5: ADUC CONSOLE, OUS, USERS & AGDLP ACCESS CONTROL'),
        ('भाग 6 : एंडपॉइंट एकीकरण एवं ऑथेंटिकेशन (Client Domain Join & Authentication)', 'PART 6: CLIENT DOMAIN JOIN & KERBEROS AUTHENTICATION'),
        ('भाग 7 : एंटरप्राइज सुरक्षा एवं समूह नीतियां (Group Policy Engine)', 'PART 7: GROUP POLICY OBJECTS (GPO) & SECURITY HARDENING'),
        ('भाग 8 : स्वचालित नेटवर्क आईपी एड्रेसिंग (Dynamic Host Configuration)', 'PART 8: DHCP SERVER CONFIGURATION & FAILOVER CLUSTERING'),
        ('भाग 9 : कॉर्पोरेट नेम रेजोल्यूशन एवं DNS (Enterprise Name Resolution)', 'PART 9: DNS ARCHITECTURE, AD ZONES & SCAVENGING'),
        ('भाग 10 : स्टोरेज, शेयरिंग एवं फाइल रिसोर्स मैनेजमेंट (Storage & FSRM)', 'PART 10: FILE SERVER RESOURCE MANAGER & STORAGE MANAGEMENT'),
        ('भाग 11 : वेब एप्लीकेशन्स एवं रिमोट डेस्कटॉप सेवाएं (IIS & RDS)', 'PART 11: IIS 10.X WEB SERVER & REMOTE DESKTOP SERVICES'),
        ('भाग 12 : नेक्स्ट-जेन फीचर्स एवं हाइब्रिड क्लाउड (Server 2025 Flagship & Azure)', 'PART 12: WINDOWS SERVER 2025 NEXT-GEN & HYBRID AZURE ARC'),
        ('भाग 13 : डिज़ास्टर रिकवरी एवं डेटा संरक्षण (Disaster Recovery & Backup)', 'PART 13: ENTERPRISE DISASTER RECOVERY & SYSTEM BACKUP'),
        ('भाग 14 : कॉर्पोरेट प्लेसमेंट एवं इंटरव्यू वॉल्ट (Placement Engine)', 'PART 14: TOP 50 MNC PLACEMENT VAULT & CAREER BLUEPRINT'),
        
        # Chapter titles
        ('सर्वर आर्किटेक्चर, सर्वर के प्रकार एवं विंडोज सर्वर का 32-वर्षीय इतिहास', 'Server Architecture, 8 Server Roles & 32-Year Windows Server Evolution'),
        ('क्लाइंट-सर्वर मॉडल · 8 प्रमुख सर्वर प्रकार · फिजिकल vs वर्चुअल vs अज़ूर आर्क हाइब्रिड · 1993 से 2025 का संपूर्ण विकासक्रम', 'Client-Server Model · 8 Core Server Roles · Physical vs Virtual vs Azure Arc · NT 3.1 to 2025 Evolution'),
        ('प्रैक्टिकल होम लैब सेटअप: Windows Server 2025 ISO एवं VM कॉन्फ़िगरेशन', 'Hands-On Enterprise Lab Setup: Windows Server 2025 ISO & VirtualBox VM Configuration'),
        ('लैब हार्डवेयर आवश्यकताएं · आइसोलेटेड नेटवर्क टोपोलॉजी · Microsoft 180-Day ISO डाउनलोड · VirtualBox VM निर्माण · Desktop Experience vs Core · फर्स्ट बूट', 'Hardware Requirements · Isolated VNet Topology · 180-Day Evaluation ISO · VirtualBox VM Creation · Desktop Experience vs Core · First Boot'),
        ('पोस्ट-इंस्टॉलेशन कॉन्फ़िगरेशन एवं सर्वर हार्डनिंग (Hardening & Initial Setup)', 'Post-Installation Baseline Configuration & Enterprise Server Hardening'),
        ('सर्वर मैनेजर डैशबोर्ड · कंप्यूटर नामकरण (`SRV-2025-DC01`) · स्टैटिक IPv4 एवं DNS असाइनमेंट · रिमोट डेस्कटॉप (RDP) व NLA · फ़ायरवॉल पोर्ट्स · NTP क्लॉक', 'Server Manager Dashboard · Standard Host Naming (`SRV-2025-DC01`) · Static IPv4 & DNS Assignment · RDP with NLA · Firewall Rules · NTP Sync'),
        ('एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) एवं डोमेन कंट्रोलर प्रमोशन', 'Active Directory Domain Services (AD DS) & Domain Controller Promotion'),
        ('AD DS कोर आर्किटेक्चर · लॉजिकल (Forest, Domain, OU) व फिजिकल (Sites) संरचना · Add Roles Wizard · रूट DC (`corp.rtechlab.local`) · DSRM पासवर्ड · 5 FSMO रोल्स', 'AD DS Architecture · Logical (Forest, Domain, OU) & Physical (Sites) Hierarchy · Add Roles Wizard · Root DC (`corp.rtechlab.local`) · DSRM · 5 FSMO Roles'),
        ('ADUC कंसोल: OUs, डोमेन यूजर्स एवं सिक्योरिटी ग्रुप्स का प्रबंधन', 'ADUC Console: Managing OUs, Domain Users & Security Groups (AGDLP Model)'),
        ('ADUC (`dsa.msc`) · एंटरप्राइज OU पदानुक्रम · नए डोमेन यूजर अकाउंट्स · पासवर्ड व लॉकआउट नीतियां · सिक्योरिटी vs डिस्ट्रीब्यूशन ग्रुप्स · AGDLP मॉडल · PowerShell बल्क क्रिएशन', 'ADUC (`dsa.msc`) · Corporate Tiered OU Hierarchy · User Lifecycle Management · Account Lockout Policies · Security vs Distribution Groups · Bulk PowerShell'),
        ('क्लाइंट मशीन (Windows 10/11) को डोमेन से जोड़ना (Domain Join Walkthrough)', 'Client Endpoint (Windows 10/11) Domain Join Walkthrough & Authentication'),
        ('क्लाइंट प्री-रिक्विज़िट्स · क्लाइंट DNS IP मैपिंग नियम · नेटवर्क कनेक्टिविटी व `nslookup` टेस्ट · वर्कग्रुप से डोमेन माइग्रेशन · टॉप 5 जॉइन एरर्स व फिक्स · डोमेन लॉगिन टेस्ट', 'Client Prerequisites · Golden DNS IP Mapping Rule · Connectivity & `nslookup` SRV Verification · Domain Migration · Top 5 Join Errors & Fixes · Domain Logon'),
        ('ग्रुप पॉलिसी ऑब्जेक्ट्स (GPO): एंटरप्राइज सुरक्षा एवं डेस्कटॉप नियंत्रण', 'Group Policy Objects (GPO): Enterprise Security Baseline & Desktop Control'),
        ('GPMC कंसोल · LSDOU प्रोसेसिंग क्रम · ब्लॉक इन्हेरिटेंस व एनफोर्स · लैब 1: पासवर्ड पॉलिसी · लैब 2: USB पेनड्राइव ब्लॉक GPO · लैब 3: वॉलपेपर डिप्लॉयमेंट · `gpupdate /force`', 'GPMC (`gpmc.msc`) · LSDOU Inheritance · Block Inheritance & Enforced · Lab 1: Password Policy · Lab 2: Removable USB Lockdown · Lab 3: Wallpaper · `gpupdate`'),
        ('DHCP सर्वर कॉन्फ़िगरेशन: स्कोप, एक्सक्लूज़न, रिज़र्वेशन एवं फेलओवर', 'DHCP Server Role: Scopes, Exclusions, MAC Reservations & Failover Clustering'),
        ('DORA 4-स्टेप प्रक्रिया · AD ऑथराइजेशन · IPv4 स्कोप · सबनेट मास्क · लीज ड्यूरेशन · एक्सक्लूज़न रेंज · MAC रिज़र्वेशन · 80/20 स्प्लिट-स्कोप व फेलओवर क्लस्टर', 'DORA 4-Step Protocol · AD Authorization · IPv4 Scopes · Subnet Mask · Lease Duration · Exclusion Ranges · MAC Reservations · 80/20 Split vs Failover Cluster'),
        ('DNS सर्वर आर्किटेक्चर: फ़ॉरवर्ड/रिवर्स ज़ोन, रिकॉर्ड्स एवं स्कैवेंजिंग', 'DNS Server Architecture: Forward/Reverse Zones, Resource Records & Scavenging'),
        ('DNS का एंटरप्राइज महत्व · AD-Integrated ज़ोन · फ़ॉरवर्ड vs रिवर्स लुकअप · A, PTR, CNAME, MX व SRV रिकॉर्ड्स · रूट हिंट्स vs फॉरवर्डर्स · DNS स्कैवेंजिंग', 'Enterprise Role of DNS · AD-Integrated Zones · Forward vs Reverse Lookup · A, PTR, CNAME, MX & SRV Records · Root Hints vs Forwarders · Aging & Scavenging'),
        ('फाइल सर्वर रिसोर्स मैनेजर (FSRM), NTFS अनुमतियां एवं कोटा प्रबंधन', 'File Server Resource Manager (FSRM), NTFS Permissions & Quota Management'),
        ('शेयर्ड फ़ोल्डर्स · SMB 3.1.1 · शेयर vs NTFS अनुमतियां (इफेक्टिव फॉर्मूला) · FSRM रोल · हार्ड vs सॉफ्ट स्टोरेज कोटा · फाइल स्क्रीनिंग (MP3/EXE ब्लॉक) · स्टोरेज रिपोर्ट्स', 'Shared Folders · SMB 3.1.1 · Share vs NTFS Permissions (Most Restrictive Rule) · FSRM Installation · Hard vs Soft Quotas · Ransomware File Screening · Reports'),
        ('IIS वेब सर्वर, सिक्योर FTP एवं रिमोट डेस्कटॉप सर्विसेज (RDS)', 'IIS 10.x Web Server, Secure FTP & Remote Desktop Services (RDS)'),
        ('Internet Information Services (IIS) 10.x · आंतरिक कंपनी पोर्टल · SSL/TLS सर्टिफिकेट HTTPS · सिक्योर FTP सर्वर · रिमोट डेस्कटॉप सर्विसेज (RDS) आर्किटेक्चर', 'Internet Information Services (IIS) 10.x · Intranet Web Portal · SSL/TLS HTTPS Certificate Binding · Secure FTP User Isolation · RDS Infrastructure'),
        ('Windows Server 2025 नेक्स्ट-जेन फीचर्स, स्टोरेज स्पेसेस एवं हाइब्रिड अज़ूर आर्क', 'Windows Server 2025 Next-Gen Features, ReFS & Hybrid Azure Arc'),
        ('Server 2025 के 5 क्रांतिकारी फीचर्स · हॉटपैचिंग (Zero-Reboot Live Patching) · 32KB AD DB पेज साइज · नेक्स्ट-जेन S2D व ReFS डिडुप · SMB over QUIC · Azure Arc एकीकरण', '5 Revolutionary Server 2025 Features · Hotpatching (Zero-Reboot Patching) · 32KB AD DB Page Size · Next-Gen S2D & ReFS Dedup · SMB over QUIC · Azure Arc Bridge'),
        ('सर्वर बैकअप, डिज़ास्टर रिकवरी एवं एक्टिव डायरेक्टरी रीसायकल बिन', 'Enterprise Disaster Recovery, Windows Server Backup & AD Recycle Bin'),
        ('3-2-1 एंटरप्राइज बैकअप रणनीति · Windows Server Backup · फुल vs सिस्टम स्टेट बैकअप · AD रीसायकल बिन सक्षम करना · डिलीटेड यूजर की 1-क्लिक रिकवरी · `wbadmin` ऑटोमेशन', '3-2-1 Enterprise Backup Strategy · Windows Server Backup · Full vs System State Backup · Enabling AD Recycle Bin · 1-Click Online Restore · `wbadmin` Automation'),
        ('टॉप 50 MNC सिस्टम एडमिनिस्ट्रेटर प्लेसमेंट वॉल्ट एवं L1/L2 इंटरव्यू परिदृश्य', 'Top 50 MNC Systems Administrator Placement Vault & L1/L2 Incident Scenarios'),
        ('L1/L2 दैनिक जिम्मेदारियां व टिकटिंग टूल्स (ServiceNow, Jira) · TCS, Wipro, Infosys, Cognizant के 50 वास्तविक इंटरव्यू परिदृश्य व समाधान · सैलरी नेगोशिएशन ब्लूप्रिंट', 'L1/L2 Daily Operations & Ticketing Tools (ServiceNow, Jira) · 50 Real MNC Technical Scenarios & Field Fixes · Salary Negotiation Blueprint'),
        
        # Section Headings
        ('=== 1.1 सर्वर क्या है? (What is a Server?)', '=== 1.1 What is a Server? (Enterprise Definition & Architecture)'),
        ('=== 1.2 कॉर्पोरेट नेटवर्क में उपयोग होने वाले 8 प्रमुख सर्वर प्रकार', '=== 1.2 The 8 Core Enterprise Server Roles in Corporate Networks'),
        ('=== 1.3 सर्वर डिप्लॉयमेंट मॉडल: फिजिकल vs वर्चुअल vs अज़ूर आर्क हाइब्रिड', '=== 1.3 Server Deployment Models: Physical vs Virtual vs Azure Arc Hybrid'),
        ('=== 1.4 विंडोज सर्वर का 32-वर्षीय संपूर्ण विकासक्रम (1993 से 2025)', '=== 1.4 Complete 32-Year Windows Server Evolution Timeline (1993 to 2025)'),
        ('=== 1.5 आर्किटेक्चरल तुलना: विंडोज 11 (क्लाइंट) vs विंडोज सर्वर 2025 (एंटरप्राइज)', '=== 1.5 Architectural Comparison: Windows 11 Client vs Windows Server 2025 Enterprise'),
        
        ('=== 2.1 होम लैब हार्डवेयर आवश्यकताएं एवं वर्चुअलाइजेशन तैयारी', '=== 2.1 Enterprise Home Lab Hardware Requirements & Virtualization Setup'),
        ('=== 2.2 RTechLab होम लैब नेटवर्क टोपोलॉजी एवं सबनेट प्लानिंग', '=== 2.2 RTechLab Enterprise Lab Network Topology & Subnet Planning'),
        ('=== 2.3 Microsoft Evaluation Center से Server 2025 ISO डाउनलोड करना', '=== 2.3 Downloading Windows Server 2025 Evaluation ISO from Microsoft'),
        ('=== 2.4 VirtualBox में नई वर्चुअल मशीन (VM) का निर्माण एवं हार्डवेयर आवंटन', '=== 2.4 Creating VirtualBox Virtual Machine & Allocating vCPU/RAM Resources'),
        ('=== 2.5 Windows Server 2025 इंस्टॉलेशन: Desktop Experience vs Core', '=== 2.5 Windows Server 2025 OS Installation: Desktop Experience vs Minimal Core'),
        ('=== 2.6 फर्स्ट बूट एवं एडमिनिस्ट्रेटर पासवर्ड सेटअप', '=== 2.6 First Boot & Built-In Administrator Password Configuration'),
        
        ('=== 3.1 सर्वर मैनेजर (Server Manager) डैशबोर्ड का परिचय', '=== 3.1 Introduction to the Server Manager Dashboard & Administrative Console'),
        ('=== 3.2 सर्वर का मानक नामकरण (Standard Computer Naming Convention)', '=== 3.2 Standard Enterprise Server Naming Conventions (`SRV-2025-DC01`)'),
        ('=== 3.3 एंटरप्राइज स्टैटिक IPv4 एवं DNS एड्रेस असाइनमेंट', '=== 3.3 Enterprise Static IPv4 & DNS Address Configuration'),
        ('=== 3.4 रिमोट डेस्कटॉप (RDP) सक्षम करना एवं NLA सुरक्षा', '=== 3.4 Enabling Remote Desktop (RDP) & Network Level Authentication (NLA)'),
        ('=== 3.5 विंडोज डिफेंडर फ़ायरवॉल पोर्ट्स एवं बेसिक हार्डनिंग', '=== 3.5 Windows Defender Firewall Rules Baseline & Core Port Hardening'),
        ('=== 3.6 टाइम ज़ोन एवं NTP क्लॉक सिंक्रोनाइजेशन', '=== 3.6 Time Zone Configuration & NTP Clock Synchronization'),
        
        ('=== 4.1 एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) क्या है?', '=== 4.1 What is Active Directory Domain Services (AD DS)?'),
        ('=== 4.2 AD DS का लॉजिकल आर्किटेक्चर (Forest, Tree, Domain, OU)', '=== 4.2 AD DS Logical Architecture: Forest, Domain Tree, Domain & OUs'),
        ('=== 4.3 AD DS का फिजिकल आर्किटेक्चर (Domain Controllers एवं Sites)', '=== 4.3 AD DS Physical Architecture: Domain Controllers & Replication Sites'),
        ('=== 4.4 स्टेप-बाय-स्टेप: AD DS सर्वर रोल इंस्टॉलेशन (Add Roles & Features)', '=== 4.4 Step-by-Step: Installing AD DS Server Role via Add Roles Wizard'),
        ('=== 4.5 सर्वर को रूट डोमेन कंट्रोलर में प्रमोट करना (`corp.rtechlab.local`)', '=== 4.5 Promoting Server to Root Domain Controller (`corp.rtechlab.local`)'),
        ('=== 4.6 डायरेक्टरी सर्विसेज रिस्टोर मोड (DSRM) पासवर्ड का महत्व', '=== 4.6 Directory Services Restore Mode (DSRM) Password Importance'),
        ('=== 4.7 5 FSMO रोल्स (Flexible Single Master Operations) का परिचय', '=== 4.7 The 5 FSMO Roles (Flexible Single Master Operations) Architecture'),
        
        ('=== 5.1 ADUC कंसोल (`dsa.msc`) का परिचय एवं नेविगेशन', '=== 5.1 Introduction & Navigation in ADUC Console (`dsa.msc`)'),
        ('=== 5.2 एंटरप्राइज OU (Organizational Unit) पदानुक्रम डिजाइन करना', '=== 5.2 Designing Enterprise Tiered Organizational Unit (OU) Hierarchy'),
        ('=== 5.3 नया डोमेन यूजर अकाउंट बनाना एवं पासवर्ड नीतियां', '=== 5.3 Creating Domain User Accounts & Managing Password Security'),
        ('=== 5.4 यूजर अकाउंट लॉकआउट एवं ट्रबलशूटिंग प्रक्रिया', '=== 5.4 User Account Lockout Policies & Enterprise Root-Cause Troubleshooting'),
        ('=== 5.5 सिक्योरिटी ग्रुप्स vs डिस्ट्रीब्यूशन ग्रुप्स (ग्रुप प्रकार व स्कोप)', '=== 5.5 Security Groups vs Distribution Groups (Group Types & Scopes)'),
        ('=== 5.6 AGDLP रोल-बेस्ड एक्सेस कंट्रोल (RBAC) मॉडल', '=== 5.6 The AGDLP Role-Based Access Control (RBAC) Architecture'),
        ('=== 5.7 PowerShell द्वारा बल्क यूजर्स बनाना (`Import-Csv`)', '=== 5.7 Automated Bulk User Provisioning using PowerShell (`Import-Csv`)'),
        
        ('=== 6.1 क्लाइंट मशीन डोमेन जॉइन की पूर्व-आवश्यकताएं', '=== 6.1 Client Machine Domain Join Prerequisites & Baseline Requirements'),
        ('=== 6.2 डीएनएस कॉन्फ़िगरेशन का सुनहरा नियम (The Golden DNS Rule)', '=== 6.2 The Golden DNS Rule for Enterprise Domain Join Resolution'),
        ('=== 6.3 नेटवर्क कनेक्टिविटी एवं डीएनएस SRV रिकॉर्ड टेस्ट', '=== 6.3 Verifying Network Connectivity & DNS SRV Locator Records'),
        ('=== 6.4 वर्कग्रुप से डोमेन में जॉइन करने की स्टेप-बाय-स्टेप प्रक्रिया', '=== 6.4 Step-by-Step Domain Join Procedure via System Properties (`sysdm.cpl`)'),
        ('=== 6.5 डोमेन जॉइन के टॉप 5 एरर्स एवं उनका सटीक समाधान', '=== 6.5 Top 5 Domain Join Errors, Root Causes & Field Fixes'),
        ('=== 6.6 प्रथम डोमेन लॉगिन एवं यूजर प्रोफाइल सत्यापन', '=== 6.6 First Domain User Logon & Roaming Profile Verification'),
        
        ('=== 7.1 ग्रुप पॉलिसी ऑब्जेक्ट्स (GPO) क्या है और इसका कॉर्पोरेट महत्व?', '=== 7.1 What is Group Policy (GPO) and Why is it Critical in Enterprises?'),
        ('=== 7.2 GPMC कंसोल (`gpmc.msc`) एवं पॉलिसी संरचना (Computer vs User)', '=== 7.2 GPMC Console (`gpmc.msc`) & Policy Structure (Computer vs User)'),
        ('=== 7.3 GPO इनहेरिटेंस एवं LSDOU प्रोसेसिंग क्रम', '=== 7.3 GPO Inheritance Rules & Deterministic LSDOU Processing Order'),
        ('=== 7.4 ब्लॉक इनहेरिटेंस vs एनफोर्स्ड (No Override) का प्रभाव', '=== 7.4 Block Inheritance vs Enforced (No Override) Precedence Model'),
        ('=== 7.5 लैब 1: एंटरप्राइज पासवर्ड एवं अकाउंट लॉकआउट GPO डिप्लॉयमेंट', '=== 7.5 Lab 1: Deploying Enterprise Password & Account Lockout GPO'),
        ('=== 7.6 लैब 2: USB मास स्टोरेज (पेनड्राइव) ब्लॉक GPO', '=== 7.6 Lab 2: Removable Storage USB Lockdown GPO Implementation'),
        ('=== 7.7 लैब 3: सेंट्रलाइज्ड कॉर्पोरेट डेस्कटॉप वॉलपेपर डिप्लॉयमेंट', '=== 7.7 Lab 3: Centralized Corporate Desktop Wallpaper Deployment'),
        ('=== 7.8 क्लाइंट पर GPO अपडेट एवं ट्रबलशूटिंग (`gpupdate /force` व `gpresult`)', '=== 7.8 GPO Verification & Troubleshooting (`gpupdate /force` & `gpresult`)'),
        
        ('=== 8.1 डीएचसीपी (DHCP) क्या है और एंटरप्राइज नेटवर्क में इसकी आवश्यकता?', '=== 8.1 What is DHCP and Why is it Indispensable in Corporate Networks?'),
        ('=== 8.2 DORA 4-स्टेप लीज प्रक्रिया का तकनीकी विश्लेषण', '=== 8.2 In-Depth Technical Analysis of the 4-Step DORA Protocol Workflow'),
        ('=== 8.3 डीएचसीपी सर्वर रोल इंस्टॉलेशन एवं एक्टिव डायरेक्टरी ऑथराइजेशन', '=== 8.3 Installing DHCP Server Role & Authorizing in Active Directory'),
        ('=== 8.4 नया IPv4 स्कोप बनाना: रेंज, सबनेट मास्क एवं लीज ड्यूरेशन', '=== 8.4 Creating IPv4 Scopes: IP Range, Subnet Mask & Lease Duration'),
        ('=== 8.5 एक्सक्लूज़न रेंज (Exclusion Range) एवं डीले (Delay) सेटिंग्स', '=== 8.5 Configuring Exclusion Ranges & Relay Delay Settings'),
        ('=== 8.6 कोर स्कोप ऑप्शंस: 003 (गेटवे), 006 (डीएनएस), 015 (डोमेन नेम)', '=== 8.6 Core DHCP Scope Options: 003 (Gateway), 006 (DNS), 015 (Domain Name)'),
        ('=== 8.7 मैक एड्रेस रिजर्वेशन (MAC Reservation) कॉन्फ़िगर करना', '=== 8.7 Configuring Permanent MAC Address IP Reservations'),
        ('=== 8.8 डीएचसीपी हाई-अवेलेबिलिटी: 80/20 स्प्लिट vs डीएचसीपी फेलओवर', '=== 8.8 DHCP High Availability: 80/20 Split-Scope vs DHCP Failover Clustering'),
        
        ('=== 9.1 डीएनएस (DNS) क्या है और एक्टिव डायरेक्टरी के लिए यह प्राणवायु क्यों है?', '=== 9.1 What is DNS and Why is it the Lifeblood of Active Directory?'),
        ('=== 9.2 एक्टिव डायरेक्टरी-इंटीग्रेटेड ज़ोन (AD-Integrated Zones) के लाभ', '=== 9.2 Core Enterprise Benefits of Active Directory-Integrated DNS Zones'),
        ('=== 9.3 फ़ॉरवर्ड लुकअप ज़ोन vs रिवर्स लुकअप ज़ोन', '=== 9.3 Forward Lookup Zones vs Reverse Lookup Zones (PTR Architecture)'),
        ('=== 9.4 6 प्रमुख रिसोर्स रिकॉर्ड्स: A, AAAA, PTR, CNAME, MX एवं SRV', '=== 9.4 The 6 Essential Resource Records: A, AAAA, PTR, CNAME, MX & SRV'),
        ('=== 9.5 रूट हिंट्स (Root Hints) vs डीएनएस फॉरवर्डर्स (DNS Forwarders)', '=== 9.5 Root Hints vs External DNS Forwarders: Resolution Performance'),
        ('=== 9.6 डीएनएस रिकॉर्ड्स की एजिंग एवं स्कैवेंजिंग (Aging & Scavenging)', '=== 9.6 DNS Record Aging & Scavenging: Automating Stale Record Cleanups'),
        
        ('=== 10.1 फाइल सर्वर एवं एसएमबी (SMB 3.1.1) प्रोटोकॉल का परिचय', '=== 10.1 Introduction to Enterprise File Servers & SMB 3.1.1 Protocol'),
        ('=== 10.2 शेयर परमिशन vs एनटीएफएस (NTFS) परमिशन: द मोस्ट रेस्ट्रिक्टिव नियम', '=== 10.2 Share vs NTFS Permissions: The Most Restrictive Security Formula'),
        ('=== 10.3 फाइल सर्वर रिसोर्स मैनेजर (FSRM) रोल इंस्टॉलेशन', '=== 10.3 Installing File Server Resource Manager (FSRM) Role Service'),
        ('=== 10.4 हार्ड कोटा vs सॉफ्ट कोटा (Hard vs Soft Storage Quotas)', '=== 10.4 Hard Quotas vs Soft Quotas: Implementation & Threshold Alerts'),
        ('=== 10.5 फाइल स्क्रीनिंग (File Screening): रैनसमवेयर एवं अनधिकृत फाइल ब्लॉक', '=== 10.5 Active File Screening: Blocking Ransomware & Unauthorized Formats'),
        ('=== 10.6 स्वचालित स्टोरेज ऑडिट रिपोर्ट्स जनरेट करना', '=== 10.6 Automated Storage Audit Reports & Capacity Planning'),
        
        ('=== 11.1 इंटरनेट इंफॉर्मेशन सर्विसेज (IIS 10.x) का परिचय एवं आर्किटेक्चर', '=== 11.1 Introduction to IIS 10.x Architecture & Application Pools'),
        ('=== 11.2 आंतरिक कॉर्पोरेट वेब पोर्टल सेटअप एवं पोर्ट बाइंडिंग्स', '=== 11.2 Creating Internal Corporate Web Portals & Site Port Bindings'),
        ('=== 11.3 एसएसएल/टीएलएस (SSL/TLS) सर्टिफिकेट बनाना एवं HTTPS (Port 443) बाइंडिंग', '=== 11.3 SSL/TLS Certificate Generation & HTTPS (Port 443) Binding'),
        ('=== 11.4 सिक्योर एफटीपी (FTP) सर्वर एवं यूजर आइसोलेशन', '=== 11.4 Configuring Secure FTP Server & User Isolation Directories'),
        ('=== 11.5 रिमोट डेस्कटॉप सर्विसेज (RDS / VDI) आर्किटेक्चर का परिचय', '=== 11.5 Introduction to Remote Desktop Services (RDS / VDI) Infrastructure'),
        
        ('=== 12.1 Windows Server 2025 के 5 क्रांतिकारी फीचर्स', '=== 12.1 The 5 Revolutionary Innovations in Windows Server 2025'),
        ('=== 12.2 हॉटपैचिंग (Hotpatching): बिना रीबूट लाइव सिक्योरिटी अपडेट्स', '=== 12.2 Hotpatching: Live Zero-Reboot Security Updates in Production'),
        ('=== 12.3 एक्टिव डायरेक्टरी 32KB डेटाबेस पेज साइज', '=== 12.3 Active Directory Next-Gen 32KB Database Page Size Architecture'),
        ('=== 12.4 नेक्स्ट-जेन ReFS डेटा डिडुप्लीकेशन एवं कम्प्रेशन', '=== 12.4 Next-Gen ReFS Storage Deduplication & Real-Time Compression'),
        ('=== 12.5 एसएमबी ओवर क्विक (SMB over QUIC): बिना वीपीएन रिमोट एक्सेस', '=== 12.5 SMB over QUIC: Secure Internet File Access Without VPN Tunnels'),
        ('=== 12.6 अज़ूर आर्क (Azure Arc) एकीकरण एवं हाइब्रिड क्लाउड मैनेजमेंट', '=== 12.6 Azure Arc Hybrid Cloud Onboarding & Centralized Governance'),
        
        ('=== 13.1 3-2-1 एंटरप्राइज बैकअप रणनीति क्या है?', '=== 13.1 The 3-2-1 Enterprise Backup Rule Architecture'),
        ('=== 13.2 Windows Server Backup फीचर इंस्टॉल एवं कॉन्फ़िगर करना', '=== 13.2 Installing & Configuring Windows Server Backup Role Feature'),
        ('=== 13.3 फुल बैकअप vs सिस्टम स्टेट बैकअप (System State Backup)', '=== 13.3 Full Server Backup vs System State Backup on Domain Controllers'),
        ('=== 13.4 एक्टिव डायरेक्टरी रीसायकल बिन सक्षम करना एवं 1-क्लिक रिकवरी', '=== 13.4 Enabling Active Directory Recycle Bin & 1-Click Online Object Restore'),
        ('=== 13.5 कमांड-लाइन बैकअप ऑटोमेशन (`wbadmin`)', '=== 13.5 Automated Scheduled Backups via PowerShell & `wbadmin` Scripts'),
        ('=== 13.6 डिज़ास्टर रिकवरी ड्रिल एवं बेस्ट प्रैक्टिसेस', '=== 13.6 Enterprise Disaster Recovery Drill Protocols & High-Availability SLA'),
        
        ('=== 14.1 L1 एवं L2 सिस्टम एडमिनिस्ट्रेटर की दैनिक जिम्मेदारियां', '=== 14.1 L1 and L2 Systems Administrator Daily Corporate Operations'),
        ('=== 14.2 एंटरप्राइज टिकटिंग टूल्स (ServiceNow, Jira) एवं SLA अनुपालन', '=== 14.2 Enterprise Ticketing Workflows (ServiceNow, Jira) & ITIL SLAs'),
        ('=== 14.3 टॉप 50 MNC इंटरव्यू परिदृश्य एवं ट्रबलशूटिंग ब्लूप्रिंट', '=== 14.3 Top 50 MNC Placement Interview Scenarios & Technical Solutions'),
        ('=== 14.4 सिस्टम एडमिनिस्ट्रेटर करियर लैडर एवं सैलरी नेगोशिएशन', '=== 14.4 Systems Administrator Career Growth Ladder & Salary Negotiation')
    ]

    for src, dst in phrases:
        content = content.replace(src, dst)

    output_file = "DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/English/master_book_en.typ"
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(content)

    print("Updated master_book_en.typ with English headings and titles!")

if __name__ == "__main__":
    create_english_edition()
