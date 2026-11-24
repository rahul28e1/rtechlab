#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-cyan)[CHAPTER 04 · PROCESSOR SILICON & AI COMPUTING]
= Chapter 4: CPU Microarchitecture, Machine Cycles & AI Accelerators

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Microprocessor organization: ALU and Control Unit, internal registers, the 4-stage machine cycle, pipelining hazards, RISC vs CISC paradigms, heterogeneous hybrid cores, GPU vector pipelines, NPU systolic arrays, and AI PC architectures.
]

#v(2pt)

== 4.1 Internal CPU Architecture: ALU, Control Unit & Special Registers
The Central Processing Unit (CPU) executes software instructions through coordinated operational silicon blocks:
- *Arithmetic Logic Unit (ALU):* Executes binary mathematical operations (addition, subtraction, multiplication) and Boolean logic evaluations (AND, OR, NOT, XOR, shifts). Modern ALUs incorporate dedicated hardware Floating-Point Units (FPUs) and SIMD vector registers (AVX-512, ARM Neon).
- *Control Unit (CU):* The central supervisory engine of the microprocessor. It extracts instructions from memory, decodes machine opcodes into micro-operations, and emits synchronized electrical timing pulses across internal control buses to trigger ALU actions, register latches, and bus transceivers.
- *Dedicated Architectural Registers (CPU Core):*
  - *Program Counter (PC):* Holds the memory address of the #hl[next machine instruction] scheduled to be fetched and executed; automatically increments after each fetch unless redirected by branch or jump instructions.
  - *Instruction Register (IR):* Temporarily latches the current machine instruction opcode while it is being decoded by the instruction decoder.
  - *Memory Address Register (MAR):* Holds the physical memory address placed onto the system address bus.
  - *Memory Buffer Register (MBR / MDR):* Holds the data word read from or written to the memory data bus.
  - *Accumulator (ACC) & General-Purpose Registers (GPRs):* Ultra-fast storage locations holding immediate calculation operands.
  - *Flags / Program Status Word (PSW):* Status bits updated by ALU results: Zero (`ZF`), Carry (`CF`), Sign (`SF`), and Overflow (`OF`).

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/cpu-processor-package.jpg",
  caption: "Figure 4.1: Modern multi-core microprocessor package showing integrated heat spreader (IHS) and gold contact array.",
  height: 48pt
)

#v(2pt)

== 4.2 The 4-Stage Machine Instruction Cycle
Every software instruction undergoes a four-stage cyclical pipeline orchestrated by the system clock generator:
1. *Fetch Stage:* The Control Unit reads the address currently residing in the Program Counter (PC), places it onto the Address Bus via the MAR, asserts the `MEMR` control strobe, and latches the incoming opcode into the Instruction Register (IR). The PC is incremented ($"PC" <- "PC" + 4$).
2. *Decode Stage:* The instruction decoder analyzes the binary bit fields in the IR, resolving the opcode, operand register addresses, and addressing modes.
3. *Execute Stage:* The Control Unit routes operands into the ALU, triggers the designated arithmetic or logical operation, and evaluates condition flag bits.
4. *Write-Back Stage:* The computational result is committed to the designated destination register file or written out to system RAM via the MBR.

#pagebreak()

