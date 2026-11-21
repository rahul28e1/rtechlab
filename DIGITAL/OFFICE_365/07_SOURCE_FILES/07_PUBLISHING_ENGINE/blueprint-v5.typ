// =============================================================================
// RTECHLAB MASTER CURRICULUM BLUEPRINT — MICROSOFT OFFICE 365 (ENGLISH EDITION 1)
// Page 2: Complete 32-Module Enterprise Production Curriculum Matrix
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[OFFICIAL MICROSOFT 365 ENTERPRISE BLUEPRINT · 32 PRODUCTION MODULES & 13 REAL LABS]
= Microsoft Office 365: Master Enterprise Curriculum

#text(size: 7.2pt, fill: rgb("#1E293B").lighten(20%))[
  Comprehensive curriculum matrix covering Word, Excel, PowerPoint, OneDrive Cloud Co-authoring, and 2027 Copilot AI integration. Standardized under the RTechLab 2027 Industrial Productivity Framework for corporate executives, MIS analysts, and students.
]

#v(1.5pt)

#table(
  columns: (0.7fr, 2.2fr, 0.8fr, 3.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 2.2pt, y: 1.05pt),
  table.header(
    [*Module*],
    [*Core Academic Subject*],
    [*Application*],
    [*High-Yield Technical Competencies & Production Lab Focus*]
  ),
  [Ch 01], [Word 365 Architecture & File Backstage], [Word], [Interface, Status Bar, View Modes, Backstage, Version History, AutoSave & Export.],
  [Ch 02], [Home Tab: Typography & Paragraph Mechanics], [Word], [Font Pairing, Character Spacing, Drop Cap, Bullets, Multilevel Numbering & Tabs.],
  [Ch 03], [Home Tab: Styles & Advanced Search Engine], [Word], [Heading Styles (H1-H4), Style Sets, Format Painter, Regex Wildcards Find/Replace.],
  [Ch 04], [Insert Tab: Tables & Matrix Data Manipulation], [Word], [Table Design, Cell Merging, Formulas (=SUM), Repeat Header Rows, Table to Text.],
  [Ch 05], [Insert Tab: Visual Media, SmartArt & Shapes], [Word], [Vector Icons, Shapes, SmartArt Hierarchy, 3D Models, Screenshot tool, Text Wrap.],
  [Ch 06], [Layout Tab: Section Breaks & Page Mechanics], [Word], [Margins, Columns, Page Breaks vs Section Breaks (Continuous, Next Page).],
  [Ch 07], [Design & Header/Footer Engineering], [Word], [Themes, Colors, Watermark, Unlinking "Same as Previous", Roman/Arabic page numbers.],
  [Ch 08], [References Tab: Auto-TOC, Citations & Index], [Word], [Automatic Table of Contents, Footnotes/Endnotes, APA Citations, Cross-references.],
  [Ch 09], [Mailings Tab: Enterprise Mail Merge Engine], [Word], [Excel Data Recipient Lists, Merge Fields, Filtering Rules, Envelope & Certificate Merge.],
  [Ch 10], [Review, View & 5 Corporate Word Labs], [Word Labs], [Track Changes, Compare, Restrict Editing, Labs: ATS Resume, Annual Report, NDA.],
  [Ch 11], [Excel 365 Grid Architecture & Cell References], [Excel], [Grid Navigation, Relative (A1), Absolute (\$A\$1), Mixed (\$A1/A\$1), Name Manager.],
  [Ch 12], [Data Entry, Custom Masks & Flash Fill], [Excel], [Number Formats, Currency, Custom 00000, Date Formats, Flash Fill (Ctrl+E), AutoFill.],
  [Ch 13], [Core Mathematical & Statistical Functions], [Excel], [SUM, AVERAGE, COUNT, COUNTA, COUNTBLANK, MIN, MAX, ROUND, ROUNDUP/DOWN.],
  [Ch 14], [Conditional Aggregation Engines], [Excel], [COUNTIF, COUNTIFS, SUMIF, SUMIFS, AVERAGEIF, AVERAGEIFS, Wildcard matching.],
  [Ch 15], [Logical Decision Engines & Error Trapping], [Excel], [IF, Nested IF, Modern IFS, SWITCH, AND, OR, NOT, IFERROR, IFNA, ISBLANK.],
  [Ch 16], [Dynamic Array Formulas & Modern Lookups], [Excel], [XLOOKUP (Exact/Wildcard/Two-way), INDEX+MATCH, FILTER, UNIQUE, SORT, SEQUENCE.],
  [Ch 17], [Advanced String & Text Processing Functions], [Excel], [TEXTJOIN, CONCAT, TEXT, LEFT, RIGHT, MID, LEN, TRIM, PROPER, Text to Columns.],
  [Ch 18], [Date & Time Calculation Mechanics], [Excel], [Serial Dates, TODAY, NOW, DATE, DATEDIF (Y/M/D), EDATE, EOMONTH, WORKDAY, NETWORKDAYS.],
  [Ch 19], [Data Validation & Error Diagnostics], [Excel], [Dropdown Lists, Dependent Cascading Dropdowns (INDIRECT), \#N/A, \#VALUE!, \#REF! fix.],
  [Ch 20], [Conditional Formatting & Visual Rules], [Excel], [Highlight Rules, Top/Bottom, Data Bars, Color Scales, Icon Sets, Custom Formulas.],
  [Ch 21], [Excel Tables & Pivot Table Analytics], [Excel], [Table Structured References ([Amount]), Slicers, Pivot Fields, Calculated Fields, Timelines.],
  [Ch 22], [What-If Analysis, Power Query & 5 Excel Labs], [Excel Labs], [Goal Seek, Scenario Manager, Power Query ETL, Labs: Marksheet, GST Bill, Payroll, KPI.],
  [Ch 23], [PowerPoint 365 Interface & 6x6 Design Rule], [PowerPoint], [Slide Workspace, The 6x6 Corporate Presentation Rule, Visual Contrast & Layouts.],
  [Ch 24], [Slide Master Architecture & Corporate Themes], [PowerPoint], [View > Slide Master, Custom Layouts, Logo Locks, Master Typography & Color Palettes.],
  [Ch 25], [Visual Graphics, Boolean Shapes & SmartArt], [PowerPoint], [Bullet-to-SmartArt conversion, Shape Union/Intersect/Subtract, 3D Assets, Icons.],
  [Ch 26], [Transitions & The 2027 Morph Revolution], [PowerPoint], [Morph Transition Mechanics, Magic Move, 3D Object Rotation, Slide & Summary Zoom.],
  [Ch 27], [Dynamic Animations, Timing & Multimedia], [PowerPoint], [Entrance, Emphasis, Exit, Motion Paths, Animation Pane Timeline, Video & Audio.],
  [Ch 28], [Presentation Delivery & 3 PowerPoint Labs], [PPT Labs], [Presenter View, Live Subtitles, Rehearse with Coach, Labs: Investor Pitch, Launch Deck.],
  [Ch 29], [Microsoft 365 Cloud Ecosystem & OneDrive], [Cloud], [Cloud AutoSave, Real-Time Co-Authoring, \@Mentions, Version History, Permissions.],
  [Ch 30], [Microsoft Copilot AI: 2027 Prompt Engineering], [Copilot AI], [Copilot in Word (Drafting), Excel (Python/Data Insights), PPT (Prompt-to-Slide).],
  [Ch 31], [Top 100 Corporate Keyboard Shortcuts], [Shortcuts], [Word (35), Excel (40), PowerPoint (25) Rapid Executive Productivity Shortcuts.],
  [Ch 32], [Top 50 MIS Technical Interview Vault & Epilogue], [Interview], [50 Corporate Screening Q&As, Rahul Sir's Author Message & ₹149 Bundle Invitation.]
)

#v(1.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(
      width: 100%,
      stroke: (left: 2pt + rgb("#0284C7")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 5pt, y: 3pt),
      [
        #text(size: 7pt, weight: "bold", fill: rgb("#0F172A"))[CURRICULUM PEDAGOGY & RIGOROUS LAB STANDARDS]\
        #v(1pt)
        #text(size: 6.3pt, fill: rgb("#1E293B"))[
          Every chapter provides exact ribbon navigation paths, formula syntax, keyboard shortcuts, real business use cases, and concludes with an Evaluation Dashboard (Review Questions, Verified MCQs, and 2027 Frontier Technology Spotlights).
        ]
      ]
    )
  ],
  [
    #block(
      width: 100%,
      stroke: (left: 2pt + rgb("#059669")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 5pt, y: 3pt),
      [
        #text(size: 7pt, weight: "bold", fill: rgb("#059669"))[OFFICIAL AUTHOR & INDUSTRY ACCREDITATION]\
        #v(1pt)
        #text(size: 6.3pt, fill: rgb("#1E293B"))[
          Authored by Rahul Patel (Founder & Chief Technology Architect, RTechLab). Designed for corporate accountants, data analysts, HR managers, and college students. 100% RTechLab certified with zero third-party branding.
        ]
      ]
    )
  ]
)
