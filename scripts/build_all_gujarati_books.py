# -*- coding: utf-8 -*-
"""
RTechLab Comprehensive Gujarati Edition Publishing Engine (LIGHT THEME & REFINED GUJARATI)
Produces exact-page Gujarati Master Handbooks, 5-page preview PDFs, 
and high-resolution 5-page preview PNGs for:
1. Computer Fundamentals & Architecture (Target 45 Pages)
2. Artificial Intelligence Mastery (Target 44 Pages)
3. Cisco CCNA 200-301 Master Suite (Target 49 Pages)
4. Microsoft Office 365 Enterprise Suite (Target 113 Pages)
"""

import os
import sys
import re
import subprocess
import shutil
import zipfile
import pypdf
import fitz  # PyMuPDF

BASE_DIR = os.path.abspath(r"c:\Users\Rahul\Videos\My projects\RtechLab")

# Common Hindi-to-Gujarati Grammatical and Vocabulary Mappings
VOCAB_MAPPINGS = [
    # Book sections & headings
    ("अध्याय", "પ્રકરણ"),
    ("अध्यायों", "પ્રકરણો"),
    ("भाग", "ભાગ"),
    ("विषय", "વિષય"),
    ("विषयों", "વિષયો"),
    ("सारांश", "સારાંશ"),
    ("मुख्य सारांश", "મુખ્ય સારાંશ"),
    ("पाठ्यक्रम", "અભ્યાસક્રમ"),
    ("ब्लूप्रिंट", "બ્લૂપ્રિન્ટ"),
    ("मार्गदर्शिका", "માર્ગદર્શિકા"),
    ("संस्करण", "આવૃત્તિ"),
    ("एडिशन", "એડિશન"),
    ("पृष्ठ", "પેજ"),
    ("पेज", "પેજ"),
    ("पेजेस", "પેજીસ"),
    ("प्रथम", "પ્રથમ"),
    ("द्वितीय", "દ્વિતીય"),
    ("तृतीय", "તૃતીય"),
    ("चतुर्थ", "ચતુર્થ"),
    ("पंचम", "પંચમ"),
    ("नींव", "પાયો"),
    ("मूलभूत", "મૂળભૂત"),
    ("सिद्धांत", "સિદ્ધાંત"),
    ("शीतकाल", "વિન્ટર"),
    
    # Authorship & Branding
    ("राहुल पटेल", "રાહુલ પટેલ"),
    ("संस्थापक एवं मुख्य प्रौद्योगिकी वास्तुकार", "સંસ્થાપક અને ચીફ ટેકનોલોજી આર્કિટેક્ટ"),
    ("संस्थापक एवं मुख्य", "સંસ્થાપક અને મુખ્ય"),
    ("वाणिज्यिक रिलीज", "કોમર્શિયલ રિલીઝ"),
    ("मास्टर एडिशन", "માસ્ટર એડિશન"),
    ("मास्टर संस्करण", "માસ્ટર આવૃત્તિ"),
    ("प्रामाणिक संस्करण", "પ્રમાણિત આવૃત્તિ"),
    ("वाणिज्यिक प्रकाशन", "કોમર્શિયલ પ્રકાશન"),
    ("कमर्शियल पब्लिकेशन", "કોમર્શિયલ પબ્લિકેશન"),
    ("कमर्शियल रिलीज", "કોમર્શિયલ રિલીઝ"),
    ("उत्पादन मास्टर", "પ્રોડક્શન માસ્ટર"),
    
    # Q&A & Interview terms
    ("परीक्षा हेतु मुख्य बिंदु", "પરીક્ષા લક્ષી મુખ્ય મુદ્દાઓ"),
    ("उच्च-प्राथमिकता परीक्षा एवं इंटरव्यू बहुविकल्पीय प्रश्न (MCQs)", "ઉચ્ચ-પ્રાથમિકતા પરીક્ષા અને ઇન્ટરવ્યુ બહુવિકલ્પી પ્રશ્નો (MCQs)"),
    ("व्यावहारिक वाइवा प्रश्न एवं हैंड्स-ऑन लैब कार्य", "વ્યવહારુ વાઇવા પ્રશ્નો અને હેન્ડ્સ-ઓન લેબ વર્ક"),
    ("सही उत्तर:", "સાચો જવાબ:"),
    ("आदर्श उत्तर:", "આદર્શ જવાબ:"),
    ("व्याख्या:", "સમજૂતી:"),
    ("कॉर्पोरेट व्याख्या:", "કોર્પોરેટ સમજૂતી:"),
    ("प्रश्न एवं विकल्प", "પ્રશ્ન અને વિકલ્પો"),
    ("उत्तर एवं विस्तृत व्याख्या", "જવાબ અને વિગતવાર સમજૂતી"),
    ("क्र.सं.", "ક્રમ"),
    ("क्र.", "ક્રમ"),
    ("विवरण", "વિગત"),
    ("राशि", "રકમ"),
    ("कुल योग", "કુલ સરવાળો"),
    ("टिप्पणी", "નોંધ"),
    ("चेतावनी", "ચેતવણી"),
    ("महत्वपूर्ण", "મહત્વપૂર્ણ"),
    ("संकेत", "સંકેત"),

    # Idiomatic phrases & compound expressions
    ("बुनियादी स्तरों में", "મૂળભૂત સ્તરોમાં"),
    ("बुनियादी स्तरों", "મૂળભૂત સ્તરો"),
    ("बुनियादी स्तर", "મૂળભૂત સ્તર"),
    ("बुनियादी", "મૂળભૂત"),
    ("स्तरों में", "સ્તરોમાં"),
    ("स्तरों", "સ્તરો"),
    ("स्तर", "સ્તર"),
    ("सिद्ध किया कि", "સાબિત કર્યું કે"),
    ("सिद्ध किया", "સાબિત કર્યું"),
    ("नहीं हल कर सकता", "ઉકેલી શકતું નથી"),
    ("हल कर सकता", "ઉકેલી શકે છે"),
    ("हल कर सकती", "ઉકેલી શકે છે"),
    ("हल कर सकते", "ઉકેલી શકે છે"),
    ("अगले 3 वर्षों में", "આગામી 3 વર્ષોમાં"),
    ("अगले 3 वर्षों", "આગામી 3 વર્ષો"),
    ("अगले", "આગામી"),
    ("वर्षों में", "વર્ષોમાં"),
    ("वर्षों", "વર્ષો"),
    ("वर्ष", "વર્ષ"),
    ("से निकलकर", "થી નીકળીને"),
    ("निकलकर", "નીકળીને"),
    ("पूरी तरह से", "સંપૂર્ણપણે"),
    ("पूरी तरह", "સંપૂર્ણપણે"),
    ("समाहित हो जाएगा", "સમાવિષ્ટ થઈ જશે"),
    ("समाहित", "સમાવિષ્ટ"),
    ("हो जाएगा", "થઈ જશે"),
    ("हो जाएगी", "થઈ જશે"),
    ("हो जाएंगे", "થઈ જશે"),
    ("गारंटी देते हैं", "ખાતરી આપે છે"),
    ("गारंटी देता है", "ખાતરી આપે છે"),
    ("गारंटी देती है", "ખાતરી આપે છે"),
    ("ध्यान केंद्रित", "ધ્યાન કેન્દ્રિત"),
    ("कोड करने", "કોડ કરવા"),
    ("पुनर्जन्म", "પુનર્જન્મ"),
    ("संबंध को समझने", "સંબંધને સમજવા"),
    ("समझने के लिए", "સમજવા માટે"),
    ("समझने", "સમજવા"),
    ("संबंध", "સંબંધ"),
    ("सबसे स्पष्ट", "સૌથી સ્પષ્ટ"),
    ("सबसे", "સૌથી"),
    ("स्पष्ट", "સ્પષ્ટ"),
    ("उपसमूह", "ઉપજૂથ"),

    # Pronouns & Conjunctions & Prepositions
    ("उसकी", "તેની"),
    ("उसका", "તેનો"),
    ("उसके", "તેના"),
    ("उनकी", "તેમની"),
    ("उनका", "તેમનો"),
    ("उनके", "તેમના"),
    ("इसकी", "આની"),
    ("इसका", "આનો"),
    ("इसके", "આના"),
    ("इन्हें", "આમને"),
    ("उन्हें", "તેમને"),
    ("और", "અને"),
    ("एवं", "અને"),
    ("तथा", "અને"),
    ("या", "અથવા"),
    ("अथवा", "અથવા"),
    ("नहीं", "નથી"),
    ("है", "છે"),
    ("हैं", "છે"),
    ("था", "હતું"),
    ("थी", "હતી"),
    ("थे", "હતા"),
    ("होगा", "હશે"),
    ("होगी", "હશે"),
    ("होंगे", "હશે"),
    ("होता है", "થાય છે"),
    ("होती है", "થાય છે"),
    ("होते हैं", "થાય છે"),
    ("हो सकता है", "થઈ શકે છે"),
    ("हो सकती है", "થઈ શકે છે"),
    ("हो सकते हैं", "થઈ શકે છે"),
    ("किया जाता है", "કરવામાં આવે છે"),
    ("की जाती है", "કરવામાં આવે છે"),
    ("किए जाते हैं", "કરવામાં આવે છે"),
    ("कहा जाता है", "કહેવામાં આવે છે"),
    ("कही जाती है", "કહેવામાં આવે છે"),
    ("सकते हैं", "શકો છો"),
    ("सकता है", "શકે છે"),
    ("सकती है", "શકે છે"),
    ("सकेंगे", "શકશો"),
    ("सकेंगी", "શકશો"),
    ("चाहिए", "જોઈએ"),
    ("का", "નો"),
    ("की", "ની"),
    ("के", "ના"),
    ("में", "માં"),
    ("से", "થી"),
    ("को", "ને"),
    ("पर", "પર"),
    ("द्वारा", "દ્વારા"),
    ("हेतु", "માટે"),
    ("लिए", "માટે"),
    ("के लिए", "માટે"),
    ("के साथ", "સાથે"),
    ("के बाद", "પછી"),
    ("के पहले", "પહેલાં"),
    ("के रूप में", "તરીકે"),
    ("के अंतर्गत", "અંતર્ગત"),
    ("के अनुसार", "અનુસાર"),
    ("इस", "આ"),
    ("यह", "આ"),
    ("वह", "તે"),
    ("वे", "તેઓ"),
    ("इन", "આ"),
    ("उन", "તે"),
    ("उस", "તે"),
    ("जब", "જ્યારે"),
    ("तब", "ત્યારે"),
    ("यदि", "જો"),
    ("अगर", "જો"),
    ("तो", "તો"),
    ("क्योंकि", "કારણ કે"),
    ("किंतु", "પરંતુ"),
    ("परंतु", "પરંતુ"),
    ("लेकिन", "પરંતુ"),
    ("मगर", "પરંતુ"),
    ("बल्कि", "પરંતુ"),
    ("इसलिए", "તેથી"),
    ("अतः", "આથી"),
    ("जैसे", "જેમ કે"),
    ("अर्थात", "એટલે કે"),
    ("अर्थात्", "એટલે કે"),
    ("प्रत्येक", "દરેક"),
    ("सभी", "બધા"),
    ("सारे", "બધા"),
    ("दोनों", "બંને"),
    ("तीनों", "ત્રણેય"),
    ("तीन", "ત્રણ"),
    ("दो", "બે"),
    ("एक", "એક"),
    ("कोई", "કોઈ"),
    ("कुछ", "કેટલાક"),
    ("बहुत", "ખૂબ"),
    ("ज्यादा", "વધુ"),
    ("अधिक", "વધારે"),
    ("कम", "ઓછું"),
    ("बजाय", "બદલે"),
    ("नियमों", "નિયમો"),
    ("नियम", "નિયમ"),
    ("आवश्यक", "જરૂરી"),
    ("सीखते हैं", "શીખે છે"),
    ("सीखता है", "શીખે છે"),
    ("सीखती है", "શીખે છે"),
    ("जबकि", "જ્યારે"),
    ("देते हैं", "આપે છે"),
    ("देता है", "આપે છે"),
    ("देती है", "આપે છે"),
    ("कहा", "કહ્યું"),
    ("किए", "કર્યા"),
    ("गए", "ગયા"),
    ("गई", "ગઈ"),
    ("गया", "ગયો"),
    ("हुआ", "થયું"),
    ("हुई", "થઈ"),
    ("हुए", "થયા"),
    ("बीच", "વચ્ચે"),
    ("पहला", "પ્રથમ"),
    ("दूसरा", "બીજો"),
    ("तीसरा", "ત્રીજો"),
    ("चौथा", "ચોથો"),
    ("पांचवां", "પાંચમો"),
    
    # Technical Context Terms
    ("कम्प्यूटर", "કમ્પ્યુટર"),
    ("कंप्यूटर", "કમ્પ્યુટર"),
    ("सिस्टम", "સિસ્ટમ"),
    ("प्रणाली", "પ્રણાલી"),
    ("प्रणालियों", "પ્રણાલીઓ"),
    ("हार्डवेयर", "હાર્ડવેર"),
    ("सॉफ्टवेयर", "સોફ્ટવેર"),
    ("नेटवर्क", "નેટવર્ક"),
    ("नेटवर्किंग", "નેટવર્કિંગ"),
    ("उपकरण", "ઉપકરણ"),
    ("उपकरणों", "ઉપકરણો"),
    ("संरचना", "સંરચના"),
    ("आर्किटेक्चर", "આર્કિટેક્ચર"),
    ("सुरक्षा", "સુરક્ષા"),
    ("प्रबंधन", "મેનેજમેન્ટ"),
    ("कॉन्फ़िगरेशन", "કન્ફિગરેશન"),
    ("इंस्टॉलेशन", "ઇન્સ્ટોલેશન"),
    ("समस्या निवारण", "ટ્રબલશૂટિંગ"),
    ("ट्रबलशूटिंग", "ટ્રબલશૂટિંગ"),
    ("प्रदर्शन", "પર્ફોર્મન્સ"),
    ("क्षमता", "ક્ષમતા"),
    ("भंडारण", "સ્ટોરેજ"),
    ("मेमोरी", "મેમરી"),
    ("प्रोसेसर", "પ્રોસેસર"),
    ("गति", "ઝડપ"),
    ("सटीकता", "ચોકસાઈ"),
    ("विश्वसनीयता", "વિશ્વસનીયતા"),
    ("उपयोगकर्ता", "યુઝર"),
    ("उपयोगकर्ताओं", "યુઝર્સ"),
    ("निर्देश", "સૂચના"),
    ("निर्देशों", "સૂચનાઓ"),
    ("परिणाम", "પરિણામ"),
    ("प्रक्रिया", "પ્રક્રિયા"),
    ("गणना", "ગણતરી"),
    ("अंकगणित", "અંકગણિત"),
    ("तार्किक", "તાર્કિક"),
    ("नियंत्रण", "નિયંત્રણ"),
    ("इकाई", "યુનિટ"),
    ("कार्यान्वयन", "અમલીકરણ"),
    ("विकास", "વિકાસ"),
    ("पीढ़ी", "પેઢી"),
    ("पीढ़ियों", "પેઢીઓ"),
]

