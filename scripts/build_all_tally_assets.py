# -*- coding: utf-8 -*-
"""
RTechLab Tally Prime Master Publishing Engine
Compiles English, Hindi, and Gujarati Master Handbooks,
50-Invoice Commercial Mega-Workbook, Interview Vault, Career Blueprint,
5-Page Preview, and the 1-Click Career Accelerator ZIP Bundle.
Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab / IANT Palanpur)
"""

import os
import sys
import shutil
import zipfile
import subprocess
import fitz

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
TALLY_DIR = os.path.join(BASE_DIR, "DIGITAL", "TALLY_PRIME")
SOURCE_DIR = os.path.join(TALLY_DIR, "07_SOURCE_FILES")
ENG_SRC = os.path.join(SOURCE_DIR, "English")
HI_SRC = os.path.join(SOURCE_DIR, "Hindi")
GU_SRC = os.path.join(SOURCE_DIR, "Gujarati")
ENGINE_DIR = os.path.join(TALLY_DIR, "07_PUBLISHING_ENGINE")
CORE_OUT = os.path.join(TALLY_DIR, "01_CORE_MASTER_EDITION")
VAULT_OUT = os.path.join(TALLY_DIR, "02_INTERVIEW_AND_SALARY_VAULT")
WORKBOOK_OUT = os.path.join(TALLY_DIR, "03_COMMERCIAL_INVOICE_WORKBOOK")
DOWNLOADS_DIR = os.path.join(BASE_DIR, "public", "downloads")

os.makedirs(ENG_SRC, exist_ok=True)
os.makedirs(HI_SRC, exist_ok=True)
os.makedirs(GU_SRC, exist_ok=True)
os.makedirs(CORE_OUT, exist_ok=True)
os.makedirs(VAULT_OUT, exist_ok=True)
os.makedirs(WORKBOOK_OUT, exist_ok=True)
os.makedirs(DOWNLOADS_DIR, exist_ok=True)

# Import generators
sys.path.append(os.path.join(BASE_DIR, "scripts"))
from tally_content_eng import get_english_chapters
from tally_content_hi import get_hindi_chapters
from tally_content_gu import get_gujarati_chapters
from tally_workbook_content import generate_workbook_typst
from tally_vault_and_blueprint import generate_vault_typst, generate_blueprint_typst
from tally_tds_workbook import generate_tds_workbook_typst

print("[1/7] Loading content dictionaries...")
eng_chapters = get_english_chapters()
hi_chapters = get_hindi_chapters()
gu_chapters = get_gujarati_chapters()
print(f"      Loaded {len(eng_chapters)} Eng, {len(hi_chapters)} Hi, {len(gu_chapters)} Gu chapters.")

