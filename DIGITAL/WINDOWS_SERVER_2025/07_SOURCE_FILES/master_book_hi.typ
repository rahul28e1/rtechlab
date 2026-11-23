#import "../07_PUBLISHING_ENGINE/server-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-server.typ": rtech-server-cover

// Set up the Master Book Wrapper
#show: rtech-server-book.with(
  title: "Windows Server 2025 & Active Directory Master Handbook",
  subtitle: "क्लाइंट-सर्वर आर्किटेक्चर · AD DS डोमेन कंट्रोलर · ग्रुप पॉलिसी (GPO) · DNS एवं DHCP · स्टोरेज स्पेसेस · हाइब्रिड अज़ूर आर्क · टॉप 50 MNC प्लेसमेंट वॉल्ट",
  author: "राहुल पटेल (Rahul Patel)",
  edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1 (Server 2025 Flagship)",
  subject-code: "RTL-2027-WINSRV-ED1",
  lang: "hi"
)

// =============================================================================
// PAGE 01: OFFICIAL MASTER COVER PAGE
// =============================================================================
#rtech-server-cover()

#pagebreak()


// =============================================================================
// PAGE 02: DEDICATION, AUTHOR WELCOME & ACADEMIC MISSION
// =============================================================================
#align(center)[
  #v(10pt)
  #text(size: 20pt, weight: "black", fill: rtech-navy)[RTechLab Systems & Infrastructure Academy]
  #v(3pt)
  #text(size: 10pt, weight: "bold", fill: rtech-blue)[Universal Technical Education · Hardware to Enterprise Cloud]
  #v(8pt)
  #line(length: 60%, stroke: 1pt + rgb("#0284C7"))
]

#v(10pt)

#grid(
  columns: (auto, 1fr),
  gutter: 14pt,
  align: (top, left),
  [
    #block(
      stroke: 1.5pt + rtech-blue,
      radius: 6pt,
      clip: true,
      [
        #image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 38mm)
      ]
    )
    #v(3pt)
    #align(center)[
      #text(size: 8pt, weight: "bold", fill: rtech-navy)[राहुल पटेल (Rahul Patel)]\
      #text(size: 6.8pt, fill: rtech-muted)[चीफ टेक्नोलॉजी आर्किटेक्ट\
      फाउंडर, RTechLab Publications]
    ]
  ],
  [
    #text(size: 11pt, weight: "black", fill: rtech-navy)[प्रिय छात्र एवं भावी सिस्टम एडमिनिस्ट्रेटर,]
    
    #v(4pt)
    #text(size: 8.8pt, fill: rtech-text)[
      आज दुनिया का शायद ही कोई ऐसा बैंक, बहुराष्ट्रीय कंपनी (MNC), हॉस्पिटल, या सरकारी डाटा सेंटर होगा जो #hl-yellow[Microsoft Active Directory] और #hl-yellow[Windows Server] के बिना संचालित हो सकता हो। जब आप Cisco CCNA में नेटवर्किंग की नींव (Routing, Switching, IP Subnetting) समझ लेते हैं, तब कॉर्पोरेट इंफ्रास्ट्रक्चर की वास्तविक दुनिया में प्रवेश करने के लिए सर्वर-साइड एडमिनिस्ट्रेशन सीखना सबसे अनिवार्य अगला कदम होता है।

      इंटरनेट पर विंडोज सर्वर की अधिकांश सामग्री पुरानी हो चुकी है (Windows Server 2008/2012 के पुराने इंटरफ़ेस)। इस पुस्तक को बनाने का हमारा एकमात्र उद्देश्य यह है कि भारत का प्रत्येक छात्र अपने लैपटॉप पर #hl-green[Windows Server 2025] का आधुनिक एंटरप्राइज एनवायरनमेंट खुद सेटअप कर सके और बिना किसी ₹40,000 की महंगी कोचिंग के, एक अनुभवी L1/L2 सिस्टम एडमिनिस्ट्रेटर के स्तर का आत्मविश्वास हासिल कर सके।

      इस गाइड में हमने प्रत्येक प्रैक्टिकल लैब को #hl-orange[स्टेप-बाय-स्टेप स्क्रीनशॉट्स], 3-कलर स्टडी हाइलाइटर्स, रियल-वर्ल्ड चेतावनियों और टॉप 50 MNC प्लेसमेंट प्रश्नों के साथ संजोया है। पढ़िए, अपने हाथों से लैब बनाइए, और अपने करियर को एक नई ऊंचाई दीजिए!
    ]
    #v(6pt)
    #align(right)[
      #text(size: 9pt, weight: "black", fill: rtech-navy)[— राहुल पटेल (Founder & Lead Author)]\
      #text(size: 7.5pt, font: ("Consolas", "Courier New"), fill: rtech-blue)[rahul.28e1\@gmail.com · Helpline: +91 76468 92094]
    ]
  ]
)

