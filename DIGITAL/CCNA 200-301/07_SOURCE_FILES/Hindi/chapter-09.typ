#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[अध्याय 09 · IP सर्विसेज एवं नेटवर्क सुरक्षा]
= अध्याय 9: एंटरप्राइज IP सर्विसेज एवं नेटवर्क सुरक्षा

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  एंटरप्राइज आईपी सेवाएं एवं सुरक्षा: DHCP सर्वर पूल्स, DHCP रिले एजेंट (ip helper-address), नेटवर्क एड्रेस ट्रांसलेशन (NAT) एवं पोर्ट एड्रेस ट्रांसलेशन (PAT) ओवरलोड, मानक बनाम विस्तारित एक्सेस कंट्रोल लिस्ट्स (ACLs), तथा स्विचपोर्ट पोर्ट सिक्योरिटी।
]

#v(2pt)

== 9.1 डायनामिक होस्ट कॉन्फ़िगरेशन प्रोटोकॉल (DHCP)
DHCP स्थानीय नेटवर्क पर क्लाइंट कंप्यूटरों को आईपी एड्रेस, सबनेट मास्क, डिफॉल्ट गेटवे और DNS सर्वर गतिशील रूप से आवंटित करता है:
- *4-चरणीय DORA प्रक्रिया:*
  - *1. Discover:* क्लाइंट ब्रॉडकास्ट संदेश (`DHCPDISCOVER`, UDP पोर्ट 67) भेजकर नेटवर्क पर सक्रिय DHCP सर्वर की खोज करता है।
  - *2. Offer:* DHCP सर्वर एक अप्रयुक्त आईपी आरक्षित करता है और क्लाइंट को `DHCPOFFER` (UDP पोर्ट 68) भेजता है।
  - *3. Request:* क्लाइंट ब्रॉडकास्ट `DHCPREQUEST` भेजकर प्रस्तावित आईपी को औपचारिक रूप से स्वीकार करता है।
  - *4. Acknowledge:* सर्वर लीज डेटाबेस में एंट्री दर्ज करता है और लीज की पुष्टि करते हुए `DHCPACK` भेजता है।

#v(2pt)

== 9.2 सिस्को IOS DHCP सर्वर कॉन्फ़िगरेशन एवं रिले एजेंट
सिस्को राउटर शाखा कार्यालयों के लिए एंटरप्राइज DHCP सर्वर के रूप में कार्य कर सकते हैं:
```bash
! --- चरण 1: इंफ्रास्ट्रक्चर के लिए स्टैटिक आईपी अलग रखें ---
Router(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.10
Router(config)# ip dhcp excluded-address 192.168.10.254

! --- चरण 2: DHCP पूल परिभाषित करें ---
Router(config)# ip dhcp pool SALES_LAN
Router(config-dhcp)# network 192.168.10.0 255.255.255.0
Router(config-dhcp)# default-router 192.168.10.1
Router(config-dhcp)# dns-server 8.8.8.8 1.1.1.1
Router(config-dhcp)# domain-name rtechlab.internal
Router(config-dhcp)# lease 7 0 0
```
- *DHCP रिले एजेंट (`ip helper-address`):* राउटर डिफ़ॉल्ट रूप से ब्रॉडकास्ट रोकते हैं, इसलिए क्लाइंट का `DHCPDISCOVER` रिमोट डेटा सेंटर के DHCP सर्वर तक नहीं पहुंच पाता।
  - *समाधान:* क्लाइंट की ओर वाले इंटरफेस पर `ip helper-address` कॉन्फ़िगर करें। राउटर ब्रॉडकास्ट को #hl[यूनिकास्ट पैकेट] में बदलकर सीधे केंद्रीय DHCP सर्वर को भेज देता है:
    `Router(config-if)# ip helper-address 10.1.100.50`

#v(2pt)

== 9.3 नेटवर्क एड्रेस ट्रांसलेशन (NAT) एवं PAT ओवरलोड
RFC 1631 NAT प्राइवेट RFC 1918 पतों को इंटरनेट पर रूटेबल पब्लिक आईपी पतों में बदलकर पब्लिक IPv4 पतों का संरक्षण करता है:
- *NAT शब्दावली (सिस्को फ्रेमवर्क):*
  - *Inside Local:* आंतरिक निजी लैन पर किसी कंप्यूटर को दिया गया प्राइवेट आईपी (उदा. `192.168.1.50`)।
  - *Inside Global:* बाहरी दुनिया के सामने उस आंतरिक कंप्यूटर का प्रतिनिधित्व करने वाला पंजीकृत पब्लिक आईपी (उदा. `203.0.113.5`)।
  - *Outside Local:* आंतरिक नेटवर्क से देखे जाने वाले बाहरी गंतव्य कंप्यूटर का आईपी एड्रेस।
  - *Outside Global:* इंटरनेट पर बाहरी गंतव्य होस्ट का वास्तविक पब्लिक आईपी एड्रेस।
