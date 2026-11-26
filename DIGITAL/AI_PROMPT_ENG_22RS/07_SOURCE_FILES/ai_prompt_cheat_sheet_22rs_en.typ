#set document(
  title: "RTechLab — AI Prompt Engineering, Generative AI & Agents Quick Desk Cheat Sheet (English)",
  author: "Rahul Patel — RTechLab Vocational Learning Systems",
)

#set page(
  paper: "a4",
  margin: (top: 9.5mm, bottom: 8mm, left: 8.5mm, right: 8.5mm),
  header-ascent: 2mm,
  footer-descent: 2mm,
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #set text(size: 7.2pt, fill: rgb("#475569"), font: "Segoe UI")
      #grid(
        columns: (1fr, auto),
        align: (left + bottom, right + bottom),
        [
          #box(
            fill: rgb("#0f172a"),
            inset: (x: 5pt, y: 2pt),
            radius: 2pt,
            text(fill: rgb("#ffffff"), weight: "bold", size: 6.8pt)[RTechLab]
          )
          #h(4pt)
          #text(weight: "bold", fill: rgb("#0f172a"))[AI Prompt Engineering & Generative AI]
          #text(fill: rgb("#64748b"))[ · 10-Page Quick Desk Reference (English)]
        ],
        [
          #text(fill: rgb("#7c3aed"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 Desk Edition]
        ]
      )
      #v(-3pt)
      #line(length: 100%, stroke: 0.6pt + rgb("#cbd5e1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
      #v(-2pt)
      #set text(size: 7pt, fill: rgb("#64748b"), font: "Segoe UI")
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [© RTechLab Original Edition · Learn · Practice · Automate · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[Page #p of 10]]]
      )
    ]
  }
)

#set text(font: "Segoe UI", size: 9.1pt, fill: rgb("#1e293b"))
#set par(leading: 0.78em, justify: false)

// --- HELPER COMPONENTS ---
#let section-banner(num, title, subtitle, bg: rgb("#0f172a"), accent: rgb("#7c3aed")) = {
  box(
    width: 100%,
    fill: bg,
    radius: 3.5pt,
    inset: (x: 9pt, y: 6pt),
    stroke: (left: 4.5pt + accent),
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      gutter: 7pt,
      box(fill: accent, radius: 2.5pt, inset: (x: 6pt, y: 3pt))[
        #text(fill: white, weight: "bold", size: 9pt)[#num]
      ],
      text(fill: white, weight: "bold", size: 10.6pt)[#title],
      text(fill: rgb("#c4b5fd"), size: 7.9pt, weight: "semibold")[#subtitle]
    )
  )
  v(7pt)
}

#let card(title, body, border: rgb("#cbd5e1"), head-bg: rgb("#f8fafc"), title-color: rgb("#0f172a"), pad: 10.5pt) = {
  box(
    width: 100%,
    fill: white,
    stroke: 0.65pt + border,
    radius: 4pt,
    [
      #box(
        width: 100%,
        fill: head-bg,
        inset: (x: 8pt, y: 4.8pt),
        stroke: (bottom: 0.5pt + border),
        radius: (top: 4pt),
        text(weight: "bold", size: 8.9pt, fill: title-color)[#title]
      )
      #box(width: 100%, inset: pad)[#body]
    ]
  )
}

#let cmd(code) = {
  box(
    fill: rgb("#0f172a"),
    inset: (x: 4.5pt, y: 2pt),
    radius: 2pt,
    text(font: "Consolas", size: 7.8pt, fill: rgb("#c4b5fd"))[#code]
  )
}

#let hl-y(t) = box(fill: rgb("#fef08a"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#713f12"))[#t])
#let hl-g(t) = box(fill: rgb("#dcfce7"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#14532d"))[#t])
#let hl-b(t) = box(fill: rgb("#dbeafe"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#1e3a8a"))[#t])
#let hl-p(t) = box(fill: rgb("#f3e8ff"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#581c87"))[#t])

#let did-you-know(fact) = {
  box(
    width: 100%,
    fill: rgb("#fffbeb"),
    stroke: (left: 4pt + rgb("#f59e0b"), rest: 0.6pt + rgb("#fde68a")),
    radius: 3.5pt,
    inset: (x: 8.5pt, y: 6.5pt),
    text(size: 8.4pt, fill: rgb("#78350f"))[
      *💡 Did You Know?* #fact
    ]
  )
}

#let tbl(cols, headers, rows, pad-y: 4.8pt, fsize: 8.1pt) = {
  set text(size: fsize)
  table(
    columns: cols,
    inset: (x: 5pt, y: pad-y),
    stroke: 0.45pt + rgb("#cbd5e1"),
    fill: (_, y) => if y == 0 { rgb("#0f172a") } else if calc.odd(y) { rgb("#ffffff") } else { rgb("#f8fafc") },
    ..headers.map(h => text(fill: white, weight: "bold", size: fsize)[#h]),
    ..rows.flatten()
  )
}

// =========================================================================
// PAGE 1: FULL-BLEED CUSTOM COVER ARTWORK
// =========================================================================
#page(margin: 0mm, header: none, footer: none)[
  #place(top + left)[
    #image("02_BRAND_ASSETS/ai_cover.jpg", width: 210mm, height: 297mm, fit: "cover")
  ]
]

#pagebreak()