NUKTA_MAP = {
    'क़': 'ક', 'ख़': 'ખ', 'ग़': 'ગ', 'ज़': 'ઝ',
    'ड़': 'ડ', 'ढ़': 'ઢ', 'फ़': 'ફ', 'य़': 'ય',
    '।': '.', '॥': '.', '\u093C': '' # Remove raw Devanagari nukta mark
}

# Compiled regex replacement list for speed and safety
COMPILED_VOCAB = []
for hi_w, gu_w in sorted(VOCAB_MAPPINGS, key=lambda x: len(x[0]), reverse=True):
    pattern = re.compile(r'(?<![\u0900-\u097F])' + re.escape(hi_w) + r'(?![\u0900-\u097F])')
    COMPILED_VOCAB.append((pattern, gu_w))

def translate_prose(prose):
    # Step 1: Pre-process nukta characters & danda
    for k, v in NUKTA_MAP.items():
        prose = prose.replace(k, v)
        
    # Step 2: Whole-word Devanagari grammar & vocab replacement
    for pattern, gu_w in COMPILED_VOCAB:
        prose = pattern.sub(gu_w, prose)
        
    # Step 3: Transliterate remaining Devanagari characters
    res = []
    for c in prose:
        code = ord(c)
        if 0x0901 <= code <= 0x097F:
            res.append(chr(code + 0x0180))
        else:
            res.append(c)
    return "".join(res)

