# -*- coding: utf-8 -*-
import os

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"

# 1. UPDATE NotesPage.jsx
notes_page_path = os.path.join(BASE_DIR, "app", "pages", "NotesPage.jsx")
with open(notes_page_path, "r", encoding="utf-8") as f:
    text = f.read()

# AI subject in NotesPage.jsx
old_ai = """    previewPdfEn: '/downloads/AI-Essentials-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/AI-Essentials-English-Edition-1.pdf',
    fullPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1.pdf',"""

new_ai = """    previewPdfEn: '/downloads/AI-Essentials-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/AI-Essentials-English-Edition-1.pdf',
    fullPdfHi: '/downloads/AI-Essentials-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/AI-Essentials-Gujarati-Edition-1.pdf',"""

text = text.replace(old_ai, new_ai)

# AI bundle item
old_ai_bundle = """      { name: 'AI Essentials Core Master Guide (Hindi)', pages: '44 Pages', file: 'AI-Essentials-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },"""
new_ai_bundle = """      { name: 'AI Essentials Core Master Guide (Hindi)', pages: '44 Pages', file: 'AI-Essentials-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'AI Essentials Core Master Guide (ગુજરાતી)', pages: '44 Pages', file: 'AI-Essentials-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },"""
text = text.replace(old_ai_bundle, new_ai_bundle)

# Office 365 subject in NotesPage.jsx
old_o365 = """    previewPdfEn: '/downloads/Office-365-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Office-365-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Office-365-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',"""

new_o365 = """    previewPdfEn: '/downloads/Office-365-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Office-365-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Office-365-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Office-365-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Office-365-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Office-365-Gujarati-Edition-1.pdf',"""

text = text.replace(old_o365, new_o365)

old_o365_bundle = """      { name: 'Office 365 Enterprise Master Guide (Hindi)', pages: '113 Pages', file: 'Office-365-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },"""
new_o365_bundle = """      { name: 'Office 365 Enterprise Master Guide (Hindi)', pages: '113 Pages', file: 'Office-365-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'Office 365 Enterprise Master Guide (ગુજરાતી)', pages: '113 Pages', file: 'Office-365-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },"""
text = text.replace(old_o365_bundle, new_o365_bundle)

# Fundamentals subject in NotesPage.jsx
old_fund = """    previewPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',"""

new_fund = """    previewPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/Computer-Fundamentals-English-Edition-1.pdf',
    fullPdfHi: '/downloads/Computer-Fundamentals-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/Computer-Fundamentals-Gujarati-Edition-1.pdf',"""

text = text.replace(old_fund, new_fund)

old_fund_bundle = """      { name: 'Computer Fundamentals Core Master Guide (Hindi)', pages: '45 Pages', file: 'Computer-Fundamentals-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },"""
new_fund_bundle = """      { name: 'Computer Fundamentals Core Master Guide (Hindi)', pages: '45 Pages', file: 'Computer-Fundamentals-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'Computer Fundamentals Core Master Guide (ગુજરાતી)', pages: '45 Pages', file: 'Computer-Fundamentals-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },"""
text = text.replace(old_fund_bundle, new_fund_bundle)

# CCNA subject in NotesPage.jsx
old_ccna = """    previewPdfEn: '/downloads/CCNA-200-301-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/CCNA-200-301-English-Edition-1.pdf',
    fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',"""

new_ccna = """    previewPdfEn: '/downloads/CCNA-200-301-English-Edition-1-5Page-Preview.pdf',
    previewPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1-5Page-Preview.pdf',
    previewPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1-5Page-Preview.pdf',
    fullPdfEn: '/downloads/CCNA-200-301-English-Edition-1.pdf',
    fullPdfHi: '/downloads/CCNA-200-301-Hindi-Edition-1.pdf',
    fullPdfGu: '/downloads/CCNA-200-301-Gujarati-Edition-1.pdf',"""

text = text.replace(old_ccna, new_ccna)

