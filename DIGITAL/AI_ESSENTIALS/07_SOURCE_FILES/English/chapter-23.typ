#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: INFRASTRUCTURE & GLOBAL AI ECOSYSTEM · CHAPTER 23]
= Enterprise AI Hardware: NVIDIA H100, B200 & Superclusters

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Artificial intelligence at scale is governed by the laws of thermodynamics, high-speed interconnects, and silicon physics. Modern foundation models cannot be trained without specialized Tensor Core GPU supercomputers.
]

#v(1.5pt)

#align(center)[
  #image("../03_VISUAL_ASSETS/diagrams/nvidia-gpu-cluster-infra.png", width: 88%)
]

#v(1.5pt)

== 23.1 Silicon Architecture: Hopper H100 vs Blackwell B200

#table(
  columns: (1.2fr, 2.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Hardware Metric*], [*NVIDIA H100 SXM5 (Hopper)*], [*NVIDIA B200 (Blackwell 2025–2027)*]),
  [Transistor Count], [80 Billion transistors (TSMC 4N process)], [208 Billion dual-die package (TSMC 4NP)],
  [FP8 / FP4 Compute], [2,000 TFLOPs FP8 Tensor Core], [20,000 TFLOPs FP4 / 10,000 TFLOPs FP8],
  [High-Bandwidth Memory], [80 GB HBM3 at 3.35 TB/s bandwidth], [192 GB HBM3e at 8.0 TB/s bandwidth],
  [NVLink Interconnect], [NVLink 4: 900 GB/s bidirectional per GPU], [NVLink 5: 1,800 GB/s bidirectional per GPU],
  [Superpod Scale], [Up to 256 GPUs in single NVLink domain], [Up to 576 GPUs (NVL72 liquid-cooled racks)]
)

#v(1.5pt)
#concept-box(title: "THE DISTRIBUTED TRAINING BOTTLENECK: ALLREDUCE & INFINIBAND")[
  During distributed training across thousands of GPUs, workers must synchronize weight gradients via `AllReduce`. Standard Ethernet (10 Gbps) introduces latency bottlenecks where GPUs sit idle 80% of the time. Superclusters implement *Quantum-2 InfiniBand (400–800 Gbps)* with Remote Direct Memory Access (RDMA), transferring gradients directly between GPU VRAM without CPU operating system intervention.
]

#v(2.5pt)
== 23.3 High-Bandwidth Interconnects: InfiniBand vs RoCE

Connecting 10,000+ GPUs into a single supercomputer requires non-blocking network fabrics:
- *InfiniBand (NVIDIA Quantum-X800)*: 800 Gbps per port with sub-microsecond latency and hardware-based subnet management. The gold standard for pre-training frontier foundation models.
- *RoCE (RDMA over Converged Ethernet)*: Runs Remote Direct Memory Access over standard enterprise Ethernet switches using Priority Flow Control (PFC). Delivers 85% of InfiniBand throughput at 40% lower infrastructure capital expenditure.

#v(2pt)
#concept-box(title: "GPU METRICS EVERY ARCHITECT MUST MONITOR")[
  In production clusters, track: (1) *MFU (Model Flops Utilization)*: frontier standard is $> 45\%$; (2) *GPU Memory Bandwidth Saturation*; (3) *InfiniBand Cable Retransmit Errors* causing cluster stalls.
]

#v(2pt)
== 23.4 The GPU Roofline Model & Compute vs Memory Bounds

The **Roofline Model** defines whether an AI workload is compute-bound or memory-bound:
- *Arithmetic Intensity*: Operational density measured in FLOPs per byte transferred from VRAM ($"Intensity" = "FLOPs" / "Bytes"$).
- *Pre-Training Phase*: High arithmetic intensity ($> 150$ FLOPs/byte) -> Saturates Tensor Core compute.
- *Token-by-Token Inference*: Low arithmetic intensity ($< 10$ FLOPs/byte) -> Bottlenecked strictly by HBM memory bandwidth.
