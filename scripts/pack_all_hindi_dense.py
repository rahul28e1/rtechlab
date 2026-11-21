# -*- coding: utf-8 -*-
"""
High-Density Master Packer for RTechLab AI Essentials (Hindi Edition)
Mirrors all rich tables, code boxes, and viva questions from English into Hindi,
ensuring every page hits bottom >= 660pt and total pages is EXACTLY 44.
"""

import sys
import os
import subprocess
import fitz

sys.path.append(os.path.join(os.path.dirname(__file__)))

from ai_chapters_hi_part1 import chapters_hi_part1
from ai_chapters_hi_part2 import chapters_hi_part2
from ai_chapters_hi_part3 import chapters_hi_part3
from ai_chapters_hi_part4 import chapters_hi_part4
from ai_chapters_hi_part5 import chapters_hi_part5
from ai_chapters_hi_part6 import chapters_hi_part6

hi_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/Hindi"
out_dir = "DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION"

all_ch_hi = {}
all_ch_hi.update(chapters_hi_part1)
all_ch_hi.update(chapters_hi_part2)
all_ch_hi.update(chapters_hi_part3)
all_ch_hi.update(chapters_hi_part4)
all_ch_hi.update(chapters_hi_part5)
all_ch_hi.update(chapters_hi_part6)

