import os
import subprocess
import fitz

def update_vault():
    eng_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/English'
    hi_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/Hindi'
    vault_dir = 'DIGITAL/OFFICE_365/03_INTERVIEW_AND_SHORTCUT_VAULT'
    os.makedirs(vault_dir, exist_ok=True)

    # =========================================================================
    # 1. ENGLISH CHAPTER 31
    # =========================================================================
    en_ch31 = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: CLOUD ECOSYSTEM, COPILOT AI & INTERVIEW VAULT · CHAPTER 31]
= The Top 100 Corporate Keyboard Shortcuts Master Reference Vault

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Reaching for the physical mouse destroys cognitive flow and costs enterprise professionals hundreds of cumulative hours annually. Master the top 100 essential shortcuts across Word, Excel, PowerPoint, and the Cloud Ecosystem to achieve true keyboard-driven productivity.
]

#v(2pt)

== 31.1 Microsoft Word 365: Navigation, Formatting & Structural Shortcuts (1-25)

#table(
  columns: (1.2fr, 0.9fr, 2.9fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.1pt),
  table.header([*Shortcut Key*], [*Target Scope*], [*Operational Action & Behavioral Mechanics*]),
  [`Ctrl + Enter`], [Structural], [Inserts an instant Hard Page Break at current cursor position.],
  [`Ctrl + Shift + Enter`], [Structural], [Splits table horizontally above current active row.],
  [`Alt + Shift + D`], [Field Code], [Inserts dynamic self-updating Date field {DATE}.],
  [`Alt + Shift + P`], [Field Code], [Inserts dynamic page number field {PAGE}.],
  [`Ctrl + Shift + C`], [Formatting], [Copies character/paragraph formatting (Format Painter source).],
  [`Ctrl + Shift + V`], [Formatting], [Pastes copied formatting onto current selection.],
  [`Ctrl + Shift + N`], [Styles], [Reverts selected paragraph to default Normal body style.],
  [`Alt + Ctrl + 1`], [Styles], [Applies Heading 1 style immediately to paragraph.],
  [`Alt + Ctrl + 2`], [Styles], [Applies Heading 2 style immediately to paragraph.],
  [`Alt + Ctrl + 3`], [Styles], [Applies Heading 3 style immediately to paragraph.],
  [`Shift + F3`], [Typography], [Cycles text case: Sentence case > UPPERCASE > lowercase.],
  [`Ctrl + Shift + A`], [Typography], [Toggles all selected text into true All Caps format.],
  [`Ctrl + Shift + K`], [Typography], [Toggles Small Caps formatting on current selection.],
  [`Ctrl + Spacebar`], [Formatting], [Clears all direct manual font styling back to underlying style.],
  [`Ctrl + Q`], [Formatting], [Clears all direct manual paragraph styling (margins, line spacing).],
  [`Ctrl + Shift + >`], [Typography], [Increases font size by next incremental point value.],
  [`Ctrl + Shift + <`], [Typography], [Decreases font size by next incremental point value.],
  [`Ctrl + Shift + 8 (*)`], [View], [Toggles non-printing formatting marks (pilcrow, spaces, tabs).],
  [`Alt + Shift + ↑`], [Paragraph], [Moves current paragraph or table row upward past preceding block.],
  [`Alt + Shift + ↓`], [Paragraph], [Moves current paragraph or table row downward past following block.],
  [`Ctrl + K`], [Navigation], [Launches Insert Hyperlink dialog for bookmarks or cloud URLs.],
  [`Ctrl + F`], [Navigation], [Opens Navigation Pane with live search and Headings tree.],
  [`Ctrl + H`], [Editing], [Opens Find & Replace dialog with advanced regex/wildcard support.],
  [`F4`], [Productivity], [Repeats the very last formatting or editing action performed.],
  [`F7`], [Proofing], [Launches Microsoft Editor spelling and grammar inspection pane.]
)

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/word-365-full-workspace.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 31.1: Official Microsoft Word 365 Fluent Interface: Ribbon Anatomy, Heading Styles Hierarchy & Navigation Pane.
  ]
]

#pagebreak()

== 31.2 Microsoft Excel 365: Navigation, Selection & Data Entry Shortcuts (26-55)

#table(
  columns: (1.2fr, 0.9fr, 2.9fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 1.8pt),
  table.header([*Shortcut Key*], [*Target Scope*], [*Operational Action & Behavioral Mechanics*]),
  [`F4`], [Formulas], [Cycles absolute/relative reference modes ($A$1 > A$1 > $A1 > A1).],
  [`Alt + =`], [Formulas], [Inserts intelligent AutoSum =SUM(...) range detection.],
  [`Ctrl + ~ (Grave)`], [Auditing], [Toggles worksheet display between calculated values and formulas.],
  [`Ctrl + [`], [Auditing], [Selects all direct precedent cells feeding active formula.],
  [`Ctrl + ]`], [Auditing], [Selects all direct dependent cells relying on active cell.],
  [`Ctrl + T`], [Data Table], [Converts contiguous data range into structured Excel Table.],
  [`Ctrl + Shift + L`], [Filtering], [Toggles AutoFilter dropdown arrows across table headers.],
  [`Alt + ↓`], [Filtering], [Opens filter dropdown menu on active header cell.],
  [`Ctrl + Spacebar`], [Selection], [Selects entire active column across the sheet.],
  [`Shift + Spacebar`], [Selection], [Selects entire active row across the sheet.],
  [`Ctrl + Shift + Plus`], [Grid Edit], [Inserts new cells, rows, or columns at selection.],
  [`Ctrl + Minus`], [Grid Edit], [Deletes selected cells, rows, or columns.],
  [`Ctrl + D`], [Data Entry], [Fills formula/value downward from cell directly above.],
  [`Ctrl + R`], [Data Entry], [Fills formula/value rightward from cell directly to left.],
  [`Ctrl + E`], [Intelligence], [Triggers Flash Fill AI pattern recognition engine.],
  [`Alt + Enter`], [Data Entry], [Inserts hard line break / carriage return inside active cell.],
  [`Ctrl + ; (Semicolon)`], [Data Entry], [Inserts current static date serial number.],
  [`Ctrl + Shift + :`], [Data Entry], [Inserts current static timestamp fraction.],
  [`Ctrl + 1`], [Formatting], [Opens Format Cells dialog box with custom number formatting.],
  [`Ctrl + Shift + 1 (!)`], [Formatting], [Applies Number format with commas and two decimals.],
  [`Ctrl + Shift + 4 ($)`], [Formatting], [Applies Currency format with regional symbol and decimals.],
  [`Ctrl + Shift + 5 (%)`], [Formatting], [Applies Percentage format with zero decimal places.],
  [`Ctrl + A`], [Selection], [Selects current contiguous data region (Current Region).],
  [`Ctrl + Arrow Keys`], [Navigation], [Jumps instantly to outer edge of contiguous data block.],
  [`Ctrl + Shift + Arrows`], [Selection], [Extends cell selection to edge of contiguous data block.],
  [`Ctrl + Page Down`], [Navigation], [Switches to the next worksheet tab to the right.],
  [`Ctrl + Page Up`], [Navigation], [Switches to the previous worksheet tab to the left.],
  [`Alt + H + O + I`], [Ribbon Fast], [Auto-fits column widths to fit widest cell content.],
  [`Alt + H + M + C`], [Ribbon Fast], [Merges and centers selected cell block.],
  [`F12`], [File System], [Opens Save As dialog directly bypassing cloud menus.]
)

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-365-full-workspace.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 31.2: Official Microsoft Excel 365 Enterprise Grid: Dynamic XLOOKUP Formula Bar, Data Validation & Copilot AI Insights.
  ]
]

#pagebreak()

== 31.3 Microsoft Excel Advanced & PowerPoint 365 Shortcuts (56-85)

#table(
  columns: (1.3fr, 0.9fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 1.8pt),
  table.header([*Shortcut Key*], [*Target Scope*], [*Operational Action & Behavioral Mechanics*]),
  [`Alt + E + S + V`], [Paste Special], [Pastes Values only, stripping all formulas and formatting.],
  [`Alt + E + S + T`], [Paste Special], [Pastes Formats only, leaving underlying values untouched.],
  [`Alt + E + S + E`], [Paste Special], [Transposes copied horizontal row into vertical column.],
  [`Alt + N + V + T`], [PivotTable], [Launches PivotTable generation wizard from current table.],
  [`Alt + F1`], [Visual Chart], [Generates embedded Default Column Chart on active sheet.],
  [`F11`], [Visual Chart], [Generates full-screen dedicated Chart Sheet in workbook.],
  [`Ctrl + F1`], [Interface], [Toggles Office Ribbon between collapsed and pinned states.],
  [`Ctrl + F3`], [Name Manager], [Opens Name Manager to view and define scoped Named Ranges.],
  [`F9`], [Calculation], [Forces manual recalculation across all open workbooks.],
  [`Shift + F9`], [Calculation], [Calculates active worksheet only, ignoring background sheets.],
  [`Shift + F2`], [Notes], [Inserts or edits traditional legacy cell Comment/Note.],
  [`Ctrl + Shift + F2`], [Comments], [Opens modern threaded collaborative Comment pane.],
  [`Alt + N + K`], [Symbols], [Opens Symbol and Special Character insertion matrix.],
  [`Ctrl + Backspace`], [Navigation], [Scrolls viewport back to active cell without losing selection.],
  [`Shift + F11`], [Sheets], [Inserts a brand-new blank worksheet tab.],
  [`Ctrl + M`], [PowerPoint], [Inserts a new blank slide formatted to previous layout.],
  [`Ctrl + D`], [PowerPoint], [Duplicates selected slide, shape, or card instantaneously.],
  [`Ctrl + G`], [PowerPoint], [Groups multiple selected shapes into single transformable unit.],
  [`Ctrl + Shift + G`], [PowerPoint], [Ungroups selected shape group into individual vector paths.],
  [`Shift + F9`], [PowerPoint], [Toggles visual alignment gridlines across slide canvas.],
  [`Alt + F9`], [PowerPoint], [Toggles horizontal and vertical center reference guides.],
  [`Alt + F10`], [PowerPoint], [Opens Selection Pane to manage object z-order and names.],
  [`Ctrl + Shift + C`], [PowerPoint], [Copies shape formatting attributes (fill, stroke, shadow).],
  [`Ctrl + Shift + V`], [PowerPoint], [Pastes copied shape formatting onto target shape.],
  [`Shift + Resize Handle`], [PowerPoint], [Constrains proportions (forces perfect squares / circles).],
  [`Ctrl + Resize Handle`], [PowerPoint], [Resizes shape symmetrically anchored from exact center.],
  [`Ctrl + Shift + Rotate`], [PowerPoint], [Constrains rotation to crisp 15-degree increments.],
  [`Ctrl + K`], [PowerPoint], [Creates interactive hyperlink or slide-to-slide jump.],
  [`F5`], [PowerPoint], [Launches slideshow presentation from Slide 1.],
  [`Shift + F5`], [PowerPoint], [Launches slideshow starting from currently active slide.]
)

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/powerpoint-365-full-workspace.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 31.3: Official Microsoft PowerPoint 365 Workspace: Slide Master Architecture, 6x6 Layout Rule & Morph Transitions.
  ]
]

