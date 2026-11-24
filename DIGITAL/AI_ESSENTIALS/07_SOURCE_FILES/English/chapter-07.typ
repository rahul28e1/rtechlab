#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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

#v(2.5pt)
== 7.3 The Manifold Hypothesis & Representation Learning

Why can high-dimensional data (e.g. $1024 times 1024$ images living in a 3,000,000-dimensional vector space) be classified by neural networks?
- *The Manifold Hypothesis*: Real-world data (such as human faces or natural language) does not fill the high-dimensional ambient space uniformly; it concentrates on a much lower-dimensional, non-linear embedded manifold.
- *Deep Feature Extraction*: Successive layers of a Deep Neural Network unravel and flatten this tangled manifold, turning complex curved decision surfaces into simple planar separations in the final classification layer.
