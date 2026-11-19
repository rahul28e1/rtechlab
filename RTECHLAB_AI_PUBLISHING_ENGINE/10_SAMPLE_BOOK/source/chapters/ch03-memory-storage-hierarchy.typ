#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *

// =============================================================================
// CHAPTER 03: COMPUTER MEMORY & SECONDARY STORAGE HIERARCHY
// =============================================================================

#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 03 · MEMORY ARCHITECTURE]
= Chapter 3: Computer Memory & Secondary Storage Hierarchy

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  A rigorous technical analysis of the memory hierarchy, DRAM capacitor physics, DDR5 architecture, CPU cache hit ratios, and NVMe 3D NAND silicon storage.
]

#v(4pt)

== 3.1 The Memory Hierarchy Triangle (Speed vs Capacity vs Cost)
No single memory technology can be simultaneously ultra-fast, massive in capacity, and cheap. Computer architects solve this by constructing a multi-tiered #hl[Memory Hierarchy]:

#v(2pt)

#analogy-box(title: "The Professional Chef's Workspace")[
  Imagine a master chef cooking in a busy commercial restaurant:
  - #strong[CPU Registers:] The chef's #hl[Hands]. Can only hold 1 or 2 ingredients at once, but works at instantaneous speed.
  - #strong[L1/L2/L3 Cache:] The #hl[Cutting Board]. Right next to the chef's hands; holds immediately needed ingredients.
  - #strong[System RAM:] The kitchen #hl[Refrigerator]. Holds ingredients for all current active dishes. Wiped clean every night.
  - #strong[NVMe SSD Storage:] The basement #hl[Pantry / Grocery Store]. Holds endless crates of food. Takes a few seconds to walk there, but nothing ever spoils!
]

#v(2pt)

#photo-card(
  "/public/images/notes/photos/ram-dimm-module.jpg",
  caption: "Figure 3.1: Desktop DDR SDRAM Module (Gold Edge Contacts, BGA Memory Chips & Notch)",
  height: 85pt
)

#v(2pt)

== 3.2 Primary Memory: DRAM vs SRAM Mechanics
Primary memory is directly wired to the CPU memory controller across motherboard traces.

=== 1. DRAM (Dynamic RAM) — The 1T1C Architecture
- #strong[Silicon Cell Design:] Every single bit of DRAM is stored inside a microscopic cell consisting of exactly #hl[1 Transistor and 1 Capacitor (1T1C)].
- #strong[The Refresh Cycle:] Capacitors leak electrical charge over time (like a punctured bucket). To prevent data loss, the memory controller must read and rewrite every single row #hl[thousands of times per second (every 64 milliseconds)].
- #strong[DDR5 Advancements:] DDR5 splits the traditional 64-bit channel into #hl[two independent 32-bit sub-channels], incorporates On-Die ECC for error correction, and relocates the Power Management IC (PMIC) directly onto the DIMM stick for clean voltage regulation!

=== 2. SRAM (Static RAM) — The 6-Transistor Flip-Flop
- #strong[Design:] Built using #hl[6 interconnected transistors (6T flip-flop)].
- #strong[Zero Refresh:] As long as power is supplied, the flip-flop holds its state indefinitely. Delivers sub-nanosecond access latency.
- #strong[Why not use SRAM for all RAM?] A 16GB SRAM module would require 6 times more silicon die space, draw enormous power, generate massive heat, and cost over \$2,000! Therefore, SRAM is reserved exclusively for #hl[CPU Cache Memory].

#pagebreak()

// PAGE 2 OF CHAPTER 3: ROM, FIRMWARE & CPU CACHE
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 03 · MEMORY ARCHITECTURE]
== 3.3 Read-Only Memory (ROM) & Motherboard Firmware
Unlike RAM, ROM is #hl[non-volatile]; its contents remain intact permanently when the computer is shut down.

