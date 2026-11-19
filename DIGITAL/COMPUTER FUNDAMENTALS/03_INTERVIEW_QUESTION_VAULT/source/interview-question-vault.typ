#import "/SOURCE FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/SOURCE FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab 100+ Company Interview Question Vault — Computer Fundamentals 2027",
  author: "Rahul Patel"
)

// COVER PAGE
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5(
  title: "100+ COMPANY INTERVIEW QUESTION VAULT",
  subtitle: "Must-Read Core 25 · Real Technical Screening Archives from Google, Amazon, Microsoft, Apple, Cisco TAC, TCS & Infosys",
  edition: "2027 CAREER ACCELERATOR EDITION · V5.1.3",
  series-pill: "RTECHLAB PREMIUM CAREER SUITE · INTERVIEW VAULT",
  author: "Rahul Patel",
  author-title: "Founder and Chief Technology Architect, RTechLab",
  subject-code: "RTL-2027-INT-V5.1.3",
  logo-path: "/SOURCE FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/SOURCE FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/cpu-processor-package.jpg"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "100+ Company Interview Question Vault",
  edition: "2027 Career Accelerator Edition · RTechLab",
  author: "Rahul Patel",
  subject-code: "RTL-2027-INT-V5.1.3"
)

#pagebreak()

= HOW TO CRACK SYSTEMS TECHNICAL INTERVIEWS

#concept-box(title: "THE INTERVIEWER'S HIDDEN EVALUATION CRITERIA")[
  When top-tier tech companies (Google, Amazon, Cisco, Microsoft, TCS Digital) interview candidates on Computer Fundamentals, they do not want rote-learned dictionary definitions. They evaluate three fundamental traits:
  1. *Architectural Depth:* Do you understand what physically happens inside the silicon, memory controllers, and PCIe buses?
  2. *Low-Level Precision:* Can you distinguish between bytes and bits, physical and virtual addresses, kernel and user space?
  3. *Diagnostic Method:* When given a failure scenario (e.g. \"Server won't boot\" or \"Packet drops\"), do you guess blindly or follow an authoritative, systematic troubleshooting tree?
]

#v(8pt)
== Vault Navigation Guide
- *Part 1: The \"Must-Read\" 25 Universal Questions:* Mandatory foundational questions asked across 90% of all technical screening rounds.
- *Part 2: Company-Tagged Interview Archives:* Real technical questions tagged by company:
  - *Track A:* TCS Ninja, Digital & Prime Systems Track (Questions 26–40)
  - *Track B:* Infosys DSE & Wipro Systems Support (Questions 41–55)
  - *Track C:* Cisco TAC & Network Hardware (Questions 56–70)
  - *Track D:* Amazon AWS Operations & Infrastructure (Questions 71–85)
  - *Track E:* Google & Microsoft Datacenter Engineering (Questions 86–100)
- *Part 3: 5 Scenario-Based Live Triage Traps:* Complex situational interview challenges.

#pagebreak()

= PART 1: THE \"MUST-READ\" 25 UNIVERSAL SCREENING QUESTIONS

#short-qa(num: 1,
  q: "Explain the complete Input-Process-Output-Storage (IPOS) cycle with a modern multi-core CPU example.",
  a: "The IPOS cycle represents the fundamental dataflow architecture of all digital computers. 1. *Input:* User or sensor initiates data via peripheral (e.g. keystroke via USB HID -> Southbridge/PCH -> PCIe bus). 2. *Process:* CPU fetches instructions from L1 Instruction Cache, decodes them via instruction decoder, dispatches micro-ops to ALU/FPU execution units, and updates internal architectural registers. 3. *Output:* Processed results are dispatched to framebuffer in VRAM via PCIe x16 or transmitted out through a Network Interface Controller (NIC). 4. *Storage:* Intermediate or persistent state is written to non-volatile secondary storage (NVMe PCIe SSD via DMA) for data retention."
)

