// =============================================================================
// CHAPTER 11: IIS 10.X WEB SERVER, SECURE FTP & REMOTE DESKTOP SERVICES (RDS)
// =============================================================================

[#metadata("ch11") <chapter-11>]

#chapter-header(
  chapter-num: "CHAPTER 11",
  category: "PART 11: WEB APPLICATIONS & REMOTE DESKTOP SERVICES (IIS & RDS)",
  title: "IIS Web Server, Secure FTP & Remote Desktop Services (RDS)",
  subtitle: "IIS 10.x Role · Intranet Portals · SSL/TLS Certificate Binding HTTPS · Secure FTP Server · Remote Desktop Services (RDS / VDI) Architecture"
)

=== 11.1 Internet Information Services (IIS 10.x) Role & Internal Intranet Portals
Every multinational enterprise (MNC) hosts internal corporate intranet portals, payroll web applications, IT ticketing platforms, and documentation libraries for its employees.

#mark-yellow[Internet Information Services (IIS) is Microsoft's flagship enterprise web and FTP server engine, engineered to host ASP.NET, PHP, HTML5, and secure web services on Windows Server with high throughput and hardened enterprise security.]

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/iis_rds_architecture.png", width: 25%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[Figure 11.1: IIS 10.x Web Server & Remote Desktop Services (RDS) Enterprise Architecture]
]

#v(1pt)

*IIS 10.x Installation Steps:*
1. Open #hl-yellow[Server Manager] -> Navigate to #hl-green[Add Roles and Features].
2. Under Server Roles -> Check the box for #mark-yellow[Web Server (IIS)].
3. In 'Role Services', verify that #hl-green[Default Document], #hl-green[Directory Browsing], #hl-green[HTTP Errors], #hl-green[HTTP Redirection], and #hl-green[FTP Server] are selected.
4. Click 'Install'. After installation completes, navigating to `http://localhost/` in a web browser displays the iconic blue official IIS welcome splash page.

#v(1.5pt)

=== 11.2 Creating a Website, Port Bindings & Virtual Directories
1. Open #hl-yellow[Internet Information Services (IIS) Manager] from the Tools menu (or execute: #mark-green[`inetmgr`] in the Run dialog).
2. In the left Connections pane, right-click `Sites` -> Select #hl-green[Add Website...].
3. #text(weight: "bold")[Site name:] `RTechLab-Portal`.
4. #text(weight: "bold")[Physical path:] The local folder where your website's HTML assets reside (e.g., `C:\inetpub\wwwroot\portal`).
5. #text(weight: "bold")[Binding:] Type: `http`, IP address: `All Unassigned` (or `192.168.1.10`), Port: `80`. Host name: #hl-green[`portal.corp.rtechlab.local`].
6. Click 'OK'. With the corresponding `portal` CNAME record pre-configured in our DNS server, any workstation across the enterprise network can immediately access the portal by visiting `http://portal.corp.rtechlab.local`!

#v(1.5pt)

