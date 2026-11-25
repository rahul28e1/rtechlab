// =============================================================================
// CHAPTER 03: POST-INSTALLATION HARDENING & BASELINE CONFIGURATION
// =============================================================================

[#metadata("ch3") <chapter-3>]

#chapter-header(
  chapter-num: "CHAPTER 03",
  category: "भाग 3 : सर्वर बेसलाइन एवं सुरक्षा (Server Baseline & Hardening)",
  title: "पोस्ट-इंस्टॉलेशन कॉन्फ़िगरेशन एवं सर्वर हार्डनिंग (Hardening & Initial Setup)",
  subtitle: "#hl-yellow[सर्वर मैनेजर] डैशबोर्ड · कंप्यूटर नामकरण (SRV-2025-DC01) · स्टैटिक IPv4 एवं DNS · रिमोट डेस्कटॉप (RDP) व NLA · फ़ायरवॉल पोर्ट्स · NTP क्लॉक सिंक्रोनाइज़ेशन"
)

=== 3.1 #hl-yellow[सर्वर मैनेजर] डैशबोर्ड (#hl-yellow[Server Manager] Dashboard Navigation)
विंडोज सर्वर में लॉगिन करते ही सबसे पहले #hl-yellow[Server Manager] स्वतः खुलता है। यह माइक्रोसॉफ्ट का केंद्रीय प्रबंधन कंसोल है जिसके माध्यम से आप स्थानीय सर्वर और नेटवर्क पर मौजूद अन्य रिमोट सर्वर्स को एक ही स्थान से नियंत्रित कर सकते हैं।

डैशबोर्ड के बाईं ओर मुख्य नेविगेशन पैनल्स होते हैं:
1. #text(weight: "bold", fill: rtech-navy)[Dashboard:] सर्वर के समग्र स्वास्थ्य, सक्रिय इवेंट्स और रोल्स का त्वरित स्टेटस दिखाता है।
2. #text(weight: "bold", fill: rtech-navy)[Local Server:] इस मशीन की पहचान (Computer Name, Workgroup/Domain), नेटवर्क एडेप्टर, रिमोट डेस्कटॉप, और विंडोज अपडेट्स की स्थिति प्रदर्शित करता है।
3. #text(weight: "bold", fill: rtech-navy)[All Servers:] यदि आपने सर्वर पूल में एकाधिक सर्वर्स जोड़े हैं, तो उनकी सूची यहाँ दिखाई देती है।
4. #text(weight: "bold", fill: rtech-navy)[Roles and Server Groups:] जैसे ही आप AD DS, DNS या DHCP इंस्टॉल करेंगे, उनके विशिष्ट टैब्स यहाँ स्वतः जुड़ जाएंगे।

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_hardening_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 3.1: Windows Server 2025 पोस्ट-इंस्टॉलेशन 5-चरणीय हार्डनिंग एवं बेसलाइन कॉन्फ़िगरेशन फ्लो]
]

#v(4pt)

=== 3.2 सर्वर का कॉर्पोरेट नामकरण (Enterprise Naming Conventions)
डिफ़ॉल्ट रूप से विंडोज सर्वर को एक रैंडम नाम दिया जाता है (जैसे `WIN-7K9A3B58Z1`)। उत्पादन वातावरण (Production) में किसी सर्वर को इस तरह के नाम के साथ कभी नहीं छोड़ा जाता, विशेष रूप से तब जब उसे डोमेन कंट्रोलर बनाना हो।

#warning-box(title: "गोल्डन रूल: डोमेन कंट्रोलर प्रमोट करने से पहले कंप्यूटर का नाम बदलें")[
  एक बार जब आप सर्वर को एक्टिव डायरेक्टरी डोमेन कंट्रोलर बना देते हैं, तो उसका नाम बदलना अत्यधिक जटिल और जोखिम भरा हो जाता है क्योंकि #hl-orange[Kerberos] SPNs, DNS SRV रिकॉर्ड्स और AD डेटाबेस उसी नाम से बंध जाते हैं। अतः #hl-orange[DC प्रमोशन से पूर्व ही सर्वर का स्थायी नामकरण करें]।
]

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[एंटरप्राइज नामकरण मानक (Corporate Naming Standard):]\
    - #hl-green[`SRV-2025-DC01`]: Primary Domain Controller (Head Office)\
    - #hl-green[`SRV-2025-DC02`]: Additional / Backup Domain Controller\
    - #hl-green[`SRV-2025-FS01`]: File & Storage Server\
    - #hl-green[`SRV-2025-WEB01`]: IIS Web Server
  ]
)

