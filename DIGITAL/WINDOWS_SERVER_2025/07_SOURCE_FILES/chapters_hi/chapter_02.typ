// =============================================================================
// CHAPTER 02: ENTERPRISE LAB SETUP & WINDOWS SERVER 2025 INSTALLATION
// =============================================================================

[#metadata("ch2") <chapter-2>]

#chapter-header(
  chapter-num: "CHAPTER 02",
  category: "भाग 2 : वर्चुअल लैब निर्माण (Hands-On Lab Setup)",
  title: "प्रैक्टिकल लैब सेटअप: Windows Server 2025 ISO एवं VM कॉन्फ़िगरेशन",
  subtitle: "सिस्टम आवश्यकताएं · आइसोलेटेड नेटवर्क टोपोलॉजी · Microsoft Evaluation Center · VirtualBox VM निर्माण · Desktop Experience vs Core"
)

#v(6pt)

=== 2.1 होम लैब की आवश्यकताएं (System & Hardware Requirements)
विंडोज सर्वर सीखने के लिए आपको किसी महंगे फिजिकल सर्वर रैक की आवश्यकता नहीं है। आप अपने सामान्य लैपटॉप या डेस्कटॉप पर #hl-yellow[टाइप-2 हाइपरवाइजर (Type-2 Hypervisor)] का उपयोग करके एक संपूर्ण एंटरप्राइज लैब तैयार कर सकते हैं।

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "न्यूनतम हार्डवेयर (Minimum Specs)")[
      - #text(weight: "bold")[CPU:] 64-बिट 1.4 GHz प्रोसेसर (VT-x/AMD-V सक्षम)।
      - #text(weight: "bold")[RAM:] कम से कम #hl-orange[8 GB RAM] (ताकि होस्ट OS और 1 Server VM सुचारू चल सकें)।
      - #text(weight: "bold")[Storage:] कम से कम 60 GB खाली SSD स्पेस।
    ]
  ],
  [
    #info-box(title: "अनुशंसित हार्डवेयर (Recommended Specs)")[
      - #text(weight: "bold")[CPU:] 4-कोर / 8-थ्रेड आधुनिक प्रोसेसर (i5/i7 या Ryzen 5)।
      - #text(weight: "bold")[RAM:] #hl-green[16 GB या 32 GB RAM] (1 DC Server + 1 Client PC + 1 ADC Server एक साथ चलाने के लिए)।
      - #text(weight: "bold")[Storage:] NVMe SSD (तेज बूट व स्नैपशॉट के लिए)।
    ]
  ]
)

#v(4pt)

#warning-box(title: "BIOS / UEFI में वर्चुअलाइजेशन सक्षम करें (Virtualization Error Fix)")[
  यदि वर्चुअल मशीन बनाते समय 'VT-x/AMD-V is not available' का एरर आए, तो अपने लैपटॉप को रीस्टार्ट करके BIOS/UEFI सेटिंग्स (F2 / F10 / Del) में जाएं और #hl-orange['Intel Virtualization Technology' या 'AMD-SVM'] को #hl-green[Enabled] करें।
]

#v(6pt)

=== 2.2 लैब टोपोलॉजी एवं नेटवर्क आर्किटेक्चर (Isolated Virtual Network)
हमारे होम लैब में दो मुख्य वर्चुअल मशीनें होंगी जो एक सुरक्षित आइसोलेटेड वर्चुअल नेटवर्क पर आपस में संवाद करेंगी:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 2.1: छात्र होम लैब टोपोलॉजी — फिजिकल होस्ट, आइसोलेटेड वर्चुअल स्विच, डोमेन कंट्रोलर एवं क्लाइंट वर्कस्टेशन]
]

#v(4pt)

- #text(weight: "bold", fill: rtech-blue)[VM 1 (Primary DC - `SRV-2025-DC01`):] यह हमारी मुख्य डोमेन कंट्रोलर मशीन होगी जिस पर Windows Server 2025 Datacenter इंस्टॉल होगा। इसमें AD DS, DNS, DHCP और फाइल सर्वर रोल्स चलेंगे।
- #text(weight: "bold", fill: rtech-emerald)[VM 2 (Client PC - `CLT-WIN11-01`):] यह हमारे कर्मचारी की वर्कस्टेशन मशीन होगी जिस पर Windows 10 या 11 Pro चलेगा और जिसे हम डोमेन से जोड़ेंगे।

