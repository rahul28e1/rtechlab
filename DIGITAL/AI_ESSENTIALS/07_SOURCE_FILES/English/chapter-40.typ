#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 6: TOP 50 MNC INTERVIEW VAULT & ETHICS · CHAPTER 40]
= Top 50 MNC AI Interview Vault: System Design & Scenarios (Q39–Q50)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Architecture and system design questions asked during senior and staff AI engineering interviews to assess real-world scaling and production tradeoffs.
]

#v(2pt)

#table(
  columns: (0.6fr, 2.4fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*No.*], [*System Design / Scenario Question*], [*Production Architecture Solution*]),
  [Q39], [Design an Enterprise Document RAG system for 10 Million PDF pages.], [Decoupled pipeline: Ingestion via OCR + PyMuPDF; hierarchical chunking (parent-child); Milvus cluster with HNSW; hybrid search with BM25; Cohere reranker; vLLM Llama-3 serving; Redis semantic caching.],
  [Q40], [How do you prevent Prompt Injections in an autonomous AI agent?], [Implement multi-layer defense: Dual-LLM architecture (untrusted input parsed by sandboxed evaluator before orchestrator); strict Pydantic JSON schema output; isolated tool execution sandboxes (gVisor/Docker).],
  [Q41], [Design a Real-Time Recommendation System for 50 Million DAU.], [Two-stage architecture: Candidate Generation (Two-Tower Deep Neural Net filtering 10M items to 500 candidates via Annoy vector search in $< 10$ms); Ranking Stage (deep feature cross net scoring top 50 in $< 20$ms).],
  [Q42], [How do you serve an AI model with $< 100$ms latency SLA under high traffic?], [Deploy on vLLM / TensorRT-LLM with dynamic batching; utilize FP8 quantization; implement speculative decoding; maintain a distributed Redis semantic cache for common customer queries.],
  [Q43], [Explain the ReAct framework in Autonomous Agents.], [Interleaves Reasoning (Chain-of-Thought) and Acting (Tool Calling). Agent plans step -> emits structured API call -> observes real environment output -> reflects and continues until goal is satisfied.],
  [Q44], [How do you handle Concept Drift in deployed machine learning models?], [Continuously calculate Population Stability Index (PSI) and Wasserstein distance between inference inputs and training baseline. Trigger automated retraining pipeline when PSI $> 0.25$.],
  [Q45], [How do you test and validate LLM outputs in CI/CD?], [Maintain an audited golden evaluation test suite (500+ hard prompts); run automated LLM-as-a-Judge evaluations comparing semantic similarity, factual accuracy, and toxicity benchmarks on pull requests.],
  [Q46], [Explain Tensor Parallelism vs Pipeline Parallelism in distributed training.], [Tensor Parallelism (Megatron-LM) splits individual weight matrices across GPUs within an NVLink node. Pipeline Parallelism splits model layers sequentially across different nodes over InfiniBand.],
  [Q47], [How do you build a multilingual voicebot for rural India?], [Streaming architecture: Client WebRTC -> Bhashini / Whisper ASR -> Indic LLM (Sarvam-1 / Krutrim) with local dialect grounding -> Streaming Text-to-Speech (TTS) -> audio response back in $< 800$ms.],
  [Q48], [What is Mixture of Experts (MoE) and why does it scale?], [Replaces dense feedforward layers with $N$ sparse expert sub-networks routed by a gating network. Only top-$K$ experts (e.g. 2 of 8 in Mixtral 8x7B) activate per token, achieving 47B capacity at 13B compute speed.],
  [Q49], [How do you manage Rate Limits and Costs across multiple LLM providers?], [Implement an AI Gateway (e.g. LiteLLM proxy) with automatic fallback: attempt primary tier (GPT-4o) -> fallback to secondary (Claude 3.5 Sonnet) -> fallback to local self-hosted vLLM on timeout.],
  [Q50], [What questions should YOU ask the interviewer at the end of an AI interview?], ["What is your current GPU cluster utilization and training-to-inference spend ratio?", "How do you evaluate and track hallucination regression in your production RAG pipelines?"]
)
