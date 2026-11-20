#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[अध्याय 07 · लेयर 2 स्विचिंग एवं पोर्ट सिक्योरिटी]
= अध्याय 7: लेयर 2 स्विचिंग, CAM टेबल्स एवं पोर्ट सिक्योरिटी लैब

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  लेयर 2 फ्रेम फॉरवर्डिंग लॉजिक, कंटेंट एड्रेसेबल मेमोरी (CAM) टेबल्स, MAC फ्लडिंग अटैक्स, एवं स्विचपोर्ट पोर्ट सिक्योरिटी कॉन्फ़िगरेशन तथा ऑटोमेटेड एरर-रिकवरी।
]

#v(2pt)

== 7.1 लेयर 2 ट्रांसपेरेंट ब्रिजिंग एवं स्विचिंग लॉजिक
ईथरनेट स्विच 48-बिट MAC एड्रेसेस के आधार पर फ्रेम्स को फॉरवर्ड करते हैं। स्विच 4 मूलभूत कार्य निष्पादित करता है:
- *1. सीखना (Learn - Source MAC):* जब कोई ईथरनेट फ्रेम पोर्ट पर आता है, तो स्विच उसके #hl[सोर्स MAC एड्रेस] की जांच करता है। यदि वह CAM टेबल में नहीं है, तो वह MAC, पोर्ट और VLAN को 300 सेकंड के टाइमर के साथ दर्ज कर लेता है।
- *2. फॉरवर्ड करना (Forward - Known Unicast):* स्विच #hl[डेस्टिनेशन MAC एड्रेस] की जांच करता है। यदि वह CAM टेबल में मौजूद है, तो फ्रेम को केवल उसी विशिष्ट पोर्ट से बाहर भेजा जाता है।
- *3. फिल्टर करना (Filter):* यदि डेस्टिनेशन MAC उसी पोर्ट सेगमेंट पर है जिससे फ्रेम आया था, तो स्विच उसे ड्रॉप कर देता है ताकि अनावश्यक ट्रैफिक न फैले।
- *4. फ्लड करना (Flood - Unknown Unicast, Broadcast, Multicast):* यदि डेस्टिनेशन MAC टेबल में नहीं है, या ब्रॉडकास्ट (`FF:FF:FF:FF:FF:FF`) है, तो स्विच फ्रेम को #hl[आने वाले पोर्ट को छोड़कर उस VLAN के अन्य सभी पोर्ट्स पर फ्लड कर देता है]।

#v(2pt)

== 7.2 CAM टेबल आर्किटेक्चर एवं एजिंग टाइमर
कंटेंट एड्रेसेबल मेमोरी (CAM) टेबल 1 क्लॉक साइकिल में हार्डवेयर लुकअप की सुविधा देती है। सिस्को IOS में निष्क्रिय डायनेमिक MAC प्रविष्टियों हेतु डिफ़ॉल्ट एजिंग टाइमर #hl[300 सेकंड (5 मिनट)] होता है।
#terminal-box([
```cisco
Switch# show mac address-table
          Mac Address Table
-------------------------------------------
Vlan    Mac Address       Type        Ports
----    -----------       --------    -----
  10    001b.782a.8c11    DYNAMIC     Gi0/1
  10    001b.782a.8c22    DYNAMIC     Gi0/2
Total Mac Addresses for this module: 2
```
])

#v(2pt)

#grid(
  columns: (1fr, 1.3fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[चित्र 7.1: प्रोडक्शन एंटरप्राइज गीगाबिट एक्सेस स्विच।]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab02-port-security-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[चित्र 7.2: लैब 02 — स्विचपोर्ट पोर्ट सिक्योरिटी टोपोलॉजी।]
  ]
)

#pagebreak()

