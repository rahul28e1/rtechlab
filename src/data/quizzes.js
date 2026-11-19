// Each chapter owns a question pool. A chapter test draws from its own pool,
// a module test draws from every chapter — both shuffle questions and options.

const q = (question, options, answer, why) => ({ q: question, options, answer, why });

export const QUIZZES = {
  'ccna-m1': {
    title: 'Network Fundamentals',
    subtitle: 'OSI, addressing, subnetting',
    minutes: 5,
    chapters: [
      {
        code: 'ch1',
        title: 'Network models & OSI',
        questions: [
          q(
            'IP address kaunsi OSI layer par hota hai?',
            ['Layer 2', 'Layer 3', 'Layer 4', 'Layer 7'],
            1,
            'IP Layer 3 (Network) ka protocol hai. Layer 2 par MAC hota hai, Layer 4 par port number.',
          ),
          q(
            'Switch primarily kaunsi layer par kaam karta hai?',
            ['Layer 1', 'Layer 2', 'Layer 3', 'Layer 4'],
            1,
            'Switch MAC address dekh kar frame forward karta hai — Layer 2. Layer 3 switch routing bhi kar sakta hai, par basic kaam L2 hai.',
          ),
          q(
            'Router ka main kaam kya hai?',
            [
              'MAC address filter karna',
              'Different networks ke beech packet forward karna',
              'Collision detect karna',
              'Wi-Fi password dena',
            ],
            1,
            'Router routing table dekh kar networks ke beech path chunta hai — Layer 3 par.',
          ),
          q(
            'ping command kis cheez ka test hai?',
            ['DNS resolution', 'Layer 3 reachability', 'Layer 2 switching', 'Bandwidth'],
            1,
            'ping ICMP echo request bhejta hai — IP level reachability aur RTT batata hai, DNS nahi.',
          ),
          q('MAC address kaunsi layer par use hota hai?', ['Layer 1', 'Layer 2', 'Layer 3', 'Layer 4'], 1,
            'MAC Layer 2 (Data Link) ki address hai — same LAN me frame deliver karne ke liye.'),
          q(
            'Encapsulation ka sahi order kaunsa hai?',
            [
              'Frame → packet → segment → bits',
              'Data → segment → packet → frame → bits',
              'Bits → frame → packet → data',
              'Packet → frame → segment → bits',
            ],
            1,
            'Application data pehle TCP segment banta hai, phir IP packet, phir Ethernet frame, phir cable par bits.',
          ),
        ],
      },
      {
        code: 'ch2',
        title: 'IP addressing & subnetting',
        questions: [
          q('192.168.1.0/24 ka broadcast address kya hai?', ['192.168.1.0', '192.168.1.1', '192.168.1.255', '255.255.255.255'], 2,
            'Har subnet ka last address broadcast hota hai. /24 me .255 broadcast hai, .0 network address.'),
          q('/27 subnet me kitne usable host milte hain?', ['32', '30', '62', '126'], 1,
            '2^5 − 2 = 30. Do address network aur broadcast ke liye reserve rehte hain.'),
          q('Kaunsa address private hai?', ['8.8.8.8', '172.16.4.1', '203.0.113.5', '1.1.1.1'], 1,
            '172.16.0.0–172.31.255.255 private range hai (RFC 1918). Baaki public hain.'),
          q('/26 subnet ka block size kitna hota hai?', ['32', '64', '128', '16'], 1,
            '256 − 192 = 64. Subnets .0, .64, .128, .192 par bante hain.'),
          q('Network address kise kehte hain?', [
            'Jahan host bits sab 0 hon',
            'Jahan host bits sab 1 hon',
            'Jahan pehla host ho',
            'Jahan mask 255 ho',
          ], 0, 'Host bits sab 0 = network address. Sab 1 = broadcast address.'),
          q('10.0.0.0/8 kis kaam aata hai?', ['Public hosting', 'Bade private network aur cloud VPC', 'Multicast', 'Loopback'], 1,
            '10/8 RFC 1918 ki sabse badi private range hai — enterprise aur VPC me use hoti hai.'),
        ],
      },
      {
        code: 'ch3',
        title: 'Ports, protocols & the packet journey',
        questions: [
          q('HTTPS ka default port kaunsa hai?', ['80', '443', '3389', '22'], 1,
            'HTTPS = TCP 443. HTTP 80, RDP 3389, SSH 22.'),
          q('TCP aur UDP me asli farq kya hai?', [
            'TCP fast hai, UDP reliable',
            'TCP connection-oriented aur reliable hai, UDP connectionless',
            'Dono same hain',
            'UDP sirf DNS ke liye hai',
          ], 1, 'TCP handshake karta hai, order aur retransmission deta hai. UDP bhej deta hai — DNS, voice, video me.'),
          q('DNS ka default port kya hai?', ['53', '67', '123', '161'], 0,
            'DNS TCP aur UDP dono par 53 use karta hai. DHCP 67/68, NTP 123, SNMP 161.'),
          q('DHCP ka kaam kya hai?', [
            'Naam ko IP me badalna',
            'Device ko IP, mask, gateway aur DNS dena',
            'MAC address assign karna',
            'Packet ko route karna',
          ], 1, 'DHCP DORA ke through network configuration deta hai. Naam resolve karna DNS ka kaam hai.'),
          q('ARP kya resolve karta hai?', [
            'IP → MAC',
            'MAC → IP',
            'Domain → IP',
            'Port → service',
          ], 0, 'ARP "who has this IP?" poochh kar us IP ka MAC seekhta hai — same LAN ke andar.'),
          q('Ephemeral (temporary) client port range kaunsi hai?', ['0–1023', '1024–49151', '49152–65535', '1–100'], 2,
            'Well-known 0–1023, registered 1024–49151, ephemeral/dynamic 49152–65535.'),
        ],
      },
    ],
  },

  'ccna-m2': {
    title: 'Switching & VLANs',
    subtitle: 'MAC table, trunking, STP',
    minutes: 5,
    chapters: [
      {
        code: 'ch1',
        title: 'How a switch learns',
        questions: [
          q('MAC table dekhne ki command?', ['show arp', 'show mac address-table', 'show route', 'show vlan'], 1,
            'show mac address-table se MAC → port mapping dikhti hai. ARP IP→MAC cache hota hai (L3).'),
          q('Switch ko destination MAC unknown ho to kya karta hai?', [
            'Packet drop',
            'Sabhi ports par flood (incoming ke alawa)',
            'Router ko bhejta hai',
            'Broadcast storm banata hai',
          ], 1, 'Unknown unicast flooding hoti hai — tab tak jab tak MAC table me entry na ban jaye.'),
          q('Switch frame forward karne ke liye kya dekhta hai?', ['Source IP', 'Destination MAC', 'Source port', 'TTL'], 1,
            'Forwarding destination MAC par hoti hai. Source MAC se wo seekhta hai.'),
          q('Switch ka har port kya hota hai?', [
            'Ek collision domain',
            'Ek broadcast domain',
            'Ek subnet',
            'Ek VLAN trunk',
          ], 0, 'Switch har port par separate collision domain banata hai, par broadcast domain ek hi rehta hai jab tak VLAN na banao.'),
          q('Broadcast frame switch kaise bhejta hai?', [
            'Sirf uplink par',
            'Sabhi ports par, incoming ke alawa',
            'Sirf router ko',
            'Drop kar deta hai',
          ], 1, 'Broadcast same VLAN ke sabhi ports par jata hai — isliye bade L2 network me VLAN zaroori hai.'),
          q('MAC address kitne bits ka hota hai?', ['32', '48', '64', '128'], 1,
            '48 bits = 6 bytes. Pehle 3 bytes OUI (vendor) hote hain.'),
        ],
      },
      {
        code: 'ch2',
        title: 'VLANs & trunking',
        questions: [
          q('VLAN ka main purpose kya hai?', [
            'Bandwidth badhana',
            'Ek switch par broadcast domain ko todna',
            'IP address dena',
            'Cable length badhana',
          ], 1, 'VLAN broadcast domain segment karta hai — security aur performance dono ke liye.'),
          q('Trunk par kaunsa standard tag lagta hai?', ['802.11', '802.1Q', '802.3af', '802.1X'], 1,
            '802.1Q VLAN tag lagata hai. 802.11 Wi-Fi, 802.3af PoE, 802.1X authentication.'),
          q('Native VLAN ki khaas baat kya hai?', [
            'Wo sabse fast hota hai',
            'Uska traffic trunk par untagged jata hai',
            'Wo delete nahi hota',
            'Wo sirf voice ke liye hota hai',
          ], 1, 'Native VLAN frames bina tag ke travel karte hain — dono taraf same hona chahiye.'),
          q('Access port kya karta hai?', [
            'Kai VLAN ka tagged traffic',
            'Ek hi VLAN ka untagged traffic',
            'Sirf routed traffic',
            'Sirf wireless traffic',
          ], 1, 'Access port ek VLAN se juda hota hai; end device tag samajh nahi sakta isliye untagged.'),
          q('VLAN 1 ke baare me kya sach hai?', [
            'Default VLAN hai, delete nahi ho sakta',
            'Sirf trunk par chalta hai',
            'Isme IP nahi ho sakta',
            'Ise STP ignore karta hai',
          ], 0, 'VLAN 1 default hai aur delete nahi hota. Security ke liye use alag rakhna best practice hai.'),
          q('Do VLAN ke beech traffic bhejne ke liye kya chahiye?', [
            'Sirf switch',
            'Layer 3 device (router ya L3 switch)',
            'Hub',
            'Zyada cable',
          ], 1, 'Different VLAN = different subnet. Routing ke liye L3 device chahiye (router-on-a-stick ya SVI).'),
        ],
      },
      {
        code: 'ch3',
        title: 'STP & port security',
        questions: [
          q('STP ka kaam kya hai?', ['Speed badhana', 'Layer 2 loop rokna', 'VLAN banana', 'IP assign karna'], 1,
            'Redundant links se broadcast storm hota hai. STP kuch ports block karke loop-free topology banata hai.'),
          q('Root bridge kaun banta hai?', [
            'Sabse zyada ports wala switch',
            'Sabse kam bridge ID wala switch',
            'Sabse naya switch',
            'Jo pehle boot hua',
          ], 1, 'Bridge ID = priority + MAC. Sabse kam bridge ID root banta hai.'),
          q('STP ka default bridge priority kitna hai?', ['4096', '8192', '32768', '65536'], 2,
            'Default 32768 hai. Kam priority = zyada chance root banne ka.'),
          q('Port security kis cheez ko limit karta hai?', [
            'Bandwidth',
            'Ek port par allowed MAC addresses',
            'VLAN count',
            'Broadcast rate',
          ], 1, 'Port security allowed MACs ki list rakhta hai — rogue device aur MAC flooding se bachata hai.'),
          q('STP me blocked port kya karta hai?', [
            'Traffic forward karta hai',
            'Frame drop karta hai, BPDU suntа hai',
            'VLAN banata hai',
            'MAC table clear karta hai',
          ], 1, 'Blocked port data forward nahi karta, par BPDU sun kar topology change detect karta hai.'),
          q('BPDU ka kaam kya hai?', ['Routing updates', 'STP topology information exchange', 'IP assignment', 'VLAN tagging'], 1,
            'BPDU se switches root bridge aur path cost share karte hain.'),
        ],
      },
    ],
  },

  'ccna-m3': {
    title: 'Routing & OSPF',
    subtitle: 'Routing table, static routes, OSPF',
    minutes: 5,
    chapters: [
      {
        code: 'ch1',
        title: 'Routing table basics',
        questions: [
          q('Routing table me same prefix ke do routes hon to pehle kya dekha jata hai?', [
            'Sabse lamba uptime',
            'Longest prefix match',
            'Sabse naya route',
            'MAC address',
          ], 1, 'Pehle longest prefix match, phir AD, phir metric.'),
          q('Default route kaunsa hota hai?', ['0.0.0.0/0', '255.255.255.255/32', '10.0.0.0/8', '127.0.0.0/8'], 0,
            '0.0.0.0/0 "baaki sab" ke liye hota hai — usually internet gateway ki taraf.'),
          q('Administrative distance kya batati hai?', [
            'Path ki speed',
            'Route source ki trustworthiness',
            'Interface bandwidth',
            'Hop count',
          ], 1, 'Kam AD = zyada trustworthy source. Connected 0, static 1, EIGRP 90, OSPF 110, RIP 120.'),
          q('Connected route ki AD kitni hoti hai?', ['0', '1', '90', '110'], 0,
            'Interface par directly connected network ki AD 0 hoti hai — sabse pehle wahi jeetta hai.'),
          q('Static route ki AD kitni hai?', ['0', '1', '90', '110'], 1, 'Static route default AD 1 ke saath aata hai.'),
          q('Metric kya batati hai?', ['Route source', 'Path ki cost', 'Interface speed only', 'Subnet size'], 1,
            'Metric us path ki cost hai jo protocol calculate karta hai — OSPF me bandwidth-based cost.'),
        ],
      },
      {
        code: 'ch2',
        title: 'Static routes & wildcards',
        questions: [
          q('Static route ki sahi command kaunsi hai?', [
            'ip route 192.168.2.0 255.255.255.0 10.0.0.2',
            'route add 192.168.2.0',
            'ip address 192.168.2.1',
            'network 192.168.2.0',
          ], 0, 'Format: ip route <network> <mask> <next-hop ya exit interface>.'),
          q('/26 ka wildcard mask kya hoga?', ['0.0.0.63', '0.0.0.127', '255.255.255.192', '0.0.0.255'], 0,
            'Wildcard = mask ka ulta. /26 mask 255.255.255.192 → wildcard 0.0.0.63.'),
          q('Floating static route kya hoti hai?', [
            'Default route',
            'Static route jiski AD zyada ho, backup ke liye',
            'Route jisme next-hop nahi',
            'Dynamic route',
          ], 1, 'AD badha kar (jaise 5) static route backup ban jati hai — primary fail hone par active hoti hai.'),
          q('Default static route ki command?', [
            'ip route 0.0.0.0 0.0.0.0 203.0.113.1',
            'ip default-network',
            'ip route 255.255.255.255 0.0.0.0',
            'ip gateway 0.0.0.0',
          ], 0, '0.0.0.0 0.0.0.0 ka matlab "koi bhi destination" — next-hop gateway diya jata hai.'),
          q('AD ka sahi order (best se worst)?', [
            'RIP < OSPF < static < connected',
            'Connected < static < OSPF < RIP',
            'Static < connected < RIP < OSPF',
            'OSPF < static < connected < RIP',
          ], 1, 'Connected 0, static 1, OSPF 110, RIP 120.'),
          q('Next-hop recursive lookup kya hai?', [
            'Route ko delete karna',
            'Next-hop ko reach karne ka rasta dobara table me dekhna',
            'Packet ko duplicate karna',
            'Metric calculate karna',
          ], 1, 'Router pehle next-hop ka route dhundta hai, phir packet bhejta hai.'),
        ],
      },
      {
        code: 'ch3',
        title: 'OSPF fundamentals',
        questions: [
          q('OSPF ka administrative distance kitna hai?', ['1', '90', '110', '120'], 2,
            'OSPF AD 110. Static 1, EIGRP 90, RIP 120.'),
          q('OSPF metric kya use karta hai?', ['Hop count', 'Cost (bandwidth)', 'Delay only', 'Tick count'], 1,
            'Cost = reference bandwidth / interface bandwidth. Default reference 100 Mbps.'),
          q('Broadcast network par hello interval?', ['5 s', '10 s', '30 s', '60 s'], 1,
            'Broadcast/point-to-point par 10s (dead 40s). NBMA par 30s (dead 120s).'),
          q('Router ID kaise chuna jata hai?', [
            'Sabse kam IP',
            'Sabse zyada loopback IP (warna highest physical IP)',
            'Random',
            'MAC address',
          ], 1, 'Manual router-id > highest loopback IP > highest active physical IP.'),
          q('DR/BDR kyun chune jate hain?', [
            'Bandwidth bachane ke liye — sab DR se hi adjacency banate hain',
            'Speed badhane ke liye',
            'Security ke liye',
            'VLAN banane ke liye',
          ], 0, 'Full mesh adjacencies (n×(n−1)/2) avoid karke LSAs ki flooding kam hoti hai.'),
          q('OSPF enable karne ka pehla step?', [
            'ip route 0.0.0.0 0.0.0.0',
            'router ospf <process-id>',
            'vlan 10',
            'switchport mode trunk',
          ], 1, 'Global config me router ospf 1, phir network statements se interfaces advertise hote hain.'),
        ],
      },
    ],
  },
};

