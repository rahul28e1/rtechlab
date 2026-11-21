# -*- coding: utf-8 -*-
"""
RTechLab AI Essentials & Career Accelerator — English Chapters 23 to 28
Part 4: Industrial AI Infrastructure, Geopolitics & IndiaAI Mission
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
"""

chapters_eng_part4 = {
    23: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
""",

    24: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: INFRASTRUCTURE & GLOBAL AI ECOSYSTEM · CHAPTER 24]
= Global AI Geopolitics, Silicon Sovereignty & The Chip War

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Microchips are the new oil—the fundamental scarce resource determining national economic primacy and military capability. A complex geopolitical supply chain links photolithography in Europe, fabrication in Taiwan, and model training in global hyperscalers.
]

#v(2pt)

== 24.1 The Fragile Semiconductor Supply Chain Chokepoints

#table(
  columns: (1fr, 1.8fr, 2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Chokepoint*], [*Monopoly Entity*], [*Technological Monopoly Scope*], [*Global Dependency*]),
  [Photolithography], [ASML (Veldhoven, Netherlands)], [Exclusive manufacturer of Extreme Ultraviolet (EUV) machines (\$350M each, 13.5nm wavelength).], [100% of advanced sub-5nm chips],
  [Advanced Fabrication], [TSMC (Hsinchu, Taiwan)], [Pure-play foundry producing 90%+ of world's frontier AI silicon (NVIDIA, Apple, AMD, Qualcomm).], [Over 90% of global AI processors],
  [Electronic Design (EDA)], [Synopsys & Cadence (USA)], [Software tools required to layout billions of transistors without physical interference.], [85%+ global market share],
  [HBM Packaging], [SK Hynix & Samsung (South Korea)], [Through-Silicon Via (TSV) stacking of 12-layer high-bandwidth memory chips.], [95%+ of global HBM supply]
)

#v(2pt)
#concept-box(title: "THE US CHIPS ACT & EXPORT CONTROL EMBARGOES")[
  In October 2022 and updated in 2023/2024, the United States imposed sweeping export restrictions barring NVIDIA and TSMC from shipping advanced compute chips (A100, H100, B200) to adversarial nations. Simultaneously, the US (\$52 Billion) and the European Union (€43 Billion) passed CHIPS Acts to subsidize domestic fabrication facilities.
]
#v(2pt)

== 24.2 Silicon Sovereignty: Why Nations Must Build Native AI Stacks

Relying exclusively on foreign AI APIs (e.g. US proprietary models) creates existential vulnerabilities:
- *Data Sovereignty*: Sensitive banking records, defense logistics, and healthcare records cannot legally leave national borders.
- *Cultural & Linguistic Bias*: Western models trained on English-centric corpora misunderstand regional cultural nuances, legal frameworks, and vernacular idioms.
- *Infrastructure Kill-Switch*: A foreign government can mandate API throttling or service revocation during geopolitical friction, paralyzing a dependent nation's critical infrastructure.
""",

    25: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: INFRASTRUCTURE & GLOBAL AI ECOSYSTEM · CHAPTER 25]
= India's AI Revolution: The ₹10,372 Crore IndiaAI Mission

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Approved by the Union Cabinet in March 2024, the comprehensive *IndiaAI Mission* establishes India as a global artificial intelligence superpower through democratized sovereign compute, indigenous models, and public datasets.
]

#v(1.5pt)

#align(center)[
  #image("../03_VISUAL_ASSETS/diagrams/india-ai-mission-ecosystem.png", width: 88%)
]

#v(1.5pt)

== 25.1 The Seven Strategic Pillars of IndiaAI

#table(
  columns: (1fr, 2fr, 2.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*Pillar*], [*Strategic Mission Target*], [*Implementation Mechanism*], [*Budget Allocation*]),
  [IndiaAI Compute], [10,000+ GPUs Sovereign Compute Cluster], [Public-private partnership offering subsidized compute to startups and researchers.], [₹4,565 Crore (Largest Pillar)],
  [IndiaAI Innovation Centre], [Development of Sovereign Foundation Models], [Indigenous multilingual LLM research hubs targeting Indian languages and domains.], [Indigenous AI Core],
  [IndiaAI Datasets Platform], [Unified Non-Personal Data Gateway], [Access to anonymized public datasets for AI training through India Datasets Platform.], [National Data Asset],
  [IndiaAI Application Dev], [Critical Sector Deployment], [AI applications in Healthcare, Agriculture, Climate Change, and Governance.], [Public Welfare Impact],
  [IndiaAI FutureSkills], [Tier-2/Tier-3 AI Talent Creation], [Undergraduate & doctoral fellowships, curriculum modernization across colleges.], [Human Capital Pool],
  [Startup Financing], [Direct Venture Capital Catalysis], [Financial support and cloud credits for early-stage DeepTech AI startups.], [Democratized Capital],
  [Safe & Trusted AI], [Indigenous Governance Framework], [Responsible AI toolkits, bias mitigation frameworks, and ethical safety standards.], [Regulatory Guardrails]
)

