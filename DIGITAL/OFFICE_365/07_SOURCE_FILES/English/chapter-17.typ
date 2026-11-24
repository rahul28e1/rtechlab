#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 17]
= Advanced Text, String Manipulation & Data Sanitization Engines

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Real-world corporate data exported from enterprise ERPs, SAP, or web portals is notoriously fragmented, populated with irregular whitespace, concatenated names, and mixed delimiters. Mastering modern text joining, substring slicing, pattern searching, and data cleansing functions transforms dirty records into pristine data pipelines.
]

#v(2pt)

== 17.1 Modern String Joining: TEXTJOIN vs. CONCAT vs. Ampersand (&)

In legacy Excel, combining 20 cells required typing `=A1 & ", " & B1 & ", " & C1...` or the cumbersome `=CONCATENATE`. In Excel 365, the `=TEXTJOIN` function redefines string merging:

```
Syntax: =TEXTJOIN( delimiter , ignore_empty , text1 , [text2]... )
```

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function / Operator*], [*Operational Mechanics*], [*Enterprise Behavior & Advantages*]),
  [`TEXTJOIN`], [Merges ranges with a universal delimiter; skips blanks automatically.], [Merges entire column `=TEXTJOIN(", ", TRUE, A2:A50)` in 1 step!],
  [`CONCAT`], [Combines ranges of cells without delimiters.], [Replaces obsolete CONCATENATE; accepts full ranges `=CONCAT(B2:D2)`.],
  [`&` (Ampersand)], [Low-level string concatenation operator.], [Ideal for quick 2-token joins (e.g. `="Total: " & C10`).]
)

#v(2pt)
#formula-specimen(title: "DELIMITED VENDOR LIST TEXTJOIN", formula: "=TEXTJOIN(\"; \", TRUE, Vendor_Names_Col)", note: "Builds a semicolon-delimited recipient list for bulk Outlook emailing, skipping empty cells.")
#v(2pt)

== 17.2 The TEXT Function: Dynamic Formatting Inside Sentences

When numerical quantities, dates, or currency amounts are joined with text strings via ampersand, Excel strips their formatting and displays raw serial numbers:
- `="Today is " & TODAY()` -> Displays: `Today is 46388` (Unacceptable in corporate reports!)
- *The Fix*: Use the `=TEXT` function to enforce custom masks:
  ```
  ="Invoice generated on " & TEXT(TODAY(), "dddd, mmmm dd, yyyy") & " for amount " & TEXT(C2, "₹ #,##,##0.00")
  ```
  *Result*: "Invoice generated on Thursday, April 15, 2027 for amount ₹ 1,45,000.00".

#pagebreak()

== 17.3 Substring Slicing Mechanics: LEFT, RIGHT, MID & LEN

Slicing fixed or variable character tokens from structured product SKUs or employee codes:

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function Syntax*], [*Operational Action*], [*Enterprise Specimen (Target: "RTL-SRV-2027")*]),
  [`=LEFT(text, [num_chars])`], [Extracts characters starting from far left.], [`=LEFT(A2, 3)` returns `"RTL"` (Company prefix).],
  [`=RIGHT(text, [num_chars])`], [Extracts characters starting from far right.], [`=RIGHT(A2, 4)` returns `"2027"` (Fiscal year).],
  [`=MID(text, start, num)`], [Extracts characters from any internal index.], [`=MID(A2, 5, 3)` returns `"SRV"` (Server category).],
  [`=LEN(text)`], [Returns total character count including spaces.], [`=LEN(A2)` returns `12` characters.]
)

#v(2pt)
#concept-box(title: "CRITICAL TEXT-TO-NUMBER CONVERSION: VALUE FUNCTION", [
  Tokens extracted using `LEFT`, `RIGHT`, or `MID` are treated by Excel as **text strings**, even if they consist purely of digits! Any mathematical formula evaluating `=LEFT("100", 2) + 5` may fail in legacy models. Wrap extracted numeric substrings in `=VALUE(...)` or multiply by `1` (e.g., `=LEFT(A2, 2) * 1`) to cast them back into real numbers.
])

#v(2pt)

== 17.4 Searching for Delimiters: FIND vs. SEARCH

To extract variable-length substrings (such as extracting a first name when names have different character counts), you must dynamically find the position of the separating space:

#table(
  columns: (1fr, 1.3fr, 2.7fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function*], [*Case Sensitivity*], [*Matching Characteristics*], [*Wildcard Support*]),
  [`FIND`], [Case-Sensitive], [Exact match: `=FIND("P", "Rahul Patel")` returns 7. `=FIND("p", "Rahul Patel")` throws `#VALUE!`.], [No],
  [`SEARCH`], [Case-Insensitive], [Lenient match: `=SEARCH("patel", "Rahul Patel")` returns 7 without error.], [Yes (`*`, `?`)]
)

#pagebreak()

