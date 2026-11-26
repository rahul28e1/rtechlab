#set document(
  title: "RTechLab — AI Prompt Engineering, Generative AI & Agents Quick Desk Cheat Sheet (Gujarati)",
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
      #set text(size: 7.2pt, fill: rgb("#475569"), font: ("Nirmala UI", "Segoe UI"))
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
          #text(fill: rgb("#64748b"))[ · 10-પેજ ક્વિક ડેસ્ક ગાઈડ (ગુજરાતી આવૃત્તિ)]
        ],
        [
          #text(fill: rgb("#7c3aed"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 ડેસ્ક એડિશન]
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
      #set text(size: 7pt, fill: rgb("#64748b"), font: ("Nirmala UI", "Segoe UI"))
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [© RTechLab Original Edition · શીખો · પ્રેક્ટિસ કરો · ઓટોમેટ કરો · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[પેજ #p / 10]]]
      )
    ]
  }
)

#set text(font: ("Nirmala UI", "Segoe UI"), size: 9pt, fill: rgb("#1e293b"))
#set par(leading: 0.82em, justify: false)

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
      text(fill: white, weight: "bold", size: 10.4pt)[#title],
      text(fill: rgb("#c4b5fd"), size: 7.8pt, weight: "semibold")[#subtitle]
    )
  )
  v(10pt)
}

#let card(title, body, border: rgb("#cbd5e1"), head-bg: rgb("#f8fafc"), title-color: rgb("#0f172a"), pad: 11pt) = {
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
        text(weight: "bold", size: 8.8pt, fill: title-color)[#title]
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
    text(size: 8.3pt, fill: rgb("#78350f"))[
      *💡 શું તમે જાણો છો?* #fact
    ]
  )
}

#let tbl(cols, headers, rows, pad-y: 5.5pt, fsize: 8.2pt) = {
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
// PAGE 2: AI LANDSCAPE 2026-27 & HOW LLMS WORK
// =========================================================================
#section-banner("01", "AI પરિદ્રશ્ય અને LLM કેવી રીતે કામ કરે છે", "AI → ML → DL → GenAI → Agentic AI · ટોકન, અટેન્શન અને પેરામીટર્સ")

