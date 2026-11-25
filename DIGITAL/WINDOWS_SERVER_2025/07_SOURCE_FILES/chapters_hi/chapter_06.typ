// =============================================================================
// CHAPTER 06: CLIENT DOMAIN JOIN & AUTHENTICATION WALKTHROUGH
// =============================================================================

[#metadata("ch6") <chapter-6>]

#chapter-header(
  chapter-num: "CHAPTER 06",
  category: "भाग 6 : एंडपॉइंट एकीकरण एवं ऑथेंटिकेशन (Client Domain Join & Authentication)",
  title: "क्लाइंट मशीन (Windows 10/11) को डोमेन से जोड़ना (Domain Join Walkthrough)",
  subtitle: "क्लाइंट प्री-रिक्विज़िट्स · क्लाइंट DNS IP मैपिंग नियम · नेटवर्क कनेक्टिविटी व nslookup टेस्ट · वर्कग्रुप से डोमेन माइग्रेशन · टॉप 5 जॉइन एरर्स व फिक्स · डोमेन लॉगिन टेस्ट"
)

=== 6.1 क्लाइंट वर्कस्टेशन की पूर्व-आवश्यकताएं (Client Prerequisites)
डोमेन कंट्रोलर और यूजर अकाउंट तैयार होने के बाद, अगला चरण कर्मचारी के लैपटॉप/डेस्कटॉप को एक्टिव डायरेक्टरी डोमेन से जोड़ना होता है ताकि उस पर केंद्रीय नीतियां और सुरक्षा लागू हो सके।

#warning-box(title: "विंडोज एडिशन प्रतिबंध (Windows Home Edition Trap)")[
  Microsoft Windows 10/11 #hl-orange[Home Edition को कभी भी एक्टिव डायरेक्टरी डोमेन से नहीं जोड़ा जा सकता।] डोमेन जॉइन करने के लिए क्लाइंट मशीन पर #mark-green[Windows 10/11 Pro, Enterprise, या Education] संस्करण का होना अनिवार्य है।
]

#v(4pt)
*लैब में क्लाइंट मशीन का विनिर्देश:*
- VM नाम: #hl-yellow[`CLT-WIN11-01`]
- ऑपरेटिंग सिस्टम: Windows 11 Pro 64-bit
- नेटवर्क एडेप्टर: Internal Network (वही नेटवर्क जिस पर `SRV-2025-DC01` चल रहा है)

#v(6pt)

=== 6.2 क्लाइंट पर DNS IP को डोमेन कंट्रोलर पर पॉइंट करना (The #1 Golden Rule)
नए छात्र और नौसिखिए आईटी सपोर्ट इंजीनियरों द्वारा की जाने वाली 99% गलतियां यहीं होती हैं:

#mark-yellow[क्लाइंट मशीन तब तक एक्टिव डायरेक्टरी डोमेन को नहीं खोज पाएगी जब तक कि उसके नेटवर्क एडेप्टर के 'Preferred DNS Server' में डोमेन कंट्रोलर का IP एड्रेस दर्ज न हो!]

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/domain_join_flow.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 6.1: क्लाइंट मशीन डोमेन जॉइन 5-चरणीय जीवन चक्र — DNS मैपिंग, डिस्कवरी, ऑथेंटिकेशन एवं प्रथम लॉगिन]
]

#v(4pt)

*क्लाइंट नेटवर्क सेटिंग्स:*
1. क्लाइंट मशीन पर Run (`Win + R`) खोलें और टाइप करें: #hl-green[`ncpa.cpl`]।
2. Ethernet एडेप्टर Properties -> #hl-yellow[Internet Protocol Version 4 (TCP/IPv4)] -> Properties में जाएं।
3. IP Address: #hl-green[`192.168.1.50`]
4. Subnet Mask: #hl-green[`255.255.255.0`]
5. Default Gateway: #hl-green[`192.168.1.1`]
6. #text(weight: "bold", fill: rtech-navy)[Preferred DNS Server:] #mark-orange[`192.168.1.10`] (हमारे DC सर्वर का IP)।

