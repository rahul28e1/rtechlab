#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 05 · CISCO IOS & BOOT SEQUENCE]
= Chapter 5: Cisco IOS Architecture, Memories & Boot Flow

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Internal hardware architecture of Cisco routing and switching engines: CPU, system bus, ROM, Flash, NVRAM, RAM, the 5-stage Cisco boot sequence, Configuration Register bit patterns (0x2102 vs 0x2142), ROMMON emergency recovery, TFTP rescue, and complete step-by-step router and switch password recovery procedures.
]

#v(2pt)

== 5.1 Cisco Hardware Architecture & Memory Subsystems
A Cisco enterprise router is a specialized high-reliability computer executing Cisco Internetwork Operating System (IOS). Its operational state relies on four distinct memory architectures:
- *ROM (Read-Only Memory):* Non-volatile firmware chip. Stores:
  1. *Power-On Self-Test (POST):* Diagnostic microcode testing CPU registers, memory controllers, and physical interface circuitry.
  2. *Bootstrap Loader:* Locates and transfers the Cisco IOS software image from Flash/TFTP into RAM.
  3. *ROMMON (ROM Monitor):* Low-level emergency mini-operating system invoked during corrupt flash, missing IOS, or password recovery.
- *Flash Memory:* Electrically Erasable Programmable ROM (EEPROM / NAND Flash). Non-volatile; stores the #hl[Cisco IOS system image (`.bin` file)] and system crash dumps. Retains files across power cycles and can be upgraded in the field.
- *NVRAM (Non-Volatile RAM):* Battery/capacitor-backed memory. Stores the #hl[`startup-config` file] and the 16-bit software *Configuration Register*. Fast, persistent, and read/write.
- *RAM (Random Access Memory / DRAM):* Volatile high-speed working memory. Stores the active #hl[`running-config`], routing tables, ARP cache, interface packet buffers, and running IOS execution space. All contents are lost upon power loss or reboot!

#v(3pt)

== 5.2 Cisco Memory Types Comparison Matrix
#table(
  columns: (1fr, 1fr, 1.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Memory Type*], [*Volatility*], [*Contents Stored*], [*Operational Engineering Role*]),
  [ROM], [Non-Volatile], [POST, Bootstrap, ROMMON], [Hardware initialization and emergency disaster recovery bootloader.],
  [Flash], [Non-Volatile], [Cisco IOS Image (`.bin`)], [Persistent operating system storage; field upgradable via TFTP/USB.],
  [NVRAM], [Non-Volatile], [`startup-config`, Config-Register], [Saves administrative configuration and boot behavior across reboots.],
  [RAM], [Volatile], [`running-config`, Routing Tables], [High-speed processing engine; all unsaved changes lost on reboot.]
)

#v(3pt)

== 5.3 The 5-Stage Cisco Router Boot Sequence
When a Cisco router power switch is turned ON, it executes a deterministic 5-stage boot sequence:
- *Stage 1: Power-On Self-Test (POST):* Microcode stored in ROM executes, performing hardware checks on CPU, memory, and physical interface circuitry. If a hardware failure is detected, LED indicators display amber/red failure codes.
- *Stage 2: Bootstrap Execution:* After POST passes, CPU executes the Bootstrap program from ROM.
- *Stage 3: Locate Cisco IOS Software:* Bootstrap program reads the Configuration Register to determine where to find IOS:
  1. Default: Inspects Flash memory for a valid `.bin` image file.
  2. Fallback: If Flash is missing or corrupt, attempts network TFTP boot using configured boot parameters.
  3. Emergency: If TFTP fails, dumps execution into ROMMON prompt (`rommon 1 >`).
- *Stage 4: Load & Decompress Cisco IOS into RAM:* The selected IOS `.bin` image is loaded into RAM, decompressed, and the operating system kernel is initialized.
- *Stage 5: Locate & Apply Configuration:* IOS inspects the Configuration Register:
  - If register is #hl[`0x2102`] (normal): IOS searches NVRAM for `startup-config`. If found, it copies it into RAM as `running-config`. If empty, enters System Configuration Dialog (Setup Mode).
  - If register is #hl[`0x2142`] (recovery): IOS #hl[bypasses NVRAM entirely] and boots directly into an unconfigured prompt without asking for passwords!

#v(3pt)

== 5.4 The Configuration Register Architecture
The Configuration Register is a 16-bit software register stored in NVRAM controlling how the router boots. It is represented in hexadecimal format:
- *Common Values & Meanings:*
  - *`0x2102` (Standard Enterprise Boot):* Factory default. Tells the router to boot the first valid IOS image found in Flash, and load `startup-config` from NVRAM.
  - *`0x2142` (Password Recovery Mode):* Flips bit 6 to `1`. Instructs Bootstrap to ignore NVRAM during boot, allowing an administrator to bypass forgotten enable passwords.
  - *`0x2100` (Direct ROMMON Boot):* Boots directly into ROMMON mode on every power cycle.
  - *`0x2101` (RxBoot / Mini-IOS Boot):* Boots a lightweight bootstrap image from ROM.

