import React, { useState, useEffect } from 'react';
import { Link } from 'react-router';

// ── 8 OFFICIAL RTECHLAB SUBJECTS (2027 INDUSTRIAL EDITION) ─────────────────
// Each subject includes realistic page volume (100+ to 210+ pages), syllabus module topics, and contextual combo pairing
const SUBJECTS = [
  {
    id: 'fundamentals',
    category: 'systems',
    title: 'Computer Fundamentals',
    subtitle: 'Silicon Architecture, Memory Hierarchy & Placement Bank',
    desc: 'Silicon IPO cycle, RAM/ROM storage hierarchy, CPU machine cycle, and Top 50 MNC technical placement questions with senior model answers.',
    pages: '45 Pages',
    tag: 'Core Foundation · Edition 1',
    accent: 'emerald',
    badge: 'Edition 1',
    previewPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',
    relatedComboId: 'combo-it-support',
    pairingReason: 'Pair with Computer Hardware for complete physical computer architecture mastery.',
    topics: [
      'Ch 01-02: IPO Cycle, Modern I/O Ports & 5 Generations',
      'Ch 03-05: RAM/ROM Hierarchy, Cache L1-L3 & Logic Gates',
      'Ch 06-08: OS Architecture, Linux vs Windows & Security',
      'Ch 09: PC Assembly, ESD Safety & Diagnostic Tools',
      'Ch 10: Top 50 MNC Technical Interview Question Bank',
    ],
  },
  {
    id: 'hardware',
    category: 'systems',
    title: 'Computer Hardware & Architecture',
    subtitle: 'Desktop Support & Systems Engineering',
    desc: 'CPU sockets (LGA/PGA), DDR4/DDR5 high-speed bus, NVMe PCIe 5.0, Motherboard VRM phases, and PSU diagnostics.',
    pages: '130+ Pages',
    tag: 'Industrial Hardware',
    accent: 'blue',
    badge: 'Popular',
    previewPdfEn: '/downloads/RTechLab-Computer-Hardware-2027-5Page-Preview.pdf',
    fullPdfEn: '/downloads/RTechLab-Computer-Hardware-2027-Master-Edition.pdf',
    relatedComboId: 'combo-it-support',
    pairingReason: 'Industry roles require both Hardware + Networking for L1/L2 Desktop Support & Field Engineering.',
    topics: [
      'CPU Sockets (Intel LGA 1700 vs AMD AM5) & Gold Pin Triage',
      'Motherboard VRM Phases, MOSFETs, Chokes & Power Throttling',
      'High-Speed RAM Bus (DDR4 vs DDR5) & Daisy-Chain Slot Rules',
      'Storage Architecture: NVMe PCIe 5.0 M.2 vs SATA 3D NAND Flash',
      'Power Supply Units: 80 Plus Standards & 24-Pin Paperclip Test',
      'Graphics Cards: PCIe Gen 5 Lanes, GPU HDMI Cable Trap & Heatsinks',
    ],
  },
  {
    id: 'networking',
    category: 'networking',
    title: 'Computer Networking Fundamentals',
    subtitle: 'The OSI Model to Enterprise Routing',
    desc: 'TCP/IP vs OSI, IPv4 subnetting, NAT, DNS/DHCP flow, Ethernet cabling T568A/B, and packet switching mechanics.',
    pages: '160+ Pages',
    tag: 'Networking Core',
    accent: 'cyan',
    badge: 'Essential',
    relatedComboId: 'combo-network',
    pairingReason: 'Pair with CCNA Top Tier Notes to master enterprise Cisco routers, switches, and real TAC troubleshooting.',
    topics: [
      'OSI 7-Layer Architecture vs TCP/IP 4-Layer Protocol Stack',
      'IPv4 Subnetting Math: VLSM, CIDR Slash Notation & Broadcast Math',
      'Full Packet Lifecycle: DNS Resolution, ARP Triage & DHCP 4-Way DORA',
      'Network Address Translation (NAT): Static, Dynamic & PAT Overload',
      'Ethernet Physical Layer: Cat6 T568A/B Color Pinouts & Crimp Testing',
      'Enterprise Triage Tools: ICMP Ping, Traceroute & Wireshark Pcap Traces',
    ],
  },
  {
    id: 'ccna',
    category: 'networking',
    title: 'CCNA Enterprise — Top Tier Notes',
    subtitle: 'Cisco Routing, Switching & Wireless',
    desc: 'OSPF multi-area, VLAN trunking (802.1Q), Spanning Tree (STP), EtherChannel, ACLs, and Cisco IOS CLI commands.',
    pages: '210+ Pages',
    tag: 'Cisco TAC Standard',
    accent: 'blue',
    badge: 'Top Tier',
    relatedComboId: 'combo-network',
    pairingReason: 'Pair with Networking Fundamentals for bulletproof subnetting, packet headers, and OSI base foundation.',
    topics: [
      'Cisco IOS CLI Architecture, Exec Modes & Register 0x2102 Recovery',
      'VLANs, 802.1Q Trunking & Inter-VLAN Router-on-a-Stick (ROAS)',
      'Spanning Tree Protocol: STP 802.1D, RSTP 802.1w & Root Bridge Math',
      'OSPFv2 Multi-Area Routing: Link-State LSAs, DR/BDR & Cost Formula',
      'Access Control Lists (ACLs): Standard (1-99) vs Extended (100-199)',
      'EtherChannel Link Aggregation (LACP / PAgP) & First Hop Redundancy (HSRP)',
    ],
  },
  {
    id: 'aws',
    category: 'cloud',
    title: 'AWS Cloud Solutions Architect',
    subtitle: 'Enterprise Cloud Infrastructure',
    desc: 'VPC subnets, IGW, NAT Gateways, EC2 auto-scaling, S3 storage tiers, IAM least privilege, and high-availability design.',
    pages: '190+ Pages',
    tag: 'Cloud Architect',
    accent: 'amber',
    badge: 'High CTC',
    relatedComboId: 'combo-cloud',
    pairingReason: 'Enterprise companies hire Multi-Cloud Architects. Mastering AWS + Azure unlocks ₹8L–₹15L CTC roles.',
    topics: [
      'AWS Global Cloud Infrastructure: Regions, AZs & 400+ Edge Locations',
      'Virtual Private Cloud (VPC): Public/Private Subnets, IGW & NAT Gateways',
      'EC2 Elastic Compute: Instance Families, EBS Volumes & Auto-Scaling Groups',
      'S3 Storage: Standard, Infrequent, Glacier Deep Archive & Bucket Policies',
      'IAM Security: Least Privilege, Role Delegation, Policies & STS Tokens',
      'Elastic Load Balancing (ALB / NLB) & Route 53 DNS Latency Policies',
    ],
  },
  {
    id: 'azure',
    category: 'cloud',
    title: 'Microsoft Azure Infrastructure',
    subtitle: 'Hybrid Enterprise & Entra ID',
    desc: 'Virtual Networks (VNet), Azure AD (Entra ID), Resource Groups, ARM Templates, ExpressRoute, and Azure VMs.',
    pages: '175+ Pages',
    tag: 'Enterprise Cloud',
    accent: 'blue',
    badge: 'Enterprise',
    relatedComboId: 'combo-cloud',
    pairingReason: 'Pair with AWS Cloud Architect to cover both global market leaders in hybrid cloud engineering.',
    topics: [
      'Azure Cloud Hierarchy: Subscriptions, Management Groups & Resource Groups',
      'Azure Virtual Networks (VNets), Subnets, Peering & NSG Firewall Rules',
      'Azure Virtual Machines: Availability Sets, Availability Zones & Proximity',
      'Microsoft Entra ID (Azure AD): Hybrid Join, Seamless SSO & Conditional Access',
      'Azure Storage Accounts: Blob (Hot/Cool/Archive), File Shares & Azure Backup',
      'Hybrid Cloud Connectivity: Site-to-Site VPN, ExpressRoute & Bastion Hosts',
    ],
  },
  {
    id: 'cybersecurity',
    category: 'security',
    title: 'Cyber Security & Defensive Ops',
    subtitle: 'Blue Team & SOC Triage',
    desc: 'Threat vectors, Malware remediation, SIEM log analysis, Firewalls vs WAF, Zero Trust, and Incident Response.',
    pages: '160+ Pages',
    tag: 'Defensive Security',
    accent: 'purple',
    badge: 'Defensive',
    relatedComboId: 'combo-cyber',
    pairingReason: 'Pair with Ethical Hacking to understand both Red Team attack tools and Blue Team SOC defense tactics.',
    topics: [
      'Threat Vectors: Phishing, Ransomware Kill Chain & Man-In-The-Middle',
      'SOC Operations: SIEM Log Correlation (Splunk / Elastic) & Event Triage',
      'Perimeter Security: Next-Gen Firewalls (NGFW), IDS / IPS & Cloud WAF',
      'Endpoint Detection & Response (EDR) & Memory Dump Malware Isolation',
      'Zero Trust Security Architecture: Mutual TLS, Microsegmentation & RBAC',
      'NIST SP 800-61 Incident Response Phases & Digital Evidence Chain-of-Custody',
    ],
  },
  {
    id: 'ethical-hacking',
    category: 'security',
    title: 'Ethical Hacking & Penetration Testing',
    subtitle: 'Red Team & Offensive Tools',
    desc: 'Reconnaissance, Nmap port scanning, Metasploit, Wireshark packet dissection, SQL Injection, and Burp Suite labs.',
    pages: '195+ Pages',
    tag: 'Offensive Security',
    accent: 'red',
    badge: 'Hands-on Labs',
    relatedComboId: 'combo-cyber',
    pairingReason: 'Pair with Defensive Cyber Security to master full-spectrum penetration testing and defensive remediation.',
    topics: [
      'Passive & Active Reconnaissance: OSINT, WHOIS, Shodan & DNS Harvesting',
      'Port Scanning & OS Fingerprinting: Nmap SYN / UDP Scans & NSE Scripts',
      'Network Packet Sniffing & Decryption: Wireshark Pcap Filters & ARP Spoofing',
      'Web Application Exploitation: OWASP Top 10, SQL Injection & Burp Suite Proxy',
      'Metasploit Framework: Exploit Payloads, Meterpreter & Post-Exploitation',
      'Privilege Escalation: Linux SUID Bits, Windows Token Impersonation & Reports',
    ],
  },
];

// ── ₹249 HIGH-CONVERTING POWER COMBO DUOS ──────────────────────────────────
const COMBOS = [
  {
    id: 'combo-it-support',
    name: 'IT Support & Systems Engineer Duo',
    subjects: ['Computer Hardware', 'Computer Networking'],
    totalVolume: '290+ Pages Combined',
    tag: 'Most Popular for Freshers',
    price: 249,
    originalPrice: 298,
    desc: 'Complete physical + logical foundation. Everything needed to crack Desktop Support, Field Engineer, or L1 NOC roles.',
    accent: 'emerald',
    badge: 'Save ₹49 Extra',
  },
  {
    id: 'combo-cloud',
    name: 'Multi-Cloud Architect Duo',
    subjects: ['AWS Cloud Architect', 'Microsoft Azure Infrastructure'],
    totalVolume: '365+ Pages Combined',
    tag: 'High CTC Enterprise Track',
    price: 249,
    originalPrice: 298,
    desc: 'Master both global cloud giants. High-availability AWS VPCs paired with Microsoft Azure Entra ID hybrid networks.',
    accent: 'amber',
    badge: 'Cloud Master',
  },
  {
    id: 'combo-cyber',
    name: 'Cyber Security & Pentesting Master Duo',
    subjects: ['Cyber Security Defensive', 'Ethical Hacking Offensive'],
    totalVolume: '355+ Pages Combined',
    tag: 'Complete Red + Blue Team',
    price: 249,
    originalPrice: 298,
    desc: 'The complete offensive & defensive security library. Threat hunting, malware isolation, Nmap scanning & Wireshark traces.',
    accent: 'purple',
    badge: 'Security Duo',
  },
  {
    id: 'combo-network',
    name: 'Enterprise Network Specialist Duo',
    subjects: ['Networking Fundamentals', 'CCNA Top Tier Notes'],
    totalVolume: '370+ Pages Combined',
    tag: 'Cisco TAC / NOC Track',
    price: 249,
    originalPrice: 298,
    desc: 'From basic subnetting to enterprise Cisco IOS router & switch configurations. Built for network engineers.',
    accent: 'blue',
    badge: 'Network Pro',
  },
];

