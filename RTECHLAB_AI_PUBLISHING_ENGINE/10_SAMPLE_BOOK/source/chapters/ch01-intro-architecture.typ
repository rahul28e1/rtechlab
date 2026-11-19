#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *

// =============================================================================
// CHAPTER 01: INTRODUCTION TO COMPUTERS & SYSTEM ARCHITECTURE
// =============================================================================

#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 01 · SYSTEM FOUNDATIONS]
= Chapter 1: Introduction to Computers & System Architecture

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  A deep foundational exploration of what defines a computer, the Von Neumann architecture, the continuous IPO pipeline, and the historic transition from vacuum tubes to modern AI silicon.
]

#v(4pt)

== 1.1 What is a Computer? Technical Definition & The Human Body Analogy
A computer is not merely a screen or a calculator. Formally, a computer is an #hl[advanced programmable electronic system] that accepts raw, unprocessed data as input, stores and processes it under stored program control, and produces meaningful, verified information as output.

#v(2pt)

#analogy-box(title: "The Human Body vs Computer Anatomy")[
  To understand a computer intuitively, compare it to the human body:
  - #strong[CPU (Central Processing Unit):] The #hl[Brain]. It makes decisions, coordinates motor movements, and performs calculations.
  - #strong[Motherboard:] The #hl[Nervous System & Skeleton]. Its copper traces carry high-speed electrical signals between all organs.
  - #strong[RAM (Main Memory):] The #hl[Short-Term Working Memory]. Holds thoughts and numbers while you are solving a math problem.
  - #strong[SSD / Hard Drive:] The #hl[Long-Term Memory Notebook]. Preserves memories forever, even when you go to sleep.
  - #strong[Power Supply (SMPS):] The #hl[Heart]. Pumps continuous, regulated blood (voltage) to keep every organ alive!
]

#v(2pt)

#photo-card(
  "/public/images/notes/photos/desktop-pc-workstation.jpg",
  caption: "Figure 1.1: Complete Personal Computer Workstation (Display, Input Devices, Tower & Peripherals)",
  height: 85pt
)

#v(2pt)

== 1.2 The 4 Fundamental Characteristics of Computing Systems
Every digital computer in the world operates based on four foundational operational pillars:
1. #strong[High Speed (GHz Velocity):] While a human takes 5 seconds to multiply two 6-digit numbers, a modern CPU executes #hl[billions of mathematical operations per second] (measured in Gigahertz).
2. #strong[100% Mathematical Accuracy:] Computers make zero arithmetic mistakes on their own. Output accuracy depends entirely on input integrity. This is defined by the universal computing law: #hl[GIGO (Garbage In, Garbage Out)]. If garbage data is entered, the output will reliably be garbage.
3. #strong[Diligence (Tireless Execution):] Unlike biological workers who experience fatigue, eye strain, and loss of concentration, a computer operates #hl[24 hours a day, 365 days a year] with zero degradation in speed or accuracy.
4. #strong[Versatility (Universal Flexibility):] The exact same PC can calculate missile orbital trajectories, edit 4K video streams, stream live multiplayer gaming, and manage enterprise banking databases simply by executing different software code!

#pagebreak()

// PAGE 2 OF CHAPTER 1: THE IPO CYCLE & VON NEUMANN ARCHITECTURE
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 01 · SYSTEM FOUNDATIONS]
== 1.3 The 4-Stage IPO Cycle (Input -> Process -> Output -> Storage)

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Every computer transaction—from clicking a button on YouTube to booking a railway ticket—flows through the sequential IPO pipeline.
]

#v(3pt)

#analogy-box(title: "The Commercial Kitchen Analogy")[
  Think of a computer as a busy restaurant kitchen:
  1. #strong[Input:] The waiter brings the customer's raw food order slip into the kitchen.
  2. #strong[Processing:] The master chef (CPU) reads the recipe and cooks the dish on the cutting board.
  3. #strong[Output:] The prepared hot dish is placed on a tray and served to the customer.
  4. #strong[Storage:] The recipe book and leftover ingredients are locked inside the deep refrigerator for tomorrow!
]