# Helper to assemble a master book typst file
def assemble_master_book(lang="en"):
    if lang == "en":
        title = "TALLY PRIME WITH GST & CORPORATE ACCOUNTING"
        sub = "Double Entry Bookkeeping · 28 Predefined Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Commercial Invoices"
        cover_call = """#rtech-tally-cover(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  subtitle: "Double Entry Bookkeeping · 28 Predefined Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Commercial Invoices",
  edition: "2027 MASTER COMMERCIAL EDITION · EDITION 1",
  series-pill: "OFFICIAL RTECHLAB & IANT CERTIFIED PUBLICATION",
  author: "Rahul Patel",
  author-title: "Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab",
  lang-tag: "ENGLISH MASTER EDITION",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png"
)"""
        chapters = eng_chapters
        intro_block = """
= Course Architecture & 11-Topic Curriculum Roadmap

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 9pt,
  [
    #text(weight: "bold", size: 8.8pt, fill: rgb("#0F766E"))[ACADEMIC PUBLICATION & STATUTORY COMPLIANCE GUARANTEE:]\\
    This master curriculum is standardized by RTechLab and IANT Palanpur to bridge the gap between academic theory and real-world corporate accounting. Designed for commerce students, CA articles, and corporate accounts executives, every chapter is verified against the latest Tally Prime 4.x/5.x engine, the statutory GST portal requirements, and Income Tax TDS regulations.
  ]
)

#v(6pt)

#table(
  columns: (0.7fr, 2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[Topic]], [#text(weight: "bold", fill: white)[Curriculum Domain]], [#text(weight: "bold", fill: white)[Core Practical Learning Outcomes]],
  [Topic 01], [History of Tally & Licensing], [Bharat Goenka, 80% market share, download from tallysolutions.com, Silver/Gold/Edu mode],
  [Topic 02], [What is Tally Prime & Architecture], [Cactus in-memory DB, Top menu (Alt+K/Y/Z/O/E/M/P), Go To (Alt+G) multi-tasking],
  [Topic 03], [Comprehensive GST & TDS Foundation], [CGST+SGST vs IGST, 0% Exempt, 5% Essentials, 18% Standard slabs, Sec 194C/J/I/H, 26Q],
  [Topic 04], [Ledgers, Accounts & Golden Rules], [Personal, Real & Nominal accounts, Luca Pacioli rules, 20+ practical Dr/Cr proofs],
  [Topic 05], [Vouchers & 4 Main Categories], [Accounting, Inventory, Order & Memo categories, 24 vouchers with shortcuts],
  [Topic 06], [Groups & Complete Ledger Mapping], [15 Primary + 13 Secondary groups, 50+ real account mappings (Salman, HDFC, Taxes)],
  [Topic 07], [Company & Step-by-Step Creation], [Company creation, Gujarat Code 24, FY beginning, Tally Vault, F11 Features & F12 Config],
  [Topic 08], [Types of Business Organizations], [Trading concerns (Unjha Mandi), Manufacturing (Morbi Ceramics), Service providers],
  [Topic 09], [Practical Commercial Invoices], [Inventory Invoices (Item Mode) vs Accounting Invoices (Service Mode, Ctrl+H)],
  [Topic 10], [Master Keyboard Shortcuts (40+)], [General navigation, master alteration, voucher shortcuts, and reporting speeds],
  [Topic 11], [Corporate Bridge Highlights], [GST portal returns (GSTR-1/3B/2B), BRS bank reconciliation, Cost Centres, Splitting]
)
"""
    elif lang == "hi":
        title = "टैली प्राइम विद जीएसटी एवं कॉर्पोरेट अकाउंटिंग"
        sub = "डबल एंट्री बुककीपिंग · 28 पूर्व-निर्धारित ग्रुप्स · 24 वाउचर्स · आधुनिक जीएसटी स्लैब्स (0%, 5%, 18%) · टीडीएस · 50 प्रैक्टिकल इनवॉइस"
        cover_call = """#rtech-tally-cover-hi(
  title: "टैली प्राइम विद जीएसटी एवं कॉर्पोरेट अकाउंटिंग",
  subtitle: "डबल एंट्री बुककीपिंग · 28 पूर्व-निर्धारित ग्रुप्स · 24 वाउचर्स · आधुनिक जीएसटी स्लैब्स (0%, 5%, 18%) · टीडीएस · 50 प्रैक्टिकल इनवॉइस",
  edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1",
  series-pill: "ऑफिशियल आरटेक लैब एवं आईएएनटी प्रमाणित प्रकाशन",
  author: "राहुल पटेल",
  author-title: "लीड कॉर्पोरेट अकाउंटिंग ट्रेनर, IANT पालनपुर | फाउंडर, RTechLab",
  lang-tag: "हिंदी मास्टर एडिशन (HINDI COMPLETE EDITION)",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png"
)"""
        chapters = hi_chapters
        intro_block = """
= पाठ्यक्रम संरचना एवं संपूर्ण 11-विषय अध्ययन मार्गदर्शिका

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 9pt,
  [
    #text(weight: "bold", size: 8.8pt, fill: rgb("#0F766E"))[आधिकारिक संस्थागत प्रकाशन एवं वैधानिक प्रमाणन:]\\
    यह संपूर्ण हैंडबुक आरटेक लैब एवं आईएएनटी पालनपुर द्वारा सैद्धांतिक पढ़ाई और आधुनिक कॉरपोरेट जगत के बीच के अंतर को समाप्त करने हेतु तैयार की गई है। इसमें कॉमर्स विद्यार्थियों, सीए आर्टिकल्स और अकाउंटेंट्स हेतु टैली प्राइम 4.x/5.x, जीएसटी पोर्टल एवं आयकर टीडीएस नियमों के शत-प्रतिशत व्यावहारिक सिद्धांतों को समाहित किया गया है।
  ]
)

#v(6pt)

#table(
  columns: (0.7fr, 2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[विषय]], [#text(weight: "bold", fill: white)[पाठ्यक्रम क्षेत्र]], [#text(weight: "bold", fill: white)[व्यावहारिक अध्ययन एवं दक्षता लक्ष्य]],
  [विषय 01], [टैली का इतिहास एवं डाउनलोडिंग], [भरत गोयनका, 80% बाजार हिस्सेदारी, tallysolutions.com से डाउनलोड, सिल्वर/गोल्ड/एजुकेशन],
  [विषय 02], [टैली प्राइम एवं सिस्टम आर्किटेक्चर], [कैक्टस इन-मेमोरी डेटाबेस, टॉप मेनू (Alt+K/Y/Z/O/E/M/P), गो-टू (Alt+G) मल्टीटास्किंग],
  [विषय 03], [संपूर्ण जीएसटी एवं टीडीएस आधारशिला], [CGST+SGST बनाम IGST, 0% मुक्त, 5% आवश्यक, 18% मानक स्लैब्स, धारा 194C/J/I/H, 26Q],
  [विषय 04], [लेजर, खाते एवं सुनहरे नियम], [व्यक्तिगत, वास्तविक, नाममात्र खाते, ल्यूका पैसिओली नियम, 20+ व्यावहारिक Dr/Cr प्रमाण],
  [विषय 05], [वाउचर्स एवं 4 प्रमुख श्रेणियां], [एकाउंटिंग, इन्वेंटरी, ऑर्डर एवं मेमो श्रेणियां, 24 वाउचर्स मय शॉर्टकट्स],
  [विषय 06], [ग्रुप्स एवं संपूर्ण लेजर मैपिंग], [15 प्राथमिक + 13 द्वितीयक ग्रुप्स, 50+ व्यावहारिक लेजर मैपिंग (सलमान, बैंक, टैक्स)],
  [विषय 07], [कंपनी निर्माण चरणबद्ध प्रक्रिया], [कंपनी निर्माण, गुजरात कोड 24, वित्तीय वर्ष, टैली वॉल्ट, F11 फीचर्स व F12 सेटअप],
  [विषय 08], [व्यावसायिक संगठनों के प्रकार], [ट्रेडिंग फर्में (ऊंझा मंडी), मैन्युफैक्चरिंग (मोरबी सिरामिक्स), सर्विस सेक्टर],
  [विषय 09], [प्रैक्टिकल इनवॉइस निर्माण], [इन्वेंटरी इनवॉइस (Item Mode) बनाम एकाउंटिंग इनवॉइस (Service Mode, Ctrl+H)],
  [विषय 10], [मास्टर कीबोर्ड शॉर्टकट्स (40+)], [सामान्य नेविगेशन, वाउचर एंट्री, लेजर सुधार व उच्च गति रिपोर्टिंग],
  [विषय 11], [कॉरपोरेट ब्रिज विषय], [GSTR-1/3B/2B मिलान, बैंक समाधान (BRS), कॉस्ट सेंटर एवं वर्ष विभाजन (Split)]
)
"""
    else: # gujarati
        title = "ટેલી પ્રાઇમ વિથ જીએસટી અને કોર્પોરેટ એકાઉન્ટિંગ"
        sub = "ડબલ એન્ટ્રી બુકકીપિંગ · 28 પૂર્વ-નિર્ધારિત ગ્રુપ્સ · 24 વાઉચર્સ · આધુનિક જીએસટી સ્લેબ્સ (0%, 5%, 18%) · ટીડીએસ · 50 પ્રેક્ટિકલ ઇનવોઇસ"
        cover_call = """#rtech-tally-cover-gu(
  title: "ટેલી પ્રાઇમ વિથ જીએસટી અને કોર્પોરેટ એકાઉન્ટિંગ",
  subtitle: "ડબલ એન્ટ્રી બુકકીપિંગ · 28 પૂર્વ-નિર્ધારિત ગ્રુપ્સ · 24 વાઉચર્સ · આધુનિક જીએસટી સ્લેબ્સ (0%, 5%, 18%) · ટીડીએસ · 50 પ્રેક્ટિકલ ઇનવોઇસ",
  edition: "2027 માસ્ટર કોમર્શિયલ આવૃત્તિ · એડિશન 1",
  series-pill: "ઓફિશિયલ આરટેક લેબ અને આઇએએનટી પ્રમાણિત પ્રકાશન",
  author: "રાહુલ પટેલ",
  author-title: "લીડ કોર્પોરેટ એકાઉન્ટિંગ ટ્રેનર, IANT પાલનપુર | ફાઉન્ડર, RTechLab",
  lang-tag: "ગુજરાતી માસ્ટર એડિશન (GUJARATI COMPLETE EDITION)",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png"
)"""
        chapters = gu_chapters
        intro_block = """
= અભ્યાસક્રમ માળખું અને સંપૂર્ણ 11-વિષય માર્ગદર્શિકા

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 9pt,
  [
    #text(weight: "bold", size: 8.8pt, fill: rgb("#0F766E"))[સત્તાવાર સંસ્થાકીય પ્રકાશન અને પ્રમાણીકરણ:]\\
    આ સમગ્ર હેન્ડબુક આરટેક લેબ અને આઇએએનટી પાલનપુર દ્વારા સૈદ્ધાંતિક અભ્યાસ અને આધુનિક કોર્પોરેટ એકાઉન્ટિંગ વચ્ચેના અંતરને દૂર કરવા માટે તૈયાર કરવામાં આવી છે. કોમર્સ વિદ્યાર્થીઓ, સીએ આર્ટિકલ્સ અને એકાઉન્ટન્ટ્સ માટે ટેલી પ્રાઇમ 4.x/5.x, જીએસટી પોર્ટલ અને ઇન્કમટેક્સ ટીડીએસના 100% વ્યવહારુ નિયમો અહીં સામેલ છે.
  ]
)

#v(6pt)

#table(
  columns: (0.7fr, 2fr, 2.3fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[વિષય]], [#text(weight: "bold", fill: white)[અભ્યાસક્રમ ક્ષેત્ર]], [#text(weight: "bold", fill: white)[વ્યવહારુ શિક્ષણ અને સિદ્ધિ લક્ષ્યાંકો]],
  [વિષય 01], [ટેલીનો ઇતિહાસ અને લાયસન્સિંગ], [ભરત ગોયનકા, 80% બજાર હિસ્સો, tallysolutions.com પરથી ડાઉનલોડ, સિલ્વર/ગોલ્ડ/એજ્યુકેશન],
  [વિષય 02], [ટેલી પ્રાઇમ અને સિસ્ટમ આર્કિટેક્ચર], [કેક્ટસ ઇન-મેમરી ડેટાબેઝ, ટોપ મેનૂ (Alt+K/Y/Z/O/E/M/P), ગો-ટૂ (Alt+G) મલ્ટીટાસ્કિંગ],
  [વિષય 03], [સંપૂર્ણ જીએસટી અને ટીડીએસ પાયો], [CGST+SGST વિરુદ્ધ IGST, 0% કરમુક્ત, 5% આવશ્યક, 18% સ્ટાન્ડર્ડ સ્લેબ્સ, કલમ 194C/J/I/H, 26Q],
  [વિષય 04], [લેજર, ખાતા અને સુવર્ણ નિયમો], [વ્યક્તિગત, માલ-મિલકત, ઉપજ-ખર્ચ ખાતા, લ્યુકા પેસિઓલી નિયમો, 20+ વ્યવહારુ Dr/Cr પુરાવા],
  [વિષય 05], [વાઉચર્સ અને 4 મુખ્ય શ્રેણીઓ], [એકાઉન્ટિંગ, ઇન્વેન્ટરી, ઓર્ડર અને મેમો શ્રેણીઓ, 24 વાઉચર્સ અને શોર્ટકટ્સ],
  [વિષય 06], [ગ્રુપ્સ અને સંપૂર્ણ લેજર મેપિંગ], [15 પ્રાથમિક + 13 ગૌણ ગ્રુપ્સ, 50+ વાસ્તવિક લેજર મેપિંગ્સ (સલમાન, બેંક, ટેક્સ)],
  [વિષય 07], [કંપની બનાવવાની તબક્કાવાર રીત], [કંપની નિર્માણ, ગુજરાત કોડ 24, નાણાકીય વર્ષ, ટેલી વોલ્ટ, F11 ફીચર્સ અને F12 સેટઅપ],
  [વિષય 08], [વ્યાપારિક સંગઠનોના પ્રકારો], [ટ્રેડિંગ પેઢીઓ (ઊંઝા મંડી), મેન્યુફેક્ચરિંગ (મોરબી સિરામિક્સ), સર્વિસ પ્રોવાઇડર્સ],
  [વિષય 09], [પ્રેક્ટિકલ ઇનવોઇસિંગ પદ્ધતિ], [ઇન્વેન્ટરી ઇનવોઇસ (Item Mode) વિરુદ્ધ એકાઉન્ટિંગ ઇનવોઇસ (Service Mode, Ctrl+H)],
  [વિષય 10], [માસ્ટર કીબોર્ડ શોર્ટકટ્સ (40+)], [સામાન્ય નેવિગેશન, વાઉચર એન્ટ્રી, લેજર સુધારો અને ઝડપી રિપોર્ટિંગ],
  [વિષય 11], [કોર્પોરેટ બ્રિજ વિષયો], [GSTR-1/3B/2B મેળવણું, બેંક રિકન્સિલિયેશન (BRS), કોસ્ટ સેન્ટર્સ અને ડેટા સ્પ્લિટ (Split)]
)
"""

    typ_content = f"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-tally-cover
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-tally-cover-hi
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-tally-cover-gu

