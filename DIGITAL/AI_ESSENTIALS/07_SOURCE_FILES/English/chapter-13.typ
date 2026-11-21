#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 2: MACHINE LEARNING & NEURAL MATHEMATICS · CHAPTER 13]
= Sequence Modeling: From RNNs to LSTMs & GRUs

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Text, audio, and financial time-series exhibit temporal sequential dependencies. While classical Recurrent Neural Networks (RNNs) struggled with vanishing gradients over long horizons, gated architectures (LSTM & GRU) preserved long-term memory.
]

#v(2pt)

== 13.1 Recurrent Neural Networks (RNN) & The Hidden State

An RNN processes sequences $x_1, x_2, dots, x_T$ step-by-step, maintaining an internal recurrent hidden state vector $h_t$ that carries temporal context:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Computation Step*], [*Mathematical Formula*], [*Temporal Engineering Scope*]),
  [Hidden State Update], [$h_t = tanh(W_(h h) h_(t-1) + W_(x h) x_t + b_h)$], [Integrates current input $x_t$ with previous memory $h_(t-1)$],
  [Output Generation], [$y_t = "softmax"(W_(h y) h_t + b_y)$], [Generates token probability distribution at step $t$],
  [BPTT], [Backpropagation Through Time unrolls network across $T$ steps], [Computes gradients across temporal chain: $product_(k=j+1)^t (partial h_k)/(partial h_(k-1))$]
)

#v(2pt)
#warning-box(title: "THE FATAL MATHEMATICAL FLAW OF VANISHING / EXPLODING GRADIENTS")[
  During BPTT, the gradient term contains the matrix product $product (W_(h h)^T)$. If the largest eigenvalue of $W_(h h)$ is $< 1$, the gradient decays exponentially to zero ($0.9^(50) approx 0.0051$), causing the network to forget early context. If $> 1$, gradients explode to infinity, causing numerical `NaN` overflow.
]
#v(2pt)

== 13.2 Long Short-Term Memory (LSTM) Architecture (Hochreiter & Schmidhuber 1997)

LSTMs solve vanishing gradients by introducing a dedicated *Cell State ($C_t$)* that acts as an error carousel highway regulated by three multiplicative gates:

#table(
  columns: (1fr, 1.8fr, 1.8fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Gate Subsystem*], [*Mathematical Equation*], [*Operational Responsibility*], [*Gating Action*]),
  [Forget Gate ($f_t$)], [$f_t = sigma(W_f [h_(t-1), x_t] + b_f)$], [Decides what information to discard from cell state], [$0 = "wipe memory"$, $1 = "retain"$],
  [Input Gate ($i_t$)], [$i_t = sigma(W_i [h_(t-1), x_t] + b_i)$], [Decides which candidate values to store in cell], [Regulates update volume],
  [Candidate Cell ($tilde(C)_t$)], [$tilde(C)_t = tanh(W_c [h_(t-1), x_t] + b_c)$], [Generates new candidate memory vector], [Creates update values],
  [Cell State Update], [$C_t = f_t times C_(t-1) + i_t times tilde(C)_t$], [Linear addition preserves gradient flow without decay], [*Core memory highway*],
  [Output Gate ($o_t$)], [$o_t = sigma(W_o [h_(t-1), x_t] + b_o)$], [Decides what parts of cell state to emit into hidden state], [Filters active context],
  [Hidden State ($h_t$)], [$h_t = o_t times tanh(C_t)$], [Final output vector passed to next layer and time step], [Emits current prediction]
)

#v(2pt)

== 13.3 The Bottleneck: Why Transformers Replaced LSTMs

Despite their brilliance, LSTMs possessed a fundamental hardware scaling bottleneck:
- *Sequential Dependence*: Step $t$ cannot be computed until step $t-1$ finishes. This sequential constraint prevented full parallelization on massively parallel GPUs.
- *Context Limit*: Even with gating, LSTMs degrade on sequences longer than 500–1,000 tokens. This paved the way for the 2017 Transformer revolution.

#v(2.5pt)
== 13.3 Attention Mechanism: Why Recurrence Was Replaced

While LSTMs and GRUs conquered vanishing gradients via gating mechanisms, their fundamental architectural flaw was *sequential recurrence*: token $t$ cannot be computed until token $t-1$ finishes. This prevented horizontal GPU scaling and created an information bottleneck over long sequence horizons ($> 1,000$ tokens), paving the way for the Transformer revolution.

#v(2pt)
== 13.4 Teacher Forcing & Scheduled Sampling

During sequence training, feeding ground-truth tokens $y_(t-1)^*$ instead of predicted tokens $hat(y)_(t-1)$ accelerates convergence (Teacher Forcing). However, this creates **Exposure Bias**—during inference, the model encounters its own mistakes for the first time. Modern models mitigate this via scheduled sampling, progressively decaying ground-truth probability as training epochs advance.
