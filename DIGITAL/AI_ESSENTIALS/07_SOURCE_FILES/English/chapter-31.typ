#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 5: 2027 CAREER & SALARY BLUEPRINT · CHAPTER 31]
= 0-to-6 Month Complete AI Learning & Execution Roadmap

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Randomly watching disconnected tutorials guarantees failure. This battle-tested 24-week curriculum provides a structured, day-by-day progression designed to take ambitious students from foundational Python to production AI deployment.
]

#v(2pt)

== 31.1 The 24-Week Structured AI Mastery Curriculum

#table(
  columns: (0.9fr, 1.4fr, 2.5fr, 1.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Timeline*], [*Curriculum Phase*], [*Core Technical Topics & Mathematical Concepts*], [*Milestone Production Deliverable*]),
  [Weeks 1–4], [Phase 1: Math & Python for AI], [Linear Algebra (Matrices, Eigenvalues), Calculus (Partial derivatives), NumPy vectorized coding, Pandas, Matplotlib.], [Vectorized linear regression engine written from scratch in NumPy.],
  [Weeks 5–8], [Phase 2: Classical Machine Learning], [Supervised learning (Regression, Trees, XGBoost), Unsupervised (K-Means, PCA), Cross-validation, Hyperparameter tuning.], [End-to-end loan default prediction system deployed with Streamlit UI.],
  [Weeks 9–12], [Phase 3: Deep Learning Foundations], [Perceptrons, PyTorch tensors, Backpropagation, CNNs (ResNet), Sequence models (LSTM), Optimization (AdamW).], [PyTorch convolutional defect detection model with 95%+ validation accuracy.],
  [Weeks 13–16], [Phase 4: Transformers & Generative AI], [Self-Attention mechanics, Tokenization, Hugging Face ecosystem, Parameter-Efficient Fine-Tuning (LoRA / QLoRA).], [Fine-tuned medical Llama-3 adapter on custom healthcare dataset.],
  [Weeks 17–20], [Phase 5: Enterprise RAG & Vector Systems], [ChromaDB, Pinecone, Chunking strategies, Hybrid Search (BM25 + Dense), Cross-encoders, Anti-hallucination guardrails.], [Production multi-document RAG assistant with citation verification.],
  [Weeks 21–24], [Phase 6: Autonomous Agents & MLOps], [ReAct loop, Tool calling, LangGraph / CrewAI multi-agent swarms, vLLM serving, Docker containerization, AWS deployment.], [Autonomous Financial Research Agent swarm published to GitHub.]
)

#v(2pt)
#concept-box(title: "THE 70/30 PRACTICE RULE")[
  Dedicate 30% of your time to reading theory and mathematics, and *70% of your time to writing code, training models, and debugging terminal error messages*. Employers evaluate your GitHub commit history, deployed web demos, and technical problem-solving capabilities—never passive video certificates.
]

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

#v(2pt)
== 31.4 The Weekly Milestone Rubric (Month 1 to Month 6)

#table(
  columns: (1fr, 1.8fr, 2.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 1.8pt),
  table.header([*Month*], [*Core Focus*], [*Tangible Proof of Work*]),
  [Month 1], [Math, PyTorch & Linear Algebra], [Build custom multi-head attention from scratch in PyTorch.],
  [Month 2], [Transformers, Hugging Face & Fine-Tuning], [Fine-tune Llama-3 with QLoRA on custom dataset & push to Hub.],
  [Month 3], [RAG Systems, Vector DBs & Embeddings], [Deploy production RAG on ChromaDB with hybrid search & reranking.],
  [Month 4], [Autonomous Agents & Tool Calling], [Construct multi-agent ReAct system using LangGraph and tools.],
  [Month 5], [MLOps, vLLM, Docker & Triton], [Deploy quantized model on AWS EC2 GPU instance with monitoring.],
  [Month 6], [Portfolio Polish, Resume & Cold Outreach], [5 production repos with live demos, architecture diagrams & benchmarks.]
)
