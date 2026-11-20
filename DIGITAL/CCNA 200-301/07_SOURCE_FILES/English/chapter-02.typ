#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 02 · PHYSICAL LAYER & CABLING STANDARDS]
= Chapter 2: Cabling Standards, Hardware Ports & Media

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Physical Layer transmission media, copper UTP twisted pair categories, T568A vs T568B termination pinouts, Straight-Through vs Crossover pinout math, Single-Mode vs Multi-Mode fiber optics, transceivers (SFP, SFP+, QSFP28), console ports, and collision vs broadcast domains.
]

#v(2pt)

== 2.1 Copper Transmission Media & Twisted Pair Physics
Copper cabling remains the backbone of enterprise campus access layers. Unshielded Twisted Pair (UTP) cancels Electromagnetic Interference (EMI) and radio frequency interference (RFI) via #hl[differential signaling across tightly twisted wire pairs].
- *Twisting Principle:* Current flowing through a wire generates an electromagnetic field. Twisting adjacent wires causes equal and opposite fields to cancel each other, mitigating crosstalk (NEXT - Near-End Crosstalk).
- *Attenuation & Velocity of Propagation:* High-frequency signals weaken as distance increases. Maximum channel link distance for certified Ethernet copper runs is strictly #hl[100 meters (90m solid horizontal run + 10m stranded patch cords)].

#v(2pt)

== 2.2 Ethernet Copper Standards & Bandwidth Ratings
#table(
  columns: (1fr, 1.2fr, 1.1fr, 2.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Standard*], [*Maximum Speed*], [*Frequency Bandwidth*], [*Enterprise Application & Characteristics*]),
  [Cat5e], [1,000 Mbps (1 Gbps)], [100 MHz], [1000BASE-T access layer standard. Uses all 4 wire pairs for full-duplex transmission.],
  [Cat6], [10 Gbps (up to 55m)], [250 MHz], [10GBASE-T support up to 55 meters; features internal longitudinal plastic spline separator.],
  [Cat6a], [10 Gbps (full 100m)], [500 MHz], [Eliminates Alien Crosstalk (ANEXT); primary standard for modern 802.11ax/Wi-Fi 7 APs.],
  [Cat8], [25 / 40 Gbps (30m)], [2,000 MHz (2 GHz)], [Shielded S/FTP datacenter Top-of-Rack (ToR) server switch interconnects only.]
)

#v(2pt)

== 2.3 TIA/EIA-568A vs TIA/EIA-568B Pinout Standards
Ethernet modular 8P8C (RJ45) terminations adhere to two standardized color codes:
- *T568A Pinout (1-8):* 1: White/Green, 2: Green, 3: White/Orange, 4: Blue, 5: White/Blue, 6: Orange, 7: White/Brown, 8: Brown.
- *T568B Pinout (1-8):* 1: White/Orange, 2: Orange, 3: White/Green, 4: Blue, 5: White/Blue, 6: Green, 7: White/Brown, 8: Brown.
- *Straight-Through Cable:* Both ends terminate with the #hl[same pinout] (A-to-A or B-to-B). Connects disparate Layer devices (PC to Switch, Router to Switch).
- *Crossover Cable:* One end terminates in T568A, the other in T568B (swapping pins 1/2 with 3/6). Connects identical Layer devices (Switch to Switch, Router to PC, Router to Router). Modern NICs feature *Auto-MDIX* to automatically detect and correct pinouts.

#pagebreak()

== 2.4 Optical Fiber Physics: Single-Mode vs Multi-Mode Fiber
When transmission distances exceed 100 meters or enterprise noise levels are severe, optical fiber is required:
- *Core Physics:* Light propagates through a glass silica core via #hl[Total Internal Reflection (TIR)], bounded by cladding with a lower refractive index.
- *Single-Mode Fiber (SMF):* Extremely thin core (9 $mu$m). Emits a single ray path via laser diode (1310nm / 1550nm). Negligible modal dispersion, enabling spans of #hl[10 km to 80+ km]. Standard for campus backbones and telco WANs (Yellow jacket).
- *Multi-Mode Fiber (MMF):* Wider core (50 $mu$m / 62.5 $mu$m). Light bounces across multiple ray paths via VCSEL LEDs (850nm). Susceptible to modal dispersion; distance limited to #hl[300m to 550m] (Aqua/Orange jacket).

