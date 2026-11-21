#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 04]
= Insert Tab: Tables, Matrix Data Manipulation & Table Formulas

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Tables represent the primary vehicle for structured data presentation in corporate proposals, invoices, financial balance sheets, and project matrices. Mastering table geometry, row pagination repeat headers, cell splitting, and formula evaluation ensures flawless multi-page data integrity.
]

#v(2pt)

== 4.1 Table Creation Methodologies & Structural Architecture

Word 365 provides 5 distinct methods to instantiate data matrices under `Insert > Tables > Table`:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Creation Method*], [*Operational Characteristics & Flexibility*], [*Enterprise Context*]),
  [Interactive Grid], [Hover up to 10 columns by 8 rows directly on drop-down palette.], [Rapid prototyping of small summary matrices.],
  [Insert Table Dialog], [Specify exact column/row counts and fixed vs. AutoFit behavior.], [Large structured forms with predefined schema.],
  [Draw Table Pencil], [Draw custom asymmetric cell boundaries with precise coordinate pencil.], [Complex invoice forms with varied row heights.],
  [Convert Text to Table], [Parses delimited text (commas, tabs, semicolons) into tabular matrix.], [Migrating CSV data or raw database dumps into Word.],
  [Excel Spreadsheet], [Embeds a live OLE Excel calculation grid with full formula engine.], [Financial models requiring dynamic chart linking.]
)

#v(2pt)
#ribbon-specimen(path: "Insert > Table > Convert Text to Table", command: "Transform Comma/Tab Delimited Data", shortcut: "Alt + N + T + V")
#v(2pt)

== 4.2 Table Tools: Design & Layout Ribbon Decomposition

When the cursor enters any table cell, Word activates two contextual ribbons:

1. *Table Design Tab*:
   - *Table Style Options*: Header Row, Total Row, Banded Rows (Zebra striping), First Column, Last Column, Banded Columns.
   - *Table Styles*: 100+ pre-formatted corporate color palettes adhering to document themes.
   - *Borders & Shading*: Custom line weights (0.25 pt to 6 pt), border colors, and Border Painter cursor.
2. *Table Layout Tab*:
   - *Rows & Columns*: Insert Above, Insert Below, Insert Left, Insert Right, Delete Rows/Columns/Table.
   - *Merge & Split*: Merge Cells, Split Cells (divide single cell into M × N matrix), Split Table.
   - *Cell Size & AutoFit*: *AutoFit Contents* (hugs text tightly), *AutoFit Window* (expands to 100% margin width), *Distribute Rows/Columns* evenly.
   - *Alignment Matrix*: 9-position spatial alignment grid (Top-Left, Center-Center, Bottom-Right) and Text Direction rotation (90° / 270°).

#pagebreak()

== 4.3 Multi-Page Table Management & Repeat Header Rows

When corporate data tables span across multiple pages (e.g., a 400-row inventory audit), two severe formatting errors frequently occur:
1. Rows split awkwardly across page breaks, slicing text lines in half.
2. Readers lose context on subsequent pages because the header column names vanish.

*The Enterprise Multi-Page Table Protocol*:
- *Repeat Header Rows*: Highlight the top header row, navigate to `Table Layout > Data > Repeat Header Rows`. Word automatically replicates the exact header styling at the top of every subsequent page break.
- *Prevent Row Split Across Pages*: Highlight all data rows, open `Table Properties > Row tab`, and uncheck *Allow row to break across pages*. This forces Word to push entire rows to the next page if space is insufficient.
- *CantSplit Flag*: Ensures legal clause numbers and signatures never get severed across physical paper boundaries.

#v(2pt)
#ribbon-specimen(path: "Table Layout > Data > Repeat Header Rows", command: "Universal Multi-Page Column Headers", shortcut: "Alt + J + L + H")
#v(2pt)

== 4.4 In-Table Formula Calculations (`=SUM`, `=AVERAGE`)

