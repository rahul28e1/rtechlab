#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[अध्याय 13 · एंटरप्राइज IP सेवाएं: DHCP एवं NAT/PAT]
= अध्याय 13: एंटरप्राइज IP सेवाएं: सिस्को IOS DHCP सर्वर, DHCP रिले एवं NAT/PAT ओवरलोड लैब

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  DHCP DORA 4-वे हैंडशेक, सिस्को IOS DHCP सर्वर कॉन्फ़िगरेशन, DHCP रिले एजेंट (`ip helper-address`), IPv4 एड्रेस संरक्षण, एवं पोर्ट एड्रेस ट्रांसलेशन (PAT / NAT Overload) लैब।
]

#v(2pt)

== 13.1 डायनेमिक होस्ट कॉन्फ़िगरेशन प्रोटोकॉल (DHCP) की कार्यप्रणाली
DHCP एंडपॉइंट उपकरणों पर IPv4 एड्रेस, सबनेट मास्क, डिफ़ॉल्ट गेटवे और DNS सेटिंग्स को स्वचालित करता है:
- *DORA 4-वे हैंडशेक प्रक्रिया:*
  - *1. Discover (क्लाइंट से सर्वर):* क्लाइंट UDP पोर्ट 67 पर `255.255.255.255` पर `DHCPDISCOVER` ब्रॉडकास्ट करता है।
  - *2. Offer (सर्वर से क्लाइंट):* DHCP सर्वर एक IP आरक्षित करके `DHCPOFFER` भेजता है।
  - *3. Request (क्लाइंट से सर्वर):* क्लाइंट लीज स्वीकार करते हुए `DHCPREQUEST` ब्रॉडकास्ट करता है।
  - *4. Acknowledgment (सर्वर से क्लाइंट):* सर्वर `DHCPACK` भेजकर लीज अवधि और नेटवर्क सेटिंग्स की पुष्टि करता है।

#v(2pt)

== 13.2 सिस्को IOS DHCP सर्वर कॉन्फ़िगरेशन
#terminal-box([
```cisco
! स्टैटिक एड्रेसेस (गेटवे, प्रिंटर, सर्वर) को बाहर रखें:
Router(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.20
! सक्रिय DHCP एड्रेस पूल बनाएं:
Router(config)# ip dhcp pool Engineering_Pool
Router(config-dhcp)# network 192.168.10.0 255.255.255.0
Router(config-dhcp)# default-router 192.168.10.1
Router(config-dhcp)# dns-server 8.8.8.8 1.1.1.1
Router(config-dhcp)# domain-name rtechlab.com
Router(config-dhcp)# lease 7 0 0
```
])

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab08-dhcp-relay-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[चित्र 13.1: लैब 08 — DHCP रिले मल्टी-VLAN टोपोलॉजी।]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab09-pat-nat-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[चित्र 13.2: लैब 09 — PAT / NAT ओवरलोड एंटरप्राइज गेटवे।]
  ]
)

#pagebreak()

== 13.3 DHCP रिले एजेंट (`ip helper-address`)
राउटर्स लेयर 3 पर ब्रॉडकास्ट पैकेट्स को ड्रॉप कर देते हैं। यदि DHCP सर्वर किसी अन्य VLAN या सर्वर फार्म में स्थित है, तो क्लाइंट का `DHCPDISCOVER` राउटर पर ही नष्ट हो जाएगा!
- *समाधान:* क्लाइंट-फेसिंग राउटर इंटरफ़ेस पर `ip helper-address <DHCP_Server_IP>` दें।
- राउटर क्लाइंट के ब्रॉडकास्ट UDP पोर्ट 67 पैकेट को पकड़कर उसे #hl[यूनिकास्ट पैकेट में बदल देता है] और केंद्रीय DHCP सर्वर को भेज देता है।

#v(2pt)

== 13.4 नेटवर्क एड्रेस ट्रांसलेशन (NAT) एवं PAT
NAT सार्वजनिक IPv4 स्पेस को बचाता है और आंतरिक प्राइवेट नेटवर्क संरचना को छुपाता है:
#table(
  columns: (1.2fr, 1.6fr, 3.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*NAT प्रकार*], [*मैपिंग अनुपात*], [*प्रोडक्शन उपयोग एवं कार्यप्रणाली*]),
  [Static NAT], [एक-से-एक (1:1)], [एक प्राइवेट IP को स्थायी रूप से एक पब्लिक IP पर मैप करता है (DMZ वेब/मेल सर्वर)।],
  [Dynamic NAT], [अनेक-से-अनेक], [पब्लिक IPs के पूल से पहले आओ-पहले पाओ के आधार पर प्राइवेट होस्ट्स को जोड़ता है।],
  [PAT / Overload], [अनेक-से-एक (N:1)], [अद्वितीय लेयर 4 पोर्ट नंबर्स का उपयोग करके हजारों प्राइवेट IPs को #hl[एकल पब्लिक IP] पर इंटरनेट कराता है।]
)

#v(2pt)

== 13.5 प्रोडक्शन PAT / NAT ओवरलोड CLI लैब
#terminal-box([
```cisco
! चरण 1: इनसाइड एवं आउटसाइड इंटरफेसेस पहचानें:
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# ip nat inside
Edge-RTR(config-if)# exit
Edge-RTR(config)# interface GigabitEthernet0/0/1
Edge-RTR(config-if)# ip nat outside
Edge-RTR(config-if)# exit

! चरण 2: आंतरिक प्राइवेट होस्ट्स को मैच करने वाली ACL बनाएं:
Edge-RTR(config)# access-list 1 permit 192.168.0.0 0.0.255.255

! चरण 3: पब्लिक इंटरफ़ेस पर PAT ओवरलोड सक्रिय करें:
Edge-RTR(config)# ip nat inside source list 1 interface GigabitEthernet0/0/1 overload
```
])

