import re

# Read master Hindi source
with open("DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/master_book_hi.typ", "r", encoding="utf-8") as f:
    hi_content = f.read()

# English replacements for Front Matter
en_content = hi_content

# 1. Document title & metadata
en_content = en_content.replace(
    'title: "माइक्रोसॉफ्ट विंडोज सर्वर 2025 एवं एक्टिव डायरेक्टरी (संपूर्ण मास्टर गाइड)",',
    'title: "Microsoft Windows Server 2025 & Active Directory Administration (Master Guide)",'
)

# 2. Cover parameters
en_content = en_content.replace(
    'title: "माइक्रोसॉफ्ट विंडोज सर्वर 2025 एवं एक्टिव डायरेक्टरी",',
    'title: "MICROSOFT WINDOWS SERVER 2025 & ACTIVE DIRECTORY",\n  lang-tag: "ENGLISH COMPLETE MASTER EDITION (INTERNATIONAL EDITION)",'
)
en_content = en_content.replace(
    'subtitle: "क्लाइंट-सर्वर आर्किटेक्चर · AD DS डोमेन कंट्रोलर · ग्रुप पॉलिसी (GPO) · DNS एवं DHCP · स्टोरेज स्पेसेस · हाइब्रिड अज़ूर आर्क · टॉप 50 MNC प्लेसमेंट वॉल्ट",',
    'subtitle: "Client-Server Architecture · AD DS Domain Controller · Group Policy (GPO) · DNS & DHCP · Storage Spaces · Hybrid Azure Arc · Top 50 MNC Placement Vault",'
)
en_content = en_content.replace(
    'edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1 (Server 2025 Ready)",',
    'edition: "2027 Master Commercial Edition · Edition 1 (Server 2025 Enterprise Ready)",'
)
en_content = en_content.replace(
    'series-pill: "ऑफिशियल आरटेक लैब प्रमाणित सिस्टम एडमिनिस्ट्रेशन गाइड",',
    'series-pill: "Official RTechLab Certified System Administration Guide",'
)
en_content = en_content.replace(
    'author-title: "चीफ टेक्नोलॉजी आर्किटेक्ट एवं फाउंडर, RTechLab",',
    'author-title: "Chief Technology Architect & Founder, RTechLab",'
)
en_content = en_content.replace(
    'lang: "hi",',
    'lang: "en",'
)

# 3. Table of Contents Part 1 (Page 2)
en_content = en_content.replace(
    'संपूर्ण 14 अध्याय मास्टर इंडेक्स · भाग 1 (अध्याय 01 से 07) · पृष्ठ 1 / 2',
    'MASTER TABLE OF CONTENTS · PART 1 (CHAPTERS 01 TO 07) · PAGE 1 / 2'
)
en_content = en_content.replace(
    'विस्तृत विषय सूची — भाग 1 (अध्याय 01 से 07)',
    'Master Table of Contents — Part 1 (Chapters 01 to 07)'
)
en_content = en_content.replace(
    '(किसी भी अध्याय पर सीधे क्लिक करके उस पेज पर जाएं · शेष अध्याय 08 से 14 अगले पेज 03 पर हैं)',
    '(Click any chapter to jump directly to that page · Chapters 08 to 14 continue on Page 03)'
)
en_content = en_content.replace('पेज 04 →', 'Page 04 →')
en_content = en_content.replace('पेज 09 →', 'Page 09 →')
en_content = en_content.replace('पेज 14 →', 'Page 14 →')
en_content = en_content.replace('पेज 18 →', 'Page 18 →')
en_content = en_content.replace('पेज 23 →', 'Page 23 →')
en_content = en_content.replace('पेज 27 →', 'Page 27 →')
en_content = en_content.replace('पेज 31 →', 'Page 31 →')
en_content = en_content.replace('पेज 35 →', 'Page 35 →')
en_content = en_content.replace('पेज 39 →', 'Page 39 →')
en_content = en_content.replace('पेज 43 →', 'Page 43 →')
en_content = en_content.replace('पेज 47 →', 'Page 47 →')
en_content = en_content.replace('पेज 50 →', 'Page 50 →')
en_content = en_content.replace('पेज 53 →', 'Page 53 →')
en_content = en_content.replace('पेज 57 →', 'Page 57 →')
en_content = en_content.replace('पेज 60 →', 'Page 60 →')