// ---------------------------------------------------------------- helpers

export const shuffle = (list) => {
  const copy = [...list];
  for (let i = copy.length - 1; i > 0; i -= 1) {
    const j = Math.floor(Math.random() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
};

const withShuffledOptions = (question) => {
  const correct = question.options[question.answer];
  const options = shuffle(question.options);
  return { ...question, options, answer: options.indexOf(correct) };
};

export const moduleId = (moduleCode, chapterCode) => (chapterCode ? `${moduleCode}-${chapterCode}` : moduleCode);

export const getQuiz = (moduleCode, chapterCode) => {
  const module = QUIZZES[moduleCode];
  if (!module) return null;

  if (chapterCode) {
    const chapter = module.chapters.find((item) => item.code === chapterCode);
    if (!chapter) return null;
    return {
      id: moduleId(moduleCode, chapterCode),
      title: `${module.title} · ${chapter.title}`,
      subtitle: `Chapter check · ${chapter.questions.length} questions`,
      minutes: 3,
      pool: chapter.questions,
      take: chapter.questions.length,
      chapters: module.chapters,
      moduleCode,
      chapterCode,
    };
  }

  const pool = module.chapters.flatMap((chapter) => chapter.questions);
  return {
    id: moduleCode,
    title: module.title,
    subtitle: module.subtitle,
    minutes: 5,
    pool,
    take: Math.min(10, pool.length),
    chapters: module.chapters,
    moduleCode,
    chapterCode: null,
  };
};

// Draw a fresh set for one attempt: questions shuffled, options shuffled too.
export const drawQuestions = (quiz) => shuffle(quiz.pool).slice(0, quiz.take).map(withShuffledOptions);

export const QUIZ_CODES = Object.entries(QUIZZES).reduce((acc, [moduleCode, module]) => {
  acc[moduleCode] = `/quiz/${moduleCode}`;
  module.chapters.forEach((chapter) => {
    acc[`${moduleCode}-${chapter.code}`] = `/quiz/${moduleCode}/${chapter.code}`;
  });
  return acc;
}, {});

export const quizRoutes = Object.entries(QUIZZES).flatMap(([moduleCode, module]) => [
  { module: moduleCode, chapter: null, title: module.title },
  ...module.chapters.map((chapter) => ({
    module: moduleCode,
    chapter: chapter.code,
    title: `${module.title} · ${chapter.title}`,
  })),
]);
