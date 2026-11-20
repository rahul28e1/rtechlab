#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
      When a port is placed in `err-disabled` by Port Security:      1. Disconnect the offending unauthorized device.      2. Issue shutdown command: `Switch(config-if)# shutdown`      3. Re-enable port: `Switch(config-if)# no shutdown`      Or configure automatic recovery:      `Switch(config)# errdisable recovery cause psecure-violation`
    ]
  ],
  [
    #concept-box(title: "Wildcard Mask Inversion Shortcut")[
      To compute wildcard mask for an exact host:      `host 192.168.1.50` $arrow$ #hl[`192.168.1.50 0.0.0.0`]      To match any address:      `any` $arrow$ #hl[`0.0.0.0 255.255.255.255`]      To match a /27 subnet ($255.255.255.224$):      $255.255.255.255 - 255.255.255.224 = #hl[0.0.0.31]$
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
