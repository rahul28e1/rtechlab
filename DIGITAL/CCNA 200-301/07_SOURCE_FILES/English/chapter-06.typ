#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 06 · CISCO CLI COMMANDS & HARDENING]
= Chapter 6: Production Cisco CLI Commands & Hardening

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Mastery of Cisco IOS command-line hierarchy: prompt navigation modes, global configuration syntax, administrative password encryption, SSH v2 2048-bit RSA deployment, console port security, CDP and LLDP neighbor discovery triage, and interface speed/duplex negotiation.
]

#v(2pt)

== 6.1 Cisco IOS Command-Line Hierarchy & Navigation
The Cisco Internetwork Operating System (IOS) enforces a strict hierarchical access tree to prevent unauthorized or accidental modifications:
- *1. User Exec Mode (`Router>`):* Initial unprivileged monitoring mode. Allows basic inspection (`ping`, `traceroute`, `show version`). Cannot alter device state or view full running configuration.
- *2. Privileged Exec Mode (`Router#`):* Administrative inspection mode entered via `enable`. Allows full configuration inspection (`show running-config`), flash file management (`dir`, `delete`), debugging, and software reboots (`reload`).
- *3. Global Configuration Mode (`Router(config)#`):* System-wide configuration mode entered via `configure terminal`. Commands configured here impact the entire device (hostname, banners, routing protocols, user databases).
- *4. Contextual Configuration Sub-Modes:*
  - *Interface Mode (`Router(config-if)#`):* `interface GigabitEthernet0/0/0` — Port IP addresses, speed, duplex, switchport modes.
  - *Subinterface Mode (`Router(config-subif)#`):* `interface g0/0/0.10` — 802.1Q VLAN encapsulation tags and routed IP addresses.
  - *Line Configuration Mode (`Router(config-line)#`):* `line console 0` or `line vty 0 4` — Console and remote terminal security.
  - *Routing Engine Mode (`Router(config-router)#`):* `router ospf 1` — Dynamic routing networks, areas, passive interfaces.

#v(2pt)

== 6.2 Essential Cisco CLI Keystrokes & Productivity Shortcuts
#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Shortcut Keystroke*], [*CLI Function*], [*Production Utility*]),
  [`?` (Question Mark)], [Context-Sensitive Help], [Lists all valid keywords or syntax parameters available at the exact cursor position.],
  [`Tab`], [Command Auto-Completion], [Completes a partially typed keyword once sufficient unique characters are entered.],
  [`do` prefix], [Execute Privileged Commands], [Executes Privileged `show` commands directly from inside sub-modes (e.g. `do show ip int brief`).],
  [`Ctrl + A` / `Ctrl + E`], [Cursor Home / End], [Moves cursor instantly to the beginning or end of the active command line.],
  [`Ctrl + C` / `Ctrl + Z`], [Escape to Privileged Mode], [Instantly aborts configuration sub-modes and returns to `Router#` prompt.],
  [`Ctrl + Shift + 6`], [DNS Escape Break], [Interrupts hung DNS broadcast lookups when an invalid command is mistyped.]
)

#v(2pt)

== 6.3 Baseline Device Configuration & Password Hardening
When deploying a factory-fresh Cisco router or switch, the following security baseline is mandatory:
- *Hostname Assignment:* Identifies device role and campus tier: `Router(config)# hostname R1-EDGE-CORE`
- *Legal MOTD Warning Banner:* Mandated by cybersecurity compliance frameworks (ISO 27001, SOC 2) to establish legal standing:
  `R1(config)# banner motd # AUTHORIZED ACCESS ONLY. ALL SESSIONS MONITORED AND LOGGED. #`
- *Disable Unwanted DNS Lookups:* Prevents 30-second CLI hangs when commands are mistyped: `R1(config)# no ip domain-lookup`
- *Enable Secret vs Enable Password:*
  - `enable password CiscoPass` — Legacy; stored in NVRAM using weak reversible Type 7 Vigenere cipher. #text(fill: rtech-rose, weight: "bold")[NEVER USE IN PRODUCTION!]
  - `enable secret CiscoSecret2027` — Stores passwords using irreversible cryptographic hashes (Type 5 MD5, Type 8 PBKDF2-SHA256, or Type 9 Scrypt).
- *Global Password Obfuscation:* Obfuscates plaintext console and line passwords: `R1(config)# service password-encryption`

#pagebreak()

