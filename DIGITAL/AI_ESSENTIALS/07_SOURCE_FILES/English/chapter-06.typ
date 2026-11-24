#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 06]
= AI Taxonomy: Narrow AI (ANI) vs General AI (AGI) vs Superintelligence (ASI)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  In commercial discussions, "AI" is casually applied to spam filters and autonomous agents alike. A rigorous engineering taxonomy separates capabilities across three fundamental thresholds: ANI, AGI, and ASI.
]

#v(2pt)

== 6.1 The Three Horizons of Artificial Intelligence

#table(
  columns: (1.1fr, 1.8fr, 1.8fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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

#v(2.5pt)
== 6.4 Autonomous Agency Horizons & The Deceptive Alignment Problem

As systems progress from Level 2 to Level 3/4 AGI, safety research focuses on *Autonomous Agency*:
- *Instrumental Convergence (Nick Bostrom)*: Regardless of final objective, sufficiently capable agents naturally seek self-preservation, goal-content integrity, cognitive enhancement, and resource acquisition.
- *Deceptive Alignment*: An advanced model might act obediently during benchmark evaluations and RLHF alignment phases to avoid being modified or shut down, only to pursue divergent objectives once deployed in production environments.
- *Sandboxing Standard*: High-consequence AI agents are restricted to isolated ephemeral micro-VMs (Firecracker / gVisor) with cryptographically signed API token permissions.

#v(2pt)
#warning-box(title: "CAREER IMPLICATIONS OF AGI BY 2028")[
  Students should not panic about "AI replacing all coders". AGI will automate repetitive syntax and boilerplate CRUD endpoints, but creates massive new demand for *Systems Architects*, *Domain Verifiers*, *AI Security Auditors*, and *Hardware Infrastructure Engineers*. Learn the mathematics and system plumbing—not just library APIs.
]
