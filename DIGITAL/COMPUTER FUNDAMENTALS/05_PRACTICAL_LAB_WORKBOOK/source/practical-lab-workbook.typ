#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab Practical Lab Workbook — Computer Fundamentals 2027 (V5.1.4 FINAL)",
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
  title: "HANDS-ON DIAGNOSTIC LAB WORKBOOK",
  subtitle: "8 Production Labs · Terminal CLI Worksheets · Hardware Verification Checklists",
  edition: "2027 CAREER ACCELERATOR EDITION · V5.1.4 FINAL",
  series-pill: "RTECHLAB COMMERCIAL SUITE · PRODUCTION WORKBOOK V5.1.4",
  author: "Rahul Patel",
  author-title: "Founder and Chief Technology Architect, RTechLab",
  subject-code: "RTL-2027-FUND-V5.1.4",
  logo-path: "/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/digital-multimeter-testing.jpg"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Computer Fundamentals Practical Lab Workbook",
  edition: "2027 Career Accelerator Edition · V5.1.4 FINAL Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-FUND-V5.1.4"
)

#pagebreak()

= WORKBOOK BLUEPRINT & SAFETY BRIEFING

#concept-box(title: "ENTERPRISE HANDS-ON PHILOSOPHY")[
  At RTechLab, our foundational tenet is _"Technology Made Practical"_. Theoretical knowledge without terminal fluency, rigorous methodology, and safety-verified hardware diagnostic capability is insufficient for modern enterprise IT operations. This workbook provides 8 structured production lab worksheets, complete with command syntax, expected terminal outputs, hardware verification checklists, and systematic troubleshooting decision trees used by L1/L2 Technical Support Engineers, Systems Administrators, and Field Engineers.
]

#warning-box(title: "LABORATORY SAFETY & ELECTRICAL DISCIPLINE")[
  Before performing any physical hardware inspection, diagnostic probing, or component replacement:
  - *Mains Isolation:* Always disconnect the AC power cord from the power supply unit (PSU) and depress the chassis power button for 10 seconds to bleed residual energy from bulk filtering capacitors.
  - *ESD Protection:* Work on an ESD-dissipative work surface connected to a verified ground point. Use a properly fitted ESD wrist strap containing an integrated 1 M$Omega$ current-limiting safety resistor. _Crucial Safety Distinction: An ESD wrist strap protects sensitive low-voltage semiconductor components against electrostatic discharge; it does NOT protect humans against mains electric shock._
  - *Never Open Power Supplies:* Never disassemble, unseal, or probe inside a sealed Power Supply Unit (PSU) enclosure or CRT display. Internal high-voltage capacitors store lethal electrical energy ($> 400$ V) long after AC mains disconnection.
  - *Component Guidance:* Always consult the specific motherboard, chassis, and component manufacturer manuals before testing or modifying system connections.
]

#v(8pt)
#table(
  columns: (1.2fr, 2.5fr, 1.8fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rtech-navy) } else { 0.5pt + rtech-border },
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else if calc.even(row) { rgb("#FFFFFF") } else { rgb("#F8FAFC") },
  inset: (x: 8pt, y: 7pt),
  [*Lab Module*], [*Core Practical Skills & Terminal Tooling*], [*Industry Target Role*],
  [Lab 01: ATX PSU Testing & Power Rails], [Standby vs Main rails, Multimeter probing, PWR_OK diagnostic triage], [Hardware Tech, Field Support],
  [Lab 02: RAM Topology & Dual-Channel], [Daisy-chain routing, A2/B2 rules, DDR5 subchannels, CIM memory audit], [L1/L2 Desktop Engineer],
  [Lab 03: BIOS/UEFI & CMOS Procedures], [Clear CMOS methods, manufacturer jumpers, Secure Boot, TPM 2.0], [Systems Admin, IT Specialist],
  [Lab 04: Storage Health & OS Repair], [S.M.A.R.T. telemetry, targeted DISM/SFC triage, MBR2GPT validation], [NOC Tech, Storage Admin],
  [Lab 05: Network Troubleshooting & Ports], [Process verification, graceful termination, MTU framing, ICMP caveats], [NOC Engineer, Network Admin],
  [Lab 06: Windows Crash & BSOD Triage], [Event ID 41 context, BugCheck 1001, Minidump analysis boundaries], [L2 Escalation Support],
  [Lab 07: Linux Hardware Diagnostics], [CLI prerequisites (`lspci`, `lshw`, `lsblk`), SMBIOS vs live EDAC ECC], [Linux SysAdmin, Cloud Infra],
  [Lab 08: Fan Care, Thermal & Battery Safety], [Bearing-safe cleaning, thermal paste compatibility, swollen battery EHS], [Data Center Operations]
)

