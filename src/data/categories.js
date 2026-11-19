export const categoriesData = [
  {
    id: "networking",
    title: "Enterprise Networking",
    titleHi: "एंटरप्राइज नेटवर्किंग",
    shortDesc: "OSI 7 Layers, TCP/IP Suite, IPv4 & IPv6 Subnetting, Ethernet framing, and Enterprise Switching.",
    shortDescHi: "OSI 7 लेयर्स, TCP/IP सूट, IPv4 और IPv6 सबनेटिंग, ईथरनेट फ्रेमिंग और एंटरप्राइज स्विचिंग।",
    iconName: "Network",
    color: "from-blue-600 to-cyan-500",
    borderGlow: "group-hover:border-cyan-500/50",
    modulesCount: 14,
    level: "Beginner to Advanced",
    levelHi: "शुरुआती से उन्नत",
    keyTopics: [
      "OSI & TCP/IP Reference Models",
      "IPv4 Subnetting & VLSM Design",
      "VLANs, Trunking (802.1Q) & VTP",
      "Spanning Tree Protocol (STP & RSTP)",
      "DHCP, DNS & NAT / PAT Operations",
      "Packet Analysis using Wireshark"
    ],
    targetRole: "Network Administrator / NOC Engineer"
  },
  {
    id: "ccna",
    title: "Cisco CCNA (200-301)",
    titleHi: "सिस्को CCNA (200-301)",
    shortDesc: "Comprehensive Cisco certification track: routing protocols (OSPF), security fundamentals, and CLI mastery.",
    shortDescHi: "सिस्को सर्टिफिकेशन ट्रैक: रूटिंग प्रोटोकॉल (OSPF), सुरक्षा और Cisco IOS CLI में महारत।",
    iconName: "Cpu",
    color: "from-indigo-600 to-blue-500",
    borderGlow: "group-hover:border-blue-500/50",
    modulesCount: 22,
    level: "Certification Track",
    levelHi: "प्रमाणन ट्रैक",
    keyTopics: [
      "Cisco IOS CLI Navigation & Basics",
      "Inter-VLAN Routing (Router-on-a-Stick)",
      "Single & Multi-Area OSPFv2 / OSPFv3",
      "Access Control Lists (Standard & Extended ACLs)",
      "EtherChannel (LACP & PAgP Bundling)",
      "Network Automation & Cisco DNA Center Basics"
    ],
    targetRole: "Cisco Certified Network Associate"
  },
  {
    id: "linux",
    title: "Linux Systems & Administration",
    titleHi: "लिनक्स सिस्टम्स एवं प्रशासन",
    shortDesc: "Command-line prowess, file permissions, shell scripting, systemd services, and production server hardening.",
    shortDescHi: "कमांड-लाइन, फ़ाइल अनुमतियाँ, शेल स्क्रिप्टिंग, systemd सेवाएँ और प्रोडक्शन सर्वर सुरक्षा।",
    iconName: "Terminal",
    color: "from-amber-600 to-orange-500",
    borderGlow: "group-hover:border-orange-500/50",
    modulesCount: 18,
    level: "Core System Skill",
    levelHi: "कोर सिस्टम स्किल",
    keyTopics: [
      "File Hierarchy Standard & Essential CLI",
      "User, Group & File Permissions (chmod / chown)",
      "Systemd Services, Daemons & Cron Jobs",
      "Bash Shell Scripting & Task Automation",
      "Networking in Linux (ip, ss, netstat, ufw)",
      "SSH Hardening, Key Auth & Fail2Ban"
    ],
    targetRole: "Linux Administrator / DevOps Engineer"
  },
  {
    id: "cybersecurity",
    title: "Cyber Security & Defense",
    titleHi: "साइबर सुरक्षा एवं नेटवर्क रक्षा",
    shortDesc: "Defensive tactics, firewall rules, port scanning defense, vulnerability analysis, and zero-trust concepts.",
    shortDescHi: "रक्षात्मक रणनीति, फ़ायरवॉल नियम, पोर्ट स्कैनिंग सुरक्षा, कमज़ोरी विश्लेषण और जीरो-ट्रस्ट मॉडल।",
    iconName: "ShieldCheck",
    color: "from-emerald-600 to-teal-500",
    borderGlow: "group-hover:border-emerald-500/50",
    modulesCount: 16,
    level: "Intermediate",
    levelHi: "मध्यवर्ती",
    keyTopics: [
      "Network Reconnaissance & Port Scanning (Nmap)",
      "Wireshark Deep Packet Inspection & Threats",
      "Firewalls, iptables & Enterprise Next-Gen Firewalls",
      "Cryptography, SSL/TLS Handshakes & Hashing",
      "OWASP Top 10 Web Vulnerabilities Overview",
      "Incident Response & SOC Analyst Fundamentals"
    ],
    targetRole: "Security Analyst / SOC Specialist"
  },
  {
    id: "hardware",
    title: "Computer Hardware & Infra",
    titleHi: "कंप्यूटर हार्डवेयर एवं इन्फ्रास्ट्रक्चर",
    shortDesc: "Motherboard architecture, CPUs, RAM timings, storage RAID levels, BIOS/UEFI, and enterprise server racking.",
    shortDescHi: "मदरबोर्ड आर्किटेक्चर, सीपीयू, रैम टाइमिंग्स, स्टोरेज RAID लेवल्स, BIOS/UEFI और सर्वर हार्डवेयर।",
    iconName: "Server",
    color: "from-purple-600 to-indigo-500",
    borderGlow: "group-hover:border-purple-500/50",
    modulesCount: 12,
    level: "Fundamental to Pro",
    levelHi: "बुनियादी से प्रो",
    keyTopics: [
      "CPU Architectures (x86, ARM, RISC-V Basics)",
      "DDR4/DDR5 Memory Channels & Latency",
      "Storage Tech: NVMe, PCIe Lanes & RAID (0, 1, 5, 10)",
      "Server Racks, IPMI / iDRAC Remote Management",
      "Hardware Diagnostics & Post Code Troubleshooting",
      "Power Budgeting, UPS & Thermal Management"
    ],
    targetRole: "Hardware Engineer / Data Center Tech"
  },
  {
    id: "cloud",
    title: "Cloud Computing (AWS / Azure)",
    titleHi: "क्लाउड कंप्यूटिंग (AWS / Azure)",
    shortDesc: "Virtual private clouds (VPC), EC2 instances, S3 object storage, IAM access management, and hybrid connectivity.",
    shortDescHi: "वर्चुअल प्राइवेट क्लाउड (VPC), EC2 इंस्टेंस, S3 स्टोरेज, IAM एक्सेस प्रबंधन और हाइब्रिड कनेक्टिविटी।",
    iconName: "Cloud",
    color: "from-sky-600 to-blue-600",
    borderGlow: "group-hover:border-sky-400/50",
    modulesCount: 15,
    level: "Intermediate to Pro",
    levelHi: "मध्यवर्ती से प्रो",
    keyTopics: [
      "Cloud Shared Responsibility Model",
      "AWS VPC Architecture, Subnets & Route Tables",
      "Compute: EC2, Auto-scaling & Load Balancers",
      "IAM Roles, Policies & Least-Privilege Access",
      "Cloud Storage: S3, EBS, and EFS Differences",
      "Site-to-Site VPN & Direct Connect Foundations"
    ],
    targetRole: "Cloud Engineer / Solutions Architect"
  },
  {
    id: "coding",
    title: "Coding & Network Automation",
    titleHi: "कोडिंग एवं नेटवर्क ऑटोमेशन",
    shortDesc: "Python for Network Engineers, Netmiko, Paramiko, REST APIs, JSON/YAML parsing, and Git workflow for infrastructure.",
    shortDescHi: "नेटवर्क इंजीनियर्स के लिए पायथन, नेटमिको, रेस्ट एपीआई, JSON/YAML पार्सिंग और गिट वर्कफ़्लो।",
    iconName: "Code",
    color: "from-cyan-600 to-emerald-500",
    borderGlow: "group-hover:border-cyan-400/50",
    modulesCount: 14,
    level: "Practical Applied",
    levelHi: "व्यावहारिक अनुप्रयोग",
    keyTopics: [
      "Python 3 Core for Infrastructure Engineers",
      "Automating Multi-Device Configs with Netmiko",
      "Working with JSON, YAML & XML Data Formats",
      "Consuming Network REST APIs with Requests",
      "Git & GitHub for Network Configuration Backups",
      "Building Automated Ping & Uptime Checkers"
    ],
    targetRole: "NetDevOps / Automation Specialist"
  },
  {
    id: "freetools",
    title: "Free Online Technology Tools",
    titleHi: "मुफ़्त ऑनलाइन तकनीकी टूल्स",
    shortDesc: "Zero-latency in-browser calculators, port inspectors, network diagnostic simulators, and cheat sheets.",
    shortDescHi: "शून्य-विलंबता इन-ब्राउज़र कैलकुलेटर, पोर्ट निरीक्षक, नेटवर्क डायग्नोस्टिक सिमुलेटर और संदर्भ टूल्स।",
    iconName: "Wrench",
    color: "from-blue-500 to-cyan-400",
    borderGlow: "group-hover:border-electric-400/50",
    modulesCount: 8,
    level: "Instant Free Utilities",
    levelHi: "त्वरित मुफ़्त टूल्स",
    keyTopics: [
      "IPv4 & IPv6 Subnet Calculator (VLSM Ready)",
      "Well-Known & Registered Ports Database",
      "Linux Command Sandbox with Live Output",
      "Network Bandwidth Transfer Duration Estimator",
      "Hex, Binary, Base64 & Hash Generator",
      "CIDR to Netmask & Wildcard Quick Converter"
    ],
    targetRole: "Essential Daily Engineering Toolkit"
  }
];
