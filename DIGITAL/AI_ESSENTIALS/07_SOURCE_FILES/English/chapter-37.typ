#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 6: TOP 50 MNC INTERVIEW VAULT & ETHICS · CHAPTER 37]
= Top 50 MNC AI Interview Vault: Core ML & Mathematics (Q01–Q13)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Technical screening questions asked by tier-1 MNCs (Google, Microsoft, Amazon, Meta, NVIDIA) to evaluate fundamental machine learning competence.
]

#v(2pt)

#table(
  columns: (0.6fr, 2.4fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*No.*], [*Technical Interview Question*], [*Definitive Production Engineering Answer*]),
  [Q01], [Explain the Bias-Variance tradeoff mathematically.], [Error decomposes into $"Bias"^2 + "Variance" + sigma^2$. High bias causes underfitting (oversimplified model); high variance causes overfitting (sensitive to noise). Balanced via regularization and cross-validation.],
  [Q02], [What is the difference between L1 (Lasso) and L2 (Ridge) regularization?], [L1 adds $lambda sum |w_i|$ penalty producing sparse weights with automatic feature selection. L2 adds $lambda sum w_i^2$ penalizing large weights smoothly without driving them strictly to zero.],
  [Q03], [Why do we use Cross-Entropy loss instead of MSE for classification?], [MSE combined with sigmoid outputs produces saturated regions with near-zero gradients (stalling backprop). Cross-entropy yields convex optimization with linear gradient scale $(p - y)$.],
  [Q04], [How does ROC-AUC partialer from Precision-Recall AUC?], [ROC-AUC is insensitive to class imbalance because False Positive Rate normalizes against large negative class sizes. PR-AUC focuses on minority positive class, making it superior for fraud/medical tasks.],
  [Q05], [Explain the mathematical intuition behind PCA.], [PCA finds orthogonal axes (eigenvectors of covariance matrix $Sigma = 1/N X^T X$) that maximize variance projection, minimizing reconstruction MSE.],
  [Q06], [Why is K-Means++ preferred over random centroid initialization?], [Random initialization causes poor local minima. K-Means++ chooses initial centers probabilistically proportional to squared distance from existing centers, guaranteeing $O(log K)$ competitive bounds.],
  [Q07], [What is the difference between Bagging and Boosting?], [Bagging (Random Forest) trains independent models in parallel to reduce variance. Boosting (XGBoost) trains models sequentially where each model fits the pseudo-residuals of previous models to reduce bias.],
  [Q08], [What is the vanishing gradient problem and how is it solved?], [In deep networks, sigmoid derivatives $<= 0.25$ multiply across layers, causing gradients to decay exponentially to zero. Solved via ReLU/GELU activations, Residual skip connections, and LayerNorm.],
  [Q09], [Why does Batch Normalization accelerate training?], [Smooths the optimization landscape, reduces internal covariate shift, and allows higher learning rates by normalizing mini-batch activations to mean 0 and variance 1.],
  [Q10], [How does Adam optimizer combine Momentum and RMSprop?], [Maintains exponentially decaying average of past gradients ($m_t$, first moment for direction) and past squared gradients ($v_t$, second moment for adaptive scale) with bias correction.],
  [Q11], [What causes the 'Curse of Dimensionality'?], [In high dimensions, volume grows exponentially; data points become equidistant ($("dist"_{"max"} - "dist"_{"min"})/"dist"_{"min"} -> 0$), rendering distance-based algorithms like KNN and K-Means ineffective.],
  [Q12], [Explain the difference between generative and discriminative models.], [Discriminative models learn boundary $P(Y|X)$ (e.g. Logistic Regression, SVM). Generative models learn joint distribution $P(X, Y) = P(X|Y)P(Y)$ (e.g. Naive Bayes, GANs, Diffusion).],
  [Q13], [What is Early Stopping and how does it prevent overfitting?], [Monitors validation loss during training; halts execution when validation loss fails to improve for $k$ consecutive epochs (patience parameter), restoring best checkpoint weights.]
)

#v(2pt)
#concept-box(title: "CORE MATH INTERVIEW PREPARATION TIP")[
  When asked to explain algorithms, always structure your answer in 3 parts:
  1. *Geometric Intuition*: What is the shape of the data and decision boundary?
  2. *Loss Function & Calculus*: What mathematical quantity is minimized, and how do gradients flow?
  3. *Production Failure Mode*: Under what real-world condition (e.g. outliers, multicollinearity) does this algorithm fail?
]