#v(6pt)

=== 2.3 आधिकारिक Windows Server 2025 ISO कैसे डाउनलोड करें? (Microsoft Evaluation Center)
माइक्रोसॉफ्ट छात्रों और आईटी प्रोफेशनल्स को सीखने के लिए 180 दिनों का निःशुल्क पूर्ण-सुविधा युक्त ट्रायल प्रदान करता है:

1. अपने ब्राउज़र में जाएं: #hl-green[`https://www.microsoft.com/en-us/evalcenter/download-windows-server-2025`]।
2. #text(weight: "bold")[Download the ISO] विकल्प चुनें और अपना सामान्य नाम व ईमेल दर्ज करें।
3. भाषा में #hl-yellow['English (United States)'] चुनें और 64-बिट एडिशन ISO फाइल (आकार: लगभग 5.2 GB) डाउनलोड करें।

#pro-tip(title: "180-Day Trial Re-arm Command")[
  180 दिनों का ट्रायल समाप्त होने पर आप कमांड प्रॉम्प्ट में #hl-green[`slmgr.vbs /rearm`] चलाकर इसे 5 बार तक रीसेट (अधिकतम 3 वर्ष तक वैध) कर सकते हैं!
]

#v(6pt)

=== 2.4 वर्चुअल मशीन निर्माण चरण (Step-by-Step VM Creation in VirtualBox)
#step-screenshot(
  step-num: "चरण 1",
  title: "VirtualBox में नई वर्चुअल मशीन का विनिर्देश (Specifications) तय करना",
  img-path: "../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png",
  caption: "VM Name: SRV-2025-DC01 | Type: Microsoft Windows | Version: Windows 2025 (64-bit)"
)

1. VirtualBox खोलें और #hl-green['New'] बटन पर क्लिक करें।
2. Name में लिखें: #hl-yellow[`SRV-2025-DC01`]। Type में #hl-yellow[`Microsoft Windows`] और Version में #hl-yellow[`Windows 2025 (64-bit)`] चुनें।
3. #text(weight: "bold")[Memory (RAM):] स्लाइडर को कम से कम #hl-green[4096 MB (4 GB)] पर सेट करें। Processors में #hl-green[2 vCPUs] आवंटित करें।
4. #text(weight: "bold")[Virtual Hard Disk:] 'Create a Virtual Hard Disk Now' चुनें। आकार: #hl-yellow[60.00 GB] (Dynamically Allocated) रखें ताकि आपकी असली हार्ड डिस्क का स्पेस तभी खर्च हो जब VM में डेटा लिखा जाए।
5. #text(weight: "bold")[Network Settings:] VM की Settings -> Network में जाएं और Attached to में #hl-orange['Internal Network' या 'NAT Network'] चुनें ताकि आपकी लैब आपके घरेलू वाई-फाई नेटवर्क से सुरक्षित रूप से अलग रहे।

#v(6pt)

=== 2.5 Windows Server 2025 इंस्टॉलेशन प्रक्रिया (Full Wizard Walkthrough)
1. वर्चुअल मशीन को स्टार्ट करें। स्क्रीन पर 'Press any key to boot from CD or DVD...' दिखे तो तुरंत #hl-green[Enter] दबाएं।
2. भाषा चयन विंडो में Language: #hl-yellow[English (United States)], Time & Currency Format: #hl-yellow[English (India)] और Keyboard: #hl-yellow[US] चुनकर 'Next' दबाएं।
3. अगली स्क्रीन पर #hl-green['Install Now'] पर क्लिक करें।
4. 'Activate Windows' स्क्रीन पर लाइसेंस की मांगने पर नीचे स्थित #hl-yellow['I don't have a product key'] लिंक पर क्लिक करें।

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_setup_os_selection.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 2.2: ऑपरेटिंग सिस्टम संस्करण चयन — 'Windows Server 2025 Datacenter (Desktop Experience)' का अनिवार्य चयन]
]

#v(4pt)

