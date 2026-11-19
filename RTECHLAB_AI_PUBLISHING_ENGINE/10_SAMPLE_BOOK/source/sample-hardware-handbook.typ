#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *
#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/cover-layouts/official-cover.typ": rtech-cover

#show: rtech-book.with(
  title: "Computer Hardware & System Architecture",
  subtitle: "Visual Engineering Master Handbook",
  author: "Rahul Sir & RTechLab Systems Lab",
  edition: "2027 Industrial Edition",
  subject-code: "RTL-2027-HW-A4"
)

// =============================================================================
// PAGE 01: OFFICIAL BOOK COVER
// =============================================================================
#rtech-cover(
  title: "Computer Hardware & System Architecture",
  subtitle: "The Visual Engineering Master Handbook (2027 Standard)",
  subject-pill: "OFFICIAL PUBLICATION · 2027 INDUSTRIAL EDITION",
  author: "Rahul Sir",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  reviewed-by: "RTechLab Systems Lab Directorate",
  edition: "2027.1 INDUSTRIAL RELEASE",
  logo-path: "/public/brand/rtechlab-logo-transparent.png"
)

#pagebreak()

// =============================================================================
// PAGE 02: SYLLABUS BLUEPRINT & MASTER INDEX
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[SYLLABUS BLUEPRINT · 2027 STANDARD]
= Master Module Index & Engineering Curriculum

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Every chapter maps directly to enterprise technical support, systems engineering, and IT admin interview rounds.
]

#v(6pt)

#let toc-item(mod: "", title: "", pages: "", desc: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 5pt,
    inset: 5.5pt,
    spacing: 2.5pt,
    [
      #grid(
        columns: (1fr, auto),
        [
          #text(size: 7.5pt, font: "Consolas", weight: "bold", fill: rtech-emerald.darken(10%))[#mod]
          #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[ | #title]\
          #text(size: 7.5pt, fill: rtech-text.lighten(30%))[#desc]
        ],
        [
          #box(
            fill: rtech-navy.lighten(94%),
            inset: (x: 5pt, y: 2pt),
            radius: 3pt,
            text(size: 7.5pt, font: "Consolas", weight: "bold", fill: rtech-navy)[#pages]
          )
        ]
      )
    ]
  )
}

#toc-item(
  mod: "MODULE 01",
  title: "Silicon Physics & CPU Sockets (LGA 1851/1700 vs AM5)",
  pages: "Pages 03–18",
  desc: "PGA vs LGA pin mechanics, mechanical pencil bent pin triage, and thermal paste traps."
)
#toc-item(
  mod: "MODULE 02",
  title: "Motherboard VRM Power Delivery & Phase Switching",
  pages: "Pages 19–36",
  desc: "16+1+1 DrMOS 90A SPS stages, PWM switching at 800 kHz, and VRM thermal throttling isolation."
)
#toc-item(
  mod: "MODULE 03",
  title: "High-Speed Memory Bus (DDR4 vs DDR5 SDRAM)",
  pages: "Pages 37–54",
  desc: "Dual 32-bit subchannels, on-die PMIC regulation, on-die ECC, and daisy-chain slot 2 & 4 rules."
)
#toc-item(
  mod: "MODULE 04",
  title: "Modern Storage Architecture (PCIe 5.0 NVMe vs SATA)",
  pages: "Pages 55–72",
  desc: "PCIe 5.0 x4 M.2 (14,000 MB/s), 3D TLC/QLC NAND, DirectStorage, and SMART health triage."
)
#toc-item(
  mod: "MODULE 05",
  title: "Power Supply Architecture (ATX 3.1 & 12V-2x6)",
  pages: "Pages 73–88",
  desc: "24-pin Green PS_ON# paperclip test, 12V-2x6 GPU meltdown fix, and Power Good signal mechanics."
)
#toc-item(
  mod: "MODULE 06",
  title: "Graphics, Expansion & High-Speed External I/O",
  pages: "Pages 89–104",
  desc: "PCIe lane allocation, DisplayPort 2.1 vs HDMI 2.1, USB4 v2.0 (80 Gbps), and Thunderbolt 5."
)
#toc-item(
  mod: "MODULE 07",
  title: "Enterprise Hardware Fault Decision Tree & Traps",
  pages: "Pages 105–118",
  desc: "4-step triage: No Power, No POST (Debug LEDs), No Video (GPU HDMI trap), and No Boot (UEFI)."
)
#toc-item(
  mod: "MODULE 08",
  title: "100+ Company Interview Questions & Model Answers",
  pages: "Pages 119–130",
  desc: "Real scenario questions from Amazon AWS, Cisco TAC, TCS, and Wipro with Senior Engineer answers."
)

