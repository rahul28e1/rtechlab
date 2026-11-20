#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 05 · CISCO IOS & BOOT SEQUENCE]
= Chapter 5: Cisco IOS Architecture, Memories & Boot Flow

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Internal hardware architecture of Cisco routing and switching engines: CPU, system bus, ROM, Flash, NVRAM, RAM, the 5-stage Cisco boot sequence, Configuration Register bit patterns (0x2102 vs 0x2142), ROMMON emergency recovery, TFTP rescue, and switch password recovery procedures.
]

#v(2pt)

== 5.1 Cisco Hardware Architecture & Memory Subsystems
A Cisco enterprise router is a specialized high-reliability computer executing Cisco Internetwork Operating System (IOS). Its operational state relies on four distinct memory architectures:
- *ROM (Read-Only Memory):* Non-volatile firmware chip. Stores:
  1. *Power-On Self-Test (POST):* Diagnostic microcode testing CPU, memory, and interface circuitry.
  2. *Bootstrap Loader:* Locates and transfers the Cisco IOS software image into RAM.
  3. *ROMMON (ROM Monitor):* Low-level mini-operating system invoked during corrupt flash or password recovery.
- *Flash Memory:* Electrically Erasable Programmable ROM (EEPROM / NAND Flash). Non-volatile; stores the #hl[Cisco IOS system image (`.bin` file)] and system crash dumps. Retains files across power cycles.
- *NVRAM (Non-Volatile RAM):* Battery/capacitor-backed memory. Stores the #hl[`startup-config` file] and the 16-bit software *Configuration Register*. Fast and persistent.
- *RAM (Random Access Memory / DRAM):* Volatile working memory. Stores the active #hl[`running-config`], routing tables, ARP cache, interface packet buffers, and running IOS execution space. Erased during reboot.

#v(2pt)

== 5.2 Cisco Memory Types Comparison Matrix
#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Memory Type*], [*Persistence*], [*Primary Contents*], [*Engineering Operational Role*]),
  [ROM], [Non-Volatile], [POST, Bootstrap, ROMMON], [Hardcoded factory microcode; executes hardware diagnostics on cold start.],
  [Flash], [Non-Volatile], [Cisco IOS (`c2900-universalk9.bin`)], [Permanent OS storage. Can hold multiple IOS images and web files.],
  [NVRAM], [Non-Volatile], [`startup-config`, Config-Register], [Retains saved device configurations and boot register parameters.],
  [RAM], [#hl[Volatile]], [`running-config`, Routing Tables], [High-speed working execution space; changes take effect here instantly.]
)

#v(2pt)

== 5.3 The 5-Stage Cisco Router Boot Sequence
When an engineer toggles the power switch on a Cisco router, it executes five sequential operational phases:
1. *Stage 1: POST (Power-On Self-Test):* Executes diagnostic microcode from ROM to verify CPU, DRAM, and physical bus controller integrity.
2. *Stage 2: Bootstrap Execution:* Bootstrap program initializes CPU registers and checks the *Configuration Register* in NVRAM.
3. *Stage 3: Locate the Cisco IOS Image:* Bootstrap searches for the IOS `.bin` image based on boot system commands:
   - *Primary:* Flash memory file system (`flash:`).
   - *Secondary:* TFTP network server across Ethernet.
   - *Fallback:* If no valid image is found, system drops to *ROMMON mode* (`rommon 1 >`).
4. *Stage 4: Load IOS into RAM:* The decompressed IOS image is transferred into high-speed system RAM; kernel takes control.
5. *Stage 5: Locate & Apply Configuration:* Bootstrap checks Configuration Register:
   - If `0x2102`: Loads `startup-config` from NVRAM into RAM as `running-config`.
   - If `0x2142`: Ignores NVRAM; launches interactive *Setup Dialog Wizard* (`Would you like to enter initial configuration dialog? [yes/no]:`).

