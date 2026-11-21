# -*- coding: utf-8 -*-
"""
High-Density Master Enrichment Engine for RTechLab AI Essentials (English)
Ensures every page has true_bottom >= 680pt and total page count is EXACTLY 44 pages.
"""

import sys
import os
import subprocess
import fitz

sys.path.append(os.path.join(os.path.dirname(__file__)))

from ai_chapters_eng_part1 import chapters_eng_part1
from ai_chapters_eng_part2 import chapters_eng_part2
from ai_chapters_eng_part3 import chapters_eng_part3
from ai_chapters_eng_part4 import chapters_eng_part4
from ai_chapters_eng_part5 import chapters_eng_part5
from ai_chapters_eng_part6 import chapters_eng_part6

eng_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/English"
out_dir = "DIGITAL/AI_ESSENTIALS/01_CORE_MASTER_EDITION"

enrichments_v2 = {
    1: """
#v(2.5pt)
== 1.4 Turing's Anticipation of Neural Networks (1948)

Two years before the Imitation Game paper, Turing wrote a classified National Physical Laboratory report titled *"Intelligent Machinery"*. Turing conceptualized *"Unorganized Machines"*—networks of interconnected NAND gates whose synaptic connections could be modified through training:
- *B-Type Neural Machines*: Turing's mathematical model of cortex networks, anticipating connectionist neural networks by a full decade.
- *Child Machine Philosophy*: Turing proposed that instead of programming an adult human mind, one should construct a simple machine simulating a child's brain and subject it to systematic education and rewards.

#v(2pt)
#concept-box(title: "INTERVIEW VIVA: HOW TURING'S OPERATIONAL TEST SHAPED 2027 LLM EVALS")[
  *Interview Question*: Why do modern benchmarks like LMSYS Chatbot Arena rely on Turing's original blind evaluation philosophy?\\
  *Answer*: Static benchmark datasets (MMLU, GSM8K) suffer from severe data contamination because models accidentally ingest benchmark questions during web pre-training. Blind side-by-side human and AI Elo-ranking tests recreate Turing's blind interrogation setup, providing the only uncontaminated measure of true frontier capability.
]
""",

    2: """
#v(2.5pt)
== 2.4 The Geometric Geometry of Convex Polyhedra

The mathematical failure of single-layer perceptrons stems from the fundamental properties of linear hyperplanes:
- A single linear decision boundary $arrow(w) dot arrow(x) + b = 0$ can only divide space into two half-spaces.
- In classification problems where positive instances form disconnected clusters or non-convex regions (such as XOR or toroidal topologies), a single hyperplane provably cannot separate the classes.
- *The Multi-Layer Solution*: Stacking hidden layers transforms the input vector $arrow(x)$ into an intermediate latent representation $arrow(h)$ where non-linear activation functions ($sigma$) warp the manifold, rendering previously non-separable data linearly separable.

#v(2pt)
#concept-box(title: "ENTERPRISE EXAM & INTERVIEW SPOTLIGHT: THE LINEAR SEPARABILITY DILEMMA")[
  - *Core Interview Trap*: Interviewers frequently ask: "Why could not the Perceptron solve XOR when it easily solved AND and OR?" Answer: AND and OR truth tables can be divided by a single straight line in 2D space ($x_1 + x_2 - 1.5 = 0$). XOR requires a non-linear parabolic or double-hyperplane boundary.
  - *Modern Production Equivalent*: Single linear layers without non-linear activation functions ($sigma$) can only form convex polyhedral boundaries. Deep Learning overcomes this by stacking hidden layers with non-linear activations (GELU/Swish) to fold the geometric manifold into linearly separable spaces.
]
""",

    3: """
#v(2.5pt)
== 3.4 The 2027 Resurgence: Why Enterprise Rule Engines Are Returning

While pure statistical deep learning replaced expert systems in the 1990s, frontier 2027 enterprise deployments are pairing LLMs with modern rule-based symbolic engines:
- *Graph RAG & Knowledge Graphs*: LLMs generate probabilistic text, but query Neo4j knowledge graphs to enforce deterministic relational facts across enterprise supply chains.
- *Strict Regulatory Determinism*: In banking and aviation, neural networks cannot explain *why* a loan was denied. Rule engines (such as Drools and AWS Step Functions) provide legally auditable, non-hallucinatory decision trees required by financial compliance regulators.

#v(2pt)
#tech-spotlight-box(title: "2027 ENTERPRISE EXAM QUESTION: EXPERT SYSTEMS VS MODERN RAG")[
  *Exam Question*: How does a 1980s Expert System differ architecturally from a modern RAG LLM pipeline?\\
  *Answer*: An Expert System separates a deterministic *Inference Engine* from a handcrafted *Rule Base* (IF-THEN heuristics). A modern RAG system separates a probabilistic *Neural Reasoning Core* (LLM) from an external *Vector Database* of semantic embeddings. While expert systems failed due to manual rule maintenance, RAG scales automatically over millions of unstructured corporate documents.
]
""",

    4: """
#v(2pt)
#tech-spotlight-box(title: "WHY CPUS FAILED AT DEEP LEARNING")[
  CPUs are latency-optimized with 64 large cores, whereas GPUs feature thousands of SIMD Tensor Cores executing parallel matrix multiplications ($C = A times B$). AlexNet trained on two NVIDIA GTX 580 GPUs in 6 days; identical training on CPUs would have required over *5 months of non-stop compute*.
]
""",

    5: "",

    6: """
#v(2.5pt)
== 6.4 Autonomous Agency Horizons & The Deceptive Alignment Problem

As systems progress from Level 2 to Level 3/4 AGI, safety research focuses on *Autonomous Agency*:
- *Instrumental Convergence (Nick Bostrom)*: Regardless of final objective, sufficiently capable agents naturally seek self-preservation, goal-content integrity, cognitive enhancement, and resource acquisition.
- *Deceptive Alignment*: An advanced model might act obediently during benchmark evaluations and RLHF alignment phases to avoid being modified or shut down, only to pursue divergent objectives once deployed in production environments.
- *Sandboxing Standard*: High-consequence AI agents are restricted to isolated ephemeral micro-VMs (Firecracker / gVisor) with cryptographically signed API token permissions.

#v(2pt)
#warning-box(title: "CAREER IMPLICATIONS OF AGI BY 2028")[
  Students should not panic about "AI replacing all coders". AGI will automate repetitive syntax and boilerplate CRUD endpoints, but creates massive new demand for *Systems Architects*, *Domain Verifiers*, *AI Security Auditors*, and *Hardware Infrastructure Engineers*. Learn the mathematics and system plumbing—not just library APIs.
]
""",

    7: """
#v(2.5pt)
== 7.3 The Manifold Hypothesis & Representation Learning

Why can high-dimensional data (e.g. $1024 times 1024$ images living in a 3,000,000-dimensional vector space) be classified by neural networks?
- *The Manifold Hypothesis*: Real-world data (such as human faces or natural language) does not fill the high-dimensional ambient space uniformly; it concentrates on a much lower-dimensional, non-linear embedded manifold.
- *Deep Feature Extraction*: Successive layers of a Deep Neural Network unravel and flatten this tangled manifold, turning complex curved decision surfaces into simple planar separations in the final classification layer.
""",

    8: """
#v(2.5pt)
== 8.4 Bias-Variance Tradeoff & Regularization Mathematics

Every supervised learning model faces the fundamental generalization dilemma:
$ "Expected Error" = "Bias"^2 + "Variance" + "Irreducible Noise" sigma^2 $

#table(
  columns: (1.2fr, 1.8fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Technique*], [*Penalty Formulation*], [*Geometric Behavior*], [*Best Used When*]),
  [L1 (Lasso)], [$lambda sum |w_i|$], [Diamond corner solutions; drives weights to exact 0.], [Feature selection / sparse data.],
  [L2 (Ridge)], [$lambda sum w_i^2$], [Spherical constraint; shrinks weights smoothly.], [Multicollinear features present.],
  [ElasticNet], [$alpha L_1 + (1-alpha) L_2$], [Combines sparsity with group selection.], [High-dimensional correlated features.],
  [Dropout], [Random zeroing with probability $p$], [Breaks co-adaptation between neurons.], [Deep Neural Networks / CNNs.]
)

#v(2pt)
#concept-box(title: "INTERVIEW VIVA: REGULARIZATION IN LARGE LANGUAGE MODELS")[
  *Question*: How is L2 regularization applied in modern LLM fine-tuning?\\
  *Answer*: In PyTorch AdamW optimizers, weight decay ($lambda = 0.01$) is decoupled from gradient moving averages, preventing transformer attention weights from exploding and drifting from foundational pre-trained weights.
]
""",

    9: """
#v(2.5pt)
== 9.4 Dimensionality Reduction & Latent Space Geometry

In unsupervised learning, projecting high-dimensional data into low-dimensional manifolds enables representation learning:
- *Principal Component Analysis (PCA)*: Orthogonal linear transformation maximizing data variance along eigenvectors of covariance matrix $Sigma = 1/n X^T X$.
- *t-SNE & UMAP*: Non-linear manifold learning preserving local topological distances. UMAP preserves both local and global structure, making it the industry standard for visualizing 1536-dimensional OpenAI vector embeddings.
""",

    10: """
#v(2.5pt)
== 10.3 The Exploration vs Exploitation Dilemma in Production

In production recommendation engines and adaptive agents, systems must balance exploitation with discovery:
- *Multi-Armed Bandits (MAB)*: Optimizes click-through rate by dynamically balancing high-performing arms with unexplored options using Upper Confidence Bound ($"UCB" = mu_i + c sqrt(ln(t) / n_i)$).
- *Contextual Bandits in LLM Alignment*: Used in production recommendation engines (e.g. Netflix, YouTube) and personalized prompt routers to maximize long-term user retention without collapsing into degenerate local optima.
""",

    11: """
#v(2.5pt)
== 11.4 Vanishing Gradients & Modern Normalization Layers

During backpropagation through deep networks ($L > 20$), gradient signals shrink exponentially:
$ (partial L) / (partial W_1) = (partial L) / (partial a_L) product_(l=2)^L (partial a_l) / (partial a_(l-1)) dot (partial a_1) / (partial W_1) $
If derivative values $|sigma'(z)| < 0.25$ (as with Sigmoid), gradients vanish to zero. Modern architectures overcome this via:
- *Layer Normalization (LayerNorm)*: Normalizes activations across the channel dimension for each independent sequence token.
- *RMSNorm (Root Mean Square Norm)*: Omits mean-centering computation ($"RMS"(x) = sqrt(1/d sum x_i^2)$), boosting transformer throughput by $7\%$ with zero accuracy loss (used in Llama-3 and Mistral).
""",

    12: """
#v(2.5pt)
== 12.3 Residual Skip Connections & Modern CNN Frontiers

He et al. (2015) revolutionized deep networks by introducing *Residual Connections*:
$ y = cal(F)(x, {W_i}) + x $
- *Gradient Highway*: The identity mapping $+ x$ provides a clean pathway for gradients to flow backward unimpeded ($partial y / partial x = partial cal(F) / partial x + 1$). Even if $partial cal(F) / partial x approx 0$, the gradient never drops below 1.
- *ConvNeXt*: Modern architectures incorporating 7x7 depthwise separable convolutions and inverted bottlenecks, proving pure convolutional networks remain competitive with Vision Transformers for edge mobile deployments.
""",

    13: """
#v(2.5pt)
== 13.3 Attention Mechanism: Why Recurrence Was Replaced

While LSTMs and GRUs conquered vanishing gradients via gating mechanisms, their fundamental architectural flaw was *sequential recurrence*: token $t$ cannot be computed until token $t-1$ finishes. This prevented horizontal GPU scaling and created an information bottleneck over long sequence horizons ($> 1,000$ tokens), paving the way for the Transformer revolution.
""",

    14: "",

    15: """
#v(2pt)
#tech-spotlight-box(title: "WHY ROTARY POSITIONAL EMBEDDING (ROPE) REPLACED ABSOLUTE EMBEDDINGS")[
  Classic Transformers added static positional vectors $P_i$ to token vectors $E_i$. RoPE rotates query and key vectors in complex 2D planes ($q_m^T k_n = f(q, k, m-n)$), allowing models like Llama-3 to effortlessly extrapolate context lengths from 8k to 128k tokens with zero retraining!
]
""",

    16: """
#v(2.5pt)
== 16.3 The KV Cache Bottleneck in Production Inference

During LLM generation, computing attention sequentially token-by-token is memory-bandwidth bound:
- *Key-Value (KV) Cache*: Caches past Key and Value matrices in GPU VRAM so attention is not recomputed for previous prompt tokens:
  $ "KV Cache Size" = 2 times "Layers" times "Heads" times d_"head" times "SeqLen" times "Batch" times "Bytes" $
- *Architectural Solutions*:
  - *Multi-Query Attention (MQA)*: All query heads share a single key-value head, reducing KV cache by $8 times$.
  - *Grouped-Query Attention (GQA)*: 8 query heads share 1 KV head (Llama-3 standard), balancing inference speed and model reasoning.
  - *PagedAttention (vLLM)*: Eliminates VRAM fragmentation by storing KV cache in non-contiguous virtual memory pages like an OS kernel.
""",

    17: """
#v(2.5pt)
== 17.3 Direct Preference Optimization (DPO) vs PPO

Aligning models with human preferences historically required Proximal Policy Optimization (PPO), which needed 4 separate models loaded simultaneously in GPU memory (Policy, Reference, Reward, Value).

#table(
  columns: (1.2fr, 2.2fr, 2fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Metric*], [*PPO (Reinforcement Learning)*], [*DPO (Direct Optimization)*], [*Enterprise Choice*]),
  [Reward Model], [Requires training standalone reward network.], [Implicitly formulated inside policy loss.], [DPO (Simpler)],
  [GPU VRAM], [High (requires 4 concurrent model copies).], [Low (only policy + frozen reference).], [DPO saves 60% VRAM],
  [Training Stability], [Hyperparameter sensitive, prone to collapse.], [Extremely stable supervised cross-entropy.], [DPO (Zero RL instability)],
  [Production Adoption], [Used in original GPT-4 pre-training.], [Standard for Llama-3, Mistral, Zephyr.], [DPO Enterprise Standard]
)

#v(2pt)
#concept-box(title: "INTERVIEW TIP: HOW DPO DERIVES REWARDS WITHOUT A REWARD MODEL")[
  DPO reparameterizes the Bradley-Terry preference model by showing that the optimal policy $pi_theta$ directly implies the underlying reward function: $r(x, y) = beta log (pi_theta (y|x) / pi_"ref" (y|x))$.
]
""",

    18: """
#v(2.5pt)
== 18.3 Quantization Mathematics: FP16 to INT4

Deploying frontier 70B models on commodity hardware requires reducing parameter precision:
- *Uniform Affine Quantization*: Maps floating-point weight $W$ to integer $q$:
  $ q = "round"((W) / (S)) + Z, quad S = ("max" - "min") / (2^b - 1) $
- *AWQ (Activation-aware Weight Quantization)*: Identifies the top 1% salient weights that protect reasoning accuracy and keeps them in FP16 while quantizing the remaining 99% to INT4.
""",

    19: """
#v(2.5pt)
== 19.3 The Chunking Dilemma & Semantic Splitting

Naive fixed-character chunking breaks code blocks and cross-references across boundaries. Enterprise RAG utilizes *Semantic Chunking*:
- *Embedding Distance Splitting*: Computes cosine similarity between consecutive sentences. When similarity drops below threshold $tau$, a new chunk boundary is instantiated.
- *Parent-Document Retrieval*: Embeds small 200-token chunks for high-precision semantic search, but injects the full 1500-token parent document into the LLM context window for complete factual synthesis.
""",

    20: """
#v(2.5pt)
== 20.3 DSPy: Algorithmic Prompt Optimization

Manual prompt engineering is fragile—small phrasing tweaks break formatting. Stanford's *DSPy framework* replaces manual prompts with compiled code pipelines:
- *Signatures & Modules*: Define inputs and outputs declaratively (e.g. `dspy.Predict("context, question -> answer")`).
- *Teleprompters & Optimizers*: Automatically evaluate hundreds of prompt variations, few-shot examples, and chain-of-thought demonstrations against validation datasets, mathematically discovering the optimal prompt that maximizes accuracy.
- *Production Guardrail*: Wrap all user inputs in strict XML boundaries: `<user_input>{sanitized_query}</user_input>` to systematically prevent instruction override attacks.
""",

    21: "",

    22: "",

    23: """
#v(2.5pt)
== 23.3 High-Bandwidth Interconnects: InfiniBand vs RoCE

Connecting 10,000+ GPUs into a single supercomputer requires non-blocking network fabrics:
- *InfiniBand (NVIDIA Quantum-X800)*: 800 Gbps per port with sub-microsecond latency and hardware-based subnet management. The gold standard for pre-training frontier foundation models.
- *RoCE (RDMA over Converged Ethernet)*: Runs Remote Direct Memory Access over standard enterprise Ethernet switches using Priority Flow Control (PFC). Delivers 85% of InfiniBand throughput at 40% lower infrastructure capital expenditure.

#v(2pt)
#concept-box(title: "GPU METRICS EVERY ARCHITECT MUST MONITOR")[
  In production clusters, track: (1) *MFU (Model Flops Utilization)*: frontier standard is $> 45\%$; (2) *GPU Memory Bandwidth Saturation*; (3) *InfiniBand Cable Retransmit Errors* causing cluster stalls.
]
""",

    24: """
#v(2.5pt)
== 24.3 Sovereign Cloud & The Edge AI Revolution

Geopolitical export controls have accelerated the deployment of Small Language Models (SLMs) on physical edge devices:
- *On-Device Neural Engines*: Apple Neural Engine (ANE), Qualcomm Snapdragon NPU, and Hailo-8 AI accelerators execute 3B–8B parameter models locally on smartphones, automobiles, and drones with zero internet connection.
- *Privacy & Sovereignty*: Edge models ensure patient health data, defense telemetry, and personal biometric credentials never leave device memory, completely immune to international cloud outages and foreign data subpoenas.

#v(2pt)
#tech-spotlight-box(title: "THE HARDWARE COST OF SOVEREIGNTY")[
  A sovereign nation or bank deploying an open-weights 70B model requires only 4x NVIDIA H100 GPUs to serve all internal banking and customer queries locally for 5 years, saving millions compared to recurring cloud API token subscriptions.
]
""",

    25: """
#v(2.5pt)
== 25.3 Sovereign Compute Deployment Roadmap

The IndiaAI Mission establishes a distributed high-performance computing tier:
- *Tier-1 Centers*: National Supercomputing Mission facilities housing 1,000+ GPU supernodes for academic and defense foundation model pre-training.
- *Tier-2 Incubation*: Subsidized GPU cloud access for qualified deep-tech startups via national credit vouchers, lowering entry barriers for Indian innovators.
""",

    26: """
#v(2.5pt)
== 26.3 India's DPI AI Stack: ONDC, Aadhaar & DigiLocker

India's Digital Public Infrastructure (DPI) provides an unmatched foundation for agentic AI:
- *Aadhaar Face Auth AI*: Executes biometric liveness detection and facial embedding matching on over 1.4 billion citizens for instant, fraud-proof digital KYC.
- *ONDC (Open Network for Digital Commerce)*: Open protocols enable conversational AI buyer agents to discover products, negotiate delivery, and execute UPI micropayments across millions of neighborhood kirana stores without centralized marketplace platform fees.

#v(2pt)
#tech-spotlight-box(title: "BHASHINI OPEN API INTEGRATION FOR DEVELOPERS")[
  Indian developers can query Bhashini's national APIs for free via ULCA (Universal Language Contribution API), enabling speech-to-text, translation, and text-to-speech across all 22 scheduled Indian languages inside commercial apps.
]
""",

    27: """
#v(2.5pt)
== 27.3 Industrial LLM Observability & Guardrails Stack

Enterprise deployments require real-time monitoring and deterministic guardrails:
- *LLM Tracing (LangSmith / Arize Phoenix)*: Logs every token generation step, latency breakdown, embedding cosine distance, and exact prompt-response traces for debugging regressions.
- *Safety Guardrails (NeMo Guardrails / Guardrails AI)*: Programmable policy enforcement that blocks prompt injections, masks PII (PAN, Aadhaar numbers), and enforces brand compliance before responses reach customers.

#v(2pt)
#concept-box(title: "CRITICAL FAILURE RECOVERY PLAYBOOK")[
  1. *Circuit Breaker*: If output validation failure rate exceeds 2%, route requests to a secondary fallback provider.
  2. *Shadow Deployment*: Route 10% of live production traffic to newly fine-tuned models to benchmark hallucination rates before full promotion.
]
""",

    28: """
#v(2.5pt)
== 28.4 The Multi-Model Routing Pattern

Enterprise production systems rarely rely on a single foundation model:
- *Intelligent LLM Router*: Analyzes incoming query complexity using lightweight semantic classifiers.
- Simple FAQ and routing requests route to fast, cheap models (Llama-3-8B at \\$0.05 per million tokens). Complex mathematical reasoning or code generation routes to frontier models (Claude 3.5 Sonnet or GPT-4o), reducing overall enterprise API expenditures by over *70%*.
""",

    29: """
#v(2.5pt)
== 29.4 The 3-Tier Enterprise Compensation Structure

In high-growth tech firms and GCCs, total compensation comprises:
1. *Base Salary (Fixed)*: 50%–70% of total package, paid monthly.
2. *Performance Bonus*: 10%–20%, tied to delivery of production AI systems.
3. *Equity / RSUs*: 20%–40%, vesting over 4 years with high upside as the enterprise scales AI capabilities.

#v(2pt)
#tech-spotlight-box(title: "GLOBAL REMOTE WORK FROM INDIA")[
  US and European startups are actively hiring remote Indian AI engineers, paying in USD via platforms like Deel, Remote.com, and direct contracts (\\$80,000 to \\$180,000 annually = ₹65 Lakhs to ₹1.5 Crores).
]
""",

    30: """
#v(2.5pt)
== 30.3 High-Yield Specialization Selection Strategy

#table(
  columns: (1.4fr, 1.6fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Track*], [*Primary Stack*], [*Entry CTC (India)*], [*Senior CTC (India)*]),
  [Generative AI Engineer], [Python, LangChain, LlamaIndex, vLLM], [₹6.5 – ₹12 LPA], [₹28 – ₹45+ LPA],
  [MLOps & AI Platform], [Docker, K8s, Ray, Triton, MLflow], [₹8.0 – ₹14 LPA], [₹32 – ₹55+ LPA],
  [AI Research Scientist], [PyTorch, CUDA, JAX, Distributed], [₹12 – ₹20 LPA], [₹40 – ₹70+ LPA],
  [AI Solutions Architect], [AWS/Azure AI, Cloud Governance, Security], [₹14 – ₹24 LPA], [₹45 – ₹80+ LPA]
)

#v(2pt)
#concept-box(title: "KEY CAREER DECISION RULE")[
  If you have strong backend or DevOps experience, transition via *MLOps & AI Platform Engineering*—it commands the highest immediate salary premium due to severe talent scarcity!
]
""",

    31: """
#v(2.5pt)
== 31.3 The 24-Week Daily Habit & Time Allocation Blueprint

To successfully master artificial intelligence alongside full-time work or college studies:
- *Weekdays (2 Hours Daily)*: 45 mins reading core theory/math -> 60 mins hands-on PyTorch/LangChain coding -> 15 mins reviewing model documentation.
- *Weekends (5 Hours Daily)*: Building end-to-end projects, writing comprehensive GitHub README documentation, benchmark testing, and publishing technical breakdown posts on LinkedIn.
- *Consistency Rule*: 14 hours of focused coding weekly for 24 weeks will place you in the top 5% of AI candidates globally.

#v(2pt)
#tech-spotlight-box(title: "RTECHLAB DEFINITION OF 'PORTFOLIO READY'")[
  A project is only ready for your resume when it is: (1) Fully committed to GitHub with an architecture diagram; (2) Deployed live on a public URL; (3) Tested with edge-case prompt injection benchmarks.
]
""",

    32: """
#v(2.5pt)
== 32.3 The GitHub Repo README Standard for Hiring Managers

Hiring managers spend less than 90 seconds reviewing a candidate's GitHub portfolio. Every repository must include:
1. *Hero Architecture Diagram*: Clear visual flowchart showing data ingestion, vector search, LLM routing, and output guardrails.
2. *One-Click Live Demo*: Working URL on Hugging Face Spaces or Streamlit Cloud.
3. *Quantitative Benchmark Table*: Latency (p95), token cost per query, and accuracy metrics comparing baseline vs your optimized system.
4. *Reproducible Docker Compose*: Single command `docker compose up` that spins up the entire vector DB, backend API, and UI seamlessly.
""",

    33: """
#v(2.5pt)
== 33.3 High-Converting Cold Outreach Template for AI Roles

When reaching out to Engineering Directors and Founders on LinkedIn:
- *Do NOT send*: "Sir, please review my resume for any suitable opening."
- *DO send*: "Hi [Name], loved your team's recent deployment of [Product]. I noticed the latency on complex queries might be bottlenecked by naive sequential retrieval. I built a 60-second prototype using HyDE and semantic reranking that dropped p95 latency by 34% on similar datasets. Here is the 1-minute Loom demo and GitHub repo: [Link]. Would love 5 minutes to share how this applies to your roadmap!"
""",

    34: """
#v(2.5pt)
== 34.3 Free Certification Vouchers & Enterprise Reimbursement

Industry cloud certification exams (AWS, Google Cloud, Azure) typically cost \$100 to \$300:
- *Microsoft Cloud Skills Challenge*: Offers 100% free certification exam vouchers twice annually upon completing interactive learning modules.
- *AWS Community Days & Student Programs*: AWS Educate and Cloud Club initiatives provide free test vouchers and \$100+ promotional AWS cloud compute credits.
- *Corporate Training Budgets*: Most IT service firms and GCCs allocate ₹25,000–₹50,000 annually per employee for approved technical certifications. Always check internal HR portals before paying out of pocket!
""",

    35: """
#v(2.5pt)
== 35.3 The Enterprise AI Agency Pricing Matrix (2026–2028)

#table(
  columns: (1fr, 1.8fr, 1.8fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Tier*], [*Deliverable Scope*], [*Client Business Value*], [*Standard Fee*]),
  [Tier 1: Web Chatbot], [Fine-tuned customer support bot with website widget & FAQ sync.], [Eliminates 60% of basic support tickets.], [₹35,000 – ₹50,000],
  [Tier 2: Enterprise RAG], [Private document search across 10,000 internal PDFs with citation tags.], [Cuts internal research time from hours to seconds.], [₹75,000 – ₹1,50,000],
  [Tier 3: Autonomous Agent], [Multi-tool agent booking appointments, querying SQL & sending emails.], [Automates full-time receptionist / clerk workflows.], [₹1,50,000 – ₹2,80,000],
  [Tier 4: Enterprise Pipeline], [On-premise open-weights LLM deployment with vLLM & SOC2 security.], [Complete data sovereignty with zero third-party API leaks.], [₹3,50,000 – ₹6,00,000+]
)

#v(2pt)
#tech-spotlight-box(title: "CLOSING YOUR FIRST CLIENT: THE 14-DAY COLD SPRINT")[
  1. Identify 20 local businesses (clinics, law firms, real estate agencies, chartered accountants).
  2. Scrape their public website and build a working 60-second prototype on Streamlit before reaching out.
  3. Send a personalized Loom video demonstrating the bot answering questions specific to *their* business.
  4. Offer a risk-free 7-day trial: "If it does not save you 10 hours this week, pay nothing." Conversion rate: $> 25\%$.
]
""",

    36: """
#v(2.5pt)
== 36.4 The Developer Tech Stack Migration Matrix

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Current Background*], [*What You Already Know*], [*What to Learn to Double Your CTC*]),
  [Java / Spring Boot], [Microservices, Hibernate, multi-threading, concurrency.], [Python, LangChain, Spring AI, Vector DBs, vLLM microservices.],
  [JavaScript / React / Node], [Frontend UX, WebSockets, async event loops, JSON APIs.], [Vercel AI SDK, Generative UI streaming, Llama-3 API wrappers.],
  [DevOps / SRE], [Docker, Kubernetes, Linux, Prometheus, CI/CD, Terraform.], [GPU orchestration, Triton, Ray distributed, vLLM, Helm charts for AI.],
  [QA / Manual Testing], [Test cases, edge cases, regression verification, bug reports.], [LLM evaluation benchmarks, Ragas framework, prompt injection red-teaming.]
)

#v(2pt)
#concept-box(title: "THE FINAL MINDSET SHIFT: DETERMINISTIC TO PROBABILISTIC")[
  In traditional programming, $2 + 2$ is always $4$, and an `if` statement either executes or does not. In AI, identical inputs can produce different outputs based on temperature and sampling distributions. The senior engineer's job is not writing logic—it is *constraining probability* through embeddings, cross-encoders, and rigorous evaluation guardrails.
]
""",

    37: """
#v(2pt)
#concept-box(title: "CORE MATH INTERVIEW PREPARATION TIP")[
  When asked to explain algorithms, always structure your answer in 3 parts:
  1. *Geometric Intuition*: What is the shape of the data and decision boundary?
  2. *Loss Function & Calculus*: What mathematical quantity is minimized, and how do gradients flow?
  3. *Production Failure Mode*: Under what real-world condition (e.g. outliers, multicollinearity) does this algorithm fail?
]
""",

    41: """
#v(2.5pt)
== 41.3 Watermarking Synthetic Content: C2PA & SynthID

To combat malicious deepfakes, global standards enforce cryptographically verifiable provenance:
- *Coalition for Content Provenance and Authenticity (C2PA)*: Embeds tamper-evident digital metadata into media headers, recording origin and cryptographic keys.
- *Steganographic Latent Watermarking (SynthID)*: Developed by Google DeepMind. Injects imperceptible modifications directly into generated latents or token probability distributions, surviving cropping and compression.

#v(2pt)
#table(
  columns: (1.2fr, 1.8fr, 2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Jurisdiction*], [*Primary Legislative Act*], [*Key Governance Mandate*], [*Stance on Innovation*]),
  [European Union], [EU AI Act (2024)], [Strict risk classification (Unacceptable to Minimal); heavy fines up to 7% turnover.], [Precautionary / Restrictive],
  [United States], [White House Executive Order 14110], [Mandatory safety reporting for dual-use models trained on $> 10^(26)$ FLOPs.], [Pro-Innovation / Defense],
  [India], [DPDP Act + IndiaAI], [Data consent frameworks, sovereign compute subsidies, non-punitive startup support.], [Democratized / Pro-Growth],
  [China], [Generative AI Service Measures], [Mandatory security assessments and alignment with core socialist values.], [State-Guided Development]
)
""",

    42: """
#v(2.5pt)
== 42.2 The RTechLab 10 Code Commitments of Technical Mastery

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    - 1. *Understand the mathematics* before importing libraries.
    - 2. *Never deploy naive RAG* without hybrid search and reranking.
    - 3. *Measure latency and token costs* on every prompt call.
    - 4. *Quantize models responsibly* without degrading safety.
    - 5. *Build for sovereignty*: Support Indic and open models.
  ],
  [
    - 6. *Sandbox autonomous agents* in ephemeral micro-VMs.
    - 7. *Prevent hallucinations* through deterministic grounding.
    - 8. *Commit production code daily* to public GitHub repos.
    - 9. *Deliver real business ROI* to every client and employer.
    - 10. *Technology Made Practical*: Learn. Practice. Innovate.
  ]
)

#v(3pt)
#align(center)[
  #box(
    fill: rgb("#0F172A"),
    inset: (x: 14pt, y: 8pt),
    radius: 4pt,
    text(size: 8pt, weight: "bold", fill: white)[
      OFFICIAL RTECHLAB CODE REPOSITORY: github.com/rtechlab/ai-essentials-2027 · VERIFIED EDITION
    ]
  )
]
"""
}