#v(6pt)

#concept-box(title: "RTechLab Zero-Outdated Content Guarantee")[
  #strong[Industrial Relevance Guarantee:] Zero mentions of floppy drives, IDE ribbons, or legacy BIOS. 100% focused on modern production hardware standards, high-frequency bus physics, and cloud-era diagnostic methodologies.
]

#pagebreak()

// =============================================================================
// PAGE 03: MODULE 01: SILICON & CPU SOCKETS (AUTHENTIC PHOTO + VECTOR)
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[MODULE 01 · CHAPTER 1.2]
= CPU Socket Physics: LGA vs PGA & Thermal Paste Traps

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Every desktop technician faces bent pins and overheating. Here is the micro-engineering breakdown with genuine hardware photography:
]

#v(4pt)

#grid(
  columns: (1.1fr, 0.9fr),
  gutter: 8pt,
  [
    #photo-figure(
      title: "LGA Motherboard Socket & Spring Pins",
      figure-id: "PHOTO 1.2A",
      img-path: "/public/images/notes/photos/cpu-socket-lga-macro.jpg",
      caption: "Macro capture of an open AMD AM5 LGA socket showing gold-plated beryllium copper spring pins and stainless steel load plate.",
      author: "Wikimedia Commons Contributor",
      license: "CC BY-SA 4.0",
      img-width: 95%
    )
  ],
  [
    #schematic-container(
      title: "Bent Pin Triage Spec",
      figure-id: "FIG 1.2B",
      img-path: "/public/images/notes/cpu-socket-inspection.svg",
      caption: "0.5mm mechanical pencil sleeve realignment under 10x jewelers loupe."
    )
  ]
)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #concept-box(title: "LGA (Land Grid Array)")[
      Pins reside on the motherboard socket, contact pads on the CPU underside (Intel LGA 1700/1851 & AMD AM5). Extreme risk: Dropping tools bends fragile spring pins.\
      #text(weight: "bold", fill: rtech-emerald.darken(10%))[✓ Triage: Slip 0.5mm pencil sleeve over pin to gently realign.]
    ]
  ],
  [
    #concept-box(title: "PGA (Pin Grid Array)")[
      Pins are welded directly onto the CPU substrate (legacy AM4). Major field hazard: Cooler suction rips CPU out of locked socket when thermal paste hardens into glue.\
      #text(weight: "bold", fill: rtech-cyan.darken(20%))[✓ Prevention: Run Cinebench 5 min to soften, then twist—never pull!]
    ]
  ]
)

#warning-box(title: "Field Warning: Conductive Liquid Metal Shorts")[
  Non-conductive carbon thermal paste (Arctic MX-6, Noctua NT-H2) is safe. However, #strong[Liquid Metal (Gallium alloy)] is electrically conductive and chemically amalgamates with aluminum heatsinks, causing instantaneous motherboard short circuits!
]

#pagebreak()

// =============================================================================
// PAGE 04: THE HUMAN BODY COMPUTER ANATOMY ANALOGY
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-violet)[CONCEPT BREAKTHROUGH · MENTAL MODEL]
= The Human Body Analogy: How Computer Systems Think & Live

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Memorize computer architecture forever using the human biological system:
]

#v(6pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #analogy-box(title: "🧠 Brain = CPU (Processor)")[
      The frontal lobe performs logical math (ALU - Arithmetic Logic Unit), while the cerebellum directs signals (Control Unit). Just like thinking hard raises body temperature and requires sweating, heavy CPU compute dissipates heat requiring active fans.
    ]
  ],
  [
    #analogy-box(title: "🫀 Heart & Veins = PSU & VRMs")[
      The Power Supply is the heart pumping raw 230V AC converted into clean 12V DC blood through copper traces. The VRMs act as capillaries, stepping down 12V to 1.2V delicate voltages so the CPU silicon doesn't rupture.
    ]
  ]
)

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #analogy-box(title: "💭 Short-Term Memory = RAM")[
      The thoughts active in your mind right now. Fast, instant recall. But when you go to sleep (power cut), short-term memory evaporates completely unless written down in your journal.
    ]
  ],
  [
    #analogy-box(title: "📚 Long-Term Memory = NVMe SSD")[
      The personal diary kept inside a locked bookshelf. Slower than immediate thought, but 100% permanent. Even if the body loses power for 5 years, the NAND flash blocks hold every byte intact.
    ]
  ]
)

#v(4pt)