en_content = en_content.replace(
    'अध्याय 01: सर्वर आर्किटेक्चर, सर्वर के प्रकार एवं विंडोज सर्वर का 32-वर्षीय इतिहास',
    'Chapter 01: Server Architecture, Server Types & 32-Year Windows Server Evolution'
)
en_content = en_content.replace(
    'क्लाइंट-सर्वर मॉडल · 8 प्रमुख सर्वर प्रकार · फिजिकल vs वर्चुअल vs अज़ूर आर्क हाइब्रिड · NT 3.1 से 2025 विकासक्रम · Win 11 vs Server 2025 · अभ्यास MCQs व MNC इंटरव्यू',
    'Client-Server Model · 8 Enterprise Server Roles · Physical vs Virtual vs Azure Arc · NT 3.1 to 2025 Evolution · Win 11 vs Server 2025 · Practice MCQs & MNC Vault'
)
en_content = en_content.replace(
    'अध्याय 02: प्रैक्टिकल होम लैब सेटअप: Windows Server 2025 ISO एवं VM कॉन्फ़िगरेशन',
    'Chapter 02: Hands-On Enterprise Lab Setup: Server 2025 ISO & VM Configuration'
)
en_content = en_content.replace(
    'लैब हार्डवेयर आवश्यकताएं · आइसोलेटेड नेटवर्क टोपोलॉजी · Microsoft 180-Day ISO डाउनलोड · VirtualBox VM निर्माण · Desktop Experience vs Core · फर्स्ट बूट व MCQs',
    'Hardware Specifications · Isolated VNet Topology · Microsoft 180-Day Evaluation ISO · VirtualBox VM Creation · Desktop Experience vs Core · First Boot & MCQs'
)
en_content = en_content.replace(
    'अध्याय 03: पोस्ट-इंस्टॉलेशन कॉन्फ़िगरेशन एवं सर्वर हार्डनिंग (Hardening & Initial Setup)',
    'Chapter 03: Post-Installation Baseline Configuration & Server Hardening'
)
en_content = en_content.replace(
    'सर्वर मैनेजर डैशबोर्ड · कंप्यूटर नामकरण (`SRV-2025-DC01`) · स्टैटिक IPv4 एवं DNS असाइनमेंट · रिमोट डेस्कटॉप (RDP) व NLA · फ़ायरवॉल पोर्ट्स · NTP क्लॉक · MCQs व इंटरव्यू',
    'Server Manager Dashboard · Standard Host Naming (`SRV-2025-DC01`) · Static IPv4 & DNS Assignment · RDP with NLA · Firewall Hardening · NTP Clock Sync · MCQs'
)
en_content = en_content.replace(
    'अध्याय 04: एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) एवं डोमेन कंट्रोलर प्रमोशन',
    'Chapter 04: Active Directory Domain Services (AD DS) & Domain Controller Promotion'
)
en_content = en_content.replace(
    'AD DS कोर आर्किटेक्चर · लॉजिकल (Forest, Domain, OU) व फिजिकल (Sites) संरचना · Add Roles Wizard · रूट DC (`corp.rtechlab.local`) · DSRM पासवर्ड · 5 FSMO रोल्स',
    'AD DS Core Architecture · Logical (Forest, Domain, OU) vs Physical (Sites) Hierarchy · Role Installation Wizard · Root DC (`corp.rtechlab.local`) · DSRM · 5 FSMO Roles'
)
en_content = en_content.replace(
    'अध्याय 05: ADUC कंसोल: OUs, डोमेन यूजर्स एवं सिक्योरिटी ग्रुप्स का प्रबंधन',
    'Chapter 05: ADUC Console: Managing OUs, Domain Users & Security Groups'
)
en_content = en_content.replace(
    'ADUC (`dsa.msc`) · एंटरप्राइज OU पदानुक्रम · नए डोमेन यूजर अकाउंट्स · पासवर्ड व लॉकआउट नीतियां · सिक्योरिटी vs डिस्ट्रीब्यूशन ग्रुप्स · AGDLP मॉडल · PowerShell बल्क क्रिएशन',
    'ADUC (`dsa.msc`) · Corporate Tiered OU Hierarchy · Domain User Provisioning · Account Lockout Policies · Security vs Distribution Groups · AGDLP Model · Bulk PowerShell'
)
en_content = en_content.replace(
    'अध्याय 06: क्लाइंट मशीन (Windows 10/11) को डोमेन से जोड़ना (Domain Join Walkthrough)',
    'Chapter 06: Client Machine (Windows 10/11) Domain Join Walkthrough'
)
en_content = en_content.replace(
    'क्लाइंट प्री-रिक्विज़िट्स · क्लाइंट DNS IP मैपिंग नियम · नेटवर्क कनेक्टिविटी व `nslookup` टेस्ट · वर्कग्रुप से डोमेन माइग्रेशन · टॉप 5 जॉइन एरर्स व फिक्स · डोमेन लॉगिन टेस्ट',
    'Client Prerequisites · Golden DNS IP Mapping Rule · Connectivity & `nslookup` SRV Tests · Workgroup to Domain Migration · Top 5 Join Errors & Fixes · First Domain Login'
)
en_content = en_content.replace(
    'अध्याय 07: ग्रुप पॉलिसी ऑब्जेक्ट्स (GPO): एंटरप्राइज सुरक्षा एवं डेस्कटॉप नियंत्रण',
    'Chapter 07: Group Policy Objects (GPO): Enterprise Security & Endpoint Control'
)
en_content = en_content.replace(
    'GPMC कंसोल · LSDOU प्रोसेसिंग क्रम · ब्लॉक इन्हेरिटेंस व एनफोर्स · लैब 1: पासवर्ड पॉलिसी · लैब 2: USB पेनड्राइव ब्लॉक GPO · लैब 3: वॉलपेपर डिप्लॉयमेंट · `gpupdate /force`',
    'GPMC Console (`gpmc.msc`) · LSDOU Hierarchy · Block Inheritance & Enforced · Lab 1: Password Policy · Lab 2: Removable Storage USB Lockdown · Lab 3: Wallpaper · `gpupdate`'
)

