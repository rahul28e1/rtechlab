#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 20]
= Conditional Formatting, In-Cell Visual Rules & Formula Heatmaps

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Conditional Formatting transforms passive rows of cold numeric data into intuitive, real-time executive visual dashboards. By dynamically evaluating values against statistical benchmarks and custom boolean formulas, it illuminates anomalies, tracks project deadlines, and highlights enterprise KPI targets automatically.
]

#v(2pt)

== 20.1 Built-in Rule Architecture: Highlights & Statistical Ranks

Located on `Home > Styles > Conditional Formatting`, Excel provides pre-configured rules:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Rule Category*], [*Algorithmic Trigger Logic*], [*Enterprise Dashboard Application*]),
  [Highlight Cells Rules], [Evaluates Greater Than, Less Than, Between, or Equal To.], [Flagging overdue payments or student marks below 35 in soft red.],
  [Text that Contains], [Searches for specific text strings within cells.], [Highlighting "Pending" in amber and "Approved" in light green.],
  [Duplicate Values], [Identifies duplicate entries across selected vector range.], [Auditing voter lists or vendor tables for duplicate PAN cards.],
  [Top / Bottom Rules], [Calculates Top 10 items, Top 10%, Bottom 10%, or Below Average.], [Identifying elite sales agents or underperforming store branches.],
  [Above / Below Average], [Dynamically computes column mean; highlights deviations.], [Auditing factory manufacturing tolerances and quality defect rates.]
)

#v(2pt)
#ribbon-specimen(path: "Home > Styles > Conditional Formatting > Highlight Cells Rules", command: "Flag Value Deviations & Duplicates", shortcut: "Alt + H + L + H")
#v(2pt)

== 20.2 In-Cell Visual Analytics: Data Bars, Color Scales & Icon Sets

To visualize distribution without inserting external floating charts:
- *Data Bars*: Injects horizontal micro-bar charts directly inside each numeric cell. Higher values show longer colored bars. Modern Excel 365 supports *Bidirectional Data Bars* where negative numbers grow left in red and positives grow right in green!
- *Color Scales (Heatmaps)*: Applies a 2-color or 3-color gradient (e.g. Green-Yellow-Red). The minimum value receives deep red, the 50th percentile receives neutral yellow, and the maximum receives emerald green.
- *Icon Sets*: Embeds traffic lights (Red, Amber, Green circles), directional arrows, or checkmarks/crosses based on percentile thresholds ($>=67%$, $>=33%$, $<33%$).

#pagebreak()

== 20.3 Advanced Formula Rules: Highlighting Entire Rows

The most critical corporate skill in Conditional Formatting is highlighting an **entire row** based on the value of a single status column (e.g., if Status in Column E is "CRITICAL", format columns A through G in light red):

```
Formula Syntax: =$E2="CRITICAL"
```

*The 5-Step Flawless Implementation Protocol*:
1. Highlight the entire table data body (e.g. `A2:G100`). Do NOT include the header row.
2. Go to `Home > Styles > Conditional Formatting > New Rule`.
3. Select *Use a formula to determine which cells to format*.
4. In the formula box, type:
   ```
   =$E2="CRITICAL"
   ```
   *Notice the mixed reference*: The dollar sign precedes column E (`$E2`), locking the evaluation vector to column E, while the row number `2` remains relative, allowing the rule to evaluate row-by-row!
5. Click *Format*, choose a soft pastel fill (e.g. Light Red), and click *OK*. All rows marked "CRITICAL" illuminate across all 7 columns!

#v(2pt)
#formula-specimen(title: "ENTIRE ROW CONDITIONAL FORMATTING RULE", formula: "=$E2=\"CRITICAL\"", note: "Locking the column ($E) ensures all columns across the row evaluate the same trigger cell.")
#v(2pt)

== 20.4 Alternating Zebra Striping with MOD & ROW

When printing massive multi-page financial ledgers, alternating row shading improves reading accuracy. Instead of static table styles, apply a dynamic formula rule:

```
Formula: =MOD(ROW(), 2) = 0
```

- `=ROW()` returns the current row number.
- `=MOD(row, 2)` returns `0` for even rows (2, 4, 6) and `1` for odd rows.
- Format with a soft 5% gray or slate fill.
- *Advantage*: When rows are deleted or inserted, the zebra striping automatically re-balances without creating double-colored rows!

#pagebreak()

== 20.5 Multi-Condition Rules & Cross-Column Auditing

Corporate compliance audits require evaluating multiple parallel conditions simultaneously:

- *Highlight Overdue Invoices*:
  ```
  =AND($D2="Unpaid", $C2 < TODAY() - 30)
  ```
  Highlights invoices that are strictly "Unpaid" AND older than 30 days past due.
- *Highlight Duplicates Across Two Combined Columns*:
  ```
  =COUNTIFS($A:$A, $A2, $B:$B, $B2) > 1
  ```
  Flags records where the combination of First Name (Col A) and Last Name (Col B) appears more than once, ignoring single-name coincidences!
- *Highlight Approaching Expiration Dates (Next 7 Days)*:
  ```
  =AND($B2 >= TODAY(), $B2 <= TODAY() + 7)
  ```

#v(2pt)
#formula-specimen(title: "OVERDUE AGING AUDIT RULE", formula: "=AND($D2=\"Unpaid\", $C2 < TODAY() - 30)", note: "Highlights accounts receivable balances exceeding 30-day payment terms.")
#v(2pt)

== 20.6 The Rules Manager Console & Stop If True Logic

The *Conditional Formatting Rules Manager* (`Home > Styles > Conditional Formatting > Manage Rules` or `Alt + H + L + R`) governs rule execution:
- *Rule Precedence*: Rules higher in the list take precedence over rules lower in the stack. Use the *Move Up* / *Move Down* arrow buttons to prioritize critical rules.
- *Stop If True Checkbox*: If checked, instructs Excel: once this rule evaluates to true and applies formatting, **cease evaluating any subsequent lower rules** for that cell! This prevents lower-priority background fills from overwriting high-priority alert fills.

#pagebreak()

== 20.7 Production Blueprint: Employee KPI Performance Dashboard

Below is a verified production scorecard featuring Data Bars, Traffic Icons, and Row Highlighting:

#table(
  columns: (1fr, 2fr, 1.2fr, 1.3fr, 1.2fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Emp ID*], [*Employee Name*], [*Sales Target*], [*Actual Sales*], [*Achievement*], [*KPI Visual Status*]),
  [EMP-01], [Rahul Patel], [₹ 50,00,000], [₹ 62,50,000], [125%], [Green Icon (Exceeded)],
  [EMP-02], [Amit Sharma], [₹ 40,00,000], [₹ 38,00,000], [95%], [Amber Icon (Target Met)],
  [EMP-03], [Sneha Sen], [₹ 45,00,000], [₹ 27,00,000], [60%], [Red Icon (Under Target)]
)

#v(2pt)

== 20.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "In custom formula =$D2>100, why is the column locked with a dollar sign?", ans: "To ensure every cell across that row checks column D rather than shifting.")
    #short-qa(num: 2, q: "Which formula creates automated alternating zebra striping on even rows?", ans: "=MOD(ROW(), 2) = 0.")
    #short-qa(num: 3, q: "What does the 'Stop If True' checkbox accomplish in Rules Manager?", ans: "Halts evaluation of lower-ranked formatting rules once the current rule matches.")
    #short-qa(num: 4, q: "Which visual format applies a gradient heatmap across numeric distributions?", ans: "Color Scales.")
  ],
  [
    #mcq(num: 1, q: "To highlight cells in column B that have values greater than the average of column B, which built-in rule is used?", a: "Highlight Cells > Greater Than", b: "Top/Bottom Rules > Above Average", c: "Data Bars", d: "Icon Sets", ans: "B", expl: "Top/Bottom Rules > Above Average dynamically computes the mean and formats above-average values.")
    #mcq(num: 2, q: "What happens if you omit the dollar sign in the formula rule =D2>100 applied to A2:F100?", a: "Formula fails", b: "Each column checks its own relative column (Col A checks Col D; Col B checks Col E), breaking row alignment", c: "Excel crashes", d: "Row is highlighted green", ans: "B", expl: "Without locking the column ($D), the reference shifts relatively across columns.")
    #mcq(num: 3, q: "Which tool opens the master console to delete, reorder, or modify conditional formatting rules?", a: "Format Cells", b: "Manage Rules", c: "Name Manager", d: "Styles Pane", ans: "B", expl: "Conditional Formatting > Manage Rules provides full administrative control over all rules.")
  ]
)

#v(2pt)

#spotlight-box("2027 REAL-TIME STREAMING HEATMAPS", [
  Excel 365 Enterprise connects to real-time IoT and stock ticker data feeds via WebSockets. Conditional Formatting evaluates streaming values in real-time, flashing green or red micro-accents dynamically at 60 frames per second without locking the UI thread.
])
