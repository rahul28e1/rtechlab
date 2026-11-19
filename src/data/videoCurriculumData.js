/**
 * RTechLab Video & Social Media Curriculum Registry
 * Master dataset for YouTube Long-Form Masterclasses, YouTube Shorts, and Instagram Reels
 */

export const YOUTUBE_MASTERCLASSES = [
  {
    id: 'how-the-internet-works',
    episode: 1,
    category: 'Networking & Infrastructure',
    duration: '6:21',
    status: 'published',
    publishedDate: '2026-11-16',
    title: {
      en: 'How Does the Internet Actually Work? (In 175 Milliseconds)',
      hi: 'इंटरनेट असल में कैसे काम करता है? (175 मिलीसेकंड में 13,000 km)'
    },
    subtitle: {
      en: 'From Smartphone Tap to Cloud Server: The True Physical Story of the Global Web',
      hi: 'स्मार्टफोन टैप से क्लाउड सर्वर तक: इंटरनेट की सच्ची भौतिक कहानी'
    },
    summary: {
      en: 'Documentary explainer tracing how a tap in Mumbai travels across oceans through 1.4 million km of subsea optical fiber cables to a cloud data center in Virginia, returning 4K video in 175 milliseconds.',
      hi: 'मुंबई में एक टैप समुद्र की गहराइयों में बिछी 14 लाख किलोमीटर फाइबर केबल्स से होता हुआ वर्जीनिया के क्लाउड सर्वर तक जाता है और 175 मिलीसेकंड में 4K वीडियो वापस लाता है।'
    },
    links: {
      en: {
        youtubeId: 'lFED1KvbnRk',
        url: 'https://youtu.be/lFED1KvbnRk',
        status: 'published'
      },
      hi: {
        youtubeId: 'WoItOExOdtM',
        url: 'https://youtu.be/WoItOExOdtM',
        status: 'published'
      }
    },
    tags: ['Subsea Cables', 'Latency', 'DNS', 'Cloud', 'Fiber Optics']
  },
  {
    id: 'underwater-internet-cables',
    episode: 2,
    category: 'Subsea Infrastructure',
    duration: '7:45',
    status: 'published',
    publishedDate: '2026-11-19',
    title: {
      en: 'Underwater Internet Cables: The 1.4 Million KM Deep Sea Highway',
      hi: 'समुद्र के नीचे इंटरनेट केबल्स: 14 लाख किलोमीटर का सबमरीन जाल'
    },
    subtitle: {
      en: 'How 99% of All Global Internet Traffic Crosses the Ocean Floor at 5,000m Depth',
      hi: 'दुनिया का 99% इंटरनेट समुद्र की तलहटी से कैसे गुजरता है?'
    },
    summary: {
      en: 'Deep-sea cable routes, landing stations, underwater repeaters with 10,000V DC power feeds, and the specialized cable repair ships that keep humanity connected.',
      hi: 'गहरे समुद्र में बिछी केबल्स, लैंडिंग स्टेशन, 10,000V DC पावर और केबल रिपेयर जहाजों की अद्भुत इंजीनियरिंग।'
    },
    links: {
      en: {
        youtubeId: 'lhAv-MEQecw',
        url: 'https://youtu.be/lhAv-MEQecw',
        status: 'published'
      },
      hi: {
        youtubeId: 'O2nxc7yzuS4',
        url: 'https://youtu.be/O2nxc7yzuS4',
        status: 'published'
      }
    },
    tags: ['Submarine Cables', 'Repeaters', 'Cable Ships', 'DWDM', 'Landing Stations']
  },
  {
    id: 'dns-how-domain-names-resolve',
    episode: 3,
    category: 'Protocols & DNS',
    duration: '6:15',
    status: 'scheduled',
    scheduledDate: '2026-11-24',
    scheduledTime: '18:00 IST',
    title: {
      en: 'DNS Architecture: How Domain Names Resolve Across 13 Root Servers',
      hi: 'DNS आर्किटेक्चर: 13 रूट सर्वर्स और एनीकास्ट राउटिंग की पूरी कार्यप्रणाली'
    },
    subtitle: {
      en: 'What Happens in the 20 Milliseconds Between Typing a URL and Getting an IP',
      hi: 'URL टाइप करने और IP एड्रेस मिलने के बीच के 20 मिलीसेकंड का सच'
    },
    summary: {
      en: 'Recursive resolvers, root nameservers, TLD authorities, authoritative zones, TTL caching hierarchy, and RFC 1035 packet trace visualization.',
      hi: 'रिकर्सिव रिज़ॉल्वर्स, रूट नेमसर्वर्स, TLD ऑथोरिटी और DNS कैशिंग की विस्तृत कार्यप्रणाली।'
    },
    links: {
      en: { status: 'scheduled', scheduledDate: '2026-11-24' },
      hi: { status: 'scheduled', scheduledDate: '2026-11-24' }
    },
    tags: ['DNS', 'Root Servers', 'Anycast', 'TTL', 'Networking']
  },
  {
    id: 'data-packets-how-video-travels',
    episode: 4,
    category: 'Networking Protocols',
    duration: '7:10',
    status: 'scheduled',
    scheduledDate: '2026-11-27',
    scheduledTime: '18:00 IST',
    title: {
      en: 'Data Packets & Streaming: TCP vs UDP (Why Video Buffering Happens)',
      hi: 'डेटा पैकेट्स और स्ट्रीमिंग: TCP vs UDP और वीडियो बफरिंग का असली कारण'
    },
    subtitle: {
      en: 'Sliding Windows, Congestion Control, and Packet Retransmission Explained',
      hi: 'स्लाइडिंग विंडो, कंजेशन कंट्रोल और पैकेट रीट्रांसमिशन का सच'
    },
    summary: {
      en: 'Detailed packet walkthrough showing why live sports use UDP while Netflix uses TCP, how packet loss triggers window shrinking, and how QUIC/HTTP3 changes the rules.',
      hi: 'लाइव गेमिंग UDP और यूट्यूब TCP क्यों इस्तेमाल करता है, और एक पैकेट ड्रॉप होने पर क्या असर होता है।'
    },
    links: {
      en: { status: 'scheduled', scheduledDate: '2026-11-27' },
      hi: { status: 'scheduled', scheduledDate: '2026-11-27' }
    },
    tags: ['TCP', 'UDP', 'QUIC', 'Packet Loss', 'Streaming']
  },
  {
    id: 'bgp-how-the-internet-finds-its-route',
    episode: 5,
    category: 'Routing & Architecture',
    duration: '8:00',
    status: 'scheduled',
    scheduledDate: '2026-11-30',
    scheduledTime: '18:00 IST',
    title: {
      en: 'BGP Routing: How The Internet Finds Its Path Across 100,000 ASNs',
      hi: 'BGP राउटिंग: इंटरनेट 1 लाख नेटवर्क्स में सही रास्ता कैसे खोजता है?'
    },
    subtitle: {
      en: 'Border Gateway Protocol, Autonomous Systems, and What Happens When Routes Break',
      hi: 'ऑटोनॉमस सिस्टम्स (ASN) और जब BGP क्रैश होता है तो क्या होता है'
    },
    summary: {
      en: 'Path vector routing, autonomous system numbers (ASNs), peering exchanges, and retrospective analysis of the global Facebook BGP withdrawal outage.',
      hi: 'पाथ वेक्टर राउटिंग, पीयरिंग और फेसबुक के ऐतिहासिक BGP आउटेज का तकनीकी विश्लेषण।'
    },
    links: {
      en: { status: 'scheduled', scheduledDate: '2026-11-30' },
      hi: { status: 'scheduled', scheduledDate: '2026-11-30' }
    },
    tags: ['BGP', 'ASN', 'Peering', 'Internet Architecture', 'CCNA']
  },
  {
    id: 'optical-fiber-how-light-carries-data',
    episode: 6,
    category: 'Hardware & Physics',
    duration: '6:45',
    status: 'scheduled',
    scheduledDate: '2026-12-02',
    scheduledTime: '18:00 IST',
    title: {
      en: 'Optical Fiber & DWDM: How 96 Colors of Light Carry 200 Tbps on One Strand',
      hi: 'ऑप्टिकल फाइबर और DWDM: कांच के एक तार से 96 रंग का प्रकाश और 200 Tbps डेटा'
    },
    subtitle: {
      en: 'Total Internal Reflection, Laser Transceivers, and Dense Wavelength Division Multiplexing',
      hi: 'पूर्ण आंतरिक परावर्तन, लेज़र ट्रांससीवर्स और DWDM तकनीक'
    },
    summary: {
      en: 'Physics of optical fibers, single-mode vs multi-mode core diameters, laser wavelength grid (C-band and L-band), and optical amplification with Erbium-Doped Fiber (EDFA).',
      hi: 'ग्लास फाइबर का भौतिक विज्ञान, सिंगल-मोड vs मल्टी-मोड और EDFA ऑप्टिकल एम्पलीफायर्स।'
    },
    links: {
      en: { status: 'scheduled', scheduledDate: '2026-12-02' },
      hi: { status: 'scheduled', scheduledDate: '2026-12-02' }
    },
    tags: ['Fiber Optics', 'DWDM', 'EDFA', 'Hardware', 'Physics']
  },
  {
    id: 'data-centers-where-your-favourite-video-lives',
    episode: 7,
    category: 'Cloud Infrastructure',
    duration: '7:30',
    status: 'scheduled',
    scheduledDate: '2026-12-04',
    scheduledTime: '18:00 IST',
    title: {
      en: 'Inside Cloud Data Centers: Power Grids, Server Racks & Hot-Cold Aisles',
      hi: 'क्लाउड डेटा सेंटर के अंदर: सर्वर रैक, हॉट-कोल्ड आइल और बैकअप जनरेटर्स'
    },
    subtitle: {
      en: 'Tier IV Redundancy, Dual Power Feeds, PUE Metrics, and Flywheel UPS Systems',
      hi: 'टियर 4 रिडंडेंसी, फ्लाईव्हील UPS और सर्वर कूलिंग का वैज्ञानिक फॉर्मूला'
    },
    summary: {
      en: 'Walkthrough inside hyper-scale cloud facilities: 42U racks, top-of-rack leaf-spine networking, CRAC cooling chillers, and zero-downtime N+2 power architecture.',
      hi: 'हाइपर-स्केल क्लाउड सुविधाओं, 42U सर्वर रैक्स और लीफ-स्पाइन नेटवर्किंग की अंदरूनी संरचना।'
    },
    links: {
      en: { status: 'scheduled', scheduledDate: '2026-12-04' },
      hi: { status: 'scheduled', scheduledDate: '2026-12-04' }
    },
    tags: ['Data Center', 'Cloud', 'Leaf-Spine', 'Cooling', 'UPS']
  }
];

