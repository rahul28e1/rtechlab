import os

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
ENG_DIR = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301", "07_SOURCE_FILES", "English")

# CHAPTER 06
ch06 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 06 · CISCO CLI COMMANDS & HARDENING]
= Chapter 6: Production Cisco CLI Commands & Hardening

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Mastery of Cisco IOS command-line hierarchy: prompt navigation modes, global configuration syntax, administrative password encryption, SSH v2 2048-bit RSA deployment, console port security, CDP and LLDP neighbor discovery triage, and interface speed/duplex negotiation.
]

#v(2pt)

== 6.1 Cisco IOS Command-Line Hierarchy & Navigation
The Cisco Internetwork Operating System (IOS) enforces a strict hierarchical access tree to prevent unauthorized or accidental modifications:
- *1. User Exec Mode (`Router>`):* Initial unprivileged monitoring mode. Allows basic inspection (`ping`, `traceroute`, `show version`). Cannot alter device state or view full running configuration.
- *2. Privileged Exec Mode (`Router#`):* Administrative inspection mode entered via `enable`. Allows full configuration inspection (`show running-config`), flash file management (`dir`, `delete`), debugging, and software reboots (`reload`).
- *3. Global Configuration Mode (`Router(config)#`):* System-wide configuration mode entered via `configure terminal`. Commands configured here impact the entire device (hostname, banners, routing protocols, user databases).
- *4. Contextual Configuration Sub-Modes:*
  - *Interface Mode (`Router(config-if)#`):* `interface GigabitEthernet0/0/0` — Port IP addresses, speed, duplex, switchport modes.
  - *Subinterface Mode (`Router(config-subif)#`):* `interface g0/0/0.10` — 802.1Q VLAN encapsulation tags and routed IP addresses.
  - *Line Configuration Mode (`Router(config-line)#`):* `line console 0` or `line vty 0 4` — Console and remote terminal security.
  - *Routing Engine Mode (`Router(config-router)#`):* `router ospf 1` — Dynamic routing networks, areas, passive interfaces.

#v(2pt)

== 6.2 Essential Cisco CLI Keystrokes & Productivity Shortcuts
#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Shortcut Keystroke*], [*CLI Function*], [*Production Utility*]),
  [`?` (Question Mark)], [Context-Sensitive Help], [Lists all valid keywords or syntax parameters available at the exact cursor position.],
  [`Tab`], [Command Auto-Completion], [Completes a partially typed keyword once sufficient unique characters are entered.],
  [`do` prefix], [Execute Privileged Commands], [Executes Privileged `show` commands directly from inside sub-modes (e.g. `do show ip int brief`).],
  [`Ctrl + A` / `Ctrl + E`], [Cursor Home / End], [Moves cursor instantly to the beginning or end of the active command line.],
  [`Ctrl + C` / `Ctrl + Z`], [Escape to Privileged Mode], [Instantly aborts configuration sub-modes and returns to `Router#` prompt.],
  [`Ctrl + Shift + 6`], [DNS Escape Break], [Interrupts hung DNS broadcast lookups when an invalid command is mistyped.]
)

#v(2pt)

== 6.3 Baseline Device Configuration & Password Hardening
When deploying a factory-fresh Cisco router or switch, the following security baseline is mandatory:
- *Hostname Assignment:* Identifies device role and campus tier: `Router(config)# hostname R1-EDGE-CORE`
- *Legal MOTD Warning Banner:* Mandated by cybersecurity compliance frameworks (ISO 27001, SOC 2) to establish legal standing:
  `R1(config)# banner motd # AUTHORIZED ACCESS ONLY. ALL SESSIONS MONITORED AND LOGGED. #`
- *Disable Unwanted DNS Lookups:* Prevents 30-second CLI hangs when commands are mistyped: `R1(config)# no ip domain-lookup`
- *Enable Secret vs Enable Password:*
  - `enable password CiscoPass` — Legacy; stored in NVRAM using weak reversible Type 7 Vigenere cipher. #text(fill: rtech-rose, weight: "bold")[NEVER USE IN PRODUCTION!]
  - `enable secret CiscoSecret2027` — Stores passwords using irreversible cryptographic hashes (Type 5 MD5, Type 8 PBKDF2-SHA256, or Type 9 Scrypt).
- *Global Password Obfuscation:* Obfuscates plaintext console and line passwords: `R1(config)# service password-encryption`

#pagebreak()

== 6.4 Securing the Physical Console & Virtual Terminal Lines
Administrative access vectors must be locked down against unauthorized physical and network intrusion:
- *Securing Console Port (`line console 0`):*
  ```bash
  R1(config)# line console 0
  R1(config-line)# password ConsoleAuth2027!
  R1(config-line)# login
  R1(config-line)# exec-timeout 5 0
  R1(config-line)# logging synchronous
  ```
  - *`exec-timeout 5 0`:* Automatically logs out idle console sessions after 5 minutes and 0 seconds of inactivity.
  - *`logging synchronous`:* Automatically redisplays the command line when unsolicited syslog messages print to terminal.

#v(2pt)

== 6.5 Deploying Enterprise SSH v2 (Disabling Insecure Telnet)
Telnet (TCP port 23) transmits administrative usernames and passwords in clear plaintext across the network, exposing credentials to packet sniffing. Production routers must enforce *SSH Version 2 (TCP port 22)*:
1. *Set Hostname and Domain Name:* (Prerequisites for cryptographic key generation)
   `R1(config)# hostname R1-GATEWAY`
   `R1(config)# ip domain-name rtechlab.internal`
2. *Generate 2048-Bit RSA Asymmetric Keypair:*
   `R1(config)# crypto key generate rsa modulus 2048`
3. *Enforce SSH Version 2:*
   `R1(config)# ip ssh version 2`
4. *Create Local Administrative User Database:*
   `R1(config)# username admin privilege 15 secret AdminSecurePass2027`
5. *Enforce SSH on Virtual Terminal Lines (`line vty 0 4`):*
   ```bash
   R1(config)# line vty 0 4
   R1(config-line)# transport input ssh
   R1(config-line)# login local
   R1(config-line)# exec-timeout 10 0
   ```
   - *`transport input ssh`:* Strictly forbids insecure Telnet connections on lines vty 0 to 4.
   - *`login local`:* Directs IOS to authenticate incoming connections against the local `username` database.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/hardware-security-yubikey.jpg",
  caption: "Figure 6.1: Enterprise Hardware Security Key for FIDO2 and SSH Cryptographic Authentication.",
  height: 52pt
)

#v(2pt)

== 6.6 Neighbor Discovery: Cisco CDP vs Industry-Standard LLDP
To map connected devices without physical tracing, network engineers utilize Layer 2 discovery protocols:
- *CDP (Cisco Discovery Protocol):* Cisco-proprietary Layer 2 protocol enabled by default on all Cisco interfaces. Transmits periodic advertisements every 60 seconds (holdtime 180s) to multicast MAC `01:00:0C:CC:CC:CC`.
- *LLDP (Link Layer Discovery Protocol - IEEE 802.1AB):* Vendor-neutral open standard used across multi-vendor networks (Cisco, Juniper, Arista, HP). Disabled by default on older Cisco switches.

#pagebreak()

== 6.7 Discovery Protocols Comparison & CLI Syntax
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Feature*], [*Cisco CDP*], [*IEEE 802.1AB LLDP*], [*Operational Utility*]),
  [Standard], [Cisco Proprietary], [IEEE Open Standard], [LLDP operates across mixed Cisco/Juniper/Linux server NICs.],
  [Default State], [#hl[Enabled by default]], [Disabled by default], [CDP is active out of the box on all Cisco routers/switches.],
  [Global Enable], [`cdp run`], [`lldp run`], [Enables discovery daemon system-wide.],
  [Interface Disable], [`no cdp enable`], [`no lldp transmit / receive`], [Crucial: Disable on untrusted public facing / ISP ports!],
  [Summary View], [`show cdp neighbors`], [`show lldp neighbors`], [Displays Device ID, Local Port, Holdtime, Capability, Remote Port.],
  [Detail View], [`show cdp neighbors detail`], [`show lldp neighbors detail`], [Reveals neighbor IP address, full IOS version, duplex, platform.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "CDP Information Security Warning")[
      While CDP is invaluable for network mapping, it broadcasts sensitive infrastructure intelligence (IP addresses, IOS software releases, hardware models) in plaintext! #text(fill: rtech-rose, weight: "bold")[ALWAYS DISABLE CDP] on internet-facing edge ports and untrusted user access ports:\
      `R1(config-if)# no cdp enable`
    ]
  ],
  [
    #concept-box(title: "Speed & Duplex Hardcoding")[
      When autonegotiation fails between legacy servers and modern switches, hardcode parameters explicitly:\
      `Switch(config-if)# speed 1000`\
      `Switch(config-if)# duplex full`\
      _Rule: If you hardcode one side, you MUST hardcode the connected partner to prevent duplex mismatch!_
    ]
  ]
)

#v(2pt)

