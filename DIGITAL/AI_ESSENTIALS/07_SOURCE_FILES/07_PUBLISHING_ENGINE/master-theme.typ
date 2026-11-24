// =============================================================================
// RTECHLAB MASTER TYPST THEME — VERSION 5 (COMMERCIAL PRODUCTION MASTER)
// Unified Design System · 45-Page Exact Bilingual Layout
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-navy = rgb("#0F172A")        // Slate 900
#let rtech-cyan = rgb("#0284C7")        // Sky 600
#let rtech-accent = rgb("#38BDF8")      // Sky 400
#let rtech-violet = rgb("#4F46E5")      // Indigo / Violet accent for V5
#let rtech-paper = rgb("#F8FAFC")       // Slate 50
#let rtech-text = rgb("#1E293B")        // Slate 800
#let rtech-muted = rgb("#64748B")       // Slate 500
#let rtech-border = rgb(15, 23, 42, 12%)// Subtle border
#let rtech-emerald = rgb("#059669")
#let rtech-amber = rgb("#D97706")
#let rtech-rose = rgb("#DC2626")

// Master Book Setup Function
#let rtech-book(
  title: "Artificial Intelligence Essentials & Career Accelerator",
  subtitle: "1950 Foundations to 2027 Agentic AI, Indic LLMs & ₹38 LPA Salary Blueprints",
  author: "Rahul Patel",
  edition: "2027 Master Edition · Commercial Release",
  subject-code: "RTL-2027-AI-ESS",
  body
) = {
  set page(
    paper: "a4",
    margin: (x: 13.5mm, top: 18mm, bottom: 15mm),
    fill: rtech-paper,
    
    // Universal RTechLab Watermark on Content Pages
    background: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        place(
          center + horizon,
          rotate(
            -32deg,
            block(
              align(center)[
                #text(size: 38pt, weight: "black", fill: rgb(15, 23, 42, 4%), tracking: 3pt)[
                  RTECHLAB
                ]
                #v(4pt)
                #text(size: 16pt, weight: "bold", fill: rgb(2, 132, 199, 5%), tracking: 4pt)[
                  OFFICIAL CERTIFIED PUBLICATION
                ]
              ]
            )
          )
        )
      }
    },
    
    // Universal Two-Tier Running Header
    header: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        block(
          width: 100%,
          stroke: (bottom: 0.5pt + rtech-border),
          inset: (bottom: 2mm),
          [
            #grid(
              columns: (1fr, 1fr),
              align: (left, right),
              [
                #text(size: 8pt, weight: "black", fill: rtech-navy)[RTECHLAB]
                #text(size: 8pt, fill: rtech-cyan, weight: "bold")[ | #title]
              ],
              [
                #text(size: 7.5pt, font: "Segoe UI", fill: rtech-muted)[
                  #edition · #author
                ]
              ]
            )
          ]
        )
      }
    },
    
    // Universal Running Footer
    footer: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        block(
          width: 100%,
          stroke: (top: 0.5pt + rtech-border),
          inset: (top: 2mm),
          [
            #grid(
              columns: (1fr, auto),
              align: (left, right),
              [
                #text(size: 6.8pt, font: "Segoe UI", fill: rtech-muted)[
                  #text(fill: rtech-cyan)[●] Technology Made Practical · Learn. Practice. Innovate.
                ]
              ],
              [
                #box(
                  fill: rtech-navy,
                  radius: 3pt,
                  inset: (x: 6pt, y: 2pt),
                  text(size: 7pt, weight: "bold", fill: white)[Page #page-num]
                )
              ]
            )
          ]
        )
      }
    }
  )

  // Typography & Paragraph Styling
  set text(
    font: ("Segoe UI", "Nirmala UI", "Arial"),
    size: 9.2pt,
    fill: rtech-text,
    spacing: 128%,
    lang: "en"
  )
  
  set par(
    justify: true,
    leading: 0.68em,
    first-line-indent: 0pt
  )

  // Heading Styles
  show heading.where(level: 1): it => block(
    width: 100%,
    stroke: (bottom: 1.5pt + rtech-cyan),
    inset: (bottom: 3pt),
    spacing: 7pt,
    [
      #text(size: 13pt, weight: "black", fill: rtech-navy)[#it.body]
    ]
  )

  show heading.where(level: 2): it => block(
    width: 100%,
    inset: (top: 4pt, bottom: 2pt),
    spacing: 4pt,
    [
      #text(size: 9.8pt, weight: "bold", fill: rtech-navy)[#it.body]
    ]
  )

  show heading.where(level: 3): it => block(
    inset: (top: 2pt, bottom: 1pt),
    spacing: 2pt,
    [
      #text(size: 8.8pt, weight: "bold", fill: rtech-cyan.darken(10%))[#it.body]
    ]
  )

  body
}

