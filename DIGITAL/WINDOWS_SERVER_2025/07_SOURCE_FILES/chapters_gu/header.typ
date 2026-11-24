#import "../07_PUBLISHING_ENGINE/server-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-server.typ": rtech-server-cover

// Set up the Master Book Wrapper
#show: rtech-server-book.with(
  title: "Windows Server 2025 & Active Directory Master Handbook",
  subtitle: "ક્લાયન્ટ-સર્વર આર્કિટેક્ચર · AD DS ડોમેન કંટ્રોલર · ગ્રુપ પોલિસી (GPO) · DNS અને DHCP · સ્ટોરેજ સ્પેસિસ · હાઇબ્રિડ એઝ્યુર આર્ક · ટોપ 50 MNC પ્લેસમેન્ટ વોલ્ટ",
  author: "રાહુલ પટેલ (Rahul Patel)",
  edition: "2027 માસ્ટર કોમર્શિયલ એડિશન · એડિશન 1 (Server 2025 Flagship)",
  subject-code: "RTL-2027-WINSRV-ED1",
  lang: "gu"
)

// =============================================================================
// PAGE 01: OFFICIAL MASTER COVER PAGE
// =============================================================================
#rtech-server-cover(
  title: "માઇક્રોસોફ્ટ વિન્ડોઝ સર્વર 2025 અને એક્ટિવ ડિરેક્ટરી",
  subtitle: "ક્લાયન્ટ-સર્વર આર્કિટેક્ચર · AD DS ડોમેન કંટ્રોલર · ગ્રુપ પોલિસી (GPO) · DNS અને DHCP · સ્ટોરેજ સ્પેસિસ · હાઇબ્રિડ એઝ્યુર આર્ક · ટોપ 50 MNC પ્લેસમેન્ટ વોલ્ટ",
  edition: "2027 માસ્ટર કોમર્શિયલ એડિશન · એડિશન 1 (Server 2025 Ready)",
  series-pill: "ઓફિશિયલ આરટેક લેબ પ્રમાણિત સિસ્ટમ એડમિનિસ્ટ્રેશન ગાઇડ",
  author: "રાહુલ પટેલ (Rahul Patel)",
  author-title: "ચીફ ટેકનોલોજી આર્કિટેક્ટ અને સ્થાપક, RTechLab",
  lang-tag: "ગુજરાતી માસ્ટર એડિશન (GUJARATI TECHNICAL EDITION)"
)

#pagebreak()


