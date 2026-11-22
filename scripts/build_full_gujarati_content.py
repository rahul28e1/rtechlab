# -*- coding: utf-8 -*-
"""
Full Gujarati Curriculum Generator
Translates tally_content_hi.py into scripts/tally_content_gu.py preserving all Typst syntax.
"""
import os
import sys
import re

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SCRIPTS_DIR = os.path.join(BASE_DIR, "scripts")
sys.path.append(SCRIPTS_DIR)

from tally_content_hi import get_hindi_chapters

def transliterate_devanagari_to_gujarati(text):
    # Dictionary of key words to replace before character-level mapping
    word_replacements = [
        ("अध्याय", "પ્રકરણ"),
        ("विषय", "વિષય"),
        ("मुख्य सारांश", "મુખ્ય સારાંશ"),
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
        ("विवरण (डेबिट पक्ष)", "વિગત (ઉધાર બાજુ)"),
        ("विवरण (क्रेडिट पक्ष)", "વિગત (જમા બાજુ)"),
        ("राशि (₹)", "રકમ (₹)"),
        ("राशि", "રકમ"),
        ("कुल योग", "કુલ સરવાળો"),
        ("पूंजी एवं देनदारियां", "મૂડી અને જવાબદારીઓ"),
        ("संपत्तियां एवं परिसंपत्तियां", "મિલકતો અને લેણાં"),
        ("रोकड़", "રોકડ"),
        ("खाता", "ખાતું"),
        ("खाते", "ખાતાઓ"),
        ("लाभ एवं हानि खाता", "નફા-નુકસાન ખાતું"),
        ("व्यापार खाता", "વેપાર ખાતું"),
        ("बैलेंस शीट", "બેલેન્સ શીટ"),
        ("ट्रायल बैलेंस", "કાચું સરવૈયું"),
        ("मूल्यह्रास", "ઘસારો"),
        ("छूट", "વટાવ"),
        ("खरीद", "ખરીદી"),
        ("बिक्री", "વેચાણ"),
        ("देनदार", "દેવાદાર"),
        ("देनदारों", "દેવાદારો"),
        ("लेनदार", "લેણદાર"),
        ("लेनदारों", "લેણદારો"),
        ("पूंजी", "મૂડી"),
        ("आहरण", "ઉપાડ"),
        ("वेतन", "પગાર"),
        ("किराया", "ભાડું"),
        ("मजदूरी", "મજૂરી"),
        ("धुलाई", "નૂર / ભાડું"),
        ("और", "અને"),
        ("एवं", "અને"),
        ("तथा", "અને"),
        ("या", "અથવા"),
        ("नहीं", "નહીં"),
        ("है", "છે"),
        ("हैं", "છે"),
        ("था", "હતું"),
        ("थी", "હતી"),
        ("थे", "હતા"),
        ("किया जाता है", "કરવામાં આવે છે"),
        ("कहा जाता है", "કહેવામાં આવે છે"),
        ("होता है", "થાય છે"),
        ("होती है", "થાય છે"),
        ("होते हैं", "થાય છે"),
        ("सकते हैं", "શકો છો"),
        ("सकता है", "શકે છે"),
        ("सकती है", "શકે છે"),
        ("चाहिए", "જોઈએ"),
        ("का", "નો"),
        ("की", "ની"),
        ("के", "ના"),
        ("में", "માં"),
        ("से", "થી"),
        ("को", "ને"),
        ("पर", "પર"),
        ("हेतु", "માટે"),
        ("लिए", "માટે")
    ]

    # Protect Typst code, hashtags, and ASCII text
    # Character conversion: if in range 0x0901 to 0x097F, add 0x0180
    res = []
    i = 0
    n = len(text)
    while i < n:
        c = text[i]
        code = ord(c)
        if 0x0901 <= code <= 0x097F:
            # Map nukta, vowels, consonants directly
            guj_char = chr(code + 0x0180)
            res.append(guj_char)
            i += 1
        else:
            res.append(c)
            i += 1
    out_text = ''.join(res)

    # Perform key word fixes on the Gujarati text
    # Replace common words in Gujarati script
    guj_word_replacements = [
        ("અધ્યાય", "પ્રકરણ"),
        ("વિષય", "વિષય"),
        ("મુખ્ય સારાંશ", "મુખ્ય સારાંશ"),
        ("પરીક્ષા હેતુ મુખ્ય બિંદુ", "પરીક્ષા લક્ષી મુખ્ય મુદ્દાઓ"),
        ("સહી ઉત્તર:", "સાચો જવાબ:"),
        ("આદર્શ ઉત્તર:", "આદર્શ જવાબ:"),
        ("વ્યાખ્યા:", "સમજૂતી:"),
        ("કૉર્પોરેટ વ્યાખ્યા:", "કોર્પોરેટ સમજૂતી:"),
        ("પ્રશ્ન એવં વિકલ્પ", "પ્રશ્ન અને વિકલ્પો"),
        ("ઉત્તર એવં વિસ્તૃત વ્યાખ્યા", "જવાબ અને વિગતવાર સમજૂતી"),
        ("ક્ર.સં.", "ક્રમ"),
        ("ક્ર.", "ક્રમ"),
        ("રાશિ (₹)", "રકમ (₹)"),
        ("રાશિ", "રકમ"),
        ("કુલ યોગ", "કુલ સરવાળો"),
        ("પૂંજી", "મૂડી"),
        ("રોકડ઼", "રોકડ"),
        ("ખાતા", "ખાતું"),
        ("ખાતે", "ખાતાઓ"),
        ("લાભ એવં હાનિ ખાતા", "નફા-નુકસાન ખાતું"),
        ("વ્યાપાર ખાતા", "વેપાર ખાતું"),
        ("ખરીદ", "ખરીદી"),
        ("બિક્રી", "વેચાણ"),
        ("દેનદાર", "દેવાદાર"),
        ("લેનદાર", "લેણદાર"),
        ("આહરણ", "ઉપાડ"),
        ("વેતન", "પગાર"),
        ("કિરાયા", "ભાડું"),
        ("મજદૂરી", "મજૂરી"),
        ("ઔર", "અને"),
        ("એવં", "અને"),
        ("નહીં", "નહીં"),
        ("હૈ", "છે"),
        ("હૈં", "છે"),
        ("કિયા જાતા હૈ", "કરવામાં આવે છે"),
        ("હોતા હૈ", "થાય છે"),
        ("સકતે હૈં", "શકો છો"),
        ("સકતા હૈ", "શકે છે"),
        ("ચાહિએ", "જોઈએ")
    ]
    for src, dst in guj_word_replacements:
        out_text = out_text.replace(src, dst)

    return out_text

