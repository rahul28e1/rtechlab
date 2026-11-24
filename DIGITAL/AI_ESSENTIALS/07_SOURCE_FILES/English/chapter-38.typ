#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 6: TOP 50 MNC INTERVIEW VAULT & ETHICS · CHAPTER 38]
= Top 50 MNC AI Interview Vault: Transformers & Deep Learning (Q14–Q26)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Rigorous technical questions probing deep neural network architectures, attention mechanisms, and modern foundation model designs.
]

#v(2pt)

#table(
  columns: (0.6fr, 2.4fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*No.*], [*Technical Interview Question*], [*Definitive Production Engineering Answer*]),
  [Q14], [Explain the Self-Attention mechanism in one sentence.], [Calculates dynamic compatibility weights between all token pairs in a sequence via $"softmax"((Q K^T) / sqrt(d_k)) V$, enabling tokens to attend to relevant context regardless of distance.],
  [Q15], [Why do Transformers scale better than LSTMs on GPUs?], [LSTMs require sequential token processing where step $t$ depends on step $t-1$. Transformers process all tokens in parallel via matrix multiplications, saturating modern GPU Tensor Cores.],
  [Q16], [What are Query, Key, and Value matrices conceptually?], [Query ($Q$) represents what a token is asking for; Key ($K$) represents what a token contains; Value ($V$) represents the actual semantic information transferred when Query and Key match.],
  [Q17], [What is Multi-Head Attention and why is it useful?], [Projects $Q, K, V$ into $h$ distinct subspaces, allowing the model to simultaneously attend to syntax, semantics, and long-range coreference dependencies in parallel.],
  [Q18], [Why are Positional Encodings necessary in Transformers?], [Self-attention is permutation-invariant—shuffling tokens produces identical attention weights. Positional encodings (sinusoidal or RoPE) inject sequential order into token vectors.],
  [Q19], [What is Rotary Position Embedding (RoPE)?], [Encodes position by rotating Query and Key vectors in the complex plane; dot product $q_m^T k_n$ depends purely on relative distance $(m-n)$, enabling superior context length extrapolation.],
  [Q20], [Explain the difference between Pre-LN and Post-LN Transformers.], [Post-LN applies normalization after the residual addition; prone to gradient instability in deep nets. Pre-LN applies normalization on the residual branch before attention, stabilizing training at scale.],
  [Q21], [What is Grouped-Query Attention (GQA)?], [Shares a single Key and Value head across multiple Query heads (e.g. 8 Query heads per 1 KV head in Llama-3), slashing KV-Cache memory consumption by 87% with negligible accuracy loss.],
  [Q22], [Explain the vanishing gradient fix in ResNets.], [Residual shortcut connections ($y = F(x) + x$) allow gradients to flow directly backward via the identity branch: $(partial cal(L))/(partial x) = (partial cal(L))/(partial y)((partial F)/(partial x) + I)$, preventing decay.],
  [Q23], [How does Dropout work during training vs inference?], [During training, randomly sets activations to 0 with probability $p$ and scales remaining by $1/(1-p)$. During inference, dropout is disabled entirely, preserving deterministic evaluation.],
  [Q24], [What is the difference between Encoder-Only, Decoder-Only, and Encoder-Decoder?], [Encoder-only (BERT) uses bidirectional attention for understanding. Decoder-only (GPT) uses causal masked attention for autoregressive generation. Encoder-decoder (T5) handles seq2seq translation.],
  [Q25], [What is FlashAttention and why is it fast?], [Restructures attention computation into tiled SRAM blocks using online softmax, avoiding slow high-bandwidth GPU HBM memory reads/writes. Yields 2x–4x speedup with exact mathematical parity.],
  [Q26], [Why does Temperature affect LLM generation?], [Divides logits by $T$ before softmax ($z_i/T$). When $T < 1$, highest probability tokens are amplified (deterministic); when $T > 1$, probability distribution flattens, increasing randomness.]
)