#v(10pt)

#info-box(title: "इस मास्टर हैंडबुक की 5 अद्वितीय विशेषताएं (Why This Book Guarantees Success)")[
  - #text(weight: "bold")[1. 100% ओरिजिनल 2025 स्क्रीनशॉट्स:] सर्वर मैनेजर, एक्टिव डायरेक्टरी और ग्रुप पॉलिसी के वास्तविक विज़ार्ड क्लिक्स।
  - #text(weight: "bold")[2. 3-कलर स्टडी हाइलाइटर सिस्टम:] #hl-yellow[पीला (कोर सिद्धांत)], #hl-orange[नारंगी (सुरक्षा नियम व चेतावनियां)], और #hl-green[हरा (कमांड्स व क्लिक स्टेप्स)]।
  - #text(weight: "bold")[3. क्लिकेबल इंटरैक्टिव इंडेक्स:] इंडेक्स में किसी भी अध्याय पर टैप करते ही बिना स्क्रॉल किए सीधे उसी पेज पर पहुंचें।
  - #text(weight: "bold")[4. प्रत्येक अध्याय के अंत मेंDid You Know व MCQs:] सेमेस्टर परीक्षा व कॉर्पोरेट असेसमेंट टेस्ट की 100% तैयारी।
  - #text(weight: "bold")[5. टॉप 50 MNC प्लेसमेंट वॉल्ट:] Wipro, TCS, Infosys, Cognizant के टेक्निकल इंटरव्यू राउंड्स के वास्तविक प्रश्नोत्तर।
]

#pagebreak()


