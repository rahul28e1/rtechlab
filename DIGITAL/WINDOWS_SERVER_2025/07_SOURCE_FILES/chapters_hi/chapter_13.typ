// =============================================================================
// CHAPTER 13: BACKUP, DISASTER RECOVERY & ACTIVE DIRECTORY RECYCLE BIN
// =============================================================================

[#metadata("ch13") <chapter-13>]

#chapter-header(
  chapter-num: "CHAPTER 13",
  category: "भाग 13 : डिज़ास्टर रिकवरी एवं डेटा संरक्षण (Disaster Recovery & Backup)",
  title: "सर्वर बैकअप, डिज़ास्टर रिकवरी एवं एक्टिव डायरेक्टरी रीसायकल बिन",
  subtitle: "3-2-1 एंटरप्राइज बैकअप रणनीति · Windows Server Backup · फुल vs सिस्टम स्टेट बैकअप · AD रीसायकल बिन सक्षम करना · डिलीटेड यूजर की 1-क्लिक रिकवरी · wbadmin ऑटोमेशन"
)

=== 13.1 एंटरप्राइज बैकअप रणनीति: 3-2-1 का स्वर्णिम सिद्धांत
एक कुशल सिस्टम एडमिनिस्ट्रेटर की असली परीक्षा तब नहीं होती जब सब कुछ ठीक चल रहा हो, बल्कि तब होती है जब डेटा सेंटर में आग लग जाए, रैंसमवेयर हमला हो जाए, या कोई जूनियर एडमिन गलती से पूरी कंपनी का डायरेक्टरी डेटाबेस डिलीट कर दे!

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/backup_disaster_recovery_flow.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 13.1: 3-2-1 एंटरप्राइज बैकअप आर्किटेक्चर एवं एक्टिव डायरेक्टरी रीसायकल बिन 1-क्लिक लाइव रिकवरी]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[3-2-1 बैकअप का स्वर्णिम नियम (Global Industry Standard):]\
    - #text(weight: "bold", fill: rtech-blue)[3 कॉपियां (Three Copies of Data):] आपके पास अपने डेटा की कम से कम 3 प्रतियां होनी चाहिए (1 ओरिजिनल प्रोडक्शन कॉपी + 2 स्वतंत्र बैकअप कॉपियां)।
    - #text(weight: "bold", fill: rtech-amber)[2 अलग-अलग मीडिया (Two Different Media Types):] बैकअप को दो अलग-अलग तकनीकों पर स्टोर करें (उदा. एक कॉपी लोकल NVMe NAS/SAN स्टोरेज पर और दूसरी कॉपी LTO टेप ड्राइव या क्लाउड ब्लॉब पर)।
    - #text(weight: "bold", fill: rtech-rose)[1 कॉपी ऑफसाइट (One Offsite Immutable Copy):] कम से कम एक बैकअप कॉपी भौगोलिक रूप से किसी दूसरे शहर या सुरक्षित क्लाउड में होनी चाहिए जो 'इम्यूटेबल' (Write Once Read Many - WORM) हो ताकि रैंसमवेयर उसे एनक्रिप्ट न कर सके।
  ]
)

#v(6pt)

=== 13.2 Windows Server Backup फीचर इंस्टॉलेशन
माइक्रोसॉफ्ट विंडोज सर्वर में एक इन-बिल्ट बैकअप समाधान प्रदान करता है:

1. Server Manager -> #hl-green[Add Roles and Features] में जाएं।
2. Features स्क्रीन तक 'Next' दबाएं।
3. सूची में खोजें: #mark-yellow[Windows Server Backup] चेकबॉक्स पर टिक करें।
4. 'Install' पर क्लिक करें। यह टूल GUI कंसोल (`wbadmin.msc`) और पावरफुल कमांड-लाइन यूटिलिटी (`wbadmin.exe`) दोनों प्रदान करता है।

#v(6pt)