#table(
  columns: (1fr, 1.3fr, 2.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 4pt,
  table.header([*ROM Type*], [*Erasure Mechanism*], [*Technical Role in Modern PCs*]),
  [#strong[PROM]], [Permanent fusable links], [Programmable once at factory. Non-erasable once written.],
  [#strong[EPROM]], [High-intensity Ultraviolet (UV) light], [Erased through a transparent quartz window. Legacy 1980s firmware.],
  [#strong[EEPROM / Flash ROM]], [Pulsed electrical voltage], [Modern SPI Flash chips holding #hl[UEFI Motherboard BIOS]. Can be reflashed and updated directly inside Windows or BIOS setup.]
)

#v(4pt)

== 3.4 The 3-Level CPU Cache Memory Hierarchy
Because modern CPU cores tick at 4.0 GHz to 5.5 GHz (0.2 ns) while main DDR5 RAM operates at ~50 ns latency, a processor waiting directly on RAM would sit idle for #hl[99% of its clock cycles]! To solve this, multi-tiered SRAM cache is built directly on the CPU silicon die:

#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3.8pt,
  table.header([*Cache Level*], [*Typical Capacity*], [*Latency (Clock Cycles)*], [*Architectural Placement*]),
  [#strong[Level 1 (L1)]], [64KB - 128KB per core], [4 - 5 cycles (0.8 ns)], [Split into L1-Instruction (L1i) and L1-Data (L1d) directly inside the core execution pipeline.],
  [#strong[Level 2 (L2)]], [1MB - 2MB per core], [12 - 14 cycles (2.5 ns)], [Dedicated per-core buffer holding recently evicted L1 cache lines.],
  [#strong[Level 3 (L3)]], [16MB - 96MB+], [40 - 50 cycles (10 ns)], [Shared pool across all CPU cores on the silicon die (e.g. AMD 3D V-Cache stacked vertically).]
)

#v(3pt)

#concept-box(title: "Cache Hit vs Cache Miss Mechanics")[
  When the CPU requests data:
  - #strong[Cache Hit:] The requested memory address is already cached in L1/L2/L3. The CPU retrieves it in 1 nanosecond with zero pipeline stall!
  - #strong[Cache Miss:] The data is not in cache. The CPU must issue a memory bus request to main DRAM, stalling the execution pipeline for 50+ nanoseconds!
]

#pagebreak()

// PAGE 3 OF CHAPTER 3: SECONDARY STORAGE (HDD VS SSD) & DATA UNITS
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 03 · STORAGE & DATA UNITS]
== 3.5 Secondary Storage: Mechanical HDD vs Solid-State NVMe SSD

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Secondary storage preserves operating systems, applications, and documents permanently across reboots and power shutdowns.
]

#v(2pt)

#dual-photo(
  img1: "/public/images/notes/photos/hdd-internal-platter.jpg",
  cap1: "Figure 3.2A: Disassembled 3.5\" Mechanical HDD",
  img2: "/public/images/notes/photos/ssd-m2-nvme.jpg",
  cap2: "Figure 3.2B: Modern High-Speed NVMe M.2 SSD",
  height: 75pt
)

#v(2pt)

=== 1. Mechanical Hard Disk Drive (HDD) Physics
- #strong[Platters & Spindle:] Made of polished aluminum or glass, coated with a 10nm magnetic cobalt alloy, spinning at 5,400 or 7,200 RPM.
- #strong[Voice Coil Actuator:] Sweeps the read/write slider head across tracks. The head floats on an air bearing only #hl[3 nanometers above the spinning platter]!
- #strong[Total Latency Formula:] $text("Access Time") = text("Seek Time") + text("Rotational Latency") + text("Transfer Time")$. HDD access time averages 12 to 15 milliseconds.

=== 2. Solid-State Drive (SSD) Silicon Architecture
- #strong[3D NAND Flash Memory:] Stores bits using floating-gate or charge-trap transistors arranged in vertically stacked silicon towers (up to 232 layers).
- #strong[Zero Moving Parts:] Instantaneous electronic access latency of only #hl[0.02 milliseconds (600 times faster than mechanical HDDs)].
- #strong[NVMe (Non-Volatile Memory Express):] Connects directly to the CPU via 4 dedicated PCIe lanes, delivering bandwidths up to #hl[14,000 MB/s (PCIe 5.0)].

#v(2pt)

== 3.6 Complete Computer Memory Measurement Units Table
Computers operate in base-2 (binary). Therefore, each unit multiplier is $2^(10) = 1,024$:

#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3.2pt,
  table.header([*Memory Unit*], [*Binary Equivalent*], [*Real-World Scale & Practical Metric*]),
  [1 Bit (b)], [0 or 1], [Single transistor state (lowest physical quantum).],
  [1 Nibble], [4 Bits], [One hexadecimal character (e.g. 0xB).],
  [1 Byte (B)], [8 Bits], [Single ASCII text character (e.g. 'R').],
  [1 Kilobyte (KB)], [1,024 Bytes], [One short plain text email or notepad document.],
  [1 Megabyte (MB)], [1,024 KB], [One high-resolution photograph or MP3 song.],
  [1 Gigabyte (GB)], [1,024 MB], [One full-length HD film or modern game map asset.],
  [1 Terabyte (TB)], [1,024 GB], [Standard laptop M.2 NVMe SSD storage capacity.],
  [1 Petabyte (PB)], [1,024 TB], [Large university research storage array or hospital PACS.],
  [1 Exabyte (EB)], [1,024 PB], [Total daily global video streaming bandwidth traffic.],
  [1 Zettabyte (ZB)], [1,024 EB], [The total data created globally across the entire Internet in a year!]
)

#pagebreak()

// PAGE 4 OF CHAPTER 3: EVALUATION LAB, FAQS, MCQS, QA & STORAGE QR
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 03 · PRACTICE & EVALUATION LAB]
= Chapter 3 Comprehensive Review, FAQs & Evaluation Lab

