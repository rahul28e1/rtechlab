#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 2: MACHINE LEARNING & NEURAL MATHEMATICS · CHAPTER 11]
= Deep Neural Networks: Backpropagation & Optimization

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Training billion-parameter networks hinges on two core engines: the efficient computation of partial derivatives via the Calculus Chain Rule (*Backpropagation*) and adaptive parameter updates (*Stochastic Gradient Descent*).
]

#v(2pt)

== 11.1 The Backpropagation Algorithm & The Chain Rule

Consider an $L$-layer neural network with activations $a^l = sigma(z^l)$ where $z^l = W^l a^(l-1) + b^l$. For a scalar loss $cal(L)$, backpropagation computes the gradient of loss with respect to every weight $W_(j k)^l$ in $O("Operations")$ time:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Backprop Stage*], [*Mathematical Formula*], [*Operational Meaning*]),
  [1. Output Error ($delta^L$)], [$delta^L = nabla_a cal(L) times sigma'(z^L)$], [Sensitivity of loss to output pre-activation vector $z^L$],
  [2. Backward Error Flow], [$delta^l = ((W^(l+1))^T delta^(l+1)) times sigma'(z^l)$], [Transmits error backward through transpose of weight matrix],
  [3. Weight Gradient], [$(partial cal(L)) / (partial W^l) = delta^l (a^(l-1))^T$], [Outer product of layer error and upstream layer activation],
  [4. Bias Gradient], [$(partial cal(L)) / (partial b^l) = delta^l$], [Error vector directly matches parameter sensitivity]
)

#v(2pt)
#concept-box(title: "COMPUTATIONAL EFFICIENCY OF BACKPROPAGATION")[
  Naive numerical partialerentiation requires $2P$ forward passes for $P$ parameters ($O(P^2)$ complexity). Backpropagation uses reverse-mode automatic partialerentiation, computing ALL gradients in exactly *one single backward pass* ($O(P)$ complexity). Without this, training modern 70B parameter models would be computationally impossible.
]
#v(2pt)

== 11.2 Modern Optimizers: From SGD to AdamW

#table(
  columns: (1fr, 1.8fr, 1.8fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Optimizer*], [*Mathematical Update Equation*], [*Key Innovation*], [*Production Role*]),
  [Vanilla SGD], [$theta_(t+1) = theta_t - eta g_t$], [Updates along steepest negative gradient], [Prone to oscillations in ravines],
  [SGD $+$ Momentum], [$v_t = beta v_(t-1) + eta g_t$; $theta_(t+1) = theta_t - v_t$], [Accumulates historical velocity to bypass saddles], [Standard baseline for ResNet computer vision],
  [RMSprop], [$s_t = beta s_(t-1) + (1-beta) g_t^2$; $theta_(t+1) = theta_t - eta / (sqrt(s_t) + epsilon) g_t$], [Divides learning rate by root mean square of gradients], [RNNs and non-stationary reinforcement learning],
  [Adam (Kingma & Ba)], [Combines Momentum ($m_t$) and RMSprop ($v_t$) with bias correction], [Adaptive per-parameter learning rates], [Default optimizer across all machine learning],
  [*AdamW (Loshchilov)*], [$theta_(t+1) = theta_t - eta lambda theta_t - eta / (sqrt(hat(v)_t) + epsilon) hat(m)_t$], [*Decoupled Weight Decay* from gradient scale], [*The Enterprise Standard for LLM Training* (GPT-4, Llama-3)]
)

#v(2pt)

== 11.3 Learning Rate Schedules & Warmup Dynamics

Setting a constant learning rate $eta$ leads to divergence or stalled training. Production 2027 training pipelines universally implement *Cosine Annealing with Linear Warmup*:
- *Warmup Phase (First 1%–5% of tokens)*: Linearly ramp $eta$ from $0$ to $eta_("max")$ to stabilize noisy early gradients.
- *Cosine Decay Phase (Remaining 95%)*: Smoothly decay $eta$ according to $eta_t = eta_("min") + 0.5(eta_("max") - eta_("min"))(1 + cos((pi t)/T))$.

#v(2.5pt)
== 11.4 Vanishing Gradients & Modern Normalization Layers

During backpropagation through deep networks ($L > 20$), gradient signals shrink exponentially:
$ (partial L) / (partial W_1) = (partial L) / (partial a_L) product_(l=2)^L (partial a_l) / (partial a_(l-1)) dot (partial a_1) / (partial W_1) $
If derivative values $|sigma'(z)| < 0.25$ (as with Sigmoid), gradients vanish to zero. Modern architectures overcome this via:
- *Layer Normalization (LayerNorm)*: Normalizes activations across the channel dimension for each independent sequence token.
- *RMSNorm (Root Mean Square Norm)*: Omits mean-centering computation ($"RMS"(x) = sqrt(1/d sum x_i^2)$), boosting transformer throughput by $7\%$ with zero accuracy loss (used in Llama-3 and Mistral).
