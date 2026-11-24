#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 3: TRANSFORMERS & GENERATIVE AI · CHAPTER 15]
= The 2017 Transformer Revolution & Self-Attention Mechanics

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  In June 2017, Ashish Vaswani and seven Google Brain researchers published *"Attention Is All You Need"*. By discarding recurrent and convolutional bottlenecks in favor of Scaled Dot-Product Self-Attention, they established the dominant architecture of modern artificial intelligence.
]

#v(1.5pt)

#align(center)[
  #image("../03_VISUAL_ASSETS/diagrams/transformer-attention-architecture.png", width: 88%)
]

#v(1.5pt)

== 15.1 Scaled Dot-Product Attention: The Core Equation

Self-attention computes dynamic affinity weights between all tokens in a sequence simultaneously:

#table(
  columns: (1.2fr, 2.8fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Matrix / Vector*], [*Mathematical Projection*], [*Intuitive Conceptual Scope*]),
  [Query Matrix ($Q$)], [$Q = X W^Q in RR^(T times d_k)$], ["What information is this token searching for?"],
  [Key Matrix ($K$)], [$K = X W^K in RR^(T times d_k)$], ["What information does this token contain?"],
  [Value Matrix ($V$)], [$V = X W^V in RR^(T times d_v)$], ["What actual contextual content does this token provide?"],
  [*Attention Equation*], [$"Attention"(Q, K, V) = "softmax"((Q K^T) / sqrt(d_k)) V$], [*Computes normalized compatibility scores weighted over $V$*]
)

#v(1.5pt)
#concept-box(title: "WHY SCALE BY $sqrt(d_k)$?")[
  For large projection dimensions $d_k$, the dot products $Q K^T$ grow large in magnitude, pushing the Softmax function into regions with near-zero gradients (vanishing gradient). Scaling by $1 / sqrt(d_k)$ normalizes the variance back to 1.0, preserving healthy gradient flow.
]
#v(1.5pt)

== 15.2 Multi-Head Attention (MHA) & Positional Encodings

Instead of performing single attention, Multi-Head Attention projects queries, keys, and values $h$ times with partialerent learned linear projections:
$ "MultiHead"(Q, K, V) = "Concat"("head"_1, dots, "head"_h) W^O quad "where" quad "head"_i = "Attention"(Q W_i^Q, K W_i^K, V W_i^V) $
Because self-attention contains no inherent sequence order, positional information is injected via *Sinusoidal Positional Encoding* or modern *Rotary Position Embeddings (RoPE)*: $P E_((p o s, 2i)) = sin(p o s / 10000^(2i/d)), quad P E_((p o s, 2i+1)) = cos(p o s / 10000^(2i/d))$.

#v(2pt)
#tech-spotlight-box(title: "WHY ROTARY POSITIONAL EMBEDDING (ROPE) REPLACED ABSOLUTE EMBEDDINGS")[
  Classic Transformers added static positional vectors $P_i$ to token vectors $E_i$. RoPE rotates query and key vectors in complex 2D planes ($q_m^T k_n = f(q, k, m-n)$), allowing models like Llama-3 to effortlessly extrapolate context lengths from 8k to 128k tokens with zero retraining!
]
