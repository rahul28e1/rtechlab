#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[भाग 5: 2027 करियर रोडमैप, सैलरी ब्लूप्रिंट एवं टॉप MNC जॉब्स · अध्याय 36]
= करियर परिवर्तन प्लेबुक: नॉन-टेक एवं सॉफ्टवेयर डेवलपर्स से AI

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  चाहे आप 5 साल से Java/Spring Boot बना रहे हों, मैन्युअल टेस्टिंग कर रहे हों, या नॉन-टेक बैकग्राउंड से हों—आपकी पुरानी पृष्ठभूमि कोई कमजोरी नहीं, बल्कि AI में आपकी सबसे बड़ी महाशक्ति है।
]

#v(2.5pt)

== 36.1 डेवलपर बैकग्राउंड से AI में माइग्रेशन मैट्रिक्स

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*वर्तमान पृष्ठभूमि*], [*आपको पहले से क्या आता है*], [*CTC दोगुनी करने के लिए क्या नया सीखें*]),
  [Java / Spring Boot], [माइक्रोसर्विसेज, हाइबरनेट, मल्टी-थ्रेडिंग, डेटाबेस ट्रांजैक्शन्स।], [Python, LangChain, Spring AI, Vector DBs, vLLM माइक्रोसर्विसेज।],
  [JavaScript / React / Node], [फ्रंटएंड UX, WebSockets, async इवेंट लूप, REST APIs।], [Vercel AI SDK, Generative UI स्ट्रीमिंग, Llama-3 API रैपर्स।],
  [DevOps / SRE], [Docker, Kubernetes, Linux, CI/CD, Prometheus, Terraform।], [GPU ऑर्केस्ट्रेशन, Triton, Ray डिस्ट्रीब्यूटेड, Helm AI चार्ट्स।],
  [QA / मैन्युअल टेस्टिंग], [टेस्ट केसेज, एज केसेज, बग रिपोर्ट्स, रिग्रेशन वेरिफिकेशन।], [LLM इवैल्यूएशन बेंचमार्क, Ragas फ्रेमवर्क, प्रॉम्प्ट इंजेक्शन रेड-टीमिंग।]
)

#v(2pt)
== 36.2 अंतिम माइंडसेट शिफ्ट: डिटर्मिनिस्टिक से प्रोबेबिलिस्टिक

पारंपरिक प्रोग्रामिंग में $2 + 2$ हमेशा $4$ होता है, और `if` कंडीशन या तो चलती है या नहीं। AI में एक ही इनपुट अलग-अलग उत्तर दे सकता है।
- सीनियर AI इंजीनियर का काम लॉजिक लिखना नहीं, बल्कि एम्बेडिंग्स, क्रॉस-एन्कोडर्स और गार्डरेल्स द्वारा *संभाव्यता को नियंत्रित करना (Constraining Probability)* है।

#v(2pt)
#concept-box(title: "इंटरव्यू में 'नो फॉर्मल AI एक्सपीरियंस' आपत्ति का मुकाबला")[
  इंटरव्यू में कहें: *"जहाँ अन्य फ्रेशर्स केवल नोटबुक में API कॉल करना जानते हैं, वहीं मेरे 4 साल के जावा बैकएंड अनुभव का मतलब है कि मैं LLMs के चारों ओर हाई-अवेलेबिलिटी, स्केलेबल माइक्रोसर्विसेज और बैंक-ग्रेड सिक्योरिटी बनाना जानता हूँ।"*
]

#v(2pt)
== 36.4 डेवलपर टेक स्टैक माइग्रेशन मैट्रिक्स
#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*वर्तमान बैकग्राउंड*], [*आपको क्या आता है*], [*CTC दोगुनी करने के लिए क्या सीखें*]),
  [Java / Spring Boot], [माइक्रोसर्विसेज, मल्टी-थ्रेडिंग।], [Python, LangChain, Spring AI, Vector DBs, vLLM।],
  [JavaScript / React], [फ्रंटएंड UX, WebSockets, REST।], [Vercel AI SDK, Generative UI स्ट्रीमिंग, Llama-3 wrappers।],
  [DevOps / SRE], [Docker, Kubernetes, Linux, CI/CD।], [GPU ऑर्केस्ट्रेशन, Triton, Ray, vLLM, Helm charts।],
  [QA / टेस्टिंग], [टेस्ट केसेज, बग रिपोर्ट्स।], [LLM इवैल्यूएशन, Ragas, प्रॉम्प्ट इंजेक्शन रेड-टीमिंग।]
)
