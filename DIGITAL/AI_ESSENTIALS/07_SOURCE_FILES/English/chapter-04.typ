#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 04]
= The Statistical AI Renaissance: Deep Blue to AlexNet (1997–2012)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  The modern era of AI began when researchers abandoned handcrafted logic rules and embraced statistical learning on massive real-world datasets. Enabled by algorithmic breakthroughs, internet-scale data, and GPU parallel processing, AI entered its golden age.
]

#v(2pt)

== 4.1 Deep Blue vs Garry Kasparov (May 11, 1997)

IBM's *Deep Blue* defeated reigning World Chess Champion Garry Kasparov in a 6-game match (3.5 to 2.5), marking the first time a machine defeated a world champion in classical tournament conditions:

#table(
  columns: (1.3fr, 2.7fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Architectural Layer*], [*Hardware & Software Implementation*], [*Engineering Significance*]),
  [Compute Cluster], [30-node IBM RS/6000 SP supercomputer with 480 custom VLSI chess chips.], [Parallelized evaluation across multiple server nodes.],
  [Search Speed], [200,000,000 board positions evaluated per second.], [Looked ahead 6 to 12 plies, selectively up to 40 plies.],
  [Search Algorithm], [Alpha-Beta minimax search with iterative deepening and quiescence search.], [Pruned non-viable branches to manage combinatorial explosion.],
  [Evaluation Function], [Over 8,000 handcrafted features (king safety, piece mobility, pawn structure).], [Co-designed with Grandmaster Joel Benjamin.]
)

#v(2pt)
#concept-box(title: "LIMITATION OF HEURISTIC SEARCH")[
  While monumental, Deep Blue was not "learning"—it was an ultra-fast brute-force search machine. It could not transfer its chess knowledge to play checkers or navigate a room. True generalized learning required statistical representation learning.
]
#v(2pt)

== 4.2 The ImageNet Large Scale Visual Recognition Challenge (2010–2017)

In 2009, Stanford Professor *Fei-Fei Li* recognized that AI models failed because they were trained on tiny datasets. She launched *ImageNet*, annotating 14,197,122 images across 21,841 synsets using Amazon Mechanical Turk. This established the annual ImageNet Challenge (ILSVRC) classifying 1.2 million images into 1,000 categories:

#table(
  columns: (0.8fr, 1.3fr, 1.7fr, 1.2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Year*], [*Winning Model*], [*Primary Innovator*], [*Architecture*], [*Top-5 Error*]),
  [2010], [NEC-UIUC], [Lin et al.], [Handcrafted SIFT + SVM], [28.2%],
  [2011], [XRCE], [Perronnin et al.], [Fisher Vectors + Handcrafted], [25.8%],
  [2012], [*AlexNet*], [*Alex Krizhevsky & Ilya Sutskever*], [*8-layer Deep CNN (2x GTX 580)*], [*16.4% (-9.4%)*],
  [2013], [ZFNet], [Zeiler & Fergus], [Visualized Deconvnet CNN], [11.7%],
  [2014], [VGGNet / GoogLeNet], [Simonyan & Zisserman / Szegedy], [16-19 layers / Inception blocks], [6.7%],
  [2015], [*ResNet*], [*Kaiming He (Microsoft Research)*], [*152 layers with Skip Connections*], [*3.57% (Superhuman)*]
)

#v(2pt)

== 4.3 AlexNet (2012): The Tectonic Shift to GPU Deep Learning

AlexNet's 9.4% error reduction in 2012 ignited the Deep Learning revolution. Designed by Alex Krizhevsky, Ilya Sutskever, and Geoffrey Hinton at the University of Toronto, its innovations form the core of all modern neural networks:

- *GPU Acceleration*: Implemented in custom CUDA code across two 3GB NVIDIA GeForce GTX 580 GPUs.
- *ReLU Activation*: Replaced Sigmoid with $f(x) = max(0, x)$, eliminating vanishing gradients during backpropagation.
- *Dropout Regularization*: Set 50% of hidden neurons to zero during training passes, preventing co-adaptation and overfitting.
- *Data Augmentation*: Dynamically generated translations, horizontal flips, and PCA color adjustments to expand training volume.

#v(2pt)
#tech-spotlight-box(title: "WHY CPUS FAILED AT DEEP LEARNING")[
  CPUs are latency-optimized with 64 large cores, whereas GPUs feature thousands of SIMD Tensor Cores executing parallel matrix multiplications ($C = A times B$). AlexNet trained on two NVIDIA GTX 580 GPUs in 6 days; identical training on CPUs would have required over *5 months of non-stop compute*.
]
