#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 02 · PHYSICAL MEDIA & CABLING STANDARDS]
= Chapter 2: Cabling Standards, Hardware Ports & Media

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Physical Layer transmission media, copper UTP twisted pair categories, T568A vs T568B termination pinouts, Straight-Through vs Crossover pinout math, Single-Mode vs Multi-Mode optical fiber, transceivers, console connections, and collision vs broadcast domains.
]

#v(2pt)

== 2.1 Copper Transmission Media & Twisted Pair Physics
Copper cabling remains the backbone of enterprise campus access layers. Unshielded Twisted Pair (UTP) cancels Electromagnetic Interference (EMI) and radio frequency interference (RFI) via #hl[differential signaling across tightly twisted wire pairs]:
- *Twisting Principle:* Current flowing through a wire generates an electromagnetic field. Twisting adjacent wires causes equal and opposite fields to cancel each other, mitigating Near-End Crosstalk (NEXT).
- *Channel Link Distance:* Maximum certified Ethernet copper channel distance is strictly #hl[100 meters (90m solid horizontal run + 10m stranded patch cords)].

#v(2pt)

== 2.2 Ethernet Copper Standards & Bandwidth Ratings
#table(
  columns: (1fr, 1.2fr, 1.1fr, 2.7fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/rj45-connector-cat6.jpg", width: 92%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 2.1: Precision Cat6 RJ45 8P8C Connector.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/fiber-optic-duplex-lc.jpg", width: 92%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[Figure 2.2: Duplex LC Optical Fiber Termination.]
  ]
)

#v(2pt)

== 2.5 Optical Transceiver Modules & Form Factors
#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*Transceiver*], [*Max Throughput*], [*Connector Type*], [*Deployment Environment*]),
  [SFP (Mini-GBIC)], [1 Gbps], [Duplex LC], [Legacy 1000BASE-SX/LX campus aggregation links.],
  [SFP+], [10 Gbps], [Duplex LC], [Modern 10GBASE-SR/LR distribution uplinks and server NICs.],
  [SFP28], [25 Gbps], [Duplex LC], [Next-generation datacenter Leaf-to-Server connections.],
  [QSFP28], [100 Gbps], [MPO / Duplex LC], [Spine-to-Leaf 100G optical datacenter backbones.]
)

#v(2pt)

== 2.6 Console Ports & Collision vs Broadcast Domains
- *Console Ports:* Out-of-band management access. Cisco routers provide RJ45 rollover console ports (9600 baud, 8 data bits, no parity, 1 stop bit, no flow control: 9600-8-N-1) and modern USB Type-B / Type-C console interfaces.
- *Collision Domain:* A physical network segment where packets can collide. Legacy hubs formed a single collision domain. Every switch port creates a #hl[separate collision domain] operating in full duplex.
- *Broadcast Domain:* The scope across which a broadcast frame (e.g., ARP, DHCP) propagates. Switches forward broadcasts across all ports in the same VLAN. Routers #hl[break broadcast domains] at Layer 3.

#pagebreak()

== Student Technical FAQs
#faq-box("Why does Single-Mode fiber transmit so much farther than Multi-Mode fiber?", "Single-Mode fiber has a microscopic 9-micron core that permits only a single ray of laser light to travel straight down the center. Multi-Mode fiber has a wider 50-micron core where light bounces at multiple angles, causing modal dispersion that degrades the signal over distance.")
#faq-box("Does Auto-MDIX make crossover cables obsolete in modern production?", "Yes. Auto-MDIX automatically senses the required transmit/receive pinout on modern NICs and switch ports. However, crossover pinout theory remains a critical CCNA exam requirement.")
#faq-box("How many broadcast domains exist on a 24-port switch with default configuration?", "Exactly one. By default, all 24 ports belong to VLAN 1. Creating separate VLANs is required to segment the switch into multiple broadcast domains.")

#v(2pt)

== Short-Answer Technical Review
1. *State the maximum channel link distance for certified Cat6 copper Ethernet:* 100 meters (90 meters permanent horizontal solid link + 10 meters patch cords).
2. *Identify the pins swapped when converting a T568A cable to T568B:* Pins 1 and 2 swap with pins 3 and 6 (Green pair swaps with Orange pair).
3. *Name the standard transceiver form factor used for 10 Gigabit Ethernet uplinks:* SFP+ (Enhanced Small Form-Factor Pluggable).
4. *Distinguish how switches and routers affect collision and broadcast domains:* A switch breaks collision domains per port but preserves broadcast domains; a router breaks both collision and broadcast domains per interface.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "An engineer is terminating an RJ45 connector using T568B. Which color wire must be placed into Pin 1?",
  ("White/Green", "White/Orange", "Solid Orange", "White/Blue"),
  1,
  "In the T568B standard, Pin 1 is White/Orange and Pin 2 is Orange."
)

#mcq-item(
  "Which optical fiber connector features a small form-factor push-pull latching mechanism commonly used with SFP/SFP+ transceivers?",
  ("SC Connector", "ST Connector", "Duplex LC Connector", "BNC Connector"),
  2,
  "The Duplex LC (Lucent Connector) is the universal standard for SFP, SFP+, and SFP28 optical modules."
)

#mcq-item(
  "A network has a 48-port Layer 2 switch with 3 VLANs configured: VLAN 10 (16 ports), VLAN 20 (16 ports), and VLAN 30 (16 ports). How many broadcast domains exist?",
  ("1", "3", "48", "16"),
  1,
  "Each configured VLAN constitutes a separate Layer 2 broadcast domain. Therefore, 3 VLANs create exactly 3 broadcast domains."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? Why Copper Wire Pairs Have Different Twist Rates", "Inside a high-grade Cat6a cable, each of the four wire pairs is twisted at a slightly different twist rate (turns per inch). This mathematical offset prevents electromagnetic coupling between adjacent pairs inside the same outer jacket.")

#spotlight-box("2027 Tech Spotlight: Co-Packaged Optics (CPO)", "At 800 Gbps and 1.6 Tbps datacenter speeds, transmitting electrical signals across circuit boards wastes excessive power. Co-Packaged Optics mounts the optical laser engine directly onto the silicon switch ASIC substrate, slashing energy consumption by 30%.")