== 7.3 लेयर 2 खतरे: MAC फ्लडिंग एवं CAM टेबल ओवरफ्लो
*CAM Table Overflow Attack* में हमलावर प्रति सेकंड हजारों फर्जी और यादृच्छिक सोर्स MAC एड्रेसेस भेजता है (जैसे `macof` टूल द्वारा)।
- *परिणाम:* स्विच की CAM टेबल पूरी तरह भर जाती है। नए पते न सीख पाने के कारण स्विच पुराने हब की तरह व्यवहार करने लगता है और #hl[सभी आने वाले फ्रेम्स को हर पोर्ट पर फ्लड करने लगता है]। हमलावर स्निफर लगाकर गोपनीय डेटा चुरा लेता है।
- *सुरक्षा:* प्रति इंटरफ़ेस अनुमत MAC एड्रेसेस की संख्या सीमित करने हेतु #hl[Switchport Port Security] लागू करें।

#v(2pt)

== 7.4 स्विचपोर्ट पोर्ट सिक्योरिटी CLI कार्यान्वयन
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*उल्लंघन मोड*], [*फ्रेम फॉरवर्डिंग*], [*उल्लंघन काउंटर*], [*Syslog / SNMP अलर्ट एवं पोर्ट स्थिति*]),
  [`Protect`], [अनधिकृत फ्रेम्स ड्रॉप करता है], [बढ़ता नहीं है], [कोई अलर्ट नहीं। पोर्ट UP रहता है।],
  [`Restrict`], [अनधिकृत फ्रेम्स ड्रॉप करता है], [बढ़ता है], [Syslog एवं SNMP ट्रैप भेजता है। पोर्ट UP रहता है।],
  [`Shutdown` (मानक)], [सभी ट्रैफिक ड्रॉप करता है], [बढ़ता है], [Syslog भेजता है। पोर्ट को तुरंत `err-disabled` में बंद कर देता है।]
)

#v(2pt)

#terminal-box([
```cisco
Switch(config)# interface GigabitEthernet0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport port-security
Switch(config-if)# switchport port-security maximum 2
Switch(config-if)# switchport port-security mac-address sticky
Switch(config-if)# switchport port-security violation restrict
Switch(config-if)# exit
! ग्लोबल ऑटोमेटेड एरर-रिकवरी:
Switch(config)# errdisable recovery cause psecure-violation
Switch(config)# errdisable recovery interval 30
```
])

#v(2pt)

== 7.5 पोर्ट सिक्योरिटी सत्यापन एवं ट्रबलशूटिंग
#terminal-box([
```cisco
Switch# show port-security interface GigabitEthernet0/1
Port Security              : Enabled
Port Status                : Secure-up
Violation Mode             : Restrict
Aging Time                 : 0 mins
Secure MACAddress-Max(Count) : 2
Security Violation Count   : 0
Sticky MAC Addresses       : 1
```
])

#pagebreak()

== छात्र तकनीकी प्रश्नोत्तरी (Student Technical FAQs)
#faq-box("पोर्ट सिक्योरिटी सक्षम करने से पहले 'switchport mode access' क्यों देना पड़ता है?", "सिस्को स्विच पोर्ट्स डिफ़ॉल्ट रूप से डायनेमिक DTP मोड में होते हैं। पोर्ट सिक्योरिटी केवल स्टैटिक एक्सेस या स्टैटिक ट्रंक पोर्ट्स पर ही समर्थित है; डायनेमिक पोर्ट पर यह कमांड अस्वीकार हो जाती है।")
#faq-box("स्टैटिक MAC की तुलना में 'mac-address sticky' का क्या लाभ है?", "'sticky' कमांड स्विच को पहले प्राप्त फ्रेम से डिवाइस का MAC एड्रेस स्वतः सीखकर उसे सीधे running-config में लिखने की सुविधा देती है, जिससे मैन्युअल टाइपिंग का समय बचता है।")
#faq-box("ऑटो-रिकवरी के बिना 'err-disabled' पोर्ट को कैसे चालू किया जाता है?", "इंजीनियर को मैन्युअल रूप से इंटरफ़ेस कॉन्फ़िगरेशन में जाकर पहले 'shutdown' और फिर 'no shutdown' कमांड देनी पड़ती है।")