- *पोर्ट एड्रेस ट्रांसलेशन (PAT / NAT Overload):* अनूठे लेयर 4 सोर्स TCP/UDP पोर्ट नंबरों ($> 1024$) को ट्रैक करके हजारों प्राइवेट आईपी को #hl[एकल पब्लिक आईपी] पर मैप करता है।

#pagebreak()

== 9.4 सिस्को IOS PAT ओवरलोड प्रोडक्शन कॉन्फ़िगरेशन
डायनामिक पब्लिक इंटरफेस वाले बॉर्डर राउटर पर PAT ओवरलोड लागू करना:
```bash
! --- चरण 1: प्राइवेट नेटवर्क की पहचान हेतु स्टैंडर्ड ACL बनाएं ---
Router(config)# access-list 1 permit 192.168.10.0 0.0.0.255

! --- चरण 2: बाहर जाने वाले पब्लिक पोर्ट पर NAT ओवरलोड लगाएं ---
Router(config)# ip nat inside source list 1 interface GigabitEthernet0/0/1 overload

! --- चरण 3: इनसाइड और आउटसाइड इंटरफेस निर्दिष्ट करें ---
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ip nat inside
Router(config)# interface GigabitEthernet0/0/1
Router(config-if)# ip nat outside
```
- *सत्यापन कमांड:* `show ip nat translations` — सक्रिय ट्रांसलेशन टेबल दिखाता है जिसमें प्रोटोकॉल, Inside Local:Port, Inside Global:Port और Outside Global:Port शामिल हैं।
- *सत्र खाली करना:* `clear ip nat translation *` — सभी सक्रिय डायनामिक NAT सत्रों को मेमोरी से साफ करता है।

#v(2pt)

== 9.5 एक्सेस कंट्रोल लिस्ट्स (ACLs): स्टैंडर्ड बनाम एक्सटेंडेड
एक्सेस कंट्रोल लिस्ट सुरक्षा नीतियां लागू करने के लिए राउटर इंटरफेस पर ट्रैफिक को फ़िल्टर करती हैं:
#table(
  columns: (1.1fr, 1.2fr, 1.3fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*ACL प्रकार*], [*संख्या श्रेणी*], [*फ़िल्टरिंग मानदंड*], [*प्लेसमेंट का स्वर्णिम नियम*]),
  [स्टैंडर्ड ACL], [1–99 एवं 1300–1999], [केवल सोर्स आईपी एड्रेस], [हमेशा #hl[गंतव्य (Destination)] के निकटतम लगाएं ताकि अन्य वैध ट्रैफिक गलती से न रुके।],
  [एक्सटेंडेड ACL], [100–199 एवं 2000–2699], [प्रोटोकॉल, सोर्स IP/पोर्ट, गंतव्य IP/पोर्ट], [हमेशा #hl[स्रोत (Source)] के निकटतम लगाएं ताकि अवांछित पैकेट शुरू में ही रुक जाएं।]
)

#v(2pt)

#photo-card(
  "../03_VISUAL_ASSETS/authentic-hardware-photographs/hardware-security-yubikey.jpg",
  caption: "चित्र 9.1: हार्डवेयर प्रमाणीकरण और स्टेटफुल ACLs लागू करती एंटरप्राइज सुरक्षा परिधि।",
  height: 52pt
)

#v(2pt)

== 9.6 एक्सटेंडेड ACL सिंटेक्स एवं इम्प्लिसिट डिनाई नियम
- *अदृश्य इम्प्लिसिट डिनाई (Implicit Deny):* प्रत्येक ACL के अंत में एक गुप्त अंतिम नियम होता है: #hl[`deny ip any any`]। यदि कोई पैकेट ऊपर के किसी परमिट नियम से मेल नहीं खाता, तो उसे चुपचाप छोड़ दिया जाता है! इसलिए कम से कम एक `permit` नियम अनिवार्य है।
- *एक्सटेंडेड ACL सिंटेक्स उदाहरण:* सबनेट `192.168.10.0/24` को अकाउंटिंग सर्वर `10.1.1.5` पर HTTP (80) और HTTPS (443) से रोकें, बाकी सब चलने दें:
  ```bash
  Router(config)# access-list 101 deny tcp 192.168.10.0 0.0.0.255 host 10.1.1.5 eq 80
  Router(config)# access-list 101 deny tcp 192.168.10.0 0.0.0.255 host 10.1.1.5 eq 443
  Router(config)# access-list 101 permit ip any any
  Router(config)# interface GigabitEthernet0/0/0
  Router(config-if)# ip access-group 101 in
  ```