#v(2pt)

== 13.6 NAT सत्यापन एवं ट्रांसलेशन टेबल निरीक्षण
#terminal-box([
```cisco
Edge-RTR# show ip nat translations
Pro Inside global          Inside local           Outside local        Outside global
tcp 203.0.113.5:49152      192.168.10.50:49152    198.51.100.10:80     198.51.100.10:80
tcp 203.0.113.5:49153      192.168.10.51:49153    198.51.100.20:443    198.51.100.20:443
```
])

#pagebreak()

== छात्र तकनीकी प्रश्नोत्तरी (Student Technical FAQs)
#faq-box("Inside Local और Inside Global एड्रेसेस में क्या अंतर है?", "Inside Local आंतरिक वर्कस्टेशन को दिया गया वास्तविक प्राइवेट IP एड्रेस (RFC 1918) है। Inside Global वह ट्रांसलेटेड पब्लिक IP एड्रेस है जो बाहरी इंटरनेट पर उस उपकरण का प्रतिनिधित्व करता है।")
#faq-box("PAT के तहत एक पब्लिक IP कितने समवर्ती कनेक्शंस संभाल सकता है?", "PAT 16-बिट लेयर 4 पोर्ट नंबर्स का उपयोग करता है। सैद्धांतिक रूप से लगभग 65,000 समवर्ती ट्रांसलेशन सेशन्स एक ही पब्लिक IPv4 एड्रेस पर चलाए जा सकते हैं।")
#faq-box("DHCP किन UDP पोर्ट्स का उपयोग करता है?", "DHCP क्लाइंट UDP पोर्ट 68 पर ब्रॉडकास्ट करता है; DHCP सर्वर UDP पोर्ट 67 पर सुनता है।")

#v(2pt)

== लघु-उत्तरीय तकनीकी समीक्षा (Short-Answer Review)
1. *चार-चरणीय DHCP हैंडशेक का सही क्रम बताइए:* Discover -> Offer -> Request -> Acknowledge (DORA)।
2. *राउटर के पार DHCP ब्रॉडकास्ट फॉरवर्ड करने वाली कमांड क्या है?* क्लाइंट गेटवे इंटरफ़ेस पर `ip helper-address <DHCP_Server_IP>`।
3. *NAT कॉन्फ़िगरेशन में पोर्ट एड्रेस ट्रांसलेशन (PAT) सक्रिय करने वाला कीवर्ड क्या है?* `overload`।
4. *सक्रिय डायनेमिक NAT ट्रांसलेशन प्रविष्टियों को मिटाने की कमांड क्या है?* `clear ip nat translation *`।

#v(2pt)

== उच्च-प्राथमिकता परीक्षा बहुविकल्पीय प्रश्न (Exam MCQs)
#mcq-item(
  "सिस्को राउटर पर DHCP सर्वर बनाते समय कौन सी कमांड यह सुनिश्चित करती है कि गेटवे IP 192.168.1.1 किसी कंप्यूटर को न दिया जाए?",
  ("ip dhcp exclude 192.168.1.1", "ip dhcp excluded-address 192.168.1.1", "no ip dhcp pool 192.168.1.1", "deny host 192.168.1.1"),
  1,
  "'ip dhcp excluded-address' निर्दिष्ट स्टैटिक एड्रेसेस को लीज पर देने से रोकती है।"
)

#mcq-item(
  "सिस्को NAT शब्दावली में, बाहरी गंतव्य होस्ट का वह IP एड्रेस क्या कहलाता है जैसा वह आंतरिक नेटवर्क के उपकरणों को दिखाई देता है?",
  ("Inside Local", "Inside Global", "Outside Local", "Outside Global"),
  2,
  "Outside Local बाहरी होस्ट का वह IP एड्रेस है जैसा वह आंतरिक नेटवर्क के उपकरणों द्वारा जाना जाता है।"
)

#mcq-item(
  "कौन सी ट्रांसलेशन विधि 500 उपयोगकर्ताओं को एक ही पब्लिक IPv4 एड्रेस से इंटरनेट चलाने की अनुमति देती है?",
  ("Static NAT", "Dynamic NAT", "PAT (NAT Overload)", "BGP Route Reflection"),
  2,
  "PAT (Port Address Translation) लेयर 4 पोर्ट नंबर्स का उपयोग करके एक ही पब्लिक IP पर हजारों प्राइवेट कनेक्शंस चलाता है।"
)

#v(2pt)

== क्या आप जानते हैं? एवं 2027 टेक्नोलॉजी स्पॉटलाइट
#fact-box("क्या आप जानते हैं? कैरियर-ग्रेड NAT (CGNAT)", "IPv4 पते समाप्त होने के कारण मोबाइल और ब्रॉडबैंड कंपनियां पूरे शहरों को CGNAT (RFC 6598, `100.64.0.0/10` ब्लॉक) के पीछे रखती हैं, जिससे पैकेट्स इंटरनेट पहुंचने से पहले डबल NAT से गुजरते हैं।")

#spotlight-box("2027 टेक स्पॉटलाइट: NAT64 / DNS64 ट्रांजिशन", "आधुनिक मोबाइल नेटवर्क्स केवल-IPv6 कोर चलाते हैं। NAT64 राउटर्स आउटबाउंड IPv6 अनुरोधों को लेगेसी IPv4 में बदलते हैं जिससे केवल-IPv6 फोन पुराने IPv4 सर्वरों को बिना समस्या खोल लेते हैं।")
