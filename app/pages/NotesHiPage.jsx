import React, { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router';
import { WhatsAppCommunityCard } from '../components/WhatsAppCommunityCard';

// ── 6 आधिकारिक RTECHLAB विषय (सटीक क्रम एवं वास्तविक पेज संख्या) ────────
const SUBJECTS_HI = [
  {
    id: 'server2025',
    title: 'माइक्रोसॉफ्ट विंडोज सर्वर 2025 एवं एक्टिव डायरेक्टरी प्रशासन',
    subtitle: 'AD DS, GPO, DNS, DHCP, हॉटपैचिंग, 32KB AD DB और हाइब्रिड क्लाउड एडमिनिस्ट्रेशन',
    desc: 'जीरो से प्रोडक्शन एंटरप्राइज प्रशासन: क्लाइंट-सर्वर आर्किटेक्चर, एक्टिव डायरेक्टरी (AD DS), ग्रुप पॉलिसी (GPO), एंटरप्राइज DNS व DHCP, IIS वेब सर्वर, FSRM रैंसमवेयर प्रोटेक्शन, सर्वर 2025 फ्लैगशिप हॉटपैचिंग व SMB over QUIC, टॉप 50 MNC सिसएडमिन इंटरव्यू वॉल्ट एवं ₹18 LPA करियर ब्लूप्रिंट।',
    pages: '60 पेजेस मास्टर गाइड',
    bundlePages: '140 पेजेस सम्पूर्ण करियर सूट',
    tag: 'एंटरप्राइज फ्लैगशिप · एडिशन 1 (2027)',
    accent: 'sky',
    badge: '🔥 2027 फ्लैगशिप',
    badgeSub: 'क्लाउड व सिसएडमिन ट्रैक (₹3.5L–₹18L+)',
    previewPdfEn: '/downloads/Windows-Server-2025-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Windows-Server-2025-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Windows-Server-2025-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Windows-Server-2025-English-Master-Guide.pdf',
    fullPdfHi: '/downloads/Windows-Server-2025-Hindi-Master-Guide.pdf',
    fullPdfGu: '/downloads/Windows-Server-2025-Gujarati-Master-Guide.pdf',
    bundleZip: '/downloads/Windows-Server-2025-Career-Accelerator-Bundle.zip',
    bundleZipSize: '17.3 MB',
    bundleItems: [
      { name: 'विंडोज सर्वर 2025 कोर मास्टर गाइड (हिंदी)', pages: '60 पेजेस', file: 'Windows-Server-2025-Hindi-Master-Guide.pdf', badge: 'मुख्य हिंदी गाइड' },
      { name: 'विंडोज सर्वर 2025 कोर मास्टर गाइड (English)', pages: '60 पेजेस', file: 'Windows-Server-2025-English-Master-Guide.pdf', badge: 'English Edition' },
      { name: 'विंडोज सर्वर 2025 कोर मास्टर गाइड (ગુજરાતી)', pages: '60 पेजेस', file: 'Windows-Server-2025-Gujarati-Master-Guide.pdf', badge: 'ગુજરાતી આવૃત્તિ' },
      { name: 'टॉप 50 MNC सिस्टम्स एडमिनिस्ट्रेटर इंटरव्यू वॉल्ट', pages: '10 पेजेस', file: 'Windows-Server-2025-Top-50-MNC-Interview-Vault.pdf', badge: 'इंटरव्यू वॉल्ट' },
      { name: '12 हैंड्स-ऑन एंटरप्राइज लैब्स व पॉवरशेल वर्कबुक', pages: '7 पेजेस', file: 'Windows-Server-2025-Practice-Set-and-Lab-Workbook.pdf', badge: 'लैब वर्कबुक' },
      { name: 'सिसएडमिन से क्लाउड आर्किटेक्ट करियर व सैलरी ब्लूप्रिंट', pages: '3 पेजेस', file: 'Windows-Server-2025-System-Admin-Career-and-Salary-Blueprint.pdf', badge: 'सैलरी ब्लूप्रिंट' },
      { name: '1-क्लिक मास्टर ZIP ऑफलाइन बंडल', pages: 'सभी 6 डिलीवरेबल्स', file: 'Windows-Server-2025-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'अध्याय 01-03: सर्वर आर्किटेक्चर, हार्डवेयर साइजिंग, वर्चुअलाइजेशन व सर्वर 2025 इंस्टॉलेशन',
      'अध्याय 04-06: एक्टिव डायरेक्टरी (AD DS), फॉरेस्ट/डोमेन टोपोलॉजी, 5 FSMO रोल्स व डोमेन जॉइन',
      'अध्याय 07-08: ग्रुप पॉलिसी (GPO) आर्किटेक्चर, USB लॉकडाउन व एंटरप्राइज DNS/DHCP',
      'अध्याय 09-11: फाइल सर्विसेज व FSRM रैंसमवेयर प्रोटेक्शन, IIS 10.x SSL सर्वर व Hyper-V',
      'अध्याय 12-14: सर्वर 2025 हॉटपैचिंग, SMB over QUIC, डिजास्टर रिकवरी, बैकअप व करियर रोडमैप',
    ],
  },
  {
    id: 'ai',
    title: 'आर्टिफिशियल इंटेलिजेंस (AI) मास्टर गाइड',
    subtitle: 'डीप लर्निंग, न्यूरल नेटवर्क्स, LLMs, प्रॉम्प्ट इंजीनियरिंग व ऑटोनॉमस एजेंट्स',
    desc: 'मशीन लर्निंग, ट्रांसफॉर्मर आर्किटेक्चर, अटेंशन मैकेनिज्म, एंटरप्राइज प्रॉम्प्ट इंजीनियरिंग, RAG वेक्टर सर्च, ऑटोनॉमस AI एजेंट्स और 2027 भारत व ग्लोबल IT जॉब मार्केट का संपूर्ण रोडमैप।',
    pages: '44 पेजेस मास्टर गाइड',
    bundlePages: '112 पेजेस सम्पूर्ण करियर सूट',
    tag: '2027 नेक्स्ट-जेन एडिशन · एडिशन 1',
    accent: 'purple',
    badge: '🔥 सबसे ज्यादा लोकप्रिय',
    badgeSub: 'हाई CTC करियर ट्रैक (₹6L–₹22L+)',
    previewPdfEn: '/downloads/AI-Essentials-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/AI-Essentials-English-Edition-1.pdf',
    fullPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/AI-Essentials-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/AI-Career-Accelerator-Bundle.zip',
    bundleZipSize: '6.4 MB',
    bundleItems: [
      { name: 'AI एसेंशियल्स कोर मास्टर गाइड (हिंदी)', pages: '44 पेजेस', file: 'AI-Essentials-Hindi-Edition-1.pdf', badge: 'मुख्य हिंदी गाइड' },
      { name: 'AI एसेंशियल्स कोर मास्टर गाइड (अंग्रेज़ी)', pages: '44 पेजेस', file: 'AI-Essentials-English-Edition-1.pdf', badge: 'English Edition' },
      { name: 'शीर्ष 50 AI इंटरव्यू प्रश्न व 100 एंटरप्राइज प्रॉम्प्ट्स वॉल्ट', pages: '12 पेजेस', file: 'AI-Top-50-Interview-Questions-and-100-Enterprise-Prompts-Vault.pdf', badge: 'इंटरव्यू वॉल्ट' },
      { name: 'AI करियर, सैलरी ब्लूप्रिंट व रोडमैप', pages: '12 पेजेस', file: 'AI-Career-and-Salary-Blueprint-Edition-1.pdf', badge: 'सैलरी ब्लूप्रिंट' },
      { name: '1-क्लिक मास्टर ZIP ऑफलाइन बंडल', pages: 'सभी 4 PDFs', file: 'AI-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'अध्याय 01-02: AI का इतिहास, मशीन लर्निंग बेसिक्स और डीप न्यूरल नेटवर्क्स',
      'अध्याय 03-04: ट्रांसफॉर्मर आर्किटेक्चर, सेल्फ-अटेंशन और LLM इंटरनल्स',
      'अध्याय 05-06: एंटरप्राइज प्रॉम्प्ट इंजीनियरिंग और RAG वेक्टर सर्च पाइपलाइन',
      'अध्याय 07-08: ऑटोनॉमस AI एजेंट्स, टूल कॉलिंग और मल्टी-एजेंट सिस्टम्स',
      'अध्याय 09-10: एथिकल AI, भारत vs ग्लोबल IT जॉब मार्केट और 2027 करियर ब्लूप्रिंट',
    ],
  },
  {
    id: 'office-365',
    title: 'माइक्रोसॉफ्ट ऑफिस 365 एंटरप्राइज सूट',
    subtitle: 'एडवांस्ड एक्सेल, वर्ड, पॉवरपॉइंट, एक्सेस, आउटलुक और MIS ऑटोमेशन',
    desc: 'कॉर्पोरेट वर्ड लीगल ड्राफ्टिंग, एडवांस्ड एक्सेल XLOOKUP, पावर क्वेरी, पिवट टेबल्स, एग्जीक्यूटिव पॉवरपॉइंट पिच डेक्स, एक्सेस रिलेशनल डेटाबेस और MIS वर्कफ़्लो।',
    pages: '113 पेजेस मास्टर गाइड',
    bundlePages: '272 पेजेस सम्पूर्ण करियर सूट',
    tag: 'कॉर्पोरेट MIS स्टैंडर्ड · एडिशन 1',
    accent: 'blue',
    badge: '⚡ 100% जॉब रेडी',
    badgeSub: 'कॉर्पोरेट MIS स्टैंडर्ड (₹3.5L–₹9.5L)',
    previewPdfEn: '/downloads/Office-365-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Office-365-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Office-365-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Office-365-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Office-365-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/Office-365-Career-Accelerator-Bundle.zip',
    bundleZipSize: '16.7 MB',
    bundleItems: [
      { name: 'ऑफिस 365 एंटरप्राइज मास्टर गाइड (हिंदी)', pages: '113 पेजेस', file: 'Office-365-Hindi-Edition-1.pdf', badge: 'मुख्य हिंदी गाइड' },
      { name: 'ऑफिस 365 एंटरप्राइज मास्टर गाइड (अंग्रेज़ी)', pages: '113 पेजेस', file: 'Office-365-English-Edition-1.pdf', badge: 'English Edition' },
      { name: 'ऑफिस 365 एंटरप्राइज मास्टर गाइड (ગુજરાતી)', pages: '113 पेजेस', file: 'Office-365-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },
      { name: 'शीर्ष 100 शॉर्टकट्स व 50 MIS इंटरव्यू वॉल्ट (हिंदी)', pages: '9 पेजेस', file: 'Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf', badge: 'हिंदी वॉल्ट' },
      { name: 'शीर्ष 100 शॉर्टकट्स व 50 MIS इंटरव्यू वॉल्ट (अंग्रेज़ी)', pages: '9 पेजेस', file: 'Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf', badge: 'English Vault' },
      { name: 'प्रैक्टिकल एक्सेल टेम्पलेट्स व फॉर्मूला वर्कबुक', pages: '16 पेजेस', file: 'Office-365-Practical-Excel-Templates-Workbook-Guide.pdf', badge: 'प्रैक्टिकल लैब्स' },
      { name: 'वर्ड व एक्सेल हैंड्स-ऑन प्रैक्टिस टेम्पलेट्स (.docx व .xlsx)', pages: '6 रेडी फाइल्स', file: 'Office-365-Practice-Templates-and-Lab-Files.zip', badge: 'हैंड्स-ऑन फाइल्स' },
      { name: 'MIS एग्जीक्यूटिव करियर, सैलरी ब्लूप्रिंट व रोडमैप', pages: '12 पेजेस', file: 'Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf', badge: 'सैलरी ब्लूप्रिंट' },
      { name: '1-क्लिक मास्टर ZIP ऑफलाइन बंडल', pages: 'सभी PDFs + लैब फाइल्स', file: 'Office-365-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'अध्याय 01-03: वर्ड 365 कॉर्पोरेट आर्किटेक्चर, मेल मर्ज व लीगल ड्राफ्टिंग',
      'अध्याय 04-07: एडवांस्ड एक्सेल XLOOKUP, पिवट टेबल्स, पावर क्वेरी व डायनामिक ऐरे',
      'अध्याय 08-09: एग्जीक्यूटिव पॉवरपॉइंट पिच डेक्स, डेटा स्टोरीटेलिंग व मास्टर स्लाइड्स',
      'अध्याय 10-12: एक्सेस रिलेशनल डेटाबेस, आउटलुक इनबॉक्स जीरो व सुरक्षा नियम',
      'अध्याय 13: टॉप 100 कॉर्पोरेट शॉर्टकट्स व 50 MIS इंटरव्यू क्वेश्चन बैंक',
    ],
  },
  {
    id: 'fundamentals',
    title: 'कम्प्यूटर फंडामेंटल्स व सिलिकॉन आर्किटेक्चर',
    subtitle: 'IPO साइकिल, मेमोरी हायरार्की, ऑपरेटिंग सिस्टम व हार्डवेयर डायग्नोस्टिक्स',
    desc: 'सिलिकॉन IPO साइकिल, RAM/ROM स्टोरेज हायरार्की, CPU मशीन साइकिल, OS कर्नेल आर्किटेक्चर, PC असेंबली और टॉप 50 MNC प्लेसमेंट इंटरव्यू प्रश्न।',
    pages: '45 पेजेस मास्टर गाइड',
    bundlePages: '119 पेजेस सम्पूर्ण करियर सूट',
    tag: 'कोर फाउंडेशन · एडिशन 1',
    accent: 'emerald',
    badge: '💻 कोर फाउंडेशन',
    badgeSub: 'सिलिकॉन आर्किटेक्चर (₹3.2L–₹7.5L)',
    previewPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip',
    bundleZipSize: '30 MB',
    bundleItems: [
      { name: 'कम्प्यूटर फंडामेंटल्स कोर मास्टर गाइड (हिंदी)', pages: '45 पेजेस', file: 'Computer-Fundamentals-Hindi-Edition-1.pdf', badge: 'मुख्य हिंदी गाइड' },
      { name: 'कम्प्यूटर फंडामेंटल्स कोर मास्टर गाइड (अंग्रेज़ी)', pages: '45 पेजेस', file: 'Computer-Fundamentals-English-Edition-1.pdf', badge: 'English Edition' },
      { name: 'एंटरप्राइज व FAANG सिस्टम्स डीप-डाइव', pages: '7 पेजेस', file: 'Computer-Fundamentals-Enterprise-DeepDive-Edition-1.pdf', badge: 'FAANG डीप-डाइव' },
      { name: 'शीर्ष 50 MNC प्लेसमेंट इंटरव्यू प्रैक्टिस वॉल्ट', pages: '7 पेजेस', file: 'Computer-Fundamentals-Interview-Practice-Vault-Edition-1.pdf', badge: 'इंटरव्यू वॉल्ट' },
      { name: 'करियर व सैलरी ब्लूप्रिंट रोडमैप', pages: '5 पेजेस', file: 'Computer-Fundamentals-Career-Salary-Blueprint-Edition-1.pdf', badge: 'सैलरी ब्लूप्रिंट' },
      { name: 'प्रैक्टिकल लैब डायग्नोस्टिक्स वर्कबुक', pages: '10 पेजेस', file: 'Computer-Fundamentals-Practical-Lab-Workbook-Edition-1.pdf', badge: 'प्रैक्टिकल लैब्स' },
      { name: '1-क्लिक मास्टर ZIP ऑफलाइन बंडल', pages: 'सभी 6 PDFs', file: 'RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'अध्याय 01-02: सिलिकॉन IPO साइकिल, आधुनिक I/O पोर्ट्स व 5 पीढ़ियाँ',
      'अध्याय 03-05: RAM/ROM हायरार्की, L1-L3 कैश, CPU मशीन साइकिल व लॉजिक गेट्स',
      'अध्याय 06-08: OS आर्किटेक्चर, कर्नेल, मेमोरी मैनेजमेंट व सुरक्षा',
      'अध्याय 09: कम्प्यूटर असेंबली, ESD सेफ्टी स्टैंडर्ड्स व डायग्नोस्टिक टूल्स',
      'अध्याय 10: टॉप 50 MNC टेक्निकल प्लेसमेंट इंटरव्यू क्वेश्चन बैंक',
    ],
  },
  {
    id: 'tally',
    title: 'टैली प्राइम विद जीएसटी एवं कॉर्पोरेट अकाउंटिंग',
    subtitle: 'सुनहरे नियम, 28 ग्रुप्स, 24 वाउचर्स, आधुनिक जीएसटी (0%/5%/18%) व टीडीएस',
    desc: 'लेखांकन के 3 सुनहरे नियमों से लेकर 28 पूर्व-निर्धारित ग्रुप्स, 24 वाउचर प्रकार, आधुनिक जीएसटी स्लैब्स (0%, 5%, 18%), टीडीएस कटौतियां (धारा 194C, 194J, 194I) और 50+ वास्तविक वाणिज्यिक इनवॉइस सेट्स (ऊंझा मंडी, मोरबी सिरामिक्स, अंतरराज्यीय IGST)।',
    pages: '51 पेजेस मास्टर गाइड',
    bundlePages: '80+ पेजेस सम्पूर्ण करियर सूट',
    tag: 'टैली प्राइम 2027 · एडिशन 1',
    accent: 'amber',
    badge: '📊 गुजरात #1 वोकेशनल ट्रैक',
    badgeSub: 'कॉर्पोरेट अकाउंटेंट ट्रैक (₹2.5L–₹7.5L)',
    previewPdfEn: '/downloads/Tally-Prime-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Tally-Prime-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Tally-Prime-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Tally-Prime-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Tally-Prime-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/Tally-Prime-Career-Accelerator-Bundle.zip',
    bundleZipSize: '11.4 MB',
    bundleItems: [
      { name: 'टैली प्राइम विद जीएसटी कोर मास्टर गाइड (हिंदी)', pages: '51 पेजेस', file: 'Tally-Prime-Hindi-Edition-1.pdf', badge: 'मुख्य हिंदी गाइड' },
      { name: 'टैली प्राइम विद जीएसटी कोर मास्टर गाइड (English)', pages: '51 पेजेस', file: 'Tally-Prime-English-Edition-1.pdf', badge: 'English Edition' },
      { name: 'टैली प्राइम विद जीएसटी कोर मास्टर गाइड (ગુજરાતી)', pages: '51 पेजेस', file: 'Tally-Prime-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },
      { name: '50-इनवॉइस कमर्शियल प्रैक्टिस वर्कबुक व APMC डेटासेट्स', pages: '16 पेजेस', file: 'Tally-50-Invoice-Commercial-Workbook.pdf', badge: 'प्रैक्टिस वर्कबुक' },
      { name: 'एडवांस्ड टीडीएस व फॉर्म 26Q लाइव प्रैक्टिस सेट', pages: '4 पेजेस', file: 'Tally-TDS-and-Form-26Q-Practice-Workbook.pdf', badge: 'टीडीएस वर्कबुक' },
      { name: 'शीर्ष 50 कॉर्पोरेट अकाउंटेंट व जीएसटी इंटरव्यू वॉल्ट (English)', pages: '6 पेजेस', file: 'Tally-Top-50-Accountant-Interview-Vault.pdf', badge: 'इंटरव्यू वॉल्ट' },
      { name: 'कॉर्पोरेट अकाउंटेंट करियर रोडमैप व सैलरी ब्लूप्रिंट', pages: '2 पेजेस', file: 'Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf', badge: 'सैलरी ब्लूप्रिंट' },
      { name: '1-क्लिक मास्टर ZIP ऑफलाइन बंडल', pages: 'सभी 7 PDFs', file: 'Tally-Prime-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'अध्याय 01-03: टैली इतिहास (भरत गोयनका), सिस्टम आर्किटेक्चर, 3 सुनहरे नियम व मिस्टर वर्मा 50-एंट्री वर्कफ़्लो',
      'अध्याय 04-06: 28 पूर्व-निर्धारित ग्रुप्स, 24 वाउचर प्रकार व कंपनी निर्माण लैब्स (पालनपुर/अहमदाबाद)',
      'अध्याय 07-08: आधुनिक जीएसटी ढांचा (0%, 5%, 18% स्लैब्स व F11 SOP) व टीडीएस कटौतियां (194C, 194J, 194I)',
      'अध्याय 09-10: 50+ इनवॉइस (ऊंझा जीरा/ईसबगोल, इलेक्ट्रॉनिक्स, अंतरराज्यीय IGST, डेबिट/क्रेडिट नोट्स)',
      'अध्याय 11-12: बैंक समाधान (BRS), CTS-2010 चेक, कॉस्ट सेंटर्स, एवं कैपस्टोन प्रोजेक्ट (सिद्धि विनायक ट्रेडर्स)',
    ],
  },
  {
    id: 'ccna',
    title: 'सिस्को CCNA 200-301 मास्टर सूट',
    subtitle: 'एंटरप्राइज स्विचिंग, OSPF रूटिंग, IPv6 और सिस्को IOS TAC स्टैंडर्ड',
    desc: '3-टियर/स्पाइन-लीफ नेटवर्क आर्किटेक्चर, IPv4 सबनेटिंग VLSM, IPv6 आर्किटेक्चर, सिस्को IOS CLI, VLANs/STP, OSPF और टॉप 120 सिस्को TAC इंटरव्यू प्रश्न।',
    pages: '49 पेजेस मास्टर गाइड',
    bundlePages: '128 पेजेस सम्पूर्ण करियर सूट',
    tag: 'सिस्को TAC स्टैंडर्ड · एडिशन 1',
    accent: 'cyan',
    badge: '🌐 सिस्को TAC स्टैंडर्ड',
    badgeSub: 'नेटवर्क इंजीनियरिंग प्रो (₹4.5L–₹14L+)',
    previewPdfEn: '/downloads/CCNA-200-301-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/CCNA-200-301-English-Edition-1.pdf',
    fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1.pdf',
    bundleZip: '/downloads/RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip',
    bundleZipSize: '19.8 MB',
    bundleItems: [
      { name: 'सिस्को CCNA 200-301 मास्टर गाइड (हिंदी)', pages: '49 पेजेस', file: 'CCNA-200-301-Hindi-Edition-1.pdf', badge: 'मुख्य हिंदी गाइड' },
      { name: 'सिस्को CCNA 200-301 मास्टर गाइड (अंग्रेज़ी)', pages: '49 पेजेस', file: 'CCNA-200-301-English-Edition-1.pdf', badge: 'English Edition' },
      { name: 'सिस्को TAC टॉप 120 टेक्निकल इंटरव्यू वॉल्ट', pages: '14 पेजेस', file: 'CCNA-200-301-Interview-Question-Vault-Edition-1.pdf', badge: 'इंटरव्यू वॉल्ट' },
      { name: 'नेटवर्क इंजीनियर करियर व सैलरी ब्लूप्रिंट', pages: '4 पेजेस', file: 'CCNA-200-301-Network-Engineer-Career-Salary-Blueprint-Edition-1.pdf', badge: 'सैलरी ब्लूप्रिंट' },
      { name: 'पैकेट ट्रेसर हैंड्स-ऑन प्रोडक्शन लैब वर्कबुक', pages: '12 पेजेस', file: 'CCNA-200-301-Packet-Tracer-Lab-Workbook-Edition-1.pdf', badge: 'लैब वर्कबुक' },
      { name: '1-क्लिक मास्टर ZIP ऑफलाइन बंडल', pages: 'सभी 5 PDFs', file: 'RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip', badge: '1-Click ZIP' },
    ],
    topics: [
      'अध्याय 01-02: 3-टियर एंटरप्राइज बनाम स्पाइन-लीफ आर्किटेक्चर व केबलिंग',
      'अध्याय 03-04: IPv4 सबनेटिंग मास्टरक्लास (VLSM/FLSM) व IPv6 SLAAC',
      'अध्याय 05-06: सिस्को IOS आर्किटेक्चर, ROMMON रिकवरी व CLI कमांड्स',
      'अध्याय 07-08: स्विचिंग (VLANs/Trunking/STP) व IP रूटिंग (OSPFv2/AD)',
      'अध्याय 09-10: एंटरप्राइज नेटवर्क सर्विसेज (DHCP/NAT/ACL) व TAC वॉल्ट',
    ],
  },
];

export function NotesHiPage() {
  const [selectedSubject, setSelectedSubject] = useState(SUBJECTS_HI[0]);
  const [activeSlideIndex, setActiveSlideIndex] = useState(0);
  const carouselRef = useRef(null);
  const [isUpsellOpen, setIsUpsellOpen] = useState(false);
  const [modalSelectedPlan, setModalSelectedPlan] = useState('bundle');

  const scrollToSlide = (index) => {
    setActiveSlideIndex(index);
    if (carouselRef.current) {
      const card = carouselRef.current.children[index];
      if (card) {
        card.scrollIntoView({ behavior: 'smooth', inline: 'center', block: 'nearest' });
      }
    }
  };

  const handleCarouselScroll = (e) => {
    const el = e.currentTarget;
    if (!el || !el.children || el.children.length === 0) return;
    const cardWidth = el.children[0].offsetWidth || 300;
    const scrollLeft = el.scrollLeft;
    const newIndex = Math.min(
      SUBJECTS_HI.length - 1,
      Math.max(0, Math.round(scrollLeft / (cardWidth + 16)))
    );
    if (newIndex !== activeSlideIndex) {
      setActiveSlideIndex(newIndex);
    }
  };

  const handleOpenPurchaseModal = (sub, defaultPlan = 'bundle') => {
    setSelectedSubject(sub);
    setModalSelectedPlan(defaultPlan);
    setIsUpsellOpen(true);
  };

  return (
    <div className="min-h-screen bg-black text-[#EDEDED] py-6 sm:py-10 px-3 sm:px-6 lg:px-8">
      <div className="max-w-6xl mx-auto">
        
        {/* Header Centered */}
        <div className="text-center max-w-4xl mx-auto mb-10 sm:mb-14 pb-6 border-b border-white/[0.08]">
          <div className="inline-flex items-center justify-center gap-2 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-xs font-mono text-emerald-400 mb-3 shadow-sm shadow-emerald-500/5">
            <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
            <span>2027 ऑफिशियल डिजिटल नोट्स स्टोर · राहुल पटेल द्वारा लिखित</span>
          </div>
          <h1 className="text-3xl sm:text-5xl font-black text-white tracking-tight mb-2">
            आधिकारिक मास्टर डिजिटल नोट्स
          </h1>
          <p className="text-[#86868B] text-xs sm:text-base max-w-2xl mx-auto leading-relaxed mb-5">
            अनुसंधान-सत्यापित, उच्च-गुणवत्ता वाले इंजीनियरिंग हैंडबुक्स। कोर थ्योरी गाइड केवल <strong className="text-white">₹49</strong> में, या सम्पूर्ण <strong className="text-emerald-400">₹149 करियर एक्सेलेरेटर सूट</strong> (+MNC इंटरव्यू वॉल्ट, लैब्स व सैलरी ब्लूप्रिंट)।
          </p>

          {/* Quick-Jump Navigation & Interactive Subject Switcher */}
          <div className="flex items-center justify-center gap-1.5 sm:gap-2 mt-4 flex-wrap">
            <span className="text-[11px] font-mono text-[#86868B] mr-1 hidden sm:inline">ट्रैक चुनें:</span>
            {SUBJECTS_HI.map((s, idx) => (
              <button
                key={s.id}
                type="button"
                onClick={() => scrollToSlide(idx)}
                className={`px-3 py-1.5 rounded-full text-[11px] font-semibold transition-all active:scale-95 flex items-center gap-1.5 cursor-pointer ${
                  activeSlideIndex === idx
                    ? 'bg-emerald-500 text-black font-bold shadow-lg shadow-emerald-500/20'
                    : 'bg-white/[0.05] hover:bg-white/[0.1] border border-white/[0.08] text-white/80 hover:text-white'
                }`}
              >
                <span>{s.id === 'server2025' ? '⚡ सर्वर 2025' : s.id === 'ai' ? '🤖 AI मास्टर' : s.id === 'office-365' ? '📊 ऑफिस 365' : s.id === 'fundamentals' ? '💻 फंडामेंटल्स' : s.id === 'tally' ? '📈 टैली प्राइम' : '🌐 CCNA'}</span>
              </button>
            ))}
          </div>
        </div>

        {/* Mobile Swipe Navigation & Track Counter (Visible on mobile only: md:hidden) */}
        <div className="flex items-center justify-between px-1 mb-3.5 md:hidden">
          <div className="flex items-center gap-2">
            <span className="text-[11px] font-mono text-[#86868B]">
              ट्रैक <strong className="text-emerald-400 font-bold">{activeSlideIndex + 1}</strong> of {SUBJECTS_HI.length}
            </span>
            <span className="text-[10px] font-mono text-emerald-400/80 bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20">
              👈 स्वाइप करें 👉
            </span>
          </div>
          <div className="flex items-center gap-1.5">
            <button
              type="button"
              onClick={() => scrollToSlide(Math.max(0, activeSlideIndex - 1))}
              disabled={activeSlideIndex === 0}
              className={`w-7 h-7 rounded-lg border text-xs flex items-center justify-center transition-all ${
                activeSlideIndex === 0 ? 'border-white/5 text-white/20' : 'border-white/15 text-white bg-white/[0.06] active:scale-95'
              }`}
              aria-label="Previous note"
            >
              ‹
            </button>
            <div className="flex items-center gap-1 px-1">
              {SUBJECTS_HI.map((_, i) => (
                <button
                  key={i}
                  type="button"
                  onClick={() => scrollToSlide(i)}
                  className={`h-1.5 rounded-full transition-all ${activeSlideIndex === i ? 'w-4 bg-emerald-400' : 'w-1.5 bg-white/20'}`}
                  aria-label={`Go to slide ${i + 1}`}
                />
              ))}
            </div>
            <button
              type="button"
              onClick={() => scrollToSlide(Math.min(SUBJECTS_HI.length - 1, activeSlideIndex + 1))}
              disabled={activeSlideIndex === SUBJECTS_HI.length - 1}
              className={`w-7 h-7 rounded-lg border text-xs flex items-center justify-center transition-all ${
                activeSlideIndex === SUBJECTS_HI.length - 1 ? 'border-white/5 text-white/20' : 'border-white/15 text-white bg-white/[0.06] active:scale-95'
              }`}
              aria-label="Next note"
            >
              ›
            </button>
          </div>
        </div>

        {/* 6 Official Tracks */}
        <div
          ref={carouselRef}
          onScroll={handleCarouselScroll}
          className="flex md:grid md:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-5 mb-10 overflow-x-auto md:overflow-x-visible snap-x snap-mandatory md:snap-none scrollbar-none pb-4 md:pb-0 px-2 sm:px-0 -mx-3 sm:mx-0 touch-pan-x"
          style={{ WebkitOverflowScrolling: 'touch' }}
        >
          {SUBJECTS_HI.map((sub, index) => (
            <div
              key={sub.id}
              className="relative p-5 sm:p-6 rounded-2xl sm:rounded-3xl bg-[#0D0D10] border border-white/[0.08] hover:border-emerald-500/40 transition-all flex flex-col justify-between group shadow-xl shrink-0 w-[86vw] sm:w-[360px] md:w-auto snap-center md:snap-align-none"
            >
              <div className="absolute top-3 left-4 text-[10px] font-mono text-white/30 font-bold">
                #{index + 1}
              </div>

              <div>
                <div className="flex items-center justify-between mb-3.5">
                  <span className="text-[10px] font-mono text-white/40 font-bold px-2 py-0.5 rounded bg-white/[0.04] border border-white/[0.06]">
                    ट्रैक #{index + 1}
                  </span>
                  <span className="text-[10px] font-mono font-bold px-2.5 py-0.5 rounded-full bg-emerald-500/15 text-emerald-300 border border-emerald-500/30">
                    {sub.badge}
                  </span>
                </div>

                <div className="text-center mb-3">
                  <h3 className="text-lg font-bold text-white mb-1 group-hover:text-emerald-400 transition-colors">
                    {sub.title}
                  </h3>
                  <div className="text-[11px] font-mono text-emerald-400 mb-1 font-semibold line-clamp-1">
                    {sub.subtitle}
                  </div>
                  <div className="text-[10px] font-mono text-[#86868B] mb-2.5">
                    {sub.badgeSub}
                  </div>
                  <p className="text-xs text-[#86868B] leading-relaxed line-clamp-3">
                    {sub.desc}
                  </p>
                </div>

                <div className="p-2.5 rounded-xl bg-white/[0.03] border border-white/[0.06] mb-3 text-[10px] font-mono flex justify-between">
                  <span className="text-[#86868B]">कोर थ्योरी गाइड:</span>
                  <strong className="text-white">{sub.pages}</strong>
                </div>
              </div>

              <div className="space-y-2.5 pt-3 border-t border-white/[0.06]">
                <div className="flex items-baseline justify-between">
                  <div>
                    <div className="text-[10px] font-mono text-[#86868B]">कोर पास</div>
                    <div className="text-xl font-black text-white">₹49</div>
                  </div>
                  <div className="text-right">
                    <div className="text-[10px] font-mono text-emerald-400 font-bold">करियर सूट (+वॉल्ट)</div>
                    <div className="text-xs font-mono text-emerald-300 font-bold">₹149</div>
                  </div>
                </div>

                <Link
                  to="/notes"
                  className="w-full py-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 text-black text-xs font-black transition-all text-center block shadow-lg shadow-emerald-500/20"
                >
                  नोट्स व 5-पेज प्रिव्यू देखें →
                </Link>
              </div>
            </div>
          ))}
        </div>

        {/* Mobile Bottom Indicator & Slide Dots (md:hidden) */}
        <div className="flex md:hidden flex-col items-center justify-center gap-2 mb-10 -mt-4">
          <div className="flex items-center gap-1.5 bg-black/60 px-3 py-1.5 rounded-full border border-white/10 shadow-lg">
            {SUBJECTS_HI.map((s, i) => (
              <button
                key={i}
                type="button"
                onClick={() => scrollToSlide(i)}
                className={`h-2 rounded-full transition-all ${
                  activeSlideIndex === i ? 'w-6 bg-emerald-400' : 'w-2 bg-white/20 hover:bg-white/40'
                }`}
                aria-label={`Go to ${s.title}`}
              />
            ))}
          </div>
          <p className="text-[10px] font-mono text-[#86868B]">
            कार्ड्स को उंगली से बाएँ-दाएँ स्वाइप करें या ऊपर विषय चुनें
          </p>
        </div>

        {/* Official WhatsApp Community Card */}
        <div className="mt-12 mb-12">
          <WhatsAppCommunityCard />
        </div>

        {/* 49 vs 149 Comparison Framework in Hindi */}
        <div className="p-6 sm:p-10 rounded-3xl bg-gradient-to-b from-[#111116] to-[#0A0A0D] border border-white/[0.12] shadow-2xl">
          <div className="text-center max-w-3xl mx-auto mb-8">
            <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/30 text-xs font-mono font-bold mb-3">
              ⚖️ 49 vs 149 : छात्रों के लिए पारदर्शी निर्णय
            </span>
            <h2 className="text-2xl sm:text-4xl font-black text-white tracking-tight mb-2">
              89% छात्र ₹149 करियर एक्सेलेरेटर सूट क्यों चुनते हैं?
            </h2>
            <p className="text-xs sm:text-sm text-[#86868B] leading-relaxed">
              अगर आप केवल थ्योरी पढ़ना चाहते हैं तो ₹49 ठीक है। लेकिन यदि आप कैंपस प्लेसमेंट, टॉप MNC इंटरव्यू और <strong>₹5L से ₹15L+ CTC</strong> पैकेज क्रैक करना चाहते हैं, तो केवल ₹100 अतिरिक्त में सम्पूर्ण हथियार मिलते हैं।
            </p>
          </div>

          <div className="text-center">
            <Link
              to="/notes"
              className="inline-flex items-center gap-2 px-6 py-3.5 rounded-xl bg-gradient-to-r from-emerald-500 to-cyan-500 text-black text-sm font-black shadow-xl hover:opacity-95 transition-all"
            >
              <span>मुख्य स्टोर पेज पर जाएँ और लाइव प्रिव्यू देखें</span>
              <span>→</span>
            </Link>
          </div>
        </div>

      </div>
    </div>
  );
}

export default NotesHiPage;
