# RTechLab — Practical Technology Education Platform

> **Brand**: RTechLab  
> **Tagline**: Learn. Practice. Innovate.  
> **Secondary Tagline**: Technology Made Practical.  
> **Audience**: International and Indian students, IT professionals, beginners, and technology enthusiasts (India, USA, UK, Canada, and global).  
> **Languages**: English and Hindi.

---

## 1. Overview & Brand Philosophy

**RTechLab** is an international technology education web platform created to bridge the critical gap between textbook theory and real enterprise IT execution. 

Instead of passive slide decks or paywalled courses, RTechLab emphasizes **100% practical, lab-first learning** across Enterprise Networking, Cisco CCNA (200-301), Linux Systems Administration, Cyber Security Defense, Computer Hardware, Cloud Computing (AWS/Azure), Network Automation with Python, and browser-based engineering tools.

### Brand Design Direction
- **Color Palette**: Dark Navy Blue (`#070B19`, `#0A1128`, `#0E1738`), Electric Blue (`#1E6BFF`, `#2563EB`, `#60A5FA`), Cyber Cyan (`#00E5FF`, `#38BDF8`), and crisp white/slate typography.
- **Custom Logo Mark**: Custom SVG combining a modern geometric capital **'R'** with printed circuit traces, interconnected network nodes, and laboratory flask-inspired geometry.
- **Dual-Language Architecture**: Native switch between English and Hindi for all key taglines, navigation, section descriptions, and conceptual explanations.
- **Truthful & Authentic**: Zero fake reviews, zero manufactured metrics, zero hidden paywalls, zero tracking bloat.

---

## 2. Project Architecture & File Guide

```
RtechLab/
├── public/
│   └── logo-icon.svg             # Custom SVG favicon & circuit network 'R' mark
├── src/
│   ├── components/
│   │   ├── tools/
│   │   │   ├── SubnetCalculator.jsx     # Live IPv4 / CIDR calculation engine & binary breakdown
│   │   │   ├── PortScanner.jsx          # Searchable 50+ enterprise port & protocol database
│   │   │   ├── LinuxTerminal.jsx        # Interactive VT100 bash simulator with live outputs
│   │   │   ├── BandwidthCalculator.jsx  # Network throughput & file transfer duration calculator
│   │   │   └── HashUtility.jsx          # Base64, Hex, Binary & URL encoder/decoder
│   │   ├── AboutSection.jsx             # Mission, 4 core pillars, and educational ethos
│   │   ├── CategoryExplorer.jsx         # 8 Core Domains with filtering and deep-dive drawer
│   │   ├── Footer.jsx                   # Professional sitemap, language notice, copyright
│   │   ├── FreeToolsSection.jsx         # Tabbed container embedding all 5 interactive tools
│   │   ├── Hero.jsx                     # Hero banner with taglines & interactive Cisco telemetry preview
│   │   ├── InterviewPrepSection.jsx     # Scenario-based technical interview Q&A with CLI commands
│   │   ├── Logo.jsx                     # Scalable SVG logo component with glow & sizing props
│   │   ├── Navbar.jsx                   # Responsive header, bilingual toggle, mobile menu
│   │   ├── ResourcesSection.jsx         # Cheat sheets, architecture blueprints, printable view
│   │   ├── SearchModal.jsx              # Global modal search (Ctrl+K) for topics, tools, and ports
│   │   └── TutorialsSection.jsx         # Lab guides with category filter and reading modal
│   ├── context/
│   │   ├── LanguageContextInstance.js   # React Context instance
│   │   ├── LanguageProvider.jsx         # State provider for English / Hindi toggle
│   │   ├── useLanguage.js               # Custom hook for translation access
│   │   └── LanguageContext.js           # Clean module exports
│   ├── data/
│   │   ├── categories.js                # Curriculums, lab counts, and key topics
│   │   ├── interviewQuestions.js        # High-yield scenario interview questions & verify commands
│   │   ├── resources.js                 # Cheat sheets, diagnostic ladders, and OSI blueprints
│   │   ├── tools.js                     # Port database and terminal command responses
│   │   ├── translations.js              # Complete English & Hindi string catalog
│   │   └── tutorials.js                 # Step-by-step practical lab guides with topologies
│   ├── App.jsx                          # Main assembly and page layout
│   ├── index.css                        # Tailwind directives, custom glassmorphism & scrollbars
│   └── main.jsx                         # React 19 application entry point
├── index.html                           # SEO meta tags, Google Fonts (Plus Jakarta Sans & JetBrains Mono)
├── package.json                         # Dependencies and build scripts
├── postcss.config.js                    # PostCSS processor config
├── tailwind.config.js                   # Custom color tokens, font families, glow utilities
└── vite.config.js                       # Vite bundler configuration
```

