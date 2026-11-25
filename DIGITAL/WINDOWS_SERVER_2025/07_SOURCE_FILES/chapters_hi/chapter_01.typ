// =============================================================================
// CHAPTER 01: INTRODUCTION, ARCHITECTURE, TYPES & EVOLUTION
// =============================================================================

[#metadata("ch1") <chapter-1>]

#chapter-header(
  chapter-num: "CHAPTER 01",
  category: "भाग 1 : सिद्धांत एवं विकासक्रम (Foundation Architecture)",
  title: "सर्वर आर्किटेक्चर, सर्वर के प्रकार एवं विंडोज सर्वर का 32-वर्षीय इतिहास",
  subtitle: "क्लाइंट-सर्वर मॉडल · 8 प्रमुख सर्वर प्रकार · फिजिकल vs वर्चुअल vs #hl-green[अज़ूर आर्क] हाइब्रिड · 1993 से 2025 का संपूर्ण विकासक्रम"
)

#v(6pt)

=== 1.1 सर्वर क्या है? (What is a Server?)
एक साधारण कंप्यूटर और एक एंटरप्राइज सर्वर के बीच का अंतर केवल हार्डवेयर का नहीं, बल्कि उसकी #hl-yellow[भूमिका (Role) और उपलब्धता (Availability)] का होता है।

#mark-yellow[सर्वर एक ऐसा शक्तिशाली केंद्रीय कंप्यूटर या सॉफ्टवेयर प्रोग्राम होता है जो नेटवर्क पर अन्य कंप्यूटरों (जिन्हें क्लाइंट्स कहा जाता है) को विभिन्न सेवाएं, संसाधन, डेटा एवं सुरक्षा नीतियां 24 घंटे, सातों दिन (24/7/365) निरंतर प्रदान करता है।]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "क्लाइंट (Client) की परिभाषा")[
      क्लाइंट वह एंड-यूजर मशीन (लैपटॉप, डेस्कटॉप, स्मार्टफोन) होती है जो सर्वर से किसी सेवा के लिए अनुरोध (#hl-green[Request]) भेजती है। उदाहरण: आपका वेब ब्राउज़र, आउटलुक ईमेल क्लाइंट, या फाइल एक्सप्लोरर।
    ]
  ],
  [
    #info-box(title: "सर्वर (Server) की परिभाषा")[
      सर्वर वह केंद्रीय सिस्टम है जो क्लाइंट्स के अनुरोधों को सुनता है (#hl-green[Listening on Ports]), उनकी प्रामाणिकता जांचता है, और संबंधित सेवा का प्रत्युत्तर (#hl-green[Response]) वापस भेजता है।
    ]
  ]
)

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/client_server_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 1.1: एंटरप्राइज क्लाइंट-सर्वर नेटवर्क आर्किटेक्चर — केंद्रीय एक्टिव डायरेक्टरी, स्विचिंग एवं क्लाइंट्स]
]

#v(6pt)

=== 1.2 कॉर्पोरेट नेटवर्क में उपयोग होने वाले 8 प्रमुख सर्वर प्रकार
किसी भी बहुराष्ट्रीय कंपनी (MNC) या बैंक में केवल एक ही सर्वर सब कुछ नहीं करता। विशिष्ट कार्यों के लिए सर्वर को अलग-अलग भूमिकाएं दी जाती हैं:

1. #text(weight: "bold", fill: rtech-navy)[डोमेन कंट्रोलर (Domain Controller / AD DS):] संपूर्ण संगठन की केंद्रीय पहचान (Identity) संभालता है। यूजरनेम, पासवर्ड, कंप्यूटर खाते और सुरक्षा नीतियां इसी पर स्थित होती हैं। #hl-green[पोर्ट: 88 (#hl-orange[Kerberos]), 389 (LDAP)]।
2. #text(weight: "bold", fill: rtech-navy)[फाइल एवं स्टोरेज सर्वर (File & Storage Server):] सभी कर्मचारियों के डेटा को केंद्रीकृत स्टोर करता है। किस विभाग (HR, Sales) को किस फोल्डर का एक्सेस मिलेगा, यह NTFS और SMB द्वारा तय होता है। #hl-green[पोर्ट: 445 (SMB)]।
3. #text(weight: "bold", fill: rtech-navy)[वेब सर्वर (Web Server - IIS / Apache):] कंपनी के आंतरिक पोर्टल, वेबसाइट्स और वेब एप्लीकेशंस को होस्ट करता है। #hl-green[पोर्ट: 80 (HTTP), 443 (HTTPS)]।
4. #text(weight: "bold", fill: rtech-navy)[डेटाबेस सर्वर (Database Server - MS SQL / Oracle):] बैंक बैलेंस, ग्राहक रिकॉर्ड्स और ई-कॉमर्स इनवॉइस जैसी संरचित जानकारी को प्रोसेस करता है। #hl-green[पोर्ट: 1433 (SQL Server)]।
5. #text(weight: "bold", fill: rtech-navy)[DNS सर्वर (Domain Name System):] कंप्यूटर नामों (उदा. `portal.rtechlab.local`) को IP पतों (`192.168.1.50`) में बदलता है। #hl-green[पोर्ट: 53 (UDP/TCP)]।
6. #text(weight: "bold", fill: rtech-navy)[DHCP सर्वर (Dynamic Host Configuration Protocol):] नेटवर्क से जुड़ने वाले प्रत्येक कंप्यूटर को स्वचालित IP एड्रेस, गेटवे और सबनेट मास्क लीज पर देता है। #hl-green[UDP पोर्ट: 67, 68]।
7. #text(weight: "bold", fill: rtech-navy)[मेल सर्वर (Mail Server - Exchange Server):] कर्मचारियों के ईमेल भेजने, प्राप्त करने और मेलबॉक्स सुरक्षित रखने का कार्य करता है। #hl-green[पोर्ट: 25 (SMTP), 587, 993 (IMAP)]।
8. #text(weight: "bold", fill: rtech-navy)[प्रॉक्सी एवं सुरक्षा सर्वर (Proxy / Firewall Server):] कर्मचारियों के इंटरनेट उपयोग को फ़िल्टर करता है और अनधिकृत वेबसाइट्स को ब्लॉक करके नेटवर्क को सुरक्षित रखता है। #hl-green[पोर्ट: 8080]।

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/types_of_servers_infographic.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 1.2: एंटरप्राइज में सक्रिय 8 प्रमुख सर्वर प्रकार, उनके कार्य एवं IANA डिफ़ॉल्ट पोर्ट नंबर्स]
]

#v(6pt)

=== 1.3 फिजिकल (Bare-Metal) vs वर्चुअल मशीन vs क्लाउड सर्वर (Azure & Hybrid)
आज के समय में सर्वर डिप्लॉय करने के 3 प्राथमिक मॉडल उपलब्ध हैं:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/physical_virtual_cloud_comparison.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 1.3: सर्वर डिप्लॉयमेंट के 3 आधुनिक रूप — फिजिकल बेयर-मेटल, वर्चुअलाइजेशन (Hyper-V) एवं अज़ूर हाइब्रिड क्लाउड]
]

#v(4pt)

- #text(weight: "bold", fill: rtech-navy)[1. फिजिकल सर्वर (On-Premises Bare-Metal):] जब हार्डवेयर (Dell PowerEdge या HP ProLiant रैक सर्वर) पर सीधे ऑपरेटिंग सिस्टम इंस्टॉल किया जाता है। अत्यधिक भारी डेटाबेस के लिए उपयुक्त, परंतु हार्डवेयर की बर्बादी (कम उपयोग) अधिक होती है।
- #text(weight: "bold", fill: rtech-navy)[2. वर्चुअल मशीन (Hyper-V / VMware ESXi):] एक ही बड़े फिजिकल सर्वर पर हाइपरवाइजर चलाकर 10 से 20 अलग-अलग वर्चुअल सर्वर्स बनाए जाते हैं। हार्डवेयर की 85% से अधिक उपयोगिता सुनिश्चित होती है।
- #text(weight: "bold", fill: rtech-navy)[3. माइक्रोसॉफ्ट अज़ूर एवं हाइब्रिड क्लाउड (#hl-green[Azure Arc]):] #mark-green[Windows Server 2025 का सबसे बड़ा क्रांतिकारी फीचर #hl-green[Azure Arc] एकीकरण है।] आप अपने ऑन-प्रिमाइसेस लोकल सर्वर को क्लाउड से जोड़ सकते हैं, और #hl-yellow[हॉटपैचिंग (#hl-yellow[Hotpatching])] के जरिए बिना सर्वर को रीबूट किए सीधे रैम में सिक्योरिटी अपडेट्स अप्लाई कर सकते हैं!

#v(6pt)