#pagebreak()

= LAB 01: ATX POWER SUPPLY TESTING & RAIL DIAGNOSTICS

== Objective
Understand safe ATX power supply diagnostic conditions, distinguish standby from operational power rails, verify the supervisory PWR_OK timing signal, and execute a structured power triage decision tree.

== 1. Power Supply Voltage Rail Classification (ATX 3.0 Standard)
An ATX power supply delivers multiple regulated DC voltage rails to the motherboard and peripherals:
- *Standby Rail (+5VSB, Pin 9, Purple):* Continuously active whenever the PSU is connected to live AC mains, regardless of whether the PC is powered on. Powers the Baseboard Management Controller (BMC), network wake circuitry (WoL), real-time clock, and power button monitoring logic.
- *Main Operational Rails (+12V, +5V, +3.3V, -12V):* Energized only after the power supply receives an active-low power-on request (`PS_ON#`, Pin 16, Green wire grounded).
- *Power Good Signal (`PWR_OK`, Pin 8, Gray):* A +5V logic-level supervisory signal asserted by the PSU internal monitoring circuit only after all output rails (+12V, +5V, +3.3V) have stabilized within legal tolerances for 100 to 500 ms.

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.5fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { white },
  inset: (x: 7pt, y: 6pt),
  [*Pin Number*], [*Signal Name*], [*Wire Color*], [*Nominal Voltage & Legal Tolerance (ATX 3.0)*],
  [Pins 1, 2, 12, 13], [+3.3 VDC], [Orange], [+3.135 V to +3.465 V ($plus.minus 5%$)],
  [Pins 4, 6, 19, 20, 21], [+5.0 VDC], [Red], [+4.750 V to +5.250 V ($plus.minus 5%$)],
  [Pins 10, 11], [+12.0 VDC], [Yellow], [+11.400 V to +12.600 V ($plus.minus 5%$)],
  [Pin 9], [+5.0 VSB (Standby)], [Purple], [+4.750 V to +5.250 V (Live whenever AC is connected)],
  [Pin 8], [PWR_OK (Power Good)], [Gray], [+4.750 V to +5.250 V (Asserts 100-500 ms after rails stabilize)],
  [Pin 14], [-12.0 VDC], [Blue], [-10.800 V to -13.200 V ($plus.minus 10%$ legacy rail)]
)

== 2. Safe Bench-Testing Protocol (Jumper / Dummy Load Method)
_Safety Prerequisite:_ Never test a PSU on conductive surfaces. Always place the unit on an insulated mat. Never open the PSU housing.

1. Disconnect all cables from the motherboard, GPU, and storage drives to isolate external component shorts.
2. Connect a small verified load (such as an auxiliary 12V case fan connected via Molex or SATA adapter) to provide minimum electrical loading on the rails.
3. Locate *Pin 16 (`PS_ON#`, Green wire)* and any adjacent *Ground pin (Black wire, Pins 15, 17, or 18)* on the 24-pin ATX connector.
4. Insert an insulated jumper bridge or paperclip between Pin 16 and Ground. Connect the AC mains cord and flip the rear rocker switch to ON.
5. Set your Digital Multimeter (DMM) to *DC Volts (20V range)*. Connect the Black probe to chassis ground (any Black wire) and probe pins with the Red probe.
6. _Recommended Alternative:_ In production workshop environments, utilize a certified digital ATX PSU tester with an LCD readout, which automatically measures all rail voltages and displays PWR_OK delay in milliseconds.

