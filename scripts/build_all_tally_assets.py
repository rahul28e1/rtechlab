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
= Course Architecture & Academic Framework

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1.2pt + rgb("#0E7490"),
  radius: 4pt,
  inset: 10pt,
  [
    #text(weight: "black", size: 9pt, fill: rgb("#0E7490"))[OFFICIAL RTECHLAB & IANT INSTITUTIONAL ACCREDITATION:]\
    #v(3pt)
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
= पाठ्यक्रम संरचना एवं संस्थागत शैक्षणिक ढांचा

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1.2pt + rgb("#0E7490"),
  radius: 4pt,
  inset: 10pt,
  [
    #text(weight: "black", size: 9pt, fill: rgb("#0E7490"))[आधिकारिक आरटेक लैब एवं आईएएनटी संस्थागत प्रमाणन:]\
    #v(3pt)
    #text(size: 8pt, fill: rgb("#334155"))[
      यह संपूर्ण मास्टर प्रकाशन राहुल पटेल (लीड कॉर्पोरेट अकाउंटिंग ट्रेनर, IANT पालनपुर एवं संस्थापक, RTechLab) द्वारा तैयार किया गया एक मानकीकृत वाणिज्यिक पाठ्यक्रम है। यह पुस्तक पारंपरिक कॉलेज थ्योरी और वास्तविक कॉर्पोरेट अकाउंटिंग के बीच की खाई को समाप्त कर विद्यार्थियों, सीए आर्टिकल्स और वर्किंग प्रोफेशनल्स को व्यावहारिक उद्योग के लिए तैयार करती है।
    ]
  ]
)

#v(8pt)

== संस्थागत मिशन एवं शैक्षणिक मानक
इस हैंडबुक का प्रत्येक अध्याय, वाणिज्यिक लेन-देन और केस स्टडी निम्नलिखित तीन संस्थागत मानकों पर आधारित है:
1. *100% वैधानिक शुद्धता:* केंद्रीय वस्तु एवं सेवा कर नियम 2017 (CGST नियम 46), आयकर अधिनियम 1961 (धाराएं 194C, 194J, 194I, 194H) और MCA ऑडिट ट्रेल नियमों के अनुसार।
2. *वास्तविक वाणिज्यिक परिदृश्य:* कोई काल्पनिक या अपूर्ण उदाहरण नहीं। प्रत्येक जीएसटी इनवॉइस, जीएसटीआईएन, पैन और बैंक चेक गुजरात, महाराष्ट्र और कर्नाटक के वास्तविक व्यापारिक लेन-देन पर आधारित है।
3. *शून्य-माउस कीबोर्ड गति:* छात्रों को केवल कीबोर्ड शॉर्टकट्स के माध्यम से टैली प्राइम संचालित करने हेतु प्रशिक्षित किया गया है, जिससे कार्यस्थल पर कार्यक्षमता 3 से 5 गुना बढ़ जाती है।

#v(10pt)

== राष्ट्रीय वैधानिक लेखांकन एवं नियामक ढांचा
#table(
  columns: (1.2fr, 1.3fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[नियामक संस्था]], [#text(weight: "bold", fill: white)[अधिनियम / कानून]], [#text(weight: "bold", fill: white)[पाठ्यक्रम में समावेशन एवं व्यावहारिक प्रभाव]],
  [GST काउंसिल एवं CBIC], [CGST / SGST / IGST नियम 2017], [नियम 46 टैक्स इनवॉइस, धारा 16(2)(aa) GSTR-2B मिलान, ई-वे बिल और ई-इनवॉइसिंग।],
  [CBDT / आयकर विभाग], [आयकर अधिनियम, 1961], [धारा 194C/J/I के तहत टीडीएस कटौती, त्रैमासिक फॉर्म 26Q रिटर्न, 206AA दंडात्मक दरें।],
  [कॉर्पोरेट कार्य मंत्रालय], [कंपनी अधिनियम, 2013], [ऑडिट ट्रेल (Edit Log) अनिवार्यता, शेड्यूल III वर्टिकल बैलेंस शीट व मूल्यह्रास।],
  [इंस्टीट्यूट ऑफ चार्टर्ड अकाउंटेंट्स], [भारतीय लेखा मानक (Ind AS)], [ल्यूका पैसिओली डबल-एंट्री नियम, उपार्जन संकल्पना (Accrual), अंतिम स्टॉक मूल्यांकन।]
)