#pagebreak()

== 31.4 PowerPoint Delivery & Cloud Ecosystem Shortcuts (86-100)

#table(
  columns: (1.3fr, 0.9fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Shortcut Key*], [*Target Scope*], [*Operational Action & Behavioral Mechanics*]),
  [`Alt + F5`], [Presenter View], [Forces Presenter View delivery mode on primary monitor.],
  [`B (During Show)`], [Live Show], [Blacks out presentation screen, redirecting eyes to speaker.],
  [`W (During Show)`], [Live Show], [Whites out presentation screen for whiteboard projection.],
  [`Ctrl + L`], [Live Show], [Transforms standard mouse cursor into digital Laser Pointer.],
  [`Ctrl + P`], [Live Show], [Transforms mouse cursor into live digital Annotation Pen.],
  [`Ctrl + A`], [Live Show], [Restores annotation pen back to normal Arrow cursor.],
  [`Ctrl + E`], [Live Show], [Activates digital Eraser to scrub specific live ink strokes.],
  [`E (During Show)`], [Live Show], [Erases all live on-screen ink annotations simultaneously.],
  [`Number + Enter`], [Live Show], [Jumps directly to target slide number (e.g., 1 + 8 + Enter).],
  [`Ctrl + S`], [Cloud File], [Triggers immediate background cloud delta sync save.],
  [`Alt + Q`], [Search / AI], [Opens ‘Tell Me’ / Copilot universal application search box.],
  [`Ctrl + Alt + Space`], [Accessibility], [Activates Immersive Reader neural Read Aloud engine.],
  [`Win + Shift + S`], [Screen Clip], [Launches Windows Snipping Tool for instant visual paste.],
  [`Ctrl + Z`], [Undo Engine], [Reverts last chronological action across all applications.],
  [`Ctrl + Y`], [Redo Engine], [Re-executes last undone action (or repeats last command).]
)

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/office-visual-refresh.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 31.4: Microsoft 365 Visual Refresh Interface Architecture: Unified Ribbon, Cloud Co-Authoring & Multi-Window Synchronization.
  ]
]

#v(3pt)

