#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab Interview Practice Vault — Computer Fundamentals 2027 (V5.1.4 FINAL)",
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
  title: "INTERVIEW PRACTICE VAULT",
  subtitle: "Company-Aligned Question Bank · Architectural Explanations · Role-Based Problem Sets",
  edition: "2027 CAREER ACCELERATOR EDITION · V5.1.4 FINAL",
  series-pill: "RTECHLAB COMMERCIAL SUITE · INTERVIEW PRACTICE V5.1.4",
  author: "Rahul Patel",
  author-title: "Founder and Chief Technology Architect, RTechLab",
  subject-code: "RTL-2027-FUND-V5.1.4",
  logo-path: "/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/cpu-processor-package.jpg"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Company-Aligned Interview Practice Vault",
  edition: "2027 Career Accelerator Edition · V5.1.4 FINAL Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-FUND-V5.1.4"
)

#pagebreak()

= HOW TO PREPARE FOR SYSTEMS TECHNICAL INTERVIEWS

#concept-box(title: "METHODOLOGY & PROVENANCE NOTICE")[
  Technical evaluations for systems engineering, technical support, and IT infrastructure roles focus on demonstrating systematic reasoning, precise architectural vocabulary, and structured diagnostic triage. 

  *Transparency & Sourcing Notice:* The questions compiled in this practice vault represent standardized industry problem patterns, publicly reported interview themes, and original RTechLab scenario-based technical drills. Company labels (e.g. _TCS-Aligned_, _Amazon AWS-Aligned_, _Cisco TAC-Aligned_) are provided solely to illustrate typical preparation archetypes and question styles encountered across enterprise recruitment; they do not represent confidential, proprietary, or officially endorsed corporate examination materials.
]

#v(8pt)
== Vault Curriculum Categories
- *Category 1: Core Computer Fundamentals Questions (Q01–Q10):* High-frequency concepts in computing architectures, data representation, and system topologies.
- *Category 2: Hardware & Microarchitecture Practice (Q11–Q20):* Bus protocols, memory controllers, PCIe signaling, power delivery, and cooling systems.
- *Category 3: Operating Systems & Memory Management (Q21–Q30):* Paging, virtual memory, context switching, interrupt request levels, and system calls.
- *Category 4: Enterprise Networking & Protocols (Q31–Q40):* Framing, TCP/IP handshakes, Path MTU discovery, socket triage, and DNS hierarchies.
- *Category 5: Cybersecurity & Hardware Trust (Q41–Q50):* TPM 2.0, Secure Boot cryptochains, zero-trust architectures, and post-quantum standards.
- *Category 6: Role-Based Live Troubleshooting Scenarios (Q51–Q60):* Multi-variable diagnostic challenges in production enterprise environments.

#pagebreak()

= CATEGORY 1: CORE COMPUTER FUNDAMENTALS PRACTICE

#short-qa(num: 1,
  q: "[RTechLab Practice Question] Trace the end-to-end dataflow of an Input-Process-Output-Storage (IPOS) cycle using a modern multi-core system example.",
  a: "The IPOS cycle models the fundamental flow of data: 1. *Input:* Peripheral generates hardware event (e.g. USB keyboard packet via xHCI host controller transferred across PCIe to system RAM). 2. *Process:* CPU fetches instruction via L1-I cache, decodes into micro-ops, dispatches to ALU/vector units, and updates architectural registers. 3. *Output:* Rendered frame data is transferred to GPU VRAM across PCIe x16 for display output via DisplayPort. 4. *Storage:* Application state is flushed from volatile DRAM to NVMe SSD via Direct Memory Access (DMA) storage controllers."
)

#short-qa(num: 2,
  q: "[RTechLab Practice Question] What is the Von Neumann Bottleneck, and what hardware strategies mitigate its impact?",
  a: "The Von Neumann bottleneck arises from sharing a single physical bus between instruction fetch and data operand transfers, causing the CPU to stall while waiting for slow DRAM access. *Hardware Mitigations:* 1. Split L1 Caches (separate L1 Instruction and L1 Data caches). 2. Multi-level hierarchical on-die caches (L2 and shared L3) operating near processor clock speeds. 3. Hardware prefetchers and Out-of-Order Execution (OoOE) engines that speculative retrieve data operands before execution units require them."
)

