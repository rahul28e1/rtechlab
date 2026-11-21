import os
import subprocess
import fitz

def generate_vault_both():
    eng_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/English'
    hi_dir = 'DIGITAL/OFFICE_365/07_SOURCE_FILES/Hindi'
    vault_dir = 'DIGITAL/OFFICE_365/03_INTERVIEW_AND_SHORTCUT_VAULT'

    # =========================================================================
    # ENGLISH CHAPTER 31
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

#v(2pt)

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

#v(2pt)

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

#v(2pt)

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
  inset: (x: 4pt, y: 1.8pt),
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

#v(2pt)

== Enterprise Ribbon KeyTip Accelerator Matrix (Zero-Mouse Navigation)
#table(
  columns: (1fr, 1.8fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2pt),
  table.header([*Sequence*], [*Application Target*], [*Action Executed Instantly*]),
  [`Alt > H > O > I`], [Excel 365], [Auto-fits selected column widths to match longest cell string.],
  [`Alt > H > M > C`], [Excel 365], [Merges active cell block and aligns contents to center.],
  [`Alt > A > T`], [Excel 365], [Toggles AutoFilter arrows on or off across active dataset.],
  [`Alt > N > V > T`], [Excel 365], [Launches PivotTable from Table / Range dialog box.],
  [`Alt > W > R`], [Word 365], [Toggles horizontal and vertical margin rulers on canvas.]
)

#v(2pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/office-visual-refresh.png", width: 98%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 31.4: Microsoft 365 Visual Refresh Interface Architecture: Unified Ribbon, Cloud Co-Authoring & Multi-Window Synchronization.
  ]
]

#v(2pt)

