// =============================================================================
// RTECHLAB MASTER CURRICULUM BLUEPRINT — ENGLISH V5.1.3
// Page 2: Complete 10-Chapter Syllabus & Examination Architecture
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[CURRICULUM ARCHITECTURE & SYLLABUS BLUEPRINT]
= Computer Fundamentals: Master 10-Chapter Curriculum

#text(size: 8.5pt, fill: rgb("#1E293B").lighten(20%))[
  Comprehensive curriculum mapping for university academics, diploma certifications, technical competitive exams, and software engineering placement interviews. Standardized under the RTechLab 2027 Educational Framework.
]

#v(3pt)

#table(
  columns: (0.7fr, 2.2fr, 0.9fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3.5pt,
  table.header(
    [*Chapter*],
    [*Core Academic Subject*],
    [*Pages*],
    [*High-Yield Technical Competencies & Exam Focus*]
  ),
  [Ch 01], [Computer Foundations & Architecture], [03 – 06], [IPOS cycle, Von Neumann 3-bus vs Harvard, DMA bus exceptions, GIGO vs hardware errors, 5 computing generations.],
  [Ch 02], [Input/Output Systems & Interfaces], [07 – 10], [Cherry MX switches, mouse CPI, ultrasonic biometrics, display panels (IPS/OLED), USB4, Thunderbolt 5, PCIe 6.0 PAM4.],
  [Ch 03], [Memory Hierarchy & Storage Subsystems], [11 – 14], [SRAM vs DRAM, 64ms JEDEC refresh, On-Die vs 72-bit Sideband ECC, NVMe PCIe 5.0 SSDs vs HDDs, IEC prefixes.],
  [Ch 04], [CPU Microarchitecture & AI Computing], [15 – 18], [ALU/CU, special registers, 4-stage machine cycle, pipeline hazards, CPU vs GPU vs NPU, Copilot+ 40+ TOPS.],
  [Ch 05], [Number Systems & Digital Logic], [19 – 22], [Positional radix conversions (2, 8, 10, 16), 2's Complement math, Boolean algebra axioms, Universal NAND/NOR gates.],
  [Ch 06], [Software Architecture & OS Kernels], [23 – 26], [System vs App software, Monolithic vs Microkernels, CPU scheduling (RR, SJF), Paging/Thrashing, Virtual Machines vs Docker.],
  [Ch 07], [Computer Networks & Internet Protocols], [27 – 30], [OSI 7-Layer vs TCP/IP, TCP 3-way handshake vs UDP streaming, CIDR subnetting, DNS resolution, Wi-Fi 7 MLO modes.],
  [Ch 08], [Cybersecurity & Modern Cryptography], [31 – 34], [CIA Triad, Malware taxonomy, Zero Trust (NIST SP 800-207), FIDO2 Passkeys origin-binding, NIST PQC (FIPS 203/204/205).],
  [Ch 09], [PC Assembly, Maintenance & Triage], [35 – 38], [8-stage ESD build, A2/B2 daisy-chain priority, 99% IPA care, swollen battery safety, POST triage, Windows CLI & PowerShell.],
  [Ch 10], [Master Interview Bank, Viva & Roadmap], [39 – 45], [50 Formal placement Q&As across 9 domains, 30 Rapid-fire viva one-liners, 2027 tech outlook, career roadmap & sign-off.]
)

#v(3pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      width: 100%,
      stroke: (left: 2.5pt + rgb("#0284C7")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 6pt, y: 4pt),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[STUDY METHODOLOGY & ASSESSMENT STRUCTURE]\
        #v(1.5pt)
        #text(size: 7pt, fill: rgb("#1E293B"))[
          Each chapter follows a structured 4-page pedagogical sequence: foundational theory and real photography on Pages 1–3, concluded by a rigorous evaluation dashboard on Page 4 featuring *3 Student FAQs*, *4 Short-Answer Review Questions*, *5 High-Yield MCQs*, *Did You Know facts*, and a *2027 Tech Spotlight*.
        ]
      ]
    )
  ],
  [
    #block(
      width: 100%,
      stroke: (left: 2.5pt + rgb("#4F46E5")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 6pt, y: 4pt),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#4F46E5"))[RTECHLAB OFFICIAL AUTHOR & CURRICULUM IMPRINT]\
        #v(1.5pt)
        #text(size: 7pt, fill: rgb("#1E293B"))[
          *Author:* Rahul Patel (Founder & Chief Technology Architect, RTechLab)\
          *Curriculum Framework:* RTechLab Standard 2027 · *Subject Code:* `RTL-2027-FUND-V5.1.3`\
          *Target Audits:* BCA, B.Tech CS/IT, Polytechnic, CompTIA A+/Network+, SSC & Banking IT.
        ]
      ]
    )
  ]
)