#v(4pt)
*नाम बदलने के चरण:*
1. #hl-yellow[Server Manager] खोलें और बाईं ओर #hl-yellow[Local Server] पर क्लिक करें।
2. #text(weight: "bold")[Computer name] के सामने दिए गए रैंडम नाम (उदा. `WIN-XXXXX`) पर क्लिक करें।
3. System Properties विंडो में #hl-green['Change...'] बटन पर क्लिक करें।
4. Computer name बॉक्स में नया नाम दर्ज करें: #hl-yellow[`SRV-2025-DC01`]।
5. 'OK' दबाएं। सिस्टम चेतावनी देगा कि बदलाव लागू करने के लिए रीबूट आवश्यक है। अभी रीबूट न करें (हम IP सेट करने के बाद एक साथ रीस्टार्ट करेंगे)।

#v(6pt)

=== 3.3 स्टैटिक IPv4 एवं DNS एड्रेसिंग कॉन्फ़िगरेशन (Static IP Assignment)
सर्वर हमेशा क्लाइंट्स को सेवाएं प्रदान करता है। यदि सर्वर का IP एड्रेस DHCP द्वारा हर कुछ दिनों में बदलता रहेगा, तो क्लाइंट्स डोमेन लॉगिन, शेयर ड्राइव या DNS रेजोल्यूशन नहीं कर पाएंगे। इसलिए #hl-yellow[सर्वर को हमेशा फिक्स्ड स्टैटिक IP एड्रेस दिया जाता है]।

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "हमारी लैब का नेटवर्क प्लान (Lab Subnet)")[
      - #text(weight: "bold")[IP Address:] #hl-green[`192.168.1.10`]
      - #text(weight: "bold")[Subnet Mask:] #hl-green[`255.255.255.0 (/24)`]
      - #text(weight: "bold")[Default Gateway:] #hl-green[`192.168.1.1`]
      - #text(weight: "bold")[Preferred DNS:] #hl-yellow[`127.0.0.1`] (Loopback)
      - #text(weight: "bold")[Alternate DNS:] #hl-green[`192.168.1.10`]
    ]
  ],
  [
    #warning-box(title: "DNS लूपबैक का अनिवार्य नियम")[
      चूंकि यही मशीन हमारी प्राथमिक DNS सर्वर भी बनेगी, इसलिए Preferred DNS में #hl-orange[`127.0.0.1`] (या सर्वर का अपना IP) ही डालना चाहिए। यदि आपने यहाँ `8.8.8.8` (Google DNS) डाल दिया, तो एक्टिव डायरेक्टरी का डोमेन कभी जॉइन नहीं हो पाएगा!
    ]
  ]
)

#v(4pt)
*स्टैटिक IP सेट करने के चरण:*
1. Run डायलॉग (`Win + R`) खोलें और टाइप करें: #hl-green[`ncpa.cpl`] (Network Connections)।
2. 'Ethernet' एडेप्टर पर राइट-क्लिक करके #hl-yellow[Properties] चुनें।
3. #text(weight: "bold")[Internet Protocol Version 4 (TCP/IPv4)] को सेलेक्ट करके 'Properties' पर क्लिक करें।
4. 'Use the following IP address' रेडियो बटन चुनें और उपरोक्त मान भरें।
5. 'OK' -> 'Close' करें। अब सर्वर को रीस्टार्ट करें ताकि नया कंप्यूटर नाम और IP पूरी तरह सक्रिय हो जाएं।

#v(6pt)

