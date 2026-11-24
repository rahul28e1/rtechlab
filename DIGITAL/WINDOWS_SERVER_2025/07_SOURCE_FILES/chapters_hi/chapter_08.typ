// =============================================================================
// CHAPTER 08: DHCP SERVER ROLE: SCOPES, RESERVATIONS & FAILOVER
// =============================================================================

[#metadata("ch8") <chapter-8>]

#chapter-header(
  chapter-num: "CHAPTER 08",
  category: "भाग 8 : स्वचालित नेटवर्क आईपी एड्रेसिंग (Dynamic Host Configuration)",
  title: "DHCP सर्वर कॉन्फ़िगरेशन: स्कोप, एक्सक्लूज़न, रिज़र्वेशन एवं फेलओवर",
  subtitle: "DORA 4-स्टेप प्रक्रिया · AD ऑथराइजेशन · IPv4 स्कोप · सबनेट मास्क · लीज ड्यूरेशन · एक्सक्लूज़न रेंज · MAC रिज़र्वेशन · 80/20 स्प्लिट-स्कोप व फेलओवर क्लस्टर"
)

=== 8.1 DHCP क्या है? और DORA 4-चरण प्रक्रिया
जब कोई नया लैपटॉप या स्मार्टफोन कंपनी के वाई-फाई या लैन केबल से जुड़ता है, तो उसे नेटवर्क पर बातचीत करने के लिए एक अद्वितीय IP एड्रेस, सबनेट मास्क, डिफ़ॉल्ट गेटवे और DNS सर्वर की आवश्यकता होती है।

#mark-yellow[डायनामिक होस्ट कॉन्फ़िगरेशन प्रोटोकॉल (DHCP) एक क्लाइंट-सर्वर नेटवर्किंग प्रोटोकॉल है जो नेटवर्क से जुड़ने वाले प्रत्येक क्लाइंट कंप्यूटर को स्वचालित रूप से IP पते और नेटवर्क पैरामीटर्स एक निश्चित समय अवधि (Lease) के लिए आवंटित करता है।]

क्लाइंट और DHCP सर्वर के बीच IP आवंटन की प्रक्रिया को #hl-yellow[DORA प्रक्रिया] कहा जाता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dhcp_dora_process.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 8.1: DHCP 4-चरणीय DORA लाइफसाइकिल — Discover, Offer, Request, एवं Acknowledge (UDP Port 67/68)]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[DORA प्रक्रिया के 4 चरण (MNC Interview Decider):]\
    - #text(weight: "bold", fill: rtech-blue)[1. D (DHCPDISCOVER):] क्लाइंट के पास अभी कोई IP नहीं है। वह स्रोत IP `0.0.0.0` और गंतव्य IP `255.255.255.255` (Broadcast) के साथ नेटवर्क पर चिल्लाता है: *"क्या इस नेटवर्क पर कोई DHCP सर्वर मौजूद है?"* #hl-green[UDP पोर्ट: 67]।
    - #text(weight: "bold", fill: rtech-emerald)[2. O (DHCPOFFER):] नेटवर्क पर मौजूद DHCP सर्वर अपने उपलब्ध पूल में से एक अप्रयुक्त IP निकालता है और क्लाइंट को ऑफर भेजता है: *"मेरे पास IP 192.168.1.100 उपलब्ध है, क्या तुम इसे लेना चाहते हो?"* #hl-green[UDP पोर्ट: 68]।
    - #text(weight: "bold", fill: rtech-amber)[3. R (DHCPREQUEST):] क्लाइंट उस ऑफर को स्वीकार करता है और ब्रॉडकास्ट संदेश भेजता है: *"हाँ, मुझे सर्वर 192.168.1.10 द्वारा दिया गया IP 192.168.1.100 स्वीकार है!"*
    - #text(weight: "bold", fill: rtech-blue)[4. A (DHCPACK):] DHCP सर्वर पावती (Acknowledgement) भेजता है, IP को अपनी डेटाबेस में लीज पर बुक करता है, और गेटवे तथा DNS की जानकारी सौंपता है।
  ]
)

