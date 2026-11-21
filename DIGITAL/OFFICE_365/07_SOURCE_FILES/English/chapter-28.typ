#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 28]
= Executive Delivery Dynamics, Presenter View & 3 End-to-End Production Labs

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  A brilliant deck fails if the delivery falters. Master Presenter View navigation, laser pointers, rehearsal coach AI, and execute 3 complete commercial production labs: an Investor Pitch Deck, a Corporate Product Launch, and an Interactive Corporate Training Module.
]

#v(2pt)

== 28.1 Presenter View Navigation & Keyboard Controls (`Alt + F5`)

When plugged into dual monitors or video conferencing:
- *Presenter View*: Your private command center showing the current slide, upcoming preview, elapsed timer, and speaking notes.
- *Secret Keyboard Shortcuts During Live Slideshow*:
  - `B` key: Instantly *Blacks out* the display (draws all audience eyes directly back to the presenter).
  - `W` key: Instantly *Whites out* the display.
  - `Ctrl + L`: Activates the digital *Laser Pointer*.
  - `Ctrl + P`: Activates the live annotation *Pen* to circle critical chart figures.
  - `Ctrl + E`: Activates the *Eraser*.
  - `Number + Enter`: Jumps directly to slide number without flipping through intermediaries (e.g. `2` + `4` + `Enter` jumps to Slide 24).
- *Speaker Coach AI*: Microsoft 365's real-time rehearsal coach that analyzes pace (words per minute), pitch variation, filler words ("um", "ah"), and insensitive phrasing.

#pagebreak()

== 28.2 Production Lab 01: Series-A Venture Capital Pitch Deck (12 Slides)

Engineered for startup founders seeking ₹10 Crore to ₹50 Crore investment rounds:

#table(
  columns: (1fr, 1.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Slide No.*], [*Slide Objective*], [*Visual Architecture & Master Layout Configuration*]),
  [Slide 01], [Vision Title], [Dark Navy `#0F172A` background, 44pt title, tagline, logo emblem.],
  [Slide 02], [The Problem], [3 customer pain point cards with red alert accent icons.],
  [Slide 03], [The Solution], [Product screenshot mockup, 3 value pillars with green check badges.],
  [Slide 04], [Market Size], [TAM (₹80K Cr) > SAM (₹12K Cr) > SOM (₹1.5K Cr) concentric circles via Merge Shapes.],
  [Slide 05], [Traction & Growth], [High-impact ARR line chart showing 280% YoY expansion.],
  [Slide 06], [Business Model], [Subscription tier pricing table, customer lifetime value (LTV:CAC = 4.2x).],
  [Slide 07], [Competition Matrix], [2x2 quadrant positioning our product in top-right leader category.],
  [Slide 08], [Go-to-Market], [Horizontal 4-step B2B sales pipeline with milestone dates.],
  [Slide 09], [Core Leadership], [4 circular headshot picture placeholders with LinkedIn badges.],
  [Slide 10], [Financial Model], [3-year forward EBITDA & cash flow projections table.],
  [Slide 11], [The Ask / Funding], [Clear metric card: "Seeking ₹25 Cr for 15% equity", funds allocation donut chart.],
  [Slide 12], [Executive Close], [Founding contact information, QR code to investor data room.]
)

#v(2pt)

== 28.3 Production Lab 02: Enterprise Cloud Product Launch Deck

Designed for Chief Technology Officers presenting major software overhauls:
- *Color Palette*: Deep Slate (`#0B132B`), Electric Cyan (`#00F0FF`), and Crisp White.
- *Visual Climax*: Slide 3 features a 3D cloud database that rotates and zooms using the *Morph Transition* (`!!ProductCore`) as feature bullets fly in staggered at 0.4s intervals.

#pagebreak()

== 28.4 Production Lab 03: Interactive Corporate Training Deck

Using Hyperlinks and Zoom bookmarks for self-paced employee training:
- *Interactive Menu*: Top navigation bar with clickable tabs: *Module 1: Policy*, *Module 2: Compliance*, *Module 3: Security Exam*.
- *Branching Logic*: Answering an assessment question incorrectly jumps to a remediation slide before allowing progress.

#v(2pt)

== 28.5 Evaluation Dashboard: Comprehensive PowerPoint 365 Mastery MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What key during a live slideshow blacks out the screen?", ans: "The 'B' key.")
    #short-qa(num: 2, q: "What keyboard shortcut activates the digital laser pointer?", ans: "Ctrl + L.")
    #short-qa(num: 3, q: "How do you jump directly to Slide 15 during a live presentation?", ans: "Type 15 and press Enter.")
    #short-qa(num: 4, q: "What is the recommended LTV:CAC ratio in venture capital pitch decks?", ans: "3.0x or higher (4.2x in Lab 1).")
  ],
  [
    #mcq(num: 1, q: "Which tool analyzes speech rate, filler words, and vocal pitch during rehearsal?", a: "Spell Checker", b: "Speaker Coach AI", c: "Translator", d: "Accessibility Checker", ans: "B", expl: "Speaker Coach AI listens to speech audio and returns real-time delivery metrics.")
    #mcq(num: 2, q: "What keyboard shortcut activates the annotation pen tool during a live presentation?", a: "Ctrl + P", b: "Ctrl + L", c: "Ctrl + A", d: "Ctrl + Z", ans: "A", expl: "Ctrl + P turns the cursor into an interactive ink drawing pen.")
    #mcq(num: 3, q: "In an investor pitch deck, what does the SOM metric represent?", a: "Social Media Metrics", b: "Serviceable Obtainable Market (the realistic near-term target market share)", c: "Standard Operating Margin", d: "Source of Money", ans: "B", expl: "SOM is the portion of SAM that can realistically be captured.")
  ]
)

#v(2pt)

#spotlight-box("2027 IMMERSIVE MIXED REALITY & SPATIAL PRESENTATIONS", [
  PowerPoint 365 Enterprise exports presentation scenes directly to Microsoft Mesh and Apple Vision Pro spatial environments, enabling global remote teams to walk around holographic 3D product prototypes during live pitches.
])