#pagebreak()

== 5.4 The Configuration Register Architecture
The Configuration Register is a 16-bit hex register stored in NVRAM that controls how the router boots:
- *Bit 6 (`0x0040`):* Ignore NVRAM bit. When set to `1`, router bypasses `startup-config` during boot.
- *Bits 0–3 (Boot Field):*
  - `0x0` (Bit 0): Boots directly into ROMMON mode for maintenance.
  - `0x1` (Bit 1): Boots mini-IOS boot image from ROM.
  - `0x2` to `0xF` (Bits 2–15): Normal boot; executes `boot system` commands or boots first file in Flash.
- *Key Configuration Register Values:*
  - #hl[`0x2102`]: Normal production boot (reads NVRAM, boots from Flash, 9600 console baud rate).
  - #hl[`0x2142`]: Password recovery boot (ignores NVRAM startup-config, boots from Flash).

#v(2pt)

== 5.5 Step-by-Step Cisco Router Password Recovery Procedure
When administrative passwords are lost, an engineer resets credentials without losing the original configuration:
1. Connect laptop via serial console cable (9600-8-N-1).
2. Power cycle router; within 60 seconds of boot, send a #hl[Break Signal] (Ctrl+Break in PuTTY) to interrupt boot.
3. Router enters ROMMON mode prompt: `rommon 1 >`
4. Change config register to ignore NVRAM: `rommon 1 > confreg 0x2142`
5. Reset the router: `rommon 2 > reset`
6. Router boots to setup wizard; type `no` to enter user exec mode: `Router>`
7. Enter privileged exec: `Router> enable` (no password requested!).
8. #hl[CRITICAL STEP: Copy startup-config to running-config] to recover configurations without wiping:
   `Router# copy startup-config running-config`
9. Reconfigure admin password:
   `Router(config)# enable secret Cisco123!`
   `Router(config)# username admin privilege 15 secret CiscoAdmin2027`
10. #hl[RESET REGISTER TO NORMAL]:
    `Router(config)# config-register 0x2102`
11. Save modified config: `Router# copy running-config startup-config`

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/digital-multimeter-testing.jpg",
  caption: "Figure 5.1: Benchtop Diagnostic testing of Cisco router internal power rails during hardware triage.",
  height: 52pt
)

#v(2pt)

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

#pagebreak()

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
   `Switch(config)# enable secret CiscoSwitch2027`
   `Switch# copy running-config startup-config`

#v(2pt)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Operation*], [*Cisco Router Command*], [*Cisco Switch Command*], [*Operational Target*]),
  [Save Config], [`copy run start`], [`copy run start`], [Writes volatile RAM config to persistent NVRAM/Flash.],
  [Erase Config], [`erase startup-config`], [`write erase`], [Deletes NVRAM startup config; defaults device on reboot.],
  [View Image Files], [`dir flash:`], [`dir flash:`], [Inspects stored IOS `.bin` images and file sizes in Flash.],
  [Check Boot Reg], [`show version`], [`show boot`], [Displays active Configuration Register (e.g. 0x2102).]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "The Golden Rule of Password Recovery")[
      In Step 8 of password recovery, NEVER run `copy running-config startup-config` before loading the original configuration! Doing so overwrites NVRAM with a blank config, destroying all production IP addresses, VLANs, and routing configs! Always run `copy startup-config running-config` first!
    ]
  ],
  [
    #concept-box(title: "Config Register Bit 6 Math")[
      Hex `0x2102` = `0010 0001 0000 0010` binary.      Hex `0x2142` = `0010 0001 0100 0010` binary.      Notice bit 6 (value 4 in the third hex digit) is flipped to `1`. Bit 6 signals the Bootstrap loader to ignore NVRAM during boot!
    ]
  ]
)

#v(2pt)

