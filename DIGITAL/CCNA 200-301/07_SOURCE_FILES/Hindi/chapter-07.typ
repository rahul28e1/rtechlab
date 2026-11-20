#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[अध्याय 07 · स्विचिंग, VLANS एवं स्पैनिंग ट्री]
= अध्याय 7: स्विचिंग, VLANs, ट्रंकिंग (802.1Q), पोर्ट सिक्योरिटी एवं STP

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  ईथरनेट स्विचिंग आधारभूत सिद्धांत: CAM टेबल एड्रेस लर्निंग, फ्लडिंग एवं एजिंग; VLAN सेगमेंटेशन; स्विचपोर्ट पोर्ट सिक्योरिटी उल्लंघन मोड्स; 802.1Q ट्रंकिंग एवं नेटिव VLAN सुरक्षा; स्पैनिंग ट्री प्रोटोकॉल (STP 802.1D बनाम RSTP 802.1w), रूट ब्रिज चुनाव गणित, पोर्टफास्ट, BPDU गार्ड, तथा ईथरचैनल लिंक एग्रीगेशन सिस्को पैकेट ट्रेसर लैब्स के साथ।
]

#v(2pt)

== 7.1 लेयर 2 स्विच लॉजिक एवं CAM टेबल मैकेनिक्स
लेयर 2 स्विच एक मल्टीपोर्ट ब्रिज के रूप में कार्य करता है और आने वाले ईथरनेट फ्रेम्स का निरीक्षण कर अग्रेषण निर्णय लेता है:
- *1. लर्निंग:* जब फ्रेम पोर्ट में प्रवेश करता है, तो स्विच #hl[Source MAC एड्रेस] पढ़ता है। यदि यह एड्रेस *Content Addressable Memory (CAM) Table* में नहीं है, तो यह Source MAC, पोर्ट नंबर व VLAN ID को डिफ़ॉल्ट #hl[300 सेकंड (5 मिनट)] के एजिंग टाइमर के साथ जोड़ लेता है।
- *2. फॉरवर्डिंग निर्णय:* स्विच #hl[Destination MAC एड्रेस] की जांच करता है:
  - *Known Unicast:* यदि Destination MAC टेबल में मौजूद है, तो फ्रेम #hl[केवल उसी विशिष्ट पोर्ट से बाहर भेजा जाता है]।
  - *Unknown Unicast:* यदि Destination MAC टेबल में नहीं है, तो स्विच फ्रेम को प्राप्तकर्ता पोर्ट को छोड़कर उसी VLAN के #hl[अन्य सभी पोर्ट्स पर फ्लड (प्रसारित)] करता है।
  - *Broadcast / Multicast:* सोर्स VLAN के समस्त पोर्ट्स पर प्रसारित किया जाता है (`FFFF.FFFF.FFFF`)।
- *3. एजिंग:* 300 सेकंड तक अप्रयुक्त रहने वाली एंट्रियां टेबल स्पेस बचाने हेतु हटा दी जाती हैं।

#v(3pt)

== 7.2 वर्चुअल लोकल एरिया नेटवर्क (VLANs) एवं सेगमेंटेशन
VLAN एक फिजिकल स्विच के भीतर निर्मित लॉजिकल ब्रॉडकास्ट डोमेन है:
- *VLANs की आवश्यकता:* VLANs के बिना सभी स्विच पोर्ट्स एक ही ब्रॉडकास्ट डोमेन में होते हैं। किसी एक खराब होस्ट का ब्रॉडकास्ट स्टॉर्म पूरे नेटवर्क की बैंडविड्थ नष्ट कर देता है। VLANs विभाग-वार (इंजीनियरिंग, सेल्स, मैनेजमेंट) ट्रैफिक को अलग करते हैं, सुरक्षा बढ़ाते हैं और ब्रॉडकास्ट को सीमित करते हैं।
- *VLAN नंबरिंग श्रेणियां:*
  - *डिफ़ॉल्ट VLAN (VLAN 1):* सभी पोर्ट्स का फ़ैक्टरी डिफ़ॉल्ट; इसे न तो बदला जा सकता है और न ही हटाया जा सकता है।
  - *सामान्य श्रेणी (VLAN 2–1005):* मानक एंटरप्राइज श्रेणी। नॉन-वोलेटाइल फ्लैश मेमोरी में #hl[`flash:vlan.dat`] फाइल में सुरक्षित रहता है।
  - *विस्तारित श्रेणी (VLAN 1006–4094):* सर्विस प्रोवाइडर्स व बड़े डेटा सेंटर्स द्वारा प्रयुक्त। सीधे `running-config` में सेव होता है।

