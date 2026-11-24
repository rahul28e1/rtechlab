#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-cyan)[CHAPTER 09 · HARDWARE INTEGRATION & SAFETY]
= Chapter 9: PC Assembly, Hardware Maintenance & Diagnostic Triage

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Workshop safety protocols, ESD protection, step-by-step 8-stage system integration, RAM daisy-chain slot priorities, lithium battery triage, POST diagnostics, command-line triage, and sanitization standards.
]

#v(2pt)

== 9.1 Workshop Safety, Electrostatic Discharge (ESD) & Tooling
Servicing desktop workstations and enterprise servers requires strict electrical and electrostatic discipline:
- *Electrostatic Discharge (ESD):* Static electrical charge accumulated on clothing or skin reaches potentials of #hl[3,000 to 10,000 Volts] (human sensation threshold is ~3,000V). Microscopic sub-micron gate oxides in modern processors and DRAM controllers can be irreparably punctured by discharges as low as #hl[30 to 100 Volts]! Always wear a conductive ESD wrist strap clamped to an unpainted chassis metal ground or operate on a dissipative ESD mat connected to common earth ground.
- *Essential Assembly Tooling:* High-grade magnetized #2 Phillips screwdriver (safe for motherboards and SSDs; keep away from exposed legacy magnetic platters), anti-static tweezers for jumper configuration, 99% anhydrous Isopropyl Alcohol (IPA), lint-free micro-fiber swabs, and non-conductive thermal paste.
- *Mains Electrical Safety:* #hl[Never disassemble enclosed power supply units (PSUs) or CRT monitors!] Primary smoothing capacitors inside switched-mode power supplies retain fatal charge levels (over 400V DC) for days after AC mains disconnection. Always verify wall receptacles feature functional safety ground (earth pin) connection.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/desktop-pc-workstation.jpg",
  caption: "Figure 9.1: Professional desktop workstation build layout with modular PSU, dual-channel DDR5, and direct-airflow cooling.",
  height: 48pt
)

#v(2pt)

