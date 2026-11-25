// =============================================================================
// CHAPTER 14: TOP 50 MNC SYSADMIN PLACEMENT VAULT & CAREER BLUEPRINT
// =============================================================================

[#metadata("ch14") <chapter-14>]

#chapter-header(
  chapter-num: "CHAPTER 14",
  category: "भाग 14 : कॉर्पोरेट प्लेसमेंट एवं इंटरव्यू वॉल्ट (Placement Engine)",
  title: "टॉप 50 MNC सिस्टम एडमिनिस्ट्रेटर प्लेसमेंट वॉल्ट एवं L1/L2 इंटरव्यू परिदृश्य",
  subtitle: "L1/L2 दैनिक जिम्मेदारियां व टिकटिंग टूल्स (ServiceNow, Jira) · TCS, Wipro, Infosys, Cognizant के 50 वास्तविक इंटरव्यू परिदृश्य व समाधान · सैलरी नेगोशिएशन ब्लूप्रिंट"
)

=== 14.1 L1/L2 सिस्टम एडमिनिस्ट्रेटर की दैनिक जिम्मेदारियां एवं टिकटिंग टूल्स
जब आप TCS, Wipro, Infosys, HCL, Cognizant, या Accenture जैसी बहुराष्ट्रीय कंपनियों में एक L1/L2 सिस्टम एडमिनिस्ट्रेटर या Windows Server Support Engineer के रूप में ज्वाइन करते हैं, तो आपका दैनिक कार्य ITIL (Information Technology Infrastructure Library) फ्रेमवर्क और टिकटिंग टूल्स (#hl-yellow[ServiceNow], #hl-yellow[Jira Service Management], या #hl-yellow[Remedy]) द्वारा संचालित होता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/sysadmin_career_matrix.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 14.1: RTechLab एंटरप्राइज सिस्टम एडमिनिस्ट्रेटर करियर रोडमैप, अनुभव स्तर एवं सीटीसी ग्रोथ लैडर]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[दैनिक L1/L2 कार्यभार एवं SLA प्रबंधन (Typical Daily Workflow):]\
    - #text(weight: "bold", fill: rtech-blue)[Incident Management (P1 से P4 टिकट्स):]
      - P1 (Critical - 15 Min SLA): पूरा डोमेन कंट्रोलर डाउन, या फाइल सर्वर अनरीचेबल।
      - P2 (High - 1 Hr SLA): किसी पूरे विभाग (Finance OU) का इंटरनेट या शेयर ड्राइव काम न करना।
      - P3 (Medium - 4 Hr SLA): किसी विशिष्ट यूजर का खाता लॉक होना या GPO ड्राइव मैप न होना।
      - P4 (Low - 24 Hr SLA): नए कर्मचारी का AD अकाउंट ऑनबोर्डिंग या डिस्ट्रीब्यूशन लिस्ट में जोड़ना।
    - #text(weight: "bold", fill: rtech-emerald)[दैनिक मॉर्निंग चेकलिस्ट (Morning Health Run):]
      - प्रातः 9:00 बजे #hl-yellow[Server Manager] डैशबोर्ड खोलकर सभी सर्वर्स की ग्रीन हेल्थ जांचना।
      - Event Viewer में Directory Service, DNS Server, और System Logs में रेड एरर्स (Error 1085, 1129) देखना।
      - रात के #hl-yellow[सिस्टम स्टेट बैकअप] के सफल स्टेटस (`wbadmin` / Veeam) की पुष्टि करना।
  ]
)

#v(6pt)

=== 14.2 टॉप MNC L1/L2 सिस्टम एडमिनिस्ट्रेटर परिदृश्य प्रश्नोत्तर वॉल्ट
इंटरव्यूअर कभी भी सिर्फ परिभाषाएं नहीं पूछते, वे वास्तविक संकट परिदृश्य (Troubleshooting Scenarios) देते हैं:

