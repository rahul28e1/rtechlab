// =============================================================================
// RTECHLAB ETHICAL HACKING & CYBER SECURITY  DESK CHEAT SHEET (GUJARATI)
// Exactly 8 Pages · Page 1 Blank Cover Placeholder · Zero-Gap Dense Layout
// Author: Rahul Patel (Founder & Systems Architect, RTechLab)
// =============================================================================

#set document(
  title: "Ethical Hacking & Cyber Security  Desk Cheat Sheet (Gujarati)",
  author: "Rahul Patel · RTechLab Publications"
)

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 8.5mm, bottom: 7.5mm, left: 8.5mm, right: 8.5mm),
  background: context {
    let p = counter(page).get().first()
    if p > 1 [
      #place(center + horizon)[
        #rotate(-35deg)[
          #text(size: 76pt, weight: "black", fill: rgb("#0F172A0B"))[RTECHLAB]
        ]
      ]
    ]
  },
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #box(height: 11pt, baseline: 1.5pt)[#image("02_BRAND_ASSETS/rtechlab_official_badge_logo.png", height: 11pt)]
          #h(3pt)
          #text(size: 8pt, weight: "black", fill: rgb("#0F172A"))[RTECHLAB]
          #text(size: 8pt, fill: rgb("#94A3B8"))[ | ]
          #text(size: 7.5pt, weight: "bold", fill: rgb("#DC2626"))[એથિકલ હેકિંગ અને સાયબર સુરક્ષા  ચીટ શીટ (ગુજરાતી)]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Recon · Nmap · OWASP · SQLi · Wireshark · Crypto]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · રાહુલ પટેલ]
        ]
      )
      #v(1.5pt)
      #line(length: 100%, stroke: 0.6pt + rgb("#CBD5E1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#CBD5E1"))
      #v(1.5pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(size: 6.6pt, fill: rgb("#64748B"))[
            #text(fill: rgb("#DC2626"))[●] માત્ર અધિકૃત લેબમાં પ્રેક્ટિસ · ડેસ્ક પર રાખો · ફ્રી ટૂલ્સ: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.5pt),
            text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[પેજ #p / 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Nirmala UI", "Segoe UI", "Arial"),
  size: 8.7pt,
  fill: rgb("#0F172A"),
  spacing: 100%
)

#set par(
  justify: false,
  leading: 0.65em,
  first-line-indent: 0pt
)

// Brand Palette
#let rtech-navy = rgb("#0F172A")
#let rtech-blue = rgb("#0284C7")
#let rtech-emerald = rgb("#059669")
#let rtech-amber = rgb("#D97706")
#let rtech-red = rgb("#DC2626")
#let rtech-purple = rgb("#7C3AED")
#let rtech-muted = rgb("#475569")
#let dark-border = rgb("#1E293B")

// Helpers
#let hl-y(body) = box(fill: rgb("#FEF08A"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0F172A"), weight: "bold")[#body]]
#let hl-g(body) = box(fill: rgb("#DCFCE7"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#166534"), weight: "bold")[#body]]
#let hl-b(body) = box(fill: rgb("#E0F2FE"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#0369A1"), weight: "bold")[#body]]
#let hl-r(body) = box(fill: rgb("#FEE2E2"), inset: (x: 2pt, y: 0.8pt), radius: 2pt)[#text(fill: rgb("#991B1B"), weight: "bold")[#body]]
#let cmd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#94A3B8"), radius: 2pt, inset: (x: 2.5pt, y: 0.8pt))[#text(size: 6.4pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-red) = {
  v(3.5pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3.5pt + color, rest: 0.6pt + dark-border),
    radius: (right: 3pt),
    inset: (x: 6pt, y: 3.8pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 5pt,
        align: (horizon, horizon),
        [
          #box(
            fill: color,
            radius: 2pt,
            inset: (x: 4.5pt, y: 1.8pt),
            text(size: 6.5pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 8.5pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(2pt)
}

#let did-you-know(fact) = {
  v(3.5pt)
  block(
    width: 100%,
    fill: rgb("#FEFCE8"),
    stroke: (left: 3.5pt + rtech-amber, rest: 0.6pt + rgb("#FDE047")),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5pt),
    [
      #text(size: 7.4pt, weight: "black", fill: rgb("#92400E"))[💡 શું તમે જાણો છો? ]
      #text(size: 7.2pt, fill: rgb("#451A03"))[#fact]
    ]
  )
  v(1.5pt)
}

// =============================================================================
// PAGE 01: 4K FULL-BLEED COVER PAGE
// =============================================================================
#page(margin: 0pt, header: none, footer: none, background: none)[
  #image("02_BRAND_ASSETS/eh_cover_4k.png", width: 100%, height: 100%, fit: "cover")
]

// =============================================================================
// PAGE 02: ETHICAL HACKING FUNDAMENTALS, 5 PHASES & FOOTPRINTING (OSINT)
// =============================================================================

#section-banner(num: "મોડ્યુલ 01", title: "એથિકલ હેકિંગના 5 તબક્કા, CIA ટ્રાયડ અને હેકર પ્રકારો", color: rtech-red)

#align(center)[
  #box(stroke: 0.6pt + rgb("#CBD5E1"), radius: 4pt, clip: true, width: 100%)[
    #image("02_BRAND_ASSETS/eh_5phase_visual.png", width: 100%)
  ]
]
#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🛡️ સુરક્ષાના મૂળ સ્તંભો (CIA + AAA)]
      #v(2pt)
      • *Confidentiality:* એન્ક્રિપ્શન અને એક્સેસ કંટ્રોલ (ડેટા ગુપ્ત રાખો)\
      • *Integrity:* હેશિંગ (`SHA-256`) અને ડિજિટલ સિગ્નેચર (છેડછાડ નહીં)\
      • *Availability:* બેકઅપ અને DDoS સુરક્ષા (સિસ્ટમ હંમેશા ચાલુ)\
      • *AAA:* *Authentication* (કોણ?) · *Authorization* (અધિકાર?) · *Accounting* (લોગ્સ)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🎭 હેકર્સના પ્રકાર અને ટેસ્ટિંગ મોડ્સ]
      #v(2pt)
      • #hl-g[White Hat] અધિકૃત એથિકલ હેકર · #hl-r[Black Hat] દુર્ભાવનાપૂર્ણ હેકર\
      • #hl-y[Grey Hat] પરવાનગી વગર પણ બિન-હાનિકારક · #hl-b[Red/Blue/Purple]\
      • *Black Box:* શૂન્ય માહિતી · *White Box:* સંપૂર્ણ કોડ/નેટવર્ક\
      • *Grey Box:* આંશિક યુઝર એક્સેસ (સૌથી વ્યવહારિક ઓડિટ)
    ]
  ]
)

#v(2pt)
#section-banner(num: "મોડ્યુલ 02", title: "KALI LINUX ડાઉનલોડ અને ઇન્સ્ટોલેશન ગાઇડ + OSINT DORKING", color: rtech-blue)

