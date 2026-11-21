# -*- coding: utf-8 -*-
"""
RTechLab AI Essentials & Career Accelerator — English Chapters 01 to 06
Part 1: The AI Odyssey & Historical Foundations
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
"""

chapters_eng_part1 = {
    1: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 01]
= The Dawn of Intelligent Machines: 1950 to Dartmouth 1956

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Artificial Intelligence was born not as a software engineering discipline, but as a philosophical and mathematical pursuit to answer Alan Turing's seminal 1950 question: \"Can machines think?\" Understanding these origins is essential to mastering modern neural computation.
]

#v(2pt)

== 1.1 Alan Turing & The 1950 Imitation Game Protocol

In October 1950, British mathematician Alan Mathison Turing published his landmark paper *\"Computing Machinery and Intelligence\"* in the philosophy journal *Mind*. Turing proposed an operational benchmark to bypass metaphysical debates on machine consciousness, famously titled the *Imitation Game (The Turing Test)*:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Turing Component*], [*Operational Engineering Specification*], [*Modern 2027 Equivalent*]),
  [Interrogator (Judge)], [Human evaluator isolated in a separate terminal room.], [LLM Evaluation / LMSYS Chatbot Arena],
  [Entities A & B], [One human respondent and one hidden digital computer system.], [Human Baseline vs Frontier Model (e.g. GPT-4o)],
  [Communication Channel], [Text-only teletype interface eliminating physical/vocal bias.], [Tokenized REST API / WebSocket Stream],
  [Passing Threshold], [Computer misleads human interrogator â‰¥ 30% of 5-minute trials.], [MMLU-Pro, GSM8K & ARC-AGI Benchmark Scores]
)

#v(2pt)
#concept-box(title: "CORE ENGINEERING PRINCIPLE: TURING'S FUNCTIONAL DUALISM")[
  Turing established that cognitive capability can be evaluated purely through external input-output behavior rather than internal biological substrate. If a digital algorithm produces responses indistinguishable from human cognition under blind interrogation, the system is functionally intelligent.
]
#v(2pt)

== 1.2 The Dartmouth 1956 Summer Research Project

The formal term *\"Artificial Intelligence\"* was coined in the summer of 1956 at Dartmouth College, Hanover, New Hampshire. Organized by *John McCarthy* (Dartmouth), *Marvin Minsky* (Harvard/MIT), *Nathaniel Rochester* (IBM), and *Claude Shannon* (Bell Labs), the conference proposal boldly asserted:

#text(size: 7.2pt, style: "italic", fill: rgb("#0F172A"))[
  \"Every aspect of learning or any other feature of intelligence can in principle be so precisely described that a machine can be made to simulate it.\"
]

#v(2pt)

== 1.3 Symbolic AI & The Logic Theorist Breakthrough

The sole working software demonstrated at Dartmouth was *The Logic Theorist*, authored by Allen Newell, Cliff Shaw, and Herbert Simon from the RAND Corporation. Implemented in IPL-II, it proved 38 of the first 52 theorems in Whitehead and Russell's *Principia Mathematica*, discovering a shorter, more elegant proof for Theorem 2.85 than the human authors had written. This ushered in the *Symbolic AI (GOFAI - Good Old-Fashioned AI)* paradigm:

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Milestone*], [*Key Pioneer & Lab*], [*Architectural Significance*]),
  [Logic Theorist (1956)], [Newell, Shaw & Simon (RAND)], [First heuristic search program proving symbolic mathematical proofs.],
  [General Problem Solver (1959)], [Newell & Simon (Carnegie Mellon)], [Means-ends analysis separating domain knowledge from reasoning engine.],
  [LISP Programming Language (1958)], [John McCarthy (MIT)], [Pioneered linked lists, dynamic typing, tree recursion & garbage collection.],
  [ELIZA Psychotherapist (1966)], [Joseph Weizenbaum (MIT AI Lab)], [First conversational chatbot using keyword substitution & pattern scripts.]
)