#v(6pt)

=== 8.2 DHCP सर्वर रोल इंस्टॉलेशन एवं एक्टिव डायरेक्टरी ऑथराइजेशन
1. Server Manager -> #hl-green[Manage -> Add Roles and Features] में जाएं।
2. Server Roles में #mark-yellow[DHCP Server] चेकबॉक्स पर टिक करें।
3. 'Add Features' (DHCP RSAT टूल्स) शामिल करके 'Next' -> 'Next' -> 'Install' करें।
4. इंस्टॉलेशन पूर्ण होने पर पीले झंडे (Notification) पर क्लिक करें -> #hl-yellow['Complete DHCP Configuration']।
5. विज़ार्ड में #text(weight: "bold", fill: rtech-navy)[Authorization] स्क्रीन आएगी। 'Commit' दबाएं ताकि हमारा डोमेन कंट्रोलर इस DHCP सर्वर को एक्टिव डायरेक्टरी में अधिकृत (Authorize) कर दे।

#warning-box(title: "Rogue DHCP Server Prevention (एंटरप्राइज सुरक्षा तंत्र)")[
  यदि कोई अनधिकृत व्यक्ति या छात्र नेटवर्क में अपना निजी राउटर या अनधिकृत DHCP सर्वर चालू कर दे (Rogue DHCP Server), तो विंडोज डोमेन कंट्रोलर उसे तुरंत डिटेक्ट कर लेता है। एक्टिव डायरेक्टरी में गैर-अधिकृत DHCP सर्वर्स की सर्विस को विंडोज स्वतः बंद (Stop) कर देता है ताकि कर्मचारियों को गलत IP न मिले।
]

#v(6pt)

=== 8.3 नया IPv4 स्कोप बनाना (Configuring an IPv4 Scope)
एक स्कोप (Scope) IP पतों की वह वैध सीमा होती है जिसे सर्वर क्लाइंट्स को बांटता है:

1. Server Manager -> Tools -> #hl-yellow[DHCP] कंसोल खोलें (या रन में टाइप करें: #mark-green[`dhcpmgmt.msc`])।
2. सर्वर नाम `SRV-2025-DC01` का विस्तार करें -> #text(weight: "bold")[IPv4] पर राइट-क्लिक करें -> #hl-green[New Scope...] चुनें।
3. Scope Name: #hl-yellow[`RTechLab-LAN-Scope`]।
4. #text(weight: "bold")[IP Address Range (आईपी पूल):]
   - Start IP address: #hl-green[`192.168.1.100`]
   - End IP address: #hl-green[`192.168.1.200`]
   - Length: #hl-green[`24`], Subnet mask: #hl-green[`255.255.255.0`]
5. #text(weight: "bold")[Lease Duration (पट्टे की अवधि):] डिफ़ॉल्ट रूप से #hl-yellow[8 दिन] होती है। ऑफिस के वायर्ड डेस्कटॉप के लिए 8 दिन उपयुक्त है, लेकिन एयरपोर्ट या कैफे के गेस्ट वाई-फाई के लिए इसे 2 से 4 घंटे रखा जाता है।

#v(6pt)

=== 8.4 एक्सक्लूज़न रेंज एवं आवश्यक DHCP ऑप्शंस
- #text(weight: "bold", fill: rtech-rose)[Add Exclusions and Delay (एक्सक्लूज़न रेंज):] यदि हमारे पूल में कुछ ऐसे IP पते हैं जिन्हें हम किसी क्लाइंट को नहीं देना चाहते (उदा. आईटी टेस्टिंग लैब के लिए), तो उन्हें बाहर रखा जाता है:
  - Start IP: `192.168.1.150` से End IP: `192.168.1.160` डालकर 'Add' करें।
- #text(weight: "bold", fill: rtech-navy)[Configure DHCP Options:]
  - #text(weight: "bold", fill: rtech-blue)[Option 003 (Router / Default Gateway):] `192.168.1.1` डालकर 'Add' करें।
  - #text(weight: "bold", fill: rtech-emerald)[Option 006 (DNS Servers):] `192.168.1.10` (हमारा AD DNS सर्वर) प्राथमिकता में जोड़ें।
  - #text(weight: "bold", fill: rtech-amber)[Option 015 (Domain Name):] `corp.rtechlab.local` दर्ज करें।
