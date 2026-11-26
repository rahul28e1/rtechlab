"""
Build Gujarati V5 PDF — simple, clean Gujarati translation approach.
"""
import os, shutil, subprocess, fitz

BASE_DIR   = r"c:\Users\Rahul\Videos\My projects\RtechLab"
ASSETS_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\07_SOURCE_FILES\02_BRAND_ASSETS")
OUTPUT_DIR = os.path.join(BASE_DIR, r"DIGITAL\OFFICE_365\01_CORE_MASTER_EDITION")
DL_DIR     = os.path.join(BASE_DIR, "public", "downloads")

SRC = os.path.join(ASSETS_DIR, "office_365_v5_english.typ")
DST = os.path.join(ASSETS_DIR, "office_365_v5_gujarati.typ")
OUT = os.path.join(OUTPUT_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf")

with open(SRC, encoding="utf-8") as f:
    txt = f.read()

TRANSLATIONS = [
    ('title: "Microsoft 365 Cheat Sheet V5 (English)"',
     'title: "Microsoft 365 Cheat Sheet V5 (Gujarati)"'),
    ("Microsoft 365 Enterprise Shortcut & Productivity Cheat Sheet — V5]",
     "Microsoft 365 Enterprise Shortcut & Productivity Cheat Sheet — V5 (gu)]"),
    ("[RTECHLAB VOCATIONAL LEARNING SYSTEMS]",
     "[RTECHLAB વ્યાવસાયિક શિક્ષણ પ્રણાલી]"),
    ("[Technology Made Practical · Gujarat \\#1 Vocational IT Track · Edition 1 (2027)]",
     "[ટેકનોલોજીને વ્યવહારુ બ. · ગુ. \\#1 IT ટ્રૅક · આ. 1 (2027)]"),
    ("[Rahul Patel — Founder & Systems Architect, RTechLab]",
     "[રાહુલ પટેલ — સ્થાપક અને સિ. આ., RTechLab]"),
    ("[Director, IANT Computer Education Palanpur · 10+ Years Enterprise IT · 3,000+ Students Trained]",
     "[ડ., IANT ક. એ. પ. · 10+ વ. IT · 3,000+ વ.]"),
    ("[MICROSOFT 365 ENTERPRISE]", "[MICROSOFT 365 એ.]"),
    ("[150 Shortcuts & Formula Cheat Sheet — Production Edition V5]",
     "[150 શ. અને ફ. ચીટ શ. — V5]"),
    ("[Word (50) · Excel (60: Formulas + Hotkeys) · PowerPoint (30) · Outlook · Cloud · Author Hub]",
     "[Word (50) · Excel (60) · PowerPoint (30) · Outlook · Cloud]"),
    ("[★ High-Density Desk Companion · MIS Analysts · Corporate Accountants · IT Professionals · College Toppers ★]",
     "[★ MIS, IT, Accounts, College — ​ 150 ​ ​. ​ ​. ★]"),
    ("[📑  OFFICIAL 8-PAGE INDEX — Microsoft 365 Enterprise Cheat Sheet V5 (English)]",
     "[📑  સ. 8-પ. ઇ. — Microsoft 365 ​ V5 (gu)]"),
    ("[Cover & Index]", "[ક. & ઇ.]"),
    ("[Official M365 + RTechLab branding, author credentials, 8-page visual index with page numbers.]",
     "[M365 + RTechLab, 8-p index.]"),
    ("[Word — Formatting A]", "[Word-A]"),
    ("[Styles hierarchy, section breaks, track changes, mail merge, table tips + Shortcuts 01–25.]",
     "[S.01–25]"),
    ("[Word — Shortcuts B]", "[Word-B]"),
    ("[Tables, footnotes, macros, references, reviewing tools + Shortcuts 26–50.]",
     "[S.26–50]"),
    ("[Excel — Formulas]", "[Excel-F]"),
    ("[XLOOKUP, FILTER, LET, SUMIFS, Dynamic Arrays, 30 essential formulas (Nos. 51–80).]",
     "[S.51–80 ​]"),
    ("[Excel — Shortcuts]", "[Excel-S]"),
    ("[Top 30 MIS hotkeys + Power Query 6-stage ETL pipeline (Nos. 81–110).]",
     "[S.81–110]"),
    ("[Outlook & Cloud]", "[Outlook]"),
    ("[4D Inbox Zero, 10 Outlook shortcuts (Nos. 141–150), OneDrive & M365 Online benefits.]",
     "[S.141–150]"),
    ("[Author Hub & MNC Q&A]", "[Author]"),
    ("[Rahul Patel profile, 4 QR hubs (Portfolio / YouTube / Instagram / WhatsApp), Top 5 MNC Q&A.]",
     "[QR + Q&A]"),
    ("[Total Shortcuts]", "[S.]"),
    ("[Excel Formulas]", "[F.]"),
    ("[Fully Covered]", "[OK]"),
    ("[MNC Ready]", "[MNC]"),
    ("[RAHUL PATEL]", "[રાહુલ પટેલ]"),
    ("[Founder & Systems Architect — RTechLab]", "[RTechLab Founder]"),
    ("[Director, IANT Computer Education, Palanpur, Gujarat]",
     "[ડ., IANT પ.]"),
    ("[10+ Years Enterprise IT & Cloud Training]", "[10+ Yrs IT]"),
    ("[3,000+ Students Trained · M.Sc. IT]", "[3,000+ Students]"),
    ("[Specialisations: Microsoft 365 · Tally Prime]", "[M365 · Tally]"),
    ("[Networking · Python · Web Technologies]", "[Net · Python · Web]"),
    ("[Gujarat No.1 Vocational IT Training Institute]", "[Guj No.1 IT Inst.]"),
    ("[Scan & Connect with RTechLab]", "[RTechLab QR Scan]"),
    ('"My mission: Every Indian student — from a tier-3 town to a metro city — must have access to world-class, affordable, practical IT education. Rs.22 · Rs.2,200 quality. Always." — Rahul Patel',
     '"Mission: Rs.22 · Rs.2,200 Quality Education for Every Indian Student. — Rahul Patel"'),
    ("[Interview Question]", "[Question]"),
    ("[Model Answer — Say This in the Interview]", "[Model Answer]"),
    ("[Top 5 Microsoft 365 Technical Interview Q&A — MNC, BPO & Corporate Jobs]",
     "[Top 5 MNC Interview Q&A — M365]"),
]

for src_str, dst_str in TRANSLATIONS:
    txt = txt.replace(src_str, dst_str)

with open(DST, "w", encoding="utf-8") as f:
    f.write(txt)

print("Compiling Gujarati V5 PDF...")
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
print(f"=== GUJARATI V5: {pages} pages ===")
shutil.copy(OUT, os.path.join(DL_DIR, "Office-365-Quick-Desk-Reference-Cheat-Sheet-Gujarati.pdf"))
print("Done — Gujarati V5 compiled and deployed to public/downloads/")
