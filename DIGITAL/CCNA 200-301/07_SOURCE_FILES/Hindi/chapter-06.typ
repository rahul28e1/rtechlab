#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[अध्याय 06 · सिस्को CLI कमांड्स एवं हार्डनिंग]
= अध्याय 6: प्रोडक्शन सिस्को CLI कमांड्स एवं बेसलाइन हार्डनिंग

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  सिस्को IOS कमांड-लाइन पदानुक्रम में दक्षता: प्रॉम्प्ट नेविगेशन मोड्स, उत्पादकता शॉर्टकट्स, ग्लोबल कॉन्फ़िगरेशन सिंटैक्स, प्रशासनिक पासवर्ड एन्क्रिप्शन, एंटरप्राइज SSH v2 2048-बिट RSA परिनियोजन, कंसोल सुरक्षा, CDP/LLDP नेबर डिस्कवरी, इंटरफेस स्पीड/डुप्लेक्स एवं TFTP डिजास्टर रिकवरी बैकअप व रीस्टोर।
]

#v(2pt)

== 6.1 सिस्को IOS कमांड-लाइन पदानुक्रम एवं नेविगेशन
सिस्को इंटरनेटवर्क ऑपरेटिंग सिस्टम (IOS) आकस्मिक या अनधिकृत परिवर्तनों को रोकने हेतु एक सख्त पदानुक्रमित एक्सेस मॉडल लागू करता है:
- *1. User Exec Mode (`Router>`):* प्रारंभिक अप्रतिबंधित मॉनिटरिंग मोड। केवल बुनियादी निरीक्षण की अनुमति देता है (`ping`, `traceroute`, `show version`)। पूर्ण कॉन्फ़िगरेशन देखने की अनुमति नहीं होती।
- *2. Privileged Exec Mode (`Router#`):* प्रशासनिक मोड, `enable` द्वारा प्रवेश। पूर्ण फाइल निरीक्षण (`show running-config`), फ्लैश प्रबंधन (`dir`, `delete`), डिबगिंग व सिस्टम रीबूट (`reload`) की अनुमति देता है।
- *3. Global Configuration Mode (`Router(config)#`):* सिस्टम-व्यापी कॉन्फ़िगरेशन मोड, `configure terminal` द्वारा प्रवेश। यहां किए गए बदलाव संपूर्ण डिवाइस को प्रभावित करते हैं (होस्टनेम, बैनर्स, रूटिंग)।
- *4. संदर्भ-विशिष्ट सब-कॉन्फ़िगरेशन मोड्स:*
  - *Interface Mode (`Router(config-if)#`):* `interface GigabitEthernet0/0/0` — पोर्ट आईपी, स्पीड, डुप्लेक्स।
  - *Subinterface Mode (`Router(config-subif)#`):* `interface g0/0/0.10` — 802.1Q VLAN टैगिंग एवं आईपी।
  - *Line Configuration Mode (`Router(config-line)#`):* `line console 0` या `line vty 0 4` — कंसोल व टर्मिनल सुरक्षा।
  - *Routing Engine Mode (`Router(config-router)#`):* `router ospf 1` — OSPF एरियाज एवं नेटवर्क्स।

#v(3pt)

