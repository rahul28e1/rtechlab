# -*- coding: utf-8 -*-
"""
RTechLab December 2026 Season 1: Everyday Tech Architecture
Master Script Dataset for Episodes 03 to 16
"""

DECEMBER_EPISODES = {
    "ep03": {
        "num": "EP03",
        "date_code": "05.12.26",
        "folder": "EP03 (05.12.26) - IRCTC 10 AM Tatkal Spike",
        "title_hi": "IRCTC 10:00 AM Tatkal: Server Crash क्यों नहीं होता?",
        "title_en": "How IRCTC Survives the 10 AM Tatkal Traffic Spike",
        "short_title": "IRCTC 10 AM Tatkal Spike",
        "next_ep": "EP04",
        "next_hook_hi": "लाखों लोग एक ही ट्रेन की सीट कैसे book करते हैं बिना clash के? जानिए Part 4 में!",
        "next_hook_en": "How do thousands book the same train seat without double-booking clashes? Find out in Part 4!",
        "scenes_hi": [
            ("s1_hook", "IRCTC पर सुबह 10 बजते ही लाखों लोग तत्काल टिकट के लिए 'Book' बटन दबाते हैं! लेकिन सोचिए, 1 सेकंड में 10 लाख requests आने पर भी IRCTC का server melt down क्यों नहीं होता?"),
            ("s2_problem", "अगर कोई normal website हो, तो 10,000 requests में ही 504 Gateway Timeout आ जाएगा. लेकिन IRCTC इसे 4-tier High Concurrency Architecture से संभालता है."),
            ("s3_ingress", "सबसे पहले NGINX Reverse Proxy और Cloudflare Layer आती है. ये invalid bots और scraping scripts को 90% traffic gate पर ही block कर देती है."),
            ("s4_throttling", "इसके बाद आता है Concurrency Token Bucket Algorithm! हर user session को एक cryptographically signed token मिलता है, जिससे database पर traffic queue में जाता है."),
            ("s5_db_read", "Train availability check करने के लिए database नहीं, बल्कि In-Memory Redis Caching Clustered Servers read होते हैं, जो sub-millisecond response देते हैं."),
            ("s6_payment_queue", "Payment step पर IRCTC Multi-Bank Payment Gateway Aggregators use करता है, ताकि बैंक server down होने पर session fail न हो."),
            ("s7_arch_lesson", "System architects के लिए lesson: High traffic में सीधे database को hit मत करो, Read-Replicas और Rate Limiting Ingress लगाओ!"),
            ("s8_outro", "लेकिन लाखों लोग एक साथ एक ही सीट पर click करें, तो ticket clash क्यों नहीं होता? जानिए Part 4 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "At exactly 10:00 AM on IRCTC, millions of users slam the Tatkal Book button simultaneously! Why doesn't the server crash into a complete meltdown?"),
            ("s2_problem", "Any normal web application would throw a 504 Gateway Timeout under 10,000 concurrent hits. IRCTC survives using a 4-tier High Concurrency Architecture."),
            ("s3_ingress", "First, NGINX Ingress proxies and Anycast DDoS filters absorb the surge, eliminating 90% of automated scraper bots at the outer perimeter."),
            ("s4_throttling", "Next, the Token Bucket Algorithm throttles traffic! Each user session gets a cryptographically signed ticket token, queuing database access smoothly."),
            ("s5_db_read", "Train availability queries never touch the master database—they are served from clustered In-Memory Redis caches with sub-millisecond latency."),
            ("s6_payment_queue", "At checkout, multi-gateway aggregators balance bank connections so third-party failures never drop active user sessions."),
            ("s7_arch_lesson", "The core architecture rule: Never expose your primary database directly to surge traffic—buffer with Read-Replicas and Ingress rate limiters!"),
            ("s8_outro", "When thousands click on the very same berth simultaneously, how does IRCTC prevent double booking? Find out in Part 4! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep04": {
        "num": "EP04",
        "date_code": "07.12.26",
        "folder": "EP04 (07.12.26) - IRCTC Database Locking Secrets",
        "title_hi": "25,000 Tickets/Min: IRCTC Database Locking Secrets",
        "title_en": "IRCTC High-Speed Seat Allocation Engine",
        "short_title": "IRCTC Database Locking Secrets",
        "next_ep": "EP05",
        "next_hook_hi": "Movie tickets book करते समय 8 मिनट की सीट lock कैसे होती है? जानिए Part 5 में!",
        "next_hook_en": "How does BookMyShow freeze your exact cinema seat for 8 minutes? Find out in Part 5!",
        "scenes_hi": [
            ("s1_hook", "Tatkal में केवल 50 सीटें होती हैं और 50,000 लोग एक साथ 'Confirm' दबाते हैं! फिर भी ऐसा कभी नहीं होता कि एक ही सीट दो अलग-अलग लोगों को मिल जाए! ये कैसे मुमकिन है?"),
            ("s2_problem", "Database engineering में इसे कहते हैं 'Race Condition'! अगर दो queries एक ही microsecond में सीट को 'AVAILABLE' पढ़ें, तो double booking हो जाएगी."),
            ("s3_locking", "IRCTC इसे रोकने के लिए Pessimistic Locking की जगह 'Optimistic Concurrency Control' और Redis Distributed In-Memory Locks use करता है."),
            ("s4_state_machine", "जैसे ही आप payment initiate करते हैं, सीट का status 'BOOKING_IN_PROGRESS' बन जाता है और उस पर 3 मिनट का atomic TTL timer लग जाता है."),
            ("s5_two_phase", "Final write के समय Two-Phase Commit (2PC) protocol चलता है: जब तक payment ledger verify नहीं होता, database version number increment नहीं होता."),
            ("s6_rollback", "अगर user का payment timeout हो गया, तो Redis का TTL expire होते ही seat status automatically revert back to 'AVAILABLE' हो जाता है."),
            ("s7_arch_lesson", "System architects: High contention resources पर relational table lock मत लगाओ, In-Memory Atomic Lock और Versioning use करो!"),
            ("s8_outro", "लेकिन क्या BookMyShow भी यही तकनीक use करता है जब वो 8 मिनट के लिए सीट freeze करता है? जानिए Part 5 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "Only 50 Tatkal berths exist, yet 50,000 users click Confirm simultaneously! Why does IRCTC never accidentally assign the same berth to two passengers?"),
            ("s2_problem", "In database engineering, this is known as a Race Condition! If two queries read 'AVAILABLE' in the same microsecond, disaster strikes."),
            ("s3_locking", "To prevent double allocation, IRCTC avoids slow relational row locks and utilizes Optimistic Concurrency Control with Redis Distributed Locks."),
            ("s4_state_machine", "The instant checkout starts, the seat transitions to 'BOOKING_IN_PROGRESS' with an atomic 3-minute Time-To-Live (TTL) countdown."),
            ("s5_two_phase", "During final write, a Two-Phase Commit ensures the row version number increments strictly upon verified payment webhook confirmation."),
            ("s6_rollback", "If the payment drops, the TTL worker expires, instantly releasing the lock back to 'AVAILABLE' for the next in queue."),
            ("s7_arch_lesson", "Architect takeaway: On high-contention inventory, avoid heavy table locks—rely on atomic memory primitives and state machines!"),
            ("s8_outro", "How does BookMyShow freeze your exact cinema seat for 8 full minutes across all devices? Find out in Part 5! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep05": {
        "num": "EP05",
        "date_code": "09.12.26",
        "folder": "EP05 (09.12.26) - BookMyShow 8-Min Seat Lock",
        "title_hi": "BookMyShow 8-Minute Seat Lock Architecture",
        "title_en": "How BookMyShow Freezes Your Seat for 8 Minutes",
        "short_title": "BookMyShow 8-Min Seat Lock",
        "next_ep": "EP06",
        "next_hook_hi": "Order place होते ही delivery boy की real-time bike screen पर कैसे दिखती है? जानिए Part 6 में!",
        "next_hook_en": "How does Zomato show real-time delivery rider bike movement on your map? Find out in Part 6!",
        "scenes_hi": [
            ("s1_hook", "BookMyShow पर आपने सीट चुनी, और वो सीट अगले 8 मिनट के लिए लाल होकर पूरे देश के लिए lock हो गई! लेकिन अगर आप app बंद कर दें, तो वो सीट unlock कैसे होती है?"),
            ("s2_problem", "करोड़ों users एक साथ blockbuster movie की seats select कर रहे हैं. अगर हर lock database में लिखा जाए, तो cinema hall का booking engine crash हो जाएगा!"),
            ("s3_redlock", "BookMyShow इसके लिए use करता है Redis Redlock Algorithm! सीट selection होते ही memory cluster में 480 seconds की key write होती है."),
            ("s4_websocket", "जैसे ही lock create होता है, WebSocket server connected users को instant event broadcast करता है, जिससे सीट map real-time में red हो जाता है."),
            ("s5_ttl_worker", "Background में Redis Keyspace Notifications और Celery/RabbitMQ workers 8 मिनट का countdown watch करते हैं."),
            ("s6_auto_release", "अगर 8 मिनट में checkout complete नहीं हुआ, तो TTL key auto-delete हो जाती है और WebSocket सबको 'SEAT_UNLOCKED' event भेज देता है!"),
            ("s7_arch_lesson", "Developers: Ephemeral UI states के लिए persistent database कभी मत छुओ, WebSocket broadcasts के साथ In-Memory TTL use करो!"),
            ("s8_outro", "लेकिन order place होते ही Zomato delivery boy की live bike map पर smooth कैसे चलती है? जानिए Part 6 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "You tap a cinema seat on BookMyShow, and it turns red—locked for the entire country for exactly 8 minutes! If you close the app, how does it release?"),
            ("s2_problem", "Millions select seats for blockbuster releases simultaneously. Writing temporary reservation locks to disk would melt the ticketing database."),
            ("s3_redlock", "BookMyShow deploys the Redis Redlock algorithm, writing an atomic in-memory key with a strict 480-second Time-To-Live across clusters."),
            ("s4_websocket", "Simultaneously, a WebSocket broker broadcasts the state change to all connected theater clients, instantly painting the seat red."),
            ("s5_ttl_worker", "Background asynchronous workers monitor Redis keyspace events, tracking checkout completion against the countdown timer."),
            ("s6_auto_release", "If the payment drops, the TTL key expires silently, emitting an immediate 'SEAT_RELEASED' event across all connected devices!"),
            ("s7_arch_lesson", "Engineering insight: Never store short-lived UI locks in persistent relational tables—use distributed memory TTL with WebSocket pushes!"),
            ("s8_outro", "How does Zomato stream the smooth, live GPS motion of a delivery bike straight onto your phone screen? Find out in Part 6! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep06": {
        "num": "EP06",
        "date_code": "11.12.26",
        "folder": "EP06 (11.12.26) - Zomato Real-Time GPS Tracking",
        "title_hi": "Zomato Real-Time GPS Delivery Tracking",
        "title_en": "Behind Zomato's Live Map & Delivery Coordinates",
        "short_title": "Zomato Real-Time GPS Tracking",
        "next_ep": "EP07",
        "next_hook_hi": "बारिश होते ही कैब का किराया 2x क्यों हो जाता है? जानिए Part 7 में!",
        "next_hook_en": "Why does cab fare suddenly double the second rain starts? Find out in Part 7!",
        "scenes_hi": [
            ("s1_hook", "Zomato या Swiggy पर खाना order करते ही screen पर delivery partner की bike live चलती हुई दिखती है! लेकिन क्या rider का phone लगातार GPS coordinates भेज रहा है?"),
            ("s2_problem", "अगर rider का phone हर second server को GPS भेजे, तो 1 घंटे में phone की battery खत्म हो जाएगी और server पर billions of coordinates का load आ जाएगा!"),
            ("s3_kalman", "Rider app use करता है 'Kalman Filter' और Adaptive Pinging! जब bike सीधी सड़क पर होती है, तो ping rate कम होता है, और turn लेने पर ping rate बढ़ता है."),
            ("s4_h3_spatial", "Server पर Uber H3 Hexagonal Spatial Indexing चलती है. पूरी दुनिया को छोटे-छोटे hexagons में divide करके rider की exact location match की जाती है."),
            ("s5_dead_reckoning", "Customer app में bike jerky नहीं दिखती क्योंकि 'Dead Reckoning' algorithm rider की velocity और direction से smooth interpolation करता है."),
            ("s6_battery_opt", "Network drop होने पर coordinates local SQLite cache में store होते हैं और network आते ही batch upload हो जाते हैं."),
            ("s7_arch_lesson", "Developers: Real-time tracking में raw coordinates push मत करो, Client-side Filtering और Map Matching Algorithms use करो!"),
            ("s8_outro", "लेकिन बारिश होते ही Uber और Ola की cab का किराया अचानक 2x क्यों हो जाता है? जानिए Part 7 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "The instant you order food on Zomato, a delivery bike glides smoothly along your street on the map! Is the rider's phone broadcasting continuous GPS non-stop?"),
            ("s2_problem", "Pinging raw GPS coordinates every single second would drain a smartphone battery in an hour and crush backend servers under billions of writes."),
            ("s3_kalman", "The rider application applies Kalman Filtering and Adaptive Pinging, reducing updates on straightaways and firing only during directional turns."),
            ("s4_h3_spatial", "On the backend, Uber H3 Hexagonal Spatial Indexing groups coordinates into geographic cells to query delivery clusters instantaneously."),
            ("s5_dead_reckoning", "The consumer app eliminates jerky stutter using Dead Reckoning interpolation, predicting movement along street geometries smoothly."),
            ("s6_battery_opt", "During mobile network dead zones, coordinates queue inside an encrypted local SQLite buffer and batch-upload upon reconnection."),
            ("s7_arch_lesson", "System design takeaway: For spatial telemetry, never stream raw GPS streams—combine Edge Kalman filtering with road-network matching!"),
            ("s8_outro", "Why does cab pricing double within seconds of the first raindrop falling? Find out in Part 7! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep07": {
        "num": "EP07",
        "date_code": "13.12.26",
        "folder": "EP07 (13.12.26) - Uber Surge Pricing Algorithm",
        "title_hi": "Uber / Ola Surge Pricing: Algorithm काम कैसे करता है?",
        "title_en": "The Math Behind Dynamic Ride Surge Pricing",
        "short_title": "Uber Surge Pricing Algorithm",
        "next_ep": "EP08",
        "next_hook_hi": "क्या WhatsApp सच में आपकी chat पढ़ सकता है? जानिए Part 8 में!",
        "next_hook_en": "Can WhatsApp or telecom providers actually read your secret chats? Find out in Part 8!",
        "scenes_hi": [
            ("s1_hook", "Office से निकले, हलकी बारिश शुरू हुई, और Uber का ₹200 का किराया तुरंत ₹450 हो गया! लेकिन क्या ये rate कोई इंसान manually बढ़ाता है?"),
            ("s2_problem", "बिल्कुल नहीं! ये एक 100% automated Machine Learning & Dynamic Pricing Engine है, जिसका मकसद मुनाफा कमाना नहीं, बल्कि supply और demand balance करना है."),
            ("s3_h3_hexagons", "Uber पूरे शहर को H3 Hexagonal Cells (Hex-7 resolution) में बांटता है. हर hexagon में real-time active drivers और open app users count होते हैं."),
            ("s4_multiplier", "जब किसी hex-cell में app open करने वालों का ratio available cabs से 3 गुना बढ़ जाता है, तो Surge Multiplier 1.2x से 2.5x trigger हो जाता है."),
            ("s5_supply_pull", "किराया बढ़ने से 2 चीज़ें होती हैं: Casual riders ride postpone करते हैं (demand drop), और nearby driver cab लेकर उस इलाके में आते हैं (supply boost)!"),
            ("s6_dampening", "Prices अचानक आसमान न छूएं, इसलिए Smoothing Exponential Moving Average algorithms wild spikes को curb करते हैं."),
            ("s7_arch_lesson", "Architects: Dynamic pricing केवल revenue tool नहीं है, ये high-load distributed systems का Supply-Demand Balancing Valve है!"),
            ("s8_outro", "लेकिन क्या WhatsApp सच में आपकी secret personal chat पढ़ सकता है? जानिए Part 8 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "You step outside, a drizzle begins, and your regular ₹200 cab fare surges to ₹450 instantly! Does a human manager manually dial up the price?"),
            ("s2_problem", "Not at all! Surge pricing is a fully automated Dynamic Equilibrium algorithm designed to balance supply and demand in physical space."),
            ("s3_h3_hexagons", "Cities are mapped into granular Uber H3 Hexagonal cells. Every cell continuously monitors active driver beacons versus opened rider apps."),
            ("s4_multiplier", "When ride requests in a hexagon outpace nearby cabs by a specific threshold, the surge multiplier scales dynamically from 1.2x to 2.5x."),
            ("s5_supply_pull", "The price increase accomplishes two goals: price-sensitive riders defer booking, while drivers in adjacent cells are incentivized to relocate."),
            ("s6_dampening", "To prevent volatility spikes, Exponential Moving Averages smooth price transitions and protect consumers from runaway price shocks."),
            ("s7_arch_lesson", "Core insight: Surge algorithms are market-clearing mechanisms that treat real-world physics as a distributed load balancer!"),
            ("s8_outro", "Can WhatsApp, telecom networks, or governments actually read your private messages? Find out in Part 8! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep08": {
        "num": "EP08",
        "date_code": "15.12.26",
        "folder": "EP08 (15.12.26) - WhatsApp End-to-End Encryption",
        "title_hi": "WhatsApp End-to-End Encryption: कोई नहीं पढ़ सकता?",
        "title_en": "The Cryptographic Secrets of Signal Protocol",
        "short_title": "WhatsApp End-to-End Encryption",
        "next_ep": "EP09",
        "next_hook_hi": "4K movie slow internet पर भी बिना अटके कैसे चलती है? जानिए Part 9 में!",
        "next_hook_en": "How does Netflix stream 4K movies without buffering wheels on slow connections? Find out in Part 9!",
        "scenes_hi": [
            ("s1_hook", "WhatsApp पर लिखा आता है: 'Messages are end-to-end encrypted'! लेकिन क्या सच में Meta, hackers या ISP आपकी chats को intercept नहीं कर सकते?"),
            ("s2_problem", "अगर encryption key server के पास हो, तो कोई भी employee chats पढ़ सकता है. इसलिए WhatsApp use करता है विश्व-प्रसिद्ध 'Signal Protocol'."),
            ("s3_diffie_hellman", "जब आप chat शुरू करते हैं, तो Diffie-Hellman Key Exchange से दोनों phones के बीच एक unique Shared Secret Key गणितीय रूप से तैयार होती है."),
            ("s4_double_ratchet", "इसका सबसे बड़ा secret है 'Double Ratchet Algorithm'! हर एक message भेजने पर encryption key ratchet की तरह घूमकर बदल जाती है."),
            ("s5_forward_secrecy", "इसे कहते हैं Forward Secrecy! अगर कोई hacker आज की key चुरा भी ले, तो वो कल का पुराना या आने वाला नया message decrypt नहीं कर सकता."),
            ("s6_server_blind", "WhatsApp के server केवल encrypted ciphertext store और route करते हैं, private key केवल आपके phone के secure enclave में रहती है."),
            ("s7_arch_lesson", "Security engineers: Static API keys कभी मत use करो, Double Ratchet और Ephemeral Session Keys से Zero-Trust pipelines बनाओ!"),
            ("s8_outro", "लेकिन 4K movie slow internet पर भी बिना spinning wheel के smooth कैसे चलती है? जानिए Part 9 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "WhatsApp promises 'Messages are end-to-end encrypted'. Can Meta engineers, hackers, or telecom providers actually intercept and read your private texts?"),
            ("s2_problem", "If encryption keys lived on the central server, your data would always be vulnerable. That is why WhatsApp adopted the battle-tested Signal Protocol."),
            ("s3_diffie_hellman", "When initiating a chat, Diffie-Hellman Key Exchange mathematically establishes a shared cryptographic secret across both devices without transmitting it."),
            ("s4_double_ratchet", "The core cryptographic breakthrough is the Double Ratchet Algorithm! With every single message sent, encryption keys advance irreversibly."),
            ("s5_forward_secrecy", "This ensures Forward Secrecy: even if a compromised device leaks today's key, past archives and future transmissions remain mathematically unbreakable."),
            ("s6_server_blind", "Central routing servers operate completely blind, passing opaque ciphertext while private keys reside strictly in device hardware enclaves."),
            ("s7_arch_lesson", "Security architecture principle: Never trust server-side storage—enforce end-to-end ephemeral ratcheting for absolute zero-trust privacy!"),
            ("s8_outro", "How does Netflix deliver crisp 4K video without buffering wheels even when your Wi-Fi fluctuates? Find out in Part 9! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep09": {
        "num": "EP09",
        "date_code": "17.12.26",
        "folder": "EP09 (17.12.26) - Netflix Adaptive Bitrate Streaming",
        "title_hi": "Netflix Adaptive Bitrate: Buffering खत्म कैसे हुई?",
        "title_en": "How Netflix Streams Without Spinning Wheels",
        "short_title": "Netflix Adaptive Bitrate Streaming",
        "next_ep": "EP10",
        "next_hook_hi": "Google Maps को कैसे पता चलता है कि सड़क पर जाम लगा है? जानिए Part 10 में!",
        "next_hook_en": "How does Google Maps know traffic is jammed before you even arrive? Find out in Part 10!",
        "scenes_hi": [
            ("s1_hook", "याद है वो पुराना ज़माना जब video देखते समय गोल-गोल buffering wheel घूमता रहता था? Netflix पर वो wheel अब लगभग गायब क्यों हो चुका है?"),
            ("s2_problem", "एक 2-घंटे की 4K movie 15 GB की होती है. अगर network 1 second के लिए भी dip हो, तो video freeze हो जानी चाहिए! फिर ये बिना रुके कैसे चलती है?"),
            ("s3_hls_chunking", "Netflix कभी पूरी movie एक file में नहीं भेजता! वो movie को HLS/DASH प्रोटोकॉल से 2 से 4 सेकंड के हज़ारों छोटे chunks में slice करता है."),
            ("s4_abr_engine", "हर chunk 720p, 1080p, और 4K जैसे 10 अलग-अलग bitrates में encode होता है. App का Adaptive Bitrate Algorithm आपके internet bandwidth को per-second monitor करता है."),
            ("s5_open_connect", "अगर Wi-Fi speed कम हुई, तो player बिना रुके अगले 2-second chunk का bitrate downgrade कर देता है, बिना किसी pause के!"),
            ("s6_edge_caching", "इसके अलावा Netflix के 'Open Connect' CDN appliances आपके local ISP के data centers में physically लगे होते हैं, ताकि video पास से stream हो."),
            ("s7_arch_lesson", "Media architects: Monolithic video streams मत भेजो, Chunked Encoding और Client-Driven Adaptive Bitrate use करो!"),
            ("s8_outro", "लेकिन Google Maps को कैसे पता चलता है कि 5 किलोमीटर आगे की सड़क लाल यानी जाम है? जानिए Part 10 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "Remember when video streaming meant staring at a spinning buffer wheel every two minutes? Why has that loading wheel virtually vanished on Netflix?"),
            ("s2_problem", "A feature-length 4K film weighs over 15 Gigabytes. The moment wireless connectivity drops, playback should freeze instantly. How does it stay silky smooth?"),
            ("s3_hls_chunking", "Netflix never delivers videos as monolithic files. Content is segmented via HLS and MPEG-DASH into thousands of tiny 2-to-4 second chunks."),
            ("s4_abr_engine", "Every segment is pre-encoded across ten distinct resolutions and bitrates. The client's Adaptive Bitrate (ABR) engine measures network throughput in real time."),
            ("s5_open_connect", "When bandwidth dips, the player downshifts resolution on the fly for the next 2-second chunk without interrupting playback frame rates."),
            ("s6_edge_caching", "Furthermore, Netflix embeds custom 'Open Connect' caching appliances inside local ISP data centers, serving traffic from single-hop physical proximity."),
            ("s7_arch_lesson", "Media engineering takeaway: Never deliver static media streams—slice content into adaptive chunks and push delivery to the network edge!"),
            ("s8_outro", "How does Google Maps detect a traffic jam on your exact road before you even reach it? Find out in Part 10! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep10": {
        "num": "EP10",
        "date_code": "19.12.26",
        "folder": "EP10 (19.12.26) - Google Maps Live Traffic Telemetry",
        "title_hi": "Google Maps Live Traffic: जाम का पता कैसे चलता है?",
        "title_en": "Crowdsourced Telemetry Behind Live Traffic",
        "short_title": "Google Maps Live Traffic Telemetry",
        "next_ep": "EP11",
        "next_hook_hi": "ATM से पैसे निकलते समय बिजली कट जाए तो क्या होता है? जानिए Part 11 में!",
        "next_hook_en": "What happens when ATM power cuts off mid-dispense? Find out in Part 11!",
        "scenes_hi": [
            ("s1_hook", "Google Maps खोलते ही सड़क पर लाल, पीली और हरी लाइनें दिख जाती हैं! लेकिन सड़क पर कोई कैमरा या sensor न होने पर भी Google को live jam का पता कैसे चलता है?"),
            ("s2_problem", "सड़कों पर physical traffic sensors लगाना नामुमकिन है. तो फिर 100,000 किलोमीटर सड़कों की real-time speed Google तक कैसे पहुँचती है?"),
            ("s3_crowdsourcing", "इसका secret है दुनिया का सबसे बड़ा Crowdsourced Telemetry Network—आपके हाथ में मौजूद Android और iOS phones!"),
            ("s4_velocity_vectors", "जब हज़ारों phones एक सड़क पर 60 km/h की जगह 10 km/h पर move करते हैं, तो Google के servers अनॉनिमस Speed Vectors calculate करते हैं."),
            ("s5_historical_baseline", "Machine Learning models live speed को ऐतिहासिक data से compare करते हैं—जैसे सोमवार सुबह की baseline speed क्या होती है."),
            ("s6_graph_traversal", "Routing engine Dijkstra और A* Graph Traversal algorithms use करके traffic congestion को bypass करने वाला fastest alternate route ढूंढता है."),
            ("s7_arch_lesson", "Data architects: जब physical sensors न हों, तो Privacy-Preserving Crowdsourced Edge Telemetry से real-time insights generate करो!"),
            ("s8_outro", "लेकिन ATM से पैसे निकलते समय अचानक बिजली कट जाए, तो कटे हुए पैसे का क्या होता है? जानिए Part 11 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "Open Google Maps, and highways instantly light up with vivid red, orange, and green traffic lines! Without roadside cameras, how does Google know?"),
            ("s2_problem", "Deploying physical road sensors across millions of highway kilometers is impossible. How does real-time velocity data reach Google servers every second?"),
            ("s3_crowdsourcing", "The secret is the planet's largest crowdsourced telemetry pipeline: the Android and iOS smartphones active in commuters' pockets!"),
            ("s4_velocity_vectors", "When clusters of location beacons decelerate from 60 km/h to 10 km/h along a roadway segment, ingestion engines calculate real-time speed vectors."),
            ("s5_historical_baseline", "Machine learning pipelines compare live vectors against decades of historical baselines, factoring in weather and rush-hour patterns."),
            ("s6_graph_traversal", "High-speed graph engines execute modified Dijkstra and A* pathfinding to dynamically re-route drivers around bottleneck nodes."),
            ("s7_arch_lesson", "Big data principle: When infrastructure lacks sensors, ingest anonymized, privacy-preserving edge telemetry to reconstruct physical reality!"),
            ("s8_outro", "What happens inside bank ledgers when an ATM loses power in the exact millisecond cash is being dispensed? Find out in Part 11! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep11": {
        "num": "EP11",
        "date_code": "21.12.26",
        "folder": "EP11 (21.12.26) - ATM Power Cut Mid-Dispense Rollback",
        "title_hi": "ATM Power Cut Mid-Dispense: कटा हुआ पैसा कहाँ जाता है?",
        "title_en": "Hardware Sensor & Transaction Rollback Architecture",
        "short_title": "ATM Power Cut Mid-Dispense Rollback",
        "next_ep": "EP12",
        "next_hook_hi": "Reels का algorithm आपका दिमाग कैसे पढ़ लेता है? जानिए Part 12 में!",
        "next_hook_en": "How does the Instagram Reels algorithm read your mind? Find out in Part 12!",
        "scenes_hi": [
            ("s1_hook", "ATM में कार्ड डाला, ₹5,000 type किया, खाते से balance कट गया... और उसी सेकंड ATM की बिजली गुल हो गई! कैश बाहर नहीं आया! आपका पैसा कहाँ गया?"),
            ("s2_problem", "अगर bank ledger debit हो गया लेकिन cash बाहर नहीं निकला, तो ये banking system की सबसे खतरनाक failure condition है!"),
            ("s3_two_phase_commit", "ATM operations 'Two-Phase Commit' (2PC) architecture पर चलते हैं. Bank ledger transaction को तब तक 'PENDING_CONFIRMATION' रखता है."),
            ("s4_optical_sensors", "ATM के cash dispenser tray में Optical IR Sensors लगे होते हैं. जब तक नोट physical sensor को break करके बाहर नहीं आते, hardware confirmation नहीं भेजता."),
            ("s5_journal_rollback", "Power cut होने पर ATM का internal Electronic Journal (EJ) file incomplete mark हो जाती है. Restart होते ही system Automatic Reversal Trigger करता है."),
            ("s6_eod_balancing", "इसके अलावा physical cash cassette में बचे हुए नोटों की counting और ledger balancing से mismatch 24 घंटे में reconcile हो जाता है."),
            ("s7_arch_lesson", "FinTech engineers: जब software hardware से interact करे, तो Two-Phase Commits और Physical Sensor Handshakes अनिवार्य हैं!"),
            ("s8_outro", "लेकिन Instagram Reels का algorithm आपका दिमाग पढ़कर वही videos feed में कैसे लाता है? जानिए Part 12 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "You request ₹5,000 at an ATM, your balance drops, and in that exact split-second—the power cuts out! No cash emerges. Where did your money go?"),
            ("s2_problem", "When a bank ledger records a debit but physical cash fails to dispense, banking infrastructure faces its most critical edge-case challenge."),
            ("s3_two_phase_commit", "ATM architectures enforce strict Two-Phase Commits (2PC). The core banking ledger marks the debit as uncommitted until hardware validation completes."),
            ("s4_optical_sensors", "The cash presenter tray contains optical infrared sensors. Cash must physically interrupt these optical beams before a success packet is transmitted."),
            ("s5_journal_rollback", "A sudden power outage leaves the machine's local Electronic Journal incomplete. Upon reboot, the controller initiates an automated transaction rollback."),
            ("s6_eod_balancing", "During daily cassette audits, physical bills are reconciled against journal transactions, guaranteeing automated account restitution."),
            ("s7_arch_lesson", "System engineering rule: In cyber-physical workflows, never treat a command as complete without independent hardware sensor validation!"),
            ("s8_outro", "How does the Instagram recommendation algorithm predict your deepest interests and keep you scrolling? Find out in Part 12! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep12": {
        "num": "EP12",
        "date_code": "23.12.26",
        "folder": "EP12 (23.12.26) - Instagram Reels Recommendation Engine",
        "title_hi": "Instagram Reels Recommendation Engine Internals",
        "title_en": "How the Algorithmic Feed Predicts Your Watch Time",
        "short_title": "Instagram Reels Recommendation Engine",
        "next_ep": "EP13",
        "next_hook_hi": "हवा में उड़ते 10,000 planes को radar screen पर कौन ट्रैक करता है? जानिए Part 13 में!",
        "next_hook_en": "How does FlightRadar24 track 10,000 aircraft live across oceans? Find out in Part 13!",
        "scenes_hi": [
            ("s1_hook", "आपने Reels पर सिर्फ 3 सेकंड एक video देखी, और अगले 1 घंटे तक आपकी feed में उसी topic की videos आने लगीं! क्या algorithm आपका दिमाग पढ़ रहा है?"),
            ("s2_problem", "Instagram पर हर minute लाखों नए reels upload होते हैं. 1 billion users के लिए हर swipe पर millisecond में perfect video चुनना computational miracle है!"),
            ("s3_two_tower", "ये काम करता है 'Two-Tower Deep Neural Network'! एक tower user के behavior vectors को process करता है, और दूसरा tower video features को."),
            ("s4_candidate_retrieval", "सबसे पहले Candidate Retrieval phase में Faiss Vector Search से billions of reels में से 1,000 relevant candidate videos filter होती हैं."),
            ("s5_realtime_ranking", "फिर Heavy Ranking Model आपके micro-actions evaluate करता है: क्या आपने 50% देखा? Audio tap किया? Share किया? या skip कर दिया?"),
            ("s6_watch_prediction", "Expected Watch Time और Re-watch Probability calculate करके final top reel आपकी screen पर 50 milliseconds में serve हो जाती है!"),
            ("s7_arch_lesson", "AI engineers: Recommendation में single monolithic model मत बनाओ, Multi-Stage Retrieval और Low-Latency Vector Ranking use करो!"),
            ("s8_outro", "लेकिन हवा में उड़ते 10,000 planes की exact live location radar screen पर कैसे दिखती है? जानिए Part 13 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "You linger on a reel for barely three seconds, and for the next hour, your entire feed adapts to that exact interest! Is the algorithm reading your mind?"),
            ("s2_problem", "With millions of reels uploaded daily and billions of active users swiping, ranking the next video in sub-100 milliseconds is an engineering marvel."),
            ("s3_two_tower", "The backbone is a Two-Tower Deep Neural Network. One tower embeds dynamic user behavior vectors, while the other embeds multimodal video features."),
            ("s4_candidate_retrieval", "In the Candidate Retrieval stage, high-speed vector indices like Faiss narrow billions of candidate reels down to roughly one thousand."),
            ("s5_realtime_ranking", "A Heavy Ranker then scores those candidates against real-time signals: completion rate, audio taps, comment triggers, and replay loops."),
            ("s6_watch_prediction", "The system calculates predicted watch duration and delivers your personalized next video to your screen within 50 milliseconds!"),
            ("s7_arch_lesson", "Machine learning design: Never rank millions of items with one heavy model—funnel through Candidate Retrieval before applying precision ranking!"),
            ("s8_outro", "How does FlightRadar24 track tens of thousands of airborne jets across oceans in real time? Find out in Part 13! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep13": {
        "num": "EP13",
        "date_code": "25.12.26",
        "folder": "EP13 (25.12.26) - FlightRadar24 Live Airplane Tracking",
        "title_hi": "FlightRadar24: आसमान में उड़ते जहाजों की Live Tracking",
        "title_en": "How Millions Track Airplanes in Real-Time",
        "short_title": "FlightRadar24 Live Airplane Tracking",
        "next_ep": "EP14",
        "next_hook_hi": "हज़ारों hackers एक साथ हमला करें तो website कैसे बचती है? जानिए Part 14 में!",
        "next_hook_en": "How does Cloudflare block 50 million malicious requests per second? Find out in Part 14!",
        "scenes_hi": [
            ("s1_hook", "FlightRadar24 app खोलिए, और आसमान में उड़ते 10,000 planes real-time में अपनी exact speed और altitude के साथ उड़ते दिखेंगे! क्या ये military radar data है?"),
            ("s2_problem", "बिल्कुल नहीं! Governments आम जनता को military primary radar access कभी नहीं देतीं. तो FlightRadar24 को ये global live data मिलता कहाँ से है?"),
            ("s3_adsb_radio", "Commercial airplanes में 'ADS-B' (Automatic Dependent Surveillance-Broadcast) radio transponders लगे होते हैं, जो 1090 MHz frequency पर unencrypted data broadcast करते हैं."),
            ("s4_crowdsourced_receivers", "दुनिया भर के 40,000+ volunteers ने अपनी छतों पर $30 के Raspberry Pi और SDR radio receivers लगा रखे हैं, जो इन radio signals को capture करते हैं!"),
            ("s5_mlat", "जहाँ ADS-B signal weak होता है, वहाँ Multilateration (MLAT) तकनीक से 4 अलग-अलग receivers के Time-Difference of Arrival से position calculate होती है."),
            ("s6_satellite_coverage", "समुद्र के ऊपर जहाँ receivers नहीं होते, वहाँ low-earth orbit Iridium satellites airplane radio packets को relay करती हैं."),
            ("s7_arch_lesson", "IoT architects: Centralized expensive hardware की जगह Decentralized Crowdsourced Edge Receivers से global telemetry network बनाओ!"),
            ("s8_outro", "लेकिन जब लाखों hackers एक साथ हमला करते हैं, तो Cloudflare website को crash होने से कैसे बचाता है? जानिए Part 14 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "Open FlightRadar24, and you can watch 10,000 commercial planes cruising across skies with live altitudes and speeds! Is this classified military radar data?"),
            ("s2_problem", "Governments never expose primary air defense radars to commercial apps. How does FlightRadar24 achieve worldwide real-time flight coverage?"),
            ("s3_adsb_radio", "Every commercial airliner broadcasts its GPS position via unencrypted ADS-B radio transponders pulsing on the 1090 MHz frequency band."),
            ("s4_crowdsourced_receivers", "Over 40,000 aviation enthusiasts worldwide host inexpensive Raspberry Pi receivers and antenna setups on rooftops, capturing live signals!"),
            ("s5_mlat", "Across dead zones, Multilateration (MLAT) calculates aircraft coordinates by measuring the Time-Difference of Arrival across four terrestrial receivers."),
            ("s6_satellite_coverage", "Over remote oceans, constellations of Low Earth Orbit satellites equipped with ADS-B payloads relay coordinates back to cloud pipelines."),
            ("s7_arch_lesson", "IoT architecture rule: Replace brittle, costly centralized infrastructure with decentralized, crowdsourced edge receivers!"),
            ("s8_outro", "How does Cloudflare absorb cyberattacks exceeding 50 million malicious requests per second without blinking? Find out in Part 14! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep14": {
        "num": "EP14",
        "date_code": "27.12.26",
        "folder": "EP14 (27.12.26) - Cloudflare DDoS Shield",
        "title_hi": "Cloudflare DDoS Shield: 50 Million Requests/Sec Block",
        "title_en": "How Anycast Networks Absorb Cyber Attacks",
        "short_title": "Cloudflare DDoS Shield",
        "next_ep": "EP15",
        "next_hook_hi": "Unknown number call करे तो नाम कैसे स्क्रीन पर आ जाता है? जानिए Part 15 में!",
        "next_hook_en": "How does Truecaller reveal unknown caller names before you pick up? Find out in Part 15!",
        "scenes_hi": [
            ("s1_hook", "Hackers ने एक website पर 5 करोड़ requests per second का massive DDoS attack कर दिया! लेकिन website 1 सेकंड के लिए भी slow नहीं हुई! Cloudflare ने ये कैसे किया?"),
            ("s2_problem", "एक normal web server 50,000 requests में crash हो जाता है. 50 million requests का attack internet cables को choke कर सकता है!"),
            ("s3_bgp_anycast", "Cloudflare का secret weapon है 'BGP Anycast Routing'! Cloudflare का एक single IP address दुनिया भर के 330 data centers में एक साथ announce होता है."),
            ("s4_traffic_dilution", "जब attack आता है, तो traffic एक जगह नहीं जाता, बल्कि दुनिया के 330 edge centers में divide होकर diluted हो जाता है."),
            ("s5_ebpf_filtering", "हर edge server के अंदर Linux Kernel में 'eBPF' और XDP packet filters लगे होते हैं, जो malicious packets को OS CPU तक पहुँचे बिना network card पर ही drop कर देते हैं!"),
            ("s6_smart_challenge", "Legitimate users को fast path मिलता है, जबकि suspicious bots को Turnstile CAPTCHA challenge से block कर दिया जाता है."),
            ("s7_arch_lesson", "DevOps engineers: Single server point of failure मत रखो, BGP Anycast और eBPF Kernel Filtering से edge scrubbing pipelines बनाओ!"),
            ("s8_outro", "लेकिन unknown number से call आने पर Truecaller को उसका असली नाम phone ring होने से पहले कैसे पता चलता है? जानिए Part 15 में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "A botnet unleashes a monstrous 50-million-request-per-second DDoS attack against a website, yet the page loads instantly. How does Cloudflare absorb this shock?"),
            ("s2_problem", "Standard web servers choke under 50,000 requests. An onslaught of 50 million packets can saturate regional internet backbones entirely."),
            ("s3_bgp_anycast", "Cloudflare's primary shield is BGP Anycast Routing. A single destination IP address is broadcast simultaneously across over 330 data centers globally."),
            ("s4_traffic_dilution", "Malicious surges never converge on one target; attack volume is automatically dispersed and absorbed locally across hundreds of points of presence."),
            ("s5_ebpf_filtering", "At the edge, Linux Kernel eBPF programs and XDP drivers inspect and drop malicious packets directly on network interface cards before CPU interruption."),
            ("s6_smart_challenge", "Authentic user requests flow unimpeded, while suspicious automation triggers low-friction cryptographic challenges."),
            ("s7_arch_lesson", "Network security axiom: Never scrub malicious floods at your core origin—disperse with Anycast and filter at the kernel edge!"),
            ("s8_outro", "When an unknown number dials your phone, how does Truecaller identify the caller's real name before you even pick up? Find out in Part 15! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep15": {
        "num": "EP15",
        "date_code": "29.12.26",
        "folder": "EP15 (29.12.26) - Truecaller Caller ID Architecture",
        "title_hi": "Truecaller Caller ID Architecture: नंबर का नाम कहाँ से आता है?",
        "title_en": "Crowdsourced Contact Phonebook Graph Engine",
        "short_title": "Truecaller Caller ID Architecture",
        "next_ep": "EP16",
        "next_hook_hi": "31st December की रात 12 बजे WhatsApp crash क्यों नहीं होता? जानिए Season Finale में!",
        "next_hook_en": "Why doesn't WhatsApp crash on New Year's Eve at midnight? Find out in our Season Finale!",
        "scenes_hi": [
            ("s1_hook", "आपको किसी अनजान नंबर से call आया, और phone की screen पर उस इंसान का असली नाम blink करने लगा—भले ही आपने उसका नंबर कभी save न किया हो! ये नाम कहाँ से आया?"),
            ("s2_problem", "Telecom operators user names private रखते हैं. Truecaller के पास किसी सरकारी database का access नहीं है, तो फिर 3 billion numbers का directory data कैसे बना?"),
            ("s3_crowdsourcing", "ये संभव हुआ दुनिया की सबसे बड़ी Crowdsourced Contact Ingestion से! जब कोई user Truecaller install करके permission देता है, तो उसकी पूरी phonebook server पर sync हो जाती है."),
            ("s4_graph_consensus", "अगर 50 अलग-अलग लोगों की phonebook में एक ही number 'Rahul Sharma' save है, तो Graph Consensus Algorithm 'Rahul Sharma' को official display name बना देता है."),
            ("s5_spam_scoring", "जैसे ही multiple users किसी number को 'Spam' या 'Loan Call' report करते हैं, ML classifier उसका Spam Score बढ़ा देता है और स्क्रीन लाल हो जाती है."),
            ("s6_ultra_low_latency", "Ring बजने से पहले नाम दिखाने के लिए Truecaller In-Memory Distributed Key-Value Caches use करता है, जो 100 milliseconds में name query serve करते हैं."),
            ("s7_arch_lesson", "Data engineers: Consensus Graphs और Crowdsourcing से दुनिया का सबसे बड़ा distributed identity graph बनाया जा सकता है!"),
            ("s8_outro", "लेकिन 31st December की रात ठीक 12 बजे जब अरबों लोग एक साथ WhatsApp संदेश भेजते हैं, तो internet crash क्यों नहीं होता? जानिए Season Finale में! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "An unknown phone number rings your mobile, and instantly, the caller's verified name appears on screen—even though you never saved it! Where did that name originate?"),
            ("s2_problem", "Telecom carriers protect subscriber registries, and public directories do not exist. How did Truecaller index over 3 billion active telephone records?"),
            ("s3_crowdsourcing", "The foundation is massive crowdsourced contact ingestion. When users register and grant access, address books sync into central graph clusters."),
            ("s4_graph_consensus", "When dozens of disparate contact books label a phone number as 'Rahul Sharma', a Graph Consensus algorithm establishes it as the verified identity."),
            ("s5_spam_scoring", "Real-time user feedback feeds an ML classifier: spikes in spam tags trigger algorithmic warnings, painting caller IDs bright red."),
            ("s6_ultra_low_latency", "To project caller names before the first ring terminates, globally distributed in-memory key-value stores return queries within 100 milliseconds."),
            ("s7_arch_lesson", "Data architecture lesson: Graph consensus combined with crowdsourced inputs can synthesize global identity intelligence at scale!"),
            ("s8_outro", "Why doesn't global telecom and WhatsApp infrastructure collapse at 12:00 AM on New Year's Eve? Find out in our Season Finale! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    },
    "ep16": {
        "num": "EP16",
        "date_code": "31.12.26",
        "folder": "EP16 (31.12.26) - New Year Midnight Traffic Surge",
        "title_hi": "New Year Midnight 12:00 AM Traffic Surge Masterclass",
        "title_en": "How Global Networks Survive Midnight Traffic Surge",
        "short_title": "New Year Midnight Traffic Surge",
        "next_ep": "Season 2",
        "next_hook_hi": "Connected Season 1 Complete! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!",
        "next_hook_en": "Connected Season 1 Complete! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!",
        "scenes_hi": [
            ("s1_hook", "31st December की रात ठीक 11:59 PM: पूरी दुनिया अपने phones हाथ में लिए countdown गिन रही है! 12:00 AM होते ही billions of messages और calls explode होते हैं! Internet crash क्यों नहीं होता?"),
            ("s2_problem", "ये साल का सबसे predictable लेकिन सबसे खतरनाक Traffic Surge है! WhatsApp, Instagram और Telecom networks पर traffic 10x से 50x spike कर जाता है!"),
            ("s3_pre_warming", "Engineers रात 10 बजे से ही 'Pre-Warming' शुरू कर देते हैं! Auto-scaling pools, Database connection pools और CDN caches को peak capacity पर spin up कर दिया जाता है."),
            ("s4_rate_shedding", "Telecom networks SS7 और Diameter protocols पर Priority Queues use करते हैं. Emergency calls को fast lane मिलता है, जबकि SMS batches queue में delay होते हैं."),
            ("s5_feature_shedding", "WhatsApp server load manage करने के लिए 'Feature Shedding' करता है: Typing indicators और Read Receipts की frequency temporarily throttle कर दी जाती है."),
            ("s6_geo_sharding", "चूँकि New Year midnight अलग-अलग timezones में 1 घंटे के gap पर आता है (India, UAE, UK, US), Cloud load automatically timezone-by-timezone shift होता है!"),
            ("s7_arch_lesson", "System architects: Extreme peaks के लिए Reactive Auto-scaling पर rely मत करो, Pre-Warming और Graceful Feature Degradation use करो!"),
            ("s8_outro", "ये थी हमारी 16-Episode Connected System Architecture Series! RTechLab पर सीखिए practical technology का असली दम! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ],
        "scenes_en": [
            ("s1_hook", "December 31st at 11:59 PM: billions of people countdown simultaneously. The second midnight strikes, messages and calls explode! Why doesn't the internet crash?"),
            ("s2_problem", "It is the most predictable yet catastrophic annual traffic spike on Earth. Messaging volumes surge 10x to 50x within a sixty-second window!"),
            ("s3_pre_warming", "Cloud engineering teams initiate proactive 'Pre-Warming' hours in advance, provisioning thousands of compute pods and warm database connections."),
            ("s4_rate_shedding", "Telecom infrastructure enforces SS7 and Diameter QoS routing, prioritizing emergency voice trunks while queuing background SMS bursts."),
            ("s5_feature_shedding", "Messaging platforms execute graceful feature shedding: non-critical telemetry like typing indicators and read receipts are temporarily throttled."),
            ("s6_geo_sharding", "Because midnight rolls progressively across timezones from Asia to Europe to the Americas, global cloud workloads shift gracefully hour by hour!"),
            ("s7_arch_lesson", "System design masterclass: For predictable extreme surges, never rely on reactive scaling—pre-warm clusters and shed non-essential features!"),
            ("s8_outro", "This concludes Season 1 of our Connected System Architecture series! Technology Made Practical. Follow RTechLab — Learn, Practice, Innovate!")
        ]
    }
}