=== 3.4 रिमोट डेस्कटॉप (RDP - #hl-green[Port 3389]) एवं NLA सुरक्षा
डेटा सेंटर में सर्वर हमेशा साउंडप्रूफ सर्वर रूम में रैक के अंदर बंद रहते हैं। सिस्टम एडमिनिस्ट्रेटर कभी भी सर्वर के सामने बैठकर काम नहीं करता, बल्कि अपने लैपटॉप से #hl-yellow[Remote Desktop Protocol (RDP)] के जरिए सर्वर को कनेक्ट करता है।

*RDP सक्षम एवं सुरक्षित करने के चरण:*
1. #hl-yellow[Server Manager] -> #hl-yellow[Local Server] पर जाएं।
2. #text(weight: "bold")[Remote Desktop] विकल्प के सामने 'Disabled' पर क्लिक करें।
3. System Properties में #hl-green['Allow remote connections to this computer'] चुनें।
4. #mark-orange['Allow connections only from computers running Remote Desktop with Network Level Authentication (recommended)'] चेकबॉक्स को अनिवार्य रूप से टिक रखें।
5. 'OK' पर क्लिक करें।

#pro-tip(title: "NLA (Network Level Authentication) क्यों जीवन रक्षक है?")[
  NLA के बिना, कोई भी अटैकर सर्वर के साथ RDP सेशन शुरू कर सकता है और लॉगिन स्क्रीन पर ब्रूट-फोर्स या DoS अटैक कर सकता है। NLA यह सुनिश्चित करता है कि RDP सेशन स्थापित होने से पहले ही क्लाइंट को क्रेडेंशियल्स सत्यापित करने होंगे, जिससे सर्वर के संसाधन सुरक्षित रहते हैं। RDP डिफ़ॉल्ट रूप से #hl-green[TCP Port 3389] पर सुनता है।
]

#v(6pt)

=== 3.5 विंडोज डिफ़ेंडर फ़ायरवॉल पोर्ट हार्डनिंग (Firewall Configuration)
डिफ़ॉल्ट रूप से विंडोज सर्वर का फ़ायरवॉल ICMP Echo Requests (Ping) को ब्लॉक रखता है। लैब में नेटवर्क कनेक्टिविटी टेस्ट करने के लिए Ping की अनुमति देना आवश्यक है:

1. Run (`Win + R`) में टाइप करें: #hl-green[`wf.msc`] (Windows Defender Firewall with Advanced Security)।
2. बाईं ओर #hl-yellow[Inbound Rules] पर क्लिक करें।
3. सूची में खोजें: #text(weight: "bold")[File and Printer Sharing (Echo Request - ICMPv4-In)]।
4. उस पर राइट-क्लिक करके #hl-green[Enable Rule] चुनें। अब आपकी VM नेटवर्क पर पिंग का जवाब देने लगेगी।

#v(6pt)

=== 3.6 टाइम ज़ोन एवं NTP क्लॉक सिंक्रोनाइज़ेशन (#hl-orange[Kerberos] Time Skew Rule)
एक्टिव डायरेक्टरी का संपूर्ण सुरक्षा ढांचा #hl-yellow[Kerberos v5] ऑथेंटिकेशन प्रोटोकॉल पर निर्भर करता है। #hl-orange[Kerberos] रिप्ले अटैक्स (Replay Attacks) को रोकने के लिए टाइमस्टैम्प्स का उपयोग करता है।

#warning-box(title: "5-Minute #hl-orange[Kerberos] Clock Skew (इंटरव्यू का क्लासिक प्रश्न)")[
  यदि डोमेन कंट्रोलर और क्लाइंट मशीन की घड़ी के बीच #hl-orange[5 मिनट से अधिक का समय अंतर (Clock Skew)] हो जाता है, तो #hl-orange[Kerberos] ऑथेंटिकेशन टिकट खारिज (Reject) कर देगा और यूजर डोमेन में लॉगिन नहीं कर पाएगा!
]

*NTP कॉन्फ़िगरेशन कमांड्स:*
- वर्तमान समय स्थिति जांचें: #hl-green[`w32tm /query /status`]
- बाहरी विश्वसनीय NTP सर्वर से सिंक करें:
```cmd
w32tm /config /manualpeerlist:"pool.ntp.org" /syncfromflags:manual /reliable:yes /update
net stop w32time && net start w32time
w32tm /resync
```

#v(8pt)

