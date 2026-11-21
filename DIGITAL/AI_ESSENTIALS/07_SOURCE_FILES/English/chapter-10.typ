#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 2: MACHINE LEARNING & NEURAL MATHEMATICS · CHAPTER 10]
= Biological to Artificial Neurons: Activation Function Mechanics

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Artificial Neural Networks (ANNs) were inspired by biological neuroanatomy. By translating dendrites, synapses, and action potentials into linear algebra and non-linear activation functions, deep networks acquire universal function approximation power.
]

#v(2pt)

== 10.1 The Biological vs Artificial Neuron Mapping

#table(
  columns: (1.2fr, 2.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Biological Subsystem*], [*Artificial Neural Component*], [*Mathematical Function & Operation*]),
  [Dendrites], [Input Feature Vector ($arrow(x)$)], [Receives signals $x_1, x_2, dots, x_d$ from upstream nodes],
  [Synapse], [Synaptic Weight Matrix ($W$)], [Multiplies incoming signal by connection strength: $w_i x_i$],
  [Cell Body (Soma)], [Summing Junction $+$ Bias ($b$)], [Computes affine combination: $z = sum w_i x_i + b = W x + b$],
  [Action Potential], [Non-linear Activation Function ($sigma(z)$)], [Applies non-linear threshold to produce firing rate: $a = sigma(z)$],
  [Axon], [Output Activation Signal ($a$)], [Transmits output vector to downstream layers or loss function]
)

#v(2pt)
#concept-box(title: "THE UNIVERSAL APPROXIMATION THEOREM (CYBENKO 1989 & HORNIK 1991)")[
  A feedforward neural network with a single hidden layer containing a finite number of non-linear neurons can approximate any continuous function on compact subsets of $RR^n$ to arbitrary precision. *Crucial Corollary*: Without non-linear activation functions, a 1,000-layer neural network collapses into a single trivial linear transformation: $W_3(W_2(W_1 x)) = (W_3 W_2 W_1) x = W_("eff") x$.
]
#v(2pt)

== 10.2 Activation Functions: The Comprehensive Mathematical Specimen

#table(
  columns: (1fr, 1.6fr, 1.8fr, 1.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Function*], [*Mathematical Formula*], [*Gradient Derivative $sigma'(z)$*], [*Production Evaluation*]),
  [Sigmoid], [$sigma(z) = 1 / (1 + e^(-z))$], [$sigma(z)(1 - sigma(z))$], [Output in $(0, 1)$. Vanishing gradient for $|z| > 4$. Not zero-centered.],
  [Tanh], [$(e^z - e^(-z)) / (e^z + e^(-z))$], [$1 - tanh^2(z)$], [Zero-centered in $(-1, 1)$. Stronger gradients than Sigmoid; still saturates.],
  [ReLU], [$max(0, z)$], [$1$ if $z > 0$ else $0$], [Ultra-fast compute. Solved vanishing gradient in deep nets. "Dying ReLU" risk.],
  [Leaky ReLU], [$max(alpha z, z), alpha approx 0.01$], [$1$ if $z > 0$ else $alpha$], [Prevents dead neurons by ensuring persistent small gradient flow.],
  [GELU], [$z Phi(z) approx 0.5z(1 + tanh(sqrt(2/pi)(z + 0.044715 z^3)))$], [Continuous probabilistic curvature], [*Standard in Modern Transformers* (GPT-4, BERT, Llama-3, Claude).],
  [Swish / SiLU], [$z dot sigma(beta z)$], [$beta "SiLU" + sigma(beta z)(1 - beta "SiLU")$], [Smooth non-monotonic activation developed by Google; standard in Mistral.]
)

#v(2pt)
#tech-spotlight-box(title: "WHY GELU & SILU DOMINATE 2027 ARCHITECTURES")[
  Unlike ReLU which has a hard, non-partialerentiable corner at $z = 0$, GELU (Gaussian Error Linear Unit) and SiLU provide a smooth curvature with a small negative dip. This smooth gradient landscape accelerates stochastic gradient descent convergence in 100B+ parameter LLM pre-training runs.
]

#v(2.5pt)
== 10.3 The Exploration vs Exploitation Dilemma in Production

In production recommendation engines and adaptive agents, systems must balance exploitation with discovery:
- *Multi-Armed Bandits (MAB)*: Optimizes click-through rate by dynamically balancing high-performing arms with unexplored options using Upper Confidence Bound ($"UCB" = mu_i + c sqrt(ln(t) / n_i)$).
- *Contextual Bandits in LLM Alignment*: Used in production recommendation engines (e.g. Netflix, YouTube) and personalized prompt routers to maximize long-term user retention without collapsing into degenerate local optima.