== 6.8 Essential Cisco CLI Verification & Triage Commands
- `show ip interface brief` — The most fundamental CCNA command. Summarizes IP address, Layer 1 Status (physical up/down), and Layer 2 Protocol (data link up/down) for all interfaces.
- `show interfaces [interface]` — Displays packet counters, input/output errors, CRC errors, MTU (1500 bytes), and bandwidth/delay metrics.
- `show ip route` — Dumps active routing table entries with routing protocols and administrative distances.
- `show running-config | section [keyword]` — Filters running configuration to show only relevant protocol blocks (e.g., `section ospf` or `section vty`).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What does interface status 'up / down' indicate?", a: "Status 'up' confirms Layer 1 physical carrier signal is detected. Protocol 'down' indicates a Layer 2 failure: encapsulation mismatch (HDLC vs PPP), clock rate missing on serial links, or keepalive timeout.")
#faq-item(q: "Why is service password-encryption considered insufficient for high-security environments?", a: "It employs a weak Type 7 Vigenere cipher that can be instantly decrypted by online cracker tools in milliseconds. Always use 'enable secret' and 'username secret' which utilize SHA-256 or Scrypt.")
#faq-item(q: "What is the function of the logging synchronous command on line console 0?", a: "It prevents unsolicited system log and debug notifications from fragmenting and breaking up the command string an engineer is actively typing.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Name the global configuration command that enforces SSH version 2 on a Cisco router.", ans: "ip ssh version 2.")
#short-q(num: 2, q: "Which command aborts a hung DNS lookup when an invalid command is mistyped in CLI?", ans: "Control + Shift + 6 (Ctrl+Shift+6).")
#short-q(num: 3, q: "What minimum RSA key modulus size is recommended by Cisco for secure SSH v2?", ans: "2048 bits (crypto key generate rsa modulus 2048).")
#short-q(num: 4, q: "Which command displays the neighbor IP address and IOS version using CDP?", ans: "show cdp neighbors detail.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which command configuration correctly locks remote management lines strictly to SSH connections?", a: "transport input all", b: "transport input ssh", c: "transport output telnet", d: "ip ssh enable", ans: "B", expl: "Under line vty 0 4, 'transport input ssh' disables insecure Telnet and permits only encrypted SSH connections.")
#mcq(num: 2, q: "What is the primary difference between enable password and enable secret?", a: "enable password is for switches; enable secret is for routers", b: "enable secret is encrypted using cryptographic hashing; enable password uses weak reversible encryption or plaintext", c: "enable password grants privilege level 15", d: "enable secret requires a smart card", ans: "B", expl: "enable secret uses strong one-way hashing (MD5 or SHA-256) which cannot be reversed, whereas enable password is weak Type 7.")
#mcq(num: 3, q: "What two prerequisites must be configured on a Cisco router before generating RSA keys for SSH?", a: "IP address and default gateway", b: "Hostname and IP domain-name", c: "NTP server and syslog server", d: "OSPF and VLAN 1", ans: "B", expl: "Cisco IOS constructs the Fully Qualified Domain Name (FQDN) for the RSA certificate from the hostname and domain-name.")
#mcq(num: 4, q: "Which command allows an engineer to inspect IP interface status from within interface configuration mode?", a: "show ip interface brief", b: "do show ip interface brief", c: "run show ip interface brief", d: "exit show ip interface brief", ans: "B", expl: "The 'do' prefix allows privileged exec commands to be executed directly from within any configuration sub-mode.")
#mcq(num: 5, q: "What Layer 2 discovery protocol is an open IEEE 802.1AB standard supported across multi-vendor devices?", a: "CDP", b: "LLDP", c: "STP", d: "VTP", ans: "B", expl: "Link Layer Discovery Protocol (LLDP) is standardized by IEEE 802.1AB for multi-vendor interoperability.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Privilege 15 Superuser")[
      Cisco IOS supports 16 privilege levels (0 to 15). Level 1 is standard user exec; Level 15 grants full unrestricted root administrative control over the entire chassis!
    ]
  ],
  [
    #tech-spotlight-box(title: "RESTCONF & NETCONF APIs")[
      Modern network automation bypasses human CLI typing entirely; Python scripts configure Cisco routers programmatically via RESTCONF (HTTPS/JSON) and NETCONF (SSH/YANG)!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
'''

# CHAPTER 07
ch07 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 07 · SWITCHING, VLANS & SPANNING TREE]
= Chapter 7: Switching, VLANs, Trunking (802.1Q) & STP

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Ethernet switching foundations: CAM table address learning, flooding, and aging; VLAN segmentation; 802.1Q trunking and native VLAN security; Router-on-a-Stick inter-VLAN routing; Spanning Tree Protocol (STP 802.1D vs RSTP 802.1w), Root Bridge election math, and PortFast / BPDU Guard.
]

#v(2pt)

== 7.1 Layer 2 Switch Logic & CAM Table Mechanics
A Layer 2 switch operates as a multiport bridge, inspecting incoming Ethernet frames to make intelligent forwarding decisions:
- *1. Learning:* As frames enter an interface, the switch reads the #hl[Source MAC address]. If the address is not present in its *Content Addressable Memory (CAM) Table*, it binds the Source MAC, port number, and VLAN ID with a default aging timer of #hl[300 seconds (5 minutes)].
- *2. Forwarding Decision:* The switch examines the #hl[Destination MAC address]:
  - *Known Unicast:* If Destination MAC is in CAM, the frame is forwarded #hl[strictly out the specific outbound port].
  - *Unknown Unicast:* If Destination MAC is not in CAM, the switch #hl[floods the frame out all ports] belonging to the same VLAN except the receiving port.
  - *Broadcast / Multicast:* Flooded out all ports within the source VLAN (`FFFF.FFFF.FFFF`).
- *3. Aging:* Entries unused for 300 seconds are purged to preserve table space and adapt to host movement.

#v(2pt)

== 7.2 Virtual Local Area Networks (VLANs) & Segmentation
A VLAN is a logical broadcast domain created within physical switches:
- *Why VLANs:* Without VLANs, all switch ports belong to a single broadcast domain. A broadcast storm from one malfunctioning host degrades bandwidth across the entire building. VLANs isolate traffic by department (HR, Finance, Guest, Voice), enforce security boundaries, and simplify QoS prioritization.
- *VLAN Numbering Ranges:*
  - *Default VLAN (VLAN 1):* Factory default for all switch ports; cannot be renamed or deleted.
  - *Normal Range (VLAN 2–1005):* Standard campus enterprise range. Stored in non-volatile flash memory in the #hl[`flash:vlan.dat`] file.
  - *Extended Range (VLAN 1006–4094):* Used by service providers and large datacenters. Stored directly in `running-config`.

#v(2pt)

== 7.3 Access Ports vs 802.1Q Trunk Ports
Switch interfaces are configured in one of two fundamental operational modes:
- *Access Port:* Belongs to exactly #hl[one single data VLAN] (plus optional Voice VLAN). Connected to end-user workstations, printers, and servers. Transmits untagged Ethernet frames.
- *Trunk Port:* Point-to-point link carrying traffic for #hl[multiple VLANs simultaneously] between switches or between switch and router. Employs the industry-standard *IEEE 802.1Q* encapsulation tag.
- *The 802.1Q Tag Structure (4 Bytes):* Inserted between Source MAC and EtherType:
  - *TPID (Tag Protocol Identifier - 16 bits):* Set to hex `0x8100` to indicate an 802.1Q frame.
  - *PCP (Priority Code Point - 3 bits):* Quality of Service (CoS) marking (0 to 7) for VoIP prioritization.
  - *VID (VLAN Identifier - 12 bits):* Identifies the VLAN (values 1 to 4094; $2^{12} = 4096$).
- *Native VLAN Security:* Frames belonging to the Native VLAN traverse the 802.1Q trunk #hl[without an 802.1Q tag]. Security Best Practice: Never use default VLAN 1 for the Native VLAN; assign an unused dummy VLAN (e.g. VLAN 999) to prevent double-tagging VLAN hopping attacks: `switchport trunk native vlan 999`.

#pagebreak()

== 7.4 Inter-VLAN Routing: Router-on-a-Stick (ROAS)
Because Layer 2 switches cannot route traffic between separate VLANs, an external Layer 3 routing engine is required:
- *The ROAS Architecture:* A single physical Gigabit Ethernet interface on a Cisco router connects to an 802.1Q trunk port on the switch.
- *Logical Subinterfaces:* The router physical interface is divided into virtual subinterfaces (e.g., `g0/0/0.10` and `g0/0/0.20`), each assigned to a specific VLAN tag and serving as that VLAN's *Default Gateway*.
- *Production CLI Configuration:*
  ```bash
  ! --- Switch Trunk Configuration ---
  Switch(config)# interface GigabitEthernet0/1
  Switch(config-if)# switchport mode trunk
  Switch(config-if)# switchport trunk allowed vlan 10,20,30
  
  ! --- Router-on-a-Stick Configuration ---
  Router(config)# interface GigabitEthernet0/0/0
  Router(config-if)# no ip address
  Router(config-if)# no shutdown
  Router(config)# interface GigabitEthernet0/0/0.10
  Router(config-subif)# encapsulation dot1Q 10
  Router(config-subif)# ip address 192.168.10.1 255.255.255.0
  Router(config)# interface GigabitEthernet0/0/0.20
  Router(config-subif)# encapsulation dot1Q 20
  Router(config-subif)# ip address 192.168.20.1 255.255.255.0
  ```

#v(2pt)

== 7.5 Spanning Tree Protocol (STP 802.1D): Looping Prevention
When redundant physical links are connected between switches to prevent single points of failure, catastrophic Layer 2 hazards emerge:
- *1. Broadcast Storms:* Switches flood broadcasts endlessly in a circular loop, consuming 100% of link bandwidth and freezing switch CPUs within seconds.
- *2. CAM Table Instability (MAC Thrashing):* The same source MAC arrives simultaneously on multiple ports, causing the switch to constantly overwrite CAM entries.
- *3. Multiple Frame Copies:* Destination hosts receive duplicated unnumbered frames, corrupting upper-layer TCP stacks.
- *STP Solution:* STP creates a loop-free logical topology by calculating spanning tree metrics and placing redundant backup ports into a #hl[Blocking state]. If the primary link fails, STP recalculates and unblocks the backup port.

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg",
  caption: "Figure 7.1: Enterprise Catalyst Switch executing Spanning Tree root bridge election across fiber trunks.",
  height: 52pt
)

#v(2pt)

== 7.6 The STP Root Bridge Election Math
In any broadcast domain, all switches participate in electing a single master switch called the #hl[Root Bridge]:
- *Election Rule:* The switch with the #hl[LOWEST Bridge ID (BID)] wins the election and becomes the Root Bridge.
- *Bridge ID Components (8 Bytes Total):*
  $ "Bridge ID" = "Bridge Priority (2 Bytes)" + "System ID Extension (VLAN ID)" + "Base MAC Address (6 Bytes)" $
- *Default Priority:* `32768`. Because Cisco switches run Per-VLAN Spanning Tree (PVST+), the priority is incremented by the VLAN ID: for VLAN 10, priority is $32768 + 10 = #hl[32778]$.
- *Deterministic Root Engineering:* Never allow random MAC addresses to decide the Root Bridge! Force the core switch to win by lowering its priority:
  `Switch(config)# spanning-tree vlan 10 priority 4096` (Must be configured in increments of 4096!).

#pagebreak()

== 7.7 STP Port Roles, Port States & RSTP (802.1w) Convergence
Once the Root Bridge is elected, switches evaluate path costs to assign roles to every active switch port:
- *1. Root Port (RP):* Exactly #hl[one Root Port per non-root switch]. The port with the lowest cumulative Path Cost to the Root Bridge. Always in Forwarding state.
- *2. Designated Port (DP):* Exactly #hl[one Designated Port per physical segment]. The port that forwards frames from that segment toward the Root. All ports on the Root Bridge are Designated Ports. Always in Forwarding state.
- *3. Alternate / Blocking Port (AP/BLK):* Redundant loop ports; drops data frames but listens to BPDUs to detect link failures.

#v(2pt)

#table(
  columns: (1.1fr, 1.3fr, 1.3fr, 2.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*STP Standard*], [*Convergence Time*], [*Operational States*], [*Key Features & Handshake*]),
  [Legacy 802.1D], [30 to 50 Seconds], [Blocking $arrow$ Listening $arrow$ Learning $arrow$ Forwarding], [Timers: Max Age 20s, Forward Delay 15s. Very slow for modern voice/video.],
  [RSTP 802.1w], [#hl[Under 1 Second]], [Discarding $arrow$ Learning $arrow$ Forwarding], [Proposal/Agreement handshake. Instant cutover on link failure.],
  [Rapid PVST+], [Under 1 Second], [Discarding $arrow$ Learning $arrow$ Forwarding], [Cisco default; runs an independent fast 802.1w instance per VLAN.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "Spanning Tree PortFast")[
      Configured strictly on access ports connected to end hosts (PCs, printers):\
      `Switch(config-if)# spanning-tree portfast`\
      Bypasses the 30-second Listening/Learning delays and transitions port to #hl[Forwarding immediately]. Prevents DHCP timeout failures on booting workstations!
    ]
  ],
  [
    #concept-box(title: "BPDU Guard Security Defense")[
      Configured in tandem with PortFast to prevent rogue switches:\
      `Switch(config-if)# spanning-tree bpduguard enable`\
      If any device connects to this port and transmits an STP BPDU frame, the switch immediately disables the port into #hl[err-disabled state] to protect topology!
    ]
  ]
)

#v(2pt)

== 7.8 Essential Switching & STP Verification Commands
- `show vlan brief` — Lists all configured VLANs, VLAN names, and associated access member ports.
- `show interfaces trunk` — Displays active 802.1Q trunk ports, native VLANs, and permitted VLAN list.
- `show mac address-table dynamic` — Displays learned dynamic MAC addresses, ports, and associated VLANs.
- `show spanning-tree vlan [vlan-id]` — Identifies Root Bridge ID, local Bridge ID, Root Port, and port states (FWD/BLK).

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What happens if the Native VLAN does not match on both ends of an 802.1Q trunk?", a: "A Native VLAN Mismatch error is generated via CDP. Untagged frames entering one VLAN will leak into a different VLAN at the other end, creating cross-VLAN traffic leakage and security vulnerabilities.")
#faq-item(q: "Why must spanning-tree portfast NEVER be enabled on switch-to-switch trunk ports?", a: "PortFast bypasses loop detection. If enabled on a redundant link between switches, a catastrophic Layer 2 broadcast storm will instantly paralyze the network.")
#faq-item(q: "How does Rapid Spanning Tree Protocol (RSTP) converge so much faster than 802.1D?", a: "RSTP eliminates static 15-second timer delays by utilizing an explicit point-to-point Proposal/Agreement synchronization handshake between adjacent switches.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Where does a Cisco Catalyst switch store its normal-range VLAN database?", ans: "In flash memory inside the flash:vlan.dat file.")
#short-q(num: 2, q: "How many bytes does the IEEE 802.1Q tag add to an Ethernet frame?", ans: "4 Bytes (32 bits).")
#short-q(num: 3, q: "What is the default bridge priority value for Per-VLAN Spanning Tree on VLAN 1?", ans: "32769 (Priority 32768 + System ID Extension 1).")
#short-q(num: 4, q: "Which command places an err-disabled port back into operation?", ans: "shutdown followed immediately by no shutdown.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "What metric is used as the ultimate tie-breaker during the Spanning Tree Root Bridge election if all switches share the same priority?", a: "Lowest IP address", b: "Lowest MAC address", c: "Highest port speed", d: "Longest system uptime", ans: "B", expl: "If bridge priorities are identical (e.g. default 32768), the switch with the lowest numerical MAC address wins.")
#mcq(num: 2, q: "Which operational port mode in 802.1Q trunking carries untagged data frames?", a: "Access VLAN", b: "Voice VLAN", c: "Native VLAN", d: "Management VLAN", ans: "C", expl: "802.1Q trunks transmit frames belonging to the Native VLAN without an 802.1Q header tag.")
#mcq(num: 3, q: "What is the default CAM table aging timer on Cisco Catalyst switches?", a: "60 seconds", b: "120 seconds", c: "300 seconds (5 minutes)", d: "3600 seconds", ans: "C", expl: "If a learned MAC address does not emit frames for 300 seconds, the entry is automatically aged out of CAM.")
#mcq(num: 4, q: "What router subinterface command specifies the 802.1Q VLAN tag for Router-on-a-Stick inter-VLAN routing?", a: "switchport trunk dot1q", b: "encapsulation dot1Q [vlan-id]", c: "vlan dot1q [vlan-id]", d: "ip dot1q enable", ans: "B", expl: "Under the subinterface (e.g. g0/0.10), 'encapsulation dot1Q 10' tells IOS to bind that subinterface to VLAN 10.")
#mcq(num: 5, q: "What action does BPDU Guard execute when a Spanning Tree BPDU frame is detected on a PortFast enabled access port?", a: "Silently drops the BPDU frame", b: "Forwards BPDU to the Root Bridge", c: "Immediately transitions the port to err-disabled state", d: "Demotes the port to half-duplex", ans: "C", expl: "BPDU Guard prevents rogue switch loops by shutting the port down into err-disabled state upon receiving any BPDU.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The VLAN 1 Architecture Trap")[
      Cisco switches always process control traffic (CDP, VTP, PAgP) over VLAN 1 even if VLAN 1 is removed from the trunk allowed list!
    ]
  ],
  [
    #tech-spotlight-box(title: "EVPN-VXLAN Datacenter Overlays")[
      Modern cloud datacenters replace STP entirely with VXLAN (Virtual Extensible LAN), encapsulating Layer 2 Ethernet frames inside UDP Layer 3 packets!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
'''

# CHAPTER 08
ch08 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 08 · IP ROUTING & DYNAMIC OSPF]
= Chapter 8: IP Routing, Administrative Distance & OSPF

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Routing fundamentals: Longest Prefix Match (LPM) algorithm, static routes, default routes (0.0.0.0/0), floating static routes, Administrative Distance hierarchy, and in-depth Open Shortest Path First (OSPFv2) single and multi-area dynamic routing.
]

