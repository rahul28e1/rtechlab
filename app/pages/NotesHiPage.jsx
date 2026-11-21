import React, { useState, useEffect } from 'react';
import { Link } from 'react-router';

// ── 4 आधिकारिक RTECHLAB विषय (सटीक क्रम एवं वास्तविक पेज संख्या) ────────
const SUBJECTS_HI = [
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
    fullPdfEn: '/downloads/AI-Essentials-English-Edition-1.pdf',
    fullPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1.pdf',
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
    fullPdfEn: '/downloads/Office-365-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',
    bundleZip: '/downloads/Office-365-Career-Accelerator-Bundle.zip',
    bundleZipSize: '13.7 MB',
    bundleItems: [
      { name: 'ऑफिस 365 एंटरप्राइज मास्टर गाइड (हिंदी)', pages: '113 पेजेस', file: 'Office-365-Hindi-Edition-1.pdf', badge: 'मुख्य हिंदी गाइड' },
      { name: 'ऑफिस 365 एंटरप्राइज मास्टर गाइड (अंग्रेज़ी)', pages: '113 पेजेस', file: 'Office-365-English-Edition-1.pdf', badge: 'English Edition' },
      { name: 'शीर्ष 100 शॉर्टकट्स व 50 MIS इंटरव्यू वॉल्ट (हिंदी)', pages: '9 पेजेस', file: 'Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf', badge: 'हिंदी वॉल्ट' },
      { name: 'शीर्ष 100 शॉर्टकट्स व 50 MIS इंटरव्यू वॉल्ट (अंग्रेज़ी)', pages: '9 पेजेस', file: 'Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf', badge: 'English Vault' },
      { name: 'प्रैक्टिकल एक्सेल टेम्पलेट्स व फॉर्मूला वर्कबुक', pages: '16 पेजेस', file: 'Office-365-Practical-Excel-Templates-Workbook-Guide.pdf', badge: 'प्रैक्टिकल लैब्स' },
      { name: 'MIS एग्जीक्यूटिव करियर, सैलरी ब्लूप्रिंट व रोडमैप', pages: '12 पेजेस', file: 'Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf', badge: 'सैलरी ब्लूप्रिंट' },
      { name: '1-क्लिक मास्टर ZIP ऑफलाइन बंडल', pages: 'सभी 6 PDFs', file: 'Office-365-Career-Accelerator-Bundle.zip', badge: '1-Click ZIP' },
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
    fullPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',
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
    fullPdfEn: '/downloads/CCNA-200-301-English-Edition-1.pdf',
    fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',
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
  const [isUpsellOpen, setIsUpsellOpen] = useState(false);
  const [modalSelectedPlan, setModalSelectedPlan] = useState('bundle');

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
          <p className="text-[#86868B] text-xs sm:text-base max-w-2xl mx-auto leading-relaxed">
            अनुसंधान-सत्यापित, उच्च-गुणवत्ता वाले इंजीनियरिंग हैंडबुक्स। कोर थ्योरी गाइड केवल <strong className="text-white">₹49</strong> में, या सम्पूर्ण <strong className="text-emerald-400">₹149 करियर एक्सेलेरेटर सूट</strong> (+MNC इंटरव्यू वॉल्ट, लैब्स व सैलरी ब्लूप्रिंट)।
          </p>
        </div>

        {/* 4 Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-5 mb-14">
          {SUBJECTS_HI.map((sub, index) => (
            <div
              key={sub.id}
              className="relative p-5 sm:p-6 rounded-2xl sm:rounded-3xl bg-[#0D0D10] border border-white/[0.08] hover:border-emerald-500/40 transition-all flex flex-col justify-between group shadow-xl"
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