#short-qa(num: 2,
  q: "What is the Von Neumann Bottleneck, and how do modern computer architectures mitigate it?",
  a: "The Von Neumann bottleneck is the throughput restriction caused by sharing a single physical memory bus for both instructions (code) and data. Because CPU execution speeds have grown exponentially faster than DRAM access latencies, the CPU spends idle cycles waiting for memory operands. *Mitigations:* 1. Multi-level hierarchical CPU caches (L1 split into L1-Instruction and L1-Data, L2, L3) operating at processor clock frequencies. 2. Hardware branch prediction and Out-of-Order Execution (OoOE) to prefetch data into execution pipelines. 3. Harvard architecture separation inside the L1 core."
)

#short-qa(num: 3,
  q: "Distinguish between Little-Endian and Big-Endian byte ordering. Why does network byte order matter?",
  a: "Endianness refers to the sequential order in which bytes of a multi-byte word are stored in computer memory. *Little-Endian (x86-64, modern ARM):* The least significant byte (LSB) is stored at the lowest memory address. For example, 32-bit hex `0x12345678` is stored as `78 56 34 12`. *Big-Endian:* The most significant byte (MSB) is stored at the lowest address (`12 34 56 78`). *Network Byte Order:* The Internet standard (RFC 1700) mandates Big-Endian for all network packet headers (IP addresses, port numbers). Host systems must call conversion primitives (`htons`, `htonl`, `ntohs`, `ntohl`) when transmitting or receiving socket data."
)

#short-qa(num: 4,
  q: "Compare MBR (Master Boot Record) and GPT (GUID Partition Table) partition architectures.",
  a: "1. *Disk Capacity:* MBR uses 32-bit sector addressing ($2^{32} times 512 \"bytes\"$), limiting disk size to 2.2 TB. GPT uses 64-bit Logical Block Addressing (LBA), supporting disks up to 9.4 Zettabytes. 2. *Partition Limit:* MBR allows only 4 primary partitions (or 3 primary + 1 extended). GPT supports 128 primary partitions by default. 3. *Data Redundancy:* MBR stores its boot sector and partition table once at LBA 0 (single point of failure). GPT stores a primary header at LBA 1 and an automatic backup header at the physical end of the disk. 4. *Integrity:* GPT uses CRC32 checksums for self-healing corruption detection."
)

#short-qa(num: 5,
  q: "Detail the exact difference between legacy BIOS and UEFI firmware execution environments.",
  a: "Legacy BIOS executes in 16-bit real mode, restricted to 1 MB of memory address space, and initializes hardware sequentially (resulting in slow boot times). UEFI (Unified Extensible Firmware Interface) runs in 32-bit or 64-bit protected execution mode, can address gigabytes of memory, loads modern modular C-based device drivers, supports Secure Boot cryptographic validation, and handles GPT disks $> 2.2$ TB natively."
)

#short-qa(num: 6,
  q: "What is the Power-On Self-Test (POST) sequence, and what do motherboard diagnostic beep codes signify?",
  a: "POST is the initial firmware diagnostic routine executed immediately after CPU reset. It sequentially tests: 1. CPU registers and flags; 2. Timer chips and DMA channels; 3. System RAM integrity (first 64 KB memory test); 4. Video display controller initialization; 5. Keyboard/storage controllers. If a critical component fails before video output is established, the BIOS signals error beep patterns via the chassis speaker (e.g. 1 Long + 2 Short beeps = Video Adapter failure; Continuous rapid beeps = RAM missing or unseated)."
)

#short-qa(num: 7,
  q: "How does Direct Memory Access (DMA) operate, and why is Bus Mastering critical for modern NICs?",
  a: "DMA is a hardware mechanism that allows high-throughput peripheral devices (NVMe drives, 10GbE network adapters) to transfer blocks of data directly to and from system RAM without routing through the CPU. The CPU programs the DMA controller with starting memory address and byte count, then yields the system bus. *Bus Mastering:* An advanced capability where the peripheral interface itself contains an on-board DMA engine, taking control of the PCIe bus to stream packets into ring buffers without interrupting CPU compute threads."
)

#short-qa(num: 8,
  q: "Compare Hardware Interrupts (IRQ) with Message Signaled Interrupts (MSI/MSI-X).",
  a: "Legacy interrupts use physical sideband electrical wires connected to the Advanced Programmable Interrupt Controller (APIC). Multiple devices sharing an IRQ line cause latency and interrupt storms. *MSI / MSI-X:* Modern PCIe devices send interrupts as in-band 32-bit/64-bit memory write transactions directly across the PCIe bus packet fabric. MSI-X allows up to 2,048 independent interrupt vectors per device, enabling high-performance multi-queue NICs to direct network traffic to specific CPU cores."
)

