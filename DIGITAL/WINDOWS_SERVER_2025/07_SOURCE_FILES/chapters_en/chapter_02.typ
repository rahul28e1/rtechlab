// =============================================================================
// CHAPTER 02: ENTERPRISE LAB SETUP & WINDOWS SERVER 2025 INSTALLATION
// =============================================================================

[#metadata("ch2") <chapter-2>]

#chapter-header(
  chapter-num: "CHAPTER 02",
  category: "PART 2: Hands-On Virtual Lab Setup",
  title: "Practical Enterprise Lab Setup: Windows Server 2025 ISO & VM Configuration",
  subtitle: "System Requirements · Isolated Virtual Network Topology · Microsoft Evaluation Center · VirtualBox VM Deployment · Desktop Experience vs Core"
)

#v(6pt)

=== 2.1 Home Lab System & Hardware Requirements
Mastering Windows Server does not require purchasing expensive physical server rack hardware. Using a #hl-yellow[Type-2 Hypervisor], you can build a complete, production-grade enterprise lab directly on an ordinary consumer laptop or desktop computer.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "Minimum Hardware Specifications")[
      - #text(weight: "bold")[CPU:] 64-bit 1.4 GHz processor (VT-x / AMD-V hardware virtualization enabled).
      - #text(weight: "bold")[RAM:] At least #hl-orange[8 GB RAM] (to comfortably run the host OS plus 1 Server VM).
      - #text(weight: "bold")[Storage:] At least 60 GB available solid-state drive (SSD) space.
    ]
  ],
  [
    #info-box(title: "Recommended Hardware Specifications")[
      - #text(weight: "bold")[CPU:] Modern 4-core / 8-thread processor (Intel Core i5/i7 or AMD Ryzen 5/7).
      - #text(weight: "bold")[RAM:] #hl-green[16 GB or 32 GB RAM] (to run 1 Primary DC + 1 Client Workstation + 1 Secondary DC concurrently).
      - #text(weight: "bold")[Storage:] NVMe M.2 SSD (for rapid VM boot, snapshot operations, and high I/O throughput).
    ]
  ]
)

#v(4pt)

#warning-box(title: "Enable Hardware Virtualization in BIOS / UEFI (Virtualization Error Fix)")[
  If you encounter the error 'VT-x/AMD-V is not available in the host system' while provisioning a virtual machine, reboot your physical computer, enter BIOS/UEFI setup (typically by pressing F2, F10, or Del), and toggle #hl-orange['Intel Virtualization Technology' or 'AMD-SVM / SVM Mode'] to #hl-green[Enabled].
]

#v(6pt)

=== 2.2 Lab Topology & Network Architecture (Isolated Virtual Network)
Our hands-on training lab consists of two core virtual machines communicating across a secure, isolated virtual network:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 2.1: Student Home Lab Architecture — Physical Host, Isolated Virtual Switch, Domain Controller, and Client Workstation]
]

#v(4pt)

- #text(weight: "bold", fill: rtech-blue)[VM 1 (Primary DC - `SRV-2025-DC01`):] Our authoritative Domain Controller running Windows Server 2025 Datacenter. It hosts the Active Directory Domain Services (AD DS), DNS Server, DHCP Server, and File & Storage roles.
- #text(weight: "bold", fill: rtech-emerald)[VM 2 (Client PC - `CLT-WIN11-01`):] An enterprise end-user workstation running Windows 10 or Windows 11 Pro, which will be joined to our corporate domain for directory policy testing.

#v(6pt)

=== 2.3 Downloading the Official Windows Server 2025 ISO (Microsoft Evaluation Center)
Microsoft provides a 180-day, full-featured evaluation license of Windows Server 2025 specifically for IT professionals, students, and engineers:

1. Open your browser and navigate to: #hl-green[`https://www.microsoft.com/en-us/evalcenter/download-windows-server-2025`].
2. Under the Windows Server 2025 section, select #text(weight: "bold")[Download the ISO] and complete the brief registration form.
3. Select #hl-yellow['English (United States)'] as the edition language and download the 64-bit edition ISO file (approximate file size: 5.2 GB).

#pro-tip(title: "180-Day Evaluation License Re-Arm Command")[
  When your 180-day evaluation trial approaches expiration, execute #hl-green[`slmgr.vbs /rearm`] in an elevated Command Prompt to reset the evaluation timer up to 5 times (providing up to 3 cumulative years of valid lab use)!
]

#v(6pt)

=== 2.4 Step-by-Step Virtual Machine Provisioning in Oracle VirtualBox
#step-screenshot(
  step-num: "Step 1",
  title: "Configuring Virtual Machine Hardware Specifications in VirtualBox",
  img-path: "../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png",
  caption: "VM Name: SRV-2025-DC01 | Type: Microsoft Windows | Version: Windows 2025 (64-bit)"
)

1. Launch Oracle VirtualBox and click the #hl-green['New'] button on the primary toolbar.
2. In the Name field, enter: #hl-yellow[`SRV-2025-DC01`]. Set Type to #hl-yellow[`Microsoft Windows`] and Version to #hl-yellow[`Windows 2025 (64-bit)`].
3. #text(weight: "bold")[Memory (RAM) & Processors:] Allocate at least #hl-green[4096 MB (4 GB)] of base memory and assign #hl-green[2 vCPUs] for smooth OS installation.
4. #text(weight: "bold")[Virtual Hard Disk:] Select 'Create a Virtual Hard Disk Now'. Specify a disk size of #hl-yellow[60.00 GB] with 'Dynamically Allocated' storage, ensuring host drive space is consumed only as real data is written inside the VM.
5. #text(weight: "bold")[Network Configuration:] In VM Settings -> Network, set Adapter 1 Attached to #hl-orange['Internal Network' or 'NAT Network']. This isolates your lab environment from home Wi-Fi DHCP conflicts and external network broadcast traffic.

#v(6pt)

=== 2.5 Windows Server 2025 OS Installation Walkthrough
1. Start the virtual machine. When prompted with 'Press any key to boot from CD or DVD...', immediately press #hl-green[Enter].
2. In the regional preferences dialog, select Language: #hl-yellow[English (United States)], Time & Currency Format: #hl-yellow[English (United States)], and Keyboard: #hl-yellow[US], then click 'Next'.
3. On the subsequent splash screen, click #hl-green['Install Now'].
4. When prompted to 'Activate Windows', click the #hl-yellow['I don't have a product key'] link at the bottom of the dialog.

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_setup_os_selection.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 2.2: Operating System Selection Dialog — Mandatory Selection of 'Windows Server 2025 Datacenter (Desktop Experience)']
]

#v(4pt)

#warning-box(title: "Avoid the Critical Pitfall: Server Core vs Desktop Experience")[
  The OS selection dialog displays four edition options. If you accidentally choose 'Windows Server 2025 Datacenter' (without parentheses), the installer will deploy #hl-orange[Server Core (a headless environment with only a black command prompt)]—offering no graphical desktop, no Start menu, and no mouse support! Always explicitly highlight and select #mark-green[Windows Server 2025 Datacenter (Desktop Experience)], which installs the full Graphical User Interface (GUI) and Server Manager.
]

#v(6pt)

5. Review and accept the Microsoft Software License Terms, then click 'Next'.
6. Under installation type, select #hl-yellow['Custom: Install Windows Server only (advanced)'].
7. On the disk partitioning screen, select 'Drive 0 Unallocated Space (60.0 GB)' and click #hl-green['Next'] directly. The Windows setup installer will automatically create the required EFI System, MSR, and Recovery partitions.
8. The file copying and feature installation phase will progress from 0% to 100%, after which the system will automatically reboot.

