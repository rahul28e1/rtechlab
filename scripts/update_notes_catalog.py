import json
import re

# 42 Chapters data
chapters_data = [
    {
        "num": "01",
        "title": "The Dawn of Intelligent Machines: 1950 Turing to Dartmouth",
        "titleHi": "बुद्धिमान मशीनों की शुरुआत: 1950 ट्यूरिंग से डार्टमाउथ तक",
        "pages": "Page 03",
        "topics": [
            "1950 Alan Turing Computing Machinery & Imitation Game",
            "Dartmouth 1956 Summer Workshop on Artificial Intelligence",
            "Symbolic AI, Physical Symbol Systems & Logic Theorist",
            "End of Chapter: 3 Review Questions, 2 MCQs & Historical Spotlight"
        ]
    },
    {
        "num": "02",
        "title": "Golden Age, Perceptrons & The First AI Winter (1956-1980)",
        "titleHi": "स्वर्ण युग, परसेप्ट्रॉन एवं पहला AI विंटर (1956-1980)",
        "pages": "Page 04",
        "topics": [
            "Frank Rosenblatt 1957 Mark I Perceptron Architecture",
            "Minsky & Papert 1969 Geometric XOR Linearity Limitation",
            "1973 Lighthill Report & DARPA 1974-1980 Funding Collapse",
            "End of Chapter: 3 Review Questions, 2 MCQs & First Winter Postmortem"
        ]
    },
    {
        "num": "03",
        "title": "Expert Systems, Knowledge Engineering & Second AI Winter",
        "titleHi": "एक्सपर्ट सिस्टम्स, नॉलेज इंजीनियरिंग एवं दूसरा AI विंटर",
        "pages": "Page 05",
        "topics": [
            "1980s Production Rule Systems: MYCIN & XCON / R1",
            "Domain Heuristic Knowledge Bases & Inference Engines",
            "Specialized LISP Machines & The 1987 Hardware Market Collapse",
            "End of Chapter: 3 Review Questions, 2 MCQs & Knowledge Bottleneck Analysis"
        ]
    },
    {
        "num": "04",
        "title": "The Statistical AI Renaissance & The Big Data Boom",
        "titleHi": "सांख्यिकीय AI का पुनर्जागरण एवं बिग डेटा क्रांति",
        "pages": "Page 06",
        "topics": [
            "From Deductive Logic to Inductive Probabilistic Machine Learning",
            "IBM Deep Blue 1997 Parallel Alpha-Beta Minimax Search",
            "ImageNet 2012 Challenge & AlexNet Parallel GPU Acceleration",
            "End of Chapter: 3 Review Questions, 2 MCQs & Empirical Paradigm Shift"
        ]
    },
    {
        "num": "05",
        "title": "AI Evolution Timeline, Moore's Law & Compute Scaling",
        "titleHi": "AI विकास टाइमलाइन, मूर का नियम एवं कंप्यूट स्केलिंग",
        "pages": "Page 07",
        "topics": [
            "77-Year Comprehensive AI Milestone Timeline (1950 to 2027)",
            "Huang's Law: GPU Parallel Tensor Compute Outpacing Moore's Law",
            "GFLOP Training Compute Cost Collapse from \\$1M to Sub-Cent Levels",
            "End of Chapter: 3 Review Questions, 2 MCQs & Compute Frontier Breakdown"
        ]
    },
    {
        "num": "06",
        "title": "AI Taxonomy: ANI vs AGI vs ASI & The Agency Horizons",
        "titleHi": "AI वर्गीकरण: ANI बनाम AGI बनाम ASI एवं स्वायत्तता क्षितिज",
        "pages": "Page 08",
        "topics": [
            "Artificial Narrow Intelligence (ANI): Task-Specific Optimization",
            "Artificial General Intelligence (AGI): Cross-Domain Reasoning & ARC-AGI",
            "Artificial Superintelligence (ASI): Recursive Self-Improvement & Ethics",
            "End of Chapter: 3 Review Questions, 2 MCQs & Frontier Safety Bounds"
        ]
    },
    {
        "num": "07",
        "title": "Machine Learning Hierarchy & Fundamental Paradigms",
        "titleHi": "मशीन लर्निंग पदानुक्रम एवं मूलभूत प्रतिमान",
        "pages": "Page 09",
        "topics": [
            "Concentric Hierarchy: AI vs Machine Learning vs Deep Learning vs GenAI",
            "Supervised, Unsupervised, Semi-Supervised & Reinforcement Learning",
            "Self-Supervised Learning: The Foundation of Modern Masked Models",
            "End of Chapter: 3 Review Questions, 2 MCQs & Mathematical Paradigm Map"
        ]
    },
    {
        "num": "08",
        "title": "Supervised Learning: Regressors, Classifiers & Loss Functions",
        "titleHi": "सुपरवाइज्ड लर्निंग: रिग्रेशन, क्लासिफायर एवं लॉस फंक्शन्स",
        "pages": "Page 10",
        "topics": [
            "Linear & Logistic Regression: Maximum Likelihood & Logit Odds",
            "Decision Trees, Random Forest Bagging & XGBoost Gradient Boosting",
            "Mathematical Loss Functions: MSE, MAE, Binary & Categorical Cross-Entropy",
            "End of Chapter: 3 Review Questions, 2 MCQs & Optimization Trade-offs"
        ]
    },
    {
        "num": "09",
        "title": "Unsupervised Learning, Clustering & Dimensionality Reduction",
        "titleHi": "अनसुपरवाइज्ड लर्निंग, क्लस्टरिंग एवं डायमेंशनलिटी रिडक्शन",
        "pages": "Page 11",
        "topics": [
            "K-Means Clustering: Centroid Voronoi Tesselation & Convergence",
            "Principal Component Analysis (PCA): Eigenvalue Covariance Projection",
            "Non-Linear Manifold Projections: t-SNE & UMAP for Embedding Latents",
            "End of Chapter: 3 Review Questions, 2 MCQs & Anomaly Detection Pipeline"
        ]
    },
    {
        "num": "10",
        "title": "Biological Neurons to Artificial Neurons & Activations",
        "titleHi": "जैविक न्यूरॉन से कृत्रिम न्यूरॉन एवं एक्टिवेशन फंक्शन्स",
        "pages": "Page 12",
        "topics": [
            "Biological Dendrite-Axon Synapse vs Artificial Dot-Product Weights",
            "Mathematical Activations: Sigmoid, Hyperbolic Tanh, ReLU & Leaky ReLU",
            "Modern Transformer Activations: GeLU, Swish & Gated SwiGLU",
            "End of Chapter: 3 Review Questions, 2 MCQs & Vanishing Gradient Mitigations"
        ]
    },
    {
        "num": "11",
        "title": "Deep Neural Networks, Backpropagation & Optimizers",
        "titleHi": "डीप न्यूरल नेटवर्क, बैकप्रोपैगेशन एवं आधुनिक ऑप्टिमाइज़र्स",
        "pages": "Page 13",
        "topics": [
            "Multi-Layer Perceptron (MLP) Forward Pass Matrix Formulation",
            "Backpropagation Calculus: Recursive Chain Rule Error Propagation",
            "Optimizers: SGD, Momentum, RMSprop, Adam & Decoupled Weight Decay AdamW",
            "End of Chapter: 3 Review Questions, 2 MCQs & Optimizer Convergence Audit"
        ]
    },
    {
        "num": "12",
        "title": "Convolutional Neural Networks (CNNs) & Computer Vision",
        "titleHi": "कन्वोल्यूशनल न्यूरल नेटवर्क (CNNs) एवं कंप्यूटर विजन",
        "pages": "Page 14",
        "topics": [
            "Spatial Convolutions: 2D Filters, Strides, Zero-Padding & Receptive Fields",
            "Pooling Layers: Spatial Downsampling & Translation Invariance",
            "Modern Architectures: Residual Skip Connections (ResNet) & Real-Time YOLO",
            "End of Chapter: 3 Review Questions, 2 MCQs & Computer Vision Lab Checklist"
        ]
    },
    {
        "num": "13",
        "title": "Sequence Modeling: From Vanilla RNNs to LSTMs & GRUs",
        "titleHi": "अनुक्रम मॉडलिंग: सामान्य RNN से LSTM एवं GRU तक",
        "pages": "Page 15",
        "topics": [
            "Sequential Recurrence: Hidden State Transitions & Temporal Backprop",
            "The Exploding & Vanishing Gradient Trap in Long Sequences",
            "Long Short-Term Memory (LSTM): Forget, Input & Output Gates with Cell State",
            "End of Chapter: 3 Review Questions, 2 MCQs & Gated Recurrent Unit Derivations"
        ]
    },
    {
        "num": "14",
        "title": "Hands-on Lab: Neural Network from Scratch in Pure NumPy",
        "titleHi": "प्रैक्टिकल लैब: शुद्ध NumPy में स्क्रैच से न्यूरल नेटवर्क",
        "pages": "Page 16",
        "topics": [
            "Zero Framework Dependencies: Pure NumPy Vectorized Mathematics",
            "Forward Propagation, Binary Cross-Entropy Loss & Analytical Gradients",
            "Parameter Updates via Gradient Descent & Convergence Verification",
            "End of Chapter: 3 Review Questions, 2 MCQs & Full Python Source Listing"
        ]
    },
    {
        "num": "15",
        "title": "The 2017 Transformer Revolution: Attention Is All You Need",
        "titleHi": "2017 ट्रांसफार्मर क्रांति: 'अटेंशन इज़ ऑल यू नीड'",
        "pages": "Page 17",
        "topics": [
            "Vaswani et al. 2017: Overcoming Sequential Recurrence Bottlenecks",
            "Scaled Dot-Product Attention: Query, Key, and Value Tensor Projections",
            "Multi-Head Attention (MHA) & Sinusoidal / Rotary Position Embeddings",
            "End of Chapter: 3 Review Questions, 2 MCQs & Transformer Mechanism Audit"
        ]
    },
    {
        "num": "16",
        "title": "Anatomy of Large Language Models: Tokens to Sampling",
        "titleHi": "लार्ज लैंग्वेज मॉडल्स की आंतरिक संरचना: टोकन से सैंपलिंग तक",
        "pages": "Page 18",
        "topics": [
            "Byte-Pair Encoding (BPE), SentencePiece & WordPiece Tokenizers",
            "Autoregressive Causal Masking & KV Cache Memory Footprint",
            "Inference Decoding Dynamics: Temperature, Top-p (Nucleus) & Repetition Penalty",
            "End of Chapter: 3 Review Questions, 2 MCQs & Context Window Scaling Limits"
        ]
    },
    {
        "num": "17",
        "title": "The LLM Training Lifecycle: Pre-Training to Post-Training",
        "titleHi": "LLM ट्रेनिंग चक्र: प्री-ट्रेनिंग से पोस्ट-ट्रेनिंग और अलाइनमेंट तक",
        "pages": "Page 19",
        "topics": [
            "Pre-Training on Trillions of Tokens: Next-Token Self-Supervised Objectives",
            "Supervised Fine-Tuning (SFT) & Instruction Tuning Protocols",
            "Human Alignment: RLHF with PPO vs Direct Preference Optimization (DPO)",
            "End of Chapter: 3 Review Questions, 2 MCQs & LoRA / QLoRA PEFT Mechanics"
        ]
    },
    {
        "num": "18",
        "title": "Diffusion Models & Modern Multimodal Foundation Vision",
        "titleHi": "डिफ्यूजन मॉडल्स एवं आधुनिक मल्टीमॉडल विजन AI",
        "pages": "Page 20",
        "topics": [
            "Denoising Diffusion Probabilistic Models (DDPM) & Forward Gaussian Noise",
            "Reverse Denoising Process using U-Net & Diffusion Transformers (DiT)",
            "Multimodal Joint Embedding Space: OpenAI CLIP Contrastive Learning",
            "End of Chapter: 3 Review Questions, 2 MCQs & Vision-Language Model Architectures"
        ]
    },
    {
        "num": "19",
        "title": "Enterprise Retrieval-Augmented Generation (RAG) Architecture",
        "titleHi": "एंटरप्राइज रिट्रीवल-ऑगमेंटेड जेनरेशन (RAG) आर्किटेक्चर",
        "pages": "Page 21",
        "topics": [
            "Naive vs Advanced RAG: Semantic Chunking & Parent Document Retrieval",
            "Vector Databases: Qdrant, Milvus, pgvector & HNSW Graph Indexing",
            "Hybrid Search: Combining BM25 Lexical with Dense Vector Cosine Distance",
            "End of Chapter: 3 Review Questions, 2 MCQs & Cross-Encoder Re-Ranking Pipeline"
        ]
    },
    {
        "num": "20",
        "title": "Enterprise Prompt Engineering, Reasoning & Guardrails",
        "titleHi": "एंटरप्राइज प्रॉम्प्ट इंजीनियरिंग, रीजनिंग एवं गार्डरेल्स",
        "pages": "Page 22",
        "topics": [
            "Zero-Shot, Few-Shot In-Context Learning & Structured Output Schemas",
            "Chain-of-Thought (CoT), Self-Consistency & Tree-of-Thoughts (ToT)",
            "Defensive Guardrails: NVIDIA NeMo, Llama Guard & Prompt Injection Defense",
            "End of Chapter: 3 Review Questions, 2 MCQs & Enterprise Production Guidelines"
        ]
    },
    {
        "num": "21",
        "title": "Autonomous Agentic AI, Tool Calling & State Machines",
        "titleHi": "स्वायत्त एजेंटिक AI, टूल कॉलिंग एवं स्टेट मशीन्स",
        "pages": "Page 23",
        "topics": [
            "The ReAct Pattern: Interleaved Reasoning, Action, Tool Call & Observation",
            "JSON Schema Function Calling at the Token Generation Boundary",
            "Deterministic Multi-Agent Coordination via LangGraph Cyclic State Graphs",
            "End of Chapter: 3 Review Questions, 2 MCQs & Human-in-the-Loop Safeguards"
        ]
    },
    {
        "num": "22",
        "title": "Production Lab: End-to-End Enterprise RAG with LangChain",
        "titleHi": "प्रोडक्शन लैब: LangChain के साथ सम्पूर्ण एंटरप्राइज RAG",
        "pages": "Page 24",
        "topics": [
            "Document Loading, Recursive Splitting & High-Dimensional Embeddings",
            "In-Memory Vector Store Upsert & Hybrid Similarity Retrieval",
            "Multi-Turn Grounded Context Prompting with Citation Verification",
            "End of Chapter: 3 Review Questions, 2 MCQs & Full Runnable Script"
        ]
    },
    {
        "num": "23",
        "title": "Enterprise AI Compute Infrastructure & GPU Clusters",
        "titleHi": "एंटरप्राइज AI कंप्यूट इन्फ्रास्ट्रक्चर एवं GPU क्लस्टर्स",
        "pages": "Page 25",
        "topics": [
            "NVIDIA Hopper H100 vs Blackwell B200 Architecture & Tensor Cores",
            "High Bandwidth Memory (HBM3e) & NVLink 900 GB/s Interconnect Fabrics",
            "Infiniband RoCE Networking & Datacenter Thermal Power Densities",
            "End of Chapter: 3 Review Questions, 2 MCQs & Hardware Benchmark Comparison"
        ]
    },
    {
        "num": "24",
        "title": "Global AI Geopolitics, Silicon Supply Chains & Sovereignty",
        "titleHi": "वैश्विक AI भू-राजनीति, सिलिकॉन सप्लाई चेन एवं संप्रभुता",
        "pages": "Page 26",
        "topics": [
            "US CHIPS Act & Advanced Semiconductor Export Control Regimes",
            "ASML Extreme Ultraviolet (EUV) Monopolies & TSMC Advanced Packaging",
            "Sovereign Datacenters & Critical Infrastructure Self-Reliance",
            "End of Chapter: 3 Review Questions, 2 MCQs & Global Supply Chain Vulnerabilities"
        ]
    },
    {
        "num": "25",
        "title": "India's Sovereign AI Revolution: The IndiaAI Mission",
        "titleHi": "भारत की संप्रभु AI क्रांति: ₹10,372 करोड़ का IndiaAI मिशन",
        "pages": "Page 27",
        "topics": [
            "Government of India's ₹10,372.54 Crore Sovereign AI Cabinet Allocation",
            "10,000+ GPU National Compute Grid & Subsidized Startup Compute Access",
            "IndiaAI Datasets Platform & Sovereign Foundation Model Innovation Centers",
            "End of Chapter: 3 Review Questions, 2 MCQs & Strategic National Impact"
        ]
    },
    {
        "num": "26",
        "title": "Sovereign Indic LLMs & India's Digital Public Goods",
        "titleHi": "स्वदेशी इंडिक LLMs एवं भारत का डिजिटल पब्लिक इन्फ्रास्ट्रक्चर",
        "pages": "Page 28",
        "topics": [
            "Sarvam AI: Open Indic Foundation Models (Sarvam 2B, Bulbul TTS, Saaras)",
            "Krutrim AI: Multilingual 22 Scheduled Indian Language Foundation Stack",
            "Project Bhashini: Real-Time Multilingual NLP & Speech Translation API",
            "End of Chapter: 3 Review Questions, 2 MCQs & UPI/Aadhaar DPI Integration"
        ]
    },
    {
        "num": "27",
        "title": "Industrial Case Studies: High-Impact Enterprise Deployments",
        "titleHi": "औद्योगिक केस स्टडीज: हेल्थकेयर, फिनटेक एवं ऑटोनॉमस व्हीकल्स",
        "pages": "Page 29",
        "topics": [
            "DeepMind AlphaFold 3: Protein Structure Prediction & Drug Discovery",
            "FinTech Fraud Detection: Sub-10ms Graph Neural Networks on Transaction Streams",
            "Autonomous Driving: Tesla FSD End-to-End Neural Networks vs Waymo LiDAR",
            "End of Chapter: 3 Review Questions, 2 MCQs & Enterprise ROI Metric Analysis"
        ]
    },
    {
        "num": "28",
        "title": "Production Lab: Serving Foundation Models with vLLM",
        "titleHi": "प्रोडक्शन लैब: vLLM एवं PagedAttention के साथ मॉडल सर्विंग",
        "pages": "Page 30",
        "topics": [
            "vLLM High-Throughput Serving Engine & OpenAI-Compatible REST Endpoints",
            "PagedAttention: Managing Non-Contiguous KV Cache Virtual Memory",
            "Continuous Iteration-Level Batching & Benchmarking Tokens Per Second",
            "End of Chapter: 3 Review Questions, 2 MCQs & Production Serving Metrics"
        ]
    },
    {
        "num": "29",
        "title": "The 2027 AI Job Market Landscape & ₹38 LPA Salary Ladder",
        "titleHi": "2027 AI जॉब मार्केट परिदृश्य एवं ₹38 LPA सैलरी लैडर",
        "pages": "Page 31",
        "topics": [
            "Software 2.0 Shift: Why Algorithmic Engineers Must Master Applied AI",
            "Compensation Matrix: Entry Associate (₹4.5L–₹9L) to Principal (₹38L–₹65L+)",
            "India Tier-1 Tech Hubs (Bengaluru, Hyderabad, Pune, NCR) vs US Remote",
            "End of Chapter: 3 Review Questions, 2 MCQs & Compensation Negotiation Strategy"
        ]
    },
    {
        "num": "30",
        "title": "Six High-Paying AI Specializations & Technical Stack Matrix",
        "titleHi": "छह हाई-पेइंग AI विशेषज्ञताएं एवं टेक्निकल स्टैक मैट्रिक्स",
        "pages": "Page 32",
        "topics": [
            "Track 1: Generative AI / LLM Engineer (RAG, Vector Databases & Prompting)",
            "Track 2: Autonomous Agentic Architect & Track 3: Production LLMOps / Infra",
            "Track 4: Computer Vision / VLMs, Track 5: AI Researcher & Track 6: AI Product Manager",
            "End of Chapter: 3 Review Questions, 2 MCQs & Specialization Selection Guide"
        ]
    },
    {
        "num": "31",
        "title": "0-to-6 Month Structured AI Learning Roadmap & Habit Tracker",
        "titleHi": "0 से 6 महीने का सम्पूर्ण AI लर्निंग रोडमैप एवं डेली हैबिट ट्रैकर",
        "pages": "Page 33",
        "topics": [
            "Month 1-2: Python 3.12, Vector Math, PyTorch & Classical Machine Learning",
            "Month 3-4: Transformer Deep Dive, Production RAG & Local vLLM Serving",
            "Month 5-6: Multi-Agent Swarms, Production Dockerization & System Design",
            "End of Chapter: 3 Review Questions, 2 MCQs & Daily 2-Hour Habit System"
        ]
    },
    {
        "num": "32",
        "title": "The Million-Dollar AI Project Portfolio: 5 Flagship Repos",
        "titleHi": "मिलियन-डॉलर AI प्रोजेक्ट पोर्टफोलियो: 5 फ्लैगशिप गिटहब प्रोजेक्ट्स",
        "pages": "Page 34",
        "topics": [
            "Project 1: Multi-Tenant Enterprise Knowledge Assistant with Hybrid Search",
            "Project 2: Autonomous Multi-Agent Financial Research Swarm with LangGraph",
            "Projects 3-5: Edge Vision Defect Detector, Indic Medical Bot & LLM Gateway",
            "End of Chapter: 3 Review Questions, 2 MCQs & Portfolio Presentation Protocols"
        ]
    },
    {
        "num": "33",
        "title": "ATS-Optimized AI Resume Engineering: 25 STAR Bullets",
        "titleHi": "ATS-अनुकूलित AI रेज्युमे इंजीनियरिंग: 25 STAR इम्पैक्ट बुलेट्स",
        "pages": "Page 35",
        "topics": [
            "Applicant Tracking System (ATS) Algorithms & Semantic Keyword Matching",
            "25 Battle-Tested Resume Bullets with Quantifiable Metrics (Latency, Cost)",
            "Formatting Rules, Critical Red Flags & GitHub / Hugging Face Hyperlinks",
            "End of Chapter: 3 Review Questions, 2 MCQs & Recruiter Screen Passing Checklist"
        ]
    },
    {
        "num": "34",
        "title": "Global & Indian AI Certification Playbook & ROI Audit",
        "titleHi": "ग्लोबल एवं इंडियन AI सर्टिफिकेशन प्लेबुक एवं ROI विश्लेषण",
        "pages": "Page 36",
        "topics": [
            "AWS Certified Machine Learning Specialty & Azure AI Engineer Associate (AI-102)",
            "Google Cloud Professional ML Engineer & NVIDIA Deep Learning Institute (DLI)",
            "Cost vs Salary ROI Analysis: Which Certifications Fast-Track Hiring",
            "End of Chapter: 3 Review Questions, 2 MCQs & 6-Week Certification Study Blueprint"
        ]
    },
    {
        "num": "35",
        "title": "Freelance AI Consulting, Agency Blueprint & Client Outreach",
        "titleHi": "फ्रीलांस AI कंसल्टिंग, एजेंसी ब्लूप्रिंट एवं क्लाइंट अधिग्रहण",
        "pages": "Page 37",
        "topics": [
            "The 2027 Freelance AI Services Menu: Enterprise RAG & Workflow Automations",
            "Consulting Rate Card: Hourly (₹3.5k–₹7.5k), Retainers & Fixed Project Pricing",
            "Cold Outreach Playbook: Contacting Founders via LinkedIn & Loom Audits",
            "End of Chapter: 3 Review Questions, 2 MCQs & Client Service Agreement Essentials"
        ]
    },
    {
        "num": "36",
        "title": "Career Transition Playbook: Software Dev to AI Specialist",
        "titleHi": "करियर ट्रांजिशन प्लेबुक: सॉफ्टवेयर इंजीनियर से AI विशेषज्ञ तक",
        "pages": "Page 38",
        "topics": [
            "Leveraging Existing Strengths: APIs, Databases, Docker & CI/CD Pipelines",
            "Closing the Probabilistic Gap: Navigating Stochasticity vs Deterministic Code",
            "Overcoming Imposter Syndrome & 90-Day Enterprise Transition Sprint",
            "End of Chapter: 3 Review Questions, 2 MCQs & Senior Engineer Upskilling Plan"
        ]
    },
    {
        "num": "37",
        "title": "Top 50 MNC AI Interview Vault: Core ML & Math Intuition",
        "titleHi": "टॉप 50 MNC AI इंटरव्यू वॉल्ट: कोर ML एवं गणितीय अंतर्ज्ञान",
        "pages": "Page 39",
        "topics": [
            "Questions 1-6: Backpropagation Chain Rule & Parameter Gradient Derivations",
            "Bias-Variance Tradeoff, AdamW Decoupled Weight Decay & Cross-Entropy",
            "Why ReLU/GeLU Replaced Sigmoid & Residual Gradient Highway Proofs",
            "End of Chapter: 3 Review Questions, 2 MCQs & STAR-T Interview Framing"
        ]
    },
    {
        "num": "38",
        "title": "Top 50 MNC AI Interview Vault: Deep Learning & Transformers",
        "titleHi": "टॉप 50 MNC AI इंटरव्यू वॉल्ट: डीप लर्निंग एवं ट्रांसफार्मर संरचना",
        "pages": "Page 40",
        "topics": [
            "Questions 7-12: CNN Translation Invariance, RNN Temporal Bottlenecks",
            "Scaled Dot-Product Derivations: Why Scaling by sqrt(d_k) Prevents Saturation",
            "Multi-Head vs Multi-Query vs Grouped-Query Attention (GQA) & RoPE",
            "End of Chapter: 3 Review Questions, 2 MCQs & Modern Attention Breakdown"
        ]
    },
    {
        "num": "39",
        "title": "Top 50 MNC AI Interview Vault: Modern LLMs & Production RAG",
        "titleHi": "टॉप 50 MNC AI इंटरव्यू वॉल्ट: मॉडर्न LLMs एवं प्रोडक्शन RAG",
        "pages": "Page 41",
        "topics": [
            "Questions 13-18: KV Cache Scaling, FlashAttention SRAM Tiling & MoE Routing",
            "Quantization: AWQ vs GPTQ vs FP8 & Hoffmann Chinchilla Scaling Laws",
            "Questions 19-24: Semantic Chunking, Hybrid Search BM25+Dense & GraphRAG",
            "End of Chapter: 3 Review Questions, 2 MCQs & RAG Triad Evaluation Framework"
        ]
    },
    {
        "num": "40",
        "title": "Top 50 MNC AI Interview Vault: Agents & 10M-Query System Design",
        "titleHi": "टॉप 50 MNC AI इंटरव्यू वॉल्ट: एजेंटिक AI एवं 10M सिस्टम डिजाइन",
        "pages": "Page 42",
        "topics": [
            "Questions 25-36: LoRA / QLoRA PEFT Math, DPO vs RLHF & ReAct Loops",
            "Questions 37-43: vLLM PagedAttention, Continuous Batching & Model Context Protocol",
            "Questions 44-50: Designing a 10M Requests/Day Multi-Tenant Enterprise Copilot",
            "End of Chapter: 3 Review Questions, 2 MCQs & High-Concurrency System Blueprint"
        ]
    },
    {
        "num": "41",
        "title": "AI Safety, Ethics, Copyright & Global AI Governance",
        "titleHi": "AI सुरक्षा, नैतिकता, कॉपीराइट एवं वैश्विक AI शासन नियम",
        "pages": "Page 43",
        "topics": [
            "EU AI Act Four-Tier Risk Classification: Unacceptable to Minimal Risk",
            "Training Data Copyright, Fair Use Doctrines & Synthetic Provenance Watermarking",
            "Deepfake Detection Cryptography & Alignment Safety Red-Teaming",
            "End of Chapter: 3 Review Questions, 2 MCQs & Responsible AI Engineering Charter"
        ]
    },
    {
        "num": "42",
        "title": "Official RTechLab Certificate of Mastery & Verification",
        "titleHi": "ऑफिशियल RTechLab सर्टिफिकेट ऑफ मास्टरी एवं सत्यापन",
        "pages": "Page 44",
        "topics": [
            "Formal RTechLab 2027 Artificial Intelligence Commercial Certification",
            "Verified Serial Code: RTL-2027-AI-COMMERCIAL-ED1 with QR Verification",
            "Chief Technology Architect Endorsement & Lifetime Alumni Network Access",
            "Final Commercial Sign-off: Technology Made Practical · Learn. Practice. Innovate."
        ]
    }
]