#v(2pt)

== 2.5 Optical Transceiver Modules & Form Factors
#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Transceiver*], [*Max Throughput*], [*Connector Type*], [*Deployment Environment*]),
  [SFP (Mini-GBIC)], [1 Gbps], [Duplex LC], [Legacy 1000BASE-SX/LX campus aggregation links.],
  [SFP+], [10 Gbps], [Duplex LC], [Modern 10GBASE-SR/LR distribution uplinks and server NICs.],
  [SFP28], [25 Gbps], [Duplex LC], [Next-generation datacenter Leaf-to-Server connections.],
  [QSFP28], [100 Gbps], [MPO / Duplex LC], [Spine-to-Leaf 100G optical datacenter backbones.]
)

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/fiber-optic-duplex-lc.jpg",
  caption: "Figure 2.1: Duplex LC Optical Fiber connector with ceramic ferrule for high-speed SFP+ uplinks.",
  height: 52pt
)

#v(2pt)

== 2.6 Collision Domains vs Broadcast Domains
Understanding Layer 1 and Layer 2 boundary physics is foundational for network architecture:
1. *Collision Domain:* A physical network segment where data frames can collide if two endpoints transmit simultaneously.
   - *Legacy Hubs:* A hub is a Layer 1 multiport repeater; all ports share #hl[one single collision domain] (Half-Duplex CSMA/CD).
   - *Modern Switches:* A Layer 2 switch micro-segments traffic; #hl[each switch port is an independent collision domain] operating in Full-Duplex.
2. *Broadcast Domain:* A logical segment bounded by Layer 3 devices where a Layer 2 broadcast frame (`FFFF.FFFF.FFFF`) is forwarded.
   - Switches flood broadcasts out all ports within the same VLAN; an unsegmented switch is #hl[one single broadcast domain].
   - *Routers block Layer 2 broadcasts; each router interface terminates and bounds a broadcast domain*.

#pagebreak()

== 2.7 Console Cables & Out-of-Band Management Hardware
When a brand new Cisco router or switch is delivered from the factory without an IP address, *Out-of-Band (OOB)* management is required:
- *Rollover Console Cable (RJ45 to DB9 / USB):* Pin 1 connects to Pin 8, Pin 2 to Pin 7, reversing all pins. Connects laptop COM port to the Cisco RJ45 CONSOLE port.
- *USB Console Ports (Mini-B / Type-C):* Modern Cisco Catalyst 9000 switches feature integrated mini-USB or Type-C console ports requiring the Silicon Labs CP210x serial driver.
- *Serial Terminal Settings:* Baud Rate: #hl[9600 bps], Data Bits: 8, Parity: None, Stop Bits: 1, Flow Control: None (abbreviated *9600-8-N-1*).

#v(2pt)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Device Type*], [*OSI Operating Layer*], [*Collision Domains*], [*Broadcast Domains*]),
  [Hub / Repeater], [Layer 1 (Physical)], [1 (Shared across all ports)], [1 (All ports shared)],
  [Bridge], [Layer 2 (Data Link)], [1 per port], [1 (Shared across bridge)],
  [Switch], [Layer 2 (Data Link)], [#hl[1 per port (Full Duplex)]], [1 per VLAN (Switches flood broadcasts)],
  [Router], [Layer 3 (Network)], [1 per port], [#hl[1 per port (Routers break broadcasts)]]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "CSMA/CD Mechanism (Half Duplex)")[
      Carrier Sense Multiple Access with Collision Detection:      1. *Listen before Talk:* Host senses carrier voltage.      2. *Contention:* If wire idle, host transmits frame.      3. *Collision Detect:* If simultaneous transmit occurs, jam signal emitted; hosts wait random truncated binary exponential backoff time. Full-Duplex disables CSMA/CD.
    ]
  ],
  [
    #concept-box(title: "Fiber LC Cleaning & Eye Safety Warning")[
      Always inspect optical connectors with a fiberscope before insertion; microscopic dust blocks laser photons and cracks ferrule faces.      #text(fill: rtech-rose, weight: "bold")[NEVER LOOK DIRECTLY INTO AN ACTIVE FIBER PORT!] Invisible infrared laser emissions (1310/1550nm) cause irreversible retinal thermal burns.
    ]
  ]
)

#v(2pt)