#v(3pt)

#table(
  columns: (1fr, 1.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 4pt,
  table.header([*IPO Phase*], [*Hardware Devices*], [*Technical Operational Mechanism*]),
  [#text(weight: "bold", fill: rtech-cyan)[1. INPUT]], [Keyboard, Optical Mouse, Flatbed Scanner, Microphone], [Converts human sensory gestures and analog signals into discrete binary bits (0s and 1s) sent across the motherboard bus.],
  [#text(weight: "bold", fill: rtech-violet)[2. PROCESS]], [Central Processing Unit (ALU + Control Unit)], [Decodes the binary instruction opcodes, performs arithmetic calculation, and directs memory movement.],
  [#text(weight: "bold", fill: rtech-emerald)[3. OUTPUT]], [IPS/OLED Monitors, Laser Printers, Audio DAC], [Transforms internal binary state into human-understandable photons (screens), ink marks (paper), or sound waves.],
  [#text(weight: "bold", fill: rtech-amber)[4. STORAGE]], [PCIe NVMe SSD, Mechanical HDD, Flash Drive], [Preserves binary magnetic or floating-gate transistor states permanently for days, months, or decades.]
)

#v(4pt)

== 1.4 Von Neumann Architecture: The Foundation of Modern Computing
In 1945, mathematician John von Neumann published the design principles that power 99.9% of modern PCs, laptops, and smartphones. 

The core breakthrough of Von Neumann was the #hl[Stored-Program Concept]: both software program instructions and user data reside together inside the same physical main memory (RAM).

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(stroke: 0.5pt + rtech-border, fill: white, radius: 4pt, inset: 6pt)[
      #text(weight: "bold", size: 8pt, fill: rtech-navy)[The 3 Motherboard System Buses:]\
      #v(2pt)
      - #strong[Data Bus (Bi-directional):] The physical copper highway that transfers actual binary data between CPU, RAM, and I/O devices (64 bits wide in modern PCs).
      - #strong[Address Bus (Uni-directional):] Carries the exact physical RAM memory address the CPU wishes to read from or write to.
      - #strong[Control Bus (Bi-directional):] Carries micro-timing synchronization pulses (Read, Write, Interrupt, Clock).
    ]
  ],
  [
    #block(stroke: 0.5pt + rtech-border, fill: white, radius: 4pt, inset: 6pt)[
      #text(weight: "bold", size: 8pt, fill: rtech-navy)[The Von Neumann Bottleneck:]\
      #v(2pt)
      Because program instructions and data share the exact same system bus, the CPU cannot read an instruction and read/write data at the exact same instant!
      \ \
      #hl[Modern Solution:] CPU manufacturers solved this by embedding high-speed, multi-level on-die SRAM caches (L1, L2, L3) directly on the silicon!
    ]
  ]
)

#pagebreak()

// PAGE 3 OF CHAPTER 1: CLASSIFICATION & 5 GENERATIONS
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 01 · SYSTEM FOUNDATIONS]
== 1.5 Classification of Computers: From Wearables to Supercomputers

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Computers are categorized by their computational throughput, physical form factor, and intended operational scope.
]

#v(2pt)