#v(6pt)

=== 2.6 First Boot & Built-In Administrator Password Configuration
Following the initial reboot, Windows Server presents the #hl-yellow['Customize settings'] configuration screen to initialize the local built-in Administrator account:

- #text(weight: "bold")[User name:] `Administrator` (pre-defined and locked by default).
- #text(weight: "bold")[Password:] Windows Server enforces enterprise password complexity by default, requiring uppercase letters, lowercase letters, numbers, and special symbols. Recommended lab passwords: #hl-green[`P@ssw0rd2025!`] or #hl-green[`Rtechlab@2025`].
- Re-enter the password in the confirmation box and click #hl-green['Finish'].
- The lock screen will appear. To transmit credentials into the virtual machine without intercepting host shortcuts, navigate to VirtualBox menu: #hl-yellow[Input -> Keyboard -> Insert Ctrl+Alt+Del] and enter your password.
- Upon successful authentication, the #mark-yellow[Server Manager Dashboard] will automatically open on the desktop!

#v(8pt)

// =============================================================================
// CHAPTER 02 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  According to Microsoft engineering telemetry, over 70% of Windows Server instances running in global production enterprise datacenters are deployed in #hl-yellow[Server Core] mode without a GUI. By stripping away graphical shells, Server Core reduces RAM overhead by 60%, shrinks the disk footprint to under 10 GB, and eliminates graphical vulnerability surfaces—slashing required security reboot cycles by up to 50%!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 02 Practice Multiple Choice Questions (MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "What is the official evaluation licensing period granted by the Microsoft Evaluation Center for Windows Server 2025?",
  optA: "30 Days",
  optB: "90 Days",
  optC: "180 Days",
  optD: "365 Days",
  ans: "C",
  exp: "Microsoft provides an official 180-day full-featured evaluation trial for enterprise OS testing and laboratory learning."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "Which edition option must be explicitly selected during Windows Server 2025 setup to install the full graphical desktop and Server Manager?",
  optA: "Server Core Edition",
  optB: "Desktop Experience",
  optC: "Nano Server Edition",
  optD: "Hyper-V Server Edition",
  ans: "B",
  exp: "In Windows Server terminology, the complete graphical user interface is officially designated as 'Desktop Experience'."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "What is the correct procedure to inject a Ctrl+Alt+Del keystroke into a VirtualBox VM without intercepting the host operating system?",
  optA: "Press Ctrl+Alt+Del directly on the physical keyboard",
  optB: "Use VirtualBox menu: Input -> Keyboard -> Insert Ctrl+Alt+Del",
  optC: "Type 'exit' in the command prompt",
  optD: "Press the physical host power button",
  ans: "B",
  exp: "Pressing Ctrl+Alt+Del directly opens the physical host's Task Manager; VirtualBox provides a dedicated menu item to send the secure attention sequence to the guest."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Which official Windows command-line utility resets the 180-day evaluation trial activation counter back to day zero?",
  optA: "net stop license",
  optB: "slmgr.vbs /rearm",
  optC: "gpupdate /force",
  optD: "dism /online /enable-feature",
  ans: "B",
  exp: "The Software Licensing Management Tool script `slmgr.vbs /rearm` resets the evaluation grace period timer up to 5 times."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "Which virtual network adapter configuration mode is recommended in hypervisors to isolate lab VMs from home Wi-Fi networks?",
  optA: "Bridged Adapter",
  optB: "Internal Network / Host-Only",
  optC: "Direct Cloud Uplink",
  optD: "Promiscuous Mode All",
  ans: "B",
  exp: "Internal Network mode isolates the guest virtual machines into a private virtual segment, preventing accidental rogue DHCP interference on home LANs."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Vault (High-Yield Questions)]