1. #text(weight: "bold", fill: rtech-navy)[परिदृश्य 1: "सुबह 10 बजे एक साथ 40 कर्मचारियों के खाते लॉक हो गए। क्या यह ब्रूट-फोर्स हमला है और आप इसे कैसे डायग्नोज करेंगे?"]
   - *मॉडल उत्तर:* "मैं तुरंत PDC Emulator डोमेन कंट्रोलर पर Event Viewer खोलूँगा और 'Security Log' में Event ID #hl-orange[4740] (A user account was locked out) फ़िल्टर करूँगा। इस इवेंट के विवरण में 'Caller Computer Name' देखा जाता है। 90% मामलों में यह किसी मोबाइल फोन या आईपैड पर पुराना सेव पासवर्ड (Cached Exchange/Wi-Fi credentials) होता है जो बार-बार गलत पासवर्ड भेजकर अकाउंट लॉक कर देता है। उस डिवाइस से क्रेडेंशियल्स अपडेट कराकर समस्या हल हो जाती है।"

2. #text(weight: "bold", fill: rtech-navy)[परिदृश्य 2: "एक कर्मचारी का ट्रांसफर HR से Finance विभाग में हुआ है। उसे HR का एक्सेस तुरंत बंद और Finance का एक्सेस चालू कैसे करेंगे?"]
   - *मॉडल उत्तर:* "हम सीधे फोल्डर पर नहीं जाते। ADUC में जाकर उस यूजर को `GG_HR_Staff` ग्लोबल ग्रुप से हटाकर `GG_Finance_Staff` में जोड़ देंगे। हमारे #hl-orange[AGDLP] मॉडल के कारण यूजर को Finance के सभी आवश्यक राइट्स स्वतः मिल जाएंगे और HR के सभी राइट्स स्वतः समाप्त हो जाएंगे।"

3. #text(weight: "bold", fill: rtech-navy)[परिदृश्य 3: "DNS सर्वर चालू है, लेकिन इंटरनेट की बाहरी वेबसाइट्स (google.com) नहीं खुल रही हैं, केवल आंतरिक साइट्स खुल रही हैं?"]
   - *मॉडल उत्तर:* "यह संकेत है कि आंतरिक #hl-yellow[Forward Lookup Zone] स्वस्थ है, लेकिन DNS सर्वर के #hl-yellow[Forwarders] (जैसे 1.1.1.1 या ISP IP) डाउन हैं या फ़ायरवॉल द्वारा सर्वर से बाहर जाने वाला UDP पोर्ट 53 ब्लॉक है। DNS Manager में Forwarders टैब पर जाकर टेस्ट चलाएंगे।"

#v(6pt)

=== 14.3 सैलरी नेगोशिएशन ब्लूप्रिंट एवं MNC सिलेक्शन सीक्रेट्स
1. #text(weight: "bold", fill: rtech-navy)[रिज्यूमे पर हैंड्स-ऑन होम लैब प्रोजेक्ट्स को हाइलाइट करें:]
   - अपने रिज्यूमे में केवल 'Knowledge of Windows Server' न लिखें। इसके बजाय लिखें:
     #box(fill: rgb("#F1F5F9"), radius: 3pt, inset: 4pt)[
       #text(size: 7.8pt, font: ("Consolas", "Courier New"))[
         "Architected 2-Node Windows Server 2025 Lab: Deployed Forest corp.rtechlab.local, implemented #hl-orange[AGDLP] RBAC, hardened endpoints via GPO (USB Block, Password Policy), configured DHCP 80/20 failover, and executed AD Recycle Bin instant recoveries."
       ]
     ]
2. #text(weight: "bold", fill: rtech-navy)[सैलरी एक्सपेक्टेशन (CTC Expectations):]
   - L1 Desktop Support / SysAdmin (0-2 वर्ष): ₹3.5 LPA से ₹5.5 LPA
   - L2 System Administrator / Infra Specialist (2-5 वर्ष): ₹6.5 LPA से ₹12.0 LPA
   - L3 Infrastructure Lead / Cloud Hybrid Architect (5-8 वर्ष): ₹14.0 LPA से ₹24.0 LPA+

