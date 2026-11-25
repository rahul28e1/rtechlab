// =============================================================================
// CHAPTER 07: GROUP POLICY OBJECTS (GPO) & ENTERPRISE SECURITY DESKTOP CONTROL
// =============================================================================

[#metadata("ch7") <chapter-7>]

#chapter-header(
  chapter-num: "CHAPTER 07",
  category: "भाग 7 : एंटरप्राइज सुरक्षा एवं समूह नीतियां (Group Policy Engine)",
  title: "ग्रुप पॉलिसी ऑब्जेक्ट्स (GPO): एंटरप्राइज सुरक्षा एवं डेस्कटॉप नियंत्रण",
  subtitle: "GPMC (gpmc.msc) · #hl-orange[LSDOU] प्रोसेसिंग क्रम · ब्लॉक इन्हेरिटेंस व एनफोर्स · लैब 1: पासवर्ड नीति · लैब 2: USB ब्लॉक GPO · लैब 3: वॉलपेपर डिप्लॉयमेंट · gpupdate /force"
)

=== 7.1 ग्रुप पॉलिसी क्या है? (What is Group Policy?)
यदि किसी कंपनी में 2,000 कर्मचारी हैं और कंपनी की सुरक्षा नीति कहती है कि किसी भी कंप्यूटर पर पेनड्राइव नहीं लगनी चाहिए, सभी का स्क्रीन सेवर 5 मिनट में लॉक होना चाहिए, और कोई भी कंट्रोल पैनल नहीं खोल सकता — तो क्या एक सिस्टम एडमिनिस्ट्रेटर प्रत्येक कंप्यूटर पर जाकर यह सेटिंग्स करेगा? कभी नहीं!