// -----------------------------------------------------------------------------
// VISUAL COMPONENTS
// -----------------------------------------------------------------------------

// Highlighter
#let hl(body) = highlight(fill: rgb("#FEF08A"), body)

// Concept Box
#let concept-box(title: "CORE ENGINEERING CONCEPT", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-cyan),
    fill: white,
    radius: (right: 3pt),
    inset: (x: 6pt, y: 4pt),
    spacing: 3pt,
    [
      #text(size: 7.5pt, weight: "bold", fill: rtech-navy)[#title]\
      #v(1.5pt)
      #text(size: 7.5pt, fill: rtech-text)[#body]
    ]
  )
}

#let callout-box(title, body) = concept-box(title: title, body)

// Warning Box
#let warning-box(title: "SAFETY & OPERATIONAL WARNING", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rtech-rose),
    fill: rgb("#FFF1F2"),
    radius: (right: 3pt),
    inset: (x: 6pt, y: 4pt),
    spacing: 3pt,
    [
      #text(size: 7.5pt, weight: "bold", fill: rtech-rose.darken(20%))[#title]\
      #v(1.5pt)
      #text(size: 7.3pt, fill: rtech-text)[#body]
    ]
  )
}

// 2027 Technology Spotlight Box
#let tech-spotlight-box(arg1, ..rest) = {
  let title = "2027 FRONTIER TECHNOLOGY SPOTLIGHT"
  let body = arg1
  if rest.pos().len() > 0 {
    title = arg1
    body = rest.pos().at(0)
  }
  if rest.named().at("title", default: none) != none {
    title = rest.named().at("title")
  }
  block(
    width: 100%,
    stroke: 0.5pt + rtech-violet,
    fill: rgb("#EEF2FF"),
    radius: 3pt,
    inset: 5pt,
    spacing: 2.5pt,
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 4pt,
        box(fill: rtech-violet, inset: (x: 3pt, y: 1.5pt), radius: 2pt, text(size: 6pt, weight: "bold", fill: white)[2027 TECH]),
        text(size: 7.3pt, weight: "bold", fill: rtech-violet.darken(25%))[#title]
      )
      #v(1.5pt)
      #text(size: 7pt, fill: rtech-text)[#body]
    ]
  )
}

// Did You Know Fact Box
#let fact-box(arg1, ..rest) = {
  let title = "DID YOU KNOW? — HARDWARE FACT"
  let body = arg1
  if rest.pos().len() > 0 {
    title = arg1
    body = rest.pos().at(0)
  }
  if rest.named().at("title", default: none) != none {
    title = rest.named().at("title")
  }
  block(
    width: 100%,
    stroke: 0.5pt + rtech-amber,
    fill: rgb("#FFFBEB"),
    radius: 3pt,
    inset: 5pt,
    spacing: 2.5pt,
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 4pt,
        box(fill: rtech-amber, inset: (x: 3pt, y: 1.5pt), radius: 2pt, text(size: 6pt, weight: "bold", fill: white)[DID YOU KNOW?]),
        text(size: 7.3pt, weight: "bold", fill: rtech-amber.darken(25%))[#title]
      )
      #v(1.5pt)
      #text(size: 7pt, fill: rtech-text)[#body]
    ]
  )
}

// Photo Card
#let photo-card(img-path, caption: "", credit: "", height: 50pt) = {
  block(
    width: 100%,
    stroke: 0.4pt + rtech-border,
    fill: white,
    radius: 3pt,
    inset: 3pt,
    spacing: 2.5pt,
    [
      #align(center)[
        #image(img-path, height: height, fit: "contain")
      ]
      #if caption != "" [
        #v(1pt)
        #align(center)[
          #text(size: 6.8pt, style: "italic", fill: rtech-muted)[#caption]
        ]
      ]
    ]
  )
}

