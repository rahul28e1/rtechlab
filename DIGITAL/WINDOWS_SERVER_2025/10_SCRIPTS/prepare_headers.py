with open('DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/master_book_en.typ', 'r', encoding='utf-8') as f:
    en_header = f.readlines()[:216]

en_header_str = ''.join(en_header)
en_header_str = en_header_str.replace('edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1 (Server 2025 Flagship)",', 'edition: "2027 Master Commercial Edition · Edition 1 (Server 2025 Flagship)",')
en_header_str = en_header_str.replace('// PAGE 02: MASTER TABLE OF CONTENTS — PART 1 (कोर इंफ्रास्ट्रक्चर एवं डायरेक्टरी सर्विसेज)', '// PAGE 02: MASTER TABLE OF CONTENTS — PART 1 (Core Infrastructure & Directory Services)')
en_header_str = en_header_str.replace('// PAGE 03: MASTER TABLE OF CONTENTS — PART 2 (नेटवर्क सर्विसेज, क्लाउड, बैकअप एवं प्लेसमेंट)', '// PAGE 03: MASTER TABLE OF CONTENTS — PART 2 (Network Services, Cloud, Backup & Placement)')
en_header_str = en_header_str.replace('lang: "hi"', 'lang: "en"')

with open('DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/chapters_en/header.typ', 'w', encoding='utf-8') as f:
    f.write(en_header_str)

with open('DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/master_book_gu.typ', 'r', encoding='utf-8') as f:
    gu_header = f.readlines()[:216]

gu_header_str = ''.join(gu_header)
gu_header_str = gu_header_str.replace('edition: "2027 मास्टर कमर्शियल संस्करण · एडिशन 1 (Server 2025 Flagship)",', 'edition: "2027 માસ્ટર કોમર્શિયલ એડિશન · એડિશન 1 (Server 2025 Flagship)",')
gu_header_str = gu_header_str.replace('// PAGE 02: MASTER TABLE OF CONTENTS — PART 1 (कोर इंफ्रास्ट्रक्चर एवं डायरेक्टरी सर्विसेज)', '// PAGE 02: MASTER TABLE OF CONTENTS — PART 1 (કોર ઇન્ફ્રાસ્ટ્રક્ચર અને ડિરેક્ટરી સર્વિસિસ)')
gu_header_str = gu_header_str.replace('// PAGE 03: MASTER TABLE OF CONTENTS — PART 2 (नेटवर्क सर्विसेज, क्लाउड, बैकअप एवं प्लेसमेंट)', '// PAGE 03: MASTER TABLE OF CONTENTS — PART 2 (નેટવર્ક સર્વિસિસ, ક્લાઉડ, બેકઅપ અને પ્લેસમેન્ટ)')
gu_header_str = gu_header_str.replace('lang: "hi"', 'lang: "gu"')

with open('DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/chapters_gu/header.typ', 'w', encoding='utf-8') as f:
    f.write(gu_header_str)

print("Headers written successfully.")
