#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 6: TOP 50 MNC INTERVIEW VAULT & ETHICS · CHAPTER 41]
= AI Safety, Ethics & Global Governance: The EU AI Act

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  As artificial intelligence systems gain autonomous decision-making power, legal and ethical governance frameworks have transitioned from voluntary corporate guidelines to enforceable international law.
]

#v(2pt)

== 41.1 The European Union AI Act: Risk-Based Regulatory Tiers

The *EU AI Act (2024–2026)* is the global benchmark for AI regulation (analogous to GDPR for data privacy). It classifies AI into 4 risk tiers:

#table(
  columns: (1fr, 1.6fr, 2.4fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Risk Tier*], [*System Category*], [*Mandatory Compliance Obligations*], [*Legal Penalty*]),
  [Unacceptable Risk], [Cognitive behavioral manipulation, social scoring, biometric mass surveillance.], [*Strictly Prohibited*. Illegal to develop or deploy within the EU.], [Fines up to €35M or 7% global turnover],
  [High Risk], [Critical infrastructure, medical devices, hiring algorithms, credit scoring, law enforcement.], [Mandatory risk assessment, high-quality training data, logging, human oversight, transparency.], [Strict pre-market conformity audits],
  [Specific Transparency (GenAI)], [Chatbots, deepfakes, AI-generated synthetic media.], [Must disclose to users that content is AI-generated; copyright compliance disclosures.], [Mandatory synthetic watermarking],
  [Minimal / Low Risk], [Spam filters, AI-powered video games, inventory forecasting.], [No new legal requirements; voluntary adherence to industry codes of conduct.], [Unregulated]
)

#v(2pt)
#concept-box(title: "COPYRIGHT & THE FAIR USE CONTROVERSY")[
  Training frontier models on copyrighted public internet data without creator consent is subject to historic legal litigation (e.g. *New York Times vs OpenAI*). The emerging 2027 legal consensus mandates:
  1. Opt-out mechanisms (via `robots.txt` and machine-readable metadata) for content creators.
  2. Public licensing frameworks where model builders pay revenue royalties to media consortiums.
]
#v(2pt)

== 41.2 Frontier AI Safety: AGI Alignment & Mechanistic Interpretability
- *The Alignment Problem*: Ensuring advanced autonomous systems act in accordance with human intent without deceptive reward hacking.
- *Mechanistic Interpretability*: Pioneered by Anthropic (Mapping the Mind of a Model), researchers reverse-engineer internal neural network activations into human-interpretable "dictionary features" (e.g. locating the specific neurons representing deceit or nuclear weapons synthesis).

#v(2.5pt)
== 41.3 Watermarking Synthetic Content: C2PA & SynthID

To combat malicious deepfakes, global standards enforce cryptographically verifiable provenance:
- *Coalition for Content Provenance and Authenticity (C2PA)*: Embeds tamper-evident digital metadata into media headers, recording origin and cryptographic keys.
- *Steganographic Latent Watermarking (SynthID)*: Developed by Google DeepMind. Injects imperceptible modifications directly into generated latents or token probability distributions, surviving cropping and compression.

#v(2pt)
#table(
  columns: (1.2fr, 1.8fr, 2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Jurisdiction*], [*Primary Legislative Act*], [*Key Governance Mandate*], [*Stance on Innovation*]),
  [European Union], [EU AI Act (2024)], [Strict risk classification (Unacceptable to Minimal); heavy fines up to 7% turnover.], [Precautionary / Restrictive],
  [United States], [White House Executive Order 14110], [Mandatory safety reporting for dual-use models trained on $> 10^(26)$ FLOPs.], [Pro-Innovation / Defense],
  [India], [DPDP Act + IndiaAI], [Data consent frameworks, sovereign compute subsidies, non-punitive startup support.], [Democratized / Pro-Growth],
  [China], [Generative AI Service Measures], [Mandatory security assessments and alignment with core socialist values.], [State-Guided Development]
)