#v(8pt)

// =============================================================================
// CHAPTER 14 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  MNC टेक्निकल इंटरव्यू में जब इंटरव्यूअर कोई ऐसा कठिन सवाल पूछे जिसका उत्तर आपको नहीं आता, तो कभी भी झूठ न बोलें या 'तुक्का' न लगाएं। अनुभवी सिस्टम एडमिनिस्ट्रेटर हमेशा कहते हैं: *"सर, मैंने उत्पादन में इस विशिष्ट एरर का सामना अभी नहीं किया है, लेकिन मैं Event Viewer के Event ID, माइक्रोसॉफ्ट टेकनेट (Learn) डॉक्यूमेंटेशन और dcdiag लॉग्स का उपयोग करके इसकी मूल वजह (Root Cause) 15 मिनट में खोजकर हल कर सकता हूँ।"* यह उत्तर आपकी ईमानदारी और वास्तविक इंजीनियरिंग सोच को साबित करता है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 14 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "विंडोज सिक्योरिटी इवेंट लॉग्स में 'A user account was locked out' की घटना को ट्रैक करने के लिए आधिकारिक Event ID क्या है?",
  optA: "Event ID 4624 (Successful Logon)",
  optB: "Event ID 4625 (Failed Logon)",
  optC: "Event ID 4740 (Account Locked Out)",
  optD: "Event ID 1129 (Group Policy Failed)",
  ans: "C",
  exp: "Event ID 4740 सीधे अकाउंट लॉकआउट का विवरण और कॉलर कंप्यूटर नाम प्रदर्शित करता है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "ITIL फ्रेमवर्क के अंतर्गत यदि कोई डोमेन कंट्रोलर पूरी तरह डाउन हो जाए और सैकड़ों कर्मचारी लॉगिन न कर सकें, तो इस टिकट को किस प्राथमिकता (Priority) में वर्गीकृत किया जाता है?",
  optA: "Priority 4 (Low)",
  optB: "Priority 3 (Medium)",
  optC: "Priority 2 (High)",
  optD: "Priority 1 (P1 - Critical Outage)",
  ans: "D",
  exp: "पूरे संगठन या कोर इंफ्रास्ट्रक्चर के ठप होने पर P1 (Severity 1) इंसिडेंट घोषित होता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "सफल डोमेन लॉगिन की घटना को ऑडिट करने के लिए विंडोज सिक्योरिटी लॉग में कौन-सा आधिकारिक Event ID दर्ज होता है?",
  optA: "Event ID 4624",
  optB: "Event ID 4625",
  optC: "Event ID 4672",
  optD: "Event ID 4720",
  ans: "A",
  exp: "Event ID 4624 सफल लॉगिन और Event ID 4625 असफल (Failed) लॉगिन को दर्शाता है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "एंटरप्राइज सर्विस डेस्क और इंसिडेंट मैनेजमेंट के लिए वैश्विक स्तर पर सबसे लोकप्रिय कॉर्पोरेट क्लाउड टिकटिंग प्लेटफॉर्म कौन-सा है?",
  optA: "VLC Media Player",
  optB: "ServiceNow",
  optC: "VirtualBox",
  optD: "Notepad++",
  ans: "B",
  exp: "ServiceNow दुनिया के 80% से अधिक फॉर्च्यून 500 उद्यमों में ITIL सर्विस मैनेजमेंट हेतु उपयोग होता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "विंडोज सर्वर में सभी सक्रिय रोल्स, डायरेक्टरी रेप्लिकेशन और DNS विज्ञापनों का समग्र स्वास्थ्य जांचने की प्राथमिक कमांड क्या है?",
  optA: "chkdsk /f",
  optB: "dcdiag /v",
  optC: "sfc /scannow",
  optD: "format c:",
  ans: "B",
  exp: "dcdiag (Domain Controller Diagnostics) सभी आंतरिक डायरेक्टरी और रोल परीक्षण निष्पादित करती है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'ServiceNow में Incident और Change Request (CR) के बीच क्या अंतर होता है?'",
  a: "उत्तर: 'Incident' किसी अनियोजित व्यवधान या सेवा विफलता को ठीक करने के लिए बनाया जाता है (उदा. यूजर का खाता लॉक होना या सर्वर बंद होना - इसे तुरंत हल करना होता है)। 'Change Request' उत्पादन वातावरण में किसी योजनाबद्ध बदलाव के लिए बनाया जाता है (उदा. सर्वर पर नया पैच लगाना, नया सबनेट जोड़ना, या फ़ायरवॉल पोर्ट खोलना - इसके लिए CAB यानी Change Advisory Board की मंजूरी आवश्यक होती है)।",
  tip: "कॉर्पोरेट प्रोसेस और आईटी गवर्नेंस का यह बुनियादी इंटरव्यू प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: '#hl-orange[Kerberos] टिकट की डिफ़ॉल्ट जीवन अवधि (Ticket Granting Ticket - TGT Lifetime) कितनी होती है?'",
  a: "उत्तर: डिफ़ॉल्ट रूप से #hl-orange[Kerberos] TGT की जीवन अवधि 10 घंटे होती है, और इसे अधिकतम 7 दिनों तक बिना पासवर्ड दोबारा डाले रिन्यू किया जा सकता है। यह नीति Default Domain Policy में #hl-orange[Kerberos] Policies के अंतर्गत कॉन्फ़िगर होती है।",
  tip: "यह डीप ऑथेंटिकेशन आर्किटेक्चर का उच्च-स्तरीय सवाल है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'L1 सपोर्ट में सबसे अधिक आने वाली 3 हेल्पडेस्क कॉल्स क्या होती हैं और आप उन्हें कैसे संभालते हैं?'",
  a: "उत्तर: 1. पासवर्ड एक्सपायर/अकाउंट लॉकआउट (समाधान: ADAC/PowerShell से अनलॉक), 2. शेयर ड्राइव अनरीचेबल (समाधान: नेटवर्क केबल, DNS ping और `net use` मैपिंग जांचना), 3. इंटरनेट/वेबसाइट न खुलना (समाधान: `ipconfig /flushdns` और प्रॉक्सी सेटिंग्स रीसेट करना)।",
  tip: "यह उत्तर सिद्ध करता है कि आप पहले दिन से ही डेस्कटॉप सपोर्ट का कार्यभार संभालने के लिए तैयार हैं।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'यदि एक नया यूजर बनाया जाए और वह क्लाइंट पर लॉगिन करे तो 'User profile cannot be loaded' एरर आए, तो क्या करेंगे?'",
  a: "उत्तर: यह एरर तब आता है जब क्लाइंट मशीन के `C:\Users\Default` फोल्डर की अनुमतियां करप्ट हों, डिस्क में स्पेस न हो, या रजिस्ट्री में `ProfileList` की `.bak` कीज अटकी हों। क्लाइंट पर एडमिन से लॉगिन करके रजिस्ट्री में `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList` से करप्ट SID हटाएंगे और प्रोफाइल दोबारा जनरेट कराएंगे।",
  tip: "एडवांस्ड विंडोज डेस्कटॉप ट्रबलशूटिंग का यह क्लासिक प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'आप हमारे संगठन के लिए एक उत्कृष्ट सिस्टम एडमिनिस्ट्रेटर क्यों साबित होंगे?'",
  a: "उत्तर: क्योंकि मेरे पास केवल किताबी थ्योरी नहीं है, बल्कि मैंने अपने हाथों से Windows Server 2025 की संपूर्ण एंटरप्राइज लैब तैयार की है। मैं Active Directory, GPO, DNS, DHCP, #hl-orange[FSRM] और हाइब्रिड आर्किटेक्चर की गहराई को समझता हूँ, PowerShell द्वारा ऑटोमेशन कर सकता हूँ, और ITIL मानकों के अनुसार समय पर टिकट्स हल करने के लिए प्रतिबद्ध हूँ।",
  tip: "यह आत्मविश्वास भरा उत्तर आपके चयन को सुनिश्चित करता है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 14 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - L1/L2 सिस्टम एडमिनिस्ट्रेटर टिकटिंग टूल्स (ServiceNow) और ITIL प्रक्रियाओं के आधार पर इंफ्रास्ट्रक्चर की रक्षा करते हैं।
      - Event ID 4740 (Lockout) और 4624 (Logon) दैनिक सुरक्षा ऑडिटिंग की दो सबसे महत्वपूर्ण आंखें हैं।
      - व्यावहारिक लैब अनुभव और समस्या-समाधान की वैज्ञानिक सोच ही MNC में उच्च पैकेज का रहस्य है।
    ]
  ]
)