=== 13.3 फुल सर्वर बैकअप बनाम सिस्टम स्टेट बैकअप (System State Backup)
- #text(weight: "bold", fill: rtech-navy)[बेयर मेटल रिकवरी (Bare Metal Recovery - BMR):] पूरे सर्वर (C: ड्राइव, सिस्टम पार्टिशन्स, एप्लीकेशंस और डेटा) का संपूर्ण बैकअप। यदि फिजिकल सर्वर हार्डवेयर पूरी तरह जल जाए, तो एक नए खाली सर्वर पर बूट डिस्क लगाकर हूबहू वही सर्वर वापस रीस्टोर किया जा सकता है।
- #text(weight: "bold", fill: rtech-blue)[सिस्टम स्टेट बैकअप (System State Backup):] एक्टिव डायरेक्टरी डोमेन कंट्रोलर के लिए यह सबसे महत्वपूर्ण बैकअप है। इसमें केवल वे घटक शामिल होते हैं जो डायरेक्टरी को जीवित रखने के लिए अनिवार्य हैं:
  1. #hl-yellow[Active Directory Database (`ntds.dit`)]
  2. #hl-green[SYSVOL शेयर्ड फोल्डर (सभी GPOs और स्क्रिप्ट्स)]
  3. #hl-orange[विंडोज सिस्टम रजिस्ट्री (System Registry)]
  4. #hl-green[बूट फाइल्स एवं सिस्टम स्टार्टअप फाइल्स]
  5. #hl-green[Certificate Services डेटाबेस (यदि AD CS इंस्टॉल हो)]

*कमांड-लाइन से सिस्टम स्टेट बैकअप लेने की मास्टर कमांड:*
```cmd
wbadmin start systemstatebackup -backupTarget:E: -quiet
```

#v(6pt)

=== 13.4 एक्टिव डायरेक्टरी रीसायकल बिन (AD Recycle Bin) को सक्षम करना
पुराने विंडोज सर्वर (2003/2008) में यदि किसी यूजर या OU को गलती से डिलीट कर दिया जाता था, तो उसे वापस पाने के लिए डोमेन कंट्रोलर को रीस्टार्ट करके #hl-orange[DSRM मोड (Directory Services Restore Mode)] में ले जाना पड़ता था, नेटवर्क डाउन करना पड़ता था, और `ntdsutil` से 'Authoritative Restore' करना पड़ता था (कम से कम 2 से 3 घंटे का डाउनटाइम)।

#mark-yellow[एक्टिव डायरेक्टरी रीसायकल बिन (AD Recycle Bin) एक अभूतपूर्व वरदान है जो आकस्मिक डिलीट हुए ऑब्जेक्ट्स को बिना सर्वर रीबूट किए, बिना किसी डाउनटाइम के, सिर्फ 1 क्लिक में लाइव रिस्टोर करने की सुविधा देता है!]

*रीसायकल बिन को सक्षम करने की आधिकारिक PowerShell कमांड:*
```powershell
Enable-ADOptionalFeature -Identity "Recycle Bin Feature" `
  -Scope ForestOrConfigurationSet -Target "corp.rtechlab.local"
```
#warning-box(title: "एकतरफा प्रक्रिया (Permanent Activation)")[
  एक बार जब आप एक्टिव डायरेक्टरी रीसायकल बिन को सक्षम कर देते हैं, तो इसे दोबारा कभी भी डिसेबल (अक्षम) नहीं किया जा सकता। यह एक स्थायी और अत्यधिक सुरक्षित अपग्रेड है।
]

#v(6pt)

=== 13.5 आकस्मिक डिलीट हुए यूजर एवं OU को 1-क्लिक में लाइव रिस्टोर करना
रीसायकल बिन सक्षम होने के बाद जब भी कोई यूजर डिलीट होता है, तो उसका डेटा नष्ट नहीं होता बल्कि वह #hl-yellow[`Deleted Objects`] कंटेनर में चला जाता है (डिफ़ॉल्ट जीवनकाल: #hl-green[180 दिन]):

1. Server Manager -> Tools -> #hl-green[Active Directory Administrative Center (ADAC)] खोलें (या रन में टाइप करें: #mark-green[`dsac.exe`])।
2. बाईं ओर अपने डोमेन `#text(weight: "bold")[corp (local)]` पर क्लिक करें।
3. स्क्रीन पर #mark-yellow[Deleted Objects] नाम का एक नया फोल्डर दिखाई देगा। उस पर डबल-क्लिक करें।
4. आपको वह डिलीट हुआ यूजर दिखेगा (उदा. `Rahul Patel`).
5. उस यूजर पर राइट-क्लिक करें और चुनें:
   - #hl-green[Restore:] यूजर ठीक उसी OU (`Corporate-Departments -> HR`) में वापस पहुंच जाएगा जहाँ वह पहले था!
   - #hl-yellow[Restore To...:] यदि मूल OU भी डिलीट हो चुका हो, तो आप किसी अन्य OU में उसे रीस्टोर कर सकते हैं।