=== 1.4 विंडोज सर्वर का 32-वर्षीय संपूर्ण विकासक्रम (1993 से 2025 तक)
माइक्रोसॉफ्ट ने 1993 में पहला 32-बिट ऑपरेटिंग सिस्टम Windows NT 3.1 Advanced Server के रूप में लॉन्च किया था। आज Windows Server 2025 तक यह ऑपरेटिंग सिस्टम दुनिया का सबसे सुरक्षित एंटरप्राइज प्लेटफॉर्म बन चुका है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_evolution_timeline.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 1.4: विंडोज सर्वर का 1993 से 2025 तक का ऐतिहासिक सफर — NT 4.0 से आधुनिक Server 2025 तक]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[इतिहास के प्रमुख मील के पत्थर (Key Historical Milestones):]\
    - #text(weight: "bold", fill: rtech-blue)[Windows NT 4.0 (1996):] पहली बार Windows 95 जैसा ग्राफिकल इंटरफ़ेस और डोमेन ट्रस्ट मॉडल पेश हुआ।
    - #text(weight: "bold", fill: rtech-emerald)[Windows 2000 Server (2000):] #hl-yellow[क्रांतिकारी वर्ष!] एक्टिव डायरेक्टरी (AD DS), DNS एकीकरण और ग्रुप पॉलिसी का जन्म इसी संस्करण में हुआ था।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2008 / R2 (2008):] वर्चुअलाइजेशन क्रांति का सूत्रपात — #hl-green[Microsoft Hyper-V] और बिना GUI वाला #hl-orange[Server Core] पहली बार शामिल हुए।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2012 / R2 (2012):] आधुनिक #hl-yellow[सर्वर मैनेजर] डैशबोर्ड, स्टोरेज स्पेसेस (Storage Spaces) और SMB 3.0 का समावेश हुआ।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2016 (2016):] विंडोज कंटेनर्स (Docker सपोर्ट) और स्टोरेज स्पेसेस डायरेक्ट (S2D) की शुरुआत।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2019 (2019):] विंडोज एडमिन सेंटर (WAC) और हाइब्रिड क्लाउड इन्फ्रास्ट्रक्चर की नींव।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2022 (2022):] सिक्योर्ड-कोर सर्वर (Secured-Core Server), डिफ़ॉल्ट TLS 1.3 और #hl-orange[SMB over QUIC]।
    - #text(weight: "bold", fill: rtech-blue)[Windows Server 2025 (नवीनतम फ्लैगशिप):] #hl-yellow[हॉटपैचिंग फॉर ऑल] (Zero-reboot patching), #hl-yellow[32KB AD डेटाबेस पेज साइज] (25 वर्षों में एक्टिव डायरेक्टरी का सबसे बड़ा स्पीड बूस्ट), नेक्स्ट-जेन स्टोरेज स्पेसेस डायरेक्ट डिडुप व कम्प्रेशन, और वाई-फाई सपोर्ट।
  ]
)

#v(6pt)

=== 1.5 क्लाइंट OS (Windows 11) बनाम सर्वर OS (Windows Server 2025)
कई नए छात्र पूछते हैं: *"जब Windows 11 भी विंडोज है और Server 2025 भी, तो हम Windows 11 को ही सर्वर की तरह इस्तेमाल क्यों नहीं कर सकते?"* 

कर्नेल के स्तर पर दोनों ऑपरेटिंग सिस्टम्स में भारी आंतरिक अंतर होता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/windows_client_vs_server_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 1.5: आर्किटेक्चरल तुलना — Windows 11 Pro vs Windows Server 2025 Datacenter]
]

#v(4pt)

#warning-box(title: "हार्ड-कोडेड नेटवर्क कनेक्शन लिमिट (Interview Trap)")[
  Windows 11 या Windows 10 में नेटवर्क पर एक समय में अधिकतम #hl-orange[केवल 20 कंप्यूटर ही कनेक्ट हो सकते हैं] (Inbound Connections Limit)। 21वां कंप्यूटर जुड़ने का प्रयास करेगा तो एरर आ जाएगा। इसके विपरीत, Windows Server 2025 में #hl-green[असीमित (Unlimited) समानांतर कनेक्शन] की अनुमति होती है।
]

#v(6pt)

