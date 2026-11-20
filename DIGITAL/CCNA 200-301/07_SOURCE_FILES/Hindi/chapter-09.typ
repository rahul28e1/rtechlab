#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[अध्याय 09 · IP सेवाएं एवं नेटवर्क सुरक्षा]
= अध्याय 9: एंटरप्राइज IP सेवाएं एवं नेटवर्क सुरक्षा

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  एंटरप्राइज बुनियादी ढांचा सेवाएं एवं सुरक्षा: डायनामिक होस्ट कॉन्फ़िगरेशन प्रोटोकॉल (DHCP) सर्वर पूल्स एवं रिले एजेंट्स (`ip helper-address`), नेटवर्क एड्रेस ट्रांसलेशन (NAT) एवं पोर्ट एड्रेस ट्रांसलेशन (PAT) ओवरलोड, स्टैंडर्ड एवं एक्सटेंडेड एक्सेस कंट्रोल लिस्ट्स (ACLs), नेटवर्क टाइम प्रोटोकॉल (NTP), सिस्लॉग लॉगिंग स्तर, SNMP v3, तथा फर्स्ट हॉप रिडंडेंसी प्रोटोकॉल्स (HSRP/VRRP)।
]

#v(1pt)

== 9.1 डायनामिक होस्ट कॉन्फ़िगरेशन प्रोटोकॉल (DHCP) मैकेनिक्स
DHCP लोकल नेटवर्क पर क्लाइंट्स को स्वतः आईपी एड्रेस, सबनेट मास्क, डिफ़ॉल्ट गेटवे एवं DNS सर्वर आवंटित करता है:
- *4-चरणीय DORA हैंडशेक:*
  - *1. Discover:* क्लाइंट उपलब्ध DHCP सर्वर खोजने हेतु `DHCPDISCOVER` ब्रॉडकास्ट (UDP पोर्ट 67) भेजता है।
  - *2. Offer:* DHCP सर्वर एक अप्रयुक्त आईपी आरक्षित कर लीज विवरण के साथ `DHCPOFFER` (UDP पोर्ट 68) भेजता है।
  - *3. Request:* क्लाइंट ऑफर स्वीकार करते हुए `DHCPREQUEST` ब्रॉडकास्ट भेजता है।
  - *4. Acknowledge:* सर्वर लीज डेटाबेस में एंट्री दर्ज कर `DHCPACK` भेजकर लीज की पुष्टि करता है।

#v(1.5pt)

== 9.2 हैंड्स-ऑन प्रैक्टिकल लैब: एंटरप्राइज DHCP सर्वर एवं रिले एजेंट
#text(size: 7.5pt, fill: rtech-text)[*उद्देश्य:* केंद्रीकृत एंटरप्राइज DHCP सेवा तैनात करना। ब्रांच ऑफिस क्लाइंट्स को रूटेड WAN के पार स्थित केंद्रीय HQ-DHCP-SRV (10.1.1.50) से आईपी मिले, इसके लिए Branch-RTR पर `ip helper-address` कॉन्फ़िगर करना।]

#v(1pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab08-dhcp-relay-topology.svg", width: 70%)
#v(1.5pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 4pt, y: 2pt),
  [*डिवाइस*], [*इंटरफेस*], [*आईपी एड्रेस*], [*सबनेट मास्क*], [*भूमिका / विवरण*],
  [Branch-RTR], [Gi0/0/0], [192.168.10.1], [255.255.255.0], [Branch LAN गेटवे (`ip helper-address`)],
  [Branch-RTR], [Gi0/0/1], [10.0.0.2], [255.255.255.252], [HQ Core की ओर WAN अपलिंक],
  [HQ-Core-RTR], [Gi0/0/1], [10.0.0.1], [255.255.255.252], [Branch-RTR की ओर WAN अपलिंक],
  [HQ-Core-RTR], [Gi0/0/0], [10.1.1.1], [255.255.255.0], [डेटा सेंटर सर्वर LAN गेटवे],
  [HQ-DHCP-SRV], [NIC], [10.1.1.50], [255.255.255.0], [केंद्रीय एंटरप्राइज DHCP सर्वर],
  [Client-PC1], [FastEthernet0], [DHCP असाइन्ड], [255.255.255.0], [ब्रांच यूजर वर्कस्टेशन]
)

