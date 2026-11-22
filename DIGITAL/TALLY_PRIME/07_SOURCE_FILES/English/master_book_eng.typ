#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-tally-cover
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-tally-cover-hi
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-tally-cover-gu

#set document(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  author: "Rahul Patel"
)

// COVER PAGE
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-tally-cover(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  subtitle: "Double Entry Bookkeeping · 28 Predefined Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Commercial Invoices",
  edition: "2027 MASTER COMMERCIAL EDITION · EDITION 1",
  series-pill: "OFFICIAL RTECHLAB & IANT CERTIFIED PUBLICATION",
  author: "Rahul Patel",
  author-title: "Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab",
  lang-tag: "ENGLISH MASTER EDITION",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png"
)

#pagebreak()

// MASTER BOOK SETTINGS
#show: rtech-tally-book.with(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  subtitle: "Double Entry Bookkeeping · 28 Predefined Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Commercial Invoices",
  author: "Rahul Patel",
  edition: "2027 Master Commercial Edition",
  lang: "en"
)


= Course Architecture & Academic Framework

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1.2pt + rgb("#0E7490"),
  radius: 4pt,
  inset: 10pt,
  [
    #text(weight: "black", size: 9pt, fill: rgb("#0E7490"))[OFFICIAL RTECHLAB & IANT INSTITUTIONAL ACCREDITATION:]    #v(3pt)
    #text(size: 8pt, fill: rgb("#334155"))[
      This master publication represents the standardized commercial curriculum developed by Rahul Patel (Lead Corporate Accounting Trainer at IANT Palanpur and Founder of RTechLab). Bridging the critical chasm between conventional classroom theory and real-world corporate accounting practice, this syllabus prepares accounting students, CA articles, and working professionals for high-velocity corporate roles.
    ]
  ]
)

#v(8pt)

== Institutional Mission & Pedagogical Standards
Every chapter, transaction, and statutory case study in this handbook adheres to three uncompromising institutional benchmarks:
1. *100% Statutory Alignment:* Formatted strictly according to Central Goods and Services Tax Act 2017 (CGST Rule 46), Income Tax Act 1961 (Sections 194C, 194J, 194I, 194H), and MCA Audit Trail mandates.
2. *Real-World Commercial Fidelity:* Zero artificial placeholders. Every invoice, GSTIN, PAN, and bank voucher replicates live Indian corporate accounting operations across Gujarat, Maharashtra, and Karnataka.
3. *Zero-Mouse Keyboard Proficiency:* Students are trained to operate Tally Prime exclusively via high-speed keyboard shortcuts, achieving 3x to 5x higher workplace productivity.

#v(10pt)

== National Statutory Accounting Regulatory Alignment
#table(
  columns: (1.2fr, 1.3fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Regulatory Body]], [#text(weight: "bold", fill: white)[Governing Legislation]], [#text(weight: "bold", fill: white)[Curriculum Integration & Practical Impact]],
  [GST Council & CBIC], [CGST / SGST / IGST Acts 2017], [Rule 46 Tax Invoices, Section 16(2)(aa) GSTR-2B matching, E-Way bills, and E-Invoicing.],
  [CBDT / Income Tax], [Income Tax Act, 1961], [TDS withholding under 194C/J/I, Form 26Q quarterly returns, Section 206AA penal rates.],
  [Ministry of Corporate Affairs], [Companies Act, 2013], [Audit Trail (Edit Log) rule, Schedule III vertical balance sheets, and depreciation schedules.],
  [Institute of Chartered Accountants], [Indian Accounting Standards (Ind AS)], [Luca Pacioli double-entry rules, accrual concepts, and valuation of closing stock (NRV).]
)

#pagebreak()

= The 11-Topic Curriculum Roadmap & Competency Matrix

#table(
  columns: (0.7fr, 1.8fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Topic]], [#text(weight: "bold", fill: white)[Curriculum Domain]], [#text(weight: "bold", fill: white)[Core Practical Learning Outcomes]],
  [Topic 01], [History of Tally & Licensing], [Bharat Goenka, 80% market share, download from tallysolutions.com, Silver/Gold/Edu mode, TGS LAN.],
  [Topic 02], [What is Tally Prime & Architecture], [Cactus in-memory DB, Top menu (Alt+K/Y/Z/O/E/M/P), Go To (Alt+G) multi-tasking, 4 GOT quadrants.],
  [Topic 03], [Comprehensive GST & TDS Foundation], [CGST+SGST vs IGST, 0% Exempt, 5% Essentials, 18% Standard slabs, Sec 194C/J/I/H, Form 26Q schedule.],
  [Topic 04], [Ledgers, Accounts & Golden Rules], [Personal, Real & Nominal accounts, Luca Pacioli rules, Mr. Verma 50-transaction workflow, 20 cash entries.],
  [Topic 05], [Vouchers & 4 Main Categories], [Accounting, Inventory, Order & Memo categories, 24 vouchers with shortcuts, Edit Log audit trail.],
  [Topic 06], [Groups & Complete Ledger Mapping], [15 Primary + 13 Secondary groups, 70+ real account mappings (Salman, HDFC, Taxes), Trial Balance audit.],
  [Topic 07], [Company & Step-by-Step Creation], [Company creation, Gujarat Code 24, FY beginning, Tally Vault AES encryption, 5 practical companies.],
  [Topic 08], [Types of Business Organizations], [Trading concerns (Unjha Mandi), Manufacturing with BOM (Morbi Ceramics), Service providers, E-commerce.],
  [Topic 09], [Practical Commercial Invoices], [6 authentic invoices rendered: Purchase Exempt, GST 18%, Interstate IGST, Sales GST, Sales IGST, Services.],
  [Topic 10], [Master Keyboard Shortcuts (50+)], [General navigation, master alteration, voucher shortcuts, report generation, and 30-second speed runs.],
  [Topic 11], [Corporate Bridge Highlights], [GST portal returns (GSTR-1/3B/2B), BRS bank reconciliation, CTS-2010 cheque, Cost Centres, Data Split.]
)

#v(8pt)

== Professional Competency Assessment Standards
Students completing this curriculum are evaluated on a 4-tier grading scale:
- *Distinction (> 90%):* Demonstrates instant zero-mouse shortcut fluency, flawless GSTR-2B reconciliation, and complete mastery of BOM manufacturing.
- *First Class (75% - 89%):* Accurately passes all 6 voucher types, creates error-free multi-state GST invoices, and resolves Trial Balance variances.
- *Corporate Pass (60% - 74%):* Successfully records basic cash/bank vouchers, generates Day Book reports, and explains the 3 Golden Rules.


#pagebreak()

= Topic 01: History of Tally, Evolution & Downloading Tally Prime

== 1.1 The Genesis of Tally: A Proud Indian Innovation
The story of Tally represents one of the most remarkable breakthroughs in the global software industry. In 1986, *#ul-yellow[Shyam Sundar Goenka]*, an entrepreneur running a textile machinery spare parts business in Bangalore, faced severe challenges with manual paper-based bookkeeping. Every transaction required tedious physical ledger entries, and errors in trial balances took weeks to trace. At the time, early business computer systems were prohibitively expensive and required complex database programming knowledge.

Determined to find an automated yet user-friendly solution, #ul-yellow[Shyam Sundar Goenka] challenged his son, *#hl-yellow[Bharat Goenka]* (a mathematics graduate with a passion for software design), to develop an accounting tool that any Indian accountant could use in natural commercial language without writing computer code.

#hl-yellow[Bharat Goenka] founded *#ul-yellow[Peutronics Financial Services]* in Bangalore in 1986. Operating from a small office, he created *The Accountant*, the world's first "codeless" accounting software. In 1999, recognizing the immense nationwide adoption and the verb "to tally" (to agree or balance accounts), the enterprise was officially renamed *Tally Solutions Pvt. Ltd.*

Today, headquartered in Bangalore, Tally dominates the Indian business landscape with over *#hl-yellow[80% market share]* across micro, small, and medium enterprises (MSMEs), large industrial corporations, government boards, and Chartered Accountancy firms.

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
          #text(weight: "black", size: 8.5pt, fill: rgb("#0F172A"))[Shyam Sundar Goenka]\
          #text(size: 7pt, fill: rgb("#0E7490"), weight: "bold")[Visionary Co-Founder (1932 - 2002)]\
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
          #text(weight: "black", size: 8.5pt, fill: rgb("#0F172A"))[Bharat Goenka]\
          #text(size: 7pt, fill: rgb("#0E7490"), weight: "bold")[Managing Director & Tech Architect]\
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
    #image("../../02_BRAND_ASSETS/tally_classic_logo.png", width: 50mm)
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
7. Click *Install* to accept the default program path (`C:\Program Files\TallyPrime`) or click *Configure* to choose an alternative drive (e.g., `D:\TallyPrime`).
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
    - Tally was founded in 1986 by #ul-yellow[Shyam Sundar Goenka] and #hl-yellow[Bharat Goenka] under the initial company name *Peutronics*.
    - Rebranded to *Tally Solutions Pvt. Ltd.* in 1999; commands over *#hl-yellow[80% market share]* in Indian business accounting.
    - Evolution: DOS-based Tally 4.5 -> Windows 5.4 -> VAT-compliant 7.2 -> ERP workhorse Tally.ERP 9 -> Modern Tally Prime.
    - Key Tally Prime advantages: Clean light interface, Go To (Alt+G) multi-tasking, standard Ctrl+C/V, direct e-Invoicing.
    - Download verified installer exclusively from #link("https://tallysolutions.com")[tallysolutions.com] (`setup.exe`).
    - *Silver* is single-user commercial, *Gold* is multi-user LAN commercial, and *Educational Mode* is 100% free for learning with date entry limited to 1st, 2nd, and 31st.
  ]
)

#v(8pt)

// MCQS

== 1.7 Chronological Feature Evolution Matrix from Peutronics 1986 to Tally Prime 5.0
#table(
  columns: (1fr, 0.8fr, 1.2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Tally Edition]], [#text(weight: "bold", fill: white)[Release Year]], [#text(weight: "bold", fill: white)[Operating System]], [#text(weight: "bold", fill: white)[Milestone Capabilities & Architectural Leaps]],
  [The Accountant], [1986], [MS-DOS 3.3], [First codeless accounting software developed by #hl-yellow[Bharat Goenka] in Bangalore.],
  [Tally 4.5], [1992], [MS-DOS], [Financial accounting engine with basic stock inventory; widely adopted by Indian traders.],
  [Tally 5.4], [1996], [Windows 95/NT], [Transition from DOS to native 32-bit graphical Windows interface; automated trial balance.],
  [Tally 6.3], [2001], [Windows 98/2000], [Introduction of Indian Value Added Tax (VAT), multi-currency, and ODBC connectivity.],
  [Tally 7.2], [2005], [Windows XP], [Integrated statutory compliance for state-level VAT across all Indian states and Union Territories.],
  [Tally 8.1], [2006], [Windows XP/Vista], [Multi-lingual user interface with 10 Indian regional languages and POS billing.],
  [Tally 9.0], [2006], [Windows XP/7], [Integrated ERP capabilities: Payroll processing, TDS, FBT, and multi-cost centre budgeting.],
  [Tally.ERP 9], [2009], [Windows 7/8/10], [Remote access, Tally.NET, banking automation, and comprehensive GST support in 2017.],
  [Tally Prime 1.0], [2020], [Windows 64-bit], [Complete modern UI redesign, Go To (Alt+G) multi-tasking, top navigation bar.],
  [Tally Prime 2.0-3.0], [2021-2023], [Windows 10/11], [WhatsApp integration, connected e-invoicing and e-way bill generation, multi-GSTIN.],
  [Tally Prime 4.x-5.x], [2024-2027], [Windows 11 / Server], [Connected banking APIs, instantaneous payment reconciliation, and modern audit trail.]
)

#v(6pt)

== 1.8 Enterprise Multi-User LAN Deployment with Tally Gateway Server (TGS)
In corporate enterprises where dozens of accounts executives, billing operators, and storekeepers work simultaneously, Tally Prime Gold operates via a client-server architecture powered by the *Tally Gateway Server (TGS)*:
1. *Dedicated License Server:* One host machine on the local area network (LAN) acts as the License Server, running the TGS service bound to TCP port `9000`.
2. *Static IP Binding:* The server is assigned a dedicated static private IP address (e.g., `192.168.1.100`), ensuring uninterrupted connectivity for client workstations.
3. *Client Configuration:* Workstations install Tally Prime and select *Select Existing License > Connect to Tally Gateway Server*, specifying the server IP and port `9000`.
4. *Data Centralization:* The shared company database resides in a shared network folder with strict Windows NTFS read/write permissions, preventing unauthorized file manipulation while permitting multi-user concurrent access.

#v(6pt)


== 1.9 Enterprise Comparison: Tally Silver vs Tally Gold vs Tally Prime Server
Corporate organizations choose their licensing tier based on network concurrency and multi-user data volume:

#table(
  columns: (1fr, 1.3fr, 1.3fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Capability]], [#text(weight: "bold", fill: white)[Tally Silver (Single User)]], [#text(weight: "bold", fill: white)[Tally Gold (Multi User)]], [#text(weight: "bold", fill: white)[Tally Prime Server]],
  [Concurrent Users], [1 User on 1 Machine], [Unlimited Users across LAN], [Dozens of high-speed concurrent users with dedicated server thread.],
  [Target Business], [Micro firms, solo accountants, traders.], [SMEs, CA firms, multi-branch stores.], [Large corporations, factories, retail chains.],
  [Database Throughput], [Standard desktop database engine.], [Standard shared LAN database.], [Enterprise-grade server with multi-threaded parallel queue.],
  [User Access Security], [Basic login password.], [Security Control with user roles.], [Advanced user activity monitoring and process isolation.],
  [Crash Resilience], [Standard desktop crash recovery.], [Network shared cache recovery.], [Zero downtime; isolated crash prevents server interruption.]
)

#v(6pt)

== Topic 01: High-Yield Exam & Interview MCQs

1. *Who is regarded as the father of Tally and developed its first codeless engine?*\
   (A) Narayana Murthy #h(10pt) (B) #hl-yellow[Bharat Goenka] #h(10pt) (C) Azim Premji #h(10pt) (D) #ul-yellow[Shyam Sundar Goenka]\
   *Answer: (B)* | *Explanation:* #hl-yellow[Bharat Goenka] developed "The Accountant" in 1986 and architected the Cactus engine.

2. *What was the original company name of Tally Solutions when founded in 1986?*\
   (A) Tally India Pvt Ltd #h(10pt) (B) #ul-yellow[Peutronics Financial Services] #h(10pt) (C) Indian Software Corp #h(10pt) (D) Cactus ERP Ltd\
   *Answer: (B)* | *Explanation:* Peutronics was founded in Bangalore in 1986 and renamed Tally Solutions in 1999.

3. *In Educational Mode of Tally Prime, on which dates of a calendar month can vouchers be recorded?*\
   (A) Any Sunday #h(10pt) (B) 1st to 10th #h(10pt) (C) 1st, 2nd, and 31st #h(10pt) (D) Only on the 15th\
   *Answer: (C)* | *Explanation:* Educational Mode restricts dates to 1, 2, and 31 to encourage commercial license purchases.

4. *Which operating system architecture is strictly required to run modern Tally Prime?*\
   (A) 16-bit DOS #h(10pt) (B) 32-bit Windows #h(10pt) (C) 64-bit Windows #h(10pt) (D) Any Linux without Wine\
   *Answer: (C)* | *Explanation:* Tally Prime requires 64-bit Windows 7/8/10/11 or Windows Server.

5. *What is the primary difference between Tally Silver and Tally Gold editions?*\
   (A) Gold supports GST while Silver does not #h(10pt) (B) Silver is single-user; Gold is multi-user on local LAN\
   (C) Silver is free; Gold is paid #h(10pt) (D) Gold can only be rented\
   *Answer: (B)* | *Explanation:* Silver allows 1 active desktop; Gold supports concurrent multi-user LAN access.

6. *What approximate market share does Tally command across Indian business accounting?*\
   (A) 25% #h(10pt) (B) 50% #h(10pt) (C) Over 80% #h(10pt) (D) 99%\
   *Answer: (C)* | *Explanation:* Tally commands over #hl-yellow[80% market share] across MSMEs, CAs, and retail in India.

7. *Which keyboard shortcut in Tally.ERP 9 was required to copy text, which has now been replaced by standard Ctrl+C in Tally Prime?*\
   (A) Alt + C #h(10pt) (B) Ctrl + Alt + C #h(10pt) (C) Shift + C #h(10pt) (D) F12\
   *Answer: (B)* | *Explanation:* Tally.ERP 9 used Ctrl+Alt+C for copy and Ctrl+Alt+V for paste; Tally Prime supports standard Ctrl+C and Ctrl+V.

8. *What is the default installation path of Tally Prime on a 64-bit Windows operating system?*\
   (A) `C:\Tally` #h(10pt) (B) `C:\Program Files\TallyPrime` #h(10pt) (C) `C:\Windows\Tally` #h(10pt) (D) `D:\Data`\
   *Answer: (B)* | *Explanation:* Tally Prime defaults to `C:\Program Files\TallyPrime` on standard 64-bit Windows installations.

9. *In which year was #ul-yellow[Peutronics Financial Services] formally renamed Tally Solutions Pvt. Ltd.?*\
   (A) 1986 #h(10pt) (B) 1991 #h(10pt) (C) 1999 #h(10pt) (D) 2005\
   *Answer: (C)* | *Explanation:* In 1999, the company embraced the brand name Tally Solutions Pvt. Ltd.

10. *Which Tally Prime license edition is engineered to run via a centralized Tally Gateway Server across multiple LAN workstations?*\
    (A) Silver #h(10pt) (B) Gold #h(10pt) (C) Educational #h(10pt) (D) Single User\
    *Answer: (B)* | *Explanation:* Tally Gold runs the multi-user Tally Gateway Server for concurrent network voucher processing.

#v(6pt)

// VIVA & LAB
== Topic 01: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Why did #ul-yellow[Shyam Sundar Goenka] want a codeless accounting system in 1986?\
  *Answer:* Because existing computer systems required complex programming and external database specialists, making them impractical for ordinary Indian traders.
- *Viva Q2:* How can an institute or student use Tally Prime without purchasing a commercial license?\
  *Answer:* By launching Tally Prime in *Educational Mode*, which provides full double-entry, inventory, and GST features with a transaction date restriction (1st, 2nd, 31st).
- *Viva Q3:* What is the functional distinction between Tally Silver and Tally Gold in a multi-department enterprise?\
  *Answer:* Tally Silver is locked to a single machine for single-accountant use. Tally Gold runs a centralized license service enabling multiple data entry operators, billing clerks, and CAs to work on the same company simultaneously across the local network.
- *Hands-On Lab Task:* Download `setup.exe` from `tallysolutions.com`, install Tally Prime on your PC, launch the software, select *Continue in Educational Mode*, and note down the version and license status displayed on the top left.

#pagebreak()

= Topic 02: What is Tally Prime & System Architecture

== 2.1 What is Tally Prime?
*Tally Prime* is an enterprise-grade business management and Enterprise Resource Planning (ERP) software suite designed specifically for micro, small, medium, and large corporations. At its core, Tally Prime integrates double-entry financial accounting, inventory management with batch/expiry tracking, statutory tax compliance (GST, TDS, TCS), banking integration, sales and purchase order workflows, and employee payroll management into a single cohesive, high-performance platform.

Unlike traditional relational accounting software that forces data entry operators to remember rigid alphanumeric chart-of-accounts codes (e.g., account `4010-002`), Tally Prime operates on *natural commercial accounting*. An accountant records a transaction using standard business vouchers—such as an F5 Payment, F6 Receipt, or F8 Sales Invoice. 

The moment a voucher is accepted, Tally Prime instantly and simultaneously updates the relevant ledger accounts, customer/supplier balances, inventory stock ledgers, #ul-green[Trial Balance], Profit & Loss Account, Balance Sheet, and statutory GST returns (#ul-green[GSTR-1] and #ul-green[GSTR-3B]) with zero batch processing delay!

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
  [4. Reports], [Balance Sheet, Profit & Loss A/c, Stock Summary, Ratio Analysis, Display More Reports], [Generate instant audited financial statements, inventory valuation trees, liquidity ratios, GST statutory returns, and #ul-green[Trial Balance].]
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
    - #hl-yellow[Gateway of Tally (GOT)] is structured into 4 sections: Masters, Transactions, Utilities, and Reports.
    - Operates on *natural commercial accounting*—vouchers immediately update all financial books and tax returns.
    - Powered by the proprietary *Cactus Engine*, an in-memory RAM database enabling sub-millisecond dynamic recalculation without SQL disk bottlenecks.
    - Top Menu Bar provides unified access: #key-pill("Alt+K") (Company), #key-pill("Alt+Y") (Data), #key-pill("Alt+Z") (Exchange), #key-pill("Alt+O") (Import), #key-pill("Alt+E") (Export), #key-pill("Alt+M") (Email), #key-pill("Alt+P") (Print).
    - *Go To (#key-pill("Alt+G"))* enables seamless multi-tasking and instant report discovery without losing active transaction state.
  ]
)

#v(8pt)

// MCQS

== 2.6 The 4 Operational Quadrants of the Gateway of Tally
The #hl-yellow[Gateway of Tally (GOT)] is the central command console of Tally Prime. It is divided into 4 primary operational quadrants:

#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Quadrant]], [#text(weight: "bold", fill: white)[Menu Options]], [#text(weight: "bold", fill: white)[Operational Capabilities & Business Function]],
  [1. Masters], [Create, Alter, Chart of Accounts], [Create and modify foundational accounting accounts (Ledgers, Groups), inventory items (Stock Items, Units, Godowns, Categories), statutory tax rates, and payroll heads.],
  [2. Transactions], [Vouchers, Day Book], [Record daily commercial operations (Sales, Purchase, Payment, Receipt, Contra, Journal). Day Book displays all daily chronological vouchers with drill-down audit capability.],
  [3. Utilities], [Banking], [Access Cheque Printing, Cheque Register, Post-Dated Cheque Management, #hl-green[Bank Reconciliation Statement (BRS)], and Deposit Slips.],
  [4. Reports], [Balance Sheet, P&L, Stock Summary, Ratio Analysis], [Generate executive statutory financial statements: Balance Sheet (financial position), Profit & Loss Account (operating net income), Stock Summary (inventory valuation), and Ratio Analysis (liquidity and solvency).]
)

#v(6pt)

== 2.7 Global F12 Configuration vs Company-Wide F11 Features Architecture
Understanding the fundamental boundary between F11 and F12 is a hallmark of an advanced corporate accountant:
- *F11 Company Features (Company Level):* System-wide operational switches enabled per company. For example, enabling GST, enabling TDS, activating multi-currency, or activating Cost Centres. Once enabled in F11, the feature becomes accessible across all vouchers and masters.
- *F12 Configurations (Screen Level):* Context-specific user interface preferences that alter how a specific screen behaves. For example, configuring whether to provide supplier invoice numbers, show ledger current balances, or display buyer contact details during voucher entry. Pressing F12 on the Balance Sheet shows Balance Sheet options; pressing F12 in Sales Voucher shows Sales Invoice options!

#v(6pt)


== 2.8 Tally Prime Data Directory Architecture & File Structure
Inside the corporate data folder (e.g., `C:\TallyPrime\Data@00`), Tally Prime maintains its proprietary database structure:
- `Company.900`: Encrypted master metadata storing company name, fiscal calendar, currency, and security state.
- `Trans.900`: Core chronological transaction journal containing all voucher records and double-entry postings.
- `Manager.900`: Internal indexing file managing pointer arrays for rapid zero-latency search queries.
- `Audit.900`: Immutable statutory Edit Log tracking all voucher creations, modifications, and user timestamps.

#v(6pt)


== 2.9 The 10 Foundational Principles of Chart of Accounts in Tally Prime
A properly structured Chart of Accounts (COA) is the backbone of flawless computerized bookkeeping:
1. *Zero Duplicate Accounts:* Never create multiple ledgers for the same vendor or customer. Utilize sub-groups or cost centres instead.
2. *Precise Statutory Grouping:* Ensure every tax ledger is nested under *Duties & Taxes* to allow automated tax algorithms to fire correctly.
3. *Consistent Naming Conventions:* Standardize nomenclature (e.g., `Customer Name (City)` or `Vendor Name Pvt Ltd`).
4. *Mandatory Bill-by-Bill Activation:* Always set *Maintain balances bill-by-bill* to *Yes* for all Sundry Debtors and Sundry Creditors.
5. *Statutory Address & PIN Integrity:* Always enter full postal addresses and correct 6-digit PIN codes to support automated E-Way bill distance calculation.
6. *PAN & GSTIN Synchronization:* Verify that the 10-character PAN embedded within the 15-digit GSTIN matches the party's income tax records.
7. *Bank Account Allocation:* Enter valid IFSC codes and branch names for seamless automated e-payments and BRS import.
8. *Opening Balance Audit:* Ensure debit and credit opening balances balance out to zero difference; unallocated differences report to Suspense A/c!
9. *Default Currency Assignment:* Lock base currency symbol to ₹ for domestic ledgers and configure forex rates for foreign suppliers.
10. *Periodic Inactive Account Purging:* Regularly mark dormant ledgers as inactive to streamline data entry dropdowns.

#v(6pt)

== Topic 02: High-Yield Exam & Interview MCQs

1. *What is the proprietary database engine that powers Tally Prime's real-time calculations?*\
   (A) Oracle DB #h(10pt) (B) Cactus Engine #h(10pt) (C) SQLite Engine #h(10pt) (D) Postgres Engine\
   *Answer: (B)* | *Explanation:* Cactus is Tally's in-memory object-oriented database engine developed in-house.

2. *Which keyboard shortcut invokes the revolutionary 'Go To' multi-tasking search bar in Tally Prime?*\
   (A) Ctrl + F #h(10pt) (B) Alt + G #h(10pt) (C) Alt + S #h(10pt) (D) Ctrl + G\
   *Answer: (B)* | *Explanation:* Alt+G opens the Go To search bar from any screen in Tally Prime.

3. *Which top-menu shortcut allows an accountant to backup or split company data?*\
   (A) Alt + K #h(10pt) (B) Alt + Y #h(10pt) (C) Alt + Z #h(10pt) (D) Alt + E\
   *Answer: (B)* | *Explanation:* Alt+Y opens the Data Menu for Backup, Restore, and Split Data.

4. *What language is used to design menus, screens, and custom reports in Tally Prime?*\
   (A) Python #h(10pt) (B) TDL (Tally Definition Language) #h(10pt) (C) Java #h(10pt) (D) C++\
   *Answer: (B)* | *Explanation:* TDL is Tally's proprietary action-oriented programming language.

5. *Why does Tally Prime calculate Balance Sheet figures faster than conventional RDBMS systems?*\
   (A) It skips double-entry validation #h(10pt) (B) It processes the entire hierarchical tree in RAM\
   (C) It only stores rounded values #h(10pt) (D) It uses external cloud servers\
   *Answer: (B)* | *Explanation:* Cactus in-memory architecture recalculates trees directly in system RAM.

6. *What happens to an active, unsaved voucher when you use Alt+G to view the Cash Book?*\
   (A) It gets permanently deleted #h(10pt) (B) It is auto-saved as draft\
   (C) It remains paused in memory; pressing Esc returns to it #h(10pt) (D) Tally crashes\
   *Answer: (C)* | *Explanation:* Tally Prime preserves the active screen state during Go To navigation.

7. *Under which Gateway of Tally section are options like Cheque Printing and Bank Reconciliation located?*\
   (A) Masters #h(10pt) (B) Transactions #h(10pt) (C) Utilities (Banking) #h(10pt) (D) Reports\
   *Answer: (C)* | *Explanation:* Banking utilities (cheque printing, BRS, deposit slips) are located under Utilities.

