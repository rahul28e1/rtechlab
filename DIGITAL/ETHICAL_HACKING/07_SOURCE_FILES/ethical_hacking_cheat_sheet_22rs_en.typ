// =============================================================================
// RTECHLAB ETHICAL HACKING & CYBER SECURITY DESK REFERENCE (ENGLISH 2027 EDITION)
// 100% Original RTechLab Proprietary Content · Zero-Gap 8-Page Dense Layout
// Author: Rahul Patel (CEH, CSCU, EHE, SCSU · Founder, RTechLab)
// =============================================================================

#set document(
  title: "RTechLab Ethical Hacking & Cyber Security Desk Reference (English)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 9mm, bottom: 7.5mm, left: 8.5mm, right: 8.5mm),
  background: context {
    let p = counter(page).get().first()
    if p > 1 [
      #place(center + horizon)[
        #rotate(-35deg)[
          #text(size: 76pt, weight: "black", fill: rgb("#0F172A0B"))[RTECHLAB]
        ]
      ]
    ]
  },
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 13pt, baseline: 2pt)[#image("02_BRAND_ASSETS/rtechlab_official_badge_logo.png", height: 13pt)]
          #h(4pt)
          #text(size: 8.2pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 8pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7.6pt, weight: "bold", fill: rgb("#DC2626"))[Ethical Hacking & Cyber Security Desk Reference]
        ],
        [
          #text(size: 7.4pt, weight: "bold", fill: rgb("#0284C7"))[Kali · Nmap · OWASP · SQLi · Wireshark · Crypto]
          #text(size: 7.4pt, fill: rgb("#64748B"))[ · Rahul Patel]
        ]
      )
      #v(1.5pt)
      #line(length: 100%, stroke: 0.6pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(1.5pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.6pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#DC2626"))[●] RTechLab Original Edition · Authorized Labs Only · Free Tools: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.5pt),
            text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[Page #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Segoe UI", "Nirmala UI", "Arial"),
  size: 8.6pt,
  fill: rgb("#0F172A"),
  spacing: 100%
)

#set par(
  justify: false,
  leading: 0.66em,
  first-line-indent: 0pt
)

// Brand Palette
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-amber = rgb("#D97706")
#let rtech-red = rgb("#DC2626")
#let rtech-purple = rgb("#7C3AED")
#let rtech-muted = rgb("#475569")
#let dark-border = rgb("#1E293B")

// Helpers
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-r(body) = box(fill: rgb("#FEE2E2"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#991B1B"), weight: "bold")[#body]]
#let cmd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#94A3B8"), radius: 2pt, inset: (x: 2.5pt, y: 0.8pt))[#text(size: 6.6pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-red) = {
  v(3pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3.5pt + color, rest: 0.6pt + dark-border),
    radius: (right: 3pt),
    inset: (x: 6pt, y: 3.8pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 4.5pt, y: 1.8pt),
            text(size: 6.6pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 8.6pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(2pt)
}

#let did-you-know(fact) = {
  v(3pt)
  block(
    width: 100%,
    fill: rgb("#FEFCE8"),
    stroke: (left: 3.5pt + rtech-amber, rest: 0.6pt + rgb("#FDE047")),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5pt),
    [
      #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[💡 DID YOU KNOW? ]
      #text(size: 7.4pt, fill: rgb("#451A03"))[#fact]
    ]
  )
  v(1pt)
}

#let lab-challenge(title, steps) = {
  v(2.5pt)
  block(
    width: 100%,
    fill: rgb("#0F172A"),
    stroke: 0.7pt + rgb("#38BDF8"),
    radius: 3pt,
    inset: (x: 7pt, y: 5pt),
    [
      #text(size: 7.5pt, weight: "black", fill: rgb("#38BDF8"))[🎯 HANDS-ON LAB CHALLENGE: #title]\
      #v(1.5pt)
      #text(size: 7.3pt, fill: rgb("#E2E8F0"))[#steps]
    ]
  )
}

// =============================================================================
// PAGE 01: 4K FULL-BLEED COVER PAGE
// =============================================================================
#page(margin: 0pt, header: none, footer: none, background: none)[
  #image("02_BRAND_ASSETS/eh_cover_4k.png", width: 100%, height: 100%, fit: "cover")
]

// =============================================================================
// PAGE 02: ETHICAL HACKING LIFECYCLE, KALI LINUX SETUP & OSINT RECON
// =============================================================================

#section-banner(num: "MODULE 01", title: "ETHICAL HACKING LIFECYCLE, CIA TRIAD & HACKER CLASSIFICATIONS", color: rtech-red)

#align(center)[
  #box(stroke: 0.6pt + rgb("#CBD5E1"), radius: 4pt, clip: true, width: 100%)[
    #image("02_BRAND_ASSETS/eh_5phase_visual.png", width: 100%)
  ]
]
#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.6pt, weight: "black", fill: rtech-navy)[🛡️ Core Security Pillars (CIA + AAA)]
      #v(2pt)
      • *Confidentiality:* Encryption & Access Control (keep data secret)\
      • *Integrity:* Hashing (`SHA-256`) & Digital Signatures (no tampering)\
      • *Availability:* Redundancy, Backups & DDoS Protection (99.9% uptime)\
      • *AAA:* *Authentication* (Who?) · *Authorization* (Perms?) · *Accounting* (Logs)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.6pt, weight: "black", fill: rtech-blue)[🎭 Hacker Hats & Pentest Scopes]
      #v(2pt)
      • #hl-g[White Hat] Authorized Defender · #hl-r[Black Hat] Malicious Attacker\
      • #hl-y[Grey Hat] Unsolicited researcher · #hl-b[Red / Blue / Purple Teams]\
      • *Black Box:* Zero prior info · *White Box:* Full source & architecture\
      • *Grey Box:* Partial user creds (most realistic corporate audit)
    ]
  ]
)

