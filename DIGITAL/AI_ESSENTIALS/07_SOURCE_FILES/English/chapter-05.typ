#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 05]
= The AI Evolution Timeline & Scaling Laws (1950–2027)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  AI progress has shifted from sporadic theoretical breakthroughs to predictable physical scaling laws. Tracking the 75-year timeline from Turing to 2027 Foundation Models reveals the exponential economics governing modern artificial intelligence.
]

#v(2pt)

== 5.1 The 75-Year Master AI Evolution Matrix

#table(
  columns: (0.8fr, 1.5fr, 1.4fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*Era*], [*Paradigm*], [*Flagship Milestone*], [*Core Technical Mechanism*]),
  [1950], [Turing Test], [Mind Paper], [Operational imitation test bypassing consciousness debate.],
  [1956], [Symbolic AI], [Dartmouth Conference], [Birth of AI term; Logic Theorist proving mathematical theorems.],
  [1957], [Perceptron], [Mark I Perceptron], [Single-layer neural network; linear decision boundary.],
  [1969], [First AI Winter], [Minsky & Papert Proof], [Mathematical proof of XOR limitation; collapse of funding.],
  [1980], [Expert Systems], [MYCIN & DEC XCON], [Rule-based IF-THEN knowledge engineering; LISP hardware.],
  [1986], [Connectionism], [Rumelhart Backprop], [Backpropagation algorithm popularized for multi-layer MLPs.],
  [1987], [Second AI Winter], [LISP Market Collapse], [Brittle rule maintenance; Sun & Intel PCs outperform LISP chips.],
  [1997], [Heuristic Search], [IBM Deep Blue], [Parallel VLSI search engines evaluating 200M chess moves/sec.],
  [2012], [Deep Learning], [AlexNet on GPUs], [Convolutional networks trained on CUDA GPUs; ImageNet solved.],
  [2016], [Reinforcement Learning], [DeepMind AlphaGo], [Monte Carlo Tree Search + Deep Neural Policy Networks.],
  [2017], [Transformers], [Attention Is All You Need], [Vaswani et al.: Self-attention replaces recurrence entirely.],
  [2020], [Scaling Laws], [GPT-3 (175B)], [Brown et al.: Emergent few-shot in-context learning through scale.],
  [2022], [Generative AI], [ChatGPT & Diffusion], [RLHF alignment + Web-scale pre-training; mass adoption.],
  [2024], [Multimodal & Reasoning], [GPT-4o & OpenAI o1], [End-to-end multimodal audio/vision + Test-Time Compute (MCTS).],
  [2027], [Agentic AI & Indic], [Sovereign LLMs / AGI], [Autonomous goal-directed agent swarms, ₹10k Cr IndiaAI Mission.]
)

#v(2pt)

== 5.2 Moore's Law vs Huang's Law & Compute Economics

While classical Moore's Law (CPU transistor doubling every 24 months) has hit quantum tunneling physical limits, GPU compute has expanded exponentially under *Huang's Law* (named after NVIDIA CEO Jensen Huang):

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Metric*], [*Classical CPU Scaling (Moore)*], [*Modern GPU Scaling (Huang)*]),
  [Scaling Rate], [2x compute performance every 24 months], [*Over 1,000x compute performance in 8 years* (2016-2024)],
  [Primary Driver], [Lithography gate shrinking (FinFET/GAA)], [Architecture + FP8/FP4 Tensor Cores + NVLink interconnect],
  [Cost per GFLOP], [Flattens due to EUV wafer fabrication cost], [Plummets from \$10.00 (2010) to less than \$0.0001 (2027)],
  [Energy Factor], [Thermal Design Power (TDP) limit reached], [High-Bandwidth Memory (HBM3e) & liquid cooling deployment]
)

#v(2pt)
#concept-box(title: "THE CHINCHILLA SCALING LAW (HOFFMANN ET AL., DEEPMIND 2022)")[
  For compute-optimal LLM training, model parameters ($N$) and training tokens ($D$) should scale in equal proportion: $D approx 20 times N$. Training a 70B parameter model requires at least 1.4 Trillion tokens. Compute budget $C approx 6 N D$ FLOPs.
]