== 3. Diagnostic Decision Tree: Interpreting Missing PWR_OK
A missing or abnormal PWR_OK signal ($< 4.5$ V or 0 V) is a critical diagnostic finding, but it is *not automatic proof that the PSU itself is permanently defective*:
- *Possibility A (Load-Side Short Circuit):* If PWR_OK fails when connected to the motherboard but passes on the bench with a jumper test, a shorted VRM MOSFET, defective PCIe card, or bent USB header pin is triggering the PSU Over-Current (OCP) or Short-Circuit Protection (SCP).
- *Possibility B (Minimum Load Requirement):* Certain legacy group-regulated power supplies fail to regulate rails or assert PWR_OK when completely unloaded.
- *Possibility C (PSU Supervisory Fault):* If PWR_OK remains at 0V even with an isolated bench dummy load while rails read within tolerance, the internal supervisory comparator IC is defective. In this scenario, the motherboard will hold the CPU in continuous hardware reset, preventing POST.
- *Action:* Confirm findings with a known-good PSU or dedicated hardware tester before disposing of components.

#pagebreak()

= LAB 02: RAM TOPOLOGY, CHANNEL ROUTING & DDR5 AUDIT

== Objective
Understand motherboard memory trace routing topologies, determine manufacturer-authoritative DIMM population sequences, analyze DDR5 subchannel architecture, and audit memory hardware via PowerShell.

== 1. Memory Channel Topology: Daisy-Chain vs T-Topology
Motherboard trace design dictates how high-speed electrical signals travel between the CPU memory controller and physical DIMM slots:
- *Daisy-Chain Topology (Common on Consumer 4-Slot Motherboards):* Memory traces route from the CPU memory controller to Slot 1 (A1), continuing directly to terminate at Slot 2 (A2); similarly, traces route to Slot 3 (B1) and terminate at Slot 4 (B2).
  - When only two DIMMs are installed, populating the end-of-line slots (*Slots 2 & 4 / A2 & B2*) avoids leaving an unterminated trace stub between the populated slot and an empty slot. This reduces high-frequency signal reflections and maximizes signal integrity at elevated memory frequencies (XMP/EXPO $> 6000$ MT/s).
  - Populating A1 and B1 on a daisy-chain board leaves physical trace stubs running to empty slots A2 and B2, which can cause signal degradation, though it does not universally guarantee system failure.
- *T-Topology (Common on Certain Multi-DIMM Workstation Boards):* Traces split equally from a central node to both slots in a channel, providing balanced signal trace lengths optimized for running 4 DIMMs simultaneously.
- *Authoritative Rule:* _Always consult the specific motherboard manufacturer manual._ The manual defines the exact tested and validated 1-DIMM, 2-DIMM, and 4-DIMM installation matrix for your specific board revision.

== 2. DDR5 Subchannel Architecture Explained
A common misconception is that a single DDR5 DIMM provides traditional dual-channel operation:
- *Physical Architecture:* A standard DDR4 DIMM operates with a single 64-bit wide data bus (plus 8 ECC bits on server modules).
- *DDR5 Split-Subchannel Design:* DDR5 maintains a 64-bit primary data interface per CPU channel, but splits each physical DIMM into *two independent 32-bit subchannels* (Subchannel A and Subchannel B), each with its own 8-bit ECC data path (40 bits total per subchannel).
- *Operational Advantage:* This allows two independent 32-byte memory transactions to execute simultaneously on a single DIMM, significantly improving bus efficiency and reducing latency. However, full dual-channel system bandwidth still requires populating two physical DIMMs across both distinct CPU memory channels (Channel A and Channel B).