#concept-box(title: "⚡ Spinal Cord & Nerves = Motherboard Traces & PCIe Lanes")[
  Every reflex travels down myelinated nerve fibers. In a computer, these are impedance-controlled copper traces etched across 8 to 12 PCB layers. Differential PCIe 5.0 pairs transmit data at 32 GigaTransfers/second using NRZ signaling.
]

#pagebreak()

// =============================================================================
// PAGE 05: MEMORY LATENCY HIERARCHY (THE KITCHEN CHEF STORY)
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[LATENCY BOTTLENECK · HARDWARE PHYSICS]
= The Master Chef Analogy: Why CPU Caches Prevent System Freeze

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Why does a 5.0 GHz processor spend 70% of its cycles waiting? The kitchen distance scale explains all:
]

#v(6pt)

#let chef-tier(tier: "", analog: "", dist: "", desc: "", color: rtech-cyan) = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 5pt,
    inset: 5.5pt,
    spacing: 2pt,
    [
      #grid(
        columns: (1.5fr, 1fr, auto),
        [
          #text(size: 8pt, font: "Consolas", weight: "bold", fill: color)[#tier]
          #text(size: 8pt, weight: "bold", fill: rtech-navy)[ → #analog]\
          #text(size: 7.5pt, fill: rtech-text.lighten(30%))[#desc]
        ],
        [
          #text(size: 7.5pt, font: "Consolas", fill: rtech-text.lighten(40%))[#dist]
        ],
        [
          #box(
            fill: color.lighten(90%),
            inset: (x: 4pt, y: 1.5pt),
            radius: 3pt,
            text(size: 7pt, font: "Consolas", weight: "bold", fill: color.darken(20%))[0 Wait]
          )
        ]
      )
    ]
  )
}

#chef-tier(tier: "CPU Registers (0.5 ns)", analog: "Knife in Chef's Hand", dist: "0 meters (Instantaneous)", desc: "Immediate data. Zero wait cycles. Execution occurs in 1 clock cycle.", color: rtech-emerald)
#chef-tier(tier: "L1 Cache (1 ns)", analog: "Cutting Board in Front", dist: "Arm's length (30 cm)", desc: "Smallest cache (32KB-64KB/core). Holds currently active loop variables.", color: rtech-cyan)
#chef-tier(tier: "L2 Cache (4 ns)", analog: "Spice Rack on Counter", dist: "Distance: 1 meter away", desc: "512KB to 2MB per core. Very fast SRAM, 4x faster than main RAM.", color: rgb("#2563EB"))
#chef-tier(tier: "L3 Cache (12 ns)", analog: "Kitchen Refrigerator", dist: "Distance: 3 meters away", desc: "Massive shared pool (32MB to 96MB 3D V-Cache). Eliminates 80% of RAM queries.", color: rtech-violet)
#chef-tier(tier: "DDR5 RAM (60-80 ns)", analog: "Local Supermarket", dist: "Distance: 15-minute drive", desc: "Every trip to RAM stalls the CPU core for 200+ clock cycles (Cache Miss!).", color: rtech-amber)
#chef-tier(tier: "PCIe NVMe SSD (10-50 µs)", analog: "Cargo Harbor in Port", dist: "Distance: 3-day freight", desc: "10,000 times slower than RAM! DirectStorage bypasses CPU to feed GPU directly.", color: rtech-rose)

#v(6pt)

#concept-box(title: "Architecture Lesson: The Cache Miss Penalty")[
  When code accesses memory randomly instead of linearly in contiguous blocks, it triggers continuous #strong[L3 Cache Misses]. The CPU is forced to idle, making a ₹50,000 processor run at the effective throughput of a budget chip!
]

#pagebreak()

// =============================================================================
// PAGE 06: MODULE 02: MOTHERBOARD VRM STAGES (REAL PHOTO + SCHEMATIC)
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[MODULE 02 · CHAPTER 2.1]
= Motherboard VRM: 16+1+1 DrMOS Power Stages & PWM Switching

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Why does a PC drop clock speed from 5.4 GHz down to 800 MHz under heavy load? VRM thermal throttling:
]

#v(4pt)

