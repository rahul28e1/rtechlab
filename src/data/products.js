// Storefront data. Set VITE_UPI_VPA / VITE_UPI_NAME / VITE_WHATSAPP in .env before launch.
export const UPI = {
  vpa: import.meta.env.VITE_UPI_VPA || 'rtechlab@upi',
  name: import.meta.env.VITE_UPI_NAME || 'RTechLab',
  whatsapp: import.meta.env.VITE_WHATSAPP_LINK || 'https://wa.me/message/FUIEEQDZLUKVK1',
  whatsappNumber: import.meta.env.VITE_WHATSAPP || '917646892094',
  configured: Boolean(import.meta.env.VITE_UPI_VPA),
};

export const MODULES = [
  {
    code: 'ccna-m1',
    number: '01',
    title: 'Network Fundamentals',
    tagline: 'OSI, TCP/IP, IP addressing, subnetting',
    taglineHi: 'OSI, TCP/IP, IP एड्रेसिंग, सबनेटिंग',
    price: 49,
    pages: 42,
    quizPath: '/quiz/ccna-m1',
    chapters: [
      { code: 'ch1', title: 'Network models & OSI', titleHi: 'नेटवर्क मॉडल और OSI' },
      { code: 'ch2', title: 'IP addressing & subnetting', titleHi: 'IP एड्रेसिंग और सबनेटिंग' },
      { code: 'ch3', title: 'Ports, protocols & the packet journey', titleHi: 'पोर्ट, प्रोटोकॉल और पैकेट का सफ़र' },
    ],
    bullets: [
      'OSI and TCP/IP — one story, two maps, with everyday examples',
      'IP address, mask, private vs public — 15 solved subnetting questions',
      'A packet’s journey: browser to cable, layer by layer',
      'Chapter practice set + 5 interview questions',
    ],
    bulletsHi: [
      'OSI और TCP/IP — एक कहानी, दो नक्शे, रोज़मर्रा के उदाहरण के साथ',
      'IP, मास्क, प्राइवेट vs पब्लिक — 15 हल किए सबनेटिंग सवाल',
      'पैकेट का सफर: ब्राउज़र से केबल तक, लेयर दर लेयर',
      'चैप्टर प्रैक्टिस सेट + 5 इंटरव्यू सवाल',
    ],
  },
  {
    code: 'ccna-m2',
    number: '02',
    title: 'Switching & VLANs',
    tagline: 'MAC table, VLAN, trunking, STP',
    taglineHi: 'MAC टेबल, VLAN, ट्रंकिंग, STP',
    price: 49,
    pages: 38,
    quizPath: '/quiz/ccna-m2',
    chapters: [
      { code: 'ch1', title: 'How a switch learns', titleHi: 'स्विच कैसे सीखता है' },
      { code: 'ch2', title: 'VLANs & trunking', titleHi: 'VLAN और ट्रंकिंग' },
      { code: 'ch3', title: 'STP & port security', titleHi: 'STP और पोर्ट सिक्योरिटी' },
    ],
    bullets: [
      'How a switch learns — MAC table, flood, forward',
      'VLAN and trunking: ten networks on one cable',
      'What STP protects you from, and how a root bridge is chosen',
      'Packet Tracer lab steps + troubleshooting checklist',
    ],
    bulletsHi: [
      'स्विच कैसे सीखता है — MAC टेबल, फ्लड, फॉरवर्ड',
      'VLAN और ट्रंक: एक केबल में दस नेटवर्क',
      'STP किस चीज़ से बचाता है, रूट ब्रिज कैसे चुना जाता है',
      'पैकेट ट्रेसर लैब स्टेप्स + ट्रबलशूटिंग चेकलिस्ट',
    ],
  },
  {
    code: 'ccna-m3',
    number: '03',
    title: 'Routing & OSPF',
    tagline: 'Static routes, OSPF, path selection',
    taglineHi: 'स्टैटिक रूट, OSPF, पाथ सिलेक्शन',
    price: 49,
    pages: 46,
    quizPath: '/quiz/ccna-m3',
    chapters: [
      { code: 'ch1', title: 'Routing table basics', titleHi: 'राउटिंग टेबल की बुनियाद' },
      { code: 'ch2', title: 'Static routes & wildcards', titleHi: 'स्टैटिक रूट और वाइल्डकार्ड' },
      { code: 'ch3', title: 'OSPF fundamentals', titleHi: 'OSPF की बुनियाद' },
    ],
    bullets: [
      'The routing table: longest match, administrative distance, metric',
      'Static routes to OSPF — when to use which',
      'OSPF neighbours, DR/BDR, cost calculation',
      'Lab: a three-router topology + verification commands',
    ],
    bulletsHi: [
      'राउटिंग टेबल: सबसे लंबा मैच, AD, मेट्रिक',
      'स्टैटिक रूट से OSPF तक — कब क्या इस्तेमाल करें',
      'OSPF नेबर, DR/BDR, कॉस्ट कैलकुलेशन',
      'लैब: तीन-राउटर टोपोलॉजी + वेरिफिकेशन कमांड',
    ],
  },
];