ai_subject = {
    "id": "ai",
    "code": "RTL-2027-AI",
    "badge": "HOT 2027 · AI CAREER ACCELERATOR",
    "badgeColor": "text-[#8B5CF6] bg-[#8B5CF6]/10 border-[#8B5CF6]/30",
    "title": "Artificial Intelligence Essentials & Career Master Guide",
    "titleHi": "आर्टिफिशियल इंटेलिजेंस (AI) एसेंशियल एवं करियर मास्टर गाइड",
    "tagline": "1950 Foundations to 2027 Agentic AI, Indic LLMs (Sarvam, Krutrim), ₹38 LPA Salary Ladder & Top 50 MNC Interview Vault",
    "taglineHi": "1950 इतिहास से 2027 एजेंटिक AI, इंडिक LLMs (सर्वम, कृत्रिम), ₹38 LPA सैलरी लैडर एवं टॉप 50 MNC इंटरव्यू वॉल्ट",
    "price": 49,
    "bundlePrice": 149,
    "pages": "112 Pages (Complete 4-in-1 Master Suite)",
    "pagesNum": 112,
    "edition": "Edition 1 (2027 Master Edition)",
    "author": "Rahul Patel (Founder & Chief Architect, RTechLab)",
    "accentColor": "#8B5CF6",
    "previewPdfEn": "/downloads/AI-Essentials-English-Edition-1-5Page-Preview.pdf",
    "fullPdfEn": "/downloads/AI-Essentials-English-Edition-1.pdf",
    "previewPdfHi": "/downloads/AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf",
    "fullPdfHi": "/downloads/AI-Essentials-Hindi-Edition-1.pdf",
    "bundleZip": "/downloads/AI-Career-Accelerator-Bundle.zip",
    "photoHighlights": [
        "AI Hierarchy: Artificial Intelligence, ML, Deep Learning & GenAI",
        "Scaled Dot-Product Self-Attention & Multi-Head Transformer Engine",
        "Production RAG Pipeline: Vector Indexing, Hybrid BM25 & Cohere Rerank",
        "Autonomous Agentic AI: ReAct Loop, Tool Execution & LangGraph",
        "High-Performance NVIDIA H100 / B200 GPU Cluster Architecture",
        "IndiaAI Mission ₹10,372 Cr Compute & Sovereign Indic LLM Ecosystem",
        "2027 AI Career Ladder: ₹4.5 LPA to ₹38+ LPA Compensation Matrix",
        "Top 50 FAANG / MNC AI Interview Questions with Math Derivations",
        "100 Enterprise System Prompts & Adversarial Jailbreak Defenses",
        "0-to-6 Month Complete Learning Roadmap & Daily 2-Hour Habit Tracker",
        "Million-Dollar Multi-Tenant RAG Docker Compose Production Stack",
        "25 High-Impact ATS Resume Bullets with Quantified Impact Metrics"
    ],
    "chapters": chapters_data,
    "bestBuyCombo": {
        "id": "combo-ai-office",
        "title": "AI Engineer & Enterprise MIS Modern Suite Combo",
        "titleHi": "AI इंजीनियर एवं एंटरप्राइज MIS मॉडर्न सुइट कॉम्बो",
        "desc": "Artificial Intelligence Master Suite (112 Pages) + Microsoft Office 365 Enterprise (113 Pages). Complete corporate data & automation supremacy.",
        "price": 79,
        "originalPrice": 98,
        "savings": "Save ₹19 (20% OFF)",
        "pairedSubject": "office365"
    }
}