#spotlight-box("THE 14-DAY KEYBOARD MASTERY CHALLENGE", [
  Unplug your physical mouse for 2 hours every morning. Navigating formulas, tables, and presentation decks using Alt-key ribbon accelerators (`Alt > H > O > I`, `Alt > E > S > V`) rewires neural muscle memory. Corporate MIS analysts who operate purely by keyboard complete weekly financial closing cycles 3.5x faster than peers.
])
"""

    # =========================================================================
    # 2. ENGLISH CHAPTER 32
    # =========================================================================
    en_ch32 = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: CLOUD ECOSYSTEM, COPILOT AI & INTERVIEW VAULT · CHAPTER 32]
= The Top 50 MIS Interview Vault, Author Note & Career Accelerator Bundle

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Senior Management Information Systems (MIS) executives and corporate analysts face grueling technical interviews. This chapter delivers the top 50 high-frequency interview questions with exact enterprise-grade answers, followed by Founder Rahul Patel's concluding message and the ₹149 Career Accelerator invitation.
]

#v(2pt)

== 32.1 Questions 01 - 15: Core Office 365 Architecture & Data Modeling

#short-qa(num: 1, q: "What is the primary operational difference between VLOOKUP and XLOOKUP?", ans: "VLOOKUP searches only left-to-right, requires hardcoded column index numbers vulnerable to column insertions, and defaults to approximate match. XLOOKUP searches bidirectionally, separates lookup/return arrays safely, defaults to exact match, and handles missing data natively via [if_not_found].")

#short-qa(num: 2, q: "Explain the Spill mechanism and the #SPILL! error in modern Excel.", ans: "Dynamic array formulas automatically expand into adjacent blank cells (the spill range). If any obstacle (value, text, merged cell) blocks the designated expansion bounding box, Excel halts execution and throws a #SPILL! collision error.")

#short-qa(num: 3, q: "What is the difference between =COUNT, =COUNTA, and =COUNTBLANK?", ans: "=COUNT tallies cells containing numeric values only. =COUNTA tallies all non-empty cells (numbers, text, boolean, errors). =COUNTBLANK tallies strictly empty cells or formulas returning empty text strings \"\".")

#short-qa(num: 4, q: "When should INDEX/MATCH be chosen over VLOOKUP in legacy enterprise systems?", ans: "INDEX/MATCH evaluates independent column ranges, consumes drastically less memory on multi-gigabyte workbooks, supports reverse leftward lookups, and never breaks when intervening columns are added or deleted.")

#short-qa(num: 5, q: "How does Power Query handle automated monthly ETL refreshes?", ans: "Power Query records data ingestion, transformation, unpivoting, and typecasting steps in the M language. When new source files drop into a folder, clicking Data > Refresh All re-executes all transformations deterministically in seconds.")

#short-qa(num: 6, q: "What is the Pivot Cache and why does it affect workbook file size?", ans: "When a PivotTable is created, Excel builds an in-memory replica snapshot of the source dataset called the Pivot Cache. Multiple PivotTables referencing the same cache share memory; creating separate caches duplicates file size.")

#short-qa(num: 7, q: "What is the difference between a Calculated Field and a Calculated Item in PivotTables?", ans: "A Calculated Field creates a new virtual column derived from mathematical operations on existing fields (e.g., =Sales * 18%). A Calculated Item creates a virtual row performing math across individual items within a single field.")

#short-qa(num: 8, q: "Explain the role of Styles in long-form Word document automation.", ans: "Styles (Heading 1-9) establish structural semantic hierarchy. They drive automated Table of Contents generation, Navigation Pane tree collapsing, cross-referencing bookmarks, and universal deck-wide font re-theming in seconds.")

#short-qa(num: 9, q: "What is the difference between a Section Break (Next Page) and a Page Break in Word?", ans: "A Page Break only advances text to the next page. A Section Break creates an independent structural partition, allowing unique headers, footers, page numbering restarts, margins, and landscape/portrait orientation flips.")

#short-qa(num: 10, q: "How do you resolve Mail Merge numeric formatting corruptions (e.g. ₹50000 displaying as 50000.0000001)?", ans: "Press Alt + F9 to reveal underlying field codes, and append an explicit picture switch: { MERGEFIELD Salary \\# \"#,##,##0.00\" }.")

#short-qa(num: 11, q: "What is the difference between Parent Slide Master and Child Layouts in PowerPoint?", ans: "The Parent Master cascades formatting (fonts, logos, background fill) universally to all slides. Child Layouts contain specialized placeholder configurations applying only to slides assigned that specific layout.")

#short-qa(num: 12, q: "How does the Morph transition differ from standard PowerPoint animations?", ans: "Standard animations require explicit manual motion paths on a single slide. Morph automatically calculates the coordinate and size deltas of matching objects between two distinct slides and renders 60fps fluid interpolation.")

#short-qa(num: 13, q: "What is the purpose of the double exclamation prefix (!!) in PowerPoint Morph?", ans: "Prepend !! (e.g. !!HeroShape) in the Selection Pane to force PowerPoint to morph two completely different geometric shapes into each other across slide boundaries.")

#short-qa(num: 14, q: "How does differential delta sync in OneDrive for Business optimize network performance?", ans: "Instead of re-uploading an entire multi-megabyte file upon saving, the delta sync engine calculates and transmits strictly the modified binary chunks, reducing bandwidth consumption by over 95%.")

#short-qa(num: 15, q: "What happens when you select 'Block Download' when sharing an Office 365 file?", ans: "The recipient is restricted to browser-only viewing and commenting; downloading a local copy, printing, or copying text to the clipboard is cryptographically blocked.")

#v(2pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-pivottable-sample.png", width: 95%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 32.1: Enterprise PivotTable Data Source & Normalized Tabular Range Specimen.
  ]
]

#pagebreak()

== 32.2 Questions 16 - 35: Advanced Modeling, Cloud Collaboration & Automation

#short-qa(num: 16, q: "What is the syntax and utility of the LAMBDA function in Excel 365?", ans: "Syntax: =LAMBDA(param1, param2, ..., calculation). It allows users to create bespoke, reusable custom Excel functions without writing VBA code, which can then be named inside the Name Manager.")

#short-qa(num: 17, q: "How do =LET functions optimize calculation speed in complex models?", ans: "Syntax: =LET(name1, val1, calculation). It assigns intermediate calculation results to variables within a single formula. Repeated expensive lookups are computed once rather than multiple times, drastically reducing latency.")

#short-qa(num: 18, q: "Explain the difference between =TEXTJOIN and =CONCATENATE.", ans: "=CONCATENATE requires manual delimiter insertion between every token and cannot handle ranges. =TEXTJOIN accepts an entire contiguous range, applies a universal delimiter (e.g. \"; \"), and natively ignores empty cells.")

#short-qa(num: 19, q: "How does =NETWORKDAYS.INTL accommodate non-standard corporate workweeks?", ans: "=NETWORKDAYS.INTL includes a [weekend] parameter where customized binary masks (e.g. \"0000011\" for Friday/Saturday weekends) can be passed alongside corporate holiday arrays.")

#short-qa(num: 20, q: "What is the difference between =STDEV.S and =STDEV.P?", ans: "=STDEV.S calculates standard deviation for a sample (dividing by N - 1). =STDEV.P measures standard deviation for the entire population (dividing by N). Using .P on sample data underestimates risk.")

#short-qa(num: 21, q: "Why must the initial capital outlay (Period 0) be added outside Excel's =NPV function?", ans: "=NPV automatically discounts the first value in the range as arriving at Period 1. Including Year 0 cash flow inside the range discounts the initial investment incorrectly by one full year.")

#short-qa(num: 22, q: "What is the mathematical relationship between PMT, IPMT, and PPMT?", ans: "For any loan installment period per: PMT = IPMT + PPMT. IPMT calculates the interest portion, while PPMT isolates the principal repayment portion.")

#short-qa(num: 23, q: "Explain how to unpivot tabular data in Power Query and why it is critical.", ans: "Select attribute columns, click Unpivot Other Columns. This transforms wide matrix reports into a normalized 3-column relational schema (Key, Attribute, Value) essential for scalable PivotTable analytics.")

#short-qa(num: 24, q: "What is the difference between a Shared Workbook (legacy) and Co-Authoring (365)?", ans: "Legacy Shared Workbooks relied on file locking, frequently corrupted data, and disabled modern tables. Office 365 Co-Authoring uses cloud delta streaming to allow simultaneous multi-user presence without corruption.")

#short-qa(num: 25, q: "How do you audit formula errors using Trace Precedents and Trace Dependents?", ans: "Under Formulas > Formula Auditing, Trace Precedents draws blue arrows from all source cells feeding the formula. Trace Dependents points to all downstream formulas relying on the active cell.")

#short-qa(num: 26, q: "What is a Circular Reference and how do you resolve it?", ans: "Occurs when a formula refers to its own cell directly or indirectly. Resolved by checking Formulas > Error Checking > Circular References, and restructuring the calculation flow or enabling Iterative Calculation.")

#short-qa(num: 27, q: "What is the difference between Slicers and Timelines in Excel dashboards?", ans: "Slicers filter categorical text dimensions (e.g. Region, Category). Timelines filter date-formatted fields, offering interactive zooming across Years, Quarters, Months, and Days.")

#short-qa(num: 28, q: "How do you protect formula cells in an Excel worksheet while allowing data entry in others?", ans: "Select data entry cells, open Format Cells > Protection, and uncheck 'Locked'. Then go to Review > Protect Sheet and enable password protection. Only unlocked cells remain editable.")

#short-qa(num: 29, q: "What is Microsoft Copilot grounding and how does it prevent generic hallucinations?", ans: "Grounding queries the Microsoft Graph using authenticated user permissions to inject relevant corporate emails, chats, and documents into the prompt context before sending it to the LLM.")

#short-qa(num: 30, q: "What is the difference between VBA Macros and Microsoft Office Scripts?", ans: "VBA is a desktop-only legacy COM-based language. Office Scripts use modern TypeScript/JavaScript, run securely in the cloud, work on Excel Online/Mac/Mobile, and integrate with Power Automate workflows.")

#short-qa(num: 31, q: "How do you configure an interactive branching quiz in PowerPoint 365?", ans: "Create action buttons or hyperlinks linked to specific slides based on the selected answer, and disable 'Advance On Click' in Transition settings to force button-only navigation.")

#short-qa(num: 32, q: "What is the function of the Selection Pane (Alt + F10) in complex presentation decks?", ans: "It provides a hierarchical layer manager to rename objects, reorder z-index stacking layers, hide/unhide elements during editing, and configure matching names (!!) for Morph transitions.")

#short-qa(num: 33, q: "How does the 'Summary Zoom' feature function in executive presentations?", ans: "It auto-generates a high-level dashboard slide with live thumbnail links to major sections, zooming into deep-dive slides upon click and returning automatically to the overview when the section ends.")

#short-qa(num: 34, q: "What causes the #NUM! error in Excel financial functions like =IRR?", ans: "Occurs when the iterative calculation engine fails to converge on a valid rate of return within 20 iterations, or when the cash flow series lacks at least one negative and one positive value.")

#short-qa(num: 35, q: "What is the benefit of saving PowerPoint presentations as .ppsx instead of .pptx?", ans: ".pptx opens in normal slide editing mode. .ppsx (PowerPoint Show) opens directly into full-screen presentation mode upon double-clicking, bypassing the editing workspace entirely.")

#pagebreak()

== 32.3 Questions 36 - 50: Enterprise Strategy, Security & Advanced MIS Analytics

#short-qa(num: 36, q: "How do you automate multi-table relational modeling without writing VLOOKUP formulas?", ans: "Load tables into the Excel Data Model (Power Pivot). Create 1-to-Many relationships between Primary Keys and Foreign Keys in Diagram View, then generate PivotTables directly from the Data Model.")

#short-qa(num: 37, q: "What is DAX and how does it differ from traditional Excel formulas?", ans: "Data Analysis Expressions (DAX) operates across relational tables in the Data Model using row and filter contexts (e.g. =CALCULATE(SUM(Sales), Region=\"North\")), enabling scalable multi-million-row analytics.")

#short-qa(num: 38, q: "Explain the difference between Implicit and Explicit measures in Power Pivot.", ans: "Implicit measures are created automatically by dragging numeric fields into the PivotTable Values area. Explicit measures are formalized DAX formulas defined inside the Data Model, offering superior reusability and performance.")

#short-qa(num: 39, q: "How do Sensitivity Labels protect corporate Office 365 documents?", ans: "Managed via Microsoft Purview, Sensitivity Labels apply hardware-level Rights Management encryption, visual headers/watermarks, and access controls that persist even if the file is emailed externally.")

#short-qa(num: 40, q: "How do you resolve a #VALUE! error caused by math operations on text-formatted numbers?", ans: "Wrap the reference in the =VALUE() function, or multiply by 1 (e.g. =A1 * 1), which forces Excel's coercion engine to convert numeric string tokens into true mathematical numbers.")

#short-qa(num: 41, q: "What is the 6x6 corporate presentation rule and why is it enforced?", ans: "No more than 6 bullet points per slide, and no more than 6 words per bullet. Enforced to prevent cognitive overload and maintain executive focus on the speaker rather than reading walls of text.")

#short-qa(num: 42, q: "How do you embed a live Excel chart into PowerPoint so that it auto-updates when data changes?", ans: "Copy the chart in Excel. In PowerPoint, choose Paste Special > Paste Link > Microsoft Excel Chart Object. When the underlying workbook is edited, the slide chart updates automatically.")

#short-qa(num: 43, q: "Explain the purpose of the =INDIRECT function and its primary operational risk.", ans: "=INDIRECT converts a text string into an active cell reference (e.g. =INDIRECT(\"B\" & 5)). Risk: It is a volatile function that recalculates on every keystroke, causing severe workbook lag in large models.")

#short-qa(num: 44, q: "What is the difference between =CHOOSECOLS and =CHOOSEROWS in dynamic arrays?", ans: "=CHOOSECOLS extracts specific columns by numeric index from an array. =CHOOSEROWS extracts specific horizontal rows. They eliminate the need for complex offset calculations.")

#short-qa(num: 45, q: "How do you automate document generation across 1,000 customers using Word Mail Merge?", ans: "Link Word to an Excel data source via Mailings > Select Recipients. Insert merge fields («Name», «Address»). Complete merge via 'Edit Individual Documents' or direct email dispatch through Outlook.")

#short-qa(num: 46, q: "What is the function of the Document Inspector in Word and PowerPoint?", ans: "Located under File > Info > Check for Issues > Inspect Document. Scans for and removes hidden personal metadata, revision comments, hidden slides, and off-canvas shapes before public release.")

#short-qa(num: 47, q: "How do you troubleshoot a broken Excel formula that returns an unexpected result without throwing an error?", ans: "Use the Evaluate Formula tool (Formulas > Evaluate Formula) to step through each nested calculation sequentially, observing how intermediate values resolve at each stage.")

#short-qa(num: 48, q: "What is the difference between Goal Seek and Solver in Excel?", ans: "Goal Seek adjusts a single input variable to achieve a specific target output. Solver is an optimization engine that adjusts multiple variables simultaneously subject to complex mathematical constraints.")

#short-qa(num: 49, q: "How do you configure Co-Authoring conflict resolution in Microsoft 365?", ans: "When conflicting edits occur simultaneously on the same cell, Excel flags the collision with an alert prompt, displaying both values side-by-side and prompting the user to pick which change to preserve.")

#short-qa(num: 50, q: "What are the core skill pillars of a top 1% corporate MIS professional in 2027?", ans: "1. Flawless keyboard speed. 2. Mastery of XLOOKUP, Dynamic Arrays, and Power Query ETL. 3. Relational Data Modeling and DAX. 4. Executive visual storytelling. 5. AI Copilot prompt engineering.")

#v(2pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/ppt-morph-rotate.png", width: 95%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 32.2: Advanced PowerPoint 365 Multi-Object Coordinate Morphing & 3D Spatial Transitions.
  ]
]

#pagebreak()

== 32.4 Founder's Message, Personal Well Wishes & Career Accelerator Bundle

#grid(
  columns: (1fr, 3.2fr),
  gutter: 12pt,
  [
    #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/02_BRAND_ASSETS/rahul-patel.jpg", width: 100%)
    #v(3pt)
    #align(center)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[Rahul Patel]\
      #text(size: 7pt, fill: rgb("#64748B"))[Founder & Chief Architect]\
      #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[RTechLab Digital]
    ]
  ],
  [
    #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[DEAR AMBITIOUS LEARNER & FUTURE CORPORATE LEADER,]
    #v(2pt)
    #text(size: 7.2pt, fill: rgb("#1E293B"))[
      When I founded RTechLab, our mission was simple yet uncompromising: *to build the highest-quality, research-verified, enterprise-grade technical educational resources in India.*

      This Microsoft Office 365 Master Guide was not assembled from surface-level tutorials. Every page, keyboard shortcut, formula specimen, and production lab was engineered from real-world corporate IT consulting, cloud enterprise deployments, and high-stakes executive boardroom experience.

      Mastering Word, Excel, and PowerPoint is not merely about learning menu buttons; it is about developing the cognitive discipline to transform raw, chaotic data into clear, persuasive executive intelligence. When you execute keyboard-driven modeling, build dynamic Power Query pipelines, and deliver cinematic Morph presentations, you command immediate respect in any corporate boardroom.

      My personal wish for you is boundless professional success, relentless curiosity, and the courage to master modern technologies like Copilot AI that are reshaping the global corporate landscape.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1.5pt + rgb("#0284C7"),
  radius: 6pt,
  fill: rgb("#F0F9FF"),
  inset: (x: 10pt, y: 7pt),
  [
    #align(center)[
      #text(size: 9.5pt, weight: "bold", fill: rgb("#0369A1"))[🚀 THE RTECHLAB ₹149 CAREER ACCELERATOR BUNDLE 🚀]\
      #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[Complete 4-in-1 Master Toolkit · Instant Lifetime Cloud Access · No Hidden Fees]
    ]
    #v(3pt)
    #text(size: 7pt, fill: rgb("#1E293B"))[
      If you acquired this core guide as part of the *₹149 Career Accelerator Bundle*, congratulations! You hold the complete enterprise toolkit designed to take you from beginner to top-tier MIS analyst. Your package includes:
    ]
    #v(2pt)
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #text(size: 6.8pt)[
          *✓ 1. The 112-Page Master Publication*\
          Full dual-language (English & Hindi) Word, Excel, PPT, Copilot & Cloud Master Guide.

          *✓ 2. Standalone Practical Excel Templates*\
          Pre-built commercial workbooks: Loan EMI Amortization, Dynamic Inventory, and HR Payroll.
        ]
      ],
      [
        #text(size: 6.8pt)[
          *✓ 3. Top 100 Shortcuts & MIS Vault PDF*\
          Standalone high-resolution printable cheat sheets for rapid desktop desk reference.

          *✓ 4. Lifetime Updates & Discord Community*\
          Free access to all 2027 quarterly updates and direct technical Q&A with Rahul Sir.
        ]
      ]
    )
    #v(3pt)
    #align(center)[
      #text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[
        Visit #text(fill: rgb("#0284C7"))[https://rtechlab.in] · Email: #text(fill: rgb("#0284C7"))[support\@rtechlab.in] · WhatsApp: +91 91095 86284
      ]
    ]
  ]
)

#v(4pt)

== Official RTechLab Verification Checklist for Students
#table(
  columns: (1fr, 2.5fr, 1.2fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Module*], [*Core Technical Deliverable Verified*], [*Status*], [*Accreditation*]),
  [Word 365], [10 Chapters + 5 Corporate Production Labs Completed], [Verified 100%], [RTechLab Certified],
  [Excel 365], [12 Chapters + 5 Enterprise Analytics Labs Built], [Verified 100%], [RTechLab Certified],
  [PowerPoint], [6 Chapters + 3 Investor Pitch Decks Delivered], [Verified 100%], [RTechLab Certified],
  [Cloud & AI], [OneDrive Delta Sync & Copilot Prompt Engineering], [Verified 100%], [RTechLab Certified]
)
"""

    with open(os.path.join(eng_dir, "chapter-31.typ"), "w", encoding="utf-8") as f:
        f.write(en_ch31)
    with open(os.path.join(eng_dir, "chapter-32.typ"), "w", encoding="utf-8") as f:
        f.write(en_ch32)
    print("✓ English chapters 31 & 32 updated with real software UI screenshots and dense formatting.")

    # =========================================================================
    # 3. HINDI CHAPTER 31
    # =========================================================================
    hi_ch31 = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Nirmala UI", weight: "bold", fill: rgb("#0284C7"))[भाग 4: क्लाउड इकोसिस्टम, कोपायलट AI एवं इंटरव्यू वॉल्ट · अध्याय 31]
