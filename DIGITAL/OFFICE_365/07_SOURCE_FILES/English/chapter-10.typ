#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 10]
= Review Tab, Document Governance & 5 Corporate Production Labs

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Enterprise document lifecycle management requires strict auditing governance, collaborative redlining, version comparison, and tamper-resistant password protection. This capstone chapter covers the Review Tab mechanisms and deploys 5 comprehensive real-world production labs.
]

#v(2pt)

== 10.1 Review Tab Architecture: Track Changes & Redline Auditing

Collaborative contract negotiation relies on Word's *Track Changes* engine (`Review > Tracking > Track Changes` or `Ctrl + Shift + E`):

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Tracking Lever*], [*Operational Mechanics & Scope*], [*Enterprise Collaboration Role*]),
  [Track Changes (`Ctrl + Shift + E`)], [Logs all character insertions, deletions, and formatting edits.], [M&A contract negotiation between opposing corporate legal teams.],
  [Display for Review], [Simple Markup (red bar in margin), All Markup, No Markup, Original.], [Simple Markup provides clean reading while keeping edits tracked.],
  [Reviewing Pane], [Vertical or horizontal sidebar tallying all revisions, authors & times.], [Comprehensive executive audit of legal counter-proposals.],
  [Accept / Reject Engine], [Accept/Reject current change, or Accept All Changes in Document.], [Finalizing clean copy before executive signature and distribution.],
  [Compare Documents], [Compares two separate versions of a `.docx` file into a redline delta.], [Detecting sneaky unauthorized edits made without Track Changes enabled.]
)

#v(2pt)
#ribbon-specimen(path: "Review > Compare > Compare Documents", command: "Algorithmic Legal Redline Delta Comparison", shortcut: "Alt + R + M + C")
#v(2pt)

== 10.2 Restrict Editing & Enterprise Document Protection

Under `Review > Protect > Restrict Editing`, administrators enforce security boundaries:
1. *Formatting Restrictions*: Restricts document styling to a pre-approved corporate Style Set, preventing rogue fonts.
2. *Editing Restrictions*:
   - *No changes (Read only)*: Entire document is locked against all edits.
   - *Filling in forms*: Protects all document text, allowing users to interact *only with form fields and dropdowns*.
   - *Comments only*: Users can read and attach comment bubbles but cannot alter a single character of body text.
   - *Tracked changes*: Forces Track Changes permanently on; users cannot make edits without logging their identity.
3. *Start Enforcement*: Protect with an AES-256 password to lock the administrative settings.


#v(3pt)
#align(center)[
  #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/word-customize-map.png", width: 95%, height: 110pt, fit: "contain")
  #v(1pt)
  #text(size: 6.8pt, fill: rgb("#64748B"), style: "italic")[
    Figure 10.1: Word 365 Quick Access Toolbar & Ribbon Customization Command Mapping.
  ]
]

#pagebreak()

== 10.3 Corporate Production Lab 1: Executive Annual Business Report

#block(
  stroke: 0.5pt + rgb("#0284C7"),
  fill: rgb("#F0F9FF"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#0284C7"))[LAB 1: ANNUAL STRATEGIC REPORT BLUEPRINT (30-PAGE ENTERPRISE SPEC)]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Build an audited 30-page annual shareholder report incorporating multi-tier pagination, corporate styles, and automated indexing.\
      *Execution Sequence*:
      1. *Page 1 (Cover Page)*: Insert `Insert > Pages > Cover Page` (Facet style). Tag Company: RTechLab Systems; Title: Annual Report 2027. Set `Different First Page` to eliminate headers/footers.
      2. *Page 2 (Executive Summary)*: Apply `Heading 1` (Aptos Display 20pt Bold `#0F172A`). Line spacing 1.15, Spacing After 8pt.
      3. *Page 3 (Table of Contents)*: Insert `Layout > Breaks > Section Break (Next Page)`. Insert `References > Table of Contents > Automatic Table 1`.
      4. *Header/Footer Partitioning*: In Section 2 (Pages 2-3), format footers as Roman numerals (i, ii) starting at i.
      5. *Page 4 (Chapter 1)*: Insert `Layout > Breaks > Section Break (Next Page)`. Double-click footer, click *Link to Previous* to *Turn Off*. Format page numbers as Arabic (1, 2, 3) starting at 1.
      6. *Dynamic Running Header*: In Section 3 header, insert `{ STYLEREF "Heading 1" }` on right, separated by a 0.5pt rule.
      7. *Final Build*: Press `Ctrl + A` and tap `F9` to synchronize all page counts. Export to PDF via `File > Export`.
    ]
  ]
)

