#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 5: 2027 CAREER & SALARY BLUEPRINT · CHAPTER 30]
= Six High-Paying AI Career Specializations

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  "AI" is no longer a single job title. Modern enterprises hire across six distinct technical specializations, each requiring a tailored skill stack and portfolio profile.
]

#v(2pt)

== 30.1 The Six Enterprise AI Roles

#table(
  columns: (1.2fr, 2.2fr, 1.8fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Specialization*], [*Core Mission & Daily Workflow*], [*Primary Tech Stack*], [*Top Hiring Sector*]),
  [1. AI / ML Engineer], [Builds, trains, and evaluates supervised & unsupervised predictive models on structured and unstructured data.], [Python, Scikit-Learn, PyTorch, Pandas, SQL, XGBoost.], [Fintech, E-commerce, Healthcare],
  [2. GenAI & LLM Engineer], [Designs production RAG systems, fine-tunes open-weights LLMs (LoRA), and implements autonomous tool-calling agents.], [LangChain, LlamaIndex, ChromaDB, vLLM, Hugging Face, OpenAI APIs.], [Enterprise SaaS, LegalTech, Customer Ops],
  [3. MLOps & LLMOps Architect], [Constructs CI/CD training pipelines, orchestrates GPU clusters, manages model registries, and optimizes inference latency.], [Docker, Kubernetes, MLflow, Ray, Triton Inference Server, Prometheus.], [Cloud Hyperscalers, Banks, Defense],
  [4. AI Research Scientist], [Invents novel architectures, advances foundational math, authors academic papers, and optimizes pre-training scaling laws.], [Advanced Calculus, PyTorch, CUDA C++, JAX, Megatron-LM.], [Frontier AI Labs (OpenAI, DeepMind, Meta)],
  [5. AI Solutions Consultant], [Audits enterprise workflows, identifies high-ROI AI opportunities, and guides C-suite digital transformations.], [System Architecture, Cost-Benefit Modeling, Make/n8n, API Integrations.], [McKinsey, BCG, Big 4, Boutique AI Agencies],
  [6. AI Product Manager], [Defines AI product strategy, user experience for probabilistic outputs, ethical guardrails, and ROI telemetry.], [Product Roadmapping, Eval Benchmarks, User Telemetry, PRDs.], [SaaS Companies, Consumer Tech]
)

#v(2pt)
#tech-spotlight-box(title: "WHERE SHOULD BEGINNERS FOCUS?")[
  If you are transitioning today, *Generative AI & LLM Engineering* and *AI/ML Engineering* have the highest open job volume and lowest barrier to entry. Companies desperately need engineers who can connect existing foundation models to internal databases, write safe prompts, and build resilient vector RAG systems.
]

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

#v(2pt)
== 30.4 Core Deliverables of an Enterprise Generative AI Lead

In senior AI engineering roles (₹35L–₹60L+ CTC), daily responsibilities focus on system reliability:
1. *Production Pipeline Architecture*: Designing fault-tolerant RAG pipelines with fallback model routing and semantic caching.
2. *Guardrails & Security Compliance*: Enforcing prompt-injection barriers, automated PII redaction, and SOC2 audit logging.
3. *Inference Optimization*: Slicing p95 latency via vLLM PagedAttention, TensorRT-LLM compilation, and INT4 quantization.