= शीर्ष 100 कॉर्पोरेट कीबोर्ड शॉर्टकट्स मास्टर संदर्भ वॉल्ट

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  काम करते समय बार-बार माउस पकड़ने से सोचने का प्रवाह टूटता है और प्रति वर्ष सैकड़ों घंटे बर्बाद होते हैं। वर्ड, एक्सेल, पावरपॉइंट तथा क्लाउड इकोसिस्टम के शीर्ष 100 शॉर्टकट्स में महारत हासिल करें और बिना माउस छुए बिजली जैसी गति से काम करना सीखें।
]

#v(2pt)

== 31.1 माइक्रोसॉफ्ट वर्ड 365: नेविगेशन, फॉर्मेटिंग एवं संरचना शॉर्टकट्स (1-25)

#table(
  columns: (1.2fr, 0.9fr, 2.9fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.1pt),
  table.header([*शॉर्टकट कुंजी*], [*कार्यक्षेत्र*], [*परिचालन क्रिया एवं परिणाम*]),
  [`Ctrl + Enter`], [संरचना], [कर्सर के स्थान पर तुरंत नया हार्ड पेज ब्रेक लगाता है।],
  [`Ctrl + Shift + Enter`], [संरचना], [सक्रिय पंक्ति के ठीक ऊपर से तालिका को दो हिस्सों में बांटता है।],
  [`Alt + Shift + D`], [फील्ड कोड], [स्वतः अपडेट होने वाला दिनांक कोड {DATE} जोड़ता है।],
  [`Alt + Shift + P`], [फील्ड कोड], [स्वतः अपडेट होने वाली पृष्ठ संख्या {PAGE} जोड़ता है।],
  [`Ctrl + Shift + C`], [फॉर्मेटिंग], [टेक्स्ट की संपूर्ण फॉर्मेटिंग कॉपी करता है (Format Painter)।],
  [`Ctrl + Shift + V`], [फॉर्मेटिंग], [कॉपी की गई फॉर्मेटिंग को चुने हुए टेक्स्ट पर लागू करता है।],
  [`Ctrl + Shift + N`], [स्टाइल्स], [चुने हुए पैराग्राफ को पुनः साधारण Normal स्टाइल में बदलता है।],
  [`Alt + Ctrl + 1`], [स्टाइल्स], [पैराग्राफ पर सीधे Heading 1 स्टाइल लागू करता है।],
  [`Alt + Ctrl + 2`], [स्टाइल्स], [पैराग्राफ पर सीधे Heading 2 स्टाइल लागू करता है।],
  [`Alt + Ctrl + 3`], [स्टाइल्स], [पैराग्राफ पर सीधे Heading 3 स्टाइल लागू करता है।],
  [`Shift + F3`], [टाइपोग्राफी], [केस बदलता है: Sentence case > UPPERCASE > lowercase।],
  [`Ctrl + Shift + A`], [टाइपोग्राफी], [चुने हुए अक्षरों को वास्तविक ALL CAPS में बदलता है।],
  [`Ctrl + Shift + K`], [टाइपोग्राफी], [चुने हुए अक्षरों को Small Caps प्रारूप में बदलता है।],
  [`Ctrl + Spacebar`], [फॉर्मेटिंग], [फॉन्ट पर की गई सभी अतिरिक्त फॉर्मेटिंग हटाकर मूल स्टाइल लाता है।],
  [`Ctrl + Q`], [फॉर्मेटिंग], [पैराग्राफ मार्जिन व लाइन स्पेसिंग हटाकर डिफ़ॉल्ट करता है।],
  [`Ctrl + Shift + >`], [टाइपोग्राफी], [फॉन्ट साइज को एक कदम बड़ा करता है।],
  [`Ctrl + Shift + <`], [टाइपोग्राफी], [फॉन्ट साइज को एक कदम छोटा करता है।],
  [`Ctrl + Shift + 8 (*)`], [व्यू], [छिपे हुए फॉर्मेटिंग सिंबल्स (Pilcrow, Space, Tab) दिखाता है।],
  [`Alt + Shift + ↑`], [पैराग्राफ], [सक्रिय पैराग्राफ या तालिका पंक्ति को ऊपर खिसकाता है।],
  [`Alt + Shift + ↓`], [पैराग्राफ], [सक्रिय पैराग्राफ या तालिका पंक्ति को नीचे खिसकाता है।],
  [`Ctrl + K`], [नेविगेशन], [वेबसाइट लिंक या बुकमार्क हेतु हाइपरलिंक बॉक्स खोलता है।],
  [`Ctrl + F`], [नेविगेशन], [शीर्षकों की सूची सहित नेविगेशन पेन खोलता है।],
  [`Ctrl + H`], [संपादन], [फाइंड एंड रिप्लेस (खोजें व बदलें) डायलॉग बॉक्स खोलता है।],
  [`F4`], [उत्पादकता], [किए गए अंतिम कार्य या फॉर्मेटिंग को दोबारा दोहराता है।],
  [`F7`], [प्रूफिंग], [माइक्रोसॉफ्ट एडिटर द्वारा स्पेलिंग व व्याकरण जांच शुरू करता है।]
)

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/word-365-full-workspace.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    चित्र 31.1: ऑफिशियल माइक्रोसॉफ्ट वर्ड 365 इंटरफ़ेस: रिबन संरचना, हेडिंग स्टाइल्स पदानुक्रम एवं नेविगेशन पेन।
  ]
]

#pagebreak()

== 31.2 माइक्रोसॉफ्ट एक्सेल 365: नेविगेशन, चयन एवं डेटा एंट्री शॉर्टकट्स (26-55)

#table(
  columns: (1.2fr, 0.9fr, 2.9fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 1.8pt),
  table.header([*शॉर्टकट कुंजी*], [*कार्यक्षेत्र*], [*परिचालन क्रिया एवं परिणाम*]),
  [`F4`], [फॉर्मूला], [सेल संदर्भ बदलता है ($A$1 > A$1 > $A1 > A1)।],
  [`Alt + =`], [फॉर्मूला], [रेंज पहचानकर स्वतः =SUM(...) फॉर्मूला लगाता है (AutoSum)।],
  [`Ctrl + ~ (Grave)`], [ऑडिटिंग], [मानों के स्थान पर शीट के सभी फॉर्मूले प्रदर्शित करता है।],
  [`Ctrl + [`], [ऑडिटिंग], [सक्रिय फॉर्मूले में उपयोग किए गए मूल सेल्स को चुनता है।],
  [`Ctrl + ]`], [ऑडिटिंग], [इस सेल पर निर्भर अन्य सभी फॉर्मूला सेल्स को चुनता है।],
  [`Ctrl + T`], [डेटा टेबल], [साधारण डेटा रेंज को संरचित एक्सेल टेबल में बदलता है।],
  [`Ctrl + Shift + L`], [फिल्टरिंग], [शीर्षक पर ऑटो-फिल्टर ड्रॉपडाउन तीर चालू या बंद करता है।],
  [`Alt + ↓`], [फिल्टरिंग], [सक्रिय शीर्षक सेल पर फिल्टर ड्रॉपडाउन मेनू खोलता है।],
  [`Ctrl + Spacebar`], [चयन], [पूरी सक्रिय कॉलम (स्तंभ) को ऊपर से नीचे तक चुनता है।],
  [`Shift + Spacebar`], [चयन], [पूरी सक्रिय रो (पंक्ति) को बाएं से दाएं तक चुनता है।],
  [`Ctrl + Shift + Plus`], [ग्रिड संपादन], [नया सेल, पंक्ति या स्तंभ जोड़ता है।],
  [`Ctrl + Minus`], [ग्रिड संपादन], [चुने हुए सेल, पंक्ति या स्तंभ को डिलीट करता है।],
  [`Ctrl + D`], [डेटा एंट्री], [ऊपर वाले सेल का मान या फॉर्मूला नीचे भरता है (Fill Down)।],
  [`Ctrl + R`], [डेटा एंट्री], [बाएं वाले सेल का मान या फॉर्मूला दाएं भरता है (Fill Right)।],
  [`Ctrl + E`], [AI बुद्धि], [पैटर्न पहचानकर स्वतः डेटा भरता है (Flash Fill)।],
  [`Alt + Enter`], [डेटा एंट्री], [एक ही सेल के भीतर नई लाइन (Line Break) बनाता है।],
  [`Ctrl + ; (सेमीकोलन)`], [डेटा एंट्री], [आज की स्थिर दिनांक दर्ज करता है।],
  [`Ctrl + Shift + :`], [डेटा एंट्री], [वर्तमान स्थिर समय दर्ज करता है।],
  [`Ctrl + 1`], [फॉर्मेटिंग], [फॉर्मेट सेल्स (Format Cells) डायलॉग बॉक्स खोलता है।],
  [`Ctrl + Shift + 1 (!)`], [फॉर्मेटिंग], [दशमलव व कॉमा सहित संख्या प्रारूप (Number) लगाता है।],
  [`Ctrl + Shift + 4 ($)`], [फॉर्मेटिंग], [करेंसी प्रारूप (Currency) लागू करता है।],
  [`Ctrl + Shift + 5 (%)`], [फॉर्मेटिंग], [प्रतिशत प्रारूप (Percentage) लागू करता है।],
  [`Ctrl + A`], [चयन], [संपूर्ण डेटा तालिका को एक साथ चुनता है।],
  [`Ctrl + एरो कीज`], [नेविगेशन], [डेटा ब्लॉक के सबसे अंतिम छोर पर तुरंत छलांग लगाता है।],
  [`Ctrl + Shift + एरो`], [चयन], [डेटा ब्लॉक के छोर तक सभी सेल्स को चुनता है।],
  [`Ctrl + Page Down`], [नेविगेशन], [दाहिनी ओर स्थित अगली वर्कशीट टैब पर जाता है।],
  [`Ctrl + Page Up`], [नेविगेशन], [बाईं ओर स्थित पिछली वर्कशीट टैब पर जाता है।],
  [`Alt + H + O + I`], [रिबन फास्ट], [कॉलम की चौड़ाई को सबसे बड़े टेक्स्ट के अनुसार स्वतः सेट करता है।],
  [`Alt + H + M + C`], [रिबन फास्ट], [चुने हुए सेल्स को जोड़कर केंद्र में करता है (Merge & Center)।],
  [`F12`], [फाइल सिस्टम], [क्लाउड मेनू बाईपास करके सीधे Save As विंडो खोलता है।]
)

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-365-full-workspace.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    चित्र 31.2: ऑफिशियल माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज ग्रिड: डायनामिक XLOOKUP फॉर्मूला बार व कोपायलट AI एनालिटिक्स।
  ]
]