# Update src/data/notesCatalog.js
with open("src/data/notesCatalog.js", "r", encoding="utf-8") as f:
    catalog_content = f.read()

# Let's inspect where NOTES_SUBJECTS starts
prefix_match = re.search(r"export const NOTES_SUBJECTS = \[\n", catalog_content)
if not prefix_match:
    print("Could not find NOTES_SUBJECTS array in notesCatalog.js!")
    exit(1)

# Format ai_subject as javascript object
ai_js = json.dumps(ai_subject, indent=4, ensure_ascii=False)
# Adjust JS formatting
ai_js_formatted = "  " + ai_js.replace("\n", "\n  ") + ",\n"

# Check if 'ai' is already present
if "'id': 'ai'" in catalog_content or '"id": "ai"' in catalog_content or "id: 'ai'" in catalog_content:
    print("Subject 'ai' already present in notesCatalog.js, replacing...")
    # remove existing
    catalog_content = re.sub(r"  \{\s*id:\s*'ai'[\s\S]*?\n  \},\n", "", catalog_content)

# Insert at the beginning of NOTES_SUBJECTS
insert_pos = prefix_match.end()
new_catalog = catalog_content[:insert_pos] + ai_js_formatted + catalog_content[insert_pos:]

with open("src/data/notesCatalog.js", "w", encoding="utf-8") as f:
    f.write(new_catalog)

print("SUCCESS: Updated src/data/notesCatalog.js with AI Master Suite (42 Chapters)!")