#v(3pt)

== 7.3 हैंड्स-ऑन प्रैक्टिकल लैब: स्विच पोर्ट सिक्योरिटी एवं स्टिकी MAC
#text(size: 7.5pt, fill: rtech-text)[*उद्देश्य:* सिस्को कैटलिस्ट 2960 स्विच पर अनाधिकृत डिवाइस जुड़ने से रोकना। पोर्ट FastEthernet0/1 को अधिकतम 2 मैक एड्रेस तक सीमित करें, स्टिकी लर्निंग द्वारा अधिकृत पते स्वतः सीखें और शटडाउन उल्लंघन मोड लागू करें।]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab02-port-security-topology.svg", width: 88%)
#v(2pt)

#table(
  columns: (1fr, 1.2fr, 1.5fr, 1.4fr, 2fr),
  stroke: 0.5pt + rtech-border,
  fill: (col, row) => if row == 0 { rgb("#F1F5F9") } else { rgb("#FFFFFF") },
  inset: (x: 5pt, y: 3pt),
  [*डिवाइस*], [*इंटरफेस*], [*मैक एड्रेस*], [*VLAN*], [*परिचालन भूमिका*],
  [SW1-ACCESS], [Fa0/1], [कनेक्टेड होस्ट], [VLAN 10], [पोर्ट सिक्योरिटी सक्रिय एक्सेस पोर्ट],
  [Auth-PC1], [FastEthernet0], [0050.7966.6801], [VLAN 10], [अधिकृत कर्मचारी पीसी (स्टिकी से सीखा)],
  [Auth-Laptop], [FastEthernet0], [0050.7966.6802], [VLAN 10], [अधिकृत कॉर्पोरेट लैपटॉप (स्टिकी से सीखा)],
  [Rogue-Laptop], [FastEthernet0], [00D0.FF11.2233], [VLAN 10], [अनाधिकृत हमलावर (Err-Disable ट्रिगर)]
)

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[कैटलिस्ट 2960 स्विच पोर्ट सिक्योरिटी कॉन्फ़िगरेशन:]
```cisco
SW1-ACCESS(config)# interface FastEthernet0/1
SW1-ACCESS(config-if)# switchport mode access
SW1-ACCESS(config-if)# switchport access vlan 10
SW1-ACCESS(config-if)# switchport port-security
SW1-ACCESS(config-if)# switchport port-security maximum 2
SW1-ACCESS(config-if)# switchport port-security mac-address sticky
SW1-ACCESS(config-if)# switchport port-security violation shutdown
SW1-ACCESS(config-if)# end
```

#v(2pt)
#terminal-specimen(title: "SW1-ACCESS# show port-security interface FastEthernet0/1")[
```text
Port Security              : Enabled
Port Status                : Secure-down (err-disabled)
Violation Mode             : Shutdown
Aging Time                 : 0 mins
Max MAC Addresses          : 2
Total MAC Addresses        : 2
Configured MAC Addresses   : 0
Sticky MAC Addresses       : 2
Last Source Address:Vlan   : 00D0.FF11.2233:10
Security Violation Count   : 1
! --- Err-Disabled स्थिति से रिकवरी प्रक्रिया: ---
SW1-ACCESS(config)# interface FastEthernet0/1
SW1-ACCESS(config-if)# shutdown
SW1-ACCESS(config-if)# no shutdown
```
]

#concept-box(title: "पोर्ट सिक्योरिटी उल्लंघन (Violation) मोड्स")[
  - *Protect:* अज्ञात मैक से आने वाले फ्रेम्स को बिना कोई चेतावनी दिए ड्रॉप कर देता है। कोई Syslog अलर्ट नहीं बनता।
  - *Restrict:* अनाधिकृत फ्रेम्स ड्रॉप करता है, तुरंत Syslog/SNMP अलर्ट भेजता है और उल्लंघन काउंटर बढ़ाता है।
  - *Shutdown (डिफ़ॉल्ट):* फ्रेम्स ड्रॉप करता है, Syslog भेजता है, और पोर्ट को तुरंत #hl[`err-disabled`] स्थिति में बंद कर देता है (LED एम्बर हो जाती है)। इसे पुनः चालू करने हेतु मैन्युअल `shutdown` फिर `no shutdown` आवश्यक है।
]

#v(3pt)

