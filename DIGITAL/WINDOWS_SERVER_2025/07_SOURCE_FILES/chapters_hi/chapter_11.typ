// =============================================================================
// CHAPTER 11: IIS 10.X WEB SERVER, SECURE FTP & REMOTE DESKTOP SERVICES (RDS)
// =============================================================================

[#metadata("ch11") <chapter-11>]

#chapter-header(
  chapter-num: "CHAPTER 11",
  category: "भाग 11 : वेब एप्लीकेशन्स एवं रिमोट डेस्कटॉप सेवाएं (IIS & RDS)",
  title: "IIS वेब सर्वर, सिक्योर FTP एवं रिमोट डेस्कटॉप सर्विसेज (RDS)",
  subtitle: "IIS 10.x रोल · आंतरिक पोर्टल · SSL/TLS सर्टिफिकेट बाइंडिंग HTTPS · सिक्योर FTP सर्वर · रिमोट डेस्कटॉप सर्विसेज (RDS / VDI) आर्किटेक्चर"
)

=== 11.1 Internet Information Services (IIS 10.x) रोल एवं आंतरिक पोर्टल
प्रत्येक बहुराष्ट्रीय कंपनी (MNC) अपने आंतरिक कर्मचारियों के लिए इंट्रानेट पोर्टल्स, पे-रोल ऐप्स, टिकटिंग टूल्स और डाक्यूमेंट्स डायरेक्टरी चलाती है।

#mark-yellow[Internet Information Services (IIS) माइक्रोसॉफ्ट का फ्लैगशिप वेब और एफटीपी सर्वर इंजन है जो विंडोज सर्वर पर ASP.NET, PHP, HTML5 और सिक्योर वेब सर्विसेज को उच्च गति और एंटरप्राइज सुरक्षा के साथ होस्ट करता है।]

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/iis_rds_architecture.png", width: 55%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 11.1: IIS 10.x वेब सर्वर एवं रिमोट डेस्कटॉप सर्विसेज (RDS) एंटरप्राइज आर्किटेक्चर]
]

#v(4pt)

*IIS 10.x इंस्टॉलेशन चरण:*
1. Server Manager -> #hl-green[Add Roles and Features] पर जाएं।
2. Server Roles में #mark-yellow[Web Server (IIS)] चेकबॉक्स पर टिक करें।
3. 'Role Services' में सुनिश्चित करें कि #hl-green[Default Document], #hl-green[Directory Browsing], #hl-green[HTTP Errors], #hl-green[HTTP Redirection], और #hl-green[FTP Server] चयनित हैं।
4. 'Install' पर क्लिक करें। इंस्टॉलेशन के बाद ब्राउज़र में `http://localhost/` खोलने पर नीले रंग का आधिकारिक IIS वेलकम पेज प्रदर्शित होगा।

#v(6pt)

=== 11.2 नई वेबसाइट बनाना, पोर्ट बाइंडिंग्स एवं वर्चुअल डायरेक्टरी
1. Tools मेनू से #hl-yellow[Internet Information Services (IIS) Manager] खोलें (या रन में टाइप करें: #mark-green[`inetmgr`])।
2. बाएं फलक में `Sites` पर राइट-क्लिक करें -> #hl-green[Add Website...] चुनें।
3. #text(weight: "bold")[Site name:] `RTechLab-Portal`।
4. #text(weight: "bold")[Physical path:] वह फोल्डर जहाँ आपकी वेबसाइट की HTML फाइल्स हैं (उदा. `C:\inetpub\wwwroot\portal`)।
5. #text(weight: "bold")[Binding:] Type: `http`, IP address: `All Unassigned` (या `192.168.1.10`), Port: `80`। Host name: #hl-green[`portal.corp.rtechlab.local`]।
6. 'OK' दबाएं। अब हमारे DNS सर्वर में `portal` नाम का CNAME रिकॉर्ड पहले से मौजूद होने के कारण पूरे नेटवर्क का कोई भी कंप्यूटर ब्राउज़र में `http://portal.corp.rtechlab.local` खोलकर कंपनी के पोर्टल पर पहुंच सकता है!

