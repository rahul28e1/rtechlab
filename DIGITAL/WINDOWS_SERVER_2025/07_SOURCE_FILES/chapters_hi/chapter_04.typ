// =============================================================================
// CHAPTER 04: ACTIVE DIRECTORY DOMAIN SERVICES & DOMAIN CONTROLLER PROMOTION
// =============================================================================

[#metadata("ch4") <chapter-4>]

#chapter-header(
  chapter-num: "CHAPTER 04",
  category: "भाग 4 : केंद्रीय पहचान एवं डायरेक्टरी सर्विसेज (Identity & Directory Services)",
  title: "एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) एवं डोमेन कंट्रोलर प्रमोशन",
  subtitle: "AD DS कोर आर्किटेक्चर · लॉजिकल (Forest, Domain, OU) व फिजिकल (Sites) संरचना · Add Roles Wizard · रूट DC (corp.rtechlab.local) · DSRM पासवर्ड · 5 FSMO रोल्स"
)

=== 4.1 एक्टिव डायरेक्टरी क्या है? (What is Active Directory Domain Services?)
एक साधारण वर्कग्रुप नेटवर्क (Workgroup) में प्रत्येक कंप्यूटर का अपना अलग स्थानीय यूजर डेटाबेस होता है (SAM - Security Accounts Manager)। यदि किसी कंपनी में 500 कंप्यूटर हैं और एक नया कर्मचारी शामिल होता है, तो एडमिन को सभी 500 कंप्यूटरों पर जाकर अलग-अलग यूजर अकाउंट बनाना पड़ेगा!

#mark-yellow[एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) माइक्रोसॉफ्ट की एक केंद्रीकृत डायरेक्टरी सेवा (Centralized Directory Service) है जो संपूर्ण संगठन के सभी यूजर्स, कंप्यूटर्स, ग्रुप्स, और नेटवर्क संसाधनों की जानकारी को एक ही सुरक्षित डेटाबेस में संग्रहीत एवं प्रबंधित करती है।]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "डायरेक्टरी ऑब्जेक्ट्स (Objects) एवं स्कीमा")[
      AD के अंदर प्रत्येक प्रविष्टि को #hl-yellow[ऑब्जेक्ट (Object)] कहा जाता है (उदा. यूजर, कंप्यूटर, प्रिंटर)। प्रत्येक ऑब्जेक्ट के गुण होते हैं जिन्हें #hl-green[एट्रीब्यूट्स (Attributes)] कहते हैं (उदा. First Name, Email, Telephone)। डेटाबेस के इन नियमों और संरचना को #hl-orange[स्कीमा (Schema)] कहा जाता है।
    ]
  ],
  [
    #info-box(title: "ग्लोबल कैटलॉग (Global Catalog - GC)")[
      ग्लोबल कैटलॉग एक विशेष डोमेन कंट्रोलर होता है जो पूरे फ़ॉरेस्ट के सभी डोमेन के सभी ऑब्जेक्ट्स के सबसे आवश्यक एट्रीब्यूट्स (आंशिक प्रतिलिपि) को स्टोर करता है। यह मल्टी-डोमेन नेटवर्क में तेज सर्चिंग सक्षम करता है। #hl-green[पोर्ट: 3268 (LDAP GC)]।
    ]
  ]
)

#v(4pt)

=== 4.2 AD लॉजिकल आर्किटेक्चर: फ़ॉरेस्ट, ट्री, डोमेन एवं OUs
एक्टिव डायरेक्टरी की लॉजिकल संरचना यह निर्धारित करती है कि नेटवर्क संसाधनों को प्रशासनिक रूप से कैसे व्यवस्थित किया जाता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ad_hierarchy_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 4.1: एक्टिव डायरेक्टरी लॉजिकल पदानुक्रम — फ़ॉरेस्ट रूट, चाइल्ड डोमेन, ट्री एवं ऑर्गेनाइजेशनल यूनिट्स (OUs)]
]

#v(4pt)