6. *जादू:* यूजर का मूल पासवर्ड, उसकी सभी सिक्योरिटी ग्रुप सदस्यताएँ, और उसका आंतरिक SID 100% बरकरार रहता है! कर्मचारी तुरंत उसी पुराने पासवर्ड से लॉगिन कर सकता है।

#v(6pt)

=== 13.6 `wbadmin` कमांड-लाइन बैकअप शेड्यूलिंग एवं ऑटोमेशन
उत्पादन में एडमिनिस्ट्रेटर रोजाना रात 11:00 बजे स्वचालित बैकअप के लिए Windows Task Scheduler में स्क्रिप्ट लगाते हैं:

```cmd
:: डेली अनअटेंडेड सिस्टम स्टेट बैकअप स्क्रिप्ट
wbadmin enable backup -addtarget:{GUID-Storage-Drive} -schedule:23:00 -systemState -include:C:
```

#v(8pt)

// =============================================================================
// CHAPTER 13 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  जब एक्टिव डायरेक्टरी में कोई ऑब्जेक्ट डिलीट होता है और रीसायकल बिन ऑन न हो, तो वह पूरी तरह नहीं मिटता बल्कि एक भूतिया अवस्था में चला जाता है जिसे #hl-yellow['Tombstone'] (कब्र का पत्थर) कहा जाता है। टॉम्बस्टोन का डिफ़ॉल्ट जीवनकाल 180 दिन होता है, लेकिन इसमें ऑब्जेक्ट के अधिकांश एट्रीब्यूट्स (जैसे पासवर्ड, ग्रुप मेंबरशिप, फोन नंबर) स्ट्रिप (मिटा) दिए जाते हैं। AD Recycle Bin इसी समस्या को हल करके 100% एट्रीब्यूट्स को सुरक्षित रखता है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 13 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "एंटरप्राइज डेटा संरक्षण में प्रयुक्त '3-2-1 बैकअप नियम' के अनुसार डेटा की न्यूनतम कितनी स्वतंत्र कॉपियां होनी चाहिए?",
  optA: "केवल 1 कॉपी",
  optB: "कम से कम 2 कॉपियां",
  optC: "कम से कम 3 कॉपियां (1 प्रोडक्शन + 2 बैकअप)",
  optD: "10 कॉपियां",
  ans: "C",
  exp: "3-2-1 नियम के तहत 3 कॉपियां, 2 अलग-अलग मीडिया प्रकार, और 1 कॉपी ऑफसाइट अनिवार्य होती है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "एक्टिव डायरेक्टरी डोमेन कंट्रोलर के 'System State Backup' में निम्नलिखित में से कौन-सा घटक शामिल नहीं होता है?",
  optA: "Active Directory डेटाबेस (ntds.dit)",
  optB: "SYSVOL फोल्डर",
  optC: "सिस्टम रजिस्ट्री (Registry)",
  optD: "डी: ड्राइव पर रखी यूजर की पर्सनल वीडियो फाइल्स",
  ans: "D",
  exp: "सिस्टम स्टेट केवल ओएस और डायरेक्टरी घटकों का बैकअप लेता है, साधारण यूजर डेटा फाइलों का नहीं।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "एक्टिव डायरेक्टरी रीसायकल बिन सक्षम होने पर गलती से डिलीट हुए ऑब्जेक्ट्स डिफ़ॉल्ट रूप से कितने दिनों तक 'Deleted Objects' में सुरक्षित रहते हैं?",
  optA: "30 दिन",
  optB: "60 दिन",
  optC: "90 दिन",
  optD: "180 दिन (Deleted Object Lifetime)",
  ans: "D",
  exp: "माइक्रोसॉफ्ट द्वारा डिफ़ॉल्ट Deleted Object Lifetime 180 दिन निर्धारित होती है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "कमांड प्रॉम्प्ट से विंडोज सर्वर का तत्काल सिस्टम स्टेट बैकअप शुरू करने के लिए किस आधिकारिक उपयोगिता का उपयोग किया जाता है?",
  optA: "robocopy.exe",
  optB: "wbadmin.exe",
  optC: "ntdsutil.exe",
  optD: "dcdiag.exe",
  ans: "B",
  exp: "wbadmin start systemstatebackup कमांड सिस्टम स्टेट बैकअप प्रारंभ करने का आधिकारिक CLI टूल है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "डिलीट हुए यूजर को एक्टिव डायरेक्टरी रीसायकल बिन के जरिए 1 क्लिक में रिस्टोर करने के लिए किस ग्राफिकल टूल का उपयोग किया जाता है?",
  optA: "Active Directory Users and Computers (dsa.msc)",
  optB: "Active Directory Administrative Center (dsac.exe)",
  optC: "Group Policy Management Console (gpmc.msc)",
  optD: "Disk Management (diskmgmt.msc)",
  ans: "B",
  exp: "Active Directory Administrative Center (ADAC - dsac.exe) के अंदर 'Deleted Objects' कंटेनर उपलब्ध होता है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'Authoritative Restore और Non-Authoritative Restore में क्या अंतर होता है?'",
  a: "उत्तर: जब हम किसी बैकअप से डोमेन कंट्रोलर को रिस्टोर करते हैं, तो डिफ़ॉल्ट रूप से वह 'Non-Authoritative' होता है — अर्थात रिस्टोर होने के बाद वह नेटवर्क के अन्य DCs से संपर्क करता है और उनके पास मौजूद नवीनतम डेटाबेस से खुद को अपडेट कर लेता है। लेकिन यदि किसी ने पूरे डोमेन में से गलती से एक महत्वपूर्ण OU डिलीट कर दी हो, तो बैकअप से उस OU को 'Authoritative' मार्क किया जाता है (ntdsutil द्वारा USN नंबर बढ़ाकर)। इससे अन्य सभी DCs उस रिस्टोर किए गए ऑब्जेक्ट को नवीनतम मानकर अपने अंदर स्वीकार कर लेते हैं।",
  tip: "HCL, Infosys और TCS के L2/L3 डायरेक्टरी सर्विसेज इंटरव्यू का यह सबसे कठिन और निर्णायक सवाल है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'Active Directory Recycle Bin को सक्षम करने के बाद क्या किसी डिलीटेड यूजर का पासवर्ड रिसेट करना पड़ता है?'",
  a: "उत्तर: बिल्कुल नहीं! यही AD Recycle Bin की सबसे बड़ी ताकत है। जब यूजर को रिस्टोर किया जाता है, तो उसका पासवर्ड हैश, उसका मूल SID (Security Identifier), उसकी सभी सिक्योरिटी ग्रुप्स की सदस्यता, और उसके सभी 150+ एट्रीब्यूट्स 100% मूल स्थिति में वापस आते हैं। कर्मचारी बिना पासवर्ड बदले तुरंत लॉगिन कर सकता है।",
  tip: "यह उत्तर सिद्ध करता है कि आपको टूल के व्यावहारिक लाभ की गहन समझ है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'डेटा सेंटर में RTO और RPO का क्या अर्थ होता है?'",
  a: "उत्तर: RTO (Recovery Time Objective) वह अधिकतम स्वीकार्य समय है जिसके भीतर क्रैश के बाद सिस्टम को दोबारा चालू करना अनिवार्य होता है (उदा. 2 घंटे के भीतर)। RPO (Recovery Point Objective) वह अधिकतम स्वीकार्य डेटा हानि है जिसे कंपनी सहन कर सकती है (उदा. यदि रात 12:00 बजे बैकअप होता है और दोपहर 2:00 बजे क्रैश हुआ, तो 14 घंटे का RPO डेटा लॉस हुआ)। एडमिनिस्ट्रेटर का लक्ष्य RTO और RPO को न्यूनतम रखना होता है।",
  tip: "डिज़ास्टर रिकवरी और सर्विस लेवल एग्रीमेंट (SLA) का यह कोर फंडामेंटल प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'क्या हम एक्टिव डायरेक्टरी बैकअप को उसी ड्राइव पर सेव कर सकते हैं जिस पर C: विंडोज इंस्टॉल है?'",
  a: "उत्तर: नहीं, Windows Server Backup कभी भी सिस्टम स्टेट बैकअप को उसी वॉल्यूम (C:) पर स्टोर करने की अनुमति नहीं देता जिस पर ऑपरेटिंग सिस्टम खुद चल रहा हो। इसके लिए एक अलग समर्पित भौतिक/वर्चुअल डिस्क (उदा. E: ड्राइव या नेटवर्क शेयर) होना अनिवार्य है।",
  tip: "प्रैक्टिकल इंप्लीमेंटेशन और लैब एक्सपीरियंस चेक करने वाला यह सटीक प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'यदि Active Directory Recycle Bin फीचर को एक बार सक्षम कर दिया जाए, तो क्या इसे बाद में बंद किया जा सकता है?'",
  a: "उत्तर: नहीं, माइक्रोसॉफ्ट के आधिकारिक नियमों के अनुसार Recycle Bin फीचर का एक्टिवेशन एक 'एकतरफा स्थायी प्रक्रिया' (Irreversible Process) है। एक बार फ़ॉरेस्ट में सक्षम होने के बाद इसे कभी भी डिसेबल नहीं किया जा सकता।",
  tip: "माइक्रोसॉफ्ट सर्टिफिकेशन और टेक्निकल इंटरव्यूज का यह मानक बहुविकल्पीय तथ्य है।"
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ बैकअप एवं रिकवरी ट्रबलशूटिंग गाइड (Disaster Recovery Quick Guide):]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-rose)[एरर 1: 'The backup target volume is invalid':] विंडोज सर्वर कभी भी उसी C: ड्राइव पर बैकअप की अनुमति नहीं देता जिस पर OS हो; बैकअप के लिए हमेशा समर्पित E: ड्राइव या नेटवर्क शेयर का उपयोग करें।
      - #text(weight: "bold", fill: rtech-amber)[एरर 2: 'VSS Writer timed out (Event ID 8229)':] वॉल्यूम शैडो कॉपी सर्विस में किसी अन्य बैकअप एजेंट के टकराव के कारण होता है; `vssadmin list writers` चलाकर स्थिति जांचें।
      - #text(weight: "bold", fill: rtech-emerald)[एरर 3: 'Recycle Bin Deleted Objects फोल्डर नहीं दिख रहा':] Active Directory Administrative Center (ADAC) को बंद करके दोबारा खोलें या F5 दबाकर रीफ्रेश करें।
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ अध्याय 13 सत्यापन चेकलिस्ट (Disaster Recovery Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] Windows Server Backup फीचर और PowerShell मॉड्यूल सफलतापूर्वक इंस्टॉल हैं।
      - [ ] Active Directory Recycle Bin फीचर पूरे फ़ॉरेस्ट में स्थायी रूप से सक्षम है।
      - [ ] टेस्ट यूजर को डिलीट करके ADAC के 'Deleted Objects' से 1 क्लिक में लाइव रीस्टोर सत्यापित किया गया है।
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 13 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - 3-2-1 बैकअप सिद्धांत एंटरप्राइज डेटा सुरक्षा की अंतरराष्ट्रीय आधारशिला है।
      - System State Backup डोमेन कंट्रोलर के कोर घटकों (`ntds.dit`, `SYSVOL`, Registry) को सुरक्षित रखता है।
      - Active Directory Recycle Bin आकस्मिक विलोपन पर बिना सर्वर रीबूट के 1-क्लिक लाइव रिकवरी प्रदान करता है।
    ]
  ]
)

#pagebreak()