== 6.2 आवश्यक सिस्को CLI कीस्ट्रोक्स एवं उत्पादकता शॉर्टकट्स
#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*शॉर्टकट कीस्ट्रोक*], [*CLI कार्य*], [*इंजीनियरिंग उपयोगिता*]),
  [`?` (प्रश्न चिह्न)], [संदर्भ-संवेदनशील सहायता (Help)], [वर्तमान कर्सर स्थिति पर मान्य सभी कीवर्ड्स व पैरामीटर्स की सूची दिखाता है।],
  [`Tab`], [कमांड स्वतः-पूर्णता (Auto-Complete)], [पर्याप्त अक्षर टाइप होने पर अधूरी कमांड को स्वतः पूरा कर देता है।],
  [`Ctrl + A`], [कर्सर को लाइन के आरंभ में ले जाना], [शीघ्र संपादन हेतु तुरंत कमांड के पहले अक्षर पर पहुंचता है।],
  [`Ctrl + E`], [कर्सर को लाइन के अंत में ले जाना], [कमांड लाइन के अंतिम अक्षर पर सीधे पहुंचता है।],
  [`Ctrl + Z` या `end`], [Privileged Mode में वापसी], [किसी भी गहरे सब-मोड से सीधे एक ही झटके में `Router#` पर आता है।],
  [`Ctrl + C`], [कमांड निरस्त करना (Abort)], [चल रहे पिंग, ट्रेसरूट या आउटपुट को बीच में ही रोक देता है।],
  [`Ctrl + Shift + 6`], [ब्रेक सीक्वेंस (Break)], [गलत टाइपिंग पर हैंग हुए DNS ब्रॉडकास्ट को तुरंत तोड़ता है।],
  [`Up Arrow` / `Down Arrow`], [कमांड इतिहास (History)], [सत्र में निष्पादित पिछली 10 कमांड्स को वापस लाता है।]
)

#v(3pt)

== 6.3 बेसलाइन डिवाइस कॉन्फ़िगरेशन एवं पासवर्ड हार्डनिंग
- *DNS लुकअप अक्षम करना:* गलत कमांड टाइप होने पर राउटर उसे होस्टनेम मानकर DNS क्वेरी भेजने लगता है जिससे CLI 30 सेकंड अटक जाती है:
  `Router(config)# no ip domain-lookup`
- *Message of the Day (MOTD) बैनर:* घुसपैठियों को कानूनी चेतावनी देने हेतु:
  `Router(config)# banner motd # AUTHORIZED PERSONNEL ONLY. ALL SESSIONS MONITORED. #`
- *Enable Secret बनाम Enable Password:*
  - `enable password Cisco123`: कमजोर टाइप 7 एन्क्रिप्शन का उपयोग करता है जिसे तुरंत क्रैक किया जा सकता है। #hl[प्रोडक्शन में कभी उपयोग न करें!]
  - `enable secret CiscoSecret2027!`: सुरक्षित क्रिप्टोग्राफिक SHA-256 / MD5 हैश बनाता है।
- *ग्लोबल पासवर्ड एन्क्रिप्शन:*
  `Router(config)# service password-encryption` (रनिंग-कॉन्फिग में सादे पासवर्ड्स को छिपाता है)।

#v(3pt)

