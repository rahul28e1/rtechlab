#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *

// =============================================================================
// CHAPTER 02: INPUT & OUTPUT (I/O) HARDWARE SYSTEMS & PORTS
// =============================================================================

#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 02 · HARDWARE INTERFACES]
= Chapter 2: Input & Output (I/O) Hardware Systems & Ports

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  A comprehensive technical study of peripheral input transducers, display panels, laser print engines, and modern high-speed interface connectivity standards.
]

#v(4pt)

== 2.1 Input Hardware Systems: Keyboards, Sensors & Digitizers
Input devices are physical transducers that detect mechanical motion, optical reflections, or sound pressure and convert them into #hl[standardized digital binary scan codes].

#v(2pt)

#analogy-box(title: "The Human Senses Analogy")[
  If the CPU is the brain, input devices are the #hl[Eyes, Ears, and Nerve Endings] of the computer. The keyboard represents touch, the microphone represents hearing, the webcam and scanner represent vision, and biometric sensors represent unique fingerprint identification!
]

#v(2pt)

#photo-card(
  "/public/images/notes/photos/computer-input-devices.jpg",
  caption: "Figure 2.1: Modern Ergonomic Input Peripherals (Multifunction Keyboard & Optical Mouse Sensor)",
  height: 85pt
)

#v(2pt)

=== 1. Keyboard Technology: Membrane vs Mechanical Switches
- #strong[Membrane Keyboards:] Use three flexible plastic sheets with conductive carbon traces. Pressing a key pushes a rubber dome down, bridging the circuit. #hl[Cheaper and spill-resistant], but feels 'mushy' with no tactile feedback.
- #strong[Mechanical Keyboards:] Every individual key houses its own independent physical electrical switch (Cherry MX style):
  - #strong[Linear Switches (Red):] Smooth keystroke from top to bottom with zero bump. Ideal for rapid gaming.
  - #strong[Tactile Switches (Brown):] Noticeable bump halfway through travel, signaling exact key actuation without bottoming out.
  - #strong[Clicky Switches (Blue):] Produces a distinct tactile bump and audible mechanical 'click'. Ideal for high-speed typists.

=== 2. Optical & Laser Mouse Sensor Engineering
A modern optical mouse does not use a rubber trackball. It is actually a #hl[microscopic high-speed digital camera] taking between 1,000 and 12,000 pictures of your mousepad surface every second!
- #strong[DPI (Dots Per Inch):] Measures sensor sensitivity. A 1,600 DPI mouse moves the cursor 1,600 screen pixels for every one inch of physical movement.
- #strong[Polling Rate (Hz):] How frequently the mouse reports its coordinate packets to the CPU across the USB bus (125Hz = every 8ms; 1000Hz = every 1ms).

#pagebreak()

// PAGE 2 OF CHAPTER 2: OUTPUT HARDWARE (DISPLAYS & PRINTERS)
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 02 · HARDWARE INTERFACES]
== 2.2 Output Hardware Systems: Visual Displays & Print Engines

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Output devices convert binary computational results into sensory light, pigment on paper, or acoustic pressure waves.
]

#v(2pt)