#v(2pt)

== 10.4 Corporate Production Lab 2: Modern ATS-Optimized Professional Resume

#block(
  stroke: 0.5pt + rgb("#059669"),
  fill: rgb("#ECFDF5"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#059669"))[LAB 2: ATS-COMPLIANT EXECUTIVE RESUME / CV SPECIFICATION]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Create a high-converting, ATS (Applicant Tracking System) compliant resume with zero formatting bleed.\
      *Execution Sequence*:
      1. *Canvas Geometry*: `Layout > Margins > Narrow` (0.5" Top, Bottom, Left, Right). Single-column layout (multi-column layouts fail OCR parsers).
      2. *Header Block*: Name in `Heading 1` (22pt Bold). Contact strip beneath using tab leaders: Phone | Email | LinkedIn | Bangalore, India.
      3. *Structural Sections*: Section titles (Summary, Technical Skills, Professional Experience, Education) tagged strictly with `Heading 2` (12pt Bold, `#0F172A` with 0.75pt bottom border rule).
      4. *Core Experience Matrix*: Clean table without vertical borders (`Borders > Inside Horizontal Border only`). Left column: Company & Title; Right column (Right-aligned): Dates & Location.
      5. *Bullet Deliverables*: Apply `List Bullet` with strong action verbs (Engineered, Architected, Reduced).
      6. *ATS Pre-Flight Audit*: Save as `.docx` and test text extraction in Notepad to confirm zero character scrambling.
    ]
  ]
)

#pagebreak()

== 10.5 Corporate Production Lab 3: Bulk Employee Offer Letters via Mail Merge

#block(
  stroke: 0.5pt + rgb("#D97706"),
  fill: rgb("#FFFBEB"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#D97706"))[LAB 3: BULK HR APPOINTMENT DISPATCH INTEGRATION]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Merge 250 appointment letters from an Excel candidate database with custom CTC and relocation logic.\
      *Execution Sequence*:
      1. *Data Source Setup*: Create `candidates.xlsx` with headers `Candidate_Name`, `Address`, `City`, `CTC`, `Joining_Date`, `Relocation`. Save and close Excel.
      2. *Connect Source*: In Word master template, go to `Mailings > Select Recipients > Use an Existing List` and select `candidates.xlsx`.
      3. *Insert Placeholders*: Insert `«Candidate_Name»`, `«City»`, and `«Joining_Date»`.
      4. *Apply Picture Switches*: Select `«CTC»`, press `Shift + F9`, and edit to `{ MERGEFIELD CTC \# "₹ #,##,##0" }`. Edit joining date to `{ MERGEFIELD Joining_Date \@ "dd-MM-yyyy" }`.
      5. *Conditional Relocation Clause*: Click `Mailings > Rules > If...Then...Else...`. Set: IF `Relocation` = `"YES"`, THEN "A relocation grant of ₹ 50,000 is authorized.", ELSE "".
      6. *Preview & Batch Dispatch*: Navigate 5 records. Click `Finish & Merge > Edit Individual Documents > All`. Save compiled 250-page print run.
    ]
  ]
)

#v(2pt)

== 10.6 Corporate Production Lab 4: Legal Non-Disclosure Agreement (NDA) with Form Locking

