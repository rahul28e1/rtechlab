#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 3: TRANSFORMERS & GENERATIVE AI · CHAPTER 19]
= Enterprise Retrieval-Augmented Generation (RAG) Architecture

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  LLMs suffer from two fatal enterprise flaws: knowledge cutoff dates and catastrophic hallucinations. Retrieval-Augmented Generation (RAG) grounds model responses in authoritative corporate vector databases, establishing deterministic factual accuracy.
]

#v(1.5pt)

#align(center)[
  #image("../03_VISUAL_ASSETS/diagrams/rag-vector-pipeline.png", width: 88%)
]

#v(1.5pt)

== 19.1 The Production RAG Pipeline Mechanics

#table(
  columns: (1fr, 1.8fr, 2.2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*RAG Stage*], [*Operational Responsibility*], [*Technical Implementation & Algorithms*], [*Enterprise Metric*]),
  [1. Ingestion & Chunking], [Splits raw PDFs/SQL into semantically coherent segments.], [Recursive Character Splitting (512 tokens with 10% overlap).], [Chunk Boundary Quality],
  [2. Vector Embedding], [Converts text chunks into dense floating-point vectors in $RR^d$.], [OpenAI text-embedding-3-large, BAAI/bge-m3, Indic-BERT.], [Latency ($< 30$ms)],
  [3. Vector Indexing], [Indexes vectors for sub-millisecond similarity search.], [Hierarchical Navigable Small World (*HNSW*) & IVF-PQ.], [Recall\@10 ($> 95\%$) ],
  [4. Semantic Retrieval], [Matches user query vector against vector index.], [Cosine Similarity: $"sim"(u, v) = (u dot v) / (||u|| ||v||)$ or Dot Product.], [Precision\@K],
  [5. Cross-Encoder Re-Ranking], [Re-scores top 20 candidate chunks for precise semantic relevance.], [Cross-encoder model (Cohere Rerank, BGE-Reranker-Large).], [MRR / NDCG\@10],
  [6. Prompt Augmentation], [Injects retrieved context into structured system prompt.], [Context window optimization with anti-hallucination guardrails.], [Factual Groundedness]
)

#v(1.5pt)
#tech-spotlight-box(title: "ADVANCED 2027 RAG: HYBRID SEARCH & SELF-CORRECTIVE RAG")[
  Enterprise production systems never rely solely on vector search. They implement *Hybrid Search* (combining sparse BM25 keyword matching with dense HNSW vector search via Reciprocal Rank Fusion) and *Self-RAG* (where the model grades whether retrieved chunks actually contain the answer before generating a response).
]

#v(2.5pt)
== 19.3 The Chunking Dilemma & Semantic Splitting

Naive fixed-character chunking breaks code blocks and cross-references across boundaries. Enterprise RAG utilizes *Semantic Chunking*:
- *Embedding Distance Splitting*: Computes cosine similarity between consecutive sentences. When similarity drops below threshold $tau$, a new chunk boundary is instantiated.
- *Parent-Document Retrieval*: Embeds small 200-token chunks for high-precision semantic search, but injects the full 1500-token parent document into the LLM context window for complete factual synthesis.