== 6.4 हैंड्स-ऑन प्रैक्टिकल लैब: बेसलाइन हार्डनिंग एवं एंटरप्राइज SSH v2
#text(size: 7.5pt, fill: rtech-text)[*उद्देश्य:* सिस्को 2911 राउटर पर बेसलाइन सुरक्षा एवं SSH वर्जन 2 परिनियोजित करना। 2048-बिट RSA कुंजी बनाएं, विशेषाधिकार 15 व्यवस्थापक बनाएं, `logging synchronous` लागू करें और एन्क्रिप्टेड PuTTY एक्सेस सत्यापित करें।]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab01-ssh-topology.svg", width: 95%)
#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*डिवाइस*], [*इंटरफेस*], [*आईपी एड्रेस*], [*सबनेट मास्क*], [*भूमिका / विवरण*],
  [R1-EDGE-CORE], [Gi0/0/0], [192.168.1.1], [255.255.255.0], [मैनेजमेंट गेटवे, SSH सर्वर],
  [Admin-Laptop], [FastEthernet0], [192.168.1.10], [255.255.255.0], [एडमिन पीसी, PuTTY / SSH क्लाइंट],
  [Admin-Laptop], [RS232 (COM)], [N/A (Console)], [N/A], [R1 RJ45 कंसोल की ओर रोलओवर केबल]
)

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[प्रोडक्शन कॉन्फ़िगरेशन स्क्रिप्ट (Copy-Paste Ready):]
```cisco
Router> enable
Router# configure terminal
R1-EDGE-CORE(config)# hostname R1-EDGE-CORE
R1-EDGE-CORE(config)# no ip domain-lookup
R1-EDGE-CORE(config)# banner motd # AUTHORIZED SESSIONS MONITORED. #
R1-EDGE-CORE(config)# enable secret CiscoSecret2027!
R1-EDGE-CORE(config)# service password-encryption
! --- Line Console 0 सुरक्षा ---
R1-EDGE-CORE(config)# line console 0
R1-EDGE-CORE(config-line)# password ConsolePass2027! ; login
R1-EDGE-CORE(config-line)# exec-timeout 5 0 ; logging synchronous ; exit
! --- SSH v2 परिनियोजन ---
R1-EDGE-CORE(config)# ip domain-name rtechlab.internal
R1-EDGE-CORE(config)# crypto key generate rsa modulus 2048
R1-EDGE-CORE(config)# ip ssh version 2
R1-EDGE-CORE(config)# username netadmin privilege 15 secret AdminSecure2027!
R1-EDGE-CORE(config)# line vty 0 4
R1-EDGE-CORE(config-line)# transport input ssh ; login local
R1-EDGE-CORE(config-line)# exec-timeout 10 0 ; logging synchronous ; exit
! --- इंटरफेस सेटअप ---
R1-EDGE-CORE(config)# interface GigabitEthernet0/0/0
R1-EDGE-CORE(config-if)# description MGMT_LAN_INTERFACE
R1-EDGE-CORE(config-if)# ip address 192.168.1.1 255.255.255.0 ; no shutdown
R1-EDGE-CORE(config-if)# end ; copy running-config startup-config
```

#v(2pt)
#terminal-specimen(title: "R1-EDGE-CORE# show ip ssh")[
```text
SSH Enabled - version 2.0
Authentication timeout: 120 secs; Authentication retries: 3
Minimum expected Diffie-Hellman key size : 2048 bits
IOS Keys in SECSH format(ssh-rsa, base64 encoded): rtechlab.internal:2048
R1-EDGE-CORE# show ip interface brief | include up
GigabitEthernet0/0/0       192.168.1.1     YES manual up                    up
```
]

#concept-box(title: "TAC फील्ड इंजीनियरिंग प्रो-टिप: LOGGING SYNCHRONOUS")[
  CLI में टाइप करते समय आकस्मिक सिस्लॉग संदेश आपकी टाइप की जा रही कमांड को बीच में काट देते हैं।
  *समाधान:* सदैव `line con 0` एवं `line vty 0 4` के अंतर्गत `logging synchronous` लागू करें। राउटर सिस्लॉग संदेश के ठीक नीचे आपकी टाइप की जा रही कमांड को नई स्वच्छ लाइन पर पुनः प्रदर्शित कर देता है!
]

#v(3pt)

== 6.5 TFTP द्वारा सिस्को राउटर एवं IOS बैकअप व रीस्टोर
हार्डवेयर विफलता से निपटने हेतु कॉन्फ़िगरेशन एवं IOS इमेजेस का केंद्रीय TFTP सर्वर (UDP पोर्ट 69) पर नियमित बैकअप अनिवार्य है:
- *Cisco IOS इमेज का TFTP पर बैकअप:*
  `Router# copy flash: tftp:`
  `Source filename []? c2900-universalk9-mz.SPA.157-3.M3.bin`
  `Address or name of remote host []? 192.168.1.100`
- *रनिंग कॉन्फ़िगरेशन का बैकअप:*
  `Router# copy running-config tftp:`
  `Address or name of remote host []? 192.168.1.100`
- *TFTP से कॉन्फ़िगरेशन रीस्टोर करना:*
  `Router# copy tftp: startup-config` (NVRAM को डिजास्टर रिकवरी फाइल से ओवरराइट करता है)।

#v(3pt)

