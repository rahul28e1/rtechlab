"""
Build Hindi V5 PDF by translating key English phrases in the .typ file and compiling.
"""
import os, shutil, subprocess, fitz

BASE_DIR   = r"c:\Users\Rahul\Videos\My projects\RtechLab"
ASSETS_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\07_SOURCE_FILES\02_BRAND_ASSETS")
OUTPUT_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION")
DL_DIR     = os.path.join(BASE_DIR, "public", "downloads")

SRC = os.path.join(ASSETS_DIR, "office_365_v5_english.typ")
DST = os.path.join(ASSETS_DIR, "office_365_v5_hindi.typ")
OUT = os.path.join(OUTPUT_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-Hindi.pdf")

with open(SRC, encoding="utf-8") as f:
    txt = f.read()

# ── Metadata & Document Header ────────────────────────────────────────────────
txt = txt.replace(
    'title: "Microsoft 365 Cheat Sheet V5 (English)", author: "Rahul Patel · RTechLab"',
    'title: "Microsoft 365 Cheat Sheet V5 (Hindi)", author: "Rahul Patel · RTechLab"'
)
txt = txt.replace(
    "Microsoft 365 Enterprise Shortcut & Productivity Cheat Sheet — V5]",
    "Microsoft 365 Enterprise Shortcut & Productivity Cheat Sheet — V5 (Hindi)]"
)

# ── Font: add Nirmala UI for Hindi Devanagari ─────────────────────────────────
# Already included in the font list — Nirmala UI renders Devanagari fine.

# ── Cover Page Translations ───────────────────────────────────────────────────
txt = txt.replace(
    "[RTECHLAB VOCATIONAL LEARNING SYSTEMS]",
    "[RTECHLAB व्यावसायिक शिक्षण प्रणाली]"
)
txt = txt.replace(
    "[Technology Made Practical · Gujarat \\#1 Vocational IT Track · Edition 1 (2027)]",
    "[प्रौद्योगिकी को व्यावहारिक बनाना · गुजरात \\#1 वोकेशनल आईटी ट्रैक · संस्करण 1 (2027)]"
)
txt = txt.replace(
    "[Rahul Patel — Founder & Systems Architect, RTechLab]",
    "[राहुल पटेल — संस्थापक और सिस्टम्स आर्किटेक्ट, RTechLab]"
)
txt = txt.replace(
    "[Director, IANT Computer Education Palanpur · 10+ Years Enterprise IT · 3,000+ Students Trained]",
    "[निदेशक, IANT कंप्यूटर एजुकेशन पालनपुर · 10+ वर्ष एंटरप्राइज़ IT · 3,000+ छात्र प्रशिक्षित]"
)
txt = txt.replace(
    "[MICROSOFT 365 ENTERPRISE]",
    "[MICROSOFT 365 एंटरप्राइज़]"
)
txt = txt.replace(
    "[150 Shortcuts & Formula Cheat Sheet — Production Edition V5]",
    "[150 शॉर्टकट और फॉर्मूला चीट शीट — प्रोडक्शन एडिशन V5]"
)
txt = txt.replace(
    "[Word (50) · Excel (60: Formulas + Hotkeys) · PowerPoint (30) · Outlook · Cloud · Author Hub]",
    "[Word (50) · Excel (60: फॉर्मूला + हॉटकी) · PowerPoint (30) · Outlook · Cloud · लेखक हब]"
)
txt = txt.replace(
    "[★ High-Density Desk Companion · MIS Analysts · Corporate Accountants · IT Professionals · College Toppers ★]",
    "[★ हाई-डेंसिटी डेस्क साथी · MIS विश्लेषक · कॉर्पोरेट अकाउंटेंट · IT प्रोफेशनल · कॉलेज टॉपर्स ★]"
)

# ── Index Table ───────────────────────────────────────────────────────────────
txt = txt.replace(
    "[📑  OFFICIAL 8-PAGE INDEX — Microsoft 365 Enterprise Cheat Sheet V5 (English)]",
    "[📑  आधिकारिक 8-पेज इंडेक्स — Microsoft 365 एंटरप्राइज़ चीट शीट V5 (हिंदी)]"
)
txt = txt.replace("[Cover & Index]", "[कवर और इंडेक्स]")
txt = txt.replace("[Official M365 + RTechLab branding, author credentials, 8-page visual index with page numbers.]",
                  "[आधिकारिक M365 + RTechLab ब्रांडिंग, लेखक प्रमाण-पत्र, पृष्ठ संख्या सहित 8-पेज इंडेक्स।]")
txt = txt.replace("[Word — Formatting A]", "[Word — फॉर्मेटिंग A]")
txt = txt.replace("[Styles hierarchy, section breaks, track changes, mail merge, table tips + Shortcuts 01–25.]",
                  "[स्टाइल हायरार्की, सेक्शन ब्रेक, ट्रैक चेंजेज़, मेल मर्ज, टेबल टिप्स + शॉर्टकट 01–25।]")
txt = txt.replace("[Word — Shortcuts B]", "[Word — शॉर्टकट B]")
txt = txt.replace("[Tables, footnotes, macros, references, reviewing tools + Shortcuts 26–50.]",
                  "[टेबल, फुटनोट, मैक्रो, संदर्भ, समीक्षा उपकरण + शॉर्टकट 26–50।]")
txt = txt.replace("[Excel — Formulas]", "[Excel — फॉर्मूला]")
txt = txt.replace("[XLOOKUP, FILTER, LET, SUMIFS, Dynamic Arrays, 30 essential formulas (Nos. 51–80).]",
                  "[XLOOKUP, FILTER, LET, SUMIFS, डायनामिक ऐरे, 30 आवश्यक फॉर्मूला (नं. 51–80)।]")
txt = txt.replace("[Excel — Shortcuts]", "[Excel — शॉर्टकट]")
txt = txt.replace("[Top 30 MIS hotkeys + Power Query 6-stage ETL pipeline (Nos. 81–110).]",
                  "[टॉप 30 MIS हॉटकी + Power Query 6-स्टेज ETL पाइपलाइन (नं. 81–110)।]")
txt = txt.replace("[PowerPoint]", "[PowerPoint]")
txt = txt.replace("[Slide Master, Morph, top 30 presenter + design shortcuts (Nos. 111–140).]",
                  "[स्लाइड मास्टर, मॉर्फ, टॉप 30 प्रेज़ेंटर + डिज़ाइन शॉर्टकट (नं. 111–140)।]")
txt = txt.replace("[Outlook & Cloud]", "[Outlook और Cloud]")
txt = txt.replace("[4D Inbox Zero, 10 Outlook shortcuts (Nos. 141–150), OneDrive & M365 Online benefits.]",
                  "[4D इनबॉक्स ज़ीरो, 10 Outlook शॉर्टकट (नं. 141–150), OneDrive और M365 ऑनलाइन लाभ।]")
txt = txt.replace("[Author Hub & MNC Q&A]", "[लेखक हब और MNC Q&A]")
txt = txt.replace(
    "[Rahul Patel profile, 4 QR hubs (Portfolio / YouTube / Instagram / WhatsApp), Top 5 MNC Q&A.]",
    "[राहुल पटेल प्रोफाइल, 4 QR हब (पोर्टफोलियो / YouTube / Instagram / WhatsApp), टॉप 5 MNC Q&A।]"
)
txt = txt.replace("[Total Shortcuts]", "[कुल शॉर्टकट]")
txt = txt.replace("[Excel Formulas]", "[Excel फॉर्मूला]")
txt = txt.replace("[Fully Covered]", "[पूर्ण कवर्ड]")
txt = txt.replace("[MNC Ready]", "[MNC तैयार]")

# ── Page Headers ──────────────────────────────────────────────────────────────
txt = txt.replace(
    "[Page 2 · Word Section A: Styles, Mail Merge, Track Changes & Production Shortcuts (Nos. 01–25)]",
    "[पृष्ठ 2 · Word सेक्शन A: स्टाइल, मेल मर्ज, ट्रैक चेंजेज़ और प्रोडक्शन शॉर्टकट (नं. 01–25)]"
)
txt = txt.replace(
    "[Page 3 · Word Section B: Tables, Macros, References & 25 More Shortcuts (Nos. 26–50)]",
    "[पृष्ठ 3 · Word सेक्शन B: टेबल, मैक्रो, संदर्भ और 25 और शॉर्टकट (नं. 26–50)]"
)
txt = txt.replace(
    "[Page 4 · Excel Section A: 30 Essential Formulas for MIS, Accounts & Data Analysis (Nos. 51–80)]",
    "[पृष्ठ 4 · Excel सेक्शन A: MIS, अकाउंट्स और डेटा विश्लेषण के लिए 30 आवश्यक फॉर्मूला (नं. 51–80)]"
)
txt = txt.replace(
    "[Page 5 · Excel Section B: 30 Speed Hotkeys (Nos. 81–110) + Power Query 6-Stage ETL Pipeline]",
    "[पृष्ठ 5 · Excel सेक्शन B: 30 स्पीड हॉटकी (नं. 81–110) + Power Query 6-स्टेज ETL पाइपलाइन]"
)
txt = txt.replace(
    "[Page 6 · PowerPoint: Slide Master + Corporate Design Architecture + 30 Shortcuts (Nos. 111–140)]",
    "[पृष्ठ 6 · PowerPoint: स्लाइड मास्टर + कॉर्पोरेट डिज़ाइन आर्किटेक्चर + 30 शॉर्टकट (नं. 111–140)]"
)
txt = txt.replace(
    "[Page 7 · Outlook + OneDrive + Microsoft 365 Online — Corporate Email Discipline (Nos. 141–150)]",
    "[पृष्ठ 7 · Outlook + OneDrive + Microsoft 365 ऑनलाइन — कॉर्पोरेट ईमेल अनुशासन (नं. 141–150)]"
)

# ── App Banners ───────────────────────────────────────────────────────────────
txt = txt.replace(
    '"Advanced Formatting, Styles & Document Architecture", word-c)',
    '"उन्नत फॉर्मेटिंग, स्टाइल्स और डॉक्यूमेंट आर्किटेक्चर", word-c)'
)
txt = txt.replace(
    '"Advanced Tables, Footnotes, Macros, References & Power-User Tricks", word-c)',
    '"उन्नत टेबल, फुटनोट, मैक्रो, संदर्भ और पावर-यूज़र ट्रिक्स", word-c)'
)
txt = txt.replace(
    '"XLOOKUP · Dynamic Arrays · LET · Text Functions · 30 Must-Know Formulas", excel-c)',
    '"XLOOKUP · डायनामिक ऐरे · LET · टेक्स्ट फ़ंक्शन · 30 ज़रूरी फॉर्मूला", excel-c)'
)
txt = txt.replace(
    '"Top 30 Power Hotkeys + Power Query ETL Pipeline for MIS & Finance Teams", excel-c)',
    '"MIS और फाइनेंस टीम के लिए टॉप 30 पावर हॉटकी + Power Query ETL पाइपलाइन", excel-c)'
)
txt = txt.replace(
    '"Corporate Deck Design, Slide Master Branding & 30 Presenter Shortcuts", ppt-c)',
    '"कॉर्पोरेट डेक डिज़ाइन, स्लाइड मास्टर ब्रांडिंग और 30 प्रेज़ेंटर शॉर्टकट", ppt-c)'
)
txt = txt.replace(
    '"4D Inbox Zero System, 10 Outlook Shortcuts & OneDrive Cloud Governance", out-c)',
    '"4D इनबॉक्स ज़ीरो सिस्टम, 10 Outlook शॉर्टकट और OneDrive क्लाउड गवर्नेंस", out-c)'
)

# ── Author Hub ────────────────────────────────────────────────────────────────
txt = txt.replace("[RAHUL PATEL]", "[राहुल पटेल]")
txt = txt.replace("[Founder & Systems Architect — RTechLab]", "[संस्थापक और सिस्टम्स आर्किटेक्ट — RTechLab]")
txt = txt.replace(
    "[Director, IANT Computer Education, Palanpur, Gujarat]",
    "[निदेशक, IANT कंप्यूटर एजुकेशन, पालनपुर, गुजरात]"
)
txt = txt.replace("[10+ Years Enterprise IT & Cloud Training]", "[10+ वर्ष एंटरप्राइज़ IT और क्लाउड प्रशिक्षण]")
txt = txt.replace("[3,000+ Students Trained · M.Sc. IT]", "[3,000+ छात्र प्रशिक्षित · M.Sc. IT]")
txt = txt.replace(
    "[Specialisations: Microsoft 365 · Tally Prime]",
    "[विशेषज्ञता: Microsoft 365 · Tally Prime]"
)
txt = txt.replace("[Networking · Python · Web Technologies]", "[नेटवर्किंग · Python · वेब टेक्नोलॉजी]")
txt = txt.replace(
    "[Gujarat No.1 Vocational IT Training Institute]",
    "[गुजरात का No.1 वोकेशनल IT प्रशिक्षण संस्थान]"
)
txt = txt.replace("[Scan & Connect with RTechLab]", "[RTechLab से जुड़ें — QR कोड स्कैन करें]")
txt = txt.replace(
    '"My mission: Every Indian student — from a tier-3 town to a metro city — must have access to world-class, affordable, practical IT education. Rs.22 · Rs.2,200 quality. Always." — Rahul Patel',
    '"मेरा लक्ष्य: हर भारतीय छात्र — टियर-3 कस्बे से महानगर तक — को विश्वस्तरीय, किफायती, व्यावहारिक IT शिक्षा मिले। ₹22 की कीमत में ₹2,200 की गुणवत्ता। हमेशा।" — राहुल पटेल'
)

# ── MNC Q&A ───────────────────────────────────────────────────────────────────
txt = txt.replace(
    "[Interview Question]",
    "[साक्षात्कार प्रश्न]"
)
txt = txt.replace(
    "[Model Answer — Say This in the Interview]",
    "[मॉडल उत्तर — साक्षात्कार में यही कहें]"
)
txt = txt.replace(
    "[Top 5 Microsoft 365 Technical Interview Q&A — MNC, BPO & Corporate Jobs]",
    "[Microsoft 365 के टॉप 5 तकनीकी साक्षात्कार Q&A — MNC, BPO और कॉर्पोरेट जॉब्स]"
)

# ── Footer & Misc ─────────────────────────────────────────────────────────────
txt = txt.replace(
    "[●] 150 Production Shortcuts · Free Tools: #link(\"https://rtechlab.com/tools\")[*rtechlab.com/tools*] · Technology Made Practical]",
    "[●] 150 प्रोडक्शन शॉर्टकट · मुफ़्त टूल्स: #link(\"https://rtechlab.com/tools\")[*rtechlab.com/tools*] · प्रौद्योगिकी को व्यावहारिक बनाना]"
)

# ── Sub-banner Titles ─────────────────────────────────────────────────────────
txt = txt.replace(
    '"Heading Styles, TOC & Navigation — The Corporate Document Foundation", word-c)',
    '"हेडिंग स्टाइल, TOC और नेविगेशन — कॉर्पोरेट डॉक्यूमेंट की नींव", word-c)'
)
txt = txt.replace(
    '"Word Top 25 Daily Speed Shortcuts — Formatting, Navigation & Editing", word-c)',
    '"Word के टॉप 25 डेली स्पीड शॉर्टकट — फॉर्मेटिंग, नेविगेशन और एडिटिंग", word-c)'
)
txt = txt.replace(
    '"Word Tables, References & Advanced Review Tips (Job & College Must-Know)", word-c)',
    '"Word टेबल, संदर्भ और उन्नत रिव्यू टिप्स (जॉब और कॉलेज के लिए ज़रूरी)", word-c)'
)
txt = txt.replace(
    '"Word Advanced Shortcuts — Tables, Review, Macros & Reference Navigation", word-c)',
    '"Word उन्नत शॉर्टकट — टेबल, रिव्यू, मैक्रो और संदर्भ नेविगेशन", word-c)'
)
txt = txt.replace(
    '"Lookup & Reference Mastery — XLOOKUP, INDEX-MATCH, Conditionals & Dynamic Arrays", excel-c)',
    '"लुकअप और संदर्भ दक्षता — XLOOKUP, INDEX-MATCH, शर्तें और डायनामिक ऐरे", excel-c)'
)
txt = txt.replace(
    '"Text Transformers, Date & Rounding Functions — Data Cleaning & Reporting", excel-c)',
    '"टेक्स्ट ट्रांसफॉर्मर, दिनांक और राउंडिंग फ़ंक्शन — डेटा क्लीनिंग और रिपोर्टिंग", excel-c)'
)
txt = txt.replace(
    '"Excel Top 30 Hotkeys — Essential for MIS Executives, Accountants & Data Analysts", excel-c)',
    '"Excel टॉप 30 हॉटकी — MIS एग्ज़ीक्यूटिव, अकाउंटेंट और डेटा एनालिस्ट के लिए ज़रूरी", excel-c)'
)
txt = txt.replace(
    '"6-Stage Automated Data Pipeline — Zero VBA, Zero Manual Scrubbing, 1-Click Monthly Refresh", blue)',
    '"6-स्टेज ऑटोमेटेड डेटा पाइपलाइन — ज़ीरो VBA, ज़ीरो मैन्युअल स्क्रबिंग, 1-क्लिक मंथली रिफ्रेश", blue)'
)
txt = txt.replace(
    '"Slide Master, Morph, 16:9 Layout & Corporate Presentation Architecture", ppt-c)',
    '"स्लाइड मास्टर, मॉर्फ, 16:9 लेआउट और कॉर्पोरेट प्रेज़ेंटेशन आर्किटेक्चर", ppt-c)'
)
txt = txt.replace(
    '"PowerPoint Top 30 Shortcuts — Design, Slide Control, Object Alignment & Presenter Mode", ppt-c)',
    '"PowerPoint टॉप 30 शॉर्टकट — डिज़ाइन, स्लाइड कंट्रोल, ऑब्जेक्ट अलाइनमेंट और प्रेज़ेंटर मोड", ppt-c)'
)
txt = txt.replace(
    '"Outlook 4D Inbox Zero Protocol + Corporate Email Discipline — Zero Unread at End of Day", out-c)',
    '"Outlook 4D इनबॉक्स ज़ीरो प्रोटोकॉल + कॉर्पोरेट ईमेल अनुशासन — दिन के अंत में ज़ीरो अनपढ़", out-c)'
)
txt = txt.replace(
    '"Outlook Top 10 Shortcuts (Nos. 141–150)", out-c)',
    '"Outlook टॉप 10 शॉर्टकट (नं. 141–150)", out-c)'
)
txt = txt.replace(
    '"OneDrive & Microsoft 365 Online — Cloud Power Features", blue)',
    '"OneDrive और Microsoft 365 ऑनलाइन — क्लाउड पावर फ़ीचर्स", blue)'
)
txt = txt.replace(
    '"Connect · Scan QR Codes · Top 5 MNC Technical Interview Q&A", rgb("#047857"))',
    '"जुड़ें · QR कोड स्कैन करें · टॉप 5 MNC तकनीकी साक्षात्कार Q&A", rgb("#047857"))'
)

with open(DST, "w", encoding="utf-8") as f:
    f.write(txt)

print("Compiling Hindi V5 PDF...")
result = subprocess.run(
    ["typst", "compile", DST, "--root", ASSETS_DIR, OUT],
    capture_output=True, text=True, cwd=ASSETS_DIR
)
if result.returncode != 0:
    print("COMPILE ERROR:\n", result.stderr[:3000])
    raise SystemExit(1)

doc = fitz.open(OUT)
pages = len(doc)
doc.close()
print(f"=== HINDI V5: {pages} pages ===")
shutil.copy(OUT, os.path.join(DL_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-Hindi.pdf"))
print("Done — Hindi V5 compiled and deployed to public/downloads/")