#v(2pt)
#tech-spotlight-box(title: "2027 FRONTIER PERSPECTIVE: SYMBOLIC REASONING MEETS NEURAL NETS")[
  While modern AI is dominated by statistical deep learning, 2027 enterprise systems are returning to hybrid *Neuro-Symbolic AI*—combining the probabilistic fluency of LLMs with deterministic formal logic checkers (Z3 solvers, Lean 4 theorem provers) to guarantee zero hallucinations in aerospace and medical AI.
]
""",

    2: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 02]
= Golden Age, Perceptrons & The First AI Winter (1957–1980)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  The initial optimism of the 1960s promised human-level machine translation and autonomous vision within a decade. However, mathematical limitations in single-layer neural architectures and gross overpromising triggered a devastating collapse in funding known as the First AI Winter.
]

#v(2pt)

== 2.1 Frank Rosenblatt & The Mark I Perceptron (1957)

In 1957, American psychologist Frank Rosenblatt constructed the *Perceptron* at the Cornell Aeronautical Laboratory. Running on an IBM 704 vacuum-tube mainframe and later custom hardware featuring 400 cadmium sulfide photocells (a 20x20 visual array) wired with motorized potentiometers for adaptive weights:

#table(
  columns: (1.2fr, 2.8fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Component*], [*Mathematical Formula / Operation*], [*Physical Hardware Mechanism*]),
  [Input Vector ($x_i$)], [Binary photocell activations $x_1, x_2, dots, x_n in {0, 1}$], [20x20 grid of optical sensors in camera box],
  [Synaptic Weight ($w_i$)], [Continuous real-valued weight vector $arrow(w)$], [Rotary potentiometers adjusted by electric motors],
  [Net Activation ($z$)], [$z = sum_(i=1)^n w_i x_i + b = arrow(w) dot arrow(x) + b$], [Analog electrical summing junction circuit],
  [Output Function ($y$)], [$y = 1$ if $z >= 0$, else $0$ (Heaviside Step)], [Bistable relay flipping on positive voltage]
)

#v(2pt)
#concept-box(title: "PERCEPTRON WEIGHT UPDATE CONVERGENCE THEOREM (1962)")[
  Rosenblatt proved that if training data is *linearly separable*, the perceptron learning rule $w_i arrow.l w_i + eta (y_("true") - y_("pred")) x_i$ is guaranteed to converge to a separating hyperplane in a finite number of iterations, where $eta$ is the learning rate.
]
#v(2pt)

== 2.2 The Minsky-Papert Critique & The XOR Deathblow (1969)

In 1969, Marvin Minsky and Seymour Papert published their book *Perceptrons: An Introduction to Computational Geometry*. In Chapter 13, they delivered an airtight mathematical proof showing that single-layer perceptrons could not compute the simple *Exclusive-OR (XOR)* logical function:

#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Input $x_1$*], [*Input $x_2$*], [*Target $y$ (XOR)*], [*Geometric Impossibility with Single Line*]),
  [$0$], [$0$], [$0$], [Point $(0,0)$ requires output $0$],
  [$0$], [$1$], [$1$], [Point $(0,1)$ requires output $1$ (Separation impossible)],
  [$1$], [$0$], [$1$], [Point $(1,0)$ requires output $1$ (Requires non-linear boundary)],
  [$1$], [$1$], [$0$], [Point $(1,1)$ requires output $0$ (No single straight line can split classes)]
)

Although multi-layer networks could solve XOR, no algorithm existed in 1969 to calculate gradients for hidden layers. This caused an abrupt cessation of artificial neural network funding for over 15 years.

#v(2pt)

== 2.3 The Lighthill Report & The First AI Winter (1974–1980)

In 1973, Professor Sir James Lighthill evaluated AI research for the British Science Research Council. The *Lighthill Report (1973)* concluded that nowhere had the wild promises of AI materialized, identifying the *\"Combinatorial Explosion\"*—as problem complexity scaled, search spaces grew factorially beyond any computer's capacity.

#warning-box(title: "THE LESSON OF THE FIRST AI WINTER FOR MODERN ENGINEERS")[
  Simultaneously, the US Congress passed the Mansfield Amendment, barring DARPA from funding open-ended research without immediate military battlefield payoff. Funding dried up globally from 1974 to 1980. The immutable law: *When claims outpace compute, hardware capabilities, and rigorous math, an AI Winter is inevitable.*
]
""",

    3: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 03]
