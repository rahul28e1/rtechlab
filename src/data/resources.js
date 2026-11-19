export const resourcesData = [
  {
    id: "res-1",
    title: "Cisco CCNA 200-301 Ultimate Command & Subnetting Wall Sheet",
    titleHi: "सिस्को CCNA 200-301 अल्टीमेट कमांड एवं सबनेटिंग वॉल शीट",
    type: "Cheat Sheet",
    typeHi: "चीट शीट",
    category: "CCNA",
    size: "Compact Quick Reference",
    description: "All essential show commands, interface configurations, OSPF single/multi-area syntax, trunking encapsulation, and subnets from /24 to /30.",
    descriptionHi: "सभी आवश्यक शो कमांड्स, इंटरफ़ेस कॉन्फ़िगरेशन, OSPF सिंटेक्स और /24 से /30 तक के सबनेट ब्लॉक्स।",
    highlights: ["Show ip route flags", "OSPF states reference", "VLAN trunking commands", "Standard & Extended ACL logic"],
    contentDetails: `
### Cisco CCNA Essential Commands
- \`show ip interface brief\` : Check Layer 1 & 2 status of all ports
- \`show ip route\` : Display routing table (C, S, O, D, R flags)
- \`show running-config | section ospf\` : Filter configuration block
- \`show mac address-table dynamic\` : Inspect switch MAC forwarding table
- \`show interfaces trunk\` : Verify 802.1Q tagged ports and allowed VLANs
- \`show ip ospf neighbor\` : Check adjacency state (2-WAY, FULL/DR, FULL/BDR)
- \`copy running-config startup-config\` : Persist active config to NVRAM
    `
  },
  {
    id: "res-2",
    title: "Linux SysAdmin & Troubleshooting Emergency Command Card",
    titleHi: "लिनक्स सिस्टम एडमिन एवं समस्या निवारण कमांड कार्ड",
    type: "Quick Card",
    typeHi: "त्वरित कार्ड",
    category: "Linux",
    size: "CLI Reference",
    description: "Production commands for investigating high CPU, memory leaks, runaway processes, active socket listeners, and permission debugging.",
    descriptionHi: "उच्च CPU उपयोग, मेमोरी लीक, एक्टिव सॉकेट्स और फ़ाइल अनुमतियों की जांच के लिए प्रोडक्शन कमांड्स।",
    highlights: ["htop & top key shortcuts", "ss -tulpn socket audit", "journalctl -xeu service analysis", "find with perm and mtime flags"],
    contentDetails: `
### Linux Troubleshooting Commands
- \`top -b -n 1 | head -n 20\` : Instant CPU & memory snapshot
- \`ss -tulpn\` : Display listening TCP and UDP sockets with PID & process name
- \`journalctl -xeu <service-name>\` : Inspect recent systemd unit crash logs
- \`df -h && df -i\` : Check both disk capacity and inode exhaustion
- \`free -m\` : Inspect buffer/cache and swap utilization
- \`chmod -R u=rwX,go=rX /path\` : Sensible recursive directory & file permission fix
    `
  },
  {
    id: "res-3",
    title: "OSI 7 Layers vs TCP/IP Protocol Architecture Blueprint",
    titleHi: "OSI 7 लेयर्स बनाम TCP/IP प्रोटोकॉल आर्किटेक्चर ब्लूप्रिंट",
    type: "Architecture Diagram",
    typeHi: "आर्किटेक्चर आरेख",
    category: "Networking",
    size: "Conceptual Map",
    description: "Comprehensive cross-reference comparing OSI layers (Application to Physical), Protocol Data Units (Bits, Frames, Packets, Segments), and hardware devices.",
    descriptionHi: "OSI मॉडल और TCP/IP प्रोटोकॉल सूट, प्रोटोकॉल डेटा यूनिट्स (PDU) और संबंधित नेटवर्किंग डिवाइसेस की विस्तृत तुलना।",
    highlights: ["PDU Mapping (Bits -> Frames -> Packets -> Segments)", "Header encapsulation visuals", "Layer 2 MAC vs Layer 3 IP vs Layer 4 Ports"],
    contentDetails: `
### Protocol Data Unit (PDU) Stacking
1. **Layer 7 - Application**: Data (HTTP, DNS, SSH, FTP, NTP)
2. **Layer 6 - Presentation**: Encryption / Compression (TLS, ASCII, JPEG)
3. **Layer 5 - Session**: Session checkpoints & RPC sync
4. **Layer 4 - Transport**: Segments (TCP) / Datagrams (UDP) - Port Numbers
5. **Layer 3 - Network**: Packets (IPv4, IPv6, ICMP, OSPF, ARP) - IP Addresses & Routers
6. **Layer 2 - Data Link**: Frames (Ethernet, 802.11 Wi-Fi, PPP) - MAC Addresses & Switches
7. **Layer 1 - Physical**: Bits / Signals (Cat6 Copper, Single-mode Fiber, Radio Frequencies, Hubs/NICs)
    `
  },
  {
    id: "res-4",
    title: "Network Troubleshooting Step-by-Step Flowchart",
    titleHi: "नेटवर्क समस्या निवारण स्टेप-बाय-स्टेप फ्लोचार्ट",
    type: "Methodology Guide",
    typeHi: "कार्यप्रणाली गाइड",
    category: "Support & NOC",
    size: "Diagnostic Guide",
    description: "The systematic Layer 1 to Layer 7 diagnostic procedure used by enterprise NOC and tier-1/2 support engineers to resolve connectivity dropouts.",
    descriptionHi: "इंटरप्राइज NOC और सपोर्ट टीमों द्वारा उपयोग की जाने वाली व्यवस्थित लेयर 1 से लेयर 7 डायग्नोस्टिक प्रक्रिया।",
    highlights: ["Ping localhost 127.0.0.1 (TCP/IP stack test)", "Gateway verification", "Public IP ICMP vs DNS resolution check", "Traceroute MTU & hop dropoff analysis"],
    contentDetails: `
### Systematic NOC Troubleshooting Ladder
1. **Physical Link Check**: Check cable LEDs (Green = link UP, Amber = 100M/fault). Run \`show interface\` for input errors / CRC counts.
2. **Local TCP/IP Stack**: Run \`ping 127.0.0.1\` or \`ping ::1\`. Tests OS driver and IP stack integrity.
3. **Default Gateway**: Ping your local gateway (e.g., \`192.168.1.1\`). Tests Layer 2 ARP resolution and local switch fabric.
4. **Internet Hop / External IP**: Ping \`8.8.8.8\` or \`1.1.1.1\`. Tests NAT, upstream ISP routing, and WAN connectivity.
5. **DNS Name Resolution**: Run \`nslookup rtechlab.com\` or \`dig +short google.com\`. Distinguishes DNS lookup failures from pure network drops.
6. **Port Level / Application**: Run \`curl -Iv https://rtechlab.com\` or \`nc -zv <host> <port>\`. Tests TCP handshake and TLS certificate validity.
    `
  }
];