#v(1.5pt)
#tech-spotlight-box(title: "CAREER OPPORTUNITY FOR INDIAN STUDENTS")[
  The IndiaAI Mission is actively hiring AI engineers, MLOps specialists, and research fellows across C-DAC, NIC, and affiliated startup incubators. Subsidized GPU access allows Indian developers to train multi-billion parameter models locally without expensive international cloud bills.
]
""",

    26: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: INFRASTRUCTURE & GLOBAL AI ECOSYSTEM · CHAPTER 26]
= Sovereign Indic LLMs & Digital Public Infrastructure (DPI)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  India's AI strategy is fundamentally partialerent from Silicon Valley: rather than building expensive enterprise chatbots for English speakers, Indian innovators are building voice-first, multilingual AI integrated into the world's largest Digital Public Infrastructure.
]

#v(2pt)

== 26.1 Flagship Sovereign Indic Models

#table(
  columns: (1fr, 1.6fr, 2.4fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Indic AI Venture*], [*Founding Entity*], [*Core Innovation & Technical Architecture*], [*Language Coverage*]),
  [Sarvam AI (Sarvam-1)], [Pratyush Kumar & Vivek Raghavan], [Highly efficient 2B/7B parameter models pre-trained on diverse Indic tokens. Voice-first audio models.], [10+ Indian Languages (Hindi, Tamil, Telugu, etc.)],
  [Krutrim], [Bhavish Aggarwal (Ola)], [Pre-trained on 2 Trillion Indic tokens; integrated with Krutrim Cloud and native AI chips.], [22 Official Indian Languages],
  [Bhashini (National Mission)], [Ministry of Electronics & IT (MeitY)], [Open API infrastructure for Automated Speech Recognition (ASR), translation (NMT), and Text-to-Speech.], [All 22 Scheduled Indian Languages],
  [Hanooman AI], [SML & BharatGPT (IIT Bombay)], [Series of Indic multimodal LLMs tailored for 11 sectors including legal, banking, and healthcare.], [11 Indian Languages]
)

#v(2pt)
#concept-box(title: "THE POWER OF THE INDIA DPI TRIANGLE: AADHAAR + UPI + AI")[
  Western AI exists behind paywalls. Indian AI is being layered directly on top of the *India Stack*:
  - *Conversational UPI Payments*: Voice-activated peer-to-peer money transfers in local dialects (`\"Ramesh ko 500 rupaye bhejo\"`).
  - *Aadhaar-Authenticated Welfare*: AI voicebots assisting rural citizens in applying for PM-Kisan and healthcare subsidies without literacy barriers.
  - *Open Network for Digital Commerce (ONDC)*: Multilingual AI agents negotiating commerce and logistics across distributed small merchants.
]
#v(2pt)

== 26.2 Tokenization Inefficiencies in Indian Languages

A critical technical challenge facing Indic AI is token inflation:
- Standard English tokenizers represent English words in 1–2 tokens.
- Devanagari, Tamil, and Bengali scripts are split by English-centric tokenizers into individual Unicode byte sequences, requiring *3x to 6x more tokens per sentence*.
- This makes training and inferencing 5x more expensive for Indian users. Indic innovations (such as Sarvam's custom Indic tokenizer) cut token expansion ratios down to parity with English, slashing compute costs by 60%.
""",

    27: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: INFRASTRUCTURE & GLOBAL AI ECOSYSTEM · CHAPTER 27]
= Industrial Case Studies: High-Impact Commercial Deployments

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Artificial Intelligence has moved out of the laboratory and into the economic bloodstream of major global industries. Examining real-world deployments reveals how algorithmic models generate billions in audited commercial value.
]

#v(2pt)