en_content = en_content.replace(
    'भाग 1 अध्ययन सारांश (Foundation & Identity)',
    'Part 1 Executive Curriculum Summary (Foundation & Identity)'
)
en_content = en_content.replace(
    'भाग 1 के अंतर्गत आप विंडोज सर्वर की बुनियादी कार्यप्रणाली, VM होम लैब इंस्टॉलेशन, पोस्ट-इंस्टॉलेशन हार्डनिंग, Active Directory (AD DS), DC प्रमोशन, यूजर्स/ग्रुप्स प्रबंधन, क्लाइंट डोमेन जॉइन तथा GPO नीतियों पर 100% व्यावहारिक कमांड हासिल करेंगे।',
    'In Part 1, you will master enterprise core architecture, isolated VM lab setup, server hardening baseline, Active Directory Domain Services (AD DS), Root DC promotion, user/group lifecycle management, endpoint domain joining, and Group Policy (GPO) security enforcement with complete operational confidence.'
)

en_content = en_content.replace(
    '👉 शेष अध्याय 08 से 14 (DHCP, DNS, FSRM, IIS, Azure Arc, बैकअप व MNC इंटरव्यू)',
    '👉 Chapters 08 to 14 (DHCP, DNS, FSRM, IIS, Azure Arc, Backup & MNC Placement Vault)'
)
en_content = en_content.replace(
    'मास्टर इंडेक्स भाग 2 देखने के लिए अगले पेज 03 पर जाएं या यहाँ सीधे क्लिक करें',
    'Continue to Page 03 for Master Index Part 2 or click here directly'
)
en_content = en_content.replace(
    'पेज 03 (भाग 2) देखें →',
    'View Page 03 (Part 2) →'
)

