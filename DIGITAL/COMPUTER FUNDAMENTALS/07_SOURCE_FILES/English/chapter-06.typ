#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-cyan)[CHAPTER 06 · SYSTEM SOFTWARE, OS & CLOUD]
= Chapter 6: Software Architecture, Operating Systems & Virtualization

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Software classifications, operating system architectures (Monolithic vs Microkernel), CPU privilege rings, process scheduling algorithms, virtual memory paging, language translators, hypervisors vs containers, and cloud computing models.
]

#v(2pt)

== 6.1 Software Taxonomy: System, Application & Utility Programs
Software constitutes the organized sequences of instructions that command computer hardware:
- *System Software:* Operates as the foundation layer directly interfacing with physical hardware. Encompasses Operating Systems (Windows, Linux, macOS), device drivers, and firmware (UEFI). Manages memory allocation, processor time-slices, and file system I/O.
- *Application Software:* User-facing software engineered to accomplish specific productivity, creative, or enterprise tasks: word processors, web browsers, CAD suites, databases, and scientific simulators.
- *Utility Software:* System maintenance and protection tools: storage defragmenters, disk partition managers, antivirus suites, and cryptographic file archiving utilities.

#v(2pt)

== 6.2 Operating System Architecture: Kernel, Shell & Privilege Rings
The Operating System (OS) is the master supervisory program governing hardware resources:
- *Kernel:* The core execution engine residing permanently in RAM. Handles process scheduling, interrupt servicing, memory mapping, and hardware device communication.
- *Shell / User Interface:* The command interpreter bridging human users and the kernel: Command Line Interfaces (CLI: Bash, PowerShell) and Graphical User Interfaces (GUI: Windows Explorer, GNOME).
- *CPU Hardware Privilege Rings (x86 Protection Hierarchy):*
  - *Ring 0 (Kernel Mode / Supervisor):* Unrestricted access to physical CPU instructions, memory management registers (`CR3`), and I/O hardware ports. Device drivers and OS kernels execute here.
  - *Ring 3 (User Mode):* User applications execute within constrained virtual memory boundaries. Direct hardware execution is blocked; applications must execute #hl[System Calls (SYSCALL / SYSENTER)] to transition into Ring 0 to perform file I/O or allocate memory.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/desktop-pc-workstation.jpg",
  caption: "Figure 6.1: High-performance workstation environment running virtualized hypervisor instances and development stacks.",
  height: 48pt
)

#v(2pt)

== 6.3 Kernel Architectures: Monolithic vs Microkernel Designs
#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*Kernel Paradigm*], [*Execution Model*], [*Architectural Tradeoffs & Industry Examples*]),
  [Monolithic Kernel], [All OS subsystems (file system, network stack, device drivers) run in Ring 0.], [Maximum raw execution performance due to direct function calls. A bug or crash in a third-party driver can crash the entire OS (BSOD). Examples: Linux, Windows NT core.],
  [Microkernel], [Only minimal primitives (IPC, low-level scheduling, memory mapping) run in Ring 0.], [Extreme fault tolerance; device drivers and file systems run as isolated user-space Ring 3 daemons. Lower performance due to heavy IPC message passing. Examples: QNX, seL4.],
  [Hybrid Kernel], [Combines monolithic speed with microkernel modularity.], [Executes performance-critical subsystems in kernel space while maintaining modular driver isolation. Examples: Modern Windows 11, Apple macOS (XNU).]
)

#pagebreak()

== 6.4 Process Lifecycle, Multitasking & CPU Scheduling Algorithms
A *Process* is an executing program instance possessing private virtual address space and file descriptors. A *Thread* is the smallest schedulable execution unit within a process, sharing memory with peer threads.
- *The 5-State Process Model:* 1. *New* (process being created); 2. *Ready* (queued in RAM waiting for CPU time); 3. *Running* (executing on a CPU core); 4. *Waiting / Blocked* (waiting for I/O completion or lock); 5. *Terminated* (execution completed, resources reclaimed).
- *Classic CPU Scheduling Algorithms:*
#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 2.8pt,
  table.header([*Scheduling Algorithm*], [*Preemption Type*], [*Operational Mechanics & System Behavior*]),
  [First-Come, First-Served (FCFS)], [Non-preemptive], [Processes dispatched strictly by arrival order. Suffers from the #hl[Convoy Effect] (short processes stall behind long CPU bursts).],
  [Shortest Job First (SJF)], [Non-preemptive / Preemptive], [Dispatches process with shortest CPU burst time. Minimizes average waiting time; risks starving long jobs.],
  [Round Robin (RR)], [Preemptive (Time Quantum)], [Each process receives a fixed time slice (e.g., 10 to 50 ms). High responsiveness; ideal for interactive time-sharing OS.],
  [Multi-Level Feedback Queue], [Preemptive (Priority levels)], [Dynamic priority queues; I/O-bound interactive processes promoted; long compute-bound jobs demoted.]
)