== 27.1 Healthcare: AlphaFold & Oncology Diagnostics

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Domain*], [*AI Deployment & Architecture*], [*Audited Commercial / Clinical Impact*]),
  [Protein Folding (AlphaFold 2/3)], [DeepMind's Evoformer architecture predicting 3D atomic structures of 200M+ proteins.], [Accelerated drug discovery from 5 years to days; awarded 2024 Nobel Prize in Chemistry.],
  [Early Oncology Screening], [Deep Convolutional Networks and Vision Transformers analyzing low-dose CT and mammograms.], [Detected early-stage breast cancer lesions 18 months before clinical manifestation; 22% fewer false positives.],
  [Pathology Automation], [Gigapixel whole-slide digital pathology models scanning cellular biopsies.], [Triaged urgent biopsy cases automatically, reducing clinical pathologist review backlog by 45%.]
)

#v(2pt)

== 27.2 Fintech: High-Frequency Fraud Detection & Algorithmic Credit

- *Visa / Mastercard Real-Time Scoring*: Evaluates over 65,000 transactions per second in under 10 milliseconds using ensembles of deep autoencoders and XGBoost. Flags card-not-present fraud, preventing \$30+ Billion in global fraud losses annually.
- *Micro-Lending in India (Fintech)*: Leverages alternative telemetry data (UPI transaction cadence, utility payment history, GST invoicing flows) via gradient-boosted decision trees to disburse uncollateralized micro-loans to 40+ million previously unbanked citizens.

#v(2pt)

== 27.3 Autonomous Mobility: Tesla FSD vs Waymo

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Autonomous Approach*], [*Sensor Suite & Architectural Philosophy*], [*Production Performance (2027)*]),
  [Tesla FSD (End-to-End Neural Net)], [Pure Vision (8 cameras, zero LiDAR/Radar). End-to-end neural network mapping raw photons directly to steering and acceleration controls.], [Millions of customer fleet vehicles collecting billions of real-world edge-case miles; rapid generalized scaling.],
  [Waymo (Alphabet)], [Multi-sensor fusion (LiDAR, Radar, HD Cameras) + HD 3D centimeter-accurate pre-mapped geofences.], [Commercial robotaxi operations in Phoenix, SF, LA, and Austin with zero human drivers; high localized reliability.]
)
""",

    28: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: INFRASTRUCTURE & GLOBAL AI ECOSYSTEM · CHAPTER 28]
= Production Lab: Serving LLMs with vLLM & PagedAttention

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Deploying LLMs in enterprise production using naive Hugging Face pipelines results in low throughput and 70% wasted GPU memory. In this lab, we deploy a production inference gateway using *vLLM* and *PagedAttention*.
]

#v(2pt)

== 28.1 The PagedAttention Revolution (Kwon et al., UC Berkeley)

Traditional LLM serving pre-allocates contiguous memory blocks for the KV-Cache based on maximum sequence length (e.g. 2048 tokens). Because actual prompts vary, 60%–80% of memory is lost to internal/external fragmentation.
- *PagedAttention* borrows the concept of *Virtual Memory and Paging* from modern operating systems.
- It partitions the KV-Cache into non-contiguous physical memory blocks, enabling continuous batching and yielding *2x to 4x higher throughput* on identical GPU hardware.

#v(2pt)
#code-box(title: "VLLM HIGH-THROUGHPUT CLI SERVER LAUNCH")[
```bash
# 1. Install High-Throughput vLLM Serving Engine
pip install vllm ray

# 2. Launch OpenAI-Compatible High-Concurrency LLM Server on Port 8000
python -m vllm.entrypoints.openai.api_server \\
    --model meta-llama/Llama-3-8B-Instruct \\
    --tensor-parallel-size 1 \\
    --max-model-len 8192 \\
    --gpu-memory-utilization 0.90 \\
    --enforce-eager \\
    --port 8000
```
]
#v(2pt)

== 28.2 Calling the High-Throughput Inference Endpoint in Python

#v(2pt)
#code-box(title: "PYTHON FASTAPI / OPENAI CLIENT INFERENCE")[
```python
from openai import OpenAI

# Connect to local or cloud-hosted vLLM high-throughput server
client = OpenAI(base_url="http://localhost:8000/v1", api_key="EMPTY")

response = client.chat.completions.create(
    model="meta-llama/Llama-3-8B-Instruct",
    messages=[
        {"role": "system", "content": "You are a production enterprise AI microservice."},
        {"role": "user", "content": "Explain PagedAttention in one concise bullet point."}
    ],
    temperature=0.0,
    max_tokens=60
)

print("vLLM Production Response:")
print(response.choices[0].message.content)
```
]
#v(2pt)

== 28.3 Key Production Metrics
- *Time to First Token (TTFT)*: $< 80$ms | *Inter-Token Latency (ITL)*: $< 15$ms per token.
- *Concurrent Request Capacity*: Serves 50+ concurrent customer streams on a single 24GB RTX 4090 GPU.
"""
}