== 2.8 Common Physical Layer Troubleshooting Commands
To diagnose physical layer faults on Cisco IOS devices:
- `show interfaces status` — Displays port speed, duplex, duplex mismatch errors, and SFP transceiver presence.
- `show interfaces [interface] | include CRC` — CRC errors indicate faulty copper crimps, damaged patch panels, or electromagnetic noise.
- `show controllers [interface]` — Identifies connected cable type (DTE vs DCE on legacy serial cables).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why does Single-Mode fiber transmit much further than Multi-Mode fiber?", a: "Single-Mode fiber has an ultra-narrow core (9um) that permits only a single wavelength path, eliminating modal dispersion. Multi-Mode fiber has a wide core where multiple light rays reflect at different angles, creating modal distortion over distance.")
#faq-item(q: "What causes a duplex mismatch and what are the symptoms?", a: "A duplex mismatch occurs when one port is set to Full-Duplex and the other to Half-Duplex (often due to failed autonegotiation). Symptoms include severe packet loss, late collisions, and degraded throughput.")
#faq-item(q: "What is the certified maximum distance for Category 6 copper cable at 10 Gbps?", a: "Cat6 supports 10 Gbps up to 55 meters in standard environments (37 meters in high-crosstalk bundles). Cat6a is required for full 100-meter 10GBASE-T runs.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "State the standardized terminal serial port configuration for Cisco console connections.", ans: "9600 Baud, 8 Data Bits, No Parity, 1 Stop Bit, No Flow Control (9600-8-N-1).")
#short-q(num: 2, q: "How many collision domains does an unmanaged 24-port Gigabit Ethernet switch create?", ans: "24 collision domains (one per active full-duplex port).")
#short-q(num: 3, q: "Which TIA/EIA pinout standard starts with White/Orange and Orange on pins 1 and 2?", ans: "TIA/EIA-568B.")
#short-q(num: 4, q: "What metric does an optical time-domain reflectometer (OTDR) measure?", ans: "Fiber link attenuation, reflectance, fusion splice loss, and exact distance to physical breaks.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which device breaks both collision domains and broadcast domains on every physical interface?", a: "Layer 2 Switch", b: "Ethernet Hub", c: "Network Router", d: "Wireless Access Point", ans: "C", expl: "Routers terminate Layer 2 broadcast domains and provide dedicated full-duplex collision domains per interface.")
#mcq(num: 2, q: "What color jacket conventionally identifies Single-Mode optical fiber patch cords?", a: "Aqua (50/125)", b: "Orange (62.5/125)", c: "Yellow (9/125)", d: "Violet (OM4)", ans: "C", expl: "Single-Mode fiber (OS1/OS2) is standardized with a bright yellow outer PVC/LSZH jacket.")
#mcq(num: 3, q: "What type of cable connects a Cisco router Gigabit interface directly to a laptop Ethernet port without Auto-MDIX?", a: "Straight-Through Cable", b: "Crossover Cable", c: "Rollover Cable", d: "Null Modem Cable", ans: "B", expl: "Router NICs and PC NICs transmit on pins 1/2 and receive on pins 3/6; a Crossover cable is required to align TX to RX.")
#mcq(num: 4, q: "Which optical transceiver form factor supports 100 Gbps Ethernet throughput using 4 parallel 25G channels?", a: "SFP", b: "SFP+", c: "XFP", d: "QSFP28", ans: "D", expl: "Quad Small Form-factor Pluggable 28 (QSFP28) aggregates four 25 Gbps electrical lanes to deliver 100 Gbps.")
#mcq(num: 5, q: "What symptom on a Cisco switch interface indicates that a copper cable is receiving excessive noise or faulty crimping?", a: "Input buffer drops", b: "Increasing CRC errors", c: "Gi0/1 line protocol down (disabled)", d: "High CPU utilization", ans: "B", expl: "Cyclic Redundancy Check (CRC) errors indicate corrupted frame check sequences (FCS) caused by physical noise or bad crimps.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The 100-Meter Physics Wall")[
      Ethernet's 100m limit is governed by the round-trip slot time in CSMA/CD to guarantee collision detection before transmission finishes!
    ]
  ],
  [
    #tech-spotlight-box(title: "Co-Packaged Optics (CPO)")[
      Modern 800G/1.6T AI switches mount lasers directly onto the silicon substrate next to the ASIC die to eliminate copper trace signal losses.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