#v(1.5pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[केंद्रीय DHCP सर्वर कॉन्फ़िगरेशन (HQ-Core-RTR):]
```cisco
HQ-Core-RTR(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.10
HQ-Core-RTR(config)# ip dhcp pool BRANCH_OFFICE_LAN
HQ-Core-RTR(dhcp-config)# network 192.168.10.0 255.255.255.0
HQ-Core-RTR(dhcp-config)# default-router 192.168.10.1
HQ-Core-RTR(dhcp-config)# dns-server 8.8.8.8 1.1.1.1
HQ-Core-RTR(dhcp-config)# exit
```

#v(1.5pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Branch राउटर रिले एजेंट कॉन्फ़िगरेशन:]
```cisco
Branch-RTR(config)# interface GigabitEthernet0/0/0
Branch-RTR(config-if)# description BRANCH_USER_LAN
Branch-RTR(config-if)# ip address 192.168.10.1 255.255.255.0
Branch-RTR(config-if)# ip helper-address 10.1.1.50
Branch-RTR(config-if)# no shutdown
Branch-RTR(config-if)# end
```

#v(1.5pt)
#terminal-specimen(title: "HQ-Core-RTR# show ip dhcp binding")[
```text
Bindings from all pools :
IP address          Client-ID/Hardware address      Lease expiration        Type
192.168.10.11       0100.5079.6668.01               Nov 27 2027 10:45 AM    Automatic
192.168.10.12       0100.5079.6668.02               Nov 27 2027 10:48 AM    Automatic
```
]

#v(1.5pt)

== 9.3 नेटवर्क एड्रेस ट्रांसलेशन (NAT) एवं PAT ओवरलोड
IPv4 प्राइवेट एड्रेस (RFC 1918) सार्वजनिक इंटरनेट पर रूट नहीं किए जा सकते। NAT प्राइवेट एड्रेस को पब्लिक आईपी में बदलता है:
- *RFC 1918 प्राइवेट श्रेणियां:* `10.0.0.0/8`, `172.16.0.0/12`, तथा `192.168.0.0/16`।
- *सिस्को NAT शब्दावली:*
  - *Inside Local:* कॉर्पोरेट लैन के भीतर होस्ट को दिया गया प्राइवेट आईपी (उदा. `192.168.1.10`)।
  - *Inside Global:* वह पब्लिक आईपी जो बाहरी दुनिया में उस होस्ट का प्रतिनिधित्व करता है (उदा. `203.0.113.1`)।
  - *Outside Global:* इंटरनेट पर किसी बाहरी सर्वर का वास्तविक पब्लिक आईपी (उदा. `8.8.8.8`)।
- *PAT (NAT Overload):* एक ही पब्लिक आईपी पर हजारों अंदरूनी डिवाइसेज को विशिष्ट #hl[लेयर 4 पोर्ट नंबर्स] द्वारा मैप करता है।

#v(1.5pt)

== 9.4 हैंड्स-ऑन प्रैक्टिकल लैब: PAT (NAT Overload) इंटरनेट एक्सेस
#text(size: 7.5pt, fill: rtech-text)[*उद्देश्य:* Edge-RTR पर पोर्ट एड्रेस ट्रांसलेशन (NAT ओवरलोड) लागू करना। प्राइवेट सबनेट `192.168.1.0/24` के सभी पीसी Gi0/0/0 पर असाइन्ड सिंगल पब्लिक आईपी (`203.0.113.1`) द्वारा इंटरनेट एक्सेस प्राप्त करें।]

#v(1pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab09-pat-nat-topology.svg", width: 70%)
#v(1.5pt)

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Edge-RTR NAT ओवरलोड कॉन्फ़िगरेशन:]
```cisco
Edge-RTR(config)# interface GigabitEthernet0/0/1
Edge-RTR(config-if)# ip address 192.168.1.1 255.255.255.0
Edge-RTR(config-if)# ip nat inside ; no shutdown
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# ip address 203.0.113.1 255.255.255.252
Edge-RTR(config-if)# ip nat outside ; no shutdown
Edge-RTR(config)# access-list 1 permit 192.168.1.0 0.0.0.255
Edge-RTR(config)# ip nat inside source list 1 interface GigabitEthernet0/0/0 overload
Edge-RTR(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.2
```

#v(1.5pt)
#terminal-specimen(title: "Edge-RTR# show ip nat translations")[
```text
Pro Inside global      Inside local       Outside local      Outside global
tcp 203.0.113.1:49152  192.168.1.10:49152 8.8.8.8:443        8.8.8.8:443
tcp 203.0.113.1:49153  192.168.1.20:49152 8.8.8.8:80         8.8.8.8:80
```
]