#v(6pt)

=== 11.3 SSL/TLS HTTPS सर्टिफिकेट बाइंडिंग (Port 443)
उत्पादन वातावरण में कोई भी वेब पोर्टल बिना एन्क्रिप्शन (HTTP Port 80) के नहीं चलाया जाता:
- Server Certificates विज़ार्ड में जाकर एंटरप्राइज CA (Certificate Authority) या सेल्फ-साइन्ड सर्टिफिकेट जनरेट करें।
- Site Bindings में जाएं -> #hl-green[Add...] -> Type: #mark-yellow[https], Port: #hl-green[443], SSL certificate: `RTechLab-SSL-Cert` चुनकर 'OK' करें।
- अब वेबसाइट #hl-green[`https://portal.corp.rtechlab.local`] पर 256-बिट TLS एन्क्रिप्शन के साथ पूरी तरह सुरक्षित चलेगी।

#v(6pt)

=== 11.4 सिक्योर FTP सर्वर एवं यूजर आइसोलेशन (FTP User Isolation)
जब डेवलपर्स या बाहरी वेंडर्स को सर्वर पर बड़ी डेटा फाइल्स अपलोड करनी होती हैं, तो FTP का उपयोग किया जाता है:
- IIS Manager में Sites -> #hl-yellow[Add FTP Site...] चुनें।
- Authentication में #hl-green[Basic], Authorization में 'Specified users' (`corp\developers`) को 'Read & Write' अधिकार दें।
- #text(weight: "bold", fill: rtech-navy)[User Isolation:] यह सुनिश्चित करता है कि जब यूजर 'rpatel' FTP से कनेक्ट हो, तो वह केवल अपने निजी फोल्डर (`C:\FTPROOT\LocalUser\rpatel`) को ही देख सके और अन्य कर्मचारियों का डेटा उसके लिए अदृश्य रहे।

#v(6pt)

=== 11.5 रिमोट डेस्कटॉप सर्विसेज (RDS / VDI) आर्किटेक्चर
जब किसी कंपनी में 5,000 रिमोट कर्मचारी घर से काम करते हैं, तो उन्हें महंगे लैपटॉप देने के बजाय सर्वर पर सेंट्रलाइज्ड वर्चुअल डेस्कटॉप दिया जाता है:

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[RDS के 5 मुख्य आर्किटेक्चरल रोल्स (MNC Interview Goldmine):]\
    - #text(weight: "bold", fill: rtech-blue)[1. RD Web Access:] वेब ब्राउज़र पोर्टल जिसके जरिए कर्मचारी अपने घर के किसी भी लैपटॉप से लॉगिन करके कॉर्पोरेट RemoteApps और डेस्कटॉप एक्सेस करते हैं।
    - #text(weight: "bold", fill: rtech-rose)[2. RD Gateway:] बाहरी इंटरनेट से आने वाले RDP ट्रैफिक को #hl-orange[HTTPS (Port 443)] के अंदर एनकैप्सुलेट करता है, जिससे बिना VPN के फ़ायरवॉल को पार किया जा सकता है।
    - #text(weight: "bold", fill: rtech-amber)[3. RD Connection Broker:] जब कर्मचारी का इंटरनेट कटकर दोबारा जुड़ता है, तो यह यूजर को उसी पुराने एक्टिव सेशन से दोबारा जोड़ता है और सर्वर्स पर लोड बैलेंस करता है।
    - #text(weight: "bold", fill: rtech-emerald)[4. RD Session Host (RDSH):] वह मुख्य शक्तिशाली सर्वर जो एक साथ 50 से 100 यूजर्स के डेस्कटॉप सेशंस और एप्लीकेशंस को चलाता है।
    - #text(weight: "bold", fill: rtech-navy)[5. RD Licensing Server:] क्लाइंट एक्सेस लाइसेंस (CALs - Per-User या Per-Device) ट्रैक और वैलिडेट करता है।
  ]
)

#v(8pt)