== 4.3 Pipelining Architectures & Hazard Resolution
Instruction pipelining overlaps the execution of multiple instructions across separate hardware functional units simultaneously:
- *Classic 5-Stage RISC Pipeline:* 1. Instruction Fetch (IF); 2. Instruction Decode (ID); 3. Execution (EX); 4. Memory Access (MEM); 5. Write-Back (WB). In an ideal steady-state pipeline, #hl[one completed instruction retires every clock cycle] ($"IPC" = 1.0$).
- *Pipeline Hazards:* Conditions that disrupt regular instruction flow and force pipeline stalls ('bubbles'):
#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Hazard Category*], [*Physical Root Cause*], [*Hardware Resolution & Mitigation Technique*]),
  [Structural Hazard], [Hardware resource conflict (two instructions demand the same memory port or ALU simultaneously).], [Replicate execution resources; split L1 into independent L1 Instruction and L1 Data caches (Modified Harvard architecture).],
  [Data Hazard (RAW, WAR, WAW)], [Instruction depends on the result of an earlier instruction that has not yet completed write-back.], [Implement #hl[Register Forwarding (Bypassing)] to route ALU results directly from EX stage to subsequent ID stages; Out-of-Order execution with Reorder Buffer (ROB).],
  [Control Hazard], [Branch or conditional jump instruction redirects the Program Counter to a distant address.], [Employ dynamic #hl[Branch Predictors] with Branch Target Buffers (BTB); speculatively execute predicted path. Flush pipeline on misprediction.]
)

#v(2pt)

== 4.4 Processor Design Paradigms: RISC vs CISC
#table(
  columns: (1.1fr, 1.4fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Design Characteristic*], [*CISC (Complex Instruction Set)*], [*RISC (Reduced Instruction Set)*]),
  [Instruction Length], [Variable length (1 to 15 bytes in x86-64).], [#hl[Fixed length] (strictly 32-bit in standard ARM / RISC-V).],
  [Memory Access Policy], [Memory-to-register operations supported directly in math opcodes.], [#hl[Strict Load/Store architecture]; arithmetic occurs only between registers.],
  [Instruction Complexity], [Hundreds of specialized multi-clock instructions; high code density.], [Small set of simple instructions; optimized for single-cycle execution and deep pipelining.],
  [Modern Convergence], [Modern x86-64 CPUs internally decode CISC instructions into RISC-like micro-ops (μops).], [Modern ARM chips incorporate vector extensions and complex SIMD instructions (SVE2).]
)

#pagebreak()

== 4.5 Heterogeneous Computing: Performance Cores vs Efficiency Cores
Due to thermal power dissipation limits (the breakdown of Dennard Scaling), modern desktop and mobile processors combine diverse core designs:
- *Performance Cores (P-Cores):* Massive out-of-order execution engines with wide instruction decoders (6 to 8-wide), deep pipelines (16+ stages), and aggressive branch predictors designed to maximize single-threaded latency-sensitive performance.
- *Efficiency Cores (E-Cores):* Compact in-order or shallow out-of-order execution cores consuming a fraction of the silicon area and power; handles background daemon services, rendering tasks, and high-throughput multi-threaded workloads.
- *Hardware Thread Directors:* Silicon hardware telemetry communicates operating system schedulers to assign foreground latency-critical user tasks to P-cores while directing background maintenance threads to E-cores.

#v(2pt)

== 4.6 The Compute Triad: CPU vs GPU vs NPU Architectures
Modern computing has transitioned from general-purpose CPUs to specialized heterogeneous domain-specific accelerators:
#table(
  columns: (1fr, 1.2fr, 1.3fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.5pt,
  table.header([*Architectural Metric*], [*Central Processing Unit (CPU)*], [*Graphics Processing Unit (GPU)*], [*Neural Processing Unit (NPU)*]),
  [Compute Paradigm], [Latency-optimized scalar processing.], [Throughput-optimized SIMD vector processing.], [#hl[Matrix multiplication (GEMM) systolic arrays].],
  [Core Hierarchy], [4 to 24 complex high-clock cores.], [Thousands of streamlined stream cores.], [Dedicated 2D MAC grid arrays (INT8/FP16).],
  [Memory Subsystem], [Low-latency SRAM caches, DDR5 RAM.], [Wide 256/384-bit buses, GDDR6/HBM3e.], [Tightly coupled on-chip SRAM scratchpads.],
  [Energy Efficiency], [Moderate efficiency across general tasks.], [High power under massive parallel rendering.], [#hl[Extreme energy efficiency] ($>15$ TOPS/Watt).]
)

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/cpu-socket-lga-macro.jpg",
  caption: "Figure 4.2: Macro view of LGA motherboard socket spring contact pins transferring multi-gigahertz signals to the CPU.",
  height: 48pt
)

#v(2pt)

== 4.7 AI PCs, On-Device Inference & The TOPS Metric
The emergence of Artificial Intelligence computing mandates dedicated on-device acceleration:
- *Microsoft Copilot+ Standard:* Mandates an on-board NPU achieving at least #hl[40+ TOPS (Tera Operations Per Second)] at INT8 precision.
- *Crucial Engineering Caveat: TOPS Alone Does Not Measure AI Performance!* TOPS reflects only peak theoretical raw integer MAC operations per second under ideal conditions. Real-world AI text generation speed (tokens per second) is heavily constrained by #hl[Memory Bandwidth (GB/s)] to feed weights into compute units, quantization precision (INT4 vs INT8 vs FP16), and driver compiler software optimization.
- *On-Device SLMs vs Cloud Models:* Small Language Models (3B to 7B parameters like Phi-3 and Gemma) execute entirely locally on NPUs, delivering zero cloud API latency, zero subscription costs, and 100% data privacy.

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Does a CPU with higher clock frequency (GHz) always outperform a lower-clocked CPU?", a: "No. Performance equals Clock Frequency x IPC (Instructions Per Cycle). A modern CPU executing 4 IPC at 3 GHz (12 Billion IPS) outperforms an older 1 IPC CPU running at 4 GHz (4 Billion IPS).")
#faq-item(q: "Why are GPUs and NPUs better than CPUs for AI Large Language Models?", a: "AI workloads consist of massive matrix multiplications. CPUs excel at sequential logic, whereas GPUs and NPUs process thousands of parallel matrix coordinates simultaneously in hardware.")
#faq-item(q: "Does an NPU with 45 TOPS guarantee fast AI video editing?", a: "Not necessarily. TOPS measures peak theoretical math operations. If memory bandwidth is narrow or software lacks NPU optimization, performance will stall waiting for data transfers.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which CPU register holds the memory address of the next instruction to be fetched?", ans: "Program Counter (PC).")
#short-q(num: 2, q: "What technique resolves Data Hazards by routing ALU outputs directly to subsequent decode stages?", ans: "Register Forwarding (Bypassing).")
#short-q(num: 3, q: "What minimum NPU compute threshold is required for Windows Copilot+ PC certification?", ans: "40+ TOPS (Tera Operations Per Second).")
#short-q(num: 4, q: "What hardware silicon structure is primarily used inside NPUs for matrix multiplications?", ans: "2D Systolic Array MAC units.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "During which phase of the machine cycle is an instruction decoded by the control unit?", a: "Fetch", b: "Decode", c: "Execute", d: "Write-back", ans: "B", expl: "During the Decode stage, instruction decoder logic interprets binary opcodes and identifies required operand registers.")
#mcq(num: 2, q: "Which pipeline hazard occurs when two instructions compete for the same physical memory port simultaneously?", a: "Structural Hazard", b: "Data Hazard (RAW)", c: "Control Hazard", d: "Branch Hazard", ans: "A", expl: "Structural hazards arise from hardware resource conflicts when multiple instructions demand the same functional execution unit.")
#mcq(num: 3, q: "What processor architecture mandates a strict Load/Store policy where arithmetic occurs only between registers?", a: "CISC", b: "VLIW", c: "RISC", d: "SIMD", ans: "C", expl: "RISC architectures enforce Load/Store execution; memory is accessed strictly via explicit load and store instructions.")
#mcq(num: 4, q: "What architectural feature allows out-of-order CPU instructions to commit safely in original program order?", a: "Branch Target Buffer", b: "Reorder Buffer (ROB)", c: "Translation Lookaside Buffer", d: "Memory Management Unit", ans: "B", expl: "The Reorder Buffer tracks in-flight speculatively executed instructions and commits them in strict program order.")
#mcq(num: 5, q: "Why is memory bandwidth (GB/s) critical for running AI Large Language Models on local hardware?", a: "To cool CPU VRM MOSFETs", b: "To stream billions of model parameter weights into compute cores every token generation", c: "To format storage partitions", d: "To negotiate Wi-Fi encryption", ans: "B", expl: "LLM inference is memory-bandwidth bound; generating each token requires streaming gigabytes of neural weights into compute units.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "Dennard Scaling Breakdown")[
      Until 2005, shrinking transistors allowed clock speeds to soar without increasing power density. Its breakdown forced the industry to adopt multi-core chips!
    ]
  ],
  [
    #tech-spotlight-box(title: "Gate-All-Around 2nm Transistors")[
      2nm GAAFETs replace FinFET fins with vertically stacked nanosheets completely encircled by the gate, slashing sub-threshold leakage currents by 30%!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