def build_gujarati():
    hi_chapters = get_hindi_chapters()
    gu_chapters = {}

    print(f"Translating {len(hi_chapters)} chapters to Gujarati...")
    for ch_num in range(1, 13):
        hi_content = hi_chapters[ch_num]
        gu_content = transliterate_devanagari_to_gujarati(hi_content)
        gu_chapters[ch_num] = gu_content
        print(f"  Ch {ch_num}: {len(gu_content)} chars")

    out_file = os.path.join(SCRIPTS_DIR, "tally_content_gu.py")
    with open(out_file, "w", encoding="utf-8") as f:
        f.write('''# -*- coding: utf-8 -*-
"""
Tally Prime Master Curriculum — Gujarati Edition (11 Comprehensive Topics + Capstone)
Standardized by Rahul Patel (Lead Corporate Accounting Trainer, IANT Palanpur | Founder, RTechLab)
Direct Contact: rahul.28e1@gmail.com
"""

def get_gujarati_chapters():
    chapters = {}
''')
        for ch in range(1, 13):
            escaped_content = gu_chapters[ch].replace('\\', '\\\\').replace('"""', '\\"\\"\\"')
            f.write(f'    chapters[{ch}] = """{escaped_content}"""\n\n')
        f.write('    return chapters\n')

    print(f"Successfully wrote {out_file} ({os.path.getsize(out_file)} bytes)")

if __name__ == "__main__":
    build_gujarati()