#short-qa(num: 3,
  q: "[RTechLab Practice Question] Differentiate Little-Endian from Big-Endian byte order. Why is network byte order standardized?",
  a: "Endianness defines the memory sequence for multi-byte data: *Little-Endian (x86-64, ARM default):* Least Significant Byte (LSB) resides at the lowest memory address (e.g. `0x12345678` stored as `78 56 34 12`). *Big-Endian:* Most Significant Byte (MSB) resides at the lowest address (`12 34 56 78`). *Network Standard:* RFC 1700 standardizes Big-Endian as the universal Network Byte Order for IP/TCP headers to ensure uniform packet parsing across heterogeneous CPU architectures."
)

#short-qa(num: 4,
  q: "[RTechLab Practice Question] Contrast MBR (Master Boot Record) and GPT (GUID Partition Table) partitioning schemes.",
  a: "1. *Addressing Capacity:* MBR uses 32-bit Logical Block Addressing (LBA), capping volume size at 2.2 TB (with 512-byte sectors). GPT uses 64-bit LBA, supporting disks up to 9.4 ZB. 2. *Partitions:* MBR supports 4 primary partitions (or 3 primary + 1 extended). GPT supports 128 primary partitions by default. 3. *Redundancy:* MBR has a single boot sector at LBA 0 (single point of failure). GPT maintains a primary header at LBA 1 and an automatic backup copy at the end of the physical drive, validated via CRC32 checksums."
)

#short-qa(num: 5,
  q: "[RTechLab Practice Question] Distinguish the execution environments of Legacy BIOS versus UEFI firmware.",
  a: "Legacy BIOS executes in 16-bit real mode, restricted to 1 MB of memory address space, and initializes hardware sequentially. UEFI executes in 32-bit or 64-bit protected execution mode, addresses gigabytes of memory, loads modular C-based device drivers, provides native GPT and Secure Boot cryptographic support, and supports pre-boot network stacks."
)

#pagebreak()

= CATEGORY 2: HARDWARE & MICROARCHITECTURE PRACTICE

#short-qa(num: 11,
  q: "[TCS Systems Track - Practice Style] How does 2's complement representation eliminate negative zero ambiguity in ALU design?",
  a: "In 1's complement, bitwise inversion produces two representations for zero (`00000000` for +0, `11111111` for -0), requiring specialized comparison hardware. 2's complement ($~x + 1$) yields a unique zero (`00000000`), provides an additional negative value (e.g. -128 in 8-bit), and allows binary addition and subtraction to share the exact same physical adder circuitry."
)

#short-qa(num: 12,
  q: "[TCS Systems Track - Practice Style] Compare SRAM and DRAM cell physics, access latencies, and circuit density.",
  a: "SRAM (used in CPU caches) uses a 6-transistor cross-coupled bistable latch (6T cell). It retains state without refreshing as long as power is applied, offering access latencies of $1 - 4$ cycles, but requires larger silicon area. DRAM (main memory) stores charge on a single capacitor with one access transistor (1T-1C cell), achieving high density at lower cost, but requires periodic electrical refresh cycles (tREFI) and incurs $60 - 80$ ns access latencies."
)

#short-qa(num: 13,
  q: "[Hardware Practice] Explain the architectural function of On-Die ECC in DDR5 and why it differs from server-grade sideband ECC.",
  a: "DDR5 On-Die ECC (ODECC) operates exclusively inside the physical DRAM silicon die, calculating and correcting single-bit faults within memory cells during read/write operations to maintain manufacturing yields on dense semiconductor nodes. *Crucial Distinction:* ODECC does not protect data in transit across the memory bus to the CPU. True server-grade sideband ECC uses extra physical data bits per subchannel and memory controller logic to provide end-to-end data integrity across the bus."
)

#short-qa(num: 14,
  q: "[Hardware Practice] Calculate the raw theoretical unidirectional bandwidth of a PCIe 6.0 x16 slot.",
  a: "PCIe 6.0 specifies 64 GT/s per lane using PAM4 (Pulse Amplitude Modulation 4-level) encoding, which transmits 2 bits per electrical baud cycle. Raw unidirectional transfer rate per lane = 8 GB/s. For a full x16 slot: $16 times 8 \"GB/s\" = 128 \"GB/s\"$ raw unidirectional bandwidth ($approx 256$ GB/s bidirectional). Real-world usable payload throughput is slightly lower due to Flit framing and packet protocol headers."
)

