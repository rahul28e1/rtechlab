#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 3: TRANSFORMERS & GENERATIVE AI · CHAPTER 17]
= LLM Training Lifecycle: Pre-Training to Alignment (RLHF & DPO)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  A raw pre-trained foundation model is merely a statistical next-token auto-completer. Transforming it into a helpful, honest, and harmless enterprise assistant requires a rigorous multi-stage post-training alignment pipeline.
]

#v(2pt)

== 17.1 The Three-Stage Production Training Pipeline

#table(
  columns: (1fr, 1.7fr, 2fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Training Stage*], [*Data Volume & Compute*], [*Mathematical Objective*], [*Primary Output Model*]),
  [1. Pre-Training], [10–20 Trillion tokens; 10,000+ H100 GPUs for months (\$50M+).], [Next-token cross-entropy loss: $cal(L) = - sum log P(w_t | w_(<t))$], [Base Foundation Model (e.g. Llama-3-Base)],
  [2. Supervised Fine-Tuning (SFT)], [50,000–500,000 curated high-quality (Prompt, Response) pairs.], [Teaches conversational turn format, instruction following, and tool calling syntax.], [Instruction-Tuned Model (e.g. Llama-3-Instruct)],
  [3. Preference Alignment], [Pairs of model responses $(y_w, y_l)$ ranked by human or AI judges.], [Aligns model outputs with human safety guidelines, tone, and correctness.], [Production Frontier Model (ChatGPT / Claude)]
)

#v(2pt)
#concept-box(title: "RLHF VS DIRECT PREFERENCE OPTIMIZATION (DPO 2023)")[
  - *RLHF (PPO)*: Trains a separate Reward Model $R(x, y)$ on human preferences, then optimizes the policy model using Proximal Policy Optimization with a KL-divergence penalty to prevent policy drift. Highly unstable and compute-heavy.
  - *DPO (Rafailov et al., Stanford)*: Derives a closed-form substitution that optimizes the policy directly on preference pairs $(y_w, y_l)$ without training a separate reward model: $cal(L)_("DPO") = - E [log sigma(beta log (pi_theta(y_w|x) / pi_("ref")(y_w|x)) - beta log (pi_theta(y_l|x) / pi_("ref")(y_l|x)))]$. Stable, elegant, and standard in 2027.
]
#v(2pt)

== 17.2 Parameter-Efficient Fine-Tuning: LoRA & QLoRA

Full-parameter fine-tuning of a 70B model requires updating 140 GB of weights plus 400+ GB of optimizer states. *LoRA (Low-Rank Adaptation)* freezes base weights $W_0$ and decomposes updates into two low-rank matrices:
$ W = W_0 + Delta W = W_0 + B times A, quad "where" quad B in RR^(d times r), A in RR^(r times k), quad r << d $

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Fine-Tuning Method*], [*Trainable Parameter Footprint*], [*Hardware Requirement*]),
  [Full Parameter Tuning], [100% of weights (70 Billion parameters).], [8x NVIDIA H100 80GB GPUs (\$250,000 cluster)],
  [LoRA ($r=16$)], [0.05% of weights (35 Million parameters).], [2x NVIDIA A100 80GB GPUs],
  [QLoRA (Dettmers et al.)], [Quantizes base model to 4-bit NormalFloat (NF4); trains 16-bit LoRA adapters.], [*Single consumer RTX 4090 24GB GPU (\$1,600)*]
)

#v(2.5pt)
== 17.3 Direct Preference Optimization (DPO) vs PPO

Aligning models with human preferences historically required Proximal Policy Optimization (PPO), which needed 4 separate models loaded simultaneously in GPU memory (Policy, Reference, Reward, Value).

#table(
  columns: (1.2fr, 2.2fr, 2fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Metric*], [*PPO (Reinforcement Learning)*], [*DPO (Direct Optimization)*], [*Enterprise Choice*]),
  [Reward Model], [Requires training standalone reward network.], [Implicitly formulated inside policy loss.], [DPO (Simpler)],
  [GPU VRAM], [High (requires 4 concurrent model copies).], [Low (only policy + frozen reference).], [DPO saves 60% VRAM],
  [Training Stability], [Hyperparameter sensitive, prone to collapse.], [Extremely stable supervised cross-entropy.], [DPO (Zero RL instability)],
  [Production Adoption], [Used in original GPT-4 pre-training.], [Standard for Llama-3, Mistral, Zephyr.], [DPO Enterprise Standard]
)

#v(2pt)
#concept-box(title: "INTERVIEW TIP: HOW DPO DERIVES REWARDS WITHOUT A REWARD MODEL")[
  DPO reparameterizes the Bradley-Terry preference model by showing that the optimal policy $pi_theta$ directly implies the underlying reward function: $r(x, y) = beta log (pi_theta (y|x) / pi_"ref" (y|x))$.
]

#v(2pt)
== 17.4 Model Merging: SLERP, TIES & DARE

Modern open-source engineering combines multiple fine-tuned models without additional GPU training:
- **SLERP (Spherical Linear Interpolation)**: Interpolates weights along a high-dimensional spherical hypersphere, preserving directional nuances better than naive linear averaging.
- **DARE (Drop And REscale)**: Randomly drops up to 90% of fine-tuned delta weights and rescales the remaining 10%, eliminating parameter interference when merging specialized domain LLMs.