#v(2pt)

== 6.5 Concurrency, Deadlock & The Four Coffman Conditions
Concurrent execution across multiple threads can lead to synchronization conflicts:
- *Deadlock:* A state where two or more processes are permanently blocked because each holds a resource while waiting for another held by a peer process.
- *The Four Coffman Conditions (Must hold simultaneously for deadlock):*
  1. *Mutual Exclusion:* At least one resource must be held in a non-shareable mode.
  2. *Hold and Wait:* A process holds existing resources while requesting additional locked resources.
  3. *No Preemption:* Resources cannot be forcibly seized from a process; they must be released voluntarily.
  4. *Circular Wait:* A circular chain exists where $P_0$ waits for $P_1$, $P_1$ waits for $P_2$, ..., and $P_n$ waits for $P_0$.

#pagebreak()

== 6.6 Virtual Memory, Paging Architecture & Thrashing
Virtual memory abstracts physical RAM, giving each process a private contiguous 64-bit address space:
- *Paging Mechanics:* Virtual memory is divided into fixed-size blocks called *Pages* (typically 4 KB). Physical RAM is divided into matching *Page Frames*.
- *The Memory Management Unit (MMU) & Page Tables:* The CPU MMU translates virtual addresses to physical frame addresses via multi-level Page Tables. The #hl[Translation Lookaside Buffer (TLB)] caches recent translations in high-speed hardware, resolving hits in $<1$ cycle.
- *Page Faults:* Occurs when a process accesses a page not currently residing in physical RAM. The MMU raises an interrupt, the OS halts the thread, reads the missing page from disk swap/pagefile into a free RAM frame, updates the page table, and restarts the instruction.
- *Thrashing:* When the aggregate working set memory of active processes exceeds physical RAM capacity, the OS spends virtually all CPU cycles swapping pages to and from disk rather than executing application code.

#v(2pt)