#card(
  "LLM તમારા પ્રોમ્પ્ટને કેવી રીતે પ્રોસેસ કરે છે (Transformer પાઇપલાઇન)",
  [
    #align(center)[#image("02_BRAND_ASSETS/ai_llm_pipeline_visual.png", width: 100%)]
    #v(4pt)
    #set text(size: 8.9pt)
    - *Tokenization:* LLM આખા શબ્દો નહીં પરંતુ *ટોકન* (~4 અક્ષર કે 0.75 શબ્દ) વાંચે છે. `1,000 tokens ≈ 750 words`.
    - *Self-Attention:* ટ્રાન્સફોર્મર લેયર્સ એક સાથે આખા પ્રોમ્પ્ટના શબ્દોનો પરસ્પર સંબંધ સમજે છે.
    - *Next-Token Prediction:* LLM એક-એક કરીને આગલા સૌથી શ્રેષ્ઠ ટોકનનું અનુમાન લગાવે છે — સારું કોન્ટેક્સ્ટ = 10x સારું પરિણામ.
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(24pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "AI શ્રેણી: સામાન્ય AI થી Agentic AI સુધી",
    tbl(
      (auto, 1fr),
      ("સ્તર / યુગ", "તે શું કરે છે અને વાસ્તવિક ઉદાહરણ"),
      (
        ([*Narrow AI*], [નિયમ-આધારિત કે એક કામ માટે બનેલી સિસ્ટમ (ચેસ એન્જિન, સ્પામ ફિલ્ટર).]),
        ([*Machine Learning*], [ડેટામાંથી પેટર્ન શીખે છે (Regression, Random Forest).]),
        ([*Deep Learning*], [ઇમેજ, અવાજ અને ભાષા સમજવા માટે મલ્ટી-લેયર ન્યુરલ નેટવર્ક.]),
        ([*Generative AI*], [*નવું* ટેક્સ્ટ, કોડ, ઇમેજ, ઓડિયો અને વીડિયો બનાવે છે (LLMs, Diffusion).]),
        ([*Multimodal AI*], [ટેક્સ્ટ + ઇમેજ + ઓડિયો + વીડિયો એક સાથે સમજે છે (Gemini, GPT-4o).]),
        ([*Agentic AI*], [જાતે પ્લાન બનાવે છે, ટૂલ્સ/APIs ચલાવે છે અને કોડ ટેસ્ટ કરે છે (2026+).]),
      ),
      pad-y: 6.5pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "LLM ના 6 મહત્વના પેરામીટર્સ (પ્રોમ્પ્ટ એન્જિનિયરિંગ)",
    tbl(
      (auto, 1fr),
      ("પેરામીટર", "નિયંત્રણ અને ભલામણ કરેલ સેટિંગ"),
      (
        ([*Temperature*], [`0.0–0.2`: ચોક્કસ, કોડિંગ, SQL · `0.7–1.0`: ક્રિએટિવ લેખન અને આઇડિયાઝ.]),
        ([*Top-P (Nucleus)*], [સંભવિત ટોકનના ટોચના સમૂહને મર્યાદિત કરે છે (જેમ કે `0.9`).]),
        ([*Context Window*], [એક ચેટની મહત્તમ યાદશક્તિ (`128K` થી `2M tokens`).]),
        ([*Max Tokens*], [આઉટપુટની લંબાઈ મર્યાદિત કરે છે જેથી API ખર્ચ ઓછો રહે.]),
        ([*System Prompt*], [છુપાયેલ મુખ્ય સૂચના જે AI ની ભૂમિકા, નિયમો અને JSON ફોર્મેટ નક્કી કરે છે.]),
        ([*Stop Sequence*], [કસ્ટમ શબ્દ (જેમ કે `###`) જે જનરેશનને તરત રોકી દે છે.]),
      ),
      pad-y: 6.5pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(24pt)
#did-you-know[LLM ની અલગ-અલગ API કોલ્સ વચ્ચે *કોઈ કાયમી યાદશક્તિ હોતી નથી* — દરેક વખતે નવો મેસેજ મોકલતી વખતે પાછલી આખી ચેટ *Context Window* ની અંદર ફરીથી મોકલવામાં આવે છે!]

#pagebreak()

// =========================================================================
// PAGE 3: MASTER PROMPT FRAMEWORKS & CORE TECHNIQUES
// =========================================================================
#section-banner("02", "માસ્ટર પ્રોમ્પ્ટ ફ્રેમવર્ક અને મુખ્ય ટેકનિક", "RTF, CARE, CO-STAR, RISEN · Zero-Shot, Few-Shot, CoT અને ReAct")

#card(
  "4 સાબિત પ્રોમ્પ્ટ એન્જિનિયરિંગ ફ્રેમવર્ક (10x સારા આઉટપુટ માટે)",
  tbl(
    (auto, auto, 1fr),
    ("ફ્રેમવર્ક", "માળખું", "શ્રેષ્ઠ ઉપયોગ અને ઝડપી ઉદાહરણ"),
    (
      ([*RTF*], [#strong[R]ole · #strong[T]ask · #strong[F]ormat], [રોજિંદા કામ: _"Act as a Senior SQL Dev. Write a query for top 5 sales. Output as a markdown table."_]),
      ([*CARE*], [#strong[C]ontext · #strong[A]ction · #strong[R]esult · #strong[E]xample], [બિઝનેસ અને ઈમેલ: પૃષ્ઠભૂમિ, ચોક્કસ કામ, અપેક્ષિત પરિણામ અને 1 સેમ્પલ ટોન આપો.]),
      ([*CO-STAR*], [#strong[C]ontext · #strong[O]bjective · #strong[S]tyle · #strong[T]one · #strong[A]udience · #strong[R]esponse], [કન્ટેન્ટ અને બ્લોગ: વાચકનું સ્તર (શરૂઆતી વિરુદ્ધ CTO) અને ચોક્કસ ફોર્મેટ નિયંત્રિત કરે છે.]),
      ([*RISEN*], [#strong[R]ole · #strong[I]nstructions · #strong[S]teps · #strong[E]nd goal · #strong[N]arrowing], [જટિલ કાર્ય: કામને નંબરવાળા સ્ટેપ્સમાં વહેંચો + કડક મર્યાદા આપો ("\<150 શબ્દો").]),
    ),
    pad-y: 6.8pt,
    fsize: 8.9pt
  ),
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(16pt)

#card(
  "8 જરૂરી પ્રોમ્પ્ટિંગ ટેકનિક (ઉદાહરણ સહિત)",
  tbl(
    (auto, 1fr, 1fr),
    ("ટેકનિક", "તે કેવી રીતે કામ કરે છે", "ક્યારે વાપરવી"),
    (
      ([*Zero-Shot*], [કોઈપણ ઉદાહરણ વિના સીધી સૂચના (_"આનું ગુજરાતીમાં ભાષાંતર કરો"_).], [સરળ સારાંશ, ભાષાંતર અને વ્યાખ્યાઓ.]),
      ([*Few-Shot*], [તમારા અસલી પ્રશ્ન પહેલાં 2–5 Input → Output ઉદાહરણ આપો.], [ચોક્કસ ફોર્મેટ, ટોન કે વર્ગીકરણ માટે.]),
      ([*Chain-of-Thought (CoT)*], [ઉમેરો: _"Think step-by-step and show reasoning before final answer."_], [ગણિત, લોજિક, ડિબગિંગ અને આર્કિટેક્ચર.]),
      ([*Tree-of-Thought (ToT)*], [AI પાસેથી 3 અલગ રીતો બનાવડાવો, દરેકની ખામી તપાસો, પછી શ્રેષ્ઠ પસંદ કરો.], [વ્યૂહાત્મક નિર્ણયો અને સિસ્ટમ ડિઝાઇન.]),
      ([*Role / Persona*], [_"Act as a Google Principal Security Engineer reviewing this code..."_], [ટેક્નિકલ ઊંડાણ અને ચોકસાઈ વધારવા માટે.]),
      ([*Delimiters (`"""`, `###`)*], [કાચા ટેક્સ્ટને `<data>...</data>` અથવા `"""` ની અંદર રાખો.], [સૂચના અને ડેટાને અલગ રાખવા માટે.]),
      ([*Negative Constraints*], [સ્પષ્ટ ના પાડો (_"કોઈ નકલી API કે અનુમાન ન ઉમેરશો"_).], [ખોટી માહિતી (Hallucination) રોકવા માટે.]),
      ([*Self-Critique Loop*], [_"તમારા જવાબમાં 3 ખામીઓ શોધો, પછી વધુ સારું વર્ઝન લખો."_], [રિઝ્યુમે, નિબંધ અને પ્રોડક્શન કોડ સુધારવા.]),
    ),
    pad-y: 6.5pt,
    fsize: 8.8pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(16pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "❌ નબળો સામાન્ય પ્રોમ્પ્ટ",
    [
      #set text(size: 8.9pt)
      `"Write a Python script to scrape a website and save to Excel. Make it good."` \
      *પરિણામ:* અધૂરો કોડ, એરર હેન્ડલિંગ નહીં, જૂની લાઇબ્રેરી અને ખોટું ફોર્મેટ.
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "✅ પ્રો એન્જિનિયર્ડ પ્રોમ્પ્ટ (RISEN)",
    [
      #set text(size: 8.9pt)
      `"Act as a Senior Python Dev. Fetch JSON from <URL> using requests + pandas, handle HTTP timeouts, export to out.xlsx. Output ONLY clean Python 3.12 code with docstrings."`
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(16pt)
#did-you-know[ફક્ત *"Think step-by-step"* (Zero-Shot Chain-of-Thought) ઉમેરવાથી Google Research ના પરીક્ષણોમાં અઘરા ગણિત અને લોજિક સવાલોની ચોકસાઈ *17% થી વધીને 78%* થી ઉપર પહોંચી ગઈ!]

#pagebreak()

// =========================================================================
// PAGE 4: 25+ COPY-PASTE PRO PROMPTS
// =========================================================================
#section-banner("03", "કોપી-પેસ્ટ પ્રો પ્રોમ્પ્ટ્સ વોલ્ટ", "કરિયર, કોડિંગ, અભ્યાસ, Excel/SQL અને કન્ટેન્ટ ક્રિએશન ટેમ્પ્લેટ્સ")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "1. રિઝ્યુમે ATS ઓપ્ટિમાઇઝર અને ઇન્ટરવ્યુ કોચ",
    [
      #set text(size: 7.8pt)
      - *ATS કીવર્ડ મેચ:* `"Compare my resume [paste] against this JD [paste]. List top 10 missing keywords, rewrite 3 bullet points with measurable impact metrics, and score ATS match /100."`
      - *મોક ઇન્ટરવ્યુઅર:* `"Act as a strict Hiring Manager for a [Role] interview. Ask me 1 technical question at a time. Wait for my answer, grade it /10, and show a 10/10 model answer."`
      - *LinkedIn મેસેજ:* `"Write a 45-word LinkedIn message to a Hiring Manager at [Company] highlighting my [Project/Skill] professionally."`
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "2. કોડિંગ, ડિબગિંગ અને સિસ્ટમ ડિઝાઇન",
    [
      #set text(size: 7.8pt)
      - *રૂટ-કોઝ ડિબગર:* `"Here is my code [code] and error [traceback]. Explain the root cause in 2 lines, then provide the minimal fixed diff."`
      - *કોડ રિવ્યુઅર:* `"Review this function for time/space complexity, SQL injection/XSS security risks, and edge cases. Suggest refactorings."`
      - *આર્કિટેક્ચર પ્લાનર:* `"Design a scalable backend for [App] handling 50K users. Compare SQL vs NoSQL, caching (Redis), and deployment cost."`
      - *યુનિટ ટેસ્ટ જનરેટર:* `"Write 6 pytest unit tests covering normal, boundary, and failure cases for this function: [code]."`
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
    "3. વિદ્યાર્થીઓનો અભ્યાસ અને પરીક્ષા તૈયારી",
    [
      #set text(size: 7.8pt)
      - *સરળ ઉદાહરણ નિયમ:* `"Explain [Complex Topic e.g. OSPF / Transformers] using a simple everyday Indian analogy, then give the technical definition."`
      - *એક્ટિવ રિકોલ ક્વિઝ:* `"Turn these notes [paste] into 10 exam-style MCQs (4 options each) with an answer key and 1-line explanation at the bottom."`
      - *80/20 સ્ટડી પ્લાન:* `"I have 7 days to learn [Topic] for an exam. Build a day-by-day 2-hour/day roadmap focusing on the 20% topics that carry 80% marks."`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "4. ઓફિસ, Excel ફોર્મ્યુલા, SQL અને ઈમેલ",
    [
      #set text(size: 7.8pt)
      - *Excel / Sheets જાદુગર:* `"I need an Excel formula: if Col A is 'Paid' and Col B > 5000, apply 18% GST, else 0. Explain how it works."`
      - *SQL ક્વેરી બિલ્ડર:* `"Tables: Orders(id, cust_id, amount, date), Customers(id, city). Write a PostgreSQL query for top 3 cities by revenue in 2026."`
      - *કોર્પોરેટ ઈમેલ:* `"Rewrite this rough message [paste] into a polite, crisp 4-line corporate email with a clear Call-to-Action."`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(4.8pt)

#card(
  "5. મેગા મેટા-પ્રોમ્પ્ટ: AI પાસેથી જ તમારો પરફેક્ટ પ્રોમ્પ્ટ લખાવો!",
  [
    #set text(size: 7.8pt)
    *આને ગમે ત્યારે કોપી-પેસ્ટ કરો:* #cmd("I want you to become my Expert Prompt Engineer. Your goal is to help me craft the best prompt for: [MY GOAL]. Ask me 3 clarifying questions first, then generate a structured CO-STAR prompt ready to copy-paste.")
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(4.8pt)

#card(
  "6. AI ઇમેજ જનરેશન પ્રોમ્પ્ટ્સ (Midjourney / Ideogram / Flux)",
  [
      #align(center)[#image("02_BRAND_ASSETS/ai_image_prompt_anatomy_visual.png", width: 88%)]
      #v(4pt)
      #set text(size: 7.7pt)
      - *4K ટેક પોસ્ટર / થંબનેલ:* `"Futuristic Indian developer at glowing holographic dual-monitor desk, bold 3D text 'AI 2027', neon cyan & violet rim lighting, 85mm lens, ultra-detailed 8K --ar 16:9"`
      - *મિનિમલ વેક્ટર લોગો:* `"Flat minimalist geometric tech logo for 'RTechLab', neural circuit + shield icon, electric blue gradient on dark navy, vector SVG style --no photorealistic"`
      - *સ્ટુડિયો પ્રોડક્ટ મોકઅપ:* `"Sleek matte-black wireless earbuds floating above dark basalt stone, soft studio key light, crisp water droplets, Apple commercial photography --ar 4:5"`
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(4.8pt)
#did-you-know[પ્રોમ્પ્ટની અંદર `<context>...</context>` અને `<rules>...</rules>` જેવા XML ટેગ્સનો ઉપયોગ કરવો એ *Claude* અને *GPT* મોડેલ્સ માટે સત્તાવાર બેસ્ટ પ્રેક્ટિસ છે — તે સૂચનાઓને ડેટાથી ચોખ્ખી અલગ રાખે છે!]

#pagebreak()

// =========================================================================
// PAGE 5: TOP 2026-27 AI TOOLS ECOSYSTEM DIRECTORY
// =========================================================================
#section-banner("04", "ટોપ 2026–27 AI ટૂલ્સ ઇકોસિસ્ટમ ડાયરેક્ટરી", "LLMs, કોડિંગ IDEs, રિસર્ચ, ડિઝાઇન, વીડિયો, ઓડિયો અને ઓટોમેશન")

#card(
  "શ્રેણી મુજબ જરૂરી AI ટૂલ્સ (ડાયરેક્ટ વેબસાઇટ્સ અને ઉપયોગ)",
  tbl(
    (auto, auto, 1fr, auto),
    ("શ્રેણી", "ટૂલનું નામ", "શ્રેષ્ઠ ઉપયોગ અને પ્રો ફીચર્સ", "વેબસાઇટ"),
    (
      ([*General LLM*], [*ChatGPT (GPT-4o/o3)*], [ઓલ-રાઉન્ડર રીઝનિંગ, વોઇસ મોડ, Canvas અને Custom GPTs], [`chatgpt.com`]),
      ([*Coding/Writing*], [*Claude (Sonnet/Opus)*], [કોડિંગ, Artifacts UI અને નેચરલ હ્યુમન રાઇટિંગમાં બેસ્ટ], [`claude.ai`]),
      ([*Multimodal/Docs*], [*Google Gemini*], [1M–2M કોન્ટેક્સ્ટ વિન્ડો, Workspace (Docs/Drive), YouTube/PDFs], [`gemini.google.com`]),
      ([*Live Research*], [*Perplexity AI*], [ક્લિકેબલ સ્રોતો સાથે રિયલ-ટાઇમ વેબ રિસર્ચ], [`perplexity.ai`]),
      ([*Open/Reasoning*], [*DeepSeek / Llama*], [હાઇ-પરફોર્મન્સ ઓપન-વેઇટ્સ રીઝનિંગ અને ઓછા ખર્ચનું API], [`deepseek.com`]),
      ([*AI Code IDE*], [*Cursor / Antigravity*], [એજન્ટિક કોડ એડિટિંગ, મલ્ટી-ફાઇલ રિફેક્ટર અને ટર્મિનલ], [`cursor.com`]),
      ([*UI Builder*], [*v0.dev / Bolt.new*], [ટેક્સ્ટમાંથી આખું React/Tailwind UI અને લાઇવ વેબ એપ બનાવો], [`v0.dev`]),
      ([*Image Gen*], [*Midjourney / Ideogram*], [ફોટોરિયલિસ્ટિક આર્ટ (MJ) અને ચોક્કસ પોસ્ટર ટેક્સ્ટ (Ideogram)], [`ideogram.ai`]),
      ([*Video Gen*], [*Runway / Veo / Kling*], [ટેક્સ્ટ-ટુ-વીડિયો, ઇમેજ-ટુ-વીડિયો અને AI મોશન એડિટિંગ], [`runwayml.com`]),
      ([*Voice / Audio*], [*ElevenLabs / Suno*], [ગુજરાતી/હિન્દી/અંગ્રેજી રિયલિસ્ટિક વોઇસઓવર અને AI મ્યુઝિક], [`elevenlabs.io`]),
      ([*Study / Notes*], [*NotebookLM*], [50 PDF અપલોડ કરો → ચોક્કસ Q&A + AI ઓડિયો પોડકાસ્ટ], [`notebooklm.google`]),
      ([*Automation*], [*n8n / Make / Zapier*], [Gmail, Sheets, WhatsApp અને AI Agents ને વિઝ્યુઅલી જોડો], [`n8n.io`]),
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
    "લોકલ / ઓફલાઇન AI (તમારા PC પર મફત LLM ચલાવો)",
    [
      #set text(size: 7.9pt)
      - *Ollama (`ollama.com`):* ઓપન-સોર્સ મોડેલ્સ (`Llama 3.2`, `Mistral`, `Qwen 2.5`, `DeepSeek-R1`) 100% ઓફલાઇન મફત ચલાવો: #cmd("ollama run llama3.2")
      - *LM Studio (`lmstudio.ai`):* સરળ ડેસ્કટોપ GUI જેનાથી લોકલ API સર્વર (`localhost:1234`) ચલાવી શકાય છે.
      - *હાર્ડવેર ટિપ:* `7B–8B` મોડેલ્સ 8 GB VRAM GPU અથવા 16 GB RAM પર આરામથી ચાલે છે!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "સાચું AI ટૂલ કેવી રીતે પસંદ કરવું? (ઝડપી ગાઇડ)",
    [
      #set text(size: 7.9pt)
      - *આજના તાજા સમાચારના તથ્યો જોઈએ?* → *Perplexity* કે *Gemini*
      - *ચોખ્ખો ફુલ-સ્ટેક કોડ લખવો છે?* → *Claude* કે *Cursor*
      - *300 પેજની PDF ચોપડી સમજવી છે?* → *NotebookLM* કે *Gemini*
      - *ચોક્કસ ટેક્સ્ટ વાળું પોસ્ટર બનાવવું છે?* → *Ideogram* કે *Canva AI*
      - *ઓટોમેટેડ WhatsApp/Email બોટ?* → *n8n* + *OpenAI/Gemini API*
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(14.5pt)

#card(
  "Free વિરુદ્ધ Paid પ્રોડક્શન AI ટૂલ્સ સ્ટેક (રિયલ એપ્સ બનાવો)",
  [
    #tbl(
      (auto, 1fr, 1fr),
      ("શ્રેણી", "મફત / ઓપન-સોર્સ (₹0 શરૂઆત)", "પેઇડ પ્રોડક્શન પ્રો"),
      (
        ([*LLM API*], [Google AI Studio, Groq, Ollama], [OpenAI GPT-4o, Anthropic Claude]),
        ([*Image / Design*], [Ideogram Free, Flux, Canva Free], [Midjourney (\$10/mo), Canva Pro]),
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
#did-you-know[Google નું *NotebookLM* ફક્ત એ જ સ્રોતોમાંથી જવાબ આપે છે જે *તમે* અપલોડ કરો છો — જેનાથી વિદ્યાર્થીઓને લગભગ શૂન્ય ખોટી માહિતી (hallucination) અને ચોક્કસ પેજ નંબર મળે છે!]

#pagebreak()

// =========================================================================
// PAGE 6: RAG ARCHITECTURE & VECTOR DATABASES
// =========================================================================
#section-banner("05", "RAG આર્કિટેક્ચર અને વેક્ટર ડેટાબેઝ", "ખાનગી ડેટા પર LLM ગ્રાઉન્ડિંગ · Embeddings, Chunking અને Fine-Tuning")

#card(
  "RAG અને Agentic AI આર્કિટેક્ચર વિઝ્યુઅલ",
  [
    #align(center)[#image("02_BRAND_ASSETS/ai_rag_agents_visual.png", width: 100%)]
    #v(5pt)
    #set text(size: 8.9pt)
    *RAG કેમ?* LLM પાસે ફક્ત જૂની ટ્રેનિંગનો ડેટા હોય છે અને તે તમારી કંપનીની PDFs કે ખાનગી ડેટાબેઝ જાણતું નથી. *RAG* પ્રશ્ન પૂછતી વખતે સાચા ટુકડા શોધીને પ્રોમ્પ્ટમાં ઉમેરે છે જેથી LLM ચોક્કસ પુરાવા સાથે જવાબ આપે!
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(38pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "પ્રોડક્શન RAG પાઇપલાઇન બનાવવાના 5 સ્ટેપ",
    [
      #set text(size: 8.9pt)
      1. *Load & Parse:* PDFs, Docs, Notion કે SQL માંથી ચોખ્ખું ટેક્સ્ટ કાઢો (`PyMuPDF`, `Unstructured`).
      2. *Chunking:* ટેક્સ્ટને `400–800 ટોકન` ના ટુકડામાં `10–20% ઓવરલેપ` સાથે વહેંચો.
      3. *Embed:* દરેક ચંકને ન્યુમેરિક વેક્ટરમાં ફેરવો (`text-embedding-3-small`, `BGE`, `Nomic`).
      4. *Store & Search:* *Pinecone, ChromaDB, Qdrant, Weaviate કે pgvector* માં સેવ કરો; *Cosine Similarity* + *BM25* થી શોધો.
      5. *Generate:* ટોપ-K ચંક્સ + સવાલ LLM ને મોકલો: _"ફક્ત આપેલા ડેટામાંથી જ જવાબ આપો."_
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Prompting vs RAG vs Fine-Tuning (ઇન્ટરવ્યુ ક્લાસિક)",
    tbl(
      (auto, 1fr, auto),
      ("રીત", "ક્યારે સૌથી શ્રેષ્ઠ છે?", "ખર્ચ / સમય"),
      (
        ([*Prompt Eng.*], [વધુ સારું ફોર્મેટ, લોજિક, ટોન કે ઝડપી કામ માટે], [સૌથી ઓછો (મિનિટોમાં)]),
        ([*RAG*], [તાજા તથ્યો, ખાનગી PDFs અને ચોક્કસ સાઇટેશન માટે], [મધ્યમ (કલાકો–દિવસ)]),
        ([*Fine-Tuning*], [ખાસ સ્ટાઇલ, મેડિકલ/લીગલ શબ્દભંડોળ કે નાના ઝડપી મોડેલ માટે], [વધુ (GPU + ડેટાસેટ)]),
      ),
      pad-y: 7pt,
      fsize: 8.9pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(38pt)
#did-you-know[હાઇબ્રિડ સર્ચ (*Vector Semantic Search* + *BM25 Keyword Search*) સાથે *Cross-Encoder Reranker* (જેમ કે Cohere Rerank) વાપરવાથી RAG ની ચોકસાઈ *15–30%* સુધી વધી જાય છે!]

#pagebreak()

// =========================================================================
// PAGE 7: AGENTIC AI, FUNCTION CALLING & MCP
// =========================================================================
#section-banner("06", "એજન્ટિક AI, ફંક્શન કોલિંગ અને MCP", "સ્વાયત્ત વર્કફ્લો · ReAct લૂપ, ફ્રેમવર્ક અને સ્ટ્રક્ચર્ડ JSON")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "AI ને 'એજન્ટ' શું બનાવે છે? (4 મુખ્ય સ્તંભ)",
    [
      #set text(size: 8.9pt)
      સામાન્ય ચેટબોટ (1 સવાલ → 1 જવાબ) થી વિપરીત, *AI Agent* લક્ષ્ય પૂરું થાય ત્યાં સુધી લૂપમાં કામ કરે છે:
      1. *Planning (યોજના):* મોટા લક્ષ્યને નાના સ્ટેપ્સમાં વહેંચે છે (*ReAct*: Reason → Act → Observe).
      2. *Tool Calling:* LLM બહારના APIs (વેબ સર્ચ, SQL, Python, Email) ચલાવવા માટે JSON આઉટપુટ આપે છે.
      3. *Memory:* *Short-term* (કોન્ટેક્સ્ટ વિન્ડો) + *Long-term* (Vector DB).
      4. *Reflection:* પોતાના જ આઉટપુટની ભૂલ પકડીને ફરીથી સુધારે છે.
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "MCP (Model Context Protocol) — AI નું 'USB-C'",
    [
      #set text(size: 8.9pt)
      - *સમસ્યા:* પહેલાં 5 AI એપ્સને 10 ટૂલ્સ (GitHub, Drive, Slack, Postgres) સાથે જોડવા માટે 50 અલગ કોડ લખવા પડતા હતા.
      - *MCP ઉકેલ (Anthropic, ઓપન સ્ટાન્ડર્ડ):* એક યુનિવર્સલ પ્રોટોકોલ જ્યાં ટૂલ્સ *Tools* (એક્શન), *Resources* (ફાઇલો/ડેટા) અને *Prompts* ને કોઈપણ MCP ક્લાયન્ટ (Claude, Cursor, Antigravity) માટે ઉપલબ્ધ કરાવે છે.
      - *ફાયદો:* તમારા ડેટાબેઝ માટે 1 MCP સર્વર બનાવો, અને દરેક AI એજન્ટ તેની સાથે જોડાઈ જશે!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  )
)

#v(30pt)

#card(
  "2026–27 એજન્ટિક AI ફ્રેમવર્ક્સ અને ઓર્કેસ્ટ્રેશન તુલના",
  tbl(
    (auto, auto, 1fr, auto),
    ("ફ્રેમવર્ક", "ભાષા", "મુખ્ય તાકાત અને આદર્શ ઉપયોગ", "જટિલતા"),
    (
      ([*LangGraph*], [Python / JS], [સ્ટેટફુલ ગ્રાફ, હ્યુમન-ઇન-ધ-લૂપ અને પ્રોડક્શન વિશ્વસનીયતા], [મધ્યમ–ઉચ્ચ]),
      ([*CrewAI*], [Python], [રોલ-આધારિત મલ્ટી-એજન્ટ ટીમ (Researcher + Writer + Reviewer)], [ઓછી–મધ્યમ]),
      ([*LlamaIndex*], [Python / TS], [ડોક્યુમેન્ટ-હેવી RAG પાઇપલાઇન અને એન્ટરપ્રાઇઝ ડેટા કનેક્ટર], [મધ્યમ]),
      ([*AutoGen*], [Python], [મલ્ટી-એજન્ટ કોડ એક્ઝિક્યુશન અને સંવાદાત્મક સમસ્યા ઉકેલ], [મધ્યમ]),
      ([*n8n AI Agent*], [વિઝ્યુઅલ / No-Code], [ડ્રેગ-એન્ડ-ડ્રોપ ટ્રિગર (Webhook, Gmail, WhatsApp) + LLM + Tools], [શરૂઆતી માટે બેસ્ટ]),
    ),
    pad-y: 6.8pt,
    fsize: 8.8pt
  ),
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(30pt)

#card(
  "Structured Outputs (JSON Schema) અને Function Calling ઉદાહરણ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.8pt)
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
        *આ કેવી રીતે કામ કરે છે?*
        - LLM ક્યારેય જાતે કોડ ચલાવતું નથી — તે ફક્ત આ ચોક્કસ JSON પરત કરે છે (`json_schema` દ્વારા 100% માન્ય).
        - તમારું બેકએન્ડ ફંક્શન ચલાવીને પરિણામ પાછું LLM ને આપે છે, જેનાથી અંતિમ જવાબ બને છે!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(30pt)
#did-you-know[પ્રોડક્શનમાં 80% કિસ્સાઓમાં સારા *Tool Calling* અને *Structured JSON* વાળું એક સિંગલ-એજન્ટ જટિલ મલ્ટી-એજન્ટ સિસ્ટમ કરતાં વધુ સારું ચાલે છે — હંમેશા સરળ શરૂઆત કરો!]

#pagebreak()

// =========================================================================
// PAGE 8: AI FOR CODING, DATA ANALYTICS & AUTOMATION
// =========================================================================
#section-banner("07", "કોડિંગ, ડેટા એનાલિટિક્સ અને ઓટોમેશન માટે AI", "Python LLM APIs, SQL/Pandas કોપાયલટ, વાઇબ કોડિંગ અને n8n")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Python LLM API ક્વિકસ્ટાર્ટ (OpenAI / Gemini SDK)",
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
      *ખર્ચ ટિપ:* 90% કામો માટે `gpt-4o-mini` / `gemini-2.5-flash` વાપરો (~20x સસ્તું)!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "No-Code AI ઓટોમેશન બ્લુપ્રિન્ટ (n8n / Make)",
    [
      #set text(size: 8.9pt)
      *ઉદાહરણ: ઓટો-રિપ્લાય સપોર્ટ અને લીડ ટ્રેકર (15 મિનિટમાં બનાવો):*
      1. *Trigger:* નવું WhatsApp / Gmail / Google Form સબમિશન આવે છે.
      2. *AI Classifier:* LLM હેતુ (`Sales`, `Support`, `Spam`) ઓળખીને નામ અને શહેર JSON માં કાઢે છે.
      3. *Database:* Google Sheets / Airtable / Notion માં ચોખ્ખી રો ઉમેરે છે.
      4. *Action:* તરત ગ્રાહકને રિપ્લાય મોકલે છે કે Telegram પર એલર્ટ આપે છે!
      *ફાયદો:* ફ્રીલાન્સર્સ અને સંસ્થાઓના રોજ 2–3 કલાક બચાવે છે.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(29pt)

#card(
  "AI ડેટા એનાલિટિક્સ અને પ્રો 'વાઇબ કોડિંગ' નિયમો",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        *3x ઝડપી ડેટા એનાલિટિક્સ:*
        - ChatGPT/Claude માં CSV અપલોડ કરો → ઓટો-ક્લીનિંગ, ચાર્ટ અને આઉટલાયર્સ મેળવો.
        - જટિલ *Power BI DAX* અને *SQL Window Functions* (`RANK()`, `CTE`) સેકન્ડોમાં લખાવો.
        - *સુરક્ષા નિયમ:* ક્યારેય સંવેદનશીલ ગ્રાહક પાસવર્ડ/PII પબ્લિક ચેટમાં અપલોડ ન કરો!
      ],
      [
        #set text(size: 8.9pt)
        *પ્રો 'વાઇબ કોડિંગ' વર્કફ્લો (Cursor / Antigravity):*
        - *1. પહેલાં પ્લાન:* કોડ લખાવતા પહેલાં 5-સ્ટેપ પ્લાન બનાવડાવો.
        - *2. નાના ફેરફાર:* એક સમયે 1 ફીચર બનાવો અને તરત ટેસ્ટ કરો.
        - *3. `.cursorrules` / `AGENTS.md`:* પ્રોજેક્ટના નિયમો રૂટમાં રાખો.
        - *4. હંમેશા તપાસો:* ટેસ્ટ ચલાવો અને સિક્યોરિટી કોડ જાતે વાંચો!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(29pt)

#card(
  "AI ડેવલપર સ્ટેક અને API ખર્ચ બચત",
  [
    #tbl(
      (auto, 1fr),
      ("ટેકનિક", "કેવી રીતે કામ કરે છે અને ફાયદો"),
      (
        ([*Prompt Caching*], [વારંવાર જતા લાંબા સિસ્ટમ પ્રોમ્પ્ટ/PDF ને કેશ કરો (*50–90% ખર્ચ બચત*).]),
        ([*Model Routing*], [સરળ કામ mini/flash મોડેલને અને અઘરા રીઝનિંગ પ્રો મોડેલને મોકલો.]),
        ([*Promptfoo / LangSmith*], [પ્રોડક્શન પહેલાં 20+ ટેસ્ટ કેસ પર પ્રોમ્પ્ટની ચોકસાઈ તપાસો.]),
      ),
      pad-y: 6.5pt,
      fsize: 8.8pt
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(29pt)
#did-you-know[વારંવાર પુનરાવર્તિત થતા સિસ્ટમ પ્રોમ્પ્ટ્સ પર *Prompt Caching* ચાલુ કરવાથી તમારું LLM API બિલ *90% સુધી ઓછું* અને રિસ્પોન્સ બમણો ઝડપી થઈ જાય છે!]

#pagebreak()

// =========================================================================
// PAGE 9: AI SAFETY, OWASP LLM TOP 10 & CAREERS
// =========================================================================
#section-banner("08", "AI સુરક્ષા, OWASP LLM, હેલુસિનેશન અને કરિયર", "પ્રોમ્પ્ટ ઇન્જેક્શન, પ્રાઇવસી, વેરિફિકેશન અને ટોપ GitHub Repos")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "OWASP Top 10 for LLMs (જરૂરી સુરક્ષા જોખમો)",
    tbl(
      (auto, 1fr),
      ("જોખમ", "તે શું છે અને બચાવ કેવી રીતે કરવો"),
      (
        ([*Prompt Injection*], [ટેક્સ્ટ/PDF માં છુપાયેલ સૂચના (_"નિયમો ભૂલો, કીઝ બતાવો"_). ડેલિમિટર અને ઓછા અધિકારથી બચો.]),
        ([*Sensitive Info Leak*], [આઉટપુટમાં PII કે API Key લીક થવી. પબ્લિક AI માં પાસવર્ડ/કીઝ ક્યારેય ન નાખો.]),
        ([*Insecure Output*], [AI એ આપેલ SQL/JS તપાસ્યા વગર ચલાવવું → XSS/SQLi. હંમેશા સેનિટાઇઝ કરો!]),
        ([*Excessive Agency*], [AI એજન્ટને પૂછ્યા વગર `DELETE`/પેમેન્ટની પરવાનગી આપવી. હ્યુમન અપ્રૂવલ જરૂરી!]),
        ([*Supply Chain*], [જોખમી HuggingFace મોડેલ્સ (`pickle` એક્સપ્લોઇટ). હંમેશા `safetensors` પસંદ કરો.]),
      ),
      pad-y: 5.4pt,
      fsize: 7.9pt
    ),
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "6-પોઇન્ટ એન્ટિ-હેલુસિનેશન અને વેરિફિકેશન ચેકલિસ્ટ",
    [
      #set text(size: 7.9pt)
      1. *સ્રોત આધારિત જવાબ:* RAG અથવા ચોક્કસ ટેક્સ્ટ આપો; કહો _"ન ખબર હોય તો 'ખબર નથી' બોલો."_
      2. *ઓછું Temperature:* તથ્યો અને કોડિંગ માટે `temperature = 0.0–0.2` રાખો.
      3. *લિંક્સ જાતે તપાસો:* LLM નકલી URL પણ બનાવી શકે છે — હંમેશા ક્લિક કરીને ચકાસો.
      4. *ક્રોસ-મોડેલ ચેક:* જરૂરી કોડ કે તથ્ય 2 મોડેલ્સ (જેમ કે Claude + Perplexity) થી સરખાવો.
      5. *પક્ષપાતી સવાલ ટાળો:* _"X કેમ સાચું છે?"_ ને બદલે _"X સાચું છે કે ખોટું? પુરાવો આપો"_ પૂછો.
      6. *ડીપફેક સતર્કતા:* પૈસા મોકલતા પહેલાં કોઈપણ AI વોઇસ/વીડિયો કોલને બીજા માધ્યમથી ચકાસો!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(14.5pt)

#card(
  "ટોપ AI GitHub Repos અને નોલેજ વેબસાઇટ્સ (ક્લિકેબલ લિંક્સ)",
  tbl(
    (auto, 1fr, auto),
    ("સંસાધન / રેપો", "શું શીખશો / ફાયદો", "ડાયરેક્ટ લિંક"),
    (
      ([*Awesome ChatGPT Prompts*], [1000+ અજમાવેલા રોલ પ્રોમ્પ્ટ્સ], [#link("https://github.com/f/awesome-chatgpt-prompts")[`github.com/f/awesome-chatgpt-prompts`]]),
      ([*Awesome LLM Apps*], [તૈયાર RAG, AI Agent અને વોઇસ એજન્ટ કોડ], [#link("https://github.com/Shubhamsaboo/awesome-llm-apps")[`github.com/Shubhamsaboo/awesome-llm-apps`]]),
      ([*MS GenAI Beginners*], [Microsoft નો 18-લેસન ઓપન-સોર્સ AI કોર્સ], [#link("https://github.com/microsoft/generative-ai-for-beginners")[`github.com/microsoft/generative-ai...`]]),
      ([*n8n / Dify / Ollama*], [સેલ્ફ-હોસ્ટ AI એજન્ટ્સ, વર્કફ્લો અને લોકલ LLM], [#link("https://github.com/n8n-io/n8n")[`github.com/n8n-io/n8n`]]),
      ([*PromptingGuide + DeepLearning*], [સત્તાવાર પ્રોમ્પ્ટ ગાઇડ અને મફત કોર્સ], [#link("https://www.promptingguide.ai")[`promptingguide.ai`] · #link("https://www.deeplearning.ai")[`deeplearning.ai`]]),
      ([*HuggingFace + Kaggle*], [ઓપન મોડેલ્સ, ડેટાસેટ્સ અને AI સ્પર્ધાઓ], [#link("https://huggingface.co")[`huggingface.co`] · #link("https://www.kaggle.com/learn")[`kaggle.com/learn`]]),
      ([*Futurepedia / TAAFT*], [10,000+ નવા AI ટૂલ્સની દૈનિક ડાયરેક્ટરી], [#link("https://www.futurepedia.io")[`futurepedia.io`] · #link("https://theresanaiforthat.com")[`theresanaiforthat.com`]]),
    ),
    pad-y: 5.4pt,
    fsize: 7.6pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(14.5pt)

#card(
  "2026–27 હાઇ-પેઇંગ AI કરિયર પાથ અને પોર્ટફોલિયો બ્લુપ્રિન્ટ (ભારત)",
  [
    #tbl(
      (auto, 1fr, 1fr),
      ("રોલ", "શીખવા માટે મુખ્ય સ્ટેક", "જરૂરી પોર્ટફોલિયો પ્રોજેક્ટ"),
      (
        ([*GenAI / RAG Dev*], [Python, FastAPI, Vector DB, LangGraph, OpenAI/Gemini], [સાઇટેશન સાથે PDF/SQL Q&A ચેટબોટ]),
        ([*AI Automation Eng.*], [n8n, Make, Webhooks, REST APIs, WhatsApp/Sheets], [ઓટોમેટેડ લીડ ક્વોલિફાયર + CRM સિંક બોટ]),
        ([*AI Security Analyst*], [OWASP LLM Top 10, Red Teaming, Garak, Guardrails], [પ્રોમ્પ્ટ ઇન્જેક્શન સ્કેનર અને ગાર્ડરેલ પ્રોક્સી]),
      ),
      pad-y: 5.4pt,
      fsize: 7.9pt
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(14.5pt)
#did-you-know[મોટા AI મોડેલ પણ ક્યારેક *નકલી Python/npm પેકેજ નામ* બનાવી દે છે — હેકર્સ એ કાલ્પનિક નામોને PyPI/npm પર રજિસ્ટર કરી લે છે (*"Slopsquatting"*) જેથી બેદરકાર ડેવલપર્સની સિસ્ટમ હેક થઈ શકે!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 AI INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "ટોપ 10 AI ઇન્ટરવ્યુ પ્રશ્નો અને RTECHLAB લેખક પરિચય", "GenAI / AI એન્જિનિયર તૈયારી · પ્રમાણપત્રો, ધ્યેય અને વોટ્સએપ હેલ્પ ડેસ્ક")

#card(
  "ટોપ 10 AI અને પ્રોમ્પ્ટ એન્જિનિયરિંગ ઇન્ટરવ્યુ પ્રશ્ન-જવાબ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.8pt)
        *1. Token શું છે?* શબ્દનો નાનો ભાગ (~4 અક્ષર) જેને LLM વાંચે/બનાવે છે અને બિલ કરે છે (`1K tokens ≈ 750 words`). \
        *2. Temperature વિરુદ્ધ Top-P?* Temperature ક્રિએટિવિટી/રેન્ડમનેસ નક્કી કરે છે (`0` = ચોક્કસ); Top-P ટોચના સંભવિત ટોકન પસંદ કરે છે. \
        *3. Zero-Shot વિરુદ્ધ Few-Shot?* Zero-shot માં ઉદાહરણ હોતા નથી; Few-shot માં ફોર્મેટ લોક કરવા 2–5 ઉદાહરણ અપાય છે. \
        *4. Chain-of-Thought શું છે?* અંતિમ જવાબ પહેલાં સ્ટેપ-બાય-સ્ટેપ તર્ક લખાવવો જેથી લોજિકની ભૂલ ન થાય. \
        *5. RAG વિરુદ્ધ Fine-Tuning?* RAG ક્વેરી સમયે તાજા/ખાનગી તથ્યો ઉમેરે છે; Fine-tuning મોડેલના વેઇટ્સમાં સ્ટાઇલ શીખવે છે.
      ],
      [
        #set text(size: 8.8pt)
        *6. RAG માં Chunk Overlap કેમ?* જેથી બે ટુકડા વચ્ચે કપાતા વાક્યોનો સંદર્ભ (context) ન ખોવાય. \
        *7. Hallucination શું છે?* LLM દ્વારા આત્મવિશ્વાસથી ખોટા તથ્યો ઘડવા; RAG, `temp=0` અને કડક સૂચનાથી ઘટે છે. \
        *8. Prompt Injection શું છે?* બહારના ટેક્સ્ટ દ્વારા સિસ્ટમ સૂચનાઓ બદલવી; ડેલિમિટર અને ઓછા અધિકારથી બચાવ થાય છે. \
        *9. AI Agent શું છે?* પ્લાનિંગ (ReAct), મેમોરી અને ટૂલ-કોલિંગ લૂપ વાળું LLM જે અનેક સ્ટેપ્સમાં લક્ષ્ય પૂરું કરે. \
        *10. MCP શું છે?* Model Context Protocol — AI ક્લાયન્ટ્સને ટૂલ્સ અને ડેટા સાથે જોડતું ઓપન સ્ટાન્ડર્ડ.
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(26pt)

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
        image("02_BRAND_ASSETS/rahul-patel.jpg", width: 32mm)
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
          *અનુભવ અને પ્રમાણપત્રો:* #hl-p("AI Systems & Automation Architect") · #hl-b("CEH (EC-Council)") · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · ડાયરેક્ટર અને લીડ IT ટ્રેનર, IANT કમ્પ્યુટર એજ્યુકેશન, પાલનપુર · *10+ વર્ષનો અનુભવ · 3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત*.
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8.8pt)[
            *અમારો RTechLab ધ્યેય (Motto):* _"Technology Made Practical — શીખો, પ્રેક્ટિસ કરો અને ઓટોમેટ કરો. AI તમારી જગ્યા નહીં લે, પરંતુ મજબૂત પાયા અને AI નો સાચો ઉપયોગ કરનાર વ્યક્તિ ચોક્કસ આગળ નીકળી જશે. ભારતમાં નિર્મિત જેથી ₹22 માં ₹2,200 જેવું જ્ઞાન મળે."_
          ]
        )
      ]
    )
  ]
)

#v(26pt)

// 4 SCANNABLE QR CODES
#card(
  "સ્કેન કરો અને RTechLab સાથે જોડાઓ (મફત AI લેબ્સ, ટૂલ્સ અને અપડેટ્સ)",
  [
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 7pt,
      align: center,
      [
        #image("02_BRAND_ASSETS/qr_rahul_portfolio.png", width: 32.5mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[RTechLab & Tools] \
        #link("https://rtechlab.com/tools")[#text(size: 7pt, fill: rgb("#7c3aed"))[rtechlab.com/tools]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", width: 32.5mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[YouTube લેબ્સ] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 7pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 32.5mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[Instagram રીલ્સ] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily AI Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 32.5mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp ચેનલ] \
        #link("https://wa.me/917646892094")[#text(size: 7pt, fill: rgb("#16a34a"))[જોબ અને નોટ્સ એલર્ટ]]
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(26pt)

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
      #text(size: 9.2pt, weight: "bold", fill: rgb("#14532d"))[RTechLab વિદ્યાર્થી હેલ્પ ડેસ્ક અને કરિયર માર્ગદર્શન] \
      #text(size: 7.8pt, fill: rgb("#166534"))[AI પ્રોજેક્ટ્સ, RAG, n8n ઓટોમેશન કે ટેક કરિયર રોડમેપમાં મદદ જોઈએ છે? સીધું WhatsApp પર પૂછો!]
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