export const BUNDLE = {
  code: 'ccna-bundle',
  price: 149,
  compareAt: 249,
  title: 'CCNA Complete Digital Bundle',
  titleHi: 'CCNA कम्प्लीट डिजिटल बंडल',
  tagline: 'Notes + interview prep + practice sets + roadmap',
  taglineHi: 'नोट्स + इंटरव्यू तैयारी + प्रैक्टिस सेट + रोडमैप',
  includes: [
    { label: 'All 3 modules (126 pages)', labelHi: 'तीनों मॉड्यूल (126 पेज)', value: '₹147 value' },
    { label: 'Interview question bank — 120 Q&A', labelHi: 'इंटरव्यू प्रश्न बैंक — 120 प्रश्न-उत्तर', value: '₹49 value' },
    { label: 'Practice sets — 180 questions with answers', labelHi: 'प्रैक्टिस सेट — 180 सवाल, जवाब के साथ', value: '₹49 value' },
    { label: '30-day study roadmap (printable)', labelHi: '30-दिन स्टडी रोडमैप (प्रिंट करने लायक)', value: 'included' },
    { label: 'Job & internship roadmap for freshers', labelHi: 'फ्रेशर के लिए जॉब और इंटर्नशिप रोडमैप', value: 'included' },
    { label: 'Lifetime access + free updates', labelHi: 'लाइफटाइम एक्सेस + फ्री अपडेट', value: 'included' },
  ],
};

export const SERVER_2025_BUNDLE = {
  code: 'server2025-bundle',
  price: 149,
  compareAt: 299,
  title: 'Windows Server 2025 Complete Career Accelerator Bundle',
  titleHi: 'विंडोज सर्वर 2025 कम्प्लीट करियर एक्सेलरेटर बंडल',
  tagline: 'Dual Master Guides + Lab Workbook + Top 50 MNC Interview Vault + Salary Blueprint',
  taglineHi: 'ड्यूल मास्टर गाइड्स + 12 लैब वर्कबुक + टॉप 50 MNC इंटरव्यू वॉल्ट + 2027 सैलरी ब्लूप्रिंट',
  includes: [
    { label: 'English Master Guide (60 pages)', labelHi: 'इंग्लिश मास्टर गाइड (60 पेज)', value: '₹99 value' },
    { label: 'Hindi Master Guide (60 pages)', labelHi: 'हिंदी मास्टर गाइड (60 पेज)', value: '₹99 value' },
    { label: 'Gujarati Master Guide (60 pages)', labelHi: 'ગુજરાતી માસ્ટર ગાઇડ (60 પેજ)', value: '₹99 value' },
    { label: '12 Hands-On Enterprise Labs Workbook (7 pages)', labelHi: '12 प्रैक्टिकल लैब वर्कबुक (7 पेज)', value: '₹49 value' },
    { label: 'Top 50 MNC Interview Vault (10 pages)', labelHi: 'टॉप 50 MNC इंटरव्यू वॉल्ट (10 पेज)', value: '₹49 value' },
    { label: '2027 System Admin Salary & Career Blueprint (3 pages)', labelHi: '2027 सैलरी एवं करियर ब्लूप्रिंट (3 पेज)', value: '₹49 value' },
    { label: 'All-in-One ZIP Archive Download (16.4 MB)', labelHi: 'ऑल-इन-वन ज़िप आर्काइવ डाउनलोड', value: 'included' },
    { label: '24x7 WhatsApp Student Mentorship Helpline', labelHi: '24x7 व्हाट्सएप छात्र मेंटरशिप हेल्पलाइन', value: 'included' },
  ],
};