=== 1. Display Panel Technology: LCD vs IPS vs OLED
#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 4pt,
  table.header([*Panel Type*], [*Lighting Architecture*], [*Engineering Characteristics & Trade-offs*]),
  [#strong[TN (Twisted Nematic)]], [Global LED Backlight + Liquid Crystals], [Fastest pixel response times; poor viewing angles and washed-out contrast. Legacy gaming standard.],
  [#strong[IPS (In-Plane Switching)]], [Global LED Backlight + Parallel Crystals], [Exceptional 178° viewing angles and 100% sRGB color accuracy. Industry standard for graphic design and engineering.],
  [#strong[OLED (Organic LED)]], [Self-emissive subpixels (Zero Backlight)], [Each individual pixel turns completely off, delivering #hl[infinite contrast ratio and true absolute black] with 0.1ms response time.]
)

#v(2pt)

#analogy-box(title: "Display Refresh Rate as a Flipbook Animation")[
  Think of a comic book flipbook. If you flip 60 pages in a second (60Hz), the stick figure moves smoothly. If you flip 144 pages in a second (144Hz), the motion looks #hl[silky smooth and lifelike]! Refresh rate measures how many times per second the monitor redraws the entire image buffer.
]

#v(3pt)

=== 2. Laser Printing Technology: The 6-Step Electrostatic Engine
Unlike inkjet printers that squirt liquid droplets through microscopic thermal nozzles, a laser printer is a high-speed #hl[electrostatic photocopy engine]:

#table(
  columns: (1fr, 1.3fr, 2.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3.5pt,
  table.header([*Step*], [*Phase Name*], [*Physical Action*]),
  [1. Charge], [Primary Corona Wire], [Coats the organic photoconductive drum with a uniform -600V electrostatic charge.],
  [2. Expose], [Laser Diode & Mirror], [Laser beam draws the page image onto the drum, discharging exposed areas to -100V.],
  [3. Develop], [Toner Developer Roller], [Negatively charged black plastic toner powder is attracted only to the discharged laser areas.],
  [4. Transfer], [Transfer Corona Roller], [Passes paper beneath the drum with a strong positive charge, pulling toner onto paper.],
  [5. Fuse], [High-Heat Fuser Rollers], [Heats paper to #hl[200°C under heavy mechanical pressure], melting plastic toner permanently into paper fibers!],
  [6. Clean], [Rubber Cleaning Blade], [Scrapes residual toner particles into the waste hopper and discharges residual voltage.]
)

#pagebreak()

// PAGE 3 OF CHAPTER 2: HIGH-SPEED MODERN PORTS & CABLING
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 02 · HARDWARE INTERFACES]
== 2.3 High-Speed External Ports & Physical Interface Standards

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Modern motherboards and laptops route multi-gigabit data, video streams, and DC charging through standardized physical ports.
]

#v(3pt)

#table(
  columns: (1.2fr, 1.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 4pt,
  table.header([*Port Standard*], [*Peak Bandwidth*], [*Primary Usage & Technical Capabilities*]),
  [#strong[USB Type-C (USB4 / TB4)]], [40 Gbps to 80 Gbps], [Reversible 24-pin connector supporting PCIe data, DisplayPort Alt Mode video, and #hl[up to 240W USB Power Delivery (USB-PD)] to charge laptops.],
  [#strong[HDMI 2.1]], [48 Gbps (FRL)], [Transmits uncompressed digital audio and 4K 120Hz / 8K 60Hz HDR video to consumer televisions and computer monitors.],
  [#strong[DisplayPort 2.1]], [80 Gbps (UHBR20)], [Professional PC monitor standard with native support for daisy-chain Multi-Stream Transport (MST) to drive three 4K monitors on one cable!],
  [#strong[RJ45 (Ethernet)]], [1 Gbps to 10 Gbps], [8P8C modular connector terminating 4 unshielded twisted copper pairs following TIA/EIA-568-B color pinouts.],
  [#strong[3.5mm Combo Audio]], [Analog stereo + mic], [TRRS audio jack connecting microphone and headphone signals through an onboard DAC/ADC chip.]
)

#v(4pt)

#warning-box(title: "The Common GPU Display Cable Trap")[
  In any desktop computer featuring a #hl[dedicated graphics card (NVIDIA GeForce or AMD Radeon)], the HDMI or DisplayPort monitor cable MUST be plugged directly into the horizontal ports on the #hl[GPU], NOT the vertical motherboard video ports! Plugging into the motherboard bypasses the powerful GPU and causes either a black screen or terrible 5 FPS performance!
]

#v(4pt)

== 2.4 Audio Systems: DAC (Digital-to-Analog) vs ADC (Analog-to-Digital)
- #strong[ADC (Analog-to-Digital Converter):] When you speak into a microphone, acoustic pressure vibrates a diaphragm, creating tiny analog voltage waves. The ADC samples this voltage #hl[44,100 times per second (44.1 kHz)] and quantizes each sample into 16-bit or 24-bit binary integers.
- #strong[DAC (Digital-to-Analog Converter):] When playing music, the DAC reads the binary numbers from memory and reconstructs smooth, continuous electrical waveforms that drive the speaker voice coils!

#pagebreak()

// PAGE 4 OF CHAPTER 2: EVALUATION LAB, FAQS, MCQS, QA & PORT QR
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 02 · PRACTICE & EVALUATION LAB]
= Chapter 2 Comprehensive Review, FAQs & Evaluation Lab

#v(2pt)

== 1. Frequently Asked Student Questions (FAQs)
#faq-item(
  q: "What is the difference between DPI and PPI?",
  a: "DPI (Dots Per Inch) refers to physical ink printer dots or mouse sensor movement resolution. PPI (Pixels Per Inch) measures monitor pixel density (how many illuminated subpixels are packed into one physical inch of screen surface)."
)
#faq-item(
  q: "Why does fresh paper coming out of a laser printer feel warm?",
  a: "Because the paper has just passed through the internal Fuser Roller assembly, which uses a quartz heating lamp heated to over 200°C to melt the plastic toner particles permanently into the paper fibers!"
)
#faq-item(
  q: "Can a USB Type-C port replace HDMI completely?",
  a: "Yes! Modern USB Type-C supports 'DisplayPort Alternate Mode', which tunnels native DisplayPort and HDMI audio/video streams across the USB cable while simultaneously charging the laptop."
)