// =============================================================================
// CHAPTER 11 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  IIS 10.x में प्रत्येक वेबसाइट एक स्वतंत्र #hl-yellow[Application Pool] के अंतर्गत चलती है जिसका अपना अलग वर्कर प्रोसेस (`w3wp.exe`) होता है। यदि सर्वर पर 20 वेबसाइट्स चल रही हैं और किसी एक वेबसाइट का कोड क्रैश या मेमोरी लीक हो जाता है, तो केवल वही 1 वेबसाइट बंद होगी; बाकी 19 वेबसाइट्स बिना किसी रुकावट के 100% सुचारू चलती रहेंगी!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 11 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "माइक्रोसॉफ्ट के Internet Information Services (IIS) कंसोल को सीधे खोलने का रन कमांड क्या है?",
  optA: "iis.msc",
  optB: "inetmgr",
  optC: "webmgmt.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "inetmgr (Internet Information Services Manager) IIS का आधिकारिक मैनेजमेंट शॉर्टकट है।"
)

#v(2pt)

#mcq-item(
  num: "2",
  q: "IIS वेब सर्वर में सुरक्षित एनक्रिप्टेड HTTPS वेबसाइट्स चलाने के लिए किस आधिकारिक IANA पोर्ट नंबर का उपयोग किया जाता है?",
  optA: "पोर्ट 80",
  optB: "पोर्ट 443",
  optC: "पोर्ट 3389",
  optD: "पोर्ट 8080",
  ans: "B",
  exp: "HTTP पोर्ट 80 पर चलता है जबकि सुरक्षित SSL/TLS एन्क्रिप्शन पोर्ट 443 पर चलता है।"
)

#v(2pt)

#mcq-item(
  num: "3",
  q: "रिमोट डेस्कटॉप सर्विसेज (RDS) में कौन-सा रोल RDP ट्रैफिक को HTTPS (पोर्ट 443) के अंदर एनकैप्सुलेट करके इंटरनेट से सुरक्षित एक्सेस देता है?",
  optA: "RD Session Host",
  optB: "RD Gateway",
  optC: "RD Connection Broker",
  optD: "RD Licensing",
  ans: "B",
  exp: "RD Gateway बाहरी इंटरनेट से RDP ओवर HTTPS (443) टनल बनाकर फ़ायरवॉल को सुरक्षित पार करता है।"
)

#v(2pt)

#mcq-item(
  num: "4",
  q: "IIS में अलग-अलग वेबसाइट्स को एक-दूसरे के क्रैश होने से बचाने के लिए किस आइसोलेशन तंत्र का उपयोग किया जाता है?",
  optA: "Hyper-V VM",
  optB: "Application Pool (w3wp.exe)",
  optC: "NTFS Quota",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "Application Pools प्रत्येक वेब ऐप को स्वतंत्र वर्कर प्रोसेस में आइसोलेट रखते हैं।"
)

#v(2pt)

#mcq-item(
  num: "5",
  q: "FTP सर्वर में प्रत्येक यूजर को केवल उसके अपने विशिष्ट निजी फोल्डर तक सीमित रखने के लिए किस फीचर को सक्षम किया जाता है?",
  optA: "Anonymous Authentication",
  optB: "FTP User Isolation",
  optC: "Directory Browsing",
  optD: "IP Filtering",
  ans: "B",
  exp: "FTP User Isolation उपयोगकर्ताओं को अन्य कर्मचारियों की डायरेक्टरीज देखने से पूरी तरह रोकता है।"
)

#v(4pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(2pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'IIS में Application Pool Recycle क्या होता है, और यह क्यों आवश्यक है?'",
  a: "उत्तर: समय के साथ वेब एप्लीकेशंस में मेमोरी लीक्स या अनकलेक्टेड ऑब्जेक्ट्स जमा हो सकते हैं। Application Pool Recycle के तहत IIS पुराने वर्कर प्रोसेस (w3wp.exe) को ग्रेसफुली समाप्त करके एक नया क्लीन प्रोसेस शुरू करता है। 'Overlapped Recycling' के कारण मौजूदा यूजर्स का कनेक्शन टूटे बिना बैकग्राउंड में मेमोरी तुरंत साफ हो जाती है।",
  tip: "Wipro, Cognizant और Infosys के वेब सर्वर सपोर्ट इंटरव्यू में यह प्रश्न पूछा जाता है।"
)

