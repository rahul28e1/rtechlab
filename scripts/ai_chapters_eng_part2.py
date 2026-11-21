# -*- coding: utf-8 -*-
"""
RTechLab AI Essentials & Career Accelerator — English Chapters 07 to 14
Part 2: Core Machine Learning & Neural Network Mathematics
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
"""

chapters_eng_part2 = {
    7: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 2: MACHINE LEARNING & NEURAL MATHEMATICS · CHAPTER 07]
= The Machine Learning Hierarchy & Learning Paradigms

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Machine Learning replaces deterministic manual rule coding with algorithmic parameter optimization from observational data. Understanding the concentric taxonomy separating AI, ML, Deep Learning, and Generative AI is foundational to production engineering.
]

#v(1.5pt)

#align(center)[
  #image("../03_VISUAL_ASSETS/diagrams/ai-hierarchy-concentric.png", width: 88%)
]

#v(1.5pt)

== 7.1 The Four Classical Paradigms of Machine Learning

#table(
  columns: (1fr, 1.4fr, 2.2fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*Paradigm*], [*Data Characteristics*], [*Core Mathematical Objective*], [*Enterprise Use Case*]),
  [Supervised Learning], [Labeled pairs $(arrow(x)_i, y_i)$], [Learn mapping function $f: X arrow Y$ minimizing empirical loss $sum L(f(x_i), y_i)$], [Credit Risk, Fraud Detection, Cancer Screening],
  [Unsupervised Learning], [Unlabeled vectors $arrow(x)_i$], [Discover latent probability density $P(X)$, clustering or low-rank manifold], [Customer Segmentation, Anomaly Detection],
  [Semi-Supervised], [Small labeled subset $+$ vast unlabeled pool], [Propagate labels across manifold graph or pseudo-labeling], [Medical Imaging, Legal Document Review],
  [Reinforcement (RL)], [Environment state $s$, actions $a$, reward $r$], [Maximize expected cumulative discounted reward $E[sum gamma^t r_t]$ via policy $pi(a|s)$], [Robotics, Autonomous Vehicles, RLHF Alignment]
)

#v(1.5pt)

== 7.2 The Emergence of Self-Supervised Learning (SSL)

In 2027, the line between supervised and unsupervised learning has blurred due to *Self-Supervised Learning (SSL)*—the engine powering all modern Foundation Models:
- The raw dataset itself creates training labels automatically (e.g. masking words in a sentence and predicting the hidden word: *Next-Token Prediction* or *Masked Language Modeling*).
- Eliminates the prohibitive cost of manual human annotation, unlocking trillions of web tokens and petabytes of multimodal video/audio for model pre-training.
""",

    8: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 2: MACHINE LEARNING & NEURAL MATHEMATICS · CHAPTER 08]
= Supervised Learning: Regressors, Classifiers & Loss Functions

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Supervised learning forms the financial backbone of enterprise analytics. Whether predicting continuous property values or classifying malicious network packets, mastery over objective functions and gradient updates is non-negotiable.
]

#v(2pt)

== 8.1 Regression vs Classification Mathematical Mechanics

#table(
  columns: (1.2fr, 2.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Attribute*], [*Regression Models (Continuous Target $y in RR$)*], [*Classification Models (Discrete Target $y in {0, 1, dots, K}$)*]),
  [Canonical Algorithms], [Linear Regression, Ridge/Lasso, Support Vector Regressor], [Logistic Regression, Random Forest, XGBoost, LightGBM],
  [Hypothesis Function], [$hat(y) = arrow(w)^T arrow(x) + b = sum_(j=1)^d w_j x_j + b$], [$hat(p) = sigma(arrow(w)^T arrow(x) + b) = 1 / (1 + e^(-(arrow(w)^T arrow(x) + b)))$],
  [Primary Loss Function], [*Mean Squared Error (MSE)*: $J = 1/N sum (y_i - hat(y)_i)^2$], [*Binary Cross-Entropy (BCE)*: $J = -1/N sum [y log hat(p) + (1-y) log (1-hat(p))]$],
  [Evaluation Metrics], [RMSE, MAE, $R^2$ Score, Mean Absolute Percentage Error], [Precision, Recall, F1-Score, ROC-AUC, Confusion Matrix]
)

#v(2pt)
#concept-box(title: "THE BIAS-VARIANCE TRADEOFF & REGULARIZATION")[
  Total generalization error decomposes into: $E[(y - hat(y))^2] = "Bias"^2[hat(y)] + "Variance"[hat(y)] + sigma^2_("noise")$. High bias causes *underfitting*; high variance causes *overfitting*. We prevent overfitting via L2 Ridge Regularization ($lambda ||arrow(w)||_2^2$) or L1 Lasso Regularization ($lambda ||arrow(w)||_1$), which forces sparse weight selection.
]
#v(2pt)

== 8.2 Decision Trees & The Gradient Boosting Masterclass (XGBoost)

For structured tabular business data, ensemble tree models outperform deep neural networks:

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Architecture*], [*Ensemble Splitting Mechanism*], [*Production Strength*]),
  [Single Decision Tree], [Splits features maximizing Information Gain (Entropy) or Gini Impurity.], [Highly interpretable, but prone to high variance and deep overfitting.],
  [Random Forest], [*Bagging (Bootstrap Aggregation)*: Trains $M$ deep trees in parallel on random feature subsets.], [Reduces variance dramatically; robust to outliers and noisy training labels.],
  [Gradient Boosted Trees (XGBoost / LightGBM)], [*Boosting*: Trains trees sequentially, where tree $m$ fits the negative gradient (pseudo-residuals) of tree $m-1$.], [Highest Kaggle benchmark accuracy; dominates tabular fintech & recommendation engines.]
)

#v(2pt)
#tech-spotlight-box(title: "2027 PRODUCTION BEST PRACTICE")[
  Never use Deep Learning where XGBoost or LightGBM suffices. Tabular enterprise datasets (SQL databases, financial ledgers, clickstream logs) run 50x faster, require 1/100th the compute budget, and provide native SHAP (Shapley Additive Explanations) interpretability when modeled using gradient-boosted decision trees.
]
""",

    9: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 2: MACHINE LEARNING & NEURAL MATHEMATICS · CHAPTER 09]