=== 11.3 SSL/TLS HTTPS Certificate Binding (#hl-green[Port 443])
In production enterprise environments, no web portal should ever run unencrypted over cleartext HTTP #hl-green[Port 80]:
- Open Server Certificates in IIS Manager and generate or import a certificate from an Enterprise Certificate Authority (AD CS) or a trusted public CA.
- Open Site Bindings for the website -> Click #hl-green[Add...] -> Set Type: #mark-yellow[https], Port: #hl-green[443], and select the SSL certificate: `RTechLab-SSL-Cert`, then click 'OK'.
- The website is now served securely over #hl-green[`https://portal.corp.rtechlab.local`] fortified with 256-bit TLS cryptographic encryption.

#v(1.5pt)

=== 11.4 Secure FTP Server & FTP User Isolation
When software developers, external vendors, or automated backup agents need to transfer large datasets to the server, FTP over TLS is deployed:
- In IIS Manager, right-click Sites -> Select #hl-yellow[Add FTP Site...].
- Under Authentication select #hl-green[Basic], and under Authorization grant 'Specified users' (`corp\developers`) granular 'Read & Write' permissions.
- #text(weight: "bold", fill: rtech-navy)[FTP User Isolation:] Restricts each connecting authenticated user (e.g., 'rpatel') strictly to their own dedicated directory (`C:\FTPROOT\LocalUser\rpatel`), rendering all other corporate directories completely invisible and inaccessible.

#v(1.5pt)

=== 11.5 Remote Desktop Services (RDS / VDI) Architecture
When an enterprise supports thousands of distributed remote employees working from home, furnishing high-end physical laptops is cost-prohibitive. Instead, organizations deploy centralized virtual desktops and published applications on server infrastructure:

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[The 5 Core Architectural Roles of RDS (MNC Interview Goldmine):]\
    - #text(weight: "bold", fill: rtech-blue)[1. RD Web Access:] The web portal interface allowing remote workers to authenticate and launch published corporate RemoteApps and virtual desktops from any browser.
    - #text(weight: "bold", fill: rtech-rose)[2. RD Gateway:] Encapsulates external inbound RDP traffic inside secure #hl-orange[HTTPS (#hl-green[Port 443])], allowing seamless traversal through external corporate firewalls without requiring a full-tunnel VPN.
    - #text(weight: "bold", fill: rtech-amber)[3. RD Connection Broker:] Reconnects users to their existing disconnected sessions upon network interruptions and distributes incoming session workloads evenly across farm servers.
    - #text(weight: "bold", fill: rtech-emerald)[4. RD Session Host (RDSH):] The multi-session powerhouse server running concurrent hosted desktop sessions and published business applications for 50 to 100+ active users.
    - #text(weight: "bold", fill: rtech-navy)[5. RD Licensing Server:] Tracks, issues, and validates Client Access Licenses (CALs — Per-User or Per-Device) for all connecting endpoints.
  ]
)

#v(1pt)

// =============================================================================
// CHAPTER 11 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  In IIS 10.x, every web application executes within an isolated #hl-yellow[Application Pool] served by its own dedicated worker process (`w3wp.exe`). If a server hosts 20 distinct websites and one buggy application suffers a fatal crash or memory leak, only that single website terminates; the remaining 19 web applications continue running at 100% availability without disruption!
]

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 Chapter 11 Practice Multiple-Choice Questions (Practice MCQs)]
#v(1.5pt)

#mcq-item(
  num: "1",
  q: "What is the official Microsoft run command to directly open the Internet Information Services (IIS) Manager console?",
  optA: "iis.msc",
  optB: "inetmgr",
  optC: "webmgmt.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "inetmgr (Internet Information Services Manager) is the official management shortcut for IIS."
)

#v(1pt)

#mcq-item(
  num: "2",
  q: "Which official IANA port number is used in IIS Web Server for hosting secure SSL/TLS encrypted HTTPS websites?",
  optA: "#hl-green[Port 80]",
  optB: "#hl-green[Port 443]",
  optC: "#hl-green[Port 3389]",
  optD: "#hl-green[Port 80]80",
  ans: "B",
  exp: "HTTP operates over #hl-green[Port 80], whereas secure SSL/TLS encrypted HTTPS traffic runs over #hl-green[Port 443]."
)

#v(1pt)

#mcq-item(
  num: "3",
  q: "In Remote Desktop Services (RDS), which role encapsulates RDP traffic inside HTTPS (#hl-green[Port 443]) to enable secure Internet connectivity without VPN?",
  optA: "RD Session Host",
  optB: "RD Gateway",
  optC: "RD Connection Broker",
  optD: "RD Licensing",
  ans: "B",
  exp: "RD Gateway builds an encrypted RDP-over-HTTPS (#hl-green[Port 443]) tunnel across corporate firewalls."
)

#v(1pt)

#mcq-item(
  num: "4",
  q: "Which process isolation mechanism in IIS ensures that a crash in one web application does not affect other hosted websites?",
  optA: "Hyper-V VM",
  optB: "Application Pool (w3wp.exe)",
  optC: "NTFS Quota",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "Application Pools isolate each web application within its own dedicated worker process (w3wp.exe)."
)

#v(1pt)