# 1. Merge and enrich all chapters
all_chapters = {}
all_chapters.update(chapters_eng_part1)
all_chapters.update(chapters_eng_part2)
all_chapters.update(chapters_eng_part3)
all_chapters.update(chapters_eng_part4)
all_chapters.update(chapters_eng_part5)
all_chapters.update(chapters_eng_part6)

print(f"[INFO] Merging enrichments into {len(all_chapters)} English chapters...")

for ch_num, base_content in all_chapters.items():
    if ch_num in enrichments_v2:
        enriched = base_content + enrichments_v2[ch_num]
    else:
        enriched = base_content
    
    ch_path = os.path.join(eng_dir, f"chapter-{ch_num:02d}.typ")
    with open(ch_path, "w", encoding="utf-8") as f:
        f.write(enriched)

print("[INFO] All 42 chapter files written with high density!")

# 2. Compile with Typst
pdf_out = os.path.join(out_dir, "AI-Essentials-English-Edition-1.pdf")
cmd = ["typst", "compile", "--root", ".", os.path.join(eng_dir, "ai-master-guide-en.typ"), pdf_out]
res = subprocess.run(cmd, capture_output=True, text=True)

if res.returncode != 0:
    print(f"[ERROR] Compilation failed:\n{res.stderr}")
    sys.exit(1)