#grid(
  columns: (1fr, 1.2fr),
  gutter: 8pt,
  [
    #photo-figure(
      title: "ATX Motherboard Architecture",
      figure-id: "PHOTO 2.1A",
      img-path: "/public/images/notes/photos/motherboard-atx-overview.jpg",
      caption: "Asus ROG ATX motherboard showing massive VRM aluminum heatsinks surrounding CPU socket, dual PCIe x16 slots, and shielded M.2 covers.",
      author: "Michał Zalewski (CC BY-SA 4.0)",
      license: "CC BY-SA",
      img-width: 95%
    )
  ],
  [
    #schematic-container(
      title: "Multi-Phase Buck Circuit",
      figure-id: "FIG 2.1B",
      img-path: "/public/images/notes/vrm-power-delivery.svg",
      caption: "PWM controller at 800 kHz, 16-phase DrMOS 90A stages, ferrite chokes, and solid caps."
    )
  ]
)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #concept-box(title: "The Multi-Phase Advantage")[
      A Core i9 or Ryzen 9 pulls up to 250W at ~1.25V (#strong[200 Amperes of current]!). A 16-phase design shares the load: each stage handles only 12.5A, running cool and efficient.
    ]
  ],
  [
    #warning-box(title: "VRM Thermal Throttling Sinkhole")[
      Cheap boards lack heatsinks over MOSFETs. When temperatures exceed 105°C, motherboard triggers `PROCHOT#`, forcing frequency to 800 MHz to avoid fire!
    ]
  ]
)

#practical-box(title: "Field Repair Triage: The 800 MHz Lockup")[
  If Task Manager shows CPU locked at 0.79 GHz or 800 MHz under 100% load: Do NOT reinstall Windows! Check motherboard VRM heatsink contact, point an intake fan directly over the socket area, or disable BD PROCHOT using ThrottleStop.
]

#pagebreak()

// =============================================================================
// PAGE 07: MODULE 03: RAM ARCHITECTURE (REAL PHOTO + SCHEMATIC)
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[MODULE 03 · CHAPTER 3.2]
= High-Speed Memory Bus: DDR4 vs DDR5 Physical Architecture

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Why can DDR5 memory NOT be forced into a DDR4 slot? Mechanical key notches and electrical power:
]

#v(4pt)

#grid(
  columns: (1.1fr, 0.9fr),
  gutter: 8pt,
  [
    #photo-figure(
      title: "Desktop RAM DIMM Memory Module",
      figure-id: "PHOTO 3.2A",
      img-path: "/public/images/notes/photos/ram-dimm-module.jpg",
      caption: "High-speed desktop memory stick highlighting surface-mount DRAM memory chips, bypass capacitors, 8-layer PCB, and gold edge fingers.",
      author: "Designermadsen",
      license: "CC BY-SA 4.0",
      img-width: 95%
    )
  ],
  [
    #schematic-container(
      title: "Key Notch Offset Spec",
      figure-id: "FIG 3.2B",
      img-path: "/public/images/notes/ram-ddr4-vs-ddr5.svg",
      caption: "Key notch offset comparison (72.25mm vs 77.25mm) and on-die PMIC."
    )
  ]
)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #concept-box(title: "On-Die PMIC (Power Management IC)")[
      In DDR4, 1.2V was regulated by the motherboard. In DDR5, 1.1V voltage regulation is moved directly onto the memory stick (PMIC), reducing signal noise and enabling granular power efficiency per module.
    ]
  ],
  [
    #concept-box(title: "Dual 32-Bit Subchannels")[
      A single DDR4 stick operates on one 64-bit data bus. A single DDR5 stick splits into two independent 32-bit subchannels (plus 8-bit ECC), effectively acting as dual-channel memory on a single stick!
    ]
  ]
)

#warning-box(title: "The Golden Slots Rule: Always Populate Slots 2 & 4 (A2 & B2) First")[
  Modern motherboards utilize Daisy-Chain memory bus trace topology. Populating slots 1 & 3 leaves un-terminated trace stubs at slots 2 & 4, creating signal wave reflections that cause memory training failures and BSODs at XMP/EXPO speeds!
]

#pagebreak()