#v(2pt)

== 8.1 IP Routing Decision Logic & Forwarding Mechanics
A router is a Layer 3 internetworking device that connects disparate broadcast domains. When an IPv4 packet arrives at an inbound interface, the router executes the following deterministic forwarding cycle:
- *1. Frame De-encapsulation:* Checks Frame Check Sequence (FCS) for physical transmission errors. Strips the incoming Layer 2 Ethernet header and trailer to reveal the Layer 3 IPv4 packet.
- *2. Destination IP Inspection:* Reads the 32-bit Destination IP address.
- *3. The Longest Prefix Match (LPM) Rule:* Searches the IP Routing Table for candidate routes matching the destination IP. #hl[The route with the longest (most specific) subnet mask is ALWAYS chosen], regardless of routing protocol or Administrative Distance!
  - *Example:* If routing table contains `10.1.0.0/16` (OSPF) and `10.1.1.0/24` (RIP), traffic destined for `10.1.1.50` matches `10.1.1.0/24` because `/24` is longer than `/16`.
- *4. TTL Decrement & Checksum:* Decrements Time-to-Live (TTL) by 1. If TTL reaches 0, the packet is discarded and an ICMP Time Exceeded message (`Type 11, Code 0`) is transmitted to the sender.
- *5. Layer 2 Re-encapsulation:* Resolves the next-hop IP's MAC address via ARP cache, constructs a brand new Ethernet header, and transmits the frame out the exit interface.

#v(2pt)

== 8.2 Administrative Distance (AD) Master Hierarchy Table
Administrative Distance defines the #hl[trustworthiness of a routing information source]. When a router learns about the exact same destination prefix via multiple routing protocols, the route with the #hl[LOWEST Administrative Distance] is installed into the routing table:
#table(
  columns: (1.2fr, 0.9fr, 1.2fr, 2.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Route Source*], [*Default AD*], [*Algorithm / Metric*], [*Enterprise Characteristics*]),
  [Directly Connected], [0], [Physical Interface Link], [Hardware interface assigned an IP address and active (`up/up`).],
  [Static Route], [1], [Manual Administrator Entry], [Configured via `ip route`; highest precedence over dynamic protocols.],
  [eBGP (External BGP)], [20], [Path Vector (AS-Path)], [Inter-Autonomous System routing between ISPs and cloud providers.],
  [EIGRP (Internal)], [90], [DUAL (Bandwidth + Delay)], [Cisco advanced distance-vector protocol; fast convergence.],
  [OSPF], [#hl[110]], [Dijkstra SPF (Cost = $10^8 / "BW"$)], [Open standard link-state protocol; industry standard enterprise IGP.],
  [IS-IS], [115], [Dijkstra SPF (Cost metric)], [Service provider core backbone routing protocol.],
  [RIP (v1 / v2)], [120], [Bellman-Ford (Hop Count, max 15)], [Legacy distance-vector protocol; limited to small networks.],
  [EIGRP (External)], [170], [Redistributed Routes], [Routes imported into EIGRP from external routing protocols.],
  [iBGP (Internal BGP)], [200], [Path Vector], [BGP routing between routers within the same Autonomous System.],
  [Unreachable], [255], [Untrusted], [Router will never install this route into the routing table.]
)

#pagebreak()

== 8.3 Static Routing, Default Routes & Floating Static Routes
Static routes are manually coded path entries ideal for stub networks, small branch offices, and predictable WAN connections:
- *Standard Static Route Syntax:*
  `Router(config)# ip route [destination-network] [subnet-mask] [next-hop-ip | exit-interface]`
  - *Next-Hop IP:* `ip route 172.16.1.0 255.255.255.0 10.0.0.2` (Requires recursive route lookup).
  - *Directly Attached (Exit Interface):* `ip route 172.16.1.0 255.255.255.0 GigabitEthernet0/0/1` (Generates ARP requests for every destination).
  - *Fully Specified (Best Practice):* `ip route 172.16.1.0 255.255.255.0 GigabitEthernet0/0/1 10.0.0.2`
- *Default Route (Gateway of Last Resort):* Matches #hl[all packets] that do not have a specific route in the routing table:
  `Router(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.1` (Points all internet traffic to the ISP gateway).
- *Floating Static Route (Backup Failover):* A static route configured with an Administrative Distance higher than the primary routing protocol. As long as the primary link is healthy, the floating route remains hidden. If the primary route drops, the floating route is installed instantly:
  `Router(config)# ip route 0.0.0.0 0.0.0.0 198.51.100.2 10` (Floating route with AD 10).

#v(2pt)