== 6.4 Securing the Physical Console & Virtual Terminal Lines
Administrative access vectors must be locked down against unauthorized physical and network intrusion:
- *Securing Console Port (`line console 0`):*
  ```bash
  R1(config)# line console 0
  R1(config-line)# password ConsoleAuth2027!
  R1(config-line)# login
  R1(config-line)# exec-timeout 5 0
  R1(config-line)# logging synchronous
  ```
  - *`exec-timeout 5 0`:* Automatically logs out idle console sessions after 5 minutes and 0 seconds of inactivity.
  - *`logging synchronous`:* Automatically redisplays the command line when unsolicited syslog messages print to terminal.

#v(2pt)

== 6.5 Deploying Enterprise SSH v2 (Disabling Insecure Telnet)
Telnet (TCP port 23) transmits administrative usernames and passwords in clear plaintext across the network, exposing credentials to packet sniffing. Production routers must enforce *SSH Version 2 (TCP port 22)*:
1. *Set Hostname and Domain Name:* (Prerequisites for cryptographic key generation)
   `R1(config)# hostname R1-GATEWAY`
   `R1(config)# ip domain-name rtechlab.internal`
2. *Generate 2048-Bit RSA Asymmetric Keypair:*
   `R1(config)# crypto key generate rsa modulus 2048`
3. *Enforce SSH Version 2:*
   `R1(config)# ip ssh version 2`
4. *Create Local Administrative User Database:*
   `R1(config)# username admin privilege 15 secret AdminSecurePass2027`
5. *Enforce SSH on Virtual Terminal Lines (`line vty 0 4`):*
   ```bash
   R1(config)# line vty 0 4
   R1(config-line)# transport input ssh
   R1(config-line)# login local
   R1(config-line)# exec-timeout 10 0
   ```
   - *`transport input ssh`:* Strictly forbids insecure Telnet connections on lines vty 0 to 4.
   - *`login local`:* Directs IOS to authenticate incoming connections against the local `username` database.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/hardware-security-yubikey.jpg",
  caption: "Figure 6.1: Enterprise Hardware Security Key for FIDO2 and SSH Cryptographic Authentication.",
  height: 52pt
)

#v(2pt)

== 6.6 Neighbor Discovery: Cisco CDP vs Industry-Standard LLDP
To map connected devices without physical tracing, network engineers utilize Layer 2 discovery protocols:
- *CDP (Cisco Discovery Protocol):* Cisco-proprietary Layer 2 protocol enabled by default on all Cisco interfaces. Transmits periodic advertisements every 60 seconds (holdtime 180s) to multicast MAC `01:00:0C:CC:CC:CC`.
- *LLDP (Link Layer Discovery Protocol - IEEE 802.1AB):* Vendor-neutral open standard used across multi-vendor networks (Cisco, Juniper, Arista, HP). Disabled by default on older Cisco switches.

#pagebreak()

== 6.7 Discovery Protocols Comparison & CLI Syntax
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Feature*], [*Cisco CDP*], [*IEEE 802.1AB LLDP*], [*Operational Utility*]),
  [Standard], [Cisco Proprietary], [IEEE Open Standard], [LLDP operates across mixed Cisco/Juniper/Linux server NICs.],
  [Default State], [#hl[Enabled by default]], [Disabled by default], [CDP is active out of the box on all Cisco routers/switches.],
  [Global Enable], [`cdp run`], [`lldp run`], [Enables discovery daemon system-wide.],
  [Interface Disable], [`no cdp enable`], [`no lldp transmit / receive`], [Crucial: Disable on untrusted public facing / ISP ports!],
  [Summary View], [`show cdp neighbors`], [`show lldp neighbors`], [Displays Device ID, Local Port, Holdtime, Capability, Remote Port.],
  [Detail View], [`show cdp neighbors detail`], [`show lldp neighbors detail`], [Reveals neighbor IP address, full IOS version, duplex, platform.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "CDP Information Security Warning")[
      While CDP is invaluable for network mapping, it broadcasts sensitive infrastructure intelligence (IP addresses, IOS software releases, hardware models) in plaintext! #text(fill: rtech-rose, weight: "bold")[ALWAYS DISABLE CDP] on internet-facing edge ports and untrusted user access ports:      `R1(config-if)# no cdp enable`
    ]
  ],
  [
    #concept-box(title: "Speed & Duplex Hardcoding")[
      When autonegotiation fails between legacy servers and modern switches, hardcode parameters explicitly:      `Switch(config-if)# speed 1000`      `Switch(config-if)# duplex full`      _Rule: If you hardcode one side, you MUST hardcode the connected partner to prevent duplex mismatch!_
    ]
  ]
)

