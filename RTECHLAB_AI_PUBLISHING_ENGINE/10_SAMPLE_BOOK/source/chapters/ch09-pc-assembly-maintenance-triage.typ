#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *

// =============================================================================
// CHAPTER 09: PC ASSEMBLY, HARDWARE MAINTENANCE & DIAGNOSTIC TRIAGE
// =============================================================================

#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 09 · HARDWARE LAB & TRIAGE]
= Chapter 9: PC Assembly, Hardware Maintenance & Diagnostic Triage

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  An authoritative hands-on practical guide: full desktop computer assembly, electrostatic safety, power supply testing, POST diagnostic beep codes, and systemic troubleshooting flowcharts.
]

#v(4pt)

== 9.1 Professional Desktop PC Assembly: The 8-Step Blueprint
Building a modern high-performance workstation requires methodical mechanical assembly, thermal paste management, and cable routing:

#v(2pt)

#analogy-box(title: "The Surgical Operating Room Analogy")[
  Treat PC assembly like a sterile surgical operation:
  - #strong[Workplace Prep:] Clean, non-magnetic wooden table. Zero static rugs or wool sweaters.
  - #strong[Gentle Precision:] Zero force required! A CPU drops into its socket by its own weight. If you must push hard, the orientation notch is aligned incorrectly!
  - #strong[Thermal Interface:] Like butter on toast—a microscopic, paper-thin layer is all that is needed to bridge micro-imperfections between the copper cooler and silicon heat spreader.
]

#v(3pt)

#dual-photo(
  img1: "/public/images/notes/photos/psu-atx-power-supply.jpg",
  cap1: "Figure 9.1: Modular ATX Power Supply Unit (12V High-Amperage Rails & DC Cable Harness)",
  img2: "/public/images/notes/photos/digital-multimeter-testing.jpg",
  cap2: "Figure 9.2: Precision Digital Multimeter Verifying DC Output Voltages (+12V, +5V, +3.3V)",
  height: 80pt
)

#v(3pt)

