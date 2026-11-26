import React, { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router';
import { WhatsAppCommunityCard } from '../components/WhatsAppCommunityCard';

// ── 6 OFFICIAL RTECHLAB SUBJECTS (EXACT SEQUENCE & REAL PAGE COUNTS) ────────
const SUBJECTS = [
  {
    id: 'server2025',
    category: 'infrastructure',
    title: 'Microsoft Windows Server 2025 & Active Directory Administration',
    subtitle: 'AD DS, GPO, DNS, DHCP, Hotpatching, 32KB AD DB & Hybrid Cloud Admin',
    desc: 'From zero-to-production enterprise administration: Client-Server architecture, Active Directory (AD DS), Group Policy (GPO), Enterprise DNS & DHCP, IIS Web Server, File Services & FSRM Ransomware screening, Server 2025 Flagship Hotpatching & SMB over QUIC, Top 50 MNC SysAdmin Placement Vault, and ₹18 LPA Career Blueprint.',
    pages: '60 Pages Master Guide',
    bundlePages: '140 Pages Complete Suite',
    tag: 'Enterprise Flagship · Edition 1 (2027)',
    accent: 'sky',
    badge: '🔥 2027 Flagship',
    badgeSub: 'Cloud & SysAdmin Track (₹3.5L–₹18L+)',
    previewPdfEn: '/downloads/Windows-Server-2025-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Windows-Server-2025-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Windows-Server-2025-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Windows-Server-2025-English-Master-Guide.pdf',
    fullPdfHi: '/downloads/Windows-Server-2025-Hindi-Master-Guide.pdf',
    fullPdfGu: '/downloads/Windows-Server-2025-Gujarati-Master-Guide.pdf',
    bundleZip: '/downloads/Windows-Server-2025-Career-Accelerator-Bundle.zip',
    bundleZipSize: '17.3 MB',
    bundleItems: [
      { name: 'Windows Server 2025 Core Master Guide (English)', pages: '60 Pages', file: 'Windows-Server-2025-English-Master-Guide.pdf', badge: 'Master Guide' },
      { name: 'Windows Server 2025 Core Master Guide (Hindi)', pages: '60 Pages', file: 'Windows-Server-2025-Hindi-Master-Guide.pdf', badge: 'Hindi Edition' },
      { name: 'Windows Server 2025 Core Master Guide (Gujarati)', pages: '60 Pages', file: 'Windows-Server-2025-Gujarati-Master-Guide.pdf', badge: 'Gujarati Edition' },
      { name: 'Top 50 MNC Systems Administrator Interview Vault', pages: '10 Pages', file: 'Windows-Server-2025-Top-50-MNC-Interview-Vault.pdf', badge: 'Interview Vault' },
      { name: '12 Hands-On Enterprise Labs & PowerShell Workbook', pages: '7 Pages', file: 'Windows-Server-2025-Practice-Set-and-Lab-Workbook.pdf', badge: 'Lab Workbook' },
      { name: 'SysAdmin to Cloud Architect Career & Salary Blueprint', pages: '3 Pages', file: 'Windows-Server-2025-System-Admin-Career-and-Salary-Blueprint.pdf', badge: 'Salary Blueprint' },
      { name: '1-Click Master ZIP Offline Bundle', pages: 'All 6 Deliverables', file: 'Windows-Server-2025-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'Ch 01-03: Server Architecture, Hardware Sizing, Virtualization & Windows Server 2025 Installation',
      'Ch 04-06: Active Directory (AD DS), Forest/Domain Topology, 5 FSMO Roles & Client Domain Join',
      'Ch 07-08: Group Policy (GPO) Architecture, Removable Storage Lockdown & Enterprise DNS/DHCP',
      'Ch 09-11: File Services & FSRM Ransomware Protection, IIS 10.x SSL Web Server & Hyper-V Virtualization',
      'Ch 12-14: Server 2025 Hotpatching, SMB over QUIC, Disaster Recovery, Backup & Career Roadmap',
    ],
  },
  {
    id: 'ai',
    category: 'ai',
    title: 'Artificial Intelligence Mastery',
    subtitle: 'Neural Networks, LLMs, Enterprise Prompts & Autonomous AI Agents',
    desc: 'Complete mathematical & architectural foundations of Deep Learning, Transformers & Attention, Enterprise Prompt Engineering, RAG Vector Search, Autonomous AI Agents, and the 2027 India & Global Job Market roadmap.',
    pages: '44 Pages Master Guide',
    bundlePages: '112 Pages Complete Suite',
    tag: '2027 Next-Gen Standard · Edition 1',
    accent: 'purple',
    badge: '🔥 Most Popular',
    badgeSub: 'Highest CTC Track (₹6L–₹22L+)',
    previewPdfEn: '/downloads/AI-Essentials-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/AI-Essentials-English-Edition-1.pdf',
    fullPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/AI-Essentials-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/AI-Career-Accelerator-Bundle.zip',
    bundleZipSize: '6.4 MB',
    bundleItems: [
      { name: 'AI Essentials Core Master Guide (English)', pages: '44 Pages', file: 'AI-Essentials-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'AI Essentials Core Master Guide (Hindi)', pages: '44 Pages', file: 'AI-Essentials-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'AI Essentials Core Master Guide (ગુજરાતી)', pages: '44 Pages', file: 'AI-Essentials-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },
      { name: 'Top 50 AI Interview Questions & 100 Enterprise Prompts Vault', pages: '12 Pages', file: 'AI-Top-50-Interview-Questions-and-100-Enterprise-Prompts-Vault.pdf', badge: 'Interview Vault' },
      { name: 'AI Career, Salary Blueprint & Roadmap', pages: '12 Pages', file: 'AI-Career-and-Salary-Blueprint-Edition-1.pdf', badge: 'Salary Blueprint' },
      { name: '1-Click Master ZIP Offline Bundle', pages: 'All 4 PDFs', file: 'AI-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'Ch 01-02: Foundations of AI, Machine Learning & Deep Neural Nets',
      'Ch 03-04: Transformer Architecture, Self-Attention & LLM Internals',
      'Ch 05-06: Enterprise Prompt Engineering & Production RAG Vector Search',
      'Ch 07-08: Autonomous AI Agents, Tool Calling & Multi-Agent Swarms',
      'Ch 09-10: Ethical AI, India vs Global IT Market & 2027 Career Blueprint',
    ],
  },
  {
    id: 'office-365',
    category: 'productivity',
    title: 'Microsoft Office 365 Enterprise Suite',
    subtitle: 'Advanced Excel, Word, PowerPoint, Access, Outlook & MIS Automation',
    desc: 'From corporate Word legal document styling to Advanced Excel XLOOKUP, Dynamic Arrays, Power Query, Executive PowerPoint pitch decks, Access relational databases, and corporate MIS workflows.',
    pages: '113 Pages Master Guide',
    bundlePages: '272 Pages Complete Suite',
    tag: 'Corporate Enterprise Edition · Edition 1',
    accent: 'blue',
    badge: '⚡ 100% Placement Ready',
    badgeSub: 'Corporate MIS Standard (₹3.5L–₹9.5L)',
    previewPdfEn: '/downloads/Office-365-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Office-365-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Office-365-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Office-365-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Office-365-Gujarati-Edition-1.pdf',
    hasCheatSheet: true,
    cheatSheetPages: '8 Pages Desk Reference',
    cheatSheetPdfEn: '/downloads/Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf',
    cheatSheetPdfHi: '/downloads/Office-365-Quick-Desk-Reference-Cheat-Sheet-Hindi.pdf',
    cheatSheetPdfGu: '/downloads/Office-365-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf',
    bundleZip: '/downloads/Office-365-Career-Accelerator-Bundle.zip',
    bundleZipSize: '16.7 MB',
    bundleItems: [
      { name: 'Office 365 8-Page Desk Reference & Cheat Sheet (All Languages)', pages: '8 Pages', file: 'Office-365-Quick-Desk-Reference-Cheat-Sheet-English.pdf', badge: '⚡ Desk Sheet' },
      { name: 'Office 365 Enterprise Master Guide (English)', pages: '113 Pages', file: 'Office-365-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'Office 365 Enterprise Master Guide (Hindi)', pages: '113 Pages', file: 'Office-365-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'Office 365 Enterprise Master Guide (ગુજરાતી)', pages: '113 Pages', file: 'Office-365-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },
      { name: 'Top 100 Shortcuts & 50 MIS Interview Vault (English)', pages: '9 Pages', file: 'Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf', badge: 'Interview Vault' },
      { name: 'Top 100 Shortcuts & 50 MIS Interview Vault (Hindi)', pages: '9 Pages', file: 'Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf', badge: 'Hindi Vault' },
      { name: 'Practical Excel Templates & Formula Workbook', pages: '16 Pages', file: 'Office-365-Practical-Excel-Templates-Workbook-Guide.pdf', badge: 'Practical Labs' },
      { name: 'Word & Excel Hands-On Practice Templates (.docx & .xlsx)', pages: '6 Lab Files', file: 'Office-365-Practice-Templates-and-Lab-Files.zip', badge: 'Lab Practice Files' },
      { name: 'MIS Executive Career, Salary Blueprint & Roadmap', pages: '12 Pages', file: 'Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf', badge: 'Salary Blueprint' },
      { name: '1-Click Master ZIP Offline Bundle', pages: 'All PDFs + Lab Files', file: 'Office-365-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'Ch 01-03: Word 365 Corporate Architecture, Mail Merge & Legal Document Control',
      'Ch 04-07: Advanced Excel XLOOKUP, Pivot Tables, Power Query & Dynamic Arrays',
      'Ch 08-09: Executive PowerPoint Pitch Decks, Data Storytelling & Master Slides',
      'Ch 10-12: Access Relational DBs, Outlook Inbox Zero Protocol & Security Rules',
      'Ch 13: Top 100 Enterprise Shortcuts & 50 Corporate MIS Placement Question Bank',
    ],
  },
  {
    id: 'fundamentals',
    category: 'systems',
    title: 'Computer Fundamentals & Architecture',
    subtitle: 'Silicon Architecture, Memory Hierarchy, OS & Hardware Diagnostics',
    desc: 'Silicon IPO cycle, RAM/ROM storage hierarchy, CPU machine cycle, OS kernel architecture, PC assembly, and Top 50 MNC technical placement questions with senior model answers.',
    pages: '45 Pages Master Guide',
    bundlePages: '119 Pages Complete Suite',
    tag: 'Core Foundation · Edition 1',
    accent: 'emerald',
    badge: '💻 Core Foundation',
    badgeSub: 'Silicon Architecture (₹3.2L–₹7.5L)',
    previewPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip',
    bundleZipSize: '30 MB',
    bundleItems: [
      { name: 'Computer Fundamentals Core Master Guide (English)', pages: '45 Pages', file: 'Computer-Fundamentals-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'Computer Fundamentals Core Master Guide (Hindi)', pages: '45 Pages', file: 'Computer-Fundamentals-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'Computer Fundamentals Core Master Guide (ગુજરાતી)', pages: '45 Pages', file: 'Computer-Fundamentals-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },
      { name: 'Enterprise & FAANG Systems Deep-Dive', pages: '7 Pages', file: 'Computer-Fundamentals-Enterprise-DeepDive-Edition-1.pdf', badge: 'FAANG DeepDive' },
      { name: 'Top 50 MNC Placement Interview Practice Vault', pages: '7 Pages', file: 'Computer-Fundamentals-Interview-Practice-Vault-Edition-1.pdf', badge: 'Interview Vault' },
      { name: 'Career & Salary Blueprint Roadmap', pages: '5 Pages', file: 'Computer-Fundamentals-Career-Salary-Blueprint-Edition-1.pdf', badge: 'Salary Blueprint' },
      { name: 'Practical Lab Diagnostics Workbook', pages: '10 Pages', file: 'Computer-Fundamentals-Practical-Lab-Workbook-Edition-1.pdf', badge: 'Practical Labs' },
      { name: '1-Click Master ZIP Offline Bundle', pages: 'All 6 PDFs', file: 'RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'Ch 01-02: Silicon IPO Cycle, Modern I/O Ports & 5 Generations Matrix',
      'Ch 03-05: RAM/ROM Hierarchy, Cache L1-L3, CPU Machine Cycle & Logic Gates',
      'Ch 06-08: Operating System Architecture, Kernel, Memory Management & Security',
      'Ch 09: Physical Assembly, ESD Safety Standards & Diagnostic Triage Tools',
      'Ch 10: Top 50 MNC Placement Technical Interview Question Bank',
    ],
  },
  {
    id: 'tally',
    category: 'accounting',
    title: 'Tally Prime with GST & Corporate Accounting',
    subtitle: 'Golden Rules, 28 Groups, 24 Vouchers, Modern GST (0%/5%/18%) & TDS',
    desc: 'Complete practical vocational handbook from accounting fundamentals to 28 master groups, 24 voucher types, modern GST slabs (0%, 5%, 18%), TDS deduction entries (Sec 194C, 194J, 194I), and 50+ real-world commercial invoice sets (APMC agriculture commodities, electronics, and interstate IGST).',
    pages: '51 Pages Master Guide',
    bundlePages: '80+ Pages Complete Suite',
    tag: 'Tally Prime 2027 · Edition 1',
    accent: 'amber',
    badge: '📊 Gujarat #1 Vocational Track',
    badgeSub: 'Corporate Accountant Track (₹2.5L–₹7.5L)',
    previewPdfEn: '/downloads/Tally-Prime-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Tally-Prime-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Tally-Prime-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Tally-Prime-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1.pdf',
    hasCheatSheet: true,
    cheatSheetPages: '8 Pages Desk Reference',
    cheatSheetPdfEn: '/downloads/Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-English.pdf',
    cheatSheetPdfHi: '/downloads/Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-Edition-1.pdf',
    cheatSheetPdfGu: '/downloads/Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf',
    bundleZip: '/downloads/Tally-Prime-Career-Accelerator-Bundle.zip',
    bundleZipSize: '11.4 MB',
    bundleItems: [
      { name: 'Tally Prime 2027 8-Page Desk Reference & Cheat Sheet (All Languages)', pages: '8 Pages', file: 'Tally-Prime-Quick-Desk-Reference-Cheat-Sheet-Edition-1.pdf', badge: '⚡ Desk Sheet' },
      { name: 'Tally Prime with GST Core Master Guide (English)', pages: '51 Pages', file: 'Tally-Prime-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'Tally Prime with GST Core Master Guide (Hindi)', pages: '51 Pages', file: 'Tally-Prime-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'Tally Prime with GST Core Master Guide (Gujarati)', pages: '51 Pages', file: 'Tally-Prime-Gujarati-Edition-1.pdf', badge: 'Gujarati Edition' },
      { name: '50-Invoice Commercial Practice Workbook & APMC Datasets', pages: '16 Pages', file: 'Tally-50-Invoice-Commercial-Workbook.pdf', badge: 'Practice Workbook' },
      { name: 'Advanced TDS & Form 26Q Live Practice Set', pages: '4 Pages', file: 'Tally-TDS-and-Form-26Q-Practice-Workbook.pdf', badge: 'TDS Workbook' },
      { name: 'Top 50 Corporate Accountant & GST Interview Question Vault (English)', pages: '6 Pages', file: 'Tally-Top-50-Accountant-Interview-Vault.pdf', badge: 'Interview Vault' },
      { name: 'Corporate Accountant Career Roadmap & Salary Blueprint', pages: '2 Pages', file: 'Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf', badge: 'Salary Blueprint' },
      { name: '1-Click Master ZIP Offline Bundle', pages: 'All 7 PDFs', file: 'Tally-Prime-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'Ch 01-03: Tally Prime Architecture, Golden Rules of Accounting & Mr. Verma 50 Practice Set',
      'Ch 04-06: 28 Pre-defined Groups, 24 Voucher Types & Company Creation Labs (Palanpur/Ahmedabad)',
      'Ch 07-08: Modern GST Framework (0%, 5%, 18% Slabs & F11 SOP) & TDS Essentials (194C, 194J, 194I)',
      'Ch 09-10: 50+ Invoices (APMC Jeera/Isabgol, Electronics, Interstate IGST, Debit/Credit Notes)',
      'Ch 11-12: Year-End Final Accounts (Depreciation/P&L/Balance Sheet), Bank Reconciliation & Capstone Lab',
    ],
  },
  {
    id: 'ccna',
    category: 'networking',
    title: 'Cisco CCNA 200-301 Master Suite',
    subtitle: 'Enterprise Switching, OSPF Routing, IPv6 & Cisco IOS TAC Standard',
    desc: '3-Tier/Spine-Leaf enterprise networks, IPv4 VLSM & IPv6 architecture, Cisco IOS CLI & ROMMON recovery, VLANs/STP, OSPF, ACLs, and Top 120 Cisco TAC placement Q&A.',
    pages: '49 Pages Master Guide',
    bundlePages: '128 Pages Complete Suite',
    tag: 'Cisco TAC Standard · Edition 1',
    accent: 'cyan',
    badge: '🌐 Cisco TAC Standard',
    badgeSub: 'Network Pro Track (₹4.5L–₹14L+)',
    previewPdfEn: '/downloads/CCNA-200-301-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/CCNA-200-301-English-Edition-1.pdf',
    fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip',
    bundleZipSize: '19.8 MB',
    bundleItems: [
      { name: 'Cisco CCNA 200-301 Master Guide (English)', pages: '49 Pages', file: 'CCNA-200-301-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'Cisco CCNA 200-301 Master Guide (Hindi)', pages: '49 Pages', file: 'CCNA-200-301-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'Cisco CCNA 200-301 Master Guide (ગુજરાતી)', pages: '49 Pages', file: 'CCNA-200-301-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },
      { name: 'Cisco TAC Top 120 Technical Interview Question Vault', pages: '14 Pages', file: 'CCNA-200-301-Interview-Question-Vault-Edition-1.pdf', badge: 'Interview Vault' },
      { name: 'Network Engineer Career & Salary Blueprint', pages: '4 Pages', file: 'CCNA-200-301-Network-Engineer-Career-Salary-Blueprint-Edition-1.pdf', badge: 'Salary Blueprint' },
      { name: 'Packet Tracer Hands-on Production Lab Workbook', pages: '12 Pages', file: 'CCNA-200-301-Packet-Tracer-Lab-Workbook-Edition-1.pdf', badge: 'Packet Tracer Labs' },
      { name: '1-Click Master ZIP Offline Bundle', pages: 'All 5 PDFs', file: 'RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'Ch 01-02: 3-Tier Enterprise vs Spine-Leaf Architectures & Cat6/Fiber Media',
      'Ch 03-04: IPv4 Subnetting Masterclass (VLSM/FLSM) & IPv6 SLAAC/EUI-64',
      'Ch 05-06: Cisco IOS Architecture, ROMMON Recovery & CLI Command Mastery',
      'Ch 07-08: Switching (VLANs/Trunking/STP) & IP Routing (OSPFv2/AD/Metrics)',
      'Ch 09-10: Enterprise Network Services (DHCP/NAT/ACL) & TAC Placement Vault',
    ],
  },
];

// ── REAL PREVIEW ASSETS & LABELS (AUTHENTIC 3D NOTEBOOK) ─────────────────────
const PREVIEW_ASSETS = {
  server2025: {
    en: [
      '/previews/server2025/preview-1.png',
      '/previews/server2025/preview-2.png',
      '/previews/server2025/preview-3.png',
      '/previews/server2025/preview-4.png',
      '/previews/server2025/preview-5.png',
    ],
    hi: [
      '/previews/server2025/preview-hi-1.png',
      '/previews/server2025/preview-hi-2.png',
      '/previews/server2025/preview-hi-3.png',
      '/previews/server2025/preview-hi-4.png',
      '/previews/server2025/preview-hi-5.png',
    ],
    gu: [
      '/previews/server2025/preview-gu-1.png',
      '/previews/server2025/preview-gu-2.png',
      '/previews/server2025/preview-gu-3.png',
      '/previews/server2025/preview-gu-4.png',
      '/previews/server2025/preview-gu-5.png',
    ],
    labelsEn: [
      'Page 1: Official Master Book Cover · Windows Server 2025 & AD DS',
      'Page 2: Complete Table of Contents (Part 1 · Chapters 01 to 07)',
      'Page 3: Complete Table of Contents (Part 2 · Chapters 08 to 14)',
      'Page 4: Chapter 1 — Server Architecture, 8 Core Roles & Hardware Sizing',
      'Page 5: Client-Server Architecture Infographic & Evolution Timeline',
    ],
    labelsHi: [
      'पेज 1: आधिकारिक मास्टर बुक कवर · विंडोज़ सर्वर 2025 एवं एक्टिव डायरेक्टरी',
      'पेज 2: संपूर्ण अनुक्रमणिका (भाग 1 · अध्याय 01 से 07)',
      'पेज 3: संपूर्ण अनुक्रमणिका (भाग 2 · अध्याय 08 से 14)',
      'पेज 4: अध्याय 1 — सर्वर आर्किटेक्चर, 8 मुख्य रोल्स एवं हार्डवेयर साइजिंग',
      'पेज 5: क्लाइंट-सर्वर आर्किटेक्चर इंफोग्राफिक एवं एवोल्यूशन टाइमलाइन',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર માસ્ટર બુક કવર · વિન્ડોઝ સર્વર 2025 અને એક્ટિવ ડિરેક્ટરી',
      'પેજ 2: સંપૂર્ણ અનુક્રમણિકા (ભાગ 1 · પ્રકરણ 01 થી 07)',
      'પેજ 3: સંપૂર્ણ અનુક્રમણિકા (ભાગ 2 · પ્રકરણ 08 થી 14)',
      'પેજ 4: પ્રકરણ 1 — સર્વર આર્કિટેક્ચર, 8 મુખ્ય રોલ્સ અને હાર્ડવેર સાઈઝિંગ',
      'પેજ 5: ક્લાયન્ટ-સર્વર આર્કિટેક્ચર ઇન્ફોગ્રાફિક અને ઇવોલ્યુશન ટાઇમલાઇન',
    ],
  },
  ai: {
    en: [
      '/previews/ai/preview-1.png',
      '/previews/ai/preview-2.png',
      '/previews/ai/preview-3.png',
      '/previews/ai/preview-4.png',
      '/previews/ai/preview-5.png',
    ],
    hi: [
      '/previews/ai/preview-hi-1.png',
      '/previews/ai/preview-hi-2.png',
      '/previews/ai/preview-hi-3.png',
      '/previews/ai/preview-hi-4.png',
      '/previews/ai/preview-hi-5.png',
    ],
    labelsEn: [
      'Page 1: Official Master Book Cover · Deep Learning & Sovereign AI',
      'Page 2: 2027 Curriculum Blueprint · 42 Production Modules & Labs',
      'Page 3: Part 1 — The Dawn of Intelligent Machines: 1950 to Dartmouth 1956',
      'Page 4: Golden Age, Perceptrons & The First AI Winter (1957–1980)',
      'Page 5: Expert Systems & The Second AI Winter (1980–1993)',
    ],
    labelsHi: [
      'पेज 1: आधिकारिक AI मास्टर बुक कवर · डीप लर्निंग व सॉवरेन AI',
      'पेज 2: 2027 AI पाठ्यक्रम ब्लूप्रिंट · 42 प्रोडक्शन मॉड्यूल्स व लैब्स',
      'पेज 3: भाग 1 — AI की शुरुआत: 1950 से डार्टमाउथ कॉन्फ्रेंस 1956',
      'पेज 4: गोल्डन एरा, परसेप्ट्रॉन व पहला AI विंटर (1957–1980)',
      'पेज 5: एक्सपर्ट सिस्टम्स व दूसरा AI विंटर (1980–1993)',
    ],
    gu: [
      '/previews/ai/preview-gu-1.png',
      '/previews/ai/preview-gu-2.png',
      '/previews/ai/preview-gu-3.png',
      '/previews/ai/preview-gu-4.png',
      '/previews/ai/preview-gu-5.png',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર AI માસ્ટર બુક કવર · ડીપ લર્નિંગ અને સોવરેન AI',
      'પેજ 2: 2027 AI અભ્યાસક્રમ બ્લૂપ્રિન્ટ · 42 પ્રોડક્શન મોડ્યુલ્સ અને લેબ્સ',
      'પેજ 3: ભાગ 1 — AI ની શરૂઆત: 1950 થી ડાર્ટમાઉથ કોન્ફરન્સ 1956',
      'પેજ 4: ગોલ્ડન એરા, પર્સેપ્ટ્રોન અને પ્રથમ AI વિન્ટર (1957–1980)',
      'પેજ 5: એક્સપર્ટ સિસ્ટમ્સ અને બીજો AI વિન્ટર (1980–1993)',
    ],
  },
  'office-365': {
    en: [
      '/previews/office365/preview-1.png',
      '/previews/office365/preview-2.png',
      '/previews/office365/preview-3.png',
      '/previews/office365/preview-4.png',
      '/previews/office365/preview-5.png',
    ],
    hi: [
      '/previews/office365/preview-hi-1.png',
      '/previews/office365/preview-hi-2.png',
      '/previews/office365/preview-hi-3.png',
      '/previews/office365/preview-hi-4.png',
      '/previews/office365/preview-hi-5.png',
    ],
    labelsEn: [
      'Page 1: Official Office 365 Enterprise Master Cover',
      'Page 2: Master Blueprint · 32 Production Modules & 13 Real Labs',
      'Page 3: Part 1 — Word 365 Architecture, Workspace & File Backstage',
      'Page 4: Document View Modes & Corporate Productivity Environments',
      'Page 5: Corporate Standard Templates & Style Automation',
    ],
    labelsHi: [
      'पेज 1: आधिकारिक Office 365 एंटरप्राइज मास्टर कवर',
      'पेज 2: मास्टर ब्लूप्रिंट · 32 प्रोडक्शन मॉड्यूल्स और 13 प्रैक्टिकल लैब्स',
      'पेज 3: भाग 1 — Word 365 आर्किटेक्चर और फाइल बैकस्टेज',
      'पेज 4: डॉक्यूमेंट व्यू मोड्स और प्रोडक्टिविटी टूल्स',
      'पेज 5: कॉर्पोरेट टेम्पलेट्स और स्टाइल ऑटोमेशन',
    ],
    gu: [
      '/previews/office365/preview-gu-1.png',
      '/previews/office365/preview-gu-2.png',
      '/previews/office365/preview-gu-3.png',
      '/previews/office365/preview-gu-4.png',
      '/previews/office365/preview-gu-5.png',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર Office 365 એન્ટરપ્રાઇઝ માસ્ટર કવર',
      'પેજ 2: માસ્ટર બ્લૂપ્રિન્ટ · 32 પ્રોડક્શન મોડ્યુલ્સ અને 13 પ્રેક્ટિકલ લેબ્સ',
      'પેજ 3: ભાગ 1 — Word 365 આર્કિટેક્ચર અને ફાઇલ બેકસ્ટેજ',
      'પેજ 4: ડોક્યુમેન્ટ વ્યુ મોડ્સ અને પ્રોડક્ટિવિટી ટુલ્સ',
      'પેજ 5: કોર્પોરેટ ટેમ્પ્લેટ્સ અને સ્ટાઇલ ઓટોમેશન',
    ],
  },
  fundamentals: {
    en: [
      '/previews/fundamentals/en-page-1.png',
      '/previews/fundamentals/en-page-2.png',
      '/previews/fundamentals/en-page-3.png',
      '/previews/fundamentals/en-page-4.png',
      '/previews/fundamentals/en-page-5.png',
    ],
    hi: [
      '/previews/fundamentals/hi-page-1.png',
      '/previews/fundamentals/hi-page-2.png',
      '/previews/fundamentals/hi-page-3.png',
      '/previews/fundamentals/hi-page-4.png',
      '/previews/fundamentals/hi-page-5.png',
    ],
    labelsEn: [
      'Page 1: Official Master Book Cover · Silicon Architecture',
      'Page 2: Ch 01 — Computer Systems & The Silicon IPO Cycle',
      'Page 3: Computer Generations (1st to 5th Matrix)',
      'Page 4: Modern Input Peripherals & Sensor Tech',
      'Page 5: Display Technology (OLED vs IPS) & Diagnostics Ports',
    ],
    labelsHi: [
      'पेज 1: आधिकारिक मास्टर बुक कवर · सिलिकॉन आर्किटेक्चर',
      'पेज 2: अध्याय 1 — कम्प्यूटर सिस्टम और सिलिकॉन IPO साइकिल',
      'पेज 3: 5 कम्प्यूटर पीढ़ियाँ और हार्डवेयर कंपैरिजन',
      'पेज 4: इनपुट डिवाइसेस, सेंसर्स और पोर्ट्स',
      'पेज 5: डिस्प्ले टेक्नोलॉजी और डायग्नोस्टिक पोर्ट्स',
    ],
    gu: [
      '/previews/fundamentals/gu-page-1.png',
      '/previews/fundamentals/gu-page-2.png',
      '/previews/fundamentals/gu-page-3.png',
      '/previews/fundamentals/gu-page-4.png',
      '/previews/fundamentals/gu-page-5.png',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર માસ્ટર બુક કવર · સિલિકોન આર્કિટેક્ચર',
      'પેજ 2: પ્રકરણ 1 — કમ્પ્યુટર સિસ્ટમ્સ અને સિલિકોન IPO સાયકલ',
      'પેજ 3: 5 કમ્પ્યુટર પેઢીઓ અને હાર્ડવેર સરખામણી',
      'પેજ 4: ઇનપુટ ડિવાઇસીસ, સેન્સર્સ અને પોર્ટ્સ',
      'પેજ 5: ડિસ્પ્લે ટેકનોલોજી અને ડાયગ્નોસ્ટિક પોર્ટ્સ',
    ],
  },
  ccna: {
    en: [
      '/previews/ccna/en-page-1.png',
      '/previews/ccna/en-page-2.png',
      '/previews/ccna/en-page-3.png',
      '/previews/ccna/en-page-4.png',
      '/previews/ccna/en-page-5.png',
    ],
    hi: [
      '/previews/ccna/hi-page-1.png',
      '/previews/ccna/hi-page-2.png',
      '/previews/ccna/hi-page-3.png',
      '/previews/ccna/hi-page-4.png',
      '/previews/ccna/hi-page-5.png',
    ],
    labelsEn: [
      'Page 1: Official CCNA Master Book Cover · Cisco TAC Standard',
      'Page 2: Ch 01 — Modern Enterprise Network Architectures',
      'Page 3: 2-Tier Collapsed Core vs 3-Tier vs Spine-Leaf Design',
      'Page 4: Network Media & UTP vs Fiber Cabling Standards',
      'Page 5: T568A/B Pinouts & Collision/Broadcast Domains',
    ],
    labelsHi: [
      'पेज 1: आधिकारिक CCNA 200-301 मास्टर बुक कवर',
      'पेज 2: अध्याय 1 — आधुनिक एंटरप्राइज नेटवर्क आर्किटेक्चर',
      'पेज 3: 2-टियर कोलैप्सड कोर, 3-टियर और स्पाइन-लीफ डिजाइन',
      'पेज 4: UTP Cat6 और सिंगल/मल्टी-मोड फाइबर केबलिंग',
      'पेज 5: T568A/B पिनआउट्स और कोलिजन/ब्रॉडकास्ट डोमेन',
    ],
    gu: [
      '/previews/ccna/gu-page-1.png',
      '/previews/ccna/gu-page-2.png',
      '/previews/ccna/gu-page-3.png',
      '/previews/ccna/gu-page-4.png',
      '/previews/ccna/gu-page-5.png',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર CCNA 200-301 માસ્ટર બુક કવર',
      'પેજ 2: પ્રકરણ 1 — આધુનિક એન્ટરપ્રાઇઝ નેટવર્ક આર્કિટેક્ચર',
      'પેજ 3: 2-ટિયર કોલેપ્સ્ડ કોર, 3-ટિયર અને સ્પાઇન-લીફ ડિઝાઇન',
      'પેજ 4: UTP Cat6 અને સિંગલ/મલ્ટી-મોડ ફાઇબર કેબલિંગ',
      'પેજ 5: T568A/B પિનઆઉટ્સ અને કોલિઝન/બ્રોડકાસ્ટ ડોમેન',
    ],
  },
  tally: {
    en: [
      '/previews/tally/preview-1.png',
      '/previews/tally/preview-2.png',
      '/previews/tally/preview-3.png',
      '/previews/tally/preview-4.png',
      '/previews/tally/preview-5.png',
    ],
    hi: [
      '/previews/tally/preview-hi-1.png',
      '/previews/tally/preview-hi-2.png',
      '/previews/tally/preview-hi-3.png',
      '/previews/tally/preview-hi-4.png',
      '/previews/tally/preview-hi-5.png',
    ],
    gu: [
      '/previews/tally/preview-gu-1.png',
      '/previews/tally/preview-gu-2.png',
      '/previews/tally/preview-gu-3.png',
      '/previews/tally/preview-gu-4.png',
      '/previews/tally/preview-gu-5.png',
    ],
    labelsEn: [
      'Page 1: Official Master Book Cover · Tally Prime with GST & TDS',
      'Page 2: Chapter 1 — Financial Accounting Basics & Gateway of Tally',
      'Page 3: Chapter 2 — The 3 Golden Rules & Accounting Classification',
      'Page 4: Chapter 4 — The 28 Pre-defined Master Groups',
      'Page 5: Chapter 7 — Modern GST Slabs (0%, 5%, 18%) & Tally Setup SOP',
    ],
    labelsHi: [
      'पेज 1: आधिकारिक मास्टर बुक कवर · Tally Prime with GST & TDS',
      'पेज 2: अध्याय 1 — वित्तीय लेखांकन परिचय और गेटवे ऑफ टैली',
      'पेज 3: अध्याय 2 — लेखांकन के 3 सुनहरे नियम और खाते',
      'पेज 4: अध्याय 4 — टैली के 28 प्री-डिफ़ाइंड मास्टर ग्रुप्स',
      'पेज 5: अध्याय 7 — आधुनिक GST स्लैब (0%, 5%, 18%) और टैली सेटअप SOP',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર માસ્ટર બુક કવર · Tally Prime with GST & TDS',
      'પેજ 2: પ્રકરણ 1 — નાણાકીય હિસાબ અને ગેટવે ઓફ ટેલી પરિચય',
      'પેજ 3: પ્રકરણ 2 — નામું લખવાના 3 સુવર્ણ નિયમો (Golden Rules)',
      'પેજ 4: પ્રકરણ 4 — ટેલી પ્રાઇમના 28 પ્રી-ડિફાઇન્ડ માસ્ટર ગ્રુપ્સ',
      'પેજ 5: પ્રકરણ 7 — આધુનિક GST સ્લેબ (0%, 5%, 18%) અને ટેલી સેટઅપ SOP',
    ],
  },
  office365: {
    en: [
      '/previews/office365/preview-1.png',
      '/previews/office365/preview-2.png',
      '/previews/office365/preview-3.png',
      '/previews/office365/preview-4.png',
      '/previews/office365/preview-5.png',
    ],
    hi: [
      '/previews/office365/preview-hi-1.png',
      '/previews/office365/preview-hi-2.png',
      '/previews/office365/preview-hi-3.png',
      '/previews/office365/preview-hi-4.png',
      '/previews/office365/preview-hi-5.png',
    ],
    gu: [
      '/previews/office365/preview-gu-1.png',
      '/previews/office365/preview-gu-2.png',
      '/previews/office365/preview-gu-3.png',
      '/previews/office365/preview-gu-4.png',
      '/previews/office365/preview-gu-5.png',
    ],
    labelsEn: [
      'Page 1: Official Master Book Cover · Office 365 Enterprise',
      'Page 2: 2027 Enterprise Curriculum Blueprint · 32 Modules & 13 Labs',
      'Page 3: Chapter 01 — Modern Workspace Architecture & Ribbon Navigation',
      'Page 4: Backstage View, Inspect Document & Enterprise Workspace Interface',
      'Page 5: Production Protocol, Review Q&A & Evaluation Dashboard',
    ],
    labelsHi: [
      'पेज 1: आधिकारिक मास्टर बुक कवर · माइक्रोसॉफ्ट ऑफिस 365 एंटरप्राइज',
      'पेज 2: 2027 एंटरप्राइज पाठ्यक्रम ब्लूप्रिंट · 32 विस्तृत मॉड्यूल व 13 लैब्स',
      'पेज 3: अध्याय 01 — मॉडर्न वर्कस्पेस आर्किटेक्चर एवं रिबन नेविगेशन',
      'पेज 4: बैकस्टेज व्यू, इंस्पेक्ट डॉक्यूमेंट प्रोटोकॉल एवं लाइव इंटरफेस',
      'पेज 5: प्रोडक्शन वर्कफ्लो, मूल्यांकन डैशबोर्ड एवं समीक्षा प्रश्नोत्तरी',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર માસ્ટર બુક કવર · માઇક્રોસોફ્ટ ઓફિસ 365 એન્ટરપ્રાઇઝ',
      'પેજ 2: 2027 એન્ટરપ્રાઇઝ અભ્યાસક્રમ બ્લૂપ્રિન્ટ · 32 મોડ્યુલ્સ અને 13 લેબ્સ',
      'પેજ 3: પ્રકરણ 01 — મોર્ડન વર્કસ્પેસ આર્કિટેક્ચર અને રિબન નેવિગેશન',
      'પેજ 4: બેકસ્ટેજ વ્યૂ, ઇન્સ્પેક્ટ ડોક્યુમેન્ટ પ્રોટોકોલ અને લાઇવ ઇન્ટરફેસ',
      'પેજ 5: પ્રોડક્શન વર્કફ્લો, મૂલ્યાંકન ડેશબોર્ડ અને સમીક્ષા પ્રશ્નોત્તરી',
    ],
  },
};

// ── 14 VERIFIED INDIAN STUDENT REVIEWS & MNC PLACEMENT STORIES ──────────────
const STUDENT_REVIEWS = [
  {
    id: 1,
    name: 'Aman Sharma',
    college: 'B.Tech CSE, AKTU Lucknow',
    role: 'Placed at TCS Digital (₹7.5 LPA)',
    stars: 5,
    subject: 'Cisco CCNA 200-301',
    subjectId: 'ccna',
    date: 'Nov 2026',
    avatarBg: 'bg-emerald-500/20 text-emerald-300',
    review: 'TCS Digital ke technical round mein interviewer ne OSPF DR/BDR election aur VLAN trunking scenarios puche. CCNA TAC Vault ke answers exact match ho gaye! Best ₹149 investment of my college life.',
  },
  {
    id: 2,
    name: 'Priya Nair',
    college: 'MCA, Pune University',
    role: 'Systems Analyst at Cognizant',
    stars: 5,
    subject: 'Artificial Intelligence Mastery',
    subjectId: 'ai',
    date: 'Nov 2026',
    avatarBg: 'bg-purple-500/20 text-purple-300',
    review: 'College professors gave 800-page PPTs that made zero sense. RTechLab\'s 44-page AI notes explained Transformer attention & LLM internals with high-res diagrams in 2 days. 10/10 clarity.',
  },
  {
    id: 3,
    name: 'Rohan Deshmukh',
    college: 'BCA Final Year, Mumbai University',
    role: 'MIS Executive at HDFC Bank',
    stars: 5,
    subject: 'Microsoft Office 365 Enterprise',
    subjectId: 'office-365',
    date: 'Nov 2026',
    avatarBg: 'bg-blue-500/20 text-blue-300',
    review: 'Power Query and dynamic array formulas (XLOOKUP, FILTER, UNIQUE) are explained with corporate case studies. Cleared the Excel practical assessment on the first attempt!',
  },
  {
    id: 4,
    name: 'Sneha Patel',
    college: 'B.Tech IT, GTU Ahmedabad',
    role: 'Network Engineer at L&T Infotech',
    stars: 5,
    subject: 'Cisco CCNA 200-301',
    subjectId: 'ccna',
    date: 'Oct 2026',
    avatarBg: 'bg-cyan-500/20 text-cyan-300',
    review: 'Subnetting was my biggest fear. Rahul Sir\'s FLSM/VLSM shortcuts and Packet Tracer lab workbooks made subnet calculations take 10 seconds. Highly recommend the ₹149 suite for labs.',
  },
  {
    id: 5,
    name: 'Vikramaditya Rao',
    college: 'BE Electronics, VTU Bengaluru',
    role: 'Associate Engineer at Infosys',
    stars: 4,
    subject: 'Computer Fundamentals',
    subjectId: 'fundamentals',
    date: 'Nov 2026',
    avatarBg: 'bg-amber-500/20 text-amber-300',
    review: 'Silicon IPO cycle, memory hierarchy, and CPU machine cycle are explained with clean pinouts. Wish I had found this handbook in my 2nd semester. Super crisp theory guide.',
  },
  {
    id: 6,
    name: 'Ananya Mukhopadhyay',
    college: 'B.Sc CS, Calcutta University',
    role: 'Junior Data Analyst',
    stars: 5,
    subject: 'Artificial Intelligence Mastery',
    subjectId: 'ai',
    date: 'Nov 2026',
    avatarBg: 'bg-purple-500/20 text-purple-300',
    review: 'The Hindi + English bilingual format is a game changer for non-metro students. Autonomous agents and RAG pipelines are explained in plain language. Saved me thousands on scam online bootcamps.',
  },
  {
    id: 7,
    name: 'Harsh Vardhan Singh',
    college: 'Polytechnic Diploma, Jaipur',
    role: 'Desktop Support Engineer at Wipro',
    stars: 5,
    subject: 'Computer Fundamentals',
    subjectId: 'fundamentals',
    date: 'Oct 2026',
    avatarBg: 'bg-emerald-500/20 text-emerald-300',
    review: 'The ESD safety and hardware troubleshooting diagnostics guide helped me crack the technical interview round easily. At ₹49, this is practically free value.',
  },
  {
    id: 8,
    name: 'Divya Sundaram',
    college: 'B.Tech ECE, Anna University Chennai',
    role: 'Cloud Support Associate',
    stars: 5,
    subject: 'Cisco CCNA 200-301',
    subjectId: 'ccna',
    date: 'Nov 2026',
    avatarBg: 'bg-cyan-500/20 text-cyan-300',
    review: 'The TAC Top 120 interview vault with senior model answers is pure gold. Interviewers were visibly impressed when I explained IPv6 SLAAC and EUI-64 correctly.',
  },
  {
    id: 9,
    name: 'Mohd. Tariq',
    college: 'B.Com CA, Osmania University Hyderabad',
    role: 'MIS Trainee at Genpact',
    stars: 4,
    subject: 'Microsoft Office 365 Enterprise',
    subjectId: 'office-365',
    date: 'Nov 2026',
    avatarBg: 'bg-blue-500/20 text-blue-300',
    review: 'Corporate Word legal formatting and Excel Pivot tables workbook helped me pass the corporate assessment test. Excellent practical templates for non-coders.',
  },
  {
    id: 10,
    name: 'Ritika Sengupta',
    college: 'BCA, Patna University',
    role: 'MCA Aspirant (NIMCET Rank 340)',
    stars: 5,
    subject: 'Computer Fundamentals',
    subjectId: 'fundamentals',
    date: 'Oct 2026',
    avatarBg: 'bg-emerald-500/20 text-emerald-300',
    review: 'Logic gates, number systems conversions, and memory hierarchy summaries helped me score 92% in college semester exams and NIMCET prep.',
  },
  {
    id: 11,
    name: 'Abhishek Verma',
    college: 'B.Tech CSE, Chandigarh University',
    role: 'AI Intern at Gurugram Tech Startup',
    stars: 5,
    subject: 'Artificial Intelligence Mastery',
    subjectId: 'ai',
    date: 'Nov 2026',
    avatarBg: 'bg-purple-500/20 text-purple-300',
    review: 'Most courses teach prompt engineering surface-level. RTechLab covers Chain-of-Thought, ReAct frameworks, and vector search with actual code concepts. Pure industrial grade quality.',
  },
  {
    id: 12,
    name: 'Kavita Chawla',
    college: 'BBA-IT, Delhi University',
    role: 'Operations Executive',
    stars: 5,
    subject: 'Microsoft Office 365 Enterprise',
    subjectId: 'office-365',
    date: 'Nov 2026',
    avatarBg: 'bg-blue-500/20 text-blue-300',
    review: 'Outlook zero-inbox rules and executive PowerPoint pitch deck structures are covered so professionally. Instant ZIP download worked smoothly on my phone and laptop.',
  },
  {
    id: 13,
    name: 'Gaurav Kulkarni',
    college: 'B.E Information Tech, SPPU Pune',
    role: 'Cloud Operations Intern',
    stars: 4,
    subject: 'Cisco CCNA 200-301',
    subjectId: 'ccna',
    date: 'Oct 2026',
    avatarBg: 'bg-cyan-500/20 text-cyan-300',
    review: 'Got instant access right after UPI payment via PhonePe. The packet flow vector diagrams are extremely readable even when printed in A4.',
  },
  {
    id: 14,
    name: 'Pooja Yadav',
    college: 'B.Tech CSE, AKTU Lucknow',
    role: 'Trainee Software Engineer at Tech Mahindra',
    stars: 5,
    subject: 'AI & Fundamentals Combo',
    subjectId: 'ai',
    date: 'Nov 2026',
    avatarBg: 'bg-emerald-500/20 text-emerald-300',
    review: 'Rahul Sir\'s mentorship email support is real! I had a doubt regarding ATS resume formatting and he replied within a few hours. Total respect.',
  },
  {
    id: 15,
    name: 'Hardik Vaghela',
    college: 'L.D. College of Engineering, Ahmedabad',
    role: 'Associate Systems Engineer at Wipro',
    stars: 5,
    subject: 'Microsoft Windows Server 2025',
    subjectId: 'server2025',
    date: 'Nov 2026',
    avatarBg: 'bg-sky-500/20 text-sky-300',
    review: 'Wipro technical interview me Active Directory 5 FSMO roles aur GPO inheritance ka scenario pucha tha. Rahul Sir ki Server 2025 Master Guide aur Top 50 Interview Vault ke exact explanations ne offer letter dilwaya!',
  },
  {
    id: 16,
    name: 'Jaimin Patel',
    college: 'Government Engineering College, Modasa',
    role: 'IT Infrastructure Trainee at L&T Infotech',
    stars: 5,
    subject: 'Microsoft Windows Server 2025',
    subjectId: 'server2025',
    date: 'Nov 2026',
    avatarBg: 'bg-sky-500/20 text-sky-300',
    review: 'Gujarati ane English banne edition mali gay! Pure 60 pages ma zero filler che. DHCP DORA, DNS Forwarders ane Hotpatching na practical steps ekdam industry standard che. Best ₹149 investment.',
  },
];

const getPreviewImage = (subjectId, lang, page) => {
  const asset = PREVIEW_ASSETS[subjectId] || PREVIEW_ASSETS.server2025 || PREVIEW_ASSETS.ai;
  if (lang === 'gu' && asset.gu) {
    return asset.gu[page - 1] || asset.gu[0];
  }
  if (lang === 'hi' && asset.hi) {
    return asset.hi[page - 1] || asset.hi[0];
  }
  const enPages = asset.en || PREVIEW_ASSETS.server2025?.en || PREVIEW_ASSETS.ai.en;
  return enPages[page - 1] || enPages[0];
};

const getPageLabel = (subjectId, lang, page) => {
  const asset = PREVIEW_ASSETS[subjectId] || PREVIEW_ASSETS.server2025 || PREVIEW_ASSETS.ai;
  if (lang === 'gu' && asset.labelsGu) {
    return asset.labelsGu[page - 1] || `પેજ ${page} of 5`;
  }
  if (lang === 'hi' && asset.labelsHi) {
    return asset.labelsHi[page - 1] || `पेज ${page} of 5`;
  }
  const labels = asset.labelsEn || PREVIEW_ASSETS.server2025?.labelsEn || PREVIEW_ASSETS.ai.labelsEn;
  return labels[page - 1] || `Page ${page} of 5`;
};

export default function NotesPage() {
  // Active selected subject (Default: Windows Server 2025 Flagship 1st)
  const [selectedSubject, setSelectedSubject] = useState(SUBJECTS[0]);
  // Mobile Carousel active slide index & ref
  const [activeSlideIndex, setActiveSlideIndex] = useState(0);
  const carouselRef = useRef(null);

  const scrollToSlide = (index) => {
    setActiveSlideIndex(index);
    if (carouselRef.current) {
      const card = carouselRef.current.children[index];
      if (card) {
        card.scrollIntoView({ behavior: 'smooth', inline: 'center', block: 'nearest' });
      }
    }
  };

  const handleCarouselScroll = (e) => {
    const el = e.currentTarget;
    if (!el || !el.children || el.children.length === 0) return;
    const cardWidth = el.children[0].offsetWidth || 300;
    const scrollLeft = el.scrollLeft;
    const newIndex = Math.min(
      SUBJECTS.length - 1,
      Math.max(0, Math.round(scrollLeft / (cardWidth + 16)))
    );
    if (newIndex !== activeSlideIndex) {
      setActiveSlideIndex(newIndex);
    }
  };
  // Preview reader page (1 to 5)
  const [previewPage, setPreviewPage] = useState(1);
  // Real digital book preview modal pop-up
  const [isReaderModalOpen, setIsReaderModalOpen] = useState(false);
  // Language for preview reader: 'hi' | 'en'
  const [previewLang, setPreviewLang] = useState('en');
  // 3D Realistic notebook page turn states
  const [isPageFlipping, setIsPageFlipping] = useState(false);
  const [flipDirection, setFlipDirection] = useState('next');
  const [targetFlipPage, setTargetFlipPage] = useState(1);

  // Top-Level Dual Store View: 'all' | '22' (₹22 Desk Reference Store) | '49' (₹49 Master Store & ₹149 Suites)
  const [activeStoreTab, setActiveStoreTab] = useState('all');
  const [coverPreview, setCoverPreview] = useState(null);
  const [showReelModal, setShowReelModal] = useState(false);

  // Modals
  const [isUpsellOpen, setIsUpsellOpen] = useState(false);
  const [isCheckoutOpen, setIsCheckoutOpen] = useState(false);
  // Modal plan choice: 'bundle' (149 - preselected/recommended) or 'single' (49)
  const [modalSelectedPlan, setModalSelectedPlan] = useState('bundle');
  // Language preference for main digital notebook: 'en' | 'hi'
  const [selectedLanguage, setSelectedLanguage] = useState('en');

  // Student lead & Razorpay payment states
  const [studentName, setStudentName] = useState('');
  const [studentEmail, setStudentEmail] = useState('');
  const [studentPhone, setStudentPhone] = useState('');
  const [isPaymentProcessing, setIsPaymentProcessing] = useState(false);
  const [paymentVerified, setPaymentVerified] = useState(false);
  const [verifiedPaymentId, setVerifiedPaymentId] = useState('');
  const [paymentError, setPaymentError] = useState('');

  // Checkout selection state
  const [checkoutItem, setCheckoutItem] = useState({
    title: 'Artificial Intelligence Mastery (Career Accelerator Bundle)',
    plan: 'bundle',
    price: 149,
  });

  // Tab inside package explorer modal
  const [upsellTab, setUpsellTab] = useState('interview');
  // Toast notification for sharing
  const [toastMessage, setToastMessage] = useState('');
  // Filter for student reviews & auto-slider state
  const [reviewFilter, setReviewFilter] = useState('all');
  const [activeReviewIndex, setActiveReviewIndex] = useState(0);
  const [isReviewPaused, setIsReviewPaused] = useState(false);
  const [cardsPerView, setCardsPerView] = useState(3);

  // Responsive cards per view (1 on mobile, 2 on tablet, 3 on desktop)
  useEffect(() => {
    const handleResize = () => {
      if (typeof window !== 'undefined') {
        if (window.innerWidth < 640) {
          setCardsPerView(1);
        } else if (window.innerWidth < 1024) {
          setCardsPerView(2);
        } else {
          setCardsPerView(3);
        }
      }
    };
    handleResize();
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  // Auto-select subject from URL search params or hash on arrival (e.g. ?book=ccna or #ccna)
  useEffect(() => {
    if (typeof window !== 'undefined') {
      const params = new URLSearchParams(window.location.search);
      const hash = window.location.hash.replace('#', '').toLowerCase();
      const targetId = (params.get('book') || params.get('subject') || hash).toLowerCase();
      const planParam = (params.get('plan') || '').toLowerCase();
      const storeParam = (params.get('store') || params.get('tab') || '').toLowerCase();
      if (storeParam === '22' || storeParam === 'cheatsheet') {
        setActiveStoreTab('22');
      } else if (storeParam === '49' || storeParam === 'master') {
        setActiveStoreTab('49');
      } else if (planParam === 'cheatsheet' || planParam === '22') {
        setActiveStoreTab('22');
      }
      if (targetId) {
        const found = SUBJECTS.find(
          (s) => s.id === targetId || s.category === targetId
        );
        if (found) {
          setSelectedSubject(found);
          if (planParam === 'cheatsheet' || planParam === '22') {
            setModalSelectedPlan('cheatsheet');
            setIsUpsellOpen(true);
          } else if (planParam === 'single' || planParam === '49') {
            setModalSelectedPlan('single');
            setIsUpsellOpen(true);
          }
          const targetEl = document.getElementById(targetId);
          if (targetEl) {
            targetEl.scrollIntoView({ behavior: 'smooth', block: 'center' });
          }
        }
      }
    }
  }, []);

  const filteredReviews = STUDENT_REVIEWS.filter(
    (r) => reviewFilter === 'all' || r.subjectId === reviewFilter
  );

  const maxReviewIndex = Math.max(0, filteredReviews.length - cardsPerView);

  // Auto-slide reviews continuously every 3.5 seconds (paused on hover)
  useEffect(() => {
    if (isReviewPaused) return;
    const interval = setInterval(() => {
      setActiveReviewIndex((prev) => {
        const max = Math.max(0, filteredReviews.length - cardsPerView);
        return prev >= max ? 0 : prev + 1;
      });
    }, 3500);
    return () => clearInterval(interval);
  }, [isReviewPaused, filteredReviews.length, cardsPerView]);

  const handlePrevReview = () => {
    setActiveReviewIndex((prev) => (prev <= 0 ? maxReviewIndex : prev - 1));
  };

  const handleNextReview = () => {
    setActiveReviewIndex((prev) => (prev >= maxReviewIndex ? 0 : prev + 1));
  };

  const handleShareCourse = (sub, e) => {
    if (e) e.stopPropagation();
    const url = typeof window !== 'undefined' ? `${window.location.origin}/notes#${sub.id}` : `https://rtechlab.vercel.app/notes#${sub.id}`;
    if (typeof navigator !== 'undefined' && navigator.share) {
      navigator.share({
        title: `${sub.title} | RTechLab`,
        text: `Check out ${sub.title} (2027 Official Notes & Career Accelerator Suite) on RTechLab:`,
        url: url,
      }).catch(() => {
        copyToClipboard(url, sub.title);
      });
    } else {
      copyToClipboard(url, sub.title);
    }
  };

  const copyToClipboard = (url, title) => {
    if (typeof navigator !== 'undefined' && navigator.clipboard) {
      navigator.clipboard.writeText(url).then(() => {
        setToastMessage(`✓ Direct link copied for ${title}! Share with your college friends.`);
        setTimeout(() => setToastMessage(''), 3500);
      });
    }
  };

  const handleWhatsAppShare = (sub, e) => {
    if (e) e.stopPropagation();
    const url = typeof window !== 'undefined' ? `${window.location.origin}/notes#${sub.id}` : `https://rtechlab.vercel.app/notes#${sub.id}`;
    const text = `Hey! Check out the official ${sub.title} (2027 Master Notes & Career Suite) on RTechLab:\n${url}`;
    if (typeof window !== 'undefined') {
      window.open(`https://api.whatsapp.com/send?text=${encodeURIComponent(text)}`, '_blank');
    }
  };

  // Dynamically load Razorpay SDK
  const loadRazorpaySDK = () => {
    return new Promise((resolve) => {
      if (typeof window !== 'undefined' && window.Razorpay) {
        resolve(true);
        return;
      }
      const script = document.createElement('script');
      script.src = 'https://checkout.razorpay.com/v1/checkout.js';
      script.async = true;
      script.onload = () => resolve(true);
      script.onerror = () => resolve(false);
      document.body.appendChild(script);
    });
  };

  // Automated 100% Secure Razorpay Checkout Handler
  const handleInitiatePayment = async (e) => {
    if (e) e.preventDefault();
    if (!studentEmail || !studentEmail.includes('@')) {
      setPaymentError('Please enter a valid email address.');
      return;
    }
    if (!studentName.trim()) {
      setPaymentError('Please enter your full name.');
      return;
    }
    setIsPaymentProcessing(true);
    setPaymentError('');

    try {
      const isLoaded = await loadRazorpaySDK();
      if (!isLoaded) {
        setPaymentError('Unable to load payment gateway SDK. Please check your internet connection.');
        setIsPaymentProcessing(false);
        return;
      }

      // Step 1: Create verified order on server
      const orderRes = await fetch('/api/create-order', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          amount: checkoutItem.price,
          currency: 'INR',
          subject: selectedSubject.id,
          subjectTitle: selectedSubject.title,
          plan: checkoutItem.plan,
          name: studentName,
          email: studentEmail,
          phone: studentPhone,
          language: selectedLanguage,
        }),
      });

      let orderData = {};
      try {
        orderData = await orderRes.json();
      } catch (parseErr) {
        setPaymentError(`Order creation failed (HTTP ${orderRes.status}). Please check network or try again.`);
        setIsPaymentProcessing(false);
        return;
      }

      if (!orderRes.ok) {
        if (orderData.requiresSetup) {
          setPaymentError('Razorpay Payment Gateway Setup In Progress: Please set RAZORPAY_KEY_ID and RAZORPAY_KEY_SECRET in Vercel to accept live payments. Download access remains locked.');
        } else {
          setPaymentError(orderData.error || 'Failed to create payment order.');
        }
        setIsPaymentProcessing(false);
        return;
      }

      // Step 2: Open Razorpay drop-in modal
      const options = {
        key: orderData.keyId || orderData.key_id || import.meta.env.VITE_RAZORPAY_KEY_ID,
        amount: orderData.amount,
        currency: orderData.currency || 'INR',
        name: 'RTechLab Publishing',
        description: `${selectedSubject.title} (${checkoutItem.title})`,
        image: '/brand/rtechlab-icon.png',
        order_id: orderData.orderId || orderData.order_id,
        prefill: {
          name: studentName,
          email: studentEmail,
          contact: studentPhone || '',
        },
        theme: {
          color: '#10b981',
        },
        handler: async function (response) {
          setIsPaymentProcessing(true);
          try {
            // Step 3: Cryptographic Server-Side Signature Verification
            const verifyRes = await fetch('/api/verify-payment', {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify({
                razorpay_order_id: response.razorpay_order_id,
                razorpay_payment_id: response.razorpay_payment_id,
                razorpay_signature: response.razorpay_signature,
                name: studentName,
                email: studentEmail,
                phone: studentPhone,
                language: selectedLanguage,
                subject: selectedSubject.id,
                subjectTitle: selectedSubject.title,
                plan: checkoutItem.plan,
                price: checkoutItem.price,
              }),
            });

            let verifyData = {};
            try {
              verifyData = await verifyRes.json();
            } catch (pErr) {
              setPaymentError(`Payment verification failed (HTTP ${verifyRes.status}). Please contact support with payment ID: ${response.razorpay_payment_id}`);
              setIsPaymentProcessing(false);
              return;
            }

            if (verifyRes.ok && verifyData.verified) {
              setPaymentVerified(true);
              setVerifiedPaymentId(response.razorpay_payment_id);
              try {
                const prev = JSON.parse(localStorage.getItem('rtechlab_registered_students') || '[]');
                prev.push({
                  name: studentName,
                  email: studentEmail,
                  phone: studentPhone,
                  paymentId: response.razorpay_payment_id,
                  plan: checkoutItem.plan,
                  date: new Date().toISOString(),
                });
                localStorage.setItem('rtechlab_registered_students', JSON.stringify(prev));
              } catch {}
            } else {
              setPaymentError(verifyData.error || 'Payment signature verification failed. Download access locked.');
            }
          } catch (err) {
            setPaymentError('Network connection error while verifying payment.');
          } finally {
            setIsPaymentProcessing(false);
          }
        },
        modal: {
          ondismiss: function () {
            setIsPaymentProcessing(false);
          },
        },
      };

      const rzpInstance = new window.Razorpay(options);
      rzpInstance.on('payment.failed', function (response) {
        setPaymentError(response?.error?.description || 'Payment was unsuccessful or cancelled by user.');
        setIsPaymentProcessing(false);
      });
      rzpInstance.open();
    } catch (err) {
      setPaymentError(`Payment initialization error: ${err.message}`);
      setIsPaymentProcessing(false);
    }
  };

  // Turn page with authentic 3D page flip animation
  const handleTurnPage = (direction) => {
    if (isPageFlipping) return;
    if (direction === 'next') {
      if (previewPage >= 5) return;
      setFlipDirection('next');
      setTargetFlipPage(previewPage + 1);
      setIsPageFlipping(true);
      setTimeout(() => {
        setPreviewPage((p) => Math.min(5, p + 1));
        setIsPageFlipping(false);
      }, 440);
    } else if (direction === 'prev') {
      if (previewPage <= 1) return;
      setFlipDirection('prev');
      setTargetFlipPage(previewPage - 1);
      setIsPageFlipping(true);
      setTimeout(() => {
        setPreviewPage((p) => Math.max(1, p - 1));
        setIsPageFlipping(false);
      }, 440);
    }
  };

  // ESC & Arrow key listener for modals & reader
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === 'Escape') {
        setIsUpsellOpen(false);
        setIsCheckoutOpen(false);
        setIsReaderModalOpen(false);
      } else if (isReaderModalOpen) {
        if (e.key === 'ArrowLeft') {
          handleTurnPage('prev');
        } else if (e.key === 'ArrowRight' || e.key === ' ') {
          handleTurnPage('next');
        }
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isReaderModalOpen, previewPage, isPageFlipping]);

  // Open real digital book pop-up modal
  const handleOpenPreviewModal = (sub) => {
    setSelectedSubject(sub);
    setPreviewPage(1);
    setPreviewLang('en');
    setIsReaderModalOpen(true);
  };

  // Trigger modal when student clicks Buy (Shows both ₹49 and ₹149, pre-selected with ₹149 value offer)
  const handleOpenPurchaseModal = (sub, defaultPlan = 'bundle') => {
    setSelectedSubject(sub);
    setModalSelectedPlan(defaultPlan);
    setIsUpsellOpen(true);
  };

  // Direct checkout
  const handleDirectCheckout = (sub, plan = 'bundle') => {
    setSelectedSubject(sub);
    let title = `${sub.title} (Complete Career Accelerator Suite)`;
    let price = 149;
    if (plan === 'cheatsheet') {
      title = `${sub.title} (⚡ 8-Page Desk Reference & Cheat Sheet)`;
      price = 22;
    } else if (plan === 'single') {
      title = `${sub.title} (📘 Core Master Pass - 51 Pages)`;
      price = 49;
    }
    setCheckoutItem({
      title,
      plan,
      price,
    });
    setIsCheckoutOpen(true);
  };

  // Proceed from Package Modal to Razorpay Checkout Modal
  const proceedToCheckoutWithSelectedPlan = () => {
    let title = `${selectedSubject.title} (Complete Career Accelerator Suite)`;
    let price = 149;
    if (modalSelectedPlan === 'cheatsheet') {
      title = `${selectedSubject.title} (⚡ 8-Page Desk Reference & Cheat Sheet)`;
      price = 22;
    } else if (modalSelectedPlan === 'single') {
      title = `${selectedSubject.title} (📘 Core Master Pass - Complete Guide)`;
      price = 49;
    }
    setCheckoutItem({
      title,
      plan: modalSelectedPlan,
      price,
    });
    setIsUpsellOpen(false);
    setIsCheckoutOpen(true);
  };

  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-6 sm:py-10 px-3 sm:px-6 lg:px-8 overflow-x-hidden selection:bg-emerald-500 selection:text-black">
      <div className="max-w-6xl mx-auto">
        
        {/* ── Breadcrumb & Utility Bar ───────────────────────────────────── */}
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 mb-6 sm:mb-8 pb-4 border-b border-white/[0.08]">
          <div className="flex items-center gap-1.5 sm:gap-2 text-[11px] sm:text-xs font-mono text-[#86868B] overflow-x-auto whitespace-nowrap">
            <Link to="/" className="hover:text-white transition-colors">Home</Link>
            <span>/</span>
            <span className="text-white">Master Digital Notes Store</span>
            <span>/</span>
            <span className="text-emerald-400">2027 Industrial Standard</span>
          </div>
          <div className="flex items-center gap-2">
            <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/20 text-[11px] font-mono text-emerald-400 font-semibold">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse" />
              <span>Instant Offline PDFs</span>
            </span>
          </div>
        </div>

        {/* ── Page Header ────────────────────────────────────────────── */}
        <div className="text-center max-w-3xl mx-auto mb-8 sm:mb-10">
          <div className="inline-flex items-center justify-center gap-2 px-3 py-1 rounded-full bg-white/[0.04] border border-white/[0.08] text-[11px] sm:text-xs font-mono text-zinc-300 mb-3 backdrop-blur-md">
            <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse shrink-0" />
            <span>⚡ 2027 Production-Verified Engineering &amp; Accounts Notes</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-black text-white tracking-tight mb-3 leading-tight">
            Industrial Master Digital Notes
          </h1>
          <p className="text-zinc-400 text-xs sm:text-sm max-w-xl mx-auto leading-relaxed">
            Concise, research-verified technical handbooks and quick desk cheat sheets. Designed for fast workplace lookup, college exams, and placement preparation.
          </p>
        </div>

        {/* ── APPLE TRANSPARENT FROSTED GLASS SEGMENTED CONTROLLER (SMOOTH SLIDING PILL) ── */}
        <div className="sticky top-16 z-30 mb-10 max-w-md mx-auto px-4">
          <div className="relative p-1 rounded-full bg-white/[0.04] backdrop-blur-2xl border border-white/[0.12] shadow-[0_8px_32px_rgba(0,0,0,0.5),inset_0_1px_1px_rgba(255,255,255,0.15)] flex select-none">
            
            {/* Sliding Frosted Glass Indicator Pill */}
            <div
              className="absolute top-1 bottom-1 rounded-full bg-white/20 backdrop-blur-xl border border-white/30 shadow-[inset_0_1px_1px_rgba(255,255,255,0.35),0_4px_16px_rgba(0,0,0,0.3)] transition-all duration-300 ease-[cubic-bezier(0.25,1,0.5,1)] pointer-events-none"
              style={{
                width: 'calc(33.333% - 2.66px)',
                left: activeStoreTab === '22'
                  ? '4px'
                  : activeStoreTab === '49'
                  ? 'calc(33.333% + 1.33px)'
                  : 'calc(66.666% - 1.33px)',
              }}
            />

            {/* Tab 1: ₹22 Quick Desk Sheets */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('22')}
              className={`relative z-10 w-1/3 py-2 px-2.5 rounded-full text-xs font-semibold transition-colors duration-200 cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === '22'
                  ? 'text-white font-bold'
                  : 'text-zinc-400 hover:text-white'
              }`}
            >
              <span>⚡ ₹22 Sheets</span>
            </button>

            {/* Tab 2: ₹49 Master Handbooks Store (with ₹149 Suites) */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('49')}
              className={`relative z-10 w-1/3 py-2 px-2.5 rounded-full text-xs font-semibold transition-colors duration-200 cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === '49'
                  ? 'text-white font-bold'
                  : 'text-zinc-400 hover:text-white'
              }`}
            >
              <span>📘 ₹49 Books</span>
            </button>

            {/* Tab 3: All Products */}
            <button
              type="button"
              onClick={() => setActiveStoreTab('all')}
              className={`relative z-10 w-1/3 py-2 px-2.5 rounded-full text-xs font-semibold transition-colors duration-200 cursor-pointer flex items-center justify-center gap-1.5 ${
                activeStoreTab === 'all'
                  ? 'text-white font-bold'
                  : 'text-zinc-400 hover:text-white'
              }`}
            >
              <span>🌐 All (7)</span>
            </button>

          </div>
        </div>

        {/* ═══════════════════════════════════════════════════════════════════ */}
        {/* ⚡ SECTION 1: RTECHLAB ₹22 QUICK DESK REFERENCE STORE              */}
        {/* ═══════════════════════════════════════════════════════════════════ */}
        {(activeStoreTab === '22' || activeStoreTab === 'all') && (
          <div id="store-22" className="mb-12 scroll-mt-20">
            {/* Minimal Centered Header */}
            <div className="text-center mb-6 flex flex-wrap items-center justify-center gap-2.5">
              <div className="inline-flex items-center gap-2 px-3.5 py-1 rounded-full bg-white/[0.04] backdrop-blur-xl border border-white/[0.1] text-xs font-mono text-zinc-300">
                <span>⚡ 8-Page Desk Cheat Sheets</span>
                <span className="w-1 h-1 rounded-full bg-amber-400" />
                <span className="text-amber-300 font-bold">Instant ₹22</span>
              </div>
              <button
                type="button"
                onClick={() => setShowReelModal(true)}
                className="inline-flex items-center gap-1.5 px-3.5 py-1 rounded-full bg-cyan-500/15 hover:bg-cyan-500/25 border border-cyan-400/35 text-xs font-mono text-cyan-300 font-semibold transition-all cursor-pointer active:scale-95"
              >
                <span>▶ Watch 55s Reel</span>
              </button>
            </div>

            {/* Apple-style Frosted Grid - Middle / Center Aligned */}
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-5 max-w-7xl mx-auto">

              {/* CARD 1: Tally Prime 2027 */}
              <div className="p-6 sm:p-8 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-amber-400/30 transition-all shadow-2xl text-center flex flex-col justify-between">
                <div>
                  {/* Badges Centered */}
                  <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                      8-Page Printable Desk Sheet · Office Ready
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-amber-400/10 text-amber-300 border border-amber-400/20">
                      Tally Certified Trainer (TCT)
                    </span>
                  </div>

                  {/* Title & 3 MVP Bullets */}
                  <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-3 text-center">
                    Tally Prime 2027 Quick Desk Reference &amp; Cheat Sheet
                  </h3>

                  <ul className="text-left text-xs sm:text-sm text-zinc-300 max-w-xs mx-auto space-y-1.5 mb-4">
                    <li className="flex items-start gap-2"><span className="text-amber-400 font-bold">✓</span><span><strong className="text-white">28 Groups, 24 Vouchers</strong> &amp; 35 Pro Hotkeys</span></li>
                    <li className="flex items-start gap-2"><span className="text-amber-400 font-bold">✓</span><span><strong className="text-white">Modern GST (0%/5%/18%)</strong> &amp; TDS Matrix</span></li>
                    <li className="flex items-start gap-2"><span className="text-amber-400 font-bold">✓</span><span><strong className="text-white">Cheque BRS</strong> &amp; 3 Golden Accounting Rules</span></li>
                  </ul>

                  {/* Cover Page Only Preview Button */}
                  <div className="mb-5 text-center">
                    <button
                      type="button"
                      onClick={() => setCoverPreview({
                        title: 'Tally Prime 2027 — Quick Desk Cheat Sheet',
                        image: '/images/covers/tally-22-cover.jpg',
                        subtitle: '8-Page Printable Desk Reference · EN / HI / GU',
                      })}
                      className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-white/[0.05] hover:bg-white/[0.12] border border-white/15 text-xs font-semibold text-amber-300 hover:text-amber-200 transition-all cursor-pointer"
                    >
                      <span>👁️ Preview Cover Page →</span>
                    </button>
                  </div>
                </div>

                {/* Centered Price & Buy Action */}
                <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center w-full">
                  <div className="flex items-baseline justify-center gap-2 mb-2.5">
                    <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                    <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      const tallySub = SUBJECTS.find(s => s.id === 'tally');
                      if (tallySub) handleDirectCheckout(tallySub, 'cheatsheet');
                    }}
                    className="btn-shine-2s w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <span className="text-[11px] font-mono text-zinc-400 text-center mt-2.5">
                    Instant PDF · EN / HI / GU
                  </span>
                </div>
              </div>

              {/* CARD 2: Microsoft Office 365 */}
              <div className="p-6 sm:p-8 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-sky-400/30 transition-all shadow-2xl text-center flex flex-col justify-between">
                <div>
                  {/* Badges Centered */}
                  <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                      8-Page Printable Desk Sheet · 150 Shortcuts
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-sky-400/10 text-sky-300 border border-sky-400/20">
                      Word · Excel · PPT · + .XLSX Lab
                    </span>
                  </div>

                  {/* Title & 3 MVP Bullets */}
                  <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-3 text-center">
                    Microsoft Office 365 Quick Desk Reference &amp; 150 Shortcuts
                  </h3>

                  <ul className="text-left text-xs sm:text-sm text-zinc-300 max-w-xs mx-auto space-y-1.5 mb-4">
                    <li className="flex items-start gap-2"><span className="text-sky-400 font-bold">✓</span><span><strong className="text-white">150 Numbered Shortcuts</strong> + 6 Win Keys</span></li>
                    <li className="flex items-start gap-2"><span className="text-sky-400 font-bold">✓</span><span><strong className="text-white">24 Excel Formulas</strong> (XLOOKUP, LET, FILTER)</span></li>
                    <li className="flex items-start gap-2"><span className="text-sky-400 font-bold">✓</span><span><strong className="text-white">Power Query ETL</strong>, Resume Rules &amp; .xlsx Lab</span></li>
                  </ul>

                  {/* Cover Page Only Preview Button */}
                  <div className="mb-5 text-center">
                    <button
                      type="button"
                      onClick={() => setCoverPreview({
                        title: 'Microsoft Office 365 — Quick Desk Cheat Sheet',
                        image: '/images/covers/office-22-cover.jpg',
                        subtitle: '8-Page Printable Desk Reference · + Free .xlsx Lab',
                      })}
                      className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-white/[0.05] hover:bg-white/[0.12] border border-white/15 text-xs font-semibold text-sky-300 hover:text-sky-200 transition-all cursor-pointer"
                    >
                      <span>👁️ Preview Cover Page →</span>
                    </button>
                  </div>
                </div>

                {/* Centered Price & Buy Action */}
                <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center w-full">
                  <div className="flex items-baseline justify-center gap-2 mb-2.5">
                    <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                    <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      const officeSub = SUBJECTS.find(s => s.id === 'office-365');
                      if (officeSub) handleDirectCheckout(officeSub, 'cheatsheet');
                    }}
                    className="btn-shine-2s w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <span className="text-[11px] font-mono text-zinc-400 text-center mt-2.5">
                    Instant PDF · EN / HI / GU + .xlsx
                  </span>
                </div>
              </div>

              {/* CARD 3: Linux & Shell Mastery */}
              <div className="p-6 sm:p-8 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-emerald-400/30 transition-all shadow-2xl text-center flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                      8-Page Printable Desk Sheet · Job-Ready
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-emerald-400/10 text-emerald-300 border border-emerald-400/20">
                      RHEL · Ubuntu · Fedora · Kali
                    </span>
                  </div>

                  <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-3 text-center">
                    Linux &amp; Shell Mastery Quick Desk Cheat Sheet
                  </h3>

                  <ul className="text-left text-xs sm:text-sm text-zinc-300 max-w-xs mx-auto space-y-1.5 mb-4">
                    <li className="flex items-start gap-2"><span className="text-emerald-400 font-bold">✓</span><span><strong className="text-white">15 Modules:</strong> FHS, chmod, Systemd &amp; LVM</span></li>
                    <li className="flex items-start gap-2"><span className="text-emerald-400 font-bold">✓</span><span><strong className="text-white">RHEL, Ubuntu, Fedora</strong> &amp; Kali Compared</span></li>
                    <li className="flex items-start gap-2"><span className="text-emerald-400 font-bold">✓</span><span><strong className="text-white">Bash, Docker, UFW</strong> &amp; 10 Interview Q&amp;A</span></li>
                  </ul>

                  {/* Cover Page Only Preview Button */}
                  <div className="mb-5 text-center">
                    <button
                      type="button"
                      onClick={() => setCoverPreview({
                        title: 'Linux & Shell Mastery — Quick Desk Cheat Sheet',
                        image: '/images/covers/linux-22-cover.jpg',
                        subtitle: '8-Page Printable Desk Reference · EN / HI / GU',
                      })}
                      className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-white/[0.05] hover:bg-white/[0.12] border border-white/15 text-xs font-semibold text-emerald-300 hover:text-emerald-200 transition-all cursor-pointer"
                    >
                      <span>👁️ Preview Cover Page →</span>
                    </button>
                  </div>
                </div>

                <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center w-full">
                  <div className="flex items-baseline justify-center gap-2 mb-2.5">
                    <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                    <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      handleDirectCheckout({
                        id: 'linux',
                        title: 'Linux & Shell Mastery (2027 Edition)',
                        hasCheatSheet: true,
                        cheatSheetPages: '8 Pages Desk Reference',
                        cheatSheetPdfEn: '/downloads/Linux-Quick-Desk-Reference-Cheat-Sheet-English.pdf',
                        cheatSheetPdfHi: '/downloads/Linux-Quick-Desk-Reference-Cheat-Sheet-Hindi.pdf',
                        cheatSheetPdfGu: '/downloads/Linux-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf',
                      }, 'cheatsheet');
                    }}
                    className="btn-shine-2s w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <span className="text-[11px] font-mono text-zinc-400 text-center mt-2.5">
                    Instant PDF · EN / HI / GU
                  </span>
                </div>
              </div>

              {/* CARD 4: Ethical Hacking & Cyber Security */}
              <div className="p-6 sm:p-7 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-rose-400/30 transition-all shadow-2xl text-center flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                      8-Page Printable Desk Sheet · Kali &amp; OWASP
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-rose-500/10 text-rose-300 border border-rose-500/20">
                      Nmap · SQLi · VirusTotal · Career Path
                    </span>
                  </div>

                  <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-3 text-center">
                    Ethical Hacking &amp; Cyber Security Desk Reference
                  </h3>

                  <ul className="text-left text-xs sm:text-sm text-zinc-300 max-w-xs mx-auto space-y-1.5 mb-4">
                    <li className="flex items-start gap-2"><span className="text-rose-400 font-bold">✓</span><span><strong className="text-white">Kali Lab Setup, Nmap</strong> &amp; Wireshark Filters</span></li>
                    <li className="flex items-start gap-2"><span className="text-rose-400 font-bold">✓</span><span><strong className="text-white">OWASP Top 10, SQLi</strong> &amp; Cryptography Visuals</span></li>
                    <li className="flex items-start gap-2"><span className="text-rose-400 font-bold">✓</span><span><strong className="text-white">VirusTotal, EICAR, HTB</strong> &amp; Top GitHub Repos</span></li>
                  </ul>

                  {/* Cover Page Only Preview Button */}
                  <div className="mb-5 text-center">
                    <button
                      type="button"
                      onClick={() => setCoverPreview({
                        title: 'Ethical Hacking & Cyber Security — Quick Desk Sheet',
                        image: '/images/covers/eh-22-cover.jpg',
                        subtitle: '8-Page Printable Desk Reference · EN / HI / GU',
                      })}
                      className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-white/[0.05] hover:bg-white/[0.12] border border-white/15 text-xs font-semibold text-rose-300 hover:text-rose-200 transition-all cursor-pointer"
                    >
                      <span>👁️ Preview Cover Page →</span>
                    </button>
                  </div>
                </div>

                <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center w-full">
                  <div className="flex items-baseline justify-center gap-2 mb-2.5">
                    <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                    <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      handleDirectCheckout({
                        id: 'ethical-hacking',
                        title: 'Ethical Hacking & Cyber Security (2027 Edition)',
                        hasCheatSheet: true,
                        cheatSheetPages: '8 Pages Desk Reference',
                        cheatSheetPdfEn: '/downloads/Ethical-Hacking-Cyber-Security-Quick-Desk-Cheat-Sheet-English.pdf',
                        cheatSheetPdfHi: '/downloads/Ethical-Hacking-Cyber-Security-Quick-Desk-Cheat-Sheet-Hindi.pdf',
                        cheatSheetPdfGu: '/downloads/Ethical-Hacking-Cyber-Security-Quick-Desk-Cheat-Sheet-Gujarati.pdf',
                      }, 'cheatsheet');
                    }}
                    className="btn-shine-2s w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <span className="text-[11px] font-mono text-zinc-400 text-center mt-2.5">
                    Instant PDF · EN / HI / GU
                  </span>
                </div>
              </div>

              {/* CARD 5: Cisco CCNA 200-301 & Networking */}
              <div className="p-6 sm:p-7 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-sky-400/30 transition-all shadow-2xl text-center flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                      10-Page Printable Desk Sheet · CCNA 200-301
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-sky-500/10 text-sky-300 border border-sky-500/20">
                      OSI · IPv4/IPv6 · Subnetting · OSPF
                    </span>
                  </div>

                  <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-3 text-center">
                    Cisco CCNA 200-301 &amp; Networking Desk Reference
                  </h3>

                  <ul className="text-left text-xs sm:text-sm text-zinc-300 max-w-xs mx-auto space-y-1.5 mb-4">
                    <li className="flex items-start gap-2"><span className="text-sky-400 font-bold">✓</span><span><strong className="text-white">Network Types, Devices, OSI</strong> &amp; Fiber/PoE</span></li>
                    <li className="flex items-start gap-2"><span className="text-sky-400 font-bold">✓</span><span><strong className="text-white">IPv4 Subnetting (/16–/32)</strong>, VLSM &amp; IPv6</span></li>
                    <li className="flex items-start gap-2"><span className="text-sky-400 font-bold">✓</span><span><strong className="text-white">VLANs, STP, OSPF, ACL/NAT</strong> &amp; Top 10 Q&amp;A</span></li>
                  </ul>

                  {/* Cover Page Only Preview Button */}
                  <div className="mb-5 text-center">
                    <button
                      type="button"
                      onClick={() => setCoverPreview({
                        title: 'Cisco CCNA 200-301 & Networking — Quick Desk Sheet',
                        image: '/images/covers/ccna-22-cover.jpg',
                        subtitle: '10-Page Printable Desk Reference · EN / HI / GU',
                      })}
                      className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-white/[0.05] hover:bg-white/[0.12] border border-white/15 text-xs font-semibold text-sky-300 hover:text-sky-200 transition-all cursor-pointer"
                    >
                      <span>👁️ Preview Cover Page →</span>
                    </button>
                  </div>
                </div>

                <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center w-full">
                  <div className="flex items-baseline justify-center gap-2 mb-2.5">
                    <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                    <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      handleDirectCheckout({
                        id: 'ccna-networking-22',
                        title: 'Cisco CCNA 200-301 & Networking (10-Page Desk Sheet)',
                        hasCheatSheet: true,
                        cheatSheetPages: '10 Pages Desk Reference',
                        cheatSheetPdfEn: '/downloads/CCNA-200-301-Networking-Quick-Desk-Cheat-Sheet-English.pdf',
                        cheatSheetPdfHi: '/downloads/CCNA-200-301-Networking-Quick-Desk-Cheat-Sheet-Hindi.pdf',
                        cheatSheetPdfGu: '/downloads/CCNA-200-301-Networking-Quick-Desk-Cheat-Sheet-Gujarati.pdf',
                      }, 'cheatsheet');
                    }}
                    className="btn-shine-2s w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <span className="text-[11px] font-mono text-zinc-400 text-center mt-2.5">
                    Instant PDF · EN / HI / GU
                  </span>
                </div>
              </div>

              {/* CARD 6: AI Prompt Engineering & Generative AI */}
              <div className="p-6 sm:p-7 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-violet-400/30 transition-all shadow-2xl text-center flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                      10-Page Printable Desk Sheet · GenAI &amp; Agents
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-violet-500/10 text-violet-300 border border-violet-500/20">
                      Prompts · RAG · MCP · Free Tools
                    </span>
                  </div>

                  <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-3 text-center">
                    AI Prompt Engineering &amp; Generative AI Desk Reference
                  </h3>

                  <ul className="text-left text-xs sm:text-sm text-zinc-300 max-w-xs mx-auto space-y-1.5 mb-4">
                    <li className="flex items-start gap-2"><span className="text-violet-400 font-bold">✓</span><span><strong className="text-white">RTF/CO-STAR, Image Prompts</strong> &amp; Pro Vault</span></li>
                    <li className="flex items-start gap-2"><span className="text-violet-400 font-bold">✓</span><span><strong className="text-white">RAG, Vector DBs, AI Agents</strong> &amp; MCP Protocol</span></li>
                    <li className="flex items-start gap-2"><span className="text-violet-400 font-bold">✓</span><span><strong className="text-white">Free vs Paid Stack, GitHub</strong> Repos &amp; Top 10 Q&amp;A</span></li>
                  </ul>

                  {/* Cover Page Only Preview Button */}
                  <div className="mb-5 text-center">
                    <button
                      type="button"
                      onClick={() => setCoverPreview({
                        title: 'AI Prompt Engineering & Generative AI — Quick Desk Sheet',
                        image: '/images/covers/ai-22-cover.jpg',
                        subtitle: '10-Page Printable Desk Reference · EN / HI / GU',
                      })}
                      className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-white/[0.05] hover:bg-white/[0.12] border border-white/15 text-xs font-semibold text-violet-300 hover:text-violet-200 transition-all cursor-pointer"
                    >
                      <span>👁️ Preview Cover Page →</span>
                    </button>
                  </div>
                </div>

                <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center w-full">
                  <div className="flex items-baseline justify-center gap-2 mb-2.5">
                    <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                    <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      handleDirectCheckout({
                        id: 'ai-prompt-eng-22',
                        title: 'AI Prompt Engineering & Generative AI (10-Page Desk Sheet)',
                        hasCheatSheet: true,
                        cheatSheetPages: '10 Pages Desk Reference',
                        cheatSheetPdfEn: '/downloads/AI-Prompt-Engineering-GenAI-Quick-Desk-Cheat-Sheet-English.pdf',
                        cheatSheetPdfHi: '/downloads/AI-Prompt-Engineering-GenAI-Quick-Desk-Cheat-Sheet-Hindi.pdf',
                        cheatSheetPdfGu: '/downloads/AI-Prompt-Engineering-GenAI-Quick-Desk-Cheat-Sheet-Gujarati.pdf',
                      }, 'cheatsheet');
                    }}
                    className="btn-shine-2s w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <span className="text-[11px] font-mono text-zinc-400 text-center mt-2.5">
                    Instant PDF · EN / HI / GU
                  </span>
                </div>
              </div>

              {/* CARD 7: Python Programming & Automation */}
              <div className="p-6 sm:p-7 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-blue-400/30 transition-all shadow-2xl text-center flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                      10-Page Printable Desk Sheet · Python 3.12+
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-blue-500/10 text-blue-300 border border-blue-500/20">
                      Core · OOP · Automation · Python+AI
                    </span>
                  </div>

                  <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-3 text-center">
                    Python Programming &amp; Automation Desk Reference
                  </h3>

                  <ul className="text-left text-xs sm:text-sm text-zinc-300 max-w-xs mx-auto space-y-1.5 mb-4">
                    <li className="flex items-start gap-2"><span className="text-blue-400 font-bold">✓</span><span><strong className="text-white">Data Structures, OOP</strong> &amp; File/JSON Handling</span></li>
                    <li className="flex items-start gap-2"><span className="text-blue-400 font-bold">✓</span><span><strong className="text-white">Automation Scripts, Pandas</strong> &amp; FastAPI</span></li>
                    <li className="flex items-start gap-2"><span className="text-blue-400 font-bold">✓</span><span><strong className="text-white">Python + AI (RAG/Agents)</strong> &amp; Future 2030</span></li>
                  </ul>

                  {/* Cover Page Only Preview Button */}
                  <div className="mb-5 text-center">
                    <button
                      type="button"
                      onClick={() => setCoverPreview({
                        title: 'Python Programming & Automation — Quick Desk Sheet',
                        image: '/images/covers/python-22-cover.jpg',
                        subtitle: '10-Page Printable Desk Reference · EN / HI / GU',
                      })}
                      className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-white/[0.05] hover:bg-white/[0.12] border border-white/15 text-xs font-semibold text-blue-300 hover:text-blue-200 transition-all cursor-pointer"
                    >
                      <span>👁️ Preview Cover Page →</span>
                    </button>
                  </div>
                </div>

                <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center w-full">
                  <div className="flex items-baseline justify-center gap-2 mb-2.5">
                    <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                    <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      handleDirectCheckout({
                        id: 'python-automation-22',
                        title: 'Python Programming & Automation (10-Page Desk Sheet)',
                        hasCheatSheet: true,
                        cheatSheetPages: '10 Pages Desk Reference',
                        cheatSheetPdfEn: '/downloads/Python-Programming-Automation-Quick-Desk-Cheat-Sheet-English.pdf',
                        cheatSheetPdfHi: '/downloads/Python-Programming-Automation-Quick-Desk-Cheat-Sheet-Hindi.pdf',
                        cheatSheetPdfGu: '/downloads/Python-Programming-Automation-Quick-Desk-Cheat-Sheet-Gujarati.pdf',
                      }, 'cheatsheet');
                    }}
                    className="btn-shine-2s w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <span className="text-[11px] font-mono text-zinc-400 text-center mt-2.5">
                    Instant PDF · EN / HI / GU
                  </span>
                </div>
              </div>

              {/* CARD 8: Git & GitHub Mastery */}
              <div className="p-6 sm:p-7 rounded-3xl bg-white/[0.03] backdrop-blur-2xl border border-white/[0.1] hover:border-orange-400/30 transition-all shadow-2xl text-center flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-center gap-2 flex-wrap mb-3">
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.06] text-zinc-200 font-semibold border border-white/10">
                      10-Page Printable Desk Sheet · Git &amp; CI/CD
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-white/[0.04] text-zinc-400 border border-white/5">
                      Hindi · English · Gujarati
                    </span>
                    <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-orange-500/10 text-orange-300 border border-orange-500/20">
                      Branching · PRs · Actions · Top 10 Repos
                    </span>
                  </div>

                  <h3 className="text-xl sm:text-2xl font-bold text-white tracking-tight mb-3 text-center">
                    Git &amp; GitHub Mastery Desk Reference
                  </h3>

                  <ul className="text-left text-xs sm:text-sm text-zinc-300 max-w-xs mx-auto space-y-1.5 mb-4">
                    <li className="flex items-start gap-2"><span className="text-orange-400 font-bold">✓</span><span><strong className="text-white">4-Area Workflow, SSH</strong> &amp; Merge Conflicts</span></li>
                    <li className="flex items-start gap-2"><span className="text-orange-400 font-bold">✓</span><span><strong className="text-white">Reset/Revert/Reflog, PRs</strong> &amp; GitHub Actions</span></li>
                    <li className="flex items-start gap-2"><span className="text-orange-400 font-bold">✓</span><span><strong className="text-white">AI + Git, Top 10 Starred Repos</strong> &amp; Q&amp;A</span></li>
                  </ul>

                  {/* Cover Page Only Preview Button */}
                  <div className="mb-5 text-center">
                    <button
                      type="button"
                      onClick={() => setCoverPreview({
                        title: 'Git & GitHub Mastery — Quick Desk Sheet',
                        image: '/images/covers/git-22-cover.jpg',
                        subtitle: '10-Page Printable Desk Reference · EN / HI / GU',
                      })}
                      className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-white/[0.05] hover:bg-white/[0.12] border border-white/15 text-xs font-semibold text-orange-300 hover:text-orange-200 transition-all cursor-pointer"
                    >
                      <span>👁️ Preview Cover Page →</span>
                    </button>
                  </div>
                </div>

                <div className="flex flex-col items-center justify-center max-w-xs mx-auto text-center w-full">
                  <div className="flex items-baseline justify-center gap-2 mb-2.5">
                    <span className="text-3xl sm:text-4xl font-black text-white">₹22</span>
                    <span className="text-sm font-mono text-zinc-500 line-through">₹99</span>
                    <span className="text-[10px] font-mono text-emerald-400 font-bold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                      78% OFF
                    </span>
                  </div>

                  <button
                    type="button"
                    onClick={() => {
                      handleDirectCheckout({
                        id: 'git-github-22',
                        title: 'Git & GitHub Mastery (10-Page Desk Sheet)',
                        hasCheatSheet: true,
                        cheatSheetPages: '10 Pages Desk Reference',
                        cheatSheetPdfEn: '/downloads/Git-GitHub-Mastery-Quick-Desk-Cheat-Sheet-English.pdf',
                        cheatSheetPdfHi: '/downloads/Git-GitHub-Mastery-Quick-Desk-Cheat-Sheet-Hindi.pdf',
                        cheatSheetPdfGu: '/downloads/Git-GitHub-Mastery-Quick-Desk-Cheat-Sheet-Gujarati.pdf',
                      }, 'cheatsheet');
                    }}
                    className="btn-shine-2s w-full py-3 px-6 rounded-full bg-white hover:bg-zinc-200 text-black text-sm font-bold transition-all shadow-lg active:scale-95 cursor-pointer flex items-center justify-center gap-1.5"
                  >
                    <span>⚡ Get ₹22 Sheet</span>
                    <span>→</span>
                  </button>

                  <span className="text-[11px] font-mono text-zinc-400 text-center mt-2.5">
                    Instant PDF · EN / HI / GU
                  </span>
                </div>
              </div>

            </div>

            {/* Minimal Upcoming Strip Centered */}
            <div className="mt-8 pt-4 border-t border-white/[0.06] flex flex-wrap items-center justify-center gap-3 text-[11px] font-mono text-zinc-500 text-center">
              <span>Coming Soon @ ₹22: CCNA 200-301 Hotkeys · Windows Server 2025 Commands · AI Engineering Prompts</span>
              <span className="text-zinc-400 font-semibold">• Weekly Releases</span>
            </div>
          </div>
        )}

        {/* 📘 SECTION 2: RTECHLAB COMPREHENSIVE MASTER HANDBOOKS (@ ₹49)       */}
        {/*              & EXECUTIVE CAREER ACCELERATOR SUITES (@ ₹149)        */}
        {/* ═══════════════════════════════════════════════════════════════════ */}
        {(activeStoreTab === '49' || activeStoreTab === 'all') && (
          <div id="store-49" className="mb-6 scroll-mt-20 animate-fadeIn">
          <div className="text-center max-w-2xl mx-auto mb-6">
            <h2 className="text-xl sm:text-3xl font-black text-white tracking-tight mb-1.5">
              📘 51-Page Master Handbooks (@ ₹49) &amp; Career Suites (@ ₹149)
            </h2>
            <p className="text-xs sm:text-sm text-zinc-400 leading-relaxed mx-auto max-w-lg">
              Comprehensive theory &amp; architectures. Tap any track below to preview real sample pages.
            </p>

            {/* Quick-Jump Navigation & Interactive Subject Switcher */}
            <div className="flex items-center justify-center gap-1.5 sm:gap-2 mt-4 flex-wrap">
              <span className="text-[11px] font-mono text-[#86868B] mr-1 hidden sm:inline">Select Track:</span>
              {SUBJECTS.map((s, idx) => (
                <button
                  key={s.id}
                  type="button"
                  onClick={() => scrollToSlide(idx)}
                  className={`px-3 py-1.5 rounded-full text-[11px] font-semibold transition-all active:scale-95 flex items-center gap-1.5 cursor-pointer ${
                    activeSlideIndex === idx
                      ? 'bg-emerald-500 text-black font-bold shadow-lg shadow-emerald-500/20'
                      : 'bg-white/[0.05] hover:bg-white/[0.1] border border-white/[0.08] text-white/80 hover:text-white'
                  }`}
                >
                  <span>{s.id === 'server2025' ? '⚡ Server 2025' : s.id === 'ai' ? '🤖 AI Mastery' : s.id === 'office-365' ? '📊 Office 365' : s.id === 'fundamentals' ? '💻 Fundamentals' : s.id === 'tally' ? '📈 Tally Prime' : '🌐 CCNA'}</span>
                </button>
              ))}
              <a
                href="#reviews"
                className="px-3 py-1.5 rounded-full bg-amber-500/10 hover:bg-amber-500/20 border border-amber-500/20 text-[11px] font-semibold text-amber-300 transition-all active:scale-95"
              >
                ⭐ Reviews (16)
              </a>
            </div>
          </div>

          {/* Mobile Swipe Navigation & Track Counter (Visible on mobile only: md:hidden) */}
          <div className="flex items-center justify-between px-1 mb-3.5 md:hidden">
            <div className="flex items-center gap-2">
              <span className="text-[11px] font-mono text-[#86868B]">
                Track <strong className="text-emerald-400 font-bold">{activeSlideIndex + 1}</strong> of {SUBJECTS.length}
              </span>
              <span className="text-[10px] font-mono text-emerald-400/80 bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                👈 Swipe Cards 👉
              </span>
            </div>
            <div className="flex items-center gap-1.5">
              <button
                type="button"
                onClick={() => scrollToSlide(Math.max(0, activeSlideIndex - 1))}
                disabled={activeSlideIndex === 0}
                className={`w-7 h-7 rounded-lg border text-xs flex items-center justify-center transition-all ${
                  activeSlideIndex === 0 ? 'border-white/5 text-white/20' : 'border-white/15 text-white bg-white/[0.06] active:scale-95'
                }`}
                aria-label="Previous note"
              >
                ‹
              </button>
              <div className="flex items-center gap-1 px-1">
                {SUBJECTS.map((_, i) => (
                  <button
                    key={i}
                    type="button"
                    onClick={() => scrollToSlide(i)}
                    className={`h-1.5 rounded-full transition-all ${activeSlideIndex === i ? 'w-4 bg-emerald-400' : 'w-1.5 bg-white/20'}`}
                    aria-label={`Go to slide ${i + 1}`}
                  />
                ))}
              </div>
              <button
                type="button"
                onClick={() => scrollToSlide(Math.min(SUBJECTS.length - 1, activeSlideIndex + 1))}
                disabled={activeSlideIndex === SUBJECTS.length - 1}
                className={`w-7 h-7 rounded-lg border text-xs flex items-center justify-center transition-all ${
                  activeSlideIndex === SUBJECTS.length - 1 ? 'border-white/5 text-white/20' : 'border-white/15 text-white bg-white/[0.06] active:scale-95'
                }`}
                aria-label="Next note"
              >
                ›
              </button>
            </div>
          </div>

          <div
            ref={carouselRef}
            onScroll={handleCarouselScroll}
            className="flex md:grid md:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-5 mb-10 overflow-x-auto md:overflow-x-visible snap-x snap-mandatory md:snap-none scrollbar-none pb-4 md:pb-0 px-2 sm:px-0 -mx-3 sm:mx-0 touch-auto"
            style={{ WebkitOverflowScrolling: 'touch' }}
          >
            {SUBJECTS.map((sub, index) => (
              <div
                key={sub.id}
                id={sub.id}
                className="relative p-5 sm:p-6 rounded-2xl sm:rounded-3xl bg-[#0D0D10] border border-white/[0.08] hover:border-emerald-500/40 transition-all flex flex-col justify-between group shadow-xl hover:shadow-2xl hover:shadow-emerald-500/5 scroll-mt-24 shrink-0 w-[86vw] sm:w-[360px] md:w-auto snap-center md:snap-align-none"
              >
                <div className="text-center">
                  {/* Header Track Tag & Status Badges Centered */}
                  <div className="flex items-center justify-center gap-2 mb-3">
                    <span className="text-[10px] font-mono text-white/50 font-bold px-2 py-0.5 rounded bg-white/[0.04] border border-white/[0.06]">
                      TRACK #{index + 1}
                    </span>
                    <span className={`text-[10px] font-mono font-bold px-2.5 py-0.5 rounded-full border ${
                      sub.id === 'server2025'
                        ? 'bg-sky-500/15 text-sky-300 border-sky-500/30'
                        : sub.id === 'ai'
                        ? 'bg-purple-500/15 text-purple-300 border-purple-500/30'
                        : sub.id === 'office-365'
                        ? 'bg-blue-500/15 text-blue-300 border-blue-500/30'
                        : sub.id === 'fundamentals'
                        ? 'bg-emerald-500/15 text-emerald-300 border-emerald-500/30'
                        : sub.id === 'tally'
                        ? 'bg-amber-500/15 text-amber-300 border-amber-500/30'
                        : 'bg-cyan-500/15 text-cyan-300 border-cyan-500/30'
                    }`}>
                      {sub.badge}
                    </span>
                  </div>

                  {/* Title & Description Clean & Center-Aligned */}
                  <div className="mb-3 text-center">
                    <h3 className="text-base sm:text-lg font-bold text-white mb-1 group-hover:text-emerald-400 transition-colors leading-snug text-center">
                      {sub.title}
                    </h3>
                    <p className="text-xs text-zinc-400 line-clamp-2 leading-relaxed mb-3 text-center mx-auto max-w-xs">
                      {sub.subtitle}
                    </p>

                    {/* Quick Specs Pill Centered */}
                    <div className="flex items-center justify-center gap-3 text-[11px] font-mono p-2 rounded-lg bg-zinc-950 border border-zinc-800/80 text-zinc-400 mb-2.5 text-center">
                      <span>📄 {sub.pages.includes('Pages') ? sub.pages.split('Pages')[0] + 'Pages' : sub.pages}</span>
                      <span>•</span>
                      <span>🌐 Hindi · Eng · ગુજ</span>
                    </div>

                    {/* Progressive Disclosure: Tap to View Full Syllabus & Sample Centered */}
                    <button
                      type="button"
                      onClick={() => handleOpenPreviewModal(sub)}
                      className="w-full py-2 px-3 rounded-lg bg-zinc-900/80 hover:bg-zinc-800 text-zinc-300 hover:text-white border border-zinc-800 text-xs font-medium transition-colors flex items-center justify-center gap-1.5 group/btn cursor-pointer text-center"
                    >
                      <span>📖</span>
                      <span className="font-semibold">View 10 Chapters &amp; 5p Sample</span>
                      <span className="text-zinc-500 group-hover/btn:text-white font-mono text-[11px]">→</span>
                    </button>
                  </div>
                </div>

                <div className="space-y-2.5 pt-3 border-t border-white/[0.06]">
                  {/* Uniform Price Tag Centered: ₹49 Core Master Pass vs ₹149 Career Suite */}
                  <div className="flex items-center justify-around p-2.5 rounded-xl bg-white/[0.02] border border-white/[0.05] text-center">
                    <div className="text-center">
                      <div className="text-[9px] font-mono text-[#86868B] uppercase tracking-wider font-semibold">
                        Core Master Pass
                      </div>
                      <div className="flex items-baseline justify-center gap-1.5 mt-0.5">
                        <span className="text-xl sm:text-2xl font-black text-white">₹49</span>
                        <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                          ₹199
                        </span>
                      </div>
                    </div>
                    <div className="w-[1px] h-8 bg-white/10" />
                    <div className="text-center">
                      <div className="text-[9px] font-mono text-emerald-400 uppercase tracking-wider font-bold">
                        👑 Executive Suite
                      </div>
                      <div className="flex items-baseline justify-center gap-1.5 mt-0.5">
                        <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                          ₹1,099
                        </span>
                        <span className="text-xl sm:text-2xl font-black text-emerald-400">₹149</span>
                      </div>
                    </div>
                  </div>

                  {/* Direct Purchase Actions for All Subjects */}
                  <div className="grid grid-cols-2 gap-2">
                    <button
                      type="button"
                      onClick={() => handleDirectCheckout(sub, 'single')}
                      className="py-2.5 px-2 rounded-lg bg-zinc-800 hover:bg-zinc-700 text-white text-[11px] sm:text-xs font-semibold transition-colors text-center border border-zinc-700 active:scale-95 truncate flex items-center justify-center gap-1 cursor-pointer"
                    >
                      <span>📘 ₹49 Pass</span>
                    </button>
                    <button
                      type="button"
                      onClick={() => handleOpenPurchaseModal(sub, 'bundle')}
                      className="py-2.5 px-2 rounded-lg bg-white hover:bg-zinc-200 text-black text-[11px] sm:text-xs font-bold transition-colors text-center shadow-sm active:scale-95 truncate flex items-center justify-center gap-1 cursor-pointer"
                    >
                      <span>👑 ₹149 Suite</span>
                    </button>
                  </div>

                  <div className="flex items-center justify-between text-[10px] font-mono pt-0.5 px-0.5">
                    <button
                      type="button"
                      onClick={() => handleOpenPreviewModal(sub)}
                      className="text-zinc-500 hover:text-white transition-colors cursor-pointer"
                    >
                      📖 Free 5p Preview →
                    </button>
                    <button
                      type="button"
                      onClick={() => handleOpenPurchaseModal(sub, 'bundle')}
                      className="text-zinc-400 hover:text-white hover:underline transition-colors cursor-pointer"
                    >
                      Compare Editions →
                    </button>
                  </div>

                  {/* Course Share Bar Centered */}
                  <div className="flex items-center justify-center gap-2 pt-2 border-t border-white/[0.06] text-[11px] font-mono">
                    <span className="text-[#86868B] text-[10px] flex items-center gap-1">
                      <span>🔗</span>
                      <span>Share:</span>
                    </span>
                    <button
                      type="button"
                      onClick={(e) => handleShareCourse(sub, e)}
                      className="inline-flex items-center gap-1 px-2.5 py-1 rounded-lg bg-white/[0.05] hover:bg-white/[0.12] text-[#D2D2D7] hover:text-white border border-white/10 transition-all text-[10px] font-semibold active:scale-95"
                      title="Copy direct link to share with friends"
                    >
                      <svg className="w-3 h-3 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
                      </svg>
                      <span>Copy Link</span>
                    </button>
                    <button
                      type="button"
                      onClick={(e) => handleWhatsAppShare(sub, e)}
                      className="inline-flex items-center gap-1 px-2.5 py-1 rounded-lg bg-emerald-500/10 hover:bg-emerald-500/20 text-emerald-400 border border-emerald-500/30 transition-all text-[10px] font-bold active:scale-95"
                      title="Share on WhatsApp with college friends"
                    >
                      <span>💬 WhatsApp</span>
                    </button>
                  </div>

                  <button
                    type="button"
                    onClick={() => handleOpenPurchaseModal(sub, 'bundle')}
                    className="w-full text-center text-[11px] text-[#86868B] hover:text-emerald-400 transition-colors pt-0.5 block truncate"
                  >
                    Compare ₹49 vs ₹149 Bundle Details →
                  </button>
                </div>
              </div>
            ))}
          </div>

          {/* Mobile Bottom Indicator & Slide Dots (md:hidden) */}
          <div className="flex md:hidden flex-col items-center justify-center gap-2 mb-10 -mt-4">
            <div className="flex items-center gap-1.5 bg-black/60 px-3 py-1.5 rounded-full border border-white/10 shadow-lg">
              {SUBJECTS.map((s, i) => (
                <button
                  key={i}
                  type="button"
                  onClick={() => scrollToSlide(i)}
                  className={`h-2 rounded-full transition-all ${
                    activeSlideIndex === i ? 'w-6 bg-emerald-400' : 'w-2 bg-white/20 hover:bg-white/40'
                  }`}
                  aria-label={`Go to ${s.title}`}
                />
              ))}
            </div>
            <p className="text-[10px] font-mono text-[#86868B]">
              Swipe cards horizontally or tap track pills above
            </p>
          </div>
        </div>
        )}

        {/* ── THE DEFINITIVE 49 VS 149 CAREER COMPARISON & PSYCHOLOGY FRAMEWORK ──── */}
        <div className="mb-16 p-6 sm:p-10 rounded-3xl bg-gradient-to-b from-[#111116] to-[#0A0A0D] border border-white/[0.12] shadow-2xl relative overflow-hidden">
          {/* Subtle Glow Background */}
          <div className="absolute -top-40 right-0 w-96 h-96 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none" />
          <div className="absolute -bottom-40 left-0 w-96 h-96 bg-cyan-500/10 rounded-full blur-3xl pointer-events-none" />

          <div className="relative z-10">
            {/* Header */}
            <div className="text-center max-w-3xl mx-auto mb-8 sm:mb-10">
              <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/30 text-xs font-mono font-bold mb-3">
                ⚖️ 49 vs 149 : CAREER DECISION MATRIX · HONEST ADVICE
              </span>
              <h2 className="text-2xl sm:text-4xl font-black text-white tracking-tight mb-3">
                Why 89% of Students Pick the ₹149 Career Accelerator Suite
              </h2>
              <p className="text-xs sm:text-sm text-[#86868B] leading-relaxed">
                We believe in complete transparency. No false promises, no subscription traps. Here is the exact difference between buying only the basic theory notes versus investing ₹100 extra in the complete career arsenal:
              </p>
            </div>

            {/* Side-by-Side Comparison Cards */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 sm:gap-8 mb-8">
              
              {/* Option A: ₹49 Core Master Pass */}
              <div className="p-5 sm:p-7 rounded-2xl sm:rounded-3xl bg-black/60 border border-white/[0.1] flex flex-col justify-between">
                <div>
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2.5 sm:gap-4 mb-5 pt-1 sm:pt-0">
                    <span className="inline-flex items-center text-[10px] sm:text-xs font-mono font-bold text-[#86868B] px-3 py-1 rounded-full bg-white/[0.05] border border-white/[0.08] w-fit whitespace-nowrap">
                      OPTION 1: FOUNDATIONAL MASTER PASS™
                    </span>
                    <div className="flex items-baseline gap-2 self-start sm:self-auto flex-wrap">
                      <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                        ₹199
                      </span>
                      <span className="text-2xl sm:text-3xl font-black text-white">₹49</span>
                      <span className="text-[10px] font-mono px-2 py-0.5 rounded-full bg-white/[0.08] text-emerald-400 font-bold border border-white/10 whitespace-nowrap">75% OFF</span>
                    </div>
                  </div>

                  <div className="text-center mb-4">
                    <h3 className="text-lg font-bold text-white mb-1">
                      Foundational Engineering Master Pass™
                    </h3>
                    <div className="text-xs font-mono text-zinc-400 font-semibold mb-2">
                      📘 The Essential Technical Blueprint · 100% Concept Mastery &amp; Academic Excellence
                    </div>
                    <p className="text-xs text-[#86868B] leading-relaxed max-w-md mx-auto">
                      Designed for students who want to build a bulletproof conceptual foundation, revise silicon architectures, and master theory for university and semester exams.
                    </p>
                  </div>

                  <div className="space-y-2 mb-6">
                    <div className="text-xs font-mono font-bold text-white/80 uppercase tracking-wider mb-2">
                      What's Included in ₹49:
                    </div>
                    <div className="flex items-center gap-2 text-xs text-[#D2D2D7]">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span>Full Core Master Guide (English or Hindi PDF)</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-[#D2D2D7]">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span>High-resolution vector architecture &amp; pinout diagrams</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-[#D2D2D7]">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span>Chapter-wise practice MCQs &amp; conceptual summaries</span>
                    </div>
                  </div>

                  {/* The Reality & Limitation */}
                  <div className="p-4 rounded-xl bg-red-500/[0.06] border border-red-500/20 text-xs space-y-1.5 mb-4">
                    <div className="font-bold text-red-400 flex items-center gap-1.5 font-mono text-[11px]">
                      <span>⚠️</span>
                      <span>What Happens If You Only Choose the ₹49 Core Pass?</span>
                    </div>
                    <p className="text-red-200/80 leading-relaxed text-[11px]">
                      Your theoretical concepts will be clear and you will pass your college semester exams. However, when you appear for <strong>real MNC technical interviews</strong> (TCS, Infosys, Cisco, Accenture, Tech Startups), interviewers never ask textbook definitions! They evaluate live troubleshooting, production edge cases, and salary negotiation. Without the Interview Vault &amp; Practical Labs, candidates frequently struggle in 2nd-round technical rounds or end up settling for low-tier <strong>₹2.5L–₹3.2L CTC</strong> packages.
                    </p>
                  </div>
                </div>

                <button
                  type="button"
                  onClick={() => handleOpenPurchaseModal(selectedSubject, 'single')}
                  className="w-full py-3 rounded-xl bg-white/[0.08] hover:bg-white/[0.15] text-white text-xs font-bold transition-all border border-white/10"
                >
                  Choose ₹49 Core Pass Only
                </button>
              </div>

              {/* Option B: ₹149 Career Accelerator Suite (BEST VALUE) */}
              <div className="relative p-5 sm:p-7 rounded-2xl sm:rounded-3xl bg-[#0F161A] border-2 border-emerald-500 shadow-2xl shadow-emerald-500/10 flex flex-col justify-between mt-5 sm:mt-0">
                {/* Glow Badge */}
                <div className="absolute -top-3.5 left-4 sm:left-auto sm:right-6 px-3 py-1 rounded-full bg-emerald-500 text-black text-[10px] sm:text-[11px] font-black font-mono shadow-md uppercase tracking-wide">
                  ★ RECOMMENDED BY 89% STUDENTS · BEST VALUE
                </div>

                <div>
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2.5 sm:gap-4 mb-5 pt-3 sm:pt-0">
                    <span className="inline-flex items-center text-[10px] sm:text-xs font-mono font-bold text-emerald-400 px-3 py-1 rounded-full bg-emerald-500/15 border border-emerald-500/30 w-fit whitespace-nowrap">
                      OPTION 2: EXECUTIVE CAREER SUITE™
                    </span>
                    <div className="flex items-baseline gap-2 self-start sm:self-auto flex-wrap">
                      <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                        ₹1,099
                      </span>
                      <span className="text-2xl sm:text-3xl font-black text-emerald-400">₹149</span>
                      <span className="text-[10px] font-mono px-2.5 py-0.5 rounded-full bg-emerald-500/20 text-emerald-300 font-bold border border-emerald-500/40 whitespace-nowrap">SAVE ₹950 · 86% OFF</span>
                    </div>
                  </div>

                  <div className="text-center mb-4">
                    <h3 className="text-lg font-bold text-white mb-1">
                      Executive Career Accelerator Suite™ (Elite Placement Edition)
                    </h3>
                    <div className="text-xs font-mono text-emerald-400 font-semibold mb-2">
                      👑 The 6-Figure Placement Arsenal · Enterprise Career Advantage
                    </div>
                    <p className="text-xs text-emerald-200/80 leading-relaxed max-w-md mx-auto">
                      A comprehensive placement weapon designed to help you clear technical interview rounds and negotiate high-tier salary packages at top tech firms.
                    </p>
                  </div>

                  <div className="space-y-2 mb-6">
                    <div className="text-xs font-mono font-bold text-emerald-400 uppercase tracking-wider mb-2">
                      Everything in ₹49 PLUS for just +₹100 extra:
                    </div>
                    <div className="flex items-center gap-2 text-xs text-amber-200 bg-amber-500/10 border border-amber-400/30 px-2.5 py-1.5 rounded-lg">
                      <span className="text-amber-400 font-bold shrink-0">🎁</span>
                      <span><strong>FREE BONUS: ₹22 8-Page Quick Desk Cheat Sheet</strong> (EN/HI/GU + 150 Shortcuts Wall Included!)</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>English + Hindi + Gujarati Master Guides</strong> (No language lock)</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>Top 50–120 MNC Technical Interview Question Vault</strong> (Senior model answers)</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>100 Enterprise Prompts / Shortcuts / Hands-on Lab Workbooks</strong></span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>2027 Career &amp; Salary Blueprint</strong> (LPA CTC bands ₹4.5L to ₹18L+, HR negotiation scripts)</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>High-Converting InMail Outreach &amp; ATS Resume Templates</strong></span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>1-Click Master ZIP Offline Bundle</strong> (Instant offline backup)</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>Founder Rahul Sir's Direct Career Email</strong> (rahul.28e1@gmail.com)</span>
                    </div>
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>100% Lifetime Free Yearly Updates</strong> directly to your inbox</span>
                    </div>
                  </div>

                  {/* The Career Advantage */}
                  <div className="p-4 rounded-xl bg-emerald-500/10 border border-emerald-500/30 text-xs space-y-1.5 mb-4">
                    <div className="font-bold text-emerald-400 flex items-center gap-1.5 font-mono text-[11px]">
                      <span>🚀</span>
                      <span>What Happens When You Upgrade to the ₹149 Career Suite?</span>
                    </div>
                    <p className="text-emerald-100/90 leading-relaxed text-[11px]">
                      For just <strong>₹100 extra</strong> (less than the price of a single movie ticket or pizza!), you enter corporate interviews armed with senior engineer-approved answers, ATS-ready resume templates, proven salary negotiation scripts, and direct continuous mentorship from Rahul Sir. Instead of struggling with low-ball offers, you stand out from thousands of applicants and aim straight for <strong>₹5L to ₹12L+ CTC</strong> career opportunities!
                    </p>
                  </div>
                </div>

                <button
                  type="button"
                  onClick={() => handleOpenPurchaseModal(selectedSubject, 'bundle')}
                  className="w-full py-3.5 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black text-sm font-black transition-all shadow-lg shadow-emerald-500/25 active:scale-98"
                >
                  Upgrade to ₹149 Career Accelerator Suite →
                </button>
              </div>

            </div>

            {/* Quick Summary Pill Banner */}
            <div className="p-4 rounded-2xl bg-black/50 border border-white/[0.08] flex flex-col sm:flex-row items-center justify-between gap-3 text-center sm:text-left">
              <div className="text-xs text-[#86868B]">
                <strong className="text-white">Bottom line:</strong> If you only need exam notes, choose ₹49. If you are preparing for real jobs, campus placements, or high CTC salaries, choose ₹149.
              </div>
              <div className="flex items-center gap-2 shrink-0">
                <span className="text-[11px] font-mono text-emerald-400 font-bold">
                  🔒 Zero Risk · Instant Access
                </span>
              </div>
            </div>

          </div>
        </div>

        {/* ── OFFICIAL WHATSAPP STUDENT COMMUNITY BANNER ──────────── */}
        <div className="mb-14">
          <WhatsAppCommunityCard />
        </div>

        {/* ── VERIFIED STUDENT REVIEWS & PLACEMENT STORIES (14 INDIAN REVIEWS) ── */}
        <div id="reviews" className="mb-16">
          <div className="text-center max-w-3xl mx-auto mb-8 sm:mb-10">
            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-amber-500/10 text-amber-400 border border-amber-500/30 text-xs font-mono font-bold mb-3 shadow-lg shadow-amber-500/5">
              <span>⭐</span>
              <span>4.9 / 5.0 RATED BY 2,480+ STUDENTS ACROSS INDIA</span>
            </div>
            <h2 className="text-2xl sm:text-4xl font-black text-white tracking-tight mb-2">
              Verified Student Reviews &amp; Placement Wall
            </h2>
            <p className="text-xs sm:text-sm text-[#86868B] leading-relaxed mx-auto max-w-2xl">
              Authentic feedback from college students &amp; engineers (AKTU, Pune, GTU, VTU, Mumbai &amp; Delhi Universities) who used RTechLab Master Notes to ace their exams and crack MNC placements.
            </p>

            {/* Filter Tabs */}
            <div className="flex flex-wrap items-center justify-center gap-1.5 sm:gap-2 mt-5">
              {[
                { id: 'all', label: 'All Reviews (14)' },
                { id: 'ai', label: 'AI Mastery' },
                { id: 'office-365', label: 'Office 365 & MIS' },
                { id: 'fundamentals', label: 'Computer Fundamentals' },
                { id: 'ccna', label: 'Cisco CCNA 200-301' },
              ].map((f) => (
                <button
                  key={f.id}
                  type="button"
                  onClick={() => {
                    setReviewFilter(f.id);
                    setActiveReviewIndex(0);
                  }}
                  className={`px-3 py-1.5 rounded-full text-xs font-mono font-semibold transition-all ${
                    reviewFilter === f.id
                      ? 'bg-emerald-500 text-black font-bold shadow-md shadow-emerald-500/20'
                      : 'bg-white/[0.04] text-[#86868B] hover:text-white border border-white/[0.08]'
                  }`}
                >
                  {f.label}
                </button>
              ))}
            </div>
          </div>

          {/* Controls Bar: Auto-Slide Badge + Prev/Next Controls */}
          <div className="flex items-center justify-between gap-3 mb-4 px-2">
            <span className="text-[11px] font-mono text-emerald-400 bg-emerald-500/10 px-3 py-1 rounded-full border border-emerald-500/20 inline-flex items-center gap-1.5">
              <span className={`w-2 h-2 rounded-full ${isReviewPaused ? 'bg-amber-400' : 'bg-emerald-400 animate-pulse'}`} />
              <span>{isReviewPaused ? '⏸️ Sliding Paused (Reading)' : '⚡ Auto-Sliding · Hover to pause'}</span>
            </span>

            <div className="flex items-center gap-2">
              <button
                type="button"
                onClick={handlePrevReview}
                className="w-9 h-9 rounded-full bg-white/[0.06] hover:bg-emerald-500 hover:text-black border border-white/10 text-white font-bold flex items-center justify-center transition-all active:scale-95 text-lg"
                title="Previous slide"
              >
                ‹
              </button>
              <button
                type="button"
                onClick={handleNextReview}
                className="w-9 h-9 rounded-full bg-white/[0.06] hover:bg-emerald-500 hover:text-black border border-white/10 text-white font-bold flex items-center justify-center transition-all active:scale-95 text-lg"
                title="Next slide"
              >
                ›
              </button>
            </div>
          </div>

          {/* Reviews Auto-Sliding Track Container */}
          <div
            className="relative overflow-hidden py-2"
            onMouseEnter={() => setIsReviewPaused(true)}
            onMouseLeave={() => setIsReviewPaused(false)}
            onTouchStart={() => setIsReviewPaused(true)}
            onTouchEnd={() => setIsReviewPaused(false)}
          >
            <div
              className="flex transition-transform duration-700 ease-out"
              style={{
                transform: `translateX(-${activeReviewIndex * (100 / cardsPerView)}%)`,
              }}
            >
              {filteredReviews.map((rev) => (
                <div
                  key={rev.id}
                  className="shrink-0 p-2 sm:p-2.5"
                  style={{ width: `${100 / cardsPerView}%` }}
                >
                  <div className="p-5 sm:p-6 rounded-2xl bg-[#0D0D10] border border-white/[0.08] hover:border-emerald-500/40 transition-all flex flex-col justify-between shadow-xl hover:shadow-2xl hover:shadow-emerald-500/5 h-full">
                    <div>
                      {/* Top Bar: Stars & Verified Badge */}
                      <div className="flex items-center justify-between mb-3">
                        <div className="flex items-center gap-1 text-amber-400 text-xs sm:text-sm tracking-widest">
                          {[...Array(rev.stars)].map((_, i) => (
                            <span key={i}>★</span>
                          ))}
                          {rev.stars < 5 && <span className="text-white/20">★</span>}
                          <span className="text-[11px] font-mono text-white/50 ml-1">({rev.stars}.0)</span>
                        </div>
                        <span className="text-[10px] font-mono text-emerald-400 flex items-center gap-1 font-semibold bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
                          <span>✓</span>
                          <span>Verified Student</span>
                        </span>
                      </div>

                      {/* Review Quote */}
                      <p className="text-xs sm:text-[13px] text-[#D2D2D7] leading-relaxed mb-4 italic">
                        "{rev.review}"
                      </p>
                    </div>

                    {/* Student Info Footer */}
                    <div className="pt-3 border-t border-white/[0.06] flex items-center justify-between gap-3">
                      <div className="flex items-center gap-2.5 truncate">
                        <div className={`w-8 h-8 rounded-full flex items-center justify-center font-bold text-xs shrink-0 ${rev.avatarBg}`}>
                          {rev.name.split(' ').map(n => n[0]).join('')}
                        </div>
                        <div className="truncate text-left">
                          <div className="text-xs font-bold text-white truncate">
                            {rev.name}
                          </div>
                          <div className="text-[10px] font-mono text-[#86868B] truncate">
                            {rev.college}
                          </div>
                          <div className="text-[10px] font-mono text-emerald-400 font-semibold truncate">
                            {rev.role}
                          </div>
                        </div>
                      </div>
                      <div className="text-right shrink-0">
                        <span className="text-[9px] font-mono text-white/40 block">
                          {rev.date}
                        </span>
                        <span className="text-[9px] font-mono text-cyan-400/90 block">
                          {rev.subject}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Dots Indicator */}
          {maxReviewIndex > 0 && (
            <div className="flex items-center justify-center gap-1.5 mt-5">
              {[...Array(maxReviewIndex + 1)].map((_, i) => (
                <button
                  key={i}
                  type="button"
                  onClick={() => setActiveReviewIndex(i)}
                  className={`h-2 rounded-full transition-all ${
                    activeReviewIndex === i
                      ? 'w-7 bg-emerald-400 shadow-md shadow-emerald-400/50'
                      : 'w-2 bg-white/20 hover:bg-white/40'
                  }`}
                  title={`Go to slide ${i + 1}`}
                />
              ))}
            </div>
          )}

          {/* Social Proof Trust Bar */}
          <div className="mt-8 p-4 rounded-2xl bg-white/[0.02] border border-white/[0.06] flex flex-wrap items-center justify-around gap-4 text-center">
            <div>
              <div className="text-xl sm:text-2xl font-black text-white">4.9 / 5.0</div>
              <div className="text-[10px] font-mono text-[#86868B] uppercase">Average Student Rating</div>
            </div>
            <div className="h-8 w-px bg-white/10 hidden sm:block" />
            <div>
              <div className="text-xl sm:text-2xl font-black text-emerald-400">2,480+</div>
              <div className="text-[10px] font-mono text-[#86868B] uppercase">Engineers &amp; Students Enrolled</div>
            </div>
            <div className="h-8 w-px bg-white/10 hidden sm:block" />
            <div>
              <div className="text-xl sm:text-2xl font-black text-cyan-400">120+</div>
              <div className="text-[10px] font-mono text-[#86868B] uppercase">Indian Colleges &amp; Universities</div>
            </div>
            <div className="h-8 w-px bg-white/10 hidden sm:block" />
            <div>
              <div className="text-xl sm:text-2xl font-black text-purple-400">89%</div>
              <div className="text-[10px] font-mono text-[#86868B] uppercase">Upgraded to ₹149 Career Suite</div>
            </div>
          </div>
        </div>

        {/* ── INTERACTIVE 3D NOTEBOOK PREVIEW MODAL ──────────────────────────── */}
        {isReaderModalOpen && (
          <div className="fixed inset-0 z-50 flex items-center justify-center p-2 sm:p-4 bg-black/90 backdrop-blur-xl animate-fadeIn">
            <div className="relative w-full max-w-4xl max-h-[96vh] rounded-2xl sm:rounded-3xl bg-[#101014] border border-white/20 shadow-2xl flex flex-col overflow-hidden">
              
              {/* Header Bar */}
              <div className="p-3 sm:p-4 bg-[#141418] border-b border-white/10 flex items-center justify-between gap-2 shrink-0">
                <div className="flex items-center gap-2 truncate">
                  <span className="w-2.5 h-2.5 rounded-full bg-emerald-400 animate-pulse shrink-0" />
                  <h3 className="text-xs sm:text-base font-bold text-white truncate">
                    {selectedSubject.title} — 5-Page Interactive Preview
                  </h3>
                </div>

                <div className="flex items-center gap-2 shrink-0">
                  {/* Language Toggle */}
                  <div className="flex items-center bg-black/60 rounded-lg p-0.5 border border-white/15">
                    <button
                      type="button"
                      onClick={() => setPreviewLang('en')}
                      className={`px-2 py-1 rounded text-[10px] font-mono font-bold transition-all ${
                        previewLang === 'en' ? 'bg-emerald-500 text-black' : 'text-[#86868B] hover:text-white'
                      }`}
                    >
                      EN (Global)
                    </button>
                    <button
                      type="button"
                      onClick={() => setPreviewLang('hi')}
                      className={`px-2 py-1 rounded text-[10px] font-mono font-bold transition-all ${
                        previewLang === 'hi' ? 'bg-cyan-500 text-black' : 'text-[#86868B] hover:text-white'
                      }`}
                    >
                      HI (हिंदी)
                    </button>
                    {PREVIEW_ASSETS[selectedSubject.id]?.gu && (
                      <button
                        type="button"
                        onClick={() => setPreviewLang('gu')}
                        className={`px-2 py-1 rounded text-[10px] font-mono font-bold transition-all ${
                          previewLang === 'gu' ? 'bg-amber-400 text-black' : 'text-[#86868B] hover:text-white'
                        }`}
                      >
                        GU (ગુજરાતી)
                      </button>
                    )}
                  </div>

                  {/* Close button */}
                  <button
                    type="button"
                    onClick={() => setIsReaderModalOpen(false)}
                    aria-label="Close interactive preview"
                    className="p-1.5 rounded-full bg-white/10 hover:bg-white/20 text-white transition-all cursor-pointer"
                  >
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>
              </div>

              {/* Sub-header / Page Title Label */}
              <div className="px-4 py-2 bg-black/60 border-b border-white/[0.06] flex items-center justify-between text-xs font-mono text-[#86868B] shrink-0">
                <span className="truncate text-emerald-400 font-semibold">
                  {getPageLabel(selectedSubject.id, previewLang, previewPage)}
                </span>
                <span className="shrink-0 text-white/60">
                  Page {previewPage} of 5
                </span>
              </div>

              {/* 3D Realistic Notebook Viewer Stage */}
              <div className="relative flex-1 bg-[#09090C] overflow-hidden flex items-center justify-center p-2 sm:p-6 min-h-[360px] sm:min-h-[500px]">
                
                {/* Prev Page Button */}
                <button
                  type="button"
                  onClick={() => handleTurnPage('prev')}
                  disabled={previewPage === 1 || isPageFlipping}
                  className={`absolute left-2 sm:left-4 top-1/2 -translate-y-1/2 z-30 w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center text-xl sm:text-2xl font-bold transition-all backdrop-blur-md shadow-2xl ${
                    previewPage === 1
                      ? 'opacity-20 cursor-not-allowed bg-black/40 text-white/30 border border-white/5'
                      : 'bg-black/85 hover:bg-emerald-500 hover:text-black text-white border border-white/20 hover:scale-110 active:scale-95 cursor-pointer'
                  }`}
                >
                  ‹
                </button>

                {/* Notebook Physical Frame */}
                <div
                  onClick={() => handleTurnPage('next')}
                  className="relative max-w-full max-h-full flex items-stretch rounded-lg sm:rounded-xl shadow-[0_25px_60px_-15px_rgba(0,0,0,0.9)] border border-white/10 overflow-hidden cursor-pointer group"
                >
                  {/* Spiral Binder Spine */}
                  <div className="w-5 sm:w-7 bg-gradient-to-r from-[#141417] via-[#24242a] to-[#141417] flex flex-col justify-between py-4 sm:py-6 rounded-l-md border-r border-black/60 select-none shrink-0 z-30 shadow-inner">
                    {[...Array(11)].map((_, i) => (
                      <div key={i} className="flex items-center justify-center relative my-0.5 sm:my-1">
                        <div className="w-2 sm:w-2.5 h-2 sm:h-2.5 rounded-full bg-black shadow-inner border border-zinc-700/60" />
                        <div className="absolute w-5 sm:w-6 h-2 sm:h-2.5 rounded-full bg-gradient-to-r from-zinc-500 via-zinc-100 to-zinc-600 shadow-md transform -rotate-12 border border-zinc-950 pointer-events-none" />
                      </div>
                    ))}
                  </div>

                  {/* Notebook Page Stage */}
                  <div className="relative flex-1 bg-black overflow-hidden flex items-center justify-center">
                    <img
                      src={getPreviewImage(
                        selectedSubject.id,
                        previewLang,
                        isPageFlipping ? targetFlipPage : previewPage
                      )}
                      alt={getPageLabel(
                        selectedSubject.id,
                        previewLang,
                        isPageFlipping ? targetFlipPage : previewPage
                      )}
                      className="max-h-[50vh] sm:max-h-[60vh] w-auto max-w-full object-contain block select-none pointer-events-none"
                    />

                    {/* Bottom Right Page Stamp */}
                    <div className="absolute bottom-2 sm:bottom-3 right-3 sm:right-4 z-20 px-2 py-0.5 rounded bg-black/70 backdrop-blur-sm border border-white/10 text-[10px] sm:text-xs font-mono font-bold text-white/70 pointer-events-none">
                      {previewLang === 'gu' ? 'પેજ' : previewLang === 'hi' ? 'पेज' : 'Page'} {isPageFlipping ? targetFlipPage : previewPage} / 5
                    </div>
                  </div>
                </div>

                {/* Next Page Button */}
                <button
                  type="button"
                  onClick={() => handleTurnPage('next')}
                  disabled={previewPage === 5 || isPageFlipping}
                  className={`absolute right-2 sm:right-4 top-1/2 -translate-y-1/2 z-30 w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center text-xl sm:text-2xl font-bold transition-all backdrop-blur-md shadow-2xl ${
                    previewPage === 5
                      ? 'opacity-20 cursor-not-allowed bg-black/40 text-white/30 border border-white/5'
                      : 'bg-black/85 hover:bg-emerald-500 hover:text-black text-white border border-white/20 hover:scale-110 active:scale-95 cursor-pointer'
                  }`}
                >
                  ›
                </button>
              </div>

              {/* Modal Footer Bar */}
              <div className="p-3 sm:p-4 bg-[#141418] border-t border-white/10 flex flex-col sm:flex-row items-center justify-between gap-3 shrink-0">
                <div className="flex items-center gap-2 flex-wrap w-full sm:w-auto">
                  <span className="text-[11px] font-mono text-[#86868B]">Free 5p PDF:</span>
                  <a
                    href={selectedSubject.previewPdfEn || '#'}
                    download
                    className="px-2.5 py-1 rounded-lg bg-white/[0.06] hover:bg-white/[0.12] text-[10px] sm:text-[11px] font-mono font-semibold text-white/90 border border-white/10 flex items-center gap-1 transition-all"
                  >
                    <span>🇬🇧 5p EN</span>
                  </a>
                  {selectedSubject.previewPdfHi && (
                    <a
                      href={selectedSubject.previewPdfHi}
                      download
                      className="px-2.5 py-1 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 text-[10px] sm:text-[11px] font-mono font-semibold text-cyan-300 border border-cyan-500/20 flex items-center gap-1 transition-all"
                    >
                      <span>🇮🇳 5p हिंदी</span>
                    </a>
                  )}
                  {selectedSubject.previewPdfGu && (
                    <a
                      href={selectedSubject.previewPdfGu}
                      download
                      className="px-2.5 py-1 rounded-lg bg-amber-500/10 hover:bg-amber-500/20 text-[10px] sm:text-[11px] font-mono font-semibold text-amber-300 border border-amber-500/20 flex items-center gap-1 transition-all"
                    >
                      <span>🦁 5p ગુજરાતી</span>
                    </a>
                  )}
                </div>

                <div className="flex items-center gap-2 w-full sm:w-auto justify-end">
                  <button
                    type="button"
                    onClick={() => {
                      setIsReaderModalOpen(false);
                      handleOpenPurchaseModal(selectedSubject, 'bundle');
                    }}
                    className="inline-flex items-center justify-center gap-1.5 px-4 sm:px-5 py-2 w-full sm:w-auto rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-90 text-black text-xs sm:text-sm font-black transition-all shadow-lg shadow-emerald-500/30 active:scale-95 shrink-0"
                  >
                    <span>Get Full Notes &amp; Career Suite</span>
                    <span>→</span>
                  </button>
                </div>
              </div>

            </div>
          </div>
        )}

        {/* ── PACKAGE SELECTOR & UPSELL MODAL (₹49 VS ₹149 UPGRADE) ──────────── */}
        {isUpsellOpen && (
          <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-4 bg-black/95 backdrop-blur-xl animate-fadeIn">
            <div
              className="relative w-full max-w-2xl rounded-t-3xl sm:rounded-3xl bg-zinc-950 border border-white/[0.18] p-5 sm:p-8 shadow-2xl max-h-[92vh] sm:max-h-[90vh] overflow-y-auto"
              style={{ backgroundColor: '#0e0e13' }}
            >
              
              {/* Close Button */}
              <button
                type="button"
                onClick={() => setIsUpsellOpen(false)}
                aria-label="Close modal"
                className="absolute top-4 right-4 text-[#86868B] hover:text-white p-1.5 rounded-full bg-white/[0.06] cursor-pointer"
              >
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>

              {/* Header */}
              <div className="text-center mb-5 sm:mb-6">
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/30 text-[10px] sm:text-xs font-mono font-bold mb-2">
                  ✨ TRANSPARENT STUDENT CHOICE · NO PRESSURE
                </span>
                <h3 className="text-xl sm:text-3xl font-black text-white tracking-tight mb-1">
                  Select Package for {selectedSubject.title}
                </h3>
                <p className="text-xs text-[#86868B] max-w-lg mx-auto leading-relaxed">
                  {selectedSubject.hasCheatSheet
                    ? `Choose between the 8-Page Desk Cheat Sheet at ₹22, the ${selectedSubject.pages} at ₹49, or the complete Career Accelerator Suite at ₹149:`
                    : 'Choose between the standalone theory handbook at ₹49 or upgrade to the complete Career Accelerator Suite (+Interview Vault, Labs & Salary Blueprint) for just +₹100 extra:'}
                </p>
              </div>

              {/* Selectable Options (With Custom 3-Tier Clarity for CheatSheet-Enabled Subjects) */}
              {selectedSubject.hasCheatSheet ? (
                <div className="space-y-3 mb-5">
                  {/* Transparent Guidance Box: No Confusion for Students */}
                  <div className="p-3 sm:p-3.5 rounded-2xl bg-amber-500/10 border border-amber-500/30 text-xs space-y-2">
                    <div className="text-[11px] font-mono text-amber-400 font-bold flex items-center gap-1.5">
                      <span>💡</span>
                      <span>कौन सा एडिशन आपके लिए सही है? (Which one is right for you?):</span>
                    </div>
                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-2 text-[11px] text-[#A1A1A6]">
                      <div className="p-2 rounded-xl bg-black/50 border border-white/5">
                        <strong className="text-amber-300 block mb-0.5">⚡ ₹22 चीट शीट लें:</strong>
                        {selectedSubject.id === 'tally'
                          ? 'अगर आप ऑफिस में टेबल पर रखने के लिए तुरंत 28 ग्रुप्स, 24 वाउचर्स व शॉर्टकट्स का 1-नज़र रेफरेंस चाहते हैं।'
                          : 'अगर आप ऑफिस/इंटरव्यू हेतु डायनामिक फॉर्मूले (XLOOKUP, LET), पावर क्वेरी व शॉर्टकट्स का 1-नज़र रेफरेंस चाहते हैं।'}
                      </div>
                      <div className="p-2 rounded-xl bg-black/50 border border-white/5">
                        <strong className="text-white block mb-0.5">📘 ₹49 मास्टर गाइड लें:</strong>
                        {selectedSubject.id === 'tally'
                          ? 'अगर आप पूरा टैली बेसिक से एडवांस तक 10 चैप्टर्स और 50+ इनवॉइस के साथ डीप में स्टेप-बाय-स्टेप सीखना चाहते हैं।'
                          : 'अगर आप वर्ड, एक्सेल, पावरपॉइंट, एक्सेस व आउटलुक पूरे 113 पेजों और 13 चैप्टर्स में डीप में सीखना चाहते हैं।'}
                      </div>
                      <div className="p-2 rounded-xl bg-black/50 border border-white/5">
                        <strong className="text-emerald-300 block mb-0.5">👑 ₹149 कम्प्लीट सुइट:</strong>
                        {selectedSubject.id === 'tally'
                          ? 'अगर आपको दोनों बुक्स + 50 इंटरव्यू Q&A + 50 इनवॉइस वर्कबुक + राहुल सर मेंटरशिप सब एक साथ चाहिए।'
                          : 'अगर आपको दोनों बुक्स + 100 शॉर्टकट्स व 50 MIS Q&A + 6 रियल लैब फाइल्स (.xlsx) + राहुल सर मेंटरशिप सब एक साथ चाहिए।'}
                      </div>
                    </div>
                  </div>

                  {/* Option 1: ₹22 Quick Desk Reference (8 Pages) */}
                  <div
                    onClick={() => setModalSelectedPlan('cheatsheet')}
                    className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                      modalSelectedPlan === 'cheatsheet'
                        ? 'bg-[#18150a] border-amber-400 text-white shadow-xl shadow-amber-500/15 ring-1 ring-amber-400/40'
                        : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-amber-400/40'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'cheatsheet' ? 'border-amber-400 bg-amber-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'cheatsheet' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-bold text-white text-sm sm:text-base">
                            ⚡ 8-Page Desk Reference &amp; Cheat Sheet
                          </span>
                          <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-amber-500/20 text-amber-300 font-extrabold border border-amber-500/40">
                            🔥 DAILY DESK COMPANION · ₹22 ONLY
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-amber-300 font-semibold mb-1">
                          {selectedSubject.id === 'tally'
                            ? '⚡ Quick Memory Recall · All 28 Groups · 24 Vouchers · Top 35 Shortcuts'
                            : '⚡ Quick Memory Recall · Dynamic Formulas · Word & PPT Rules · 60+ Hotkeys'}
                        </div>
                        <p className="text-xs text-[#D2D2D7] leading-relaxed">
                          {selectedSubject.id === 'tally'
                            ? 'Ultra-dense 8-page desk companion with Bestseller Cover, 15 Primary + 13 Secondary Groups, 24 Vouchers, Rule 46 GST invoice structure, CTS-2010 cheque BRS & Form 26Q calendar. (Available in Hindi, English, Gujarati).'
                            : 'Ultra-dense 8-page desk companion with Bestseller Cover, XLOOKUP, Dynamic Arrays (#), LET, TEXTSPLIT, Power Query ETL, Word Legal Styles, Morph Transitions & Outlook 4D Inbox Zero. (Available in Hindi, English, Gujarati).'}
                        </p>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹99</div>
                      <div className="text-lg sm:text-2xl font-black text-amber-400">₹22</div>
                      <div className="text-[9px] font-mono text-amber-300 font-bold">SAVE 78%</div>
                    </div>
                  </div>

                  {/* Option 2: ₹49 Complete Master Study Guide */}
                  <div
                    onClick={() => setModalSelectedPlan('single')}
                    className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                      modalSelectedPlan === 'single'
                        ? 'bg-black border-white text-white shadow-lg ring-1 ring-white/30'
                        : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-white/20'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'single' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'single' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-bold text-white text-sm sm:text-base">
                            📘 Complete Master Study Guide &amp; Vocational Textbook
                          </span>
                          <span className="text-[9px] font-mono px-2 py-0.5 rounded bg-white/10 text-white font-bold border border-white/20">
                            {selectedSubject.pages.toUpperCase()}
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-zinc-300 font-semibold mb-1">
                          {selectedSubject.id === 'tally'
                            ? '📘 Step-by-Step Concepts · 10 In-Depth Chapters · 50+ Invoices'
                            : '📘 Step-by-Step Concepts · 13 In-Depth Chapters · Practical Labs'}
                        </div>
                        <p className="text-xs text-[#86868B] leading-relaxed">
                          {selectedSubject.id === 'tally'
                            ? 'Full textbook from accounting basics to advanced company creation, multi-currency, APMC mandi trading entries, interstate IGST, and year-end trial balance audit.'
                            : 'Full comprehensive enterprise textbook covering Word legal architecture, advanced Excel calculations, executive PowerPoint decks, Access relational databases, and corporate MIS workflows.'}
                        </p>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹199</div>
                      <div className="text-lg sm:text-2xl font-black text-white">₹49</div>
                      <div className="text-[9px] font-mono text-zinc-400">SAVE 75%</div>
                    </div>
                  </div>

                  {/* Option 3: ₹149 Complete Career Accelerator Suite */}
                  <div
                    onClick={() => setModalSelectedPlan('bundle')}
                    className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                      modalSelectedPlan === 'bundle'
                        ? 'bg-[#0E161B] border-emerald-500 text-white shadow-xl shadow-emerald-500/15 ring-1 ring-emerald-500/40'
                        : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-emerald-500/40'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'bundle' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'bundle' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-bold text-white text-sm sm:text-base">
                            👑 Executive Career Accelerator Suite (All-In-One ZIP)
                          </span>
                          <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-emerald-500/15 text-emerald-400 font-extrabold border border-emerald-500/30">
                            ALL DELIVERABLES · BEST VALUE
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-emerald-400 font-semibold mb-1">
                          👑 Everything Included: Both ₹22 &amp; ₹49 Books + Interview Vault + Labs
                        </div>
                        <p className="text-xs text-emerald-200/90 leading-relaxed">
                          {selectedSubject.id === 'tally'
                            ? 'Includes 8-Page Desk Sheet + 51-Page Master Guide (All 3 Languages) + Top 50 Accountant Interview Vault + 50 Real Invoices Workbook + TDS Practice Set + Direct Rahul Sir Mentorship!'
                            : 'Includes 8-Page Desk Sheet + 113-Page Master Guide (All 3 Languages) + Top 100 Shortcuts & 50 MIS Placement Vault + 6 Real Lab Files (.xlsx & .docx) + Direct Rahul Sir Mentorship!'}
                        </p>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹1,099</div>
                      <div className="text-lg sm:text-2xl font-black text-emerald-400">₹149</div>
                      <div className="text-[9px] font-mono text-emerald-300 font-bold">SAVE 86%</div>
                    </div>
                  </div>
                </div>
              ) : (
                <div className="space-y-3 mb-5">
                  {/* Plan 1: ₹149 Career Accelerator Suite (PRE-SELECTED / BEST VALUE) */}
                  <div
                    onClick={() => setModalSelectedPlan('bundle')}
                    className={`p-4 sm:p-5 rounded-2xl cursor-pointer border-2 transition-all flex items-start justify-between gap-3 relative ${
                      modalSelectedPlan === 'bundle'
                        ? 'bg-[#0E161B] border-emerald-500 text-white shadow-xl shadow-emerald-500/15 ring-1 ring-emerald-500/40'
                        : 'bg-black/40 border-white/[0.1] text-[#86868B] hover:border-emerald-500/40'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'bundle' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'bundle' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-bold text-white text-sm sm:text-base">
                            Executive Career Accelerator Suite™ (Elite Edition)
                          </span>
                          <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-emerald-500/15 text-emerald-400 font-extrabold border border-emerald-500/30">
                            👑 RECOMMENDED BY 89% STUDENTS · BEST VALUE
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-emerald-400 font-semibold mb-1">
                          👑 The 6-Figure Placement Arsenal · Real-World Enterprise Advantage
                        </div>
                        <p className="text-xs text-emerald-200/90 leading-relaxed mb-2">
                          Includes <strong>all {selectedSubject.bundleItems.length} specialized engineering guides</strong> ({selectedSubject.bundlePages}): English, Hindi &amp; Gujarati Core Guides + {selectedSubject.hasCheatSheet ? <strong className="text-amber-300">FREE ₹22 8-Page Desk Cheat Sheet + </strong> : ''}Top MNC Interview Vault + Practical Labs/Templates + Career Salary Blueprint + 1-Click ZIP Download.
                        </p>
                        <div className="text-[11px] font-mono text-[#86868B]">
                          ✓ Personal Mentorship Email from Rahul Sir · 100% Lifetime Free Yearly Updates
                        </div>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹1,099</div>
                      <div className="text-lg sm:text-2xl font-black text-emerald-400">₹149</div>
                      <div className="text-[9px] font-mono text-emerald-300 font-bold">SAVE ₹950 · 86% OFF</div>
                    </div>
                  </div>

                  {/* Plan 2: ₹49 Single Core Notes */}
                  <div
                    onClick={() => setModalSelectedPlan('single')}
                    className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border transition-all flex items-start justify-between gap-3 ${
                      modalSelectedPlan === 'single'
                        ? 'bg-black border-white text-white shadow-lg ring-1 ring-white/20'
                        : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-white/20'
                    }`}
                  >
                    <div className="flex items-start gap-3">
                      <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${
                        modalSelectedPlan === 'single' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'
                      }`}>
                        {modalSelectedPlan === 'single' && <div className="w-2 h-2 rounded-full bg-black" />}
                      </div>
                      <div>
                        <div className="flex items-center gap-2 mb-0.5">
                          <span className="font-bold text-white text-sm sm:text-base">
                            Foundational Engineering Master Pass™
                          </span>
                          <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.06] text-[#86868B]">
                            {selectedSubject.pages}
                          </span>
                        </div>
                        <div className="text-[11px] font-mono text-zinc-400 font-semibold mb-1">
                          📘 The Essential Technical Blueprint · 100% Concept Mastery &amp; Academic Excellence
                        </div>
                        <p className="text-xs text-[#86868B] leading-relaxed">
                          Complete {selectedSubject.pages} Theory Handbook PDF in your chosen language with verified silicon concepts, vector schematics, and practice MCQs. (Does NOT include the MNC Interview Vault, Practical Labs, or Salary Blueprint).
                        </p>
                      </div>
                    </div>
                    <div className="text-right shrink-0">
                      <div className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">₹199</div>
                      <div className="text-lg sm:text-xl font-black text-white">₹49</div>
                      <div className="text-[9px] font-mono text-zinc-400">SAVE 75%</div>
                    </div>
                  </div>
                </div>
              )}

              {/* Sneak Peek Tabs */}
              <div className="mb-5">
                <div className="text-[11px] font-mono text-center text-[#86868B] mb-2 uppercase">
                  Sneak Peek: What's inside the ₹149 Career Package?
                </div>
                <div className="flex items-center justify-center gap-1 mb-2.5 bg-black/60 p-1 rounded-full border border-white/[0.08] max-w-lg mx-auto overflow-x-auto">
                  {[
                    { id: 'interview', label: 'MNC Interview Vault' },
                    { id: 'labs', label: 'Labs & Prompts' },
                    { id: 'salary', label: 'Salary & Roadmap' },
                    { id: 'mentorship', label: 'Rahul Sir Support' },
                  ].map((t) => (
                    <button
                      key={t.id}
                      onClick={() => setUpsellTab(t.id)}
                      className={`flex-1 py-1 px-2 rounded-full text-[11px] sm:text-xs font-semibold transition-all whitespace-nowrap ${
                        upsellTab === t.id
                          ? 'bg-emerald-500 text-black font-bold shadow'
                          : 'text-[#86868B] hover:text-white'
                      }`}
                    >
                      {t.label}
                    </button>
                  ))}
                </div>

                {/* Preview Content Area */}
                <div className="p-3.5 sm:p-4 rounded-xl sm:rounded-2xl bg-black border border-white/[0.08] min-h-[120px] text-xs">
                  {upsellTab === 'interview' && (
                    <div className="space-y-1.5 animate-fadeIn">
                      <div className="font-mono text-emerald-400 font-bold text-[11px]">
                        🏢 Real Scenario MNC Technical Interview Questions:
                      </div>
                      <p className="text-white font-medium text-xs">
                        "How do you isolate production bottlenecks, optimize enterprise architectures, and explain trade-offs to senior interviewers?"
                      </p>
                      <div className="text-[#86868B] text-[11px] italic">
                        Includes senior model answers for TCS, Infosys, Cisco, Wipro, and global MNCs.
                      </div>
                    </div>
                  )}

                  {upsellTab === 'labs' && (
                    <div className="space-y-1.5 animate-fadeIn font-mono">
                      <div className="text-cyan-400 font-bold text-[11px]">
                        🧪 Enterprise Labs, Templates &amp; Prompt Engineering:
                      </div>
                      <p className="text-emerald-400 text-xs">
                        Production-grade worksheets, Packet Tracer files, Advanced Excel formulas (XLOOKUP / Dynamic Arrays), and 100 enterprise AI prompts.
                      </p>
                    </div>
                  )}

                  {upsellTab === 'salary' && (
                    <div className="space-y-2 animate-fadeIn">
                      <div className="flex items-center justify-between font-mono text-[11px]">
                        <span className="text-amber-400 font-bold">💼 2027 Salary Benchmarks &amp; Slabs:</span>
                        <span className="text-[#86868B]">India IT Hubs</span>
                      </div>
                      <div className="grid grid-cols-2 sm:grid-cols-4 gap-1.5 text-center text-[10px] font-mono">
                        <div className="p-2 rounded-xl bg-white/[0.04] border border-white/[0.06]">
                          <div className="text-[#86868B]">Fresher</div>
                          <div className="font-bold text-white text-xs mt-0.5">₹3.5L - ₹5L</div>
                        </div>
                        <div className="p-2 rounded-xl bg-white/[0.04] border border-white/[0.06]">
                          <div className="text-[#86868B]">Associate (1-2y)</div>
                          <div className="font-bold text-white text-xs mt-0.5">₹5.5L - ₹8.5L</div>
                        </div>
                        <div className="p-2 rounded-xl bg-white/[0.04] border border-white/[0.06]">
                          <div className="text-[#86868B]">Senior (3-5y)</div>
                          <div className="font-bold text-white text-xs mt-0.5">₹9L - ₹15L</div>
                        </div>
                        <div className="p-2 rounded-xl bg-white/[0.04] border border-white/[0.06]">
                          <div className="text-emerald-400 font-bold">Lead / Staff</div>
                          <div className="font-bold text-emerald-400 text-xs mt-0.5">₹18L - ₹30L+</div>
                        </div>
                      </div>
                    </div>
                  )}

                  {upsellTab === 'mentorship' && (
                    <div className="space-y-1.5 animate-fadeIn">
                      <div className="font-mono text-purple-400 font-bold text-[11px]">
                        👨‍🏫 Direct Mentorship with Founder Rahul Sir:
                      </div>
                      <p className="text-white text-xs leading-relaxed">
                        Have questions about your resume, career roadmap, or technical doubts? Every student who purchases the ₹149 Career Suite gets direct email support with Rahul Sir (`rahul.28e1@gmail.com`) and free future PDF updates for life.
                      </p>
                    </div>
                  )}
                </div>
              </div>

              {/* Dynamic Action Button */}
              <div className="space-y-2.5">
                <button
                  onClick={proceedToCheckoutWithSelectedPlan}
                  className={`w-full py-3.5 sm:py-4 rounded-xl sm:rounded-full font-black text-sm sm:text-base transition-all shadow-xl flex items-center justify-center gap-2 active:scale-98 cursor-pointer ${
                    modalSelectedPlan === 'cheatsheet'
                      ? 'bg-amber-400 hover:bg-amber-300 text-black shadow-sm font-bold'
                      : modalSelectedPlan === 'bundle'
                      ? 'bg-emerald-500 hover:bg-emerald-400 text-black shadow-sm font-bold'
                      : 'bg-white hover:bg-zinc-200 text-black shadow-sm font-bold'
                  }`}
                >
                  {modalSelectedPlan === 'cheatsheet' ? (
                    <>
                      <span>Proceed with ₹22 Quick Desk Reference (8-Page PDF)</span>
                      <span>→</span>
                    </>
                  ) : modalSelectedPlan === 'bundle' ? (
                    <>
                      <span>Proceed with ₹149 Career Accelerator Suite (All Files + ZIP)</span>
                      <span>→</span>
                    </>
                  ) : (
                    <>
                      <span>Proceed with ₹49 Core Master Pass Only</span>
                      <span>→</span>
                    </>
                  )}
                </button>
                <p className="text-[10px] sm:text-[11px] text-center text-[#86868B]">
                  🔒 Instant Download Access on Payment · 100% Secure Razorpay Verification
                </p>
              </div>

            </div>
          </div>
        )}

        {/* ── INSTANT CHECKOUT / ACCESS MODAL (LANGUAGE SELECTION & AUTOMATED LEAD CAPTURE) ── */}
        {isCheckoutOpen && (
          <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-4 bg-black/95 backdrop-blur-xl animate-fadeIn">
            <div
              className="relative w-full max-w-xl rounded-t-3xl sm:rounded-3xl bg-zinc-950 border border-white/[0.18] p-5 sm:p-7 shadow-2xl max-h-[92vh] sm:max-h-[90vh] overflow-y-auto"
              style={{ backgroundColor: '#0e0e13' }}
            >
              <button
                type="button"
                onClick={() => setIsCheckoutOpen(false)}
                aria-label="Close checkout modal"
                className="absolute top-4 right-4 text-[#86868B] hover:text-white p-1.5 rounded-full bg-white/[0.06] cursor-pointer"
              >
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>

              {/* ── CONDITIONAL MODAL BODY: VICTORY & GIANT DOWNLOAD VS CHECKOUT FORM ── */}
              {paymentVerified ? (
                <div className="space-y-4 py-2 animate-fadeIn">
                  {/* Top Celebratory Header */}
                  <div className="text-center">
                    <div className="w-14 h-14 rounded-full bg-emerald-500/20 border-2 border-emerald-400 text-emerald-400 flex items-center justify-center text-2xl mx-auto mb-2.5 shadow-xl shadow-emerald-500/30">
                      ✓
                    </div>
                    <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-500/15 border border-emerald-500/30 text-emerald-300 text-xs font-mono font-bold mb-2">
                      <span>🎉 PAYMENT VERIFIED · ₹{checkoutItem.price} RECEIVED</span>
                    </div>
                    <h3 className="text-xl sm:text-2xl font-black text-white tracking-tight">
                      Congratulations {studentName || 'Student'}!
                    </h3>
                    <p className="text-xs text-[#A1A1A6] mt-0.5 max-w-md mx-auto">
                      Official access unlocked for <strong className="text-white">{selectedSubject.title}</strong> ({checkoutItem.plan === 'bundle' ? 'Executive Career Suite' : 'Core Master Pass'}).
                    </p>
                  </div>

                  {/* ── BADA DOWNLOAD BUTTON (GIANT HIGH-VISIBILITY BUTTON) ── */}
                  <div className="p-4 sm:p-5 rounded-2xl bg-gradient-to-b from-[#13281e] via-[#0d1c15] to-[#0a120e] border-2 border-emerald-400 shadow-2xl shadow-emerald-950 text-center space-y-2.5">
                    <div className="text-[11px] font-mono text-emerald-300 font-bold uppercase tracking-wider flex items-center justify-center gap-1.5">
                      <span className="w-2 h-2 rounded-full bg-emerald-400 animate-ping" />
                      <span>Instant Offline Download Access</span>
                    </div>

                    <a
                      href={
                        checkoutItem.plan === 'cheatsheet'
                          ? (selectedLanguage === 'gu' ? (selectedSubject.cheatSheetPdfGu || selectedSubject.cheatSheetPdfHi) : (selectedLanguage === 'hi' ? selectedSubject.cheatSheetPdfHi : (selectedSubject.cheatSheetPdfEn || selectedSubject.cheatSheetPdfHi)))
                          : (checkoutItem.plan === 'bundle' && selectedSubject.bundleZip ? selectedSubject.bundleZip : (selectedLanguage === 'gu' && selectedSubject.fullPdfGu ? selectedSubject.fullPdfGu : (selectedLanguage === 'hi' ? selectedSubject.fullPdfHi : selectedSubject.fullPdfEn)))
                      }
                      download
                      className="w-full py-4 sm:py-5 px-6 rounded-2xl bg-gradient-to-r from-emerald-400 via-teal-300 to-emerald-400 hover:brightness-110 text-black text-base sm:text-xl font-black tracking-tight text-center shadow-2xl shadow-emerald-500/50 transform hover:scale-[1.01] active:scale-[0.98] transition-all flex items-center justify-center gap-3 border-2 border-white/60 cursor-pointer block"
                    >
                      <span className="text-2xl sm:text-3xl">📥</span>
                      <span className="uppercase">{checkoutItem.plan === 'cheatsheet' ? 'DOWNLOAD CHEAT SHEET' : 'DOWNLOAD NOTES NOW'}</span>
                      <span className="text-[11px] font-mono bg-black text-emerald-400 px-2.5 py-0.5 rounded-full font-bold">
                        {checkoutItem.plan === 'cheatsheet' ? '8-PAGE PDF' : (checkoutItem.plan === 'bundle' ? 'ZIP BUNDLE' : 'MASTER PDF')}
                      </span>
                    </a>

                    <p className="text-[11px] text-emerald-200/90 font-mono">
                      {checkoutItem.plan === 'cheatsheet'
                        ? `⚡ ${selectedSubject.title} Quick Desk Reference (${selectedLanguage === 'gu' ? 'ગુજરાતી' : (selectedLanguage === 'hi' ? 'Hindi' : 'English')} Edition · 8 Pages Desk Companion)`
                        : checkoutItem.plan === 'bundle'
                        ? `📦 Complete Master Bundle (.ZIP · ${selectedSubject.bundleZipSize}) — All Theory Guides + Interview Vaults + Labs`
                        : `⚡ Core Master Guide (${selectedLanguage === 'gu' ? 'ગુજરાતી' : (selectedLanguage === 'hi' ? 'Hindi' : 'English')} Edition · ${selectedSubject.pages})`}
                    </p>
                  </div>

                  {/* Secondary Individual Downloads */}
                  <div className="p-3.5 rounded-2xl bg-black/60 border border-white/[0.08] space-y-2">
                    <div className="text-[10px] font-mono text-[#86868B] uppercase font-semibold flex items-center justify-between">
                      <span>{checkoutItem.plan === 'bundle' ? 'Download All Individual Files:' : 'Your Purchased Edition (Direct Offline File):'}</span>
                      <span className="text-emerald-400 font-bold">Lifetime Free Access</span>
                    </div>

                    <div className={checkoutItem.plan === 'bundle' ? "grid grid-cols-1 sm:grid-cols-3 gap-2" : "grid grid-cols-1 gap-2"}>
                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'gu') && (
                        <a
                          href={checkoutItem.plan === 'cheatsheet' ? (selectedSubject.cheatSheetPdfGu || selectedSubject.cheatSheetPdfHi) : selectedSubject.fullPdfGu}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🦁</span>
                            <span className="truncate">ગુજરાતી આવૃત્તિ ({checkoutItem.plan === 'cheatsheet' ? '8 Pages Desk Sheet' : selectedSubject.pages})</span>
                          </span>
                          <span className="text-amber-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}

                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'hi') && (
                        <a
                          href={checkoutItem.plan === 'cheatsheet' ? selectedSubject.cheatSheetPdfHi : selectedSubject.fullPdfHi}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🇮🇳</span>
                            <span className="truncate">Hindi Edition ({checkoutItem.plan === 'cheatsheet' ? '8 Pages Desk Sheet' : selectedSubject.pages})</span>
                          </span>
                          <span className="text-emerald-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}

                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'en') && (
                        <a
                          href={checkoutItem.plan === 'cheatsheet' ? (selectedSubject.cheatSheetPdfEn || selectedSubject.cheatSheetPdfHi) : selectedSubject.fullPdfEn}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🇬🇧</span>
                            <span className="truncate">English Edition ({checkoutItem.plan === 'cheatsheet' ? '8 Pages Desk Sheet' : selectedSubject.pages})</span>
                          </span>
                          <span className="text-emerald-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}
                    </div>

                    {checkoutItem.plan === 'bundle' && (
                      <div className="pt-2 border-t border-white/[0.06]">
                        <div className="text-[10px] font-mono text-emerald-400 mb-1.5 font-bold">
                          Career Accelerators Included in your Suite:
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-1.5 text-[10px] font-mono">
                          {selectedSubject.bundleItems.filter(item => item.file !== selectedSubject.bundleZip?.replace('/downloads/', '')).map((item, idx) => (
                            <a
                              key={idx}
                              href={`/downloads/${item.file}`}
                              download
                              className="p-2 rounded-lg bg-white/[0.02] hover:bg-white/[0.06] border border-white/[0.06] text-[#D2D2D7] hover:text-white flex items-center justify-between truncate transition-all"
                            >
                              <span className="truncate">{item.name}</span>
                              <span className="text-emerald-400 shrink-0 ml-1 font-bold">↓</span>
                            </a>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>

                  {/* Email & Mentorship Info */}
                  <div className="p-3.5 rounded-2xl bg-white/[0.03] border border-white/[0.08] text-xs space-y-1.5">
                    <div className="flex items-center gap-2 text-emerald-400 font-mono font-semibold text-[11px]">
                      <span>📧</span>
                      <span>Receipt &amp; backup links sent to:</span>
                      <strong className="text-white">{studentEmail}</strong>
                    </div>
                    <p className="text-[10px] text-[#86868B] leading-relaxed">
                      Payment ID: <strong className="text-emerald-300 font-mono">{verifiedPaymentId}</strong>. If email takes a minute or lands in Spam, don't worry — your notes can be downloaded directly from the big button above anytime!
                    </p>
                    <div className="pt-1.5 border-t border-white/[0.06] text-[10px] font-mono text-purple-300">
                      👨‍🏫 <strong>Rahul Sir Mentorship:</strong> Email <strong className="text-white">rahul.28e1@gmail.com</strong> with your Payment ID for resume reviews and career guidance.
                    </div>
                  </div>

                  {/* Done / Close Button */}
                  <button
                    type="button"
                    onClick={() => {
                      setIsCheckoutOpen(false);
                      setPaymentVerified(false);
                    }}
                    className="w-full py-2.5 rounded-xl bg-white/[0.06] hover:bg-white/[0.12] text-[#A1A1A6] hover:text-white font-mono text-xs font-semibold transition-all text-center cursor-pointer"
                  >
                    Done / Close Window
                  </button>
                </div>
              ) : (
                <>
                  <div className="text-center mb-4">
                    <div className="text-xs font-mono text-emerald-400 uppercase font-bold mb-1">
                      Instant Access &amp; Delivery · 2027 Edition
                    </div>
                    <h3 className="text-lg sm:text-2xl font-black text-white px-2">
                      {checkoutItem.title}
                    </h3>
                    <div className="text-2xl sm:text-3xl font-black text-white mt-1 flex items-baseline justify-center gap-2">
                      <span className="text-base font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                        {checkoutItem.price === 149 ? '₹1,099' : (checkoutItem.price === 22 ? '₹99' : '₹199')}
                      </span>
                      <span>₹{checkoutItem.price}</span>
                      <span className="text-xs font-normal text-[#86868B] font-mono">one-time access</span>
                    </div>
                  </div>

                  {/* ── STEP 1: SELECT LANGUAGE FOR MAIN DIGITAL NOTEBOOK ── */}
                  <div className="mb-4 p-3.5 rounded-2xl bg-black border border-white/[0.08]">
                    <div className="text-[11px] font-mono text-emerald-400 font-bold uppercase mb-2 flex items-center justify-between">
                      <span>Step 1: Choose Primary Language</span>
                      <span className="text-[#86868B] text-[10px]">Required</span>
                    </div>

                    <div className="grid grid-cols-3 gap-2 mb-2">
                      <button
                        type="button"
                        onClick={() => setSelectedLanguage('en')}
                        className={`p-2 sm:p-2.5 rounded-xl border text-left transition-all flex flex-col justify-between ${
                          selectedLanguage === 'en'
                            ? 'bg-emerald-500/15 border-emerald-400 text-white ring-1 ring-emerald-500/40 shadow-sm shadow-emerald-500/20'
                            : 'bg-white/[0.03] border-white/10 text-[#86868B] hover:border-white/20'
                        }`}
                      >
                        <div className="flex items-center justify-between font-bold text-[11px] sm:text-xs text-white">
                          <span>🇬🇧 English</span>
                          {selectedLanguage === 'en' && <span className="text-emerald-400 text-[10px] font-bold">✓</span>}
                        </div>
                        <div className="text-[9px] sm:text-[10px] font-mono text-[#86868B] mt-1 truncate">
                          Global Standard
                        </div>
                      </button>

                      <button
                        type="button"
                        onClick={() => setSelectedLanguage('hi')}
                        className={`p-2 sm:p-2.5 rounded-xl border text-left transition-all flex flex-col justify-between ${
                          selectedLanguage === 'hi'
                            ? 'bg-cyan-500/15 border-cyan-400 text-white ring-1 ring-cyan-500/40 shadow-sm shadow-cyan-500/20'
                            : 'bg-white/[0.03] border-white/10 text-[#86868B] hover:border-white/20'
                        }`}
                      >
                        <div className="flex items-center justify-between font-bold text-[11px] sm:text-xs text-white">
                          <span>🇮🇳 Hindi</span>
                          {selectedLanguage === 'hi' && <span className="text-cyan-400 text-[10px] font-bold">✓</span>}
                        </div>
                        <div className="text-[9px] sm:text-[10px] font-mono text-[#86868B] mt-1 truncate">
                          Complete Hindi
                        </div>
                      </button>

                      <button
                        type="button"
                        onClick={() => setSelectedLanguage('gu')}
                        className={`p-2 sm:p-2.5 rounded-xl border text-left transition-all flex flex-col justify-between ${
                          selectedLanguage === 'gu'
                            ? 'bg-amber-500/15 border-amber-400 text-white ring-1 ring-amber-500/40 shadow-sm shadow-amber-500/20'
                            : 'bg-white/[0.03] border-white/10 text-[#86868B] hover:border-white/20'
                        }`}
                      >
                        <div className="flex items-center justify-between font-bold text-[11px] sm:text-xs text-white">
                          <span>🦁 ગુજરાતી</span>
                          {selectedLanguage === 'gu' && <span className="text-amber-400 text-[10px] font-bold">✓</span>}
                        </div>
                        <div className="text-[9px] sm:text-[10px] font-mono text-[#86868B] mt-1 truncate">
                          ગુજરાતી આવૃત્તિ
                        </div>
                      </button>
                    </div>

                    <div className="p-2 sm:p-2.5 rounded-xl bg-white/[0.02] border border-white/[0.06] text-[10px] text-[#A1A1A6] leading-relaxed space-y-1">
                      <div>
                        📌 <strong>Language Policy:</strong> Core Theory Handbooks are delivered in your chosen language (English, Hindi, or Gujarati). In the ₹149 Suite, you get Core Guides in <strong>all 3 languages</strong>.
                      </div>
                      <div className="text-[#86868B]">
                        💼 MNC Placement Interview Vaults &amp; Salary Blueprints are intentionally provided in <strong>Professional English Standard</strong> to ensure real-world corporate interview readiness.
                      </div>
                    </div>
                  </div>

                  {/* ── STEP 2: STUDENT DETAILS & SECURE RAZORPAY PAYMENT ── */}
                  <form onSubmit={handleInitiatePayment} className="space-y-3 mb-4 p-4 rounded-2xl bg-black border border-white/[0.12] shadow-xl">
                    <div className="text-[11px] font-mono text-emerald-400 font-bold uppercase mb-1 flex items-center justify-between">
                      <span>Step 2: Enter Student Details</span>
                      <span className="text-[#86868B] text-[10px]">Instant Delivery</span>
                    </div>
                    <div className="space-y-2">
                      <input
                        type="text"
                        placeholder="Your Full Name (e.g. Rahul Sharma)"
                        value={studentName}
                        onChange={(e) => setStudentName(e.target.value)}
                        className="w-full px-3.5 py-2.5 rounded-xl bg-white/[0.05] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono"
                        required
                      />
                      <input
                        type="email"
                        placeholder="Your Email Address (For official receipt & downloads)"
                        value={studentEmail}
                        onChange={(e) => setStudentEmail(e.target.value)}
                        className="w-full px-3.5 py-2.5 rounded-xl bg-white/[0.05] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono"
                        required
                      />
                      <input
                        type="tel"
                        placeholder="WhatsApp Mobile Number (Optional - for payment backup)"
                        value={studentPhone}
                        onChange={(e) => setStudentPhone(e.target.value)}
                        className="w-full px-3.5 py-2.5 rounded-xl bg-white/[0.05] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono"
                      />
                    </div>

                    {paymentError && (
                      <div className="p-3 rounded-xl bg-red-500/10 border border-red-500/30 text-[11px] text-red-400 font-mono leading-relaxed space-y-1.5">
                        <div>⚠️ {paymentError}</div>
                        <div className="pt-1 border-t border-red-500/20 text-[10px]">
                          Need immediate help?{' '}
                          <a
                            href="https://wa.me/917646892094?text=Hi%20Rahul%20Sir%2C%20I%20am%20facing%20a%20payment%2Fcheckout%20issue%20on%20RTechLab."
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-emerald-400 hover:text-emerald-300 font-bold underline"
                          >
                            Chat on WhatsApp Helpline (+91 76468 92094) ↗
                          </a>
                        </div>
                      </div>
                    )}

                    <button
                      type="submit"
                      disabled={isPaymentProcessing}
                      className="w-full py-3 rounded-xl bg-white hover:bg-zinc-200 text-black font-bold text-xs sm:text-sm transition-colors flex items-center justify-center gap-2 active:scale-95 cursor-pointer shadow-sm"
                    >
                      {isPaymentProcessing ? (
                        <>
                          <span className="w-4 h-4 border-2 border-black border-t-transparent rounded-full animate-spin" />
                          <span>Connecting Razorpay Gateway...</span>
                        </>
                      ) : (
                        <>
                          <span>🔒 Pay ₹{checkoutItem.price} &amp; Unlock Instant Downloads</span>
                          <span>→</span>
                        </>
                      )}
                    </button>

                    {/* Payment Badges */}
                    <div className="pt-2 text-center">
                      <div className="text-[10px] font-mono text-[#86868B] mb-1.5 flex items-center justify-center gap-1">
                        <span>Supported 1-Click Payments:</span>
                      </div>
                      <div className="flex flex-wrap items-center justify-center gap-1.5 text-[10px] font-mono text-white/70">
                        <span className="px-2 py-0.5 rounded bg-white/[0.06] border border-white/10">Google Pay</span>
                        <span className="px-2 py-0.5 rounded bg-white/[0.06] border border-white/10">PhonePe</span>
                        <span className="px-2 py-0.5 rounded bg-white/[0.06] border border-white/10">Paytm</span>
                        <span className="px-2 py-0.5 rounded bg-white/[0.06] border border-white/10">UPI QR</span>
                        <span className="px-2 py-0.5 rounded bg-white/[0.06] border border-white/10">Cards / NetBanking</span>
                      </div>
                      <p className="text-[10px] text-white/40 mt-2 font-mono">
                        🔒 256-Bit SSL Encrypted · Instant Automatic Verification · Zero Waiting Time
                      </p>
                    </div>
                  </form>

                  <div className="p-3.5 rounded-2xl bg-white/[0.03] border border-white/[0.06] text-center">
                    <div className="text-xs font-mono text-[#86868B] flex items-center justify-center gap-1.5">
                      <span>🔒</span>
                      <span>Full Master PDFs &amp; Bundles are securely locked. Complete Step 2 above to unlock instant access.</span>
                    </div>
                  </div>
                </>
              )}
            </div>
          </div>
        )}

        {/* 22rs Promo Reel Video Modal */}
        {showReelModal && (
          <div
            className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn"
            onClick={() => setShowReelModal(false)}
          >
            <div
              className="relative max-w-sm w-full rounded-3xl bg-[#111216] border border-white/15 p-4 shadow-2xl"
              onClick={(e) => e.stopPropagation()}
            >
              <div className="flex items-center justify-between mb-3">
                <div>
                  <h4 className="text-sm font-bold text-white">Why ₹22 Desk Cheat Sheets?</h4>
                  <p className="text-[11px] font-mono text-cyan-400">All 8 Subjects · EN / HI / GU · 55s Reel</p>
                </div>
                <button
                  type="button"
                  onClick={() => setShowReelModal(false)}
                  className="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 text-white flex items-center justify-center text-sm font-bold cursor-pointer"
                >
                  ✕
                </button>
              </div>
              <div className="rounded-2xl overflow-hidden border border-white/10 bg-black">
                <video
                  src="/videos/rtechlab-22rs-promo-reel.mp4"
                  controls
                  autoPlay
                  playsInline
                  className="w-full aspect-[9/16] max-h-[70vh] object-contain mx-auto"
                />
              </div>
              <div className="mt-3 flex items-center justify-between gap-2">
                <span className="text-[11px] font-mono text-zinc-400">1080×1920 Vertical Reel</span>
                <a
                  href="/videos/rtechlab-22rs-promo-reel.mp4"
                  download
                  className="px-3 py-1.5 rounded-full bg-white/10 hover:bg-white/20 text-white text-xs font-semibold transition-all"
                >
                  ⬇ Download MP4
                </a>
              </div>
            </div>
          </div>
        )}

        {/* Cover Page Preview Lightbox Modal */}
        {coverPreview && (
          <div
            className="fixed inset-0 z-50 bg-black/85 backdrop-blur-md flex items-center justify-center p-4 animate-fadeIn"
            onClick={() => setCoverPreview(null)}
          >
            <div
              className="relative max-w-md w-full rounded-3xl bg-[#111216] border border-white/15 p-4 shadow-2xl"
              onClick={(e) => e.stopPropagation()}
            >
              <div className="flex items-center justify-between mb-3">
                <div>
                  <h4 className="text-sm font-bold text-white">{coverPreview.title}</h4>
                  <p className="text-[11px] font-mono text-zinc-400">{coverPreview.subtitle}</p>
                </div>
                <button
                  type="button"
                  onClick={() => setCoverPreview(null)}
                  className="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 text-white flex items-center justify-center text-sm font-bold cursor-pointer"
                >
                  ✕
                </button>
              </div>
              <div className="rounded-2xl overflow-hidden border border-white/10 bg-black">
                <img
                  src={coverPreview.image}
                  alt={coverPreview.title}
                  className="w-full h-auto max-h-[75vh] object-contain mx-auto"
                />
              </div>
            </div>
          </div>
        )}

        {/* Floating Toast Notification Centered */}
        {toastMessage && (
          <div className="fixed bottom-6 left-1/2 -translate-x-1/2 z-50 px-5 py-3 rounded-2xl bg-zinc-950 border border-emerald-500/60 text-white text-xs font-mono shadow-2xl flex items-center gap-2.5 animate-fadeIn shadow-emerald-500/10 whitespace-nowrap">
            <span className="w-2.5 h-2.5 rounded-full bg-emerald-400 animate-pulse shrink-0" />
            <span>{toastMessage}</span>
          </div>
        )}

      </div>
    </div>
  );
}