6. 'Yes, I want to activate this scope now' चुनकर 'Finish' करें!

#v(6pt)

=== 8.5 MAC एड्रेस रिज़र्वेशन (Reservations for Network Printers)
ऑफिस में नेटवर्क प्रिंटर्स, स्कैनर्स और सीसीटीवी कैमरों का IP कभी नहीं बदलना चाहिए, अन्यथा कर्मचारी प्रिंट नहीं दे पाएंगे। इसके लिए हम MAC रिज़र्वेशन का उपयोग करते हैं:

1. DHCP कंसोल में अपने स्कोप के अंदर #hl-yellow[Reservations] फोल्डर पर राइट-क्लिक करें -> #hl-green[New Reservation...]।
2. Reservation name: #hl-yellow[`HP-Network-Printer-HR`]।
3. IP address: #hl-green[`192.168.1.105`]।
4. MAC address: प्रिंटर का 12-अंकों का हेक्साडेसिमल मैक एड्रेस दर्ज करें (उदा. `00155D01A23B`)।
5. Supported types: #hl-yellow['Both (DHCP and BOOTP)'] चुनकर 'Add' करें।
अब जब भी वह प्रिंटर नेटवर्क पर चालू होगा, DHCP सर्वर उसके मैक एड्रेस को पहचानकर हमेशा यही फिक्स्ड IP `192.168.1.105` ही देगा!

#v(6pt)

=== 8.6 हाई अवेलेबिलिटी: DHCP 80/20 स्प्लिट-स्कोप एवं क्लस्टर फेलओवर
यदि एकमात्र DHCP सर्वर क्रैश हो जाए, तो लीज समाप्त होने पर पूरे ऑफिस का इंटरनेट और नेटवर्क बंद हो जाएगा। इसे रोकने के दो तरीके हैं:

1. #text(weight: "bold", fill: rtech-navy)[80/20 स्प्लिट स्कोप नियम (Legacy Standard):] प्राथमिक DC पर 80% IP पूल दिया जाता है और सेकेंडरी DC पर उसी सबनेट का 20% पूल रखा जाता है ताकि प्राइमरी के डाउन होने पर 20% मशीनें चलती रहें।
2. #text(weight: "bold", fill: rtech-emerald)[आधुनिक DHCP Failover (Windows Server 2025):]
   - IPv4 स्कोप पर राइट-क्लिक करें -> #hl-green[Configure Failover...]।
   - पार्टनर सर्वर (`SRV-2025-DC02`) को चुनें।
   - मोड चुनें:
     - #text(weight: "bold")[Load Balance Mode:] दोनों सर्वर्स 50%-50% ट्रैफिक साझा करते हैं।
     - #text(weight: "bold")[Hot Standby Mode:] एक्टिव सर्वर 100% कार्य करता है, और उसके डाउन होने पर स्टैंडबाय सर्वर तत्काल कार्यभार संभाल लेता है।

#v(8pt)