#mark-yellow[ग्रुप पॉलिसी (Group Policy) माइक्रोसॉफ्ट का एक अत्यंत शक्तिशाली केंद्रीय प्रबंधन इंजन (Configuration Engine) है जिसके द्वारा डोमेन एडमिनिस्ट्रेटर हजारों कंप्यूटरों और यूजर्स के ऑपरेटिंग सिस्टम, सुरक्षा सेटिंग्स, डेस्कटॉप एनवायरनमेंट और सॉफ्टवेयर डिप्लॉयमेंट को एक ही जगह से स्वचालित रूप से नियंत्रित कर सकता है।]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "GPC (Group Policy Container)")[
      GPC एक्टिव डायरेक्टरी डेटाबेस (`ntds.dit`) के अंदर स्टोर होता है। यह GPO के गुणों (Attributes), वर्जन नंबर, GUID (Globally Unique Identifier), और स्टेटस को रखता है।
    ]
  ],
  [
    #info-box(title: "GPT (Group Policy Template)")[
      GPT फ़ाइल सिस्टम (`C:\Windows\SYSVOL\sysvol\domain\Policies\{GUID}\`) में स्टोर होता है। इसमें वास्तविक रजिस्ट्री सेटिंग्स, सुरक्षा नीतियां और स्क्रिप्ट फाइल्स होती हैं।
    ]
  ]
)

#v(4pt)

=== 7.2 #hl-yellow[Group Policy Management Console] (`gpmc.msc`)
ग्रुप पॉलिसी को प्रबंधित करने का प्राथमिक टूल #hl-yellow[GPMC (#hl-yellow[Group Policy Management Console])] है।
- इसे खोलने का रन कमांड है: #mark-green[`gpmc.msc`]।

कंसोल खोलते ही डोमेन के अंतर्गत दो डिफ़ॉल्ट GPOs पहले से बने मिलते हैं:
1. #text(weight: "bold", fill: rtech-navy)[Default Domain Policy:] यह पूरे डोमेन स्तर पर लिंक होती है। इसका प्राथमिक कार्य संपूर्ण डोमेन के लिए पासवर्ड जटिलता, न्यूनतम लंबाई, अकाउंट लॉकआउट और #hl-orange[Kerberos] टिकट नीतियां तय करना है।
2. #text(weight: "bold", fill: rtech-navy)[Default Domain Controllers Policy:] यह केवल 'Domain Controllers' OU पर लिंक होती है और डोमेन कंट्रोलर्स के सुरक्षा अधिकारों (User Rights Assignment) को नियंत्रित करती है।

#v(6pt)

=== 7.3 GPO प्रोसेसिंग का #hl-orange[LSDOU] क्रम एवं इन्हेरिटेंस (Order of Processing)
जब कोई क्लाइंट कंप्यूटर बूट होता है या यूजर लॉगिन करता है, तो विंडोज एक निश्चित क्रम में ग्रुप पॉलिसीज को प्रोसेस करता है। इसे #hl-yellow[LSDOU] नियम कहा जाता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/gpo_inheritance_lsdou.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 7.1: GPO प्रोसेसिंग का #hl-orange[LSDOU] पदानुक्रम — Local, Site, Domain, एवं Organizational Unit (The Golden Rule)]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[LSDOU प्रोसेसिंग क्रम (The Last Write Wins Rule):]\
    - #text(weight: "bold", fill: rtech-blue)[1. L (Local Policy):] क्लाइंट मशीन की स्थानीय नीति सबसे पहले प्रोसेस होती है (सबसे कमजोर)।
    - #text(weight: "bold", fill: rtech-blue)[2. S (Site Policy):] एक्टिव डायरेक्टरी साइट पर लिंक GPO दूसरे नंबर पर लागू होती है।
    - #text(weight: "bold", fill: rtech-amber)[3. D (Domain Policy):] डोमेन स्तर पर लिंक GPO तीसरे नंबर पर प्रोसेस होती है और साइट व लोकल को ओवरराइड करती है।
    - #text(weight: "bold", fill: rtech-emerald)[4. OU (Organizational Unit):] OU पर लिंक GPO सबसे अंत में प्रोसेस होती है। *अतः OU की सेटिंग्स सबसे शक्तिशाली मानी जाती हैं और वे डोमेन सेटिंग्स को भी ओवरराइड कर देती हैं!*
  ]
)

#v(6pt)

=== 7.4 ब्लॉक इन्हेरिटेंस (Block Inheritance) एवं एनफोर्स (Enforced) नीतियां
- #text(weight: "bold", fill: rtech-amber)[Block Inheritance (ब्लॉक इन्हेरिटेंस):] यदि किसी OU (उदा. `Special-Projects`) पर हम राइट-क्लिक करके 'Block Inheritance' लगा दें, तो ऊपर के डोमेन और साइट से आने वाली सभी पॉलिसियां उस OU पर रुक जाती हैं (नीला घेरा)।
- #text(weight: "bold", fill: rtech-rose)[Enforced (एनफोर्स):] यदि कंपनी का CISO यह चाहता है कि कोई भी ब्रांच या OU हेड किसी सुरक्षा नीति (जैसे एंटीवायरस या पासवर्ड) को ब्लॉक न कर सके, तो डोमेन GPO पर #hl-orange[Enforced (Lock Symbol)] लगा दिया जाता है। #mark-orange[Enforced GPO को दुनिया का कोई भी Block Inheritance नहीं रोक सकता; वह हर हाल में लागू होगी!]

#v(6pt)

=== 7.5 प्रैक्टिकल लैब 1: कॉर्पोरेट पासवर्ड एवं लॉकआउट सुरक्षा नीति कॉन्फ़िगरेशन
1. `gpmc.msc` खोलें। अपने डोमेन `corp.rtechlab.local` के नीचे #hl-yellow[Default Domain Policy] पर राइट-क्लिक करें -> #hl-green[Edit] चुनें।
2. Group Policy Management Editor में जाएं:
   `Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`।
3. सेटिंग्स कॉन्फ़िगर करें:
   - #text(weight: "bold")[Minimum password length:] #hl-green[10 characters]
   - #text(weight: "bold")[Password must meet complexity requirements:] #hl-green[Enabled]
   - #text(weight: "bold")[Maximum password age:] #hl-green[60 days]
   - #text(weight: "bold")[Enforce password history:] #hl-green[5 passwords remembered]
4. Account Lockout Policy में जाएं:
   - #text(weight: "bold")[Account lockout threshold:] #hl-orange[5 invalid logon attempts]
   - #text(weight: "bold")[Account lockout duration:] #hl-green[30 minutes]

#v(6pt)

=== 7.6 प्रैक्टिकल लैब 2: यूएसबी रिमूवेबल स्टोरेज ब्लॉक GPO (Data Leak Prevention)
बैंकों और कॉर्पोरेट्स में डेटा चोरी रोकने के लिए पेनड्राइव ब्लॉक करना अनिवार्य होता है:

1. GPMC में जाएं -> #hl-yellow[Group Policy Objects] कंटेनर पर राइट-क्लिक -> #hl-green[New] चुनें।
2. GPO का नाम रखें: #hl-yellow[`GPO_Block_USB_Storage`]।
3. इस GPO पर राइट-क्लिक करके #hl-green[Edit] चुनें।
4. नेविगेट करें:
   `Computer Configuration -> Policies -> Administrative Templates -> System -> Removable Storage Access`।
5. दाईं ओर खोजें: #mark-yellow[All Removable Storage classes: Deny all access]।
6. इस पर डबल-क्लिक करें -> #hl-green[Enabled] रेडियो बटन चुनें -> 'OK' करें।
7. अब GPMC में वापस आएं और इस GPO को अपने वर्कस्टेशन OU (`RTechLab-Enterprise -> Workstations`) पर ड्रैग एंड ड्रॉप (Link) कर दें!

#v(6pt)

=== 7.7 प्रैक्टिकल लैब 3: सेंट्रलाइज्ड कॉर्पोरेट डेस्कटॉप वॉलपेपर डिप्लॉयमेंट GPO
कंपनी के सभी कर्मचारियों के डेस्कटॉप पर RTechLab का आधिकारिक वॉलपेपर स्वतः सेट करना:

1. वॉलपेपर इमेज को सर्वर के शेयर्ड फोल्डर में रखें (उदा. `\\SRV-2025-DC01\Wallpaper\corp-bg.jpg`) ताकि सभी क्लाइंट्स उसे पढ़ सकें।
2. GPMC में नई GPO बनाएं: #hl-yellow[`GPO_Corporate_Wallpaper`]।
3. Edit करें और जाएं:
   `User Configuration -> Policies -> Administrative Templates -> Desktop -> Desktop -> Desktop Wallpaper`।
4. इसे #hl-green[Enabled] करें। Wallpaper Name में UNC पाथ डालें: #hl-green[`\\SRV-2025-DC01\Wallpaper\corp-bg.jpg`] और Style में #hl-yellow['Fill'] चुनें।
5. इसे `Corporate-Departments` OU पर लिंक करें।

#v(6pt)

=== 7.8 क्लाइंट-साइड GPO रिफ्रेश एवं ट्रबलशूटिंग (`gpupdate /force` & `gpresult`)
डिफ़ॉल्ट रूप से क्लाइंट कंप्यूटर पृष्ठभूमि में हर #hl-yellow[90 मिनट (±30 मिनट रैंडम ऑफसेट)] में ग्रुप पॉलिसी को रिफ्रेश करते हैं। डोमेन कंट्रोलर्स हर #hl-yellow[5 मिनट] में रिफ्रेश होते हैं।

*तत्काल पॉलिसी लागू करने और जांचने की 3 मास्टर कमांड्स:*
1. #text(weight: "bold")[तत्काल पॉलिसी लागू करना:]
```cmd
gpupdate /force
```
यह कमांड रिफ्रेश इंटरवल का इंतजार किए बिना सभी यूजर और कंप्यूटर पॉलिसियों को तुरंत डाउनलोड और अप्लाई कर देती है।

2. #text(weight: "bold")[पॉलिसी लागू होने का कंसोल सारांश देखना:]
```cmd
gpresult /r
```
यह स्क्रीन पर दिखाता है कि यूजर और कंप्यूटर पर कौन-कौन सी GPOs सफलतापूर्वक लागू हुईं ('Applied Group Policy Objects') और कौन सी खारिज हुईं।

3. #text(weight: "bold")[विस्तृत HTML डायग्नोस्टिक रिपोर्ट बनाना:]
```cmd
gpresult /h C:\GPO_Report.html
```
यह एक सुंदर इंटरैक्टिव वेब रिपोर्ट जनरेट करता है जिसे ब्राउज़र में खोलकर देखा जा सकता है कि प्रत्येक GPO की किस सेटिंग ने क्या मान बदला।

#v(8pt)

// =============================================================================
// CHAPTER 07 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  ग्रुप पॉलिसी में #hl-yellow[WMI Filters (Windows Management Instrumentation)] का उपयोग करके आप किसी GPO को केवल विशिष्ट हार्डवेयर या OS वर्जन पर लागू कर सकते हैं। उदाहरण के लिए, आप WMI क्वेरी लिख सकते हैं: `SELECT * FROM Win32_OperatingSystem WHERE Version LIKE "10.0.26%" AND ProductType = "1"` — और वह GPO केवल Windows 11 24H2 वाली मशीनों पर ही लागू होगी, बाकी किसी पर नहीं!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 07 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "माइक्रोसॉफ्ट के अनुसार ग्रुप पॉलिसी प्रोसेसिंग का सही मानक पदानुक्रम (Order of Precedence) कौन-सा है?",
  optA: "OU -> Domain -> Site -> Local",
  optB: "Local -> Site -> Domain -> OU (#hl-orange[LSDOU])",
  optC: "Site -> Domain -> Local -> OU",
  optD: "Domain -> OU -> Local -> Site",
  ans: "B",
  exp: "GPO प्रोसेसिंग का मानक क्रम #hl-orange[LSDOU] (Local, Site, Domain, OU) है; अंतिम लागू होने वाली नीति पूर्ववर्ती को ओवरराइड करती है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "यदि किसी चाइल्ड OU पर 'Block Inheritance' लगाया गया हो, लेकिन डोमेन स्तर की GPO पर 'Enforced' सेट हो, तो क्या परिणाम होगा?",
  optA: "GPO एरर देकर क्रैश हो जाएगी",
  optB: "Enforced GPO ब्लॉक इन्हेरिटेंस को नजरअंदाज करके अनिवार्य रूप से लागू होगी",
  optC: "Block Inheritance हमेशा Enforced को रोक देता है",
  optD: "कंप्यूटर बूट होना बंद हो जाएगा",
  ans: "B",
  exp: "Enforced सेटिंग का उद्देश्य ही ब्लॉक इन्हेरिटेंस को निष्प्रभावी करके कॉर्पोरेट नीतियों को बाध्यकारी बनाना है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "क्लाइंट कंप्यूटर पर बैकग्राउंड में नियमित अंतराल का इंतजार किए बिना सभी ग्रुप पॉलिसियों को तत्काल रिफ्रेश करने की कमांड क्या है?",
  optA: "ipconfig /renew",
  optB: "gpupdate /force",
  optC: "net start gpo",
  optD: "dism /online /cleanup-image",
  ans: "B",
  exp: "gpupdate /force कमांड तुरंत डोमेन कंट्रोलर से नवीनतम GPO सेटिंग्स डाउनलोड और अप्लाई करती है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "क्लाइंट कंप्यूटरों पर ग्रुप पॉलिसी का डिफ़ॉल्ट बैकग्राउंड रिफ्रेश इंटरवल कितना होता है?",
  optA: "प्रत्येक 10 मिनट",
  optB: "90 मिनट (0 से 30 मिनट के रैंडम ऑफसेट के साथ)",
  optC: "प्रत्येक 24 घंटे",
  optD: "केवल सिस्टम रीस्टार्ट पर",
  ans: "B",
  exp: "क्लाइंट्स 90 मिनट (प्लस 0-30 मिनट रैंडम जिटर ताकि DC पर एक साथ लोड न आए) में रिफ्रेश होते हैं।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "क्लाइंट मशीन पर लागू सभी ग्रुप पॉलिसियों की संपूर्ण विस्तृत विजुअल HTML रिपोर्ट जनरेट करने की सही कमांड क्या है?",
  optA: "gpresult /h report.html",
  optB: "gpmc.exe /export",
  optC: "show-gpo -all",
  optD: "netsh gpo dump",
  ans: "A",
  exp: "gpresult /h <filepath> एक क्लिकेबल ग्राफिकल HTML रिपोर्ट बनाता है जिसे किसी भी ब्राउज़र में देखा जा सकता है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'Computer Configuration और User Configuration पॉलिसियों में क्या अंतर होता है, और वे कब लागू होती हैं?'",
  a: "उत्तर: Computer Configuration सेटिंग्स पूरे सिस्टम पर लागू होती हैं (जैसे फ़ायरवॉल, बिटडॉकर, USB ब्लॉक) और यह तब प्रोसेस होती हैं जब कंप्यूटर 'बूट' होता है (लॉगिन स्क्रीन से पहले)। User Configuration सेटिंग्स विशिष्ट यूजर के प्रोफाइल पर लागू होती हैं (जैसे डेस्कटॉप वॉलपेपर, ब्राउज़र होमपेज, स्टार्ट मेनू) और यह तब प्रोसेस होती हैं जब यूजर 'लॉगिन' करता है।",
  tip: "Capgemini, Wipro और Infosys के L1/L2 इंटरव्यू में यह सवाल 100% पूछा जाता है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'GPO Slow Link Detection क्या होता है, और यह रिमोट वर्कर्स को कैसे प्रभावित करता है?'",
  a: "उत्तर: जब कोई क्लाइंट VPN या 500 Kbps से धीमे WAN लिंक से जुड़ता है, तो विंडोज इसे 'Slow Link' घोषित कर देता है। नेटवर्क बैंडविड्थ बचाने के लिए विंडोज भारी GPOs (जैसे सॉफ्टवेयर इंस्टॉलेशन, फोल्डर रीडायरेक्शन और बड़ी फाइल्स) की प्रोसेसिंग स्वतः रोक देता है। केवल प्रशासनिक और सुरक्षा नीतियां ही प्रोसेस होती हैं।",
  tip: "यह डीप आर्किटेक्चरल उत्तर आपके वास्तविक फील्ड अनुभव को साबित करता है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'एक यूजर पर GPO अप्लाई नहीं हो रही है। आप L2 सपोर्ट में इसे कैसे ट्रबलशूट करेंगे?'",
  a: "उत्तर: ट्रबलशूटिंग के 4 चरण: 1. क्लाइंट पर 'gpresult /r' चलाकर देखेंगे कि GPO लागू हुई या Denied सूची में है, 2. GPMC में जाकर GPO की 'Security Filtering' जांचेंगे कि यूजर या उसका ग्रुप 'Read' और 'Apply group policy' में शामिल है या नहीं, 3. OU पर 'Block Inheritance' जांचेंगे, और 4. क्लाइंट पर 'w32tm /resync' और 'gpupdate /force' चलाकर Event Viewer में GroupPolicy इवेंट्स (Event ID 1085/1129) जांचेंगे।",
  tip: "सिस्टम सपोर्ट के वास्तविक ट्रबलशूटिंग परिदृश्य में यह जवाब अधिकतम अंक दिलाता है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'Loopback Processing Mode क्या है और इसे किन परिस्थितियों में सक्षम किया जाता है?'",
  a: "उत्तर: सामान्यतः जब कोई यूजर किसी कंप्यूटर पर लॉगिन करता है, तो उस यूजर के OU की User Configuration लागू होती है। लेकिन कियोस्क, मीटिंग रूम, या टर्मिनल सर्वर्स (Citrix / RDS) में हम चाहते हैं कि चाहे कोई भी यूजर (यहाँ तक कि CEO भी) उस कंप्यूटर पर लॉगिन करे, डेस्कटॉप सेटिंग्स हमेशा उस 'कंप्यूटर' की ही लागू हों। इसके लिए हम 'Loopback Processing Mode' (Replace या Merge) सक्षम करते हैं।",
  tip: "RDS और VDI इंफ्रास्ट्रक्चर इंटरव्यूज का यह सबसे पसंदीदा सवाल है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'GPO में 'Security Filtering' और 'WMI Filtering' में क्या अंतर है?'",
  a: "उत्तर: Security Filtering यूजर या कंप्यूटर के सुरक्षा ग्रुप्स (Security Groups) के आधार पर तय करती है कि GPO किसे मिलेगी (उदा. केवल 'GG_HR_Staff')। इसके विपरीत WMI Filtering हार्डवेयर या ओएस के एट्रीब्यूट्स (जैसे केवल 'Windows 11', केवल 'Dell Laptops', या 'RAM > 8GB') के आधार पर GPO को टारगेट करती है।",
  tip: "एडवांस्ड GPO आर्किटेक्चर की आपकी विशेषज्ञता परखने के लिए यह प्रश्न पूछा जाता है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 07 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - ग्रुप पॉलिसी (GPO) हजारों मशीनों के सुरक्षा और डेस्कटॉप नियंत्रण का केंद्रीय इंजन है (#hl-orange[LSDOU] क्रम में प्रोसेस होती है)।
      - Enforced GPO किसी भी Block Inheritance को बाईपास करके बाध्यकारी सुरक्षा सुनिश्चित करती है।
      - `gpupdate /force` और `gpresult /r` (या `/h`) प्रत्येक सिस्टम एडमिनिस्ट्रेटर की मुख्य दैनिक जीपीओ टूल्स हैं।
    ]
  ]
)

#pagebreak()