#let dual-photo(img1: "", cap1: "", img2: "", cap2: "", credit1: "", credit2: "", height: 52pt) = {
  grid(
    columns: (1fr, 1fr),
    gutter: 6pt,
    photo-card(img1, caption: cap1, credit: credit1, height: height),
    photo-card(img2, caption: cap2, credit: credit2, height: height)
  )
}

#let practical-box(title: "Practical Engineering Application", body) = {
  block(
    width: 100%,
    stroke: (left: 2.5pt + rtech-emerald, rest: 0.3pt + rtech-emerald.lighten(60%)),
    fill: rtech-emerald.lighten(95%),
    inset: 4pt,
    radius: (right: 3pt),
    spacing: 3pt,
    [
      #text(weight: "bold", size: 7.5pt, fill: rtech-emerald.darken(20%))[🛠️ #upper(title)]
      #v(1pt)
      #text(size: 7.2pt, fill: rtech-text)[#body]
    ]
  )
}

// Compact FAQ Item
#let faq-item(q: "", a: "") = {
  block(
    width: 100%,
    stroke: (left: 2pt + rtech-cyan),
    fill: white,
    inset: (x: 4pt, y: 2pt),
    spacing: 1.5pt,
    [
      #text(size: 7pt, weight: "bold", fill: rtech-navy)[Q: #q]\
      #text(size: 6.8pt, fill: rtech-text)[A: #a]
    ]
  )
}

// Short Review Question
#let short-q(num: 1, q: "", ans: "") = {
  block(
    width: 100%,
    inset: (x: 2pt, y: 1pt),
    spacing: 1.5pt,
    [
      #text(size: 7pt, weight: "bold", fill: rtech-navy)[Q#num. #q]
      #if ans != "" [
        #text(size: 6.8pt, fill: rtech-emerald.darken(10%))[ — #ans]
      ]
    ]
  )
}

#let short-qa(num: 1, q: "", a: "", ans: "") = {
  let final-ans = if a != "" { a } else { ans }
  short-q(num: num, q: q, ans: final-ans)
}

// Compact MCQ Box
#let mcq(num: 1, q: "", a: "", b: "", c: "", d: "", ans: "", expl: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rgb("#64748B"),
    fill: white,
    radius: 3pt,
    inset: (x: 4pt, y: 2.5pt),
    spacing: 1.8pt,
    [
      #text(size: 7.2pt, weight: "bold", fill: rtech-navy)[#num. #q]\
      #v(1pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 3pt,
        [#text(size: 6.7pt)[(A) #a]],
        [#text(size: 6.7pt)[(B) #b]],
        [#text(size: 6.7pt)[(C) #c]],
        [#text(size: 6.7pt)[(D) #d]]
      )
      #v(1pt)
      #text(size: 6.7pt, weight: "bold", fill: rtech-emerald.darken(10%))[Correct: Option #ans]
      #text(size: 6.5pt, fill: rtech-muted)[ — #expl]
    ]
  )
}

// Compact Interview Card
#let interview-compact(num: 1, q: "", a: "", follow_up: "") = {
  block(
    width: 100%,
    stroke: (left: 2pt + rtech-cyan),
    fill: rtech-paper,
    radius: (right: 3pt),
    inset: (x: 4.5pt, y: 2.2pt),
    spacing: 1.8pt,
    [
      #text(size: 7.2pt, weight: "bold", fill: rtech-navy)[Q#num. #q]\
      #text(size: 6.8pt, fill: rtech-text)[#a]
      #if follow_up != "" [
        #text(size: 6.2pt, style: "italic", fill: rtech-cyan.darken(15%))[ · _Follow-up:_ #follow_up]
      ]
    ]
  )
}

// Rapid-Fire Viva QA
#let viva-qa(num: 1, q: "", a: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rgb("#64748B"),
    fill: white,
    radius: 2pt,
    inset: (x: 4pt, y: 2pt),
    spacing: 1.5pt,
    [
      #text(size: 7pt, weight: "bold", fill: rtech-navy)[Q#num. #q]\
      #text(size: 6.8pt, fill: rtech-emerald.darken(15%))[Ans: #a]
    ]
  )
}

