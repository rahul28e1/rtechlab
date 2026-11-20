#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 06 · CISCO CLI COMMANDS & HARDENING]
= Chapter 6: Production Cisco CLI Commands & Baseline Hardening

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Mastery of Cisco IOS command-line hierarchy: prompt navigation modes, productivity shortcuts, global configuration syntax, administrative password encryption, enterprise SSH v2 2048-bit RSA deployment, console port security, CDP and LLDP neighbor discovery triage, interface speed/duplex negotiation, and TFTP disaster recovery backup/restore operations.
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

#v(3pt)

== 6.2 Essential Cisco CLI Keystrokes & Productivity Shortcuts
#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Shortcut Keystroke*], [*CLI Function*], [*Production Utility*]),
  [`?` (Question Mark)], [Context-Sensitive Help], [Lists all valid keywords or syntax parameters available at the exact cursor position.],
  [`Tab`], [Command Auto-Completion], [Completes a partially typed command once enough characters uniquely identify it.],
  [`Ctrl + A`], [Move Cursor to Line Start], [Jumps immediately to the beginning of the command string for quick editing.],
  [`Ctrl + E`], [Move Cursor to Line End], [Jumps immediately to the end of the command string.],
  [`Ctrl + Z` or `end`], [Return to Privileged Mode], [Exits any deep sub-configuration level back to `Router#` in a single keystroke.],
  [`Ctrl + C`], [Abort Running Command], [Terminates ongoing ping sequences, traceroutes, or raw terminal operations.],
  [`Ctrl + Shift + 6`], [Break Sequence], [Interrupts hung DNS lookup broadcasts or deep IOS ping floods immediately.],
  [`Up Arrow` / `Down Arrow`], [Command History], [Recalls the last 10 commands executed in the current session (configurable).]
)

#v(3pt)

== 6.3 Baseline Device Configuration & Password Hardening
When deploying any Cisco router or switch into production, the following baseline security controls must be configured:
- *Disable DNS Lookups:* By default, if an engineer mistypes a command (e.g. `tehnet`), the router assumes it is a hostname and broadcasts DNS queries to `255.255.255.255`, hanging the CLI for up to 30 seconds:
  `Router(config)# no ip domain-lookup`
- *Message of the Day (MOTD) Banner:* Enforces legal notice informing unauthorized intruders of prosecution:
  `Router(config)# banner motd # AUTHORIZED PERSONNEL ONLY. ALL SESSIONS MONITORED. #`
- *Enable Secret vs Enable Password:*
  - `enable password Cisco123`: Uses weak, easily cracked Type 7 Vigenere encryption. #hl[NEVER USE IN PRODUCTION!]
  - `enable secret CiscoSecret2027!`: Computes a robust cryptographic SHA-256 or MD5 hash. Overrides `enable password`.
- *Global Password Encryption:*
  `Router(config)# service password-encryption` (Obfuscates plain-text passwords in `show running-config`).

#v(3pt)

== 6.4 Hands-On Practical Lab: Baseline Hardening & Enterprise SSH v2
#text(size: 7.5pt, fill: rtech-text)[*Objective:* Deploy enterprise baseline security and SSH Version 2 on Cisco 2911 router (R1-EDGE-CORE). Generate a 2048-bit RSA keypair, create a local privilege-15 administrator, enforce console line timeouts with `logging synchronous`, and verify encrypted PuTTY access.]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab01-ssh-topology.svg", width: 95%)
#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*Device*], [*Interface*], [*IP Address*], [*Subnet Mask*], [*Role / Notes*],
  [R1-EDGE-CORE], [Gi0/0/0], [192.168.1.1], [255.255.255.0], [Management Gateway, SSH Server],
  [Admin-Laptop], [FastEthernet0], [192.168.1.10], [255.255.255.0], [Admin PC, PuTTY / SSH Client],
  [Admin-Laptop], [RS232 (COM)], [N/A (Console)], [N/A], [Light-Blue Rollover to R1 RJ45 Console]
)

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Production Configuration Script (Copy-Paste Ready):]
```cisco
Router> enable
Router# configure terminal
R1-EDGE-CORE(config)# hostname R1-EDGE-CORE
R1-EDGE-CORE(config)# no ip domain-lookup
R1-EDGE-CORE(config)# banner motd # AUTHORIZED SESSIONS MONITORED. #
R1-EDGE-CORE(config)# enable secret CiscoSecret2027!
R1-EDGE-CORE(config)# service password-encryption
! --- Line Console 0 Hardening ---
R1-EDGE-CORE(config)# line console 0
R1-EDGE-CORE(config-line)# password ConsolePass2027! ; login
R1-EDGE-CORE(config-line)# exec-timeout 5 0 ; logging synchronous ; exit
! --- SSH v2 Deployment ---
R1-EDGE-CORE(config)# ip domain-name rtechlab.internal
R1-EDGE-CORE(config)# crypto key generate rsa modulus 2048
R1-EDGE-CORE(config)# ip ssh version 2
R1-EDGE-CORE(config)# username netadmin privilege 15 secret AdminSecure2027!
R1-EDGE-CORE(config)# line vty 0 4
R1-EDGE-CORE(config-line)# transport input ssh ; login local
R1-EDGE-CORE(config-line)# exec-timeout 10 0 ; logging synchronous ; exit
! --- Interface Setup ---
R1-EDGE-CORE(config)# interface GigabitEthernet0/0/0
R1-EDGE-CORE(config-if)# description MGMT_LAN_INTERFACE
R1-EDGE-CORE(config-if)# ip address 192.168.1.1 255.255.255.0 ; no shutdown
R1-EDGE-CORE(config-if)# end ; copy running-config startup-config
```