#short-qa(num: 9,
  q: "Explain the architectural improvements of DDR5 over DDR4.",
  a: "1. *Channel Architecture:* DDR4 uses a single 64-bit data channel per DIMM. DDR5 splits each DIMM into two independent 32-bit subchannels (plus 8 bits ECC each), improving memory concurrency. 2. *On-Die ECC:* DDR5 features built-in on-die ECC to correct single-bit errors within memory cells. 3. *PMIC on Module:* Power Management Integrated Circuit (PMIC) is relocated from the motherboard directly onto the DDR5 DIMM, providing tighter 1.1V rail regulation. 4. *Burst Length:* Doubled from BL8 (DDR4) to BL16 (DDR5)."
)

#short-qa(num: 10,
  q: "Calculate raw bandwidth for a PCIe 6.0 x16 slot and state its encoding mechanism.",
  a: "PCIe 6.0 operates at a raw data rate of 64 GT/s per lane using **PAM4 (Pulse Amplitude Modulation 4-level)** encoding, which encodes 2 bits per electrical baud cycle. Raw unidirectional bandwidth per lane = $64 \"GT/s\" times 2 \"bits\" / 8 \"bits/byte\" = 8 \"GB/s\"$. For an x16 link, raw bandwidth is $8 \"GB/s\" times 16 = 128 \"GB/s\"$ per direction, or $256 \"GB/s\"$ bidirectional maximum."
)

#pagebreak()

= PART 1 (CONT.): QUESTIONS 11–25

#short-qa(num: 11,
  q: "Why is NVMe exponentially faster than SATA 3.0 AHCI for enterprise database workloads?",
  a: "1. *Bus Interface:* SATA 3.0 is capped at 6 Gbps (~550 MB/s net) via the Southbridge chipset. NVMe interfaces directly to CPU PCIe lanes (PCIe Gen 4 x4 = 8 GB/s; Gen 5 x4 = 16 GB/s). 2. *Queue Concurrency:* SATA AHCI supports only a single command queue capable of holding up to 32 commands. NVMe supports up to 65,536 (64K) concurrent queues, each accommodating up to 64,000 commands, perfectly matching multi-core CPU parallelism. 3. *Command Overhead:* NVMe requires under half the CPU instruction cycles per I/O compared to AHCI."
)

#short-qa(num: 12,
  q: "Differentiate between Paging and Segmentation in Operating System memory management.",
  a: "*Paging:* Divides physical memory into fixed-size blocks (Frames) and logical memory into blocks of identical size (Pages, typically 4 KB). Paging eliminates external fragmentation but introduces minor internal fragmentation in the last page. *Segmentation:* Divides memory into variable-length logical units based on program structure (Code, Data, Stack, Heap). It eliminates internal fragmentation but causes severe external fragmentation requiring periodic memory compaction."
)

#short-qa(num: 13,
  q: "What is the structural difference between a Process and a Thread?",
  a: "A *Process* is an executing program instance with its own completely independent virtual address space, file descriptor table, and security context tracked in a Process Control Block (PCB). Inter-process communication (IPC) requires explicit OS mechanisms (pipes, sockets, shared memory). A *Thread* is the smallest schedulable unit of CPU execution within a process, tracked via a Thread Control Block (TCB). All threads belonging to a process share the same virtual address space, global variables, and open files, but possess private stacks and program counters."
)

#short-qa(num: 14,
  q: "What causes System Thrashing in Virtual Memory, and how is it detected?",
  a: "Thrashing occurs when the total working sets of active processes exceed the physical capacity of system RAM. As a result, the OS spends virtually all its CPU time swapping memory pages in and out of secondary storage (pagefile/swap) rather than executing application code. *Detection:* CPU utilization drops to near zero while Disk Active Time spikes to 100% and Page Faults per second skyrocket in performance counters (`Memory\\Pages/sec`)."
)