#v(3pt)

== 5.5 Step-by-Step Cisco Router Password Recovery Procedure
When administrative passwords are lost, an engineer resets credentials without losing the original configuration:
1. Connect laptop via serial console rollover cable (PuTTY: 9600-8-N-1).
2. Power cycle router; within 60 seconds of boot, send a #hl[Break Signal] (Ctrl+Break in PuTTY) to interrupt boot.
3. Router enters ROMMON mode prompt: `rommon 1 >`
4. Change config register to ignore NVRAM: `rommon 1 > confreg 0x2142`
5. Reset the router: `rommon 2 > reset`
6. Router boots to setup wizard; type `no` to enter user exec mode: `Router>`
7. Enter privileged exec: `Router> enable` (no password requested!).
8. #hl[CRITICAL STEP: Copy startup-config to running-config] to recover configurations without wiping:
   `Router# copy startup-config running-config`
9. Reconfigure admin password:
   `Router(config)# enable secret NewCiscoSecret2027!`
   `Router(config)# username admin privilege 15 secret AdminPass2027!`
10. #hl[RESET REGISTER TO NORMAL (MANDATORY)]:
    `Router(config)# config-register 0x2102`
11. Save modified config: `Router# copy running-config startup-config`

#v(2pt)
#terminal-specimen(title: "ROMMON Password Recovery Command Trace")[
```text
System Bootstrap, Version 15.1(4)M4, RELEASE SOFTWARE (fc1)
rommon 1 > confreg 0x2142
You must reset or power cycle for new config to take effect
rommon 2 > reset
...
Router> enable
Router# copy startup-config running-config
Destination filename [running-config]? <Enter>
R1-EDGE-CORE# configure terminal
R1-EDGE-CORE(config)# enable secret CiscoSecret2027!
R1-EDGE-CORE(config)# config-register 0x2102
R1-EDGE-CORE(config)# end
R1-EDGE-CORE# copy running-config startup-config
[OK]
```
]

#concept-box(title: "THE GOLDEN RULE OF PASSWORD RECOVERY")[
  In Step 8 of password recovery, NEVER run `copy running-config startup-config` before loading the original configuration! Doing so overwrites NVRAM with a blank config, destroying all production IP addresses, VLANs, and routing configs! Always run `copy startup-config running-config` first!
]

#v(3pt)

== 5.6 Emergency TFTP Rescue in ROMMON (`tftpdnld`)
If an engineer accidentally formats Flash (`delete flash:*`), the router cannot boot into IOS. It must be rescued via ROMMON:
```bash
rommon 1 > IP_ADDRESS=192.168.1.2
rommon 2 > IP_SUBNET_MASK=255.255.255.0
rommon 3 > DEFAULT_GATEWAY=192.168.1.1
rommon 4 > TFTP_SERVER=192.168.1.100
rommon 5 > TFTP_FILE=c2900-universalk9-mz.SPA.157-3.M3.bin
rommon 6 > tftpdnld
rommon 7 > boot flash:c2900-universalk9-mz.SPA.157-3.M3.bin
```

#v(3pt)

== 5.7 Cisco Catalyst Switch Password Recovery Architecture
Cisco Catalyst switches lack a ROMMON break key; instead, they feature a physical #hl[Mode Button] on the front panel:
1. Disconnect switch power cord.
2. Depress and hold the front-panel *Mode Button* while reconnecting the power cord.
3. Release the Mode button after the `SYST` LED blinks amber and turns solid green (approx 15 seconds).
4. Terminal displays switch bootloader prompt: `switch:`
5. Initialize flash file system: `switch: flash_init`
6. Load helper commands: `switch: load_helper`
7. In Catalyst switches, configuration is stored as a file in Flash (`config.text`). Rename it to bypass passwords:
   `switch: rename flash:config.text flash:config.old`
8. Boot the switch: `switch: boot`
9. Enter privileged mode (`enable`), restore file name, and change credentials:
   `Switch# rename flash:config.old flash:config.text`
   `Switch# copy flash:config.text system:running-config`
   `Switch(config)# enable secret CiscoSwitch2027!`
   `Switch# copy running-config startup-config`

#v(3pt)


== 5.8 Cisco Enterprise Router Hardware Architecture
Modern Cisco branch and edge routers feature modular architectures:
#table(
  columns: (1fr, 1.4fr, 1.4fr, 2.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Hardware Series*], [*Target Deployment*], [*Architecture Type*], [*Enterprise Characteristics*]),
  [Cisco ISR 1000 Series], [Small Branch & SOHO], [Fixed Appliance (Fanless option)], [Integrated LTE/5G wireless, 4-8 Gigabit ports, built-in security & SD-WAN.],
  [Cisco ISR 4000 Series], [Medium to Large Enterprise], [Modular Multicore IOS-XE], [Dedicated control, data, and service planes. NIM and SM-X expansion slots.],
  [Cisco Catalyst 8000], [Edge, Datacenter & Cloud], [Next-Gen SD-WAN Edge Platform], [High-density 10G/40G/100G interfaces, hardware cryptographic acceleration.],
  [Cisco ASR 1000 Series], [Enterprise WAN Aggregation], [Cisco QuantumFlow Processor], [Hardware-accelerated traffic inspection, deep QoS, and broadband aggregation.]
)