8. *What file extension is used by Tally Prime to store its core database object tree in numerical folders?*\
   (A) `.sql` #h(10pt) (B) `.900` #h(10pt) (C) `.dat` #h(10pt) (D) `.dbf`\
   *Answer: (B)* | *Explanation:* Tally Prime stores its binary database files with the `.900` file extension (e.g., `Company.900`).

9. *Which key combination shuts or closes an active loaded company in Tally Prime?*\
   (A) Alt + F1 #h(10pt) (B) Ctrl + F3 #h(10pt) (C) Alt + K > Shut #h(10pt) (D) Both (B) and (C)\
   *Answer: (D)* | *Explanation:* Both Ctrl+F3 and Alt+K > Shut safely close an open company.

10. *What is the primary role of the Chart of Accounts menu under Masters in Gateway of Tally?*\
    (A) Print invoices #h(10pt) (B) View master hierarchies (Groups, Ledgers, Stock) in a unified tree\
    (C) Calculate GST returns #h(10pt) (D) Download updates\
    *Answer: (B)* | *Explanation:* Chart of Accounts displays the complete parent-child relational tree of all business masters.

#v(6pt)

// VIVA & LAB
== Topic 02: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain how Tally Prime's Go To (Alt+G) feature improves corporate accounting efficiency.\
  *Answer:* It eliminates workflow interruptions by allowing accountants to open any ledger, stock report, or financial ratio from within an active voucher entry, check balances, and resume data entry instantly.
- *Viva Q2:* What is the difference between Alt+K and Alt+Y in Tally Prime?\
  *Answer:* Alt+K accesses the Company Menu (creation, alteration, security, and selection), whereas Alt+Y accesses the Data Menu (data path configuration, backup, restore, and company data splitting).
- *Hands-On Lab Task:* Open Tally Prime, navigate to the Gateway of Tally, press #key-pill("Alt + G"), search for "Balance Sheet", press Enter, inspect the liabilities and assets, and press #key-pill("Esc") to return to the Gateway of Tally.

#pagebreak()

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
2. *Quarterly Return Filing:* Every corporate deductor must file *#ul-green[Form 26Q]* (Quarterly Return of TDS for non-salary payments) within 31 days from the end of each quarter (Q1: July 31, Q2: Oct 31, Q3: Jan 31, Q4: May 31).
3. *TDS Certificate:* Deductors must issue *Form 16A* digitally signed certificates to vendors within 15 days of filing #ul-green[Form 26Q].

#concept-box(title: "Practical Accounting Proof: Passing a TDS Entry in Tally Prime")[
  *Scenario:* Ravi Private Limited receives a professional legal consultancy invoice of ₹50,000 from Adv. Sharma & Associates.\
  - *Applicable Law:* #ul-orange[Section 194J] applies (exceeds ₹30,000 threshold). Rate = 10%.\
  - *Calculation:* Total Fee = ₹50,000. TDS Deduction = 10% of ₹50,000 = ₹5,000. Net Payable to Adv. Sharma = ₹45,000.\
  - *Journal Voucher Entry (#key-pill("F7")):*\
    #h(15pt) *Dr.* Legal & Professional Expenses A/c ......... ₹50,000\
    #h(25pt) *Cr.* Adv. Sharma & Associates (Party) ................. ₹45,000\
    #h(25pt) *Cr.* TDS on Professional Fees Payable ................. ₹5,000\
    (Narration: Being legal fees booked after deducting #hl-orange[10% TDS] under #ul-orange[Section 194J])
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
    - TDS under Income Tax Act: #ul-orange[Section 194C] (Contractors 1%/2%), 194J (Professional 10%), 194I (Rent 10%/2%), 194H (Commission 5%).
    - Monthly TDS must be deposited by the 7th of the following month via *Challan ITNS 281*; filed quarterly in *#ul-green[Form 26Q]*.
  ]
)

#v(8pt)

// MCQS

== 3.6 Statutory Input Tax Credit (ITC) Rules under Section 16 & Blocked ITC (Sec 17(5))
#hl-green[Input Tax Credit (ITC)] is the core mechanism that prevents cascading taxation under GST. However, claiming ITC is subject to strict statutory preconditions:

#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Statutory Dimension]], [#text(weight: "bold", fill: white)[Legal Precondition under CGST Act, 2017]],
  [Possession of Tax Invoice], [The buyer must possess a valid legal Tax Invoice, Debit Note, or Bill of Entry issued by an approved registered supplier under #ul-orange[Rule 46].],
  [Physical Receipt of Goods], [Goods or services must have been physically received. In "Bill To - Ship To" scenarios, receipt by the designated third party qualifies.],
  [Tax Actually Paid to Government], [The supplier must have deposited the collected tax with the Government via cash or eligible ITC in their monthly #ul-green[GSTR-3B] return.],
  [#ul-green[GSTR-2B] Matching (Sec 16(2)(aa))], [ITC is strictly restricted to invoices uploaded by the supplier in #ul-green[GSTR-1] and appearing in the buyer's auto-drafted #ul-green[GSTR-2B] statement.],
  [Blocked ITC under #ul-orange[Section 17(5)]], [ITC is permanently prohibited on: Motor vehicles for transport of persons (seating <= 13), Food & beverages, Outdoor catering, Health insurance, Membership of clubs, Personal gifts/free samples, and Goods lost, stolen, or destroyed!]
)

#v(6pt)

== 3.7 GST Invoicing Compliance: E-Way Bills & E-Invoicing Thresholds
1. *E-Way Bill (Rule 138):* Mandatory electronic consignment note generated on the e-way bill portal for any movement of goods whose consignment value exceeds *₹50,000* (Interstate or Intrastate in Gujarat). Contains Part A (Consignor/Consignee GSTIN, HSN, Value) and Part B (Vehicle number, Transporter ID).
2. *E-Invoicing (Rule 48(4)):* Mandatory for businesses with aggregate annual turnover exceeding *₹5 Crores* in any preceding financial year. Invoices must be reported to the Invoice Registration Portal (IRP), which authenticates the payload and generates a 64-character *Invoice Reference Number (IRN)* and a cryptographically signed *QR Code* printed on the invoice!

#v(6pt)


== 3.8 Comprehensive GST Statutory Return Filing Architecture
Under Indian GST compliance, regular taxpayers must adhere to a strict statutory filing calendar:

#table(
  columns: (0.9fr, 1.3fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Return Form]], [#text(weight: "bold", fill: white)[Statutory Due Date]], [#text(weight: "bold", fill: white)[Statutory Scope & Legal Purpose]],
  [GSTR-1], [11th of subsequent month], [Statement of Outward Supplies (B2B, B2C, Exports, HSN Summary). Populates buyer #ul-green[GSTR-2B].],
  [GSTR-3B], [20th of subsequent month], [Monthly self-assessed summary return, payment of tax liability, and claiming eligible ITC.],
  [GSTR-2B], [14th of subsequent month], [Static auto-generated ITC statement. 100% of claimed ITC must be reflected here.],
  [GSTR-4], [30th April following FY], [Annual return for Composition Scheme dealers (opted under Section 10).],
  [GSTR-7], [10th of subsequent month], [Return for authorities deducting TDS under GST Section 51 (2% deduction).],
  [GSTR-8], [10th of subsequent month], [Statement for E-Commerce operators collecting TCS under GST Section 52 (0.5% or 1%).],
  [GSTR-9], [31st December following FY], [Annual comprehensive reconciliation return for all regular registered taxpayers.],
  [#ul-green[GSTR-9]C], [31st December following FY], [Statutory reconciliation statement certified by CA/CMA for turnover exceeding ₹5 Crores.]
)

#v(6pt)

== Topic 03: High-Yield Exam & Interview MCQs

1. *What is the state code for Gujarat in a 15-digit GSTIN?*\
   (A) 27 #h(10pt) (B) 24 #h(10pt) (C) 08 #h(10pt) (D) 07\
   *Answer: (B)* | *Explanation:* Gujarat is assigned State Code 24 in the Indian GSTIN numbering system.

2. *Which GST is levied when a trader in Palanpur sells goods to a wholesaler in Rajkot (both in Gujarat)?*\
   (A) IGST only #h(10pt) (B) CGST and SGST #h(10pt) (C) UTGST only #h(10pt) (D) Customs Duty\
   *Answer: (B)* | *Explanation:* An intrastate sale within Gujarat attracts both CGST and SGST equally.

3. *Under #ul-orange[Section 194J], what is the standard TDS rate on professional consultancy fees?*\
   (A) 1% #h(10pt) (B) 2% #h(10pt) (C) 5% #h(10pt) (D) 10%\
   *Answer: (D)* | *Explanation:* #ul-orange[Section 194J] mandates #hl-orange[10% TDS] on professional fees exceeding ₹30,000.

4. *What is the statutory threshold limit for deduction of TDS on commercial building rent under #ul-orange[Section 194I]?*\
   (A) ₹30,000 #h(10pt) (B) ₹1,00,000 #h(10pt) (C) ₹2,40,000 #h(10pt) (D) ₹5,00,000\
   *Answer: (C)* | *Explanation:* #ul-orange[Section 194I] applies when rent paid to a landlord exceeds ₹2,40,000 per financial year.

5. *What is the monthly statutory due date for depositing TDS into the government account via #ul-green[Challan 281]?*\
   (A) 1st of next month #h(10pt) (B) 7th of next month #h(10pt) (C) 20th of next month #h(10pt) (D) Last day of quarter\
   *Answer: (B)* | *Explanation:* TDS must be deposited by the 7th of the month following the month of deduction.

6. *Which quarterly return form is filed for non-salary TDS deductions?*\
   (A) Form 24Q #h(10pt) (B) #ul-green[Form 26Q] #h(10pt) (C) Form 16A #h(10pt) (D) Form 3B\
   *Answer: (B)* | *Explanation:* #ul-green[Form 26Q] is the quarterly statement of non-salary TDS under Sections 194C/J/I/H.

7. *Which of the following commodities falls under the 0% (Exempt) GST slab?*\
   (A) Branded packaged rice #h(10pt) (B) Unpackaged agricultural Jeera Seed #h(10pt) (C) Air conditioner #h(10pt) (D) Laptop\
   *Answer: (B)* | *Explanation:* Unbranded agricultural produce and seeds are zero-rated / exempt under GST.

8. *What challan number is used to deposit corporate TDS into the RBI / authorized bank treasury?*\
   (A) ITNS 280 #h(10pt) (B) ITNS 281 #h(10pt) (C) PMT-06 #h(10pt) (D) #ul-green[GSTR-3B]\
   *Answer: (B)* | *Explanation:* Challan ITNS 281 is specifically designated for depositing TDS and TCS.

9. *What is the turnover threshold for a trader supplying goods exclusively within Gujarat to register under GST?*\
   (A) ₹10 Lakhs #h(10pt) (B) ₹20 Lakhs #h(10pt) (C) ₹40 Lakhs #h(10pt) (D) ₹1 Crore\
   *Answer: (C)* | *Explanation:* The threshold for exclusive suppliers of goods in standard states like Gujarat is ₹40 Lakhs.

10. *Under #ul-orange[Section 194C], what is the TDS rate when payment is made to an Individual / HUF transport contractor?*\
    (A) 1% #h(10pt) (B) 2% #h(10pt) (C) 5% #h(10pt) (D) 10%\
    *Answer: (A)* | *Explanation:* #ul-orange[Section 194C] mandates 1% TDS for Individual/HUF contractors and 2% for corporate contractors.

#v(6pt)

// VIVA & LAB
== Topic 03: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain the difference between CGST, SGST, and IGST with an example.\
  *Answer:* CGST and SGST apply to intrastate sales within the same state (revenue shared 50:50). IGST applies to interstate sales between different states (revenue collected centrally and transferred to destination state).
- *Viva Q2:* What is the penalty for failing to deduct TDS or late deposit?\
  *Answer:* Interest is levied at 1% per month for failure to deduct and 1.5% per month for delay in depositing deducted TDS from the date of deduction to actual payment date, plus disallowance of 30% of expense under Section 40(a)(ia).
- *Hands-On Lab Task:* In Tally Prime, navigate to F11 Features, enable Goods and Services Tax (GST), enter Gujarat State Code 24, set your institute GSTIN, and create two tax ledgers: *CGST* and *SGST* under *Duties & Taxes*.

#pagebreak()

= Topic 04: Ledgers, Types of Accounts & Golden Rules of Accounting

== 4.1 What is a Ledger in Accounting?
In double-entry financial accounting, a *Ledger* is the principal book or permanent computerized record that aggregates all financial transactions pertaining to a specific individual, vendor, customer, asset, liability, expense, or revenue head. 

Without ledgers, financial statements cannot be prepared. While a Journal chronologically records daily commercial events, the Ledger categorizes those events into dedicated individual accounts. In Tally Prime, every single transaction requires at least two ledgers: one ledger to be debited (*Dr.*) and another ledger to be credited (*Cr.*).

By default, when a new company is created, Tally Prime automatically creates exactly *two predefined ledgers*:
1. *Cash A/c:* Grouped under *Cash-in-hand* (represents physical liquid currency).
2. *Profit & Loss A/c:* Grouped directly under *Primary* (accumulates net operating earnings and retains capital balances).
All other ledgers—such as Bank accounts, Suppliers, Customers, Sales, Purchases, and Expenses—must be created by the accountant.

#v(6pt)

== 4.2 The Fundamental Accounting Equation
Every double-entry transaction maintains mathematical equilibrium across the balance sheet, expressed through the *Fundamental Accounting Equation*:

$ "Assets" = "Liabilities" + "Capital" $

When the proprietor introduces capital, Cash (Asset) increases, and Capital (Owner's Equity) increases equally. When goods are bought on credit, Stock (Asset) increases, and Sundry Creditors (Liability) increases. Every debit entry is matched by an equal credit entry, ensuring the #ul-green[Trial Balance] maintains perfect balance!

#v(6pt)

== 4.3 The Three Fundamental Classes of Accounts & The 3 Golden Rules
Modern accounting traces its foundation to the Italian mathematician *Fra #ul-yellow[Luca Pacioli]* (1494), who formalized the Double Entry System. All commercial transactions are classified into three universal classes of accounts, each governed by its inviolable *Golden Rule*:

#table(
  columns: (1.2fr, 1.4fr, 1.3fr, 2.1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Account Class]], [#text(weight: "bold", fill: white)[Definition & Coverage]], [#text(weight: "bold", fill: white)[Inviolable Golden Rule]], [#text(weight: "bold", fill: white)[Corporate Examples]],
  [1. Personal Account], [Relates to legal persons, individuals, corporate firms, banks, and institutions.], [*Debit the Receiver*\ *Credit the Giver*], [Ravi Private Ltd, Ram & Co., HDFC Bank, SBI Bank, Salman's Capital, Drawings A/c.],
  [2. Real Account], [Relates to tangible and intangible assets and property owned by the business entity.], [*Debit what Comes In*\ *Credit what Goes Out*], [Cash, Office Furniture, Plant & Machinery, Delivery Vans, Computers, Patents, Trademarks.],
  [3. Nominal Account], [Relates to business operating expenses, losses, revenues, gains, and commissions.], [*Debit all Expenses & Losses*\ *Credit all Incomes & Gains*], [Office Rent, Staff Salary, Electricity Expenses, Consulting Fees, Commission Earned, Interest Income.]
)

#v(6pt)

== 4.4 Practical Proof: 30 Detailed Dr/Cr Transaction Analyses
To master ledger creation, an accountant must analyze which two accounts are affected and apply the corresponding Golden Rule:

#table(
  columns: (0.4fr, 2.3fr, 1.2fr, 1.1fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Commercial Transaction]], [#text(weight: "bold", fill: white)[Accounts Affected]], [#text(weight: "bold", fill: white)[Account Class]], [#text(weight: "bold", fill: white)[Debit / Credit]],
  [1], [Proprietor started business with cash ₹5,00,000], [Cash A/c\ Capital A/c], [Real\ Personal], [Dr. Cash (Comes in)\ Cr. Capital (Giver)],
  [2], [Opened current account in HDFC Bank depositing ₹1,00,000 cash], [HDFC Bank A/c\ Cash A/c], [Personal\ Real], [Dr. HDFC Bank (Receiver)\ Cr. Cash (Goes out)],
  [3], [Purchased office furniture for ₹25,000 paying by HDFC cheque], [Furniture A/c\ HDFC Bank A/c], [Real\ Personal], [Dr. Furniture (Comes in)\ Cr. HDFC Bank (Giver)],
  [4], [Purchased goods for cash ₹40,000], [Purchase A/c\ Cash A/c], [Nominal / Real\ Real], [Dr. Purchase (Expense)\ Cr. Cash (Goes out)],
  [5], [Purchased goods on credit from Krishi Beej Bhandar ₹50,000], [Purchase A/c\ Krishi Beej Bhandar], [Nominal\ Personal], [Dr. Purchase (Expense)\ Cr. Supplier (Giver)],
  [6], [Sold goods for cash ₹35,000], [Cash A/c\ Sales A/c], [Real\ Nominal], [Dr. Cash (Comes in)\ Cr. Sales (Income)],
  [7], [Sold goods on credit to Shivam Traders ₹60,000], [Shivam Traders A/c\ Sales A/c], [Personal\ Nominal], [Dr. Customer (Receiver)\ Cr. Sales (Income)],
  [8], [Paid office rent ₹15,000 by HDFC cheque], [Rent Expense A/c\ HDFC Bank A/c], [Nominal\ Personal], [Dr. Rent (Expense)\ Cr. HDFC Bank (Giver)],
  [9], [Paid staff salaries ₹20,000 in cash], [Salary Expense A/c\ Cash A/c], [Nominal\ Real], [Dr. Salary (Expense)\ Cr. Cash (Goes out)],
  [10], [Received consulting fees ₹75,000 by NEFT in HDFC Bank], [HDFC Bank A/c\ Consulting Income A/c], [Personal\ Nominal], [Dr. HDFC Bank (Receiver)\ Cr. Consulting (Income)],
  [11], [Withdrew ₹10,000 cash from HDFC Bank for office use], [Cash A/c\ HDFC Bank A/c], [Real\ Personal], [Dr. Cash (Comes in)\ Cr. HDFC Bank (Giver)],
  [12], [Proprietor withdrew ₹5,000 cash for personal domestic use], [Drawings A/c\ Cash A/c], [Personal\ Real], [Dr. Drawings (Receiver)\ Cr. Cash (Goes out)],
  [13], [Paid electricity bill ₹4,500 in cash], [Electricity Expense A/c\ Cash A/c], [Nominal\ Real], [Dr. Electricity (Expense)\ Cr. Cash (Goes out)],
  [14], [Received ₹50,000 cheque from Shivam Traders against invoice], [HDFC Bank A/c\ Shivam Traders], [Personal\ Personal], [Dr. HDFC Bank (Receiver)\ Cr. Shivam (Giver)],
  [15], [Paid ₹45,000 cheque to Krishi Beej Bhandar in settlement], [Krishi Beej Bhandar\ HDFC Bank A/c], [Personal\ Personal], [Dr. Supplier (Receiver)\ Cr. HDFC Bank (Giver)],
  [16], [Purchased computer printer for ₹8,500 in cash], [Computer & Printer A/c\ Cash A/c], [Real\ Real], [Dr. Asset (Comes in)\ Cr. Cash (Goes out)],
  [17], [Paid internet charges to GTPL ₹5,900 by cash], [Internet Expense A/c\ Cash A/c], [Nominal\ Real], [Dr. Internet (Expense)\ Cr. Cash (Goes out)],
  [18], [Received commission ₹12,000 by cheque deposited in HDFC], [HDFC Bank A/c\ Commission Income A/c], [Personal\ Nominal], [Dr. HDFC Bank (Receiver)\ Cr. Commission (Income)],
  [19], [HDFC Bank deducted bank charges ₹590 from account], [Bank Charges A/c\ HDFC Bank A/c], [Nominal\ Personal], [Dr. Bank Charges (Expense)\ Cr. HDFC Bank (Giver)],
  [20], [Charged 10% depreciation on office furniture ₹2,500], [Depreciation Expense A/c\ Furniture Asset A/c], [Nominal\ Real], [Dr. Depreciation (Loss)\ Cr. Furniture (Value decreases)],
  [21], [Purchased trading goods ₹1,00,000 with #hl-orange[18% GST] (CGST 9% + SGST 9%)], [Purchase A/c, Input CGST, Input SGST\ Vendor A/c], [Nominal, Current Asset\ Personal], [Dr. Purchase 1L, Dr. CGST 9k, Dr. SGST 9k\ Cr. Vendor 1.18L],
  [22], [Sold goods ₹1,50,000 with #hl-orange[18% GST] to client on credit], [Debtor A/c\ Sales A/c, Output CGST, Output SGST], [Personal\ Nominal, Liability], [Dr. Debtor 1.77L\ Cr. Sales 1.5L, Cr. CGST 13.5k, Cr. SGST 13.5k],
  [23], [Booked professional audit fee ₹50,000 deducting #hl-orange[10% TDS] (194J)], [Audit Fee A/c\ CA Firm A/c, TDS Payable], [Nominal\ Personal, Liability], [Dr. Audit Fee 50k\ Cr. CA Firm 45k, Cr. TDS 5k],
  [24], [Deposited TDS of ₹5,000 via #ul-green[Challan 281] through HDFC Bank], [TDS Payable A/c\ HDFC Bank A/c], [Liability\ Personal], [Dr. TDS Payable 5k\ Cr. HDFC Bank 5k],
  [25], [Customer bad debt written off as irrecoverable ₹8,000], [Bad Debts Expense A/c\ Debtor A/c], [Nominal\ Personal], [Dr. Bad Debts (Loss)\ Cr. Debtor (Asset reduced)],
  [26], [Recovered ₹4,000 cash from previously written-off debtor], [Cash A/c\ Bad Debts Recovered A/c], [Real\ Nominal], [Dr. Cash (Comes in)\ Cr. Bad Debts Recovered (Income)],
  [27], [Paid fire insurance premium ₹12,000 for 12 months by cheque], [Prepaid Insurance A/c\ HDFC Bank A/c], [Asset\ Personal], [Dr. Prepaid Insurance (Asset)\ Cr. HDFC Bank (Giver)],
  [28], [Accrued interest on Fixed Deposit ₹3,500 due but not yet received], [Accrued Interest A/c\ Interest Income A/c], [Asset\ Nominal], [Dr. Accrued Interest (Asset)\ Cr. Interest (Income)],
  [29], [Goods destroyed by accidental warehouse fire ₹15,000], [Loss by Fire A/c\ Purchase A/c], [Nominal\ Nominal / Real], [Dr. Loss by Fire (Loss)\ Cr. Purchase (Stock reduced)],
  [30], [Settled supplier bill of ₹10,000 by paying ₹9,700 cash (₹300 discount)], [Supplier A/c\ Cash A/c, Discount Received], [Personal\ Real, Nominal], [Dr. Supplier 10k\ Cr. Cash 9.7k, Cr. Discount 300]
)

#v(6pt)

== 4.5 The 50-Transaction Corporate Practice Set (Mr. Verma Enterprise)
To build real industry confidence, every trainee must record the complete, authentic 50-transaction workflow of *Mr. Verma Enterprise* standardized from Rahul Sir's corporate training curriculum:

#table(
  columns: (0.4fr, 3fr, 1.2fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Practical Business Transaction Description]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Target Voucher]],
  [01], [Mr. Verma opened a current account in HDFC Bank depositing cash], [1,00,000.00], [F4 Contra],
  [02], [Paid office rent by HDFC cheque to Landlord], [2,500.00], [F5 Payment],
  [03], [Paid miscellaneous office expenses in cash], [150.00], [F5 Payment],
  [04], [Received consulting fees by cash from client], [96,000.00], [F6 Receipt],
  [05], [Paid electricity bill by HDFC cheque], [9,500.00], [F5 Payment],
  [06], [Deposited surplus cash into HDFC Bank], [30,000.00], [F4 Contra],
  [07], [Paid vendor Raj & Co. towards outstanding balance], [11,500.00], [F5 Payment],
  [08], [Paid office telephone and broadband expense by cheque], [7,500.00], [F5 Payment],
  [09], [Received IT consulting fee from overseas client via wire transfer], [1,50,000.00], [F6 Receipt],
  [10], [Received annual maintenance service charges by cheque], [15,000.00], [F6 Receipt],
  [11], [Purchased GTPL broadband fiber connection for office in cash], [5,900.00], [F5 Payment],
  [12], [Paid salary to office assistant Ramesh in cash], [1,000.00], [F5 Payment],
  [13], [Received cash from Shah & Co. towards previous dues], [1,200.00], [F6 Receipt],
  [14], [Paid mobile phone corporate connection bill in cash], [3,500.00], [F5 Payment],
  [15], [Transferred funds from HDFC Bank to Bank of Baroda account], [60,000.00], [F4 Contra],
  [16], [Bank charges debited by HDFC Bank for cheque book issuance], [5,000.00], [F5 Payment],
  [17], [Paid electricity maintenance charges in cash], [850.00], [F5 Payment],
  [18], [Received cheque from Alfatech Solutions towards services], [30,000.00], [F6 Receipt],
  [19], [Paid Rehana for content creation services by cheque], [1,500.00], [F5 Payment],
  [20], [Paid Raj Travels for employee corporate conveyance by cheque], [10,000.00], [F5 Payment],
  [21], [Raised service tax invoice on MediaLive Productions for media work], [50,000.00], [F8 Sales (Accounting)],
  [22], [Paid factory electricity bill in cash], [21,750.00], [F5 Payment],
  [23], [Received travel invoice from Raj Travels (₹3,150 cab + ₹4,450 tours)], [7,600.00], [F9 Purchase],
  [24], [Deposited cash into HDFC Bank account], [75,000.00], [F4 Contra],
  [25], [Paid mobile recharge bill by cheque], [1,470.00], [F5 Payment],
  [26], [Received term loan sanction from SBI Bank credited to account], [2,00,000.00], [F6 Receipt],
  [27], [Paid office deep cleaning services by cheque], [3,000.00], [F5 Payment],
  [28], [Paid office refreshments and tea pantry supplies in cash], [800.00], [F5 Payment],
  [29], [Received sales commission income by cheque], [50,000.00], [F6 Receipt],
  [30], [Paid office executive furniture invoice by cheque], [6,000.00], [F5 Payment],
  [31], [Withdrew cash from HDFC Bank for office petty cash use], [25,000.00], [F4 Contra],
  [32], [Paid vendor Ram & Co. by cheque], [13,000.00], [F5 Payment],
  [33], [Paid newspaper and digital advertising expenses by cheque], [9,000.00], [F5 Payment],
  [34], [Received management consultancy fees by cheque], [75,000.00], [F6 Receipt],
  [35], [Received server maintenance charges by cheque], [20,000.00], [F6 Receipt],
  [36], [Purchased laser printer for office use in cash], [7,000.00], [F5 Payment],
  [37], [Paid salary to Suresh in cash], [2,000.00], [F5 Payment],
  [38], [Received cash from client Gupta & Co.], [3,00,0.00], [F6 Receipt],
  [39], [Paid office internet lease line bill by cheque], [5,000.00], [F5 Payment],
  [40], [Transferred funds from HDFC Bank to ICICI Bank account], [50,000.00], [F4 Contra],
  [41], [Paid ICICI Bank annual account maintenance charges], [4,000.00], [F5 Payment],
  [42], [Paid office sanitization charges in cash], [1,200.00], [F5 Payment],
  [43], [Received cheque from Tech Solutions against service invoice], [40,000.00], [F6 Receipt],
  [44], [Paid Meena for design consultancy by cheque], [1,800.00], [F5 Payment],
  [45], [Paid Patel Travels by cheque for corporate outstation tour], [15,000.00], [F5 Payment],
  [46], [Raised service invoice on TechWorld for web portal engineering], [60,000.00], [F8 Sales (Accounting)],
  [47], [Paid office godown rent in cash], [25,000.00], [F5 Payment],
  [48], [Proprietor introduced additional capital in cash], [1,50,000.00], [F6 Receipt],
  [49], [Raised consulting invoice on Kabir & Sons], [25,000.00], [F8 Sales (Accounting)],
  [50], [Withdrew cash from bank for proprietor personal medical expenses], [7,000.00], [F4 / F5 Payment]
)

#v(6pt)

== 4.6 Additional 20 Cash & Bank Practice Transactions
From Rahul Sir's Fundamental Tally Notes (Page 18), here are 20 additional practical fund transactions to master bank versus cash distinctions:

#table(
  columns: (0.4fr, 3.2fr, 1.2fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Practical Business Event]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Voucher Type]],
  [51], [Deposited ₹10,000 cash into HDFC Bank account], [10,000.00], [F4 Contra],
  [52], [Withdrew ₹5,000 cash from HDFC Bank for office emergency fund], [5,000.00], [F4 Contra],
  [53], [Transferred ₹15,000 from HDFC Bank to Axis Bank account], [15,000.00], [F4 Contra],
  [54], [Transferred ₹7,000 from Axis Bank to HDFC Bank account], [7,000.00], [F4 Contra],
  [55], [Received ₹20,000 cash from Shivam Traders against outstanding invoice], [20,000.00], [F6 Receipt],
  [56], [Received ₹35,000 via NEFT in HDFC Bank from Alpesh Ltd], [35,000.00], [F6 Receipt],
  [57], [Paid ₹12,500 by HDFC cheque to Tech Solutions for cloud hosting], [12,500.00], [F5 Payment],
  [58], [Paid ₹8,000 in cash to Ganesh Printers for brochure printing], [8,000.00], [F5 Payment],
  [59], [Paid ₹7,600 by cheque to Raj Travels for executive cab hire], [7,600.00], [F5 Payment],
  [60], [Paid ₹5,500 by cheque to Satish Pvt Ltd for air conditioner maintenance], [5,500.00], [F5 Payment],
  [61], [Paid ₹3,600 in cash to Mobile Mart for corporate mobile recharge], [3,600.00], [F5 Payment],
  [62], [Received ₹50,000 by cheque from MediaLive Productions], [50,000.00], [F6 Receipt],
  [63], [Received ₹6,500 in Axis Bank from Nayan Traders for logo design], [6,500.00], [F6 Receipt],
  [64], [Received ₹22,000 by cheque from Shree Advertising], [22,000.00], [F6 Receipt],
  [65], [Paid ₹9,500 electricity bill from Axis Bank account], [9,500.00], [F5 Payment],
  [66], [Paid ₹1,000 cash to Ramesh towards salary advance], [1,000.00], [F5 Payment],
  [67], [Received ₹2,500 cash as professional tuition fee from student], [2,500.00], [F6 Receipt],
  [68], [Received ₹15,000 cash as corporate coaching income], [15,000.00], [F6 Receipt],
  [69], [Paid ₹5,000 cash towards office interior painting touchup], [5,000.00], [F5 Payment],
  [70], [Paid ₹6,000 by cheque to Sanjay & Co. for decorative plants and blinds], [6,000.00], [F5 Payment]
)

#v(8pt)

// CHAPTER SUMMARY
#rect(
  width: 100%,
  stroke: 1pt + rgb("#0E7490"),
  fill: rgb("#F0FDFA"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "black", size: 8.5pt, fill: rgb("#0F766E"))[TOPIC 04 SUMMARY & KEY REVISION TAKEAWAYS]
    - A Ledger is the permanent record aggregating financial transactions under an individual identity or head.
    - Accounting Equation: $"Assets" = "Liabilities" + "Capital"$. Every debit entry must equal its corresponding credit.
    - Tally Prime auto-creates *Cash* (Cash-in-hand) and *Profit & Loss A/c* (Primary) upon company creation.
    - The 3 Golden Rules: Personal (Dr Receiver, Cr Giver); Real (Dr Comes in, Cr Goes out); Nominal (Dr Expenses & Losses, Cr Incomes & Gains).
    - Mastering the 50-transaction *Mr. Verma Enterprise* workflow equips an accountant to record any commercial business scenario.
  ]
)