#short-qa(num: 15,
  q: "Compare CPU C-States (Idle Power) with P-States (Performance Scaling).",
  a: "*C-States (C0 to C10):* Power-saving sleep states entered when a CPU core has no work to execute. C0 is full operational mode; higher C-states progressively shut down internal clocks, flush cache levels, and reduce core voltages to near zero. *P-States (P0 to Pn):* Operational voltage/frequency scaling states utilized while the CPU is actively executing instructions (C0). P0 represents maximum turbo frequency and voltage; higher P-states lower clock frequency to conserve power."
)

#short-qa(num: 16,
  q: "What is the critical life-safety protocol when encountering a swollen Lithium-Ion battery?",
  a: "Swollen lithium pouch batteries suffer from internal electrolyte breakdown and gas evolution. *Strict Protocol:* 1. Immediately disconnect AC power and stop using the device. 2. Never attempt to pierce, crush, compress, or vent the pouch (atmospheric moisture triggers violent exothermic thermal runaway $> 800^\\circ$C and toxic HF gas). 3. Isolate the unit in a cool, well-ventilated space on non-combustible concrete or inside a UL 94 fireproof container. 4. Hand over to certified institutional EHS or licensed hazardous waste specialists."
)

#short-qa(num: 17,
  q: "What is the significance of the gray PWR_OK wire in an ATX power supply?",
  a: "The `PWR_OK` (Power Good) signal on Pin 8 is a +5V logic signal generated by the PSU internal supervisory circuit. It asserts only after all DC rails (+12V, +5V, +3.3V) have stabilized within legal tolerances for 100 to 500 ms. If PWR_OK remains at 0V, the motherboard chipset holds the CPU in a continuous hardware RESET state to prevent data corruption from under-voltage brownouts."
)

#short-qa(num: 18,
  q: "How does Hardware RAID 10 differ from RAID 5 in write penalty and drive failure tolerance?",
  a: "RAID 10 (1+0) is a stripe of mirrors, requiring a minimum of 4 drives. It has a write penalty of 2 (one data write + one mirror write) and can survive multiple drive failures provided no two failed drives share the same mirrored pair. RAID 5 uses distributed parity across at least 3 drives. It has a write penalty of 4 (Read Data, Read Parity, Write Data, Write Parity) and can survive only 1 drive failure. RAID 10 is vastly superior for high-random-write database workloads."
)

#short-qa(num: 19,
  q: "Explain Path MTU Discovery (PMTUD) and what causes an \"MTU Black Hole\".",
  a: "PMTUD allows end hosts to discover the smallest Maximum Transmission Unit across a network path by sending packets with the Don't Fragment (DF) bit set. If an intermediate router cannot forward the packet without fragmentation, it drops it and returns an ICMP Type 3 Code 4 (*Fragmentation Needed*) message containing the next-hop MTU. *MTU Black Hole:* If an overly aggressive firewall blocks incoming ICMP Type 3 messages, the sender never learns of the packet drop and continually retransmits large packets, causing TCP sessions to stall indefinitely."
)

#short-qa(num: 20,
  q: "How does TCP 3-Way Handshake allocate memory buffers, and what is SYN Cookie defense?",
  a: "When a server receives a TCP SYN packet, it allocates memory in the kernel for a Transmission Control Block (TCB) in the SYN-Received backlog queue and replies with SYN-ACK. In a *SYN Flood attack*, attackers flood the server with spoofed SYNs, exhausting kernel memory. *SYN Cookies:* The server encodes connection state into the 32-bit initial sequence number (ISN) of the SYN-ACK packet, eliminating the need to allocate kernel memory until the final ACK arrives from a verified client."
)

#short-qa(num: 21,
  q: "Detail the step-by-step DNS resolution hierarchy when querying an un-cached domain.",
  a: "1. Client Stub Resolver checks local DNS cache and `hosts` file. 2. Query sent to Recursive Resolver (ISP or 8.8.8.8). 3. Recursive Resolver queries Root Nameserver (`.`), receiving referral to TLD server (`.com`). 4. Recursive Resolver queries TLD Nameserver, receiving referral to the Authoritative Nameserver (e.g. `ns1.example.com`). 5. Authoritative Nameserver returns authoritative A/AAAA IP record. 6. Recursive Resolver caches record per TTL and delivers IP to client."
)