== 8.4 Open Shortest Path First (OSPFv2) Link-State Architecture
OSPF (RFC 2328) is a vendor-neutral, classless link-state dynamic routing protocol engineered for scalability and rapid convergence:
- *The Link-State Concept:* Unlike distance-vector protocols that share whole routing tables with immediate neighbors ("routing by rumor"), OSPF routers flood *Link-State Advertisements (LSAs)*. Every router builds an identical map of the entire network topology called the *Link-State Database (LSDB)*.
- *Dijkstra's SPF Algorithm:* Each router runs the Shortest Path First (SPF) calculation independently, placing itself at the root of the tree to calculate the lowest-cost loop-free path to every destination prefix.
- *OSPF Cost Metric Formula:*
  $ "Cost" = "Reference Bandwidth" / "Interface Bandwidth" = (100 "Mbps") / "Interface Bandwidth" = 10^8 / "BW (bps)" $
  - *10 Mbps Ethernet:* $100 / 10 = #hl[10]$
  - *100 Mbps FastEthernet:* $100 / 100 = #hl[1]$
  - *1 Gbps GigabitEthernet:* $100 / 1000 = 0.1 arrow #hl[1]$ (Default reference bandwidth cannot distinguish between 100M and 1G!).
  - *Production Tuning:* You MUST adjust reference bandwidth in gigabit networks: `Router(config-router)# auto-cost reference-bandwidth 10000` (Sets base to 10 Gbps).

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg",
  caption: "Figure 8.1: Core Campus Distribution Routers establishing OSPFv2 full neighbor adjacencies.",
  height: 52pt
)

#v(2pt)

== 8.5 OSPF Router ID (RID) Election Order
Every OSPF router must have a unique 32-bit dotted-decimal Router ID. The Router ID is determined via the following 3-step hierarchy:
1. #hl[Manual CLI Configuration:] `Router(config-router)# router-id 1.1.1.1` (Highest precedence; highly recommended).
2. *Highest IPv4 Address on any Active Loopback Interface:* Loopbacks never experience physical link flaps.
3. *Highest IPv4 Address on any Active Physical Interface:* Evaluated across interfaces in `up/up` operational state.

#pagebreak()

== 8.6 OSPF Adjacency States & DR/BDR Election Mechanics
On broadcast multi-access networks (Ethernet), forming full mesh adjacencies between $N$ routers creates $N(N-1)/2$ connections, causing severe LSA flooding overhead. OSPF solves this by electing a *Designated Router (DR)* and *Backup Designated Router (BDR)*:
- *Adjacency States:* Down $arrow$ Init $arrow$ 2-Way (DR/BDR elected) $arrow$ ExStart $arrow$ Exchange $arrow$ Loading $arrow$ #hl[Full].
- *DR / BDR Roles:*
  - Non-DR routers (*DROther*) form Full adjacencies #hl[ONLY with the DR and BDR]. DROther routers form `2-Way` state with each other.
  - DROthers transmit LSUs to the multicast address #hl[`224.0.0.6` (All DR Routers)].
  - The DR floods updates back to all routers using #hl[`224.0.0.5` (All OSPF Routers)].
- *DR Election Rule:* Highest OSPF Interface Priority (default `1`; priority `0` disqualifies router) $arrow$ Highest Router ID.
- *Non-Preemptive Election:* If a router with a higher RID boots after the DR has already been elected, it does NOT usurp the DR role!

#v(2pt)

== 8.7 Multi-Area OSPF & Backbone Area 0 Architecture
Large enterprise networks divide OSPF into hierarchical areas to restrict SPF recalculations and contain LSA flooding:
- *Area 0 (Backbone Area):* The central core of OSPF. #hl[All other areas (Area 1, Area 2) MUST connect physically or logically to Area 0]!
- *Router Types in Multi-Area OSPF:*
  - *Internal Router:* All interfaces reside within the same single area.
  - *Area Border Router (ABR):* Interfaces connect to multiple areas (at least one in Area 0); summarizes routes between areas.
  - *Autonomous System Boundary Router (ASBR):* Connects OSPF to external routing domains (e.g., BGP, EIGRP, Static routes).

#v(2pt)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*LSA Type*], [*LSA Name*], [*Originating Router*], [*Flooding Scope*]),
  [Type 1], [Router LSA], [Every OSPF Router], [Within local area only; describes router links and costs.],
  [Type 2], [Network LSA], [Designated Router (DR)], [Within local area only; describes multi-access segment routers.],
  [Type 3], [Summary LSA], [Area Border Router (ABR)], [Flooded into other areas; advertises inter-area network prefixes.],
  [Type 4], [ASBR Summary LSA], [Area Border Router (ABR)], [Advertises route to the ASBR into other areas.],
  [Type 5], [Autonomous System External], [AS Boundary Router (ASBR)], [Flooded across entire OSPF domain; advertises external redistributed routes.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "OSPF Passive Interface Command")[
      Prevents OSPF Hello packets from exiting access ports connected to end users:\
      `Router(config-router)# passive-interface GigabitEthernet0/0/0`\
      Saves CPU cycles, prevents rogue router adjacencies, but continues advertising the subnet into OSPF!
    ]
  ],
  [
    #concept-box(title: "OSPF Wildcard Mask Math")[
      OSPF network statements require an inverted subnet mask (*Wildcard Mask*):\
      $ "Wildcard" = 255.255.255.255 - "Subnet Mask" $\
      - /24 mask (`255.255.255.0`) $arrow$ #hl[`0.0.0.255`]\
      - /26 mask (`255.255.255.192`) $arrow$ #hl[`0.0.0.63`]
    ]
  ]
)

#v(2pt)

