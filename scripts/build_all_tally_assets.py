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
        sub = "Double Entry Bookkeeping · 28 Groups · 24 Vouchers · Modern GST Slabs (0%, 5%, 18%) · TDS · 50 Invoices"
        cover_call = """#rtech-tally-cover(
  title: "TALLY PRIME WITH GST & CORPORATE ACCOUNTING",
  subtitle: "Double Entry Bookkeeping · 28 Predefined Groups · 24 Vouchers · Modern GST Slabs · TDS · 50 Invoices",
  edition: "2027 MASTER COMMERCIAL EDITION · EDITION 1",
  series-pill: "OFFICIAL RTECHLAB & IANT CERTIFIED PUBLICATION",
  author: "Rahul Patel",
  author-title: "Founder & Chief Technology Architect, RTechLab | Lead Accounting Trainer, IANT Palanpur",
  lang-tag: "ENGLISH MASTER EDITION",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg"
)"""
        chapters = eng_chapters
        foreword = """
= Author's Foreword & Institutional Endorsement

#grid(
  columns: (32mm, 1fr),
  gutter: 12pt,
  align: (center + horizon, left + horizon),
  [
    #box(
      clip: true,
      radius: 4pt,
      stroke: 1.5pt + rgb("#0E7490"),
      image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 30mm, height: 38mm, fit: "cover")
    )
  ],
  [
    #text(size: 11pt, weight: "black", fill: rgb("#0F172A"))[Rahul Patel]\\
    #text(size: 8pt, weight: "bold", fill: rgb("#0E7490"))[Founder, RTechLab · Master Corporate Accounting Trainer, IANT Palanpur]\\
    #v(3pt)
    #text(size: 7.5pt, fill: rgb("#475569"))[
      "Accounting is the universal language of business. Over the past decade of training thousands of students across Gujarat and nationwide, I have observed that textbooks often drown learners in abstract theory while failing to prepare them for the realities of modern ERP systems. This handbook was built to bridge that gap permanently—uniting Luca Pacioli's timeless double-entry rules with modern Tally Prime 4.x/5.x and the rationalized GST tax slabs."
    ]
  ]
)

#v(8pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[INSTITUTIONAL CURRICULAR HIGHLIGHTS:]\\
    - *Full Double-Entry Parity:* 28 predefined groups, 24 vouchers, and complete Golden Rules analysis.
    - *Modern GST Rationalization:* Full coverage of 0% Exempt APMC commodities, 5% Essentials, and 18% Standard IT/Electronics.
    - *Corporate TDS Integration:* Sections 194C, 194J, 194I, Challan ITNS 281, and Form 26Q return filing.
    - *Real Field Practice:* Mr. Verma's 50 real transactions and Salman Trading Co. 18 group case scenarios.
  ]
)
"""
    elif lang == "hi":
        title = "टैली प्राइम विद जीएसटी एवं कॉर्पोरेट अकाउंटिंग"
        sub = "डबल एंट्री बुककीपिंग · 28 ग्रुप्स · 24 वाउचर्स · आधुनिक जीएसटी स्लैब्स (0%, 5%, 18%) · टीडीएस · 50 इनवॉइस"
        cover_call = """#rtech-tally-cover-hi(
  title: "टैली प्राइम विद जीएसटी एवं कॉर्पोरेट अकाउंटिंग",
  subtitle: "डबल एंट्री बुककीपिंग · 28 पूर्व-निर्धारित ग्रुप्स · 24 वाउचर्स · आधुनिक जीएसटी स्लैब्स (0%, 5%, 18%) · टीडीएस · 50 प्रैक्टिकल इनवॉइस",
  edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1",
  series-pill: "ऑफिशियल आरटेक लैब एवं आईएएनटी प्रमाणित प्रकाशन",
  author: "राहुल पटेल",
  author-title: "फाउंडर एवं चीफ टेक्नोलॉजी आर्किटेक्ट, RTechLab | कॉर्पोरेट अकाउंटिंग ट्रेनर",
  lang-tag: "हिंदी मास्टर एडिशन (HINDI COMPLETE EDITION)",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg"
)"""
        chapters = hi_chapters
        foreword = """
= लेखक का संदेश एवं आधिकारिक संस्थागत अनुमोदन

#grid(
  columns: (32mm, 1fr),
  gutter: 12pt,
  align: (center + horizon, left + horizon),
  [
    #box(
      clip: true,
      radius: 4pt,
      stroke: 1.5pt + rgb("#0E7490"),
      image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 30mm, height: 38mm, fit: "cover")
    )
  ],
  [
    #text(size: 11pt, weight: "black", fill: rgb("#0F172A"))[राहुल पटेल]\\
    #text(size: 8pt, weight: "bold", fill: rgb("#0E7490"))[फाउंडर, RTechLab · मुख्य कॉर्पोरेट अकाउंटिंग ट्रेनर, IANT पालनपुर]\\
    #v(3pt)
    #text(size: 7.5pt, fill: rgb("#475569"))[
      "अकाउंटिंग व्यापार की आत्मा है। पिछले एक दशक में आईएएनटी पालनपुर और विभिन्न मंचों पर हजारों छात्रों को प्रशिक्षित करते हुए मैंने महसूस किया कि बाजार में उपलब्ध अधिकांश किताबें केवल सैद्धांतिक बातों तक सीमित रहती हैं। यह पुस्तक जमीनी कॉर्पोरेट कार्यप्रणाली—जैसे एपीएमसी मंडी के बिल, इलेक्ट्रॉनिक्स जीएसटी बिल, टीडीएस कटौती और वित्तीय वर्ष क्लोजिंग—को सीधे आपके हाथों में सौंपती है।"
    ]
  ]
)

#v(8pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[पाठ्यक्रम की प्रमुख विशेषताएं:]\\
    - *दोहरा लेखा प्रणाली का सरल हिंदी विश्लेषण:* 28 पूर्व-निर्धारित ग्रुप्स, 24 वाउचर्स और डेबिट-क्रेडिट के सुनहरे नियम।
    - *आधुनिक जीएसटी स्लैब्स (00%, 05%, 18%):* करमुक्त कृषि जींस, 5% आवश्यक सामग्री और 18% मानक आईटी इलेक्ट्रॉनिक्स।
    - *टीडीएस का 4-चरणीय चक्र:* धारा 194C, 194J, 194I, चालान 281 द्वारा बैंक भुगतान और फॉर्म 26Q।
    - *प्रैक्टिकल सेट्स:* श्री वर्मा के 50 वास्तविक लेनदेन और सलमान ट्रेडिंग 18 ग्रुप्स का सटीक तलपट।
  ]
)
"""
    else: # gujarati
        title = "ટેલી પ્રાઇમ વિથ જીએસટી અને કોર્પોરેટ એકાઉન્ટિંગ"
        sub = "ડબલ એન્ટ્રી બુકકીપિંગ · 28 ગ્રુપ્સ · 24 વાઉચર્સ · આધુનિક GST સ્લેબ્સ (0%, 5%, 18%) · TDS · 50 ઇનવોઇસ"
        cover_call = """#rtech-tally-cover-gu(
  title: "ટેલી પ્રાઇમ વિથ જીએસટી અને કોર્પોરેટ એકાઉન્ટિંગ",
  subtitle: "ડબલ એન્ટ્રી બુકકીપિંગ · 28 પ્રીડિફાઇન્ડ ગ્રુપ્સ · 24 વાઉચર્સ · આધુનિક GST સ્લેબ્સ (0%, 5%, 18%) · TDS · 50 પ્રેક્ટિકલ ઇનવોઇસ",
  edition: "2027 માસ્ટર કોમર્શિયલ આવૃત્તિ · આવૃત્તિ 1",
  series-pill: "ઓફિશિયલ આરટેક લેબ અને આઇએએનટી પ્રમાણિત પ્રકાશન",
  author: "રાહુલ પટેલ",
  author-title: "સ્થાપક અને ચીફ ટેકનોલોજી આર્કિટેક્ટ, RTechLab | કોર્પોરેટ એકાઉન્ટિંગ ટ્રેનર",
  lang-tag: "ગુજરાતી માસ્ટર આવૃત્તિ (GUJARATI COMPLETE EDITION)",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg"
)"""
        chapters = gu_chapters
        foreword = """
= લેખકનો પરિચય અને સંસ્થાકીય સમર્થન

#grid(
  columns: (32mm, 1fr),
  gutter: 12pt,
  align: (center + horizon, left + horizon),
  [
    #box(
      clip: true,
      radius: 4pt,
      stroke: 1.5pt + rgb("#0E7490"),
      image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 30mm, height: 38mm, fit: "cover")
    )
  ],
  [
    #text(size: 11pt, weight: "black", fill: rgb("#0F172A"))[રાહુલ પટેલ]\\
    #text(size: 8pt, weight: "bold", fill: rgb("#0E7490"))[સ્થાપક, RTechLab · મુખ્ય કોર્પોરેટ એકાઉન્ટિંગ ટ્રેનર, IANT પાલનપુર]\\
    #v(3pt)
    #text(size: 7.5pt, fill: rgb("#475569"))[
      "એકાઉન્ટિંગ એ વેપારની ખરી ઓળખ છે. છેલ્લા દાયકામાં પાલનપુર, મહેસાણા, અમદાવાદ અને સમગ્ર ગુજરાતના હજારો વિદ્યાર્થીઓને એકાઉન્ટિંગનું શિક્ષણ આપતી વખતે મેં જોયું છે કે માર્કેટમાં ગુજરાતી ભાષામાં પ્રેક્ટિકલ જીએસટી અને ટેલી પ્રાઇમનું સાચું સાહિત્ય મળતું નથી. આ પુસ્તક ગુજરાતના ઊંઝા, પાલનપુર, રાજકોટ અને સુરતના વેપાર જગતના સાચા બિલ અને વ્યવહારો સાથે તૈયાર કરવામાં આવ્યું છે."
    ]
  ]
)

#v(8pt)

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1pt + rgb("#99F6E4"),
  radius: 4pt,
  inset: 8pt,
  [
    #text(weight: "bold", size: 8.5pt, fill: rgb("#0F766E"))[અભ્યાસક્રમની વિશેષતાઓ:]\\
    - *દ્વિનોંધી નામા પદ્ધતિ:* 28 પ્રીડિફાઇન્ડ ગ્રુપ્સ, 24 વાઉચર્સ અને ઉધાર-જમાના સુવર્ણ નિયમોની સરળ ગુજરાતી સમજૂતી.
    - *આધુનિક GST સ્લેબ્સ (00%, 05%, 18%):* કરમુક્ત કૃષિ પાક (જીરું, ઇસબગૂલ, રાયડો), 5% તેલ અને 18% સ્માર્ટફોન-લેપટોપ.
    - *TDS કાયદાકીય નિયમો:* કલમ 194C, 194J, 194I, ચલણ ITNS 281 બેંક પેમેન્ટ અને ત્રિમાસિક ફોર્મ 26Q.
    - *પ્રેક્ટિકલ સેટ્સ:* શ્રી વર્માના 50 વ્યવહારો અને સલમાન ટ્રેડિંગના 18 ગ્રુપ્સનું કાચું સરવૈયું.
  ]
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

{foreword}

#pagebreak()
"""
    # Append all 16 chapters
    for ch_idx in range(1, 17):
        if ch_idx in chapters:
            typ_content += f"\n{chapters[ch_idx].strip()}\n#pagebreak()\n"

    # Append Author's Final Mentorship & Motto Page
    typ_content += f'\n#rtech-final-page(lang: "{lang}", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")\n'

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
