#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  Plot WCSS versus $K$. The inflection point where the rate of decrease abruptly slows forms the *"Elbow"*. Quantitatively validate using the *Silhouette Coefficient*: $s(i) = (b(i) - a(i)) / (max(a(i), b(i)))$, where $a(i)$ is mean intra-cluster distance and $b(i)$ is mean nearest-cluster distance. Values close to $+1$ indicate well-separated clusters.
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

#v(2.5pt)
== 9.4 Dimensionality Reduction & Latent Space Geometry

In unsupervised learning, projecting high-dimensional data into low-dimensional manifolds enables representation learning:
- *Principal Component Analysis (PCA)*: Orthogonal linear transformation maximizing data variance along eigenvectors of covariance matrix $Sigma = 1/n X^T X$.
- *t-SNE & UMAP*: Non-linear manifold learning preserving local topological distances. UMAP preserves both local and global structure, making it the industry standard for visualizing 1536-dimensional OpenAI vector embeddings.

#v(2pt)
== 9.5 K-Means Convergence Mathematics & The Elbow Method

K-Means minimizes within-cluster sum of squares (WCSS) via expectation-maximization:
$ "WCSS" = sum_(k=1)^K sum_(x in S_k) ||x - mu_k||^2 $
- *Initialization Trap*: Standard random initialization often converges to suboptimal local minima. Enterprise implementations use **K-Means++**, which samples initial centroids with probability proportional to squared Euclidean distance ($D(x)^2$).
- *Silhouette Analysis*: Evaluates cluster separation quality: $s(i) = (b(i) - a(i)) / max(a(i), b(i))$. Scores $> 0.5$ indicate well-separated distinct semantic partitions.