== 6.7 Language Translators: Compilers, Interpreters & Assemblers
#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*Translator Type*], [*Input Source Code*], [*Translation Process & Operational Execution*]),
  [Assembler], [Low-level Assembly (`MOV`, `ADD`)], [Converts mnemonic assembly instructions directly into raw binary machine opcodes on a 1:1 basis.],
  [Compiler], [High-level code (C, C++, Rust, Go)], [Translates entire source program ahead-of-time (AOT) into standalone machine code binaries. High execution speed.],
  [Interpreter], [High-level code (Python, Ruby)], [Translates and executes source code line-by-line at runtime. Slower execution; rapid prototyping.],
  [JIT Compiler], [Bytecode (Java JVM, C\# .NET)], [Compiles heavily executed bytecode loops into native machine code at runtime, balancing portability with speed.]
)

#v(2pt)

== 6.8 System Bootstrap: BIOS vs UEFI & Secure Boot
- *Legacy BIOS (Basic Input/Output System):* Operates in 16-bit real mode. Requires Master Boot Record (MBR) partition tables, limited to 2.2 TB drive capacity and max 4 primary partitions.
- *Modern UEFI (Unified Extensible Firmware Interface):* Operates in 32/64-bit mode. Mandates GUID Partition Table (GPT), supporting drives up to 18.8 Zettabytes and 128 partitions.
- *Secure Boot & TPM 2.0:* Secure Boot validates the digital cryptographic signature of the OS bootloader against OEM root keys stored in SPI flash. The Trusted Platform Module (TPM 2.0) measures boot component hashes to guarantee platform integrity against bootkits.

#v(2pt)

== 6.9 Virtualization & Cloud Computing Architectures
- *Type-1 (Bare-Metal) Hypervisors:* Installs directly on server bare-metal hardware (VMware ESXi, Hyper-V, KVM). Direct hardware execution, enterprise datacenter standard.
- *Type-2 (Hosted) Hypervisors:* Runs as application software inside host OS (VirtualBox, VMware Workstation).
- *Virtual Machines (VMs) vs Containers (Docker):* VMs virtualize the complete hardware stack; each VM carries an entire guest operating system, virtual kernel, and drivers (gigabytes in size). Containers virtualize the operating system kernel; all containers share the single host OS kernel isolated via Linux namespaces and cgroups, booting in milliseconds with megabyte footprints.
- *Cloud Computing Service Models:*
  - *IaaS (Infrastructure as a Service):* Raw virtual compute, storage, and networking (AWS EC2, Azure VMs).
  - *PaaS (Platform as a Service):* Managed runtime environments for application deployment (AWS Elastic Beanstalk).
  - *SaaS (Software as a Service):* End-user applications delivered over web browsers (Google Workspace, Microsoft 365).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What is the difference between a process and a thread?", a: "A process is an isolated executing program instance with its own private virtual memory. A thread is an execution path within a process sharing the same address space.")
#faq-item(q: "Why are Docker containers lighter than virtual machines?", a: "Containers share the host operating system kernel and isolate user-space libraries; VMs virtualize entire hardware platforms and require a complete guest OS per instance.")
#faq-item(q: "What causes system Thrashing and how is it resolved?", a: "Thrashing occurs when active memory working sets exceed physical RAM, causing constant disk paging. Resolved by closing applications or installing more physical RAM.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Which CPU privilege ring executes operating system kernel code?", ans: "Ring 0 (Supervisor / Kernel Mode).")
#short-q(num: 2, q: "Name the four Coffman conditions necessary for deadlock to occur.", ans: "Mutual Exclusion, Hold and Wait, No Preemption, Circular Wait.")
#short-q(num: 3, q: "What hardware component inside the MMU caches virtual-to-physical address translations?", ans: "Translation Lookaside Buffer (TLB).")
#short-q(num: 4, q: "What partition table standard is mandated by modern UEFI firmware?", ans: "GUID Partition Table (GPT).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which CPU scheduling algorithm assigns a fixed time quantum to each ready process in rotation?", a: "First-Come First-Served", b: "Shortest Job First", c: "Round Robin", d: "Static Priority", ans: "C", expl: "Round Robin allocates a fixed time slice (quantum) to each process, preempting execution once the quantum expires.")
#mcq(num: 2, q: "What event occurs when a thread attempts to access a virtual memory page not currently loaded in physical RAM?", a: "Segmentation Fault", b: "Page Fault", c: "Stack Overflow", d: "Deadlock", ans: "B", expl: "A Page Fault triggers an OS interrupt to fetch the missing memory page from secondary storage into RAM.")
#mcq(num: 3, q: "What type of hypervisor installs directly on physical server hardware without an underlying OS?", a: "Type-2 Hosted", b: "Type-1 Bare-Metal", c: "Application Container", d: "Microkernel", ans: "B", expl: "Type-1 bare-metal hypervisors (e.g., VMware ESXi, KVM) execute directly on server hardware.")
#mcq(num: 4, q: "What is the maximum drive capacity addressable under the legacy Master Boot Record (MBR) partition scheme?", a: "512 GB", b: "2.2 Terabytes", c: "18.8 Zettabytes", d: "64 Terabytes", ans: "B", expl: "MBR uses 32-bit sector addressing with 512-byte sectors, limiting total capacity to 2^32 x 512 = 2.199 TB.")
#mcq(num: 5, q: "Which cloud service model provides fully functional end-user applications accessible over a web browser?", a: "IaaS", b: "PaaS", c: "SaaS", d: "BaaS", ans: "C", expl: "Software as a Service (SaaS) delivers complete managed software applications (e.g., Microsoft 365, Gmail) via the web.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Convoy Effect in FCFS")[
      In non-preemptive FCFS scheduling, a single CPU-intensive job can block dozens of short I/O tasks, severely tanking system responsiveness!
    ]
  ],
  [
    #tech-spotlight-box(title: "seL4 Formally Verified Microkernel")[
      The seL4 microkernel is mathematically proven to be bug-free against buffer overflows, null pointer dereferences, and privilege escalations!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
