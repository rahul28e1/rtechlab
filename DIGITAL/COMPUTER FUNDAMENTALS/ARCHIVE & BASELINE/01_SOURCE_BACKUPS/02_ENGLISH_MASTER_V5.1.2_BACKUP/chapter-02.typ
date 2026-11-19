#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-cyan)[CHAPTER 02 · HARDWARE INTERFACES & PERIPHERALS]
= Chapter 2: Input/Output Devices, Peripherals & Interface Standards

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Input/output architectures: mechanical switches, optical CPI vs DPI, biometric sensors, modern display panel technologies, electrophotographic printing, ADC/DAC conversion, and high-speed bus interfaces (USB4, Thunderbolt 5, PCIe 6.0).
]

#v(2pt)

== 2.1 Input Device Engineering: Keyboards, Pointing & Imaging Subsystems
Input devices convert human physical actions or environmental phenomena into digital binary words:
- *Mechanical Keyboard Switches:* Membrane keyboards utilize conductive rubber domes that actuate only on bottoming out ($approx 4.0$ mm travel). Mechanical keyboards feature individual physical switch mechanisms per keycap (e.g., Cherry MX / Gateron): #hl[Linear switches] (Red: smooth, silent actuation at 2.0 mm, 45 cN force), #hl[Tactile switches] (Brown: tactile bump feedback at actuation), and #hl[Clicky switches] (Blue: audible acoustic click with tactile reset). Microcontroller firmware applies debouncing algorithms ($approx 5$ ms) to eliminate contact bounce noise and supports N-Key Rollover (NKRO) via diode matrices preventing ghosting.
- *Optical Mice & Motion Sensing:* Optical sensors photograph mousepad surfaces at up to 20,000 frames per second using high-speed DSPs. Sensitivity is calibrated in #hl[Counts Per Inch (CPI)], representing the number of discrete position reports sent per linear inch of travel (often termed DPI in commercial marketing). Modern USB polling rates reach 1,000 Hz (1 ms polling interval) to 8,000 Hz (0.125 ms interval), reducing USB interface delay. However, total input-to-display latency also includes mechanical switch debounce (~5 ms), microcontroller firmware processing, OS interrupt scheduling, and display panel scan-out.
- *Scanners & Document Imaging:* Flatbed scanners utilize Charge-Coupled Device (CCD) arrays with optical reduction lenses or Contact Image Sensors (CIS) with RGB LED illumination. Optical Character Recognition (OCR) algorithms apply edge-detection, binarization, and neural pattern classifiers to transform scanned raster bitmaps into searchable ASCII/Unicode text.

#v(2pt)

#photo-card( "../03_VISUAL_ASSETS/authentic-hardware-photographs/computer-input-devices.jpg",
  caption: "Figure 2.1: Professional mechanical keyboard switch mechanism and high-CPI optical gaming mouse.",
  height: 50pt
)

#v(2pt)

== 2.2 Biometric Sensing Technologies
Biometric authentication captures unique physiological structures, requiring physical sensing mechanisms:
#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Biometric Modality*], [*Physical Sensing Technology*], [*Engineering Implementation & Spoofing Resistance*]),
  [Optical Fingerprint], [Photodiode array with TIR prism], [Illuminates finger with bright LEDs and captures 2D shadow patterns of friction ridges. Susceptible to 2D photographic silicone spoofs.],
  [Capacitive Fingerprint], [Silicon micro-capacitor pixel array], [Measures minute electrical capacitance differences between conductive skin ridges ($approx 10$ pF) and air valleys. Higher security than basic optical.],
  [Ultrasonic Fingerprint], [Piezoelectric acoustic pulse-echo], [Transmits 3D high-frequency ultrasound pulses penetrating epidermis to map subcutaneous pore depth. Operates through wet fingers; high spoof resistance compliant with ISO/IEC 30107 PAD standards.],
  [Facial Recognition], [2D RGB Camera vs 3D Structured Light], [Standard 2D matches facial landmarks on camera bitmaps (easily spoofed). 3D systems (e.g., Apple Face ID) project 30,000 infrared dots to construct a true mathematical 3D depth mesh.]
)

#pagebreak()

