#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 05 · CISCO ROUTER HARDWARE & BOOT PROCESS]
= Chapter 5: Cisco Router Hardware Architecture, Memories & 5-Stage Boot Flow

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Detailed Cisco router physical hardware components, ports (Console, AUX, Serial WIC, GigabitEthernet), memory hierarchy (ROM, Flash, NVRAM, RAM), 5-stage boot sequence, and configuration register (0x2102 vs 0x2142).
]

#v(2pt)

== 5.1 Cisco Router Internal Hardware Architecture
A Cisco router is a specialized computing system engineered for high-throughput packet forwarding:
- *Central Processing Unit (CPU):* Executes Cisco IOS operating system instructions, runs routing protocol algorithms (OSPF Dijkstra, EIGRP DUAL), manages ARP tables, and handles control-plane management tasks.
- *System Bus:* High-speed interconnect that transfers packets between network interface controllers and central processing units.
- *Physical Ports & Interfaces:*
  - *Console Port:* Out-of-band serial RJ45 or USB connection for initial setup and recovery when network connectivity is lost.
  - *Auxiliary (AUX) Port:* Out-of-band RJ45 port for connecting analog modems for remote dial-in rescue.
  - *Gigabit / FastEthernet Ports:* Fixed or modular Layer 3 Ethernet interfaces for LAN and router-to-router connections.
  - *WAN Interface Cards (WIC / NIM):* Modular expansion slots supporting high-speed serial links, T1/E1, and cellular LTE/5G.

#v(2pt)

== 5.2 The Four Router Memory Types
#table(
  columns: (1.1fr, 1.3fr, 3.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*Memory Type*], [*Volatility & Nature*], [*Primary Contents & Architectural Purpose*]),
  [ROM (Read-Only Memory)], [Non-Volatile (Permanent)], [Contains factory microcode: POST diagnostics, Bootstrap loader program, Mini-IOS (RxBoot), and ROMMON (ROM Monitor emergency maintenance mode).],
  [Flash Memory], [Non-Volatile (Electronically Erasable)], [Stores full Cisco IOS operating system binary images (`.bin`). Survives power cycles and reboots. Can store multiple IOS versions and backup files.],
  [NVRAM], [Non-Volatile (Battery-Backed SRAM)], [Stores the permanent #hl[`startup-config`] file and the 16-bit Configuration Register setting. Content remains intact without AC power.],
  [RAM / DRAM], [Volatile (Erased on power loss)], [Active working memory. Stores #hl[`running-config`], active routing tables, ARP cache tables, packet buffers, and running operating system code.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/motherboard-atx-overview.jpg", width: 92%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 5.1: High-Speed System Bus & Controller Motherboard.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/ram-dimm-module.jpg", width: 92%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 5.2: Volatile DRAM System Memory Module.]
  ]
)

#pagebreak()

== 5.3 The 5-Stage Cisco Router Boot Sequence
When a Cisco router is powered on, it executes a rigorous five-stage startup routine to initialize hardware, decompress the operating system, and load the active running configuration:
- *Stage 1: Power-On Self-Test (POST):*
  - Hardwired diagnostic code stored in ROM executes immediately.
  - Tests hardware subsystems: CPU registers, memory controllers, backplane buses, and network interfaces.
  - Verification: Front panel LED indicators flash amber, then turn solid green upon passing POST.
- *Stage 2: Bootstrap Loader Program Execution:*
  - Bootstrap instructions in ROM execute to coordinate the operating system boot process.
  - Reads the 16-bit *Configuration Register* from NVRAM to determine where to locate the Cisco IOS image.
- *Stage 3: Locate Cisco IOS Operating System:*
  - Router searches for a valid IOS image following this strict fallback order:
    1. #hl[Flash Memory] (Standard default location).
    2. #hl[TFTP Network Server] (If Flash is corrupt or boot system commands specify network boot).
    3. #hl[ROMMON / Mini-IOS in ROM] (Fallback recovery mode if no valid image is found).
- *Stage 4: Load & Decompress IOS into RAM:*
  - Once the `.bin` image is located, it is loaded into volatile RAM and dynamically decompressed.
  - Operating system kernel takes control of all CPU, switching, and routing hardware resources.