old_ccna_bundle = """      { name: 'Cisco CCNA 200-301 Master Guide (Hindi)', pages: '49 Pages', file: 'CCNA-200-301-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },"""
new_ccna_bundle = """      { name: 'Cisco CCNA 200-301 Master Guide (Hindi)', pages: '49 Pages', file: 'CCNA-200-301-Hindi-Edition-1.pdf', badge: 'Hindi Edition' },
      { name: 'Cisco CCNA 200-301 Master Guide (ગુજરાતી)', pages: '49 Pages', file: 'CCNA-200-301-Gujarati-Edition-1.pdf', badge: 'ગુજરાતી આવૃત્તિ' },"""
text = text.replace(old_ccna_bundle, new_ccna_bundle)

# PREVIEW_ASSETS for AI
old_ai_assets = """    labelsHi: [
      'पेज 1: आधिकारिक AI मास्टर बुक कवर · डीप लर्निंग व सॉवरेन AI',
      'पेज 2: 2027 AI पाठ्यक्रम ब्लूप्रिंट · 42 प्रोडक्शन मॉड्यूल्स व लैब्स',
      'पेज 3: भाग 1 — AI की शुरुआत: 1950 से डार्टमाउथ कॉन्फ्रेंस 1956',
      'पेज 4: गोल्डन एरा, परसेप्ट्रॉन व पहला AI विंटर (1957–1980)',
      'पेज 5: एक्सपर्ट सिस्टम्स व दूसरा AI विंटर (1980–1993)',
    ],
  },"""

new_ai_assets = """    labelsHi: [
      'पेज 1: आधिकारिक AI मास्टर बुक कवर · डीप लर्निंग व सॉवरेन AI',
      'पेज 2: 2027 AI पाठ्यक्रम ब्लूप्रिंट · 42 प्रोडक्शन मॉड्यूल्स व लैब्स',
      'पेज 3: भाग 1 — AI की शुरुआत: 1950 से डार्टमाउथ कॉन्फ्रेंस 1956',
      'पेज 4: गोल्डन एरा, परसेप्ट्रॉन व पहला AI विंटर (1957–1980)',
      'पेज 5: एक्सपर्ट सिस्टम्स व दूसरा AI विंटर (1980–1993)',
    ],
    gu: [
      '/previews/ai/preview-gu-1.png',
      '/previews/ai/preview-gu-2.png',
      '/previews/ai/preview-gu-3.png',
      '/previews/ai/preview-gu-4.png',
      '/previews/ai/preview-gu-5.png',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર AI માસ્ટર બુક કવર · ડીપ લર્નિંગ અને સોવરેન AI',
      'પેજ 2: 2027 AI અભ્યાસક્રમ બ્લૂપ્રિન્ટ · 42 પ્રોડક્શન મોડ્યુલ્સ અને લેબ્સ',
      'પેજ 3: ભાગ 1 — AI ની શરૂઆત: 1950 થી ડાર્ટમાઉથ કોન્ફરન્સ 1956',
      'પેજ 4: ગોલ્ડન એરા, પર્સેપ્ટ્રોન અને પ્રથમ AI વિન્ટર (1957–1980)',
      'પેજ 5: એક્સપર્ટ સિસ્ટમ્સ અને બીજો AI વિન્ટર (1980–1993)',
    ],
  },"""
text = text.replace(old_ai_assets, new_ai_assets)

# PREVIEW_ASSETS for Office 365
old_o365_assets = """    labelsHi: [
      'पेज 1: आधिकारिक Office 365 एंटरप्राइज मास्टर कवर',
      'पेज 2: मास्टर ब्लूप्रिंट · 32 प्रोडक्शन मॉड्यूल्स और 13 प्रैक्टिकल लैब्स',
      'पेज 3: भाग 1 — Word 365 आर्किटेक्चर और फाइल बैकस्टेज',
      'पेज 4: डॉक्यूमेंट व्यू मोड्स और प्रोडक्टिविटी टूल्स',
      'पेज 5: कॉर्पोरेट टेम्पलेट्स और स्टाइल ऑटोमेशन',
    ],
  },"""

