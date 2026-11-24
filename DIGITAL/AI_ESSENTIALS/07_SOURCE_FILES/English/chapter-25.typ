#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
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

#v(2.5pt)
== 25.3 Sovereign Compute Deployment Roadmap

The IndiaAI Mission establishes a distributed high-performance computing tier:
- *Tier-1 Centers*: National Supercomputing Mission facilities housing 1,000+ GPU supernodes for academic and defense foundation model pre-training.
- *Tier-2 Incubation*: Subsidized GPU cloud access for qualified deep-tech startups via national credit vouchers, lowering entry barriers for Indian innovators.
