#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-emerald)[CHAPTER 11 · IP ROUTING, STATIC ROUTES & IP SLA]
= Chapter 11: IPv4 Routing Tables, Static Routes & Floating Failover with IP SLA Lab

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Routing table architecture, route lookup logic, Longest Prefix Match (LPM), Administrative Distance hierarchy, next-hop vs exit-interface, default routing, and production Floating Static Route failover with IP SLA ICMP tracking.
]

#v(2pt)

== 11.1 The Routing Table & Route Lookup Logic
A router is a Layer 3 device that makes forwarding decisions based on destination IP addresses:
- *Longest Prefix Match (LPM) Rule:* If multiple routes exist to a destination, the router strictly forwards the packet using the route with the #hl[longest (most specific) subnet mask], regardless of Administrative Distance or metric!
  - Example: Given destination `10.1.5.50`, between `10.0.0.0/8` and `10.1.5.0/24`, the router #hl[always selects 10.1.5.0/24].
- *Routing Table Codes:* `L` = Local (router's own /32 interface IP), `C` = Connected, `S` = Static, `O` = OSPF, `D` = EIGRP, `B` = BGP, `*` = Candidate Default Route.

#v(2pt)

== 11.2 Administrative Distance (AD) Complete Hierarchy
Administrative Distance defines the #hl[trustworthiness of the routing information source] (lower is more trustworthy):
#table(
  columns: (1.5fr, 1.2fr, 3.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Routing Protocol / Source*], [*Default AD*], [*Architectural Trust & Usage*]),
  [Directly Connected Interface], [0], [Physical link up with IP address assigned. Absolute trust.],
  [Static Route], [1], [Manually configured path by network administrator.],
  [External BGP (eBGP)], [20], [Inter-Autonomous System routing across Internet carriers.],
  [EIGRP (Internal)], [90], [Cisco advanced distance-vector enterprise protocol.],
  [OSPF], [110], [Industry standard open link-state routing protocol.],
  [IS-IS], [115], [Link-state protocol favored by major Internet Service Providers.],
  [RIP], [120], [Legacy distance-vector protocol (metric is hop count).],
  [EIGRP (External)], [170], [Routes redistributed into EIGRP from external sources.],
  [Internal BGP (iBGP)], [200], [Intra-AS BGP routing across enterprise backbone routers.],
  [Unusable / Unknown], [255], [Untrusted route; router will never install into routing table.]
)

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab06-routing-failover-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[Figure 11.1: Packet Tracer Lab 06 — Dual-ISP Floating Failover with IP SLA Tracking.]
]

#pagebreak()

== 11.3 Static Route Types & Syntax
Static routes provide deterministic traffic engineering without protocol overhead:
- *Next-Hop Static Route:* `ip route 10.1.0.0 255.255.0.0 192.168.1.2` (Requires recursive routing table lookup to find exit interface).
- *Directly Connected Static Route:* `ip route 10.1.0.0 255.255.0.0 GigabitEthernet0/0/1` (Requires proxy ARP on broadcast networks).
- *Fully Specified Static Route:* `ip route 10.1.0.0 255.255.0.0 GigabitEthernet0/0/1 192.168.1.2` (Best practice on multi-access links).
- *Default Route (Gateway of Last Resort):* Matches all packets when no specific route exists:
  `ip route 0.0.0.0 0.0.0.0 <next-hop>`

#v(2pt)

== 11.4 Production Floating Static Route with IP SLA ICMP Tracking
A standard Floating Static Route has a manually elevated Administrative Distance (e.g., AD 10). However, if an upstream ISP router fails beyond the local physical port, the local interface remains UP, and traffic is blackholed!
- *Solution: Cisco IP SLA (Service Level Agreement) Tracking:*
  The router actively pings an Internet target (e.g., `8.8.8.8`) every 5 seconds. If the ping fails, the tracking object drops, and the router #hl[instantly uninstalls the primary route and activates the floating backup route]:
#terminal-box([
```cisco
! Step 1: Configure IP SLA probe to ping Google DNS:
Edge-RTR(config)# ip sla 1
Edge-RTR(config-ip-sla)# icmp-echo 8.8.8.8 source-interface GigabitEthernet0/0/0
Edge-RTR(config-ip-sla)# frequency 5
Edge-RTR(config-ip-sla)# exit
Edge-RTR(config)# ip sla schedule 1 life forever start-time now

! Step 2: Bind IP SLA probe to Track Object 1:
Edge-RTR(config)# track 1 ip sla 1 reachability
Edge-RTR(config-track)# exit

! Step 3: Primary Default Route tied to Track 1:
Edge-RTR(config)# ip route 0.0.0.0 0.0.0.0 198.51.100.1 track 1

! Step 4: Floating Backup Default Route with Administrative Distance 10:
Edge-RTR(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.2 10
```
])

#v(2pt)

== 11.5 Route Verification & Troubleshooting Commands
#terminal-box([
```cisco
Edge-RTR# show ip route
Gateway of last resort is 198.51.100.1 to network 0.0.0.0
S*    0.0.0.0/0 [1/0] via 198.51.100.1
Edge-RTR# show track 1
Track 1
  IP SLA 1 reachability
  Reachability is Up
  1 change, last change 00:04:12
```
])

#pagebreak()

== Student Technical FAQs
#faq-box("What is the difference between Administrative Distance and Metric?", "Administrative Distance selects the best routing protocol when multiple protocols offer routes to the exact same network. Metric selects the best path among multiple routes discovered by the SAME routing protocol.")
#faq-box("Why is a floating static route not visible in 'show ip route' during normal operation?", "A floating static route has a higher Administrative Distance (e.g., 10) than the primary route (AD 1). Cisco IOS only installs the most trustworthy route into the routing table. It only appears when the primary route fails.")
#faq-box("What is a recursive lookup?", "When a static route specifies only a next-hop IP address, the router must perform a second lookup in the routing table to find which physical exit interface reaches that next-hop IP.")

#v(2pt)

== Short-Answer Technical Review
1. *State the rule routers use when deciding between routes with different prefix lengths:* Longest Prefix Match (LPM) rule — the route with the most specific (longest) subnet mask is always chosen.
2. *Identify the default Administrative Distance of OSPF:* 110.
3. *What is the purpose of an IP SLA tracking object in routing failover?* It actively monitors end-to-end reachability beyond the local link, removing a failed primary static route even when the physical interface stays up.
4. *Write the Cisco IOS command for a default static route via next-hop 192.168.1.1:* `ip route 0.0.0.0 0.0.0.0 192.168.1.1`.

#v(2pt)

== High-Yield Exam MCQs
#mcq-item(
  "A router's routing table contains 10.0.0.0/8 via OSPF (AD 110) and 10.1.2.0/24 via RIP (AD 120). A packet arrives destined for 10.1.2.55. Which path will the router select?",
  ("OSPF path because it has lower AD", "RIP path because of Longest Prefix Match", "Both paths with ECMP load balancing", "The packet is dropped"),
  1,
  "Longest Prefix Match (/24 vs /8) always takes precedence over Administrative Distance during packet forwarding."
)

#mcq-item(
  "What is the Administrative Distance of a static route configured with 'ip route 10.0.0.0 255.0.0.0 192.168.1.1 50'?",
  ("1", "50", "110", "0"),
  1,
  "The integer appended to the end of a static route command overrides the default AD of 1 with the specified value (50)."
)

#mcq-item(
  "Which routing protocol source has an Administrative Distance of 90?",
  ("Internal BGP", "External BGP", "Internal EIGRP", "OSPF"),
  2,
  "Internal EIGRP has an Administrative Distance of 90."
)

#v(2pt)

== Did You Know & 2027 Tech Spotlight
#fact-box("Did You Know? The World's Full Internet BGP Table", "Global Internet Core Routers do not use default routes. As of 2027, the global Internet BGP routing table exceeds 980,000 active IPv4 routes and 210,000 IPv6 routes, requiring specialized TCAM memory in carrier chassis.")

#spotlight-box("2027 Tech Spotlight: Cisco SD-WAN Dynamic Path Selection", "Enterprise branch routers no longer rely solely on IP SLA ping probes. Cisco SD-WAN continuously measures jitter, packet loss, and latency on every link in real-time, dynamically steering Zoom and Microsoft Teams traffic to the lowest-latency ISP.")