#section-banner(num: "MODULE 02", title: "HOW TO DOWNLOAD & SETUP KALI LINUX LAB + OSINT DORKING", color: rtech-blue)

#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.6pt, weight: "black", fill: rgb("#065F46"))[🐉 Step-by-Step: Download & Install Kali Linux Safely (Virtual Lab)]
  #v(2pt)
  *1. Official Download:* Visit #link("https://www.kali.org/get-kali/")[*kali.org/get-kali*] → Choose *Virtual Machines* (Pre-built VirtualBox / VMware `.ova`/`.7z` — fastest!).\
  *2. Verify Integrity:* Check `SHA-256` hash (`Get-FileHash kali.7z` on Windows) before booting · Default login: `kali` / `kali` (change immediately via `passwd`).\
  *3. First Boot Update:* Run #cmd("sudo apt update && sudo apt full-upgrade -y") · Install full toolset: #cmd("sudo apt install -y kali-linux-large")
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Dork / OSINT], text(fill: white, weight: "bold")[Passive & Active Reconnaissance Purpose], text(fill: white, weight: "bold")[Command / Query],
  [#cmd("site:") / #cmd("filetype:")], [Find exposed PDFs, `.env`, `.sql` dumps on a target domain], [#cmd("site:target.com filetype:env")],
  [#cmd("intitle:") / #cmd("inurl:")], [Locate open directory listings, admin panels or error leaks], [#cmd("intitle:\"index of\" /backup")],
  [#cmd("whois") / #cmd("dig")], [Registrar info, `A`/`MX`/`TXT` DNS records & `DNSSEC` check], [#cmd("dig target.com ANY +short")],
  [`Shodan.io` / `Censys`], [Search public servers, open webcams, RDP & IoT banners], [`port:3389 country:"IN"`],
  [`theHarvester`], [Gather employee emails, subdomains & IPs via OSINT], [#cmd("theHarvester -d dom.com -b all")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🧩 Essential Recon Browser Extensions & Frameworks]
  #v(2pt)
  • *Extensions:* `Wappalyzer` (tech stack), `FoxyProxy` (Burp switch), `Shodan` (open ports), `BuiltWith` (CMS/CDN)\
  • *Frameworks:* *MITRE ATT&CK* (TTPs) · *OWASP Top 10* (Web/API) · *IT Act 2000* (Sec 43/66 Legal Scope)\
  • *Must-Try Recon Sites:* #link("https://haveibeenpwned.com")[*HaveIBeenPwned.com*] (check leaked emails) · #link("https://www.shodan.io")[*Shodan.io*] (open IoT/servers) · #link("https://crt.sh")[*crt.sh*] (SSL subdomains)
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[Recon Website], text(fill: white, weight: "bold")[What Ethical Hackers Use It For (100% Free & Legal)], text(fill: white, weight: "bold")[Direct Link],
  [*Have I Been Pwned*], [Check if an email or corporate domain appeared in data breaches], [#link("https://haveibeenpwned.com")[haveibeenpwned.com ↗]],
  [*Shodan Search Engine*], [Discover public servers, webcams, routers & exposed ports worldwide], [#link("https://www.shodan.io")[shodan.io ↗]],
  [*crt.sh (SSL Logs)*], [Find hidden subdomains instantly via public SSL/TLS certificates], [#link("https://crt.sh")[crt.sh ↗]],
  [*Kali Official Portal*], [Download verified VirtualBox/VMware images & Kali documentation], [#link("https://www.kali.org/get-kali/")[kali.org/get-kali ↗]],
  [*VirusTotal*], [Verify suspicious files/URLs/hashes with 70+ Antivirus engines], [#link("https://www.virustotal.com")[virustotal.com ↗]],
  [*Security Headers*], [Audit any website's HTTP security headers (`CSP`, `HSTS`, `XFO`)], [#link("https://securityheaders.com")[securityheaders.com ↗]],
)

#did-you-know[
  *Passive Recon* collects intelligence without sending a single packet to the target (`WHOIS`, `Shodan`, `Google Dorks`), whereas *Active Recon* interacts directly with the target! Always sign a *Scope of Work (SoW)* first (IT Act Sec 43 & 66).
]

#pagebreak()

// =============================================================================
// PAGE 03: NETWORK SCANNING, NMAP MASTERY & ENUMERATION
// =============================================================================

#section-banner(num: "MODULE 03", title: "NETWORK SCANNING & NMAP MASTER FLAGS (PORT & VULN DISCOVERY)", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[Nmap Flag], text(fill: white, weight: "bold")[Scan Type & How It Works], text(fill: white, weight: "bold")[Command],
  [#cmd("-sS")], [*Stealth SYN Scan* (Half-open: `SYN` → `SYN-ACK` → `RST`)], [#cmd("nmap -sS 10.0.0.1")],
  [#cmd("-sT")], [*TCP Connect Scan* (Full 3-way handshake; logged by target)], [#cmd("nmap -sT 10.0.0.1")],
  [#cmd("-sU")], [*UDP Scan* (Checks DNS `53`, SNMP `161`, DHCP `67`, TFTP `69`)], [#cmd("nmap -sU -p 53,161 ip")],
  [#cmd("-sV") / #cmd("-O")], [Service Version banner grabbing & OS Fingerprinting], [#cmd("nmap -sV -O 10.0.0.1")],
  [#cmd("-A") / #cmd("-p-")], [Aggressive scan (OS+Ver+NSE+Trace) / All 65,535 ports], [#cmd("nmap -A -p- 10.0.0.1")],
  [#cmd("-sn") / #cmd("-Pn")], [Host Ping Sweep (no ports) / Skip discovery (treat host UP)], [#cmd("nmap -sn 192.168.1.0/24")],
  [#cmd("--script vuln")], [Run Nmap Scripting Engine (NSE) to detect known CVEs], [#cmd("nmap --script vuln ip")],
  [#cmd("-f") / #cmd("-D RND:5")], [IDS Evasion: Fragment IP packets / 5 random decoy IPs], [#cmd("nmap -sS -f -D RND:5 ip")],
)

#section-banner(num: "MODULE 04", title: "ENUMERATION & CRITICAL ATTACK PORTS MATRIX", color: rtech-blue)

#table(
  columns: (auto, auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Port], text(fill: white, weight: "bold")[Service], text(fill: white, weight: "bold")[What Security Auditors Enumerate], text(fill: white, weight: "bold")[Tool / Cmd],
  [#cmd("21")], [FTP], [Anonymous login (`anonymous:anonymous`) & cleartext creds], [#cmd("ftp target_ip")],
  [#cmd("22")], [SSH], [Banner version, weak passwords, exposed private keys], [#cmd("ssh-audit target_ip")],
  [#cmd("25")], [SMTP], [Valid usernames via `VRFY`, `EXPN` & `RCPT TO` commands], [#cmd("smtp-user-enum")],
  [#cmd("53")], [DNS], [Zone Transfer (`AXFR`) leaking internal hostnames & IPs], [#cmd("dig axfr @ns1 dom.com")],
  [#cmd("139/445")], [SMB], [Shared folders, OS version, null sessions & SMBv1 flaws], [#cmd("enum4linux -a ip")],
  [#cmd("161")], [SNMP], [Default community strings (`public`/`private`) → network map], [#cmd("snmpwalk -v2c -c public ip")],
  [#cmd("389")], [LDAP], [Active Directory users, groups, computers & GPOs], [#cmd("ldapsearch -x -H ldap://ip")],
  [#cmd("3389")], [RDP], [Windows Remote Desktop brute-force & NLA security check], [#cmd("xfreerdp /u:admin /v:ip")],
)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🔄 Nmap Port States & Stealth Flags]
      #v(2pt)
      • #hl-g[Open:] Listening · #hl-r[Closed:] No app · #hl-y[Filtered:] Firewall drops\
      • *FIN (`-sF`) / Xmas (`-sX`):* Bypass stateless firewalls (`RST` = Closed)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🛡️ CVSS Risk Score & Vuln Scanners]
      #v(2pt)
      • `0.1–3.9` Low · `4.0–6.9` Med · `7.0–8.9` High · `9.0–10` *Critical*\
      • Top Scanners: `Nessus`, `OpenVAS`, `Nuclei`, `Nikto`
    ]
  ]
)

#lab-challenge("Your First Local Lab Scan", "Spin up Metasploitable2 or DVWA in VirtualBox (Host-Only Network), find its IP via arp-scan -l, then run nmap -sS -sV -O <TARGET_IP> -oN scan.txt to map every open service!")

#v(2pt)
#block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-blue)[⏱️ Nmap Speed Templates (`-T0` to `-T5`) & Output Saving]
  #v(2pt)
  • `-T0`/`-T1`: Paranoid/Sneaky (IDS evasion) · `-T3`: Default · `-T4`: Fast Lab/Audit · `-T5`: Insane (may drop packets)\
  • Save all formats (`normal`, `XML`, `grepable`) in one command: #cmd("nmap -sV -T4 -oA audit_report 10.0.0.1")
]

#v(2pt)
#align(center)[
  #box(stroke: 0.6pt + rgb("#CBD5E1"), radius: 4pt, clip: true, width: 100%)[
    #image("02_BRAND_ASSETS/eh_tcp_vs_syn_visual.png", width: 100%)
  ]
]

#v(2pt)
#block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[🎯 100% Legal Practice Scan Targets (Try Nmap Safely!)]
  #v(2pt)
  • #link("https://scanme.nmap.org")[*scanme.nmap.org*] — Official Nmap test server (explicitly authorized for learning `nmap -sV` scans!).\
  • #link("http://testphp.vulnweb.com")[*testphp.vulnweb.com*] — Official Acunetix vulnerable web app for safe port, Nikto & OWASP practice.
]

#did-you-know[
  *Nmap `-sS` (Stealth SYN Scan)* is the default for root users because it never completes the TCP 3-way handshake! After receiving `SYN-ACK`, Nmap sends `RST` immediately, avoiding connection logs in many legacy services.
]

#pagebreak()

// =============================================================================
// PAGE 04: SYSTEM HACKING, PASSWORD CRACKING, MALWARE & SOCIAL ENGINEERING
// =============================================================================

#section-banner(num: "MODULE 05", title: "SYSTEM HACKING, PASSWORD CRACKING & PRIVILEGE ESCALATION", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[Tool / Technique], text(fill: white, weight: "bold")[System Hacking & Post-Exploitation Purpose], text(fill: white, weight: "bold")[Example],
  [#cmd("Hydra")], [Fast online brute-force tool for SSH, FTP, HTTP & RDP], [#cmd("hydra -l root -P rockyou.txt ssh://ip")],
  [#cmd("John the Ripper")], [Offline password cracker for `/etc/shadow` & ZIP hashes], [#cmd("john --wordlist=rockyou.txt hash.txt")],
  [#cmd("Hashcat")], [GPU-accelerated offline password cracking (ultra-fast!)], [#cmd("hashcat -m 1000 ntlm.txt rockyou.txt")],
  [#cmd("Mimikatz")], [Audit Windows RAM for plaintext creds, NTLM & Kerberos], [`sekurlsa::logonpasswords`],
  [#cmd("Metasploit")], [Exploitation framework (`msfconsole`) & payload builder (`msfvenom`)], [#cmd("msfvenom -p linux/x64/shell_reverse_tcp")],
  [Linux PrivEsc], [Audit `sudo -l`, SUID binaries, cron jobs & writable `/etc/passwd`], [#cmd("find / -perm -4000 2>/dev/null")],
  [Windows PrivEsc], [Unquoted service paths, `AlwaysInstallElevated`, token abuse], [`whoami /priv` (SeImpersonate)],
  [Log Defense], [Attackers wipe Event Logs (`wevtutil`) or `history -c`], [Counter via remote *SIEM* (`Wazuh`)!],
)

#section-banner(num: "MODULE 06", title: "MALWARE THREATS & SOCIAL ENGINEERING VECTORS", color: rtech-red)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🦠 Malware Classifications & Analysis]
      #v(2pt)
      • *Trojan:* Disguised as legitimate software; opens hidden backdoor\
      • *Worm:* Self-replicates across networks *without* user click (WannaCry)\
      • *Ransomware:* Encrypts victim files & demands crypto ransom\
      • *Rootkit:* Hides malware deep inside OS kernel (`Ring 0`)\
      • *Static:* `strings`, `sha256` · *Dynamic:* Sandbox (`Any.Run`, `Cuckoo`)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#C2410C"))[🧠 Social Engineering Attack Vectors]
      #v(2pt)
      • *Phishing / Spear Phishing:* Fake emails targeting broad / VIP users\
      • *Vishing / Smishing:* Voice call & SMS/WhatsApp OTP scams\
      • *Pretexting:* Creating a fake story ("IT Helpdesk") to steal creds\
      • *Tailgating / Piggybacking:* Following staff into restricted doors\
      • *Watering Hole:* Infecting a website frequently visited by target staff
    ]
  ]
)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Shell / Payload], text(fill: white, weight: "bold")[Reverse Shell vs Bind Shell & Post-Exploitation], text(fill: white, weight: "bold")[Command],
  [Reverse Shell], [Target connects *out* to auditor's listener (bypasses inbound FW!)], [#cmd("nc -lvnp 4444")],
  [Bind Shell], [Target opens a port & waits for auditor to connect inbound], [#cmd("nc -lvnp 4444 -e /bin/bash")],
  [TTY Upgrade], [Upgrade basic netcat shell to interactive PTY (Tab/Ctrl+C)], [#cmd("python3 -c 'import pty;pty.spawn(\"/bin/bash\")'")],
)

#lab-challenge("Password Strength & Hash Audit", "Create a test hash in Kali with echo -n 'Welcome123' | sha256sum, then test how fast CrackStation.net or john --wordlist=/usr/share/wordlists/rockyou.txt cracks weak passwords vs 14-char passphrases!")

#v(2pt)
#block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[🚀 Privilege Escalation Quick Checklist (Linux & Windows)]
  #v(2pt)
  • *Linux:* Check #cmd("sudo -l"), SUID binaries (`GTFOBins`), writable `/etc/cron*`, and kernel version (`uname -a`).\
  • *Windows:* Check `whoami /priv`, `systeminfo`, unquoted service paths, and stored creds (`cmdkey /list`) via `WinPEAS`.
]

#v(2pt)
#block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🧪 VirusTotal & EICAR Anti-Malware Test File (Safe AV Lab)]
  #v(2pt)
  • #link("https://www.virustotal.com")[*VirusTotal.com*] — Upload suspicious `.exe`/PDF/URL or paste `SHA-256` hash to scan across *70+ Antivirus engines* instantly!\
  • #link("https://www.eicar.org")[*EICAR Test File (eicar.org)*] — A 100% harmless 68-byte text string recognized as a "test virus" by all AVs so you can safely test Defender/EDR alerts without real malware!
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.4pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[Security Site], text(fill: white, weight: "bold")[Malware Analysis, Safe AV Testing & Hash Lookup], text(fill: white, weight: "bold")[Direct Link],
  [*VirusTotal*], [Scan suspicious files/URLs/hashes with 70+ Antivirus engines simultaneously], [#link("https://www.virustotal.com")[virustotal.com ↗]],
  [*EICAR Test File*], [Safe standard 68-byte anti-malware test string to verify AV/EDR detection], [#link("https://www.eicar.org")[eicar.org ↗]],
  [*ANY.RUN Sandbox*], [Interactive cloud malware sandbox to watch live process & network behavior], [#link("https://app.any.run")[app.any.run ↗]],
  [*CrackStation*], [Massive online lookup table to test weak MD5/SHA1/NTLM password hashes], [#link("https://crackstation.net")[crackstation.net ↗]],
)

#did-you-know[
  *Salting* adds unique random characters to every user's password before hashing! Even if two users pick the exact same password (`Admin@123`), their hashes in `/etc/shadow` look completely different, defeating precomputed *Rainbow Tables*!
]

#pagebreak()

// =============================================================================
// PAGE 05: SNIFFING, WIRESHARK, DoS/DDoS, SESSION HIJACKING & IDS EVASION
// =============================================================================

#section-banner(num: "MODULE 07", title: "PACKET SNIFFING, WIRESHARK FILTERS & MITM ATTACKS", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[Filter / Attack], text(fill: white, weight: "bold")[Packet Analysis & Sniffing Purpose], text(fill: white, weight: "bold")[Wireshark / Tool],
  [#cmd("ip.addr == 10.0.0.5")], [Show all packets sent to or from a specific IP address], [`ip.src ==` / `ip.dst ==`],
  [#cmd("http.request")], [Inspect unencrypted HTTP GET/POST logins & cookies], [`http.request.method == "POST"`],
  [#cmd("tcp.port == 443")], [Filter traffic on HTTPS (`443`), SSH (`22`), or DNS (`53`)], [`udp.port == 53`],
  [#cmd("tcp.flags.syn == 1")], [Detect SYN Flood or Nmap Stealth SYN port scanning], [`tcp.flags.reset == 1`],
  [ARP Poisoning (MITM)], [Send fake ARP replies to intercept LAN traffic (PC ↔ Router)], [`Bettercap`, `Ettercap`],
  [MAC Flooding], [Overflow switch CAM table so switch fails-open like a hub], [Defend: *Port Security*],
)

#section-banner(num: "MODULE 08", title: "DoS / DDoS, SESSION HIJACKING & IDS / FIREWALL EVASION", color: rtech-amber)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[🌊 DoS & DDoS Attack Vectors]
      #v(2pt)
      • *SYN Flood:* Exhaust half-open TCP table (Mitigate: *SYN Cookies*)\
      • *DNS / NTP Amplification:* Tiny spoofed query → massive reply flood\
      • *HTTP Flood (L7):* Looks like normal web traffic; bypasses L4 FWs\
      • *Botnet:* Compromised *Zombie* IoT/PCs controlled via C2 server
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[🍪 Session Hijacking & Defenses]
      #v(2pt)
      • *Stealing Session ID:* Sniffing HTTP, XSS (`document.cookie`), Brute-force\
      • *Session Fixation:* Forcing victim to log in with known SID\
      • *Defenses:* Always use *HTTPS*, `HttpOnly` + `Secure` + `SameSite` flags, and regenerate Session ID right after login!
    ]
  ]
)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Defense Tech], text(fill: white, weight: "bold")[How It Works & How Attackers Try to Evade It], text(fill: white, weight: "bold")[Examples],
  [IDS vs IPS], [*IDS* detects & alerts passively; *IPS* blocks malicious packets inline], [`Snort`, `Suricata`],
  [WAF (Web App FW)], [Inspects HTTP/HTTPS payloads for SQLi, XSS & bad bots], [`Cloudflare`, `ModSecurity`],
  [Honeypot], [Decoy vulnerable server designed to trap & study attackers], [`Cowrie`, `Honeyd`],
  [IDS Evasion], [Packet fragmentation (`-f`), slow timing (`-T1`), TLS encryption], [Counter: Deep Packet Inspection],
)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🔍 Wireshark Threat Hunting Filters]
      #v(2pt)
      • Cleartext Creds: #cmd("ftp || telnet || http.authbasic")\
      • ARP Spoofing: #cmd("arp.duplicate-address-detected")
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🛡️ DDoS Mitigation Essentials]
      #v(2pt)
      • Enable *Rate Limiting*, *Anycast CDN* (`Cloudflare`), *BGP Blackholing*\
      • Disable open DNS recursion & NTP `monlist` amplification
    ]
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[📡 CLI Packet Capture (`tcpdump` & `tshark` 1-Liners for Servers)]
  #v(2pt)
  • Capture HTTP/DNS to `.pcap` for Wireshark: #cmd("sudo tcpdump -i eth0 -w capture.pcap port 80 or port 53")\
  • Extract live HTTP URLs & Hosts via `tshark`: #cmd("tshark -i eth0 -Y 'http.request' -T fields -e http.host -e http.request.uri")
]

#v(2pt)
#block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🧰 CyberChef & Top Packet/Network GitHub Repos]
  #v(2pt)
  • #link("https://gchq.github.io/CyberChef/")[*CyberChef (GCHQ)*] — The "Cyber Swiss Army Knife" web app for decoding Base64, Hex, XOR, JWT & URL payloads!\
  • *GitHub Tools:* #link("https://github.com/lgandx/Responder")[*Responder*] (LLMNR/NBT-NS poisoner) · #link("https://github.com/bettercap/bettercap")[*Bettercap*] (MITM suite) · #link("https://github.com/fortra/impacket")[*Impacket*] (SMB/Kerberos scripts)
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[SOC / Blue Site], text(fill: white, weight: "bold")[Decoding, Threat Intel & PCAP Investigation], text(fill: white, weight: "bold")[Direct Link],
  [*CyberChef (GCHQ)*], [Browser-based decoder for Base64, Hex, XOR, AES, JWT & Regex], [#link("https://gchq.github.io/CyberChef/")[gchq.github.io/CyberChef ↗]],
  [*AbuseIPDB*], [Check & report malicious attacker IPs, botnets & SSH brute-forcers], [#link("https://www.abuseipdb.com")[abuseipdb.com ↗]],
  [*urlscan.io*], [Safely inspect phishing URLs, screenshots, DOM & redirects without visiting], [#link("https://urlscan.io")[urlscan.io ↗]],
  [*Malware Traffic*], [Download real-world `.pcap` files to practice Wireshark threat hunting], [#link("https://www.malware-traffic-analysis.net")[malware-traffic-analysis.net ↗]],
  [*The Hacker News*], [Daily breaking cyber security breaches, CVEs & zero-day alerts], [#link("https://thehackernews.com")[thehackernews.com ↗]],
  [*MITRE CVE List*], [Official global dictionary of publicly disclosed cyber vulnerabilities], [#link("https://cve.mitre.org")[cve.mitre.org ↗]],
)

#did-you-know[
  Setting the *`HttpOnly`* flag on a session cookie prevents JavaScript (`document.cookie`) from reading it — neutralizing the #1 impact of Cross-Site Scripting (XSS) session hijacking attacks!
]

#pagebreak()

// =============================================================================
// PAGE 06: WEB APPLICATION HACKING (OWASP TOP 10) & SQL INJECTION
// =============================================================================

#section-banner(num: "MODULE 09", title: "WEB APPLICATION HACKING: OWASP TOP 10 & BURP SUITE", color: rtech-red)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[Vulnerability], text(fill: white, weight: "bold")[Mechanism & Real-World Impact], text(fill: white, weight: "bold")[Prevention],
  [Broken Access / IDOR], [Changing `/api/user?id=101` to `102` leaks another user's data], [Server-side role/owner check],
  [XSS (Stored/Reflected)], [Injecting `<script>alert(1)</script>` runs JS in victim's browser], [Output encoding + CSP Header],
  [CSRF], [Tricking logged-in victim's browser into submitting unauthorized form], [`SameSite` cookies + CSRF Token],
  [SSRF], [Forcing server to fetch internal URLs (`http://169.254.169.254/`)], [Allowlist domains & block local IPs],
  [Directory Traversal], [Using `../../../../etc/passwd` to read arbitrary server files], [Sanitize paths + chroot jail],
  [Command Injection], [Appending `; cat /etc/passwd` to ping/lookup input fields], [Avoid shell exec; strict allowlist],
)

#section-banner(num: "MODULE 10", title: "SQL INJECTION (SQLi), SQLMAP & WEB RECON TOOLS", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[SQLi Type / Tool], text(fill: white, weight: "bold")[How Payload Exploits Database], text(fill: white, weight: "bold")[Payload / Command],
  [Auth Bypass], [Turns `WHERE user=''` into always-TRUE boolean statement], [`admin' OR '1'='1' -- `],
  [UNION-Based SQLi], [Combines attacker `SELECT` results with original query output], [`' UNION SELECT 1,user(),3-- `],
  [Error-Based SQLi], [Triggers verbose DB error messages revealing table/column names], [`' AND 1=CONVERT(int,@@version)--`],
  [Time-Based Blind], [Infers true/false by measuring server sleep delay (no output shown)], [`' OR SLEEP(5)-- `],
  [#cmd("sqlmap") Enum], [Automated tool to dump databases, tables & password hashes], [#cmd("sqlmap -u \"URL?id=1\" --dbs --batch")],
)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🕷️ Burp Suite Core Workflow (Web Pentesting)]
      #v(2pt)
      • *Proxy:* Intercept & modify HTTP/S requests on `127.0.0.1:8080`\
      • *Repeater:* Resend modified payloads manually to test SQLi/IDOR\
      • *Intruder:* Automated fuzzing & brute-force (`Sniper`/`Cluster Bomb`)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🛡️ #1 Golden Defense Against SQL Injection]
      #v(2pt)
      Always use *Parameterized Queries (Prepared Statements)* (`SELECT * FROM users WHERE id = ?`) — never concatenate user input directly into SQL strings!
    ]
  ]
)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Web Recon Tool], text(fill: white, weight: "bold")[Directory, Subdomain & API Discovery Purpose], text(fill: white, weight: "bold")[Command],
  [#cmd("gobuster") / `ffuf`], [Brute-force hidden `/admin`, `/backup`, `.env` & API endpoints], [#cmd("gobuster dir -u URL -w list.txt")],
  [#cmd("nikto")], [Scan web servers for outdated Apache/Nginx versions & misconfigs], [#cmd("nikto -h https://target.com")],
  [#cmd("subfinder")], [Fast passive subdomain enumeration for bug bounty scopes], [#cmd("subfinder -d target.com")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#C2410C"))[🐞 Bug Bounty Bonus: 4 High-Paying Web & API Flaws]
  #v(2pt)
  • *JWT `alg: none` / Weak Secret:* Crack with `hashcat -m 16500` · *CORS Misconfig:* `Access-Control-Allow-Origin: *` + `Credentials: true`\
  • *File Upload Bypass:* Test `.php5`, double extension `shell.php.jpg`, MIME spoof · *Open Redirect:* `?next=https://evil.com`
]

#v(2pt)
#align(center)[
  #box(stroke: 0.6pt + rgb("#CBD5E1"), radius: 4pt, clip: true, width: 100%)[
    #image("02_BRAND_ASSETS/eh_sqli_defense_visual.png", width: 100%)
  ]
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.4pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[Web Security Site], text(fill: white, weight: "bold")[Free Web Hacking Labs, CVE Payloads & Wordlists], text(fill: white, weight: "bold")[Direct Link],
  [*PortSwigger Academy*], [100% free interactive labs for SQLi, XSS, CSRF, SSRF & Burp Suite], [#link("https://portswigger.net/web-security")[portswigger.net/web-security ↗]],
  [*Exploit-DB*], [Official archive of public exploits, PoCs & Google Hacking Database (GHDB)], [#link("https://www.exploit-db.com")[exploit-db.com ↗]],
  [*GTFOBins*], [Curated list of Unix binaries used to bypass local security & escalate privs], [#link("https://gtfobins.github.io")[gtfobins.github.io ↗]],
)

#did-you-know[
  *SSRF (Server-Side Request Forgery)* is one of the deadliest cloud vulnerabilities! On AWS/GCP/Azure VMs, an SSRF bug can query `http://169.254.169.254/latest/meta-data/` and steal temporary IAM cloud credentials!
]

#pagebreak()

// =============================================================================
// PAGE 07: WI-FI, CRYPTOGRAPHY, TOP GITHUB REPOS, WEBSITES & CAREER TRACKS
// =============================================================================

#section-banner(num: "MODULE 11", title: "CRYPTOGRAPHY, WI-FI (WPA2/WPA3) & CLOUD SECURITY", color: rtech-purple)

#table(
  columns: (auto, auto, 1fr, auto),
  inset: (x: 5pt, y: 4.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[Type], text(fill: white, weight: "bold")[Algorithms], text(fill: white, weight: "bold")[Key Property & Real-World Use Case], text(fill: white, weight: "bold")[Key Size],
  [*Symmetric*], [`AES`, `ChaCha20`], [Same key encrypts & decrypts; 1,000× faster for bulk data/TLS], [`AES-128 / 256`],
  [*Asymmetric*], [`RSA`, `ECC`, `ECDHE`], [Public key encrypts, Private key decrypts; key exchange & PKI], [`RSA-2048 / 4096`],
  [*Hashing*], [`SHA-256`, `bcrypt`], [One-way fixed digest; verifies integrity (never decryptable)], [`256-bit`],
  [*Wi-Fi Security*], [`WPA2` / `WPA3-SAE`], [Audit via `airmon-ng` → `airodump-ng` → `aircrack-ng`; avoid WEP!], [`AES-CCMP`],
)

#section-banner(num: "MODULE 12", title: "MUST-BOOKMARK GITHUB REPOS & PRACTICE LAB WEBSITES", color: rtech-blue)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🐙 Top Ethical Hacking GitHub Repos]
      #v(2pt)
      • #link("https://github.com/swisskyrepo/PayloadsAllTheThings")[*PayloadsAllTheThings*] — SQLi, XSS & PrivEsc payloads\
      • #link("https://github.com/danielmiessler/SecLists")[*SecLists*] — #1 wordlists for fuzzing & brute-force\
      • #link("https://github.com/peass-ng/PEASS-ng")[*LinPEAS / WinPEAS*] — Auto PrivEsc audit scripts\
      • #link("https://github.com/projectdiscovery/nuclei")[*Nuclei*] & #link("https://github.com/ffuf/ffuf")[*ffuf*] — Vuln & directory fuzzers
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🌐 Essential Websites for Ethical Hackers]
      #v(2pt)
      • #link("https://tryhackme.com")[*TryHackMe*] & #link("https://hackthebox.com")[*HackTheBox*] — Gamified CTF labs\
      • #link("https://portswigger.net/web-security")[*PortSwigger Academy*] — #1 Free Web Security labs\
      • #link("https://www.virustotal.com")[*VirusTotal*] & #link("https://www.eicar.org")[*EICAR*] — Malware & AV test\
      • #link("https://gtfobins.github.io")[*GTFOBins*] & #link("https://www.exploit-db.com")[*Exploit-DB*] — PrivEsc & CVEs
    ]
  ]
)

#section-banner(num: "MODULE 13", title: "ETHICAL HACKING CAREER TRACKS, ROADMAP & SALARY PATH", color: rtech-navy)

#align(center)[
  #box(stroke: 0.6pt + dark-border, radius: 4pt, clip: true, width: 100%)[
    #image("02_BRAND_ASSETS/eh_career_roadmap.png", width: 100%)
  ]
]
#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Career Track], text(fill: white, weight: "bold")[Core Skills & Daily Tools], text(fill: white, weight: "bold")[Target Certs],
  [SOC Analyst (L1/L2)], [Wireshark, SIEM (`Splunk`/`Wazuh`), Log Triage, Incident Response], [CSCU / Blue Team],
  [VAPT / Pentester], [Nmap, Burp Suite, SQLmap, Metasploit, LinPEAS, Report Writing], [CEH / EHE / OSCP],
  [Bug Bounty Hunter], [Subfinder, ffuf, Nuclei, IDOR/SSRF/XSS Hunting on HackerOne], [PortSwigger Labs],
)

#v(2pt)
#block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🚨 6-Step Incident Response Playbook (PICERL — SOC Standard)]
  #v(2pt)
  *1. Preparation* (SIEM/Backups) → *2. Identification* (Triage Alert) → *3. Containment* (Isolate Host/Block IP) → *4. Eradication* (Remove Malware/Patch) → *5. Recovery* (Restore Clean Data) → *6. Lessons Learned* (Update Rules)
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Practice Platform], text(fill: white, weight: "bold")[Best Career & CTF Training Websites (Start Today!)], text(fill: white, weight: "bold")[Direct Link],
  [*TryHackMe*], [Guided beginner-to-pro browser labs for Linux, Nmap, SOC & Pentesting], [#link("https://tryhackme.com")[tryhackme.com ↗]],
  [*Hack The Box (HTB)*], [Real-world vulnerable machines & Pro Labs for intermediate/advanced pentesters], [#link("https://www.hackthebox.com")[hackthebox.com ↗]],
  [*picoCTF (CMU)*], [Free beginner-friendly Capture The Flag puzzles for students & colleges], [#link("https://picoctf.org")[picoctf.org ↗]],
  [*HackerOne / Bugcrowd*], [Top bug bounty platforms to legally hack companies & earn cash rewards], [#link("https://www.hackerone.com")[hackerone.com ↗]],
  [*HackViser / LetsDefend*], [Hands-on Red Team & SOC Blue Team browser attack-defense labs], [#link("https://letsdefend.io")[letsdefend.io ↗]],
)

#v(2pt)
#block(width: 100%, fill: rgb("#0F172A"), stroke: 0.7pt + rgb("#10B981"), radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#34D399"))[⚡ Daily Ethical Hacker 5-Command Terminal Routine]
  #v(2pt)
  #text(size: 7.2pt, fill: rgb("#E2E8F0"))[
    *1.* #cmd("sudo apt update && sudo apt full-upgrade -y") · *2.* #cmd("nmap -sS -sV -T4 target") · *3.* #cmd("gobuster dir -u URL -w common.txt") · *4.* #cmd("nikto -h URL") · *5.* #cmd("sqlmap -u URL?id=1 --dbs")
  ]
]

#did-you-know[
  *TLS/HTTPS* uses *both* Asymmetric and Symmetric encryption! First, *Asymmetric* (`RSA`/`ECDHE`) safely exchanges a session key; then *Symmetric* (`AES-256`) encrypts all web data because symmetric encryption is *1,000× faster*!
]

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR PROFILE (WITH CREDENTIALS), RTECHLAB LOGO, MOTTO, QR & Q&A
// =============================================================================

#align(center)[
  #box(height: 22pt)[#image("02_BRAND_ASSETS/rtechlab-header-logo.png", height: 22pt)]
  #v(1.5pt)
  #text(size: 9.8pt, weight: "black", fill: rtech-navy)[Author Mentorship Hub, Official Credentials & Interview Vault]
  #v(1pt)
  #text(size: 6.7pt, fill: rtech-muted)[RTechLab Proprietary Edition · Author Profile & Certifications · Scannable QR Hubs · Top 10 Interview Q&A]
]

#section-banner(num: "POINT 01", title: "Author Profile & Certifications: Rahul Patel — Founder & Systems Architect", color: rtech-navy)

#block(
  width: 100%,
  stroke: 0.65pt + dark-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: 5pt,
  [
    #grid(
      columns: (54pt, 1fr),
      gutter: 7pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-red,
          radius: 5pt,
          clip: true,
          width: 48pt,
          height: 60pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 9.2pt, weight: "black", fill: rtech-navy)[Rahul Patel] #h(4pt) #hl-b[10+ Yrs IT Exp] #h(3pt) #hl-g[3,000+ Students Trained]\
        #v(1pt)
        #text(size: 6.8pt, weight: "bold", fill: rtech-red)[Founder & Lead Systems Architect · RTechLab] · #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[Director · IANT Computer Education, Palanpur]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "bold", fill: rtech-navy)[
          🏅 *Verified Author Credentials:* #hl-r[CEH (Certified Ethical Hacker)] · #hl-b[CSCU (EC-Council)] · #hl-y[EHE (Star Certification)] · #hl-g[SCSU (Star Certification)]
        ]\
        #v(1.5pt)
        #text(size: 6.4pt, fill: rtech-navy)[
          *RTechLab Motto:* _"Technology Made Practical — Empowering every student from classroom to corporate with 100% original, crystal-clear, hands-on engineering guides."_
        ]
      ]
    )
  ]
)

