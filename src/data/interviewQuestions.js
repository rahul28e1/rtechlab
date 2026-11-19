export const interviewQuestionsData = [
  {
    id: "q1",
    category: "CCNA & Networking",
    difficulty: "High Yield",
    difficultyHi: "महत्वपूर्ण प्रश्न",
    question: "What is the exact sequence of the TCP Three-Way Handshake, and what happens if the ACK packet is dropped?",
    questionHi: "TCP थ्री-वे हैंडशेक का सही क्रम क्या है, और यदि अंतिम ACK पैकेट खो जाता है तो क्या होता है?",
    answer: "The TCP 3-way handshake establishes a reliable full-duplex session: 1) SYN (Client sends initial sequence number ISN_c), 2) SYN-ACK (Server acknowledges with ACK = ISN_c + 1 and sends its own ISN_s), 3) ACK (Client acknowledges with ACK = ISN_s + 1). If the client's final ACK is lost in transit, the server remains in SYN_RECEIVED state and will retransmit its SYN-ACK packet based on the retransmission timer (RTO) until timeout or until data arrives with the piggybacked ACK.",
    answerHi: "TCP 3-वे हैंडशेक एक विश्वसनीय कनेक्शन स्थापित करता है: 1) SYN (क्लाइंट ISN भेजता है), 2) SYN-ACK (सर्वर पुष्टि करता है और अपना अनुक्रम नंबर भेजता है), 3) ACK (क्लाइंट पुष्टि करता है)। यदि अंतिम ACK खो जाता है, तो सर्वर SYN_RECEIVED स्थिति में रहता है और टाइमर समाप्त होने तक SYN-ACK को पुनः प्रेषित करता है।",
    command: "sudo tcpdump -nn -i eth0 'tcp[tcpflags] & (tcp-syn|tcp-ack) != 0'"
  },
  {
    id: "q2",
    category: "Linux Administration",
    difficulty: "Scenario Based",
    difficultyHi: "परिदृश्य आधारित",
    question: "A Linux web server returns 'No space left on device', but 'df -h' shows 40% disk space free. What is the root cause and how do you resolve it?",
    questionHi: "लिनक्स वेब सर्वर 'No space left on device' दिखाता है, लेकिन 'df -h' पर 40% डिस्क स्पेस खाली है। इसका मुख्य कारण क्या है और इसे कैसे ठीक करें?",
    answer: "The filesystem has exhausted its available Inodes (file metadata pointers), even though storage blocks remain available. This commonly occurs when millions of tiny session files, temporary socket files, or unswept spool logs fill the inode table. Verify by running 'df -i' to inspect inode utilization. Locate offending directories using 'find /var/spool /tmp -type f | wc -l' and clean up stale temporary files.",
    answerHi: "फाइलसिस्टम में इनोड्स (Inodes - फ़ाइल मेटाडेटा पॉइंटर्स) समाप्त हो गए हैं, भले ही डिस्क स्पेस बचा हो। यह अक्सर तब होता है जब लाखों छोटी फाइल्स (जैसे सेशन्स या टेम्प फ़ाइलें) इनोड टेबल को भर देती हैं। 'df -i' चलाकर इसकी जांच करें।",
    command: "df -i && find / -xdev -printf '%h\\n' | sort | uniq -c | sort -k 1 -nr | head -10"
  },
  {
    id: "q3",
    category: "CCNA & Switching",
    difficulty: "Core Cisco",
    difficultyHi: "कोर सिस्को",
    question: "Explain the difference between a Collision Domain and a Broadcast Domain, and how Routers vs Switches segment them.",
    questionHi: "कोलिजन डोमेन और ब्रॉडकास्ट डोमेन के बीच अंतर स्पष्ट करें, और राउटर एवं स्विच उन्हें कैसे अलग करते हैं?",
    answer: "A Collision Domain is a network segment where simultaneous frame transmissions collide (half-duplex). Standard switches create a separate collision domain on EACH physical port. A Broadcast Domain is the boundary where a broadcast frame (FF:FF:FF:FF:FF:FF) propagates. Switches forward broadcasts out all ports in the same VLAN. Routers block broadcasts by default, breaking broadcast domains at Layer 3 (or switches via distinct VLAN IDs).",
    answerHi: "कोलिजन डोमेन वह सेगमेंट है जहाँ दो डिवाइस एक साथ डेटा भेजने पर टकराव हो सकता है। स्विच का प्रत्येक पोर्ट एक अलग कोलिजन डोमेन होता है। ब्रॉडकास्ट डोमेन वह क्षेत्र है जहाँ ब्रॉडकास्ट पैकेट फैलता है। राउटर ब्रॉडकास्ट डोमेन को अलग करते हैं, जबकि स्विच केवल VLAN के माध्यम से इसे अलग करते हैं।",
    command: "show mac address-table dynamic && show vlan brief"
  },
  {
    id: "q4",
    category: "Cyber Security & SOC",
    difficulty: "Enterprise SOC",
    difficultyHi: "एंटरप्राइज SOC",
    question: "What is an ARP Poisoning (Man-in-the-Middle) attack, and what switch feature mitigates it in an enterprise network?",
    questionHi: "ARP पॉइज़निंग (MITM) हमला क्या है, और एंटरप्राइज़ स्विच में कौन सा फ़ीचर इसे रोकता है?",
    answer: "ARP Poisoning occurs when an attacker broadcasts gratuitous ARP replies associating their MAC address with the IP address of the Default Gateway or target host, causing legitimate traffic to be routed through the attacker's machine. The enterprise mitigation on Cisco switches is Dynamic ARP Inspection (DAI), which validates ARP packets against the DHCP Snooping binding database to discard spoofed ARP replies on untrusted ports.",
    answerHi: "ARP पॉइज़निंग में हमलावर फर्जी ARP संदेश भेजकर अपने MAC एड्रेस को डिफॉल्ट गेटवे के IP से जोड़ देता है। सिस्को स्विचेस पर इससे बचाव के लिए 'Dynamic ARP Inspection (DAI)' और 'DHCP Snooping' सक्षम किया जाता है।",
    command: "ip arp inspection vlan 10 && ip dhcp snooping"
  },
  {
    id: "q5",
    category: "Cloud & Hardware",
    difficulty: "Infrastructure",
    difficultyHi: "इन्फ्रास्ट्रक्चर",
    question: "Explain the practical difference between RAID 1, RAID 5, and RAID 10 in terms of performance, fault tolerance, and usable storage overhead.",
    questionHi: "परफॉर्मेंस, फॉल्ट टॉलरेंस और स्टोरेज क्षमता के संदर्भ में RAID 1, RAID 5 और RAID 10 के बीच क्या अंतर है?",
    answer: "RAID 1 (Mirroring) requires 2 disks, tolerates 1 drive failure, and offers 50% capacity with fast read performance. RAID 5 (Distributed Parity) requires minimum 3 disks, tolerates 1 drive failure, capacity = (N-1), but suffers a write penalty due to parity calculation. RAID 10 (Striped Mirrors) requires minimum 4 disks, can tolerate multiple failures (as long as not both drives in the same mirror pair), offers 50% capacity, and delivers top tier random I/O read/write performance for databases.",
    answerHi: "RAID 1 दो डिस्क्स को मिरर करता है (50% क्षमता)। RAID 5 में कम से कम 3 ड्राइव चाहिए और 1 ड्राइव फेलियर को सहन कर सकता है (N-1 क्षमता)। RAID 10 (1+0) में न्यूनतम 4 ड्राइव लगती हैं और यह उच्च परफॉर्मेंस एवं सुरक्षा प्रदान करता है।",
    command: "cat /proc/mdstat && sudo mdadm --detail /dev/md0"
  }
];