#warning-box(title: "सबसे गंभीर गलती से बचें: #hl-yellow[Server Core] vs Desktop Experience")[
  विज़ार्ड में 4 विकल्प दिखते हैं। यदि आपने गलती से केवल 'Windows Server 2025 Datacenter' चुन लिया (बिना ब्रैकेट वाले नाम), तो #hl-orange[Server Core (केवल ब्लैक कमांड प्रॉम्प्ट)] इंस्टॉल हो जाएगा और कोई डेस्कटॉप या माउस नहीं मिलेगा! हमेशा #mark-green[Windows Server 2025 Datacenter (Desktop Experience)] ही चुनें जिसमें पूर्ण ग्राफिकल इंटरफ़ेस और #hl-yellow[सर्वर मैनेजर] शामिल होता है।
]

#v(6pt)

5. लाइसेंस नियमों को स्वीकार (Accept License Terms) करके 'Next' दबाएं।
6. इंस्टॉलेशन प्रकार में #hl-yellow['Custom: Install Windows Server only (advanced)'] चुनें।
7. डिस्क विभाजन स्क्रीन पर 'Drive 0 Unallocated Space (60.0 GB)' को चुनें और सीधे #hl-green['Next'] पर क्लिक करें। विंडोज स्वचालित रूप से आवश्यक EFI और रिकवरी पार्टिशन्स बना देगा।
8. इंस्टॉलेशन की प्रगति 0% से 100% तक चलेगी और सिस्टम स्वतः रीबूट होगा।

#v(6pt)

=== 2.6 प्रथम बूट एवं एडमिनिस्ट्रेटर पासवर्ड सेटअप (First Boot Configuration)
रीबूट होने के बाद स्क्रीन पर #hl-yellow['Customize settings'] विंडो खुलेगी जिसमें लोकल एडमिनिस्ट्रेटर का पासवर्ड सेट करना अनिवार्य होगा:

- #text(weight: "bold")[User name:] `Administrator` (डिफ़ॉल्ट रूप से लॉक होता है)।
- #text(weight: "bold")[Password:] विंडोज सर्वर जटिल पासवर्ड (Complex Password) की मांग करता है जिसमें कैपिटल अक्षर, स्मॉल अक्षर, अंक और स्पेशल कैरेक्टर होने चाहिए। उदाहरण के लिए: #hl-green[`P@ssw0rd2025!`] या #hl-green[`Rtechlab@2025`]।
- पासवर्ड की पुष्टि करें और #hl-green['Finish'] पर क्लिक करें।
- स्क्रीन पर लॉक स्क्रीन दिखेगी। वर्चुअल मशीन में लॉगिन करने के लिए VirtualBox के मेनू में जाएं: #hl-yellow[Input -> Keyboard -> Insert Ctrl+Alt+Del] दबाएं और अपना बनाया हुआ पासवर्ड डालकर लॉगिन करें।
- लॉगिन होते ही स्क्रीन पर #mark-yellow[Server Manager Dashboard] स्वतः खुल जाएगा!

#v(8pt)

