#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 25]
= Vector Graphic Engineering, Boolean Shape Operations & SmartArt Systems

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Executive communication demands customized visual metaphors that generic stock illustrations cannot deliver. PowerPoint's Boolean Merge Shapes engine transforms basic geometric primitives into sophisticated vector diagrams, iconography, and multi-tier organizational architectures.
]

#v(2pt)

== 25.1 The 5 Boolean Merge Shape Operations

PowerPoint includes a full-fledged vector pathfinder engine (`Shape Format` > `Merge Shapes`). By selecting two or more overlapping vector shapes:
- *Union*: Combines all selected shapes into a single unified outline path, dissolving internal boundaries.
- *Combine*: Merges shapes into one object, but *punches a transparent hole* where the shapes overlap (XOR logic).
- *Fragment*: Breaks overlapping shapes into every discrete intersecting polygon, creating separate editable sub-shapes.
- *Intersect*: Keeps *only* the region where all selected shapes overlap, discarding all outer perimeters.
- *Subtract*: Cuts away the shape selected *second* from the shape selected *first* (order of selection is critical!).

#v(2pt)
#ribbon-specimen(path: "Shape Format > Insert Shapes > Merge Shapes", command: "Boolean Union, Fragment, Subtract", shortcut: "Alt + JD > M")
#v(2pt)

== 25.2 Professional Vector Iconography & SVG Manipulation

Modern 2027 slide decks use Scalable Vector Graphics (SVG) instead of rasterized JPEGs or PNGs:
- *Scalability*: SVGs render via mathematical coordinates, maintaining razor-sharp edges on 8K display walls without pixelation.
- *Convert to Shape*: Right-click any inserted SVG icon and select *Convert to Shape*. PowerPoint immediately breaks the SVG into native PowerPoint vector paths.
- *Granular Customization*: Once converted, individual sub-paths (e.g. changing just the gear tooth color or an arrow tip) can be recolored using the brand palette.

#table(
  columns: (1.2fr, 2fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Boolean Tool*], [*Mathematical Action*], [*Real-World Slide Design Application*]),
  [Union], [Path addition (A ∪ B)], [Creating custom multi-prong cloud or server cluster icons.],
  [Subtract], [Difference set (A - B)], [Cutting a circular picture window out of a solid dark background card.],
  [Fragment], [Full intersection split], [Creating custom pie wedges, Venn diagram slices, or multi-colored gears.],
  [Intersect], [Intersection set (A ∩ B)], [Cropping an intricate photographic texture precisely inside geometric typography.]
)

#pagebreak()

== 25.3 Converting Bullets to SmartArt & Deconstructing to Shapes

SmartArt provides structured layout algorithms for organizational charts, process funnels, and cyclical systems:
- *Convert Text to SmartArt*: Select any bulleted list, right-click, and choose `Convert to SmartArt Graphic`. PowerPoint instantly maps bullets to process chevrons or hierarchy trees.
- *The "SmartArt Prison" Trap*: Default SmartArt graphics look rigid and standardized.
- *Professional Deconstruction*:
  1. Select the SmartArt graphic.
  2. Press `Ctrl + Shift + G` (Ungroup) once to convert SmartArt into a grouped collection of standard PowerPoint shapes.
  3. Press `Ctrl + Shift + G` a second time to break all elements into individual free-floating vector shapes.
  4. Now apply custom drop shadows, bespoke card radii, and independent animation triggers without layout constraints!

#v(2pt)

