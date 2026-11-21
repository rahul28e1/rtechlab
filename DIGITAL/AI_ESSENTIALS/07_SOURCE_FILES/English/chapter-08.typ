#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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

#v(2.5pt)
== 8.4 Bias-Variance Tradeoff & Regularization Mathematics

Every supervised learning model faces the fundamental generalization dilemma:
$ "Expected Error" = "Bias"^2 + "Variance" + "Irreducible Noise" sigma^2 $

#table(
  columns: (1.2fr, 1.8fr, 1.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Technique*], [*Penalty Formulation*], [*Geometric Behavior*], [*Best Used When*]),
  [L1 (Lasso)], [$lambda sum |w_i|$], [Diamond corner solutions; drives weights to exact 0.], [Feature selection / sparse data.],
  [L2 (Ridge)], [$lambda sum w_i^2$], [Spherical constraint; shrinks weights smoothly.], [Multicollinear features present.],
  [ElasticNet], [$alpha L_1 + (1-alpha) L_2$], [Combines sparsity with group selection.], [High-dimensional correlated features.],
  [Dropout], [Random zeroing with probability $p$], [Breaks co-adaptation between neurons.], [Deep Neural Networks / CNNs.]
)

#v(2pt)
#concept-box(title: "INTERVIEW VIVA: REGULARIZATION IN LARGE LANGUAGE MODELS")[
  *Question*: How is L2 regularization applied in modern LLM fine-tuning?\
  *Answer*: In PyTorch AdamW optimizers, weight decay ($lambda = 0.01$) is decoupled from gradient moving averages, preventing transformer attention weights from exploding and drifting from foundational pre-trained weights.
]
