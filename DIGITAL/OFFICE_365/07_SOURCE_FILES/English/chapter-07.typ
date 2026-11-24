#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 07]
= Design Tab, Watermarks & Multi-Tier Header/Footer Engineering

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Header and footer architecture represents the apex of corporate publishing polish. Unlinking "Same as Previous" headers, establishing distinct Frontmatter Roman numerals (i, ii, iii) vs. Arabic chapter numbering (1, 2, 3), and embedding secure corporate watermarks are essential competencies for master authors.
]

#v(2pt)

== 7.1 Design Tab: Corporate Themes, Color Palettes & Watermarks

The *Design Tab* controls universal document cosmetics:
- *Document Themes*: Packages of coordinating fonts (Headings + Body) and 12-color palettes (Primary, Secondary, 6 Accents, Dark/Light neutrals, Hyperlinks).
- *Watermarks (`Design > Watermark`)*: Embeds semi-transparent security stamps (e.g., `CONFIDENTIAL`, `DO NOT COPY`, or custom corporate vector logos) rotated at -45° across every printed page.
- *Page Borders & Color*: Frame pages with elegant 0.5pt rules or tinted paper fills.

#v(2pt)
#ribbon-specimen(path: "Design > Watermark > Custom Watermark", command: "Embed High-Security Text or Graphic Watermark", shortcut: "Alt + G + P + W")
#v(2pt)

== 7.2 Header & Footer Mechanics: The Contextual Ribbon

Double-clicking the top or bottom margin opens the *Header & Footer* contextual ribbon:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Control Switch*], [*Architectural Function*], [*Enterprise Publishing Role*]),
  [Different First Page], [Suppresses headers/footers on Page 1 of the section.], [Hides headers/footers on cover pages and chapter title pages.],
  [Different Odd & Even], [Separates headers for left-hand (Even) and right-hand (Odd) pages.], [Book layout: Book title on left; Chapter title on right.],
  [Link to Previous], [Inherits header content from preceding section.], [Enabled by default; *MUST BE UNLINKED* to isolate chapter headers.],
  [Header from Top (0.5")], [Calibrates distance from top paper edge to header baseline.], [Ensures headers sit comfortably above printable body margins.],
  [Footer from Bottom (0.5")], [Calibrates distance from bottom paper edge to footer text.], [Guarantees page number sits within hardware printer margins.]
)

#concept-box(title: "CRITICAL OPERATIONAL TRAP: 'LINK TO PREVIOUS'", [
  By default, every new Section Break inherits headers from Section 1 via the active `Link to Previous` toggle. If you edit the header in Section 2 without toggling `Link to Previous` off, your changes will propagate backwards and overwrite Section 1!
])

#pagebreak()

== 7.3 Multi-Tier Page Numbering: Roman (Frontmatter) vs. Arabic (Body)

In professional book and report publishing:
- Cover page has *no page number*.
- Frontmatter (Executive Summary, Table of Contents, Acknowledgments) uses lower-case Roman numerals: i, ii, iii, iv.
- Chapter 1 onwards resets and uses standard Arabic numerals: 1, 2, 3....

*The Flawless 6-Step Implementation Protocol*:
1. Insert a *Section Break (Next Page)* between the Table of Contents and Chapter 1.
2. Navigate to Chapter 1, double-click the footer, and click *Link to Previous* to *turn it off* (severing the link).
3. In Chapter 1 footer, go to `Header & Footer > Page Number > Format Page Numbers`.
4. Set *Number format* to `1, 2, 3...` and select *Start at: 1*.
5. Return to the Table of Contents footer (Section 1).
6. Set *Format Page Numbers* to `i, ii, iii...` and select *Start at: i*. Check *Different First Page* to suppress numbering on the Cover page.

#v(2pt)
#ribbon-specimen(path: "Header & Footer > Page Number > Format Page Numbers", command: "Configure Roman vs Arabic Starting Index", shortcut: "Alt + J + H + P + F")
#v(2pt)

== 7.4 Running Headers with Dynamic Chapter Titles (STYLEREF Field)

Instead of manually typing chapter names into headers across 100 pages (which creates massive maintenance debt), corporate documents utilize dynamic fields:

```
Field Syntax: { STYLEREF "Heading 1" }
```

*How to Insert Dynamic Field*:
1. Inside the header, place the cursor where you want the chapter title to appear.
2. Press `Ctrl + F9` to insert field braces `{ }`.
3. Type `STYLEREF "Heading 1"` inside the braces.
4. Press `F9` to evaluate the field.
5. *Result*: Word automatically reads whichever `Heading 1` is active on that specific page and prints its exact title in the header! When headings change, the headers update automatically!

#pagebreak()

== 7.5 Production Blueprint: Corporate Two-Tier Header & Footer Structure

Below is the exact architectural specification used by Fortune 500 enterprises for boardroom report layouts:

```
TOP RUNNING HEADER (0.5" from top edge):
[Left: RTECHLAB | Confidential]             [Right: { STYLEREF "Heading 1" }]
───────────────────────────────────────────────────────────────────────────── (0.5pt Border)

[Page Canvas: 1" Margins Left / Right / Top / Bottom]

───────────────────────────────────────────────────────────────────────────── (0.5pt Border)
BOTTOM RUNNING FOOTER (0.5" from bottom edge):
[Left: Enterprise Architecture Report 2027]  [Right: Page { PAGE } of { NUMPAGES }]
```

#v(2pt)

== 7.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which toggle button must be disabled before changing the header in Section 2?", ans: "'Link to Previous' button.")
    #short-qa(num: 2, q: "Which setting hides page numbers on the first page of a section?", ans: "'Different First Page'.")
    #short-qa(num: 3, q: "Which dynamic field code prints the active chapter heading in the running header?", ans: "{ STYLEREF \"Heading 1\" }.")
    #short-qa(num: 4, q: "Which key evaluates and refreshes selected field codes in Word?", ans: "F9 key.")
  ],
  [
    #mcq(num: 1, q: "To display page numbers in 'Page 4 of 25' format, which two fields are combined?", a: "{ CURRENT } and { TOTAL }", b: "{ PAGE } and { NUMPAGES }", c: "{ NUM } and { COUNT }", d: "{ INDEX } and { MAX }", ans: "B", expl: "{ PAGE } inserts the current page number; { NUMPAGES } inserts total document pages.")
    #mcq(num: 2, q: "What happens if you edit a header in Section 2 while 'Link to Previous' is active?", a: "Section 2 header disappears", b: "The edit propagates backwards, overwriting Section 1", c: "Word displays an error", d: "Document converts to PDF", ans: "B", expl: "Linked headers share the identical XML stream; editing one modifies all linked sections.")
    #mcq(num: 3, q: "Where is the Watermark tool located in Word 365?", a: "Home Tab", b: "Insert Tab", c: "Design Tab", d: "Review Tab", ans: "C", expl: "Watermarks, Themes, and Document Formatting reside on the Design Tab.")
  ]
)

#v(2pt)

#spotlight-box("2027 CRYPTOGRAPHIC DYNAMIC WATERMARKING", [
  Word 365 Enterprise supports dynamic recipient-bound watermarking. When emailing sensitive financial reports, Word injects the recipient's email address, IP address, and access timestamp invisibly into the background watermark, discouraging unauthorized leaks and cell phone screen photography.
])
