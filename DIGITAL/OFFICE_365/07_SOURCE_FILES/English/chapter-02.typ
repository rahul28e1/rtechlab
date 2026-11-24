#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 02]
= Home Tab: Typography, Character Formatting & Paragraph Mechanics

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Precision typographic hierarchy and mathematical paragraph geometry differentiate amateur word processing from world-class corporate documentation. Mastering font pair metrics, kerning, line spacing ratios, and tab stop mechanics ensures visual authority in executive proposals.
]

#v(2pt)

== 2.1 The Modern Font Hierarchy & Enterprise Pairing

In Office 365, Microsoft introduced *Aptos* as the default sans-serif typeface, replacing Calibri. Enterprise typography relies on deliberate pairing between Heading (Display) and Body (Text) fonts:

#table(
  columns: (1.5fr, 1.5fr, 2.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Heading Typeface*], [*Body Typeface*], [*Psychological Tone & Corporate Industry*], [*Readability Metric*]),
  [Aptos Display], [Aptos], [Modern corporate, clean technical reports, SaaS documentation], [Optically optimized for 4K displays],
  [Segoe UI Semibold], [Segoe UI], [Engineering specifications, IT infrastructure manuals], [High legibility at 8pt-10pt sizes],
  [Georgia Bold], [Calibri], [Legal briefs, executive boardroom summaries, financial audits], [Strong serif/sans-serif visual contrast],
  [Consolas], [Aptos], [Technical developer guides, code documentation, CLI manuals], [Fixed-width monospace precision]
)

#v(2pt)
#ribbon-specimen(path: "Home > Font > Change Case", command: "Sentence / Lower / Upper / Capitalize Each Word", shortcut: "Shift + F3")
#v(2pt)

== 2.2 Character Formatting & Advanced Kerning Mechanics

The *Font Dialog* (`Ctrl + D` or `Ctrl + Shift + F`) exposes low-level typographic levers:
- *Strikethrough & Double Strikethrough*: Utilized in legal drafting to indicate deleted statutory contract clauses without obliterating historical text.
- *Superscript (`Ctrl + Shift + +`) & Subscript (`Ctrl + =`)*: Mandatory for scientific chemical notations (H₂O) and mathematical exponents (x² + y²).
- *Character Spacing (Advanced Tab)*: *Expanded* or *Condensed* tracking (in tenths of a point) to eliminate typographical widows and orphans at paragraph endings.
- *OpenType Features*: Ligatures (Standard, Contextual, Discretionary), Number Forms (Proportional Lining vs. Tabular Oldstyle for accounting data).

#concept-box(title: "KEYBOARD PRODUCTIVITY: SHIFT + F3 CASE CYCLING", [
  Highlight any selected sentence and press `Shift + F3` repeatedly. Word cycles dynamically through: (1) all lowercase, (2) ALL UPPERCASE, and (3) Capitalize Each Word (Title Case) without requiring manual retyping.
])


#v(3pt)
#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/word-ribbon-layout.png", width: 95%, height: 115pt, fit: "contain")
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 2.1: Microsoft Word 365 Ribbon Layout Architecture & Contextual Group Command Hierarchy.
  ]
]

#pagebreak()

== 2.3 Paragraph Alignment, Geometry & Justification Dynamics

Paragraph geometry dictates the cognitive flow of text across printed columns:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Alignment*], [*Shortcut*], [*Mechanics & Visual Result*], [*Enterprise Context*]),
  [Align Left], [`Ctrl + L`], [Ragged right edge; uniform natural word spacing.], [Corporate emails, standard memos, technical specs.],
  [Center], [`Ctrl + E`], [Symmetric around horizontal page center.], [Cover page titles, certificates, formal invitations.],
  [Align Right], [`Ctrl + R`], [Ragged left edge; flush right margin.], [Sign-off signatures, invoice header dates, PO numbers.],
  [Justify], [`Ctrl + J`], [Aligns flush to both margins by expanding word spaces.], [Books, legal contracts, multi-column newspapers.]
)

#v(2pt)

== 2.4 Line Spacing & Paragraph Inset Mechanics

Amateur document authors repeatedly press the `Enter` key to create vertical separation between paragraphs. This corrupts pagination when opened on different screens.

*The Professional Protocol*:
1. Set *Line Spacing* to exactly `1.15` or `1.2` lines for optimal optical scanning velocity.
2. Configure *Spacing Before* to `0 pt` and *Spacing After* to `6 pt` or `8 pt` under `Home > Paragraph`.
3. To insert a soft line break without starting a new paragraph (preventing extra spacing), press `Shift + Enter`.
4. *Drop Cap*: Under `Insert > Text > Drop Cap`, format the opening letter of a major chapter to drop 3 lines into the text block for editorial magazine styling.