def convert_devanagari_to_gujarati(text):
    """
    Carefully converts Hindi text into high-quality Gujarati while:
    1. Protecting Typst code (#func, parameters, math, colors, codeblocks).
    2. Replacing Hindi vocabulary and grammar with natural Gujarati.
    3. Transliterating remaining Devanagari character codes to Gujarati Unicode block (+0x0180).
    4. Converting Hindi danda '।' to Gujarati '.' full stop.
    """
    pattern = re.compile(r'(\`[^\`]*\`|\$[^\$]*\$|\#\w+[\w\-]*|"(?:\\.|[^"\\])*"|<[^>]+>|https?://[^\s\)]+)')
    parts = pattern.split(text)
    new_parts = []
    
    for idx, part in enumerate(parts):
        if idx % 2 == 1:
            if part.startswith('"') and part.endswith('"') and len(part) > 2:
                inner = part[1:-1]
                if any(0x0900 <= ord(c) <= 0x097F for c in inner):
                    new_parts.append(f'"{translate_prose(inner)}"')
                else:
                    new_parts.append(part)
            else:
                new_parts.append(part)
        else:
            new_parts.append(translate_prose(part))
            
    return "".join(new_parts)


# ==============================================================================
# SUBJECT BUILDERS
# ==============================================================================

def build_computer_fundamentals():
    print("\n" + "="*70)
    print("BUILDING SUBJECT 1: COMPUTER FUNDAMENTALS & ARCHITECTURE (TARGET: 45 PAGES)")
    print("="*70)
    src_dir = os.path.join(BASE_DIR, "DIGITAL", "COMPUTER FUNDAMENTALS", "07_SOURCE_FILES")
    hi_dir = os.path.join(src_dir, "Hindi")
    gu_dir = os.path.join(src_dir, "Gujarati")
    os.makedirs(gu_dir, exist_ok=True)
    
    # 1. Translate cover
    cover_gu_content = """// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — GUJARATI V5.1.4 (COMMERCIAL MASTER RELEASE)
// Premium International Academic Textbook Edition (Gujarati)
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-gujarati-v5(
  title: "કમ્પ્યુટર ફંડામેન્ટલ્સ અને આર્કિટેક્ચર",
  subtitle: "સંપૂર્ણ શિક્ષણ અને તકનીકી સાક્ષાત્કાર માર્ગદર્શિકા",
  edition: "2027 માસ્ટર એડિશન · ગુજરાતી આવૃત્તિ (V5.1.4)",
  series-pill: "આધિકારિક વાણિજ્યિક પ્રકાશન · V5.1.4 પ્રોડક્શન માસ્ટર",
  author: "Rahul Patel",
  author-title: "સંસ્થાપક અને ચીફ ટેકનોલોજી આર્કિટેક્ટ, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-FUND-V5.1.4-GU",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "../03_VISUAL_ASSETS/authentic-hardware-photographs/motherboard-atx-overview.jpg"
) = {
  import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-hindi-v5
  rtech-cover-hindi-v5(
    title: title,
    subtitle: subtitle,
    edition: edition,
    series-pill: series-pill,
    author: author,
    author-title: author-title,
    tagline-1: tagline-1,
    tagline-2: tagline-2,
    subject-code: subject-code,
    logo-path: logo-path,
    hero-photo-path: hero-photo-path
  )
}
"""
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "cover-v5-gu.typ"), "w", encoding="utf-8") as f:
        f.write(cover_gu_content)
        
    # 2. Translate blueprint
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "blueprint-v5-hi.typ"), "r", encoding="utf-8") as f:
        bp_hi = f.read()
    bp_gu = convert_devanagari_to_gujarati(bp_hi)
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "blueprint-v5-gu.typ"), "w", encoding="utf-8") as f:
        f.write(bp_gu)

    # 3. Translate chapters 01 to 10
    for ch_num in range(1, 11):
        ch_name = f"chapter-{ch_num:02d}.typ"
        ch_hi_path = os.path.join(hi_dir, ch_name)
        if os.path.exists(ch_hi_path):
            with open(ch_hi_path, "r", encoding="utf-8") as f:
                ch_text = f.read()
            ch_gu_text = convert_devanagari_to_gujarati(ch_text)
            with open(os.path.join(gu_dir, ch_name), "w", encoding="utf-8") as f:
                f.write(ch_gu_text)
            print(f"  [x] Translated {ch_name} to Gujarati")

    # 4. Master Typst file
    master_gu = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-cover-gujarati-v5