#v(6pt)

=== 6.3 नेटवर्क कनेक्टिविटी एवं DNS रेजोल्यूशन टेस्ट (Pre-flight Checks)
डोमेन जॉइन विज़ार्ड शुरू करने से पहले कमांड प्रॉम्प्ट में दो त्वरित टेस्ट करना अनिवार्य है:

1. #text(weight: "bold")[Ping टेस्ट:]
```cmd
ping 192.168.1.10
```
यदि Reply आ रहा है, तो फिजिकल/वर्चुअल नेटवर्क कनेक्शन 100% ठीक है।

2. #text(weight: "bold")[DNS एवं SRV रिकॉर्ड रेजोल्यूशन टेस्ट:]
```cmd
nslookup corp.rtechlab.local
```
यदि उत्तर में Server: `SRV-2025-DC01.corp.rtechlab.local` और Address: `192.168.1.10` दिखे, तो इसका अर्थ है कि क्लाइंट अब डोमेन कंट्रोलर को खोजने में पूरी तरह सक्षम है।

#v(6pt)

=== 6.4 वर्कग्रुप से डोमेन में माइग्रेशन विज़ार्ड (Full Join Walkthrough)
1. क्लाइंट मशीन पर Run (`Win + R`) खोलें और टाइप करें: #hl-green[`sysdm.cpl`] (System Properties)।
2. 'Computer Name' टैब पर नीचे स्थित #hl-yellow['Change...'] बटन पर क्लिक करें।
3. Computer name में लिखें: #hl-yellow[`CLT-WIN11-01`]।
4. 'Member of' अनुभाग में 'Workgroup' से हटाकर #mark-yellow[Domain] रेडियो बटन चुनें।
5. डोमेन नाम बॉक्स में दर्ज करें: #hl-green[`corp.rtechlab.local`] और 'OK' दबाएं।
6. स्क्रीन पर क्रेडेंशियल प्रॉम्प्ट (Windows Security) खुलेगा। डोमेन एडमिन के क्रेडेंशियल्स डालें:
   - Username: #hl-yellow[`corp.rtechlab.local\Administrator`] (या सिर्फ `Administrator`)
   - Password: #hl-green[`P@ssw0rd2025!`]
7. 5 से 10 सेकंड में एक सुंदर पॉप-अप संदेश आएगा:
   #align(center)[#box(fill: rgb("#DCFCE7"), stroke: 1pt + rgb("#86EFAC"), radius: 4pt, inset: 6pt)[
     #text(size: 9pt, weight: "black", fill: rgb("#166534"))[✓ Welcome to the corp.rtechlab.local domain.]
   ]]
8. 'OK' दबाएं -> 'You must restart your computer to apply these changes' -> #hl-green['Restart Now'] पर क्लिक करें।

#v(6pt)

=== 6.5 डोमेन जॉइनिंग के समय आने वाले टॉप 5 एरर्स एवं उनका सटीक समाधान
उत्पादन और इंटरव्यू दोनों में डोमेन जॉइनिंग एरर्स बहुत सामान्य हैं:

1. #text(weight: "bold", fill: rtech-rose)[एरर 1: 'An Active Directory Domain Controller for the domain could not be contacted':]
   - *कारण:* क्लाइंट के DNS में डोमेन कंट्रोलर का IP नहीं है (क्लाइंट सार्वजनिक Google DNS 8.8.8.8 या होम वाई-फाई रूटर से IP ले रहा है)।
   - *समाधान:* `ncpa.cpl` में जाकर Preferred DNS को `192.168.1.10` पर सेट करें।