#pagebreak()

== 31.3 एक्सेल एडवांस्ड एवं पावरपॉइंट 365 शॉर्टकट्स (56-85)

#table(
  columns: (1.3fr, 0.9fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 1.8pt),
  table.header([*शॉर्टकट कुंजी*], [*कार्यक्षेत्र*], [*परिचालन क्रिया एवं परिणाम*]),
  [`Alt + E + S + V`], [पेस्ट स्पेशल], [केवल मान (Values) पेस्ट करता है, फॉर्मूला हटा देता है।],
  [`Alt + E + S + T`], [पेस्ट स्पेशल], [केवल फॉर्मेटिंग पेस्ट करता है, डेटा नहीं बदलता।],
  [`Alt + E + S + E`], [पेस्ट स्पेशल], [आड़ी पंक्ति को खड़ी कॉलम में बदलता है (Transpose)।],
  [`Alt + N + V + T`], [पिवट टेबल], [सक्रिय तालिका से पिवट टेबल बनाने का विज़ार्ड खोलता है।],
  [`Alt + F1`], [विजुअल चार्ट], [उसी शीट पर त्वरित कॉलम चार्ट बनाता है।],
  [`F11`], [विजुअल चार्ट], [नई अलग चार्ट शीट पर पूर्ण स्क्रीन चार्ट बनाता है।],
  [`Ctrl + F1`], [इंटरफेस], [ऑफिस रिबन मेनू को छुपाता या दिखाता है।],
  [`Ctrl + F3`], [नेम मैनेजर], [नेम्ड रेंजेस (Named Ranges) प्रबंधित करने का बॉक्स खोलता है।],
  [`F9`], [गणना], [खुली हुई सभी वर्कबुक्स के फॉर्मूलों की पुनः गणना करता है।],
  [`Shift + F9`], [गणना], [केवल वर्तमान सक्रिय शीट के फॉर्मूलों की गणना करता है।],
  [`Shift + F2`], [नोट्स], [सेल में पुराना क्लासिक कमेंट या नोट जोड़ता है।],
  [`Ctrl + Shift + F2`], [कमेंट्स], [आधुनिक थ्रेडेड सहयोगात्मक कमेंट पेन खोलता है।],
  [`Alt + N + K`], [सिंबल्स], [विशेष चिह्न व प्रतीक डालने की विंडो खोलता है।],
  [`Ctrl + Backspace`], [नेविगेशन], [चयन खोए बिना स्क्रीन को सक्रिय सेल पर वापस लाता है।],
  [`Shift + F11`], [शीट्स], [वर्कबुक में तुरंत एक नई खाली वर्कशीट जोड़ता है।],
  [`Ctrl + M`], [पावरपॉइंट], [समान लेआउट वाली नई खाली स्लाइड जोड़ता है।],
  [`Ctrl + D`], [पावरपॉइंट], [चुनी गई स्लाइड, कार्ड या आकृति की हूबहू प्रति बनाता है।],
  [`Ctrl + G`], [पावरपॉइंट], [कई आकृतियों को मिलाकर एक संयुक्त ग्रुप बनाता है।],
  [`Ctrl + Shift + G`], [पावरपॉइंट], [आकृतियों के ग्रुप को अलग-अलग टुकड़ों में खोलता है।],
  [`Shift + F9`], [पावरपॉइंट], [स्लाइड पर अलाइनमेंट ग्रिडलाइन्स दिखाता या छुपाता है।],
  [`Alt + F9`], [पावरपॉइंट], [स्लाइड के केंद्र में संदर्भ गाइड्स (Guides) दिखाता है।],
  [`Alt + F10`], [पावरपॉइंट], [ऑब्जेक्ट्स को नाम देने व क्रम बदलने हेतु Selection Pane खोलता है।],
  [`Ctrl + Shift + C`], [पावरपॉइंट], [आकृति का रंग, बॉर्डर व शैडो कॉपी करता है।],
  [`Ctrl + Shift + V`], [पावरपॉइंट], [कॉपी की गई स्टाइल को दूसरी आकृति पर लगाता है।],
  [`Shift + कोना खींचना`], [पावरपॉइंट], [आकृति को बिना टेढ़ा किए बिल्कुल समान अनुपात में बड़ा करता है।],
  [`Ctrl + कोना खींचना`], [पावरपॉइंट], [आकृति को केंद्र बिंदु से चारों तरफ समान फैलाता है।],
  [`Ctrl + Shift + रोटेट`], [पावरपॉइंट], [आकृति को ठीक 15-डिग्री के चरणों में घुमाता है।],
  [`Ctrl + K`], [पावरपॉइंट], [क्लिक करने योग्य लिंक या स्लाइड जंप बनाता है।],
  [`F5`], [पावरपॉइंट], [प्रस्तुति को पहली स्लाइड से शुरू करता है।],
  [`Shift + F5`], [पावरपॉइंट], [प्रस्तुति को वर्तमान सक्रिय स्लाइड से शुरू करता है।]
)

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/powerpoint-365-full-workspace.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    चित्र 31.3: ऑफिशियल माइक्रोसॉफ्ट पावरपॉइंट 365 इंटरफ़ेस: स्लाइड मास्टर, 6x6 लेआउट नियम एवं मॉर्फ ट्रांजिशन।
  ]
]

#pagebreak()

== 31.4 पावरपॉइंट डिलीवरी एवं क्लाउड इकोसिस्टम शॉर्टकट्स (86-100)

#table(
  columns: (1.3fr, 0.9fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*शॉर्टकट कुंजी*], [*कार्यक्षेत्र*], [*परिचालन क्रिया एवं परिणाम*]),
  [`Alt + F5`], [प्रेजेंटर व्यू], [प्राथमिक स्क्रीन पर प्रेजेंटर व्यू डिलीवरी मोड खोलता है।],
  [`B (शो के दौरान)`], [लाइव शो], [स्क्रीन को तुरंत काला कर देता है ताकि लोग वक्ता को सुनें।],
  [`W (शो के दौरान)`], [लाइव शो], [स्क्रीन को तुरंत सफेद कर देता है।],
  [`Ctrl + L`], [लाइव शो], [कर्सर को लाल डिजिटल लेजर पॉइंटर में बदलता है।],
  [`Ctrl + P`], [लाइव शो], [स्क्रीन पर लिखने हेतु डिजिटल पेन चालू करता है।],
  [`Ctrl + A`], [लाइव शो], [पेन को बंद करके वापस सामान्य तीर कर्सर लाता है।],
  [`Ctrl + E`], [लाइव शो], [स्क्रीन पर लिखी गई स्याही को मिटाने वाला इरेज़र लाता है।],
  [`E (शो के दौरान)`], [लाइव शो], [स्क्रीन पर की गई सभी लाइव ड्राइंग्स को एक साथ मिटाता है।],
  [`नंबर + Enter`], [लाइव शो], [सीधे उस नंबर की स्लाइड पर कूदता है (जैसे 1 + 8 + Enter)।],
  [`Ctrl + S`], [क्लाउड फाइल], [क्लाउड पर त्वरित बैकग्राउंड डेल्टा सेव निष्पादित करता है।],
  [`Alt + Q`], [सर्च / AI], [‘Tell Me’ / Copilot सार्वभौमिक सर्च बॉक्स खोलता है।],
  [`Ctrl + Alt + Space`], [सुलभता], [इमर्सिव रीडर द्वारा पाठ को बोलकर सुनाने की सुविधा चलाता है।],
  [`Win + Shift + S`], [स्क्रीन क्लिप], [स्क्रीनशॉट लेने हेतु विंडोज स्निपिंग टूल सक्रिय करता है।],
  [`Ctrl + Z`], [अंडू इंजन], [किए गए अंतिम कार्य को वापस निरस्त करता है।],
  [`Ctrl + Y`], [रीडू इंजन], [निरस्त किए गए कार्य को दोबारा लागू करता है।]
)

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/office-visual-refresh.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    चित्र 31.4: माइक्रोसॉफ्ट 365 विजुअल रिफ्रेश इंटरफेस: एकीकृत रिबन, क्लाउड सह-लेखन एवं मल्टी-विंडो तुल्यकालन।
  ]
]

#v(3pt)