// =============================================================================
// CHAPTER 03 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows Server 2025 में माइक्रोसॉफ्ट ने सुरक्षा को इतना कड़ा कर दिया है कि पुराने #hl-yellow[NTLMv1] प्रोटोकॉल को पूरी तरह ब्लॉक कर दिया गया है और SMB फाइल शेयरिंग में #hl-yellow[SMB Signing] को डिफ़ॉल्ट रूप से सभी कनेक्शंस के लिए अनिवार्य (Mandatory) कर दिया गया है। इससे कॉर्पोरेट नेटवर्क पर होने वाले मैन-इन-द-मिडिल (MitM) और NTLM रिले अटैक्स 100% रुक जाते हैं!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 03 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "माइक्रोसॉफ्ट के अनुसार किसी सर्वर को एक्टिव डायरेक्टरी डोमेन कंट्रोलर प्रमोट करने से पहले कौन-सा कार्य करना अनिवार्य है?",
  optA: "IIS वेब सर्वर इंस्टॉल करना",
  optB: "सर्वर का स्थायी कंप्यूटर नाम और स्टैटिक IP सेट करना",
  optC: "विंडोज डिफ़ेंडर फ़ायरवॉल को हमेशा के लिए बंद करना",
  optD: "तीसरी पार्टी का एंटीवायरस डालना",
  ans: "B",
  exp: "DC प्रमोशन के बाद नाम और IP बदलना जोखिम भरा होता है, अतः प्री-प्रमोशन हार्डनिंग में ही नाम व स्टैटिक IP तय किए जाते हैं।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "रिमोट डेस्कटॉप प्रोटोकॉल (RDP) डिफ़ॉल्ट रूप से किस IANA पोर्ट नंबर पर क्लाइंट्स के इनबाउंड कनेक्शंस को सुनता है?",
  optA: "TCP पोर्ट 80",
  optB: "TCP पोर्ट 443",
  optC: "TCP पोर्ट 3389",
  optD: "UDP पोर्ट 53",
  ans: "C",
  exp: "विंडोज रिमोट डेस्कटॉप का आधिकारिक डिफ़ॉल्ट पोर्ट TCP 3389 है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "एक्टिव डायरेक्टरी के #hl-orange[Kerberos] ऑथेंटिकेशन में डोमेन कंट्रोलर और क्लाइंट के बीच अधिकतम कितना समय अंतर (Clock Skew) स्वीकार्य होता है?",
  optA: "1 मिनट",
  optB: "5 मिनट",
  optC: "15 मिनट",
  optD: "30 मिनट",
  ans: "B",
  exp: "Kerberos v5 सुरक्षा नीति के अनुसार अधिकतम 5 मिनट का टाइम ड्रिफ्ट (Clock Skew) ही अनुमत होता है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "विंडोज सर्वर में नेटवर्क कनेक्शंस विंडो (Network Connections) को सीधे खोलने का रन कमांड क्या है?",
  optA: "devmgmt.msc",
  optB: "ncpa.cpl",
  optC: "firewall.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "ncpa.cpl सीधे नेटवर्क एडेप्टर सेटिंग्स (Network Connections) विंडो को खोलता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "RDP में NLA (Network Level Authentication) का प्राथमिक सुरक्षा उद्देश्य क्या है?",
  optA: "इंटरनेट की स्पीड को दोगुना करना",
  optB: "फुल RDP सेशन और GUI लोड होने से पहले यूजर क्रेडेंशियल्स की पुष्टि करना",
  optC: "पासवर्ड की आवश्यकता समाप्त करना",
  optD: "रिमोट ऑडियो को म्यूट करना",
  ans: "B",
  exp: "NLA सेशन स्थापित होने से पूर्व ही क्रेडेंशियल्स सत्यापित करके DoS और अनधिकृत सत्र निर्माण को रोकता है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'यदि किसी डोमेन कंट्रोलर के Preferred DNS में 8.8.8.8 (Google DNS) डाल दिया जाए, तो क्या होगा?'",
  a: "उत्तर: यदि DC अपने DNS के रूप में Google DNS को देखेगा, तो वह अपने स्थानीय एक्टिव डायरेक्टरी SRV रिकॉर्ड्स (_ldap, _kerberos) को इंटरनेट पर खोजेगा जहाँ वे मौजूद नहीं हैं। परिणामस्वरूप डोमेन कंट्रोलर खुद को नहीं पहचान पाएगा, क्लाइंट डोमेन जॉइन नहीं कर पाएंगे और डायरेक्टरी रेप्लिकेशन पूरी तरह फेल हो जाएगा। DC के DNS में हमेशा 127.0.0.1 (Loopback) या स्थानीय AD DNS का IP होना चाहिए।",
  tip: "Wipro और TCS के L2 SysAdmin इंटरव्यू में यह सबसे ट्रिकी और निर्णायक सवाल माना जाता है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'क्लाइंट कंप्यूटर पर Kerberos Error: Time Skew Too Great (0x25) आ रहा है। इसे कैसे ठीक करेंगे?'",
  a: "उत्तर: यह एरर तब आता है जब क्लाइंट और डोमेन कंट्रोलर की घड़ी में 5 मिनट से अधिक का अंतर हो। इसे ठीक करने के लिए क्लाइंट पर एडमिन कमांड प्रॉम्प्ट में 'w32tm /resync /force' चलाकर DC के साथ समय सिंक कराया जाता है, या BIOS/UEFI बैटरी व टाइम ज़ोन की जाँच की जाती है।",
  tip: "हेल्पडेस्क और L1 सपोर्ट इंजीनियरों के लिए यह दैनिक ट्रबलशूटिंग का अभिन्न हिस्सा है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'प्रोडक्शन सर्वर पर RDP डिफ़ॉल्ट पोर्ट 3389 को बदलना (Port Obfuscation) क्या पर्याप्त सुरक्षा है?'",
  a: "उत्तर: पोर्ट बदलना (जैसे 3389 से 53389 करना) केवल बेसिक पोर्ट स्कैनर्स से बचाता है (Security through Obscurity), यह वास्तविक सुरक्षा नहीं है। वास्तविक सुरक्षा के लिए NLA सक्षम होना चाहिए, RDP को VPN या Azure Bastion के पीछे रखना चाहिए, और मल्टी-फैक्टर ऑथेंटिकेशन (MFA) अनिवार्य होना चाहिए।",
  tip: "सुरक्षा-केंद्रित भूमिकाओं में यह उत्तर आपकी परिपक्व सोच को प्रदर्शित करता है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'Windows Server 2025 में टाइम सर्विस की स्थिति जाँचने के लिए आधिकारिक कमांड क्या है?'",
  a: "उत्तर: 'w32tm /query /status' कमांड से वर्तमान NTP सोर्स, पोल इंटरवल, और लास्ट सक्सेसफुल सिंक टाइम की विस्तृत जानकारी मिलती है।",
  tip: "कमांड-लाइन ज्ञान MNC के प्रैक्टिकल असेसमेंट राउंड में सीधे परखा जाता है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'सर्वर हार्डनिंग (Server Hardening) का क्या अर्थ है, और इसमें कौन-से 4 कार्य शामिल होते हैं?'",
  a: "उत्तर: सर्वर हार्डनिंग का अर्थ है ऑपरेटिंग सिस्टम की कमजोरियों को दूर करके अटैक सरफेस को न्यूनतम करना। इसमें शामिल हैं: 1. डिफ़ॉल्ट पासवर्ड बदलना व रीनेम करना, 2. अप्रयुक्त पोर्ट्स व सर्विसेज को डिसेबल करना, 3. फ़ायरवॉल इनबाउंड/आउटबाउंड नियमों को कसना, और 4. नवीनतम सिक्योरिटी पैचेस (#hl-yellow[हॉटपैचिंग]) लागू करना।",
  tip: "Infra Architect और Security Compliance राउंड का यह कोर फंडामेंटल प्रश्न है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 03 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - सर्वर को डोमेन कंट्रोलर बनाने से पहले कंप्यूटर का नाम और स्टैटिक IPv4 फिक्स करना अनिवार्य इंजीनियरिंग अनुशासन है।
      - DNS लूपबैक एड्रेस `127.0.0.1` ही AD DS का जीवन आधार है; कभी भी बाहरी पब्लिक DNS न डालें।
      - RDP में NLA और NTP टाइम सिंक्रोनाइज़ेशन Kerberos सुरक्षा की रीढ़ हैं।
    ]
  ]
)

#pagebreak()