# 4. Table of Contents Part 2 (Page 3)
en_content = en_content.replace(
    'संपूर्ण 14 अध्याय मास्टर इंडेक्स · भाग 2 (अध्याय 08 से 14 + परिशिष्ट) · पृष्ठ 2 / 2',
    'MASTER TABLE OF CONTENTS · PART 2 (CHAPTERS 08 TO 14 + APPENDIX) · PAGE 2 / 2'
)
en_content = en_content.replace(
    'विस्तृत विषय सूची — भाग 2 (अध्याय 08 से 14 + परिशिष्ट)',
    'Master Table of Contents — Part 2 (Chapters 08 to 14 + Appendix)'
)
en_content = en_content.replace(
    '(नेटवर्क इंफ्रास्ट्रक्चर, स्टोरेज, IIS, हाइब्रिड अज़ूर आर्क, डिज़ास्टर रिकवरी एवं MNC इंटरव्यू वॉल्ट)',
    '(Network Infrastructure, Storage Spaces, IIS 10.x, Hybrid Azure Arc, Disaster Recovery & MNC Interview Vault)'
)

en_content = en_content.replace(
    'अध्याय 08: DHCP सर्वर कॉन्फ़िगरेशन: स्कोप, एक्सक्लूज़न, रिज़र्वेशन एवं फेलओवर',
    'Chapter 08: DHCP Server Role: Scopes, Exclusions, Reservations & Failover'
)
en_content = en_content.replace(
    'DORA 4-स्टेप प्रक्रिया · AD ऑथराइजेशन · IPv4 स्कोप · सबनेट मास्क · लीज ड्यूरेशन · एक्सक्लूज़न रेंज · MAC रिज़र्वेशन · 80/20 स्प्लिट-स्कोप व फेलओवर क्लस्टर',
    'DORA 4-Step Process · AD Authorization · IPv4 Scopes · Subnet Mask · Lease Duration · Exclusion Ranges · MAC Reservations · 80/20 Split-Scope vs Failover Cluster'
)
en_content = en_content.replace(
    'अध्याय 09: DNS सर्वर आर्किटेक्चर: फ़ॉरवर्ड/रिवर्स ज़ोन, रिकॉर्ड्स एवं स्कैवेंजिंग',
    'Chapter 09: DNS Server Architecture: Forward/Reverse Zones, Records & Scavenging'
)
en_content = en_content.replace(
    'DNS का एंटरप्राइज महत्व · AD-Integrated ज़ोन · फ़ॉरवर्ड vs रिवर्स लुकअप · A, PTR, CNAME, MX व SRV रिकॉर्ड्स · रूट हिंट्स vs फॉरवर्डर्स · DNS स्कैवेंजिंग',
    'Enterprise DNS Role · AD-Integrated Zones · Forward vs Reverse Lookup · A, PTR, CNAME, MX & SRV Records · Root Hints vs Forwarders · Aging & Scavenging'
)
en_content = en_content.replace(
    'अध्याय 10: फाइल सर्वर रिसोर्स मैनेजर (FSRM), NTFS अनुमतियां एवं कोटा प्रबंधन',
    'Chapter 10: File Server Resource Manager (FSRM), NTFS Permissions & Quota Management'
)
en_content = en_content.replace(
    'शेयर्ड फ़ोल्डर्स · SMB 3.1.1 · शेयर vs NTFS अनुमतियां (इफेक्टिव फॉर्मूला) · FSRM रोल · हार्ड vs सॉफ्ट स्टोरेज कोटा · फाइल स्क्रीनिंग (MP3/EXE ब्लॉक) · स्टोरेज रिपोर्ट्स',
    'Shared Folders · SMB 3.1.1 · Share vs NTFS Permissions (Most Restrictive Rule) · FSRM Role · Hard vs Soft Quota · Ransomware File Screening · Storage Reports'
)
en_content = en_content.replace(
    'अध्याय 11: IIS वेब सर्वर, सिक्योर FTP एवं रिमोट डेस्कटॉप सर्विसेज (RDS)',
    'Chapter 11: IIS 10.x Web Server, Secure FTP & Remote Desktop Services (RDS)'
)
en_content = en_content.replace(
    'Internet Information Services (IIS) 10.x · आंतरिक कंपनी पोर्टल · SSL/TLS सर्टिफिकेट HTTPS · सिक्योर FTP सर्वर · रिमोट डेस्कटॉप सर्विसेज (RDS) आर्किटेक्चर',
    'IIS 10.x Architecture · Internal Intranet Portal · SSL/TLS HTTPS Certificate Binding · Secure FTP User Isolation · Remote Desktop Services (RDS) Architecture'
)
en_content = en_content.replace(
    'अध्याय 12: Windows Server 2025 नेक्स्ट-जेन फीचर्स, स्टोरेज स्पेसेस एवं हाइब्रिड अज़ूर आर्क',
    'Chapter 12: Windows Server 2025 Next-Gen Features, ReFS & Hybrid Azure Arc'
)
en_content = en_content.replace(
    'Server 2025 के 5 क्रांतिकारी फीचर्स · हॉटपैचिंग (Zero-Reboot Live Patching) · 32KB AD DB पेज साइज · नेक्स्ट-जेन S2D व ReFS डिडुप · SMB over QUIC · Azure Arc एकीकरण',
    '5 Flagship Server 2025 Features · Hotpatching (Zero-Reboot Patching) · 32KB AD DB Page Size · Next-Gen S2D & ReFS Dedup · SMB over QUIC · Azure Arc Onboarding'
)
en_content = en_content.replace(
    'अध्याय 13: सर्वर बैकअप, डिज़ास्टर रिकवरी एवं एक्टिव डायरेक्टरी रीसायकल बिन',
    'Chapter 13: Enterprise Backup, Disaster Recovery & Active Directory Recycle Bin'
)
en_content = en_content.replace(
    '3-2-1 एंटरप्राइज बैकअप रणनीति · Windows Server Backup · फुल vs सिस्टम स्टेट बैकअप · AD रीसायकल बिन सक्षम करना · डिलीटेड यूजर की 1-क्लिक रिकवरी · `wbadmin` ऑटोमेशन',
    '3-2-1 Enterprise Backup Strategy · Windows Server Backup · Full vs System State Backup · Enabling AD Recycle Bin · 1-Click Online Restore · `wbadmin` Scripting'
)
en_content = en_content.replace(
    'अध्याय 14: टॉप 50 MNC सिस्टम एडमिनिस्ट्रेटर प्लेसमेंट वॉल्ट एवं L1/L2 इंटरव्यू परिदृश्य',
    'Chapter 14: Top 50 MNC Systems Administrator Placement Vault & L1/L2 Scenarios'
)
en_content = en_content.replace(
    'L1/L2 दैनिक जिम्मेदारियां व टिकटिंग टूल्स (ServiceNow, Jira) · TCS, Wipro, Infosys, Cognizant के 50 वास्तविक इंटरव्यू परिदृश्य व समाधान · सैलरी नेगोशिएशन ब्लूप्रिंट',
    'L1/L2 Day-in-the-Life & Ticketing Tools (ServiceNow, Jira) · 50 Real MNC Technical Scenarios & Field Fixes (TCS, Wipro, Infosys) · Salary Blueprint'
)
en_content = en_content.replace(
    'परिशिष्ट: RTechLab सिस्टम्स & इन्फ्रास्ट्रक्चर एकेडमी, लेखक प्रोफाइल एवं अंतिम शुभकामनाएं',
    'Appendix: RTechLab Systems & Infrastructure Academy, Author Profile & Blessings'
)
en_content = en_content.replace(
    'राहुल पटेल (संस्थापक व लेखक) का संदेश · मिशन वक्तव्य · 24x7 छात्र हेल्पलाइन सपोर्ट · सफलता की शपथ',
    'Message from Rahul Patel (Founder & Author) · Mission Statement · 24x7 Student Helpline · Commitment to Excellence'
)
en_content = en_content.replace(
    'स्मार्ट नेविगेशन एवं 1-टैप जंप सिस्टम',
    'Smart 1-Tap Jump Navigation System'
)
en_content = en_content.replace(
    'इस मास्टर हैंडबुक के प्रत्येक पृष्ठ के हेडर में #text(weight: "bold", fill: rtech-blue)[⮌ Index (विषय सूची)] लिंक उपलब्ध है। आप किसी भी पेज से तुरंत वापस इंडेक्स पर आ सकते हैं।',
    'Every page header in this master handbook contains an active embedded link to #text(weight: "bold", fill: rtech-blue)[⮌ Master Index]. You can return instantly to this Table of Contents from anywhere in the book.'
)
en_content = en_content.replace(
    '⮌ वापस मास्टर इंडेक्स भाग 1 (अध्याय 01 से 07 · पेज 02) पर जाएं',
    '⮌ Return to Master Index Part 1 (Chapters 01 to 07 · Page 02)'
)