// ── REAL PREVIEW ASSETS & LABELS (AUTHENTIC DIGITAL BOOK) ────────────────────
const PREVIEW_ASSETS = {
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
      'Page 1: Official Master Book Cover',
      'Page 2: Ch 01 — Computer Systems & The IPO Cycle',
      'Page 3: Computer Generations (1st to 5th Matrix)',
      'Page 4: Modern Input Peripherals & Sensor Tech',
      'Page 5: Display Technology (OLED vs IPS) & Ports',
    ],
    labelsHi: [
      'पेज 1: आधिकारिक मास्टर बुक कवर',
      'पेज 2: अध्याय 1 — कम्प्यूटर सिस्टम और IPO साइकिल',
      'पेज 3: 5 कम्प्यूटर पीढ़ियाँ और हार्डवेयर कंपैरिजन',
      'पेज 4: इनपुट डिवाइसेस, सेंसर्स और पोर्ट्स',
      'पेज 5: डिस्प्ले टेक्नोलॉजी और डायग्नोस्टिक पोर्ट्स',
    ],
  },
  hardware: {
    en: [
      '/previews/hardware/en-page-1.png',
      '/previews/hardware/en-page-2.png',
      '/previews/hardware/en-page-3.png',
      '/previews/hardware/en-page-4.png',
      '/previews/hardware/en-page-5.png',
    ],
    labelsEn: [
      'Page 1: Official Hardware Cover',
      'Page 2: CPU Sockets (LGA vs PGA) & Gold Pins',
      'Page 3: Motherboard VRM Phases & Power Throttling',
      'Page 4: High-Speed RAM Bus (DDR4 vs DDR5)',
      'Page 5: Storage Architecture: NVMe PCIe 5.0 vs SATA',
    ],
  },
};

const getPreviewImage = (subjectId, lang, page) => {
  const asset = PREVIEW_ASSETS[subjectId] || PREVIEW_ASSETS.fundamentals;
  if (lang === 'hi' && asset.hi) {
    return asset.hi[page - 1] || asset.hi[0];
  }
  const enPages = asset.en || PREVIEW_ASSETS.fundamentals.en;
  return enPages[page - 1] || enPages[0];
};

const getPageLabel = (subjectId, lang, page) => {
  const asset = PREVIEW_ASSETS[subjectId] || PREVIEW_ASSETS.fundamentals;
  if (lang === 'hi' && asset.labelsHi) {
    return asset.labelsHi[page - 1] || `पेज ${page} of 5`;
  }
  const labels = asset.labelsEn || PREVIEW_ASSETS.fundamentals.labelsEn;
  return labels[page - 1] || `Page ${page} of 5`;
};

