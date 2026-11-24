#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 3: TRANSFORMERS & GENERATIVE AI · CHAPTER 16]
= Anatomy of Large Language Models (LLMs): Tokens to Context

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  LLMs process language not as words or characters, but as numeric tokens mapped into high-dimensional vector spaces. Mastering token economics, context memory horizons, and sampling temperatures dictates production performance.
]

#v(2pt)

== 16.1 Subword Tokenization: Byte-Pair Encoding (BPE)

Modern models (GPT-4, Llama-3, Claude) use Byte-Pair Encoding (BPE) or WordPiece to compress text into a vocabulary of 32,000 to 128,000 subword tokens:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Tokenization Concept*], [*Operational Engineering Specification*], [*Production Rule / Metric*]),
  [Vocabulary Size ($|V|)$], [Fixed lookup table of byte sequences and character clusters.], [tiktoken cl100k_base has 100,277 tokens],
  [Word-to-Token Ratio], [In English, 1,000 words $approx 1,333$ tokens (approx 0.75 words/token).], [Hindi & Indic scripts require 2x–3x more tokens due to complex ligatures],
  [Out-of-Vocabulary (OOV)], [Byte-level fallback ensures ANY Unicode string can be tokenized.], [Zero unencodable characters; handles emoji and binary payloads],
  [Special Tokens], [Control tokens: `<|im_start|>`, `<|endoftext|>`, `[INST]`, `[/INST]`.], [Used to demarcate system prompts, user turns, and tool calls]
)

#v(2pt)
#concept-box(title: "EMBEDDING VECTORS: MAPPING MEANING TO GEOMETRY")[
  Each token ID is mapped to a continuous dense vector in $RR^d$ (e.g. $d = 4096$ in Llama-3 8B). Semantically similar concepts align closely in vector space. King $-$ Man $+$ Woman $approx$ Queen in cosine vector similarity.
]
#v(2pt)

== 16.2 Context Windows & KV-Cache Memory Economics

As context windows expand from 4k tokens (GPT-3) to 128k (GPT-4o) and 2 Million tokens (Gemini 1.5 Pro), self-attention memory scales quadratically: $O(T^2)$.
- *KV-Cache (Key-Value Cache)*: During auto-regressive token generation, previous token keys and values are cached in GPU VRAM to avoid recalculating past context at each step.
- *Memory Consumption Formula*: $"VRAM"_("KV") = 2 times "layers" times "heads" times d_k times "tokens" times "bytes_per_param"$.
- For a 70B parameter model with 128k context in FP16, the KV-Cache alone consumes over *40 GB of VRAM* per concurrent user request! Solutions include *Grouped-Query Attention (GQA)* and *FlashAttention-3*.

#v(2pt)

== 16.3 Decoding & Sampling Hyperparameters

#table(
  columns: (1fr, 1.8fr, 2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Parameter*], [*Mathematical Formula*], [*Behavioral Output Effect*], [*Recommended Setting*]),
  [Temperature ($T$)], [$P(w_i) = e^(z_i / T) / (sum e^(z_j / T))$], [$T arrow 0$ makes outputs deterministic; $T > 1$ increases creative variety.], [Code/Math: $0.0$; Creative: $0.7$],
  [Top-p (Nucleus)], [Smallest set of tokens whose cumulative probability $sum P >= p$.], [Dynamically clips the long tail of unlikely hallucinated tokens.], [Enterprise Standard: $0.90$],
  [Frequency Penalty], [Penalizes tokens based on their existing frequency in output.], [Prevents infinite loops and repetitive corporate buzzwords.], [Range: $0.1 - 0.5$]
)

#v(2.5pt)
== 16.3 The KV Cache Bottleneck in Production Inference

During LLM generation, computing attention sequentially token-by-token is memory-bandwidth bound:
- *Key-Value (KV) Cache*: Caches past Key and Value matrices in GPU VRAM so attention is not recomputed for previous prompt tokens:
  $ "KV Cache Size" = 2 times "Layers" times "Heads" times d_"head" times "SeqLen" times "Batch" times "Bytes" $
- *Architectural Solutions*:
  - *Multi-Query Attention (MQA)*: All query heads share a single key-value head, reducing KV cache by $8 times$.
  - *Grouped-Query Attention (GQA)*: 8 query heads share 1 KV head (Llama-3 standard), balancing inference speed and model reasoning.
  - *PagedAttention (vLLM)*: Eliminates VRAM fragmentation by storing KV cache in non-contiguous virtual memory pages like an OS kernel.