Word tables incorporate an internal calculation engine accessible via `Table Layout > Data > Formula` (`Alt + J + L + O`). Cells are addressed identically to Excel using coordinate notation (Column letters A, B, C... and Row numbers 1, 2, 3...):

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function Syntax*], [*Positional Argument*], [*Computational Result & Enterprise Application*]),
  [`=SUM(ABOVE)`], [Positional (`ABOVE`)], [Sums all numeric values continuously above current cell in column.],
  [`=AVERAGE(LEFT)`], [Positional (`LEFT`)], [Calculates arithmetic mean of values immediately to the left.],
  [`=PRODUCT(B2, C2)`], [Coordinate (`B2, C2`)], [Multiplies Quantity (B2) by Unit Price (C2) in an invoice line.],
  [`=COUNT(ABOVE)`], [Positional (`ABOVE`)], [Counts number of numeric entries in a columnar audit register.],
  [`=MIN(D2:D20)`], [Range (`D2:D20`)], [Returns minimum value across a specified cell matrix range.]
)

#concept-box(title: "CRITICAL RE-CALCULATION PROTOCOL: F9 KEY", [
  Unlike Microsoft Excel, Word table formulas *do not automatically recalculate* when underlying numbers change! To update table sums after editing quantities, highlight the calculated cell (or entire table via `Ctrl + A`) and press the `F9` key.
])

#pagebreak()

== 4.5 Production Matrix: Corporate Quotation Invoice Blueprint

Below is an authentic specimen of a corporate procurement quotation table constructed with Word's calculation formulas and alignment matrices:

#table(
  columns: (0.8fr, 2.5fr, 0.9fr, 1.1fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if y == 4 { rgb("#FEF3C7") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Item*], [*Description of Hardware Equipment*], [*Qty*], [*Unit Price*], [*Total Amount*]),
  [01], [Dell PowerEdge R760 Rack Server (2U, Dual Xeon)], [02], [₹ 4,50,000], [₹ 9,00,000],
  [02], [Cisco Catalyst 9300 48-Port PoE+ Gigabit Switch], [04], [₹ 1,75,000], [₹ 7,00,000],
  [03], [APC Smart-UPS RT 10kVA On-Line Power Backup], [01], [₹ 3,25,000], [₹ 3,25,000],
  [*TOTAL*], [*Grand Sub-Total (Calculated via =SUM(ABOVE))*], [*07*], [--], [*₹ 19,25,000*]
)

#v(2pt)

== 4.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which key updates table formula calculations in Word?", ans: "F9 key.")
    #short-qa(num: 2, q: "Which command ensures table column titles repeat across page breaks?", ans: "Table Layout > Repeat Header Rows.")
    #short-qa(num: 3, q: "How are table columns and rows addressed in Word formulas?", ans: "Columns use letters (A, B, C...); rows use numbers (1, 2, 3...).")
    #short-qa(num: 4, q: "Which tool automatically sizes table columns to match text width?", ans: "Table Layout > AutoFit > AutoFit Contents.")
  ],
  [
    #mcq(num: 1, q: "What happens when pressing the Tab key while in the very last cell of a table?", a: "Deletes the table", b: "Automatically inserts a new row at the bottom", c: "Closes Word", d: "Indents the text", ans: "B", expl: "Pressing Tab in the bottom-right cell dynamically spawns an identical new row.")
    #mcq(num: 2, q: "Which formula syntax sums all numbers directly above the active cell?", a: "=ADD(UP)", b: "=SUM(ABOVE)", c: "=TOTAL(TOP)", d: "=PLUS(ALL)", ans: "B", expl: "=SUM(ABOVE) is the native positional formula in Word tables.")
    #mcq(num: 3, q: "Which setting prevents a table row from being sliced in half across a page boundary?", a: "AutoFit Window", b: "Uncheck 'Allow row to break across pages'", c: "Repeat Header Rows", d: "Distribute Rows", ans: "B", expl: "Unchecking this in Table Properties > Row forces the entire row to remain intact on one page.")
  ]
)

#v(2pt)

#spotlight-box("2027 COPILOT TABLE EXTRACTION & ENRICHMENT", [
  Word 365 Copilot AI can convert raw unstructured meeting notes into fully formatted, branded tables with a single prompt: "Convert the equipment discussion above into a 4-column procurement table with Unit Prices and Total calculations". Copilot automatically parses quantities and inserts mathematical `=PRODUCT` and `=SUM` formula codes.
])