export default function NotesPage() {
  // View mode: 'catalog' (clean list of topic boxes) or 'preview' (subject detail + 5p preview + payment comparison)
  const [viewMode, setViewMode] = useState('catalog');
  // State for active category filter
  const [activeCategory, setActiveCategory] = useState('all');
  // State for active selected subject
  const [selectedSubject, setSelectedSubject] = useState(SUBJECTS[0]);
  // State for preview reader page (1 to 5)
  const [previewPage, setPreviewPage] = useState(1);
  // State for real digital book preview modal pop-up
  const [isReaderModalOpen, setIsReaderModalOpen] = useState(false);
  // Language for preview reader: 'hi' | 'en'
  const [previewLang, setPreviewLang] = useState('hi');
  // State for modals
  const [isUpsellOpen, setIsUpsellOpen] = useState(false);
  const [isCheckoutOpen, setIsCheckoutOpen] = useState(false);
  // Modal package choice: 'single' (49), 'bundle' (149), or 'combo' (249)
  const [modalSelectedPlan, setModalSelectedPlan] = useState('single');
  // Language preference for main digital notebook: 'en' | 'hi'
  const [selectedLanguage, setSelectedLanguage] = useState('en');
  // Student lead registration states
  const [studentName, setStudentName] = useState('');
  const [studentEmail, setStudentEmail] = useState('');
  const [studentPhone, setStudentPhone] = useState('');
  const [isRegistering, setIsRegistering] = useState(false);
  const [registrationSuccess, setRegistrationSuccess] = useState(false);
  const [registrationError, setRegistrationError] = useState('');

  const handleRegisterStudent = async (e) => {
    if (e) e.preventDefault();
    if (!studentEmail || !studentEmail.includes('@')) {
      setRegistrationError('Please enter a valid email address.');
      return;
    }
    setIsRegistering(true);
    setRegistrationError('');

    try {
      const res = await fetch('/api/register-student', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
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
      const data = await res.json();
      if (res.ok && data.success) {
        setRegistrationSuccess(true);
        try {
          const prev = JSON.parse(localStorage.getItem('rtechlab_registered_students') || '[]');
          prev.push({
            name: studentName,
            email: studentEmail,
            phone: studentPhone,
            language: selectedLanguage,
            plan: checkoutItem.plan,
            date: new Date().toISOString(),
          });
          localStorage.setItem('rtechlab_registered_students', JSON.stringify(prev));
        } catch {}
      } else {
        setRegistrationError(data.error || 'Saved locally. Downloads are ready below.');
        setRegistrationSuccess(true);
      }
    } catch {
      setRegistrationSuccess(true);
    } finally {
      setIsRegistering(false);
    }
  };

  // Checkout selection
  const [checkoutItem, setCheckoutItem] = useState({
    title: 'Computer Fundamentals (Complete Master Notes)',
    plan: 'single',
    price: 49,
  });
  // Tab inside package explorer modal
  const [upsellTab, setUpsellTab] = useState('interview');

  // ESC & Arrow key listener for modals & reader
  React.useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === 'Escape') {
        setIsUpsellOpen(false);
        setIsCheckoutOpen(false);
        setIsReaderModalOpen(false);
      } else if (isReaderModalOpen) {
        if (e.key === 'ArrowLeft') {
          setPreviewPage((p) => Math.max(1, p - 1));
        } else if (e.key === 'ArrowRight') {
          setPreviewPage((p) => Math.min(5, p + 1));
        }
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isReaderModalOpen]);

  // Filtered subject list
  const filteredSubjects = activeCategory === 'all'
    ? SUBJECTS
    : SUBJECTS.filter((s) => s.category === activeCategory);

  // Active combo pairing for currently selected subject
  const activeRelatedCombo = COMBOS.find((c) => c.id === selectedSubject.relatedComboId) || COMBOS[0];

  // Open dedicated preview view for a subject
  const handleOpenSubjectPreview = (sub) => {
    setSelectedSubject(sub);
    setPreviewPage(1);
    setPreviewLang(sub.previewPdfHi ? 'hi' : 'en');
    setViewMode('preview');
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  // Open real digital book pop-up modal
  const handleOpenPreviewModal = (sub) => {
    setSelectedSubject(sub);
    setPreviewPage(1);
    setPreviewLang(sub.previewPdfHi ? 'hi' : 'en');
    setIsReaderModalOpen(true);
  };

  // Back to catalog view
  const handleBackToCatalog = () => {
    setViewMode('catalog');
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  // Trigger modal when student clicks ₹49 Single Notes (Honest option)
  const handleSingleClick = (sub = selectedSubject) => {
    setSelectedSubject(sub);
    setModalSelectedPlan('single');
    setIsUpsellOpen(true);
  };

  // Trigger modal when student clicks Career Bundle (+100 Qs)
  const handleBundleClick = (sub = selectedSubject) => {
    setSelectedSubject(sub);
    setModalSelectedPlan('bundle');
    setIsUpsellOpen(true);
  };

  // Direct checkout without modal
  const handleDirectSingleCheckout = (sub = selectedSubject) => {
    setSelectedSubject(sub);
    setCheckoutItem({
      title: sub.title + ' (Complete Master Handbook)',
      plan: 'single',
      price: 49,
    });
    setIsCheckoutOpen(true);
  };

  const handleDirectBundleCheckout = (sub = selectedSubject) => {
    setSelectedSubject(sub);
    setCheckoutItem({
      title: sub.title + ' (Career Accelerator Bundle)',
      plan: 'bundle',
      price: 149,
    });
    setIsCheckoutOpen(true);
  };

  const handleComboClick = (combo) => {
    setCheckoutItem({
      title: combo.name + ' (Power Combo Bundle)',
      plan: 'combo',
      price: combo.price,
    });
    setIsCheckoutOpen(true);
  };

  const handleAllAccessClick = () => {
    setCheckoutItem({
      title: 'All-Access Lifetime Master Library (All 8 Subjects)',
      plan: 'all-access',
      price: 499,
    });
    setIsCheckoutOpen(true);
  };

  // Proceed to checkout with the plan selected in the modal
  const proceedToCheckoutWithSelectedPlan = () => {
    if (modalSelectedPlan === 'single') {
      setCheckoutItem({
        title: selectedSubject.title + ' (Complete Master Handbook)',
        plan: 'single',
        price: 49,
      });
    } else if (modalSelectedPlan === 'bundle') {
      setCheckoutItem({
        title: selectedSubject.title + ' (Career Accelerator Bundle)',
        plan: 'bundle',
        price: 149,
      });
    } else {
      setCheckoutItem({
        title: activeRelatedCombo.name + ' (Power Combo Bundle)',
        plan: 'combo',
        price: activeRelatedCombo.price,
      });
    }
    setIsUpsellOpen(false);
    setIsCheckoutOpen(true);
  };

  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-6 sm:py-10 px-3 sm:px-6 lg:px-8 overflow-x-hidden">
      <div className="max-w-6xl mx-auto">
        
        {/* ── Breadcrumb & Utility Bar ───────────────────────────────────── */}
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 mb-6 sm:mb-8 pb-4 border-b border-white/[0.08]">
          <div className="flex items-center gap-1.5 sm:gap-2 text-[11px] sm:text-xs font-mono text-[#86868B] overflow-x-auto whitespace-nowrap">
            <Link to="/" className="hover:text-white transition-colors">Home</Link>
            <span>/</span>
            {viewMode === 'preview' ? (
              <>
                <button onClick={handleBackToCatalog} className="hover:text-white transition-colors">
                  Master Digital Notes Store
                </button>
                <span>/</span>
                <span className="text-white truncate max-w-[180px]">{selectedSubject.title}</span>
                <span>/</span>
                <span className="text-emerald-400">Preview &amp; Compare</span>
              </>
            ) : (
              <>
                <span className="text-white">Master Digital Notes Store</span>
                <span>/</span>
                <span className="text-emerald-400">2027 Industrial Standard</span>
              </>
            )}
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
            <button
              onClick={handleAllAccessClick}
              className="inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-full bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-90 text-black text-xs font-bold transition-all shadow-lg shadow-emerald-500/20 whitespace-nowrap"
            >
              <span>All 8 Subjects Pass (₹499)</span>
              <span className="bg-black/20 px-1 py-0.5 rounded text-[10px]">SAVE 90%</span>
            </button>
          </div>
        </div>

        {/* ===================================================================
            VIEW 1: CLEAN CATALOG MODE (ONLY NOTES & TOPIC-WISE BOXES)
        ==================================================================== */}
        {viewMode === 'catalog' && (
          <div className="animate-fadeIn">
            {/* ── Page Header ────────────────────────────────────────────── */}
            <div className="text-center sm:text-left mb-8 sm:mb-10">
              <div className="inline-flex items-center gap-2 px-3 py-1 sm:px-3.5 sm:py-1.5 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-[11px] sm:text-xs font-mono text-emerald-400 mb-3 sm:mb-4 backdrop-blur-md max-w-full overflow-hidden text-ellipsis">
                <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse shrink-0" />
                <span className="truncate">⚡ OFFICIAL CURRICULUM · RESEARCH-VERIFIED DIGITAL NOTES · TRANSPARENT PRICING</span>
              </div>
              <h1 className="text-2xl sm:text-5xl lg:text-6xl font-black text-white tracking-tight mb-2 sm:mb-3">
                Industrial Master Digital Notes
              </h1>
              <p className="text-[#86868B] text-xs sm:text-base max-w-3xl leading-relaxed mb-4 sm:mb-6">
                Comprehensive, research-verified engineering handbooks designed for modern IT professionals, college students, and certification aspirants. Inspect topics, read live 5-page previews, and get complete digital editions starting at just <strong className="text-white">₹49</strong>.
              </p>

              {/* Value Badges */}
              <div className="flex flex-wrap items-center gap-2 text-[11px] sm:text-xs font-mono">
                <span className="px-2.5 py-1 rounded-full bg-white/[0.05] border border-white/10 text-white font-semibold">
                  ✅ Complete Master Notes @ ₹49
                </span>
                <span className="px-2.5 py-1 rounded-full bg-white/[0.05] border border-white/10 text-emerald-400">
                  ✅ Optional Career Bundle (+100 Qs) @ ₹149
                </span>
                <span className="px-2.5 py-1 rounded-full bg-white/[0.05] border border-white/10 text-cyan-400">
                  ✅ Optional Dual Combos @ ₹249
                </span>
                <span className="px-2.5 py-1 rounded-full bg-white/[0.05] border border-white/10 text-amber-400">
                  ✅ All 8 Subjects Pass @ ₹499
                </span>
              </div>
            </div>

            {/* ── Category Filter Pills ──────────────────────────────────── */}
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-6 sm:mb-8">
              <div>
                <h2 className="text-xl sm:text-3xl font-black text-white tracking-tight">
                  Choose Your Subject Notes
                </h2>
                <p className="text-xs text-[#86868B]">
                  Explore syllabus modules, hardware pinouts, and system diagrams. Click 'Preview 5 Pages' to inspect sample:
                </p>
              </div>

              <div className="flex items-center gap-1.5 bg-[#0D0D10] p-1 rounded-full border border-white/[0.08] overflow-x-auto max-w-full">
                {[
                  { id: 'all', label: 'All 8' },
                  { id: 'systems', label: 'Systems' },
                  { id: 'networking', label: 'Network & CCNA' },
                  { id: 'cloud', label: 'AWS & Azure' },
                  { id: 'security', label: 'Security' },
                ].map((tab) => (
                  <button
                    key={tab.id}
                    onClick={() => setActiveCategory(tab.id)}
                    className={`px-3 py-1 rounded-full text-xs font-semibold transition-all whitespace-nowrap ${
                      activeCategory === tab.id
                        ? 'bg-white text-black font-bold shadow'
                        : 'text-[#86868B] hover:text-white'
                    }`}
                  >
                    {tab.label}
                  </button>
                ))}
              </div>
            </div>

            {/* ── 8 SUBJECT CARDS WITH DETAILED TOPIC-WISE BOXES ──────────── */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-5 mb-16">
              {filteredSubjects.map((sub) => (
                <div
                  key={sub.id}
                  className="p-5 sm:p-6 rounded-2xl sm:rounded-3xl bg-[#0D0D10] border border-white/[0.08] hover:border-emerald-500/40 transition-all flex flex-col justify-between group shadow-lg"
                >
                  <div>
                    {/* Header Badges */}
                    <div className="flex items-center justify-between mb-3">
                      <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.06] text-emerald-400 font-bold border border-emerald-500/20">
                        {sub.pages} · 2027 Edition
                      </span>
                      <span className="text-[10px] font-mono font-bold text-white bg-white/10 px-2 py-0.5 rounded">
                        {sub.badge}
                      </span>
                    </div>

                    <h3 className="text-lg sm:text-xl font-bold text-white mb-1 group-hover:text-emerald-400 transition-colors leading-snug">
                      {sub.title}
                    </h3>
                    <div className="text-xs font-mono text-emerald-400 mb-2 font-semibold">
                      {sub.subtitle}
                    </div>
                    <p className="text-xs text-[#86868B] leading-relaxed mb-4">
                      {sub.desc}
                    </p>

                    {/* ── TOPIC-WISE MODULES BOXES (CLEAN SYLLABUS LIST) ─── */}
                    <div className="space-y-1.5 mb-5 p-3 rounded-xl bg-black/50 border border-white/[0.06]">
                      <div className="text-[9px] font-mono text-white/50 uppercase tracking-widest font-semibold flex items-center justify-between">
                        <span>Topics Covered</span>
                        <span className="text-emerald-400 font-bold">Industrial Ready</span>
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
                        <span>+ {sub.topics.length - 3} more modules inside</span>
                        <button
                          type="button"
                          onClick={() => handleOpenPreviewModal(sub)}
                          className="hover:underline text-emerald-400 font-bold"
                        >
                          Click preview →
                        </button>
                      </div>
                    </div>
                  </div>

                  <div className="space-y-2.5 pt-3 border-t border-white/[0.06]">
                    {/* Price Tag */}
                    <div className="flex items-baseline justify-between">
                      <div>
                        <div className="text-[10px] font-mono text-[#86868B] uppercase">Single Full Notes</div>
                        <div className="text-xl sm:text-2xl font-black text-white">₹49</div>
                      </div>
                      <div className="text-right">
                        <div className="text-[10px] font-mono text-emerald-400">Career Bundle (+100 Qs)</div>
                        <div className="text-xs font-mono text-[#86868B]">₹149</div>
                      </div>
                    </div>

                    {/* Two Action Buttons: Preview 5 Pages vs Buy for ₹49 */}
                    <div className="grid grid-cols-2 gap-2">
                      <button
                        type="button"
                        onClick={() => handleOpenPreviewModal(sub)}
                        className="py-2.5 rounded-xl bg-white/[0.08] hover:bg-emerald-500 hover:text-black text-xs font-bold text-white transition-all text-center border border-white/10 active:scale-95 flex items-center justify-center gap-1 shadow-sm"
                      >
                        <span>Preview 5p</span>
                        <span>→</span>
                      </button>
                      <button
                        type="button"
                        onClick={() => handleSingleClick(sub)}
                        className="py-2.5 rounded-xl bg-emerald-500 hover:bg-emerald-400 text-black text-xs font-black transition-all text-center shadow-lg shadow-emerald-500/20 active:scale-95"
                      >
                        Buy for ₹49
                      </button>
                    </div>

                    <button
                      type="button"
                      onClick={() => handleOpenPreviewModal(sub)}
                      className="w-full text-center text-[11px] text-[#86868B] hover:text-emerald-400 transition-colors pt-0.5 block truncate"
                    >
                      Compare ₹49 vs ₹149 &amp; Read 5-Page Preview →
                    </button>
                  </div>
                </div>
              ))}
            </div>

            {/* ── FREQUENTLY BOUGHT TOGETHER DUOS (₹249 COMBOS) ───────────── */}
            <div className="mb-16">
              <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4 mb-6">
                <div>
                  <div className="inline-flex items-center gap-1.5 text-xs font-mono text-cyan-400 font-bold uppercase tracking-wider mb-1">
                    <span>🔥 OPTIONAL FREQUENTLY BOUGHT TOGETHER DUOS</span>
                  </div>
                  <h2 className="text-xl sm:text-3xl font-black text-white tracking-tight">
                    Dual-Domain Power Duos (₹249)
                  </h2>
                </div>
                <p className="text-xs text-[#86868B] max-w-md">
                  Curated domain pairs designed for high-impact cross-skilling. Includes both complete handbooks and full career interview vaults for ₹249.
                </p>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                {COMBOS.map((combo) => (
                  <div
                    key={combo.id}
                    className="relative p-5 rounded-2xl bg-[#0D0D10] border border-white/[0.1] hover:border-cyan-500/50 transition-all flex flex-col justify-between group shadow-lg"
                  >
                    <div className="absolute top-3 right-3 text-[10px] font-mono px-2 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/30 font-bold">
                      {combo.badge}
                    </div>

                    <div>
                      <div className="text-[10px] font-mono opacity-50 uppercase tracking-widest mb-1">
                        {combo.tag}
                      </div>
                      <h3 className="text-base sm:text-lg font-bold text-white mb-2 group-hover:text-cyan-400 transition-colors">
                        {combo.name}
                      </h3>
                      
                      <div className="flex flex-wrap gap-1.5 mb-2.5">
                        {combo.subjects.map((s, i) => (
                          <span key={i} className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.05] border border-white/[0.08] text-[#D2D2D7]">
                            ✓ {s}
                          </span>
                        ))}
                      </div>

                      <div className="text-[11px] font-mono text-cyan-400 mb-2">
                        {combo.totalVolume}
                      </div>

                      <p className="text-xs text-[#86868B] leading-relaxed mb-4">
                        {combo.desc}
                      </p>
                    </div>

                    <div>
                      <div className="flex items-baseline gap-2 mb-3 pt-3 border-t border-white/[0.06]">
                        <span className="text-xl sm:text-2xl font-black text-white">₹{combo.price}</span>
                        <span className="text-xs text-[#86868B] line-through font-mono">₹{combo.originalPrice}</span>
                        <span className="text-[11px] text-cyan-400 font-mono font-bold">SAVE ₹49</span>
                      </div>
                      <button
                        onClick={() => handleComboClick(combo)}
                        className="w-full py-2.5 rounded-xl bg-white/[0.08] hover:bg-cyan-500 hover:text-black text-white font-bold text-xs transition-all border border-white/[0.1]"
                      >
                        Get Duo Bundle — ₹{combo.price}
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* ===================================================================
            VIEW 2: DEDICATED SUBJECT DETAIL, 5-PAGE PREVIEW & PAYMENT COMPARISON
        ==================================================================== */}
        {viewMode === 'preview' && (
          <div className="animate-fadeIn space-y-10 sm:space-y-12">
            
            {/* Top Back Navigation Bar */}
            <div className="flex flex-wrap items-center justify-between gap-4 p-4 rounded-2xl bg-[#0D0D10] border border-white/[0.08]">
              <button
                onClick={handleBackToCatalog}
                className="inline-flex items-center gap-2 px-4 py-2 rounded-xl bg-white/[0.06] hover:bg-white/[0.12] text-xs font-bold text-white transition-all border border-white/10"
              >
                <span>← Back to All 8 Subjects</span>
              </button>

              <div className="flex items-center gap-2">
                <span className="text-xs font-mono text-[#86868B]">Switch Subject:</span>
                <select
                  value={selectedSubject.id}
                  onChange={(e) => {
                    const found = SUBJECTS.find((s) => s.id === e.target.value);
                    if (found) {
                      setSelectedSubject(found);
                      setPreviewPage(1);
                    }
                  }}
                  className="bg-black border border-white/20 text-xs text-white rounded-xl px-3 py-1.5 font-mono focus:outline-none focus:border-emerald-400"
                >
                  {SUBJECTS.map((s) => (
                    <option key={s.id} value={s.id}>
                      {s.title} ({s.pages})
                    </option>
                  ))}
                </select>
              </div>
            </div>

            {/* Subject Hero Card with Full Syllabus Topics */}
            <div className="p-6 sm:p-8 rounded-3xl bg-[#0D0D12] border border-white/[0.12] shadow-2xl">
              <div className="flex flex-wrap items-center gap-2 mb-3">
                <span className="px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 font-mono text-xs font-bold">
                  OFFICIAL 2027 INDUSTRIAL EDITION
                </span>
                <span className="px-3 py-1 rounded-full bg-white/[0.06] border border-white/10 text-white font-mono text-xs">
                  {selectedSubject.pages}
                </span>
                <span className="px-3 py-1 rounded-full bg-cyan-500/10 text-cyan-400 font-mono text-xs">
                  {selectedSubject.tag}
                </span>
              </div>

              <h1 className="text-2xl sm:text-4xl font-black text-white tracking-tight mb-2">
                {selectedSubject.title}
              </h1>
              <h2 className="text-base sm:text-xl font-bold text-emerald-400 mb-4 font-mono">
                {selectedSubject.subtitle}
              </h2>
              <p className="text-xs sm:text-sm text-[#86868B] max-w-3xl leading-relaxed mb-6">
                {selectedSubject.desc} High-resolution vector diagrams, live production terminal commands, and 100+ company interview questions. Volume: {selectedSubject.pages}.
              </p>

              {/* Complete Topic Breakdown */}
              <div className="pt-4 border-t border-white/[0.08]">
                <div className="text-xs font-mono text-white/60 uppercase tracking-wider font-bold mb-3">
                  Complete Industrial Syllabus Modules:
                </div>
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2">
                  {selectedSubject.topics.map((t, idx) => (
                    <div key={idx} className="p-2.5 rounded-xl bg-black border border-white/[0.06] text-xs font-mono text-[#D2D2D7] flex items-center gap-2">
                      <span className="text-emerald-400 font-bold shrink-0">{String(idx + 1).padStart(2, '0')}.</span>
                      <span className="truncate">{t}</span>
                    </div>
                  ))}
                </div>
              </div>
            </div>

            {/* ── REAL 5-PAGE DIGITAL BOOK SLIDER (AUTHENTIC HIGH-RES PAGES) ── */}
            <div className="rounded-2xl sm:rounded-3xl bg-[#0D0D0F] border border-white/[0.1] shadow-2xl overflow-hidden">
              {/* Top Bar of the Reader with Bilingual Language Switcher */}
              <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 px-4 sm:px-6 py-3.5 sm:py-4 bg-[#141417] border-b border-white/[0.08]">
                <div className="flex items-center gap-2">
                  <span className="text-[10px] sm:text-xs font-mono uppercase tracking-wider text-emerald-400 font-bold bg-emerald-500/10 px-2.5 py-1 rounded-full border border-emerald-500/20">
                    📖 REAL 5-PAGE DIGITAL BOOK PREVIEW
                  </span>
                  <span className="text-xs text-[#86868B] font-mono">
                    Page {previewPage} of 5
                  </span>
                </div>

                {/* Bilingual Edition Switcher: Hindi & English Tabs */}
                <div className="flex items-center gap-1.5 bg-black/70 p-1 rounded-xl border border-white/10 shrink-0">
                  <button
                    type="button"
                    onClick={() => setPreviewLang('hi')}
                    disabled={!selectedSubject.previewPdfHi}
                    className={`px-3 py-1.5 rounded-lg text-xs font-bold transition-all flex items-center gap-1.5 ${
                      previewLang === 'hi'
                        ? 'bg-gradient-to-r from-emerald-500 to-cyan-500 text-black shadow-md shadow-emerald-500/20'
                        : selectedSubject.previewPdfHi
                        ? 'text-[#86868B] hover:text-white'
                        : 'text-white/20 cursor-not-allowed'
                    }`}
                  >
                    <span>🇮🇳 हिंदी संस्करण (5 पेज)</span>
                    {!selectedSubject.previewPdfHi && (
                      <span className="text-[9px] font-normal text-white/30">(जल्द)</span>
                    )}
                  </button>
                  <button
                    type="button"
                    onClick={() => setPreviewLang('en')}
                    className={`px-3 py-1.5 rounded-lg text-xs font-bold transition-all flex items-center gap-1.5 ${
                      previewLang === 'en'
                        ? 'bg-white text-black shadow'
                        : 'text-[#86868B] hover:text-white'
                    }`}
                  >
                    <span>🇬🇧 English Edition (5 Pages)</span>
                  </button>
                </div>
              </div>

              {/* Main Book Slider Stage with Left/Right Arrows */}
              <div className="relative bg-[#09090B] p-4 sm:p-8 flex flex-col items-center justify-center min-h-[500px] sm:min-h-[620px] select-none">
                {/* Previous Page Arrow Button */}
                <button
                  type="button"
                  onClick={() => setPreviewPage((p) => Math.max(1, p - 1))}
                  disabled={previewPage === 1}
                  aria-label="Previous Page"
                  className={`absolute left-2 sm:left-6 top-1/2 -translate-y-1/2 z-20 w-11 h-11 sm:w-13 sm:h-13 rounded-full flex items-center justify-center text-2xl font-bold transition-all backdrop-blur-md shadow-2xl ${
                    previewPage === 1
                      ? 'opacity-20 cursor-not-allowed bg-black/40 text-white/40 border border-white/5'
                      : 'bg-black/85 hover:bg-emerald-500 hover:text-black text-white border border-white/20 hover:scale-110 active:scale-95'
                  }`}
                >
                  ‹
                </button>

                {/* Authentic High-Resolution Rendered Book Page */}
                <div className="relative group max-w-full flex flex-col items-center">
                  <div className="relative rounded-xl overflow-hidden shadow-[0_20px_60px_rgba(0,0,0,0.9)] border border-white/10 bg-black">
                    <img
                      src={getPreviewImage(selectedSubject.id, previewLang, previewPage)}
                      alt={getPageLabel(selectedSubject.id, previewLang, previewPage)}
                      className="max-h-[60vh] sm:max-h-[68vh] w-auto max-w-full object-contain block transition-transform duration-200"
                      loading="eager"
                    />
                    {/* Book spine shadow */}
                    <div className="absolute left-0 top-0 bottom-0 w-2.5 bg-gradient-to-r from-black/50 via-white/5 to-transparent pointer-events-none" />
                  </div>

                  {/* Chapter / Topic Label */}
                  <div className="mt-3 text-center">
                    <span className="text-xs sm:text-sm font-mono font-semibold text-emerald-400">
                      {getPageLabel(selectedSubject.id, previewLang, previewPage)}
                    </span>
                  </div>
                </div>

                {/* Next Page Arrow Button */}
                <button
                  type="button"
                  onClick={() => setPreviewPage((p) => Math.min(5, p + 1))}
                  disabled={previewPage === 5}
                  aria-label="Next Page"
                  className={`absolute right-2 sm:right-6 top-1/2 -translate-y-1/2 z-20 w-11 h-11 sm:w-13 sm:h-13 rounded-full flex items-center justify-center text-2xl font-bold transition-all backdrop-blur-md shadow-2xl ${
                    previewPage === 5
                      ? 'opacity-20 cursor-not-allowed bg-black/40 text-white/40 border border-white/5'
                      : 'bg-black/85 hover:bg-emerald-500 hover:text-black text-white border border-white/20 hover:scale-110 active:scale-95'
                  }`}
                >
                  ›
                </button>
              </div>

              {/* Bottom Controls: Page Numbers, Download Sample & Buy Plan */}
              <div className="p-3 sm:p-4 bg-[#141417] border-t border-white/[0.08] flex flex-col sm:flex-row items-center justify-between gap-3">
                {/* 1 to 5 Page Selector Pills */}
                <div className="flex items-center gap-1.5 sm:gap-2">
                  <span className="text-[11px] font-mono text-[#86868B] mr-1 hidden sm:inline">Pages:</span>
                  {[1, 2, 3, 4, 5].map((p) => (
                    <button
                      key={p}
                      type="button"
                      onClick={() => setPreviewPage(p)}
                      className={`px-3 py-1 rounded-full text-xs font-mono font-bold transition-all ${
                        previewPage === p
                          ? 'bg-emerald-500 text-black shadow-md shadow-emerald-500/30 scale-105'
                          : 'bg-white/10 text-[#86868B] hover:text-white hover:bg-white/20'
                      }`}
                    >
                      Page {p}
                    </button>
                  ))}
                  <span className="text-[11px] font-mono text-white/50 ml-1">/ 5</span>
                </div>

                {/* Direct Sample Download & Link to Comparison */}
                <div className="flex items-center gap-2 w-full sm:w-auto justify-end">
                  {previewLang === 'hi' && selectedSubject.previewPdfHi ? (
                    <a
                      href={selectedSubject.previewPdfHi}
                      download
                      className="inline-flex items-center gap-1.5 px-3 sm:px-3.5 py-1.5 rounded-xl bg-cyan-500/10 hover:bg-cyan-500/20 text-cyan-400 border border-cyan-500/30 text-xs font-mono font-bold transition-all"
                    >
                      <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                      </svg>
                      <span>डाउनलोड सैंपल (5p)</span>
                    </a>
                  ) : (
                    <a
                      href={selectedSubject.previewPdfEn || "/downloads/Computer-Fundamentals-English-Edition-1-5Page-Preview.pdf"}
                      download
                      className="inline-flex items-center gap-1.5 px-3 sm:px-3.5 py-1.5 rounded-xl bg-emerald-500/10 hover:bg-emerald-500/20 text-emerald-400 border border-emerald-500/30 text-xs font-mono font-bold transition-all"
                    >
                      <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                      </svg>
                      <span>Download Sample (5p)</span>
                    </a>
                  )}

                  <button
                    type="button"
                    onClick={() => {
                      const el = document.getElementById('payment-comparison');
                      if (el) el.scrollIntoView({ behavior: 'smooth' });
                    }}
                    className="text-xs font-mono text-emerald-400 hover:text-emerald-300 font-bold px-3 py-1.5 rounded-xl bg-emerald-500/10 border border-emerald-500/20"
                  >
                    Compare Plans Below ↓
                  </button>
                </div>
              </div>
            </div>

            {/* ── RIGHT BELOW THE PREVIEW: TRANSPARENT PRODUCT COMPARISON & PAYMENT ── */}
            <div id="payment-comparison" className="p-6 sm:p-10 rounded-3xl bg-[#0D0D12] border border-white/[0.12] shadow-2xl">
              <div className="text-center max-w-2xl mx-auto mb-8 sm:mb-10">
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/30 text-xs font-mono font-bold mb-3">
                  ⚖️ TRANSPARENT PRODUCT COMPARISON · SELECT YOUR PLAN
                </span>
                <h3 className="text-xl sm:text-3xl font-black text-white tracking-tight mb-2">
                  Choose Your Package for {selectedSubject.title}
                </h3>
                <p className="text-xs sm:text-sm text-[#86868B] leading-relaxed">
                  Student ka ₹49 bhi hamare liye utna hi precious hai! Compare every feature transparently below:
                </p>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-3 gap-5 sm:gap-6">
                
                {/* TIER 1: ₹49 SINGLE PASS */}
                <div className="p-5 sm:p-6 rounded-2xl bg-black border border-white/[0.12] flex flex-col justify-between">
                  <div>
                    <div className="inline-block px-2.5 py-0.5 rounded-full bg-white/[0.08] text-white font-mono text-[10px] font-bold uppercase mb-3">
                      Single Subject Full Pass
                    </div>
                    <h4 className="text-lg sm:text-xl font-black text-white mb-1">
                      Complete Master Notes
                    </h4>
                    <p className="text-xs text-[#86868B] mb-4">
                      Full {selectedSubject.pages} handbook. Best for college semester exams, viva, and quick conceptual mastery.
                    </p>
                    <div className="text-2xl sm:text-3xl font-black text-white mb-5 sm:mb-6">
                      ₹49 <span className="text-xs font-normal text-[#86868B] font-mono">one-time</span>
                    </div>

                    <div className="space-y-2 text-xs text-[#D2D2D7] pb-5">
                      <div className="flex items-center gap-2">
                        <span className="text-emerald-400">✓</span> Full Master Handbook ({selectedSubject.pages})
                      </div>
                      <div className="flex items-center gap-2">
                        <span className="text-emerald-400">✓</span> Full Theory &amp; Architecture Standards
                      </div>
                      <div className="flex items-center gap-2">
                        <span className="text-emerald-400">✓</span> Real Macro Hardware Photos &amp; Inspection
                      </div>
                      <div className="flex items-center gap-2">
                        <span className="text-emerald-400">✓</span> Human Body &amp; Kitchen Chef Analogies
                      </div>
                      <div className="flex items-center gap-2">
                        <span className="text-emerald-400">✓</span> 4-Step Diagnostic Flowcharts &amp; Traps
                      </div>
                      <div className="flex items-center gap-2">
                        <span className="text-emerald-400">✓</span> Topic Practice MCQs &amp; Solutions
                      </div>
                      <div className="flex items-center gap-2 text-[#86868B]">
                        <span>✕</span> 100+ Company Interview Questions
                      </div>
                      <div className="flex items-center gap-2 text-[#86868B]">
                        <span>✕</span> Hands-on Practical Lab Worksheets
                      </div>
                      <div className="flex items-center gap-2 text-[#86868B]">
                        <span>✕</span> Payscale Salary Blueprint
                      </div>
                    </div>
                  </div>

                  <button
                    onClick={() => handleDirectSingleCheckout(selectedSubject)}
                    className="w-full py-3 rounded-xl bg-white/[0.08] hover:bg-white/[0.15] text-white font-bold text-xs transition-all border border-white/10"
                  >
                    Buy ₹49 Single Notes
                  </button>
                </div>

                {/* TIER 2: ₹149 CAREER ACCELERATOR */}
                <div className="p-5 sm:p-6 rounded-2xl bg-[#0F0F14] border-2 border-emerald-500/60 shadow-xl shadow-emerald-500/10 flex flex-col justify-between relative">
                  <div className="absolute -top-3 left-1/2 -translate-x-1/2 px-3 py-0.5 rounded-full bg-emerald-500 text-black font-mono text-[10px] font-black uppercase whitespace-nowrap">
                    Most Popular · Just ₹100 Extra
                  </div>

                  <div>
                    <div className="inline-block px-2.5 py-0.5 rounded-full bg-emerald-500/10 text-emerald-400 font-mono text-[10px] font-bold uppercase mb-3 mt-1">
                      Career Accelerator
                    </div>
                    <h4 className="text-lg sm:text-xl font-black text-white mb-1">
                      Notes + 100 Qs + Labs
                    </h4>
                    <p className="text-xs text-[#86868B] mb-4">
                      Best for cracking L1/L2 Technical Support, Desktop, NOC &amp; Cloud interviews.
                    </p>
                    <div className="text-2xl sm:text-3xl font-black text-emerald-400 mb-5 sm:mb-6">
                      ₹149 <span className="text-xs font-normal text-[#86868B] font-mono">one-time</span>
                    </div>

                    <div className="space-y-2 text-xs text-[#D2D2D7] pb-5">
                      <div className="flex items-center gap-2 font-semibold text-white">
                        <span className="text-emerald-400 font-bold">✓</span> Book 1: 45-Page Core Master Handbook (English &amp; Hindi)
                      </div>
                      <div className="flex items-center gap-2 font-semibold text-emerald-400">
                        <span>✓</span> Book 2: Enterprise &amp; FAANG Deep-Dive (CPU, MESI Cache, NUMA, DC)
                      </div>
                      <div className="flex items-center gap-2 font-semibold text-emerald-400">
                        <span>✓</span> Book 3: 100+ Company Interview Vault (Google, Amazon, Cisco, TCS)
                      </div>
                      <div className="flex items-center gap-2 font-semibold text-emerald-400">
                        <span>✓</span> Book 4: Global IT Career &amp; Salary Blueprint (India &amp; Global CTC)
                      </div>
                      <div className="flex items-center gap-2 font-semibold text-emerald-400">
                        <span>✓</span> Book 5: Hands-on Practical Lab Workbook (8 Enterprise Labs &amp; Checklists)
                      </div>
                      <div className="flex items-center gap-2 font-semibold text-emerald-400">
                        <span>✓</span> Lifetime Yearly Updates (Free email delivery)
                      </div>
                    </div>
                  </div>

                  <button
                    onClick={() => handleDirectBundleCheckout(selectedSubject)}
                    className="w-full py-3 rounded-xl bg-emerald-500 hover:bg-emerald-400 text-black font-extrabold text-xs transition-all shadow-lg shadow-emerald-500/25 active:scale-95"
                  >
                    Get Career Accelerator (₹149)
                  </button>
                </div>

                {/* TIER 3: ₹249 SMART CONTEXTUAL COMBO */}
                <div className="p-5 sm:p-6 rounded-2xl bg-black border border-cyan-500/30 flex flex-col justify-between">
                  <div>
                    <div className="inline-block px-2.5 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 font-mono text-[10px] font-bold uppercase mb-3">
                      Smart Best Buy · Save ₹49
                    </div>
                    <h4 className="text-lg sm:text-xl font-black text-white mb-1">
                      {activeRelatedCombo.name}
                    </h4>
                    <p className="text-xs text-cyan-200/80 mb-2">
                      {selectedSubject.pairingReason}
                    </p>
                    <div className="text-[11px] font-mono text-[#86868B] mb-4">
                      {activeRelatedCombo.totalVolume}
                    </div>
                    <div className="text-2xl sm:text-3xl font-black text-cyan-400 mb-5 sm:mb-6">
                      ₹249 <span className="text-xs font-normal text-[#86868B] line-through font-mono">₹298</span>
                    </div>

                    <div className="space-y-2 text-xs text-[#D2D2D7] pb-5">
                      <div className="flex items-center gap-2 font-semibold text-white">
                        <span className="text-cyan-400 font-bold">✓</span> TWO Complete Handbooks ({activeRelatedCombo.totalVolume})
                      </div>
                      <div className="flex items-center gap-2 font-semibold text-cyan-400">
                        <span>✓</span> ALL 100+ Interview Qs for BOTH subjects
                      </div>
                      <div className="flex items-center gap-2 font-semibold text-cyan-400">
                        <span>✓</span> ALL Lab Worksheets for BOTH subjects
                      </div>
                      <div className="flex items-center gap-2 font-semibold text-cyan-400">
                        <span>✓</span> ALL Salary Blueprints &amp; Updates for BOTH
                      </div>
                    </div>
                  </div>

                  <button
                    onClick={() => handleComboClick(activeRelatedCombo)}
                    className="w-full py-3 rounded-xl bg-cyan-500/10 hover:bg-cyan-500 hover:text-black text-cyan-400 font-bold text-xs transition-all border border-cyan-500/30"
                  >
                    Get Smart Duo (₹249)
                  </button>
                </div>

              </div>
            </div>

            {/* Bottom Back Button */}
            <div className="text-center pt-4">
              <button
                onClick={handleBackToCatalog}
                className="text-xs font-mono text-[#86868B] hover:text-white transition-colors underline"
              >
                ← Back to Browse All 8 Subject Notes
              </button>
            </div>

          </div>
        )}

        {/* ── 5-PAGE LIVE PREVIEW REAL DIGITAL BOOK POP-UP MODAL ─────────────── */}
        {isReaderModalOpen && (
          <div
            role="dialog"
            aria-modal="true"
            aria-label="Real Digital Book 5-Page Preview Modal"
            className="fixed inset-0 z-50 flex items-center justify-center p-2 sm:p-4 bg-black/90 backdrop-blur-md animate-fadeIn"
            onClick={() => setIsReaderModalOpen(false)}
          >
            <div
              className="relative w-full max-w-4xl max-h-[96vh] rounded-2xl sm:rounded-3xl bg-[#0D0D10] border border-white/20 shadow-2xl flex flex-col overflow-hidden my-auto"
              onClick={(e) => e.stopPropagation()}
            >
              {/* Top Header of the Modal */}
              <div className="flex items-center justify-between px-4 sm:px-6 py-3.5 bg-[#141418] border-b border-white/10 shrink-0">
                <div className="flex items-center gap-2.5 truncate">
                  <div className="w-8 h-8 rounded-lg bg-emerald-500/10 border border-emerald-500/30 flex items-center justify-center text-emerald-400 font-bold text-sm shrink-0">
                    📖
                  </div>
                  <div className="truncate">
                    <h3 className="text-sm sm:text-base font-bold text-white truncate flex items-center gap-2">
                      <span>{selectedSubject.title}</span>
                      <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-emerald-500/20 text-emerald-400 font-bold border border-emerald-500/30">
                        Edition 1
                      </span>
                    </h3>
                    <p className="text-[10px] sm:text-xs font-mono text-[#86868B] truncate">
                      {selectedSubject.pages} · 5-Page Live Authentic Book Sample
                    </p>
                  </div>
                </div>

                <button
                  type="button"
                  onClick={() => setIsReaderModalOpen(false)}
                  aria-label="Close Sample Preview"
                  className="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 text-[#D2D2D7] hover:text-white flex items-center justify-center text-base font-bold transition-all shrink-0 ml-2 border border-white/10"
                >
                  ✕
                </button>
              </div>

              {/* 1. LANGUAGE SELECTION (First Option as requested by user) */}
              <div className="px-4 sm:px-6 py-3 bg-[#18181E] border-b border-white/[0.08] flex flex-col sm:flex-row sm:items-center justify-between gap-2 shrink-0">
                <div className="flex items-center gap-2">
                  <span className="text-xs font-mono text-[#86868B]">1. भाषा चुनें / Choose Edition:</span>
                  <span className="text-[10px] font-mono text-emerald-400 font-bold">
                    {previewLang === 'hi' ? 'हिंदी संस्करण सक्रिय' : 'English Edition Active'}
                  </span>
                </div>

                <div className="flex items-center gap-2">
                  <button
                    type="button"
                    onClick={() => setPreviewLang('hi')}
                    disabled={!selectedSubject.previewPdfHi}
                    className={`flex-1 sm:flex-none px-4 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center justify-center gap-2 ${
                      previewLang === 'hi'
                        ? 'bg-gradient-to-r from-emerald-500 to-cyan-500 text-black shadow-lg shadow-emerald-500/25 ring-2 ring-emerald-400/50'
                        : selectedSubject.previewPdfHi
                        ? 'bg-white/[0.06] hover:bg-white/[0.12] text-white border border-white/10'
                        : 'bg-white/[0.02] text-white/30 border border-white/5 cursor-not-allowed'
                    }`}
                  >
                    <span>🇮🇳 हिंदी संस्करण (5 पेज)</span>
                    {!selectedSubject.previewPdfHi && (
                      <span className="text-[9px] font-normal text-white/30">(जल्द)</span>
                    )}
                  </button>

                  <button
                    type="button"
                    onClick={() => setPreviewLang('en')}
                    className={`flex-1 sm:flex-none px-4 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center justify-center gap-2 ${
                      previewLang === 'en'
                        ? 'bg-white text-black shadow-lg shadow-white/25 ring-2 ring-white/50'
                        : 'bg-white/[0.06] hover:bg-white/[0.12] text-white border border-white/10'
                    }`}
                  >
                    <span>🇬🇧 English Edition (5 Pages)</span>
                  </button>
                </div>
              </div>

              {/* 2. REAL DIGITAL BOOK SLIDER STAGE (Sliding page view like a real book) */}
              <div className="relative bg-[#070709] p-3 sm:p-6 flex flex-col items-center justify-center flex-1 overflow-hidden select-none min-h-[380px] sm:min-h-[500px]">
                {/* Previous Page Arrow */}
                <button
                  type="button"
                  onClick={() => setPreviewPage((p) => Math.max(1, p - 1))}
                  disabled={previewPage === 1}
                  aria-label="Previous Page"
                  className={`absolute left-2 sm:left-4 top-1/2 -translate-y-1/2 z-20 w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center text-xl sm:text-2xl font-bold transition-all backdrop-blur-md shadow-2xl ${
                    previewPage === 1
                      ? 'opacity-20 cursor-not-allowed bg-black/40 text-white/40 border border-white/5'
                      : 'bg-black/85 hover:bg-emerald-500 hover:text-black text-white border border-white/20 hover:scale-110 active:scale-95'
                  }`}
                >
                  ‹
                </button>

                {/* High-Resolution Rendered Book Page Image */}
                <div className="relative group max-w-full flex flex-col items-center justify-center">
                  <div className="relative rounded-lg overflow-hidden shadow-[0_20px_50px_rgba(0,0,0,0.95)] border border-white/15 bg-black">
                    <img
                      src={getPreviewImage(selectedSubject.id, previewLang, previewPage)}
                      alt={getPageLabel(selectedSubject.id, previewLang, previewPage)}
                      className="max-h-[50vh] sm:max-h-[58vh] w-auto max-w-full object-contain block transition-transform duration-200"
                      loading="eager"
                    />
                    {/* Left book spine visual line */}
                    <div className="absolute left-0 top-0 bottom-0 w-2.5 bg-gradient-to-r from-black/60 via-white/5 to-transparent pointer-events-none" />
                  </div>

                  {/* Dynamic Page Chapter Label */}
                  <div className="mt-2 text-center">
                    <span className="text-xs sm:text-sm font-mono font-semibold text-emerald-400">
                      {getPageLabel(selectedSubject.id, previewLang, previewPage)}
                    </span>
                  </div>
                </div>

                {/* Next Page Arrow */}
                <button
                  type="button"
                  onClick={() => setPreviewPage((p) => Math.min(5, p + 1))}
                  disabled={previewPage === 5}
                  aria-label="Next Page"
                  className={`absolute right-2 sm:right-4 top-1/2 -translate-y-1/2 z-20 w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center text-xl sm:text-2xl font-bold transition-all backdrop-blur-md shadow-2xl ${
                    previewPage === 5
                      ? 'opacity-20 cursor-not-allowed bg-black/40 text-white/40 border border-white/5'
                      : 'bg-black/85 hover:bg-emerald-500 hover:text-black text-white border border-white/20 hover:scale-110 active:scale-95'
                  }`}
                >
                  ›
                </button>
              </div>

              {/* 3. MODAL FOOTER: Page Indicators, Download Sample PDF, and Direct Purchase */}
              <div className="p-3 sm:p-4 bg-[#141418] border-t border-white/10 flex flex-col sm:flex-row items-center justify-between gap-3 shrink-0">
                {/* Page 1 to 5 Slide Pills */}
                <div className="flex items-center gap-1.5 sm:gap-2">
                  <span className="text-[11px] font-mono text-[#86868B] mr-1 hidden sm:inline">Slide:</span>
                  {[1, 2, 3, 4, 5].map((p) => (
                    <button
                      key={p}
                      type="button"
                      onClick={() => setPreviewPage(p)}
                      className={`px-3 py-1 rounded-full text-xs font-mono font-bold transition-all ${
                        previewPage === p
                          ? 'bg-emerald-500 text-black shadow-md shadow-emerald-500/30 scale-105'
                          : 'bg-white/10 text-[#86868B] hover:text-white hover:bg-white/20'
                      }`}
                    >
                      Page {p}
                    </button>
                  ))}
                  <span className="text-[11px] font-mono text-white/50 ml-1">/ 5</span>
                </div>

                {/* Action Buttons */}
                <div className="flex items-center gap-2 w-full sm:w-auto justify-end">
                  {previewLang === 'hi' && selectedSubject.previewPdfHi ? (
                    <a
                      href={selectedSubject.previewPdfHi}
                      download
                      className="inline-flex items-center gap-1.5 px-3 sm:px-3.5 py-2 rounded-xl bg-cyan-500/10 hover:bg-cyan-500/20 text-cyan-400 border border-cyan-500/30 text-xs font-mono font-bold transition-all shrink-0"
                    >
                      <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                      </svg>
                      <span>सैंपल PDF (5p)</span>
                    </a>
                  ) : (
                    <a
                      href={selectedSubject.previewPdfEn || "/downloads/Computer-Fundamentals-English-Edition-1-5Page-Preview.pdf"}
                      download
                      className="inline-flex items-center gap-1.5 px-3 sm:px-3.5 py-2 rounded-xl bg-emerald-500/10 hover:bg-emerald-500/20 text-emerald-400 border border-emerald-500/30 text-xs font-mono font-bold transition-all shrink-0"
                    >
                      <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                      </svg>
                      <span>Sample PDF (5p)</span>
                    </a>
                  )}

                  <button
                    type="button"
                    onClick={() => {
                      setIsReaderModalOpen(false);
                      handleSingleClick(selectedSubject);
                    }}
                    className="inline-flex items-center gap-1.5 px-4 sm:px-5 py-2 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:opacity-90 text-black text-xs sm:text-sm font-black transition-all shadow-lg shadow-emerald-500/30 active:scale-95 shrink-0"
                  >
                    <span>{previewLang === 'hi' ? 'पूरी डिजिटल बुक खरीदें — ₹49' : 'Buy Complete Notes — ₹49'}</span>
                    <span>→</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* ── PACKAGE SELECTOR MODAL (WHEN CLICKING BUY FOR ₹49 ON CARD) ────── */}
        {isUpsellOpen && (
          <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-4 bg-black/85 backdrop-blur-md animate-fadeIn">
            <div className="relative w-full max-w-2xl rounded-t-3xl sm:rounded-3xl bg-[#0F0F13] border border-white/[0.15] p-5 sm:p-8 shadow-2xl max-h-[92vh] sm:max-h-[90vh] overflow-y-auto">
              
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
                  ✨ TRANSPARENT STUDENT CHOICE · NO FORCED UPSELL
                </span>
                <h3 className="text-xl sm:text-3xl font-black text-white tracking-tight mb-1">
                  Select Your Package for {selectedSubject.title}
                </h3>
                <p className="text-xs text-[#86868B] max-w-lg mx-auto leading-relaxed">
                  Choose the standalone handbook at ₹49, the full Career Accelerator Bundle (+100 MNC Questions), or a paired dual-subject combo:
                </p>
              </div>

              {/* Three Selectable Options */}
              <div className="space-y-3 mb-5">
                
                {/* Plan A: ₹49 Single Notes */}
                <div
                  onClick={() => setModalSelectedPlan('single')}
                  className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border transition-all flex items-start justify-between gap-3 ${
                    modalSelectedPlan === 'single'
                      ? 'bg-black border-white text-white shadow-lg ring-1 ring-white/20'
                      : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-white/20'
                  }`}
                >
                  <div className="flex items-start gap-3">
                    <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${modalSelectedPlan === 'single' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'}`}>
                      {modalSelectedPlan === 'single' && <div className="w-2 h-2 rounded-full bg-black" />}
                    </div>
                    <div>
                      <div className="flex items-center gap-2 mb-0.5">
                        <span className="font-bold text-white text-sm sm:text-base">
                          Single Subject Core Edition
                        </span>
                        <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-white/[0.06] text-[#86868B]">
                          {selectedSubject.id === 'fundamentals' ? '45 Pages En + 45 Pages Hi' : selectedSubject.pages}
                        </span>
                      </div>
                      <p className="text-xs text-[#86868B] leading-relaxed">
                        {selectedSubject.id === 'fundamentals'
                          ? 'Official Edition 1 Core Master Edition in both English & Hindi (45 pages each) with authentic macro photos, IPO cycle, and verified MCQs.'
                          : `Complete ${selectedSubject.pages} Master Handbook PDF with all theory, real macro photos, analogies, and practice MCQs.`}
                      </p>
                    </div>
                  </div>
                  <div className="text-right shrink-0">
                    <div className="text-lg sm:text-xl font-black text-white">₹49</div>
                    <div className="text-[10px] text-[#86868B] font-mono">one-time</div>
                  </div>
                </div>

                {/* Plan B: ₹149 Career Accelerator */}
                <div
                  onClick={() => setModalSelectedPlan('bundle')}
                  className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border transition-all flex items-start justify-between gap-3 relative ${
                    modalSelectedPlan === 'bundle'
                      ? 'bg-[#121218] border-emerald-500 text-white shadow-xl shadow-emerald-500/10 ring-1 ring-emerald-500/30'
                      : 'bg-black/40 border-white/[0.08] text-[#86868B] hover:border-emerald-500/40'
                  }`}
                >
                  <div className="flex items-start gap-3">
                    <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${modalSelectedPlan === 'bundle' ? 'border-emerald-400 bg-emerald-400' : 'border-white/30'}`}>
                      {modalSelectedPlan === 'bundle' && <div className="w-2 h-2 rounded-full bg-black" />}
                    </div>
                    <div>
                      <div className="flex items-center gap-2 mb-0.5 flex-wrap">
                        <span className="font-bold text-white text-sm sm:text-base">
                          {selectedSubject.id === 'fundamentals' ? 'Complete 5-in-1 Career Accelerator Suite' : 'Career Accelerator Edition'}
                        </span>
                        <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-emerald-500/10 text-emerald-400 font-extrabold border border-emerald-500/30">
                          +₹100 EXTRA · RECOMMENDED · BEST VALUE
                        </span>
                      </div>
                      <p className="text-xs text-[#86868B] leading-relaxed">
                        {selectedSubject.id === 'fundamentals'
                          ? 'All 5 Books & 6 PDFs (119 Pages Total): Core English (45p) + Core Hindi (45p) + Enterprise Deep Dive (7p) + Interview Practice Vault (7p) + Salary Blueprint (5p) + Practical Lab Workbook (10p).'
                          : `Full ${selectedSubject.pages} Notes + 100 Company Interview Questions + Practical Labs + Payscale Salary Blueprint + Yearly Updates.`}
                      </p>
                    </div>
                  </div>
                  <div className="text-right shrink-0">
                    <div className="text-lg sm:text-xl font-black text-emerald-400">₹149</div>
                    <div className="text-[10px] text-[#86868B] font-mono">one-time</div>
                  </div>
                </div>

                {/* Plan C: 🔥 Smart Best Buy Combo */}
                <div
                  onClick={() => setModalSelectedPlan('combo')}
                  className={`p-3.5 sm:p-4 rounded-2xl cursor-pointer border transition-all flex items-start justify-between gap-3 relative ${
                    modalSelectedPlan === 'combo'
                      ? 'bg-[#0E1520] border-cyan-400 text-white shadow-xl shadow-cyan-500/10 ring-1 ring-cyan-400/30'
                      : 'bg-black/40 border-cyan-500/30 text-[#86868B] hover:border-cyan-400/60'
                  }`}
                >
                  <div className="flex items-start gap-3">
                    <div className={`w-5 h-5 rounded-full border shrink-0 mt-0.5 flex items-center justify-center ${modalSelectedPlan === 'combo' ? 'border-cyan-400 bg-cyan-400' : 'border-cyan-500/40'}`}>
                      {modalSelectedPlan === 'combo' && <div className="w-2 h-2 rounded-full bg-black" />}
                    </div>
                    <div>
                      <div className="flex items-center gap-2 mb-0.5 flex-wrap">
                        <span className="font-bold text-white text-sm sm:text-base">
                          🔥 Smart Best Buy: {activeRelatedCombo.name}
                        </span>
                        <span className="text-[9px] font-mono px-2 py-0.5 rounded-full bg-cyan-500/10 text-cyan-400 font-extrabold border border-cyan-500/30">
                          SAVE ₹49 · 2 SUBJECTS
                        </span>
                      </div>
                      <p className="text-xs text-cyan-200/80 leading-relaxed mb-1">
                        {selectedSubject.pairingReason}
                      </p>
                      <div className="text-[11px] font-mono text-[#86868B]">
                        Includes BOTH {activeRelatedCombo.subjects.join(' + ')} ({activeRelatedCombo.totalVolume}) + ALL Interview Qs for both!
                      </div>
                    </div>
                  </div>
                  <div className="text-right shrink-0">
                    <div className="text-lg sm:text-xl font-black text-cyan-400">₹249</div>
                    <div className="text-[10px] text-[#86868B] line-through font-mono">₹298</div>
                  </div>
                </div>

              </div>

              {/* Sneak Peek Tabs */}
              <div className="mb-5">
                <div className="text-[11px] font-mono text-center text-[#86868B] mb-2 uppercase">
                  Sneak Peek: What's included in the Career Assets?
                </div>
                <div className="flex items-center justify-center gap-1 mb-2.5 bg-black/60 p-1 rounded-full border border-white/[0.08] max-w-lg mx-auto overflow-x-auto">
                  {[
                    { id: 'interview', label: '100+ Interview Qs' },
                    { id: 'labs', label: 'Practical Labs' },
                    { id: 'salary', label: 'Payscale Salaries' },
                    { id: 'faang', label: 'FAANG Deep-Dive' },
                    { id: 'updates', label: 'Yearly Updates' },
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
                <div className="p-3.5 sm:p-4 rounded-xl sm:rounded-2xl bg-black border border-white/[0.08] min-h-[120px] sm:min-h-[140px] text-xs">
                  {upsellTab === 'interview' && (
                    <div className="space-y-1.5 animate-fadeIn">
                      <div className="font-mono text-emerald-400 font-bold text-[11px]">
                        🏢 Amazon AWS Cloud Support Associate Interview:
                      </div>
                      <p className="text-white font-medium text-xs">
                        "A user reports latency connecting to your app. How do you isolate whether the bottleneck is DNS, MTU mismatch, or a saturated NAT Gateway?"
                      </p>
                      <div className="text-[#86868B] text-[11px] italic">
                        + Includes 99 more real scenario questions asked by TCS, Wipro, Cisco TAC, and Infosys with Senior Engineer model answers.
                      </div>
                      <a
                        href="/downloads/Computer-Fundamentals-Interview-Practice-Vault-Edition-1.pdf"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="inline-flex items-center gap-1.5 mt-2 px-3 py-1 rounded-lg bg-emerald-500/10 hover:bg-emerald-500/20 text-emerald-400 font-mono text-[10px] font-bold border border-emerald-500/30 transition-all"
                      >
                        <span>📄 Preview Interview Vault PDF (5 Pages)</span>
                        <span>→</span>
                      </a>
                    </div>
                  )}

                  {upsellTab === 'labs' && (
                    <div className="space-y-1.5 animate-fadeIn font-mono">
                      <div className="text-cyan-400 font-bold text-[11px]">
                        🧪 Production Lab Worksheet 04:
                      </div>
                      <p className="text-emerald-400 text-xs">
                        $ DISM /Online /Cleanup-Image /RestoreHealth &amp;&amp; sfc /scannow
                      </p>
                      <div className="text-[#86868B] text-[11px]">
                        8 battle-tested production worksheets covering ATX multimeter probing, DDR5 dual-channel verification, BIOS TPM 2.0, and Linux CLI diagnostics.
                      </div>
                      <a
                        href="/downloads/Computer-Fundamentals-Practical-Lab-Workbook-Edition-1.pdf"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="inline-flex items-center gap-1.5 mt-2 px-3 py-1 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 text-cyan-400 font-mono text-[10px] font-bold border border-cyan-500/30 transition-all"
                      >
                        <span>🧪 Preview Practical Lab Workbook PDF (10 Pages)</span>
                        <span>→</span>
                      </a>
                    </div>
                  )}

                  {upsellTab === 'salary' && (
                    <div className="space-y-2 animate-fadeIn">
                      <div className="flex items-center justify-between font-mono text-[11px]">
                        <span className="text-amber-400 font-bold">💼 2027 Payscale &amp; AmbitionBox Salary Benchmarks:</span>
                        <span className="text-[#86868B]">India IT Hubs</span>
                      </div>
                      <div className="grid grid-cols-2 sm:grid-cols-4 gap-1.5 sm:gap-2 text-center text-[10px] font-mono">
                        <div className="p-2 rounded-xl bg-white/[0.04] border border-white/[0.06]">
                          <div className="text-[#86868B]">Fresher (0-1 yr)</div>
                          <div className="font-bold text-white text-xs mt-0.5">₹3.2L - ₹4.5L</div>
                        </div>
                        <div className="p-2 rounded-xl bg-white/[0.04] border border-white/[0.06]">
                          <div className="text-[#86868B]">L1 Support (1-2y)</div>
                          <div className="font-bold text-white text-xs mt-0.5">₹4.5L - ₹6.5L</div>
                        </div>
                        <div className="p-2 rounded-xl bg-white/[0.04] border border-white/[0.06]">
                          <div className="text-[#86868B]">L2 Engineer (3-5y)</div>
                          <div className="font-bold text-white text-xs mt-0.5">₹7.0L - ₹11.5L</div>
                        </div>
                        <div className="p-2 rounded-xl bg-white/[0.04] border border-white/[0.06]">
                          <div className="text-emerald-400 font-bold">L3 / Highest</div>
                          <div className="font-bold text-emerald-400 text-xs mt-0.5">₹14L - ₹28L+</div>
                        </div>
                      </div>
                      <a
                        href="/downloads/Computer-Fundamentals-Career-Salary-Blueprint-Edition-1.pdf"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="inline-flex items-center gap-1.5 mt-1 px-3 py-1 rounded-lg bg-amber-500/10 hover:bg-amber-500/20 text-amber-400 font-mono text-[10px] font-bold border border-amber-500/30 transition-all"
                      >
                        <span>💼 Preview Salary &amp; Roadmap Blueprint PDF (6 Pages)</span>
                        <span>→</span>
                      </a>
                    </div>
                  )}

                  {upsellTab === 'faang' && (
                    <div className="space-y-1.5 animate-fadeIn">
                      <div className="font-mono text-purple-400 font-bold text-[11px]">
                        ⚡ Enterprise &amp; FAANG Systems Deep-Dive:
                      </div>
                      <p className="text-white font-medium text-xs">
                        Advanced Out-of-Order CPU execution, L1-L3 Cache Coherence (MESI), NUMA node topology, 5-level paging, and PCIe 6.0 PAM4 signaling.
                      </p>
                      <a
                        href="/downloads/Computer-Fundamentals-Enterprise-DeepDive-Edition-1.pdf"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="inline-flex items-center gap-1.5 mt-2 px-3 py-1 rounded-lg bg-purple-500/10 hover:bg-purple-500/20 text-purple-400 font-mono text-[10px] font-bold border border-purple-500/30 transition-all"
                      >
                        <span>📘 Preview FAANG Deep-Dive PDF (7 Pages)</span>
                        <span>→</span>
                      </a>
                    </div>
                  )}

                  {upsellTab === 'updates' && (
                    <div className="space-y-1.5 animate-fadeIn">
                      <div className="font-mono text-emerald-400 font-bold text-[11px] flex items-center gap-1.5">
                        <span>🔄 LIFETIME YEARLY VERSION UPDATES GUARANTEE</span>
                      </div>
                      <p className="text-[#D2D2D7] text-xs leading-relaxed">
                        Technology moves fast — from DDR5 to DDR6, PCIe 5 to PCIe 6, and Windows 11 to Windows 12. You only pay once today!
                      </p>
                      <div className="p-2.5 rounded-lg bg-emerald-500/10 border border-emerald-500/20 text-[11px] text-emerald-300">
                        📩 <strong>Just save your payment receipt!</strong> Every year, our engineering team updates the entire book and bundle with the latest industrial changes and emails it directly to your inbox for free.
                      </div>
                    </div>
                  )}
                </div>
              </div>

              {/* Dynamic Action Button */}
              <div className="space-y-2.5">
                <button
                  onClick={proceedToCheckoutWithSelectedPlan}
                  className={`w-full py-3.5 sm:py-4 rounded-xl sm:rounded-full font-black text-sm sm:text-base transition-all shadow-xl flex items-center justify-center gap-2 active:scale-98 ${
                    modalSelectedPlan === 'combo'
                      ? 'bg-cyan-400 hover:bg-cyan-300 text-black shadow-cyan-500/30'
                      : 'bg-emerald-500 hover:bg-emerald-400 text-black shadow-emerald-500/30'
                  }`}
                >
                  {modalSelectedPlan === 'single' && (
                    <>
                      <span>Proceed with ₹49 Single Master Notes ({selectedSubject.pages})</span>
                      <span>→</span>
                    </>
                  )}
                  {modalSelectedPlan === 'bundle' && (
                    <>
                      <span>Proceed with ₹149 Career Bundle (Notes + 100 Qs + Labs)</span>
                      <span>→</span>
                    </>
                  )}
                  {modalSelectedPlan === 'combo' && (
                    <>
                      <span>Proceed with ₹249 Smart Duo Combo ({activeRelatedCombo.totalVolume})</span>
                      <span>→</span>
                    </>
                  )}
                </button>
                <p className="text-[10px] sm:text-[11px] text-center text-[#86868B]">
                  🔒 100% Honest Pricing · Instant Download Link on Payment · Zero Subscription Traps
                </p>
              </div>

            </div>
          </div>
        )}

        {/* ── INSTANT CHECKOUT / ACCESS MODAL WITH LANGUAGE SELECTION & AUTOMATED LEAD CAPTURE ── */}
        {isCheckoutOpen && (
          <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-4 bg-black/85 backdrop-blur-md animate-fadeIn">
            <div className="relative w-full max-w-xl rounded-t-3xl sm:rounded-3xl bg-[#0F0F13] border border-white/[0.12] p-5 sm:p-7 shadow-2xl max-h-[92vh] sm:max-h-[90vh] overflow-y-auto">
              <button
                onClick={() => setIsCheckoutOpen(false)}
                className="absolute top-4 right-4 text-[#86868B] hover:text-white p-1.5 rounded-full bg-white/[0.06]"
              >
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>

              <div className="text-center mb-4">
                <div className="text-xs font-mono text-emerald-400 uppercase font-bold mb-1">
                  Instant Access &amp; Delivery · 2027 Edition
                </div>
                <h3 className="text-lg sm:text-2xl font-black text-white px-2">
                  {checkoutItem.title}
                </h3>
                <div className="text-2xl sm:text-3xl font-black text-white mt-1">
                  ₹{checkoutItem.price} <span className="text-xs font-normal text-[#86868B] font-mono">one-time access</span>
                </div>
              </div>

              {/* ── STEP 1: SELECT LANGUAGE FOR MAIN DIGITAL NOTEBOOK ── */}
              <div className="mb-4 p-3.5 rounded-2xl bg-black border border-white/[0.08]">
                <div className="text-[11px] font-mono text-emerald-400 font-bold uppercase mb-2 flex items-center justify-between">
                  <span>Step 1: Choose Main Digital Notebook Language</span>
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
                      45 Pages · Global Tech Standard
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
                      <span>🇮🇳 हिंदी एडिशन</span>
                      {selectedLanguage === 'hi' && <span className="text-cyan-400 text-[10px] font-bold">✓ SELECTED</span>}
                    </div>
                    <div className="text-[10px] font-mono text-[#86868B] mt-1">
                      45 Pages · सरल हिंदी व्याख्या
                    </div>
                  </button>
                </div>

                <p className="text-[10px] text-[#86868B] leading-relaxed">
                  💡 <em>Main Digital Notebook is provided in your chosen language ({selectedLanguage === 'hi' ? 'हिंदी' : 'English'}). All specialized career books (Enterprise FAANG Deep Dive, Interview Practice Vault, Salary Blueprint, Practical Lab Workbook) are in English (Global Industry Standard).</em>
                </p>
              </div>

              {/* ── STEP 2: STUDENT DETAILS FOR ZERO-TOUCH DELIVERY & UPDATES ── */}
              {!registrationSuccess ? (
                <form onSubmit={handleRegisterStudent} className="space-y-2.5 mb-4 p-3.5 rounded-2xl bg-black border border-white/[0.08]">
                  <div className="text-[11px] font-mono text-emerald-400 font-bold uppercase mb-1 flex items-center justify-between">
                    <span>Step 2: Register Details for Automated Delivery</span>
                    <span className="text-[#86868B] text-[10px]">Lifetime Updates</span>
                  </div>
                  <div className="space-y-2">
                    <input
                      type="text"
                      placeholder="Your Full Name (e.g. Rahul Sharma)"
                      value={studentName}
                      onChange={(e) => setStudentName(e.target.value)}
                      className="w-full px-3 py-2 rounded-xl bg-white/[0.05] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono"
                      required
                    />
                    <input
                      type="email"
                      placeholder="Your Email Address (For updates & official receipt)"
                      value={studentEmail}
                      onChange={(e) => setStudentEmail(e.target.value)}
                      className="w-full px-3 py-2 rounded-xl bg-white/[0.05] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono"
                      required
                    />
                    <input
                      type="tel"
                      placeholder="WhatsApp Mobile Number (Optional - for backup dispatch)"
                      value={studentPhone}
                      onChange={(e) => setStudentPhone(e.target.value)}
                      className="w-full px-3 py-2 rounded-xl bg-white/[0.05] border border-white/10 text-xs text-white placeholder-[#86868B] focus:outline-none focus:border-emerald-400 font-mono"
                    />
                  </div>

                  {registrationError && (
                    <div className="text-[10px] text-red-400 font-mono">{registrationError}</div>
                  )}

                  <button
                    type="submit"
                    disabled={isRegistering}
                    className="w-full py-2.5 rounded-xl bg-emerald-500 hover:bg-emerald-400 text-black font-extrabold text-xs transition-all shadow-md shadow-emerald-500/20 flex items-center justify-center gap-1.5"
                  >
                    {isRegistering ? (
                      <span>Saving Data &amp; Generating Links...</span>
                    ) : (
                      <span>Save &amp; Unlock Instant {selectedLanguage === 'hi' ? 'हिंदी' : 'English'} Downloads →</span>
                    )}
                  </button>
                </form>
              ) : (
                <div className="mb-4 p-3 rounded-2xl bg-emerald-500/10 border border-emerald-500/30 text-center animate-fadeIn">
                  <div className="text-emerald-400 font-bold text-xs flex items-center justify-center gap-1.5 mb-1">
                    <span>✅</span>
                    <span>Access Confirmed for {studentName || 'Student'}!</span>
                  </div>
                  <p className="text-[11px] text-[#D2D2D7]">
                    Registered email: <strong className="text-white">{studentEmail}</strong> · Preferred Language: <strong className="text-emerald-400">{selectedLanguage === 'hi' ? 'हिंदी Edition' : 'English Edition'}</strong>.
                  </p>
                  <div className="text-[10px] text-emerald-400/90 font-mono mt-0.5">
                    Your details are recorded. All future version updates will be sent directly to your email free of cost.
                  </div>
                </div>
              )}

              {/* ── STEP 3: INSTANT DOWNLOADS TAILORED TO LANGUAGE & PLAN ── */}
              <div className="space-y-3">
                {checkoutItem.title?.toLowerCase().includes('fundamental') && (
                  <div className="space-y-2.5 w-full pt-1">
                    {checkoutItem.plan === 'bundle' ? (
                      <div className="space-y-2 p-3.5 rounded-2xl bg-black border border-emerald-500/30">
                        <div className="flex items-center justify-between text-[11px] font-mono font-bold text-emerald-400">
                          <span>📦 COMPLETE 5-IN-1 CAREER ACCELERATOR</span>
                          <span>6 PDFs · 119 Pages</span>
                        </div>

                        {/* 1-Click ZIP Master Download */}
                        <a
                          href="/downloads/RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip"
                          download
                          className="w-full py-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 hover:from-emerald-400 hover:to-cyan-400 text-black font-black text-xs text-center shadow-lg shadow-emerald-500/20 block"
                        >
                          📦 1-Click Download: Complete 5-in-1 Suite (.ZIP - 30 MB)
                        </a>

                        {/* Individual Primary Download According to Selected Language */}
                        <div className="pt-2">
                          <div className="text-[10px] font-mono text-[#86868B] mb-1.5">
                            Primary Digital Notebook ({selectedLanguage === 'hi' ? 'हिंदी' : 'English'} Selected):
                          </div>
                          {selectedLanguage === 'hi' ? (
                            <a
                              href="/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf"
                              download
                              className="w-full py-2 rounded-lg bg-cyan-500/20 hover:bg-cyan-500/30 text-cyan-300 font-mono text-[11px] font-bold text-center border border-cyan-400/50 block mb-1"
                            >
                              ⚡ डाउनलोड मुख्य हिंदी Core Master PDF (45 Pages)
                            </a>
                          ) : (
                            <a
                              href="/downloads/Computer-Fundamentals-English-Edition-1.pdf"
                              download
                              className="w-full py-2 rounded-lg bg-emerald-500/20 hover:bg-emerald-500/30 text-emerald-300 font-mono text-[11px] font-bold text-center border border-emerald-400/50 block mb-1"
                            >
                              ⚡ Download Main English Core Master PDF (45 Pages)
                            </a>
                          )}
                        </div>

                        <div className="text-[10px] font-mono text-[#86868B] text-center pt-1">
                          Specialized Career Editions (Global English Standard):
                        </div>
                        <div className="grid grid-cols-2 gap-1.5 text-[10px] font-mono">
                          <a
                            href="/downloads/Computer-Fundamentals-Enterprise-DeepDive-Edition-1.pdf"
                            download
                            className="py-1.5 px-2 rounded-lg bg-purple-500/10 hover:bg-purple-500/20 text-purple-400 border border-purple-500/30 text-center truncate block"
                            title="Enterprise & FAANG Deep Dive (7 Pages)"
                          >
                            ⚡ FAANG DeepDive (7p)
                          </a>
                          <a
                            href="/downloads/Computer-Fundamentals-Interview-Practice-Vault-Edition-1.pdf"
                            download
                            className="py-1.5 px-2 rounded-lg bg-emerald-500/10 hover:bg-emerald-500/20 text-emerald-300 border border-emerald-500/30 text-center truncate block"
                            title="Interview Practice Vault (7 Pages)"
                          >
                            🎯 Interview Vault (7p)
                          </a>
                          <a
                            href="/downloads/Computer-Fundamentals-Career-Salary-Blueprint-Edition-1.pdf"
                            download
                            className="py-1.5 px-2 rounded-lg bg-amber-500/10 hover:bg-amber-500/20 text-amber-400 border border-amber-500/30 text-center truncate block"
                            title="Career & Salary Blueprint (5 Pages)"
                          >
                            💼 Career Blueprint (5p)
                          </a>
                          <a
                            href="/downloads/Computer-Fundamentals-Practical-Lab-Workbook-Edition-1.pdf"
                            download
                            className="py-1.5 px-2 rounded-lg bg-cyan-500/10 hover:bg-cyan-500/20 text-cyan-300 border border-cyan-500/30 text-center truncate block"
                            title="Practical Lab Workbook (10 Pages)"
                          >
                            🧪 Practical Labs (10p)
                          </a>
                        </div>

                        {/* Alternate Language Option */}
                        <div className="text-center pt-1 border-t border-white/[0.06]">
                          {selectedLanguage === 'hi' ? (
                            <a
                              href="/downloads/Computer-Fundamentals-English-Edition-1.pdf"
                              download
                              className="text-[10px] font-mono text-[#86868B] hover:text-white underline"
                            >
                              Also want English Core Master? Click here to download (45 Pages)
                            </a>
                          ) : (
                            <a
                              href="/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf"
                              download
                              className="text-[10px] font-mono text-[#86868B] hover:text-white underline"
                            >
                              हिंदी एडिशन भी चाहिए? यहाँ क्लिक करें (45 Pages)
                            </a>
                          )}
                        </div>
                      </div>
                    ) : (
                      <div className="space-y-2 p-3.5 rounded-2xl bg-black border border-white/[0.08]">
                        <div className="flex items-center justify-between text-[11px] font-mono font-bold text-emerald-400 px-1">
                          <span>📘 CORE MASTER PASS</span>
                          <span>45 Pages ({selectedLanguage === 'hi' ? 'हिंदी' : 'English'})</span>
                        </div>
                        {selectedLanguage === 'hi' ? (
                          <div className="space-y-1.5">
                            <a
                              href="/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf"
                              download
                              className="w-full py-2.5 rounded-xl bg-cyan-500 hover:bg-cyan-400 text-black font-extrabold font-mono text-xs text-center block shadow-md shadow-cyan-500/20"
                            >
                              ⚡ डायरेक्ट डाउनलोड: मुख्य हिंदी Edition 1 (45 Pages PDF)
                            </a>
                            <a
                              href="/downloads/Computer-Fundamentals-English-Edition-1.pdf"
                              download
                              className="w-full py-1.5 rounded-lg bg-white/[0.05] hover:bg-white/[0.1] text-[#86868B] hover:text-white font-mono text-[10px] text-center border border-white/10 block"
                            >
                              Alternate: Download English Edition 1 (45 Pages)
                            </a>
                          </div>
                        ) : (
                          <div className="space-y-1.5">
                            <a
                              href="/downloads/Computer-Fundamentals-English-Edition-1.pdf"
                              download
                              className="w-full py-2.5 rounded-xl bg-emerald-500 hover:bg-emerald-400 text-black font-extrabold font-mono text-xs text-center block shadow-md shadow-emerald-500/20"
                            >
                              ⚡ Direct Download: English Edition 1 (45 Pages PDF)
                            </a>
                            <a
                              href="/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf"
                              download
                              className="w-full py-1.5 rounded-lg bg-white/[0.05] hover:bg-white/[0.1] text-[#86868B] hover:text-white font-mono text-[10px] text-center border border-white/10 block"
                            >
                              वैकल्पिक: डाउनलोड करें हिंदी Edition 1 (45 Pages)
                            </a>
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                )}

                {/* Optional Direct UPI QR Support Section */}
                <div className="p-3 rounded-2xl bg-black/60 border border-white/[0.06] text-center">
                  <div className="text-[10px] font-mono text-[#86868B] mb-1">
                    Optional UPI Direct Payment (Scan or Pay via UPI App):
                  </div>
                  <div className="flex items-center justify-center gap-3">
                    <a
                      href={`upi://pay?pa=rtechlab@upi&pn=RTechLab&am=${checkoutItem.price}&cu=INR&tn=RTechLab-${encodeURIComponent(checkoutItem.title || 'Notes')}`}
                      className="px-3 py-1.5 rounded-lg bg-emerald-500/20 hover:bg-emerald-500/30 text-emerald-400 font-mono text-[11px] font-bold border border-emerald-500/30 transition-all"
                    >
                      Pay ₹{checkoutItem.price} via UPI App
                    </a>
                    <a
                      href={`https://wa.me/919000000000?text=${encodeURIComponent(`Hello Rahul Sir, I have registered as ${studentName || 'Student'} (${studentEmail}) for ${checkoutItem.title} in ${selectedLanguage === 'hi' ? 'Hindi' : 'English'}.`)}`}
                      target="_blank"
                      rel="noreferrer"
                      className="px-3 py-1.5 rounded-lg bg-white/[0.05] hover:bg-white/[0.1] text-[#86868B] hover:text-white font-mono text-[11px] border border-white/10 transition-all"
                    >
                      WhatsApp Support
                    </a>
                  </div>
                </div>

                <p className="text-[10px] sm:text-[11px] text-center text-[#86868B]">
                  🔒 100% Genuine Notes · Authorized Author: Rahul Sir · Lifetime Updates
                </p>
              </div>
            </div>
          </div>
        )}

      </div>
    </div>
  );
}