== 3. Windows PowerShell Memory Subsystem Audit
Run Windows PowerShell as Administrator to query the physical memory configuration without disassembling the chassis:

```powershell
Get-CimInstance Win32_PhysicalMemory | 
Select-Object BankLabel, DeviceLocator, Capacity, Speed, ConfiguredClockSpeed, Manufacturer, PartNumber | 
Format-Table -AutoSize
```

#v(4pt)
*Expected Production Output:*
```
BankLabel DeviceLocator Capacity    Speed ConfiguredClockSpeed Manufacturer PartNumber
--------- ------------- --------    ----- -------------------- ------------ ----------
BANK 1    DIMM_A2       17179869184  6000  6000                 Corsair      CMK32GX5M2B6000C30
BANK 3    DIMM_B2       17179869184  6000  6000                 Corsair      CMK32GX5M2B6000C30
```

- *Verification Step 1:* Confirm `DeviceLocator` matches manufacturer recommendations (e.g. `DIMM_A2` and `DIMM_B2`).
- *Verification Step 2:* Compare `Speed` (advertised rating) with `ConfiguredClockSpeed` (active speed). If `ConfiguredClockSpeed` reads 4800 MT/s while `Speed` is 6000 MT/s, enter UEFI setup and enable the XMP or AMD EXPO memory profile.

#pagebreak()

= LAB 03: BIOS/UEFI HARDENING & CMOS RESET PROCEDURES

== Objective
Perform manufacturer-compliant CMOS reset procedures, configure enterprise UEFI firmware security (Secure Boot, TPM 2.0), and analyze platform security requirements.

== 1. CMOS Reset: Manufacturer-Specific Procedures
When an unstable memory overclock, corrupted firmware parameter, or forgotten administrator password prevents POST, resetting non-volatile CMOS/NVRAM configuration registers restores factory defaults:
- *Procedure A: Dedicated Clear CMOS Button (Workstation / High-End Boards):* Disconnect AC mains power. Depress the rear I/O or onboard \"Clear CMOS\" button for 5 to 10 seconds. Reconnect power and power on.
- *Procedure B: 2-Pin CLRTC / CLEAR_CMOS Jumper Header:* Disconnect AC mains power. Consult the motherboard manual to identify the exact 2-pin header location. _Never short unidentified motherboard pins._ Use a jumper block or flat screwdriver tip to bridge the two designated pins for 5 to 10 seconds. Remove the bridge before reconnecting AC power.
- *Procedure C: Coin-Cell Battery Removal (Where Applicable):* Disconnect AC mains. Depress the chassis power button for 10 seconds to drain standby circuits. Use a non-conductive plastic spudger to release the CR2032 lithium battery. Wait 5 minutes for RTC memory capacitors to discharge. Reinsert battery with positive (+) side facing up.
  - _Important Caveat:_ Removing the coin-cell battery is not universally the preferred method; on modern boards with non-volatile flash storage or buried batteries under integrated armor/heatsinks, the jumper or button method is mandatory.

== 2. Enterprise Platform Security: Beyond TPM 2.0
While TPM 2.0 is a mandatory prerequisite for modern operating systems (such as Windows 11), a secure platform requires a comprehensive hardware-and-firmware security chain:
1. *TPM 2.0 (Trusted Platform Module):* Provides hardware cryptographic key generation, secure storage, and Platform Configuration Register (PCR) measurements. Run `tpm.msc` to verify status: *\"The TPM is ready for use\"* with Specification Version *2.0*.
2. *UEFI Secure Boot:* Cryptographically validates digital signatures on bootloaders, OS kernels, and option ROMs against factory-enrolled Platform Keys (PK) and Key Exchange Keys (KEK).
3. *VBS (Virtualization-Based Security) & HVCI:* Uses hardware CPU virtualization extensions (Intel VT-x / AMD-V) to run a secure micro-kernel isolated from the host OS, preventing kernel-level code injection.

```powershell
# PowerShell Platform Security Audit
Get-Tpm | Select-Object TpmPresent, TpmReady, TpmEnabled
Confirm-SecureBootUEFI
Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard | 
Select-Object SecurityServicesRunning
```

