#import "master-theme.typ": *

// =============================================================================
// RTECHLAB MASTER CURRICULUM BLUEPRINT — ARTIFICIAL INTELLIGENCE (HINDI EDITION 1)
// Page 2: Modern 6-Part Modular Engineering Curriculum Matrix
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#text(size: 8pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[ऑफिशियल 2027 करिकुलम ब्लूप्रिंट · 42 प्रोडक्शन मॉड्यूल्स एवं हैंड्स-ऑन लैब्स]
#v(-2pt)
= आर्टिफिशियल इंटेलिजेंस: मास्टर एंटरप्राइज करिकुलम

#v(-3pt)
#text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), fill: rgb("#1E293B").lighten(15%))[
  1950 की नींव से 2027 एजेंटिक AI, स्वदेशी इंडिक LLMs, GPU क्लस्टर्स और ₹38 LPA करियर ब्लूप्रिंट तक 42 मॉड्यूल्स का संपूर्ण रोडमैप। RTechLab 2027 डीपटेक अकादमिक एवं कॉर्पोरेट फ्रेमवर्क के तहत मानकीकृत।
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  [
    // MODULE 1
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#CBD5E1"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#0284C7"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[भाग 1]) AI का इतिहास, नींव और मूलभूत सिद्धांत]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.8pt),
          [*Ch 01*], [बुद्धिमान मशीनों की शुरुआत: 1950 ट्यूरिंग टेस्ट से डार्टमाउथ तक],
          [*Ch 02*], [स्वर्ण युग, पर्सेप्ट्रॉन एवं प्रथम AI शीतकाल (1957–1980)],
          [*Ch 03*], [एक्सपर्ट सिस्टम्स, नॉलेज इंजीनियरिंग एवं द्वितीय AI शीतकाल],
          [*Ch 04*], [सांख्यिकीय AI का पुनर्जागरण: डीप ब्लू से AlexNet क्रांति (2012)],
          [*Ch 05*], [AI की सम्पूर्ण यात्रा (1950–2027): 75 वर्षों की टाइमलाइन],
          [*Ch 06*], [AI वर्गीकरण: नैरो AI बनाम जनरल AI (AGI) बनाम सुपरइंटेलीजेंस]
        )
      ]
    )

    #v(4pt)

    // MODULE 2
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#CBD5E1"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#4F46E5"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[भाग 2]) मशीन लर्निंग एवं डीप न्यूरल नेटवर्क्स की कोर गणित]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.6pt),
          [*Ch 07*], [AI बनाम ML बनाम DL बनाम GenAI: पदानुक्रम एवं कोर गणित],
          [*Ch 08*], [सुपरवाइज्ड लर्निंग: रिग्रेशन, क्लासिफिकेशन एवं लॉस फंक्शन्स],
          [*Ch 09*], [अनसुपरवाइज्ड लर्निंग: क्लस्टरिंग, डायमेंशनैलिटी रिडक्शन एवं PCA],
          [*Ch 10*], [जैविक न्यूरॉन से कृत्रिम न्यूरॉन तक: एक्टिवेशन फंक्शन्स],
          [*Ch 11*], [डीप न्यूरल नेटवर्क्स (DNN): परतों का आर्किटेक्चर एवं ग्रेडिएंट डिसेंट],
          [*Ch 12*], [कन्वोल्यूशनल न्यूरल नेटवर्क्स (CNN): कर्नल, पूलिंग एवं ResNet],
          [*Ch 13*], [सीक्वेंशियल मॉडल्स: RNN, वैनिशिंग ग्रेडिएंट, LSTM एवं GRU],
          [*Ch 14*], [प्रैक्टिकल लैब: शुद्ध NumPy में स्क्रैच से न्यूरल नेटवर्क कोड करना]
        )
      ]
    )

    #v(4pt)

    // MODULE 3
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#CBD5E1"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#059669"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[भाग 3]) ट्रांसफॉर्मर आर्किटेक्चर, LLMs एवं जनरेटिव AI]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.6pt),
          [*Ch 15*], [2017 ट्रांसफॉर्मर क्रांति: "Attention Is All You Need" वास्तुकला],
          [*Ch 16*], [लार्ज लैंग्वेज मॉडल्स (LLMs) की आंतरिक संरचना: BPE से सैंपलिंग],
          [*Ch 17*], [LLM प्रशिक्षण जीवनचक्र: प्री-ट्रेनिंग, SFT, RLHF एवं DPO अलाइनमेंट],
          [*Ch 18*], [एफिशिएंट फाइन-ट्यूनिंग: LoRA, QLoRA, PEFT एवं क्वांटाइजेशन],
          [*Ch 19*], [रिट्रीवल-ऑगमेंटेड जनरेशन (RAG): वेक्टर्स, चंकिंग एवं हाइब्रिड सर्च],
          [*Ch 20*], [एंटरप्राइज प्रॉम्प्ट इंजीनियरिंग: CoT, ReAct एवं DSPy फ्रेमवर्क],
          [*Ch 21*], [स्वायत्त AI एजेंट्स: टूल कॉलिंग, LangGraph एवं ReAct लूप],
          [*Ch 22*], [प्रोडक्शन लैब: पायथन में एंटरप्राइज RAG पाइपलाइन का निर्माण]
        )
      ]
    )
  ],
  [
    // MODULE 4
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#CBD5E1"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#D97706"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[भाग 4]) ग्लोबल AI जिओपॉलिटिक्स, चिप वॉर एवं भारतीय सॉवरेन AI]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.8pt),
          [*Ch 23*], [एंटरप्राइज AI हार्डवेयर: NVIDIA H100, Blackwell B200 सुपरक्लस्टर्स],
          [*Ch 24*], [वैश्विक AI भू-राजनीति, सिलिकॉन संप्रभुता एवं चिप वॉर],
          [*Ch 25*], [भारतAI मिशन: ₹10,372 करोड़ का राष्ट्रीय संप्रभु AI पारितंत्र],
          [*Ch 26*], [स्वदेशी इंडिक LLMs एवं डिजिटल पब्लिक इंफ्रास्ट्रक्चर (DPI)],
          [*Ch 27*], [औद्योगिक केस स्टडीज: उच्च-प्रभाव वाले व्यावसायिक परिनियोजन],
          [*Ch 28*], [प्रोडक्शन परिनियोजन: vLLM, TensorRT-LLM, Triton एवं FastAPI]
        )
      ]
    )

    #v(4pt)

    // MODULE 5
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#CBD5E1"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#DC2626"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[भाग 5]) 2027 करियर रोडमैप, सैलरी ब्लूप्रिंट एवं जॉब रोल्स]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.6pt),
          [*Ch 29*], [2027 AI जॉब मार्केट परिदृश्य एवं ₹38 LPA सैलरी सीढ़ी (Salary Ladder)],
          [*Ch 30*], [छह उच्च-भुगतान वाली AI करियर विशेषज्ञताएं एवं टेक स्टैक],
          [*Ch 31*], [0-से-6 महीने का संपूर्ण AI लर्निंग एवं एक्ज़ीक्यूशन रोडमैप],
          [*Ch 32*], [मिलियन डॉलर AI प्रोजेक्ट पोर्टफोलियो: 5 एंटरप्राइज सिस्टम्स],
          [*Ch 33*], [ATS-ऑप्टिमाइज्ड AI रेज़्यूमे इंजीनियरिंग एवं 25 STAR बुलेट्स],
          [*Ch 34*], [वैश्विक एवं भारतीय AI सर्टिफिकेशन प्लेबुक एवं ROI विश्लेषण],
          [*Ch 35*], [फ्रीलांस AI कंसल्टिंग एवं एंटरप्राइज एजेंसी मुद्रीकरण],
          [*Ch 36*], [करियर परिवर्तन प्लेबुक: नॉन-टेक एवं डेवलपर्स से AI में कदम]
        )
      ]
    )

    #v(4pt)

    // MODULE 6
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#CBD5E1"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#7C3AED"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[भाग 6]) टॉप 50 MNC AI इंटरव्यू वॉल्ट, नैतिकता एवं मेंटरशिप]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.8pt),
          [*Ch 37*], [टॉप 50 MNC AI इंटरव्यू वॉल्ट: कोर गणित, सांख्यिकी एवं ML थ्योरी],
          [*Ch 38*], [टॉप 50 MNC AI इंटरव्यू वॉल्ट: ट्रांसफॉर्मर्स एवं डीप लर्निंग],
          [*Ch 39*], [टॉप 50 MNC AI इंटरव्यू वॉल्ट: LLMs, RAG एवं वेक्टर सिस्टम्स],
          [*Ch 40*], [टॉप 50 MNC AI इंटरव्यू वॉल्ट: सिस्टम डिज़ाइन एवं 10M स्केलिंग],
          [*Ch 41*], [AI सुरक्षा, नैतिकता एवं वैश्विक शासन: EU AI Act एवं भारतीय DPDP],
          [*Ch 42*], [राहुल सर का व्यक्तिगत संदेश: भारतीय छात्रों के लिए विज़न एवं मेंटरशिप]
        )
      ]
    )
  ]
)

#v(4pt)
#align(center)[
  #block(
    fill: rgb("#F1F5F9"),
    stroke: 0.5pt + rgb("#CBD5E1"),
    inset: (x: 8pt, y: 3.5pt),
    radius: 3pt,
    [
      #text(size: 6.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[RTECHLAB डीपटेक अकादमिक फ्रेमवर्क · 42 प्रोडक्शन मॉड्यूल्स · 100% उद्योग-मानकीकृत कोड]
    ]
  )
]
