/**
 * RTechLab Single-Channel Canonical Video Curriculum
 * 
 * Supports ONE YouTube video ID per topic with Multi-Language Audio (MLA).
 * Language switching updates the on-page transcript, notes, and diagrams
 * without duplicating website entries or splitting SEO canonical authority.
 */

export const VIDEO_CURRICULUM = [
  {
    topicId: "how-the-internet-works",
    slug: "how-the-internet-works",
    canonicalYouTubeId: "lFED1KvbnRk",
    hindiYouTubeId: "WoItOExOdtM",
    youTubeIds: {
      en: "lFED1KvbnRk",
      hi: "WoItOExOdtM"
    },
    youTubeUrls: {
      en: "https://youtu.be/lFED1KvbnRk",
      hi: "https://youtu.be/WoItOExOdtM"
    },
    durationSeconds: 381.12,
    durationFormatted: "6:21",
    resolution: "1920x1080",
    aspectRatio: "16:9",
    fps: 30,
    totalFrames: 11434,
    hasMultiLanguageAudio: true,
    availableAudioLanguages: ["en", "hi"],
    defaultAudioLanguage: "en",
    title: {
      en: "How Does the Internet Actually Work? (In 175 Milliseconds)",
      hi: "इंटरनेट असल में कैसे काम करता है? (175 मिलीसेकंड में 13,000 km)"
    },
    subtitle: {
      en: "From Smartphone Tap to Cloud Playback: The True Physical Story of the Internet",
      hi: "स्मार्टफोन टैप से क्लाउड प्लेबैक तक: इंटरनेट की सच्ची भौतिक कहानी"
    },
    summary: {
      en: "Documentary explainer tracing how a tap in Mumbai travels across oceans through 1.4 million km of subsea optical fiber cables to a cloud data center in Ashburn, Virginia, and streams 4K video back in approximately 175 milliseconds (approaching the 131.4 ms theoretical optical floor).",
      hi: "एक विस्तृत डॉक्यूमेंट्री जो दिखाती है कि कैसे मुंबई में एक टैप समुद्र की गहराइयों में बिछी 14 लाख किमी फाइबर केबल्स से होता हुआ वर्जीनिया के क्लाउड सर्वर तक जाता है और लगभग 175 मिलीसेकंड में 4K वीडियो वापस लाता है (ऑप्टिकल फाइबर का न्यूनतम सैद्धांतिक समय 131.4 ms है)।"
    },
    keyTakeaway: {
      en: "The Internet is not an invisible cloud in space — it is the largest physical machine ever constructed by humanity: sand melted into 9µm glass fiber, steel-armored cables in deep ocean trenches, and over 100,000 autonomous networks communicating in mathematical harmony.",
      hi: "इंटरनेट कोई अंतरिक्ष में तैरता बादल नहीं है — यह रेत से पिघलाकर बना 9 माइक्रोन का ग्लास फाइबर, समुद्र के गहरे गड्ढों में बिछी स्टील केबल्स और 1 लाख से अधिक नेटवर्क्स का बनाया दुनिया का सबसे विशाल भौतिक तंत्र है।"
    },
    technicalMetrics: {
      theoreticalFloorMs: 131.4,
      modeledCarrierMs: 175.0,
      oneWayDistanceKm: 13420,
      roundTripDistanceKm: 26840,
      fiberPropagationSpeedKmPerMs: 204.2,
      subseaTrafficPercentage: 99
    },
    chapters: [
      {
        id: "act-1",
        actNumber: 1,
        time: "00:00",
        seconds: 0,
        titleEn: "The 13,000 km Latency Paradox",
        titleHi: "13,000 किमी लेटेंसी का रहस्य",
        descEn: "Mumbai tap to Virginia cloud server: Modeled 175ms round trip vs 131.4ms physical optical floor.",
        descHi: "मुंबई से वर्जीनिया क्लाउड सर्वर: 175ms सिम्युलेटेड राउंड ट्रिप बनाम 131.4ms भौतिक ऑप्टिकल न्यूनतम सीमा।"
      },
      {
        id: "act-2",
        actNumber: 2,
        time: "00:40",
        seconds: 40,
        titleEn: "The Local Gateway: Wi-Fi to Glass Fiber",
        titleHi: "लोकल गेटवे: वाई-फ़ाई से ग्लास फ़ाइबर तक",
        descEn: "Converting 5GHz radio waves into 1310nm infrared laser pulses down a 9µm silica core.",
        descHi: "5GHz रेडियो तरंगों को 9 माइक्रोन ग्लास कोर में 1310nm इन्फ्रारेड लेज़र पल्स में बदलना।"
      },
      {
        id: "act-3",
        actNumber: 3,
        time: "01:20",
        seconds: 80,
        titleEn: "DNS Resolution: The Global Phonebook",
        titleHi: "DNS रेज़ोल्यूशन: इंटरनेट की ग्लोबल फोनबुक",
        descEn: "RFC 1035 iterative query: Stub Resolver to Root (.), .com TLD, and Authoritative servers in <15ms.",
        descHi: "RFC 1035 डीएनएस क्वेरी: स्टब रिज़ॉल्वर से रूट (.), TLD और अथॉरिटेटिव सर्वर्स तक 15ms में सफर।"
      },
      {
        id: "act-4",
        actNumber: 4,
        time: "02:00",
        seconds: 120,
        titleEn: "Packetization: TCP/IP & 1,500-Byte Slicing",
        titleHi: "पैकेटाइजेशन: TCP/IP और 1,500 बाइट के टुकड़े",
        descEn: "Operating system fragmentation, IPv4 packet headers, and TCP sequence numbers.",
        descHi: "ऑपरेटिंग सिस्टम द्वारा डेटा विखंडन, IPv4 हेडर और TCP सीक्वेंस नंबर्स।"
      },
      {
        id: "act-5",
        actNumber: 5,
        time: "02:40",
        seconds: 160,
        titleEn: "BGP Routing: 100,000+ Autonomous Systems",
        titleHi: "BGP राउटिंग: 100,000+ ऑटोनॉमस सिस्टम्स",
        descEn: "Border Gateway Protocol (BGP-4) peering across Tier-1 carriers and NIXI IXP exchange.",
        descHi: "बॉर्डर गेटवे प्रोटोकॉल (BGP-4) द्वारा टीयर-1 कैरियर्स और NIXI इंटरनेट एक्सचेंज के बीच रास्ता चुनना।"
      },
      {
        id: "act-6",
        actNumber: 6,
        time: "03:20",
        seconds: 200,
        titleEn: "Subsea Photonic Highways: Ocean Trench Cables",
        titleHi: "सबमरीन केबल्स: समुद्र के तल पर बिछा कांच का जाल",
        descEn: "99% of global traffic through submarine cables using Total Internal Reflection at 204.2 km/ms.",
        descHi: "टोटल इंटरनल रिफ्लेक्शन और 204.2 किमी/मिलीसेकंड की गति से समुद्र में 99% डेटा का प्रवाह।"
      },
      {
        id: "act-7",
        actNumber: 7,
        time: "04:05",
        seconds: 245,
        titleEn: "Inside Data Center Alley: Ashburn, Virginia",
        titleHi: "डेटा सेंटर एली: वर्जीनिया का 42U सर्वर रैक",
        descEn: "42U rack architecture, Top-of-Rack 100GbE fiber switching, and TLS 1.3 cryptography.",
        descHi: "42U सर्वर रैक आर्किटेक्चर, टॉप-ऑफ-रैक 100GbE स्विचिंग और TLS 1.3 एन्क्रिप्शन।"
      },
      {
        id: "act-8",
        actNumber: 8,
        time: "04:50",
        seconds: 290,
        titleEn: "The Return Path: TCP Reassembly & Playback",
        titleHi: "वापसी का सफर: TCP री-असेंबली और 4K प्लेबैक",
        descEn: "Reverse optical traversal and TCP buffer reassembly delivering smooth 4K playback.",
        descHi: "रिवर्स ऑप्टिकल रूट और टीसीपी बफर री-असेंबली द्वारा स्मूथ 4K वीडियो प्लेबैक।"
      },
      {
        id: "act-9",
        actNumber: 9,
        time: "05:30",
        seconds: 330,
        titleEn: "The Engineering Reality: Sand, Steel & Fiber",
        titleHi: "असली इंजीनियरिंग सच: रेत, स्टील और ग्लास",
        descEn: "The Internet is humanity's largest physical machine, not an ethereal cloud.",
        descHi: "इंटरनेट कोई काल्पनिक बादल नहीं, बल्कि इंसानी इतिहास की सबसे विशाल भौतिक मशीन है।"
      },
      {
        id: "act-10",
        actNumber: 10,
        time: "06:05",
        seconds: 365,
        titleEn: "Brand Outro & Next Episode Teaser",
        titleHi: "RTechLab आउट्रो एवं अगला एपिसोड",
        descEn: "Official RTechLab conclusion and teaser for Episode 02: What is an IP Address?",
        descHi: "आधिकारिक निष्कर्ष और एपिसोड 02 का टीज़र: आईपी एड्रेस क्या है और सबनेटिंग कैसे काम करती है?"
      }
    ],
    transcripts: {
      en: [
        {
          act: 1,
          speaker: "Narrator",
          text: "You tap a screen in Mumbai, and a high-definition 4K video streams instantly. In our network model, tap to playback takes an illustrative round trip of 175 milliseconds, approaching the theoretical optical floor of 131.4 milliseconds. But the server storing that video is physically located in Virginia, United States—over 13,000 kilometers away!"
        },
        {
          act: 2,
          speaker: "Narrator",
          text: "Your smartphone doesn't connect to the global Internet directly. It transmits radio waves to your Wi-Fi router, which forwards them to an Optical Network Terminal. Here, electrical pulses become pulses of invisible laser light fired down a glass fiber thinner than a human hair."
        },
        {
          act: 3,
          speaker: "Narrator",
          text: "Through recursive DNS, your computer finds the server's IP address in under 15 milliseconds. It queries root servers, top-level domain registries, and authoritative name servers until it receives the exact IP destination."
        },
        {
          act: 4,
          speaker: "Narrator",
          text: "Your operating system cannot send the entire video request at once. It slices the data into 1,500-byte packets under the TCP/IP protocol. Each packet receives a header containing source, destination, and sequence numbers."
        },
        {
          act: 5,
          speaker: "Narrator",
          text: "Next comes BGP—the Border Gateway Protocol. The Internet is not a single network; it is an interconnected mesh of over 100,000 Autonomous Systems. BGP routers analyze path metrics to route your packets through carrier peering points."
        },
        {
          act: 6,
          speaker: "Narrator",
          text: "Under deep ocean trenches, 99% of global traffic travels through subsea glass cables using Total Internal Reflection. Inside these armored cables, light travels at approximately 204,200 kilometers per second, guided across thousands of kilometers of ocean floor."
        },
        {
          act: 7,
          speaker: "Narrator",
          text: "Your packet arrives in Ashburn, Virginia—Data Center Alley. High-speed Top-of-Rack switches route it into enterprise servers. In milliseconds, solid-state drives retrieve the video data and negotiate cryptographic TLS session keys."
        },
        {
          act: 8,
          speaker: "Narrator",
          text: "The server fires millions of packets back along the reverse optical path. Your phone's TCP reassembly buffer puts out-of-order packets into sequence, unlocking instant, stutter-free 4K playback right at 175 milliseconds."
        },
        {
          act: 9,
          speaker: "Narrator",
          text: "The Internet is not magic, and it is not an invisible cloud. It is a physical machine made of sand melted into glass, steel cables resting in ocean trenches, and millions of computers communicating in universal mathematical harmony."
        },
        {
          act: 10,
          speaker: "Narrator",
          text: "Master the systems powering our world. Subscribe to RTechLab for in-depth engineering breakdowns. Next up: What is an IP address and how does subnetting work? Learn, practice, and innovate with RTechLab."
        }
      ],
      hi: [
        {
          act: 1,
          speaker: "कथावाचक",
          text: "मुंबई में फोन पर एक टैप, और वर्जीनिया से 4K वीडियो लगभग 175 मिलीसेकंड के सिम्युलेटेड राउंड ट्रिप में स्क्रीन पर चलने लगा, जबकि ऑप्टिकल फ़ाइबर में इसका सैद्धांतिक न्यूनतम समय 131.4 मिलीसेकंड है! तेरह हज़ार किलोमीटर की यह दूरी पलक झपकने से भी कम समय में कैसे तय हुई?"
        },
        {
          act: 2,
          speaker: "कथावाचक",
          text: "आपका स्मार्टफोन सीधे इंटरनेट से नहीं जुड़ता। यह रेडियो तरंगें आपके वाई-फ़ाई राउटर को भेजता है। इसके बाद एक ऑप्टिकल टर्मिनल बिजली के सिग्नलों को इन्फ्रारेड लेज़र लाइट में बदलता है, और उन्हें बाल से भी पतले ग्लास फ़ाइबर में भेज देता है।"
        },
        {
          act: 3,
          speaker: "कथावाचक",
          text: "डीएनएस सिस्टम 15 मिलीसेकंड में सही आईपी एड्रेस ढूँढ लेता है। यह रूट सर्वर्स, टॉप-लेवल डोमेन रजिस्ट्रीज़ और अथॉरिटेटिव सर्वर्स से संपर्क करके सटीक आईपी पता खोज निकालता है।"
        },
        {
          act: 4,
          speaker: "कथावाचक",
          text: "ऑपरेटिंग सिस्टम डेटा को 1500-बाइट के छोटे-छोटे पैकेट्स में बाँटता है। टीसीपी/आईपी प्रोटोकॉल के तहत हर पैकेट को सोर्स, डेस्टिनेशन और सीक्वेंस नंबर का लेबल दिया जाता है।"
        },
        {
          act: 5,
          speaker: "कथावाचक",
          text: "इसके बाद बीजीपी प्रोटोकॉल काम करता है। इंटरनेट कोई एक नेटवर्क नहीं, बल्कि एक लाख से अधिक स्वतंत्र नेटवर्क्स का जाल है। बीजीपी राउटर्स सबसे सुरक्षित और तेज़ रास्ता चुनते हैं।"
        },
        {
          act: 6,
          speaker: "कथावाचक",
          text: "इंटरनेट बादलों से नहीं, बल्कि समुद्र के तल पर बिछी हज़ारों किलोमीटर लंबी फ़ाइबर-ऑप्टिक केबल्स से चलता है। टोटल इंटरनल रिफ्लेक्शन की मदद से प्रकाश लगभग 204,200 किमी प्रति सेकंड की गति से समुद्र पार करता है।"
        },
        {
          act: 7,
          speaker: "कथावाचक",
          text: "पैकेट्स अमेरिका के वर्जीनिया स्थित विशाल डेटा सेंटर में पहुँचते हैं। टॉप-ऑफ-रैक स्विचेस डेटा को प्रोसेस करते हैं और एनवीएमई एसएसडी से 4K वीडियो डेटा को एनक्रिप्ट करके तैयार करते हैं।"
        },
        {
          act: 8,
          speaker: "कथावाचक",
          text: "सर्वर उसी ऑप्टिकल रास्ते से वीडियो पैकेट्स वापस भेजता है। आपके फोन का टीसीपी बफर आगे-पीछे आए पैकेट्स को सही क्रम में लगाता है, और 175 मिलीसेकंड में 4K वीडियो शुरू हो जाता है।"
        },
        {
          act: 9,
          speaker: "कथावाचक",
          text: "इंटरनेट कोई जादुई बादल नहीं है। यह रेत से बने कांच, समुद्र में बिछी स्टील केबल्स और कंप्यूटरों का बनाया दुनिया का सबसे बड़ा भौतिक तंत्र है। यह इंसानी इतिहास का सबसे बड़ा इंजीनियरिंग चमत्कार है।"
        },
        {
          act: 10,
          speaker: "कथावाचक",
          text: "तकनीक को गहराई से समझें। RTechLab को सब्सक्राइब करें। अगले एपिसोड में जानिए: आईपी एड्रेस क्या है और सबनेटिंग कैसे काम करती है? RTechLab के साथ सीखें, अभ्यास करें और नवाचार करें।"
        }
      ]
    },
    connectedTutorialId: "what-is-an-ip-address",
    connectedTools: [
      {
        name: "Live DNS Lookup Simulator",
        path: "/tools/dns-lookup",
        descEn: "Inspect iterative and recursive DNS resolution steps across Root, TLD, and Authoritative servers.",
        descHi: "रूट, TLD और अथॉरिटेटिव सर्वर्स के बीच रिकर्सिव DNS क्वेरीज़ का लाइव विश्लेषण करें।"
      },
      {
        name: "IP Address & CIDR Inspector",
        path: "/tools/ip-address-info",
        descEn: "Examine IPv4 packet headers, subnet masks, default gateways, and network classes.",
        descHi: "IPv4 पैकेट हेडर, सबनेट मास्क, डिफ़ॉल्ट गेटवे और नेटवर्क श्रेणियों का विश्लेषण करें।"
      },
      {
        name: "Visual IPv4 Subnet Calculator",
        path: "/tools/subnet-calculator",
        descEn: "Calculate usable host ranges, broadcast addresses, and CIDR prefix boundaries.",
        descHi: "सबनेट सीमाएं, ब्रॉडकास्ट एड्रेस और यूज़ेबल होस्ट रेंज की त्वरित गणना करें।"
      }
    ],
    collaboration: {
      partnerName: "IANT Computer Education, Palanpur",
      partnerUrl: "https://www.iantindia.com",
      roleEn: "Academic & Hands-on Lab Training Partner",
      roleHi: "शैक्षणिक एवं हैंड्स-ऑन लैब ट्रेनिंग पार्टनर"
    }
  }
];
