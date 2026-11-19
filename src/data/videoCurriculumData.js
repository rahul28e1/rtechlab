/**
 * RTechLab Video & Social Media Curriculum Registry
 * Master dataset for YouTube Long-Form Masterclasses, YouTube Shorts, and Instagram Reels
 * Full Verified Release: November 12 - December 31, 2026
 * Contains 7 Full Masterclasses + 35 Dual-Language Shorts & Reels (70 videos total)
 */

export const YOUTUBE_MASTERCLASSES = [
  {
    "id": "how-the-internet-works",
    "episode": 1,
    "category": "Networking & Infrastructure",
    "duration": "6:21",
    "status": "published",
    "publishedDate": "2026-11-16",
    "title": {
      "en": "How Does the Internet Actually Work? (In 175 Milliseconds)",
      "hi": "इंटरनेट असल में कैसे काम करता है? (175 मिलीसेकंड में 13,000 km)"
    },
    "subtitle": {
      "en": "From Smartphone Tap to Cloud Server: The True Physical Story of the Global Web",
      "hi": "स्मार्टफोन टैप से क्लाउड सर्वर तक: इंटरनेट की सच्ची भौतिक कहानी"
    },
    "summary": {
      "en": "Documentary explainer tracing how a tap in Mumbai travels across oceans through 1.4 million km of subsea optical fiber cables to a cloud data center in Virginia, returning 4K video in 175 milliseconds.",
      "hi": "मुंबई में एक टैप समुद्र की गहराइयों में बिछी 14 लाख किलोमीटर फाइबर केबल्स से होता हुआ वर्जीनिया के क्लाउड सर्वर तक जाता है और 175 मिलीसेकंड में 4K वीडियो वापस लाता है।"
    },
    "links": {
      "en": {
        "youtubeId": "lFED1KvbnRk",
        "url": "https://youtu.be/lFED1KvbnRk",
        "status": "published"
      },
      "hi": {
        "youtubeId": "WoItOExOdtM",
        "url": "https://youtu.be/WoItOExOdtM",
        "status": "published"
      }
    },
    "tags": [
      "Subsea Cables",
      "Latency",
      "DNS",
      "Cloud",
      "Fiber Optics"
    ]
  },
  {
    "id": "underwater-internet-cables",
    "episode": 2,
    "category": "Subsea Infrastructure",
    "duration": "7:45",
    "status": "published",
    "publishedDate": "2026-11-13",
    "title": {
      "en": "Underwater Internet Cables: The 1.4 Million KM Deep Sea Highway",
      "hi": "समुद्र के नीचे इंटरनेट केबल्स: 14 लाख किलोमीटर का सबमरीन जाल"
    },
    "subtitle": {
      "en": "How 99% of All Global Internet Traffic Crosses the Ocean Floor at 5,000m Depth",
      "hi": "दुनिया का 99% इंटरनेट समुद्र की तलहटी से कैसे गुजरता है?"
    },
    "summary": {
      "en": "Deep-sea cable routes, landing stations, underwater repeaters with 10,000V DC power feeds, and the specialized cable repair ships that keep humanity connected.",
      "hi": "गहरे समुद्र में बिछी केबल्स, लैंडिंग स्टेशन, 10,000V DC पावर और केबल रिपेयर जहाजों की अद्भुत इंजीनियरिंग।"
    },
    "links": {
      "en": {
        "youtubeId": "lhAv-MEQecw",
        "url": "https://youtu.be/lhAv-MEQecw",
        "status": "published"
      },
      "hi": {
        "youtubeId": "O2nxc7yzuS4",
        "url": "https://youtu.be/O2nxc7yzuS4",
        "status": "published"
      }
    },
    "tags": [
      "Submarine Cables",
      "Repeaters",
      "Cable Ships",
      "DWDM",
      "Landing Stations"
    ]
  },
  {
    "id": "inside-1500-byte-tcp-packet",
    "episode": 3,
    "category": "Networking Protocols",
    "duration": "7:15",
    "status": "scheduled",
    "scheduledDate": "2026-11-24",
    "scheduledTime": "20:00 IST",
    "title": {
      "en": "Inside a 1500-Byte TCP Packet: The Physical Autopsy",
      "hi": "1500 बाइट के TCP पैकेट का पोस्टमार्टम: हेडर से पेलोड तक"
    },
    "subtitle": {
      "en": "Ethernet Frame, IP Header, TCP Flags, MSS vs MTU, and WireShark Breakdown",
      "hi": "ईथरनेट फ्रेम, आईपी हेडर, टीसीपी फ्लैग्स, MSS vs MTU और वायरशार्क लाइव डिसेक्शन"
    },
    "summary": {
      "en": "Complete bit-by-bit breakdown of a standard maximum transmission unit (MTU 1500) frame traversing routers and switches without fragmentation.",
      "hi": "मानक 1500 बाइट एमटीयू पैकेट का विस्तृत बाइट-स्तरीय विश्लेषण और राउटर्स पर पैकेट हैंडलिंग।"
    },
    "links": {
      "en": {
        "youtubeId": "o2W0z1qkwjk",
        "url": "https://youtu.be/o2W0z1qkwjk",
        "status": "scheduled",
        "scheduledDate": "2026-11-24"
      },
      "hi": {
        "youtubeId": "Ld8lPjbu_oc",
        "url": "https://youtu.be/Ld8lPjbu_oc",
        "status": "scheduled",
        "scheduledDate": "2026-11-24"
      }
    },
    "tags": [
      "TCP/IP",
      "MTU",
      "Wireshark",
      "Packets",
      "Networking"
    ]
  },
  {
    "id": "traceroute-how-packets-hop",
    "episode": 4,
    "category": "Routing & Diagnostic Tools",
    "duration": "8:10",
    "status": "scheduled",
    "scheduledDate": "2026-11-27",
    "scheduledTime": "20:00 IST",
    "title": {
      "en": "Traceroute: Watch Packets Hop Across 12 Autonomous Systems",
      "hi": "ट्रेसरूट: पैकेट्स को दुनिया के 12 नेटवर्क्स में छलांग लगाते देखें"
    },
    "subtitle": {
      "en": "TTL Decrementing, ICMP Time Exceeded, Anycast Nodes, and Subsea Hops",
      "hi": "टीटीएल डिक्रिमेंट, आईसीएमपी टाइम एक्सीडेड, एनीकास्ट नोड्स और समुद्र पार हॉप्स"
    },
    "summary": {
      "en": "Hands-on terminal deep dive showing how traceroute manipulates IP TTL to uncover every single intermediate router between your home and international servers.",
      "hi": "ट्रेसरूट कमांड कैसे आईपी टीटीएल को एक-एक करके बढ़ाकर दुनिया के सभी मध्यवर्ती राउटर्स का पता लगाती है।"
    },
    "links": {
      "en": {
        "youtubeId": "WPxxeWP9xfI",
        "url": "https://youtu.be/WPxxeWP9xfI",
        "status": "scheduled",
        "scheduledDate": "2026-11-27"
      },
      "hi": {
        "youtubeId": "-OO0FXaa_aA",
        "url": "https://youtu.be/-OO0FXaa_aA",
        "status": "scheduled",
        "scheduledDate": "2026-11-27"
      }
    },
    "tags": [
      "Traceroute",
      "ICMP",
      "TTL",
      "BGP",
      "Routing"
    ]
  },
  {
    "id": "dns-how-domain-names-resolve",
    "episode": 5,
    "category": "Protocols & DNS",
    "duration": "6:15",
    "status": "scheduled",
    "scheduledDate": "2026-12-04",
    "scheduledTime": "18:00 IST",
    "title": {
      "en": "DNS Architecture: How Domain Names Resolve Across 13 Root Servers",
      "hi": "DNS आर्किटेक्चर: 13 रूट सर्वर्स और एनीकास्ट राउटिंग की पूरी कार्यप्रणाली"
    },
    "subtitle": {
      "en": "What Happens in the 20 Milliseconds Between Typing a URL and Getting an IP",
      "hi": "URL टाइप करने और IP एड्रेस मिलने के बीच के 20 मिलीसेकंड का सच"
    },
    "summary": {
      "en": "Recursive resolvers, root nameservers, TLD authorities, authoritative zones, TTL caching hierarchy, and RFC 1035 packet trace visualization.",
      "hi": "रिकर्सिव रिज़ॉल्वर्स, रूट नेमसर्वर्स, TLD ऑथोरिटी और DNS कैशिंग की विस्तृत कार्यप्रणाली।"
    },
    "links": {
      "en": {
        "status": "scheduled",
        "scheduledDate": "2026-12-04"
      },
      "hi": {
        "status": "scheduled",
        "scheduledDate": "2026-12-04"
      }
    },
    "tags": [
      "DNS",
      "Root Servers",
      "Anycast",
      "TTL",
      "Networking"
    ]
  },
  {
    "id": "bgp-how-the-internet-finds-its-route",
    "episode": 6,
    "category": "Routing & Architecture",
    "duration": "8:00",
    "status": "scheduled",
    "scheduledDate": "2026-12-10",
    "scheduledTime": "18:00 IST",
    "title": {
      "en": "BGP Routing: How The Internet Finds Its Path Across 100,000 ASNs",
      "hi": "BGP राउटिंग: इंटरनेट 1 लाख नेटवर्क्स में सही रास्ता कैसे खोजता है?"
    },
    "subtitle": {
      "en": "Border Gateway Protocol, Autonomous Systems, and What Happens When Routes Break",
      "hi": "ऑटोनॉमस सिस्टम्स (ASN) और जब BGP क्रैश होता है तो क्या होता है"
    },
    "summary": {
      "en": "Path vector routing, autonomous system numbers (ASNs), peering exchanges, and retrospective analysis of the global Facebook BGP withdrawal outage.",
      "hi": "पाथ वेक्टर राउटिंग, पीयरिंग और फेसबुक के ऐतिहासिक BGP आउटेज का तकनीकी विश्लेषण।"
    },
    "links": {
      "en": {
        "status": "scheduled",
        "scheduledDate": "2026-12-10"
      },
      "hi": {
        "status": "scheduled",
        "scheduledDate": "2026-12-10"
      }
    },
    "tags": [
      "BGP",
      "ASN",
      "Peering",
      "Internet Architecture",
      "CCNA"
    ]
  },
  {
    "id": "data-centers-where-your-favourite-video-lives",
    "episode": 7,
    "category": "Cloud Infrastructure",
    "duration": "7:30",
    "status": "scheduled",
    "scheduledDate": "2026-12-18",
    "scheduledTime": "18:00 IST",
    "title": {
      "en": "Inside Cloud Data Centers: Power Grids, Server Racks & Hot-Cold Aisles",
      "hi": "क्लाउड डेटा सेंटर के अंदर: सर्वर रैक, हॉट-कोल्ड आइल और बैकअप जनरेटर्स"
    },
    "subtitle": {
      "en": "Tier IV Redundancy, Dual Power Feeds, PUE Metrics, and Flywheel UPS Systems",
      "hi": "टियर 4 रिडंडेंसी, फ्लाईव्हील UPS और सर्वर कूलिंग का वैज्ञानिक फॉर्मूला"
    },
    "summary": {
      "en": "Walkthrough inside hyper-scale cloud facilities: 42U racks, top-of-rack leaf-spine networking, CRAC cooling chillers, and zero-downtime N+2 power architecture.",
      "hi": "हाइपर-स्केल क्लाउड सुविधाओं, 42U सर्वर रैक्स और लीफ-स्पाइन नेटवर्किंग की अंदरूनी संरचना।"
    },
    "links": {
      "en": {
        "status": "scheduled",
        "scheduledDate": "2026-12-18"
      },
      "hi": {
        "status": "scheduled",
        "scheduledDate": "2026-12-18"
      }
    },
    "tags": [
      "Data Center",
      "Cloud",
      "Leaf-Spine",
      "Cooling",
      "UPS"
    ]
  }
];