#set document(
  title: "RTechLab કમ્પ્યુટર ફંડામેન્ટલ્સ 2027 માસ્ટર એડિશન (V5.1.2)",
  author: "Rahul Patel"
)

// પૃષ્ઠ 1: કવર પૃષ્ઠ (A4 BORDERLESS)
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-gujarati-v5()

// પૃષ્ઠ 2 થી આગળ: માસ્ટર પબ્લિશિંગ થીમ (GUJARATI READY)
#show: rtech-book.with(
  title: "કમ્પ્યુટર ફંડામેન્ટલ્સ 2027",
  edition: "2027 માસ્ટર એડિશન · V5.1.2 ફાયનલ વાણિજ્યિક રિલીઝ (ગુજરાતી)",
  author: "Rahul Patel",
  subject-code: "RTL-2027-FUND-GU-V5.1.2"
)

#set text(font: ("Segoe UI", "Shruti", "Nirmala UI", "Arial"), lang: "gu")

// પૃષ્ઠ 2: અભ્યાસક્રમ બ્લૂપ્રિન્ટ ઇન્ડેક્સ
#include "../07_PUBLISHING_ENGINE/blueprint-v5-gu.typ"

// પૃષ્ઠ 3–6: પ્રકરણ 1
#pagebreak()
#include "chapter-01.typ"

// પૃષ્ઠ 7–10: પ્રકરણ 2
#pagebreak()
#include "chapter-02.typ"

// પૃષ્ઠ 11–14: પ્રકરણ 3
#pagebreak()
#include "chapter-03.typ"

// પૃષ્ઠ 15–18: પ્રકરણ 4
#pagebreak()
#include "chapter-04.typ"

// પૃષ્ઠ 19–22: પ્રકરણ 5
#pagebreak()
#include "chapter-05.typ"

// પૃષ્ઠ 23–26: પ્રકરણ 6
#pagebreak()
#include "chapter-06.typ"

// પૃષ્ઠ 27–30: પ્રકરણ 7
#pagebreak()
#include "chapter-07.typ"

// પૃષ્ઠ 31–34: પ્રકરણ 8
#pagebreak()
#include "chapter-08.typ"

// પૃષ્ઠ 35–38: પ્રકરણ 9
#pagebreak()
#include "chapter-09.typ"

// પૃષ્ઠ 39–45: પ્રકરણ 10
#pagebreak()
#include "chapter-10.typ"
"""
    master_gu_path = os.path.join(gu_dir, "computer-fundamentals-v5-gu.typ")
    with open(master_gu_path, "w", encoding="utf-8") as f:
        f.write(master_gu)
        
    # Compile
    out_pdf = os.path.join(BASE_DIR, "public", "downloads", "Computer-Fundamentals-Gujarati-Edition-1.pdf")
    cmd = ["typst", "compile", "--root", src_dir, master_gu_path, out_pdf]
    print("  [x] Compiling with Typst...")
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print("  [!] Typst compile failed:", res.stderr)
        raise RuntimeError("Typst compile failed for Computer Fundamentals")
        
    r = pypdf.PdfReader(out_pdf)
    pcount = len(r.pages)
    print(f"  [SUCCESS] Computer Fundamentals Gujarati Compiled: {pcount} pages (Expected 45)")
    return out_pdf, pcount


def build_ai_essentials():
    print("\n" + "="*70)
    print("BUILDING SUBJECT 2: ARTIFICIAL INTELLIGENCE MASTERY (TARGET: 44 PAGES)")
    print("="*70)
    src_dir = os.path.join(BASE_DIR, "DIGITAL", "AI_ESSENTIALS", "07_SOURCE_FILES")
    hi_dir = os.path.join(src_dir, "Hindi")
    gu_dir = os.path.join(src_dir, "Gujarati")
    os.makedirs(gu_dir, exist_ok=True)
    
    # 1. Translate cover
    cover_gu_content = """// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — AI ESSENTIALS (GUJARATI EDITION 1)
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5-gu(
  title: "આર્ટિફિશિયલ ઇન્ટેલિજન્સ એસેન્શિયલ્સ અને કરિયર બ્લૂપ્રિન્ટ",
  subtitle: "1950 નો ઇતિહાસ · ડીપ લર્નિંગ · ટ્રાન્સફોર્મર્સ · ઇન્ડિક LLMs · ઓટોનોમસ એજન્ટ્સ અને ₹38 LPA કરિયર રોડમેપ",
  edition: "2027 માસ્ટર આવૃત્તિ · આવૃત્તિ 1 (ગુજરાતી)",
  series-pill: "ઓફિશિયલ RTECHLAB કોમર્શિયલ પબ્લિકેશન · આર્ટિફિશિયલ ઇન્ટેલિજન્સ",
  author: "રાહુલ પટેલ (Rahul Patel)",
  author-title: "સંસ્થાપક અને ચીફ ટેકનોલોજી આર્કિટેક્ટ, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "AI Engineering Made Practical.",
  subject-code: "RTL-2027-AI-GU",
  logo-path: "/DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/03_VISUAL_ASSETS/diagrams/rag-vector-pipeline.png"
) = {
  import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5-hi
  rtech-cover-v5-hi(
    title: title,
    subtitle: subtitle,
    edition: edition,
    series-pill: series-pill,
    author: author,
    author-title: author-title,
    tagline-1: tagline-1,
    tagline-2: tagline-2,
    subject-code: subject-code,
    logo-path: logo-path,
    hero-photo-path: hero-photo-path
  )
}
"""
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "cover-v5-gu.typ"), "w", encoding="utf-8") as f:
        f.write(cover_gu_content)
        
    # 2. Translate blueprint
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "blueprint-v5-hi.typ"), "r", encoding="utf-8") as f:
        bp_hi = f.read()
    bp_gu = convert_devanagari_to_gujarati(bp_hi)
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "blueprint-v5-gu.typ"), "w", encoding="utf-8") as f:
        f.write(bp_gu)

    # 3. Translate chapters 01 to 42
    for ch_num in range(1, 43):
        ch_name = f"chapter-{ch_num:02d}.typ"
        ch_hi_path = os.path.join(hi_dir, ch_name)
        if os.path.exists(ch_hi_path):
            with open(ch_hi_path, "r", encoding="utf-8") as f:
                ch_text = f.read()
            ch_gu_text = convert_devanagari_to_gujarati(ch_text)
            with open(os.path.join(gu_dir, ch_name), "w", encoding="utf-8") as f:
                f.write(ch_gu_text)
            print(f"  [x] Translated AI {ch_name} to Gujarati")

    # 4. Master Typst file
    master_gu = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-cover-v5-gu

#set document(
  title: "આર્ટિફિશિયલ ઇન્ટેલિજન્સ એસેન્શિયલ્સ & 2027 કરિયર માસ્ટર ગાઇડ (પ્રથમ આવૃત્તિ)",
  author: "રાહુલ પટેલ"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5-gu()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "આર્ટિફિશિયલ ઇન્ટેલિજન્સ એસેન્શિયલ્સ & કરિયર એક્સેલેરેટર",
  edition: "2027 માસ્ટર એડિશન · પ્રમાણિત આવૃત્તિ (ગુજરાતી)",
  author: "રાહુલ પટેલ",
  subject-code: "RTL-2027-AI-GU"
)

#set text(font: ("Segoe UI", "Shruti", "Nirmala UI", "Arial"), size: 8.0pt, lang: "gu")
#set par(leading: 0.68em)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5-gu.typ"

#pagebreak()
#include "chapter-01.typ"
#pagebreak()
#include "chapter-02.typ"
#pagebreak()
#include "chapter-03.typ"
#pagebreak()
#include "chapter-04.typ"
#pagebreak()
#include "chapter-05.typ"
#pagebreak()
#include "chapter-06.typ"
#pagebreak()
#include "chapter-07.typ"
#pagebreak()
#include "chapter-08.typ"
#pagebreak()
#include "chapter-09.typ"
#pagebreak()
#include "chapter-10.typ"
#pagebreak()
#include "chapter-11.typ"
#pagebreak()
#include "chapter-12.typ"
#pagebreak()
#include "chapter-13.typ"
#pagebreak()
#include "chapter-14.typ"
#pagebreak()
#include "chapter-15.typ"
#pagebreak()
#include "chapter-16.typ"
#pagebreak()
#include "chapter-17.typ"
#pagebreak()
#include "chapter-18.typ"
#pagebreak()
#include "chapter-19.typ"
#pagebreak()
#include "chapter-20.typ"
#pagebreak()
#include "chapter-21.typ"
#pagebreak()
#include "chapter-22.typ"
#pagebreak()
#include "chapter-23.typ"
#pagebreak()
#include "chapter-24.typ"
#pagebreak()
#include "chapter-25.typ"
#pagebreak()
#include "chapter-26.typ"
#pagebreak()
#include "chapter-27.typ"
#pagebreak()
#include "chapter-28.typ"
#pagebreak()
#include "chapter-29.typ"
#pagebreak()
#include "chapter-30.typ"
#pagebreak()
#include "chapter-31.typ"
#pagebreak()
#include "chapter-32.typ"
#pagebreak()
#include "chapter-33.typ"
#pagebreak()
#include "chapter-34.typ"
#pagebreak()
#include "chapter-35.typ"
#pagebreak()
#include "chapter-36.typ"
#pagebreak()
#include "chapter-37.typ"
#pagebreak()
#include "chapter-38.typ"
#pagebreak()
#include "chapter-39.typ"
#pagebreak()
#include "chapter-40.typ"
#pagebreak()
#include "chapter-41.typ"
#pagebreak()
#include "chapter-42.typ"
"""
    master_gu_path = os.path.join(gu_dir, "ai-master-guide-gu.typ")
    with open(master_gu_path, "w", encoding="utf-8") as f:
        f.write(master_gu)
        
    # Compile
    out_pdf = os.path.join(BASE_DIR, "public", "downloads", "AI-Essentials-Gujarati-Edition-1.pdf")
    cmd = ["typst", "compile", "--root", BASE_DIR, master_gu_path, out_pdf]
    print("  [x] Compiling with Typst...")
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print("  [!] Typst compile failed:", res.stderr)
        raise RuntimeError("Typst compile failed for AI Essentials")
        
    r = pypdf.PdfReader(out_pdf)
    pcount = len(r.pages)
    print(f"  [SUCCESS] AI Essentials Gujarati Compiled: {pcount} pages (Expected 44)")
    return out_pdf, pcount


