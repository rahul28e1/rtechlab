import os
import subprocess
import fitz

def generate_career_blueprint():
    bp_dir = "DIGITAL/OFFICE_365/04_CAREER_AND_SALARY_BLUEPRINT"
    src_dir = os.path.join(bp_dir, "source")
    os.makedirs(src_dir, exist_ok=True)
    typ_path = os.path.join(src_dir, "career-and-salary-blueprint.typ")
    pdf_out = os.path.join(bp_dir, "Office-365-MIS-Career-and-Salary-Blueprint-Edition-1.pdf")

    typ_content = r"""#import "/DIGITAL/OFFICE_365/07_SOURCE_FILES/07_PUBLISHING_ENGINE/master-theme.typ": *
#import "/DIGITAL/OFFICE_365/07_SOURCE_FILES/07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab Office 365 & MIS Analyst Career & Salary Blueprint (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5(
  title: "OFFICE 365 & MIS CAREER BLUEPRINT",
  subtitle: "2027 Corporate Salary Matrix · MIS Career Ladders · 30 ATS Resume Bullets · 30-Day Interview Action Plan",
  edition: "2027 CAREER ACCELERATOR EDITION · EDITION 1",
  series-pill: "RTECHLAB COMMERCIAL SUITE · CAREER BLUEPRINT EDITION 1",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-O365-CAREER-ED1",
  logo-path: "/DIGITAL/OFFICE_365/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg"
)

// PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Office 365 & MIS Analyst Career Blueprint",
  edition: "2027 Career Accelerator Edition · Edition 1 Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-O365-CAREER-ED1"
)

#pagebreak()

= 2027 ENTERPRISE MIS & ANALYTICS MARKET LANDSCAPE

#concept-box(title: "EXECUTIVE MARKET OVERVIEW (INDIA & GLOBAL)")[
  In the 2027 enterprise ecosystem, the traditional role of "back-office data operator" has become completely obsolete. Fortune 500 corporations, Big 4 accounting firms, global investment banks, and fast-scaling tech companies require data-driven *MIS Executives, Financial Analysts, and Automation Architects* who can transform raw transactional records into actionable C-Suite intelligence. Mastery of Microsoft 365, Modern Dynamic Arrays, Power Query ETL pipelines, and Copilot AI automation forms the single highest-ROI entry point into lucrative corporate technology careers.
]

#v(2pt)

== 1. The 2027 Productivity Revolution: Why Old Skills Are Dead
The transition from legacy Office 2016/2019 to modern Microsoft 365 Enterprise has fundamentally disrupted corporate workflows:
- *From Manual VLOOKUP to Dynamic Array Engines*: Modern corporate reporting mandates `XLOOKUP`, `FILTER`, `UNIQUE`, `SORT`, and `LET`. Teams no longer tolerate brittle lookup references that break when column orders change.
- *From Copy-Paste Reporting to Automated ETL Pipelines*: Power Query has replaced 90% of manual consolidation. Data from ERP exports (SAP, Oracle, Tally Prime) is cleaned, transformed, and loaded into analytical models with a single click.
- *From Static Slides to Dynamic Visual Narratives*: PowerPoint 365 Morph transitions, interactive summary zoom, and the 6x6 cognitive presentation rule are now mandatory standards for senior leadership and investor boardrooms.
- *From Siloed Files to Cloud Co-Authoring & Copilot AI*: Real-time collaboration via OneDrive and SharePoint, combined with Copilot prompt engineering, allows one analyst to accomplish the weekly output of an entire 5-person team.

#v(2pt)

== 2. Industry Hiring Demand Across Indian Tech Hubs (2027 Projections)
#table(
  columns: (1.4fr, 1.3fr, 1.7fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Enterprise Sector*], [*Major Indian Hubs*], [*Dominant Hiring Roles*], [*Core Technical Competencies Required*]),
  [Banking & Financial Services (BFSI)], [Mumbai, Bengaluru, Gurgaon], [Financial Analyst, Credit MIS, Risk Reporting Lead], [Financial Modeling (DCF/NPV), XLOOKUP, Data Validation, Pivot Timelines.],
  [IT Services & Global Capability Centers], [Bengaluru, Hyderabad, Pune, Noida], [MIS Lead, BI Analyst, Operations Manager], [Power Query ETL, DAX Data Models, Automated SLA Tracking, OneDrive Sharing.],
  [E-Commerce & Supply Chain Logistics], [Gurgaon, Bengaluru, Chennai], [Supply Chain Analyst, Inventory Controller], [Safety Stock Modeling, Multi-tier Commission Matrices, Dynamic Dashboards.],
  [Management Consulting & Big 4], [Gurgaon, Mumbai, Bengaluru], [Valuation Analyst, Strategy Associate], [C-Suite Pitch Decks, Executive Word Publishing, 3-Statement Modeling.],
  [Healthcare & Pharmaceuticals], [Hyderabad, Ahmedabad, Pune], [Clinical Trial MIS, Compliance Auditor], [Strict Version Control, Document Protection, Audit Trail Verification.]
)

#v(2pt)

== 3. Real-World Case Study: The 14-Hour Weekly Productivity Shift
#table(
  columns: (1.5fr, 2.6fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Operational Workflow*], [*Legacy Manual Approach (Amateur)*], [*Modern Automated Approach (RTechLab Pro)*]),
  [Weekly Branch Consolidation], [Manual download of 24 CSVs, copy-pasting into master sheet, fixing formula broken refs (7.5 Hours).], [Power Query folder connector: 1-click 'Refresh All' cleans and aggregates all branch CSVs in 18 seconds.],
  [Monthly Vendor Invoicing], [Typing customer names and tax numbers by hand, re-calculating CGST/SGST line by line (4.0 Hours).], [Excel Data Validation with dynamic XLOOKUP tax tables and automated Number-to-Words script (8 minutes).],
  [Executive Board Reporting], [Taking screenshots of Excel charts, pasting into PowerPoint, manually resizing shapes (2.5 Hours).], [Live linked Excel-PowerPoint charts that auto-refresh, formatted with Morph executive transitions (5 minutes).]
)

#v(2pt)

#spotlight-box("THE 2027 SALARY MULTIPLIER PRINCIPLE", [
  Corporate recruiting data proves that professionals who pair advanced Excel modeling with Power Query automation and professional Word/PPT executive presentation command a #hl[45% to 75% salary premium] over peers possessing only foundational computer literacy.
])

#pagebreak()

= 2027 CORPORATE CTC SALARY MATRIX & COMPENSATION BENCHMARKS

#concept-box(title: "COMPENSATION METHODOLOGY & BENCHMARKS")[
  Salary benchmarks reflect verified 2027 annual Cost-to-Company (CTC) compensation across Tier-1 Indian metropolitan tech hubs (Bengaluru, Mumbai, NCR-Delhi/Gurgaon, Hyderabad, Pune, Chennai). Figures include fixed base salary, statutory retiral benefits (PF, Gratuity), and performance-linked annual variable incentives.
]

#v(2pt)

== 1. Compensation by Experience Level & Corporate Role (India CTC in INR)
#table(
  columns: (1.5fr, 0.9fr, 1.4fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Target Professional Role*], [*Experience*], [*Annual CTC Range (INR)*], [*Core Technical Responsibility & Deliverables*]),
  [Junior MIS Executive / Data Specialist], [0–2 Years], [₹3.8L – ₹5.8L], [Daily transactional reporting, data cleaning, basic pivot tables, standard Word formatting.],
  [Senior MIS & Financial Analyst], [2–5 Years], [₹6.5L – ₹10.5L], [Automated Power Query pipelines, dynamic array financial models, monthly MIS dashboards.],
  [Lead Business Intelligence Specialist], [5–8 Years], [₹11.0L – ₹17.5L], [Multi-source data warehouse integration, executive C-Suite dashboards, VBA & Office Scripts.],
  [Analytics Manager / Automation Lead], [8–12 Years], [₹18.0L – ₹28.0L], [Cross-functional analytics governance, enterprise cloud deployment, Copilot AI integration.],
  [Director of Business Intelligence / CAO], [12+ Years], [₹30.0L – ₹55.0L+], [Enterprise data strategy, executive board reporting, large-scale automation architecture.]
)

#v(2pt)

== 2. City-Tier Cost of Living vs. Net In-Hand Multiplier
#table(
  columns: (1.4fr, 1.1fr, 1.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*City Tier Classification*], [*Typical Hubs*], [*Benchmark Index*], [*Corporate Housing & Relocation Dynamics*]),
  [Tier-1 Premium Metros], [Bengaluru, Mumbai, Gurgaon], [100% (Baseline)], [Highest base compensation; 30-40% higher living cost; greatest MNC density.],
  [Tier-1 Balanced Hubs], [Hyderabad, Pune, Chennai], [90% – 95%], [Optimal savings ratio; booming GCC tech parks; lower rental expenditure.],
  [Tier-2 Emerging Commercial], [Ahmedabad, Jaipur, Indore, Kochi], [70% – 82%], [Rapidly growing domestic corporate HQs; lower living costs yield high net savings.],
  [Global USD Remote Contracts], [US / UK / GCC Clients], [\$25 – \$65 / hr], [Freelance & full-time remote contracts; annualized ₹35L to ₹90L+ INR equivalent.]
)

#v(2pt)

== 3. Typical Corporate Salary Structure Breakdown (₹10,00,000 CTC Baseline)
#table(
  columns: (1.8fr, 1.2fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Component*], [*Annual Amount*], [*Statutory Rule & Tax Implication*]),
  [Basic Salary], [₹4,00,000 (40%)], [Fully taxable; forms statutory base for PF and Gratuity calculations.],
  [House Rent Allowance (HRA)], [₹2,00,000 (20%)], [Tax-exempt under Section 10(13A) subject to actual rent paid and metro limits.],
  [Special / Flexi Allowances], [₹2,40,000 (24%)], [Fully taxable; includes transport, communication, and performance allowances.],
  [Employer Provident Fund (PF)], [₹48,000 (4.8%)], [Statutory 12% contribution on Basic; tax-exempt up to statutory caps.],
  [Statutory Gratuity Provision], [₹19,230 (1.9%)], [Calculated at 15/26 of monthly basic per completed year of service.],
  [Performance Variable Bonus], [₹92,770 (9.3%)], [Annual incentive paid against departmental KPI and individual performance goals.]
)

#v(2pt)

== 4. Performance Bonus & In-Demand Skill Premiums
- *Power Query & M-Code Premium*: Candidates demonstrating live data transformation pipelines earn 15-20% above standard salary bands.
- *Copilot AI & Prompt Engineering*: Analysts certified in Microsoft Copilot prompt workflows gain an automatic fast-track to Senior Analyst titles.

#pagebreak()

= CORPORATE CAREER LADDERS & PROMOTION HIERARCHIES

#concept-box(title: "THE 5-TIER ANALYTICS ADVANCEMENT MODEL")[
  A successful corporate career is not accidental; it follows a predictable trajectory governed by tool mastery, business domain expertise, and executive leadership presence. Understand where you stand today and the exact technical milestones required to ascend to the next pay bracket.
]

#v(2pt)

== 1. The 5-Stage Corporate Career Ladder
#table(
  columns: (0.7fr, 1.5fr, 1.1fr, 2.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Stage*], [*Job Designation*], [*Typical Tenure*], [*Required Skill Evolution & Primary Deliverables*]),
  [Tier 1], [Junior MIS Specialist / Data Associate], [1–2 Years], [Flawless data entry, keyboard shortcuts mastery, table structuring, cleaning messy text data.],
  [Tier 2], [MIS / Financial Data Analyst], [2–4 Years], [End-to-end Power Query ETL, complex nested logic (IFS/SWITCH), dynamic array models, monthly MIS packs.],
  [Tier 3], [Senior Analytics Specialist / BI Lead], [4–7 Years], [Multi-table data modeling, DAX measures, automated reconciliation engines, C-Suite dashboard design.],
  [Tier 4], [Manager – Reporting & Automation], [7–10 Years], [Process governance, team leadership, stakeholder management, cross-departmental automation architecture.],
  [Tier 5], [Director of Analytics / VP Operations], [10+ Years], [Corporate digital transformation strategy, budget oversight, executive boardroom storytelling, AI adoption.]
)

#v(2pt)

== 2. Strategic Transitions: How to Break Out of Low-Paying Data Roles
1. *Eliminate Manual Re-work First*: If you perform a manual copy-paste task more than twice a week, automate it using Power Query. Use the time saved to learn advanced financial modeling and dashboard storytelling.
2. *Deliver Insights, Not Just Numbers*: Low-earning operators send spreadsheets with raw rows and columns. High-earning analysts deliver executive summaries with key takeaways, percentage variances, and visual trend callouts.
3. *Master Executive Document Hygiene*: Presenting sloppy, unformatted reports destroys credibility. Standardize font pairings, align table headers, apply custom cell number formats (`₹#,##0.00`), and enforce consistent color branding.
4. *Bridge the Business-Technology Divide*: Understand the financial mechanics of your employer (EBITDA, Gross Margins, Operating Cash Flow, Working Capital). When you speak the language of finance, your analysis becomes indispensable to leadership.

#v(2pt)

== 3. Executive Salary Negotiation Framework for Analysts
#table(
  columns: (1.5fr, 2.5fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Negotiation Phase*], [*Proven Professional Script / Action*], [*Desired Management Outcome*]),
  [Annual Appraisal Review], ["Over the past 12 months, my Power Query automation eliminated 16 hours of weekly manual reporting across 4 departments, saving an estimated ₹6.8L in operational overhead..."], [Demonstrates quantifiable business ROI rather than subjective effort.],
  [Counter-Offer Discussions], ["I am fully dedicated to this team's roadmap; however, recent verified market benchmarks for senior financial modeling specialists indicate an industry median of ₹12.5L..."], [Positions compensation around external market data rather than emotional requests.],
  [Role Promotion Pitch], ["By transitioning to Lead Automation Specialist, I will institutionalize these data pipelines across the regional business units, onboarding 12 junior analysts to these standards..."], [Frames your salary increase as a high-leverage investment in team productivity.]
)

#v(2pt)

#spotlight-box("RAHUL SIR'S CAREER GOLDEN RULE", [
  "In corporate technology, you are not paid for the hours you spend typing in Excel; you are paid for the business risk you eliminate and the strategic decisions your reports empower. Automate the routine, master the analysis, and own the narrative."
])

#pagebreak()

= TOP 100 HIRING ENTERPRISES & INDUSTRY DEMANDS

#concept-box(title: "WHERE THE HIGHEST-PAYING JOBS ARE")[
  Top-tier multinational employers hire thousands of certified Office 365, Advanced Excel, and Business Intelligence professionals annually. These organizations maintain dedicated analytics Centers of Excellence (CoE) across Indian technology hubs.
]

#v(2pt)

== 1. Enterprise Hiring Landscapes by Industry Vertical
#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Industry Vertical*], [*Target Fortune 500 & MNC Employers*], [*What Hiring Panels Test in Technical Interviews*]),
  [Big 4 Advisory & Consulting], [Deloitte, PwC, Ernst & Young (EY), KPMG, Grant Thornton, BDO], [3-statement financial modeling, DCF valuation, flawless corporate PowerPoint deck structuring, APA-formatted Word proposals.],
  [Global Investment Banks & GICs], [JPMorgan Chase, Morgan Stanley, Goldman Sachs, Citi, Barclays, HSBC, Deutsche Bank], [Stress-tested financial amortization models, multi-million row Power Query consolidation, strict formula error trapping, audit trails.],
  [IT Services & Tech Leaders], [TCS, Infosys, Wipro, Accenture, Cognizant, HCLTech, Capgemini, Tech Mahindra], [SLA delivery dashboards, automated resource billing engines, cross-team SharePoint co-authoring workflows, global client reporting.],
  [Fintech & Fast-Growing Tech], [Razorpay, PhonePe, Paytm, Swiggy, Zomato, Zerodha, CRED, Meesho, Delhivery], [Cohort retention analysis, dynamic customer commission matrices, rapid-fire exploratory data analysis, real-time KPI dashboards.],
  [FMCG & Industrial Conglomerates], [Reliance Industries, Tata Group, Hindustan Unilever (HUL), ITC, Larsen & Toubro (L&T), Adani], [Factory inventory optimization, multi-location distributor pricing matrices, working capital schedules, automated GST invoice reconciliation.]
)

#v(2pt)

== 2. The 4-Stage Corporate Hiring Process for MIS Roles
#table(
  columns: (1fr, 1.4fr, 1.4fr, 2.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Interview Round*], [*Evaluation Method*], [*Duration*], [*Key Evaluation Criteria & Tips*]),
  [Round 1: Screening], [HR Recruiter Phone Call], [15–20 Mins], [Basic communication, salary expectations, notice period, confirmation of core tool competencies.],
  [Round 2: Practical Test], [Live Screen-Share Excel Test], [45–60 Mins], [Cleaning dirty data, writing nested XLOOKUP/FILTER formulas, building a pivot dashboard under time pressure.],
  [Round 3: Business Case], [MIS Manager Technical Viva], [45 Mins], [Formula troubleshooting (#N/A, #REF!), Power Query transformation logic, edge-case financial model testing.],
  [Round 4: Leadership], [Director / Partner Interview], [30 Mins], [Executive presence, C-Suite communication, cultural fit, willingness to lead cross-departmental automation.]
)

#v(2pt)

== 3. Proven Off-Campus Hiring Strategies
- *The Direct Referral Protocol*: Never apply blindly through open job portals where 2,000+ candidates compete. Find Senior Analysts, MIS Managers, or Alumni on LinkedIn; share a link to your live portfolio project and request an internal referral.
- *The "Sample Project" Approach*: When interviewing, bring a printed or tablet-accessible 1-page executive dashboard based on the company's publicly available quarterly financials. Demonstrating immediate competence guarantees panel buy-in.
- *Targeting Growing GICs*: Over 1,600 Global Capability Centers (GCCs) operate in India, employing over 1.7 million professionals. GICs pay 20% to 35% higher base salaries than traditional domestic IT service providers.

#pagebreak()

= IN-DEMAND CORE TECH STACK & SKILL MATRIX

#concept-box(title: "COMPETENCY MATRIX: AMATEUR VS. ENTERPRISE PRO")[
  Evaluate your current technical profile against corporate enterprise standards. Moving from Column 2 (Amateur) to Column 3 (Enterprise Pro) is the exact catalyst that doubles market value and salary compensation.
]

#v(2pt)

== Comprehensive Skill Assessment Matrix
#table(
  columns: (1fr, 2fr, 2.5fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Technology*], [*Basic Operator (Low Pay)*], [*Modern Enterprise MIS Pro (High Pay)*], [*Impact*]),
  [Excel Formulas], [SUM, AVERAGE, basic VLOOKUP with static column index numbers.], [XLOOKUP with two-way search, FILTER, UNIQUE, SORT, LET, LAMBDA.], [Critical],
  [Data Ingestion], [Manual copy-pasting from CSV exports and formatting rows by hand.], [Power Query ETL with M-code, automated folder ingestion, unpivoting.], [Critical],
  [Data Modeling], [Single huge sheets with 80 columns and scattered duplicate data.], [Relational Star Schema, Fact vs Dimension tables, DAX measures.], [High],
  [Presentation], [Raw tabular dumps with default blue borders and unformatted numbers.], [C-Suite interactive dashboards with Slicers, Timelines, dynamic KPI cards.], [High],
  [Word Publishing], [Manual spacebar centering, chaotic font sizes, default page breaks.], [Strict Heading Styles (H1-H4), Style Sets, automated TOC, Section Breaks.], [Medium],
  [PowerPoint Decks], [Walls of bullet text, clashing colors, random clip art icons.], [6x6 cognitive layout rule, Morph transitions, custom Slide Master templates.], [Medium],
  [Cloud Teamwork], [Emailing "file_v1_final_revised.xlsx" attachments back and forth.], [OneDrive/SharePoint real-time co-authoring, version history, \@mentions.], [High],
  [AI Automation], [Typing simple conversational prompts into generic public chatbots.], [Copilot AI structured prompt chaining, =PY Python in Excel data science.], [Frontier]
)

#v(2pt)

== 2. Enterprise Productivity Metrics: Manual vs. Automated
#table(
  columns: (1.5fr, 1.8fr, 1.8fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Business Metric*], [*Legacy Manual Operator*], [*Modern MIS Automation Pro*], [*Productivity Gain*]),
  [Monthly Ledger Reconciliation], [12 hours across 3 work days], [1-Click Power Query Refresh (45 sec)], [96% Reduction],
  [Commission Calculation Cycle], [2 days manual spreadsheet lookup], [Automated dynamic array model (2 min)], [98% Reduction],
  [Proposal Formatting & Dispatch], [4 hours fixing unlinked styles/TOC], [Automated Word Style Template (15 min)], [93% Reduction],
  [Executive Board Deck Prep], [6 hours rebuilding charts in PPT], [Live-linked Excel-PowerPoint deck (10 min)], [97% Reduction]
)

#v(2pt)

== 3. 2027 Frontier Technology Radar for Analysts
- *Python in Excel (`=PY`)*: Execute native Python code inside Excel cells without installing local Python environments. Use `pandas` for advanced data frames, `scipy` for statistical regressions, and `seaborn` for heatmaps.
- *Power Automate Desktop*: Automate repetitive cross-application tasks (e.g. downloading ERP invoices daily at 6:00 AM, extracting values, updating master Excel, and emailing PDF summaries to executives).
- *Office Scripts & TypeScript*: The modern cloud-native replacement for legacy VBA. Scripts execute seamlessly across Excel Desktop, Excel for Web, and Excel for Mac.

#pagebreak()

= 30 HIGH-IMPACT ATS RESUME BULLET POINTS

#concept-box(title: "ATS OPTIMIZATION PRINCIPLE (STAR METHOD)")[
  Applicant Tracking Systems (ATS) filter resumes using quantifiable metrics, action verbs, and exact technical keywords. Never write vague statements like _"Worked on Excel sheets"_. Use the STAR framework: *Situation, Task, Action, and Result* with concrete numbers.
]

#v(2pt)

== 1. Excel Modeling & Dynamic Array Automation
- Engineered a robust dynamic financial model utilizing `XLOOKUP`, `INDEX+MATCH`, and `LET` functions, reducing workbook calculation latency by 65%.
- Built automated multi-branch inventory tracking model for 4,500+ SKUs with automated safety stock reorder triggers, reducing stock-out events by 28%.
- Formulated complex multi-tier sales commission calculator using nested `IFS` and `SUMPRODUCT`, accurately processing ₹8.4Cr in quarterly team payouts.
- Designed automated corporate loan amortization schedule supporting variable interest rates and lump-sum prepayments, saving ₹14L in projected interest costs.
- Audited and rebuilt 18 legacy departmental financial sheets, eliminating circular references and deploying strict `#N/A` and `#REF!` error handling via `IFERROR`.
- Deployed dynamic spill formulas (`FILTER`, `UNIQUE`, `SORT`, `SEQUENCE`) to auto-generate department rosters, eliminating 12 hours of manual sorting weekly.
- Established rigorous Data Validation rules with dependent cascading dropdowns via `INDIRECT`, slashing transactional data entry errors by 92%.

== 2. Power Query, ETL & Automated Pipelines
- Developed end-to-end automated Power Query ETL pipeline consolidating monthly sales data across 24 regional branches, cutting reporting cycle time from 3 days to 4 minutes.
- Automated bank reconciliation workflow matching 15,000+ monthly ledger transactions against bank statements via Power Query anti-joins, identifying ₹3.2M in uncredited deposits.
- Constructed automated M-code script to ingest, clean, and unpivot multi-year vendor spending CSV files, feeding clean tabular records into corporate data warehouse.
- Eliminated manual monthly ERP export copy-pasting by building a persistent Power Query folder-connector model, saving 16 analyst hours per month.
- Implemented fuzzy matching algorithms in Power Query to reconcile vendor name discrepancies, resolving 85% of unmatched accounts payable records.
- Standardized currency conversions across 6 international subsidiaries using automated daily exchange rate feeds via Power Query web queries.
- Engineered automated data hygiene protocol stripping non-printable ASCII characters and excess whitespace across 50,000 customer records.

== 3. Executive Dashboards & Boardroom Reporting
- Designed interactive C-Suite executive sales KPI dashboard with linked slicers and timelines, enabling senior directors to conduct real-time regional variance analysis.
- Built automated HR workforce analytics dashboard tracking headcount, voluntary attrition, and compensation ratios across 1,200 employees.
- Deployed advanced Pivot Table architectures utilizing Calculated Fields and `GETPIVOTDATA` formulas to generate automated board meeting packets.
- Implemented visual Conditional Formatting heatmaps and data bars highlighting budget over-runs, leading to a 14% reduction in discretionary operational expenditures.
- Authored 3-statement financial modeling dashboard (P&L, Balance Sheet, Cash Flow) with dynamic scenario manager for executive capital budgeting reviews.
- Formulated automated Days Sales Outstanding (DSO) aging matrix, accelerating accounts receivable cash recovery cycles by 18 days.
- Standardized executive visual palette ensuring 100% compliance with corporate brand guidelines and high-contrast accessibility standards.

== 4. Corporate Word Publishing, Presentations & Cloud
- Standardized corporate 65-page RFP proposal template with multi-level Heading Styles, automated Table of Contents, and dynamic cross-referencing.
- Executed high-volume Mail Merge campaign generating 2,500 personalized corporate vendor renewal agreements and automated PDF certificates in under 20 minutes.
- Authored company-wide Standard Operating Procedure (SOP) documentation with track changes, legal restriction controls, and digital signature enforcement.
- Engineered 45-slide investor pitch deck utilizing Slide Master architecture and Morph transitions, resulting in successful closure of ₹12Cr Series A funding.
- Re-architected team document lifecycle on OneDrive/SharePoint with granular role-based permissions, eliminating 100% of conflicting email file versions.
- Spearheaded adoption of Microsoft Copilot AI prompts across 40 business analysts, boosting weekly departmental report drafting throughput by 40%.

#pagebreak()

= 5 LIVE PORTFOLIO PROJECTS TO SHOWCASE ON LINKEDIN & GITHUB

#concept-box(title: "PORTFOLIO PRINCIPLE: SHOW, DON'T TELL")[
  A polished portfolio of live, downloadable project workbooks with 2-minute Loom video walkthroughs differentiates you from 99% of applicants who rely solely on text resumes. Build these 5 projects using the templates provided in this bundle.
]

#v(2pt)

== 1. Project 1: Automated 3-Statement Financial Model & DCF Valuation
- *Executive Scope*: Integrated corporate financial model linking Income Statement, Balance Sheet, and Cash Flow Statement for an enterprise firm.
- *Core Architecture*: Dynamic revenue driver schedules, working capital modeling, debt schedules, circular reference mitigation, and DCF enterprise valuation.
- *Formulas & Tools*: `XLOOKUP`, `NPV`, `IRR`, `XNPV`, `XIRR`, Data Tables for sensitivity analysis (WACC vs. Terminal Growth Rate).
- *Deliverable Asset*: Multi-tab workbook with executive C-Suite summary card and audit checklist.

== 2. Project 2: Multi-Branch Warehouse Inventory & Safety Stock Reorder Engine
- *Executive Scope*: Centralized supply chain inventory monitoring model tracking 2,500+ SKUs across 4 regional fulfillment centers.
- *Core Architecture*: Dynamic safety stock calculation based on lead-time standard deviation, automated reorder triggers, stockout risk alerts, supplier performance scorecard.
- *Formulas & Tools*: `NORM.S.INV`, `STDEV.S`, `XLOOKUP`, Conditional Formatting heatmaps, and supplier reliability indices.
- *Deliverable Asset*: Interactive inventory dashboard with automated purchase order trigger sheet.

== 3. Project 3: Automated Corporate HR Payroll & Statutory Compliance Engine
- *Executive Scope*: Complete Indian corporate payroll register supporting 500+ employees with automatic statutory deductions.
- *Core Architecture*: Automated calculation of Basic, HRA, Provident Fund (12%), ESI (0.75%), Professional Tax (slab-based), TDS Section 192, and printable 1-click payslips.
- *Formulas & Tools*: Nested `IFS`, `ROUND`, `DATEDIF`, `VLOOKUP`, Data Validation with printable employee slip export.
- *Deliverable Asset*: Ready-to-deploy payroll model with employee master database and 1-click individual PDF slip generator.

== 4. Project 4: Power Query Multi-Source Bank Reconciliation System
- *Executive Scope*: Automated monthly bank reconciliation engine processing raw bank statement CSVs against internal ERP ledger entries.
- *Core Architecture*: Zero manual copy-pasting. Single-click refresh executing M-code data transformations, anti-join queries identifying unpresented cheques, and discrepancy logs.
- *Formulas & Tools*: Power Query ETL, Merge Queries (Anti-Join & Left Outer), fuzzy string matching, automated discrepancy tracking.
- *Deliverable Asset*: Power Query enabled workbook accompanied by sample dirty data files to demonstrate 1-click automated reconciliation.

== 5. Project 5: C-Suite Sales KPI Boardroom Executive Dashboard
- *Executive Scope*: High-impact executive dashboard built for C-Level leadership to review quarterly revenue, customer acquisition costs, and regional profitability.
- *Core Architecture*: Harmonized corporate color palette, synchronized Slicers, Timeline filters, Pareto 80/20 product analysis, and executive commentary callout boxes.
- *Formulas & Tools*: PivotTables, Slicers, Timelines, `GETPIVOTDATA`, dynamic shape card linkage, and 16:9 presentation layout.
- *Deliverable Asset*: Single-screen interactive dashboard tab formatted for executive presentation display with printable PDF export.

#v(2pt)

#spotlight-box("PORTFOLIO HOSTING BEST PRACTICES", [
  Upload sanitized `.xlsx` workbooks to a dedicated GitHub repository. In your repository README, embed a 90-second Loom screen recording explaining the business problem, formula architecture, and automated refresh mechanics. Include direct links on your LinkedIn profile header.
])

#pagebreak()

= 30-DAY AGGRESSIVE INTERVIEW PREPARATION ROADMAP

#concept-box(title: "THE 4-WEEK ACCELERATOR FORMULA")[
  Follow this day-by-day training schedule to transition from casual computer user to interview-ready MIS specialist. Dedicate 2 hours daily: 45 minutes of core concept review and 75 minutes of hands-on workbook construction.
]

#v(2pt)

== 1. Week-by-Week Intensive Sprint Architecture
#table(
  columns: (1fr, 1.6fr, 3.4fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Timeline*], [*Core Focus Module*], [*Mandatory Hands-On Daily Deliverables & Practice Targets*]),
  [Week 1: Days 1–7], [Formulas, Dynamic Arrays & Text Mechanics], [Master relative vs absolute references (\$A\$1). Build 20 complex XLOOKUP scenarios (two-way, wildcard, exact/next). Master dynamic spill formulas: FILTER, UNIQUE, SORT, SEQUENCE. Practice text parsing: TEXTJOIN, TEXT, LEFT, MID, TRIM.],
  [Week 2: Days 8–14], [Power Query ETL & Relational Data Modeling], [Ingest messy multi-column CSVs into Power Query. Practice unpivoting attribute-value pairs, merging tables (Left Outer, Anti-Join), and writing basic M-code. Build PivotTables with Slicers, Timelines, and Calculated Fields.],
  [Week 3: Days 15–21], [Executive Word, PPT & Financial Modeling], [Configure Word Heading Styles (H1-H4), automated TOC, and Section Breaks. Build 10-slide executive pitch deck using Slide Master and Morph transitions. Construct Loan Amortization (PMT/IPMT) and Capital Budgeting (NPV/IRR) models.],
  [Week 4: Days 22–30], [Mock Corporate Tests & Technical Viva Mastery], [Take 5 timed 45-minute practical Excel tests (cleaning messy data, building dashboards from scratch). Memorize Top 50 MIS technical interview answers. Optimize LinkedIn profile and publish 2 live portfolio projects.]
)

#v(2pt)

== 2. Detailed Day-by-Day Milestone Checklist (Days 1 to 30)
#table(
  columns: (0.7fr, 1.8fr, 3.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 1.8pt),
  table.header([*Day*], [*Daily Topic*], [*Practical Exercise Deliverable*]),
  [Day 01], [Grid Navigation & Cell Addressing], [Navigate large sheets using Ctrl + Arrows without mouse; practice \$A\$1, \$A1, A\$1 logic.],
  [Day 03], [Modern XLOOKUP Mastery], [Build exact-match, wildcard, and horizontal two-way search models with custom error fallbacks.],
  [Day 06], [Dynamic Array Formulas], [Generate dynamic student marksheets and product catalogs using FILTER, UNIQUE, and SORT.],
  [Day 09], [Power Query Ingestion & Cleaning], [Import 5 messy CSVs; remove duplicate headers, strip trailing spaces, unpivot monthly columns.],
  [Day 12], [Multi-Table Power Query Merges], [Perform Left Outer, Inner, and Full Anti-Joins to identify unmatched supplier invoices.],
  [Day 16], [Pivot Tables & Slicer Analytics], [Build multi-tier sales reports with Calculated Fields, Slicers, Timelines, and GETPIVOTDATA.],
  [Day 19], [Word Enterprise Publishing], [Create a corporate 20-page document with custom Heading Styles, unlinked headers, and TOC.],
  [Day 22], [PowerPoint Morph & Executive Pitch], [Design a 10-slide C-Suite presentation featuring Morph object transitions and 6x6 design rule.],
  [Day 25], [Full Loan Amortization Schedule], [Construct full 60-month loan repayment model with PMT, IPMT, PPMT, and prepayment switches.],
  [Day 28], [Timed Corporate Excel Mock Test], [Solve 10 complex business tasks under strict 45-minute countdown clock without formula errors.],
  [Day 30], [Portfolio & Interview Rehearsal], [Publish GitHub repo; conduct 60-minute mock technical interview with peer or mentor.]
)

#v(2pt)

== 3. Daily 120-Minute Study Architecture
```
00 - 20 Mins: Rapid Keyboard Shortcut Drills (Excel navigation without touching mouse)
20 - 50 Mins: Deep Concept Study (Study corresponding chapters in this Master Guide)
50 - 105 Mins: Hands-on Practical Lab Construction (Rebuild templates from scratch)
105 - 120 Mins: Self-Testing & Documentation (Explain concepts out loud as if in an interview)
```

#pagebreak()

= TOP 25 RAPID-FIRE MIS TECHNICAL INTERVIEW QUESTIONS & MODEL ANSWERS

#concept-box(title: "INTERVIEW PANEL OBJECTIVES")[
  Corporate interview panels do not ask generic theory; they present real business bottlenecks and assess your analytical problem-solving speed. Use these verified high-scoring model responses.
]

#v(2pt)

#short-qa(num: 1, q: "Why is XLOOKUP superior to legacy VLOOKUP in enterprise financial models?", ans: "XLOOKUP defaults to exact match, searches both left and right, supports two-way lookups, handles errors gracefully via built-in if_not_found, and does not break when column positions change.")

#short-qa(num: 2, q: "What causes a #SPILL! error in modern Excel, and how do you resolve it?", ans: "A #SPILL! error occurs when a dynamic array formula attempts to return multiple values into neighboring cells that are blocked by existing data, merged cells, or hidden rows. Clear the spill path to fix.")

#short-qa(num: 3, q: "Explain the difference between a Left Outer Join and an Anti-Join in Power Query.", ans: "Left Outer Join retains all rows from the primary table plus matching rows from the secondary table. Anti-Join retains only rows that exist in the primary table and have NO match in the secondary table (essential for bank reconciliation).")

#short-qa(num: 4, q: "How do you build a dynamic cascading dependent dropdown list in Excel?", ans: "Use Data Validation > List. Set the first dropdown to a named range. In the second dropdown, set the source formula to =INDIRECT(Cell_Ref), where Cell_Ref matches the named range of the secondary sub-items.")

#short-qa(num: 5, q: "What is the difference between NPV and XNPV?", ans: "NPV assumes periodic, equal-interval cash flows (e.g. exactly annual). XNPV accepts exact irregular transaction dates for each cash flow, making it mandatory for real-world corporate DCF valuation.")

#short-qa(num: 6, q: "How does the Morph transition operate in PowerPoint 365?", ans: "Morph identifies identical objects, text strings, or shapes across consecutive slides and automatically calculates smooth interpolated motion, resizing, and rotation without manual animation pathing.")

#short-qa(num: 7, q: "How do you unlink headers and footers across different sections in Microsoft Word?", ans: "Insert a Next Page Section Break via Layout > Breaks. Double-click the header on the new section, and toggle OFF the 'Link to Previous' button in the Header & Footer contextual ribbon.")

#short-qa(num: 8, q: "What is the purpose of the LET function in Excel 365?", ans: "LET assigns user-defined names to calculation values and intermediate variables within a single formula. It dramatically speeds up recalculation times and eliminates redundant duplicate expressions.")

#short-qa(num: 9, q: "How do you resolve a circular reference warning in an Excel financial model?", ans: "Identify the circular loop via Formulas > Error Checking > Circular References. Redesign the formula logic to decouple interdependent cells, or deliberately enable Iterative Calculation under File > Options > Formulas.")

#short-qa(num: 10, q: "What is differential delta sync in Microsoft 365 cloud co-authoring?", ans: "Delta sync transmits only modified paragraph blocks or cell ranges across the network rather than re-uploading the entire multi-megabyte document, preventing latency and file locking conflicts.")

#short-qa(num: 11, q: "When should you use INDEX+MATCH instead of VLOOKUP in legacy Excel workbooks?", ans: "INDEX+MATCH allows left-side lookups, dynamic column insertions without breaking index numbers, and processes large spreadsheets 30% faster because it only references two specific vectors instead of an entire data table.")

#short-qa(num: 12, q: "How do you prevent numbers like '0123' from losing leading zeros in Excel?", ans: "Apply a Custom Number Format '0000', format the column as Text (@) prior to data entry, or prefix the number with a single apostrophe ('0123).")

#short-qa(num: 13, q: "Explain the difference between COUNT, COUNTA, and COUNTBLANK.", ans: "COUNT tallies only numeric values. COUNTA counts all non-empty cells including text, booleans, and errors. COUNTBLANK tallies strictly empty cells and empty text strings ('').")

#short-qa(num: 14, q: "What is the primary operational advantage of converting a standard range into an Excel Table (Ctrl + T)?", ans: "Tables provide dynamic auto-expansion for new rows, structured formula references ([@Salary]), automated formula propagation, and persistent header visibility during downward scrolling.")

#short-qa(num: 15, q: "How do you calculate exact completed tenure between two dates in years, months, and days?", ans: "Use DATEDIF: =DATEDIF(Start, End, 'Y') & ' Yrs ' & DATEDIF(Start, End, 'YM') & ' Mos ' & DATEDIF(Start, End, 'MD') & ' Days'.")

#pagebreak()

= MICROSOFT OFFICIAL CERTIFICATION ROADMAP & EXAM BLUEPRINTS

#concept-box(title: "VALIDATING YOUR EXPERTISE GLOBALLY")[
  While practical skills win interviews, Microsoft Official Certifications (MO-Series and PL-Series) provide immediate global credibility, guaranteeing that your resume bypasses corporate HR filters.
]

#v(2pt)

== 1. The Microsoft Office Specialist (MOS) & Analytics Credentials
#table(
  columns: (1fr, 1.6fr, 1.2fr, 2.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Exam Code*], [*Official Certification Title*], [*Difficulty Level*], [*Target Enterprise Competencies Validated*]),
  [MO-100], [Microsoft Word (Microsoft 365 Apps)], [Associate], [Document creation, styles, tables, mail merge, section breaks, collaboration.],
  [MO-200], [Microsoft Excel (Microsoft 365 Apps)], [Associate], [Worksheet mechanics, formulas, tables, charts, basic pivot tables, formatting.],
  [MO-201], [Microsoft Excel Expert (365 Apps)], [Expert #hl[(Gold Standard)]], [Advanced functions (XLOOKUP, Dynamic Arrays), Power Query, macros, auditing.],
  [MO-300], [Microsoft PowerPoint (365 Apps)], [Associate], [Slide Master templates, Morph transitions, multimedia, delivery options.],
  [PL-300], [Microsoft Power BI Data Analyst], [Professional], [Data preparation, DAX modeling, Power BI reports, security roles, dashboards.]
)

#v(2pt)

== 2. Exam Domain Weightage Breakdown (MO-201: Excel Expert)
#table(
  columns: (1.2fr, 3.2fr, 1.6fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*Domain*], [*Core Technical Knowledge Objectives*], [*Exam Weightage*]),
  [Domain 1], [Manage Workbook Options and Settings (Templates, Macros, Language, Protection)], [15% – 20%],
  [Domain 2], [Apply Advanced Data Formats and Layouts (Custom Formats, Advanced Validation)], [20% – 25%],
  [Domain 3], [Create Advanced Formulas and Functions (Logical, Lookup, Financial, Array Formulas)], [30% – 35% #hl[(Heaviest)]],
  [Domain 4], [Perform Data Analysis and Business Modeling (PivotTables, Power Query, What-If)], [20% – 25%]
)

#v(2pt)

== 3. Exam Day Strategy & Passing Tactics
- *Exam Format*: 50 minutes duration, practical project-based tasks (performing live tasks inside simulated Office software). Passing score is 700/1000.
- *Pacing Strategy*: You have 50 minutes to complete 5 to 7 independent project mini-files (approx. 25-35 subtasks). Budget strictly 7 minutes per project.
- *Reset Project Capability*: If you make an unrecoverable formatting mistake during a task, click 'Restart Project' to restore the initial state without losing time on other sections.

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #block(
      width: 100%,
      stroke: (left: 2.5pt + rgb("#059669")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 6pt, y: 3.5pt),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[EXAM DISCIPLINE & TIME ALLOCATION]
        #v(1.5pt)
        #text(size: 7pt, fill: rgb("#1E293B"))[
          Never spend more than 2 minutes searching for a buried ribbon option. If stuck, mark the question for review and continue. Most candidates fail due to poor clock management, not lack of technical knowledge.
        ]
      ]
    )
  ],
  [
    #block(
      width: 100%,
      stroke: (left: 2.5pt + rgb("#0284C7")),
      fill: white,
      radius: (right: 3pt),
      inset: (x: 6pt, y: 3.5pt),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[OFFICIAL VOUCHER PURCHASING TIPS]
        #v(1.5pt)
        #text(size: 7pt, fill: rgb("#1E293B"))[
          Book your exams through authorized Certiport testing centers or Microsoft Learn. Student discounts often reduce standard exam fees by up to 50% with valid academic credentials.
        ]
      ]
    )
  ]
)

#pagebreak()

= RAHUL SIR'S AUTHOR GUIDANCE & LIFETIME COMMUNITY ACCESS

#concept-box(title: "A PERSONAL MESSAGE FROM RAHUL SIR")[
  Technology education in India has suffered for decades from superficial rote memorization. At RTechLab, our foundational mission is to provide world-class, practical, enterprise-grade engineering literacy that enables students and working professionals to achieve career sovereignty and economic dignity.
]

#v(4pt)

#grid(
  columns: (1.2fr, 2.8fr),
  gutter: 12pt,
  [
    #image("/DIGITAL/OFFICE_365/07_SOURCE_FILES/02_BRAND_ASSETS/rahul-patel.jpg", width: 100%)
    #v(3pt)
    #align(center)[
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[Rahul Patel]\
      #text(size: 7pt, fill: rgb("#64748B"))[Founder & Chief Technology Architect]\
      #text(size: 7pt, weight: "bold", fill: rgb("#0284C7"))[RTechLab]
    ]
  ],
  [
    #text(size: 7.8pt, fill: rgb("#1E293B"))[
      "Dear Learner,

      The knowledge contained in this Career Blueprint, alongside the 112-page Master Guide and 12 Enterprise Practical Templates, represents over a decade of real-world corporate technology and consulting architecture experience.

      Remember: *Tools change, but analytical discipline endures.* Whether you are writing a complex XLOOKUP formula, orchestrating a multi-table Power Query pipeline, or formatting a C-Suite executive proposal, hold yourself to the highest standards of professional precision.

      Do not treat this publication as passive reading material. Open Microsoft Excel, Word, and PowerPoint on your computer, build every single template from scratch, test the edge cases, and present your work with unwavering confidence.

      I look forward to welcoming you into our community of high-impact corporate leaders and celebrating your upcoming career breakthroughs."
    ]

    #v(4pt)

    #align(right)[
      #text(font: "Segoe Script", size: 11pt, weight: "bold", fill: rgb("#0284C7"))[Rahul Patel]\
      #text(size: 6.5pt, fill: rgb("#64748B"))[Founder, RTechLab Educational Initiative]
    ]
  ]
)

#v(4pt)

== RTechLab Lifetime Ecosystem & Direct Support Channels
#table(
  columns: (1.5fr, 2fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Resource Channel*], [*Access URL / Coordinate*], [*Community Deliverables & Engagement*]),
  [Official Web Platform], [https://rtechlab.vercel.app], [Access latest digital releases, course updates & downloadable workbooks.],
  [Student Notes Portal], [https://rtechlab.vercel.app/notes], [Quarterly curriculum errata updates & bonus practical case studies.],
  [Direct Mentorship Support], [rahul.28e1\@gmail.com], [Direct technical clarification and formula troubleshooting with author team.],
  [Live Weekend Masterclasses], [Quarterly Community Invitations], [Live walkthroughs of complex financial modeling & Power Query workflows.]
)

#v(4pt)

#spotlight-box("THE ₹149 ALL-INCLUSIVE VALUE COMMITMENT", [
  Your purchase of the ₹149 Career Accelerator Bundle includes lifetime access to all 4 deliverables: (1) 112-Page Master Guide (English & Hindi), (2) Top 100 Shortcuts & 50 Interview Vault, (3) 12 Practical Enterprise Excel Templates Workbook Guide, and (4) this complete 2027 MIS Career & Salary Blueprint. Thank you for supporting practical, independent education!
])
"""

    with open(typ_path, "w", encoding="utf-8") as f:
        f.write(typ_content)

    print(f"Compiling Career & Salary Blueprint to {pdf_out}...")
    res = subprocess.run(['typst', 'compile', '--root', '.', typ_path, pdf_out], capture_output=True, text=True)
    if res.returncode != 0:
        print("Compilation ERROR:", res.stderr)
        return False
    else:
        doc = fitz.open(pdf_out)
        print(f"✓ Career & Salary Blueprint compiled successfully: {len(doc)} pages ({pdf_out})")
        # Check fill percentage for each page
        for i in range(len(doc)):
            p = doc[i]
            blocks = [b for b in p.get_text('blocks') if 'RTECHLAB' not in b[4] and 'C E R T I F I E D' not in b[4] and b[1] >= 45 and b[3] <= 795]
            if blocks:
                max_y = max(b[3] for b in blocks)
                fill = ((max_y - 50) / 740) * 100
                print(f"  Page {i+1}: {fill:.1f}% fill (bottom y={max_y:.1f})")
        return True

if __name__ == "__main__":
    generate_career_blueprint()