== 2.3 Display Panel Architectures & Visual Output
Computer monitors translate GPU framebuffers into visible light through electronic pixel matrices:
#table(
  columns: (1.1fr, 1.3fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Display Technology*], [*Light Generation Method*], [*Color Accuracy, Contrast & Response Characteristics*]),
  [In-Plane Switching (IPS)], [Edge/Direct LED backlight with parallel liquid crystals], [Exceptional color consistency and wide 178° viewing angles. Moderate contrast ratio ($1000:1$); standard for professional graphic design.],
  [Vertical Alignment (VA)], [Vertical liquid crystal alignment], [Deeper native black levels and high static contrast ($3000:1$ to $4000:1$). Narrower viewing angles and susceptibility to dark-level pixel smearing.],
  [Mini-LED Backlight], [Thousands of microscopic blue LEDs], [Employs Full-Array Local Dimming (FALD) across hundreds to thousands of discrete zones, achieving peak brightness $>1,500$ nits and HDR1000 certification.],
  [OLED (Organic LED)], [Self-emissive organic sub-pixels], [Zero backlight bleed; individual sub-pixels switch off completely for infinite static contrast ratio ($infinity:1$). Sub-millisecond response (under 0.1 ms); potential burn-in risk under static UI elements.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "Display Refresh Rates & Color Spaces")[
      - *Refresh Rates:* Office displays (60–75 Hz, 16.6 ms frame budget); Esports monitors (144 Hz to 540 Hz, under 1.85 ms budget) for blur-free motion tracking.
      - *Color Gamuts:* sRGB (standard web content); DCI-P3 (cinema & HDR mastering); Adobe RGB (print reproduction).
    ]
  ],
  [
    #concept-box(title: "Laser vs Inkjet Printing Physics")[
      - *Laser Printing:* Electrophotographic xerography; semiconductor laser writes electrostatic charge pattern onto an Organic Photoconductor (OPC) drum; toner powder is fused to paper via heated pressure rollers ($approx 200°C$).
      - *Inkjet Printing:* Piezoelectric crystals or thermal resistors vaporize liquid ink micro-droplets through microscopic nozzle arrays.
    ]
  ]
)

#v(2pt)

== 2.4 Analog-to-Digital (ADC) & Digital-to-Analog (DAC) Conversion
Real-world physical signals (human speech, microphone voltages, temperature) are continuous and analog; digital processors operate strictly on discrete binary states.
- *Analog-to-Digital Converter (ADC):* Samples continuous analog voltage waveforms at discrete time intervals. Governed by the #hl[Nyquist-Shannon Sampling Theorem]: to capture an analog signal faithfully without aliasing distortion, the sampling frequency must exceed twice the highest frequency component ($f_s > 2 f_{max}$). E.g., human hearing spans up to 20 kHz; audio CD standard samples at 44.1 kHz with 16-bit resolution (65,536 quantization levels).
- *Digital-to-Analog Converter (DAC):* Reconstructs smooth continuous voltage waveforms from binary sample streams, passed through low-pass reconstruction filters to drive headphones, speakers, and cathode deflection coils.

#pagebreak()

== 2.5 High-Speed Bus Interfaces, Cable Protocols & Signaling Rates
Physical connector form factors must never be conflated with the underlying data transmission protocols:
#table(
  columns: (1.2fr, 1.3fr, 1fr, 2.5fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Bus Standard*], [*Raw Signaling Rate*], [*Payload Throughput*], [*Encoding Overhead & Operational Features*]),
  [USB 2.0 (HighSpeed)], [480 Mbps], [~40 MB/s], [NRZI encoding with bit-stuffing; half-duplex single differential pair. Standard legacy peripheral interface.],
  [USB 3.2 Gen 2x2], [20 Gbps (dual lane)], [~2.0 GB/s], [128b/132b encoding (3% overhead); dual-lane Type-C cabling. Requires compatible host and SSD controller.],
  [USB4 v2.0], [80 Gbps / 120 Gbps], [~7.5 GB/s to ~11 GB/s], [PAM3 signaling across asymmetric lanes; dynamic protocol tunneling for PCIe 4.0, DisplayPort 2.1, and USB3.],
  [Thunderbolt 4 / 5], [40 Gbps / 120 Gbps], [~3.2 GB/s to ~11 GB/s], [Mandates dual 4K / single 8K display support, 32 Gbps PCIe tunneling, and DMA protection (Intel VT-d IOMMU).],
  [PCIe 5.0 (per x16)], [32 GT/s per lane], [~63 GB/s payload], [128b/130b encoding (1.5% overhead); high-frequency copper traces on server and desktop motherboards.],
  [PCIe 6.0 (per x16)], [64 GT/s per lane], [~121 GB/s payload], [#hl[PAM4 multi-level signaling] (2 bits per baud) with Forward Error Correction (FEC) and fixed-size FLIT packets.]
)

#v(2pt)

#photo-card( "../03_VISUAL_ASSETS/authentic-hardware-photographs/rj45-connector-cat6.jpg",
  caption: "Figure 2.2: Cat6 Gigabit Ethernet cable showing twisted pairs terminating in a gold-plated 8P8C (RJ-45) connector.",
  height: 50pt
)

#v(2pt)