#set document(
  title: "{title}",
  author: "Rahul Patel"
)

// COVER PAGE
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
{cover_call}

#pagebreak()

// MASTER BOOK SETTINGS
#show: rtech-tally-book.with(
  title: "{title}",
  subtitle: "{sub}",
  author: "Rahul Patel",
  edition: "2027 Master Commercial Edition",
  lang: "{lang}"
)

{intro_block}

#v(14pt)
"""
    # Append all 11 topics with natural continuous flow (NO artificial pagebreaks!)
    for ch_idx in range(1, 12):
        if ch_idx in chapters:
            typ_content += f"\n{chapters[ch_idx].strip()}\n\n#v(14pt)\n"

    # Append Author's Final Mentorship & Motto Page on the VERY LAST PAGE
    typ_content += f'\n#pagebreak()\n#rtech-final-page(lang: "{lang}", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")\n'

    return typ_content

print("[2/7] Writing master Typst files...")

# English
eng_typ_path = os.path.join(ENG_SRC, "master_book_eng.typ")
with open(eng_typ_path, "w", encoding="utf-8") as f:
    f.write(assemble_master_book("en"))

# Hindi
hi_typ_path = os.path.join(HI_SRC, "master_book_hi.typ")
with open(hi_typ_path, "w", encoding="utf-8") as f:
    f.write(assemble_master_book("hi"))

# Gujarati
gu_typ_path = os.path.join(GU_SRC, "master_book_gu.typ")
with open(gu_typ_path, "w", encoding="utf-8") as f:
    f.write(assemble_master_book("gu"))

# Workbook
workbook_typ_path = os.path.join(WORKBOOK_OUT, "workbook.typ")
with open(workbook_typ_path, "w", encoding="utf-8") as f:
    f.write(generate_workbook_typst())

# Vault
vault_typ_path = os.path.join(VAULT_OUT, "vault.typ")
with open(vault_typ_path, "w", encoding="utf-8") as f:
    f.write(generate_vault_typst())

# Blueprint
blueprint_typ_path = os.path.join(VAULT_OUT, "blueprint.typ")
with open(blueprint_typ_path, "w", encoding="utf-8") as f:
    f.write(generate_blueprint_typst())

# TDS Workbook
tds_typ_path = os.path.join(WORKBOOK_OUT, "tds_workbook.typ")
with open(tds_typ_path, "w", encoding="utf-8") as f:
    f.write(generate_tds_workbook_typst())

print("      Typst source files written successfully.")

print("[3/7] Compiling PDFs with Typst...")

def compile_pdf(typ_path, pdf_path):
    print(f"      Compiling {os.path.basename(pdf_path)}...")
    res = subprocess.run(["typst", "compile", "--root", BASE_DIR, typ_path, pdf_path], capture_output=True, text=True)
    if res.returncode != 0:
        print(f"      [ERROR] Compilation failed for {typ_path}:")
        print(res.stderr)
        return False
    else:
        doc = fitz.open(pdf_path)
        print(f"      [OK] Generated {os.path.basename(pdf_path)} ({len(doc)} pages, {os.path.getsize(pdf_path)} bytes)")
        return True

# 1. English
eng_pdf = os.path.join(CORE_OUT, "Tally-Prime-English-Edition-1.pdf")
compile_pdf(eng_typ_path, eng_pdf)
shutil.copy2(eng_pdf, os.path.join(DOWNLOADS_DIR, "Tally-Prime-English-Edition-1.pdf"))

# 2. Hindi
hi_pdf = os.path.join(CORE_OUT, "Tally-Prime-Hindi-Edition-1.pdf")
compile_pdf(hi_typ_path, hi_pdf)
shutil.copy2(hi_pdf, os.path.join(DOWNLOADS_DIR, "Tally-Prime-Hindi-Edition-1.pdf"))

# 3. Gujarati
gu_pdf = os.path.join(CORE_OUT, "Tally-Prime-Gujarati-Edition-1.pdf")
compile_pdf(gu_typ_path, gu_pdf)
shutil.copy2(gu_pdf, os.path.join(DOWNLOADS_DIR, "Tally-Prime-Gujarati-Edition-1.pdf"))

# 4. Workbook
workbook_pdf = os.path.join(WORKBOOK_OUT, "Tally-50-Invoice-Commercial-Workbook.pdf")
compile_pdf(workbook_typ_path, workbook_pdf)
shutil.copy2(workbook_pdf, os.path.join(DOWNLOADS_DIR, "Tally-50-Invoice-Commercial-Workbook.pdf"))

# 5. Vault
vault_pdf = os.path.join(VAULT_OUT, "Tally-Top-50-Accountant-Interview-Vault.pdf")
compile_pdf(vault_typ_path, vault_pdf)
shutil.copy2(vault_pdf, os.path.join(DOWNLOADS_DIR, "Tally-Top-50-Accountant-Interview-Vault.pdf"))

# 6. Blueprint
blueprint_pdf = os.path.join(VAULT_OUT, "Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf")
compile_pdf(blueprint_typ_path, blueprint_pdf)
shutil.copy2(blueprint_pdf, os.path.join(DOWNLOADS_DIR, "Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf"))

# 7. TDS Workbook
tds_pdf = os.path.join(WORKBOOK_OUT, "Tally-TDS-and-Form-26Q-Practice-Workbook.pdf")
compile_pdf(tds_typ_path, tds_pdf)
shutil.copy2(tds_pdf, os.path.join(DOWNLOADS_DIR, "Tally-TDS-and-Form-26Q-Practice-Workbook.pdf"))

print("[4/7] Generating 5-Page Preview PDFs for Storefront Modal (EN, HI, GU)...")
# Hindi Preview
preview_hi = os.path.join(DOWNLOADS_DIR, "Tally-Prime-Hindi-Edition-1-5Page-Preview.pdf")
doc_hi = fitz.open(hi_pdf)
prev_hi_doc = fitz.open()
for p in range(min(5, len(doc_hi))):
    prev_hi_doc.insert_pdf(doc_hi, from_page=p, to_page=p)
prev_hi_doc.save(preview_hi)

# English Preview
preview_en = os.path.join(DOWNLOADS_DIR, "Tally-Prime-English-Edition-1-5Page-Preview.pdf")
doc_en = fitz.open(eng_pdf)
prev_en_doc = fitz.open()
for p in range(min(5, len(doc_en))):
    prev_en_doc.insert_pdf(doc_en, from_page=p, to_page=p)
prev_en_doc.save(preview_en)

# Gujarati Preview
preview_gu = os.path.join(DOWNLOADS_DIR, "Tally-Prime-Gujarati-Edition-1-5Page-Preview.pdf")
doc_gu = fitz.open(gu_pdf)
prev_gu_doc = fitz.open()
for p in range(min(5, len(doc_gu))):
    prev_gu_doc.insert_pdf(doc_gu, from_page=p, to_page=p)
prev_gu_doc.save(preview_gu)

print("      [OK] Previews generated for Hindi, English, and Gujarati.")

print("[5/7] Packaging 1-Click Career Accelerator ZIP Bundle...")
bundle_zip = os.path.join(DOWNLOADS_DIR, "Tally-Prime-Career-Accelerator-Bundle.zip")

# Create a clean student readme
readme_path = os.path.join(DOWNLOADS_DIR, "README_RTECHLAB_STUDENT.txt")
with open(readme_path, "w", encoding="utf-8") as f:
    f.write("""=============================================================================