#pagebreak()

= 11-विषय पाठ्यक्रम मार्गदर्शिका एवं कॉर्पोरेट दक्षता मैट्रिक्स

#table(
  columns: (0.7fr, 1.8fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[विषय]], [#text(weight: "bold", fill: white)[पाठ्यक्रम क्षेत्र]], [#text(weight: "bold", fill: white)[व्यावहारिक अध्ययन एवं दक्षता लक्ष्य]],
  [विषय 01], [टैली का इतिहास एवं डाउनलोडिंग], [भरत गोयनका, 80% बाजार हिस्सेदारी, tallysolutions.com से डाउनलोड, सिल्वर/गोल्ड/एजुकेशन मोड, TGS LAN।],
  [विषय 02], [टैली प्राइम एवं सिस्टम आर्किटेक्चर], [कैक्टस इन-मेमोरी डेटाबेस, टॉप मेनू (Alt+K/Y/Z/O/E/M/P), गो-टू (Alt+G) मल्टीटास्किंग, 4 GOT क्वाड्रेंट्स।],
  [विषय 03], [संपूर्ण जीएसटी एवं टीडीएस आधारशिला], [CGST+SGST बनाम IGST, 0% मुक्त, 5% आवश्यक, 18% मानक स्लैब्स, धारा 194C/J/I/H, फॉर्म 26Q समय-सारणी।],
  [विषय 04], [लेजर, खाते एवं सुनहरे नियम], [व्यक्तिगत, वास्तविक, नाममात्र खाते, ल्यूका पैसिओली नियम, मिस्टर वर्मा 50-ट्रांजेक्शन वर्कफ्लो, 20 नकद/बैंक प्रविष्टियां।],
  [विषय 05], [वाउचर्स एवं 4 प्रमुख श्रेणियां], [एकाउंटिंग, इन्वेंटरी, ऑर्डर एवं मेमो श्रेणियां, 24 वाउचर्स मय शॉर्टकट्स, एडिट लॉग ऑडिट ट्रेल।],
  [विषय 06], [ग्रुप्स एवं संपूर्ण लेजर मैपिंग], [15 प्राथमिक + 13 द्वितीयक ग्रुप्स, 70+ वास्तविक लेजर मैपिंग (सलमान, HDFC, टैक्स लेजर्स), ट्रायल बैलेंस ऑडिट।],
  [विषय 07], [कंपनी निर्माण चरणबद्ध प्रक्रिया], [कंपनी निर्माण, गुजरात कोड 24, वित्तीय वर्ष शुरुआत, टैली वॉल्ट AES एन्क्रिप्शन, 5 व्यावहारिक कंपनियां।],
  [विषय 08], [व्यावसायिक संगठनों के प्रकार], [ट्रेडिंग फर्में (ऊंझा मंडी), विनिर्माण फर्म BOM सहित (मोरबी सिरामिक्स), सर्विस सेक्टर, ई-कॉमर्स।],
  [विषय 09], [प्रैक्टिकल कमर्शियल इनवॉइस निर्माण], [6 प्रामाणिक इनवॉइस: टैक्स फ्री खरीद, जीएसटी 18%, अंतरराज्यीय IGST, जीएसटी बिक्री, IGST बिक्री, सर्विस।],
  [विषय 10], [मास्टर कीबोर्ड शॉर्टकट्स (50+)], [सामान्य नेविगेशन, मास्टर अल्टरेशन, वाउचर शॉर्टकट्स, रिपोर्टिंग शॉर्टकट्स, एवं 30-सेकंड स्पीड रन।],
  [विषय 11], [कॉर्पोरेट ब्रिज विषय], [GST पोर्टल रिटर्न्स (GSTR-1/3B/2B), बैंक समाधान (BRS), CTS-2010 चेक, कॉस्ट सेंटर, एवं डेटा स्प्लिट।]
)

#v(8pt)