= Expert Systems & The Second AI Winter (1980–1993)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  In the 1980s, AI resurrected as commercial *Expert Systems*. Rather than mimicking universal human reasoning, systems encoded domain-specific human knowledge into massive rule bases. However, brittle logic, manual maintenance, and commodity microprocessors caused the Second AI Winter.
]

#v(2pt)

== 3.1 The Architecture of Commercial Expert Systems

Pioneered by Edward Feigenbaum at Stanford University (the \"Father of Expert Systems\"), knowledge engineering separated the system into three decoupled operational tiers:

#table(
  columns: (1.3fr, 2.7fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Subsystem*], [*Operational Responsibility*], [*Technical Implementation*]),
  [Knowledge Base], [Houses thousands of production rules: `IF <condition> THEN <action>`], [Declarative rules extracted from human domain experts],
  [Inference Engine], [Executes Forward Chaining (data-driven) or Backward Chaining (goal-driven)], [Rete pattern-matching algorithm, conflict resolution],
  [Working Memory], [Maintains dynamic global facts about the current active case], [State table updated continuously during execution run],
  [Explanation Facility], [Provides transparent audit trails answering \"WHY\" and \"HOW\" conclusions], [Rule execution stack trace presented in natural text]
)

#v(2pt)
#concept-box(title: "HISTORIC EXPERT SYSTEM DEPLOYMENTS")[
  - *MYCIN (Stanford, 1972)*: 600 rules for diagnosing blood infectious diseases (bacteremia/meningitis). Scored 65% correct treatment plans, outperforming non-specialist physicians (42%–62%).
  - *DENDRAL (Stanford, 1965)*: Inferred chemical molecular structures from mass spectrometer data.
  - *XCON / R1 (Carnegie Mellon & DEC, 1980)*: Automatically configured VAX computer orders, saving DEC an audited \$40 Million annually across 10,000 orders.
]
#v(2pt)

== 3.2 The LISP Machine Bubble & Proprietary Hardware Boom

To run memory-hungry LISP environments, dedicated hardware companies formed: *Symbolics*, *Lisp Machines Inc. (LMI)*, and *Texas Instruments (Explorer)*. These machines featured hardware-tagged architectures, microcoded LISP instruction sets, and large graphical displays, selling for \$50,000 to \$150,000 per terminal:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*System Model*], [*Proprietary Hardware Innovations*], [*Downfall Catalyst (1987)*]),
  [Symbolics 3600 (1983)], [36-bit tagged memory, hardware garbage collection, Zmacs.], [Surpassed by Sun Microsystems SPARC & Intel 386/486.],
  [TI Explorer (1984)], [NuBus architecture, high-resolution bitmapped monitor.], [Cost prohibitive; \$60k vs \$5k commodity PC/Unix workstations.],
  [Connection Machine CM-1 (1985)], [Danny Hillis / Thinking Machines: 65,536 1-bit parallel processors.], [Excessive hardware complexity; lack of software tooling.]
)

#v(2pt)

== 3.3 The Crash of 1987 & The Second AI Winter (1987–1993)

Between 1987 and 1993, the expert systems market collapsed completely due to three fatal engineering realities:

- *The Knowledge Acquisition Bottleneck*: Extracting tacit rules from human experts required hundreds of manual engineering hours per rule. Rules contradicted one another at scale.
- *Brittleness*: Systems failed catastrophically when encountering inputs just outside their rigid rule boundaries, having no common-sense fallback.
- *Commodity PC Supremacy*: Apple Macintosh and Unix workstations powered by Motorola 68020 and Intel 80386 chips ran software LISP faster and at 1/10th the cost of dedicated LISP hardware. Symbolics went bankrupt in 1996, and DARPA canceled Strategic Computing funding.
""",

    4: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  While monumental, Deep Blue was not \"learning\"—it was an ultra-fast brute-force search machine. It could not transfer its chess knowledge to play checkers or navigate a room. True generalized learning required statistical representation learning.
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
""",

    5: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 05]