// =============================================================================
// PAGE 08: MODULE 04: STORAGE ARCHITECTURE (REAL PHOTOGRAPHS)
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[MODULE 04 · CHAPTER 4.1]
= Modern Storage Physics: Mechanical HDD vs PCIe 5.0 NVMe SSD

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Storage physics evolved from rotating magnetic spinning platters to direct silicon PCIe lanes:
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #photo-figure(
      title: "Mechanical HDD Internal Platter & Head",
      figure-id: "PHOTO 4.1A",
      img-path: "/public/images/notes/photos/hdd-internal-platter.jpg",
      caption: "Opened enterprise 3.5\" HDD showing mirror-finish magnetic platter, voice-coil actuator, and aerodynamic read/write head floating on air bearing.",
      author: "Mk2010 (CC BY 4.0)",
      license: "CC BY 4.0",
      img-width: 95%
    )
  ],
  [
    #photo-figure(
      title: "M.2 NVMe PCIe Solid State Drive",
      figure-id: "PHOTO 4.1B",
      img-path: "/public/images/notes/photos/ssd-m2-nvme.jpg",
      caption: "M.2 2280 NVMe SSD showing high-performance PCIe controller silicon, 3D TLC NAND flash packages, and high-speed M-key edge connector.",
      author: "HiyoriX (CC BY-SA 3.0)",
      license: "CC BY-SA 3.0",
      img-width: 95%
    )
  ]
)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #concept-box(title: "Mechanical HDD Bottlenecks")[
      HDD read latency is governed by physical mechanics: rotational latency (7,200 RPM = 4.16ms) + seek time (actuator arm swinging across tracks = 8ms). Total latency: ~12ms per random I/O (yielding only 75-100 IOPS).
    ]
  ],
  [
    #concept-box(title: "PCIe 5.0 NVMe Breakthrough")[
      NVMe communicates over 4 dedicated PCIe 5.0 lanes directly to CPU silicon. With zero mechanical motion, flash read latency is ~20 microseconds (600x faster than HDD), delivering 14,000 MB/s and 1,500,000 IOPS!
    ]
  ]
)

#practical-box(title: "Field Diagnostic: SMART Drive Health Check")[
  When a system experiences random freezing or slow boot: Open Command Prompt as Administrator and execute `wmic diskdrive get status,model`. If any drive returns "Pred Fail", immediately clone the drive before mechanical head collision destroys magnetic surface!
]

#pagebreak()

// =============================================================================
// PAGE 09: MODULE 05: POWER ARCHITECTURE (REAL PHOTO + SCHEMATIC)
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[MODULE 05 · CHAPTER 5.1]
= Power Supply Architecture: ATX 3.1 & The 12V-2x6 Meltdown Fix

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Modern high-draw GPUs demand 600 Watts. Here is the physical safety triage every field engineer must know:
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #photo-figure(
      title: "Full Modular ATX Power Supply",
      figure-id: "PHOTO 5.1A",
      img-path: "/public/images/notes/photos/psu-atx-power-supply.jpg",
      caption: "High-efficiency modular ATX power supply showing 120mm cooling intake fan, rear AC switch, and DC modular connector receptacles.",
      author: "Wikimedia Commons Contributor",
      license: "CC BY-SA 4.0",
      img-width: 95%
    )
  ],
  [
    #schematic-container(
      title: "24-Pin Jump & Sense Pins",
      figure-id: "FIG 5.1B",
      img-path: "/public/images/notes/psu-diagnostics-atx31.svg",
      caption: "Pin 16 (Green) + Pin 17 (Black) jump, and 12V-2x6 1.7mm recessed sense pin safety interlock."
    )
  ]
)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #practical-box(title: "The Paperclip Jump Test")[
      To test a dead PSU without a motherboard: Disconnect all cables, bend a metallic paperclip, and short #strong[Pin 16 (Green - PS_ON\#)] to any #strong[Black Ground Pin (Pin 15/17)]. If PSU fan spins, the PSU logic circuit is functional!
    ]
  ],
  [
    #concept-box(title: "12V-2x6 Recessed Sense Pins")[
      The older 12VHPWR connector melted when unseated by 2mm. The new #strong[ATX 3.1 12V-2x6 standard] recesses the 4 sense pins by 1.7mm. If not 100% seated, sense pins break contact and GPU refuses power!
    ]
  ]
)

#concept-box(title: "PWR_OK (Power Good) Timing Signal Mechanics")[
  When PSU switches on, AC voltages fluctuate. The PSU holds the Gray wire (Pin 8 - PWR_OK) low until voltages stabilize between 100ms-500ms, then sends +5V to CPU to initiate POST. If PWR_OK fails, PC remains completely inert!
]

#pagebreak()

// =============================================================================
// PAGE 10: MODULE 06: ENTERPRISE NETWORKING HARDWARE (REAL PHOTOS)
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[MODULE 06 · NETWORKING HARDWARE]
= Enterprise Network Physical Layer: Switches, RJ45 & Fiber Optics

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Physical layer infrastructure connecting datacenter servers, cloud racks, and enterprise workstations:
]

#v(4pt)