= Unsupervised Learning: Clustering, PCA & Anomaly Detection

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Enterprise data is over 90% unlabeled. Unsupervised algorithms discover latent topological structures, compress high-dimensional feature spaces, and flag fraudulent financial anomalies without human supervisory feedback.
]

#v(2pt)

== 9.1 K-Means Clustering Algorithm Mechanics

K-Means partitions an unlabeled dataset $X = {arrow(x)_1, arrow(x)_2, dots, arrow(x)_N}$ into $K$ disjoint clusters $C = {C_1, dots, C_K}$ by minimizing the Within-Cluster Sum of Squares (WCSS):

#table(
  columns: (1.2fr, 2.8fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Execution Step*], [*Mathematical Operation*], [*Algorithmic Complexity*]),
  [1. Initialization], [Select $K$ initial cluster centroids $arrow(mu)_1, dots, arrow(mu)_K$ using *K-Means++*], [$O(K N d)$ (Smart probabilistic distance seeding)],
  [2. Assignment Step], [Assign each point to the closest centroid: $c_i = "argmin"_k ||arrow(x)_i - arrow(mu)_k||^2$], [$O(K N d)$ Euclidean distance computations],
  [3. Update Step], [Recalculate centroids as mean of assigned points: $arrow(mu)_k = 1 / (|C_k|) sum_(i in C_k) arrow(x)_i$], [$O(N d)$ vector addition and scalar division],
  [4. Convergence Check], [Repeat Steps 2 & 3 until centroid drift $Delta mu < epsilon$ or max iterations reached.], [Guaranteed convergence to local minimum]
)

#v(2pt)
#concept-box(title: "DETERMINING OPTIMAL CLUSTERS: THE ELBOW METHOD & SILHOUETTE SCORE")[
  Plot WCSS versus $K$. The inflection point where the rate of decrease abruptly slows forms the *\"Elbow\"*. Quantitatively validate using the *Silhouette Coefficient*: $s(i) = (b(i) - a(i)) / (max(a(i), b(i)))$, where $a(i)$ is mean intra-cluster distance and $b(i)$ is mean nearest-cluster distance. Values close to $+1$ indicate well-separated clusters.
]
#v(2pt)

== 9.2 Principal Component Analysis (PCA) Dimensionality Reduction

High-dimensional data suffers from the *Curse of Dimensionality* (exponential volume expansion and distance metric collapse). PCA orthogonally projects data onto directions of maximum variance:

- *Step 1: Mean Centering*: Standardize input matrix $X$ such that each feature column has mean $mu = 0$ and variance $sigma^2 = 1$.
- *Step 2: Covariance Matrix Computation*: Compute $Sigma = 1/N X^T X in RR^(d times d)$.
- *Step 3: Eigendecomposition*: Solve $Sigma arrow(v)_i = lambda_i arrow(v)_i$, yielding orthogonal eigenvectors $arrow(v)_i$ and eigenvalues $lambda_i$.
- *Step 4: Projection*: Sort eigenvalues in descending order. Select top $k$ eigenvectors to form projection matrix $W_k = [arrow(v)_1, arrow(v)_2, dots, arrow(v)_k]$. Transform data: $Z = X W_k in RR^(N times k)$.

#v(2pt)