1. #text(weight: "bold", fill: rtech-navy)[फ़ॉरेस्ट (Forest):] एक्टिव डायरेक्टरी की सर्वोच्च सुरक्षा सीमा (Ultimate Security Boundary)। एक फ़ॉरेस्ट के अंतर्गत आने वाले सभी डोमेन एक सामान्य स्कीमा, एक सामान्य ग्लोबल कैटलॉग और एक सामान्य कॉन्फ़िगरेशन साझा करते हैं।
2. #text(weight: "bold", fill: rtech-navy)[ट्री (Tree):] एक या एकाधिक डोमेन का पदानुक्रम जो एक सतत DNS नेमस्पेस (Contiguous Namespace) साझा करते हैं (उदा. `rtechlab.local` और `delhi.rtechlab.local`)।
3. #text(weight: "bold", fill: rtech-navy)[डोमेन (Domain):] सुरक्षा और प्रशासनिक नीतियों (Administrative Boundary) की मुख्य इकाई। हमारे लैब का डोमेन #hl-yellow[`corp.rtechlab.local`] होगा।
4. #text(weight: "bold", fill: rtech-navy)[ऑर्गेनाइजेशनल यूनिट (OU):] एक डोमेन के भीतर बनाया जाने वाला प्रशासनिक कंटेनर (Container)। इसके अंदर यूजर्स और कंप्यूटर्स को विभाग-वार रखा जाता है ताकि उन पर ग्रुप पॉलिसी (GPO) लागू की जा सके।

#v(6pt)

=== 4.3 AD फिजिकल आर्किटेक्चर: डोमेन कंट्रोलर्स, साइट्स एवं सबनेट्स
लॉजिकल संरचना यह तय करती है कि ऑब्जेक्ट्स को *कैसे देखा जाए*, जबकि फिजिकल संरचना यह तय करती है कि डायरेक्टरी का डेटा *नेटवर्क तारों और हार्डवेयर पर कैसे रेप्लिकेट (Replicate) हो*:

- #text(weight: "bold", fill: rtech-blue)[डोमेन कंट्रोलर (Domain Controller / DC):] वह फिजिकल या वर्चुअल सर्वर जिस पर AD DS रोल इंस्टॉल होता है और जो एक्टिव डायरेक्टरी के मुख्य डेटाबेस (#hl-yellow[`ntds.dit`]) की पूर्ण प्रतिलिपि रखता है।
- #text(weight: "bold", fill: rtech-navy)[एक्टिव डायरेक्टरी साइट्स (Sites):] एक या एक से अधिक सुव्यवस्थित, हाई-स्पीड TCP/IP सबनेट्स का समूह (जैसे 'Mumbai-HO Site' और 'Bangalore-Branch Site')। साइट्स का उपयोग WAN लिंक पर अनावश्यक रेप्लिकेशन ट्रैफिक को नियंत्रित करने और क्लाइंट को निकटतम DC से ऑथेंटिकेट कराने के लिए किया जाता है।

#v(6pt)

=== 4.4 प्रैक्टिकल लैब: Add Roles and Features Wizard द्वारा AD DS रोल इंस्टॉलेशन
अब हम अपनी वर्चुअल मशीन `SRV-2025-DC01` पर एक्टिव डायरेक्टरी रोल स्थापित करेंगे:

1. Server Manager खोलें और शीर्ष दाईं ओर स्थित #hl-green['Manage'] मेनू पर क्लिक करके #hl-yellow['Add Roles and Features'] चुनें।
2. 'Before You Begin' स्क्रीन पर 'Next' दबाएं।
3. Installation Type में #hl-yellow['Role-based or feature-based installation'] चुनकर 'Next' दबाएं।
4. Server Selection में सुनिश्चित करें कि पूल में आपकी मशीन #hl-green[`SRV-2025-DC01 (192.168.1.10)`] चुनी हुई है। 'Next' दबाएं।
5. Server Roles सूची में #mark-yellow[Active Directory Domain Services] चेकबॉक्स पर टिक करें।
6. एक पॉप-अप विंडो खुलेगी: 'Add Features that are required for Active Directory Domain Services' (RSAT टूल्स शामिल)। #hl-green['Add Features'] पर क्लिक करें और 'Next' दबाएं।
7. Features स्क्रीन पर डिफ़ॉल्ट चयन रहने दें और 'Next' दबाएं।
8. Confirmation स्क्रीन पर 'Restart the destination server automatically if required' को अनचेक रहने दें और #hl-green['Install'] पर क्लिक करें।
9. 2 से 3 मिनट में रोल इंस्टॉलेशन पूर्ण हो जाएगा। 'Close' पर क्लिक करें।

