import React, { useState } from 'react';
import { Link } from 'react-router';

export default function NotesPrintPage() {
  const [printTheme, setPrintTheme] = useState('dark'); // 'dark' (Pitch Black Apple aesthetic) or 'light' (Ink-saving white for paper print)

  return (
    <div className={`min-h-screen ${printTheme === 'dark' ? 'bg-[#0A0A0C] text-[#EDEDED]' : 'bg-[#F5F5F7] text-[#1D1D1F]'} print:bg-white print:text-black transition-colors duration-200`}>
      
      {/* ── SCREEN UTILITY BAR (Hidden when printing) ─────────────────── */}
      <header className="sticky top-0 z-50 print:hidden backdrop-blur-xl bg-black/80 border-b border-white/[0.08] px-4 py-3">
        <div className="max-w-5xl mx-auto flex flex-wrap items-center justify-between gap-4">
          <div className="flex items-center gap-3">
            <Link
              to="/notes"
              className="text-xs font-mono text-[#86868B] hover:text-white flex items-center gap-1.5 transition-colors"
            >
              <span>←</span>
              <span>Back to Store</span>
            </Link>
            <span className="text-white/20">|</span>
            <div className="flex items-center gap-2">
              <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
              <span className="text-xs font-mono text-white font-bold">
                RTechLab A4 Print Engine (2027 Industrial Master Edition)
              </span>
            </div>
          </div>

          <div className="flex items-center gap-2 sm:gap-3">
            {/* Theme Toggle */}
            <div className="flex items-center bg-white/[0.06] p-1 rounded-full border border-white/[0.1] text-xs font-mono">
              <button
                onClick={() => setPrintTheme('dark')}
                className={`px-3 py-1 rounded-full transition-all ${
                  printTheme === 'dark' ? 'bg-white text-black font-bold shadow' : 'text-[#86868B] hover:text-white'
                }`}
              >
                Dark (Screen/OLED)
              </button>
              <button
                onClick={() => setPrintTheme('light')}
                className={`px-3 py-1 rounded-full transition-all ${
                  printTheme === 'light' ? 'bg-white text-black font-bold shadow' : 'text-[#86868B] hover:text-white'
                }`}
              >
                Light (Paper Print)
              </button>
            </div>

            {/* 1-Click Direct Download PDF Button */}
            <a
              href="/downloads/RTechLab-Computer-Hardware-2027-Master-Edition.pdf"
              download="RTechLab-Computer-Hardware-2027-Master-Edition.pdf"
              className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-cyan-400 hover:bg-cyan-300 text-black text-xs font-black transition-all shadow-lg shadow-cyan-500/20 active:scale-95"
            >
              <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
              </svg>
              <span>Instant Download PDF (1.6 MB)</span>
            </a>

            {/* Direct Print Button */}
            <button
              onClick={() => window.print()}
              className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-emerald-500 hover:bg-emerald-400 text-black text-xs font-bold transition-all shadow-lg shadow-emerald-500/20 active:scale-95"
            >
              <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
              </svg>
              <span>Print / Save as PDF</span>
            </button>
          </div>
        </div>
      </header>

      {/* ── PRINT STYLES INJECTION ─────────────────────────────────────── */}
      <style>{`
        @page {
          size: A4 portrait;
          margin: 0;
        }
        @media print {
          html, body {
            margin: 0 !important;
            padding: 0 !important;
            background: #ffffff !important;
            color: #000000 !important;
            -webkit-print-color-adjust: exact !important;
            print-color-adjust: exact !important;
          }
          .a4-page {
            box-shadow: none !important;
            margin: 0 !important;
            border: none !important;
            page-break-after: always !important;
            break-after: page !important;
            height: 297mm !important;
            max-height: 297mm !important;
            overflow: hidden !important;
          }
        }
      `}</style>

      {/* ── A4 PAGES CONTAINER ─────────────────────────────────────────── */}
      <main className="py-8 print:py-0 flex flex-col items-center gap-8 print:gap-0">
        
        {/* =================================================================
            PAGE 1: OFFICIAL BOOK COVER (2027 INDUSTRIAL MASTER EDITION)
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Industrial Standard Publication</span>
            <span>Enterprise IT Systems Engineering Standard</span>
          </div>

          {/* Hero Content */}
          <div className="my-auto space-y-6">
            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 font-mono text-xs font-semibold">
              <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
              <span>OFFICIAL PUBLICATION · 2027 INDUSTRIAL EDITION</span>
            </div>

            <div className="space-y-3">
              <h1 className="text-4xl sm:text-5xl font-black tracking-tight leading-tight">
                Computer Hardware &amp;<br />System Architecture
              </h1>
              <p className="text-xl sm:text-2xl font-bold bg-gradient-to-r from-emerald-400 via-cyan-400 to-blue-400 bg-clip-text text-transparent">
                The Visual Engineering Master Handbook (2027 Standard)
              </p>
            </div>

            <p className="text-sm opacity-80 max-w-lg leading-relaxed">
              Designed for Desktop Support Engineers, Systems Technicians, and Cloud Administrators. High-speed bus physics, physical macro inspection schematics, diagnostic decision trees, and 100+ company interview questions.
            </p>

            {/* Author Credit Box */}
            <div className="p-4 rounded-2xl border border-current/15 bg-current/[0.03] space-y-2">
              <div className="text-[10px] font-mono opacity-60 uppercase tracking-widest">
                Primary Author &amp; Engineering Directorate
              </div>
              <div className="flex items-center justify-between">
                <div>
                  <div className="font-black text-base text-emerald-400">Rahul Sir</div>
                  <div className="text-xs opacity-75">Founder &amp; Chief Technology Architect, RTechLab</div>
                </div>
                <div className="text-right font-mono text-xs opacity-60">
                  <div>Reviewed By</div>
                  <div className="font-bold text-current">RTechLab Systems Lab</div>
                </div>
              </div>
            </div>

            {/* 2027 Technical Architecture Pillars (Proof It's NOT Outdated!) */}
            <div className="grid grid-cols-2 gap-3 pt-2 text-xs font-mono">
              <div className="p-3 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="text-emerald-400 font-bold mb-1">⚡ SILICON &amp; BUS ARCHITECTURE</div>
                <div className="opacity-75 text-[11px] leading-relaxed">
                  • Intel LGA 1851/1700 &amp; AMD AM5<br />
                  • DDR5 6400+ MT/s &amp; On-Die PMIC<br />
                  • PCIe 5.0 NVMe SSDs (14,000 MB/s)
                </div>
              </div>
              <div className="p-3 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="text-cyan-400 font-bold mb-1">⚡ POWER &amp; FIELD DIAGNOSTICS</div>
                <div className="opacity-75 text-[11px] leading-relaxed">
                  • ATX 3.1 &amp; 12V-2x6 GPU Cables<br />
                  • 16+1+1 DrMOS VRM Power Stages<br />
                  • 4-Step Hardware Fault Tree
                </div>
              </div>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 01 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 2: MASTER TABLE OF CONTENTS (INDUSTRIAL 130-PAGE INDEX)
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Industrial Master Notes</span>
            <span>Table of Contents (Full 130-Page Volume)</span>
          </div>

          {/* TOC Content */}
          <div className="my-auto space-y-4">
            <div>
              <div className="text-[10px] font-mono text-emerald-400 uppercase tracking-widest font-bold">
                SYLLABUS BLUEPRINT · 2027 STANDARD
              </div>
              <h2 className="text-2xl font-black tracking-tight">Master Module Index</h2>
              <p className="text-xs opacity-75">
                Every chapter maps directly to enterprise technical support, systems engineering, and IT admin interview rounds.
              </p>
            </div>

            <div className="space-y-2 text-xs font-mono">
              {[
                {
                  mod: 'MODULE 01',
                  title: 'Silicon Physics & CPU Sockets (LGA 1851/1700 vs AM5)',
                  pages: 'Pages 03–18',
                  desc: 'PGA vs LGA pin mechanics, mechanical pencil bent pin triage, and thermal conductivity traps.',
                },
                {
                  mod: 'MODULE 02',
                  title: 'Motherboard VRM Power Delivery & Phase Switching',
                  pages: 'Pages 19–36',
                  desc: '16+1+1 DrMOS 90A SPS stages, PWM switching at 800 kHz, and VRM thermal throttling isolation.',
                },
                {
                  mod: 'MODULE 03',
                  title: 'High-Speed Memory Bus (DDR4 vs DDR5 SDRAM)',
                  pages: 'Pages 37–54',
                  desc: 'Dual 32-bit subchannels, on-die PMIC regulation, on-die ECC, and daisy-chain slot 2 & 4 rules.',
                },
                {
                  mod: 'MODULE 04',
                  title: 'Modern Storage Architecture (PCIe 5.0 NVMe vs SATA)',
                  pages: 'Pages 55–72',
                  desc: 'PCIe 5.0 x4 M.2 (14,000 MB/s), 3D TLC/QLC NAND, DirectStorage, and SMART health triage.',
                },
                {
                  mod: 'MODULE 05',
                  title: 'Power Supply Architecture (ATX 3.1 & 12V-2x6)',
                  pages: 'Pages 73–88',
                  desc: '24-pin Green PS_ON# paperclip test, 12V-2x6 GPU meltdown fix, and Power Good signal mechanics.',
                },
                {
                  mod: 'MODULE 06',
                  title: 'Graphics, Expansion & High-Speed External I/O',
                  pages: 'Pages 89–104',
                  desc: 'PCIe lane allocation, DisplayPort 2.1 vs HDMI 2.1, USB4 v2.0 (80 Gbps), and Thunderbolt 5.',
                },
                {
                  mod: 'MODULE 07',
                  title: 'Enterprise Hardware Fault Decision Tree & Traps',
                  pages: 'Pages 105–118',
                  desc: '4-step triage: No Power, No POST (Debug LEDs), No Video (GPU HDMI trap), and No Boot (UEFI).',
                },
                {
                  mod: 'MODULE 08',
                  title: '100+ Company Interview Questions & Model Answers',
                  pages: 'Pages 119–130',
                  desc: 'Real scenario questions from Amazon AWS, Cisco TAC, TCS, and Wipro with Senior Engineer answers.',
                },
              ].map((item, idx) => (
                <div
                  key={idx}
                  className="p-2.5 rounded-xl border border-current/10 bg-current/[0.02] flex items-center justify-between gap-4"
                >
                  <div className="space-y-0.5">
                    <div className="flex items-center gap-2">
                      <span className="text-emerald-400 font-bold text-[10px]">{item.mod}</span>
                      <span className="font-bold text-current text-[11px]">{item.title}</span>
                    </div>
                    <div className="text-[10px] opacity-60 font-sans">{item.desc}</div>
                  </div>
                  <div className="text-right shrink-0">
                    <span className="text-[10px] px-2 py-0.5 rounded bg-current/[0.06] font-bold">
                      {item.pages}
                    </span>
                  </div>
                </div>
              ))}
            </div>

            {/* Zero-Outdated Guarantee Box */}
            <div className="p-3 rounded-xl border border-emerald-500/30 bg-emerald-500/[0.05] flex items-center justify-between text-xs">
              <div>
                <span className="font-bold text-emerald-400 text-[10px] font-mono">
                  🔒 RTECHLAB ZERO-OUTDATED CONTENT GUARANTEE:
                </span>
                <p className="text-[10px] opacity-80 mt-0.5 font-sans">
                  Zero mentions of floppy drives, IDE ribbons, or legacy BIOS. 100% focused on modern production hardware standards.
                </p>
              </div>
              <div className="font-mono text-[10px] text-emerald-400 font-bold shrink-0">
                100% Industrial Standard
              </div>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 02 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 3: MODULE 01: SILICON & SOCKETS (LGA 1700/AM5 SCHEMATIC)
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Module 01: Silicon &amp; Sockets</span>
            <span>2027 Industrial Standard</span>
          </div>

          <div className="space-y-3 my-auto">
            {/* Topic Header */}
            <div>
              <div className="flex items-center gap-2 mb-1">
                <span className="px-2 py-0.5 rounded bg-emerald-500/10 text-emerald-400 font-mono text-[9px] font-bold border border-emerald-500/20">
                  MODULE 01 · CHAPTER 1.2
                </span>
                <span className="px-2 py-0.5 rounded bg-blue-500/10 text-blue-400 font-mono text-[9px] font-bold border border-blue-500/20">
                  HARDWARE SILICON PHYSICS
                </span>
                <span className="px-2 py-0.5 rounded bg-amber-500/10 text-amber-400 font-mono text-[9px] font-bold border border-amber-500/20">
                  FIELD TRIAGE
                </span>
              </div>
              <h2 className="text-xl font-black tracking-tight">
                CPU Sockets: LGA vs PGA Architecture
              </h2>
              <p className="text-xs opacity-75">
                Physical connection mechanics, pin damage recovery, and the thermodynamics of heat transfer.
              </p>
            </div>

            {/* Vector Schematic 1.2 */}
            <div className="rounded-xl border border-current/15 overflow-hidden bg-black/40 shadow-lg">
              <img
                src="/images/notes/cpu-socket-inspection.svg"
                alt="Real Hardware Macro Inspection: Intel LGA 1700 Socket vs AMD Substrate Gold Land Pads"
                className="w-full h-auto max-h-[145px] object-contain mx-auto"
              />
              <div className="py-1 px-3 bg-current/[0.04] border-t border-current/10 flex items-center justify-between text-[9px] font-mono opacity-70">
                <span>Figure 1.2: Real Hardware Macro Lab Inspection (Bent Pin Triage &amp; Land Pads)</span>
                <span className="text-emerald-400 font-bold">300 DPI Vector Schematic</span>
              </div>
            </div>

            {/* Engineering Fact Box */}
            <div className="p-3 rounded-xl border border-amber-500/30 bg-amber-500/[0.05] text-xs">
              <div className="font-mono font-bold text-amber-400 text-[10px] mb-0.5">
                ⚡ DID YOU KNOW? (THE THERMAL CONDUCTIVITY TRAP)
              </div>
              <p className="opacity-80 text-[11px] leading-relaxed">
                Copper conducts heat at <strong>401 W/m·K</strong>, while ambient air conducts heat at only <strong>0.026 W/m·K</strong> (over 15,000× worse!). Microscopic air pockets trapped between CPU and heatsink cause immediate 100°C thermal runaway. Thermal paste does not cool — it only displaces air!
              </p>
            </div>

            {/* Company Interview Question */}
            <div className="p-3 rounded-xl border border-emerald-500/30 bg-emerald-500/[0.04] text-xs">
              <div className="flex items-center justify-between font-mono mb-1">
                <span className="text-emerald-400 font-bold text-[10px]">
                  🏢 MOST ASKED INTERVIEW QUESTION [TCS / WIPRO / AMAZON]
                </span>
                <span className="text-[9px] opacity-60">L1 Technical Round</span>
              </div>
              <p className="font-semibold text-[11px] mb-1">
                "A server CPU drops clock frequency from 4.8 GHz to 800 MHz under load. How do you isolate whether it is CPU Thermal Throttling or VRM Power Throttling?"
              </p>
              <div className="text-[10px] opacity-80 leading-relaxed bg-black/40 p-2 rounded-lg border border-white/5 font-mono">
                <strong>Senior Engineer Answer:</strong> Inspect HWiNFO / IPMI sensor telemetry: If core temps reach <code>TjMax (100°C)</code>, the CPU asserted internal <code>PROCHOT#</code>. If core temps are low (65°C) but clocks drop, motherboard VRM MOSFETs have exceeded 115°C, triggering external thermal power-limit throttling.
              </div>
            </div>

            {/* Knowledge Check MCQ */}
            <div className="p-2.5 rounded-xl border border-purple-500/30 bg-purple-500/[0.04] text-xs">
              <div className="flex items-center justify-between font-mono mb-1">
                <span className="text-purple-400 font-bold text-[10px]">
                  🎯 KNOWLEDGE CHECK · EXAM PRACTICE SCENARIO
                </span>
                <span className="text-[9px] opacity-60">MCQ 14 of 50</span>
              </div>
              <p className="font-medium text-[11px] mb-1.5">
                A desktop technician accidentally bends two corner pins on an AMD PGA processor while unboxing. Which tool is the enterprise-approved method to straighten them?
              </p>
              <div className="grid grid-cols-2 gap-1.5 text-[10px] font-mono">
                <div className="p-1 rounded bg-white/[0.03] border border-white/5 opacity-60">A) Needle-nose pliers</div>
                <div className="p-1 rounded bg-emerald-500/10 border border-emerald-500/40 text-emerald-400 font-bold">
                  B) 0.5mm Mechanical Pencil Tip (Correct)
                </div>
              </div>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 03 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 4: THE HUMAN BODY COMPUTER ANATOMY ANALOGY
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Part 1: Computer Anatomy</span>
            <span>Intuitive Bio-Engineering Mental Model</span>
          </div>

          <div className="my-auto space-y-4">
            <div>
              <span className="text-[10px] font-mono text-emerald-400 uppercase tracking-widest font-bold">
                CONCEPT BREAKTHROUGH
              </span>
              <h2 className="text-2xl font-black tracking-tight">
                The Human Body Analogy (मानव शरीर उपमा)
              </h2>
              <p className="text-xs opacity-75">
                Every complex computer subsystem maps directly to everyday biological functions. Master this and you will never forget hardware troubleshooting.
              </p>
            </div>

            <div className="grid grid-cols-2 gap-3 text-xs">
              <div className="p-3.5 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="font-mono font-bold text-emerald-400 text-[11px] mb-1">
                  1. CPU = THE BRAIN (दिमाग)
                </div>
                <p className="opacity-80 text-[11px] leading-relaxed">
                  Processes millions of instructions per second. Governs all operations via the Arithmetic Logic Unit (ALU) and Control Unit (CU). Generates significant metabolic heat.
                </p>
              </div>

              <div className="p-3.5 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="font-mono font-bold text-blue-400 text-[11px] mb-1">
                  2. MOTHERBOARD = NERVOUS SYSTEM (तंत्रिका तंत्र)
                </div>
                <p className="opacity-80 text-[11px] leading-relaxed">
                  Copper PCB traces act as physical nerves routing high-speed gigahertz electrical impulses between the CPU socket, RAM slots, and PCIe expansion buses.
                </p>
              </div>

              <div className="p-3.5 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="font-mono font-bold text-amber-400 text-[11px] mb-1">
                  3. RAM = SHORT-TERM MEMORY (कार्यकारी डेस्क)
                </div>
                <p className="opacity-80 text-[11px] leading-relaxed">
                  Your physical working desk. Holds applications and data currently open. Volatile memory: when power is cut, all contents evaporate instantaneously.
                </p>
              </div>

              <div className="p-3.5 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="font-mono font-bold text-purple-400 text-[11px] mb-1">
                  4. SSD / NVME = LONG-TERM MEMORY (स्थायी डायरी)
                </div>
                <p className="opacity-80 text-[11px] leading-relaxed">
                  Your permanent written diary. Non-volatile 3D NAND flash traps floating-gate electron charges, keeping OS binaries and user documents permanently safe without power.
                </p>
              </div>

              <div className="p-3.5 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="font-mono font-bold text-red-400 text-[11px] mb-1">
                  5. PSU = THE HEART (हृदय)
                </div>
                <p className="opacity-80 text-[11px] leading-relaxed">
                  Pumps clean, steady direct current (+12V, +5V, +3.3V) through the motherboard veins. Excessive voltage ripple causes cardiac arrest in delicate VRM capacitors.
                </p>
              </div>

              <div className="p-3.5 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="font-mono font-bold text-cyan-400 text-[11px] mb-1">
                  6. COOLING = SWEAT &amp; LUNGS (पसीना और फेफड़े)
                </div>
                <p className="opacity-80 text-[11px] leading-relaxed">
                  Phase-change heatpipes evaporate liquid wick fluid under heat, and case fans exhale thermal energy outside the chassis to prevent catastrophic silicon melting.
                </p>
              </div>
            </div>

            {/* Diagnostic Field Rule */}
            <div className="p-3 rounded-xl border border-emerald-500/30 bg-emerald-500/[0.04] text-xs font-mono">
              <span className="text-emerald-400 font-bold">💡 SENIOR TECHNICIAN FIELD RULE:</span>
              <p className="text-[11px] opacity-80 mt-1 font-sans">
                When a system freezes: If screen goes black instantly with no error log, check the <strong>Heart (PSU)</strong> or <strong>Brain Thermal Runaway (Cooling)</strong>. If blue screen BSOD occurs with memory dump errors, check the <strong>Short-Term Memory (RAM)</strong>.
              </p>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 04 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 5: MEMORY LATENCY HIERARCHY (THE KITCHEN CHEF STORY)
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Part 2: Latency Hierarchy</span>
            <span>Why Cache Hierarchies Dictate Real-World Speed</span>
          </div>

          <div className="my-auto space-y-4">
            <div>
              <span className="text-[10px] font-mono text-emerald-400 uppercase tracking-widest font-bold">
                LATENCY BOTTLENECK
              </span>
              <h2 className="text-2xl font-black tracking-tight">
                The Kitchen Chef Story: Why Cache Matters
              </h2>
              <p className="text-xs opacity-75">
                A modern CPU operates at 5.0 GHz (5 billion cycles per second). But if it must wait for slow storage, the CPU sits 100% idle!
              </p>
            </div>

            <div className="space-y-3 font-mono text-xs">
              <div className="p-3 rounded-xl border border-emerald-500/30 bg-emerald-500/[0.04] flex items-center justify-between gap-4">
                <div>
                  <div className="text-emerald-400 font-bold text-xs">1. CPU REGISTERS &amp; L1 CACHE</div>
                  <div className="text-[11px] opacity-75 font-sans">
                    The Chef's Hands &amp; Cutting Knife. Ingredients are already held in hand. Zero waiting cycles.
                  </div>
                </div>
                <div className="text-right shrink-0">
                  <span className="text-emerald-400 font-bold text-sm">~1 Nanosecond</span>
                  <div className="text-[9px] opacity-60">0.5 - 1 ns latency</div>
                </div>
              </div>

              <div className="p-3 rounded-xl border border-blue-500/30 bg-blue-500/[0.04] flex items-center justify-between gap-4">
                <div>
                  <div className="text-blue-400 font-bold text-xs">2. L2 &amp; L3 SHARED CACHE</div>
                  <div className="text-[11px] opacity-75 font-sans">
                    The Kitchen Cutting Board. The chef reaches across the tabletop to grab chopped vegetables.
                  </div>
                </div>
                <div className="text-right shrink-0">
                  <span className="text-blue-400 font-bold text-sm">~3 to 12 ns</span>
                  <div className="text-[9px] opacity-60">32MB - 96MB 3D V-Cache</div>
                </div>
              </div>

              <div className="p-3 rounded-xl border border-amber-500/30 bg-amber-500/[0.04] flex items-center justify-between gap-4">
                <div>
                  <div className="text-amber-400 font-bold text-xs">3. SYSTEM DRAM (DDR5)</div>
                  <div className="text-[11px] opacity-75 font-sans">
                    The Kitchen Refrigerator. The chef must stop cooking, walk across the kitchen, and open the fridge.
                  </div>
                </div>
                <div className="text-right shrink-0">
                  <span className="text-amber-400 font-bold text-sm">~60 Nanoseconds</span>
                  <div className="text-[9px] opacity-60">60 - 80× slower than L1</div>
                </div>
              </div>

              <div className="p-3 rounded-xl border border-red-500/30 bg-red-500/[0.04] flex items-center justify-between gap-4">
                <div>
                  <div className="text-red-400 font-bold text-xs">4. NVME SOLID STATE DRIVE (PCIE 5.0)</div>
                  <div className="text-[11px] opacity-75 font-sans">
                    The Supermarket Down the Road. The chef has to start his car, drive to the market, and purchase supplies.
                  </div>
                </div>
                <div className="text-right shrink-0">
                  <span className="text-red-400 font-bold text-sm">~20,000+ ns</span>
                  <div className="text-[9px] opacity-60">20,000× slower than L1</div>
                </div>
              </div>
            </div>

            {/* Bottom Key Takeaway */}
            <div className="p-3.5 rounded-xl border border-current/15 bg-current/[0.03] text-xs">
              <div className="font-bold text-current mb-1">
                ⚡ ARCHITECTURAL TAKEAWAY FOR INTERVIEWS:
              </div>
              <p className="opacity-80 text-[11px] leading-relaxed">
                CPUs never lag because of instruction math — they lag because of <strong>Cache Misses</strong>! When data is missing from L1/L2/L3 cache, the processor enters pipeline stall cycles waiting for RAM or NVMe storage bus transfers.
              </p>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 05 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 6: MODULE 02: MOTHERBOARD VRM POWER STAGES & SCHEMATIC
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Module 02: Motherboard VRM</span>
            <span>Power Delivery Networks &amp; Step-Down Mechanics</span>
          </div>

          <div className="space-y-3 my-auto">
            {/* Header */}
            <div>
              <div className="flex items-center gap-2 mb-1">
                <span className="px-2 py-0.5 rounded bg-emerald-500/10 text-emerald-400 font-mono text-[9px] font-bold border border-emerald-500/20">
                  MODULE 02 · CHAPTER 2.1
                </span>
                <span className="px-2 py-0.5 rounded bg-blue-500/10 text-blue-400 font-mono text-[9px] font-bold border border-blue-500/20">
                  POWER DELIVERY NETWORKS
                </span>
                <span className="px-2 py-0.5 rounded bg-amber-500/10 text-amber-400 font-mono text-[9px] font-bold border border-amber-500/20">
                  DRMOS 90A SPS
                </span>
              </div>
              <h2 className="text-xl font-black tracking-tight">
                Motherboard VRM Phases: DrMOS &amp; Vcore Regulation
              </h2>
              <p className="text-xs opacity-75">
                Converting high-voltage 12V EPS input into ripple-free 1.1V–1.3V silicon power without thermal meltdown.
              </p>
            </div>

            {/* Vector Schematic 2.1 */}
            <div className="rounded-xl border border-current/15 overflow-hidden bg-black/40 shadow-lg">
              <img
                src="/images/notes/vrm-power-delivery.svg"
                alt="Motherboard 16+1+1 VRM Power Stage Delivery Architecture"
                className="w-full h-auto max-h-[145px] object-contain mx-auto"
              />
              <div className="py-1 px-3 bg-current/[0.04] border-t border-current/10 flex items-center justify-between text-[9px] font-mono opacity-70">
                <span>Figure 2.1: Multi-Phase VRM Step-Down Mechanics (EPS 12V → PWM → DrMOS → Chokes → Vcore)</span>
                <span className="text-emerald-400 font-bold">300 DPI Vector Schematic</span>
              </div>
            </div>

            {/* Engineering Physics Box */}
            <div className="p-3 rounded-xl border border-blue-500/30 bg-blue-500/[0.05] text-xs">
              <div className="font-mono font-bold text-blue-400 text-[10px] mb-0.5">
                ⚡ TRANSIENT VOLTAGE DROOP &amp; LOAD-LINE CALIBRATION (LLC)
              </div>
              <p className="opacity-80 text-[11px] leading-relaxed">
                When a 16-core CPU switches from idle to full AVX-512 workload in 2 nanoseconds, current demand jumps from 15A to 220A! This instantaneous current surge causes voltage to plummet (<strong>Vdroop</strong>). Without motherboard Load-Line Calibration (LLC) compensating for resistance losses, the CPU crashes immediately with a <code>WHEA_UNCORRECTABLE_ERROR</code>.
              </p>
            </div>

            {/* Company Interview Question */}
            <div className="p-3 rounded-xl border border-emerald-500/30 bg-emerald-500/[0.04] text-xs">
              <div className="flex items-center justify-between font-mono mb-1">
                <span className="text-emerald-400 font-bold text-[10px]">
                  🏢 MOST ASKED INTERVIEW QUESTION [CISCO TAC / AMAZON AWS]
                </span>
                <span className="text-[9px] opacity-60">Hardware Systems Engineer</span>
              </div>
              <p className="font-semibold text-[11px] mb-1">
                "What is the physical difference between CPU Vcore, VCCSA, and VCCIO, and what happens if a technician supplies excessive VCCSA voltage?"
              </p>
              <div className="text-[10px] opacity-80 leading-relaxed bg-black/40 p-2 rounded-lg border border-white/5 font-mono">
                <strong>Senior Engineer Answer:</strong> <strong>Vcore</strong> powers CPU computing cores; <strong>VCCSA</strong> powers the System Agent (Integrated Memory Controller &amp; PCIe root complex). Exceeding 1.35V on VCCSA during extreme RAM overclocking permanently degrades the silicon of the internal memory controller, rendering Dual-Channel RAM unbootable forever!
              </div>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 06 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 7: MODULE 03: HIGH-SPEED RAM ARCHITECTURE (DDR4 VS DDR5)
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Module 03: Memory Subsystems</span>
            <span>High-Speed Memory Bus &amp; Dual Subchannel Architecture</span>
          </div>

          <div className="space-y-3 my-auto">
            {/* Header */}
            <div>
              <div className="flex items-center gap-2 mb-1">
                <span className="px-2 py-0.5 rounded bg-emerald-500/10 text-emerald-400 font-mono text-[9px] font-bold border border-emerald-500/20">
                  MODULE 03 · CHAPTER 3.2
                </span>
                <span className="px-2 py-0.5 rounded bg-cyan-500/10 text-cyan-400 font-mono text-[9px] font-bold border border-cyan-500/20">
                  HIGH-SPEED MEMORY BUS
                </span>
                <span className="px-2 py-0.5 rounded bg-purple-500/10 text-purple-400 font-mono text-[9px] font-bold border border-purple-500/20">
                  DDR5 SUBCHANNELS
                </span>
              </div>
              <h2 className="text-xl font-black tracking-tight">
                DDR4 vs DDR5 SDRAM: The Architectural Leap
              </h2>
              <p className="text-xs opacity-75">
                Physical notch offset, dual 32-bit subchannels, on-die PMIC, and the daisy-chain slot rule.
              </p>
            </div>

            {/* Vector Schematic 3.2 */}
            <div className="rounded-xl border border-current/15 overflow-hidden bg-black/40 shadow-lg">
              <img
                src="/images/notes/ram-ddr4-vs-ddr5.svg"
                alt="DDR4 vs DDR5 Physical Key Notch and Architecture Comparison"
                className="w-full h-auto max-h-[145px] object-contain mx-auto"
              />
              <div className="py-1 px-3 bg-current/[0.04] border-t border-current/10 flex items-center justify-between text-[9px] font-mono opacity-70">
                <span>Figure 3.2: Mechanical Notch Position (72.25mm vs 77.25mm) &amp; On-Die PMIC Architecture</span>
                <span className="text-emerald-400 font-bold">300 DPI Vector Schematic</span>
              </div>
            </div>

            {/* The Daisy Chain Rule Box */}
            <div className="p-3 rounded-xl border border-emerald-500/30 bg-emerald-500/[0.04] text-xs font-mono">
              <div className="text-emerald-400 font-bold text-[10px] mb-1">
                ⚡ THE DAISY-CHAIN SLOT RULE: ALWAYS POPULATE SLOTS A2 &amp; B2 FIRST (SLOTS 2 &amp; 4)
              </div>
              <p className="text-[11px] opacity-80 font-sans leading-relaxed">
                Modern 4-slot motherboards use daisy-chain copper trace lines connecting CPU to Slot 1, then daisy-chaining to Slot 2. If you install RAM in Slots 1 &amp; 3, the empty open copper traces of Slots 2 &amp; 4 act as electrical antennas creating <strong>Signal Stub Reflection</strong>, causing memory instability at high MT/s speeds!
              </p>
            </div>

            {/* Interview Question */}
            <div className="p-3 rounded-xl border border-cyan-500/30 bg-cyan-500/[0.04] text-xs">
              <div className="flex items-center justify-between font-mono mb-1">
                <span className="text-cyan-400 font-bold text-[10px]">
                  🏢 MOST ASKED INTERVIEW QUESTION [WIPRO / TCS / INFOSYS]
                </span>
                <span className="text-[9px] opacity-60">L1 Technical Assessment</span>
              </div>
              <p className="font-semibold text-[11px] mb-1">
                "What is On-Die ECC in consumer DDR5, and why do enterprise server environments still require true Sideband ECC modules?"
              </p>
              <div className="text-[10px] opacity-80 leading-relaxed bg-black/40 p-2 rounded-lg border border-white/5 font-mono">
                <strong>Senior Engineer Answer:</strong> Consumer DDR5 <strong>On-Die ECC</strong> only corrects bit-flips inside the internal memory cell array itself due to ultra-dense lithography; it does NOT protect data while traveling across the PCB bus to the CPU. Enterprise <strong>Sideband ECC</strong> adds extra parity lanes (72-bit or 80-bit bus) ensuring end-to-end data integrity from DRAM cell directly to the CPU registers.
              </div>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 07 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 8: MODULE 05: POWER ARCHITECTURE & DIAGNOSTICS (ATX 3.1)
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Module 05: Power Subsystems</span>
            <span>ATX 3.1 Standards &amp; PSU Jump Diagnostics</span>
          </div>

          <div className="space-y-3 my-auto">
            {/* Header */}
            <div>
              <div className="flex items-center gap-2 mb-1">
                <span className="px-2 py-0.5 rounded bg-emerald-500/10 text-emerald-400 font-mono text-[9px] font-bold border border-emerald-500/20">
                  MODULE 05 · CHAPTER 5.1
                </span>
                <span className="px-2 py-0.5 rounded bg-blue-500/10 text-blue-400 font-mono text-[9px] font-bold border border-blue-500/20">
                  POWER SUPPLY UNITS
                </span>
                <span className="px-2 py-0.5 rounded bg-amber-500/10 text-amber-400 font-mono text-[9px] font-bold border border-amber-500/20">
                  ATX 3.1 / 12V-2X6
                </span>
              </div>
              <h2 className="text-xl font-black tracking-tight">
                PSU Diagnostics: ATX 3.1 &amp; The Paperclip Jumper
              </h2>
              <p className="text-xs opacity-75">
                Isolating dead power supplies from shorted motherboards, and the 12V-2x6 GPU meltdown fix.
              </p>
            </div>

            {/* Vector Schematic 5.1 */}
            <div className="rounded-xl border border-current/15 overflow-hidden bg-black/40 shadow-lg">
              <img
                src="/images/notes/psu-diagnostics-atx31.svg"
                alt="24-Pin ATX Paperclip Test and ATX 3.1 12V-2x6 GPU Connector"
                className="w-full h-auto max-h-[145px] object-contain mx-auto"
              />
              <div className="py-1 px-3 bg-current/[0.04] border-t border-current/10 flex items-center justify-between text-[9px] font-mono opacity-70">
                <span>Figure 5.1: ATX Pin 16 (PS_ON#) Paperclip Jump &amp; 12V-2x6 Recessed Sense Pins</span>
                <span className="text-emerald-400 font-bold">300 DPI Vector Schematic</span>
              </div>
            </div>

            {/* Diagnostic Protocol */}
            <div className="p-3 rounded-xl border border-amber-500/30 bg-amber-500/[0.05] text-xs">
              <div className="font-mono font-bold text-amber-400 text-[10px] mb-0.5">
                ⚡ THE POWER GOOD SIGNAL (PIN 8 - GRAY WIRE)
              </div>
              <p className="opacity-80 text-[11px] leading-relaxed">
                When you press the PC power button, the motherboard grounds Pin 16 (PS_ON#). The PSU performs internal self-tests on +12V, +5V, and +3.3V rails. Once all voltages stabilize within 5% tolerance, the PSU asserts <strong>+5V on Pin 8 (Power Good / PWR_OK)</strong>. Only after detecting PWR_OK does the motherboard release the CPU Reset line!
              </p>
            </div>

            {/* Company Interview Question */}
            <div className="p-3 rounded-xl border border-emerald-500/30 bg-emerald-500/[0.04] text-xs">
              <div className="flex items-center justify-between font-mono mb-1">
                <span className="text-emerald-400 font-bold text-[10px]">
                  🏢 MOST ASKED INTERVIEW QUESTION [TCS / INFOSYS / HCL]
                </span>
                <span className="text-[9px] opacity-60">Desktop Support Engineer</span>
              </div>
              <p className="font-semibold text-[11px] mb-1">
                "A desktop powers on for 0.5 seconds, fans twitch slightly, and it immediately shuts off. How do you isolate the root cause?"
              </p>
              <div className="text-[10px] opacity-80 leading-relaxed bg-black/40 p-2 rounded-lg border border-white/5 font-mono">
                <strong>Senior Engineer Answer:</strong> This symptom indicates <strong>Over-Current Protection (OCP)</strong> or <strong>Short-Circuit Protection (SCP)</strong> triggering. Disconnect the 8-pin CPU EPS connector. If fans now spin, a high-side VRM MOSFET is shorted to ground. If it still trips, disconnect all front-panel USB headers and run the 24-pin paperclip test isolated from the chassis.
              </div>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 08 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 9: MODULE 07: 4-STEP DIAGNOSTIC TREE & GPU CABLE TRAP
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Module 07: Troubleshooting</span>
            <span>Enterprise Field Diagnostics &amp; Decision Trees</span>
          </div>

          <div className="my-auto space-y-4">
            <div>
              <span className="text-[10px] font-mono text-emerald-400 uppercase tracking-widest font-bold">
                FIELD REPAIR PLAYBOOK
              </span>
              <h2 className="text-2xl font-black tracking-tight">
                4-Step Hardware Triage Decision Tree
              </h2>
              <p className="text-xs opacity-75">
                Never guess blindly. Follow the rigorous 4-stage isolation protocol used by enterprise field service technicians:
              </p>
            </div>

            {/* The 4 Stage Flowchart */}
            <div className="grid grid-cols-2 gap-3 text-xs font-mono">
              <div className="p-3.5 rounded-xl border border-red-500/30 bg-red-500/[0.03]">
                <div className="font-bold text-red-400 text-xs mb-1">
                  STAGE 1: NO POWER (PIR / 0V)
                </div>
                <div className="text-[10px] opacity-75 font-sans space-y-1">
                  <div>• Check wall AC socket and C13 power cable continuity.</div>
                  <div>• Verify PSU rear I/O rocker switch is in (I) position.</div>
                  <div>• Execute 24-Pin Green (Pin 16) to Black (Pin 17) paperclip jump.</div>
                </div>
              </div>

              <div className="p-3.5 rounded-xl border border-amber-500/30 bg-amber-500/[0.03]">
                <div className="font-bold text-amber-400 text-xs mb-1">
                  STAGE 2: NO POST (FANS SPIN, NO BIOS)
                </div>
                <div className="text-[10px] opacity-75 font-sans space-y-1">
                  <div>• Inspect 4 Motherboard Debug LEDs:</div>
                  <div>  - Red LED = CPU socket bent pin or missing EPS 12V.</div>
                  <div>  - Amber/Yellow LED = RAM seating failure (Reseat in A2/B2).</div>
                  <div>  - White LED = GPU PCIe missing power or PCIe slot error.</div>
                </div>
              </div>

              <div className="p-3.5 rounded-xl border border-blue-500/30 bg-blue-500/[0.03]">
                <div className="font-bold text-blue-400 text-xs mb-1">
                  STAGE 3: NO VIDEO (POST PASSES, BLACK SCREEN)
                </div>
                <div className="text-[10px] opacity-75 font-sans space-y-1">
                  <div>• Press Caps Lock on keyboard: If light toggles, PC is alive!</div>
                  <div>• Check the classic <strong>GPU HDMI Cable Trap</strong> below.</div>
                  <div>• Test monitor input source selection (HDMI 1 vs DisplayPort).</div>
                </div>
              </div>

              <div className="p-3.5 rounded-xl border border-emerald-500/30 bg-emerald-500/[0.03]">
                <div className="font-bold text-emerald-400 text-xs mb-1">
                  STAGE 4: NO BOOT (BLUE SCREEN / BCD CORRUPT)
                </div>
                <div className="text-[10px] opacity-75 font-sans space-y-1">
                  <div>• Verify UEFI Native mode vs CSM Legacy in BIOS.</div>
                  <div>• Boot to Windows PE Recovery Command Prompt:</div>
                  <div>  <code>bootrec /fixmbr &amp;&amp; bootrec /rebuildbcd</code></div>
                  <div>• Check SMART health via <code>wmic diskdrive get status</code>.</div>
                </div>
              </div>
            </div>

            {/* The #1 Blunder Callout Box */}
            <div className="p-4 rounded-xl border border-amber-500/40 bg-amber-500/[0.06] text-xs">
              <div className="flex items-center gap-2 font-mono font-bold text-amber-400 text-xs mb-1">
                <span>⚠️ THE #1 DESKTOP SUPPORT MISTAKE: THE GPU HDMI CABLE TRAP</span>
              </div>
              <p className="text-[11px] opacity-80 leading-relaxed font-sans">
                A user submits an emergency ticket: <em>"My brand new engineering workstation turns on, all fans spin, but the screen remains pitch black!"</em><br />
                <strong>Root Cause:</strong> The HDMI or DisplayPort cable was plugged into the vertical motherboard I/O port (where internal graphics are disabled because a discrete GPU is detected) instead of the horizontal Dedicated GPU ports below!
              </p>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 09 of 10</span>
          </div>
        </div>

        {/* =================================================================
            PAGE 10: COMPANY-WISE INTERVIEW QUESTIONS & OFFICIAL BACK COVER
        ================================================================== */}
        <div
          className={`a4-page w-[210mm] min-h-[297mm] h-[297mm] p-[20mm] flex flex-col justify-between relative shadow-2xl print:shadow-none transition-colors ${
            printTheme === 'dark' ? 'bg-[#000000] text-white border border-white/[0.08]' : 'bg-[#FFFFFF] text-[#1D1D1F] border border-black/[0.08]'
          }`}
        >
          {/* Universal Header */}
          <div className="flex items-center justify-between border-b border-current/10 pb-3 text-[11px] font-mono opacity-60">
            <span>RTechLab · Module 08: Interview Triage</span>
            <span>Enterprise Recruitment Questions &amp; Certification</span>
          </div>

          <div className="my-auto space-y-4">
            <div>
              <div className="text-[10px] font-mono text-emerald-400 uppercase tracking-widest font-bold">
                PAGES 119–130 PREVIEW
              </div>
              <h2 className="text-2xl font-black tracking-tight">
                Company-Wise Technical Interview Matrix
              </h2>
              <p className="text-xs opacity-75">
                Real technical screening questions asked by tier-1 MNCs and enterprise infrastructure employers:
              </p>
            </div>

            <div className="space-y-2.5 text-xs">
              <div className="p-3 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="flex items-center justify-between font-mono mb-1">
                  <span className="text-amber-400 font-bold text-[10px]">🏢 AMAZON AWS · CLOUD SUPPORT ASSOCIATE</span>
                  <span className="text-[9px] opacity-60">Systems Diagnostic Round</span>
                </div>
                <p className="font-semibold text-[11px] mb-1 font-sans">
                  "A user complains of latency connecting to an application server. How do you isolate whether the bottleneck is MTU size, DNS, or a saturated NAT gateway?"
                </p>
                <div className="text-[10px] opacity-80 font-mono bg-black/40 p-2 rounded-lg border border-white/5">
                  <strong>Senior Answer:</strong> Execute ping with DF (Don't Fragment) bit: <code>ping 8.8.8.8 -f -l 1472</code> to identify PMTU black hole. Check DNS latency via <code>nslookup</code>, and verify CloudWatch NAT Gateway <code>ErrorPortAllocation</code> metrics to detect SNAT exhaustion.
                </div>
              </div>

              <div className="p-3 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="flex items-center justify-between font-mono mb-1">
                  <span className="text-cyan-400 font-bold text-[10px]">🏢 CISCO TAC · NETWORK SUPPORT ENGINEER</span>
                  <span className="text-[9px] opacity-60">L1 Physical Layer Round</span>
                </div>
                <p className="font-semibold text-[11px] mb-1 font-sans">
                  "A Gigabit Ethernet interface shows increasing CRC errors and late collisions. What are the physical root causes?"
                </p>
                <div className="text-[10px] opacity-80 font-mono bg-black/40 p-2 rounded-lg border border-white/5">
                  <strong>Senior Answer:</strong> Late collisions indicate a <strong>Duplex Mismatch</strong> (one end set to Half-Duplex, other to Full-Duplex) or cable run exceeding the 100m Cat6 limit. CRC errors indicate electromagnetic interference (EMI), damaged RJ45 crimp, or dirty fiber optic transceiver bulkheads.
                </div>
              </div>

              <div className="p-3 rounded-xl border border-current/10 bg-current/[0.02]">
                <div className="flex items-center justify-between font-mono mb-1">
                  <span className="text-emerald-400 font-bold text-[10px]">🏢 TCS / WIPRO · SYSTEMS ADMINISTRATOR</span>
                  <span className="text-[9px] opacity-60">Enterprise Windows Support</span>
                </div>
                <p className="font-semibold text-[11px] mb-1 font-sans">
                  "After a BIOS firmware update, an enterprise laptop prompts for BitLocker recovery key on every boot. Why?"
                </p>
                <div className="text-[10px] opacity-80 font-mono bg-black/40 p-2 rounded-lg border border-white/5">
                  <strong>Senior Answer:</strong> The BIOS update modified the <strong>TPM PCR 0 &amp; PCR 2 measurements</strong> (Platform Configuration Registers). The TPM detected a hardware hash mismatch and locked the volume to protect against bootkit tampering. Suspend BitLocker prior to BIOS flashing!
                </div>
              </div>
            </div>

            {/* Official Certification Seal & Verification Box */}
            <div className="p-3 rounded-2xl border-2 border-emerald-500/40 bg-emerald-500/[0.04] flex items-center justify-between">
              <div>
                <div className="text-[10px] font-mono font-black text-emerald-400 uppercase">
                  OFFICIAL RTECHLAB CERTIFICATION SEAL
                </div>
                <div className="text-xs font-bold text-current mt-0.5">
                  Industrial Systems Engineering Standards · 2027 Edition
                </div>
                <div className="text-[9px] font-mono opacity-60 mt-0.5">
                  License ID: RTECH-2027-HW-9842 · Author: Rahul Sir &amp; Team
                </div>
              </div>
              <div className="text-right font-mono text-[9px] text-emerald-400">
                <span className="px-2 py-1 rounded bg-emerald-500/20 border border-emerald-500/30 font-bold">
                  LIFETIME EMAIL UPDATES ACTIVE
                </span>
              </div>
            </div>
          </div>

          {/* Universal Footer */}
          <div className="flex items-center justify-between border-t border-current/10 pt-3 text-[10px] font-mono opacity-60">
            <span>From Silicon to Cloud · rtechlab.in</span>
            <span>Author: Rahul Sir &amp; RTechLab Team</span>
            <span>Page 10 of 10</span>
          </div>
        </div>

      </main>
    </div>
  );
}
