#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 05]
= Insert Tab: Visual Graphics, SmartArt Hierarchy & Text Wrapping Mechanics

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Contemporary business documentation demands compelling infographics, high-resolution vector assets, and organizational hierarchy diagrams. Understanding text wrapping geometry, SmartArt matrix layouts, and image background removal transforms dense textual prose into high-impact corporate collateral.
]

#v(2pt)

== 5.1 Graphic Assets & Vector Icon Architecture

Word 365 natively handles both raster bitmaps (JPEG, PNG, TIFF) and infinite-resolution scalable vector graphics (SVG):

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Asset Category*], [*Native File Formats & Levers*], [*Enterprise Application & Performance*]),
  [Scalable Vectors], [SVG (`.svg`), EMF (`.emf`)], [Infinite zoom without pixelation; colors can be converted to editable shapes.],
  [Bitmap Photos], [JPEG, PNG, WebP, HEIC], [High-resolution photography; supports automated AI background removal.],
  [Microsoft Stock Icons], [Native curated cloud vector repository], [Thousands of standardized monochrome business & technical symbols.],
  [3D Models], [GLB (`.glb`), FBX, OBJ, 3MF], [Interactive 360-degree rotational product specimens with lighting tilt.],
  [Screen Clipping], [Dynamic OS desktop viewport capture], [Instant high-precision software training manual screenshot insertion.]
)

#v(2pt)
#ribbon-specimen(path: "Insert > Illustrations > Icons", command: "Cloud Vector Icon Repository", shortcut: "Alt + N + NS")
#v(2pt)

== 5.2 Text Wrapping Mechanics: The 7 Geometric Layout Modes

By default, inserted images behave as *In Line with Text*, acting like giant typographic characters that destroy sentence flow. Mastering the *Wrap Text* engine (`Picture Format > Wrap Text`) is mandatory:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Wrap Mode*], [*Geometric Behavior & Text Spatial Flow*], [*Recommended Workplace Usage*]),
  [In Line with Text], [Bound strictly to paragraph baseline; moves with preceding text.], [Small inline icons, mathematical equation symbols.],
  [Square], [Text flows cleanly around the rectangular bounding box of image.], [Standard editorial sidebar images, product snapshots.],
  [Tight], [Text contours tightly along actual outer transparent silhouette of image.], [Transparent PNG vector logos, cutout personnel portraits.],
  [Through], [Text flows into internal cavities and concavities of transparent shapes.], [Complex technical diagrams, circular infographic charts.],
  [Top and Bottom], [Stops text flow horizontally on left/right; text only above and below.], [Wide horizontal banner graphics, panoramic charts.],
  [Behind Text], [Image placed beneath document text plane; text prints directly over.], [Custom background watermarks, tinted graphic textures.],
  [In Front of Text], [Image hovers above text plane, completely obscuring underlying words.], [Decorative floating sticker seals, draft stamp banners.]
)

#pagebreak()

== 5.3 Picture Formatting, AI Background Removal & Cropping

The *Picture Format* contextual ribbon exposes studio-grade graphic editing controls directly inside Word:
- *Remove Background*: AI engine automatically identifies the subject (portrait, product) and marks background areas in purple for instantaneous transparency stripping.
- *Corrections*: Fine-tunes *Sharpen/Soften* (up to +50%) and adjusts *Brightness/Contrast* matrices.
- *Color*: Recolor images to monochrome brand themes (e.g., Grayscale, Cyan Accent, Washout for subtle backgrounds).
- *Crop to Shape*: Instead of basic rectangular photos, crop executive headshots into perfect circles, rounded rectangles, or hexagons via `Picture Format > Crop > Crop to Shape`.
- *Aspect Ratio Locking*: Lock 1:1 (Square), 16:9 (Widescreen), or 4:3 to prevent distortion.

#concept-box(title: "CRITICAL FILE SIZE LEVER: COMPRESS PICTURES", [
  Embedding twenty 20MB smartphone photos will bloat a Word document to 400MB, crashing email servers. Always click `Picture Format > Compress Pictures`, choose *E-mail (96 ppi)* or *Print (220 ppi)*, and check *Delete cropped areas of pictures*.
])