#v(2pt)

== 2. Short-Answer Review Questions with Verified Answers
#short-qa(
  num: 1,
  q: "How does an optical mouse calculate directional cursor movement?",
  a: "It uses an LED/laser illuminator and a micro CMOS camera taking thousands of pictures per second; an onboard Digital Signal Processor (DSP) compares microscopic surface texture differences to calculate X/Y coordinate shifts."
)
#short-qa(
  num: 2,
  q: "Name the six sequential phases of the laser printer printing engine.",
  a: "1. Charge, 2. Expose (Laser drawing), 3. Develop (Toner application), 4. Transfer (Toner to paper), 5. Fuse (Heat and pressure melt), 6. Clean (Waste scraping)."
)
#short-qa(
  num: 3,
  q: "Why does OLED achieve true absolute black levels while IPS cannot?",
  a: "IPS panels rely on a global LED backlight that always leaks a small amount of light through closed crystals. OLED subpixels are self-emissive and turn completely OFF, producing 0 nits of light."
)
#short-qa(
  num: 4,
  q: "What is the primary role of an Audio DAC in computer motherboards?",
  a: "A Digital-to-Analog Converter translates discrete binary numeric audio samples (0s and 1s) into continuous analog electrical AC voltages that vibrate speaker diaphragms."
)

#v(2pt)

== 3. 5 High-Yield Chapter 2 Multiple-Choice Questions (MCQs)
#mcq(num: 1, q: "Which printer type creates characters by melting dry plastic toner powder onto paper?", a: "Dot Matrix", b: "Laser Printer", c: "Thermal Receipt Printer", d: "Plotter", ans: "B", expl: "Laser printers use an electrostatic drum and high-temperature fuser roller to bond dry toner.")
#mcq(num: 2, q: "What does DPI measure in computer display and print specifications?", a: "Data Packets Incoming", b: "Dots Per Inch", c: "Digital Pixel Intensity", d: "Display Port Interface", ans: "B", expl: "Dots Per Inch (DPI) defines spatial printing resolution and mouse sensor sensitivity.")
#mcq(num: 3, q: "Which reversible connector carries USB4 data, DisplayPort video, and up to 240W power?", a: "VGA", b: "DVI-D", c: "USB Type-C", d: "PS/2", ans: "C", expl: "USB Type-C is the universal standard supporting high-speed data, video tunneling, and Power Delivery.")
#mcq(num: 4, q: "Which device converts digital audio samples into analog voltage signals for headphones?", a: "ADC", b: "DAC (Digital-to-Analog Converter)", c: "ALU", d: "GPU VRAM", ans: "B", expl: "A DAC converts binary sound values into continuous analog electrical waves.")
#mcq(num: 5, q: "What standard 8P8C modular connector is used on twisted-pair Ethernet cables?", a: "RJ11", b: "RJ45", c: "SATA Data", d: "Molex 4-Pin", ans: "B", expl: "RJ45 is the standard 8-pin modular connector for Cat5e, Cat6, and Cat6a network cables.")

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #fact-box(title: "The Origin of QWERTY")[
      The QWERTY keyboard layout was patented by Christopher Sholes in 1873. It was deliberately designed to separate commonly used letter pairs (like 'T' and 'H') so mechanical typewriter metal arms would not collide and jam!
    ]
  ],
  [
    #tool-qr-card(
      tool-name: "Interactive Hardware Port & Cable Guide",
      tool-desc: "Explore visual pinouts, speeds, and length limits for every modern PC port live:",
      qr-img: "/public/images/notes/qr-tool-port-reference.svg",
      tool-url: "http://localhost:5173/tools/port-reference"
    )
  ]
)