// =============================================================================
// PAGE 02: MASTER TABLE OF CONTENTS — PART 1 (કોર ઇન્ફ્રાસ્ટ્રક્ચર અને ડિરેક્ટરી સર્વિસિસ)
// =============================================================================
[#metadata("toc") <table-of-contents>]

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 3pt),
    text(size: 8pt, weight: "bold", fill: rtech-blue)[સંપૂર્ણ 14 પ્રકરણ માસ્ટર ઇન્ડેક્સ · ભાગ 1 (પ્રકરણ 01 થી 07) · પૃષ્ઠ 1 / 2]
  )
  #v(2.5pt)
  #text(size: 17pt, weight: "black", fill: rtech-navy)[વિગતવાર વિષય સૂચિ — ભાગ 1 (પ્રકરણ 01 થી 07)]
  #v(2pt)
  #text(size: 8.2pt, fill: rtech-muted)[(કોઈપણ પ્રકરણ પર સીધા ક્લિક કરીને તે પેજ પર જાઓ · બાકીના પ્રકરણ 08 થી 14 આગળના પેજ 03 પર છે)]
  #v(4pt)
  #line(length: 100%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(3pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  radius: 6pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 9pt, y: 7.5pt),
  [
    #grid(
      columns: (1fr, auto),
      row-gutter: 8pt,
      align: (left, right + horizon),
      
      [#link(<chapter-1>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 01: સર્વર આર્કિટેક્ચર, સર્વરના પ્રકારો અને વિન્ડોઝ સર્વરનો 32-વર્ષીય ઇતિહાસ]] \
       #text(size: 7.2pt, fill: rtech-muted)[ક્લાયન્ટ-સર્વર મોડેલ · 8 મુખ્ય સર્વર પ્રકારો · ફિઝિકલ vs વર્ચ્યુઅલ vs એઝ્યુર આર્ક · NT 3.1 થી 2025 વિકાસક્રમ · Win 11 vs Server 2025 · પ્રેક્ટિસ MCQs]],
      [#link(<chapter-1>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 04 →]]],

      [#link(<chapter-2>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 02: પ્રેક્ટિકલ હોમ લેબ સેટઅપ: Windows Server 2025 ISO અને VM કન્ફિગરેશન]] \
       #text(size: 7.2pt, fill: rtech-muted)[લેબ હાર્ડવેર જરૂરિયાતો · આઇસોલેટેડ નેટવર્ક ટોપોલોજી · Microsoft 180-Day ISO ડાઉનલોડ · VirtualBox VM નિર્માણ · Desktop vs Core · ફર્સ્ટ બૂટ]],
      [#link(<chapter-2>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 09 →]]],

      [#link(<chapter-3>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 03: પોસ્ટ-ઇન્સ્ટોલેશન કન્ફિગરેશન અને સર્વર હાર્ડનિંગ (Hardening & Initial Setup)]] \
       #text(size: 7.2pt, fill: rtech-muted)[સર્વર મેનેજર ડેશબોર્ડ · કમ્પ્યુટર નામકરણ (`SRV-2025-DC01`) · સ્ટેટિક IPv4 અને DNS અસાઇનમેન્ટ · રિમોટ ડેસ્કટોપ (RDP) અને NLA · ફાયરવોલ પોર્ટ્સ · NTP ક્લોક]],
      [#link(<chapter-3>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 14 →]]],

      [#link(<chapter-4>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 04: એક્ટિવ ડિરેક્ટરી ડોમેન સર્વિસિસ (AD DS) અને ડોમેન કંટ્રોલર પ્રમોશન]] \
       #text(size: 7.2pt, fill: rtech-muted)[AD DS કોર આર્કિટેક્ચર · લોજિકલ (Forest, Domain, OU) અને ફિઝિકલ (Sites) માળખું · Add Roles Wizard · રૂટ DC (`corp.rtechlab.local`) · DSRM · 5 FSMO રોલ્સ]],
      [#link(<chapter-4>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 18 →]]],

      [#link(<chapter-5>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 05: ADUC કન્સોલ: OUs, ડોમેન યુઝર્સ અને સિક્યુરિટી ગ્રુપ્સનું મેનેજમેન્ટ]] \
       #text(size: 7.2pt, fill: rtech-muted)[ADUC (`dsa.msc`) · એન્ટરપ્રાઇઝ OU વંશવેલો · નવા ડોમેન યુઝર એકાઉન્ટ્સ · પાસવર્ડ અને લોકઆઉટ નીતિઓ · સિક્યુરિટી vs ડિસ્ટ્રિબ્યુશન ગ્રુપ્સ · AGDLP · PowerShell બલ્ક]],
      [#link(<chapter-5>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 23 →]]],

      [#link(<chapter-6>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 06: ક્લાયન્ટ મશીન (Windows 10/11) ને ડોમેન સાથે જોડવું (Domain Join Walkthrough)]] \
       #text(size: 7.2pt, fill: rtech-muted)[ક્લાયન્ટ પૂર્વ-જરૂરિયાતો · ક્લાયન્ટ DNS IP મેપિંગ નિયમ · નેટવર્ક કનેક્ટિવિટી અને `nslookup` ટેસ્ટ · વર્કગ્રુપથી ડોમેન માઇગ્રેશન · ટોપ 5 એરર્સ અને ફિક્સ]],
      [#link(<chapter-6>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 27 →]]],

      [#link(<chapter-7>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 07: ગ્રુપ પોલિસી ઓબ્જેક્ટ્સ (GPO): એન્ટરપ્રાઇઝ સુરક્ષા અને ડેસ્કટોપ નિયંત્રણ]] \
       #text(size: 7.2pt, fill: rtech-muted)[GPMC કન્સોલ · LSDOU પ્રોસેસિંગ ક્રમ · બ્લોક ઇનહેરિટન્સ અને એન્ફોર્સ · લેબ 1: પાસવર્ડ પોલિસી · લેબ 2: USB પેનડ્રાઇવ બ્લોક GPO · લેબ 3: વોલપેપર · `gpupdate`]],
      [#link(<chapter-7>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 31 →]]]
    )
  ]
)

#v(4pt)
#info-box(title: "ભાગ 1 અભ્યાસ સારાંશ (Foundation & Identity)")[
  ભાગ 1 અંતર્ગત તમે વિન્ડોઝ સર્વરની પાયાની કાર્યપ્રણાલી, VM હોમ લેબ ઇન્સ્ટોલેશન, પોસ્ટ-ઇન્સ્ટોલેશન હાર્ડનિંગ, Active Directory (AD DS), DC પ્રમોશન, યુઝર્સ/ગ્રુપ્સ મેનેજમેન્ટ, ક્લાયન્ટ ડોમેન જોઈન તથા GPO પોલિસીઓ પર 100% વ્યવહારુ કમાન્ડ પ્રાપ્ત કરશો.
]

#v(3pt)
#link(<toc-part2>)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 1.2pt + rtech-blue,
    radius: 5pt,
    inset: (x: 9pt, y: 5.5pt),
    [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 8.5pt, weight: "black", fill: rtech-navy)[👉 બાકીના પ્રકરણ 08 થી 14 (DHCP, DNS, FSRM, IIS, Azure Arc, બેકઅપ અને MNC ઇન્ટરવ્યુ)] \
          #text(size: 7.2pt, fill: rtech-muted)[માસ્ટર ઇન્ડેક્સ ભાગ 2 જોવા માટે આગળના પેજ 03 પર જાઓ અથવા અહીં સીધા ક્લિક કરો]
        ],
        [
          #box(
            fill: rtech-blue,
            radius: 3pt,
            inset: (x: 8pt, y: 4pt),
            text(size: 8pt, weight: "bold", fill: white)[પેજ 03 (ભાગ 2) જુઓ →]
          )
        ]
      )
    ]
  )
]

#pagebreak()


// =============================================================================
// PAGE 03: MASTER TABLE OF CONTENTS — PART 2 (નેટવર્ક સર્વિસિસ, ક્લાઉડ, બેકઅપ અને પ્લેસમેન્ટ)
// =============================================================================
[#metadata("toc2") <toc-part2>]

#align(center)[
  #box(
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 3pt,
    inset: (x: 8pt, y: 3pt),
    text(size: 8pt, weight: "bold", fill: rtech-blue)[સંપૂર્ણ 14 પ્રકરણ માસ્ટર ઇન્ડેક્સ · ભાગ 2 (પ્રકરણ 08 થી 14 + પરિશિષ્ટ) · પૃષ્ઠ 2 / 2]
  )
  #v(2.5pt)
  #text(size: 17pt, weight: "black", fill: rtech-navy)[વિગતવાર વિષય સૂચિ — ભાગ 2 (પ્રકરણ 08 થી 14 + પરિશિષ્ટ)]
  #v(2pt)
  #text(size: 8.2pt, fill: rtech-muted)[(નેટવર્ક ઇન્ફ્રાસ્ટ્રક્ચર, સ્ટોરેજ, IIS, હાઇબ્રિડ એઝ્યુર આર્ક, ડિઝાસ્ટર રિકવરી અને MNC ઇન્ટરવ્યુ વોલ્ટ)]
  #v(4pt)
  #line(length: 100%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  radius: 6pt,
  fill: rgb("#F8FAFC"),
  inset: (x: 9pt, y: 8pt),
  [
    #grid(
      columns: (1fr, auto),
      row-gutter: 8.5pt,
      align: (left, right + horizon),

      [#link(<chapter-8>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 08: DHCP સર્વર કન્ફિગરેશન: સ્કોપ, એક્સક્લુઝન, રિઝર્વેશન અને ફેઇલઓવર]] \
       #text(size: 7.2pt, fill: rtech-muted)[DORA 4-સ્ટેપ પ્રક્રિયા · AD ઓથોરાઇઝેશન · IPv4 સ્કોપ · સબનેટ માસ્ક · લીઝ ડ્યુરેશન · એક્સક્લુઝન રેન્જ · MAC રિઝર્વેશન · 80/20 સ્પ્લિટ-સ્કોપ અને ફેઇલઓવર]],
      [#link(<chapter-8>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 35 →]]],

      [#link(<chapter-9>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 09: DNS સર્વર આર્કિટેક્ચર: ફોરવર્ડ/રિવર્સ ઝોન, રેકોર્ડ્સ અને સ્કેવેન્જિંગ]] \
       #text(size: 7.2pt, fill: rtech-muted)[DNS નું એન્ટરપ્રાઇઝ મહત્વ · AD-ઇન્ટિગ્રેટેડ ઝોન · ફોરવર્ડ vs રિવર્સ લુકઅપ · A, PTR, CNAME, MX અને SRV રેકોર્ડ્સ · રૂટ હિન્ટ્સ vs ફોરવર્ડર્સ · સ્કેવેન્જિંગ]],
      [#link(<chapter-9>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 39 →]]],

      [#link(<chapter-10>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 10: ફાઇલ સર્વર રિસોર્સ મેનેજર (FSRM), NTFS પરવાનગીઓ અને ક્વોટા મેનેજમેન્ટ]] \
       #text(size: 7.2pt, fill: rtech-muted)[શેયર્ડ ફોલ્ડર્સ · SMB 3.1.1 · શેર vs NTFS પરવાનગીઓ (મોસ્ટ રેસ્ટ્રિક્ટિવ નિયમ) · FSRM રોલ · હાર્ડ vs સોફ્ટ સ્ટોરેજ ક્વોટા · ફાઇલ સ્ક્રીનિંગ · સ્ટોરેજ રિપોર્ટ્સ]],
      [#link(<chapter-10>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 43 →]]],

      [#link(<chapter-11>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 11: IIS વેબ સર્વર, સિક્યોર FTP અને રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS)]] \
       #text(size: 7.2pt, fill: rtech-muted)[Internet Information Services (IIS) 10.x · આંતરિક કંપની પોર્ટલ · SSL/TLS સર્ટિફિકેટ HTTPS · સિક્યોર FTP સર્વર · રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS) આર્કિટેક્ચર]],
      [#link(<chapter-11>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 47 →]]],

      [#link(<chapter-12>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 12: Windows Server 2025 નેક્સ્ટ-જેન ફીચર્સ, સ્ટોરેજ સ્પેસિસ અને હાઇબ્રિડ એઝ્યુર આર્ક]] \
       #text(size: 7.2pt, fill: rtech-muted)[Server 2025 ના 5 ક્રાંતિકારી ફીચર્સ · હોટપેચિંગ (Zero-Reboot Live Patching) · 32KB AD DB પેજ સાઇઝ · ReFS ડિડુપ્લિકેશન · SMB over QUIC · Azure Arc સંકલન]],
      [#link(<chapter-12>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 50 →]]],

      [#link(<chapter-13>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 13: સર્વર બેકઅપ, ડિઝાસ્ટર રિકવરી અને એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન]] \
       #text(size: 7.2pt, fill: rtech-muted)[3-2-1 એન્ટરપ્રાઇઝ બેકઅપ વ્યૂહરચના · Windows Server Backup · ફુલ vs સિસ્ટમ સ્ટેટ બેકઅપ · AD રિસાઇકલ બિન સક્ષમ કરવું · ડિલીટેડ યુઝરની 1-ક્લિક રિકવરી · `wbadmin`]],
      [#link(<chapter-13>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 53 →]]],

      [#link(<chapter-14>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પ્રકરણ 14: ટોપ 50 MNC સિસ્ટમ એડમિનિસ્ટ્રેટર પ્લેસમેન્ટ વોલ્ટ અને L1/L2 ઇન્ટરવ્યુ દ્રશ્યો]] \
       #text(size: 7.2pt, fill: rtech-muted)[L1/L2 દૈનિક જવાબદારીઓ અને ટિકિટિંગ ટૂલ્સ (ServiceNow, Jira) · TCS, Wipro, Infosys, Cognizant ના 50 વાસ્તવિક ઇન્ટરવ્યુ પ્રશ્નો અને ઉકેલો · સેલરી બ્લૂપ્રિન્ટ]],
      [#link(<chapter-14>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 57 →]]],

      [#link(<appendix-academy>)[#text(weight: "black", fill: rtech-navy, size: 9pt)[પરિશિષ્ટ: RTechLab સિસ્ટમ્સ & ઇન્ફ્રાસ્ટ્રક્ચર એકેડેમી, લેખક પ્રોફાઇલ અને અંતિમ શુભેચ્છાઓ]] \
       #text(size: 7.2pt, fill: rtech-muted)[રાહુલ પટેલ (સ્થાપક અને લેખક) નો સંદેશ · મિશન નિવેદન · 24x7 વિદ્યાર્થી હેલ્પલાઇન સપોર્ટ · સફળતાની પ્રતિજ્ઞા]],
      [#link(<appendix-academy>)[#text(size: 8.5pt, weight: "black", fill: rtech-blue)[પેજ 60 →]]]
    )
  ]
)

#v(4pt)
#pro-tip(title: "સ્માર્ટ નેવિગેશન અને 1-ટેપ જમ્પ સિસ્ટમ")[
  આ માસ્ટર હેન્ડબુકના દરેક પેજના હેડરમાં #text(weight: "bold", fill: rtech-blue)[⮌ Index (વિષય સૂચિ)] લિંક ઉપલબ્ધ છે. તમે કોઈપણ પેજ પરથી તરત પાછા ઇન્ડેક્સ પર આવી શકો છો.
]

#v(3pt)
#link(<table-of-contents>)[
  #box(
    width: 100%,
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BAE6FD"),
    radius: 4pt,
    inset: (x: 8pt, y: 4.5pt),
    align(center)[
      #text(size: 8pt, weight: "bold", fill: rtech-blue)[⮌ પાછા માસ્ટર ઇન્ડેક્સ ભાગ 1 (પ્રકરણ 01 થી 07 · પેજ 02) પર જાઓ]
    ]
  )
]

#pagebreak()


