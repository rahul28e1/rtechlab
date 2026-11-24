#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 03]
= Home Tab: Heading Styles, Style Sets & Advanced Wildcard Search Engine

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Styles are the programmatic skeleton of professional Word authoring. Relying on manual ad-hoc formatting destroys document structure. Utilizing semantic styles guarantees automated Table of Contents generation, Navigation Pane collapse/expand hierarchies, and instantaneous corporate re-theming.
]

#v(2pt)

== 3.1 The Semantic Styles Architecture

Word 365 categorizes styles into 5 programmatic types, each controlling distinct formatting scopes:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Style Type*], [*Scope of Application & Behavior*], [*Built-in System Examples*]),
  [Paragraph Style], [Controls font, line spacing, indents, borders, and tabs for full blocks.], [`Normal`, `Heading 1`, `Heading 2`, `List Bullet`],
  [Character Style], [Applies formatting to highlighted words without altering paragraph flow.], [`Strong`, `Emphasis`, `Subtle Reference`, `Book Title`],
  [Linked Style (¶/a)], [Acts as paragraph style when cursor rests; acts as character style on selection.], [`Heading 1` through `Heading 9`, `Intense Quote`],
  [Table Style], [Defines header row fills, alternating zebra striping, and grid borders.], [`Grid Table 4 - Accent 1`, `Plain Table 1`],
  [List Style], [Standardizes alignment, numbering formats, and indents for list tiers.], [`1 / 1.1 / 1.1.1`, `Bullet - Circle - Square`]
)

#v(2pt)
#ribbon-specimen(path: "Home > Styles > Heading 1 / Heading 2", command: "Apply Structural Semantic Heading", shortcut: "Ctrl + Alt + 1 / Ctrl + Alt + 2")
#v(2pt)

== 3.2 Modifying & Customizing Enterprise Styles

Never manually format 50 individual headings across a 100-page report. Instead, modify the underlying style definition:

1. Right-click the target style card in `Home > Styles` (e.g., *Heading 1*) and select *Modify*.
2. *Formatting Grid*: Adjust font family (`Aptos Display`), size (`18 pt`), color (`#0F172A` Navy), and weight (`Bold`).
3. *Format Dropdown (Bottom Left)*:
   - *Paragraph*: Set *Keep with next* (mandatory to prevent orphan headings at the bottom of pages) and *Page break before*.
   - *Border*: Apply a subtle horizontal bottom rule to demarcate major chapters.
4. *Scope Toggle*: Select *Only in this document* for isolated proposals, or *New documents based on this template* to establish company-wide corporate standards.

#concept-box(title: "CRITICAL LAYOUT PROTOCOL: 'KEEP WITH NEXT'", [
  Always enable `Keep with next` under `Paragraph > Line and Page Breaks` inside all Heading styles. This instructs Word's pagination engine never to leave a heading stranded alone at the bottom of a page while its first body paragraph spills onto the next.
])

#pagebreak()

== 3.3 Style Sets, Design Themes & Global Re-Skinning

The *Style Sets* engine (`Design > Document Formatting`) decouples semantic structure from visual presentation. Once a document is strictly tagged with `Heading 1`, `Heading 2`, `Title`, and `Normal`:

- Switching from *Formal* to *Modern* or *Centred* instantaneously recalculates font pairings, accent rules, and margin geometries across all 100+ pages in under 1 second.
- *Color Palettes*: Modifying the active palette (`Design > Colors`) swaps primary and secondary brand accents dynamically across shapes, table borders, and headings without manual recoloring.
- *Format Painter (`Ctrl + Shift + C` / `Ctrl + Shift + V`)*:
  - Single-click: Copies formatting of selected text and applies it to the next clicked word.
  - Double-click: Locks the painter active, allowing continuous sequential application across dozens of dislocated paragraphs until pressing `Esc`.

#v(2pt)
#ribbon-specimen(path: "Home > Clipboard > Format Painter", command: "Copy & Paste Visual Formatting", shortcut: "Ctrl + Shift + C / Ctrl + Shift + V")
#v(2pt)