#short-qa(num: 22,
  q: "What is an IRQL in Windows, and why does IRQL_NOT_LESS_OR_EQUAL trigger a BSOD?",
  a: "Interrupt Request Level (IRQL) is a hardware priority scheme (PASSIVE_LEVEL 0 to HIGH_LEVEL 31) enforced by the Windows kernel. Memory pages in the pagefile can only be paged in at `PASSIVE_LEVEL` or `APC_LEVEL` because page fault handling requires disk I/O. If a buggy driver at `DISPATCH_LEVEL` (IRQL 2) or higher attempts to access pageable memory that has been paged out, the kernel cannot perform disk I/O to retrieve it, triggering an unrecoverable `IRQL_NOT_LESS_OR_EQUAL (0x0A)` bugcheck."
)

#short-qa(num: 23,
  q: "Why must cooling fan blades be physically held during compressed air cleaning?",
  a: "Blasting high-velocity compressed air ($> 100$ PSI) spins fan blades at $15,000$ to $25,000$ RPM—severely exceeding the sleeve or ball-bearing design threshold ($2,000 - 3,500$ RPM). This causes catastrophic bearing lubricant displacement, spindle wobble, and centrifugal blade fracture."
)

#short-qa(num: 24,
  q: "How does Translation Lookaside Buffer (TLB) shootdown impact multi-threaded performance?",
  a: "When a multi-threaded process modifies a virtual-to-physical memory mapping on one CPU core (e.g. freeing memory via `free()` or `munmap`), all other CPU cores running threads of that process must invalidate their cached TLB entries. The modifying core issues an Inter-Processor Interrupt (IPI) to all other cores, forcing them to pause execution and flush their TLBs. Frequent TLB shootdowns cause severe performance degradation at high core counts."
)

#short-qa(num: 25,
  q: "Compare Symmetric Multiprocessing (SMP) with Asymmetric Multiprocessing (AMP).",
  a: "In *SMP*, all CPU cores are identical, share a unified physical memory address space, have equal access to I/O subsystems, and are managed by a single instance of the OS kernel. In *AMP*, processors may be heterogeneous (e.g. CPU + DSP + NPU) and each processor executes independent tasks or distinct OS kernels, communicating via specialized shared memory mailboxes or hardware message buses."
)

#pagebreak()

= PART 2: COMPANY-TAGGED INTERVIEW ARCHIVES

== Track A: TCS Systems & Digital Track (Questions 26–40)
#short-qa(num: 26,
  q: "[TCS Digital] How does 2's complement representation prevent the duplicate zero trap found in 1's complement?",
  a: "1's complement represents negative numbers by inverting all bits, resulting in two bitwise representations for zero: positive zero (`00000000`) and negative zero (`11111111`), which complicates ALU comparison logic. 2's complement adds 1 to the inverted bits ($~x + 1$). This yields a single unique zero (`00000000`), eliminates ambiguous equality checks, and allows binary addition and subtraction to execute using the exact same hardware adder circuit."
)

#short-qa(num: 27,
  q: "[TCS Ninja] What is the exact difference between SRAM and DRAM at the transistor level?",
  a: "SRAM (Static RAM, used in CPU caches) uses a bistable flip-flop circuit consisting of 4 to 6 transistors (6T cell) per bit. It retains data indefinitely as long as power is maintained, requiring no refresh cycles, and operates at nanosecond access times. DRAM (Dynamic RAM, used in main system memory) stores each bit as an electrical charge on a single tiny capacitor paired with one access transistor (1T-1C cell). Because the capacitor discharges over milliseconds, DRAM requires periodic refresh cycles (tREFI)."
)

#short-qa(num: 28,
  q: "[TCS Prime] Explain the IEEE 754 Single-Precision 32-bit Floating-Point standard bit breakdown.",
  a: "IEEE 754 32-bit binary representation allocates: 1. *Sign Bit (1 bit):* `0` for positive, `1` for negative. 2. *Biased Exponent (8 bits):* Stored with an excess-127 bias (allowing exponents from $-126$ to $+127$). 3. *Mantissa / Significand (23 bits):* Stores the fractional precision bits with an implicit normalized leading 1 ($1.f$). Total precision yields approximately 7 decimal digits."
)