#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.6pt, weight: "black", fill: rgb("#065F46"))[🐉 Kali Linux સુરક્ષિત ડાઉનલોડ અને ઇન્સ્ટોલ કેવી રીતે કરવું (Virtual Lab)]
  #v(2pt)
  *1. ઓફિશિયલ સાઇટ:* #link("https://www.kali.org/get-kali/")[*kali.org/get-kali*] → *Virtual Machines* (VirtualBox/VMware) પસંદ કરો (સૌથી ઝડપી!).\
  *2. SHA-256 તપાસ:* બૂટ કરતાં પહેલાં હેશ ચકાસો · ડિફોલ્ટ લોગિન: `kali`/`kali` (`passwd` થી બદલો).\
  *3. પ્રથમ અપડેટ:* #cmd("sudo apt update && sudo apt full-upgrade -y") · ટૂલ્સ: #cmd("sudo apt install -y kali-linux-large")
]

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[ટૂલ / ઓપરેટર], text(fill: white, weight: "bold")[પેસિવ અને એક્ટિવ માહિતી એકત્રિત કરવાનો હેતુ], text(fill: white, weight: "bold")[ઉદાહરણ],
  [#cmd("site:")], [Google સર્ચને માત્ર એક ટાર્ગેટ ડોમેન સુધી સીમિત કરો], [#cmd("site:target.com admin")],
  [#cmd("filetype:")], [વેબસાઇટ પર લીક થયેલી PDF, Excel, SQL કે `.env` ફાઇલ શોધો], [#cmd("site:target.com filetype:env")],
  [#cmd("inurl:") / #cmd("intitle:")], [એડમિન લોગિન પોર્ટલ, ડિરેક્ટરી લિસ્ટિંગ કે એરર પેજ શોધો], [#cmd("intitle:\"index of\" /backup")],
  [#cmd("whois") / `RDAP`], [ડોમેન રજિસ્ટ્રાર, માલિક, નેમસર્વર અને એક્સપાયરી ડેટ જુઓ], [#cmd("whois rtechlab.com")],
  [#cmd("dig") / `DNSSEC`], [`A`, `MX`, `TXT` રેકોર્ડ્સ કાઢો; DNSSEC ઓરિજિન ઓથેન્ટિકેશન આપે છે], [#cmd("dig target.com ANY")],
  [`Shodan.io`], [ઇન્ટરનેટ સાથે જોડાયેલા IoT ડિવાઇસ, વેબકેમ અને ખુલ્લા પોર્ટ્સ શોધો], [`port:3389 country:"IN"`],
  [`theHarvester`], [પબ્લિક OSINT માંથી કર્મચારીઓના ઇમેઇલ અને સબડોમેન કાઢો], [#cmd("theHarvester -d domain -b all")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🧩 જરૂરી Recon બ્રાઉઝર એક્સટેન્શન અને વેબસાઇટ્સ]
  #v(2pt)
  • *Extensions:* `Wappalyzer`, `FoxyProxy` (Burp સ્વિચ), `Shodan` · *બ્રીચ તપાસ:* #link("https://haveibeenpwned.com")[*HaveIBeenPwned.com*] · #link("https://crt.sh")[*crt.sh*]
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[Recon વેબસાઇટ], text(fill: white, weight: "bold")[એથિકલ હેકર્સ માટે ઉપયોગ (100% ફ્રી અને કાયદેસર)], text(fill: white, weight: "bold")[ડાયરેક્ટ લિંક],
  [*Have I Been Pwned*], [તપાસો કે કોઈ ઇમેઇલ કે ડોમેન ડેટા બ્રીચમાં લીક થયું છે કે નહીં], [#link("https://haveibeenpwned.com")[haveibeenpwned.com ↗]],
  [*Shodan Search*], [વિશ્વભરના પબ્લિક સર્વર્સ, વેબકેમ, રાઉટર અને ખુલ્લા પોર્ટ્સ શોધો], [#link("https://www.shodan.io")[shodan.io ↗]],
  [*crt.sh (SSL લોગ્સ)*], [પબ્લિક SSL સર્ટિફિકેટ્સ દ્વારા છુપાયેલા સબડોમેન તરત શોધો], [#link("https://crt.sh")[crt.sh ↗]],
  [*Security Headers*], [કોઈપણ વેબસાઇટના HTTP સિક્યોરિટી હેડર (`CSP`, `HSTS`) તપાસો], [#link("https://securityheaders.com")[securityheaders.com ↗]],
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[ફ્રેમવર્ક / કાયદો], text(fill: white, weight: "bold")[વૈશ્વિક અને ભારતીય સાયબર સુરક્ષા ધોરણો], text(fill: white, weight: "bold")[મુખ્ય ક્ષેત્ર],
  [*MITRE ATT&CK*], [વાસ્તવિક હુમલાખોરોની ટેકનિક અને વ્યૂહરચના (TTPs) નો જ્ઞાનકોશ], [થ્રેટ મોડેલિંગ],
  [*OWASP Top 10*], [વેબ એપ્લિકેશન અને API સુરક્ષા જોખમોનું માનક દસ્તાવેજ], [વેબ/API ઓડિટ],
  [*ISO 27001 / NIST*], [એન્ટરપ્રાઇઝ માહિતી સુરક્ષા વ્યવસ્થાપન (ISMS) અને જોખમ માળખું], [ગવર્નન્સ],
  [*IT Act 2000 (ભારત)*], [કલમ 43/66 (હેકિંગ), 66C (ઓળખ ચોરી), 66F (સાયબર આતંકવાદ)], [કાયદાકીય પાલન],
)

#did-you-know[
  *Passive Footprinting* માં ટાર્ગેટ સર્વરને એક પણ પેકેટ મોકલ્યા વગર (`WHOIS`, `Shodan`, `Google Dorks`) માહિતી મેળવાય છે, જ્યારે *Active Footprinting* માં સીધો ટાર્ગેટ સાથે સંપર્ક (પિંગ કે સોશિયલ એન્જિનિયરિંગ) થાય છે!
]

#pagebreak()

// =============================================================================
// PAGE 03: NETWORK SCANNING, NMAP MASTERY & ENUMERATION
// =============================================================================

#section-banner(num: "મોડ્યુલ 03", title: "નેટવર્ક સ્કેનિંગ અને NMAP માસ્ટર ફ્લેગ્સ (મોડ્યુલ 03)", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[Nmap ફ્લેગ], text(fill: white, weight: "bold")[સ્કેન પ્રકાર અને કાર્યપદ્ધતિ], text(fill: white, weight: "bold")[કમાન્ડ],
  [#cmd("-sS")], [*Stealth SYN Scan* (`SYN` મોકલે છે, `SYN-ACK` મળતા `RST` મોકલે છે)], [#cmd("nmap -sS 10.0.0.1")],
  [#cmd("-sT")], [*TCP Connect Scan* (સંપૂર્ણ 3-વે હેન્ડશેક; ટાર્ગેટ લોગ્સમાં નોંધાય છે)], [#cmd("nmap -sT 10.0.0.1")],
  [#cmd("-sU")], [*UDP Scan* (ધીમું સ્કેન; DNS `53`, SNMP `161`, DHCP `67` તપાસે છે)], [#cmd("nmap -sU -p 53,161 ip")],
  [#cmd("-sV") / #cmd("-O")], [સર્વિસ વર્ઝન ઓળખ (Banner Grab) અને OS ફિંગરપ્રિન્ટિંગ], [#cmd("nmap -sV -O 10.0.0.1")],
  [#cmd("-A") / #cmd("-p-")], [એગ્રેસિવ સ્કેન (OS+Ver+Scripts) / બધા 65,535 પોર્ટ્સ સ્કેન કરો], [#cmd("nmap -A -p- 10.0.0.1")],
  [#cmd("-sn") / #cmd("-Pn")], [પિંગ સ્વીપ (પોર્ટ સ્કેન વગર) / હોસ્ટ ડિસ્કવરી સ્કિપ કરો], [#cmd("nmap -sn 192.168.1.0/24")],
  [#cmd("--script vuln")], [જાણીતા CVEs શોધવા Nmap સ્ક્રિપ્ટિંગ એન્જિન (NSE) ચલાવો], [#cmd("nmap --script vuln ip")],
  [#cmd("-f") / #cmd("-D RND:5")], [IDS બાયપાસ: પેકેટ ફ્રેગમેન્ટ કરો / 5 નકલી ડિકોય IP થી સ્કેન છુપાવો], [#cmd("nmap -sS -f -D RND:5 ip")],
)

#v(2pt)
#section-banner(num: "મોડ્યુલ 04", title: "એન્યુમરેશન અને મુખ્ય અટેક પોર્ટ્સ મેટ્રિક્સ (મોડ્યુલ 04)", color: rtech-blue)

#table(
  columns: (auto, auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[પોર્ટ], text(fill: white, weight: "bold")[સર્વિસ], text(fill: white, weight: "bold")[હુમલાખોરો કઈ માહિતી કાઢે છે], text(fill: white, weight: "bold")[ટૂલ / કમાન્ડ],
  [#cmd("21")], [FTP], [અનામી લોગિન (`anonymous:anonymous`) અને પ્લેન-ટેક્સ્ટ પાસવર્ડ], [#cmd("ftp target_ip")],
  [#cmd("22")], [SSH], [બેનર વર્ઝન, નબળા પાસવર્ડ, લીક થયેલી પ્રાઇવેટ SSH કીઝ], [#cmd("ssh-audit target_ip")],
  [#cmd("25")], [SMTP], [`VRFY`, `EXPN` અને `RCPT TO` દ્વારા માન્ય ઇમેઇલ યુઝરનેમ શોધવા], [#cmd("smtp-user-enum")],
  [#cmd("53")], [DNS], [ઝોન ટ્રાન્સફર (`AXFR`) જેનાથી આંતરિક હોસ્ટનેમ અને IP લીક થાય], [#cmd("dig axfr @ns1 dom.com")],
  [#cmd("139/445")], [SMB], [શેર્ડ ફોલ્ડર, OS વર્ઝન, નલ સેશન અને EternalBlue તપાસ], [#cmd("enum4linux -a ip")],
  [#cmd("161")], [SNMP], [ડિફોલ્ટ સ્ટ્રિંગ (`public` / `private`) થી આખો નેટવર્ક મેપ], [#cmd("snmpwalk -v2c -c public ip")],
  [#cmd("389")], [LDAP], [Active Directory ના યુઝર્સ, ગ્રુપ્સ, કોમ્પ્યુટર અને GPO નીતિઓ], [#cmd("ldapsearch -x -H ldap://ip")],
  [#cmd("3389")], [RDP], [Windows રિમોટ ડેસ્કટોપ બ્રૂટ-ફોર્સ અને BlueKeep CVE તપાસ], [#cmd("xfreerdp /u:admin /v:ip")],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🔄 TCP 3-વે હેન્ડશેક અને Nmap પોર્ટ સ્ટેટસ]
      #v(2pt)
      • *Normal TCP:* `SYN` → `SYN-ACK` → `ACK`\
      • #hl-g[Open:] સર્વિસ ચાલુ · #hl-r[Closed:] બંધ · #hl-y[Filtered:] ફાયરવોલ બ્લોક
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🛡️ CVSS ગંભીરતા સ્કોર (Nessus / OpenVAS)]
      #v(2pt)
      • `0.1–3.9` Low · `4.0–6.9` Medium · `7.0–8.9` High · `9.0–10.0` *Critical*\
      • ક્રમ: શોધો → પ્રાથમિકતા આપો → સ્કેન કરો → પેચ કરો → ફરી તપાસો
    ]
  ]
)

#v(2pt)
#align(center)[
  #box(stroke: 0.6pt + rgb("#CBD5E1"), radius: 4pt, clip: true, width: 100%)[
    #image("02_BRAND_ASSETS/eh_tcp_vs_syn_visual.png", width: 100%)
  ]
]

#v(2pt)
#block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[🎯 100% કાયદેસર પ્રેક્ટિસ સ્કેન ટાર્ગેટ્સ અને Nmap સ્પીડ ટેમ્પલેટ્સ]
  #v(2pt)
  • #link("https://scanme.nmap.org")[*scanme.nmap.org*] (ઓફિશિયલ Nmap ટેસ્ટ સર્વર) · #link("http://testphp.vulnweb.com")[*testphp.vulnweb.com*] (Acunetix ટેસ્ટ એપ)\
  • *સ્પીડ:* `-T1` (IDS બાયપાસ) · `-T4` (ઝડપી લેબ) · *સેવ:* #cmd("nmap -sV -T4 -oA report 10.0.0.1")
]

#did-you-know[
  *Nmap `-sS` (Stealth SYN Scan)* રૂટ યુઝર માટે ડિફોલ્ટ હોય છે કારણ કે તે પૂરો TCP 3-વે હેન્ડશેક પૂર્ણ કરતો નથી! `SYN-ACK` મળતા જ તે `RST` મોકલી કનેક્શન તોડી નાખે છે.
]

#pagebreak()

// =============================================================================
// PAGE 04: SYSTEM HACKING, PASSWORD CRACKING, MALWARE & SOCIAL ENGINEERING
// =============================================================================

#section-banner(num: "મોડ્યુલ 05", title: "સિસ્ટમ હેકિંગ, પાસવર્ડ ક્રેકિંગ અને પ્રિવિલેજ એસ્કેલેશન", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[ટૂલ / ટેકનિક], text(fill: white, weight: "bold")[સિસ્ટમ હેકિંગ અને પોસ્ટ-એક્સપ્લોઇટેશન કાર્ય], text(fill: white, weight: "bold")[ઉદાહરણ],
  [#cmd("Hydra")], [SSH, FTP, HTTP અને RDP પર ઝડપી ઓનલાઇન બ્રૂટ-ફોર્સ અટેક], [#cmd("hydra -l root -P rockyou.txt ssh://ip")],
  [#cmd("John the Ripper")], [`/etc/shadow` અને ZIP ફાઇલ્સના ઓફલાઇન પાસવર્ડ ક્રેક કરો], [#cmd("john --wordlist=rockyou.txt hash.txt")],
  [#cmd("Hashcat")], [GPU દ્વારા અલ્ટ્રા-ફાસ્ટ ઓફલાઇન હેશ ક્રેકિંગ], [#cmd("hashcat -m 1000 ntlm.txt rockyou.txt")],
  [#cmd("Mimikatz")], [Windows RAM માંથી પ્લેન-ટેક્સ્ટ પાસવર્ડ, NTLM અને Kerberos કાઢો], [`sekurlsa::logonpasswords`],
  [#cmd("Metasploit")], [એક્સપ્લોઇટ ફ્રેમવર્ક (`msfconsole`) અને પેલોડ જનરેટર (`msfvenom`)], [#cmd("msfvenom -p linux/x64/shell_reverse_tcp")],
  [Linux PrivEsc], [`sudo -l`, SUID બાઇનરી, ક્રોન જોબ્સ અને કર્નેલ એક્સપ્લોઇટ તપાસો], [#cmd("find / -perm -4000 2>/dev/null")],
  [Windows PrivEsc], [Unquoted service paths, `AlwaysInstallElevated`, ટોકન ચોરી], [`whoami /priv` (SeImpersonate)],
  [Clearing Tracks], [હુમલાખોરો ઇવેન્ટ લોગ્સ (`wevtutil`) કે બેશ હિસ્ટ્રી (`history -c`) ભૂંસે છે], [બચાવ: રિમોટ *SIEM* લોગિંગ!],
)

#v(2pt)
#section-banner(num: "મોડ્યુલ 06", title: "મેલવેર જોખમો અને સોશિયલ એન્જિનિયરિંગ (મોડ્યુલ 07 અને 09)", color: rtech-red)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🦠 મેલવેરના પ્રકાર અને વિશ્લેષણ]
      #v(2pt)
      • *Trojan:* અસલી સોફ્ટવેરના રૂપમાં છુપાયેલો બેકડોર\
      • *Worm:* યુઝર ક્લિક વગર નેટવર્કમાં ફેલાય છે (WannaCry)\
      • *Ransomware:* ફાઇલ્સ એન્ક્રિપ્ટ કરી ખંડણી માંગે છે\
      • *Rootkit:* OS કર્નેલ (`Ring 0`) માં છુપાઈને કંટ્રોલ લે છે\
      • *Static:* `strings`, `sha256` · *Dynamic:* સેન્ડબોક્સ (`Cuckoo`)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#C2410C"))[🧠 સોશિયલ એન્જિનિયરિંગ હુમલા]
      #v(2pt)
      • *Phishing / Spear Phishing:* નકલી ઇમેઇલથી લોગિન ચોરવા\
      • *Vishing / Smishing:* ફોન કોલ અને SMS/WhatsApp OTP ફ્રોડ\
      • *Pretexting:* નકલી વાર્તા ("IT હેલ્પડેસ્ક") બનાવી પાસવર્ડ માંગવો\
      • *Tailgating:* અધિકૃત વ્યક્તિની પાછળ સુરક્ષિત રૂમમાં ઘૂસવું\
      • *Watering Hole:* ટાર્ગેટની પસંદગીની વેબસાઇટને સંક્રમિત કરવી
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[પેલોડ / શેલ], text(fill: white, weight: "bold")[Reverse Shell વિરુદ્ધ Bind Shell અને પોસ્ટ-એક્સપ્લોઇટેશન], text(fill: white, weight: "bold")[કમાન્ડ],
  [Reverse Shell], [ટાર્ગેટ *બહાર* હુમલાખોરના લિસનર સાથે જોડાય છે (ફાયરવોલ બાયપાસ!)], [#cmd("nc -lvnp 4444")],
  [Bind Shell], [ટાર્ગેટ એક પોર્ટ ખોલે છે અને હુમલાખોરના જોડાવાની રાહ જુએ છે], [#cmd("nc -lvnp 4444 -e /bin/bash")],
  [TTY અપગ્રેડ], [સાદા netcat શેલને Tab/Ctrl+C વાળા ફુલ શેલમાં બદલો], [#cmd("python3 -c 'import pty;pty.spawn(\"/bin/bash\")'")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🧪 VirusTotal અને EICAR Anti-Malware Test File (સેફ AV લેબ)]
  #v(2pt)
  • #link("https://www.virustotal.com")[*VirusTotal.com*] — શંકાસ્પદ ફાઇલ, URL કે `SHA-256` હેશને *70+ એન્ટીવાયરસ એન્જિન* થી તરત સ્કેન કરો!\
  • #link("https://www.eicar.org")[*EICAR Test File (eicar.org)*] — 100% સુરક્ષિત 68-બાઇટ ટેક્સ્ટ ફાઇલ જેનાથી અસલી વાયરસ વગર તમારા Antivirus/EDR ની ટેસ્ટિંગ કરી શકો!
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.4pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[સિક્યોરિટી સાઇટ], text(fill: white, weight: "bold")[મેલવેર વિશ્લેષણ, સેફ AV ટેસ્ટિંગ અને હેશ લુકઅપ], text(fill: white, weight: "bold")[ડાયરેક્ટ લિંક],
  [*VirusTotal*], [શંકાસ્પદ ફાઇલ/URL/હેશને એકસાથે 70+ એન્ટીવાયરસ એન્જિનથી સ્કેન કરો], [#link("https://www.virustotal.com")[virustotal.com ↗]],
  [*EICAR Test File*], [AV/EDR એલર્ટ તપાસવા માટે માનક 68-બાઇટ સુરક્ષિત એન્ટી-મેલવેર ટેસ્ટ સ્ટ્રિંગ], [#link("https://www.eicar.org")[eicar.org ↗]],
  [*ANY.RUN Sandbox*], [લાઇવ પ્રોસેસ અને નેટવર્ક વર્તન જોવા માટે ક્લાઉડ મેલવેર સેન્ડબોક્સ], [#link("https://app.any.run")[app.any.run ↗]],
  [*CrackStation*], [નબળા MD5/SHA1/NTLM પાસવર્ડ હેશ ટેસ્ટ કરવાની વિશાળ લુકઅપ ટેબલ], [#link("https://crackstation.net")[crackstation.net ↗]],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[🚀 Privilege Escalation ક્વિક ચેકલિસ્ટ (Linux અને Windows)]
  #v(2pt)
  • *Linux:* #cmd("sudo -l"), SUID (`GTFOBins`), `/etc/cron*`, કર્નેલ (`uname -a`) તપાસો.\
  • *Windows:* `whoami /priv`, `systeminfo`, unquoted service paths અને `cmdkey /list` (`WinPEAS`).
]

#did-you-know[
  *Salting* હેશ કરતાં પહેલાં દરેક યુઝરના પાસવર્ડમાં રેન્ડમ અક્ષરો ઉમેરે છે! તેથી જો બે લોકો એક જ પાસવર્ડ (`Admin@123`) રાખે, તો પણ `/etc/shadow` માં તેમના હેશ અલગ દેખાશે અને *Rainbow Table* અટેક નિષ્ફળ જશે!
]

#pagebreak()

// =============================================================================
// PAGE 05: SNIFFING, WIRESHARK, DoS/DDoS, SESSION HIJACKING & IDS EVASION
// =============================================================================

#section-banner(num: "મોડ્યુલ 07", title: "સ્નિફિંગ, WIRESHARK ફિલ્ટર્સ અને MITM હુમલા (મોડ્યુલ 08)", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[ફિલ્ટર / હુમલો], text(fill: white, weight: "bold")[પેકેટ વિશ્લેષણ અને સ્નિફિંગ હેતુ], text(fill: white, weight: "bold")[Wireshark / ટૂલ],
  [#cmd("ip.addr == 10.0.0.5")], [કોઈ ચોક્કસ IP પરથી આવતા કે જતા બધા પેકેટ્સ જુઓ], [`ip.src ==` / `ip.dst ==`],
  [#cmd("http.request")], [અનએન્ક્રિપ્ટેડ HTTP GET/POST લોગિન અને કૂકીઝ તપાસો], [`http.request.method == "POST"`],
  [#cmd("tcp.port == 443")], [HTTPS (`443`), SSH (`22`), કે DNS (`53`) ટ્રાફિક ફિલ્ટર કરો], [`udp.port == 53`],
  [#cmd("tcp.flags.syn == 1")], [SYN Flood અથવા Nmap Stealth SYN પોર્ટ સ્કેન પકડો], [`tcp.flags.reset == 1`],
  [ARP Poisoning (MITM)], [PC અને રાઉટર વચ્ચે નકલી ARP રિપ્લાય મોકલી ટ્રાફિક ઇન્ટરસેપ્ટ કરવો], [`Bettercap`, `Ettercap`],
  [MAC Flooding], [સ્વિચનું CAM ટેબલ ભરીને તેને હબની જેમ અસુરક્ષિત બનાવવું], [બચાવ: *Port Security*],
)

#v(2pt)
#section-banner(num: "મોડ્યુલ 08", title: "DoS / DDoS, સેશન હાઇજેકિંગ અને IDS / ફાયરવોલ બાયપાસ", color: rtech-amber)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[🌊 DoS અને DDoS હુમલાના પ્રકાર]
      #v(2pt)
      • *SYN Flood:* સર્વરનું હાફ-ઓપન TCP ટેબલ ભરવું (બચાવ: *SYN Cookies*)\
      • *DNS / NTP Amplification:* નાના સ્પૂફ્ડ પેકેટથી ભારે ટ્રાફિક મોકલવો\
      • *HTTP Flood (L7):* સામાન્ય વેબ ટ્રાફિક જેવો દેખાઈ ફાયરવોલ બાયપાસ\
      • *Botnet:* C2 સર્વર દ્વારા નિયંત્રિત હેક્ડ *Zombie* ડિવાઇસિસનું નેટવર્ક
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[🍪 સેશન હાઇજેકિંગ અને બચાવ]
      #v(2pt)
      • *Session ID ચોરી:* HTTP સ્નિફિંગ, XSS (`document.cookie`), બ્રૂટ-ફોર્સ\
      • *Session Fixation:* યુઝરને હુમલાખોરની જાણીતી SID થી લોગિન કરાવવું\
      • *બચાવ:* હંમેશા *HTTPS*, `HttpOnly` + `Secure` + `SameSite` કૂકી ફ્લેગ વાપરો!
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[સુરક્ષા ટેકનિક], text(fill: white, weight: "bold")[કાર્યપદ્ધતિ અને બાયપાસની રીતો], text(fill: white, weight: "bold")[ઉદાહરણ],
  [IDS વિરુદ્ધ IPS], [*IDS* માત્ર એલર્ટ આપે છે; *IPS* જોખમી પેકેટ્સને તરત બ્લોક કરે છે], [`Snort`, `Suricata`],
  [WAF (Web App FW)], [SQLi, XSS અને બોટ્સ રોકવા HTTP પેલોડની તપાસ], [`Cloudflare`, `ModSecurity`],
  [Honeypot], [હુમલાખોરોને ફસાવવા અને અભ્યાસ કરવા નકલી અસુરક્ષિત સર્વર], [`Cowrie`, `Honeyd`],
  [IDS બાયપાસ], [પેકેટ ફ્રેગમેન્ટેશન (`-f`), ધીમી ટાઇમિંગ (`-T1`), TLS એન્ક્રિપ્શન], [બચાવ: Deep Packet Inspection],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🧰 CyberChef અને ટોપ પેકેટ/નેટવર્ક GitHub Repos]
  #v(2pt)
  • #link("https://gchq.github.io/CyberChef/")[*CyberChef (GCHQ)*] — Base64, Hex, XOR, JWT અને URL પેલોડ ડિકોડ કરવાનું "Cyber Swiss Army Knife"!\
  • *GitHub ટૂલ્સ:* #link("https://github.com/lgandx/Responder")[*Responder*] · #link("https://github.com/bettercap/bettercap")[*Bettercap*] (MITM) · #link("https://github.com/fortra/impacket")[*Impacket*] (SMB/Kerberos)
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.4pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[SOC / Blue સાઇટ], text(fill: white, weight: "bold")[ડિકોડિંગ, થ્રેટ ઇન્ટેલ અને PCAP વિશ્લેષણ], text(fill: white, weight: "bold")[ડાયરેક્ટ લિંક],
  [*CyberChef (GCHQ)*], [Base64, Hex, XOR, AES, JWT અને Regex ડિકોડ કરવાનું ઓનલાઇન ટૂલ], [#link("https://gchq.github.io/CyberChef/")[gchq.github.io/CyberChef ↗]],
  [*AbuseIPDB*], [શંકાસ્પદ અટેકર IPs, બોટનેટ્સ અને SSH બ્રૂટ-ફોર્સ IPs તપાસો], [#link("https://www.abuseipdb.com")[abuseipdb.com ↗]],
  [*urlscan.io*], [ખોલ્યા વગર કોઈપણ ફિશિંગ URL નો સુરક્ષિત સ્ક્રીનશોટ અને રીડાયરેક્ટ જુઓ], [#link("https://urlscan.io")[urlscan.io ↗]],
  [*The Hacker News*], [દરરોજના સાયબર બ્રીચ, CVEs અને ઝીરો-ડે સિક્યોરિટી એલર્ટ્સ], [#link("https://thehackernews.com")[thehackernews.com ↗]],
)

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[📡 CLI પેકેટ કેપ્ચર (`tcpdump` અને `tshark` 1-લાઇનર્સ)]
  #v(2pt)
  • `.pcap` કેપ્ચર કરો: #cmd("sudo tcpdump -i eth0 -w cap.pcap port 80 or port 53")\
  • લાઇવ HTTP URLs કાઢો: #cmd("tshark -i eth0 -Y 'http.request' -T fields -e http.host -e http.request.uri")
]

#did-you-know[
  સેશન કૂકી પર *`HttpOnly`* ફ્લેગ લગાવવાથી JavaScript (`document.cookie`) તેને વાંચી શકતું નથી — જેનાથી Cross-Site Scripting (XSS) દ્વારા થતી સેશન ચોરી સંપૂર્ણ અટકી જાય છે!
]

#pagebreak()

// =============================================================================
// PAGE 06: WEB APPLICATION HACKING (OWASP TOP 10) & SQL INJECTION
// =============================================================================

#section-banner(num: "મોડ્યુલ 09", title: "વેબ એપ્લિકેશન હેકિંગ: OWASP TOP 10 અને BURP SUITE", color: rtech-red)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[નબળાઈ], text(fill: white, weight: "bold")[કાર્યપદ્ધતિ અને વાસ્તવિક નુકસાન], text(fill: white, weight: "bold")[સુરક્ષા ઉપાય],
  [Broken Access / IDOR], [`/api/user?id=101` ને `102` કરતાં બીજા યુઝરનો ડેટા દેખાવો], [સર્વર-સાઇડ રોલ/ઓનર તપાસ],
  [XSS (Stored/Reflected)], [`<script>alert(1)</script>` નાખી યુઝરના બ્રાઉઝરમાં JS ચલાવવું], [આઉટપુટ એન્કોડિંગ + CSP],
  [CSRF], [લોગ-ઇન યુઝરના બ્રાઉઝરથી અનિચ્છનીય ફોર્મ સબમિટ કરાવવું], [`SameSite` કૂકી + CSRF ટોકન],
  [SSRF], [સર્વર પાસેથી આંતરિક URL (`http://169.254.169.254/`) ફેચ કરાવવું], [લોકલ IP બ્લોક અને Allowlist],
  [Directory Traversal], [`../../../../etc/passwd` થી સર્વરની ગોપનિય ફાઇલો વાંચવી], [પાથ સેનિટાઇઝેશન + chroot],
  [Command Injection], [ઇનપુટમાં `; cat /etc/passwd` ઉમેરી સર્વર શેલ કમાન્ડ ચલાવવો], [શેલ એક્ઝિક્યુશન ટાળો],
)

#v(2pt)
#section-banner(num: "મોડ્યુલ 10", title: "SQL INJECTION (SQLi) અને SQLMAP ચીટ શીટ (મોડ્યુલ 15)", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[SQLi પ્રકાર / ટૂલ], text(fill: white, weight: "bold")[પેલોડ ડેટાબેઝને કેવી રીતે હેક કરે છે], text(fill: white, weight: "bold")[પેલોડ / કમાન્ડ],
  [Auth Bypass], [`WHERE user=''` ને હંમેશા TRUE બૂલિયન શરતમાં બદલી નાખે છે], [`admin' OR '1'='1' -- `],
  [UNION-Based SQLi], [હુમલાખોરના `SELECT` પરિણામને મૂળ ક્વેરી સાથે જોડે છે], [`' UNION SELECT 1,user(),3-- `],
  [Error-Based SQLi], [ડેટાબેઝ એરર મેસેજથી ટેબલ અને કોલમના નામ બહાર લાવે છે], [`' AND 1=CONVERT(int,@@version)--`],
  [Time-Based Blind], [આઉટપુટ દેખાયા વગર સર્વરના વિલંબ (`SLEEP`) થી ડેટાનું અનુમાન], [`' OR SLEEP(5)-- `],
  [#cmd("sqlmap") ઓટો], [ડેટાબેઝ, ટેબલ અને પાસવર્ડ હેશ ડમ્પ કરવાનું ઓટોમેટેડ ટૂલ], [#cmd("sqlmap -u \"URL?id=1\" --dbs --batch")],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🕷️ Burp Suite વર્કફ્લો (વેબ પેન્ટેસ્ટિંગ)]
      #v(2pt)
      • *Proxy:* `127.0.0.1:8080` પર HTTP/S વિનંતી રોકો અને બદલો\
      • *Repeater:* SQLi/IDOR ટેસ્ટ કરવા વિનંતી વારંવાર મોકલો\
      • *Intruder:* ઓટોમેટેડ ફઝિંગ અને બ્રૂટ-ફોર્સ (`Sniper`/`Cluster Bomb`)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🛡️ SQL Injection રોકવાનો #1 ગોલ્ડન નિયમ]
      #v(2pt)
      હંમેશા *Parameterized Queries (Prepared Statements)* (`SELECT * FROM users WHERE id = ?`) વાપરો — યુઝર ઇનપુટને સીધું SQL માં ન જોડો!
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[વેબ રિકોન ટૂલ], text(fill: white, weight: "bold")[ડિરેક્ટરી, સબડોમેન અને API શોધવાનો હેતુ], text(fill: white, weight: "bold")[કમાન્ડ],
  [#cmd("gobuster") / `ffuf`], [છુપાયેલા `/admin`, `/backup`, `.env` અને API એન્ડપોઇન્ટ્સ શોધવા], [#cmd("gobuster dir -u URL -w list.txt")],
  [#cmd("nikto")], [જૂના Apache/Nginx વર્ઝન અને સર્વર ખોટા કોન્ફિગ સ્કેન કરવા], [#cmd("nikto -h https://target.com")],
  [#cmd("subfinder")], [બગ બાઉન્ટી સ્કોપ માટે ઝડપી પેસિવ સબડોમેન એન્યુમરેશન], [#cmd("subfinder -d target.com")],
)

#v(2pt)
#align(center)[
  #box(stroke: 0.6pt + rgb("#CBD5E1"), radius: 4pt, clip: true, width: 100%)[
    #image("02_BRAND_ASSETS/eh_sqli_defense_visual.png", width: 100%)
  ]
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[વેબ સિક્યોરિટી સાઇટ], text(fill: white, weight: "bold")[ફ્રી વેબ હેકિંગ લેબ્સ, CVE પેલોડ્સ અને વર્ડલિસ્ટ્સ], text(fill: white, weight: "bold")[ડાયરેક્ટ લિંક],
  [*PortSwigger Academy*], [SQLi, XSS, CSRF, SSRF અને Burp Suite ની 100% ફ્રી ઇન્ટરેક્ટિવ લેબ્સ], [#link("https://portswigger.net/web-security")[portswigger.net/web-security ↗]],
  [*Exploit-DB*], [પબ્લિક એક્સપ્લોઇટ્સ, PoCs અને Google Hacking Database (GHDB) નો ભંડાર], [#link("https://www.exploit-db.com")[exploit-db.com ↗]],
  [*GTFOBins*], [લોકલ સુરક્ષા બાયપાસ અને PrivEsc માટે Unix બાઇનરીઝની યાદી], [#link("https://gtfobins.github.io")[gtfobins.github.io ↗]],
)

#did-you-know[
  *SSRF (Server-Side Request Forgery)* ક્લાઉડ માટે સૌથી જોખમી બગ છે! AWS/GCP/Azure પર એક SSRF બગ `http://169.254.169.254/latest/meta-data/` માંથી અસ્થાયી IAM ક્લાઉડ ક્રેડેન્શિયલ્સ ચોરી શકે છે!
]

#pagebreak()

// =============================================================================
// PAGE 07: WIRELESS, CLOUD, IOT & CRYPTOGRAPHY MASTERY (CEH MODULES 16-20)
// =============================================================================

#section-banner(num: "મોડ્યુલ 11", title: "વાયરલેસ હેકિંગ (WI-FI), ક્લાઉડ અને IoT/OT સુરક્ષા", color: rtech-blue)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[📶 Wi-Fi એન્ક્રિપ્શન અને Aircrack-ng]
      #v(2pt)
      • *WEP:* નબળું RC4 (મિનિટોમાં ક્રેક) · *WPA2:* AES-CCMP (4-વે હેન્ડશેક)\
      • *WPA3:* SAE (Dragonfly) ઓફલાઇન ડિક્શનરી ક્રેકિંગ અટકાવે છે!\
      • *ઓડિટ ક્રમ:* #cmd("airmon-ng start wlan0") → #cmd("airodump-ng wlan0mon") → હેન્ડશેક કેપ્ચર → #cmd("aircrack-ng -w rockyou.txt cap.cap")
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[☁️ ક્લાઉડ, કન્ટેનર અને IoT/OT સુરક્ષા]
      #v(2pt)
      • *Shared Responsibility:* ક્લાઉડ હાર્ડવેર બચાવે; *તમે* IAM, OS અને ડેટા બચાવો\
      • *મુખ્ય જોખમો:* પબ્લિક S3 બકેટ્સ, વધારાની IAM `*` પરમિશન, SSRF\
      • *IoT/OT જોખમ:* ડિફોલ્ટ પાસવર્ડ, બિન-એન્ક્રિપ્ટેડ MQTT (OT/SCADA માટે VLAN અલગ રાખો!)
    ]
  ]
)

#v(2pt)
#section-banner(num: "મોડ્યુલ 12", title: "ક્રિપ્ટોગ્રાફી, હેશિંગ, PKI અને ડિજિટલ સિગ્નેચર (મોડ્યુલ 20)", color: rtech-purple)

#table(
  columns: (auto, auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[પ્રકાર], text(fill: white, weight: "bold")[અલ્ગોરિધમ], text(fill: white, weight: "bold")[મુખ્ય વિશેષતા અને ઉપયોગ], text(fill: white, weight: "bold")[કી સાઇઝ],
  [*Symmetric*], [`AES`, `ChaCha20`, `3DES`], [એન્ક્રિપ્શન અને ડિક્રિપ્શન માટે એક જ કી; બલ્ક ડેટા માટે ઝડપી], [`AES-128 / 256`],
  [*Asymmetric*], [`RSA`, `ECC`, `Diffie-Hellman`], [પબ્લિક કી થી એન્ક્રિપ્ટ, પ્રાઇવેટ કી થી ડિક્રિપ્ટ; કી એક્સચેન્જ], [`RSA-2048 / 4096`],
  [*Hashing*], [`SHA-256`, `SHA-3`, `bcrypt`], [વન-વે ફિક્સ્ડ ડાઇજેસ્ટ; ડેટા અખંડિતતા તપાસે (ડિક્રિપ્ટ ન થાય)], [`256-bit`],
  [*નબળા/જૂના*], [`MD5`, `SHA-1`, `DES`, `RC4`], [કોલિઝન અને નાની કી સાઇઝને કારણે અસુરક્ષિત — *પ્રોડક્શનમાં વર્જિત!*], [અમાન્ય],
)

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[✍️ ડિજિટલ સિગ્નેચર અને PKI વિશ્વાસ કેવી રીતે ખાતરી કરે છે]
  #v(2pt)
  *1.* મોકલનાર દસ્તાવેજને હેશ (`SHA-256`) કરી પોતાની *Private Key* થી એન્ક્રિપ્ટ કરે છે = Digital Signature.\
  *2.* પ્રાપ્તકર્તા *Sender ની Public Key* (CA સર્ટિફિકેટથી ચકાસાયેલ) થી ખોલે છે → *Authentication + Integrity + Non-Repudiation* સાબિત!
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[હુમલો / સુરક્ષા], text(fill: white, weight: "bold")[Wi-Fi, Bluetooth, મોબાઇલ અને AI સુરક્ષા], text(fill: white, weight: "bold")[ટૂલ / ધોરણ],
  [Evil Twin AP], [લોગિન ચોરવા માટે અસલી જેવું નકલી કોર્પોરેટ Wi-Fi હોટસ્પોટ], [`Wifiphisher`, `802.1X`],
  [મોબાઇલ પેન્ટેસ્ટિંગ], [APK ડીકમ્પાઇલ કરવું, `AndroidManifest.xml` તપાસ, SSL Pinning બાયપાસ], [`MobSF`, `Frida`, `jadx`],
  [AI], [એથિકલ ઓડિટિંગમાં AI રિકોન અને SOC માં ઓટોમેટેડ થ્રેટ કન્ટેઇનમેન્ટ], [`SOAR` / AI Playbooks],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🐙 ટોપ Ethical Hacking GitHub Repos]
      #v(2pt)
      • #link("https://github.com/swisskyrepo/PayloadsAllTheThings")[*PayloadsAllTheThings*] — SQLi, XSS, PrivEsc પેલોડ્સ\
      • #link("https://github.com/danielmiessler/SecLists")[*SecLists*] — #1 ફઝિંગ અને બ્રૂટ-ફોર્સ વર્ડલિસ્ટ્સ\
      • #link("https://github.com/peass-ng/PEASS-ng")[*LinPEAS / WinPEAS*] — ઓટો PrivEsc ઓડિટ\
      • #link("https://github.com/projectdiscovery/nuclei")[*Nuclei*] — ઝડપી YAML વલ્નરેબિલિટી સ્કેનર
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🌐 પ્રેક્ટિસ લેબ્સ અને જરૂરી વેબસાઇટ્સ]
      #v(2pt)
      • #link("https://tryhackme.com")[*TryHackMe.com*] અને #link("https://hackthebox.com")[*HackTheBox.com*] — લેબ્સ\
      • #link("https://portswigger.net/web-security")[*PortSwigger Academy*] — #1 ફ્રી વેબ સુરક્ષા લેબ\
      • #link("https://gtfobins.github.io")[*GTFOBins*] અને #link("https://www.exploit-db.com")[*Exploit-DB*] — PrivEsc & CVE\
      • #link("https://www.virustotal.com")[*VirusTotal*] અને #link("https://www.eicar.org")[*EICAR*] — મેલવેર અને AV ટેસ્ટિંગ
    ]
  ]
)

#v(2pt)
#align(center)[
  #box(stroke: 0.6pt + dark-border, radius: 4pt, clip: true, width: 100%)[
    #image("02_BRAND_ASSETS/eh_career_roadmap.png", width: 100%)
  ]
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.3pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[પ્રેક્ટિસ પ્લેટફોર્મ], text(fill: white, weight: "bold")[બેસ્ટ કરિયર અને CTF ટ્રેનિંગ વેબસાઇટ્સ (આજે જ શરૂ કરો!)], text(fill: white, weight: "bold")[ડાયરેક્ટ લિંક],
  [*TryHackMe*], [Linux, Nmap, SOC અને પેન્ટેસ્ટિંગ માટે ગાઇડેડ બ્રાઉઝર લેબ્સ], [#link("https://tryhackme.com")[tryhackme.com ↗]],
  [*Hack The Box (HTB)*], [રીઅલ-વર્લ્ડ વલ્નરેબલ મશીન્સ અને ઇન્ટરમીડિયેટ/પ્રો પેન્ટેસ્ટ લેબ્સ], [#link("https://www.hackthebox.com")[hackthebox.com ↗]],
  [*picoCTF (CMU)*], [વિદ્યાર્થીઓ અને કોલેજો માટે 100% ફ્રી Capture The Flag પઝલ્સ], [#link("https://picoctf.org")[picoctf.org ↗]],
  [*HackerOne / LetsDefend*], [કાયદેસર બગ બાઉન્ટી (રોકડ ઇનામ) અને SOC બ્લુ ટીમ સિમ્યુલેશન લેબ્સ], [#link("https://www.hackerone.com")[hackerone.com ↗]],
)

#v(2pt)
#block(width: 100%, fill: rgb("#0F172A"), stroke: 0.7pt + rgb("#10B981"), radius: 3pt, inset: 5pt)[
  #text(size: 7.4pt, weight: "black", fill: rgb("#34D399"))[⚡ ડેઇલી એથિકલ હેકર 5-કમાન્ડ ટર્મિનલ રૂટિન]
  #v(1.5pt)
  #text(size: 7.1pt, fill: rgb("#E2E8F0"))[
    *1.* #cmd("sudo apt update && sudo apt full-upgrade -y") · *2.* #cmd("nmap -sS -sV -T4 target") · *3.* #cmd("gobuster dir -u URL -w common.txt") · *4.* #cmd("sqlmap -u URL?id=1 --dbs")
  ]
]

#did-you-know[ પહેલા *Asymmetric* (`RSA`/`ECDHE`) સુરક્ષિત રીતે સેશન કી બદલે છે; પછી *Symmetric* (`AES-256`) બધો ડેટા એન્ક્રિપ્ટ કરે છે કારણ કે તે *1,000 ગણું ઝડપી* છે!
]

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB, MOTTO, QR CODES, Q&A & WHATSAPP HELP DESK
// =============================================================================

#align(center)[
  #box(height: 22pt)[#image("02_BRAND_ASSETS/rtechlab-header-logo.png", height: 22pt)]
  #v(1.5pt)
  #text(size: 9.8pt, weight: "black", fill: rtech-navy)[ઓથર મેન્ટરશિપ હબ, પ્રમાણપત્રો અને ઇન્ટરવ્યુ વોલ્ટ]
  #v(1pt)
  #text(size: 6.7pt, fill: rtech-muted)[RTechLab ઓરિજિનલ આવૃત્તિ · લેખક પ્રમાણપત્રો · QR કોડ્સ · ટોપ 10 ઇન્ટરવ્યુ પ્રશ્ન-જવાબ]
]

#section-banner(num: "મુદ્દો 01", title: "લેખક પરિચય અને સર્ટિફિકેટ્સ: રાહુલ પટેલ — સ્થાપક અને સિસ્ટમ્સ આર્કિટેક્ટ", color: rtech-navy)

#block(
  width: 100%,
  stroke: 0.65pt + dark-border,
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: 5pt,
  [
    #grid(
      columns: (54pt, 1fr),
      gutter: 7pt,
      align: (center + horizon, left + horizon),
      [
        #box(
          stroke: 1.5pt + rtech-red,
          radius: 5pt,
          clip: true,
          width: 48pt,
          height: 60pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 9.2pt, weight: "black", fill: rtech-navy)[રાહુલ પટેલ] #h(4pt) #hl-b[10+ વર્ષનો IT અનુભવ] #h(3pt) #hl-g[3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત]\
        #v(1pt)
        #text(size: 6.8pt, weight: "bold", fill: rtech-red)[Founder & Lead Systems Architect · RTechLab] · #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[Director · IANT Computer Education, Palanpur]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "bold", fill: rtech-navy)[
          🏅 *લેખક પ્રમાણપત્રો:* #hl-r[CEH (Certified Ethical Hacker)] · #hl-b[CSCU (EC-Council)] · #hl-y[EHE (Star Certification)] · #hl-g[SCSU (Star Certification)]
        ]\
        #v(1.5pt)
        #text(size: 6.4pt, fill: rtech-navy)[
          *RTechLab ધ્યેય (Motto):* _"વ્યવહારિક ટેકનોલોજી (Technology Made Practical) — 100% ઓરિજિનલ અને હેન્ડ્સ-ઓન સાયબર સુરક્ષા ગાઇડ્સ સાથે દરેક વિદ્યાર્થીને સશક્ત બનાવવા."_
        ]
      ]
    )
  ]
)

#section-banner(num: "મુદ્દો 02", title: "લેખક પોર્ટફોલિયો, YouTube, Instagram અને WhatsApp કોમ્યુનિટી હબ", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0F9FF"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 50pt)]
        #v(1pt)
        #text(size: 6.6pt, weight: "black", fill: rtech-blue)[ઓથર પોર્ટફોલિયો]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 50pt)]
        #v(1pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[YouTube ચેનલ]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 50pt)]
        #v(1pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[Instagram હબ]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 50pt)]
        #v(1pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[WhatsApp ચેનલ]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[ફ્રી કોમ્યુનિટી એક્સેસ ↗]]
      ]
    ]
  ],
)

#section-banner(num: "મુદ્દો 03", title: "ટોપ 10 અને સાયબર સુરક્ષા ઇન્ટરવ્યુ પ્રશ્ન-જવાબ", color: rtech-emerald)

#table(
  columns: (auto, 1fr),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[\#], text(fill: white, weight: "bold")[પરીક્ષા અને SOC / Pentester ઇન્ટરવ્યુ પ્રશ્ન અને જવાબ],
  [*Q1*], [*Encryption વિરુદ્ધ Hashing?* Encryption ટુ-વે છે (કી થી ડિક્રિપ્ટ થઈ શકે, દા.ત. AES); Hashing વન-વે છે (ડિક્રિપ્ટ ન થાય, દા.ત. SHA-256).],
  [*Q2*], [*SYN Scan (`-sS`) વિરુદ્ધ Connect Scan (`-sT`)?* `-sS` `SYN-ACK` પછી `RST` મોકલે છે (ગુપ્ત, હાફ-ઓપન); `-sT` પૂરો 3-વે હેન્ડશેક કરે છે.],
  [*Q3*], [*SQL Injection કાયમ માટે કેવી રીતે રોકવું?* Parameterized Queries (Prepared Statements), સખત ઇનપુટ તપાસ અને મર્યાદિત DB અધિકાર વાપરો.],
  [*Q4*], [*XSS વિરુદ્ધ CSRF?* XSS યુઝરના બ્રાઉઝરમાં ખોટું JS ચલાવે છે; CSRF લોગ-ઇન યુઝરના બ્રાઉઝરથી અનિચ્છનીય વિનંતી મોકલે છે.],
  [*Q5*], [*DNSSEC શું સુરક્ષા આપે છે?* તે DNS જવાબોની ઓરિજિન ઓથેન્ટિકેશન અને અખંડિતતા બચાવે છે (સ્પૂફિંગ રોકે છે, ટ્રાફિક એન્ક્રિપ્ટ નથી કરતું).],
  [*Q6*], [*VA વિરુદ્ધ Penetration Testing?* VA નબળાઈઓ શોધે અને રેન્ક કરે (`Nessus`); Pentesting જોખમ સાબિત કરવા તેમને એક્સપ્લોઇટ કરે છે.],
  [*Q7*], [*IDS વિરુદ્ધ IPS વિરુદ્ધ SIEM?* IDS એલર્ટ આપે; IPS રોકે; SIEM (`Splunk`/`Wazuh`) બધા સર્વર્સના લોગ્સ જોડી SOC વિશ્લેષણ કરે છે.],
  [*Q8*], [*Zero-Day નબળાઈ શું છે?* એવી નવી સોફ્ટવેર ખામી જેનો વેન્ડર પેચ હજુ સુધી ન બન્યો હોય — WAF/IPS વર્ચ્યુઅલ પેચિંગથી બચાવાય છે.],
  [*Q9*], [*Symmetric વિરુદ્ધ Asymmetric ઝડપ?* Symmetric (`AES-256`) ~1,000 ગણું ઝડપી છે; Asymmetric (`RSA`) સુરક્ષિત કી એક્સચેન્જ માટે વપરાય છે.],
  [*Q10*], [*Reverse Shell શું છે?* ટાર્ગેટ પોતે બહાર હુમલાખોરના લિસનર (`nc -lvnp`) સાથે જોડાય છે, જેથી ઇનબાઉન્ડ ફાયરવોલ બાયપાસ થાય છે.],
)

#did-you-know[
  *કાયદાકીય અને નૈતિક નિયમ:* લેખિત પરવાનગી વગર કોઈપણ વેબસાઇટ, Wi-Fi કે સર્વરને સ્કેન ન કરશો! હંમેશા *TryHackMe*, *HackTheBox*, *PortSwigger Academy*, અથવા તમારી પોતાની *Kali Linux* વર્ચ્યુઅલ લેબમાં જ પ્રેક્ટિસ કરો.
]

#v(2pt)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: 0.7pt + rgb("#93C5FD"),
  radius: 3pt,
  inset: (x: 7pt, y: 4pt),
  [
    #align(center)[
      #text(size: 7.3pt, weight: "bold", fill: rtech-blue)[
        🚀 RTechLab ની સંપૂર્ણ માસ્ટર બુક્સ, પ્રેક્ટિકલ લેબ્સ અને કરિયર સ્યૂટ માટે મુલાકાત લો: #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]
      ]
    ]
  ]
)

#v(2pt)
#block(
  width: 100%,
  fill: rgb("#0F172A"),
  radius: 4pt,
  inset: 6pt,
  [
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #box(fill: rgb("#064E3B"), stroke: 0.6pt + rgb("#10B981"), radius: 3pt, inset: (x: 6pt, y: 3pt))[
          #grid(
            columns: (auto, auto),
            gutter: 5pt,
            align: (horizon, horizon),
            [#image("02_BRAND_ASSETS/whatsapp_logo.svg", height: 12pt)],
            [#text(size: 7.2pt, weight: "bold", fill: rgb("#A7F3D0"))[RTechLab WhatsApp હેલ્પ ડેસ્ક: ] #link("https://wa.me/917646892094")[#text(size: 7.6pt, weight: "black", fill: white)[+91 76468 92094]] #text(size: 6.5pt, fill: rgb("#6EE7B7"))[ (માત્ર ચેટ સહાય)]]
          )
        ]
      ],
      [
        #box(fill: rgb("#DC2626"), radius: 3pt, inset: (x: 7pt, y: 4pt))[
          #text(size: 7.0pt, weight: "black", fill: white)[· 2027 આવૃત્તિ]
        ]
      ]
    )
  ]
)