RTECHLAB OFFICIAL TALLY PRIME & CORPORATE ACCOUNTING ACCELERATOR SUITE
=============================================================================
Author: Rahul Patel (Founder, RTechLab · Master Corporate Trainer, IANT Palanpur)
Official Portal: https://rtechlab.vercel.app | Support Desk: rahul.28e1@gmail.com
Edition: 2027 Master Commercial Edition (Edition 1)

CONGRATULATIONS ON ACQUIRING THE COMPLETE TALLY PRIME ACCELERATOR SUITE!
This complete suite includes:

1. Tally-Prime-English-Edition-1.pdf (Core Master Guide - English Edition)
2. Tally-Prime-Hindi-Edition-1.pdf (Core Master Guide - Hindi Edition)
3. Tally-Prime-Gujarati-Edition-1.pdf (Core Master Guide - Gujarati Edition / ગુજરાતી આવૃત્તિ)
4. Tally-50-Invoice-Commercial-Workbook.pdf (50 Real APMC, Electronics, B2B & TDS Invoices)
5. Tally-TDS-and-Form-26Q-Practice-Workbook.pdf (Advanced TDS & Form 26Q Practice Set)
6. Tally-Top-50-Accountant-Interview-Vault.pdf (MNC & Big-4 Interview Q&A)
7. Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf (Salary Slabs & Freelance Practice)