== 5.8 Essential Diagnostic Verification Commands
- `show version` — Identifies IOS software release, system uptime, memory capacities (RAM/Flash), and active Configuration Register.
- `show running-config` — Dumps active configuration in DRAM.
- `show startup-config` — Displays saved configuration in NVRAM.
- `show file systems` — Lists available storage prefixes (`flash:`, `nvram:`, `system:`).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What is the difference between copy running-config startup-config and write memory?", a: "Both execute the identical operation: writing active RAM configurations to persistent NVRAM. 'copy run start' is the modern Cisco standard syntax; 'write memory' (wr) is legacy syntax preserved for backward compatibility.")
#faq-item(q: "Why did my router boot into the Initial Configuration Dialog wizard after rebooting?", a: "This occurs if NVRAM startup-config is empty or deleted, or if the Configuration Register is set to 0x2142 (bypassing NVRAM).")
#faq-item(q: "How can I test whether a Cisco router is experiencing memory corruption?", a: "Inspect 'show version' for unexpected crash reasons (bus error, parity error) and verify flash checksum integrity via 'verify /md5 flash:[ios-image.bin]'.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which memory component in a Cisco router is volatile and loses contents on power loss?", ans: "RAM (Random Access Memory / DRAM).")
#short-q(num: 2, q: "What Configuration Register value bypasses NVRAM during router startup?", ans: "0x2142.")
#short-q(num: 3, q: "Name the file in Flash where Cisco Catalyst switches store startup configurations.", ans: "flash:config.text.")
#short-q(num: 4, q: "Which terminal keystroke sends a break sequence in PuTTY to interrupt Cisco boot?", ans: "Control + Break (Ctrl+Break).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Where does a Cisco router store its permanent Cisco IOS operating system binary file (.bin)?", a: "NVRAM", b: "RAM", c: "Flash Memory", d: "ROM", ans: "C", expl: "Flash memory is non-volatile EEPROM/NAND storage used to hold one or more Cisco IOS software images.")
#mcq(num: 2, q: "During router password recovery, which command is critical to avoid wiping existing interface and routing configurations?", a: "copy running-config startup-config", b: "copy startup-config running-config", c: "erase startup-config", d: "write erase", ans: "B", expl: "Copying startup-config into running-config merges the saved production config into RAM so passwords can be safely updated without data loss.")
#mcq(num: 3, q: "What is the default production Configuration Register value for Cisco routers?", a: "0x2142", b: "0x2102", c: "0x2101", d: "0x2000", ans: "B", expl: "0x2102 tells the router to boot normally: read NVRAM startup-config, load IOS from Flash, and use 9600 console baud.")
#mcq(num: 4, q: "How is password recovery initiated on a Cisco Catalyst switch that lacks a serial break function?", a: "By typing break in terminal", b: "By depressing and holding the physical Mode button during power-on", c: "By flipping dip-switches on the back panel", d: "By shorting pins 1 and 8 on console", ans: "B", expl: "Holding the front Mode button during switch power-on halts bootloader execution at the 'switch:' prompt.")
#mcq(num: 5, q: "If a Cisco router fails to find a valid IOS image in Flash or on a TFTP server, which mode does it enter?", a: "Setup Dialog Wizard", b: "User Exec Mode (Router>)", c: "ROMMON Mode (rommon 1 >)", d: "Kernel Panic Shutdown", ans: "C", expl: "If no bootable IOS image is discovered, the Bootstrap loader drops the router into low-level ROM Monitor (ROMMON) mode.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The NVRAM Battery Lifecycle")[
      NVRAM relies on a tiny lithium backup cell on the motherboard. If the cell dies after 10+ years, the router boots cleanly into the setup wizard every cold reboot!
    ]
  ],
  [
    #tech-spotlight-box(title: "Cisco IOS-XE Linux Underlay")[
      Modern Cisco Catalyst 9000 switches run Cisco IOS-XE, which executes the classic IOS daemon as a containerized process inside an underlying CentOS/Yocto Linux kernel!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