- *Stage 5: Search for & Apply Configuration:*
  - Bootstrap checks the Configuration Register (specifically bit 6):
    - *If Normal (0x2102):* Router searches NVRAM for #hl[`startup-config`]. If found, copies it into RAM as `running-config`.
    - *If NVRAM is Empty or Register is 0x2142:* Router attempts TFTP network boot. If no TFTP response, prompts user with:
      `Would you like to enter the initial configuration dialog? [yes/no]:` (Setup Mode).

#v(2pt)

== 5.4 The Configuration Register & Bit Values
The Configuration Register is a 16-bit software register stored in NVRAM that dictates router boot behavior:
#table(
  columns: (1.2fr, 1.2fr, 3.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*Register Value*], [*Boot Field Bits*], [*Operational Behavior & Diagnostic Application*]),
  [`0x2102`], [Bit 6 = 0, Bits 0-3 = 2], [Normal enterprise operation. Loads IOS from Flash and reads `startup-config` from NVRAM. Default console 9600 baud.],
  [`0x2142`], [Bit 6 = 1 (0x0040)], [Password recovery bypass. Ignores NVRAM `startup-config` during boot, entering Setup dialog while keeping config safe.],
  [`0x2100`], [Bits 0-3 = 0], [Diagnostic mode. Boots directly into ROMMON prompt (`rommon 1 >`) for manual disaster recovery.],
  [`0x2101`], [Bits 0-3 = 1], [Boots subset mini-IOS (RxBoot) stored in ROM for TFTP emergency re-flashing.]
)

#pagebreak()

== Student Technical FAQs
#faq-box("What happens if a router loses power while saving configuration?", "If power fails during 'copy running-config startup-config', the startup-config in NVRAM may become corrupted. Upon reboot, the router will fail Stage 5 and enter the initial configuration dialog. Restoring from a TFTP backup is required.")
#faq-box("Why is Cisco IOS compressed on Flash memory?", "Flash memory chips are expensive compared to DRAM. Compressing the IOS image into a '.bin' archive saves valuable Flash storage. During Stage 4, the Bootstrap uncompresses the kernel into DRAM.")
#faq-box("What is the difference between warm boot (reload) and cold boot?", "A cold boot occurs when the power switch is cycled; it forces full ROM POST diagnostics. A warm boot ('reload' command) bypasses low-level hardware POST and immediately restarts the Bootstrap loader.")

#v(2pt)

== Short-Answer Technical Review
1. *Identify the memory component that stores the startup-config:* NVRAM (Non-Volatile RAM).
2. *State the five stages of the Cisco router boot sequence in correct order:* 1. POST -> 2. Bootstrap Execution -> 3. Locate IOS -> 4. Load & Decompress IOS into RAM -> 5. Search & Apply Configuration.
3. *Explain what Configuration Register 0x2142 instructs the router to do:* Bit 6 instructs the Bootstrap loader to bypass/ignore the `startup-config` stored in NVRAM during boot.
4. *Where does a router search for IOS if Flash memory is empty or corrupted?* It falls back to searching for a network TFTP server, and if that fails, drops into ROMMON.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "During which stage of the router boot sequence are the CPU registers, memory controllers, and interfaces tested?",
  ("Bootstrap Execution", "POST (Power-On Self-Test)", "IOS Decompression", "NVRAM Read"),
  1,
  "POST runs microcode tests from ROM to verify hardware integrity before any software loads."
)

#mcq-item(
  "An engineer makes changes to interface descriptions. Which memory holds these changes before any write command is entered?",
  ("Flash", "NVRAM", "RAM", "ROM"),
  2,
  "Active changes are made to the running-config, which resides strictly in volatile RAM."
)

#mcq-item(
  "What is the default Configuration Register value for a standard production Cisco router?",
  ("0x2100", "0x2102", "0x2142", "0x2101"),
  1,
  "0x2102 is the factory default value that boots IOS from Flash and reads startup-config from NVRAM."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Why NVRAM Uses Lithium Batteries", "Traditional NVRAM chips utilize small lithium coin batteries embedded directly inside the SRAM package to retain configuration memory during facility power outages. Modern enterprise routers utilize Non-Volatile Flash-backed MRAM.")

#spotlight-box("2027 Tech Spotlight: Cisco Secure Boot & Hardware Root of Trust", "Modern Cisco Catalyst 8000 and 9000 routers feature Anchor Crypto Hardware Root of Trust. At Stage 1, a tamper-proof hardware chip cryptographically verifies digital signatures on microcode and IOS images to prevent malware bootkits.")