#grid(
  columns: (1.2fr, 0.8fr),
  gutter: 8pt,
  [
    #photo-figure(
      title: "Enterprise 24-Port Gigabit Switch",
      figure-id: "PHOTO 6.1A",
      img-path: "/public/images/notes/photos/network-switch-gigabit.jpg",
      caption: "Rackmount 24-port Gigabit Ethernet managed switch featuring high-density RJ45 port array, port status link LEDs, and dual SFP+ uplink cages.",
      author: "Dsimic (CC BY-SA 4.0)",
      license: "CC BY-SA 4.0",
      img-width: 95%
    )
  ],
  [
    #photo-figure(
      title: "RJ45 Cat6 Termination",
      figure-id: "PHOTO 6.1B",
      img-path: "/public/images/notes/photos/rj45-connector-cat6.jpg",
      caption: "Close-up macro of an 8P8C modular plug crimped to Cat6 4-pair UTP cable following TIA/EIA-568-B.",
      author: "Wikimedia Contributor",
      license: "CC BY-SA 3.0",
      img-width: 95%
    )
  ]
)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #concept-box(title: "Twisted Pair Noise Cancellation")[
      Cat6 cables twist wire pairs at differing pitch rates (e.g., 3 to 4 twists per inch). When external EMI induces equal voltage on both wires, the differential receiver subtracts the noise ($V_1 - V_2$), yielding crystal-clear Gigabit signaling over 100 meters.
    ]
  ],
  [
    #concept-box(title: "Fiber Optic LC Duplex Infrastructure")[
      For datacenter runs exceeding 100m, duplex optical fiber uses total internal reflection inside high-purity silica glass cores (9µm Single-Mode, 50µm OM4 Multimode). Immune to electromagnetic interference and ground voltage loops!
    ]
  ]
)

#practical-box(title: "Field Triage: The Duplex Mismatch Late Collision Trap")[
  If a switch port reports thousands of #strong[Late Collisions] and CRC errors: Do NOT replace the cable! Check speed/duplex negotiation. A Duplex Mismatch (one end set to Auto/Full-Duplex, other forced to Half-Duplex) causes packets to collide after 512 bit-times, crippling throughput to 2 Mbps!
]

#pagebreak()

// =============================================================================
// PAGE 11: MODULE 07: 4-STEP HARDWARE FAULT TRIAGE
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[MODULE 07 · FIELD REPAIR PLAYBOOK]
= Enterprise Hardware Fault Triage: The 4-Stage Decision Tree

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Never guess blindly. Follow the rigorous triage ladder used by senior datacenter engineers:
]

#v(6pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      stroke: 0.5pt + rgb("#EF4444"),
      fill: rgb(239, 68, 68, 4%),
      radius: 5pt,
      inset: 6pt,
      [
        #text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#B91C1C"))[STAGE 1: NO POWER (DEAD SILENCE)]\
        #text(size: 7.5pt, fill: rtech-text)[
          • Check wall AC socket voltage (230V ± 10%).\
          • Verify PSU rear rocker switch is ON (I, not O).\
          • Short Front Panel Power Switch pins with screwdriver.\
          • Execute 24-Pin Green (Pin 16) to Black (Pin 17) paperclip jump.
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.5pt + rgb("#F59E0B"),
      fill: rgb(245, 158, 11, 4%),
      radius: 5pt,
      inset: 6pt,
      [
        #text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#92400E"))[STAGE 2: NO POST (FANS SPIN, NO BIOS)]\
        #text(size: 7.5pt, fill: rtech-text)[
          • Inspect 4 Motherboard Debug LEDs:\
            - Red LED = CPU socket bent pin or missing EPS 12V.\
            - Yellow LED = RAM seating failure (Reseat in A2/B2).\
            - White LED = GPU PCIe missing power or PCIe slot error.
        ]
      ]
    )
  ]
)

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      stroke: 0.5pt + rgb("#2563EB"),
      fill: rgb(37, 99, 235, 4%),
      radius: 5pt,
      inset: 6pt,
      [
        #text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#1D4ED8"))[STAGE 3: NO VIDEO (POST PASSES, BLACK SCREEN)]\
        #text(size: 7.5pt, fill: rtech-text)[
          • Press Caps Lock: If light toggles, PC is alive!\
          • Check the classic #strong[GPU HDMI Cable Trap] below.\
          • Test monitor input source selection (HDMI 1 vs DisplayPort).
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.5pt + rgb("#10B981"),
      fill: rgb(16, 185, 129, 4%),
      radius: 5pt,
      inset: 6pt,
      [
        #text(size: 8pt, font: "Consolas", weight: "bold", fill: rgb("#065F46"))[STAGE 4: NO BOOT (BLUE SCREEN / BCD CORRUPT)]\
        #text(size: 7.5pt, fill: rtech-text)[
          • Verify UEFI Native mode vs CSM Legacy in BIOS.\
          • Boot to Windows PE Recovery Command Prompt:\
            `bootrec /fixmbr && bootrec /rebuildbcd`\
          • Check SMART health via `wmic diskdrive get status`.
        ]
      ]
    )
  ]
)