#v(1.5pt)

== 9.5 एक्सेस कंट्रोल लिस्ट्स (ACLs): स्टैंडर्ड बनाम एक्सटेंडेड
- *मूल्यांकन नियम:* ऊपर से नीचे क्रमबद्ध निष्पादन; पहला मैच मिलते ही क्रिया संपन्न (अन्य नियम नहीं परखे जाते); अंत में अंतर्निहित #hl[`deny ip any any`] नियम होता है।
- *स्टैंडर्ड ACLs (1–99):* केवल Source IP जांचते हैं; #hl[डेस्टिनेशन के जितना संभव हो पास] लगाएं।
- *एक्सटेंडेड ACLs (100–199):* Source IP, Dest IP, प्रोटोकॉल एवं पोर्ट जांचते हैं; #hl[सोर्स के जितना संभव हो पास] लगाएं।

#v(1.5pt)

== 9.6 हैंड्स-ऑन प्रैक्टिकल लैब: एक्सटेंडेड ACL द्वारा सुरक्षा
#text(size: 7.5pt, fill: rtech-text)[*उद्देश्य:* कॉर्पोरेट सर्वर `10.1.1.100` की सुरक्षा हेतु ACL 101 लगाना। गेस्ट लैन को HTTP/HTTPS की अनुमति दें, परंतु पिंग और SSH ब्लॉक करें।]

#v(1pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab10-extended-acl-topology.svg", width: 70%)
#v(1.5pt)

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[Edge-RTR एक्सटेंडेड ACL कॉन्फ़िगरेशन:]
```cisco
Edge-RTR(config)# access-list 101 permit tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 80
Edge-RTR(config)# access-list 101 permit tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 443
Edge-RTR(config)# access-list 101 deny icmp 192.168.20.0 0.0.0.255 host 10.1.1.100 log
Edge-RTR(config)# access-list 101 deny tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 22 log
Edge-RTR(config)# access-list 101 permit ip 192.168.20.0 0.0.0.255 any
Edge-RTR(config)# interface GigabitEthernet0/0/2
Edge-RTR(config-if)# ip access-group 101 in
```

#v(1.5pt)
#terminal-specimen(title: "Edge-RTR# show access-lists 101")[
```text
Extended IP access list 101
    10 permit tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq www (1482 matches)
    20 permit tcp 192.168.20.0 0.0.0.255 host 10.1.1.100 eq 443 (8920 matches)
    30 deny icmp 192.168.20.0 0.0.0.255 host 10.1.1.100 log (48 matches)
```
]

#v(1.5pt)

== 9.7 NTP, सिस्लॉग एवं SNMP निगरानी
- *NTP (UDP पोर्ट 123):* स्ट्रेटम 0 (परमाणु घड़ी) $arrow$ स्ट्रेटम 1 (सीधे जुड़े सर्वर) $arrow$ स्ट्रेटम 2 (एंटरप्राइज सर्वर)। अधिकतम स्ट्रेटम 15 है।
- *सिस्लॉग स्तर (0–7):* 0 Emergency, 1 Alert, 2 Critical, 3 Error, 4 Warning, 5 Notification, 6 Informational, 7 Debugging।
- *SNMP v3:* HMAC-SHA प्रमाणीकरण एवं AES एन्क्रिप्शन (AuthPriv) प्रदान करता है।

#v(1.5pt)

== 9.8 फर्स्ट हॉप रिडंडेंसी प्रोटोकॉल्स (HSRP एवं VRRP)
- *HSRP (सिस्को):* एक Active और एक Standby राउटर। वर्चुअल मैक: `0000.0c07.acXX`। प्रिएम्प्ट कमांड रिकवरी के पश्चात पद पुनः लेने हेतु आवश्यक है।
- *VRRP (ओपन स्टैंडर्ड):* एक Master और कई Backup राउटर्स। वर्चुअल मैक: `0000.5e00.01XX`।

#v(1.5pt)

