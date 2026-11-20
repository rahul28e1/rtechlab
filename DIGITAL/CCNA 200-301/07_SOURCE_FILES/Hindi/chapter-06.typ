#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[अध्याय 06 · सिस्को CLI एवं डिजास्टर रिकवरी]
= अध्याय 6: सिस्को IOS CLI मोड्स, पासवर्ड रिकवरी (0x2142) एवं TFTP रिकवरी

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  सिस्को IOS CLI मोड्स एवं नेविगेशन, बुनियादी सिक्योरिटी हार्डनिंग, ROMMON confreg 0x2142 द्वारा चरणबद्ध पासवर्ड रिकवरी, एवं TFTP बैकअप तथा रिस्टोरेशन वर्कफ्लो।
]

#v(2pt)

== 6.1 सिस्को IOS CLI कमांड पदानुक्रम (Command Hierarchy)
सिस्को IOS कमांड निष्पादन को एक सख्त अनुमति पदानुक्रम में व्यवस्थित करता है:
- *User EXEC मोड (`Router>`):* केवल रीड-ओनली बुनियादी निगरानी। पिंग, ट्रेसरूट और सीमित शो कमांड्स की अनुमति।
- *Privileged EXEC मोड (`Router#`):* प्रशासनिक नियंत्रण। `enable` द्वारा प्रवेश। कॉन्फ़िगरेशन देखना (`show running-config`), फाइल प्रबंधन, डिबगिंग और रीलोड।
- *Global Configuration मोड (`Router(config)#`):* सिस्टम-व्यापी पैरामीटर्स। `configure terminal` द्वारा प्रवेश।
- *Interface Configuration सबमोड (`Router(config-if)#`):* विशिष्ट पोर्ट पैरामीटर्स (IP एड्रेस, स्पीड, डुप्लेक्स)।
- *Line Configuration सबमोड (`Router(config-line)#`):* प्रबंधन लाइन्स (`line console 0`, `line vty 0 4`)।

#v(2pt)

== 6.2 आवश्यक सिक्योरिटी हार्डनिंग कॉन्फ़िगरेशन
#terminal-box([
```cisco
Router(config)# hostname Edge-RTR
Edge-RTR(config)# enable algorithm-type sha256 secret Cisco#123Secure!
Edge-RTR(config)# service password-encryption
Edge-RTR(config)# banner motd # AUTHORIZED ACCESS ONLY - VIOLATORS PROSECUTED #
Edge-RTR(config)# line console 0
Edge-RTR(config-line)# password ConsolePass#1
Edge-RTR(config-line)# login
Edge-RTR(config-line)# logging synchronous
Edge-RTR(config-line)# exec-timeout 5 0
Edge-RTR(config)# ip domain-name rtechlab.lan
Edge-RTR(config)# crypto key generate rsa modulus 2048
Edge-RTR(config)# ip ssh version 2
Edge-RTR(config)# username admin privilege 15 secret AdminPass#2027
Edge-RTR(config)# line vty 0 4
Edge-RTR(config-line)# transport input ssh
Edge-RTR(config-line)# login local
```
])

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab01-ssh-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[चित्र 6.1: पैकेट ट्रेसर लैब 01 — सुरक्षित आउट-ऑफ-बैंड SSH मैनेजमेंट टोपोलॉजी।]
]

#pagebreak()

== 6.3 चरणबद्ध पासवर्ड रिकवरी प्रक्रिया (सटीक CLI प्रॉम्प्ट्स)
जब प्रशासनिक पासवर्ड खो जाए, तो राउटर की प्रोडक्शन सेटिंग्स खोए बिना पासवर्ड रिकवर करने की विधि:
- *चरण 1: भौतिक कंसोल कनेक्शन:* PC के COM/USB पोर्ट से राउटर कंसोल पोर्ट में रोलओवर केबल जोड़ें। PuTTY में `9600-8-N-1` सेट करें।
- *चरण 2: बूट अनुक्रम को बाधित करना:* राउटर को पावर ऑफ करके ऑन करें। बूटिंग के पहले 60 सेकंड के अंदर `Break` (या PuTTY में `Ctrl+Break`) दबाकर ROMMON मोड में प्रवेश करें।
- *चरण 3: कॉन्फ़िगरेशन रजिस्टर संशोधित करना:*
  `rommon 1 >` प्रॉम्प्ट पर राउटर को निर्देश दें कि अगली बूटिंग पर NVRAM startup-config को छोड़ दे:
  #terminal-box([
