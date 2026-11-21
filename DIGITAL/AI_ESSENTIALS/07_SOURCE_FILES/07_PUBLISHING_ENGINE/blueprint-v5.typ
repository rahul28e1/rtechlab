// =============================================================================
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