#pagebreak()


// =============================================================================
// APPENDIX: RTECHLAB SYSTEMS & INFRASTRUCTURE ACADEMY & AUTHOR DEDICATION
// =============================================================================
[#metadata("app") <appendix-academy>]

#align(center)[
  #v(10pt)
  #text(size: 22pt, weight: "black", fill: rtech-navy)[RTechLab Systems & Infrastructure Academy]
  #v(3pt)
  #text(size: 10pt, weight: "bold", fill: rtech-blue)[Universal Technical Education · Hardware to Enterprise Cloud]
  #v(8pt)
  #line(length: 60%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(10pt)

#grid(
  columns: (auto, 1fr),
  gutter: 16pt,
  align: (top, left),
  [
    #block(
      stroke: 2pt + rtech-blue,
      radius: 6pt,
      clip: true,
      [
        #image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 44mm)
      ]
    )
    #v(4pt)
    #align(center)[
      #text(size: 9.5pt, weight: "black", fill: rtech-navy)[राहुल पटेल (Rahul Patel)]\
      #text(size: 7.2pt, fill: rtech-muted)[चीफ टेक्नोलॉजी आर्किटेक्ट\
      संस्थापक, RTechLab Publications]
    ]
  ],
  [
    #text(size: 11.5pt, weight: "black", fill: rtech-navy)[प्रिय छात्र एवं भावी एंटरप्राइज सिस्टम लीडर,]
    
    #v(5pt)
    #text(size: 8.8pt, fill: rtech-text)[
      बधाई हो! यदि आप इस अंतिम पृष्ठ तक पहुँच गए हैं, तो आपने केवल एक किताब नहीं पढ़ी है, बल्कि भारत के सबसे व्यावहारिक, गहन और आधुनिक #hl-yellow[Microsoft Windows Server 2025 & Active Directory] के संपूर्ण पाठ्यक्रम को अपने हाथों से पूरा किया है।

      जब हमने RTechLab Academy की शुरुआत की थी, तो हमारा एकमात्र लक्ष्य यह था कि देश के किसी भी शहर या गाँव के छात्र को सिस्को नेटवर्किंग और विंडोज सर्वर सीखने के लिए ₹40,000 की महंगी कोचिंग या अंग्रेजी के बोझ के आगे न झुकना पड़े। आज आपकी इस हैंडबुक में वह सब कुछ समाहित है जो दुनिया की शीर्ष MNCs (TCS, Wipro, Infosys, Cognizant, Microsoft) के L1/L2 इंफ्रास्ट्रक्चर सपोर्ट और सिस्टम एडमिनिस्ट्रेटर के लिए आवश्यक है।

      याद रखिए: एक सच्चा सिस्टम एडमिनिस्ट्रेटर केवल बटन दबाने वाला ऑपरेटर नहीं होता, बल्कि वह उस संपूर्ण डिजिटल रीढ़ का रक्षक होता है जिस पर बैंक, अस्पताल और देश की अर्थव्यवस्था टिकी होती है। निरंतर अभ्यास कीजिए, अपनी लैब में नए प्रयोग कीजिए, और अपने सपनों को साकार कीजिए!
    ]
    #v(6pt)
    #align(right)[
      #text(size: 9.5pt, weight: "black", fill: rtech-navy)[— राहुल पटेल (Founder & Chief Architect)]\
      #text(size: 7.5pt, font: ("Consolas", "Courier New"), fill: rtech-blue)[rahul.28e1\@gmail.com · 24x7 WhatsApp Helpline: +91 76468 92094]
    ]
  ]
)