== 17.5 Dynamic Name Extraction Formula: Slicing Variable Strings

When separating "Rahul Patel" into First Name and Last Name across 5,000 employee records, combine `LEFT`, `RIGHT`, `MID`, `FIND`, and `LEN`:

- *Dynamic First Name Extraction*:
  ```
  =LEFT(A2, FIND(" ", A2) - 1)
  ```
  Finds the space at index 6, subtracts 1, and takes the leftmost 5 characters -> `"Rahul"`.
- *Dynamic Last Name Extraction*:
  ```
  =RIGHT(A2, LEN(A2) - FIND(" ", A2))
  ```
  Total length (11) minus space position (6) = 5 characters from the right -> `"Patel"`.
- *Dynamic Corporate Email Domain Extraction* (e.g. from `rahul.patel@rtechlab.com`):
  ```
  =MID(A2, FIND("@", A2) + 1, LEN(A2) - FIND("@", A2))
  ```
  Extracts everything after the `@` symbol -> `"rtechlab.com"`.

#v(2pt)
#formula-specimen(title: "DOMAIN EXTRACTION MASTER FORMULA", formula: "=MID(A2, FIND(\"@\", A2) + 1, 255)", note: "Passing 255 as character count extracts all remaining characters to the end of the email string.")
#v(2pt)

== 17.6 Data Sanitization Suite: TRIM, CLEAN & Case Normalization

Dirty database dumps often fail exact VLOOKUP or XLOOKUP matches because of invisible trailing spaces.
- `=TRIM(text)`: Strips all leading, trailing, and duplicate spaces, leaving strictly single spaces between words. (Mandatory pre-processing step for all lookup keys!).
- `=CLEAN(text)`: Strips non-printable ASCII control characters ($0$ through $31$) imported from mainframe databases.
- `=PROPER(text)`: Converts messy text like `"rAhUL pATel"` into clean corporate title case `"Rahul Patel"`.
- `=UPPER(text)` & `=LOWER(text)`: Standardizes tax identification numbers (PAN/GSTIN) into uppercase.

#pagebreak()

== 17.7 Data Tab: Text to Columns Wizard

Under `Data > Data Tools > Text to Columns` (`Alt + A + E`), Excel provides a non-formula dialog to split delimited columns into adjacent fields:
1. *Delimited*: Split by Tab, Semicolon, Comma, Space, or custom characters (e.g. `/` or `-`).
2. *Fixed Width*: Drag vertical break lines across a monospace data preview.
3. *Column Data Format*: Set date columns to `YMD` or `DMY` to prevent international date corruption, or format postal codes as `Text` to preserve leading zeros.

#v(2pt)

== 17.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which text function joins a range of cells using a delimiter while skipping blank cells?", ans: "TEXTJOIN function.")
    #short-qa(num: 2, q: "What is the key difference between FIND and SEARCH functions?", ans: "FIND is case-sensitive; SEARCH is case-insensitive and supports wildcards.")
    #short-qa(num: 3, q: "Which function converts text into proper title case with capitalized first letters?", ans: "PROPER function.")
    #short-qa(num: 4, q: "Why does =\"Due: \" & TODAY() display a 5-digit number instead of a date?", ans: "Ampersand strips visual formatting; use =\"Due: \" & TEXT(TODAY(), \"dd-mm-yyyy\").")
  ],
  [
    #mcq(num: 1, q: "What does formula =TRIM(\"  RTechLab   Systems  \") return?", a: "\"RTechLabSystems\"", b: "\"RTechLab Systems\"", c: "\"  RTechLab   Systems  \"", d: "#VALUE!", ans: "B", expl: "TRIM strips leading, trailing, and redundant middle spaces, preserving single spaces.")
    #mcq(num: 2, q: "If cell A1 contains 'INV-2027-450', which formula extracts the year '2027'?", a: "=LEFT(A1, 4)", b: "=MID(A1, 5, 4)", c: "=RIGHT(A1, 4)", d: "=EXTRACT(A1, 5, 4)", ans: "B", expl: "Starting at position 5 for 4 characters extracts '2027'.")
    #mcq(num: 3, q: "Which tool splits a column containing 'City, State' into two columns without writing formulas?", a: "Data Validation", b: "Text to Columns", c: "Consolidate", d: "Scenario Manager", ans: "B", expl: "Text to Columns (Data > Text to Columns) parses delimited text across adjacent columns.")
  ]
)

#v(2pt)

#spotlight-box("2027 REGEX PATTERN FUNCTIONS IN EXCEL 365", [
  Excel 365 natively incorporates regular expression functions: `=REGEXTEST(text, pattern)`, `=REGEXEXTRACT(text, pattern)`, and `=REGEXREPLACE(text, pattern, replacement)`. Analysts can extract Indian PAN numbers (`[A-Z]{5}[0-9]{4}[A-Z]`) or telephone numbers using concise standard regex syntax directly in grid formulas.
])