#short-qa(num: 15,
  q: "[Hardware Practice] What is the operational purpose of the PWR_OK supervisory line on Pin 8 of an ATX power supply?",
  a: "PWR_OK is a +5V logic signal generated by the PSU internal supervisory comparator. It asserts only after all DC rails (+12V, +5V, +3.3V) have stabilized within legal voltage tolerance limits for 100 to 500 ms. While PWR_OK remains low (0V), the motherboard chipset holds the CPU in hardware reset to prevent data corruption from under-voltage brownouts."
)

#pagebreak()

= CATEGORY 3: OPERATING SYSTEMS & MEMORY PRACTICE

#short-qa(num: 21,
  q: "[OS Practice] Differentiate between Paging and Segmentation in virtual memory management.",
  a: "*Paging:* Divides physical memory into fixed-size frames and logical memory into pages of identical size (typically 4 KB). It eliminates external fragmentation, but causes minor internal fragmentation in partially filled pages. *Segmentation:* Divides address space into variable-sized logical segments reflecting program structure (Code, Stack, Heap). It eliminates internal fragmentation, but causes external fragmentation requiring memory compaction."
)

#short-qa(num: 22,
  q: "[OS Practice] Distinguish between a Process and a Thread at the architectural kernel level.",
  a: "A *Process* is an isolated execution instance possessing a dedicated virtual address space, file descriptor table, and security token, represented by a Process Control Block (PCB). A *Thread* is the smallest schedulable execution entity within a process, tracked by a Thread Control Block (TCB). Threads in the same process share the virtual address space, heap, and open handles, but maintain private stacks, register states, and program counters."
)

#short-qa(num: 23,
  q: "[OS Practice] What is System Thrashing in virtual memory, and what metric indicates its occurrence?",
  a: "Thrashing occurs when the collective working sets of active processes exceed available physical RAM. The OS spends the vast majority of CPU cycles swapping pages between memory and disk pagefiles rather than executing application code. It is characterized by near-zero CPU productive utilization alongside 100% disk active time and elevated page fault rates (`Pages/sec`)."
)

#short-qa(num: 24,
  q: "[Microsoft Systems Practice Style] Why does IRQL_NOT_LESS_OR_EQUAL trigger an immediate Blue Screen (BSOD)?",
  a: "Windows enforces Interrupt Request Levels (IRQLs). Memory pages residing in secondary storage pagefiles can only be paged in at `PASSIVE_LEVEL` or `APC_LEVEL` because page fault resolution requires disk I/O. If kernel code or a driver executing at `DISPATCH_LEVEL` (IRQL 2) or above accesses paged-out memory, the kernel cannot perform disk I/O to retrieve it, triggering an unrecoverable `0x0000000A` bugcheck."
)

#short-qa(num: 25,
  q: "[Google Systems Practice Style] How do Linux Huge Pages (2 MB / 1 GB) improve database throughput?",
  a: "Standard 4 KB pages require vast numbers of page table entries to map gigabytes of memory, frequently overflowing the CPU Translation Lookaside Buffer (TLB). 2 MB Huge Pages reduce the number of required page table entries by a factor of 512, substantially improving TLB coverage and eliminating page-table walk latency overhead in database buffer pools."
)

#pagebreak()

= CATEGORY 4: ENTERPRISE NETWORKING PRACTICE

#short-qa(num: 31,
  q: "[Cisco TAC Practice Style] A Gigabit Ethernet interface registers escalating CRC errors. Detail the physical triage steps.",
  a: "Cyclic Redundancy Check (CRC) errors indicate frame corruption at Layer 1/2. *Triage Steps:* 1. Inspect physical Cat6 patch cable and RJ45 crimp terminations; verify length does not exceed 100 meters. 2. Check for nearby electromagnetic interference (EMI) sources (fluorescent ballasts, high-voltage conduits). 3. On fiber interfaces, inspect SFP+ optical transceiver receive power levels and clean fiber ferrule end-faces. 4. Verify duplex autonegotiation to eliminate half-duplex collisions."
)

#short-qa(num: 32,
  q: "[Cisco TAC Practice Style] Explain Path MTU Discovery (PMTUD) and what conditions create an MTU Black Hole.",
  a: "PMTUD sets the Don't Fragment (DF) bit in IPv4 packet headers. If an intermediate router cannot forward a packet without exceeding downstream MTU, it drops the packet and returns an ICMP Type 3 Code 4 (*Fragmentation Needed*) message containing the next-hop MTU. *MTU Black Hole:* If an upstream firewall blocks all ICMP messages, the sending host never receives notification of packet drops and repeatedly retransmits oversized packets, causing TCP connections to hang indefinitely."
)

