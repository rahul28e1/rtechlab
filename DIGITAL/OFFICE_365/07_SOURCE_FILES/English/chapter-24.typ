#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#EA580C"))[PART 3: MICROSOFT POWERPOINT 365 MASTERCLASS · CHAPTER 24]
= Slide Master Architecture, Custom Layouts & Brand Template Engineering

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Creating 100-slide enterprise decks without the Slide Master leads to formatting chaos, broken alignment, and mismatched brand fonts. Slide Master architecture enforces centralized typography, automated page numbering, protected corporate logos, and locked layout placeholders.
]

#v(2pt)

== 24.1 The Two-Tier Slide Master Hierarchy

Entering Slide Master mode (`View` > `Slide Master`):
- *The Parent Slide Master (Top-Level Node)*:
  - Represented by the large top slide in the thumbnail pane.
  - Changes made here cascade universally to every single layout in the entire presentation.
  - Setting the primary font family (*Segoe UI Variable*), background fill, and corporate logo placement here guarantees 100% deck-wide consistency.
- *Child Layout Masters (Derivative Nodes)*:
  - Indented beneath the parent master (e.g. *Title Slide*, *Title and Content*, *Section Header*, *Two Content*, *Comparison*).
  - Custom modifications here apply strictly to slides assigned that specific layout archetype.

#v(2pt)
#ribbon-specimen(path: "View > Master Views > Slide Master", command: "Parent Master & Layout Editor", shortcut: "Alt + W > M")
#v(2pt)

== 24.2 Engineered Placeholders vs. Static Text Boxes

Amateurs insert regular text boxes on master slides; professionals insert dynamic *Placeholders*:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Placeholder Type*], [*Operational Behavior on Live Slide*], [*Enterprise Production Utility*]),
  [Content], [Multi-purpose prompt allowing text, table, chart, SmartArt, picture, or video.], [Universal body slides.],
  [Text], [Pre-formatted text block with hierarchical bullet indentation and tab stops.], [Executive summary takeaways.],
  [Picture / Image], [Single-click image picker that automatically centers and crops to placeholder bounds.], [Team headshots & product photos.],
  [Chart], [Launches Excel chart builder with pre-configured corporate color palette.], [Financial earnings metrics.],
  [Table], [Prompts for row/column count and applies locked corporate table formatting.], [SLA comparison grids.]
)

#pagebreak()

== 24.3 Building a Protected Corporate Brand Template (.potx)

When distributing templates to 5,000 corporate employees, the design must be resilient against accidental tampering:
- *Color Theme Palette*: Define 2 Dark colors, 2 Light colors, and 6 Accent colors under `Colors` > `Customize Colors`.
- *Locked Elements*: Place corporate watermarks, background diagonal grid lines, and confidentiality legal notices on the parent master. On live slides, regular users cannot click, nudge, or accidentally delete these elements.
- *Dynamic Footers*: Configure the 3 standard footer zones:
  - *Date Zone*: Dynamic update or fixed release timestamp.
  - *Footer Text*: `CONFIDENTIAL · RTECHLAB ENTERPRISE REVIEW ONLY`.
  - *Slide Number*: Automated `<#>` field.
- *Saving the Template*: Save the file as a PowerPoint Template (`.potx`). When double-clicked, it spawns a fresh `Presentation1.pptx` instance, leaving the original master file untouched.

#v(2pt)
#ribbon-specimen(path: "Slide Master > Background > Colors", command: "Custom Brand Theme Palette", shortcut: "Alt + M > T")
#v(2pt)

== 24.4 Managing Multiple Slide Masters in One Deck

Complex enterprise decks frequently combine dark-themed section divider slides with light-themed content slides:
- *Insert Slide Master*: Click `Insert Slide Master` to create an independent second master tree.
- *Dark Master Theme*: Style Master 2 with `#0F172A` deep navy fill, white typography, and vibrant cyan accents for major milestone transitions.
- *Preserve Master*: Right-click the master thumbnail and select *Preserve Master* (indicated by a pushpin icon). This prevents PowerPoint from automatically purging the master if no active slides currently reference it.

#pagebreak()

== 24.5 Production Blueprint: Corporate Brand Master Specifications

#table(
  columns: (1.5fr, 1.8fr, 2.7fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 3pt),
  table.header([*Master Component*], [*Design Parameter*], [*Production Configuration Detail*]),
  [Header Title Placeholder], [40pt Bold, Segoe UI], [Color: `#0F172A`, Margin: Top 0.8 in, Left 0.8 in, Auto-fit disabled.],
  [Body Content Placeholder], [16pt Regular / 24pt Line Spacing], [Color: `#334155`, Multi-level bullet list with custom square bullets.],
  [Corporate Emblem Anchor], [Top-Right Corner (`1.2 in × 0.4 in`)], [Transparent PNG logo anchored on Parent Master, locked from user selection.],
  [Confidentiality Banner], [Bottom Footer (8pt Uppercase)], [Locked text: `RTECHLAB 2027 CONFIDENTIAL · ALL RIGHTS RESERVED` + Automated `<#>`.]
)

#v(3pt)

== 24.6 Evaluation Dashboard: Technical MCQs & Review Q&A

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What is the key difference between the parent master and child layout masters?", ans: "Parent changes apply universally; child changes apply only to that layout.")
    #short-qa(num: 2, q: "What file extension is used to save reusable corporate PowerPoint templates?", ans: ".potx template extension.")
    #short-qa(num: 3, q: "Why should an image placeholder be used instead of inserting a regular picture?", ans: "Placeholders automatically crop and position images consistently across slides.")
    #short-qa(num: 4, q: "What does the 'Preserve Master' feature prevent?", ans: "Prevents unused masters from being auto-deleted.")
  ],
  [
    #mcq(num: 1, q: "Where must a corporate logo be placed so it appears automatically across every slide and cannot be edited by normal users?", a: "On Slide 1 in Normal view", b: "On the Top Parent Slide Master", c: "In the Slide Notes section", d: "In the Quick Access Toolbar", ans: "B", expl: "Elements placed on the top parent slide master cascade to all layouts and are locked in normal view.")
    #mcq(num: 2, q: "Which file format spawns an unsaved new presentation (.pptx) when opened by an employee?", a: ".pptm", b: ".potx", c: ".ppsx", d: ".pdf", ans: "B", expl: ".potx is the PowerPoint template format designed to protect the source template.")
    #mcq(num: 3, q: "What happens when you delete a text placeholder on the Parent Slide Master?", a: "The entire presentation is deleted", b: "The title/body text field vanishes from all derived layouts", c: "PowerPoint crashes", d: "Text converts to an image", ans: "B", expl: "Deleting a placeholder on the parent cascades down to all child layouts.")
  ]
)

#v(2pt)

#spotlight-box("2027 ENTERPRISE CLOUD BRAND KIT SYNCHRONIZATION", [
  PowerPoint 365 connects directly to corporate Azure AD Brand Kits. When executive leadership updates the corporate color palette or typography in the Microsoft 365 Admin Center, thousands of distributed `.potx` templates update dynamically in real time.
])
