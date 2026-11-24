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


