#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-cyan)[CHAPTER 03 · STORAGE & SILICON MEMORY]
= Chapter 3: Memory Hierarchy, Primary RAM/ROM & Secondary Storage

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Silicon storage architectures: the multi-level hierarchy pyramid, SRAM vs DRAM physical cell physics, DDR4/DDR5 generational advancements, ROM variants & SPI Flash firmware, Magnetic HDD mechanics, NAND Flash physics (SLC to QLC), and NVMe over PCIe storage fabrics.
]

#v(2pt)

== 3.1 The Storage Hierarchy Pyramid: Performance vs Economics
Modern computer architecture resolves the fundamental physical contradiction between speed, density, and cost per bit through a multi-tiered memory hierarchy:
- *Physical Hierarchy Trade-offs:*
  - *Tier 0 (CPU Core Registers):* Latency $approx 0.5" ns"$, capacity $< 2" KB"$, extreme silicon cost, volatile flip-flop circuits.
  - *Tier 1 (L1/L2/L3 On-Die SRAM Cache):* Latency $1 - 15" ns"$, capacity $32" KB" - 128" MB"$, static 6-transistor cell topology.
  - *Tier 2 (Main System Memory - DDR4/DDR5 SDRAM):* Latency $50 - 80" ns"$, capacity $8" GB" - 128" GB"$, 1T-1C capacitor design.
  - *Tier 3 (High-Speed Non-Volatile Storage - PCIe NVMe SSD):* Latency $10 - 50 mu"s"$, capacity $512" GB" - 8" TB"$, 3D TLC/QLC NAND.
  - *Tier 4 (Secondary Magnetic Storage - Mechanical HDD):* Latency $4 - 12" ms"$, capacity $2" TB" - 24" TB"$, rotating magnetic platters.
  - *Tier 5 (Cold Archive - LTO Magnetic Tape & Cloud Glacier):* Latency seconds to hours, petabyte scale, lowest cost per gigabyte.
- *Principle of Locality of Reference:* Caching operates successfully due to two statistical execution behaviors:
  - #hl[*Temporal Locality:*] Data or instructions accessed recently are highly likely to be accessed again shortly (e.g., loop variables, subroutine bodies). Maintained via LRU (Least Recently Used) cache eviction policies.
  - #hl[*Spatial Locality:*] Data elements located contiguous to recently accessed memory are likely to be accessed soon (e.g., array traversal, sequential code streams). Exploited via multi-word cache line fetches (standard 64-byte cache lines).

#v(2pt)

== 3.2 Primary Memory: SRAM vs DRAM & Generational Evolution
#table(
  columns: (1.2fr, 1.9fr, 1.9fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Architectural Parameter*], [*Static RAM (SRAM)*], [*Dynamic RAM (DRAM)*]),
  [Cell Circuit Topology], [6 CMOS Transistors (6T cross-coupled inverter latch); holds state without refresh.], [1 Transistor + 1 Micro-Capacitor (1T-1C); charge leaks naturally and decays.],
  [Refresh Cycle Overhead], [Zero refresh required; static stable bistable circuit state while powered.], [Requires periodic refresh pulse (JEDEC JESD79-5C: every 64 ms at $T_"case" <= 85°C$; 32 ms at $85°C < T_"case" <= 95°C$).],
  [Latency & Cycle Time], [Ultra-low latency ($0.5 - 2.5" ns"$); single-cycle deterministic read/write.], [Moderate latency ($12 - 18" ns"$ access time; $50 - 80" ns"$ bus cycle latency).],
  [Silicon Density & Cost], [Low density ($6times$ silicon area per bit); very high manufacturing cost.], [Extreme high density ($1times$ area footprint); highly economical per gigabyte.],
  [Primary System Application], [CPU L1/L2/L3 caches, register files, network switch packet buffers.], [System main RAM (DIMMs / SO-DIMMs), GPU VRAM (GDDR6/GDDR7, HBM3e).]
)