== 6.6 नेबर डिस्कवरी: सिस्को CDP बनाम ओपन स्टैंडर्ड LLDP
- *Cisco Discovery Protocol (CDP):* सिस्को प्रोप्रायटरी; डिफ़ॉल्ट रूप से सक्रिय। मल्टीकास्ट `0100.0ccc.cccc` पर प्रत्येक 60 सेकंड में विज्ञापन भेजता है (होल्डटाइम 180s)।
- *Link Layer Discovery Protocol (LLDP - IEEE 802.1AB):* वेंडर-तटस्थ ओपन स्टैंडर्ड; सिस्को पर डिफ़ॉल्ट रूप से बंद रहता है। वैश्विक रूप से चालू करने हेतु:
  `Router(config)# lldp run`

#v(3pt)

== 6.7 इंटरफेस स्पीड, डुप्लेक्स एवं एरर काउंटर्स डायग्नोस्टिक्स
#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*एरर मीट्रिक*], [*भौतिक मूल कारण*], [*इंजीनियरिंग सुधार व विश्लेषण*]),
  [Runts], [64-बाइट न्यूनतम से छोटे फ्रेम्स], [टक्कर (Collisions), खराब NIC ड्राइवर, या विद्युत शोर।],
  [Giants], [1518-बाइट सीमा से बड़े फ्रेम्स], [बिना MTU ट्यूनिंग के जंबो फ्रेम्स भेजना।],
  [CRC Errors], [ईथरनेट ट्रेलर में बिगड़ा हुआ चेकसम], [खराब केबल, त्रुटिपूर्ण RJ45 क्रिम्प, या खराब SFP ऑप्टिकल मॉड्यूल।],
  [Late Collisions], [पहले 64 बाइट्स के बाद होने वाली टक्कर], [#hl[Duplex Mismatch!] एक छोर Half-Duplex और दूसरा Full-Duplex पर सेट है।],
  [Input Errors], [समस्त त्रुटियों का कुल योग], [पैच कॉर्ड बदलें या फाइबर के एंडफेस की सफाई करें।]
)

#v(3pt)