#v(2pt)
#terminal-specimen(title: "R1-EDGE-CORE# show ip ssh")[
```text
SSH Enabled - version 2.0
Authentication timeout: 120 secs; Authentication retries: 3
Minimum expected Diffie-Hellman key size : 2048 bits
IOS Keys in SECSH format(ssh-rsa, base64 encoded): rtechlab.internal:2048
R1-EDGE-CORE# show ip interface brief | include up
GigabitEthernet0/0/0       192.168.1.1     YES manual up                    up
```
]

#concept-box(title: "TAC FIELD ENGINEERING PRO-TIP: LOGGING SYNCHRONOUS")[
  When working in Cisco CLI, unexpected Syslog messages (such as `%LINK-3-UPDOWN`) often interrupt your cursor in the middle of typing a command.
  *Fix:* Always configure `logging synchronous` under `line con 0` and `line vty 0 4`. The router redisplays your currently typed string on a clean new line beneath the Syslog message!
]

#v(3pt)

== 6.5 Cisco Router & IOS Backup and Restore via TFTP
To prepare for hardware failure, configurations and IOS binary images must be regularly backed up to a central Trivial File Transfer Protocol (TFTP) server (UDP Port 69):
- *Backing up Cisco IOS Image to TFTP:*
  `Router# copy flash: tftp:`
  `Source filename []? c2900-universalk9-mz.SPA.157-3.M3.bin`
  `Address or name of remote host []? 192.168.1.100`
  `Destination filename [c2900-universalk9-mz.SPA.157-3.M3.bin]? <Enter>`
- *Backing up Running Configuration to TFTP:*
  `Router# copy running-config tftp:`
  `Address or name of remote host []? 192.168.1.100`
  `Destination filename [r1-edge-core-confg]? R1-EDGE-CORE-CONFIG-BACKUP.cfg`
- *Restoring Configuration from TFTP:*
  `Router# copy tftp: running-config` (Merges TFTP configuration into active RAM).
  `Router# copy tftp: startup-config` (Overwrites NVRAM with disaster recovery configuration).

#v(3pt)

== 6.6 Neighbor Discovery: Cisco CDP vs Industry-Standard LLDP
Discovery protocols operate at Layer 2 to discover directly connected neighbors regardless of IP configurations:
- *Cisco Discovery Protocol (CDP):* Cisco proprietary. Enabled by default. Multicast address `0100.0ccc.cccc`. Advertises device ID, local interface, capabilities (Router, Switch), platform model, and remote port ID every 60 seconds (Holdtime 180s).
- *Link Layer Discovery Protocol (LLDP - IEEE 802.1AB):* Vendor-neutral open standard. Disabled by default on Cisco IOS. Transmits advertisements every 30 seconds (Holdtime 120s). Must be explicitly activated:
  `Router(config)# lldp run` ; `Router(config-if)# lldp transmit` ; `Router(config-if)# lldp receive`

#v(3pt)