= The AI Evolution Timeline & Scaling Laws (1950–2027)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  AI progress has shifted from sporadic theoretical breakthroughs to predictable physical scaling laws. Tracking the 75-year timeline from Turing to 2027 Foundation Models reveals the exponential economics governing modern artificial intelligence.
]

#v(2pt)

== 5.1 The 75-Year Master AI Evolution Matrix

#table(
  columns: (0.8fr, 1.5fr, 1.4fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.2pt, y: 1.8pt),
  table.header([*Era*], [*Paradigm*], [*Flagship Milestone*], [*Core Technical Mechanism*]),
  [1950], [Turing Test], [Mind Paper], [Operational imitation test bypassing consciousness debate.],
  [1956], [Symbolic AI], [Dartmouth Conference], [Birth of AI term; Logic Theorist proving mathematical theorems.],
  [1957], [Perceptron], [Mark I Perceptron], [Single-layer neural network; linear decision boundary.],
  [1969], [First AI Winter], [Minsky & Papert Proof], [Mathematical proof of XOR limitation; collapse of funding.],
  [1980], [Expert Systems], [MYCIN & DEC XCON], [Rule-based IF-THEN knowledge engineering; LISP hardware.],
  [1986], [Connectionism], [Rumelhart Backprop], [Backpropagation algorithm popularized for multi-layer MLPs.],
  [1987], [Second AI Winter], [LISP Market Collapse], [Brittle rule maintenance; Sun & Intel PCs outperform LISP chips.],
  [1997], [Heuristic Search], [IBM Deep Blue], [Parallel VLSI search engines evaluating 200M chess moves/sec.],
  [2012], [Deep Learning], [AlexNet on GPUs], [Convolutional networks trained on CUDA GPUs; ImageNet solved.],
  [2016], [Reinforcement Learning], [DeepMind AlphaGo], [Monte Carlo Tree Search + Deep Neural Policy Networks.],
  [2017], [Transformers], [Attention Is All You Need], [Vaswani et al.: Self-attention replaces recurrence entirely.],
  [2020], [Scaling Laws], [GPT-3 (175B)], [Brown et al.: Emergent few-shot in-context learning through scale.],
  [2022], [Generative AI], [ChatGPT & Diffusion], [RLHF alignment + Web-scale pre-training; mass adoption.],
  [2024], [Multimodal & Reasoning], [GPT-4o & OpenAI o1], [End-to-end multimodal audio/vision + Test-Time Compute (MCTS).],
  [2027], [Agentic AI & Indic], [Sovereign LLMs / AGI], [Autonomous goal-directed agent swarms, ₹10k Cr IndiaAI Mission.]
)

#v(2pt)

== 5.2 Moore's Law vs Huang's Law & Compute Economics

While classical Moore's Law (CPU transistor doubling every 24 months) has hit quantum tunneling physical limits, GPU compute has expanded exponentially under *Huang's Law* (named after NVIDIA CEO Jensen Huang):

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Metric*], [*Classical CPU Scaling (Moore)*], [*Modern GPU Scaling (Huang)*]),
  [Scaling Rate], [2x compute performance every 24 months], [*Over 1,000x compute performance in 8 years* (2016-2024)],
  [Primary Driver], [Lithography gate shrinking (FinFET/GAA)], [Architecture + FP8/FP4 Tensor Cores + NVLink interconnect],
  [Cost per GFLOP], [Flattens due to EUV wafer fabrication cost], [Plummets from \$10.00 (2010) to less than \$0.0001 (2027)],
  [Energy Factor], [Thermal Design Power (TDP) limit reached], [High-Bandwidth Memory (HBM3e) & liquid cooling deployment]
)