== व्यापक समीक्षा, अक्सर पूछे जाने वाले प्रश्न (FAQs) एवं मूल्यांकन

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. अक्सर पूछे जाने वाले प्रश्न (Student FAQs)]
#faq-item(q: "crypto key generate rsa चलाते समय डोमेन नेम एरर क्यों आता है?", a: "RSA की-पेयर को होस्टनेम और डोमेन नेम को मिलाकर बने FQDN (Fully Qualified Domain Name) की आवश्यकता होती है। 'ip domain-name' के बिना क्रिप्टो इंजन की को लेबल नहीं कर सकता!")
#faq-item(q: "प्रोडक्शन नेटवर्क पर टेलनेट (Telnet) क्यों प्रतिबंधित है?", a: "टेलनेट पासवर्ड्स सहित सारा डेटा बिना एन्क्रिप्शन के सादे टेक्स्ट में भेजता है। Wireshark चलाने वाला कोई भी व्यक्ति इसे कैप्चर कर सकता है। SSH v2 सत्र को पूरी तरह एन्क्रिप्ट रखता है।")
#faq-item(q: "copy run start और write memory में क्या अंतर है?", a: "दोनों बिल्कुल एक ही काम करते हैं: RAM के सक्रिय कॉन्फ़िग को NVRAM में लिखना। 'copy run start' आधिकारिक सिस्को सिंटैक्स है; 'write memory' पुराना शॉर्टकट है।")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. लघु-उत्तरीय समीक्षा प्रश्न]
#short-q(num: 1, q: "इंटरफेस मोड से सीधे privileged EXEC मोड में जाने वाली कमांड क्या है?", ans: "end (या कीस्ट्रोक Ctrl+Z).")
#short-q(num: 2, q: "सुरक्षित SSH वर्जन 2 हेतु अनुशंसित न्यूनतम RSA की-लेंथ क्या है?", ans: "2048 बिट्स।")
#short-q(num: 3, q: "गलत टाइपिंग पर राउटर को DNS लुकअप में हैंग होने से रोकने वाली कमांड क्या है?", ans: "no ip domain-lookup.")
#short-q(num: 4, q: "TFTP फाइल ट्रांसफर हेतु कौन सा UDP पोर्ट उपयोग करता है?", ans: "UDP पोर्ट 69.")
#short-q(num: 5, q: "सिस्को स्विच पर वैश्विक रूप से LLDP सक्षम करने वाली कमांड क्या है?", ans: "lldp run.")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 उच्च-अंक बहुविकल्पीय प्रश्न (MCQs)]
#mcq(num: 1, q: "कौन सा सिस्को प्रॉम्प्ट दर्शाता है कि व्यवस्थापक ग्लोबल कॉन्फ़िगरेशन मोड में है?", a: "Router>", b: "Router#", c: "Router(config)#", d: "Router(config-if)#", ans: "C", expl: "Router(config)# ग्लोबल कॉन्फ़िगरेशन मोड है। Router> यूजर एक्सेक और Router# प्रिविलेज्ड एक्सेक है।")
#mcq(num: 2, q: "कंसोल लाइन पर logging synchronous कमांड का मुख्य प्रभाव क्या है?", a: "कंसोल संदेशों को एन्क्रिप्ट करना", b: "सिस्लॉग संदेश के नीचे टाइप की जा रही कमांड को पुनः साफ प्रदर्शित करना", c: "NTP सर्वर से समय मिलाना", d: "SSH v2 लॉगिंग चालू करना", ans: "B", expl: "Logging synchronous सिस्लॉग आउटपुट को टाइप की जा रही कमांड के बीच में आने से रोकता है।")
#mcq(num: 3, q: "VTY लाइनों पर केवल एन्क्रिप्टेड SSH की अनुमति देने वाली कमांड क्या है?", a: "transport input all", b: "transport input ssh", c: "transport output telnet", d: "line vty ssh only", ans: "B", expl: "transport input ssh केवल सुरक्षित SSH सत्र स्वीकार करता है और टेलनेट को ब्लॉक करता है।")
#mcq(num: 4, q: "सीधे जुड़े पड़ोसी सिस्को डिवाइस का मॉडल व इंटरफेस विवरण देखने वाली कमांड क्या है?", a: "show ip route", b: "show cdp neighbors detail", c: "show ip arp", d: "show running-config", ans: "B", expl: "show cdp neighbors detail पड़ोसी डिवाइस का आईपी, ओएस वर्जन, प्लेटफॉर्म व डुप्लेक्स सेटिंग्स दिखाता है।")
#mcq(num: 5, q: "वर्तमान सक्रिय रनिंग-कॉन्फ़िग को रीबूट के बाद सुरक्षित रखने हेतु कौन सी कमांड चलाते हैं?", a: "copy startup-config running-config", b: "copy running-config startup-config", c: "copy flash: running-config", d: "reload save", ans: "B", expl: "copy running-config startup-config वोलेटाइल रैम से नॉन-वोलेटाइल NVRAM में फाइल लिखता है।")

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "टाइप 7 एन्क्रिप्शन की कमजोरी")[
      `service password-encryption` केवल टाइप 7 एन्क्रिप्शन लगाता है, जिसे सेकंडों में तोड़ा जा सकता है। प्रशासनिक सुरक्षा हेतु सदैव `enable secret` का ही प्रयोग करें!
    ]
  ],
  [
    #tech-spotlight-box(title: "प्रोग्रामेबल नेटवर्किंग 2027")[
      आधुनिक नेटवर्क इंजीनियर्स मैन्युअल CLI के स्थान पर YANG डेटा मॉडल पर आधारित NETCONF (SSH पोर्ट 830) एवं RESTCONF (HTTPS पोर्ट 443) APIs द्वारा ऑटोमेशन करते हैं!
    ]
  ]
)