== 6.7 Interface Speed, Duplex & Error Counters Diagnostic Matrix
When Ethernet interfaces experience physical link issues, `show interfaces` reports critical error counters:
#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Error Metric*], [*Physical Root Cause*], [*Engineering Remediation & Triage*]),
  [Runts], [Frames smaller than 64-byte minimum], [Caused by collisions, faulty NIC drivers, or transceiver electrical noise.],
  [Giants], [Frames exceeding 1518-byte MTU limit], [Host transmitting baby-giant or jumbo frames without interface MTU adjustment.],
  [CRC Errors], [Corrupted checksum in Ethernet trailer], [Defective Cat6 cable, bad RJ45 crimp, electromagnetic interference (EMI), or bad SFP.],
  [Late Collisions], [Collision occurring after first 64 bytes], [#hl[Duplex Mismatch!] One side is set to Half-Duplex while the other is Full-Duplex.],
  [Input Errors], [Total sum of runts, giants, and CRC errors], [Replace patch cord, clean fiber optical endfaces, or inspect switch ASIC port.]
)

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why does crypto key generate rsa fail with an error asking for a domain name?", a: "The RSA public-private keypair requires a Fully Qualified Domain Name (FQDN) formed by combining the hostname with the domain name ('hostname.domain-name'). Without 'ip domain-name', the crypto engine cannot label the key!")
#faq-item(q: "Why is Telnet strictly forbidden on enterprise production networks?", a: "Telnet transmits all data, including usernames and administrative passwords, in completely unencrypted cleartext. Anyone with Wireshark on the same subnet can capture the credentials in seconds. SSH v2 encrypts the entire session using AES/RSA.")
#faq-item(q: "What is the difference between copy running-config startup-config and write memory?", a: "They perform the exact same operational task: writing the active RAM configuration into persistent NVRAM. 'copy running-config startup-config' is the official Cisco IOS syntax; 'write memory' (or 'wr') is an older legacy shortcut still supported in Cisco IOS.")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which command exits directly from interface configuration mode back to privileged EXEC mode in one step?", ans: "end (or keystroke Ctrl+Z).")
#short-q(num: 2, q: "What is the minimum recommended RSA key modulus length for secure SSH Version 2 in enterprise environments?", ans: "2048 bits (minimum 1024 bits required by IOS; 2048 recommended for modern compliance).")
#short-q(num: 3, q: "Identify the command used to prevent a Cisco router from hanging when an invalid command is mistyped.", ans: "no ip domain-lookup.")
#short-q(num: 4, q: "Which UDP port number does Trivial File Transfer Protocol (TFTP) utilize for file transfers?", ans: "UDP Port 69.")
#short-q(num: 5, q: "What command enables the vendor-neutral LLDP discovery protocol globally on a Cisco switch?", ans: "lldp run.")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which Cisco IOS prompt indicates that the administrator is currently in Global Configuration mode?", a: "Router>", b: "Router#", c: "Router(config)#", d: "Router(config-if)#", ans: "C", expl: "Router(config)# is Global Configuration mode. Router> is User Exec, Router# is Privileged Exec, and Router(config-if)# is Interface mode.")
#mcq(num: 2, q: "What is the primary operational effect of configuring the logging synchronous command on a line console?", a: "It encrypts all console messages", b: "It redisplays the currently typed command line beneath any asynchronous Syslog message", c: "It synchronizes router time with an NTP server", d: "It enables SSH v2 logging", ans: "B", expl: "Logging synchronous prevents Syslog output from cutting off partially typed CLI commands by reprinting them neatly.")
#mcq(num: 3, q: "Which command restricts virtual terminal (VTY) lines to accept strictly encrypted SSH connections while blocking cleartext Telnet?", a: "transport input all", b: "transport input ssh", c: "transport output telnet", d: "line vty ssh only", ans: "B", expl: "The command transport input ssh allows only SSH connections and automatically drops incoming Telnet sessions.")
#mcq(num: 4, q: "Which command is utilized to verify directly connected neighboring Cisco hardware model and interface details?", a: "show ip route", b: "show cdp neighbors detail", c: "show ip arp", d: "show running-config", ans: "B", expl: "show cdp neighbors detail displays neighboring device IP addresses, IOS software version, platform model, and duplex settings.")
#mcq(num: 5, q: "What command copies the currently running configuration into non-volatile storage to persist across reboots?", a: "copy startup-config running-config", b: "copy running-config startup-config", c: "copy flash: running-config", d: "reload save", ans: "B", expl: "copy running-config startup-config writes the volatile RAM active configuration to non-volatile NVRAM.")

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The service password-encryption Weakness")[
      `service password-encryption` applies Cisco Type 7 encryption, which uses a trivial XOR lookup key. Free web tools crack Type 7 in milliseconds! Always use `enable secret` and `algorithm-type scrypt`!
    ]
  ],
  [
    #tech-spotlight-box(title: "NETCONF & RESTCONF in 2027")[
      Modern network engineers automate Cisco IOS-XE routers using programmatic APIs (NETCONF via SSH on port 830, and RESTCONF via HTTPS on port 443) using YANG data models rather than manual CLI!
    ]
  ]
)