// =============================================================================
// CHAPTER 08 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  DHCP ब्रॉडकास्ट ट्रैफिक लेयर-3 राउटर को पार नहीं कर सकता। यदि किसी कंपनी में 10 अलग-अलग VLANs या बिल्डिंग्स हैं, तो क्या हर फ्लोर पर अलग DHCP सर्वर लगाना पड़ेगा? बिल्कुल नहीं! सिस्को रूटर या स्विच पर #hl-yellow[DHCP Relay Agent] (सिस्को कमांड: `ip helper-address 192.168.1.10`) सक्षम किया जाता है, जो क्लाइंट के ब्रॉडकास्ट पैकेट को यूनिकास्ट पैकेट में बदलकर केंद्रीय DHCP सर्वर तक पहुंचा देता है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 08 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "DHCP IP आवंटन की 4-चरणीय DORA प्रक्रिया का सही पूर्ण रूप क्या है?",
  optA: "Domain, Origin, Routing, Access",
  optB: "Discover, Offer, Request, Acknowledge",
  optC: "Detect, Open, Receive, Assign",
  optD: "Data, Output, Response, Authentication",
  ans: "B",
  exp: "DORA का पूर्ण रूप है: DHCPDISCOVER, DHCPOFFER, DHCPREQUEST, एवं DHCPACK।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "क्लाइंट कंप्यूटर नेटवर्क पर DHCPDISCOVER पैकेट भेजते समय किस UDP पोर्ट नंबर का उपयोग करता है?",
  optA: "UDP पोर्ट 53",
  optB: "UDP पोर्ट 67",
  optC: "UDP पोर्ट 80",
  optD: "UDP पोर्ट 445",
  ans: "B",
  exp: "DHCP सर्वर UDP पोर्ट 67 पर सुनता है, जबकि क्लाइंट UDP पोर्ट 68 पर रिस्पॉन्स प्राप्त करता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "DHCP स्कोप विकल्पों में क्लाइंट कंप्यूटरों को 'Default Gateway (राउटर)' का IP एड्रेस प्रदान करने के लिए किस आधिकारिक विकल्प संख्या का उपयोग किया जाता है?",
  optA: "Option 003",
  optB: "Option 006",
  optC: "Option 015",
  optD: "Option 066",
  ans: "A",
  exp: "Option 003 Router (Default Gateway) के लिए और Option 006 DNS Servers के लिए आरक्षित है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "नेटवर्क प्रिंटर या सर्वर को हर बार एक ही विशिष्ट IP एड्रेस स्वतः आवंटित करने के लिए किस तकनीक का उपयोग किया जाता है?",
  optA: "Exclusion Range",
  optB: "MAC Address Reservation",
  optC: "APIPA Auto-IP",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "MAC रिज़र्वेशन डिवाइस के भौतिक मैक एड्रेस को DHCP स्कोप के भीतर एक निश्चित IP से स्थायी रूप से मैप कर देता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "यदि नेटवर्क पर कोई DHCP सर्वर उपलब्ध न हो, तो विंडोज 11 क्लाइंट स्वचालित रूप से किस IP रेंज में से APIPA एड्रेस उठा लेता है?",
  optA: "10.0.0.1 से 10.0.0.254",
  optB: "169.254.0.1 से 169.254.255.254",
  optC: "192.168.1.1 से 192.168.1.254",
  optD: "172.16.0.1 से 172.16.0.254",
  ans: "B",
  exp: "APIPA (Automatic Private IP Addressing) 169.254.0.0/16 सबनेट में से आईपी चुनता है जो DHCP विफलता का संकेत है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'क्लाइंट मशीन को 169.254.x.x का IP मिला है। इसका क्या अर्थ है और आप इसे कैसे ठीक करेंगे?'",
  a: "उत्तर: 169.254.x.x एक APIPA (Automatic Private IP Addressing) एड्रेस है। इसका सीधा अर्थ है कि क्लाइंट ने DHCPDISCOVER ब्रॉडकास्ट भेजा लेकिन नेटवर्क पर किसी भी DHCP सर्वर ने जवाब नहीं दिया। ट्रबलशूटिंग के लिए: 1. लैन केबल/VLAN पोर्ट की जाँच करेंगे, 2. DHCP सर्वर पर जाकर स्कोप पूल भर जाने (Pool Exhaustion) की जाँच करेंगे, 3. 'ipconfig /release' और 'ipconfig /renew' चलाएंगे।",
  tip: "HCL, Infosys और TCS के L1/L2 नेटवर्क सपोर्ट इंटरव्यू का यह सबसे आम प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'DHCP Lease Renewal प्रक्रिया कब शुरू होती है, और T1 व T2 टाइमर्स क्या हैं?'",
  a: "उत्तर: लीज अवधि के 50% समय बीतने पर (T1 Timer - उदा. 8 दिन की लीज में 4 दिन बाद) क्लाइंट मूल DHCP सर्वर को 'DHCPREQUEST' यूनिकास्ट भेजकर लीज रिन्यू करने का प्रयास करता है। यदि मूल सर्वर जवाब नहीं देता, तो 87.5% समय बीतने पर (T2 Timer - 7वें दिन) क्लाइंट नेटवर्क पर किसी भी अन्य उपलब्ध DHCP सर्वर को ब्रॉडकास्ट भेजता है। यदि 100% समय तक रिन्यू नहीं हुआ, तो IP स्वतः रिलीज हो जाता है।",
  tip: "यह डीप टेक्निकल उत्तर इंटरव्यूअर को तुरंत आश्वस्त करता है कि आप प्रोटोकॉल के आंतरिक टाइमर्स को जानते हैं।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'Rogue DHCP Server क्या होता है और Active Directory Authorization इसे कैसे निष्प्रभावी बनाती है?'",
  a: "उत्तर: Rogue DHCP वह अनधिकृत सर्वर होता है जो नेटवर्क पर अनपेक्षित IP और गलत गेटवे बांटकर Man-in-the-Middle (MitM) अटैक कर सकता है। विंडोज डोमेन एनवायरनमेंट में सभी DHCP सर्वर्स को AD में 'Authorize' होना पड़ता है (AD के Configuration Partition में लिस्टिंग)। जब कोई अनाधिकृत विंडोज सर्वर DHCP चालू करता है, तो वह पहले AD की सूची जांचता है; नाम न मिलने पर उसकी DHCP सर्विस स्वतः बंद हो जाती है।",
  tip: "एंटरप्राइज नेटवर्क सिक्योरिटी से जुड़ा यह बहुत हाई-वैल्यू प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'राउटर के पार दूसरे सबनेट पर स्थित क्लाइंट्स को केंद्रीय DHCP सर्वर से IP दिलाने के लिए क्या कॉन्फ़िगर किया जाता है?'",
  a: "उत्तर: चूंकि DHCP ब्रॉडकास्ट राउटर्स को पार नहीं कर सकते, इसलिए उस रिमोट सबनेट के गेटवे राउटर पर 'DHCP Relay Agent' (Cisco में 'ip helper-address <DHCP-IP>') कॉन्फ़िगर किया जाता है। रिले एजेंट ब्रॉडकास्ट को यूनिकास्ट पैकेट में बदलकर केंद्रीय DHCP सर्वर तक पहुंचाता है।",
  tip: "नेटवर्किंग और सर्वर इंफ्रास्ट्रक्चर के साझा इंटरव्यू राउंड का यह मानक प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'Windows Server 2025 में DHCP Failover के 'Load Balance' और 'Hot Standby' मोड्स में क्या अंतर है?'",
  a: "उत्तर: Load Balance मोड में दोनों पार्टनर्स सक्रिय रहते हैं और निर्धारित अनुपात (उदा. 50:50) में क्लाइंट अनुरोधों को प्रोसेस करते हैं (मल्टी-सर्वर साइट्स के लिए बेस्ट)। Hot Standby मोड में एक सर्वर मुख्य (Active) रहता है और दूसरा निष्क्रिय (Standby) रहता है; जब एक्टिव डाउन होता है, तभी स्टैंडबाय सर्वर लीज देना शुरू करता है (Hub-and-Spoke ब्रांच आर्किटेक्चर के लिए बेस्ट)।",
  tip: "हाई-अवेलेबिलिटी और डिज़ास्टर रिकवरी आर्किटेक्चर का कोर सवाल।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 08 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - DHCP सर्वर DORA प्रक्रिया द्वारा ऑटोमैटिक IP, सबनेट मास्क, गेटवे (Opt 003) और DNS (Opt 006) आवंटित करता है।
      - नेटवर्क प्रिंटर्स और फिक्स्ड डिवाइसेज के लिए MAC Reservation का उपयोग करें; कभी मैन्युअल IP न डालें।
      - 169.254.x.x (APIPA) का दिखना DHCP सर्वर विफलता या नेटवर्क डिस्कनेक्शन का स्पष्ट संकेत है।
    ]
  ]
)

#pagebreak()