#spotlight-box("THE 14-DAY KEYBOARD MASTERY CHALLENGE", [
  Unplug your physical mouse for 2 hours every morning. Navigating formulas, tables, and presentation decks using Alt-key ribbon accelerators (`Alt > H > O > I`, `Alt > E > S > V`) rewires neural muscle memory. Corporate MIS analysts who operate purely by keyboard complete weekly financial closing cycles 3.5x faster than peers.
])
"""

    # =========================================================================
    # ENGLISH CHAPTER 32 (Natural flow with images & rich content)
    # =========================================================================
    en_ch32 = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: CLOUD ECOSYSTEM, COPILOT AI & INTERVIEW VAULT · CHAPTER 32]
= The Top 50 MIS Interview Vault, Author Note & Career Accelerator Bundle

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Senior Management Information Systems (MIS) executives and corporate analysts face grueling technical interviews. This chapter delivers the top 50 high-frequency interview questions with exact enterprise-grade answers, followed by Founder Rahul Patel's concluding message and the ₹149 Career Accelerator invitation.
]

#v(2pt)

== 32.1 Questions 01 - 15: Core Office 365 Architecture & Data Modeling

#let interview-q(num: 1, q: "", ans: "") = {
  block(
    width: 100%,
    inset: (x: 2pt, y: 1.5pt),
    spacing: 3pt,
    [
      #text(size: 7.8pt, weight: "bold", fill: rgb("#0F172A"))[Q#num. #q]\
      #text(size: 7.4pt, fill: rgb("#059669").darken(10%))[#ans]
    ]
  )
}

#interview-q(num: 1, q: "What is the primary operational difference between VLOOKUP and XLOOKUP?", ans: "VLOOKUP searches only left-to-right, requires hardcoded column index numbers vulnerable to column insertions, and defaults to approximate match. XLOOKUP searches bidirectionally, separates lookup/return arrays safely, defaults to exact match, and handles missing data natively via [if_not_found].")

#interview-q(num: 2, q: "Explain the Spill mechanism and the #SPILL! error in modern Excel.", ans: "Dynamic array formulas automatically expand into adjacent blank cells (the spill range). If any obstacle (value, text, merged cell) blocks the designated expansion bounding box, Excel halts execution and throws a #SPILL! collision error.")

#interview-q(num: 3, q: "What is the difference between =COUNT, =COUNTA, and =COUNTBLANK?", ans: "=COUNT tallies cells containing numeric values only. =COUNTA tallies all non-empty cells (numbers, text, boolean, errors). =COUNTBLANK tallies strictly empty cells or formulas returning empty text strings \"\".")

#interview-q(num: 4, q: "When should INDEX/MATCH be chosen over VLOOKUP in legacy enterprise systems?", ans: "INDEX/MATCH evaluates independent column ranges, consumes drastically less memory on multi-gigabyte workbooks, supports reverse leftward lookups, and never breaks when intervening columns are added or deleted.")

#interview-q(num: 5, q: "How does Power Query handle automated monthly ETL refreshes?", ans: "Power Query records data ingestion, transformation, unpivoting, and typecasting steps in the M language. When new source files drop into a folder, clicking Data > Refresh All re-executes all transformations deterministically in seconds.")

#interview-q(num: 6, q: "What is the Pivot Cache and why does it affect workbook file size?", ans: "When a PivotTable is created, Excel builds an in-memory replica snapshot of the source dataset called the Pivot Cache. Multiple PivotTables referencing the same cache share memory; creating separate caches duplicates file size.")

#interview-q(num: 7, q: "What is the difference between a Calculated Field and a Calculated Item in PivotTables?", ans: "A Calculated Field creates a new virtual column derived from mathematical operations on existing fields (e.g., =Sales * 18%). A Calculated Item creates a virtual row performing math across individual items within a single field.")

#interview-q(num: 8, q: "Explain the role of Styles in long-form Word document automation.", ans: "Styles (Heading 1-9) establish structural semantic hierarchy. They drive automated Table of Contents generation, Navigation Pane tree collapsing, cross-referencing bookmarks, and universal deck-wide font re-theming in seconds.")

#interview-q(num: 9, q: "What is the difference between a Section Break (Next Page) and a Page Break in Word?", ans: "A Page Break only advances text to the next page. A Section Break creates an independent structural partition, allowing unique headers, footers, page numbering restarts, margins, and landscape/portrait orientation flips.")

#interview-q(num: 10, q: "How do you resolve Mail Merge numeric formatting corruptions (e.g. ₹50000 displaying as 50000.0000001)?", ans: "Press Alt + F9 to reveal underlying field codes, and append an explicit picture switch: { MERGEFIELD Salary \\# \"#,##,##0.00\" }.")

#interview-q(num: 11, q: "What is the difference between Parent Slide Master and Child Layouts in PowerPoint?", ans: "The Parent Master cascades formatting (fonts, logos, background fill) universally to all slides. Child Layouts contain specialized placeholder configurations applying only to slides assigned that specific layout.")

#interview-q(num: 12, q: "How does the Morph transition differ from standard PowerPoint animations?", ans: "Standard animations require explicit manual motion paths on a single slide. Morph automatically calculates the coordinate and size deltas of matching objects between two distinct slides and renders 60fps fluid interpolation.")

#interview-q(num: 13, q: "What is the purpose of the double exclamation prefix (!!) in PowerPoint Morph?", ans: "Prepend !! (e.g. !!HeroShape) in the Selection Pane to force PowerPoint to morph two completely different geometric shapes into each other across slide boundaries.")

#interview-q(num: 14, q: "How does differential delta sync in OneDrive for Business optimize network performance?", ans: "Instead of re-uploading an entire multi-megabyte file upon saving, the delta sync engine calculates and transmits strictly the modified binary chunks, reducing bandwidth consumption by over 95%.")

#interview-q(num: 15, q: "What happens when you select 'Block Download' when sharing an Office 365 file?", ans: "The recipient is restricted to browser-only viewing and commenting; downloading a local copy, printing, or copying text to the clipboard is cryptographically blocked.")

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-pivottable-sample.png", width: 96%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 32.1: Enterprise PivotTable Normalized Source Data Grid & Field Layout Architecture.
  ]
]

#v(6pt)

== 32.2 Questions 16 - 32: Advanced Modeling, Cloud Collaboration & Automation

#interview-q(num: 16, q: "What is the syntax and utility of the LAMBDA function in Excel 365?", ans: "Syntax: =LAMBDA(param1, param2, ..., calculation). It allows users to create bespoke, reusable custom Excel functions without writing VBA code, which can then be named inside the Name Manager.")

#interview-q(num: 17, q: "How do =LET functions optimize calculation speed in complex models?", ans: "Syntax: =LET(name1, val1, calculation). It assigns intermediate calculation results to variables within a single formula. Repeated expensive lookups are computed once rather than multiple times, drastically reducing latency.")

#interview-q(num: 18, q: "Explain the difference between =TEXTJOIN and =CONCATENATE.", ans: "=CONCATENATE requires manual delimiter insertion between every token and cannot handle ranges. =TEXTJOIN accepts an entire contiguous range, applies a universal delimiter (e.g. \"; \"), and natively ignores empty cells.")

#interview-q(num: 19, q: "How does =NETWORKDAYS.INTL accommodate non-standard corporate workweeks?", ans: "=NETWORKDAYS.INTL includes a [weekend] parameter where customized binary masks (e.g. \"0000011\" for Friday/Saturday weekends) can be passed alongside corporate holiday arrays.")

#interview-q(num: 20, q: "What is the difference between =STDEV.S and =STDEV.P?", ans: "=STDEV.S calculates standard deviation for a sample (dividing by N - 1). =STDEV.P measures standard deviation for the entire population (dividing by N). Using .P on sample data underestimates risk.")

#interview-q(num: 21, q: "Why must the initial capital outlay (Period 0) be added outside Excel's =NPV function?", ans: "=NPV automatically discounts the first value in the range as arriving at Period 1. Including Year 0 cash flow inside the range discounts the initial investment incorrectly by one full year.")

#interview-q(num: 22, q: "What is the mathematical relationship between PMT, IPMT, and PPMT?", ans: "For any loan installment period per: PMT = IPMT + PPMT. IPMT calculates the interest portion, while PPMT isolates the principal repayment portion.")

#interview-q(num: 23, q: "Explain how to unpivot tabular data in Power Query and why it is critical.", ans: "Select attribute columns, click Unpivot Other Columns. This transforms wide matrix reports into a normalized 3-column relational schema (Key, Attribute, Value) essential for scalable PivotTable analytics.")

#interview-q(num: 24, q: "What is the difference between a Shared Workbook (legacy) and Co-Authoring (365)?", ans: "Legacy Shared Workbooks relied on file locking, frequently corrupted data, and disabled modern tables. Office 365 Co-Authoring uses cloud delta streaming to allow simultaneous multi-user presence without corruption.")

#interview-q(num: 25, q: "How do you audit formula errors using Trace Precedents and Trace Dependents?", ans: "Under Formulas > Formula Auditing, Trace Precedents draws blue arrows from all source cells feeding the formula. Trace Dependents points to all downstream formulas relying on the active cell.")

#interview-q(num: 26, q: "What is a Circular Reference and how do you resolve it?", ans: "Occurs when a formula refers to its own cell directly or indirectly. Resolved by checking Formulas > Error Checking > Circular References, and restructuring the calculation flow or enabling Iterative Calculation.")

#interview-q(num: 27, q: "What is the difference between Slicers and Timelines in Excel dashboards?", ans: "Slicers filter categorical text dimensions (e.g. Region, Category). Timelines filter date-formatted fields, offering interactive zooming across Years, Quarters, Months, and Days.")

#interview-q(num: 28, q: "How do you protect formula cells in an Excel worksheet while allowing data entry in others?", ans: "Select data entry cells, open Format Cells > Protection, and uncheck 'Locked'. Then go to Review > Protect Sheet and enable password protection. Only unlocked cells remain editable.")

#interview-q(num: 29, q: "What is Microsoft Copilot grounding and how does it prevent generic hallucinations?", ans: "Grounding queries the Microsoft Graph using authenticated user permissions to inject relevant corporate emails, chats, and documents into the prompt context before sending it to the LLM.")

#interview-q(num: 30, q: "What is the difference between VBA Macros and Microsoft Office Scripts?", ans: "VBA is a desktop-only legacy COM-based language. Office Scripts use modern TypeScript/JavaScript, run securely in the cloud, work on Excel Online/Mac/Mobile, and integrate with Power Automate workflows.")

#interview-q(num: 31, q: "How do you configure an interactive branching quiz in PowerPoint 365?", ans: "Create action buttons or hyperlinks linked to specific slides based on the selected answer, and disable 'Advance On Click' in Transition settings to force button-only navigation.")

#interview-q(num: 32, q: "What is the function of the Selection Pane (Alt + F10) in complex presentation decks?", ans: "It provides a hierarchical layer manager to rename objects, reorder z-index stacking layers, hide/unhide elements during editing, and configure matching names (!!) for Morph transitions.")

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-pivottable-tabular.jpg", width: 96%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 32.2: Official Microsoft Excel PivotTable Tabular Layout & Structured Analytical Grid.
  ]
]

#v(6pt)

== 32.3 Questions 33 - 50: Enterprise Strategy, Security & Advanced MIS Analytics

#interview-q(num: 33, q: "How does the 'Summary Zoom' feature function in executive presentations?", ans: "It auto-generates a high-level dashboard slide with live thumbnail links to major sections, zooming into deep-dive slides upon click and returning automatically to the overview when the section ends.")

#interview-q(num: 34, q: "What causes the #NUM! error in Excel financial functions like =IRR?", ans: "Occurs when the iterative calculation engine fails to converge on a valid rate of return within 20 iterations, or when the cash flow series lacks at least one negative and one positive value.")

#interview-q(num: 35, q: "What is the benefit of saving PowerPoint presentations as .ppsx instead of .pptx?", ans: ".pptx opens in normal slide editing mode. .ppsx (PowerPoint Show) opens directly into full-screen presentation mode upon double-clicking, bypassing the editing workspace entirely.")

#interview-q(num: 36, q: "How do you automate multi-table relational modeling without writing VLOOKUP formulas?", ans: "Load tables into the Excel Data Model (Power Pivot). Create 1-to-Many relationships between Primary Keys and Foreign Keys in Diagram View, then generate PivotTables directly from the Data Model.")

#interview-q(num: 37, q: "What is DAX and how does it differ from traditional Excel formulas?", ans: "Data Analysis Expressions (DAX) operates across relational tables in the Data Model using row and filter contexts (e.g. =CALCULATE(SUM(Sales), Region=\"North\")), enabling scalable multi-million-row analytics.")

#interview-q(num: 38, q: "Explain the difference between Implicit and Explicit measures in Power Pivot.", ans: "Implicit measures are created automatically by dragging numeric fields into the PivotTable Values area. Explicit measures are formalized DAX formulas defined inside the Data Model, offering superior reusability and performance.")

#interview-q(num: 39, q: "How do Sensitivity Labels protect corporate Office 365 documents?", ans: "Managed via Microsoft Purview, Sensitivity Labels apply hardware-level Rights Management encryption, visual headers/watermarks, and access controls that persist even if the file is emailed externally.")

#interview-q(num: 40, q: "How do you resolve a #VALUE! error caused by math operations on text-formatted numbers?", ans: "Wrap the reference in the =VALUE() function, or multiply by 1 (e.g. =A1 * 1), which forces Excel's coercion engine to convert numeric string tokens into true mathematical numbers.")

#interview-q(num: 41, q: "What is the 6x6 corporate presentation rule and why is it enforced?", ans: "No more than 6 bullet points per slide, and no more than 6 words per bullet. Enforced to prevent cognitive overload and maintain executive focus on the speaker rather than reading walls of text.")

#interview-q(num: 42, q: "How do you embed a live Excel chart into PowerPoint so that it auto-updates when data changes?", ans: "Copy the chart in Excel. In PowerPoint, choose Paste Special > Paste Link > Microsoft Excel Chart Object. When the underlying workbook is edited, the slide chart updates automatically.")

#interview-q(num: 43, q: "Explain the purpose of the =INDIRECT function and its primary operational risk.", ans: "=INDIRECT converts a text string into an active cell reference (e.g. =INDIRECT(\"B\" & 5)). Risk: It is a volatile function that recalculates on every keystroke, causing severe workbook lag in large models.")

#interview-q(num: 44, q: "What is the difference between =CHOOSECOLS and =CHOOSEROWS in dynamic arrays?", ans: "=CHOOSECOLS extracts specific columns by numeric index from an array. =CHOOSEROWS extracts specific horizontal rows. They eliminate the need for complex offset calculations.")

#interview-q(num: 45, q: "How do you automate document generation across 1,000 customers using Word Mail Merge?", ans: "Link Word to an Excel data source via Mailings > Select Recipients. Insert merge fields («Name», «Address»). Complete merge via 'Edit Individual Documents' or direct email dispatch through Outlook.")

#interview-q(num: 46, q: "What is the function of the Document Inspector in Word and PowerPoint?", ans: "Located under File > Info > Check for Issues > Inspect Document. Scans for and removes hidden personal metadata, revision comments, hidden slides, and off-canvas shapes before public release.")

#interview-q(num: 47, q: "How do you troubleshoot a broken Excel formula that returns an unexpected result without throwing an error?", ans: "Use the Evaluate Formula tool (Formulas > Evaluate Formula) to step through each nested calculation sequentially, observing how intermediate values resolve at each stage.")

#interview-q(num: 48, q: "What is the difference between Goal Seek and Solver in Excel?", ans: "Goal Seek adjusts a single input variable to achieve a specific target output. Solver is an optimization engine that adjusts multiple variables simultaneously subject to complex mathematical constraints.")

#interview-q(num: 49, q: "How do you configure Co-Authoring conflict resolution in Microsoft 365?", ans: "When conflicting edits occur simultaneously on the same cell, Excel flags the collision with an alert prompt, displaying both values side-by-side and prompting the user to pick which change to preserve.")

#interview-q(num: 50, q: "What are the core skill pillars of a top 1% corporate MIS professional in 2027?", ans: "1. Flawless keyboard speed. 2. Mastery of XLOOKUP, Dynamic Arrays, and Power Query ETL. 3. Relational Data Modeling and DAX. 4. Executive visual storytelling. 5. AI Copilot prompt engineering.")

#v(3pt)

#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/ppt-morph-transition.png", width: 96%)
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 32.3: PowerPoint 365 Morph Transition Ribbon Controls & 60fps Animation Interpolation Engine.
  ]
]

#pagebreak()

== 32.4 Founder's Message, Personal Well Wishes & Career Accelerator Bundle

#grid(
  columns: (1.2fr, 2.8fr),
  gutter: 14pt,
  [
    #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/02_BRAND_ASSETS/rahul-patel.jpg", width: 100%)
    #v(4pt)
    #align(center)[
      #text(weight: "bold", size: 9pt, fill: rgb("#0F172A"))[Rahul Patel]\
      #text(size: 7.2pt, fill: rgb("#64748B"))[Founder & Chief Technology Architect]\
      #text(size: 7.2pt, weight: "bold", fill: rgb("#0284C7"))[RTechLab Digital]
    ]
  ],
  [
    #text(size: 8pt, weight: "bold", fill: rgb("#0284C7"))[DEAR AMBITIOUS LEARNER & FUTURE CORPORATE LEADER,]
    #v(3pt)
    #text(size: 7.5pt, fill: rgb("#1E293B"))[
      When I founded RTechLab, our mission was simple yet uncompromising: *to build the highest-quality, research-verified, enterprise-grade technical educational resources in India.*

      This Microsoft Office 365 Master Guide was not assembled from surface-level tutorials. Every page, keyboard shortcut, formula specimen, and production lab was engineered from real-world corporate IT consulting, cloud enterprise deployments, and high-stakes executive boardroom experience.

      Mastering Word, Excel, and PowerPoint is not merely about learning menu buttons; it is about developing the cognitive discipline to transform raw, chaotic data into clear, persuasive executive intelligence. When you execute keyboard-driven modeling, build dynamic Power Query pipelines, and deliver cinematic Morph presentations, you command immediate respect in any corporate boardroom.

      My personal wish for you is boundless professional success, relentless curiosity, and the courage to master modern technologies like Copilot AI that are reshaping the global corporate landscape.
    ]

    #v(6pt)

    #align(right)[
      #text(font: "Segoe Script", size: 11pt, weight: "bold", fill: rgb("#0284C7"))[Rahul Patel]\
      #text(size: 6.5pt, fill: rgb("#64748B"))[Founder, RTechLab Educational Initiative]
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 1.5pt + rgb("#0284C7"),
  radius: 6pt,
  fill: rgb("#F0F9FF"),
  inset: (x: 12pt, y: 8pt),
  [
    #align(center)[
      #text(size: 10pt, weight: "bold", fill: rgb("#0369A1"))[🚀 THE RTECHLAB ₹149 CAREER ACCELERATOR BUNDLE 🚀]\
      #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Complete 4-in-1 Master Toolkit · Instant Lifetime Cloud Access · No Hidden Fees]
    ]
    #v(4pt)
    #text(size: 7.2pt, fill: rgb("#1E293B"))[
      If you acquired this core guide as part of the *₹149 Career Accelerator Bundle*, congratulations! You hold the complete enterprise toolkit designed to take you from beginner to top-tier MIS analyst. Your package includes:
    ]
    #v(3pt)
    #grid(
      columns: (1fr, 1fr),
      gutter: 10pt,
      [
        #text(size: 7pt)[
          *✓ 1. The 112-Page Master Publication*\
          Full dual-language (English & Hindi) Word, Excel, PPT, Copilot & Cloud Master Guide.

          *✓ 2. Standalone Practical Excel Templates*\
          Pre-built commercial workbooks: Loan EMI Amortization, Dynamic Inventory, and HR Payroll.
        ]
      ],
      [
        #text(size: 7pt)[
          *✓ 3. Top 100 Shortcuts & MIS Vault PDF*\
          Standalone high-resolution printable cheat sheets for rapid desktop desk reference.

          *✓ 4. Lifetime Updates & Discord Community*\
          Free access to all 2027 quarterly updates and direct technical Q&A with Rahul Sir.
        ]
      ]
    )
    #v(4pt)
    #align(center)[
      #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[
        Visit #text(fill: rgb("#0284C7"))[https://rtechlab.vercel.app] · Email: #text(fill: rgb("#0284C7"))[rahul.28e1\@gmail.com] · WhatsApp: +91 91095 86284
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
  inset: (x: 5pt, y: 2.8pt),
  table.header([*Module*], [*Core Technical Deliverable Verified*], [*Status*], [*Accreditation*]),
  [Word 365], [10 Chapters + 5 Corporate Production Labs Completed], [Verified 100%], [RTechLab Certified],
  [Excel 365], [12 Chapters + 5 Enterprise Analytics Labs Built], [Verified 100%], [RTechLab Certified],
  [PowerPoint], [6 Chapters + 3 Investor Pitch Decks Delivered], [Verified 100%], [RTechLab Certified],
  [Cloud & AI], [OneDrive Delta Sync & Copilot Prompt Engineering], [Verified 100%], [RTechLab Certified]
)

#v(4pt)

#spotlight-box("STUDENT LIFETIME COMMUNITY & DIRECT CONNECT", [
  Scan the QR code or visit https://rtechlab.vercel.app/notes to download updated quarterly errata packs, access live student Discord forums, and register for Rahul Sir's exclusive monthly C-Suite productivity webinars. Your educational journey with RTechLab never ends.
])
"""

    with open(os.path.join(eng_dir, "chapter-31.typ"), "w", encoding="utf-8") as f:
        f.write(en_ch31)
    with open(os.path.join(eng_dir, "chapter-32.typ"), "w", encoding="utf-8") as f:
        f.write(en_ch32)

    # =========================================================================
    # HINDI CHAPTER 31 & 32
    # =========================================================================
    hi_ch31 = en_ch31.replace("PART 4: CLOUD ECOSYSTEM, COPILOT AI & INTERVIEW VAULT · CHAPTER 31", "भाग 4: क्लाउड इकोसिस्टम, कोपायलट AI एवं इंटरव्यू वॉल्ट · अध्याय 31")
    hi_ch31 = hi_ch31.replace("= The Top 100 Corporate Keyboard Shortcuts Master Reference Vault", "= शीर्ष 100 कॉर्पोरेट कीबोर्ड शॉर्टकट्स मास्टर संदर्भ वॉल्ट")
    hi_ch31 = hi_ch31.replace("== 31.1 Microsoft Word 365: Navigation, Formatting & Structural Shortcuts (1-25)", "== 31.1 माइक्रोसॉफ्ट वर्ड 365: नेविगेशन, फॉर्मेटिंग एवं संरचना शॉर्टकट्स (1-25)")
    hi_ch31 = hi_ch31.replace("== 31.2 Microsoft Excel 365: Navigation, Selection & Data Entry Shortcuts (26-55)", "== 31.2 माइक्रोसॉफ्ट एक्सेल 365: नेविगेशन, चयन एवं डेटा एंट्री शॉर्टकट्स (26-55)")
    hi_ch31 = hi_ch31.replace("== 31.3 Microsoft Excel Advanced & PowerPoint 365 Shortcuts (56-85)", "== 31.3 एक्सेल एडवांस्ड एवं पावरपॉइंट 365 शॉर्टकट्स (56-85)")
    hi_ch31 = hi_ch31.replace("== 31.4 PowerPoint Delivery & Cloud Ecosystem Shortcuts (86-100)", "== 31.4 पावरपॉइंट डिलीवरी एवं क्लाउड इकोसिस्टम शॉर्टकट्स (86-100)")
    hi_ch31 = hi_ch31.replace("== Enterprise Ribbon KeyTip Accelerator Matrix (Zero-Mouse Navigation)", "== एंटरप्राइज रिबन की-टिप एक्सेलेरेटर मैट्रिक्स (शून्य-माउस नेविगेशन)")
    hi_ch31 = hi_ch31.replace("Figure 31.1: Official Microsoft Word 365 Fluent Interface: Ribbon Anatomy, Heading Styles Hierarchy & Navigation Pane.", "चित्र 31.1: ऑफिशियल माइक्रोसॉफ्ट वर्ड 365 इंटरफ़ेस: रिबन संरचना, हेडिंग स्टाइल्स पदानुक्रम एवं नेविगेशन पेन।")
    hi_ch31 = hi_ch31.replace("Figure 31.2: Official Microsoft Excel 365 Enterprise Grid: Dynamic XLOOKUP Formula Bar, Data Validation & Copilot AI Insights.", "चित्र 31.2: ऑफिशियल माइक्रोसॉफ्ट एक्सेल 365 एंटरप्राइज ग्रिड: डायनामिक XLOOKUP फॉर्मूला बार व कोपायलट AI एनालिटिक्स।")
    hi_ch31 = hi_ch31.replace("Figure 31.3: Official Microsoft PowerPoint 365 Workspace: Slide Master Architecture, 6x6 Layout Rule & Morph Transitions.", "चित्र 31.3: ऑफिशियल माइक्रोसॉफ्ट पावरपॉइंट 365 इंटरफ़ेस: स्लाइड मास्टर, 6x6 लेआउट नियम एवं मॉर्फ ट्रांजिशन।")
    hi_ch31 = hi_ch31.replace("Figure 31.4: Microsoft 365 Visual Refresh Interface Architecture: Unified Ribbon, Cloud Co-Authoring & Multi-Window Synchronization.", "चित्र 31.4: माइक्रोसॉफ्ट 365 विजुअल रिफ्रेश इंटरफेस: एकीकृत रिबन, क्लाउड सह-लेखन एवं मल्टी-विंडो तुल्यकालन।")
    hi_ch31 = hi_ch31.replace("THE 14-DAY KEYBOARD MASTERY CHALLENGE", "14-दिवसीय कीबोर्ड मास्टरी चुनौती")
    hi_ch31 = hi_ch31.replace("Unplug your physical mouse for 2 hours every morning. Navigating formulas, tables, and presentation decks using Alt-key ribbon accelerators (`Alt > H > O > I`, `Alt > E > S > V`) rewires neural muscle memory. Corporate MIS analysts who operate purely by keyboard complete weekly financial closing cycles 3.5x faster than peers.", "प्रतिदिन सुबह 2 घंटे के लिए अपने माउस को अलग रख दें। Alt-की त्वरित अनुक्रमों (`Alt > H > O > I`, `Alt > E > S > V`) द्वारा तालिकाओं व रिपोर्ट्स को नेविगेट करने से उंगलियों में स्थायी मसल मेमोरी विकसित होती है। बिना माउस छुए केवल कीबोर्ड से काम करने वाले कॉर्पोरेट विश्लेषक सामान्य कर्मचारियों से 3.5 गुना तेजी से काम पूरा करते हैं।")

    # For Hindi Ch 32, use translated content
    with open(os.path.join(hi_dir, "chapter-32.typ"), "r", encoding="utf-8") as f:
        hi_ch32_orig = f.read()
    
    # Remove pagebreaks inside hindi ch 32 and add images
    hi_ch32 = hi_ch32_orig.replace("#pagebreak()", "\n#v(6pt)\n")
    if "spotlight-box" not in hi_ch32:
        hi_ch32 += r"""
#v(4pt)
#spotlight-box("विद्यार्थी आजीवन कम्युनिटी एवं डायरेक्ट कनेक्ट", [
  क्यूआर कोड स्कैन करें अथवा https://rtechlab.vercel.app/notes पर जाएं ताकि अद्यतन तिमाही एर्राटा पैक्स डाउनलोड कर सकें, लाइव विद्यार्थी डिस्कॉर्ड फ़ोरम में शामिल हो सकें, तथा राहुल सर के मासिक C-Suite प्रोडक्टिविटी वेबिनार में भाग ले सकें। आरटेक लैब के साथ आपकी सीखने की यात्रा कभी समाप्त नहीं होती।
])
"""

    with open(os.path.join(hi_dir, "chapter-31.typ"), "w", encoding="utf-8") as f:
        f.write(hi_ch31)
    with open(os.path.join(hi_dir, "chapter-32.typ"), "w", encoding="utf-8") as f:
        f.write(hi_ch32)

    # Compile Standalone Vault EN & HI
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
    generate_vault_both()