# 5. Global text and terminology replacements
replacements = [
    ('महत्वपूर्ण संकल्पना (Core Concept)', 'Critical Enterprise Concept (Core Architecture)'),
    ('चेतावनी एवं सुरक्षा नियम (Critical Warning)', 'Critical Security Rule & Enterprise Caution'),
    ('Did You Know? (क्या आप जानते हैं?)', 'Did You Know? (Enterprise Architecture Fact)'),
    ('📝 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)', '📝 Practice Multiple-Choice Examination (MCQs)'),
    ('🎯 MNC प्लेसमेंट इंटरव्यू परिदृश्य एवं समाधान', '🎯 MNC Placement Interview Scenarios & Solutions'),
    ('🏢 अध्याय के प्रमुख कॉर्पोरेट निष्कर्ष (Corporate Takeaways)', '🏢 Chapter Corporate Takeaways & Enterprise Best Practices'),
    ('उत्तर: (A)', 'Answer: (A)'),
    ('उत्तर: (B)', 'Answer: (B)'),
    ('उत्तर: (C)', 'Answer: (C)'),
    ('उत्तर: (D)', 'Answer: (D)'),
    ('स्पष्टीकरण:', 'Technical Explanation:'),
    ('चित्र 1.1: एंटरप्राइज क्लाइंट-सर्वर नेटवर्क आर्किटेक्चर — केंद्रीय एक्टिव डायरेक्टरी, स्विचिंग एवं क्लाइंट्स', 'Figure 1.1: Enterprise Client-Server Architecture — Central Active Directory, Switching & Domain Endpoints'),
    ('चित्र 1.2: कॉर्पोरेट नेटवर्क के 8 प्रमुख सर्वर प्रकार एवं उनकी विशिष्ट भूमिकाएं', 'Figure 1.2: The 8 Core Enterprise Server Roles and Specialized Corporate Functions'),
    ('चित्र 1.3: सर्वर डिप्लॉयमेंट मॉडल — फिजिकल ऑन-प्रिमाइसेस vs वर्चुअलाइज्ड vs अज़ूर आर्क हाइब्रिड', 'Figure 1.3: Server Deployment Models — Physical On-Premises vs Virtualized vs Azure Arc Hybrid'),
    ('चित्र 1.4: विंडोज सर्वर का 32-वर्षीय संपूर्ण विकासक्रम (1993 Windows NT 3.1 से 2025 Server)', 'Figure 1.4: Complete 32-Year Windows Server Evolution Timeline (1993 Windows NT 3.1 to Server 2025)'),
    ('चित्र 1.5: आर्किटेक्चर तुलना — विंडोज 11 क्लाइंट vs विंडोज सर्वर 2025 एंटरप्राइज ओएस', 'Figure 1.5: Architectural Comparison — Windows 11 Client vs Windows Server 2025 Enterprise OS'),
    ('चित्र 2.1: RTechLab होम लैब नेटवर्क टोपोलॉजी — आइसोलेटेड वर्चुअल स्विच, DC एवं क्लाइंट मशीन', 'Figure 2.1: RTechLab Enterprise Home Lab Topology — Isolated Virtual Switch, DC01 and Win 11 Client'),
    ('चित्र 2.2: वर्चुअल मशीन निर्माण विज़ार्ड — रैम (4GB), vCPU (2 कोर) एवं डायनामिक VHDX हार्ड डिस्क', 'Figure 2.2: Virtual Machine Creation Wizard — RAM (4GB), vCPU (2 Cores) and Dynamic VHDX Disk'),
    ('चित्र 2.3: Windows Server 2025 ओएस एडिशन चयन — Desktop Experience vs Core आर्किटेक्चर', 'Figure 2.3: Windows Server 2025 Edition Selection — Desktop Experience vs Minimal Core'),
    ('चित्र 3.1: Windows Server 2025 सर्वर मैनेजर डैशबोर्ड — लोकल सर्वर रोल्स, इवेंट्स एवं सर्विसेज अवलोकन', 'Figure 3.1: Windows Server 2025 Server Manager Dashboard — Local Server Roles, Events & Services'),
    ('चित्र 3.2: एंटरप्राइज स्टैटिक आईपी एवं डीएनएस कॉन्फ़िगरेशन — लूपबैक डीएनएस मैपिंग (127.0.0.1)', 'Figure 3.2: Enterprise Static IP & DNS Configuration — Loopback DNS Mapping (127.0.0.1)'),
    ('चित्र 4.1: एक्टिव डायरेक्टरी लॉजिकल पदानुक्रम — फॉरेस्ट (Forest), डोमेन ट्री (Domain Tree) एवं OUs', 'Figure 4.1: Active Directory Logical Hierarchy — Forest, Domain Tree and Organizational Units (OUs)'),
    ('चित्र 4.2: एक्टिव डायरेक्टरी के 5 FSMO रोल्स — फॉरेस्ट-वाइड एवं डोमेन-वाइड रोल्स आर्किटेक्चर', 'Figure 4.2: Active Directory 5 FSMO Roles — Forest-Wide and Domain-Wide Role Architecture'),
    ('चित्र 5.1: एंटरप्राइज OU पदानुक्रम एवं AGDLP रोल-बेस्ड एक्सेस कंट्रोल (RBAC) संरचना', 'Figure 5.1: Corporate Tiered OU Hierarchy and AGDLP Role-Based Access Control Architecture'),
    ('चित्र 6.1: क्लाइंट मशीन डोमेन जॉइन वॉकथ्रू — डीएनएस नेम रेजोल्यूशन एवं क्रेडेंशियल प्रमाणीकरण प्रक्रिया', 'Figure 6.1: Client Endpoint Domain Join Workflow — DNS SRV Resolution & Kerberos Authentication'),
    ('चित्र 7.1: ग्रुप पॉलिसी ऑब्जेक्ट्स (GPO) LSDOU इनहेरिटेंस क्रम एवं एनफोर्स प्रेडिसेंस मॉडल', 'Figure 7.1: Group Policy (GPO) LSDOU Processing Precedence, Block Inheritance & Enforced Hierarchy'),
    ('चित्र 8.1: डीएचसीपी 4-स्टेप DORA प्रक्रिया — डिस्कवर, ऑफर, रिक्वेस्ट एवं एकनॉलेजमेंट लाइफसाइकिल', 'Figure 8.1: DHCP 4-Step DORA Protocol Workflow — Discover, Offer, Request & Acknowledgment'),
    ('चित्र 9.1: डीएनएस ज़ोन आर्किटेक्चर — फ़ॉरवर्ड लुकअप, रिवर्स लुकअप एवं रिसोर्स रिकॉर्ड्स (A, PTR, SRV)', 'Figure 9.1: DNS Server Zone Architecture — Forward Lookup, Reverse Lookup & Core Resource Records'),
    ('चित्र 10.1: शेयर परमिशन vs NTFS परमिशन तुलना मैट्रिक्स — मोस्ट रेस्ट्रिक्टिव नियम', 'Figure 10.1: Share vs NTFS Permissions Comparison Matrix — The Most Restrictive Security Formula'),
    ('चित्र 11.1: IIS 10.x वेब सर्वर एवं रिमोट डेस्कटॉप सर्विसेज (RDS) एंटरप्राइज आर्किटेक्चर', 'Figure 11.1: IIS 10.x Web Server & Remote Desktop Services (RDS) High-Availability Architecture'),
    ('चित्र 12.1: Windows Server 2025 नेक्स्ट-जेन फीचर्स — हॉटपैचिंग, ReFS डिडुप्लीकेशन एवं हाइब्रिड अज़ूर आर्क', 'Figure 12.1: Windows Server 2025 Next-Gen Innovations — Hotpatching, ReFS Dedup & Azure Arc'),
    ('चित्र 13.1: 3-2-1 एंटरप्राइज बैकअप रणनीति एवं एक्टिव डायरेक्टरी रीसायकल बिन 1-क्लिक रिकवरी फ्लो', 'Figure 13.1: Enterprise 3-2-1 Backup Strategy & Active Directory Recycle Bin 1-Click Recovery Flow'),
    ('चित्र 14.1: सिस्टम एडमिनिस्ट्रेटर कैरियर लैडर एवं आईटी इन्फ्रास्ट्रक्चर सीटीसी ग्रोथ ब्लूप्रिंट', 'Figure 14.1: Systems Administrator Career Progression Ladder & Enterprise Infrastructure Compensation Blueprint'),
    ('प्रिय छात्र एवं भावी एंटरप्राइज सिस्टम लीडर,', 'Dear Student and Future Enterprise Infrastructure Leader,'),
    ('राहुल पटेल (Rahul Patel)', 'Rahul Patel'),
    ('चीफ टेक्नोलॉजी आर्किटेक्ट', 'Chief Technology Architect'),
    ('संस्थापक, RTechLab Publications', 'Founder, RTechLab Publications'),
    ('मिशन वक्तव्य (Our Educational Mission)', 'Our Institutional Mission (Educational Excellence)'),
    ('24x7 छात्र तकनीकी हेल्पलाइन एवं डायरेक्ट मेंटरशिप', '24x7 Student Technical Helpline & Mentorship'),
    ('व्हाट्सएप हेल्पलाइन (WhatsApp): +91 76468 92094', 'WhatsApp Helpline: +91 76468 92094'),
    ('ईमेल सहायता (Official Email): rahul.28e1\\@gmail.com', 'Email Support: rahul.28e1\\@gmail.com'),
    ('सफलता की शपथ (Your Pledge to Excellence)', 'Pledge to Professional Excellence'),
    ('आरटेक लैब पब्लिकेशन · सर्वाधिकार सुरक्षित · 2027 एडिशन', 'RTechLab Publications · All Rights Reserved · 2027 Edition')
]

for src, dst in replacements:
    en_content = en_content.replace(src, dst)

output_file = "DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/English/master_book_en.typ"
with open(output_file, "w", encoding="utf-8") as f:
    f.write(en_content)

print(f"Written English Master Book source: {output_file}")
