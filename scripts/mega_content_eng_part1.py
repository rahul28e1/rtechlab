# -*- coding: utf-8 -*-
"""
Mega English Curriculum Generator — Part 1 (Topics 1 to 4)
Target: Comprehensive 50-60 Page Commercial Edition
Standardized by Rahul Patel (Founder, RTechLab / IANT Palanpur)
Direct Email: rahul.28e1@gmail.com
"""

def get_part1_chapters():
    c = {}

    # =========================================================================
    # TOPIC 01: HISTORY, EVOLUTION, HARDWARE & LICENSING
    # =========================================================================
    c[1] = """
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

== 1.7 Chronological Feature Evolution Matrix from Peutronics 1986 to Tally Prime 5.0
#table(
  columns: (1fr, 0.8fr, 1.2fr, 2fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 3.5pt,
  [#text(weight: "bold", fill: white)[Tally Edition]], [#text(weight: "bold", fill: white)[Release Year]], [#text(weight: "bold", fill: white)[Operating System]], [#text(weight: "bold", fill: white)[Milestone Capabilities & Architectural Leaps]],
  [The Accountant], [1986], [MS-DOS 3.3], [First codeless accounting software developed by Bharat Goenka in Bangalore.],
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

9. *In which year was Peutronics Financial Services formally renamed Tally Solutions Pvt. Ltd.?*\\
   (A) 1986 #h(10pt) (B) 1991 #h(10pt) (C) 1999 #h(10pt) (D) 2005\\
   *Answer: (C)* | *Explanation:* In 1999, the company embraced the brand name Tally Solutions Pvt. Ltd.

10. *Which Tally Prime license edition is engineered to run via a centralized Tally Gateway Server across multiple LAN workstations?*\\
    (A) Silver #h(10pt) (B) Gold #h(10pt) (C) Educational #h(10pt) (D) Single User\\
    *Answer: (B)* | *Explanation:* Tally Gold runs the multi-user Tally Gateway Server for concurrent network voucher processing.

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
    # TOPIC 02: WHAT IS TALLY PRIME & SYSTEM ARCHITECTURE
    # =========================================================================
    c[2] = """
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

== 2.6 The 4 Operational Quadrants of the Gateway of Tally
The Gateway of Tally (GOT) is the central command console of Tally Prime. It is divided into 4 primary operational quadrants:

#table(
  columns: (1.2fr, 1.2fr, 2.6fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Quadrant]], [#text(weight: "bold", fill: white)[Menu Options]], [#text(weight: "bold", fill: white)[Operational Capabilities & Business Function]],
  [1. Masters], [Create, Alter, Chart of Accounts], [Create and modify foundational accounting accounts (Ledgers, Groups), inventory items (Stock Items, Units, Godowns, Categories), statutory tax rates, and payroll heads.],
  [2. Transactions], [Vouchers, Day Book], [Record daily commercial operations (Sales, Purchase, Payment, Receipt, Contra, Journal). Day Book displays all daily chronological vouchers with drill-down audit capability.],
  [3. Utilities], [Banking], [Access Cheque Printing, Cheque Register, Post-Dated Cheque Management, Bank Reconciliation Statement (BRS), and Deposit Slips.],
  [4. Reports], [Balance Sheet, P&L, Stock Summary, Ratio Analysis], [Generate executive statutory financial statements: Balance Sheet (financial position), Profit & Loss Account (operating net income), Stock Summary (inventory valuation), and Ratio Analysis (liquidity and solvency).]
)

#v(6pt)

== 2.7 Global F12 Configuration vs Company-Wide F11 Features Architecture
Understanding the fundamental boundary between F11 and F12 is a hallmark of an advanced corporate accountant:
- *F11 Company Features (Company Level):* System-wide operational switches enabled per company. For example, enabling GST, enabling TDS, activating multi-currency, or activating Cost Centres. Once enabled in F11, the feature becomes accessible across all vouchers and masters.
- *F12 Configurations (Screen Level):* Context-specific user interface preferences that alter how a specific screen behaves. For example, configuring whether to provide supplier invoice numbers, show ledger current balances, or display buyer contact details during voucher entry. Pressing F12 on the Balance Sheet shows Balance Sheet options; pressing F12 in Sales Voucher shows Sales Invoice options!

#v(6pt)


== 2.8 Tally Prime Data Directory Architecture & File Structure
Inside the corporate data folder (e.g., `C:\TallyPrime\Data\10000`), Tally Prime maintains its proprietary database structure:
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