export const DELIVERY_STEPS = [
  {
    title: 'Pay by UPI',
    titleHi: 'UPI से पेमेंट करो',
    body: 'Scan the QR or copy the UPI ID. The amount is pre-filled and no account is needed.',
    bodyHi: 'QR स्कैन करो या UPI आईडी कॉपी करो। रकम पहले से भरी है, कोई अकाउंट नहीं बनाना।',
  },
  {
    title: 'Send the reference',
    titleHi: 'रेफरेंस भेजो',
    body: 'After paying, send the UTR with your name and email in one WhatsApp tap.',
    bodyHi: 'पेमेंट के बाद नाम और ईमेल के साथ UTR एक WhatsApp टैप में भेज दो।',
  },
  {
    title: 'Get the files',
    titleHi: 'फाइल मिल जाएगी',
    body: 'Once verified the PDF arrives by email or WhatsApp within 30 minutes, watermarked with your name.',
    bodyHi: 'वेरिफाई होते ही PDF 30 मिनट में ईमेल या WhatsApp पर, तुम्हारे नाम के वॉटरमार्क के साथ।',
  },
];

export const NOTES_FAQ = [
  {
    q: 'Are the notes in Hindi or English?',
    qHi: 'नोट्स हिंदी में हैं या अंग्रेज़ी में?',
    a: 'Both. Every module ships as two PDFs — a full English edition and a Hindi edition with English technical terms kept as-is, because that is how exams and interviews use them.',
    aHi: 'दोनों में। हर मॉड्यूल की दो PDF हैं — पूरी अंग्रेज़ी एडिशन और हिंदी एडिशन, जिसमें तकनीकी शब्द अंग्रेज़ी में ही रहते हैं (एग्जाम और इंटरव्यू में वही चलते हैं)।',
  },
  {
    q: 'Does the PDF open on a phone?',
    qHi: 'PDF फोन पर खुलती है?',
    a: 'Yes. It is an A4 layout with a mobile-readable body size, and it prints cleanly if you like writing on paper.',
    aHi: 'हाँ। A4 लेआउट है, फोन पर पढ़ने लायक फॉन्ट साइज़, और प्रिंट भी साफ आती है।',
  },
  {
    q: 'Does it cover CCNA 200-301?',
    qHi: 'क्या यह CCNA 200-301 कवर करती है?',
    a: 'Modules 1–3 cover the core of the blueprint: fundamentals, switching and routing. The bundle adds practice sets that follow the exam pattern.',
    aHi: 'मॉड्यूल 1–3 सिलेबस का कोर कवर करते हैं: फंडामेंटल्स, स्विचिंग और राउटिंग। बंडल में एग्जाम पैटर्न वाले प्रैक्टिस सेट भी हैं।',
  },
  {
    q: 'Is there a refund?',
    qHi: 'रिफंड मिलता है?',
    a: 'It is a digital product, so read the free sample first. No refund after download, but a missing or broken file is replaced immediately.',
    aHi: 'यह डिजिटल प्रोडक्ट है, इसलिए पहले फ्री सैंपल पढ़ो। डाउनलोड के बाद रिफंड नहीं, पर फाइल गायब या खराब हो तो तुरंत बदल दी जाएगी।',
  },
  {
    q: 'What does the QR code in the notes do?',
    qHi: 'नोट्स में QR कोड क्या करता है?',
    a: 'Every chapter ends with one. Scan it and that chapter’s 10-question test opens on this site — with a score card you can share.',
    aHi: 'हर चैप्टर के अंत में एक QR है। स्कैन करो और उसी चैप्टर का 10-सवालों वाला टेस्ट इसी साइट पर खुल जाता है — शेयर करने लायक स्कोर कार्ड के साथ।',
  },
];