== 7.4 एक्सेस पोर्ट्स बनाम 802.1Q ट्रंक पोर्ट्स एवं नेटिव VLAN सुरक्षा
स्विच इंटरफेसेस दो मुख्य मोड्स में कार्य करते हैं:
- *एक्सेस पोर्ट:* केवल #hl[एक ही VLAN] का सदस्य होता है और अंतिम उपयोगकर्ता डिवाइस (पीसी, प्रिंटर) से जुड़ता है। फ्रेम भेजते समय यह VLAN टैग हटा देता है ताकि सामान्य ईथरनेट फ्रेम पहुंचे।
- *ट्रंक पोर्ट (IEEE 802.1Q):* एक ही फिजिकल लिंक पर #hl[एक साथ कई VLANs का ट्रैफिक] ले जाता है। यह ईथरनेट हेडर में *4-बाइट 802.1Q टैग* जोड़ता है जिसमें 12-बिट VLAN ID होती है।
- *नेटिव VLAN एवं VLAN हॉपिंग हमला:*
  - डिफ़ॉल्ट रूप से 802.1Q नेटिव VLAN (VLAN 1) के फ्रेम्स को बिना टैग किए भेजता है।
  - *VLAN हॉपिंग हमला:* हमलावर डबल-टैग्ड फ्रेम भेजता है। स्विच बाहरी टैग हटाकर पैकेट को अनपेक्षित VLAN में फॉरवर्ड कर देता है!
  - *सुरक्षा:* सभी ट्रंक लिंक्स पर #hl[नेटिव VLAN को किसी अप्रयुक्त आईडी (उदा. VLAN 999)] पर बदलें:
    `Switch(config-if)# switchport trunk native vlan 999`

#v(3pt)

== 7.5 हैंड्स-ऑन प्रैक्टिकल लैब: VLANs एवं 802.1Q ट्रंकिंग
#text(size: 7.5pt, fill: rtech-text)[*उद्देश्य:* SW1-CORE एवं SW2-ACCESS स्विचेस पर एंटरप्राइज VLAN सेगमेंटेशन तैनात करना। VLAN 10 (इंजीनियरिंग) व VLAN 20 (सेल्स) बनाएं, गीगाबिट अपलिंक पर 802.1Q ट्रंक कॉन्फ़िगर करें, और नेटिव VLAN 999 पर आइसोलेट करें।]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab03-vlan-trunking-topology.svg", width: 88%)
#v(2pt)

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[कैटलिस्ट स्विच ट्रंकिंग एवं VLAN डेटाबेस कॉन्फ़िगरेशन:]
```cisco
! --- चरण 1: SW1 एवं SW2 पर VLANs बनाएं ---
SW1-CORE(config)# vlan 10
SW1-CORE(config-vlan)# name ENGINEERING_DEPT
SW1-CORE(config-vlan)# vlan 20
SW1-CORE(config-vlan)# name SALES_MARKETING
SW1-CORE(config-vlan)# vlan 999
SW1-CORE(config-vlan)# name ISOLATED_NATIVE_TRUNK
SW1-CORE(config-vlan)# exit

! --- चरण 2: 802.1Q ट्रंक अपलिंक कॉन्फ़िगर करें ---
SW1-CORE(config)# interface GigabitEthernet0/1
SW1-CORE(config-if)# description UPLINK_TO_SW2
SW1-CORE(config-if)# switchport mode trunk
SW1-CORE(config-if)# switchport trunk native vlan 999
SW1-CORE(config-if)# switchport trunk allowed vlan 10,20,999
SW1-CORE(config-if)# end
```

#v(2pt)
#terminal-specimen(title: "SW1-CORE# show interfaces trunk")[
```text
Port        Mode             Encapsulation  Status        Native vlan
Gi0/1       on               802.1q         trunking      999

Port        Vlans allowed on trunk
Gi0/1       10,20,999

Port        Vlans in spanning tree forwarding state and not pruned
Gi0/1       10,20,999
```
]

#v(3pt)

