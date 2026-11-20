#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 06 · CISCO IOS CLI & DISASTER RECOVERY]
= Chapter 6: Cisco IOS CLI Modes, Password Recovery (0x2142) & TFTP Disaster Recovery

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Cisco IOS CLI navigation hierarchy, foundational security hardening, step-by-step password recovery via ROMMON confreg 0x2142, and TFTP backup and restoration disaster recovery workflows.
]

#v(2pt)

== 6.1 Cisco IOS CLI Command Hierarchy
The Cisco Internetwork Operating System (IOS) organizes command execution into a strict permission hierarchy:
- *User EXEC Mode (`Router>`):* Read-only basic monitoring. Permits basic ping, traceroute, and limited show commands.
- *Privileged EXEC Mode (`Router#`):* Administrative control. Accessed via `enable`. Permits configuration viewing (`show running-config`), file manipulation, debugging, and reload.
- *Global Configuration Mode (`Router(config)#`):* System-wide parameters. Accessed via `configure terminal`.
- *Interface Configuration Submode (`Router(config-if)#`):* Specific port parameters (IP addressing, duplex, speed).
- *Line Configuration Submode (`Router(config-line)#`):* Management lines (`line console 0`, `line vty 0 4`).

#v(2pt)

== 6.2 Essential Security Hardening Configuration
#terminal-box([
```cisco
Router(config)# hostname Edge-RTR
Edge-RTR(config)# enable algorithm-type sha256 secret Cisco#123Secure!
Edge-RTR(config)# service password-encryption
Edge-RTR(config)# banner motd # AUTHORIZED ACCESS ONLY - VIOLATORS PROSECUTED #
Edge-RTR(config)# line console 0
Edge-RTR(config-line)# password ConsolePass#1
Edge-RTR(config-line)# login
Edge-RTR(config-line)# logging synchronous
Edge-RTR(config-line)# exec-timeout 5 0
Edge-RTR(config)# ip domain-name rtechlab.lan
Edge-RTR(config)# crypto key generate rsa modulus 2048
Edge-RTR(config)# ip ssh version 2
Edge-RTR(config)# username admin privilege 15 secret AdminPass#2027
Edge-RTR(config)# line vty 0 4
Edge-RTR(config-line)# transport input ssh
Edge-RTR(config-line)# login local
```
])

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab01-ssh-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 6.1: Packet Tracer Lab 01 — Secure Out-of-Band SSH Management Topology.]
]

#pagebreak()

== 6.3 Step-by-Step Password Recovery Procedure (Exact CLI Prompts)
When administrative credentials are lost, the router password must be recovered without losing the production configuration:
- *Step 1: Physical Console Connection:* Connect rollover console cable from PC COM/USB port to router Console port. Open PuTTY configured for `9600-8-N-1`.
- *Step 2: Interrupt Boot Sequence:* Power cycle the router. Within 60 seconds of boot, press `Break` (or `Ctrl+Break` in PuTTY) to interrupt bootstrap and enter ROMMON mode.
- *Step 3: Modify Configuration Register:*
  At the `rommon 1 >` prompt, instruct the router to bypass NVRAM startup-config on next boot:
  #terminal-box([
```cisco
rommon 1 > confreg 0x2142
rommon 2 > reset
```
  ])
- *Step 4: Bypass Initial Setup Dialog:*
  The router reboots with factory defaults into RAM. Answer `no` when prompted:
  `Would you like to enter the initial configuration dialog? [yes/no]: no`
- *Step 5: Enter Privileged Mode & Restore Configuration:*
  #hl[CRITICAL STEP: Do NOT enter 'configure terminal' first!] Copy startup-config from NVRAM into RAM so existing IP addresses and interface settings are preserved:
  #terminal-box([
```cisco
Router> enable
Router# copy startup-config running-config
```
  ])
- *Step 6: Reset Secret & Re-enable Interfaces:*
  #terminal-box([
```cisco
Edge-RTR# configure terminal
Edge-RTR(config)# enable secret NewMasterPassword#2027
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# no shutdown
```
  ])
- *Step 7: Reset Configuration Register to Normal (0x2102):*
  #hl[MANDATORY STEP: If forgotten, the router will ignore its configuration on every future reboot!]
  #terminal-box([