# Rich full Hindi enrichments
hindi_packs = {
    4: """
#v(2pt)
== 4.5 AlexNet का आर्किटेक्चर एवं आधुनिक GPU ट्रेनिंग
#table(
  columns: (1.2fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*घटक*], [*AlexNet (2012)*], [*आधुनिक ResNet / ViT (2027)*]),
  [कनवोल्यूशन], [11x11, 5x5 बड़े कर्नल्स], [लगातार 3x3 छोटे कर्नल्स या 16x16 पैच],
  [एक्टिवेशन], [ReLU (पहला सफल उपयोग)], [GELU / SwiGLU गेटेड एक्टिवेशन],
  [हार्डवेयर], [2x NVIDIA GTX 580 (3GB VRAM)], [8x NVIDIA H100 (640GB HBM3)]
)
""",

    5: """
#v(2pt)
#tech-spotlight-box(title: "AI का भविष्य: 2027 से 2030 तक का दृष्टिकोण")[
  अगले 3 वर्षों में AI चैट इंटरफेस से निकलकर स्वायत्त रोबोटिक्स, वैज्ञानिक प्रयोगशालाओं में स्वतः शोध, और राष्ट्रीय रक्षा ग्रिड्स में पूरी तरह समाहित हो जाएगा।
]
""",

    6: """
#v(2.5pt)
== 6.4 स्वायत्त एजेंसी क्षितिज एवं डिसेप्टिव अलाइनमेंट
- *इंस्ट्रूमेंटल कन्वर्जेंस*: बुद्धिमान एजेंट स्वाभाविक रूप से आत्म-संरक्षण और संसाधन अधिग्रहण की दिशा में बढ़ते हैं।
- *सैंडबॉक्सिंग मानक*: उच्च-प्रभाव वाले AI एजेंट्स को क्रिप्टोग्राफ़िक रूप से सुरक्षित माइक्रो-VMs (Firecracker / gVisor) में अलग रखा जाता है।
""",

    8: """
#v(2.5pt)
== 8.4 बायस-वेरिएंस ट्रेडऑफ एवं L1/L2 रेगुलराइजेशन
$ "Expected Error" = "Bias"^2 + "Variance" + "Irreducible Noise" sigma^2 $
#table(
  columns: (1.2fr, 1.8fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*तकनीक*], [*पेनल्टी सूत्र*], [*ज्यामितीय व्यवहार*], [*कब उपयोग करें*]),
  [L1 (Lasso)], [$lambda sum |w_i|$], [डायमंड कॉर्नर; भारों को सीधा 0 करता है।], [फीचर सिलेक्शन / स्पार्स डेटा।],
  [L2 (Ridge)], [$lambda sum w_i^2$], [गोलाकार सीमा; भारों को सिकोड़ता है।], [मल्टीकोलिनियर फीचर्स मौजूद हों।],
  [ElasticNet], [$alpha L_1 + (1-alpha) L_2$], [स्पार्सिटी + ग्रुप सिलेक्शन।], [सहसंबद्ध हाई-डायमेंशनल फीचर्स।]
)
""",

    10: """
#v(2.5pt)
== 10.4 प्रोडक्शन में मल्टी-आर्म्ड बैंडिट्स
- **एक्सप्लोरेशन बनाम एक्सप्लोइटेशन**: नए सुझाव दिखाने और ज्ञात लोकप्रिय आइटम दिखाने के बीच संतुलन।
- **Upper Confidence Bound (UCB)**: $mu_i + c sqrt(ln(t) / n_i)$ द्वारा सर्वोत्तम क्लिक-थ्रू दर प्राप्त करना।
""",

    11: """
#v(2.5pt)
== 11.4 वैनिशिंग ग्रेडिएंट एवं लेयर नॉर्मलाइजेशन
$ (partial L) / (partial W_1) = (partial L) / (partial a_L) product_(l=2)^L (partial a_l) / (partial a_(l-1)) dot (partial a_1) / (partial W_1) $
- **LayerNorm**: टोकन के चैनल्स के सापेक्ष एक्टिवेशंस को नॉर्मलाइज़ करता है।
- **RMSNorm**: मीन गणना हटाकर थ्रूपुट 7% तेज करता है (Llama-3 मानक)।
""",

    16: """
#v(2.5pt)
== 16.3 उत्पादन में KV कैश (KV Cache) बॉटलनैक
- **मेमोरी सूत्र**: $"Memory" = 2 times "Layers" times "Heads" times d_"head" times "SeqLen" times "Batch" times "Bytes"$
- **Grouped-Query Attention (GQA)**: 8 क्वेरी हेड्स 1 KV हेड साझा करते हैं, जिससे VRAM खपत 80% घटती है।
- **PagedAttention**: लिनक्स कर्नल की तरह वर्चुअल मेमोरी पेजों में KV कैश स्टोर करके VRAM बर्बादी शून्य करता है।
""",

    17: """
#v(2.5pt)
== 17.3 डायरेक्ट प्रेफरेंस ऑप्टिमाइज़ेशन (DPO) बनाम PPO
#table(
  columns: (1.2fr, 2.2fr, 2fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*पैमाना*], [*PPO (Reinforcement Learning)*], [*DPO (Direct Optimization)*], [*एंटरप्राइज चयन*]),
  [रिवॉर्ड मॉडल], [अलग रिवॉर्ड नेटवर्क अनिवार्य।], [पॉलिसी लॉस में अंतर्निहित।], [DPO (सरल)],
  [GPU VRAM], [अत्यधिक (4 मॉडल कॉपियां लोड)।], [कम (केवल पॉलिसी + रेफरेंस)।], [DPO 60% VRAM बचाता है],
  [ट्रेनिंग स्थिरता], [हाइपरपैरामीटर संवेदनशील।], [क्रॉस-एंट्रॉपी की तरह स्थिर।], [DPO उद्योग मानक]
)
""",

    18: """
#v(2.5pt)
== 18.4 स्पेक्युलेटिव डिकोडिंग एवं Medusa आर्किटेक्चर
- एक छोटा ड्राफ्ट मॉडल (Llama-3-1B) 5 टोकन आगे की भविष्यवाणी करता है।
- बड़ा 70B मॉडल एक ही GPU पास में सभी 5 टोकन का समानांतर सत्यापन करता है। इससे थ्रूपुट **2.5x से 3.2x** बढ़ जाता है।
""",

    20: """
#v(2.5pt)
== 20.3 DSPy: एल्गोरिदमिक प्रॉम्प्ट ऑप्टिमाइज़ेशन
- स्टैनफोर्ड का DSPy फ्रेमवर्क मैन्युअल प्रॉम्प्टिंग को कंपाइल किए गए कोड से बदलता है।
- **Teleprompters**: सैकड़ों प्रॉम्प्ट वेरिएशन्स का स्वचालित मूल्यांकन करके इष्टतम प्रॉम्प्ट खोजते हैं।
""",

    23: """
#v(2.5pt)
== 23.3 हाई-बैंडविड्थ इंटरकनेक्ट्स: InfiniBand बनाम RoCE
- **InfiniBand (NVIDIA Quantum-X800)**: 800 Gbps प्रति पोर्ट, सब-माइक्रोसेकंड लेटेंसी; फाउंडेशन मॉडल प्री-ट्रेनिंग का मानक।
- **RoCE (RDMA over Ethernet)**: 40% कम इंफ्रास्ट्रक्चर लागत में मानक ईथरनेट पर RDMA सपोर्ट; एंटरप्राइज इनफरेंस का मानक।
""",

    24: """
#v(2pt)
== 24.3 ASML EUV लिथोग्राफी एवं TSMC CoWoS पैकेजिंग
- **ASML High-NA EUV**: 13.5nm एक्सट्रीम अल्ट्रावायलेट लाइट से 2nm ट्रांजिस्टर बनाना (लागत: \\$350 मिलियन प्रति मशीन)।
- **TSMC CoWoS**: सिलिकॉन इंटरपोजर पर GPU कंप्यूट डाई और HBM3e स्टैक को जोड़ना। वैश्विक AI चिप की कमी का असली कारण CoWoS पैकेजिंग की कमी है।
""",

    26: """
#v(2pt)
== 26.3 भाषिणी ओपन API इंटीग्रेशन
#code-box(title: "BHASHINI ASR पायथन कॉल")[
```python
import requests
url = "https://dhruva-api.bhashini.gov.in/services/inference/asr"
headers = {"ulcaApiKey": "YOUR_API_KEY", "Content-Type": "application/json"}
payload = {"pipelineTasks": [{"taskType": "asr", "config": {"language": {"sourceLanguage": "hi"}}}]}
print("Bhashini ASR Pipeline Ready.")
```
]
""",

    27: """
#v(2pt)
== 27.3 एंटरप्राइज AI ROI मेट्रिक्स
#table(
  columns: (1.5fr, 1.8fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 1.8pt),
  table.header([*पैमाना*], [*प्रोप्राइटरी क्लाउड API*], [*सेल्फ-होस्टेड vLLM (4x H100)*]),
  [मासिक टोकन वॉल्यूम], [5 करोड़ (50M) टोकन], [5 करोड़ (50M) टोकन],
  [मासिक बिल], [\\$1,250 – \\$2,500 API बिल], [\\$650 फिक्स्ड क्लाउड लीज],
  [डेटा सुरक्षा], [विदेशी तीसरे पक्ष पर लॉग्स], [100% प्राइवेट VPC संप्रभुता]
)
""",

    29: """
#v(2pt)
== 29.4 शीर्ष भारतीय एंटरप्राइज GCC AI हब्स
- **बेंगलुरु एवं हैदराबाद**: फ्रंटियर मॉडल ट्रेनिंग, हाई-स्केल इनफरेंस इंफ्रास्ट्रक्चर और AI प्लेटफॉर्म इंजीनियरिंग।
- **पुणे एवं दिल्ली-NCR**: ऑटोमोटिव ADAS विज़न, फिनटेक रिस्क स्कोरिंग और राष्ट्रीय रक्षा AI सिस्टम्स।
""",

    30: """
#v(2pt)
== 30.3 हाई-यील्ड विशेषज्ञता चयन रणनीति
#table(
  columns: (1.4fr, 1.6fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*ट्रैक*], [*कोर टेक्नोलॉजी स्टैक*], [*प्रारंभिक CTC (भारत)*], [*सीनियर CTC (भारत)*]),
  [जनरेटिव AI इंजीनियर], [Python, LangChain, LlamaIndex, vLLM], [₹6.5 – ₹12 LPA], [₹28 – ₹45+ LPA],
  [MLOps & AI प्लेटफॉर्म], [Docker, K8s, Ray, Triton, MLflow], [₹8.0 – ₹14 LPA], [₹32 – ₹55+ LPA],
  [AI रिसर्च साइंटिस्ट], [PyTorch, CUDA, JAX, Distributed], [₹12 – ₹20 LPA], [₹40 – ₹70+ LPA],
  [AI सॉल्यूशंस आर्किटेक्ट], [AWS/Azure AI, Cloud, FinOps], [₹14 – ₹24 LPA], [₹45 – ₹80+ LPA]
)
""",

    31: """
#v(2pt)
== 31.3 24-सप्ताह का दैनिक समय प्रबंधन
- *सोमवार से शुक्रवार (2 घंटे रोज)*: 45 मिनट थ्योरी $->$ 60 मिनट PyTorch/LangChain कोडिंग $->$ 15 मिनट डॉक्यूमेंटेशन।
- *शनिवार और रविवार (5 घंटे रोज)*: एंड-टू-एंड प्रोजेक्ट्स बनाना, GitHub README लिखना, और लिंक्डइन पर ब्रेकडाउन शेयर करना।
""",

    32: """
#v(2pt)
== 32.3 पोर्टफोलियो डॉकर कंपोज़ आर्किटेक्चर
#code-box(title: "PORTFOLIO DOCKER COMPOSE ARCHITECTURE")[
```yaml
services:
  qdrant_db:
    image: qdrant/qdrant:latest
    ports: ["6333:6333"]
  ai_backend:
    build: ./backend
    ports: ["8000:8000"]
    environment:
      - OPENAI_API_BASE=http://vllm_engine:8000/v1
  frontend_ui:
    build: ./frontend
    ports: ["8501:8501"]
```
]
""",

    33: """
#v(2pt)
== 33.3 Google X-Y-Z रेज़्यूमे फॉर्मूला उदाहरण
- *कमजोर*: "LangChain पर काम किया और कस्टमर सर्विस बॉट बनाया।"
- *शक्तिशाली*: "LangChain, ChromaDB और Bge-large-reranker द्वारा एंटरप्राइज RAG बनाया, जिसने **42% लेटेंसी घटाई** और 250,000 फाइलों को **99.4% सिटेशन सटीकता** से प्रोसेस किया।"
""",

    34: """
#v(2pt)
== 34.3 30-दिवसीय सर्टिफिकेशन स्टडी टाइमटेबल
#table(
  columns: (1.2fr, 2.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 1.8pt),
  table.header([*चरण*], [*दैनिक अध्ययन लक्ष्य*], [*माइलस्टोन*]),
  [दिन 1–10], [आधिकारिक क्लाउड लैब्स और स्किल बैज पूरे करें।], [4 स्किल बैज।],
  [दिन 11–20], [आर्किटेक्चर गाइड्स, प्राइसिंग टियर्स और IAM सुरक्षा।], [2 प्रैक्टिस एग्जाम ($> 75\%$).],
  [दिन 21–28], [रियल टेस्ट माहौल में 3 फुल-लेंथ मॉक टेस्ट दें।], [स्कोर $> 85\%$।],
  [दिन 29–30], [गलत उत्तरों का रिव्यू करें और फॉर्मूला शीट्स दोहराएं।], [आधिकारिक परीक्षा पास करें।]
)
""",

    35: """
#v(2pt)
== 35.3 एंटरप्राइज AI एजेंसी प्राइसिंग मैट्रिक्स
#table(
  columns: (1fr, 1.8fr, 1.8fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*टियर*], [*सेवा का स्वरूप*], [*क्लाइंट को व्यावसायिक लाभ*], [*मानक शुल्क*]),
  [टियर 1: वेब बॉट], [वेबसाइट विजेट + FAQ सिंक।], [60% बेसिक टिकट्स समाप्त।], [₹35,000 – ₹50,000],
  [टियर 2: प्राइवेट RAG], [10,000 फाइलों पर सिमेंटिक सर्च।], [रिसर्च समय घंटों से सेकंड में।], [₹75,000 – ₹1,50,000],
  [टियर 3: स्वायत्त एजेंट], [मल्टी-टूल एजेंट (SQL + ईमेल)।], [रिसेप्शनिस्ट/क्लर्क ऑटोमेशन।], [₹1,50,000 – ₹2,80,000],
  [टियर 4: पाइपलाइन], [ऑन-प्रिमाइसेस vLLM डिप्लॉयमेंट।], [100% डेटा संप्रभुता।], [₹3,50,000 – ₹6,00,000+]
)
""",

    36: """
#v(2pt)
== 36.4 डेवलपर टेक स्टैक माइग्रेशन मैट्रिक्स
#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*वर्तमान बैकग्राउंड*], [*आपको क्या आता है*], [*CTC दोगुनी करने के लिए क्या सीखें*]),
  [Java / Spring Boot], [माइक्रोसर्विसेज, मल्टी-थ्रेडिंग।], [Python, LangChain, Spring AI, Vector DBs, vLLM।],
  [JavaScript / React], [फ्रंटएंड UX, WebSockets, REST।], [Vercel AI SDK, Generative UI स्ट्रीमिंग, Llama-3 wrappers।],
  [DevOps / SRE], [Docker, Kubernetes, Linux, CI/CD।], [GPU ऑर्केस्ट्रेशन, Triton, Ray, vLLM, Helm charts।],
  [QA / टेस्टिंग], [टेस्ट केसेज, बग रिपोर्ट्स।], [LLM इवैल्यूएशन, Ragas, प्रॉम्प्ट इंजेक्शन रेड-टीमिंग।]
)
""",

    41: """
#v(2.5pt)
== 41.4 वैश्विक AI विनियामक ढांचे की तुलना
#table(
  columns: (1.2fr, 1.8fr, 2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*अधिकार क्षेत्र*], [*मुख्य कानून*], [*प्राथमिक फोकस*], [*दृष्टिकोण*]),
  [यूरोपीय संघ], [EU AI Act (2024)], [सख्त जोखिम वर्गीकरण; 7% टर्नओवर जुर्माना।], [कठोर / पूर्व-सावधानी],
  [संयुक्त राज्य अमेरिका], [Executive Order 14110], [विशाल मॉडल्स ($> 10^(26)$ FLOPs) की अनिवार्य रिपोर्टिंग।], [इनोवेशन / सुरक्षा],
  [भारत], [DPDP Act + IndiaAI], [डेटा सहमति, सॉवरेन कंप्यूट सब्सिडी, स्टार्टअप विकास।], [लोकतंत्रीकृत / विकास],
  [चीन], [Generative AI उपाय], [अनिवार्य सुरक्षा मूल्यांकन एवं सामाजिक संरेखण।], [राज्य-निर्देशित]
)
""",

    42: """
#v(2pt)
== 42.4 RTechLab इंजीनियर का आधिकारिक सत्यनिष्ठा संकल्प
#concept-box(title: "राष्ट्र एवं मानवता के प्रति हमारी प्रतिबद्धता")[
  एक RTechLab प्रमाणित AI इंजीनियर के रूप में, मैं सत्यनिष्ठा से प्रतिज्ञा करता हूँ कि मैं न्यूरल मॉडल्स को पारदर्शिता से परिनियोजित करूँगा, डेटा संप्रभुता द्वारा नागरिक गोपनीयता की रक्षा करूँगा, कम्प्यूट संसाधनों का सदुपयोग करूँगा, और ऐसी तकनीक का निर्माण करूँगा जो समाज का उत्थान करे और भारत को वैश्विक AI पटल पर अग्रणी बनाए।
]
"""
}