#v(10pt)

#info-box(title: "RTechLab मास्टर हैंडबुक की 5 अद्वितीय प्रतिबद्धताएं (Why This Book Guarantees Success)")[
  - #text(weight: "bold")[1. 100% ओरिजिनल 2025 स्क्रीनशॉट्स:] वास्तविक #hl-yellow[सर्वर मैनेजर], एक्टिव डायरेक्टरी, GPO एवं DNS आर्किटेक्चर फ्लो।
  - #text(weight: "bold")[2. 3-कलर स्टडी हाइलाइटर सिस्टम:] #hl-yellow[पीला (कोर सिद्धांत)], #hl-orange[नारंगी (सुरक्षा नियम व चेतावनियां)], और #hl-green[हरा (कमांड्स व क्लिक स्टेप्स)]।
  - #text(weight: "bold")[3. 1-क्लिक इंटरैक्टिव नेविगेशन:] इंडेक्स के किसी भी अध्याय पर टैप करके सीधे उस पेज पर पहुंचें, और हेडर से 1 टैप में वापस आएं।
  - #text(weight: "bold")[4. प्रत्येक अध्याय के अंत मेंDid You Know व MCQs:] सेमेस्टर परीक्षा, प्रमाणन और कॉर्पोरेट असेसमेंट टेस्ट की 100% तैयारी।
  - #text(weight: "bold")[5. टॉप 50 MNC प्लेसमेंट वॉल्ट:] Wipro, TCS, Infosys, Cognizant के टेक्निकल इंटरव्यू राउंड्स के वास्तविक 50 प्रश्नोत्तर।
]