== 9.2 The Professional 8-Stage PC Assembly Workflow
#table(
  columns: (0.8fr, 1.3fr, 2.9fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Stage*], [*Operation Name*], [*Engineering Procedure & Critical Precaution*]),
  [Stage 1], [Out-of-Chassis Test], [Assemble CPU, cooler, RAM, GPU, and PSU on top of the motherboard box (never the anti-static bag, which has a conductive exterior surface) to verify POST prior to chassis mounting.],
  [Stage 2], [CPU Socket Seating], [Lift retention arm. Align socket triangle key with CPU substrate gold dot. Drop in without force (ZIF). For Intel/AMD LGA sockets, inspect gold spring pins with magnifying light. Lower retention arm.],
  [Stage 3], [Thermal Interface], [Apply a pea-sized dot (~4-5 mm) or cross pattern of non-conductive thermal paste. Fasten heatsink evenly in a diagonal cross-pattern to equalize mounting pressure across the silicon die.],
  [Stage 4], [RAM Dual-Channel], [Install DIMMs into designated dual-channel slots. #hl[Crucial note: Most modern motherboards route traces in a Daisy-Chain topology and mandate slots A2 and B2 (Slots 2 & 4)] for two sticks to minimize signal reflection stubs. Always consult motherboard manual for T-topology or ITX exceptions.],
  [Stage 5], [Chassis & Standoffs], [Screw brass standoffs into chassis corresponding strictly to motherboard form factor (ATX/mATX). An extra or misplaced standoff behind the PCB can cause immediate 12V/5V shorts to chassis ground!],
  [Stage 6], [M.2 NVMe Drives], [Insert NVMe drive into primary CPU-attached M.2 slot at a 30-degree angle. Press down and secure screw or latch. #hl[Crucial: Peel off the protective plastic film] from the motherboard heatsink thermal pad before installation!],
  [Stage 7], [PSU & Cabling], [Mount PSU with fan oriented toward dust filter vent. Route 24-pin ATX, 8-pin EPS (CPU), and PCIe/12V-2x6 power cables through rubber grommets before installing large graphics cards.],
  [Stage 8], [GPU & Front Panel], [Seat GPU firmly into the top reinforced PCIe 5.0 x16 slot until retention clip clicks. Fasten rear bracket screws. Connect front-panel headers (`PWR_SW`, `RESET_SW`, `HDD_LED`, `PWR_LED`) observing polarity for LEDs.]
)

#pagebreak()

== 9.3 Preventive Hardware Maintenance & Cleaning Protocols
- *Airflow Optimization & Dust Cleaning:* Dust accumulation on heatsink fins insulates heat dissipation and restricts volumetric airflow. Clean radiators and fan blades using dry compressed air or high-pressure electric blowers. #hl[Safety Rule: Mechanically secure fan blades] using a non-conductive plastic probe or remove the fan assembly per manufacturer guidelines prior to air dusting. #hl[Never hold blades with bare fingers] during high-pressure air blasting (prevents blade fracture and skin lacerations). Unconstrained air blasting over-spins bearings beyond maximum RPM and can generate reverse inductive electromotive force (back-EMF) into motherboard headers.
- *Memory & PCIe Contact Cleaning:* Intermittent memory errors, failure to detect PCIe cards, or random blue screens can arise from surface oxidation on gold contact fingers. Remove modules and clean gold pins gently using #hl[99% anhydrous Isopropyl Alcohol (IPA)] and lint-free swabs. Never use abrasive rubber pencil erasers, which scrape off micro-thin gold plating and leave conductive residue inside motherboard slots!
- *Thermal Interface Re-pasting:* Factory thermal compounds degrade, dry out, and pump out under cyclical thermal expansion over 3 to 5 years. Remove hardened compound using 99% IPA and thermal material remover before applying modern carbon-microparticle or phase-change thermal interface materials (PTM7950).

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #photo-card(
      "../03_VISUAL_ASSETS/authentic-hardware-photographs/digital-multimeter-testing.jpg",
      caption: "Figure 9.2: Verifying DC output voltages on an external test bench using a certified multimeter.",
      height: 48pt
    )
  ],
  [
    #concept-box(title: "Lithium-Ion Battery Safety & Swollen Cell Triage")[
      Lithium-ion polymer pouch cells in laptops and mobile devices degrade through electrochemical oxidation, generating flammable volatile gases (hydrocarbons, carbon monoxide, and hydrogen) that inflate the battery pouch:
      - *Visual Indicators:* Trackpad lifting, chassis buckling, uneven laptop wobble on flat tables.
      - *Immediate Action:* Power down device immediately. Disconnect AC charger.
      - #hl[*Extreme Danger:* Never puncture, squeeze, or bend swollen battery cells!] Piercing the separator causes an internal short circuit leading to instantaneous thermal runaway, explosive fire (>1,000°C), and toxic gas release.
      - *Safe Disposal:* Place swollen unit into a dedicated fireproof lithium safety bag or bucket of dry silica sand. Transport to an authorized hazardous e-waste recycling depot.
    ]
  ]
)

#v(2pt)

== 9.4 Storage Sanitization Standards (NIST SP 800-88 Rev. 1)
Emptying the Recycle Bin or performing an operating system `quick format` does *not* erase data; file tables are cleared while underlying raw data clusters remain intact and easily recoverable using forensic software:
#table(
  columns: (1fr, 1.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Sanitization Level*], [*Applicable Media*], [*Technical Implementation Standard*]),
  [1. Clear], [HDD & Basic Flash], [Logical sanitization through OS-level overwrite tools. Overwrites all user-accessible storage locations with fixed bit patterns or pseudorandom numbers (e.g., ATA Secure Erase). Prevents simple software recovery.],
  [2. Purge], [NVMe / SSD / Enterprise Storage], [Executes cryptographic erase (`Crypto Erase`) by shredding and discarding the internal AES hardware controller encryption key, rendering encrypted flash cells unrecoverable instant block erasure, or physical block over-voltage flash clearing.],
  [3. Destroy], [Classified Drives & Defective Media], [Physical destruction of physical substrate: degaussing (magnetic field exceeding coercivity for HDDs), high-speed industrial mechanical shredding (cutting flash chips into under 2 mm particles), disintegration, or incineration.]
)

#pagebreak()