#v(2pt)
#grid(
  columns: (1.2fr, 1fr),
  gutter: 8pt,
  [
    *DDR SDRAM Evolutionary Breakthroughs:*
    - *Double Data Rate (DDR):* Transfers data on both the rising and falling edges of the bus clock cycle, doubling throughput at identical core frequencies.
    - *DDR5 Architectural Leaps:*
      - Dual 32-bit independent subchannels per DIMM (improves memory access concurrency vs DDR4's single 64-bit channel).
      - On-Die Error Correction Code (ODECC) mitigates internal cell bitflips within the silicon die; server-grade modules add sideband ECC (40-bit subchannels) for end-to-end bus parity.
      - Integrated PMIC on DIMM module (shifts power conversion from motherboard, running at 1.1V).
  ],
  photo-card("../03_VISUAL_ASSETS/authentic-hardware-photographs/ram-dimm-module.jpg", caption: "High-Performance DDR5 Desktop DIMM Module", height: 50pt)
)

#pagebreak()

== 3.3 Non-Volatile Firmware Memory: ROM Technologies
Read-Only Memory preserves bootloader and device bootstrap routines across complete power loss cycles:
- *Mask ROM (MROM):* Hardwired during photolithographic fabrication; non-alterable bit patterns permanently etched into silicon.
- *PROM (Programmable ROM):* Manufactured blank; programmed once using high-voltage current to permanently melt microscopic fusible links.
- *EPROM (Erasable PROM):* Uses floating-gate transistors that trap electrical electrons; erased by exposing its quartz transparent window to intense ultraviolet (UV-C) light for 20--30 minutes.
- *EEPROM (Electrically Erasable PROM):* Employs Fowler-Nordheim electrical tunneling to alter individual byte locations without UV exposure.
- *Modern NOR Flash UEFI/BIOS:* High-density, block-erasable semiconductor memory interfacing via high-speed Serial Peripheral Interface (SPI) buses. Features dual-BIOS hardware redundancy for fail-safe firmware updates.

#v(2pt)

== 3.4 Secondary & Persistent Storage: Magnetic HDDs vs Solid-State SSDs
#grid(
  columns: (1fr, 1.2fr),
  gutter: 8pt,
  photo-card("../03_VISUAL_ASSETS/authentic-hardware-photographs/hdd-internal-platter.jpg", caption: "3.5\" Mechanical HDD Interior Platter & Actuator", height: 52pt),
  [
    *Magnetic HDD Electromechanical Anatomy:*
    - *Spindle Motor:* Rotates precision platters coated in ferromagnetic thin films at 5400, 7200, or 10,000 RPM.
    - *Voice-Coil Actuator Arm:* Sweeps read/write electromagnetic heads on air bearings $approx 5" nm"$ above platter surfaces.
    - *Total Disk Access Latency Formula:*
      $ "Access Time" = "Seek Time" + "Rotational Latency" + "Transfer Time" $
      Average rotational latency equals $1/2$ rotation period ($approx 4.17" ms"$ at 7200 RPM).
  ]
)

#v(2pt)

*Solid-State Drives (NAND Flash Memory Physics):*
SSD technology eliminates mechanical heads, platters, and rotational delays through non-volatile solid-state charge trapping:
- *NAND Cell Architectures & Endurance:*
  - *SLC (Single-Level Cell):* 1 bit per cell ($2^1 = 2$ states), $approx 100,000$ write cycles. Maximum speed and enterprise reliability.
  - *MLC (Multi-Level Cell):* 2 bits per cell ($2^2 = 4$ states), $approx 3,000 - 10,000$ P/E (Program/Erase) cycles.
  - *TLC (Triple-Level Cell):* 3 bits per cell ($2^3 = 8$ states), $approx 1,000 - 3,000$ P/E cycles. Dominant mainstream consumer standard.
  - *QLC (Quad-Level Cell):* 4 bits per cell ($2^4 = 16$ states), $approx 100 - 500$ P/E cycles. Ultra-high density, lower sustained write speeds.