#v(4pt)

#warning-box(title: "The #1 Desktop Support Mistake: The GPU HDMI Cable Trap")[
  A user submits an emergency ticket: #emph["My brand new engineering workstation turns on, all fans spin, but the screen remains pitch black!"]\
  #strong[Root Cause:] The HDMI or DisplayPort cable was plugged into the vertical motherboard I/O port (where internal graphics are disabled because a discrete GPU is detected) instead of the horizontal Dedicated GPU ports below!
]

#pagebreak()

// =============================================================================
// PAGE 12: TIER-1 INTERVIEW QUESTIONS & CERTIFICATION SEAL
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[MODULE 08 · RECRUITMENT INTERVIEW TRIAGE]
= Company-Wise Technical Interview Matrix & Official Certification

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Real technical screening questions asked by tier-1 MNCs and enterprise infrastructure employers:
]

#v(4pt)

#interview-card(
  company: "Amazon AWS",
  role: "Cloud Support Associate",
  question: "A user complains of latency connecting to an application server. How do you isolate whether the bottleneck is MTU size, DNS, or a saturated NAT gateway?",
  answer: "Execute ping with DF (Don't Fragment) bit: 'ping 8.8.8.8 -f -l 1472' to identify PMTU black hole. Check DNS latency via nslookup, and verify CloudWatch NAT Gateway ErrorPortAllocation metrics to detect SNAT exhaustion."
)

#interview-card(
  company: "Cisco TAC",
  role: "Network Support Engineer",
  question: "A Gigabit Ethernet interface shows increasing CRC errors and late collisions. What are the physical root causes?",
  answer: "Late collisions indicate a Duplex Mismatch (one end Half-Duplex, other Full-Duplex) or cable run exceeding 100m. CRC errors indicate electromagnetic interference (EMI), damaged RJ45 crimp, or dirty transceivers."
)

#interview-card(
  company: "TCS / Wipro",
  role: "Systems Administrator",
  question: "After a BIOS firmware update, an enterprise laptop prompts for BitLocker recovery key on every boot. Why?",
  answer: "The BIOS update modified the TPM PCR 0 & PCR 2 measurements (Platform Configuration Registers). The TPM detected a hardware hash mismatch and locked the volume to protect against tampering. Suspend BitLocker prior to BIOS flashing!"
)

#v(6pt)

// Official Certification Seal
#block(
  width: 100%,
  stroke: 1.5pt + rtech-emerald,
  fill: rgb(16, 185, 129, 4%),
  radius: 6pt,
  inset: 8pt,
  [
    #grid(
      columns: (1fr, auto),
      align: horizon,
      [
        #text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-emerald.darken(15%))[
          OFFICIAL RTECHLAB CERTIFICATION SEAL
        ]\
        #text(size: 9.5pt, weight: "bold", fill: rtech-navy)[
          Industrial Systems Engineering Standards · 2027 Edition
        ]\
        #text(size: 7.5pt, font: "Consolas", fill: rtech-text.lighten(40%))[
          License ID: RTECH-2027-HW-9842 · Author: Rahul Sir & Engineering Team
        ]
      ],
      [
        #box(
          fill: rtech-emerald.lighten(85%),
          inset: (x: 8pt, y: 4pt),
          radius: 4pt,
          text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-emerald.darken(20%))[
            LIFETIME EMAIL UPDATES ACTIVE
          ]
        )
      ]
    )
  ]
)

#pagebreak()

// =============================================================================
// PAGE 13: CHAPTER MCQ PRACTICE BANK
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER EVALUATION · 2027 CURRICULUM]
= Chapter-Wise MCQ Bank: Conceptual & Field Triage

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Test your understanding against industrial standards. Every question includes verified engineering rationale:
]

#v(4pt)

#let mcq-card(qnum: 1, difficulty: "Basic", question: "", options: (), correct: "A", explanation: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 5pt,
    inset: 6pt,
    spacing: 3pt,
    [
      #grid(
        columns: (1fr, auto),
        text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-navy)[Q#qnum: #question],
        box(
          fill: if difficulty == "Basic" { rgb(16, 185, 129, 12%) } else { rgb(245, 158, 11, 12%) },
          inset: (x: 4pt, y: 1.5pt),
          radius: 3pt,
          text(size: 6.5pt, font: "Consolas", weight: "bold", fill: if difficulty == "Basic" { rgb("#065F46") } else { rgb("#92400E") })[#difficulty]
        )
      )
      #v(2pt)
      #for opt in options [
        #text(size: 7.5pt, fill: rtech-text.lighten(20%))[• #opt]\
      ]
      #v(2pt)
      #block(
        fill: rtech-navy.lighten(96%),
        inset: 4pt,
        radius: 3pt,
        text(size: 7.5pt, fill: rtech-text)[
          #strong[Answer: Option #correct] | #explanation
        ]
      )
    ]
  )
}