#v(2pt)
#concept-box(title: "THE CHINCHILLA SCALING LAW (HOFFMANN ET AL., DEEPMIND 2022)")[
  For compute-optimal LLM training, model parameters ($N$) and training tokens ($D$) should scale in equal proportion: $D approx 20 times N$. Training a 70B parameter model requires at least 1.4 Trillion tokens. Compute budget $C approx 6 N D$ FLOPs.
]
""",

    6: """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 06]
= AI Taxonomy: Narrow AI (ANI) vs General AI (AGI) vs Superintelligence (ASI)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  In commercial discussions, \"AI\" is casually applied to spam filters and autonomous agents alike. A rigorous engineering taxonomy separates capabilities across three fundamental thresholds: ANI, AGI, and ASI.
]

#v(2pt)

== 6.1 The Three Horizons of Artificial Intelligence

#table(
  columns: (1.1fr, 1.8fr, 1.8fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Capability Tier*], [*Formal Definition*], [*Real-World Examples*], [*Production State*]),
  [Artificial Narrow Intelligence (ANI)], [Excels at a single, tightly constrained task. Zero transfer learning outside domain.], [AlphaGo, Tesla Autopilot, Siri, ResNet-50, Spam Filters.], [*Current State of Production AI* (100% of enterprise systems)],
  [Artificial General Intelligence (AGI)], [Matches or exceeds human cognitive versatility across all economically valuable work.], [Autonomous software engineer, end-to-end scientific researcher.], [*Active Frontier (2026-2028)*: Early reasoning models (OpenAI o1)],
  [Artificial Superintelligence (ASI)], [Dramatically surpasses the collective intellectual capability of all human minds.], [Self-improving recursive intelligence, planetary orchestration.], [*Theoretical Frontier*: Subject of AI alignment & safety research]
)

#v(2pt)
#concept-box(title: "FRANÇOIS CHOLLET'S ARC-AGI BENCHMARK (ON THE MEASURE OF INTELLIGENCE)")[
  Chollet proved that memorizing millions of training tasks is NOT intelligence—it is crystallized skill. True intelligence is *Generalization Efficiency*: the speed and efficiency with which an agent acquires *new* skills outside its training distribution with minimal data. The Abstraction and Reasoning Corpus (ARC-AGI) is the recognized benchmark for testing true AGI.
]
#v(2pt)

== 6.2 The DeepMind 5 Levels of AGI Framework (2023)

To replace vague definitions, DeepMind introduced a performance vs generality matrix:

#table(
  columns: (1fr, 1.4fr, 2fr, 1.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Level*], [*Performance Tier*], [*Narrow AI Benchmark (ANI)*], [*General AI Benchmark (AGI)*]),
  [Level 0], [No AI], [Calculator, Rule-based compiler], [Human-written bash script],
  [Level 1], [Emerging (Unskilled)], [ELIZA, Simple Decision Tree], [GPT-3.5, Gemini 1.0 Flash],
  [Level 2], [Competent (50th percentile)], [Stockfish chess engine (2000 Elo)], [GPT-4o, Claude 3.5 Sonnet],
  [Level 3], [Expert (90th percentile)], [AlphaFold 2 (Protein Folding)], [OpenAI o1 / DeepSeek-R1],
  [Level 4], [Virtuoso (99th percentile)], [AlphaGo Master, Deep Blue], [Autonomous DeepTech Researcher],
  [Level 5], [Superhuman (Beyond all)], [AlphaZero (discovering chess axioms)], [Full ASI System]
)

#v(2pt)

== 6.3 Industrial Boundaries: Where Enterprise Value Actually Lies

Students entering the AI field must understand where commercial budgets are spent in 2027:
- *92% of corporate AI spending* is currently directed toward *ANI and Augmented LLM Workflows*: Enterprise Document RAG, Customer Voice Agents, Defect Detection, and Predictive Maintenance.
- *8% of spending* targets Frontier Model Pre-training and AGI Research (concentrated in Hyperscalers: OpenAI, Google, Anthropic, Meta, and IndiaAI national compute hubs).
- *Core Career Takeaway*: Building reliable, low-latency, hallucination-free *applied AI systems* earns immediate high salaries, while theoretical AGI remains confined to PhD research labs.
"""
}