== 9.9 प्रोडक्शन IP सेवाएं एवं सुरक्षा ट्रबलशूटिंग CLI चीटशीट
#table(
  columns: (1.3fr, 1.4fr, 2.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.2pt,
  table.header([*सत्यापन कमांड*], [*परिचालन आउटपुट*], [*ट्रबलशूटिंग लक्ष्य*]),
  [`show ip dhcp binding`], [सक्रिय DHCP लीज सूची], [क्लाइंट्स को मिले आईपी सत्यापन।],
  [`show ip dhcp conflict`], [डुप्लीकेट आईपी टकराव], [फर्जी स्टैटिक आईपी की पहचान।],
  [`show ip nat translations`], [सक्रिय ट्रांसलेशन सेशन्स], [PAT पोर्ट मैपिंग की जांच।],
  [`show ip nat statistics`], [हिट्स, मिसेज, पूल उपयोग], [NAT पूल समाप्ति की निगरानी।],
  [`show access-lists [num]`], [ACL नियम एवं हिट काउंट], [ट्रैफिक मैच या ड्रॉप का सत्यापन।],
  [`clear ip nat translation \*`], [डायनामिक टेबल रिफ्रेश], [अटके हुए PAT सेशन्स को रीसेट करना।],
  [`show standby brief`], [HSRP ग्रुप, प्रायोरिटी, स्थिति], [डिफ़ॉल्ट गेटवे फेलओवर का सत्यापन।],
  [`show ntp status`], [NTP सिंक स्थिति एवं स्ट्रेटम], [क्लॉक लॉक का सत्यापन।]
)

#v(1.5pt)

== 9.10 एंटरप्राइज TAC IP सेवाएं ट्रबलशूटिंग वर्कफ़्लो
- *1. DHCP पूल समाप्ति:* `show ip dhcp pool` द्वारा जांचें। यदि कोई आईपी कॉन्फ्लिक्ट में हो तो `clear ip dhcp conflict \*` चलाएं।
- *2. PAT पोर्ट भुखमरी:* अत्यधिक कनेक्शन्स होने पर 64,000 पोर्ट्स समाप्त हो सकते हैं। समाधान: इंटरफेस ओवरलोड के स्थान पर *NAT Pool* कॉन्फ़िगर करें:
  `Edge-RTR(config)\# ip nat pool PUBLIC_POOL 203.0.113.10 203.0.113.14 netmask 255.255.255.248`
  `Edge-RTR(config)\# ip nat inside source list 1 pool PUBLIC_POOL overload`
- *3. ACL लॉगिंग प्रभाव:* ACL में `log` कीवर्ड लगाने पर CPU प्रत्येक मैच हेतु Syslog बनाता है। उच्च-मात्रा वाले नियमों पर `log` न लगाएं, अन्यथा CPU क्रैश हो सकता है!

#v(1.5pt)