9. *Which key combination shuts or closes an active loaded company in Tally Prime?*\\
   (A) Alt + F1 #h(10pt) (B) Ctrl + F3 #h(10pt) (C) Alt + K > Shut #h(10pt) (D) Both (B) and (C)\\
   *Answer: (D)* | *Explanation:* Both Ctrl+F3 and Alt+K > Shut safely close an open company.

10. *What is the primary role of the Chart of Accounts menu under Masters in Gateway of Tally?*\\
    (A) Print invoices #h(10pt) (B) View master hierarchies (Groups, Ledgers, Stock) in a unified tree\\
    (C) Calculate GST returns #h(10pt) (D) Download updates\\
    *Answer: (B)* | *Explanation:* Chart of Accounts displays the complete parent-child relational tree of all business masters.

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
    # TOPIC 03: GST & TDS FOUNDATION
    # =========================================================================
    c[3] = """
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

== 3.6 Statutory Input Tax Credit (ITC) Rules under Section 16 & Blocked ITC (Sec 17(5))
Input Tax Credit (ITC) is the core mechanism that prevents cascading taxation under GST. However, claiming ITC is subject to strict statutory preconditions:

#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Statutory Dimension]], [#text(weight: "bold", fill: white)[Legal Precondition under CGST Act, 2017]],
  [Possession of Tax Invoice], [The buyer must possess a valid legal Tax Invoice, Debit Note, or Bill of Entry issued by an approved registered supplier under Rule 46.],
  [Physical Receipt of Goods], [Goods or services must have been physically received. In "Bill To - Ship To" scenarios, receipt by the designated third party qualifies.],
  [Tax Actually Paid to Government], [The supplier must have deposited the collected tax with the Government via cash or eligible ITC in their monthly GSTR-3B return.],
  [GSTR-2B Matching (Sec 16(2)(aa))], [ITC is strictly restricted to invoices uploaded by the supplier in GSTR-1 and appearing in the buyer's auto-drafted GSTR-2B statement.],
  [Blocked ITC under Section 17(5)], [ITC is permanently prohibited on: Motor vehicles for transport of persons (seating <= 13), Food & beverages, Outdoor catering, Health insurance, Membership of clubs, Personal gifts/free samples, and Goods lost, stolen, or destroyed!]
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
  [GSTR-1], [11th of subsequent month], [Statement of Outward Supplies (B2B, B2C, Exports, HSN Summary). Populates buyer GSTR-2B.],
  [GSTR-3B], [20th of subsequent month], [Monthly self-assessed summary return, payment of tax liability, and claiming eligible ITC.],
  [GSTR-2B], [14th of subsequent month], [Static auto-generated ITC statement. 100% of claimed ITC must be reflected here.],
  [GSTR-4], [30th April following FY], [Annual return for Composition Scheme dealers (opted under Section 10).],
  [GSTR-7], [10th of subsequent month], [Return for authorities deducting TDS under GST Section 51 (2% deduction).],
  [GSTR-8], [10th of subsequent month], [Statement for E-Commerce operators collecting TCS under GST Section 52 (0.5% or 1%).],
  [GSTR-9], [31st December following FY], [Annual comprehensive reconciliation return for all regular registered taxpayers.],
  [GSTR-9C], [31st December following FY], [Statutory reconciliation statement certified by CA/CMA for turnover exceeding ₹5 Crores.]
)

#v(6pt)

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

    # =========================================================================
    # TOPIC 04: LEDGERS, GOLDEN RULES & MR. VERMA SET
    # =========================================================================
    c[4] = """
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