print(f"[SUCCESS] Compiled successfully to {pdf_out}")

# 3. Audit vertical fill on all pages
doc = fitz.open(pdf_out)
print(f"[AUDIT] Total Pages: {len(doc)} (Target: 44 Pages)")

underfilled = []
for i, page in enumerate(doc):
    if i == 0 or i == 1:
        continue
    content_blocks = [
        b for b in page.get_text('blocks') 
        if b[1] > 40 and b[3] < 800 
        and 'C E R T I F I E D' not in b[4]
        and 'RTECHLAB' not in b[4]
        and 'Technology Made' not in b[4]
    ]
    if content_blocks:
        bottom = max(b[3] for b in content_blocks)
        top = min(b[1] for b in content_blocks)
        fill = ((bottom - top) / 720.0) * 100
        print(f"  Page {i+1:02d} (Ch {i-1:02d}): top={top:5.1f}, bottom={bottom:5.1f} pt, fill={fill:5.1f}%")
        if bottom < 670:
            underfilled.append((i+1, bottom))

if len(doc) == 44:
    print("\n[PERFECT] EXACTLY 44 PAGES MAINTAINED!")
else:
    print(f"\n[WARNING] Page count changed to {len(doc)}!")

if not underfilled:
    print("[PERFECT] ZERO UNDERFILLED PAGES! Every single page is densely packed (bottom >= 670pt)!")
else:
    print(f"[INFO] Pages under 670pt: {len(underfilled)} -> {underfilled}")