- *Crucial Solid-State Management Algorithms:*
  - *Wear Leveling:* Distributes write/erase cycles uniformly across physical blocks to prevent premature cell failure.
  - *TRIM Command:* OS ATA/NVMe Dataset Management signal informing SSD controller which LBAs are invalid, enabling background garbage collection and wear leveling.
  - *Write Amplification Factor (WAF):* Ratio of physical NAND bytes written to host logical bytes requested: $ "WAF" = ("Physical Bytes Written to NAND") / ("Host Logical Bytes Written") >= 1.0 $. TRIM reduces redundant block writes, but background maintenance means WAF remains $\ge 1.0$.

#pagebreak()

== 3.5 Storage Interfaces, Bus Fabrics & Data Capacity Mathematics
#table(
  columns: (1.2fr, 1.1fr, 1.3fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Storage Interface*], [*Host Protocol*], [*Bus Interface & Lanes*], [*Theoretical Maximum Bandwidth*]),
  [SATA Revision 3.0], [Legacy AHCI], [Serial ATA (Single Lane)], [6.0 Gbps ($approx 550 - 600" MB/s"$ real-world)],
  [PCIe 3.0 NVMe], [NVMe 1.3 / 1.4], [PCIe 3.0 $times 4$ lanes], [$approx 3,500" MB/s"$ sequential read/write],
  [PCIe 4.0 NVMe], [NVMe 1.4 / 2.0], [PCIe 4.0 $times 4$ lanes], [$approx 7,500" MB/s"$ sequential read/write],
  [PCIe 5.0 NVMe], [NVMe 2.0 / DirectStorage], [PCIe 5.0 $times 4$ lanes], [$approx 14,000 - 15,000" MB/s"$ sequential read/write]
)

#v(2pt)
#grid(
  columns: (1.3fr, 1fr),
  gutter: 8pt,
  [
    *NVMe vs Legacy AHCI Protocol:*
    - *AHCI:* Designed for mechanical HDDs; supports 1 command queue with a depth of 32 commands.
    - *NVMe:* Engineered natively for multi-core CPUs and flash silicon; supports up to #hl[64,000 parallel command queues], each holding 64,000 commands with direct CPU interrupts.
  ],
  photo-card("../03_VISUAL_ASSETS/authentic-hardware-photographs/ssd-m2-nvme.jpg", caption: "PCIe Gen4 M.2 NVMe SSD with Thermal Spreader", height: 50pt)
)

#v(2pt)

== 3.6 Storage Capacity Mathematics: Binary Prefix (IEC) vs Decimal Metric (SI)
Why does a freshly purchased 1 Terabyte (1 TB) drive display as approximately 931.32 GiB in Windows?
- *Storage Manufacturers (SI Decimal):* $1" TB" = 10^12 " bytes" = 1,000,000,000,000" bytes"$.
- *Operating Systems (IEC Binary):* $1" GiB" = 1024^3 = 1,073,741,824" bytes"$.
- *Mathematical Conversion:* $(10^12) / (1024^3) approx 931.32" GiB"$. No storage is missing; it is purely a unit standard difference.

#v(2pt)

== 3.7 Optical Storage Physical Lasers & Removable Media
- *Compact Disc (CD):* 780 nm infrared laser, 1.6 $mu"m"$ track pitch, standard capacity 700 MB.
- *Digital Versatile Disc (DVD):* 650 nm red laser, 0.74 $mu"m"$ track pitch, capacity 4.7 GB (SL) / 8.5 GB (DL).
- *Blu-ray Disc (BD):* 405 nm blue-violet laser, 0.32 $mu"m"$ track pitch, capacity 25 GB (SL) / 50 GB (DL) / 100 GB (BD-XL).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why does Dynamic RAM (DRAM) require constant electrical refreshing while Static RAM (SRAM) does not?", a: "DRAM stores each bit in a leaky 1T-1C micro-capacitor that discharges within milliseconds, requiring periodic refresh pulses. SRAM uses a stable 6T cross-coupled flip-flop that holds its state continuously while powered.")