#section-banner(num: "POINT 02", title: "Author Portfolio, YouTube, Instagram & WhatsApp Community Hub", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0F9FF"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 46pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 46pt)]
        #v(1pt)
        #text(size: 6.5pt, weight: "black", fill: rtech-blue)[Author Portfolio]\
        #text(size: 5.4pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 46pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 46pt)]
        #v(1pt)
        #text(size: 6.5pt, weight: "black", fill: rgb("#E11D48"))[YouTube Channel]\
        #text(size: 5.4pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 46pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 46pt)]
        #v(1pt)
        #text(size: 6.5pt, weight: "black", fill: rgb("#DB2777"))[Instagram Hub]\
        #text(size: 5.4pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4pt)[
      #align(center)[
        #box(height: 46pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 46pt)]
        #v(1pt)
        #text(size: 6.5pt, weight: "black", fill: rgb("#166534"))[WhatsApp Channel]\
        #text(size: 5.4pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[Free Community Access ↗]]
      ]
    ]
  ],
)

#section-banner(num: "POINT 03", title: "Top 10 Cyber Security & Pentester Interview Quick-Fire Q&A", color: rtech-emerald)

#table(
  columns: (auto, 1fr),
  inset: (x: 4.5pt, y: 3.3pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[\#], text(fill: white, weight: "bold")[SOC / Pentester Technical Interview Question + Crisp Answer],
  [*Q1*], [*Encryption vs Hashing?* Encryption is two-way (reversible with key, e.g., AES); Hashing is one-way fixed digest (irreversible, e.g., SHA-256).],
  [*Q2*], [*SYN Scan (`-sS`) vs Connect Scan (`-sT`)?* `-sS` sends `RST` after `SYN-ACK` (stealthy, half-open); `-sT` completes full 3-way handshake.],
  [*Q3*], [*How to stop SQL Injection permanently?* Use Parameterized Queries (Prepared Statements), strict input validation & least-privilege DB accounts.],
  [*Q4*], [*XSS vs CSRF?* XSS executes malicious JS inside victim's browser; CSRF tricks victim's browser into sending an authenticated request.],
  [*Q5*], [*What does DNSSEC protect?* Origin authentication & data integrity of DNS responses (prevents DNS spoofing; does NOT encrypt traffic).],
  [*Q6*], [*Vulnerability Assessment vs Pentesting?* VA finds & ranks weaknesses (`Nessus`); Pentesting actively exploits them to prove real business risk.],
  [*Q7*], [*IDS vs IPS vs SIEM?* IDS alerts passively; IPS blocks inline; SIEM (`Splunk`/`Wazuh`) correlates logs across all servers for SOC triage.],
  [*Q8*], [*What is a Zero-Day Vulnerability?* A newly discovered software flaw with no official vendor patch yet — mitigated via WAF/IPS virtual patching.],
  [*Q9*], [*Symmetric vs Asymmetric Speed?* Symmetric (`AES-256`) uses 1 shared key & is ~1,000× faster; Asymmetric (`RSA`) uses Public/Private keypairs.],
  [*Q10*], [*What is a Reverse Shell?* Target initiates outbound connection back to auditor's listener (`nc -lvnp`), bypassing strict inbound firewall rules.],
)

#did-you-know[
  *Ethical & Legal Rule:* Never scan or test any website, Wi-Fi, or server you do not own or have written permission for! Practice safely on *TryHackMe*, *HackTheBox*, *PortSwigger Academy*, or your own *Kali Linux* VM lab.
]

#v(2pt)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: 0.7pt + rgb("#93C5FD"),
  radius: 3pt,
  inset: (x: 7pt, y: 4pt),
  [
    #align(center)[
      #text(size: 7.3pt, weight: "bold", fill: rtech-blue)[
        🚀 Explore Complete RTechLab Career Suites, Networking & Security Labs at #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]
      ]
    ]
  ]
)

#v(2pt)
#block(
  width: 100%,
  fill: rgb("#0F172A"),
  radius: 4pt,
  inset: 6pt,
  [
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #box(fill: rgb("#064E3B"), stroke: 0.6pt + rgb("#10B981"), radius: 3pt, inset: (x: 6pt, y: 3pt))[
          #grid(
            columns: (auto, auto),
            gutter: 5pt,
            align: (horizon, horizon),
            [#image("02_BRAND_ASSETS/whatsapp_logo.svg", height: 12pt)],
            [#text(size: 7.2pt, weight: "bold", fill: rgb("#A7F3D0"))[RTechLab WhatsApp Help Desk: ] #link("https://wa.me/917646892094")[#text(size: 7.6pt, weight: "black", fill: white)[+91 76468 92094]] #text(size: 6.5pt, fill: rgb("#6EE7B7"))[ (Chat-Only Support)]]
          )
        ]
      ],
      [
        #box(fill: rgb("#DC2626"), radius: 3pt, inset: (x: 7pt, y: 4pt))[
          #text(size: 7.0pt, weight: "black", fill: white)[RTECHLAB · 2027 EDITION]
        ]
      ]
    )
  ]
)
