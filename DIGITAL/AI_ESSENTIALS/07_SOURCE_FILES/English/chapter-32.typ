#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 5: 2027 CAREER & SALARY BLUEPRINT · CHAPTER 32]
= The Million-Dollar AI Project Portfolio (5 Enterprise Systems)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Generic student projects like "Titanic Survival" or "MNIST Digit Recognition" guarantee resume rejection. To secure top-tier interviews, your GitHub portfolio must showcase production-grade architectures solving real commercial challenges.
]

#v(2pt)

== 32.1 Five Industry-Grade GitHub Projects That Guarantee Interviews

#table(
  columns: (1.2fr, 2.2fr, 1.8fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Project Name*], [*Enterprise System Architecture*], [*Key Technologies*], [*Resume Impact Metric*]),
  [1. Autonomous Financial Analyst Swarm], [Multi-agent system: Scrapes real-time SEC 10-K filings, executes ratio formulas via Python sandbox, generates audited investment memo.], [LangGraph, CrewAI, Yahoo Finance API, GPT-4o, Pydantic.], [Reduced equity research turnaround time from 6 hours to 4 minutes.],
  [2. Multilingual Indic Medical Triage Bot], [Speech-to-speech diagnostic assistant translating patient symptoms in 10 Indian dialects into clinical doctor summary notes.], [Bhashini ASR/TTS, Sarvam-1, Whisper, ChromaDB, FastAPI.], [Handled 22 Indian dialects with $>92\%$ phonetic recognition accuracy.],
  [3. Enterprise Vector Search Engine], [Hybrid semantic search engine indexing 500,000 PDF pages with BM25 + dense HNSW, Reciprocal Rank Fusion, and Cohere reranker.], [Qdrant / Milvus, LangChain, FlashAttention, Docker.], [Achieved 96.4% Recall\@10 at $< 45$ms p95 latency.],
  [4. Real-Time Edge Vision Inspection], [Edge computer vision pipeline detecting manufacturing micro-defects in assembly lines at 90 FPS on low-power hardware.], [YOLOv10, TensorRT, OpenCV, NVIDIA Jetson, WebSocket.], [Detected 0.2mm component cracks with 99.1% precision at 90 FPS.],
  [5. High-Throughput LLM Gateway], [Production reverse-proxy gateway providing rate-limiting, semantic caching (Redis), fallback routing, and PII anonymization.], [FastAPI, vLLM, Redis, LiteLLM, Docker, Prometheus.], [Cut enterprise LLM API expenditure by 38% through semantic caching.]
)

#v(2pt)
#tech-spotlight-box(title: "PORTFOLIO PRESENTATION MANDATE")[
  Every project repository MUST contain:
  1. A high-resolution architecture diagram showing data flow between client, server, vector DB, and LLM.
  2. A 2-minute Loom video demo walking through edge cases and failure modes.
  3. A 1-click Docker Compose file allowing the hiring manager to run the system locally in 60 seconds.
]

#v(2.5pt)
== 32.3 The GitHub Repo README Standard for Hiring Managers

Hiring managers spend less than 90 seconds reviewing a candidate's GitHub portfolio. Every repository must include:
1. *Hero Architecture Diagram*: Clear visual flowchart showing data ingestion, vector search, LLM routing, and output guardrails.
2. *One-Click Live Demo*: Working URL on Hugging Face Spaces or Streamlit Cloud.
3. *Quantitative Benchmark Table*: Latency (p95), token cost per query, and accuracy metrics comparing baseline vs your optimized system.
4. *Reproducible Docker Compose*: Single command `docker compose up` that spins up the entire vector DB, backend API, and UI seamlessly.

#v(2pt)
== 32.4 Production Docker Compose Standard for AI Portfolios

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