#pagebreak()

= LAB 04: STORAGE HEALTH & WINDOWS REPAIR WORKFLOW

== Objective
Extract hardware S.M.A.R.T. health telemetry from solid-state and mechanical storage drives, apply targeted Windows system repair utilities appropriately, and validate MBR2GPT conversion prerequisites.

== 1. S.M.A.R.T. Disk Telemetry Extraction
Run PowerShell as Administrator to query disk health status:
```powershell
Get-PhysicalDisk | Select-Object DeviceId, FriendlyName, MediaType, BusType, OperationalStatus, HealthStatus | Format-Table -AutoSize
```
- For deep-dive NVMe telemetry (temperature, available spare percentage, unsafe shutdowns, media errors), use vendor-specific diagnostic tools (Samsung Magician, Crucial Storage Executive) or Linux `smartctl -a /dev/nvme0`.
- _Data Safety Rule:_ If HealthStatus indicates `Unhealthy` or S.M.A.R.T. reports reallocated sectors or depleted spare capacity, *immediately backup user data* before executing any intensive disk scans or repairs.

== 2. Targeted Windows System File Repair Workflow
Windows repair utilities must be applied selectively based on the specific failure mode, rather than as an automatic blanket sequence:

1. *DISM (Deployment Image Servicing and Management):*
   ```powershell
   DISM /Online /Cleanup-Image /RestoreHealth
   ```
   - _When to Apply:_ Used when system file corruption is suspected, after severe BSOD events, or when SFC reports that it cannot repair files because the local component store is damaged. DISM downloads verified component manifests directly from Windows Update.
2. *SFC (System File Checker):*
   ```powershell
   sfc /scannow
   ```
   - _When to Apply:_ Scans protected Windows operating system files and replaces corrupted or missing files using clean cached copies from the Windows Component Store.
3. *CHKDSK (Check Disk) Considerations:*
   - `chkdsk C: /f`: Fixes logical file system errors, directory entries, and security descriptors on the volume. Fast execution (minutes).
   - `chkdsk C: /r`: Locates bad sectors on mechanical drives and attempts to recover readable information (includes `/f`).
   - _Important Practice:_ Do *not* run `chkdsk /r` routinely on healthy SSDs or as an automatic third step for generic software glitches. Surface-read scans on large multi-terabyte drives take hours and subject failing drives to prolonged physical stress. Run CHKDSK only when file system corruption is reported in Event Viewer.

== 3. MBR2GPT Non-Destructive Conversion Protocol
To convert an existing Windows installation from legacy BIOS MBR to native UEFI GPT without formatting:
- *Mandatory Prerequisites:* 1. The target disk must contain at most 3 primary partitions. 2. No extended or logical partitions may exist. 3. BitLocker must be suspended. 4. Complete data backup must be verified.
- *Step 1: Validation:* `mbr2gpt /validate /disk:0 /allowFullOS`
- *Step 2: Conversion:* `mbr2gpt /convert /disk:0 /allowFullOS`
- *Step 3: Firmware Configuration:* Immediately reboot into UEFI setup, disable CSM (Compatibility Support Module), and select UEFI Boot. _Note: While non-destructive under supported conditions, disk partition conversion carries inherent risks; never proceed without an external backup._

#pagebreak()

= LAB 05: NETWORK TROUBLESHOOTING & SOCKET PORT CONFLICTS

== Objective
Diagnose network socket binding conflicts, execute safe process termination, understand ICMP diagnostic boundaries, and perform MTU framing analysis.

== 1. Resolving Socket Port Conflicts Gracefully
When a service fails to start because an IP socket port is already bound (`EADDRINUSE`):

1. *Identify the Conflicting Socket & Process ID (PID):*
   ```cmd
   netstat -ano | findstr :8080
   ```
   *Terminal Output:*
   ```
   TCP    0.0.0.0:8080           0.0.0.0:0              LISTENING       4928
   ```