== 8.8 Production Cisco OSPFv2 Configuration Template
```bash
Router(config)# router ospf 1
Router(config-router)# router-id 1.1.1.1
Router(config-router)# auto-cost reference-bandwidth 10000
Router(config-router)# network 192.168.10.0 0.0.0.255 area 0
Router(config-router)# network 10.0.0.0 0.0.0.3 area 0
Router(config-router)# passive-interface GigabitEthernet0/0/0
Router# show ip ospf neighbor
Router# show ip ospf interface brief
```

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "What causes two OSPF routers to get stuck in ExStart or Exchange state?", a: "An MTU mismatch on connected interfaces is the most common cause. Both routers negotiate Maximum Transmission Unit during ExStart; if MTUs do not match, Database Description (DBD) packets are dropped.")
#faq-item(q: "Why does the Longest Prefix Match rule override Administrative Distance?", a: "LPM is a fundamental Layer 3 routing rule: a more specific route (e.g. /28) is mathematically a better match for an exact destination host than a broad summary route (e.g. /16), regardless of route source.")
#faq-item(q: "Can a router with OSPF priority 0 ever become a DR or BDR?", a: "No. Setting OSPF interface priority to 0 ('ip ospf priority 0') permanently disqualifies the interface from participating in the DR/BDR election, forcing it to remain a DROther.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "What is the default Administrative Distance of OSPF in Cisco IOS?", ans: "110.")
#short-q(num: 2, q: "Identify the destination IPv4 multicast address used to send OSPF packets to All OSPF Routers.", ans: "224.0.0.5.")
#short-q(num: 3, q: "What is the wildcard mask for a subnet with mask 255.255.255.240 (/28)?", ans: "0.0.0.15 (Formula: 255.255.255.255 - 255.255.255.240 = 0.0.0.15).")
#short-q(num: 4, q: "Which OSPF router type connects a local non-backbone area to Backbone Area 0?", ans: "Area Border Router (ABR).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "Which routing table entry will a Cisco router select to forward a packet destined for IP 192.168.1.68?", a: "192.168.1.0/24 [1/0] via 10.1.1.1", b: "192.168.1.64/28 [110/20] via 10.2.2.2", c: "192.168.1.64/26 [90/3000] via 10.3.3.3", d: "0.0.0.0/0 [1/0] via 10.4.4.4", ans: "B", expl: "Longest Prefix Match dictates that the longest mask (/28) wins over /26, /24, and /0, regardless of the routing protocol.")
#mcq(num: 2, q: "What is the primary purpose of configuring a Floating Static Route?", a: "To load balance traffic across unequal bandwidth paths", b: "To provide an automatic backup route that activates only when the primary route fails", c: "To inject default routes into BGP", d: "To prevent routing loops in multi-area OSPF", ans: "B", expl: "Floating static routes have a higher Administrative Distance than primary routes, serving as standby failover paths.")
#mcq(num: 3, q: "What metric algorithm does OSPF use to determine the best path to a destination network?", a: "Hop count", b: "Bandwidth and Delay composite", c: "Dijkstra Shortest Path First (SPF) Cost based on link bandwidth", d: "Path Vector AS-Path length", ans: "C", expl: "OSPF runs Dijkstra's algorithm to calculate cumulative path Cost based on reference bandwidth / interface bandwidth.")
#mcq(num: 4, q: "In what order does a Cisco router select its OSPF Router ID if not manually configured via the router-id command?", a: "Highest IP on any physical interface, then highest loopback", b: "Lowest MAC address, then highest IP", c: "Highest IPv4 address on any active Loopback, then highest IPv4 on any active physical interface", d: "First IP address configured in the network statement", ans: "C", expl: "OSPF prioritizes manual RID first, then highest loopback IP, and finally highest active physical interface IP.")
#mcq(num: 5, q: "What state do two OSPF DROther routers maintain with each other on a broadcast multi-access Ethernet network?", a: "Full", b: "2-Way", c: "Loading", d: "Attempt", ans: "B", expl: "DROther routers form Full adjacencies strictly with the DR and BDR; with each other, they stop at 2-Way state.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Dead Interval Multiplier")[
      By default, OSPF Dead Interval is exactly #hl[4 times the Hello interval] (Hello 10s, Dead 40s on broadcast links). If intervals do not match between neighbors, adjacency fails!
    ]
  ],
  [
    #tech-spotlight-box(title: "BGP in the Data Center")[
      Modern hyperscale cloud operators (Google, Amazon) use eBGP (Border Gateway Protocol) rather than OSPF to route across their internal Clos spine-leaf fabrics!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
'''

# CHAPTER 09
ch09 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 09 · IP SERVICES & NETWORK SECURITY]
= Chapter 9: Enterprise IP Services & Network Security

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Enterprise IP services and security enforcement: DHCP server pools, DHCP relay agent (ip helper-address), Network Address Translation (NAT) and Port Address Translation (PAT) overload, Standard vs Extended Access Control Lists (ACLs), and switchport port security violation modes.
]

#v(2pt)

== 9.1 Dynamic Host Configuration Protocol (DHCP) Mechanics
DHCP dynamically allocates IP addresses, subnet masks, default gateways, and DNS servers to client workstations across local networks:
- *The 4-Step DORA Handshake:*
  - *1. Discover:* Client broadcasts a `DHCPDISCOVER` frame (Source IP: `0.0.0.0`, Dest IP: `255.255.255.255`, UDP Port 67) searching for active DHCP servers.
  - *2. Offer:* DHCP server reserves an unassigned IP and unicasts/broadcasts a `DHCPOFFER` (UDP Port 68) containing leased IP and MAC binding.
  - *3. Request:* Client broadcasts a `DHCPREQUEST` formally accepting the offered IP and notifying any other competing servers to release their offers.
  - *4. Acknowledge:* Server commits the lease into its binding database and transmits a `DHCPACK` confirming lease duration.

#v(2pt)

== 9.2 Cisco IOS DHCP Server Configuration & Relay Agent
Cisco routers can operate as enterprise DHCP servers for branch office subnets:
```bash
! --- Step 1: Exclude Static Infrastructure Addresses ---
Router(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.10
Router(config)# ip dhcp excluded-address 192.168.10.254

! --- Step 2: Define DHCP Scope Pool ---
Router(config)# ip dhcp pool SALES_LAN
Router(config-dhcp)# network 192.168.10.0 255.255.255.0
Router(config-dhcp)# default-router 192.168.10.1
Router(config-dhcp)# dns-server 8.8.8.8 1.1.1.1
Router(config-dhcp)# domain-name rtechlab.internal
Router(config-dhcp)# lease 7 0 0
```
- *The DHCP Relay Agent (`ip helper-address`):* Because routers block Layer 2 broadcasts by default, client `DHCPDISCOVER` broadcasts cannot cross router interfaces to reach centralized datacenter DHCP servers.
  - *Solution:* Configure `ip helper-address` on the router interface facing the clients. The router converts the client broadcast into a #hl[unicast packet] forwarded directly to the target DHCP server IP:
    `Router(config-if)# ip helper-address 10.1.100.50`

#v(2pt)

== 9.3 Network Address Translation (NAT) & PAT Overload
RFC 1631 NAT conserves public IPv4 addresses by translating private RFC 1918 addresses into registered public internet routable addresses:
- *NAT Terminology (Cisco Framework):*
  - *Inside Local:* The private IPv4 address assigned to a host on the internal private LAN (e.g., `192.168.1.50`).
  - *Inside Global:* The registered public IPv4 address that represents the inside host to the outside world (e.g., `203.0.113.5`).
  - *Outside Local:* The IP address of an outside destination host as viewed from the internal network.
  - *Outside Global:* The actual public IP address assigned to the outside destination host on the Internet.
- *Port Address Translation (PAT / NAT Overload):* Maps thousands of internal private IP addresses to a #hl[single public IP address] by tracking unique Layer 4 source TCP/UDP port numbers ($> 1024$).

#pagebreak()

== 9.4 Cisco IOS PAT Overload Production Configuration
To deploy PAT Overload on an enterprise border router with a dynamic public interface:
```bash
! --- Step 1: Define Inside Private Hosts via Standard ACL ---
Router(config)# access-list 1 permit 192.168.10.0 0.0.0.255

! --- Step 2: Configure NAT Overload on Public Outside Interface ---
Router(config)# ip nat inside source list 1 interface GigabitEthernet0/0/1 overload

! --- Step 3: Designate Inbound and Outbound NAT Interfaces ---
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ip nat inside
Router(config)# interface GigabitEthernet0/0/1
Router(config-if)# ip nat outside
```
- *Verification Command:* `show ip nat translations` — Dumps active translation table showing Protocol, Inside Local:Port, Inside Global:Port, and Outside Global:Port bindings.
- *Clearing Translations:* `clear ip nat translation *` — Clears active dynamic NAT sessions from memory.

#v(2pt)

== 9.5 Access Control Lists (ACLs): Standard vs Extended
Access Control Lists filter traffic at router interfaces to enforce network security boundaries:
#table(
  columns: (1.1fr, 1.2fr, 1.3fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*ACL Type*], [*Number Range*], [*Filtering Criteria*], [*Placement Golden Rule*]),
  [Standard ACL], [1–99 and 1300–1999], [Source IP Address #hl[ONLY]], [Place as close to the #hl[DESTINATION] as possible to prevent blocking legitimate traffic on other paths.],
  [Extended ACL], [100–199 and 2000–2699], [Protocol, Source IP, Source Port, Dest IP, Dest Port], [Place as close to the #hl[SOURCE] as possible to filter unwanted packets before consuming bandwidth.]
)

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/hardware-security-yubikey.jpg",
  caption: "Figure 9.1: Enterprise Network Security boundary enforcing hardware authentication and stateful ACLs.",
  height: 52pt
)

#v(2pt)

== 9.6 Extended ACL Syntax & The Implicit Deny Rule
- *The Implicit Deny All:* Every ACL concludes with an invisible, hardcoded final rule: #hl[`deny ip any any`]. If a packet does not match any preceding permit statement, it is silently dropped! You must configure at least one `permit` statement.
- *Extended ACL Syntax Example:* Block subnet `192.168.10.0/24` from accessing Accounting server `10.1.1.5` on HTTP (port 80) and HTTPS (port 443), while permitting all other traffic:
  ```bash
  Router(config)# access-list 101 deny tcp 192.168.10.0 0.0.0.255 host 10.1.1.5 eq 80
  Router(config)# access-list 101 deny tcp 192.168.10.0 0.0.0.255 host 10.1.1.5 eq 443
  Router(config)# access-list 101 permit ip any any
  Router(config)# interface GigabitEthernet0/0/0
  Router(config-if)# ip access-group 101 in
  ```

#pagebreak()

== 9.7 Switch Port Security & MAC Address Limiting
Port Security protects enterprise access switches against MAC address flooding attacks, rogue switches, and unauthorized laptop connections:
- *Port Prerequisite:* Port Security can #hl[ONLY be enabled on static Access ports] (or voice ports); it will reject dynamic trunking ports (`switchport mode access` is mandatory).
- *MAC Learning Methods:*
  - *Manual:* `switchport port-security mac-address 0011.2233.4455` (Static entry).
  - *Sticky Learning:* Dynamically learns connected MAC addresses and automatically saves them into the `running-config`: `switchport port-security mac-address sticky`.
- *Violation Modes:* What happens when an unauthorized host connects or the maximum MAC limit is exceeded:

#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Violation Mode*], [*Drops Frames?*], [*Generates Syslog?*], [*Port State & Operational Impact*]),
  [Protect], [Yes], [No], [Silently drops frames from unauthorized MACs. Port remains active (`up/up`). No alerts.],
  [Restrict], [Yes], [Yes (SNMP + Syslog)], [Drops frames, increments violation counter, emits syslog alarm. Port remains active.],
  [Shutdown], [Yes], [Yes (SNMP + Syslog)], [#hl[Immediately disables the port into err-disabled state]! Port LED turns solid amber.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "Recovering from Err-Disabled State")[
      When a port is placed in `err-disabled` by Port Security:\
      1. Disconnect the offending unauthorized device.\
      2. Issue shutdown command: `Switch(config-if)# shutdown`\
      3. Re-enable port: `Switch(config-if)# no shutdown`\
      Or configure automatic recovery:\
      `Switch(config)# errdisable recovery cause psecure-violation`
    ]
  ],
  [
    #concept-box(title: "Wildcard Mask Inversion Shortcut")[
      To compute wildcard mask for an exact host:\
      `host 192.168.1.50` $arrow$ #hl[`192.168.1.50 0.0.0.0`]\
      To match any address:\
      `any` $arrow$ #hl[`0.0.0.0 255.255.255.255`]\
      To match a /27 subnet ($255.255.255.224$):\
      $255.255.255.255 - 255.255.255.224 = #hl[0.0.0.31]$
    ]
  ]
)

#v(2pt)

== 9.8 Production Port Security Configuration Template
```bash
Switch(config)# interface FastEthernet0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport port-security
Switch(config-if)# switchport port-security maximum 2
Switch(config-if)# switchport port-security mac-address sticky
Switch(config-if)# switchport port-security violation restrict
Switch# show port-security interface FastEthernet0/1
```

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why must Standard ACLs be placed as close to the destination as possible?", a: "Standard ACLs filter strictly on Source IP. If placed close to the source, they inadvertently block that host from accessing ALL destinations, including legitimate servers on other paths.")
#faq-item(q: "What is the difference between NAT and PAT (Port Address Translation)?", a: "Standard NAT maps one private IP to one public IP (1-to-1). PAT maps multiple private IPs to a single public IP by multiplexing unique Layer 4 port numbers (>1024), saving public IP addresses.")
#faq-item(q: "How does a router know which internal host initiated an outbound web connection in PAT?", a: "The router tracks the translation in its NAT state table, binding the internal host private IP and ephemeral port to a unique public port on its outside interface.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "Identify the 4 sequential steps in the client DHCP address acquisition process.", ans: "DORA: Discover, Offer, Request, Acknowledge.")
#short-q(num: 2, q: "Which Cisco interface command relays client broadcast DHCPDISCOVER requests to a remote DHCP server?", ans: "ip helper-address [server-ip].")
#short-q(num: 3, q: "What is the number range used to identify classic Standard IPv4 ACLs?", ans: "1 to 99 and 1300 to 1999.")
#short-q(num: 4, q: "Which Port Security violation mode puts the switch port into an err-disabled state upon violation?", ans: "Shutdown mode.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "What is the invisible, hardcoded rule present at the very end of every Cisco Access Control List?", a: "permit ip any any", b: "deny ip any any (Implicit Deny)", c: "log any", d: "permit tcp any any eq 80", ans: "B", expl: "All Cisco ACLs conclude with an implicit deny all statement; packets that do not match an explicit rule are dropped.")
#mcq(num: 2, q: "Which IP address term describes the registered public IPv4 address that represents an internal private host on the Internet?", a: "Inside Local", b: "Inside Global", c: "Outside Local", d: "Outside Global", ans: "B", expl: "Inside Global is the public IPv4 address assigned by an ISP that represents the private host to external networks.")
#mcq(num: 3, q: "What port security parameter dynamically learns connected MAC addresses and automatically saves them into running-config?", a: "mac-address dynamic", b: "mac-address sticky", c: "mac-address persistent", d: "mac-address auto", ans: "B", expl: "'switchport port-security mac-address sticky' converts learned dynamic MACs into permanent running-config statements.")
#mcq(num: 4, q: "Where should an Extended ACL be strategically placed for maximum network efficiency?", a: "As close to the destination as possible", b: "As close to the source of the traffic as possible", c: "Exclusively on the Core switch", d: "On the DHCP server interface", ans: "B", expl: "Extended ACLs filter on destination IP and port; placing them near the source drops unwanted packets before they traverse bandwidth.")
#mcq(num: 5, q: "What UDP ports are utilized by the DHCP client and server during address lease negotiation?", a: "Client UDP 67, Server UDP 68", b: "Client UDP 68, Server UDP 67", c: "Client TCP 53, Server TCP 53", d: "Client UDP 161, Server UDP 162", ans: "B", expl: "DHCP clients broadcast from source UDP port 68 to destination UDP port 67 on the server.")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Ephemeral Port Pool")[
      PAT supports up to 64,512 concurrent translated connections per public IP (ephemeral ports 1024 to 65535)!
    ]
  ],
  [
    #tech-spotlight-box(title: "Zero Trust Network Access (ZTNA)")[
      Modern enterprise security is transitioning from static perimeter ACLs to Zero Trust identity-based microsegmentation policies.
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
'''

with open(os.path.join(ENG_DIR, "chapter-06.typ"), "w", encoding="utf-8") as f:
    f.write(ch06)
with open(os.path.join(ENG_DIR, "chapter-07.typ"), "w", encoding="utf-8") as f:
    f.write(ch07)
with open(os.path.join(ENG_DIR, "chapter-08.typ"), "w", encoding="utf-8") as f:
    f.write(ch08)
with open(os.path.join(ENG_DIR, "chapter-09.typ"), "w", encoding="utf-8") as f:
    f.write(ch09)

print("[OK] Chapters 06, 07, 08, 09 English successfully written.")

# CHAPTER 10 (7 PAGES EXACT: TOP 50 INTERVIEW BANK + 30 VIVA + BLUEPRINT)
ch10 = '''#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 10 · MASTER PLACEMENT VAULT & VIVA GUIDE]
= Chapter 10: CCNA Top 50 MNC Interview Bank & Viva

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Comprehensive technical screening vault: 50 high-frequency placement questions with senior network architect model answers across all 6 CCNA domains (Cisco TAC, TCS, Infosys, Wipro, Airtel, Cognizant), 30 rapid-fire viva one-liners, exam strategy, and salary blueprint.
]

#v(2pt)

== 10.1 Network Fundamentals & Physical Layer (Q1 – Q8)
#interview-compact(num: 1, q: "Explain the difference between a collision domain and a broadcast domain.", a: "A collision domain is a physical network segment where frame collisions occur if two nodes transmit simultaneously; each switch port represents an independent collision domain. A broadcast domain is the logical area bounded by Layer 3 routers within which a broadcast frame (FFFF.FFFF.FFFF) is flooded to all nodes.", follow_up: "How many broadcast domains exist on a 24-port switch with 3 VLANs? Answer: Exactly 3.")
#interview-compact(num: 2, q: "What is the difference between Half-Duplex and Full-Duplex communication?", a: "Half-Duplex transmits in only one direction at a time and requires CSMA/CD to detect collisions (legacy hubs). Full-Duplex transmits and receives simultaneously across separate wire pairs, doubling throughput and completely eliminating collisions (switches).", follow_up: "What happens if autonegotiation fails? Answer: Port defaults to half-duplex, causing duplex mismatch.")
#interview-compact(num: 3, q: "Describe the encapsulation and de-encapsulation lifecycle across the OSI model.", a: "Data originates at Layer 7-5, is segmented with TCP/UDP port headers at Layer 4 (Segment), encapsulated with IP addresses at Layer 3 (Packet), framed with MAC addresses and FCS at Layer 2 (Frame), and converted to electrical/optical signals at Layer 1 (Bits). Receiver de-encapsulates in reverse order.", follow_up: "What layer does an IP router inspect? Answer: Layer 3 destination IP.")
#interview-compact(num: 4, q: "When is a Straight-Through cable used versus a Crossover cable?", a: "Straight-Through connects disparate Layer devices (PC to Switch, Switch to Router) using identical pinouts on both ends. Crossover connects like Layer devices (Switch to Switch, PC to Router) swapping pins 1/2 with 3/6. Auto-MDIX eliminates physical cable constraints dynamically.", follow_up: "Why do PC and router connect via crossover? Answer: Both transmit on pins 1/2.")
#interview-compact(num: 5, q: "What are the core differences between TCP and UDP?", a: "TCP (Transmission Control Protocol) is connection-oriented, reliable, orders packets, retransmits lost segments, and uses a 3-way handshake (SYN, SYN-ACK, ACK). UDP (User Datagram Protocol) is connectionless, unreliable, has minimal 8-byte header overhead, and is optimized for real-time VoIP and video streaming.", follow_up: "What protocol does DNS use? Answer: UDP 53 for queries, TCP 53 for zone transfers.")
#interview-compact(num: 6, q: "Explain the TCP 3-Way Handshake and 4-Way Teardown.", a: "Establishment: Client sends SYN (seq=x), server responds with SYN-ACK (seq=y, ack=x+1), client returns ACK (ack=y+1). Teardown: Client sends FIN, server ACKs, server sends FIN, client ACKs and waits 2MSL (Maximum Segment Lifetime).", follow_up: "What attack floods SYN without completing ACK? Answer: SYN Flood Denial of Service.")
#interview-compact(num: 7, q: "What are the distance and bandwidth constraints of Single-Mode vs Multi-Mode fiber?", a: "Single-Mode fiber (SMF, 9um core) uses laser light at 1310/1550nm to transmit up to 10-80+ km with negligible modal dispersion. Multi-Mode fiber (MMF, 50/62.5um core) uses LED/VCSEL at 850nm and is limited to 300-550m due to modal distortion.", follow_up: "What color is standard SMF patch cord? Answer: Yellow.")
#interview-compact(num: 8, q: "What is an MTU and what happens if a packet exceeds it?", a: "Maximum Transmission Unit (standard 1500 bytes for Ethernet). If a packet exceeds interface MTU and the Don't Fragment (DF) flag is set to 0, the router fragments it into smaller packets. If DF=1, the router drops it and returns ICMP Type 3 Code 4 (Fragmentation Needed).", follow_up: "What is Path MTU Discovery (PMTUD)? Answer: Method to discover lowest MTU along path.")

#pagebreak()

== 10.2 IPv4 Subnetting & IPv6 Architecture (Q9 – Q17)
#interview-compact(num: 9, q: "How do you calculate the usable hosts and network ID for 172.16.85.120/26?", a: "A /26 mask is 255.255.255.192. Magic Number is 256 - 192 = 64. Subnet multiples are 0, 64, 128. Host .120 falls in subnet 172.16.85.64. Broadcast address is .127. Usable host range is 172.16.85.65 through 172.16.85.126 (62 usable hosts).", follow_up: "What is the wildcard mask? Answer: 0.0.0.63.")
#interview-compact(num: 10, q: "What are the three RFC 1918 Private IP address blocks?", a: "Class A: 10.0.0.0/8 (10.0.0.0 - 10.255.255.255); Class B: 172.16.0.0/12 (172.16.0.0 - 172.31.255.255); Class C: 192.168.0.0/16 (192.168.0.0 - 192.168.255.255). These are not routable on the public Internet without NAT.", follow_up: "What is 169.254.0.0/16 used for? Answer: APIPA link-local failover.")
#interview-compact(num: 11, q: "Explain Variable Length Subnet Masking (VLSM) and its primary design rule.", a: "VLSM allows different subnet masks across the same network address space to minimize wasted IPs. The fundamental golden rule is to sort subnets in descending order of required host count (largest to smallest) before allocating prefixes.", follow_up: "Why not allocate /30 links first? Answer: It fragments contiguous address blocks.")
#interview-compact(num: 12, q: "What are the compression rules defined in RFC 5952 for IPv6?", a: "Rule 1: Leading zeros within any 16-bit hextet must be omitted (e.g. :0042: becomes :42:). Rule 2: A single contiguous sequence of all-zero hextets can be replaced with '::' exactly once per address.", follow_up: "Compress 2001:0db8:0000:0000:0001:0000:0000:0002. Answer: 2001:db8::1:0:0:2.")
#interview-compact(num: 13, q: "What is an IPv6 Link-Local Address (LLA) and what is its prefix?", a: "An LLA (prefix fe80::/10) is mandatory on all IPv6 interfaces, used strictly for communication within the local link (NDP neighbor discovery, routing protocol next-hop addresses). It is non-routable beyond the local physical subnet.", follow_up: "Can two interfaces on different routers have fe80::1? Answer: Yes, scope is link-local only.")
#interview-compact(num: 14, q: "How is an IPv6 EUI-64 Interface Identifier generated from a 48-bit MAC?", a: "The 48-bit MAC address is split into two 24-bit halves, the 16-bit hex constant 0xFFFE is inserted in the middle, and the 7th bit (Universal/Local flag) of the first byte is inverted (toggled from 0 to 1).", follow_up: "Convert MAC 00:11:22:33:44:55. Answer: 0211:22ff:fe33:4455.")
#interview-compact(num: 15, q: "Explain Stateless Address Autoconfiguration (SLAAC) in IPv6.", a: "A host transmits an ICMPv6 Router Solicitation (RS) to multicast ff02::2. The local router responds with a Router Advertisement (RA) to ff02::1 providing the /64 network prefix. The client generates its own 64-bit host ID and performs Duplicate Address Detection (DAD).", follow_up: "Does SLAAC require a DHCP server? Answer: No, it is completely stateless.")
#interview-compact(num: 16, q: "What replaces ARP broadcasts in IPv6?", a: "IPv6 replaces broadcast ARP with the Neighbor Discovery Protocol (NDP), utilizing ICMPv6 Neighbor Solicitation (NS) sent to a targeted Solicited-Node Multicast address (ff02::1:ffxx:xxxx) and Neighbor Advertisement (NA).", follow_up: "Why is NDP superior to ARP? Answer: Eliminates CPU-interrupting broadcasts.")
#interview-compact(num: 17, q: "What are the three primary IPv4-to-IPv6 transition mechanisms?", a: "1. Dual-Stack: Devices run both IPv4 and IPv6 stacks concurrently. 2. Tunneling: Encapsulating IPv6 packets inside IPv4 headers (6to4, GRE). 3. Translation: Converting IPv6 headers to IPv4 headers using NAT64 and DNS64.", follow_up: "Which is preferred for enterprise networks? Answer: Dual-Stack.")

#pagebreak()

== 10.3 Cisco IOS Architecture & Device Hardening (Q18 – Q26)
#interview-compact(num: 18, q: "What are the four primary memory types on a Cisco router and their roles?", a: "ROM stores POST, Bootstrap, and ROMMON mini-OS. Flash memory stores the Cisco IOS system image (.bin). NVRAM stores startup-config and configuration register. RAM stores running-config, routing tables, and ARP buffers (volatile).", follow_up: "Which memory is erased when power is lost? Answer: RAM.")
#interview-compact(num: 19, q: "Describe the 5 stages of the Cisco router boot sequence.", a: "1. POST executes from ROM. 2. Bootstrap loader initializes hardware. 3. IOS image is located (Flash, TFTP, or ROMMON). 4. IOS image is loaded into RAM. 5. Configuration register is checked: if 0x2102, loads startup-config from NVRAM; if 0x2142, enters setup dialog.", follow_up: "What mode is entered if flash is empty? Answer: ROMMON mode.")
#interview-compact(num: 20, q: "How do you recover a lost Cisco router password without wiping configuration?", a: "Interrupt boot with Break key into ROMMON. Issue 'confreg 0x2142' and 'reset'. In user exec, type enable. Copy startup-config to running-config. Configure new enable secret. Reset register to 0x2102 ('config-register 0x2102'). Save via 'copy run start'.", follow_up: "What happens if you run 'copy run start' before 'copy start run'? Answer: NVRAM config is wiped!")
#interview-compact(num: 21, q: "What is the difference between enable password and enable secret?", a: "enable password uses weak reversible Type 7 encryption or plaintext. enable secret uses irreversible cryptographic hashes (MD5 Type 5 or SHA-256 Type 8/9). Cisco IOS always prioritizes enable secret over enable password.", follow_up: "What does 'service password-encryption' do? Answer: Obfuscates plaintext passwords into Type 7.")
#interview-compact(num: 22, q: "What configuration commands are required to enable SSH v2 on a Cisco router?", a: "1. 'hostname R1', 2. 'ip domain-name test.com', 3. 'crypto key generate rsa modulus 2048', 4. 'ip ssh version 2', 5. 'username admin secret Pass123', 6. under line vty 0 4: 'transport input ssh' and 'login local'.", follow_up: "Why is domain-name mandatory? Answer: RSA keys require an FQDN to bind.")
#interview-compact(num: 23, q: "What is the purpose of 'logging synchronous' and 'exec-timeout 5 0' on line console 0?", a: "logging synchronous prevents unsolicited system log output from breaking up command typing. exec-timeout 5 0 automatically terminates idle console sessions after 5 minutes and 0 seconds of inactivity to enforce physical security.", follow_up: "What does 'exec-timeout 0 0' mean? Answer: Session never times out (security risk).")
#interview-compact(num: 24, q: "Compare Cisco Discovery Protocol (CDP) and Link Layer Discovery Protocol (LLDP).", a: "CDP is Cisco-proprietary, enabled by default, sends periodic multicast every 60s. LLDP is vendor-neutral IEEE 802.1AB standard used across mixed vendors. Both share device ID, port ID, capabilities, IP address, and platform info.", follow_up: "Why disable CDP on public ports? Answer: Prevents leaking reconnaissance data.")
#interview-compact(num: 25, q: "What is the function of the 'do' command in Cisco IOS CLI?", a: "The 'do' prefix allows privileged exec commands (such as 'do show ip int brief' or 'do show run') to be executed directly from within any configuration sub-mode without exiting back to privileged exec.", follow_up: "Can tab completion be used with 'do'? Answer: In modern IOS-XE versions, yes.")
#interview-compact(num: 26, q: "How do you recover a Cisco switch when the administrator password is unknown?", a: "Unplug switch power cord, hold the front-panel Mode button while reconnecting power. Release when SYST LED turns solid green. Issue 'flash_init', 'rename flash:config.text flash:config.old', and 'boot'. Rename back in IOS and change password.", follow_up: "Why rename config.text? Answer: Switch bootloader bypasses startup configuration.")

#pagebreak()

== 10.4 Switching, VLANs, Trunking & STP (Q27 – Q35)
#interview-compact(num: 27, q: "Explain the three core functions of a Layer 2 switch.", a: "1. Address Learning: Records Source MAC and port in CAM table (aging 300s). 2. Forwarding/Filtering: Forwards known unicast strictly out destination port; filters frames from looping. 3. Flooding: Floods unknown unicast, broadcast, and multicast out all ports in the same VLAN.", follow_up: "What causes a MAC address table overflow? Answer: MAC Flooding attack.")
#interview-compact(num: 28, q: "What is a VLAN and why is it implemented in campus enterprise networks?", a: "A VLAN is a logical broadcast domain created within physical switches. It segments traffic by department, contains broadcast storms, enhances security isolation, and allows QoS policies without requiring physical recabling.", follow_up: "Where is the normal-range VLAN database stored? Answer: flash:vlan.dat.")
#interview-compact(num: 29, q: "Describe the IEEE 802.1Q frame tagging format and Native VLAN security.", a: "802.1Q inserts a 4-byte tag into the Ethernet header containing TPID (0x8100), PCP/CoS (3 bits), and VLAN ID (12 bits, up to 4094 VLANs). Native VLAN traffic is untagged. Best practice: change native VLAN to an unused ID (e.g. 999) to prevent VLAN hopping.", follow_up: "What error occurs if native VLANs mismatch across a trunk? Answer: Native VLAN Mismatch CDP alarm.")
#interview-compact(num: 30, q: "How does Router-on-a-Stick (ROAS) perform Inter-VLAN routing?", a: "A single physical Gigabit interface connects to a switch trunk. The router interface is divided into logical subinterfaces (e.g. g0/0.10, g0/0.20), each configured with 'encapsulation dot1Q [vlan]' and assigned an IP acting as that VLAN's default gateway.", follow_up: "What is an alternative to ROAS? Answer: Layer 3 Switch with Switched Virtual Interfaces (SVIs).")
#interview-compact(num: 31, q: "What network hazards occur when redundant Layer 2 switch links lack Spanning Tree?", a: "1. Broadcast Storms (endless frame looping saturates 100% bandwidth). 2. CAM Table Instability / MAC thrashing (switch constantly overwrites MAC port mappings). 3. Multiple Frame Copies arriving out of order at destination endpoints.", follow_up: "Does Layer 2 Ethernet have a TTL field like IP? Answer: No, frames loop infinitely.")
#interview-compact(num: 32, q: "Explain the STP Root Bridge election math.", a: "The switch with the lowest Bridge ID (BID) wins. BID = Bridge Priority (2 bytes) + Extended System ID / VLAN ID + Base MAC (6 bytes). Default priority is 32768. To force a switch to become root, configure 'spanning-tree vlan [x] priority 4096' (multiples of 4096).", follow_up: "What is the priority for VLAN 20 if default? Answer: 32768 + 20 = 32788.")
#interview-compact(num: 33, q: "Differentiate between Root Port (RP), Designated Port (DP), and Blocking Port.", a: "Root Port (RP): One port per non-root switch with lowest cumulative path cost to Root Bridge; always Forwarding. Designated Port (DP): One port per segment forwarding traffic toward Root; all Root Bridge ports are DPs. Blocking Port: Redundant loop path; drops data frames.", follow_up: "How many Root Ports does a Root Bridge have? Answer: Exactly 0.")
#interview-compact(num: 34, q: "Compare STP (802.1D) and Rapid STP (RSTP 802.1w) convergence.", a: "802.1D takes 30-50 seconds (Blocking 20s, Listening 15s, Learning 15s, Forwarding) relying on static timers. RSTP (802.1w) converges in under 1 second using an active Proposal/Agreement handshake on point-to-point full-duplex links.", follow_up: "What are RSTP port states? Answer: Discarding, Learning, Forwarding.")
#interview-compact(num: 35, q: "What is the purpose of Spanning Tree PortFast and BPDU Guard?", a: "PortFast transitions access ports immediately from Discarding to Forwarding, bypassing 30s delays to prevent DHCP timeouts on booting PCs. BPDU Guard protects PortFast ports: if any device transmits a BPDU (rogue switch), the port is shut down into err-disabled state.", follow_up: "Should PortFast be enabled on trunk ports? Answer: NEVER, causes broadcast loops.")

#pagebreak()

== 10.5 IP Routing, OSPF, NAT & Security Services (Q36 – Q43)
#interview-compact(num: 36, q: "Explain the Longest Prefix Match (LPM) rule in routing table lookups.", a: "When a packet arrives, the router searches for matching destination prefixes. The route with the longest (most specific) subnet mask is ALWAYS chosen. E.g., for destination 10.1.1.5, route 10.1.1.0/24 wins over 10.1.0.0/16 and 10.0.0.0/8, regardless of Administrative Distance.", follow_up: "What route matches if no specific prefix matches? Answer: Default route 0.0.0.0/0.")
#interview-compact(num: 37, q: "What is a Floating Static Route and how is it configured?", a: "A floating static route is a backup route configured with an Administrative Distance higher than the primary dynamic routing protocol. It remains inactive in the background until the primary route fails: 'ip route 0.0.0.0 0.0.0.0 10.1.1.2 115' (backup for OSPF AD 110).", follow_up: "Why is it called floating? Answer: It floats into the routing table upon failure.")
#interview-compact(num: 38, q: "Explain how OSPF calculates link cost and why auto-cost reference-bandwidth is required.", a: "OSPF Cost = Reference Bandwidth / Interface Bandwidth (default 100 Mbps / BW). FastEthernet (100M) cost = 1; GigabitEthernet (1000M) cost = 0.1 which rounds to 1! 'auto-cost reference-bandwidth 10000' changes reference to 10 Gbps, giving Gigabit cost 10 and 10G cost 1.", follow_up: "Does changing reference-bandwidth need to be done on all routers? Answer: YES, strictly.")
#interview-compact(num: 39, q: "Describe the OSPF Router ID (RID) election criteria.", a: "1. Manual configuration via 'router-id [x.x.x.x]'. 2. Highest IPv4 address on any active Loopback interface. 3. Highest IPv4 address on any active physical interface in up/up operational state.", follow_up: "Why prefer Loopback interfaces? Answer: Loopbacks never drop or flap physically.")
#interview-compact(num: 40, q: "Explain the role of the OSPF Designated Router (DR) and Backup DR (BDR).", a: "On broadcast multi-access Ethernet, DR prevents full-mesh N(N-1)/2 flooding. Non-DR routers (DROther) form Full adjacencies only with DR and BDR. DROthers send updates to 224.0.0.6 (All DRs); DR floods updates to all routers via 224.0.0.5.", follow_up: "How is DR elected? Answer: Highest OSPF Priority (default 1), then highest RID.")
#interview-compact(num: 41, q: "Why must all non-backbone areas connect directly to Area 0 in Multi-Area OSPF?", a: "Area 0 acts as the central transit exchange. Forcing all inter-area traffic through Area 0 prevents routing loops by enforcing a split-horizon loop-free topology between areas. If physical connection is broken, an OSPF Virtual Link through a transit area is required.", follow_up: "What router connects Area 0 to Area 1? Answer: Area Border Router (ABR).")
#interview-compact(num: 42, q: "Explain the 4-step DHCP DORA process and DHCP Relay Agent.", a: "Discover (client broadcast UDP 67), Offer (server unicast UDP 68), Request (client broadcast UDP 67), Acknowledge (server unicast UDP 68). Because routers block broadcasts, 'ip helper-address [server-ip]' converts client Discover into unicast forwarded to the remote DHCP server.", follow_up: "What port does the relay agent forward to? Answer: UDP port 67 on the server.")
#interview-compact(num: 43, q: "What is the difference between Standard ACL and Extended ACL?", a: "Standard ACLs (1-99) filter strictly on Source IP address and must be placed as close to the Destination as possible. Extended ACLs (100-199) filter on Protocol, Source IP, Source Port, Dest IP, and Dest Port, and must be placed as close to the Source as possible.", follow_up: "What is at the end of every ACL? Answer: Implicit Deny All (deny ip any any).")

#pagebreak()

== 10.6 Advanced Security & Top 15 Viva Rapid-Fire One-Liners (Q44 – Q50 & Viva 1–15)
#interview-compact(num: 44, q: "Explain Port Address Translation (PAT / NAT Overload) and Inside Local vs Global.", a: "PAT maps multiple private inside local IPs to a single public inside global IP by tracking unique Layer 4 source ports (>1024). Inside Local is private client IP; Inside Global is public ISP IP on outside router interface.", follow_up: "How many translations can PAT support? Answer: Up to ~64,000 ephemeral ports.")
#interview-compact(num: 45, q: "Explain the three Switch Port Security violation modes.", a: "1. Protect: Silently drops frames from unauthorized MACs; no log. 2. Restrict: Drops frames, generates syslog/SNMP trap, increments violation counter. 3. Shutdown: Drops frames, generates syslog, immediately disables port into err-disabled state (amber LED).", follow_up: "Which mode is Cisco default? Answer: Shutdown mode.")
#interview-compact(num: 46, q: "What is EtherChannel and what protocols negotiate it?", a: "EtherChannel bundles up to 8 active parallel physical Ethernet links into a single logical link, multiplying bandwidth and providing instant fault tolerance without STP blocking. Negotiated via LACP (IEEE 802.3ad open standard) or PAgP (Cisco proprietary).", follow_up: "What LACP modes establish a channel? Answer: Active-Active or Active-Passive.")
#interview-compact(num: 47, q: "What is First Hop Redundancy Protocol (FHRP) and HSRP?", a: "Hot Standby Router Protocol (HSRP, RFC 2281) provides default gateway redundancy. Active and Standby routers share a Virtual IP and Virtual MAC (0000.0c07.acXX). If Active fails, Standby takes over forwarding transparently in under 3 seconds.", follow_up: "What enables faster failover? Answer: HSRP Preemption and tuning timers.")
#interview-compact(num: 48, q: "What is the difference between Control Plane, Data Plane, and Management Plane?", a: "Data Plane (Forwarding): Processes and forwards transit packets in hardware ASICs (routing table lookups, ACL filtering). Control Plane: Determines forwarding logic via software protocols (OSPF, BGP, STP). Management Plane: Handles administrative access (SSH, SNMP, HTTPS).", follow_up: "Which plane does Software-Defined Networking (SDN) centralize? Answer: Control Plane.")
#interview-compact(num: 49, q: "What is Cisco DNA Center and how does Intent-Based Networking function?", a: "Cisco DNA Center is a centralized network controller managing enterprise fabrics via APIs. It translates business intent (e.g. 'Isolate Guest Wi-Fi') into automated network configurations pushed across all switches and routers using RESTCONF/NETCONF.", follow_up: "What data formats do controller REST APIs return? Answer: JSON and YAML.")
#interview-compact(num: 50, q: "Explain the difference between Symmetric and Asymmetric Cryptography.", a: "Symmetric uses a single shared secret key for encryption and decryption (AES-256, fast, bulk data). Asymmetric uses a mathematically linked keypair: public key encrypts, private key decrypts (RSA, ECC, slow, used for key exchange and digital signatures).", follow_up: "Which does IPsec Phase 1 use? Answer: Asymmetric Diffie-Hellman to exchange symmetric keys.")

#v(2pt)

== 10.7 Top 15 Viva-Voce One-Liners (Part 1: 1–15)
#short-qa(num: 1, q: "What is the certified length limit of Cat6 copper Ethernet?", a: "100 meters (90m horizontal solid core + 10m patch cords).")
#short-qa(num: 2, q: "What is the broadcast MAC address?", a: "FFFF.FFFF.FFFF (48 binary ones).")
#short-qa(num: 3, q: "What is the default console baud rate on Cisco devices?", a: "9600 bps (9600-8-N-1).")
#short-qa(num: 4, q: "What command saves running-config to NVRAM?", a: "copy running-config startup-config (or write memory).")
#short-qa(num: 5, q: "What Configuration Register value ignores NVRAM during boot?", a: "0x2142 (Bit 6 set).")
#short-qa(num: 6, q: "What is the Administrative Distance of a static route?", a: "1.")
#short-qa(num: 7, q: "What is the default Administrative Distance of OSPF?", a: "110.")
#short-qa(num: 8, q: "What transport protocol and port does DNS query use?", a: "UDP Port 53.")
#short-qa(num: 9, q: "What protocol resolves an IP address to a physical MAC address?", a: "Address Resolution Protocol (ARP).")
#short-qa(num: 10, q: "What is the purpose of the 802.1Q Native VLAN?", a: "Carries untagged legacy traffic across an 802.1Q trunk.")
#short-qa(num: 11, q: "How many usable hosts exist in a /28 subnet?", a: "14 usable hosts (2^4 - 2 = 14).")
#short-qa(num: 12, q: "What multicast address reaches All OSPF Routers?", a: "224.0.0.5.")
#short-qa(num: 13, q: "What does an MTU mismatch between OSPF neighbors cause?", a: "Routers get stuck in ExStart / Exchange state.")
#short-qa(num: 14, q: "What is the default Spanning Tree bridge priority on VLAN 1?", a: "32769 (Base priority 32768 + Sys-ID-Ext 1).")
#short-qa(num: 15, q: "What does the command 'ip routing' do on a Layer 3 switch?", a: "Enables the Layer 3 IP routing engine between VLAN SVIs.")

#pagebreak()

== 10.8 Viva-Voce One-Liners (Part 2: 16–30) & 2027 CCNA Exam Strategy
#short-qa(num: 16, q: "What is the IPv6 loopback address?", a: "::1/128.")
#short-qa(num: 17, q: "What does APIPA address 169.254.x.x signify?", a: "Client failed to reach a DHCP server.")
#short-qa(num: 18, q: "What port security mode puts an offending interface into err-disabled?", a: "Shutdown mode.")
#short-qa(num: 19, q: "What is the default aging time of a Cisco switch CAM table entry?", a: "300 seconds (5 minutes).")
#short-qa(num: 20, q: "Which command generates 2048-bit RSA keys for SSH?", a: "crypto key generate rsa modulus 2048.")
#short-qa(num: 21, q: "What is the default hello and dead interval for OSPF on broadcast links?", a: "Hello 10 seconds, Dead 40 seconds.")
#short-qa(num: 22, q: "What Cisco command displays interface line status and IP addresses concisely?", a: "show ip interface brief.")
#short-qa(num: 23, q: "What does the command 'no ip domain-lookup' prevent?", a: "Prevents 30-second CLI hangs when mistyping invalid commands.")
#short-qa(num: 24, q: "What is the wildcard mask for subnet mask 255.255.255.252 (/30)?", a: "0.0.0.3.")
#short-qa(num: 25, q: "What is the HSRP virtual MAC address prefix for version 1?", a: "0000.0c07.acXX (where XX is group number in hex).")
#short-qa(num: 26, q: "What protocol replaces Telnet to provide encrypted remote management?", a: "SSH Version 2 (TCP Port 22).")
#short-qa(num: 27, q: "What does BPDU Guard do when receiving a BPDU on a PortFast port?", a: "Immediately shuts down the port into err-disabled state.")
#short-qa(num: 28, q: "What command configures a default static route pointing to 10.0.0.1?", a: "ip route 0.0.0.0 0.0.0.0 10.0.0.1.")
#short-qa(num: 29, q: "What is the first step in the 4-step DHCP address allocation process?", a: "DHCPDISCOVER broadcast from client.")
#short-qa(num: 30, q: "What is the default reference bandwidth in OSPF?", a: "100 Mbps (10^8 bps).")

#v(2pt)

== 10.9 Cisco CCNA 200-301 Exam Blueprint & 2027 Salary Matrix
#table(
  columns: (1.5fr, 1.2fr, 1.4fr, 2.1fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*CCNA 200-301 Exam Domain*], [*Exam Weight*], [*Study Priority*], [*Key Verification Skills*]),
  [1. Network Fundamentals], [20%], [High], [OSI/TCPIP, cabling, IPv4/IPv6 subnetting, wireless architecture.],
  [2. Network Access], [20%], [Critical], [VLANs, 802.1Q trunks, STP/RSTP root bridge, EtherChannel LACP.],
  [3. IP Connectivity], [25%], [Maximum], [Routing table LPM, static/default routes, OSPFv2 single/multi-area.],
  [4. IP Services], [10%], [Medium], [DHCP server/relay, NAT/PAT overload, NTP, SNMP, SSH v2.],
  [5. Security Fundamentals], [15%], [High], [Standard/Extended ACLs, port security violation, DAI, DHCP snooping.],
  [6. Automation & Programmability], [10%], [Emerging], [REST APIs, JSON data structures, DNA Center, Chef/Puppet/Ansible.]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "2027 Enterprise Salary Blueprint (India)")[
      - *L1 Network Support Engineer:* ₹3.5L – ₹5.2L CTC\
      - *NOC Network Engineer (Tier 2):* ₹5.5L – ₹8.5L CTC\
      - *Senior Network Administrator:* ₹9.0L – ₹14.0L CTC\
      - *Enterprise Network Architect / TAC:* ₹15.0L – ₹24.0L+ CTC\
      _Top Hiring MNCs: Cisco TAC, TCS, Wipro, Infosys, Airtel, Jio, HCL, Orange Business Services._
    ]
  ],
  [
    #concept-box(title: "Final Author Sign-Off & Congratulations")[
      *Congratulations!* You have completed the comprehensive 45-Page *RTechLab CCNA 200-301 Master Guide*.\
      Master every CLI syntax block, lab topology, and interview explanation in this guide. Technology made practical is your ultimate competitive advantage in the global enterprise IT industry.\
      #v(2pt)
      *Rahul Patel* · _Founder & Chief Technology Architect, RTechLab_
    ]
  ]
)
'''

with open(os.path.join(ENG_DIR, "chapter-10.typ"), "w", encoding="utf-8") as f:
    f.write(ch10)

print("[OK] Chapter 10 English successfully written.")