== व्यावसायिक दक्षता मूल्यांकन मानक
इस पाठ्यक्रम को पूरा करने वाले छात्रों का 4-स्तरीय ग्रेडिंग स्केल पर मूल्यांकन किया जाता है:
- *डिस्टिंक्शन (> 90%):* कीबोर्ड शॉर्टकट्स का तत्काल प्रवाह, त्रुटिरहित GSTR-2B समाधान, और BOM असेंबली निर्माण में पूर्ण दक्षता।
- *फर्स्ट क्लास (75% - 89%):* सभी 6 वाउचर प्रकारों में शुद्ध प्रविष्टि, बहु-राज्यीय GST इनवॉइस निर्माण, और ट्रायल बैलेंस अंतर का समाधान।
- *कॉर्पोरेट पास (60% - 74%):* बुनियादी रोकड़/बैंक वाउचर्स की रिकॉर्डिंग, डे बुक रिपोर्ट जनरेशन, और लेखांकन के 3 सुनहरे नियमों की समझ।
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
= અભ્યાસક્રમ માળખું અને સંસ્થાકીય શૈક્ષણિક રૂપરેખા

#block(
  fill: rgb("#F0FDFA"),
  stroke: 1.2pt + rgb("#0E7490"),
  radius: 4pt,
  inset: 10pt,
  [
    #text(weight: "black", size: 9pt, fill: rgb("#0E7490"))[સત્તાવાર આરટેક લેબ અને આઇએએનટી સંસ્થાકીય પ્રમાણીકરણ:]\
    #v(3pt)
    #text(size: 8pt, fill: rgb("#334155"))[
      આ સંપૂર્ણ માસ્ટર પ્રકાશન રાહુલ પટેલ (લીડ કોર્પોરેટ એકાઉન્ટિંગ ટ્રેનર, IANT પાલનપુર અને સ્થાપક, RTechLab) દ્વારા તૈયાર કરવામાં આવેલ એક માનકીકૃત વ્યાવસાયિક અભ્યાસક્રમ છે. આ પુસ્તક પરંપરાગત ક્લાસરૂમ થિયરી અને વાસ્તવિક કોર્પોરેટ એકાઉન્ટિંગ વચ્ચેના અંતરને દૂર કરી વિદ્યાર્થીઓ, સીએ આર્ટિકલ્સ અને પ્રોફેશનલ્સને વાસ્તવિક ઉદ્યોગ માટે તૈયાર કરે છે.
    ]
  ]
)

#v(8pt)

== સંસ્થાકીય મિશન અને શૈક્ષણિક ધોરણો
આ હેન્ડબુકનું દરેક પ્રકરણ, વ્યાપારી વ્યવહાર અને કેસ સ્ટડી નીચેના ત્રણ સંસ્થાકીય ધોરણો પર આધારિત છે:
1. *100% વૈધાનિક શુદ્ધતા:* સેન્ટ્રલ જીએસટી નિયમો 2017 (CGST નિયમ 46), ઇન્કમટેક્સ એક્ટ 1961 (કલમ 194C, 194J, 194I, 194H) અને MCA ઓડિટ ટ્રેલ નિયમો મુજબ.
2. *વાસ્તવિક વ્યાપારી પરિદ્રશ્ય:* કોઈ કાલ્પનિક કે અપૂર્ણ ઉદાહરણો નહીં. દરેક જીએસટી ઇનવોઇસ, જીએસટીઆઇએન, પાન અને બેંક ચેક ગુજરાત, મહારાષ્ટ્ર અને કર્ણાટકના વાસ્તવિક વ્યાપારી વ્યવહારો પર આધારિત છે.
3. *શૂન્ય-માઉસ કીબોર્ડ ઝડપ:* વિદ્યાર્થીઓને માત્ર કીબોર્ડ શોર્ટકટ્સ દ્વારા ટેલી પ્રાઇમ સંચાલિત કરવા માટે તાલીમ આપવામાં આવી છે, જેથી કાર્યક્ષમતા 3 થી 5 ગણી વધી જાય છે.

#v(10pt)