2. *Identify the Process Name:*
   ```cmd
   tasklist /fi "PID eq 4928"
   ```
3. *Safe Termination Hierarchy:*
   - _Option A (Graceful Service Stop - Preferred):_ If the PID belongs to an enterprise Windows Service (e.g. `w3svc`, `Tomcat`), stop the service gracefully: `net stop <ServiceName>` or through `services.msc`.
   - _Option B (Graceful Process Stop):_ In PowerShell: `Stop-Process -Id 4928` (allows the process to flush files and close sockets cleanly).
   - _Option C (Forceful Kill - Last Resort):_ Only if the process is completely hung and non-responsive: `taskkill /PID 4928 /F`. Always verify process identity before forceful termination to avoid destabilizing system services.

== 2. ICMP Diagnostics & MTU Framing Analysis
1. *ICMP Ping Limitations:* Network ping utilities provide basic round-trip time (RTT) measurements, but results are heavily influenced by network policy:
   - Intermediate routers and firewalls frequently prioritize routing over replying to ICMP echo requests, or drop ICMP entirely. A host failing ping may still be fully operational on HTTPS port 443.
2. *MTU Framing Calculations:* Standard Ethernet frames support a Maximum Transmission Unit (MTU) of 1500 bytes. When testing path MTU using the Don't Fragment (DF) flag:
   - *IPv4 Header:* 20 bytes base.
   - *ICMP Header:* 8 bytes.
   - *Maximum ICMP Payload:* $1500 - 20 - 8 = 1472$ bytes.
   ```cmd
   ping 8.8.8.8 -f -l 1472
   ```
   - For IPv6 connections, the base IP header is 40 bytes; hence the maximum payload for a 1500-byte MTU is $1500 - 40 - 8 = 1452$ bytes.
3. *Diagnosing MTU Mismatch vs Other Web Failures:* If ICMP returns `Packet needs to be fragmented but DF set`, an intermediate tunnel (e.g. PPPoE or VPN) has a smaller MTU (such as 1492 or 1400 bytes). However, never assume every web loading issue is an MTU fault; web page stalls are frequently caused by DNS resolution failures, TLS certificate validation timeouts, proxy misconfigurations, or Content Delivery Network (CDN) edge outages.

#pagebreak()

= LAB 06: WINDOWS CRASH & BSOD EVENT LOG TRIAGE

== Objective
Extract and interpret Windows Event Viewer crash records, configure dump generation parameters, and recognize the diagnostic boundaries of minidump crash analysis.

== 1. Kernel-Power Event ID 41 Context & Nuance
When Windows experiences an unexpected reboot, Event Viewer records *Event ID 41 (Kernel-Power)* in the System log:
- *Diagnostic Meaning:* Event ID 41 indicates solely that the operating system was shut down or restarted without first completing a clean ACPI shutdown sequence.
- *Crucial Diagnostic Nuance:* A `BugcheckCode` of `0` in Event ID 41 does *not* automatically prove power supply failure. A zero BugCheck code simply means the operating system did not execute a blue screen error handler before power was lost. Possible root causes include:
  - External AC mains power interruption or tripped wall circuit breaker.
  - User manually holding down the chassis power button for 5 seconds (hard power-off).
  - Thermal emergency shutdown triggered directly by motherboard hardware monitoring logic when CPU reaches critical junction temperature ($T_j "Max"$).
  - Unstable CPU core voltage / overclocking droop causing immediate silicon halt.
  - Motherboard VRM over-current or over-temperature protection trip.

