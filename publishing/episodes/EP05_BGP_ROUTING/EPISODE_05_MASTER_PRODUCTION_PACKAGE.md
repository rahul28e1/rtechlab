# RTechLab Episode 05: BGP – How the Internet Finds Its Route
## Complete Production, Storyboard, Bilingual Scripts, Shorts & Publishing Package

**Episode Number:** EP-05  
**Target Duration:** 7:25 (445 seconds / 13,350 frames @ 30 FPS)  
**Aspect Ratio:** 16:9 (1920×1080)  
**Primary Brand Tagline:** Learn. Practice. Innovate.  
**Secondary Tagline:** Technology Made Practical.  
**Educational Partner:** IANT Computer Education, Palanpur  
**Instagram Collaborators:** @rahul.28.1994, @iant_palanpur  
**Creative Philosophy:** RESULT FIRST, THEN EXPLAIN  

---

## 1. Executive Summary & Technical Verification Gate

- **Core Question / Result First:** In October 2021, Facebook, WhatsApp, and Instagram vanished from the entire planet simultaneously. Their servers were running, their power was on, and their databases were untouched. Yet, no computer on Earth could reach them. Why? Because an engineer accidentally withdrew their BGP routes, erasing their digital existence from the global map!
- **RFC & Engineering Facts:**
  - RFC 4271: Border Gateway Protocol 4 (BGP-4) is the de facto path-vector exterior gateway protocol of the global Internet.
  - The Internet consists of over 100,000 Autonomous Systems (ASNs).
  - Peering vs Transit:
    - Settlement-free peering occurs at Internet Exchange Points (IXPs like NIXI in Mumbai, DE-CIX in Frankfurt).
    - IP Transit is bought from Tier-1 transit carriers (Lumen, Telia, Tata Communications, NTT).
  - Path Vector: BGP prevents loops using the AS-Path attribute; if a router sees its own ASN in the path, it drops the advertisement.
  - Full routing table size exceeds 950,000 IPv4 routes and 200,000 IPv6 routes.

---

## 2. 10-Act Pedagogical Storyboard & Narrative Arc

| Act | Time | Title (EN / HI) | Visual & Animation Scene | Audio / SFX |
| :--- | :--- | :--- | :--- | :--- |
| **Act 1** | 00:00 - 00:45 | The Day Facebook Disappeared / वो दिन जब फेसबुक गायब हुआ | World map showing Facebook's glowing data centers suddenly blinking out of existence; 404 error HUD. | Alarm klaxon, power drop sound, low ominous drone. |
| **Act 2** | 00:45 - 01:30 | The Internet Has No Central Boss / इंटरनेट का कोई मालिक नहीं है | Hologram of Earth showing 100,000 independent network bubbles (ASNs) connecting in a decentralized web. | Spatial tech ambiance, digital network chatter. |
| **Act 3** | 01:30 - 02:15 | What is an Autonomous System (ASN)? / ऑटोनॉमस सिस्टम (ASN) क्या है? | Inspection of AS15169 (Google), AS32934 (Meta), AS55836 (Reliance Jio). Unique ASN badges. | Stamp sounds, database query blip. |
| **Act 4** | 02:15 - 03:00 | Peering vs Transit: How Telecoms Make Money / पीयरिंग बनाम ट्रांजिट: टेलीकॉम का बिजनेस | Two ISP routers at NIXI exchanging data for free (Peering) vs paying Tier-1 carrier (Transit). | Cash register subtle click, fiber optic data stream. |
| **Act 5** | 03:00 - 03:45 | Inside NIXI: Internet Exchange Points (IXPs) / NIXI के अंदर: इंटरनेट एक्सचेंज पॉइंट्स | Physical IXP switch room in Mumbai; 100GbE fiber jumpers linking Indian ISPs directly. | Cooling fan whir, high-density optical blinking. |
| **Act 6** | 03:45 - 04:30 | The BGP Routing Table & Path Vector / BGP राउटिंग टेबल और AS-Path | Router inspecting AS-Path attribute: `AS55836 -> AS6453 -> AS15169`. Loop detection animation. | Data matrix waterfall, mechanical stepper click. |
| **Act 7** | 04:30 - 05:15 | Traceroute in Real Time / ट्रेसरूट: पैकेट की छलांगें देखना | Terminal window running `traceroute 8.8.8.8`; hop 1 (home router), hop 2 (ISP gateway), hop 5 (IXP), hop 7 (Google). | Terminal keystrokes, ping response blips. |
| **Act 8** | 05:15 - 06:00 | BGP Route Hijacking & Security (RPKI) / रूट हाइजैकिंग और आरपीकेआई सुरक्षा | Rogue ISP falsely advertising YouTube's IP block; RPKI cryptographic certificate invalidating fake route. | Red alert siren, green cryptographic shield snap. |
| **Act 9** | 06:00 - 06:40 | The Harmony of 100,000 Networks / 1 लाख नेटवर्क्स का संतुलन | Global mesh glowing in mathematical rhythm as petabytes flow without central coordination. | Inspiring electronic harmony. |
| **Act 10** | 06:40 - 07:25 | Brand Outro & Networking Tools / आधिकारिक आउट्रो एवं नेटवर्किंग टूल्स | RTechLab logo, CTA to explore tools and IANT Palanpur collaboration. Teaser for EP-06: Optical Fiber. | Sonic brand signature, fadeout. |