#v(2pt)

== 1. Frequently Asked Student Questions (FAQs)
#faq-item(
  q: "Why is a 1TB SSD marketed by manufacturers only showing ~931 GB in Windows?",
  a: "Storage manufacturers calculate using decimal base-10 (1 TB = 1,000,000,000,000 bytes). Windows calculates in binary base-2 (1,024 bytes per KB). Dividing 1 Trillion bytes by 1024^3 equals exactly #hl[931.32 GiB]! The drive is not missing space; it is simply a difference in measurement units."
)
#faq-item(
  q: "What is the difference between Dual-Channel and Single-Channel RAM?",
  a: "Single-channel RAM provides a 64-bit wide memory bus. Installing two identical RAM sticks into alternating slots (Slots 2 and 4) activates Dual-Channel mode, doubling memory bus bandwidth to #hl[128 bits wide], resulting in 15–25% higher CPU performance!"
)
#faq-item(
  q: "What is the TRIM command in SSDs?",
  a: "NAND flash cannot overwrite data without first erasing an entire block (512KB). TRIM allows the OS to notify the SSD controller which blocks are no longer in use, allowing the drive to wipe them in the background so write speeds never degrade."
)

#v(2pt)

== 2. Short-Answer Review Questions with Verified Answers
#short-qa(
  num: 1,
  q: "Why does DRAM require continuous electric refreshing while SRAM does not?",
  a: "DRAM stores data using tiny capacitors that continuously leak electrical charge and must be refreshed every 64ms. SRAM uses 6-transistor cross-coupled flip-flops that hold their state indefinitely without refreshing."
)
#short-qa(
  num: 2,
  q: "What are the three levels of CPU cache memory and their relative tradeoffs?",
  a: "L1 (fastest, smallest, per-core), L2 (mid-sized, per-core buffer), and L3 (largest, shared across all cores on die to prevent main DRAM bus access)."
)
#short-qa(
  num: 3,
  q: "Why are SSDs completely immune to vibrations and physical drop damage?",
  a: "SSDs contain zero moving mechanical parts. Data is stored entirely as trapped electron voltages inside non-volatile silicon 3D NAND flash floating-gate transistors."
)
#short-qa(
  num: 4,
  q: "How many Megabytes (MB) are contained in exactly 4 Gigabytes (GB)?",
  a: "$4 times 1,024 = #hl[4,096 MB]$."
)

#v(2pt)

== 3. 5 High-Yield Chapter 3 Multiple-Choice Questions (MCQs)
#mcq(num: 1, q: "Which primary memory looses all stored information instantly upon power loss?", a: "ROM", b: "NVMe SSD", c: "RAM", d: "Optical DVD", ans: "C", expl: "RAM is volatile memory; capacitors and flip-flops lose state without electrical power.")
#mcq(num: 2, q: "Which memory type is used directly for CPU L1, L2, and L3 cache?", a: "DRAM", b: "SRAM", c: "NAND Flash", d: "PROM", ans: "B", expl: "Static RAM (SRAM) is built using fast flip-flops and needs no refresh cycles, making it ideal for cache.")
#mcq(num: 3, q: "How many bits are contained in exactly one Nibble?", a: "2 Bits", b: "4 Bits", c: "8 Bits", d: "16 Bits", ans: "B", expl: "A nibble is exactly half a byte, consisting of 4 bits.")
#mcq(num: 4, q: "What solid-state silicon technology stores binary bits inside modern NVMe M.2 SSDs?", a: "Magnetic Platters", b: "3D NAND Flash Memory", c: "Ferroelectric Cores", d: "Vacuum Crystals", ans: "B", expl: "Modern SSDs utilize non-volatile 3D TLC or QLC NAND flash silicon microchips.")
#mcq(num: 5, q: "How many Megabytes (MB) equal exactly 1 Gigabyte (GB) in binary computing?", a: "100 MB", b: "1,000 MB", c: "1,024 MB", d: "2,048 MB", ans: "C", expl: "Binary computing standard uses powers of 2: 2^10 = 1,024 MB in 1 GB.")

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #fact-box(title: "The Flying Height of HDD Heads")[
      In a mechanical hard drive, the read/write head glides over the magnetic platter at a distance of only 3 nanometers! A dust particle or fingerprint is thousands of times larger. If dust enters, it causes an instant catastrophic head crash!
    ]
  ],
  [
    #tool-qr-card(
      tool-name: "Interactive Data Storage & Bandwidth Calculator",
      tool-desc: "Calculate exact file sizes, transfer times, and base-2 binary prefixes live on RTechLab:",
      qr-img: "/public/images/notes/qr-notes-portal.svg",
      tool-url: "http://localhost:5173/notes"
    )
  ]
)
