#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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

#v(2.5pt)
== 24.3 Sovereign Cloud & The Edge AI Revolution

Geopolitical export controls have accelerated the deployment of Small Language Models (SLMs) on physical edge devices:
- *On-Device Neural Engines*: Apple Neural Engine (ANE), Qualcomm Snapdragon NPU, and Hailo-8 AI accelerators execute 3B–8B parameter models locally on smartphones, automobiles, and drones with zero internet connection.
- *Privacy & Sovereignty*: Edge models ensure patient health data, defense telemetry, and personal biometric credentials never leave device memory, completely immune to international cloud outages and foreign data subpoenas.

#v(2pt)
#tech-spotlight-box(title: "THE HARDWARE COST OF SOVEREIGNTY")[
  A sovereign nation or bank deploying an open-weights 70B model requires only 4x NVIDIA H100 GPUs to serve all internal banking and customer queries locally for 5 years, saving millions compared to recurring cloud API token subscriptions.
]

#v(2pt)
== 24.4 ASML EUV Lithography & Advanced CoWoS Packaging

The global AI hardware supply chain hinges on two acute physical bottlenecks:
- *ASML High-NA EUV*: Dutch machines utilizing 13.5nm extreme ultraviolet light reflected through Zeiss mirrors to etch 2nm transistor features. Each machine costs over \$350 million.
- *TSMC CoWoS (Chip-on-Wafer-on-Substrate)*: 2.5D packaging connecting GPU compute dies to HBM3e stacks via silicon interposers. Worldwide AI accelerator supply is constrained primarily by CoWoS capacity, not silicon wafer availability.

#v(2pt)
#concept-box(title: "CRITICAL MINERAL CHOKEPOINTS IN SEMICONDUCTOR SOVEREIGNTY")[
  AI hardware production requires rare elements subject to strict export licensing: Gallium and Germanium (for high-frequency power electronics) and Neodymium magnets for high-efficiency liquid cooling pumps.
]