== 7.6 स्पैनिंग ट्री प्रोटोकॉल (STP 802.1D) एवं रूट ब्रिज चुनाव गणित
रिडंडेंट लेयर 2 लिंक्स लूप का निर्माण करते हैं। लूप रोकथाम के बिना ब्रॉडकास्ट फ्रेम्स अंतहीन रूप से घूमते रहते हैं, जिससे *ब्रॉडकास्ट स्टॉर्म* उत्पन्न होता है और स्विच क्रैश हो जाते हैं:
- *ब्रिज आईडी (BID) संरचना (8 बाइट्स):*
  - *ब्रिज प्रायोरिटी (2 बाइट्स):* 4-बिट प्रायोरिटी ( increments of #hl[`4096`]; डिफ़ॉल्ट `32768`) + 12-बिट *सिस्टम आईडी एक्सटेंशन* (VLAN ID के बराबर)।
  - *बेस मैक एड्रेस (6 बाइट्स):* स्विच हार्डवेयर का फिजिकल मैक एड्रेस।
  - $ "Bridge ID" = "Priority (उदा. 32768)" + "VLAN ID (उदा. 10)" + "MAC Address" $
- *रूट ब्रिज चुनाव नियम:* जिस स्विच का #hl[Bridge ID न्यूनतम (Lowest)] होता है, वह उस VLAN हेतु रूट ब्रिज बनता है!
  - पहले प्रायोरिटी जांची जाती है: `32768` (डिफ़ॉल्ट) बनाम `4096` (ट्यून)। कम मान जीतता है!
  - यदि प्रायोरिटी बराबर हो, तो सबसे कम मैक एड्रेस वाला स्विच जीतता है।
- *रूट ब्रिज CLI ट्यूनिंग:*
  `Switch(config)# spanning-tree vlan 10 priority 4096` (मैन्युअल रूप से सबसे कम प्रायोरिटी सेट करता है)।

#v(3pt)

== 7.7 STP पोर्ट भूमिकाएं, स्थितियां एवं Rapid PVST+ (802.1w)
रूट ब्रिज चुनाव के पश्चात प्रत्येक नॉन-रूट स्विच अपने पोर्ट्स की भूमिका तय करता है:
- *STP पोर्ट भूमिकाएं:*
  - *Root Port (RP):* नॉन-रूट स्विच पर रूट ब्रिज तक न्यूनतम कॉस्ट वाला ठीक एक पोर्ट। सदैव फॉरवर्ड करता है।
  - *Designated Port (DP):* प्रति सेगमेंट न्यूनतम कॉस्ट वाला ठीक एक पोर्ट। (रूट ब्रिज के सभी पोर्ट्स DP होते हैं!)।
  - *Alternate / Blocking Port (AP):* स्टैंडबाय पोर्ट जो लूप रोकने हेतु ट्रैफिक ब्लॉक करता है; BPDUs सुनता रहता है।
- *STP 802.1D बनाम RSTP 802.1w तुलना:*

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*विशेषता*], [*पारंपरिक STP (802.1D)*], [*Rapid STP (802.1w / PVST+)*], [*इंजीनियरिंग महत्व*]),
  [कन्वर्जेंस समय], [30 से 50 सेकंड (धीमा)], [1 से 2 सेकंड के भीतर (उप-सेकंड)], [नेटवर्क रुकावट को नगण्य करता है।],
  [पोर्ट स्थितियां], [Blocking $arrow$ Listening $arrow$ Learning $arrow$ Forwarding], [Discarding $arrow$ Learning $arrow$ Forwarding], [RSTP लिसनिंग स्थिति को समाप्त करता है।],
  [क्रियाविधि], [पैसिव टाइमर काउंटडाउन], [एक्टिव प्रपोजल-एग्रीमेंट हैंडशेक], [पॉइंट-टू-पॉइंट लिंक पर तुरंत सिंक।],
  [सिस्को डिफ़ॉल्ट], [`spanning-tree mode pvst`], [`spanning-tree mode rapid-pvst`], [सभी आधुनिक सिस्को उपकरणों में मानक।]
)

#v(3pt)

== 7.8 हैंड्स-ऑन प्रैक्टिकल लैब: स्पैनिंग ट्री ट्यूनिंग, पोर्टफास्ट एवं BPDU गार्ड
#text(size: 7.5pt, fill: rtech-text)[*उद्देश्य:* 3-स्विच रिडंडेंट रिंग में स्पैनिंग ट्री ट्यून करना। प्रायोरिटी `4096` देकर SW1 को रूट ब्रिज बनाएं। यूजर एक्सेस पोर्ट्स पर पोर्टफास्ट व BPDU गार्ड लगाएं ताकि 30-सेकंड का विलंब समाप्त हो सके।]