#v(6pt)

=== 4.5 प्रैक्टिकल लैब: सर्वर को रूट डोमेन कंट्रोलर प्रमोट करना (DC Promotion)
रोल इंस्टॉल होने के बाद सर्वर अपने आप DC नहीं बनता। उसे प्रमोट करना पड़ता है:

1. Server Manager के शीर्ष पर स्थित पीले रंग के चेतावनी झंडे (#text(weight: "bold", fill: rtech-amber)[⚠️ Notification Flag]) पर क्लिक करें।
2. नीले रंग के लिंक पर क्लिक करें: #mark-green[Promote this server to a domain controller]।
3. #text(weight: "bold")[Deployment Configuration:] चूंकि हम पहली बार नया डोमेन बना रहे हैं, इसलिए तीसरा विकल्प चुनें: #hl-yellow['Add a new forest']।
   - Root domain name में लिखें: #hl-green[`corp.rtechlab.local`]। 'Next' दबाएं।
4. #text(weight: "bold")[Domain Controller Options:]
   - Forest & Domain functional level: #hl-green[Windows Server 2025] (नवीनतम सुरक्षा सुविधाओं के लिए)।
   - 'Domain Name System (DNS) server' और 'Global Catalog (GC)' को चेक रहने दें।
   - #text(weight: "bold", fill: rtech-navy)[Directory Services Restore Mode (DSRM) Password:] यह आपदा के समय AD डेटाबेस को रिस्टोर करने का मास्टर रिकवरी पासवर्ड होता है। एक मजबूत पासवर्ड दर्ज करें (उदा. #hl-green[`Dsrm@2025!`])। 'Next' दबाएं।
5. #text(weight: "bold")[DNS Options:] 'A delegation for this DNS server cannot be created...' की सामान्य पीली चेतावनी आएगी, इसे अनदेखा करके सीधे 'Next' दबाएं।
6. #text(weight: "bold")[Additional Options:] विज़ार्ड स्वतः NetBIOS नाम जनरेट करेगा: #hl-yellow[`CORP`]। 'Next' दबाएं।
7. #text(weight: "bold")[Paths:] डेटाबेस, लॉग और SYSVOL के डिफ़ॉल्ट पाथ रहने दें (`C:\Windows\NTDS` और `C:\Windows\SYSVOL`)। 'Next' दबाएं।
8. #text(weight: "bold")[Prerequisites Check:] सिस्टम सभी पूर्व-आवश्यकताओं की जाँच करेगा। शीर्ष पर हरा टिक दिखेगा: #hl-green['All prerequisite checks passed successfully']।
9. नीचे दिए गए #mark-green[Install] बटन पर क्लिक करें!
10. सर्वर AD DS कॉन्फ़िगर करेगा और स्वचालित रूप से रीबूट होगा। रीबूट के बाद लॉगिन स्क्रीन पर आपको दिखेगा: #hl-yellow[`CORP\Administrator`]। बधाई हो, आपका डोमेन कंट्रोलर अब लाइव है!

#v(6pt)

=== 4.6 FSMO के 5 विशिष्ट रोल्स की कार्यप्रणाली (5 FSMO Master Roles)
यद्यपि एक्टिव डायरेक्टरी एक मल्टी-मास्टर रेप्लिकेशन मॉडल पर कार्य करती है (जहाँ किसी भी DC पर यूजर बनाया जा सकता है), लेकिन डेटा टकराव (Conflicts) को रोकने के लिए 5 ऐसे महत्वपूर्ण कार्य हैं जो एक समय में पूरे नेटवर्क में केवल *एक ही विशिष्ट डोमेन कंट्रोलर* द्वारा किए जा सकते हैं। इन्हें #hl-yellow[FSMO (Flexible Single Master Operations)] रोल्स कहा जाता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/fsmo_roles_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 4.2: FSMO 5 रोल्स का पदानुक्रम — 2 फ़ॉरेस्ट-वाइड रोल्स एवं 3 डोमेन-वाइड रोल्स की कार्यप्रणाली]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[FSMO रोल्स का संपूर्ण विवरण (MNC Interview Goldmine):]\
    - #text(weight: "bold", fill: rtech-blue)[फ़ॉरेस्ट-वाइड रोल्स (पूरे फ़ॉरेस्ट में केवल 1 DC पर):]
      1. #text(weight: "bold")[Schema Master:] पूरे फ़ॉरेस्ट में AD के स्कीमा (क्लास और एट्रीब्यूट्स) में होने वाले बदलावों को नियंत्रित करता है (जैसे Exchange सर्वर इंस्टॉल करते समय)।
      2. #text(weight: "bold")[Domain Naming Master:] फ़ॉरेस्ट में नए डोमेन को जोड़ने या पुराने डोमेन को हटाने का विशेष अधिकार रखता है।
    - #text(weight: "bold", fill: rtech-emerald)[डोमेन-वाइड रोल्स (फ़ॉरेस्ट के प्रत्येक डोमेन में 1-1 DC पर):]
      3. #text(weight: "bold")[PDC Emulator (सर्वोच्च महत्वपूर्ण रोल):] Kerberos पासवर्ड बदलावों की तत्काल प्रोसेसिंग, टाइम सिंक्रोनाइज़ेशन (NTP Master), ग्रुप पॉलिसी संपादन और अकाउंट लॉकआउट संभालता है।
      4. #text(weight: "bold")[RID Master (Relative ID Master):] जब भी कोई नया यूजर/ग्रुप बनता है, उसे एक यूनिक SID मिलता है। RID Master प्रत्येक DC को 500 RIDs का एक पूल आवंटित करता है ताकि SIDs डुप्लिकेट न हों।
      5. #text(weight: "bold")[Infrastructure Master:] मल्टी-डोमेन एनवायरनमेंट में अन्य डोमेन के ग्रुप्स में शामिल यूजर्स के क्रॉस-डोमेन रेफरेंस (GUID और SID मैपिंग) को अपडेट रखता है।
  ]
)

