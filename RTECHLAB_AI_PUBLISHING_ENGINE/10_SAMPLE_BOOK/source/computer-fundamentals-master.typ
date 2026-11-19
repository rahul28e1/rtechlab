#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *
#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/cover-layouts/official-cover.typ": rtech-cover

#show: rtech-book.with(
  title: "Computer Fundamentals",
  subtitle: "The Authoritative Visual Engineering Handbook",
  author: "Rahul Sir & RTechLab Systems Lab",
  edition: "2027 Master Edition",
  subject-code: "RTL-2027-FUND-A4"
)

// =============================================================================
// PAGE 01: OFFICIAL BOOK COVER (FLAGSHIP EDITION)
// =============================================================================
#rtech-cover(
  title: "Computer Fundamentals",
  subtitle: "The Complete Master Guide & Technical Placement Handbook",
  subject-pill: "FOUNDATIONAL ENGINEERING SERIES · 2027 MASTER EDITION",
  author: "Rahul Sir",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  reviewed-by: "RTechLab Academic & Systems Directorate",
  edition: "2027.1 MASTER RELEASE · ₹49 CERTIFIED EDITION",
  logo-path: "/public/brand/rtechlab-logo-transparent.png",
  pillar-1-title: "CORE ARCHITECTURE & SYSTEMS",
  pillar-1-items: (
    "IPO Cycle & Von Neumann 3-Bus Architecture",
    "I/O Transducers, Optical DSPs & Modern Ports",
    "Memory Hierarchy: DDR5, SRAM, L1-L3 & NVMe SSD",
    "CPU Micro-architecture, Registers & Machine Cycle",
    "Number Systems: 2's Complement & Universal Gates"
  ),
  pillar-2-title: "SOFTWARE, NETWORKS & INTERVIEW PREP",
  pillar-2-items: (
    "Operating Systems, Scheduling & 4-Stage C Build",
    "7-Layer OSI Model, TCP Handshake & Subnetting",
    "Cyber Security, Malware Defense & 3-2-1 Backups",
    "Hardware Assembly, Triage & 12 Windows CLI Tools",
    "50 MNC Placement Questions & 30 Viva One-Liners"
  )
)

#pagebreak()

// =============================================================================
// PAGE 02: SYLLABUS BLUEPRINT & 10-CHAPTER MASTER INDEX
// =============================================================================
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[SYLLABUS BLUEPRINT · 2027 CURRICULUM]
= Computer Fundamentals: Master 10-Chapter Curriculum Index

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  A comprehensive, zero-filler foundational textbook designed for university examinations, competitive IT exams (SSC, Banking, GATE, Railway), and MNC technical placement screening (TCS, Infosys, Amazon, Wipro).
]

#v(4pt)

#let toc-row(num: "", title: "", desc: "", pages: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rtech-border,
    fill: white,
    radius: 4pt,
    inset: 4.5pt,
    spacing: 2.5pt,
    [
      #grid(
        columns: (1fr, auto),
        [
          #text(size: 7.5pt, font: "Consolas", weight: "bold", fill: rtech-emerald.darken(10%))[CHAPTER #num]
          #text(size: 8pt, weight: "bold", fill: rtech-navy)[ | #title]\
          #text(size: 7pt, fill: rtech-text.lighten(30%))[#desc]
        ],
        [
          #box(
            fill: rtech-navy.lighten(94%),
            inset: (x: 4pt, y: 1.5pt),
            radius: 3pt,
            text(size: 7pt, font: "Consolas", weight: "bold", fill: rtech-navy)[#pages]
          )
        ]
      )
    ]
  )
}

#toc-row(num: "01", title: "Introduction to Computers & System Architecture", desc: "Definition, characteristics, human body analogy, IPO cycle, Von Neumann 3-bus architecture, 5 generations.", pages: "Pages 03–06")
#toc-row(num: "02", title: "Input & Output (I/O) Hardware Systems & Ports", desc: "Keyboards (Mechanical Cherry MX), optical mouse DSPs, display panels (IPS/OLED), laser print engines, USB4.", pages: "Pages 07–10")
#toc-row(num: "03", title: "Computer Memory & Secondary Storage Hierarchy", desc: "RAM (SRAM 6T vs DRAM 1T1C), DDR5 architecture, Cache levels (L1-L3), HDD mechanics vs PCIe 5.0 NVMe SSDs.", pages: "Pages 11–14")
#toc-row(num: "04", title: "Central Processing Unit (CPU) & Machine Cycle", desc: "ALU, Control Unit, registers (PC, IR, MAR, MBR, AC, Flags), 4-stage machine cycle, P-cores vs E-cores, IPC.", pages: "Pages 15–18")
#toc-row(num: "05", title: "Number Systems, Computer Arithmetic & Logic Gates", desc: "Decimal, Binary, Octal, Hexadecimal conversions, 2's complement subtraction, Universal NAND/NOR, ASCII & UTF-8.", pages: "Pages 19–22")
#toc-row(num: "06", title: "Computer Software, Operating Systems & Translators", desc: "System vs Application software, Process lifecycle, Round Robin scheduling, Virtual memory paging, 4-stage C build.", pages: "Pages 23–26")
#toc-row(num: "07", title: "Computer Networks, OSI Model & Internet Protocols", desc: "PAN/LAN/WAN, 7-layer OSI model, TCP 3-way handshake vs UDP, /26 subnetting math, 8-step web request journey.", pages: "Pages 27–30")
#toc-row(num: "08", title: "Cybersecurity, Malware Taxonomy & Defense Engineering", desc: "CIA triad, Viruses vs Worms vs Trojans vs Ransomware, AES-256 vs RSA, FIDO2 hardware keys, 3-2-1 backup rule.", pages: "Pages 31–34")
#toc-row(num: "09", title: "PC Assembly, Hardware Maintenance & Diagnostic Triage", desc: "8-step PC assembly blueprint, dual-channel RAM slots A2/B2, PSU paperclip test, POST beeps, 12 Windows CLI tools.", pages: "Pages 35–38")
#toc-row(num: "10", title: "Master MNC Technical Interview Bank & Viva-Voce Guide", desc: "50 Top placement questions with senior model answers, 30 rapid-fire viva one-liners, 2027 IT career roadmap.", pages: "Pages 39–45")

#v(4pt)

#concept-box(title: "RTechLab 5-Pillar Pedagogical Standard")[
  Every single chapter in this master edition concludes with #hl[3 Student FAQs], #hl[4 Short-Answer Review Questions with Answers], #hl[5 Verified MCQs with Explanations], #hl[Did You Know? Tech Facts], and a #hl[Direct Level-H QR Code] linking to our live website interactive tools and quizzes!
]

#pagebreak()

// =============================================================================
// CHAPTER INCLUDES (CHAPTERS 01 TO 10)
// =============================================================================
#include "chapters/ch01-intro-architecture.typ"
#pagebreak()

#include "chapters/ch02-io-systems-ports.typ"
#pagebreak()

#include "chapters/ch03-memory-storage-hierarchy.typ"
#pagebreak()

#include "chapters/ch04-cpu-machine-cycle.typ"
#pagebreak()

#include "chapters/ch05-number-systems-boolean-logic.typ"
#pagebreak()

#include "chapters/ch06-software-os-translators.typ"
#pagebreak()

#include "chapters/ch07-networks-internet-protocols.typ"
#pagebreak()

#include "chapters/ch08-cybersecurity-malware-defense.typ"
#pagebreak()

#include "chapters/ch09-pc-assembly-maintenance-triage.typ"
#pagebreak()

#include "chapters/ch10-master-interview-bank-viva.typ"