// =============================================================================
// CHAPTER 02 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  माइक्रोसॉफ्ट के अनुसार उत्पादन वातावरण (Production Datacenters) में चलने वाले 70% से अधिक विंडोज सर्वर्स बिना किसी GUI के #hl-yellow[Server Core] मोड में चलाए जाते हैं। #hl-yellow[Server Core] में GUI न होने के कारण रैम की खपत 60% कम हो जाती है, डिस्क स्पेस केवल 10 GB लगता है, और सबसे महत्वपूर्ण: अटैकर के लिए कोई ग्राफिकल एक्सप्लॉइट उपलब्ध नहीं होता जिससे सर्वर पर सुरक्षा पैच लगाने की आवृत्ति 50% तक घट जाती है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 02 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "माइक्रोसॉफ्ट इवैल्यूएशन सेंटर से डाउनलोड किए गए Windows Server 2025 ट्रायल की आधिकारिक वैधता कितनी होती है?",
  optA: "30 दिन",
  optB: "90 दिन",
  optC: "180 दिन",
  optD: "365 दिन",
  ans: "C",
  exp: "विंडोज सर्वर इवैल्यूएशन एडिशन 180 दिनों के पूर्ण-सुविधा युक्त आधिकारिक मूल्यांकन लाइसेंस के साथ आता है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "Windows Server 2025 में पूर्ण ग्राफिकल डेस्कटॉप और #hl-yellow[सर्वर मैनेजर] पाने के लिए इंस्टॉलेशन के समय किस विकल्प का चयन करना अनिवार्य है?",
  optA: "#hl-yellow[Server Core] Edition",
  optB: "Desktop Experience",
  optC: "Nano Server Edition",
  optD: "Hyper-V Server Edition",
  ans: "B",
  exp: "विंडोज सर्वर में GUI इंटरफ़ेस को 'Desktop Experience' कहा जाता है; अन्य विकल्प कमांड लाइन (CLI) स्थापित करते हैं।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "वर्चुअल मशीन में होस्ट कंप्यूटर के कीबोर्ड शॉर्टकट के टकराव से बचने के लिए Ctrl+Alt+Del भेजने का सही तरीका क्या है?",
  optA: "कीबोर्ड पर सीधा Ctrl+Alt+Del दबाना",
  optB: "VirtualBox Input मेनू -> Keyboard -> Insert Ctrl+Alt+Del",
  optC: "कमांड प्रॉम्प्ट में exit टाइप करना",
  optD: "कंप्यूटर का पावर बटन दबाना",
  ans: "B",
  exp: "होस्ट कीबोर्ड पर सीधा Ctrl+Alt+Del दबाने से होस्ट का टास्क मैनेजर खुल जाएगा; VM के लिए मेनू से इंसर्ट करना होता है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Windows Server 2025 की 180-दिन की इवैल्यूएशन अवधि को रीसेट (re-arm) करने के लिए किस आधिकारिक कमांड का उपयोग किया जाता है?",
  optA: "net stop license",
  optB: "slmgr.vbs /rearm",
  optC: "gpupdate /force",
  optD: "dism /online /enable-feature",
  ans: "B",
  exp: "slmgr.vbs /rearm कमांड लाइसेंसिंग ग्रेस पीरियड को दोबारा 180 दिनों के लिए रीसेट कर देता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "वर्चुअल लैब में होस्ट मशीन और अन्य फिजिकल नेटवर्क से सुरक्षा पृथक्करण (Isolation) के लिए वर्चुअल नेटवर्क का कौन-सा मोड अनुशंसित है?",
  optA: "Bridged Adapter",
  optB: "Internal Network / Host-Only",
  optC: "Direct Cloud Uplink",
  optD: "Promiscuous Mode All",
  ans: "B",
  exp: "Internal Network मोड VM को होम वाई-फाई के डीएचसीपी और अन्य मशीनों से अलग सुरक्षित लैब वातावरण प्रदान करता है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'एंटरप्राइज प्रोडक्शन में सर्वर डिप्लॉय करते समय #hl-yellow[Server Core] और Desktop Experience में से आप किसे प्राथमिकता देंगे और क्यों?'",
  a: "उत्तर: प्रोडक्शन में हम हमेशा '#hl-yellow[Server Core]' को प्राथमिकता देंगे क्योंकि यह सिस्टम का अटैक सरफेस (Attack Surface) घटा देता है, रीबूट की आवश्यकता कम करता है और हार्डवेयर संसाधनों (RAM/CPU) की बचत करता है। मैनेजमेंट के लिए हम रिमोट टूल्स जैसे RSAT, PowerShell remoting या Windows Admin Center का उपयोग करते हैं।",
  tip: "यह उत्तर दर्शाता है कि आप केवल किताबी छात्र नहीं हैं, बल्कि एंटरप्राइज सिक्योरिटी की गहरी समझ रखते हैं।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'Windows Server 2025 इंस्टॉलेशन के लिए न्यूनतम डिस्क स्पेस और रैम की आधिकारिक आवश्यकता क्या है?'",
  a: "उत्तर: न्यूनतम आधिकारिक आवश्यकता 512 MB रैम (#hl-yellow[Server Core] के लिए) या 2 GB रैम (Desktop Experience के लिए), 1.4 GHz 64-बिट प्रोसेसर, और न्यूनतम 32 GB स्टोरेज स्पेस है। हालांकि उत्पादन में Active Directory और रोल्स के सुचारू संचालन के लिए कम से कम 4 GB रैम और 60 GB SSD अनुशंसित है।",
  tip: "TCS और Cognizant के इंफ्रास्ट्रक्चर सपोर्ट इंटरव्यू में यह बेसिक स्पेसिफिकेशन पूछा जाता है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'Dynamically Allocated Virtual Disk और Fixed Size Virtual Disk में क्या अंतर होता है, और प्रोडक्शन में किसे चुना जाता है?'",
  a: "उत्तर: Dynamically Allocated डिस्क शुरुआत में बहुत कम स्पेस लेती है और जैसे-जैसे डेटा बढ़ता है, वैसे-वैसे फाइल का साइज बढ़ता है (यह होम लैब के लिए बेस्ट है)। लेकिन प्रोडक्शन एंटरप्राइज (Hyper-V / VMware) में हमेशा 'Fixed Size' चुनी जाती है क्योंकि इसमें डिस्क फ्रैग्मेंटेशन नहीं होता और I/O थ्रूपुट अत्यधिक उच्च रहता है।",
  tip: "स्टोरेज और वर्चुअलाइजेशन टीम के टेक्निकल इंटरव्यू में यह प्रश्न बार-बार दोहराया जाता है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'यदि Windows Server 2025 का 180-दिन का इवैल्यूएशन पीरियड समाप्त हो जाए, तो क्या सिस्टम तुरंत बंद हो जाता है?'",
  a: "उत्तर: ट्रायल समाप्त होने पर सर्वर अचानक बंद नहीं होता, बल्कि हर 1 घंटे में सिस्टम ऑटोमैटिक शटडाउन होने लगता है और स्क्रीन के कोने में लाइसेंस एक्सपायरी का वाटरमार्क आ जाता है। इसे slmgr.vbs /rearm कमांड चलाकर 5 बार तक रीसेट (अधिकतम 3 वर्ष) किया जा सकता है।",
  tip: "सिस्टम सपोर्ट और ट्रबलशूटिंग रोल्स में लाइसेंस एक्सपायरी बिहेवियर की जानकारी परखी जाती है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'VirtualBox या Hyper-V में Guest Additions / Integration Services इंस्टॉल करना क्यों अनिवार्य माना जाता है?'",
  a: "उत्तर: Guest Additions (VirtualBox) या Integration Services (Hyper-V) वर्चुअल मशीन के लिए विशेष कर्नेल ड्राइवर्स प्रदान करते हैं। इसके बिना VM में ऑटोमैटिक स्क्रीन रिसाइज़िंग (1080p), होस्ट और गेस्ट के बीच क्लिपबोर्ड शेयरिंग (Copy-Paste), स्मूथ माउस पॉइंटर इंटीग्रेशन, और बेहतर नेटवर्क I/O परफॉर्मेंस संभव नहीं होती।",
  tip: "लैब मैनेजमेंट और वर्चुअलाइजेशन सपोर्ट के प्रैक्टिकल राउंड में यह ज्ञान परखा जाता है।"
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ होम लैब ट्रबलशूटिंग गाइड: 4 सामान्य VM समस्याएं एवं त्वरित समाधान]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-rose)[समस्या 1: 'VT-x / AMD-V is not available':] अपने फिजिकल पीसी को रीस्टार्ट करें, BIOS/UEFI में जाएं और Intel Virtualization Technology को Enable करें।
      - #text(weight: "bold", fill: rtech-amber)[समस्या 2: 'Ctrl+Alt+Del VM में काम नहीं कर रहा':] फिजिकल कीबोर्ड पर दबाने के बजाय VirtualBox के शीर्ष मेनू 'Input -> Keyboard -> Insert Ctrl+Alt+Del' का उपयोग करें।
      - #text(weight: "bold", fill: rtech-blue)[समस्या 3: 'गलती से Server Core इंस्टॉल हो गया (कोई डेस्कटॉप नहीं)':] ISO विज़ार्ड में दोबारा जाएं और 'Desktop Experience' वाले विकल्प को चुनकर फ्रेश इंस्टॉल करें।
      - #text(weight: "bold", fill: rtech-emerald)[समस्या 4: 'स्क्रीन रेजोल्यूशन 1024x768 पर अटका है':] VirtualBox मेनू में 'Devices -> Insert Guest Additions CD Image' चलाएं और VM के अंदर `VBoxWindowsAdditions.exe` रन करके रीबूट करें।
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ लैब 02 सत्यापन चेकलिस्ट (Verification Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] वर्चुअल मशीन `SRV-2025-DC01` सफलतापूर्वक बूट हो चुकी है।
      - [ ] लोकल `Administrator` का कॉम्प्लेक्स पासवर्ड सुरक्षित नोट कर लिया गया है।
      - [ ] लॉगिन के बाद #hl-yellow[Server Manager] Dashboard स्क्रीन पर बिना किसी एरर के प्रदर्शित हो रहा है।
    ]
  ]
)

#pagebreak()