```cisco
rommon 1 > confreg 0x2142
rommon 2 > reset
```
  ])
- *चरण 4: प्रारंभिक सेटअप डायलॉग को छोड़ना:*
  राउटर डिफ़ॉल्ट रूप से बूट होगा। पूछे जाने पर `no` टाइप करें:
  `Would you like to enter the initial configuration dialog? [yes/no]: no`
- *चरण 5: प्रिविलेज्ड मोड एवं कॉन्फ़िगरेशन रिस्टोर:*
  #hl[अति महत्वपूर्ण: पहले 'configure terminal' न लिखें!] NVRAM से startup-config को RAM में कॉपी करें ताकि सभी IP एड्रेसेस सुरक्षित रहें:
  #terminal-box([
```cisco
Router> enable
Router# copy startup-config running-config
```
  ])
- *चरण 6: नया पासवर्ड सेट करना एवं इंटरफेस चालू करना:*
  #terminal-box([
```cisco
Edge-RTR# configure terminal
Edge-RTR(config)# enable secret NewMasterPassword#2027
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# no shutdown
```
  ])
- *चरण 7: कॉन्फ़िगरेशन रजिस्टर को पुनः सामान्य (0x2102) करना:*
  #hl[अनिवार्य चरण: यदि यह भूल गए, तो राउटर हर रीबूट पर अपनी कॉन्फ़िगरेशन भूल जाएगा!]
  #terminal-box([
```cisco
Edge-RTR(config)# config-register 0x2102
Edge-RTR(config)# exit
Edge-RTR# copy running-config startup-config
Edge-RTR# reload
```
  ])

#v(2pt)

== 6.4 TFTP सर्वर बैकअप एवं डिजास्टर रिकवरी
#table(
  columns: (1.5fr, 4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*डिजास्टर रिकवरी कार्य*], [*प्रोडक्शन सिस्को IOS CLI कमांड*]),
  [रनिंग कॉन्फ़िगरेशन का TFTP बैकअप], [`Edge-RTR# copy running-config tftp://192.168.1.50/Edge-RTR-cfg-backup`],
  [TFTP से रनिंग कॉन्फ़िगरेशन रिस्टोर], [`Edge-RTR# copy tftp://192.168.1.50/Edge-RTR-cfg-backup running-config`],
  [फ्लैश से IOS इमेज का TFTP बैकअप], [`Edge-RTR# copy flash:c2900-universalk9-mz.bin tftp://192.168.1.50/`],
  [TFTP से नई IOS इमेज फ्लैश करना], [`Edge-RTR# copy tftp://192.168.1.50/c2900-universalk9-mz.bin flash:`],
  [IOS फाइल MD5 चेकसम सत्यापन], [`Edge-RTR# verify /md5 flash:c2900-universalk9-mz.bin`]
)

#pagebreak()

== छात्र तकनीकी प्रश्नोत्तरी (Student Technical FAQs)
#faq-box("पासवर्ड रिकवरी में 'copy startup running' की जगह 'configure terminal' कर दें तो क्या होगा?", "सीधे ग्लोबल कॉन्फ़िगरेशन में जाने से RAM में एक खाली फाइल बन जाएगी। यदि आप इसे सेव कर देंगे, तो NVRAM की पूरी प्रोडक्शन कॉन्फ़िगरेशन हमेशा के लिए नष्ट हो जाएगी!")
#faq-box("पासवर्ड रिकवरी के बाद इंटरफेसेस को मैन्युअल 'no shutdown' क्यों करना पड़ता है?", "जब बाईपास मोड में startup-config को running-config में लोड किया जाता है, तो सिस्को IOS सुरक्षा कारणों से सभी इंटरफेसेस को administratively down कर देता है।")
#faq-box("'enable password' और 'enable secret' में क्या अंतर है?", "'enable password' कमजोर रिवर्सिबल टाइप 7 एन्क्रिप्शन का उपयोग करता है। 'enable secret' मजबूत इरिवर्सिबल टाइप 5 (MD5) या टाइप 9 (SHA-256) हैश का उपयोग करता है।")