== 9.5 The Hardware Power-On Self-Test (POST) & Diagnostic Signals
Upon pressing the chassis power button, the motherboard power supply supervisory chip asserts the `Power Good` (+5V) signal once DC voltages stabilize. The CPU then reads its first instruction from the BIOS/UEFI ROM reset vector (`0xFFFFFFF0` on x86) and begins POST execution.
#table(
  columns: (1fr, 1.3fr, 2.7fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Diagnostic Interface*], [*Display Method*], [*Diagnostic Interpretation & Troubleshooting Action*]),
  [EZ-Debug 4-Stage LEDs], [CPU to DRAM to VGA to BOOT], [Sequential LEDs indicate boot milestones. If stuck on *CPU*, inspect socket pins or 8-pin EPS cable. If stuck on *DRAM*, reseat modules in A2/B2 or clean contacts. If stuck on *VGA*, verify GPU PCIe power connectors and monitor input selection. If stuck on *BOOT*, check drive detection or bootloader integrity.],
  [2-Digit Seven-Segment Q-Code], [Hexadecimal alphanumeric LED (e.g., `00`, `15`, `55`, `A2`)], [Displays exact hex stage codes. E.g., `55` indicates memory not installed; `00` denotes CPU not detected or dead; `A2` denotes IDE/SATA/NVMe drive detection phase. Consult motherboard manual code table.],
  [Motherboard Beep Codes], [Piezo buzzer pulse patterns (short/long audio tones)], [#hl[Crucial note: Beep codes vary significantly across BIOS/UEFI vendors] (AMI, Award, Phoenix, Dell, HP). E.g., AMI 1-long-2-short indicates video failure, while 3-short indicates 64KB base RAM failure. Phoenix uses beep pauses (e.g., 1-2-2-3). Always reference vendor-specific documentation!]
)

#v(2pt)

== 9.6 Systematic Hardware Triage Flowchart
#table(
  columns: (1fr, 1.8fr, 2.2fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Symptom Profile*], [*Probable Root Causes*], [*Systematic Isolation & Rectification Steps*]),
  [No Power (Dead System; zero fans, zero LEDs)], [Defective wall outlet, tripped PSU rocker switch, loose 24-pin ATX harness, blown PSU fuse, front-panel switch wire detached.], [Verify AC outlet using a 3-pin receptacle tester. Test PSU health using a dedicated 24-pin digital ATX power supply tester with an LCD voltage readout (never use a makeshift paperclip jump). Inspect front-panel wiring or use a dedicated momentary diagnostic switch on `PWR_SW` header pins (never bridge pins with metal screwdrivers).],
  [No POST / Black Screen (Fans spin, no video signal)], [Unseated RAM, incompatible RAM speed, unseated GPU, loose 8-pin CPU power cable, outdated BIOS for new generation CPU.], [Clear CMOS using rear I/O button, jumper cap, or reseating CR2032 battery. Reseat single RAM stick in Slot A2. Perform USB BIOS Flashback to update firmware without requiring an older CPU installed.],
  [Continuous Reboot Loops / BSOD on Boot], [Corrupt boot partition, thermal shutdown, RAM instability, failed storage drive.], [Enter BIOS setup; verify CPU idle temperature (below 50°C). Disable extreme XMP/EXPO memory profiles. Boot into Windows Recovery Environment (WinRE) or Linux Live USB to test hardware independence.],
  [Thermal Throttling / Sudden Power Off Under Load], [CPU cooler plastic peel not removed, dried thermal paste, failed AIO water pump, blocked radiator dust filter.], [Check AIO pump RPM in BIOS. Ensure mounting bracket thumb screws are torqued down evenly. Inspect chassis dust filters; run hardware stress tests (Prime95 / Cinebench) while monitoring HWiNFO64 temperatures.]
)

#v(2pt)

