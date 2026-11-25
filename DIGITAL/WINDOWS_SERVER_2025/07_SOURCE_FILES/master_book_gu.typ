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

// =============================================================================
// CHAPTER 01: INTRODUCTION, ARCHITECTURE, TYPES & EVOLUTION
// =============================================================================

[#metadata("ch1") <chapter-1>]

#chapter-header(
  chapter-num: "CHAPTER 01",
  category: "ભાગ 1 : સિદ્ધાંત અને વિકાસક્રમ (Foundation Architecture)",
  title: "સર્વર આર્કિટેક્ચર, સર્વરના પ્રકારો અને વિન્ડોઝ સર્વરનો 32-વર્ષીય ઇતિહાસ",
  subtitle: "ક્લાયન્ટ-સર્વર મોડેલ · 8 મુખ્ય સર્વર પ્રકારો · ફિઝિકલ vs વર્ચ્યુઅલ vs અઝૂર આર્ક હાઇબ્રિડ · 1993 થી 2025 નો સંપૂર્ણ વિકાસક્રમ"
)

#v(6pt)

=== 1.1 સર્વર શું છે? (What is a Server?)
એક સામાન્ય કમ્પ્યુટર અને એન્ટરપ્રાઇઝ સર્વર વચ્ચેનો તફાવત માત્ર હાર્ડવેરનો નથી, પરંતુ તેની #hl-yellow[ભૂમિકા (Role) અને ઉપલબ્ધતા (Availability)] નો છે.

#mark-yellow[સર્વર એ એક એવું શક્તિશાળી કેન્દ્રીય કમ્પ્યુટર અથવા સોફ્ટવેર પ્રોગ્રામ છે જે નેટવર્ક પરના અન્ય કમ્પ્યુટર્સને (જેમને ક્લાયન્ટ્સ કહેવામાં આવે છે) વિવિધ સેવાઓ, સંસાધનો, ડેટા અને સુરક્ષા નીતિઓ 24 કલાક, સાતેય દિવસ (24/7/365) નિરંતર પ્રદાન કરે છે.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "ક્લાયન્ટ (Client) ની વ્યાખ્યા")[
      ક્લાયન્ટ એ એન્ડ-યુઝર ડિવાઇસ (લેપટોપ, ડેસ્કટોપ, સ્માર્ટફોન) છે જે કોઈ સેવા મેળવવા માટે સર્વરને વિનંતી (#hl-green[Request]) મોકલે છે. ઉદાહરણ: તમારું વેબ બ્રાઉઝર, આઉટલુક ઇમેઇલ ક્લાયન્ટ, અથવા ફાઇલ એક્સપ્લોરર.
    ]
  ],
  [
    #info-box(title: "સર્વર (Server) ની વ્યાખ્યા")[
      સર્વર એ એક કેન્દ્રીય સિસ્ટમ છે જે ક્લાયન્ટ્સની વિનંતીઓ સાંભળે છે (#hl-green[Listening on Ports]), તેમની અધિકૃતતા ચકાસે છે, અને સંબંધિત સેવાનો પ્રત્યુત્તર (#hl-green[Response]) પાછો મોકલે છે.
    ]
  ]
)

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/client_server_architecture.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.1: એન્ટરપ્રાઇઝ ક્લાયન્ટ-સર્વર નેટવર્ક આર્કિટેક્ચર — કેન્દ્રીય #hl-yellow[એક્ટિવ ડિરેક્ટરી], સ્વિચિંગ અને ક્લાયન્ટ્સ]
]

#v(6pt)

=== 1.2 કોર્પોરેટ નેટવર્કમાં ઉપયોગ થતા 8 મુખ્ય સર્વર પ્રકારો (8 Major Server Types)
કોઈપણ બહુરાષ્ટ્રીય કંપની (MNC) કે બેંકમાં એક જ સર્વર તમામ કાર્યો કરતું નથી. વિશિષ્ટ કાર્યો માટે સર્વર્સને અલગ-અલગ ભૂમિકાઓ સોંપવામાં આવે છે:

1. #text(weight: "bold", fill: rtech-navy)[ડોમેન કંટ્રોલર (Domain Controller / AD DS):] સમગ્ર સંસ્થાની કેન્દ્રીય ઓળખ (Identity) સંભાળે છે. યુઝરનેમ, પાસવર્ડ, કમ્પ્યુટર એકાઉન્ટ્સ અને સુરક્ષા નીતિઓ આના પર જ સંગ્રહિત હોય છે. #hl-green[પોર્ટ્સ: 88 (#hl-orange[Kerberos]), 389 (LDAP)].
2. #text(weight: "bold", fill: rtech-navy)[ફાઇલ અને સ્ટોરેજ સર્વર (File & Storage Server):] તમામ કર્મચારીઓના ડેટાને કેન્દ્રીયકૃત રીતે સંગ્રહિત કરે છે. કયા વિભાગને (HR, Sales) કયા ફોલ્ડરનો એક્સેસ મળશે, તે NTFS અને SMB દ્વારા નક્કી થાય છે. #hl-green[પોર્ટ: 445 (SMB)].
3. #text(weight: "bold", fill: rtech-navy)[વેબ સર્વર (Web Server - IIS / Apache):] કંપનીના આંતરિક પોર્ટલ, વેબસાઇટ્સ અને વેબ એપ્લિકેશન્સ હોસ્ટ કરે છે. #hl-green[પોર્ટ્સ: 80 (HTTP), 443 (HTTPS)].
4. #text(weight: "bold", fill: rtech-navy)[ડેટાબેઝ સર્વર (Database Server - MS SQL / Oracle):] બેંક બેલેન્સ, ગ્રાહક રેકોર્ડ્સ અને ઇ-કોમર્સ ઇનવોઇસ જેવી સંરચિત માહિતી પ્રોસેસ કરે છે. #hl-green[પોર્ટ: 1433 (SQL Server)].
5. #text(weight: "bold", fill: rtech-navy)[DNS સર્વર (Domain Name System):] કમ્પ્યુટર નામોને (દા.ત. `portal.rtechlab.local`) IP એડ્રેસમાં (`192.168.1.50`) રૂપાંતરિત કરે છે. #hl-green[પોર્ટ: 53 (UDP/TCP)].
6. #text(weight: "bold", fill: rtech-navy)[DHCP સર્વર (Dynamic Host Configuration Protocol):] નેટવર્ક સાથે જોડાતા દરેક કમ્પ્યુટરને આપમેળે IP એડ્રેસ, ગેટવે અને સબનેટ માસ્ક લીઝ પર આપે છે. #hl-green[UDP પોર્ટ્સ: 67, 68].
7. #text(weight: "bold", fill: rtech-navy)[મેઇલ સર્વર (Mail Server - Exchange Server):] કર્મચારીઓના ઇમેઇલ મોકલવા, પ્રાપ્ત કરવા અને મેઇલબોક્સ સુરક્ષિત રાખવાનું કાર્ય કરે છે. #hl-green[પોર્ટ્સ: 25 (SMTP), 587, 993 (IMAP)].
8. #text(weight: "bold", fill: rtech-navy)[પ્રોક્સી અને સુરક્ષા સર્વર (Proxy / Firewall Server):] કર્મચારીઓના ઇન્ટરનેટ વપરાશને ફિલ્ટર કરે છે અને અનધિકૃત વેબસાઇટ્સ બ્લોક કરીને નેટવર્કને સુરક્ષિત રાખે છે. #hl-green[પોર્ટ: 8080].

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/types_of_servers_infographic.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.2: એન્ટરપ્રાઇઝમાં સક્રિય 8 મુખ્ય સર્વર પ્રકારો, તેમના કાર્યો અને IANA ડિફોલ્ટ પોર્ટ નંબર્સ]
]

#v(6pt)

=== 1.3 ફિઝિકલ (Bare-Metal) vs વર્ચ્યુઅલ મશીન vs ક્લાઉડ સર્વર (Azure & Hybrid)
આજના આધુનિક IT ઇન્ફ્રાસ્ટ્રક્ચરમાં સર્વર ડિપ્લોય કરવા માટેના 3 પ્રાથમિક મોડેલ ઉપલબ્ધ છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/physical_virtual_cloud_comparison.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.3: સર્વર ડિપ્લોયમેન્ટના 3 આધુનિક સ્વરૂપો — ફિઝિકલ બેઅર-મેટલ, વર્ચ્યુઅલાઇઝેશન (Hyper-V) અને અઝૂર હાઇબ્રિડ ક્લાઉડ]
]

#v(4pt)

- #text(weight: "bold", fill: rtech-navy)[1. ફિઝિકલ સર્વર (On-Premises Bare-Metal):] જ્યારે હાર્ડવેર (Dell PowerEdge અથવા HP ProLiant રેક સર્વર) પર સીધું જ ઓપરેટિંગ સિસ્ટમ ઇન્સ્ટોલ કરવામાં આવે છે. ખૂબ જ ભારે ડેટાબેઝ માટે આદર્શ છે, પરંતુ તેમાં હાર્ડવેરનો વ્યય (ઓછો વપરાશ) વધુ થાય છે.
- #text(weight: "bold", fill: rtech-navy)[2. વર્ચ્યુઅલ મશીન (Hyper-V / VMware ESXi):] એક જ મોટા ફિઝિકલ સર્વર પર હાઇપરવાઇઝર ચલાવીને 10 થી 20 અલગ-અલગ વર્ચ્યુઅલ સર્વર્સ બનાવવામાં આવે છે. આનાથી હાર્ડવેરનો 85% થી વધુ કાર્યક્ષમ ઉપયોગ સુનિશ્ચિત થાય છે.
- #text(weight: "bold", fill: rtech-navy)[3. માઇક્રોસોફ્ટ અઝૂર અને હાઇબ્રિડ ક્લાઉડ (#hl-green[Azure Arc]):] #mark-green[Windows Server 2025 નું સૌથી ક્રાંતિકારી ફીચર #hl-green[Azure Arc] ઇન્ટિગ્રેશન છે.] તમે તમારા ઓન-પ્રિમાઇસિસ લોકલ સર્વર્સને ક્લાઉડ સાથે જોડી શકો છો, અને #hl-yellow[હોટપેચિંગ (#hl-yellow[Hotpatching])] દ્વારા સર્વરને રીબૂટ કર્યા વિના સીધા જ રેમ (RAM) માં સિક્યુરિટી અપડેટ્સ લાગુ કરી શકો છો!

#v(6pt)

=== 1.4 વિન્ડોઝ સર્વરનો 32-વર્ષીય સંપૂર્ણ વિકાસક્રમ (1993 થી 2025 સુધી)
માઇક્રોસોફ્ટે 1993 માં પ્રથમ 32-બીટ ઓપરેટિંગ સિસ્ટમ Windows NT 3.1 Advanced Server તરીકે લોન્ચ કરી હતી. આજે Windows Server 2025 સુધીમાં આ ઓપરેટિંગ સિસ્ટમ વિશ્વનું સૌથી સુરક્ષિત એન્ટરપ્રાઇઝ પ્લેટફોર્મ બની ચૂક્યું છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_evolution_timeline.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.4: વિન્ડોઝ સર્વરની 1993 થી 2025 સુધીની ઐતિહાસિક સફર — NT 4.0 થી આધુનિક Server 2025 સુધી]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[ઇતિહાસના મુખ્ય સીમાચિહ્નો (Key Historical Milestones):]\
    - #text(weight: "bold", fill: rtech-blue)[Windows NT 4.0 (1996):] પ્રથમ વખત Windows 95 જેવો ગ્રાફિકલ ઇન્ટરફેસ અને ડોમેન ટ્રસ્ટ મોડેલ રજૂ કરવામાં આવ્યું.
    - #text(weight: "bold", fill: rtech-emerald)[Windows 2000 Server (2000):] #hl-yellow[ક્રાંતિકારી વર્ષ!] #hl-yellow[એક્ટિવ ડિરેક્ટરી] (AD DS), DNS ઇન્ટિગ્રેશન અને ગ્રુપ પોલિસીનો જન્મ આ જ સંસ્કરણમાં થયો હતો.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2008 / R2 (2008):] વર્ચ્યુઅલાઇઝેશન ક્રાંતિની શરૂઆત — #hl-green[Microsoft Hyper-V] અને GUI વગરનું #hl-orange[Server Core] પ્રથમ વખત સામેલ થયા.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2012 / R2 (2012):] આધુનિક #hl-yellow[સર્વર મેનેજર] ડેશબોર્ડ, સ્ટોરેજ સ્પેસિસ (Storage Spaces) અને SMB 3.0 નો સમાવેશ થયો.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2016 (2016):] વિન્ડોઝ કન્ટેનર્સ (Docker સપોર્ટ) અને સ્ટોરેજ સ્પેસિસ ડિરેક્ટ (S2D) ની શરૂઆત.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2019 (2019):] વિન્ડોઝ એડમિન સેન્ટર (WAC) અને હાઇબ્રિડ ક્લાઉડ ઇન્ફ્રાસ્ટ્રક્ચરનો પાયો.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2022 (2022):] સિક્યોર્ડ-કોર સર્વર (Secured-Core Server), ડિફોલ્ટ TLS 1.3 અને #hl-orange[SMB over QUIC].
    - #text(weight: "bold", fill: rtech-blue)[Windows Server 2025 (નવીનતમ ફ્લેગશિપ):] #hl-yellow[હોટપેચિંગ ફોર ઓલ (#hl-yellow[Hotpatching] for All)] (Zero-reboot patching), #hl-yellow[32KB AD ડેટાબેઝ પેજ સાઇઝ] (25 વર્ષમાં #hl-yellow[એક્ટિવ ડિરેક્ટરી]નો સૌથી મોટો સ્પીડ બૂસ્ટ), નેક્સ્ટ-જેન સ્ટોરેજ સ્પેસિસ ડિરેક્ટ ડિડ્યુપ્લિકેશન અને કોમ્પ્રેસન, તેમજ નેટિવ વાઇ-ફાઇ સપોર્ટ.
  ]
)

#v(6pt)

=== 1.5 ક્લાયન્ટ OS (Windows 11) વિરુદ્ધ સર્વર OS (Windows Server 2025)
ઘણા નવા વિદ્યાર્થીઓ પૂછે છે: *"જ્યારે Windows 11 પણ વિન્ડોઝ છે અને Server 2025 પણ, તો આપણે Windows 11 ને જ સર્વર તરીકે શા માટે વાપરી શકતા નથી?"*

કર્નલના સ્તરે બંને ઓપરેટિંગ સિસ્ટમ્સ વચ્ચે ખૂબ મોટો આંતરિક તફાવત હોય છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/windows_client_vs_server_architecture.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.5: આર્કિટેક્ચરલ સરખામણી — Windows 11 Pro vs Windows Server 2025 Datacenter]
]

#v(4pt)

#warning-box(title: "હાર્ડ-કોડેડ નેટવર્ક કનેક્શન લિમિટ (ઇન્ટરવ્યુ ટ્રેપ)")[
  Windows 11 અથવા Windows 10 માં નેટવર્ક પર એક સમયે મહત્તમ #hl-orange[માત્ર 20 કમ્પ્યુટર્સ જ કનેક્ટ થઈ શકે છે] (Inbound Connections Limit). જો 21મું કમ્પ્યુટર જોડાવાનો પ્રયાસ કરશે તો એરર આવશે. તેનાથી વિપરીત, Windows Server 2025 માં #hl-green[અમર્યાદિત (Unlimited) સમાંતર કનેક્શન્સ] ની પરવાનગી હોય છે.
]

#v(6pt)

=== 1.6 વિન્ડોઝ સર્વર 2025 ના 3 મુખ્ય સંસ્કરણો (Editions Comparison)
1. #text(weight: "bold", fill: rtech-navy)[Essentials Edition:] નાની સંસ્થાઓ અને ઓફિસો માટે (મહત્તમ 25 યુઝર્સ અને 50 ડિવાઇસિસ). આમાં યુઝર-આધારિત CALs (Client Access Licenses) ની જરૂર પડતી નથી.
2. #text(weight: "bold", fill: rtech-navy)[Standard Edition:] મધ્યમ અને મોટા ઉદ્યોગો માટે. આમાં કોર-આધારિત લાયસન્સિંગ હોય છે અને પ્રતિ લાયસન્સ માત્ર #hl-green[2 વર્ચ્યુઅલ મશીન (VMs)] ચલાવવાની પરવાનગી મળે છે.
3. #text(weight: "bold", fill: rtech-navy)[Datacenter Edition:] મોટા ડેટા સેન્ટર્સ, પ્રાઇવેટ ક્લાઉડ અને હાઇપર-કન્વર્જ્ડ ઇન્ફ્રાસ્ટ્રક્ચર (HCI) માટે. આમાં #mark-green[અમર્યાદિત (Unlimited) વર્ચ્યુઅલ મશીન્સ], સ્ટોરેજ સ્પેસિસ ડિરેક્ટ (S2D) અને શીલ્ડેડ VMs ની સુવિધા મળે છે.

#v(8pt)

// =============================================================================
// CHAPTER 01 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows 2000 Server થી લઈને Windows Server 2022 સુધી પૂરા 25 વર્ષો સુધી Active Directory ની મુખ્ય ડેટાબેઝ ફાઇલ (#hl-yellow[`ntds.dit`]) નો આંતરિક ડેટાબેઝ પેજ સાઇઝ માત્ર #text(weight: "bold")[8 KB] રહેતો હતો. Windows Server 2025 માં માઇક્રોસોફ્ટે તેને વધારીને #text(weight: "bold")[32 KB] કરી દીધો છે, જેનાથી મોટા બહુરાષ્ટ્રીય સંગઠનોમાં #hl-yellow[એક્ટિવ ડિરેક્ટરી]ના ક્વેરી રિસ્પોન્સ ટાઇમમાં 300% થી વધુ ઝડપ આવી છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 01 પ્રેક્ટિસ બહુવિકલ્પીય પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "#hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સર્વિસિસ (AD DS) અને ગ્રુપ પોલિસીને પ્રથમ વખત કયા વિન્ડોઝ સર્વર સંસ્કરણમાં રજૂ કરવામાં આવ્યા હતા?",
  optA: "Windows NT 4.0",
  optB: "Windows 2000 Server",
  optC: "Windows Server 2003",
  optD: "Windows Server 2008",
  ans: "B",
  exp: "#hl-yellow[એક્ટિવ ડિરેક્ટરી] અને ગ્રુપ પોલિસીનો જન્મ વર્ષ 2000 માં Windows 2000 Server સાથે થયો હતો."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "ક્લાયન્ટ કમ્પ્યુટર (Windows 11) માં એક સમયે મહત્તમ કેટલા ઇનબાઉન્ડ નેટવર્ક કનેક્શન્સની પરવાનગી હોય છે?",
  optA: "10 કનેક્શન્સ",
  optB: "20 કનેક્શન્સ",
  optC: "100 કનેક્શન્સ",
  optD: "અમર્યાદિત (Unlimited)",
  ans: "B",
  exp: "ક્લાયન્ટ ઓએસમાં લાયસન્સિંગ મર્યાદા હેઠળ કર્નલ-લેવલ પર હાર્ડ-કોડેડ મહત્તમ 20 સમવર્તી ઇનબાઉન્ડ કનેક્શન્સની સીમા હોય છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "Windows Server 2025 ના કયા ક્રાંતિકારી ફીચર દ્વારા સર્વરને રીબૂટ કર્યા વિના મેમરીમાં સુરક્ષા પેચ લાગુ કરી શકાય છે?",
  optA: "#hl-yellow[Storage Spaces Direct]",
  optB: "#hl-yellow[Hotpatching]",
  optC: "Hyper-V Live Migration",
  optD: "DirectAccess",
  ans: "B",
  exp: "#hl-yellow[Hotpatching] દ્વારા સર્વર રીબૂટ કર્યા વિના રનિંગ પ્રોસેસિસની મેમરીમાં સિક્યુરિટી પેચ લાગુ કરવામાં આવે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Windows 2000 Server થી Windows Server 2022 સુધી Active Directory (ntds.dit) નો ડિફોલ્ટ પેજ સાઇઝ શું હતો, અને Server 2025 માં તેને વધારીને કેટલો કરવામાં આવ્યો?",
  optA: "4 KB થી વધારીને 16 KB",
  optB: "8 KB થી વધારીને 32 KB",
  optC: "16 KB થી વધારીને 64 KB",
  optD: "32 KB થી વધારીને 128 KB",
  ans: "B",
  exp: "Server 2025 માં 25 વર્ષ પછી AD ડેટાબેઝ પેજ સાઇઝ 8 KB થી વધારીને 32 KB કરવામાં આવ્યો છે જેનાથી ક્વેરી સ્પીડ 300% ઝડપી બને છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "Windows Server 2025 Standard એડિશનના એક સત્તાવાર લાયસન્સ પર હોસ્ટ મશીન પર મહત્તમ કેટલી વર્ચ્યુઅલ મશીનો (VMs) ચલાવી શકાય છે?",
  optA: "માત્ર 1 VM",
  optB: "મહત્તમ 2 VMs",
  optC: "મહત્તમ 8 VMs",
  optD: "અમર્યાદિત (Unlimited)",
  ans: "B",
  exp: "Standard એડિશનમાં પ્રતિ લાયસન્સ મહત્તમ 2 VMs ની મંજૂરી હોય છે, જ્યારે Datacenter એડિશનમાં અમર્યાદિત VMs ની પરવાનગી મળે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'Client OS (Windows 11) અને Server OS (Server 2025) ના ઇન્ટરનલ ટાસ્ક શેડ્યૂલરમાં શું તફાવત હોય છે?'",
  a: "જવાબ: Client OS નું થ્રેડ શેડ્યૂલર 'Foreground Applications' (જેમ કે બ્રાઉઝર, ગેમ્સ, MS ઓફિસ) ને ઉચ્ચ પ્રાથમિકતા આપે છે જેથી યુઝરને સ્ક્રીન પર કોઈ લેગ ન દેખાય. તેનાથી વિપરીત, Server OS નું શેડ્યૂલર 'Background Services and Network I/O' ને સર્વોચ્ચ પ્રાથમિકતા આપે છે જેથી સેંકડો ક્લાયન્ટ્સની નેટવર્ક વિનંતીઓ કોઈપણ વિલંબ વગર પ્રોસેસ થઈ શકે.",
  tip: "Wipro અને Infosys ના L1 Desktop Support/SysAdmin રાઉન્ડમાં આ પ્રશ્ન ખૂબ જ લોકપ્રિય છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 Standard અને Datacenter એડિશનમાં લાયસન્સિંગના દ્રષ્ટિકોણથી સૌથી મોટો તફાવત શું છે?'",
  a: "જવાબ: Standard એડિશનમાં એક લાયસન્સ હેઠળ ફિઝિકલ હોસ્ટ મશીન પર મહત્તમ 2 વર્ચ્યુઅલ મશીનો (VMs) ચલાવવાનો અધિકાર મળે છે, જ્યારે Datacenter એડિશનમાં તે જ હોસ્ટ હાર્ડવેર પર અમર્યાદિત (Unlimited) વિન્ડોઝ સર્વર વર્ચ્યુઅલ મશીનો ચલાવવાની મંજૂરી હોય છે.",
  tip: "વર્ચ્યુઅલાઇઝેશન આર્કિટેક્ટ અને સિસ્ટમ એડમિનિસ્ટ્રેટર બંને માટે આ પાયાનો પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 માં 32KB AD DS ડેટાબેઝ પેજ સાઇઝથી એન્ટરપ્રાઇઝને કયો સીધો ફાયદો થાય છે?'",
  a: "જવાબ: 25 વર્ષ સુધી ntds.dit નો પેજ સાઇઝ 8 KB રહ્યો હતો. 32 KB પેજ સાઇઝ હોવાથી એક જ ડિસ્ક I/O ઓપરેશનમાં ચાર ગણો વધુ ડિરેક્ટરી ડેટા મેમરીમાં લોડ થાય છે. આનાથી હજારો કર્મચારીઓ ધરાવતી એન્ટરપ્રાઇઝમાં #hl-orange[Kerberos] ઓથેન્ટિકેશન અને LDAP સર્ચ ક્વેરીઝમાં 300% થી વધુ ઝડપ પ્રાપ્ત થાય છે.",
  tip: "Server 2025 ના નવીનતમ આર્કિટેક્ચર સાથે જોડાયેલો આ પ્રશ્ન L2/L3 ઇન્ટરવ્યુમાં તમારી ઊંડી તકનીકી નિપુણતા સાબિત કરે છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: '#hl-green[Azure Arc] હાઇબ્રિડ મોડેલ શું છે અને તે ઓન-પ્રિમાઇસિસ વિન્ડોઝ સર્વર્સને ક્લાઉડ સાથે કેવી રીતે જોડે છે?'",
  a: "જવાબ: #hl-green[Azure Arc] એક બ્રિજ તરીકે કાર્ય કરે છે જે ડેટા સેન્ટર અથવા લોકલ લેબમાં ચાલતા ફિઝિકલ કે વર્ચ્યુઅલ સર્વર્સને Azure Resource Manager સાથે જોડી દે છે. આનાથી એડમિનિસ્ટ્રેટર્સ Azure પોર્ટલ પરથી જ ઓન-પ્રિમ સર્વર્સ પર સુરક્ષા નીતિઓ, ઇનસાઇટ્સ અને #hl-yellow[Hotpatching] લાગુ કરી શકે છે.",
  tip: "TCS, Accenture અને Cognizant માં હાઇબ્રિડ ક્લાઉડ પ્રોજેક્ટ્સ માટે આ સવાલ વારંવાર પૂછવામાં આવે છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 01 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - સર્વર્સ 24/7/365 બેકગ્રાઉન્ડ સર્વિસિસ અને ક્લાયન્ટ વિનંતીઓને પ્રોસેસ કરવા માટે ઑપ્ટિમાઇઝ્ડ હોય છે.
      - વિન્ડોઝ સર્વર 2000 માં એક્ટિવ ડિરેક્ટરીનો જન્મ થયો હતો; 2025 સંસ્કરણ 32KB AD DB અને #hl-yellow[Hotpatching] સાથે તેનું સૌથી આધુનિક સ્વરૂપ છે.
      - પ્રોડક્શનમાં હંમેશા #hl-yellow[Server Core] ને પ્રાથમિકતા આપવામાં આવે છે, જ્યારે લેબમાં શીખવા માટે Desktop Experience અનિવાર્ય છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 02: ENTERPRISE LAB SETUP & WINDOWS SERVER 2025 INSTALLATION
// =============================================================================

[#metadata("ch2") <chapter-2>]

#chapter-header(
  chapter-num: "CHAPTER 02",
  category: "ભાગ 2 : વર્ચ્યુઅલ લેબ નિર્માણ (Hands-On Lab Setup)",
  title: "પ્રેક્ટિકલ હોમ લેબ સેટઅપ: Windows Server 2025 ISO અને VM કન્ફિગરેશન",
  subtitle: "સિસ્ટમ આવશ્યકતાઓ · આઇસોલેટેડ નેટવર્ક ટોપોલોજી · Microsoft Evaluation Center · VirtualBox VM નિર્માણ · Desktop Experience vs Core"
)

#v(6pt)

=== 2.1 હોમ લેબની આવશ્યકતાઓ (System & Hardware Requirements)
વિન્ડોઝ સર્વર શીખવા માટે તમારે કોઈ મોંઘા ફિઝિકલ સર્વર રેકની જરૂર નથી. તમે તમારા સામાન્ય લેપટોપ અથવા ડેસ્કટોપ પર #hl-yellow[ટાઇપ-2 હાઇપરવાઇઝર (Type-2 Hypervisor)] નો ઉપયોગ કરીને સંપૂર્ણ એન્ટરપ્રાઇઝ લેબ તૈયાર કરી શકો છો.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "ન્યૂનતમ હાર્ડવેર (Minimum Specs)")[
      - #text(weight: "bold")[CPU:] 64-બીટ 1.4 GHz પ્રોસેસર (VT-x/AMD-V સક્ષમ).
      - #text(weight: "bold")[RAM:] ઓછામાં ઓછી #hl-orange[8 GB RAM] (જેથી હોસ્ટ OS અને 1 Server VM સરળતાથી ચાલી શકે).
      - #text(weight: "bold")[Storage:] ઓછામાં ઓછી 60 GB ખાલી SSD સ્પેસ.
    ]
  ],
  [
    #info-box(title: "ભલામણ કરેલ હાર્ડવેર (Recommended Specs)")[
      - #text(weight: "bold")[CPU:] 4-કોર / 8-થ્રેડ આધુનિક પ્રોસેસર (i5/i7 અથવા Ryzen 5).
      - #text(weight: "bold")[RAM:] #hl-green[16 GB અથવા 32 GB RAM] (1 DC Server + 1 Client PC + 1 ADC Server એક સાથે ચલાવવા માટે).
      - #text(weight: "bold")[Storage:] NVMe SSD (ઝડપી બૂટ અને સ્નેપશોટ માટે).
    ]
  ]
)

#v(4pt)

#warning-box(title: "BIOS / UEFI માં વર્ચ્યુઅલાઇઝેશન સક્ષમ કરો (Virtualization Error Fix)")[
  જો વર્ચ્યુઅલ મશીન બનાવતી વખતે 'VT-x/AMD-V is not available' ની એરર આવે, તો તમારા લેપટોપને રીસ્ટાર્ટ કરીને BIOS/UEFI સેટિંગ્સમાં (F2 / F10 / Del) જાઓ અને #hl-orange['Intel Virtualization Technology' અથવા 'AMD-SVM'] ને #hl-green[Enabled] કરો.
]

#v(6pt)

=== 2.2 લેબ ટોપોલોજી અને નેટવર્ક આર્કિટેક્ચર (Isolated Virtual Network)
આપણી હોમ લેબમાં બે મુખ્ય વર્ચ્યુઅલ મશીનો હશે જે એક સુરક્ષિત આઇસોલેટેડ વર્ચ્યુઅલ નેટવર્ક પર પરસ્પર સંવાદ કરશે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 2.1: વિદ્યાર્થી હોમ લેબ ટોપોલોજી — ફિઝિકલ હોસ્ટ, આઇસોલેટેડ વર્ચ્યુઅલ સ્વિચ, #hl-yellow[ડોમેન કંટ્રોલર] અને ક્લાયન્ટ વર્કસ્ટેશન]
]

#v(4pt)

- #text(weight: "bold", fill: rtech-blue)[VM 1 (Primary DC - `SRV-2025-DC01`):] આ આપણું મુખ્ય #hl-yellow[ડોમેન કંટ્રોલર] મશીન હશે જેના પર Windows Server 2025 Datacenter ઇન્સ્ટોલ થશે. આમાં AD DS, DNS, DHCP અને ફાઇલ સર્વર રોલ્સ ચાલશે.
- #text(weight: "bold", fill: rtech-emerald)[VM 2 (Client PC - `CLT-WIN11-01`):] આ આપણા કર્મચારીનું વર્કસ્ટેશન મશીન હશે જેના પર Windows 10 અથવા 11 Pro ચાલશે અને જેને આપણે ડોમેન સાથે જોડીશું.

#v(6pt)

=== 2.3 સત્તાવાર Windows Server 2025 ISO કેવી રીતે ડાઉનલોડ કરવું? (Microsoft Evaluation Center)
માઇક્રોસોફ્ટ વિદ્યાર્થીઓ અને IT પ્રોફેશનલ્સને શીખવા માટે 180 દિવસની નિઃશુલ્ક પૂર્ણ-સુવિધા યુક્ત ટ્રાયલ પ્રદાન કરે છે:

1. તમારા બ્રાઉઝરમાં જાઓ: #hl-green[`https://www.microsoft.com/en-us/evalcenter/download-windows-server-2025`].
2. #text(weight: "bold")[Download the ISO] વિકલ્પ પસંદ કરો અને તમારું સામાન્ય નામ તેમજ ઇમેઇલ દાખલ કરો.
3. ભાષામાં #hl-yellow['English (United States)'] પસંદ કરો અને 64-બીટ એડિશન ISO ફાઇલ (કદ: આશરે 5.2 GB) ડાઉનલોડ કરો.

#pro-tip(title: "180-દિવસીય ટ્રાયલ Re-arm કમાન્ડ")[
  180 દિવસની ટ્રાયલ સમાપ્ત થવા પર તમે કમાન્ડ પ્રોમ્પ્ટમાં #hl-green[`slmgr.vbs /rearm`] ચલાવીને તેને 5 વખત સુધી રીસેટ (મહત્તમ 3 વર્ષ સુધી માન્ય) કરી શકો છો!
]

#v(6pt)

=== 2.4 વર્ચ્યુઅલ મશીન નિર્માણના પગલાં (Step-by-Step VM Creation in VirtualBox)
#step-screenshot(
  step-num: "પગલું 1",
  title: "VirtualBox માં નવી વર્ચ્યુઅલ મશીનનું કન્ફિગરેશન નક્કી કરવું",
  img-path: "../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png",
  caption: "VM Name: SRV-2025-DC01 | Type: Microsoft Windows | Version: Windows 2025 (64-bit)"
)

1. VirtualBox ખોલો અને #hl-green['New'] બટન પર ક્લિક કરો.
2. Name માં લખો: #hl-yellow[`SRV-2025-DC01`]. Type માં #hl-yellow[`Microsoft Windows`] અને Version માં #hl-yellow[`Windows 2025 (64-bit)`] પસંદ કરો.
3. #text(weight: "bold")[Memory (RAM):] સ્લાઇડરને ઓછામાં ઓછી #hl-green[4096 MB (4 GB)] પર સેટ કરો. Processors માં #hl-green[2 vCPUs] ફાળવો.
4. #text(weight: "bold")[Virtual Hard Disk:] 'Create a Virtual Hard Disk Now' પસંદ કરો. સાઇઝ: #hl-yellow[60.00 GB] (Dynamically Allocated) રાખો જેથી તમારી વાસ્તવિક હાર્ડ ડિસ્ક સ્પેસ ત્યારે જ વપરાય જ્યારે VM માં ડેટા લખાય.
5. #text(weight: "bold")[Network Settings:] VM ના Settings -> Network માં જાઓ અને Attached to માં #hl-orange['Internal Network' અથવા 'NAT Network'] પસંદ કરો જેથી તમારી લેબ તમારા ઘરના વાઇ-ફાઇ નેટવર્કથી સુરક્ષિત રીતે અલગ રહે.

#v(6pt)

=== 2.5 Windows Server 2025 ઇન્સ્ટોલેશન પ્રક્રિયા (Full Wizard Walkthrough)
1. વર્ચ્યુઅલ મશીનને સ્ટાર્ટ કરો. સ્ક્રીન પર 'Press any key to boot from CD or DVD...' દેખાય કે તરત જ #hl-green[Enter] દબાવો.
2. ભાષા પસંદગી વિંડોમાં Language: #hl-yellow[English (United States)], Time & Currency Format: #hl-yellow[English (India)] અને Keyboard: #hl-yellow[US] પસંદ કરીને 'Next' દબાવો.
3. આગળની સ્ક્રીન પર #hl-green['Install Now'] પર ક્લિક કરો.
4. 'Activate Windows' સ્ક્રીન પર લાયસન્સ કી માંગવામાં આવે ત્યારે નીચે આપેલ #hl-yellow['I don't have a product key'] લિંક પર ક્લિક કરો.

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_setup_os_selection.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 2.2: ઓપરેટિંગ સિસ્ટમ સંસ્કરણ પસંદગી — 'Windows Server 2025 Datacenter (Desktop Experience)' ની અનિવાર્ય પસંદગી]
]

#v(4pt)

#warning-box(title: "સૌથી ગંભીર ભૂલથી બચો: #hl-yellow[Server Core] vs Desktop Experience")[
  વિઝાર્ડમાં 4 વિકલ્પો દેખાય છે. જો તમે ભૂલથી માત્ર 'Windows Server 2025 Datacenter' પસંદ કરી લીધું (કૌંસ વગરનું નામ), તો #hl-orange[Server Core (માત્ર બ્લેક કમાન્ડ પ્રોમ્પ્ટ)] ઇન્સ્ટોલ થઈ જશે અને કોઈ ડેસ્કટોપ કે માઉસ મળશે નહીં! હંમેશા #mark-green[Windows Server 2025 Datacenter (Desktop Experience)] જ પસંદ કરો જેમાં સંપૂર્ણ ગ્રાફિકલ ઇન્ટરફેસ અને #hl-yellow[સર્વર મેનેજર] સામેલ હોય છે.
]

#v(6pt)

5. લાયસન્સ શરતો સ્વીકારીને (Accept License Terms) 'Next' દબાવો.
6. ઇન્સ્ટોલેશન પ્રકારમાં #hl-yellow['Custom: Install Windows Server only (advanced)'] પસંદ કરો.
7. ડિસ્ક પાર્ટીશન સ્ક્રીન પર 'Drive 0 Unallocated Space (60.0 GB)' ને પસંદ કરો અને સીધા જ #hl-green['Next'] પર ક્લિક કરો. વિન્ડોઝ આપમેળે જરૂરી EFI અને રિકવરી પાર્ટીશન્સ બનાવી દેશે.
8. ઇન્સ્ટોલેશન પ્રગતિ 0% થી 100% સુધી ચાલશે અને સિસ્ટમ આપમેળે રીબૂટ થશે.

#v(6pt)

=== 2.6 પ્રથમ બૂટ અને એડમિનિસ્ટ્રેટર પાસવર્ડ સેટઅપ (First Boot Configuration)
રીબૂટ થયા પછી સ્ક્રીન પર #hl-yellow['Customize settings'] વિંડો ખુલશે જેમાં લોકલ એડમિનિસ્ટ્રેટરનો પાસવર્ડ સેટ કરવો ફરજિયાત રહેશે:

- #text(weight: "bold")[User name:] `Administrator` (ડિફોલ્ટ રૂપે લોક હોય છે).
- #text(weight: "bold")[Password:] વિન્ડોઝ સર્વર જટિલ પાસવર્ડ (Complex Password) ની માંગ કરે છે જેમાં કેપિટલ અક્ષરો, સ્મોલ અક્ષરો, અંકો અને સ્પેશિયલ કેરેક્ટર્સ હોવા જોઈએ. ઉદાહરણ તરીકે: #hl-green[`P@ssw0rd2025!`] અથવા #hl-green[`Rtechlab@2025`].
- પાસવર્ડની પુષ્ટિ કરો અને #hl-green['Finish'] પર ક્લિક કરો.
- સ્ક્રીન પર લોક સ્ક્રીન દેખાશે. વર્ચ્યુઅલ મશીનમાં લોગિન કરવા માટે VirtualBox ના મેનૂમાં જાઓ: #hl-yellow[Input -> Keyboard -> Insert Ctrl+Alt+Del] દબાવો અને તમારો બનાવેલો પાસવર્ડ દાખલ કરીને લોગિન કરો.
- લોગિન થતાં જ સ્ક્રીન પર #mark-yellow[Server Manager Dashboard] આપમેળે ખુલી જશે!

#v(8pt)

// =============================================================================
// CHAPTER 02 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  માઇક્રોસોફ્ટ અનુસાર પ્રોડક્શન વાતાવરણ (Production Datacenters) માં ચાલતા 70% થી વધુ વિન્ડોઝ સર્વર્સ કોઈપણ GUI વગર #hl-yellow[Server Core] મોડમાં ચલાવવામાં આવે છે. #hl-yellow[Server Core] માં GUI ન હોવાને કારણે રેમનો વપરાશ 60% ઘટી જાય છે, ડિસ્ક સ્પેસ માત્ર 10 GB વપરાય છે, અને સૌથી મહત્વનું: એટેકર માટે કોઈ ગ્રાફિકલ એક્સપ્લોઇટ ઉપલબ્ધ રહેતું નથી જેનાથી સર્વર પર સુરક્ષા પેચ લગાવવાની આવૃત્તિ 50% ઘટી જાય છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 02 પ્રેક્ટિસ બહુવિકલ્પીય પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "માઇક્રોસોફ્ટ ઇવેલ્યુએશન સેન્ટર પરથી ડાઉનલોડ કરેલ Windows Server 2025 ટ્રાયલની સત્તાવાર માન્યતા કેટલી હોય છે?",
  optA: "30 દિવસ",
  optB: "90 દિવસ",
  optC: "180 દિવસ",
  optD: "365 દિવસ",
  ans: "C",
  exp: "વિન્ડોઝ સર્વર ઇવેલ્યુએશન એડિશન 180 દિવસના સંપૂર્ણ સુવિધા ધરાવતા સત્તાવાર મૂલ્યાંકન લાયસન્સ સાથે આવે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "Windows Server 2025 માં સંપૂર્ણ ગ્રાફિકલ ડેસ્કટોપ અને #hl-yellow[સર્વર મેનેજર] મેળવવા માટે ઇન્સ્ટોલેશન સમયે કયો વિકલ્પ પસંદ કરવો અનિવાર્ય છે?",
  optA: "#hl-yellow[Server Core] Edition",
  optB: "Desktop Experience",
  optC: "Nano Server Edition",
  optD: "Hyper-V Server Edition",
  ans: "B",
  exp: "વિન્ડોઝ સર્વરમાં GUI ઇન્ટરફેસને સત્તાવાર રીતે 'Desktop Experience' કહેવામાં આવે છે; અન્ય વિકલ્પો કમાન્ડ લાઇન (CLI) સ્થાપિત કરે છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "વર્ચ્યુઅલ મશીનમાં હોસ્ટ કમ્પ્યુટરના કીબોર્ડ શોર્ટકટના ટકરાવથી બચવા માટે Ctrl+Alt+Del મોકલવાની સાચી રીત કઈ છે?",
  optA: "કીબોર્ડ પર સીધું Ctrl+Alt+Del દબાવવું",
  optB: "VirtualBox Input મેનૂ -> Keyboard -> Insert Ctrl+Alt+Del",
  optC: "કમાન્ડ પ્રોમ્પ્ટમાં exit ટાઇપ કરવું",
  optD: "કમ્પ્યુટરનું પાવર બટન દબાવવું",
  ans: "B",
  exp: "હોસ્ટ કીબોર્ડ પર સીધું Ctrl+Alt+Del દબાવવાથી હોસ્ટનું ટાસ્ક મેનેજર ખુલશે; VM માટે મેનૂમાંથી ઇન્સર્ટ કરવાનું રહે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Windows Server 2025 ની 180-દિવસીય ઇવેલ્યુએશન અવધિને રીસેટ (re-arm) કરવા માટે કયા સત્તાવાર કમાન્ડનો ઉપયોગ થાય છે?",
  optA: "net stop license",
  optB: "slmgr.vbs /rearm",
  optC: "gpupdate /force",
  optD: "dism /online /enable-feature",
  ans: "B",
  exp: "slmgr.vbs /rearm કમાન્ડ લાયસન્સિંગ ગ્રેસ પિરિયડને ફરીથી 180 દિવસ માટે રીસેટ કરી દે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "વર્ચ્યુઅલ લેબમાં હોસ્ટ મશીન અને અન્ય ફિઝિકલ નેટવર્કથી સુરક્ષા પૃથક્કરણ (Isolation) માટે વર્ચ્યુઅલ નેટવર્કનો કયો મોડ ભલામણ કરેલ છે?",
  optA: "Bridged Adapter",
  optB: "Internal Network / Host-Only",
  optC: "Direct Cloud Uplink",
  optD: "Promiscuous Mode All",
  ans: "B",
  exp: "Internal Network મોડ VM ને ઘરના વાઇ-ફાઇના DHCP અને અન્ય મશીનોથી અલગ રાખીને સુરક્ષિત લેબ વાતાવરણ પૂરું પાડે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'એન્ટરપ્રાઇઝ પ્રોડક્શનમાં સર્વર ડિપ્લોય કરતી વખતે #hl-yellow[Server Core] અને Desktop Experience માંથી તમે કોને પ્રાથમિકતા આપશો અને શા માટે?'",
  a: "જવાબ: પ્રોડક્શનમાં આપણે હંમેશા '#hl-yellow[Server Core]' ને પ્રાથમિકતા આપીશું કારણ કે તે સિસ્ટમનું એટેક સરફેસ (Attack Surface) ઘટાડે છે, રીબૂટની જરૂરિયાત ઘટાડે છે અને હાર્ડવેર સંસાધનોની (RAM/CPU) બચત કરે છે. મેનેજમેન્ટ માટે આપણે રિમોટ ટૂલ્સ જેવા કે RSAT, PowerShell remoting અથવા Windows Admin Center નો ઉપયોગ કરીએ છીએ.",
  tip: "આ ઉત્તર દર્શાવે છે કે તમે માત્ર પુસ્તકીય જ્ઞાન ધરાવતા નથી, પરંતુ એન્ટરપ્રાઇઝ સિક્યુરિટીની ઊંડી સમજ ધરાવો છો."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 ઇન્સ્ટોલેશન માટે ન્યૂનતમ ડિસ્ક સ્પેસ અને રેમની સત્તાવાર આવશ્યકતા શું છે?'",
  a: "જવાબ: ન્યૂનતમ સત્તાવાર આવશ્યકતા 512 MB રેમ (#hl-yellow[Server Core] માટે) અથવા 2 GB રેમ (Desktop Experience માટે), 1.4 GHz 64-બીટ પ્રોસેસર, અને ન્યૂનતમ 32 GB સ્ટોરેજ સ્પેસ છે. જો કે ઉત્પાદનમાં Active Directory અને રોલ્સના સરળ સંચાલન માટે ઓછામાં ઓછી 4 GB રેમ અને 60 GB SSD ભલામણ કરેલ છે.",
  tip: "TCS અને Cognizant ના ઇન્ફ્રાસ્ટ્રક્ચર સપોર્ટ ઇન્ટરવ્યુમાં આ બેઝિક સ્પેસિફિકેશન પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'Dynamically Allocated Virtual Disk અને Fixed Size Virtual Disk માં શું તફાવત હોય છે, અને પ્રોડક્શનમાં કોને પસંદ કરવામાં આવે છે?'",
  a: "જવાબ: Dynamically Allocated ડિસ્ક શરૂઆતમાં ખૂબ ઓછી સ્પેસ રોકે છે અને જેમ-જેમ ડેટા વધે છે તેમ-તેમ ફાઇલનું કદ વધે છે (આ હોમ લેબ માટે શ્રેષ્ઠ છે). પરંતુ પ્રોડક્શન એન્ટરપ્રાઇઝમાં (Hyper-V / VMware) હંમેશા 'Fixed Size' પસંદ કરવામાં આવે છે કારણ કે તેમાં ડિસ્ક ફ્રેગમેન્ટેશન થતું નથી અને I/O થ્રુપુટ ઘણું વધારે રહે છે.",
  tip: "સ્ટોરેજ અને વર્ચ્યુઅલાઇઝેશન ટીમના ટેકનિકલ ઇન્ટરવ્યુમાં આ પ્રશ્ન વારંવાર પૂછાય છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'જો Windows Server 2025 નો 180-દિવસીય ઇવેલ્યુએશન સમયગાળો સમાપ્ત થઈ જાય, તો શું સિસ્ટમ તરત જ બંધ થઈ જાય છે?'",
  a: "જવાબ: ટ્રાયલ સમાપ્ત થતાં સર્વર અચાનક બંધ થતું નથી, પરંતુ દર 1 કલાકે સિસ્ટમ આપમેળે શટડાઉન થવા લાગે છે અને સ્ક્રીનના ખૂણામાં લાયસન્સ એક્સપાયરીનું વોટરમાર્ક આવી જાય છે. તેને slmgr.vbs /rearm કમાન્ડ ચલાવીને 5 વખત સુધી રીસેટ (મહત્તમ 3 વર્ષ) કરી શકાય છે.",
  tip: "સિસ્ટમ સપોર્ટ અને ટ્રબલશૂટિંગ રોલ્સમાં લાયસન્સ એક્સપાયરી બિહેવિયરની સમજ ચકાસવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'VirtualBox અથવા Hyper-V માં Guest Additions / Integration Services ઇન્સ્ટોલ કરવું શા માટે અનિવાર્ય ગણાય છે?'",
  a: "જવાબ: Guest Additions (VirtualBox) અથવા Integration Services (Hyper-V) વર્ચ્યુઅલ મશીન માટે વિશિષ્ટ કર્નલ ડ્રાઇવર્સ પ્રદાન કરે છે. તેના વિના VM માં ઓટોમેટિક સ્ક્રીન રિસાઇઝિંગ (1080p), હોસ્ટ અને ગેસ્ટ વચ્ચે ક્લિપબોર્ડ શેરિંગ (Copy-Paste), સ્મૂથ માઉસ પોઇન્ટર ઇન્ટિગ્રેશન, અને બહેતર નેટવર્ક I/O પરફોર્મન્સ શક્ય બનતું નથી.",
  tip: "લેબ મેનેજમેન્ટ અને વર્ચ્યુઅલાઇઝેશન સપોર્ટના પ્રેક્ટિકલ રાઉન્ડમાં આ જ્ઞાન ચકાસવામાં આવે છે."
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ હોમ લેબ ટ્રબલશૂટિંગ ગાઇડ: 4 સામાન્ય VM સમસ્યાઓ અને ઝડપી ઉકેલ]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-rose)[સમસ્યા 1: 'VT-x / AMD-V is not available':] તમારા ફિઝિકલ પીસીને રીસ્ટાર્ટ કરો, BIOS/UEFI માં જાઓ અને Intel Virtualization Technology ને Enable કરો.
      - #text(weight: "bold", fill: rtech-amber)[સમસ્યા 2: 'Ctrl+Alt+Del VM માં કામ નથી કરતું':] ફિઝિકલ કીબોર્ડ પર દબાવવાને બદલે VirtualBox ના ટોચના મેનૂ 'Input -> Keyboard -> Insert Ctrl+Alt+Del' નો ઉપયોગ કરો.
      - #text(weight: "bold", fill: rtech-blue)[સમસ્યા 3: 'ભૂલથી Server Core ઇન્સ્ટોલ થઈ ગયું (કોઈ ડેસ્કટોપ નથી)':] ISO વિઝાર્ડમાં ફરીથી જાઓ અને 'Desktop Experience' વાળા વિકલ્પને પસંદ કરીને ફ્રેશ ઇન્સ્ટોલ કરો.
      - #text(weight: "bold", fill: rtech-emerald)[સમસ્યા 4: 'સ્ક્રીન રિઝોલ્યુશન 1024x768 પર અટકેલું છે':] VirtualBox મેનૂમાં 'Devices -> Insert Guest Additions CD Image' ચલાવો અને VM ની અંદર `VBoxWindowsAdditions.exe` રન કરીને રીબૂટ કરો.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ લેબ 02 વેરિફિકેશન ચેકલિસ્ટ (Verification Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] વર્ચ્યુઅલ મશીન `SRV-2025-DC01` સફળતાપૂર્વક બૂટ થઈ ચૂકી છે.
      - [ ] લોકલ `Administrator` નો જટિલ પાસવર્ડ સુરક્ષિત રીતે નોંધી લેવામાં આવ્યો છે.
      - [ ] લોગિન પછી #hl-yellow[Server Manager] Dashboard સ્ક્રીન પર કોઈપણ ભૂલ વગર દર્શાવવામાં આવી રહ્યો છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 03: POST-INSTALLATION HARDENING & BASELINE CONFIGURATION
// =============================================================================

[#metadata("ch3") <chapter-3>]

#chapter-header(
  chapter-num: "CHAPTER 03",
  category: "ભાગ 3 : સર્વર બેસલાઇન અને સુરક્ષા (Server Baseline & Hardening)",
  title: "પોસ્ટ-ઇન્સ્ટોલેશન કન્ફિગરેશન અને સર્વર હાર્ડનિંગ (Hardening & Initial Setup)",
  subtitle: "#hl-yellow[સર્વર મેનેજર] ડેશબોર્ડ · કમ્પ્યુટર નામકરણ (SRV-2025-DC01) · સ્ટેટિક IPv4 અને DNS · રિમોટ ડેસ્કટોપ (RDP) અને NLA · ફાયરવોલ પોર્ટ્સ · NTP ક્લોક સિન્ક્રોનાઇઝેશન"
)

=== 3.1 #hl-yellow[સર્વર મેનેજર] ડેશબોર્ડ (#hl-yellow[Server Manager] Dashboard Navigation)
વિન્ડોઝ સર્વરમાં લોગિન કરતાં જ સૌથી પહેલાં #hl-yellow[Server Manager] આપમેળે ખુલે છે. આ માઇક્રોસોફ્ટનું કેન્દ્રીય સંચાલન કન્સોલ છે જેના માધ્યમથી તમે સ્થાનિક સર્વર અને નેટવર્ક પર રહેલા અન્ય રિમોટ સર્વર્સને એક જ જગ્યાએથી નિયંત્રિત કરી શકો છો.

ડેશબોર્ડની ડાબી બાજુ મુખ્ય નેવિગેશન પેનલ્સ હોય છે:
1. #text(weight: "bold", fill: rtech-navy)[Dashboard:] સર્વરના સમગ્ર સ્વાસ્થ્ય, સક્રિય ઇવેન્ટ્સ અને રોલ્સની સ્થિતિનું ઝડપી વિહંગાવલોકન દર્શાવે છે.
2. #text(weight: "bold", fill: rtech-navy)[Local Server:] આ મશીનની ઓળખ (Computer Name, Workgroup/Domain), નેટવર્ક એડેપ્ટર, રિમોટ ડેસ્કટોપ, અને વિન્ડોઝ અપડેટ્સની સ્થિતિ દર્શાવે છે.
3. #text(weight: "bold", fill: rtech-navy)[All Servers:] જો તમે સર્વર પૂલમાં એક કરતાં વધુ સર્વર્સ ઉમેર્યા હોય, તો તેમની યાદી અહીં દેખાય છે.
4. #text(weight: "bold", fill: rtech-navy)[Roles and Server Groups:] જેવા તમે AD DS, DNS કે DHCP ઇન્સ્ટોલ કરશો, તેમના વિશિષ્ટ ટેબ્સ અહીં આપમેળે જોડાઈ જશે.

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_hardening_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 3.1: Windows Server 2025 પોસ્ટ-ઇન્સ્ટોલેશન 5-તબક્કાનું હાર્ડનિંગ અને બેસલાઇન કન્ફિગરેશન ફ્લો]
]

#v(4pt)

=== 3.2 સર્વરનું કોર્પોરેટ નામકરણ (Enterprise Naming Conventions)
ડિફોલ્ટ રૂપે વિન્ડોઝ સર્વરને એક રેન્ડમ નામ આપવામાં આવે છે (જેમ કે `WIN-7K9A3B58Z1`). પ્રોડક્શન વાતાવરણમાં કોઈપણ સર્વરને આવા નામ સાથે ક્યારેય છોડવામાં આવતું નથી, ખાસ કરીને ત્યારે જ્યારે તેને #hl-yellow[ડોમેન કંટ્રોલર] બનાવવાનું હોય.

#warning-box(title: "સુવર્ણ નિયમ: #hl-yellow[ડોમેન કંટ્રોલર] પ્રમોટ કરતાં પહેલાં કમ્પ્યુટરનું નામ બદલો")[
  એકવાર જ્યારે તમે સર્વરને #hl-yellow[એક્ટિવ ડિરેક્ટરી] #hl-yellow[ડોમેન કંટ્રોલર] બનાવી દો છો, ત્યારે તેનું નામ બદલવું અત્યંત જટિલ અને જોખમી બની જાય છે કારણ કે #hl-orange[Kerberos] SPNs, DNS SRV રેકોર્ડ્સ અને AD ડેટાબેઝ તે જ નામ સાથે જોડાઈ જાય છે. તેથી, #hl-orange[DC પ્રમોશન પહેલાં જ સર્વરનું કાયમી નામકરણ કરો].
]

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[એન્ટરપ્રાઇઝ નામકરણ ધોરણો (Corporate Naming Standard):]\
    - #hl-green[`SRV-2025-DC01`]: Primary Domain Controller (મુખ્ય મથક - Head Office)\
    - #hl-green[`SRV-2025-DC02`]: Additional / Backup Domain Controller\
    - #hl-green[`SRV-2025-FS01`]: File & Storage Server\
    - #hl-green[`SRV-2025-WEB01`]: IIS Web Server
  ]
)

#v(4pt)
*નામ બદલવાના પગલાં:*
1. #hl-yellow[Server Manager] ખોલો અને ડાબી બાજુ #hl-yellow[Local Server] પર ક્લિક કરો.
2. #text(weight: "bold")[Computer name] ની સામે આપેલ રેન્ડમ નામ પર (દા.ત. `WIN-XXXXX`) ક્લિક કરો.
3. System Properties વિંડોમાં #hl-green['Change...'] બટન પર ક્લિક કરો.
4. Computer name બોક્સમાં નવું નામ દાખલ કરો: #hl-yellow[`SRV-2025-DC01`].
5. 'OK' દબાવો. સિસ્ટમ ચેતવણી આપશે કે ફેરફાર લાગુ કરવા માટે રીબૂટ જરૂરી છે. હમણાં રીબૂટ ન કરો (આપણે IP સેટ કર્યા પછી એક સાથે રીસ્ટાર્ટ કરીશું).

#v(6pt)

=== 3.3 સ્ટેટિક IPv4 અને DNS એડ્રેસિંગ કન્ફિગરેશન (Static IP Assignment)
સર્વર હંમેશા ક્લાયન્ટ્સને સેવાઓ પૂરી પાડે છે. જો સર્વરનું IP એડ્રેસ DHCP દ્વારા દર થોડા દિવસે બદલાતું રહે, તો ક્લાયન્ટ્સ ડોમેન લોગિન, શેર ડ્રાઇવ કે DNS રિઝોલ્યુશન કરી શકશે નહીં. તેથી #hl-yellow[સર્વરને હંમેશા ફિક્સ્ડ સ્ટેટિક IP એડ્રેસ આપવામાં આવે છે].

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "આપણી લેબનો નેટવર્ક પ્લાન (Lab Subnet)")[
      - #text(weight: "bold")[IP Address:] #hl-green[`192.168.1.10`]
      - #text(weight: "bold")[Subnet Mask:] #hl-green[`255.255.255.0 (/24)`]
      - #text(weight: "bold")[Default Gateway:] #hl-green[`192.168.1.1`]
      - #text(weight: "bold")[Preferred DNS:] #hl-yellow[`127.0.0.1`] (Loopback)
      - #text(weight: "bold")[Alternate DNS:] #hl-green[`192.168.1.10`]
    ]
  ],
  [
    #warning-box(title: "DNS લૂપબેકનો અનિવાર્ય નિયમ")[
      આ જ મશીન આપણું પ્રાથમિક DNS સર્વર પણ બનશે, તેથી Preferred DNS માં #hl-orange[`127.0.0.1`] (અથવા સર્વરનું પોતાનું સ્ટેટિક IP) જ નાખવું જોઈએ. જો તમે અહીં `8.8.8.8` (Google DNS) નાખી દીધું, તો #hl-yellow[એક્ટિવ ડિરેક્ટરી]નું ડોમેન ક્યારેય જોઈન થઈ શકશે નહીં!
    ]
  ]
)

#v(4pt)
*સ્ટેટિક IP સેટ કરવાના પગલાં:*
1. Run ડાયલોગ (`Win + R`) ખોલો અને ટાઇપ કરો: #hl-green[`ncpa.cpl`] (Network Connections).
2. 'Ethernet' એડેપ્ટર પર રાઇટ-ક્લિક કરીને #hl-yellow[Properties] પસંદ કરો.
3. #text(weight: "bold")[Internet Protocol Version 4 (TCP/IPv4)] ને પસંદ કરીને 'Properties' પર ક્લિક કરો.
4. 'Use the following IP address' રેડિયો બટન પસંદ કરો અને ઉપરોક્ત વિગતો ભરો.
5. 'OK' -> 'Close' કરો. હવે સર્વરને રીસ્ટાર્ટ કરો જેથી નવું કમ્પ્યુટર નામ અને IP સંપૂર્ણપણે સક્રિય થઈ જાય.

#v(6pt)

=== 3.4 રિમોટ ડેસ્કટોપ (RDP - #hl-green[Port 3389]) અને NLA સુરક્ષા
ડેટા સેન્ટરમાં સર્વર્સ હંમેશા સાઉન્ડપ્રૂફ સર્વર રૂમમાં રેકની અંદર બંધ રહે છે. સિસ્ટમ એડમિનિસ્ટ્રેટર ક્યારેય સર્વરની સામે બેસીને કામ કરતા નથી, પરંતુ પોતાના લેપટોપ પરથી #hl-yellow[Remote Desktop Protocol (RDP)] દ્વારા સર્વર સાથે જોડાય છે.

*RDP સક્ષમ અને સુરક્ષિત કરવાના પગલાં:*
1. #hl-yellow[Server Manager] -> #hl-yellow[Local Server] પર જાઓ.
2. #text(weight: "bold")[Remote Desktop] વિકલ્પ સામે આપેલ 'Disabled' પર ક્લિક કરો.
3. System Properties માં #hl-green['Allow remote connections to this computer'] પસંદ કરો.
4. #mark-orange['Allow connections only from computers running Remote Desktop with Network Level Authentication (recommended)'] ચેકબોક્સને અનિવાર્યપણે ટિક રાખો.
5. 'OK' પર ક્લિક કરો.

#pro-tip(title: "NLA (Network Level Authentication) શા માટે અત્યંત મહત્વપૂર્ણ છે?")[
  NLA વગર, કોઈપણ અનધિકૃત યુઝર સર્વર સાથે RDP સેશન શરૂ કરી શકે છે અને લોગિન સ્ક્રીન પર બ્રુટ-ફોર્સ કે DoS એટેક કરી શકે છે. NLA એ સુનિશ્ચિત કરે છે કે RDP સેશન સ્થપાય તે પહેલાં જ ક્લાયન્ટે ક્રેડેન્શિયલ્સ ચકાસવા પડશે, જેનાથી સર્વરના સંસાધનો સુરક્ષિત રહે છે. RDP ડિફોલ્ટ રૂપે #hl-green[TCP Port 3389] પર સાંભળે છે.
]

#v(6pt)

=== 3.5 વિન્ડોઝ ડિફેન્ડર ફાયરવોલ પોર્ટ હાર્ડનિંગ (Firewall Configuration)
ડિફોલ્ટ રૂપે વિન્ડોઝ સર્વરનું ફાયરવોલ ICMP Echo Requests (Ping) ને બ્લોક રાખે છે. લેબમાં નેટવર્ક કનેક્ટિવિટી ટેસ્ટ કરવા માટે Ping ની પરવાનગી આપવી જરૂરી છે:

1. Run (`Win + R`) માં ટાઇપ કરો: #hl-green[`wf.msc`] (Windows Defender Firewall with Advanced Security).
2. ડાબી બાજુ #hl-yellow[Inbound Rules] પર ક્લિક કરો.
3. યાદીમાં શોધો: #text(weight: "bold")[File and Printer Sharing (Echo Request - ICMPv4-In)].
4. તેના પર રાઇટ-ક્લિક કરીને #hl-green[Enable Rule] પસંદ કરો. હવે તમારું VM નેટવર્ક પર પિંગનો જવાબ આપવા લાગશે.

#v(6pt)

=== 3.6 ટાઇમ ઝોન અને NTP ક્લોક સિન્ક્રોનાઇઝેશન (#hl-orange[Kerberos] Time Skew Rule)
#hl-yellow[એક્ટિવ ડિરેક્ટરી]નું સંપૂર્ણ સુરક્ષા માળખું #hl-yellow[Kerberos v5] ઓથેન્ટિકેશન પ્રોટોકોલ પર નિર્ભર કરે છે. #hl-orange[Kerberos] રિપ્લે એટેક્સ (Replay Attacks) રોકવા માટે ટાઇમસ્ટેમ્પ્સનો ઉપયોગ કરે છે.

#warning-box(title: "5-મિનિટ #hl-orange[Kerberos] ક્લોક સ્ક્યુ (ઇન્ટરવ્યુનો ક્લાસિક પ્રશ્ન)")[
  જો #hl-yellow[ડોમેન કંટ્રોલર] અને ક્લાયન્ટ મશીનની ઘડિયાળ વચ્ચે #hl-orange[5 મિનિટથી વધુનો સમય તફાવત (Clock Skew)] થઈ જાય, તો #hl-orange[Kerberos] ઓથેન્ટિકેશન ટિકિટ નકારી (Reject) કાઢશે અને યુઝર ડોમેનમાં લોગિન કરી શકશે નહીં!
]

*NTP કન્ફિગરેશન કમાન્ડ્સ:*
- વર્તમાન સમય સ્થિતિ તપાસો: #hl-green[`w32tm /query /status`]
- બાહ્ય વિશ્વસનીય NTP સર્વર સાથે સિંક કરો:
```cmd
w32tm /config /manualpeerlist:"pool.ntp.org" /syncfromflags:manual /reliable:yes /update
net stop w32time && net start w32time
w32tm /resync
```

#v(8pt)

// =============================================================================
// CHAPTER 03 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows Server 2025 માં માઇક્રોસોફ્ટે સુરક્ષા એટલી કડક બનાવી દીધી છે કે જૂના #hl-yellow[NTLMv1] પ્રોટોકોલને સંપૂર્ણપણે બ્લોક કરી દેવામાં આવ્યો છે અને SMB ફાઇલ શેરિંગમાં #hl-yellow[SMB Signing] ને ડિફોલ્ટ રૂપે તમામ કનેક્શન્સ માટે અનિવાર્ય (Mandatory) કરી દેવામાં આવ્યું છે. આનાથી કોર્પોરેટ નેટવર્ક પર થતા મેન-ઇન-ધ-મિડલ (MitM) અને NTLM રિલે એટેક્સ 100% અટકી જાય છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 03 પ્રેક્ટિસ બહુવિકલ્પીય પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "માઇક્રોસોફ્ટ અનુસાર કોઈપણ સર્વરને #hl-yellow[એક્ટિવ ડિરેક્ટરી] #hl-yellow[ડોમેન કંટ્રોલર] પ્રમોટ કરતાં પહેલાં કયું કાર્ય કરવું અનિવાર્ય છે?",
  optA: "IIS વેબ સર્વર ઇન્સ્ટોલ કરવું",
  optB: "સર્વરનું કાયમી કમ્પ્યુટર નામ અને સ્ટેટિક IP સેટ કરવું",
  optC: "વિન્ડોઝ ડિફેન્ડર ફાયરવોલને કાયમ માટે બંધ કરવી",
  optD: "ત્રીજી પાર્ટીનું એન્ટીવાયરસ ઇન્સ્ટોલ કરવું",
  ans: "B",
  exp: "DC પ્રમોશન પછી નામ અને IP બદલવું જોખમી સાબિત થાય છે, તેથી પ્રી-પ્રમોશન હાર્ડનિંગમાં જ નામ અને સ્ટેટિક IP નક્કી કરવામાં આવે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "રિમોટ ડેસ્કટોપ પ્રોટોકોલ (RDP) ડિફોલ્ટ રૂપે કયા IANA પોર્ટ નંબર પર ક્લાયન્ટ્સના ઇનબાઉન્ડ કનેક્શન્સ સાંભળે છે?",
  optA: "TCP પોર્ટ 80",
  optB: "TCP પોર્ટ 443",
  optC: "TCP પોર્ટ 3389",
  optD: "UDP પોર્ટ 53",
  ans: "C",
  exp: "વિન્ડોઝ રિમોટ ડેસ્કટોપનો સત્તાવાર ડિફોલ્ટ પોર્ટ TCP 3389 છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "#hl-yellow[એક્ટિવ ડિરેક્ટરી]ના #hl-orange[Kerberos] ઓથેન્ટિકેશનમાં #hl-yellow[ડોમેન કંટ્રોલર] અને ક્લાયન્ટ વચ્ચે મહત્તમ કેટલો સમય તફાવત (Clock Skew) સ્વીકાર્ય હોય છે?",
  optA: "1 મિનિટ",
  optB: "5 મિનિટ",
  optC: "15 મિનિટ",
  optD: "30 મિનિટ",
  ans: "B",
  exp: "Kerberos v5 સુરક્ષા નીતિ અનુસાર મહત્તમ 5 મિનિટનો ટાઇમ ડ્રિફ્ટ (Clock Skew) જ માન્ય ગણાય છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "વિન્ડોઝ સર્વરમાં નેટવર્ક કનેક્શન્સ વિંડો (Network Connections) ને સીધી ખોલવા માટેનો રન કમાન્ડ કયો છે?",
  optA: "devmgmt.msc",
  optB: "ncpa.cpl",
  optC: "firewall.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "ncpa.cpl સીધી નેટવર્ક એડેપ્ટર સેટિંગ્સ (Network Connections) વિંડોને ખોલે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "RDP માં NLA (Network Level Authentication) નો પ્રાથમિક સુરક્ષા હેતુ શું છે?",
  optA: "ઇન્ટરનેટની સ્પીડ બમણી કરવી",
  optB: "સંપૂર્ણ RDP સેશન અને GUI લોડ થાય તે પહેલાં યુઝર ક્રેડેન્શિયલ્સની પુષ્ટિ કરવી",
  optC: "પાસવર્ડની આવશ્યકતા સમાપ્ત કરવી",
  optD: "રિમોટ ઓડિયોને મ્યૂટ કરવો",
  ans: "B",
  exp: "NLA સેશન સ્થપાય તે પહેલાં જ ક્રેડેન્શિયલ્સ ચકાસીને DoS અને અનધિકૃત સત્રોના નિર્માણને રોકે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'જો કોઈ ડોમેન કંટ્રોલરના Preferred DNS માં 8.8.8.8 (Google DNS) નાખી દેવામાં આવે, તો શું થશે?'",
  a: "જવાબ: જો DC પોતાના DNS તરીકે Google DNS ને જોશે, તો તે પોતાના સ્થાનિક #hl-yellow[એક્ટિવ ડિરેક્ટરી] SRV રેકોર્ડ્સ (_ldap, _kerberos) ને ઇન્ટરનેટ પર શોધશે જ્યાં તે ઉપલબ્ધ નથી. પરિણામે ડોમેન કંટ્રોલર પોતાની જાતને ઓળખી શકશે નહીં, ક્લાયન્ટ્સ ડોમેન જોઈન કરી શકશે નહીં અને ડિરેક્ટરી રેપ્લિકેશન સંપૂર્ણપણે નિષ્ફળ જશે. DC ના DNS માં હંમેશા 127.0.0.1 (Loopback) અથવા સ્થાનિક AD DNS નું IP હોવું જોઈએ.",
  tip: "Wipro અને TCS ના L2 SysAdmin ઇન્ટરવ્યુમાં આ સૌથી ટ્રિકી અને નિર્ણાયક પ્રશ્ન માનવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ કમ્પ્યુટર પર Kerberos Error: Time Skew Too Great (0x25) આવી રહી છે. તેને કેવી રીતે ઉકેલશો?'",
  a: "જવાબ: આ એરર ત્યારે આવે છે જ્યારે ક્લાયન્ટ અને ડોમેન કંટ્રોલરની ઘડિયાળમાં 5 મિનિટથી વધુનો તફાવત હોય. તેને સુધારવા માટે ક્લાયન્ટ પર એડમિન કમાન્ડ પ્રોમ્પ્ટમાં 'w32tm /resync /force' ચલાવીને DC સાથે સમય સિંક કરવામાં આવે છે, અથવા BIOS/UEFI બેટરી તેમજ ટાઇમ ઝોનની ચકાસણી કરવામાં આવે છે.",
  tip: "હેલ્પડેસ્ક અને L1 સપોર્ટ એન્જિનિયર્સ માટે આ દૈનિક ટ્રબલશૂટિંગનો અવિભાજ્ય હિસ્સો છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'પ્રોડક્શન સર્વર પર RDP ડિફોલ્ટ પોર્ટ 3389 બદલવું (Port Obfuscation) શું પૂરતી સુરક્ષા ગણાય?'",
  a: "જવાબ: પોર્ટ બદલવું (જેમ કે 3389 થી 53389 કરવું) માત્ર બેઝિક પોર્ટ સ્કેનર્સથી બચાવે છે (Security through Obscurity), આ વાસ્તવિક સુરક્ષા નથી. વાસ્તવિક સુરક્ષા માટે NLA સક્ષમ હોવું જોઈએ, RDP ને VPN અથવા Azure Bastion ની પાછળ રાખવું જોઈએ, અને મલ્ટી-ફેક્ટર ઓથેન્ટિકેશન (MFA) ફરજિયાત હોવું જોઈએ.",
  tip: "સુરક્ષા-કેન્દ્રિત ભૂમિકાઓમાં આ ઉત્તર તમારી પરિપક્વ વિચારસરણી દર્શાવે છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 માં ટાઇમ સર્વિસની સ્થિતિ તપાસવા માટેનો સત્તાવાર કમાન્ડ કયો છે?'",
  a: "જવાબ: 'w32tm /query /status' કમાન્ડથી વર્તમાન NTP સોર્સ, પોલ ઇન્ટરવલ, અને લાસ્ટ સક્સેસફુલ સિંક ટાઇમની વિગતવાર માહિતી મળે છે.",
  tip: "કમાન્ડ-લાઇન જ્ઞાન MNC ના પ્રેક્ટિકલ એસેસમેન્ટ રાઉન્ડમાં સીધું ચકાસવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'સર્વર હાર્ડનિંગ (Server Hardening) નો અર્થ શું છે, અને તેમાં કયા 4 કાર્યો સામેલ હોય છે?'",
  a: "જવાબ: સર્વર હાર્ડનિંગનો અર્થ છે ઓપરેટિંગ સિસ્ટમની નબળાઈઓને દૂર કરીને એટેક સરફેસ ન્યૂનતમ બનાવવું. તેમાં સામેલ છે: 1. ડિફોલ્ટ પાસવર્ડ બદલવા અને એકાઉન્ટ રીનેમ કરવું, 2. બિનજરૂરી પોર્ટ્સ અને સર્વિસિસને ડિસેબલ કરવી, 3. ફાયરવોલ ઇનબાઉન્ડ/આઉટબાઉન્ડ નિયમો કડક બનાવવા, અને 4. નવીનતમ સિક્યુરિટી પેચીસ (હોટપેચિંગ) લાગુ કરવા.",
  tip: "Infra Architect અને Security Compliance રાઉન્ડનો આ મૂળભૂત પાયાનો પ્રશ્ન છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 03 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - સર્વરને ડોમેન કંટ્રોલર બનાવતાં પહેલાં કમ્પ્યુટરનું નામ અને સ્ટેટિક IPv4 ફિક્સ કરવું અનિવાર્ય એન્જિનિયરિંગ શિસ્ત છે.
      - DNS લૂપબેક એડ્રેસ `127.0.0.1` જ AD DS નો જીવન આધાર છે; ક્યારેય પણ બાહ્ય પબ્લિક DNS ન નાખો.
      - RDP માં NLA અને NTP ટાઇમ સિન્ક્રોનાઇઝેશન Kerberos સુરક્ષાની કરોડરજ્જુ સમાન છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 04: ACTIVE DIRECTORY DOMAIN SERVICES & DOMAIN CONTROLLER PROMOTION
// =============================================================================

[#metadata("ch4") <chapter-4>]

#chapter-header(
  chapter-num: "CHAPTER 04",
  category: "ભાગ 4 : કેન્દ્રીય ઓળખ અને ડિરેક્ટરી સર્વિસિસ (Identity & Directory Services)",
  title: "#hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સર્વિસિસ (AD DS) અને #hl-yellow[ડોમેન કંટ્રોલર] પ્રમોશન",
  subtitle: "AD DS કોર આર્કિટેક્ચર · લોજિકલ (Forest, Domain, OU) અને ફિઝિકલ (Sites) સંરચના · Add Roles વિઝાર્ડ · રૂટ DC (corp.rtechlab.local) · #hl-orange[DSRM] પાસવર્ડ · 5 FSMO રોલ્સ"
)

=== 4.1 #hl-yellow[એક્ટિવ ડિરેક્ટરી] શું છે? (What is #hl-yellow[Active Directory Domain Services]?)
એક સામાન્ય વર્કગ્રુપ નેટવર્કમાં (Workgroup) દરેક કમ્પ્યુટરનો પોતાનો અલગ સ્થાનિક યુઝર ડેટાબેઝ હોય છે (SAM - Security Accounts Manager). જો કોઈ કંપનીમાં 500 કમ્પ્યુટર્સ હોય અને કોઈ નવો કર્મચારી જોડાય, તો એડમિનિસ્ટ્રેટરે તમામ 500 કમ્પ્યુટર્સ પર જઈને અલગ-અલગ યુઝર એકાઉન્ટ બનાવવું પડે!

#mark-yellow[એક્ટિવ ડિરેક્ટરી ડોમેન સર્વિસિસ (AD DS) એ માઇક્રોસોફ્ટની એક કેન્દ્રીયકૃત ડિરેક્ટરી સેવા (Centralized Directory Service) છે જે સમગ્ર સંસ્થાના તમામ યુઝર્સ, કમ્પ્યુટર્સ, ગ્રુપ્સ અને નેટવર્ક સંસાધનોની માહિતીને એક જ સુરક્ષિત ડેટાબેઝમાં સંગ્રહિત તેમજ સંચાલિત કરે છે.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "ડિરેક્ટરી ઓબ્જેક્ટ્સ (Objects) અને સ્કીમા")[
      AD ની અંદર દરેક પ્રવેગ/નોંધણીને #hl-yellow[ઓબ્જેક્ટ (Object)] કહેવામાં આવે છે (દા.ત. યુઝર, કમ્પ્યુટર, પ્રિન્ટર). દરેક ઓબ્જેક્ટના ગુણધર્મો હોય છે જેને #hl-green[એટ્રિબ્યુટ્સ (Attributes)] કહે છે (દા.ત. First Name, Email, Telephone). ડેટાબેઝના આ નિયમો અને સંરચનાને #hl-orange[સ્કીમા (Schema)] કહેવામાં આવે છે.
    ]
  ],
  [
    #info-box(title: "ગ્લોબલ કેટલોગ (Global Catalog - GC)")[
      ગ્લોબલ કેટલોગ એક વિશિષ્ટ #hl-yellow[ડોમેન કંટ્રોલર] છે જે સમગ્ર ફોરેસ્ટના તમામ ડોમેનના તમામ ઓબ્જેક્ટ્સના સૌથી આવશ્યક એટ્રિબ્યુટ્સ (આંશિક નકલ - Partial Replica) સંગ્રહિત કરે છે. આ મલ્ટી-ડોમેન નેટવર્કમાં ઝડપી સર્ચિંગ સક્ષમ બનાવે છે. #hl-green[પોર્ટ: 3268 (LDAP GC)].
    ]
  ]
)

#v(4pt)

=== 4.2 AD લોજિકલ આર્કિટેક્ચર: ફોરેસ્ટ, ટ્રી, ડોમેન અને OUs
#hl-yellow[એક્ટિવ ડિરેક્ટરી]ની લોજિકલ સંરચના એ નક્કી કરે છે કે નેટવર્ક સંસાધનોને વહીવટી રીતે કેવી રીતે ગોઠવવામાં આવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ad_hierarchy_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 4.1: #hl-yellow[એક્ટિવ ડિરેક્ટરી] લોજિકલ વંશવેલો — ફોરેસ્ટ રૂટ, ચાઇલ્ડ ડોમેન, ટ્રી અને ઓર્ગેનાઇઝેશનલ યુનિટ્સ (OUs)]
]

#v(4pt)

1. #text(weight: "bold", fill: rtech-navy)[ફોરેસ્ટ (Forest):] #hl-yellow[એક્ટિવ ડિરેક્ટરી]ની સર્વોચ્ચ સુરક્ષા સીમા (Ultimate Security Boundary). એક ફોરેસ્ટ અંતર્ગત આવતા તમામ ડોમેન એક સમાન સ્કીમા, એક સામાન્ય ગ્લોબલ કેટલોગ અને એક સમાન કન્ફિગરેશન શેર કરે છે.
2. #text(weight: "bold", fill: rtech-navy)[ટ્રી (Tree):] એક અથવા એકથી વધુ ડોમેન્સનો વંશવેલો જે સતત DNS નેમસ્પેસ (Contiguous Namespace) શેર કરે છે (દા.ત. `rtechlab.local` અને `delhi.rtechlab.local`).
3. #text(weight: "bold", fill: rtech-navy)[ડોમેન (Domain):] સુરક્ષા અને વહીવટી નીતિઓની (Administrative Boundary) મુખ્ય એકમ. આપણી લેબનું ડોમેન #hl-yellow[`corp.rtechlab.local`] રહેશે.
4. #text(weight: "bold", fill: rtech-navy)[ઓર્ગેનાઇઝેશનલ યુનિટ (OU):] ડોમેનની અંદર બનાવવામાં આવતો વહીવટી કન્ટેનર (Container). આની અંદર યુઝર્સ અને કમ્પ્યુટર્સને વિભાગ અનુસાર રાખવામાં આવે છે જેથી તેમના પર ગ્રુપ પોલિસી (GPO) લાગુ કરી શકાય.

#v(6pt)

=== 4.3 AD ફિઝિકલ આર્કિટેક્ચર: #hl-yellow[ડોમેન કંટ્રોલર]્સ, સાઇટ્સ અને સબનેટ્સ
લોજિકલ સંરચના એ નક્કી કરે છે કે ઓબ્જેક્ટ્સને *કેવી રીતે જોવામાં આવે*, જ્યારે ફિઝિકલ સંરચના એ નક્કી કરે છે કે ડિરેક્ટરીનો ડેટા *નેટવર્ક વાયરો અને હાર્ડવેર પર કેવી રીતે રેપ્લિકેટ (Replicate) થાય*:

- #text(weight: "bold", fill: rtech-blue)[ડોમેન કંટ્રોલર (Domain Controller / DC):] તે ફિઝિકલ અથવા વર્ચ્યુઅલ સર્વર જેના પર AD DS રોલ ઇન્સ્ટોલ હોય છે અને જે #hl-yellow[એક્ટિવ ડિરેક્ટરી]ના મુખ્ય ડેટાબેઝની (#hl-yellow[`ntds.dit`]) સંપૂર્ણ નકલ રાખે છે.
- #text(weight: "bold", fill: rtech-navy)[એક્ટિવ ડિરેક્ટરી સાઇટ્સ (Sites):] એક અથવા વધુ સુવ્યવસ્થિત, હાઇ-સ્પીડ TCP/IP સબનેટ્સનો સમૂહ (જેમ કે 'Mumbai-HO Site' અને 'Bangalore-Branch Site'). સાઇટ્સનો ઉપયોગ WAN લિંક પર બિનજરૂરી રેપ્લિકેશન ટ્રાફિકને નિયંત્રિત કરવા અને ક્લાયન્ટને સૌથી નજીકના DC થી ઓથેન્ટિકેટ કરાવવા માટે થાય છે.

#v(6pt)

=== 4.4 પ્રેક્ટિકલ લેબ: Add Roles and Features વિઝાર્ડ દ્વારા AD DS રોલ ઇન્સ્ટોલેશન
હવે આપણે આપણી વર્ચ્યુઅલ મશીન `SRV-2025-DC01` પર એક્ટિવ ડિરેક્ટરી રોલ સ્થાપિત કરીશું:

1. #hl-yellow[Server Manager] ખોલો અને ઉપર જમણી બાજુ આપેલ #hl-green['Manage'] મેનૂ પર ક્લિક કરીને #hl-yellow['Add Roles and Features'] પસંદ કરો.
2. 'Before You Begin' સ્ક્રીન પર 'Next' દબાવો.
3. Installation Type માં #hl-yellow['Role-based or feature-based installation'] પસંદ કરીને 'Next' દબાવો.
4. Server Selection માં ખાતરી કરો કે પૂલમાં તમારી મશીન #hl-green[`SRV-2025-DC01 (192.168.1.10)`] પસંદ કરેલ છે. 'Next' દબાવો.
5. Server Roles ની યાદીમાં #mark-yellow[Active Directory Domain Services] ચેકબોક્સ પર ટિક કરો.
6. એક પોપ-અપ વિંડો ખુલશે: 'Add Features that are required for #hl-yellow[Active Directory Domain Services]' (RSAT ટૂલ્સ સામેલ). #hl-green['Add Features'] પર ક્લિક કરો અને 'Next' દબાવો.
7. Features સ્ક્રીન પર ડિફોલ્ટ પસંદગી રહેવા દો અને 'Next' દબાવો.
8. Confirmation સ્ક્રીન પર 'Restart the destination server automatically if required' ને અનચેક રહેવા દો અને #hl-green['Install'] પર ક્લિક કરો.
9. 2 થી 3 મિનિટમાં રોલ ઇન્સ્ટોલેશન પૂર્ણ થશે. 'Close' પર ક્લિક કરો.

#v(6pt)

=== 4.5 પ્રેક્ટિકલ લેબ: સર્વરને રૂટ #hl-yellow[ડોમેન કંટ્રોલર] પ્રમોટ કરવું (DC Promotion)
રોલ ઇન્સ્ટોલ થયા પછી સર્વર આપમેળે DC બનતું નથી. તેને પ્રમોટ કરવું પડે છે:

1. #hl-yellow[Server Manager] ની ટોચ પર આપેલ પીળા રંગના ચેતવણી ધ્વજ (#text(weight: "bold", fill: rtech-amber)[⚠️ Notification Flag]) પર ક્લિક કરો.
2. વાદળી રંગની લિંક પર ક્લિક કરો: #mark-green[Promote this server to a domain controller].
3. #text(weight: "bold")[Deployment Configuration:] આપણે પહેલી વાર નવું ડોમેન બનાવી રહ્યા છીએ, તેથી ત્રીજો વિકલ્પ પસંદ કરો: #hl-yellow['Add a new forest'].
   - Root domain name માં લખો: #hl-green[`corp.rtechlab.local`]. 'Next' દબાવો.
4. #text(weight: "bold")[Domain Controller Options:]
   - Forest & Domain functional level: #hl-green[Windows Server 2025] (નવીનતમ સુરક્ષા સુવિધાઓ માટે).
   - 'Domain Name System (DNS) server' અને 'Global Catalog (GC)' ને ચેક રહેવા દો.
   - #text(weight: "bold", fill: rtech-navy)[Directory Services Restore Mode (#hl-orange[DSRM]) Password:] આ આપત્તિ સમયે AD ડેટાબેઝ રિસ્ટોર કરવા માટેનો માસ્ટર રિકવરી પાસવર્ડ છે. એક મજબૂત પાસવર્ડ દાખલ કરો (દા.ત. #hl-green[`Dsrm@2025!`]). 'Next' દબાવો.
5. #text(weight: "bold")[DNS Options:] 'A delegation for this DNS server cannot be created...' ની સામાન્ય પીળી ચેતવણી આવશે, તેને અવગણીને સીધા જ 'Next' દબાવો.
6. #text(weight: "bold")[Additional Options:] વિઝાર્ડ આપમેળે NetBIOS નામ જનરેટ કરશે: #hl-yellow[`CORP`]. 'Next' દબાવો.
7. #text(weight: "bold")[Paths:] ડેટાબેઝ, લોગ અને SYSVOL ના ડિફોલ્ટ પાથ રહેવા દો (`C:\Windows\NTDS` અને `C:\Windows\SYSVOL`). 'Next' દબાવો.
8. #text(weight: "bold")[Prerequisites Check:] સિસ્ટમ તમામ પૂર્વ-આવશ્યકતાઓની ચકાસણી કરશે. ટોચ પર લીલો ટિક દેખાશે: #hl-green['All prerequisite checks passed successfully'].
9. નીચે આપેલ #mark-green[Install] બટન પર ક્લિક કરો!
10. સર્વર AD DS કન્ફિગર કરશે અને આપમેળે રીબૂટ થશે. રીબૂટ પછી લોગિન સ્ક્રીન પર તમને દેખાશે: #hl-yellow[`CORP\Administrator`]. અભિનંદન, તમારું #hl-yellow[ડોમેન કંટ્રોલર] હવે લાઈવ છે!

#v(6pt)

=== 4.6 FSMO ના 5 વિશિષ્ટ રોલ્સની કાર્યપ્રણાલી (5 FSMO Master Roles)
જો કે એક્ટિવ ડિરેક્ટરી મલ્ટી-માસ્ટર રેપ્લિકેશન મોડેલ પર કાર્ય કરે છે (જ્યાં કોઈપણ DC પર યુઝર બનાવી શકાય છે), પરંતુ ડેટા ટકરાવ (Conflicts) રોકવા માટે 5 એવા મહત્વપૂર્ણ કાર્યો છે જે એક સમયે સમગ્ર નેટવર્કમાં માત્ર *એક જ વિશિષ્ટ #hl-yellow[ડોમેન કંટ્રોલર]* દ્વારા કરી શકાય છે. આમને #hl-yellow[FSMO (Flexible Single Master Operations)] રોલ્સ કહેવામાં આવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/fsmo_roles_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 4.2: FSMO 5 રોલ્સનો વંશવેલો — 2 ફોરેસ્ટ-વાઇડ રોલ્સ અને 3 ડોમેન-વાઇડ રોલ્સની કાર્યપ્રણાલી]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[FSMO રોલ્સનું સંપૂર્ણ વિવરણ (MNC Interview Goldmine):]\
    - #text(weight: "bold", fill: rtech-blue)[ફોરેસ્ટ-વાઇડ રોલ્સ (સમગ્ર ફોરેસ્ટમાં માત્ર 1 DC પર):]
      1. #text(weight: "bold")[Schema Master:] સમગ્ર ફોરેસ્ટમાં AD ના સ્કીમા (ક્લાસ અને એટ્રિબ્યુટ્સ) માં થતા ફેરફારોને નિયંત્રિત કરે છે (જેમ કે Exchange સર્વર ઇન્સ્ટોલ કરતી વખતે).
      2. #text(weight: "bold")[Domain Naming Master:] ફોરેસ્ટમાં નવા ડોમેનને જોડવા અથવા જૂના ડોમેનને હટાવવાનો વિશેષ અધિકાર ધરાવે છે.
    - #text(weight: "bold", fill: rtech-emerald)[ડોમેન-વાઇડ રોલ્સ (ફોરેસ્ટના દરેક ડોમેનમાં 1-1 DC પર):]
      3. #text(weight: "bold")[PDC Emulator (સર્વોચ્ચ મહત્વપૂર્ણ રોલ):] #hl-orange[Kerberos] પાસવર્ડ ફેરફારોનું તાત્કાલિક પ્રોસેસિંગ, ટાઇમ સિન્ક્રોનાઇઝેશન (NTP Master), ગ્રુપ પોલિસી એડિટિંગ અને એકાઉન્ટ લોકઆઉટ સંભાળે છે.
      4. #text(weight: "bold")[RID Master (Relative ID Master):] જ્યારે પણ નવો યુઝર કે ગ્રુપ બને છે, તેને એક યુનિક SID મળે છે. RID Master દરેક DC ને 500 RIDs નો એક પૂલ ફાળવે છે જેથી SIDs ડુપ્લિકેટ ન થાય.
      5. #text(weight: "bold")[Infrastructure Master:] મલ્ટી-ડોમેન એન્વાયર્નમેન્ટમાં અન્ય ડોમેનના ગ્રુપ્સમાં સામેલ યુઝર્સના ક્રોસ-ડોમેન રેફરન્સ (GUID અને SID મેપિંગ) અપડેટ રાખે છે.
  ]
)

#v(4pt)
#pro-tip(title: "FSMO રોલ્સ તપાસવા માટેનો 1-સેકન્ડ કમાન્ડ")[
  કમાન્ડ પ્રોમ્પ્ટમાં ચલાવો: #hl-green[`netdom query fsmo`] — આ તરત જ બતાવી દેશે કે તમારા 5 રોલ્સ કયા સર્વર પર સ્થિત છે!
]

#v(6pt)

=== 4.7 AD ડેટાબેઝની આંતરિક ફાઇલો અને હેલ્થ વેરિફિકેશન
- #text(weight: "bold", fill: rtech-navy)[`ntds.dit` (New Technology Directory Services Database):] આ એક્ટિવ ડિરેક્ટરીની મુખ્ય ડેટાબેઝ ફાઇલ છે જે `C:\Windows\NTDS\` માં સ્થિત હોય છે. તે ESE (Extensible Storage Engine - Jet Blue) પર આધારિત હોય છે. Server 2025 માં તેનો પેજ સાઇઝ 32 KB છે.
- #text(weight: "bold", fill: rtech-navy)[`SYSVOL` ફોલ્ડર:] આ `C:\Windows\SYSVOL\` માં સ્થિત હોય છે. તે નેટવર્ક પર શેયર્ડ હોય છે અને તમામ ડોમેન કંટ્રોલર્સ વચ્ચે DFSR (Distributed File System Replication) દ્વારા સિંક થાય છે. આમાં જ તમામ ગ્રુપ પોલિસી ફાઇલો અને લોગિન સ્ક્રિપ્ટ્સ હોય છે.
- #text(weight: "bold", fill: rtech-navy)[હેલ્થ ચેક કમાન્ડ:] એડમિન કમાન્ડ પ્રોમ્પ્ટમાં #hl-green[`dcdiag /v`] ચલાવો. આ 30 થી વધુ આંતરિક પરીક્ષણો (Connectivity, Advertising, Replications, FrsSysvol) ચલાવીને પુષ્ટિ કરે છે કે તમારું DC 100% સ્વસ્થ છે.

#v(8pt)

// =============================================================================
// CHAPTER 04 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  શરૂઆતી વિન્ડોઝ NT 4.0 ના સમયગાળામાં ડિરેક્ટરી ડેટાબેઝ માત્ર એક ફ્લેટ ફાઇલ (SAM) રહેતી હતી જે મહત્તમ 40,000 ઓબ્જેક્ટ્સ જ સંભાળી શકતી હતી. વર્ષ 2000 માં એક્ટિવ ડિરેક્ટરી આવ્યા પછી માઇક્રોસોફ્ટે Microsoft Exchange માંથી જેટ બ્લૂ (Jet Blue ESE) ડેટાબેઝ એન્જિન અપનાવ્યું. આજે Windows Server 2025 માં એક જ એક્ટિવ ડિરેક્ટરી ડેટાબેઝ #hl-yellow[2 અબજ (2 Billion) થી વધુ ઓબ્જેક્ટ્સ] ને કોઈપણ પરફોર્મન્સ ડિગ્રેડેશન વિના પ્રોસેસ કરી શકે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 04 પ્રેક્ટિસ બહુવિકલ્પીય પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "એક્ટિવ ડિરેક્ટરીના 5 FSMO રોલ્સમાંથી કયા બે રોલ્સ સમગ્ર ફોરેસ્ટ (Forest-Wide) સ્તરે અદ્વિતીય હોય છે?",
  optA: "PDC Emulator અને RID Master",
  optB: "Schema Master અને Domain Naming Master",
  optC: "Infrastructure Master અને PDC Emulator",
  optD: "RID Master અને Infrastructure Master",
  ans: "B",
  exp: "Schema Master અને Domain Naming Master સમગ્ર ફોરેસ્ટમાં માત્ર 1-1 હોય છે; બાકીના ત્રણ રોલ્સ પ્રતિ ડોમેન 1-1 હોય છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "એક્ટિવ ડિરેક્ટરીની મુખ્ય ડેટાબેઝ ફાઇલનું વાસ્તવિક નામ અને એક્સટેન્શન શું હોય છે?",
  optA: "activedirectory.mdf",
  optB: "ntds.dit",
  optC: "sam.dat",
  optD: "ad_database.db",
  ans: "B",
  exp: "એક્ટિવ ડિરેક્ટરીની ડેટાબેઝ ફાઇલનું નામ ntds.dit (Directory Information Tree) હોય છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "ડોમેનમાં કોઈ યુઝરના પાસવર્ડ ફેરફારનું તાત્કાલિક પ્રોસેસિંગ, ટાઇમ સિન્ક્રોનાઇઝેશન અને એકાઉન્ટ લોકઆઉટ કયા FSMO રોલ દ્વારા સંભાળવામાં આવે છે?",
  optA: "Schema Master",
  optB: "Domain Naming Master",
  optC: "PDC Emulator",
  optD: "Infrastructure Master",
  ans: "C",
  exp: "PDC Emulator ડોમેનનો સૌથી વ્યસ્ત FSMO રોલ છે જે પાસવર્ડ ઓથેન્ટિકેશન, ટાઇમ અને GPO એડિટિંગને નિયંત્રિત કરે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "એક્ટિવ ડિરેક્ટરીમાં તમામ 5 FSMO રોલ્સ કયા ડોમેન કંટ્રોલર પાસે છે, તે ચકાસવા માટે કયા સત્તાવાર કમાન્ડનો ઉપયોગ થાય છે?",
  optA: "ipconfig /all",
  optB: "netdom query fsmo",
  optC: "gpresult /v",
  optD: "dcdiag /test:dns",
  ans: "B",
  exp: "netdom query fsmo કમાન્ડ પાંચેય FSMO રોલ ધારકોના નામ એક સેકન્ડમાં પ્રદર્શિત કરી દે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ગ્લોબલ કેટલોગ (Global Catalog - GC) સર્વર મલ્ટી-ડોમેન ક્વેરી સાંભળવા માટે કયા વિશિષ્ટ પોર્ટ નંબરનો ઉપયોગ કરે છે?",
  optA: "પોર્ટ 80 (HTTP)",
  optB: "પોર્ટ 389 (LDAP)",
  optC: "પોર્ટ 3268 (LDAP GC)",
  optD: "પોર્ટ 445 (SMB)",
  ans: "C",
  exp: "સામાન્ય LDAP પોર્ટ 389 પર ચાલે છે, જ્યારે Global Catalog ક્વેરીઝ પોર્ટ 3268 (અથવા SSL માં 3269) પર સાંભળવામાં આવે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'જો PDC Emulator રોલ ધારક સર્વર અચાનક ક્રેશ થઈ જાય, તો ડોમેન પર શું અસર પડશે?'",
  a: "જવાબ: PDC Emulator ડાઉન થવા પર ડોમેન તરત જ બંધ નથી થતું, પરંતુ ઘણી સમસ્યાઓ શરૂ થઈ જાય છે: 1. યુઝર દ્વારા પાસવર્ડ બદલવા પર તરત રેપ્લિકેશન થશે નહીં અને જૂના પાસવર્ડથી થોડા સમય માટે લોગિન થઈ શકે છે, 2. ખોટા પાસવર્ડ પર એકાઉન્ટ લોકઆઉટ પ્રોસેસ થશે નહીં, 3. સમગ્ર ડોમેનના મશીનોમાં ટાઇમ ડ્રિફ્ટ (Clock Skew) આવવા લાગશે, અને 4. GPMC માં ગ્રુપ પોલિસી એડિટ કરતી વખતે ડિફોલ્ટ DC મળશે નહીં. આને તાત્કાલિક અન્ય કોઈ DC પર સીઝ (Seize) કરવું જરૂરી બને છે.",
  tip: "HCL, Infosys અને Tech Mahindra ના L2 ડિરેક્ટરી સર્વિસિસ ઇન્ટરવ્યુનો આ સૌથી મહત્વપૂર્ણ સવાલ છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'FSMO રોલ્સમાં Transfer અને Seize વચ્ચે શું તફાવત હોય છે?'",
  a: "જવાબ: 'Transfer' ત્યારે કરવામાં આવે છે જ્યારે જૂનો DC ઓનલાઇન અને સ્વસ્થ હોય; આમાં ગ્રેસફુલી બંને સર્વર્સ પરસ્પર સંવાદ કરીને રોલ સોંપે છે. 'Seize' ત્યારે કરવામાં આવે છે જ્યારે જૂનો DC હાર્ડવેર ફેલિયર અથવા ક્રેશના કારણે હંમેશા માટે નષ્ટ થઈ ગયો હોય અને ક્યારેય ઓનલાઇન ન આવી શકે. Seize કર્યા પછી જૂના DC ને ક્યારેય તે જ નામથી નેટવર્ક પર ફરી ચાલુ ન કરવો જોઈએ.",
  tip: "ડિઝાસ્ટર રિકવરી અને FSMO રોલ માઇગ્રેશનમાં આ મૂળભૂત તફાવત પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: '#hl-orange[DSRM] (#hl-orange[Directory Services Restore Mode]) પાસવર્ડ શું છે, અને તે સામાન્ય ડોમેન એડમિન પાસવર્ડથી કેવી રીતે અલગ છે?'",
  a: "જવાબ: ડોમેન એડમિનનો પાસવર્ડ એક્ટિવ ડિરેક્ટરી ડેટાબેઝ (ntds.dit) ની અંદર સ્ટોર થાય છે. જો AD ડેટાબેઝ કરપ્ટ થઈ જાય અથવા સર્વર Safe Mode (#hl-orange[DSRM]) માં બૂટ થાય જ્યાં AD સર્વિસિસ બંધ હોય છે, તો ડોમેન એડમિન લોગિન કામ કરશે નહીં. આવી કટોકટીમાં સર્વરના લોકલ SAM ડેટાબેઝમાં માત્ર #hl-orange[DSRM] પાસવર્ડ જ કામ કરે છે જેના દ્વારા ડેટાબેઝ રિસ્ટોર કરવામાં આવે છે.",
  tip: "આ ઉત્તર સાબિત કરે છે કે તમે માત્ર ટૂલ્સ નથી ચલાવતા, પરંતુ ઇન્ટરનલ રિકવરી આર્કિટેક્ચરને સમજો છો."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'RID Master ની શું ભૂમિકા છે, અને RID Exhaustion શું હોય છે?'",
  a: "જવાબ: જ્યારે પણ કોઈ યુઝર, ગ્રુપ કે કમ્પ્યુટર બને છે, તેને એક SID મળે છે (Domain SID + RID). RID Master દરેક DC ને 500 RIDs નો પૂલ આપે છે. 30-બીટ આર્કિટેક્ચરમાં એક ડોમેનમાં આશરે 1 અબજ RIDs ઉપલબ્ધ હોય છે. જો કોઈ ઓટોમેટેડ સ્ક્રિપ્ટ લાખો એકાઉન્ટ્સ બનાવીને ડિલીટ કરતી રહે, તો RIDs સમાપ્ત થઈ શકે છે; Windows Server 2025 માં 31-બીટ RID સ્પેસ અને વોર્નિંગ ઇવેન્ટ્સ આપીને તેને સુરક્ષિત બનાવવામાં આવ્યું છે.",
  tip: "Cognizant અને TCS ના સિનિયર L2 સપોર્ટ રાઉન્ડનો આ લોકપ્રિય પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'SYSVOL ફોલ્ડરનું શું કામ છે અને તે ડોમેન કંટ્રોલર્સ વચ્ચે કયા પ્રોટોકોલથી સિંક થાય છે?'",
  a: "જવાબ: SYSVOL ફોલ્ડર ડોમેનના તમામ ક્લાયન્ટ્સ માટે શેયર્ડ ડિરેક્ટરી છે જેમાં તમામ ગ્રુપ પોલિસી ઓબ્જેક્ટ્સ (GPT - Templates) અને લોગિન/લોગઓફ સ્ક્રિપ્ટ્સ સ્ટોર હોય છે. આધુનિક વિન્ડોઝ સર્વરમાં તે સર્વર્સ વચ્ચે DFSR (Distributed File System Replication) દ્વારા સિંક થાય છે (જૂના Server 2003 માં વપરાતું FRS હવે બંધ કરી દેવામાં આવ્યું છે).",
  tip: "GPO રેપ્લિકેશન અને ઇન્ફ્રાસ્ટ્રક્ચર સપોર્ટમાં DFSR નું જ્ઞાન અનિવાર્ય માનવામાં આવે છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 04 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - AD DS કોઈપણ એન્ટરપ્રાઇઝની કેન્દ્રીય ઓળખ અને સુરક્ષાની કરોડરજ્જુ છે (ડેટાબેઝ: `ntds.dit`, શેર: `SYSVOL`).
      - FSMO ના 5 રોલ્સમાંથી PDC Emulator દૈનિક કામગીરી (પાસવર્ડ, ટાઇમ, GPO) માટે સૌથી મહત્વપૂર્ણ છે.
      - `netdom query fsmo` અને `dcdiag /v` દરેક સિસ્ટમ એડમિનિસ્ટ્રેટરના મુખ્ય દૈનિક ડાયગ્નોસ્ટિક કમાન્ડ્સ છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 05: ADUC CONSOLE: OUS, DOMAIN USERS & GROUP MANAGEMENT
// =============================================================================

[#metadata("ch5") <chapter-5>]

#chapter-header(
  chapter-num: "CHAPTER 05",
  category: "ભાગ 5 : ડિરેક્ટરી ઓબ્જેક્ટ્સ અને એક્સેસ કંટ્રોલ (Directory Objects & RBAC)",
  title: "ADUC કન્સોલ: OUs, ડોમેન યુઝર્સ અને સિક્યુરિટી ગ્રુપ્સનું મેનેજમેન્ટ",
  subtitle: "ADUC (dsa.msc) · એન્ટરપ્રાઇઝ OU વંશવેલો · નવા ડોમેન યુઝર એકાઉન્ટ્સ · પાસવર્ડ અને લોકઆઉટ નીતિઓ · સિક્યુરિટી vs ડિસ્ટ્રિબ્યુશન ગ્રુપ્સ · #hl-orange[AGDLP] · PowerShell બલ્ક"
)

=== 5.1 #hl-yellow[Active Directory Users and Computers] (`dsa.msc`) ઇન્ટરફેસ
#hl-yellow[ડોમેન કંટ્રોલર] પ્રમોટ થયા પછી, #hl-yellow[એક્ટિવ ડિરેક્ટરી]ના તમામ ઓબ્જેક્ટ્સ (Users, Computers, Groups, OUs) ને સંચાલિત કરવા માટેનું પ્રાથમિક ગ્રાફિકલ એડમિનિસ્ટ્રેટિવ ટૂલ #hl-yellow[Active Directory Users and Computers (ADUC)] છે.

*ADUC કન્સોલ ખોલવાની 2 ઝડપી રીતો:*
1. #hl-yellow[Server Manager] માં -> ઉપર જમણી બાજુએ #hl-green[Tools] મેનૂ -> #hl-yellow[Active Directory Users and Computers] પર ક્લિક કરો.
2. રન ડાયલોગ (`Win + R`) માં શોર્ટકટ કમાન્ડ ટાઇપ કરો: #mark-green[`dsa.msc`] અને Enter દબાવો.

કન્સોલની ડાબી બાજુએ તમારું ડોમેન `#text(weight: "bold")[corp.rtechlab.local]` દેખાશે. તેની નીચે કેટલાક ડિફોલ્ટ કન્ટેનર્સ પહેલેથી બનેલા હોય છે:
- #text(weight: "bold", fill: rtech-navy)[Builtin:] સિસ્ટમના ડિફોલ્ટ સુરક્ષા ગ્રુપ્સ (Administrators, Account Operators, Backup Operators વગેરે).
- #text(weight: "bold", fill: rtech-navy)[Computers:] જ્યારે કોઈ સામાન્ય ક્લાયન્ટ કમ્પ્યુટર ડોમેન જોઈન કરે છે, ત્યારે તેનું ખાતું ડિફોલ્ટ રીતે આ જ ફોલ્ડરમાં બને છે.
- #text(weight: "bold", fill: rtech-navy)[Domain Controllers:] આ ડોમેનના તમામ અધિકૃત #hl-yellow[ડોમેન કંટ્રોલર] સર્વર્સનું સમર્પિત OU.
- #text(weight: "bold", fill: rtech-navy)[Users:] ડિફોલ્ટ ડોમેન યુઝર્સ અને ગ્રુપ્સ (દા.ત. Administrator, Guest, Domain Admins, Domain Users).

#warning-box(title: "ડિફોલ્ટ કન્ટેનર vs ઓર્ગેનાઇઝેશનલ યુનિટ (Critical Architectural Difference)")[
  'Computers' અને 'Users' સામાન્ય કન્ટેનર (Generic Containers) છે, તે OU નથી! #hl-orange[ડિફોલ્ટ કન્ટેનર્સ પર ક્યારેય ગ્રુપ પોલિસી ઓબ્જેક્ટ (GPO) સીધું લિંક કરી શકાતું નથી.] તેથી એન્ટરપ્રાઇઝ પ્રોડક્શનમાં કર્મચારીઓ કે કમ્પ્યુટર્સને ક્યારેય ડિફોલ્ટ ફોલ્ડરમાં રાખવામાં આવતા નથી; હંમેશા કસ્ટમ OUs બનાવવામાં આવે છે.
]

#v(4pt)

=== 5.2 એન્ટરપ્રાઇઝ OU વંશવેલો ડિઝાઇન (Enterprise OU Hierarchy Design)
એક સુવ્યવસ્થિત OU માળખું કોર્પોરેટ પ્રશાસન, ડેલિગેશન અને સુરક્ષા નીતિઓના અમલીકરણને સરળ બનાવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ou_hierarchy_agdlp.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 5.1: એન્ટરપ્રાઇઝ OU માળખું અને #hl-orange[AGDLP] રોલ-બેઝ્ડ એક્સેસ કંટ્રોલ (RBAC) નેસ્ટિંગ ફ્રેમવર્ક]
]

#v(4pt)

*કસ્ટમ OU બનાવવાની સ્ટેપ-બાય-સ્ટેપ રીત:*
1. ADUC માં ડોમેન નામ `#text(weight: "bold")[corp.rtechlab.local]` પર રાઇટ-ક્લિક કરો -> #hl-yellow[New -> Organizational Unit].
2. Name માં ટાઇપ કરો: #hl-green[`RTechLab-Enterprise`].
3. #mark-orange['Protect container from accidental deletion'] ચેકબોક્સને હંમેશા ચેક કરેલું જ રાખો. આ સુરક્ષા કોઈપણ એડમિન દ્વારા ભૂલથી OU ડિલીટ થવાથી બચાવે છે. 'OK' પર ક્લિક કરો.
4. હવે `RTechLab-Enterprise` પર રાઇટ-ક્લિક કરીને સબ-OUs બનાવો:
   - #hl-yellow[`Corporate-Departments`] (તેની અંદર `HR`, `Finance`, `IT-Admins`, અને `Sales` સબ-OUs)
   - #hl-yellow[`Workstations`] (કર્મચારીઓના Windows 10/11 લેપટોપ અને ડેસ્કટોપ માટે)
   - #hl-yellow[`Servers`] (મેમ્બર સર્વર્સ જેવા કે File Server, Web Server માટે)

#v(6pt)

=== 5.3 નવું ડોમેન યુઝર એકાઉન્ટ બનાવવું (Creating Domain User Accounts)
હવે આપણે HR વિભાગ માટે એક નવું ડોમેન યુઝર એકાઉન્ટ બનાવીશું:

1. `Corporate-Departments -> HR` OU પર રાઇટ-ક્લિક કરો -> #hl-yellow[New -> User].
2. #text(weight: "bold")[First name:] `Rahul`, #text(weight: "bold")[Last name:] `Patel`.
3. #text(weight: "bold")[User logon name (UPN):] #hl-green[`rpatel`]\@corp.rtechlab.local.
4. #text(weight: "bold")[User logon name (pre-Windows 2000):] `CORP\rpatel` (આપોઆપ ભરાઈ જશે). 'Next' દબાવો.
5. #text(weight: "bold")[પાસવર્ડ સેટિંગ્સ અને 4 મહત્વપૂર્ણ ચેકબોક્સ:]
   - #text(weight: "bold", fill: rtech-blue)[✓ User must change password at next logon:] (કોર્પોરેટ બેસ્ટ પ્રેક્ટિસ — જ્યારે કર્મચારી પ્રથમ વખત લોગિન કરશે, ત્યારે સિસ્ટમ તેને પોતાનો અંગત પાસવર્ડ સેટ કરવાની ફરજ પાડશે).
   - #text(weight: "bold", fill: rtech-muted)[User cannot change password:] (શેર્ડ અથવા કિયોસ્ક કમ્પ્યુટર એકાઉન્ટ્સ માટે).
   - #text(weight: "bold", fill: rtech-rose)[Password never expires:] (માત્ર સર્વિસ એકાઉન્ટ્સ માટે; સામાન્ય યુઝર્સ પર આ સેટ કરવું ગંભીર સુરક્ષા ઉલ્લંઘન ગણાય છે).
   - #text(weight: "bold", fill: rtech-amber)[Account is disabled:] (કર્મચારીના નોટિસ પીરિયડ અથવા લાંબી રજા દરમિયાન એકાઉન્ટ કામચલાઉ બંધ કરવા માટે).
6. પ્રારંભિક જટિલ પાસવર્ડ દાખલ કરો (દા.ત. #hl-green[`Welcome@2025#`]) અને 'Next' -> 'Finish' કરો.

#v(6pt)

=== 5.4 એકાઉન્ટ લોકઆઉટ અને ફાઇન-ગ્રેઇન્ડ પાસવર્ડ પોલિસી (Account Lockout & FGPP)
બ્રુટ-ફોર્સ પાસવર્ડ ગેસિંગ એટેક્સ અટકાવવા માટે #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં ઓટોમેટેડ એકાઉન્ટ લોકઆઉટ સુરક્ષા વ્યવસ્થા હોય છે:
- જો કોઈ કર્મચારી કે અનધિકૃત વ્યક્તિ સતત 5 વખત ખોટો પાસવર્ડ દાખલ કરે (Account lockout threshold), તો તેનું એકાઉન્ટ 30 મિનિટ માટે આપોઆપ લોક થઈ જાય છે.
- *એકાઉન્ટ અનલોક કરવાની રીત:* ADUC માં યુઝર પર રાઇટ-ક્લિક કરો -> #hl-yellow[Properties -> Account] ટેબ પર જાઓ. નીચે આપેલા ચેકબોક્સ #hl-green['Unlock account. This account is currently locked out on this Active Directory Domain Controller'] પર ટીક લગાવો અને 'Apply' કરો.

#v(6pt)

=== 5.5 સિક્યુરિટી ગ્રુપ્સ vs ડિસ્ટ્રિબ્યુશન ગ્રુપ્સ (Group Types)
#hl-yellow[એક્ટિવ ડિરેક્ટરી]માં બે અલગ પ્રકારના ગ્રુપ્સ હોય છે:
1. #text(weight: "bold", fill: rtech-navy)[સિક્યુરિટી ગ્રુપ્સ (Security Groups):] આ ગ્રુપ્સનો પ્રાથમિક હેતુ નેટવર્ક રિસોર્સિસ (શેર્ડ ફોલ્ડર્સ, પ્રિન્ટર્સ, શેરપોઇન્ટ) પર પરવાનગીઓ (Permissions) આપવાનો હોય છે. તેનો ઉપયોગ ઇમેઇલ ડિલિવરી માટે પણ થઈ શકે છે.
2. #text(weight: "bold", fill: rtech-navy)[ડિસ્ટ્રિબ્યુશન ગ્રુપ્સ (Distribution Groups):] આ ગ્રુપ્સ માત્ર ઇમેઇલ લિસ્ટ્સ (Distribution Lists - Exchange Server/Outlook) બનાવવા માટે વપરાય છે. #hl-orange[ડિસ્ટ્રિબ્યુશન ગ્રુપ્સને ક્યારેય કોઈ ફાઇલ કે ફોલ્ડરની NTFS સુરક્ષા પરવાનગી આપી શકાતી નથી!]

#v(6pt)

=== 5.6 ગ્રુપ સ્કોપ્સ અને #hl-orange[AGDLP] બેસ્ટ પ્રેક્ટિસ (The #hl-orange[AGDLP] Standard)
માઇક્રોસોફ્ટ એન્ટરપ્રાઇઝમાં રોલ્સ અને પરમિશન્સ મેનેજ કરવા માટે #hl-yellow[AGDLP મોડેલ] નો ઉપયોગ કરવાની ભલામણ કરે છે:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[AGDLP ફોર્મ્યુલા (MNC ઇન્ટરવ્યુમાં 100% પૂછાતો મુખ્ય સિદ્ધાંત):]\
    - #text(weight: "bold", fill: rtech-blue)[A (Accounts):] યુઝર એકાઉન્ટ્સ (દા.ત. `rpatel`, `ajain`).
    - #text(weight: "bold", fill: rtech-blue)[G (Global Groups):] યુઝર્સને તેમના વિભાગ કે જોબ રોલ અનુસાર ગ્લોબલ ગ્રુપમાં ઉમેરો (દા.ત. `GG_HR_Staff`).
    - #text(weight: "bold", fill: rtech-amber)[DL (Domain Local Groups):] રિસોર્સની જરૂરિયાત મુજબ ડોમેન લોકલ ગ્રુપ બનાવો અને ગ્લોબલ ગ્રુપને તેમાં નેસ્ટ કરો (દા.ત. `DL_HR_Payroll_Read`).
    - #text(weight: "bold", fill: rtech-emerald)[P (Permissions):] રિસોર્સ (Shared Folder) પર માત્ર Domain Local ગ્રુપને જ NTFS/Share પરમિશન્સ ફાળવો!
  ]
)

#v(6pt)

=== 5.7 PowerShell દ્વારા બલ્ક યુઝર ક્રિએશન (Automated Bulk User Onboarding)
જ્યારે 200 નવા કર્મચારીઓ એક સાથે કંપનીમાં જોડાય છે, ત્યારે ADUC કન્સોલમાં એક પછી એક યુઝર બનાવવું અશક્ય બની જાય છે. એન્ટરપ્રાઇઝ એડમિનિસ્ટ્રેટર્સ PowerShell નો ઉપયોગ કરે છે:

```powershell
# Single User Provisioning:
New-ADUser -Name "Rahul Patel" -GivenName "Rahul" -Surname "Patel" `
  -SamAccountName "rpatel" -UserPrincipalName "rpatel@corp.rtechlab.local" `
  -Path "OU=HR,OU=Corporate-Departments,OU=RTechLab-Enterprise,DC=corp,DC=rtechlab,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Welcome@2025#" -AsPlainText -Force) `
  -Enabled $true -ChangePasswordAtLogon $true

# Bulk Provisioning 500 Users from a CSV File:
Import-Csv -Path "C:\HR_New_Employees.csv" | ForEach-Object {
    New-ADUser -Name "$($_.FirstName) $($_.LastName)" -SamAccountName $_.Username `
      -Path $_.OUPath -AccountPassword (ConvertTo-SecureString $_.DefaultPassword -AsPlainText -Force) `
      -Enabled $true -ChangePasswordAtLogon $true
}
```

#v(8pt)

// =============================================================================
// CHAPTER 05 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં એક ગુપ્ત સુરક્ષા પ્રક્રિયા હોય છે જેને #hl-yellow[AdminSDHolder] અને #hl-yellow[SDProp (Security Descriptor Propagator)] કહેવામાં આવે છે. દર 60 મિનિટે PDC Emulator ડોમેનના તમામ પ્રિવિલેજ્ડ ગ્રુપ્સ (Domain Admins, Enterprise Admins, Schema Admins) ના સભ્યોની સુરક્ષા પરમિશન્સને રીસેટ કરી દે છે અને ઇનહેરિટન્સ બ્લોક કરી દે છે જેથી કોઈ જુનિયર એડમિનિસ્ટ્રેટર ભૂલથી પણ મુખ્ય એડમિન એકાઉન્ટ્સના અધિકારો બદલી ન શકે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 05 પ્રેક્ટિસ બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "#hl-yellow[Active Directory Users and Computers] ગ્રાફિકલ કન્સોલને સીધું ખોલવા માટેનો સત્તાવાર રન કમાન્ડ કયો છે?",
  optA: "gpmc.msc",
  optB: "dsa.msc",
  optC: "dnsmgmt.msc",
  optD: "compmgmt.msc",
  ans: "B",
  exp: "dsa.msc (Directory Services Administration) ADUC કન્સોલનો સત્તાવાર માઇક્રોસોફ્ટ શોર્ટકટ કમાન્ડ છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "માઇક્રોસોફ્ટ અનુસાર ડિફોલ્ટ 'Users' અને 'Computers' કન્ટેનર્સ પર ગ્રુપ પોલિસી (GPO) સીધી લાગુ ન થવાનું મુખ્ય કારણ શું છે?",
  optA: "તે પાસવર્ડથી પ્રોટેક્ટેડ હોય છે",
  optB: "તે સામાન્ય જેનેરિક કન્ટેનર છે, ઓર્ગેનાઇઝેશનલ યુનિટ (OU) નથી",
  optC: "તેમાં કોઈ લાયસન્સ હોતું નથી",
  optD: "તે માત્ર રીડ-ઓન્લી હોય છે",
  ans: "B",
  exp: "ગ્રુપ પોલિસી માત્ર સાઇટ્સ, ડોમેન અને ઓર્ગેનાઇઝેશનલ યુનિટ્સ (OUs) પર જ સીધી લિંક કરી શકાય છે, જેનેરિક કન્ટેનર્સ પર નહીં."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "માઇક્રોસોફ્ટના ભલામણ કરેલ #hl-orange[AGDLP] એક્સેસ કંટ્રોલ મોડેલમાં 'DL' અક્ષરનો અર્થ શું છે?",
  optA: "Distribution List",
  optB: "Domain Local Group",
  optC: "Dynamic Link",
  optD: "Data Lock",
  ans: "B",
  exp: "#hl-orange[AGDLP] નું સંપૂર્ણ સ્વરૂપ છે: Accounts -> Global Groups -> Domain Local Groups -> Permissions."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "નવો યુઝર બનાવતી વખતે 'User must change password at next logon' ચેક રાખવાનો મુખ્ય ફાયદો શું છે?",
  optA: "એડમિનિસ્ટ્રેટરને યુઝરનો કાયમી પાસવર્ડ ક્યારેય ખબર પડતી નથી અને નોન-રિપ્યુડિએશન જળવાઈ રહે છે",
  optB: "પાસવર્ડની જટિલતા સમાપ્ત થઈ જાય છે",
  optC: "યુઝર એકાઉન્ટ ક્યારેય લોકઆઉટ થતું નથી",
  optD: "યુઝર આપોઆપ ડોમેન એડમિન બની જાય છે",
  ans: "A",
  exp: "આ સુરક્ષા નીતિ સુનિશ્ચિત કરે છે કે કર્મચારી પોતે જ પોતાના એકાઉન્ટ ક્રેડેન્શિયલ્સનો એકમાત્ર કસ્ટોડિયન રહે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "PowerShell માં #hl-yellow[એક્ટિવ ડિરેક્ટરી] હેઠળ નવું યુઝર એકાઉન્ટ બનાવવા માટે કયા સત્તાવાર Cmdlet નો ઉપયોગ થાય છે?",
  optA: "Add-User",
  optB: "Create-ADAccount",
  optC: "New-ADUser",
  optD: "Set-DomainUser",
  ans: "C",
  exp: "New-ADUser #hl-yellow[એક્ટિવ ડિરેક્ટરી] મોડ્યુલનો સ્ટાન્ડર્ડ સત્તાવાર Cmdlet છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'Security Groups અને Distribution Groups વચ્ચે ટેકનિકલ તફાવત શું છે, અને શું આપણે Distribution Group ને શેર ફોલ્ડર પર પરમિશન આપી શકીએ?'",
  a: "જવાબ: ના, Distribution Group ને ક્યારેય શેર અથવા NTFS પરમિશન આપી શકાતી નથી કારણ કે તેમની પાસે સુરક્ષા સંદર્ભ (SID - Security Identifier) હોતો નથી; તે માત્ર Exchange/Outlook મેઇલિંગ લિસ્ટ માટે વપરાય છે. માત્ર Security Groups પાસે જ સિક્યુરિટી SID હોય છે અને તેમને રિસોર્સિસ પર ACLs (Access Control Lists) માં પરવાનગીઓ આપી શકાય છે.",
  tip: "TCS અને Cognizant ના L1/L2 સપોર્ટ ઇન્ટરવ્યુમાં આ પ્રશ્ન વારંવાર પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'AGDLP નેસ્ટિંગ મોડેલ શા માટે ઉપયોગમાં લેવાય છે? શું આપણે યુઝર્સને સીધા ફોલ્ડર પર પરમિશન ન આપી શકીએ?'",
  a: "જવાબ: યુઝર્સને સીધા ફોલ્ડર પર પરમિશન આપવી (Discretionary Access Control) એન્ટરપ્રાઇઝમાં વહીવટી અરાજકતા (Administrative Nightmare) પેદા કરે છે. જ્યારે કર્મચારી નોકરી બદલે કે વિભાગ બદલે ત્યારે તેની વ્યક્તિગત પરમિશન્સ ટ્રેક કરવી અશક્ય બને છે. AGDLP માં પરમિશન્સ માત્ર Domain Local ગ્રુપને અપાય છે. ફેરફાર થાય ત્યારે માત્ર કર્મચારીને Global ગ્રુપમાંથી કાઢવો કે ઉમેરવો પડે છે, ફોલ્ડરની ACLs ને સ્પર્શ કરવો પડતો નથી.",
  tip: "આ ઉત્તર તમારી એન્ટરપ્રાઇઝ સિસ્ટમ આર્કિટેક્ચરની ઊંડી સમજને દર્શાવે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'એક યુઝરનું એકાઉન્ટ લોક થઈ ગયું છે. ADUC ખોલ્યા વગર કમાન્ડ-લાઇન અથવા PowerShell થી તેને 2 સેકન્ડમાં કેવી રીતે અનલોક કરશો?'",
  a: "જવાબ: PowerShell માં માત્ર એક કમાન્ડ ચલાવીશું: 'Unlock-ADAccount -Identity rpatel'. આ કમાન્ડ PDC Emulator પર એકાઉન્ટને ગ્રાફિકલ ઓવરહેડ વિના તાત્કાલિક અનલોક કરી દે છે.",
  tip: "PowerShell ઓટોમેશનનું વ્યવહારુ જ્ઞાન તમને અન્ય ઉમેદવારો કરતાં તરત અલગ તારવે છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'OU પર 'Protect container from accidental deletion' ચેકબોક્સ આંતરિક રીતે કેવી રીતે કાર્ય કરે છે?'",
  a: "જવાબ: જ્યારે આ ચેકબોક્સ ટીક હોય છે, ત્યારે એક્ટિવ ડિરેક્ટરી તે OU ની Access Control List (ACL) માં 'Everyone' અને 'Domain Admins' માટે 'Deny Delete' અને 'Deny Delete Subtree' ની પરમિશન એન્ટ્રી ઉમેરી દે છે. જો કોઈ એડમિન તેને ડિલીટ કરવાનો પ્રયાસ કરશે તો 'Access Denied' એરર આવશે. તેને ડિલીટ કરવા માટે પહેલા View -> Advanced Features માં જઈને Object ટેબ પરથી આ પ્રોટેક્શન હટાવવું પડે છે.",
  tip: "ડિરેક્ટરી સુરક્ષાની ઊંડાણપૂર્વકની સમજ L2 ઇન્ટરવ્યુમાં અત્યંત પ્રશંસનીય ગણાય છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'Fine-Grained Password Policies (FGPP) શું છે, અને તે ડિફોલ્ટ ડોમેન પોલિસી કરતાં કઈ રીતે અલગ છે?'",
  a: "જવાબ: જૂના વિન્ડોઝ સર્વરમાં સમગ્ર ડોમેનમાં માત્ર એક જ પાસવર્ડ પોલિસી (Default Domain Policy) લાગુ થઈ શકતી હતી. FGPP (Password Settings Objects - PSO) દ્વારા એડમિનિસ્ટ્રેટર એક જ ડોમેનના અલગ-અલગ OUs અથવા સિક્યુરિટી ગ્રુપ્સ માટે અલગ-અલગ પાસવર્ડ નીતિઓ બનાવી શકે છે (દા.ત. સામાન્ય સ્ટાફ માટે 8-અક્ષરનો પાસવર્ડ પરંતુ IT Admins માટે ફરજિયાત 16-અક્ષરનો જટિલ પાસવર્ડ અને 15-દિવસની એક્સપાયરી).",
  tip: "એન્ટરપ્રાઇઝ કમ્પ્લાયન્સ અને સિક્યુરિટી ઓડિટ્સ સાથે જોડાયેલો આ મહત્વપૂર્ણ પ્રશ્ન છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 05 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - OUs નો ઉપયોગ ઓબ્જેક્ટ્સનું તાર્કિક વર્ગીકરણ કરવા અને તેમના પર ગ્રુપ પોલિસી લાગુ કરવા માટે થાય છે.
      - રિસોર્સ પરમિશન્સ માટે હંમેશા AGDLP નેસ્ટિંગ મોડેલ અનુસરો; ક્યારેય યુઝરને સીધી પરમિશન્સ ન આપો.
      - PowerShell ના `New-ADUser` અને `Unlock-ADAccount` એન્ટરપ્રાઇઝ હેલ્પડેસ્ક કામગીરીની ઝડપ 10 ગણી વધારી દે છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 06: CLIENT DOMAIN JOIN & AUTHENTICATION WALKTHROUGH
// =============================================================================

[#metadata("ch6") <chapter-6>]

#chapter-header(
  chapter-num: "CHAPTER 06",
  category: "ભાગ 6 : એન્ડપોઇન્ટ એકીકરણ અને ઓથેન્ટિકેશન (Client Domain Join & Authentication)",
  title: "ક્લાયન્ટ મશીન (Windows 10/11) ને ડોમેન સાથે જોડવું (Domain Join Walkthrough)",
  subtitle: "ક્લાયન્ટ પૂર્વ-જરૂરિયાતો · ક્લાયન્ટ DNS IP મેપિંગ નિયમ · નેટવર્ક કનેક્ટિવિટી અને nslookup ટેસ્ટ · વર્કગ્રુપથી ડોમેન માઇગ્રેશન · ટોપ 5 એરર્સ અને ફિક્સ · પ્રથમ ડોમેન લોગિન"
)

=== 6.1 ક્લાયન્ટ વર્કસ્ટેશનની પૂર્વ-જરૂરિયાતો (Client Prerequisites)
#hl-yellow[ડોમેન કંટ્રોલર] અને યુઝર એકાઉન્ટ્સ તૈયાર થયા પછી, આગળનું પગલું કર્મચારીના લેપટોપ/ડેસ્કટોપને #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સાથે જોડવાનું છે જેથી તેના પર કેન્દ્રીય નીતિઓ અને સુરક્ષા લાગુ કરી શકાય.

#warning-box(title: "વિન્ડોઝ એડિશન પ્રતિબંધ (Windows Home Edition Trap)")[
  Microsoft Windows 10/11 #hl-orange[Home Edition ને ક્યારેય #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સાથે જોડી શકાતું નથી.] ડોમેન જોઈન કરવા માટે ક્લાયન્ટ મશીન પર #mark-green[Windows 10/11 Pro, Enterprise, અથવા Education] સંસ્કરણ હોવું ફરજિયાત છે.
]

#v(4pt)
*લેબમાં ક્લાયન્ટ મશીનનું સ્પેસિફિકેશન:*
- VM નામ: #hl-yellow[`CLT-WIN11-01`]
- ઓપરેટિંગ સિસ્ટમ: Windows 11 Pro 64-bit
- નેટવર્ક એડેપ્ટર: Internal Network (એ જ નેટવર્ક ફેબ્રિક જેના પર `SRV-2025-DC01` ચાલે છે)

#v(6pt)

=== 6.2 ક્લાયન્ટ પર DNS IP ને #hl-yellow[ડોમેન કંટ્રોલર] પર પોઇન્ટ કરવું (The #1 Golden Rule)
નવા વિદ્યાર્થીઓ અને જુનિયર આઇટી સપોર્ટ એન્જિનિયર્સ દ્વારા કરવામાં આવતી 99% ભૂલો અહીં થાય છે:

#mark-yellow[ક્લાયન્ટ મશીન જ્યાં સુધી તેના નેટવર્ક એડેપ્ટરના 'Preferred DNS Server' માં #hl-yellow[ડોમેન કંટ્રોલર]નો IP એડ્રેસ દાખલ ન કરે, ત્યાં સુધી તે #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેનને ક્યારેય શોધી શકશે નહીં!]

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/domain_join_flow.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 6.1: ક્લાયન્ટ મશીન ડોમેન જોઈન 5-ચરણીય જીવન ચક્ર — DNS મેપિંગ, ડિસ્કવરી, ઓથેન્ટિકેશન અને પ્રથમ લોગિન]
]

#v(4pt)

*ક્લાયન્ટ નેટવર્ક સેટિંગ્સ:*
1. ક્લાયન્ટ મશીન પર Run (`Win + R`) ખોલો અને ટાઇપ કરો: #hl-green[`ncpa.cpl`].
2. Ethernet એડેપ્ટર Properties -> #hl-yellow[Internet Protocol Version 4 (TCP/IPv4)] -> Properties માં જાઓ.
3. IP Address: #hl-green[`192.168.1.50`]
4. Subnet Mask: #hl-green[`255.255.255.0`]
5. Default Gateway: #hl-green[`192.168.1.1`]
6. #text(weight: "bold", fill: rtech-navy)[Preferred DNS Server:] #mark-orange[`192.168.1.10`] (આપણા DC સર્વરનો IP).

#v(6pt)

=== 6.3 નેટવર્ક કનેક્ટિવિટી અને DNS રિઝોલ્યુશન ટેસ્ટ (Pre-flight Checks)
ડોમેન જોઈન વિઝાર્ડ શરૂ કરતા પહેલા કમાન્ડ પ્રોમ્પ્ટમાં બે ઝડપી ટેસ્ટ કરવા ફરજિયાત છે:

1. #text(weight: "bold")[Ping કનેક્ટિવિટી ટેસ્ટ:]
```cmd
ping 192.168.1.10
```
જો Reply મળી રહ્યો હોય, તો ફિઝિકલ/વર્ચ્યુઅલ નેટવર્ક કનેક્શન 100% બરાબર છે.

2. #text(weight: "bold")[DNS અને SRV રેકોર્ડ રિઝોલ્યુશન ટેસ્ટ:]
```cmd
nslookup corp.rtechlab.local
```
જો જવાબોમાં Server: `SRV-2025-DC01.corp.rtechlab.local` અને Address: `192.168.1.10` દેખાય, તો તેનો અર્થ એ છે કે ક્લાયન્ટ હવે #hl-yellow[ડોમેન કંટ્રોલર]ને શોધવામાં સંપૂર્ણપણે સક્ષમ છે.

#v(6pt)

=== 6.4 વર્કગ્રુપમાંથી ડોમેનમાં માઇગ્રેશન વિઝાર્ડ (Full Join Walkthrough)
1. ક્લાયન્ટ મશીન પર Run (`Win + R`) ખોલો અને ટાઇપ કરો: #hl-green[`sysdm.cpl`] (System Properties).
2. 'Computer Name' ટેબ પર નીચે સ્થિત #hl-yellow['Change...'] બટન પર ક્લિક કરો.
3. Computer name માં લખો: #hl-yellow[`CLT-WIN11-01`].
4. 'Member of' વિભાગમાં 'Workgroup' માંથી બદલીને #mark-yellow[Domain] રેડિયો બટન પસંદ કરો.
5. ડોમેન નામ બોક્સમાં દાખલ કરો: #hl-green[`corp.rtechlab.local`] અને 'OK' દબાવો.
6. સ્ક્રીન પર ક્રેડેન્શિયલ પ્રોમ્પ્ટ (Windows Security) ખુલશે. ડોમેન એડમિનના ક્રેડેન્શિયલ્સ દાખલ કરો:
   - Username: #hl-yellow[`corp.rtechlab.local\Administrator`] (અથવા ફક્ત `Administrator`)
   - Password: #hl-green[`P@ssw0rd2025!`]
7. 5 થી 10 સેકન્ડમાં એક સુંદર પોપ-અપ સંદેશ આવશે:
   #align(center)[#box(fill: rgb("#DCFCE7"), stroke: 1pt + rgb("#86EFAC"), radius: 4pt, inset: 6pt)[
     #text(size: 9pt, weight: "black", fill: rgb("#166534"))[✓ Welcome to the corp.rtechlab.local domain.]
   ]]
8. 'OK' દબાવો -> 'You must restart your computer to apply these changes' -> #hl-green['Restart Now'] પર ક્લિક કરો.

#v(6pt)

=== 6.5 ડોમેન જોઈનિંગ વખતે આવતી ટોપ 5 એરર્સ અને તેમનું સચોટ નિવારણ
પ્રોડક્શન અને ઇન્ટરવ્યુ બંનેમાં ડોમેન જોઈનિંગ એરર્સ ખૂબ સામાન્ય છે:

1. #text(weight: "bold", fill: rtech-rose)[એરર 1: 'An Active Directory Domain Controller for the domain could not be contacted':]
   - *કારણ:* ક્લાયન્ટના DNS માં #hl-yellow[ડોમેન કંટ્રોલર]નો IP નથી (ક્લાયન્ટ સાર્વજનિક Google DNS 8.8.8.8 અથવા હોમ વાઇ-ફાઇ રાઉટરનો DNS વાપરી રહ્યો છે).
   - *નિવારણ:* `ncpa.cpl` માં જઈને Preferred DNS ને `192.168.1.10` પર સેટ કરો.
2. #text(weight: "bold", fill: rtech-rose)[એરર 2: 'The network path was not found (0x80070035)':]
   - *કારણ:* #hl-yellow[ડોમેન કંટ્રોલર] પર Windows Firewall દ્વારા SMB (#hl-green[Port 445]) અથવા RPC પોર્ટ્સ બ્લોક છે.
   - *નિવારણ:* DC પર 'File and Printer Sharing' ફાયરવોલ નિયમો સક્ષમ (Enable) કરો.
3. #text(weight: "bold", fill: rtech-rose)[એરર 3: 'There is a time and/or date difference between the client and server':]
   - *કારણ:* ક્લાયન્ટ અને DC ના સમય વચ્ચે 5 મિનિટ કરતાં વધુનો #hl-orange[Kerberos] ટાઇમ ડ્રિફ્ટ (Clock Skew) છે.
   - *નિવારણ:* ક્લાયન્ટની ઘડિયાળ અને ટાઇમ ઝોનને DC સાથે મેળવો અથવા `w32tm /resync` ચલાવો.
4. #text(weight: "bold", fill: rtech-rose)[એરર 4: 'Access is denied':]
   - *કારણ:* જોઈન કરતી વખતે દાખલ કરેલા ક્રેડેન્શિયલ્સ પાસે કમ્પ્યુટર જોડવાનો અધિકાર નથી.
   - *નિવારણ:* Domain Admins ક્રેડેન્શિયલ્સનો ઉપયોગ કરો અથવા લક્ષ્ય OU પર Join Permissions ડેલિગેટ કરો.
5. #text(weight: "bold", fill: rtech-rose)[એરર 5: 'The computer account already exists in the domain':]
   - *કારણ:* એ જ નામે જૂનું કમ્પ્યુટર એકાઉન્ટ ADUC માં પહેલાથી હાજર છે અને તેનો SID મેળ ખાતો નથી.
   - *નિવારણ:* ADUC માં જઈને જૂના કમ્પ્યુટર એકાઉન્ટને ડિલીટ અથવા રીસેટ કરો.

#v(6pt)

=== 6.6 સિસ્ટમ રીસ્ટાર્ટ અને ડોમેન યુઝર એકાઉન્ટથી પ્રથમ લોગિન
રીસ્ટાર્ટ થયા પછી ક્લાયન્ટની લોક સ્ક્રીન બદલાઈ જશે:

1. લોક સ્ક્રીન પર નીચે ડાબી બાજુએ #mark-yellow['Other user'] પર ક્લિક કરો.
2. નીચે લખેલું દેખાશે: *Sign in to: CORP*.
3. Username: #hl-green[`rpatel`] (જે યુઝર આપણે પ્રકરણ 05 માં બનાવ્યો હતો).
4. Password: #hl-green[`Welcome@2025#`].
5. સ્ક્રીન પર તરત સંદેશ આવશે: #text(weight: "bold", fill: rtech-blue)['The user\'s password must be changed before signing in'].
6. 'OK' પર ક્લિક કરો. કર્મચારી પોતાનો નવો વ્યક્તિગત સુરક્ષિત પાસવર્ડ દાખલ કરશે (દા.ત. #hl-green[`MySecurePass@2025`]).
7. વિન્ડોઝ નવી યુઝર પ્રોફાઇલ તૈયાર કરશે (`C:\Users\rpatel`) અને ડેસ્કટોપ ખુલી જશે!
8. ચકાસણી માટે કમાન્ડ પ્રોમ્પ્ટ ખોલો અને ટાઇપ કરો: #hl-green[`whoami`]. સ્ક્રીન પર જવાબ મળશે: #mark-green[`corp\rpatel`].

#v(8pt)

// =============================================================================
// CHAPTER 06 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  જ્યારે કોઈ કમ્પ્યુટર ડોમેન જોઈન કરે છે, ત્યારે કમ્પ્યુટરનું પોતાનું એક ગુપ્ત મશીન ખાતું (Machine Account - `CLT-WIN11-01$`) #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં બને છે. શું તમે જાણો છો કે કમ્પ્યુટર અને ડોમેન કંટ્રોલર વચ્ચેનો સિક્યોર્ડ ચેનલ પાસવર્ડ દર #hl-yellow[30 દિવસમાં બેકગ્રાઉન્ડમાં આપોઆપ બદલાય છે]? જો કોઈ કમ્પ્યુટર 90 દિવસથી વધુ સમય માટે નેટવર્કથી ડિસ્કનેક્ટ રહે, તો આ ટ્રસ્ટ રિલેશનશિપ તૂટી જાય છે (Trust Relationship Failed Error)!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 06 પ્રેક્ટિસ બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "વિન્ડોઝની કઈ આવૃત્તિને #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સાથે જોડવાની મંજૂરી હોતી નથી?",
  optA: "Windows 11 Enterprise",
  optB: "Windows 11 Pro",
  optC: "Windows 11 Home Edition",
  optD: "Windows 11 Education",
  ans: "C",
  exp: "Windows Home Edition માં કોર્પોરેટ ડોમેન જોઈનિંગ અને ગ્રુપ પોલિસીની સુવિધા માઇક્રોસોફ્ટ દ્વારા અક્ષમ રાખવામાં આવે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "ક્લાયન્ટ કમ્પ્યુટર પર ડોમેન જોઈન કરતી વખતે 'Domain Controller could not be contacted' એરર આવવાનું સૌથી મુખ્ય કારણ શું છે?",
  optA: "ક્લાયન્ટનું કીબોર્ડ ખરાબ હોવું",
  optB: "ક્લાયન્ટના Preferred DNS માં ડોમેન કંટ્રોલરનો IP ન હોવો",
  optC: "ક્લાયન્ટમાં 16 GB રેમ ન હોવી",
  optD: "ગૂગલ ક્રોમ ઇન્સ્ટોલ ન હોવું",
  ans: "B",
  exp: "ક્લાયન્ટ ડોમેન કંટ્રોલરના SRV રેકોર્ડ્સને માત્ર AD DNS સર્વર પર જ શોધી શકે છે; ખોટો DNS હોવા પર જોઈનિંગ નિષ્ફળ જાય છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "વિન્ડોઝમાં સિસ્ટમ પ્રોપર્ટીઝ (System Properties) વિન્ડો ખોલીને કમ્પ્યુટરને ડોમેન સાથે જોડવા માટેનો શોર્ટકટ રન કમાન્ડ કયો છે?",
  optA: "ncpa.cpl",
  optB: "sysdm.cpl",
  optC: "appwiz.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "sysdm.cpl (System Properties) કમ્પ્યુટર રીનેમ અને ડોમેન મેમ્બરશિપ વિન્ડો ખોલે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "ક્લાયન્ટ મશીન પર હાલમાં કયો ડોમેન યુઝર લોગ-ઇન છે તે તપાસવા માટે કયા કમાન્ડનો ઉપયોગ થાય છે?",
  optA: "getmac",
  optB: "whoami",
  optC: "hostname",
  optD: "netstat",
  ans: "B",
  exp: "whoami કમાન્ડ વર્તમાન લોગ-ઇન યુઝરનું ડોમેન અને યુઝરનેમ (દા.ત. corp\\rpatel) દર્શાવે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ક્લાયન્ટ કમ્પ્યુટર અને ડોમેન કંટ્રોલર વચ્ચે મશીન એકાઉન્ટનો સિક્રેટ પાસવર્ડ આપોઆપ કેટલા દિવસોમાં બદલાય છે?",
  optA: "7 દિવસ",
  optB: "30 દિવસ",
  optC: "90 દિવસ",
  optD: "365 દિવસ",
  ans: "B",
  exp: "નેટલોગઓન સર્વિસ ડિફોલ્ટ રૂપે પ્રત્યેક 30 દિવસમાં કમ્પ્યુટર એકાઉન્ટનો પાસવર્ડ આપોઆપ બદલે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીન પર એરર આવી રહ્યો છે: 'The trust relationship between this workstation and the primary domain failed.' તેને ફરીથી ડોમેન જોઈન કર્યા વિના કેવી રીતે સુધારશો?'",
  a: "જવાબ: આ એરર ત્યારે આવે છે જ્યારે કમ્પ્યુટરનો મશીન પાસવર્ડ AD માં રહેલા પાસવર્ડ સાથે મેળ ખાતો નથી (જેમ કે સ્નેપશોટ રીસ્ટોર કરવા પર અથવા 30 દિવસથી વધુ ઑફલાઇન રહેવા પર). તેને સુધારવા માટે લોકલ એડમિનથી લોગિન કરીને PowerShell માં ચલાવીશું: 'Reset-ComputerMachinePassword -Credential (Get-Credential)' અથવા 'Test-ComputerSecureChannel -Repair'. આનાથી રીબૂટ કર્યા વિના ટ્રસ્ટ સીધું રીસેટ થઈ જાય છે.",
  tip: "Wipro, Infosys અને HCL ના L2 Desktop Support ઇન્ટરવ્યુમાં આ સવાલ 100% પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'એક સામાન્ય ડોમેન યુઝર (Non-Admin) ડિફોલ્ટ રૂપે કેટલા કમ્પ્યુટર્સને ડોમેનમાં જોઈન કરાવી શકે છે?'",
  a: "જવાબ: #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં ડિફોલ્ટ રૂપે સામાન્ય 'Authenticated User' ને વધુમાં વધુ 10 કમ્પ્યુટર્સને ડોમેન સાથે જોડવાની (ms-DS-MachineAccountQuota) છૂટ હોય છે. જોકે પ્રોડક્શન સિક્યુરિટી માટે આપણે ADSI Edit માં જઈને આ ક્વોટાને 0 પર સેટ કરીએ છીએ અને માત્ર IT સપોર્ટ ટીમને જ ચોક્કસ OUs પર જોઈનિંગ રાઇટ્સ ડેલિગેટ કરીએ છીએ.",
  tip: "આ ઊંડો આર્કિટેક્ચરલ પ્રશ્ન ઇન્ટરવ્યુઅરને તરત પ્રભાવિત કરે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીન પર Cached Credentials શું હોય છે, અને તેનું સુરક્ષા જોખમ શું છે?'",
  a: "જવાબ: જ્યારે કોઈ કર્મચારી પોતાના લેપટોપને ઓફિસ નેટવર્ક (DC) ની બહાર લઈ જાય છે (Work from Home), ત્યારે પણ તે પોતાના ડોમેન પાસવર્ડથી લોગિન કરી શકે છે કારણ કે વિન્ડોઝ છેલ્લા 10 સફળ લોગિનના પાસવર્ડ હેશ સ્થાનિક રીતે 'Cached Logons' માં સાચવી રાખે છે. સુરક્ષા ઓડિટ્સમાં આપણે GPO દ્વારા આ કેશ્ડ લોગિન્સની સંખ્યાને નિયંત્રિત કરીએ છીએ.",
  tip: "સિક્યુરિટી ઓપરેશન્સ અને રિમોટ વર્કફોર્સ મેનેજમેન્ટનો આ મુખ્ય ઇન્ટરવ્યુ ટોપિક છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'Domain Join પ્રક્રિયા દરમિયાન નેટવર્ક પર કયા પ્રોટોકોલ અને પોર્ટ્સ વપરાય છે?'",
  a: "જવાબ: Domain Join દરમિયાન મુખ્ય પ્રોટોકોલ્સ કાર્ય કરે છે: 1. DNS (Port 53) DC ના SRV રેકોર્ડ્સ શોધવા માટે, 2. #hl-orange[Kerberos] (#hl-green[Port 88]) ક્રેડેન્શિયલ ઓથેન્ટિકેશન માટે, 3. LDAP (#hl-green[Port 389]) કમ્પ્યુટર ઓબ્જેક્ટ બનાવવા માટે, અને 4. SMB (#hl-green[Port 445]) તથા RPC (Port 135) ડિરેક્ટરી અને પોલિસી સંચાર માટે.",
  tip: "નેટવર્કિંગ અને સર્વર ઇન્ફ્રાસ્ટ્રક્ચરના ક્રોસ-ડોમેન જ્ઞાનને ચકાસતો આ ક્લાસિક પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીન પર 'Sign in to:' માં ડોમેનને બદલે લોકલ પીસીનું નામ કેવી રીતે લાવી શકાય?'",
  a: "જવાબ: જો આપણે ડોમેનને બદલે ક્લાયન્ટના લોકલ કમ્પ્યુટર એકાઉન્ટથી લોગિન કરવું હોય, તો યુઝરનેમમાં '.\\Administrator' અથવા 'CLT-WIN11-01\\Administrator' ટાઇપ કરીએ છીએ. '.\\' (ડોટ-બેકસ્લેશ) ટાઇપ કરતાં જ સિસ્ટમ આપોઆપ સ્થાનિક મશીનના SAM ડેટાબેઝ પર સ્વિચ થઈ જાય છે.",
  tip: "હેલ્પડેસ્ક અને ડેસ્કટોપ સપોર્ટના ટેકનિકલ ટેસ્ટમાં આ મૂળભૂત યુક્તિ હંમેશા પૂછાય છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 06 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - ક્લાયન્ટનું Preferred DNS સર્વર હંમેશા ડોમેન કંટ્રોલરના IP પર પોઇન્ટ હોવું જોઈએ; તેના વિના ડોમેન ડિસ્કવરી અશક્ય છે.
      - ડોમેન જોઈન થતાં જ કમ્પ્યુટરનું પોતાનું મશીન ખાતું (`CLT-WIN11-01$`) બને છે અને ટ્રસ્ટ ચેનલ 30 દિવસમાં રીન્યૂ થાય છે.
      - `whoami` અને `Test-ComputerSecureChannel` ડોમેન ઓથેન્ટિકેશન ચકાસવાના પ્રાથમિક ટૂલ્સ છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 07: GROUP POLICY OBJECTS (GPO) & ENTERPRISE SECURITY DESKTOP CONTROL
// =============================================================================

[#metadata("ch7") <chapter-7>]

#chapter-header(
  chapter-num: "CHAPTER 07",
  category: "ભાગ 7 : એન્ટરપ્રાઇઝ સુરક્ષા અને ગ્રુપ પોલિસીઓ (Group Policy Engine)",
  title: "ગ્રુપ પોલિસી ઓબ્જેક્ટ્સ (GPO): એન્ટરપ્રાઇઝ સુરક્ષા અને ડેસ્કટોપ નિયંત્રણ",
  subtitle: "GPMC (gpmc.msc) · #hl-orange[LSDOU] પ્રોસેસિંગ ક્રમ · બ્લોક ઇનહેરિટન્સ અને એન્ફોર્સ્ડ · લેબ 1: પાસવર્ડ પોલિસી · લેબ 2: USB બ્લોક GPO · લેબ 3: વોલપેપર ડિપ્લોયમેન્ટ · gpupdate /force"
)

=== 7.1 ગ્રુપ પોલિસી શું છે? (What is Group Policy?)
જો કોઈ કંપનીમાં 2,000 કર્મચારીઓ હોય અને કંપનીની સુરક્ષા નીતિ કહે છે કે કોઈપણ કમ્પ્યુટર પર પેનડ્રાઇવ ન લાગવી જોઈએ, દરેકનું સ્ક્રીન સેવર 5 મિનિટમાં લોક થઈ જવું જોઈએ, અને કોઈ કંટ્રોલ પેનલ ન ખોલી શકે — તો શું સિસ્ટમ એડમિનિસ્ટ્રેટર દરેક કમ્પ્યુટર પર જઈને આ સેટિંગ્સ કરશે? ક્યારેય નહીં!

#mark-yellow[ગ્રુપ પોલિસી (Group Policy) માઇક્રોસોફ્ટનું એક અત્યંત શક્તિશાળી કેન્દ્રીય વ્યવસ્થાપન એન્જિન (Configuration Engine) છે જેના દ્વારા ડોમેન એડમિનિસ્ટ્રેટર હજારો કમ્પ્યુટર્સ અને યુઝર્સની ઓપરેટિંગ સિસ્ટમ, સુરક્ષા સેટિંગ્સ, ડેસ્કટોપ એન્વાયર્નમેન્ટ અને સોફ્ટવેર ડિપ્લોયમેન્ટને એક જ જગ્યાએથી આપમેળે નિયંત્રિત કરી શકે છે.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "GPC (Group Policy Container)")[
      GPC #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડેટાબેઝ (`ntds.dit`) ની અંદર સંગ્રહિત થાય છે. તે GPO ના ગુણધર્મો (Attributes), વર્ઝન નંબર, સ્ટેટસ અને 128-બીટ GUID (Globally Unique Identifier) ધરાવે છે.
    ]
  ],
  [
    #info-box(title: "GPT (Group Policy Template)")[
      GPT ફાઇલ સિસ્ટમ (`C:\Windows\SYSVOL\sysvol\domain\Policies\{GUID}\`) માં સંગ્રહિત થાય છે. તેમાં વાસ્તવિક રજિસ્ટ્રી સેટિંગ્સ, સુરક્ષા નીતિઓ, સોફ્ટવેર ઇન્સ્ટોલેશન સૂચનાઓ અને સ્ક્રિપ્ટ ફાઇલો હોય છે.
    ]
  ]
)

#v(4pt)

=== 7.2 #hl-yellow[Group Policy Management Console] (`gpmc.msc`)
ગ્રુપ પોલિસીનું સંચાલન કરવા માટેનું પ્રાથમિક ટૂલ #hl-yellow[GPMC (#hl-yellow[Group Policy Management Console])] છે.
- તેને ખોલવા માટેનો રન કમાન્ડ છે: #mark-green[`gpmc.msc`].

કન્સોલ ખોલતાં જ ડોમેન હેઠળ બે ડિફોલ્ટ GPOs પહેલેથી બનેલા મળે છે:
1. #text(weight: "bold", fill: rtech-navy)[Default Domain Policy:] આ સમગ્ર ડોમેન સ્તરે લિંક થયેલી હોય છે. તેનું પ્રાથમિક કાર્ય સમગ્ર ડોમેન માટે પાસવર્ડ જટિલતા, લઘુત્તમ લંબાઈ, એકાઉન્ટ લોકઆઉટ અને #hl-orange[Kerberos] ટિકિટ નીતિઓ નક્કી કરવાનું છે.
2. #text(weight: "bold", fill: rtech-navy)[Default Domain Controllers Policy:] આ માત્ર 'Domain Controllers' OU પર લિંક થયેલી હોય છે અને #hl-yellow[ડોમેન કંટ્રોલર]્સના સુરક્ષા અધિકારો (User Rights Assignment) તથા ઓડિટિંગનું સંચાલન કરે છે.

#v(6pt)

=== 7.3 GPO પ્રોસેસિંગનો #hl-orange[LSDOU] ક્રમ અને ઇનહેરિટન્સ (Order of Processing)
જ્યારે કોઈ ક્લાયન્ટ કમ્પ્યુટર બૂટ થાય છે અથવા યુઝર લોગિન કરે છે, ત્યારે વિન્ડોઝ એક ચોક્કસ ક્રમમાં ગ્રુપ પોલિસીઓ પ્રોસેસ કરે છે. તેને #hl-yellow[LSDOU] નિયમ કહેવામાં આવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/gpo_inheritance_lsdou.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 7.1: GPO પ્રોસેસિંગનો #hl-orange[LSDOU] વંશવેલો — Local, Site, Domain, અને Organizational Unit (The Golden Rule)]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[LSDOU પ્રોસેસિંગ ક્રમ (The 'Last Write Wins' Rule):]\
    - #text(weight: "bold", fill: rtech-blue)[1. L (Local Policy):] ક્લાયન્ટ મશીનની સ્થાનિક નીતિ સૌથી પહેલા પ્રોસેસ થાય છે (સૌથી ઓછી પ્રાથમિકતા).
    - #text(weight: "bold", fill: rtech-blue)[2. S (Site Policy):] #hl-yellow[એક્ટિવ ડિરેક્ટરી] સાઇટ પર લિંક GPO બીજા નંબરે લાગુ થાય છે.
    - #text(weight: "bold", fill: rtech-amber)[3. D (Domain Policy):] ડોમેન સ્તરે લિંક GPO ત્રીજા ક્રમે પ્રોસેસ થાય છે અને સાઇટ તથા લોકલને ઓવરરાઇડ કરે છે.
    - #text(weight: "bold", fill: rtech-emerald)[4. OU (Organizational Unit):] OU પર લિંક GPO સૌથી છેલ્લે પ્રોસેસ થાય છે. *તેથી 'Last Write Wins' નિયમ અનુસાર OU ની સેટિંગ્સ સૌથી શક્તિશાળી ગણાય છે અને તે ડોમેન સેટિંગ્સને પણ ઓવરરાઇડ કરી દે છે!*
  ]
)

#v(6pt)

=== 7.4 બ્લોક ઇનહેરિટન્સ (Block Inheritance) અને એન્ફોર્સ્ડ (Enforced) નીતિઓ
- #text(weight: "bold", fill: rtech-amber)[Block Inheritance (બ્લોક ઇનહેરિટન્સ):] જો કોઈ OU (દા.ત. `Special-Projects`) પર રાઇટ-ક્લિક કરીને 'Block Inheritance' સેટ કરવામાં આવે, તો ઉપરના ડોમેન અને સાઇટ સ્તરેથી વારસામાં આવતી તમામ પોલિસીઓ તે OU પર અટકી જાય છે (વાદળી ચિહ્ન).
- #text(weight: "bold", fill: rtech-rose)[Enforced (એન્ફોર્સ્ડ):] જો કંપનીના CISO કે મેનેજમેન્ટ ઈચ્છે કે કોઈપણ બ્રાન્ચ કે OU હેડ કોઈ મહત્વપૂર્ણ સુરક્ષા નીતિ (જેમ કે એન્ટિવાયરસ કે પાસવર્ડ પોલિસી) ને બ્લોક ન કરી શકે, તો ડોમેન GPO પર #hl-orange[Enforced (Lock Symbol)] લગાવી દેવામાં આવે છે. #mark-orange[Enforced GPO ને કોઈપણ Block Inheritance રોકી શકતું નથી; તે દરેક પરિસ્થિતિમાં ફરજિયાત લાગુ પડે છે!]

#v(6pt)

=== 7.5 પ્રેક્ટિકલ લેબ 1: કોર્પોરેટ પાસવર્ડ અને લોકઆઉટ સુરક્ષા નીતિ કન્ફિગરેશન
1. `gpmc.msc` ખોલો. તમારા ડોમેન `corp.rtechlab.local` હેઠળ #hl-yellow[Default Domain Policy] પર રાઇટ-ક્લિક કરો -> #hl-green[Edit] પસંદ કરો.
2. Group Policy Management Editor માં જાઓ:
   `Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`.
3. સુરક્ષા પેરામીટર્સ કન્ફિગર કરો:
   - #text(weight: "bold")[Minimum password length:] #hl-green[10 characters]
   - #text(weight: "bold")[Password must meet complexity requirements:] #hl-green[Enabled]
   - #text(weight: "bold")[Maximum password age:] #hl-green[60 days]
   - #text(weight: "bold")[Enforce password history:] #hl-green[5 passwords remembered]
4. Account Lockout Policy માં જાઓ:
   - #text(weight: "bold")[Account lockout threshold:] #hl-orange[5 invalid logon attempts]
   - #text(weight: "bold")[Account lockout duration:] #hl-green[30 minutes]

#v(6pt)

=== 7.6 પ્રેક્ટિકલ લેબ 2: USB રીમુવેબલ સ્ટોરેજ બ્લોક GPO (Data Leak Prevention)
બેંકો અને કોર્પોરેટ્સમાં ડેટા ચોરી અટકાવવા માટે પેનડ્રાઇવ બ્લોક કરવી ફરજિયાત હોય છે:

1. GPMC માં જાઓ -> #hl-yellow[Group Policy Objects] કન્ટેનર પર રાઇટ-ક્લિક -> #hl-green[New] પસંદ કરો.
2. GPO નું નામ આપો: #hl-yellow[`GPO_Block_USB_Storage`].
3. આ GPO પર રાઇટ-ક્લિક કરીને #hl-green[Edit] પસંદ કરો.
4. નેવિગેટ કરો:
   `Computer Configuration -> Policies -> Administrative Templates -> System -> Removable Storage Access`.
5. જમણી બાજુએ શોધો: #mark-yellow[All Removable Storage classes: Deny all access].
6. આ સેટિંગ પર ડબલ-ક્લિક કરો -> #hl-green[Enabled] રેડિયો બટન પસંદ કરો -> 'OK' કરો.
7. હવે GPMC માં પાછા આવીને આ GPO ને તમારા વર્કસ્ટેશન OU (`RTechLab-Enterprise -> Workstations`) પર ડ્રેગ એન્ડ ડ્રોપ (Link) કરી દો!

#v(6pt)

=== 7.7 પ્રેક્ટિકલ લેબ 3: સેન્ટ્રલાઇઝ્ડ કોર્પોરેટ ડેસ્કટોપ વોલપેપર ડિપ્લોયમેન્ટ GPO
કંપનીના તમામ કર્મચારીઓના ડેસ્કટોપ પર RTechLab નો સત્તાવાર વોલપેપર આપોઆપ સેટ કરવો:

1. વોલપેપર ઇમેજને સર્વરના શેર્ડ ફોલ્ડરમાં મૂકો (દા.ત. `\\SRV-2025-DC01\Wallpaper\corp-bg.jpg`) જેથી તમામ ક્લાયન્ટ્સ તેને વાંચી શકે.
2. GPMC માં નવી GPO બનાવો: #hl-yellow[`GPO_Corporate_Wallpaper`].
3. Edit કરો અને જાઓ:
   `User Configuration -> Policies -> Administrative Templates -> Desktop -> Desktop -> Desktop Wallpaper`.
4. તેને #hl-green[Enabled] કરો. Wallpaper Name માં UNC પાથ દાખલ કરો: #hl-green[`\\SRV-2025-DC01\Wallpaper\corp-bg.jpg`] અને Style માં #hl-yellow['Fill'] પસંદ કરો.
5. આ GPO ને `Corporate-Departments` OU પર લિંક કરો.

#v(6pt)

=== 7.8 ક્લાયન્ટ-સાઇડ GPO રીફ્રેશ અને ટ્રબલશૂટિંગ (`gpupdate /force` & `gpresult`)
ડિફોલ્ટ રૂપે ક્લાયન્ટ કમ્પ્યુટર્સ બેકગ્રાઉન્ડમાં દર #hl-yellow[90 મિનિટે (±30 મિનિટ રેન્ડમ ઓફસેટ સાથે)] ગ્રુપ પોલિસી રીફ્રેશ કરે છે. #hl-yellow[ડોમેન કંટ્રોલર]્સ દર #hl-yellow[5 મિનિટે] રીફ્રેશ થાય છે.

*તાત્કાલિક પોલિસી લાગુ કરવા અને તપાસવા માટેના 3 માસ્ટર કમાન્ડ્સ:*
1. #text(weight: "bold")[તાત્કાલિક પોલિસી લાગુ કરવી:]
```cmd
gpupdate /force
```
આ કમાન્ડ રીફ્રેશ ઇન્ટરવલની રાહ જોયા વિના તમામ યુઝર અને કમ્પ્યુટર પોલિસીઓને તાત્કાલિક ડાઉનલોડ અને એપ્લાય કરે છે.

2. #text(weight: "bold")[પોલિસી એપ્લિકેશનનો કન્સોલ સારાંશ જોવો:]
```cmd
gpresult /r
```
આ સ્ક્રીન પર દર્શાવે છે કે યુઝર અને કમ્પ્યુટર પર કઈ-કઈ GPOs સફળતાપૂર્વક લાગુ થઈ ('Applied Group Policy Objects') અને કઈ નકારી કાઢવામાં આવી.

3. #text(weight: "bold")[વિગતવાર HTML ડાયગ્નોસ્ટિક રિપોર્ટ બનાવવો:]
```cmd
gpresult /h C:\GPO_Report.html
```
આ એક સુંદર ઇન્ટરેક્ટિવ ગ્રાફિકલ HTML રિપોર્ટ બનાવે છે જેને કોઈપણ વેબ બ્રાઉઝરમાં ખોલીને જોઈ શકાય છે.

#v(8pt)

// =============================================================================
// CHAPTER 07 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  ગ્રુપ પોલિસીમાં #hl-yellow[WMI Filters (Windows Management Instrumentation)] નો ઉપયોગ કરીને તમે કોઈપણ GPO ને માત્ર ચોક્કસ હાર્ડવેર કે OS વર્ઝન પર જ લાગુ કરી શકો છો. ઉદાહરણ તરીકે, તમે WMI ક્વેરી લખી શકો: `SELECT * FROM Win32_OperatingSystem WHERE Version LIKE "10.0.26%" AND ProductType = "1"` — અને તે GPO માત્ર Windows 11 24H2 ધરાવતાં મશીનો પર જ લાગુ થશે, બાકી કોઈ સિસ્ટમ પર નહીં!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 07 પ્રેક્ટિસ બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "માઇક્રોસોફ્ટ અનુસાર ગ્રુપ પોલિસી પ્રોસેસિંગનો સાચો પ્રમાણભૂત ક્રમ (Order of Precedence) કયો છે?",
  optA: "OU -> Domain -> Site -> Local",
  optB: "Local -> Site -> Domain -> OU (#hl-orange[LSDOU])",
  optC: "Site -> Domain -> Local -> OU",
  optD: "Domain -> OU -> Local -> Site",
  ans: "B",
  exp: "GPO પ્રોસેસિંગનો સ્ટાન્ડર્ડ ક્રમ #hl-orange[LSDOU] (Local, Site, Domain, OU) છે; છેલ્લે લાગુ થતી નીતિ અગાઉની પોલિસીને ઓવરરાઇડ કરે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "જો કોઈ ચાઇલ્ડ OU પર 'Block Inheritance' લગાવવામાં આવ્યું હોય, પરંતુ ડોમેન સ્તરની GPO પર 'Enforced' સેટ હોય, તો શું પરિણામ આવશે?",
  optA: "GPO એરર આપીને ક્રેશ થઈ જશે",
  optB: "Enforced GPO બ્લોક ઇનહેરિટન્સને અવગણીને ફરજિયાતપણે લાગુ થશે",
  optC: "Block Inheritance હંમેશા Enforced ને રોકી દે છે",
  optD: "કમ્પ્યુટર બૂટ થવાનું બંધ થઈ જશે",
  ans: "B",
  exp: "Enforced સેટિંગનો હેતુ જ બ્લોક ઇનહેરિટન્સને નિષ્પ્રભાવી કરીને કોર્પોરેટ સુરક્ષા નીતિઓનું ફરજિયાત પાલન કરાવવાનો છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "ક્લાયન્ટ કમ્પ્યુટર પર બેકગ્રાઉન્ડ ટાઇમર્સની રાહ જોયા વિના તમામ ગ્રુપ પોલિસીઓને તાત્કાલિક રીફ્રેશ કરવા માટેનો કમાન્ડ કયો છે?",
  optA: "ipconfig /renew",
  optB: "gpupdate /force",
  optC: "net start gpo",
  optD: "dism /online /cleanup-image",
  ans: "B",
  exp: "gpupdate /force કમાન્ડ તરત જ #hl-yellow[ડોમેન કંટ્રોલર] સાથે સંપર્ક કરીને નવીનતમ પોલિસીઓ ડાઉનલોડ અને એપ્લાય કરે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "ક્લાયન્ટ કમ્પ્યુટર્સ પર ગ્રુપ પોલિસીનો ડિફોલ્ટ બેકગ્રાઉન્ડ રીફ્રેશ ઇન્ટરવલ કેટલો હોય છે?",
  optA: "પ્રત્યેક 10 મિનિટ",
  optB: "90 મિનિટ (0 થી 30 મિનિટના રેન્ડમ ઓફસેટ સાથે)",
  optC: "પ્રત્યેક 24 કલાક",
  optD: "માત્ર સિસ્ટમ રીસ્ટાર્ટ પર",
  ans: "B",
  exp: "ક્લાયન્ટ્સ 90 મિનિટ (સાથે 0-30 મિનિટનું રેન્ડમ જીટર જેથી DC પર એક સાથે ભાર ન આવે) માં રીફ્રેશ થાય છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ક્લાયન્ટ મશીન પર લાગુ થયેલી તમામ ગ્રુપ પોલિસીઓનો સંપૂર્ણ વિગતવાર વિઝ્યુઅલ HTML રિપોર્ટ જનરેટ કરવા માટેનો સાચો કમાન્ડ કયો છે?",
  optA: "gpresult /h report.html",
  optB: "gpmc.exe /export",
  optC: "show-gpo -all",
  optD: "netsh gpo dump",
  ans: "A",
  exp: "gpresult /h <filepath> એક ઇન્ટરેક્ટિવ ગ્રાફિકલ HTML રિપોર્ટ બનાવે છે જેને કોઈપણ બ્રાઉઝરમાં જોઈ શકાય છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'Computer Configuration અને User Configuration પોલિસીઓમાં શું તફાવત છે, અને તે ક્યારે લાગુ થાય છે?'",
  a: "જવાબ: Computer Configuration સેટિંગ્સ સમગ્ર સિસ્ટમ પર લાગુ થાય છે (જેમ કે ફાયરવોલ, બિટલોકર, USB બ્લોક) અને તે ત્યારે પ્રોસેસ થાય છે જ્યારે કમ્પ્યુટર 'બૂટ' થાય છે (લોગિન સ્ક્રીન પહેલાં). User Configuration સેટિંગ્સ ચોક્કસ યુઝરની પ્રોફાઇલ પર લાગુ થાય છે (જેમ કે ડેસ્કટોપ વોલપેપર, બ્રાઉઝર હોમપેજ, સ્ટાર્ટ મેનૂ) અને તે ત્યારે પ્રોસેસ થાય છે જ્યારે યુઝર 'લોગિન' કરે છે.",
  tip: "Capgemini, Wipro અને Infosys ના L1/L2 ઇન્ટરવ્યુમાં આ સવાલ 100% પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'GPO Slow Link Detection શું છે, અને તે રિમોટ વર્કર્સને કેવી રીતે પ્રભાવિત કરે છે?'",
  a: "જવાબ: જ્યારે કોઈ ક્લાયન્ટ VPN અથવા 500 Kbps કરતાં ધીમા WAN લિંકથી જોડાય છે, ત્યારે વિન્ડોઝ તેને 'Slow Link' જાહેર કરે છે. નેટવર્ક બેન્ડવિડ્થ બચાવવા માટે વિન્ડોઝ ભારે GPOs (જેમ કે સોફ્ટવેર ઇન્સ્ટોલેશન, ફોલ્ડર રીડાયરેક્શન અને મોટી ફાઇલો) નું પ્રોસેસિંગ આપોઆપ રોકી દે છે. માત્ર મુખ્ય વહીવટી અને સુરક્ષા નીતિઓ જ પ્રોસેસ થાય છે.",
  tip: "આ ઊંડો આર્કિટેક્ચરલ જવાબ તમારા વાસ્તવિક પ્રોડક્શન અનુભવને સાબિત કરે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'એક ચોક્કસ યુઝર પર GPO એપ્લાય નથી થઈ રહી. L2 સપોર્ટ રોલમાં તમે તેને કેવી રીતે ટ્રબલશૂટ કરશો?'",
  a: "જવાબ: ટ્રબલશૂટિંગના 4 ક્રમિક પગલાં: 1. ક્લાયન્ટ પર 'gpresult /r' ચલાવીને જોઈશું કે GPO લાગુ થઈ કે Denied યાદીમાં છે, 2. GPMC માં જઈને GPO ની 'Security Filtering' તપાસીશું કે યુઝર કે તેનું ગ્રુપ 'Read' અને 'Apply group policy' પરમિશન ધરાવે છે કે નહીં, 3. પેરેન્ટ OU પર 'Block Inheritance' તપાસીશું, અને 4. ક્લાયન્ટ પર 'w32tm /resync' તથા 'gpupdate /force' ચલાવીને Event Viewer માં GroupPolicy ઇવેન્ટ્સ (Event ID 1085/1129) તપાસીશું.",
  tip: "સિસ્ટમ સપોર્ટના વાસ્તવિક ટ્રબલશૂટિંગ સિનારિયોમાં આ જવાબ મહત્તમ ગુણ અપાવે છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'Loopback Processing Mode શું છે અને તેને કયા સંજોગોમાં સક્ષમ કરવામાં આવે છે?'",
  a: "જવાબ: સામાન્ય રીતે જ્યારે કોઈ યુઝર કમ્પ્યુટર પર લોગિન કરે છે, ત્યારે તે યુઝરના OU ની User Configuration લાગુ થાય છે. પરંતુ કિયોસ્ક, મીટિંગ રૂમ, અથવા ટર્મિનલ સર્વર્સ (Citrix / RDS) માં આપણે ઈચ્છીએ છીએ કે ભલે કોઈપણ યુઝર (CEO પણ) તે કમ્પ્યુટર પર લોગિન કરે, ડેસ્કટોપ સેટિંગ્સ હંમેશા તે 'કમ્પ્યુટર' ના OU મુજબ જ લાગુ થવી જોઈએ. આના માટે આપણે 'Loopback Processing Mode' (Replace અથવા Merge) સક્ષમ કરીએ છીએ.",
  tip: "RDS અને VDI ઇન્ફ્રાસ્ટ્રક્ચર ઇન્ટરવ્યુઝનો આ સૌથી પ્રિય પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'GPO માં 'Security Filtering' અને 'WMI Filtering' વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: Security Filtering યુઝર કે કમ્પ્યુટરના સિક્યુરિટી ગ્રુપ્સના આધારે નક્કી કરે છે કે GPO કોને મળશે (દા.ત. માત્ર 'GG_HR_Staff'). તેની સામે WMI Filtering હાર્ડવેર અથવા ઓએસના એટ્રિબ્યુટ્સ (જેમ કે માત્ર 'Windows 11', માત્ર 'Dell Laptops', અથવા 'RAM > 8GB') ના આધારે GPO નું ચોક્કસ ટાર્ગેટિંગ કરે છે.",
  tip: "એડવાન્સ્ડ GPO આર્કિટેક્ચર અને પોલિસી ટાર્ગેટિંગની નિપુણતા ચકાસવા આ પ્રશ્ન પૂછાય છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 07 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - ગ્રુપ પોલિસી (GPO) હજારો મશીનોની સુરક્ષા અને ડેસ્કટોપ નિયંત્રણનું કેન્દ્રીય એન્જિન છે (#hl-orange[LSDOU] ક્રમમાં પ્રોસેસ થાય છે).
      - Enforced GPO કોઈપણ Block Inheritance ને બાયપાસ કરીને ફરજિયાત સુરક્ષા સુનિશ્ચિત કરે છે.
      - `gpupdate /force` અને `gpresult /r` (અથવા `/h`) પ્રત્યેક સિસ્ટમ એડમિનિસ્ટ્રેટરના મુખ્ય દૈનિક GPO ટૂલ્સ છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 08: DHCP SERVER ROLE: SCOPES, RESERVATIONS & FAILOVER
// =============================================================================

[#metadata("ch8") <chapter-8>]

#chapter-header(
  chapter-num: "CHAPTER 08",
  category: "ભાગ 8 : સ્વચાલિત નેટવર્ક આઈપી એડ્રેસિંગ (Dynamic Host Configuration)",
  title: "DHCP સર્વર કન્ફિગરેશન: સ્કોપ, એક્સક્લુઝન, રિઝર્વેશન અને ફેઇલઓવર",
  subtitle: "DORA 4-સ્ટેપ પ્રક્રિયા · AD ઓથોરાઇઝેશન · IPv4 સ્કોપ · સબનેટ માસ્ક · લીઝ ડ્યુરેશન · એક્સક્લુઝન રેન્જ · MAC રિઝર્વેશન · 80/20 સ્પ્લિટ-સ્કોપ અને ફેઇલઓવર"
)

=== 8.1 DHCP શું છે? અને DORA 4-ચરણ પ્રક્રિયા
જ્યારે કોઈ નવું લેપટોપ કે સ્માર્ટફોન કંપનીના વાઇ-ફાઇ કે લૅન (LAN) કેબલ સાથે જોડાય છે, ત્યારે નેટવર્ક પર સંચાર કરવા માટે તેને એક અદ્વિતીય IP એડ્રેસ, સબનેટ માસ્ક, ડિફોલ્ટ ગેટવે અને DNS સર્વરની જરૂર પડે છે.

#mark-yellow[ડાયનેમિક હોસ્ટ કન્ફિગરેશન પ્રોટોકોલ (DHCP) એક ક્લાયન્ટ-સર્વર નેટવર્કિંગ પ્રોટોકોલ છે જે નેટવર્ક સાથે જોડાતા પ્રત્યેક ક્લાયન્ટ કમ્પ્યુટરને આપમેળે IP એડ્રેસ અને નેટવર્ક પેરામીટર્સ ચોક્કસ સમયગાળા (Lease) માટે ફાળવે છે.]

ક્લાયન્ટ અને DHCP સર્વર વચ્ચે IP ફાળવણીની પ્રક્રિયાને #hl-yellow[DORA પ્રક્રિયા] કહેવામાં આવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dhcp_dora_process.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 8.1: DHCP 4-ચરણીય DORA લાઇફસાયકલ — Discover, Offer, Request, અને Acknowledge (UDP Port 67/68)]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[DORA પ્રક્રિયાના 4 મુખ્ય પગલાં (MNC ઇન્ટરવ્યુમાં નિર્ણાયક સિદ્ધાંત):]\
    - #text(weight: "bold", fill: rtech-blue)[1. D (DHCPDISCOVER):] ક્લાયન્ટ પાસે હાલમાં કોઈ IP નથી. તે સોર્સ IP `0.0.0.0` અને ડેસ્ટિનેશન IP `255.255.255.255` (Broadcast) સાથે નેટવર્ક પર પૂછે છે: *\"શું આ નેટવર્ક પર કોઈ સક્રિય DHCP સર્વર ઉપલબ્ધ છે?\"* #hl-green[UDP પોર્ટ: 67].
    - #text(weight: "bold", fill: rtech-emerald)[2. O (DHCPOFFER):] નેટવર્ક પર રહેલું DHCP સર્વર પોતાના ઉપલબ્ધ પૂલમાંથી એક ખાલી IP કાઢીને ક્લાયન્ટને ઓફર મોકલે છે: *\"મારી પાસે IP 192.168.1.100 ઉપલબ્ધ છે, શું તમે આ લીઝ પર લેવા માંગો છો?\"* #hl-green[UDP પોર્ટ: 68].
    - #text(weight: "bold", fill: rtech-amber)[3. R (DHCPREQUEST):] ક્લાયન્ટ તે ઓફર સ્વીકારે છે અને બ્રોડકાસ્ટ સંદેશ મોકલે છે: *\"હા, મને સર્વર 192.168.1.10 દ્વારા ઓફર કરેલ IP 192.168.1.100 મંજૂર છે!\"*
    - #text(weight: "bold", fill: rtech-blue)[4. A (DHCPACK):] DHCP સર્વર સ્વીકૃતિ (Acknowledgement) મોકલે છે, પોતાના ડેટાબેઝમાં આ IP ને લીઝ તરીકે બુક કરે છે, અને ગેટવે તથા DNS ની વિગતો સોંપે છે.
  ]
)

#v(6pt)

=== 8.2 DHCP સર્વર રોલ ઇન્સ્ટોલેશન અને #hl-yellow[એક્ટિવ ડિરેક્ટરી] ઓથોરાઇઝેશન
1. #hl-yellow[Server Manager] -> #hl-green[Manage -> Add Roles and Features] માં જાઓ.
2. Server Roles માં #mark-yellow[DHCP Server] ચેકબોક્સ પર ટીક કરો.
3. 'Add Features' (DHCP RSAT મેનેજમેન્ટ ટૂલ્સ) સામેલ કરીને 'Next' -> 'Next' -> 'Install' કરો.
4. ઇન્સ્ટોલેશન પૂર્ણ થતાં જ પીળા ફ્લેગ (Notification) પર ક્લિક કરો -> #hl-yellow['Complete DHCP Configuration'].
5. વિઝાર્ડમાં #text(weight: "bold", fill: rtech-navy)[Authorization] સ્ક્રીન આવશે. 'Commit' દબાવો જેથી આપણું #hl-yellow[ડોમેન કંટ્રોલર] આ DHCP સર્વરને #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં અધિકૃત (Authorize) કરે.

#warning-box(title: "Rogue DHCP Server Prevention (એન્ટરપ્રાઇઝ સુરક્ષા વ્યવસ્થા)")[
  જો કોઈ અનધિકૃત કર્મચારી કે યુઝર નેટવર્કમાં પોતાનું અંગત રાઉટર કે બિનઅધિકૃત DHCP સર્વર ચાલુ કરે (Rogue DHCP Server), તો વિન્ડોઝ #hl-yellow[ડોમેન કંટ્રોલર] તેને તરત ડિટેક્ટ કરી લે છે. #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં અનધિકૃત વિન્ડોઝ DHCP સર્વર્સની સર્વિસ આપોઆપ બંધ (Stop) થઈ જાય છે જેથી કર્મચારીઓને ખોટો IP કે ગેટવે ન મળે.
]

#v(6pt)

=== 8.3 નવો IPv4 સ્કોપ બનાવવો (Configuring an IPv4 Scope)
સ્કોપ (Scope) એ IP એડ્રેસિસની તે માન્ય શ્રેણી છે જે સર્વર સબનેટ પર રહેલા ક્લાયન્ટ્સને ફાળવે છે:

1. #hl-yellow[Server Manager] -> Tools -> #hl-yellow[DHCP] કન્સોલ ખોલો (અથવા રનમાં ટાઇપ કરો: #mark-green[`dhcpmgmt.msc`]).
2. સર્વર નોડ `SRV-2025-DC01` વિસ્તૃત કરો -> #text(weight: "bold")[IPv4] પર રાઇટ-ક્લિક કરો -> #hl-green[New Scope...] પસંદ કરો.
3. Scope Name: #hl-yellow[`RTechLab-LAN-Scope`].
4. #text(weight: "bold")[IP Address Range (આઇપી પૂલ):]
   - Start IP address: #hl-green[`192.168.1.100`]
   - End IP address: #hl-green[`192.168.1.200`]
   - Length: #hl-green[`24`], Subnet mask: #hl-green[`255.255.255.0`]
5. #text(weight: "bold")[Lease Duration (લીઝની અવધિ):] ડિફોલ્ટ રૂપે #hl-yellow[8 દિવસ] હોય છે. ઓફિસના વાયર્ડ ડેસ્કટોપ માટે 8 દિવસ આદર્શ છે, પરંતુ એરપોર્ટ કે કાફેના ગેસ્ટ વાઇ-ફાઇ માટે તેને 2 થી 4 કલાક રાખવામાં આવે છે.

#v(6pt)

=== 8.4 એક્સક્લુઝન રેન્જ અને આવશ્યક DHCP ઓપ્શન્સ
- #text(weight: "bold", fill: rtech-rose)[Add Exclusions and Delay (એક્સક્લુઝન રેન્જ):] જો આપણા પૂલમાંથી અમુક IP એડ્રેસ આપણે સામાન્ય ક્લાયન્ટ્સને ફાળવવા ન માંગતા હોઈએ (દા.ત. ટેસ્ટ લેબ કે સ્ટેટિક ડિવાઇસિસ માટે), તો તેમને બાકાત રાખવામાં આવે છે:
  - Start IP: `192.168.1.150` થી End IP: `192.168.1.160` નાખીને 'Add' કરો.
- #text(weight: "bold", fill: rtech-navy)[Configure DHCP Options:]
  - #text(weight: "bold", fill: rtech-blue)[Option 003 (Router / Default Gateway):] `192.168.1.1` દાખલ કરીને 'Add' કરો.
  - #text(weight: "bold", fill: rtech-emerald)[Option 006 (DNS Servers):] `192.168.1.10` (આપણું AD DNS સર્વર) પ્રાથમિકતામાં ઉમેરો.
  - #text(weight: "bold", fill: rtech-amber)[Option 015 (Domain Name):] `corp.rtechlab.local` દાખલ કરો.
6. 'Yes, I want to activate this scope now' પસંદ કરીને 'Finish' કરો!

#v(6pt)

=== 8.5 MAC એડ્રેસ રિઝર્વેશન (Reservations for Network Printers)
ઓફિસમાં નેટવર્ક પ્રિન્ટર્સ, સ્કેનર્સ અને સર્વેલન્સ કેમેરાનો IP ક્યારેય બદલાવો ન જોઈએ, અન્યથા કર્મચારીઓ પ્રિન્ટ આપી શકશે નહીં. તેના માટે આપણે MAC રિઝર્વેશનનો ઉપયોગ કરીએ છીએ:

1. DHCP કન્સોલમાં તમારા સક્રિય સ્કોપ હેઠળ #hl-yellow[Reservations] ફોલ્ડર પર રાઇટ-ક્લિક કરો -> #hl-green[New Reservation...].
2. Reservation name: #hl-yellow[`HP-Network-Printer-HR`].
3. IP address: #hl-green[`192.168.1.105`].
4. MAC address: પ્રિન્ટરનો 12-અંકનો હેક્સાડેસિમલ મેક એડ્રેસ દાખલ કરો (દા.ત. `00155D01A23B`).
5. Supported types: #hl-yellow['Both (DHCP and BOOTP)'] પસંદ કરીને 'Add' કરો.
હવે જ્યારે પણ આ પ્રિન્ટર નેટવર્ક પર ચાલુ થશે, DHCP સર્વર તેના મેક એડ્રેસને ઓળખીને હંમેશા આજ ફિક્સ IP `192.168.1.105` ફાળવશે!

#v(6pt)

=== 8.6 હાઇ અવેલેબિલિટી: DHCP 80/20 સ્પ્લિટ-સ્કોપ અને ક્લસ્ટર ફેઇલઓવર
જો એકમાત્ર DHCP સર્વર ક્રેશ થઈ જાય, તો લીઝ સમાપ્ત થતાં આખી ઓફિસનું ઇન્ટરનેટ અને નેટવર્ક ઠપ થઈ જશે. તેને રોકવાના બે મુખ્ય આર્કિટેક્ચરલ ઉપાયો છે:

1. #text(weight: "bold", fill: rtech-navy)[80/20 સ્પ્લિટ-સ્કોપ નિયમ (Legacy Standard):] પ્રાથમિક DC પર 80% IP પૂલ રાખવામાં આવે છે અને સેકન્ડરી DC પર એ જ સબનેટનો 20% પૂલ રાખવામાં આવે છે જેથી પ્રાઇમરી ડાઉન થવા પર પણ 20% સિસ્ટમ્સ ચાલુ રહે.
2. #text(weight: "bold", fill: rtech-emerald)[આધુનિક DHCP Failover (Windows Server 2025):]
   - IPv4 સ્કોપ પર રાઇટ-ક્લિક કરો -> #hl-green[Configure Failover...].
   - પાર્ટનર સર્વર (`SRV-2025-DC02`) પસંદ કરો.
   - મોડ પસંદ કરો:
     - #text(weight: "bold")[Load Balance Mode:] બંને સર્વર્સ 50%-50% ટ્રાફિક સક્રિય રીતે વહેંચે છે.
     - #text(weight: "bold")[Hot Standby Mode:] એક્ટિવ સર્વર 100% ટ્રાફિક સંભાળે છે, અને તે ડાઉન થતાં જ સ્ટેન્ડબાય સર્વર તાત્કાલિક લીઝ આપવાનું શરૂ કરે છે.

#v(8pt)

// =============================================================================
// CHAPTER 08 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  DHCP બ્રોડકાસ્ટ ટ્રાફિક લેયર-3 રાઉટરને પાર કરી શકતો નથી. જો કોઈ મોટી કંપનીમાં 10 અલગ-અલગ VLANs કે બિલ્ડિંગ્સ હોય, તો શું દરેક ફ્લોર પર અલગ DHCP સર્વર લગાવવું પડશે? બિલકુલ નહીં! નેટવર્ક એન્જિનિયર્સ સિસ્કો રાઉટર કે સ્વિચ પર #hl-yellow[DHCP Relay Agent] (સિસ્કો કમાન્ડ: `ip helper-address 192.168.1.10`) સક્ષમ કરે છે, જે ક્લાયન્ટના બ્રોડકાસ્ટ પેકેટને યુનિકાસ્ટ પેકેટમાં રૂપાંતરિત કરીને કેન્દ્રીય DHCP સર્વર સુધી પહોંચાડી દે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 08 પ્રેક્ટિસ બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "DHCP IP ફાળવણીની 4-ચરણીય DORA પ્રક્રિયાનું સાચું પૂર્ણ સ્વરૂપ કયું છે?",
  optA: "Domain, Origin, Routing, Access",
  optB: "Discover, Offer, Request, Acknowledge",
  optC: "Detect, Open, Receive, Assign",
  optD: "Data, Output, Response, Authentication",
  ans: "B",
  exp: "DORA નું પૂર્ણ સ્વરૂપ છે: DHCPDISCOVER, DHCPOFFER, DHCPREQUEST, અને DHCPACK."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "ક્લાયન્ટ કમ્પ્યુટર નેટવર્ક પર DHCPDISCOVER પેકેટ મોકલતી વખતે કયા UDP પોર્ટ નંબરનો ઉપયોગ કરે છે?",
  optA: "UDP પોર્ટ 53",
  optB: "UDP પોર્ટ 67",
  optC: "UDP પોર્ટ 80",
  optD: "UDP પોર્ટ 445",
  ans: "B",
  exp: "DHCP સર્વર UDP પોર્ટ 67 પર સાંભળે છે, જ્યારે ક્લાયન્ટ UDP પોર્ટ 68 પર પ્રતિસાદ મેળવે છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "DHCP સ્કોપ વિકલ્પોમાં ક્લાયન્ટ કમ્પ્યુટર્સને 'Default Gateway (રાઉટર)' નો IP એડ્રેસ આપવા માટે કયા સત્તાવાર વિકલ્પ કોડનો ઉપયોગ થાય છે?",
  optA: "Option 003",
  optB: "Option 006",
  optC: "Option 015",
  optD: "Option 066",
  ans: "A",
  exp: "Option 003 Router (Default Gateway) માટે અને Option 006 DNS Servers માટે આરક્ષિત છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "નેટવર્ક પ્રિન્ટર કે સર્વરને દરેક વખતે એક જ ચોક્કસ IP એડ્રેસ આપમેળે ફાળવવા માટે કઈ ટેકનિકનો ઉપયોગ થાય છે?",
  optA: "Exclusion Range",
  optB: "MAC Address Reservation",
  optC: "APIPA Auto-IP",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "MAC રિઝર્વેશન ડિવાઇસના ભૌતિક મેક એડ્રેસને DHCP સ્કોપની અંદર ચોક્કસ IP સાથે કાયમી ધોરણે મેપ કરી દે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "જો નેટવર્ક પર કોઈ DHCP સર્વર ઉપલબ્ધ ન હોય, તો વિન્ડોઝ 11 ક્લાયન્ટ આપમેળે કઈ IP રેન્જમાંથી APIPA એડ્રેસ પસંદ કરી લે છે?",
  optA: "10.0.0.1 થી 10.0.0.254",
  optB: "169.254.0.1 થી 169.254.255.254",
  optC: "192.168.1.1 થી 192.168.1.254",
  optD: "172.16.0.1 થી 172.16.0.254",
  ans: "B",
  exp: "APIPA (Automatic Private IP Addressing) 169.254.0.0/16 સબનેટમાંથી IP પસંદ કરે છે જે DHCP નિષ્ફળતાનો સંકેત છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીનને 169.254.x.x નો IP મળ્યો છે. આનો અર્થ શું છે અને તમે તેને કેવી રીતે સુધારશો?'",
  a: "જવાબ: 169.254.x.x એ APIPA (Automatic Private IP Addressing) એડ્રેસ છે. આનો સીધો અર્થ એ છે કે ક્લાયન્ટે DHCPDISCOVER બ્રોડકાસ્ટ મોકલ્યું પણ નેટવર્ક પર કોઈ DHCP સર્વરે જવાબ આપ્યો નહીં. ટ્રબલશૂટિંગ માટે: 1. લૅન કેબલ/VLAN પોર્ટ કનેક્ટિવિટી ચકાસીશું, 2. DHCP સર્વર પર જઈને સ્કોપ પૂલ ભરાઈ ગયો છે કે નહીં (Pool Exhaustion) તે તપાસીશું, 3. ક્લાયન્ટ પર 'ipconfig /release' અને 'ipconfig /renew' ચલાવીશું.",
  tip: "HCL, Infosys અને TCS ના L1/L2 નેટવર્ક સપોર્ટ ઇન્ટરવ્યુમાં આ સૌથી સામાન્ય પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'DHCP Lease Renewal પ્રક્રિયા ક્યારે શરૂ થાય છે, અને T1 તથા T2 ટાઇમર્સ શું છે?'",
  a: "જવાબ: લીઝ અવધિના 50% સમય વીતી જવા પર (T1 Timer - દા.ત. 8 દિવસની લીઝમાં 4 દિવસ પછી) ક્લાયન્ટ મૂળ DHCP સર્વરને 'DHCPREQUEST' યુનિકાસ્ટ મોકલીને લીઝ રીન્યૂ કરવાનો પ્રયાસ કરે છે. જો મૂળ સર્વર જવાબ ન આપે, તો 87.5% સમય વીતી જવા પર (T2 Timer - 7મા દિવસે) ક્લાયન્ટ નેટવર્ક પર અન્ય કોઈપણ ઉપલબ્ધ DHCP સર્વરને બ્રોડકાસ્ટ મોકલે છે. જો 100% સમય સુધી રીન્યૂ ન થાય, તો IP આપોઆપ રીલીઝ થઈ જાય છે.",
  tip: "આ ઊંડો ટેકનિકલ ઉત્તર સાબિત કરે છે કે તમે પ્રોટોકોલના આંતરિક ટાઇમર્સ અને કાર્યપદ્ધતિથી પરિચિત છો."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'Rogue DHCP Server શું હોય છે અને Active Directory Authorization તેને કેવી રીતે અટકાવે છે?'",
  a: "જવાબ: Rogue DHCP એ અનધિકૃત સર્વર છે જે નેટવર્ક પર ખોટા IP અને ગેટવે વહેંચીને Man-in-the-Middle (MitM) હુમલો કરી શકે છે કે નેટવર્ક ઠપ કરી શકે છે. વિન્ડોઝ ડોમેન એન્વાયર્નમેન્ટમાં તમામ DHCP સર્વર્સે AD માં 'Authorize' થવું પડે છે (AD ના Configuration Partition માં યાદી). જ્યારે કોઈ બિનઅધિકૃત વિન્ડોઝ સર્વર DHCP ચાલુ કરે છે, ત્યારે તે પહેલા AD યાદી તપાસે છે; નામ ન મળતાં તેની DHCP સર્વિસ આપમેળે બંધ થઈ જાય છે.",
  tip: "એન્ટરપ્રાઇઝ નેટવર્ક સુરક્ષા સાથે જોડાયેલો આ અત્યંત મૂલ્યવાન પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'રાઉટરની પેલે પાર બીજા સબનેટ પર રહેલા ક્લાયન્ટ્સને કેન્દ્રીય DHCP સર્વર પાસેથી IP અપાવવા માટે શું કન્ફિગર કરવામાં આવે છે?'",
  a: "જવાબ: DHCP બ્રોડકાસ્ટ પેકેટ્સ રાઉટર ઓળંગી શકતા ન હોવાથી, રિમોટ સબનેટના ગેટવે રાઉટર પર 'DHCP Relay Agent' (સિસ્કોમાં 'ip helper-address <DHCP-IP>') કન્ફિગર કરવામાં આવે છે. આ રીલે એજન્ટ બ્રોડકાસ્ટને યુનિકાસ્ટમાં ફેરવીને સીધા કેન્દ્રીય DHCP સર્વર સુધી પહોંચાડે છે.",
  tip: "નેટવર્કિંગ અને સર્વર ઇન્ફ્રાસ્ટ્રક્ચરના સંયુક્ત ઇન્ટરવ્યુ રાઉન્ડનો આ સ્ટાન્ડર્ડ પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 માં DHCP Failover ના 'Load Balance' અને 'Hot Standby' મોડ્સ વચ્ચે આર્કિટેક્ચરલ તફાવત શું છે?'",
  a: "જવાબ: Load Balance મોડમાં બંને પાર્ટનર સર્વર્સ સક્રિય રહે છે અને પૂર્વનિર્ધારિત ગુણોત્તરમાં (દા.ત. 50:50) ક્લાયન્ટ વિનંતીઓ પર પ્રક્રિયા કરે છે (મલ્ટિ-સર્વર સાઇટ્સ માટે શ્રેષ્ઠ). Hot Standby મોડમાં એક સર્વર મુખ્ય (Active) રહે છે અને બીજું નિષ્ક્રિય (Standby) રહે છે; જ્યારે એક્ટિવ સર્વર ડાઉન થાય ત્યારે જ સ્ટેન્ડબાય સર્વર લીઝ આપવાનું શરૂ કરે છે (હબ-એન્ડ-સ્પોક બ્રાન્ચ આર્કિટેક્ચર માટે શ્રેષ્ઠ).",
  tip: "હાઇ-અવેલેબિલિટી, ક્લસ્ટરિંગ અને ડિઝાસ્ટર રિકવરી આર્કિટેક્ચરનો મુખ્ય સવાલ."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 08 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - DHCP સર્વર DORA પ્રક્રિયા દ્વારા ઓટોમેટિક IP, સબનેટ માસ્ક, ગેટવે (Opt 003) અને DNS (Opt 006) ફાળવે છે.
      - નેટવર્ક પ્રિન્ટર્સ અને ફિક્સ્ડ ડિવાઇસિસ માટે હંમેશા MAC Reservation નો ઉપયોગ કરો; ક્યારેય મેન્યુઅલ સ્ટેટિક IP ન આપો.
      - 169.254.x.x (APIPA) નું દેખાવું DHCP સર્વર નિષ્ફળતા અથવા નેટવર્ક ડિસ્કનેક્શનનો સ્પષ્ટ સંકેત છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 09: DNS SERVER ARCHITECTURE: ZONES, RECORDS & SCAVENGING
// =============================================================================

[#metadata("ch9") <chapter-9>]

#chapter-header(
  chapter-num: "CHAPTER 09",
  category: "ભાગ 9 : કોર્પોરેટ નેમ રિઝોલ્યુશન અને DNS (Enterprise Name Resolution)",
  title: "DNS સર્વર આર્કિટેક્ચર: ફોરવર્ડ/રિવર્સ ઝોન, રેકોર્ડ્સ અને સ્કેવેન્જિંગ",
  subtitle: "DNS નું એન્ટરપ્રાઇઝ મહત્વ · AD-ઇન્ટિગ્રેટેડ ઝોન · ફોરવર્ડ vs રિવર્સ લુકઅપ · A, PTR, CNAME, MX અને SRV રેકોર્ડ્સ · રૂટ હિન્ટ્સ vs ફોરવર્ડર્સ · DNS સ્કેવેન્જિંગ"
)

=== 9.1 DNS નું એન્ટરપ્રાઇઝ મહત્વ અને #hl-yellow[એક્ટિવ ડિરેક્ટરી] સાથે અતૂટ સંબંધ
જો #hl-yellow[એક્ટિવ ડિરેક્ટરી] (Active Directory) કોર્પોરેટ નેટવર્કનું *મગજ (Brain)* છે, તો DNS સર્વર તેનું *હૃદય (Heart)* છે. સમગ્ર વિન્ડોઝ ડોમેન એન્વાયરન્મેન્ટમાં કોઈપણ સેવા (Login, #hl-orange[Kerberos], File Sharing, GPO) DNS વગર 1 સેકન્ડ પણ કાર્ય કરી શકતી નથી.

#mark-yellow[ડોમેન નેમ સિસ્ટમ (DNS) એ એક શ્રેણીબદ્ધ અને વિતરિત ડેટાબેઝ સેવા (Hierarchical Distributed Database) છે જે મનુષ્ય દ્વારા વાંચી શકાય તેવા કમ્પ્યુટર નામોને (દા.ત. `portal.corp.rtechlab.local`) નેટવર્ક સમજી શકે તેવા IP સરનામાઓમાં (`192.168.1.50`) અનુવાદિત (Resolve) કરે છે.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "DNS પોર્ટ્સ અને પ્રોટોકોલ્સ")[
      DNS ડિફૉલ્ટ રૂપે #hl-green[Port 53] પર કાર્ય કરે છે. સામાન્ય નેમ રિઝોલ્યુશન ક્વેરીઝ (< 512 બાઇટ્સ) માટે તે ઝડપી #hl-green[UDP Port 53] નો ઉપયોગ કરે છે, જ્યારે ઝોન ટ્રાન્સફર (Zone Transfer) અને મોટા પેકેટો માટે વિશ્વસનીય #hl-yellow[TCP Port 53] નો ઉપયોગ કરે છે.
    ]
  ],
  [
    #warning-box(title: "SRV રેકોર્ડ્સ: #hl-yellow[એક્ટિવ ડિરેક્ટરી]નો જીવન આધાર")[
      જ્યારે કોઈ ક્લાયન્ટ ડોમેન જોઇન અથવા લોગિન કરે છે, ત્યારે તે #hl-yellow[ડોમેન કંટ્રોલર]નું નામ જાણતો નથી. તે DNS પાસેથી વિશિષ્ટ #hl-orange[SRV રેકોર્ડ્સ] માંગે છે (`_ldap._tcp.dc._msdcs`). જો DNS માં આ રેકોર્ડ્સ ન હોય, તો ડોમેન પ્રમાણીકરણ સંપૂર્ણપણે ઠપ થઈ જાય છે!
    ]
  ]
)

#v(4pt)

=== 9.2 DNS ઝોનના પ્રકારો (Types of DNS Zones)
DNS માં ઝોન એ એવા વહીવટી ભાગને (Database Partition) કહેવાય છે જેના માટે તે DNS સર્વર સત્તાવાર (Authoritative) હોય છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dns_architecture_zones.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 9.1: એન્ટરપ્રાઇઝ DNS આર્કિટેક્ચર — ફોરવર્ડ/રિવર્સ ઝોન, રિસોર્સ રેકોર્ડ્સ અને સ્કેવેન્જિંગ લાઇફસાયકલ]
]

#v(4pt)

1. #text(weight: "bold", fill: rtech-blue)[Active Directory-Integrated Zone (શ્રેષ્ઠ એન્ટરપ્રાઇઝ વિકલ્પ):] આ ઝોન અલગ ફાઇલમાં સંગ્રહિત થવાને બદલે સીધો #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડેટાબેઝ (`ntds.dit`) માં સ્ટોર થાય છે. તેના 3 અજોડ ફાયદા છે:
   - #hl-green[મલ્ટી-માસ્ટર રેપ્લિકેશન (Multi-Master Replication):] કોઈપણ DC પર રેકોર્ડ બદલો, તે આપમેળે તમામ DCs પર સિંક થઈ જાય છે.
   - #hl-green[સિક્યોર ડાયનામિક અપડેટ્સ (Secure Dynamic Updates):] માત્ર ડોમેનના અધિકૃત કમ્પ્યુટર્સ જ પોતાનો IP રેકોર્ડ રજીસ્ટર કરી શકે છે (હેકર્સ કે અજાણ્યા ઉપકરણો નહીં).
   - #hl-green[એનક્રિપ્ટેડ રેપ્લિકેશન (Encrypted Replication):] સમગ્ર DNS ડેટા #hl-orange[Kerberos] દ્વારા એનક્રિપ્ટ થઈને ટ્રાન્સફર થાય છે.
2. #text(weight: "bold", fill: rtech-navy)[Standard Primary Zone:] આ એક પરંપરાગત ટેક્સ્ટ ફાઇલ (`zone.dns`) માં સંગ્રહિત થાય છે. તેમાં માત્ર પ્રાઇમરી સર્વર જ રેકોર્ડ્સ લખી શકે છે (Single Master).
3. #text(weight: "bold", fill: rtech-navy)[Standard Secondary Zone:] પ્રાઇમરી ઝોનની માત્ર રીડ-ઓન્લી (Read-Only) નકલ. બેકઅપ અને લોડ ડિસ્ટ્રિબ્યુશન માટે ઉપયોગી.
4. #text(weight: "bold", fill: rtech-muted)[Stub Zone:] તેમાં માત્ર NS (Name Server), SOA (Start of Authority) અને ગ્લૂ A રેકોર્ડ્સ હોય છે જેથી અન્ય ડોમેનના અધિકૃત સર્વર્સને ઝડપથી શોધી શકાય.

#v(6pt)

=== 9.3 ફોરવર્ડ લુકઅપ ઝોન વિરુદ્ધ રિવર્સ લુકઅપ ઝોન (Forward vs Reverse Lookup)
- #text(weight: "bold", fill: rtech-navy)[ફોરવર્ડ લુકઅપ ઝોન (#hl-yellow[Forward Lookup Zone]):] કમ્પ્યુટર નામને IP એડ્રેસમાં ફેરવે છે (Name -> IP). જ્યારે તમે બ્રાઉઝરમાં `srv-2025-dc01.corp.rtechlab.local` ટાઇપ કરો છો, ત્યારે ફોરવર્ડ ઝોન `192.168.1.10` પરત કરે છે.
- #text(weight: "bold", fill: rtech-navy)[રિવર્સ લુકઅપ ઝોન (#hl-yellow[Reverse Lookup Zone]):] IP એડ્રેસને કમ્પ્યુટર નામામાં ફેરવે છે (IP -> Name). તે વિશિષ્ટ ઇન-એડ્રેસ આર્પા ડોમેનનો ઉપયોગ કરે છે (દા.ત. `1.168.192.in-addr.arpa`).
  - *રિવર્સ ઝોન શા માટે અનિવાર્ય છે?* #hl-orange[Kerberos] પ્રમાણીકરણમાં SPN માન્યતા (Validation), મેઇલ સર્વર્સમાં સ્પામ બ્લોકિંગથી બચવું, અને કમાન્ડ પ્રોમ્પ્ટમાં `nslookup 192.168.1.10` ચલાવીને હોસ્ટનું સાચું FQDN નામ જાણવા માટે.

#v(6pt)

=== 9.4 આવશ્યક એન્ટરપ્રાઇઝ DNS રેકોર્ડ્સ (Resource Records)
DNS કન્સોલ (`dnsmgmt.msc`) માં 5 સૌથી મહત્વપૂર્ણ રેકોર્ડ્સ હોય છે:

1. #text(weight: "bold", fill: rtech-blue)[Host (A અને AAAA રેકોર્ડ):] Hostname ને IPv4 (A રેકોર્ડ) અથવા IPv6 (AAAA રેકોર્ડ) સરનામા સાથે જોડે છે. દા.ત. `srv-dc01` -> `192.168.1.10`.
2. #text(weight: "bold", fill: rtech-emerald)[Pointer (PTR રેકોર્ડ):] રિવર્સ લુકઅપ ઝોનમાં IP ને Hostname સાથે મેપ કરે છે. દા.ત. `10` -> `srv-dc01.corp.rtechlab.local`.
3. #text(weight: "bold", fill: rtech-amber)[Alias (CNAME - Canonical Name):] એક કમ્પ્યુટર માટે વૈકલ્પિક ઉપનામ (Alias) બનાવે છે. દા.ત. કર્મચારીઓ `portal.corp.rtechlab.local` ખોલે તો તે CNAME દ્વારા બેકએન્ડ સર્વર `srv-2025-web01.corp.rtechlab.local` પર રીડાયરેક્ટ થઈ જાય.
4. #text(weight: "bold", fill: rtech-navy)[Mail Exchanger (MX રેકોર્ડ):] ડોમેનના ઇમેઇલ સર્વર્સ (Microsoft Exchange) નો IP અને તેમની પ્રાથમિકતા (Priority/Preference નંબર) દર્શાવે છે.
5. #text(weight: "bold", fill: rtech-rose)[Service Location (SRV રેકોર્ડ):] સમગ્ર #hl-yellow[એક્ટિવ ડિરેક્ટરી]ની કરોડરજ્જુ. તે જણાવે છે કે LDAP, #hl-orange[Kerberos], અને Global Catalog જેવી સેવાઓ કયા પોર્ટ અને કયા સર્વર પર ચાલી રહી છે (દા.ત. `_ldap._tcp.dc._msdcs.corp.rtechlab.local` #hl-green[Port 389]).

#v(6pt)

=== 9.5 રૂટ હિન્ટ્સ (Root Hints) વિરુદ્ધ DNS ફોરવર્ડર્સ (Forwarders)
જ્યારે કોઈ કર્મચારી તેના ઓફિસ લેપટોપ પર બાહ્ય વેબસાઇટ (જેમ કે `google.com`) ખોલે છે, ત્યારે આપણું આંતરિક DNS સર્વર તેને કેવી રીતે શોધે છે?

- #text(weight: "bold", fill: rtech-navy)[રૂટ હિન્ટ્સ (Root Hints):] વિશ્વમાં 13 વૈશ્વિક લોજિકલ રૂટ સર્વર ક્લસ્ટર્સ છે (`a.root-servers.net` થી `m.root-servers.net`). જો કોઈ ફોરવર્ડર સેટ ન હોય, તો આપણું સર્વર સીધું રૂટ સર્વર્સથી પૂછવાનું શરૂ કરે છે (રૂટ -> .com TLD -> google.com). આ પ્રક્રિયા ધીમી હોય છે.
- #text(weight: "bold", fill: rtech-emerald)[DNS ફોરવર્ડર્સ (Forwarders - એન્ટરપ્રાઇઝ શ્રેષ્ઠ પદ્ધતિ):] આપણે આપણા સ્થાનિક DNS સર્વરને નિર્દેશ આપીએ છીએ કે જે બાહ્ય ડોમેન તારા ડેટાબેઝમાં ન હોય, તે સીધા અમારા અપસ્ટ્રીમ ISP અથવા વિશ્વસનીય પબ્લિક DNS સર્વર્સ પાસેથી પૂછો:
  - Primary Forwarder: #hl-green[`1.1.1.1`] (Cloudflare)
  - Secondary Forwarder: #hl-green[`8.8.8.8`] (Google DNS)
  - *ફાયદા:* ઇન્ટરનેટ બ્રાઉઝિંગ અત્યંત ઝડપી બને છે અને બાહ્ય પરિણામો લોકલ કેશમાં સ્ટોર થઈ જાય છે જેથી બેન્ડવિડ્થ બચે છે.

#v(6pt)

=== 9.6 જૂના રેકોર્ડ્સ દૂર કરવા: DNS એજિંગ અને સ્કેવેન્જિંગ (Aging & Scavenging)
જ્યારે સેંકડો લેપટોપ વાઇ-ફાઇ સાથે જોડાય છે અને ડિસ્કનેક્ટ થાય છે, ત્યારે DNS ડેટાબેઝમાં હજારો જૂના અને બિનઉપયોગી રેકોર્ડ્સ (Stale Records) જમા થઈ જાય છે. તેને આપમેળે સાફ કરવા માટે #hl-yellow[Aging & Scavenging] સક્ષમ કરવામાં આવે છે:

1. #text(weight: "bold")[No-refresh interval (ડિફૉલ્ટ 7 દિવસ):] આ સમયગાળા દરમિયાન જો ક્લાયન્ટ ફરીથી તે જ IP રિફ્રેશ કરે છે, તો DNS ટાઇમસ્ટેમ્પ અપડેટ કરતું નથી (જેથી સર્વરનો રેપ્લિકેશન ટ્રાફિક ન વધે).
2. #text(weight: "bold")[Refresh interval (ડિફૉલ્ટ 7 દિવસ):] આ સમયગાળામાં ક્લાયન્ટ ટાઇમસ્ટેમ્પને સફળતાપૂર્વક રિફ્રેશ કરી શકે છે.
3. #text(weight: "bold")[Scavenging Period (ડિફૉલ્ટ 7 દિવસ):] સર્વર સ્વીપરની જેમ સફાઈ પ્રક્રિયા ચલાવે છે. જો કોઈ રેકોર્ડનો ટાઇમસ્ટેમ્પ 14 દિવસ (7 + 7 દિવસ) કરતાં જૂનો હોય અને રિફ્રેશ ન થયો હોય, તો DNS તેને ડેટાબેઝમાંથી કાયમ માટે ડિલીટ કરી દે છે!

#v(8pt)

// =============================================================================
// CHAPTER 09 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows Server 2025 માં DNS માં નેટિવ #hl-yellow[DoH (DNS over HTTPS)] સપોર્ટ ઉમેરવામાં આવ્યો છે. આનો અર્થ એ છે કે સર્વરથી બહાર ઇન્ટરનેટ પર જતી તમામ DNS ક્વેરીઝ હવે સાદા ટેક્સ્ટ (Cleartext UDP 53) માં જવાને બદલે #hl-green[HTTPS (#hl-green[Port 443])] દ્વારા સંપૂર્ણપણે એનક્રિપ્ટ થઈને જાય છે, જેથી ISP અથવા સાયબર અટેકર્સ ક્યારેય જોઈ શકતા નથી કે કંપનીની અંદરના કર્મચારીઓ કયા ડોમેન્સ એક્સેસ કરી રહ્યા છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 09 સ્વાધ્યાય બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "#hl-yellow[એક્ટિવ ડિરેક્ટરી]-ઇન્ટિગ્રેટેડ DNS ઝોન (AD-Integrated Zone) નો ડેટાબેઝ કઈ ફાઇલમાં સ્ટોર થાય છે?",
  optA: "system32\dns\zone.dns ફાઇલમાં",
  optB: "એક્ટિવ ડિરેક્ટરી ડેટાબેઝ ntds.dit ની અંદર",
  optC: "Windows Registry માં",
  optD: "SYSVOL શેર્ડ ફોલ્ડરમાં",
  ans: "B",
  exp: "AD-Integrated ઝોન સીધો ntds.dit માં સ્ટોર થાય છે જેથી મલ્ટી-માસ્ટર રેપ્લિકેશન અને સુરક્ષિત એનક્રિપ્શન મળે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "રિવર્સ લુકઅપ ઝોનમાં IP એડ્રેસને હોસ્ટનેમમાં મેપ કરતા સત્તાવાર રેકોર્ડનું નામ શું છે?",
  optA: "A Record",
  optB: "CNAME Record",
  optC: "PTR Record",
  optD: "MX Record",
  ans: "C",
  exp: "Pointer (PTR) રેકોર્ડ IP એડ્રેસને સંબંધિત Hostname માં અનુવાદિત (Resolve) કરવાનું કાર્ય કરે છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "એક્ટિવ ડિરેક્ટરી #hl-yellow[ડોમેન કંટ્રોલર], #hl-orange[Kerberos] અને LDAP સેવાઓ શોધવા માટે કયા વિશિષ્ટ DNS રેકોર્ડનો ઉપયોગ થાય છે?",
  optA: "TXT Record",
  optB: "SRV (Service Location) Record",
  optC: "SOA Record",
  optD: "NS Record",
  ans: "B",
  exp: "SRV રેકોર્ડ્સ (_ldap._tcp.dc._msdcs) દ્વારા જ ક્લાયન્ટ્સ #hl-yellow[ડોમેન કંટ્રોલર]ના પોર્ટ અને IP સરનામાઓ શોધી શકે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "સામાન્ય નેમ રિઝોલ્યુશન ક્વેરી માટે DNS સર્વર કયા પ્રમાણભૂત પોર્ટ અને ટ્રાન્સપોર્ટ પ્રોટોકોલનો ઉપયોગ કરે છે?",
  optA: "TCP પોર્ટ 80",
  optB: "UDP પોર્ટ 53",
  optC: "TCP પોર્ટ 445",
  optD: "UDP પોર્ટ 67",
  ans: "B",
  exp: "પ્રમાણભૂત DNS ક્વેરી UDP પોર્ટ 53 પર થાય છે; જ્યારે મોટા ઝોન ટ્રાન્સફર TCP પોર્ટ 53 પર થાય છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "DNS ડેટાબેઝમાંથી જૂના અને બિનઉપયોગી (Stale) ડાયનામિક રેકોર્ડ્સ આપમેળે દૂર કરવાની પ્રક્રિયાને શું કહેવાય છે?",
  optA: "Zone Transfer",
  optB: "#hl-yellow[Aging and Scavenging]",
  optC: "DNS Forwarding",
  optD: "Dynamic Registration",
  ans: "B",
  exp: "Aging અને Scavenging પ્રક્રિયા સમય મર્યાદા સમાપ્ત થતાં બિનઉપયોગી ડાયનામિક રેકોર્ડ્સને ડેટાબેઝમાંથી આપોઆપ કાઢી નાખે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોચના MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'સુરક્ષા અને રેપ્લિકેશનની દ્રષ્ટિએ એક્ટિવ ડિરેક્ટરી-ઇન્ટિગ્રેટેડ ઝોન અને સ્ટાન્ડર્ડ પ્રાઇમરી ઝોન વચ્ચે મુખ્ય તફાવત શું છે?'",
  a: "જવાબ: સ્ટાન્ડર્ડ પ્રાઇમરી ઝોન સિંગલ-માસ્ટર મોડેલ પર કાર્ય કરે છે જ્યાં માત્ર પ્રાઇમરી સર્વર પર જ રેકોર્ડ્સ લખી શકાય છે અને સેકન્ડરી સર્વર્સ પર થતું ઝોન ટ્રાન્સફર અન-એનક્રિપ્ટેડ હોય છે. આનાથી વિપરીત, AD-Integrated ઝોનમાં મલ્ટી-માસ્ટર રેપ્લિકેશન હોય છે (કોઈપણ DC પર રેકોર્ડ લખી શકાય છે), ડેટા #hl-orange[Kerberos] દ્વારા એનક્રિપ્ટ થઈને AD રેપ્લિકેશન સાથે વહન પામે છે, અને તે 'Secure Dynamic Updates' ને સપોર્ટ કરે છે જેથી બિન-ડોમેન મશીનો નકલી રેકોર્ડ્સ બનાવી શકતા નથી.",
  tip: "Wipro, Infosys અને TCS ના L2 SysAdmin ઇન્ટરવ્યુમાં આ સૌથી મહત્વપૂર્ણ તુલનાત્મક પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'DNS Forwarders અને Root Hints વચ્ચે શું તફાવત છે, અને પ્રોડક્શનમાં કોને પ્રાથમિકતા આપવામાં આવે છે?'",
  a: "જવાબ: Root Hints 13 વૈશ્વિક રૂટ સર્વર્સ પાસેથી સીધી ઇટરેટિવ ક્વેરી કરે છે જે ખૂબ ધીમી હોય છે અને વિલંબ (Latency) વધારે છે. Forwarders ચોક્કસ અપસ્ટ્રીમ DNS (દા.ત. 1.1.1.1 અથવા ISP DNS) ને ક્વેરી ફોરવર્ડ કરે છે જે પહેલેથી કેશ થયેલ જવાબો તરત જ પરત આપે છે. પ્રોડક્શન વાતાવરણમાં હંમેશાં DNS Forwarders ને પ્રાથમિકતા અપાય છે કારણ કે તે બેન્ડવિડ્થ બચાવે છે અને ઇન્ટરનેટ એક્સેસને ખૂબ ઝડપી બનાવે છે.",
  tip: "આ ઉત્તર સાબિત કરે છે કે તમે નેટવર્ક ટ્રાફિક અને લેટન્સી ઓપ્ટિમાઇઝેશનની ઊંડી સમજ ધરાવો છો."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીન પર 'nslookup' ચલાવતી વખતે 'Default Server: Unknown' અને IP એડ્રેસ 192.168.1.10 દેખાય છે. આને કેવી રીતે ઠીક કરશો?'",
  a: "જવાબ: 'Default Server: Unknown' આવવાનો અર્થ એ છે કે DNS સર્વર પાસે પોતાના જ IP (192.168.1.10) માટે '#hl-yellow[Reverse Lookup Zone]' માં PTR રેકોર્ડ ઉપલબ્ધ નથી. આને સુધારવા માટે DNS કન્સોલમાં 192.168.1.x સબનેટ માટે #hl-yellow[Reverse Lookup Zone] બનાવીશું અને DC નો PTR રેકોર્ડ ઉમેરીશું. ત્યાર બાદ nslookup ચલાવતાં જ તે સર્વરનું સત્તાવાર FQDN નામ પ્રદર્શિત કરશે.",
  tip: "L1/L2 હેલ્પડેસ્ક અને સિસ્ટમ એડમિન ટ્રબલશૂટિંગનો આ ક્લાસિક ઇન્ટરવ્યુ પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'DNS Cache Poisoning શું છે અને તેનાથી કેવી રીતે બચી શકાય?'",
  a: "જવાબ: જ્યારે કોઈ સાયબર હુમલાખોર (Attacker) નકલી DNS રિસ્પોન્સ ઇન્જેક્ટ કરીને DNS સર્વરના કેશમાં કોઈ લોકપ્રિય ડોમેનને (દા.ત. bank.com) પોતાના દૂષિત IP સાથે મેપ કરાવી દે છે, ત્યારે તેને Cache Poisoning કહેવામાં આવે છે. આ હુમલાથી બચવા માટે વિન્ડોઝ સર્વરમાં #hl-green[DNSSEC] (DNS Security Extensions), Socket Pools અને Cache Locking સક્ષમ કરવામાં આવે છે.",
  tip: "સાયબર સિક્યોરિટી અને ઇન્ફ્રાસ્ટ્રક્ચર ઓડિટ્સનો આ પસંદગીનો પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'DNS Scavenging સક્ષમ કરતી વખતે કઈ બે જગ્યાએ સેટિંગ્સ ચાલુ કરવી ફરજિયાત છે?'",
  a: "જવાબ: Scavenging ને બે સ્તરે સક્ષમ કરવું ફરજિયાત છે: 1. ઝોન સ્તરે (Zone Properties -> General -> Aging બટન -> 'Scavenge stale resource records' ચેક કરવું), અને 2. સર્વર સ્તરે (Server Properties -> Advanced -> 'Enable automatic scavenging of stale records' ચેક કરવું). જો આ બંને સ્થાનો પર સેટિંગ સક્ષમ નહીં હોય, તો સ્કેવેન્જિંગ પ્રક્રિયા ક્યારેય કાર્ય કરશે નહીં.",
  tip: "આ ચોક્કસ વ્યવહારુ જ્ઞાન ઇન્ટરવ્યુઅરને સાબિત કરે છે કે તમે વાસ્તવિક લેબમાં આનું કન્ફિગરેશન જાતે કર્યું છે."
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ DNS કમાન્ડ-લાઇન ટ્રબલશૂટિંગ માસ્ટરકિટ (Essential Commands):]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-blue)[`ipconfig /flushdns`]: ક્લાયન્ટ મશીનની સ્થાનિક DNS કેશ ખાલી કરે છે (જેથી બદલાયેલ IP તરત જ દેખાય).
      - #text(weight: "bold", fill: rtech-emerald)[`ipconfig /registerdns`]: ક્લાયન્ટના Host (A) અને PTR રેકોર્ડ્સને DNS સર્વર પર ફરીથી ડાયનામિકલી રજીસ્ટર કરે છે.
      - #text(weight: "bold", fill: rtech-amber)[`nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.rtechlab.local`]: આ ખાતરી કરે છે કે AD ના SRV રેકોર્ડ્સ યોગ્ય રીતે કાર્ય કરી રહ્યા છે.
      - #text(weight: "bold", fill: rtech-navy)[`dnscmd /clearcache`]: DNS સર્વરની સમગ્ર આંતરિક રીઝોલ્વર કેશ કમાન્ડ લાઇન દ્વારા ખાલી કરે છે.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ પ્રકરણ 09 ચકાસણી ચેકલિસ્ટ (DNS Architecture Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] #hl-yellow[Forward Lookup Zone] `corp.rtechlab.local` એક્ટિવ ડિરેક્ટરી-ઇન્ટિગ્રેટેડ છે.
      - [ ] #hl-yellow[Reverse Lookup Zone] `1.168.192.in-addr.arpa` માં DC નો PTR રેકોર્ડ ઉપલબ્ધ છે.
      - [ ] બાહ્ય ઇન્ટરનેટ રિઝોલ્યુશન માટે Forwarders માં `1.1.1.1` અને `8.8.8.8` કન્ફિગર થયેલ છે.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 09 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - DNS એક્ટિવ ડિરેક્ટરીનો જીવન આધાર છે; SRV રેકોર્ડ્સ #hl-yellow[ડોમેન કંટ્રોલર] અને Kerberos ની ઓળખ કરાવે છે.
      - પ્રોડક્શનમાં હંમેશાં AD-Integrated ઝોન અને 1.1.1.1 / 8.8.8.8 પર આધારિત DNS Forwarders નો ઉપયોગ કરો.
      - જૂના (Stale) રેકોર્ડ્સ દૂર કરવા માટે ઝોન અને સર્વર બંને સ્તરે Aging & Scavenging સક્ષમ કરવું ફરજિયાત છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 10: FILE SERVER RESOURCE MANAGER (#hl-orange[FSRM]), NTFS & QUOTA MANAGEMENT
// =============================================================================

[#metadata("ch10") <chapter-10>]

#chapter-header(
  chapter-num: "CHAPTER 10",
  category: "ભાગ 10 : સ્ટોરેજ, શેરિંગ અને ફાઇલ રિસોર્સ મેનેજમેન્ટ (Storage & #hl-orange[FSRM])",
  title: "ફાઇલ સર્વર રિસોર્સ મેનેજર (#hl-orange[FSRM]), NTFS પરવાનગીઓ અને ક્વોટા વ્યવસ્થાપન",
  subtitle: "શેર્ડ ફોલ્ડર્સ · SMB 3.1.1 · શેર vs NTFS પરવાનગીઓ (ઇફેક્ટિવ ફોર્મ્યુલા) · #hl-orange[FSRM] રોલ · હાર્ડ vs સોફ્ટ સ્ટોરેજ ક્વોટા · ફાઇલ સ્ક્રીનિંગ (MP3/EXE બ્લોકિંગ) · સ્ટોરેજ રિપોર્ટ્સ"
)

=== 10.1 એન્ટરપ્રાઇઝ ફાઇલ શેરિંગ આર્કિટેક્ચર અને SMB 3.1.1 પ્રોટોકોલ
કોઈપણ કોર્પોરેટ સંસ્થામાં કર્મચારીઓનું દૈનિક કાર્ય ફાઇલો (Word, Excel, PDFs, પ્રોજેક્ટ કોડ) ના આદાન-પ્રદાન પર નિર્ભર હોય છે. જો તમામ કર્મચારીઓ ડેટાને પોતાના અંગત લેપટોપ પર રાખશે, તો લેપટોપ ખોવાઈ જવા કે ખરાબ થવા પર કંપનીનો સમગ્ર ડેટા નષ્ટ થઈ શકે છે.

#mark-yellow[ફાઇલ સર્વર (File Server) એક કેન્દ્રીય સર્વર છે જે નેટવર્ક પર તમામ વિભાગોના (HR, Accounts, Legal) શેર કરેલા ડેટાને સુરક્ષિત સંગ્રહિત કરે છે અને SMB (Server Message Block) પ્રોટોકોલ દ્વારા એક્સેસ પ્રદાન કરે છે.]

વિન્ડોઝ સર્વર 2025 માં ફાઇલ શેરિંગ #hl-green[SMB 3.1.1] પર આધારિત છે:
- ડિફૉલ્ટ પોર્ટ: #hl-green[TCP Port 445]
- #text(weight: "bold", fill: rtech-navy)[SMB સાઇનિંગ (SMB Signing):] Server 2025 માં ડિફૉલ્ટ રૂપે ફરજિયાત (Mandatory) છે જે મેન-ઇન-ધ-મિડલ રિલે હુમલાઓને અટકાવે છે.
- #text(weight: "bold", fill: rtech-navy)[SMB એન્ક્રિપ્શન (SMB Encryption):] એન્ડ-ટુ-એન્ડ AES-256-GCM એન્ક્રિપ્શન જે બિનઅધિકૃત નેટવર્ક સ્નિફિંગથી ડેટાને સુરક્ષિત રાખે છે.

#v(4pt)

=== 10.2 શેર પરવાનગીઓ (Share Permissions) વિરુદ્ધ NTFS પરવાનગીઓ
આ વિન્ડોઝ ઇન્ફ્રાસ્ટ્રક્ચરના સૌથી મહત્વપૂર્ણ વિષયોમાંથી એક છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ntfs_vs_share_matrix.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 10.1: શેર પરવાનગીઓ વિરુદ્ધ NTFS પરવાનગીઓ — અસરકારક પરવાનગી ફોર્મ્યુલા અને મોસ્ટ રેસ્ટ્રિક્ટિવ નિયમ]
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "શેર પરવાનગીઓ (Share Permissions)")[
      - માત્ર ત્યારે જ લાગુ થાય છે જ્યારે વપરાશકર્તા નેટવર્ક દ્વારા શેર કરેલા ફોલ્ડરને એક્સેસ કરે છે (`\\Server\Share`).
      - જો વપરાશકર્તા સર્વર પર સ્થાનિક રીતે (Locally) લોગિન હોય, તો શેર પરવાનગી કાર્ય કરતી નથી.
      - માત્ર 3 સ્તરો હોય છે: #hl-yellow[Read], #hl-green[Change], અને #hl-orange[Full Control].
    ]
  ],
  [
    #info-box(title: "NTFS સુરક્ષા પરવાનગીઓ (Security Permissions)")[
      - સ્થાનિક (Local) અને નેટવર્ક (Network) બંને પ્રકારના એક્સેસ પર 100% લાગુ થાય છે.
      - માત્ર NTFS ફોર્મેટેડ વોલ્યુમ પર જ કાર્ય કરે છે.
      - અત્યંત વિસ્તૃત સ્તરો: #hl-yellow[Read], #hl-green[Write], #hl-orange[Modify], #hl-green[Read & Execute], અને #hl-orange[Full Control].
    ]
  ]
)

#v(6pt)

=== 10.3 અસરકારક પરવાનગીઓનો નિયમ (The Most Restrictive Rule)
જ્યારે કોઈ વપરાશકર્તા નેટવર્ક પરથી કોઈપણ ફોલ્ડરમાં ફાઇલ ખોલવાનો પ્રયાસ કરે છે, ત્યારે વિન્ડોઝ શેર પરવાનગી અને NTFS પરવાનગી બંનેની તુલના કરે છે:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[અસરકારક પરવાનગીઓનો ગોલ્ડન નિયમ (The Golden Law):]\
    #align(center)[#text(size: 9.5pt, weight: "black", fill: rtech-navy)[
      Effective Permission = Most Restrictive (Share Permission, NTFS Permission)
    ]]\
    #text(size: 7.5pt, fill: rtech-text)[
      - *ઉદાહરણ 1:* જો Share પરવાનગી = #hl-green[Read] હોય અને NTFS પરવાનગી = #hl-green[Full Control] હોય, તો અસરકારક પરવાનગી માત્ર #mark-yellow[Read] જ રહેશે (વપરાશકર્તા ફાઇલમાં કોઈ ફેરફાર કરી શકશે નહીં)!
      - *ઉદાહરણ 2:* જો Share પરવાનગી = #hl-green[Full Control] હોય અને NTFS પરવાનગી = #hl-green[Modify] હોય, તો અસરકારક પરવાનગી #mark-green[Modify] રહેશે!
      - #text(weight: "bold", fill: rtech-blue)[એન્ટરપ્રાઇઝ શ્રેષ્ઠ પદ્ધતિ:] શેર પરવાનગીઓને હંમેશાં `Authenticated Users = Change` (અથવા `Full Control`) પર ખુલ્લી રાખો, અને વાસ્તવિક સુરક્ષા નિયંત્રણ માત્ર *NTFS ACLs* દ્વારા જ સંચાલિત કરો!
    ]
  ]
)

#v(6pt)

=== 10.4 ફાઇલ સર્વર રિસોર્સ મેનેજર (#hl-orange[FSRM]) રોલ ઇન્સ્ટોલેશન
#hl-orange[FSRM] એ માઇક્રોસોફ્ટનું અદ્યતન સ્ટોરેજ મેનેજમેન્ટ ટૂલ છે જે વપરાશકર્તાઓ દ્વારા ડિસ્ક સ્પેસનો બગાડ અને બિનઅધિકૃત ફાઇલો સંગ્રહિત થતી અટકાવવાની સુવિધા આપે છે:

1. #hl-yellow[Server Manager] માં જાઓ -> #hl-green[Add Roles and Features] પર ક્લિક કરો.
2. Server Roles માં -> #text(weight: "bold")[File and Storage Services] -> #text(weight: "bold")[File and iSCSI Services] વિસ્તૃત કરો.
3. #mark-yellow[File Server Resource Manager] ચેકબોક્સ પર ટિક કરો.
4. 'Add Features' (FSRM મેનેજમેન્ટ ટૂલ્સ) પસંદ કરીને 'Install' કરો.
5. ઇન્સ્ટોલેશન પછી Tools મેનૂમાંથી #hl-green[File Server Resource Manager] ખોલો (અથવા રનમાં ટાઇપ કરો: #mark-green[`fsrm.msc`]).

#v(6pt)

=== 10.5 સ્ટોરેજ ક્વોટા વ્યવસ્થાપન: હાર્ડ ક્વોટા વિરુદ્ધ સોફ્ટ ક્વોટા (Quota Management)
ક્વોટા નિયંત્રણ વિના કોઈપણ કર્મચારી સર્વર પર સેંકડો ગીગાબાઇટ્સની અંગત ફાઇલો અપલોડ કરીને આખી હાર્ડ ડિસ્ક ભરી શકે છે:

- #text(weight: "bold", fill: rtech-rose)[હાર્ડ ક્વોટા (Hard Quota):] આ એક સખત મર્યાદા છે. વપરાશકર્તાની ફાઇલ સ્ટોરેજ મર્યાદા 100% (દા.ત. 10 GB) એ પહોંચતાં જ વિન્ડોઝ તેને આગળ 1 બાઇટ પણ લખવા દેતું નથી અને સ્ક્રીન પર 'There is not enough space on the disk' નો એરર આવે છે.
- #text(weight: "bold", fill: rtech-amber)[સોફ્ટ ક્વોટા (Soft Quota):] આ માત્ર મોનિટરિંગ મર્યાદા છે. વપરાશકર્તા 100% સ્પેસ ભરી લે, તો પણ ફાઇલ સેવિંગ બ્લોક થતું નથી, પરંતુ સિસ્ટમ એડમિનિસ્ટ્રેટર અને વપરાશકર્તાને ઇમેઇલ ચેતવણી મોકલવામાં આવે છે જેથી તેઓ વધારાની સ્ટોરેજની વ્યવસ્થા કરી શકે.

*ક્વોટા કન્ફિગરેશન સ્ટેપ્સ:*
1. `fsrm.msc` માં ડાબી બાજુએ #hl-yellow[Quota Management -> Quotas] પર જાઓ.
2. જમણી બાજુએ 'Create Quota...' પર ક્લિક કરો.
3. Quota path: તમારા શેર કરેલા ફોલ્ડરનો પાથ પસંદ કરો (દા.ત. `C:\Shares\HR_Data`).
4. 'Derive properties from this quota template': #hl-green['10 GB Limit (Hard Quota)'] પસંદ કરો.
5. Notification Thresholds: 85% અને 95% ભરાઈ જવા પર ઓટોમેટિક ઇમેઇલ એલર્ટ પસંદ કરો. 'Create' પર ક્લિક કરો.

#v(6pt)

=== 10.6 ફાઇલ સ્ક્રીનિંગ (File Screening): ઑડિયો, વિડિયો અને માલવેર બ્લોકિંગ
કર્મચારીઓ ઘણીવાર કંપનીના સર્વર પર પાઇરેટેડ મૂવીઝ, ગીતો (`.mp3`, `.mp4`), અથવા પર્સનલ બેકઅપ સ્ટોર કરવા લાગે છે. ફાઇલ સ્ક્રીનિંગ આને તાત્કાલિક અટકાવી દે છે:

1. FSRM કન્સોલમાં જાઓ: #hl-yellow[File Screening Management -> File Screens].
2. 'Create File Screen...' પર ક્લિક કરો.
3. File screen path: `C:\Shares\` પસંદ કરો.
4. 'Block Audio and Video Files' ટેમ્પ્લેટ પસંદ કરો (જેમાં `*.mp3`, `*.mp4`, `*.avi`, `*.mkv`, `*.wav` પહેલેથી વ્યાખ્યાયિત હોય છે).
5. Screening Type માં #mark-yellow[Active screening: Do not allow users to save unauthorized files] પસંદ કરો.
6. 'Create' દબાવો. હવે જો કોઈ વપરાશકર્તા તે ફોલ્ડરમાં MP3 કે MP4 ફાઇલ કોપી કરવાનો પ્રયાસ કરશે, તો વિન્ડોઝ તરત જ #hl-orange['Access is Denied'] નો ડાયલોગ દર્શાવીને ફાઇલને સેવ થતી અટકાવી દેશે!

#v(6pt)

=== 10.7 ઓટોમેટેડ સ્ટોરેજ વપરાશ રિપોર્ટ્સ (Storage Reports Management)
FSRM એડમિનિસ્ટ્રેટરને સ્ટોરેજના ઓડિટ રિપોર્ટ્સ આપમેળે ઇમેઇલ કરવાની સુવિધા આપે છે:
- #text(weight: "bold")[Duplicate Files Report:] ડિસ્ક પર એક જ ફાઇલની ડુપ્લિકેટ નકલો શોધીને મૂલ્યવાન સ્ટોરેજ બચાવે છે.
- #text(weight: "bold")[Large Files Report:] 500 MB કરતાં મોટી ફાઇલોની યાદી બહાર પાડે છે.
- #text(weight: "bold")[Least Recently Accessed Files:] તે જૂની ફાઇલો જે 1 વર્ષથી કોઈએ ખોલી નથી (આર્કાઇવ કરવા યોગ્ય).

#v(8pt)

// =============================================================================
// CHAPTER 10 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  વિન્ડોઝ સર્વરમાં એક અદભુત ફીચર છે જેને #hl-yellow[Volume Shadow Copies (#hl-green[VSS] / Previous Versions)] કહેવામાં આવે છે. જો કોઈ કર્મચારી ભૂલથી 5 કલાકની મહેનતવાળી Excel ફાઇલ ડિલીટ કરી દે અથવા ઓવરરાઇટ કરી દે, તો એડમિનિસ્ટ્રેટરને બેકઅપ ટેપ શોધવાની જરૂર પડતી નથી! કર્મચારી ફાઇલ પર રાઇટ-ક્લિક કરીને #hl-green['Restore previous versions'] પર ક્લિક કરે છે અને સવારે 9:00 વાગ્યાની સુરક્ષિત નકલ એડમિનની મદદ વિના જાતે જ રિસ્ટોર કરી લે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 10 સ્વાધ્યાય બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "જો કોઈ શેર્ડ ફોલ્ડર પર Share Permission 'Read' હોય અને NTFS Permission 'Full Control' હોય, તો નેટવર્કથી જોડાતા વપરાશકર્તાની અસરકારક પરવાનગી (Effective Permission) શું હશે?",
  optA: "Full Control",
  optB: "Modify",
  optC: "Read",
  optD: "Write Only",
  ans: "C",
  exp: "અસરકારક પરવાનગીનો નિયમ છે: Share અને NTFS માંથી જે સૌથી વધુ પ્રતિબંધાત્મક (Most Restrictive) હોય, તે જ લાગુ થાય છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "FSRM માં તે ક્વોટા પ્રકારને શું કહેવાય છે જે નિર્ધારિત મર્યાદા સુધી પહોંચતાં જ વપરાશકર્તાને આગળ ફાઇલો સેવ કરતાં સંપૂર્ણપણે અટકાવી દે છે?",
  optA: "Soft Quota",
  optB: "Hard Quota",
  optC: "Dynamic Quota",
  optD: "Elastic Quota",
  ans: "B",
  exp: "Hard Quota મર્યાદા વટાવતાં જ 'Disk is full' એરર આપીને રાઇટ ઑપરેશનને 100% બ્લોક કરી દે છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "કંપનીના શેર્ડ ફોલ્ડરમાં કર્મચારીઓ દ્વારા MP3 ગીતો અને MP4 ફિલ્મો સેવ થતી અટકાવવા માટે FSRM ના કયા ફીચરનો ઉપયોગ થાય છે?",
  optA: "Storage Spaces",
  optB: "File Screening Management",
  optC: "DNS Scavenging",
  optD: "Shadow Copies",
  ans: "B",
  exp: "File Screening પદ્ધતિ પ્રતિબંધિત ફાઇલ એક્સટેન્શન (.mp3, .mp4, .exe) ને સ્ટોરેજમાં સેવ થતાં અટકાવે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "વિન્ડોઝ સર્વરમાં File Server Resource Manager કન્સોલ સીધું ખોલવાનો સત્તાવાર રન કમાન્ડ કયો છે?",
  optA: "diskmgmt.msc",
  optB: "fsrm.msc",
  optC: "storagemgmt.msc",
  optD: "fsmgmt.msc",
  ans: "B",
  exp: "fsrm.msc સીધું File Server Resource Manager કન્સોલ ખોલે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "વિન્ડોઝ સર્વર 2025 માં ફાઇલ શેરિંગ (SMB 3.1.1) ડિફૉલ્ટ રૂપે કયા પ્રમાણભૂત નેટવર્ક પોર્ટ પર કાર્ય કરે છે?",
  optA: "TCP પોર્ટ 80",
  optB: "TCP પોર્ટ 445",
  optC: "TCP પોર્ટ 3389",
  optD: "UDP પોર્ટ 53",
  ans: "B",
  exp: "SMB (Server Message Block) ફાઇલ શેરિંગ સત્તાવાર રીતે TCP પોર્ટ 445 પર કાર્ય કરે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોચના MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'શેર પરવાનગી અને NTFS પરવાનગીમાં કોણ વધુ શક્તિશાળી છે, અને પ્રોડક્શનમાં માઇક્રોસોફ્ટની સત્તાવાર ભલામણ શું છે?'",
  a: "જવાબ: નેટવર્ક એક્સેસ વખતે બંનેમાંથી જે 'સૌથી વધુ પ્રતિબંધાત્મક' (Most Restrictive) હોય તે લાગુ થાય છે. જોકે સ્થાનિક એક્સેસ પર માત્ર NTFS જ કાર્ય કરે છે. માઇક્રોસોફ્ટની સત્તાવાર શ્રેષ્ઠ ભલામણ એ છે કે શેર પરવાનગીઓને 'Authenticated Users = Change' અથવા 'Full Control' પર ખુલ્લી રાખવી, અને સુરક્ષાનું સંપૂર્ણ સૂક્ષ્મ નિયંત્રણ (Granular Control) માત્ર NTFS ACLs દ્વારા કરવું કારણ કે NTFS માં વારસો (Inheritance), માલિકી (Ownership) અને 13 વિસ્તૃત પરવાનગી સ્તરો ઉપલબ્ધ હોય છે.",
  tip: "Capgemini, Infosys અને TCS ના L1/L2 ઇન્ફ્રાસ્ટ્રક્ચર ઇન્ટરવ્યુનો આ ક્લાસિક પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'NTFS Permissions માં 'Modify' અને 'Write' પરવાનગી વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: 'Write' પરવાનગી વપરાશકર્તાને નવી ફાઇલ બનાવવાનો અને હાલની ફાઇલમાં ડેટા ઉમેરવાનો અધિકાર આપે છે, પરંતુ તે ફાઇલને 'ડિલીટ' કરી શકતો નથી. 'Modify' પરવાનગીમાં Read, Write, Execute ની સાથે-સાથે ફાઇલો અને સબ-ફોલ્ડર્સને 'ડિલીટ' કરવાનો સંપૂર્ણ અધિકાર સામેલ હોય છે.",
  tip: "આ સૂક્ષ્મ તફાવત મોટાભાગના ઉમેદવારો જાણતા નથી હોતા; સાચો ઉત્તર તમને તરત જ સ્પર્ધામાં આગળ લઈ જાય છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'FSRM માં Active Screening અને Passive Screening વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: Active Screening વપરાશકર્તાને પ્રતિબંધિત ફાઇલ (દા.ત. song.mp3) સેવ કરતાં તરત જ અટકાવી દે છે (Access Denied) અને એડમિનને ઇમેઇલ મોકલે છે. Passive Screening વપરાશકર્તાને ફાઇલ સેવ કરવા દે છે (કામ અટકાવતી નથી), પરંતુ બેકગ્રાઉન્ડમાં ઇવેન્ટ લોગ અને એડમિનને ઇમેઇલ એલર્ટ મોકલી આપે છે જેથી ઑડિટ અને મોનિટરિંગ થઈ શકે.",
  tip: "સ્ટોરેજ એડમિનિસ્ટ્રેશન અને કમ્પ્લાયન્સ રોલ્સમાં આ પ્રશ્ન વારંવાર પૂછાય છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'Volume Shadow Copies (#hl-green[VSS]) શું છે, અને તે ડિસ્ક પર કેટલી જગ્યા રોકે છે?'",
  a: "જવાબ: #hl-green[VSS] વોલ્યુમનો પોઇન્ટ-ઇન-ટાઇમ બ્લોક-લેવલ સ્નેપશોટ લે છે. તે આખી ફાઇલની નવી કૉપી બનાવતું નથી, પરંતુ માત્ર 'બદલાયેલા બ્લોક્સ' (Delta Changes) ને 'System Volume Information' માં સ્ટોર કરે છે. ડિફૉલ્ટ રૂપે તે વોલ્યુમની મહત્તમ 10% જગ્યા રોકે છે અને વપરાશકર્તાને 'Previous Versions' માંથી જાતે જ ફાઇલ રિસ્ટોર કરવાની સુવિધા આપે છે.",
  tip: "બેકઅપ અને ડેટા રિકવરીના ઇન્ટરવ્યુઝનો આ મુખ્ય પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'Access-Based Enumeration (ABE) શું છે, અને તે કર્મચારીઓ માટે શા માટે ઉપયોગી છે?'",
  a: "જવાબ: ABE એ એક ઉત્કૃષ્ટ વિન્ડોઝ ફીચર છે. તે સક્ષમ હોય ત્યારે વપરાશકર્તાને શેર્ડ ડ્રાઇવની અંદર માત્ર તે જ ફોલ્ડર્સ દેખાય છે જેના પર તેની પાસે ઓછામાં ઓછી 'Read' પરવાનગી હોય! જે ફોલ્ડર્સ પર તેની પાસે પરવાનગી નથી તે તેની સ્ક્રીન પરથી સંપૂર્ણપણે અદ્રશ્ય (Hide) થઈ જાય છે. આનાથી કર્મચારીઓમાં બિનજરૂરી ઉત્સુકતા અને 'Access Denied' ના હેલ્પડેસ્ક કૉલ્સ 90% ઘટી જાય છે.",
  tip: "સિનિયર સિસ્ટમ એડમિનિસ્ટ્રેટર રાઉન્ડમાં ABE નો વ્યવહારુ ઉપયોગ ખાસ ચકાસવામાં આવે છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 10 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - અસરકારક પરવાનગી શેર અને NTFS નો 'મોસ્ટ રેસ્ટ્રિક્ટિવ' નિયમ પાળે છે; પરવાનગીઓ હંમેશાં NTFS ACLs દ્વારા જ આપો.
      - FSRM નો Hard Quota ડિસ્ક ભરાઈ જતી અટકાવે છે અને File Screening બિન-કોર્પોરેટ ફાઇલોને (MP3/MP4) બ્લોક કરે છે.
      - #hl-green[VSS] Shadow Copies અને Access-Based Enumeration (ABE) એન્ટરપ્રાઇઝ ફાઇલ સર્વરની ઉપયોગિતા અને વપરાશકર્તા સંતોષમાં વધારો કરે છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 11: IIS 10.X WEB SERVER, SECURE FTP & REMOTE DESKTOP SERVICES (RDS)
// =============================================================================

[#metadata("ch11") <chapter-11>]

#chapter-header(
  chapter-num: "CHAPTER 11",
  category: "ભાગ 11 : વેબ એપ્લિકેશન્સ અને રિમોટ ડેસ્કટોપ સેવાઓ (IIS & RDS)",
  title: "IIS વેબ સર્વર, સિક્યોર FTP અને રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS)",
  subtitle: "IIS 10.x રોલ · આંતરિક પોર્ટલ · SSL/TLS સર્ટિફિકેટ બાઇન્ડિંગ HTTPS · સિક્યોર FTP સર્વર · રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS / VDI) આર્કિટેક્ચર"
)

=== 11.1 Internet Information Services (IIS 10.x) રોલ અને આંતરિક પોર્ટલ
દરેક બહુરાષ્ટ્રીય કંપની (MNC) તેના આંતરિક કર્મચારીઓ માટે ઇન્ટ્રાનેટ પોર્ટલ, પે-રોલ એપ્સ, ટિકિટિંગ ટૂલ્સ અને ડોક્યુમેન્ટ્સ ડિરેક્ટરી ચલાવે છે.

#mark-yellow[Internet Information Services (IIS) એ માઇક્રોસોફ્ટનું ફ્લેગશિપ વેબ અને FTP સર્વર એન્જિન છે જે વિન્ડોઝ સર્વર પર ASP.NET, PHP, HTML5 અને સુરક્ષિત વેબ સેવાઓને ઉચ્ચ ગતિ અને એન્ટરપ્રાઇઝ સુરક્ષા સાથે હોસ્ટ કરે છે.]

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/iis_rds_architecture.png", width: 55%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 11.1: IIS 10.x વેબ સર્વર અને રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS) એન્ટરપ્રાઇઝ આર્કિટેક્ચર]
]

#v(4pt)

*IIS 10.x ઇન્સ્ટોલેશન સ્ટેપ્સ:*
1. #hl-yellow[Server Manager] માં જાઓ -> #hl-green[Add Roles and Features] પર ક્લિક કરો.
2. Server Roles માં #mark-yellow[Web Server (IIS)] ચેકબોક્સ પર ટિક કરો.
3. 'Role Services' માં ખાતરી કરો કે #hl-green[Default Document], #hl-green[Directory Browsing], #hl-green[HTTP Errors], #hl-green[HTTP Redirection], અને #hl-green[FTP Server] પસંદ થયેલ છે.
4. 'Install' પર ક્લિક કરો. ઇન્સ્ટોલેશન પછી બ્રાઉઝરમાં `http://localhost/` ખોલતાં વાદળી રંગનું સત્તાવાર IIS વેલકમ પેજ પ્રદર્શિત થશે.

#v(6pt)

=== 11.2 નવી વેબસાઇટ બનાવવી, પોર્ટ બાઇન્ડિંગ્સ અને વર્ચ્યુઅલ ડિરેક્ટરી
1. Tools મેનૂમાંથી #hl-yellow[Internet Information Services (IIS) Manager] ખોલો (અથવા રનમાં ટાઇપ કરો: #mark-green[`inetmgr`]).
2. ડાબી પેનલમાં `Sites` પર રાઇટ-ક્લિક કરો -> #hl-green[Add Website...] પસંદ કરો.
3. #text(weight: "bold")[Site name:] `RTechLab-Portal`.
4. #text(weight: "bold")[Physical path:] તે ફોલ્ડર જ્યાં તમારી વેબસાઇટની HTML ફાઇલો આવેલી છે (દા.ત. `C:\inetpub\wwwroot\portal`).
5. #text(weight: "bold")[Binding:] Type: `http`, IP address: `All Unassigned` (અથવા `192.168.1.10`), Port: `80`. Host name: #hl-green[`portal.corp.rtechlab.local`].
6. 'OK' દબાવો. હવે આપણા DNS સર્વરમાં `portal` નામનો CNAME રેકોર્ડ પહેલેથી જ હોવાથી સમગ્ર નેટવર્કનું કોઈપણ કમ્પ્યુટર બ્રાઉઝરમાં `http://portal.corp.rtechlab.local` ખોલીને કંપનીના પોર્ટલ સુધી પહોંચી શકે છે!

#v(6pt)

=== 11.3 SSL/TLS HTTPS સર્ટિફિકેટ બાઇન્ડિંગ (#hl-green[Port 443])
પ્રોડક્શન વાતાવરણમાં કોઈપણ વેબ પોર્ટલ એન્ક્રિપ્શન વગર (HTTP #hl-green[Port 80]) ચલાવવામાં આવતું નથી:
- Server Certificates વિઝાર્ડમાં જઈને એન્ટરપ્રાઇઝ CA (Certificate Authority) અથવા સેલ્ફ-સાઇન્ડ સર્ટિફિકેટ જનરેટ કરો.
- Site Bindings માં જાઓ -> #hl-green[Add...] -> Type: #mark-yellow[https], Port: #hl-green[443], SSL certificate: `RTechLab-SSL-Cert` પસંદ કરીને 'OK' કરો.
- હવે વેબસાઇટ #hl-green[`https://portal.corp.rtechlab.local`] પર 256-બીટ TLS એન્ક્રિપ્શન સાથે સંપૂર્ણપણે સુરક્ષિત ચાલશે.

#v(6pt)

=== 11.4 સિક્યોર FTP સર્વર અને યુઝર આઇસોલેશન (FTP User Isolation)
જ્યારે ડેવલપર્સ અથવા બાહ્ય વેન્ડર્સને સર્વર પર મોટી ડેટા ફાઇલો અપલોડ કરવાની હોય છે, ત્યારે FTP નો ઉપયોગ કરવામાં આવે છે:
- IIS Manager માં Sites -> #hl-yellow[Add FTP Site...] પસંદ કરો.
- Authentication માં #hl-green[Basic], Authorization માં 'Specified users' (`corp\developers`) ને 'Read & Write' અધિકારો આપો.
- #text(weight: "bold", fill: rtech-navy)[User Isolation:] આ સુનિશ્ચિત કરે છે કે જ્યારે વપરાશકર્તા 'rpatel' FTP થી કનેક્ટ થાય, ત્યારે તે માત્ર પોતાના અંગત ફોલ્ડરને (`C:\FTPROOT\LocalUser\rpatel`) જ જોઈ શકે અને અન્ય કર્મચારીઓનો ડેટા તેના માટે અદ્રશ્ય રહે.

#v(6pt)

=== 11.5 રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS / VDI) આર્કિટેક્ચર
જ્યારે કોઈ કંપનીમાં 5,000 રિમોટ કર્મચારીઓ ઘરેથી કામ કરતા હોય, ત્યારે તેમને મોંઘા લેપટોપ આપવાને બદલે સર્વર પર કેન્દ્રિય વર્ચ્યુઅલ ડેસ્કટોપ પ્રદાન કરવામાં આવે છે:

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[RDS ના 5 મુખ્ય આર્કિટેક્ચરલ રોલ્સ (MNC Interview Goldmine):]\
    - #text(weight: "bold", fill: rtech-blue)[1. RD Web Access:] વેબ બ્રાઉઝર પોર્ટલ જેના દ્વારા કર્મચારીઓ પોતાના ઘરના કોઈપણ લેપટોપથી લોગિન કરીને કોર્પોરેટ RemoteApps અને ડેસ્કટોપ એક્સેસ કરી શકે છે.
    - #text(weight: "bold", fill: rtech-rose)[2. RD Gateway:] બાહ્ય ઇન્ટરનેટ પરથી આવતા RDP ટ્રાફિકને #hl-orange[HTTPS (#hl-green[Port 443])] ની અંદર એન્કેપ્સ્યુલેટ કરે છે, જેથી VPN વગર પણ ફાયરવોલ પાર કરી શકાય છે.
    - #text(weight: "bold", fill: rtech-amber)[3. RD Connection Broker:] જ્યારે કર્મચારીનું ઇન્ટરનેટ કપાઈને ફરીથી જોડાય છે, ત્યારે તે વપરાશકર્તાને તેના જૂના સક્રિય સત્ર (Active Session) સાથે પુનઃજોડાણ કરાવે છે અને સર્વર્સ પર લોડ બેલેન્સ કરે છે.
    - #text(weight: "bold", fill: rtech-emerald)[4. RD Session Host (RDSH):] તે મુખ્ય શક્તિશાળી સર્વર જે એક સાથે 50 થી 100 વપરાશકર્તાઓના ડેસ્કટોપ સત્રો અને એપ્લિકેશન્સ ચલાવે છે.
    - #text(weight: "bold", fill: rtech-navy)[5. RD Licensing Server:] ક્લાયન્ટ એક્સેસ લાયસન્સ (CALs - Per-User અથવા Per-Device) ટ્રેક અને માન્ય કરે છે.
  ]
)

#v(8pt)

// =============================================================================
// CHAPTER 11 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  IIS 10.x માં દરેક વેબસાઇટ એક સ્વતંત્ર #hl-yellow[Application Pool] હેઠળ ચાલે છે જેની પોતાની અલગ વર્કર પ્રોસેસ (`w3wp.exe`) હોય છે. જો સર્વર પર 20 વેબસાઇટ્સ ચાલતી હોય અને કોઈ એક વેબસાઇટનો કોડ ક્રેશ કે મેમરી લીક થાય, તો માત્ર તે 1 જ વેબસાઇટ બંધ થશે; બાકીની 19 વેબસાઇટ્સ કોઈપણ વિક્ષેપ વગર 100% સુચારુ રીતે ચાલુ રહેશે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 11 સ્વાધ્યાય બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "માઇક્રોસોફ્ટના Internet Information Services (IIS) કન્સોલને સીધું ખોલવાનો રન કમાન્ડ કયો છે?",
  optA: "iis.msc",
  optB: "inetmgr",
  optC: "webmgmt.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "inetmgr (Internet Information Services Manager) એ IIS નું સત્તાવાર મેનેજમેન્ટ શોર્ટકટ છે."
)

#v(2pt)

#mcq-item(
  num: "2",
  q: "IIS વેબ સર્વરમાં સુરક્ષિત એન્ક્રિપ્ટેડ HTTPS વેબસાઇટ્સ ચલાવવા માટે કયા સત્તાવાર IANA પોર્ટ નંબરનો ઉપયોગ થાય છે?",
  optA: "પોર્ટ 80",
  optB: "પોર્ટ 443",
  optC: "પોર્ટ 3389",
  optD: "પોર્ટ 8080",
  ans: "B",
  exp: "HTTP પોર્ટ 80 પર ચાલે છે જ્યારે સુરક્ષિત SSL/TLS એન્ક્રિપ્શન પોર્ટ 443 પર ચાલે છે."
)

#v(2pt)

#mcq-item(
  num: "3",
  q: "રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS) માં કયો રોલ RDP ટ્રાફિકને HTTPS (પોર્ટ 443) ની અંદર એન્કેપ્સ્યુલેટ કરીને ઇન્ટરનેટથી સુરક્ષિત એક્સેસ આપે છે?",
  optA: "RD Session Host",
  optB: "RD Gateway",
  optC: "RD Connection Broker",
  optD: "RD Licensing",
  ans: "B",
  exp: "RD Gateway બાહ્ય ઇન્ટરનેટથી RDP ઓવર HTTPS (443) ટનલ બનાવીને ફાયરવોલને સુરક્ષિત રીતે પાર કરે છે."
)

#v(2pt)

#mcq-item(
  num: "4",
  q: "IIS માં અલગ-અલગ વેબસાઇટ્સને એકબીજાના ક્રેશ થવાથી બચાવવા માટે કઈ આઇસોલેશન પદ્ધતિનો ઉપયોગ થાય છે?",
  optA: "Hyper-V VM",
  optB: "Application Pool (w3wp.exe)",
  optC: "NTFS Quota",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "Application Pools દરેક વેબ એપને સ્વતંત્ર વર્કર પ્રોસેસમાં આઇસોલેટ રાખે છે."
)

#v(2pt)

#mcq-item(
  num: "5",
  q: "FTP સર્વરમાં દરેક વપરાશકર્તાને માત્ર તેના પોતાના વિશિષ્ટ અંગત ફોલ્ડર સુધી સીમિત રાખવા માટે કયું ફીચર સક્ષમ કરવામાં આવે છે?",
  optA: "Anonymous Authentication",
  optB: "FTP User Isolation",
  optC: "Directory Browsing",
  optD: "IP Filtering",
  ans: "B",
  exp: "FTP User Isolation વપરાશકર્તાઓને અન્ય કર્મચારીઓની ડિરેક્ટરીઓ જોવાથી સંપૂર્ણપણે અટકાવે છે."
)

#v(4pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોચના MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(2pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'IIS માં Application Pool Recycle શું છે, અને તે શા માટે જરૂરી છે?'",
  a: "જવાબ: સમય જતાં વેબ એપ્લિકેશન્સમાં મેમરી લીક્સ અથવા અનકલેક્ટેડ ઓબ્જેક્ટ્સ જમા થઈ શકે છે. Application Pool Recycle અંતર્ગત IIS જૂની વર્કર પ્રોસેસ (w3wp.exe) ને યોગ્ય રીતે બંધ કરીને એક નવી ક્લીન પ્રોસેસ શરૂ કરે છે. 'Overlapped Recycling' ના કારણે વર્તમાન વપરાશકર્તાઓનું કનેક્શન તૂટ્યા વગર બેકગ્રાઉન્ડમાં મેમરી તરત જ ક્લિયર થઈ જાય છે.",
  tip: "Wipro, Cognizant અને Infosys ના વેબ સર્વર સપોર્ટ ઇન્ટરવ્યુમાં આ પ્રશ્ન વારંવાર પૂછવામાં આવે છે."
)

#v(2pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'RD Gateway અને પરંપરાગત કોર્પોરેટ VPN વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: VPN ક્લાયન્ટ લેપટોપને સમગ્ર કોર્પોરેટ નેટવર્કનો IP અસાઇન કરે છે જેથી જો લેપટોપ સંક્રમિત હોય તો આખા નેટવર્કમાં વાયરસ ફેલાઈ શકે છે. આનાથી વિપરીત RD Gateway માત્ર પોર્ટ 443 પર ચોક્કસ RDP સત્રની જ પરવાનગી આપે છે; ક્લાયન્ટ ક્યારેય કોર્પોરેટ નેટવર્ક સાથે સીધું જોડાતું નથી, માત્ર સ્ક્રીન પિક્સેલ્સ જ સ્ટ્રીમ થાય છે (Zero Trust અભિગમ).",
  tip: "આ આધુનિક સાયબર સુરક્ષા અને રિમોટ વર્ક આર્કિટેક્ચરનો શ્રેષ્ઠ ઉત્તર છે."
)

#v(2pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'એક જ IIS સર્વર અને એક જ IP એડ્રેસ પર 5 અલગ-અલગ વેબસાઇટ્સ કેવી રીતે હોસ્ટ કરી શકાય?'",
  a: "જવાબ: 'Host Headers' (અથવા Hostname Bindings) દ્વારા. IIS માં તમામ સાઇટ્સને IP 192.168.1.10 અને પોર્ટ 80 આપવામાં આવે છે, પરંતુ Host Name અલગ-અલગ રાખવામાં આવે છે (દા.ત. site1.corp.local, site2.corp.local). જ્યારે વપરાશકર્તા રિક્વેસ્ટ મોકલે છે, ત્યારે IIS HTTP હેડરમાં આવતા ડોમેન નામને જોઈને સાચી સાઇટનું વેબ પેજ પરત આપે છે.",
  tip: "વેબ હોસ્ટિંગ અને સર્વર કન્સોલિડેશનનો આ ક્લાસિક ફંડામેન્ટલ પ્રશ્ન છે."
)

#v(2pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'RDS માં Per-User CAL અને Per-Device CAL વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: Per-User CAL એક ચોક્કસ કર્મચારીને આપવામાં આવે છે પછી ભલે તે લેપટોપ, ફોન કે ઘરના પીસીથી RDS કનેક્ટ કરે (શિફ્ટ કર્મચારીઓ કે ફિલ્ડ વર્કર્સ માટે શ્રેષ્ઠ). Per-Device CAL એક ચોક્કસ કમ્પ્યુટરને આપવામાં આવે છે પછી ભલે તેના પર 24 કલાકમાં 3 અલગ-અલગ શિફ્ટના કર્મચારીઓ લોગિન કરે (કૉલ સેન્ટર કે હોસ્પિટલ રિસેપ્શન માટે શ્રેષ્ઠ).",
  tip: "લાયસન્સિંગ અને ઇન્ફ્રાસ્ટ્રક્ચર બજેટિંગના ઇન્ટરવ્યુઝનો આ મહત્વપૂર્ણ પ્રશ્ન છે."
)

#v(2pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'HTTP Error 503: Service Unavailable આવવાનું સૌથી મુખ્ય કારણ શું હોય છે?'",
  a: "જવાબ: Error 503 નું 95% કેસોમાં મુખ્ય કારણ તે વેબસાઇટ સાથે જોડાયેલ 'Application Pool' નું ક્રેશ અથવા 'Stopped' અવસ્થામાં હોવું છે (જેમ કે ખોટા સર્વિસ એકાઉન્ટ ક્રેડેન્શિયલ્સ અથવા સતત અનહેન્ડલ્ડ એક્સેપ્શન્સના કારણે રેપિડ-ફેલ પ્રોટેક્શન ટ્રિગર થવું). IIS Manager માં જઈને App Pool ને 'Start' કરવું એ આનો પ્રાથમિક ઉકેલ છે.",
  tip: "L1/L2 વેબ સપોર્ટમાં આ સૌથી સામાન્ય ટ્રબલશૂટિંગ પરિસ્થિતિ છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 11 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - IIS 10.x એન્ટરપ્રાઇઝ વેબ પોર્ટલ્સને Application Pools દ્વારા સુરક્ષિત અને આઇસોલેટેડ રાખે છે.
      - RD Gateway પોર્ટ 443 પર ભારે VPN વગર સુરક્ષિત રિમોટ વર્ક અને VDI એક્સેસ પ્રદાન કરે છે.
      - Host Headers એક જ IP અને પોર્ટ પર બહુવિધ કોર્પોરેટ વેબસાઇટ્સ ચલાવવાની સુવિધા આપે છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 12: WINDOWS SERVER 2025 NEXT-GEN FEATURES & HYBRID AZURE ARC
// =============================================================================

[#metadata("ch12") <chapter-12>]

#chapter-header(
  chapter-num: "CHAPTER 12",
  category: "ભાગ 12 : નેક્સ્ટ-જેન ફીચર્સ અને હાઇબ્રિડ ક્લાઉડ (Server 2025 Flagship & Azure)",
  title: "Windows Server 2025 નેક્સ્ટ-જેન ફીચર્સ, સ્ટોરેજ સ્પેસિસ અને હાઇબ્રિડ એઝ્યુર આર્ક",
  subtitle: "Server 2025 ના 5 ક્રાંતિકારી ફીચર્સ · હોટપેચિંગ (Zero-Reboot Live Patching) · 32KB AD DB પેજ સાઇઝ · #hl-green[ReFS] ડિડુપ્લિકેશન · #hl-orange[SMB over QUIC] · #hl-green[Azure Arc] સંકલન"
)

=== 12.1 Windows Server 2025 ના 5 સૌથી મોટા ક્રાંતિકારી ફીચર્સ
Windows Server 2025 એ માત્ર એક સામાન્ય અપગ્રેડ નથી, પરંતુ તે છેલ્લા એક દાયકાનો સૌથી મોટો એન્ટરપ્રાઇઝ આર્કિટેક્ચરલ બદલાવ છે. માઇક્રોસોફ્ટે ઓન-પ્રિમિસિસ ડેટાસેન્ટર (On-Premises Datacenter) અને ક્લાઉડ (Cloud) વચ્ચેના અંતરને કાયમ માટે દૂર કરી દીધું છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server2025_azure_hotpatching.png", width: 56%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 12.1: Windows Server 2025 નેક્સ્ટ-જેન 5 ફ્લેગશિપ સ્તંભ — હોટપેચિંગ, 32KB AD, #hl-orange[SMB over QUIC], S2D અને Azure Arc]
]

#v(4pt)

=== 12.2 હોટપેચિંગ (#hl-yellow[Hotpatching] for Everyone) — રીબૂટ વગર લાઇવ મેમરી સિક્યોરિટી પેચ
પરંપરાગત આઇટી (IT) વિશ્વમાં સિસ્ટમ એડમિનિસ્ટ્રેટર માટે સૌથી મોટો માથાનો દુખાવો દર મહિનાનો બીજો મંગળવાર (#hl-yellow['Patch Tuesday']) હતો. પ્રોડક્શન સર્વર્સ પર સિક્યોરિટી પેચ ઇન્સ્ટોલ કર્યા પછી સર્વરને રીબૂટ (Reboot) કરવું પડતું હતું, જેના માટે રાત્રે 2:00 વાગ્યે મેન્ટેનન્સ વિન્ડો (Maintenance Window) લેવી પડતી હતી અને બેંકિંગ કે ઇ-કોમર્સ સેવાઓ બંધ કરવી પડતી હતી.

#mark-yellow[હોટપેચિંગ (#hl-yellow[Hotpatching]) એ એક ક્રાંતિકારી સુરક્ષા તકનીક છે જેના દ્વારા વિન્ડોઝ સર્વર ઓપરેટિંગ સિસ્ટમના બાઈનરી કોડ અને રનિંગ પ્રોસેસ મેમરીને ઇન-પ્લેસ પેચ કરી દેવામાં આવે છે — સર્વરને એક પણ વાર રીબૂટ કર્યા વગર!]

- #text(weight: "bold", fill: rtech-emerald)[અભૂતપૂર્વ ઉપલબ્ધતા (99.999% Uptime):] મિશન-ક્રિટિકલ ડેટાબેઝ અને #hl-yellow[એક્ટિવ ડિરેક્ટરી] સર્વર્સ આખા વર્ષ દરમિયાન એક સેકન્ડના પણ ડાઉનટાઇમ વગર સતત કાર્યરત રહે છે.
- #text(weight: "bold", fill: rtech-blue)[હોટપેચિંગ કેવી રીતે કામ કરે છે?] માઇક્રોસોફ્ટ દર ત્રિમાસિક ગાળે (3 મહિને) એક ક્યુમ્યુલેટિવ બેઝલાઇન અપડેટ જાહેર કરે છે, અને વચ્ચેના મહિનાઓમાં નાના લાઇવ-મેમરી પેચ રિલીઝ કરે છે જે તાત્કાલિક રેમ (RAM) માં સક્રિય થઈ જાય છે.

#v(6pt)

=== 12.3 32KB AD DS ડેટાબેઝ પેજ સાઇઝ — 25 વર્ષોમાં સૌથી મોટો સ્પીડ બૂસ્ટ
જેમ આપણે પ્રકરણ 01 માં જોયું, Windows 2000 Server થી લઈને Server 2022 સુધી પૂરા 25 વર્ષો સુધી #hl-yellow[એક્ટિવ ડિરેક્ટરી]ના ડેટાબેઝ (`ntds.dit`) નો બ્લોક સાઇઝ માત્ર #hl-orange[8 KB] હતો.
- Windows Server 2025 માં જ્યારે ફોરેસ્ટ અને ડોમેન ફંક્શનલ લેવલ (Functional Level) ને 'Windows Server 2025' પર પ્રમોટ કરવામાં આવે છે, ત્યારે AD ડેટાબેઝ પેજ સાઇઝને #mark-green[32 KB] પર અપગ્રેડ કરવામાં આવે છે.
- આનાથી એક જ ડિસ્ક I/O માં ચાર ગણું વધુ ડિરેક્ટરી ટ્રી લોડ થાય છે, જેના પરિણામે મોટી મલ્ટિનેશનલ સંસ્થાઓમાં LDAP સર્ચ ક્વેરીઝ અને #hl-orange[Kerberos] ટોકન જનરેશનમાં #hl-green[300% થી વધુનો વધારો] નોંધાયો છે.

#v(6pt)

=== 12.4 નેક્સ્ટ-જેન સ્ટોરેજ સ્પેસિસ ડાયરેક્ટ (S2D) અને #hl-green[ReFS] ડિડુપ્લિકેશન
- #text(weight: "bold", fill: rtech-navy)[NVMe નેટિવ એક્સિલરેશન:] Server 2025 હવે PCIe Gen 5 NVMe SSDs માટે નેટિવ કર્નલ ડ્રાઇવર્સ સાથે આવે છે, જેનાથી IOPS (Input/Output Operations Per Second) માં 70% સુધીનો વધારો થાય છે.
- #text(weight: "bold", fill: rtech-emerald)[ReFS ડિડુપ્લિકેશન અને કમ્પ્રેશન:] Resilient File System (#hl-green[ReFS]) હવે રિયલ-ટાઇમમાં સ્ટોરેજના ડુપ્લિકેટ ડેટાને ઓળખીને કમ્પ્રેસ કરે છે. જો તમારી પાસે 50 વર્ચ્યુઅલ મશીનો (VMs) હોય, તો #hl-green[ReFS] તેમના 70% ડુપ્લિકેટ OS બ્લોક્સને એક જ વાર લખીને #hl-green[60% થી 80% સ્ટોરેજ સ્પેસની તાત્કાલિક બચત] કરે છે!

#v(6pt)

=== 12.5 #hl-orange[SMB over QUIC] — VPN વગર ઇન્ટરનેટ પર સુરક્ષિત ફાઇલ શેરિંગ
પરંપરાગત SMB ફાઇલ શેરિંગ (#hl-green[Port 445]) ને ઇન્ટરનેટ સર્વિસ પ્રોવાઇડર્સ (ISPs) દ્વારા બ્લોક કરવામાં આવે છે જેથી WannaCry જેવા રેન્સમવેર ન ફેલાઈ શકે. આના કારણે રિમોટ કર્મચારીઓએ ફાઇલ સર્વર એક્સેસ કરવા માટે ધીમા અને જટિલ VPN ચાલુ કરવા પડતા હતા.

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[SMB over QUIC નો જાદુ (Zero-VPN File Access):]\
    - તે SMB ટ્રાફિકને ગૂગલ દ્વારા વિકસિત #hl-green[QUIC પ્રોટોકોલ (UDP #hl-green[Port 443])] ની અંદર એન્કેપ્સ્યુલેટ કરે છે.
    - કારણ કે UDP 443 (સ્ટાન્ડર્ડ વેબ ટ્રાફિક) વિશ્વના દરેક એરપોર્ટ, કાફે અને હોટેલના વાઇ-ફાઇ પર હંમેશા ખુલ્લું હોય છે, તેથી કર્મચારીઓ કોઈપણ VPN વગર સીધા જ `\\files.corp.rtechlab.local\Share` ખોલી શકે છે!
    - સમગ્ર ટ્રાફિક અત્યાધુનિક #hl-green[TLS 1.3] એન્ક્રિપ્શન અને મશીન સર્ટિફિકેટ્સ દ્વારા 100% સુરક્ષિત રહે છે.
  ]
)

#v(6pt)

=== 12.6 હાઇબ્રિડ ક્લાઉડ સંકલન: #hl-green[Azure Arc] કનેક્ટેડ મશીન એજન્ટ
Windows Server 2025 માં #hl-yellow[Server Manager] ની અંદર જ #hl-yellow[Azure Arc] નું નેટિવ વિજેટ આપવામાં આવ્યું છે:
- *#hl-green[Azure Arc] શું છે?* તે એક હાઇબ્રિડ બ્રિજ (Hybrid Bridge) છે. જ્યારે તમે તમારા લોકલ ફિઝિકલ અથવા વર્ચ્યુઅલ સર્વર પર `AzureConnectedMachineAgent` રન કરો છો, ત્યારે તમારું લોકલ સર્વર Microsoft Azure પોર્ટલ પર એક અધિકૃત ક્લાઉડ રિસોર્સ તરીકે દેખાવા લાગે છે.
- *કોર્પોરેટ લાભ:* તમે એક જ Azure વેબ કન્સોલથી તમારા મુંબઈ ઓફિસના ફિઝિકલ સર્વર, એમેઝોન AWS માં ચાલતી VM, અને Azure ક્લાઉડના સર્વર્સ પર એક સાથે માઇક્રોસોફ્ટ ડિફેન્ડર પોલિસીઓ, હોટપેચિંગ અને કમ્પ્લાયન્સ ઓડિટ લાગુ કરી શકો છો.

#v(8pt)

// =============================================================================
// CHAPTER 12 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  માઇક્રોસોફ્ટના ઇતિહાસમાં પ્રથમ વખત Windows Server 2025 માં #hl-yellow[નેટિવ વાઇ-ફાઇ (Native Wi-Fi Support)] અને બ્લૂટૂથ વાયરલેસ નેટવર્કિંગને આઉટ-ઓફ-ધ-બોક્સ સામેલ કરવામાં આવ્યું છે! અગાઉ સર્વર ઓએસમાં વાઇ-ફાઇ ડિસેબલ રહેતું હતું. આજના એજ કમ્પ્યુટિંગ (Edge Servers) અને રિટેલ સ્ટોર્સમાં જ્યાં લેન (LAN) કેબલ નાખવો શક્ય ન હોય, ત્યાં સર્વર સીધા જ હાઇ-સ્પીડ Wi-Fi 6E/7 સાથે કનેક્ટ થઈ શકે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 12 પ્રેક્ટિસ બહુવિકલ્પ પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "Windows Server 2025 ના કયા ક્રાંતિકારી ફીચરના કારણે રનિંગ મેમરીમાં સિક્યોરિટી પેચ લાગુ થાય છે અને સર્વરને રીબૂટ કરવું પડતું નથી?",
  optA: "Hyper-V Quick Migration",
  optB: "#hl-yellow[Hotpatching]",
  optC: "BitLocker Live",
  optD: "DirectAccess",
  ans: "B",
  exp: "#hl-yellow[Hotpatching] રનિંગ પ્રોસેસ મેમરીને ઇન-પ્લેસ પેચ કરે છે જેનાથી સર્વર રીસ્ટાર્ટ કરવાની જરૂરિયાત સમાપ્ત થઈ જાય છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "Windows Server 2025 માં #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડેટાબેઝ (ntds.dit) નો ઇન્ટરનલ પેજ સાઇઝ વધારીને કેટલો કરવામાં આવ્યો છે?",
  optA: "4 KB",
  optB: "8 KB",
  optC: "16 KB",
  optD: "32 KB",
  ans: "D",
  exp: "Server 2025 માં 25 વર્ષ પછી AD ડેટાબેઝ પેજ સાઇઝને 8 KB થી વધારીને 32 KB કરવામાં આવી છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "#hl-orange[SMB over QUIC] ફીચર રિમોટ યુઝર્સને કોર્પોરેટ VPN વગર કયા નેટવર્ક પોર્ટ અને પ્રોટોકોલ પર સુરક્ષિત ફાઇલ એક્સેસ પ્રદાન કરે છે?",
  optA: "TCP પોર્ટ 445",
  optB: "UDP પોર્ટ 443 (TLS 1.3)",
  optC: "TCP પોર્ટ 80",
  optD: "UDP પોર્ટ 53",
  ans: "B",
  exp: "#hl-orange[SMB over QUIC] ટ્રાફિકને UDP પોર્ટ 443 પર TLS 1.3 એન્ક્રિપ્શન સાથે ટ્રાન્સમિટ કરે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "ઓન-પ્રિમિસિસ લોકલ ડેટાસેન્ટરના વિન્ડોઝ સર્વર્સને માઇક્રોસોફ્ટ એઝ્યુર ક્લાઉડ પોર્ટલ સાથે સેન્ટ્રલી કનેક્ટ કરતા એજન્ટનું નામ શું છે?",
  optA: "Hyper-V Connect",
  optB: "#hl-green[Azure Arc] Connected Machine Agent",
  optC: "System Center CLI",
  optD: "ExpressRoute Agent",
  ans: "B",
  exp: "#hl-green[Azure Arc] Connected Machine Agent લોકલ સર્વર્સને Azure Resource Manager સાથે જોડે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "Windows Server 2025 માં કઈ આધુનિક ફાઇલ સિસ્ટમ હેઠળ રિયલ-ટાઇમ ડિડુપ્લિકેશન અને કમ્પ્રેશન રજૂ કરવામાં આવ્યું છે?",
  optA: "FAT32",
  optB: "exFAT",
  optC: "#hl-green[ReFS] (Resilient File System)",
  optD: "NFS v4",
  ans: "C",
  exp: "#hl-green[ReFS] (Resilient File System) માં નેક્સ્ટ-જેન ડિડુપ્લિકેશન અને કમ્પ્રેશન આપવામાં આવ્યું છે જે જંગી સ્ટોરેજ બચાવે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: '#hl-yellow[Hotpatching] થી એન્ટરપ્રાઇઝને વ્યાવસાયિક રીતે શું લાભ મળે છે?'",
  a: "ઉત્તર: વ્યાવસાયિક દ્રષ્ટિએ હોટપેચિંગ ડાઉનટાઇમને 90% થી વધુ ઘટાડે છે. 24/7 કાર્યરત હોસ્પિટલો, બેંકો અને ઇ-કોમર્સ સાઇટ્સ પર મેન્ટેનન્સ વિન્ડોઝ માટે સિસ્ટમ બંધ કરવાની જરૂર રહેતી નથી, એડમિનિસ્ટ્રેટરને વીકેન્ડ પર મોડી રાત સુધી જાગીને પેચિંગ કરવું પડતું નથી, અને રીબૂટ દરમિયાન સંભવિત બૂટ ક્રેશનું જોખમ શૂન્ય થઈ જાય છે.",
  tip: "L2/L3 ઇન્ટરવ્યુમાં વ્યાવસાયિક અસર (Business ROI) સમજાવવાથી ઘણું ઉચ્ચ રેટિંગ મળે છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: '#hl-orange[SMB over QUIC] પરંપરાગત SMB over VPN કરતાં શા માટે શ્રેષ્ઠ માનવામાં આવે છે?'",
  a: "ઉત્તર: પરંપરાગત SMB (TCP 445) હાઇ લેટન્સી વાળા ઇન્ટરનેટ કનેક્શન પર ખૂબ ધીમું કામ કરે છે (Chatty Protocol) અને સમગ્ર નેટવર્કનું VPN ટનલ બનાવવું સુરક્ષા જોખમ ઊભું કરે છે. QUIC (UDP 443) પેકેટ લોસ અને લેટન્સીને અત્યંત કુશળતાથી સંભાળે છે, કનેક્શન માઇગ્રેશનને સપોર્ટ કરે છે (વાઇ-ફાઇ પરથી 4G/5G પર સ્વિચ થવા પર પણ સેશન તૂટતું નથી), અને એન્ડ-ટુ-એન્ડ TLS 1.3 એન્ક્રિપ્ટેડ રહે છે.",
  tip: "આ આધુનિક એન્ટરપ્રાઇઝ મોબિલિટી અને હાઇબ્રિડ વર્કફોર્સનો સૌથી અદ્યતન ઉત્તર છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: '32KB AD DS ડેટાબેઝ પેજ સાઇઝ સક્ષમ કરવા માટે શું પૂર્વ-આવશ્યકતા (Prerequisite) હોય છે?'",
  a: "ઉત્તર: સમગ્ર ફોરેસ્ટ અને ડોમેનનું ફંક્શનલ લેવલ 'Windows Server 2025' હોવું અનિવાર્ય છે (એટલે કે નેટવર્કમાં કોઈ જૂનો Server 2016/2019/2022 DC હોવો જોઈએ નહીં). ત્યાર બાદ PowerShell કમાન્ડ 'Enable-ADOptionalFeature' દ્વારા 32KB ડેટાબેઝ ફીચર સક્ષમ કરવામાં આવે છે. એક વાર સક્ષમ થયા પછી તેને રોલબેક કરી શકાતું નથી.",
  tip: "માઇગ્રેશન અને અપગ્રેડ પ્રોજેક્ટ્સ સાથે જોડાયેલો આ અત્યંત ટેકનિકલ પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: '#hl-green[Azure Arc] સક્ષમ સર્વર પર Microsoft Defender for Cloud શું સુરક્ષા લાભ આપે છે?'",
  a: "ઉત્તર: તે ઓન-પ્રિમિસિસ સર્વર પર લાઇવ થ્રેટ ઇન્ટેલિજન્સ, માલવેર ડિટેક્શન, વલ્નરેબિલિટી એસેસમેન્ટ અને સીઆઇએસ (CIS) સુરક્ષા ધોરણોના પાલનનો રિયલ-ટાઇમ રિપોર્ટ Azure ક્લાઉડ ડેશબોર્ડ પર આપે છે. જો લોકલ સર્વર પર કોઈ બ્રૂટ-ફોર્સ કે રેન્સમવેર પ્રવૃત્તિ થાય, તો ક્લાઉડ તાત્કાલિક સુરક્ષા એલર્ટ જારી કરે છે.",
  tip: "સિક્યોરિટી ઓપરેશન્સ (SOC) અને હાઇબ્રિડ ક્લાઉડ સપોર્ટમાં આ પ્રશ્ન પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'Next-Gen #hl-yellow[Storage Spaces Direct] (S2D) માં NVMe ડ્રાઇવ્સનો શું ઉપયોગ છે?'",
  a: "ઉત્તર: S2D ક્લસ્ટરમાં સર્વરના લોકલ NVMe SSDs ને એક શેર્ડ વર્ચ્યુઅલ SAN સ્ટોરેજ પૂલમાં જોડી દેવામાં આવે છે. PCIe Gen 5 બસ દ્વારા ડેટા સીધો રેમ અને સીપીયુ કેશની નજીક ટ્રાન્સફર થાય છે, જેનાથી પરંપરાગત મોંઘા SAN સ્ટોરેજ બોક્સ (Dell EMC / NetApp) ની જરૂરિયાત સમાપ્ત થઈ જાય છે અને કરોડો રૂપિયાનો હાર્ડવેર ખર્ચ બચે છે.",
  tip: "HCI (Hyper-Converged Infrastructure) અને વર્ચ્યુઅલાઇઝેશન સ્પેશિયાલિસ્ટ રાઉન્ડનો મુખ્ય પ્રશ્ન."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 12 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - #hl-yellow[Hotpatching] રીબૂટ વગર લાઇવ મેમરી પેચિંગ આપીને 99.999% સર્વર અપટાઇમ સુનિશ્ચિત કરે છે.
      - SMB over QUIC પોર્ટ 443 પર VPN વગર સુરક્ષિત રિમોટ ફાઇલ શેરિંગ સક્ષમ બનાવે છે.
      - 32KB AD DB અને Azure Arc વિન્ડોઝ સર્વર 2025 ને વિશ્વનું સૌથી ઝડપી હાઇબ્રિડ ક્લાઉડ ઓએસ બનાવે છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 13: BACKUP, DISASTER RECOVERY & ACTIVE DIRECTORY RECYCLE BIN
// =============================================================================

[#metadata("ch13") <chapter-13>]

#chapter-header(
  chapter-num: "CHAPTER 13",
  category: "ભાગ 13 : ડિઝાસ્ટર રિકવરી અને ડેટા સંરક્ષણ (Disaster Recovery & Backup)",
  title: "સર્વર બેકઅપ, ડિઝાસ્ટર રિકવરી અને #hl-yellow[એક્ટિવ ડિરેક્ટરી] રિસાઇકલ બિન",
  subtitle: "3-2-1 એન્ટરપ્રાઇઝ બેકઅપ વ્યૂહરચના · #hl-yellow[Windows Server Backup] · ફુલ vs સિસ્ટમ સ્ટેટ બેકઅપ · AD રિસાઇકલ બિન સક્ષમ કરવું · ડિલીટેડ યુઝરની 1-ક્લિક રિકવરી · wbadmin ઓટોમેશન"
)

=== 13.1 એન્ટરપ્રાઇઝ બેકઅપ વ્યૂહરચના: 3-2-1 નો સુવર્ણ સિદ્ધાંત
એક કુશળ સિસ્ટમ એડમિનિસ્ટ્રેટરની સાચી કસોટી ત્યારે નથી થતી જ્યારે બધું બરાબર ચાલી રહ્યું હોય, પરંતુ ત્યારે થાય છે જ્યારે ડેટાસેન્ટરમાં આગ લાગે, રેન્સમવેર હુમલો થાય, અથવા કોઈ જુનિયર એડમિન ભૂલથી આખી કંપનીનો ડિરેક્ટરી ડેટાબેઝ ડિલીટ કરી નાખે!

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/backup_disaster_recovery_flow.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 13.1: 3-2-1 એન્ટરપ્રાઇઝ બેકઅપ આર્કિટેક્ચર અને #hl-yellow[એક્ટિવ ડિરેક્ટરી] રિસાઇકલ બિન 1-ક્લિક લાઇવ રિકવરી]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[3-2-1 બેકઅપનો સુવર્ણ નિયમ (Global Industry Standard):]\
    - #text(weight: "bold", fill: rtech-blue)[3 કોપીઓ (Three Copies of Data):] તમારી પાસે તમારા ડેટાની ઓછામાં ઓછી 3 નકલો હોવી જોઈએ (1 ઓરિજિનલ પ્રોડક્શન કોપી + 2 સ્વતંત્ર બેકઅપ કોપીઓ).
    - #text(weight: "bold", fill: rtech-amber)[2 અલગ-અલગ મીડિયા (Two Different Media Types):] બેકઅપને બે અલગ-અલગ ટેક્નોલોજી પર સ્ટોર કરો (દા.ત. એક કોપી લોકલ NVMe NAS/SAN સ્ટોરેજ પર અને બીજી કોપી LTO ટેપ ડ્રાઇવ અથવા ક્લાઉડ બ્લોબ પર).
    - #text(weight: "bold", fill: rtech-rose)[1 કોપી ઓફસાઇટ (One Offsite Immutable Copy):] ઓછામાં ઓછી એક બેકઅપ કોપી ભૌગોલિક રીતે અન્ય શહેરમાં અથવા સુરક્ષિત ક્લાઉડમાં હોવી જોઈએ જે 'ઇમ્યુટેબલ' (Write Once Read Many - WORM) હોય જેથી રેન્સમવેર તેને એન્ક્રિપ્ટ ન કરી શકે.
  ]
)

#v(6pt)

=== 13.2 #hl-yellow[Windows Server Backup] ફીચર ઇન્સ્ટોલેશન
માઇક્રોસોફ્ટ વિન્ડોઝ સર્વરમાં એક ઇન-બિલ્ટ બેકઅપ સોલ્યુશન પૂરું પાડે છે:

1. #hl-yellow[Server Manager] -> #hl-green[Add Roles and Features] માં જાઓ.
2. Features સ્ક્રીન સુધી 'Next' દબાવો.
3. યાદીમાં શોધો: #mark-yellow[Windows Server Backup] ચેકબોક્સ પર ટિક કરો.
4. 'Install' પર ક્લિક કરો. આ ટૂલ GUI કન્સોલ (`wbadmin.msc`) અને પાવરફુલ કમાન્ડ-લાઇન યુટિલિટી (`wbadmin.exe`) બંને પ્રદાન કરે છે.

#v(6pt)

=== 13.3 ફુલ સર્વર બેકઅપ વિરુદ્ધ સિસ્ટમ સ્ટેટ બેકઅપ (#hl-yellow[System State Backup])
- #text(weight: "bold", fill: rtech-navy)[બેયર મેટલ રિકવરી (#hl-orange[Bare Metal Recovery] - BMR):] આખા સર્વર (C: ડ્રાઇવ, સિસ્ટમ પાર્ટીશન્સ, એપ્લિકેશન્સ અને ડેટા) નો સંપૂર્ણ બેકઅપ. જો ફિઝિકલ સર્વર હાર્ડવેર સંપૂર્ણપણે બળી જાય કે નિષ્ફળ જાય, તો નવા ખાલી સર્વર પર બૂટ ડિસ્ક લગાવીને હૂબહૂ એ જ સર્વર પાછું રીસ્ટોર કરી શકાય છે.
- #text(weight: "bold", fill: rtech-blue)[સિસ્ટમ સ્ટેટ બેકઅપ (#hl-yellow[System State Backup]):] #hl-yellow[એક્ટિવ ડિરેક્ટરી] #hl-yellow[ડોમેન કંટ્રોલર] માટે આ સૌથી મહત્વપૂર્ણ બેકઅપ છે. આમાં માત્ર એ જ ઘટકો સામેલ હોય છે જે ડિરેક્ટરીને જીવંત રાખવા માટે અનિવાર્ય છે:
  1. #hl-yellow[Active Directory Database (`ntds.dit`)]
  2. #hl-green[SYSVOL શેર્ડ ફોલ્ડર (તમામ GPOs અને સ્ક્રિપ્ટ્સ)]
  3. #hl-orange[વિન્ડોઝ સિસ્ટમ રજિસ્ટ્રી (System Registry)]
  4. #hl-green[બૂટ ફાઇલો અને સિસ્ટમ સ્ટાર્ટઅપ ફાઇલો]
  5. #hl-green[Certificate Services ડેટાબેઝ (જો AD CS ઇન્સ્ટોલ હોય)]

*કમાન્ડ-લાઇનથી સિસ્ટમ સ્ટેટ બેકઅપ લેવાની માસ્ટર કમાન્ડ:*
```cmd
wbadmin start systemstatebackup -backupTarget:E: -quiet
```

#v(6pt)

=== 13.4 #hl-yellow[એક્ટિવ ડિરેક્ટરી] રિસાઇકલ બિન (AD Recycle Bin) સક્ષમ કરવું
જૂના વિન્ડોઝ સર્વર (2003/2008) માં જો કોઈ યુઝર કે OU ભૂલથી ડિલીટ થઈ જાય, તો તેને પાછું મેળવવા માટે #hl-yellow[ડોમેન કંટ્રોલર]ને રીસ્ટાર્ટ કરીને #hl-orange[DSRM મોડ (#hl-orange[Directory Services Restore Mode])] માં લઈ જવું પડતું હતું, નેટવર્ક ડાઉન કરવું પડતું હતું, અને `ntdsutil` થી 'Authoritative Restore' કરવું પડતું હતું (ઓછામાં ઓછો 2 થી 3 કલાકનો ડાઉનટાઇમ).

#mark-yellow[એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન (AD Recycle Bin) એ એક અભૂતપૂર્વ વરદાન છે જે આકસ્મિક રીતે ડિલીટ થયેલા ઓબ્જેક્ટ્સને સર્વર રીબૂટ કર્યા વગર, કોઈપણ ડાઉનટાઇમ વગર, માત્ર 1 ક્લિકમાં લાઇવ રીસ્ટોર કરવાની સુવિધા આપે છે!]

*રિસાઇકલ બિન સક્ષમ કરવાની સત્તાવાર PowerShell કમાન્ડ:*
```powershell
Enable-ADOptionalFeature -Identity "Recycle Bin Feature" `
  -Scope ForestOrConfigurationSet -Target "corp.rtechlab.local"
```
#warning-box(title: "એકતરફી પ્રક્રિયા (Permanent Activation)")[
  એક વાર જ્યારે તમે #hl-yellow[એક્ટિવ ડિરેક્ટરી] રિસાઇકલ બિનને સક્ષમ કરી દો છો, ત્યારે તેને ફરી ક્યારેય ડિસેબલ (અક્ષમ) કરી શકાતું નથી. આ એક કાયમી અને અત્યંત સુરક્ષિત અપગ્રેડ છે.
]

#v(6pt)

=== 13.5 આકસ્મિક રીતે ડિલીટ થયેલા યુઝર અને OU નું 1-ક્લિકમાં લાઇવ રીસ્ટોરેશન
રિસાઇકલ બિન સક્ષમ થયા પછી જ્યારે પણ કોઈ યુઝર ડિલીટ થાય છે, ત્યારે તેનો ડેટા નાશ પામતો નથી પરંતુ તે #hl-yellow[`Deleted Objects`] કન્ટેનરમાં જતો રહે છે (ડિફોલ્ટ જીવનકાળ: #hl-green[180 દિવસ]):

1. #hl-yellow[Server Manager] -> Tools -> #hl-green[Active Directory Administrative Center (ADAC)] ખોલો (અથવા રનમાં ટાઇપ કરો: #mark-green[`dsac.exe`]).
2. ડાબી બાજુ તમારા ડોમેન `#text(weight: "bold")[corp (local)]` પર ક્લિક કરો.
3. સ્ક્રીન પર #mark-yellow[Deleted Objects] નામનું નવું ફોલ્ડર દેખાશે. તેના પર ડબલ-ક્લિક કરો.
4. તમને તે ડિલીટ થયેલો યુઝર દેખાશે (દા.ત. `Rahul Patel`).
5. તે યુઝર પર રાઇટ-ક્લિક કરો અને પસંદ કરો:
   - #hl-green[Restore:] યુઝર બરાબર એ જ OU (`Corporate-Departments -> HR`) માં પાછો પહોંચી જશે જ્યાં તે પહેલા હતો!
   - #hl-yellow[Restore To...:] જો મૂળ OU પણ ડિલીટ થઈ ગયું હોય, તો તમે તેને અન્ય કોઈ OU માં રીસ્ટોર કરી શકો છો.
6. *જાદુ:* યુઝરનો મૂળ પાસવર્ડ, તેની તમામ સિક્યોરિટી ગ્રુપ સદસ્યતાઓ, અને તેનો ઇન્ટરનલ SID 100% અકબંધ રહે છે! કર્મચારી તરત જ તે જ જૂના પાસવર્ડથી લોગઇન કરી શકે છે.

#v(6pt)

=== 13.6 `wbadmin` કમાન્ડ-લાઇન બેકઅપ શિડ્યુલિંગ અને ઓટોમેશન
પ્રોડક્શનમાં એડમિનિસ્ટ્રેટર દરરોજ રાત્રે 11:00 વાગ્યે સ્વચાલિત બેકઅપ માટે Windows Task Scheduler માં સ્ક્રિપ્ટ લગાવે છે:

```cmd
:: ડેઇલી અનએટેન્ડેડ સિસ્ટમ સ્ટેટ બેકઅપ સ્ક્રિપ્ટ
wbadmin enable backup -addtarget:{GUID-Storage-Drive} -schedule:23:00 -systemState -include:C:
```

#v(8pt)

// =============================================================================
// CHAPTER 13 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  જ્યારે #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં કોઈ ઓબ્જેક્ટ ડિલીટ થાય છે અને રિસાઇકલ બિન ઓન ન હોય, ત્યારે તે સંપૂર્ણપણે ભૂંસાતો નથી પરંતુ એક અર્ધ-જીવંત અવસ્થામાં જાય છે જેને #hl-yellow['Tombstone'] (કબરનો પથ્થર) કહેવામાં આવે છે. ટોમ્બસ્ટોનનો ડિફોલ્ટ જીવનકાળ 180 દિવસ હોય છે, પરંતુ તેમાં ઓબ્જેક્ટના મોટાભાગના એટ્રિબ્યુટ્સ (જેમ કે પાસવર્ડ, ગ્રુપ મેમ્બરશિપ, ફોન નંબર) સ્ટ્રિપ (દૂર) કરી દેવામાં આવે છે. AD Recycle Bin આ જ સમસ્યાનો ઉકેલ લાવીને 100% એટ્રિબ્યુટ્સને સુરક્ષિત રાખે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 13 પ્રેક્ટિસ બહુવિકલ્પ પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "એન્ટરપ્રાઇઝ ડેટા સંરક્ષણમાં વપરાતા '3-2-1 બેકઅપ નિયમ' અનુસાર ડેટાની ન્યૂનતમ કેટલી સ્વતંત્ર કોપીઓ હોવી જોઈએ?",
  optA: "માત્ર 1 કોપી",
  optB: "ઓછામાં ઓછી 2 કોપીઓ",
  optC: "ઓછામાં ઓછી 3 કોપીઓ (1 પ્રોડક્શન + 2 બેકઅપ)",
  optD: "10 કોપીઓ",
  ans: "C",
  exp: "3-2-1 નિયમ હેઠળ 3 કોપીઓ, 2 અલગ-અલગ મીડિયા પ્રકારો, અને 1 કોપી ઓફસાઇટ અનિવાર્ય છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "એક્ટિવ ડિરેક્ટરી #hl-yellow[ડોમેન કંટ્રોલર]ના '#hl-yellow[System State Backup]' માં નીચેનામાંથી કયો ઘટક સામેલ હોતો નથી?",
  optA: "Active Directory ડેટાબેઝ (ntds.dit)",
  optB: "SYSVOL ફોલ્ડર",
  optC: "સિસ્ટમ રજિસ્ટ્રી (Registry)",
  optD: "D: ડ્રાઇવ પર સંગ્રહિત યુઝરની પર્સનલ વિડિયો ફાઇલો",
  ans: "D",
  exp: "સિસ્ટમ સ્ટેટ માત્ર ઓએસ અને ડિરેક્ટરી ઘટકોનો બેકઅપ લે છે, સામાન્ય યુઝર ડેટા ફાઇલોનો નહીં."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન સક્ષમ હોય ત્યારે ભૂલથી ડિલીટ થયેલા ઓબ્જેક્ટ્સ ડિફોલ્ટ રીતે કેટલા દિવસો સુધી 'Deleted Objects' માં સુરક્ષિત રહે છે?",
  optA: "30 દિવસ",
  optB: "60 દિવસ",
  optC: "90 દિવસ",
  optD: "180 દિવસ (Deleted Object Lifetime)",
  ans: "D",
  exp: "માઇક્રોસોફ્ટ દ્વારા ડિફોલ્ટ Deleted Object Lifetime 180 દિવસ નિર્ધારિત કરવામાં આવી છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "કમાન્ડ પ્રોમ્પ્ટથી વિન્ડોઝ સર્વરનો તાત્કાલિક સિસ્ટમ સ્ટેટ બેકઅપ શરૂ કરવા માટે કઈ સત્તાવાર યુટિલિટીનો ઉપયોગ થાય છે?",
  optA: "robocopy.exe",
  optB: "wbadmin.exe",
  optC: "ntdsutil.exe",
  optD: "dcdiag.exe",
  ans: "B",
  exp: "wbadmin start systemstatebackup કમાન્ડ સિસ્ટમ સ્ટેટ બેકઅપ શરૂ કરવાનું સત્તાવાર CLI ટૂલ છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ડિલીટ થયેલા યુઝરને એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન દ્વારા 1 ક્લિકમાં રીસ્ટોર કરવા માટે કયા ગ્રાફિકલ ટૂલનો ઉપયોગ થાય છે?",
  optA: "#hl-yellow[Active Directory Users and Computers] (dsa.msc)",
  optB: "#hl-yellow[Active Directory Administrative Center] (dsac.exe)",
  optC: "#hl-yellow[Group Policy Management Console] (gpmc.msc)",
  optD: "Disk Management (diskmgmt.msc)",
  ans: "B",
  exp: "#hl-yellow[Active Directory Administrative Center] (ADAC - dsac.exe) ની અંદર 'Deleted Objects' કન્ટેનર ઉપલબ્ધ હોય છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'Authoritative Restore અને Non-Authoritative Restore વચ્ચે શું તફાવત હોય છે?'",
  a: "ઉત્તર: જ્યારે આપણે કોઈ બેકઅપમાંથી #hl-yellow[ડોમેન કંટ્રોલર]ને રીસ્ટોર કરીએ છીએ, ત્યારે ડિફોલ્ટ રીતે તે 'Non-Authoritative' હોય છે — એટલે કે રીસ્ટોર થયા પછી તે નેટવર્કના અન્ય DCs નો સંપર્ક કરે છે અને તેમની પાસે રહેલા નવીનતમ ડેટાબેઝથી પોતાની જાતને અપડેટ કરી લે છે. પરંતુ જો કોઈએ સમગ્ર ડોમેનમાંથી ભૂલથી કોઈ મહત્વપૂર્ણ OU ડિલીટ કરી નાખ્યું હોય, તો બેકઅપમાંથી તે OU ને 'Authoritative' માર્ક કરવામાં આવે છે (ntdsutil દ્વારા USN નંબર વધારીને). આનાથી અન્ય તમામ DCs તે રીસ્ટોર થયેલા ઓબ્જેક્ટને સૌથી નવો માનીને પોતાનામાં સ્વીકારી લે છે.",
  tip: "HCL, Infosys અને TCS ના L2/L3 ડિરેક્ટરી સર્વિસિસ ઇન્ટરવ્યુનો આ સૌથી નિર્ણાયક પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: '#hl-yellow[Active Directory Recycle Bin] ને સક્ષમ કર્યા પછી શું કોઈ ડિલીટ થયેલા યુઝરનો પાસવર્ડ રીસેટ કરવો પડે છે?'",
  a: "ઉત્તર: બિલકુલ નહીં! આ જ AD Recycle Bin ની સૌથી મોટી તાકાત છે. જ્યારે યુઝરને રીસ્ટોર કરવામાં આવે છે, ત્યારે તેનો પાસવર્ડ હેશ, તેનો મૂળ SID (Security Identifier), તેની તમામ સિક્યોરિટી ગ્રુપ્સની સદસ્યતા અને તેના તમામ 150+ એટ્રિબ્યુટ્સ 100% મૂળ સ્થિતિમાં પાછા આવે છે. કર્મચારી પાસવર્ડ બદલ્યા વગર તરત જ લોગઇન કરી શકે છે.",
  tip: "આ ઉત્તર સાબિત કરે છે કે તમને ટૂલના વ્યવહારુ લાભોની ઊંડી સમજ છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'ડેટાસેન્ટરમાં RTO અને RPO નો શું અર્થ થાય છે?'",
  a: "ઉત્તર: RTO (Recovery Time Objective) એ મહત્તમ સ્વીકાર્ય સમય છે જેની અંદર સિસ્ટમ ક્રેશ પછી સેવાઓને ફરી શરૂ કરવી અનિવાર્ય હોય છે (દા.ત. 2 કલાકની અંદર). RPO (Recovery Point Objective) એ મહત્તમ સ્વીકાર્ય ડેટા નુકસાન છે જેને કંપની સહન કરી શકે છે (દા.ત. જો રાત્રે 12:00 વાગ્યે બેકઅપ લેવાયો હોય અને બપોરે 2:00 વાગ્યે ક્રેશ થાય, તો 14 કલાકનો RPO ડેટા લોસ થયો). એડમિનિસ્ટ્રેટરનું લક્ષ્ય RTO અને RPO ને લઘુત્તમ રાખવાનું હોય છે.",
  tip: "ડિઝાસ્ટર રિકવરી અને સર્વિસ લેવલ એગ્રીમેન્ટ (SLA) નો આ મુખ્ય પાયાનો પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'શું આપણે એક્ટિવ ડિરેક્ટરી બેકઅપને એ જ ડ્રાઇવ પર સેવ કરી શકીએ છીએ જેના પર C: વિન્ડોઝ ઇન્સ્ટોલ હોય?'",
  a: "ઉત્તર: ના, #hl-yellow[Windows Server Backup] ક્યારેય સિસ્ટમ સ્ટેટ બેકઅપને એ જ વોલ્યુમ (C:) પર સ્ટોર કરવાની પરવાનગી આપતું નથી જેના પર ઓપરેટિંગ સિસ્ટમ પોતે ચાલી રહી હોય. આ માટે એક અલગ સમર્પિત ભૌતિક/વર્ચ્યુઅલ ડિસ્ક (દા.ત. E: ડ્રાઇવ અથવા નેટવર્ક શેર) હોવી અનિવાર્ય છે.",
  tip: "પ્રેક્ટિકલ અમલીકરણ અને લેબ અનુભવ તપાસતો આ સચોટ પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'જો #hl-yellow[Active Directory Recycle Bin] ફીચરને એક વાર સક્ષમ કરી દેવામાં આવે, તો શું તેને પાછળથી બંધ કરી શકાય?'",
  a: "ઉત્તર: ના, માઇક્રોસોફ્ટના સત્તાવાર નિયમો અનુસાર Recycle Bin ફીચરનું એક્ટિવેશન એક 'એકતરફી કાયમી પ્રક્રિયા' (Irreversible Process) છે. એક વાર ફોરેસ્ટમાં સક્ષમ થયા પછી તેને ક્યારેય ડિસેબલ કરી શકાતું નથી.",
  tip: "માઇક્રોસોફ્ટ સર્ટિફિકેશન અને ટેકનિકલ ઇન્ટરવ્યુ માટેનો આ પ્રમાણભૂત પ્રશ્ન છે."
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ બેકઅપ અને રિકવરી ટ્રબલશૂટિંગ માર્ગદર્શિકા (Disaster Recovery Quick Guide):]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-rose)[ભૂલ 1: 'The backup target volume is invalid':] વિન્ડોઝ સર્વર ક્યારેય એ જ C: ડ્રાઇવ પર બેકઅપની મંજૂરી આપતું નથી જેના પર OS હોય; બેકઅપ માટે હંમેશા સમર્પિત E: ડ્રાઇવ અથવા નેટવર્ક શેરનો ઉપયોગ કરો.
      - #text(weight: "bold", fill: rtech-amber)[ભૂલ 2: '#hl-green[VSS] Writer timed out (Event ID 8229)':] વોલ્યુમ શેડો કોપી સર્વિસમાં અન્ય બેકઅપ એજન્ટના સંઘર્ષને કારણે થાય છે; `vssadmin list writers` ચલાવીને સ્થિતિ તપાસો.
      - #text(weight: "bold", fill: rtech-emerald)[ભૂલ 3: 'Recycle Bin Deleted Objects ફોલ્ડર દેખાતું નથી':] #hl-yellow[Active Directory Administrative Center] (ADAC) ને બંધ કરીને ફરી ખોલો અથવા F5 દબાવીને રિફ્રેશ કરો.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ પ્રકરણ 13 ચકાસણી ચેકલિસ્ટ (Disaster Recovery Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] #hl-yellow[Windows Server Backup] ફીચર અને PowerShell મોડ્યુલ સફળતાપૂર્વક ઇન્સ્ટોલ કરેલા છે.
      - [ ] #hl-yellow[Active Directory Recycle Bin] ફીચર સમગ્ર ફોરેસ્ટમાં કાયમી ધોરણે સક્ષમ કરેલ છે.
      - [ ] ટેસ્ટ યુઝરને ડિલીટ કરીને ADAC ના 'Deleted Objects' માંથી 1 ક્લિકમાં લાઇવ રીસ્ટોર ચકાસાયેલ છે.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 13 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - 3-2-1 બેકઅપ સિદ્ધાંત એન્ટરપ્રાઇઝ ડેટા સુરક્ષાનો આંતરરાષ્ટ્રીય પાયો છે.
      - #hl-yellow[System State Backup] #hl-yellow[ડોમેન કંટ્રોલર]ના મુખ્ય ઘટકો (`ntds.dit`, `SYSVOL`, Registry) ને સુરક્ષિત રાખે છે.
      - #hl-yellow[Active Directory Recycle Bin] આકસ્મિક ડિલીટ થવા પર સર્વર રીબૂટ વગર 1-ક્લિક લાઇવ રિકવરી પ્રદાન કરે છે.
    ]
  ]
)

#pagebreak()

// =============================================================================
// CHAPTER 14: TOP 50 MNC SYSADMIN PLACEMENT VAULT & CAREER BLUEPRINT
// =============================================================================

[#metadata("ch14") <chapter-14>]

#chapter-header(
  chapter-num: "CHAPTER 14",
  category: "ભાગ 14 : કોર્પોરેટ પ્લેસમેન્ટ અને ઇન્ટરવ્યુ વોલ્ટ (Placement Engine)",
  title: "ટોપ 50 MNC સિસ્ટમ એડમિનિસ્ટ્રેટર પ્લેસમેન્ટ વોલ્ટ અને L1/L2 ઇન્ટરવ્યુ દ્રશ્યો",
  subtitle: "L1/L2 દૈનિક જવાબદારીઓ અને ટિકિટિંગ ટૂલ્સ (ServiceNow, Jira) · TCS, Wipro, Infosys, Cognizant ના 50 વાસ્તવિક ઇન્ટરવ્યુ પ્રશ્નો અને ઉકેલો · સેલરી નેગોશિયેશન બ્લૂપ્રિન્ટ"
)

=== 14.1 L1/L2 સિસ્ટમ એડમિનિસ્ટ્રેટરની દૈનિક જવાબદારીઓ અને ટિકિટિંગ ટૂલ્સ
જ્યારે તમે TCS, Wipro, Infosys, HCL, Cognizant અથવા Accenture જેવી મલ્ટિનેશનલ કંપનીઓમાં L1/L2 સિસ્ટમ એડમિનિસ્ટ્રેટર અથવા Windows Server Support Engineer તરીકે જોડાવ છો, ત્યારે તમારું દૈનિક કાર્ય ITIL (Information Technology Infrastructure Library) ફ્રેમવર્ક અને ટિકિટિંગ ટૂલ્સ (#hl-yellow[ServiceNow], #hl-yellow[Jira Service Management], અથવા #hl-yellow[Remedy]) દ્વારા સંચાલિત થાય છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/sysadmin_career_matrix.png", width: 45%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 14.1: RTechLab એન્ટરપ્રાઇઝ સિસ્ટમ એડમિનિસ્ટ્રેટર કરિયર રોડમેપ, અનુભવ સ્તર અને CTC ગ્રોથ લેડર]
]

#v(2pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[દૈનિક L1/L2 કાર્યભાર અને SLA મેનેજમેન્ટ (Typical Daily Workflow):]\
    - #text(weight: "bold", fill: rtech-blue)[ઇન્સિડન્ટ મેનેજમેન્ટ (P1 થી P4 ટિકિટો):]
      - P1 (Critical - 15 Min SLA): આખો #hl-yellow[ડોમેન કંટ્રોલર] ડાઉન, અથવા ફાઇલ સર્વર અનરીચેબલ.
      - P2 (High - 1 Hr SLA): કોઈ આખા વિભાગ (Finance OU) નું ઇન્ટરનેટ કે શેર ડ્રાઇવ કામ ન કરવું.
      - P3 (Medium - 4 Hr SLA): કોઈ ચોક્કસ યુઝરનું એકાઉન્ટ લોક થવું અથવા GPO ડ્રાઇવ મેપ ન થવી.
      - P4 (Low - 24 Hr SLA): નવા કર્મચારીનું AD એકાઉન્ટ ઓનબોર્ડિંગ અથવા ડિસ્ટ્રિબ્યુશન લિસ્ટમાં ઉમેરવું.
    - #text(weight: "bold", fill: rtech-emerald)[દૈનિક મોર્નિંગ ચેકલિસ્ટ (Morning Health Run):]
      - સવારે 9:00 વાગ્યે #hl-yellow[Server Manager] ડેશબોર્ડ ખોલીને તમામ સર્વર્સનું ગ્રીન હેલ્થ સ્ટેટસ તપાસવું.
      - Event Viewer માં Directory Service, DNS Server, અને System Logs માં રેડ એરર્સ (Error 1085, 1129) જોવા.
      - રાત્રિના સિસ્ટમ સ્ટેટ બેકઅપના સફળ સ્ટેટસ (`wbadmin` / Veeam) ની પુષ્ટિ કરવી.
  ]
)

#v(1.5pt)

=== 14.2 ટોપ MNC L1/L2 સિસ્ટમ એડમિનિસ્ટ્રેટર દ્રશ્ય પ્રશ્નોત્તરી વોલ્ટ
ઇન્ટરવ્યુઅર ક્યારેય માત્ર વ્યાખ્યાઓ પૂછતા નથી, તેઓ વાસ્તવિક મુશ્કેલી નિવારણ દ્રશ્યો (Troubleshooting Scenarios) આપે છે:

1. #text(weight: "bold", fill: rtech-navy)[દ્રશ્ય 1: "સવારે 10 વાગ્યે એક સાથે 40 કર્મચારીઓના એકાઉન્ટ લોક થઈ ગયા. શું આ બ્રૂટ-ફોર્સ હુમલો છે અને તમે તેને કેવી રીતે ડાયગ્નોઝ કરશો?"]
   - *મોડેલ ઉત્તર:* "હું તરત જ PDC Emulator #hl-yellow[ડોમેન કંટ્રોલર] પર Event Viewer ખોલીશ અને 'Security Log' માં Event ID #hl-orange[4740] (A user account was locked out) ફિલ્ટર કરીશ. આ ઇવેન્ટની વિગતોમાં 'Caller Computer Name' જોવામાં આવે છે. 90% કેસોમાં આ કોઈ મોબાઈલ ફોન કે આઇપેડ પર જૂનો સેવ થયેલો પાસવર્ડ (Cached Exchange/Wi-Fi credentials) હોય છે જે વારંવાર ખોટો પાસવર્ડ મોકલીને એકાઉન્ટ લોક કરી દે છે. તે ડિવાઇસમાંથી ક્રેડેન્શિયલ્સ અપડેટ કરાવીને સમસ્યાનો ઉકેલ આવી જાય છે."

2. #text(weight: "bold", fill: rtech-navy)[દ્રશ્ય 2: "એક કર્મચારીની બદલી HR માંથી Finance વિભાગમાં થઈ છે. તેનો HR નો એક્સેસ તરત બંધ અને Finance નો એક્સેસ ચાલુ કેવી રીતે કરશો?"]
   - *મોડેલ ઉત્તર:* "અમે સીધા ફોલ્ડર પર નથી જતા. ADUC માં જઈને તે યુઝરને `GG_HR_Staff` ગ્લોબલ ગ્રુપમાંથી દૂર કરીને `GG_Finance_Staff` માં ઉમેરી દઈશું. અમારા #hl-orange[AGDLP] મોડેલના કારણે યુઝરને Finance ના તમામ જરૂરી રાઇટ્સ આપોઆપ મળી જશે અને HR ના તમામ રાઇટ્સ આપોઆપ રદ થઈ જશે."

3. #text(weight: "bold", fill: rtech-navy)[દ્રશ્ય 3: "DNS સર્વર ચાલુ છે, પરંતુ ઇન્ટરનેટની બહારની વેબસાઇટ્સ (google.com) નથી ખુલતી, માત્ર આંતરિક સાઇટ્સ ખુલે છે?"]
   - *મોડેલ ઉત્તર:* "આ સંકેત આપે છે કે આંતરિક #hl-yellow[Forward Lookup Zone] બરાબર છે, પરંતુ DNS સર્વરના #hl-yellow[Forwarders] (જેમ કે 1.1.1.1 અથવા ISP IP) ડાઉન છે અથવા ફાયરવોલ દ્વારા સર્વરથી બહાર જતો UDP પોર્ટ 53 બ્લોક છે. DNS Manager માં Forwarders ટેબ પર જઈને ટેસ્ટ ચલાવીશું."

#v(1.5pt)

=== 14.3 સેલરી નેગોશિયેશન બ્લૂપ્રિન્ટ અને MNC સિલેક્શન સિક્રેટ્સ
1. #text(weight: "bold", fill: rtech-navy)[રિઝ્યુમે પર હેન્ડ્સ-ઓન હોમ લેબ પ્રોજેક્ટ્સને હાઇલાઇટ કરો:]
   - તમારા રિઝ્યુમેમાં માત્ર 'Knowledge of Windows Server' ન લખો. તેના બદલે લખો:
     #box(fill: rgb("#F1F5F9"), radius: 3pt, inset: 4pt)[
       #text(size: 7.8pt, font: ("Consolas", "Courier New"))[
         "Architected 2-Node Windows Server 2025 Lab: Deployed Forest corp.rtechlab.local, implemented #hl-orange[AGDLP] RBAC, hardened endpoints via GPO (USB Block, Password Policy), configured DHCP 80/20 failover, and executed AD Recycle Bin instant recoveries."
       ]
     ]
2. #text(weight: "bold", fill: rtech-navy)[સેલરી એક્સપેક્ટેશન (CTC Expectations):]
   - L1 Desktop Support / SysAdmin (0-2 વર્ષ): ₹3.5 LPA થી ₹5.5 LPA
   - L2 System Administrator / Infra Specialist (2-5 વર્ષ): ₹6.5 LPA થી ₹12.0 LPA
   - L3 Infrastructure Lead / Cloud Hybrid Architect (5-8 વર્ષ): ₹14.0 LPA થી ₹24.0 LPA+

#v(2pt)

// =============================================================================
// CHAPTER 14 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  MNC ટેકનિકલ ઇન્ટરવ્યુમાં જ્યારે ઇન્ટરવ્યુઅર કોઈ એવો અઘરો સવાલ પૂછે જેનો ઉત્તર તમને ન આવડતો હોય, તો ક્યારેય જૂઠું ન બોલો કે 'તુક્કો' ન લગાવો. અનુભવી સિસ્ટમ એડમિનિસ્ટ્રેટર હંમેશા કહે છે: *"સર, મેં પ્રોડક્શનમાં આ ચોક્કસ એરરનો સામનો હજુ સુધી નથી કર્યો, પરંતુ હું Event Viewer ના Event ID, માઇક્રોસોફ્ટ લર્ન (Learn) ડોક્યુમેન્ટેશન અને dcdiag લોગ્સનો ઉપયોગ કરીને તેનું મૂળ કારણ (Root Cause) 15 મિનિટમાં શોધીને ઉકેલી શકું છું."* આ ઉત્તર તમારી પ્રામાણિકતા અને વાસ્તવિક એન્જિનિયરિંગ વિચારસરણી સાબિત કરે છે!
]

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 14 પ્રેક્ટિસ બહુવિકલ્પ પ્રશ્નો (Practice MCQs)]
#v(1.5pt)

#mcq-item(
  num: "1",
  q: "વિન્ડોઝ સિક્યોરિટી ઇવેન્ટ લોગ્સમાં 'A user account was locked out' ની ઘટનાને ટ્રેક કરવા માટે સત્તાવાર Event ID કઈ છે?",
  optA: "Event ID 4624 (Successful Logon)",
  optB: "Event ID 4625 (Failed Logon)",
  optC: "Event ID 4740 (Account Locked Out)",
  optD: "Event ID 1129 (Group Policy Failed)",
  ans: "C",
  exp: "Event ID 4740 સીધું એકાઉન્ટ લોકઆઉટની વિગતો અને કોલર કોમ્પ્યુટર નામ દર્શાવે છે."
)

#v(1.5pt)

#mcq-item(
  num: "2",
  q: "ITIL ફ્રેમવર્ક હેઠળ જો કોઈ #hl-yellow[ડોમેન કંટ્રોલર] સંપૂર્ણપણે ડાઉન થઈ જાય અને સેંકડો કર્મચારીઓ લોગઇન ન કરી શકે, તો આ ટિકિટને કઈ પ્રાથમિકતા (Priority) માં વર્ગીકૃત કરવામાં આવે છે?",
  optA: "Priority 4 (Low)",
  optB: "Priority 3 (Medium)",
  optC: "Priority 2 (High)",
  optD: "Priority 1 (P1 - Critical Outage)",
  ans: "D",
  exp: "સમગ્ર સંસ્થા અથવા મુખ્ય ઇન્ફ્રાસ્ટ્રક્ચર ઠપ થવા પર P1 (Severity 1) ઇન્સિડન્ટ જાહેર થાય છે."
)

#v(1.5pt)

#mcq-item(
  num: "3",
  q: "સફળ ડોમેન લોગઇનની ઘટનાનું ઓડિટ કરવા માટે વિન્ડોઝ સિક્યોરિટી લોગમાં કઈ સત્તાવાર Event ID નોંધાય છે?",
  optA: "Event ID 4624",
  optB: "Event ID 4625",
  optC: "Event ID 4672",
  optD: "Event ID 4720",
  ans: "A",
  exp: "Event ID 4624 સફળ લોગઇન અને Event ID 4625 નિષ્ફળ (Failed) લોગઇન દર્શાવે છે."
)

#v(1.5pt)

#mcq-item(
  num: "4",
  q: "એન્ટરપ્રાઇઝ સર્વિસ ડેસ્ક અને ઇન્સિડન્ટ મેનેજમેન્ટ માટે વૈશ્વિક સ્તરે સૌથી લોકપ્રિય કોર્પોરેટ ક્લાઉડ ટિકિટિંગ પ્લેટફોર્મ કયું છે?",
  optA: "VLC Media Player",
  optB: "ServiceNow",
  optC: "VirtualBox",
  optD: "Notepad++",
  ans: "B",
  exp: "ServiceNow વિશ્વના 80% થી વધુ ફોર્ચ્યુન 500 સાહસોમાં ITIL સર્વિસ મેનેજમેન્ટ માટે વપરાય છે."
)

#v(1.5pt)

#mcq-item(
  num: "5",
  q: "વિન્ડોઝ સર્વરમાં તમામ સક્રિય રોલ્સ, ડિરેક્ટરી રેપ્લિકેશન અને DNS જાહેરાતોનું એકંદર સ્વાસ્થ્ય તપાસવા માટેની પ્રાથમિક કમાન્ડ કઈ છે?",
  optA: "chkdsk /f",
  optB: "dcdiag /v",
  optC: "sfc /scannow",
  optD: "format c:",
  ans: "B",
  exp: "dcdiag (Domain Controller Diagnostics) તમામ આંતરિક ડિરેક્ટરી અને રોલ પરીક્ષણો ચલાવે છે."
)

#v(1.5pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(1.5pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'ServiceNow માં Incident અને Change Request (CR) વચ્ચે શું તફાવત હોય છે?'",
  a: "ઉત્તર: 'Incident' કોઈ અણધાર્યા વિક્ષેપ અથવા સેવાની નિષ્ફળતાને સુધારવા માટે બનાવવામાં આવે છે (દા.ત. યુઝરનું એકાઉન્ટ લોક થવું અથવા સર્વર બંધ થવું - જેને તાત્કાલિક ઉકેલવું પડે છે). 'Change Request' પ્રોડક્શન વાતાવરણમાં કોઈ આયોજિત ફેરફાર માટે બનાવવામાં આવે છે (દા.ત. સર્વર પર નવો પેચ લગાવવો, નવો સબનેટ ઉમેરવો, અથવા ફાયરવોલ પોર્ટ ખોલવો - જેના માટે CAB એટલે કે Change Advisory Board ની મંજૂરી આવશ્યક હોય છે).",
  tip: "કોર્પોરેટ પ્રક્રિયા અને આઇટી ગવર્નન્સનો આ પાયાનો ઇન્ટરવ્યુ પ્રશ્ન છે."
)

#v(1.5pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: '#hl-orange[Kerberos] ટિકિટની ડિફોલ્ટ જીવન અવધિ (Ticket Granting Ticket - TGT Lifetime) કેટલી હોય છે?'",
  a: "ઉત્તર: ડિફોલ્ટ રીતે #hl-orange[Kerberos] TGT ની જીવન અવધિ 10 કલાક હોય છે, અને તેને પાસવર્ડ ફરી દાખલ કર્યા વગર વધુમાં વધુ 7 દિવસ સુધી રિન્યુ કરી શકાય છે. આ પોલિસી Default Domain Policy માં #hl-orange[Kerberos] Policies હેઠળ કન્ફિગર થાય છે.",
  tip: "આ ડીપ ઓથેન્ટિકેશન આર્કિટેક્ચરનો ઉચ્ચ સ્તરનો સવાલ છે."
)

#v(1.5pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'L1 સપોર્ટમાં સૌથી વધુ આવતા 3 હેલ્પડેસ્ક કોલ્સ કયા હોય છે અને તમે તેને કેવી રીતે સંભાળો છો?'",
  a: "ઉત્તર: 1. પાસવર્ડ એક્સપાયર/એકાઉન્ટ લોકઆઉટ (ઉકેલ: ADAC/PowerShell થી અનલોક), 2. શેર ડ્રાઇવ અનરીચેબલ (ઉકેલ: નેટવર્ક કેબલ, DNS ping અને `net use` મેપિંગ તપાસવું), 3. ઇન્ટરનેટ/વેબસાઇટ ન ખુલવી (ઉકેલ: `ipconfig /flushdns` અને પ્રોક્સી સેટિંગ્સ રીસેટ કરવી).",
  tip: "આ ઉત્તર સાબિત કરે છે કે તમે પહેલા જ દિવસથી ડેસ્કટોપ સપોર્ટની જવાબદારી સંભાળવા માટે તૈયાર છો."
)

#v(1.5pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'જો કોઈ નવો યુઝર બનાવવામાં આવે અને તે ક્લાયન્ટ પર લોગઇન કરે ત્યારે 'User profile cannot be loaded' એરર આવે, તો શું કરશો?'",
  a: "ઉત્તર: આ એરર ત્યારે આવે છે જ્યારે ક્લાયન્ટ મશીનના `C:\Users\Default` ફોલ્ડરની પરવાનગીઓ કરપ્ટ હોય, ડિસ્કમાં સ્પેસ ન હોય, અથવા રજિસ્ટ્રીમાં `ProfileList` ની `.bak` કીઝ અટવાયેલી હોય. ક્લાયન્ટ પર એડમિન તરીકે લોગઇન કરીને રજિસ્ટ્રીમાં `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList` માંથી કરપ્ટ SID હટાવીશું અને પ્રોફાઇલ ફરી જનરેટ કરાવીશું.",
  tip: "એડવાન્સ્ડ વિન્ડોઝ ડેસ્કટોપ ટ્રબલશૂટિંગનો આ ક્લાસિક પ્રશ્ન છે."
)

#v(1.5pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'તમે અમારી સંસ્થા માટે એક ઉત્કૃષ્ટ સિસ્ટમ એડમિનિસ્ટ્રેટર કેમ સાબિત થશો?'",
  a: "ઉત્તર: કારણ કે મારી પાસે માત્ર પુસ્તકીય થિયરી નથી, પરંતુ મેં પોતાના હાથે Windows Server 2025 ની સંપૂર્ણ એન્ટરપ્રાઇઝ લેબ તૈયાર કરી છે. હું Active Directory, GPO, DNS, DHCP, #hl-orange[FSRM] અને હાઇબ્રિડ આર્કિટેક્ચરના ઊંડાણને સમજું છું, PowerShell દ્વારા ઓટોમેશન કરી શકું છું, અને ITIL ધોરણો અનુસાર સમયસર ટિકિટો ઉકેલવા માટે પ્રતિબદ્ધ છું.",
  tip: "આ આત્મવિશ્વાસપૂર્ણ ઉત્તર તમારી પસંદગીને સુનિશ્ચિત કરે છે."
)

#v(2pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 14 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - L1/L2 સિસ્ટમ એડમિનિસ્ટ્રેટર ટિકિટિંગ ટૂલ્સ (ServiceNow) અને ITIL પ્રક્રિયાઓના આધારે ઇન્ફ્રાસ્ટ્રક્ચરનું રક્ષણ કરે છે.
      - Event ID 4740 (Lockout) અને 4624 (Logon) દૈનિક સુરક્ષા ઓડિટિંગની બે સૌથી મહત્વપૂર્ણ આંખો છે.
      - વ્યવહારુ લેબ અનુભવ અને સમસ્યા-નિવારણની વૈજ્ઞાનિક વિચારસરણી જ MNC માં ઉચ્ચ પેકેજનું રહસ્ય છે.
    ]
  ]
)

#pagebreak()


// =============================================================================
// APPENDIX: RTECHLAB SYSTEMS & INFRASTRUCTURE ACADEMY & AUTHOR DEDICATION
// =============================================================================
[#metadata("app") <appendix-academy>]

#align(center)[
  #v(10pt)
  #text(size: 22pt, weight: "black", fill: rtech-navy)[RTechLab Systems & Infrastructure Academy]
  #v(1.5pt)
  #text(size: 10pt, weight: "bold", fill: rtech-blue)[Universal Technical Education · Hardware to Enterprise Cloud]
  #v(2pt)
  #line(length: 60%, stroke: 1.2pt + rgb("#0284C7"))
]

#v(10pt)

#grid(
  columns: (auto, 1fr),
  gutter: 16pt,
  align: (top, left),
  [
    #block(
      stroke: 2pt + rtech-blue,
      radius: 6pt,
      clip: true,
      [
        #image("../02_BRAND_ASSETS/rahul-patel.jpg", width: 44mm)
      ]
    )
    #v(2pt)
    #align(center)[
      #text(size: 9.5pt, weight: "black", fill: rtech-navy)[રાહુલ પટેલ (Rahul Patel)]\
      #text(size: 7.2pt, fill: rtech-muted)[ચીફ ટેકનોલોજી આર્કિટેક્ટ\
      સ્થાપક, RTechLab Publications]
    ]
  ],
  [
    #text(size: 11.5pt, weight: "black", fill: rtech-navy)[પ્રિય વિદ્યાર્થી અને ભાવિ એન્ટરપ્રાઇઝ સિસ્ટમ લીડર,]
    
    #v(5pt)
    #text(size: 8.8pt, fill: rtech-text)[
      અભિનંદન! જો તમે આ અંતિમ પૃષ્ઠ સુધી પહોંચ્યા છો, તો તમે માત્ર એક પુસ્તક વાંચ્યું નથી, પરંતુ ભારતના સૌથી વ્યવહારુ, ઊંડાણપૂર્વકના અને આધુનિક #hl-yellow[Microsoft Windows Server 2025 & Active Directory] ના સંપૂર્ણ અભ્યાસક્રમને તમારા પોતાના હાથે પૂર્ણ કર્યો છે.

      જ્યારે અમે RTechLab Academy ની શરૂઆત કરી હતી, ત્યારે અમારો એકમાત્ર ઉદ્દેશ્ય એ હતો કે દેશના કોઈપણ શહેર કે ગામડાના વિદ્યાર્થીને સિસ્કો નેટવર્કિંગ અને વિન્ડોઝ સર્વર શીખવા માટે ₹40,000 ના મોંઘા કોચિંગ કે અંગ્રેજીના બોજ આગળ ઝૂકવું ન પડે. આજે તમારી આ હેન્ડબુકમાં એ બધું જ સમાયેલું છે જે વિશ્વની અગ્રણી MNCs (TCS, Wipro, Infosys, Cognizant, Microsoft) ના L1/L2 ઇન્ફ્રાસ્ટ્રક્ચર સપોર્ટ અને સિસ્ટમ એડમિનિસ્ટ્રેટર માટે જરૂરી છે.

      યાદ રાખો: એક સાચો સિસ્ટમ એડમિનિસ્ટ્રેટર માત્ર બટન દબાવનાર ઓપરેટર નથી હોતો, પરંતુ તે એ સમગ્ર ડિજિટલ કરોડરજ્જુનો રક્ષક હોય છે જેના પર બેંકો, હોસ્પિટલો અને દેશનું અર્થતંત્ર ટકેલું હોય છે. સતત પ્રેક્ટિસ કરો, તમારી લેબમાં નવા પ્રયોગો કરો, અને તમારા સપનાઓને સાકાર કરો!
    ]
    #v(1.5pt)
    #align(right)[
      #text(size: 9.5pt, weight: "black", fill: rtech-navy)[— રાહુલ પટેલ (Founder & Chief Architect)]\
      #text(size: 7.5pt, font: ("Consolas", "Courier New"), fill: rtech-blue)[rahul.28e1\@gmail.com · 24x7 WhatsApp Helpline: +91 76468 92094]
    ]
  ]
)

#v(10pt)

#info-box(title: "RTechLab માસ્ટર હેન્ડબુકની 5 અનન્ય પ્રતિબદ્ધતાઓ (Why This Book Guarantees Success)")[
  - #text(weight: "bold")[1. 100% ઓરિજિનલ 2025 સ્ક્રીનશૉટ્સ:] વાસ્તવિક #hl-yellow[સર્વર મેનેજર], #hl-yellow[એક્ટિવ ડિરેક્ટરી], GPO અને DNS આર્કિટેક્ચર ફ્લો.
  - #text(weight: "bold")[2. 3-કલર સ્ટડી હાઇલાઇટર સિસ્ટમ:] #hl-yellow[પીળો (મુખ્ય સિદ્ધાંતો)], #hl-orange[નારંગી (સુરક્ષા નિયમો અને ચેતવણીઓ)], અને #hl-green[લીલો (કમાન્ડ્સ અને ક્લિક સ્ટેપ્સ)].
  - #text(weight: "bold")[3. 1-ક્લિક ઇન્ટરેક્ટિવ નેવિગેશન:] ઇન્ડેક્સના કોઈપણ પ્રકરણ પર ટેપ કરીને સીધા તે પેજ પર પહોંચો, અને હેડર પરથી 1 ટેપમાં પાછા ફરો.
  - #text(weight: "bold")[4. દરેક પ્રકરણના અંતે Did You Know અને MCQs:] સેમેસ્ટર પરીક્ષા, પ્રમાણપત્ર અને કોર્પોરેટ મૂલ્યાંકન કસોટીઓની 100% તૈયારી.
  - #text(weight: "bold")[5. ટોપ 50 MNC પ્લેસમેન્ટ વોલ્ટ:] Wipro, TCS, Infosys, Cognizant ના ટેકનિકલ ઇન્ટરવ્યુ રાઉન્ડ્સના વાસ્તવિક 50 પ્રશ્નોત્તરી.
]

#v(2pt)

#block(
  width: 100%,
  stroke: 1.5pt + rgb("#0284C7"),
  fill: rgb("#F0F9FF"),
  radius: 6pt,
  inset: (x: 12pt, y: 10pt),
  [
    #align(center)[
      #text(size: 11pt, weight: "black", fill: rtech-navy)[🎓 RTechLab સત્તાવાર વિદ્યાર્થી સહાય અને આજીવન માર્ગદર્શન 🎓]\
      #v(1.5pt)
      #text(size: 8.2pt, fill: rtech-muted)[
        જો તમને કોઈપણ લેબ પ્રેક્ટિકલ, વર્ચ્યુઅલ મશીન એરર, અથવા MNC ઇન્ટરવ્યુની તૈયારીમાં કોઈ પણ મુશ્કેલી આવે,\
        તો નિઃસંકોચ સીધા અમારા સત્તાવાર વોટ્સએપ નંબર પર સંપર્ક કરો. અમારી ટીમ તમારી સહાય માટે હંમેશા તત્પર છે:
      ]\
      #v(1.5pt)
      #box(
        fill: rgb("#22C55E"),
        radius: 4pt,
        inset: (x: 12pt, y: 5pt),
        text(size: 10pt, weight: "black", fill: white)[📱 WhatsApp Helpline: +91 76468 92094]
      )\
      #v(2pt)
      #text(size: 8pt, font: ("Consolas", "Courier New"), fill: rtech-navy)[Official Email: rahul.28e1\@gmail.com · Web: rtechlab.com]
    ]
  ]
)