#v(2pt)

== लघु-उत्तरीय तकनीकी समीक्षा (Short-Answer Review)
1. *सिस्को पोर्ट सिक्योरिटी का डिफ़ॉल्ट वायोलेशन मोड बताइए:* `Shutdown`।
2. *सिस्को IOS में डायनेमिक CAM टेबल प्रविष्टियों का एजिंग टाइमर कितना होता है?* 300 सेकंड (5 मिनट)।
3. *Restrict और Protect वायोलेशन मोड्स में मुख्य अंतर क्या है?* दोनों अनधिकृत फ्रेम्स को रोकते हैं, परंतु Restrict उल्लंघन काउंटर को बढ़ाता है और Syslog/SNMP भेजता है, जबकि Protect चुपचाप ड्रॉप करता है।
4. *पोर्ट सिक्योरिटी उल्लंघन से बंद हुए पोर्ट को स्वतः पुनः चालू करने की कमांड क्या है?* `errdisable recovery cause psecure-violation`।

#v(2pt)

== उच्च-प्राथमिकता परीक्षा बहुविकल्पीय प्रश्न (Exam MCQs)
#mcq-item(
  "पोर्ट सिक्योरिटी वाले पोर्ट पर उल्लंघन होने पर पोर्ट तुरंत एम्बर हो जाता है और स्थिति 'err-disabled' दिखती है। कौन सा मोड सक्रिय है?",
  ("Protect", "Restrict", "Shutdown", "Monitor"),
  2,
  "Shutdown मोड सुरक्षा उल्लंघन होने पर पोर्ट को तुरंत err-disabled स्थिति में बंद कर देता है।"
)

#mcq-item(
  "कौन सी कमांड सीखे गए डायनेमिक MAC एड्रेसेस को सीधे रनिंग कॉन्फ़िगरेशन में सेव कर देती है?",
  ("switchport port-security mac-address dynamic", "switchport port-security mac-address sticky", "switchport mac-address-table permanent", "switchport security learn auto"),
  1,
  "'mac-address sticky' सीखे गए MAC एड्रेसेस को स्थायी कॉन्फ़िगरेशन में बदल देती है।"
)

#mcq-item(
  "अधिकतम 2 MAC एड्रेसेस की सीमा लगाकर पोर्ट सिक्योरिटी सक्षम करने से किस प्रकार का हमला सीधे रुकता है?",
  ("ARP पॉइजनिंग", "CAM टेबल फ्लडिंग / ओवरफ्लो", "DHCP स्टार्वेशन", "VLAN हॉपिंग"),
  1,
  "पोर्ट सिक्योरिटी हमलावरों को हजारों फर्जी MAC एड्रेसेस भेजकर CAM टेबल भरने से रोकती है।"
)

#v(2pt)

== क्या आप जानते हैं? एवं 2027 टेक्नोलॉजी स्पॉटलाइट
#fact-box("क्या आप जानते हैं? TCAM बनाम CAM टेबल्स", "मानक CAM टेबल्स केवल सटीक बाइनरी (0 या 1) MAC मैच करती हैं। टर्नरी CAM (TCAM) तीसरी स्थिति 'Don't Care' (X) का मूल्यांकन कर सकती है, जिससे लेयर 3 स्विचेस एक ही चक्र में जटिल ACLs और सबनेट मास्क्स का मूल्यांकन कर लेते हैं।")

#spotlight-box("2027 टेक स्पॉटलाइट: 802.1X डायनेमिक VLAN असाइनमेंट एवं सिस्को ISE", "आधुनिक जीरो-ट्रस्ट नेटवर्क्स में स्टैटिक पोर्ट सिक्योरिटी के स्थान पर IEEE 802.1X NAC का उपयोग किया जाता है। Cisco ISE द्वारा उपयोगकर्ता प्रमाणीकरण के आधार पर स्विच पोर्ट को डायनेमिक रूप से उपयुक्त VLAN में डाल दिया जाता है।")