2. #text(weight: "bold", fill: rtech-rose)[एरर 2: 'The network path was not found (0x80070035)':]
   - *कारण:* डोमेन कंट्रोलर पर Windows Firewall द्वारा SMB (#hl-green[Port 445]) या RPC पोर्ट्स ब्लॉक हैं।
   - *समाधान:* DC पर 'File and Printer Sharing' फ़ायरवॉल नियम सक्षम करें।
3. #text(weight: "bold", fill: rtech-rose)[एरर 3: 'There is a time and/or date difference between the client and server':]
   - *कारण:* क्लाइंट और DC की घड़ी में 5 मिनट से अधिक का #hl-orange[Kerberos] टाइम ड्रिफ्ट (Clock Skew) है।
   - *समाधान:* क्लाइंट की घड़ी और टाइम ज़ोन को DC से मैच करें या `w32tm /resync` चलाएं।
4. #text(weight: "bold", fill: rtech-rose)[एरर 4: 'Access is denied':]
   - *कारण:* जॉइन करते समय डाले गए क्रेडेंशियल्स के पास कंप्यूटर जोड़ने का अधिकार नहीं है।
   - *समाधान:* Domain Admins के क्रेडेंशियल्स का उपयोग करें या OU पर Join Permissions डेलिगेट करें।
5. #text(weight: "bold", fill: rtech-rose)[एरर 5: 'The computer account already exists in the domain':]
   - *कारण:* पहले से उसी नाम का कंप्यूटर अकाउंट ADUC में मौजूद है और उसका SID मिसमैच हो रहा है।
   - *समाधान:* ADUC में जाकर पुराने कंप्यूटर अकाउंट को डिलीट करें या रिसेट करें।

#v(6pt)

=== 6.6 सिस्टम रीस्टार्ट एवं डोमेन यूजर अकाउंट से प्रथम लॉगिन
रीस्टार्ट होने के बाद क्लाइंट की लॉक स्क्रीन बदल जाएगी:

1. लॉक स्क्रीन पर नीचे बाईं ओर #mark-yellow['Other user'] पर क्लिक करें।
2. नीचे लिखा दिखेगा: *Sign in to: CORP*।
3. Username: #hl-green[`rpatel`] (जो यूजर हमने अध्याय 05 में बनाया था)।
4. Password: #hl-green[`Welcome@2025#`]।
5. स्क्रीन पर तुरंत संदेश आएगा: #text(weight: "bold", fill: rtech-blue)['The user's password must be changed before signing in']।
6. 'OK' पर क्लिक करें। कर्मचारी अपना नया व्यक्तिगत सुरक्षित पासवर्ड डालेगा (उदा. #hl-green[`MySecurePass@2025`])।
7. विंडोज नया यूजर प्रोफाइल तैयार करेगा (`C:\Users\rpatel`) और डेस्कटॉप खुल जाएगा!
8. सत्यापन के लिए कमांड प्रॉम्प्ट खोलें और टाइप करें: #hl-green[`whoami`]। स्क्रीन पर उत्तर मिलेगा: #mark-green[`corp\rpatel`]।

#v(8pt)

// =============================================================================
// CHAPTER 06 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  जब कोई कंप्यूटर डोमेन जॉइन करता है, तो कंप्यूटर का अपना एक गुप्त मशीन खाता (Machine Account - `CLT-WIN11-01$`) एक्टिव डायरेक्टरी में बनता है। क्या आप जानते हैं कि कंप्यूटर और डोमेन कंट्रोलर के बीच का सिक्योर्ड चैनल पासवर्ड हर #hl-yellow[30 दिन में पृष्ठभूमि में स्वतः बदलता है]? यदि कोई कंप्यूटर 90 दिनों से अधिक समय तक नेटवर्क से डिस्कनेक्ट रहे, तो यह ट्रस्ट रिलेशनशिप टूट जाता है (Trust Relationship Failed Error)!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 06 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "विंडोज के किस संस्करण को एक्टिव डायरेक्टरी डोमेन से जोड़ने की अनुमति नहीं होती है?",
  optA: "Windows 11 Enterprise",
  optB: "Windows 11 Pro",
  optC: "Windows 11 Home Edition",
  optD: "Windows 11 Education",
  ans: "C",
  exp: "Windows Home Edition में कॉर्पोरेट डोमेन जॉइनिंग और ग्रुप पॉलिसी का फीचर माइक्रोसॉफ्ट द्वारा अक्षम रखा जाता है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "क्लाइंट कंप्यूटर पर डोमेन जॉइन करते समय 'Domain Controller could not be contacted' एरर आने का सबसे प्रमुख कारण क्या है?",
  optA: "क्लाइंट का कीबोर्ड खराब होना",
  optB: "क्लाइंट के Preferred DNS में डोमेन कंट्रोलर का IP न होना",
  optC: "क्लाइंट में 16 GB रैम न होना",
  optD: "गूगल क्रोम का इंस्टॉल न होना",
  ans: "B",
  exp: "क्लाइंट डोमेन कंट्रोलर के SRV रिकॉर्ड्स को केवल AD DNS सर्वर पर ही खोज सकता है; गलत DNS होने पर जॉइन फेल हो जाता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "विंडोज में सिस्टम प्रॉपर्टीज (System Properties) विंडो खोलकर कंप्यूटर को डोमेन से जोड़ने का शॉर्टकट रन कमांड क्या है?",
  optA: "ncpa.cpl",
  optB: "sysdm.cpl",
  optC: "appwiz.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "sysdm.cpl (System Device Manager / System Properties) कंप्यूटर रीनेम और डोमेन जॉइनिंग विंडो खोलता है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "क्लाइंट मशीन पर यह जाँचने के लिए कि वर्तमान में कौन-सा डोमेन यूजर लॉग-इन है, किस कमांड का उपयोग किया जाता है?",
  optA: "getmac",
  optB: "whoami",
  optC: "hostname",
  optD: "netstat",
  ans: "B",
  exp: "whoami कमांड वर्तमान लॉग-इन यूजर का डोमेन और यूजरनेम (उदा. corp\\rpatel) प्रदर्शित करता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "क्लाइंट कंप्यूटर और डोमेन कंट्रोलर के बीच मशीन अकाउंट का सीक्रेट पासवर्ड स्वचालित रूप से कितने दिनों में बदला जाता है?",
  optA: "7 दिन",
  optB: "30 दिन",
  optC: "90 दिन",
  optD: "365 दिन",
  ans: "B",
  exp: "नेटलॉगऑन सर्विस डिफ़ॉल्ट रूप से प्रत्येक 30 दिनों में कंप्यूटर अकाउंट का पासवर्ड स्वतः बदलती है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'क्लाइंट मशीन पर एरर आ रहा है: 'The trust relationship between this workstation and the primary domain failed.' इसे बिना दोबारा डोमेन जॉइन किए कैसे ठीक करेंगे?'",
  a: "उत्तर: यह एरर तब आता है जब कंप्यूटर का मशीन पासवर्ड AD में मौजूद पासवर्ड से मिसमैच हो जाए (जैसे स्नैपशॉट रिस्टोर करने पर या 30 दिन से अधिक ऑफलाइन रहने पर)। इसे ठीक करने के लिए लोकल एडमिन से लॉगिन करके PowerShell में चलाएंगे: 'Reset-ComputerMachinePassword -Credential (Get-Credential)' या 'Test-ComputerSecureChannel -Repair'। इससे बिना रीबूट के ट्रस्ट रीसेट हो जाता है।",
  tip: "Wipro, Infosys और HCL के L2 Desktop Support इंटरव्यू में यह सवाल 100% पूछा जाता है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'एक साधारण डोमेन यूजर (Non-Admin) डिफ़ॉल्ट रूप से कितने कंप्यूटरों को डोमेन में जॉइन करवा सकता है?'",
  a: "उत्तर: एक्टिव डायरेक्टरी में डिफ़ॉल्ट रूप से एक सामान्य 'Authenticated User' को अधिकतम 10 कंप्यूटरों को डोमेन से जोड़ने (ms-DS-MachineAccountQuota) की अनुमति होती है। हालांकि प्रोडक्शन सुरक्षा के लिए हम ADSI Edit में जाकर इस कोटा को 0 पर सेट करते हैं और केवल IT सपोर्ट टीम को OUs पर जॉइनिंग राइट्स डेलिगेट करते हैं।",
  tip: "यह डीप आर्किटेक्चरल प्रश्न इंटरव्यूअर को तुरंत प्रभावित करता है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'क्लाइंट मशीन पर Cached Credentials क्या होते हैं, और इनका क्या सुरक्षा जोखिम है?'",
  a: "उत्तर: जब कोई कर्मचारी अपने लैपटॉप को ऑफिस नेटवर्क (DC) से बाहर ले जाता है (Work from Home), तब भी वह अपने डोमेन पासवर्ड से लॉगिन कर पाता है क्योंकि विंडोज अंतिम 10 सफल लॉगिन के पासवर्ड हैश को स्थानीय रूप से 'Cached Logons' में स्टोर रखता है। सुरक्षा ऑडिट्स में हम GPO द्वारा इस कैश्ड लॉगन्स की संख्या को नियंत्रित करते हैं।",
  tip: "सिक्योरिटी ऑपरेशंस और रिमोट वर्कफोर्स मैनेजमेंट का यह प्रमुख इंटरव्यू टॉपिक है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'Domain Join के दौरान नेटवर्क पर कौन-सा प्रोटोकॉल और पोर्ट उपयोग होता है?'",
  a: "उत्तर: Domain Join के दौरान कई प्रोटोकॉल्स कार्य करते हैं: 1. DNS (Port 53) DC के SRV रिकॉर्ड्स खोजने के लिए, 2. #hl-orange[Kerberos] (#hl-green[Port 88]) क्रेडेंशियल ऑथेंटिकेशन के लिए, 3. LDAP (#hl-green[Port 389]) कंप्यूटर ऑब्जेक्ट बनाने के लिए, और 4. SMB (#hl-green[Port 445]) व RPC (Port 135) पॉलिसी और डायरेक्टरी संचार के लिए।",
  tip: "नेटवर्किंग और सर्वर के क्रॉस-डोमेन ज्ञान को परखने वाला यह क्लासिक सवाल है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'क्लाइंट मशीन पर 'Sign in to:' में डोमेन के बजाय लोकल पीसी का नाम कैसे लाएंगे?'",
  a: "उत्तर: यदि हमें डोमेन के बजाय क्लाइंट के लोकल कंप्यूटर अकाउंट से लॉगिन करना हो, तो यूजरनेम में '.\\Administrator' या 'CLT-WIN11-01\\Administrator' टाइप करते हैं। '.\\' (Dot-Backslash) टाइप करते ही सिस्टम स्थानीय मशीन के SAM डेटाबेस पर स्विच हो जाता है।",
  tip: "हेल्पडेस्क और डेस्कटॉप सपोर्ट के तकनीकी टेस्ट में यह बुनियादी ट्रिक हमेशा पूछी जाती है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 06 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - क्लाइंट का Preferred DNS सर्वर हमेशा डोमेन कंट्रोलर के IP पर पॉइंट होना चाहिए; इसके बिना डोमेन डिस्कवरी असंभव है।
      - डोमेन जॉइन होने पर कंप्यूटर का अपना मशीन खाता (`CLT-WIN11-01$`) बनता है और ट्रस्ट चैनल 30 दिन में रिन्यू होता है।
      - 'whoami' और 'Test-ComputerSecureChannel' डोमेन ऑथेंटिकेशन सत्यापन के प्राथमिक टूल्स हैं।
    ]
  ]
)

#pagebreak()