# Apply Hindi packs
for ch_num, extra in hindi_packs.items():
    if ch_num in all_ch_hi:
        all_ch_hi[ch_num] = all_ch_hi[ch_num] + extra

print(f"[INFO] Writing all 42 densely packed Hindi chapters...")
for ch_num, content in all_ch_hi.items():
    ch_path = os.path.join(hi_dir, f"chapter-{ch_num:02d}.typ")
    with open(ch_path, "w", encoding="utf-8") as f:
        f.write(content)

# Compile
pdf_out = os.path.join(out_dir, "AI-Essentials-Hindi-Edition-1.pdf")
cmd = ["typst", "compile", "--root", ".", os.path.join(hi_dir, "ai-master-guide-hi.typ"), pdf_out]
res = subprocess.run(cmd, capture_output=True, text=True)

if res.returncode != 0:
    print(f"[ERROR] Compilation failed:\n{res.stderr}")
    sys.exit(1)

doc = fitz.open(pdf_out)
print(f"\n[SUCCESS] Compiled successfully to {pdf_out}! Total Pages: {len(doc)} (Target: 44)")

underfilled = []
for i in range(2, len(doc)):
    page = doc[i]
    blocks = [b for b in page.get_text('blocks') if b[1] > 40 and b[3] < 800 and 'C E R T I F I E D' not in b[4] and 'RTECHLAB' not in b[4] and 'Technology Made' not in b[4]]
    bottom = max(b[3] for b in blocks) if blocks else 0
    top = min(b[1] for b in blocks) if blocks else 0
    fill = ((bottom - top) / 720.0) * 100
    print(f"  Page {i+1:02d} (Ch {i-1:02d}): bottom={bottom:5.1f} pt, fill={fill:5.1f}%")
    if bottom < 660:
        underfilled.append((i+1, bottom))

if len(doc) == 44:
    print("\n[PERFECT] EXACTLY 44 PAGES MAINTAINED IN HINDI MASTER EDITION!")
else:
    print(f"\n[WARNING] Page count is {len(doc)} (Target: 44)!")

if not underfilled:
    print("[PERFECT] ZERO UNDERFILLED PAGES! Every single page is densely packed!")
else:
    print(f"[INFO] Pages under 660pt: {len(underfilled)} -> {underfilled}")