#v(2pt)
#ribbon-specimen(path: "Picture Format > Adjust > Compress Pictures", command: "Optimize Document Storage & Delete Crops", shortcut: "Alt + J + P + C")
#v(2pt)

== 5.4 SmartArt Architecture & Corporate Hierarchy Charts

SmartArt transforms boring bulleted lists into visual communication frameworks. Word 365 categorizes SmartArt into 7 functional layouts under `Insert > Illustrations > SmartArt`:

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Category*], [*Visual Communication Purpose*], [*Standard Enterprise Use Case*]),
  [List], [Displays non-sequential groups of related information.], [Service offerings, core company values, feature matrices.],
  [Process], [Shows directional, chronological progression or workflow steps.], [Procurement pipelines, software release lifecycles, SOPs.],
  [Cycle], [Represents a continuous circular repeating loop.], [Continuous Improvement (PDCA cycle), budget fiscal years.],
  [Hierarchy], [Demonstrates organizational reporting trees and taxonomy trees.], [Company organizational charts, software class structures.],
  [Relationship], [Illustrates connections between distinct entities.], [Venn diagrams, balance scales, radial clusters.],
  [Matrix], [Shows how parts relate to a whole across 2 dimensions.], [SWOT analysis, 2x2 Risk Assessment quadrants.],
  [Pyramid], [Displays foundation-based proportional hierarchies.], [Maslow hierarchy, enterprise cybersecurity defense layers.]
)

#pagebreak()

== 5.5 Production Workflow: Converting Bullet Lists to SmartArt in 2 Seconds

Never waste hours manually drawing boxes and arrows. Convert existing text dynamically:
1. Type a standard indented bullet list representing organizational hierarchy or steps.
2. Highlight the list, right-click, and select *Convert to SmartArt*.
3. Choose *Hierarchy* or *Continuous Process*.
4. Word automatically builds the diagram, maintaining text in the expandable *Text Pane* (`Ctrl + Shift + T`).
5. In the Text Pane, press `Tab` to demote an employee beneath a manager, or `Shift + Tab` to promote upward!

#v(2pt)

== 5.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which text wrapping mode contours text tightly around transparent PNG borders?", ans: "Tight wrapping.")
    #short-qa(num: 2, q: "What tool permanently discards hidden pixels outside a cropped image boundary?", ans: "Picture Format > Compress Pictures > 'Delete cropped areas'.")
    #short-qa(num: 3, q: "Which SmartArt category is standard for corporate organizational reporting charts?", ans: "Hierarchy.")
    #short-qa(num: 4, q: "How do you open the collapsible Text Pane inside an active SmartArt graphic?", ans: "Click the arrow tab on the left border or press Ctrl + Shift + T.")
  ],
  [
    #mcq(num: 1, q: "What is the default text wrap setting when a new picture is inserted into Word?", a: "Square", b: "In Line with Text", c: "Tight", d: "Behind Text", ans: "B", expl: "In Line with Text is default, locking the graphic to the text baseline.")
    #mcq(num: 2, q: "Which vector file format allows infinite scaling in Word without pixelation?", a: ".jpg", b: ".bmp", c: ".svg", d: ".gif", ans: "C", expl: "Scalable Vector Graphics (.svg) render mathematically at any resolution.")
    #mcq(num: 3, q: "In the SmartArt Text Pane, what does pressing the Tab key achieve?", a: "Deletes the shape", b: "Demotes the active item down one hierarchy level", c: "Changes color", d: "Closes the diagram", ans: "B", expl: "Tab indents and demotes the item beneath the preceding parent shape.")
  ]
)

#v(2pt)

#spotlight-box("2027 3D INTERACTIVE DIGITAL ASSETS IN WORD 365", [
  Word 365 supports native glTF/GLB 3D models with embedded rotational animations. In digital proposals, readers can click and rotate an interactive 3D engineering prototype directly on the page, experiencing dynamic lighting reflections without third-party CAD viewers.
])
