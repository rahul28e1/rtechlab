#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  [Padding ($P$)], [$W_("out") = floor((W_("in") - K + 2P)/S) + 1$], [Preserves border pixels with zero padding ("Same" padding)],
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

#v(2.5pt)
== 12.3 Residual Skip Connections & Modern CNN Frontiers

He et al. (2015) revolutionized deep networks by introducing *Residual Connections*:
$ y = cal(F)(x, {W_i}) + x $
- *Gradient Highway*: The identity mapping $+ x$ provides a clean pathway for gradients to flow backward unimpeded ($partial y / partial x = partial cal(F) / partial x + 1$). Even if $partial cal(F) / partial x approx 0$, the gradient never drops below 1.
- *ConvNeXt*: Modern architectures incorporating 7x7 depthwise separable convolutions and inverted bottlenecks, proving pure convolutional networks remain competitive with Vision Transformers for edge mobile deployments.

#v(2pt)
== 12.4 Vision Transformers (ViT) vs Modern CNNs

#table(
  columns: (1.2fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Feature*], [*Vision Transformers (ViT)*], [*Modern CNNs (ConvNeXt)*]),
  [Inductive Bias], [Minimal; learns spatial relations from data.], [High; translation invariance & locality built-in.],
  [Scaling Ceiling], [Superior accuracy on datasets $> 100$M images.], [High accuracy on smaller enterprise datasets.],
  [Compute Complexity], [$cal(O)(N^2)$ quadratic with image patch count.], [$cal(O)(N)$ linear with spatial resolution.],
  [Edge Deployment], [Requires specialized NPU matrix hardware.], [Runs efficiently on mobile CPUs and cheap edge GPUs.]
)