#v(2pt)

== 6.8 Essential Cisco CLI Verification & Triage Commands
- `show ip interface brief` — The most fundamental CCNA command. Summarizes IP address, Layer 1 Status (physical up/down), and Layer 2 Protocol (data link up/down) for all interfaces.
- `show interfaces [interface]` — Displays packet counters, input/output errors, CRC errors, MTU (1500 bytes), and bandwidth/delay metrics.
- `show ip route` — Dumps active routing table entries with routing protocols and administrative distances.
- `show running-config | section [keyword]` — Filters running configuration to show only relevant protocol blocks (e.g., `section ospf` or `section vty`).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What does interface status 'up / down' indicate?", a: "Status 'up' confirms Layer 1 physical carrier signal is detected. Protocol 'down' indicates a Layer 2 failure: encapsulation mismatch (HDLC vs PPP), clock rate missing on serial links, or keepalive timeout.")
#faq-item(q: "Why is service password-encryption considered insufficient for high-security environments?", a: "It employs a weak Type 7 Vigenere cipher that can be instantly decrypted by online cracker tools in milliseconds. Always use 'enable secret' and 'username secret' which utilize SHA-256 or Scrypt.")
#faq-item(q: "What is the function of the logging synchronous command on line console 0?", a: "It prevents unsolicited system log and debug notifications from fragmenting and breaking up the command string an engineer is actively typing.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Name the global configuration command that enforces SSH version 2 on a Cisco router.", ans: "ip ssh version 2.")
#short-q(num: 2, q: "Which command aborts a hung DNS lookup when an invalid command is mistyped in CLI?", ans: "Control + Shift + 6 (Ctrl+Shift+6).")
#short-q(num: 3, q: "What minimum RSA key modulus size is recommended by Cisco for secure SSH v2?", ans: "2048 bits (crypto key generate rsa modulus 2048).")
#short-q(num: 4, q: "Which command displays the neighbor IP address and IOS version using CDP?", ans: "show cdp neighbors detail.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which command configuration correctly locks remote management lines strictly to SSH connections?", a: "transport input all", b: "transport input ssh", c: "transport output telnet", d: "ip ssh enable", ans: "B", expl: "Under line vty 0 4, 'transport input ssh' disables insecure Telnet and permits only encrypted SSH connections.")
#mcq(num: 2, q: "What is the primary difference between enable password and enable secret?", a: "enable password is for switches; enable secret is for routers", b: "enable secret is encrypted using cryptographic hashing; enable password uses weak reversible encryption or plaintext", c: "enable password grants privilege level 15", d: "enable secret requires a smart card", ans: "B", expl: "enable secret uses strong one-way hashing (MD5 or SHA-256) which cannot be reversed, whereas enable password is weak Type 7.")
#mcq(num: 3, q: "What two prerequisites must be configured on a Cisco router before generating RSA keys for SSH?", a: "IP address and default gateway", b: "Hostname and IP domain-name", c: "NTP server and syslog server", d: "OSPF and VLAN 1", ans: "B", expl: "Cisco IOS constructs the Fully Qualified Domain Name (FQDN) for the RSA certificate from the hostname and domain-name.")
#mcq(num: 4, q: "Which command allows an engineer to inspect IP interface status from within interface configuration mode?", a: "show ip interface brief", b: "do show ip interface brief", c: "run show ip interface brief", d: "exit show ip interface brief", ans: "B", expl: "The 'do' prefix allows privileged exec commands to be executed directly from within any configuration sub-mode.")
#mcq(num: 5, q: "What Layer 2 discovery protocol is an open IEEE 802.1AB standard supported across multi-vendor devices?", a: "CDP", b: "LLDP", c: "STP", d: "VTP", ans: "B", expl: "Link Layer Discovery Protocol (LLDP) is standardized by IEEE 802.1AB for multi-vendor interoperability.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Privilege 15 Superuser")[
      Cisco IOS supports 16 privilege levels (0 to 15). Level 1 is standard user exec; Level 15 grants full unrestricted root administrative control over the entire chassis!
    ]
  ],
  [
    #tech-spotlight-box(title: "RESTCONF & NETCONF APIs")[
      Modern network automation bypasses human CLI typing entirely; Python scripts configure Cisco routers programmatically via RESTCONF (HTTPS/JSON) and NETCONF (SSH/YANG)!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