#v(2pt)
#ribbon-specimen(path: "Home > Paragraph > Line and Paragraph Spacing", command: "Line Spacing Options Dialog", shortcut: "Ctrl + 1 / Ctrl + 2 / Ctrl + 5")
#v(2pt)

== 2.5 Tab Stops & Precision Horizontal Alignment

Pressing the `Tab` key moves the cursor 0.5 inches by default. Professional forms, resumes, and price lists utilize custom tab stops configured on the horizontal ruler:
- *Left Tab (L)*: Text flows to the right from the tab stop position.
- *Center Tab (T-inverted)*: Text centers symmetrically beneath the stop marker.
- *Right Tab (Reverse-L)*: Text flows to the left, guaranteeing right-aligned numbers or dates.
- *Decimal Tab (Dot)*: Aligns numbers strictly on their decimal points, critical for financial currency tables.
- *Tab Leaders*: Generates dotted, dashed, or solid lines bridging column gaps (essential for menus and manual tables).

#pagebreak()

== 2.6 Bullets, Numbering & Enterprise Multilevel List Engineering

Simple bullet points fail when documenting multi-tier legal bylaws or technical policies. Word 365 features a robust *Multilevel List Engine*:

```
1. CORPORATE PROCUREMENT POLICY (Level 1: 18pt Bold, Space Before 12pt)
   1.1 Capital Expenditure Authorization (Level 2: 14pt SemiBold, Indent 0.25")
       1.1.1 Purchases Exceeding \$50,000 (Level 3: 11pt Regular, Indent 0.5")
             (a) Mandatory 3-Vendor RFP competitive bidding
             (b) Chief Financial Officer sign-off required
```

*Steps to Link Multilevel Lists to Heading Styles*:
1. Click `Home > Paragraph > Multilevel List > Define New Multilevel List`.
2. Click *More* in the bottom-left corner to expand deep configuration levers.
3. Select *Level 1*, click *Link level to style*, and choose `Heading 1`.
4. Select *Level 2*, link to `Heading 2`, and check *Include level number from Level 1*.
5. Select *Level 3*, link to `Heading 3`. Now, applying headings automatically generates perfect decimal numbering throughout the 100+ page document!

#v(2pt)

== 2.7 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which shortcut dynamically cycles text through lowercase, uppercase, and title case?", ans: "Shift + F3.")
    #short-qa(num: 2, q: "What is the key difference between pressing Enter vs Shift+Enter?", ans: "Enter creates a new paragraph; Shift+Enter inserts a soft line break within the same paragraph.")
    #short-qa(num: 3, q: "Which tab stop type guarantees currency amounts align strictly along the decimal point?", ans: "Decimal Tab.")
    #short-qa(num: 4, q: "What replaced Calibri as the default sans-serif font family in Microsoft 365?", ans: "Aptos.")
  ],
  [
    #mcq(num: 1, q: "What is the shortcut to apply 1.5 line spacing to the selected paragraph?", a: "Ctrl + 1", b: "Ctrl + 2", c: "Ctrl + 5", d: "Ctrl + Shift + L", ans: "C", expl: "Ctrl + 1 is single space, Ctrl + 2 is double space, Ctrl + 5 applies 1.5 lines.")
    #mcq(num: 2, q: "Which typographic feature automatically drops the first character of a paragraph across multiple lines?", a: "WordArt", b: "Drop Cap", c: "SmartArt", d: "Superscript", ans: "B", expl: "Drop Cap (Insert > Text > Drop Cap) creates editorial magazine-style opening letters.")
    #mcq(num: 3, q: "What is the standard enterprise method to create vertical distance between paragraphs?", a: "Pressing Enter twice", b: "Adjusting 'Spacing After' in Paragraph settings", c: "Inserting a blank table", d: "Increasing top margin", ans: "B", expl: "Adjusting Spacing After (e.g., 6pt or 8pt) guarantees consistent pagination.")
  ]
)

#v(2pt)

#spotlight-box("2027 VARIABLE OPEN-TYPE TYPOGRAPHY IN WORD 365", [
  Word 365 now fully supports Variable OpenType Fonts (such as Aptos Variable). Instead of discrete weights (Regular, Bold), designers can dial in continuous weight axes (from 100 Hairline to 900 Ultra-Black) and optical width axes, allowing micro-typography adjustments that perfectly fill column headers without text clipping.
])
