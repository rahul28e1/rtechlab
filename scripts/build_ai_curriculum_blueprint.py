import os

def generate_ai_blueprints():
    engine_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/07_PUBLISHING_ENGINE"
    os.makedirs(engine_dir, exist_ok=True)

    # -------------------------------------------------------------
    # ENGLISH BLUEPRINT (PAGE 2)
    # -------------------------------------------------------------
    en_content = """// =============================================================================
// RTECHLAB MASTER CURRICULUM BLUEPRINT — ARTIFICIAL INTELLIGENCE (ENGLISH EDITION 1)
// Page 2: Complete 42-Topic Enterprise Production Curriculum Matrix
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#text(size: 7.2pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[OFFICIAL ARTIFICIAL INTELLIGENCE BLUEPRINT · 42 PRODUCTION MODULES & HANDS-ON LABS]
#v(-3pt)
= Artificial Intelligence: Master Enterprise Curriculum

#v(-2pt)
#text(size: 6.5pt, fill: rgb("#1E293B").lighten(20%))[
  Comprehensive curriculum matrix spanning 1950 Foundations to 2027 Agentic AI, Indic LLMs, GPU Superclusters, and ₹38 LPA Career Blueprints. Standardized under the RTechLab 2027 DeepTech Academic & Enterprise Framework.
]

#v(1pt)

#set text(size: 6.1pt)
#set par(leading: 0.35em)

#table(
  columns: (0.65fr, 2.35fr, 0.9fr, 3.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.25pt + rgb(15, 23, 42, 12%),
  inset: (x: 2pt, y: 0.5pt),
  table.header(
    [*Module*],
    [*Core Academic Subject*],
    [*Domain*],
    [*High-Yield Technical Competencies & Production Lab Focus*]
  ),
  [Ch 01], [The Dawn of Intelligent Machines], [History], [1950 Alan Turing Test, Dartmouth 1956 Workshop, Symbolic AI & Logic Theorist.],
  [Ch 02], [Golden Age, Perceptrons & First AI Winter], [History], [Rosenblatt Perceptron 1957, Minsky-Papert XOR critique, 1974-1980 DARPA budget cuts.],
  [Ch 03], [Expert Systems & Second AI Winter], [History], [1980s Knowledge Engineering, MYCIN, DENDRAL, LISP Machines & Market Crash 1987.],
  [Ch 04], [The Statistical AI Renaissance], [History], [Deep Blue 1997, Statistical NLP, ImageNet Challenge 2012, AlexNet & Parallel GPUs.],
  [Ch 05], [AI Evolution Timeline & Scaling Laws], [History], [1950-2027 Milestones, Moore's Law vs Huang's Law, GFLOP Compute Cost Collapse.],
  [Ch 06], [AI Taxonomy: ANI vs AGI vs ASI], [Taxonomy], [Narrow vs General vs Superintelligence, Agency Horizons & ARC-AGI Benchmark.],
  [Ch 07], [Machine Learning Hierarchy & Paradigms], [ML Core], [Supervised, Unsupervised, Semi-Supervised, Reinforcement & Self-Supervised Learning.],
  [Ch 08], [Supervised Learning: Regressors & Classifiers], [ML Core], [Linear/Logistic Regression, Decision Trees, Random Forests, XGBoost, Loss Functions.],
  [Ch 09], [Unsupervised Learning & Clustering], [ML Core], [K-Means Clustering, PCA Dimensionality Reduction, t-SNE, Anomaly Fraud Detection.],
  [Ch 10], [Biological to Artificial Neurons], [Neural Nets], [Synapse vs Weight, Activation Thresholds, Sigmoid, Tanh, ReLU, GELU, Swish functions.],
  [Ch 11], [Deep Neural Networks & Backpropagation], [Deep Learning], [Forward Pass, Chain Rule Calculus, Gradient Descent Variants (SGD, Momentum, AdamW).],
  [Ch 12], [Convolutional Neural Networks (CNNs)], [Computer Vision], [Kernels, Strides, Padding, Pooling, Feature Maps, ResNet Skips, YOLO Object Detection.],
  [Ch 13], [Sequence Modeling: RNNs to LSTMs & GRUs], [NLP], [Sequential Dependencies, Vanishing Gradients, Forget Gates, Cell Memory State.],
  [Ch 14], [Hands-on Lab: Neural Net from Scratch], [Python Lab], [NumPy Matrix Implementation: Forward Pass, Backprop & Loss Optimization.],
  [Ch 15], [The 2017 Transformer Revolution], [GenAI Core], [Attention Is All You Need, Scaled Dot-Product, Multi-Head Attention, Positional Encoding.],
  [Ch 16], [Anatomy of Large Language Models (LLMs)], [GenAI Core], [Byte-Pair Encoding (BPE), Tokenization, Context Windows (2M), Embeddings, Sampling.],
  [Ch 17], [LLM Training Lifecycle & Alignment], [GenAI Core], [Pre-training Next-Token, Supervised Fine-Tuning (SFT), RLHF, DPO, LoRA / QLoRA.],
  [Ch 18], [Diffusion Models & Multimodal AI], [GenAI Vision], [Latent Diffusion, Forward Gaussian Noise, Reverse Denoising U-Net/DiT, CLIP Alignment.],
  [Ch 19], [Enterprise RAG Architecture], [Enterprise AI], [Dense Vector Search, Chunking Strategies, Vector DBs (Chroma/Pinecone), Cross-Encoders.],
  [Ch 20], [Enterprise Prompt Engineering], [GenAI Prompting], [Zero-shot, Few-shot, Chain-of-Thought (CoT), Tree-of-Thoughts (ToT), Guardrails.],
  [Ch 21], [Autonomous Agentic AI & Tool Calling], [Agentic AI], [ReAct Loop (Reason+Act+Observe), Function Calling, Memory, Multi-Agent Swarms.],
  [Ch 22], [Production Lab: Building Enterprise RAG], [LangChain Lab], [End-to-End Vector Retrieval, Document Ingestion, LangChain, Local Llama-3 Inference.],
  [Ch 23], [Enterprise AI Hardware & GPU Clusters], [Infrastructure], [NVIDIA Hopper H100 vs Blackwell B200, Tensor Cores, NVLink 900 GB/s, HBM3e Memory.],
  [Ch 24], [Global AI Geopolitics & Silicon Sovereignty], [Geopolitics], [US Export Controls, CHIPS Act, ASML EUV Lithography, TSMC 3nm/2nm Foundries.],
  [Ch 25], [India's AI Revolution: IndiaAI Mission], [IndiaAI], [₹10,372 Crore Budget, 10,000+ GPU Sovereign Cloud Compute, AI Innovation Kendras.],
  [Ch 26], [Sovereign Indic LLMs & Digital Infrastructure], [Indic AI], [Sarvam AI, Krutrim, Bhashini (22 Indian Languages), UPI & Aadhaar DPI Integration.],
  [Ch 27], [Industrial Case Studies: High-Impact AI], [Industry], [Healthcare (AlphaFold/Oncology), Fintech High-Frequency Fraud, Tesla FSD & Waymo.],
  [Ch 28], [Production Lab: Serving LLMs with vLLM], [MLOps Lab], [PagedAttention, Continuous Batching, KV-Cache Optimization, OpenAI-Compatible APIs.],
  [Ch 29], [2027 AI Job Market & Salary Ladder], [Career], [Traditional Coding vs AI Engineering, India ₹4.5L-₹38L+ & Global $75k-$250k+ Salary Ladder.],
  [Ch 30], [Six High-Paying AI Specializations], [Career], [AI/ML Engineer, GenAI/LLM Engineer, MLOps Architect, AI Researcher, AI PM, Consultant.],
  [Ch 31], [0-to-6 Month Complete Learning Roadmap], [Roadmap], [Step-by-Step Structured Syllabus: Math/Python to Deep Learning, RAG & Agents.],
  [Ch 32], [The Million-Dollar AI Project Portfolio], [Portfolio], [5 Enterprise GitHub Projects: Financial Agent, Indic Medical Bot, Edge Vision, LLM Gateway.],
  [Ch 33], [ATS-Optimized AI Resume Engineering], [Career], [STAR Method, Action Verbs, High-Yield Keywords (PyTorch, vLLM, Docker), Red Flags.],
  [Ch 34], [Global & Indian AI Certification Playbook], [Credentials], [AWS ML Specialty, GCP Professional ML Engineer, Azure AI-102, NVIDIA DLI Standards.],
  [Ch 35], [Freelance AI Consulting & Agency Blueprint], [Monetization], [Building Custom AI Agents for SMBs, Prompt Advisory, ₹50k-₹2.5L Monthly Retainers.],
  [Ch 36], [Career Transition Playbook for Non-Tech/Devs], [Transition], [Bridge Strategy for Software Engineers, No-Code/Low-Code AI Ops & Workflow Roles.],
  [Ch 37], [Top 50 MNC AI Interview Vault: Core ML & Math], [Interview], [Q01-Q13: Bias-Variance, Overfitting, Loss Functions, Regularization, Optimization.],
  [Ch 38], [Top 50 MNC AI Interview Vault: Transformers], [Interview], [Q14-Q26: Attention Mechanics, Positional Encodings, Vanishing Gradients, LayerNorm.],
  [Ch 39], [Top 50 MNC AI Interview Vault: LLMs & RAG], [Interview], [Q27-Q38: Quantization (INT8/FP4), PagedAttention, Vector DB Indexing, LoRA Adapters.],
  [Ch 40], [Top 50 MNC AI Interview Vault: System Design], [Interview], [Q39-Q50: 10M DAU Recommendation System, Enterprise Document RAG, Low-Latency Voice.],
  [Ch 41], [AI Safety, Ethics & Global Governance], [Ethics], [EU AI Act Risk Tiers, Copyright/Fair Use, Deepfake Detection, AGI Alignment Protocols.],
  [Ch 42], [Official RTechLab Certificate of Mastery], [Certification], [Formal Completion Certificate, Student Verification Link, QR Code & Alumni Seal.]
)
"""

    # -------------------------------------------------------------
    # HINDI BLUEPRINT (PAGE 2)
    # -------------------------------------------------------------
    hi_content = """// =============================================================================
// RTECHLAB MASTER CURRICULUM BLUEPRINT — ARTIFICIAL INTELLIGENCE (HINDI EDITION 1)
// Page 2: Complete 42-Topic Enterprise Production Curriculum Matrix
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[ऑफिशियल आर्टिफिशियल इंटेलिजेंस ब्लूप्रिंट · 42 प्रोडक्शन मॉड्यूल्स एवं हैंड्स-ऑन लैब्स]
#v(-3pt)
= आर्टिफिशियल इंटेलिजेंस: मास्टर एंटरप्राइज करिकुलम

#v(-2pt)
#text(size: 6.5pt, font: ("Nirmala UI", "Segoe UI"), fill: rgb("#1E293B").lighten(20%))[
  1950 के बेसिक्स से 2027 एजेंटिक AI, इंडिक LLMs, GPU सुपरक्लस्टर्स और ₹38 LPA करियर ब्लूप्रिंट का सम्पूर्ण रोडमैप। RTechLab 2027 डीपटेक अकादमिक एवं कॉर्पोरेट फ्रेमवर्क के तहत मानकीकृत।
]

#v(1pt)

#set text(size: 6.1pt, font: ("Nirmala UI", "Segoe UI"))
#set par(leading: 0.35em)

#table(
  columns: (0.65fr, 2.35fr, 0.9fr, 3.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.25pt + rgb(15, 23, 42, 12%),
  inset: (x: 2pt, y: 0.5pt),
  table.header(
    [*मॉड्यूल*],
    [*मुख्य विषय*],
    [*डोमेन*],
    [*हाई-यील्ड तकनीकी क्षमताएं एवं प्रोडक्शन लैब फोकस*]
  ),
  [Ch 01], [बुद्धिमान मशीनों की शुरुआत (1950)], [इतिहास], [1950 एलन ट्यूरिंग टेस्ट, डार्टमाउथ 1956 वर्कशॉप, सिम्बोलिक AI एवं लॉजिक थ्योरिस्ट।],
  [Ch 02], [स्वर्ण युग, परसेप्ट्रॉन एवं पहला AI विंटर], [इतिहास], [रोज़ेनब्लैट परसेप्ट्रॉन 1957, मिंस्की-पैपर्ट XOR आलोचना, 1974-1980 DARPA बजट कटौती।],
  [Ch 03], [एक्सपर्ट सिस्टम्स एवं दूसरा AI विंटर], [इतिहास], [1980 नॉलेज इंजीनियरिंग, MYCIN, DENDRAL, LISP मशीनें एवं 1987 मार्केट क्रैश।],
  [Ch 04], [सांख्यिकीय AI का पुनर्जागरण], [इतिहास], [डीप ब्लू 1997, सांख्यिकीय NLP, इमेजनेट चैलेंज 2012, एलेक्सनेट एवं पैरेलल GPU क्रांति।],
  [Ch 05], [AI विकास टाइमलाइन एवं स्केलिंग नियम], [इतिहास], [1950-2027 मील के पत्थर, मूर बनाम हुआंग का नियम, GFLOP कंप्यूट लागत में भारी गिरावट।],
  [Ch 06], [AI वर्गीकरण: ANI बनाम AGI बनाम ASI], [वर्गीकरण], [नैरो बनाम जनरल बनाम सुपरइंटेलिजेंस, ऑटोनॉमस एजेंसी एवं ARC-AGI बेंचमार्क।],
  [Ch 07], [मशीन लर्निंग पदानुक्रम एवं प्रतिमान], [ML कोर], [सुपरवाइज्ड, अनसुपरवाइज्ड, सेमी-सुपरवाइज्ड, रीइन्फोर्समेंट एवं सेल्फ-सुपरवाइज्ड लर्निंग।],
  [Ch 08], [सुपरवाइज्ड लर्निंग: रिग्रेशन व क्लासिफायर], [ML कोर], [लीनियर/लॉजिस्टिक्स रिग्रेशन, डिसीजन ट्री, रैंडम फॉरेस्ट, XGBoost, लॉस फंक्शन्स।],
  [Ch 09], [अनसुपरवाइज्ड लर्निंग एवं क्लस्टरिंग], [ML कोर], [K-मीन्स क्लस्टरिंग, PCA डायमेंशनलिटी रिडक्शन, t-SNE, एनोमली फ्रॉड डिटेक्शन।],
  [Ch 10], [जैविक न्यूरॉन से कृत्रिम न्यूरॉन तक], [न्यूरल नेट], [साइनेप्स बनाम वेट, एक्टिवेशन थ्रेशोल्ड, सिग्मॉइड, Tanh, ReLU, GELU, स्विश फंक्शन्स।],
  [Ch 11], [डीप न्यूरल नेटवर्क्स एवं बैकप्रोपैगेशन], [डीप लर्निंग], [फॉरवर्ड पास, चेन रूल कैलकुलस, ग्रेडिएंट डिसेंट वेरिएंट्स (SGD, मोमेंटम, AdamW)।],
  [Ch 12], [कन्वोल्यूशनल न्यूरल नेटवर्क्स (CNNs)], [कंप्यूटर विजन], [कर्नेल्स, स्ट्राइड, पैडिंग, पूलिंग, फीचर मैप्स, ResNet स्किप्स, YOLO ऑब्जेक्ट डिटेक्शन।],
  [Ch 13], [अनुक्रम मॉडलिंग: RNN से LSTM एवं GRU], [NLP], [सीक्वेंशियल डिपेंडेंसी, वैनिशिंग ग्रेडिएंट्स, फॉरगेट गेट्स, सेल मेमोरी स्टेट।],
  [Ch 14], [प्रैक्टिकल लैब: स्क्रैच से न्यूरल नेटवर्क], [पायथन लैब], [NumPy मैट्रिक्स इम्प्लीमेंटेशन: फॉरवर्ड पास, बैकप्रॉप एवं लॉस ऑप्टिमाइजेशन।],
  [Ch 15], [2017 ट्रांसफार्मर क्रांति], [GenAI कोर], [अटेंशन इज़ ऑल यू नीड, स्केल्ड डॉट-प्रोडक्ट, मल्टी-हेड अटेंशन, पोजीशनल एन्कोडिंग।],
  [Ch 16], [लार्ज लैंग्वेज मॉडल्स (LLMs) की संरचना], [GenAI कोर], [बाइट-पेयर एन्कोडिंग (BPE), टोकनाइजेशन, कॉन्टेक्स्ट विंडो (2M), एम्बेडिंग्स, सैंपलिंग।],
  [Ch 17], [LLM ट्रेनिंग लाइफसाइकिल एवं अलाइनमेंट], [GenAI कोर], [प्री-ट्रेनिंग नेक्स्ट-टोकन, सुपरवाइज्ड फाइन-ट्यूनिंग (SFT), RLHF, DPO, LoRA / QLoRA।],
  [Ch 18], [डिफ्यूजन मॉडल्स एवं मल्टीमॉडल AI], [GenAI विजन], [लेटेंट डिफ्यूजन, फॉरवर्ड गॉसियन नॉइज़, रिवर्स डिनॉइज़िंग U-Net/DiT, CLIP अलाइनमेंट।],
  [Ch 19], [एंटरप्राइज RAG आर्किटेक्चर], [एंटरप्राइज AI], [डेंस वेक्टर सर्च, चंकिंग स्ट्रैटेजी, वेक्टर DBs (Chroma/Pinecone), क्रॉस-एन्कोडर्स।],
  [Ch 20], [एंटरप्राइज प्रॉम्प्ट इंजीनियरिंग], [प्रॉम्प्टिंग], [ज़ीरो-शॉट, फ्यू-शॉट, चेन-ऑफ-थॉट (CoT), ट्री-ऑफ-थॉट्स (ToT), सेफ गार्डरेल्स।],
  [Ch 21], [ऑटोनॉमस एजेंटिक AI एवं टूल कॉलिंग], [एजेंटिक AI], [ReAct लूप (रीजन+एक्ट+ऑब्जर्व), फंक्शन कॉलिंग, मेमोरी, मल्टी-एजेंट स्वामर्स।],
  [Ch 22], [प्रोडक्शन लैब: एंटरप्राइज RAG पाइपलाइन], [LangChain लैब], [वेक्टर रिट्रीवल, डॉक्यूमेंट इंजेक्शन, LangChain, लोकल Llama-3 इन्फरेंस।],
  [Ch 23], [एंटरप्राइज AI हार्डवेयर एवं GPU क्लस्टर्स], [इन्फ्रास्ट्रक्चर], [NVIDIA हॉपर H100 बनाम ब्लैकवेल B200, टेंसर कोर, NVLink 900 GB/s, HBM3e मेमोरी।],
  [Ch 24], [वैश्विक AI भू-राजनीति एवं सेमीकंडक्टर संप्रभुता], [भू-राजनीति], [अमेरिकी निर्यात नियंत्रण, CHIPS एक्ट, ASML EUV लिथोग्राफी, TSMC 3nm/2nm फाउंड्रीज।],
  [Ch 25], [भारत की AI क्रांति: IndiaAI मिशन], [IndiaAI], [₹10,372 करोड़ बजट, 10,000+ GPU संप्रभु क्लाउड कंप्यूट, AI इनोवेशन केंद्र।],
  [Ch 26], [संप्रभु इंडिक LLMs एवं डिजिटल पब्लिक इन्फ्रा], [इंडिक AI], [सर्वम AI, कृत्रिम, भाषिणी (22 भारतीय भाषाएं), UPI एवं आधार DPI इंटीग्रेशन।],
  [Ch 27], [औद्योगिक केस स्टडीज: हाई-इम्पैक्ट AI], [उद्योग], [हेल्थकेयर (अल्फाफोल्ड/ऑन्कोलॉजी), फिनटेक हाई-फ्रीक्वेंसी फ्रॉड, टेस्ला FSD एवं वेमो।],
  [Ch 28], [प्रोडक्शन लैब: vLLM से मॉडल्स की सर्विंग], [MLOps लैब], [पेज्डअटेंशन, कंटीन्यूअस बैचिंग, KV-कैश ऑप्टिमाइजेशन, OpenAI-कंपैटिबल APIs।],
  [Ch 29], [2027 AI जॉब मार्केट एवं सैलरी सीढ़ी], [करियर], [पारंपरिक कोडिंग बनाम AI इंजीनियरिंग, भारत ₹4.5L-₹38L+ व ग्लोबल $75k-$250k+ सैलरी।],
  [Ch 30], [6 हाई-पेइंग AI करियर स्पेशलाइजेशन], [करियर], [AI/ML इंजीनियर, GenAI/LLM इंजीनियर, MLOps आर्किटेक्ट, AI रिसर्चर, AI PM, कंसलटेंट।],
  [Ch 31], [0-से-6 महीने का संपूर्ण लर्निंग रोडमैप], [रोडमैप], [स्टेप-बाय-स्टेप संरचित सिलेबस: मैथ/पायथन से डीप लर्निंग, RAG और एजेंट्स तक।],
  [Ch 32], [मिलियन-डॉलर AI प्रोजेक्ट पोर्टफोलियो], [पोर्टफोलियो], [5 एंटरप्राइज गिटहब प्रोजेक्ट्स: फाइनेंशियल एजेंट, इंडिक मेडिकल बॉट, एज विजन, गेटवे।],
  [Ch 33], [ATS-ऑप्टिमाइज्ड AI रिज्यूमे इंजीनियरिंग], [करियर], [STAR मेथड, एक्शन वर्ब्स, हाई-यील्ड कीवर्ड्स (PyTorch, vLLM, Docker), रेड फ्लैग्स।],
  [Ch 34], [वैश्विक एवं भारतीय AI सर्टिफिकेशन प्लेबुक], [सर्टिफिकेशन], [AWS ML स्पेशलिटी, GCP प्रोफेशनल ML इंजीनियर, Azure AI-102, NVIDIA DLI।],
  [Ch 35], [फ्रीलांस AI कंसल्टिंग एवं एजेंसी ब्लूप्रिंट], [कमाई], [SMBs के लिए AI एजेंट्स, प्रॉम्प्ट एडवाइजरी, ₹50k-₹2.5L प्रति माह रिटेनर मॉडल।],
  [Ch 36], [नॉन-टेक एवं सॉफ्टवेयर इंजीनियर्स के लिए ट्रांजिशन], [ट्रांजिशन], [सॉफ्टवेयर डेवलपर्स के लिए ब्रिज स्ट्रैटेजी, नो-कोड/लो-कोड AI ऑप्स रोल्स।],
  [Ch 37], [टॉप 50 MNC AI इंटरव्यू वॉल्ट: कोर ML व मैथ], [इंटरव्यू], [Q01-Q13: बायस-वेरिएंस, ओवरफिटिंग, लॉस फंक्शन्स, रेगुलराइजेशन, ऑप्टिमाइजेशन।],
  [Ch 38], [टॉप 50 MNC AI इंटरव्यू वॉल्ट: ट्रांसफार्मर्स], [इंटरव्यू], [Q14-Q26: अटेंशन मैकेनिज्म, पोजीशनल एन्कोडिंग, वैनिशिंग ग्रेडिएंट, लेयरनोर्म।],
  [Ch 39], [टॉप 50 MNC AI इंटरव्यू वॉल्ट: LLMs व RAG], [इंटरव्यू], [Q27-Q38: क्वांटाइजेशन (INT8/FP4), पेज्डअटेंशन, वेक्टर DB इंडेक्सिंग, LoRA।],
  [Ch 40], [टॉप 50 MNC AI इंटरव्यू वॉल्ट: सिस्टम डिजाइन], [इंटरव्यू], [Q39-Q50: 10M DAU रिकमेंडेशन सिस्टम, एंटरप्राइज डॉक्यूमेंट RAG, वॉइस एजेंट।],
  [Ch 41], [AI सुरक्षा, नैतिकता एवं वैश्विक गवर्नेंस], [नैतिकता], [EU AI एक्ट रिस्क टियर्स, कॉपीराइट/फेयर यूज़, डीपफेक डिटेक्शन, AGI अलाइनमेंट।],
  [Ch 42], [ऑफिशियल RTechLab कंप्लीशन सर्टिफिकेट], [सर्टिफिकेशन], [आधिकारिक पूर्णता प्रमाणपत्र, छात्र सत्यापन लिंक, QR कोड एवं पूर्व छात्र सील।]]
)
"""

    with open(os.path.join(engine_dir, "blueprint-v5.typ"), "w", encoding="utf-8") as f:
        f.write(en_content)

    with open(os.path.join(engine_dir, "blueprint-v5-hi.typ"), "w", encoding="utf-8") as f:
        f.write(hi_content)

    print("Generated tight AI blueprints (English and Hindi) successfully!")

if __name__ == "__main__":
    generate_ai_blueprints()