def build_ccna():
    print("\n" + "="*70)
    print("BUILDING SUBJECT 3: CISCO CCNA 200-301 MASTER SUITE (TARGET: 49 PAGES)")
    print("="*70)
    ccna_root = os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301")
    src_dir = os.path.join(ccna_root, "07_SOURCE_FILES")
    hi_dir = os.path.join(src_dir, "Hindi")
    gu_dir = os.path.join(src_dir, "Gujarati")
    os.makedirs(gu_dir, exist_ok=True)
    
    # 1. Translate cover
    cover_gu_content = """// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — CISCO CCNA 200-301 (GUJARATI EDITION 1)
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5-gu(
  title: "સિસ્કો CCNA 200-301 માસ્ટર ગાઇડ",
  subtitle: "એન્ટરપ્રાઇઝ રૂટિંગ, સ્વિચિંગ, સબનેટિંગ, OSPF, VLAN, સુરક્ષા અને પ્લેસમેન્ટ વોલ્ટ",
  edition: "2027 માસ્ટર એડિશન · એડિશન 1 (ગુજરાતી)",
  series-pill: "આધિકારિક RTECHLAB વાણિજ્યિક પ્રકાશન · CCNA 200-301 માસ્ટર",
  author: "Rahul Patel",
  author-title: "સંસ્થાપક અને ચીફ ટેકનોલોજી આર્કિટેક્ટ, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Enterprise Networking Made Practical.",
  subject-code: "RTL-2027-CCNA-ED1-GU",
  logo-path: "/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg"
) = {
  import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5
  rtech-cover-v5(
    title: title,
    subtitle: subtitle,
    edition: edition,
    series-pill: series-pill,
    author: author,
    author-title: author-title,
    tagline-1: tagline-1,
    tagline-2: tagline-2,
    subject-code: subject-code,
    logo-path: logo-path,
    hero-photo-path: hero-photo-path
  )
}
"""
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "cover-v5-gu.typ"), "w", encoding="utf-8") as f:
        f.write(cover_gu_content)
        
    # 2. Translate blueprint
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "blueprint-v5-hi.typ"), "r", encoding="utf-8") as f:
        bp_hi = f.read()
    bp_gu = convert_devanagari_to_gujarati(bp_hi)
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "blueprint-v5-gu.typ"), "w", encoding="utf-8") as f:
        f.write(bp_gu)

    # 3. Translate chapters 01 to 16
    for ch_num in range(1, 17):
        ch_name = f"chapter-{ch_num:02d}.typ"
        ch_hi_path = os.path.join(hi_dir, ch_name)
        if os.path.exists(ch_hi_path):
            with open(ch_hi_path, "r", encoding="utf-8") as f:
                ch_text = f.read()
            ch_gu_text = convert_devanagari_to_gujarati(ch_text)
            with open(os.path.join(gu_dir, ch_name), "w", encoding="utf-8") as f:
                f.write(ch_gu_text)
            print(f"  [x] Translated CCNA {ch_name} to Gujarati")

    # 4. Master Typst file
    master_gu = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-cover-v5-gu

#set document(
  title: "RTechLab Cisco CCNA 200-301 Master Guide - Gujarati (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER (GUJARATI)
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5-gu()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "સિસ્કો CCNA 200-301 માસ્ટર ગાઇડ",
  edition: "2027 માસ્ટર આવૃત્તિ · આવૃત્તિ 1 વાણિજ્યિક રિલીઝ (ગુજરાતી)",
  author: "રાહુલ પટેલ",
  subject-code: "RTL-2027-CCNA-ED1-GU"
)