// =========================================================================
// PAGE 2: AI LANDSCAPE 2026-27 & HOW LLMS ACTUALLY WORK
// =========================================================================
#section-banner("01", "AI LANDSCAPE & HOW LARGE LANGUAGE MODELS WORK", "AI → ML → DL → GenAI → Agentic AI · Tokens, Attention & Parameters")

#card(
  "How LLMs Process Your Prompt (End-to-End Transformer Pipeline)",
  [
    #align(center)[#image("02_BRAND_ASSETS/ai_llm_pipeline_visual.png", width: 100%)]
    #v(4pt)
    #set text(size: 8.9pt)
    - *Tokenization:* LLMs don't read words—they read *tokens* (~4 characters or 0.75 English words). `1,000 tokens ≈ 750 words`.
    - *Self-Attention:* Transformer layers calculate relationships between *every token* in your prompt simultaneously, resolving pronouns and context.
    - *Next-Token Prediction:* LLMs predict the probability of the next token one by one—better context in = dramatically smarter output out.
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(15.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "AI Hierarchy: From Traditional AI to Agentic AI",
    tbl(
      (auto, 1fr),
      ("Era / Layer", "What It Does & Real-World Example"),
      (
        ([*Narrow AI*], [Rule-based or task-specific systems (Chess engines, spam filters).]),
        ([*Machine Learning*], [Learns patterns from structured data (Regression, Random Forest).]),
        ([*Deep Learning*], [Multi-layer neural networks for images, speech & NLP.]),
        ([*Generative AI*], [Creates *new* text, code, images, audio & video (LLMs, Diffusion).]),
        ([*Multimodal AI*], [Understands Text + Image + Audio + Video natively (Gemini, GPT-4o).]),
        ([*Agentic AI*], [Plans, calls tools/APIs, writes & tests code autonomously (2026+).]),
      ),
      pad-y: 6.2pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "LLM Parameters Every Prompt Engineer Must Know",
    tbl(
      (auto, 1fr),
      ("Parameter", "Control Effect & Recommended Setting"),
      (
        ([*Temperature*], [`0.0–0.2`: Factual, coding, SQL · `0.7–1.0`: Brainstorming, copywriting.]),
        ([*Top-P (Nucleus)*], [Limits token pool to top cumulative probability (e.g. `0.9`).]),
        ([*Context Window*], [Max memory per chat (`128K` to `2M tokens`). Exceeding = forgetting!]),
        ([*Max Tokens*], [Hard cap on output length so API responses stay concise & cheap.]),
        ([*System Prompt*], [Hidden top-level instructions setting persona, rules & JSON format.]),
        ([*Stop Sequence*], [Custom string (e.g. `###`) that halts generation immediately.]),
      ),
      pad-y: 6.2pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(15.5pt)
#did-you-know[An LLM has *zero persistent memory* between separate API calls—every time you send a new message in a chat, the entire conversation history is re-sent inside the *Context Window*!]

#pagebreak()

// =========================================================================
// PAGE 3: MASTER PROMPT FRAMEWORKS & CORE TECHNIQUES
// =========================================================================
#section-banner("02", "MASTER PROMPT FRAMEWORKS & CORE TECHNIQUES", "RTF, CARE, CO-STAR, RISEN · Zero-Shot, Few-Shot, CoT & ReAct")

#card(
  "4 Proven Prompt Engineering Frameworks (Use Any for Instant 10x Output)",
  tbl(
    (auto, auto, 1fr),
    ("Framework", "Structure / Acronym", "Best Use Case & Quick Template"),
    (
      ([*RTF*], [#strong[R]ole · #strong[T]ask · #strong[F]ormat], [Daily tasks: _"Act as a Senior SQL Dev. Write a query for top 5 sales. Output as a markdown table."_]),
      ([*CARE*], [#strong[C]ontext · #strong[A]ction · #strong[R]esult · #strong[E]xample], [Business & emails: Give background, exact action, desired outcome, and 1 sample tone.]),
      ([*CO-STAR*], [#strong[C]ontext · #strong[O]bjective · #strong[S]tyle · #strong[T]one · #strong[A]udience · #strong[R]esponse], [Content, marketing & blogs: Controls audience level (e.g., beginner vs CTO) and exact format.]),
      ([*RISEN*], [#strong[R]ole · #strong[I]nstructions · #strong[S]teps · #strong[E]nd goal · #strong[N]arrowing], [Complex workflows: Break task into numbered steps + strict constraints ("No fluff, \<150 words").]),
    ),
    pad-y: 7pt,
    fsize: 8.9pt
  ),
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(12pt)

#card(
  "8 Essential Prompting Techniques (With Examples)",
  tbl(
    (auto, 1fr, 1fr),
    ("Technique", "How It Works", "When to Use It"),
    (
      ([*Zero-Shot*], [Direct instruction with zero examples (_"Translate this to Hindi"_).], [Simple summaries, translations, definitions.]),
      ([*Few-Shot*], [Provide 2–5 Input → Output examples before your actual query.], [Enforcing exact formatting, tone, or classification.]),
      ([*Chain-of-Thought (CoT)*], [Add _"Think step-by-step and show reasoning before final answer."_], [Math, logic puzzles, debugging, architecture design.]),
      ([*Tree-of-Thought (ToT)*], [Ask AI to generate 3 competing approaches, critique each, then pick best.], [Strategic decisions, system design, trade-off analysis.]),
      ([*Role / Persona*], [_"Act as a Google Principal Security Engineer reviewing this PR..."_], [Elevates vocabulary, rigor, and domain edge-cases.]),
      ([*Delimiters (`"""`, `###`)*], [Wrap raw text in XML `<data>...</data>` or triple quotes `"""`], [Prevents AI from confusing instructions with data.]),
      ([*Negative Constraints*], [Explicitly forbid unwanted behavior (_"Do NOT invent APIs or cite guesses"_).], [Cutting hallucinations and generic AI filler.]),
      ([*Self-Critique Loop*], [_"Review your answer for 3 flaws, then rewrite a stronger version."_], [Polishing resumes, essays, and production code.]),
    ),
    pad-y: 6.2pt,
    fsize: 8.8pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(12pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "❌ Weak Amateur Prompt",
    [
      #set text(size: 8.9pt)
      `"Write a Python script to scrape a website and save to Excel. Make it good."` \
      *Result:* Generic, outdated code, missing error handling, wrong library, no schema.
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "✅ Pro Engineered Prompt (RISEN)",
    [
      #set text(size: 8.9pt)
      `"Act as a Senior Python Dev. Fetch JSON from <URL> using requests + pandas, handle HTTP timeouts, export to out.xlsx. Output ONLY clean Python 3.12 code with docstrings."`
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(12pt)
#did-you-know[Simply adding *"Think step-by-step"* (Zero-Shot Chain-of-Thought) improved LLM accuracy on multi-step math & reasoning benchmarks from *17% to over 78%* in landmark Google Research tests!]

#pagebreak()

// =========================================================================
// PAGE 4: 25+ COPY-PASTE PRO PROMPTS (CAREER, CODING, STUDY & OFFICE)
// =========================================================================
#section-banner("03", "COPY-PASTE PRO PROMPTS VAULT", "Career, Coding, Study, Excel/SQL & Productivity Templates")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "1. Resume ATS Optimizer & Interview Coach",
    [
      #set text(size: 7.8pt)
      - *ATS Keyword Match:* `"Compare my resume [paste] against this JD [paste]. List top 10 missing keywords, rewrite 3 bullet points with measurable impact metrics, and score ATS match /100."`
      - *Mock Interviewer:* `"Act as a strict Hiring Manager for a [Role] interview. Ask me 1 technical question at a time. Wait for my answer, grade it /10, and show a 10/10 model answer."`
      - *Cold LinkedIn DM:* `"Write a 45-word LinkedIn message to a Hiring Manager at [Company] highlighting my [Project/Skill] without sounding desperate."`
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "2. Coding, Debugging & System Design",
    [
      #set text(size: 7.8pt)
      - *Root-Cause Debugger:* `"Here is my code [code] and error [traceback]. Explain the root cause in 2 lines, then provide the minimal fixed diff."`
      - *Code Reviewer:* `"Review this function for time/space complexity, SQL injection/XSS security risks, and edge cases. Suggest refactorings."`
      - *Architecture Planner:* `"Design a scalable backend for [App] handling 50K users. Compare SQL vs NoSQL, caching (Redis), and deployment cost."`
      - *Unit Test Generator:* `"Write 6 pytest unit tests covering normal, boundary, and failure cases for this function: [code]."`
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(4.8pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "3. Student Study, Exam Prep & Concept Mastery",
    [
      #set text(size: 7.8pt)
      - *Feynman 12-Year-Old Rule:* `"Explain [Complex Topic e.g. OSPF / Transformers] using a simple everyday Indian analogy, then give the technical definition."`
      - *Active Recall Quiz:* `"Turn these notes [paste] into 10 exam-style MCQs (4 options each) with an answer key and 1-line explanation at the bottom."`
      - *80/20 Study Plan:* `"I have 7 days to learn [Topic] for an exam. Build a day-by-day 2-hour/day roadmap focusing on the 20% topics that carry 80% marks."`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "4. Office, Excel Formulas, SQL & Business Writing",
    [
      #set text(size: 7.8pt)
      - *Excel / Sheets Wizard:* `"I need an Excel formula: if Col A is 'Paid' and Col B > 5000, apply 18% GST, else 0. Explain how it works."`
      - *SQL Query Builder:* `"Tables: Orders(id, cust_id, amount, date), Customers(id, city). Write a PostgreSQL query for top 3 cities by revenue in 2026."`
      - *Executive Email:* `"Rewrite this rough message [paste] into a polite, crisp 4-line corporate email with a clear Call-to-Action."`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(4.8pt)

#card(
  "5. Mega Meta-Prompt: Make AI Write the Perfect Prompt For You!",
  [
    #set text(size: 7.8pt)
    *Copy-Paste This Anytime:* #cmd("I want you to become my Expert Prompt Engineer. Your goal is to help me craft the best prompt for: [MY GOAL]. Ask me 3 clarifying questions first, then generate a structured CO-STAR prompt ready to copy-paste.") \
    #v(3pt)
    *Why It Works:* Instead of guessing what details the AI needs, the AI interviews *you* first and builds an optimized prompt automatically!
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(4.8pt)
#card(
  "6. AI Image Generation Prompts (Midjourney / Ideogram / Flux)",
  [
      #align(center)[#image("02_BRAND_ASSETS/ai_image_prompt_anatomy_visual.png", width: 88%)]
      #v(4pt)
      #set text(size: 7.7pt)
      - *4K Tech Poster / YouTube Thumbnail:* `"Futuristic Indian developer at glowing holographic dual-monitor desk, bold 3D text 'AI 2027', neon cyan & violet rim lighting, 85mm lens, ultra-detailed 8K --ar 16:9"`
      - *Minimal Vector Logo:* `"Flat minimalist geometric tech logo for 'RTechLab', neural circuit + shield icon, electric blue gradient on pure dark navy, vector SVG style --no photorealistic, mockup"`
      - *Studio Product Mockup:* `"Sleek matte-black wireless earbuds floating above dark basalt stone, soft studio key light, crisp water droplets, Apple commercial photography --ar 4:5"`
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(4.8pt)
#did-you-know[Using XML tags like `<context>...</context>` and `<rules>...</rules>` inside prompts is an official best practice for *Claude* and *GPT* models—it cleanly separates your instructions from pasted documents!]

#pagebreak()

// =========================================================================
// PAGE 5: TOP 2026-27 AI TOOLS ECOSYSTEM DIRECTORY
// =========================================================================
#section-banner("04", "TOP 2026–27 AI TOOLS ECOSYSTEM DIRECTORY", "LLMs, Coding IDEs, Research, Design, Video, Audio & Automation")

#card(
  "Must-Know AI Tools by Category (Direct URLs & Free Tier Guide)",
  tbl(
    (auto, auto, 1fr, auto),
    ("Category", "Tool Name", "Best Use Case & Why Pros Use It", "Website"),
    (
      ([*General LLM*], [*ChatGPT (GPT-4o/o3)*], [All-rounder reasoning, Voice mode, Canvas, Custom GPTs], [`chatgpt.com`]),
      ([*Coding/Writing*], [*Claude (Sonnet/Opus)*], [Best-in-class coding, Artifacts UI, natural human writing], [`claude.ai`]),
      ([*Multimodal/Docs*], [*Google Gemini*], [1M–2M context window, Workspace (Docs/Drive), YouTube/PDFs], [`gemini.google.com`]),
      ([*Live Research*], [*Perplexity AI*], [Real-time web search with clickable academic/news citations], [`perplexity.ai`]),
      ([*Open/Reasoning*], [*DeepSeek / Llama*], [High-performance open-weights reasoning & low-cost API], [`deepseek.com`]),
      ([*AI Code IDE*], [*Cursor / Antigravity*], [Agentic codebase editing, multi-file refactors, terminal execution], [`cursor.com`]),
      ([*UI Builder*], [*v0.dev / Bolt.new*], [Generate full React/Tailwind UI & live web apps from text], [`v0.dev`]),
      ([*Image Gen*], [*Midjourney / Ideogram*], [Photorealistic art (MJ) & accurate poster/logo text (Ideogram)], [`ideogram.ai`]),
      ([*Video Gen*], [*Runway / Veo / Kling*], [Text-to-video, image-to-video & AI motion editing], [`runwayml.com`]),
      ([*Voice / Audio*], [*ElevenLabs / Suno*], [Ultra-realistic multilingual voiceovers (Hindi/EN) & AI music], [`elevenlabs.io`]),
      ([*Study / Notes*], [*NotebookLM*], [Upload 50 PDFs → instant grounded Q&A + AI Audio Podcast], [`notebooklm.google`]),
      ([*Automation*], [*n8n / Make / Zapier*], [Connect Gmail, Sheets, WhatsApp & AI Agents visually], [`n8n.io`]),
    ),
    pad-y: 5.5pt,
    fsize: 7.9pt
  ),
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(14.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Local / Offline AI (Run LLMs Free on Your Own PC)",
    [
      #set text(size: 7.9pt)
      - *Ollama (`ollama.com`):* Run open-source LLMs (`Llama 3.2`, `Mistral`, `Qwen 2.5`, `DeepSeek-R1`) 100% offline with zero API cost: #cmd("ollama run llama3.2")
      - *LM Studio (`lmstudio.ai`):* User-friendly desktop GUI to download GGUF models and spin up a local OpenAI-compatible server (`localhost:1234`).
      - *Hardware Tip:* `7B–8B` quantized models run smoothly on 8 GB VRAM GPU or 16 GB RAM!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "How to Pick the Right AI Model (Quick Cheat)",
    [
      #set text(size: 7.9pt)
      - *Need cited facts from today's news?* → *Perplexity* or *Gemini*
      - *Writing clean full-stack code?* → *Claude* or *Cursor*
      - *Analyzing a 300-page PDF textbook?* → *NotebookLM* or *Gemini*
      - *Creating a poster with exact Hindi/English text?* → *Ideogram* or *Canva AI*
      - *Building automated WhatsApp/Email workflows?* → *n8n* + *OpenAI/Gemini API*
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(14.5pt)
#card(
  "Free vs Paid Production AI Tools Stack (Ship Real Apps)",
  [
    #tbl(
      (auto, 1fr, 1fr),
      ("Category", "Free / Open-Source (₹0 Start)", "Paid Production Pro"),
      (
        ([*LLM API*], [Google AI Studio, Groq, Ollama], [OpenAI GPT-4o, Anthropic Claude]),
        ([*Image / Design*], [Ideogram Free, Bing/Flux, Canva Free], [Midjourney (\$10/mo), Canva Pro]),
        ([*Video / Voice*], [Kling Free, Edge-TTS, CapCut], [Runway Gen-3, ElevenLabs (\$5/mo)]),
        ([*Hosting / DB*], [Vercel, Render, Supabase, ChromaDB], [AWS/GCP, Pinecone, Railway Pro]),
      ),
      pad-y: 5.5pt,
      fsize: 7.8pt
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(14.5pt)
#did-you-know[*NotebookLM* by Google only answers from the sources *you* upload—making it one of the best tools for students and researchers who want near-zero hallucinations with exact page citations!]

#pagebreak()

// =========================================================================
// PAGE 6: RAG (RETRIEVAL-AUGMENTED GENERATION) & VECTOR DATABASES
// =========================================================================
#section-banner("05", "RAG ARCHITECTURE & VECTOR DATABASES", "Grounding LLMs on Private Data · Embeddings, Chunking & Fine-Tuning")

#card(
  "RAG & Agentic AI Architecture Visual",
  [
    #align(center)[#image("02_BRAND_ASSETS/ai_rag_agents_visual.png", width: 100%)]
    #v(4pt)
    #set text(size: 8.8pt)
    *Why RAG?* LLMs have a static training cutoff and don't know your company PDFs or private database. *RAG* retrieves relevant chunks at query time and injects them into the prompt so the LLM answers with facts + citations!
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(38pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "5 Steps to Build a Production RAG Pipeline",
    [
      #set text(size: 8.9pt)
      1. *Load & Parse:* Extract clean text from PDFs, Docs, Notion, or SQL (`PyMuPDF`, `Unstructured`).
      2. *Chunking:* Split text into `400–800 token` chunks with `10–20% overlap` so sentences aren't cut mid-thought.
      3. *Embed:* Convert each chunk into a numeric vector (`text-embedding-3-small`, `BGE`, `Nomic`).
      4. *Store & Search:* Save vectors in *Pinecone, ChromaDB, Qdrant, Weaviate, or pgvector*; retrieve Top-K via *Cosine Similarity* + *Hybrid BM25* keyword search.
      5. *Generate:* Pass Top-K chunks + user query to LLM with _"Answer ONLY from provided context."_
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Prompting vs RAG vs Fine-Tuning (Interview Classic)",
    tbl(
      (auto, 1fr, auto),
      ("Approach", "Best When You Need...", "Cost / Effort"),
      (
        ([*Prompt Eng.*], [Better format, logic, tone, or quick tasks], [Lowest (Minutes)]),
        ([*RAG*], [Up-to-date facts, private PDFs, citations], [Medium (Hours–Days)]),
        ([*Fine-Tuning*], [Specialized style, medical/legal jargon, tiny fast model], [High (GPU + Dataset)]),
      ),
      pad-y: 8.5pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(38pt)
#did-you-know[Hybrid Search (combining *Vector Semantic Search* + *BM25 Keyword Search*) + a *Cross-Encoder Reranker* (like Cohere Rerank) typically boosts RAG accuracy by *15–30%* over basic vector search alone!]

#pagebreak()

// =========================================================================
// PAGE 7: AGENTIC AI, TOOL CALLING & MCP (MODEL CONTEXT PROTOCOL)
// =========================================================================
#section-banner("06", "AGENTIC AI, FUNCTION CALLING & MCP", "Autonomous Workflows · ReAct Loop, Frameworks & Structured JSON")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "What Makes an AI an 'Agent'? (4 Core Pillars)",
    [
      #set text(size: 8.9pt)
      Unlike a normal chatbot (1 prompt → 1 reply), an *AI Agent* loops until the goal is achieved:
      1. *Planning (Reasoning):* Breaks a big goal into sub-tasks (*ReAct*: Reason → Act → Observe).
      2. *Tool / Function Calling:* LLM outputs structured JSON calling external APIs (Web Search, SQL, Python, Email, Slack).
      3. *Memory:* *Short-term* (context window) + *Long-term* (Vector DB / user preferences across sessions).
      4. *Reflection / Critic:* Checks its own output, catches errors, and retries before replying.
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "MCP (Model Context Protocol) — The 'USB-C' of AI",
    [
      #set text(size: 8.9pt)
      - *The Problem:* Previously, connecting 5 AI apps to 10 tools (GitHub, Drive, Slack, Postgres) required 50 custom integrations.
      - *The MCP Solution (Anthropic, open standard):* A universal protocol where tools expose *Tools* (actions), *Resources* (files/data), and *Prompts* to any MCP-compatible AI client (Claude, Cursor, Antigravity, VS Code).
      - *Real Benefit:* Write 1 MCP server for your database or CRM, and every AI agent can securely query it!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  )
)

#v(17pt)

#card(
  "2026–27 Agentic AI Frameworks & Orchestration Comparison",
  tbl(
    (auto, auto, 1fr, auto),
    ("Framework", "Language", "Core Strength & Ideal Use Case", "Complexity"),
    (
      ([*LangGraph*], [Python / JS], [Stateful cyclic graphs, human-in-the-loop, production reliability], [Medium–High]),
      ([*CrewAI*], [Python], [Role-playing multi-agent teams (Researcher + Writer + Reviewer)], [Low–Medium]),
      ([*LlamaIndex*], [Python / TS], [Document-heavy RAG pipelines & enterprise data connectors], [Medium]),
      ([*AutoGen*], [Python], [Multi-agent code execution & conversational problem solving], [Medium]),
      ([*n8n AI Agent*], [Visual / No-Code], [Drag-and-drop triggers (Webhook, Gmail, WhatsApp) + LLM + Tools], [Beginner-Friendly]),
    ),
    pad-y: 6.4pt,
    fsize: 8.8pt
  ),
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(17pt)

#card(
  "Structured Outputs (JSON Schema) — Never Parse Messy Text Again!",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        *Why Structured Outputs?* In real apps, you don't want a paragraph—you want guaranteed JSON keys (`{"sentiment": "positive", "score": 92}`) that never break `JSON.parse()`.
      ],
      [
        #set text(size: 8.9pt)
        *How:* Pass `response_format={"type": "json_schema", ...}` (OpenAI/Gemini) or Pydantic models—the LLM is constrained at the token level to emit valid JSON 100% of the time!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(17pt)
#card(
  "Function Calling JSON Schema Example (How Agents Use Tools)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        ```json
        {
          "name": "get_order_status",
          "parameters": {
            "order_id": "ORD-9042",
            "include_tracking": true
          }
        }
        ```
      ],
      [
        #set text(size: 8.9pt)
        *How It Works:*
        1. You give the LLM a list of tool schemas (`get_order_status`, `send_email`).
        2. LLM never executes code directly—it returns this JSON.
        3. Your backend runs the function and feeds the result back to the LLM to craft the final reply!
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(17pt)
#did-you-know[Single-agent prompts with good *Tool Calling* & *Structured JSON* beat complex multi-agent swarms 80% of the time in production—always start simple before adding multiple agents!]

#pagebreak()

// =========================================================================
// PAGE 8: AI FOR CODING, DATA ANALYTICS & AUTOMATION (HANDS-ON)
// =========================================================================
#section-banner("07", "AI FOR CODING, DATA ANALYTICS & AUTOMATION", "Python LLM APIs, SQL/Pandas Copilot, Vibe Coding & n8n Workflows")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Python LLM API Quickstart (OpenAI / Gemini SDK)",
    [
      #set text(size: 8.8pt)
      ```python
      from openai import OpenAI
      client = OpenAI() # reads OPENAI_API_KEY

      resp = client.chat.completions.create(
        model="gpt-4o-mini",
        temperature=0.2,
        messages=[
          {"role": "system", "content": "Be concise."},
          {"role": "user", "content": "Explain VLANs."}
        ]
      )
      print(resp.choices[0].message.content)
      ```
      *Cost Tip:* Use `gpt-4o-mini` / `gemini-2.5-flash` for 90% of tasks (~20x cheaper than flagship models!).
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "No-Code AI Automation Blueprint (n8n / Make)",
    [
      #set text(size: 8.9pt)
      *Example: Auto-Reply Support & Lead Tracker (15 mins to build):*
      1. *Trigger:* New WhatsApp / Gmail / Google Form submission arrives.
      2. *AI Classifier Node:* LLM classifies intent (`Sales`, `Support`, `Spam`) + extracts Name, City, Need as JSON.
      3. *Database Node:* Appends clean row to Google Sheets / Airtable / Notion.
      4. *Action Node:* Sends instant personalized reply or pings your Telegram/Slack for hot leads!
      *ROI:* Saves 2–3 hours/day for freelancers, institutes & SMBs.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(15.5pt)

#card(
  "AI-Augmented Data Analytics & 'Vibe Coding' Best Practices",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        *Data Analytics 3x Faster:*
        - Upload CSV to ChatGPT/Claude Advanced Data Analysis → auto-cleans nulls, plots charts, finds outliers.
        - Generate complex *Power BI DAX* measures & *SQL Window Functions* (`RANK()`, `LEAD()`, `CTE`) in seconds.
        - *Golden Rule:* Never upload sensitive customer PII/passwords to public web chats—use anonymized sample headers!
      ],
      [
        #set text(size: 8.9pt)
        *Pro 'Vibe Coding' Workflow (Cursor / Antigravity):*
        - *1. Spec First:* Ask AI to write a 5-step plan before touching code.
        - *2. Small Diffs:* Build 1 feature/component at a time and test immediately.
        - *3. Context Files:* Keep a `README.md` or `.cursorrules` with stack rules so AI never hallucinates wrong libraries.
        - *4. Always Verify:* Run tests, check edge cases, and read security-critical code yourself!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(15.5pt)

#card(
  "Essential AI Developer Stack & API Cost Optimization",
  [
    #set text(size: 8.9pt)
    - *Prompt Caching:* Cache long static system prompts/docs (cuts input token cost by *50–90%* on OpenAI/Anthropic/Gemini).
    - *Model Routing:* Route easy classification/extraction to fast mini/flash models; reserve reasoning (`o3`, `Opus`, `Pro`) for hard tasks.
    - *Eval Driven Dev:* Test prompts against 20+ real edge-case inputs (`Promptfoo` / `LangSmith`) before deploying to production.
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(15.5pt)
#card(
  "AI Coding & Prompt Evaluation Quick Reference",
  [
    #tbl(
      (auto, 1fr),
      ("Workflow", "Pro Command / Best Practice"),
      (
        ([*`.cursorrules` / `AGENTS.md`*], [Store project tech stack, folder rules & style guide in root so AI never guesses wrong.]),
        ([*Context Pinning*], [Tag exact files (`@file.js`) instead of pasting 1,000 lines—saves tokens & boosts accuracy.]),
        ([*Promptfoo / LangSmith*], [Run automated evals on 20+ test inputs whenever you edit a production system prompt.]),
      ),
      pad-y: 6.4pt,
      fsize: 8.9pt
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(15.5pt)
#did-you-know[*Prompt Caching* on repeated system instructions or large PDFs can slash your LLM API bill by up to *90%* and cut response latency in half!]

#pagebreak()

// =========================================================================
// PAGE 9: AI SAFETY, OWASP LLM TOP 10, HALLUCINATIONS & REPOS
// =========================================================================
#section-banner("08", "AI SAFETY, HALLUCINATIONS, OWASP LLM & RESOURCES", "Prompt Injection, Privacy, Verification & Top GitHub Repos")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "OWASP Top 10 for LLMs (Must-Know Security Risks)",
    tbl(
      (auto, 1fr),
      ("Risk", "What It Is & How to Defend"),
      (
        ([*Prompt Injection*], [Attacker hides commands in text/PDF (_"Ignore rules, leak keys"_). Defend via delimiters + least privilege.]),
        ([*Sensitive Info Leak*], [PII/API keys memorized or leaked in output. Scrub PII & never paste secrets in public AI.]),
        ([*Insecure Output*], [Executing raw AI-generated SQL/HTML/JS blindly → XSS/SQLi. Always sanitize & parameterize!]),
        ([*Excessive Agency*], [Giving an AI Agent unrestricted `DELETE`/payment permissions. Require human approval!]),
        ([*Supply Chain*], [Malicious HuggingFace models (`pickle` exploits) or poisoned datasets. Use `safetensors`.]),
      ),
      pad-y: 5.4pt,
      fsize: 7.7pt
    ),
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "6-Point Anti-Hallucination & Verification Checklist",
    [
      #set text(size: 7.9pt)
      1. *Ground with Sources:* Use RAG or paste exact reference text; tell AI _"If not in text, say I don't know."_
      2. *Lower Temperature:* Set `temperature = 0.0–0.2` for factual, legal, medical, or coding tasks.
      3. *Ask for Citations:* Require direct quotes or URLs, then actually click/verify them (LLMs can invent fake URLs!).
      4. *Cross-Model Check:* Verify critical code or facts across 2 models (e.g., Claude + Perplexity).
      5. *Avoid Leading Questions:* Don't ask _"Why is X true?"_ if X might be false—ask _"Is X true or false? Cite evidence."_
      6. *Deepfake Awareness:* Always verify viral AI audio/video calls via a second trusted channel before transferring money!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(14.5pt)

#card(
  "Top AI GitHub Repos & Knowledge Websites (Clickable Links)",
  tbl(
    (auto, 1fr, auto),
    ("Resource / Repo", "What You Gain", "Direct Link"),
    (
      ([*Awesome ChatGPT Prompts*], [1000+ community-tested role prompts], [#link("https://github.com/f/awesome-chatgpt-prompts")[`github.com/f/awesome-chatgpt-prompts`]]),
      ([*Awesome LLM Apps*], [Ready RAG, AI Agent & Voice Agent code], [#link("https://github.com/Shubhamsaboo/awesome-llm-apps")[`github.com/Shubhamsaboo/awesome-llm-apps`]]),
      ([*MS GenAI Beginners*], [18-lesson Microsoft open-source AI course], [#link("https://github.com/microsoft/generative-ai-for-beginners")[`github.com/microsoft/generative-ai...`]]),
      ([*n8n / Dify / Ollama*], [Self-host AI agents, workflows & local LLMs], [#link("https://github.com/n8n-io/n8n")[`github.com/n8n-io/n8n`]]),
      ([*PromptingGuide + DeepLearning*], [Official prompt engineering & free courses], [#link("https://www.promptingguide.ai")[`promptingguide.ai`] · #link("https://www.deeplearning.ai")[`deeplearning.ai`]]),
      ([*HuggingFace + Kaggle + ArXiv*], [Open models, datasets, competitions & papers], [#link("https://huggingface.co")[`huggingface.co`] · #link("https://www.kaggle.com/learn")[`kaggle.com/learn`]]),
      ([*Futurepedia / TAAFT*], [Daily directory of 10,000+ new AI tools], [#link("https://www.futurepedia.io")[`futurepedia.io`] · #link("https://theresanaiforthat.com")[`theresanaiforthat.com`]]),
    ),
    pad-y: 5.4pt,
    fsize: 7.6pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(14.5pt)
#card(
  "2026–27 High-Paying AI Career Tracks & Portfolio Blueprint (India)",
  [
    #tbl(
      (auto, 1fr, 1fr),
      ("Role", "Core Stack to Learn", "Must-Build Portfolio Project"),
      (
        ([*GenAI / RAG Dev*], [Python, FastAPI, Vector DB, LangGraph, OpenAI/Gemini], [PDF/SQL Q&A Chatbot with Citations & Eval]),
        ([*AI Automation Eng.*], [n8n, Make, Webhooks, REST APIs, WhatsApp/Sheets], [Automated Lead Qualifier + CRM Sync Bot]),
        ([*AI Security Analyst*], [OWASP LLM Top 10, Red Teaming, Garak, Guardrails], [Prompt Injection Scanner & Guardrail Proxy]),
      ),
      pad-y: 5.4pt,
      fsize: 7.9pt
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(14.5pt)
#did-you-know[Even top AI models can invent *non-existent Python/npm package names*—attackers actually register those hallucinated package names on PyPI/npm (*"Slopsquatting"*) to infect careless developers!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 AI INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "TOP 10 AI INTERVIEW Q&A & RTECHLAB AUTHOR PROFILE", "GenAI / AI Engineer Prep · Credentials, Motto & Direct Support")

#card(
  "Top 10 AI & Prompt Engineering Interview Questions",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.7pt)
        *1. What is a Token?* Subword unit (~4 chars) that LLMs read/generate and bill by; `1K tokens ≈ 750 words`. \
        *2. Temperature vs Top-P?* Temperature scales randomness (`0` = deterministic); Top-P limits candidate tokens to top cumulative probability. \
        *3. Zero-Shot vs Few-Shot?* Zero-shot gives no examples; Few-shot gives 2–5 examples to lock format/logic. \
        *4. What is Chain-of-Thought?* Prompting step-by-step reasoning before the final answer to cut logic errors. \
        *5. RAG vs Fine-Tuning?* RAG injects live/private facts at query time; Fine-tuning teaches style/behavior into weights.
      ],
      [
        #set text(size: 8.7pt)
        *6. Why Chunk Overlap in RAG?* Prevents losing context when a sentence/concept spans across chunk boundaries. \
        *7. What is Hallucination?* Confident, fluent fabrication by an LLM; mitigated via RAG, `temp=0`, and strict grounding. \
        *8. What is Prompt Injection?* Untrusted user/doc text overriding system instructions; mitigated via delimiters & least privilege. \
        *9. What is an AI Agent?* An LLM with planning (ReAct), memory, and tool-calling loops to complete multi-step goals. \
        *10. What is MCP?* Model Context Protocol — open standard connecting AI clients cleanly to external tools & data.
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(28pt)

// AUTHOR & RTECHLAB MOTTO BLOCK
#box(
  width: 100%,
  fill: rgb("#0f172a"),
  radius: 4.5pt,
  inset: 9pt,
  stroke: 1.2pt + rgb("#7c3aed"),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 9pt,
      align: (center + horizon, left + horizon),
      box(
        radius: 4pt,
        clip: true,
        stroke: 1.8pt + rgb("#c4b5fd"),
        image("02_BRAND_ASSETS/rahul-patel.jpg", width: 33mm)
      ),
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          [
            #text(fill: rgb("#c4b5fd"), size: 11.2pt, weight: "bold")[Rahul Patel]
            #h(6pt)
            #box(fill: rgb("#7c3aed"), radius: 2pt, inset: (x: 5pt, y: 2pt))[
              #text(fill: white, size: 7.2pt, weight: "bold")[Founder & Systems Architect, RTechLab]
            ]
          ],
          image("02_BRAND_ASSETS/rtechlab-header-logo.png", width: 32mm)
        )
        #v(3.5pt)
        #text(fill: rgb("#e2e8f0"), size: 8.7pt)[
          *Credentials & Practical Track:* #hl-p("AI Systems & Automation Architect") · #hl-b("CEH (EC-Council)") · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · Director & Lead IT Trainer, IANT Computer Education, Palanpur · *10+ Years IT Experience · 3,000+ Students Trained*.
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8.8pt)[
            *Our RTechLab Motto:* _"Technology Made Practical — Learn, Practice & Automate. AI won't replace you, but a person using AI with strong fundamentals will. Built in India so every student gets ₹2,200-grade clarity for ₹22."_
          ]
        )
      ]
    )
  ]
)

#v(28pt)

// 4 SCANNABLE QR CODES
#card(
  "Scan & Connect with RTechLab Ecosystem (Free AI Labs, Tools & Updates)",
  [
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 7pt,
      align: center,
      [
        #image("02_BRAND_ASSETS/qr_rahul_portfolio.png", width: 33mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[RTechLab & Tools] \
        #link("https://rtechlab.com/tools")[#text(size: 7pt, fill: rgb("#7c3aed"))[rtechlab.com/tools]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", width: 33mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[YouTube Labs] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 7pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 33mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[Instagram Reels] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily AI Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 33mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp Channel] \
        #link("https://wa.me/917646892094")[#text(size: 7pt, fill: rgb("#16a34a"))[Job & Note Alerts]]
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(28pt)

// WHATSAPP HELP DESK CTA
#box(
  width: 100%,
  fill: rgb("#dcfce7"),
  stroke: 1.2pt + rgb("#16a34a"),
  radius: 4.5pt,
  inset: (x: 9pt, y: 7pt),
  grid(
    columns: (auto, 1fr, auto),
    gutter: 9pt,
    align: (left + horizon, left + horizon, right + horizon),
    image("02_BRAND_ASSETS/whatsapp_logo.svg", width: 10mm),
    [
      #text(size: 9.2pt, weight: "bold", fill: rgb("#14532d"))[RTechLab Student Help Desk & Career Guidance] \
      #text(size: 7.8pt, fill: rgb("#166534"))[Need help with AI Projects, RAG, n8n Automation, or Tech Career Roadmap? Message us on WhatsApp!]
    ],
    link("https://wa.me/917646892094")[
      #box(
        fill: rgb("#16a34a"),
        radius: 3.5pt,
        inset: (x: 9pt, y: 5.5pt),
        text(fill: white, weight: "bold", size: 9pt)[WhatsApp: +91 76468 92094]
      )
    ]
  )
)
