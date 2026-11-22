# -*- coding: utf-8 -*-
"""
Full English Curriculum Module Generator for Tally Prime Master Publication
Part 1: Topics 1 to 3 (Expanded for 50-60 Page Commercial Edition)
Standardized by Rahul Patel (Founder, RTechLab / IANT Palanpur)
Direct Contact: rahul.28e1@gmail.com
"""

def generate_english():
    chapters = {}

    # =========================================================================
    # TOPIC 01
    # =========================================================================
    chapters[1] = """
= Topic 01: History of Tally, Evolution & Downloading Tally Prime

== 1.1 The Genesis of Tally: A Proud Indian Innovation
The story of Tally represents one of the most remarkable breakthroughs in the global software industry. In 1986, *Shyam Sundar Goenka*, an entrepreneur running a textile machinery spare parts business in Bangalore, faced severe challenges with manual paper-based bookkeeping. Every transaction required tedious physical ledger entries, and errors in trial balances took weeks to trace. At the time, early business computer systems were prohibitively expensive and required complex database programming knowledge.

Determined to find an automated yet user-friendly solution, Shyam Sundar Goenka challenged his son, *Bharat Goenka* (a mathematics graduate with a passion for software design), to develop an accounting tool that any Indian accountant could use in natural commercial language without writing computer code.

Bharat Goenka founded *Peutronics Financial Services* in Bangalore in 1986. Operating from a small office, he created *The Accountant*, the world's first "codeless" accounting software. In 1999, recognizing the immense nationwide adoption and the verb "to tally" (to agree or balance accounts), the enterprise was officially renamed *Tally Solutions Pvt. Ltd.*

Today, headquartered in Bangalore, Tally dominates the Indian business landscape with over *80% market share* across micro, small, and medium enterprises (MSMEs), large industrial corporations, government boards, and Chartered Accountancy firms.

#v(6pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    #rect(
      width: 100%,
      stroke: 1pt + rgb("#0E7490"),
      fill: rgb("#F8FAFC"),
      radius: 4pt,
      inset: 8pt,
      [
        #align(center)[
          #box(radius: 4pt, clip: true, stroke: 1pt + rgb("#CBD5E1"), image("../../02_BRAND_ASSETS/shyam_sundar_goenka.png", width: 34mm, height: 38mm, fit: "cover"))
          #v(3pt)
          #text(weight: "black", size: 8.5pt, fill: rgb("#0F172A"))[Shyam Sundar Goenka]\\
          #text(size: 7pt, fill: rgb("#0E7490"), weight: "bold")[Visionary Co-Founder (1932 - 2002)]\\
          #text(size: 6.5pt, fill: rgb("#475569"))[Pioneered codeless accounting to simplify Indian commerce.]
        ]
      ]
    )
  ],
  [
    #rect(
      width: 100%,
      stroke: 1pt + rgb("#0E7490"),
      fill: rgb("#F8FAFC"),
      radius: 4pt,
      inset: 8pt,
      [
        #align(center)[
          #box(radius: 4pt, clip: true, stroke: 1pt + rgb("#CBD5E1"), image("../../02_BRAND_ASSETS/bharat_goenka.png", width: 34mm, height: 38mm, fit: "cover"))
          #v(3pt)
          #text(weight: "black", size: 8.5pt, fill: rgb("#0F172A"))[Bharat Goenka]\\
          #text(size: 7pt, fill: rgb("#0E7490"), weight: "bold")[Managing Director & Tech Architect]\\
          #text(size: 6.5pt, fill: rgb("#475569"))[Architect of the proprietary Cactus in-memory engine.]
        ]
      ]
    )
  ]
)

#v(6pt)

== 1.2 Historical Evolution: From DOS to Tally Prime
Tally's technological journey spans nearly four decades of continuous architectural innovation, reflecting India's transition from pre-liberalization manual trade to the modern digital Goods and Services Tax (GST) regime:

#table(
  columns: (1.2fr, 1fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Release Version]], [#text(weight: "bold", fill: white)[Year Launched]], [#text(weight: "bold", fill: white)[Key Technical Capabilities & Milestones]],
  [Peutronics (The Accountant)], [1986], [Initial DOS-based accounting software operating strictly via keyboard keystrokes.],
  [Tally 4.5], [1994], [Robust character-user interface (CUI), MS-DOS driven double-entry bookkeeping engine.],
  [Tally 5.4], [1998], [First Windows-native 32-bit edition, introducing graphical printing and inventory management.],
  [Tally 6.3], [2001], [Added data communication over IP, early multi-lingual support, and ODBC database connectivity.],
  [Tally 7.2], [2005], [Engineered for India's historic transition to State-level Value Added Tax (VAT) and Service Tax.],
  [Tally 8.1 & 9.0], [2006], [Multi-lingual Indian language interfaces, POS (Point of Sale), and early payroll processing.],
  [Tally.ERP 9], [2009], [The legendary national workhorse. Introduced remote access, banking automation, and full GST compliance in July 2017.],
  [Tally Prime 1.0], [2020], [Complete ground-up redesign: Top-menu architecture, Alt+G multi-tasking, modern light interface.],
  [Tally Prime 4.x / 5.x], [2024 - Present], [Native WhatsApp for Business integration, multi-GSTIN management, connected e-Invoicing & e-Way bill APIs.]
)

#v(6pt)

#align(center)[
  #box(stroke: 0.5pt + rgb("#CBD5E1"), radius: 4pt, fill: white, inset: 6pt)[
    #image("../../02_BRAND_ASSETS/tally_classic_logo.png", width: 52mm)
  ]
]

#v(6pt)

== 1.3 Detailed Architectural Comparison: Tally.ERP 9 vs Tally Prime
Understanding the technological evolution from Tally.ERP 9 to Tally Prime is a frequent topic in senior corporate accounting interviews:

#table(
  columns: (1.3fr, 1.8fr, 1.9fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Architectural Dimension]], [#text(weight: "bold", fill: white)[Legacy Tally.ERP 9 (2009 - 2020)]], [#text(weight: "bold", fill: white)[Modern Tally Prime (2020 - 2027)]],
  [User Interface & Theme], [Dual-color pane (Green/Yellow), heavy text layout, crowded sidebars.], [Clean, minimalist light theme with optimized visual hierarchy and modern typography.],
  [Navigation Model], [Strictly hierarchical tree; user had to drill down Gateway of Tally steps.], [Global Top Menu bar (Alt+K, Alt+Y, Alt+Z, Alt+O, Alt+E, Alt+P) plus Go To (Alt+G).],
  [Multi-Tasking Capability], [None. Active voucher had to be saved or discarded before opening reports.], [Seamless multi-tasking: open Balance Sheet or Cash Book mid-voucher without data loss.],
  [Mouse Integration], [Keyboard-dependent; mouse support was erratic and limited.], [100% fluid mouse click navigation alongside standard touch-typing shortcuts.],
  [Copy & Paste Keystrokes], [Proprietary shortcuts: Ctrl + Alt + C to copy, Ctrl + Alt + V to paste.], [Standard Windows shortcuts: Ctrl + C and Ctrl + V work natively across all fields.],
  [Installation System], [Separate installer setups for 32-bit and 64-bit with complex update wizards.], [Unified single-window installer; auto-detects existing paths and updates in seconds.],
  [e-Invoice & e-Way Bill], [Required external GSP (GST Suvidha Provider) utilities and JSON file exports.], [Direct API integration: generate IRN and e-Way bill numbers directly from the invoice.]
)

#v(6pt)

== 1.4 How to Download & Install Tally Prime
To ensure complete system stability, security, and statutory compliance, always download Tally Prime exclusively from the official developer portal:

1. Open your web browser (Google Chrome, Microsoft Edge, Mozilla Firefox) and navigate to the official website: #link("https://tallysolutions.com")[tallysolutions.com].
2. Click on the prominent *Download* button located on the top navigation bar.
3. The browser will download the single executable installer: `setup.exe` (approximately 42 MB).
4. *System Requirements Check:* Ensure your computer runs a 64-bit operating system (Windows 10, Windows 11, or Windows Server 2016+) with at least 4 GB RAM (8 GB recommended for enterprise databases) and 150 MB free disk space.
5. Right-click `setup.exe` and select *Run as administrator*.
6. The Tally Prime Unified Installer will launch. It automatically detects if prior installations exist.
7. Click *Install* to accept the default program path (`C:\\Program Files\\TallyPrime`) or click *Configure* to choose an alternative drive (e.g., `D:\\TallyPrime`).
8. Once installation completes within seconds, click *Start TallyPrime*.

#v(6pt)

== 1.5 Recommended IT Hardware & Backup Sizing for Enterprises
When deploying Tally Prime in corporate accounts departments, Chartered Accountancy firms, or industrial plants, system administrators should implement the following infrastructure standards:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[Tier Level]], [#text(weight: "bold", fill: white)[Business Scope]], [#text(weight: "bold", fill: white)[Hardware Specifications]], [#text(weight: "bold", fill: white)[Backup & Disaster Recovery]],
  [Standalone Client], [Small Retail / Freelance (1 User)], [Intel Core i3/i5, 8 GB RAM, 256 GB SSD, Windows 11 64-bit], [Daily automated backup to external USB drive (#key-pill("Alt+Y > Backup")).],
  [Office Local LAN], [SME Firm (2 to 10 Users)], [Dedicated Host PC: Intel Core i7, 16 GB RAM, 512 GB NVMe SSD, Gigabit LAN], [Scheduled nightly mirror backup + encrypted cloud storage sync.],
  [Enterprise Server], [Factory / Multi-Branch (10+ Users)], [Intel Xeon or AMD EPYC, 32 GB ECC RAM, RAID-1 mirrored SSDs, Server 2022], [RAID hardware redundancy + offsite off-hour snapshot archives.]
)

#v(6pt)

== 1.6 Understanding Tally Prime Licensing Modes
Upon first launch, Tally Prime presents the Welcome Screen with four distinct operating modes:

#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[License Edition]], [#text(weight: "bold", fill: white)[User Access Limit]], [#text(weight: "bold", fill: white)[Operational Scope & Features]],
  [Silver Edition (Single User)], [1 Active Computer], [Commercial standalone license activated via Tally.NET ID. Best for retail shops, single-accountant offices, and freelancers.],
  [Gold Edition (Multi-User)], [Unlimited Users on LAN], [Commercial corporate license running via Tally Gateway Server. Enables concurrent multi-user voucher entry across local office networks.],
  [Educational Mode], [Single User (Free)], [100% free mode intended for commerce students and trainees. *Critical Statutory Restriction:* Transactions can ONLY be recorded on the *1st, 2nd, and 31st day* of any month.],
  [Rental Mode], [Monthly / Quarterly], [Leased commercial license (Silver or Gold) paid on subscription basis. Suitable for seasonal projects, exhibitions, or temporary audits.]
)

#concept-box(title: "Academic Focus: Educational Mode Best Practices")[
  As a student or training professional at *IANT Palanpur*, you will utilize *Educational Mode*. Note that the accounting calculations, ledger creations, GST rates, trial balance generation, and profit & loss statements are 100% identical to commercial editions. To practice effectively without license errors, always set voucher transaction dates to the *1st, 2nd, or 31st* of the month!
]

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 01 SUMMARY & KEY REVISION TAKEAWAYS]
    - Tally was founded in 1986 by Shyam Sundar Goenka and Bharat Goenka under the initial company name *Peutronics*.
    - Rebranded to *Tally Solutions Pvt. Ltd.* in 1999; commands over *80% market share* in Indian business accounting.
    - Evolution: DOS-based Tally 4.5 -> Windows 5.4 -> VAT-compliant 7.2 -> ERP workhorse Tally.ERP 9 -> Modern Tally Prime.
    - Key Tally Prime advantages: Clean light interface, Go To (Alt+G) multi-tasking, standard Ctrl+C/V, direct e-Invoicing.
    - Download verified installer exclusively from #link("https://tallysolutions.com")[tallysolutions.com] (`setup.exe`).
    - *Silver* is single-user commercial, *Gold* is multi-user LAN commercial, and *Educational Mode* is 100% free for learning with date entry limited to 1st, 2nd, and 31st.
  ]
)

#v(8pt)

// MCQS
== Topic 01: High-Yield Exam & Interview MCQs

1. *Who is regarded as the father of Tally and developed its first codeless engine?*\\
   (A) Narayana Murthy #h(10pt) (B) Bharat Goenka #h(10pt) (C) Azim Premji #h(10pt) (D) Shyam Sundar Goenka\\
   *Answer: (B)* | *Explanation:* Bharat Goenka developed "The Accountant" in 1986 and architected the Cactus engine.

2. *What was the original company name of Tally Solutions when founded in 1986?*\\
   (A) Tally India Pvt Ltd #h(10pt) (B) Peutronics Financial Services #h(10pt) (C) Indian Software Corp #h(10pt) (D) Cactus ERP Ltd\\
   *Answer: (B)* | *Explanation:* Peutronics was founded in Bangalore in 1986 and renamed Tally Solutions in 1999.

3. *In Educational Mode of Tally Prime, on which dates of a calendar month can vouchers be recorded?*\\
   (A) Any Sunday #h(10pt) (B) 1st to 10th #h(10pt) (C) 1st, 2nd, and 31st #h(10pt) (D) Only on the 15th\\
   *Answer: (C)* | *Explanation:* Educational Mode restricts dates to 1, 2, and 31 to encourage commercial license purchases.

4. *Which operating system architecture is strictly required to run modern Tally Prime?*\\
   (A) 16-bit DOS #h(10pt) (B) 32-bit Windows #h(10pt) (C) 64-bit Windows #h(10pt) (D) Any Linux without Wine\\
   *Answer: (C)* | *Explanation:* Tally Prime requires 64-bit Windows 7/8/10/11 or Windows Server.

5. *What is the primary difference between Tally Silver and Tally Gold editions?*\\
   (A) Gold supports GST while Silver does not #h(10pt) (B) Silver is single-user; Gold is multi-user on local LAN\\
   (C) Silver is free; Gold is paid #h(10pt) (D) Gold can only be rented\\
   *Answer: (B)* | *Explanation:* Silver allows 1 active desktop; Gold supports concurrent multi-user LAN access.

6. *What approximate market share does Tally command across Indian business accounting?*\\
   (A) 25% #h(10pt) (B) 50% #h(10pt) (C) Over 80% #h(10pt) (D) 99%\\
   *Answer: (C)* | *Explanation:* Tally commands over 80% market share across MSMEs, CAs, and retail in India.

7. *Which keyboard shortcut in Tally.ERP 9 was required to copy text, which has now been replaced by standard Ctrl+C in Tally Prime?*\\
   (A) Alt + C #h(10pt) (B) Ctrl + Alt + C #h(10pt) (C) Shift + C #h(10pt) (D) F12\\
   *Answer: (B)* | *Explanation:* Tally.ERP 9 used Ctrl+Alt+C for copy and Ctrl+Alt+V for paste; Tally Prime supports standard Ctrl+C and Ctrl+V.

8. *What is the default installation path of Tally Prime on a 64-bit Windows operating system?*\\
   (A) `C:\\Tally` #h(10pt) (B) `C:\\Program Files\\TallyPrime` #h(10pt) (C) `C:\\Windows\\Tally` #h(10pt) (D) `D:\\Data`\\
   *Answer: (B)* | *Explanation:* Tally Prime defaults to `C:\\Program Files\\TallyPrime` on standard 64-bit Windows installations.

#v(6pt)

// VIVA & LAB
== Topic 01: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Why did Shyam Sundar Goenka want a codeless accounting system in 1986?\\
  *Answer:* Because existing computer systems required complex programming and external database specialists, making them impractical for ordinary Indian traders.
- *Viva Q2:* How can an institute or student use Tally Prime without purchasing a commercial license?\\
  *Answer:* By launching Tally Prime in *Educational Mode*, which provides full double-entry, inventory, and GST features with a transaction date restriction (1st, 2nd, 31st).
- *Viva Q3:* What is the functional distinction between Tally Silver and Tally Gold in a multi-department enterprise?\\
  *Answer:* Tally Silver is locked to a single machine for single-accountant use. Tally Gold runs a centralized license service enabling multiple data entry operators, billing clerks, and CAs to work on the same company simultaneously across the local network.
- *Hands-On Lab Task:* Download `setup.exe` from `tallysolutions.com`, install Tally Prime on your PC, launch the software, select *Continue in Educational Mode*, and note down the version and license status displayed on the top left.
"""

    # =========================================================================
    # TOPIC 02
    # =========================================================================
    chapters[2] = """
= Topic 02: What is Tally Prime & System Architecture

== 2.1 What is Tally Prime?
*Tally Prime* is an enterprise-grade business management and Enterprise Resource Planning (ERP) software suite designed specifically for micro, small, medium, and large corporations. At its core, Tally Prime integrates double-entry financial accounting, inventory management with batch/expiry tracking, statutory tax compliance (GST, TDS, TCS), banking integration, sales and purchase order workflows, and employee payroll management into a single cohesive, high-performance platform.

Unlike traditional relational accounting software that forces data entry operators to remember rigid alphanumeric chart-of-accounts codes (e.g., account `4010-002`), Tally Prime operates on *natural commercial accounting*. An accountant records a transaction using standard business vouchers—such as an F5 Payment, F6 Receipt, or F8 Sales Invoice. 

The moment a voucher is accepted, Tally Prime instantly and simultaneously updates the relevant ledger accounts, customer/supplier balances, inventory stock ledgers, Trial Balance, Profit & Loss Account, Balance Sheet, and statutory GST returns (GSTR-1 and GSTR-3B) with zero batch processing delay!

#v(6pt)

#align(center)[
  #box(
    stroke: 1pt + rgb("#CBD5E1"),
    radius: 4pt,
    clip: true,
    image("../../02_BRAND_ASSETS/catalog/p16_x1302_3068x1818.png", width: 140mm)
  )
  #v(2pt)
  #text(size: 6.8pt, fill: rgb("#475569"), style: "italic")[Figure 2.1: Gateway of Tally & Top-Bar Navigation Architecture in Tally Prime.]
]

#v(6pt)

== 2.2 Deep Dive into the Gateway of Tally (GOT)
The *Gateway of Tally* is the nerve center and command dashboard of Tally Prime. Every master, transaction, audit report, and configuration is organized into four logical functional sections:

#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[GOT Section]], [#text(weight: "bold", fill: white)[Menu Options]], [#text(weight: "bold", fill: white)[Operational Purpose & Commercial Role]],
  [1. Masters], [Create, Alter, Chart of Accounts], [Build and maintain master records: Ledgers, Groups, Stock Items, Units, Godowns, and Tax Categories.],
  [2. Transactions], [Vouchers, Day Book], [Record day-to-day commercial vouchers (F4 Contra to F9 Purchase) and review the chronological Day Book diary.],
  [3. Utilities], [Banking], [Access Cheque Printing, Cheque Register, Bank Reconciliation (BRS), Deposit Slips, and Payment Advice.],
  [4. Reports], [Balance Sheet, Profit & Loss A/c, Stock Summary, Ratio Analysis, Display More Reports], [Generate instant audited financial statements, inventory valuation trees, liquidity ratios, GST statutory returns, and Trial Balance.]
)

#v(6pt)

== 2.3 The Proprietary "Cactus" In-Memory Database Engine
The world-renowned speed and responsiveness of Tally Prime are driven by its proprietary, purpose-built in-memory database architecture, code-named the *Cactus Engine*:

- *Zero-Disk In-Memory Processing:* Conventional ERP software (such as SAP, Oracle ERP, or Microsoft Dynamics) depends on third-party Relational Database Management Systems (RDBMS like Microsoft SQL Server or Oracle Database). Such systems perform heavy disk reads, table joins, foreign key lookups, and index updates for every voucher. In contrast, Tally's Cactus engine loads the complete hierarchical chart of accounts and relationship tree directly into high-speed system RAM (Random Access Memory).
- *Sub-Millisecond Dynamic Recalculation:* Tally does not store pre-calculated closing balances. Every time an accountant opens the Balance Sheet or Stock Summary, Cactus calculates financial ratios, FIFO/Weighted Average stock valuations, and closing balances on the fly in sub-milliseconds across millions of records.
- *Data Directory Architecture:* Tally database files are stored inside numerical company folders (e.g., `Data/10001/Company.900`). The `.900` file structure contains the binary object tree, transaction records, and index nodes, making database backups as simple as copying a single folder!
- *Extensibility via TDL (Tally Definition Language):* The entire graphical interface, menus, reports, and voucher input screens in Tally Prime are written in TDL—an Action-Object-Oriented language developed by Tally Solutions. This allows CAs and corporate developers to build custom invoice layouts, audit rules, and third-party API webhooks without modifying core binary code.

#v(6pt)

== 2.4 Master Interface Architecture & Top-Menu Navigation
Tally Prime replaces cluttered legacy menus with an elegant, streamlined top menu bar that remains permanently accessible regardless of which transaction or report you are viewing:

#table(
  columns: (1.2fr, 1.1fr, 2.7fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Top Menu Element]], [#text(weight: "bold", fill: white)[Keyboard Shortcut]], [#text(weight: "bold", fill: white)[Operational Purpose & Capabilities]],
  [Company Menu], [#key-pill("Alt + K")], [Create, alter, select, shut companies, and manage security/user access permissions.],
  [Data Menu], [#key-pill("Alt + Y")], [Execute automated data backups, restore archive files, split company data at financial year end, and repair corrupted databases.],
  [Exchange Menu], [#key-pill("Alt + Z")], [Synchronize multi-branch data between remote branch godowns and central corporate servers.],
  [Import Menu], [#key-pill("Alt + O")], [Import master ledgers, stock items, and electronic bank statement spreadsheets (CSV/XML).],
  [Export Menu], [#key-pill("Alt + E")], [Export financial statements and invoices into PDF, Excel, XML, HTML, or CSV formats.],
  [Email Menu], [#key-pill("Alt + M")], [Dispatch invoices, outstanding ledgers, and confirmation statements directly via corporate SMTP email.],
  [Print Menu], [#key-pill("Alt + P")], [Print formal tax invoices, cheques, vouchers, and audit reports with customized layout settings.],
  [Help Menu], [#key-pill("F1")], [Access TallyHelp documentation, keyboard shortcut lists, license management, and software update tools.]
)

#v(6pt)

== 2.5 The Multi-Tasking Revolution: "Go To" (#key-pill("Alt + G"))
In legacy accounting systems (including Tally.ERP 9), if an accountant was in the middle of entering a complex 25-item sales invoice and a supervisor requested the current balance of a bank account, the accountant had to either abandon the unsaved invoice or finish it prematurely.

Tally Prime introduces the revolutionary *Go To* search and multitasking engine:
- Press #key-pill("Alt + G") at any moment from any screen.
- A search bar opens over the existing screen. Type "Balance Sheet", "Cash/Bank Summary", or "Stock Summary".
- Tally Prime displays the requested report without closing or discarding the active invoice!
- You can review the report, drill down into ledgers, print the document, and press #key-pill("Esc") to return precisely to the exact invoice line item where you left off.

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 02 SUMMARY & KEY REVISION TAKEAWAYS]
    - Tally Prime is an integrated business ERP managing accounts, stock, statutory GST/TDS, banking, and payroll.
    - Gateway of Tally (GOT) is structured into 4 sections: Masters, Transactions, Utilities, and Reports.
    - Operates on *natural commercial accounting*—vouchers immediately update all financial books and tax returns.
    - Powered by the proprietary *Cactus Engine*, an in-memory RAM database enabling sub-millisecond dynamic recalculation without SQL disk bottlenecks.
    - Top Menu Bar provides unified access: #key-pill("Alt+K") (Company), #key-pill("Alt+Y") (Data), #key-pill("Alt+Z") (Exchange), #key-pill("Alt+O") (Import), #key-pill("Alt+E") (Export), #key-pill("Alt+M") (Email), #key-pill("Alt+P") (Print).
    - *Go To (#key-pill("Alt+G"))* enables seamless multi-tasking and instant report discovery without losing active transaction state.
  ]
)

#v(8pt)

// MCQS
== Topic 02: High-Yield Exam & Interview MCQs

1. *What is the proprietary database engine that powers Tally Prime's real-time calculations?*\\
   (A) Oracle DB #h(10pt) (B) Cactus Engine #h(10pt) (C) SQLite Engine #h(10pt) (D) Postgres Engine\\
   *Answer: (B)* | *Explanation:* Cactus is Tally's in-memory object-oriented database engine developed in-house.

2. *Which keyboard shortcut invokes the revolutionary 'Go To' multi-tasking search bar in Tally Prime?*\\
   (A) Ctrl + F #h(10pt) (B) Alt + G #h(10pt) (C) Alt + S #h(10pt) (D) Ctrl + G\\
   *Answer: (B)* | *Explanation:* Alt+G opens the Go To search bar from any screen in Tally Prime.

3. *Which top-menu shortcut allows an accountant to backup or split company data?*\\
   (A) Alt + K #h(10pt) (B) Alt + Y #h(10pt) (C) Alt + Z #h(10pt) (D) Alt + E\\
   *Answer: (B)* | *Explanation:* Alt+Y opens the Data Menu for Backup, Restore, and Split Data.

4. *What language is used to design menus, screens, and custom reports in Tally Prime?*\\
   (A) Python #h(10pt) (B) TDL (Tally Definition Language) #h(10pt) (C) Java #h(10pt) (D) C++\\
   *Answer: (B)* | *Explanation:* TDL is Tally's proprietary action-oriented programming language.

5. *Why does Tally Prime calculate Balance Sheet figures faster than conventional RDBMS systems?*\\
   (A) It skips double-entry validation #h(10pt) (B) It processes the entire hierarchical tree in RAM\\
   (C) It only stores rounded values #h(10pt) (D) It uses external cloud servers\\
   *Answer: (B)* | *Explanation:* Cactus in-memory architecture recalculates trees directly in system RAM.

6. *What happens to an active, unsaved voucher when you use Alt+G to view the Cash Book?*\\
   (A) It gets permanently deleted #h(10pt) (B) It is auto-saved as draft\\
   (C) It remains paused in memory; pressing Esc returns to it #h(10pt) (D) Tally crashes\\
   *Answer: (C)* | *Explanation:* Tally Prime preserves the active screen state during Go To navigation.

7. *Under which Gateway of Tally section are options like Cheque Printing and Bank Reconciliation located?*\\
   (A) Masters #h(10pt) (B) Transactions #h(10pt) (C) Utilities (Banking) #h(10pt) (D) Reports\\
   *Answer: (C)* | *Explanation:* Banking utilities (cheque printing, BRS, deposit slips) are located under Utilities.

8. *What file extension is used by Tally Prime to store its core database object tree in numerical folders?*\\
   (A) `.sql` #h(10pt) (B) `.900` #h(10pt) (C) `.dat` #h(10pt) (D) `.dbf`\\
   *Answer: (B)* | *Explanation:* Tally Prime stores its binary database files with the `.900` file extension (e.g., `Company.900`).

#v(6pt)

// VIVA & LAB
== Topic 02: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain how Tally Prime's Go To (Alt+G) feature improves corporate accounting efficiency.\\
  *Answer:* It eliminates workflow interruptions by allowing accountants to open any ledger, stock report, or financial ratio from within an active voucher entry, check balances, and resume data entry instantly.
- *Viva Q2:* What is the difference between Alt+K and Alt+Y in Tally Prime?\\
  *Answer:* Alt+K accesses the Company Menu (creation, alteration, security, and selection), whereas Alt+Y accesses the Data Menu (data path configuration, backup, restore, and company data splitting).
- *Hands-On Lab Task:* Open Tally Prime, navigate to the Gateway of Tally, press #key-pill("Alt + G"), search for "Balance Sheet", press Enter, inspect the liabilities and assets, and press #key-pill("Esc") to return to the Gateway of Tally.
"""

    # =========================================================================
    # TOPIC 03
    # =========================================================================
    chapters[3] = """
= Topic 03: Comprehensive GST & TDS Foundation (Taxation Architecture)

== 3.1 Understanding Goods and Services Tax (GST)
The implementation of the *Goods and Services Tax (GST)* on July 1, 2017 (via the 101st Constitutional Amendment Act) revolutionized India's fiscal landscape under the banner of *"One Nation, One Tax, One Market"*. GST subsumed a confusing maze of central and state indirect taxes—including Central Excise Duty, Service Tax, State VAT, Entry Tax, Luxury Tax, and Central Sales Tax (CST)—into a unified, destination-based, multi-stage consumption tax.

=== Dual GST Architecture in India
Under federal constitutional provisions, both the Central Government and State Governments concurrently levy tax on taxable supplies of goods and services:
1. *Intrastate Supply (Supply within the same State/Union Territory):*
   - Location of Supplier and Place of Supply are in the same State (e.g., supplier in Palanpur, buyer in Ahmedabad, Gujarat).
   - Taxes Levied: *Central GST (CGST)* + *State GST (SGST)* (or *UTGST* for Union Territories).
   - Tax Revenue: Shared equally (50% to Central Government, 50% to State Government).
2. *Interstate Supply (Supply between two different States or Import/Export):*
   - Location of Supplier and Place of Supply are in different States (e.g., supplier in Palanpur, Gujarat; buyer in Mumbai, Maharashtra).
   - Taxes Levied: *Integrated GST (IGST)*.
   - Tax Revenue: Collected by the Central Government and apportioned to the consuming State.

#v(6pt)

#table(
  columns: (1.3fr, 1.2fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Supply Classification]], [#text(weight: "bold", fill: white)[Statutory Tax Component]], [#text(weight: "bold", fill: white)[Practical Tax Calculation Example (18% Rate)]],
  [Intrastate (Within Gujarat)], [CGST (9%) + SGST (9%)], [On taxable goods of ₹10,000: CGST = ₹900, SGST = ₹900. Total Bill = ₹11,800.],
  [Interstate (Gujarat to Maharashtra)], [IGST (18%)], [On taxable goods of ₹10,000: IGST = ₹1,800. Total Bill = ₹11,800.]
)

#v(6pt)

== 3.2 Statutory GST Registration Thresholds & Scheme Selection
Under Section 22 of the CGST Act, business enterprises must obtain GST registration when their aggregate annual turnover exceeds the following statutory limits:

#table(
  columns: (1.3fr, 1.4fr, 1.3fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Taxpayer Category]], [#text(weight: "bold", fill: white)[Standard States (e.g. Gujarat)]], [#text(weight: "bold", fill: white)[Special Category States]], [#text(weight: "bold", fill: white)[Compliance Trigger & Rules]],
  [Exclusive Supply of Goods], [₹40 Lakhs Aggregate Turnover], [₹20 Lakhs Turnover], [Mandatory registration upon crossing ₹40 Lakhs; inter-state sales require registration regardless of turnover!],
  [Supply of Services / Mixed], [₹20 Lakhs Aggregate Turnover], [₹10 Lakhs Turnover], [Applies to IT consultants, professionals, contractors, coaching institutes, and restaurants.],
  [Composition Scheme], [Up to ₹1.5 Crore Turnover], [Up to ₹75 Lakhs Turnover], [Pay concessional flat tax (1% for traders/manufacturers, 5% for restaurants, 6% for service providers); no ITC permitted.]
)

#v(6pt)

== 3.3 The Four Modern GST Tax Slabs in India
Goods and services are categorized into four primary statutory rate slabs based on essentiality and social impact:

#table(
  columns: (1fr, 1.4fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[GST Slab]], [#text(weight: "bold", fill: white)[Category Nature]], [#text(weight: "bold", fill: white)[Practical Real-World Commodities & Services]],
  [0% (Exempt)], [Zero-Rated / Basic Necessities], [Unpackaged food grains, fresh vegetables, fresh fruits, unbranded milk, curd, salt, agricultural seeds (Jeera Seed, Taramira Oil seed), hand tools, educational and health services.],
  [5% (Essentials)], [Mass Consumption Goods], [Packaged food items, spices, tea, coffee, edible vegetable oils, life-saving medicines, diabetic care drugs, footwear under ₹1,000, rail/air economy transport, coal.],
  [18% (Standard)], [Corporate Workhorse Slab], [Electronics, computers, IT peripherals, software licenses, professional CA/legal fees, commercial transport, banking & insurance services, branded garments, AC hotel dining.],
  [28% (Luxury & Sin)], [Demerit & High-End Goods], [Motor cars, high-capacity motorcycles, air conditioners, refrigerators, cement, tobacco, cigarettes, aerated sweetened beverages (+ Compensation Cess).]
)

#v(6pt)

== 3.4 Anatomy of a 15-Digit GSTIN
Every registered business entity is assigned a 15-character Goods and Services Tax Identification Number (GSTIN):
- *Digits 01 - 02:* Two-digit State Code based on the Census 2011 (*24 for Gujarat*, 27 for Maharashtra, 08 for Rajasthan).
- *Digits 03 - 12:* Ten-character Permanent Account Number (PAN) of the business owner or legal corporation.
- *Digit 13:* Entity code within the state (1 for first registration, 2 for second vertical business branch).
- *Digit 14:* The letter *'Z'* by default for all registrations.
- *Digit 15:* A check-code character (digit or alphabet) calculated automatically to detect manual typographical errors.

#v(6pt)

== 3.5 Tax Deducted at Source (TDS) under Income Tax Act, 1961
*Tax Deducted at Source (TDS)* is an anti-tax evasion mechanism mandated by the Central Board of Direct Taxes (CBDT) under the Income Tax Act, 1961. The deductor (the person paying the expense) must deduct income tax at statutory rates before disbursing payments to the deductee (contractor, professional, or landlord) and deposit it into the central government treasury.

=== Major Corporate TDS Sections & Threshold Limits
#table(
  columns: (1fr, 1.4fr, 1.2fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Section]], [#text(weight: "bold", fill: white)[Nature of Payment]], [#text(weight: "bold", fill: white)[Statutory TDS Rate]], [#text(weight: "bold", fill: white)[Exemption Threshold Limit]],
  [Sec 194C], [Contractor / Sub-Contractor Works], [1% (Indiv/HUF) / 2% (Co.)], [₹30,000 (single) or ₹1,00,000 (aggregate p.a.)],
  [Sec 194J], [Fees for Professional / Technical Services], [10% (Prof.) / 2% (Tech Call Centre)], [₹30,000 per financial year],
  [Sec 194I], [Rent on Land, Building or Furniture], [10% (Land/Building) / 2% (Plant/Machinery)], [₹2,40,000 per financial year],
  [Sec 194H], [Commission or Brokerage Services], [5%], [₹15,000 per financial year]
)

#v(6pt)

=== Detailed Corporate TDS Calculation Worksheets
Corporate accountants must master the exact deduction, threshold, and booking entries across common business scenarios:

#table(
  columns: (0.4fr, 1.8fr, 1.2fr, 1.2fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Case]], [#text(weight: "bold", fill: white)[Transaction Description]], [#text(weight: "bold", fill: white)[Gross Billing]], [#text(weight: "bold", fill: white)[TDS Deducted]], [#text(weight: "bold", fill: white)[Net Cheque Paid]],
  [01], [Adv. Sharma (Legal Consulting under Sec 194J @ 10%)], [₹60,000.00], [₹6,000.00 (10%)], [₹54,000.00],
  [02], [Patel Logistics (Freight Contractor under Sec 194C @ 1%)], [₹1,20,000.00], [₹1,200.00 (1%)], [₹1,18,800.00],
  [03], [Commercial Showroom Rent to Landlord (Sec 194I @ 10%)], [₹3,00,000.00], [₹30,000.00 (10%)], [₹2,70,000.00],
  [04], [Real Estate Brokerage Fee to Agent (Sec 194H @ 5%)], [₹40,000.00], [₹2,000.00 (5%)], [₹38,000.00]
)

#v(6pt)

=== Statutory Compliance Schedule for Corporate TDS
1. *Monthly Payment:* TDS deducted in any calendar month must be deposited via *Challan ITNS 281* to the central government portal by the *7th day of the subsequent month* (except March deductions, which must be deposited by April 30th).
2. *Quarterly Return Filing:* Every corporate deductor must file *Form 26Q* (Quarterly Return of TDS for non-salary payments) within 31 days from the end of each quarter (Q1: July 31, Q2: Oct 31, Q3: Jan 31, Q4: May 31).
3. *TDS Certificate:* Deductors must issue *Form 16A* digitally signed certificates to vendors within 15 days of filing Form 26Q.

#concept-box(title: "Practical Accounting Proof: Passing a TDS Entry in Tally Prime")[
  *Scenario:* Ravi Private Limited receives a professional legal consultancy invoice of ₹50,000 from Adv. Sharma & Associates.\\
  - *Applicable Law:* Section 194J applies (exceeds ₹30,000 threshold). Rate = 10%.\\
  - *Calculation:* Total Fee = ₹50,000. TDS Deduction = 10% of ₹50,000 = ₹5,000. Net Payable to Adv. Sharma = ₹45,000.\\
  - *Journal Voucher Entry (#key-pill("F7")):*\\
    #h(15pt) *Dr.* Legal & Professional Expenses A/c ......... ₹50,000\\
    #h(25pt) *Cr.* Adv. Sharma & Associates (Party) ................. ₹45,000\\
    #h(25pt) *Cr.* TDS on Professional Fees Payable ................. ₹5,000\\
    (Narration: Being legal fees booked after deducting 10% TDS under Section 194J)
]

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 03 SUMMARY & KEY REVISION TAKEAWAYS]
    - Dual GST System: Intrastate supplies attract CGST + SGST (shared equally); Interstate supplies attract IGST.
    - GST Registration: ₹40 Lakhs turnover for goods, ₹20 Lakhs for services; Composition Scheme available up to ₹1.5 Crore.
    - Rate Slabs: 0% (Exempt basic staples), 5% (Essentials/Spices/Oils), 18% (Standard corporate workhorse), 28% (Luxury/Demerit).
    - GSTIN consists of 15 characters; first 2 digits represent State Code (*24 = Gujarat*), followed by 10-digit PAN.
    - TDS under Income Tax Act: Section 194C (Contractors 1%/2%), 194J (Professional 10%), 194I (Rent 10%/2%), 194H (Commission 5%).
    - Monthly TDS must be deposited by the 7th of the following month via *Challan ITNS 281*; filed quarterly in *Form 26Q*.
  ]
)

#v(8pt)

// MCQS
== Topic 03: High-Yield Exam & Interview MCQs

1. *What is the state code for Gujarat in a 15-digit GSTIN?*\\
   (A) 27 #h(10pt) (B) 24 #h(10pt) (C) 08 #h(10pt) (D) 07\\
   *Answer: (B)* | *Explanation:* Gujarat is assigned State Code 24 in the Indian GSTIN numbering system.

2. *Which GST is levied when a trader in Palanpur sells goods to a wholesaler in Rajkot (both in Gujarat)?*\\
   (A) IGST only #h(10pt) (B) CGST and SGST #h(10pt) (C) UTGST only #h(10pt) (D) Customs Duty\\
   *Answer: (B)* | *Explanation:* An intrastate sale within Gujarat attracts both CGST and SGST equally.

3. *Under Section 194J, what is the standard TDS rate on professional consultancy fees?*\\
   (A) 1% #h(10pt) (B) 2% #h(10pt) (C) 5% #h(10pt) (D) 10%\\
   *Answer: (D)* | *Explanation:* Section 194J mandates 10% TDS on professional fees exceeding ₹30,000.

4. *What is the statutory threshold limit for deduction of TDS on commercial building rent under Section 194I?*\\
   (A) ₹30,000 #h(10pt) (B) ₹1,00,000 #h(10pt) (C) ₹2,40,000 #h(10pt) (D) ₹5,00,000\\
   *Answer: (C)* | *Explanation:* Section 194I applies when rent paid to a landlord exceeds ₹2,40,000 per financial year.

5. *What is the monthly statutory due date for depositing TDS into the government account via Challan 281?*\\
   (A) 1st of next month #h(10pt) (B) 7th of next month #h(10pt) (C) 20th of next month #h(10pt) (D) Last day of quarter\\
   *Answer: (B)* | *Explanation:* TDS must be deposited by the 7th of the month following the month of deduction.

6. *Which quarterly return form is filed for non-salary TDS deductions?*\\
   (A) Form 24Q #h(10pt) (B) Form 26Q #h(10pt) (C) Form 16A #h(10pt) (D) Form 3B\\
   *Answer: (B)* | *Explanation:* Form 26Q is the quarterly statement of non-salary TDS under Sections 194C/J/I/H.

7. *Which of the following commodities falls under the 0% (Exempt) GST slab?*\\
   (A) Branded packaged rice #h(10pt) (B) Unpackaged agricultural Jeera Seed #h(10pt) (C) Air conditioner #h(10pt) (D) Laptop\\
   *Answer: (B)* | *Explanation:* Unbranded agricultural produce and seeds are zero-rated / exempt under GST.

8. *What challan number is used to deposit corporate TDS into the RBI / authorized bank treasury?*\\
   (A) ITNS 280 #h(10pt) (B) ITNS 281 #h(10pt) (C) PMT-06 #h(10pt) (D) GSTR-3B\\
   *Answer: (B)* | *Explanation:* Challan ITNS 281 is specifically designated for depositing TDS and TCS.

9. *What is the turnover threshold for a trader supplying goods exclusively within Gujarat to register under GST?*\\
   (A) ₹10 Lakhs #h(10pt) (B) ₹20 Lakhs #h(10pt) (C) ₹40 Lakhs #h(10pt) (D) ₹1 Crore\\
   *Answer: (C)* | *Explanation:* The threshold for exclusive suppliers of goods in standard states like Gujarat is ₹40 Lakhs.

10. *Under Section 194C, what is the TDS rate when payment is made to an Individual / HUF transport contractor?*\\
   (A) 1% #h(10pt) (B) 2% #h(10pt) (C) 5% #h(10pt) (D) 10%\\
   *Answer: (A)* | *Explanation:* Section 194C mandates 1% TDS for Individual/HUF contractors and 2% for corporate contractors.

#v(6pt)

// VIVA & LAB
== Topic 03: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain the difference between CGST, SGST, and IGST with an example.\\
  *Answer:* CGST and SGST apply to intrastate sales within the same state (revenue shared 50:50). IGST applies to interstate sales between different states (revenue collected centrally and transferred to destination state).
- *Viva Q2:* What is the penalty for failing to deduct TDS or late deposit?\\
  *Answer:* Interest is levied at 1% per month for failure to deduct and 1.5% per month for delay in depositing deducted TDS from the date of deduction to actual payment date, plus disallowance of 30% of expense under Section 40(a)(ia).
- *Hands-On Lab Task:* In Tally Prime, navigate to F11 Features, enable Goods and Services Tax (GST), enter Gujarat State Code 24, set your institute GSTIN, and create two tax ledgers: *CGST* and *SGST* under *Duties & Taxes*.
"""

    return chapters