#table(
  columns: (0.7fr, 1.4fr, 2.9fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3.5pt,
  table.header([*Step*], [*Assembly Phase*], [*Critical Engineering Checkpoint & Precautions*]),
  [#strong[1]], [CPU Installation], [Align gold corner triangle on CPU with socket indicator. Lower into LGA socket with zero force. Lock retention lever.],
  [#strong[2]], [RAM Dual-Channel], [Install DIMMs into slots #hl[A2 and B2] (Slots 2 & 4) to activate 128-bit dual-channel memory bandwidth.],
  [#strong[3]], [M.2 NVMe SSD], [Insert at 30-degree angle into PCIe 5.0 slot, screw down standoff, and peel protective film off thermal pad!],
  [#strong[4]], [Standoffs & Case], [Verify brass motherboard standoffs match form factor (ATX/mATX). #hl[Never install board directly against bare metal!]],
  [#strong[5]], [Thermal Paste & Cooler], [Apply a single pea-sized dot ($approx 4-5 " mm"$) of thermal compound in center. Tighten cooler screws in diagonal X-pattern.],
  [#strong[6]], [PSU & Power Harness], [Mount PSU fan facing ventilation mesh. Connect #hl[24-pin ATX, 8-pin CPU EPS], and dedicated PCIe/12VHPWR cables.],
  [#strong[7]], [Front-Panel Headers], [Connect tiny 2-pin jumpers: Power SW, Reset SW, HDD LED ($+ / -$), Power LED to motherboard front header pins.],
  [#strong[8]], [GPU & First POST], [Seat GPU in top reinforced PCIe x16 slot. Connect monitor cable directly to GPU port, #hl[NEVER the motherboard I/O!]]
)

#pagebreak()

// PAGE 2 OF CHAPTER 9: DIAGNOSTIC TRIAGE & TROUBLESHOOTING FLOWCHARTS
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 09 · HARDWARE LAB & TRIAGE]
== 9.2 Universal Hardware Diagnostic Flowcharts
When a client PC fails to operate, professional hardware engineers follow systematic elimination protocols:

#v(2pt)

=== Triage Scenario A: "Computer is Completely Dead (No Lights, No Fans Spin)"
1. #strong[Verify AC Mains & Cable:] Check wall outlet with multimeter ($230 " V" plus.minus 10%$). Ensure the rocker switch on the back of the PSU is switched to `1 (ON)`.
2. #strong[The PSU Paperclip Test:] Disconnect all cables from motherboard. On the 24-pin ATX connector, short the green wire (#hl[`PS_ON#` Pin 16]) to any adjacent black ground wire (Pin 15 or 17) with a paperclip. If PSU fan spins, the power supply is alive!
3. #strong[Front-Panel Power Switch Test:] Remove the `Power SW` jumper from motherboard headers. Briefly bridge the two header pins with a flathead screwdriver. If PC turns on, the physical case power button switch is broken!
4. #strong[CMOS Battery Check:] Test the CR2032 coin-cell battery with a multimeter. If voltage reads below #hl[2.7V (Nominal 3.0V)], replace battery; dead batteries can stall motherboard chipset power sequencing.

#v(3pt)

=== Triage Scenario B: "Fans Spin, LEDs Light Up, But No Display / Black Screen"
#block(stroke: 0.5pt + rtech-amber, fill: white, radius: 4pt, inset: 6pt)[
  #text(weight: "bold", size: 8pt, fill: rtech-amber.darken(30%))[#emoji.warning The #1 Most Common Amateur Mistake: The GPU Display Cable Trap!]\
  If the PC has a dedicated graphics card (NVIDIA GeForce or AMD Radeon), the HDMI or DisplayPort cable #hl[MUST be plugged directly into the graphics card rear port]. If plugged into the motherboard HDMI port, the monitor stays black because CPUs without integrated graphics (e.g. Intel 'F' series or AMD Ryzen 5000) output zero video signals!
]

#v(2pt)

1. #strong[Motherboard EZ Debug LEDs:] Check the 4 diagnostic LEDs (CPU, DRAM, VGA, BOOT). If the #hl[`DRAM` LED stays solid amber/red], the motherboard failed to initialize memory.
2. #strong[The RAM Eraser Technique:] Unseat RAM sticks. Clean the gold edge connectors gently using a soft rubber pencil eraser to remove microscopic oxidation, then firmly reseat into slots A2/B2 until both retention clips snap shut.
3. #strong[POST Beep Codes:] If motherboard buzzer is connected:
   - #strong[1 Short Beep:] System is healthy (POST passed successfully).
   - #strong[Continuous Long Beeps:] RAM memory failure or missing DIMM.
   - #strong[1 Long Beep, 2/3 Short Beeps:] GPU / Display adapter not detected or video memory failure.

#pagebreak()

// PAGE 3 OF CHAPTER 9: 12 ESSENTIAL WINDOWS CLI DIAGNOSTIC COMMANDS
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 09 · HARDWARE LAB & TRIAGE]
== 9.3 12 Essential Windows CLI Diagnostic Commands for IT Support
Field IT support engineers resolve 90% of operating system corruption and network outages using administrative command-line utilities:

#v(2pt)

#table(
  columns: (1.4fr, 1fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3.5pt,
  table.header([*CLI Command*], [*Access Level*], [*Technical Diagnostic Purpose & Industrial Action*]),
  [`sfc /scannow`], [Admin CMD], [#hl[System File Checker]. Scans all protected Windows system binaries and automatically repairs corrupted files from WinSxS cache.],
  [`dism /online /cleanup-image /restorehealth`], [Admin CMD], [#hl[DISM Repair Tool]. Downloads verified clean replacement system components directly from Microsoft Windows Update servers.],
  [`chkdsk C: /f /r`], [Admin CMD], [#hl[Check Disk]. Locates bad magnetic/NAND sectors on volume C:, recovers readable data, and repairs file system tables.],
  [`ipconfig /all`], [Standard CMD], [Displays complete network adapter configuration: MAC address, IPv4 address, Subnet Mask, Gateway, DHCP lease, and DNS servers.],
  [`ipconfig /flushdns`], [Admin CMD], [Clears the local OS DNS resolver cache, fixing stale domain name mappings after website IP migrations.],
  [`ping 8.8.8.8 -t`], [Standard CMD], [Continuously tests internet connectivity, packet latency (RTT in ms), and packet loss percentage to Google DNS.],
  [`tracert 1.1.1.1`], [Standard CMD], [Traces the exact hop-by-hop router path across the Internet, identifying the exact ISP router causing packet drops.],
  [`netstat -ano`], [Admin CMD], [Lists all active TCP/UDP connections, listening ports, and the corresponding Process ID (PID) owning each socket.],
  [`wmic diskdrive get status`], [Standard CMD], [Queries internal S.M.A.R.T. hardware telemetry across all connected SSDs and HDDs (`Status=OK`).],
  [`powercfg /batteryreport`], [Admin CMD], [Generates an exhaustive HTML report of laptop battery degradation, cycle count, and design capacity vs full charge capacity.]
)

#v(3pt)

#block(stroke: 0.5pt + rtech-border, fill: rtech-paper, radius: 4pt, inset: 6pt)[
  #text(weight: "bold", size: 8pt, fill: rtech-navy)[The 2-Step Windows BSOD Recovery Formula:]\
  Whenever a workstation experiences unexplained crashes, run:
  1. `DISM /Online /Cleanup-Image /RestoreHealth` (Restores the offline component store from Microsoft).
  2. Followed immediately by: `sfc /scannow` (Uses the verified component store to fix OS files).
]

#pagebreak()

// PAGE 4 OF CHAPTER 9: EVALUATION LAB (FAQS, Q&A, MCQS, FACT, QR)
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 09 · PRACTICE & EVALUATION LAB]
= Chapter 9 Comprehensive Review, FAQs & Evaluation Lab

#v(2pt)

== 1. Frequently Asked Student Questions (FAQs)
#faq-item(
  q: "Can static electricity (ESD) really kill a computer motherboard or CPU?",
  a: "Yes! A human body can carry over 15,000 Volts of static charge without feeling a shock (we only feel shocks above 3,000V). However, microscopic semiconductor gate oxides inside modern CPUs and RAM can be permanently destroyed by as little as 30 Volts! Always touch an unpainted metal chassis or wear an antistatic wrist strap before handling bare circuits."
)
#faq-item(
  q: "What is the purpose of thermal paste between the CPU and heatsink?",
  a: "Even smooth polished metal surfaces have microscopic air gaps that act as thermal insulators. Thermal paste fills these microscopic voids with thermally conductive metal-oxide particles, ensuring direct heat transfer from the processor heat spreader into the copper cooler fins."
)
#faq-item(
  q: "What does the CR2032 CMOS coin battery do on modern motherboards?",
  a: "It maintains power to the Real-Time Clock (RTC) chip and CMOS non-volatile register when the PC is unplugged from the wall, preserving current date, time, and custom hardware settings."
)

#v(2pt)

== 2. Short-Answer Review Questions with Verified Answers
#short-qa(
  num: 1,
  q: "Why should desktop RAM modules be installed in slots A2 and B2 instead of A1 and B1?",
  a: "Motherboard circuit traces use daisy-chain topology; slots A2 and B2 are the physical terminations of the memory channels, minimizing electrical signal reflection and ensuring maximum stability at high XMP/EXPO frequencies."
)
#short-qa(
  num: 2,
  q: "How can you test if a Power Supply Unit (PSU) powers on without connecting a motherboard?",
  a: "The Paperclip Test: Short Pin 16 (Green wire / PS_ON#) to any Ground pin (Black wire / Pin 15/17) on the 24-pin ATX connector; if functional, the PSU cooling fan will spin."
)
#short-qa(
  num: 3,
  q: "What is the primary symptom of a monitor display cable plugged into the motherboard instead of the GPU?",
  a: "The PC fans spin and LEDs illuminate normally, but the monitor displays 'No Signal' / black screen because discrete CPUs without integrated graphics do not output video via motherboard ports."
)
#short-qa(
  num: 4,
  q: "Which Windows CLI command fixes corrupted operating system files from the local component store?",
  a: "`sfc /scannow` (System File Checker)."
)