== Track B: Cisco TAC & Network Hardware Track (Questions 41–55)
#short-qa(num: 41,
  q: "[Cisco TAC] A physical Ethernet port is registering high CRC error counters. What are the root causes?",
  a: "Cyclic Redundancy Check (CRC) errors indicate that frame data arrived corrupted at the physical Layer 1/2 boundary. Root causes: 1. Defective RJ45 copper termination or damaged Cat6 cable exceeding 100m distance limits; 2. Electromagnetic interference (EMI) from unshielded cables routed near fluorescent ballasts or motors; 3. Failing optical transceiver (SFP+) laser or dirty fiber end-face; 4. Duplex autonegotiation mismatch (Half-Duplex vs Full-Duplex)."
)

#short-qa(num: 42,
  q: "[Cisco TAC] Explain the physical difference between Single-Mode Fiber (SMF) and Multi-Mode Fiber (MMF).",
  a: "*Multi-Mode Fiber (MMF, OM3/OM4):* Features a thick core diameter (50 $mu$m), allowing multiple light propagation modes. It uses low-cost 850 nm VCSEL lasers, but is limited by modal dispersion to short distances ($< 400$m). *Single-Mode Fiber (SMF, OS2):* Has a microscopic core (9 $mu$m) permitting only a single optical mode. It uses 1310/1550 nm infrared lasers, exhibits zero modal dispersion, and spans distances up to 40-80 km in telecommunication backbones."
)

== Track C: Amazon AWS & Datacenter Operations Track (Questions 56–70)
#short-qa(num: 56,
  q: "[Amazon AWS] An EC2 bare-metal server is completely unresponsive over SSH. How do you triage it out-of-band?",
  a: "Connect to the server's Out-of-Band Management interface via Baseboard Management Controller (BMC) / IPMI / iDRAC over a dedicated management network. 1. Inspect hardware health sensors (chassis ambient temperature, redundant PSU status, DIMM fault LEDs). 2. Launch KVM over IP to view the bare-metal virtual console. 3. Check for kernel panic messages or UEFI halt codes. 4. If system is hung, trigger a chassis power cycle via IPMI CLI: `ipmitool power cycle`."
)

#short-qa(num: 57,
  q: "[Amazon AWS] A hot-plugged enterprise NVMe drive does not appear in `lsblk`. What steps do you take?",
  a: "1. Verify physical insertion: Check that the drive carrier latch is fully engaged and the activity LED illuminates. 2. Rescan the PCIe bus without rebooting: `echo 1 > /sys/bus/pci/rescan`. 3. Inspect kernel logs for PCIe enumeration events: `dmesg -T | grep -i nvme`. 4. Verify PCIe power supply rail via IPMI telemetry to rule out backplane power fault."
)

== Track D: Google & Microsoft Systems Track (Questions 71–85)
#short-qa(num: 71,
  q: "[Google Systems] Explain how Linux Huge Pages (2MB / 1GB) reduce TLB miss latency in large databases.",
  a: "Standard Linux memory management uses 4 KB pages. Mapping 64 GB of database memory requires $16,777,216$ page table entries, far exceeding the capacity of CPU L1/L2 TLBs ($1,000 - 2,000$ entries), causing constant TLB misses. By enabling 2 MB Huge Pages, the same 64 GB is mapped by only 32,768 entries, radically increasing TLB hit rates and eliminating up to 25% of memory access latency overhead."
)

#short-qa(num: 72,
  q: "[Microsoft Systems] What is the difference between Windows User Mode (Ring 3) and Kernel Mode (Ring 0)?",
  a: "*Ring 3 (User Mode):* Application code executes in an unprivileged, isolated virtual address space. Direct hardware access and execution of privileged CPU instructions (e.g. `CLI`, `STI`, modifying control registers `CR0-CR4`) are forbidden. Faults are contained as application crashes. *Ring 0 (Kernel Mode):* Operating system core and device drivers have unrestricted access to physical memory, CPU registers, and I/O ports. A fault in Ring 0 triggers an immediate Blue Screen (BSOD)."
)