#v(2pt)

== लघु-उत्तरीय तकनीकी समीक्षा (Short-Answer Review)
1. *सिस्को IOS पर SSH हेतु 2048-बिट RSA कीज जनरेट करने की कमांड बताइए:* `crypto key generate rsa modulus 2048`।
2. *startup-config को अनदेखा करने हेतु सटीक ROMMON कमांड क्या है?* `confreg 0x2142`।
3. *पासवर्ड रिकवरी के अंत में 'config-register 0x2102' क्यों अनिवार्य है?* सामान्य बूट मोड वापस लाने के लिए ताकि भविष्य के रीबूट्स पर राउटर NVRAM से कॉन्फ़िगरेशन लोड करे।
4. *लाइन कंसोल 0 के तहत 'logging synchronous' का क्या कार्य है?* यह सिस्टम संदेशों को उस कमांड लाइन को काटने से रोकता है जिसे इंजीनियर वर्तमान में टाइप कर रहा होता है।

#v(2pt)

== उच्च-प्राथमिकता परीक्षा बहुविकल्पीय प्रश्न (Exam MCQs)
#mcq-item(
  "एक इंजीनियर कंसोल से जुड़ा है और उसे ROMMON में जाना है। क्या करना चाहिए?",
  ("पावर ऑन करने के 60 सेकंड के भीतर Break सिग्नल भेजें", "मोड बटन 30 सेकंड दबाएं", "'reload --rommon' टाइप करें", "फ्लैश से IOS इमेज डिलीट करें"),
  0,
  "बूटिंग के दौरान टर्मिनल एम्युलेटर से Break सिग्नल भेजने पर बूटस्ट्रैप रुक जाता है और राउटर ROMMON में आ जाता है।"
)

#mcq-item(
  "कौन सी कमांड कॉन्फ़िगरेशन फाइल के सभी मौजूदा प्लेनटेक्स्ट पासवर्ड्स को टाइप 7 हैश द्वारा छुपाती है?",
  ("enable secret", "service password-encryption", "crypto key generate rsa", "ip ssh version 2"),
  1,
  "'service password-encryption' सभी प्लेनटेक्स्ट पासवर्ड्स को टाइप 7 एल्गोरिदम से अस्पष्ट कर देती है।"
)

#mcq-item(
  "पासवर्ड रिकवरी में पासवर्ड बदलने के बाद रीलोड करने से पहले नया पासवर्ड स्थायी करने हेतु कौन सी कमांड दी जाती है?",
  ("copy startup-config running-config", "copy running-config startup-config", "erase startup-config", "write memory erase"),
  1,
  "'copy running-config startup-config' नए पासवर्ड और रिस्टोर की गई सेटिंग्स को NVRAM में स्थायी रूप से सेव करता है।"
)

#v(2pt)

== क्या आप जानते हैं? एवं 2027 टेक्नोलॉजी स्पॉटलाइट
#fact-box("क्या आप जानते हैं? सिस्को टाइप 7 पासवर्ड कभी सुरक्षित क्यों नहीं होते", "सिस्को टाइप 7 एन्क्रिप्शन एक निश्चित XOR की का उपयोग करता है जिसे 1995 में क्रैक कर लिया गया था। किसी भी टाइप 7 हैश को ऑनलाइन डिकोडर से 0.001 सेकंड में खोला जा सकता है। हमेशा टाइप 9 (SHA-256) का प्रयोग करें।")

#spotlight-box("2027 टेक स्पॉटलाइट: जीरो टच प्रोविजनिंग (ZTP)", "आधुनिक एंटरप्राइज नेटवर्क्स में नए हार्डवेयर को कॉन्फ़िगर करने हेतु कंसोल केबल की आवश्यकता नहीं होती। Cisco ZTP तकनीक DHCP Option 43 और Python स्क्रिप्ट्स के जरिए क्लाउड से स्वतः कॉन्फ़िगरेशन डाउनलोड कर लेती है।")