export const INSTAGRAM_REELS_AND_SHORTS = [
  {
    id: 'ep01-short-01',
    episode: 1,
    title: {
      en: 'The 13,000 km Underwater Wire (Subsea Cables Explained)',
      hi: 'इंटरनेट समुद्र के नीचे है (बादल नहीं): 13,000 km का सच'
    },
    category: 'Subsea Infrastructure',
    duration: '49s',
    status: 'published',
    publishedDate: '2026-11-17',
    platforms: {
      instagramEn: 'https://www.instagram.com/reel/DCShort01EN/',
      instagramHi: 'https://www.instagram.com/reel/DCShort01HI/',
      youtubeShortEn: 'https://youtube.com/shorts/DCShort01EN',
      youtubeShortHi: 'https://youtube.com/shorts/DCShort01HI'
    },
    highlight: '99% of international data flows through thin glass tubes in the ocean, not through satellites.'
  },
  {
    id: 'ep02-short-01',
    episode: 2,
    title: {
      en: 'How Subsea Cables Connect Our World 🌊 (17mm Thickness Secret)',
      hi: 'समुद्र के नीचे इंटरनेट कैसे चलता है? 🌊 (17mm मोटाई का रहस्य)'
    },
    category: 'Subsea Infrastructure',
    duration: '55s',
    status: 'published',
    publishedDate: '2026-11-19',
    platforms: {
      instagramEn: 'https://www.instagram.com/rtechlabofficial/reel/Dfq4C9zo_WV/',
      instagramHi: 'https://www.instagram.com/rtechlabofficial/reel/Dfq43lrotyg/',
      youtubeShortEn: 'https://youtube.com/shorts/fy_dUabD4M8',
      youtubeShortHi: 'https://youtube.com/shorts/81NXj_KhaM4'
    },
    highlight: 'A deep sea submarine cable carrying 200 Tbps is only as thick as a standard garden hose (17mm)!'
  },
  {
    id: 'ep01-short-02',
    episode: 1,
    title: {
      en: 'Why 99% of Internet Travels Under the Ocean, Not Satellites',
      hi: '99% इंटरनेट सैटेलाइट से क्यों नहीं चलता? (स्पीड vs लेटेंसी)'
    },
    category: 'Networking & Space',
    duration: '52s',
    status: 'scheduled',
    scheduledDate: '2026-11-20',
    highlight: 'Fiber light speed through glass vs radio signals through 36,000km orbit: the physics of 600ms latency.'
  },
  {
    id: 'ep02-short-02',
    episode: 2,
    title: {
      en: 'How Cable Ships Fix Broken Internet at 5,000 Meters Depth',
      hi: '5,000 मीटर गहरे समुद्र में टूटी केबल कैसे जुड़ती है? (केबल रिपेयर शिप्स)'
    },
    category: 'Hardware & Marine Tech',
    duration: '58s',
    status: 'scheduled',
    scheduledDate: '2026-11-22',
    highlight: 'Underwater grapnels and ROV robots slicing and splicing microscopic glass fibers in mid-ocean.'
  },
  {
    id: 'ep03-short-01',
    episode: 3,
    title: {
      en: 'Why There Are Only 13 Root DNS Server Addresses Worldwide',
      hi: 'पूरी दुनिया में केवल 13 रूट DNS एड्रेस क्यों हैं? (A to M Root Servers)'
    },
    category: 'DNS & Protocols',
    duration: '54s',
    status: 'scheduled',
    scheduledDate: '2026-11-24',
    highlight: 'The 512-byte UDP packet limit that shaped the entire architecture of global DNS root servers.'
  },
  {
    id: 'ep03-short-02',
    episode: 3,
    title: {
      en: 'Why 1.1.1.1 and 8.8.8.8 Are So Fast (Anycast Routing Explained)',
      hi: '1.1.1.1 और 8.8.8.8 इतने तेज़ क्यों हैं? (एनीकास्ट राउटिंग का जादू)'
    },
    category: 'DNS & Anycast',
    duration: '50s',
    status: 'scheduled',
    scheduledDate: '2026-11-26',
    highlight: 'Hundreds of global servers sharing ONE IP address using BGP shortest path routing.'
  },
  {
    id: 'ep04-short-01',
    episode: 4,
    title: {
      en: 'What Happens When a Single Packet Drops During Video Playback?',
      hi: 'वीडियो चलते समय एक पैकेट ड्रॉप हो जाए तो क्या होता है?'
    },
    category: 'Networking & Protocols',
    duration: '48s',
    status: 'scheduled',
    scheduledDate: '2026-11-27',
    highlight: 'TCP Fast Retransmit, SACK acknowledgments, and client video buffering mechanics.'
  },
  {
    id: 'ep04-short-02',
    episode: 4,
    title: {
      en: 'TCP vs UDP: Why YouTube Streams Use TCP But Gaming Uses UDP',
      hi: 'TCP vs UDP: यूट्यूब TCP और गेमिंग UDP क्यों इस्तेमाल करता है?'
    },
    category: 'Networking Protocols',
    duration: '56s',
    status: 'scheduled',
    scheduledDate: '2026-11-29',
    highlight: 'Reliability with latency penalty vs real-time speed where dropped packets are ignored.'
  },
  {
    id: 'ep05-short-01',
    episode: 5,
    title: {
      en: 'What Happens When BGP Goes Down? (The Day Facebook Disappeared)',
      hi: 'जब BGP फेल हुआ: वो दिन जब फेसबुक गायब हो गया था!'
    },
    category: 'Routing & Security',
    duration: '59s',
    status: 'scheduled',
    scheduledDate: '2026-12-01',
    highlight: 'How a routine maintenance command withdrew BGP routes and severed global access to Facebook DNS.'
  },
  {
    id: 'ep06-short-01',
    episode: 6,
    title: {
      en: 'Why The Speed of Light on Earth is Slower Than in Space! (Fiber Optics)',
      hi: 'कांच में प्रकाश की गति अंतरिक्ष से धीमी क्यों हो जाती है? (रिफ्रैक्टिव इंडेक्स)'
    },
    category: 'Physics & Hardware',
    duration: '51s',
    status: 'scheduled',
    scheduledDate: '2026-12-03',
    highlight: 'Refractive index of silica glass (n ≈ 1.4682) slows light from 300,000 km/s to ~204,000 km/s.'
  },
  {
    id: 'ep07-short-01',
    episode: 7,
    title: {
      en: 'What Does a 42U Server Rack Look Like Inside a Data Center?',
      hi: '42U सर्वर रैक अंदर से कैसा दिखता है? (रैक यूनिट्स और लीफ स्विच)'
    },
    category: 'Cloud & Data Centers',
    duration: '55s',
    status: 'scheduled',
    scheduledDate: '2026-12-05',
    highlight: '1.75 inches per U, blade chassis, dual redundant PDUs, and dual 100G fiber uplink switches.'
  }
];