#v(4pt)
#pro-tip(title: "FSMO रोल्स की जाँच करने की 1-सेकंड कमांड")[
  कमांड प्रॉम्प्ट में चलाएं: #hl-green[`netdom query fsmo`] — यह तुरंत दिखा देगा कि आपके 5 रोल्स किस सर्वर पर स्थित हैं!
]

#v(6pt)

=== 4.7 AD डेटाबेस की आंतरिक फाइलें एवं हेल्थ वेरिफिकेशन
- #text(weight: "bold", fill: rtech-navy)[`ntds.dit` (New Technology Directory Services Database):] यह एक्टिव डायरेक्टरी की मुख्य डेटाबेस फाइल है जो `C:\Windows\NTDS\` में स्थित होती है। यह ESE (Extensible Storage Engine - Jet Blue) पर आधारित होती है। Server 2025 में इसका पेज साइज 32 KB है।
- #text(weight: "bold", fill: rtech-navy)[`SYSVOL` फोल्डर:] यह `C:\Windows\SYSVOL\` में स्थित होता है। यह नेटवर्क पर शेयर्ड होता है और सभी डोमेन कंट्रोलर्स के बीच DFSR (Distributed File System Replication) द्वारा सिंक होता है। इसी में सभी ग्रुप पॉलिसी फाइल्स और लॉगिन स्क्रिप्ट्स होती हैं।
- #text(weight: "bold", fill: rtech-navy)[हेल्थ चेक कमांड:] एडमिन कमांड प्रॉम्प्ट में #hl-green[`dcdiag /v`] चलाएं। यह 30 से अधिक आंतरिक परीक्षण (Connectivity, Advertising, Replications, FrsSysvol) चलाकर पुष्टि करता है कि आपका DC 100% स्वस्थ है।

#v(8pt)