// =============================================================================
// PAGE 03: CLICKABLE INTERACTIVE TABLE OF CONTENTS (विषय सूची)
// =============================================================================
#label("table-of-contents")

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 3pt),
    text(size: 8pt, weight: "bold", fill: rtech-blue)[सटीक एवं व्यवस्थित अध्ययन पाठ्यक्रम]
  )
  #v(4pt)
  #text(size: 20pt, weight: "black", fill: rtech-navy)[इंटरैक्टिव विषय सूची (Table of Contents)]
  #v(2pt)
  #text(size: 8.5pt, fill: rtech-muted)[(किसी भी अध्याय पर क्लिक करें — आपका फोन या लैपटॉप सीधे उस पेज पर ले जाएगा)]
  #v(6pt)
  #line(length: 100%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(8pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#CBD5E1"),
  radius: 6pt,
  fill: rgb("#F8FAFC"),
  inset: 10pt,
  [
    #grid(
      columns: (1fr, auto),
      row-gutter: 9pt,
      align: (left, right),
      
      [#link(<chapter-1>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 01: सर्वर आर्किटेक्चर, सर्वर के प्रकार एवं विंडोज सर्वर का इतिहास]] \
       #text(size: 7.5pt, fill: rtech-muted)[क्लाइंट-सर्वर मॉडल · 8 प्रमुख सर्वर प्रकार · क्लाउड व अज़ूर आर्क · 1993 से 2025 का इतिहास · क्लाइंट OS vs सर्वर OS]],
      [#link(<chapter-1>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 04 →]]],

      [#link(<chapter-2>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 02: प्रैक्टिकल लैब सेटअप: Windows Server 2025 ISO एवं VM कॉन्फ़िगरेशन]] \
       #text(size: 7.5pt, fill: rtech-muted)[फिजिकल vs वर्चुअल मशीन · माइक्रोसॉफ्ट इवैल्यूएशन सेंटर ISO डाउनलोड · VirtualBox / Hyper-V VM निर्माण · इंस्टॉलेशन विज़ार्ड]],
      [#link(<chapter-2>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 11 →]]],

      [#link(<chapter-3>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 03: पोस्ट-इंस्टॉलेशन कॉन्फ़िगरेशन एवं सर्वर हार्डनिंग (Hardening & Initial Setup)]] \
       #text(size: 7.5pt, fill: rtech-muted)[सर्वर मैनेजर डैशबोर्ड · कंप्यूटर नामकरण (`SRV-DC01`) · स्टैटिक IP असाइनमेंट · रिमोट डेस्कटॉप (RDP) एवं फायरवॉल नियम]],
      [#link(<chapter-3>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 17 →]]],

      [#link(<chapter-4>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 04: एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) एवं डोमेन कंट्रोलर प्रमोशन]] \
       #text(size: 7.5pt, fill: rtech-muted)[Add Roles & Features · डोमेन कंट्रोलर प्रमोशन विज़ार्ड · रूट फ़ॉरेस्ट (`corp.rtechlab.local`) · DSRM पासवर्ड · FSMO 5 रोल्स]],
      [#link(<chapter-4>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 23 →]]],

      [#link(<chapter-5>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 05: ADUC कंसोल: OUs, डोमेन यूजर्स एवं सिक्योरिटी ग्रुप्स का प्रबंधन]] \
       #text(size: 7.5pt, fill: rtech-muted)[ADUC (`dsa.msc`) · डिपार्टमेंटल OU संरचना · नए यूजर अकाउंट्स · पासवर्ड नीतियां · सिक्योरिटी vs डिस्ट्रीब्यूशन ग्रुप्स]],
      [#link(<chapter-5>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 31 →]]],

      [#link(<chapter-6>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 06: क्लाइंट मशीन (Windows 10/11) को डोमेन से जोड़ना (Domain Join Walkthrough)]] \
       #text(size: 7.5pt, fill: rtech-muted)[क्लाइंट DNS आईपी मैपिंग · वर्कग्रुप से डोमेन में परिवर्तन · डोमेन एडमिन ऑथेंटिकेशन · डोमेन यूजर से लॉगिन सत्यापन]],
      [#link(<chapter-6>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 37 →]]],

      [#link(<chapter-7>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 07: ग्रुप पॉलिसी ऑब्जेक्ट्स (GPO): एंटरप्राइज सुरक्षा एवं डेस्कटॉप नियंत्रण]] \
       #text(size: 7.5pt, fill: rtech-muted)[GPMC कंसोल · LSDOU प्रोसेसिंग क्रम · डोमेन पासवर्ड पॉलिसी · पेनड्राइव/USB ब्लॉक GPO · डेस्कटॉप वॉलपेपर · `gpupdate /force`]],
      [#link(<chapter-7>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 43 →]]],

      [#link(<chapter-8>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 08: DHCP सर्वर कॉन्फ़िगरेशन: स्कोप, एक्सक्लूज़न, रिज़र्वेशन एवं फेलओवर]] \
       #text(size: 7.5pt, fill: rtech-muted)[DORA 4-स्टेप प्रक्रिया · AD ऑथराइजेशन · IPv4 स्कोप निर्माण · एक्सक्लूज़न रेंज · MAC रिज़र्वेशन · 80/20 फेलओवर क्लस्टर]],
      [#link(<chapter-8>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 51 →]]],

      [#link(<chapter-9>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 09: DNS सर्वर आर्किटेक्चर: फ़ॉरवर्ड/रिवर्स ज़ोन, रिकॉर्ड्स एवं स्कैवेंजिंग]] \
       #text(size: 7.5pt, fill: rtech-muted)[DNS मैनेजर · फ़ॉरवर्ड vs रिवर्स लुकअप · A, PTR, CNAME, MX रिकॉर्ड्स · रूट हिंट्स एवं फॉरवर्डर्स · DNS स्कैवेंजिंग]],
      [#link(<chapter-9>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 58 →]]],

      [#link(<chapter-10>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 10: फाइल सर्वर रिसोर्स मैनेजर (FSRM), NTFS अनुमतियां एवं कोटा प्रबंधन]] \
       #text(size: 7.5pt, fill: rtech-muted)[शेयर्ड फ़ोल्डर्स · शेयर vs NTFS अनुमतियां (इफेक्टिव फॉर्मूला) · FSRM इंस्टॉलेशन · कोटा लिमिट्स · फाइल स्क्रीनिंग (MP3/EXE ब्लॉक)]],
      [#link(<chapter-10>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 65 →]]],

      [#link(<chapter-11>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 11: बैकअप, डिज़ास्टर रिकवरी एवं एक्टिव डायरेक्टरी रीसायकल बिन]] \
       #text(size: 7.5pt, fill: rtech-muted)[विंडोज सर्वर बैकअप टूल · फुल बैकअप vs सिस्टम स्टेट बैकअप · AD रीसायकल बिन सक्षम करना · डिलीटेड यूजर की तत्काल पुनर्प्राप्ति]],
      [#link(<chapter-11>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 73 →]]],

      [#link(<chapter-12>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 12: टॉप 50 MNC सिस्टम एडमिनिस्ट्रेटर प्लेसमेंट वॉल्ट एवं राहुल सर की शुभकामनाएं]] \
       #text(size: 7.5pt, fill: rtech-muted)[Wipro, Infosys, TCS, HCL के 50 वास्तविक L1/L2 इंटरव्यू परिदृश्य एवं मॉडल उत्तर · सैलरी ब्लूप्रिंट · लेखक की अंतिम शुभकामनाएं]],
      [#link(<chapter-12>)[#text(size: 9pt, weight: "black", fill: rtech-blue)[पेज 79 →]]]
    )
  ]
)

#v(8pt)
#pro-tip(title: "स्मार्ट नेविगेशन तकनीक")[
  इस पूरी PDF के हर पेज के हेडर में दाईं ओर #text(weight: "bold", fill: rtech-blue)[⮌ Index (विषय सूची)] का लिंक मौजूद है। आप किसी भी पेज पर हों, सिर्फ एक क्लिक में तुरंत वापस इस विषय सूची पर आ सकते हैं!
]

#pagebreak()


// =============================================================================
// CHAPTER 01: INTRODUCTION, ARCHITECTURE, TYPES & EVOLUTION
// =============================================================================
#label("chapter-1")

#block(
  width: 100%,
  stroke: (bottom: 2pt + rtech-blue),
  inset: (bottom: 6pt),
  [
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #text(size: 8pt, font: ("JetBrains Mono", "Consolas"), weight: "bold", fill: rtech-blue)[CHAPTER 01 · FOUNDATION ARCHITECTURE]\
        #text(size: 16pt, weight: "black", fill: rtech-navy)[सर्वर आर्किटेक्चर, सर्वर के प्रकार एवं विंडोज सर्वर का इतिहास]
      ],
      [
        #box(
          fill: rgb("#EFF6FF"),
          stroke: 1pt + rgb("#BAE6FD"),
          radius: 4pt,
          inset: (x: 8pt, y: 4pt),
          text(size: 8pt, weight: "bold", fill: rtech-blue)[भाग 1 : सिद्धांत एवं विकासक्रम]
        )
      ]
    )
  ]
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
    stroke: 0.8pt + rgb("#CBD5E1"),
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

1. #text(weight: "bold", fill: rtech-navy)[डोमेन कंट्रोलर (Domain Controller / AD DS):] संपूर्ण संगठन की केंद्रीय पहचान (Identity) संभालता है। यूजरनेम, पासवर्ड, कंप्यूटर खाते और सुरक्षा नीतियां इसी पर स्थित होती हैं। #hl-green[पोर्ट: 88 (Kerberos), 389 (LDAP)]।
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
    stroke: 0.8pt + rgb("#CBD5E1"),
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
    stroke: 0.8pt + rgb("#CBD5E1"),
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
- #text(weight: "bold", fill: rtech-navy)[3. माइक्रोसॉफ्ट अज़ूर एवं हाइब्रिड क्लाउड (Azure Arc):] #mark-green[Windows Server 2025 का सबसे बड़ा क्रांतिकारी फीचर Azure Arc एकीकरण है।] आप अपने ऑन-प्रिमाइसेस लोकल सर्वर को क्लाउड से जोड़ सकते हैं, और #hl-yellow[हॉटपैचिंग (Hotpatching)] के जरिए बिना सर्वर को रीबूट किए सीधे रैम में सिक्योरिटी अपडेट्स अप्लाई कर सकते हैं!

#v(6pt)

=== 1.4 विंडोज सर्वर का 32-वर्षीय संपूर्ण विकासक्रम (1993 से 2025 तक)
माइक्रोसॉफ्ट ने 1993 में पहला 32-बिट ऑपरेटिंग सिस्टम Windows NT 3.1 Advanced Server के रूप में लॉन्च किया था। आज Windows Server 2025 तक यह ऑपरेटिंग सिस्टम दुनिया का सबसे सुरक्षित एंटरप्राइज प्लेटफॉर्म बन चुका है:

#align(center)[
  #block(
    stroke: 0.8pt + rgb("#CBD5E1"),
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
  stroke: 0.5pt + rgb("#E2E8F0"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[इतिहास के प्रमुख मील के पत्थर (Key Historical Milestones):]\
    - #text(weight: "bold", fill: rtech-blue)[Windows NT 4.0 (1996):] पहली बार Windows 95 जैसा ग्राफिकल इंटरफ़ेस और डोमेन ट्रस्ट मॉडल पेश हुआ।
    - #text(weight: "bold", fill: rtech-emerald)[Windows 2000 Server (2000):] #hl-yellow[क्रांतिकारी वर्ष!] एक्टिव डायरेक्टरी (AD DS), DNS एकीकरण और ग्रुप पॉलिसी का जन्म इसी संस्करण में हुआ था।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2008 / R2 (2008):] वर्चुअलाइजेशन क्रांति का सूत्रपात — #hl-green[Microsoft Hyper-V] और बिना GUI वाला #hl-orange[Server Core] पहली बार शामिल हुए।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2012 / R2 (2012):] आधुनिक सर्वर मैनेजर डैशबोर्ड, स्टोरेज स्पेसेस (Storage Spaces) और SMB 3.0 का समावेश हुआ।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2016 (2016):] विंडोज कंटेनर्स (Docker सपोर्ट) और स्टोरेज स्पेसेस डायरेक्ट (S2D) की शुरुआत।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2019 (2019):] विंडोज एडमिन सेंटर (WAC) और हाइब्रिड क्लाउड इन्फ्रास्ट्रक्चर की नींव।
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2022 (2022):] सिक्योर्ड-कोर सर्वर (Secured-Core Server), डिफ़ॉल्ट TLS 1.3 और SMB over QUIC।
    - #text(weight: "bold", fill: rtech-blue)[Windows Server 2025 (नवीनतम फ्लैगशिप):] #hl-yellow[हॉटपैचिंग फॉर ऑल] (Zero-reboot patching), #hl-yellow[32KB AD डेटाबेस पेज साइज] (25 वर्षों में एक्टिव डायरेक्टरी का सबसे बड़ा स्पीड बूस्ट), नेक्स्ट-जेन स्टोरेज स्पेसेस डायरेक्ट डिडुप व कम्प्रेशन, और वाई-फाई सपोर्ट।
  ]
)

#v(6pt)

=== 1.5 क्लाइंट OS (Windows 11) बनाम सर्वर OS (Windows Server 2025)
कई नए छात्र पूछते हैं: *"जब Windows 11 भी विंडोज है और Server 2025 भी, तो हम Windows 11 को ही सर्वर की तरह इस्तेमाल क्यों नहीं कर सकते?"* 

कर्नेल के स्तर पर दोनों ऑपरेटिंग सिस्टम्स में भारी आंतरिक अंतर होता है:

#align(center)[
  #block(
    stroke: 0.8pt + rgb("#CBD5E1"),
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
  optA: "Storage Spaces Direct",
  optB: "Hotpatching",
  optC: "Hyper-V Live Migration",
  optD: "DirectAccess",
  ans: "B",
  exp: "Hotpatching के जरिए सर्वर को रीबूट किए बिना रनिंग प्रोसेस की मेमोरी में पैच अप्लाई किया जाता है।"
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

#pagebreak()
// =============================================================================
// CHAPTER 02: ENTERPRISE LAB SETUP & WINDOWS SERVER 2025 INSTALLATION
// =============================================================================
#label("chapter-2")

#block(
  width: 100%,
  stroke: (bottom: 2pt + rtech-blue),
  inset: (bottom: 6pt),
  [
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #text(size: 8pt, font: ("Consolas", "Courier New"), weight: "bold", fill: rtech-blue)[CHAPTER 02 · HANDS-ON PRACTICAL LAB SETUP]\
        #text(size: 16pt, weight: "black", fill: rtech-navy)[प्रैक्टिकल लैब सेटअप: Windows Server 2025 ISO एवं VM कॉन्फ़िगरेशन]
      ],
      [
        #box(
          fill: rgb("#EFF6FF"),
          stroke: 1pt + rgb("#BAE6FD"),
          radius: 4pt,
          inset: (x: 8pt, y: 4pt),
          text(size: 8pt, weight: "bold", fill: rtech-blue)[भाग 2 : वर्चुअल लैब निर्माण]
        )
      ]
    )
  ]
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
    stroke: 0.8pt + rgb("#CBD5E1"),
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
    stroke: 0.8pt + rgb("#CBD5E1"),
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

#warning-box(title: "सबसे गंभीर गलती से बचें: Server Core vs Desktop Experience")[
  विज़ार्ड में 4 विकल्प दिखते हैं। यदि आपने गलती से केवल 'Windows Server 2025 Datacenter' चुन लिया (बिना ब्रैकेट वाले नाम), तो #hl-orange[Server Core (केवल ब्लैक कमांड प्रॉम्प्ट)] इंस्टॉल हो जाएगा और कोई डेस्कटॉप या माउस नहीं मिलेगा! हमेशा #mark-green[Windows Server 2025 Datacenter (Desktop Experience)] ही चुनें जिसमें पूर्ण ग्राफिकल इंटरफ़ेस और सर्वर मैनेजर शामिल होता है।
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
  माइक्रोसॉफ्ट के अनुसार उत्पादन वातावरण (Production Datacenters) में चलने वाले 70% से अधिक विंडोज सर्वर्स बिना किसी GUI के #hl-yellow[Server Core] मोड में चलाए जाते हैं। Server Core में GUI न होने के कारण रैम की खपत 60% कम हो जाती है, डिस्क स्पेस केवल 10 GB लगता है, और सबसे महत्वपूर्ण: अटैकर के लिए कोई ग्राफिकल एक्सप्लॉइट उपलब्ध नहीं होता जिससे सर्वर पर सुरक्षा पैच लगाने की आवृत्ति 50% तक घट जाती है!
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
  q: "Windows Server 2025 में पूर्ण ग्राफिकल डेस्कटॉप और सर्वर मैनेजर पाने के लिए इंस्टॉलेशन के समय किस विकल्प का चयन करना अनिवार्य है?",
  optA: "Server Core Edition",
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
  q: "इंटरव्यूअर: 'एंटरप्राइज प्रोडक्शन में सर्वर डिप्लॉय करते समय Server Core और Desktop Experience में से आप किसे प्राथमिकता देंगे और क्यों?'",
  a: "उत्तर: प्रोडक्शन में हम हमेशा 'Server Core' को प्राथमिकता देंगे क्योंकि यह सिस्टम का अटैक सरफेस (Attack Surface) घटा देता है, रीबूट की आवश्यकता कम करता है और हार्डवेयर संसाधनों (RAM/CPU) की बचत करता है। मैनेजमेंट के लिए हम रिमोट टूल्स जैसे RSAT, PowerShell remoting या Windows Admin Center का उपयोग करते हैं।",
  tip: "यह उत्तर दर्शाता है कि आप केवल किताबी छात्र नहीं हैं, बल्कि एंटरप्राइज सिक्योरिटी की गहरी समझ रखते हैं।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'Windows Server 2025 इंस्टॉलेशन के लिए न्यूनतम डिस्क स्पेस और रैम की आधिकारिक आवश्यकता क्या है?'",
  a: "उत्तर: न्यूनतम आधिकारिक आवश्यकता 512 MB रैम (Server Core के लिए) या 2 GB रैम (Desktop Experience के लिए), 1.4 GHz 64-बिट प्रोसेसर, और न्यूनतम 32 GB स्टोरेज स्पेस है। हालांकि उत्पादन में Active Directory और रोल्स के सुचारू संचालन के लिए कम से कम 4 GB रैम और 60 GB SSD अनुशंसित है।",
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

#pagebreak()
[#metadata("ch3") <chapter-3>]
[#metadata("ch4") <chapter-4>]
[#metadata("ch5") <chapter-5>]
[#metadata("ch6") <chapter-6>]
[#metadata("ch7") <chapter-7>]
[#metadata("ch8") <chapter-8>]
[#metadata("ch9") <chapter-9>]
[#metadata("ch10") <chapter-10>]
[#metadata("ch11") <chapter-11>]
[#metadata("ch12") <chapter-12>]