---

## 3. Working Interactive Features (Phase 1)

Every interactive element is fully functional with genuine client-side logic:

1. **IPv4 Subnet & CIDR Calculator (`SubnetCalculator.jsx`)**:
   - Calculates Network Address, Broadcast Address, Subnet Mask, Wildcard Mask, Usable Host Range, Total Hosts, and Usable Hosts ($2^H - 2$).
   - Displays Class (A, B, C, D, E) and Scope (RFC 1918 Private vs Public Internet).
   - Shows 32-bit binary representation of both IP and Subnet mask.
   - Includes quick-apply presets (`/24 LAN`, `/16 Corp`, `/27 DMZ`, `/30 WAN`).
   - One-click copy buttons with visual confirmation.

2. **Enterprise Port & Protocol Reference (`PortScanner.jsx`)**:
   - Real-time search across 50+ enterprise and CCNA ports (SSH, DNS, BGP, OSPF, DHCP, HTTPS, RDP, etc.).
   - Protocol filtering by TCP, UDP, or All.
   - Displays CCNA Exam Notes and Cybersecurity Risk assessments for each port.

3. **Interactive Linux Terminal Simulator (`LinuxTerminal.jsx`)**:
   - Virtual bash console (`student@rtechlab-lab:~$`).
   - Supports commands: `help`, `ip a`, `ifconfig`, `uname -a`, `cat /etc/os-release`, `pwd`, `ls -la`, `netstat`, `whoami`, `date`, `clear`.
   - Dynamic simulation for `ping <target>` (computes realistic RTT min/avg/max) and `traceroute <target>` (multi-hop path).
   - Quick command suggestion pills for one-click execution.

4. **Bandwidth Transfer Time Estimator (`BandwidthCalculator.jsx`)**:
   - Computes transfer times across customizable file sizes (MB, GB, TB) and network bandwidths (Kbps, Mbps, Gbps).
   - Quick presets for 4G (50 Mbps), FastEthernet (100 Mbps), Gigabit Fiber (1 Gbps), and Data Center Backbone (10 Gbps).
   - Optional toggle for ~8% TCP/IP framing and ACK protocol overhead for enterprise realism.

5. **Base64, Hex & Hash Utility (`HashUtility.jsx`)**:
   - Converts plaintext payloads into Base64 (HTTP Basic Auth), Hexadecimal byte streams, and URL percent-encoding.
   - Includes bidirectional Base64 Decode Mode.

6. **Interactive Lab Reader Modal (`TutorialsSection.jsx`)**:
   - Click "Open Lab Guide" on any tutorial to open a dedicated readable view with prerequisites, topology diagram, and copyable CLI syntax.

7. **Bilingual Switcher (English & Hindi)**:
   - Instant toggle (`EN` / `हिंदी`) in the navbar changes headlines, subheadings, key descriptions, and about pillars smoothly with persistence via `localStorage`.

8. **Live Quick Search (`SearchModal.jsx`)**:
   - Press <kbd>Ctrl + K</kbd> or click "Quick Search" to search topics, tutorials, and port numbers simultaneously with instant navigation.

---

## 4. How to Run Locally

### Prerequisites
- Node.js (v18 or higher recommended, tested on v24.18.1)
- npm (tested on v11.16.0)

### Step 1: Install Dependencies
Open your terminal in the project root:
```bash
npm install
```

### Step 2: Start the Development Server
```bash
npm run dev
```
Vite will start the local development server (typically at `http://localhost:5173/`). Open this URL in your web browser.

### Step 3: Run the Production Build
To create an optimized, production-ready static build:
```bash
npm run build
```
The output will be generated inside the `dist/` directory.

### Step 4: Preview the Production Build
To test the generated production bundle locally:
```bash
npm run preview
```

### Step 5: Code Quality & Linting
Run the fast Oxlint linter:
```bash
npm run lint
```
(Currently passes with 0 errors and 0 warnings).

---

## 5. Phase 1 Boundaries (Compliance Checklist)
- [x] Zero paid external APIs or database dependencies.
- [x] Zero domain purchases or remote cloud deployments.
- [x] Zero fake reviews, fake customer numbers, or fabricated testimonials.
- [x] Zero dead placeholder buttons.
- [x] Fully responsive across mobile (<640px), tablet (640-1024px), and desktop (>1024px).
- [x] Validated production build with zero warnings or errors.