#v(2pt)
#image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab05-stp-topology.svg", width: 88%)
#v(2pt)

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[कैटलिस्ट स्विच STP रूट एवं पोर्टफास्ट कॉन्फ़िगरेशन:]
```cisco
! --- SW1: रूट ब्रिज चुनाव सुनिश्चित करें ---
SW1-CORE(config)# spanning-tree mode rapid-pvst
SW1-CORE(config)# spanning-tree vlan 1,10,20 priority 4096

! --- SW2 / SW3: एक्सेस पोर्ट्स पर PortFast व BPDU Guard ---
SW2-ACCESS(config)# interface range FastEthernet0/1 - 24
SW2-ACCESS(config-if-range)# switchport mode access
SW2-ACCESS(config-if-range)# spanning-tree portfast
SW2-ACCESS(config-if-range)# spanning-tree bpduguard enable
SW2-ACCESS(config-if-range)# end
```

#v(2pt)
#terminal-specimen(title: "SW1-CORE# show spanning-tree vlan 10")[
```text
VLAN0010
  Spanning tree enabled protocol rstp
  Root ID    Priority    4106 (Priority 4096 + sys-id-ext 10)
             Address     0001.42a1.1100
             This bridge is the root
             Hello Time   2 sec  Max Age 20 sec  Forward Delay 15 sec

  Bridge ID  Priority    4106 (Priority 4096 + sys-id-ext 10)
             Address     0001.42a1.1100

Interface           Role Sts Cost      Prio.Nbr Type
------------------- ---- --- --------- -------- --------------------------------
Gi0/1               Desg FWD 4         128.1    P2p
Gi0/2               Desg FWD 4         128.2    P2p
```
]

#v(3pt)

== 7.9 ईथरचैनल (लिंक एग्रीगेशन - 802.3ad)
ईथरचैनल 8 समानांतर ईथरनेट लिंक्स को एक लॉजिकल चैनल (`Port-channel 1`) में बांधता है, जिससे बैंडविड्थ कई गुना बढ़ जाती है और STP रिडंडेंट लिंक को ब्लॉक नहीं करता:
- *नेगोशिएशन प्रोटोकॉल्स:*
  - *LACP (IEEE 802.3ad):* ओपन स्टैंडर्ड। मोड्स: `active` एवं `passive`।
  - *PAgP (Cisco Proprietary):* मोड्स: `desirable` एवं `auto`।
- *सिस्को CLI:*
  `Switch(config)# interface range Gi0/1 - 2 ; channel-group 1 mode active`
  `Switch(config)# interface port-channel 1 ; switchport mode trunk`

#v(3pt)

== व्यापक समीक्षा, अक्सर पूछे जाने वाले प्रश्न (FAQs) एवं मूल्यांकन

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. अक्सर पूछे जाने वाले प्रश्न (Student FAQs)]
#faq-item(q: "स्विचेस के बीच ट्रंक लिंक पर पोर्टफास्ट सक्षम करने का क्या खतरा है?", a: "पोर्टफास्ट लिसनिंग और लर्निंग स्थितियों को बायपास कर पोर्ट को तुरंत फॉरवर्डिंग में ले जाता है। यदि यह किसी अन्य स्विच से जुड़े लिंक पर लगा हो, तो तुरंत लूप बन जाएगा और पूरा लैन क्रैश हो जाएगा!")
#faq-item(q: "BPDU प्राप्त होने पर BPDU गार्ड पोर्ट को बंद क्यों कर देता है?", a: "पोर्टफास्ट वाले पोर्ट केवल एंड-यूजर पीसी के लिए होते हैं। यदि वहां BPDU आता है, तो सिद्ध होता है कि किसी ने अनाधिकृत स्विच प्लग कर दिया है। BPDU गार्ड नेटवर्क स्थिरता हेतु पोर्ट को err-disable कर देता है।")
#faq-item(q: "STP प्रायोरिटी 4096 के गुणज में ही क्यों कॉन्फ़िगर होती है?", a: "16-बिट प्रायोरिटी फील्ड को 4-बिट ब्रिज प्रायोरिटी और 12-बिट VLAN ID (सिस्टम एक्सटेंशन) में बांटा गया है। सबसे महत्वपूर्ण 4 बिट्स का मान $2^{12} = 4096$ होता है।")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. लघु-उत्तरीय समीक्षा प्रश्न]
#short-q(num: 1, q: "सिस्को स्विच CAM टेबल में किसी एंट्री का डिफ़ॉल्ट एजिंग टाइमर क्या है?", ans: "300 सेकंड (5 मिनट)।")
#short-q(num: 2, q: "सिस्को कैटलिस्ट स्विच में सामान्य VLAN डेटाबेस कहां सुरक्षित रहता है?", ans: "flash:vlan.dat (फ्लैश मेमोरी में)।")
#short-q(num: 3, q: "VLAN ट्रंकिंग एनकैप्सुलेशन का मानक IEEE प्रोटोकॉल नंबर क्या है?", ans: "IEEE 802.1Q (डॉट1क्यू)।")
#short-q(num: 4, q: "कौन सा पोर्ट सिक्योरिटी मोड फ्रेम ड्रॉप करता है, चेतावनी भेजता है, पर पोर्ट बंद नहीं करता?", ans: "Restrict मोड।")
#short-q(num: 5, q: "डायनामिक लिंक एग्रीगेशन / ईथरचैनल का IEEE ओपन स्टैंडर्ड प्रोटोकॉल क्या है?", ans: "IEEE 802.3ad / 802.1AX (LACP)।")