// Dedicated Practice Lab Placeholder Card (Clean, Zero-QR, Zero-URL)
#let practice-lab-placeholder(lang: "en") = {
  block(
    width: 100%,
    stroke: 0.5pt + rgb("#64748B"),
    fill: white,
    radius: 3pt,
    inset: 4pt,
    spacing: 2pt,
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 6pt,
        align: horizon,
        [
          #box(
            width: 32pt,
            height: 32pt,
            stroke: (paint: rgb("#94A3B8"), thickness: 0.5pt, dash: "dashed"),
            fill: rgb("#F8FAFC"),
            radius: 2pt,
            align(center + horizon)[
              #text(size: 5pt, weight: "bold", fill: rgb("#64748B"))[RESERVED\ FOR LAB]
            ]
          )
        ],
        [
          #if lang == "hi" [
            #text(size: 7.2pt, weight: "bold", fill: rtech-navy)[RTECHLAB अभ्यास लैब — शीघ्र उपलब्ध]\
            #v(1pt)
            #text(size: 6.5pt, fill: rtech-muted)[
              इंटरएक्टिव सिमुलेटर, बाइनरी टूल्स एवं अध्याय-वार ऑनलाइन टेस्ट विकास में हैं। आधिकारिक वेब पोर्टल लॉन्च पर सीधे एक्सेस लिंक्स सक्रिय किए जाएंगे।
            ]
          ] else [
            #text(size: 7.2pt, weight: "bold", fill: rtech-navy)[RTECHLAB PRACTICE LAB — COMING SOON]\
            #v(1pt)
            #text(size: 6.5pt, fill: rtech-muted)[
              Interactive browser simulators, automated binary calculators, and timed practice assessments are currently in development. Direct access links will be activated in the forthcoming cloud platform launch.
            ]
          ]
        ]
      )
    ]
  )
}

// Custom Specimen Box for CLI, Prompts & Scripts (High-Contrast Clean Theme)
#let terminal-specimen(title: "PRODUCTION CODE & COMMAND SPECIMEN", body) = {
  block(
    width: 100%,
    stroke: 0.5pt + rgb("#64748B"),
    fill: rgb("#F8FAFC"),
    radius: 4pt,
    inset: (x: 8.5pt, y: 6pt),
    spacing: 3.5pt,
    [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [#text(size: 7.2pt, weight: "bold", fill: rgb("#0F172A"), font: ("Consolas", "Courier New", "Segoe UI"))[#text(fill: rgb("#0284C7"))[⚡] #title]],
        [#box(fill: rgb("#E0F2FE"), stroke: 0.5pt + rgb("#38BDF8"), radius: 2pt, inset: (x: 5pt, y: 2pt), text(size: 5.8pt, weight: "bold", fill: rgb("#0369A1"))[RTECHLAB ENTERPRISE SPECIMEN])]
      )
      #v(2pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#64748B"))
      #v(3pt)
      #set text(size: 7.1pt, fill: rgb("#0F172A"), font: ("Consolas", "Courier New", "Nirmala UI", "Segoe UI"))
      #body
    ]
  )
}

