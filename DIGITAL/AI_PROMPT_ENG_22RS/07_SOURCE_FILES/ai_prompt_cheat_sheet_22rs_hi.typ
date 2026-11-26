#set document(
  title: "RTechLab — AI Prompt Engineering, Generative AI & Agents Quick Desk Cheat Sheet (Hindi)",
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
          #text(fill: rgb("#64748b"))[ · 10-पेज त्वरित डेस्क गाइड (हिंदी संस्करण)]
        ],
        [
          #text(fill: rgb("#7c3aed"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 डेस्क एडिशन]
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
        [© RTechLab Original Edition · सीखें · अभ्यास करें · ऑटोमेट करें · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[पेज #p / 10]]]
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
      *💡 क्या आप जानते हैं?* #fact
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
#section-banner("01", "AI परिदृश्य और LLM कैसे काम करता है", "AI → ML → DL → GenAI → Agentic AI · टोकन, अटेंशन और पैरामीटर्स")

#card(
  "LLM आपके प्रॉम्प्ट को कैसे प्रोसेस करता है (Transformer पाइपलाइन)",
  [
    #align(center)[#image("02_BRAND_ASSETS/ai_llm_pipeline_visual.png", width: 100%)]
    #v(4pt)
    #set text(size: 8.9pt)
    - *Tokenization:* LLM पूरे शब्द नहीं बल्कि *टोकन* (~4 अक्षर या 0.75 शब्द) पढ़ता है। `1,000 tokens ≈ 750 words`।
    - *Self-Attention:* ट्रांसफॉर्मर लेयर्स एक साथ पूरे प्रॉम्प्ट के शब्दों का आपसी संबंध समझती हैं।
    - *Next-Token Prediction:* LLM एक-एक करके अगले सबसे सही टोकन का अनुमान लगाता है — बेहतर कॉन्टेक्स्ट = 10x बेहतर उत्तर।
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(24pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "AI पदानुक्रम: सामान्य AI से Agentic AI तक",
    tbl(
      (auto, 1fr),
      ("परत / युग", "यह क्या करता है और वास्तविक उदाहरण"),
      (
        ([*Narrow AI*], [नियम-आधारित या एक काम के लिए बना सिस्टम (शतरंज इंजन, स्पैम फ़िल्टर)।]),
        ([*Machine Learning*], [डेटा से पैटर्न सीखता है (Regression, Random Forest)।]),
        ([*Deep Learning*], [इमेज, आवाज़ और भाषा समझने के लिए मल्टी-लेयर न्यूरल नेटवर्क।]),
        ([*Generative AI*], [*नया* टेक्स्ट, कोड, इमेज, ऑडियो और वीडियो बनाता है (LLMs, Diffusion)।]),
        ([*Multimodal AI*], [टेक्स्ट + इमेज + ऑडियो + वीडियो एक साथ समझता है (Gemini, GPT-4o)।]),
        ([*Agentic AI*], [खुद प्लान बनाता है, टूल्स/APIs चलाता है और कोड टेस्ट करता है (2026+)।]),
      ),
      pad-y: 6.5pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "LLM के 6 जरूरी पैरामीटर्स (प्रॉम्प्ट इंजीनियरिंग)",
    tbl(
      (auto, 1fr),
      ("पैरामीटर", "नियंत्रण और अनुशंसित सेटिंग"),
      (
        ([*Temperature*], [`0.0–0.2`: सटीक, कोडिंग, SQL · `0.7–1.0`: क्रिएटिव लेखन व आइडियाज़।]),
        ([*Top-P (Nucleus)*], [संभावित टोकन के शीर्ष समूह को सीमित करता है (जैसे `0.9`)।]),
        ([*Context Window*], [एक चैट की अधिकतम याददाश्त (`128K` से `2M tokens`)।]),
        ([*Max Tokens*], [आउटपुट की लंबाई सीमित करता है ताकि API खर्च कम रहे।]),
        ([*System Prompt*], [छिपा हुआ मुख्य निर्देश जो AI की भूमिका, नियम व JSON फॉर्मेट तय करता है।]),
        ([*Stop Sequence*], [कस्टम शब्द (जैसे `###`) जो जनरेशन को तुरंत रोक देता है।]),
      ),
      pad-y: 6.5pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(24pt)
#did-you-know[LLM की अलग-अलग API कॉल्स के बीच *कोई स्थायी याददाश्त नहीं* होती — हर बार नया मैसेज भेजने पर पिछली पूरी चैट *Context Window* के अंदर दोबारा भेजी जाती है!]

#pagebreak()

// =========================================================================
// PAGE 3: MASTER PROMPT FRAMEWORKS & CORE TECHNIQUES
// =========================================================================
#section-banner("02", "मास्टर प्रॉम्प्ट फ्रेमवर्क और मुख्य तकनीकें", "RTF, CARE, CO-STAR, RISEN · Zero-Shot, Few-Shot, CoT और ReAct")

#card(
  "4 सिद्ध प्रॉम्प्ट इंजीनियरिंग फ्रेमवर्क (10x बेहतर आउटपुट के लिए)",
  tbl(
    (auto, auto, 1fr),
    ("फ्रेमवर्क", "संरचना", "सबसे अच्छा उपयोग और त्वरित उदाहरण"),
    (
      ([*RTF*], [#strong[R]ole · #strong[T]ask · #strong[F]ormat], [दैनिक काम: _"Act as a Senior SQL Dev. Write a query for top 5 sales. Output as a markdown table."_]),
      ([*CARE*], [#strong[C]ontext · #strong[A]ction · #strong[R]esult · #strong[E]xample], [बिजनेस व ईमेल: पृष्ठभूमि, सटीक काम, अपेक्षित परिणाम और 1 सैंपल टोन दें।]),
      ([*CO-STAR*], [#strong[C]ontext · #strong[O]bjective · #strong[S]tyle · #strong[T]one · #strong[A]udience · #strong[R]esponse], [कंटेंट व ब्लॉग: पाठक के स्तर (शुरुआती बनाम CTO) और सटीक फॉर्मेट को नियंत्रित करता है।]),
      ([*RISEN*], [#strong[R]ole · #strong[I]nstructions · #strong[S]teps · #strong[E]nd goal · #strong[N]arrowing], [जटिल कार्य: काम को नंबर वाले स्टेप्स में बाँटें + सख्त सीमाएँ दें ("\<150 शब्द")।]),
    ),
    pad-y: 6.8pt,
    fsize: 8.9pt
  ),
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(16pt)

#card(
  "8 आवश्यक प्रॉम्प्टिंग तकनीकें (उदाहरण सहित)",
  tbl(
    (auto, 1fr, 1fr),
    ("तकनीक", "यह कैसे काम करती है", "कब उपयोग करें"),
    (
      ([*Zero-Shot*], [बिना किसी उदाहरण के सीधा निर्देश (_"इसे हिंदी में अनुवाद करें"_).], [सरल सारांश, अनुवाद और परिभाषाएँ।]),
      ([*Few-Shot*], [अपने असली प्रश्न से पहले 2–5 Input → Output उदाहरण दें।], [सटीक फॉर्मेट, टोन या वर्गीकरण के लिए।]),
      ([*Chain-of-Thought (CoT)*], [जोड़ें: _"Think step-by-step and show reasoning before final answer."_], [गणित, लॉजिक, डिबगिंग व आर्किटेक्चर।]),
      ([*Tree-of-Thought (ToT)*], [AI से 3 अलग तरीके बनवाएँ, हर एक की कमी जाँचें, फिर सर्वश्रेष्ठ चुनें।], [रणनीतिक निर्णय और सिस्टम डिज़ाइन।]),
      ([*Role / Persona*], [_"Act as a Google Principal Security Engineer reviewing this code..."_], [तकनीकी गहराई और सटीकता बढ़ाने के लिए।]),
      ([*Delimiters (`"""`, `###`)*], [कच्चे टेक्स्ट को `<data>...</data>` या `"""` के भीतर रखें।], [निर्देश और डेटा को अलग रखने के लिए।]),
      ([*Negative Constraints*], [स्पष्ट मना करें (_"कोई नकली API या अनुमान न जोड़ें"_).], [गलत जानकारी (Hallucination) रोकने के लिए।]),
      ([*Self-Critique Loop*], [_"अपने उत्तर में 3 कमियाँ ढूँढें, फिर बेहतर संस्करण लिखें।"_], [रिज्यूमे, निबंध और प्रोडक्शन कोड सुधारने में।]),
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
    "❌ कमज़ोर सामान्य प्रॉम्प्ट",
    [
      #set text(size: 8.9pt)
      `"Write a Python script to scrape a website and save to Excel. Make it good."` \
      *परिणाम:* अधूरा कोड, एरर हैंडलिंग नहीं, पुरानी लाइब्रेरी और गलत फॉर्मेट।
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "✅ प्रो इंजीनियर्ड प्रॉम्प्ट (RISEN)",
    [
      #set text(size: 8.9pt)
      `"Act as a Senior Python Dev. Fetch JSON from <URL> using requests + pandas, handle HTTP timeouts, export to out.xlsx. Output ONLY clean Python 3.12 code with docstrings."`
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(16pt)
#did-you-know[केवल *"Think step-by-step"* (Zero-Shot Chain-of-Thought) जोड़ने से Google Research के परीक्षणों में कठिन गणित व लॉजिक सवालों की सटीकता *17% से बढ़कर 78%* से ऊपर पहुँच गई!]

#pagebreak()

// =========================================================================
// PAGE 4: 25+ COPY-PASTE PRO PROMPTS
// =========================================================================
#section-banner("03", "कॉपी-पेस्ट प्रो प्रॉम्प्ट्स वॉल्ट", "करियर, कोडिंग, पढ़ाई, Excel/SQL और कंटेंट क्रिएशन टेम्पलेट्स")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "1. रिज्यूमे ATS ऑप्टिमाइज़र और इंटरव्यू कोच",
    [
      #set text(size: 7.8pt)
      - *ATS कीवर्ड मैच:* `"Compare my resume [paste] against this JD [paste]. List top 10 missing keywords, rewrite 3 bullet points with measurable impact metrics, and score ATS match /100."`
      - *मॉक इंटरव्यूअर:* `"Act as a strict Hiring Manager for a [Role] interview. Ask me 1 technical question at a time. Wait for my answer, grade it /10, and show a 10/10 model answer."`
      - *LinkedIn मैसेज:* `"Write a 45-word LinkedIn message to a Hiring Manager at [Company] highlighting my [Project/Skill] professionally."`
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "2. कोडिंग, डिबगिंग और सिस्टम डिज़ाइन",
    [
      #set text(size: 7.8pt)
      - *रूट-कॉज़ डिबगर:* `"Here is my code [code] and error [traceback]. Explain the root cause in 2 lines, then provide the minimal fixed diff."`
      - *कोड रिव्यूअर:* `"Review this function for time/space complexity, SQL injection/XSS security risks, and edge cases. Suggest refactorings."`
      - *आर्किटेक्चर प्लानर:* `"Design a scalable backend for [App] handling 50K users. Compare SQL vs NoSQL, caching (Redis), and deployment cost."`
      - *यूनिट टेस्ट जनरेटर:* `"Write 6 pytest unit tests covering normal, boundary, and failure cases for this function: [code]."`
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
    "3. छात्रों की पढ़ाई और परीक्षा तैयारी",
    [
      #set text(size: 7.8pt)
      - *सरल उदाहरण नियम:* `"Explain [Complex Topic e.g. OSPF / Transformers] using a simple everyday Indian analogy, then give the technical definition."`
      - *एक्टिव रिकॉल क्विज़:* `"Turn these notes [paste] into 10 exam-style MCQs (4 options each) with an answer key and 1-line explanation at the bottom."`
      - *80/20 स्टडी प्लान:* `"I have 7 days to learn [Topic] for an exam. Build a day-by-day 2-hour/day roadmap focusing on the 20% topics that carry 80% marks."`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "4. ऑफिस, Excel फॉर्मूला, SQL और ईमेल",
    [
      #set text(size: 7.8pt)
      - *Excel / Sheets जादूगर:* `"I need an Excel formula: if Col A is 'Paid' and Col B > 5000, apply 18% GST, else 0. Explain how it works."`
      - *SQL क्वेरी बिल्डर:* `"Tables: Orders(id, cust_id, amount, date), Customers(id, city). Write a PostgreSQL query for top 3 cities by revenue in 2026."`
      - *कॉर्पोरेट ईमेल:* `"Rewrite this rough message [paste] into a polite, crisp 4-line corporate email with a clear Call-to-Action."`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(4.8pt)

#card(
  "5. मेगा मेटा-प्रॉम्प्ट: AI से ही अपना परफेक्ट प्रॉम्प्ट लिखवाएँ!",
  [
    #set text(size: 7.8pt)
    *इसे कभी भी कॉपी-पेस्ट करें:* #cmd("I want you to become my Expert Prompt Engineer. Your goal is to help me craft the best prompt for: [MY GOAL]. Ask me 3 clarifying questions first, then generate a structured CO-STAR prompt ready to copy-paste.")
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(4.8pt)

#card(
  "6. AI इमेज जनरेशन प्रॉम्प्ट्स (Midjourney / Ideogram / Flux)",
  [
      #align(center)[#image("02_BRAND_ASSETS/ai_image_prompt_anatomy_visual.png", width: 88%)]
      #v(4pt)
      #set text(size: 7.7pt)
      - *4K टेक पोस्टर / थंबनेल:* `"Futuristic Indian developer at glowing holographic dual-monitor desk, bold 3D text 'AI 2027', neon cyan & violet rim lighting, 85mm lens, ultra-detailed 8K --ar 16:9"`
      - *मिनिमल वेक्टर लोगो:* `"Flat minimalist geometric tech logo for 'RTechLab', neural circuit + shield icon, electric blue gradient on dark navy, vector SVG style --no photorealistic"`
      - *स्टूडियो प्रोडक्ट मॉकअप:* `"Sleek matte-black wireless earbuds floating above dark basalt stone, soft studio key light, crisp water droplets, Apple commercial photography --ar 4:5"`
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(4.8pt)
#did-you-know[प्रॉम्प्ट के अंदर `<context>...</context>` और `<rules>...</rules>` जैसे XML टैग्स का उपयोग करना *Claude* और *GPT* मॉडल्स के लिए आधिकारिक बेस्ट प्रैक्टिस है — यह निर्देशों को डेटा से साफ अलग रखता है!]

#pagebreak()

// =========================================================================
// PAGE 5: TOP 2026-27 AI TOOLS ECOSYSTEM DIRECTORY
// =========================================================================
#section-banner("04", "टॉप 2026–27 AI टूल्स इकोसिस्टम डायरेक्टरी", "LLMs, कोडिंग IDEs, रिसर्च, डिज़ाइन, वीडियो, ऑडियो और ऑटोमेशन")

#card(
  "श्रेणी के अनुसार जरूरी AI टूल्स (डायरेक्ट वेबसाइट्स और उपयोग)",
  tbl(
    (auto, auto, 1fr, auto),
    ("श्रेणी", "टूल का नाम", "सर्वश्रेष्ठ उपयोग और प्रो फीचर्स", "वेबसाइट"),
    (
      ([*General LLM*], [*ChatGPT (GPT-4o/o3)*], [ऑल-राउंडर रीज़निंग, वॉइस मोड, Canvas और Custom GPTs], [`chatgpt.com`]),
      ([*Coding/Writing*], [*Claude (Sonnet/Opus)*], [कोडिंग, Artifacts UI और नेचुरल ह्यूमन राइटिंग में बेस्ट], [`claude.ai`]),
      ([*Multimodal/Docs*], [*Google Gemini*], [1M–2M कॉन्टेक्स्ट विंडो, Workspace (Docs/Drive), YouTube/PDFs], [`gemini.google.com`]),
      ([*Live Research*], [*Perplexity AI*], [क्लिकेबल स्रोतों के साथ रियल-टाइम वेब रिसर्च], [`perplexity.ai`]),
      ([*Open/Reasoning*], [*DeepSeek / Llama*], [हाई-परफॉरमेंस ओपन-वेट्स रीज़निंग व कम खर्च वाला API], [`deepseek.com`]),
      ([*AI Code IDE*], [*Cursor / Antigravity*], [एजेंटिक कोड एडिटिंग, मल्टी-फाइल रिफैक्टर व टर्मिनल], [`cursor.com`]),
      ([*UI Builder*], [*v0.dev / Bolt.new*], [टेक्स्ट से पूरा React/Tailwind UI और लाइव वेब ऐप बनाएँ], [`v0.dev`]),
      ([*Image Gen*], [*Midjourney / Ideogram*], [फोटोरियलिस्टिक आर्ट (MJ) व सटीक पोस्टर टेक्स्ट (Ideogram)], [`ideogram.ai`]),
      ([*Video Gen*], [*Runway / Veo / Kling*], [टेक्स्ट-टू-वीडियो, इमेज-टू-वीडियो और AI मोशन एडिटिंग], [`runwayml.com`]),
      ([*Voice / Audio*], [*ElevenLabs / Suno*], [हिंदी/अंग्रेजी रियलिस्टिक वॉइसओवर और AI म्यूज़िक], [`elevenlabs.io`]),
      ([*Study / Notes*], [*NotebookLM*], [50 PDF अपलोड करें → सटीक Q&A + AI ऑडियो पॉडकास्ट], [`notebooklm.google`]),
      ([*Automation*], [*n8n / Make / Zapier*], [Gmail, Sheets, WhatsApp और AI Agents को विजुअली जोड़ें], [`n8n.io`]),
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
    "लोकल / ऑफलाइन AI (अपने PC पर मुफ्त LLM चलाएँ)",
    [
      #set text(size: 7.9pt)
      - *Ollama (`ollama.com`):* ओपन-सोर्स मॉडल्स (`Llama 3.2`, `Mistral`, `Qwen 2.5`, `DeepSeek-R1`) 100% ऑफलाइन मुफ्त चलाएँ: #cmd("ollama run llama3.2")
      - *LM Studio (`lmstudio.ai`):* आसान डेस्कटॉप GUI जिससे लोकल API सर्वर (`localhost:1234`) चला सकते हैं।
      - *हार्डवेयर टिप:* `7B–8B` मॉडल्स 8 GB VRAM GPU या 16 GB RAM पर आराम से चलते हैं!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "सही AI टूल कैसे चुनें? (त्वरित गाइड)",
    [
      #set text(size: 7.9pt)
      - *आज की ताज़ा खबरों के तथ्य चाहिए?* → *Perplexity* या *Gemini*
      - *साफ फुल-स्टैक कोड लिखना है?* → *Claude* या *Cursor*
      - *300 पेज की PDF किताब समझनी है?* → *NotebookLM* या *Gemini*
      - *सटीक टेक्स्ट वाला पोस्टर बनाना है?* → *Ideogram* या *Canva AI*
      - *ऑटोमेटेड WhatsApp/Email बॉट?* → *n8n* + *OpenAI/Gemini API*
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(14.5pt)

#card(
  "Free बनाम Paid प्रोडक्शन AI टूल्स स्टैक (रियल ऐप्स बनाएँ)",
  [
    #tbl(
      (auto, 1fr, 1fr),
      ("श्रेणी", "मुफ्त / ओपन-सोर्स (₹0 शुरुआत)", "पेड प्रोडक्शन प्रो"),
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
#did-you-know[Google का *NotebookLM* केवल उन्हीं स्रोतों से उत्तर देता है जिन्हें *आप* अपलोड करते हैं — इससे छात्रों को लगभग शून्य गलत जानकारी (hallucination) और सटीक पेज नंबर मिलते हैं!]

#pagebreak()

// =========================================================================
// PAGE 6: RAG ARCHITECTURE & VECTOR DATABASES
// =========================================================================
#section-banner("05", "RAG आर्किटेक्चर और वेक्टर डेटाबेस", "निजी डेटा पर LLM ग्राउंडिंग · Embeddings, Chunking और Fine-Tuning")

#card(
  "RAG और Agentic AI आर्किटेक्चर विजुअल",
  [
    #align(center)[#image("02_BRAND_ASSETS/ai_rag_agents_visual.png", width: 100%)]
    #v(5pt)
    #set text(size: 8.9pt)
    *RAG क्यों?* LLM के पास केवल पुरानी ट्रेनिंग का डेटा होता है और वह आपकी कंपनी की PDFs या निजी डेटाबेस नहीं जानता। *RAG* प्रश्न पूछते समय सही टुकड़े ढूँढकर प्रॉम्प्ट में जोड़ता है ताकि LLM सटीक प्रमाणों के साथ उत्तर दे!
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(38pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "प्रोडक्शन RAG पाइपलाइन बनाने के 5 चरण",
    [
      #set text(size: 8.9pt)
      1. *Load & Parse:* PDFs, Docs, Notion या SQL से साफ टेक्स्ट निकालें (`PyMuPDF`, `Unstructured`)।
      2. *Chunking:* टेक्स्ट को `400–800 टोकन` के टुकड़ों में `10–20% ओवरलैप` के साथ बाँटें।
      3. *Embed:* हर चंक को न्यूमेरिक वेक्टर में बदलें (`text-embedding-3-small`, `BGE`, `Nomic`)।
      4. *Store & Search:* *Pinecone, ChromaDB, Qdrant, Weaviate या pgvector* में सेव करें; *Cosine Similarity* + *BM25* से खोजें।
      5. *Generate:* टॉप-K चंक्स + सवाल LLM को भेजें: _"केवल दिए गए डेटा से ही उत्तर दें।"_
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Prompting vs RAG vs Fine-Tuning (इंटरव्यू क्लासिक)",
    tbl(
      (auto, 1fr, auto),
      ("तरीका", "कब सबसे अच्छा है?", "लागत / समय"),
      (
        ([*Prompt Eng.*], [बेहतर फॉर्मेट, लॉजिक, टोन या त्वरित काम के लिए], [सबसे कम (मिनटों में)]),
        ([*RAG*], [ताज़ा तथ्य, निजी PDFs और सटीक साइटेशन के लिए], [मध्यम (घंटे–दिन)]),
        ([*Fine-Tuning*], [खास स्टाइल, मेडिकल/लीगल शब्दावली या छोटे तेज़ मॉडल के लिए], [अधिक (GPU + डेटासेट)]),
      ),
      pad-y: 7pt,
      fsize: 8.9pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(38pt)
#did-you-know[हाइब्रिड सर्च (*Vector Semantic Search* + *BM25 Keyword Search*) के साथ *Cross-Encoder Reranker* (जैसे Cohere Rerank) उपयोग करने से RAG की सटीकता *15–30%* तक बढ़ जाती है!]

#pagebreak()

// =========================================================================
// PAGE 7: AGENTIC AI, FUNCTION CALLING & MCP
// =========================================================================
#section-banner("06", "एजेंटिक AI, फंक्शन कॉलिंग और MCP", "स्वायत्त वर्कफ़्लो · ReAct लूप, फ्रेमवर्क और स्ट्रक्चर्ड JSON")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "AI को 'एजेंट' क्या बनाता है? (4 मुख्य स्तंभ)",
    [
      #set text(size: 8.9pt)
      सामान्य चैटबॉट (1 सवाल → 1 जवाब) के विपरीत, *AI Agent* लक्ष्य पूरा होने तक लूप में काम करता है:
      1. *Planning (योजना):* बड़े लक्ष्य को छोटे स्टेप्स में बाँटता है (*ReAct*: Reason → Act → Observe)।
      2. *Tool Calling:* LLM बाहरी APIs (वेब सर्च, SQL, Python, Email) चलाने के लिए JSON आउटपुट देता है।
      3. *Memory:* *Short-term* (कॉन्टेक्स्ट विंडो) + *Long-term* (Vector DB)।
      4. *Reflection:* अपने ही आउटपुट की गलती पकड़कर दोबारा सुधारता है।
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "MCP (Model Context Protocol) — AI का 'USB-C'",
    [
      #set text(size: 8.9pt)
      - *समस्या:* पहले 5 AI ऐप्स को 10 टूल्स (GitHub, Drive, Slack, Postgres) से जोड़ने के लिए 50 अलग कोड लिखने पड़ते थे।
      - *MCP समाधान (Anthropic, ओपन स्टैंडर्ड):* एक यूनिवर्सल प्रोटोकॉल जहाँ टूल्स *Tools* (एक्शन), *Resources* (फाइलें/डेटा) और *Prompts* को किसी भी MCP क्लाइंट (Claude, Cursor, Antigravity) के लिए उपलब्ध कराते हैं।
      - *लाभ:* अपने डेटाबेस के लिए 1 MCP सर्वर बनाएँ, और हर AI एजेंट उससे जुड़ जाएगा!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  )
)

#v(30pt)

#card(
  "2026–27 एजेंटिक AI फ्रेमवर्क्स और ऑर्केस्ट्रेशन तुलना",
  tbl(
    (auto, auto, 1fr, auto),
    ("फ्रेमवर्क", "भाषा", "मुख्य ताकत और आदर्श उपयोग", "जटिलता"),
    (
      ([*LangGraph*], [Python / JS], [स्टेटफुल ग्राफ, ह्यूमन-इन-द-लूप और प्रोडक्शन विश्वसनीयता], [मध्यम–उच्च]),
      ([*CrewAI*], [Python], [रोल-आधारित मल्टी-एजेंट टीम (Researcher + Writer + Reviewer)], [कम–मध्यम]),
      ([*LlamaIndex*], [Python / TS], [डॉक्यूमेंट-हैवी RAG पाइपलाइन और एंटरप्राइज डेटा कनेक्टर], [मध्यम]),
      ([*AutoGen*], [Python], [मल्टी-एजेंट कोड एक्ज़ीक्यूशन व संवादात्मक समस्या समाधान], [मध्यम]),
      ([*n8n AI Agent*], [विजुअल / No-Code], [ड्रैग-एंड-ड्रॉप ट्रिगर (Webhook, Gmail, WhatsApp) + LLM + Tools], [शुरुआती के लिए बेस्ट]),
    ),
    pad-y: 6.8pt,
    fsize: 8.8pt
  ),
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(30pt)

#card(
  "Structured Outputs (JSON Schema) और Function Calling उदाहरण",
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
        *यह कैसे काम करता है?*
        - LLM कभी खुद कोड नहीं चलाता — वह केवल यह सटीक JSON लौटाता है (`json_schema` द्वारा 100% वैध)।
        - आपका बैकएंड फंक्शन चलाकर परिणाम वापस LLM को देता है, जिससे अंतिम उत्तर बनता है!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(30pt)
#did-you-know[प्रोडक्शन में 80% मामलों में अच्छे *Tool Calling* व *Structured JSON* वाला एक सिंगल-एजेंट जटिल मल्टी-एजेंट सिस्टम से बेहतर चलता है — हमेशा सरल शुरुआत करें!]

#pagebreak()

// =========================================================================
// PAGE 8: AI FOR CODING, DATA ANALYTICS & AUTOMATION
// =========================================================================
#section-banner("07", "कोडिंग, डेटा एनालिटिक्स और ऑटोमेशन के लिए AI", "Python LLM APIs, SQL/Pandas कोपायलट, वाइब कोडिंग और n8n")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Python LLM API क्विकस्टार्ट (OpenAI / Gemini SDK)",
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
      *खर्च टिप:* 90% कामों के लिए `gpt-4o-mini` / `gemini-2.5-flash` उपयोग करें (~20x सस्ता)!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "No-Code AI ऑटोमेशन ब्लूप्रिंट (n8n / Make)",
    [
      #set text(size: 8.9pt)
      *उदाहरण: ऑटो-रिप्लाई सपोर्ट और लीड ट्रैकर (15 मिनट में बनाएँ):*
      1. *Trigger:* नया WhatsApp / Gmail / Google Form सबमिशन आता है।
      2. *AI Classifier:* LLM उद्देश्य (`Sales`, `Support`, `Spam`) पहचानकर नाम व शहर JSON में निकालता है।
      3. *Database:* Google Sheets / Airtable / Notion में साफ रो जोड़ता है।
      4. *Action:* तुरंत ग्राहक को रिप्लाई भेजता है या Telegram पर अलर्ट देता है!
      *लाभ:* फ्रीलांसर्स और संस्थानों के रोज़ 2–3 घंटे बचाता है।
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(29pt)

#card(
  "AI डेटा एनालिटिक्स और प्रो 'वाइब कोडिंग' नियम",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        *3x तेज़ डेटा एनालिटिक्स:*
        - ChatGPT/Claude में CSV अपलोड करें → ऑटो-क्लीनिंग, चार्ट और आउटलायर्स पाएं।
        - जटिल *Power BI DAX* और *SQL Window Functions* (`RANK()`, `CTE`) सेकंडों में लिखवाएँ।
        - *सुरक्षा नियम:* कभी भी संवेदनशील ग्राहक पासवर्ड/PII पब्लिक चैट में अपलोड न करें!
      ],
      [
        #set text(size: 8.9pt)
        *प्रो 'वाइब कोडिंग' वर्कफ़्लो (Cursor / Antigravity):*
        - *1. पहले प्लान:* कोड लिखवाने से पहले 5-स्टेप प्लान बनवाएँ।
        - *2. छोटे बदलाव:* एक बार में 1 फीचर बनाएँ और तुरंत टेस्ट करें।
        - *3. `.cursorrules` / `AGENTS.md`:* प्रोजेक्ट के नियम रूट में रखें।
        - *4. हमेशा जाँचें:* टेस्ट चलाएँ और सिक्योरिटी कोड खुद पढ़ें!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(29pt)

#card(
  "AI डेवलपर स्टैक और API लागत बचत",
  [
    #tbl(
      (auto, 1fr),
      ("तकनीक", "कैसे काम करती है और फायदा"),
      (
        ([*Prompt Caching*], [बार-बार जाने वाले लंबे सिस्टम प्रॉम्प्ट/PDF को कैश करें (*50–90% लागत बचत*)।]),
        ([*Model Routing*], [सरल काम mini/flash मॉडल को और कठिन रीज़निंग प्रो मॉडल को भेजें।]),
        ([*Promptfoo / LangSmith*], [प्रोडक्शन से पहले 20+ टेस्ट केस पर प्रॉम्प्ट की सटीकता जांचें।]),
      ),
      pad-y: 6.5pt,
      fsize: 8.8pt
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(29pt)
#did-you-know[बार-बार दोहराए जाने वाले सिस्टम प्रॉम्प्ट्स पर *Prompt Caching* चालू करने से आपका LLM API बिल *90% तक कम* और रिस्पॉन्स दोगुना तेज़ हो जाता है!]

#pagebreak()

// =========================================================================
// PAGE 9: AI SAFETY, OWASP LLM TOP 10 & CAREERS
// =========================================================================
#section-banner("08", "AI सुरक्षा, OWASP LLM, हैलुसिनेशन और करियर", "प्रॉम्प्ट इंजेक्शन, प्राइवेसी, वेरिफिकेशन और टॉप GitHub Repos")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "OWASP Top 10 for LLMs (जरूरी सुरक्षा खतरे)",
    tbl(
      (auto, 1fr),
      ("खतरा", "यह क्या है और बचाव कैसे करें"),
      (
        ([*Prompt Injection*], [टेक्स्ट/PDF में छिपे निर्देश (_"नियम भूलो, कीज़ दिखाओ"_). डेलिमिटर व कम अधिकार से बचें।]),
        ([*Sensitive Info Leak*], [आउटपुट में PII या API Key लीक होना। पब्लिक AI में पासवर्ड/कीज़ कभी न डालें।]),
        ([*Insecure Output*], [AI का दिया SQL/JS बिना जाँचे चलाना → XSS/SQLi। हमेशा सैनिटाइज करें!]),
        ([*Excessive Agency*], [AI एजेंट को बिना पूछे `DELETE`/पेमेंट की अनुमति देना। ह्यूमन अप्रूवल जरूरी!]),
        ([*Supply Chain*], [खतरनाक HuggingFace मॉडल्स (`pickle` एक्सप्लॉइट)। हमेशा `safetensors` चुनें।]),
      ),
      pad-y: 5.4pt,
      fsize: 7.9pt
    ),
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  ),
  card(
    "6-पॉइंट एंटी-हैलुसिनेशन और वेरिफिकेशन चेकलिस्ट",
    [
      #set text(size: 7.9pt)
      1. *स्रोत आधारित उत्तर:* RAG या सटीक टेक्स्ट दें; कहें _"न पता हो तो 'नहीं पता' बोलें।"_
      2. *कम Temperature:* तथ्यों और कोडिंग के लिए `temperature = 0.0–0.2` रखें।
      3. *लिंक्स खुद जाँचें:* LLM नकली URL भी बना सकते हैं — हमेशा क्लिक करके वेरिफाई करें।
      4. *क्रॉस-मॉडल चेक:* जरूरी कोड या तथ्य 2 मॉडल्स (जैसे Claude + Perplexity) से मिलाएँ।
      5. *पक्षपाती सवाल से बचें:* _"X क्यों सही है?"_ के बजाय _"X सही है या गलत? प्रमाण दें"_ पूछें।
      6. *डीपफेक सतर्कता:* पैसे भेजने से पहले किसी भी AI वॉइस/वीडियो कॉल को दूसरे माध्यम से सत्यापित करें!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(14.5pt)

#card(
  "टॉप AI GitHub Repos और नॉलेज वेबसाइट्स (क्लिकेबल लिंक्स)",
  tbl(
    (auto, 1fr, auto),
    ("संसाधन / रेपो", "क्या सीखेंगे / फायदा", "डायरेक्ट लिंक"),
    (
      ([*Awesome ChatGPT Prompts*], [1000+ आज़माए हुए रोल प्रॉम्प्ट्स], [#link("https://github.com/f/awesome-chatgpt-prompts")[`github.com/f/awesome-chatgpt-prompts`]]),
      ([*Awesome LLM Apps*], [तैयार RAG, AI Agent और वॉइस एजेंट कोड], [#link("https://github.com/Shubhamsaboo/awesome-llm-apps")[`github.com/Shubhamsaboo/awesome-llm-apps`]]),
      ([*MS GenAI Beginners*], [Microsoft का 18-लेसन ओपन-सोर्स AI कोर्स], [#link("https://github.com/microsoft/generative-ai-for-beginners")[`github.com/microsoft/generative-ai...`]]),
      ([*n8n / Dify / Ollama*], [सेल्फ-होस्ट AI एजेंट्स, वर्कफ़्लो व लोकल LLM], [#link("https://github.com/n8n-io/n8n")[`github.com/n8n-io/n8n`]]),
      ([*PromptingGuide + DeepLearning*], [आधिकारिक प्रॉम्प्ट गाइड और मुफ्त कोर्स], [#link("https://www.promptingguide.ai")[`promptingguide.ai`] · #link("https://www.deeplearning.ai")[`deeplearning.ai`]]),
      ([*HuggingFace + Kaggle*], [ओपन मॉडल्स, डेटासेट्स व AI प्रतियोगिताएँ], [#link("https://huggingface.co")[`huggingface.co`] · #link("https://www.kaggle.com/learn")[`kaggle.com/learn`]]),
      ([*Futurepedia / TAAFT*], [10,000+ नए AI टूल्स की दैनिक डायरेक्टरी], [#link("https://www.futurepedia.io")[`futurepedia.io`] · #link("https://theresanaiforthat.com")[`theresanaiforthat.com`]]),
    ),
    pad-y: 5.4pt,
    fsize: 7.6pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(14.5pt)

#card(
  "2026–27 हाई-पेइंग AI करियर पथ और पोर्टफोलियो ब्लूप्रिंट (भारत)",
  [
    #tbl(
      (auto, 1fr, 1fr),
      ("रोल", "सीखने के लिए मुख्य स्टैक", "जरूरी पोर्टफोलियो प्रोजेक्ट"),
      (
        ([*GenAI / RAG Dev*], [Python, FastAPI, Vector DB, LangGraph, OpenAI/Gemini], [साइटेशन के साथ PDF/SQL Q&A चैटबॉट]),
        ([*AI Automation Eng.*], [n8n, Make, Webhooks, REST APIs, WhatsApp/Sheets], [ऑटोमेटेड लीड क्वालिफायर + CRM सिंक बॉट]),
        ([*AI Security Analyst*], [OWASP LLM Top 10, Red Teaming, Garak, Guardrails], [प्रॉम्प्ट इंजेक्शन स्कैनर और गार्डरेल प्रॉक्सी]),
      ),
      pad-y: 5.4pt,
      fsize: 7.9pt
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(14.5pt)
#did-you-know[बड़े AI मॉडल भी कभी-कभी *नकली Python/npm पैकेज नाम* बना देते हैं — हैकर्स उन काल्पनिक नामों को PyPI/npm पर रजिस्टर कर लेते हैं (*"Slopsquatting"*) ताकि लापरवाह डेवलपर्स के सिस्टम हैक हो सकें!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 AI INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "टॉप 10 AI इंटरव्यू प्रश्न और RTECHLAB लेखक परिचय", "GenAI / AI इंजीनियर तैयारी · प्रमाणपत्र, ध्येय और व्हाट्सएप हेल्प डेस्क")

#card(
  "टॉप 10 AI और प्रॉम्प्ट इंजीनियरिंग इंटरव्यू प्रश्न-उत्तर",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.8pt)
        *1. Token क्या है?* शब्द का छोटा हिस्सा (~4 अक्षर) जिसे LLM पढ़ता/बनाता है और बिल करता है (`1K tokens ≈ 750 words`)। \
        *2. Temperature बनाम Top-P?* Temperature क्रिएटिविटी/रैंडमनेस तय करता है (`0` = सटीक); Top-P शीर्ष संभावित टोकन चुनता है। \
        *3. Zero-Shot बनाम Few-Shot?* Zero-shot में उदाहरण नहीं होते; Few-shot में फॉर्मेट लॉक करने के लिए 2–5 उदाहरण देते हैं। \
        *4. Chain-of-Thought क्या है?* अंतिम उत्तर से पहले स्टेप-बाय-स्टेप तर्क लिखवाना ताकि लॉजिक की गलती न हो। \
        *5. RAG बनाम Fine-Tuning?* RAG क्वेरी के समय ताज़ा/निजी तथ्य जोड़ता है; Fine-tuning मॉडल के वेट्स में स्टाइल सिखाता है।
      ],
      [
        #set text(size: 8.8pt)
        *6. RAG में Chunk Overlap क्यों?* ताकि दो टुकड़ों के बीच कटने वाले वाक्यों का संदर्भ (context) न खोए। \
        *7. Hallucination क्या है?* LLM द्वारा आत्मविश्वास से गलत तथ्य गढ़ना; RAG, `temp=0` और सख्त निर्देशों से कम होता है। \
        *8. Prompt Injection क्या है?* बाहरी टेक्स्ट द्वारा सिस्टम निर्देशों को बदलना; डेलिमिटर व कम अधिकार से बचाव होता है। \
        *9. AI Agent क्या है?* प्लानिंग (ReAct), मेमोरी और टूल-कॉलिंग लूप वाला LLM जो कई स्टेप्स में लक्ष्य पूरा करे। \
        *10. MCP क्या है?* Model Context Protocol — AI क्लाइंट्स को टूल्स व डेटा से जोड़ने वाला ओपन स्टैंडर्ड।
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
          *अनुभव व प्रमाणन:* #hl-p("AI Systems & Automation Architect") · #hl-b("CEH (EC-Council)") · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · डायरेक्टर एवं लीड आईटी ट्रेनर, IANT कंप्यूटर एजुकेशन, पालनपुर · *10+ वर्षों का अनुभव · 3,000+ छात्र प्रशिक्षित*।
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8.8pt)[
            *हमारा RTechLab ध्येय (Motto):* _"Technology Made Practical — सीखें, अभ्यास करें और ऑटोमेट करें। AI आपकी जगह नहीं लेगा, लेकिन मजबूत बुनियाद और AI का सही उपयोग करने वाला व्यक्ति जरूर आगे निकल जाएगा। भारत में निर्मित ताकि ₹22 में ₹2,200 जैसा ज्ञान मिले।"_
          ]
        )
      ]
    )
  ]
)

#v(26pt)

// 4 SCANNABLE QR CODES
#card(
  "स्कैन करें और RTechLab से जुड़ें (मुफ्त AI लैब्स, टूल्स और अपडेट्स)",
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
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[YouTube लैब्स] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 7pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 32.5mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[Instagram रील्स] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily AI Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 32.5mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp चैनल] \
        #link("https://wa.me/917646892094")[#text(size: 7pt, fill: rgb("#16a34a"))[जॉब व नोट्स अलर्ट]]
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
      #text(size: 9.2pt, weight: "bold", fill: rgb("#14532d"))[RTechLab छात्र हेल्प डेस्क और करियर मार्गदर्शन] \
      #text(size: 7.8pt, fill: rgb("#166534"))[AI प्रोजेक्ट्स, RAG, n8n ऑटोमेशन या टेक करियर रोडमैप में मदद चाहिए? सीधे WhatsApp पर पूछें!]
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