#v(8pt)

#block(
  width: 100%,
  stroke: 1.5pt + rgb("#0284C7"),
  fill: rgb("#F0F9FF"),
  radius: 6pt,
  inset: (x: 12pt, y: 10pt),
  [
    #align(center)[
      #text(size: 11pt, weight: "black", fill: rtech-navy)[🎓 RTechLab आधिकारिक छात्र सहायता एवं आजीवन मार्गदर्शन 🎓]\
      #v(3pt)
      #text(size: 8.2pt, fill: rtech-muted)[
        यदि आपको किसी भी लैब प्रैक्टिकल, वर्चुअल मशीन एरर, या MNC इंटरव्यू की तैयारी में कोई भी परेशानी आए,\
        तो बेझिझक सीधे हमारे आधिकारिक व्हाट्सएप नंबर पर संपर्क करें। हमारी टीम आपकी सहायता के लिए सदैव तत्पर है:
      ]\
      #v(6pt)
      #box(
        fill: rgb("#22C55E"),
        radius: 4pt,
        inset: (x: 12pt, y: 5pt),
        text(size: 10pt, weight: "black", fill: white)[📱 WhatsApp Helpline: +91 76468 92094]
      )\
      #v(4pt)
      #text(size: 8pt, font: ("Consolas", "Courier New"), fill: rtech-navy)[Official Email: rahul.28e1\@gmail.com · Web: rtechlab.com]
    ]
  ]
)