new_o365_assets = """    labelsHi: [
      'पेज 1: आधिकारिक Office 365 एंटरप्राइज मास्टर कवर',
      'पेज 2: मास्टर ब्लूप्रिंट · 32 प्रोडक्शन मॉड्यूल्स और 13 प्रैक्टिकल लैब्स',
      'पेज 3: भाग 1 — Word 365 आर्किटेक्चर और फाइल बैकस्टेज',
      'पेज 4: डॉक्यूमेंट व्यू मोड्स और प्रोडक्टिविटी टूल्स',
      'पेज 5: कॉर्पोरेट टेम्पलेट्स और स्टाइल ऑटोमेशन',
    ],
    gu: [
      '/previews/office365/preview-gu-1.png',
      '/previews/office365/preview-gu-2.png',
      '/previews/office365/preview-gu-3.png',
      '/previews/office365/preview-gu-4.png',
      '/previews/office365/preview-gu-5.png',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર Office 365 એન્ટરપ્રાઇઝ માસ્ટર કવર',
      'પેજ 2: માસ્ટર બ્લૂપ્રિન્ટ · 32 પ્રોડક્શન મોડ્યુલ્સ અને 13 પ્રેક્ટિકલ લેબ્સ',
      'પેજ 3: ભાગ 1 — Word 365 આર્કિટેક્ચર અને ફાઇલ બેકસ્ટેજ',
      'પેજ 4: ડોક્યુમેન્ટ વ્યુ મોડ્સ અને પ્રોડક્ટિવિટી ટુલ્સ',
      'પેજ 5: કોર્પોરેટ ટેમ્પ્લેટ્સ અને સ્ટાઇલ ઓટોમેશન',
    ],
  },"""
text = text.replace(old_o365_assets, new_o365_assets)

# PREVIEW_ASSETS for Fundamentals
old_fund_assets = """    labelsHi: [
      'पेज 1: आधिकारिक मास्टर बुक कवर · सिलिकॉन आर्किटेक्चर',
      'पेज 2: अध्याय 1 — कम्प्यूटर सिस्टम और सिलिकॉन IPO साइकिल',
      'पेज 3: 5 कम्प्यूटर पीढ़ियाँ और हार्डवेयर कंपैरिजन',
      'पेज 4: इनपुट डिवाइसेस, सेंसर्स और पोर्ट्स',
      'पेज 5: डिस्प्ले टेक्नोलॉजी और डायग्नोस्टिक पोर्ट्स',
    ],
  },"""

new_fund_assets = """    labelsHi: [
      'पेज 1: आधिकारिक मास्टर बुक कवर · सिलिकॉन आर्किटेक्चर',
      'पेज 2: अध्याय 1 — कम्प्यूटर सिस्टम और सिलिकॉन IPO साइकिल',
      'पेज 3: 5 कम्प्यूटर पीढ़ियाँ और हार्डवेयर कंपैरिजन',
      'पेज 4: इनपुट डिवाइसेस, सेंसर्स और पोर्ट्स',
      'पेज 5: डिस्प्ले टेक्नोलॉजी और डायग्नोस्टिक पोर्ट्स',
    ],
    gu: [
      '/previews/fundamentals/gu-page-1.png',
      '/previews/fundamentals/gu-page-2.png',
      '/previews/fundamentals/gu-page-3.png',
      '/previews/fundamentals/gu-page-4.png',
      '/previews/fundamentals/gu-page-5.png',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર માસ્ટર બુક કવર · સિલિકોન આર્કિટેક્ચર',
      'પેજ 2: પ્રકરણ 1 — કમ્પ્યુટર સિસ્ટમ્સ અને સિલિકોન IPO સાયકલ',
      'પેજ 3: 5 કમ્પ્યુટર પેઢીઓ અને હાર્ડવેર સરખામણી',
      'પેજ 4: ઇનપુટ ડિવાઇસીસ, સેન્સર્સ અને પોર્ટ્સ',
      'પેજ 5: ડિસ્પ્લે ટેકનોલોજી અને ડાયગ્નોસ્ટિક પોર્ટ્સ',
    ],
  },"""
text = text.replace(old_fund_assets, new_fund_assets)