#v(3pt)

== 5.9 Cisco Hardware Health & Diagnostic CLI Commands
#table(
  columns: (1.3fr, 1.3fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Diagnostic Command*], [*Operational Output*], [*Triage & Analysis Target*]),
  [`show version`], [IOS release, uptime, config-register], [Verifies software image file, total RAM/NVRAM, and boot register.],
  [`show inventory`], [Chassis model, serial numbers, SFP modules], [Retrieves hardware serial numbers for Cisco TAC warranty service calls.],
  [`show environment`], [Internal fan RPM, PSU status, temperatures], [Monitors thermal sensors and power supply redundancy status.],
  [`show processes cpu sorted`], [Active processes sorted by CPU utilization], [Identifies rogue software tasks or broadcast loops consuming CPU cycles.],
  [`show memory statistics`], [Total, used, and free processor RAM], [Triages memory leak bugs and buffer exhaustion crashes.],
  [`show file systems`], [Available storage drives (`flash:`, `nvram:`)], [Checks free disk space before transferring new IOS-XE `.bin` images.]
)

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What happens if a router reboots and its configuration register is still 0x2142?", a: "Every time the router reboots, it will ignore NVRAM and prompt for the initial System Configuration Dialog as if unconfigured. To fix, enter privileged EXEC mode, configure 'config-register 0x2102', and copy run start.")
#faq-item(q: "Where is the Cisco IOS operating system stored when the router is powered OFF?", a: "In non-volatile Flash memory (as a compressed .bin file). When powered ON, it is decompressed and loaded into RAM.")
#faq-item(q: "Why is ROMMON needed if Cisco IOS is stored in Flash?", a: "ROMMON is an independent bootstrap firmware stored in ROM chips. If Flash becomes corrupted, erased, or absent, ROMMON provides the low-level rescue interface to reload IOS via TFTP or USB.")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which Cisco memory type stores the active running-config?", ans: "RAM (Random Access Memory).")
#short-q(num: 2, q: "What is the standard hexadecimal configuration register value for normal boot?", ans: "0x2102.")
#short-q(num: 3, q: "What configuration register value instructs the router to ignore NVRAM during boot?", ans: "0x2142.")
#short-q(num: 4, q: "In Catalyst switches, what is the file name where persistent configuration is stored in flash?", ans: "config.text.")
#short-q(num: 5, q: "What program in ROM executes initial hardware diagnostic checks upon powering on?", ans: "Power-On Self-Test (POST).")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which memory component retains its contents when a Cisco router loses electrical power?", a: "RAM", b: "DRAM", c: "NVRAM", d: "SRAM", ans: "C", expl: "NVRAM (Non-Volatile RAM) retains the startup-config and config register across power outages.")
#mcq(num: 2, q: "What is the correct command to reset a router's configuration register to normal production boot?", a: "boot system flash", b: "config-register 0x2102", c: "confreg 0x2142", d: "register reset default", ans: "B", expl: "config-register 0x2102 restores normal boot from global configuration mode.")
#mcq(num: 3, q: "During router password recovery, why must the engineer run copy startup-config running-config?", a: "To clear the enable password", b: "To load the existing production configuration into RAM without erasing it", c: "To initialize flash memory", d: "To configure SSH v2", ans: "B", expl: "Loading startup-config into RAM prevents overwriting the production configuration with a blank file.")
#mcq(num: 4, q: "Which hardware component on a Catalyst switch is held down during power-up to trigger password recovery?", a: "Reset pinhole", b: "Mode Button", c: "Console switch", d: "RPS toggle", ans: "B", expl: "Holding the front-panel Mode button interrupts normal boot and drops the switch into the bootloader 'switch:' prompt.")
#mcq(num: 5, q: "What command displays the current active configuration register setting in Cisco IOS?", a: "show boot", b: "show running-config", c: "show version", d: "show registers", ans: "C", expl: "show version displays hardware specs, uptime, IOS filename, and the Configuration register at the bottom.")

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "Config Register Bit 6")[
      Hex `0x2102` = `0010 0001 0000 0010`. Hex `0x2142` = `0010 0001 0100 0010`. Bit 6 (value 4) instructs bootstrap to skip reading NVRAM!
    ]
  ],
  [
    #tech-spotlight-box(title: "Cisco Secure Boot & Hardware Root of Trust")[
      Modern Cisco Catalyst 9000 switches feature Cisco Trust Anchor technology: hardware-anchored cryptographic verification of microcode before IOS-XE boots!
    ]
  ]
)