#v(8pt)

// MCQS
== Topic 04: High-Yield Exam & Interview MCQs

1. *Which two ledgers are automatically created by Tally Prime upon creating a new company?*\
   (A) Sales and Purchase #h(10pt) (B) Cash and Profit & Loss #h(10pt) (C) Bank and Cash #h(10pt) (D) Capital and Drawings\
   *Answer: (B)* | *Explanation:* Tally Prime creates Cash and Profit & Loss accounts by default in every company.

2. *What is the Golden Rule for a Personal Account?*\
   (A) #ul-yellow[Debit what comes in, Credit what goes out] #h(10pt) (B) Debit the Receiver, Credit the Giver\
   (C) Debit all expenses, Credit all incomes #h(10pt) (D) Debit assets, Credit liabilities\
   *Answer: (B)* | *Explanation:* Personal accounts represent entities; the receiver is debited and the giver is credited.

3. *Rent paid to a landlord falls under which class of account?*\
   (A) Personal Account #h(10pt) (B) Real Account #h(10pt) (C) Nominal Account #h(10pt) (D) Representative Account\
   *Answer: (C)* | *Explanation:* Rent is an operating business expenditure, classified as a Nominal Account.

4. *Office furniture purchased for cash is an example of which account class?*\
   (A) Nominal Account #h(10pt) (B) Real Account #h(10pt) (C) Personal Account #h(10pt) (D) Debtors Account\
   *Answer: (B)* | *Explanation:* Furniture is a tangible property/asset owned by the business, making it a Real Account.

5. *When Mr. Verma deposits ₹30,000 cash into HDFC Bank, which ledger account is credited?*\
   (A) HDFC Bank A/c #h(10pt) (B) Cash A/c #h(10pt) (C) Capital A/c #h(10pt) (D) Suspense A/c\
   *Answer: (B)* | *Explanation:* Real account rule: Credit what goes out. Cash goes out of the cash box into the bank.

6. *Drawings Account (money withdrawn by the owner for personal domestic use) is classified as:*\
   (A) Nominal Account #h(10pt) (B) Real Account #h(10pt) (C) Personal Account #h(10pt) (D) Asset Account\
   *Answer: (C)* | *Explanation:* Drawings represents the individual proprietor/owner, hence it is a Personal Account.

7. *Who formalized the modern Double Entry Bookkeeping system in 1494?*\
   (A) Adam Smith #h(10pt) (B) Fra #ul-yellow[Luca Pacioli] #h(10pt) (C) John Maynard Keynes #h(10pt) (D) #hl-yellow[Bharat Goenka]\
   *Answer: (B)* | *Explanation:* Fra #ul-yellow[Luca Pacioli] published the foundational principles of double-entry bookkeeping in Venice.

8. *If a business receives ₹50,000 commission by cheque, which account is debited?*\
   (A) Commission Income A/c #h(10pt) (B) Bank A/c #h(10pt) (C) Cash A/c #h(10pt) (D) Capital A/c\
   *Answer: (B)* | *Explanation:* The receiving bank account is debited as the receiver of the funds.

9. *In the fundamental accounting equation (#ul-yellow[Assets = Liabilities + Capital]), if assets increase by ₹50,000 without liability change, what happens to Capital?*\
   (A) Decreases by ₹50,000 #h(10pt) (B) Increases by ₹50,000 #h(10pt) (C) Remains unchanged #h(10pt) (D) Doubled\
   *Answer: (B)* | *Explanation:* By equation equilibrium, an increase in assets directly increases owner's capital.

10. *Under which class of account is 'Input CGST' or 'Output SGST' classified?*\
    (A) Real Account #h(10pt) (B) Personal Account (Government) #h(10pt) (C) Nominal Account #h(10pt) (D) Fictitious Account\
    *Answer: (B)* | *Explanation:* Tax accounts represent liabilities or receivables vis-a-vis the Government tax department (Personal).

#v(6pt)

// VIVA & LAB
== Topic 04: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* State the difference between Real and Nominal accounts with two commercial examples of each.\
  *Answer:* Real accounts represent tangible assets owned by the firm (e.g., Cash, Machinery). Nominal accounts represent expenses, losses, revenues, and gains (e.g., Salary Paid, Interest Received).
- *Viva Q2:* Why is the Capital Account treated as a Personal Account rather than a Liability Account?\
  *Answer:* Under the Business Entity Concept, the owner is legally distinct from the enterprise. The Capital Account represents the owner as a person who gave funds to the business.
- *Hands-On Lab Task:* In Tally Prime, go to Gateway of Tally > *Create > Ledger*, and create three ledgers: *HDFC Bank* under *Bank Accounts*, *Office Rent* under *Indirect Expenses*, and *Ram & Co.* under *Sundry Creditors*.

#pagebreak()

= Topic 05: Vouchers & The 4 Major Voucher Categories (24 Vouchers)

== 5.1 What is a Voucher in Tally Prime?
In financial accounting, a *Voucher* is the primary documentary evidence or electronic accounting instrument that records the details of a commercial transaction—including the date, parties involved, amounts debited and credited, ledger accounts affected, statutory tax breakups, and narrative description (*Narration*).

In Tally Prime, every single business transaction must be entered through an appropriate Voucher type. Unlike generic accounting software that forces all entries through a complicated journal, Tally Prime provides *24 specialized voucher types* optimized for rapid data entry, automated ledger posting, statutory tax calculation, and real-time inventory updates.

#v(6pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[THE GOLDEN WORKFLOW OF VOUCHER ENTRY IN TALLY PRIME:]\
    1. Select Voucher Type (#key-pill("F4") to #key-pill("F9") or press #key-pill("F10") for Other Vouchers).\
    2. Set Transaction Date by pressing #key-pill("F2").\
    3. Choose Voucher Mode via #key-pill("Ctrl + H") (*As Voucher*, *As Item Invoice*, or *As Accounting Invoice*).\
    4. Specify Debit / Credit ledgers or select Party Account Name.\
    5. Enter Item particulars (Quantity, Rate, HSN) or Service descriptions.\
    6. Attach statutory tax ledgers (*CGST*, *SGST*, *IGST*, *TDS*).\
    7. Enter detailed descriptive *Narration* and press #key-pill("Ctrl + A") to save and post immediately!
  ]
)

#v(6pt)

== 5.2 The 4 Major Categories of Vouchers (24 Predefined Vouchers)
Tally Prime categorizes its 24 voucher types into 4 distinct functional operational domains:

#table(
  columns: (1.2fr, 0.8fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Voucher Category]], [#text(weight: "bold", fill: white)[Key Vouchers]], [#text(weight: "bold", fill: white)[Operational Purpose & Business Application]],
  [1. Accounting Vouchers], [F4 to F9], [Handles core double-entry monetary transactions: Cash/Bank fund transfers (Contra), Vendor payments, Customer receipts, Non-cash adjustments (Journal), Sales, and Purchases.],
  [2. Inventory Vouchers], [Alt+F7 to Alt+F9], [Tracks physical movement of goods without monetary payment: Stock transfers between godowns (Stock Journal), physical stock counts, goods received notes, and delivery notes.],
  [3. Order Vouchers], [Ctrl+F8, Ctrl+F9], [Records customer purchase commitments: Sales Orders and Purchase Orders. These do not affect financial books or current stock until executed.],
  [4. Non-Accounting / Memo], [Ctrl+F7, Ctrl+F4], [Memorandum vouchers for temporary reminders, Reversing Journals for month-end accruals, and Optional vouchers for draft scenarios.]
)

#v(6pt)

== 5.3 Complete Master Table: All 24 Vouchers with Keyboard Shortcuts
Every professional corporate accountant must memorize the full registry of Tally Prime vouchers:

#table(
  columns: (0.4fr, 1.3fr, 0.9fr, 2.2fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Voucher Name]], [#text(weight: "bold", fill: white)[Shortcut]], [#text(weight: "bold", fill: white)[Accounting & Commercial Impact]],
  [1], [Contra], [#key-pill("F4")], [Pure Cash-to-Bank, Bank-to-Cash, or Bank-to-Bank transfers. Zero third-party involvement.],
  [2], [Payment], [#key-pill("F5")], [All cash or bank payments to suppliers, employee salaries, rents, utilities, and taxes.],
  [3], [Receipt], [#key-pill("F6")], [All cash or cheque/NEFT collections from customers, capital receipts, and incomes.],
  [4], [Journal], [#key-pill("F7")], [Non-cash adjustment entries, depreciation, bad debts write-offs, and year-end closing.],
  [5], [Sales], [#key-pill("F8")], [Invoicing goods or services sold to customers (Cash or Credit) with GST calculation.],
  [6], [Purchase], [#key-pill("F9")], [Recording raw materials, merchandise, or services purchased from vendors with ITC.],
  [7], [Credit Note], [#key-pill("Alt + F6")], [Sales returns from customers, post-sale trade discounts, or rate difference credits.],
  [8], [Debit Note], [#key-pill("Alt + F5")], [Purchase returns to suppliers, rejection of defective goods, or debiting vendor for shortage.],
  [9], [Sales Order], [#key-pill("Ctrl + F8")], [Recording formal commercial purchase orders received from clients prior to delivery.],
  [10], [Purchase Order], [#key-pill("Ctrl + F9")], [Issuing formal purchase orders to approved suppliers for procurement scheduling.],
  [11], [Delivery Note], [#key-pill("Alt + F8")], [Delivery challan sent with goods dispatched to customers prior to final invoice.],
  [12], [Receipt Note], [#key-pill("Alt + F9")], [Goods Inward Note (GRN) recording physical delivery of goods from suppliers.],
  [13], [Rejections Out], [#key-pill("Alt + F5")], [Returning rejected defective items to vendor before invoice generation.],
  [14], [Rejections In], [#key-pill("Ctrl + F5")], [Accepting rejected goods returned by clients prior to final credit note.],
  [15], [Stock Journal], [#key-pill("Alt + F7")], [Inter-godown transfers (Source to Destination) and Manufacturing #hl-green[Bill of Materials (BOM)].],
  [16], [Physical Stock], [#key-pill("Ctrl + F7")], [Physical inventory audit count to align system stock with actual warehouse count.],
  [17], [Material In], [#key-pill("Ctrl + F7")], [Tracking raw materials received from job-workers under GST job-work rules.],
  [18], [Material Out], [#key-pill("Alt + F7")], [Tracking dispatch of semi-finished goods sent to external job-workers.],
  [19], [Job Work Order In], [#key-pill("Ctrl + F8")], [Receiving job work processing orders from principal manufacturers.],
  [20], [Job Work Order Out], [#key-pill("Ctrl + F9")], [Issuing job work processing contracts to secondary fabricators.],
  [21], [Memorandum], [#key-pill("Ctrl + F7")], [Non-accounting reminder entries that do not alter financial ledgers or stock.],
  [22], [Reversing Journal], [#key-pill("Ctrl + F4")], [Temporary provisions that automatically reverse on the first day of the next month.],
  [23], [Payroll Voucher], [#key-pill("Ctrl + F4")], [Automated monthly salary calculation, PF, ESI, Professional Tax, and net disbursements.],
  [24], [Attendance Voucher], [#key-pill("Ctrl + F5")], [Recording employee working days, overtime hours, and leaves for payroll processing.]
)

#v(6pt)

== 5.4 Voucher Modes: As Voucher vs Item Invoice vs Accounting Invoice
One of the most revolutionary innovations of Tally Prime is the *Change Mode* feature accessed via #key-pill("Ctrl + H"). This allows accountants to toggle between three distinct input interfaces:

#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Voucher Mode]], [#text(weight: "bold", fill: white)[Keyboard Key]], [#text(weight: "bold", fill: white)[When to Use in Corporate Practice]],
  [Item Invoice], [#key-pill("Ctrl + H") > Item], [Standard trading and manufacturing mode. Requires selecting *Stock Items*, Quantity, Units of Measure (Pcs, Kgs), and Rates. Essential for GST invoices with HSN summary.],
  [Accounting Invoice], [#key-pill("Ctrl + H") > Accounting], [Used exclusively for *Service Providers* (IT consulting, audit fees, freight, rent) where no physical goods are transferred. Ledgers are debited directly with SAC codes.],
  [As Voucher], [#key-pill("Ctrl + H") > Voucher], [Traditional double-entry mode displaying explicit *Dr.* / *Cr.* (or *To* / *By*) lines. Preferred by senior accountants for complex journal adjustments and contra vouchers.]
)

#v(6pt)

== 5.5 Step-by-Step Practical Walkthroughs of the 6 Core Accounting Vouchers

=== 1. Contra Voucher (F4) — The Golden Cash/Bank Engine
*Rule:* Only Cash and Bank accounts can be debited and credited in Contra. No customer, vendor, or expense ledger is permitted!
- *Scenario:* Deposited ₹50,000 liquid cash into HDFC Bank Current A/c.
- *Entry:* Debit: *HDFC Bank Current A/c* ₹50,000 | Credit: *Cash A/c* ₹50,000.
- *Tally Denomination Screen:* Tally Prime automatically opens the Bank Allocation window to record currency denominations (e.g., 25 notes of ₹2000, or 100 notes of ₹500).

=== 2. Payment Voucher (F5) — Outward Remittances
*Rule:* The receiving party or expense ledger is Debited (*Dr.*), and Cash/Bank is Credited (*Cr.*).
- *Scenario:* Paid ₹15,000 office rent to Landlord Shri Arvindbhai via cheque from HDFC Bank.
- *Entry:* Debit: *Office Rent Expense A/c* ₹15,000 | Credit: *HDFC Bank Current A/c* ₹15,000.
- *Cheque Detail Window:* Record Cheque No. (e.g., `450121`), Instrument Date, and Favouring Name.

=== 3. Receipt Voucher (F6) — Inward Collections
*Rule:* Cash or Bank ledger is Debited (*Dr.*), and Customer or Income ledger is Credited (*Cr.*).
- *Scenario:* Received NEFT of ₹85,000 from Ravi Enterprises against sales invoice \#INV-104.
- *Entry:* Debit: *HDFC Bank Current A/c* ₹85,000 | Credit: *Ravi Enterprises (Sundry Debtors)* ₹85,000.
- *Bill-wise Details:* Select *Against Reference* (`Agst Ref`) and tag invoice \#INV-104 to clear the debtor balance!

=== 4. Journal Voucher (F7) — Pure Adjustment Engine
*Rule:* Strictly non-cash and non-bank transactions! Used for depreciation, interest accrual, rectification, and year-end provisions.
- *Scenario:* Charged 15% depreciation on office computers costing ₹60,000 (Depreciation = ₹9,000).
- *Entry:* Debit: *Depreciation Expense A/c* ₹9,000 | Credit: *Computers (Fixed Asset) A/c* ₹9,000.

=== 5. Sales Voucher (F8) — Revenue & Invoicing Engine
*Rule:* Customer (Sundry Debtor) or Cash is Debited (*Dr.*), Sales A/c is Credited (*Cr.*), and Output Tax ledgers are Credited (*Cr.*).
- *Scenario:* Sold 10 Pcs Samsung Monitors @ ₹8,000 each to Maheshwari Traders (Palanpur) + #hl-orange[18% GST] (CGST 9% + SGST 9%).
- *Entry:*
  - Debit: *Maheshwari Traders* (Sundry Debtors) ₹94,400
  - Credit: *Sales GST 18% A/c* ₹80,000
  - Credit: *Output CGST 9% A/c* ₹7,200
  - Credit: *Output SGST 9% A/c* ₹7,200

=== 6. Purchase Voucher (F9) — Inward Procurement & ITC
*Rule:* Purchase A/c is Debited (*Dr.*), Input Tax ledgers are Debited (*Dr.*), and Supplier (Sundry Creditor) is Credited (*Cr.*).
- *Scenario:* Purchased 5 Pcs HP Laser Printers @ ₹12,000 from Avni Pvt Ltd + #hl-orange[18% GST].
- *Entry:*
  - Debit: *Purchase GST 18% A/c* ₹60,000
  - Debit: *Input CGST 9% A/c* ₹5,400
  - Debit: *Input SGST 9% A/c* ₹5,400
  - Credit: *Avni Pvt Ltd* (Sundry Creditors) ₹70,800

#v(6pt)

== 5.6 Practical Dataset: 25 Commercial Voucher Transactions
Enter the following 25 commercial transactions into Tally Prime, ensuring exact voucher selection and bill-wise references:

#table(
  columns: (0.4fr, 2.5fr, 0.8fr, 0.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Commercial Transaction Narrative]], [#text(weight: "bold", fill: white)[Voucher]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [01], [Proprietor introduced additional capital via cheque into HDFC Bank], [Receipt (F6)], [₹2,50,000],
  [02], [Withdrew liquid cash from HDFC Bank for office petty cash box], [Contra (F4)], [₹25,000],
  [03], [Purchased office stationery from Palanpur Book Depot in cash], [Payment (F5)], [₹3,200],
  [04], [Purchased 15 Dell Keyboards on credit from Tech Supply Co. (Inv \#882)], [Purchase (F9)], [₹18,000],
  [05], [Sold 5 Dell Keyboards for cash to walk-in customer], [Sales (F8)], [₹7,500],
  [06], [Transferred funds from HDFC Bank Current A/c to ICICI Bank A/c], [Contra (F4)], [₹60,000],
  [07], [Issued cheque \#602101 to Tech Supply Co. in full settlement of Inv \#882], [Payment (F5)], [₹18,000],
  [08], [Sold 10 Dell Keyboards on credit to Modern School (Inv \#001)], [Sales (F8)], [₹15,000],
  [09], [Modern School returned 2 defective keyboards (Issued Credit Note)], [Credit Note], [₹3,000],
  [10], [Received RTGS from Modern School for net invoice balance], [Receipt (F6)], [₹12,000],
  [11], [Returned 2 defective keyboards to Tech Supply Co. (Debit Note)], [Debit Note], [₹2,400],
  [12], [Paid high-speed fiber broadband bill via HDFC Bank net banking], [Payment (F5)], [₹2,800],
  [13], [Charged annual depreciation on office furniture], [Journal (F7)], [₹6,500],
  [14], [Deposited cash sales collections of the week into ICICI Bank], [Contra (F4)], [₹35,000],
  [15], [Paid monthly office electricity bill via UPI from HDFC Bank], [Payment (F5)], [₹4,750],
  [16], [Purchased licensed accounting software via corporate credit card], [Purchase (F9)], [₹21,240],
  [17], [Received interest dividend on fixed deposit credited in HDFC Bank], [Receipt (F6)], [₹3,600],
  [18], [Proprietor withdrew cash from office petty cash for personal grocery], [Payment (F5)], [₹5,000],
  [19], [Paid staff salaries for the month via HDFC Bank direct transfer], [Payment (F5)], [₹48,000],
  [20], [Received advance consulting deposit from Jaimin Corp via cheque], [Receipt (F6)], [₹30,000],
  [21], [Bank debited semi-annual current account maintenance charges], [Payment (F5)], [₹850],
  [22], [Raised service invoice to Jaimin Corp for corporate accounting setup], [Sales (F8)], [₹50,000],
  [23], [Adjusted advance deposit against Jaimin Corp sales invoice], [Journal (F7)], [₹30,000],
  [24], [Received balance payment from Jaimin Corp via IMPS], [Receipt (F6)], [₹20,000],
  [25], [Transferred surplus funds from ICICI Bank back to HDFC Bank], [Contra (F4)], [₹40,000]
)

#v(6pt)


== 5.7 The 10 Golden Rules of Voucher Alteration & Audit Trail (Edit Log)
Under statutory corporate governance rules mandated by the Ministry of Corporate Affairs (MCA), Indian companies must maintain computerized accounting software equipped with an inviolable *#hl-green[Audit Trail (Edit Log)]* feature:
1. *Immutable Audit Trail:* Tally Prime Edit Log records every voucher creation, modification, and deletion with user identity, timestamp, and field-level change history.
2. *Zero Disablement:* Once enabled, the Edit Log cannot be disabled or tampered with by any administrator.
3. *Voucher Class Automation:* To eliminate data entry errors, accountants configure *Voucher Classes* in Sales and Purchase vouchers. A Voucher Class pre-defines the Sales Ledger, Input/Output Tax Ledgers, and automated Round-Off, allowing operators to enter only stock items while Tally calculates statutory taxes automatically!

#v(6pt)


== 5.8 Advanced Voucher Scenarios: Compound Invoicing with Trade & Cash Discounts
In corporate trading, transactions often combine commercial trade discounts and cash discounts:
- *Commercial Scenario:* Sold 20 Pcs Samsung Monitors @ ₹6,500 = ₹1,30,000. Allowed 5% Trade Discount on invoice face (Taxable Value = ₹1,23,500). Charged #hl-orange[18% GST] (CGST ₹11,115 + SGST ₹11,115 = ₹1,45,730). Offered 2% Cash Discount if paid within 7 days.
- *Cash Receipt within 7 Days:* Customer pays via NEFT. Cash Discount of 2% on taxable value (₹2,470) is granted via Credit Note or Journal Voucher, and net cash of ₹1,43,260 is debited in Receipt (F6).

#v(6pt)

== 5.9 Summary & Key Revision Takeaways
- *Voucher Selection Principle:* Every commercial transaction has exactly one optimal voucher type. Contra is restricted strictly to Cash and Bank.
- *Modes Matter:* Use *Item Invoice* for stock goods, *Accounting Invoice* for pure services, and *As Voucher* for double-entry debits and credits.
- *Bill-wise References:* Always tag *Against Reference* (`Agst Ref`) when recording payments or receipts to ensure customer outstanding balances remain 100% accurate!

#v(6pt)

== 5.10 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [Which keyboard shortcut opens the Contra Voucher in Tally Prime?\
  (A) F5 (B) F4 (C) F6 (D) F7], [*Correct: (B) F4*\
  Contra handles internal fund transfers between cash and bank accounts.],
  [02], [Which of the following transactions CANNOT be recorded in a Contra Voucher?\
  (A) Cash deposited in SBI (B) Cash withdrawn from HDFC\
  (C) Rent paid to landlord in cash (D) Transfer from SBI to HDFC], [*Correct: (C) Rent paid to landlord in cash*\
  Rent payment involves an expense ledger and must be recorded in Payment (F5).],
  [03], [Which key toggles between Item Invoice, Accounting Invoice, and As Voucher?\
  (A) Ctrl+F (B) Alt+V (C) Ctrl+H (D) Alt+H], [*Correct: (C) Ctrl+H*\
  Ctrl+H is the global Change Mode shortcut across all Tally Prime vouchers.],
  [04], [A customer returns defective goods previously sold on credit. Which voucher is used?\
  (A) Debit Note (B) Credit Note (C) Journal (D) Receipt], [*Correct: (B) Credit Note (Alt+F6)*\
  Credit Note reduces customer receivables and reverses the original sales credit.],
  [05], [Depreciation on plant and machinery is recorded in which voucher type?\
  (A) Payment (B) Purchase (C) Journal (D) Contra], [*Correct: (C) Journal (F7)*\
  Journal records non-cash adjustments that do not involve cash or bank ledgers.],
  [06], [Which voucher type is used to record inter-godown physical stock transfers?\
  (A) Physical Stock (B) Stock Journal (C) Delivery Note (D) Receipt Note], [*Correct: (B) Stock Journal (Alt+F7)*\
  Stock Journal has Source (Consumption) and Destination (Production) columns.],
  [07], [When recording customer payment against an old bill, which reference type is selected?\
  (A) New Ref (B) Advance (C) Agst Ref (D) On Account], [*Correct: (C) Agst Ref*\
  Against Reference links the receipt directly to the specific pending invoice number.],
  [08], [Which shortcut opens the master list of all inactive and active vouchers?\
  (A) F10 (B) F11 (C) F12 (D) Alt+F10], [*Correct: (A) F10 (Other Vouchers)*\
  F10 opens the master list of all 24 vouchers, allowing users to activate hidden types.],
  [09], [What is the primary function of a Memorandum Voucher (Ctrl+F7)?\
  (A) Post provisional tax (B) Maintain reminder without altering books\
  (C) Reconcile bank (D) Calculate payroll], [*Correct: (B) Maintain reminder without altering books*\
  Memorandum entries do not post to trial balances until converted to regular vouchers.],
  [10], [What shortcut immediately saves a voucher without pressing Enter through all fields?\
  (A) Ctrl+S (B) Ctrl+A (C) Alt+S (D) Alt+A], [*Correct: (B) Ctrl+A*\
  Ctrl+A is the universal quick-accept shortcut throughout Tally Prime.]
)

#v(6pt)

== 5.11 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* What is the fundamental operational difference between a Payment Voucher (F5) and a Journal Voucher (F7)?\
  *Model Answer:* A Payment Voucher strictly involves an outflow of funds from either a Cash or Bank ledger. A Journal Voucher is strictly for non-cash and non-bank transactions such as depreciation, provisions, bad debts write-offs, and inter-ledger adjustments.
- *Viva Q2:* When should a corporate accountant record an invoice in *Accounting Invoice* mode instead of *Item Invoice* mode?\
  *Model Answer:* Accounting Invoice mode is used when billing intangible services (such as legal consulting, audit fees, freight, or software development) where no physical goods, quantities, or units of measure (UoM) exist.
- *Viva Q3:* Explain the accounting rationale of a Debit Note vs a Credit Note from a buyer's perspective.\
  *Model Answer:* When a buyer receives damaged goods from a supplier, the buyer issues a Debit Note (Alt+F5) to debit the supplier's account and reduce current liabilities. Conversely, the supplier will record that return as a Credit Note (Alt+F6).
- *Hands-On Lab Task:* Open Tally Prime, press #key-pill("F10") (Other Vouchers), inspect all inactive voucher types, activate *Credit Note* and *Debit Note*, and record a purchase return of 2 Dell Keyboards to Tech Supply Co. using #key-pill("Alt + F5").

#pagebreak()

= Topic 06: Groups & Complete Ledger Mapping System (28 Groups)

== 6.1 What is a Group in Tally Prime?
In financial bookkeeping, an *Account Group* is a hierarchical category or parent classification under which individual ledger accounts of similar nature are organized. 

Groups determine where an account appears in the statutory financial statements:
- Ledgers grouped under *Capital*, *Liabilities*, or *Assets* flow directly into the *Balance Sheet*.
- Ledgers grouped under *Purchase*, *Sales*, *Direct Expenses*, or *Indirect Expenses* flow into the *Profit & Loss Account*.

Tally Prime provides *28 Predefined Groups* out of the box. These 28 groups are designed to accommodate 100% of Indian accounting standards and international financial reporting requirements without requiring users to create new primary groups.

#v(6pt)

== 6.2 The Master Hierarchy: 15 Primary Groups & 13 Secondary Groups
The 28 predefined groups are structured into a 2-tier hierarchy:
1. *15 Primary Groups:* Top-level financial categories that report directly to the Balance Sheet (9 groups) or Profit & Loss Statement (6 groups).
2. *13 Secondary / Sub-Groups:* Subsidiary groups nested under specific primary groups to provide granular reporting (e.g., *Bank Accounts* is nested under *Current Assets*).

#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Classification]], [#text(weight: "bold", fill: white)[Group Count]], [#text(weight: "bold", fill: white)[Predefined Groups Included]],
  [Primary Groups (Balance Sheet)], [9 Primary Groups], [Capital Account, Loans (Liability), Current Liabilities, Fixed Assets, Investments, Current Assets, Branch / Divisions, Misc. Expenses (Asset), Suspense A/c.],
  [Primary Groups (Profit & Loss)], [6 Primary Groups], [Sales Accounts, Purchase Accounts, Direct Incomes, Direct Expenses, Indirect Incomes, Indirect Expenses.],
  [Secondary / Sub-Groups], [13 Sub-Groups], [Reserves & Surplus (under Capital), Secured Loans (under Loans), Unsecured Loans, Bank OD A/c, Duties & Taxes (under Current Liabilities), Provisions, Sundry Creditors, Bank Accounts (under Current Assets), Cash-in-hand, Deposits (Asset), Loans & Advances (Asset), Stock-in-hand, Sundry Debtors.]
)

#v(6pt)

== 6.3 The Factory Gate Rule: Direct vs Indirect Expenses & Incomes
One of the most frequent errors made by junior accountants is misclassifying expenses between *Direct Expenses* and *Indirect Expenses*. In corporate accounting interviews, this is tested rigorously!

#table(
  columns: (1fr, 1.8fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Dimension]], [#text(weight: "bold", fill: white)[Direct Expenses / Incomes]], [#text(weight: "bold", fill: white)[Indirect Expenses / Incomes]],
  [Definition], [All costs incurred *inside the factory gate* or directly connected with manufacturing, procurement, and bringing goods to sellable condition.], [All operational, administrative, selling, financial, and distribution costs incurred *after the goods are ready for sale* or in head office.],
  [Statement Impact], [Debited to the *Trading Account* to calculate *Gross Profit (GP)*.], [Debited to the *Profit & Loss Account* to calculate *Net Profit (NP)*.],
  [Standard Examples], [Factory wages, Carriage Inward, Freight Inward, Factory fuel and power, Customs duty on raw materials, Primary packaging, Coal/Gas.], [Office salaries, Office rent, Electricity, Audit fees, Advertising, Bank charges, Carriage Outward, Sales commission, Depreciation, Telephone charges.]
)

#v(6pt)

== 6.4 Comprehensive 70+ Ledger-to-Group Mapping Table
This master reference table covers the exact group assignment for all commercial ledgers used across corporate offices:

#table(
  columns: (0.4fr, 1.6fr, 1.6fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Ledger Account Name]], [#text(weight: "bold", fill: white)[Correct Tally Prime Group]], [#text(weight: "bold", fill: white)[Financial Statement]],
  [01], [Salman's Capital A/c], [Capital Account], [Balance Sheet (Liab)],
  [02], [Proprietor Drawings A/c], [Capital Account], [Balance Sheet (Liab)],
  [03], [General Reserve A/c], [Reserves & Surplus], [Balance Sheet (Liab)],
  [04], [HDFC Bank Current A/c], [Bank Accounts], [Balance Sheet (Asset)],
  [05], [SBI Cash Credit (CC) A/c], [Bank OD A/c], [Balance Sheet (Liab)],
  [06], [Petty Cash A/c], [Cash-in-hand], [Balance Sheet (Asset)],
  [07], [Office Furniture A/c], [Fixed Assets], [Balance Sheet (Asset)],
  [08], [Plant & Machinery A/c], [Fixed Assets], [Balance Sheet (Asset)],
  [09], [Delivery Van A/c], [Fixed Assets], [Balance Sheet (Asset)],
  [10], [Software Trademark A/c], [Fixed Assets (Intangible)], [Balance Sheet (Asset)],
  [11], [Shares in TATA Motors], [Investments], [Balance Sheet (Asset)],
  [12], [Fixed Deposit in Bank (3 Yrs)], [Investments / Deposits], [Balance Sheet (Asset)],
  [13], [Ravi Enterprises (Customer)], [Sundry Debtors], [Balance Sheet (Asset)],
  [14], [Jaimin Corp (Client)], [Sundry Debtors], [Balance Sheet (Asset)],
  [15], [Avni Pvt Ltd (Supplier)], [Sundry Creditors], [Balance Sheet (Liab)],
  [16], [Tech Supply Co. (Vendor)], [Sundry Creditors], [Balance Sheet (Liab)],
  [17], [Input CGST A/c], [Duties & Taxes], [Balance Sheet (Asset/Liab)],
  [18], [Input SGST A/c], [Duties & Taxes], [Balance Sheet (Asset/Liab)],
  [19], [Input IGST A/c], [Duties & Taxes], [Balance Sheet (Asset/Liab)],
  [20], [Output CGST A/c], [Duties & Taxes], [Balance Sheet (Liab)],
  [21], [Output SGST A/c], [Duties & Taxes], [Balance Sheet (Liab)],
  [22], [Output IGST A/c], [Duties & Taxes], [Balance Sheet (Liab)],
  [23], [TDS Payable Sec 194C], [Duties & Taxes], [Balance Sheet (Liab)],
  [24], [TDS Payable Sec 194J], [Duties & Taxes], [Balance Sheet (Liab)],
  [25], [Electricity Security Deposit], [Deposits (Asset)], [Balance Sheet (Asset)],
  [26], [Office Premises Rent Deposit], [Deposits (Asset)], [Balance Sheet (Asset)],
  [27], [Advance to Staff Suresh], [Loans & Advances (Asset)], [Balance Sheet (Asset)],
  [28], [Advance to Raw Material Vendor], [Loans & Advances (Asset)], [Balance Sheet (Asset)],
  [29], [Bank Term Loan (HDFC)], [Secured Loans], [Balance Sheet (Liab)],
  [30], [Mortgage Loan on Building], [Secured Loans], [Balance Sheet (Liab)],
  [31], [Unsecured Loan from Director], [Unsecured Loans], [Balance Sheet (Liab)],
  [32], [Loan from Friend Mohan], [Unsecured Loans], [Balance Sheet (Liab)],
  [33], [Salary Payable A/c], [Provisions / Current Liab], [Balance Sheet (Liab)],
  [34], [Audit Fees Payable A/c], [Provisions], [Balance Sheet (Liab)],
  [35], [Sales GST 18% A/c], [Sales Accounts], [Profit & Loss (Credit)],
  [36], [Sales Interstate IGST 18%], [Sales Accounts], [Profit & Loss (Credit)],
  [37], [Sales Exempt (#hl-orange[0% GST])], [Sales Accounts], [Profit & Loss (Credit)],
  [38], [Sales Returns (Inward) A/c], [Sales Accounts], [Profit & Loss (Credit -)],
  [39], [Purchase GST 18% A/c], [Purchase Accounts], [Profit & Loss (Debit)],
  [40], [Purchase Interstate IGST 18%], [Purchase Accounts], [Profit & Loss (Debit)],
  [41], [Purchase Exempt (#hl-orange[0% GST])], [Purchase Accounts], [Profit & Loss (Debit)],
  [42], [Purchase Returns (Outward) A/c], [Purchase Accounts], [Profit & Loss (Debit -)],
  [43], [Factory Labour Wages], [Direct Expenses], [Trading A/c (Debit)],
  [44], [Freight / Carriage Inward], [Direct Expenses], [Trading A/c (Debit)],
  [45], [Factory Power & Fuel], [Direct Expenses], [Trading A/c (Debit)],
  [46], [Customs Import Duty], [Direct Expenses], [Trading A/c (Debit)],
  [47], [Factory Machinery Repairs], [Direct Expenses], [Trading A/c (Debit)],
  [48], [Primary Packaging Material], [Direct Expenses], [Trading A/c (Debit)],
  [49], [Office Staff Salaries], [Indirect Expenses], [Profit & Loss (Debit)],
  [50], [Office Premises Rent], [Indirect Expenses], [Profit & Loss (Debit)],
  [51], [Electricity Expenses], [Indirect Expenses], [Profit & Loss (Debit)],
  [52], [Printing & Stationery], [Indirect Expenses], [Profit & Loss (Debit)],
  [53], [Advertising & Marketing], [Indirect Expenses], [Profit & Loss (Debit)],
  [54], [Bank Service Charges], [Indirect Expenses], [Profit & Loss (Debit)],
  [55], [Audit Fees Expense], [Indirect Expenses], [Profit & Loss (Debit)],
  [56], [Legal & Professional Fees], [Indirect Expenses], [Profit & Loss (Debit)],
  [57], [Carriage Outward], [Indirect Expenses], [Profit & Loss (Debit)],
  [58], [Depreciation on Fixed Assets], [Indirect Expenses], [Profit & Loss (Debit)],
  [59], [Bad Debts Written Off], [Indirect Expenses], [Profit & Loss (Debit)],
  [60], [Discount Allowed A/c], [Indirect Expenses], [Profit & Loss (Debit)],
  [61], [Interest Received on FD], [Indirect Incomes], [Profit & Loss (Credit)],
  [62], [Commission Income Received], [Indirect Incomes], [Profit & Loss (Credit)],
  [63], [Discount Received from Vendor], [Indirect Incomes], [Profit & Loss (Credit)],
  [64], [Profit on Sale of Old Car], [Indirect Incomes], [Profit & Loss (Credit)],
  [65], [Scrap Sales (Direct)], [Direct Incomes], [Trading A/c (Credit)]
)

#v(6pt)

== 6.5 Practical Classification Worksheet for Students
Classify the following 10 complex corporate accounts into their exact Tally Prime groups:
1. *Prepaid Insurance Premium:* `Current Assets` (since benefit extends into future financial year).
2. *Outstanding Factory Electricity:* `Current Liabilities / Provisions` (liability incurred but unpaid).
3. *Accrued Interest on Bank Deposits:* `Current Assets` (income earned but not yet credited by bank).
4. *Machinery Installation Charges:* Debited to `Fixed Assets` (capitalized cost before asset is put to use).
5. *Trade License Fee paid to Municipality:* `Indirect Expenses` (administrative operational compliance).
6. *Provision for Bad & Doubtful Debts:* `Provisions` (deducted from Debtors on Balance Sheet).
7. *Godown Fire Insurance Premium:* `Indirect Expenses` (administrative risk protection).
8. *Directors Remuneration:* `Indirect Expenses` (governance overhead).
9. *GST Compensation Cess Input:* `Duties & Taxes` (eligible for ITC against cess liability).
10. *Unclaimed Customer Dividends:* `Current Liabilities` (held in trust on behalf of shareholders).

#v(6pt)


== 6.6 The Chart of Accounts Architecture & Custom Sub-Group Design
In multi-branch corporate enterprises, creating custom sub-groups under Tally's 28 predefined groups is essential for executive reporting:
- *Custom Debtors Groups:* Create *North Gujarat Debtors*, *South Gujarat Debtors*, and *Export Debtors* under parent *Sundry Debtors*. This allows sales managers to view region-wise outstanding debt instantly!
- *Custom Creditors Groups:* Create *Raw Material Suppliers* and *Service Providers* under parent *Sundry Creditors*.
- *Custom Expense Groups:* Create *Administrative Expenses* and *Selling & Distribution Expenses* under parent *Indirect Expenses* to analyze departmental cost run-rates.

#v(6pt)


== 6.7 Comprehensive Corporate Balance Sheet & P&L Group Classification Matrix
Mastering these advanced group classifications guarantees success in senior corporate accounting interviews:

#table(
  columns: (1.5fr, 1.5fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Complex Corporate Account]], [#text(weight: "bold", fill: white)[Correct Tally Prime Group]], [#text(weight: "bold", fill: white)[Statement]],
  [Capital Work-in-Progress (CWIP)], [Fixed Assets], [Balance Sheet],
  [Preliminary Incorporation Expenses], [Misc. Expenses (Asset)], [Balance Sheet],
  [Provision for Income Tax], [Provisions / Current Liab], [Balance Sheet],
  [Proposed Dividend A/c], [Provisions / Current Liab], [Balance Sheet],
  [Bills Receivable A/c], [Current Assets], [Balance Sheet],
  [Bills Payable A/c], [Current Liabilities], [Balance Sheet],
  [Unearned Advance Consulting Revenue], [Current Liabilities], [Balance Sheet],
  [Prepaid Fire Insurance Premium], [Current Assets], [Balance Sheet],
  [Inter-Company Current Account], [Branch / Divisions], [Balance Sheet],
  [Security Deposit with Electricity Board], [Deposits (Asset)], [Balance Sheet]
)

#v(6pt)


== 6.9 Step-by-Step Trial Balance Audit & Discrepancy Rectification Drill
The #ul-green[Trial Balance] is the ultimate litmus test of mathematical and double-entry accuracy in Tally Prime. 
- *Accessing the #ul-green[Trial Balance]:* Navigate to *Gateway of Tally > Display More Reports > #ul-green[Trial Balance]* (Shortcut: #key-pill("Alt + G") > type "Trial").
- *Expanding Details:* Press #key-pill("Alt + F1") or #key-pill("Alt + F5") to reveal all underlying secondary groups and ledgers.
- *Detecting Negative Balances:* Tally Prime displays credit balances in debit accounts (or vice versa) with a negative sign or highlighted in red:
  - *Negative Cash Balance:* Indicates cash payments were recorded before capital or sales receipts were posted. Rectify by re-sequencing transaction dates or recording cash infusions.
  - *Negative Stock Balance:* Indicates sales invoices were generated before purchase inward entries were posted. Rectify by checking purchase voucher dates!
  - *Suspense Account Clearance:* If Suspense A/c contains a balance, drill down with #key-pill("Enter"), locate the unidentified debit/credit, trace the source bank statement, and reallocate to the correct customer or expense ledger.

#v(6pt)

== 6.8 Summary & Key Revision Takeaways
- *Groups Govern Financial Reports:* Tally Prime automatically builds the Balance Sheet and Profit & Loss statement based entirely on group attachments.
- *Primary vs Secondary:* 15 Primary groups form the top branches of the Chart of Accounts; 13 Secondary groups offer sub-categorization.
- *Factory Gate Rule:* Direct expenses increase Cost of Goods Sold (COGS) and reduce Gross Profit; Indirect expenses reduce Net Profit.

#v(6pt)

== 6.9 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [How many predefined groups exist in a fresh company in Tally Prime?\
  (A) 15 (B) 24 (C) 28 (D) 32], [*Correct: (C) 28 Predefined Groups*\
  Tally Prime provides exactly 15 Primary groups and 13 Secondary sub-groups.],
  [02], [Under which group is a customer account created in Tally Prime?\
  (A) Sundry Creditors (B) Sundry Debtors (C) Current Liabilities (D) Sales], [*Correct: (B) Sundry Debtors*\
  Sundry Debtors represents trade receivables from whom money is due for credit sales.],
  [03], [Under which group is Input CGST classified in Tally Prime?\
  (A) Indirect Expenses (B) Current Assets (C) Duties & Taxes (D) Provisions], [*Correct: (C) Duties & Taxes*\
  All tax accounts (CGST, SGST, IGST, TDS, TCS) are grouped under Duties & Taxes.],
  [04], [Which of the following is categorized as a Direct Expense in Tally Prime?\
  (A) Office Telephone (B) Factory Wages (C) Audit Fees (D) Bank Charges], [*Correct: (B) Factory Wages*\
  Factory wages are incurred inside the manufacturing facility and affect Gross Profit.],
  [05], [Under which group is Bank Overdraft (OD) categorized?\
  (A) Current Assets (B) Bank Accounts (C) Bank OD A/c (D) Secured Loans], [*Correct: (C) Bank OD A/c*\
  Bank OD is a sub-group under Loans (Liability) reflecting credit limits.],
  [06], [Which group holds a temporary account created to balance an unequal #ul-green[Trial Balance]?\
  (A) Suspense A/c (B) Misc. Expenses (C) Branch/Divisions (D) Provisions], [*Correct: (A) Suspense A/c*\
  Suspense A/c temporarily absorbs unverified ledger differences pending investigation.],
  [07], [What is the parent group of Reserves & Surplus in Tally Prime?\
  (A) Current Liabilities (B) Capital Account (C) Investments (D) Loans], [*Correct: (B) Capital Account*\
  Reserves & Surplus is a secondary sub-group nested under Capital Account.],
  [08], [Carriage Outward is categorized under which group?\
  (A) Direct Expenses (B) Indirect Expenses (C) Fixed Assets (D) Current Assets], [*Correct: (B) Indirect Expenses*\
  Carriage Outward is a selling and distribution expense incurred after the sale.],
  [09], [Where can an accountant view the entire hierarchical tree of groups in Tally Prime?\
  (A) Day Book (B) Chart of Accounts (C) F11 Features (D) Audit Trail], [*Correct: (B) Chart of Accounts*\
  Gateway of Tally > Chart of Accounts > Ledgers reveals the entire group tree.],
  [10], [Can a user create new sub-groups under existing groups in Tally Prime?\
  (A) No, strictly 28 groups only (B) Yes, unlimited custom sub-groups\
  (C) Only with CA license (D) Only in Educational mode], [*Correct: (B) Yes, unlimited custom sub-groups*\
  Users can create custom sub-groups (e.g., North Gujarat Debtors under Sundry Debtors).]
)

#v(6pt)

== 6.10 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Why is Carriage Inward grouped under Direct Expenses while Carriage Outward is grouped under Indirect Expenses?\
  *Model Answer:* Carriage Inward is freight paid to bring raw materials into the business premises to prepare them for sale, making it part of the prime cost of goods sold (COGS). Carriage Outward is delivery freight paid to transport sold goods to the customer, making it a post-production distribution expense.
- *Viva Q2:* What happens to the Balance Sheet if an accountant accidentally groups Office Furniture under Indirect Expenses?\
  *Model Answer:* If Office Furniture is misclassified under Indirect Expenses, the asset value is entirely wiped from the Balance Sheet, and current year profits are heavily understated by the full asset purchase price instead of being capitalized and depreciated over its useful life.
- *Viva Q3:* What is the significance of the *Duties & Taxes* group in automated GST calculation?\
  *Model Answer:* Tally Prime's statutory tax calculation algorithms recognize ledgers grouped under Duties & Taxes with GST type (*Central Tax*, *State Tax*, *Integrated Tax*). It automatically applies statutory tax rates on taxable item values in invoices without requiring manual percentage calculation.
- *Hands-On Lab Task:* In Tally Prime, navigate to *Gateway of Tally > Chart of Accounts > Groups*. Inspect the 28 default groups, press #key-pill("Alt + C"), and create a custom sub-group called *Palanpur Retail Debtors* nested under parent group *Sundry Debtors*.

#pagebreak()

= Topic 07: Company Creation, Alteration, Deletion & Security Architecture

== 7.1 What is a Company in Tally Prime?
In Tally Prime, a *Company* is the highest-level operational entity or electronic database workspace that encapsulates all financial ledgers, stock items, transactions, statutory tax profiles, user permissions, and audit logs of a business enterprise.

Before any accounting entry can be made, a company must be created. Tally Prime assigns every company a unique *5-digit system folder number* (starting from `10000`, `10001`, `10002` onwards) located in the data directory (default path: `C:\Program Files\TallyPrime\Data` or user-defined path `C:\TallyPrime\Data`).

#v(6pt)

== 7.2 Field-by-Field Breakdown of the Company Creation Screen
To create a new company, press #key-pill("Alt + K") (Company Menu) and select *Create*:

#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Screen Field]], [#text(weight: "bold", fill: white)[Recommended Value]], [#text(weight: "bold", fill: white)[Commercial Significance & Statutory Rule]],
  [Company Data Path], [`C:\TallyPrime\Data`], [Physical disk location where company records and encrypted transaction files are stored.],
  [Company Name], [e.g., `Ravi Private Limited`], [Official business legal name as registered under the Companies Act or GST Portal.],
  [Mailing Name], [Auto-populates], [Name printed on all external commercial tax invoices, cheques, and customer statements.],
  [Address], [Full registered address], [Must match physical address on GST registration certificate including building and street.],
  [State / Province], [*Gujarat* (Code: `24`)], [CRITICAL! Governs automated GST calculation (Intrastate CGST+SGST vs Interstate IGST).],
  [Country & Pincode], [`India` · `385001`], [Sets standard base currency symbol (₹) and statutory Indian tax rules.],
  [Telephone & Mobile], [e.g., `7046015165`], [Printed in invoice headers for buyer communication and delivery coordination.],
  [Email & Website], [`ravi@gmail.com`], [Official communication email for automated digital invoice dispatch.],
  [Financial Year Beginning], [`01-Apr-2025`], [Indian statutory financial year always begins on 1st April of the starting year.],
  [Books Beginning From], [`01-Apr-2025`], [Date on which enterprise commenced computerized accounting in Tally Prime.]
)

#v(6pt)

== 7.3 Altering and Deleting Companies in Tally Prime
- *Altering Company Details:* Press #key-pill("Alt + K") > *Alter*. Select the company from the list. You can update address, mobile numbers, email, or enable security passwords. Press #key-pill("Ctrl + A") to save modifications.
- *Deleting a Company Permanently:*
  #block(
    fill: rgb("#FEF2F2"),
    stroke: 1pt + rgb("#FECACA"),
    radius: 4pt,
    inset: 8pt,
    [
      #text(weight: "bold", size: 8.5pt, fill: rgb("#991B1B"))[DANGER: COMPANY DELETION IS PERMANENT! CAUTION REQUIRED!:]\
      1. Navigate to #key-pill("Alt + K") > *Alter* and open the target company.\
      2. On the Alteration screen, press #key-pill("Alt + D").\
      3. Tally displays prompt: *Delete? Yes or No*. Press #key-pill("Enter") or #key-pill("Y").\
      4. Tally displays second confirmation prompt: *Are you sure? Yes or No*. Press #key-pill("Enter").\
      The entire 5-digit data folder is permanently deleted from the disk! Always create a backup (#key-pill("Alt + Y") > *Backup*) before deleting any company!
    ]
  )

#v(6pt)

== 7.4 Security Architecture: Security Control vs Tally Vault
Tally Prime features two powerful independent layers of corporate data protection:

#table(
  columns: (1fr, 1.8fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Security Feature]], [#text(weight: "bold", fill: white)[Security Control (User Roles & Access)]], [#text(weight: "bold", fill: white)[#hl-green[Tally Vault] (Database AES Encryption)]],
  [Primary Purpose], [Internal access control and role segregation among staff members (Admin, Data Entry, Billing, Auditor).], [Total military-grade cryptographic encryption of the company database files on the hard drive.],
  [Company Visibility], [Company name remains visible in the *Select Company* list. Requires username and password to open.], [Company name is completely masked in the Select Company list as asterisks (`*****`) and given a unique folder ID.],
  [User Permissions], [Administrator can restrict data entry operators from viewing Profit & Loss, altering old vouchers, or exporting data.], [Prevents unauthorized hackers or external IT staff from copying data files or reading raw XML/DB files.],
  [Recovery Option], [Administrator can reset passwords of sub-users and assign new roles.], [UNRECOVERABLE! If the #hl-green[Tally Vault] password is lost, even Tally Solutions engineers cannot decrypt or restore the data!]
)

#v(6pt)

== 7.5 Practical Lab Dataset: 5 Authentic Companies from Rahul Sir's Course
Create the following 5 complete commercial companies in Tally Prime, following the exact master data from Rahul Patel Sir's corporate syllabus:

#table(
  columns: (0.4fr, 1.5fr, 1.5fr, 1.1fr, 0.9fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Co.]], [#text(weight: "bold", fill: white)[Legal Business Name]], [#text(weight: "bold", fill: white)[Registered Address]], [#text(weight: "bold", fill: white)[Contact Details]], [#text(weight: "bold", fill: white)[FY & PIN]],
  [01], [Ravi Private Limited], [Near Ambaji Mandir, Main Chowk, Palanpur], [Ph: 252-534234 · Mob: 7046015165 · ravi\@gmail.com], [01-Apr-25 · PIN: 385001],
  [02], [Jaimin Corporation], [Near Cozy Tower, \#476/44, Palanpur], [Ph: 253-786432 · Mob: 7046015169 · ccfabric\@gmail.com], [01-Apr-25 · PIN: 385001],
  [03], [Maheshwari Enterprises], [Jindal Road, Sarkanda, Bsnl Road, Palanpur], [Ph: 252-537777 · Mob: 7046015165 · maheshwari\@gmail.com], [01-Apr-25 · PIN: 385001],
  [04], [Agwan Company], [New Road, Exchange Office, Old Tower Road, Palanpur], [Ph: 252-537123 · Mob: 7046015157 · agwan\@gmail.com], [01-Apr-25 · PIN: 385001],
  [05], [TATA Communication], [\#413/25, Nayi Sadak, Ahmedabad, Gujarat], [Ph: 252-537789 · Mob: 7046015123 · tata\@gmail.com], [01-Apr-25 · PIN: 385555]
)

#v(6pt)

=== Mandatory Practical Exercises on Above Companies:
1. *Company Alteration Drill 1 (Jaimin Corporation):*
   - Change Address to: `\#403/2, Pariwar Mangalam, Old Bus Stop, Deesa Highway, Palanpur`.
   - Update PIN Code to: `385002`. Update Mobile to: `1234567890`. Save with #key-pill("Ctrl + A").
2. *Company Alteration Drill 2 (Ravi Private Limited):*
   - Change Company Legal Name to: `Ravi Private Limited (FY 25-26)`.
   - Update Website to: `www.raviindia.com`. Update Mobile to: `9999999990`.
3. *Company Deletion Drill:*
   - Create a dummy test company named `Delete Me Co.`.
   - Navigate to #key-pill("Alt + K") > *Alter*, open `Delete Me Co.`, press #key-pill("Alt + D"), and verify permanent deletion.

#v(6pt)


== 7.6 Corporate Multi-Company Management & Group Company Creation
Large commercial conglomerates often manage multiple distinct legal entities (e.g., a manufacturing company and a trading subsidiary). Tally Prime provides *Group Company* functionality:
1. *Select Multi-Companies:* Load all individual child companies into Tally Prime memory.
2. *Create Group Company:* Press #key-pill("Alt + K") > *Create Group Company*. Select the child companies (e.g., `Ravi Private Limited` + `Jaimin Corporation`).
3. *Consolidated Reporting:* Tally automatically generates a single *Consolidated Balance Sheet* and *Consolidated Profit & Loss Account*, aggregating revenues, assets, and liabilities across all child entities with zero manual spreadsheet work!

#v(6pt)

== 7.7 Company Data Security & Backup Disaster Recovery Protocol
1. *Automated Daily Backups:* Press #key-pill("Alt + Y") > *Backup*. Designate an external hard drive or secure network NAS share. Tally packages company records into compressed `.tbk` archive files.
2. *Disaster Recovery Restore:* If a hard disk fails, reinstall Tally Prime, press #key-pill("Alt + Y") > *Restore*, specify the backup directory, and restore the company folder.
3. *Never Overwrite Live Data:* When testing historical scenarios, restore backups into a separate custom directory to prevent overwriting active operations!

#v(6pt)


== 7.7 Tally Vault AES Encryption & Lost Password Protocol
#hl-green[Tally Vault] utilizes standard Advanced Encryption Standard (AES) with a 128-bit key. 
- *Database Transformation:* When #hl-green[Tally Vault] is enabled, company data files (`Company.900`, `Trans.900`) are encrypted at the sector level. File names are obfuscated, and the company name in the Tally directory is replaced with a unique 5-digit ID (e.g., `10008`).
- *Security Mandate:* Because Tally Solutions maintains a zero-knowledge architecture, no master backdoors exist. If an administrator loses a #hl-green[Tally Vault] password, the database is permanently rendered unreadable. Always document vault keys in secure corporate key-management vaults!

#v(6pt)


== 7.8 Corporate Security Management: User Roles & Permissions Setup
In a professional corporate accounts department, multiple employees access Tally Prime simultaneously. To prevent fraud, accidental data deletion, or unauthorized access to sensitive financial figures, the administrator configures role-based access:
1. *Enable Security Control:* During company creation (or via #key-pill("Alt + K") > *Security*), set *Control User Access to Company Data* to *Yes*. Provide Administrator Username and secure Password.
2. *Define Security Levels:* Navigate to #key-pill("Alt + K") > *User Roles*. Tally Prime provides default roles: *Owner* and *Data Entry*. Create custom roles such as *Billing Clerk*, *Storekeeper*, and *Tax Auditor*.
3. *Configure Disallow / Allow Permissions:*
   - *Billing Clerk:* Allow *Full Access* to *Sales Vouchers* and *Receipt Vouchers*. Disallow access to *Profit & Loss Account*, *Balance Sheet*, and *Bank Accounts*.
   - *Storekeeper:* Allow access strictly to *Stock Journal*, *Physical Stock*, and *Inventory Reports*. Disallow all financial accounting vouchers.
   - *Junior Accountant:* Disallow *Back-Dated Vouchers* older than 3 days to prevent alteration of closed monthly accounts!
4. *Create User Accounts:* Navigate to #key-pill("Alt + K") > *Users and Passwords*. Assign unique usernames and passwords to each staff member linked to their designated security role.

#v(6pt)


== 7.9 Statutory MCA Audit Trail (Edit Log) Compliance Mandate
Under notification *GSR 235(E)* issued by the Ministry of Corporate Affairs (MCA), with effect from 1st April 2023, every company registered under the Companies Act 2013 must use accounting software featuring an unalterable audit trail:
- *Tally Prime Edit Log Edition:* Tally Solutions offers a specialized release titled *TallyPrime Edit Log*. In this release, the audit trail feature is hard-coded and cannot be disabled under any circumstances, even by the company administrator.
- *Tracking Every Change:* When an accounts clerk edits an invoice, changes a ledger amount, or deletes a voucher, Tally logs:
  1. The exact timestamp of the modification.
  2. The username of the operator who executed the change.
  3. The previous field values alongside the new altered values.
- *Auditor's Statutory Report (CARO):* Company statutory auditors must explicitly certify in their annual audit report whether the client operated accounting software with an unbroken audit trail throughout the financial year!

#v(6pt)

== 7.9 Summary & Key Revision Takeaways
- *Creation Prerequisite:* Company creation is the gateway to Tally Prime accounting. State selection (Gujarat Code 24) is paramount for accurate GST calculations.
- *Alteration vs Deletion:* Press #key-pill("Alt + K") > *Alter* to update details. Press #key-pill("Alt + D") on the Alteration screen to delete permanently.
- *Security Prudence:* Use Security Control for multi-user role segregation. Use #hl-green[Tally Vault] for cryptographic confidentiality, but never lose the password!

#v(6pt)

== 7.10 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [Which keyboard shortcut opens the Company Menu in Tally Prime?\
  (A) Alt+C (B) Alt+K (C) Ctrl+K (D) Alt+F3], [*Correct: (B) Alt+K*\
  Alt+K is the universal top-bar Company menu shortcut in Tally Prime.],
  [02], [How many digits are assigned to a company data folder in Tally Prime?\
  (A) 4 Digits (B) 5 Digits (C) 6 Digits (D) 8 Digits], [*Correct: (B) 5 Digits (e.g., 10000, 10001)*\
  Tally assigns sequential 5-digit numbered folders on the hard drive.],
  [03], [Which key combination is pressed on the Company Alteration screen to delete a company?\
  (A) Ctrl+D (B) Alt+X (C) Alt+D (D) Shift+Delete], [*Correct: (C) Alt+D*\
  Alt+D deletes any master, ledger, voucher, or company when in alter mode.],
  [04], [In India, what is the standard statutory date for Financial Year Beginning?\
  (A) 01-Jan (B) 01-Apr (C) 01-Jul (D) 01-Oct], [*Correct: (B) 01-Apr*\
  Under Indian tax law, the financial year runs from 1st April to 31st March.],
  [05], [Why is accurate State selection mandatory during Company Creation in Tally Prime?\
  (A) Sets font language (B) Determines CGST/SGST vs IGST\
  (C) Sets system clock (D) Controls backup frequency], [*Correct: (B) Determines CGST/SGST vs IGST*\
  Tally matches the company state with the customer state to determine tax type.],
  [06], [What happens to a company name in the Select Company list when protected by #hl-green[Tally Vault]?\
  (A) Highlighted in red (B) Hidden as asterisks (\*\*\*\*\*) with a number\
  (C) Moved to recycle bin (D) Exported to PDF], [*Correct: (B) Hidden as asterisks (\*\*\*\*\*) with a number*\
  #hl-green[Tally Vault] conceals the company name to prevent identification by unauthorized users.],
  [07], [What happens if an accountant forgets the #hl-green[Tally Vault] password?\
  (A) OTP sent to registered mobile (B) Password reset by Admin\
  (C) Data is permanently unrecoverable (D) Auto-unlocks after 24 hours], [*Correct: (C) Data is permanently unrecoverable*\
  Due to strong AES encryption, lost #hl-green[Tally Vault] passwords cannot be recovered.],
  [08], [Which shortcut switches between already opened companies in Tally Prime?\
  (A) F1 (B) F2 (C) F3 (D) Alt+F3], [*Correct: (C) F3 (Select Company)*\
  F3 allows accountants to switch between loaded companies instantaneously.],
  [09], [Which feature allows an administrator to prevent junior staff from altering back-dated vouchers?\
  (A) Tally Audit & Back-dated Lock (B) #hl-green[Tally Vault]\
  (C) F11 GST (D) Data Split], [*Correct: (A) Tally Audit & Back-dated Lock*\
  Security Control allows setting a cutoff date beyond which vouchers cannot be edited.],
  [10], [Can a company's financial year beginning date be altered once transactions are recorded?\
  (A) Yes, anytime (B) No, alters chronological integrity\
  (C) Only with CA approval (D) Only in Gold edition], [*Correct: (B) No, alters chronological integrity*\
  Once transactions are recorded, financial year beginning cannot be moved arbitrarily.]
)

#v(6pt)

== 7.11 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain the critical operational distinction between *Financial Year Beginning From* and *Books Beginning From*.\
  *Model Answer:* *Financial Year Beginning From* is the official statutory tax year (always 1st April in India). *Books Beginning From* is the actual date on which the enterprise started operating or commenced recording computerized accounts in Tally Prime (e.g., if a new business opens on 1st November 2025, FY is 01-Apr-2025 but Books Beginning is 01-Nov-2025).
- *Viva Q2:* How does Tally Prime determine whether to calculate CGST + SGST or IGST automatically during voucher entry?\
  *Model Answer:* Tally Prime compares the *State* specified in the Company Creation profile with the *State* specified in the Party Ledger (Customer or Supplier). If both states match (e.g., both are Gujarat), it triggers Intrastate CGST + SGST. If the states differ, it triggers Interstate IGST.
- *Viva Q3:* What precautions must an accountant take before executing a company deletion with Alt+D?\
  *Model Answer:* Because deletion via Alt+D permanently erases the physical database folder from the hard disk with zero recovery option, the accountant must first perform a full company backup via #key-pill("Alt + Y") > *Backup* to an external drive or cloud storage.
- *Hands-On Lab Task:* In Tally Prime, create Company 1 (*Ravi Private Limited*) using the exact specifications in Section 7.5. Press #key-pill("F11") to inspect Company Features, enable GST with Gujarat State Code `24`, and verify that the 5-digit company folder number appears correctly in the data path.

#pagebreak()

= Topic 08: Types of Business Organizations & Corporate Case Studies

== 8.1 The Three Classical Business Models in Corporate Commerce
In modern commercial accounting, commercial enterprises are fundamentally classified into three operational categories, each possessing unique inventory lifecycles, cost structures, and statutory tax obligations:

#table(
  columns: (1fr, 1.8fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Business Model]], [#text(weight: "bold", fill: white)[Operational Lifecycle & Value Chain]], [#text(weight: "bold", fill: white)[Tally Prime Accounting Architecture]],
  [1. Trading Concerns], [Procures finished goods from wholesalers or manufacturers and resells them directly to retailers or end-consumers without physical transformation.], [Tracks Stock Items, Units of Measure (Pcs, Box), Purchase & Sales Vouchers (F9/F8) in *Item Invoice* mode. Gross profit is derived from trade margins.],
  [2. Manufacturing Units], [Procures raw materials and components, utilizes labour, power, and machinery to convert them into finished goods via an assembly process.], [Requires *#hl-green[Bill of Materials (BOM)]*, Godown management, and *Stock Journal* (Alt+F7) manufacturing vouchers to track conversion costs.],
  [3. Service Providers], [Delivers intangible professional, technical, artistic, or operational expertise (IT consulting, audit, healthcare, logistics) without physical stock.], [Operates in *Accounting Invoice* mode (Ctrl+H). Relies on SAC (Services Accounting Code), Direct/Indirect Expense ledgers, and TDS withholding under Sec 194J/194C.]
)

#v(6pt)

== 8.2 Corporate Case Study 1: Service Provider (RTechLab IT Consultancy)
*Enterprise Profile:* RTechLab is a premier corporate technology consulting and digital learning provider based in Palanpur, Gujarat (GSTIN: `24ABCDE1234F1Z5`).
- *Commercial Transaction:* On 15-May-2025, RTechLab raised a professional consulting invoice to *Jaimin Corporation* for setting up a multi-branch computerized accounting infrastructure.
- *Commercial Terms:*
  - Professional Consultancy Fee: ₹60,000 (SAC: `998314` — IT Consulting Services).
  - GST Rate: 18% Intrastate (CGST 9% = ₹5,400 | SGST 9% = ₹5,400). Total Invoice Value = ₹70,800.
  - Statutory TDS: Jaimin Corporation is a registered corporate client and deducts *#hl-orange[10% TDS] under #ul-orange[Section 194J]* on basic fee: [₹60,000 × 10% = ₹6,000].
- *Step-by-Step Tally Prime Journal Posting:*
  1. *Sales Voucher (F8) in Accounting Invoice Mode (Ctrl+H):*
     - Debit: *Jaimin Corporation (Sundry Debtors)* ₹70,800
     - Credit: *IT Consulting Revenue A/c* ₹60,000
     - Credit: *Output CGST 9% A/c* ₹5,400
     - Credit: *Output SGST 9% A/c* ₹5,400
  2. *Receipt Voucher (F6) upon Customer Settlement:*
     - Debit: *HDFC Bank Current A/c* ₹64,800 (Net funds received)
     - Debit: *TDS Receivable Sec 194J A/c* ₹6,000 (Tax asset claimed against Advance Tax)
     - Credit: *Jaimin Corporation* ₹70,800 (Full settlement against bill)

#v(6pt)

== 8.3 Corporate Case Study 2: Trading Enterprise (Unjha Mandi Agricultural Trading)
*Enterprise Profile:* Unjha Mandi Commodity Traders, Mehsana/Palanpur (Gujarat). Specializes in agricultural commodity aggregation.
- *Commercial Transaction:* Procurement and interstate trading of organic cumin seeds (*Jeera*).
- *Purchase Leg (Tax Exempt):*
  - Purchased 5,000 kg Premium Cumin Seeds from Unjha APMC Farmers at ₹220/kg = ₹11,00,000.
  - GST Rate on unbranded fresh agricultural commodities: *0% (Nil Rated / Exempt)* under HSN `090931`.
  - Paid ₹22,000 Mandi Cess and ₹18,000 Freight Inward via Contra/Payment.
- *Sales Leg (Interstate Processed & Packaged):*
  - Cleaned, packaged into branded 25 kg bags, and sold 4,000 kg to *Mumbai Spice Hub* (Maharashtra, State Code `27`).
  - Selling Rate: ₹320/kg = ₹12,80,000.
  - Applicable GST: Interstate *IGST 5%* (Packaged food grain): [₹12,80,000 × 5% = ₹64,000].
  - Total Invoice Value: ₹13,44,000.
- *Gross Margin Analysis in Tally Prime:*
  - Revenue: ₹12,80,000.
  - COGS (Cost of Goods Sold): [4,000 kg × ₹220 + allocated freight/mandi cess = ₹9,12,000].
  - Gross Profit (GP) = ₹3,68,000 (GP Margin: 28.75%).

#v(6pt)

== 8.4 Corporate Case Study 3: Manufacturing Firm (Morbi Ceramic Tiles with BOM)
*Enterprise Profile:* Morbi Tiles & Sanitaryware Pvt Ltd (Morbi, Gujarat).
- *#hl-green[Bill of Materials (BOM)] Setup in Tally Prime:*
  - Finished Product: *Super Polish Ceramic Floor Tile 600x600mm* (Unit: Box, 1 Box = 4 Tiles).
  - Raw Material Requirements per 100 Boxes:
    1. Clay / Kaolin: 1,800 kg @ ₹4/kg = ₹7,200
    2. Feldspar Powder: 600 kg @ ₹6/kg = ₹3,600
    3. Glaze Chemical / Pigment: 80 kg @ ₹50/kg = ₹4,000
    4. Corrugated Packaging Boxes: 100 Boxes @ ₹18/box = ₹1,800
    5. Direct Factory Labour & Power Allocation: ₹3,400
  - Total Production Cost per 100 Boxes = ₹20,000 (Cost per Box = ₹200).
- *Manufacturing Process via Stock Journal (Alt+F7):*
  - Select *Manufacturing Journal* voucher type.
  - Target Finished Goods: Ceramic Floor Tile (100 Boxes).
  - Tally Prime automatically pulls raw material quantities from the pre-configured BOM and deducts inventory from the Raw Material Godown while simultaneously adding 100 Boxes to the Finished Goods Godown!
- *Commercial Sale with #hl-orange[18% GST]:*
  - Sold 500 Boxes to Ahmedabad Realty Corp @ ₹380/box = ₹1,90,000 + #hl-orange[18% GST] (CGST ₹17,100 + SGST ₹17,100) = ₹2,24,200.

#v(6pt)

== 8.5 12-Month Operating Simulation Dataset for Students
Practice recording the 12-month commercial transaction lifecycle:

#table(
  columns: (0.6fr, 1.2fr, 2.4fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Month]], [#text(weight: "bold", fill: white)[Transaction Cycle]], [#text(weight: "bold", fill: white)[Key Practical Accounting Operation]],
  [Month 01 (Apr)], [Establishment & Capital], [Introduce ₹10 Lakhs capital, open HDFC Current A/c, pay office deposit ₹1.5 Lakhs.],
  [Month 02 (May)], [Capex & Assets], [Procure office computers ₹80,000 + #hl-orange[18% GST], furniture ₹45,000, printer ₹15,000.],
  [Month 03 (Jun)], [Raw Material Sourcing], [Procure 1,000 units merchandise on credit from Avni Pvt Ltd (Inv \#801) + #hl-orange[18% GST].],
  [Month 04 (Jul)], [Domestic Sales], [Sell 600 units to Ravi Enterprises @ 40% margin, collect payment via RTGS.],
  [Month 05 (Aug)], [Statutory GST Payment], [Offset Input Tax Credit against Output GST liability and pay net cash via PMT-06 challan.],
  [Month 06 (Sep)], [Interstate Trading], [Procure goods from Vishnu Pvt Ltd (Karnataka) with IGST and supply to Mumbai Tech Hub.],
  [Month 07 (Oct)], [Festival Bonus & Advance], [Disburse Diwali staff advances and record festive advertising campaigns.],
  [Month 08 (Nov)], [Service Billing & TDS], [Raise consulting invoices with SAC codes, verify TDS withholding under Sec 194J.],
  [Month 09 (Dec)], [Credit & Debit Notes], [Record customer returns for damaged items, issue credit notes, debit suppliers.],
  [Month 10 (Jan)], [Q3 TDS Return Filing], [Reconcile TDS ledgers against quarterly #ul-green[Form 26Q] statement, pay #ul-green[Challan 281].],
  [Month 11 (Feb)], [Annual BRS Audit], [Perform comprehensive Bank Reconciliation Statement across all 12 months bank records.],
  [Month 12 (Mar)], [Year-End Closing], [Depreciation write-offs, physical stock verification, closing stock valuation, split data.]
)

#v(6pt)


== 8.6 Detailed Cost Sheet & Breakeven Analysis for Manufacturing Units
In manufacturing accounting, the production cost lifecycle follows a rigorous multi-stage hierarchy:
1. *Prime Cost:* Raw Materials Consumed + Direct Factory Wages + Direct Manufacturing Expenses.
2. *Factory / Works Cost:* Prime Cost + Factory Overheads (power, machinery maintenance, supervisor salaries).
3. *Cost of Production:* Works Cost + Administrative Office Overheads.
4. *Total Cost of Sales:* Cost of Production + Selling and Distribution Overheads (freight outward, advertising).
5. *Profit:* Net Invoiced Sales Revenue minus Total Cost of Sales.

#v(6pt)


== 8.7 Corporate Case Study 4: E-Commerce Marketplace Vendor (TCS Sec 52)
*Enterprise Profile:* Palanpur Handicrafts & Textiles selling via Amazon / Flipkart.
- *Commercial Mechanism:* Goods sold to customers nationwide. E-commerce operator collects customer funds, deducts *TCS (Tax Collected at Source) @ 1% under GST Section 52*, deducts marketplace commission @ 15% + #hl-orange[18% GST], and remits net funds.
- *Tally Prime Accounting Workflow:*
  1. Record Sales Voucher (F8) to customer with Interstate IGST or Intrastate CGST/SGST.
  2. Debit *TCS Receivable under GST A/c* (Current Asset) for 1% withheld by Amazon.
  3. Debit *Marketplace Commission Expense A/c* and *Input GST A/c* via Purchase Voucher (F9).
  4. Reconcile net bank remittances in Receipt Voucher (F6) against monthly marketplace settlement statements.

#v(6pt)


== 8.8 Multi-Location Inventory & Godown Management Architecture
Medium and large commercial enterprises store physical merchandise across multiple warehouses, retail outlets, and distribution hubs:
- *Activating Godowns:* Navigate to *Gateway of Tally > Create > Godowns* (or press #key-pill("F11") to verify inventory features).
- *Defining Warehouse Hierarchy:*
  - Primary Godowns: `Palanpur Central Warehouse`, `Ahmedabad Regional Depot`.
  - Sub-Godowns: `Raw Materials Section A`, `Finished Goods Section B`, `Damaged Goods Quarantine`.
- *Inter-Godown Transfer via Stock Journal (Alt+F7):*
  When transferring 100 Pcs computer components from Central Warehouse to Retail Showroom:
  - Select *Stock Journal* voucher.
  - Left Side (Source / Consumption): Specify `Palanpur Central Warehouse`, item name, and quantity.
  - Right Side (Destination / Production): Specify `Retail Showroom Godown`, item name, and quantity.
  Tally Prime instantaneously adjusts physical stock at both locations without altering total company asset value!

#v(6pt)

== 8.8 Summary & Key Revision Takeaways
- *Business Architecture:* Trading businesses operate on trade margins; Service providers bill on time/expertise and manage TDS; Manufacturers utilize #hl-green[Bill of Materials (BOM)] to track production cost per unit.
- *BOM Automation:* In Tally Prime, configuring a BOM allows one-click conversion of multi-item raw materials into finished stock via the Stock Journal.
- *Statutory Nexus:* Every business type must balance GST Output liabilities with Input Tax Credits and enforce TDS withholding where applicable.

#v(6pt)

== 8.9 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [What does BOM stand for in Tally Prime manufacturing?\\
  (A) Bill of Mandate (B) Bill of Materials\\
  (C) Book of Management (D) Balance of Margin], [*Correct: (B) Bill of Materials*\\
  BOM defines the standard list and quantities of raw materials needed to produce one unit of finished product.],
  [02], [Which voucher type is used to execute a manufacturing process in Tally Prime?\\
  (A) Purchase (F9) (B) Stock Journal (Alt+F7)\\
  (C) Sales (F8) (D) Journal (F7)], [*Correct: (B) Stock Journal (Alt+F7)*\\
  Stock Journal with Manufacturing flag converts raw materials into finished goods.],
  [03], [In which voucher mode should a chartered accountant or IT consultant raise bills?\\
  (A) Item Invoice (B) Accounting Invoice (C) As Voucher (D) Memo], [*Correct: (B) Accounting Invoice (Ctrl+H)*\\
  Service firms sell intangible services without physical stock quantities.],
  [04], [Under which section of Income Tax is TDS deducted on professional fees?\\
  (A) 194C (B) 194J (C) 194I (D) 194H], [*Correct: (B) #ul-orange[Section 194J]*\\
  #ul-orange[Section 194J] governs fees for professional and technical services at 10% / 2%.],
  [05], [What is the GST rate on fresh unbranded cumin seeds (Jeera) sold by farmers?\\
  (A) 0% (Nil Rated / Exempt) (B) 5% (C) 12% (D) 18%], [*Correct: (A) 0% (Nil Rated / Exempt)*\\
  Fresh, unbranded agricultural produce direct from farmers is fully exempt under GST.],
  [06], [Which of the following is considered a Direct Cost in manufacturing ceramic tiles?\\
  (A) Head office AC electricity (B) Factory glaze chemical\\
  (C) Directors salary (D) Showroom rent], [*Correct: (B) Factory glaze chemical*\\
  Glaze chemical is a direct raw material consumable entering the physical tile.],
  [07], [In a trading business, how is Gross Profit calculated?\\
  (A) Sales - Net Profit (B) Net Sales - Cost of Goods Sold (COGS)\\
  (C) Total Assets - Liabilities (D) Cash Inflow - Cash Outflow], [*Correct: (B) Net Sales - Cost of Goods Sold (COGS)*\\
  Trading Account reveals Gross Profit by deducting COGS from net sales revenue.],
  [08], [Which report in Tally Prime displays raw material consumption vs finished stock?\\
  (A) Ratio Analysis (B) Stock Summary & Production Report\\
  (C) Day Book (D) Balance Sheet], [*Correct: (B) Stock Summary & Production Report*\\
  Displays physical stock movements, inward procurement, and consumption.],
  [09], [When an IT consulting firm receives payment net of #hl-orange[10% TDS], how is the TDS treated?\\
  (A) Business expense (B) Current Asset (TDS Receivable)\\
  (C) Current Liability (D) Fixed Asset], [*Correct: (B) Current Asset (TDS Receivable)*\\
  TDS deducted by clients is an advance tax asset claimed in the corporate ITR.],
  [10], [Can a single company in Tally Prime operate both trading and service divisions?\\
  (A) No, requires separate licenses (B) Yes, using Cost Centres and separate ledgers\\
  (C) Only with CA permission (D) Only in Gold edition], [*Correct: (B) Yes, using Cost Centres and separate ledgers*\\
  Tally Prime seamlessly integrates trading, manufacturing, and services.]
)

#v(6pt)

== 8.10 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Why is a #hl-green[Bill of Materials (BOM)] essential in manufacturing accounting?\\
  *Model Answer:* Without a BOM, an accountant would have to manually calculate and pass hundreds of individual consumption entries every time goods are produced. A BOM automates inventory reduction of components in exact technical proportions and accurately computes the per-unit finished manufacturing cost.
- *Viva Q2:* How does the accounting workflow differ when billing goods vs billing services?\\
  *Model Answer:* Billing goods requires *Item Invoice* mode, stock items, units of measure, HSN codes, and godown selection. Billing services requires *Accounting Invoice* mode, service ledgers, SAC codes, and TDS withholding considerations without inventory tracking.
- *Viva Q3:* Explain the treatment of Mandi Cess paid during agricultural procurement.\\
  *Model Answer:* Mandi Cess paid to agricultural market committees is a statutory procurement levy and is treated as a *Direct Expense* debited to the Trading Account, thereby increasing the effective cost of goods acquired.
- *Hands-On Lab Task:* In Tally Prime, create a finished stock item named *Computer Desktop Set*, enable *BOM*, and configure its components: 1 CPU Cabinet, 1 Monitor, 1 Keyboard, and 1 Mouse. Record the assembly of 10 desktop sets using the *Stock Journal* voucher.

#pagebreak()

= Topic 09: Practical Commercial Invoices (Item Mode vs Accounting Mode)

== 9.1 Statutory Anatomy of a GST Tax Invoice (CGST Rule 46)
Under Section 31 of the CGST Act, 2017 read with *#ul-orange[Rule 46] of the CGST Rules*, every registered taxable person supplying taxable goods or services must issue a valid *Tax Invoice*. 

A legally valid commercial tax invoice must mandatorily contain the following statutory particulars:
1. *Supplier Identity:* Name, registered corporate address, and 15-digit GSTIN of the supplier.
2. *Consecutive Serial Number:* A unique sequential number (up to 16 characters) containing alphabets, numerals, and special characters (`-` or `/`), unique for each financial year.
3. *Date of Issue:* The date on which the invoice is generated and goods are removed/dispatched.
4. *Recipient Identity:* Name, address, and GSTIN/UIN of the recipient (if registered for B2B).
5. *Place of Supply:* Name of the destination State and State Code (crucial for determining CGST+SGST vs IGST).
6. *HSN / SAC Code:* Harmonized System of Nomenclature (4 or 6 digits) or Services Accounting Code.
7. *Commercial Description:* Detailed technical description of goods or nature of services provided.
8. *Quantity & UoM:* Number of units and physical Unit of Measure (Pcs, Box, Kgs, Litres).
9. *Taxable Value & Rate:* Total value of supply after deducting trade discounts, and tax rate applicable (0%, 5%, 12%, 18%, 28%).
10. *Statutory Tax Breakup:* Separate line items for Central Tax (CGST), State Tax (SGST), and Integrated Tax (IGST).

#v(6pt)

== 9.2 The 6 Authentic Corporate Commercial Invoices
Below are 6 authentic, production-grade commercial invoices formatted according to statutory Indian GST standards:

=== Invoice 01: Local Purchase Tax Exempt (0% GST — Agricultural Seeds)
#gst-tax-invoice-format(
  inv-no: "PUR/EXM/25-26/041",
  inv-date: "04-May-2025",
  seller-name: "Gujarat Agro Seeds Cooperative",
  seller-address: "APMC Market Yard, Unjha Highway, Palanpur - 385001",
  seller-gstin: "24AAACG1122K1Z8",
  buyer-name: "Ravi Private Limited",
  buyer-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  buyer-gstin: "24AABCR9876Q1Z2",
  items-rows: (
    [1], [Certified Organic Mustard Seeds], [120991], [20 Bags], [2,500.00], [50,000.00], [0.00], [0.00], [50,000.00],
    [2], [Hybrid Cumin Agricultural Seeds], [120999], [30 Bags], [3,000.00], [90,000.00], [0.00], [0.00], [90,000.00]
  ),
  total-taxable: "1,40,000.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "0.00",
  grand-total: "1,40,000.00",
  in-words: "Rupees One Lakh Forty Thousand Only"
)

#v(8pt)

=== Invoice 02: Local Purchase GST 18% (Avni Pvt Ltd — Hardware Components)
#gst-tax-invoice-format(
  inv-no: "AVN/GUJ/25-26/108",
  inv-date: "12-May-2025",
  seller-name: "Avni Private Limited",
  seller-address: "GIDC Electronics Zone, Sector 25, Gandhinagar - 382024",
  seller-gstin: "24AABCA5544P1Z3",
  buyer-name: "Ravi Private Limited",
  buyer-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  buyer-gstin: "24AABCR9876Q1Z2",
  items-rows: (
    [1], [Samsung 24\" IPS LED Monitor], [847160], [10 Pcs], [6,500.00], [65,000.00], [5,850.00], [5,850.00], [76,700.00],
    [2], [Logitech Wireless Keyboard Combo], [847160], [20 Pcs], [1,200.00], [24,000.00], [2,160.00], [2,160.00], [28,320.00]
  ),
  total-taxable: "89,000.00",
  cgst-amt: "8,010.00",
  sgst-amt: "8,010.00",
  igst-amt: "0.00",
  grand-total: "1,05,020.00",
  in-words: "Rupees One Lakh Five Thousand Twenty Only"
)

#v(8pt)

=== Invoice 03: Interstate Purchase IGST 18% (Vishnu Pvt Ltd — Karnataka to Gujarat)
#gst-tax-invoice-format(
  inv-no: "VIS/BLR/25-26/512",
  inv-date: "18-May-2025",
  seller-name: "Vishnu Technologies Pvt Ltd",
  seller-address: "Electronic City Phase 1, Bangalore, Karnataka - 560100",
  seller-gstin: "29AABCV7788M1Z4",
  buyer-name: "Ravi Private Limited",
  buyer-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  buyer-gstin: "24AABCR9876Q1Z2",
  items-rows: (
    [1], [Enterprise Solid State Drive 2TB], [847170], [15 Pcs], [8,000.00], [1,20,000.00], [0.00], [0.00], [1,41,600.00],
    [2], [Cisco Gigabit Managed Switch 24P], [851762], [4 Pcs], [18,500.00], [74,000.00], [0.00], [0.00], [87,320.00]
  ),
  total-taxable: "1,94,000.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "34,920.00",
  grand-total: "2,28,920.00",
  in-words: "Rupees Two Lakh Twenty Eight Thousand Nine Hundred Twenty Only"
)

#v(8pt)

=== Invoice 04: Local B2B Sales GST 18% (Ravi Enterprises Palanpur)
#gst-tax-invoice-format(
  inv-no: "RTECH/SALES/25-26/001",
  inv-date: "22-May-2025",
  seller-name: "Ravi Private Limited",
  seller-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  seller-gstin: "24AABCR9876Q1Z2",
  buyer-name: "Maheshwari Enterprises",
  buyer-address: "Jindal Road, Sarkanda, Bsnl Road, Palanpur - 385001",
  buyer-gstin: "24AABCM3344R1Z1",
  items-rows: (
    [1], [Samsung 24\" IPS LED Monitor], [847160], [6 Pcs], [8,200.00], [49,200.00], [4,428.00], [4,428.00], [58,056.00],
    [2], [Logitech Wireless Combo], [847160], [12 Pcs], [1,650.00], [19,800.00], [1,782.00], [1,782.00], [23,364.00]
  ),
  total-taxable: "69,000.00",
  cgst-amt: "6,210.00",
  sgst-amt: "6,210.00",
  igst-amt: "0.00",
  grand-total: "81,420.00",
  in-words: "Rupees Eighty One Thousand Four Hundred Twenty Only"
)

#v(8pt)

=== Invoice 05: Interstate B2B Sales IGST 18% (Mumbai Tech Hub — Maharashtra)
#gst-tax-invoice-format(
  inv-no: "RTECH/SALES/25-26/002",
  inv-date: "25-May-2025",
  seller-name: "Ravi Private Limited",
  seller-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  seller-gstin: "24AABCR9876Q1Z2",
  buyer-name: "Mumbai IT Infrastructure Hub",
  buyer-address: "Andheri East Tech Park, MIDC Zone, Mumbai - 400093",
  buyer-gstin: "27AAACM4455N1Z9",
  items-rows: (
    [1], [Enterprise Solid State Drive 2TB], [847170], [10 Pcs], [10,500.00], [1,05,000.00], [0.00], [0.00], [1,23,900.00],
    [2], [Cisco Gigabit Managed Switch 24P], [851762], [2 Pcs], [24,000.00], [48,000.00], [0.00], [0.00], [56,640.00]
  ),
  total-taxable: "1,53,000.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "27,540.00",
  grand-total: "1,80,540.00",
  in-words: "Rupees One Lakh Eighty Thousand Five Hundred Forty Only"
)

#v(8pt)

=== Invoice 06: Accounting / Service Invoice (Professional IT Consulting SAC 998314)
#gst-tax-invoice-format(
  inv-no: "RTECH/SRV/25-26/015",
  inv-date: "28-May-2025",
  seller-name: "Ravi Private Limited (Consulting Division)",
  seller-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  seller-gstin: "24AABCR9876Q1Z2",
  buyer-name: "Jaimin Corporation",
  buyer-address: "Near Cozy Tower, #476/44, Palanpur - 385001",
  buyer-gstin: "24AABCJ6677K1Z0",
  items-rows: (
    [1], [Corporate Accounting Setup & ERP], [998314], [1 Job], [50,000.00], [50,000.00], [4,500.00], [4,500.00], [59,000.00],
    [2], [Annual GST Portal Audit Support], [998311], [1 Term], [25,000.00], [25,000.00], [2,250.00], [2,250.00], [29,500.00]
  ),
  total-taxable: "75,000.00",
  cgst-amt: "6,750.00",
  sgst-amt: "6,750.00",
  igst-amt: "0.00",
  grand-total: "88,500.00",
  in-words: "Rupees Eighty Eight Thousand Five Hundred Only"
)

#v(6pt)


#v(8pt)

=== Invoice 07: Job-Work Procurement Invoice under Section 143 (Fabrication & Assembly)
#gst-tax-invoice-format(
  inv-no: "JBW/MEH/25-26/088",
  inv-date: "29-May-2025",
  seller-name: "Mehsana Precision Engineering Works",
  seller-address: "GIDC Industrial Estate, Mehsana, Gujarat - 384002",
  seller-gstin: "24AAAFM9012D1Z6",
  buyer-name: "Ravi Private Limited",
  buyer-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  buyer-gstin: "24AABCR9876Q1Z2",
  items-rows: (
    [1], [Precision CNC Milling of Chassis], [998811], [10 Sets], [4,500.00], [45,000.00], [4,050.00], [4,050.00], [53,100.00],
    [2], [Electrostatic Powder Coating Treatment], [998812], [10 Sets], [1,500.00], [15,000.00], [1,350.00], [1,350.00], [17,700.00]
  ),
  total-taxable: "60,000.00",
  cgst-amt: "5,400.00",
  sgst-amt: "5,400.00",
  igst-amt: "0.00",
  grand-total: "70,800.00",
  in-words: "Rupees Seventy Thousand Eight Hundred Only"
)

#v(8pt)

=== Invoice 08: Inter-State B2B Sales of Capital Goods (Enterprise Server Hardware)
#gst-tax-invoice-format(
  inv-no: "RTECH/CAP/25-26/003",
  inv-date: "30-May-2025",
  seller-name: "Ravi Private Limited",
  seller-address: "Near Ambaji Mandir, Main Chowk, Palanpur - 385001",
  seller-gstin: "24AABCR9876Q1Z2",
  buyer-name: "Rajasthan Cloud Computing Infrastructure",
  buyer-address: "Sitapura Industrial Area, Tonk Road, Jaipur - 302022",
  buyer-gstin: "08AAACR8899P1Z5",
  items-rows: (
    [1], [Dell PowerEdge Rack Server Dual Xeon], [847141], [1 Unit], [1,80,000.00], [1,80,000.00], [0.00], [0.00], [2,12,400.00],
    [2], [APC Smart-UPS On-Line 3kVA Rackmount], [850440], [1 Unit], [45,000.00], [45,000.00], [0.00], [0.00], [53,100.00]
  ),
  total-taxable: "2,25,000.00",
  cgst-amt: "0.00",
  sgst-amt: "0.00",
  igst-amt: "40,500.00",
  grand-total: "2,65,500.00",
  in-words: "Rupees Two Lakh Sixty Five Thousand Five Hundred Only"
)

== 9.3 Step-by-Step Tally Prime Entry Guide for Commercial Invoices
1. *Select Voucher Type:* Press #key-pill("F9") for Purchases or #key-pill("F8") for Sales.
2. *Set Correct Invoice Date:* Press #key-pill("F2") and specify the exact transaction date.
3. *Set Voucher Mode:* Press #key-pill("Ctrl + H") and choose *Item Invoice* for physical merchandise or *Accounting Invoice* for professional services.
4. *Enter Supplier Invoice Number & Date:* Mandatory in Purchase vouchers to enable #ul-green[GSTR-2B] automated matching.
5. *Select Party Account Name:* Choose the supplier or customer ledger. Tally auto-loads address, state, and GSTIN.
6. *Select Stock Items & Quantities:* Enter quantities and agreed commercial rates.
7. *Attach GST Ledgers:* Select *CGST* and *SGST* for local supplies or *IGST* for interstate supplies.
8. *Verify Tax Analysis Screen:* Press #key-pill("Ctrl + O") > *Tax Analysis* (or #key-pill("Alt + A") followed by #key-pill("Alt + F1")) to inspect detailed item-by-item HSN taxable values and statutory tax splits!
9. *Save Voucher:* Press #key-pill("Ctrl + A") to post the invoice immediately.

#v(6pt)


== 9.4 Automated Round-Off Ledger Configuration in Invoices
In commercial invoicing, statutory tax calculations frequently yield fractional paise amounts (e.g., ₹81,420.38). Corporate standards dictate rounding total invoices to the nearest whole rupee:
- *Round-Off Ledger Creation:* Create ledger *Round Off* under group *Indirect Expenses*.
- *Type of Ledger:* Select *Invoice Rounding* with *Normal Rounding* and rounding limit set to `1.00`.
- *Automated Execution:* When selected at the bottom of the invoice, Tally Prime automatically detects whether to add or subtract the fractional difference (e.g., subtracting ₹0.38 or adding ₹0.12), ensuring invoice totals match banking payment portals down to the exact rupee!

#v(6pt)


== 9.5 Practical Lab Dataset: 10 Student Invoicing Exercises
Enter the following 10 commercial invoicing scenarios into Tally Prime, verifying automated GST calculation and tax splits:
1. *Local Purchase #hl-orange[5% GST]:* Procured 50 bags Cattle Feed @ ₹800 from Banas Dairy Co-op (HSN `2309`, CGST 2.5%, SGST 2.5%).
2. *Local Sales #hl-orange[5% GST]:* Sold 20 bags Cattle Feed @ ₹1,100 to Palanpur Dairy Farm (Inv \#SAL-010).
3. *Interstate Purchase 12% GST:* Procured 10 units Computer Printers @ ₹14,000 from Pune Hardware Ltd (Maharashtra, HSN `8443`, IGST 12%).
4. *Interstate Sales 12% GST:* Sold 4 units Computer Printers @ ₹19,500 to Mount Abu Resort (Rajasthan, IGST 12%).
5. *Local Purchase 28% GST:* Procured 2 units Daikin 1.5 Ton Split AC @ ₹38,000 from Ahmedabad Distributors (HSN `8415`, CGST 14%, SGST 14%).
6. *Capital Goods Invoicing:* Capitalized Daikin ACs under *Office Equipment (Fixed Assets)* with 100% ITC eligibility.
7. *Export Sales (LUT / Zero Rated):* Exported 500 handloom shawls @ \$30 to London Fashion LLC under Letter of Undertaking (LUT) with 0% IGST.
8. *Purchase from Unregistered Dealer (URD):* Purchased office broom and mop sets ₹1,200 from local street vendor (Exempt from RCM under Section 9(4)).
9. *Debit Note for Rate Difference:* Supplier overcharged ₹500 per printer; issued Debit Note (Alt+F5) for ₹2,000 + 12% IGST.
10. *Credit Note for Damage Allowance:* Granted ₹3,000 damage discount to Mount Abu Resort via Credit Note (Alt+F6) with 12% IGST reversal.

#v(6pt)

== 9.6 Summary & Key Revision Takeaways
- *Statutory #ul-orange[Rule 46] Compliance:* A valid GST invoice requires supplier/buyer GSTINs, sequential invoice number, HSN/SAC codes, and explicit CGST/SGST/IGST tax splits.
- *Mode Selection:* Use *Item Invoice* for trading stock and *Accounting Invoice* for professional consulting and services.
- *Tax Analysis Audit:* Always press #key-pill("Ctrl + O") > *Tax Analysis* before saving any invoice to guarantee that Tally has calculated taxes accurately without rounding errors.

#v(6pt)

== 9.7 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [Under which CGST Rule are the mandatory particulars of a Tax Invoice specified?\\
  (A) Rule 12 (B) Rule 36 (C) #ul-orange[Rule 46] (D) Rule 89], [*Correct: (C) #ul-orange[Rule 46]*\\
  #ul-orange[Rule 46] defines the 16 statutory elements required on every legal tax invoice.],
  [02], [What is the maximum character limit for an invoice serial number under GST?\\
  (A) 10 Characters (B) 12 Characters (C) 16 Characters (D) 20 Characters], [*Correct: (C) 16 Characters*\\
  GST law restricts invoice numbers to 16 alphanumeric characters unique per FY.],
  [03], [When goods are sold from Gujarat to Maharashtra, which tax is charged?\\
  (A) CGST + SGST (B) IGST only (C) UTGST (D) Custom Duty], [*Correct: (B) IGST only*\\
  Interstate supplies between two different states attract Integrated GST.],
  [04], [Which shortcut opens the Tax Analysis screen during invoice entry in Tally Prime?\\
  (A) Alt+T (B) Ctrl+O > Tax Analysis (Alt+A) (C) Alt+Z (D) Ctrl+T], [*Correct: (B) Ctrl+O > Tax Analysis (Alt+A)*\\
  Opens the tax calculation engine showing HSN breakdown and tax verification.],
  [05], [What is the classification code used for services under GST?\\
  (A) HSN (B) SAC (C) PIN (D) MICR], [*Correct: (B) SAC (Services Accounting Code)*\\
  SAC codes (e.g., 998314 for IT consulting) identify service transactions.],
  [06], [What document is issued by a registered person making exempt supplies?\\
  (A) Tax Invoice (B) Bill of Supply (C) Delivery Challan (D) Debit Note], [*Correct: (B) Bill of Supply*\\
  Under Section 31(3)(c), exempt supplies require a Bill of Supply, not a Tax Invoice.],
  [07], [What happens if a supplier fails to upload an invoice to the GST Portal?\\
  (A) Buyer loses #hl-green[Input Tax Credit (ITC)] (B) Supplier is jailed immediately\\
  (C) Invoice becomes exempt (D) Bank account frozen], [*Correct: (A) Buyer loses #hl-green[Input Tax Credit (ITC)]*\\
  Under #ul-orange[Section 16(2)(aa)], ITC is strictly allowed only if invoice appears in #ul-green[GSTR-2B].],
  [08], [Which key toggles between Party Details and Item Details in Tally Prime?\\
  (A) Spacebar (B) Enter (C) Tab (D) Esc], [*Correct: (B) Enter*\\
  Pressing Enter navigates sequentially through all active fields in the invoice.],
  [09], [Where can an accountant configure default print settings for invoices (e.g., 3 copies)?\\
  (A) Alt+P > Configuration (F12) (B) Alt+K (C) F11 (D) Alt+Y], [*Correct: (A) Alt+P > Configuration (F12)*\\
  Alt+P > Configuration allows setting Original, Duplicate, and Triplicate copies.],
  [10], [Can trade discount be deducted directly on the face of a GST Tax Invoice?\\
  (A) No, strictly prohibited (B) Yes, deducted before calculating GST\\
  (C) Only after year-end (D) Only with CA certificate], [*Correct: (B) Yes, deducted before calculating GST*\\
  Under Section 15(3), trade discounts shown on the invoice reduce the taxable value.]
)

#v(6pt)

== 9.8 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* What is the statutory difference between a *Tax Invoice* and a *Bill of Supply*?\\
  *Model Answer:* A *Tax Invoice* is issued by a regular registered dealer for taxable supplies where GST is charged explicitly, allowing the recipient to claim #hl-green[Input Tax Credit (ITC)]. A *Bill of Supply* is issued for exempt supplies or by Composition scheme dealers where no tax is charged, and no ITC can be claimed.
- *Viva Q2:* Why must an accountant verify the *Tax Analysis* screen before saving an invoice?\\
  *Model Answer:* Verifying the Tax Analysis screen (#key-pill("Ctrl + O") > *Tax Analysis*) ensures that Tally has successfully recognized the HSN/SAC codes, applied the correct tax percentage (e.g., 18% vs 12%), and split the tax correctly between CGST/SGST or IGST without leaving tax fields zero due to ledger configuration errors.
- *Viva Q3:* Explain the statutory mandate of *#ul-orange[Section 16(2)(aa)]* of the CGST Act regarding input tax credit.\\
  *Model Answer:* #ul-orange[Section 16(2)(aa)] mandates that a buyer can claim #hl-green[Input Tax Credit (ITC)] on an invoice only if the supplier has filed their #ul-green[GSTR-1] and the invoice is reflected in the buyer's auto-generated #ul-green[GSTR-2B] statement. If missing from #ul-green[GSTR-2B], no ITC is permitted.
- *Hands-On Lab Task:* In Tally Prime, create Party Ledger *Avni Private Limited* (Sundry Creditors, Gujarat, GSTIN: `24AABCA5544P1Z3`), create Stock Items *Samsung LED Monitor* (HSN `847160`, #hl-orange[18% GST]), and record Invoice 02 in Purchase Voucher (F9). Verify the Tax Analysis screen and save.

#pagebreak()

= Topic 10: 45+ Master Keyboard Shortcuts & Speed Drills

== 10.1 The Philosophy of Speed in Professional Tally Accounting
In high-volume corporate accounts offices, speed and accuracy are the ultimate determinants of professional competence. A professional corporate accountant operates Tally Prime *almost exclusively through the keyboard*, without relying on the mouse. 

Tally Prime's interface is engineered with mnemonic keyboard accelerators. Every menu option features a bold hotkey, and universal key combinations allow instantaneous navigation across ledgers, vouchers, and statutory reports.

#v(6pt)

== 10.2 Categorized Master Keyboard Shortcuts Registry (50 Core Shortcuts)

=== Category 1: Universal Navigation & Top Menu Shortcuts
#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Key Combination]], [#text(weight: "bold", fill: white)[Universal Command]], [#text(weight: "bold", fill: white)[Operational Purpose & Business Application]],
  [#key-pill("Esc")], [Back / Exit], [Cancels current action, closes opened window, or steps back one level in menu hierarchy.],
  [#key-pill("Enter")], [Select / Accept], [Opens selected menu item, enters drill-down report, or accepts input field.],
  [#key-pill("Alt + G")], [Go To (Search)], [Opens universal search bar to jump to any report or create master from anywhere!],
  [#key-pill("Ctrl + G")], [Switch To], [Switches current view to another report while preserving context of current task.],
  [#key-pill("Alt + K")], [Company Menu], [Accesses company creation, alteration, security, change, and shut functions.],
  [#key-pill("Alt + Y")], [Data Menu], [Accesses company data path, backup, restore, verify data, and split data.],
  [#key-pill("Alt + Z")], [Exchange Menu], [Accesses synchronization, WhatsApp sharing, and data exchange tools.],
  [#key-pill("Alt + O")], [Import Menu], [Imports masters, vouchers, and bank statements (XML, Excel) into Tally.],
  [#key-pill("Alt + E")], [Export Menu], [Exports any screen or report to PDF, Excel (XLSX), XML, CSV, or HTML.],
  [#key-pill("Alt + M")], [E-mail Menu], [Directly emails invoices, reminders, and financial statements via SMTP/MAPI.],
  [#key-pill("Alt + P")], [Print Menu], [Opens printing dialog to print tax invoices, cheques, vouchers, and reports.]
)

#v(6pt)

=== Category 2: Master Creation & Alteration Shortcuts
#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Key Combination]], [#text(weight: "bold", fill: white)[Command Name]], [#text(weight: "bold", fill: white)[Operational Purpose & Business Application]],
  [#key-pill("Alt + C")], [Create Secondary Master], [Creates a new ledger, stock item, or group on the fly inside voucher entry fields!],
  [#key-pill("Ctrl + Enter")], [Alter Master on the Fly], [Opens alteration screen of selected ledger or stock item directly from voucher entry!],
  [#key-pill("Alt + D")], [Delete Record], [Deletes a voucher, ledger, stock item, group, or company (when in alter mode).],
  [#key-pill("Ctrl + A")], [Quick Accept / Save], [Immediately saves any voucher, master, or screen without pressing Enter through all fields.],
  [#key-pill("Ctrl + C")], [Copy Text], [Copies highlighted text or field data to clipboard.],
  [#key-pill("Ctrl + V")], [Paste Text], [Pastes copied text into Tally Prime input fields.]
)

#v(6pt)

=== Category 3: Voucher Entry & Invoicing Shortcuts
#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Key Combination]], [#text(weight: "bold", fill: white)[Command Name]], [#text(weight: "bold", fill: white)[Operational Purpose & Business Application]],
  [#key-pill("F2")], [Change Date], [Changes current voucher or report transaction date.],
  [#key-pill("Alt + F2")], [Change Period], [Sets date range (From Date to To Date) for Day Book, P&L, and Balance Sheet.],
  [#key-pill("F3")], [Change / Select Company], [Switches between multiple loaded companies or selects a company.],
  [#key-pill("F4")], [Contra Voucher], [Records internal cash/bank fund transfers.],
  [#key-pill("F5")], [Payment Voucher], [Records outward cash/bank payments to suppliers and expense heads.],
  [#key-pill("F6")], [Receipt Voucher], [Records inward cash/bank receipts from customers and income heads.],
  [#key-pill("F7")], [Journal Voucher], [Records non-cash adjustment entries, provisions, and depreciation.],
  [#key-pill("F8")], [Sales Voucher], [Records credit and cash sales invoices with GST tax calculations.],
  [#key-pill("F9")], [Purchase Voucher], [Records inward supplier procurement invoices with Input Tax Credit.],
  [#key-pill("F10")], [Other Vouchers], [Opens master list of all 24 vouchers (Order, Inventory, Memo).],
  [#key-pill("Ctrl + H")], [Change Voucher Mode], [Toggles between Item Invoice, Accounting Invoice, and As Voucher modes.],
  [#key-pill("Alt + F5")], [Debit Note], [Records purchase returns to suppliers or vendor rate debit adjustments.],
  [#key-pill("Alt + F6")], [Credit Note], [Records sales returns from customers or post-sale discount credits.],
  [#key-pill("Alt + F7")], [Stock Journal], [Records inter-godown inventory transfers and manufacturing BOM consumption.],
  [#key-pill("Ctrl + F7")], [Physical Stock], [Records physical stock audit counts to adjust ledger balances.],
  [#key-pill("Ctrl + F8")], [Sales Order], [Records customer purchase commitments prior to invoice dispatch.],
  [#key-pill("Ctrl + F9")], [Purchase Order], [Issues formal procurement orders to approved vendors.],
  [#key-pill("Alt + F8")], [Delivery Note], [Generates delivery challan accompanying physical dispatch of goods.],
  [#key-pill("Alt + F9")], [Receipt Note], [Records Goods Received Note (GRN) upon warehouse arrival.],
  [#key-pill("Ctrl + O")], [Related Reports], [Accesses Tax Analysis, Stock Details, and Bill-wise details in voucher.]
)

#v(6pt)

=== Category 4: Report Generation & Analysis Shortcuts
#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Key Combination]], [#text(weight: "bold", fill: white)[Command Name]], [#text(weight: "bold", fill: white)[Operational Purpose & Business Application]],
  [#key-pill("Alt + F1") / [#key-pill("Alt + F5")]], [Detailed / Condensed], [Expands report to show all sub-ledgers and transactions (Detailed) or collapses.],
  [#key-pill("F12")], [Configuration], [Opens contextual settings for current report, voucher layout, and print options.],
  [#key-pill("Alt + F12")], [Range / Filter], [Applies multi-criteria conditional filters to isolate specific transactions.],
  [#key-pill("Ctrl + F12")], [Value Filter], [Applies numerical filters (e.g., vouchers exceeding ₹50,000) for statutory audit.],
  [#key-pill("Spacebar")], [Select / Unselect Line], [Highlights a specific row in Day Book or report for bulk actions.],
  [#key-pill("Ctrl + Spacebar")], [Select All Lines], [Selects all rows on the screen simultaneously for bulk deletion or export.],
  [#key-pill("Alt + R")], [Remove Line], [Temporarily hides selected line from report without deleting from database.],
  [#key-pill("Alt + U")], [Restore Line], [Restores the most recently removed line back into view.],
  [#key-pill("Alt + W")], [Restore All Lines], [Restores all temporarily removed lines back into the report.],
  [#key-pill("Ctrl + N")], [Calculator Panel], [Opens/closes built-in mathematical calculator at the bottom of Tally Prime.]
)

#v(6pt)

== 10.3 25-Scenario Corporate Speed Challenge Drill
Test your keyboard mastery by identifying the fastest single key combination to execute each corporate task:
1. *Jump from Day Book to Balance Sheet without closing Day Book:* Press #key-pill("Alt + G"), type "Bal", press #key-pill("Enter").
2. *Create a new customer ledger while typing in Sales Voucher:* Press #key-pill("Alt + C") at the Party Name field.
3. *Correct spelling of an existing vendor name while in Purchase Voucher:* Highlight vendor and press #key-pill("Ctrl + Enter").
4. *Save an invoice immediately after entering total without stepping through 10 fields:* Press #key-pill("Ctrl + A").
5. *Check whether GST on an invoice is CGST+SGST or IGST before saving:* Press #key-pill("Ctrl + O") > Tax Analysis.
6. *Toggle an invoice from Item mode to Service mode:* Press #key-pill("Ctrl + H") > Accounting Invoice.
7. *View full 12-month transaction history in Day Book:* Press #key-pill("Alt + F2") and enter `01-Apr-2025` to `31-Mar-2026`.
8. *Expand all ledger heads in Balance Sheet:* Press #key-pill("Alt + F1") or #key-pill("Alt + F5").
9. *Permanently delete an erroneously duplicated voucher:* Open voucher, press #key-pill("Alt + D"), press #key-pill("Enter").
10. *Calculate [₹84,500 × 18%] during data entry:* Press #key-pill("Ctrl + N") to activate calculator.

#v(6pt)


== 10.4 Senior Accountant Secret Power Shortcuts
Beyond basic navigation, senior accounting professionals leverage advanced keyboard combinations:
- #key-pill("Ctrl + Alt + B") *(Basis of Values):* Alters reporting parameters on the fly (e.g., viewing P&L on cash basis vs accrual basis, or toggling stock valuation from FIFO to Average Cost).
- #key-pill("Ctrl + Alt + H") *(Change View):* Switches report layouts instantly (e.g., viewing monthly ledger summary, daily movement, or quarterly column views).
- #key-pill("Ctrl + J") *(Exception Reports):* Highlights anomalies such as negative stock balances, overdue customer bills, unallocated vouchers, and mismatched GSTINs.
- #key-pill("Alt + V") *(Master View):* Quickly verifies underlying ledger attributes without leaving statutory report screens.

#v(6pt)


== 10.5 Senior Audit & Verification Keyboard Shortcuts
During statutory CA audits, senior accountants rely on specialized audit shortcuts:
- #key-pill("Alt + J") *(Statutory Audit Analysis):* Toggles audit status of vouchers (On Hold, Clarified, Verified).
- #key-pill("Alt + 2") *(Duplicate Voucher):* Instantly creates an exact duplicate of the highlighted voucher for rapid recurring monthly entries!
- #key-pill("Alt + A") *(Add Voucher):* Inserts a new voucher into the Day Book at the exact chronological date position.
- #key-pill("Alt + I") *(Insert Voucher):* Inserts a voucher between two existing voucher numbers.
- #key-pill("Ctrl + Alt + R") *(Rewrite Data):* Initiates database rewrite to repair corrupted indexes.

#v(6pt)


== 10.6 The Master 30-Second Speed Run for Corporate Accounts Executives
Senior corporate accountants complete routine workflows in seconds by combining sequential shortcuts:
1. *5-Second #ul-green[Trial Balance] Audit:* Press #key-pill("Alt + G") > type "Trial" > press #key-pill("Enter") > press #key-pill("Alt + F1") to expand all groups.
2. *10-Second Customer Outstanding Statement:* Press #key-pill("Alt + G") > type "Ledger Out" > select customer > press #key-pill("Alt + P") > press #key-pill("I") for instant print preview.
3. *8-Second Duplicate Invoice Recording:* Open recurring monthly invoice in Day Book > press #key-pill("Alt + 2") > press #key-pill("F2") to change date > press #key-pill("Ctrl + A") to save!
4. *7-Second Cash Flow Analysis:* Press #key-pill("Alt + G") > type "Cash Flow" > press #key-pill("Alt + F2") for date range > press #key-pill("Ctrl + H") for quarterly summary.

#v(6pt)

== 10.6 Summary & Key Revision Takeaways
- *Keyboard Superiority:* Skilled accountants work 3x to 5x faster by eliminating mouse dependency.
- *Universal Accelerators:* Memorize #key-pill("Alt + C") (Create Master), #key-pill("Ctrl + Enter") (Alter Master), #key-pill("Ctrl + A") (Quick Save), and #key-pill("Alt + G") (Go To).
- *Mode Toggles:* Use #key-pill("Ctrl + H") to switch invoice modes, and #key-pill("Alt + F1") to expand reports into detailed auditing view.

#v(6pt)

== 10.7 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [Which key combination creates a new ledger directly from inside a voucher?\\
  (A) Ctrl+C (B) Alt+C (C) Shift+C (D) F12], [*Correct: (B) Alt+C*\\
  Alt+C creates secondary masters on the fly without exiting voucher entry.],
  [02], [Which shortcut alters an existing ledger directly from inside a voucher?\\
  (A) Alt+Enter (B) Ctrl+Enter (C) Shift+Enter (D) F2], [*Correct: (B) Ctrl+Enter*\\
  Ctrl+Enter opens the master alteration screen for the highlighted ledger.],
  [03], [What is the universal quick-save shortcut in Tally Prime?\\
  (A) Ctrl+S (B) Alt+S (C) Ctrl+A (D) Alt+A], [*Correct: (C) Ctrl+A*\\
  Ctrl+A accepts and saves any screen immediately across all modules.],
  [04], [Which shortcut opens the universal Go To search window in Tally Prime?\\
  (A) Ctrl+G (B) Alt+G (C) Alt+S (D) F1], [*Correct: (B) Alt+G*\\
  Alt+G allows multi-tasking and searching any report from anywhere.],
  [05], [How can an accountant change the financial period for a report?\\
  (A) F2 (B) Alt+F2 (C) Ctrl+F2 (D) Shift+F2], [*Correct: (B) Alt+F2*\\
  F2 changes a single date; Alt+F2 changes the entire period (From - To).],
  [06], [Which key combination opens the built-in calculator in Tally Prime?\\
  (A) Ctrl+C (B) Alt+C (C) Ctrl+N (D) Alt+N], [*Correct: (C) Ctrl+N*\\
  Ctrl+N opens the calculator bottom panel for mathematical computations.],
  [07], [Which shortcut toggles between Detailed and Condensed view in reports?\\
  (A) Alt+F1 (or Alt+F5) (B) Ctrl+F1 (C) F5 (D) Alt+D], [*Correct: (A) Alt+F1 (or Alt+F5)*\\
  Expands top-level groups to reveal all nested sub-ledgers and transactions.],
  [08], [Which key selects or unselects a single transaction line in Day Book?\\
  (A) Enter (B) Spacebar (C) Tab (D) Esc], [*Correct: (B) Spacebar*\\
  Spacebar highlights lines for bulk actions (removal, deletion, export).],
  [09], [What shortcut opens the contextual configuration settings of any screen?\\
  (A) F11 (B) F12 (C) Alt+F12 (D) Ctrl+F12], [*Correct: (B) F12 (Configuration)*\\
  F12 provides screen-specific display, calculation, and printing settings.],
  [10], [How can an accountant permanently delete a voucher in Tally Prime?\\
  (A) Press Delete (B) Open voucher and press Alt+D\\
  (C) Press Ctrl+D (D) Right-click and delete], [*Correct: (B) Open voucher and press Alt+D*\\
  Alt+D is the universal deletion command across masters, vouchers, and companies.]
)

#v(6pt)

== 10.8 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* What is the difference between #key-pill("Alt + C") and #key-pill("Ctrl + Enter") in voucher entry?\\
  *Model Answer:* #key-pill("Alt + C") creates a *brand new ledger or stock item* on the fly when the required account does not exist. #key-pill("Ctrl + Enter") opens the *alteration screen of an already existing ledger or item* to correct errors (such as updating GSTIN, spelling, or address) without navigating away.
- *Viva Q2:* Explain how the #key-pill("Alt + G") (Go To) feature improves accounting productivity.\\
  *Model Answer:* Go To eliminates the need to exit or abandon an in-progress transaction. For example, if an accountant is halfway through recording a purchase invoice and needs to check the current bank balance or stock availability, they press Alt+G, view the report, and press Esc to immediately resume the voucher with all entered data intact.
- *Viva Q3:* What is the function of #key-pill("Alt + R") and #key-pill("Alt + U") in report analysis?\\
  *Model Answer:* #key-pill("Alt + R") temporarily removes/hides a specific transaction line from a report without deleting it from the database. #key-pill("Alt + U") unhides/restores the removed line. This allows accountants to audit reports cleanly by filtering out noise.
- *Hands-On Lab Task:* Open Tally Prime, go to *Day Book*, press #key-pill("Alt + F2") to set period to full year, press #key-pill("Alt + F1") to view detailed entries, select 3 lines using #key-pill("Spacebar"), press #key-pill("Ctrl + N") to calculate the sum in the calculator, and press #key-pill("Esc") to close.

#pagebreak()

= Topic 11: Corporate Bridge Highlights (BRS, Cost Centres, Data Splitting & GST)

== 11.1 Bank Reconciliation Statement (BRS) Architecture
In corporate bookkeeping, a *#hl-green[Bank Reconciliation Statement (BRS)]* is an indispensable internal audit instrument that explains and harmonizes the discrepancy between the cash book bank balance (maintained by the company's accountant in Tally Prime) and the passbook bank balance (maintained by the commercial bank).

Discrepancies arise primarily due to *timing differences* and *unrecorded bank entries*:
1. *Cheques Issued but Not Yet Presented for Payment:* The accountant credits the bank ledger immediately upon writing the cheque, but the vendor presents it 4 days later.
2. *Cheques Deposited but Not Yet Cleared:* Cheques received from customers and debited in Tally are still undergoing clearing house processing.
3. *Direct Bank Charges / Interest Credited:* Bank debits account maintenance charges or credits fixed deposit interest directly into the account without prior intimation.
4. *Direct Customer NEFT / RTGS Remittances:* Clients deposit funds directly into company bank accounts without sending immediate payment advice.

#v(6pt)

=== Authentic Indian CTS-2010 Bank Cheque Format
Below is the authentic representation of an Indian CTS-2010 corporate cheque rendered for Shri Arvindbhai:

#cheque-format(
  payee: "Shri Arvindbhai Patel (Landlord)",
  amount-words: "Rupees Fifteen Thousand Only",
  amount-num: "15,000.00",
  date-str: "1 5 0 5 2 0 2 5",
  bank-name: "HDFC BANK LIMITED",
  branch: "Palanpur Main Branch, Gujarat · IFSC: HDFC0001824",
  ac-no: "50200048192841",
  chq-no: "450121",
  company-name: "RAVI PRIVATE LIMITED"
)

#v(6pt)

=== Authentic Commercial Bank Statement Format
Below is the monthly bank statement showing cleared transactions and timing discrepancies:

#bank-statement-format(
  account-holder: "RAVI PRIVATE LIMITED",
  bank-name: "HDFC BANK LIMITED",
  account-no: "50200048192841",
  period: "01-May-2025 to 31-May-2025",
  rows: (
    [01-May-2025], [Opening Balance], [-], [-], [-], [2,50,000.00],
    [02-May-2025], [Cash Deposit (Contra F4)], [450101], [-], [50,000.00], [3,00,000.00],
    [10-May-2025], [RTGS Inward - Ravi Enterprises], [RTGS9921], [-], [85,000.00], [3,85,000.00],
    [16-May-2025], [Cheque Clearing - Arvindbhai (Rent)], [450121], [15,000.00], [-], [3,70,000.00],
    [20-May-2025], [NEFT Outward - Avni Pvt Ltd], [NEFT4412], [70,800.00], [-], [2,99,200.00],
    [28-May-2025], [Quarterly Bank Service Charges], [DEB0091], [850.00], [-], [2,98,350.00],
    [31-May-2025], [Auto Interest Credit on Sweep FD], [CR44102], [-], [3,600.00], [3,01,950.00]
  )
)

#v(6pt)

== 11.2 Step-by-Step BRS Reconciliation Workflow in Tally Prime
1. *Navigate to Banking:* Go to *Gateway of Tally > Banking > Bank Reconciliation*.
2. *Select Bank Ledger:* Choose *HDFC Bank Current A/c*. Tally Prime displays all recorded transactions alongside a blank column titled *Bank Date*.
3. *Manual BRS:* Inspect the physical bank statement. As each cheque or transfer is verified, enter the exact date on which the bank debited/credited the amount in the *Bank Date* column.
4. *Automated BRS (Auto-BRS):* Press #key-pill("Alt + O") > *Import > Bank Statement*. Select the Excel or CSV file downloaded from HDFC NetBanking. Tally automatically matches cheque numbers and amounts, clearing 95% of transactions in seconds!
5. *Inspect Reconciliation Summary:* At the bottom of the screen, Tally displays:
   - *Balance as per Company Books*
   - *Amounts not reflected in Bank*
   - *Balance as per Bank* (must match your actual bank statement closing balance down to the exact paisa!).

#v(6pt)

== 11.3 Multi-Branch Cost Centres & Cost Categories
*Cost Centres* allow corporate enterprises to allocate incomes and expenses across departments, branches, projects, or executives without cluttering the Chart of Accounts with duplicate ledgers.
- *Activation:* Press #key-pill("F11") (Features) > set *Enable Cost Centres* to *Yes*.
- *Cost Categories:* Define primary business dimensions (e.g., *Branches* and *Projects*).
- *Cost Centres:* Define operational sub-units:
  - Under Category *Branches:* `Palanpur Main Branch`, `Deesa Branch`, `Ahmedabad Hub`.
  - Under Category *Marketing Campaigns:* `Digital Social Media`, `Outdoor Hoardings`.
- *Operational Voucher Entry Example:*
  When paying ₹20,000 office stationery in Payment (F5), Tally Prime automatically opens the Cost Allocation sub-window. The accountant allocates:
  - Palanpur Main Branch: ₹12,000
  - Deesa Branch: ₹8,000
  Both branches now reflect their individual cost consumption in the *Cost Centre Breakup Report*!

#v(6pt)

== 11.4 Year-End Company Data Splitting (Alt+Y > Split)
As a business accumulates hundreds of thousands of transactions over multiple years, database files grow large, slowing down report generation. Furthermore, statutory auditors require isolated databases for completed financial years.

#block(
  fill: rgb("#EFF6FF"),
  stroke: 1pt + rgb("#BFDBFE"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "bold", size: 8.5pt, fill: rgb("#1E40AF"))[THE 4-STEP YEAR-END DATA SPLITTING PROTOCOL:]\\
    1. *Verify Company Data Integrity:* Press #key-pill("Alt + Y") > *Split > Verify Data*. Tally checks for unadjusted forex gains, negative stock balances, or orphaned bill-wise references.\\
    2. *Create Mandatory Full Backup:* Press #key-pill("Alt + Y") > *Backup* and save to an external drive.\\
    3. *Execute Split:* Navigate to #key-pill("Alt + Y") > *Split > Split Data*. Select company and specify Split Date as `01-Apr-2025`.\\
    4. *System Outcome:* Tally creates two clean independent companies:
       - Past Company: `Ravi Private Limited (from 01-Apr-2024 to 31-Mar-2025)`
       - New Company: `Ravi Private Limited (from 01-Apr-2025)` with automated opening balances!
  ]
)

#v(6pt)

== 11.5 Statutory GST Portal Returns Reconciliation
Professional accountants must master the tripartite GST portal reconciliation framework:

#table(
  columns: (1fr, 1.2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[GST Return]], [#text(weight: "bold", fill: white)[Filing Frequency]], [#text(weight: "bold", fill: white)[Corporate Purpose & Matching Rule]],
  [GSTR-1], [Monthly / QRMP (11th of month)], [Statement of Outward Supplies. Contains all B2B sales invoices, interstate B2C sales exceeding ₹2.5 Lakhs, exports, debit/credit notes, and HSN summary. Directly populates buyers' #ul-green[GSTR-2B]!],
  [GSTR-3B], [Monthly (20th of month)], [Self-assessed monthly summary return. Declares total taxable sales, outward tax liability, eligible #hl-green[Input Tax Credit (ITC)], and executes net tax payment via Electronic Cash Ledger challan PMT-06.],
  [GSTR-2B], [Static auto-drafted (14th of month)], [Auto-generated read-only ITC statement generated by the GST Portal based on suppliers' filed #ul-green[GSTR-1] returns. Under #ul-orange[Section 16(2)(aa)], 100% of claimed ITC must match GSTR-2B!]
)

#v(6pt)


== 11.6 Comprehensive GST Annual Return (GSTR-9) & Reconciliation (GSTR-9C)
At the end of each financial year, regular registered corporate taxpayers must perform annual statutory reconciliation:
1. *#ul-green[GSTR-9] (Annual Return):* Aggregates outward supplies, inward procurement, taxes paid, and ITC claimed across all 12 monthly #ul-green[GSTR-3B] and #ul-green[GSTR-1] returns filed during the financial year.
2. *#ul-green[GSTR-9]C (Reconciliation Statement):* A statutory reconciliation between the audited commercial financial statements (Balance Sheet & P&L certified by a Chartered Accountant) and the GST Portal returns.
3. *Section 16(4) Statutory Deadline:* ITC pertaining to any invoice of a financial year must be claimed on or before 30th November following the end of the financial year. Any unclaimed ITC lapses permanently after this cutoff date!

#v(6pt)


== 11.7 Corporate GST Audit & Litigation Defense Protocol
In modern corporate practice, tax authorities issue automated electronic notices (Form ASMT-10) for discrepancies between returns:
1. *#ul-green[GSTR-3B] vs #ul-green[GSTR-1] Discrepancy:* Outward tax declared in 3B is less than sales reported in #ul-green[GSTR-1]. Reconcile monthly using Tally Prime's *GST Return Analysis*.
2. *#ul-green[GSTR-3B] vs #ul-green[GSTR-2B] Discrepancy:* ITC claimed in 3B exceeds eligible ITC reflected in #ul-green[GSTR-2B]. Under #ul-orange[Section 16(2)(aa)], excess ITC must be reversed in Table 4(B)(2) with 18% penal interest under Section 50.
3. *DRC-03 Voluntary Settlement:* Any tax shortfall or interest liability is voluntarily settled on the GST Portal using Form DRC-03 and recorded in Tally Prime via Payment Voucher (F5) with GST Payment type *Voluntary*.

#v(6pt)


== 11.8 The Complete Year-End Statutory Financial Audit Checklist
Before closing corporate financial books on 31st March, corporate accountants must execute this rigorous 12-point audit checklist:
1. *Bank Reconciliation (BRS):* Reconcile 100% of commercial bank accounts down to the last paisa. Investigate unpresented cheques older than 3 months (stale cheques).
2. *Physical Stock Verification:* Conduct warehouse physical count; record discrepancies using *Physical Stock Voucher* (Ctrl+F7).
3. *Depreciation Calculation:* Charge statutory depreciation on all fixed assets according to Companies Act Schedule II or Income Tax Act rules via Journal (F7).
4. *Prepaid & Accrued Expenses:* Reclassify unexpired insurance premiums into *Prepaid Expenses* (Current Assets) and unpaid salaries into *Provisions*.
5. *Debtor & Creditor Ledger Confirmations:* Dispatch balance confirmation statements to major suppliers and customers; reconcile differences.
6. *Bad Debts Write-Off:* Identify irrecoverable debts and write off to *Bad Debts A/c* via Journal Voucher.
7. *GST Portal Reconciliation:* Reconcile outward turnover in #ul-green[GSTR-1] against #ul-green[GSTR-3B] and books. Verify that 100% of claimed ITC is reflected in #ul-green[GSTR-2B].
8. *TDS Reconciliation:* Match TDS deducted against Form 26AS / AIS on the Income Tax portal.
9. *Foreign Exchange Revaluation:* Revalue unhedged foreign currency debtors/creditors at closing exchange rates as per AS-11.
10. *Closing Stock Valuation:* Value closing stock at *Cost or Net Realizable Value (NRV), whichever is lower*.
11. *Verify Data Integrity:* Run #key-pill("Alt + Y") > *Split > Verify Data* to ensure zero unadjusted database pointers.
12. *Lock Back-Dated Vouchers:* Set security lock date to 31-Mar-2025 to freeze audited books against tampering!

#v(6pt)

== 11.8 Summary & Key Revision Takeaways
- *BRS Equilibrium:* Bank reconciliation resolves timing differences between company books and bank records. Always reconcile monthly.
- *Cost Centres for Management Accounting:* Cost centres enable granular departmental cost analysis without creating hundreds of redundant ledgers.
- *Data Splitting Safety:* Always run *Verify Data* and execute a complete *Backup* before splitting multi-year databases.
- *#ul-orange[Section 16(2)(aa)] Statutory Rigour:* Match purchase invoices against #ul-green[GSTR-2B] every month to avoid ITC reversal notices with 18% penal interest.

#v(6pt)

== 11.9 High-Yield Exam & Corporate Interview MCQs

#table(
  columns: (0.4fr, 2.5fr, 1.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Q\#]], [#text(weight: "bold", fill: white)[Question & Multiple Choice Options]], [#text(weight: "bold", fill: white)[Answer Key & Detailed Explanation]],
  [01], [What causes the difference between the Cash Book bank balance and Passbook balance?\\
  (A) Arithmetical mistakes only (B) Timing differences and unrecorded bank charges\\
  (C) Inflation (D) Changes in tax laws], [*Correct: (B) Timing differences and unrecorded bank charges*\\
  Cheques in transit, clearing delays, and direct bank charges cause discrepancies.],
  [02], [Which shortcut accesses the Data menu to execute Company Data Splitting?\\
  (A) Alt+K (B) Alt+Y (C) Alt+Z (D) Ctrl+Y], [*Correct: (B) Alt+Y (Data Menu)*\\
  Alt+Y provides access to Backup, Restore, Split Data, and Data Path options.],
  [03], [Which GST return contains the auto-drafted static #hl-green[Input Tax Credit (ITC)] statement?\\
  (A) #ul-green[GSTR-1] (B) #ul-green[GSTR-3B] (C) #ul-green[GSTR-2B] (D) #ul-green[GSTR-9]], [*Correct: (C) #ul-green[GSTR-2B]*\\
  #ul-green[GSTR-2B] is generated on the 14th of every month reflecting eligible ITC.],
  [04], [Which statutory section mandates that ITC is allowed only if reflected in #ul-green[GSTR-2B]?\\
  (A) Section 10 (B) #ul-orange[Section 16(2)(aa)] (C) Section 22 (D) Section 54], [*Correct: (B) #ul-orange[Section 16(2)(aa)]*\\
  Introduced to eliminate fake invoicing and restrict ITC to verified portal records.],
  [05], [How are departmental branch costs tracked in Tally without creating duplicate ledgers?\\
  (A) Multiple Companies (B) Cost Centres & Cost Categories\\
  (C) Journal Vouchers (D) #hl-green[Tally Vault]], [*Correct: (B) Cost Centres & Cost Categories*\\
  Enables multi-dimensional expense allocation to departments, branches, and projects.],
  [06], [What feature must be run immediately prior to splitting company data in Tally Prime?\\
  (A) Year-End Closing (B) Verify Data and Backup\\
  (C) Delete Obsolete Vouchers (D) Export to Excel], [*Correct: (B) Verify Data and Backup*\\
  Verifies database integrity and creates an essential backup before splitting.],
  [07], [When a cheque issued to a vendor is presented for clearing, what changes in Tally BRS?\\
  (A) Voucher is deleted (B) Bank Date is entered\\
  (C) CGST is reversed (D) Cheque number altered], [*Correct: (B) Bank Date is entered*\\
  Entering the clearing date reconciles the transaction with the bank statement.],
  [08], [What is the monthly filing deadline for #ul-green[GSTR-1] for regular taxpayers?\\
  (A) 7th of the month (B) 11th of the month (C) 20th of the month (D) Last day], [*Correct: (B) 11th of the month*\\
  #ul-green[GSTR-1] must be filed by the 11th of the subsequent month.],
  [09], [What is the standard monthly filing deadline for #ul-green[GSTR-3B]?\\
  (A) 11th of the month (B) 15th of the month (C) 20th of the month (D) 31st of the month], [*Correct: (C) 20th of the month*\\
  #ul-green[GSTR-3B] summary return and tax payment deadline is the 20th of the month.],
  [10], [Can a company's split database be merged back together automatically in Tally Prime?\\
  (A) Yes, with one click (B) No, splitting is a one-way database division\\
  (C) Only with CA password (D) Only in Gold version], [*Correct: (B) No, splitting is a one-way database division*\\
  Splitting creates two permanent separate databases. Merging requires manual import.]
)

#v(6pt)

== 11.10 Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Explain the corporate importance of conducting a monthly #hl-green[Bank Reconciliation Statement (BRS)].\\
  *Model Answer:* Monthly BRS ensures that no fraudulent transactions, unauthorized bank charges, or bounced cheques go undetected. It confirms that the company's liquid cash position reported on the Balance Sheet represents real, verified funds available in the bank account.
- *Viva Q2:* How does *Auto-BRS* in Tally Prime function when importing a bank statement file?\\
  *Model Answer:* Tally Prime parses the electronic bank statement (CSV/Excel/XML) and compares the instrument numbers (cheque numbers), transaction dates, and amounts against un-cleared bank vouchers in the company books. It automatically matches matching entries and populates the *Bank Date* column instantly.
- *Viva Q3:* What is the purpose of *Year-End Company Data Splitting*?\\
  *Model Answer:* Data Splitting divides a multi-year database into two clean companies at the start of a new financial year (e.g., 1st April). It carries forward closing balances as opening balances, reduces database size, accelerates reporting speeds, and isolates audited historical financial years from active current operations.
- *Hands-On Lab Task:* In Tally Prime, navigate to *Gateway of Tally > Banking > Bank Reconciliation*, select *HDFC Bank Current A/c*, inspect the list of un-cleared cheques, enter bank clearing dates matching the authentic bank statement in Section 11.1, and verify that *Balance as per Bank* reconciles perfectly.

#pagebreak()

= Corporate Capstone Project: End-to-End Enterprise Simulation

== C.1 Project Overview & Statutory Corporate Profile
This comprehensive Capstone Project simulates the complete commercial accounting, inventory management, statutory taxation, and financial auditing lifecycle of a multi-crore private limited company in Gujarat. Students and accounting trainees must execute this simulation directly in Tally Prime from company incorporation to the audited annual Balance Sheet.

#v(6pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1.2pt + rgb("#0E7490"),
  radius: 4pt,
  inset: 10pt,
  [
    #text(weight: "black", size: 9pt, fill: rgb("#0E7490"))[CORPORATE PROFILE: RAVI GLOBAL ENTERPRISES PRIVATE LIMITED]\\
    #v(3pt)
    - *Corporate Identity Number (CIN):* `U72900GJ2025PTC148921` · *Date of Incorporation:* 01-Apr-2025
    - *Registered Corporate Address:* Near Ambaji Mandir, Main Chowk, Palanpur, Banaskantha, Gujarat - 385001
    - *Statutory Tax Registrations:*
      - *GSTIN:* `24AABCR9876Q1Z2` (State Code: 24 - Gujarat, Taxpayer Type: Regular)
      - *Permanent Account Number (PAN):* `AABCR9876Q` · *Tax Deduction Account Number (TAN):* `AHMR01234F`
    - *Authorized Share Capital:* ₹25,00,000 (2,50,000 Equity Shares of ₹10 each)
    - *Paid-up Share Capital:* ₹10,00,000 (1,00,000 Equity Shares of ₹10 each introduced by promoters)
    - *Primary Bankers:* HDFC Bank Limited (Palanpur Branch, Current A/c No: `50200048192841`, IFSC: `HDFC0001824`)
    - *Business Domain:* Integrated multi-vertical enterprise operating computer hardware trading, high-tech IT consulting services, and commercial computer assembly manufacturing.
  ]
)

#v(6pt)

== C.2 Phase 1: Company Creation & System Configuration in Tally Prime
1. *Create Company:* Press #key-pill("Alt + K") > *Create*. Enter Company Name: `Ravi Global Enterprises Pvt Ltd`, State: `Gujarat` (Code 24), Pincode: `385001`, Financial Year Beginning: `01-Apr-2025`, Books Beginning: `01-Apr-2025`.
2. *Configure F11 Features:*
   - *Maintain Accounts:* `Yes` · *Enable Bill-wise Entry:* `Yes` · *Enable Cost Centres:* `Yes`.
   - *Maintain Inventory:* `Yes` · *Integrate Accounts with Inventory:* `Yes`.
   - *Enable Goods and Services Tax (GST):* `Yes` > Set State to `Gujarat`, enter GSTIN `24AABCR9876Q1Z2`.
   - *Enable Tax Deducted at Source (TDS):* `Yes` > Enter TAN `AHMR01234F`, Deductor Type: `Company`.
3. *Configure Security Control:* Set *Control User Access to Company Data* to `Yes`, define Administrator username as `Admin` and set a secure corporate password.

#v(6pt)

== C.3 Phase 2: Master Chart of Accounts (35 Foundational Ledgers)
Create the following 35 foundational ledgers in Tally Prime, ensuring exact group assignments and statutory settings:

#table(
  columns: (0.4fr, 1.8fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Ledger Account Name]], [#text(weight: "bold", fill: white)[Parent Group]], [#text(weight: "bold", fill: white)[Statutory / Bill-wise Setup]],
  [01], [Equity Share Capital A/c], [Capital Account], [No],
  [02], [General Reserve A/c], [Reserves & Surplus], [No],
  [03], [HDFC Bank Current A/c], [Bank Accounts], [Set Bank Details, IFSC HDFC0001824],
  [04], [ICICI Bank Operating A/c], [Bank Accounts], [Set Bank Details, IFSC ICIC0000412],
  [05], [Office Petty Cash A/c], [Cash-in-hand], [Opening: ₹25,000],
  [06], [Office Premises Building], [Fixed Assets], [Depreciation: 10% WDV],
  [07], [Computer Systems & Servers], [Fixed Assets], [Depreciation: 40% WDV],
  [08], [Office Furniture & Fixtures], [Fixed Assets], [Depreciation: 10% WDV],
  [09], [Avni Private Limited], [Sundry Creditors], [Gujarat · GSTIN: 24AABCA5544P1Z3 · Bill-by-Bill: Yes],
  [10], [Vishnu Technologies Pvt Ltd], [Sundry Creditors], [Karnataka · GSTIN: 29AABCV7788M1Z4 · Bill-by-Bill: Yes],
  [11], [Maheshwari Enterprises], [Sundry Debtors], [Gujarat · GSTIN: 24AABCM3344R1Z1 · Bill-by-Bill: Yes],
  [12], [Mumbai IT Infrastructure Hub], [Sundry Debtors], [Maharashtra · GSTIN: 27AAACM4455N1Z9 · Bill-by-Bill: Yes],
  [13], [Jaimin Corporation (Client)], [Sundry Debtors], [Gujarat · GSTIN: 24AABCJ6677K1Z0 · Bill-by-Bill: Yes],
  [14], [Shri Arvindbhai Patel (Landlord)], [Sundry Creditors], [PAN: ABCPA1234F · TDS Sec 194I applicable],
  [15], [Input CGST A/c], [Duties & Taxes], [GST > Central Tax],
  [16], [Input SGST A/c], [Duties & Taxes], [GST > State Tax],
  [17], [Input IGST A/c], [Duties & Taxes], [GST > Integrated Tax],
  [18], [Output CGST A/c], [Duties & Taxes], [GST > Central Tax],
  [19], [Output SGST A/c], [Duties & Taxes], [GST > State Tax],
  [20], [Output IGST A/c], [Duties & Taxes], [GST > Integrated Tax],
  [21], [TDS Payable Sec 194C], [Duties & Taxes], [TDS > 194C (Contractors)],
  [22], [TDS Payable Sec 194J], [Duties & Taxes], [TDS > 194J (Professional)],
  [23], [TDS Payable Sec 194I], [Duties & Taxes], [TDS > 194I (Rent)],
  [24], [Sales GST 18% A/c], [Sales Accounts], [GST Applicable · 18%],
  [25], [Sales Interstate IGST 18%], [Sales Accounts], [GST Applicable · 18%],
  [26], [Sales Exempt (#hl-orange[0% GST])], [Sales Accounts], [GST Applicable · 0%],
  [27], [Purchase GST 18% A/c], [Purchase Accounts], [GST Applicable · 18%],
  [28], [Purchase Interstate IGST 18%], [Purchase Accounts], [GST Applicable · 18%],
  [29], [IT Consulting Revenue A/c], [Direct Incomes], [SAC: 998314 · #hl-orange[18% GST]],
  [30], [Factory Labour Wages], [Direct Expenses], [Cost Centres: Factory],
  [31], [Freight & Carriage Inward], [Direct Expenses], [Appropriate to items],
  [32], [Office Staff Salaries], [Indirect Expenses], [Cost Centres: Admin],
  [33], [Office Premises Rent], [Indirect Expenses], [TDS Sec 194I applicable],
  [34], [High-Speed Internet Expense], [Indirect Expenses], [#hl-orange[18% GST] applicable],
  [35], [Round Off A/c], [Indirect Expenses], [Invoice Rounding · Normal · 1.00]
)

#v(6pt)

== C.4 Phase 3: Stock Items & Multi-Godown Warehouse Setup
1. *Create Godowns:*
   - `Palanpur Central Godown` (Primary warehouse for bulk raw components).
   - `Palanpur Retail Showroom` (Showroom for finished assemblies and retail merchandise).
2. *Units of Measure (UoM):* Create simple unit `Pcs` (Formal Name: *Pieces*, UQC: *PCS-PIECES*) and `Box` (UQC: *BOX-BOXES*).
3. *Stock Items Registry:*

#table(
  columns: (0.4fr, 1.8fr, 0.8fr, 0.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Stock Item Description]], [#text(weight: "bold", fill: white)[HSN]], [#text(weight: "bold", fill: white)[GST Rate]], [#text(weight: "bold", fill: white)[Standard Cost / Price]],
  [01], [Intel Core i7 14th Gen Processor], [847150], [18%], [Cost: ₹24,000 · MRP: ₹31,000],
  [02], [Gigabyte Z790 Motherboard], [847150], [18%], [Cost: ₹16,000 · MRP: ₹21,500],
  [03], [Corsair 32GB DDR5 Gaming RAM], [847330], [18%], [Cost: ₹7,500 · MRP: ₹10,200],
  [04], [Samsung 2TB NVMe M.2 SSD], [847170], [18%], [Cost: ₹8,000 · MRP: ₹11,500],
  [05], [Cooler Master 750W Gold SMPS], [847180], [18%], [Cost: ₹5,500 · MRP: ₹7,800],
  [06], [NZXT ATX Mid-Tower Cabinet], [847330], [18%], [Cost: ₹6,000 · MRP: ₹8,500],
  [07], [Samsung 24\" IPS LED Monitor], [847160], [18%], [Cost: ₹6,500 · MRP: ₹8,500],
  [08], [Logitech Wireless Keyboard Combo], [847160], [18%], [Cost: ₹1,200 · MRP: ₹1,650],
  [09], [Cisco 24-Port Gigabit Switch], [851762], [18%], [Cost: ₹18,500 · MRP: ₹24,000],
  [10], [Apex Pro AI Workstation (BOM)], [847141], [18%], [Manufactured Assembly]
)

#v(6pt)

== C.5 Phase 4: The 30 Master Operating Simulation Transactions
Execute the following 30 comprehensive corporate transactions in chronological sequence across April and May 2025:

#table(
  columns: (0.4fr, 0.7fr, 2.5fr, 0.8fr, 0.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Sl.]], [#text(weight: "bold", fill: white)[Date]], [#text(weight: "bold", fill: white)[Commercial Transaction Particulars]], [#text(weight: "bold", fill: white)[Voucher]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [01], [01-Apr], [Promoters deposited ₹10,00,000 equity share capital into HDFC Bank], [Receipt (F6)], [10,00,000],
  [02], [01-Apr], [Transferred ₹2,00,000 from HDFC Bank to ICICI Bank to establish operating fund], [Contra (F4)], [2,00,000],
  [03], [02-Apr], [Withdrew liquid cash ₹50,000 from HDFC Bank for office petty cash box], [Contra (F4)], [50,000],
  [04], [02-Apr], [Paid ₹1,50,000 commercial office deposit to Landlord Shri Arvindbhai via cheque], [Payment (F5)], [1,50,000],
  [05], [03-Apr], [Procured office furniture & executive chairs from Wood Art Palanpur in cash], [Payment (F5)], [45,000],
  [06], [04-Apr], [Procured 20 Intel i7 CPUs & 20 Gigabyte Motherboards from Avni Pvt Ltd (Inv \#801) + #hl-orange[18% GST]], [Purchase (F9)], [9,44,000],
  [07], [05-Apr], [Procured 40 Corsair RAM & 30 Samsung SSDs from Vishnu Tech (Karnataka, Inv \#512) + 18% IGST], [Purchase (F9)], [6,37,200],
  [08], [06-Apr], [Procured 20 SMPS & 20 Cabinets from Avni Pvt Ltd (Inv \#815) + #hl-orange[18% GST]], [Purchase (F9)], [2,71,400],
  [09], [08-Apr], [Paid ₹8,500 transport freight inward in cash to Palanpur Roadlines], [Payment (F5)], [8,50],
  [10], [10-Apr], [Transferred raw components for 10 Workstations from Central Godown to Retail Showroom], [Stock Journal], [Transferred],
  [11], [11-Apr], [Manufactured 10 units Apex Pro AI Workstations using Stock Journal BOM], [Stock Journal], [Assembly],
  [12], [12-Apr], [Sold 5 units Apex Pro AI Workstations @ ₹85,000 to Maheshwari Enterprises (Inv \#001) + #hl-orange[18% GST]], [Sales (F8)], [5,01,500],
  [13], [14-Apr], [Sold 3 units Apex Pro AI Workstations @ ₹88,000 to Mumbai IT Hub (Inv \#002) + 18% IGST], [Sales (F8)], [3,11,520],
  [14], [15-Apr], [Maheshwari Enterprises returned 1 workstation due to transit scratch (Credit Note)], [Credit Note], [1,00,300],
  [15], [16-Apr], [Returned defective components to Avni Pvt Ltd (Debit Note \#DN-01)], [Debit Note], [47,200],
  [16], [18-Apr], [Received RTGS from Maheshwari Enterprises for net invoice balance], [Receipt (F6)], [4,01,200],
  [17], [20-Apr], [Issued cheque \#450105 to Avni Pvt Ltd in partial settlement of accounts], [Payment (F5)], [5,00,000],
  [18], [22-Apr], [Raised professional IT consulting invoice to Jaimin Corp (SAC 998314) + #hl-orange[18% GST]], [Sales (F8)], [88,500],
  [19], [25-Apr], [Jaimin Corp paid consulting bill via NEFT after deducting #hl-orange[10% TDS] (Sec 194J)], [Receipt (F6)], [81,000],
  [20], [28-Apr], [Paid monthly high-speed enterprise broadband bill via HDFC net banking + #hl-orange[18% GST]], [Payment (F5)], [4,720],
  [21], [30-Apr], [Credited monthly office staff salaries ₹65,000 (To be disbursed 1st May)], [Journal (F7)], [65,000],
  [22], [30-Apr], [Booked monthly office rent ₹25,000 to Shri Arvindbhai; deducted #hl-orange[10% TDS] (Sec 194I)], [Journal (F7)], [25,000],
  [23], [01-May], [Disbursed staff salaries via HDFC Bank direct account transfer], [Payment (F5)], [65,000],
  [24], [02-May], [Issued cheque \#450121 of ₹22,500 to Shri Arvindbhai for net rent], [Payment (F5)], [22,500],
  [25], [07-May], [Deposited April TDS collections (₹2,500 Sec 194I + ₹7,500 Sec 194J) via #ul-green[Challan 281]], [Payment (F5)], [10,000],
  [26], [10-May], [Received full RTGS settlement from Mumbai IT Infrastructure Hub], [Receipt (F6)], [3,11,520],
  [27], [15-May], [Issued NEFT remittance to Vishnu Technologies (Karnataka) for full balance], [Payment (F5)], [6,37,200],
  [28], [20-May], [Reconciled #ul-green[GSTR-3B] for April: Offset Input CGST/SGST/IGST against Output liabilities], [Journal (F7)], [GST Offset],
  [29], [25-May], [Bank debited semi-annual current account maintenance and ledger charges], [Payment (F5)], [1,180],
  [30], [31-May], [Bank credited interest dividend on automatic sweep fixed deposit in HDFC Bank], [Receipt (F6)], [4,850]
)

#v(6pt)

== C.6 Phase 5: Bank Reconciliation Statement (BRS) Audit
On 31-May-2025, the company's HDFC Bank Passbook balance displays ₹4,78,220, whereas Tally Prime's Cash Book displays ₹4,55,720. 
- *Audit Investigation:*
  1. Cheque \#450121 of ₹22,500 issued to Landlord Shri Arvindbhai on 02-May was presented at bank on 04-June.
  2. Interest credit of ₹4,850 was credited by bank on 31-May but entered in Tally on 01-June.
- *Reconciliation Execution:* Navigate to *Gateway of Tally > Banking > Bank Reconciliation*, enter bank clearance dates, and verify that *Balance as per Bank* reconciles to zero variance!

#v(6pt)

== C.7 Phase 6: Audited Annual Financial Statements

=== 1. Manufacturing & Trading Account for the Period Ended 31-May-2025
#table(
  columns: (2fr, 1fr, 2fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Particulars (Debit)]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Particulars (Credit)]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [To Opening Stock], [0.00], [By Sales Accounts (Net)], [7,24,000.00],
  [To Raw Material Purchases], [15,81,200.00], [By Closing Stock (Valued at Cost)], [11,45,000.00],
  [To Factory Labour & Freight], [8,500.00], [], [],
  [To *Gross Profit c/d*], [*2,79,300.00*], [], [],
  [*Total*], [*18,69,000.00*], [*Total*], [*18,69,000.00*]
)

#v(6pt)

=== 2. Profit & Loss Account for the Period Ended 31-May-2025
#table(
  columns: (2fr, 1fr, 2fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Particulars (Debit)]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Particulars (Credit)]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [To Office Staff Salaries], [65,000.00], [By Gross Profit b/d], [2,79,300.00],
  [To Office Premises Rent], [25,000.00], [By IT Consulting Revenue], [75,000.00],
  [To High-Speed Internet], [4,000.00], [By Bank Interest Income], [4,850.00],
  [To Bank Service Charges], [1,000.00], [], [],
  [To Depreciation on Fixed Assets], [12,500.00], [], [],
  [To *Net Profit transferred to Capital*], [*2,51,650.00*], [], [],
  [*Total*], [*3,59,150.00*], [*Total*], [*3,59,150.00*]
)

#v(6pt)

=== 3. Audited Corporate Balance Sheet as at 31-May-2025
#table(
  columns: (2fr, 1fr, 2fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Capital & Liabilities]], [#text(weight: "bold", fill: white)[Amount (₹)]], [#text(weight: "bold", fill: white)[Property & Assets]], [#text(weight: "bold", fill: white)[Amount (₹)]],
  [Equity Share Capital], [10,00,000.00], [Fixed Assets (Net of Dep.)], [1,82,500.00],
  [Profit & Loss Account (Net Profit)], [2,51,650.00], [Office Premises Security Deposit], [1,50,000.00],
  [Sundry Creditors (Trade Payables)], [3,97,000.00], [Closing Stock Inventory], [11,45,000.00],
  [Statutory Taxes & Duties Payable], [4,120.00], [Sundry Debtors (Receivables)], [0.00],
  [], [], [TDS Receivable (Tax Asset)], [7,500.00],
  [], [], [HDFC Bank Current Balance], [4,55,720.00],
  [], [], [Cash-in-hand (Petty Cash)], [12,050.00],
  [*Total Liabilities*], [*16,52,770.00*], [*Total Assets*], [*16,52,770.00*]
)

#v(6pt)


== C.8 Phase 7: The 10 Capstone Commercial Invoices Breakdown
Every trainee must generate and audit the following 10 commercial invoices within the capstone company:

#table(
  columns: (0.5fr, 1fr, 1.3fr, 1fr, 1fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Inv \#]], [#text(weight: "bold", fill: white)[Date & Type]], [#text(weight: "bold", fill: white)[Party Name & GSTIN]], [#text(weight: "bold", fill: white)[Taxable Val]], [#text(weight: "bold", fill: white)[GST Tax]], [#text(weight: "bold", fill: white)[Total (₹)]],
  [PUR-01], [04-Apr · Pur], [Avni Pvt Ltd (24AABCA5544P1Z3)], [₹8,00,000], [CGST+SGST 18%], [₹9,44,000],
  [PUR-02], [05-Apr · Pur], [Vishnu Tech (29AABCV7788M1Z4)], [₹5,40,000], [IGST 18%], [₹6,37,200],
  [PUR-03], [06-Apr · Pur], [Avni Pvt Ltd (24AABCA5544P1Z3)], [₹2,30,000], [CGST+SGST 18%], [₹2,71,400],
  [SAL-01], [12-Apr · Sale], [Maheshwari (24AABCM3344R1Z1)], [₹4,25,000], [CGST+SGST 18%], [₹5,01,500],
  [SAL-02], [14-Apr · Sale], [Mumbai IT (27AAACM4455N1Z9)], [₹2,64,000], [IGST 18%], [₹3,11,520],
  [CN-01], [15-Apr · C/N], [Maheshwari (24AABCM3344R1Z1)], [-₹85,000], [CGST+SGST 18%], [-₹1,00,300],
  [DN-01], [16-Apr · D/N], [Avni Pvt Ltd (24AABCA5544P1Z3)], [-₹40,000], [CGST+SGST 18%], [-₹47,200],
  [SRV-01], [22-Apr · Sale], [Jaimin Corp (24AABCJ6677K1Z0)], [₹75,000], [CGST+SGST 18%], [₹88,500],
  [EXP-01], [28-Apr · Pur], [Airtel Broadband (24AAACA0123P1Z0)], [₹4,000], [CGST+SGST 18%], [₹4,720],
  [RNT-01], [30-Apr · Jrn], [Shri Arvindbhai (Landlord)], [₹25,000], [TDS Sec 194I 10%], [₹22,500 (Net)]
)

#v(6pt)

== C.9 Phase 8: Tripartite GST Returns Reconciliation Audit
In accordance with statutory corporate auditing mandates, the trainee must reconcile the company's internal accounting books against statutory GST portal filings:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Reconciliation Field]], [#text(weight: "bold", fill: white)[As per Tally Prime Books]], [#text(weight: "bold", fill: white)[As per Portal (1/3B/2B)]], [#text(weight: "bold", fill: white)[Audit Variance]],
  [Total Outward Taxable Value], [₹6,79,000.00], [₹6,79,000.00 (#ul-green[GSTR-1])], [₹0.00 (Matched)],
  [Output CGST Liability], [₹37,350.00], [₹37,350.00 (#ul-green[GSTR-3B])], [₹0.00 (Matched)],
  [Output SGST Liability], [₹37,350.00], [₹37,350.00 (#ul-green[GSTR-3B])], [₹0.00 (Matched)],
  [Output IGST Liability], [₹47,520.00], [₹47,520.00 (#ul-green[GSTR-3B])], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (CGST)], [₹89,460.00], [₹89,460.00 (#ul-green[GSTR-2B])], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (SGST)], [₹89,460.00], [₹89,460.00 (#ul-green[GSTR-2B])], [₹0.00 (Matched)],
  [Eligible Input Tax Credit (IGST)], [₹97,200.00], [₹97,200.00 (#ul-green[GSTR-2B])], [₹0.00 (Matched)],
  [Net Tax Payable in Cash (PMT-06)], [₹0.00 (Excess ITC c/f)], [₹0.00 (Cash Ledger)], [₹0.00 (Carried Forward)]
)

#v(6pt)

== C.10 Comprehensive Corporate Capstone Self-Assessment Drill (15 Questions)
1. *What is the primary function of the #hl-green[Bill of Materials (BOM)] during workstation assembly?*\
   *Answer:* It pre-programs the technical recipe of components, automatically deducting raw stock from the central godown and capitalizing finished assembly value without manual data entry.
2. *Why was TDS under #ul-orange[Section 194I] deducted on the ₹25,000 office rent?*\
   *Answer:* Under #ul-orange[Section 194I] of the Income Tax Act, corporate entities paying commercial rent exceeding #hl-orange[₹2,40,000 annually] must deduct #hl-orange[10% TDS] from the landlord.
3. *What is the purpose of #ul-green[GSTR-2B] in Phase 8?*\
   *Answer:* It provides an inviolable, auto-drafted statement of eligible Input Tax Credit uploaded by suppliers, ensuring compliance with #ul-orange[Section 16(2)(aa)].
4. *How is inter-godown transfer recorded in Tally Prime?*\
   *Answer:* Via the Stock Journal voucher (Alt+F7), specifying the Source Godown on the left and the Destination Godown on the right.
5. *Why is TDS Receivable categorized under Current Assets on the Balance Sheet?*\
   *Answer:* Because it represents advance tax withheld by clients that will be offset against the company's corporate tax liability when filing ITR-6.

#v(6pt)


== C.11 Phase 9: Financial Ratio Analysis & Corporate Solvency Audit
Corporate management and statutory auditors analyze key financial ratios to evaluate liquidity, profitability, and operational efficiency:

#table(
  columns: (1.4fr, 1.2fr, 1fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Financial Ratio]], [#text(weight: "bold", fill: white)[Mathematical Formula]], [#text(weight: "bold", fill: white)[Result]], [#text(weight: "bold", fill: white)[Corporate Health Interpretation]],
  [Current Ratio], [Current Assets / Current Liab], [4.12 : 1], [Exceptional liquidity. Exceeds standard 2:1 corporate benchmark.],
  [Quick Ratio], [Quick Assets / Current Liab], [1.25 : 1], [Liquid cash and receivables comfortably cover immediate obligations.],
  [Gross Profit Margin], [(Gross Profit / Sales) × 100], [38.58%], [Robust manufacturing trade margin after raw material assembly.],
  [Net Profit Margin], [(Net Profit / Total Rev) × 100], [31.50%], [High operational profitability and tight overhead expense control.],
  [Debt-Equity Ratio], [Total Debt / Shareholder Equity], [0.32 : 1], [Highly conservative capital structure; very low solvency risk.]
)

#v(8pt)

== C.12 Statutory Audit Certificate & Corporate Training Endorsement
#block(
  fill: rgb("#F8FAFC"),
  stroke: 1.5pt + rgb("#0E7490"),
  radius: 6pt,
  inset: 12pt,
  [
    #align(center)[
      #text(weight: "black", size: 10pt, fill: rgb("#0E7490"))[INSTITUTE OF ACCOUNTING & NETWORK TECHNOLOGY (IANT PALANPUR)]\
      #text(weight: "bold", size: 8.5pt, fill: rgb("#0F172A"))[CERTIFICATE OF PRACTICAL CORPORATE AUDIT & ERP MASTERY]\
      #v(4pt)
      #text(size: 7.2pt, style: "italic", fill: rgb("#64748B"))[Issued in Joint Academic Partnership with RTechLab Commercial Learning Systems]
    ]
    #v(6pt)
    #text(size: 8pt, fill: rgb("#334155"))[
      This is to certify that the candidate has successfully executed the complete end-to-end accounting simulation for *Ravi Global Enterprises Private Limited* in Tally Prime. The candidate has demonstrated verified competency in:
    ]
    #v(3pt)
    - Double-entry multi-currency bookkeeping across all 6 core voucher types (Contra, Payment, Receipt, Journal, Sales, Purchase).
    - Multi-location godown inventory tracking with #hl-green[Bill of Materials (BOM)] computer assembly manufacturing.
    - Statutory GST compliance: #ul-orange[Rule 46] Tax Invoicing, #ul-green[GSTR-1], #ul-green[GSTR-3B] monthly tax computation, and 10#hl-orange[0% GST]R-2B reconciliation.
    - Statutory Income Tax compliance: TDS withholding under Sections 194C, 194J, and 194I, with quarterly #ul-green[Form 26Q] reconciliation.
    - #hl-green[Bank Reconciliation Statement (BRS)] audit, verifying zero discrepancy against commercial bank records.
    - Preparation and analysis of audited final financial statements (Trading Account, Profit & Loss Account, and Schedule III Balance Sheet).
    #v(10pt)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0F172A"))[Corporate Trainer Evaluation:] *DISTINCTION (GRADE A+)*\
        #text(size: 7pt, fill: rgb("#64748B"))[Practical Verification ID: RTECH-TALLY-2027-VAL]
      ],
      [
        #text(size: 7.5pt, weight: "bold", fill: rgb("#0E7490"))[Rahul Patel]\
        #text(size: 6.8pt, fill: rgb("#475569"))[Lead Corporate Accounting Trainer · IANT Palanpur\Founder, RTechLab]
      ]
    )
  ]
)

#v(6pt)

== C.13 Capstone Assessment & Viva Interview Evaluation
- *Evaluation Q1:* In Phase 4, why was TDS under #ul-orange[Section 194J] deducted on the IT consulting fee of ₹75,000 but not on the computer hardware sales?\\
  *Model Answer:* #ul-orange[Section 194J] strictly applies to fees for professional and technical services rendered by corporate and individual consultants. Sale of physical computer hardware is a sale of goods governed by GST and #ul-orange[Section 194Q]/206C(1H), not #ul-orange[Section 194J].
- *Evaluation Q2:* How did the #hl-green[Bill of Materials (BOM)] in Phase 2 ensure inventory integrity during workstation assembly?\\
  *Model Answer:* The BOM linked 1 unit of Apex Pro AI Workstation to 1 CPU, 1 Motherboard, 2 RAM sticks, 1 SSD, 1 SMPS, and 1 Cabinet. When 10 workstations were assembled via the Stock Journal, Tally automatically deducted exactly 10 CPUs, 10 Motherboards, 20 RAMs, and 10 SSDs from the raw materials godown without requiring manual data entry, eliminating human stock count errors.
- *Evaluation Q3:* Explain the statutory rationale of reflecting ₹7,500 TDS in the Balance Sheet under Current Assets.\\
  *Model Answer:* The ₹7,500 TDS withheld by Jaimin Corporation under #ul-orange[Section 194J] represents income tax paid in advance to the Central Government on behalf of Ravi Global Enterprises. It is a legitimate financial asset that will be claimed as a tax credit against the company's advance tax or final corporate income tax liability when filing ITR-6.
- *Hands-On Capstone Certification Assignment:* Create `Ravi Global Enterprises Pvt Ltd` in your local Tally Prime installation, record all 30 transactions, generate the #ul-green[Trial Balance], verify that total debits and credits equal ₹38,42,190, export the Balance Sheet to PDF, and submit your project report for formal IANT / RTechLab Corporate Certification!

#pagebreak()
#rtech-final-page(lang: "en", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")