// =============================================================================
// CHAPTER 04 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  शुरुआती विंडोज NT 4.0 के दौर में डायरेक्टरी डेटाबेस केवल एक फ्लैट फाइल (SAM) हुआ करती थी जो अधिकतम 40,000 ऑब्जेक्ट्स ही संभाल पाती थी। वर्ष 2000 में एक्टिव डायरेक्टरी के आने के बाद माइक्रोसॉफ्ट ने Microsoft Exchange से जेट ब्लू (Jet Blue ESE) डेटाबेस इंजन अपनाया। आज Windows Server 2025 में एक ही एक्टिव डायरेक्टरी डेटाबेस #hl-yellow[2 अरब (2 Billion) से अधिक ऑब्जेक्ट्स] को बिना किसी परफॉर्मेंस डिग्रेडेशन के प्रोसेस कर सकता है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 04 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "एक्टिव डायरेक्टरी के 5 FSMO रोल्स में से कौन-से दो रोल्स संपूर्ण फ़ॉरेस्ट (Forest-Wide) स्तर पर अद्वितीय होते हैं?",
  optA: "PDC Emulator और RID Master",
  optB: "Schema Master और Domain Naming Master",
  optC: "Infrastructure Master और PDC Emulator",
  optD: "RID Master और Infrastructure Master",
  ans: "B",
  exp: "Schema Master और Domain Naming Master पूरे फ़ॉरेस्ट में केवल 1-1 होते हैं; शेष तीन रोल्स प्रति डोमेन 1-1 होते हैं।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "एक्टिव डायरेक्टरी की मुख्य डेटाबेस फाइल का वास्तविक नाम और एक्सटेंशन क्या होता है?",
  optA: "activedirectory.mdf",
  optB: "ntds.dit",
  optC: "sam.dat",
  optD: "ad_database.db",
  ans: "B",
  exp: "एक्टिव डायरेक्टरी की डेटाबेस फाइल का नाम ntds.dit (Directory Information Tree) होता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "डोमेन में किसी यूजर के पासवर्ड बदलने की तत्काल प्रोसेसिंग, टाइम सिंक्रोनाइज़ेशन और अकाउंट लॉकआउट किस FSMO रोल द्वारा संभाला जाता है?",
  optA: "Schema Master",
  optB: "Domain Naming Master",
  optC: "PDC Emulator",
  optD: "Infrastructure Master",
  ans: "C",
  exp: "PDC Emulator डोमेन का सबसे व्यस्त FSMO रोल है जो पासवर्ड ऑथेंटिकेशन, टाइम और GPO एडिटिंग को नियंत्रित करता है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "एक्टिव डायरेक्टरी में सभी 5 FSMO रोल्स किस डोमेन कंट्रोलर के पास हैं, यह जाँचने के लिए किस आधिकारिक कमांड का उपयोग किया जाता है?",
  optA: "ipconfig /all",
  optB: "netdom query fsmo",
  optC: "gpresult /v",
  optD: "dcdiag /test:dns",
  ans: "B",
  exp: "netdom query fsmo कमांड पाँचों FSMO रोल धारकों के नाम एक सेकंड में प्रदर्शित कर देता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ग्लोबल कैटलॉग (Global Catalog - GC) सर्वर मल्टी-डोमेन क्वेरी सुनने के लिए किस विशिष्ट पोर्ट नंबर का उपयोग करता है?",
  optA: "पोर्ट 80 (HTTP)",
  optB: "पोर्ट 389 (LDAP)",
  optC: "पोर्ट 3268 (LDAP GC)",
  optD: "पोर्ट 445 (SMB)",
  ans: "C",
  exp: "साधारण LDAP पोर्ट 389 पर चलता है, जबकि Global Catalog क्वेरीज पोर्ट 3268 (या SSL में 3269) पर सुनी जाती हैं।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'यदि PDC Emulator रोल धारक सर्वर अचानक क्रैश हो जाए, तो डोमेन पर क्या प्रभाव पड़ेगा?'",
  a: "उत्तर: PDC Emulator के डाउन होने पर डोमेन तुरंत बंद नहीं होता, लेकिन कई समस्याएं शुरू हो जाती हैं: 1. यूजर द्वारा पासवर्ड बदलने पर तुरंत रेप्लिकेशन नहीं होगा और पुराने पासवर्ड से कुछ समय लॉगिन हो सकता है, 2. गलत पासवर्ड पर अकाउंट लॉकआउट प्रोसेस नहीं होगा, 3. पूरे डोमेन की मशीनों में टाइम ड्रिफ्ट (Clock Skew) आने लगेगा, और 4. GPMC में ग्रुप पॉलिसी एडिट करते समय डिफ़ॉल्ट DC नहीं मिलेगा। इसे तुरंत किसी अन्य DC पर सीज़ (Seize) करना आवश्यक होता है।",
  tip: "HCL, Infosys और Tech Mahindra के L2 डायरेक्टरी सर्विसेज इंटरव्यू का यह सबसे हॉट सवाल है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'FSMO रोल्स में Transfer और Seize के बीच क्या अंतर होता है?'",
  a: "उत्तर: 'Transfer' तब किया जाता है जब पुराना DC ऑनलाइन और स्वस्थ हो; इसमें ग्रेसफुली दोनों सर्वर्स आपस में हाथ मिलाकर रोल सौंपते हैं। 'Seize' तब किया जाता है जब पुराना DC हार्डवेयर फेलियर या क्रैश के कारण हमेशा के लिए नष्ट हो चुका हो और वापस कभी ऑनलाइन नहीं आ सकता। Seize के बाद पुराने DC को कभी दोबारा उसी नाम से नेटवर्क पर चालू नहीं करना चाहिए।",
  tip: "डिज़ास्टर रिकवरी और FSMO रोल माइग्रेशन में यह बुनियादी अंतर पूछा जाता है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'DSRM (Directory Services Restore Mode) पासवर्ड क्या है, और यह सामान्य डोमेन एडमिन पासवर्ड से कैसे अलग है?'",
  a: "उत्तर: डोमेन एडमिन का पासवर्ड एक्टिव डायरेक्टरी डेटाबेस (ntds.dit) के अंदर स्टोर होता है। यदि AD डेटाबेस करप्ट हो जाए या सर्वर Safe Mode (DSRM) में बूट हो जहाँ AD सर्विसेज बंद होती हैं, तो डोमेन एडमिन लॉगिन काम नहीं करेगा। ऐसे आपातकाल में सर्वर के लोकल SAM डेटाबेस में केवल DSRM पासवर्ड ही काम करता है जिसके जरिए डेटाबेस रिस्टोर किया जाता है।",
  tip: "यह उत्तर सिद्ध करता है कि आप केवल टूल्स नहीं चलाते, बल्कि इंटरनल रिकवरी आर्किटेक्चर को समझते हैं।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'RID Master की क्या भूमिका है, और RID Exhaustion क्या होता है?'",
  a: "उत्तर: जब भी कोई यूजर, ग्रुप या कंप्यूटर बनता है, उसे एक SID मिलता है (Domain SID + RID)। RID Master प्रत्येक DC को 500 RIDs का पूल देता है। एक 30-बिट आर्किटेक्चर में एक डोमेन में लगभग 1 अरब RIDs उपलब्ध होते हैं। यदि कोई ऑटोमेटेड स्क्रिप्ट अनजाने में लाखों अकाउंट्स बनाकर डिलीट करती रहे, तो RIDs समाप्त हो सकते हैं; Windows Server 2025 में 31-बिट RID स्पेस और वार्निंग इवेंट्स देकर इसे सुरक्षित बनाया गया है।",
  tip: "Cognizant और TCS के सीनियर L2 सपोर्ट राउंड का यह पसंदीदा प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'SYSVOL फोल्डर का क्या काम है और यह डोमेन कंट्रोलर्स के बीच किस प्रोटोकॉल से सिंक होता है?'",
  a: "उत्तर: SYSVOL फोल्डर डोमेन के सभी क्लाइंट्स के लिए शेयर्ड डायरेक्टरी है जिसमें सभी ग्रुप पॉलिसी ऑब्जेक्ट्स (GPT - Templates) और लॉगिन/लॉगऑफ स्क्रिप्ट्स स्टोर होती हैं। आधुनिक विंडोज सर्वर में यह सर्वर्स के बीच DFSR (Distributed File System Replication) द्वारा सिंक होता है (पुराने Server 2003 में प्रयुक्त FRS को अब बंद कर दिया गया है)।",
  tip: "GPO रेप्लिकेशन और इंफ्रास्ट्रक्चर सपोर्ट में DFSR का ज्ञान अनिवार्य माना जाता है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 04 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - AD DS किसी भी एंटरप्राइज की केंद्रीय पहचान और सुरक्षा की रीढ़ है (डेटाबेस: `ntds.dit`, शेयर: `SYSVOL`)।
      - FSMO के 5 रोल्स में से PDC Emulator दैनिक ऑपरेशंस (पासवर्ड, टाइम, GPO) के लिए सबसे महत्वपूर्ण है।
      - `netdom query fsmo` और `dcdiag /v` प्रत्येक सिस्टम एडमिनिस्ट्रेटर की मुख्य दैनिक डायग्नोस्टिक कमांड्स हैं।
    ]
  ]
)

#pagebreak()