#v(3pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'When architecting production enterprise servers, do you recommend Server Core or Desktop Experience, and what is your rationale?'",
  a: "Answer: In production environments, enterprise best practices mandate deploying 'Server Core' wherever supported. Server Core minimizes the operating system attack surface by removing GUI binaries, reduces RAM/CPU footprint, and decreases the volume of patches and reboots. Day-to-day administration is conducted remotely via RSAT, PowerShell Remoting, or Windows Admin Center.",
  tip: "This response demonstrates that you possess seasoned enterprise operational acumen beyond simple desktop-centric thinking."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'What are the official minimum hardware requirements for installing Windows Server 2025?'",
  a: "Answer: The official Microsoft minimum requirements are a 1.4 GHz 64-bit processor, 512 MB RAM (for Server Core) or 2 GB RAM (for Desktop Experience), and 32 GB of available storage space. However, in enterprise production running Active Directory and enterprise roles, at least 4 GB RAM and 60 GB SSD storage are recommended baselines.",
  tip: "A standard screening question during infrastructure support interviews at TCS, Infosys, and Cognizant."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'What is the operational difference between Dynamically Allocated and Fixed Size virtual disks, and which is selected in production?'",
  a: "Answer: Dynamically Allocated disks start with a minimal file footprint on the host and grow incrementally as guest data is written, making them optimal for lab storage efficiency. In production enterprise virtualization (Hyper-V / VMware), 'Fixed Size' disks are strictly mandated because they eliminate runtime disk fragmentation and guarantee predictable, high-throughput storage I/O performance.",
  tip: "A recurring technical interview question in storage and virtualization engineering assessments."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'What system behavior occurs when the 180-day Windows Server evaluation license expires?'",
  a: "Answer: The server does not immediately stop functioning or destroy data. Instead, the OS begins enforcing an automatic shutdown every 1 hour, displays a desktop watermark stating the license has expired, and logs licensing event warnings. The grace period can be extended up to 5 times using `slmgr.vbs /rearm`.",
  tip: "Tests your practical familiarity with licensing lifecycle management and system troubleshooting."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "Interviewer: 'Why is installing Guest Additions or Integration Services considered mandatory in virtualization environments?'",
  a: "Answer: Guest Additions (VirtualBox) or Integration Services (Hyper-V) supply specialized paravirtualized kernel drivers. Without them, the virtual machine cannot support dynamic display auto-resizing (e.g., 1080p full screen), bidirectional clipboard sharing, synchronized mouse cursor integration, or optimized synthetic network and storage adapter performance.",
  tip: "Essential knowledge evaluated in practical systems administration and virtualization lab tests."
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ Home Lab Troubleshooting Guide: 4 Common VM Issues & Rapid Fixes]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-rose)[Issue 1: 'VT-x / AMD-V is not available':] Reboot your physical host, enter BIOS/UEFI firmware settings, and enable Intel Virtualization Technology (VT-x) or AMD SVM.
      - #text(weight: "bold", fill: rtech-amber)[Issue 2: 'Ctrl+Alt+Del keystroke intercepted by host':] Rather than pressing keys physically, utilize VirtualBox top menu 'Input -> Keyboard -> Insert Ctrl+Alt+Del'.
      - #text(weight: "bold", fill: rtech-blue)[Issue 3: 'Accidentally installed Server Core (no GUI desktop)':] Reboot the VM from the ISO installer and select the option with '(Desktop Experience)' appended.
      - #text(weight: "bold", fill: rtech-emerald)[Issue 4: 'Guest display resolution locked at 1024x768':] Select VirtualBox menu 'Devices -> Insert Guest Additions CD Image', run `VBoxWindowsAdditions.exe` inside the VM, and reboot.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ Lab 02 Verification Checklist:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] Virtual machine `SRV-2025-DC01` boots and passes POST successfully.
      - [ ] Local built-in `Administrator` complex password has been securely recorded.
      - [ ] Server Manager Dashboard opens automatically upon logon without service initialization errors.
    ]
  ]
)

#pagebreak()