== 3.4 Advanced Find & Replace with Regular Expression Wildcards

While basic search (`Ctrl + F`) locates words, enterprise data sanitization relies on the *Advanced Find and Replace Engine* (`Ctrl + H`) with the *Use wildcards* flag enabled:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Wildcard*], [*Syntax Pattern*], [*Matching Scope & Behavior*], [*Enterprise Data Clean Example*]),
  [Any Character], [`?`], [Matches exactly one single character.], [`c?t` matches cat, cot, cut],
  [String Range], [`*`], [Matches any string of characters.], [`comp*r` matches computer, compiler],
  [Word Boundary], [`<` and `>`], [Enforces strict beginning or ending of word.], [`<in>` matches in, but not inside or tin],
  [Character Set], [`[a-z]`], [Matches any single character within specified range.], [`[0-9]` matches any single digit],
  [Count Qualifier], [`{n,m}`], [Matches between n and m occurrences of prior token.], [`[0-9]{10}` matches 10-digit mobile numbers],
  [Tagged Group], [`( )` and `\1`], [Groups tokens for back-reference rearrangement.], [Swap First/Last Name: `(<*>) (<*>)` -> `\2, \1`]
)

#pagebreak()

== 3.5 Production Workflow: Cleaning Messy Pasted Text

When pasting unformatted raw text from web portals or OCR scans into Word, clean it systematically using these 4 wildcard replacement passes:

```
Pass 1: Eliminate Double/Triple Blank Lines
Find: ^p^p+ (or ^13^13)  --> Replace: ^p

Pass 2: Eradicate Multiple Trailing Spaces
Find: [ ]{2,}           --> Replace: [Single Space]

Pass 3: Standardize Indian Mobile Numbers (+91-XXXXX-XXXXX)
Find: ([0-9]{5})([0-9]{5}) --> Replace: \1-\2

Pass 4: Strip Trailing Manual Line Breaks
Find: ^l                --> Replace: ^p
```

#v(2pt)

== 3.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which shortcut applies the Heading 1 style to the active paragraph?", ans: "Ctrl + Alt + 1.")
    #short-qa(num: 2, q: "How do you lock the Format Painter tool for multiple continuous applications?", ans: "Double-click the Format Painter icon.")
    #short-qa(num: 3, q: "Which paragraph pagination setting prevents a heading from separating from its text?", ans: "'Keep with next' (in Paragraph > Line and Page Breaks).")
    #short-qa(num: 4, q: "In wildcard search, which pattern matches exactly 10 consecutive numeric digits?", ans: "[0-9]{10}.")
  ],
  [
    #mcq(num: 1, q: "What is the shortcut to copy text formatting only (without copying text content)?", a: "Ctrl + C", b: "Ctrl + Shift + C", c: "Alt + C", d: "Shift + F3", ans: "B", expl: "Ctrl + Shift + C copies formatting; Ctrl + Shift + V pastes formatting.")
    #mcq(num: 2, q: "In Word wildcard find/replace, what does the expression (<*>) (<*>) with replace \\2, \\1 accomplish?", a: "Deletes all words", b: "Swaps First Name and Last Name order", c: "Capitalizes the words", d: "Inserts a footnote", ans: "B", expl: "Parentheses tag tokens into groups; \\2, \\1 reorders the second word before the first.")
    #mcq(num: 3, q: "What is the primary architectural benefit of using semantic Heading styles?", a: "Makes text bold", b: "Enables automated Table of Contents and Navigation Pane tree", c: "Reduces file size", d: "Prevents printing", ans: "B", expl: "Styles provide the programmatic metadata required for TOC generation and structural navigation.")
  ]
)

#v(2pt)

#spotlight-box("2027 AI-POWERED STYLE HOMOGENIZATION", [
  Word 365 Enterprise integrates automated semantic style harmonization. When combining contributions from 10 different co-authors, Copilot detects rogue manual formatting (e.g., 14pt Arial bold text masquerading as a heading) and converts them into standardized corporate Heading styles with a single click.
])