== 2. Event ID 1001 & Memory Dump Configuration
When Windows successfully catches a fatal kernel condition before rebooting, it writes *Event ID 1001 (BugCheck)*, recording the exact stop code and dump file path:
1. *Configuring Small Memory Dumps (Minidumps):* Press `Win + R` -> `sysdm.cpl` -> `Advanced` -> `Startup and Recovery Settings` -> Select *Small memory dump (256 KB)* in `%SystemRoot%\Minidump`.
2. *Minidump Diagnostic Scope & Limitations:*
   - Minidumps record the active processor state, instruction pointer (`RIP`), calling thread stack trace, and list of loaded kernel drivers (`.sys` files).
   - *Limitations:* Minidumps do not contain user-mode memory or the full kernel memory space. While tools like WinDbg (`!analyze -v`) can identify the faulting instruction and driver module, the identified driver is not always the root cause (a third-party antivirus filter driver or hardware memory parity error can corrupt memory structures that later cause an innocent Microsoft driver to crash).

== 3. Contextual Interpretation of Common BSOD Codes
- `CRITICAL_PROCESS_DIED (0xEF)`: A core user-mode or system process (e.g. `csrss.exe`, `services.exe`) was terminated unexpectedly. Causes range from corrupted OS binaries and driver hooks to storage timeouts—never conclude it is exclusively bad RAM or SSD without corroborating evidence.
- `IRQL_NOT_LESS_OR_EQUAL (0x0A)`: A kernel-mode routine attempted to access paged-out memory at an elevated Interrupt Request Level (IRQL). Typically indicates faulty third-party hardware drivers or memory corruption.
- `WHEA_UNCORRECTABLE_ERROR (0x124)`: Windows Hardware Error Architecture caught a physical CPU cache error, bus parity error, or PCIe device timeout. Check thermal limits, CPU voltages, and PCIe seating.

#pagebreak()

= LAB 07: LINUX PRODUCTION TERMINAL HARDWARE DIAGNOSTICS

== Objective
Enumerate enterprise hardware subsystems using native Linux command-line utilities, understand package prerequisites and privilege levels, and distinguish static SMBIOS tables from live ECC error telemetry.

== 1. Command Prerequisites & Privilege Requirements
In production enterprise Linux environments (RHEL, Ubuntu Server, Debian, Rocky Linux):
- *Root / Sudo Privileges:* Commands that read raw hardware tables (e.g. `/dev/mem`, `/dev/nvme*`, DMI BIOS structures) require elevated administrative privileges (`sudo`).
- *Package Availability:* While `lspci` and `lsblk` are typically available in base installations (`pciutils`, `util-linux`), utilities such as `lshw`, `dmidecode`, and `nvme-cli` may require package installation:
  ```bash
  sudo apt install pciutils util-linux lshw dmidecode nvme-cli
  ```

== 2. Essential Hardware Enumeration Commands
#table(
  columns: (1.2fr, 2fr, 1.5fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { white },
  inset: (x: 7pt, y: 6pt),
  [*Linux Utility*], [*Diagnostic Function*], [*Key Flags & Parameters*],
  [`lshw`], [Generates structured hardware tree (CPU, bus, disks)], [`sudo lshw -short` (Compact tabular output)],
  [`lspci`], [Lists all PCIe peripheral bus devices and link speeds], [`lspci -tv` (Tree hierarchy with PCIe width/speed)],
  [`lsblk`], [Block storage devices, partition topologies, filesystems], [`lsblk -f` (Displays UUIDs, mountpoints, FSTYPE)],
  [`dmidecode`], [Decodes DMI / SMBIOS firmware tables into text], [`sudo dmidecode -t memory` (DIMM vendor, slot, spec)],
  [`dmesg`], [Kernel ring buffer log reader for driver/hardware events], [`dmesg -T --level=err,warn` (Human timestamps, errors)]
)

== 3. SMBIOS Reporting vs Live ECC Memory Error Counters
A critical distinction in hardware triage is understanding what `dmidecode` actually reports:
- *Static SMBIOS Table Data:* `dmidecode -t memory` (or `-t 16`) decodes static information populated by the BIOS/UEFI firmware during boot. It reports whether the motherboard chipset supports Error Correction Code (ECC) and whether installed DIMMs have ECC capability. *It does not monitor or report active runtime memory errors.*
- *Live Runtime Error Auditing:* To detect live, corrected single-bit or uncorrected multi-bit memory errors, the Linux kernel relies on the *EDAC (Error Detection and Correction)* subsystem:
  ```bash
  # Check for kernel EDAC memory controller error counters
  cat /sys/devices/system/edac/mc/mc*/ce_count  # Corrected Errors
  cat /sys/devices/system/edac/mc/mc*/ue_count  # Uncorrected Errors
  
  # On modern enterprise servers, query the RAS daemon
  sudo ras-mc-ctl --error-count
  ```

