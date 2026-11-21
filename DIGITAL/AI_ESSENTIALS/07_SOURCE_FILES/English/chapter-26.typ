#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

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
  - *Conversational UPI Payments*: Voice-activated peer-to-peer money transfers in local dialects (`"Ramesh ko 500 rupaye bhejo"`).
  - *Aadhaar-Authenticated Welfare*: AI voicebots assisting rural citizens in applying for PM-Kisan and healthcare subsidies without literacy barriers.
  - *Open Network for Digital Commerce (ONDC)*: Multilingual AI agents negotiating commerce and logistics across distributed small merchants.
]
#v(2pt)

== 26.2 Tokenization Inefficiencies in Indian Languages

A critical technical challenge facing Indic AI is token inflation:
- Standard English tokenizers represent English words in 1–2 tokens.
- Devanagari, Tamil, and Bengali scripts are split by English-centric tokenizers into individual Unicode byte sequences, requiring *3x to 6x more tokens per sentence*.
- This makes training and inferencing 5x more expensive for Indian users. Indic innovations (such as Sarvam's custom Indic tokenizer) cut token expansion ratios down to parity with English, slashing compute costs by 60%.

#v(2.5pt)
== 26.3 India's DPI AI Stack: ONDC, Aadhaar & DigiLocker

India's Digital Public Infrastructure (DPI) provides an unmatched foundation for agentic AI:
- *Aadhaar Face Auth AI*: Executes biometric liveness detection and facial embedding matching on over 1.4 billion citizens for instant, fraud-proof digital KYC.
- *ONDC (Open Network for Digital Commerce)*: Open protocols enable conversational AI buyer agents to discover products, negotiate delivery, and execute UPI micropayments across millions of neighborhood kirana stores without centralized marketplace platform fees.

#v(2pt)
#tech-spotlight-box(title: "BHASHINI OPEN API INTEGRATION FOR DEVELOPERS")[
  Indian developers can query Bhashini's national APIs for free via ULCA (Universal Language Contribution API), enabling speech-to-text, translation, and text-to-speech across all 22 scheduled Indian languages inside commercial apps.
]

#v(2pt)
== 26.4 The Indic Token Tax & Tokenizer Efficiency Crisis

Standard western tokenizers (GPT-4, Claude) split Hindi words into 3 to 6 fragmented byte-pair tokens, making Indic inference *3x to 5x more expensive and slower*:
- Western Tokenizer: `"नमस्ते"` -> 6 tokens (`[224, 164, 168, 224, 164, 174...]`).
- Native Indic Tokenizer (Bhashini / Sarvam): `"नमस्ते"` -> 1 single dedicated token.
- *Enterprise Impact*: Pre-training on native Indic tokenizers cuts cloud API costs by 70% while drastically improving grammatical generation fidelity.

#v(2pt)
#tech-spotlight-box(title: "QUICK PYTHON CALL TO BHASHINI ASR (SPEECH-TO-TEXT)")[
  Submit an audio payload to `https://dhruva-api.bhashini.gov.in/services/inference/asr` with header `ulcaApiKey: {YOUR_KEY}` and language `"hi"` to transcribe Hindi speech in real time with 94%+ accuracy.
]