// Convenience Aliases for Chapter Authoring
#let terminal-box(body) = terminal-specimen(title: "CISCO IOS CLI CONFIGURATION & OUTPUT", body)
#let code-box(title: "PRODUCTION CODE IMPLEMENTATION", body) = {
  block(
    width: 100%,
    stroke: 0.5pt + rgb("#334155"),
    fill: rgb("#0F172A"),
    radius: 4pt,
    inset: (x: 8pt, y: 5pt),
    spacing: 3pt,
    [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [#text(size: 6.8pt, weight: "bold", fill: rgb("#38BDF8"), font: ("Consolas", "Courier New"))[> #title]],
        [#text(size: 6.2pt, fill: rgb("#94A3B8"), font: ("Consolas", "Courier New"))[Python 3.12 · Production]]
      )
      #v(2pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#1E293B"))
      #v(2pt)
      #body
    ]
  )
}
#let code-block(arg1, ..rest) = {
  let title = "PRODUCTION CODE"
  let body = arg1
  if rest.pos().len() > 0 {
    body = rest.pos().at(0)
  }
  if rest.named().at("title", default: none) != none {
    title = rest.named().at("title")
  }
  code-box(title: title, body)
}
#let faq-box(q, a) = faq-item(q: q, a: a)
#let spotlight-box(title, body) = tech-spotlight-box(title: title, body)
#let mcq-item(q, options, ans_idx, expl) = {
  let opt_a = if options.len() > 0 { options.at(0) } else { "" }
  let opt_b = if options.len() > 1 { options.at(1) } else { "" }
  let opt_c = if options.len() > 2 { options.at(2) } else { "" }
  let opt_d = if options.len() > 3 { options.at(3) } else { "" }
  let ans_letter = if ans_idx == 0 { "A" } else if ans_idx == 1 { "B" } else if ans_idx == 2 { "C" } else { "D" }
  mcq(num: 1, q: q, a: opt_a, b: opt_b, c: opt_c, d: opt_d, ans: ans_letter, expl: expl)
}

// -----------------------------------------------------------------------------
// OFFICE 365 ENTERPRISE PRODUCTIVITY HELPERS
// -----------------------------------------------------------------------------

// Ribbon Path Specimen
#let ribbon-specimen(path: "", command: "", shortcut: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rgb("#64748B"),
    fill: rgb("#F1F5F9"),
    radius: 3pt,
    inset: (x: 5pt, y: 3pt),
    spacing: 2pt,
    [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.5pt, weight: "bold", fill: rgb("#0284C7"))[RIBBON PATH:]
          #text(size: 6.8pt, font: ("Consolas", "Courier New"), fill: rgb("#0F172A"), weight: "bold")[ #path]
          #if command != "" [
            #text(size: 6.5pt, fill: rgb("#64748B"))[ → #command]
          ]
        ],
        [
          #if shortcut != "" [
            #box(
              fill: rgb("#0F172A"),
              radius: 2pt,
              inset: (x: 4pt, y: 1.5pt),
              text(size: 6pt, font: ("Consolas", "Courier New"), weight: "bold", fill: white)[#shortcut]
            )
          ]
        ]
      )
    ]
  )
}

// Excel Formula Specimen Box
#let formula-specimen(title: "", formula: "", note: "") = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("#059669"), rest: 0.5pt + rgb("#CBD5E1")),
    fill: rgb("#F0FDF4"),
    radius: (right: 3pt),
    inset: (x: 6pt, y: 3.5pt),
    spacing: 2.5pt,
    [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [
          #if title != "" [
            #text(size: 7.2pt, weight: "bold", fill: rgb("#065F46"))[#title]\
          ]
          #v(1pt)
          #text(size: 7.5pt, font: ("Consolas", "Courier New"), weight: "bold", fill: rgb("#047857"))[#formula]
        ],
        [
          #box(
            fill: rgb("#059669"),
            radius: 2pt,
            inset: (x: 3.5pt, y: 1.5pt),
            text(size: 5.5pt, weight: "bold", fill: white)[EXCEL 365 FORMULA]
          )
        ]
      )
      #if note != "" [
        #v(1pt)
        #text(size: 6.8pt, fill: rgb("#334155"))[#note]
      ]
    ]
  )
}

// Copilot AI Specimen
#let copilot-specimen(prompt: "", output: "") = {
  block(
    width: 100%,
    stroke: 0.5pt + rgb("#7C3AED"),
    fill: rgb("#FAF5FF"),
    radius: 3pt,
    inset: 4.5pt,
    spacing: 2.5pt,
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 4pt,
        box(fill: rgb("#7C3AED"), inset: (x: 3pt, y: 1.5pt), radius: 2pt, text(size: 5.5pt, weight: "bold", fill: white)[COPILOT AI]),
        text(size: 7.2pt, weight: "bold", fill: rgb("#5B21B6"))[PROMPT: "#prompt"]
      )
      #if output != "" [
        #v(1.5pt)
        #text(size: 6.8pt, fill: rgb("#334155"))[#output]
      ]
    ]
  )
}

