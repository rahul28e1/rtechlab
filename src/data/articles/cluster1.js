/**
 * RTechLab SEO Content Cluster 1: Networking & Systems Fundamentals
 * Comprehensive, bilingual (EN & HI) educational guides with FAQs, CLI examples, and interactive tool links.
 */

export const cluster1Articles = [
  // 1. What is an IP Address?
  {
    id: "what-is-an-ip-address",
    title: "What Is an IP Address? IPv4 Architecture Explained for Beginners",
    titleHi: "IP एड्रेस क्या है? शुरुआती लोगों के लिए IPv4 आर्किटेक्चर की पूरी जानकारी",
    metaDescription: "Learn what an IP address is, how IPv4 32-bit dotted-decimal addressing works, the difference between network and host portions, and public vs private scopes.",
    metaDescriptionHi: "IP एड्रेस क्या होता है? IPv4 के 32-बिट आर्किटेक्चर, नेटवर्क और होस्ट भाग, तथा पब्लिक और प्राइवेट IP के बीच का अंतर सरल हिंदी में समझें।",
    category: "Networking Fundamentals",
    readTime: "7 min",
    difficulty: "Foundational",
    difficultyHi: "बुनियादी",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "CompTIA Network+ & CCNA",
    topology: "[Client Host: 192.168.1.15/24] ---> [Default Gateway: 192.168.1.1] ---> [Public Internet: 8.8.8.8]",
    prerequisites: "No prior networking knowledge required. Basic concept of devices communicating on a LAN.",
    objectives: [
      "Understand the Layer 3 Logical Addressing role of an IP address",
      "Deconstruct an IPv4 address into four 8-bit octets (32 bits total)",
      "Distinguish between the Network ID and Host ID portions",
      "Identify RFC 1918 Private IPv4 address ranges vs Public Internet routable IPs"
    ],
    connectedTool: {
      name: "IPv4 & IPv6 Address Information Tool",
      path: "/tools/ip-address-info",
      description: "Inspect address class, RFC scope (Private, CGNAT, Loopback), and binary streams."
    },
    tableOfContents: [
      { id: "intro", title: "Introduction: What Is an IP Address?", titleHi: "परिचय: IP एड्रेस क्या है?" },
      { id: "anatomy", title: "The Anatomy of a 32-Bit IPv4 Address", titleHi: "IPv4 एड्रेस की 32-बिट संरचना" },
      { id: "network-host", title: "Network ID vs Host ID", titleHi: "नेटवर्क ID बनाम होस्ट ID" },
      { id: "public-private", title: "Public vs Private IP Addresses (RFC 1918)", titleHi: "पब्लिक बनाम प्राइवेट IP एड्रेस" },
      { id: "commands", title: "How to Find Your IP Address (CLI Commands)", titleHi: "अपना IP एड्रेस कैसे पता करें? (कमांड्स)" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "What is the difference between an IP address and a MAC address?",
        qHi: "IP एड्रेस और MAC एड्रेस में क्या अंतर है?",
        a: "An IP address is a logical, hierarchical Layer 3 address assigned dynamically (via DHCP) or statically to route packets across multiple networks. A MAC address is a physical, flat Layer 2 hardware identifier burned onto the network interface card (NIC) for local segment communication.",
        aHi: "IP एड्रेस एक लॉजिकल लेयर 3 एड्रेस है जो पैकेट्स को रूट करने के लिए उपयोग किया जाता है। MAC एड्रेस नेटवर्क कार्ड (NIC) का एक स्थायी हार्डवेयर लेयर 2 एड्रेस है जो केवल स्थानीय नेटवर्क पर काम करता है।"
      },
      {
        q: "Why do home routers always use 192.168.1.1 or 192.168.0.1?",
        qHi: "घरेलू राउटर्स हमेशा 192.168.1.1 या 192.168.0.1 का उपयोग क्यों करते हैं?",
        a: "These addresses belong to the RFC 1918 private IPv4 range (192.168.0.0/16). They are free to use within private networks without coordinating with IANA and are translated to a single public IP address via NAT at the router.",
        aHi: "ये RFC 1918 प्राइवेट IP रेंज में आते हैं। इनका उपयोग किसी भी आंतरिक नेटवर्क में मुफ्त किया जा सकता है और इंटरनेट पर जाने के लिए राउटर NAT तकनीक का उपयोग करता है।"
      },
      {
        q: "Can two devices have the exact same IP address?",
        qHi: "क्या दो डिवाइसों का एक ही IP एड्रेस हो सकता है?",
        a: "Within the same local network (broadcast domain), no. If two devices are configured with the same IP, an IP Conflict error occurs. However, millions of distinct homes and offices reuse the private 192.168.1.100 address safely because they are isolated behind NAT firewalls.",
        aHi: "एक ही स्थानीय नेटवर्क में दो डिवाइसों का एक समान IP होने पर 'IP Conflict' हो जाता है। लेकिन अलग-अलग घरों में समान प्राइवेट IP का उपयोग सुरक्षित रूप से किया जा सकता है।"
      }
    ],
    contentMarkdown: `
### What Is an IP Address?
An **Internet Protocol (IP) address** is a unique numerical identifier assigned to every device connected to a computer network that uses the Internet Protocol for communication.

In simple terms: if the **MAC address** is a device's permanent digital fingerprint, the **IP address** is its current street mailing address. It tells routers where the device is located in the global network topology and how to deliver packets to it.

\`\`\`
[ Sender PC ]                                    [ Web Server ]
IP: 192.168.1.50   ===> [ Routers / Internet ] ===>   IP: 93.184.216.34
Port: 52140                                      Port: 443 (HTTPS)
\`\`\`

---

### The Anatomy of an IPv4 Address
An IPv4 address consists of **32 binary bits** divided into **four 8-bit octets**, separated by dots (dotted-decimal notation):

$$\\text{Dotted Decimal: } 192 . 168 . 1 . 1$$
$$\\text{Binary Octets: } 11000000 . 10101000 . 00000001 . 00000001$$

Because each octet contains 8 bits, the minimum decimal value is **0** (\`00000000\`) and the maximum is **255** (\`11111111\`). This creates a mathematical ceiling of:
$$2^{32} = 4,294,967,296 \\text{ total addresses}$$

---

### Network ID vs Host ID
Every IP address contains two distinct logical parts:
1. **Network ID**: Identifies the specific network or subnet where the device resides (analogous to the zip code or street name).
2. **Host ID**: Identifies the specific individual host or interface within that network (analogous to the house number).

The boundary between the network and host portions is defined by the **Subnet Mask**:
- In a \`/24\` network (\`255.255.255.0\`), the first 24 bits belong to the network, and the last 8 bits identify the individual device.

---

### Public vs Private IP Addresses (RFC 1918)
Due to IPv4 exhaustion, the Internet Engineering Task Force (IETF) reserved three blocks of addresses for private internal use:

| Class | Private CIDR Block | Subnet Range | Total IPs |
| :--- | :--- | :--- | :--- |
| **Class A** | \`10.0.0.0/8\` | \`10.0.0.0\` to \`10.255.255.255\` | 16,777,216 |
| **Class B** | \`172.16.0.0/12\` | \`172.16.0.0\` to \`172.31.255.255\` | 1,048,576 |
| **Class C** | \`192.168.0.0/16\` | \`192.168.0.0\` to \`192.168.255.255\` | 65,536 |

> **Key Rule**: Private IP addresses are **non-routable** across the public global Internet. Internet Service Providers (ISPs) drop packets with private destination IPs. Network Address Translation (NAT) maps private LAN addresses to a registered public IP.

---

### Terminal Commands to Check Your IP Address

\`\`\`bash
# On Linux or macOS
ip -br addr show
# or: ifconfig

# On Windows (Command Prompt)
ipconfig /all

# On Windows (PowerShell)
Get-NetIPAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, IPAddress
\`\`\`
`,
    contentMarkdownHi: `
### IP एड्रेस क्या है?
**इंटरनेट प्रोटोकॉल (IP) एड्रेस** एक संख्यात्मक पता (Numerical Identifier) है जो कंप्यूटर नेटवर्क पर जुड़े प्रत्येक डिवाइस को दिया जाता है ताकि वह अन्य डिवाइसों के साथ डेटा का आदान-प्रदान कर सके।

सरल शब्दों में: जैसे किसी पत्र को सही पते पर पहुँचाने के लिए मकान नंबर और पिन कोड की आवश्यकता होती है, ठीक वैसे ही इंटरनेट पर डेटा पैकेट्स को सही कंप्यूटर तक पहुँचाने के लिए IP एड्रेस की आवश्यकता होती है।

---

### IPv4 एड्रेस की संरचना (32 Bits)
IPv4 एड्रेस **32 बाइनरी बिट्स** से मिलकर बना होता है, जिसे 8-8 बिट्स के **चार भागों (Octets)** में विभाजित किया जाता है। इसे दशमलव रूप (Dotted Decimal) में लिखा जाता है:

$$\\text{दशमलव रूप: } 192 . 168 . 1 . 1$$
$$\\text{बाइनरी रूप: } 11000000 . 10101000 . 00000001 . 00000001$$

प्रत्येक ऑक्टेट 8 बिट्स का होता है, इसलिए इसका न्यूनतम मान **0** और अधिकतम मान **255** हो सकता है। इससे कुल IPv4 एड्रेस की संख्या लगभग 4.29 अरब ($2^{32}$) होती है।

---

### नेटवर्क ID बनाम होस्ट ID
प्रत्येक IP एड्रेस दो हिस्सों में बंटा होता है:
1. **Network ID**: यह उस पूरे नेटवर्क की पहचान करता है जिससे डिवाइस जुड़ा है (जैसे कॉलोनी या शहर का नाम)।
2. **Host ID**: यह उस नेटवर्क के भीतर विशिष्ट कंप्यूटर या फोन की पहचान करता है (जैसे मकान नंबर)।

यह विभाजन **सबनेट मास्क (Subnet Mask)** द्वारा निर्धारित किया जाता है।

---

### पब्लिक बनाम प्राइवेट IP एड्रेस (RFC 1918)
IPv4 एड्रेस की सीमित संख्या को बचाने के लिए IANA ने निजी नेटवर्कों के लिए कुछ एड्रेस आरक्षित किए हैं:
- **Class A**: \`10.0.0.0/8\`
- **Class B**: \`172.16.0.0/12\`
- **Class C**: \`192.168.0.0/16\`

ये एड्रेस सीधे इंटरनेट पर रूट नहीं हो सकते। राउटर **NAT (Network Address Translation)** के माध्यम से इन प्राइवेट IP को एक सिंगल पब्लिक IP में बदलकर इंटरनेट से जोड़ता है।
`
  },

  // 2. IPv4 vs IPv6
  {
    id: "ipv4-vs-ipv6-comparison",
    title: "IPv4 vs IPv6: The Comprehensive Architectural Comparison",
    titleHi: "IPv4 और IPv6 में क्या अंतर है? आर्किटेक्चर की विस्तृत तुलना",
    metaDescription: "Understand the differences between IPv4 and IPv6: address space size, 128-bit hexadecimal notation, SLAAC auto-configuration, elimination of ARP broadcasts, and security.",
    metaDescriptionHi: "IPv4 और IPv6 के बीच मुख्य अंतर: 128-बिट हेक्साडेसिमल नोटेशन, SLAAC ऑटो-कॉन्फ़िगरेशन, ARP ब्रॉडकास्ट का अंत और सुरक्षा सुधार।",
    category: "Networking Fundamentals",
    readTime: "8 min",
    difficulty: "Foundational to Intermediate",
    difficultyHi: "बुनियादी से मध्यवर्ती",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "CCNA 200-301 Core",
    topology: "Dual-Stack Host [IPv4: 192.168.1.10] + [IPv6: 2001:db8:acad:1::10/64]",
    prerequisites: "Basic familiarity with IPv4 addresses.",
    objectives: [
      "Compare the 32-bit IPv4 address space against the 128-bit IPv6 address space",
      "Learn IPv6 hexadecimal notation, zero compression (::), and leading zero omission",
      "Understand how ICMPv6 Neighbor Discovery (NDP) replaces legacy ARP broadcasts",
      "Explain Stateless Address Autoconfiguration (SLAAC) and Dual-Stack transition"
    ],
    connectedTool: {
      name: "IPv4 & IPv6 Address Inspector",
      path: "/tools/ip-address-info",
      description: "Analyze IPv6 scopes, expand compressed hextets, and inspect reverse PTR."
    },
    tableOfContents: [
      { id: "why-v6", title: "Why Was IPv6 Created?", titleHi: "IPv6 क्यों बनाया गया?" },
      { id: "comparison-table", title: "Comprehensive Feature Comparison", titleHi: "विस्तृत तुलना तालिका" },
      { id: "notation", title: "IPv6 Notation & Compression Rules", titleHi: "IPv6 लिखने और संक्षेप करने के नियम" },
      { id: "ndp-vs-arp", title: "Neighbor Discovery (NDP) vs ARP", titleHi: "NDP बनाम ARP" },
      { id: "dual-stack", title: "Transition Mechanism: Dual-Stack", titleHi: "ट्रांज़िशन तकनीक: ड्यूल-स्टैक" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "Why hasn't IPv4 completely disappeared if addresses ran out?",
        qHi: "यदि IPv4 समाप्त हो चुका है तो यह पूरी तरह बंद क्यों नहीं हुआ?",
        a: "Network Address Translation (NAT), Carrier-Grade NAT (RFC 6598), and CIDR subnetting extended the lifespan of IPv4. Additionally, upgrading hundreds of millions of enterprise firewalls, legacy industrial devices, and routers requires substantial time and capital expenditure.",
        aHi: "NAT (Network Address Translation) और CGNAT तकनीक के कारण एक ही पब्लिक IP से हजारों डिवाइस इंटरनेट चला लेते हैं। इसके अलावा पुराने उपकरणों और फायरवॉल्स को अपग्रेड करने में भारी लागत आती है।"
      },
      {
        q: "Does IPv6 make Internet speed faster?",
        qHi: "क्या IPv6 इंटरनेट की स्पीड को तेज़ बनाता है?",
        a: "IPv6 simplifies router packet header processing (fixed 40-byte header with no checksum recalculation at each hop) and eliminates NAT traversal overhead. In real-world measurements, IPv6 typically provides lower latency and slight throughput improvements.",
        aHi: "हाँ, IPv6 में राउटर को NAT प्रोसेसिंग नहीं करनी पड़ती और इसका हेडर फिक्स 40 बाइट्स का होता है, जिससे पैकेट प्रोसेसिंग तेज़ होती है और विलंबता (Latency) कम होती है।"
      }
    ],
    contentMarkdown: `
### Why Was IPv6 Created?
In the early 1990s, the explosive growth of the Internet made it evident that the **4.29 billion** addresses available in IPv4 would soon be exhausted. On **February 3, 2011**, IANA officially allocated the final unreserved IPv4 \`/8\` address blocks.

IPv6 (standardized in **RFC 8200**) solves this problem permanently by expanding the address space from 32 bits to **128 bits**:

$$\\text{IPv4 Total Space: } 2^{32} \\approx 4.29 \\times 10^9 \\text{ addresses}$$
$$\\text{IPv6 Total Space: } 2^{128} \\approx 3.4 \\times 10^{38} \\text{ addresses (340 Undecillion)}$$

---

### Comprehensive Architecture Comparison Table

| Architecture Dimension | IPv4 Standard (RFC 791) | IPv6 Standard (RFC 8200) |
| :--- | :--- | :--- |
| **Address Length** | 32 bits (4 bytes) | 128 bits (16 bytes) |
| **Address Notation** | Dotted Decimal (\`192.168.1.1\`) | Colon-Hexadecimal (\`2001:db8::1\`) |
| **Number of Blocks** | 4 octets (8 bits each) | 8 hextets (16 bits each) |
| **Packet Header Size** | Variable (20 to 60 bytes) | Fixed (40 bytes) |
| **Local Discovery** | Broadcast ARP (Layer 2) | Multicast ICMPv6 Neighbor Discovery (NDP) |
| **Broadcast Support** | Native (\`255.255.255.255\`) | **Eliminated** (Replaced by targeted Multicast) |
| **Autoconfiguration** | DHCPv4 or Manual | SLAAC (Stateless) and DHCPv6 |
| **NAT Requirement** | Mandatory for private LANs | **Unnecessary** (End-to-end global public routing) |
| **Loopback Address** | \`127.0.0.1\` (entire \`127/8\` block) | \`::1\` |

---

### IPv6 Compression Rules (RFC 5952)
A raw 128-bit IPv6 address looks long and unwieldy:
\`\`\`
2001:0db8:0000:0000:0000:0000:1428:57ab
\`\`\`

Two standard rules compress this representation:
1. **Omit Leading Zeros**: Any leading \`0\`s within a 16-bit hextet can be dropped:
   \`0db8\` $\\to$ \`db8\`, \`0000\` $\\to$ \`0\`.
2. **Double Colon (\`::\`) for Contiguous Zeros**: A consecutive sequence of all-zero hextets can be replaced with a single \`::\`.
   *Critical rule*: \`::\` can only be used **once** per address to prevent mathematical ambiguity.

Compressed Result:
\`\`\`
2001:db8::1428:57ab
\`\`\`
`,
    contentMarkdownHi: `
### IPv6 क्यों बनाया गया?
1990 के दशक में इंटरनेट के तेजी से विस्तार के बाद यह स्पष्ट हो गया था कि IPv4 के 4.29 अरब एड्रेस जल्द ही समाप्त हो जाएंगे। 

IPv6 (RFC 8200) ने एड्रेस के आकार को 32 बिट्स से बढ़ाकर **128 बिट्स** कर दिया। इससे इतने अधिक IP एड्रेस ($3.4 \\times 10^{38}$) उपलब्ध हो गए हैं कि पृथ्वी के प्रत्येक रेत के कण को भी लाखों अद्वितीय IP दिए जा सकते हैं।

---

### मुख्य तकनीकी अंतर
1. **एड्रेस का आकार**: IPv4 में 32 बिट्स होते हैं, जबकि IPv6 में 128 बिट्स होते हैं।
2. **लिखने का तरीका**: IPv4 को दशमलव में लिखा जाता है (\`192.168.1.1\`), जबकि IPv6 को हेक्साडेसिमल में लिखा जाता है (\`2001:db8::1\`)।
3. **ब्रॉडकास्ट का अंत**: IPv4 में पूरे नेटवर्क पर शोर मचाने वाला 'ब्रॉडकास्ट' होता था। IPv6 में ब्रॉडकास्ट को पूरी तरह समाप्त कर **मल्टीकास्ट (Multicast)** द्वारा बदल दिया गया है।
4. **NAT की आवश्यकता नहीं**: IPv6 में हर डिवाइस को एक वैश्विक यूनिक पब्लिक IP मिलता है, जिससे गेमिंग, P2P और वॉयस कॉलिंग में विलंबता कम होती है।
`
  },

  // 3. Subnetting for Beginners
  {
    id: "subnetting-for-beginners",
    title: "Subnetting for Beginners: How to Subnet IPv4 in Under 60 Seconds",
    titleHi: "शुरुआती लोगों के लिए सबनेटिंग: 60 सेकंड में IPv4 सबनेटिंग सीखें",
    metaDescription: "Master IPv4 subnetting using the fast Magic Number method. Calculate network addresses, broadcast addresses, usable host ranges, and CIDR masks without binary math.",
    metaDescriptionHi: "मैजिक नंबर फॉर्मूला के साथ IPv4 सबनेटिंग आसानी से सीखें। बिना जटिल बाइनरी गणना के नेटवर्क एड्रेस, ब्रॉडकास्ट और मान्य होस्ट रेंज निकालें।",
    category: "CCNA & Networking",
    readTime: "9 min",
    difficulty: "Foundational to Intermediate",
    difficultyHi: "बुनियादी से मध्यवर्ती",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "High Yield Exam Topic",
    topology: "Company LAN 192.168.10.0/24 Subdivided into Four /26 Subnets (62 hosts each)",
    prerequisites: "Basic understanding of IPv4 addresses and powers of 2 (2, 4, 8, 16, 32, 64, 128, 256).",
    objectives: [
      "Understand why subnets are created (broadcast containment & security)",
      "Convert CIDR prefixes (/24 to /30) to decimal subnet masks instantly",
      "Apply the Magic Number formula (256 - Mask) to find subnet increments",
      "Identify the Network ID, First Host, Last Host, and Broadcast ID"
    ],
    connectedTool: {
      name: "Advanced IPv4 Subnet Calculator",
      path: "/tools/subnet-calculator",
      description: "Verify your subnet boundaries, broadcast addresses, and VLSM plans."
    },
    tableOfContents: [
      { id: "why-subnet", title: "Why Do Networks Need Subnetting?", titleHi: "सबनेटिंग की आवश्यकता क्यों है?" },
      { id: "magic-number", title: "The Magic Number Method", titleHi: "मैजिक नंबर विधि" },
      { id: "step-by-step", title: "Step-by-Step Subnetting Example (/26)", titleHi: "चरण-दर-चरण उदाहरण (/26)" },
      { id: "cheat-sheet", title: "CIDR /24 to /30 Cheat Table", titleHi: "CIDR चीट तालिका" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "Why can't the first and last IP addresses in a subnet be assigned to hosts?",
        qHi: "सबनेट का पहला और अंतिम IP एड्रेस किसी कंप्यूटर को क्यों नहीं दिया जा सकता?",
        a: "The very first IP address in any subnet represents the Network Address (used by routers in routing tables). The very last IP address is the Directed Broadcast Address (used to send packets to all hosts in that specific subnet simultaneously).",
        aHi: "पहला IP 'नेटवर्क एड्रेस' होता है जिसका उपयोग राउटर राउटिंग टेबल में करते हैं। अंतिम IP 'ब्रॉडकास्ट एड्रेस' होता है जो उस सबनेट के सभी कंप्यूटरों को एक साथ संदेश भेजने के लिए आरक्षित होता है।"
      },
      {
        q: "What is an RFC 3021 /31 subnet?",
        qHi: "RFC 3021 /31 सबनेट क्या होता है?",
        a: "In standard subnets, you lose 2 addresses for network and broadcast. On point-to-point router links where only two endpoints exist, RFC 3021 allows a /31 prefix (2 total addresses) where both IPs are usable hosts, saving millions of public IPv4 addresses.",
        aHi: "राउटर से राउटर के सीधे कनेक्शन (Point-to-Point) पर दो से अधिक डिवाइस नहीं हो सकते। RFC 3021 के तहत /31 मास्क में ब्रॉडकास्ट की आवश्यकता नहीं होती और दोनों IP उपयोग किए जा सकते हैं।"
      }
    ],
    contentMarkdown: `
### Why Do Networks Need Subnetting?
Imagine an organization with 500 computers on a single flat network. Every time one computer sends a broadcast packet (like an ARP request), all 500 computers must process it. This leads to **broadcast storms**, high CPU utilization, and security vulnerabilities.

**Subnetting** divides a large network into smaller, manageable, and isolated broadcast domains.

---

### The Magic Number Method
Forget converting long strings of binary ones and zeros. Professional network engineers calculate subnets in their head using the **Magic Number**:

$$\\text{Magic Number (Block Size)} = 256 - \\text{Interesting Octet}$$

1. **Find the Interesting Octet**:
   - For prefixes \`/25\` through \`/30\`, the change happens in the **4th octet**.
2. **Find the Subnet Mask value**:
   - \`/25\` = 128
   - \`/26\` = 192
   - \`/27\` = 224
   - \`/28\` = 240
   - \`/29\` = 248
   - \`/30\` = 252
3. **Subtract from 256**: That number is your block increment!

---

### Step-by-Step Example: Subnetting \`192.168.1.0/26\`
- **Subnet Mask**: \`255.255.255.192\`
- **Interesting Octet**: 4th octet is \`192\`
- **Magic Number**: $256 - 192 = \\mathbf{64}$

The subnets start at 0 and count up by **64**:

| Subnet # | Network Address | Usable Host Range | Broadcast Address | Usable Hosts ($2^H - 2$) |
| :--- | :--- | :--- | :--- | :--- |
| **Subnet 1** | \`192.168.1.0\` | \`192.168.1.1\` – \`192.168.1.62\` | \`192.168.1.63\` | 62 |
| **Subnet 2** | \`192.168.1.64\` | \`192.168.1.65\` – \`192.168.1.126\` | \`192.168.1.127\` | 62 |
| **Subnet 3** | \`192.168.1.128\` | \`192.168.1.129\` – \`192.168.1.190\` | \`192.168.1.191\` | 62 |
| **Subnet 4** | \`192.168.1.192\` | \`192.168.1.193\` – \`192.168.1.254\` | \`192.168.1.255\` | 62 |
`,
    contentMarkdownHi: `
### सबनेटिंग क्या है और इसकी आवश्यकता क्यों है?
एक बड़े नेटवर्क को छोटे-छोटे तार्किक नेटवर्कों में विभाजित करने की प्रक्रिया को **सबनेटिंग (Subnetting)** कहा जाता है। इससे ब्रॉडकास्ट ट्रैफिक कम होता है, नेटवर्क सुरक्षा बढ़ती है और IP एड्रेस की बर्बादी रुकती है।

---

### मैजिक नंबर फॉर्मूला
बिना जटिल बाइनरी गुणा-भाग के सबनेट निकालने का सबसे आसान नियम:

$$\\text{ब्लॉक साइज (Magic Number)} = 256 - \\text{सबनेट मास्क का मान}$$

उदाहरण के लिए, **/26** प्रीफिक्स के लिए:
- चौथा ऑक्टेट मास्क = \`192\`
- ब्लॉक साइज = $256 - 192 = 64$
- प्रत्येक सबनेट 64 के अंतराल पर बढ़ेगा: 0, 64, 128, 192.
`
  },

  // 4. How DNS Works
  {
    id: "how-dns-works",
    title: "How DNS Works Step-by-Step: From Domain Name to IP Resolution",
    titleHi: "DNS कैसे काम करता है? डोमेन नाम से IP एड्रेस तक की पूरी प्रक्रिया",
    metaDescription: "Understand the Domain Name System (DNS) recursive resolution process: Root Nameservers, TLD servers, Authoritative servers, DNS caching, and TTL.",
    metaDescriptionHi: "DNS रिज़ॉल्यूशन की 8-चरणीय प्रक्रिया: रूट सर्वर, TLD सर्वर, ऑथॉरिटेटिव सर्वर, DNS कैशिंग और TTL की पूरी जानकारी।",
    category: "Networking Fundamentals",
    readTime: "8 min",
    difficulty: "Foundational to Intermediate",
    difficultyHi: "बुनियादी से मध्यवर्ती",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "Internet Engineering & CCNA",
    topology: "Client Browser ---> Recursive Resolver (1.1.1.1) ---> Root (.) ---> TLD (.com) ---> Authoritative NS",
    prerequisites: "Basic concept of web browsers and IP addresses.",
    objectives: [
      "Explain why the Internet requires DNS (Human names vs Binary routing)",
      "Trace the 4 core DNS servers: Recursive Resolver, Root, TLD, and Authoritative",
      "Understand Time-To-Live (TTL) and DNS caching at the browser and OS level",
      "Distinguish between standard recursive queries and iterative queries"
    ],
    connectedTool: {
      name: "DNS Record Lookup Tool (DoH)",
      path: "/tools/dns-lookup",
      description: "Query live DNS records across Cloudflare and Google resolvers with latency telemetry."
    },
    tableOfContents: [
      { id: "what-is-dns", title: "What Is DNS?", titleHi: "DNS क्या है?" },
      { id: "four-servers", title: "The 4 Servers in the DNS Chain", titleHi: "DNS श्रृंखला के 4 मुख्य सर्वर" },
      { id: "eight-steps", title: "The 8 Steps of a DNS Lookup", titleHi: "DNS लुकअप के 8 चरण" },
      { id: "caching-ttl", title: "DNS Caching & TTL Explained", titleHi: "DNS कैशिंग और TTL" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "What happens if a domain's authoritative DNS server goes down?",
        qHi: "यदि किसी डोमेन का ऑथॉरिटेटिव DNS सर्वर डाउन हो जाए तो क्या होगा?",
        a: "As long as recursive resolvers have the records cached within their TTL window, users can still access the site. Once the TTL expires, lookups return SERVFAIL and users cannot resolve the domain.",
        aHi: "जब तक विभिन्न ISP और रिज़ॉल्वर्स के पास TTL समाप्त नहीं होता, यूज़र्स साइट खोल पाएंगे। TTL समाप्त होने पर डोमेन नहीं खुलेगा और 'SERVFAIL' त्रुटि आएगी।"
      }
    ],
    contentMarkdown: `
### What Is DNS?
The **Domain Name System (DNS)** is the phonebook of the Internet. Humans access information online through easy-to-remember domain names like \`rtechlab.com\`. Web browsers, routers, and transport protocols interact through numerical IP addresses like \`104.21.45.10\`.

DNS translates hostnames into IP addresses so browsers can load Internet resources.

---

### The 4 Servers in the DNS Hierarchy

\`\`\`
[ User PC ] ──(1) Query──> [ Recursive Resolver ] (e.g. 1.1.1.1)
                                 │
                   ┌─────────────┼─────────────┐
                   ▼             ▼             ▼
             [ Root (.) ]   [ TLD (.com) ]  [ Authoritative NS ]
\`\`\`

1. **DNS Recursor (Recursive Resolver)**: The librarian that receives queries from client computers (e.g. Cloudflare \`1.1.1.1\` or Google \`8.8.8.8\`) and searches the hierarchy on the client's behalf.
2. **Root Nameserver (\`.\`)**: The index pointing to specific top-level domains. There are 13 named root authority systems replicated worldwide via Anycast.
3. **TLD Nameserver**: Houses information for all domains sharing a common extension (\`.com\`, \`.org\`, \`.in\`, \`.edu\`).
4. **Authoritative Nameserver**: The definitive source containing the actual DNS resource records (A, AAAA, MX, TXT) configured by the domain owner.
`,
    contentMarkdownHi: `
### DNS क्या है?
**डोमेन नेम सिस्टम (DNS)** इंटरनेट की फोनबुक है। मनुष्य \`google.com\` या \`rtechlab.com\` जैसे नाम याद रखते हैं, लेकिन कंप्यूटर केवल IP एड्रेस (\`142.250.190.46\`) समझते हैं। DNS डोमेन नामों को IP एड्रेस में अनुवादित करने का कार्य करता है।
`
  },

  // 5. TCP vs UDP
  {
    id: "tcp-vs-udp-explained",
    title: "TCP vs UDP: Handshake Mechanics, Latency & Transport Architecture",
    titleHi: "TCP और UDP में क्या अंतर है? 3-वे हैंडशेक और प्रोटोकॉल की कार्यप्रणाली",
    metaDescription: "Compare TCP (Transmission Control Protocol) and UDP (User Datagram Protocol): connection-oriented 3-way handshake, packet sequencing, flow control, and speed.",
    metaDescriptionHi: "TCP और UDP के बीच का अंतर: 3-वे हैंडशेक (SYN, SYN-ACK, ACK), डेटा विश्वसनीयता, पैकेट री-ट्रांसमिशन और कम विलंबता अनुप्रयोग।",
    category: "Networking Fundamentals",
    readTime: "8 min",
    difficulty: "Foundational to Intermediate",
    difficultyHi: "बुनियादी से मध्यवर्ती",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "Transport Layer OSI Layer 4",
    topology: "TCP 3-Way Handshake: Client [SYN] ---> Server [SYN-ACK] ---> Client [ACK]",
    prerequisites: "Understanding of OSI Layer 3 (IP) and client-server concepts.",
    objectives: [
      "Contrast connection-oriented TCP vs connectionless UDP",
      "Trace the TCP 3-way handshake and connection teardown (FIN/ACK)",
      "Understand flow control (Sliding Window) and congestion avoidance",
      "Identify which applications require TCP vs UDP"
    ],
    connectedTool: {
      name: "Port & Protocol Reference Database",
      path: "/tools/port-reference",
      description: "Filter and inspect 60+ enterprise services by transport protocol (TCP, UDP, Both)."
    },
    tableOfContents: [
      { id: "overview", title: "Transport Layer Overview", titleHi: "ट्रांसपोर्ट लेयर का परिचय" },
      { id: "tcp-handshake", title: "The TCP 3-Way Handshake", titleHi: "TCP 3-वे हैंडशेक" },
      { id: "udp-mechanics", title: "UDP: Stateless Speed", titleHi: "UDP: तीव्र और हल्का" },
      { id: "comparison", title: "TCP vs UDP Comparison Table", titleHi: "तुलना तालिका" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "Why does live streaming or online gaming use UDP instead of TCP?",
        qHi: "लाइव स्ट्रीमिंग और ऑनलाइन गेमिंग में TCP के बजाय UDP का उपयोग क्यों होता है?",
        a: "If a voice or video frame drops during a live call, retransmitting it 500ms later is useless because the conversation has moved on. TCP would stall the stream (Head-of-Line Blocking) waiting for acknowledgment, causing stutter and lag. UDP drops the lost packet and immediately renders the next frame.",
        aHi: "लाइव कॉल या गेमिंग में यदि कोई फ्रेम छूट जाता है, तो आधा सेकंड बाद उसे दोबारा मंगाना बेकार है। TCP छूटे हुए पैकेट के इंतज़ार में पूरा वीडियो अटका देगा, जबकि UDP उसे छोड़ कर आगे बढ़ जाता है।"
      }
    ],
    contentMarkdown: `
### Transport Layer Overview
At **Layer 4 of the OSI Model**, two primary transport protocols govern how data moves between applications:
1. **TCP (Transmission Control Protocol - RFC 793 / 9293)**: Prioritizes **reliability** and data integrity.
2. **UDP (User Datagram Protocol - RFC 768)**: Prioritizes **speed** and minimal latency.

---

### The TCP Three-Way Handshake
Before transmitting a single byte of payload, TCP establishes a verified bidirectional session:

\`\`\`
[ Client ]                                            [ Server ]
    │                                                     │
    │ ─── 1. SYN (Sequence = 100) ──────────────────────> │  (Client requests session)
    │                                                     │
    │ <── 2. SYN-ACK (Seq = 500, Ack = 101) ───────────── │  (Server acknowledges & sends its Seq)
    │                                                     │
    │ ─── 3. ACK (Seq = 101, Ack = 501) ────────────────> │  (Connection ESTABLISHED!)
    │                                                     │
\`\`\`

---

### TCP vs UDP Architecture Comparison Table

| Dimension | TCP (Transmission Control Protocol) | UDP (User Datagram Protocol) |
| :--- | :--- | :--- |
| **Connection State** | Connection-Oriented (Requires Handshake) | Connectionless (Fire and Forget) |
| **Reliability** | Guaranteed (Retransmits lost packets) | Best-Effort (No retransmissions) |
| **Ordering** | Sequenced (Packets reassembled in order) | Unordered (Arrives as network delivers) |
| **Header Overhead**| Minimum 20 bytes (up to 60 bytes) | Fixed **8 bytes** |
| **Flow Control** | Supported (Sliding Window & Congestion Avoidance) | None |
| **Typical Protocols**| HTTP (80), HTTPS (443), SSH (22), BGP (179) | DNS queries (53), DHCP (67/68), NTP (123), VoIP (5060) |
`,
    contentMarkdownHi: `
### TCP बनाम UDP तुलना
- **TCP**: कनेक्शन-उन्मुख (Connection-Oriented) है। यह 3-वे हैंडशेक के माध्यम से डेटा डिलीवरी की पूरी गारंटी देता है। यदि कोई पैकेट खो जाता है, तो उसे दोबारा भेजा जाता है।
- **UDP**: कनेक्शन-रहित (Connectionless) है। यह बिना किसी औपचारिकता के सीधे पैकेट भेजता है। यह तेज़ होता है और DNS, वीडियो कॉल और गेमिंग के लिए सर्वोत्तम है।
`
  },

  // 6. Common Network Ports
  {
    id: "common-network-ports",
    title: "Top 50 Common Network Ports and Protocols Every IT Admin Must Know",
    titleHi: "प्रमुख 50+ नेटवर्क पोर्ट्स और प्रोटोकॉल्स की संपूर्ण संदर्भ मार्गदर्शिका",
    metaDescription: "Comprehensive reference of the most important enterprise networking ports across TCP and UDP: HTTP, HTTPS, SSH, DNS, DHCP, RDP, MySQL, and IANA ranges.",
    metaDescriptionHi: "आईटी प्रोफेशन्स और CCNA छात्रों के लिए 50+ महत्वपूर्ण नेटवर्क पोर्ट्स: SSH, DNS, HTTP, HTTPS, SMB, RDP और डेटाबेस पोर्ट्स की पूरी सूची।",
    category: "Networking & Security",
    readTime: "10 min",
    difficulty: "Foundational to Intermediate",
    difficultyHi: "बुनियादी से मध्यवर्ती",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "CompTIA Security+ & CCNA",
    topology: "IANA Port Ranges: Well-Known (0-1023), Registered (1024-49151), Dynamic (49152-65535)",
    prerequisites: "Concept of TCP and UDP transport protocols.",
    objectives: [
      "Understand why ports exist (Layer 4 multiplexing)",
      "Memorize high-yield enterprise ports for CCNA and CompTIA exams",
      "Distinguish between Well-Known, Registered, and Dynamic IANA ranges",
      "Learn basic firewall port filtering syntax"
    ],
    connectedTool: {
      name: "Port & Protocol Reference Database",
      path: "/tools/port-reference",
      description: "Search all 60+ verified ports with Cisco ACL rules and security recommendations."
    },
    tableOfContents: [
      { id: "what-is-port", title: "What Is a Port Number?", titleHi: "पोर्ट नंबर क्या होता है?" },
      { id: "iana-ranges", title: "IANA Port Number Ranges", titleHi: "IANA पोर्ट श्रेणियां" },
      { id: "essential-ports", title: "The 25 Essential Exam Ports", titleHi: "25 सबसे महत्वपूर्ण पोर्ट्स" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "What is an ephemeral port?",
        qHi: "इफेमेरल (Ephemeral) पोर्ट क्या होता है?",
        a: "An ephemeral port is a short-lived transport port allocated dynamically by the client operating system (typically from ports 49152 to 65535) as the source port for an outbound request. When the connection closes, the port is returned to the pool.",
        aHi: "जब आपका कंप्यूटर किसी वेबसाइट से जुड़ता है, तो ऑपरेटिंग सिस्टम 49152 से 65535 के बीच का कोई अस्थायी पोर्ट अपने लिए चुनता है। काम पूरा होने पर यह पोर्ट बंद हो जाता है।"
      }
    ],
    contentMarkdown: `
### What Is a Port Number?
While an **IP address** identifies the physical or virtual host on a network, a **Port number** identifies the specific application or process running on that host.

This mechanism is known as **Port Multiplexing**: allowing a single computer with a single IP address to simultaneously run a web server (Port 443), an SSH server (Port 22), and a database (Port 3306) without data streams colliding.

---

### IANA Port Ranges (RFC 6335)
- **Well-Known Ports (0 – 1023)**: Reserved for privileged core services (HTTP, SSH, DNS).
- **Registered Ports (1024 – 49151)**: Assigned by IANA for specific vendor applications (MSSQL 1433, MySQL 3306, RDP 3389).
- **Dynamic / Private Ports (49152 – 65535)**: Ephemeral ports allocated dynamically by operating systems for client outgoing connections.
`,
    contentMarkdownHi: `
### पोर्ट नंबर क्या होता है?
IP एड्रेस नेटवर्क पर मशीन की पहचान करता है, जबकि **पोर्ट नंबर** उस मशीन के भीतर चल रहे विशिष्ट सॉफ्टवेयर (जैसे वेब सर्वर, डेटाबेस) की पहचान करता है।
`
  },

  // 7. What is a MAC Address?
  {
    id: "what-is-a-mac-address",
    title: "What Is a MAC Address? Layer 2 Physical Addressing vs Layer 3 Logical Addressing",
    titleHi: "MAC एड्रेस क्या है? लेयर 2 फिजिकल एड्रेस और लेयर 3 IP एड्रेस में अंतर",
    metaDescription: "Learn what a MAC address is: 48-bit hexadecimal formatting, OUI vendor prefix, NIC serial number, ARP resolution, and why MAC addresses cannot route across the Internet.",
    metaDescriptionHi: "MAC एड्रेस की पूरी जानकारी: 48-बिट हेक्साडेसिमल संरचना, OUI वेंडर कोड, ARP रिज़ॉल्यूशन और IP एड्रेस से इसका मुख्य अंतर।",
    category: "Networking Fundamentals",
    readTime: "7 min",
    difficulty: "Foundational",
    difficultyHi: "बुनियादी",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "OSI Layer 2 Data Link",
    topology: "Ethernet Frame: [Preamble] [Dest MAC] [Source MAC] [EtherType: 0x0800 IPv4] [Data] [FCS]",
    prerequisites: "Basic familiarity with Ethernet network cables and switches.",
    objectives: [
      "Understand the 48-bit structure of an Ethernet MAC address",
      "Deconstruct Organizationally Unique Identifier (OUI) vs NIC-specific serial bits",
      "Learn how Address Resolution Protocol (ARP) bridges Layer 2 and Layer 3",
      "Explain MAC address spoofing and switch port security"
    ],
    connectedTool: {
      name: "Binary, Decimal and Hexadecimal Converter",
      path: "/tools/binary-converter",
      description: "Convert hex characters to binary nibbles and explore bitwise architectures."
    },
    tableOfContents: [
      { id: "intro", title: "What Is a MAC Address?", titleHi: "MAC एड्रेस क्या है?" },
      { id: "structure", title: "48-Bit Structure & OUI", titleHi: "48-बिट संरचना और OUI" },
      { id: "mac-vs-ip", title: "MAC Address vs IP Address", titleHi: "MAC एड्रेस बनाम IP एड्रेस" },
      { id: "arp", title: "How ARP Connects IP to MAC", titleHi: "ARP कैसे काम करता है?" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "Can two devices have the same MAC address?",
        qHi: "क्या दो डिवाइसों का एक ही MAC एड्रेस हो सकता है?",
        a: "Globally, every Network Interface Card (NIC) is manufactured with a unique MAC address assigned by IEEE. However, operating systems allow MAC Spoofing (overriding the hardware MAC address in software), which can lead to Layer 2 duplicate address conflicts if done on the same switch.",
        aHi: "निर्माता कंपनी द्वारा प्रत्येक नेटवर्क कार्ड को दुनिया में एक अद्वितीय MAC एड्रेस दिया जाता है। हालांकि, सॉफ्टवेयर द्वारा इसे 'स्पूफ' (बदला) जा सकता है।"
      }
    ],
    contentMarkdown: `
### What Is a MAC Address?
A **Media Access Control (MAC) address** is a physical hardware identifier permanently burned into a Network Interface Card (NIC) during manufacturing.

While an **IP address** is logical and changes depending on where you plug into a network, your **MAC address** travels with your hardware device wherever you go.

---

### 48-Bit Structure & OUI
An Ethernet MAC address consists of **48 bits** (6 bytes), represented as 12 hexadecimal digits separated by colons or hyphens:

\`\`\`
   00 : 1A : 2B  :  3C : 4D : 5E
  └─────┬──────┘   └─────┬──────┘
        │                │
  OUI (Vendor Code)   NIC Specific Serial
 (Assigned by IEEE)   (Assigned by Manufacturer)
\`\`\`

1. **OUI (Organizationally Unique Identifier)**: The first 24 bits (3 bytes) identify the hardware vendor (e.g., Cisco, Apple, Intel, Dell).
2. **Device Identifier**: The last 24 bits (3 bytes) are unique serial numbers assigned by the manufacturer.
`,
    contentMarkdownHi: `
### MAC एड्रेस क्या है?
**MAC (Media Access Control) एड्रेस** एक स्थायी भौतिक पता (Hardware Address) है जो नेटवर्क कार्ड बनाते समय उसमें दर्ज कर दिया जाता है। यह 48 बिट्स (6 बाइट्स) का होता है और इसे हेक्साडेसिमल में लिखा जाता है।
`
  },

  // 8. Binary to Decimal & Hex Conversion
  {
    id: "binary-decimal-hex-conversion",
    title: "Binary to Decimal and Hexadecimal: The Complete Math Guide",
    titleHi: "बाइनरी, दशमलव और हेक्साडेसिमल कन्वर्जन: गणितीय नियमों की संपूर्ण गाइड",
    metaDescription: "Step-by-step mathematical guide to convert between Binary (Base 2), Decimal (Base 10), and Hexadecimal (Base 16) with two's complement and nibble grouping.",
    metaDescriptionHi: "बाइनरी से दशमलव और हेक्साडेसिमल में बदलने की आसान गणितीय विधियां, टूज़ कॉम्प्लिमेंट (Two's Complement) और 4-बिट निबल ग्रुपिंग।",
    category: "Computer Architecture",
    readTime: "8 min",
    difficulty: "Foundational",
    difficultyHi: "बुनियादी",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "Computer Science & Networking",
    topology: "Base 10: 255 <===> Base 2: 11111111 <===> Base 16: 0xFF",
    prerequisites: "Basic arithmetic multiplication and addition.",
    objectives: [
      "Understand positional notation across Base 2, Base 10, and Base 16",
      "Convert binary to decimal using positional power addition",
      "Convert decimal to binary via successive division by 2",
      "Map 4-bit binary nibbles directly to single hexadecimal characters"
    ],
    connectedTool: {
      name: "Binary, Decimal and Hexadecimal Converter",
      path: "/tools/binary-converter",
      description: "Interactive real-time conversion board with 8-bit hardware register toggles."
    },
    tableOfContents: [
      { id: "number-systems", title: "The 3 Number Systems", titleHi: "तीन मुख्य नंबर सिस्टम" },
      { id: "bin-to-dec", title: "Binary to Decimal Conversion", titleHi: "बाइनरी से दशमलव कन्वर्जन" },
      { id: "dec-to-bin", title: "Decimal to Binary Conversion", titleHi: "दशमलव से बाइनरी कन्वर्जन" },
      { id: "hex-shortcut", title: "The Hexadecimal 4-Bit Shortcut", titleHi: "हेक्साडेसिमल 4-बिट शॉर्टकट" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "Why do computers use binary instead of decimal?",
        qHi: "कंप्यूटर दशमलव के बजाय बाइनरी का उपयोग क्यों करते हैं?",
        a: "Computer microprocessors are constructed from billions of microscopic transistors that act as electronic switches. An electronic switch has only two stable physical states: ON (conducting current / high voltage = 1) and OFF (non-conducting / low voltage = 0). Designing circuits for binary states maximizes reliability and minimizes noise.",
        aHi: "कंप्यूटर ट्रांजिस्टर से बने होते हैं जो बिजली के स्विच की तरह काम करते हैं। स्विच के केवल दो ही रूप हो सकते हैं: ऑन (1) या ऑफ (0)। इसलिए बाइनरी सिस्टम कंप्यूटर के लिए सबसे सरल और विश्वसनीय है।"
      }
    ],
    contentMarkdown: `
### The 3 Number Systems in Computing
1. **Decimal (Base 10)**: Uses digits \`0\` through \`9\`. Standard human counting system.
2. **Binary (Base 2)**: Uses digits \`0\` and \`1\`. Native machine language of electronic circuits.
3. **Hexadecimal (Base 16)**: Uses digits \`0-9\` and letters \`A-F\` ($A=10, B=11, C=12, D=13, E=14, F=15$). Used by humans as a compact shorthand for binary.

---

### Binary to Decimal: Positional Sum Formula
In binary, each position from right to left represents an increasing power of 2 ($2^0, 2^1, 2^2, 2^3, 2^4, 2^5, 2^6, 2^7$):

$$\\text{Weights: } [128, 64, 32, 16, 8, 4, 2, 1]$$

To convert \`10101100_2\` to decimal:
$$(1 \\times 128) + (0 \\times 64) + (1 \\times 32) + (0 \\times 16) + (1 \\times 8) + (1 \\times 4) + (0 \\times 2) + (0 \\times 1)$$
$$= 128 + 32 + 8 + 4 = \\mathbf{172_{10}}$$
`,
    contentMarkdownHi: `
### बाइनरी से दशमलव कैसे निकालें?
बाइनरी में दाईं से बाईं ओर प्रत्येक अंक का मान 2 की घात ($2^0, 2^1, 2^2, ...$) के रूप में बढ़ता है:
128, 64, 32, 16, 8, 4, 2, 1.

जहाँ-जहाँ '1' है, उन संख्याओं को जोड़ दें।
`
  },

  // 9. How DHCP Works (DORA)
  {
    id: "how-dhcp-works-dora",
    title: "How DHCP Works: The 4-Step DORA Process & Snooping Security",
    titleHi: "DHCP कैसे काम करता है? DORA प्रक्रिया और DHCP स्नूपिंग सुरक्षा",
    metaDescription: "Understand the Dynamic Host Configuration Protocol (DHCP) DORA process: Discover, Offer, Request, and Acknowledge, plus Layer 2 DHCP Snooping mitigation.",
    metaDescriptionHi: "DHCP की DORA प्रक्रिया (डिस्कवर, ऑफर, रिक्वेस्ट, एकनॉलेज) और रॉग DHCP सर्वर से बचाव के लिए सिस्को DHCP स्नूपिंग की पूरी जानकारी।",
    category: "Networking Fundamentals",
    readTime: "8 min",
    difficulty: "Foundational to Intermediate",
    difficultyHi: "बुनियादी से मध्यवर्ती",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "CCNA 200-301 Core",
    topology: "Unconfigured Host [UDP 68] <===(Broadcast)===> DHCP Server [UDP 67]",
    prerequisites: "Basic IP addressing concepts.",
    objectives: [
      "Understand the purpose of DHCP in eliminating manual IP configuration",
      "Trace the 4-step DORA handshake in packet detail",
      "Learn what network parameters DHCP delivers (IP, Mask, Gateway, DNS, Lease)",
      "Explain the threat of Rogue DHCP Servers and how DHCP Snooping secures the LAN"
    ],
    connectedTool: {
      name: "Port & Protocol Reference Database",
      path: "/tools/port-reference",
      description: "Review Port 67 (DHCP Server) and Port 68 (DHCP Client) operational details."
    },
    tableOfContents: [
      { id: "what-is-dhcp", title: "What Is DHCP?", titleHi: "DHCP क्या है?" },
      { id: "dora-steps", title: "The 4-Step DORA Handshake", titleHi: "4-चरणीय DORA प्रक्रिया" },
      { id: "lease-renewal", title: "DHCP Lease Times & Renewal", titleHi: "लीज टाइम और रिन्यूअल" },
      { id: "dhcp-snooping", title: "Security: Rogue DHCP & Snooping", titleHi: "सुरक्षा: रॉग DHCP और स्नूपिंग" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "What is an APIPA address (169.254.x.x)?",
        qHi: "APIPA एड्रेस (169.254.x.x) क्या होता है?",
        a: "Automatic Private IP Addressing (APIPA - RFC 3927) is a fallback mechanism. When a computer sends out a DHCP Discover broadcast but receives no response from any DHCP server, the operating system assigns itself an address in the 169.254.0.0/16 range so local link communication is still possible.",
        aHi: "जब आपका कंप्यूटर नेटवर्क से जुड़ता है लेकिन कोई DHCP सर्वर उसे IP नहीं देता, तो वह खुद को 169.254.x.x रेंज का IP दे देता है। इसका मतलब है कि DHCP सर्वर से संपर्क नहीं हो पाया।"
      }
    ],
    contentMarkdown: `
### What Is DHCP?
**Dynamic Host Configuration Protocol (DHCP)** is a network management protocol operating at the Application Layer (over UDP ports 67 and 68).

Instead of manually typing an IP address, subnet mask, default gateway, and DNS servers onto hundreds of laptops and phones, DHCP assigns these configurations automatically when a device connects to a network.

---

### The 4-Step DORA Handshake

\`\`\`
[ Client ]                                            [ DHCP Server ]
    │                                                        │
    │ ─── 1. DHCPDISCOVER (Broadcast 255.255.255.255) ─────> │  "Is there a DHCP server?"
    │                                                        │
    │ <── 2. DHCPOFFER (Unicast/Broadcast: 192.168.1.50) ─── │  "Here is an available IP!"
    │                                                        │
    │ ─── 3. DHCPREQUEST (Broadcast: "I choose 1.50") ─────> │  "I accept this lease!"
    │                                                        │
    │ <── 4. DHCPACK (Unicast: "Confirmed!") ─────────────── │  "Lease confirmed for 24h."
    │                                                        │
\`\`\`
`,
    contentMarkdownHi: `
### DHCP की DORA प्रक्रिया
1. **D - Discover**: क्लाइंट नेटवर्क पर ब्रॉडकास्ट भेजकर पूछता है कि क्या कोई DHCP सर्वर उपलब्ध है?
2. **O - Offer**: सर्वर उपलब्ध IP एड्रेस का प्रस्ताव (Offer) भेजता है।
3. **R - Request**: क्लाइंट उस IP को स्वीकार करने का अनुरोध करता है।
4. **A - Acknowledge**: सर्वर पुष्टि (ACK) करता है और लीज टाइम शुरू हो जाता है।
`
  },

  // 10. Network Troubleshooting
  {
    id: "network-troubleshooting-guide",
    title: "The 7-Step Network Troubleshooting Methodology: From Physical to Application",
    titleHi: "नेटवर्क समस्या निवारण (Troubleshooting) के 7 महत्वपूर्ण चरण: शुरुआती से एडवांस्ड",
    metaDescription: "Master structured network troubleshooting from Layer 1 to Layer 7: link lights, ping, ARP, default gateway reachability, DNS resolution, and port diagnostics.",
    metaDescriptionHi: "लेयर 1 से लेयर 7 तक नेटवर्क ट्रबलशूटिंग का व्यवस्थित तरीका: केबल जांच, पिंग, गेटवे, DNS रिज़ॉल्यूशन और पोर्ट डायग्नोस्टिक्स।",
    category: "Network Engineering",
    readTime: "9 min",
    difficulty: "Applied Practical",
    difficultyHi: "व्यावहारिक अनुप्रयोग",
    author: "RTechLab Technical Editorial Team",
    lastUpdated: "November 2026",
    badge: "Field Engineering Standard",
    topology: "Host PC ===> Switch Port ===> Default Gateway Router ===> DNS Server ===> Destination",
    prerequisites: "Familiarity with CLI commands (ping, traceroute/tracert, ipconfig/ip a).",
    objectives: [
      "Follow the structured Top-Down or Bottom-Up OSI troubleshooting models",
      "Verify Layer 1 physical link status and Layer 2 link negotiation",
      "Diagnose Layer 3 IP and gateway reachability with ping and traceroute",
      "Isolate Layer 7 DNS resolution failures vs transport layer firewall blocks"
    ],
    connectedTool: {
      name: "DNS Record Lookup Tool (DoH)",
      path: "/tools/dns-lookup",
      description: "Determine whether connectivity issues stem from DNS resolution or IP routing."
    },
    tableOfContents: [
      { id: "methodology", title: "The Troubleshooting Mindset", titleHi: "समस्या निवारण की सही सोच" },
      { id: "seven-steps", title: "The 7 Structured Diagnostic Steps", titleHi: "7 व्यवस्थित डायग्नोस्टिक चरण" },
      { id: "command-toolkit", title: "Essential Diagnostic CLI Toolkit", titleHi: "प्रमुख डायग्नोस्टिक कमांड्स" },
      { id: "faqs", title: "Frequently Asked Questions", titleHi: "अक्सर पूछे जाने वाले प्रश्न" }
    ],
    faqs: [
      {
        q: "What does it mean if I can ping 8.8.8.8 but cannot browse google.com?",
        qHi: "यदि 8.8.8.8 पिंग हो रहा है लेकिन वेबसाइट नहीं खुल रही, तो इसका क्या कारण है?",
        a: "This is a textbook DNS Failure. Layer 1 (Physical), Layer 2 (Data Link), and Layer 3 (Routing) are all functioning correctly because IP packets can reach Google's public IP. However, your device cannot resolve the hostname 'google.com' into an IP address. Check your DNS configuration in /etc/resolv.conf or network adapter settings.",
        aHi: "यह स्पष्ट रूप से DNS की समस्या है। आपका इंटरनेट और रूटिंग बिल्कुल सही काम कर रहे हैं, लेकिन आपका कंप्यूटर डोमेन नाम को IP में नहीं बदल पा रहा है।"
      }
    ],
    contentMarkdown: `
### The 7-Step Troubleshooting Methodology

\`\`\`
Step 1: Check Physical Link (Cable plugged in? Link LED solid green?)
   │
Step 2: Check Local IP Configuration (Do you have a valid IP or 169.254 APIPA?)
   │
Step 3: Ping Local Loopback (ping 127.0.0.1 - verifies TCP/IP stack integrity)
   │
Step 4: Ping Default Gateway (Verifies local LAN and switch connectivity)
   │
Step 5: Ping a Known Public IP (ping 8.8.8.8 - verifies WAN routing & NAT)
   │
Step 6: Test DNS Resolution (nslookup google.com - verifies name resolution)
   │
Step 7: Test Application Port (curl -Iv https://example.com - verifies Layer 4/7)
\`\`\`
`,
    contentMarkdownHi: `
### नेटवर्क समस्या निवारण के 7 चरण
1. **भौतिक कनेक्शन जांचें**: क्या केबल ठीक से लगी है और स्विच पोर्ट पर लाइट जल रही है?
2. **स्थानीय IP जांचें**: क्या कंप्यूटर को सही IP मिला है या 169.254 (APIPA) दिखा रहा है?
3. **लूपबैक पिंग करें**: \`ping 127.0.0.1\` चलाकर जांचें कि ऑपरेटिंग सिस्टम का नेटवर्क स्टैक सही है।
4. **डिफ़ॉल्ट गेटवे पिंग करें**: राउटर के IP को पिंग करके स्थानीय नेटवर्क की जांच करें।
5. **पब्लिक IP पिंग करें**: \`ping 8.8.8.8\` चलाकर इंटरनेट कनेक्शन की जांच करें।
6. **DNS जांचें**: क्या डोमेन नाम IP में बदल पा रहा है?
7. **पोर्ट और एप्लिकेशन जांचें**: क्या फ़ायरवॉल विशिष्ट पोर्ट (जैसे 443 या 80) को ब्लॉक तो नहीं कर रहा?
`
  }
];