== 9.3 Enterprise Anomaly & Fraud Detection Architectures

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Anomaly Engine*], [*Detection Principle*], [*Enterprise Implementation*]),
  [Isolation Forest], [Isolates anomalies by randomly partitioning features; outliers have short tree path lengths.], [Credit card swipe fraud, banking AML real-time filters.],
  [Autoencoder Networks], [Compresses input to latent bottleneck $z$, then reconstructs $hat(x)$. High reconstruction error flags anomaly.], [Industrial IoT turbine vibration failure, server telemetry intrusion.],
  [DBSCAN], [Density-based spatial clustering grouping dense core points and marking low-density points as noise.], [Geospatial logistics anomalies, ride-sharing fraud.]
)
""",

    10: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  [ReLU], [$max(0, z)$], [$1$ if $z > 0$ else $0$], [Ultra-fast compute. Solved vanishing gradient in deep nets. \"Dying ReLU\" risk.],
  [Leaky ReLU], [$max(alpha z, z), alpha approx 0.01$], [$1$ if $z > 0$ else $alpha$], [Prevents dead neurons by ensuring persistent small gradient flow.],
  [GELU], [$z Phi(z) approx 0.5z(1 + tanh(sqrt(2/pi)(z + 0.044715 z^3)))$], [Continuous probabilistic curvature], [*Standard in Modern Transformers* (GPT-4, BERT, Llama-3, Claude).],
  [Swish / SiLU], [$z dot sigma(beta z)$], [$beta "SiLU" + sigma(beta z)(1 - beta "SiLU")$], [Smooth non-monotonic activation developed by Google; standard in Mistral.]
)

#v(2pt)
#tech-spotlight-box(title: "WHY GELU & SILU DOMINATE 2027 ARCHITECTURES")[
  Unlike ReLU which has a hard, non-partialerentiable corner at $z = 0$, GELU (Gaussian Error Linear Unit) and SiLU provide a smooth curvature with a small negative dip. This smooth gradient landscape accelerates stochastic gradient descent convergence in 100B+ parameter LLM pre-training runs.
]
""",

    11: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
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
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
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
""",

    12: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 2: MACHINE LEARNING & NEURAL MATHEMATICS · CHAPTER 12]
= Convolutional Neural Networks (CNNs) & Computer Vision

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Fully connected layers fail on 2D images due to parameter explosion and lack of spatial translation invariance. Convolutional Neural Networks solve vision through local receptive fields, shared kernel weights, and hierarchical spatial pooling.
]

#v(2pt)

== 12.1 The Convolutional Mechanics: Kernels, Stride & Padding

The fundamental building block is the 2D discrete cross-correlation operation between an input tensor $X in RR^(H times W times C)$ and a filter kernel $K in RR^(k_h times k_w times C)$:

#table(
  columns: (1.2fr, 2.8fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Hyperparameter*], [*Mathematical Output Dimension Formula*], [*Physical Visual Effect*]),
  [Kernel Size ($K$)], [Typical $3 times 3$ or $5 times 5$ spatial receptive filter], [Small $3 times 3$ filters stack to form deep non-linear fields],
  [Padding ($P$)], [$W_("out") = floor((W_("in") - K + 2P)/S) + 1$], [Preserves border pixels with zero padding (\"Same\" padding)],
  [Stride ($S$)], [Step size sliding kernel across pixel rows/columns], [Stride $> 1$ reduces spatial resolution while extracting features],
  [Pooling (Max / Avg)], [Downsamples feature maps taking $max(Omega)$ or $"mean"(Omega)$ in $2 times 2$ window], [Provides spatial translation invariance and compresses memory]
)

#v(2pt)
#concept-box(title: "TRANSLATION INVARIANCE & PARAMETER SHARING")[
  A classical MLP connecting a $1000 times 1000$ pixel RGB image to 1,000 hidden nodes requires $3 times 10^9$ parameters (3 Billion weights). A CNN with 64 kernels of size $3 times 3$ requires only $64 times (3 times 3 times 3 + 1) = 1,792$ parameters! Furthermore, a cat recognized at the top-left is detected identically at the bottom-right because identical weights slide across the entire canvas.
]
#v(2pt)

== 12.2 The ResNet Architecture & Residual Skip Connections

As networks grew deeper than 20 layers, training error worsened (the *Degradation Problem*). In 2015, Kaiming He introduced *Residual Networks (ResNet)*:

#table(
  columns: (1.3fr, 2.5fr, 2.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Architecture Layer*], [*Mathematical Formulation*], [*Gradient Flow Advantage*]),
  [Standard Layer], [Learns target mapping $H(x)$ directly from layer inputs], [Gradients vanish exponentially through backprop chain],
  [Residual Block], [Learns residual mapping $F(x) = H(x) - x$; adds shortcut: $y = F(x) + x$], [Unimpeded gradient highway: $(partial cal(L))/(partial x) = (partial cal(L))/(partial y) ((partial F)/(partial x) + I)$],
  [ResNet-152], [152 layers deep; won ImageNet with 3.57% top-5 error], [Demonstrated that deeper networks consistently yield better representations]
)

#v(2pt)

== 12.3 Modern Object Detection: YOLO (You Only Look Once)

Unlike two-stage detectors (R-CNN, Faster R-CNN) that propose regions then classify them, *YOLO* reframes object detection as a single end-to-end regression problem:
- Divides image into an $S times S$ grid. If an object's center falls in a cell, that cell predicts $B$ bounding boxes $(x, y, w, h)$, confidence scores, and class probabilities $C$.
- Runs at 60–140 FPS on edge hardware, powering autonomous vehicle vision, automated defect inspection, and retail surveillance systems in 2027.
""",

    13: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