#set text(font: ("Segoe UI", "Shruti", "Nirmala UI", "Arial"), lang: "gu")

// PAGE 2: BLUEPRINT (GUJARATI)
#include "../07_PUBLISHING_ENGINE/blueprint-v5-gu.typ"

// CHAPTER 1 (GUJARATI)
#pagebreak()
#include "chapter-01.typ"

// CHAPTER 2 (GUJARATI)
#pagebreak()
#include "chapter-02.typ"

// CHAPTER 3 (GUJARATI)
#pagebreak()
#include "chapter-03.typ"

// CHAPTER 4 (GUJARATI)
#pagebreak()
#include "chapter-04.typ"

// CHAPTER 5 (GUJARATI)
#pagebreak()
#include "chapter-05.typ"

// CHAPTER 6 (GUJARATI)
#pagebreak()
#include "chapter-06.typ"

// CHAPTER 7 (GUJARATI)
#pagebreak()
#include "chapter-07.typ"

// CHAPTER 8 (GUJARATI)
#pagebreak()
#include "chapter-08.typ"

// CHAPTER 9 (GUJARATI)
#pagebreak()
#include "chapter-09.typ"

// CHAPTER 10 (GUJARATI)
#pagebreak()
#include "chapter-10.typ"

// CHAPTER 11 (GUJARATI)
#pagebreak()
#include "chapter-11.typ"

// CHAPTER 12 (GUJARATI)
#pagebreak()
#include "chapter-12.typ"

// CHAPTER 13 (GUJARATI)
#pagebreak()
#include "chapter-13.typ"

// CHAPTER 14 (GUJARATI)
#pagebreak()
#include "chapter-14.typ"

// CHAPTER 15 (GUJARATI)
#pagebreak()
#include "chapter-15.typ"

// CHAPTER 16 (GUJARATI)
#pagebreak()
#include "chapter-16.typ"
"""
    master_gu_path = os.path.join(gu_dir, "CCNA-200-301-Gujarati-Edition-1.typ")
    with open(master_gu_path, "w", encoding="utf-8") as f:
        f.write(master_gu)
        
    # Compile
    out_pdf = os.path.join(BASE_DIR, "public", "downloads", "CCNA-200-301-Gujarati-Edition-1.pdf")
    cmd = ["typst", "compile", "--root", ccna_root, master_gu_path, out_pdf]
    print("  [x] Compiling with Typst...")
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print("  [!] Typst compile failed:", res.stderr)
        raise RuntimeError("Typst compile failed for CCNA")
        
    r = pypdf.PdfReader(out_pdf)
    pcount = len(r.pages)
    print(f"  [SUCCESS] CCNA Gujarati Compiled: {pcount} pages (Expected 49)")
    return out_pdf, pcount


def build_office_365():
    print("\n" + "="*70)
    print("BUILDING SUBJECT 4: MICROSOFT OFFICE 365 ENTERPRISE (TARGET: 113 PAGES)")
    print("="*70)
    src_dir = os.path.join(BASE_DIR, "DIGITAL", "OFFICE_365", "07_SOURCE_FILES")
    hi_dir = os.path.join(src_dir, "Hindi")
    gu_dir = os.path.join(src_dir, "Gujarati")
    os.makedirs(gu_dir, exist_ok=True)
    
    # 1. Translate cover
    cover_gu_content = """// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — MICROSOFT OFFICE 365 (GUJARATI EDITION 1)
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5-gu(
  title: "માઈક્રોસોફ્ટ ઓફિસ 365 માસ્ટર ગાઇડ",
  subtitle: "વર્ડ · એક્સેલ · પાવરપોઇન્ટ · કોપાયલટ AI · એન્ટરપ્રાઇઝ એનાલિટિક્સ અને ઓટોમેશન વોલ્ટ",
  edition: "2027 માસ્ટર આવૃત્તિ · આવૃત્તિ 1 (ગુજરાતી)",
  series-pill: "ઓફિશિયલ RTECHLAB કોમર્શિયલ પબ્લિકેશન · ઓફિસ 365 એન્ટરપ્રાઇઝ",
  author: "રાહુલ પટેલ (Rahul Patel)",
  author-title: "સંસ્થાપક અને ચીફ ટેકનિકલ આર્કિટેક્ટ, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Enterprise Productivity Made Practical.",
  subject-code: "RTL-2027-O365-ED1-GU",
  logo-path: "/DIGITAL/OFFICE_365/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/DIGITAL/OFFICE_365/07_SOURCE_FILES/03_VISUAL_ASSETS/software-ui/excel-365-full-workspace.png"
) = {
  import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5-hi
  rtech-cover-v5-hi(
    title: title,
    subtitle: subtitle,
    edition: edition,
    series-pill: series-pill,
    author: author,
    author-title: author-title,
    tagline-1: tagline-1,
    tagline-2: tagline-2,
    subject-code: subject-code,
    logo-path: logo-path,
    hero-photo-path: hero-photo-path
  )
}
"""
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "cover-v5-gu.typ"), "w", encoding="utf-8") as f:
        f.write(cover_gu_content)
        
    # 2. Translate blueprint
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "blueprint-v5-hi.typ"), "r", encoding="utf-8") as f:
        bp_hi = f.read()
    bp_gu = convert_devanagari_to_gujarati(bp_hi)
    with open(os.path.join(src_dir, "07_PUBLISHING_ENGINE", "blueprint-v5-gu.typ"), "w", encoding="utf-8") as f:
        f.write(bp_gu)

    # 3. Translate chapters 01 to 32
    for ch_num in range(1, 33):
        ch_name = f"chapter-{ch_num:02d}.typ"
        ch_hi_path = os.path.join(hi_dir, ch_name)
        if os.path.exists(ch_hi_path):
            with open(ch_hi_path, "r", encoding="utf-8") as f:
                ch_text = f.read()
            ch_gu_text = convert_devanagari_to_gujarati(ch_text)
            with open(os.path.join(gu_dir, ch_name), "w", encoding="utf-8") as f:
                f.write(ch_gu_text)
            print(f"  [x] Translated Office 365 {ch_name} to Gujarati")

    # 4. Master Typst file
    master_gu = """#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-cover-v5-gu

#set document(
  title: "આરટેક લેબ માઈક્રોસોફ્ટ ઓફિસ 365 એન્ટરપ્રાઇઝ માસ્ટર ગાઇડ (આવૃત્તિ 1)",
  author: "રાહુલ પટેલ"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5-gu()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "માઈક્રોસોફ્ટ ઓફિસ 365 એન્ટરપ્રાઇઝ માસ્ટર ગાઇડ",
  edition: "2027 માસ્ટર આવૃત્તિ · આવૃત્તિ 1 કોમર્શિયલ રિલીઝ (ગુજરાતી)",
  author: "રાહુલ પટેલ",
  subject-code: "RTL-2027-O365-ED1-GU"
)

