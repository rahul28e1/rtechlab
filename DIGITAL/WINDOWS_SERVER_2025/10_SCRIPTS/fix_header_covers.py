en_header_path = 'DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/chapters_en/header.typ'
with open(en_header_path, 'r', encoding='utf-8') as f:
    en_h = f.read()

en_cover_call = '''#rtech-server-cover(
  title: "Microsoft Windows Server 2025 & Active Directory",
  subtitle: "Client-Server Architecture · AD DS Domain Controller · Group Policy (GPO) · DNS & DHCP · Storage Spaces · Hybrid Azure Arc · Top 50 MNC Placement Vault",
  edition: "2027 Master Commercial Edition · Edition 1 (Server 2025 Ready)",
  series-pill: "Official RTechLab Certified Systems Administration Guide",
  author: "Rahul Patel",
  author-title: "Chief Technology Architect & Founder, RTechLab",
  lang-tag: "ENGLISH COMPLETE MASTER EDITION (INTERNATIONAL EDITION)"
)'''

en_h = en_h.replace('#rtech-server-cover()', en_cover_call)
with open(en_header_path, 'w', encoding='utf-8') as f:
    f.write(en_h)

gu_header_path = 'DIGITAL/WINDOWS_SERVER_2025/07_SOURCE_FILES/chapters_gu/header.typ'
with open(gu_header_path, 'r', encoding='utf-8') as f:
    gu_h = f.read()

gu_cover_call = '''#rtech-server-cover(
  title: "માઇક્રોસોફ્ટ વિન્ડોઝ સર્વર 2025 અને એક્ટિવ ડિરેક્ટરી",
  subtitle: "ક્લાયન્ટ-સર્વર આર્કિટેક્ચર · AD DS ડોમેન કંટ્રોલર · ગ્રુપ પોલિસી (GPO) · DNS અને DHCP · સ્ટોરેજ સ્પેસિસ · હાઇબ્રિડ એઝ્યુર આર્ક · ટોપ 50 MNC પ્લેસમેન્ટ વોલ્ટ",
  edition: "2027 માસ્ટર કોમર્શિયલ એડિશન · એડિશન 1 (Server 2025 Ready)",
  series-pill: "ઓફિશિયલ આરટેક લેબ પ્રમાણિત સિસ્ટમ એડમિનિસ્ટ્રેશન ગાઇડ",
  author: "રાહુલ પટેલ (Rahul Patel)",
  author-title: "ચીફ ટેકનોલોજી આર્કિટેક્ટ અને સ્થાપક, RTechLab",
  lang-tag: "ગુજરાતી માસ્ટર એડિશન (GUJARATI TECHNICAL EDITION)"
)'''

gu_h = gu_h.replace('#rtech-server-cover()', gu_cover_call)
with open(gu_header_path, 'w', encoding='utf-8') as f:
    f.write(gu_h)

print('Updated header covers for both EN and GU.')
