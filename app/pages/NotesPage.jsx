import React, { useState, useEffect } from 'react';
import { Link } from 'react-router';
import { WhatsAppCommunityCard } from '../components/WhatsAppCommunityCard';

// ── 4 OFFICIAL RTECHLAB SUBJECTS (EXACT SEQUENCE & REAL PAGE COUNTS) ────────
const SUBJECTS = [
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
    fullPdfEn: '/downloads/AI-Essentials-English-Edition-1.pdf',
    fullPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1.pdf',
    bundleZip: '/downloads/AI-Career-Accelerator-Bundle.zip',
    bundleZipSize: '6.4 MB',
    bundleItems: [
      { name: 'AI Essentials Core Master Guide (English)', pages: '44 Pages', file: 'AI-Essentials-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'AI Essentials Core Master Guide (Hindi)', pages: '44 Pages', file: 'AI-Essentials-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
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
    fullPdfEn: '/downloads/Office-365-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',
    bundleZip: '/downloads/Office-365-Career-Accelerator-Bundle.zip',
    bundleZipSize: '13.7 MB',
    bundleItems: [
      { name: 'Office 365 Enterprise Master Guide (English)', pages: '113 Pages', file: 'Office-365-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'Office 365 Enterprise Master Guide (Hindi)', pages: '113 Pages', file: 'Office-365-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'Top 100 Shortcuts & 50 MIS Interview Vault (English)', pages: '9 Pages', file: 'Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf', badge: 'Interview Vault' },
      { name: 'Top 100 Shortcuts & 50 MIS Interview Vault (Hindi)', pages: '9 Pages', file: 'Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf', badge: 'Hindi Vault' },
      { name: 'Practical Excel Templates & Formula Workbook', pages: '16 Pages', file: 'Office-365-Practical-Excel-Templates-Workbook-Guide.pdf', badge: 'Practical Labs' },
      { name: 'MIS Executive Career, Salary Blueprint & Roadmap', pages: '12 Pages', file: 'Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf', badge: 'Salary Blueprint' },
      { name: '1-Click Master ZIP Offline Bundle', pages: 'All 6 PDFs', file: 'Office-365-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
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
    fullPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',
    bundleZip: '/downloads/RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip',
    bundleZipSize: '30 MB',
    bundleItems: [
      { name: 'Computer Fundamentals Core Master Guide (English)', pages: '45 Pages', file: 'Computer-Fundamentals-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'Computer Fundamentals Core Master Guide (Hindi)', pages: '45 Pages', file: 'Computer-Fundamentals-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
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
    fullPdfEn: '/downloads/CCNA-200-301-English-Edition-1.pdf',
    fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',
    bundleZip: '/downloads/RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip',
    bundleZipSize: '19.8 MB',
    bundleItems: [
      { name: 'Cisco CCNA 200-301 Master Guide (English)', pages: '49 Pages', file: 'CCNA-200-301-English-Edition-1.pdf', badge: 'Master Guide' },
      { name: 'Cisco CCNA 200-301 Master Guide (Hindi)', pages: '49 Pages', file: 'CCNA-200-301-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
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
];

const getPreviewImage = (subjectId, lang, page) => {
  const asset = PREVIEW_ASSETS[subjectId] || PREVIEW_ASSETS.ai;
  if (lang === 'hi' && asset.hi) {
    return asset.hi[page - 1] || asset.hi[0];
  }
  const enPages = asset.en || PREVIEW_ASSETS.ai.en;
  return enPages[page - 1] || enPages[0];
};

const getPageLabel = (subjectId, lang, page) => {
  const asset = PREVIEW_ASSETS[subjectId] || PREVIEW_ASSETS.ai;
  if (lang === 'hi' && asset.labelsHi) {
    return asset.labelsHi[page - 1] || `पेज ${page} of 5`;
  }
  const labels = asset.labelsEn || PREVIEW_ASSETS.ai.labelsEn;
  return labels[page - 1] || `Page ${page} of 5`;
};

export default function NotesPage() {
  // Active selected subject (Default: AI Essentials 1st)
  const [selectedSubject, setSelectedSubject] = useState(SUBJECTS[0]);
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
    setCheckoutItem({
      title: `${sub.title} (${plan === 'bundle' ? 'Complete Career Accelerator Suite' : 'Core Master Pass'})`,
      plan: plan,
      price: plan === 'bundle' ? 149 : 49,
    });
    setIsCheckoutOpen(true);
  };

  // Proceed from Package Modal to Razorpay Checkout Modal
  const proceedToCheckoutWithSelectedPlan = () => {
    setCheckoutItem({
      title: `${selectedSubject.title} (${modalSelectedPlan === 'bundle' ? 'Complete Career Accelerator Suite' : 'Core Master Pass'})`,
      plan: modalSelectedPlan,
      price: modalSelectedPlan === 'bundle' ? 149 : 49,
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
          <div className="flex items-center gap-2 sm:gap-3">
            <Link
              to="/notes/print"
              target="_blank"
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-white/[0.06] hover:bg-white/[0.12] border border-white/[0.1] text-xs font-semibold text-white transition-all"
            >
              <svg className="w-3.5 h-3.5 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
              </svg>
              <span>A4 Print View</span>
            </Link>
            <Link
              to="/notes/tools"
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-white/[0.06] hover:bg-white/[0.12] border border-white/[0.1] text-xs font-semibold text-white transition-all"
            >
              <svg className="w-3.5 h-3.5 text-cyan-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v1m6 11h2m-6 0h-2v4m0-11v3m0 0h.01M12 12h4.01M16 20h4M4 12h4m12 0h.01M5 8h2a1 1 0 001-1V5a1 1 0 00-1-1H5a1 1 0 00-1 1v2a1 1 0 001 1zm14 0h2a1 1 0 001-1V5a1 1 0 00-1-1h-2a1 1 0 00-1 1v2a1 1 0 001 1zM5 20h2a1 1 0 001-1v-2a1 1 0 00-1-1H5a1 1 0 00-1 1v2a1 1 0 001 1z" />
              </svg>
              <span>Chapter Tools + QR</span>
            </Link>
          </div>
        </div>

        {/* ── Page Header ────────────────────────────────────────────── */}
        <div className="text-center max-w-4xl mx-auto mb-10 sm:mb-14">
          <div className="inline-flex items-center justify-center gap-2 px-3.5 py-1.5 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-[11px] sm:text-xs font-mono text-emerald-400 mb-4 backdrop-blur-md shadow-lg shadow-emerald-500/5 max-w-full">
            <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse shrink-0" />
            <span className="truncate">⚡ 2027 OFFICIAL INDUSTRIAL EDITIONS · TRANSPARENT PRICING · NO SUBSCRIPTIONS</span>
          </div>
          <h1 className="text-3xl sm:text-5xl lg:text-6xl font-black text-white tracking-tight mb-3 sm:mb-4 leading-tight">
            Industrial Master Digital Notes
          </h1>
          <p className="text-[#86868B] text-xs sm:text-base max-w-2xl mx-auto leading-relaxed mb-6">
            Comprehensive, research-verified engineering handbooks designed for modern IT professionals, college students, and placement aspirants. Start with the core theory handbook at just <strong className="text-white">₹49</strong>, or unlock the complete <strong className="text-emerald-400">₹149 Career Accelerator Suite</strong> (+MNC Interview Vault, Practical Labs &amp; Salary Blueprint).
          </p>

          {/* Value Badges Centered */}
          <div className="flex flex-wrap items-center justify-center gap-2 text-[11px] sm:text-xs font-mono">
            <span className="px-3 py-1 rounded-full bg-white/[0.05] border border-white/10 text-white font-semibold">
              ✅ Core Master Pass @ ₹49 (Bilingual Theory Guide)
            </span>
            <span className="px-3 py-1 rounded-full bg-emerald-500/15 border border-emerald-500/30 text-emerald-300 font-bold">
              🔥 Career Accelerator Suite @ ₹149 (Complete Interview Vault + Labs + Blueprint)
            </span>
            <span className="px-3 py-1 rounded-full bg-cyan-500/10 border border-cyan-500/20 text-cyan-300">
              ⚡ Instant 1-Click Offline ZIP Downloads
            </span>
            <span className="px-3 py-1 rounded-full bg-purple-500/10 border border-purple-500/20 text-purple-300">
              📩 Rahul Sir Direct Mentorship &amp; Free Updates
            </span>
          </div>
        </div>

        {/* ── 4 MASTER SUBJECT CARDS IN EXACT USER SEQUENCE ──────────── */}
        <div className="mb-6">
          <div className="text-center max-w-2xl mx-auto mb-8 sm:mb-10">
            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-white/[0.04] border border-white/[0.08] text-[11px] font-mono text-[#86868B] mb-2.5">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400" />
              <span>4 Industry Placement Tracks Available</span>
            </div>
            <h2 className="text-2xl sm:text-4xl font-black text-white tracking-tight mb-2">
              Select Your Subject Notes
            </h2>
            <p className="text-xs sm:text-sm text-[#86868B] leading-relaxed mx-auto max-w-xl">
              Inspect syllabus topics, read real 5-page interactive previews, and choose between the ₹49 Core Pass or the ₹149 Executive Career Suite.
            </p>

            {/* Quick-Jump Navigation (Super handy on mobile) */}
            <div className="flex items-center justify-center gap-1.5 sm:gap-2 mt-4 flex-wrap">
              <span className="text-[11px] font-mono text-[#86868B] mr-1 hidden sm:inline">Quick Jump:</span>
              {SUBJECTS.map((s) => (
                <a
                  key={s.id}
                  href={`#${s.id}`}
                  className="px-3 py-1 rounded-full bg-white/[0.05] hover:bg-white/[0.1] border border-white/[0.08] text-[11px] font-semibold text-white/80 hover:text-white transition-all active:scale-95"
                >
                  {s.id === 'ai' ? '🤖 AI' : s.id === 'office-365' ? '📊 Office 365' : s.id === 'fundamentals' ? '💻 Fundamentals' : '🌐 CCNA'}
                </a>
              ))}
              <a
                href="#reviews"
                className="px-3 py-1 rounded-full bg-amber-500/10 hover:bg-amber-500/20 border border-amber-500/20 text-[11px] font-semibold text-amber-300 transition-all active:scale-95"
              >
                ⭐ Reviews (14)
              </a>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-5 mb-14">
            {SUBJECTS.map((sub, index) => (
              <div
                key={sub.id}
                id={sub.id}
                className="relative p-5 sm:p-6 rounded-2xl sm:rounded-3xl bg-[#0D0D10] border border-white/[0.08] hover:border-emerald-500/40 transition-all flex flex-col justify-between group shadow-xl hover:shadow-2xl hover:shadow-emerald-500/5 scroll-mt-24"
              >
                <div>
                  {/* Header Track Tag & Status Badges */}
                  <div className="flex items-center justify-between mb-3.5">
                    <span className="text-[10px] font-mono text-white/50 font-bold px-2 py-0.5 rounded bg-white/[0.04] border border-white/[0.06]">
                      TRACK #{index + 1}
                    </span>
                    <span className={`text-[10px] font-mono font-bold px-2.5 py-0.5 rounded-full border ${
                      sub.id === 'ai'
                        ? 'bg-purple-500/15 text-purple-300 border-purple-500/30'
                        : sub.id === 'office-365'
                        ? 'bg-blue-500/15 text-blue-300 border-blue-500/30'
                        : sub.id === 'fundamentals'
                        ? 'bg-emerald-500/15 text-emerald-300 border-emerald-500/30'
                        : 'bg-cyan-500/15 text-cyan-300 border-cyan-500/30'
                    }`}>
                      {sub.badge}
                    </span>
                  </div>

                  {/* Title & Description Middle Centered */}
                  <div className="text-center mb-3">
                    <h3 className="text-lg sm:text-xl font-bold text-white mb-1 group-hover:text-emerald-400 transition-colors leading-snug">
                      {sub.title}
                    </h3>
                    <div className="text-[11px] font-mono text-emerald-400 mb-1 font-semibold">
                      {sub.subtitle}
                    </div>
                    <div className="text-[10px] font-mono text-[#86868B] mb-2.5">
                      {sub.badgeSub}
                    </div>
                    <p className="text-xs text-[#86868B] leading-relaxed line-clamp-3">
                      {sub.desc}
                    </p>
                  </div>

                  {/* ── Verified Exact Pages Tag ── */}
                  <div className="p-2.5 rounded-xl bg-white/[0.03] border border-white/[0.06] mb-3 text-[10px] font-mono space-y-1">
                    <div className="flex items-center justify-between">
                      <span className="text-[#86868B]">Core Theory Guide:</span>
                      <strong className="text-white">{sub.pages}</strong>
                    </div>
                    <div className="flex items-center justify-between border-t border-white/[0.04] pt-1">
                      <span className="text-emerald-400 font-semibold">Executive Suite:</span>
                      <strong className="text-emerald-300 font-bold">{sub.bundlePages}</strong>
                    </div>
                  </div>

                  {/* ── TOPIC-WISE MODULES BOXES ── */}
                  <div className="space-y-1.5 mb-5 p-3 rounded-xl bg-black/60 border border-white/[0.06]">
                    <div className="text-[9px] font-mono text-white/50 uppercase tracking-widest font-semibold flex items-center justify-between">
                      <span>Key Curriculum</span>
                      <span className="text-emerald-400 font-bold">2027 Ready</span>
                    </div>
                    <div className="space-y-1">
                      {sub.topics.slice(0, 3).map((topic, i) => (
                        <div key={i} className="flex items-center gap-1.5 text-[10px] font-mono text-[#D2D2D7] truncate">
                          <span className="text-emerald-400 font-bold shrink-0">›</span>
                          <span className="truncate">{topic}</span>
                        </div>
                      ))}
                    </div>
                    <div className="text-[10px] font-mono text-emerald-400/90 pt-1 font-semibold flex items-center justify-between">
                      <span>+ {sub.topics.length - 3} more modules</span>
                      <button
                        type="button"
                        onClick={() => handleOpenPreviewModal(sub)}
                        className="hover:underline text-emerald-400 font-bold"
                      >
                        Preview 5p →
                      </button>
                    </div>
                  </div>
                </div>

                <div className="space-y-2.5 pt-3 border-t border-white/[0.06]">
                  {/* Price Tag with Highlighted Crosses & Rich Slogans */}
                  <div className="flex items-baseline justify-between p-2.5 rounded-xl bg-white/[0.02] border border-white/[0.05]">
                    <div>
                      <div className="text-[9px] font-mono text-[#86868B] uppercase tracking-wider font-semibold">
                        Core Master Pass
                      </div>
                      <div className="flex items-baseline gap-1.5 mt-0.5">
                        <span className="text-xl sm:text-2xl font-black text-white">₹49</span>
                        <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                          ₹199
                        </span>
                      </div>
                    </div>
                    <div className="text-right">
                      <div className="text-[9px] font-mono text-emerald-400 uppercase tracking-wider font-bold">
                        👑 Executive Suite
                      </div>
                      <div className="flex items-baseline justify-end gap-1.5 mt-0.5">
                        <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                          ₹1,099
                        </span>
                        <span className="text-xl sm:text-2xl font-black text-emerald-400">₹149</span>
                      </div>
                    </div>
                  </div>

                  {/* Two Action Buttons: Preview 5 Pages vs Buy */}
                  <div className="grid grid-cols-2 gap-2">
                    <button
                      type="button"
                      onClick={() => handleOpenPreviewModal(sub)}
                      className="py-2.5 rounded-xl bg-white/[0.08] hover:bg-white/[0.16] hover:text-white text-xs font-bold text-white transition-all text-center border border-white/10 active:scale-95 flex items-center justify-center gap-1 shadow-sm"
                    >
                      <span>Preview 5p</span>
                      <span>→</span>
                    </button>
                    <button
                      type="button"
                      onClick={() => handleOpenPurchaseModal(sub, 'bundle')}
                      className="py-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black text-xs font-black transition-all text-center shadow-lg shadow-emerald-500/20 active:scale-95"
                    >
                      Get Notes
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
        </div>

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
              <div className="p-6 sm:p-7 rounded-2xl bg-black/60 border border-white/[0.1] flex flex-col justify-between">
                <div>
                  <div className="flex items-center justify-between mb-4">
                    <span className="text-xs font-mono font-bold text-[#86868B] px-3 py-1 rounded-full bg-white/[0.05] border border-white/[0.08]">
                      OPTION 1: FOUNDATIONAL MASTER PASS™
                    </span>
                    <div className="flex items-baseline gap-1.5">
                      <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                        ₹199
                      </span>
                      <span className="text-2xl font-black text-white">₹49</span>
                      <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.08] text-emerald-400 font-bold border border-white/10">75% OFF</span>
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
              <div className="relative p-6 sm:p-7 rounded-2xl bg-[#0F161A] border-2 border-emerald-500 shadow-2xl shadow-emerald-500/10 flex flex-col justify-between">
                {/* Glow Badge */}
                <div className="absolute -top-3.5 right-6 px-3 py-1 rounded-full bg-emerald-500 text-black text-[11px] font-black font-mono shadow-md uppercase tracking-wide">
                  ★ RECOMMENDED BY 89% STUDENTS · BEST VALUE
                </div>

                <div>
                  <div className="flex items-center justify-between mb-4">
                    <span className="text-xs font-mono font-bold text-emerald-400 px-3 py-1 rounded-full bg-emerald-500/15 border border-emerald-500/30">
                      OPTION 2: EXECUTIVE CAREER ACCELERATOR SUITE™
                    </span>
                    <div className="flex items-baseline gap-1.5">
                      <span className="text-xs font-mono font-extrabold text-red-400 line-through decoration-red-500 decoration-2">
                        ₹1,099
                      </span>
                      <span className="text-2xl font-black text-emerald-400">₹149</span>
                      <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-emerald-500/20 text-emerald-300 font-bold border border-emerald-500/40">SAVE ₹950 · 86% OFF</span>
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
                    <div className="flex items-center gap-2 text-xs text-white">
                      <span className="text-emerald-400 font-bold shrink-0">✓</span>
                      <span><strong>Both English + Hindi Master Guides</strong> (No language lock)</span>
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
                  </div>

                  {/* Close button */}
                  <button
                    type="button"
                    onClick={() => setIsReaderModalOpen(false)}
                    className="p-1.5 rounded-full bg-white/10 hover:bg-white/20 text-white transition-all"
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
                      {previewLang === 'hi' ? 'पेज' : 'Page'} {isPageFlipping ? targetFlipPage : previewPage} / 5
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
                <div className="text-[11px] font-mono text-[#86868B] flex items-center gap-1.5">
                  <span className="text-emerald-400">⚡</span>
                  <span>Click page or press Arrow keys to turn pages</span>
                </div>

                <div className="flex items-center gap-2 w-full sm:w-auto justify-end">
                  <button
                    type="button"
                    onClick={() => {
                      setIsReaderModalOpen(false);
                      handleOpenPurchaseModal(selectedSubject, 'bundle');
                    }}
                    className="inline-flex items-center gap-1.5 px-4 sm:px-5 py-2 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-90 text-black text-xs sm:text-sm font-black transition-all shadow-lg shadow-emerald-500/30 active:scale-95 shrink-0"
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
                onClick={() => setIsUpsellOpen(false)}
                className="absolute top-4 right-4 text-[#86868B] hover:text-white p-1.5 rounded-full bg-white/[0.06]"
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
                  Choose between the standalone theory handbook at ₹49 or upgrade to the complete Career Accelerator Suite (+Interview Vault, Labs &amp; Salary Blueprint) for just +₹100 extra:
                </p>
              </div>

              {/* Two Selectable Options */}
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
                        Includes <strong>all {selectedSubject.bundleItems.length} specialized engineering guides</strong> ({selectedSubject.bundlePages}): Both English &amp; Hindi Core Guides + Top MNC Interview Vault + Practical Labs/Templates + Career Salary Blueprint + 1-Click ZIP Download.
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
                  className={`w-full py-3.5 sm:py-4 rounded-xl sm:rounded-full font-black text-sm sm:text-base transition-all shadow-xl flex items-center justify-center gap-2 active:scale-98 ${
                    modalSelectedPlan === 'bundle'
                      ? 'bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black shadow-emerald-500/30'
                      : 'bg-white hover:bg-zinc-200 text-black shadow-white/20'
                  }`}
                >
                  {modalSelectedPlan === 'bundle' ? (
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
                onClick={() => setIsCheckoutOpen(false)}
                className="absolute top-4 right-4 text-[#86868B] hover:text-white p-1.5 rounded-full bg-white/[0.06]"
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
                      href={checkoutItem.plan === 'bundle' && selectedSubject.bundleZip ? selectedSubject.bundleZip : (selectedLanguage === 'hi' ? selectedSubject.fullPdfHi : selectedSubject.fullPdfEn)}
                      download
                      className="w-full py-4 sm:py-5 px-6 rounded-2xl bg-gradient-to-r from-emerald-400 via-teal-300 to-emerald-400 hover:brightness-110 text-black text-base sm:text-xl font-black tracking-tight text-center shadow-2xl shadow-emerald-500/50 transform hover:scale-[1.01] active:scale-[0.98] transition-all flex items-center justify-center gap-3 border-2 border-white/60 cursor-pointer block"
                    >
                      <span className="text-2xl sm:text-3xl">📥</span>
                      <span className="uppercase">DOWNLOAD NOTES NOW</span>
                      <span className="text-[11px] font-mono bg-black text-emerald-400 px-2.5 py-0.5 rounded-full font-bold">
                        {checkoutItem.plan === 'bundle' ? 'ZIP BUNDLE' : 'MASTER PDF'}
                      </span>
                    </a>

                    <p className="text-[11px] text-emerald-200/90 font-mono">
                      {checkoutItem.plan === 'bundle'
                        ? `📦 Complete Master Bundle (.ZIP · ${selectedSubject.bundleZipSize}) — All Theory Guides + Interview Vaults + Labs`
                        : `⚡ Core Master Guide (${selectedLanguage === 'hi' ? 'Hindi' : 'English'} Edition · ${selectedSubject.pages})`}
                    </p>
                  </div>

                  {/* Secondary Individual Downloads */}
                  <div className="p-3.5 rounded-2xl bg-black/60 border border-white/[0.08] space-y-2">
                    <div className="text-[10px] font-mono text-[#86868B] uppercase font-semibold flex items-center justify-between">
                      <span>{checkoutItem.plan === 'bundle' ? 'Download All Individual Files:' : 'Your Purchased Edition (Direct Offline File):'}</span>
                      <span className="text-emerald-400 font-bold">Lifetime Free Access</span>
                    </div>

                    <div className={checkoutItem.plan === 'bundle' ? "grid grid-cols-2 gap-2" : "grid grid-cols-1 gap-2"}>
                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'hi') && (
                        <a
                          href={selectedSubject.fullPdfHi}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🇮🇳</span>
                            <span className="truncate">Hindi Master PDF ({selectedSubject.pages})</span>
                          </span>
                          <span className="text-emerald-400 font-mono text-[10px] shrink-0 font-bold">Direct Download ↓</span>
                        </a>
                      )}

                      {(checkoutItem.plan === 'bundle' || selectedLanguage === 'en') && (
                        <a
                          href={selectedSubject.fullPdfEn}
                          download
                          className="p-2.5 rounded-xl bg-white/[0.04] hover:bg-white/[0.08] border border-white/10 text-white flex items-center justify-between text-xs font-semibold group transition-all"
                        >
                          <span className="flex items-center gap-1.5 truncate">
                            <span>🇬🇧</span>
                            <span className="truncate">English Master PDF ({selectedSubject.pages})</span>
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
                          {selectedSubject.bundleItems.filter(item => !item.file.endsWith('.zip')).map((item, idx) => (
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
                        {checkoutItem.price === 149 ? '₹1,099' : '₹199'}
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

                    <div className="grid grid-cols-2 gap-2 mb-2">
                      <button
                        type="button"
                        onClick={() => setSelectedLanguage('en')}
                        className={`p-2.5 rounded-xl border text-left transition-all flex flex-col justify-between ${
                          selectedLanguage === 'en'
                            ? 'bg-emerald-500/15 border-emerald-400 text-white ring-1 ring-emerald-500/40 shadow-sm shadow-emerald-500/20'
                            : 'bg-white/[0.03] border-white/10 text-[#86868B] hover:border-white/20'
                        }`}
                      >
                        <div className="flex items-center justify-between font-bold text-xs text-white">
                          <span>🇬🇧 English Edition</span>
                          {selectedLanguage === 'en' && <span className="text-emerald-400 text-[10px] font-bold">✓ SELECTED</span>}
                        </div>
                        <div className="text-[10px] font-mono text-[#86868B] mt-1">
                          {selectedSubject.pages} · Global Standard
                        </div>
                      </button>

                      <button
                        type="button"
                        onClick={() => setSelectedLanguage('hi')}
                        className={`p-2.5 rounded-xl border text-left transition-all flex flex-col justify-between ${
                          selectedLanguage === 'hi'
                            ? 'bg-cyan-500/15 border-cyan-400 text-white ring-1 ring-cyan-500/40 shadow-sm shadow-cyan-500/20'
                            : 'bg-white/[0.03] border-white/10 text-[#86868B] hover:border-white/20'
                        }`}
                      >
                        <div className="flex items-center justify-between font-bold text-xs text-white">
                          <span>🇮🇳 Hindi Edition</span>
                          {selectedLanguage === 'hi' && <span className="text-cyan-400 text-[10px] font-bold">✓ SELECTED</span>}
                        </div>
                        <div className="text-[10px] font-mono text-[#86868B] mt-1">
                          {selectedSubject.pages} · Complete Hindi Edition
                        </div>
                      </button>
                    </div>

                    <p className="text-[10px] text-[#86868B] leading-relaxed">
                      💡 <em>In the ₹149 Career Accelerator Suite, you get BOTH English and Hindi editions included inside the 1-Click ZIP bundle!</em>
                    </p>
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
                      <div className="p-3 rounded-xl bg-red-500/10 border border-red-500/30 text-[11px] text-red-400 font-mono leading-relaxed">
                        ⚠️ {paymentError}
                      </div>
                    )}

                    <button
                      type="submit"
                      disabled={isPaymentProcessing}
                      className="w-full py-3 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-95 text-black font-black text-xs sm:text-sm transition-all shadow-lg shadow-emerald-500/25 flex items-center justify-center gap-2 active:scale-95 cursor-pointer"
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
