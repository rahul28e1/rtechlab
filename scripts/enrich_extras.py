# Additions for Ch 35, 36, 41, 42
ch35_extra = """
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
  4. Offer a risk-free 7-day trial: \"If it does not save you 10 hours this week, pay nothing.\" Conversion rate: $> 25\%$.
]
"""

ch36_extra = """
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
  In traditional programming, $2 + 2$ is always $4$, and an `if` statement either executes or does not. In AI, identical inputs can produce different outputs based on temperature and sampling distributions. The senior engineer's job is not writing logic—it is **constraining probability** through embeddings, cross-encoders, and rigorous evaluation guardrails.
]
"""

ch41_extra = """
#v(2.5pt)
== 41.4 Global AI Governance Frameworks Comparison

#table(
  columns: (1.2fr, 1.8fr, 2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Jurisdiction*], [*Primary Legislative Act*], [*Key Governance Mandate*], [*Stance on Innovation*]),
  [European Union], [EU AI Act (2024)], [Strict risk classification (Unacceptable to Minimal); heavy fines up to 7% turnover.], [Precautionary / Highly Restrictive],
  [United States], [White House Executive Order 14110], [Mandatory safety reporting for dual-use models trained on $> 10^(26)$ FLOPs.], [Pro-Innovation / National Security],
  [India], [Digital Personal Data Protection Act (DPDP) + IndiaAI], [Data consent frameworks, sovereign compute subsidies, non-punitive startup support.], [Democratized / Pro-Growth],
  [China], [Generative AI Service Measures], [Mandatory security assessments and alignment with core socialist values.], [State-Guided Development]
)
"""

ch42_extra = """
#v(3pt)
== 42.3 The RTechLab 10 Code Commitments of Technical Mastery
#v(1.5pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    - 1. *Always understand the mathematics* before importing libraries.
    - 2. *Never deploy naive RAG* without hybrid search and reranking.
    - 3. *Measure latency and token costs* on every single prompt call.
    - 4. *Quantize models responsibly* without degrading safety benchmarks.
    - 5. *Build for sovereignty*: Support Indic and open-weights models.
  ],
  [
    - 6. *Strictly sandbox autonomous agents* to prevent unintended actions.
    - 7. *Prevent hallucinations* through deterministic reference grounding.
    - 8. *Commit production code daily* to public GitHub repositories.
    - 9. *Deliver real business ROI* to every client and enterprise employer.
    - 10. *Technology Made Practical*: Learn. Practice. Innovate.
  ]
)

#v(3pt)
#align(center)[
  #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[
    OFFICIAL RTECHLAB CODE REPOSITORY: github.com/rtechlab/ai-essentials-2027 · VERIFIED EDITION
  ]
]
"""