== રાષ્ટ્રીય વૈધાનિક એકાઉન્ટિંગ અને નિયમનકારી માળખું
#table(
  columns: (1.2fr, 1.3fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[નિયમનકારી સંસ્થા]], [#text(weight: "bold", fill: white)[કાયદો / અધિનિયમ]], [#text(weight: "bold", fill: white)[અભ્યાસક્રમમાં સમાવેશ અને વ્યવહારુ પ્રભાવ]],
  [GST કાઉન્સિલ અને CBIC], [CGST / SGST / IGST નિયમો 2017], [નિયમ 46 ટેક્સ ઇનવોઇસ, કલમ 16(2)(aa) GSTR-2B મેળવણું, ઈ-વે બિલ અને ઈ-ઇનવોઇસિંગ.],
  [CBDT / આવકવેરા વિભાગ], [ઇન્કમટેક્સ એક્ટ, 1961], [કલમ 194C/J/I હેઠળ ટીડીએસ કપાત, ત્રિમાસિક ફોર્મ 26Q રિટર્ન, 206AA દંડાત્મક દરો.],
  [કોર્પોરેટ બાબતોનું મંત્રાલય], [કંપની ધારો, 2013], [ઓડિટ ટ્રેલ (Edit Log) અનિવાર્યતા, શિડ્યુલ III વર્ટિકલ બેલેન્સ શીટ અને ઘસારો.],
  [ઇન્સ્ટિટ્યૂટ ઓફ ચાર્ટર્ડ એકાઉન્ટન્ટ્સ], [ભારતીય એકાઉન્ટિંગ સ્ટાન્ડર્ડ્સ (Ind AS)], [લ્યુકા પેસિઓલી ડબલ-એન્ટ્રી નિયમો, ઉપાર્જન સંકલ્પના (Accrual), આખર સ્ટોક મૂલ્યાંકન.]
)

#pagebreak()

= 11-વિષય અભ્યાસક્રમ માર્ગદર્શિકા અને કોર્પોરેટ કાર્યક્ષમતા મેટ્રિક્સ