LIFETIME ACCESS & MENTORSHIP GUARANTEE:
As an official RTechLab student, you receive lifetime free edition updates whenever
the GST Council modifies tax slabs or Tally releases new major software versions.
Direct Mentorship: rahuliantpln@gmail.com · rahul.28e1@gmail.com
=============================================================================
""")

with zipfile.ZipFile(bundle_zip, 'w', zipfile.ZIP_DEFLATED) as z:
    z.write(os.path.join(DOWNLOADS_DIR, "Tally-Prime-English-Edition-1.pdf"), arcname="01_CORE_GUIDES/Tally-Prime-English-Edition-1.pdf")
    z.write(os.path.join(DOWNLOADS_DIR, "Tally-Prime-Hindi-Edition-1.pdf"), arcname="01_CORE_GUIDES/Tally-Prime-Hindi-Edition-1.pdf")
    z.write(os.path.join(DOWNLOADS_DIR, "Tally-Prime-Gujarati-Edition-1.pdf"), arcname="01_CORE_GUIDES/Tally-Prime-Gujarati-Edition-1.pdf")
    z.write(os.path.join(DOWNLOADS_DIR, "Tally-50-Invoice-Commercial-Workbook.pdf"), arcname="02_PRACTICAL_WORKBOOK/Tally-50-Invoice-Commercial-Workbook.pdf")
    z.write(os.path.join(DOWNLOADS_DIR, "Tally-TDS-and-Form-26Q-Practice-Workbook.pdf"), arcname="02_PRACTICAL_WORKBOOK/Tally-TDS-and-Form-26Q-Practice-Workbook.pdf")
    z.write(os.path.join(DOWNLOADS_DIR, "Tally-Top-50-Accountant-Interview-Vault.pdf"), arcname="03_INTERVIEW_AND_CAREER/Tally-Top-50-Accountant-Interview-Vault.pdf")
    z.write(os.path.join(DOWNLOADS_DIR, "Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf"), arcname="03_INTERVIEW_AND_CAREER/Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf")
    z.write(readme_path, arcname="README_RTECHLAB_STUDENT.txt")

print(f"      [OK] Bundle ZIP created ({os.path.getsize(bundle_zip)} bytes)")

print("[6/7] Verifying all generated downloads in public/downloads/:")
for f in [
    "Tally-Prime-English-Edition-1.pdf",
    "Tally-Prime-Hindi-Edition-1.pdf",
    "Tally-Prime-Gujarati-Edition-1.pdf",
    "Tally-50-Invoice-Commercial-Workbook.pdf",
    "Tally-TDS-and-Form-26Q-Practice-Workbook.pdf",
    "Tally-Top-50-Accountant-Interview-Vault.pdf",
    "Tally-Accountant-Career-Salary-Blueprint-Edition-1.pdf",
    "Tally-Prime-Hindi-Edition-1-5Page-Preview.pdf",
    "Tally-Prime-English-Edition-1-5Page-Preview.pdf",
    "Tally-Prime-Gujarati-Edition-1-5Page-Preview.pdf",
    "Tally-Prime-Career-Accelerator-Bundle.zip"
]:
    p = os.path.join(DOWNLOADS_DIR, f)
    if os.path.exists(p):
        print(f"      - {f}: {os.path.getsize(p):,} bytes")
    else:
        print(f"      [MISSING] {f}")

print("[7/7] All Tally Prime publishing assets built and verified successfully!")