== व्यापक समीक्षा, अक्सर पूछे जाने वाले प्रश्न (FAQs) एवं मूल्यांकन

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. अक्सर पूछे जाने वाले प्रश्न (Student FAQs)]
#faq-item(q: "एक्सटेंडेड ACL सोर्स के पास और स्टैंडर्ड ACL डेस्टिनेशन के पास क्यों लगाते हैं?", a: "एक्सटेंडेड ACL डेस्टिनेशन आईपी और पोर्ट भी जांचती है, इसलिए इसे सोर्स के पास लगाकर अनपेक्षित ट्रैफिक को WAN बैंडविड्थ बर्बाद करने से पहले ही रोक दिया जाता है। स्टैंडर्ड केवल सोर्स आईपी जांचती है; यदि इसे सोर्स के पास लगा दिया जाए, तो वह सभी डेस्टिनेशन्स के लिए ट्रैफिक रोक देगी!")
#faq-item(q: "डायनामिक NAT और PAT में क्या अंतर है?", a: "डायनामिक NAT 1-to-1 आधार पर पब्लिक आईपी पूल से एड्रेस देता है (पूल खत्म होने पर नए होस्ट्स रुक जाते हैं)। PAT एक ही पब्लिक आईपी पर लेयर 4 पोर्ट्स के जरिए हजारों होस्ट्स को इंटरनेट देता है।")
#faq-item(q: "HSRP में preempt कमांड क्यों आवश्यक है?", a: "डिफ़ॉल्ट रूप से HSRP गैर-प्रिएम्प्टिव है। यदि उच्च प्रायोरिटी वाला मुख्य राउटर ठीक होकर वापस चालू होता है, तो वह तब तक स्टैंडबाय से एक्टिव पद वापस नहीं ले सकता जब तक कि preempt न लगा हो।")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. लघु-उत्तरीय समीक्षा प्रश्न]
#short-q(num: 1, q: "DHCP क्लाइंट और सर्वर किन UDP पोर्ट्स पर सुनते हैं?", ans: "सर्वर UDP पोर्ट 67 पर; क्लाइंट UDP पोर्ट 68 पर।")
#short-q(num: 2, q: "प्रत्येक सिस्को ACL के अंत में कौन सा डिफ़ॉल्ट नियम मौजूद रहता है?", ans: "Implicit Deny All (deny ip any any).")
#short-q(num: 3, q: "सिस्लॉग में Error संदेशों को कौन सा स्तर दिया गया है?", ans: "स्तर 3 (Error).")
#short-q(num: 4, q: "NTP में अधिकतम मान्य स्ट्रेटम मान क्या है?", ans: "स्ट्रेटम 15 (16 का अर्थ डिवाइस अनसिंक्रोनाइज्ड है).")
#short-q(num: 5, q: "क्लाइंट के DHCP ब्रॉडकास्ट को दूरस्थ सर्वर तक भेजने वाली कमांड क्या है?", ans: "ip helper-address <server-ip>.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 उच्च-अंक बहुविकल्पीय प्रश्न (MCQs)]
#mcq(num: 1, q: "DHCP 4-चरणीय हैंडशेक (DORA) में कौन से संदेश क्लाइंट द्वारा ब्रॉडकास्ट किए जाते हैं?", a: "Discover एवं Request", b: "Offer एवं Acknowledge", c: "Discover एवं Offer", d: "Request एवं Acknowledge", ans: "A", expl: "शुरुआत में आईपी न होने पर Discover और स्वीकृति हेतु Request दोनों ब्रॉडकास्ट भेजे जाते हैं।")
#mcq(num: 2, q: "विभिन्न इनसाइड होस्ट्स के सेशन्स को ट्रैक करने हेतु PAT किस लेयर 4 जानकारी का उपयोग करता है?", a: "TCP सीक्वेंस नंबर", b: "विशिष्ट सोर्स TCP/UDP पोर्ट नंबर्स", c: "IP आइडेंटिफिकेशन", d: "विंडो साइज", ans: "B", expl: "PAT पब्लिक आईपी पर प्रत्येक कनेक्शन को एक विशिष्ट एफेमरल लेयर 4 पोर्ट आवंटित करता है।")
#mcq(num: 3, q: "RFC 1918 में परिभाषित प्राइवेट IPv4 रेंज कौन सी है?", a: "172.32.0.0 - 172.64.255.255", b: "192.168.0.0 - 192.168.255.255", c: "169.254.0.0 - 169.254.255.255", d: "224.0.0.0 - 239.255.255.255", ans: "B", expl: "RFC 1918 के तहत 10.0.0.0/8, 172.16.0.0/12, तथा 192.168.0.0/16 आरक्षित हैं।")
#mcq(num: 4, q: "कौन सा SNMP संस्करण HMAC-SHA प्रमाणीकरण एवं AES एन्क्रिप्शन दोनों प्रदान करता है?", a: "SNMP v1", b: "SNMP v2c", c: "SNMP v3", d: "SNMP v4", ans: "C", expl: "SNMP v3 में USM मॉडल के तहत एन्क्रिप्शन और प्रमाणीकरण (AuthPriv) शामिल है।")
#mcq(num: 5, q: "HSRP v1 में एक्टिव वर्चुअल राउटर कौन सा वर्चुअल मैक एड्रेस प्रारूप उपयोग करता है?", a: "0000.5e00.01XX", b: "0000.0c07.acXX", c: "0007.b400.01XX", d: "0100.5e00.0001", ans: "B", expl: "HSRP v1 0000.0c07.acXX उपयोग करता है जहां XX हेक्स ग्रुप नंबर है। 0000.5e00.01XX VRRP का है।")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "एफेमरल पोर्ट रेंज")[
      आधुनिक ऑपरेटिंग सिस्टम्स आउटबाउंड सेशन्स हेतु पोर्ट #hl[49152 से 65535] का उपयोग करते हैं, जिससे PAT प्रति आईपी लगभग 64,000 समवर्ती सेशन्स संभाल सकता है!
    ]
  ],
  [
    #tech-spotlight-box(title: "जीरो ट्रस्ट आर्किटेक्चर")[
      आधुनिक एंटरप्राइज नेटवर्क केवल पेरीमीटर ACLs पर निर्भर न रहकर आइडेंटिटी-आधारित Zero Trust नेटवर्क एक्सेस (ZTNA) एवं माइक्रोसेगमेंटेशन का उपयोग करते हैं!
    ]
  ]
)
