#import "../../03_TYPST_DESIGN_SYSTEM/master-theme.typ": *
#import "../../03_TYPST_DESIGN_SYSTEM/cover-layouts/official-cover.typ": rtech-cover

#set page(
  paper: "a4",
  margin: (x: 15mm, top: 20mm, bottom: 18mm),
  fill: rgb("#FDFDFE")
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
  size: 9.5pt,
  fill: rgb("#202B4D"),
  lang: "hi"
)

= कंप्यूटर हार्डवेयर और सिस्टम आर्किटेक्चर (2027 इंडस्ट्रियल एडिशन)

#text(size: 11pt, weight: "bold", fill: rgb("#25B6F9"))[
  द विजुअल इंजीनियरिंग मास्टर हैंडबुक · लेखक: राहुल सर
]

#v(8pt)

#concept-box(title: "सीपीयू सॉकेट फिजिक्स: LGA बनाम PGA")[
  कंप्यूटर सिस्टम में सीपीयू सॉकेट मुख्य रूप से दो प्रकार के होते हैं:
  1. *LGA (Land Grid Array):* नाजुक स्प्रिंग पिन्स मदरबोर्ड सॉकेट पर होते हैं और प्रोसेसर के नीचे फ्लैट गोल्ड कॉन्टैक्ट पैड्स (Lands) होते हैं (जैसे Intel LGA 1700/1851 और AMD Socket AM5)।
  2. *PGA (Pin Grid Array):* पिन्स सीधे सीपीयू के नीचे वेल्ड होते हैं (जैसे पुराना AMD AM4)। जब थर्मल पेस्ट सूख जाता है, तो कूलर को सीधा खींचने पर सीपीयू सॉकेट से बाहर खिंच सकता है।
]

#analogy-box(title: "मानव शरीर और कंप्यूटर आर्किटेक्चर की तुलना")[
  *मस्तिष्क (Brain) = CPU (Central Processing Unit)*: जैसे मानव मस्तिष्क का फ्रंटल लोब गणित और लॉजिक हल करता है, वैसे ही सीपीयू का ALU (Arithmetic Logic Unit) गणना करता है।\
  *हृदय और नसें = PSU और VRM पावर डिलीवरी*: पावर सप्लाई 230V AC को 12V DC में बदल कर मदरबोर्ड में भेजती है, और VRM उसे 1.2V के सुरक्षित वोल्टेज में बदलता है।
]
