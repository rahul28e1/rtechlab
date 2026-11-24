#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 5: 2027 CAREER & SALARY BLUEPRINT · CHAPTER 33]
= ATS-Optimized AI Resume Engineering & Keyword Blueprints

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Over 80% of AI engineering resumes are discarded by automated Applicant Tracking Systems (ATS) before a human recruiter ever sees them. Structuring your resume for keyword compliance and quantified business impact is essential.
]

#v(2pt)

== 33.1 The High-Impact Google XYZ Resume Formula

Transform passive task descriptions into metric-driven commercial achievements using the Google XYZ framework: *"Accomplished [X], as measured by [Y], by doing [Z]."*

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Domain*], [*Weak / Rejected Bullet (Passive)*], [*Winning ATS Bullet (Quantified Impact)*]),
  [RAG Systems], ["Worked on a RAG application using LangChain and OpenAI to read company policy PDFs."], ["Engineered an enterprise RAG assistant across 15,000 internal PDFs, cutting employee query resolution time by 75% using LangChain, ChromaDB, and hybrid search."],
  [Model Training], ["Fine-tuned open source LLMs using Hugging Face for sentiment classification."], ["Fine-tuned Llama-3 8B via QLoRA on 40,000 customer tickets, boosting sentiment classification F1-score from 0.72 to 0.91 while reducing compute costs by 60%."],
  [MLOps], ["Deployed models on the cloud using Docker and Kubernetes."], ["Architected a high-concurrency vLLM inference gateway on AWS EKS, serving 120 requests/sec at $< 65$ms TTFT with 99.95% uptime."]
)

#v(2pt)
#concept-box(title: "CRITICAL 2027 ATS SKILL KEYWORDS")[
  Ensure these exact keyword clusters appear in your resume's technical skills section:
  - *Core AI*: Deep Learning, Transformers, Self-Attention, PyTorch, NumPy, Scikit-Learn, Backpropagation, Gradient Descent.
  - *Generative AI & LLMs*: RAG, LangChain, LlamaIndex, Vector Databases (Chroma, Pinecone, Qdrant), LoRA, QLoRA, Fine-Tuning.
  - *Serving & MLOps*: vLLM, TensorRT-LLM, Docker, Kubernetes, Triton Inference Server, FastAPI, MLflow, AWS / GCP Cloud.
]
#v(2pt)

== 33.2 Fatal Resume Red Flags to Eliminate Immediately
- *Listing Discredited Datasets*: Never mention Iris, Titanic, Boston Housing, or MNIST.
- *Skill Sliders & Rating Bars*: Bars showing "Python: 90%" or "Machine Learning: 4/5 stars" look amateurish and confuse ATS parsers.
- *Multi-Column Formatting*: Fancy Canva resumes with tables and graphics frequently break ATS parsers; stick to a clean, single-column standard format.

#v(2.5pt)
== 33.3 High-Converting Cold Outreach Template for AI Roles

When reaching out to Engineering Directors and Founders on LinkedIn:
- *Do NOT send*: "Sir, please review my resume for any suitable opening."
- *DO send*: "Hi [Name], loved your team's recent deployment of [Product]. I noticed the latency on complex queries might be bottlenecked by naive sequential retrieval. I built a 60-second prototype using HyDE and semantic reranking that dropped p95 latency by 34% on similar datasets. Here is the 1-minute Loom demo and GitHub repo: [Link]. Would love 5 minutes to share how this applies to your roadmap!"

#v(2pt)
== 33.4 The High-Impact AI Resume Bullet Point Blueprint (X-Y-Z Formula)

Hiring algorithms and hiring managers look for the standard Google X-Y-Z accomplishment structure:
- *Ineffective*: "Worked on LangChain and built a chatbot for customer service."
- *High-Impact*: "Architected enterprise RAG pipeline using *LangChain, ChromaDB, and Bge-large-reranker*, slashing p95 retrieval latency by *42%* and indexing 250,000 corporate documents with *99.4% citation accuracy*."
- *Ineffective*: "Fine-tuned models using LoRA and Hugging Face."
- *High-Impact*: "Fine-tuned *Llama-3-8B* using QLoRA and FlashAttention-2 on 4x NVIDIA A100 GPUs, achieving *88.2% accuracy* on domain-specific medical QA while cutting inference costs by *\$18,000 monthly*."

#v(2pt)
#concept-box(title: "LINKEDIN ALGORITHM KEYWORD PLACEMENT RULES")[
  Place keywords in: (1) Headline: `"Generative AI Engineer | RAG | LangGraph | PyTorch | vLLM"`; (2) About Section: Include GitHub repo links with live Hugging Face demos; (3) Experience Section: Lead with metrics.
]