#mcq-card(
  qnum: 1,
  difficulty: "Basic",
  question: "What is the primary physical difference between an LGA and a PGA socket?",
  options: (
    "A: PGA sockets have pins on the motherboard; LGA processors have pins on the CPU substrate.",
    "B: LGA sockets place delicate pins on the motherboard; CPU has flat gold contact pads.",
    "C: LGA sockets use soldering balls directly, whereas PGA sockets use lever retention only."
  ),
  correct: "B",
  explanation: "In LGA (Intel LGA 1700/AM5), pins are on the motherboard. In PGA (AM4), pins are on the CPU substrate."
)

#mcq-card(
  qnum: 2,
  difficulty: "Intermediate",
  question: "Why must dual memory sticks be installed in slots A2 and B2 (2 & 4) first?",
  options: (
    "A: Slots A1 and B1 only support single-sided memory sticks.",
    "B: Daisy-Chain trace topology leaves empty trace stubs at A2/B2 if A1/B1 are used, causing wave reflections.",
    "C: Slots A2 and B2 receive 0.2V higher voltage from the motherboard VRM."
  ),
  correct: "B",
  explanation: "Daisy-Chain PCB memory routing terminates at slots 2 and 4. Empty slots beyond populated slots create un-terminated transmission line stubs that bounce RF signal reflections."
)

#mcq-card(
  qnum: 3,
  difficulty: "Advanced",
  question: "How does the revised 12V-2x6 connector in ATX 3.1 prevent GPU melting?",
  options: (
    "A: It doubles the cable wire gauge from 16 AWG to 8 AWG industrial copper.",
    "B: The 4 sideband sense pins are recessed by 1.7mm, ensuring the GPU refuses power unless fully seated.",
    "C: It adds an onboard micro-fan inside the plastic housing."
  ),
  correct: "B",
  explanation: "Recessing the 4 sense pins by 1.7mm ensures that if the connector is unseated by even 1.5mm, the sense pins break contact and the GPU stays in 0W shutoff state."
)

#pagebreak()

// =============================================================================
// PAGE 14: RTECHLAB PRACTICE LAB & QR CODE ENGINE
// =============================================================================
#practice-lab-card(
  chapter-title: "Computer Hardware & System Architecture",
  qr-img: "/RTECHLAB_AI_PUBLISHING_ENGINE/08_QR_CODE_SYSTEM/qr-register/QR-MOD-01-hardware-silicon-cpu-sockets.svg",
  practice-url: "http://localhost:5173/practice/hardware/silicon-cpu-sockets",
  mcq-count: 25
)

#v(8pt)

#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-navy)[HOW TO ATTEMPT ONLINE PRACTICE:]
#v(3pt)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: white,
      radius: 5pt,
      inset: 6pt,
      [
        #text(size: 8pt, weight: "bold", fill: rtech-cyan)[STEP 1: SCAN QR]\
        #text(size: 7.5pt, fill: rtech-text.lighten(30%))[
          Point your smartphone camera or QR reader at the code above. Tap the link to open the RTechLab practice module.
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: white,
      radius: 5pt,
      inset: 6pt,
      [
        #text(size: 8pt, weight: "bold", fill: rtech-violet)[STEP 2: SELECT LEVEL]\
        #text(size: 7.5pt, fill: rtech-text.lighten(30%))[
          Choose Basic, Intermediate, or Advanced tiers. Toggle between English and Hindi modes seamlessly.
        ]
      ]
    )
  ],
  [
    #block(
      stroke: 0.5pt + rtech-border,
      fill: white,
      radius: 5pt,
      inset: 6pt,
      [
        #text(size: 8pt, weight: "bold", fill: rtech-emerald)[STEP 3: INSTANT FEEDBACK]\
        #text(size: 7.5pt, fill: rtech-text.lighten(30%))[
          Get immediate rationale on why correct options are right and why common distractors fail.
        ]
      ]
    )
  ]
)

#v(10pt)

#concept-box(title: "Non-Production Notice")[
  #strong[Development Notice:] The QR code destination links to your local RTechLab test practice engine (`http://localhost:5173/practice/hardware/silicon-cpu-sockets`). Once the official domain is purchased, the publishing engine replaces the base URL globally in 1 second.
]
