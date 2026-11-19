# RTechLab Episode 03: DNS – What Happens When You Type Google.com?
## Complete Production, Storyboard, Bilingual Scripts, Shorts & Publishing Package

**Episode Number:** EP-03  
**Target Duration:** 7:10 (430 seconds / 12,900 frames @ 30 FPS)  
**Aspect Ratio:** 16:9 (1920×1080)  
**Primary Brand Tagline:** Learn. Practice. Innovate.  
**Secondary Tagline:** Technology Made Practical.  
**Educational Partner:** IANT Computer Education, Palanpur  
**Instagram Collaborators:** @rahul.28.1994, @iant_palanpur  
**Creative Philosophy:** RESULT FIRST, THEN EXPLAIN  

---

## 1. Executive Summary & Mandatory Technical Standards

- **Technical Accuracy Standard:**
  1. **Strict Protocol Layer Separation:**
     - DNS only resolves Fully Qualified Domain Names (FQDNs) to IP addresses over UDP/TCP Port 53.
     - Once the IP address is delivered to the browser, display: `✓ DNS RESOLUTION COMPLETE`.
     - The browser opens a completely separate transport connection (TCP 3-way handshake / QUIC) followed by TLS 1.3 cryptographic session negotiation.
     - Rule: NEVER depict TLS as part of DNS resolution.
  2. **Cold-Cache vs Cached Lookups:**
     - Display label: `[ COLD-CACHE EXAMPLE / ILLUSTRATIVE WALKTHROUGH ]` when demonstrating full root/TLD/authoritative resolution.
     - Clarify that in production, resolvers cache intermediate NS/TLD records.
  3. **Performance Metrics:**
     - Avoid universal latency guarantees. Note: `*Illustrative network benchmark: Latency varies by physical distance and routing conditions.`

---

## 2. 10-Act Pedagogical Storyboard & Narrative Arc

| Act | Time | Title (EN / HI) | Visual & Animation Scene | Audio / SFX |
| :--- | :--- | :--- | :--- | :--- |
| **Act 1** | 00:00 - 00:45 | You Hit Enter: The Invisible Stopwatch / आप एंटर दबाते हैं: अदृश्य स्टॉपवॉच | Close up of browser address bar; cursor types `google.com` and hits Enter. Millisecond timer triggers. | Keyboard clack, digital whoosh, clock ticking SFX. |
| **Act 2** | 00:45 - 01:25 | Names vs Numbers: The Mnemonic Machine / नाम बनाम नंबर: आईपी का रहस्य | Human brain recalling letters vs router silicon reading 32-bit binary digits (`10001110.11111010...`). | Tech beep, binary data matrix waterfall. |
| **Act 3** | 01:25 - 02:10 | Local Caches: Browser & OS Stub Resolver / लोकल कैश: ब्राउज़र और ऑपरेटिंग सिस्टम | Inspection of browser RAM table $\to$ OS `hosts` file and stub resolver cache. Cold-cache miss badge appears. | Glass tap, amber "Cache Miss" notification sound. |
| **Act 4** | 02:10 - 02:55 | The Journey to The Recursive Resolver / रिकर्सिव रिज़ॉल्वर तक UDP पैकेट | UDP packet on port 53 flying from home Wi-Fi across ISP fiber to resolver at `8.8.8.8` / `1.1.1.1`. | High-frequency pulse flight SFX, digital handoff ping. |
| **Act 5** | 02:55 - 03:45 | Cold-Cache Walk: 13 Root Clusters (.) / 13 रूट सर्वर क्लस्टर्स का दौरा | Resolver queries Root Server (`[a-m].root-servers.net`). 3D globe showing Anycast BGP nodes. Root points to `.com` TLD. | Deep resonant sonar ping, spatial hologram rotation. |
| **Act 6** | 03:45 - 04:30 | The TLD Registry (.com) & Verisign / TLD रजिस्ट्री और वेरिसाइन का जवाब | Resolver queries Verisign TLD cluster. TLD returns NS records for `ns1.google.com` + Glue A records. | Fast router relay tick, authoritative stamp chime. |
| **Act 7** | 04:30 - 05:15 | Google's Authoritative Nameserver & The Answer / गूगल का अथॉरिटेटिव सर्वर और अंतिम उत्तर | Google authoritative server answers: `google.com. 300 IN A 142.250.190.46`. Resolver caches answer. | Vibrant green chime: "✓ DNS RESOLUTION COMPLETE". |
| **Act 8** | 05:15 - 06:00 | Stage 2: Handshake & Transport (Separation!) / स्टेज 2: टीसीपी हैंडशेक और टीएलएस | Clear visual dividing line: DNS is done. Browser launches TCP SYN, SYN-ACK, ACK and TLS 1.3 keys. | Heavy metallic vault lock, cryptographic key shimmer. |
| **Act 9** | 06:00 - 06:35 | Core Architectural Rules / डीएनएस के 3 मुख्य नियम | 3 Rule cards: 1. Directory not transport; 2. Hierarchical delegation; 3. Caching saves the web. | Three rhythmic low-impact stamps. |
| **Act 10** | 06:35 - 07:10 | Brand Outro & Interactive DNS Tool / आधिकारिक आउट्रो एवं लाइव टूल | RTechLab glowing logo, CTA to try `/tools/dns-lookup`. Teaser for EP-04: Data Packets. | Brand sonic outro, fadeout. |