#block(
  stroke: 0.5pt + rgb("#7C3AED"),
  fill: rgb("#FAF5FF"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#7C3AED"))[LAB 4: TAMPER-PROOF LEGAL NDA WITH RESTRICTED FORM FIELDS]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Author a commercial Non-Disclosure Agreement where counter-parties can only enter their corporate name and signature date.\
      *Execution Sequence*:
      1. *Enable Developer Tab*: `File > Options > Customize Ribbon > Check 'Developer'`.
      2. *Insert Content Controls*: Under `Developer > Controls`, insert a *Plain Text Content Control* for `[Vendor Corporate Name]` and a *Date Picker Content Control* for `[Agreement Effective Date]`.
      3. *Properties Lock*: Select the content control, click *Properties*, and check *Content control cannot be deleted*.
      4. *Enforce Document Locking*: Go to `Review > Protect > Restrict Editing`. Check *Allow only this type of editing in the document* and select *Filling in forms*.
      5. *Activate Password*: Click *Yes, Start Enforcing Protection*. Set administrative master password.
      6. *Verification*: Attempt to edit legal clauses; Word blocks all keystrokes while allowing smooth form input!
    ]
  ]
)

#pagebreak()

== 10.7 Corporate Production Lab 5: Professional Certificate of Achievement

#block(
  stroke: 0.5pt + rgb("#059669"),
  fill: rgb("#F0FDF4"),
  inset: 5pt,
  radius: 3pt,
  [
    #text(weight: "bold", size: 8pt, fill: rgb("#059669"))[LAB 5: HIGH-SECURITY CORPORATE CERTIFICATE DESIGN]\
    #v(1pt)
    #text(size: 7.2pt)[
      *Objective*: Design an executive Certificate of Achievement with vector borders, seal watermark, and Mail Merge recipient binding.\
      *Execution Sequence*:
      1. *Orientation & Geometry*: `Layout > Orientation > Landscape`. Margins: 0.75" on all four sides.
      2. *Architectural Border*: `Design > Page Borders`. Choose Art or Triple-line rule (3pt weight, `#0F172A` Navy with `#0284C7` inner border).
      3. *Corporate Header*: Insert company logo centered. Text: "RTECHLAB SYSTEMS LAB" in 14pt Aptos Display tracking 3pt.
      4. *Certificate Title*: "CERTIFICATE OF ACHIEVEMENT" in 28pt Bold `#0F172A`. Subtitle: "PROUDLY PRESENTED TO".
      5. *Merge Name Holder*: Insert `«Student_Name»` in 24pt Georgia Bold with subtle bottom underline.
      6. *Verification Seal*: Insert circular gold seal SVG (`Wrap Text > Behind Text`).
      7. *Digital Signature Strip*: Dual signature blocks at bottom: Left (Technical Director), Right (Chief Architect Rahul Patel).
    ]
  ]
)

#v(2pt)

== 10.8 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which key combination toggles Track Changes mode on/off instantly?", ans: "Ctrl + Shift + E.")
    #short-qa(num: 2, q: "Which restriction mode locks body text while permitting form field entry?", ans: "'Filling in forms' restriction mode.")
    #short-qa(num: 3, q: "Which tool algorithmically compares two documents to reveal unrecorded edits?", ans: "Review > Compare > Compare Documents.")
    #short-qa(num: 4, q: "Which tab houses Content Controls for interactive date pickers?", ans: "Developer Tab.")
  ],
  [
    #mcq(num: 1, q: "What is the primary technical reason ATS resume screeners reject multi-column resumes?", a: "Too colorful", b: "OCR text parsing engines read across columns horizontally, scrambling employment history", c: "File size is too small", d: "Word crashes", ans: "B", expl: "Applicant Tracking Systems parse text left-to-right, garbling parallel column text.")
    #mcq(num: 2, q: "In Track Changes, which display mode hides redline markups while keeping edits active?", a: "All Markup", b: "Original", c: "Simple Markup", d: "No Markup", ans: "C", expl: "Simple Markup shows a clean draft with red margin indicators where edits occurred.")
    #mcq(num: 3, q: "To allow third parties to fill in date pickers but prevent text alteration, which tool is used?", a: "Inspect Document", b: "Restrict Editing > Filling in forms", c: "Split Window", d: "Drop Cap", ans: "B", expl: "'Filling in forms' locks all canvas regions except designated form content controls.")
  ]
)

#v(2pt)

#spotlight-box("2027 AUTOMATED CONTRACT COMPLIANCE AUDITING", [
  Word 365 Copilot AI automates legal contract redlining. By prompting "Review this vendor NDA against our standard corporate risk playbook", Copilot identifies missing indemnification clauses, highlights unfavorable liability caps, and generates pre-tracked counter-amendments ready for legal counsel review.
])
