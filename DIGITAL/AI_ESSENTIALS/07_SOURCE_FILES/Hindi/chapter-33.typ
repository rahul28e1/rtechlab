#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[भाग 5: 2027 करियर रोडमैप, सैलरी ब्लूप्रिंट एवं टॉप MNC जॉब्स · अध्याय 33]
= ATS-ऑप्टिमाइज्ड AI रेज़्यूमे इंजीनियरिंग एवं कीवर्ड ब्लूप्रिंट्स

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  75% से अधिक रेज़्यूमे किसी इंसान की आँखों तक पहुँचने से पहले ही Applicant Tracking System (ATS) द्वारा खारिज कर दिए जाते हैं। सही कीवर्ड्स और Google के X-Y-Z फॉर्मूले से रेज़्यूमे को शॉर्टलिस्ट कराना सीखें।
]

#v(2.5pt)

== 33.1 उच्च-रूपांतरण AI रेज़्यूमे के लिए अनिवार्य कीवर्ड्स

#table(
  columns: (1.2fr, 2.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*डोमेन*], [*अनिवार्य कोर कीवर्ड्स (ATS ट्रिगर्स)*], [*रेज़्यूमे में व्यावहारिक वाक्य उदाहरण*]),
  [LLMs & GenAI], [LangChain, LlamaIndex, RAG, Hybrid Search, BM25, Cohere Rerank, Embeddings, Tokenizer], ["LangChain और ChromaDB से 250,000 आंतरिक फाइलों पर RAG पाइपलाइन बनाई, जिससे 99.4% सटीकता मिली।"],
  [फाइन-ट्यूनिंग], [LoRA, QLoRA, PEFT, Unsloth, SFT, DPO, RLHF, Hugging Face, FlashAttention-2], ["QLoRA द्वारा Llama-3-8B को डोमेन डेटा पर फाइन-ट्यून किया, जिससे क्लाउड API बिल में \$18,000/माह की बचत हुई।"],
  [MLOps & डिप्लॉयमेंट], [vLLM, TensorRT-LLM, Triton, Docker, Kubernetes, AWS SageMaker, FastAPI, Prometheus], ["vLLM PagedAttention द्वारा मॉडल सर्व किया, जिससे P95 लेटेंसी 42% घटी और थ्रूपुट 3x बढ़ा।"],
  [मैथ & फंडामेंटल्स], [PyTorch, Vector Calculus, Gradient Descent, Softmax, Cross-Entropy, Eigenvalues], ["कस्टम मल्टी-हेड सेल्फ-अटेंशन और RoPE को PyTorch में स्क्रैच से कोड करके बेंचमार्क किया।"]
)

#v(2pt)
== 33.2 Google X-Y-Z फॉर्मूला (Accomplished X, measured by Y, doing Z)

- *कमजोर वाक्य*: "LangChain पर काम किया और कस्टमर सर्विस के लिए बॉट बनाया।"
- *शक्तिशाली वाक्य*: "LangChain, ChromaDB और Bge-large-reranker द्वारा एंटरप्राइज RAG पाइपलाइन डिजाइन की, जिसने *42% लेटेंसी घटाई* और 250,000 फाइलों को *99.4% सिटेशन सटीकता* से इंडेक्स किया।"

#v(2pt)
#concept-box(title: "LinkedIn पर कोल्ड आउटरीच का गोल्डन नियम")[
  सीधे "सर नौकरी दे दो" का मैसेज न भेजें। इंजीनियरिंग डायरेक्टर को लिखें: *"नमस्ते [नाम], मैंने आपकी टीम का RAG उत्पाद देखा। जटिल प्रश्नों पर लेटेंसी कम करने के लिए मैंने HyDE और री-रैंकिंग से एक प्रोटोटाइप बनाया जिसने P95 लेटेंसी 34% घटाई। यहाँ 1-मिनट का डेमो और कोड लिंक है।"*
]

#v(2pt)
== 33.3 Google X-Y-Z रेज़्यूमे फॉर्मूला उदाहरण
- *कमजोर*: "LangChain पर काम किया और कस्टमर सर्विस बॉट बनाया।"
- *शक्तिशाली*: "LangChain, ChromaDB और Bge-large-reranker द्वारा एंटरप्राइज RAG बनाया, जिसने **42% लेटेंसी घटाई** और 250,000 फाइलों को **99.4% सिटेशन सटीकता** से प्रोसेस किया।"