== 2.6 The Type-C Connector Architecture & USB Power Delivery (USB PD 3.1)
The reversible 24-pin USB Type-C connector features symmetrical pinout geometry:
- *High-Speed Signal Pairs:* 4 differential pairs (`TX1+/-`, `RX1+/-`, `TX2+/-`, `RX2+/-`) supporting multi-lane protocols and DisplayPort Alternate Mode.
- *Configuration Channel (CC1/CC2):* Detects cable orientation, negotiates host/device roles (DRP), and negotiates USB Power Delivery contracts.
- *USB Power Delivery 3.1:* Standard 5V USB supplies max 15W. USB PD 3.1 negotiates Extended Power Range (EPR) up to #hl[48 Volts at 5 Amperes (240 Watts)], enabling laptop fast charging, external monitor power, and workstation docking stations over a single cable. Protocols tunneling over Type-C (USB4 v2 at 80/120 Gbps using PAM3 and Thunderbolt 5 at up to 120 Gbps) enforce dynamic bandwidth allocation.

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Does a USB Type-C port always support video output and 100W charging?", a: "No. Type-C is only a physical form factor. Video (DisplayPort Alt Mode) and high wattage (USB PD) require optional silicon controllers explicitly implemented by the manufacturer.")
#faq-item(q: "What is the difference between mouse CPI and monitor DPI?", a: "CPI (Counts Per Inch) measures input hardware sensor sensitivity; DPI (Dots Per Inch) measures output spatial printer or display pixel density.")
#faq-item(q: "Why do OLED monitors have faster pixel response times than IPS LCDs?", a: "OLED pixels emit light organically and switch states electrochemically in under 0.1 ms; LCDs require physical nematic liquid crystals to rotate mechanically.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which mechanical keyboard switch type provides tactile feedback without an audible click?", ans: "Brown tactile switches.")
#short-q(num: 2, q: "What mathematical theorem establishes the minimum sampling rate for analog-to-digital conversion?", ans: "Nyquist-Shannon Sampling Theorem (fs > 2 fmax).")
#short-q(num: 3, q: "What multi-level signaling scheme is utilized by PCIe 6.0 to double bandwidth?", ans: "PAM4 (Pulse Amplitude Modulation 4-Level).")
#short-q(num: 4, q: "What is the maximum power wattage deliverable under the USB PD 3.1 EPR standard?", ans: "240 Watts (48V at 5A).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which biometric fingerprint sensor technology provides the highest resistance to artificial silicone spoofing?", a: "Flatbed Optical", b: "Micro-Capacitive", c: "Piezoelectric Ultrasonic Pulse-Echo", d: "Resistive Touchpad", ans: "C", expl: "Ultrasonic sensors generate 3D acoustic depth profiles penetrating subcutaneous skin layers, defeating flat 2D spoofs.")
#mcq(num: 2, q: "What is the maximum theoretical frame time budget for a 240 Hz esports gaming display?", a: "16.6 ms", b: "8.33 ms", c: "4.16 ms", d: "1.85 ms", ans: "C", expl: "Frame time budget equals 1 / refresh rate: 1 / 240 s = 4.166 milliseconds.")
#mcq(num: 3, q: "Which high-speed bus protocol utilizes PAM4 signaling to achieve 64 GT/s per lane?", a: "USB 2.0", b: "SATA III", c: "PCIe 6.0", d: "DisplayPort 1.4", ans: "C", expl: "PCIe 6.0 adopted 4-level Pulse Amplitude Modulation (PAM4) transmitting 2 bits per electrical baud cycle.")
#mcq(num: 4, q: "What is the primary function of the Configuration Channel (CC) pins in a USB Type-C connector?", a: "Carrying ground return current", b: "Negotiating orientation and USB PD power contracts", c: "Transmitting legacy analog audio", d: "Driving DisplayPort clock strobes", ans: "B", expl: "The CC1/CC2 pins detect plug orientation and handle bi-phase mark BMC communication for USB Power Delivery contracts.")
#mcq(num: 5, q: "In audio engineering, what minimum sampling rate is required to capture frequencies up to 22 kHz without aliasing?", a: "11 kHz", b: "22 kHz", c: "44.1 kHz", d: "96 kHz", ans: "C", expl: "By Nyquist theorem, the sampling rate must exceed 2 x 22 kHz = 44 kHz. Standard CD audio uses 44.1 kHz.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "N-Key Rollover & Anti-Ghosting")[
      Membrane keyboards matrix shared row/column traces causing phantom keypresses ('ghosting'). Mechanical keyboards add a diode to every switch!
    ]
  ],
  [
    #tech-spotlight-box(title: "Co-Packaged Optics (CPO)")[
      As copper interfaces approach physical electrical limits at 100 Gbps, 2027 datacenters are integrating microscopic optical lasers directly onto silicon dies.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