#v(2pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'RD Gateway और पारम्परिक कॉर्पोरेट VPN में क्या अंतर है?'",
  a: "उत्तर: VPN क्लाइंट लैपटॉप को पूरे कॉर्पोरेट नेटवर्क का आईपी असाइन करता है जिससे यदि लैपटॉप इन्फेक्टेड हो तो पूरे नेटवर्क में वायरस फैल सकता है। इसके विपरीत RD Gateway केवल पोर्ट 443 पर केवल विशिष्ट RDP सेशन की अनुमति देता है; क्लाइंट कभी कॉर्पोरेट नेटवर्क से सीधे नहीं जुड़ता, केवल स्क्रीन पिक्सल्स स्ट्रीम होते हैं (Zero Trust दृष्टिकोण)।",
  tip: "यह आधुनिक साइबर सुरक्षा और रिमोट वर्क आर्किटेक्चर का बेहतरीन उत्तर है।"
)

#v(2pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'एक ही IIS सर्वर और एक ही IP एड्रेस पर 5 अलग-अलग वेबसाइट्स कैसे होस्ट की जा सकती हैं?'",
  a: "उत्तर: 'Host Headers' (या Hostname Bindings) के जरिए। IIS में सभी साइट्स को IP 192.168.1.10 और पोर्ट 80 दिया जाता है, लेकिन Host Name अलग-अलग रखे जाते हैं (उदा. site1.corp.local, site2.corp.local)। जब यूजर रिक्वेस्ट भेजता है, तो IIS HTTP हेडर में आने वाले डोमेन नाम को देखकर सही साइट का वेब पेज लौटा देता है।",
  tip: "वेब होस्टिंग और सर्वर कंसोलिडेशन का यह क्लासिक फंडामेंटल प्रश्न है।"
)

#v(2pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'RDS में Per-User CAL और Per-Device CAL में क्या अंतर होता है?'",
  a: "उत्तर: Per-User CAL एक विशिष्ट कर्मचारी को दिया जाता है चाहे वह लैपटॉप, फोन या घर के पीसी से RDS कनेक्ट करे (शिफ्ट कर्मचारियों या फील्ड वर्कर्स के लिए बेस्ट)। Per-Device CAL एक विशिष्ट कंप्यूटर को दिया जाता है चाहे उस पर 24 घंटे में 3 अलग-अलग शिफ्ट के कर्मचारी लॉगिन करें (कॉल सेंटर या हॉस्पिटल रिसेप्शन के लिए बेस्ट)।",
  tip: "लाइसेंसिंग और इंफ्रास्ट्रक्चर बजटिंग के इंटरव्यूज का यह महत्वपूर्ण सवाल है।"
)

#v(2pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'HTTP Error 503: Service Unavailable आने का सबसे मुख्य कारण क्या होता है?'",
  a: "उत्तर: Error 503 का 95% मामलों में मुख्य कारण उस वेबसाइट से जुड़े 'Application Pool' का क्रैश या 'Stopped' अवस्था में होना होता है (जैसे गलत सर्विस अकाउंट क्रेडेंशियल्स या अत्यधिक अनहैंडल्ड एक्सेप्शन्स के कारण रैपिड-फेल प्रोटेक्शन का ट्रिगर होना)। IIS Manager में जाकर App Pool को 'Start' करना इसका पहला समाधान है।",
  tip: "L1/L2 वेब सपोर्ट में यह सबसे आम ट्रबलशूटिंग परिदृश्य है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 11 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - IIS 10.x एंटरप्राइज वेब पोर्टल्स को Application Pools द्वारा सुरक्षित और आइसोलेटेड रखता है।
      - RD Gateway पोर्ट 443 पर बिना भारी VPN के सुरक्षित रिमोट वर्क और VDI एक्सेस प्रदान करता है।
      - Host Headers एक ही IP और पोर्ट पर एकाधिक कॉर्पोरेट वेबसाइट्स चलाने की सुविधा देते हैं।
    ]
  ]
)

#pagebreak()