#pagebreak()

== 9.7 स्विच पोर्ट सिक्योरिटी एवं MAC एड्रेस नियंत्रण
पोर्ट सिक्योरिटी एंटरप्राइज स्विचों को MAC फ्लडिंग हमलों और अनधिकृत कंप्यूटरों से बचाती है:
- *पोर्ट पूर्व-शर्त:* पोर्ट सिक्योरिटी केवल स्टेटिक #hl[एक्सेस पोर्ट्स पर ही सक्षम] की जा सकती है (`switchport mode access` अनिवार्य है)।
- *MAC सीखने के तरीके:*
  - *मैन्युअल:* `switchport port-security mac-address 0011.2233.4455` (स्थायी)।
  - *स्टिकी लर्निंग:* जुड़े हुए MAC को स्वतः सीखकर `running-config` में सहेजता है: `switchport port-security mac-address sticky`।
- *उल्लंघन (Violation) मोड्स:* जब अनधिकृत कंप्यूटर जुड़ता है या सीमा पार होती है:

#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*उल्लंघन मोड*], [*फ्रेम ड्रॉप?*], [*अलर्ट भेजता है?*], [*पोर्ट स्थिति एवं परिचालन प्रभाव*]),
  [Protect], [हाँ], [नहीं], [अनधिकृत MAC के फ्रेम छोड़ता है। पोर्ट चालू रहता है (`up/up`)। कोई अलर्ट नहीं।],
  [Restrict], [हाँ], [हाँ (Syslog + SNMP)], [फ्रेम छोड़ता है, काउंटर बढ़ाता है, सिजलॉग भेजता है। पोर्ट चालू रहता है।],
  [Shutdown], [हाँ], [हाँ (Syslog + SNMP)], [#hl[पोर्ट को तुरंत err-disabled में बंद कर देता है]! पोर्ट की बत्ती ठोस एम्बर हो जाती है।]
)

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #concept-box(title: "Err-Disabled पोर्ट को चालू करना")[
      जब पोर्ट सिक्योरिटी किसी पोर्ट को बंद कर दे:      1. अनधिकृत उपकरण को केबल से अलग करें।      2. शटडाउन कमांड दें: `Switch(config-if)# shutdown`      3. पोर्ट पुनः चालू करें: `Switch(config-if)# no shutdown`      या स्वचालित रिकवरी कॉन्फ़िगर करें:      `Switch(config)# errdisable recovery cause psecure-violation`
    ]
  ],
  [
    #concept-box(title: "वाइल्डकार्ड मास्क इनवर्जन")[
      एक विशिष्ट होस्ट के लिए वाइल्डकार्ड:      `host 192.168.1.50` $arrow$ #hl[`192.168.1.50 0.0.0.0`]      किसी भी पते से मेल खाने हेतु:      `any` $arrow$ #hl[`0.0.0.0 255.255.255.255`]      /27 सबनेट ($255.255.255.224$) हेतु:      $255.255.255.255 - 255.255.255.224 = #hl[0.0.0.31]$
    ]
  ]
)

#v(2pt)

== 9.8 प्रोडक्शन पोर्ट सिक्योरिटी कॉन्फ़िगरेशन
```bash
Switch(config)# interface FastEthernet0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport port-security
Switch(config-if)# switchport port-security maximum 2
Switch(config-if)# switchport port-security mac-address sticky
Switch(config-if)# switchport port-security violation restrict
Switch# show port-security interface FastEthernet0/1
```

#pagebreak()