#v(2pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 उच्च-अंक बहुविकल्पीय प्रश्न (MCQs)]
#mcq(num: 1, q: "अज्ञात गंतव्य यूनिकास्ट मैक एड्रेस वाला फ्रेम मिलने पर स्विच क्या करता है?", a: "तुरंत फ्रेम ड्रॉप करता है", b: "प्राप्तकर्ता पोर्ट को छोड़कर उसी VLAN के सभी पोर्ट्स पर फ्लड करता है", c: "ICMP रीडायरेक्ट भेजता है", d: "NVRAM में स्टोर करता है", ans: "B", expl: "अननोन यूनिकास्ट फ्रेम्स को ARP द्वारा होस्ट खोजने हेतु पूरे संबंधित VLAN में फ्लड किया जाता है।")
#mcq(num: 2, q: "स्विचपोर्ट को VLAN 20 में असाइन कर एंड-यूजर हेतु कॉन्फ़िगर करने वाली कमांड क्या है?", a: "switchport mode trunk ; switchport access vlan 20", b: "switchport mode access ; switchport access vlan 20", c: "vlan 20 access-mode", d: "switchport trunk native vlan 20", ans: "B", expl: "एक्सेस पोर्ट switchport mode access तथा switchport access vlan <id> द्वारा कॉन्फ़िगर होता है।")
#mcq(num: 3, q: "स्पैनिंग ट्री में 8-बाइट ब्रिज आईडी (BID) किन दो घटकों से मिलकर बनती है?", a: "आईपी एड्रेस एवं पोर्ट नंबर", b: "2-बाइट प्रायोरिटी (VLAN एक्सटेंशन सहित) एवं 6-बाइट बेस मैक एड्रेस", c: "सीरियल नंबर व होस्टनेम", d: "पाथ कॉस्ट व टाइमर", ans: "B", expl: "BID में 2 बाइट प्रायोरिटी और स्विच का 6 बाइट हार्डवेयर मैक एड्रेस शामिल होता है।")
#mcq(num: 4, q: "BPDU गार्ड सक्षम होने पर BPDU मिलने पर एक्सेस पोर्ट किस स्थिति में चला जाता है?", a: "Listening", b: "Blocking", c: "err-disabled (Secure-down)", d: "Forwarding", ans: "C", expl: "BPDU गार्ड अनाधिकृत स्विच इंजेक्शन को रोकने हेतु पोर्ट को err-disabled कर देता है।")
#mcq(num: 5, q: "PAgP में कौन सा मोड युग्म सक्रिय ईथरचैनल स्थापित करेगा?", a: "auto और auto", b: "desirable और auto", c: "passive और active", d: "on और auto", ans: "B", expl: "PAgP में नेगोशिएशन शुरू करने हेतु कम से कम एक ओर 'desirable' होना अनिवार्य है।")

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "VLAN 1 सुरक्षा जोखिम")[
      फ़ैक्टरी डिफ़ॉल्ट VLAN 1 हटाया नहीं जा सकता। सुरक्षा हेतु सभी उपयोगकर्ताओं को अन्य VLANs में ले जाएं और नेटिव VLAN को 999 पर सेट करें!
    ]
  ],
  [
    #tech-spotlight-box(title: "डेटा सेंटर में VXLAN")[
      आधुनिक क्लाउड डेटा सेंटर्स 4,096 VLAN सीमा के स्थान पर VXLAN का उपयोग करते हैं, जो 16 मिलियन नेटवर्क सेगमेंट्स का समर्थन करता है!
    ]
  ]
)