---

## 3. Bilingual Master Narration Scripts

### English Narration (Christopher Neural, Rate +12%)
> **Act 1 (00:00 - 00:45):**  
> "On October 4th, 2021, three billion people were suddenly cut off from Facebook, WhatsApp, and Instagram. Their servers were powered on, their code was intact, and their databases were untouched. Yet to the rest of the planet, Facebook had ceased to exist! What happened? An engineer pushed a routine maintenance script that withdrew their Border Gateway Protocol routes. Within seconds, the GPS of the Internet forgot how to find them."
>
> **Act 2 (00:45 - 01:30):**  
> "Most people believe the Internet is a single giant network owned by telecom monopolies or governments. In reality, there is no single Internet! The Internet is a federation of over one hundred thousand completely independent private networks communicating through voluntary agreements."
>
> **Act 3 (01:30 - 02:15):**  
> "Each of these networks is called an Autonomous System, identified by a globally unique Autonomous System Number, or ASN. Google is AS fifteen one sixty-nine. Meta is AS thirty-two nine thirty-four. Your local Internet service provider has its own ASN. But how do one hundred thousand independent networks agree on the best route for your data?"
>
> **Act 4 (02:15 - 03:00):**  
> "Through BGP—the Border Gateway Protocol. Telecoms connect in two distinct ways: Transit and Peering. In IP Transit, a smaller provider pays a massive Tier-1 carrier to access the global routing table. In Peering, two networks meet at an Internet Exchange Point and agree to swap customer traffic for free!"
>
> **Act 5 (03:00 - 03:45):**  
> "In India, networks meet at NIXI—the National Internet Exchange of India. Instead of sending an email from Mumbai to Delhi through an undersea cable to London and back, Indian ISPs plug into high-speed optical switches inside NIXI, trading domestic traffic locally in under ten milliseconds."
>
> **Act 6 (03:45 - 04:30):**  
> "BGP is a Path-Vector protocol. Every BGP router maintains a master routing table containing nearly one million global network destinations. When advertising a route, routers append their own ASN to the AS-Path attribute. If a router sees its own ASN in the path, it instantly rejects the advertisement, mathematically preventing routing loops."
>
> **Act 7 (04:30 - 05:15):**  
> "You can watch BGP work right now from your own command line! Type 'traceroute' followed by any domain name. Your computer reveals every router hop: your home gateway, your neighborhood switch, your ISP's regional border router, the IXP exchange, and the destination cloud server."
>
> **Act 8 (05:15 - 06:00):**  
> "Because BGP was originally designed on trust, it can be abused. In BGP Route Hijacking, a rogue network falsely advertises another company's IP prefix, redirecting global traffic into a digital trap. Today, cryptographic certificates called RPKI validate route origins, ensuring only verified network owners can announce their IP prefixes."
>
> **Act 9 (06:00 - 06:40):**  
> "BGP is humanity's decentralized highway system: a protocol built on mutual interest that keeps one hundred thousand independent networks trading data every millisecond without a central master."
>
> **Act 10 (06:40 - 07:25):**  
> "Practice networking commands and inspect IP routes using our interactive tools at rtechlab.com. Subscribe to RTechLab for practical engineering breakdowns. Up next: Optical Fiber—how invisible laser light carries terabits through glass! Learn, practice, and innovate with RTechLab."

---

## 4. Three Dedicated Shorts (English & Hindi)

### Short 01: "The Day Facebook Disappeared (The True BGP Story)"
- **Hook:** "How did one configuration command delete Facebook from the entire planet?"
- **Duration:** 53s | 9:16 Vertical
- **Collabs:** @rahul.28.1994, @iant_palanpur

### Short 02: "What is an Autonomous System (ASN)? The True Building Block of the Web"
- **Hook:** "Who owns the Internet? Nobody! Here is what really makes it run."
- **Duration:** 47s | 9:16 Vertical

### Short 03: "Traceroute: How to Watch Your Packet Hop Across Countries"
- **Hook:** "Open your terminal and type this command to see the Internet's secret paths!"
- **Duration:** 46s | 9:16 Vertical
