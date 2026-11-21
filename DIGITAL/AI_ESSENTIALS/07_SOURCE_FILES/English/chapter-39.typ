#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 6: TOP 50 MNC INTERVIEW VAULT & ETHICS · CHAPTER 39]
= Top 50 MNC AI Interview Vault: LLMs, RAG & Vector Systems (Q27–Q38)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Interview questions focused on production Generative AI engineering, vector databases, parameter quantization, and hallucination reduction.
]

#v(2pt)

#table(
  columns: (0.6fr, 2.4fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*No.*], [*Technical Interview Question*], [*Definitive Production Engineering Answer*]),
  [Q27], [How does Retrieval-Augmented Generation (RAG) eliminate hallucinations?], [Grounds the LLM by retrieving factual context from an external vector database, forcing the model to generate answers strictly conditioned on verified reference text via system prompt constraints.],
  [Q28], [Explain the HNSW vector indexing algorithm.], [Hierarchical Navigable Small World builds multi-layer graphs where top layers have long-range skip edges for fast routing, and bottom layers have dense local clustering, achieving $O(log N)$ nearest-neighbor search.],
  [Q29], [What is the difference between Dense Retrieval and Sparse Retrieval?], [Sparse (BM25) matches exact lexical keywords and rare terms. Dense (embeddings) captures latent semantic meaning and synonyms. Production systems combine both via Hybrid Search.],
  [Q30], [What is Cross-Encoder Re-Ranking?], [Unlike bi-encoders which embed query and document independently, a cross-encoder passes query and candidate chunk together through full cross-attention, computing precise relevance scores at higher compute cost.],
  [Q31], [How does LoRA (Low-Rank Adaptation) work?], [Freezes base weights $W_0$ and trains low-rank decomposition matrices $B times A$ where rank $r << d$. Reduces trainable parameter memory by 99% while achieving full fine-tuning performance.],
  [Q32], [What is QLoRA?], [Quantizes base model weights to 4-bit NormalFloat (NF4), uses Double Quantization to compress memory, and backpropagates gradients through 16-bit LoRA adapter weights, enabling 70B tuning on consumer GPUs.],
  [Q33], [Explain RLHF vs DPO alignment.], [RLHF trains a separate reward model and optimizes policy using PPO. Direct Preference Optimization (DPO) derives an analytical solution to optimize the policy directly on preference pairs without a reward model.],
  [Q34], [What is PagedAttention in vLLM?], [Applies OS virtual memory paging principles to the KV-Cache, partitioning attention keys/values into non-contiguous physical blocks. Eliminates 70% memory fragmentation and enables continuous batching.],
  [Q35], [What is Model Quantization (FP16 -> INT8 -> FP4)?], [Maps high-precision floating point weights into lower-bit integers via scale factors ($X_{"quant"} = "round"(X / S) + Z$), slashing VRAM memory footprint and memory bandwidth bottlenecks.],
  [Q36], [How do you handle the 'Lost in the Middle' problem in long context?], [Models attend strongly to the beginning and end of long prompts. Mitigated by placing critical context at the prompt perimeter, re-ranking chunks, or utilizing chunk-level summarization.],
  [Q37], [What is Speculative Decoding?], [Uses a fast, small draft model (e.g. 1B) to generate $K$ candidate tokens quickly, then verifies all $K$ tokens simultaneously in one forward pass of the large target model, boosting inference speed by 2x–3x.],
  [Q38], [How do you evaluate RAG pipelines programmatically?], [Using the *Ragas* framework: measuring Context Precision (signal-to-noise in retrieval), Context Recall (ground truth alignment), Faithfulness (hallucination rate), and Answer Relevance.]
)
