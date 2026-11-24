#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 08]
= References Tab: Automatic Table of Contents, Citations, Footnotes & Index

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Academic dissertations, enterprise whitepapers, and legal briefs depend on rigorous bibliographic referencing and automated structural tables. Never manually type page numbers into a Table of Contents. Word's programmatic References engine automates TOC generation, APA/IEEE citations, cross-references, and back-of-book indexing.
]

#v(2pt)

== 8.1 Automatic Table of Contents (TOC) Architecture

The *Table of Contents* engine (`References > Table of Contents`) scans the document's XML tree for semantic heading styles (`Heading 1`, `Heading 2`, `Heading 3`) and compiles an interactive, hyperlinked directory:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*TOC Variant*], [*Structural Characteristics*], [*Enterprise Implementation Scenario*]),
  [Automatic Table 1], [Labeled "Contents"; reads Headings 1-3; inserts dotted tab leaders.], [Standard corporate reports, business proposals.],
  [Automatic Table 2], [Labeled "Table of Contents"; identical programmatic compilation.], [Academic research publications, technical manuals.],
  [Custom Table of Contents], [User specifies display levels (1-9), tab leader style, and custom styles.], [Legal documents requiring inclusion of custom "Clause" styles.],
  [Manual Table], [Static dummy placeholder text requiring manual typing.], [*AVOID IN ENTERPRISE*: High risk of outdated page references.]
)

#v(2pt)
#ribbon-specimen(path: "References > Table of Contents > Update Table", command: "Synchronize Page Numbers or Entire TOC", shortcut: "F9 / Alt + S + U")
#v(2pt)

== 8.2 Updating the TOC & The F9 Synchronization Protocol

When headings are edited or paragraphs expand across new pages, the TOC becomes desynchronized.
- Click `References > Update Table` (or select TOC and press `F9`).
- *Update page numbers only*: Ultra-fast; refreshes page numbers while preserving manual text overrides.
- *Update entire table*: Completely rebuilds the directory tree, pulling in newly authored headings and modifying renamed titles.

#concept-box(title: "CRITICAL PRE-FLIGHT RULE: TOC HYPERLINKS", [
  All entries in Word's Automatic TOC function as live clickable hyperlinks (`Ctrl + Click` to jump directly to Chapter 14). When exported via `File > Export > Create PDF`, these hyperlinks remain fully interactive in Adobe Acrobat and web browsers.
])

#pagebreak()

== 8.3 Footnotes vs. Endnotes Architecture

Word 365 provides two academic citation mechanisms under `References > Footnotes`:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Note Type*], [*Shortcut*], [*Placement & Numbering Standard*], [*Enterprise Usage*]),
  [Footnote], [`Alt + Ctrl + F`], [Bottom of the exact same physical page; numbered 1, 2, 3...], [Immediate source clarification, legal definitions, caveats.],
  [Endnote], [`Alt + Ctrl + D`], [Very end of document (or end of section); numbered i, ii, iii...], [Exhaustive academic references, archival citations.]
)

#v(2pt)

== 8.4 Citations & Automated Bibliography Generation

Manual bibliography formatting violates publishing standards. Word incorporates an automated citation management database:
1. *Insert Citation (`References > Citations & Bibliography > Insert Citation`)*:
   - Select Source Type: *Book*, *Journal Article*, *Report*, *Website*, or *Conference Proceeding*.
   - Fill Author, Title, Year, City, and Publisher metadata.
   - Word inserts an in-text parenthetical citation (e.g., `(Patel, 2027)`).
2. *Citation Styles*: Switch dynamically between *APA 7th Edition*, *IEEE* (bracketed numbers `[1]`), *Chicago*, or *Harvard*. Word reformats all citations instantly!
3. *Generate Bibliography*: Click `References > Bibliography` to spawn a fully formatted alphabetical references list at the document's conclusion.

#v(2pt)
#ribbon-specimen(path: "References > Citations & Bibliography > Style", command: "Switch Citation Schema (APA 7th vs IEEE)", shortcut: "Alt + S + C + Y")
#v(2pt)

== 8.5 Captions, Table of Figures & Cross-References

Enterprise reports require structured visual indexing:
- *Insert Caption (`References > Captions > Insert Caption`)*: Attaches dynamic labels to graphics: *Figure 1: Enterprise Network Architecture* or *Table 3: Q3 Financial Balance Sheet*.
- *Cross-Reference (`References > Captions > Cross-reference`)*: References items inline (e.g., "as demonstrated in Figure 1 on page 14"). If Figure 1 moves to page 22, the inline text updates automatically upon pressing `F9`!
- *Table of Figures*: Generates a dedicated list of all diagrams and tables with their respective page numbers.

#pagebreak()

== 8.6 Indexing Mechanics: Marking Entries & Compiling Back-of-Book Index

An Index allows readers to look up specialized terminology alphabetically:
1. Highlight the target keyword (e.g., "Dynamic Arrays").
2. Press `Alt + Shift + X` to open the *Mark Index Entry* dialog.
3. Click *Mark* (or *Mark All* to index every occurrence throughout the book). Word injects a hidden field code: `{ XE "Dynamic Arrays" }`.
4. At the end of the document, navigate to `References > Index > Insert Index`.
5. Choose 2 columns, indented style, and click *OK*. Word compiles a professional, multi-column alphabetical index with accurate page numbers!

#v(2pt)

== 8.7 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which shortcut inserts an immediate Footnote at the bottom of the page?", ans: "Alt + Ctrl + F.")
    #short-qa(num: 2, q: "Which key shortcut opens the Mark Index Entry dialog?", ans: "Alt + Shift + X.")
    #short-qa(num: 3, q: "Which heading styles are captured by default in Word's Automatic Table 1?", ans: "Heading 1, Heading 2, and Heading 3.")
    #short-qa(num: 4, q: "Which citation format uses bracketed numeric markers like [1] and [2]?", ans: "IEEE style.")
  ],
  [
    #mcq(num: 1, q: "What is the shortcut to insert an Endnote at the end of a document?", a: "Ctrl + E", b: "Alt + Ctrl + D", c: "Alt + Shift + E", d: "Ctrl + Shift + F", ans: "B", expl: "Alt + Ctrl + D creates an endnote placed at the end of the document.")
    #mcq(num: 2, q: "What happens when you hold Ctrl and click on an entry in Word's Automatic Table of Contents?", a: "Deletes the heading", b: "Jumps directly to that section in the document", c: "Opens Print dialog", d: "Copies text", ans: "B", expl: "TOC entries function as internal hyperlinked anchors.")
    #mcq(num: 3, q: "Which tool automatically updates inline references when a figure moves to a new page?", a: "Bookmark", b: "Cross-reference", c: "SmartArt", d: "Format Painter", ans: "B", expl: "Cross-references track target items dynamically via internal field bookmarks.")
  ]
)

#v(2pt)

#spotlight-box("2027 AUTOMATED AI CITATION INTEGRITY CHECKING", [
  Word 365 Enterprise connects to Microsoft Academic & PubMed repositories. Copilot automatically verifies whether cited research papers have been retracted, flags broken digital object identifiers (DOIs), and converts arbitrary text references into standard APA 7th metadata entries.
])