export const INSTAGRAM_REELS_AND_SHORTS = [
  {
    "id": "ep01-short-cloud",
    "episode": "EP01",
    "date": "2026-11-12",
    "category": "Subsea Infrastructure",
    "duration": "52s",
    "status": "published",
    "publishedDate": "2026-11-12",
    "title": {
      "en": "The Internet Is NOT a Cloud 🌊 (99% Is Underwater)",
      "hi": "इंटरनेट कोई बादल नहीं है! 🌊 (99% समुद्र के नीचे है)"
    },
    "highlight": "The biggest lie in tech: The cloud does not float in the sky. Over 99% of global traffic passes through 1.4 million km of subsea silica cables.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/reel/Dfowq2moCYt/",
      "instagramHi": "https://www.instagram.com/reel/Dfo2-2DIQoW/",
      "isIgPublished": true,
      "youtubeShortEn": null,
      "youtubeShortHi": null
    }
  },
  {
    "id": "ep02-short-cables",
    "episode": "EP02",
    "date": "2026-11-13",
    "category": "Subsea Infrastructure",
    "duration": "55s",
    "status": "published",
    "publishedDate": "2026-11-13",
    "title": {
      "en": "How Subsea Cables Connect Our World 🌊 (17mm Thickness Secret)",
      "hi": "समुद्र के नीचे इंटरनेट कैसे चलता है? 🌊 (17mm मोटाई का रहस्य)"
    },
    "highlight": "A deep sea submarine cable carrying 200 Tbps is only as thick as a standard garden hose (17mm)!",
    "platforms": {
      "instagramEn": "https://www.instagram.com/reel/Dfq4C9zo_WV/",
      "instagramHi": "https://www.instagram.com/reel/Dfq43lrotyg/",
      "isIgPublished": true,
      "youtubeShortEn": "https://youtube.com/shorts/fy_dUabD4M8",
      "youtubeShortHi": "https://youtube.com/shorts/81NXj_KhaM4",
      "isYtPublished": true
    }
  },
  {
    "id": "ql01-short-ports",
    "episode": "QL01",
    "date": "2026-11-14",
    "category": "Networking & Security",
    "duration": "58s",
    "status": "published",
    "publishedDate": "2026-11-14",
    "title": {
      "en": "5 Networking Ports Every Engineer MUST Know (22, 53, 80, 443, 3389)",
      "hi": "५ महत्वपूर्ण नेटवर्किंग पोर्ट्स जो हर इंजीनियर को याद होने चाहिए"
    },
    "highlight": "SSH (22), DNS (53), HTTP (80), HTTPS (443), and RDP (3389) mapped to OSI Layer 4 transport endpoints.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/reel/Dfugpfcom0k/",
      "instagramHi": "https://www.instagram.com/reel/DfujLZ3ohS0/",
      "isIgPublished": true,
      "youtubeShortEn": null,
      "youtubeShortHi": null
    }
  },
  {
    "id": "ep03-short-root-dns",
    "episode": "EP03",
    "date": "2026-11-15",
    "category": "DNS & Protocols",
    "duration": "54s",
    "status": "published",
    "publishedDate": "2026-11-15",
    "title": {
      "en": "Why Are There Only 13 Root DNS Server IP Addresses Worldwide?",
      "hi": "पूरी दुनिया में केवल 13 रूट DNS एड्रेस क्यों हैं? (A to M Root Servers)"
    },
    "highlight": "The historical 512-byte UDP packet limit under RFC 1035 that constrained the global root DNS namespace to 13 distinct IP addresses.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/reel/DfvycRPoWvN/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/reel/DfvzgGQI35O/",
      "isIgPublished": true,
      "youtubeShortEn": "https://youtube.com/shorts/o0ONPV45khk",
      "youtubeShortHi": "https://youtube.com/shorts/frv1J-l4BFc",
      "isYtPublished": true
    }
  },
  {
    "id": "ep01-short-latency-175ms",
    "episode": "EP01",
    "date": "2026-11-16",
    "category": "Physics & Hardware",
    "duration": "60s",
    "status": "published",
    "publishedDate": "2026-11-16",
    "title": {
      "en": "13,000 km in 175 Milliseconds: The Physics of Internet Latency ⚡",
      "hi": "175 मिलीसेकंड में 13,000 किलोमीटर: इंटरनेट स्पीड का सच ⚡"
    },
    "highlight": "When you tap play in Mumbai, photons race through subsea silica glass across 13,000 km to Virginia and return in 175ms flat.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/2yH_t-ldgp8",
      "youtubeShortHi": "https://youtube.com/shorts/6SQIJaARaG0",
      "isYtPublished": true
    }
  },
  {
    "id": "ep02-short-cable-ships",
    "episode": "EP02",
    "date": "2026-11-17",
    "category": "Marine Engineering",
    "duration": "59s",
    "status": "published",
    "publishedDate": "2026-11-17",
    "title": {
      "en": "How Cable Ships Fix Broken Internet at 5,000m Depth 🚢⚓",
      "hi": "5,000 मीटर गहरे समुद्र में टूटी केबल कैसे जुड़ती है? (केबल शिप्स) 🚢⚓"
    },
    "highlight": "Subsea ROV robots slicing tangled glass fibers at 5,000m depth and bringing them aboard specialized repair ships for micro-fusion splicing.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/2sbsfJjmfjw",
      "youtubeShortHi": "https://youtube.com/shorts/YbivKhNRywY",
      "isYtPublished": true
    }
  },
  {
    "id": "ep03-short-dhcp-dora",
    "episode": "EP03",
    "date": "2026-11-18",
    "category": "Networking Protocols",
    "duration": "56s",
    "status": "published",
    "publishedDate": "2026-11-18",
    "title": {
      "en": "DHCP Explained in 60s: Discover, Offer, Request, Acknowledge (DORA)",
      "hi": "DHCP कैसे काम करता है? DORA प्रोसेस 60 सेकंड में समझें"
    },
    "highlight": "How your phone gets an IP address in under 50ms every time you connect to a new Wi-Fi network.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/-W8w6th1_KQ",
      "youtubeShortHi": "https://youtube.com/shorts/cIoUmpaIyIM",
      "isYtPublished": true
    }
  },
  {
    "id": "ep04-short-caching",
    "episode": "EP04",
    "date": "2026-11-19",
    "category": "Web Performance",
    "duration": "52s",
    "status": "published",
    "publishedDate": "2026-11-19",
    "title": {
      "en": "Cold Cache vs Warm Cache: Why the Second Click is Instant ⚡",
      "hi": "कोल्ड कैश vs वार्म कैश: दूसरा क्लिक तुरंत क्यों खुलता है? ⚡"
    },
    "highlight": "Browser memory cache, Edge CDN caching, and database query cache eliminating 90% of backend round trips.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/HJI0aaRR-60",
      "youtubeShortHi": "https://youtube.com/shorts/4qavdMozxUs",
      "isYtPublished": true
    }
  },
  {
    "id": "ql02-short-tcp-udp",
    "episode": "QL02",
    "date": "2026-11-20",
    "category": "Protocols",
    "duration": "57s",
    "status": "scheduled",
    "scheduledDate": "2026-11-20",
    "title": {
      "en": "TCP vs UDP: Why YouTube Streams Use TCP But Gaming Uses UDP 🎮",
      "hi": "TCP vs UDP: यूट्यूब TCP और गेमिंग UDP क्यों इस्तेमाल करता है? 🎮"
    },
    "highlight": "Reliable 3-way handshakes with retransmission versus stateless datagrams optimized for zero-latency real-time multiplayer gaming.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/h-B8sfIbjko",
      "youtubeShortHi": "https://youtube.com/shorts/giRsIP2boqU",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ep05-short-landing-station",
    "episode": "EP05",
    "date": "2026-11-21",
    "category": "Hardware & Infrastructure",
    "duration": "55s",
    "status": "scheduled",
    "scheduledDate": "2026-11-21",
    "title": {
      "en": "Inside an Undersea Cable Landing Station: 10,000 Volts DC Power ⚡",
      "hi": "समुद्री केबल लैंडिंग स्टेशन पर क्या होता है? 10,000V करंट और लाइट! ⚡"
    },
    "highlight": "Power Feed Equipment (PFE) pumping 10,000 Volts DC into the ocean to power optical repeaters thousands of kilometers offshore.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/PeBcyO2cFl8",
      "youtubeShortHi": "https://youtube.com/shorts/J9X98SV-F-k",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ep06-short-packet-loss",
    "episode": "EP06",
    "date": "2026-11-22",
    "category": "Networking & Protocols",
    "duration": "53s",
    "status": "scheduled",
    "scheduledDate": "2026-11-22",
    "title": {
      "en": "What REALLY Happens When a Packet Drops During Video Playback? 📉",
      "hi": "वीडियो देखते समय अगर एक पैकेट ड्रॉप हो जाए तो क्या होता है? 📉"
    },
    "highlight": "TCP sliding window shrinkage, selective ACK (SACK), and fast retransmit keeping video streams smooth without hard buffering stops.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/Rl-c_f-MBEo",
      "youtubeShortHi": "https://youtube.com/shorts/XXq6PqC3k-A",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ql03-short-private-ip",
    "episode": "QL03",
    "date": "2026-11-23",
    "category": "IP Addressing & NAT",
    "duration": "50s",
    "status": "scheduled",
    "scheduledDate": "2026-11-23",
    "title": {
      "en": "Private vs Public IP: Why Everyone Has 192.168.1.1 At Home 🏠",
      "hi": "Private vs Public IP: सबके पास 192.168.1.1 एड्रेस क्यों होता है? 🏠"
    },
    "highlight": "RFC 1918 private address ranges and Network Address Translation (NAT) mapping billions of devices through scarce public IPv4 addresses.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/RXGr3UCH8cg",
      "youtubeShortHi": "https://youtube.com/shorts/MTxc7ZzrXv0",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ep07-short-1500-bytes",
    "episode": "EP07",
    "date": "2026-11-24",
    "category": "Packet Analysis",
    "duration": "58s",
    "status": "scheduled",
    "scheduledDate": "2026-11-24",
    "title": {
      "en": "Inside a 1500-Byte TCP Packet: What Does Every Byte Do? 📦",
      "hi": "1500 बाइट के डेटा पैकेट में हेडर क्या काम करते हैं? 📦"
    },
    "highlight": "14-byte Ethernet preamble, 20-byte IP header, 20-byte TCP header, leaving exactly 1460 bytes of pure payload payload (MSS).",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/FNLZkmZ8uOE",
      "youtubeShortHi": "https://youtube.com/shorts/MlPpMyQHeFc",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ep08-short-bgp-outage",
    "episode": "EP08",
    "date": "2026-11-25",
    "category": "Routing & Outages",
    "duration": "59s",
    "status": "scheduled",
    "scheduledDate": "2026-11-25",
    "title": {
      "en": "The Day Facebook Disappeared: The Single BGP Route Withdrawal 🚨",
      "hi": "वो दिन जब फेसबुक इंटरनेट से गायब हो गया: BGP आउटेज का सच! 🚨"
    },
    "highlight": "How an erroneous configuration withdrew ASN 32934 routes from global BGP tables, isolating Facebook DNS servers from the entire world.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/-wZxKKiDP2I",
      "youtubeShortHi": "https://youtube.com/shorts/vBsBSD2_DRw",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ql04-short-cidr",
    "episode": "QL04",
    "date": "2026-11-26",
    "category": "Subnetting & CIDR",
    "duration": "54s",
    "status": "scheduled",
    "scheduledDate": "2026-11-26",
    "title": {
      "en": "What Does /24 Actually Mean? Subnet Masks & CIDR Explained 🔢",
      "hi": "सबनेट मास्क क्या है? /24 और 255.255.255.0 का गणित 🔢"
    },
    "highlight": "24 consecutive binary 1s defining the network prefix, leaving 8 bits for 256 IP addresses (254 usable hosts).",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/A2SIVQQCf-k",
      "youtubeShortHi": "https://youtube.com/shorts/RBQePlo9e14",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ep09-short-traceroute",
    "episode": "EP09",
    "date": "2026-11-27",
    "category": "Diagnostics",
    "duration": "56s",
    "status": "scheduled",
    "scheduledDate": "2026-11-27",
    "title": {
      "en": "Traceroute: How to Watch Your Packets Hop Across the Planet 🌍",
      "hi": "Traceroute: अपने कंप्यूटर से पैकेट को देश-विदेश घूमते देखें 🌍"
    },
    "highlight": "Sending UDP probes with incrementing TTL from 1 to 30, eliciting ICMP Time-to-Live Exceeded messages from each hop router.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/xLSzqEBSX9g",
      "youtubeShortHi": "https://youtube.com/shorts/v2r4qyzLFYw",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ep10-short-light-speed-glass",
    "episode": "EP10",
    "date": "2026-11-28",
    "category": "Physics & Optics",
    "duration": "55s",
    "status": "scheduled",
    "scheduledDate": "2026-11-28",
    "title": {
      "en": "Why The Speed of Light in Optical Fiber is 31% Slower Than in Space! 💡",
      "hi": "ऑप्टिकल फाइबर में प्रकाश की गति अंतरिक्ष से 31% धीमी क्यों हो जाती है? 💡"
    },
    "highlight": "Vacuum speed 300,000 km/s reduced to 204,200 km/s due to silica glass refractive index (n = 1.4682).",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/IeYJXljTr8o",
      "youtubeShortHi": "https://youtube.com/shorts/IPR4loesp2A",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ql05-short-osi-layers",
    "episode": "QL05",
    "date": "2026-11-29",
    "category": "Computer Networks",
    "duration": "60s",
    "status": "scheduled",
    "scheduledDate": "2026-11-29",
    "title": {
      "en": "The 7 Layers of OSI Model Explained in 60s (No Jargon!) 🍕",
      "hi": "OSI मॉडल की सातों परतें 60 सेकंड में समझें (नो कन्फ्यूजन!) 🍕"
    },
    "highlight": "Physical, Data Link, Network, Transport, Session, Presentation, Application: Please Do Not Throw Sausage Pizza Away!",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/ACtMPx6i3g0",
      "youtubeShortHi": "https://youtube.com/shorts/TmzIutZBNUM",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "ep11-short-42u-rack",
    "episode": "EP11",
    "date": "2026-11-30",
    "category": "Cloud Data Center",
    "duration": "57s",
    "status": "scheduled",
    "scheduledDate": "2026-11-30",
    "title": {
      "en": "What Does a 42U Server Rack Look Like From The Inside? 🏢🖥️",
      "hi": "42U डेटा सेंटर सर्वर रैक अंदर से कैसा दिखता है? 🏢🖥️"
    },
    "highlight": "Dual redundant A/B PDUs, Top-of-Rack 100GbE leaf switches, and dense high-performance blade servers.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/Fq5D4ME_yS8",
      "youtubeShortHi": "https://youtube.com/shorts/tNRr83WMNwE",
      "isYtPublished": false,
      "isYtScheduled": true
    }
  },
  {
    "id": "dec-ep01",
    "episode": "EP01",
    "date": "2026-12-01",
    "category": "Fintech & IoT",
    "duration": "59s",
    "status": "scheduled",
    "scheduledDate": "2026-12-01",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "₹10 UPI QR Scan: How the Soundbox Speaks in 3 Seconds! 🎙️⚡",
      "hi": "₹10 का UPI QR Scan: 3 Second में Soundbox कैसे बोला? 🎙️⚡"
    },
    "highlight": "NPCI Central Switch, Bank CBS Ledgers, and MQTT Cellular IoT Soundbox Architecture explained.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/9gjsaGauTeo",
      "youtubeShortHi": "https://youtube.com/shorts/fIFyRWcnAt8",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "9gjsaGauTeo",
      "ytVideoIdHi": "fIFyRWcnAt8"
    }
  },
  {
    "id": "dec-ep02",
    "episode": "EP02",
    "date": "2026-12-03",
    "category": "Fintech & Databases",
    "duration": "58s",
    "status": "scheduled",
    "scheduledDate": "2026-12-03",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "UPI Payment Pending: Where Does Your Money Get Stuck? ⏳💸",
      "hi": "UPI Payment Pending: आपका पैसा कहाँ फंसा? (2-Phase Commit)"
    },
    "highlight": "Dual-ledger accounting, bank timeouts, and automated T+1 reconciliation settlement mechanisms.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/VjmA0PnezMk",
      "youtubeShortHi": "https://youtube.com/shorts/ZfBDC0-4b8s",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "VjmA0PnezMk",
      "ytVideoIdHi": "ZfBDC0-4b8s"
    }
  },
  {
    "id": "dec-ep03",
    "episode": "EP03",
    "date": "2026-12-05",
    "category": "High-Scale Concurrency",
    "duration": "60s",
    "status": "scheduled",
    "scheduledDate": "2026-12-05",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "How IRCTC Survives the 10 AM Tatkal Rush Without Crashing 🚆💥",
      "hi": "IRCTC 10:00 AM Tatkal: Server Crash क्यों नहीं होता? 🚆💥"
    },
    "highlight": "In-memory caching grid, rate limiting, and virtual waiting rooms handling millions of concurrent users.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/fpAqV2o4sZs",
      "youtubeShortHi": "https://youtube.com/shorts/L0qzcw1iXb4",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "fpAqV2o4sZs",
      "ytVideoIdHi": "L0qzcw1iXb4"
    }
  },
  {
    "id": "dec-ep04",
    "episode": "EP04",
    "date": "2026-12-07",
    "category": "Database Architecture",
    "duration": "57s",
    "status": "scheduled",
    "scheduledDate": "2026-12-07",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "25,000 Tickets/Min: IRCTC High-Speed Seat Allocation Engine 🎫⚡",
      "hi": "25,000 Tickets/Min: IRCTC Database Locking Architecture 🎫⚡"
    },
    "highlight": "Row-level database locks vs Redis distributed locking avoiding double-booking conflicts at scale.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/-mQ09lSfJ8U",
      "youtubeShortHi": "https://youtube.com/shorts/Osz42SLfMpE",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "-mQ09lSfJ8U",
      "ytVideoIdHi": "Osz42SLfMpE"
    }
  },
  {
    "id": "dec-ep05",
    "episode": "EP05",
    "date": "2026-12-09",
    "category": "Distributed Systems",
    "duration": "55s",
    "status": "scheduled",
    "scheduledDate": "2026-12-09",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "How BookMyShow Freezes Your Seat for Exactly 8 Minutes 🍿⏱️",
      "hi": "BookMyShow 8-Minute Seat Lock Architecture 🍿⏱️"
    },
    "highlight": "Redis TTL keys and distributed lock leases preventing race conditions when thousands select seats.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/vI5sTU7Q0I8",
      "youtubeShortHi": "https://youtube.com/shorts/qKwTygZU1Kc",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "vI5sTU7Q0I8",
      "ytVideoIdHi": "qKwTygZU1Kc"
    }
  },
  {
    "id": "dec-ep06",
    "episode": "EP06",
    "date": "2026-12-11",
    "category": "Real-Time Telemetry",
    "duration": "58s",
    "status": "scheduled",
    "scheduledDate": "2026-12-11",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "Behind Zomato's Live Map & Delivery Driver Tracking 🛵📍",
      "hi": "Zomato Real-Time GPS Delivery Tracking: लाइव मैप का सच 🛵📍"
    },
    "highlight": "WebSockets, MQTT, and geospatial Redis GEOINDEX calculating driver distance and ETA every 3 seconds.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/-I0OcdxDHoI",
      "youtubeShortHi": "https://youtube.com/shorts/kni694EXAGM",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "-I0OcdxDHoI",
      "ytVideoIdHi": "kni694EXAGM"
    }
  },
  {
    "id": "dec-ep07",
    "episode": "EP07",
    "date": "2026-12-13",
    "category": "Algorithmic Pricing",
    "duration": "56s",
    "status": "scheduled",
    "scheduledDate": "2026-12-13",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "The Math Behind Uber & Ola Dynamic Surge Pricing 🚖📈",
      "hi": "Uber / Ola Surge Pricing: Algorithm काम कैसे करता है? 🚖📈"
    },
    "highlight": "Hexagonal spatial partitioning (Uber H3) calculating supply vs demand ratios in real time.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/BX2iyESffy0",
      "youtubeShortHi": "https://youtube.com/shorts/_8PC8H3Qu0I",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "BX2iyESffy0",
      "ytVideoIdHi": "_8PC8H3Qu0I"
    }
  },
  {
    "id": "dec-ep08",
    "episode": "EP08",
    "date": "2026-12-15",
    "category": "Cryptography & Security",
    "duration": "59s",
    "status": "scheduled",
    "scheduledDate": "2026-12-15",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "The Cryptographic Secrets of WhatsApp End-to-End Encryption 🔐📱",
      "hi": "WhatsApp End-to-End Encryption: कोई नहीं पढ़ सकता (Signal Protocol) 🔐📱"
    },
    "highlight": "Diffie-Hellman key exchange and Double Ratchet algorithm generating unique forward-secret keys per message.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/q_Jfl0LDpsY",
      "youtubeShortHi": "https://youtube.com/shorts/InCXc0x0gpY",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "q_Jfl0LDpsY",
      "ytVideoIdHi": "InCXc0x0gpY"
    }
  },
  {
    "id": "dec-ep09",
    "episode": "EP09",
    "date": "2026-12-17",
    "category": "Video Streaming",
    "duration": "58s",
    "status": "scheduled",
    "scheduledDate": "2026-12-17",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "How Netflix Streams 4K Video Without Any Buffering Wheel 🎬🍿",
      "hi": "Netflix Adaptive Bitrate: Buffering खत्म कैसे हुआ? 🎬🍿"
    },
    "highlight": "Dynamic Adaptive Streaming over HTTP (DASH) and edge Open Connect Appliances (OCA) placed inside ISPs.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/zGkMKKOc30o",
      "youtubeShortHi": "https://youtube.com/shorts/3rRRrXSzAEw",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "zGkMKKOc30o",
      "ytVideoIdHi": "3rRRrXSzAEw"
    }
  },
  {
    "id": "dec-ep10",
    "episode": "EP10",
    "date": "2026-12-19",
    "category": "Big Data & Crowdsourcing",
    "duration": "57s",
    "status": "scheduled",
    "scheduledDate": "2026-12-19",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "Crowdsourced Telemetry: How Google Maps Knows Traffic Jams 🚦🗺️",
      "hi": "Google Maps Live Traffic: जाम का पता कैसे चलता है? 🚦🗺️"
    },
    "highlight": "Aggregated anonymized smartphone GPS speed telemetry processed through streaming Kalman filter models.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/mG1fz2DOTx0",
      "youtubeShortHi": "https://youtube.com/shorts/9FQpcT5HeAQ",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "mG1fz2DOTx0",
      "ytVideoIdHi": "9FQpcT5HeAQ"
    }
  },
  {
    "id": "dec-ep11",
    "episode": "EP11",
    "date": "2026-12-21",
    "category": "Hardware & Banking",
    "duration": "56s",
    "status": "scheduled",
    "scheduledDate": "2026-12-21",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "ATM Power Cut Mid-Dispense: Hardware Sensor & Rollback Secrets 🏧⚡",
      "hi": "ATM Power Cut Mid-Dispense: कटा हुआ पैसा वापस कैसे आता है? 🏧⚡"
    },
    "highlight": "Optical note-exit shutter sensors and ACID two-phase commit transactions auto-reversing debited accounts.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/A3aFpMp_4eA",
      "youtubeShortHi": "https://youtube.com/shorts/oK9ZraQx248",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "A3aFpMp_4eA",
      "ytVideoIdHi": "oK9ZraQx248"
    }
  },
  {
    "id": "dec-ep12",
    "episode": "EP12",
    "date": "2026-12-23",
    "category": "AI & Recommender Systems",
    "duration": "59s",
    "status": "scheduled",
    "scheduledDate": "2026-12-23",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "How the Instagram Reels Algorithmic Feed Predicts Your Watch Time 📲🎯",
      "hi": "Instagram Reels Recommendation Engine: एल्गोरिद्म का सच 📲🎯"
    },
    "highlight": "Two-tower neural networks computing embeddings for user affinity, audio trends, and retention probabilities.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/WOTnlBZeQDE",
      "youtubeShortHi": "https://youtube.com/shorts/IQR1sG80wwQ",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "WOTnlBZeQDE",
      "ytVideoIdHi": "IQR1sG80wwQ"
    }
  },
  {
    "id": "dec-ep13",
    "episode": "EP13",
    "date": "2026-12-25",
    "category": "Aviation & Radio",
    "duration": "58s",
    "status": "scheduled",
    "scheduledDate": "2026-12-25",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "How FlightRadar24 Tracks Every Airplane in Real-Time ✈️📡",
      "hi": "FlightRadar24: आसमान में उड़ते जहाजों की लाइव ट्रैकिंग ✈️📡"
    },
    "highlight": "1090 MHz ADS-B radio transponders decoded by a global decentralized crowd of Raspberry Pi SDR receivers.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/zzKKJP5OqEE",
      "youtubeShortHi": "https://youtube.com/shorts/iTNbZy_syHQ",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "zzKKJP5OqEE",
      "ytVideoIdHi": "iTNbZy_syHQ"
    }
  },
  {
    "id": "dec-ep14",
    "episode": "EP14",
    "date": "2026-12-27",
    "category": "Cybersecurity & DDoS",
    "duration": "59s",
    "status": "scheduled",
    "scheduledDate": "2026-12-27",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "How Cloudflare Absorbs 50-Million Request/Sec Cyber Attacks 🛡️🌐",
      "hi": "Cloudflare DDoS Shield: 50 Million Requests/sec Attack कैसे रुकता है? 🛡️🌐"
    },
    "highlight": "BGP Anycast dispersal across 300+ data centers and eBPF kernel packet filtering dropping malicious SYN floods in sub-microsecond time.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/HXMeGdeToVQ",
      "youtubeShortHi": "https://youtube.com/shorts/o_ksmN8kNIo",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "HXMeGdeToVQ",
      "ytVideoIdHi": "o_ksmN8kNIo"
    }
  },
  {
    "id": "dec-ep15",
    "episode": "EP15",
    "date": "2026-12-29",
    "category": "Graph Databases",
    "duration": "58s",
    "status": "scheduled",
    "scheduledDate": "2026-12-29",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "Truecaller Architecture: How It Names Unknown Numbers Instantly 📞🔍",
      "hi": "Truecaller Caller ID Architecture: नंबर डालते ही नाम कैसे आता है? 📞🔍"
    },
    "highlight": "Crowdsourced contact phonebook graphs, fuzzy string matching, and spam confidence score algorithms.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/TccW7QlstXM",
      "youtubeShortHi": "https://youtube.com/shorts/1xASkZ1eZjg",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "TccW7QlstXM",
      "ytVideoIdHi": "1xASkZ1eZjg"
    }
  },
  {
    "id": "dec-ep16",
    "episode": "EP16",
    "date": "2026-12-31",
    "category": "Cellular Networks",
    "duration": "60s",
    "status": "scheduled",
    "scheduledDate": "2026-12-31",
    "scheduledTime": "18:30 IST",
    "title": {
      "en": "New Year Midnight 12:00 AM Traffic: How Cellular Towers Survive the Surge 🎆📶",
      "hi": "New Year Midnight 12:00 AM Traffic Surge: मोबाइल टॉवर कैसे संभालते हैं? 🎆📶"
    },
    "highlight": "Cell breathing, priority control channels, dynamic carrier aggregation, and 5G network slicing.",
    "platforms": {
      "instagramEn": "https://www.instagram.com/rtechlabofficial/",
      "instagramHi": "https://www.instagram.com/rtechlabofficial/",
      "isIgPublished": false,
      "isIgScheduled": true,
      "scheduledTime": "18:30 IST",
      "youtubeShortEn": "https://youtube.com/shorts/EkP9G-ZF9v8",
      "youtubeShortHi": "https://youtube.com/shorts/9eLKruAX5d0",
      "isYtPublished": false,
      "isYtScheduled": true,
      "ytVideoIdEn": "EkP9G-ZF9v8",
      "ytVideoIdHi": "9eLKruAX5d0"
    }
  }
];