#table(
  columns: (1.2fr, 1.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 4pt,
  table.header([*Computer Class*], [*Typical Architecture*], [*Real-World Industrial Application*]),
  [#strong[1. Microcomputers]], [Single microprocessor (Intel Core, AMD Ryzen, Apple M-Series)], [Personal desktops, laptops, tablets, and smartphones used for general-purpose personal and office productivity.],
  [#strong[2. Minicomputers]], [Multi-core rackmount systems (Midrange servers)], [Small to medium enterprise inventory management, manufacturing line control, and departmental database hosting.],
  [#strong[3. Mainframe Computers]], [High-throughput enterprise processors (IBM z16)], [Centralized transaction processing for global airlines, ATM banking networks (handling millions of transactions/sec).],
  [#strong[4. Supercomputers]], [Tens of thousands of linked parallel CPUs & GPUs], [Climate modeling, nuclear simulation, quantum physics research, and AI deep neural network training (e.g. Frontier, Fugaku).],
  [#strong[5. Embedded Systems]], [Dedicated microcontroller (ARM Cortex-M, ESP32)], [Dedicated single-purpose logic inside washing machines, car ECU engine sensors, medical pacemakers, and IoT devices.]
)

#v(4pt)

== 1.6 Evolution of Computers: The 5 Historic Generations
The history of digital computers is divided into five distinct technological epochs, defined by the #hl[fundamental electronic switching element] used to represent binary 0 and 1:

#v(2pt)

#photo-card(
  "/public/images/notes/photos/vacuum-tube-first-gen.jpg",
  caption: "Figure 1.2: Authentic First-Generation Vacuum Tube (High Power Draw, Fragile Glass Envelope)",
  height: 80pt
)

#v(2pt)

#table(
  columns: (0.9fr, 1.4fr, 1.3fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3.5pt,
  table.header([*Generation*], [*Core Electronic Switch*], [*Memory Technology*], [*Milestones & Iconic Systems*]),
  [#text(weight: "bold")[1st (1940-56)]], [Vacuum Tubes (Thermionic Valves)], [Magnetic Drums & Delay Lines], [ENIAC, UNIVAC I. Room-sized, drew 150kW power, generated massive heat. Programmed in raw machine code (0s & 1s).],
  [#text(weight: "bold")[2nd (1956-63)]], [Transistors (Solid-State Germanium/Silicon)], [Magnetic Core Memory (Ferrite Rings)], [IBM 1401, PDP-1. 10x smaller, 100x more reliable. Introduction of Assembly language and early FORTRAN/COBOL.],
  [#text(weight: "bold")[3rd (1964-71)]], [Integrated Circuits (SSI & MSI ICs)], [Magnetic Disk Platters], [IBM System/360. Placed dozens of transistors on a single silicon chip. Keyboards and monitors replaced punch cards. Operating systems born!],
  [#text(weight: "bold")[4th (1971-Pres)]], [VLSI & ULSI Microprocessors], [Semiconductor DRAM & 3D NAND Flash], [Intel 4004/8086, Personal Computers, Laptops, Mobile smartphones, Internet revolution. Billions of transistors per chip!],
  [#text(weight: "bold")[5th (Present+)]], [Parallel AI Processors & Quantum Qubits], [High-Bandwidth HBM3e Memory & Cloud], [Dedicated Neural Processing Units (NPUs), natural language voice processing, quantum computing, autonomous robotics.]
)

#pagebreak()

// PAGE 4 OF CHAPTER 1: CHAPTER 1 FULL PEDAGOGY PACKAGE (FAQS, Q&A, MCQS, FACTS, QR)
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 01 · PRACTICE & EVALUATION LAB]
= Chapter 1 Comprehensive Review, FAQs & Evaluation Lab

#v(2pt)

== 1. Frequently Asked Student Questions (FAQs)
#faq-item(
  q: "Why are vacuum tubes no longer used in computers?",
  a: "Vacuum tubes relied on heated filaments inside fragile glass bulbs (like incandescent lamps). They burned out constantly, consumed massive electrical wattage, and generated so much heat that entire rooms required industrial air conditioning!"
)
#faq-item(
  q: "What is the difference between data and information?",
  a: "Data consists of raw, unorganized, uninterpreted facts (e.g. 'Rahul, 92, 88, 95'). Information is processed, structured, and meaningful data that helps decision making (e.g. 'Student Rahul scored an average of 91.6% and secured 1st Rank in Computer Science')."
)
#faq-item(
  q: "Can a supercomputer be used to play regular desktop PC games?",
  a: "Technically yes, but practically no. Supercomputers are engineered with thousands of parallel nodes running Linux without standard consumer graphics drivers, designed for mathematical floating-point calculations rather than consumer gaming APIs."
)

#v(2pt)

== 2. Short-Answer Review Questions with Verified Answers
#short-qa(
  num: 1,
  q: "State the four stages of the IPO cycle and identify one hardware device for each phase.",
  a: "1. Input (Keyboard), 2. Process (CPU ALU/CU), 3. Output (Monitor Display), 4. Storage (NVMe SSD Drive)."
)
#short-qa(
  num: 2,
  q: "What is the GIGO principle in computer science?",
  a: "Garbage In, Garbage Out: Computers operate with absolute mathematical obedience; if incorrect data or flawed logic is inputted, the computer will reliably output incorrect results."
)
#short-qa(
  num: 3,
  q: "Explain the stored-program concept introduced by John von Neumann.",
  a: "The principle that program software instructions and user data share the exact same physical memory address space (RAM), allowing software to be reprogrammed without physically rewiring circuits."
)
#short-qa(
  num: 4,
  q: "What electronic component defines the fourth generation of computers?",
  a: "VLSI/ULSI Microprocessors, which consolidated the entire CPU (ALU, Control Unit, and Registers) onto a single silicon integrated circuit die."
)

#v(2pt)

== 3. 5 High-Yield Chapter 1 Multiple-Choice Questions (MCQs)
#mcq(num: 1, q: "Which of the following devices is an optical input device?", a: "Laser Printer", b: "Flatbed Scanner", c: "Headphones", d: "SMPS", ans: "B", expl: "Flatbed scanners use optical sensors (CCD/CIS) to digitize paper documents into binary pixels.")
#mcq(num: 2, q: "Second-generation computers (1956–1963) were built using which fundamental technology?", a: "Vacuum Tubes", b: "Transistors", c: "Microprocessors", d: "Optoelectronic Crystals", ans: "B", expl: "Transistors replaced fragile vacuum tubes, dramatically reducing heat and power consumption.")
#mcq(num: 3, q: "What does the computing acronym GIGO stand for?", a: "General Input General Output", b: "Garbage In, Garbage Out", c: "Gateway Interface Global Operation", d: "Graphics Input Graph Output", ans: "B", expl: "GIGO highlights that computers produce incorrect output if fed incorrect input.")
#mcq(num: 4, q: "Which computer generation introduced microprocessors on a single silicon chip?", a: "First Generation", b: "Second Generation", c: "Third Generation", d: "Fourth Generation", ans: "D", expl: "Fourth-generation computers are defined by VLSI/ULSI microprocessors starting with Intel 4004 in 1971.")
#mcq(num: 5, q: "Which power supply unit converts 230V AC to regulated DC voltages inside a PC?", a: "BIOS Chip", b: "SMPS", c: "RAM DIMM", d: "PCIe Slot", ans: "B", expl: "Switched-Mode Power Supply (SMPS) delivers +12V, +5V and +3.3V DC to PC components.")

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #fact-box(title: "The Power of ENIAC")[
      The 1946 ENIAC computer contained 18,000 vacuum tubes, weighed 30 tons, and consumed 150 kW of electricity. Today, a microscopic smartphone chip is over 100,000 times faster while drawing under 5 Watts!
    ]
  ],
  [
    #tool-qr-card(
      tool-name: "Binary & Hexadecimal Interactive Converter",
      tool-desc: "Computers only speak in 0s and 1s! Test your base conversion knowledge live on RTechLab:",
      qr-img: "/public/images/notes/qr-tool-binary-converter.svg",
      tool-url: "http://localhost:5173/tools/binary-converter"
    )
  ]
)