---

## 3. Bilingual Master Narration Scripts

### English Narration (Christopher Neural, Rate +12%)
> **Act 1 (00:00 - 00:45):**  
> "You open a browser, type 'google.com', and press Enter. Before your display can render a single pixel or font, your machine initiates an invisible digital interrogation. Computers do not understand words, brand names, or letters. Across all routing silicon on Earth, machines communicate exclusively in numbers. In the next fifteen milliseconds, your computer must solve one question: What is Google's numerical IP address?"
>
> **Act 2 (00:45 - 01:25):**  
> "Imagine having to memorize two hundred phone numbers just to browse the web! The Domain Name System—RFC 1035—is humanity's greatest distributed directory. It maps human mnemonic words like 'google.com' directly into thirty-two bit IPv4 numbers or one hundred twenty-eight bit IPv6 addresses. But finding that number without a central database is an engineering masterpiece."
>
> **Act 3 (01:25 - 02:10):**  
> "First, your machine searches locally. Your browser checks its internal RAM cache. If you visited Google five minutes ago, the answer is already there. If not, it asks your operating system's Stub Resolver. In our cold-cache example, neither has the answer. Your computer encapsulates a DNS query into a lightweight UDP packet and fires it to your ISP or public recursive resolver over Port 53."
>
> **Act 4 (02:10 - 02:55):**  
> "The Recursive Resolver acts as your digital detective. It doesn't guess, and it doesn't search randomly. It navigates an inverted tree of authority starting at the very top: the DNS Root."
>
> **Act 5 (02:55 - 03:45):**  
> "Across the world, there are only thirteen Root Server IP addresses, named A through M. But through BGP Anycast, these thirteen addresses broadcast from over seventeen hundred physical data centers worldwide! The resolver queries the Root: 'Where is google.com?' The Root answers: 'I do not have Google's IP, but here are the authoritative nameservers for the dot-com Top-Level Domain!'"
>
> **Act 6 (03:45 - 04:30):**  
> "The resolver travels to the dot-com TLD registry, maintained by Verisign. The TLD server responds: 'I don't have the final IP address, but I know who manages Google's zone: here are Google's authoritative nameservers, ns1 through ns4.google.com!'"
>
> **Act 7 (04:30 - 05:15):**  
> "Finally, the resolver queries Google's Authoritative Name Server directly. This server holds the master DNS zone record. It replies with certainty: 'google.com has IP address 142.250.190.46, with a Time-To-Live of 300 seconds!' The resolver caches the result and delivers the IP to your browser. Notice the checkpoint: DNS RESOLUTION IS NOW COMPLETE!"
>
> **Act 8 (05:15 - 06:00):**  
> "This brings us to the single biggest misconception in computer networking: DNS does not download websites! DNS never touches web content. Now that the browser possesses the verified numerical IP, DNS steps aside completely. The browser opens a totally separate transport connection: the TCP three-way handshake, followed by TLS 1.3 cryptographic session encryption!"
>
> **Act 9 (06:00 - 06:35):**  
> "Remember the three golden rules of DNS: First, DNS is an address book, not a transport highway. Second, authority is strictly delegated downward through roots, TLDs, and zone records. Third, caching makes the Internet scalable: after the first cold lookup, subsequent visits resolve locally in under one millisecond."
>
> **Act 10 (06:35 - 07:10):**  
> "Test live DNS lookups for any domain yourself using our free simulator at rtechlab.com/tools/dns-lookup. Subscribe to RTechLab for practical engineering breakdowns. Up next: How 4K video gets sliced into fifteen hundred byte packets! Learn, practice, and innovate with RTechLab."

---

## 4. Three Dedicated Shorts (English & Hindi)

### Short 01: "Why There Are Only 13 Root DNS Addresses in the Entire World"
- **Hook:** "Did you know the entire global Internet depends on just 13 Root DNS addresses?"
- **Duration:** 51s | 9:16 Vertical
- **Collabs:** @rahul.28.1994, @iant_palanpur

### Short 02: "Cold Cache vs Warm Cache: Why Second Clicks are Instant"
- **Hook:** "Ever notice how a website loads 10x faster the second time you click it?"
- **Duration:** 46s | 9:16 Vertical

### Short 03: "DNS Never Transports Web Pages! (The Big Mistake Explained)"
- **Hook:** "Stop thinking DNS downloads websites! Here is what really happens."
- **Duration:** 43s | 9:16 Vertical
