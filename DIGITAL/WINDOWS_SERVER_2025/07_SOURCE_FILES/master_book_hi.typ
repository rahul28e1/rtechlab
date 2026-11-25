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
// PAGE 02: MASTER TABLE OF CONTENTS — PART 1 (कोर इंफ्रास्ट्रक्चर एवं डायरेक्टरी सर्विसेज)
// =============================================================================
[#metadata("toc") <table-of-contents>]

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 3pt),
    text(size: 8pt, weight: "bold", fill: rtech-blue)[संपूर्ण 14 अध्याय मास्टर इंडेक्स · भाग 1 (अध्याय 01 से 07) · पृष्ठ 1 / 2]
  )
  #v(2.5pt)
  #text(size: 17pt, weight: "black", fill: rtech-navy)[विस्तृत विषय सूची — भाग 1 (अध्याय 01 से 07)]
  #v(2pt)
  #text(size: 8.2pt, fill: rtech-muted)[(किसी भी अध्याय पर सीधे क्लिक करके उस पेज पर जाएं · शेष अध्याय 08 से 14 अगले पेज 03 पर हैं)]
  #v(4pt)
  #line(length: 100%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(3pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  radius: 6pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 9pt, y: 7.5pt),
  [
    #grid(
      columns: (1fr, auto),
      row-gutter: 8pt,
      align: (left, right + horizon),
      
      [#link(<chapter-1>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 01: सर्वर आर्किटेक्चर, सर्वर के प्रकार एवं विंडोज सर्वर का 32-वर्षीय इतिहास]] \
       #text(size: 7.2pt, fill: rtech-muted)[क्लाइंट-सर्वर मॉडल · 8 प्रमुख सर्वर प्रकार · फिजिकल vs वर्चुअल vs अज़ूर आर्क हाइब्रिड · NT 3.1 से 2025 विकासक्रम · Win 11 vs Server 2025 · अभ्यास MCQs व MNC इंटरव्यू]],
      [#link(<chapter-1>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 04 →]]],

      [#link(<chapter-2>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 02: प्रैक्टिकल होम लैब सेटअप: Windows Server 2025 ISO एवं VM कॉन्फ़िगरेशन]] \
       #text(size: 7.2pt, fill: rtech-muted)[लैब हार्डवेयर आवश्यकताएं · आइसोलेटेड नेटवर्क टोपोलॉजी · Microsoft 180-Day ISO डाउनलोड · VirtualBox VM निर्माण · Desktop Experience vs Core · फर्स्ट बूट व MCQs]],
      [#link(<chapter-2>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 09 →]]],

      [#link(<chapter-3>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 03: पोस्ट-इंस्टॉलेशन कॉन्फ़िगरेशन एवं सर्वर हार्डनिंग (Hardening & Initial Setup)]] \
       #text(size: 7.2pt, fill: rtech-muted)[सर्वर मैनेजर डैशबोर्ड · कंप्यूटर नामकरण (`SRV-2025-DC01`) · स्टैटिक IPv4 एवं DNS असाइनमेंट · रिमोट डेस्कटॉप (RDP) व NLA · फ़ायरवॉल पोर्ट्स · NTP क्लॉक · MCQs व इंटरव्यू]],
      [#link(<chapter-3>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 14 →]]],

      [#link(<chapter-4>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 04: एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) एवं डोमेन कंट्रोलर प्रमोशन]] \
       #text(size: 7.2pt, fill: rtech-muted)[AD DS कोर आर्किटेक्चर · लॉजिकल (Forest, Domain, OU) व फिजिकल (Sites) संरचना · Add Roles Wizard · रूट DC (`corp.rtechlab.local`) · DSRM पासवर्ड · 5 FSMO रोल्स]],
      [#link(<chapter-4>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 18 →]]],

      [#link(<chapter-5>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 05: ADUC कंसोल: OUs, डोमेन यूजर्स एवं सिक्योरिटी ग्रुप्स का प्रबंधन]] \
       #text(size: 7.2pt, fill: rtech-muted)[ADUC (`dsa.msc`) · एंटरप्राइज OU पदानुक्रम · नए डोमेन यूजर अकाउंट्स · पासवर्ड व लॉकआउट नीतियां · सिक्योरिटी vs डिस्ट्रीब्यूशन ग्रुप्स · AGDLP मॉडल · PowerShell बल्क क्रिएशन]],
      [#link(<chapter-5>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 23 →]]],

      [#link(<chapter-6>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 06: क्लाइंट मशीन (Windows 10/11) को डोमेन से जोड़ना (Domain Join Walkthrough)]] \
       #text(size: 7.2pt, fill: rtech-muted)[क्लाइंट प्री-रिक्विज़िट्स · क्लाइंट DNS IP मैपिंग नियम · नेटवर्क कनेक्टिविटी व `nslookup` टेस्ट · वर्कग्रुप से डोमेन माइग्रेशन · टॉप 5 जॉइन एरर्स व फिक्स · डोमेन लॉगिन टेस्ट]],
      [#link(<chapter-6>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 27 →]]],

      [#link(<chapter-7>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 07: ग्रुप पॉलिसी ऑब्जेक्ट्स (GPO): एंटरप्राइज सुरक्षा एवं डेस्कटॉप नियंत्रण]] \
       #text(size: 7.2pt, fill: rtech-muted)[GPMC कंसोल · LSDOU प्रोसेसिंग क्रम · ब्लॉक इन्हेरिटेंस व एनफोर्स · लैब 1: पासवर्ड पॉलिसी · लैब 2: USB पेनड्राइव ब्लॉक GPO · लैब 3: वॉलपेपर डिप्लॉयमेंट · `gpupdate /force`]],
      [#link(<chapter-7>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 31 →]]]
    )
  ]
)

#v(4pt)
#info-box(title: "भाग 1 अध्ययन सारांश (Foundation & Identity)")[
  भाग 1 के अंतर्गत आप विंडोज सर्वर की बुनियादी कार्यप्रणाली, VM होम लैब इंस्टॉलेशन, पोस्ट-इंस्टॉलेशन हार्डनिंग, Active Directory (AD DS), DC प्रमोशन, यूजर्स/ग्रुप्स प्रबंधन, क्लाइंट डोमेन जॉइन तथा GPO नीतियों पर 100% व्यावहारिक कमांड हासिल करेंगे।
]

#v(3pt)
#link(<toc-part2>)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 1.2pt + rtech-blue,
    radius: 5pt,
    inset: (x: 9pt, y: 5.5pt),
    [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 8.5pt, weight: "black", fill: rtech-navy)[👉 शेष अध्याय 08 से 14 (DHCP, DNS, FSRM, IIS, Azure Arc, बैकअप व MNC इंटरव्यू)] \
          #text(size: 7.2pt, fill: rtech-muted)[मास्टर इंडेक्स भाग 2 देखने के लिए अगले पेज 03 पर जाएं या यहाँ सीधे क्लिक करें]
        ],
        [
          #box(
            fill: rtech-blue,
            radius: 3pt,
            inset: (x: 8pt, y: 4pt),
            text(size: 8pt, weight: "bold", fill: white)[पेज 03 (भाग 2) देखें →]
          )
        ]
      )
    ]
  )
]

#pagebreak()


// =============================================================================
// PAGE 03: MASTER TABLE OF CONTENTS — PART 2 (नेटवर्क सर्विसेज, क्लाउड, बैकअप एवं प्लेसमेंट)
// =============================================================================
[#metadata("toc2") <toc-part2>]

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 3pt),
    text(size: 8pt, weight: "bold", fill: rtech-blue)[संपूर्ण 14 अध्याय मास्टर इंडेक्स · भाग 2 (अध्याय 08 से 14 + परिशिष्ट) · पृष्ठ 2 / 2]
  )
  #v(2.5pt)
  #text(size: 17pt, weight: "black", fill: rtech-navy)[विस्तृत विषय सूची — भाग 2 (अध्याय 08 से 14 + परिशिष्ट)]
  #v(2pt)
  #text(size: 8.2pt, fill: rtech-muted)[(नेटवर्क इंफ्रास्ट्रक्चर, स्टोरेज, IIS, हाइब्रिड अज़ूर आर्क, डिज़ास्टर रिकवरी एवं MNC इंटरव्यू वॉल्ट)]
  #v(4pt)
  #line(length: 100%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  radius: 6pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 9pt, y: 8pt),
  [
    #grid(
      columns: (1fr, auto),
      row-gutter: 8.5pt,
      align: (left, right + horizon),

      [#link(<chapter-8>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 08: DHCP सर्वर कॉन्फ़िगरेशन: स्कोप, एक्सक्लूज़न, रिज़र्वेशन एवं फेलओवर]] \
       #text(size: 7.2pt, fill: rtech-muted)[DORA 4-स्टेप प्रक्रिया · AD ऑथराइजेशन · IPv4 स्कोप · सबनेट मास्क · लीज ड्यूरेशन · एक्सक्लूज़न रेंज · MAC रिज़र्वेशन · 80/20 स्प्लिट-स्कोप व फेलओवर क्लस्टर]],
      [#link(<chapter-8>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 35 →]]],

      [#link(<chapter-9>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 09: DNS सर्वर आर्किटेक्चर: फ़ॉरवर्ड/रिवर्स ज़ोन, रिकॉर्ड्स एवं स्कैवेंजिंग]] \
       #text(size: 7.2pt, fill: rtech-muted)[DNS का एंटरप्राइज महत्व · AD-Integrated ज़ोन · फ़ॉरवर्ड vs रिवर्स लुकअप · A, PTR, CNAME, MX व SRV रिकॉर्ड्स · रूट हिंट्स vs फॉरवर्डर्स · DNS स्कैवेंजिंग]],
      [#link(<chapter-9>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 39 →]]],

      [#link(<chapter-10>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 10: फाइल सर्वर रिसोर्स मैनेजर (FSRM), NTFS अनुमतियां एवं कोटा प्रबंधन]] \
       #text(size: 7.2pt, fill: rtech-muted)[शेयर्ड फ़ोल्डर्स · SMB 3.1.1 · शेयर vs NTFS अनुमतियां (इफेक्टिव फॉर्मूला) · FSRM रोल · हार्ड vs सॉफ्ट स्टोरेज कोटा · फाइल स्क्रीनिंग (MP3/EXE ब्लॉक) · स्टोरेज रिपोर्ट्स]],
      [#link(<chapter-10>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 43 →]]],

      [#link(<chapter-11>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 11: IIS वेब सर्वर, सिक्योर FTP एवं रिमोट डेस्कटॉप सर्विसेज (RDS)]] \
       #text(size: 7.2pt, fill: rtech-muted)[Internet Information Services (IIS) 10.x · आंतरिक कंपनी पोर्टल · SSL/TLS सर्टिफिकेट HTTPS · सिक्योर FTP सर्वर · रिमोट डेस्कटॉप सर्विसेज (RDS) आर्किटेक्चर]],
      [#link(<chapter-11>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 47 →]]],

      [#link(<chapter-12>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 12: Windows Server 2025 नेक्स्ट-जेन फीचर्स, स्टोरेज स्पेसेस एवं हाइब्रिड अज़ूर आर्क]] \
       #text(size: 7.2pt, fill: rtech-muted)[Server 2025 के 5 क्रांतिकारी फीचर्स · हॉटपैचिंग (Zero-Reboot Live Patching) · 32KB AD DB पेज साइज · नेक्स्ट-जेन S2D व ReFS डिडुप · SMB over QUIC · Azure Arc एकीकरण]],
      [#link(<chapter-12>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 50 →]]],

      [#link(<chapter-13>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 13: सर्वर बैकअप, डिज़ास्टर रिकवरी एवं एक्टिव डायरेक्टरी रीसायकल बिन]] \
       #text(size: 7.2pt, fill: rtech-muted)[3-2-1 एंटरप्राइज बैकअप रणनीति · Windows Server Backup · फुल vs सिस्टम स्टेट बैकअप · AD रीसायकल बिन सक्षम करना · डिलीटेड यूजर की 1-क्लिक रिकवरी · `wbadmin` ऑटोमेशन]],
      [#link(<chapter-13>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 53 →]]],

      [#link(<chapter-14>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[अध्याय 14: टॉप 50 MNC सिस्टम एडमिनिस्ट्रेटर प्लेसमेंट वॉल्ट एवं L1/L2 इंटरव्यू परिदृश्य]] \
       #text(size: 7.2pt, fill: rtech-muted)[L1/L2 दैनिक जिम्मेदारियां व टिकटिंग टूल्स (ServiceNow, Jira) · TCS, Wipro, Infosys, Cognizant के 50 वास्तविक इंटरव्यू परिदृश्य व समाधान · सैलरी नेगोशिएशन ब्लूप्रिंट]],
      [#link(<chapter-14>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 57 →]]],

      [#link(<appendix-academy>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[परिशिष्ट: RTechLab सिस्टम्स & इन्फ्रास्ट्रक्चर एकेडमी, लेखक प्रोफाइल एवं अंतिम शुभकामनाएं]] \
       #text(size: 7.2pt, fill: rtech-muted)[राहुल पटेल (संस्थापक व लेखक) का संदेश · मिशन वक्तव्य · 24x7 छात्र हेल्पलाइन सपोर्ट · सफलता की शपथ]],
      [#link(<appendix-academy>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[पेज 60 →]]]
    )
  ]
)

#v(4pt)
#pro-tip(title: "स्मार्ट नेविगेशन एवं 1-टैप जंप सिस्टम")[
  इस मास्टर हैंडबुक के प्रत्येक पृष्ठ के हेडर में #text(weight: "bold", fill: rtech-blue)[⮌ Index (विषय सूची)] लिंक उपलब्ध है। आप किसी भी पेज से तुरंत वापस इंडेक्स पर आ सकते हैं।
]

#v(3pt)
#link(<table-of-contents>)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 4pt,
    inset: (x: 8pt, y: 4.5pt),
    align(center)[
      #text(size: 8pt, weight: "bold", fill: rtech-blue)[⮌ वापस मास्टर इंडेक्स भाग 1 (अध्याय 01 से 07 · पेज 02) पर जाएं]
    ]
  )
]

#pagebreak()

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

// =============================================================================
// CHAPTER 04: ACTIVE DIRECTORY DOMAIN SERVICES & DOMAIN CONTROLLER PROMOTION
// =============================================================================

[#metadata("ch4") <chapter-4>]

#chapter-header(
  chapter-num: "CHAPTER 04",
  category: "भाग 4 : केंद्रीय पहचान एवं डायरेक्टरी सर्विसेज (Identity & Directory Services)",
  title: "एक्टिव डायरेक्टरी डोमेन सर्विसेज (AD DS) एवं डोमेन कंट्रोलर प्रमोशन",
  subtitle: "AD DS कोर आर्किटेक्चर · लॉजिकल (Forest, Domain, OU) व फिजिकल (Sites) संरचना · Add Roles Wizard · रूट DC (corp.rtechlab.local) · #hl-orange[DSRM] पासवर्ड · 5 FSMO रोल्स"
)

=== 4.1 एक्टिव डायरेक्टरी क्या है? (What is #hl-yellow[Active Directory Domain Services]?)
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

1. #hl-yellow[Server Manager] खोलें और शीर्ष दाईं ओर स्थित #hl-green['Manage'] मेनू पर क्लिक करके #hl-yellow['Add Roles and Features'] चुनें।
2. 'Before You Begin' स्क्रीन पर 'Next' दबाएं।
3. Installation Type में #hl-yellow['Role-based or feature-based installation'] चुनकर 'Next' दबाएं।
4. Server Selection में सुनिश्चित करें कि पूल में आपकी मशीन #hl-green[`SRV-2025-DC01 (192.168.1.10)`] चुनी हुई है। 'Next' दबाएं।
5. Server Roles सूची में #mark-yellow[Active Directory Domain Services] चेकबॉक्स पर टिक करें।
6. एक पॉप-अप विंडो खुलेगी: 'Add Features that are required for #hl-yellow[Active Directory Domain Services]' (RSAT टूल्स शामिल)। #hl-green['Add Features'] पर क्लिक करें और 'Next' दबाएं।
7. Features स्क्रीन पर डिफ़ॉल्ट चयन रहने दें और 'Next' दबाएं।
8. Confirmation स्क्रीन पर 'Restart the destination server automatically if required' को अनचेक रहने दें और #hl-green['Install'] पर क्लिक करें।
9. 2 से 3 मिनट में रोल इंस्टॉलेशन पूर्ण हो जाएगा। 'Close' पर क्लिक करें।

#v(6pt)

=== 4.5 प्रैक्टिकल लैब: सर्वर को रूट डोमेन कंट्रोलर प्रमोट करना (DC Promotion)
रोल इंस्टॉल होने के बाद सर्वर अपने आप DC नहीं बनता। उसे प्रमोट करना पड़ता है:

1. #hl-yellow[Server Manager] के शीर्ष पर स्थित पीले रंग के चेतावनी झंडे (#text(weight: "bold", fill: rtech-amber)[⚠️ Notification Flag]) पर क्लिक करें।
2. नीले रंग के लिंक पर क्लिक करें: #mark-green[Promote this server to a domain controller]।
3. #text(weight: "bold")[Deployment Configuration:] चूंकि हम पहली बार नया डोमेन बना रहे हैं, इसलिए तीसरा विकल्प चुनें: #hl-yellow['Add a new forest']।
   - Root domain name में लिखें: #hl-green[`corp.rtechlab.local`]। 'Next' दबाएं।
4. #text(weight: "bold")[Domain Controller Options:]
   - Forest & Domain functional level: #hl-green[Windows Server 2025] (नवीनतम सुरक्षा सुविधाओं के लिए)।
   - 'Domain Name System (DNS) server' और 'Global Catalog (GC)' को चेक रहने दें।
   - #text(weight: "bold", fill: rtech-navy)[Directory Services Restore Mode (#hl-orange[DSRM]) Password:] यह आपदा के समय AD डेटाबेस को रिस्टोर करने का मास्टर रिकवरी पासवर्ड होता है। एक मजबूत पासवर्ड दर्ज करें (उदा. #hl-green[`Dsrm@2025!`])। 'Next' दबाएं।
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
      3. #text(weight: "bold")[PDC Emulator (सर्वोच्च महत्वपूर्ण रोल):] #hl-orange[Kerberos] पासवर्ड बदलावों की तत्काल प्रोसेसिंग, टाइम सिंक्रोनाइज़ेशन (NTP Master), ग्रुप पॉलिसी संपादन और अकाउंट लॉकआउट संभालता है।
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
  q: "इंटरव्यूअर: '#hl-orange[DSRM] (#hl-orange[Directory Services Restore Mode]) पासवर्ड क्या है, और यह सामान्य डोमेन एडमिन पासवर्ड से कैसे अलग है?'",
  a: "उत्तर: डोमेन एडमिन का पासवर्ड एक्टिव डायरेक्टरी डेटाबेस (ntds.dit) के अंदर स्टोर होता है। यदि AD डेटाबेस करप्ट हो जाए या सर्वर Safe Mode (#hl-orange[DSRM]) में बूट हो जहाँ AD सर्विसेज बंद होती हैं, तो डोमेन एडमिन लॉगिन काम नहीं करेगा। ऐसे आपातकाल में सर्वर के लोकल SAM डेटाबेस में केवल #hl-orange[DSRM] पासवर्ड ही काम करता है जिसके जरिए डेटाबेस रिस्टोर किया जाता है।",
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

// =============================================================================
// CHAPTER 05: ADUC CONSOLE: OUS, DOMAIN USERS & GROUP MANAGEMENT
// =============================================================================

[#metadata("ch5") <chapter-5>]

#chapter-header(
  chapter-num: "CHAPTER 05",
  category: "भाग 5 : डायरेक्टरी ऑब्जेक्ट्स एवं एक्सेस कंट्रोल (Directory Objects & RBAC)",
  title: "ADUC कंसोल: OUs, डोमेन यूजर्स एवं सिक्योरिटी ग्रुप्स का प्रबंधन",
  subtitle: "ADUC (dsa.msc) · एंटरप्राइज OU पदानुक्रम · नए डोमेन यूजर अकाउंट्स · पासवर्ड व लॉकआउट नीतियां · सिक्योरिटी vs डिस्ट्रीब्यूशन ग्रुप्स · #hl-orange[AGDLP] मॉडल · PowerShell बल्क क्रिएशन"
)

=== 5.1 #hl-yellow[Active Directory Users and Computers] (`dsa.msc`) इंटरफ़ेस
डोमेन कंट्रोलर प्रमोट होने के बाद, एक्टिव डायरेक्टरी के सभी ऑब्जेक्ट्स (Users, Computers, Groups, OUs) को प्रबंधित करने का प्राथमिक ग्राफिकल टूल #hl-yellow[Active Directory Users and Computers (ADUC)] है।

*ADUC कंसोल खोलने के 2 त्वरित तरीके:*
1. #hl-yellow[Server Manager] -> शीर्ष दाईं ओर #hl-green[Tools] मेनू -> #hl-yellow[Active Directory Users and Computers] पर क्लिक करें।
2. रन डायलॉग (`Win + R`) में शॉर्टकट कमांड टाइप करें: #mark-green[`dsa.msc`] और Enter दबाएं।

कंसोल के बाईं ओर आपका डोमेन `#text(weight: "bold")[corp.rtechlab.local]` दिखेगा। इसके नीचे कुछ डिफ़ॉल्ट कंटेनर्स पहले से बने होते हैं:
- #text(weight: "bold", fill: rtech-navy)[Builtin:] सिस्टम के डिफ़ॉल्ट सुरक्षा ग्रुप्स (Administrators, Account Operators, Backup Operators आदि)।
- #text(weight: "bold", fill: rtech-navy)[Computers:] जब कोई साधारण क्लाइंट कंप्यूटर डोमेन जॉइन करता है, तो उसका खाता डिफ़ॉल्ट रूप से इसी फोल्डर में बनता है।
- #text(weight: "bold", fill: rtech-navy)[Domain Controllers:] इस डोमेन के सभी अधिकृत डोमेन कंट्रोलर सर्वर्स का OU।
- #text(weight: "bold", fill: rtech-navy)[Users:] डिफ़ॉल्ट डोमेन यूजर्स और ग्रुप्स (उदा. Administrator, Guest, Domain Admins, Domain Users)।

#warning-box(title: "डिफ़ॉल्ट कंटेनर vs ऑर्गेनाइजेशनल यूनिट (Critical Architectural Difference)")[
  'Computers' और 'Users' साधारण कंटेनर (Generic Containers) हैं, वे OU नहीं हैं! #hl-orange[डिफ़ॉल्ट कंटेनर्स पर कभी भी ग्रुप पॉलिसी ऑब्जेक्ट (GPO) सीधे लिंक नहीं किया जा सकता।] इसलिए एंटरप्राइज में कभी भी कर्मचारियों या कंप्यूटरों को डिफ़ॉल्ट फोल्डर में नहीं छोड़ा जाता; हमेशा कस्टम OUs बनाए जाते हैं।
]

#v(4pt)

=== 5.2 एंटरप्राइज OU पदानुक्रम डिजाइन (Enterprise OU Hierarchy Design)
एक सुव्यवस्थित OU संरचना कॉर्पोरेट प्रशासन और सुरक्षा नीतियों को सुगम बनाती है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ou_hierarchy_agdlp.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 5.1: एंटरप्राइज OU संरचना एवं #hl-orange[AGDLP] रोल-बेस्ड एक्सेस कंट्रोल (RBAC) नेस्टिंग फ्रेमवर्क]
]

#v(4pt)

*कस्टम OU बनाने के चरण:*
1. ADUC में डोमेन नाम `#text(weight: "bold")[corp.rtechlab.local]` पर राइट-क्लिक करें -> #hl-yellow[New -> Organizational Unit]।
2. Name में टाइप करें: #hl-green[`RTechLab-Enterprise`]।
3. #mark-orange['Protect container from accidental deletion'] चेकबॉक्स को हमेशा चेक रहने दें। यह OU को किसी एडमिन द्वारा गलती से डिलीट होने से बचाता है। 'OK' दबाएं।
4. अब `RTechLab-Enterprise` पर राइट-क्लिक करके सब-OUs बनाएं:
   - #hl-yellow[`Corporate-Departments`] (इसके भीतर `HR`, `Finance`, `IT-Admins`, `Sales` सब-OUs)
   - #hl-yellow[`Workstations`] (कर्मचारियों के Windows 10/11 लैपटॉप व डेस्कटॉप)
   - #hl-yellow[`Servers`] (सदस्य सर्वर्स जैसे File Server, Web Server)

#v(6pt)

=== 5.3 नया डोमेन यूजर अकाउंट बनाना (Creating Domain User Accounts)
अब हम HR विभाग के लिए एक नया डोमेन यूजर बनाएंगे:

1. `Corporate-Departments -> HR` OU पर राइट-क्लिक करें -> #hl-yellow[New -> User]।
2. #text(weight: "bold")[First name:] `Rahul`, #text(weight: "bold")[Last name:] `Patel`।
3. #text(weight: "bold")[User logon name (UPN):] #hl-green[`rpatel`]\@corp.rtechlab.local।
4. #text(weight: "bold")[User logon name (pre-Windows 2000):] `CORP\rpatel` (स्वतः भर जाएगा)। 'Next' दबाएं।
5. #text(weight: "bold")[पासवर्ड सेटिंग्स एवं 4 महत्वपूर्ण चेकबॉक्स:]
   - #text(weight: "bold", fill: rtech-blue)[✓ User must change password at next logon:] (कॉर्पोरेट बेस्ट प्रैक्टिस — जब कर्मचारी पहली बार लॉगिन करेगा, तो सिस्टम उसे अपना निजी पासवर्ड बनाने के लिए मजबूर करेगा)।
   - #text(weight: "bold", fill: rtech-muted)[User cannot change password:] (शेयर्ड या कियोस्क कंप्यूटर खातों के लिए)।
   - #text(weight: "bold", fill: rtech-rose)[Password never expires:] (केवल सर्विस अकाउंट्स के लिए; सामान्य यूजर्स पर इसे लगाना गंभीर सुरक्षा उल्लंघन है)।
   - #text(weight: "bold", fill: rtech-amber)[Account is disabled:] (कर्मचारी के नोटिस पीरियड या छुट्टी पर जाने पर खाता अस्थायी बंद करने के लिए)।
6. प्रारंभिक सुरक्षित पासवर्ड डालें (उदा. #hl-green[`Welcome@2025#`]) और 'Next' -> 'Finish' करें।

#v(6pt)

=== 5.4 अकाउंट लॉकआउट एवं फाइन-ग्रेंड पासवर्ड नीतियां (Account Lockout & FGPP)
ब्रूट-फोर्स पासवर्ड अटैक्स को रोकने के लिए एक्टिव डायरेक्टरी में अकाउंट लॉकआउट सुरक्षा तंत्र होता है:
- यदि कोई कर्मचारी या हैकर लगातार 5 बार गलत पासवर्ड डालता है (Account lockout threshold), तो उसका खाता 30 मिनट के लिए स्वतः लॉक हो जाता है।
- *अकाउंट अनलॉक करने का तरीका:* ADUC में यूजर पर राइट-क्लिक -> #hl-yellow[Properties -> Account] टैब पर जाएं। नीचे स्थित चेकबॉक्स #hl-green['Unlock account. This account is currently locked out on this Active Directory Domain Controller'] पर टिक लगाएं और 'Apply' करें।

#v(6pt)

=== 5.5 सिक्योरिटी ग्रुप्स बनाम डिस्ट्रीब्यूशन ग्रुप्स (Group Types)
एक्टिव डायरेक्टरी में दो प्रकार के ग्रुप्स होते हैं:
1. #text(weight: "bold", fill: rtech-navy)[सिक्योरिटी ग्रुप्स (Security Groups):] इनका प्राथमिक उद्देश्य नेटवर्क संसाधनों (फाइल शेयर, प्रिंटर, शेयरपॉइंट) पर अनुमतियां (Permissions) प्रदान करना होता है। इनका उपयोग ईमेल वितरण के लिए भी किया जा सकता है।
2. #text(weight: "bold", fill: rtech-navy)[डिस्ट्रीब्यूशन ग्रुप्स (Distribution Groups):] इनका उपयोग केवल ईमेल सूचियां (Distribution Lists - Exchange Server/Outlook) बनाने के लिए किया जाता है। #hl-orange[डिस्ट्रीब्यूशन ग्रुप्स को कभी भी किसी फाइल या फोल्डर की NTFS सुरक्षा अनुमति नहीं दी जा सकती!]

#v(6pt)

=== 5.6 ग्रुप स्कोप्स एवं #hl-orange[AGDLP] बेस्ट प्रैक्टिस (The #hl-orange[AGDLP] Standard)
माइक्रोसॉफ्ट एंटरप्राइज में रोल्स और परमिशंस प्रबंधित करने के लिए #hl-yellow[AGDLP मॉडल] की सिफारिश करता है:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[AGDLP फॉर्मूला (MNC इंटरव्यू में 100% पूछा जाने वाला सिद्धांत):]\
    - #text(weight: "bold", fill: rtech-blue)[A (Accounts):] यूजर अकाउंट्स (उदा. `rpatel`, `ajain`)।
    - #text(weight: "bold", fill: rtech-blue)[G (Global Groups):] यूजर्स को उनके कार्य/विभाग के आधार पर ग्लोबल ग्रुप में जोड़ें (उदा. `GG_HR_Staff`)।
    - #text(weight: "bold", fill: rtech-amber)[DL (Domain Local Groups):] संसाधन की आवश्यकता के अनुसार डोमेन लोकल ग्रुप बनाएं और ग्लोबल ग्रुप को इसमें नेस्ट करें (उदा. `DL_HR_Payroll_Read`)।
    - #text(weight: "bold", fill: rtech-emerald)[P (Permissions):] संसाधन (Shared Folder) पर केवल Domain Local ग्रुप को NTFS/Share अनुमति आवंटित करें!
  ]
)

#v(6pt)

=== 5.7 PowerShell द्वारा बल्क यूजर निर्माण (Automated Bulk User Onboarding)
उत्पादन में जब 200 नए कर्मचारी एक साथ कंपनी जॉइन करते हैं, तो ADUC में एक-एक करके यूजर बनाना असंभव होता है। एडमिनिस्ट्रेटर PowerShell का उपयोग करते हैं:

```powershell
# एकल यूजर निर्माण:
New-ADUser -Name "Rahul Patel" -GivenName "Rahul" -Surname "Patel" `
  -SamAccountName "rpatel" -UserPrincipalName "rpatel@corp.rtechlab.local" `
  -Path "OU=HR,OU=Corporate-Departments,OU=RTechLab-Enterprise,DC=corp,DC=rtechlab,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Welcome@2025#" -AsPlainText -Force) `
  -Enabled $true -ChangePasswordAtLogon $true

# CSV फाइल से 500 यूजर्स एक साथ बनाना:
Import-Csv -Path "C:\HR_New_Employees.csv" | ForEach-Object {
    New-ADUser -Name "$($_.FirstName) $($_.LastName)" -SamAccountName $_.Username `
      -Path $_.OUPath -AccountPassword (ConvertTo-SecureString $_.DefaultPassword -AsPlainText -Force) `
      -Enabled $true -ChangePasswordAtLogon $true
}
```

#v(8pt)

// =============================================================================
// CHAPTER 05 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  एक्टिव डायरेक्टरी में एक गुप्त सुरक्षा प्रक्रिया होती है जिसे #hl-yellow[AdminSDHolder] और #hl-yellow[SDProp (Security Descriptor Propagator)] कहा जाता है। हर 60 मिनट में PDC Emulator डोमेन के सभी विशेषाधिकार प्राप्त ग्रुप्स (Domain Admins, Enterprise Admins, Schema Admins) के सदस्यों की सुरक्षा अनुमतियों को रीसेट कर देता है और इन्हेरिटेंस को ब्लॉक कर देता है ताकि कोई कनिष्ठ एडमिन अनजाने में शीर्ष एडमिन खातों के अधिकार न बदल सके!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 05 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "#hl-yellow[Active Directory Users and Computers] ग्राफिकल कंसोल को सीधे खोलने का आधिकारिक रन कमांड क्या है?",
  optA: "gpmc.msc",
  optB: "dsa.msc",
  optC: "dnsmgmt.msc",
  optD: "compmgmt.msc",
  ans: "B",
  exp: "dsa.msc (Directory Services Administration) ADUC कंसोल का आधिकारिक शॉर्टकट है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "माइक्रोसॉफ्ट के अनुसार डिफ़ॉल्ट 'Users' और 'Computers' कंटेनर्स पर ग्रुप पॉलिसी (GPO) लागू न हो पाने का क्या कारण है?",
  optA: "वे पासवर्ड से सुरक्षित होते हैं",
  optB: "वे साधारण जेनेरिक कंटेनर हैं, ऑर्गेनाइजेशनल यूनिट (OU) नहीं हैं",
  optC: "उनमें कोई लाइसेंस नहीं होता",
  optD: "वे केवल रीड-ओनली होते हैं",
  ans: "B",
  exp: "ग्रुप पॉलिसी केवल साइट, डोमेन और ऑर्गेनाइजेशनल यूनिट्स (OUs) पर ही सीधे लिंक की जा सकती है, जेनेरिक कंटेनर्स पर नहीं।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "माइक्रोसॉफ्ट के अनुशंसित #hl-orange[AGDLP] एक्सेस कंट्रोल मॉडल में 'DL' अक्षर का क्या तात्पर्य है?",
  optA: "Distribution List",
  optB: "Domain Local Group",
  optC: "Dynamic Link",
  optD: "Data Lock",
  ans: "B",
  exp: "#hl-orange[AGDLP] का पूर्ण रूप है: Accounts -> Global Groups -> Domain Local Groups -> Permissions।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "किसी नए यूजर को बनाते समय 'User must change password at next logon' चेक करने का प्राथमिक लाभ क्या है?",
  optA: "एडमिनिस्ट्रेटर को यूजर का पासवर्ड कभी पता नहीं रहता और जवाबदेही (Non-Repudiation) बनी रहती है",
  optB: "पासवर्ड की जटिलता समाप्त हो जाती है",
  optC: "यूजर कभी लॉकआउट नहीं होता",
  optD: "यूजर स्वतः डोमेन एडमिन बन जाता है",
  ans: "A",
  exp: "यह कॉर्पोरेट सुरक्षा नीति का नियम है ताकि केवल कर्मचारी ही अपने खाते के क्रेडेंशियल्स का मालिक रहे।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "PowerShell में एक्टिव डायरेक्टरी के अंदर नया यूजर अकाउंट बनाने के लिए किस आधिकारिक Cmdlet का उपयोग किया जाता है?",
  optA: "Add-User",
  optB: "Create-ADAccount",
  optC: "New-ADUser",
  optD: "Set-DomainUser",
  ans: "C",
  exp: "New-ADUser एक्टिव डायरेक्टरी मॉड्यूल का मानक आधिकारिक Cmdlet है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'Security Groups और Distribution Groups में तकनीकी अंतर क्या है, और क्या हम Distribution Group को शेयर फोल्डर पर परमिशन दे सकते हैं?'",
  a: "उत्तर: नहीं, Distribution Group को कभी भी शेयर या NTFS परमिशन नहीं दी जा सकती क्योंकि उनके पास SID (Security Identifier) का सुरक्षा संदर्भ नहीं होता; वे केवल Exchange/Outlook मेलिंग लिस्ट के लिए होते हैं। केवल Security Groups के पास ही सुरक्षा SID होता है और उन्हें संसाधनों पर ACLs (Access Control Lists) में अनुमतियां दी जा सकती हैं।",
  tip: "TCS और Cognizant के L1/L2 सपोर्ट इंटरव्यू में यह प्रश्न बार-बार दोहराया जाता है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'AGDLP नेस्टिंग मॉडल का उपयोग क्यों किया जाता है? क्या हम यूजर्स को सीधे फोल्डर पर परमिशन नहीं दे सकते?'",
  a: "उत्तर: यूजर्स को सीधे फोल्डर पर परमिशन देना (Discretionary Access Control) एंटरप्राइज में प्रशासनिक अराजकता (Administrative Nightmare) पैदा करता है। जब कोई कर्मचारी नौकरी छोड़ता है या विभाग बदलता है, तो उसके राइट्स खोजना असंभव हो जाता है। AGDLP में परमिशन केवल Domain Local ग्रुप को मिलती है; कर्मचारी के बदलने पर केवल उसे Global ग्रुप से हटाना या जोड़ना पड़ता है, फोल्डर की ACLs को कभी छूना नहीं पड़ता।",
  tip: "यह उत्तर आपके उच्च-स्तरीय सिस्टम आर्किटेक्चर ज्ञान को प्रदर्शित करता है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'एक यूजर का खाता लॉक हो गया है। ADUC में जाए बिना कमांड-लाइन या PowerShell से उसे 2 सेकंड में कैसे अनलॉक करेंगे?'",
  a: "उत्तर: PowerShell में सिर्फ एक कमांड चलाएंगे: 'Unlock-ADAccount -Identity rpatel'। इससे PDC Emulator पर खाता तुरंत अनलॉक हो जाता है।",
  tip: "PowerShell ऑटोमेशन की समझ आपको साधारण उम्मीदवारों से तुरंत अलग कर देती है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'OU पर 'Protect container from accidental deletion' चेकबॉक्स आंतरिक रूप से कैसे काम करता है?'",
  a: "उत्तर: जब यह चेकबॉक्स टिक होता है, तो एक्टिव डायरेक्टरी उस OU के Access Control List (ACL) पर 'Everyone' और 'Domain Admins' के लिए 'Deny Delete' और 'Deny Delete Subtree' का परमिशन प्रविष्टि जोड़ देती है। यदि कोई एडमिन इसे डिलीट करने का प्रयास करेगा तो 'Access Denied' एरर आएगा। इसे डिलीट करने के लिए पहले View -> Advanced Features में जाकर Object टैब से इस सुरक्षा को हटाना पड़ता है।",
  tip: "विस्तृत आंतरिक सुरक्षा समझ L2 डायरेक्टरी सर्विसेज इंटरव्यू में बहुत सराही जाती है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'Fine-Grained Password Policies (FGPP) क्या है, और यह डिफ़ॉल्ट डोमेन पासवर्ड पॉलिसी से कैसे भिन्न है?'",
  a: "उत्तर: पुराने विंडोज सर्वर में पूरे डोमेन में केवल एक ही पासवर्ड पॉलिसी (Default Domain Policy) लागू हो सकती थी। FGPP (Password Settings Objects - PSO) के द्वारा एडमिनिस्ट्रेटर एक ही डोमेन के अलग-अलग OUs या ग्रुप्स के लिए अलग-अलग पासवर्ड नीतियां बना सकते हैं (उदा. सामान्य कर्मचारियों के लिए 8-अक्षर का पासवर्ड लेकिन IT Admins के लिए अनिवार्य 16-अक्षर का जटिल पासवर्ड और 15-दिन की एक्सपायरी)।",
  tip: "एंटरप्राइज कंप्लायंस और सुरक्षा ऑडिट्स से जुड़ा यह अत्यंत महत्वपूर्ण प्रश्न है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 05 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - OUs का उपयोग ऑब्जेक्ट्स को तार्किक रूप से वर्गीकृत करने और उन पर ग्रुप पॉलिसी लागू करने के लिए किया जाता है।
      - संसाधनों की अनुमतियों के लिए हमेशा AGDLP नेस्टिंग मॉडल का पालन करें; कभी भी यूजर को सीधे परमिशन न दें।
      - PowerShell का `New-ADUser` और `Unlock-ADAccount` एंटरप्राइज हेल्पडेस्क ऑपरेशंस की गति को 10 गुना बढ़ा देते हैं।
    ]
  ]
)

#pagebreak()

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

// =============================================================================
// CHAPTER 08: DHCP SERVER ROLE: SCOPES, RESERVATIONS & FAILOVER
// =============================================================================

[#metadata("ch8") <chapter-8>]

#chapter-header(
  chapter-num: "CHAPTER 08",
  category: "भाग 8 : स्वचालित नेटवर्क आईपी एड्रेसिंग (Dynamic Host Configuration)",
  title: "DHCP सर्वर कॉन्फ़िगरेशन: स्कोप, एक्सक्लूज़न, रिज़र्वेशन एवं फेलओवर",
  subtitle: "DORA 4-स्टेप प्रक्रिया · AD ऑथराइजेशन · IPv4 स्कोप · सबनेट मास्क · लीज ड्यूरेशन · एक्सक्लूज़न रेंज · MAC रिज़र्वेशन · 80/20 स्प्लिट-स्कोप व फेलओवर क्लस्टर"
)

=== 8.1 DHCP क्या है? और DORA 4-चरण प्रक्रिया
जब कोई नया लैपटॉप या स्मार्टफोन कंपनी के वाई-फाई या लैन केबल से जुड़ता है, तो उसे नेटवर्क पर बातचीत करने के लिए एक अद्वितीय IP एड्रेस, सबनेट मास्क, डिफ़ॉल्ट गेटवे और DNS सर्वर की आवश्यकता होती है।

#mark-yellow[डायनामिक होस्ट कॉन्फ़िगरेशन प्रोटोकॉल (DHCP) एक क्लाइंट-सर्वर नेटवर्किंग प्रोटोकॉल है जो नेटवर्क से जुड़ने वाले प्रत्येक क्लाइंट कंप्यूटर को स्वचालित रूप से IP पते और नेटवर्क पैरामीटर्स एक निश्चित समय अवधि (Lease) के लिए आवंटित करता है।]

क्लाइंट और DHCP सर्वर के बीच IP आवंटन की प्रक्रिया को #hl-yellow[DORA प्रक्रिया] कहा जाता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dhcp_dora_process.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 8.1: DHCP 4-चरणीय DORA लाइफसाइकिल — Discover, Offer, Request, एवं Acknowledge (UDP Port 67/68)]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[DORA प्रक्रिया के 4 चरण (MNC Interview Decider):]\
    - #text(weight: "bold", fill: rtech-blue)[1. D (DHCPDISCOVER):] क्लाइंट के पास अभी कोई IP नहीं है। वह स्रोत IP `0.0.0.0` और गंतव्य IP `255.255.255.255` (Broadcast) के साथ नेटवर्क पर चिल्लाता है: *"क्या इस नेटवर्क पर कोई DHCP सर्वर मौजूद है?"* #hl-green[UDP पोर्ट: 67]।
    - #text(weight: "bold", fill: rtech-emerald)[2. O (DHCPOFFER):] नेटवर्क पर मौजूद DHCP सर्वर अपने उपलब्ध पूल में से एक अप्रयुक्त IP निकालता है और क्लाइंट को ऑफर भेजता है: *"मेरे पास IP 192.168.1.100 उपलब्ध है, क्या तुम इसे लेना चाहते हो?"* #hl-green[UDP पोर्ट: 68]।
    - #text(weight: "bold", fill: rtech-amber)[3. R (DHCPREQUEST):] क्लाइंट उस ऑफर को स्वीकार करता है और ब्रॉडकास्ट संदेश भेजता है: *"हाँ, मुझे सर्वर 192.168.1.10 द्वारा दिया गया IP 192.168.1.100 स्वीकार है!"*
    - #text(weight: "bold", fill: rtech-blue)[4. A (DHCPACK):] DHCP सर्वर पावती (Acknowledgement) भेजता है, IP को अपनी डेटाबेस में लीज पर बुक करता है, और गेटवे तथा DNS की जानकारी सौंपता है।
  ]
)

#v(6pt)

=== 8.2 DHCP सर्वर रोल इंस्टॉलेशन एवं एक्टिव डायरेक्टरी ऑथराइजेशन
1. #hl-yellow[Server Manager] -> #hl-green[Manage -> Add Roles and Features] में जाएं।
2. Server Roles में #mark-yellow[DHCP Server] चेकबॉक्स पर टिक करें।
3. 'Add Features' (DHCP RSAT टूल्स) शामिल करके 'Next' -> 'Next' -> 'Install' करें।
4. इंस्टॉलेशन पूर्ण होने पर पीले झंडे (Notification) पर क्लिक करें -> #hl-yellow['Complete DHCP Configuration']।
5. विज़ार्ड में #text(weight: "bold", fill: rtech-navy)[Authorization] स्क्रीन आएगी। 'Commit' दबाएं ताकि हमारा डोमेन कंट्रोलर इस DHCP सर्वर को एक्टिव डायरेक्टरी में अधिकृत (Authorize) कर दे।

#warning-box(title: "Rogue DHCP Server Prevention (एंटरप्राइज सुरक्षा तंत्र)")[
  यदि कोई अनधिकृत व्यक्ति या छात्र नेटवर्क में अपना निजी राउटर या अनधिकृत DHCP सर्वर चालू कर दे (Rogue DHCP Server), तो विंडोज डोमेन कंट्रोलर उसे तुरंत डिटेक्ट कर लेता है। एक्टिव डायरेक्टरी में गैर-अधिकृत DHCP सर्वर्स की सर्विस को विंडोज स्वतः बंद (Stop) कर देता है ताकि कर्मचारियों को गलत IP न मिले।
]

#v(6pt)

=== 8.3 नया IPv4 स्कोप बनाना (Configuring an IPv4 Scope)
एक स्कोप (Scope) IP पतों की वह वैध सीमा होती है जिसे सर्वर क्लाइंट्स को बांटता है:

1. #hl-yellow[Server Manager] -> Tools -> #hl-yellow[DHCP] कंसोल खोलें (या रन में टाइप करें: #mark-green[`dhcpmgmt.msc`])।
2. सर्वर नाम `SRV-2025-DC01` का विस्तार करें -> #text(weight: "bold")[IPv4] पर राइट-क्लिक करें -> #hl-green[New Scope...] चुनें।
3. Scope Name: #hl-yellow[`RTechLab-LAN-Scope`]।
4. #text(weight: "bold")[IP Address Range (आईपी पूल):]
   - Start IP address: #hl-green[`192.168.1.100`]
   - End IP address: #hl-green[`192.168.1.200`]
   - Length: #hl-green[`24`], Subnet mask: #hl-green[`255.255.255.0`]
5. #text(weight: "bold")[Lease Duration (पट्टे की अवधि):] डिफ़ॉल्ट रूप से #hl-yellow[8 दिन] होती है। ऑफिस के वायर्ड डेस्कटॉप के लिए 8 दिन उपयुक्त है, लेकिन एयरपोर्ट या कैफे के गेस्ट वाई-फाई के लिए इसे 2 से 4 घंटे रखा जाता है।

#v(6pt)

=== 8.4 एक्सक्लूज़न रेंज एवं आवश्यक DHCP ऑप्शंस
- #text(weight: "bold", fill: rtech-rose)[Add Exclusions and Delay (एक्सक्लूज़न रेंज):] यदि हमारे पूल में कुछ ऐसे IP पते हैं जिन्हें हम किसी क्लाइंट को नहीं देना चाहते (उदा. आईटी टेस्टिंग लैब के लिए), तो उन्हें बाहर रखा जाता है:
  - Start IP: `192.168.1.150` से End IP: `192.168.1.160` डालकर 'Add' करें।
- #text(weight: "bold", fill: rtech-navy)[Configure DHCP Options:]
  - #text(weight: "bold", fill: rtech-blue)[Option 003 (Router / Default Gateway):] `192.168.1.1` डालकर 'Add' करें।
  - #text(weight: "bold", fill: rtech-emerald)[Option 006 (DNS Servers):] `192.168.1.10` (हमारा AD DNS सर्वर) प्राथमिकता में जोड़ें।
  - #text(weight: "bold", fill: rtech-amber)[Option 015 (Domain Name):] `corp.rtechlab.local` दर्ज करें।
6. 'Yes, I want to activate this scope now' चुनकर 'Finish' करें!

#v(6pt)

=== 8.5 MAC एड्रेस रिज़र्वेशन (Reservations for Network Printers)
ऑफिस में नेटवर्क प्रिंटर्स, स्कैनर्स और सीसीटीवी कैमरों का IP कभी नहीं बदलना चाहिए, अन्यथा कर्मचारी प्रिंट नहीं दे पाएंगे। इसके लिए हम MAC रिज़र्वेशन का उपयोग करते हैं:

1. DHCP कंसोल में अपने स्कोप के अंदर #hl-yellow[Reservations] फोल्डर पर राइट-क्लिक करें -> #hl-green[New Reservation...]।
2. Reservation name: #hl-yellow[`HP-Network-Printer-HR`]।
3. IP address: #hl-green[`192.168.1.105`]।
4. MAC address: प्रिंटर का 12-अंकों का हेक्साडेसिमल मैक एड्रेस दर्ज करें (उदा. `00155D01A23B`)।
5. Supported types: #hl-yellow['Both (DHCP and BOOTP)'] चुनकर 'Add' करें।
अब जब भी वह प्रिंटर नेटवर्क पर चालू होगा, DHCP सर्वर उसके मैक एड्रेस को पहचानकर हमेशा यही फिक्स्ड IP `192.168.1.105` ही देगा!

#v(6pt)

=== 8.6 हाई अवेलेबिलिटी: DHCP 80/20 स्प्लिट-स्कोप एवं क्लस्टर फेलओवर
यदि एकमात्र DHCP सर्वर क्रैश हो जाए, तो लीज समाप्त होने पर पूरे ऑफिस का इंटरनेट और नेटवर्क बंद हो जाएगा। इसे रोकने के दो तरीके हैं:

1. #text(weight: "bold", fill: rtech-navy)[80/20 स्प्लिट स्कोप नियम (Legacy Standard):] प्राथमिक DC पर 80% IP पूल दिया जाता है और सेकेंडरी DC पर उसी सबनेट का 20% पूल रखा जाता है ताकि प्राइमरी के डाउन होने पर 20% मशीनें चलती रहें।
2. #text(weight: "bold", fill: rtech-emerald)[आधुनिक DHCP Failover (Windows Server 2025):]
   - IPv4 स्कोप पर राइट-क्लिक करें -> #hl-green[Configure Failover...]।
   - पार्टनर सर्वर (`SRV-2025-DC02`) को चुनें।
   - मोड चुनें:
     - #text(weight: "bold")[Load Balance Mode:] दोनों सर्वर्स 50%-50% ट्रैफिक साझा करते हैं।
     - #text(weight: "bold")[Hot Standby Mode:] एक्टिव सर्वर 100% कार्य करता है, और उसके डाउन होने पर स्टैंडबाय सर्वर तत्काल कार्यभार संभाल लेता है।

#v(8pt)

// =============================================================================
// CHAPTER 08 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  DHCP ब्रॉडकास्ट ट्रैफिक लेयर-3 राउटर को पार नहीं कर सकता। यदि किसी कंपनी में 10 अलग-अलग VLANs या बिल्डिंग्स हैं, तो क्या हर फ्लोर पर अलग DHCP सर्वर लगाना पड़ेगा? बिल्कुल नहीं! सिस्को रूटर या स्विच पर #hl-yellow[DHCP Relay Agent] (सिस्को कमांड: `ip helper-address 192.168.1.10`) सक्षम किया जाता है, जो क्लाइंट के ब्रॉडकास्ट पैकेट को यूनिकास्ट पैकेट में बदलकर केंद्रीय DHCP सर्वर तक पहुंचा देता है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 08 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "DHCP IP आवंटन की 4-चरणीय DORA प्रक्रिया का सही पूर्ण रूप क्या है?",
  optA: "Domain, Origin, Routing, Access",
  optB: "Discover, Offer, Request, Acknowledge",
  optC: "Detect, Open, Receive, Assign",
  optD: "Data, Output, Response, Authentication",
  ans: "B",
  exp: "DORA का पूर्ण रूप है: DHCPDISCOVER, DHCPOFFER, DHCPREQUEST, एवं DHCPACK।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "क्लाइंट कंप्यूटर नेटवर्क पर DHCPDISCOVER पैकेट भेजते समय किस UDP पोर्ट नंबर का उपयोग करता है?",
  optA: "UDP पोर्ट 53",
  optB: "UDP पोर्ट 67",
  optC: "UDP पोर्ट 80",
  optD: "UDP पोर्ट 445",
  ans: "B",
  exp: "DHCP सर्वर UDP पोर्ट 67 पर सुनता है, जबकि क्लाइंट UDP पोर्ट 68 पर रिस्पॉन्स प्राप्त करता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "DHCP स्कोप विकल्पों में क्लाइंट कंप्यूटरों को 'Default Gateway (राउटर)' का IP एड्रेस प्रदान करने के लिए किस आधिकारिक विकल्प संख्या का उपयोग किया जाता है?",
  optA: "Option 003",
  optB: "Option 006",
  optC: "Option 015",
  optD: "Option 066",
  ans: "A",
  exp: "Option 003 Router (Default Gateway) के लिए और Option 006 DNS Servers के लिए आरक्षित है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "नेटवर्क प्रिंटर या सर्वर को हर बार एक ही विशिष्ट IP एड्रेस स्वतः आवंटित करने के लिए किस तकनीक का उपयोग किया जाता है?",
  optA: "Exclusion Range",
  optB: "MAC Address Reservation",
  optC: "APIPA Auto-IP",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "MAC रिज़र्वेशन डिवाइस के भौतिक मैक एड्रेस को DHCP स्कोप के भीतर एक निश्चित IP से स्थायी रूप से मैप कर देता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "यदि नेटवर्क पर कोई DHCP सर्वर उपलब्ध न हो, तो विंडोज 11 क्लाइंट स्वचालित रूप से किस IP रेंज में से APIPA एड्रेस उठा लेता है?",
  optA: "10.0.0.1 से 10.0.0.254",
  optB: "169.254.0.1 से 169.254.255.254",
  optC: "192.168.1.1 से 192.168.1.254",
  optD: "172.16.0.1 से 172.16.0.254",
  ans: "B",
  exp: "APIPA (Automatic Private IP Addressing) 169.254.0.0/16 सबनेट में से आईपी चुनता है जो DHCP विफलता का संकेत है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'क्लाइंट मशीन को 169.254.x.x का IP मिला है। इसका क्या अर्थ है और आप इसे कैसे ठीक करेंगे?'",
  a: "उत्तर: 169.254.x.x एक APIPA (Automatic Private IP Addressing) एड्रेस है। इसका सीधा अर्थ है कि क्लाइंट ने DHCPDISCOVER ब्रॉडकास्ट भेजा लेकिन नेटवर्क पर किसी भी DHCP सर्वर ने जवाब नहीं दिया। ट्रबलशूटिंग के लिए: 1. लैन केबल/VLAN पोर्ट की जाँच करेंगे, 2. DHCP सर्वर पर जाकर स्कोप पूल भर जाने (Pool Exhaustion) की जाँच करेंगे, 3. 'ipconfig /release' और 'ipconfig /renew' चलाएंगे।",
  tip: "HCL, Infosys और TCS के L1/L2 नेटवर्क सपोर्ट इंटरव्यू का यह सबसे आम प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'DHCP Lease Renewal प्रक्रिया कब शुरू होती है, और T1 व T2 टाइमर्स क्या हैं?'",
  a: "उत्तर: लीज अवधि के 50% समय बीतने पर (T1 Timer - उदा. 8 दिन की लीज में 4 दिन बाद) क्लाइंट मूल DHCP सर्वर को 'DHCPREQUEST' यूनिकास्ट भेजकर लीज रिन्यू करने का प्रयास करता है। यदि मूल सर्वर जवाब नहीं देता, तो 87.5% समय बीतने पर (T2 Timer - 7वें दिन) क्लाइंट नेटवर्क पर किसी भी अन्य उपलब्ध DHCP सर्वर को ब्रॉडकास्ट भेजता है। यदि 100% समय तक रिन्यू नहीं हुआ, तो IP स्वतः रिलीज हो जाता है।",
  tip: "यह डीप टेक्निकल उत्तर इंटरव्यूअर को तुरंत आश्वस्त करता है कि आप प्रोटोकॉल के आंतरिक टाइमर्स को जानते हैं।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'Rogue DHCP Server क्या होता है और Active Directory Authorization इसे कैसे निष्प्रभावी बनाती है?'",
  a: "उत्तर: Rogue DHCP वह अनधिकृत सर्वर होता है जो नेटवर्क पर अनपेक्षित IP और गलत गेटवे बांटकर Man-in-the-Middle (MitM) अटैक कर सकता है। विंडोज डोमेन एनवायरनमेंट में सभी DHCP सर्वर्स को AD में 'Authorize' होना पड़ता है (AD के Configuration Partition में लिस्टिंग)। जब कोई अनाधिकृत विंडोज सर्वर DHCP चालू करता है, तो वह पहले AD की सूची जांचता है; नाम न मिलने पर उसकी DHCP सर्विस स्वतः बंद हो जाती है।",
  tip: "एंटरप्राइज नेटवर्क सिक्योरिटी से जुड़ा यह बहुत हाई-वैल्यू प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'राउटर के पार दूसरे सबनेट पर स्थित क्लाइंट्स को केंद्रीय DHCP सर्वर से IP दिलाने के लिए क्या कॉन्फ़िगर किया जाता है?'",
  a: "उत्तर: चूंकि DHCP ब्रॉडकास्ट राउटर्स को पार नहीं कर सकते, इसलिए उस रिमोट सबनेट के गेटवे राउटर पर 'DHCP Relay Agent' (Cisco में 'ip helper-address <DHCP-IP>') कॉन्फ़िगर किया जाता है। रिले एजेंट ब्रॉडकास्ट को यूनिकास्ट पैकेट में बदलकर केंद्रीय DHCP सर्वर तक पहुंचाता है।",
  tip: "नेटवर्किंग और सर्वर इंफ्रास्ट्रक्चर के साझा इंटरव्यू राउंड का यह मानक प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'Windows Server 2025 में DHCP Failover के 'Load Balance' और 'Hot Standby' मोड्स में क्या अंतर है?'",
  a: "उत्तर: Load Balance मोड में दोनों पार्टनर्स सक्रिय रहते हैं और निर्धारित अनुपात (उदा. 50:50) में क्लाइंट अनुरोधों को प्रोसेस करते हैं (मल्टी-सर्वर साइट्स के लिए बेस्ट)। Hot Standby मोड में एक सर्वर मुख्य (Active) रहता है और दूसरा निष्क्रिय (Standby) रहता है; जब एक्टिव डाउन होता है, तभी स्टैंडबाय सर्वर लीज देना शुरू करता है (Hub-and-Spoke ब्रांच आर्किटेक्चर के लिए बेस्ट)।",
  tip: "हाई-अवेलेबिलिटी और डिज़ास्टर रिकवरी आर्किटेक्चर का कोर सवाल।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 08 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - DHCP सर्वर DORA प्रक्रिया द्वारा ऑटोमैटिक IP, सबनेट मास्क, गेटवे (Opt 003) और DNS (Opt 006) आवंटित करता है।
      - नेटवर्क प्रिंटर्स और फिक्स्ड डिवाइसेज के लिए MAC Reservation का उपयोग करें; कभी मैन्युअल IP न डालें।
      - 169.254.x.x (APIPA) का दिखना DHCP सर्वर विफलता या नेटवर्क डिस्कनेक्शन का स्पष्ट संकेत है।
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 09: DNS SERVER ARCHITECTURE: ZONES, RECORDS & SCAVENGING
// =============================================================================

[#metadata("ch9") <chapter-9>]

#chapter-header(
  chapter-num: "CHAPTER 09",
  category: "भाग 9 : कॉर्पोरेट नेम रेजोल्यूशन एवं DNS (Enterprise Name Resolution)",
  title: "DNS सर्वर आर्किटेक्चर: फ़ॉरवर्ड/रिवर्स ज़ोन, रिकॉर्ड्स एवं स्कैवेंजिंग",
  subtitle: "DNS का एंटरप्राइज महत्व · AD-Integrated ज़ोन · फ़ॉरवर्ड vs रिवर्स लुकअप · A, PTR, CNAME, MX व SRV रिकॉर्ड्स · #hl-yellow[रूट हिंट्स] vs फॉरवर्डर्स · DNS स्कैवेंजिंग"
)

=== 9.1 DNS का एंटरप्राइज महत्व एवं एक्टिव डायरेक्टरी से अटूट संबंध
यदि एक्टिव डायरेक्टरी कॉर्पोरेट नेटवर्क का *मस्तिष्क* है, तो DNS सर्वर उसका *हृदय* है। संपूर्ण विंडोज डोमेन एनवायरनमेंट में कोई भी सेवा (Login, #hl-orange[Kerberos], File Sharing, GPO) DNS के बिना 1 सेकंड भी कार्य नहीं कर सकती।

#mark-yellow[डोमेन नेम सिस्टम (DNS) एक श्रेणीबद्ध और वितरित डेटाबेस सेवा (Hierarchical Distributed Database) है जो मनुष्य के समझने योग्य कंप्यूटर नामों (उदा. `portal.corp.rtechlab.local`) को नेटवर्क के समझने योग्य IP पतों (`192.168.1.50`) में अनुवादित (Resolve) करती है।]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "DNS पोर्ट्स एवं प्रोटोकॉल्स")[
      DNS डिफ़ॉल्ट रूप से #hl-green[Port 53] पर कार्य करता है। सामान्य नेम रेजोल्यूशन क्वेरीज (< 512 बाइट्स) के लिए यह तेज #hl-green[UDP Port 53] का उपयोग करता है, जबकि ज़ोन ट्रांसफर और बड़े पैकेट्स के लिए विश्वसनीय #hl-yellow[TCP Port 53] का उपयोग करता है।
    ]
  ],
  [
    #warning-box(title: "SRV रिकॉर्ड्स का जीवन आधार")[
      जब कोई क्लाइंट डोमेन जॉइन या लॉगिन करता है, तो वह डोमेन कंट्रोलर का नाम नहीं जानता। वह DNS से विशेष #hl-orange[SRV रिकॉर्ड्स] मांगता है (`_ldap._tcp.dc._msdcs`)। यदि DNS में ये रिकॉर्ड्स न हों, तो डोमेन पूरी तरह ठप हो जाता है!
    ]
  ]
)

#v(4pt)

=== 9.2 DNS ज़ोन के प्रकार (Types of DNS Zones)
DNS में ज़ोन उस प्रशासनिक हिस्से (Database Partition) को कहते हैं जिसके लिए वह DNS सर्वर अधिकृत (Authoritative) होता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dns_architecture_zones.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 9.1: एंटरप्राइज DNS आर्किटेक्चर — फ़ॉरवर्ड/रिवर्स ज़ोन, रिसोर्स रिकॉर्ड्स एवं स्कैवेंजिंग लाइफसाइकिल]
]

#v(4pt)

1. #text(weight: "bold", fill: rtech-blue)[Active Directory-Integrated Zone (सर्वश्रेष्ठ एंटरप्राइज विकल्प):] यह ज़ोन किसी अलग फाइल में स्टोर होने के बजाय सीधे एक्टिव डायरेक्टरी डेटाबेस (`ntds.dit`) में स्टोर होता है। इसके 3 अद्वितीय फायदे हैं:
   - #hl-green[मल्टी-मास्टर रेप्लिकेशन:] किसी भी DC पर रिकॉर्ड बदलें, वह सभी DCs पर अपने आप सिंक हो जाता है।
   - #hl-green[सिक्योर डायनामिक अपडेट्स:] केवल डोमेन के अधिकृत कंप्यूटर्स ही अपना IP रिकॉर्ड रजिस्टर कर सकते हैं (हैकर नहीं)।
   - #hl-green[एनक्रिप्टेड रेप्लिकेशन:] संपूर्ण DNS डेटा #hl-orange[Kerberos] द्वारा एनक्रिप्ट होकर जाता है।
2. #text(weight: "bold", fill: rtech-navy)[Standard Primary Zone:] यह एक पारंपरिक टेक्स्ट फाइल (`zone.dns`) में स्टोर होता है। इसमें केवल प्राइमरी सर्वर ही रिकॉर्ड्स लिख सकता है (Single Master)।
3. #text(weight: "bold", fill: rtech-navy)[Standard Secondary Zone:] प्राइमरी ज़ोन की केवल रीड-ओनली (Read-Only) प्रतिलिपि। बैकअप और लोड डिस्ट्रीब्यूशन के लिए उपयोगी।
4. #text(weight: "bold", fill: rtech-muted)[Stub Zone:] इसमें केवल NS (Name Server), SOA (Start of Authority) और ग्लू A रिकॉर्ड्स होते हैं ताकि अन्य डोमेन के अधिकृत सर्वर्स को त्वरित खोजा जा सके।

#v(6pt)

=== 9.3 #hl-yellow[फ़ॉरवर्ड लुकअप ज़ोन] बनाम #hl-yellow[रिवर्स लुकअप ज़ोन]
- #text(weight: "bold", fill: rtech-navy)[फ़ॉरवर्ड लुकअप ज़ोन (#hl-yellow[Forward Lookup Zone]):] कंप्यूटर नाम को IP एड्रेस में बदलता है (Name -> IP)। जब आप ब्राउज़र में `srv-2025-dc01.corp.rtechlab.local` टाइप करते हैं, तो फ़ॉरवर्ड ज़ोन `192.168.1.10` लौटाता है।
- #text(weight: "bold", fill: rtech-navy)[रिवर्स लुकअप ज़ोन (#hl-yellow[Reverse Lookup Zone]):] IP एड्रेस को कंप्यूटर नाम में बदलता है (IP -> Name)। यह विशेष इन-एड्रेस आर्पा डोमेन का उपयोग करता है (उदा. `1.168.192.in-addr.arpa`)।
  - *रिवर्स ज़ोन क्यों अनिवार्य है?* #hl-orange[Kerberos] ऑथेंटिकेशन में SPN वैलिडेशन, मेल सर्वर्स में स्पैम ब्लॉक से बचना, और कमांड प्रॉम्प्ट में `nslookup 192.168.1.10` चलाकर होस्ट का सही नाम जानना।

#v(6pt)

=== 9.4 आवश्यक एंटरप्राइज DNS रिकॉर्ड्स (Resource Records)
DNS कंसोल (`dnsmgmt.msc`) में 5 सबसे महत्वपूर्ण रिकॉर्ड्स होते हैं:

1. #text(weight: "bold", fill: rtech-blue)[Host (A एवं AAAA रिकॉर्ड):] Hostname को IPv4 (A रिकॉर्ड) या IPv6 (AAAA रिकॉर्ड) पते से जोड़ता है। उदा. `srv-dc01` -> `192.168.1.10`।
2. #text(weight: "bold", fill: rtech-emerald)[Pointer (PTR रिकॉर्ड):] #hl-yellow[रिवर्स लुकअप ज़ोन] में IP को Hostname से जोड़ता है। उदा. `10` -> `srv-dc01.corp.rtechlab.local`।
3. #text(weight: "bold", fill: rtech-amber)[Alias (CNAME - Canonical Name):] एक कंप्यूटर के लिए दूसरा उपनाम बनाता है। उदा. कर्मचारी `portal.corp.rtechlab.local` खोलें तो वह CNAME द्वारा बैकएंड सर्वर `srv-2025-web01.corp.rtechlab.local` पर निर्देशित हो जाए।
4. #text(weight: "bold", fill: rtech-navy)[Mail Exchanger (MX रिकॉर्ड):] डोमेन के ईमेल सर्वर्स (Microsoft Exchange) का IP और उनकी प्राथमिकता (Priority/Preference नंबर) बताता है।
5. #text(weight: "bold", fill: rtech-rose)[Service Location (SRV रिकॉर्ड):] पूरे AD का रीढ़ की हड्डी। यह बताता है कि LDAP, #hl-orange[Kerberos], और Global Catalog जैसी सेवाएं किस पोर्ट और किस सर्वर पर चल रही हैं (उदा. `_ldap._tcp.dc._msdcs.corp.rtechlab.local` #hl-green[Port 389])।

#v(6pt)

=== 9.5 #hl-yellow[रूट हिंट्स] (Root Hints) बनाम DNS फ़ॉरवर्डर्स (Forwarders)
जब कोई कर्मचारी अपने ऑफिस लैपटॉप पर बाहरी वेबसाइट (जैसे `google.com`) खोलता है, तो हमारा आंतरिक DNS सर्वर उसे कैसे खोजता है?

- #text(weight: "bold", fill: rtech-navy)[रूट हिंट्स (Root Hints):] दुनिया में 13 वैश्विक लॉजिकल रूट सर्वर क्लस्टर्स हैं (`a.root-servers.net` से `m.root-servers.net`)। यदि कोई फॉरवर्ड न हो, तो हमारा सर्वर सीधे रूट से पूछना शुरू करता है (रूट -> .com TLD -> google.com)। यह धीमा होता है।
- #text(weight: "bold", fill: rtech-emerald)[DNS फ़ॉरवर्डर्स (Forwarders - Best Practice):] हम अपने स्थानीय DNS सर्वर को निर्देश देते हैं कि जो भी बाहरी डोमेन तुम्हें न पता हो, वह सीधे हमारे अपस्ट्रीम ISP या विश्वसनीय पब्लिक DNS सर्वर्स से पूछो:
  - Primary Forwarder: #hl-green[`1.1.1.1`] (Cloudflare)
  - Secondary Forwarder: #hl-green[`8.8.8.8`] (Google DNS)
  - *लाभ:* इंटरनेट ब्राउजिंग अत्यधिक तेज हो जाती है और बाहरी उत्तर लोकल कैश में स्टोर हो जाते हैं।

#v(6pt)

=== 9.6 स्टेल रिकॉर्ड्स हटाना: DNS एजिंग एवं स्कैवेंजिंग (Aging & Scavenging)
जब सैकड़ों लैपटॉप वाई-फाई से जुड़ते और डिस्कनेक्ट होते हैं, तो DNS डेटाबेस में हजारों पुराने और मृत रिकॉर्ड्स (Stale Records) जमा हो जाते हैं। इसे स्वचालित साफ करने के लिए #hl-yellow[Aging & Scavenging] सक्षम किया जाता है:

1. #text(weight: "bold")[No-refresh interval (डिफ़ॉल्ट 7 दिन):] इस अवधि के दौरान यदि क्लाइंट दोबारा वही IP रिफ्रेश करता है, तो DNS टाइमस्टैम्प को अपडेट नहीं करता (ताकि सर्वर का रेप्लिकेशन ट्रैफिक न बढ़े)।
2. #text(weight: "bold")[Refresh interval (डिफ़ॉल्ट 7 दिन):] इस अवधि में क्लाइंट टाइमस्टैम्प को रिफ्रेश कर सकता है।
3. #text(weight: "bold")[Scavenging Period (डिफ़ॉल्ट 7 दिन):] सर्वर एक स्वीपर की तरह सफाई चलाता है। यदि किसी रिकॉर्ड का टाइमस्टैम्प 14 दिनों (7 + 7 दिन) से पुराना है और रिफ्रेश नहीं हुआ, तो DNS उसे डेटाबेस से हमेशा के लिए डिलीट कर देता है!

#v(8pt)

// =============================================================================
// CHAPTER 09 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows Server 2025 में DNS में नेटिव #hl-yellow[DoH (DNS over HTTPS)] सपोर्ट शामिल किया गया है। इसका अर्थ है कि सर्वर से बाहर इंटरनेट पर जाने वाली सभी DNS क्वेरीज अब सादे टेक्स्ट (Cleartext UDP 53) में जाने के बजाय #hl-green[HTTPS (#hl-green[Port 443])] के जरिए पूरी तरह एनक्रिप्ट होकर जाती हैं, जिससे आईएसपी या हैकर कभी यह नहीं देख सकते कि कंपनी के अंदर कर्मचारी किन डोमेन्स को एक्सेस कर रहे हैं!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 09 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "एक्टिव डायरेक्टरी-इंटीग्रेटेड DNS ज़ोन (AD-Integrated Zone) का डेटाबेस किस फाइल में स्टोर होता है?",
  optA: "system32\\dns\\zone.dns फाइल में",
  optB: "एक्टिव डायरेक्टरी डेटाबेस ntds.dit के अंदर",
  optC: "Windows Registry में",
  optD: "SYSVOL शेयर्ड फोल्डर में",
  ans: "B",
  exp: "AD-Integrated ज़ोन सीधे ntds.dit में स्टोर होता है जिससे मल्टी-मास्टर रेप्लिकेशन और एनक्रिप्शन मिलता है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "#hl-yellow[रिवर्स लुकअप ज़ोन] में किसी IP पते को होस्टनेम में मैप करने वाले आधिकारिक रिकॉर्ड का क्या नाम है?",
  optA: "A Record",
  optB: "CNAME Record",
  optC: "PTR Record",
  optD: "MX Record",
  ans: "C",
  exp: "Pointer (PTR) रिकॉर्ड IP पते को संबंधित Hostname में बदलने का कार्य करता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "एक्टिव डायरेक्टरी डोमेन कंट्रोलर, #hl-orange[Kerberos] और LDAP सेवाओं की खोज के लिए किस विशेष DNS रिकॉर्ड का उपयोग किया जाता है?",
  optA: "TXT Record",
  optB: "SRV (Service Location) Record",
  optC: "SOA Record",
  optD: "NS Record",
  ans: "B",
  exp: "SRV रिकॉर्ड्स (_ldap._tcp.dc._msdcs) के द्वारा ही क्लाइंट्स डोमेन कंट्रोलर के पोर्ट और आईपी खोजते हैं।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "DNS सर्वर सामान्य नेम रेजोल्यूशन क्वेरी के लिए किस मानक पोर्ट और ट्रांसपोर्ट प्रोटोकॉल का उपयोग करता है?",
  optA: "TCP पोर्ट 80",
  optB: "UDP पोर्ट 53",
  optC: "TCP पोर्ट 445",
  optD: "UDP पोर्ट 67",
  ans: "B",
  exp: "मानक DNS क्वेरी UDP पोर्ट 53 पर होती है; बड़े ज़ोन ट्रांसफर TCP पोर्ट 53 पर होते हैं।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "DNS डेटाबेस से पुराने और अप्रयुक्त (Stale) डायनामिक रिकॉर्ड्स को स्वचालित रूप से हटाने की प्रक्रिया को क्या कहा जाता है?",
  optA: "Zone Transfer",
  optB: "#hl-yellow[Aging and Scavenging]",
  optC: "DNS Forwarding",
  optD: "Dynamic Registration",
  ans: "B",
  exp: "Aging और Scavenging प्रक्रिया समय सीमा समाप्त होने पर अप्रयुक्त डायनामिक रिकॉर्ड्स को स्वतः हटा देती है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'एक्टिव डायरेक्टरी-इंटीग्रेटेड ज़ोन और स्टैंडर्ड प्राइमरी ज़ोन में सुरक्षा और रेप्लिकेशन के नजरिए से क्या मुख्य अंतर है?'",
  a: "उत्तर: स्टैंडर्ड प्राइमरी ज़ोन एक सिंगल-मास्टर मॉडल है जहाँ केवल प्राइमरी सर्वर पर रिकॉर्ड लिखे जा सकते हैं और सेकेंडरी सर्वर्स पर जाने वाला ज़ोन ट्रांसफर अन-एनक्रिप्टेड होता है। इसके विपरीत AD-Integrated ज़ोन में मल्टी-मास्टर रेप्लिकेशन होता है (किसी भी DC पर रिकॉर्ड लिखा जा सकता है), डेटा #hl-orange[Kerberos] एनक्रिप्टेड होकर AD रेप्लिकेशन के साथ जाता है, और यह 'Secure Dynamic Updates' का समर्थन करता है ताकि गैर-डोमेन मशीनें फर्जी रिकॉर्ड न बना सकें।",
  tip: "Wipro, Infosys और TCS के L2 SysAdmin इंटरव्यू में यह सबसे निर्णायक तुलनात्मक सवाल है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'DNS Forwarders और Root Hints में क्या अंतर होता है, और प्रोडक्शन में किसे प्राथमिकता दी जाती है?'",
  a: "उत्तर: Root Hints 13 वैश्विक मूल सर्वर्स से सीधे इटरेटिव क्वेरी करते हैं जो अत्यधिक धीमी होती है। Forwarders किसी विशिष्ट अपस्ट्रीम DNS (उदा. 1.1.1.1 या ISP DNS) को क्वेरी भेजते हैं जो पहले से कैश्ड रिस्पॉन्स तुरंत लौटा देता है। प्रोडक्शन में हमेशा DNS Forwarders को प्राथमिकता दी जाती है क्योंकि यह बैंडविड्थ बचाता है और इंटरनेट एक्सेस को बहुत तेज करता है।",
  tip: "यह उत्तर सिद्ध करता है कि आप नेटवर्क ट्रैफिक और लेटेंसी ऑप्टिमाइज़ेशन की गहरी समझ रखते हैं।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'क्लाइंट मशीन पर 'nslookup' चलाने पर 'Default Server: Unknown' और IP एड्रेस 192.168.1.10 आ रहा है। इसे कैसे ठीक करेंगे?'",
  a: "उत्तर: 'Default Server: Unknown' आने का अर्थ है कि DNS सर्वर के पास अपने ही IP (192.168.1.10) के लिए '#hl-yellow[Reverse Lookup Zone]' में PTR रिकॉर्ड मौजूद नहीं है। इसे ठीक करने के लिए DNS कंसोल में 192.168.1.x सबनेट के लिए #hl-yellow[Reverse Lookup Zone] बनाएंगे और DC का PTR रिकॉर्ड जोड़ेंगे। उसके बाद nslookup तुरंत सर्वर का FQDN दिखाएगा।",
  tip: "L1/L2 हेल्पडेस्क ट्रबलशूटिंग का यह क्लासिक इंटरव्यू परिदृश्य है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'DNS Cache Poisoning क्या होती है और इससे कैसे बचा जाता है?'",
  a: "उत्तर: जब कोई अटैकर फर्जी DNS रिस्पॉन्स इंजेक्ट करके DNS सर्वर के कैश में किसी लोकप्रिय डोमेन (उदा. bank.com) को अपने दुर्भावनापूर्ण आईपी से मैप करवा देता है, तो इसे Cache Poisoning कहते हैं। इससे बचने के लिए विंडोज सर्वर में #hl-green[DNSSEC] (DNS Security Extensions) और Socket Pools सक्षम किए जाते हैं।",
  tip: "साइबर सुरक्षा और इंफ्रास्ट्रक्चर ऑडिट्स का यह पसंदीदा सवाल है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'DNS Scavenging को सक्षम करते समय किन दो जगहों पर सेटिंग्स ऑन करना अनिवार्य होता है?'",
  a: "उत्तर: Scavenging को दो स्तरों पर सक्षम करना अनिवार्य होता है: 1. ज़ोन स्तर पर (Zone Properties -> General -> Aging बटन -> 'Scavenge stale resource records' टिक करना), और 2. सर्वर स्तर पर (Server Properties -> Advanced -> 'Enable automatic scavenging of stale records' टिक करना)। यदि दोनों जगह टिक नहीं होगा, तो स्कैवेंजिंग कभी रन नहीं होगी।",
  tip: "यह सूक्ष्म व्यावहारिक ज्ञान इंटरव्यूअर को साबित करता है कि आपने वास्तव में लैब में इसे कॉन्फ़िगर किया है।"
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ DNS कमांड-लाइन ट्रबलशूटिंग मास्टरकिट (Essential Commands):]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-blue)[`ipconfig /flushdns`]: क्लाइंट मशीन के स्थानीय DNS कैश को खाली करता है (ताकि बदला हुआ IP तुरंत दिखे)।
      - #text(weight: "bold", fill: rtech-emerald)[`ipconfig /registerdns`]: क्लाइंट के Host (A) और PTR रिकॉर्ड्स को DNS सर्वर पर दोबारा डायनामिकली रजिस्टर करता है।
      - #text(weight: "bold", fill: rtech-amber)[`nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.rtechlab.local`]: यह पुष्टि करता है कि AD के SRV रिकॉर्ड्स सही काम कर रहे हैं।
      - #text(weight: "bold", fill: rtech-navy)[`dnscmd /clearcache`]: DNS सर्वर के पूरे इंटरनल रिजॉल्वर कैश को कमांड लाइन से खाली करता है।
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ अध्याय 09 सत्यापन चेकलिस्ट (DNS Architecture Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] #hl-yellow[Forward Lookup Zone] `corp.rtechlab.local` एक्टिव डायरेक्टरी-इंटीग्रेटेड है।
      - [ ] #hl-yellow[Reverse Lookup Zone] `1.168.192.in-addr.arpa` में DC का PTR रिकॉर्ड मौजूद है।
      - [ ] बाहरी इंटरनेट समाधान के लिए Forwarders में `1.1.1.1` और `8.8.8.8` कॉन्फ़िगर हैं।
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 09 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - DNS Active Directory का जीवन आधार है; SRV रिकॉर्ड्स डोमेन कंट्रोलर और Kerberos की पहचान कराते हैं।
      - प्रोडक्शन में हमेशा AD-Integrated ज़ोन और 1.1.1.1 / 8.8.8.8 पर आधारित DNS Forwarders का उपयोग करें।
      - स्टेल रिकॉर्ड्स को हटाने के लिए ज़ोन और सर्वर दोनों स्तरों पर Aging & Scavenging सक्षम करना अनिवार्य है।
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 10: FILE SERVER RESOURCE MANAGER (#hl-orange[FSRM]), NTFS & QUOTA MANAGEMENT
// =============================================================================

[#metadata("ch10") <chapter-10>]

#chapter-header(
  chapter-num: "CHAPTER 10",
  category: "भाग 10 : स्टोरेज, शेयरिंग एवं फाइल रिसोर्स मैनेजमेंट (Storage & #hl-orange[FSRM])",
  title: "फाइल सर्वर रिसोर्स मैनेजर (#hl-orange[FSRM]), NTFS अनुमतियां एवं कोटा प्रबंधन",
  subtitle: "शेयर्ड फ़ोल्डर्स · SMB 3.1.1 · शेयर vs NTFS अनुमतियां (इफेक्टिव फॉर्मूला) · #hl-orange[FSRM] रोल · हार्ड vs सॉफ्ट स्टोरेज कोटा · फाइल स्क्रीनिंग (MP3/EXE ब्लॉक) · स्टोरेज रिपोर्ट्स"
)

=== 10.1 एंटरप्राइज फाइल शेयरिंग आर्किटेक्चर एवं SMB 3.1.1 प्रोटोकॉल
किसी भी कॉर्पोरेट संगठन में कर्मचारियों का दैनिक कार्य फाइलों (Word, Excel, PDFs, प्रोजेक्ट कोड) के लेन-देन पर निर्भर होता है। यदि सभी कर्मचारी डेटा को अपने निजी लैपटॉप पर रखेंगे, तो लैपटॉप खोने पर कंपनी का संपूर्ण डेटा नष्ट हो सकता है।

#mark-yellow[फाइल सर्वर (File Server) एक केंद्रीय सर्वर होता है जो नेटवर्क पर सभी विभागों (HR, Accounts, Legal) के साझा डेटा को सुरक्षित स्टोर करता है और SMB (Server Message Block) प्रोटोकॉल के जरिए एक्सेस प्रदान करता है।]

विंडोज सर्वर 2025 में फाइल शेयरिंग #hl-green[SMB 3.1.1] पर आधारित है:
- डिफ़ॉल्ट पोर्ट: #hl-green[TCP Port 445]
- #text(weight: "bold", fill: rtech-navy)[SMB Signing (हस्ताक्षर):] Server 2025 में डिफ़ॉल्ट अनिवार्य (Mandatory) है जो मैन-इन-द-मिडिल रिले अटैक्स को रोकता है।
- #text(weight: "bold", fill: rtech-navy)[SMB Encryption:] एंड-टू-एंड AES-256-GCM एनक्रिप्शन जो अनधिकृत नेटवर्क स्निफिंग से डेटा सुरक्षित रखता है।

#v(4pt)

=== 10.2 शेयर अनुमतियां (Share Permissions) बनाम NTFS अनुमतियां
यह विंडोज इंफ्रास्ट्रक्चर के सबसे महत्वपूर्ण विषयों में से एक है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ntfs_vs_share_matrix.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 10.1: शेयर अनुमतियां बनाम NTFS अनुमतियां — इफेक्टिव परमिशन फॉर्मूला एवं मोस्ट रेस्ट्रिक्टिव नियम]
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "शेयर अनुमतियां (Share Permissions)")[
      - केवल तभी लागू होती हैं जब यूजर नेटवर्क के जरिए शेयर्ड फोल्डर को एक्सेस करता है (`\\Server\Share`)।
      - यदि यूजर सर्वर पर स्थानीय रूप से लॉगिन है, तो शेयर परमिशन काम नहीं करती।
      - केवल 3 स्तर होते हैं: #hl-yellow[Read], #hl-green[Change], और #hl-orange[Full Control]।
    ]
  ],
  [
    #info-box(title: "NTFS सुरक्षा अनुमतियां (Security Permissions)")[
      - स्थानीय (Local) और नेटवर्क (Network) दोनों तरह के एक्सेस पर 100% लागू होती हैं।
      - NTFS फॉर्मेटेड वॉल्यूम पर ही कार्य करती हैं।
      - अत्यधिक विस्तृत स्तर: #hl-yellow[Read], #hl-green[Write], #hl-orange[Modify], #hl-green[Read & Execute], और #hl-orange[Full Control]।
    ]
  ]
)

#v(6pt)

=== 10.3 इफेक्टिव परमिशंस नियम (The Most Restrictive Rule)
जब कोई यूजर नेटवर्क से किसी फोल्डर में फाइल खोलने का प्रयास करता है, तो विंडोज शेयर परमिशन और NTFS परमिशन दोनों की तुलना करता है:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[इफेक्टिव परमिशन का कॉर्पोरेट फॉर्मूला (The Golden Law):]\
    #align(center)[#text(size: 9.5pt, weight: "black", fill: rtech-navy)[
      Effective Permission = Most Restrictive (Share Permission, NTFS Permission)
    ]]\
    #text(size: 7.5pt, fill: rtech-text)[
      - *उदाहरण 1:* यदि Share परमिशन = #hl-green[Read] है और NTFS परमिशन = #hl-green[Full Control] है, तो प्रभावी परमिशन केवल #mark-yellow[Read] होगी (यूजर फाइल में बदलाव नहीं कर पाएगा)!
      - *उदाहरण 2:* यदि Share परमिशन = #hl-green[Full Control] है और NTFS परमिशन = #hl-green[Modify] है, तो प्रभावी परमिशन #mark-green[Modify] होगी!
      - #text(weight: "bold", fill: rtech-blue)[एंटरप्राइज बेस्ट प्रैक्टिस:] शेयर परमिशन को हमेशा `Authenticated Users = Change` (या `Full Control`) पर खुला छोड़ें, और वास्तविक सुरक्षा अनुमतियां केवल *NTFS ACLs* के जरिए नियंत्रित करें!
    ]
  ]
)

#v(6pt)

=== 10.4 फाइल सर्वर रिसोर्स मैनेजर (#hl-orange[FSRM]) रोल इंस्टॉलेशन
#hl-orange[FSRM] माइक्रोसॉफ्ट का उन्नत स्टोरेज प्रबंधन टूल है जो उपयोगकर्ताओं द्वारा डिस्क स्पेस की बर्बादी और अनधिकृत फाइलों को रोकने की सुविधा देता है:

1. #hl-yellow[Server Manager] -> #hl-green[Add Roles and Features] में जाएं।
2. Server Roles -> #text(weight: "bold")[File and Storage Services] -> #text(weight: "bold")[File and iSCSI Services] का विस्तार करें।
3. #mark-yellow[File Server Resource Manager] चेकबॉक्स पर टिक करें।
4. 'Add Features' (FSRM टूल्स) चुनकर 'Install' करें।
5. इंस्टॉलेशन के बाद Tools मेनू से #hl-green[File Server Resource Manager] खोलें (या रन में टाइप करें: #mark-green[`fsrm.msc`])।

#v(6pt)

=== 10.5 स्टोरेज कोटा प्रबंधन: हार्ड कोटा बनाम सॉफ्ट कोटा (Quota Management)
बिना कोटा नियंत्रण के कोई भी कर्मचारी सर्वर पर सैकड़ों गीगाबाइट की निजी फाइलें अपलोड करके पूरी हार्ड डिस्क भर सकता है:

- #text(weight: "bold", fill: rtech-rose)[हार्ड कोटा (Hard Quota):] यह एक सख्त सीमा है। जैसे ही यूजर की स्टोरेज सीमा 100% (उदा. 10 GB) तक पहुंचती है, विंडोज उसे आगे 1 बाइट भी लिखने नहीं देता और स्क्रीन पर 'There is not enough space on the disk' का एरर आ जाता है।
- #text(weight: "bold", fill: rtech-amber)[सॉफ्ट कोटा (Soft Quota):] यह केवल निगरानी सीमा है। जब यूजर 100% स्पेस भर लेता है, तब भी फाइल सेविंग ब्लॉक नहीं होती, लेकिन सिस्टम एडमिनिस्ट्रेटर और यूजर को ईमेल चेतावनी भेजी जाती है ताकि वे अतिरिक्त स्टोरेज खरीद सकें।

*कोटा कॉन्फ़िगरेशन चरण:*
1. `fsrm.msc` में बाईं ओर #hl-yellow[Quota Management -> Quotas] पर जाएं।
2. दाईं ओर 'Create Quota...' पर क्लिक करें।
3. Quota path: अपने शेयर्ड फोल्डर का पाथ चुनें (उदा. `C:\Shares\HR_Data`)।
4. 'Derive properties from this quota template': #hl-green['10 GB Limit (Hard Quota)'] चुनें।
5. Notification Thresholds: 85% और 95% भरने पर ऑटोमैटिक ईमेल अलर्ट टिक करें। 'Create' दबाएं।

#v(6pt)

=== 10.6 फाइल स्क्रीनिंग (File Screening): ऑडियो, वीडियो एवं मैलवेयर ब्लॉक करना
कर्मचारी अक्सर कंपनी के सर्वर पर पाइरेटेड फिल्में, गाने (`.mp3`, `.mp4`), या पर्सनल बैकअप स्टोर करने लगते हैं। फाइल स्क्रीनिंग इसे तत्काल रोक देती है:

1. FSRM कंसोल में जाएं: #hl-yellow[File Screening Management -> File Screens]।
2. 'Create File Screen...' पर क्लिक करें।
3. File screen path: `C:\Shares\` चुनें।
4. 'Block Audio and Video Files' टेम्पलेट चुनें (जिसमें `*.mp3`, `*.mp4`, `*.avi`, `*.mkv`, `*.wav` पहले से परिभाषित होते हैं)।
5. Screening Type में #mark-yellow[Active screening: Do not allow users to save unauthorized files] चुनें।
6. 'Create' दबाएं। अब यदि कोई यूजर उस फोल्डर में MP3 या MP4 फाइल कॉपी करने का प्रयास करेगा, तो विंडोज तुरंत #hl-orange['Access is Denied'] का डायलॉग दिखाकर फाइल को सेव होने से रोक देगा!

#v(6pt)

=== 10.7 ऑटोमेटेड स्टोरेज उपयोगिता रिपोर्ट्स (Storage Reports Management)
FSRM एडमिनिस्ट्रेटर को स्टोरेज की ऑडिट रिपोर्ट स्वचालित रूप से ईमेल करने की सुविधा देता है:
- #text(weight: "bold")[Duplicate Files Report:] डिस्क पर एक ही फाइल की डुप्लिकेट कॉपियां ढूंढकर स्टोरेज बचाता है।
- #text(weight: "bold")[Large Files Report:] 500 MB से बड़ी फाइलों की सूची निकालता है।
- #text(weight: "bold")[Least Recently Accessed Files:] वे पुरानी फाइलें जो 1 वर्ष से किसी ने नहीं खोलीं (आर्काइव करने योग्य)।

#v(8pt)

// =============================================================================
// CHAPTER 10 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  विंडोज सर्वर में एक जादुई फीचर होता है जिसे #hl-yellow[Volume Shadow Copies (#hl-green[VSS] / Previous Versions)] कहा जाता है। यदि कोई कर्मचारी गलती से 5 घंटे की मेहनत वाली Excel फाइल डिलीट कर दे या ओवरराइट कर दे, तो एडमिन को बैकअप टेप ढूंढने की जरूरत नहीं होती! कर्मचारी फाइल पर राइट-क्लिक करके #hl-green['Restore previous versions'] पर क्लिक करता है और सुबह 9:00 बजे की सुरक्षित कॉपी बिना एडमिन की मदद के खुद रिस्टोर कर लेता है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 10 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "यदि किसी शेयर्ड फोल्डर पर Share Permission 'Read' है और NTFS Permission 'Full Control' है, तो नेटवर्क से जुड़ने वाले यूजर की प्रभावी अनुमति (Effective Permission) क्या होगी?",
  optA: "Full Control",
  optB: "Modify",
  optC: "Read",
  optD: "Write Only",
  ans: "C",
  exp: "इफेक्टिव परमिशन का नियम है: Share और NTFS में से जो सबसे अधिक प्रतिबंधात्मक (Most Restrictive) हो, वही लागू होती है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "FSRM में उस कोटा प्रकार को क्या कहते हैं जो निर्धारित सीमा तक पहुंचने पर यूजर को आगे फाइलें सेव करने से पूरी तरह रोक देता है?",
  optA: "Soft Quota",
  optB: "Hard Quota",
  optC: "Dynamic Quota",
  optD: "Elastic Quota",
  ans: "B",
  exp: "Hard Quota सीमा पार होते ही 'Disk is full' एरर देकर राइट ऑपरेशन को 100% ब्लॉक कर देता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "कंपनी के शेयर्ड फोल्डर में कर्मचारियों द्वारा MP3 गाने और MP4 फिल्में सेव करने से रोकने के लिए FSRM के किस फीचर का उपयोग किया जाता है?",
  optA: "Storage Spaces",
  optB: "File Screening Management",
  optC: "DNS Scavenging",
  optD: "Shadow Copies",
  ans: "B",
  exp: "File Screening तकनीक प्रतिबंधित फाइल एक्सटेंशन (.mp3, .mp4, .exe) को स्टोरेज में सेव होने से रोकती है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "विंडोज सर्वर में File Server Resource Manager कंसोल को सीधे खोलने का आधिकारिक रन कमांड क्या है?",
  optA: "diskmgmt.msc",
  optB: "fsrm.msc",
  optC: "storagemgmt.msc",
  optD: "fsmgmt.msc",
  ans: "B",
  exp: "fsrm.msc सीधे File Server Resource Manager कंसोल को खोलता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "विंडोज सर्वर 2025 में फाइल शेयरिंग (SMB 3.1.1) डिफ़ॉल्ट रूप से किस मानक नेटवर्क पोर्ट पर संचालित होती है?",
  optA: "TCP पोर्ट 80",
  optB: "TCP पोर्ट 445",
  optC: "TCP पोर्ट 3389",
  optD: "UDP पोर्ट 53",
  ans: "B",
  exp: "SMB (Server Message Block) फाइल शेयरिंग आधिकारिक तौर पर TCP पोर्ट 445 पर कार्य करती है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'शेयर परमिशन और NTFS परमिशन में कौन अधिक शक्तिशाली है, और प्रोडक्शन में माइक्रोसॉफ्ट की आधिकारिक सिफारिश क्या है?'",
  a: "उत्तर: नेटवर्क एक्सेस के समय दोनों में से जो 'सबसे अधिक प्रतिबंधात्मक' (Most Restrictive) हो, वह लागू होती है। हालांकि स्थानीय एक्सेस पर केवल NTFS काम करती है। माइक्रोसॉफ्ट की आधिकारिक सर्वोत्तम प्रथा यह है कि शेयर परमिशन को 'Authenticated Users = Change' या 'Full Control' पर खुला रखा जाए, और सुरक्षा का संपूर्ण सूक्ष्म नियंत्रण (Granular Control) केवल NTFS ACLs द्वारा किया जाए क्योंकि NTFS में विरासत (Inheritance), ओनरशिप और 13 विस्तृत परमिशन स्तर उपलब्ध होते हैं।",
  tip: "Capgemini, Infosys और TCS के L1/L2 इंफ्रास्ट्रक्चर इंटरव्यू का यह क्लासिक प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'NTFS Permissions में 'Modify' और 'Write' परमिशन के बीच क्या अंतर होता है?'",
  a: "उत्तर: 'Write' परमिशन यूजर को नई फाइल बनाने और मौजूदा फाइल में डेटा जोड़ने का अधिकार देती है, लेकिन वह फाइल को 'डिलीट' नहीं कर सकता। 'Modify' परमिशन में Read, Write, Execute के साथ-साथ फाइलों और सब-फोल्डर्स को 'डिलीट' करने का पूर्ण अधिकार शामिल होता है।",
  tip: "यह सूक्ष्म अंतर अधिकांश छात्र नहीं जानते; सही उत्तर आपको तुरंत बढ़त दिलाता है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'FSRM में Active Screening और Passive Screening में क्या अंतर होता है?'",
  a: "उत्तर: Active Screening यूजर को प्रतिबंधित फाइल (उदा. song.mp3) सेव करने से तुरंत रोक देती है (Access Denied) और एडमिन को ईमेल भेजती है। Passive Screening यूजर को फाइल सेव करने देती है (काम नहीं रोकती), लेकिन बैकग्राउंड में इवेंट लॉग और एडमिन को ईमेल अलर्ट भेज देती है ताकि निगरानी रखी जा सके।",
  tip: "स्टोरेज एडमिनिस्ट्रेशन और कम्प्लायंस रोल्स में यह प्रश्न हमेशा पूछा जाता है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'Volume Shadow Copies (#hl-green[VSS]) क्या है, और यह डिस्क पर कितना स्पेस लेता है?'",
  a: "उत्तर: #hl-green[VSS] वॉल्यूम का पॉइंट-इन-टाइम ब्लॉक-लेवल स्नैपशॉट लेता है। यह पूरी फाइल की नई कॉपी नहीं बनाता, बल्कि केवल 'बदले हुए ब्लॉक्स' (Delta Changes) को 'System Volume Information' में स्टोर करता है। डिफ़ॉल्ट रूप से यह वॉल्यूम का अधिकतम 10% स्पेस लेता है और यूजर को 'Previous Versions' से स्वतः फाइल रिस्टोर करने की सुविधा देता है।",
  tip: "बैकअप और डेटा रिकवरी के इंटरव्यूज का यह मुख्य सवाल है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'Access-Based Enumeration (ABE) क्या है, और यह कर्मचारियों के लिए क्यों उपयोगी है?'",
  a: "उत्तर: ABE एक शानदार विंडोज फीचर है। इसके सक्षम होने पर यूजर को शेयर्ड ड्राइव के अंदर केवल वही फोल्डर्स दिखाई देते हैं जिन पर उसके पास कम से कम 'Read' परमिशन हो! जिन फोल्डर्स पर उसके पास परमिशन नहीं है, वे उसकी स्क्रीन से पूरी तरह गायब (Hide) हो जाते हैं। इससे कर्मचारियों में अनावश्यक जिज्ञासा और 'Access Denied' की हेल्पडेस्क कॉल्स 90% कम हो जाती हैं।",
  tip: "सीनियर सिस्टम एडमिनिस्ट्रेटर राउंड में ABE का व्यावहारिक उपयोग परखा जाता है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 10 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - इफेक्टिव परमिशन शेयर और NTFS का 'मोस्ट रेस्ट्रिक्टिव' नियम मानती है; परमिशन केवल NTFS ACLs द्वारा दें।
      - FSRM का Hard Quota डिस्क भरने से बचाता है और File Screening गैर-कॉर्पोरेट फाइलों (MP3/MP4) को ब्लॉक करती है।
      - #hl-green[VSS] Shadow Copies और Access-Based Enumeration (ABE) एंटरप्राइज फाइल सर्वर की यूजर फ्रेंडली क्षमता को बढ़ाते हैं।
    ]
  ]
)

#pagebreak()

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
1. #hl-yellow[Server Manager] -> #hl-green[Add Roles and Features] पर जाएं।
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

=== 11.3 SSL/TLS HTTPS सर्टिफिकेट बाइंडिंग (#hl-green[Port 443])
उत्पादन वातावरण में कोई भी वेब पोर्टल बिना एन्क्रिप्शन (HTTP #hl-green[Port 80]) के नहीं चलाया जाता:
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
    - #text(weight: "bold", fill: rtech-rose)[2. RD Gateway:] बाहरी इंटरनेट से आने वाले RDP ट्रैफिक को #hl-orange[HTTPS (#hl-green[Port 443])] के अंदर एनकैप्सुलेट करता है, जिससे बिना VPN के फ़ायरवॉल को पार किया जा सकता है।
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

// =============================================================================
// CHAPTER 12: WINDOWS SERVER 2025 NEXT-GEN FEATURES & HYBRID AZURE ARC
// =============================================================================

[#metadata("ch12") <chapter-12>]

#chapter-header(
  chapter-num: "CHAPTER 12",
  category: "भाग 12 : नेक्स्ट-जेन फीचर्स एवं हाइब्रिड क्लाउड (Server 2025 Flagship & Azure)",
  title: "Windows Server 2025 नेक्स्ट-जेन फीचर्स, स्टोरेज स्पेसेस एवं हाइब्रिड #hl-green[अज़ूर आर्क]",
  subtitle: "Server 2025 के 5 क्रांतिकारी फीचर्स · #hl-yellow[हॉटपैचिंग] (Zero-Reboot Live Patching) · 32KB AD DB पेज साइज · नेक्स्ट-जेन S2D व #hl-green[ReFS] डिडुप · #hl-orange[SMB over QUIC] · #hl-green[Azure Arc] एकीकरण"
)

=== 12.1 Windows Server 2025 के 5 सबसे बड़े क्रांतिकारी फीचर्स
Windows Server 2025 केवल एक सामान्य अपग्रेड नहीं है, बल्कि यह पिछले एक दशक का सबसे बड़ा एंटरप्राइज आर्किटेक्चरल बदलाव है। माइक्रोसॉफ्ट ने ऑन-प्रिमाइसेस डेटा सेंटर और क्लाउड के बीच की खाई को हमेशा के लिए समाप्त कर दिया है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server2025_azure_hotpatching.png", width: 56%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 12.1: Windows Server 2025 नेक्स्ट-जेन 5 फ्लैगशिप स्तंभ — #hl-yellow[हॉटपैचिंग], 32KB AD, #hl-orange[SMB over QUIC], S2D एवं Azure Arc]
]

#v(4pt)

=== 12.2 #hl-yellow[हॉटपैचिंग] (#hl-yellow[Hotpatching] for Everyone) — बिना रीबूट लाइव मेमोरी सुरक्षा पैच
पारंपरिक आईटी दुनिया में सिस्टम एडमिनिस्ट्रेटर का सबसे बड़ा सिरदर्द हर महीने का दूसरा मंगलवार (#hl-yellow['Patch Tuesday']) होता था। प्रोडक्शन सर्वर्स पर सिक्योरिटी पैच लगाने के बाद सर्वर को रीबूट करना पड़ता था, जिसके लिए रात के 2:00 बजे मेंटेनेंस विंडो लेनी पड़ती थी और बैंकिंग/ई-कॉमर्स सेवाएं बंद करनी पड़ती थीं।

#mark-yellow[हॉटपैचिंग (#hl-yellow[Hotpatching]) एक क्रांतिकारी सुरक्षा तकनीक है जिसके द्वारा विंडोज सर्वर ऑपरेटिंग सिस्टम के बाइनरी कोड और रनिंग प्रोसेस मेमोरी को इन-प्लेस पैच कर दिया जाता है — बिना सर्वर को एक बार भी रीबूट किए!]

- #text(weight: "bold", fill: rtech-emerald)[अभूतपूर्व उपलब्धता (99.999% Uptime):] क्रिटिकल डेटाबेस और एक्टिव डायरेक्टरी सर्वर्स पूरे वर्ष बिना एक सेकंड के डाउनटाइम के चलते रहते हैं।
- #text(weight: "bold", fill: rtech-blue)[हॉटपैचिंग कैसे काम करती है?] माइक्रोसॉफ्ट हर तिमाही (3 महीने) में एक क्युमुलेटिव बेसलाइन जारी करता है, और बीच के महीनों में छोटे लाइव-मेमोरी पैचेस रिलीज करता है जो तत्काल सक्रिय हो जाते हैं।

#v(6pt)

=== 12.3 32KB AD DS डेटाबेस पेज साइज — 25 वर्षों में सबसे बड़ा स्पीड बूस्ट
जैसा कि हमने अध्याय 01 में देखा, Windows 2000 Server से लेकर Server 2022 तक पूरे 25 वर्षों तक एक्टिव डायरेक्टरी के डेटाबेस (`ntds.dit`) का ब्लॉक साइज केवल #hl-orange[8 KB] था। 
- Windows Server 2025 में जब फ़ॉरेस्ट और डोमेन फंक्शनल लेवल को 'Windows Server 2025' पर प्रमोट किया जाता है, तो AD डेटाबेस पेज साइज को #mark-green[32 KB] पर अपग्रेड कर दिया जाता है।
- इससे एक ही डिस्क I/O में चार गुना अधिक डायरेक्टरी ट्री लोड होता है, जिससे बड़े बहुराष्ट्रीय संगठनों में LDAP सर्च क्वेरीज और #hl-orange[Kerberos] टोकन जेनरेशन में #hl-green[300% से अधिक की तेजी] दर्ज की गई है।

#v(6pt)

=== 12.4 नेक्स्ट-जेन स्टोरेज स्पेसेस डायरेक्ट (S2D) एवं #hl-green[ReFS] डिडुप्लीकेशन
- #text(weight: "bold", fill: rtech-navy)[NVMe नेटिव एक्सलेरेशन:] Server 2025 अब PCIe Gen 5 NVMe SSDs के लिए नेटिव कर्नल ड्राइवर्स के साथ आता है, जिससे IOPS (Input/Output Operations Per Second) में 70% की वृद्धि होती है।
- #text(weight: "bold", fill: rtech-emerald)[ReFS डिडुप्लीकेशन एवं कम्प्रेशन:] Resilient File System (#hl-green[ReFS]) अब रियल-टाइम में स्टोरेज के डुप्लिकेट डेटा को पहचानकर कम्प्रेस करता है। यदि आपके पास 50 वर्चुअल मशीनें हैं, तो #hl-green[ReFS] उनके 70% डुप्लिकेट OS ब्लॉक्स को एक ही बार लिखकर #hl-green[60% से 80% स्टोरेज स्पेस की तत्काल बचत] करता है!

#v(6pt)

=== 12.5 #hl-orange[SMB over QUIC] — बिना VPN के इंटरनेट पर सुरक्षित फाइल शेयरिंग
पारंपरिक SMB फाइल शेयरिंग (#hl-green[Port 445]) को इंटरनेट सर्विस प्रोवाइडर्स (ISPs) द्वारा ब्लॉक कर दिया जाता है ताकि WannaCry जैसे रैनसमवेयर न फैल सकें। इसके कारण रिमोट कर्मचारियों को फाइल सर्वर एक्सेस करने के लिए धीमा और जटिल VPN चालू करना पड़ता था।

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[SMB over QUIC का जादू (Zero-VPN File Access):]\
    - यह SMB ट्रैफिक को गूगल द्वारा विकसित #hl-green[QUIC प्रोटोकॉल (UDP #hl-green[Port 443])] के अंदर एनकैप्सुलेट करता है।
    - चूंकि UDP 443 (मानक वेब ट्रैफिक) दुनिया के हर एयरपोर्ट, कैफे, और होटल के वाई-फाई पर हमेशा खुला रहता है, इसलिए कर्मचारी बिना किसी VPN के सीधे `\\files.corp.rtechlab.local\Share` खोल सकते हैं!
    - संपूर्ण ट्रैफिक अत्याधुनिक #hl-green[TLS 1.3] एन्क्रिप्शन और मशीन सर्टिफिकेट्स द्वारा 100% अभेद्य सुरक्षित होता है।
  ]
)

#v(6pt)

=== 12.6 हाइब्रिड क्लाउड एकीकरण: #hl-green[Azure Arc] कनेक्टेड मशीन एजेंट
Windows Server 2025 में #hl-yellow[Server Manager] के अंदर ही #hl-yellow[Azure Arc] का नेटिव विजेट दिया गया है:
- *#hl-green[Azure Arc] क्या है?* यह एक हाइब्रिड ब्रिज है। जब आप अपने लोकल फिजिकल या वर्चुअल सर्वर पर `AzureConnectedMachineAgent` रन करते हैं, तो आपका लोकल सर्वर Microsoft Azure पोर्टल पर एक अधिकृत क्लाउड रिसोर्स के रूप में दिखने लगता है।
- *कॉर्पोरेट लाभ:* आप एक ही Azure वेब कंसोल से अपने मुंबई ऑफिस के फिजिकल सर्वर, अमेज़न AWS में चल रही VM, और Azure क्लाउड के सर्वर्स पर एक साथ माइक्रोसॉफ्ट डिफ़ेंडर नीतियां, #hl-yellow[हॉटपैचिंग], और कंप्लायंस ऑडिट लागू कर सकते हैं।

#v(8pt)

// =============================================================================
// CHAPTER 12 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  माइक्रोसॉफ्ट के इतिहास में पहली बार Windows Server 2025 में #hl-yellow[नेटिव वाई-फाई (Native Wi-Fi Support)] और ब्लूटूथ वायरलेस नेटवर्किंग को आउट-ऑफ-द-बॉक्स शामिल किया गया है! पहले सर्वर ओएस में वाई-फाई डिसेबल रहता था। आज के एज कंप्यूटिंग (Edge Servers) और रिटेल स्टोर्स में जहाँ लैन केबल खींचना संभव नहीं होता, वहाँ सर्वर सीधे हाई-स्पीड Wi-Fi 6E/7 से कनेक्ट हो सकता है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 12 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "Windows Server 2025 के किस क्रांतिकारी फीचर के कारण रनिंग मेमोरी में सिक्योरिटी पैच लगाए जाते हैं और सर्वर को रीबूट नहीं करना पड़ता?",
  optA: "Hyper-V Quick Migration",
  optB: "#hl-yellow[Hotpatching]",
  optC: "BitLocker Live",
  optD: "DirectAccess",
  ans: "B",
  exp: "#hl-yellow[Hotpatching] रनिंग प्रोसेस मेमोरी को इन-प्लेस पैच करती है जिससे सर्वर को रीस्टार्ट करने की आवश्यकता समाप्त हो जाती है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "Windows Server 2025 में एक्टिव डायरेक्टरी डेटाबेस (ntds.dit) का इंटरनल पेज साइज बढ़ाकर कितना किया गया है?",
  optA: "4 KB",
  optB: "8 KB",
  optC: "16 KB",
  optD: "32 KB",
  ans: "D",
  exp: "Server 2025 में 25 वर्षों बाद AD डेटाबेस पेज साइज को 8 KB से बढ़ाकर 32 KB किया गया है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "#hl-orange[SMB over QUIC] फीचर रिमोट यूजर्स को बिना कॉर्पोरेट VPN के किस नेटवर्क पोर्ट और प्रोटोकॉल पर सुरक्षित फाइल एक्सेस प्रदान करता है?",
  optA: "TCP पोर्ट 445",
  optB: "UDP पोर्ट 443 (TLS 1.3)",
  optC: "TCP पोर्ट 80",
  optD: "UDP पोर्ट 53",
  ans: "B",
  exp: "#hl-orange[SMB over QUIC] ट्रैफिक को UDP पोर्ट 443 पर TLS 1.3 एन्क्रिप्शन के साथ भेजता है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "ऑन-प्रिमाइसेस लोकल डेटा सेंटर के विंडोज सर्वर्स को माइक्रोसॉफ्ट अज़ूर क्लाउड पोर्टल से केंद्रीय रूप से जोड़ने वाले एजेंट का क्या नाम है?",
  optA: "Hyper-V Connect",
  optB: "#hl-green[Azure Arc] Connected Machine Agent",
  optC: "System Center CLI",
  optD: "ExpressRoute Agent",
  ans: "B",
  exp: "#hl-green[Azure Arc] Connected Machine Agent लोकल सर्वर्स को Azure Resource Manager से जोड़ता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "Windows Server 2025 में किस आधुनिक फाइल सिस्टम के अंतर्गत रियल-टाइम डिडुप्लीकेशन और कम्प्रेशन पेश किया गया है?",
  optA: "FAT32",
  optB: "exFAT",
  optC: "#hl-green[ReFS] (Resilient File System)",
  optD: "NFS v4",
  ans: "C",
  exp: "#hl-green[ReFS] (Resilient File System) में नेक्स्ट-जेन डिडुप्लीकेशन और कम्प्रेशन दिया गया है जो भारी स्टोरेज बचाता है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: '#hl-yellow[Hotpatching] से एंटरप्राइज को व्यावसायिक रूप से क्या लाभ मिलता है?'",
  a: "उत्तर: व्यावसायिक रूप से #hl-yellow[हॉटपैचिंग] डाउनटाइम को 90% से अधिक घटा देती है। 24/7 चलने वाले अस्पतालों, बैंकों और ई-कॉमर्स साइट्स पर मेंटेनेंस विंडोज़ के लिए सिस्टम बंद करने की आवश्यकता नहीं होती, एडमिनिस्ट्रेटर को वीकेंड पर देर रात तक जागकर पैचिंग नहीं करनी पड़ती, और रीबूट के दौरान होने वाले संभावित बूट क्रैश का जोखिम शून्य हो जाता है।",
  tip: "L2/L3 इंटरव्यू में व्यावसायिक प्रभाव (Business ROI) समझाने पर बहुत उच्च रेटिंग मिलती है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: '#hl-orange[SMB over QUIC] पारम्परिक SMB over VPN से बेहतर क्यों माना जाता है?'",
  a: "उत्तर: पारम्परिक SMB (TCP 445) हाई लेटेंसी वाले इंटरनेट कनेक्शन पर बहुत धीमा काम करता है (Chatty Protocol) और पूरे नेटवर्क का VPN टनल बनाना सुरक्षा जोखिम पैदा करता है। QUIC (UDP 443) पैकेट लॉस और लेटेंसी को अत्यधिक कुशलता से संभालता है, कनेक्शन माइग्रेशन का समर्थन करता है (वाई-फाई से 4G/5G पर स्विच होने पर भी सेशन नहीं टूटता), और एंड-टू-एंड TLS 1.3 एनक्रिप्टेड रहता है।",
  tip: "यह आधुनिक एंटरप्राइज मोबिलिटी और हाइब्रिड वर्कफोर्स का सबसे उन्नत उत्तर है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: '32KB AD DS डेटाबेस पेज साइज सक्षम करने के लिए क्या पूर्व-आवश्यकता होती है?'",
  a: "उत्तर: पूरे फ़ॉरेस्ट और डोमेन का फंक्शनल लेवल 'Windows Server 2025' होना अनिवार्य है (अर्थात नेटवर्क में कोई पुराना Server 2016/2019/2022 DC नहीं होना चाहिए)। इसके बाद PowerShell कमांड 'Enable-ADOptionalFeature' द्वारा 32KB डेटाबेस फीचर सक्षम किया जाता है। एक बार सक्षम होने के बाद इसे रोलबैक नहीं किया जा सकता।",
  tip: "माइग्रेशन और अपग्रेड प्रोजेक्ट्स से जुड़ा यह अत्यंत तकनीकी प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: '#hl-green[Azure Arc] सक्षम सर्वर पर Microsoft Defender for Cloud क्या सुरक्षा लाभ देता है?'",
  a: "उत्तर: यह ऑन-प्रिमाइसेस सर्वर पर लाइव थ्रेट इंटेलिजेंस, मैलवेयर डिटेक्शन, वल्नरेबिलिटी असेसमेंट, और सीआईएस (CIS) सुरक्षा मानकों के अनुपालन की रीयल-टाइम रिपोर्ट Azure क्लाउड डैशबोर्ड पर देता है। यदि लोकल सर्वर पर कोई ब्रूट-फोर्स या रैंसमवेयर गतिविधि होती है, तो क्लाउड तत्काल सुरक्षा अलर्ट जारी करता है।",
  tip: "सिक्योरिटी ऑपरेशंस (SOC) और हाइब्रिड क्लाउड सपोर्ट में यह सवाल पूछा जाता है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'Next-Gen #hl-yellow[Storage Spaces Direct] (S2D) में NVMe ड्राइव्स का क्या उपयोग है?'",
  a: "उत्तर: S2D क्लस्टर में सर्वर के स्थानीय NVMe SSDs को एक शेयर्ड वर्चुअल SAN स्टोरेज पूल में जोड़ दिया जाता है। PCIe Gen 5 बस के जरिए डेटा सीधे रैम और सीपीयू कैश के करीब ट्रांसफर होता है, जिससे पारंपरिक महंगे SAN स्टोरेज बॉक्स (Dell EMC / NetApp) की आवश्यकता समाप्त हो जाती है और करोड़ों रुपये की हार्डवेयर लागत बचती है।",
  tip: "HCI (Hyper-Converged Infrastructure) और वर्चुअलाइजेशन स्पेशलिस्ट राउंड का कोर सवाल।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 12 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - #hl-yellow[Hotpatching] बिना रीबूट लाइव मेमोरी पैचिंग देकर 99.999% सर्वर अपटाइम सुनिश्चित करती है।
      - SMB over QUIC पोर्ट 443 पर बिना VPN के सुरक्षित रिमोट फाइल शेयरिंग सक्षम करता है।
      - 32KB AD DB और Azure Arc विंडोज सर्वर 2025 को दुनिया का सबसे तेज हाइब्रिड क्लाउड ओएस बनाते हैं।
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 13: BACKUP, DISASTER RECOVERY & ACTIVE DIRECTORY RECYCLE BIN
// =============================================================================

[#metadata("ch13") <chapter-13>]

#chapter-header(
  chapter-num: "CHAPTER 13",
  category: "भाग 13 : डिज़ास्टर रिकवरी एवं डेटा संरक्षण (Disaster Recovery & Backup)",
  title: "सर्वर बैकअप, डिज़ास्टर रिकवरी एवं एक्टिव डायरेक्टरी रीसायकल बिन",
  subtitle: "3-2-1 एंटरप्राइज बैकअप रणनीति · #hl-yellow[Windows Server Backup] · फुल vs #hl-yellow[सिस्टम स्टेट बैकअप] · AD रीसायकल बिन सक्षम करना · डिलीटेड यूजर की 1-क्लिक रिकवरी · wbadmin ऑटोमेशन"
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

=== 13.2 #hl-yellow[Windows Server Backup] फीचर इंस्टॉलेशन
माइक्रोसॉफ्ट विंडोज सर्वर में एक इन-बिल्ट बैकअप समाधान प्रदान करता है:

1. #hl-yellow[Server Manager] -> #hl-green[Add Roles and Features] में जाएं।
2. Features स्क्रीन तक 'Next' दबाएं।
3. सूची में खोजें: #mark-yellow[Windows Server Backup] चेकबॉक्स पर टिक करें।
4. 'Install' पर क्लिक करें। यह टूल GUI कंसोल (`wbadmin.msc`) और पावरफुल कमांड-लाइन यूटिलिटी (`wbadmin.exe`) दोनों प्रदान करता है।

#v(6pt)

=== 13.3 फुल सर्वर बैकअप बनाम #hl-yellow[सिस्टम स्टेट बैकअप] (#hl-yellow[System State Backup])
- #text(weight: "bold", fill: rtech-navy)[बेयर मेटल रिकवरी (#hl-orange[Bare Metal Recovery] - BMR):] पूरे सर्वर (C: ड्राइव, सिस्टम पार्टिशन्स, एप्लीकेशंस और डेटा) का संपूर्ण बैकअप। यदि फिजिकल सर्वर हार्डवेयर पूरी तरह जल जाए, तो एक नए खाली सर्वर पर बूट डिस्क लगाकर हूबहू वही सर्वर वापस रीस्टोर किया जा सकता है।
- #text(weight: "bold", fill: rtech-blue)[सिस्टम स्टेट बैकअप (#hl-yellow[System State Backup]):] एक्टिव डायरेक्टरी डोमेन कंट्रोलर के लिए यह सबसे महत्वपूर्ण बैकअप है। इसमें केवल वे घटक शामिल होते हैं जो डायरेक्टरी को जीवित रखने के लिए अनिवार्य हैं:
  1. #hl-yellow[Active Directory Database (`ntds.dit`)]
  2. #hl-green[SYSVOL शेयर्ड फोल्डर (सभी GPOs और स्क्रिप्ट्स)]
  3. #hl-orange[विंडोज सिस्टम रजिस्ट्री (System Registry)]
  4. #hl-green[बूट फाइल्स एवं सिस्टम स्टार्टअप फाइल्स]
  5. #hl-green[Certificate Services डेटाबेस (यदि AD CS इंस्टॉल हो)]

*कमांड-लाइन से #hl-yellow[सिस्टम स्टेट बैकअप] लेने की मास्टर कमांड:*
```cmd
wbadmin start systemstatebackup -backupTarget:E: -quiet
```

#v(6pt)

=== 13.4 एक्टिव डायरेक्टरी रीसायकल बिन (AD Recycle Bin) को सक्षम करना
पुराने विंडोज सर्वर (2003/2008) में यदि किसी यूजर या OU को गलती से डिलीट कर दिया जाता था, तो उसे वापस पाने के लिए डोमेन कंट्रोलर को रीस्टार्ट करके #hl-orange[DSRM मोड (#hl-orange[Directory Services Restore Mode])] में ले जाना पड़ता था, नेटवर्क डाउन करना पड़ता था, और `ntdsutil` से 'Authoritative Restore' करना पड़ता था (कम से कम 2 से 3 घंटे का डाउनटाइम)।

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

1. #hl-yellow[Server Manager] -> Tools -> #hl-green[Active Directory Administrative Center (ADAC)] खोलें (या रन में टाइप करें: #mark-green[`dsac.exe`])।
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
:: डेली अनअटेंडेड #hl-yellow[सिस्टम स्टेट बैकअप] स्क्रिप्ट
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
  q: "एक्टिव डायरेक्टरी डोमेन कंट्रोलर के '#hl-yellow[System State Backup]' में निम्नलिखित में से कौन-सा घटक शामिल नहीं होता है?",
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
  q: "कमांड प्रॉम्प्ट से विंडोज सर्वर का तत्काल #hl-yellow[सिस्टम स्टेट बैकअप] शुरू करने के लिए किस आधिकारिक उपयोगिता का उपयोग किया जाता है?",
  optA: "robocopy.exe",
  optB: "wbadmin.exe",
  optC: "ntdsutil.exe",
  optD: "dcdiag.exe",
  ans: "B",
  exp: "wbadmin start systemstatebackup कमांड #hl-yellow[सिस्टम स्टेट बैकअप] प्रारंभ करने का आधिकारिक CLI टूल है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "डिलीट हुए यूजर को एक्टिव डायरेक्टरी रीसायकल बिन के जरिए 1 क्लिक में रिस्टोर करने के लिए किस ग्राफिकल टूल का उपयोग किया जाता है?",
  optA: "#hl-yellow[Active Directory Users and Computers] (dsa.msc)",
  optB: "#hl-yellow[Active Directory Administrative Center] (dsac.exe)",
  optC: "#hl-yellow[Group Policy Management Console] (gpmc.msc)",
  optD: "Disk Management (diskmgmt.msc)",
  ans: "B",
  exp: "#hl-yellow[Active Directory Administrative Center] (ADAC - dsac.exe) के अंदर 'Deleted Objects' कंटेनर उपलब्ध होता है।"
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
  q: "इंटरव्यूअर: '#hl-yellow[Active Directory Recycle Bin] को सक्षम करने के बाद क्या किसी डिलीटेड यूजर का पासवर्ड रिसेट करना पड़ता है?'",
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
  a: "उत्तर: नहीं, #hl-yellow[Windows Server Backup] कभी भी सिस्टम स्टेट बैकअप को उसी वॉल्यूम (C:) पर स्टोर करने की अनुमति नहीं देता जिस पर ऑपरेटिंग सिस्टम खुद चल रहा हो। इसके लिए एक अलग समर्पित भौतिक/वर्चुअल डिस्क (उदा. E: ड्राइव या नेटवर्क शेयर) होना अनिवार्य है।",
  tip: "प्रैक्टिकल इंप्लीमेंटेशन और लैब एक्सपीरियंस चेक करने वाला यह सटीक प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'यदि #hl-yellow[Active Directory Recycle Bin] फीचर को एक बार सक्षम कर दिया जाए, तो क्या इसे बाद में बंद किया जा सकता है?'",
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
      - #text(weight: "bold", fill: rtech-amber)[एरर 2: '#hl-green[VSS] Writer timed out (Event ID 8229)':] वॉल्यूम शैडो कॉपी सर्विस में किसी अन्य बैकअप एजेंट के टकराव के कारण होता है; `vssadmin list writers` चलाकर स्थिति जांचें।
      - #text(weight: "bold", fill: rtech-emerald)[एरर 3: 'Recycle Bin Deleted Objects फोल्डर नहीं दिख रहा':] #hl-yellow[Active Directory Administrative Center] (ADAC) को बंद करके दोबारा खोलें या F5 दबाकर रीफ्रेश करें।
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
      - [ ] #hl-yellow[Windows Server Backup] फीचर और PowerShell मॉड्यूल सफलतापूर्वक इंस्टॉल हैं।
      - [ ] #hl-yellow[Active Directory Recycle Bin] फीचर पूरे फ़ॉरेस्ट में स्थायी रूप से सक्षम है।
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
      - #hl-yellow[System State Backup] डोमेन कंट्रोलर के कोर घटकों (`ntds.dit`, `SYSVOL`, Registry) को सुरक्षित रखता है।
      - #hl-yellow[Active Directory Recycle Bin] आकस्मिक विलोपन पर बिना सर्वर रीबूट के 1-क्लिक लाइव रिकवरी प्रदान करता है।
    ]
  ]
)

#pagebreak()

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