== 25.4 The 4 Fundamental SmartArt Diagram Categories

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #callout-box("PROCESS & ROADMAP FLOWS", [
      Linear workflows, milestone timelines, and agile sprints.
      - *Layouts*: Chevron Process, Step-Down Process, Timeline.
      - *Rule*: Flow must strictly proceed from left to right (or top to bottom in vertical formats).
    ])
    #v(3pt)
    #callout-box("HIERARCHY & ORG STRUCTURES", [
      Corporate reporting trees, cloud component inheritance, and taxonomy.
      - *Layouts*: Organization Chart, Horizontal Hierarchy.
      - *Rule*: Limit vertical depth to 3 levels per slide to preserve font legibility.
    ])
  ],
  [
    #callout-box("CYCLE & FEEDBACK LOOPS", [
      Continuous improvement, DevOps loops, and product lifecycles.
      - *Layouts*: Block Cycle, Continuous Cycle, Radial Venn.
      - *Rule*: Ensure arrow directional continuity aligns with operational reality.
    ])
    #v(3pt)
    #callout-box("MATRIX & PYRAMID MODELS", [
      Prioritization quadrants (Eisenhower matrix) and Maslow hierarchies.
      - *Layouts*: 2x2 Grid Matrix, Segmented Pyramid.
      - *Rule*: Clearly label horizontal (effort) and vertical (impact) axes.
    ])
  ]
)

#pagebreak()

== 25.5 Production Blueprint: Bespoke 4-Step Agile Delivery Pipeline

Below is a custom-engineered pipeline diagram created via Boolean Fragment and converted SmartArt:

#table(
  columns: (1.2fr, 1.2fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else { rgb("#F8FAFC") },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 4pt),
  table.header([*STAGE 1: DISCOVERY*], [*STAGE 2: ARCHITECTURE*], [*STAGE 3: SPRINT DEV*], [*STAGE 4: DEPLOYMENT*]),
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#0284C7"))[Phase 01 · Week 1-2] \
    - Stakeholder interviews \
    - Data schema audit \
    - Security SLA baseline
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#059669"))[Phase 02 · Week 3-4] \
    - Azure tenant design \
    - IAM role mapping \
    - CI/CD pipeline spec
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#D97706"))[Phase 03 · Week 5-8] \
    - Microservice build \
    - Unit test coverage > 90% \
    - Bi-weekly demo review
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#7C3AED"))[Phase 04 · Week 9-10] \
    - Blue/Green zero-downtime \
    - CloudWatch telemetry \
    - Client sign-off handover
  ]
)

#v(3pt)

== 25.6 Evaluation Dashboard: Technical MCQs & Review Q&A

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which Merge Shapes operation cuts away overlapping areas creating a transparent hole?", ans: "Combine (XOR logic).")
    #short-qa(num: 2, q: "What keyboard shortcut ungroups SmartArt or grouped vector shapes?", ans: "Ctrl + Shift + G.")
    #short-qa(num: 3, q: "Why are SVG files preferred over PNGs in modern 2027 slide decks?", ans: "SVGs scale infinitely without pixelation and can convert to editable native shapes.")
    #short-qa(num: 4, q: "In the Subtract operation, which shape is cut away?", ans: "The shape selected second is cut from the shape selected first.")
  ],
  [
    #mcq(num: 1, q: "What happens when you select an SVG icon and click 'Convert to Shape'?", a: "It deletes the icon", b: "It breaks the SVG into fully editable native PowerPoint vector paths", c: "It converts it into an animated GIF", d: "It uploads it to OneDrive", ans: "B", expl: "'Convert to Shape' decomposes vector SVGs into native Microsoft drawing objects.")
    #mcq(num: 2, q: "Which Boolean tool splits multiple overlapping shapes into every single intersecting polygon?", a: "Union", b: "Fragment", c: "Subtract", d: "Intersect", ans: "B", expl: "Fragment slices every intersection into separate, independently movable pieces.")
    #mcq(num: 3, q: "How many times must you press Ctrl+Shift+G on a SmartArt graphic to break it into individual loose shapes?", a: "Once", b: "Twice", c: "Three times", d: "Never", ans: "B", expl: "First ungrouping turns SmartArt into a shape group; second ungrouping releases all individual shapes.")
  ]
)

#v(2pt)

#spotlight-box("2027 3D PROCEDURAL SHAPES & SPATIAL ASSETS", [
  PowerPoint 365 natively renders glTF/GLB 3D models with real-time physical lighting. Engineers can rotate 3D jet engines or architectural BIM models 360 degrees directly on the slide during live stakeholder reviews.
])