When the proprietor introduces capital, Cash (Asset) increases, and Capital (Owner's Equity) increases equally. When goods are bought on credit, Stock (Asset) increases, and Sundry Creditors (Liability) increases. Every debit entry is matched by an equal credit entry, ensuring the Trial Balance maintains perfect balance!

#v(6pt)

== 4.3 The Three Fundamental Classes of Accounts & The 3 Golden Rules
Modern accounting traces its foundation to the Italian mathematician *Fra Luca Pacioli* (1494), who formalized the Double Entry System. All commercial transactions are classified into three universal classes of accounts, each governed by its inviolable *Golden Rule*:

#table(
  columns: (1.2fr, 1.4fr, 1.3fr, 2.1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 5pt,
  [#text(weight: "bold", fill: white)[Account Class]], [#text(weight: "bold", fill: white)[Definition & Coverage]], [#text(weight: "bold", fill: white)[Inviolable Golden Rule]], [#text(weight: "bold", fill: white)[Corporate Examples]],
  [1. Personal Account], [Relates to legal persons, individuals, corporate firms, banks, and institutions.], [*Debit the Receiver*\\ *Credit the Giver*], [Ravi Private Ltd, Ram & Co., HDFC Bank, SBI Bank, Salman's Capital, Drawings A/c.],
  [2. Real Account], [Relates to tangible and intangible assets and property owned by the business entity.], [*Debit what Comes In*\\ *Credit what Goes Out*], [Cash, Office Furniture, Plant & Machinery, Delivery Vans, Computers, Patents, Trademarks.],
  [3. Nominal Account], [Relates to business operating expenses, losses, revenues, gains, and commissions.], [*Debit all Expenses & Losses*\\ *Credit all Incomes & Gains*], [Office Rent, Staff Salary, Electricity Expenses, Consulting Fees, Commission Earned, Interest Income.]
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
  [1], [Proprietor started business with cash ₹5,00,000], [Cash A/c\\ Capital A/c], [Real\\ Personal], [Dr. Cash (Comes in)\\ Cr. Capital (Giver)],
  [2], [Opened current account in HDFC Bank depositing ₹1,00,000 cash], [HDFC Bank A/c\\ Cash A/c], [Personal\\ Real], [Dr. HDFC Bank (Receiver)\\ Cr. Cash (Goes out)],
  [3], [Purchased office furniture for ₹25,000 paying by HDFC cheque], [Furniture A/c\\ HDFC Bank A/c], [Real\\ Personal], [Dr. Furniture (Comes in)\\ Cr. HDFC Bank (Giver)],
  [4], [Purchased goods for cash ₹40,000], [Purchase A/c\\ Cash A/c], [Nominal / Real\\ Real], [Dr. Purchase (Expense)\\ Cr. Cash (Goes out)],
  [5], [Purchased goods on credit from Krishi Beej Bhandar ₹50,000], [Purchase A/c\\ Krishi Beej Bhandar], [Nominal\\ Personal], [Dr. Purchase (Expense)\\ Cr. Supplier (Giver)],
  [6], [Sold goods for cash ₹35,000], [Cash A/c\\ Sales A/c], [Real\\ Nominal], [Dr. Cash (Comes in)\\ Cr. Sales (Income)],
  [7], [Sold goods on credit to Shivam Traders ₹60,000], [Shivam Traders A/c\\ Sales A/c], [Personal\\ Nominal], [Dr. Customer (Receiver)\\ Cr. Sales (Income)],
  [8], [Paid office rent ₹15,000 by HDFC cheque], [Rent Expense A/c\\ HDFC Bank A/c], [Nominal\\ Personal], [Dr. Rent (Expense)\\ Cr. HDFC Bank (Giver)],
  [9], [Paid staff salaries ₹20,000 in cash], [Salary Expense A/c\\ Cash A/c], [Nominal\\ Real], [Dr. Salary (Expense)\\ Cr. Cash (Goes out)],
  [10], [Received consulting fees ₹75,000 by NEFT in HDFC Bank], [HDFC Bank A/c\\ Consulting Income A/c], [Personal\\ Nominal], [Dr. HDFC Bank (Receiver)\\ Cr. Consulting (Income)],
  [11], [Withdrew ₹10,000 cash from HDFC Bank for office use], [Cash A/c\\ HDFC Bank A/c], [Real\\ Personal], [Dr. Cash (Comes in)\\ Cr. HDFC Bank (Giver)],
  [12], [Proprietor withdrew ₹5,000 cash for personal domestic use], [Drawings A/c\\ Cash A/c], [Personal\\ Real], [Dr. Drawings (Receiver)\\ Cr. Cash (Goes out)],
  [13], [Paid electricity bill ₹4,500 in cash], [Electricity Expense A/c\\ Cash A/c], [Nominal\\ Real], [Dr. Electricity (Expense)\\ Cr. Cash (Goes out)],
  [14], [Received ₹50,000 cheque from Shivam Traders against invoice], [HDFC Bank A/c\\ Shivam Traders], [Personal\\ Personal], [Dr. HDFC Bank (Receiver)\\ Cr. Shivam (Giver)],
  [15], [Paid ₹45,000 cheque to Krishi Beej Bhandar in settlement], [Krishi Beej Bhandar\\ HDFC Bank A/c], [Personal\\ Personal], [Dr. Supplier (Receiver)\\ Cr. HDFC Bank (Giver)],
  [16], [Purchased computer printer for ₹8,500 in cash], [Computer & Printer A/c\\ Cash A/c], [Real\\ Real], [Dr. Asset (Comes in)\\ Cr. Cash (Goes out)],
  [17], [Paid internet charges to GTPL ₹5,900 by cash], [Internet Expense A/c\\ Cash A/c], [Nominal\\ Real], [Dr. Internet (Expense)\\ Cr. Cash (Goes out)],
  [18], [Received commission ₹12,000 by cheque deposited in HDFC], [HDFC Bank A/c\\ Commission Income A/c], [Personal\\ Nominal], [Dr. HDFC Bank (Receiver)\\ Cr. Commission (Income)],
  [19], [HDFC Bank deducted bank charges ₹590 from account], [Bank Charges A/c\\ HDFC Bank A/c], [Nominal\\ Personal], [Dr. Bank Charges (Expense)\\ Cr. HDFC Bank (Giver)],
  [20], [Charged 10% depreciation on office furniture ₹2,500], [Depreciation Expense A/c\\ Furniture Asset A/c], [Nominal\\ Real], [Dr. Depreciation (Loss)\\ Cr. Furniture (Value decreases)],
  [21], [Purchased trading goods ₹1,00,000 with 18% GST (CGST 9% + SGST 9%)], [Purchase A/c, Input CGST, Input SGST\\ Vendor A/c], [Nominal, Current Asset\\ Personal], [Dr. Purchase 1L, Dr. CGST 9k, Dr. SGST 9k\\ Cr. Vendor 1.18L],
  [22], [Sold goods ₹1,50,000 with 18% GST to client on credit], [Debtor A/c\\ Sales A/c, Output CGST, Output SGST], [Personal\\ Nominal, Liability], [Dr. Debtor 1.77L\\ Cr. Sales 1.5L, Cr. CGST 13.5k, Cr. SGST 13.5k],
  [23], [Booked professional audit fee ₹50,000 deducting 10% TDS (194J)], [Audit Fee A/c\\ CA Firm A/c, TDS Payable], [Nominal\\ Personal, Liability], [Dr. Audit Fee 50k\\ Cr. CA Firm 45k, Cr. TDS 5k],
  [24], [Deposited TDS of ₹5,000 via Challan 281 through HDFC Bank], [TDS Payable A/c\\ HDFC Bank A/c], [Liability\\ Personal], [Dr. TDS Payable 5k\\ Cr. HDFC Bank 5k],
  [25], [Customer bad debt written off as irrecoverable ₹8,000], [Bad Debts Expense A/c\\ Debtor A/c], [Nominal\\ Personal], [Dr. Bad Debts (Loss)\\ Cr. Debtor (Asset reduced)],
  [26], [Recovered ₹4,000 cash from previously written-off debtor], [Cash A/c\\ Bad Debts Recovered A/c], [Real\\ Nominal], [Dr. Cash (Comes in)\\ Cr. Bad Debts Recovered (Income)],
  [27], [Paid fire insurance premium ₹12,000 for 12 months by cheque], [Prepaid Insurance A/c\\ HDFC Bank A/c], [Asset\\ Personal], [Dr. Prepaid Insurance (Asset)\\ Cr. HDFC Bank (Giver)],
  [28], [Accrued interest on Fixed Deposit ₹3,500 due but not yet received], [Accrued Interest A/c\\ Interest Income A/c], [Asset\\ Nominal], [Dr. Accrued Interest (Asset)\\ Cr. Interest (Income)],
  [29], [Goods destroyed by accidental warehouse fire ₹15,000], [Loss by Fire A/c\\ Purchase A/c], [Nominal\\ Nominal / Real], [Dr. Loss by Fire (Loss)\\ Cr. Purchase (Stock reduced)],
  [30], [Settled supplier bill of ₹10,000 by paying ₹9,700 cash (₹300 discount)], [Supplier A/c\\ Cash A/c, Discount Received], [Personal\\ Real, Nominal], [Dr. Supplier 10k\\ Cr. Cash 9.7k, Cr. Discount 300]
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

1. *Which two ledgers are automatically created by Tally Prime upon creating a new company?*\\
   (A) Sales and Purchase #h(10pt) (B) Cash and Profit & Loss #h(10pt) (C) Bank and Cash #h(10pt) (D) Capital and Drawings\\
   *Answer: (B)* | *Explanation:* Tally Prime creates Cash and Profit & Loss accounts by default in every company.

2. *What is the Golden Rule for a Personal Account?*\\
   (A) Debit what comes in, Credit what goes out #h(10pt) (B) Debit the Receiver, Credit the Giver\\
   (C) Debit all expenses, Credit all incomes #h(10pt) (D) Debit assets, Credit liabilities\\
   *Answer: (B)* | *Explanation:* Personal accounts represent entities; the receiver is debited and the giver is credited.

3. *Rent paid to a landlord falls under which class of account?*\\
   (A) Personal Account #h(10pt) (B) Real Account #h(10pt) (C) Nominal Account #h(10pt) (D) Representative Account\\
   *Answer: (C)* | *Explanation:* Rent is an operating business expenditure, classified as a Nominal Account.

4. *Office furniture purchased for cash is an example of which account class?*\\
   (A) Nominal Account #h(10pt) (B) Real Account #h(10pt) (C) Personal Account #h(10pt) (D) Debtors Account\\
   *Answer: (B)* | *Explanation:* Furniture is a tangible property/asset owned by the business, making it a Real Account.

5. *When Mr. Verma deposits ₹30,000 cash into HDFC Bank, which ledger account is credited?*\\
   (A) HDFC Bank A/c #h(10pt) (B) Cash A/c #h(10pt) (C) Capital A/c #h(10pt) (D) Suspense A/c\\
   *Answer: (B)* | *Explanation:* Real account rule: Credit what goes out. Cash goes out of the cash box into the bank.

6. *Drawings Account (money withdrawn by the owner for personal domestic use) is classified as:*\\
   (A) Nominal Account #h(10pt) (B) Real Account #h(10pt) (C) Personal Account #h(10pt) (D) Asset Account\\
   *Answer: (C)* | *Explanation:* Drawings represents the individual proprietor/owner, hence it is a Personal Account.

7. *Who formalized the modern Double Entry Bookkeeping system in 1494?*\\
   (A) Adam Smith #h(10pt) (B) Fra Luca Pacioli #h(10pt) (C) John Maynard Keynes #h(10pt) (D) Bharat Goenka\\
   *Answer: (B)* | *Explanation:* Fra Luca Pacioli published the foundational principles of double-entry bookkeeping in Venice.

8. *If a business receives ₹50,000 commission by cheque, which account is debited?*\\
   (A) Commission Income A/c #h(10pt) (B) Bank A/c #h(10pt) (C) Cash A/c #h(10pt) (D) Capital A/c\\
   *Answer: (B)* | *Explanation:* The receiving bank account is debited as the receiver of the funds.

9. *In the fundamental accounting equation (Assets = Liabilities + Capital), if assets increase by ₹50,000 without liability change, what happens to Capital?*\\
   (A) Decreases by ₹50,000 #h(10pt) (B) Increases by ₹50,000 #h(10pt) (C) Remains unchanged #h(10pt) (D) Doubled\\
   *Answer: (B)* | *Explanation:* By equation equilibrium, an increase in assets directly increases owner's capital.

10. *Under which class of account is 'Input CGST' or 'Output SGST' classified?*\\
    (A) Real Account #h(10pt) (B) Personal Account (Government) #h(10pt) (C) Nominal Account #h(10pt) (D) Fictitious Account\\
    *Answer: (B)* | *Explanation:* Tax accounts represent liabilities or receivables vis-a-vis the Government tax department (Personal).

#v(6pt)

// VIVA & LAB
== Topic 04: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* State the difference between Real and Nominal accounts with two commercial examples of each.\\
  *Answer:* Real accounts represent tangible assets owned by the firm (e.g., Cash, Machinery). Nominal accounts represent expenses, losses, revenues, and gains (e.g., Salary Paid, Interest Received).
- *Viva Q2:* Why is the Capital Account treated as a Personal Account rather than a Liability Account?\\
  *Answer:* Under the Business Entity Concept, the owner is legally distinct from the enterprise. The Capital Account represents the owner as a person who gave funds to the business.
- *Hands-On Lab Task:* In Tally Prime, go to Gateway of Tally > *Create > Ledger*, and create three ledgers: *HDFC Bank* under *Bank Accounts*, *Office Rent* under *Indirect Expenses*, and *Ram & Co.* under *Sundry Creditors*.
"""

    return c