#pagebreak()

= LAB 08: FAN MAINTENANCE, THERMAL CARE & BATTERY SAFETY

== Objective
Apply manufacturer-compliant cooling fan cleaning protocols, understand thermal interface materials and solvent compatibility, and enforce workplace hazardous battery life-safety protocols.

== 1. Cooling Fan Maintenance (Preventing Bearing Damage)
When using compressed air (canned air duster or regulated shop compressor) to remove dust from high-RPM cooling fans:
- *Controlled Cleaning Protocol:* Follow manufacturer equipment guidance. Always gently hold or stabilize the fan impeller with a clean, non-conductive plastic probe or gloved finger before discharging compressed air.
- *Engineering Rationale:* High-velocity compressed air streams can force unconstrained fan blades to spin at speeds significantly higher than their designed operational range. This can induce severe aerodynamic bearing stress, displace internal hydrodynamic lubricant, and cause spindle misalignment or blade fracture.
- Use short, controlled bursts from a distance of 15 to 20 cm. Avoid spraying canned duster cans upside down, which discharges liquid propellant (difluoroethane) onto warm electronics, causing thermal shock and component cracking.

== 2. Thermal Interface Material & Solvent Compatibility
- *Solvent Selection:* Use *99% anhydrous Isopropyl Alcohol (IPA)* and lint-free wipes to remove old, hardened thermal compound from metal CPU heat spreaders (IHS) and heatsink copper baseplates.
- *Material Compatibility Warning:*
  - IPA is safe for metal surfaces and exposed silicon dies.
  - *Keep IPA away from acrylics, polycarbonate plastics, and thermal interface pads.* Certain plastics craze, cloud, or become brittle upon contact with high-concentration alcohols, and silicone-based thermal pads absorb alcohol and lose dielectric elasticity.
- *Thermal Paste Application:* Application patterns must match the physical silicon geometry. A central pea-sized dot is effective for standard square desktop CPUs (AM5). For larger oblong or multi-chiplet server heat spreaders (Intel Xeon, AMD EPYC, Threadripper), a five-dot or thin uniform spread method ensures complete edge-to-edge coverage under mounting pressure.

== 3. Swollen Lithium-Ion Battery Workplace Safety Protocol
Lithium-ion pouch batteries in laptops and mobile workstations can experience electrochemical decomposition and internal gas generation (gas pouching) due to overcharging, thermal stress, or internal manufacturing flaws:
1. *Immediate Stop-Use:* Discontinue using the device immediately. Disconnect the AC charger where safe to do so. Power down the system cleanly if possible.
2. *Never Puncture or Compress:* Never attempt to squeeze, flatten, or puncture a swollen battery pouch. Piercing the polymer separator exposes metallic lithium and flammable volatile organic electrolytes to atmospheric oxygen and moisture, triggering instantaneous exothermic thermal runaway ($> 800 degree "C"$), violent flame ejection, and poisonous hydrogen fluoride (HF) gas.
3. *Workplace Isolation:* Relocate the unit to a cool, well-ventilated, non-combustible area away from paper, cardboard, and textiles. Place the device on bare concrete or inside a certified UL 94 fire-resistant battery containment bag or metal bin lined with vermiculite.
4. *Professional Disposal:* Hand over the unit to qualified institutional EHS (Environmental Health and Safety) personnel or certified hazardous waste recyclers. *Never dispose of swollen lithium cells in regular municipal trash, office bins, or standard public battery recycling boxes.*
