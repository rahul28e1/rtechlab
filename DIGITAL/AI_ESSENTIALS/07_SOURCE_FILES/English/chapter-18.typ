#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 3: TRANSFORMERS & GENERATIVE AI · CHAPTER 18]
= Diffusion Models & Multimodal Generative AI

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Generative AI extends beyond text into photorealistic image synthesis, audio generation, and robotics. Understanding the thermodynamics of Diffusion Probabilistic Models (DDPM) and Multimodal Contrastive Alignment (CLIP) is critical for modern visual AI.
]

#v(2pt)

== 18.1 The Mathematics of Denoising Diffusion Probabilistic Models (DDPM)

Diffusion models generate imagery through a two-phase thermodynamic process (Sohl-Dickstein 2015 & Ho et al. 2020):

#table(
  columns: (1.2fr, 2.8fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Diffusion Phase*], [*Mathematical Formulation*], [*Physical Operation*]),
  [Forward Process ($q$)], [$q(x_t | x_(t-1)) = cal(N)(x_t; sqrt(1 - beta_t) x_(t-1), beta_t I)$], [Gradually destroys image by adding Gaussian noise over $T=1000$ steps until pure static.],
  [Direct Closed Form], [$x_t = sqrt(bar(alpha)_t) x_0 + sqrt(1 - bar(alpha)_t) epsilon, quad epsilon ~ cal(N)(0, I)$], [Computes noisy image at any arbitrary step $t$ in one single operation.],
  [Reverse Process ($p_theta$)], [$p_theta(x_(t-1) | x_t) = cal(N)(x_(t-1); mu_theta(x_t, t), Sigma_theta(x_t, t))$], [A neural network (U-Net or DiT) predicts and subtracts the exact noise added at step $t$.],
  [Training Objective], [$cal(L)_("simple") = E_(t, x_0, epsilon) [||epsilon - epsilon_theta(x_t, t)||^2]$], [Mean Squared Error between true Gaussian noise $epsilon$ and predicted noise $epsilon_theta$]
)

#v(2pt)
#concept-box(title: "LATENT DIFFUSION MODELS (STABLE DIFFUSION / FLUX)")[
  Running pixel-space partialusion on $1024 times 1024$ images requires catastrophic compute. Latent Diffusion Models (Rombach et al.) train a Variational Autoencoder (VAE) that compresses images into a $64 times 64$ latent space (8x downsampling). Diffusion occurs entirely in this compressed latent space before the VAE decoder upsamples back to photorealistic pixels.
]
#v(2pt)

== 18.2 CLIP: Contrastive Language-Image Pre-Training (OpenAI 2021)

To condition image generation on text prompts, CLIP aligns text and visual modalities into a shared embedding space:
- Simultaneously trains an Image Encoder (Vision Transformer ViT) and a Text Encoder (Transformer) on 400 Million (Image, Text) internet pairs.
- Maximizes the cosine similarity of the $N$ correct (Image, Text) pairs along the diagonal while minimizing the $N^2 - N$ incorrect pairings using InfoNCE symmetric cross-entropy loss.
- In Stable Diffusion, the text prompt is encoded by CLIP into text embeddings, which guide the denoising U-Net via *Cross-Attention layers*.

#v(2pt)

== 18.3 The 2027 Shift: Diffusion Transformers (DiT)

Modern frontier visual models (Flux.1, Midjourney v6, OpenAI Sora) have replaced classical convolutional U-Nets with *Diffusion Transformers (DiT)* (Peebles & Xie):
- Patches the latent image into visual tokens (similar to Vision Transformers) and processes them through standard Transformer attention blocks.
- Follows predictable Transformer scaling laws: scaling parameters and training compute directly yields sharper details, photorealistic hands, and flawless text rendering.

#v(2.5pt)
== 18.3 Quantization Mathematics: FP16 to INT4

Deploying frontier 70B models on commodity hardware requires reducing parameter precision:
- *Uniform Affine Quantization*: Maps floating-point weight $W$ to integer $q$:
  $ q = "round"((W) / (S)) + Z, quad S = ("max" - "min") / (2^b - 1) $
- *AWQ (Activation-aware Weight Quantization)*: Identifies the top 1% salient weights that protect reasoning accuracy and keeps them in FP16 while quantizing the remaining 99% to INT4.

#v(2pt)
== 18.4 Speculative Decoding & Medusa Multi-Head Verification

Standard auto-regressive generation requires one full GPU forward pass per token. Enterprise serving uses **Speculative Decoding**:
- A tiny, ultra-fast draft model (e.g. Llama-3-1B) generates candidate 5-token sequences at zero cost.
- The 70B target model evaluates all 5 tokens in parallel in a single forward pass, accepting valid tokens via modified rejection sampling. Throughput increases by **2.5x to 3.2x** with zero perplexity degradation.