#spotlight-box("14-दिवसीय कीबोर्ड मास्टरी चुनौती", [
  प्रतिदिन सुबह 2 घंटे के लिए अपने माउस को अलग रख दें। Alt-की त्वरित अनुक्रमों (`Alt > H > O > I`, `Alt > E > S > V`) द्वारा तालिकाओं व रिपोर्ट्स को नेविगेट करने से उंगलियों में स्थायी मसल मेमोरी विकसित होती है। बिना माउस छुए केवल कीबोर्ड से काम करने वाले कॉर्पोरेट विश्लेषक सामान्य कर्मचारियों से 3.5 गुना तेजी से काम पूरा करते हैं।
])
"""

    # =========================================================================
    # 4. HINDI CHAPTER 32
    # =========================================================================
    hi_ch32 = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Nirmala UI", weight: "bold", fill: rgb("#0284C7"))[भाग 4: क्लाउड इकोसिस्टम, कोपायलट AI एवं इंटरव्यू वॉल्ट · अध्याय 32]
= शीर्ष 50 MIS इंटरव्यू वॉल्ट, लेखक संदेश एवं करियर एक्सेलरेटर बंडल

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  वरिष्ठ मैनेजमेंट इंफॉर्मेशन सिस्टम (MIS) अधिकारियों एवं कॉर्पोरेट विश्लेषकों को बेहद कठिन तकनीकी साक्षात्कारों का सामना करना पड़ता है। यह अध्याय कॉर्पोरेट स्तर के शीर्ष 50 साक्षात्कारों के प्रश्न-उत्तर, संस्थापक राहुल पटेल का समापन संदेश तथा ₹149 करियर बंडल का विवरण प्रस्तुत करता है।
]

#v(2pt)

== 32.1 प्रश्न 01 - 15: कोर ऑफिस 365 संरचना एवं डेटा मॉडलिंग

#short-qa(num: 1, q: "VLOOKUP तथा XLOOKUP के बीच मुख्य तकनीकी अंतर क्या है?", ans: "VLOOKUP केवल बाएं से दाएं देखता है, नई कॉलम जोड़ने पर टूट जाता है, तथा डिफ़ॉल्ट रूप से अनुमानित खोज करता है। XLOOKUP दोनों दिशाओं में खोजता है, सुरक्षित रहता है, सटीक मिलान करता है, तथा खाली डेटा को स्वतः संभालता है।")

#short-qa(num: 2, q: "आधुनिक एक्सेल में स्पिल (Spill) तंत्र तथा #SPILL! त्रुटि क्या है?", ans: "डायनामिक एरे फॉर्मूले स्वतः पास के खाली सेल्स में फैल जाते हैं। यदि इस फैलाव क्षेत्र के बीच में कोई भी रुकावट (डेटा, मर्ज सेल) आ जाए, तो एक्सेल रुक जाता है और #SPILL! त्रुटि प्रदर्शित करता है।")

#short-qa(num: 3, q: "=COUNT, =COUNTA तथा =COUNTBLANK के बीच क्या अंतर है?", ans: "=COUNT केवल संख्या वाले सेल्स गिनता है। =COUNTA सभी भरे हुए सेल्स (संख्या, टेक्स्ट, त्रुटि) गिनता है। =COUNTBLANK केवल पूरी तरह खाली सेल्स की गणना करता है।")

#short-qa(num: 4, q: "पुराने सिस्टम्स में VLOOKUP के स्थान पर INDEX/MATCH क्यों चुनना चाहिए?", ans: "INDEX/MATCH स्वतंत्र कॉलम रेंजेस का उपयोग करता है, कंप्यूटर की मेमोरी बहुत कम खर्च करता है, बाईं ओर की खोज कर सकता है, तथा नई कॉलम जोड़ने पर कभी नहीं टूटता।")

#short-qa(num: 5, q: "पावर क्वेरी (Power Query) मासिक ETL डेटा रिफ्रेश को कैसे स्वचालित करती है?", ans: "पावर क्वेरी डेटा लोड और सफाई के सभी चरणों को M भाषा में रिकॉर्ड कर लेती है। जब भी नया डेटा आता है, 'Refresh All' दबाते ही सारे चरण सेकंडों में स्वतः दोबारा निष्पादित हो जाते हैं।")

#short-qa(num: 6, q: "पिवट कैश (Pivot Cache) क्या है और यह फाइल के आकार को कैसे प्रभावित करता है?", ans: "पिवट टेबल बनाते समय एक्सेल मूल डेटा का एक आंतरिक स्नैपशॉट मेमोरी में सुरक्षित रखता है जिसे पिवट कैश कहते हैं। कई टेबल्स एक ही कैश साझा करें तो फाइल हल्की रहती है, अलग-अलग कैश बनाने से फाइल भारी हो जाती है।")

#short-qa(num: 7, q: "पिवट टेबल में Calculated Field और Calculated Item में क्या अंतर है?", ans: "Calculated Field मौजूदा फील्ड्स पर गणना करके नई कॉलम बनाता है (जैसे =Sales * 18%)। Calculated Item किसी एक फील्ड के अलग-अलग मदों के बीच गणित करके नई पंक्ति बनाता है।")

#short-qa(num: 8, q: "लंबे वर्ड डॉक्यूमेंट में स्टाइल्स (Styles) की क्या भूमिका होती है?", ans: "Heading 1-9 स्टाइल्स दस्तावेज में पदानुक्रम बनाती हैं। इन्हीं के आधार पर स्वचालित अनुक्रमणिका (TOC), नेविगेशन ट्री तथा एक क्लिक में पूरे दस्तावेज का फॉन्ट बदलना संभव होता है।")

#short-qa(num: 9, q: "वर्ड में Section Break (Next Page) और Page Break में क्या अंतर है?", ans: "Page Break केवल टेक्स्ट को अगले पेज पर भेजता है। Section Break स्वतंत्र भाग बनाता है, जिससे अलग हेडर/फुटर, नए सिरे से पेज नंबर तथा लैंडस्केप/पोर्ट्रेट लेआउट संभव होता है।")

#short-qa(num: 10, q: "मेल मर्ज में संख्यात्मक फॉर्मेटिंग (जैसे ₹50000 का 50000.0000001 दिखना) कैसे ठीक करें?", ans: "Alt + F9 दबाकर फील्ड कोड खोलें और पिक्चर स्विच जोड़ें: { MERGEFIELD Salary \\# \"#,##,##0.00\" }।")

#short-qa(num: 11, q: "पावरपॉइंट में पैरेंट स्लाइड मास्टर और चाइल्ड लेआउट में क्या अंतर है?", ans: "पैरेंट मास्टर का फॉन्ट, रंग व लोगो सभी स्लाइड्स पर लागू होता है। चाइल्ड लेआउट केवल उसी खास लेआउट वाली स्लाइड्स पर लागू होता है।")

#short-qa(num: 12, q: "मॉर्फ (Morph) ट्रांजिशन सामान्य एनिमेशन से कैसे भिन्न है?", ans: "सामान्य एनिमेशन में हाथ से पाथ बनाना पड़ता है। मॉर्फ दो अलग स्लाइड्स के बीच वस्तुओं के स्थान व आकार के अंतर को स्वतः मापकर 60fps की सहज गति प्रदान करता है।")

#short-qa(num: 13, q: "पावरपॉइंट मॉर्फ में दो बार विस्मयादिबोधक (!!) का क्या उपयोग है?", ans: "सिलेक्शन पेन में नाम के आगे !! (जैसे !!HeroShape) लगाने से दो बिल्कुल भिन्न आकृतियां भी आपस में एक-दूसरे में मॉर्फ हो जाती हैं।")

#short-qa(num: 14, q: "वनड्राइव का डिफरेंशियल डेल्टा सिंक नेटवर्क को कैसे गति प्रदान करता है?", ans: "पूरी फाइल दोबारा अपलोड करने के बजाय यह केवल बदले हुए कुछ बाइट्स अपलोड करता है, जिससे इंटरनेट डेटा खपत में 95% से अधिक कमी आती है।")

#short-qa(num: 15, q: "ऑफिस 365 फाइल शेयर करते समय 'Block Download' चुनने से क्या होता है?", ans: "प्राप्तकर्ता केवल वेब ब्राउज़र में फाइल पढ़ सकता है; फाइल को डाउनलोड करना, प्रिंट करना या टेक्स्ट कॉपी करना पूरी तरह ब्लॉक रहता है।")

#v(2pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-pivottable-sample.png", width: 95%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    चित्र 32.1: एंटरप्राइज पिवट टेबल डेटा स्रोत एवं प्रसामान्यीकृत सारणीबद्ध रेंज नमूना।
  ]
]

#pagebreak()

== 32.2 प्रश्न 16 - 35: उन्नत मॉडलिंग, क्लाउड सह-लेखन एवं स्वचालन

#short-qa(num: 16, q: "एक्सेल 365 में LAMBDA फंक्शन का सिंटैक्स व उपयोग क्या है?", ans: "सिंटैक्स: =LAMBDA(param1, param2, ..., calculation)। यह बिना कोई VBA मैक्रो कोड लिखे सीधे एक्सेल में अपना कस्टम फंक्शन बनाने और उसे नाम देने की सुविधा देता है।")

#short-qa(num: 17, q: "जटिल मॉडल्स में =LET फंक्शन गणना को कैसे गति देता है?", ans: "सिंटैक्स: =LET(name1, val1, calculation)। यह फॉर्मूले के भीतर ही गणना के परिणाम को नाम दे देता है, जिससे एक्सेल को एक ही गणना बार-बार नहीं करनी पड़ती।")

#short-qa(num: 18, q: "=TEXTJOIN तथा =CONCATENATE के बीच क्या अंतर है?", ans: "=CONCATENATE में हर सेल के बीच कॉमा हाथ से लगाना पड़ता है। =TEXTJOIN पूरी रेंज स्वीकार करता है, एक ही विभाजक (जैसे \"; \") लगाता है, तथा खाली सेल्स को स्वतः छोड़ देता है।")

#short-qa(num: 19, q: "=NETWORKDAYS.INTL गैर-मानक कार्यदिवसों को कैसे संभालता है?", ans: "इसमें [weekend] पैरामीटर होता है जहां कस्टम बाइनरी कोड (जैसे शुक्रवार/शनिवार सप्ताहांत हेतु \"0000011\") और छुट्टियों की सूची दी जा सकती है।")

#short-qa(num: 20, q: "=STDEV.S और =STDEV.P में क्या अंतर है?", ans: "=STDEV.S सीमित नमूने (Sample) हेतु है (N - 1 से भाग देता है)। =STDEV.P संपूर्ण जनसंख्या (Population) हेतु है। सीमित सैंपल पर .P लगाने से जोखिम का गलत अनुमान निकलता है।")

#short-qa(num: 21, q: "=NPV फॉर्मूले में प्रारंभिक निवेश (Year 0) बाहर क्यों जोड़ना चाहिए?", ans: "=NPV पहले मान को पहले वर्ष के अंत में आया मानता है। Year 0 को अंदर रखने से प्रारंभिक निवेश पर भी 1 वर्ष का अनुचित डिस्काउंट लग जाता है।")

#short-qa(num: 22, q: "PMT, IPMT तथा PPMT के मध्य क्या गणितीय संबंध है?", ans: "किसी भी किस्त में PMT = IPMT + PPMT होता है। IPMT केवल ब्याज का हिस्सा बताता है, जबकि PPMT केवल मूलधन का हिस्सा बताता है।")

#short-qa(num: 23, q: "पावर क्वेरी में डेटा अनपिवट (Unpivot) करना क्यों अनिवार्य है?", ans: "कॉलम चुनकर 'Unpivot Other Columns' करने से चौड़ी रिपोर्ट 3-कॉलम के सामान्य रूप (Key, Attribute, Value) में बदल जाती है जो पिवट टेबल हेतु अनिवार्य है।")

#short-qa(num: 24, q: "पुराने Shared Workbook और आधुनिक Co-Authoring में क्या अंतर है?", ans: "पुरानी शेयर्ड वर्कबुक्स अक्सर करप्ट हो जाती थीं और टेबल्स बंद कर देती थीं। आधुनिक सह-लेखन क्लाउड स्ट्रीमिंग द्वारा बिना किसी रुकावट के लाइव मल्टी-यूजर काम करने देता है।")

#short-qa(num: 25, q: "Trace Precedents और Trace Dependents से फॉर्मूला ऑडिट कैसे करते हैं?", ans: "Trace Precedents नीले तीर बनाकर दिखाता है कि फॉर्मूला किन सेल्स से डेटा ले रहा है। Trace Dependents दिखाता है कि इस सेल का डेटा आगे किन फॉर्मूलों में जा रहा है।")

#short-qa(num: 26, q: "सर्कुलर रेफरेंस (Circular Reference) क्या है और इसे कैसे ठीक करें?", ans: "जब कोई फॉर्मूला प्रत्यक्ष या अप्रत्यक्ष रूप से अपने ही सेल का हवाला दे दे। इसे Formulas > Error Checking > Circular References में जाकर फॉर्मूले का चक्र तोड़कर ठीक करते हैं।")

#short-qa(num: 27, q: "डैशबोर्ड में स्लाइसर (Slicers) और टाइमलाइन (Timelines) में क्या अंतर है?", ans: "स्लाइसर टेक्स्ट श्रेणियों (जैसे क्षेत्र, उत्पाद) को फिल्टर करते हैं। टाइमलाइन केवल दिनांक वाले सेल्स को साल, तिमाही, महीने या दिन के अनुसार फिल्टर करती है।")

#short-qa(num: 28, q: "फॉर्मूला सेल्स को सुरक्षित रखते हुए बाकी सेल्स में डेटा एंट्री कैसे चालू रखें?", ans: "डेटा एंट्री वाले सेल्स चुनकर Format Cells > Protection में 'Locked' टिक हटाएं। फिर Review > Protect Sheet चालू करें। केवल अनलॉक्ड सेल्स में संपादन संभव रहेगा।")

#short-qa(num: 29, q: "माइक्रोसॉफ्ट कोपायलट ग्राउंडिंग (Grounding) क्या है और यह गलतियों से कैसे बचाती है?", ans: "ग्राउंडिंग यूजर की अनुमतियों के आधार पर माइक्रोसॉफ्ट ग्राफ से संबंधित ईमेल और फाइलों को निकालकर प्रॉम्प्ट के साथ जोड़ती है ताकि AI सही कंपनी डेटा पर उत्तर दे।")

#short-qa(num: 30, q: "VBA मैक्रोज़ और ऑफिस स्क्रिप्ट्स (Office Scripts) में क्या अंतर है?", ans: "VBA केवल डेस्कटॉप पर चलने वाली पुरानी भाषा है। ऑफिस स्क्रिप्ट्स आधुनिक TypeScript पर आधारित हैं, क्लाउड/मोबाइल/मैक पर चलती हैं, तथा Power Automate से जुड़ती हैं।")

#short-qa(num: 31, q: "पावरपॉइंट 365 में इंटरएक्टिव क्विज कैसे बनाई जाती है?", ans: "उत्तर के आधार पर एक्शन बटन या हाइपरलिंक लगाकर सही/गलत वाली स्लाइड पर भेजें, और ट्रांजिशन में 'Advance On Click' बंद रखें ताकि बिना बटन दबाए स्लाइड न बदले।")

#short-qa(num: 32, q: "सिलेक्शन पेन (Alt + F10) का मुख्य कार्य क्या है?", ans: "यह आकृतियों का क्रम बदलने, नाम बदलने, संपादन के दौरान उन्हें छुपाने/दिखाने, तथा मॉर्फ हेतु समान नाम (!!) सेट करने की सुविधा देता है।")

#short-qa(num: 33, q: "समरी ज़ूम (Summary Zoom) फीचर का क्या लाभ है?", ans: "यह एक मुख्य डैशबोर्ड बनाता है जिसमें सभी सेक्शन्स के लाइव थंबनेल होते हैं। क्लिक करते ही उस भाग में ज़ूम-इन होता है और समाप्त होते ही वापस ओवरव्यू पर लौट आता है।")

#short-qa(num: 34, q: "वित्तीय फॉर्मूलों (जैसे =IRR) में #NUM! त्रुटि क्यों आती है?", ans: "जब एक्सेल 20 प्रयासों के भीतर प्रतिफल दर निकालने में असफल हो जाए, अथवा कैश फ्लो श्रृंखला में कम से कम एक नकारात्मक और एक सकारात्मक मान न हो।")

#short-qa(num: 35, q: "प्रस्तुति को .pptx के स्थान पर .ppsx के रूप में सेव करने का क्या लाभ है?", ans: ".pptx फाइल एडिट मोड में खुलती है। .ppsx (PowerPoint Show) पर डबल-क्लिक करते ही वह सीधे फुल-स्क्रीन स्लाइड शो में खुलती है, एडिटिंग स्क्रीन नहीं दिखती।")

#pagebreak()

== 32.3 प्रश्न 36 - 50: एंटरप्राइज रणनीति, सुरक्षा एवं उन्नत MIS एनालिटिक्स

#short-qa(num: 36, q: "बिना VLOOKUP लगाए कई तालिकाओं का रिलेशनल मॉडल कैसे बनाएं?", ans: "सभी तालिकाओं को एक्सेल डेटा मॉडल (Power Pivot) में लोड करें। Diagram View में प्राइमरी की और फॉरेन की के बीच 1-to-Many संबंध बनाएं और सीधे पिवट टेबल बनाएं।")

#short-qa(num: 37, q: "DAX क्या है और यह सामान्य एक्सेल फॉर्मूलों से कैसे अलग है?", ans: "Data Analysis Expressions (DAX) डेटा मॉडल में टेबल और फिल्टर संदर्भों पर काम करता है (जैसे =CALCULATE(SUM(Sales), Region=\"North\")), जो लाखों पंक्तियों का तीव्र विश्लेषण करता है।")

#short-qa(num: 38, q: "पावर पिवट में Implicit और Explicit मेजर्स में क्या अंतर है?", ans: "Implicit मेजर्स फील्ड को सीधे Values में खींचने पर स्वतः बनते हैं। Explicit मेजर्स DAX कोड द्वारा बनाए गए औपचारिक सूत्र होते हैं जो अधिक तेज और पुनः प्रयोज्य होते हैं।")

#short-qa(num: 39, q: "संवेदनशीलता लेबल्स (Sensitivity Labels) कंपनी के डेटा की रक्षा कैसे करते हैं?", ans: "माइक्रोसॉफ्ट परव्यू द्वारा प्रबंधित ये लेबल्स फाइलों पर हार्डवेयर-स्तरीय राइट्स मैनेजमेंट एन्क्रिप्शन लगाते हैं जो फाइल को बाहर ईमेल करने पर भी सुरक्षित रखता है।")

#short-qa(num: 40, q: "टेक्स्ट के रूप में स्टोर संख्याओं पर गणित करने से आने वाली #VALUE! त्रुटि कैसे हटाएं?", ans: "सेल को =VALUE() फॉर्मूले में लपेटें या 1 से गुणा करें (जैसे =A1 * 1), जिससे एक्सेल टेक्स्ट को वास्तविक संख्या में बदल देता है।")

#short-qa(num: 41, q: "6x6 प्रेजेंटेशन नियम क्या है और इसे क्यों लागू किया जाता है?", ans: "प्रति स्लाइड अधिकतम 6 बुलेट पॉइंट्स और प्रति बुलेट अधिकतम 6 शब्द। यह दर्शकों को लंबे टेक्स्ट में उलझने से बचाकर वक्ता की बात पर ध्यान केंद्रित रखता है।")

#short-qa(num: 42, q: "एक्सेल चार्ट को पावरपॉइंट में कैसे जोड़ें ताकि एक्सेल बदलने पर स्लाइड भी स्वतः अपडेट हो?", ans: "एक्सेल चार्ट कॉपी करें। पावरपॉइंट में जाकर Paste Special > Paste Link > Microsoft Excel Chart Object चुनें। एक्सेल बदलते ही स्लाइड स्वतः अपडेट होगी।")

#short-qa(num: 43, q: "=INDIRECT फंक्शन का कार्य तथा इसका मुख्य जोखिम क्या है?", ans: "=INDIRECT टेक्स्ट को सक्रिय सेल संदर्भ में बदलता है (जैसे =INDIRECT(\"B\" & 5))। जोखिम: यह वोलेटाइल फंक्शन है जो हर क्लिक पर दोबारा चलता है और फाइल को धीमा कर देता है।")

#short-qa(num: 44, q: "डायनामिक एरे में =CHOOSECOLS और =CHOOSEROWS में क्या अंतर है?", ans: "=CHOOSECOLS किसी तालिका से चुनी हुई विशिष्ट कॉलम संख्या निकालता है। =CHOOSEROWS विशिष्ट पंक्तियां निकालता है। इससे जटिल गणनाएं समाप्त हो जाती हैं।")

#short-qa(num: 45, q: "वर्ड मेल मर्ज द्वारा 1,000 ग्राहकों के व्यक्तिगत पत्र कैसे बनाएं?", ans: "Mailings > Select Recipients में जाकर एक्सेल शीट जोड़ें। मर्ज फील्ड्स («Name», «Address») डालें और 'Finish & Merge' द्वारा एक साथ प्रिंट या आउटलुक से ईमेल करें।")

#short-qa(num: 46, q: "डॉक्यूमेंट इंस्पेक्टर (Document Inspector) का क्या कार्य है?", ans: "File > Info > Check for Issues > Inspect Document में जाकर फाइल को बाहर भेजने से पहले उसमें छिपे हुए व्यक्तिगत डेटा, लेखक का नाम तथा गोपनीय टिप्पणियां हटाई जाती हैं।")

#short-qa(num: 47, q: "गलत परिणाम देने वाले फॉर्मूले की जांच (Troubleshoot) कैसे करें?", ans: "Formulas > Evaluate Formula टूल का उपयोग करें। यह फॉर्मूले के प्रत्येक चरण की गणना को क्रमबद्ध तरीके से चलाकर दिखाता है कि गलती कहां हो रही है।")

#short-qa(num: 48, q: "एक्सेल में Goal Seek और Solver में क्या अंतर है?", ans: "Goal Seek मनचाहा परिणाम पाने हेतु केवल 1 इनपुट सेल को बदलता है। Solver एक उन्नत अनुकूलन इंजन है जो कई इनपुट सेल्स और जटिल गणितीय शर्तों को एक साथ हल करता है।")

#short-qa(num: 49, q: "ऑफिस 365 सह-लेखन में डेटा टकराव (Conflict) कैसे सुलझाया जाता है?", ans: "जब दो लोग एक ही सेल में एक साथ लिखते हैं, तो एक्सेल दोनों के मान आमने-सामने दिखाकर पूछता है कि किस मान को अंतिम रूप से सुरक्षित रखना है।")

#short-qa(num: 50, q: "2027 में शीर्ष 1% कॉर्पोरेट MIS प्रोफेशनल के 5 मुख्य कौशल कौन से हैं?", ans: "1. कीबोर्ड शॉर्टकट्स की तीव्र गति। 2. XLOOKUP, डायनामिक एरे तथा पावर क्वेरी ETL। 3. रिलेशनल डेटा मॉडलिंग व DAX। 4. प्रभावी विजुअल प्रेजेंटेशन। 5. कोपायलट AI प्रॉम्प्ट इंजीनियरिंग।")

#v(2pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/ppt-morph-rotate.png", width: 95%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    चित्र 32.2: एडवांस्ड माइक्रोसॉफ्ट पावरपॉइंट 365 मल्टी-ऑब्जेक्ट मॉर्फिंग एवं 3D स्थानिक ट्रांजिशन।
  ]
]

#pagebreak()

== 32.4 संस्थापक का संदेश, व्यक्तिगत शुभकामनाएं एवं करियर एक्सेलरेटर बंडल

#grid(
  columns: (1fr, 3.2fr),
  gutter: 12pt,
  [
    #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/02_BRAND_ASSETS/rahul-patel.jpg", width: 100%)
    #v(3pt)
    #align(center)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[राहुल पटेल]\
      #text(size: 7pt, fill: rgb("#64748B"))[संस्थापक एवं मुख्य आर्किटेक्ट]\
      #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[आरटेक लैब डिजिटल]
    ]
  ],
  [
    #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[प्रिय महत्वाकांक्षी शिक्षार्थी एवं भावी कॉर्पोरेट लीडर,]
    #v(2pt)
    #text(size: 7.2pt, fill: rgb("#1E293B"))[
      जब मैंने आरटेक लैब (RTechLab) की स्थापना की थी, तो हमारा संकल्प बिल्कुल स्पष्ट था: *भारत के छात्रों व पेशेवरों को विश्वस्तरीय, शोध-सत्यापित तथा उद्योग-मानक तकनीकी शिक्षा उपलब्ध कराना।*

      यह माइक्रोसॉफ्ट ऑफिस 365 मास्टर गाइड सामान्य सतही ट्यूटोरियल्स से नहीं बनाई गई है। इसका प्रत्येक पृष्ठ, कीबोर्ड शॉर्टकट, फॉर्मूला विश्लेषण तथा व्यावहारिक लैब वास्तविक कॉर्पोरेट आईटी परामर्श, क्लाउड डिप्लॉयमेंट तथा उच्च-स्तरीय बोर्डरूम अनुभवों के आधार पर तैयार की गई है।

      वर्ड, एक्सेल तथा पावरपॉइंट सीखना केवल मेनू बटनों को रटना नहीं है; यह कच्चे बिखरे हुए डेटा को स्पष्ट, प्रभावशाली व्यावसायिक बुद्धिमत्ता में बदलने का कौशल है। जब आप बिना माउस छुए कीबोर्ड से जटिल वित्तीय मॉडल बनाते हैं और मॉर्फ द्वारा शानदार प्रेजेंटेशन देते हैं, तो कॉर्पोरेट जगत में आपकी प्रतिष्ठा स्वतः स्थापित होती है।

      मेरी व्यक्तिगत शुभकामना है कि आप अपने करियर में नई ऊंचाइयों को छुएं और कोपायलट AI जैसी आधुनिक तकनीकों में निपुण होकर देश और दुनिया में अपना नाम रोशन करें।
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1.5pt + rgb("#0284C7"),
  radius: 6pt,
  fill: rgb("#F0F9FF"),
  inset: (x: 10pt, y: 7pt),
  [
    #align(center)[
      #text(size: 9.5pt, weight: "bold", fill: rgb("#0369A1"))[🚀 आरटेक लैब ₹149 करियर एक्सेलरेटर बंडल 🚀]\
      #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[सम्पूर्ण 4-इन-1 मास्टर टूलकिट · आजीवन क्लाउड एक्सेस · कोई छिपा हुआ शुल्क नहीं]
    ]
    #v(3pt)
    #text(size: 7pt, fill: rgb("#1E293B"))[
      यदि आपने इस गाइड को *₹149 करियर एक्सेलरेटर बंडल* के हिस्से के रूप में प्राप्त किया है, तो बधाई! आपके पास एक शुरुआती शिक्षार्थी से शीर्ष-स्तरीय MIS विश्लेषक बनने का पूरा पैकेज उपलब्ध है। इस बंडल में शामिल हैं:
    ]
    #v(2pt)
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #text(size: 6.8pt)[
          *✓ 1. 112-पृष्ठ सम्पूर्ण मास्टर पुस्तक*\
          अंग्रेजी व हिंदी दोनों भाषाओं में वर्ड, एक्सेल, पीपीटी, कोपायलट व क्लाउड की संपूर्ण गाइड।

          *✓ 2. रेडी-टू-यूज प्रैक्टिकल एक्सेल टेम्पलेट्स*\
          ऋण ईएमआई कैलकुलेटर, डायनामिक इन्वेंटरी तथा पेरोल सैलरी स्लिप के व्यावसायिक वर्कबुक्स।
        ]
      ],
      [
        #text(size: 6.8pt)[
          *✓ 3. शीर्ष 100 शॉर्टकट्स व MIS वॉल्ट PDF*\
          डेस्क पर रखने योग्य उच्च-रिज़ॉल्यूशन प्रिंटेबल चीट शीट व इंटरव्यू प्रश्नोत्तरी।

          *✓ 4. आजीवन अपडेट्स व मेंटरशिप कम्युनिटी*\
          2027 के सभी आगामी तिमाही अपडेट्स तथा राहुल सर से सीधे तकनीकी मार्गदर्शन।
        ]
      ]
    )
    #v(3pt)
    #align(center)[
      #text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[
        वेबसाइट: #text(fill: rgb("#0284C7"))[https://rtechlab.in] · ईमेल: #text(fill: rgb("#0284C7"))[support\@rtechlab.in] · व्हाट्सएप: +91 91095 86284
      ]
    ]
  ]
)

#v(4pt)

== विद्यार्थियों हेतु आधिकारिक आरटेक लैब सत्यापन चेकलिस्ट
#table(
  columns: (1fr, 2.5fr, 1.2fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*मॉड्यूल*], [*सत्यापित मुख्य तकनीकी डिलिवरेबल*], [*स्थिति*], [*प्रत्यायन*]),
  [वर्ड 365], [10 अध्याय + 5 कॉर्पोरेट प्रोडक्शन लैब्स पूर्ण], [सत्यापित 100%], [आरटेक लैब सर्टिफाइड],
  [एक्सेल 365], [12 अध्याय + 5 एंटरप्राइज एनालिटिक्स लैब्स निर्मित], [सत्यापित 100%], [आरटेक लैब सर्टिफाइड],
  [पावरपॉइंट], [6 अध्याय + 3 इन्वेस्टर पिच डेक्स प्रस्तुत], [सत्यापित 100%], [आरटेक लैब सर्टिफाइड],
  [क्लाउड व AI], [वनड्राइव डेल्टा सिंक एवं कोपायलट प्रॉम्प्ट इंजीनियरिंग], [सत्यापित 100%], [आरटेक लैब सर्टिफाइड]
)
"""

    with open(os.path.join(hi_dir, "chapter-31.typ"), "w", encoding="utf-8") as f:
        f.write(hi_ch31)
    with open(os.path.join(hi_dir, "chapter-32.typ"), "w", encoding="utf-8") as f:
        f.write(hi_ch32)
    print("✓ Hindi chapters 31 & 32 updated with real software UI screenshots and dense formatting.")

    # =========================================================================
    # 5. COMPILE STANDALONE VAULT EN & HI
    # =========================================================================
    en_typ_path = os.path.join(eng_dir, "standalone-vault.typ")
    hi_typ_path = os.path.join(hi_dir, "standalone-vault-hi.typ")
    en_out = os.path.join(vault_dir, "Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-English.pdf")
    hi_out = os.path.join(vault_dir, "Office-365-Top-100-Shortcuts-and-50-MIS-Interview-Vault-Hindi.pdf")

    subprocess.run(['typst', 'compile', '--root', '.', en_typ_path, en_out], check=True)
    subprocess.run(['typst', 'compile', '--root', '.', hi_typ_path, hi_out], check=True)

    doc_en = fitz.open(en_out)
    doc_hi = fitz.open(hi_out)
    print(f"✓ Standalone Vault EN: {len(doc_en)} pages ({en_out})")
    for i in range(len(doc_en)):
        p = doc_en[i]
        blocks = [b for b in p.get_text('blocks') if 'RTECHLAB' not in b[4] and 'C E R T I F I E D' not in b[4] and b[1] >= 45 and b[3] <= 795]
        if blocks:
            max_y = max(b[3] for b in blocks)
            fill = ((max_y - 50) / 740) * 100
            print(f"  EN Page {i+1}: {fill:.1f}% fill (bottom y={max_y:.1f})")

    print(f"✓ Standalone Vault HI: {len(doc_hi)} pages ({hi_out})")
    for i in range(len(doc_hi)):
        p = doc_hi[i]
        blocks = [b for b in p.get_text('blocks') if 'RTECHLAB' not in b[4] and 'C E R T I F I E D' not in b[4] and b[1] >= 45 and b[3] <= 795]
        if blocks:
            max_y = max(b[3] for b in blocks)
            fill = ((max_y - 50) / 740) * 100
            print(f"  HI Page {i+1}: {fill:.1f}% fill (bottom y={max_y:.1f})")

if __name__ == "__main__":
    update_vault()