=== 1.6 विंडोज सर्वर 2025 के 3 प्रमुख संस्करण (Editions Comparison)
1. #text(weight: "bold", fill: rtech-navy)[Essentials Edition:] छोटे कार्यालयों के लिए (अधिकतम 25 यूजर्स एवं 50 डिवाइसेज)। इसमें यूजर-बेस्ड CALs (Client Access Licenses) की आवश्यकता नहीं होती।
2. #text(weight: "bold", fill: rtech-navy)[Standard Edition:] मध्यम एवं बड़े उद्यमों के लिए। इसमें कोर-बेस्ड लाइसेंसिंग होती है और प्रति लाइसेंस केवल #hl-green[2 वर्चुअल मशीन (VMs)] चलाने की अनुमति मिलती है।
3. #text(weight: "bold", fill: rtech-navy)[Datacenter Edition:] बड़े डेटा सेंटर्स, प्राइवेट क्लाउड और हाइपर-कन्वर्ज्ड इंफ्रास्ट्रक्चर (HCI) के लिए। इसमें #mark-green[असीमित (Unlimited) वर्चुअल मशीन्स], स्टोरेज स्पेसेस डायरेक्ट और शील्डेड VMs की सुविधा मिलती है।

#v(8pt)

// =============================================================================
// CHAPTER 01 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows 2000 Server से लेकर Windows Server 2022 तक पूरे 25 वर्षों तक Active Directory की मुख्य डेटाबेस फाइल (#hl-yellow[`ntds.dit`]) का इंटरनल डेटाबेस पेज साइज केवल #text(weight: "bold")[8 KB] हुआ करता था। Windows Server 2025 में माइक्रोसॉफ्ट ने इसे बढ़ाकर #text(weight: "bold")[32 KB] कर दिया है, जिससे बड़े बहुराष्ट्रीय संगठनों में एक्टिव डायरेक्टरी के क्वेरी रिस्पॉन्स टाइम में 300% से अधिक की तेजी आई है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 01 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) और ग्रुप पॉलिसी को पहली बार किस विंडोज सर्वर संस्करण में पेश किया गया था?",
  optA: "Windows NT 4.0",
  optB: "Windows 2000 Server",
  optC: "Windows Server 2003",
  optD: "Windows Server 2008",
  ans: "B",
  exp: "एक्टिव डायरेक्टरी और ग्रुप पॉलिसी का जन्म वर्ष 2000 में Windows 2000 Server के साथ हुआ था।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "क्लाइंट कंप्यूटर (Windows 11) में एक समय में अधिकतम कितने इनबाउंड नेटवर्क कनेक्शंस की अनुमति होती है?",
  optA: "10 कनेक्शंस",
  optB: "20 कनेक्शंस",
  optC: "100 कनेक्शंस",
  optD: "असीमित (Unlimited)",
  ans: "B",
  exp: "क्लाइंट ओएस में लाइसेंसिंग प्रतिबंध के तहत हार्ड-कोडेड अधिकतम 20 समवर्ती इनबाउंड कनेक्शंस की सीमा होती है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "Windows Server 2025 के उस क्रांतिकारी फीचर का क्या नाम है जिसके द्वारा बिना सर्वर रीबूट किए मेमोरी में सुरक्षा पैच लगाए जाते हैं?",
  optA: "#hl-yellow[Storage Spaces Direct]",
  optB: "#hl-yellow[Hotpatching]",
  optC: "Hyper-V Live Migration",
  optD: "DirectAccess",
  ans: "B",
  exp: "#hl-yellow[Hotpatching] के जरिए सर्वर को रीबूट किए बिना रनिंग प्रोसेस की मेमोरी में पैच अप्लाई किया जाता है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Windows 2000 Server से Windows Server 2022 तक Active Directory (ntds.dit) का डिफ़ॉल्ट पेज साइज क्या था, और Server 2025 में इसे कितना किया गया?",
  optA: "4 KB से बढ़ाकर 16 KB",
  optB: "8 KB से बढ़ाकर 32 KB",
  optC: "16 KB से बढ़ाकर 64 KB",
  optD: "32 KB से बढ़ाकर 128 KB",
  ans: "B",
  exp: "Server 2025 में 25 वर्षों बाद AD डेटाबेस पेज साइज को 8 KB से बढ़ाकर 32 KB किया गया है जिससे क्वेरी स्पीड 300% तेज होती है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "Windows Server 2025 Standard एडिशन के एक आधिकारिक लाइसेंस पर होस्ट मशीन पर अधिकतम कितनी वर्चुअल मशीनें (VMs) चलाई जा सकती हैं?",
  optA: "केवल 1 VM",
  optB: "अधिकतम 2 VMs",
  optC: "अधिकतम 8 VMs",
  optD: "असीमित (Unlimited)",
  ans: "B",
  exp: "Standard एडिशन में प्रति लाइसेंस अधिकतम 2 VMs की अनुमति होती है, जबकि Datacenter एडिशन में असीमित VMs की अनुमति होती है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'Client OS (Windows 11) और Server OS (Server 2025) के इंटरनल टास्क शेड्यूलर में क्या अंतर होता है?'",
  a: "उत्तर: Client OS का थ्रेड शेड्यूलर 'Foreground Applications' (जैसे ब्राउज़र, गेम्स, MS ऑफिस) को उच्च प्राथमिकता देता है ताकि यूजर को स्क्रीन पर लैग न दिखे। इसके विपरीत, Server OS का शेड्यूलर 'Background Services and Network I/O' को सर्वोच्च प्राथमिकता देता है ताकि सैकड़ों क्लाइंट्स के नेटवर्क अनुरोध बिना देरी के प्रोसेस हो सकें।",
  tip: "Wipro और Infosys के L1 Desktop Support/SysAdmin राउंड में यह सवाल सबसे पसंदीदा माना जाता है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'Windows Server 2025 Standard और Datacenter एडिशन में लाइसेंसिंग के नजरिए से सबसे बड़ा अंतर क्या है?'",
  a: "उत्तर: Standard एडिशन में एक लाइसेंस के तहत होस्ट मशीन पर अधिकतम 2 वर्चुअल मशीन (VMs) चलाने का अधिकार मिलता है, जबकि Datacenter एडिशन में उसी होस्ट हार्डवेयर पर असीमित (Unlimited) विंडोज सर्वर वर्चुअल मशीन्स चलाने की अनुमति होती है।",
  tip: "वर्चुअलाइजेशन आर्किटेक्ट और सिस्टम एडमिनिस्ट्रेटर दोनों के लिए यह बुनियादी सवाल है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'Windows Server 2025 में 32KB AD DS डेटाबेस पेज साइज से एंटरप्राइज को क्या प्रत्यक्ष फायदा होता है?'",
  a: "उत्तर: 25 वर्षों तक ntds.dit का पेज साइज 8 KB था। 32 KB पेज साइज होने से एक ही डिस्क I/O ऑपरेशन में चार गुना अधिक डायरेक्टरी डेटा मेमोरी में लोड होता है। इससे हजारों कर्मचारियों वाले एंटरप्राइज में #hl-orange[Kerberos] ऑथेंटिकेशन और LDAP सर्च क्वेरी में 300% से अधिक की अभूतपूर्व गति मिलती है।",
  tip: "Server 2025 के नवीनतम आर्किटेक्चर से जुड़ा यह प्रश्न L2/L3 इंटरव्यू में आपकी उन्नत तकनीकी विशेषज्ञता साबित करता है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: '#hl-green[Azure Arc] हाइब्रिड मॉडल क्या है और यह ऑन-प्रिमाइसेस विंडोज सर्वर को क्लाउड से कैसे जोड़ता है?'",
  a: "उत्तर: #hl-green[Azure Arc] एक ब्रिज की तरह कार्य करता है जो डेटा सेंटर या लोकल लैब में चल रहे फिजिकल/वर्चुअल सर्वर्स को Azure Resource Manager से जोड़ देता है। इससे एडमिनिस्ट्रेटर Azure पोर्टल से ही ऑन-प्रिम सर्वर्स पर सुरक्षा नीतियां, इनसाइट्स, और #hl-yellow[Hotpatching] लागू कर सकते हैं।",
  tip: "TCS, Accenture और Cognizant में हाइब्रिड क्लाउड प्रोजेक्ट्स के लिए यह सवाल बहुत आम है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 01 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - सर्वर 24/7/365 बैकग्राउंड सर्विसेज और क्लाइंट अनुरोधों को प्रोसेस करने के लिए ऑप्टिमाइज़्ड होते हैं।
      - विंडोज सर्वर 2000 में एक्टिव डायरेक्टरी का जन्म हुआ; 2025 संस्करण 32KB AD DB व #hl-yellow[Hotpatching] के साथ इसका सबसे आधुनिक रूप है।
      - प्रोडक्शन में हमेशा #hl-yellow[Server Core] को वरीयता दी जाती है, जबकि लैब में सीखने हेतु Desktop Experience आवश्यक है।
    ]
  ]
)

#pagebreak()