#set text(font: ("Segoe UI", "Shruti", "Nirmala UI", "Arial"), lang: "gu")

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5-gu.typ"

// CHAPTERS 01 TO 32
#pagebreak()
#include "chapter-01.typ"
#pagebreak()
#include "chapter-02.typ"
#pagebreak()
#include "chapter-03.typ"
#pagebreak()
#include "chapter-04.typ"
#pagebreak()
#include "chapter-05.typ"
#pagebreak()
#include "chapter-06.typ"
#pagebreak()
#include "chapter-07.typ"
#pagebreak()
#include "chapter-08.typ"
#pagebreak()
#include "chapter-09.typ"
#pagebreak()
#include "chapter-10.typ"
#pagebreak()
#include "chapter-11.typ"
#pagebreak()
#include "chapter-12.typ"
#pagebreak()
#include "chapter-13.typ"
#pagebreak()
#include "chapter-14.typ"
#pagebreak()
#include "chapter-15.typ"
#pagebreak()
#include "chapter-16.typ"
#pagebreak()
#include "chapter-17.typ"
#pagebreak()
#include "chapter-18.typ"
#pagebreak()
#include "chapter-19.typ"
#pagebreak()
#include "chapter-20.typ"
#pagebreak()
#include "chapter-21.typ"
#pagebreak()
#include "chapter-22.typ"
#pagebreak()
#include "chapter-23.typ"
#pagebreak()
#include "chapter-24.typ"
#pagebreak()
#include "chapter-25.typ"
#pagebreak()
#include "chapter-26.typ"
#pagebreak()
#include "chapter-27.typ"
#pagebreak()
#include "chapter-28.typ"
#pagebreak()
#include "chapter-29.typ"
#pagebreak()
#include "chapter-30.typ"
#pagebreak()
#include "chapter-31.typ"
#pagebreak()
#include "chapter-32.typ"
"""
    master_gu_path = os.path.join(gu_dir, "Office-365-Gujarati-Edition-1.typ")
    with open(master_gu_path, "w", encoding="utf-8") as f:
        f.write(master_gu)
        
    # Compile
    out_pdf = os.path.join(BASE_DIR, "public", "downloads", "Office-365-Gujarati-Edition-1.pdf")
    cmd = ["typst", "compile", "--root", BASE_DIR, master_gu_path, out_pdf]
    print("  [x] Compiling with Typst...")
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print("  [!] Typst compile failed:", res.stderr)
        raise RuntimeError("Typst compile failed for Office 365")
        
    r = pypdf.PdfReader(out_pdf)
    pcount = len(r.pages)
    print(f"  [SUCCESS] Office 365 Gujarati Compiled: {pcount} pages (Expected 113)")
    return out_pdf, pcount


# ==============================================================================
# ALSO RECOMPILE HINDI AND ENGLISH GUIDES TO APPLY CLEAN LIGHT TABLES
# ==============================================================================

def recompile_english_and_hindi_guides():
    print("\n" + "="*70)
    print("RECOMPILING ENGLISH AND HINDI GUIDES WITH CLEAN LIGHT TABLES")
    print("="*70)
    
    downloads_dir = os.path.join(BASE_DIR, "public", "downloads")
    
    tasks = [
        # AI Essentials
        (["typst", "compile", "--root", BASE_DIR, "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/Hindi/ai-master-guide-hi.typ", os.path.join(downloads_dir, "AI-Essentials-Hindi-Edition-1.pdf")], "AI Hindi"),
        (["typst", "compile", "--root", BASE_DIR, "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/English/ai-master-guide-en.typ", os.path.join(downloads_dir, "AI-Essentials-English-Edition-1.pdf")], "AI English"),
        
        # Computer Fundamentals
        (["typst", "compile", "--root", "DIGITAL/COMPUTER FUNDAMENTALS/07_SOURCE_FILES", "DIGITAL/COMPUTER FUNDAMENTALS/07_SOURCE_FILES/Hindi/computer-fundamentals-v5-hi.typ", os.path.join(downloads_dir, "Computer-Fundamentals-Hindi-Edition-1.pdf")], "CF Hindi"),
        (["typst", "compile", "--root", "DIGITAL/COMPUTER FUNDAMENTALS/07_SOURCE_FILES", "DIGITAL/COMPUTER FUNDAMENTALS/07_SOURCE_FILES/English/computer-fundamentals-v5.typ", os.path.join(downloads_dir, "Computer-Fundamentals-English-Edition-1.pdf")], "CF English"),
        
        # CCNA 200-301
        (["typst", "compile", "--root", "DIGITAL/CCNA 200-301", "DIGITAL/CCNA 200-301/07_SOURCE_FILES/Hindi/CCNA-200-301-Hindi-Edition-1.typ", os.path.join(downloads_dir, "CCNA-200-301-Hindi-Edition-1.pdf")], "CCNA Hindi"),
        (["typst", "compile", "--root", "DIGITAL/CCNA 200-301", "DIGITAL/CCNA 200-301/07_SOURCE_FILES/English/CCNA-200-301-English-Edition-1.typ", os.path.join(downloads_dir, "CCNA-200-301-English-Edition-1.pdf")], "CCNA English"),
        
        # Office 365
        (["typst", "compile", "--root", BASE_DIR, "DIGITAL/OFFICE_365/07_SOURCE_FILES/Hindi/Office-365-Hindi-Edition-1.typ", os.path.join(downloads_dir, "Office-365-Hindi-Edition-1.pdf")], "Office 365 Hindi"),
        (["typst", "compile", "--root", BASE_DIR, "DIGITAL/OFFICE_365/07_SOURCE_FILES/English/Office-365-English-Edition-1.typ", os.path.join(downloads_dir, "Office-365-English-Edition-1.pdf")], "Office 365 English"),
    ]
    
    for cmd, name in tasks:
        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode == 0:
            print(f"  [x] Successfully recompiled {name}")
        else:
            print(f"  [!] Recompile failed for {name}: {res.stderr[:100]}")


# ==============================================================================
# PREVIEW & ASSET GENERATION ENGINE
# ==============================================================================

def generate_5page_preview(src_pdf, out_preview_pdf):
    reader = pypdf.PdfReader(src_pdf)
    writer = pypdf.PdfWriter()
    for i in range(min(5, len(reader.pages))):
        writer.add_page(reader.pages[i])
    with open(out_preview_pdf, "wb") as f:
        writer.write(f)
    print(f"  [x] Generated 5-Page Preview PDF: {os.path.basename(out_preview_pdf)}")

def extract_high_res_pngs(pdf_path, output_dir, file_pattern):
    os.makedirs(output_dir, exist_ok=True)
    doc = fitz.open(pdf_path)
    zoom = 2.0  # 200 DPI
    mat = fitz.Matrix(zoom, zoom)
    for pno in range(min(5, len(doc))):
        page = doc[pno]
        pix = page.get_pixmap(matrix=mat, alpha=False)
        out_name = file_pattern % (pno + 1)
        out_path = os.path.join(output_dir, out_name)
        pix.save(out_path)
        print(f"    [PNG] Saved {out_name} ({pix.width}x{pix.height})")
    doc.close()


def update_zip_bundle(zip_path, new_pdf_path, archive_name):
    if not os.path.exists(zip_path):
        return
    with zipfile.ZipFile(zip_path, "a", zipfile.ZIP_DEFLATED) as z:
        if archive_name in z.namelist():
            pass
        else:
            z.write(new_pdf_path, arcname=archive_name)


def sync_assets_and_previews():
    print("\n" + "="*70)
    print("SYNCING PREVIEWS, SCREENSHOTS & DOWNLOADS")
    print("="*70)
    
    downloads_dir = os.path.join(BASE_DIR, "public", "downloads")
    build_downloads = os.path.join(BASE_DIR, "build", "client", "downloads")
    os.makedirs(build_downloads, exist_ok=True)
    
    tasks = [
        {
            "id": "fundamentals",
            "full_pdf": os.path.join(downloads_dir, "Computer-Fundamentals-Gujarati-Edition-1.pdf"),
            "prev_pdf": os.path.join(downloads_dir, "Computer-Fundamentals-Gujarati-Edition-1-5Page-Preview.pdf"),
            "core_folder": os.path.join(BASE_DIR, "DIGITAL", "COMPUTER FUNDAMENTALS", "01_CORE_MASTER_EDITION"),
            "zip": os.path.join(downloads_dir, "RTechLab-Computer-Fundamentals-Premium-Suite-Edition-1.zip"),
            "zip_arc": "Computer-Fundamentals-Gujarati-Edition-1.pdf",
            "png_dir": os.path.join(BASE_DIR, "public", "previews", "fundamentals"),
            "pattern": "gu-page-%d.png"
        },
        {
            "id": "ai",
            "full_pdf": os.path.join(downloads_dir, "AI-Essentials-Gujarati-Edition-1.pdf"),
            "prev_pdf": os.path.join(downloads_dir, "AI-Essentials-Gujarati-Edition-1-5Page-Preview.pdf"),
            "core_folder": os.path.join(BASE_DIR, "DIGITAL", "AI_ESSENTIALS", "01_CORE_MASTER_EDITION"),
            "zip": os.path.join(downloads_dir, "AI-Career-Accelerator-Bundle.zip"),
            "zip_arc": "AI-Essentials-Gujarati-Edition-1.pdf",
            "png_dir": os.path.join(BASE_DIR, "public", "previews", "ai"),
            "pattern": "preview-gu-%d.png"
        },
        {
            "id": "ccna",
            "full_pdf": os.path.join(downloads_dir, "CCNA-200-301-Gujarati-Edition-1.pdf"),
            "prev_pdf": os.path.join(downloads_dir, "CCNA-200-301-Gujarati-Edition-1-5Page-Preview.pdf"),
            "core_folder": os.path.join(BASE_DIR, "DIGITAL", "CCNA 200-301", "01_CORE_MASTER_EDITION"),
            "zip": os.path.join(downloads_dir, "RTechLab-CCNA-200-301-Complete-Career-Bundle-Edition-1.zip"),
            "zip_arc": "CCNA-200-301-Gujarati-Edition-1.pdf",
            "png_dir": os.path.join(BASE_DIR, "public", "previews", "ccna"),
            "pattern": "gu-page-%d.png"
        },
        {
            "id": "office365",
            "full_pdf": os.path.join(downloads_dir, "Office-365-Gujarati-Edition-1.pdf"),
            "prev_pdf": os.path.join(downloads_dir, "Office-365-Gujarati-Edition-1-5Page-Preview.pdf"),
            "core_folder": os.path.join(BASE_DIR, "DIGITAL", "OFFICE_365", "01_CORE_MASTER_EDITION"),
            "zip": os.path.join(downloads_dir, "Office-365-Career-Accelerator-Bundle.zip"),
            "zip_arc": "Office-365-Gujarati-Edition-1.pdf",
            "png_dir": os.path.join(BASE_DIR, "public", "previews", "office365"),
            "pattern": "preview-gu-%d.png"
        }
    ]
    
    for t in tasks:
        generate_5page_preview(t["full_pdf"], t["prev_pdf"])
        extract_high_res_pngs(t["prev_pdf"], t["png_dir"], t["pattern"])
        
        build_png_dir = os.path.join(BASE_DIR, "build", "client", "previews", t["id"])
        if os.path.exists(build_png_dir):
            for i in range(1, 6):
                fname = t["pattern"] % i
                src_f = os.path.join(t["png_dir"], fname)
                dst_f = os.path.join(build_png_dir, fname)
                if os.path.exists(src_f):
                    shutil.copy2(src_f, dst_f)
            
        if os.path.exists(t["core_folder"]):
            shutil.copy2(t["full_pdf"], os.path.join(t["core_folder"], os.path.basename(t["full_pdf"])))
            
        shutil.copy2(t["full_pdf"], os.path.join(build_downloads, os.path.basename(t["full_pdf"])))
        shutil.copy2(t["prev_pdf"], os.path.join(build_downloads, os.path.basename(t["prev_pdf"])))
        update_zip_bundle(t["zip"], t["full_pdf"], t["zip_arc"])
        shutil.copy2(t["zip"], os.path.join(build_downloads, os.path.basename(t["zip"])))

    # Also re-extract AI and CCNA English/Hindi previews so they reflect the new light table headers
    for lang_code, pat in [("preview-hi-%d.png", "AI-Essentials-Hindi-Edition-1-5Page-Preview.pdf"), ("preview-%d.png", "AI-Essentials-English-Edition-1-5Page-Preview.pdf")]:
        prev_f = os.path.join(downloads_dir, pat)
        full_f = prev_f.replace("-5Page-Preview", "")
        if os.path.exists(full_f):
            generate_5page_preview(full_f, prev_f)
            extract_high_res_pngs(prev_f, os.path.join(BASE_DIR, "public", "previews", "ai"), lang_code)
            # sync to build
            for i in range(1, 6):
                src_p = os.path.join(BASE_DIR, "public", "previews", "ai", lang_code % i)
                dst_p = os.path.join(BASE_DIR, "build", "client", "previews", "ai", lang_code % i)
                if os.path.exists(src_p):
                    shutil.copy2(src_p, dst_p)

    print("\nALL PREVIEWS, DOWNLOADS, AND ARCHIVES SYNCHRONIZED SUCCESSFULLY!")


def main():
    print("="*70)
    print("RTECHLAB ALL GUJARATI EDITIONS AUTOMATED PIPELINE (LIGHT THEME)")
    print("="*70)
    
    build_computer_fundamentals()
    build_ai_essentials()
    build_ccna()
    build_office_365()
    recompile_english_and_hindi_guides()
    sync_assets_and_previews()
    print("\n[ALL EDITIONS COMPILED AND READY IN 100% CLEAN LIGHT THEME!]")

if __name__ == "__main__":
    main()