// Five free pages, readable in the browser. The paid modules continue from here.
export const SAMPLE_PAGES = [
  {
    title: 'What a network really is',
    blocks: [
      {
        type: 'p',
        text: 'Two laptops, one cable, and a question: “who are you?” That is already a network. Computer networking rests on three things — devices (laptop, switch, router), a medium (copper, fibre, Wi-Fi) and a protocol (the rule for talking).',
      },
      {
        type: 'p',
        text: 'Think of posting a letter. The letter is data, the envelope is a packet, the address is an IP address, and the post office is a router. Write only a name and no city, and the letter never arrives. The same is true of a packet without a destination address.',
      },
      { type: 'h', text: 'Three things every network has' },
      {
        type: 'ul',
        items: [
          'Address — every device has an identity (IP, and a MAC inside the LAN).',
          'Path — who carries the packet: a switch inside the LAN, a router between LANs.',
          'Rule — both ends speak the same protocol, or the data is noise.',
        ],
      },
      {
        type: 'note',
        text: 'Exam point: “network” does not mean the internet. Two laptops on one cable are a network too — that is a LAN.',
      },
    ],
    hi: {
      title: 'नेटवर्क असल में क्या है',
      blocks: [
        {
          type: 'p',
          text: 'दो लैपटॉप, एक केबल, और एक सवाल: “तुम कौन हो?” बस इतना ही नेटवर्क है। नेटवर्किंग तीन चीज़ों पर टिकी है — डिवाइस (लैपटॉप, स्विच, राउटर), माध्यम (केबल, फाइबर, Wi-Fi) और प्रोटोकॉल (बात करने का नियम)।',
        },
        {
          type: 'p',
          text: 'चिट्ठी भेजने जैसा सोचो। चिट्ठी = डेटा, लिफाफा = पैकेट, पता = IP एड्रेस, डाकघर = राउटर। पते पर सिर्फ नाम लिखो और शहर नहीं, चिट्ठी कभी नहीं पहुँचेगी। पैकेट के साथ भी वही बात है।',
        },
        { type: 'h', text: 'हर नेटवर्क में तीन चीज़ें' },
        {
          type: 'ul',
          items: [
            'पता — हर डिवाइस की पहचान (IP, और LAN के अंदर MAC)।',
            'रास्ता — पैकेट कौन ले जाएगा: LAN में स्विच, LAN के बाहर राउटर।',
            'नियम — दोनों तरफ एक ही प्रोटोकॉल, वरना डेटा शोर बन जाता है।',
          ],
        },
        {
          type: 'note',
          text: 'एग्जाम पॉइंट: “नेटवर्क” का मतलब सिर्फ इंटरनेट नहीं। दो लैपटॉप एक केबल से जोड़ना भी नेटवर्क है — उसे LAN कहते हैं।',
        },
      ],
    },
  },
  {
    title: 'OSI and TCP/IP: one story, two maps',
    blocks: [
      {
        type: 'p',
        text: 'OSI has 7 layers — a map for studying. TCP/IP has 4 — a map for running. Both say the same thing: split the work so each layer does one job and talks only to the layer above and below.',
      },
      {
        type: 'ul',
        items: [
          'Layer 7 Application — browser, HTTP, DNS, DHCP, RDP.',
          'Layer 4 Transport — TCP (reliable) and UDP (fast). Port numbers live here.',
          'Layer 3 Network — IP addressing and routing. Routers work here.',
          'Layer 2 Data Link — MAC addresses, switches, VLANs, ARP.',
          'Layer 1 Physical — cable, fibre, Wi-Fi signal, voltage.',
        ],
      },
      {
        type: 'p',
        text: 'Encapsulation: a browser request becomes a TCP segment, then an IP packet, then an Ethernet frame, then bits on the wire. The receiver unwraps it in reverse. Memory hook: “Please Do Not Throw Sausage Pizza Away” (Layer 1 to 7).',
      },
      {
        type: 'note',
        text: 'Interview favourite: “which layer does a switch work at?” — Layer 2 (MAC). “A router?” — Layer 3 (IP). “A hub?” — Layer 1.',
      },
    ],
    hi: {
      title: 'OSI और TCP/IP: एक कहानी, दो नक्शे',
      blocks: [
        {
          type: 'p',
          text: 'OSI में 7 लेयर हैं — पढ़ने का नक्शा। TCP/IP में 4 — चलाने का नक्शा। दोनों का मतलब एक ही है: काम को लेयर में बाँटो, ताकि हर लेयर अपना काम करे और सिर्फ ऊपर-नीचे वाली लेयर से बात करे।',
        },
        {
          type: 'ul',
          items: [
            'लेयर 7 एप्लिकेशन — ब्राउज़र, HTTP, DNS, DHCP, RDP।',
            'लेयर 4 ट्रांसपोर्ट — TCP (भरोसा) और UDP (स्पीड)। पोर्ट नंबर यहीं होते हैं।',
            'लेयर 3 नेटवर्क — IP एड्रेस और राउटिंग। राउटर यहाँ काम करता है।',
            'लेयर 2 डेटा लिंक — MAC एड्रेस, स्विच, VLAN, ARP।',
            'लेयर 1 फिजिकल — केबल, फाइबर, Wi-Fi सिग्नल, वोल्टेज।',
          ],
        },
        {
          type: 'p',
          text: 'एनकैप्सुलेशन: ब्राउज़र की रिक्वेस्ट पहले TCP सेगमेंट बनती है, फिर IP पैकेट, फिर Ethernet फ्रेम, फिर केबल पर बिट्स। रिसीवर पर उल्टा होता है — डीकैप्सुलेशन।',
        },
        {
          type: 'note',
          text: 'इंटरव्यू में सबसे आम: “स्विच किस लेयर पर काम करता है?” — लेयर 2 (MAC)। “राउटर?” — लेयर 3 (IP)। “हब?” — लेयर 1।',
        },
      ],
    },
  },
  {
    title: 'IP addressing without fear',
    blocks: [
      {
        type: 'p',
        text: 'An IPv4 address is 32 bits, written as four octets: 192.168.1.20. Each octet is 0–255. It has two parts — network (which street) and host (which house). The mask decides where the split is.',
      },
      { type: 'h', text: 'Private ranges (home and office)' },
      {
        type: 'ul',
        items: [
          '10.0.0.0/8 — large offices and cloud VPCs.',
          '172.16.0.0/12 — 172.16 through 172.31.',
          '192.168.0.0/16 — the home router, 192.168.1.x.',
        ],
      },
      {
        type: 'p',
        text: 'A private IP is not routable on the internet. The router uses NAT to send your ten home devices out through one public IP — that is why the laptop stays 192.168.1.20 and google.com still opens.',
      },
      {
        type: 'code',
        text: 'Mask      CIDR   Usable hosts\n255.255.255.0    /24    254\n255.255.255.128  /25    126\n255.255.255.192  /26    62\n255.255.255.224  /27    30',
      },
    ],
    hi: {
      title: 'IP एड्रेस, बिना डर के',
      blocks: [
        {
          type: 'p',
          text: 'IPv4 एड्रेस 32 बिट का होता है, चार ऑक्टेट में लिखा जाता है: 192.168.1.20। हर ऑक्टेट 0–255। इसमें दो हिस्से हैं — नेटवर्क (कौन सी गली) और होस्ट (कौन सा घर)। मास्क तय करता है बँटवारा कहाँ है।',
        },
        { type: 'h', text: 'प्राइवेट रेंज (घर और ऑफिस)' },
        {
          type: 'ul',
          items: [
            '10.0.0.0/8 — बड़े ऑफिस और क्लाउड VPC।',
            '172.16.0.0/12 — 172.16 से 172.31 तक।',
            '192.168.0.0/16 — घर का राउटर, 192.168.1.x।',
          ],
        },
        {
          type: 'p',
          text: 'प्राइवेट IP इंटरनेट पर रूटेबल नहीं होता। राउटर NAT से घर के दस डिवाइस एक पब्लिक IP से बाहर भेजता है — इसलिए लैपटॉप 192.168.1.20 रहते हुए भी google.com खुल जाता है।',
        },
        {
          type: 'code',
          text: 'Mask      CIDR   Usable hosts\n255.255.255.0    /24    254\n255.255.255.128  /25    126\n255.255.255.192  /26    62\n255.255.255.224  /27    30',
        },
      ],
    },
  },
  {
    title: 'Subnetting: the 4-step formula',
    blocks: [
      {
        type: 'p',
        text: 'Subnetting feels scary only if you think in binary. Trick: subtract the last mask octet from 256 — the remainder is the block size. Subnets step by that size.',
      },
      { type: 'h', text: 'Example: 192.168.10.0/26' },
      {
        type: 'ul',
        items: [
          'Step 1 — Block size: 256 − 192 = 64.',
          'Step 2 — Subnets: .0, .64, .128, .192.',
          'Step 3 — Usable range: .1 to .62 in the first subnet.',
          'Step 4 — Broadcast: the last address of each subnet (.63).',
        ],
      },
      {
        type: 'p',
        text: 'Usable hosts = 2^host bits − 2. A /26 has 6 host bits, so 64 − 2 = 62. Two addresses are always reserved: network and broadcast.',
      },
      {
        type: 'note',
        text: 'Practice: what is the third subnet of 172.16.5.0/27? Block 32 → .0, .32, .64. Third = 172.16.5.64, usable .65–.94, broadcast .95.',
      },
    ],
    hi: {
      title: 'सबनेटिंग: 4 स्टेप फॉर्मूला',
      blocks: [
        {
          type: 'p',
          text: 'सबनेटिंग डरावनी सिर्फ तब लगती है जब बाइनरी में सोचो। ट्रिक: 256 में से मास्क का आखिरी ऑक्टेट घटाओ — बचा हुआ ब्लॉक साइज़ है। सबनेट उसी साइज़ के अंतराल पर बनते हैं।',
        },
        { type: 'h', text: 'उदाहरण: 192.168.10.0/26' },
        {
          type: 'ul',
          items: [
            'स्टेप 1 — ब्लॉक साइज़: 256 − 192 = 64।',
            'स्टेप 2 — सबनेट: .0, .64, .128, .192।',
            'स्टेप 3 — यूज़ेबल रेंज: पहले सबनेट में .1 से .62।',
            'स्टेप 4 — ब्रॉडकास्ट: हर सबनेट का आखिरी एड्रेस (.63)।',
          ],
        },
        {
          type: 'p',
          text: 'यूज़ेबल होस्ट = 2^होस्ट बिट्स − 2। /26 में 6 होस्ट बिट हैं, तो 64 − 2 = 62। दो एड्रेस हमेशा रिज़र्व रहते हैं: नेटवर्क और ब्रॉडकास्ट।',
        },
        {
          type: 'note',
          text: 'अभ्यास: 172.16.5.0/27 का तीसरा सबनेट क्या है? ब्लॉक 32 → .0, .32, .64। तीसरा = 172.16.5.64, यूज़ेबल .65–.94, ब्रॉडकास्ट .95।',
        },
      ],
    },
  },
  {
    title: 'Your first lab: verify in ten minutes',
    blocks: [
      {
        type: 'p',
        text: 'Theory stays half-learned until a command confirms it. Run these three on your own laptop — no simulator needed.',
      },
      {
        type: 'code',
        text: 'ipconfig        # Windows: IP, mask, gateway\nip addr         # Linux: same thing\ntracert 8.8.8.8 # every hop on the path',
      },
      {
        type: 'ul',
        items: [
          'Check your IP — 192.168.x.x or 10.x.x.x means you are on a private network.',
          'Note the gateway — usually 192.168.1.1 or similar.',
          'ping 8.8.8.8 — a reply means Layer 3 works.',
          'ping google.com — if the name resolves, DNS works too.',
        ],
      },
      {
        type: 'p',
        text: 'If the IP pings but the name does not, the problem is DNS. If the gateway pings but the internet does not, it is routing or NAT. That is the first split every troubleshooting interview starts with.',
      },
      {
        type: 'note',
        text: 'Chapter test: play the 10-question quiz that ships with this sample. The full module adds a test after every chapter, with a shareable score card.',
      },
    ],
    hi: {
      title: 'पहला लैब: 10 मिनट में वेरिफाई करो',
      blocks: [
        {
          type: 'p',
          text: 'थ्योरी तब तक आधी रहती है जब तक कमांड से कन्फर्म न हो। अपने लैपटॉप पर ये तीन चलाओ — सिम्युलेटर की ज़रूरत नहीं।',
        },
        {
          type: 'code',
          text: 'ipconfig        # Windows: IP, मास्क, गेटवे\nip addr         # Linux: वही चीज़\ntracert 8.8.8.8 # रास्ते का हर हॉप',
        },
        {
          type: 'ul',
          items: [
            'अपना IP देखो — 192.168.x.x या 10.x.x.x मतलब तुम प्राइवेट नेटवर्क पर हो।',
            'गेटवे नोट करो — आमतौर पर 192.168.1.1 जैसा।',
            'ping 8.8.8.8 — जवाब आया तो लेयर 3 ठीक है।',
            'ping google.com — नाम रिज़ॉल्व हुआ तो DNS भी ठीक है।',
          ],
        },
        {
          type: 'p',
          text: 'IP पिंग होता है पर नाम नहीं — प्रॉब्लम DNS में। गेटवे पिंग होता है पर इंटरनेट नहीं — राउटिंग या NAT में। यही पहला सवाल हर ट्रबलशूटिंग इंटरव्यू में आता है।',
        },
        {
          type: 'note',
          text: 'चैप्टर टेस्ट: इस सैंपल के साथ वाला 10-सवालों का क्विज़ खेलो। पूरे मॉड्यूल में हर चैप्टर के बाद टेस्ट और शेयर करने लायक स्कोर कार्ड है।',
        },
      ],
    },
  },
];