```cisco
Edge-RTR(config)# config-register 0x2102
Edge-RTR(config)# exit
Edge-RTR# copy running-config startup-config
Edge-RTR# reload
```
  ])

#v(2pt)

== 6.4 TFTP Server Backup & Disaster Recovery
Production disaster recovery requires central off-box backups of configurations and operating system images:
#table(
  columns: (1.5fr, 4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Disaster Recovery Task*], [*Production Cisco IOS CLI Command*]),
  [Backup Running Config to TFTP], [`Edge-RTR# copy running-config tftp://192.168.1.50/Edge-RTR-cfg-backup`],
  [Restore Running Config from TFTP], [`Edge-RTR# copy tftp://192.168.1.50/Edge-RTR-cfg-backup running-config`],
  [Backup Flash IOS Image to TFTP], [`Edge-RTR# copy flash:c2900-universalk9-mz.bin tftp://192.168.1.50/`],
  [Restore / Flash IOS from TFTP], [`Edge-RTR# copy tftp://192.168.1.50/c2900-universalk9-mz.bin flash:`],
  [Verify IOS File Integrity Checksum], [`Edge-RTR# verify /md5 flash:c2900-universalk9-mz.bin`]
)

#pagebreak()

== Student Technical FAQs
#faq-box("What happens if you enter 'configure terminal' instead of 'copy startup-config running-config' during password recovery?", "Entering global configuration directly writes a blank config into RAM. If you then save, you will completely overwrite and permanently destroy the entire production startup-config!")
#faq-box("Why must interfaces be manually re-enabled after password recovery?", "When startup-config is loaded into running-config while the router is in bypass mode, Cisco IOS administratively shuts down all physical interfaces as a safety measure. You must issue 'no shutdown' on required interfaces.")
#faq-box("What is the difference between 'enable password' and 'enable secret'?", "'enable password' uses weak reversible Type 7 Vigenere encryption. 'enable secret' uses irreversible Type 5 MD5 or Type 9 SHA-256 cryptographic hashes.")

#v(2pt)

== Short-Answer Technical Review
1. *State the command to generate 2048-bit RSA keys for SSH on Cisco IOS:* `crypto key generate rsa modulus 2048`.
2. *Identify the exact ROMMON command used to bypass the startup-config:* `confreg 0x2142`.
3. *Why is the command 'config-register 0x2102' required at the end of password recovery?* To restore normal boot behavior so the router reads the saved startup-config from NVRAM on subsequent power cycles.
4. *Explain the purpose of 'logging synchronous' under line console 0:* It prevents unsolicited system log messages from interrupting and splitting the command line currently being typed by the engineer.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer is connected to a router via console and needs to enter ROMMON mode. What must be done?",
  ("Send the Break signal within 60 seconds of powering on", "Hold down the mode button for 30 seconds", "Type 'reload --rommon'", "Delete the IOS image from Flash"),
  0,
  "Sending a Break sequence via terminal emulator during POST interrupts the bootstrap loader and drops the router into ROMMON."
)

#mcq-item(
  "Which command encrypts all existing plaintext passwords in the configuration file using Cisco Type 7 reversible hashing?",
  ("enable secret", "service password-encryption", "crypto key generate rsa", "ip ssh version 2"),
  1,
  "'service password-encryption' obfuscates all plaintext line and enable passwords using Type 7 algorithm."
)

#mcq-item(
  "After changing the secret during password recovery, what is the final command before reloading to make the new password permanent?",
  ("copy startup-config running-config", "copy running-config startup-config", "erase startup-config", "write memory erase"),
  1,
  "'copy running-config startup-config' saves the new password and restored configuration into NVRAM."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Why Type 7 Passwords Are Never Secure", "Cisco Type 7 password encryption uses a fixed XOR key table that was reverse-engineered in 1995. Any Type 7 password hash can be decrypted instantly in 0.001 seconds using public web decoders. Always use Type 8 (PBKDF2) or Type 9 (SHA-256).")

#spotlight-box("2027 Tech Spotlight: Zero Touch Provisioning (ZTP)", "Modern enterprise networks no longer use manual console cables to configure new hardware. Cisco Zero Touch Provisioning (ZTP) uses DHCP Option 43 and Python scripts to automatically download authenticated configurations from cloud portals upon first boot.")
