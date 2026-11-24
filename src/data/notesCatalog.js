// RTechLab Master Notes Catalog (2027 Industrial & Foundational Standard)
// Author: Rahul Sir & RTechLab Systems Lab

export const NOTES_SUBJECTS = [
  {
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
    previewPdfEn: '/downloads/Windows-Server-2025-English-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Windows-Server-2025-English-Master-Guide.pdf',
    previewPdfHi: '/downloads/Windows-Server-2025-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfHi: '/downloads/Windows-Server-2025-Hindi-Master-Guide.pdf',
    previewPdfGu: '/downloads/Windows-Server-2025-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfGu: '/downloads/Windows-Server-2025-Gujarati-Master-Guide.pdf',
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
  {
      "id": "ai",
      "code": "RTL-2027-AI",
      "badge": "HOT 2027 · AI CAREER ACCELERATOR",
      "badgeColor": "text-[#8B5CF6] bg-[#8B5CF6]/10 border-[#8B5CF6]/30",
      "title": "Artificial Intelligence Essentials & Career Master Guide",
      "titleHi": "आर्टिफिशियल इंटेलिजेंस (AI) एसेंशियल एवं करियर मास्टर गाइड",
      "tagline": "1950 Foundations to 2027 Agentic AI, Indic LLMs (Sarvam, Krutrim), ₹38 LPA Salary Ladder & Top 50 MNC Interview Vault",
      "taglineHi": "1950 इतिहास से 2027 एजेंटिक AI, इंडिक LLMs (सर्वम, कृत्रिम), ₹38 LPA सैलरी लैडर एवं टॉप 50 MNC इंटरव्यू वॉल्ट",
      "price": 49,
      "bundlePrice": 149,
      "pages": "112 Pages (Complete 4-in-1 Master Suite)",
      "pagesNum": 112,
      "edition": "Edition 1 (2027 Master Edition)",
      "author": "Rahul Patel (Founder & Chief Architect, RTechLab)",
      "accentColor": "#8B5CF6",
      "previewPdfEn": "/downloads/AI-Essentials-English-Edition-1-5Page-Preview.pdf",
      "fullPdfEn": "/downloads/AI-Essentials-English-Edition-1.pdf",
      "previewPdfHi": "/downloads/AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf",
      "fullPdfHi": "/downloads/AI-Essentials-Hindi-Edition-1.pdf",
      "previewPdfGu": "/downloads/AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf",
      "fullPdfGu": "/downloads/AI-Essentials-Gujarati-Edition-1.pdf",
      "bundleZip": "/downloads/AI-Career-Accelerator-Bundle.zip",
      "photoHighlights": [
          "AI Hierarchy: Artificial Intelligence, ML, Deep Learning & GenAI",
          "Scaled Dot-Product Self-Attention & Multi-Head Transformer Engine",
          "Production RAG Pipeline: Vector Indexing, Hybrid BM25 & Cohere Rerank",
          "Autonomous Agentic AI: ReAct Loop, Tool Execution & LangGraph",
          "High-Performance NVIDIA H100 / B200 GPU Cluster Architecture",
          "IndiaAI Mission ₹10,372 Cr Compute & Sovereign Indic LLM Ecosystem",
          "2027 AI Career Ladder: ₹4.5 LPA to ₹38+ LPA Compensation Matrix",
          "Top 50 FAANG / MNC AI Interview Questions with Math Derivations",
          "100 Enterprise System Prompts & Adversarial Jailbreak Defenses",
          "0-to-6 Month Complete Learning Roadmap & Daily 2-Hour Habit Tracker",
          "Million-Dollar Multi-Tenant RAG Docker Compose Production Stack",
          "25 High-Impact ATS Resume Bullets with Quantified Impact Metrics"
      ],
      "chapters": [
          {
              "num": "01",
              "title": "The Dawn of Intelligent Machines: 1950 Turing to Dartmouth",
              "titleHi": "बुद्धिमान मशीनों की शुरुआत: 1950 ट्यूरिंग से डार्टमाउथ तक",
              "pages": "Page 03",
              "topics": [
                  "1950 Alan Turing Computing Machinery & Imitation Game",
                  "Dartmouth 1956 Summer Workshop on Artificial Intelligence",
                  "Symbolic AI, Physical Symbol Systems & Logic Theorist",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Historical Spotlight"
              ]
          },
          {
              "num": "02",
              "title": "Golden Age, Perceptrons & The First AI Winter (1956-1980)",
              "titleHi": "स्वर्ण युग, परसेप्ट्रॉन एवं पहला AI विंटर (1956-1980)",
              "pages": "Page 04",
              "topics": [
                  "Frank Rosenblatt 1957 Mark I Perceptron Architecture",
                  "Minsky & Papert 1969 Geometric XOR Linearity Limitation",
                  "1973 Lighthill Report & DARPA 1974-1980 Funding Collapse",
                  "End of Chapter: 3 Review Questions, 2 MCQs & First Winter Postmortem"
              ]
          },
          {
              "num": "03",
              "title": "Expert Systems, Knowledge Engineering & Second AI Winter",
              "titleHi": "एक्सपर्ट सिस्टम्स, नॉलेज इंजीनियरिंग एवं दूसरा AI विंटर",
              "pages": "Page 05",
              "topics": [
                  "1980s Production Rule Systems: MYCIN & XCON / R1",
                  "Domain Heuristic Knowledge Bases & Inference Engines",
                  "Specialized LISP Machines & The 1987 Hardware Market Collapse",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Knowledge Bottleneck Analysis"
              ]
          },
          {
              "num": "04",
              "title": "The Statistical AI Renaissance & The Big Data Boom",
              "titleHi": "सांख्यिकीय AI का पुनर्जागरण एवं बिग डेटा क्रांति",
              "pages": "Page 06",
              "topics": [
                  "From Deductive Logic to Inductive Probabilistic Machine Learning",
                  "IBM Deep Blue 1997 Parallel Alpha-Beta Minimax Search",
                  "ImageNet 2012 Challenge & AlexNet Parallel GPU Acceleration",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Empirical Paradigm Shift"
              ]
          },
          {
              "num": "05",
              "title": "AI Evolution Timeline, Moore's Law & Compute Scaling",
              "titleHi": "AI विकास टाइमलाइन, मूर का नियम एवं कंप्यूट स्केलिंग",
              "pages": "Page 07",
              "topics": [
                  "77-Year Comprehensive AI Milestone Timeline (1950 to 2027)",
                  "Huang's Law: GPU Parallel Tensor Compute Outpacing Moore's Law",
                  "GFLOP Training Compute Cost Collapse from \\$1M to Sub-Cent Levels",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Compute Frontier Breakdown"
              ]
          },
          {
              "num": "06",
              "title": "AI Taxonomy: ANI vs AGI vs ASI & The Agency Horizons",
              "titleHi": "AI वर्गीकरण: ANI बनाम AGI बनाम ASI एवं स्वायत्तता क्षितिज",
              "pages": "Page 08",
              "topics": [
                  "Artificial Narrow Intelligence (ANI): Task-Specific Optimization",
                  "Artificial General Intelligence (AGI): Cross-Domain Reasoning & ARC-AGI",
                  "Artificial Superintelligence (ASI): Recursive Self-Improvement & Ethics",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Frontier Safety Bounds"
              ]
          },
          {
              "num": "07",
              "title": "Machine Learning Hierarchy & Fundamental Paradigms",
              "titleHi": "मशीन लर्निंग पदानुक्रम एवं मूलभूत प्रतिमान",
              "pages": "Page 09",
              "topics": [
                  "Concentric Hierarchy: AI vs Machine Learning vs Deep Learning vs GenAI",
                  "Supervised, Unsupervised, Semi-Supervised & Reinforcement Learning",
                  "Self-Supervised Learning: The Foundation of Modern Masked Models",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Mathematical Paradigm Map"
              ]
          },
          {
              "num": "08",
              "title": "Supervised Learning: Regressors, Classifiers & Loss Functions",
              "titleHi": "सुपरवाइज्ड लर्निंग: रिग्रेशन, क्लासिफायर एवं लॉस फंक्शन्स",
              "pages": "Page 10",
              "topics": [
                  "Linear & Logistic Regression: Maximum Likelihood & Logit Odds",
                  "Decision Trees, Random Forest Bagging & XGBoost Gradient Boosting",
                  "Mathematical Loss Functions: MSE, MAE, Binary & Categorical Cross-Entropy",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Optimization Trade-offs"
              ]
          },
          {
              "num": "09",
              "title": "Unsupervised Learning, Clustering & Dimensionality Reduction",
              "titleHi": "अनसुपरवाइज्ड लर्निंग, क्लस्टरिंग एवं डायमेंशनलिटी रिडक्शन",
              "pages": "Page 11",
              "topics": [
                  "K-Means Clustering: Centroid Voronoi Tesselation & Convergence",
                  "Principal Component Analysis (PCA): Eigenvalue Covariance Projection",
                  "Non-Linear Manifold Projections: t-SNE & UMAP for Embedding Latents",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Anomaly Detection Pipeline"
              ]
          },
          {
              "num": "10",
              "title": "Biological Neurons to Artificial Neurons & Activations",
              "titleHi": "जैविक न्यूरॉन से कृत्रिम न्यूरॉन एवं एक्टिवेशन फंक्शन्स",
              "pages": "Page 12",
              "topics": [
                  "Biological Dendrite-Axon Synapse vs Artificial Dot-Product Weights",
                  "Mathematical Activations: Sigmoid, Hyperbolic Tanh, ReLU & Leaky ReLU",
                  "Modern Transformer Activations: GeLU, Swish & Gated SwiGLU",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Vanishing Gradient Mitigations"
              ]
          },
          {
              "num": "11",
              "title": "Deep Neural Networks, Backpropagation & Optimizers",
              "titleHi": "डीप न्यूरल नेटवर्क, बैकप्रोपैगेशन एवं आधुनिक ऑप्टिमाइज़र्स",
              "pages": "Page 13",
              "topics": [
                  "Multi-Layer Perceptron (MLP) Forward Pass Matrix Formulation",
                  "Backpropagation Calculus: Recursive Chain Rule Error Propagation",
                  "Optimizers: SGD, Momentum, RMSprop, Adam & Decoupled Weight Decay AdamW",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Optimizer Convergence Audit"
              ]
          },
          {
              "num": "12",
              "title": "Convolutional Neural Networks (CNNs) & Computer Vision",
              "titleHi": "कन्वोल्यूशनल न्यूरल नेटवर्क (CNNs) एवं कंप्यूटर विजन",
              "pages": "Page 14",
              "topics": [
                  "Spatial Convolutions: 2D Filters, Strides, Zero-Padding & Receptive Fields",
                  "Pooling Layers: Spatial Downsampling & Translation Invariance",
                  "Modern Architectures: Residual Skip Connections (ResNet) & Real-Time YOLO",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Computer Vision Lab Checklist"
              ]
          },
          {
              "num": "13",
              "title": "Sequence Modeling: From Vanilla RNNs to LSTMs & GRUs",
              "titleHi": "अनुक्रम मॉडलिंग: सामान्य RNN से LSTM एवं GRU तक",
              "pages": "Page 15",
              "topics": [
                  "Sequential Recurrence: Hidden State Transitions & Temporal Backprop",
                  "The Exploding & Vanishing Gradient Trap in Long Sequences",
                  "Long Short-Term Memory (LSTM): Forget, Input & Output Gates with Cell State",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Gated Recurrent Unit Derivations"
              ]
          },
          {
              "num": "14",
              "title": "Hands-on Lab: Neural Network from Scratch in Pure NumPy",
              "titleHi": "प्रैक्टिकल लैब: शुद्ध NumPy में स्क्रैच से न्यूरल नेटवर्क",
              "pages": "Page 16",
              "topics": [
                  "Zero Framework Dependencies: Pure NumPy Vectorized Mathematics",
                  "Forward Propagation, Binary Cross-Entropy Loss & Analytical Gradients",
                  "Parameter Updates via Gradient Descent & Convergence Verification",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Full Python Source Listing"
              ]
          },
          {
              "num": "15",
              "title": "The 2017 Transformer Revolution: Attention Is All You Need",
              "titleHi": "2017 ट्रांसफार्मर क्रांति: 'अटेंशन इज़ ऑल यू नीड'",
              "pages": "Page 17",
              "topics": [
                  "Vaswani et al. 2017: Overcoming Sequential Recurrence Bottlenecks",
                  "Scaled Dot-Product Attention: Query, Key, and Value Tensor Projections",
                  "Multi-Head Attention (MHA) & Sinusoidal / Rotary Position Embeddings",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Transformer Mechanism Audit"
              ]
          },
          {
              "num": "16",
              "title": "Anatomy of Large Language Models: Tokens to Sampling",
              "titleHi": "लार्ज लैंग्वेज मॉडल्स की आंतरिक संरचना: टोकन से सैंपलिंग तक",
              "pages": "Page 18",
              "topics": [
                  "Byte-Pair Encoding (BPE), SentencePiece & WordPiece Tokenizers",
                  "Autoregressive Causal Masking & KV Cache Memory Footprint",
                  "Inference Decoding Dynamics: Temperature, Top-p (Nucleus) & Repetition Penalty",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Context Window Scaling Limits"
              ]
          },
          {
              "num": "17",
              "title": "The LLM Training Lifecycle: Pre-Training to Post-Training",
              "titleHi": "LLM ट्रेनिंग चक्र: प्री-ट्रेनिंग से पोस्ट-ट्रेनिंग और अलाइनमेंट तक",
              "pages": "Page 19",
              "topics": [
                  "Pre-Training on Trillions of Tokens: Next-Token Self-Supervised Objectives",
                  "Supervised Fine-Tuning (SFT) & Instruction Tuning Protocols",
                  "Human Alignment: RLHF with PPO vs Direct Preference Optimization (DPO)",
                  "End of Chapter: 3 Review Questions, 2 MCQs & LoRA / QLoRA PEFT Mechanics"
              ]
          },
          {
              "num": "18",
              "title": "Diffusion Models & Modern Multimodal Foundation Vision",
              "titleHi": "डिफ्यूजन मॉडल्स एवं आधुनिक मल्टीमॉडल विजन AI",
              "pages": "Page 20",
              "topics": [
                  "Denoising Diffusion Probabilistic Models (DDPM) & Forward Gaussian Noise",
                  "Reverse Denoising Process using U-Net & Diffusion Transformers (DiT)",
                  "Multimodal Joint Embedding Space: OpenAI CLIP Contrastive Learning",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Vision-Language Model Architectures"
              ]
          },
          {
              "num": "19",
              "title": "Enterprise Retrieval-Augmented Generation (RAG) Architecture",
              "titleHi": "एंटरप्राइज रिट्रीवल-ऑगमेंटेड जेनरेशन (RAG) आर्किटेक्चर",
              "pages": "Page 21",
              "topics": [
                  "Naive vs Advanced RAG: Semantic Chunking & Parent Document Retrieval",
                  "Vector Databases: Qdrant, Milvus, pgvector & HNSW Graph Indexing",
                  "Hybrid Search: Combining BM25 Lexical with Dense Vector Cosine Distance",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Cross-Encoder Re-Ranking Pipeline"
              ]
          },
          {
              "num": "20",
              "title": "Enterprise Prompt Engineering, Reasoning & Guardrails",
              "titleHi": "एंटरप्राइज प्रॉम्प्ट इंजीनियरिंग, रीजनिंग एवं गार्डरेल्स",
              "pages": "Page 22",
              "topics": [
                  "Zero-Shot, Few-Shot In-Context Learning & Structured Output Schemas",
                  "Chain-of-Thought (CoT), Self-Consistency & Tree-of-Thoughts (ToT)",
                  "Defensive Guardrails: NVIDIA NeMo, Llama Guard & Prompt Injection Defense",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Enterprise Production Guidelines"
              ]
          },
          {
              "num": "21",
              "title": "Autonomous Agentic AI, Tool Calling & State Machines",
              "titleHi": "स्वायत्त एजेंटिक AI, टूल कॉलिंग एवं स्टेट मशीन्स",
              "pages": "Page 23",
              "topics": [
                  "The ReAct Pattern: Interleaved Reasoning, Action, Tool Call & Observation",
                  "JSON Schema Function Calling at the Token Generation Boundary",
                  "Deterministic Multi-Agent Coordination via LangGraph Cyclic State Graphs",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Human-in-the-Loop Safeguards"
              ]
          },
          {
              "num": "22",
              "title": "Production Lab: End-to-End Enterprise RAG with LangChain",
              "titleHi": "प्रोडक्शन लैब: LangChain के साथ सम्पूर्ण एंटरप्राइज RAG",
              "pages": "Page 24",
              "topics": [
                  "Document Loading, Recursive Splitting & High-Dimensional Embeddings",
                  "In-Memory Vector Store Upsert & Hybrid Similarity Retrieval",
                  "Multi-Turn Grounded Context Prompting with Citation Verification",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Full Runnable Script"
              ]
          },
          {
              "num": "23",
              "title": "Enterprise AI Compute Infrastructure & GPU Clusters",
              "titleHi": "एंटरप्राइज AI कंप्यूट इन्फ्रास्ट्रक्चर एवं GPU क्लस्टर्स",
              "pages": "Page 25",
              "topics": [
                  "NVIDIA Hopper H100 vs Blackwell B200 Architecture & Tensor Cores",
                  "High Bandwidth Memory (HBM3e) & NVLink 900 GB/s Interconnect Fabrics",
                  "Infiniband RoCE Networking & Datacenter Thermal Power Densities",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Hardware Benchmark Comparison"
              ]
          },
          {
              "num": "24",
              "title": "Global AI Geopolitics, Silicon Supply Chains & Sovereignty",
              "titleHi": "वैश्विक AI भू-राजनीति, सिलिकॉन सप्लाई चेन एवं संप्रभुता",
              "pages": "Page 26",
              "topics": [
                  "US CHIPS Act & Advanced Semiconductor Export Control Regimes",
                  "ASML Extreme Ultraviolet (EUV) Monopolies & TSMC Advanced Packaging",
                  "Sovereign Datacenters & Critical Infrastructure Self-Reliance",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Global Supply Chain Vulnerabilities"
              ]
          },
          {
              "num": "25",
              "title": "India's Sovereign AI Revolution: The IndiaAI Mission",
              "titleHi": "भारत की संप्रभु AI क्रांति: ₹10,372 करोड़ का IndiaAI मिशन",
              "pages": "Page 27",
              "topics": [
                  "Government of India's ₹10,372.54 Crore Sovereign AI Cabinet Allocation",
                  "10,000+ GPU National Compute Grid & Subsidized Startup Compute Access",
                  "IndiaAI Datasets Platform & Sovereign Foundation Model Innovation Centers",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Strategic National Impact"
              ]
          },
          {
              "num": "26",
              "title": "Sovereign Indic LLMs & India's Digital Public Goods",
              "titleHi": "स्वदेशी इंडिक LLMs एवं भारत का डिजिटल पब्लिक इन्फ्रास्ट्रक्चर",
              "pages": "Page 28",
              "topics": [
                  "Sarvam AI: Open Indic Foundation Models (Sarvam 2B, Bulbul TTS, Saaras)",
                  "Krutrim AI: Multilingual 22 Scheduled Indian Language Foundation Stack",
                  "Project Bhashini: Real-Time Multilingual NLP & Speech Translation API",
                  "End of Chapter: 3 Review Questions, 2 MCQs & UPI/Aadhaar DPI Integration"
              ]
          },
          {
              "num": "27",
              "title": "Industrial Case Studies: High-Impact Enterprise Deployments",
              "titleHi": "औद्योगिक केस स्टडीज: हेल्थकेयर, फिनटेक एवं ऑटोनॉमस व्हीकल्स",
              "pages": "Page 29",
              "topics": [
                  "DeepMind AlphaFold 3: Protein Structure Prediction & Drug Discovery",
                  "FinTech Fraud Detection: Sub-10ms Graph Neural Networks on Transaction Streams",
                  "Autonomous Driving: Tesla FSD End-to-End Neural Networks vs Waymo LiDAR",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Enterprise ROI Metric Analysis"
              ]
          },
          {
              "num": "28",
              "title": "Production Lab: Serving Foundation Models with vLLM",
              "titleHi": "प्रोडक्शन लैब: vLLM एवं PagedAttention के साथ मॉडल सर्विंग",
              "pages": "Page 30",
              "topics": [
                  "vLLM High-Throughput Serving Engine & OpenAI-Compatible REST Endpoints",
                  "PagedAttention: Managing Non-Contiguous KV Cache Virtual Memory",
                  "Continuous Iteration-Level Batching & Benchmarking Tokens Per Second",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Production Serving Metrics"
              ]
          },
          {
              "num": "29",
              "title": "The 2027 AI Job Market Landscape & ₹38 LPA Salary Ladder",
              "titleHi": "2027 AI जॉब मार्केट परिदृश्य एवं ₹38 LPA सैलरी लैडर",
              "pages": "Page 31",
              "topics": [
                  "Software 2.0 Shift: Why Algorithmic Engineers Must Master Applied AI",
                  "Compensation Matrix: Entry Associate (₹4.5L–₹9L) to Principal (₹38L–₹65L+)",
                  "India Tier-1 Tech Hubs (Bengaluru, Hyderabad, Pune, NCR) vs US Remote",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Compensation Negotiation Strategy"
              ]
          },
          {
              "num": "30",
              "title": "Six High-Paying AI Specializations & Technical Stack Matrix",
              "titleHi": "छह हाई-पेइंग AI विशेषज्ञताएं एवं टेक्निकल स्टैक मैट्रिक्स",
              "pages": "Page 32",
              "topics": [
                  "Track 1: Generative AI / LLM Engineer (RAG, Vector Databases & Prompting)",
                  "Track 2: Autonomous Agentic Architect & Track 3: Production LLMOps / Infra",
                  "Track 4: Computer Vision / VLMs, Track 5: AI Researcher & Track 6: AI Product Manager",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Specialization Selection Guide"
              ]
          },
          {
              "num": "31",
              "title": "0-to-6 Month Structured AI Learning Roadmap & Habit Tracker",
              "titleHi": "0 से 6 महीने का सम्पूर्ण AI लर्निंग रोडमैप एवं डेली हैबिट ट्रैकर",
              "pages": "Page 33",
              "topics": [
                  "Month 1-2: Python 3.12, Vector Math, PyTorch & Classical Machine Learning",
                  "Month 3-4: Transformer Deep Dive, Production RAG & Local vLLM Serving",
                  "Month 5-6: Multi-Agent Swarms, Production Dockerization & System Design",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Daily 2-Hour Habit System"
              ]
          },
          {
              "num": "32",
              "title": "The Million-Dollar AI Project Portfolio: 5 Flagship Repos",
              "titleHi": "मिलियन-डॉलर AI प्रोजेक्ट पोर्टफोलियो: 5 फ्लैगशिप गिटहब प्रोजेक्ट्स",
              "pages": "Page 34",
              "topics": [
                  "Project 1: Multi-Tenant Enterprise Knowledge Assistant with Hybrid Search",
                  "Project 2: Autonomous Multi-Agent Financial Research Swarm with LangGraph",
                  "Projects 3-5: Edge Vision Defect Detector, Indic Medical Bot & LLM Gateway",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Portfolio Presentation Protocols"
              ]
          },
          {
              "num": "33",
              "title": "ATS-Optimized AI Resume Engineering: 25 STAR Bullets",
              "titleHi": "ATS-अनुकूलित AI रेज्युमे इंजीनियरिंग: 25 STAR इम्पैक्ट बुलेट्स",
              "pages": "Page 35",
              "topics": [
                  "Applicant Tracking System (ATS) Algorithms & Semantic Keyword Matching",
                  "25 Battle-Tested Resume Bullets with Quantifiable Metrics (Latency, Cost)",
                  "Formatting Rules, Critical Red Flags & GitHub / Hugging Face Hyperlinks",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Recruiter Screen Passing Checklist"
              ]
          },
          {
              "num": "34",
              "title": "Global & Indian AI Certification Playbook & ROI Audit",
              "titleHi": "ग्लोबल एवं इंडियन AI सर्टिफिकेशन प्लेबुक एवं ROI विश्लेषण",
              "pages": "Page 36",
              "topics": [
                  "AWS Certified Machine Learning Specialty & Azure AI Engineer Associate (AI-102)",
                  "Google Cloud Professional ML Engineer & NVIDIA Deep Learning Institute (DLI)",
                  "Cost vs Salary ROI Analysis: Which Certifications Fast-Track Hiring",
                  "End of Chapter: 3 Review Questions, 2 MCQs & 6-Week Certification Study Blueprint"
              ]
          },
          {
              "num": "35",
              "title": "Freelance AI Consulting, Agency Blueprint & Client Outreach",
              "titleHi": "फ्रीलांस AI कंसल्टिंग, एजेंसी ब्लूप्रिंट एवं क्लाइंट अधिग्रहण",
              "pages": "Page 37",
              "topics": [
                  "The 2027 Freelance AI Services Menu: Enterprise RAG & Workflow Automations",
                  "Consulting Rate Card: Hourly (₹3.5k–₹7.5k), Retainers & Fixed Project Pricing",
                  "Cold Outreach Playbook: Contacting Founders via LinkedIn & Loom Audits",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Client Service Agreement Essentials"
              ]
          },
          {
              "num": "36",
              "title": "Career Transition Playbook: Software Dev to AI Specialist",
              "titleHi": "करियर ट्रांजिशन प्लेबुक: सॉफ्टवेयर इंजीनियर से AI विशेषज्ञ तक",
              "pages": "Page 38",
              "topics": [
                  "Leveraging Existing Strengths: APIs, Databases, Docker & CI/CD Pipelines",
                  "Closing the Probabilistic Gap: Navigating Stochasticity vs Deterministic Code",
                  "Overcoming Imposter Syndrome & 90-Day Enterprise Transition Sprint",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Senior Engineer Upskilling Plan"
              ]
          },
          {
              "num": "37",
              "title": "Top 50 MNC AI Interview Vault: Core ML & Math Intuition",
              "titleHi": "टॉप 50 MNC AI इंटरव्यू वॉल्ट: कोर ML एवं गणितीय अंतर्ज्ञान",
              "pages": "Page 39",
              "topics": [
                  "Questions 1-6: Backpropagation Chain Rule & Parameter Gradient Derivations",
                  "Bias-Variance Tradeoff, AdamW Decoupled Weight Decay & Cross-Entropy",
                  "Why ReLU/GeLU Replaced Sigmoid & Residual Gradient Highway Proofs",
                  "End of Chapter: 3 Review Questions, 2 MCQs & STAR-T Interview Framing"
              ]
          },
          {
              "num": "38",
              "title": "Top 50 MNC AI Interview Vault: Deep Learning & Transformers",
              "titleHi": "टॉप 50 MNC AI इंटरव्यू वॉल्ट: डीप लर्निंग एवं ट्रांसफार्मर संरचना",
              "pages": "Page 40",
              "topics": [
                  "Questions 7-12: CNN Translation Invariance, RNN Temporal Bottlenecks",
                  "Scaled Dot-Product Derivations: Why Scaling by sqrt(d_k) Prevents Saturation",
                  "Multi-Head vs Multi-Query vs Grouped-Query Attention (GQA) & RoPE",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Modern Attention Breakdown"
              ]
          },
          {
              "num": "39",
              "title": "Top 50 MNC AI Interview Vault: Modern LLMs & Production RAG",
              "titleHi": "टॉप 50 MNC AI इंटरव्यू वॉल्ट: मॉडर्न LLMs एवं प्रोडक्शन RAG",
              "pages": "Page 41",
              "topics": [
                  "Questions 13-18: KV Cache Scaling, FlashAttention SRAM Tiling & MoE Routing",
                  "Quantization: AWQ vs GPTQ vs FP8 & Hoffmann Chinchilla Scaling Laws",
                  "Questions 19-24: Semantic Chunking, Hybrid Search BM25+Dense & GraphRAG",
                  "End of Chapter: 3 Review Questions, 2 MCQs & RAG Triad Evaluation Framework"
              ]
          },
          {
              "num": "40",
              "title": "Top 50 MNC AI Interview Vault: Agents & 10M-Query System Design",
              "titleHi": "टॉप 50 MNC AI इंटरव्यू वॉल्ट: एजेंटिक AI एवं 10M सिस्टम डिजाइन",
              "pages": "Page 42",
              "topics": [
                  "Questions 25-36: LoRA / QLoRA PEFT Math, DPO vs RLHF & ReAct Loops",
                  "Questions 37-43: vLLM PagedAttention, Continuous Batching & Model Context Protocol",
                  "Questions 44-50: Designing a 10M Requests/Day Multi-Tenant Enterprise Copilot",
                  "End of Chapter: 3 Review Questions, 2 MCQs & High-Concurrency System Blueprint"
              ]
          },
          {
              "num": "41",
              "title": "AI Safety, Ethics, Copyright & Global AI Governance",
              "titleHi": "AI सुरक्षा, नैतिकता, कॉपीराइट एवं वैश्विक AI शासन नियम",
              "pages": "Page 43",
              "topics": [
                  "EU AI Act Four-Tier Risk Classification: Unacceptable to Minimal Risk",
                  "Training Data Copyright, Fair Use Doctrines & Synthetic Provenance Watermarking",
                  "Deepfake Detection Cryptography & Alignment Safety Red-Teaming",
                  "End of Chapter: 3 Review Questions, 2 MCQs & Responsible AI Engineering Charter"
              ]
          },
          {
              "num": "42",
              "title": "Official RTechLab Certificate of Mastery & Verification",
              "titleHi": "ऑफिशियल RTechLab सर्टिफिकेट ऑफ मास्टरी एवं सत्यापन",
              "pages": "Page 44",
              "topics": [
                  "Formal RTechLab 2027 Artificial Intelligence Commercial Certification",
                  "Verified Serial Code: RTL-2027-AI-COMMERCIAL-ED1 with QR Verification",
                  "Chief Technology Architect Endorsement & Lifetime Alumni Network Access",
                  "Final Commercial Sign-off: Technology Made Practical · Learn. Practice. Innovate."
              ]
          }
      ],
      "bestBuyCombo": {
          "id": "combo-ai-office",
          "title": "AI Engineer & Enterprise MIS Modern Suite Combo",
          "titleHi": "AI इंजीनियर एवं एंटरप्राइज MIS मॉडर्न सुइट कॉम्बो",
          "desc": "Artificial Intelligence Master Suite (112 Pages) + Microsoft Office 365 Enterprise (113 Pages). Complete corporate data & automation supremacy.",
          "price": 79,
          "originalPrice": 98,
          "savings": "Save ₹19 (20% OFF)",
          "pairedSubject": "office365"
      }
  },
  {
    id: 'office365',
    code: 'RTL-2027-O365',
    badge: 'FLAGSHIP 2027',
    badgeColor: 'text-[#EA580C] bg-[#EA580C]/10 border-[#EA580C]/30',
    title: 'Microsoft Office 365 Master Guide',
    titleHi: 'माइक्रोसॉफ्ट ऑफिस 365 मास्टर गाइड (Office 365 Enterprise)',
    tagline: 'Word 365, Excel 365 Enterprise, PowerPoint 365, Copilot AI, OneDrive Co-Authoring & 50 MIS Interview Vault',
    taglineHi: 'वर्ड 365, एक्सेल 365 एंटरप्राइज, पावरपॉइंट 365, कोपायलट AI, वनड्राइव सह-लेखन एवं 50 MIS इंटरव्यू वॉल्ट',
    price: 49,
    bundlePrice: 149,
    pages: '113 Pages (Complete Master Edition)',
    pagesNum: 113,
    edition: 'Edition 1 (2027 Master Edition)',
    author: 'Rahul Patel (Founder & Chief Architect, RTechLab)',
    accentColor: '#0284C7',
    previewPdfEn: '/downloads/Office-365-English-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Office-365-English-Edition-1.pdf',
    previewPdfHi: '/downloads/Office-365-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',
    previewPdfGu: '/downloads/Office-365-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfGu: '/downloads/Office-365-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/Office-365-Career-Accelerator-Bundle.zip',
    photoHighlights: [
      'Word 365 Modern Ribbon & Immersive Reader Workspace',
      'Multilevel Numbered Outline & Styles Taxonomy',
      'Excel 1,048,576 Rows Formula Calculation Engine',
      'Dynamic Arrays (#SPILL, FILTER, SORT, UNIQUE)',
      'Power Query Modern ETL Transform Pipeline',
      'PowerPoint 16:9 Widescreen 6x6 Executive Rule',
      'Slide Master Parent Hierarchy & Brand Themes (.potx)',
      'Boolean Merge Shapes (Union, Fragment, Subtract)',
      'Cinematic Morph 60 FPS Coordinate Interpolation (!!)',
      'OneDrive Delta Sync & Real-Time Co-Authoring Presence',
      'Microsoft Copilot AI Graph Grounding & Prompt Framework',
      'Top 100 Corporate Shortcuts & Top 50 MIS Interview Vault',
      '6 Ready-to-Use Practice Templates (.docx Cover Page & ATS Resume, .xlsx Payroll, Marksheet & GST Invoices)',
    ],
    chapters: [
      {
        num: '01',
        title: 'Modern Word 365 Architecture, Workspace & Immersive Reader',
        titleHi: 'आधुनिक वर्ड 365 संरचना, कार्यक्षेत्र एवं इमर्सिव रीडर',
        pages: 'Pages 03–05',
        topics: [
          'The Modern Microsoft Word 365 Ecosystem & Fluid Ribbon',
          'Canvas Geometry: Standard Page Sizes, Margins & Orientation',
          'Cognitive Ergonomics: Immersive Reader, Read Aloud & Dark Mode',
          'End of Chapter: 4 Review Questions, 3 Verified MCQs & 2027 Cloud Sync Spotlight',
        ],
      },
      {
        num: '02',
        title: 'Advanced Document Formatting, Semantic Styles & Navigation',
        titleHi: 'उन्नत दस्तावेज फॉर्मेटिंग, स्टाइल्स एवं नेविगेशन पेन',
        pages: 'Pages 06–08',
        topics: [
          'Paragraph Architecture: Leading, Tracking & Optical Alignment',
          'The Power of Semantic Heading Styles (Heading 1 to 9)',
          'The Navigation Pane: Interactive Document Structural Tree',
          'End of Chapter: 4 Review Questions, 3 Verified MCQs & Format Painter Shortcut',
        ],
      },
      {
        num: '03',
        title: 'Precision Typography, Kerning, Drop Caps & Multilingual Script',
        titleHi: 'सटीक टाइपोग्राफी, कर्निंग, ड्रॉप कैप्स एवं बहुभाषी स्क्रिप्ट',
        pages: 'Pages 09–11',
        topics: [
          'Professional Typography Hierarchy & Enterprise Font Families',
          'Character Formatting, Kerning, Tracking & Small Caps',
          'Drop Caps, Lead Paragraph Styling & Editorial Layouts',
          'Multilingual Document Processing & Indian Regional Scripts',
        ],
      },
      {
        num: '04',
        title: 'Section Breaks, Multi-Orientation Layouts & Complex Pagination',
        titleHi: 'सेक्शन ब्रेक्स, मिश्रित लेआउट्स एवं जटिल पृष्ठ क्रमांकन',
        pages: 'Pages 12–14',
        topics: [
          'Section Breaks: Next Page, Continuous, Even & Odd Partitioning',
          'Mixed Orientation Layouts (Portrait & Landscape within one file)',
          'Complex Header & Footer Unlinking (Link to Previous)',
          'Automated Roman (i, ii) and Arabic (1, 2) Numbering Partitioning',
        ],
      },
      {
        num: '05',
        title: 'Enterprise Tabular Data Design, Cell Padding & Math Formulas',
        titleHi: 'एंटरप्राइज टेबल डिजाइन, सेल पैडिंग एवं गणितीय सूत्र',
        pages: 'Pages 15–18',
        topics: [
          'The Anatomy of a Professional Table & Alignment Grid',
          'Precision Cell Margins, Column Widths & AutoFit Optimization',
          'Repeating Header Rows across Multi-Page Tables',
          'Embedded Table Math: Formulas (=SUM, =AVERAGE) without Excel',
        ],
      },
      {
        num: '06',
        title: 'Visual Media Architecture, Shapes, SmartArt & Text Wrapping',
        titleHi: 'विजुअल मीडिया, आकृतियां, स्मार्टआर्ट एवं टेक्स्ट रैपिंग',
        pages: 'Pages 19–21',
        topics: [
          'Text Wrapping Physics: In Line, Square, Tight, Through & Behind',
          'Vector Graphic Engineering: Scalable SVGs vs Raster Images',
          'SmartArt Process Diagrams, Hierarchies & Org Charts',
          'Professional Drop Shadows, Bezels & Corporate Image Frames',
        ],
      },
      {
        num: '07',
        title: 'Academic & Enterprise Referencing, Auto-TOC & Cross-References',
        titleHi: 'शैक्षणिक संदर्भ, स्वचालित अनुक्रमणिका एवं क्रॉस-रेफरेंस',
        pages: 'Pages 22–25',
        topics: [
          'Automated Table of Contents (TOC) Generation from Heading Styles',
          'Footnotes vs Endnotes: Scholarly & Corporate Legal Standards',
          'Automated Bibliography & Citation Engines (APA, MLA, IEEE)',
          'Dynamic Cross-References & Self-Updating Bookmark Links',
        ],
      },
      {
        num: '08',
        title: 'Collaboration, Track Changes, Co-Authoring & Document Protection',
        titleHi: 'सहयोग, ट्रैक चेंजेस, लाइव सह-लेखन एवं दस्तावेज सुरक्षा',
        pages: 'Pages 26–28',
        topics: [
          'Track Changes Mechanics: Revisions, Insertions & Strikethroughs',
          'Modern Threaded Comments, @Mentions & Review Workflow',
          'Compare and Combine Documents: Merging Reviewer Revisions',
          'Document Protection, Editing Restrictions & Password Encryption',
        ],
      },
      {
        num: '09',
        title: 'Enterprise Mail Merge Automation & Outlook Bulk Dispatch',
        titleHi: 'एंटरप्राइज मेल मर्ज ऑटोमेशन एवं आउटलुक थोक डिस्पैच',
        pages: 'Pages 29–31',
        topics: [
          'The 3 Pillars of Mail Merge: Form Letter, Data Source & Merged Docs',
          'Connecting Excel Spreadsheets & Access Databases as Data Sources',
          'Rules & Conditional Logic: IF...THEN...ELSE Field Prompts',
          'Formatting Pitfalls: Preserving Date and Currency Picture Switches',
        ],
      },
      {
        num: '10',
        title: 'Capstone Production Labs: Corporate Report & Technical Proposal',
        titleHi: 'व्यावहारिक लैब्स: कॉर्पोरेट वार्षिक रिपोर्ट एवं तकनीकी प्रस्ताव',
        pages: 'Pages 32–34',
        topics: [
          'Production Lab 01: 20-Page Corporate Annual Report Design',
          'Production Lab 02: Multi-Section Government Tender RFP Proposal',
          'Production Lab 03: Automated Certificate & Bulk Offer Letter Dispatch',
          'Comprehensive Word 365 Mastery Checklist & Certification Exam Guide',
        ],
      },
      {
        num: '11',
        title: 'Excel 365 Grid Engine, Big Data Limits & Navigation',
        titleHi: 'एक्सेल 365 ग्रिड इंजन, डेटा सीमाएं एवं नेविगेशन दक्षता',
        pages: 'Pages 35–37',
        topics: [
          'The Big Data Grid Architecture: 1,048,576 Rows × 16,384 Columns',
          'Data Types & Coercion: Text, Numbers, Dates, Booleans & Errors',
          'High-Velocity Keyboard Navigation & Smart Range Selection',
          'Workbook Structure, Multi-Sheet Management & View Splits',
        ],
      },
      {
        num: '12',
        title: 'Precision Cell Referencing: Relative, Absolute, Mixed & 3D',
        titleHi: 'सेल रेफरेंसिंग: रिलेटिव, एब्सोल्यूट, मिक्स्ड एवं 3D रेफरेंस',
        pages: 'Pages 38–41',
        topics: [
          'The Golden Rule of Cell References: Dynamic Formulas vs Hardcoding',
          'Relative vs Absolute References ($A$1) and the F4 Toggle Key',
          'Mastering Mixed References ($A1 vs A$1) for Cross-Multiplication',
          '3D Multi-Sheet References across Standardized Ledger Tabs',
        ],
      },
      {
        num: '13',
        title: 'Core Mathematical, Statistical & Logical Functions',
        titleHi: 'गणितीय, सांख्यिकीय एवं तार्किक फॉर्मूले (IF, AND, OR, IFS)',
        pages: 'Pages 42–45',
        topics: [
          'Foundational Math: SUM, PRODUCT, MOD, ROUND, ROUNDUP, ROUNDDOWN',
          'Descriptive Statistics: AVERAGE, MEDIAN, MODE.SNGL, MIN, MAX',
          'Logical Decision Trees: Boolean Logic, IF, AND, OR, NOT',
          'Modern Multi-Condition Logic: Nested IF vs =IFS() vs =SWITCH()',
        ],
      },
      {
        num: '14',
        title: 'Conditional Aggregation Engines: SUMIFS, COUNTIFS & AVERAGEIFS',
        titleHi: 'कंडीशनल एग्रीगेशन इंजन: SUMIFS, COUNTIFS एवं AVERAGEIFS',
        pages: 'Pages 46–49',
        topics: [
          'Single-Criterion Aggregations: SUMIF, COUNTIF, AVERAGEIF',
          'Enterprise Multi-Criteria Engine: SUMIFS, COUNTIFS, AVERAGEIFS',
          'Wildcard Matching: Asterisk (*), Question Mark (?), and Tilde (~)',
          'Dynamic Date-Ranged Criteria Aggregations with Cell References',
        ],
      },
      {
        num: '15',
        title: 'Modern Lookup & Reference: VLOOKUP, HLOOKUP, INDEX, MATCH & XLOOKUP',
        titleHi: 'आधुनिक लुकअप इंजन: VLOOKUP, INDEX/MATCH एवं XLOOKUP',
        pages: 'Pages 50–53',
        topics: [
          'VLOOKUP Mechanics, Approximate Match Traps & Column Index Frailty',
          'HLOOKUP Horizontal Table Scans & Matrix Architectures',
          'The High-Performance Classic: INDEX and MATCH Two-Way Lookups',
          'The Modern King: =XLOOKUP() Complete Operational Mastery',
        ],
      },
      {
        num: '16',
        title: 'Dynamic Array Revolution: FILTER, SORT, UNIQUE, SEQUENCE & Spill',
        titleHi: 'डायनामिक एरे क्रांति: FILTER, SORT, UNIQUE, SEQUENCE एवं स्पिल',
        pages: 'Pages 54–56',
        topics: [
          'The Dynamic Array Calculation Architecture & The Spill Range (#)',
          'Diagnosing and Resolving the #SPILL! Error Collisions',
          'Filtering Datasets in Real-Time: The =FILTER() Masterclass',
          'Deduplicating & Sorting: =UNIQUE(), =SORT(), and =SORTBY()',
        ],
      },
      {
        num: '17',
        title: 'Advanced Text, String Manipulation & Data Sanitization Engines',
        titleHi: 'उन्नत टेक्स्ट, स्ट्रिंग हेरफेर एवं डेटा सैनिटाइजेशन इंजन',
        pages: 'Pages 57–60',
        topics: [
          'Extracting Substrings: LEFT, RIGHT, MID & Token Slicing',
          'Data Sanitization: TRIM, CLEAN, UPPER, LOWER, PROPER',
          'String Concatenation: Modern =TEXTJOIN() vs Legacy CONCATENATE',
          'Modern Dynamic Text Slicers: =TEXTSPLIT, =TEXTBEFORE, =TEXTAFTER',
        ],
      },
      {
        num: '18',
        title: 'Date, Time, Financial Engineering & Advanced Statistical Analysis',
        titleHi: 'दिनांक, समय, वित्तीय इंजीनियरिंग (PMT, NPV, IRR) एवं सांख्यिकी',
        pages: 'Pages 61–64',
        topics: [
          'Excel Serial Date Architecture (1900 Base) & Time Fractions',
          'The Secret =DATEDIF() Function: Exact Age & Tenure Calculations',
          'Business Day Calendars: WORKDAY, NETWORKDAYS, EDATE & EOMONTH',
          'Enterprise Financial Modeling: Loan Amortization (PMT, IPMT, PPMT), NPV & IRR',
        ],
      },
      {
        num: '19',
        title: 'Data Validation, Dependent Dropdowns & Error Diagnostics',
        titleHi: 'डेटा वैलिडेशन, कैस्केडिंग ड्रॉपडाउन एवं एरर डायग्नोस्टिक्स',
        pages: 'Pages 65–68',
        topics: [
          'Data Validation Architecture: Restricting Input Types & Date Bounds',
          'Dynamic In-Cell Dropdown Menus from Spilled Array Ranges',
          'Cascading Dependent Dropdown Lists via The =INDIRECT() Engine',
          'Universal Error Triage: Handling #N/A, #VALUE!, #REF!, #DIV/0!, #NAME?',
        ],
      },
      {
        num: '20',
        title: 'Visual Data Storytelling: Charts, Sparklines & Conditional Formatting',
        titleHi: 'विजुअल डेटा स्टोरीटेलिंग: चार्ट्स, स्पार्कलाइन्स एवं कंडीशनल फॉर्मेटिंग',
        pages: 'Pages 69–72',
        topics: [
          'Conditional Formatting Engine: Data Bars, Color Scales & Icon Sets',
          'Formula-Driven Conditional Formatting: Dynamic Row Highlighting',
          'Micro-Visualizations: In-Cell Sparklines (Line, Column, Win/Loss)',
          'Executive Charting: Clustered Columns, Waterfall, Pareto & Combo Dual-Axis',
        ],
      },
      {
        num: '21',
        title: 'Structured Excel Tables, Slicers & PivotTable Analytics',
        titleHi: 'एक्सेल टेबल्स, स्लाइसर एवं पिवट टेबल एनालिटिक्स',
        pages: 'Pages 73–76',
        topics: [
          'Structured Excel Tables (Ctrl + T) & Structured Specifiers ([@Amt])',
          'PivotTable Architecture: The Pivot Cache & 4-Quadrant Field Layout',
          'Interactive Visual Slicers & Dynamic Date Timelines',
          'Calculated Fields, Calculated Items & Grouping Chronological Dates',
        ],
      },
      {
        num: '22',
        title: 'Power Query ETL, Automated Data Cleanup & 3 Enterprise Labs',
        titleHi: 'पावर क्वेरी ETL, स्वचालित डेटा सफाई एवं 3 एंटरप्राइज लैब्स',
        pages: 'Pages 77–80',
        topics: [
          'The Power Query Ingestion Architecture (Get & Transform Data)',
          'Essential Transformations: Unpivoting Columns, Split Columns & Typecasting',
          'Production Lab 01: Retail Banking Loan EMI Amortization Schedule',
          'Production Lab 02: Dynamic Supply Chain Inventory Reorder Engine',
        ],
      },
      {
        num: '23',
        title: 'PowerPoint 365 Architecture, 6x6 Corporate Rule & Typography',
        titleHi: 'पावरपॉइंट 365 संरचना, 6x6 कॉर्पोरेट नियम एवं विजुअल टाइपोग्राफी',
        pages: 'Pages 81–83',
        topics: [
          'The Modern 16:9 Widescreen Canvas & Smart Guides Grid (Shift+F9)',
          'The Sacred 6x6 Presentation Rule & Cognitive Load Reduction',
          'Executive Typography Hierarchy & Sans-Serif Font Pairing',
          'The 4 Universal Corporate Deck Archetypes: C-Suite, Pitch, RFP, Sales',
        ],
      },
      {
        num: '24',
        title: 'Slide Master Architecture, Custom Layouts & Brand Template Engineering',
        titleHi: 'स्लाइड मास्टर संरचना, कस्टम लेआउट्स एवं ब्रांड टेम्पलेट (.potx)',
        pages: 'Pages 84–86',
        topics: [
          'The Two-Tier Slide Master Hierarchy (Parent Master vs Child Layouts)',
          'Engineered Dynamic Placeholders vs Static Text Boxes',
          'Building a Protected Corporate Brand Template (.potx) with Locked Logos',
          'Managing Multiple Slide Masters & Preserve Master Protection',
        ],
      },
      {
        num: '25',
        title: 'Vector Graphic Engineering, Boolean Shape Operations & SmartArt Systems',
        titleHi: 'वेक्टर ग्राफिक इंजीनियरिंग, बूलियन मर्ज शेप्स एवं स्मार्टआर्ट',
        pages: 'Pages 87–89',
        topics: [
          'The 5 Boolean Merge Shape Operations: Union, Combine, Fragment, Intersect, Subtract',
          'Professional Scalable Vector Graphics (SVG) & Convert to Shape',
          'Converting Bullets to SmartArt & Ungrouping (Ctrl+Shift+G) to Vector Shapes',
          'Production Blueprint: Bespoke 4-Step Agile Delivery Pipeline Diagram',
        ],
      },
      {
        num: '26',
        title: 'Slide Transitions, Cinematic Motion & The 2027 Morph Revolution',
        titleHi: 'स्लाइड ट्रांजिशन्स, सिनेमैटिक मोशन एवं 2027 मॉर्फ (Morph) क्रांति',
        pages: 'Pages 90–92',
        topics: [
          'Morph Mechanics: Automatic Coordinate & Size Vector Interpolation',
          'The Secret Double-Exclamation (!!) Forced Morph Technique',
          'Corporate Transition Discipline: Fade (0.5s) vs Push vs Banned Transitions',
          'Interactive Presentation Navigation: Summary Zoom & Section Portals',
        ],
      },
      {
        num: '27',
        title: 'Dynamic Object Animation Choreography, Triggers & Enterprise Media',
        titleHi: 'ऑब्जेक्ट एनिमेशन, टाइमिंग ट्रिगर्स एवं एंटरप्राइज मीडिया',
        pages: 'Pages 93–95',
        topics: [
          'The 4 Animation Archetypes: Entrance, Emphasis, Exit & Motion Paths',
          'The 3 Timing Triggers: On Click vs With Previous vs After Previous',
          'Media Engineering: H.264 MP4 Playback, Trimming, Fade & Media Compression',
          'Interactive Software Demonstrations via Embedded Video Bookmark Triggers',
        ],
      },
      {
        num: '28',
        title: 'Executive Delivery Dynamics, Presenter View & 3 PPT Production Labs',
        titleHi: 'कार्यकारी प्रस्तुति कौशल, प्रेजेंटर व्यू एवं 3 पूर्ण व्यावसायिक लैब्स',
        pages: 'Pages 96–98',
        topics: [
          'Presenter View Navigation & Live Keyboard Shortcuts (B, W, Ctrl+L, Ctrl+P)',
          'Production Lab 01: Series-A Venture Capital Pitch Deck (12 Slides)',
          'Production Lab 02: Enterprise Cloud Product Launch Deck',
          'Production Lab 03: Interactive Corporate Training Deck with Branching Logic',
        ],
      },
      {
        num: '29',
        title: 'The Microsoft 365 Cloud Ecosystem, OneDrive Sync & Real-Time Co-Authoring',
        titleHi: 'माइक्रोसॉफ्ट 365 क्लाउड इकोसिस्टम, वनड्राइव सिंक एवं सह-लेखन',
        pages: 'Pages 99–101',
        topics: [
          'OneDrive for Business Architecture & AutoSave Differential Delta Sync',
          'Real-Time Collaborative Co-Authoring, Multi-User Presence & @Mentions',
          'Version History, Granular Timestamped Snapshots & 1-Click Rollback',
          'Enterprise Access Governance: Sharing Tiers, Block Download & Sensitivity Labels',
        ],
      },
      {
        num: '30',
        title: 'Microsoft 365 Copilot AI Integration & Corporate Prompt Engineering',
        titleHi: 'माइक्रोसॉफ्ट 365 कोपायलट (Copilot AI) एकीकरण एवं प्रॉम्प्ट इंजीनियरिंग',
        pages: 'Pages 102–104',
        topics: [
          'Copilot System Architecture, Azure OpenAI & Microsoft Graph Grounding',
          'Copilot across Word, Excel (=PY Python Integration), and PowerPoint',
          'The 4-Tier Enterprise Prompt Engineering Framework (Goal, Context, Source, Expectations)',
          'Automated Multi-App Synthesis: From Raw Negotiation to Final Presentation Deck',
        ],
      },
      {
        num: '31',
        title: 'The Top 100 Corporate Keyboard Shortcuts Master Reference Vault',
        titleHi: 'शीर्ष 100 कॉर्पोरेट कीबोर्ड शॉर्टकट्स मास्टर संदर्भ वॉल्ट',
        pages: 'Pages 105–108',
        topics: [
          'Word 365 Power Shortcuts (1-25): Structural Page Breaks, Heading Styles & Case Cycles',
          'Excel 365 Data Entry & Formula Shortcuts (26-55): F4 Toggle, AutoSum, Flash Fill & Range Bounds',
          'Excel Advanced Modeling & PowerPoint Shortcuts (56-85): Paste Special, Pivot Tables & Master Guides',
          'PowerPoint Live Show & Cloud Navigation Shortcuts (86-100): Screen Blackouts, Laser Pointer & Save',
        ],
      },
      {
        num: '32',
        title: 'The Top 50 MIS Interview Vault, Author Note & Career Accelerator Bundle',
        titleHi: 'शीर्ष 50 MIS इंटरव्यू वॉल्ट, लेखक संदेश एवं करियर एक्सेलरेटर बंडल',
        pages: 'Pages 109–113',
        topics: [
          'Questions 01–15: Core Office 365 Architecture, VLOOKUP vs XLOOKUP & Dynamic Arrays',
          'Questions 16–35: LAMBDA, Power Query Unpivot, Co-Authoring & Slide Master Engineering',
          'Questions 36–50: Relational Data Modeling, DAX, Sensitivity Labels & 2027 MIS Core Skills',
          'Founder Rahul Patel’s Inspiring Concluding Message & ₹149 Career Accelerator Bundle Invitation',
        ],
      },
    ],
  },
  {
    id: 'fundamentals',
    code: 'RTL-2027-FUND',
    badge: 'FOUNDATIONS',
    badgeColor: 'text-[#25B6F9] bg-[#25B6F9]/10 border-[#25B6F9]/30',
    title: 'Computer Fundamentals',
    titleHi: 'कम्प्यूटर फंडामेंटल्स (Computer Fundamentals)',
    tagline: 'IPO Cycle, I/O Hardware, 1st–5th Generations, Memory Hierarchy & CPU Machine Cycle',
    taglineHi: 'IPO साइकिल, इनपुट/आउटपुट सिस्टम, 1st-5th पीढ़ियाँ, RAM/ROM और CPU मशीन साइकिल',
    price: 49,
    pages: '45 Pages (Complete Master Edition)',
    pagesNum: 45,
    edition: 'Edition 1 (2027)',
    author: 'Rahul Sir & RTechLab Team',
    accentColor: '#25B6F9',
    previewPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1.pdf',
    previewPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',
    previewPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1.pdf',
    photoHighlights: [
      'Desktop Workstation Layout',
      'Vacuum Tubes (1st Gen)',
      'Input Peripherals (Keyboard/Mouse)',
      'DDR RAM DIMM Module',
      'Mechanical HDD Platter',
      'NVMe M.2 Solid State Drive',
      'CPU Package & Motherboard Socket',
      'Silicon Wafer Microchip Die',
      'Enterprise Datacenter Server Rack',
      'Network Switch & Fiber LC Cables',
      'YubiKey FIDO2 Security Token',
      'Digital Multimeter Diagnostic Testing',
    ],
    chapters: [
      {
        num: '01',
        title: 'Introduction to Computers & System Architecture',
        titleHi: 'कम्प्यूटर परिचय एवं सिस्टम आर्किटेक्चर',
        pages: 'Pages 03–06',
        topics: [
          'What is a Computer? Definition, Characteristics & The IPO Cycle',
          'System Components & Comprehensive 5 Generations Comparison',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & Binary Converter QR',
        ],
      },
      {
        num: '02',
        title: 'Input & Output (I/O) Hardware Systems & Ports',
        titleHi: 'इनपुट एवं आउटपुट सिस्टम तथा आधुनिक पोर्ट्स',
        pages: 'Pages 07–10',
        topics: [
          'Input Peripherals, Optical Sensors & Biometrics',
          'Output Displays (OLED/IPS), Laser/Inkjet Printers & DACs',
          'Modern Port Standards: USB-C (USB4), HDMI 2.1, DisplayPort 2.1 & RJ45',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & Port Reference QR',
        ],
      },
      {
        num: '03',
        title: 'Computer Memory & Secondary Storage Hierarchy',
        titleHi: 'कम्प्यूटर मेमोरी एवं सेकेंडरी स्टोरेज पदानुक्रम',
        pages: 'Pages 11–14',
        topics: [
          'Primary RAM (SRAM vs DRAM), ROM (EEPROM) & L1-L3 Cache Hierarchy',
          'Secondary Storage: Mechanical HDD vs Solid-State NVMe SSD',
          'Data Measurement Units Table: Bit, Nibble, Byte to Terabyte & Petabyte',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & Storage Fact Box',
        ],
      },
      {
        num: '04',
        title: 'Central Processing Unit (CPU) & Machine Cycle',
        titleHi: 'सेंट्रल प्रोसेसिंग यूनिट (CPU) एवं मशीन साइकिल',
        pages: 'Pages 15–18',
        topics: [
          'CPU Architecture: ALU, Control Unit, Internal Registers & Clock Speed (GHz)',
          'The 4-Step Machine Execution Cycle: Fetch, Decode, Execute, Store',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & CPU Live Quiz QR',
        ],
      },
      {
        num: '05',
        title: 'Number Systems, Binary Arithmetic & Encodings',
        titleHi: 'नंबर सिस्टम, बाइनरी गणना एवं कैरेक्टर एन्कोडिंग',
        pages: 'Pages 19–22',
        topics: [
          'Decimal, Binary, Octal & Hexadecimal Number Systems',
          'The 8-4-2-1 Conversion Shortcuts & Binary-to-Hex Tables',
          'Character Encodings: ASCII (7-bit & 8-bit) and Unicode (UTF-8)',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & Converter QR',
        ],
      },
      {
        num: '06',
        title: 'Computer Software, OS & Language Translators',
        titleHi: 'कम्प्यूटर सॉफ्टवेयर, ऑपरेटिंग सिस्टम एवं ट्रांसलेटर्स',
        pages: 'Pages 23–26',
        topics: [
          'Software Classification: System, Application & Utility Software',
          'The 4 Core Functions of an OS (Process, Memory, File & Device Management)',
          'Translators: Assembler vs Compiler vs Interpreter Differences',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & Linux Fact Box',
        ],
      },
      {
        num: '07',
        title: 'Computer Networks, Protocols & The Internet',
        titleHi: 'कम्प्यूटर नेटवर्क एवं इंटरनेट कार्यप्रणाली',
        pages: 'Pages 27–30',
        topics: [
          'Network Scope: PAN, LAN, MAN, WAN & The Global Internet',
          'Physical Topologies: Star vs Mesh vs Bus Advantages',
          'DNS, IP Addressing (IPv4 vs IPv6) & Transmission Media',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & Subnet QR',
        ],
      },
      {
        num: '08',
        title: 'Cyber Security, Malware Defense & Safety Rules',
        titleHi: 'साइबर सुरक्षा, मैलवेयर बचाव एवं डिजिटल सुरक्षा',
        pages: 'Pages 31–34',
        topics: [
          'Malware Types: Viruses, Worms, Trojan Horses, Ransomware & Spyware',
          'Defenses: Firewalls, EDR/Antivirus & Hardware Key 2FA (FIDO2)',
          'The Golden 3-2-1 Data Backup Strategy for Ransomware Immunity',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & Security Quiz QR',
        ],
      },
      {
        num: '09',
        title: 'Preventive Maintenance & Diagnostic Troubleshooting',
        titleHi: 'प्रिवेंटिव मेंटेनेंस एवं बुनियादी ट्रबलशूटिंग',
        pages: 'Pages 35–38',
        topics: [
          'PC Care: Dust Cleaning, Thermal Paste Refresh & ESD Safety',
          'The 4-Step Hardware Triage: POST Beep Codes, RAM Reseating & GPU Cable Trap',
          'Essential Diagnostic Commands: ping, ipconfig, taskmgr & chkdsk',
          'End of Chapter: 4 Review Questions, 5 Verified MCQs & Maintenance QR',
        ],
      },
      {
        num: '10',
        title: 'Master MNC Technical Interview Bank & Viva Guide',
        titleHi: 'शीर्ष 50 MNC इंटरव्यू प्रश्न एवं 30 वाइवा वन-लाइनर्स',
        pages: 'Pages 39–45',
        topics: [
          'Top 50 High-Frequency Technical Screening Questions (TCS, Infosys, Amazon, Wipro)',
          'Senior Engineering Model Answers for Freshers and IT Support',
          '30 Rapid-Fire Viva-Voce One-Liners & 2027 Technology Trends Matrix',
          'Next-Level Hardware & Networking Master Edition Roadmap & Live Online Quiz QR',
        ],
      },
    ],
    bestBuyCombo: {
      id: 'combo-fund-hw',
      title: 'Foundational Hardware Master Combo',
      titleHi: 'फाउंडेशनल हार्डवेयर मास्टर कॉम्बो',
      desc: 'Computer Fundamentals + Full Computer Hardware & Architecture (130+ Pages)',
      price: 79,
      originalPrice: 98,
      savings: 'Save ₹19 (20% OFF)',
      pairedSubject: 'hardware',
    },
  },
  {
    id: 'hardware',
    code: 'RTL-2027-HW',
    badge: 'HARDWARE ENGINEERING',
    badgeColor: 'text-[#7A25CA] bg-[#7A25CA]/10 border-[#7A25CA]/30',
    title: 'Computer Hardware & System Architecture',
    titleHi: 'कम्प्यूटर हार्डवेयर एवं सिस्टम आर्किटेक्चर',
    tagline: 'Motherboard VRMs, Intel LGA 1851/1700, AMD AM5, DDR5 PMIC, PCIe 5.0, ATX 3.1 & 12V-2x6',
    taglineHi: 'मदरबोर्ड VRM, Intel LGA 1851/1700, AMD AM5, DDR5 PMIC, PCIe 5.0 एवं ATX 3.1 पावर सप्लाई',
    price: 49,
    pages: '130+ Pages (Master Edition)',
    pagesNum: 130,
    edition: '2027 Industrial Standard',
    author: 'Rahul Sir & RTechLab Team',
    accentColor: '#7A25CA',
    previewPdfEn: '/downloads/RTechLab-Computer-Hardware-2027-5Page-Preview.pdf',
    fullPdfEn: '/downloads/RTechLab-Computer-Hardware-2027-Master-Edition.pdf',
    chapters: [
      {
        num: '01',
        title: 'Silicon Foundations & CPU Sockets',
        topics: ['Intel LGA 1851/1700 vs AMD AM5', 'Bent Pin Triage', 'Thermal Paste Application'],
      },
      {
        num: '02',
        title: 'High-Speed Memory & DDR5 Bus',
        topics: ['DDR5 6400+ MT/s Architecture', 'On-Die PMIC Regulation', 'Dual-Channel Routing'],
      },
      {
        num: '03',
        title: 'Motherboard VRMs & Power Delivery',
        topics: ['16+1+1 DrMOS Power Stages', 'MOSFET Cooling', 'PCIe 5.0 Lane Allocation'],
      },
      {
        num: '04',
        title: 'Power Delivery & ATX 3.1 Standards',
        topics: ['12V-2x6 GPU Power Connectors', 'Transient Spike Handling', '80 PLUS Titanium Ratings'],
      },
      {
        num: '05',
        title: 'Enterprise Fault Diagnostics Flowcharts',
        topics: ['POST Beep Codes', 'No Display Decision Tree', 'Multimeter Voltage Testing'],
      },
    ],
    bestBuyCombo: {
      id: 'combo-hw-net',
      title: 'Enterprise IT Support & Infrastructure Combo',
      titleHi: 'एंटरप्राइज IT सपोर्ट एवं इन्फ्रास्ट्रक्चर कॉम्बो',
      desc: 'Computer Hardware (130+ Pages) + Computer Networking CCNA (126+ Pages)',
      price: 79,
      originalPrice: 98,
      savings: 'Save ₹19 (20% OFF)',
      pairedSubject: 'networking',
    },
  },
  {
    id: 'networking',
    code: 'RTL-2027-NET',
    badge: 'CCNA 200-301',
    badgeColor: 'text-[#10B981] bg-[#10B981]/10 border-[#10B981]/30',
    title: 'Computer Networking & CCNA 200-301',
    titleHi: 'कम्प्यूटर नेटवर्किंग एवं CCNA 200-301',
    tagline: '3-Tier/Spine-Leaf, IPv4 VLSM, IPv6 EUI-64, Cisco IOS CLI, VLANs, OSPF & MNC Interview Bank',
    taglineHi: '3-टियर/स्पाइन-लीफ, सबनेटिंग VLSM, IPv6 EUI-64, सिस्को IOS CLI, VLANs, OSPF एवं MNC इंटरव्यू बैंक',
    price: 49,
    pages: '49 Pages · 16 In-Depth Modules (English & Hindi)',
    pagesNum: 49,
    edition: 'Edition 1 (2027)',
    author: 'Rahul Sir & RTechLab Team',
    accentColor: '#10B981',
    previewPdfEn: '/downloads/CCNA-200-301-English-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/CCNA-200-301-English-Edition-1.pdf',
    previewPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',
    previewPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1.pdf',
    photoHighlights: [
      'Enterprise Spine-Leaf Datacenter Topologies',
      'UTP Cat6 vs Single-Mode / Multi-Mode Fiber',
      'Cisco 2960 Switch & 4331 Router Interfaces',
      'RJ45 T568A vs T568B Structured Cabling',
      'SFP+ Optical Transceivers & LC Patch Cords',
      'Console Rollover Cable & Putty/SecureCRT CLI',
      'Wireshark 802.1Q VLAN Tagged Packet Traces',
      'Cisco Packet Tracer Router-on-a-Stick Lab',
    ],
    chapters: [
      {
        num: '01',
        title: 'Modern Network Architecture & Topologies',
        titleHi: 'आधुनिक नेटवर्क आर्किटेक्चर एवं टोपोलॉजी',
        pages: 'Pages 03–05',
        topics: [
          '3-Tier Hierarchical vs 2-Tier Collapsed Core Design Models',
          'Modern Datacenter Spine-Leaf Architecture & East-West Traffic Flow',
          'Cloud Architectures (IaaS, PaaS, SaaS) & WAN Edge Dual-Homed Designs',
          'End of Chapter: Review Questions, Technical MCQs & 2027 Tech Spotlight',
        ],
      },
      {
        num: '02',
        title: 'Cabling Standards, Optical Media & Ports',
        titleHi: 'केबलिंग मानक, ऑप्टिकल मीडिया एवं हार्डवेयर पोर्ट्स',
        pages: 'Pages 06–08',
        topics: [
          'UTP Cable Categories (Cat5e, Cat6, Cat6a, Cat8) & 100m Distance Limit',
          'T568A vs T568B Color Codes, Straight-Through vs Crossover & Auto-MDIX',
          'Optical Fiber Physics: Single-Mode (SMF) vs Multi-Mode (MMF) & Transceivers',
          'Console Rollover Cables (9600-8-N-1) & Collision vs Broadcast Domains',
        ],
      },
      {
        num: '03',
        title: 'IPv4 Addressing, Subnetting & VLSM Design',
        titleHi: 'IPv4 एड्रेसिंग, सबनेटिंग एवं VLSM डिजाइन',
        pages: 'Pages 09–11',
        topics: [
          '32-Bit IPv4 Header, Octets & RFC 1918 Private Scopes vs APIPA',
          'CIDR Notation & The Magic Number Subnetting Formula (256 - Octet)',
          'Instant /24 to /30 Cheat Sheet Table with Usable Hosts & Block Sizes',
          'Step-by-Step VLSM Enterprise Allocation with 5 Solved Scenarios',
        ],
      },
      {
        num: '04',
        title: 'IPv6 Architecture, EUI-64 & Transition',
        titleHi: 'IPv6 संपूर्ण आर्किटेक्चर, EUI-64 एवं ट्रांजिशन',
        pages: 'Pages 12–14',
        topics: [
          '128-Bit Hexadecimal Structure & Address Compression Rules',
          'Address Scopes: Global Unicast (GUA), Link-Local (LLA) & Multicast',
          'Modified EUI-64 Host Identifier Math (7th Bit Invert & FFFE Insert)',
          'SLAAC NDP (RS/RA, NS/NA) vs Stateful DHCPv6 & Dual-Stack CLI',
        ],
      },
      {
        num: '05',
        title: 'Cisco Router Hardware, Memories & Boot Flow',
        titleHi: 'सिस्को राउटर हार्डवेयर, मेमोरी प्रकार एवं बूट प्रक्रिया',
        pages: 'Pages 15–17',
        topics: [
          'Router Hardware: CPU, System Bus, Console/AUX Ports & Serial WIC',
          'Memory Hierarchy: ROM, Flash OS, NVRAM startup-config & RAM running-config',
          '5-Stage Boot Process: POST, Bootstrap, Locate IOS, Decompress & Config Parse',
          'Configuration Register: 0x2102 Normal Boot vs 0x2142 Password Recovery Bypass',
        ],
      },
      {
        num: '06',
        title: 'Cisco IOS CLI, Password Recovery & TFTP',
        titleHi: 'सिस्को CLI, पासवर्ड रिकवरी (0x2142) एवं TFTP',
        pages: 'Pages 18–20',
        topics: [
          'Cisco IOS Command Hierarchy: User Exec, Privileged Exec, Global & Interface Modes',
          'Hardening: Banners, Service Password Encryption, SHA-256 & SSH v2 2048-bit',
          'Step-by-Step ROMMON Password Recovery (confreg 0x2142, copy startup running)',
          'Disaster Recovery: TFTP Backup & Restore for running-config and IOS Images',
        ],
      },
      {
        num: '07',
        title: 'Layer 2 Switching, CAM Tables & Port Security',
        titleHi: 'लेयर 2 स्विचिंग, CAM टेबल एवं पोर्ट सिक्योरिटी लैब',
        pages: 'Pages 21–23',
        topics: [
          'Transparent Bridging: Learn, Forward, Filter & Flood Mechanics',
          'CAM Table Operations, 300-Second Aging Timer & MAC Flooding Attacks',
          'Switchport Port Security: Maximum Hosts & Static vs Sticky MAC Learning',
          'Violation Modes: Protect vs Restrict vs Shutdown & Automated Err-Disable Recovery',
        ],
      },
      {
        num: '08',
        title: 'VLANs, 802.1Q Trunking & Native 999 Isolation',
        titleHi: 'VLANs, 802.1Q ट्रंकिंग एवं नेटिव 999 आइसोलेशन लैब',
        pages: 'Pages 24–26',
        topics: [
          'VLAN Segmentation, Broadcast Domain Isolation & Access Port Assignment',
          'IEEE 802.1Q Frame Format: 4-Byte Tag Insertion (TPID, PCP, DEI, VID)',
          'The Native VLAN Concept, Double-Tagging Hopping Attack & Mitigation',
          'Production Native VLAN 999 Isolation Lab & switchport nonegotiate',
        ],
      },
      {
        num: '09',
        title: 'Spanning Tree (STP/RSTP 802.1w) & EtherChannel',
        titleHi: 'स्पैनिंग ट्री (STP/RSTP) एवं ईथर-चैनल LACP लैब',
        pages: 'Pages 27–29',
        topics: [
          'Layer 2 Loops, Broadcast Storms & MAC Flapping Mechanics',
          'STP 802.1D Bridge ID Math, Root Election, Root Ports & Designated Ports',
          'Rapid STP (802.1w) Proposal/Agreement Handshake & PortFast / BPDU Guard',
          'Link Aggregation: IEEE 802.3ad LACP EtherChannel Port Bundling Lab',
        ],
      },
      {
        num: '10',
        title: 'Inter-VLAN Routing: ROAS & Layer 3 SVI',
        titleHi: 'इंटर-VLAN रूटिंग: ROAS एवं लेयर 3 SVI लैब',
        pages: 'Pages 30–32',
        topics: [
          'Why Inter-VLAN Requires Layer 3 Routing & Default Gateway Resolution',
          'Router-on-a-Stick (ROAS) Subinterfaces with encapsulation dot1q',
          'Multilayer Switch SVIs (ip routing) & Routed Ports (no switchport)',
          'ROAS vs Multilayer SVI Throughput & Latency Performance Comparison',
        ],
      },
      {
        num: '11',
        title: 'IPv4 Routing Tables, Static & Floating IP SLA',
        titleHi: 'IPv4 रूटिंग टेबल्स, स्टैटिक एवं IP SLA फ्लोटिंग फेलओवर',
        pages: 'Pages 33–35',
        topics: [
          'Routing Decision Architecture: Longest Prefix Match (LPM) Rule',
          'Administrative Distance Hierarchy Table: Connected (0) to Unknown (255)',
          'Static Routes (Next-Hop vs Directly Connected) & Default Routes (0.0.0.0/0)',
          'Floating Static Routes with IP SLA ICMP Echo Tracking for Dual-ISP Failover',
        ],
      },
      {
        num: '12',
        title: 'Single & Multi-Area OSPFv2 Dynamic Routing',
        titleHi: 'सिंगल एवं मल्टी-एरिया OSPFv2 डायनेमिक रूटिंग लैब',
        pages: 'Pages 36–38',
        topics: [
          'Link-State Protocol Logic, Dijkstra SPF Algorithm & Area 0 Backbone Hierarchy',
          'The 7 OSPF Neighbor States: Down, Init, 2-Way, ExStart, Exchange, Loading, Full',
          'DR/BDR Election on Multi-Access Ethernet (Priority & Router-ID tie-breakers)',
          'OSPF Cost Formula (10^8 / Bandwidth), 5 LSA Types & Default Route Injection',
        ],
      },
      {
        num: '13',
        title: 'Enterprise IP Services: DHCP Server & NAT/PAT',
        titleHi: 'एंटरप्राइज IP सेवाएं: DHCP सर्वर एवं NAT/PAT लैब',
        pages: 'Pages 39–41',
        topics: [
          'DHCP DORA 4-Way Handshake & Cisco IOS DHCP Server Pool Configuration',
          'DHCP Relay Agent (ip helper-address) for Cross-VLAN Address Assignment',
          'IPv4 Exhaustion & NAT Types: Static (1:1), Dynamic Pool & PAT Overload',
          'Production PAT / NAT Overload Gateway Configuration & Translation Table Inspection',
        ],
      },
      {
        num: '14',
        title: 'Network Security: Standard/Extended ACLs & FHRP',
        titleHi: 'नेटवर्क सुरक्षा: स्टैंडर्ड/एक्सटेंडेड ACLs एवं HSRP',
        pages: 'Pages 42–44',
        topics: [
          'Access Control List Logic: Sequential Evaluation & Invisible Implicit Deny',
          'Standard ACLs (1-99) vs Extended ACLs (100-199) Rules & Gold Standard Placement',
          'Production Named Extended ACL Lab Permitting Specific Ports & Blocking Intruders',
          'First Hop Redundancy: HSRP Active/Standby VIP, Preemption & Syslog Levels 0-7',
        ],
      },
      {
        num: '15',
        title: 'Packet Tracer, GNS3 & TAC Troubleshooting',
        titleHi: 'पैकेट ट्रेसर, GNS3 एवं TAC ट्रबलशूटिंग मास्टरक्लास',
        pages: 'Pages 45–47',
        topics: [
          'Simulation vs Emulation: Packet Tracer vs GNS3 / EVE-NG Architecture',
          'Hybrid Enterprise GNS3 Topologies & Wireshark Deep Packet Frame Analysis',
          'Cisco TAC 5-Tier Systematic Triage Methodology (Layer 1 Physical to Layer 7 App)',
          'Essential Production Verification Commands Matrix & Debugging Safety Rules',
        ],
      },
      {
        num: '16',
        title: 'CCNA Top 60 MNC Screening Vault & Viva Guide',
        titleHi: 'CCNA टॉप 60 MNC साक्षात्कार वॉल्ट एवं वाइवा गाइड',
        pages: 'Pages 48–49',
        topics: [
          'Cisco CCNA 200-301 Six Blueprint Domains & Interview Weightage Analysis',
          'Top 60 Technical Screening Questions with Senior Network Architect Model Answers',
          'Rapid-Fire Technical Viva One-Liners & High-Yield Technical Definitions',
          'First 90-Day Enterprise NOC Engineering Playbook & Incident Response Discipline',
        ],
      },
    ],
    bestBuyCombo: {
      id: 'combo-net-ccna',
      title: 'CCNA Complete Career Bundle',
      titleHi: 'CCNA सम्पूर्ण करियर बंडल',
      desc: 'Master Guide (49 Pages) + 10 Packet Tracer Lab Workbook + 120 Interview Vault + Career Blueprint (Complete 4-in-1 Suite)',
      price: 89,
      originalPrice: 147,
      savings: 'Save ₹58 (40% OFF)',
      pairedSubject: 'networking',
    },
  },
  {
    id: 'cloud',
    code: 'RTL-2027-CLOUD',
    badge: 'CLOUD ARCHITECTURE',
    badgeColor: 'text-[#F59E0B] bg-[#F59E0B]/10 border-[#F59E0B]/30',
    title: 'Cloud Computing & SysAdmin (AWS + Azure)',
    titleHi: 'क्लाउड कम्प्यूटिंग एवं SysAdmin (AWS + Azure)',
    tagline: 'VPC Subnets, EC2 Instances, S3 Buckets, IAM Security, Azure VNets & Cloud Architecture',
    taglineHi: 'AWS VPC, EC2, S3, IAM सिक्योरिटी नीतियां, Azure VNet एवं मल्टी-क्लाउड आर्किटेक्चर',
    price: 49,
    pages: '180 Pages (Comprehensive Guide)',
    pagesNum: 180,
    edition: '2027 Industrial Standard',
    author: 'Rahul Sir & RTechLab Team',
    accentColor: '#F59E0B',
    chapters: [
      {
        num: '01',
        title: 'Cloud Foundations & Shared Responsibility',
        topics: ['IaaS vs PaaS vs SaaS', 'Cloud Availability Zones', 'Multi-Region High Availability'],
      },
      {
        num: '02',
        title: 'Enterprise VPC & Network Topology',
        topics: ['Public/Private Subnets', 'Internet Gateway & NAT Gateway', 'Security Groups vs NACLs'],
      },
      {
        num: '03',
        title: 'Compute & Storage (EC2, S3, Azure VMs)',
        topics: ['EC2 Instance Families', 'S3 Storage Classes & Lifecycle', 'EBS Volume Types & IOPS'],
      },
      {
        num: '04',
        title: 'IAM Security & Least Privilege Access',
        topics: ['IAM Users, Groups & Roles', 'JSON Policy Construction', 'MFA Enforcement'],
      },
    ],
    bestBuyCombo: {
      id: 'combo-aws-azure',
      title: 'Multi-Cloud Architect Combo (AWS + Azure)',
      titleHi: 'मल्टी-क्लाउड आर्किटेक्ट कॉम्बो (AWS + Azure)',
      desc: 'AWS Cloud Guide (180 Pages) + Azure Cloud Infrastructure Companion (120 Pages)',
      price: 99,
      originalPrice: 148,
      savings: 'Save ₹49 (33% OFF)',
      pairedSubject: 'cloud',
    },
  },
  {
    id: 'linux',
    code: 'RTL-2027-LINUX',
    badge: 'LINUX & DEVOPS',
    badgeColor: 'text-[#EC4899] bg-[#EC4899]/10 border-[#EC4899]/30',
    title: 'Linux Systems & Shell Administration',
    titleHi: 'लिनक्स सिस्टम्स एवं शेल एडमिनिस्ट्रेशन',
    tagline: 'Linux Kernel, Filesystem Hierarchy (FHS), Permissions, Systemd Daemons & Bash Scripting',
    taglineHi: 'लिनक्स कर्नेल, फाइल सिस्टम FHS, परमिशन्स, Systemd सर्विसेज एवं बैश ऑटोमेशन',
    price: 49,
    pages: '85 Pages (Practical Lab Handbook)',
    pagesNum: 85,
    edition: '2027 Industrial Standard',
    author: 'Rahul Sir & RTechLab Team',
    accentColor: '#EC4899',
    chapters: [
      {
        num: '01',
        title: 'Linux Architecture & Command Line Basics',
        topics: ['Kernel vs User Space', 'Standard Streams (stdin/stdout/stderr)', 'File Operations'],
      },
      {
        num: '02',
        title: 'Filesystem Hierarchy (FHS) & Permissions',
        topics: ['/etc, /var, /usr Structure', 'chmod Octal Math & SUID/SGID', 'chown Ownership Rules'],
      },
      {
        num: '03',
        title: 'Systemd Services & Process Triage',
        topics: ['systemctl Unit Management', 'journalctl Log Filtering', 'top / htop CPU Analysis'],
      },
      {
        num: '04',
        title: 'Bash Scripting & Production Automation',
        topics: ['Variables & Conditionals', 'Looping Constructs', 'Automated Backup Scripts & Cron'],
      },
    ],
    bestBuyCombo: {
      id: 'combo-linux-cloud',
      title: 'DevOps & SysAdmin Power Combo',
      titleHi: 'डेवऑप्स एवं SysAdmin पावर कॉम्बो',
      desc: 'Linux Systems (85 Pages) + Cloud Computing AWS (180 Pages)',
      price: 89,
      originalPrice: 138,
      savings: 'Save ₹49 (35% OFF)',
      pairedSubject: 'linux',
    },
  },
];

export const PRICING_TIERS = [
  {
    id: 'single',
    title: 'Single Subject Pass',
    titleHi: 'सिंगल सब्जेक्ट पास',
    price: 49,
    originalPrice: 99,
    badge: 'MOST POPULAR (₹49)',
    highlight: false,
    deliverables: [
      { name: 'Full Master Handbook (Complete PDF)', ok: true },
      { name: 'Dual Editions: English + Hindi', ok: true },
      { name: 'Real Industrial Hardware Photos & Software UI', ok: true },
      { name: 'Chapter Review Questions & MCQs', ok: true },
      { name: 'Instant Interactive QR Links to Web Tools', ok: true },
      { name: 'Top 50 MNC MIS Interview Vault (10 Pages)', ok: false },
      { name: '12 Enterprise Excel Practical Workbooks (16 Pages)', ok: false },
      { name: '2027 Industry CTC Salary Blueprint (12 Pages)', ok: false },
      { name: 'All-In-One ZIP Archive Download', ok: false },
    ],
  },
  {
    id: 'bundle',
    title: 'Career Accelerator Bundle',
    titleHi: 'करियर एक्सेलरेटर बंडल',
    price: 149,
    originalPrice: 299,
    badge: '🔥 RECOMMENDED VALUE (+₹100)',
    highlight: true,
    deliverables: [
      { name: 'Full Master Handbook (Complete PDF)', ok: true },
      { name: 'Dual Editions: English + Hindi', ok: true },
      { name: 'Real Industrial Hardware Photos & Software UI', ok: true },
      { name: 'Chapter Review Questions & MCQs', ok: true },
      { name: 'Instant Interactive QR Links to Web Tools', ok: true },
      { name: 'Top 50 MNC MIS Interview Vault (10 Pages)', ok: true },
      { name: '12 Enterprise Excel Practical Workbooks (16 Pages)', ok: true },
      { name: '2027 Industry CTC Salary Blueprint (12 Pages)', ok: true },
      { name: 'All-In-One ZIP Archive Download (14.5 MB)', ok: true },
    ],
  },
];