#short-qa(num: 33,
  q: "[Networking Practice] How does the TCP 3-way handshake establish sequence synchronization and protect against SYN floods?",
  a: "The client sends a SYN packet with Initial Sequence Number (ISN) $A$. The server replies with SYN-ACK, synchronizing its own ISN $B$ and acknowledging $A+1$. The client confirms with ACK $B+1$. In a SYN Flood, an attacker floods unacknowledged SYNs to exhaust server connection backlog memory. *SYN Cookies:* The server encodes connection state into the 32-bit ISN $B$, eliminating state allocation in kernel memory until the final verified ACK arrives."
)

#short-qa(num: 34,
  q: "[Networking Practice] Detail the iterative DNS resolution sequence for an un-cached fully qualified domain name.",
  a: "1. Client Stub Resolver queries configured Recursive Resolver (e.g. ISP or 8.8.8.8). 2. Recursive Resolver queries Root Nameserver (`.`), receiving a referral to the TLD nameserver (`.com`). 3. Resolver queries TLD Nameserver, receiving a referral to the domain's Authoritative Nameserver. 4. Resolver queries Authoritative Nameserver, receiving the authoritative A/AAAA IP address. 5. Resolver caches record per TTL and delivers IP to client."
)

#pagebreak()

= CATEGORIES 5 & 6: SECURITY & LIVE TROUBLESHOOTING SCENARIOS

#short-qa(num: 41,
  q: "[Security Practice] How does FIDO2 / WebAuthn provide cryptographic immunity against phishing?",
  a: "FIDO2 passkeys utilize public-key cryptography where private keys never leave the client authenticator (TPM or security key). During authentication, the browser cryptographically binds the authentication response to the exact domain origin (Relying Party ID) in the browser address bar. Even if a user enters credentials on a malicious clone site (e.g. `examp1e.com`), the origin signature will not match the genuine service, completely preventing credential harvesting."
)

#short-qa(num: 42,
  q: "[Security Practice] What are the three primary Post-Quantum Cryptography standards finalized by NIST?",
  a: "In August 2024, NIST published: 1. *FIPS 203 (ML-KEM):* Module-Lattice-Based Key-Encapsulation Mechanism for general encryption. 2. *FIPS 204 (ML-DSA):* Module-Lattice-Based Digital Signature Algorithm for primary software signatures. 3. *FIPS 205 (SLH-DSA):* Stateless Hash-Based Digital Signature Algorithm providing an alternative signature mechanism based on hash trees."
)

#short-qa(num: 51,
  q: "[Amazon AWS / SysAdmin Scenario] A bare-metal server is completely unresponsive over SSH and networking. How do you triage it out-of-band?",
  a: "Connect to the dedicated Out-of-Band Management network interface via Baseboard Management Controller (BMC) / IPMI / iDRAC. 1. Inspect hardware sensor health (chassis intrusion, PSU redundant feeds, thermal sensors). 2. Open KVM-over-IP console redirection to inspect the virtual display for kernel panic, BSOD, or hardware hang. 3. If OS is unresponsive, issue a graceful ACPI shutdown request; if non-responsive, execute a chassis hardware power cycle via IPMI CLI (`ipmitool power cycle`)."
)

#short-qa(num: 52,
  q: "[Enterprise Support Scenario] A user reports a desktop powers on with fans spinning at 100% RPM, but displays a black screen and never reaches POST. Detail your triage tree.",
  a: "1. *Diagnostic LEDs / Beep Codes:* Check motherboard Q-LEDs (CPU, DRAM, VGA, BOOT) or listen for chassis beep codes to isolate the failed initialization stage. 2. *Memory Verification:* Reseat DIMMs in recommended primary slots (A2/B2). Test with a single known-good DIMM in Slot A2. 3. *Display Output:* Confirm monitor cable is connected directly to discrete GPU PCIe ports, not disabled motherboard video outputs. 4. *CMOS Clearing:* Perform manufacturer-compliant Clear CMOS procedure using jumper or button to reset corrupted memory training settings. 5. *Power Verification:* Test ATX rails and PWR_OK line using a dedicated digital PSU tester."
)