# PREVIEW_ASSETS for CCNA
old_ccna_assets = """    labelsHi: [
      'पेज 1: आधिकारिक CCNA 200-301 मास्टर बुक कवर',
      'पेज 2: अध्याय 1 — आधुनिक एंटरप्राइज नेटवर्क आर्किटेक्चर',
      'पेज 3: 2-टियर कोलैप्सड कोर, 3-टियर और स्पाइन-लीफ डिजाइन',
      'पेज 4: UTP Cat6 और सिंगल/मल्टी-मोड फाइबर केबलिंग',
      'पेज 5: T568A/B पिनआउट्स और कोलिजन/ब्रॉडकास्ट डोमेन',
    ],
  },"""

new_ccna_assets = """    labelsHi: [
      'पेज 1: आधिकारिक CCNA 200-301 मास्टर बुक कवर',
      'पेज 2: अध्याय 1 — आधुनिक एंटरप्राइज नेटवर्क आर्किटेक्चर',
      'पेज 3: 2-टियर कोलैप्सड कोर, 3-टियर और स्पाइन-लीफ डिजाइन',
      'पेज 4: UTP Cat6 और सिंगल/मल्टी-मोड फाइबर केबलिंग',
      'पेज 5: T568A/B पिनआउट्स और कोलिजन/ब्रॉडकास्ट डोमेन',
    ],
    gu: [
      '/previews/ccna/gu-page-1.png',
      '/previews/ccna/gu-page-2.png',
      '/previews/ccna/gu-page-3.png',
      '/previews/ccna/gu-page-4.png',
      '/previews/ccna/gu-page-5.png',
    ],
    labelsGu: [
      'પેજ 1: સત્તાવાર CCNA 200-301 માસ્ટર બુક કવર',
      'પેજ 2: પ્રકરણ 1 — આધુનિક એન્ટરપ્રાઇઝ નેટવર્ક આર્કિટેક્ચર',
      'પેજ 3: 2-ટિયર કોલેપ્સ્ડ કોર, 3-ટિયર અને સ્પાઇન-લીફ ડિઝાઇન',
      'પેજ 4: UTP Cat6 અને સિંગલ/મલ્ટી-મોડ ફાઇબર કેબલિંગ',
      'પેજ 5: T568A/B પિનઆઉટ્સ અને કોલિઝન/બ્રોડકાસ્ટ ડોમેન',
    ],
  },"""
text = text.replace(old_ccna_assets, new_ccna_assets)

with open(notes_page_path, "w", encoding="utf-8") as f:
    f.write(text)
print("[x] Updated app/pages/NotesPage.jsx with all Gujarati preview assets & download links")


# 2. UPDATE NotesHiPage.jsx
notes_hi_path = os.path.join(BASE_DIR, "app", "pages", "NotesHiPage.jsx")
with open(notes_hi_path, "r", encoding="utf-8") as f:
    hi_text = f.read()

# Replace in NotesHiPage.jsx
hi_text = hi_text.replace(old_ai, new_ai)
hi_text = hi_text.replace(old_ai_bundle, new_ai_bundle)
hi_text = hi_text.replace(old_o365, new_o365)
hi_text = hi_text.replace(old_o365_bundle, new_o365_bundle)
hi_text = hi_text.replace(old_fund, new_fund)
hi_text = hi_text.replace(old_fund_bundle, new_fund_bundle)
hi_text = hi_text.replace(old_ccna, new_ccna)
hi_text = hi_text.replace(old_ccna_bundle, new_ccna_bundle)

with open(notes_hi_path, "w", encoding="utf-8") as f:
    f.write(hi_text)
print("[x] Updated app/pages/NotesHiPage.jsx with all Gujarati download links")


# 3. UPDATE src/data/notesCatalog.js
catalog_path = os.path.join(BASE_DIR, "src", "data", "notesCatalog.js")
if os.path.exists(catalog_path):
    with open(catalog_path, "r", encoding="utf-8") as f:
        cat_text = f.read()
    cat_text = cat_text.replace(old_ai, new_ai)
    cat_text = cat_text.replace(old_o365, new_o365)
    cat_text = cat_text.replace(old_fund, new_fund)
    cat_text = cat_text.replace(old_ccna, new_ccna)
    with open(catalog_path, "w", encoding="utf-8") as f:
        f.write(cat_text)
    print("[x] Updated src/data/notesCatalog.js")

print("All catalogs successfully synchronized!")