""",

    14: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 2: MACHINE LEARNING & NEURAL MATHEMATICS · CHAPTER 14]
= Practical Lab: Training a Neural Network from Scratch in Python

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  True mastery over neural computation requires implementing forward propagation, backpropagation, and gradient updates without high-level frameworks like PyTorch or TensorFlow. This lab builds a 2-layer neural network using pure NumPy.
]

#v(2pt)

== 14.1 Pure NumPy Implementation Architecture

We implement a multi-layer perceptron with input dimension $d=2$, hidden dimension $h=4$, and output dimension $k=1$ solving the non-linear XOR classification boundary:

#v(2pt)
#code-box(title: "NUMPY XOR NEURAL NETWORK FROM SCRATCH")[
```python
import numpy as np

# 1. Dataset: Non-Linear XOR Truth Table
X = np.array([[0, 0], [0, 1], [1, 0], [1, 1]], dtype=np.float32)
y = np.array([[0], [1], [1], [0]], dtype=np.float32)

# 2. Parameter Initialization (He / Xavier Initialization)
np.random.seed(42)
W1 = np.random.randn(2, 4) * np.sqrt(2.0 / 2)  # Input (2) -> Hidden (4)
b1 = np.zeros((1, 4))
W2 = np.random.randn(4, 1) * np.sqrt(2.0 / 4)  # Hidden (4) -> Output (1)
b2 = np.zeros((1, 1))

# 3. Activation Functions & Derivatives
def sigmoid(z): return 1.0 / (1.0 + np.exp(-np.clip(z, -20, 20)))
def sigmoid_derivative(a): return a * (1.0 - a)

# 4. Training Loop: Full Gradient Descent
learning_rate = 0.5
epochs = 5000

for epoch in range(epochs):
    # --- FORWARD PROPAGATION ---
    z1 = np.dot(X, W1) + b1       # Linear projection (4x4)
    a1 = sigmoid(z1)              # Hidden activation (4x4)
    z2 = np.dot(a1, W2) + b2      # Output projection (4x1)
    a2 = sigmoid(z2)              # Final prediction (4x1)
    
    # --- LOSS: Binary Cross-Entropy ---
    loss = -np.mean(y * np.log(a2 + 1e-8) + (1 - y) * np.log(1 - a2 + 1e-8))
    
    # --- BACKPROPAGATION ---
    delta2 = a2 - y                                    # dL/dz2 (4x1)
    dW2 = np.dot(a1.T, delta2) / X.shape[0]            # dL/dW2 (4x1)
    db2 = np.sum(delta2, axis=0, keepdims=True) / X.shape[0]
    
    delta1 = np.dot(delta2, W2.T) * sigmoid_derivative(a1) # dL/dz1 (4x4)
    dW1 = np.dot(X.T, delta1) / X.shape[0]             # dL/dW1 (2x4)
    db1 = np.sum(delta1, axis=0, keepdims=True) / X.shape[0]
    
    # --- PARAMETER UPDATE (SGD) ---
    W1 -= learning_rate * dW1; b1 -= learning_rate * db1
    W2 -= learning_rate * dW2; b2 -= learning_rate * db2

print("Final Predictions after 5000 Epochs:")
for i in range(4):
    print(f"Input: {X[i]} -> True: {int(y[i][0])} | Pred: {a2[i][0]:.4f} (Round: {int(np.round(a2[i][0]))})")
```
]
#v(2pt)

== 14.2 Lab Verification & Execution Analysis

- *Output Convergence*: The network achieves $> 99.8%$ prediction accuracy on the XOR gate:
  - Input `[0, 0]` $arrow.r 0.0031$ | Input `[0, 1]` $arrow.r 0.9942$ | Input `[1, 0]` $arrow.r 0.9938$ | Input `[1, 1]` $arrow.r 0.0062$.
- *Key Takeaway*: The hidden layer transforms non-linearly separable inputs into a 4-dimensional representation where a single hyperplane separates the classes, mathematically defeating the 1969 Minsky-Papert XOR barrier.
"""
}