#concept-box(title: "Clear CMOS & Emergency BIOS Flashback Procedures")[
  - *Clearing CMOS (Complementary Metal-Oxide Semiconductor):* Resetting non-volatile BIOS configuration variables (voltage, memory timings, boot priority) to factory defaults. Unplug AC mains power, press chassis power button to discharge motherboard capacitors, and either press the motherboard's dedicated rear I/O Clear CMOS button, bridge the 2-pin header using a designated plastic jumper cap (never bare metal screwdrivers), or carefully extract the CR2032 3V coin cell battery for 5 minutes.
  - *USB BIOS Flashback:* Allows re-flashing corrupted BIOS ROM or updating firmware for brand-new CPUs without a CPU, RAM, or GPU installed. Format a USB 2.0 drive to FAT32, rename binary file to vendor format (e.g., `CREATIVE.CAP`), insert into designated rear Flashback USB port, and hold dedicated button for 3 seconds until LED blinks.
]

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why should I plug RAM sticks into slots A2 and B2 instead of A1 and B1?", a: "Daisy-chain motherboard traces mandate populating end-of-line slots (A2 and B2) to eliminate signal reflections from empty trace stubs at high DDR5 frequencies.")
#faq-item(q: "What should I do immediately if my laptop battery starts swelling?", a: "Immediately disconnect the AC charger and power down the laptop. Never puncture or press the battery. Isolate the device in a fireproof container and take it to e-waste recycling.")
#faq-item(q: "Why is WMIC not recommended for checking storage drive health in Windows 11?", a: "WMIC has been officially deprecated by Microsoft due to legacy security flaws. Modern administrators use PowerShell CIM cmdlets (Get-CimInstance).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "How should PC fan blades be secured during compressed air cleaning, and why?", ans: "Mechanically secure blades with a non-conductive probe (never bare fingers) to prevent bearing over-spin and reverse inductive back-EMF.")
#short-q(num: 2, q: "What chemical purity of Isopropyl Alcohol is required for cleaning RAM and PCIe contacts?", ans: "99% pure anhydrous IPA.")
#short-q(num: 3, q: "Which command scans and replaces corrupted Windows system files from a cached store?", ans: "sfc /scannow.")
#short-q(num: 4, q: "Which command explicitly re-negotiates a DHCP IP lease with the network router?", ans: "ipconfig /renew.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Why must cooling fan blades be mechanically immobilized with a non-conductive probe during compressed air cleaning?", a: "To prevent blade warping", b: "To prevent bearing over-spin damage and reverse inductive back-EMF into headers", c: "To reduce noise", d: "To save compressed air volume", ans: "B", expl: "Uncontrolled spinning damages mechanical bearings and induces reverse electromotive force (back-EMF) into motherboard fan circuitry.")
#mcq(num: 2, q: "Which memory slots should be populated first on modern daisy-chain motherboards with two DIMM sticks?", a: "Slots A1 and B1 (1 & 3)", b: "Slots A2 and B2 (2 & 4)", c: "Any adjacent slots", d: "Slots A1 and A2", ans: "B", expl: "Daisy-chain PCB traces require populating end-of-trace slots A2 and B2 to eliminate reflection stubs.")
#mcq(num: 3, q: "Which NIST SP 800-88 sanitization level permanently discards cryptographic keys to render data unrecoverable?", a: "Clear", b: "Purge (Cryptographic Erase)", c: "Destroy", d: "Reformat", ans: "B", expl: "Cryptographic Erase (Purge level) deletes internal keys, rendering flash storage instantly inaccessible.")
#mcq(num: 4, q: "What dangerous reaction occurs if a swollen lithium-ion battery pouch is physically punctured?", a: "Instant cooling", b: "Thermal runaway, explosive fire, and toxic gas release", c: "Immediate recharge", d: "Depressurization", ans: "B", expl: "Piercing a lithium cell creates short circuits, igniting organic electrolytes at temperatures exceeding 1000°C.")
#mcq(num: 5, q: "Which command replaces deprecated WMIC in modern Windows environments to query physical disk health?", a: "diskpart /clean", b: "Get-CimInstance Win32_DiskDrive", c: "ipconfig /all", d: "format C:", ans: "B", expl: "WMIC is deprecated; modern PowerShell CIM cmdlets such as Get-CimInstance provide secure hardware inventory.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "Anti-Static Bags: Conductive Exterior Warning")[
      Silver metallized shielding bags form a Faraday cage, but their #hl[outer surface is conductive]! Placing an active motherboard on top of a bag can short solder pins and destroy the board.
    ]
  ],
  [
    #tech-spotlight-box(title: "2027 Safety Standard: 12V-2x6 Power Cable")[
      The PCIe 5.1 / ATX 3.1 standard replaced 12VHPWR with the #hl[12V-2x6 design]. Sensing pins are recessed by 1.7mm, preventing high-wattage power transmission unless 100% seated!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