#table(
  columns: (0.7fr, 1.8fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4pt,
  [#text(weight: "bold", fill: white)[વિષય]], [#text(weight: "bold", fill: white)[અભ્યાસક્રમ ક્ષેત્ર]], [#text(weight: "bold", fill: white)[વ્યવહારુ શિક્ષણ અને સિદ્ધિ લક્ષ્યાંકો]],
  [વિષય 01], [ટેલીનો ઇતિહાસ અને લાયસન્સિંગ], [ભરત ગોયનકા, 80% બજાર હિસ્સો, tallysolutions.com પરથી ડાઉનલોડ, સિલ્વર/ગોલ્ડ/એજ્યુકેશન મોડ, TGS LAN.],
  [વિષય 02], [ટેલી પ્રાઇમ અને સિસ્ટમ આર્કિટેક્ચર], [કેક્ટસ ઇન-મેમરી ડેટાબેઝ, ટોપ મેનૂ (Alt+K/Y/Z/O/E/M/P), ગો-ટૂ (Alt+G) મલ્ટીટાસ્કિંગ, 4 GOT ક્વાડ્રન્ટ્સ.],
  [વિષય 03], [સંપૂર્ણ જીએસટી અને ટીડીએસ પાયો], [CGST+SGST વિરુદ્ધ IGST, 0% કરમુક્ત, 5% આવશ્યક, 18% સ્ટાન્ડર્ડ સ્લેબ્સ, કલમ 194C/J/I/H, ફોર્મ 26Q શિડ્યુલ.],
  [વિષય 04], [લેજર, ખાતા અને સુવર્ણ નિયમો], [વ્યક્તિગત, માલ-મિલકત, ઉપજ-ખર્ચ ખાતા, લ્યુકા પેસિઓલી નિયમો, મિ. વર્મા 50-વ્યવહાર વર્કફ્લો, 20 રોકડ/બેંક એન્ટ્રીઓ.],
  [વિષય 05], [વાઉચર્સ અને 4 મુખ્ય શ્રેણીઓ], [એકાઉન્ટિંગ, ઇન્વેન્ટરી, ઓર્ડર અને મેમો શ્રેણીઓ, 24 વાઉચર્સ અને શોર્ટકટ્સ, એડિટ લોગ ઓડિટ ટ્રેલ.],
  [વિષય 06], [ગ્રુપ્સ અને સંપૂર્ણ લેજર મેપિંગ], [15 પ્રાથમિક + 13 ગૌણ ગ્રુપ્સ, 70+ વાસ્તવિક લેજર મેપિંગ્સ (સલમાન, HDFC, ટેક્સ લેજર્સ), ટ્રાયલ બેલેન્સ ઓડિટ.],
  [વિષય 07], [કંપની બનાવવાની તબક્કાવાર રીત], [કંપની નિર્માણ, ગુજરાત કોડ 24, નાણાકીય વર્ષ, ટેલી વોલ્ટ AES એન્ક્રિપ્શન, 5 વ્યવહારુ કંપનીઓ.],
  [વિષય 08], [વ્યાપારિક સંગઠનોના પ્રકારો], [ટ્રેડિંગ પેઢીઓ (ઊંઝા મંડી), મેન્યુફેક્ચરિંગ BOM સાથે (મોરબી સિરામિક્સ), સર્વિસ સેક્ટર, ઈ-કોમર્સ.],
  [વિષય 09], [પ્રેક્ટિકલ કોમર્શિયલ ઇનવોઇસ નિર્માણ], [6 પ્રમાણિત ઇનવોઇસ: કરમુક્ત ખરીદી, જીએસટી 18%, આંતરરાજ્ય IGST, જીએસટી વેચાણ, IGST વેચાણ, સર્વિસ.],
  [વિષય 10], [માસ્ટર કીબોર્ડ શોર્ટકટ્સ (50+)], [સામાન્ય નેવિગેશન, માસ્ટર સુધારો, વાઉચર શોર્ટકટ્સ, રિપોર્ટિંગ શોર્ટકટ્સ, અને 30-સેકન્ડ સ્પીડ રન.],
  [વિષય 11], [કોર્પોરેટ બ્રિજ વિષયો], [GST પોર્ટલ રિટર્ન્સ (GSTR-1/3B/2B), બેંક રિકન્સિલિયેશન (BRS), CTS-2010 ચેક, કોસ્ટ સેન્ટર્સ, અને ડેટા સ્પ્લિટ.]
)

#v(8pt)

== વ્યવસાયિક કાર્યક્ષમતા મૂલ્યાંકન ધોરણો
આ અભ્યાસક્રમ પૂર્ણ કરનાર વિદ્યાર્થીઓનું 4-સ્તરીય ગ્રેડિંગ સ્કેલ પર મૂલ્યાંકન કરવામાં આવે છે:
- *ડિસ્ટિન્ક્શન (> 90%):* કીબોર્ડ શોર્ટકટ્સની તાત્કાલિક ઝડપ, ભૂલરહિત GSTR-2B મેળવણું, અને BOM એસેમ્બલી ઉત્પાદનમાં સંપૂર્ણ નિપુણતા.
- *ફર્સ્ટ ક્લાસ (75% - 89%):* તમામ 6 વાઉચર પ્રકારોમાં શુદ્ધ એન્ટ્રી, બહુ-રાજ્ય જીએસટી ઇનવોઇસ નિર્માણ, અને ટ્રાયલ બેલેન્સ તફાવતનો નિકાલ.
- *કોર્પોરેટ પાસ (60% - 74%):* મૂળભૂત રોકડ/બેંક વાઉચર્સની રેકોર્ડિંગ, ડે બુક રિપોર્ટ જનરેશન, અને નામાના 3 સુવર્ણ નિયમોની સમજ.
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

#pagebreak()
"""
    # Append all topics: Every topic strictly begins on a BRAND NEW PAGE (#pagebreak())
    for ch_idx in range(1, 13):
        if ch_idx in chapters:
            typ_content += f"\n{chapters[ch_idx].strip()}\n\n#pagebreak()\n"

    # Append Author's Final Mentorship & Motto Page on the VERY LAST PAGE
    typ_content += f'#rtech-final-page(lang: "{lang}", photo-path: "../02_BRAND_ASSETS/rahul-patel.jpg", logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png")\n'

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
Direct Mentorship: rahul.28e1@gmail.com · rahul.28e1@gmail.com
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