#mcq-item(
  num: "5",
  q: "Which feature in an IIS FTP server is enabled to restrict each connecting user exclusively to their own dedicated directory?",
  optA: "Anonymous Authentication",
  optB: "FTP User Isolation",
  optC: "Directory Browsing",
  optD: "IP Filtering",
  ans: "B",
  exp: "FTP User Isolation isolates users within their designated private folders, hiding other users' directories."
)

#v(1pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 Top MNC Placement Interview Questions (High-Yield Interview Vault)]
#v(1pt)

#interview-item(
  num: "1",
  q: "Interviewer: 'What is an Application Pool Recycle in IIS, and why is it essential in web operations?'",
  a: "Answer: Over prolonged execution, web applications may suffer from gradual memory leaks, unmanaged object accumulation, or fragmented caches. An Application Pool Recycle shuts down the aging worker process (w3wp.exe) and spawns a fresh, clean process. Through IIS 'Overlapped Recycling', the new worker process starts and handles incoming requests before the old process terminates, reclaiming RAM with zero downtime for connected users.",
  tip: "A recurring technical question in IIS web server operations interviews at Wipro, Cognizant, and Infosys."
)

#v(1pt)

#interview-item(
  num: "2",
  q: "Interviewer: 'What is the architectural difference between RD Gateway and a traditional corporate VPN?'",
  a: "Answer: A corporate VPN assigns a full internal corporate IP address to the client endpoint, exposing the entire private subnet to viruses or compromise if the endpoint is infected. In contrast, RD Gateway permits strictly encapsulated RDP traffic over HTTPS (Port 443) targeting specific approved hosts. The client device never connects directly to the internal network—only encrypted display pixels are transmitted (Zero Trust architecture).",
  tip: "A stellar response highlighting modern enterprise cybersecurity and Zero Trust remote access principles."
)

#v(1pt)

#interview-item(
  num: "3",
  q: "Interviewer: 'How can you host 5 distinct websites on a single IIS server using a single IP address and #hl-green[Port 80]?'",
  a: "Answer: Through 'Host Headers' (Hostname Bindings). In IIS, all five websites share IP 192.168.1.10 and #hl-green[Port 80], but each is assigned a distinct Host Name (e.g., site1.corp.local, site2.corp.local). When a client sends an HTTP GET request, IIS inspects the 'Host:' header in the incoming HTTP request packet and routes traffic to the matching website binding seamlessly.",
  tip: "A classic fundamental interview question evaluating web hosting and server consolidation proficiency."
)

#v(1pt)

#interview-item(
  num: "4",
  q: "Interviewer: 'What is the distinction between a Per-User CAL and a Per-Device CAL in Remote Desktop Services?'",
  a: "Answer: A Per-User CAL licenses an individual employee regardless of how many devices (laptop, home PC, tablet) they use to connect to RDS—ideal for mobile knowledge workers. A Per-Device CAL licenses a single physical workstation regardless of how many employees log in across multiple rotating shifts—ideal for 24/7 operations like call centers and hospital reception desks.",
  tip: "An essential question in enterprise infrastructure licensing and IT budgeting interviews."
)

#v(1pt)

#interview-item(
  num: "5",
  q: "Interviewer: 'What is the most common root cause of HTTP Error 503: Service Unavailable in IIS?'",
  a: "Answer: In over 95% of cases, HTTP Error 503 occurs because the website's associated 'Application Pool' has stopped or crashed (frequently caused by invalid service account credentials, exhausted worker threads, or Rapid-Fail Protection shutting the pool down after multiple unhandled application crashes). Opening IIS Manager and restarting the stopped Application Pool is the primary immediate remedy.",
  tip: "The most common real-world incident management scenario encountered in L1/L2 Web Support roles."
)

#v(1pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 Chapter 11 Corporate Takeaways:]\
    #text(size: 7.5pt, fill: rtech-text)[
      - IIS 10.x isolates and shields enterprise web applications using independent Application Pools.
      - RD Gateway delivers secure, firewall-friendly remote work access over Port 443 without traditional bulky VPN overhead.
      - Host Headers enable consolidation of multiple corporate web applications on a single IP address and port.
    ]
  ]
)

#pagebreak()
