# -*- coding: utf-8 -*-
"""
Curriculum Generator for Tally Prime Master Handbook — English Edition
Standardized by Rahul Patel (Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab)
Produces all 11 In-Depth Academic & Practical Topics (~50-55 pages).
"""

import os

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SCRIPTS_DIR = os.path.join(BASE_DIR, "scripts")

def build_english_chapters():
    c = {}

    # =========================================================================
    # TOPIC 01
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

#v(8pt)

== 1.2 Historical Evolution: From DOS to Tally Prime
Tally's technological journey spans nearly four decades of continuous architectural innovation, reflecting India's transition from pre-liberalization manual trade to the modern digital Goods and Services Tax (GST) regime:

#table(
  columns: (1.2fr, 1.1fr, 2.7fr),
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
    #image("../../02_BRAND_ASSETS/tally_classic_logo.png", width: 55mm)
  ]
]

#v(6pt)

== 1.3 How to Download & Install Tally Prime
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

== 1.4 Understanding Tally Prime Licensing Modes
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
    - Rebranded to *Tally Solutions Pvt. Ltd.* in 1999; commands over *80% market share* in India.
    - Evolution: DOS-based Tally 4.5 -> Windows 5.4 -> VAT-compliant 7.2 -> ERP workhorse Tally.ERP 9 -> Tally Prime.
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

#v(6pt)

// VIVA & LAB
== Topic 01: Practical Viva Questions & Hands-On Lab Task
- *Viva Q1:* Why did Shyam Sundar Goenka want a codeless accounting system in 1986?\\
  *Answer:* Because existing computer systems required complex programming and external database specialists, making them impractical for ordinary Indian traders.
- *Viva Q2:* How can an institute or student use Tally Prime without purchasing a commercial license?\\
  *Answer:* By launching Tally Prime in *Educational Mode*, which provides full double-entry, inventory, and GST features with a transaction date restriction (1st, 2nd, 31st).
- *Hands-On Lab Task:* Download `setup.exe` from `tallysolutions.com`, install Tally Prime on your PC, launch the software, select *Continue in Educational Mode*, and note down the version and license status displayed on the top left.
"""

    return c

if __name__ == "__main__":
    c = build_english_chapters()
    print(f"Generated {len(c)} chapters in English module.")