#v(2pt)

== 3. 5 High-Yield Chapter 9 Multiple-Choice Questions (MCQs)
#mcq(num: 1, q: "Which command-line tool verifies hard disk file system integrity and scans for bad sectors?", a: "ipconfig", b: "chkdsk", c: "netstat", d: "dxdiag", ans: "B", expl: "`chkdsk` (Check Disk) scans and repairs file system tables and identifies bad storage clusters.")
#mcq(num: 2, q: "What nominal DC voltage should a healthy CMOS coin-cell battery (CR2032) measure?", a: "1.5 Volts", b: "3.0 Volts", c: "5.0 Volts", d: "12.0 Volts", ans: "B", expl: "CR2032 lithium coin cells deliver a nominal 3.0 Volts DC; voltages below 2.7V trigger CMOS clock errors.")
#mcq(num: 3, q: "What does a single short beep during initial computer startup typically signify?", a: "Motherboard dead", b: "RAM failure", c: "POST passed successfully", d: "Keyboard missing", ans: "C", expl: "A single short POST beep universally indicates that hardware diagnostics passed successfully.")
#mcq(num: 4, q: "Which tool downloads fresh Windows image components directly from Microsoft update servers to repair corruption?", a: "Task Manager", b: "SFC", c: "DISM", d: "Regedit", ans: "C", expl: "`DISM /Online /Cleanup-Image /RestoreHealth` repairs the underlying Windows Component Store.")
#mcq(num: 5, q: "On modern motherboards, which slots provide optimal dual-channel RAM configuration?", a: "Slots 1 & 2", b: "Slots 2 & 4 (A2 & B2)", c: "Slots 3 & 4", d: "Any random slot", ans: "B", expl: "Slots 2 & 4 (A2 and B2) are the termination ends of memory channels in daisy-chain PCB designs.")

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #fact-box(title: "The 450-Watt Graphics Card Cable")[
      High-end modern graphics cards draw over #hl[450 Watts of power]—more than an entire mid-range desktop PC! The new 12V-2x6 / 12VHPWR power cable carries up to 600W across 16 micro-pins, featuring onboard thermal sensor pins to prevent melted connectors!
    ]
  ],
  [
    #tool-qr-card(
      tool-name: "RTechLab Hardware Port & Cable Guide",
      tool-desc: "Inspect full color diagrams and bandwidth specifications for USB-C, HDMI 2.1, DisplayPort, and PCIe live:",
      qr-img: "/public/images/notes/qr-tool-port-reference.svg",
      tool-url: "http://localhost:5173/tools/port-reference"
    )
  ]
)