#faq-item(q: "What is the key engineering difference between an M.2 SATA SSD and an M.2 NVMe SSD?", a: "M.2 SATA uses legacy AHCI over SATA 6 Gbps bus capped at ~550 MB/s with 1 queue (depth 32). M.2 NVMe uses PCIe 3.0/4.0/5.0 lanes directly, reaching up to 14,000+ MB/s across 64,000 parallel queues.")

#faq-item(q: "What is SSD Write Amplification, and why is the OS TRIM command essential?", a: "NAND flash writes in pages but must erase in entire blocks, causing rewrite amplification. TRIM informs the SSD controller which LBAs are deleted, enabling proactive garbage collection without write penalties.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Differentiate between volatile and non-volatile memory, citing two examples of each.", ans: "Volatile loses data on power loss (DDR5 RAM, SRAM cache); non-volatile retains data without power (NVMe SSD, SPI Flash ROM).")
#short-q(num: 2, q: "Explain the principle of Locality of Reference and its role in cache hierarchies.", ans: "Temporal Locality (recent items reused soon) and Spatial Locality (nearby items accessed next) allow fast SRAM caches to achieve high hit rates (typically 90%–98% on sequential code) depending on algorithmic spatial/temporal locality and cache working set size.")
#short-q(num: 3, q: "Why does flash memory have finite endurance, and how does wear leveling help?", ans: "Tunneling oxide breaks down after repeated P/E cycles. Wear leveling distributes write cycles evenly across all physical blocks to prevent premature failures.")
#short-q(num: 4, q: "Calculate the average rotational latency for a hard drive spinning at 10,000 RPM.", ans: "Average latency = half a revolution: (60 s / 10,000 RPM) / 2 = 0.003 seconds = 3.0 milliseconds.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which memory technology utilizes a 6-transistor cross-coupled flip-flop circuit topology?", a: "Dynamic RAM (DRAM)", b: "Static RAM (SRAM)", c: "3D QLC NAND Flash", d: "Magnetic MRAM", ans: "B", expl: "SRAM utilizes a 6T CMOS latch circuit that retains stored logic states without periodic refresh cycles.")
#mcq(num: 2, q: "How many voltage levels must be detected in a NAND cell under Quad-Level Cell (QLC) architecture?", a: "2 voltage levels", b: "4 voltage levels", c: "8 voltage levels", d: "16 voltage levels", ans: "D", expl: "Each QLC cell stores 4 binary bits, requiring 2^4 = 16 discrete voltage thresholds.")
#mcq(num: 3, q: "What is the theoretical maximum line rate of the SATA Revision 3.0 storage interface bus?", a: "3.0 Gbps", b: "6.0 Gbps", c: "16 Gbps", d: "32 Gbps", ans: "B", expl: "SATA 3.0 operates at 6.0 Gbps, yielding real-world data throughput of ~550-600 MB/s.")
#mcq(num: 4, q: "Which optical storage standard utilizes a 405 nm blue-violet laser diode?", a: "Compact Disc (CD)", b: "LaserDisc (LD)", c: "Digital Versatile Disc (DVD)", d: "Blu-ray Disc (BD)", ans: "D", expl: "Blu-ray uses a 405 nm blue-violet laser allowing tight 0.32 micrometer track pitch for 25 GB single-layer capacity.")
#mcq(num: 5, q: "In the IEC binary measurement standard, how many bytes constitute one Tebibyte (1 TiB)?", a: "1,000,000,000,000 bytes", b: "1,073,741,824 bytes", c: "1,099,511,627,776 bytes", d: "1,125,899,906,842,624 bytes", ans: "C", expl: "Under IEC 60027-2, 1 TiB = 1024^4 = 1,099,511,627,776 bytes, whereas 1 TB = 10^12 bytes.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "Rowhammer DRAM Vulnerability")[
      Hammering one memory row millions of times per second leaks parasitic charge, flipping bits in adjacent rows. Modern DDR5 combats this via TRR.
    ]
  ],
  [
    #tech-spotlight-box(title: "CXL 3.0 Memory Pooling")[
      Compute Express Link (CXL 3.0) over PCIe 5.0 enables datacenters to pool and share multi-terabyte RAM across nodes with sub-microsecond latency.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