== व्यापक अध्याय समीक्षा, FAQs एवं स्व-मूल्यांकन

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. अक्सर पूछे जाने वाले प्रश्न (Student FAQs)]
#faq-item(q: "स्टैंडर्ड ACL को गंतव्य के निकटतम क्यों लगाना चाहिए?", a: "स्टैंडर्ड ACL केवल सोर्स आईपी के आधार पर फ़िल्टर करती है। यदि इसे स्रोत के पास लगा दिया जाए, तो यह उस कंप्यूटर को अन्य सभी वैध सर्वरों तक पहुंचने से भी गलती से रोक देगी।")
#faq-item(q: "NAT और PAT (पोर्ट एड्रेस ट्रांसलेशन) में क्या अंतर है?", a: "मानक NAT एक प्राइवेट आईपी को एक पब्लिक आईपी में बदलता है (1-to-1)। PAT अद्वितीय पोर्ट नंबरों (>1024) का उपयोग करके कई प्राइवेट कंप्यूटरों को एक ही पब्लिक आईपी पर चलाता है।")
#faq-item(q: "PAT में राउटर को कैसे पता चलता है कि वेब पेज किस कंप्यूटर ने मांगा था?", a: "राउटर अपनी NAT टेबल में एक सत्र प्रविष्टि रखता है, जो आंतरिक कंप्यूटर के प्राइवेट आईपी और पोर्ट को अपने बाहरी इंटरफेस के एक अनूठे पब्लिक पोर्ट से जोड़ती है।")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. लघु-उत्तरीय समीक्षा प्रश्न]
#short-q(num: 1, q: "क्लाइंट DHCP प्रक्रिया के 4 क्रमिक चरणों के नाम बताएं।", ans: "DORA: Discover, Offer, Request, Acknowledge।")
#short-q(num: 2, q: "क्लाइंट DHCP ब्रॉडकास्ट को रिमोट सर्वर तक भेजने वाली सिस्को कमांड क्या है?", ans: "ip helper-address [server-ip]।")
#short-q(num: 3, q: "क्लासिक स्टैंडर्ड IPv4 ACL की संख्या श्रेणी क्या है?", ans: "1 से 99 और 1300 से 1999।")
#short-q(num: 4, q: "कौन सा पोर्ट सिक्योरिटी मोड उल्लंघन होने पर पोर्ट को err-disabled में बंद कर देता है?", ans: "Shutdown मोड।")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 उच्च-प्राथमिकता बहुविकल्पीय प्रश्न (MCQs)]
#mcq(num: 1, q: "प्रत्येक सिस्को एक्सेस कंट्रोल लिस्ट के अंत में कौन सा नियम छिपा होता है?", a: "permit ip any any", b: "deny ip any any (Implicit Deny)", c: "log any", d: "permit tcp any any eq 80", ans: "B", expl: "सभी सिस्को ACLs के अंत में एक गुप्त 'deny all' होता है; जो पैकेट किसी नियम से मेल नहीं खाता, वह ड्रॉप हो जाता है।")
#mcq(num: 2, q: "इंटरनेट पर किसी आंतरिक प्राइवेट कंप्यूटर का प्रतिनिधित्व करने वाला पंजीकृत पब्लिक आईपी क्या कहलाता है?", a: "Inside Local", b: "Inside Global", c: "Outside Local", d: "Outside Global", ans: "B", expl: "Inside Global वह पब्लिक आईपी है जो बाहरी दुनिया के सामने आंतरिक कंप्यूटर की पहचान बनता है।")
#mcq(num: 3, q: "कौन सा पोर्ट सिक्योरिटी विकल्प सीखे गए MAC को स्वतः running-config में सहेजता है?", a: "mac-address dynamic", b: "mac-address sticky", c: "mac-address persistent", d: "mac-address auto", ans: "B", expl: "'switchport port-security mac-address sticky' सीखे गए मैक को सीधे रनिंग कॉन्फ़िगरेशन में लिख देता है।")
#mcq(num: 4, q: "अधिकतम नेटवर्क दक्षता के लिए एक्सटेंडेड ACL को कहाँ लगाया जाना चाहिए?", a: "गंतव्य के निकटतम", b: "ट्रैफिक के स्रोत (Source) के निकटतम", c: "केवल कोर स्विच पर", d: "DHCP सर्वर पर", ans: "B", expl: "एक्सटेंडेड ACL गंतव्य आईपी और पोर्ट जानती है, इसलिए इसे स्रोत के पास लगाने से अवांछित पैकेट पहले ही रुक जाते हैं।")
#mcq(num: 5, q: "DHCP लीज बातचीत के दौरान क्लाइंट और सर्वर किन UDP पोर्ट्स का उपयोग करते हैं?", a: "क्लाइंट UDP 67, सर्वर UDP 68", b: "क्लाइंट UDP 68, सर्वर UDP 67", c: "क्लाइंट TCP 53, सर्वर TCP 53", d: "क्लाइंट UDP 161, सर्वर UDP 162", ans: "B", expl: "क्लाइंट सोर्स UDP पोर्ट 68 से सर्वर के डेस्टिनेशन UDP पोर्ट 67 पर संदेश भेजता है।")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "एफ़ेमरल पोर्ट पूल")[
      PAT एक पब्लिक आईपी पर 64,512 समवर्ती कनेक्शनों (पोर्ट 1024 से 65535) का समर्थन कर सकता है!
    ]
  ],
  [
    #tech-spotlight-box(title: "जीरो ट्रस्ट नेटवर्क एक्सेस (ZTNA)")[
      आधुनिक एंटरप्राइज सुरक्षा स्टेटिक ACLs से आगे बढ़कर जीरो ट्रस्ट पहचान-आधारित नीतियों को अपना रही है।
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "hi")
