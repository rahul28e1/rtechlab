// =============================================================================
// RTECHLAB ETHICAL HACKING & CYBER SECURITY  DESK CHEAT SHEET (HINDI)
// Exactly 8 Pages · Page 1 Blank Cover Placeholder · Zero-Gap Dense Layout
// Author: Rahul Patel (Founder & Systems Architect, RTechLab)
// =============================================================================

#set document(
  title: "Ethical Hacking & Cyber Security  Desk Cheat Sheet (Hindi)",
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
          #text(size: 7.5pt, weight: "bold", fill: rgb("#DC2626"))[एथिकल हैकिंग व साइबर सुरक्षा  चीट शीट (हिंदी)]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Recon · Nmap · OWASP · SQLi · Wireshark · Crypto]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · राहुल पटेल]
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
            #text(fill: rgb("#DC2626"))[●] केवल अधिकृत लैब में अभ्यास · डेस्क पर रखें · फ्री टूल्स: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.5pt),
            text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[पेज #p / 8]
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
      #text(size: 7.4pt, weight: "black", fill: rgb("#92400E"))[💡 क्या आप जानते हैं? ]
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

#section-banner(num: "मॉड्यूल 01", title: "एथिकल हैकिंग के 5 चरण, CIA ट्रायड और हैकर प्रकार", color: rtech-red)

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
      #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🛡️ सुरक्षा के मूल स्तंभ (CIA + AAA)]
      #v(2pt)
      • *Confidentiality:* एन्क्रिप्शन व एक्सेस कंट्रोल (डेटा गुप्त रखें)\
      • *Integrity:* हैशिंग (`SHA-256`) व डिजिटल सिग्नेचर (छेड़छाड़ नहीं)\
      • *Availability:* बैकअप व DDoS सुरक्षा (सिस्टम हमेशा चालू)\
      • *AAA:* *Authentication* (कौन?) · *Authorization* (अधिकार?) · *Accounting* (लॉग्स)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🎭 हैकर्स के प्रकार व टेस्टिंग मोड्स]
      #v(2pt)
      • #hl-g[White Hat] अधिकृत एथिकल हैकर · #hl-r[Black Hat] दुर्भावनापूर्ण हैकर\
      • #hl-y[Grey Hat] बिना अनुमति पर गैर-हानिकारक · #hl-b[Red/Blue/Purple]\
      • *Black Box:* शून्य जानकारी · *White Box:* पूरा कोड/नेटवर्क\
      • *Grey Box:* आंशिक यूज़र एक्सेस (सबसे व्यावहारिक ऑडिट)
    ]
  ]
)

#v(2pt)
#section-banner(num: "मॉड्यूल 02", title: "KALI LINUX डाउनलोड व इंस्टॉलेशन गाइड + OSINT DORKING", color: rtech-blue)

#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.6pt, weight: "black", fill: rgb("#065F46"))[🐉 Kali Linux सुरक्षित डाउनलोड व इंस्टॉल कैसे करें (Virtual Lab)]
  #v(2pt)
  *1. ऑफिशियल साइट:* #link("https://www.kali.org/get-kali/")[*kali.org/get-kali*] → *Virtual Machines* (VirtualBox/VMware) चुनें (सबसे तेज़!).\
  *2. SHA-256 जाँच:* बूट करने से पहले हैश मिलाएँ · डिफ़ॉल्ट लॉगिन: `kali`/`kali` (`passwd` से बदलें)।\
  *3. पहला अपडेट:* #cmd("sudo apt update && sudo apt full-upgrade -y") · टूल्स: #cmd("sudo apt install -y kali-linux-large")
]

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[टूल / ऑपरेटर], text(fill: white, weight: "bold")[पैसिव व एक्टिव जानकारी जुटाने का उद्देश्य], text(fill: white, weight: "bold")[उदाहरण],
  [#cmd("site:")], [Google सर्च को केवल एक टारगेट डोमेन तक सीमित करें], [#cmd("site:target.com admin")],
  [#cmd("filetype:")], [वेबसाइट पर लीक हुई PDF, Excel, SQL या `.env` फाइल खोजें], [#cmd("site:target.com filetype:env")],
  [#cmd("inurl:") / #cmd("intitle:")], [एडमिन लॉगिन पोर्टल, डायरेक्टरी लिस्टिंग या एरर पेज खोजें], [#cmd("intitle:\"index of\" /backup")],
  [#cmd("whois") / `RDAP`], [डोमेन रजिस्ट्रार, मालिक, नेमसर्वर व एक्सपायरी डेट देखें], [#cmd("whois rtechlab.com")],
  [#cmd("dig") / `DNSSEC`], [`A`, `MX`, `TXT` रिकॉर्ड्स निकालें; DNSSEC ऑरिजिन ऑथेंटिकेशन देता है], [#cmd("dig target.com ANY")],
  [`Shodan.io`], [इंटरनेट से जुड़े IoT डिवाइस, वेबकैम व खुले सर्वर पोर्ट्स खोजें], [`port:3389 country:"IN"`],
  [`theHarvester`], [पब्लिक OSINT से कर्मचारियों के ईमेल व सबडोमेन निकालें], [#cmd("theHarvester -d domain -b all")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🧩 ज़रूरी Recon ब्राउज़र एक्सटेंशन व वेबसाइट्स]
  #v(2pt)
  • *Extensions:* `Wappalyzer`, `FoxyProxy` (Burp स्विच), `Shodan` · *ब्रीच जाँच:* #link("https://haveibeenpwned.com")[*HaveIBeenPwned.com*] · #link("https://crt.sh")[*crt.sh*]
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[Recon वेबसाइट], text(fill: white, weight: "bold")[एथिकल हैकर्स के लिए उपयोग (100% फ्री व कानूनी)], text(fill: white, weight: "bold")[डायरेक्ट लिंक],
  [*Have I Been Pwned*], [जाँचें कि कोई ईमेल या डोमेन डेटा ब्रीच में लीक हुआ है या नहीं], [#link("https://haveibeenpwned.com")[haveibeenpwned.com ↗]],
  [*Shodan Search*], [दुनिया भर के पब्लिक सर्वर्स, वेबकैम, राउटर व खुले पोर्ट्स खोजें], [#link("https://www.shodan.io")[shodan.io ↗]],
  [*crt.sh (SSL लॉग्स)*], [पब्लिक SSL सर्टिफिकेट्स से छिपे हुए सबडोमेन तुरंत खोजें], [#link("https://crt.sh")[crt.sh ↗]],
  [*Security Headers*], [किसी भी वेबसाइट के HTTP सिक्योरिटी हेडर (`CSP`, `HSTS`) जाँचें], [#link("https://securityheaders.com")[securityheaders.com ↗]],
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[फ्रेमवर्क / कानून], text(fill: white, weight: "bold")[वैश्विक व भारतीय साइबर सुरक्षा मानक], text(fill: white, weight: "bold")[मुख्य क्षेत्र],
  [*MITRE ATT&CK*], [वास्तविक हमलावरों की तकनीकों व रणनीति (TTPs) का ज्ञानकोष], [थ्रेट मॉडलिंग],
  [*OWASP Top 10*], [वेब एप्लिकेशन और API सुरक्षा जोखिमों का मानक दस्तावेज़], [वेब/API ऑडिट],
  [*ISO 27001 / NIST*], [एंटरप्राइज सूचना सुरक्षा प्रबंधन (ISMS) व जोखिम ढांचा], [गवर्नेंस],
  [*IT Act 2000 (भारत)*], [धारा 43/66 (हैकिंग), 66C (पहचान चोरी), 66F (साइबर आतंकवाद)], [कानूनी अनुपालन],
)

#did-you-know[
  *Passive Footprinting* में टारगेट सर्वर को एक भी पैकेट भेजे बिना (`WHOIS`, `Shodan`, `Google Dorks`) जानकारी जुटाई जाती है, जबकि *Active Footprinting* में सीधे टारगेट से संपर्क (पिंग या सोशल इंजीनियरिंग) किया जाता है!
]

#pagebreak()

// =============================================================================
// PAGE 03: NETWORK SCANNING, NMAP MASTERY & ENUMERATION
// =============================================================================

#section-banner(num: "मॉड्यूल 03", title: "नेटवर्क स्कैनिंग और NMAP मास्टर फ्लैग्स (मॉड्यूल 03)", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[Nmap फ्लैग], text(fill: white, weight: "bold")[स्कैन प्रकार व कार्यप्रणाली], text(fill: white, weight: "bold")[कमांड],
  [#cmd("-sS")], [*Stealth SYN Scan* (`SYN` भेजता है, `SYN-ACK` मिलने पर `RST` भेजता है)], [#cmd("nmap -sS 10.0.0.1")],
  [#cmd("-sT")], [*TCP Connect Scan* (पूरा 3-वे हैंडशेक; टारगेट लॉग्स में दर्ज होता है)], [#cmd("nmap -sT 10.0.0.1")],
  [#cmd("-sU")], [*UDP Scan* (धीमा स्कैन; DNS `53`, SNMP `161`, DHCP `67` जाँचता है)], [#cmd("nmap -sU -p 53,161 ip")],
  [#cmd("-sV") / #cmd("-O")], [सर्विस वर्जन पहचान (Banner Grab) व OS फिंगरप्रिंटिंग], [#cmd("nmap -sV -O 10.0.0.1")],
  [#cmd("-A") / #cmd("-p-")], [एग्रेसिव स्कैन (OS+Ver+Scripts) / सभी 65,535 पोर्ट्स स्कैन करें], [#cmd("nmap -A -p- 10.0.0.1")],
  [#cmd("-sn") / #cmd("-Pn")], [पिंग स्वीप (बिना पोर्ट स्कैन) / होस्ट डिस्कवरी स्किप करें], [#cmd("nmap -sn 192.168.1.0/24")],
  [#cmd("--script vuln")], [ज्ञात CVEs खोजने के लिए Nmap स्क्रिप्टिंग इंजन (NSE) चलाएँ], [#cmd("nmap --script vuln ip")],
  [#cmd("-f") / #cmd("-D RND:5")], [IDS बाईपास: पैकेट फ्रैगमेंट करें / 5 नकली डिकॉय IP से स्कैन छिपाएँ], [#cmd("nmap -sS -f -D RND:5 ip")],
)

#v(2pt)
#section-banner(num: "मॉड्यूल 04", title: "एन्यूमरेशन व प्रमुख अटैक पोर्ट्स मैट्रिक्स (मॉड्यूल 04)", color: rtech-blue)

#table(
  columns: (auto, auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[पोर्ट], text(fill: white, weight: "bold")[सर्विस], text(fill: white, weight: "bold")[हमलावर क्या जानकारी निकालते हैं], text(fill: white, weight: "bold")[टूल / कमांड],
  [#cmd("21")], [FTP], [गुमनाम लॉगिन (`anonymous:anonymous`) व प्लेन-टेक्स्ट पासवर्ड], [#cmd("ftp target_ip")],
  [#cmd("22")], [SSH], [बैनर वर्जन, कमजोर पासवर्ड, लीक हुई प्राइवेट SSH कीज़], [#cmd("ssh-audit target_ip")],
  [#cmd("25")], [SMTP], [`VRFY`, `EXPN` व `RCPT TO` द्वारा वैध ईमेल यूज़रनेम खोजना], [#cmd("smtp-user-enum")],
  [#cmd("53")], [DNS], [ज़ोन ट्रांसफर (`AXFR`) जिससे आंतरिक होस्टनेम व IP लीक हों], [#cmd("dig axfr @ns1 dom.com")],
  [#cmd("139/445")], [SMB], [शेयर्ड फोल्डर, OS वर्जन, नल सेशन व EternalBlue जांच], [#cmd("enum4linux -a ip")],
  [#cmd("161")], [SNMP], [डिफ़ॉल्ट स्ट्रिंग (`public` / `private`) से पूरा नेटवर्क मैप], [#cmd("snmpwalk -v2c -c public ip")],
  [#cmd("389")], [LDAP], [Active Directory के यूज़र्स, ग्रुप्स, कंप्यूटर व GPO नीतियाँ], [#cmd("ldapsearch -x -H ldap://ip")],
  [#cmd("3389")], [RDP], [Windows रिमोट डेस्कटॉप ब्रूट-फोर्स व BlueKeep CVE जाँच], [#cmd("xfreerdp /u:admin /v:ip")],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🔄 TCP 3-वे हैंडशेक व Nmap पोर्ट स्टेटस]
      #v(2pt)
      • *Normal TCP:* `SYN` → `SYN-ACK` → `ACK`\
      • #hl-g[Open:] सर्विस चालू · #hl-r[Closed:] बंद · #hl-y[Filtered:] फ़ायरवॉल ब्लॉक
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🛡️ CVSS गंभीरता स्कोर (Nessus / OpenVAS)]
      #v(2pt)
      • `0.1–3.9` Low · `4.0–6.9` Medium · `7.0–8.9` High · `9.0–10.0` *Critical*\
      • क्रम: खोजें → प्राथमिकता दें → स्कैन करें → पैच करें → पुनः जाँचें
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
  #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[🎯 100% कानूनी प्रैक्टिस स्कैन टारगेट्स व Nmap स्पीड टेम्पलेट्स]
  #v(2pt)
  • #link("https://scanme.nmap.org")[*scanme.nmap.org*] (ऑफिशियल Nmap टेस्ट सर्वर) · #link("http://testphp.vulnweb.com")[*testphp.vulnweb.com*] (Acunetix टेस्ट ऐप)\
  • *स्पीड:* `-T1` (IDS बाईपास) · `-T4` (तेज़ लैब) · *सेव:* #cmd("nmap -sV -T4 -oA report 10.0.0.1")
]

#did-you-know[
  *Nmap `-sS` (Stealth SYN Scan)* रूट यूज़र के लिए डिफ़ॉल्ट होता है क्योंकि यह पूरा TCP 3-वे हैंडशेक पूरा नहीं करता! `SYN-ACK` मिलते ही यह `RST` भेजकर कनेक्शन तोड़ देता है, जिससे कई पुराने लॉग्स में पकड़ में नहीं आता।
]

#pagebreak()

// =============================================================================
// PAGE 04: SYSTEM HACKING, PASSWORD CRACKING, MALWARE & SOCIAL ENGINEERING
// =============================================================================

#section-banner(num: "मॉड्यूल 05", title: "सिस्टम हैकिंग, पासवर्ड क्रैकिंग और प्रिविलेज एस्केलेशन", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[टूल / तकनीक], text(fill: white, weight: "bold")[सिस्टम हैकिंग व पोस्ट-एक्सप्लॉइटेशन कार्य], text(fill: white, weight: "bold")[उदाहरण],
  [#cmd("Hydra")], [SSH, FTP, HTTP व RDP पर तेज़ ऑनलाइन ब्रूट-फोर्स अटैक], [#cmd("hydra -l root -P rockyou.txt ssh://ip")],
  [#cmd("John the Ripper")], [`/etc/shadow` व ZIP फाइल्स के ऑफलाइन पासवर्ड क्रैक करें], [#cmd("john --wordlist=rockyou.txt hash.txt")],
  [#cmd("Hashcat")], [GPU द्वारा अल्ट्रा-फास्ट ऑफलाइन हैश क्रैकिंग], [#cmd("hashcat -m 1000 ntlm.txt rockyou.txt")],
  [#cmd("Mimikatz")], [Windows RAM से प्लेन-टेक्स्ट पासवर्ड, NTLM व Kerberos टिकट निकालें], [`sekurlsa::logonpasswords`],
  [#cmd("Metasploit")], [एक्सप्लॉइट फ्रेमवर्क (`msfconsole`) व पेलोड जनरेटर (`msfvenom`)], [#cmd("msfvenom -p linux/x64/shell_reverse_tcp")],
  [Linux PrivEsc], [`sudo -l`, SUID बाइनरी, क्रॉन जॉब्स व कर्नेल एक्सप्लॉइट जाँचें], [#cmd("find / -perm -4000 2>/dev/null")],
  [Windows PrivEsc], [Unquoted service paths, `AlwaysInstallElevated`, टोकन चोरी], [`whoami /priv` (SeImpersonate)],
  [Clearing Tracks], [हमलावर इवेंट लॉग्स (`wevtutil`) या बैश हिस्ट्री (`history -c`) मिटाते हैं], [बचाव: रिमोट *SIEM* लॉगिंग!],
)

#v(2pt)
#section-banner(num: "मॉड्यूल 06", title: "मैलवेयर खतरे और सोशल इंजीनियरिंग (मॉड्यूल 07 व 09)", color: rtech-red)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🦠 मैलवेयर के प्रकार व विश्लेषण]
      #v(2pt)
      • *Trojan:* असली सॉफ्टवेयर के रूप में छिपा बैकडोर\
      • *Worm:* बिना यूज़र क्लिक के नेटवर्क में फैलता है (WannaCry)\
      • *Ransomware:* फाइल्स एन्क्रिप्ट कर फिरौती माँगता है\
      • *Rootkit:* OS कर्नेल (`Ring 0`) में छिपकर कंट्रोल लेता है\
      • *Static:* `strings`, `sha256` · *Dynamic:* सैंडबॉक्स (`Cuckoo`)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#C2410C"))[🧠 सोशल इंजीनियरिंग हमले]
      #v(2pt)
      • *Phishing / Spear Phishing:* नकली ईमेल से लॉगिन चुराना\
      • *Vishing / Smishing:* फोन कॉल व SMS/WhatsApp OTP फ्रॉड\
      • *Pretexting:* नकली कहानी ("IT हेल्पडेस्क") बनाकर पासवर्ड माँगना\
      • *Tailgating:* अधिकृत व्यक्ति के पीछे-पीछे सुरक्षित कमरे में घुसना\
      • *Watering Hole:* टारगेट की पसंदीदा वेबसाइट को संक्रमित करना
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[पेलोड / शेल], text(fill: white, weight: "bold")[Reverse Shell बनाम Bind Shell व पोस्ट-एक्सप्लॉइटेशन], text(fill: white, weight: "bold")[कमांड],
  [Reverse Shell], [टारगेट *बाहर* हमलावर के लिसनर से जुड़ता है (इनबाउंड फ़ायरवॉल बाईपास!)], [#cmd("nc -lvnp 4444")],
  [Bind Shell], [टारगेट एक पोर्ट खोलता है व हमलावर के जुड़ने का इंतज़ार करता है], [#cmd("nc -lvnp 4444 -e /bin/bash")],
  [TTY अपग्रेड], [साधारण netcat शेल को Tab/Ctrl+C वाले फुल शेल में बदलें], [#cmd("python3 -c 'import pty;pty.spawn(\"/bin/bash\")'")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🧪 VirusTotal और EICAR Anti-Malware Test File (सेफ AV लैब)]
  #v(2pt)
  • #link("https://www.virustotal.com")[*VirusTotal.com*] — संदिग्ध फाइल, URL या `SHA-256` हैश को *70+ एंटीवायरस इंजनों* से तुरंत स्कैन करें!\
  • #link("https://www.eicar.org")[*EICAR Test File (eicar.org)*] — 100% सुरक्षित 68-बाइट टेक्स्ट फाइल जिससे बिना असली वायरस के अपने Antivirus/EDR की टेस्टिंग कर सकते हैं!
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.4pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[सिक्योरिटी साइट], text(fill: white, weight: "bold")[मैलवेयर विश्लेषण, सेफ AV टेस्टिंग व हैश लुकअप], text(fill: white, weight: "bold")[डायरेक्ट लिंक],
  [*VirusTotal*], [संदिग्ध फाइल/URL/हैश को एक साथ 70+ एंटीवायरस इंजनों से स्कैन करें], [#link("https://www.virustotal.com")[virustotal.com ↗]],
  [*EICAR Test File*], [AV/EDR अलर्ट जाँचने के लिए मानक 68-बाइट सुरक्षित एंटी-मैलवेयर टेस्ट स्ट्रिंग], [#link("https://www.eicar.org")[eicar.org ↗]],
  [*ANY.RUN Sandbox*], [लाइव प्रोसेस व नेटवर्क व्यवहार देखने के लिए क्लाउड मैलवेयर सैंडबॉक्स], [#link("https://app.any.run")[app.any.run ↗]],
  [*CrackStation*], [कमजोर MD5/SHA1/NTLM पासवर्ड हैश टेस्ट करने की विशाल लुकअप टेबल], [#link("https://crackstation.net")[crackstation.net ↗]],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[🚀 Privilege Escalation क्विक चेकलिस्ट (Linux व Windows)]
  #v(2pt)
  • *Linux:* #cmd("sudo -l"), SUID (`GTFOBins`), `/etc/cron*`, कर्नेल (`uname -a`) जाँचें।\
  • *Windows:* `whoami /priv`, `systeminfo`, unquoted service paths व `cmdkey /list` (`WinPEAS`)।
]

#did-you-know[
  *Salting* हैश करने से पहले हर यूज़र के पासवर्ड में रैंडम अक्षर जोड़ देता है! इसलिए यदि दो लोग एक ही पासवर्ड (`Admin@123`) रखें, तब भी `/etc/shadow` में उनके हैश बिल्कुल अलग दिखेंगे और *Rainbow Table* अटैक फेल हो जाएगा!
]

#pagebreak()

// =============================================================================
// PAGE 05: SNIFFING, WIRESHARK, DoS/DDoS, SESSION HIJACKING & IDS EVASION
// =============================================================================

#section-banner(num: "मॉड्यूल 07", title: "स्निफिंग, WIRESHARK फ़िल्टर्स और MITM हमले (मॉड्यूल 08)", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[फ़िल्टर / हमला], text(fill: white, weight: "bold")[पैकेट विश्लेषण व स्निफिंग उद्देश्य], text(fill: white, weight: "bold")[Wireshark / टूल],
  [#cmd("ip.addr == 10.0.0.5")], [किसी विशेष IP से आने या जाने वाले सभी पैकेट्स देखें], [`ip.src ==` / `ip.dst ==`],
  [#cmd("http.request")], [अनएन्क्रिप्टेड HTTP GET/POST लॉगिन व कुकीज़ जाँचें], [`http.request.method == "POST"`],
  [#cmd("tcp.port == 443")], [HTTPS (`443`), SSH (`22`), या DNS (`53`) ट्रैफ़िक फ़िल्टर करें], [`udp.port == 53`],
  [#cmd("tcp.flags.syn == 1")], [SYN Flood या Nmap Stealth SYN पोर्ट स्कैन पकड़ें], [`tcp.flags.reset == 1`],
  [ARP Poisoning (MITM)], [PC और राउटर के बीच नकली ARP रिप्लाई भेजकर ट्रैफ़िक इंटरसेप्ट करना], [`Bettercap`, `Ettercap`],
  [MAC Flooding], [स्विच की CAM टेबल भरकर उसे हब की तरह असुरक्षित बनाना], [बचाव: *Port Security*],
)

#v(2pt)
#section-banner(num: "मॉड्यूल 08", title: "DoS / DDoS, सेशन हाईजैकिंग और IDS / फ़ायरवॉल बाईपास", color: rtech-amber)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[🌊 DoS व DDoS हमलों के प्रकार]
      #v(2pt)
      • *SYN Flood:* सर्वर की हाफ-ओपन TCP टेबल भरना (बचाव: *SYN Cookies*)\
      • *DNS / NTP Amplification:* छोटे स्पूफ्ड पैकेट से भारी ट्रैफ़िक भेजना\
      • *HTTP Flood (L7):* सामान्य वेब ट्रैफ़िक जैसा दिखकर फ़ायरवॉल बाईपास\
      • *Botnet:* C2 सर्वर द्वारा नियंत्रित हैक्ड *Zombie* डिवाइसेज़ का नेटवर्क
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[🍪 सेशन हाईजैकिंग व बचाव]
      #v(2pt)
      • *Session ID चोरी:* HTTP स्निफिंग, XSS (`document.cookie`), ब्रूट-फोर्स\
      • *Session Fixation:* यूज़र को हमलावर की जानी हुई SID से लॉगिन कराना\
      • *बचाव:* हमेशा *HTTPS*, `HttpOnly` + `Secure` + `SameSite` कुकी फ्लैग उपयोग करें!
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[सुरक्षा तकनीक], text(fill: white, weight: "bold")[कार्यप्रणाली व बाईपास के तरीके], text(fill: white, weight: "bold")[उदाहरण],
  [IDS बनाम IPS], [*IDS* केवल अलर्ट देता है; *IPS* खतरनाक पैकेट्स को तुरंत ब्लॉक करता है], [`Snort`, `Suricata`],
  [WAF (Web App FW)], [SQLi, XSS व बॉट्स रोकने के लिए HTTP पेलोड की जाँच], [`Cloudflare`, `ModSecurity`],
  [Honeypot], [हमलावरों को फँसाने व अध्ययन करने के लिए नकली असुरक्षित सर्वर], [`Cowrie`, `Honeyd`],
  [IDS बाईपास], [पैकेट फ्रैगमेंटेशन (`-f`), धीमी टाइमिंग (`-T1`), TLS एन्क्रिप्शन], [बचाव: Deep Packet Inspection],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🧰 CyberChef और टॉप पैकेट/नेटवर्क GitHub Repos]
  #v(2pt)
  • #link("https://gchq.github.io/CyberChef/")[*CyberChef (GCHQ)*] — Base64, Hex, XOR, JWT व URL पेलोड डिकोड करने का "Cyber Swiss Army Knife"!\
  • *GitHub टूल्स:* #link("https://github.com/lgandx/Responder")[*Responder*] · #link("https://github.com/bettercap/bettercap")[*Bettercap*] (MITM) · #link("https://github.com/fortra/impacket")[*Impacket*] (SMB/Kerberos)
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.4pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[SOC / Blue साइट], text(fill: white, weight: "bold")[डिकोडिंग, थ्रेट इंटेल व PCAP विश्लेषण], text(fill: white, weight: "bold")[डायरेक्ट लिंक],
  [*CyberChef (GCHQ)*], [Base64, Hex, XOR, AES, JWT व Regex डिकोड करने का ऑनलाइन टूल], [#link("https://gchq.github.io/CyberChef/")[gchq.github.io/CyberChef ↗]],
  [*AbuseIPDB*], [संदिग्ध अटैकर IPs, बॉटनेट्स व SSH ब्रूट-फोर्स IPs की जाँच करें], [#link("https://www.abuseipdb.com")[abuseipdb.com ↗]],
  [*urlscan.io*], [बिना खोले किसी भी फ़िशिंग URL का सुरक्षित स्क्रीनशॉट व रीडायरेक्ट देखें], [#link("https://urlscan.io")[urlscan.io ↗]],
  [*The Hacker News*], [रोज़ाना के साइबर ब्रीच, CVEs और ज़ीरो-डे सिक्योरिटी अलर्ट्स], [#link("https://thehackernews.com")[thehackernews.com ↗]],
)

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[📡 CLI पैकेट कैप्चर (`tcpdump` व `tshark` 1-लाइनर्स)]
  #v(2pt)
  • `.pcap` कैप्चर करें: #cmd("sudo tcpdump -i eth0 -w cap.pcap port 80 or port 53")\
  • लाइव HTTP URLs निकालें: #cmd("tshark -i eth0 -Y 'http.request' -T fields -e http.host -e http.request.uri")
]

#did-you-know[
  सेशन कुकी पर *`HttpOnly`* फ्लैग लगाने से JavaScript (`document.cookie`) उसे पढ़ नहीं सकता — जिससे Cross-Site Scripting (XSS) के ज़रिए होने वाली सेशन चोरी पूरी तरह रुक जाती है!
]

#pagebreak()

// =============================================================================
// PAGE 06: WEB APPLICATION HACKING (OWASP TOP 10) & SQL INJECTION
// =============================================================================

#section-banner(num: "मॉड्यूल 09", title: "वेब एप्लिकेशन हैकिंग: OWASP TOP 10 और BURP SUITE", color: rtech-red)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[कमज़ोरी], text(fill: white, weight: "bold")[कार्यप्रणाली व वास्तविक नुकसान], text(fill: white, weight: "bold")[सुरक्षा उपाय],
  [Broken Access / IDOR], [`/api/user?id=101` को `102` करने पर दूसरे यूज़र का डेटा दिखना], [सर्वर-साइड रोल/ओनर जाँच],
  [XSS (Stored/Reflected)], [`<script>alert(1)</script>` डालकर यूज़र के ब्राउज़र में JS चलाना], [आउटपुट एन्कोडिंग + CSP],
  [CSRF], [लॉग-इन यूज़र के ब्राउज़र से अनचाहा फॉर्म सबमिट करवाना], [`SameSite` कुकी + CSRF टोकन],
  [SSRF], [सर्वर से आंतरिक URL (`http://169.254.169.254/`) फेच करवाना], [लोकल IP ब्लॉक व Allowlist],
  [Directory Traversal], [`../../../../etc/passwd` से सर्वर की गोपनीय फाइलें पढ़ना], [पाथ सैनिटाइजेशन + chroot],
  [Command Injection], [इनपुट में `; cat /etc/passwd` जोड़कर सर्वर शेल कमांड चलाना], [शेल एक्ज़ीक्यूशन से बचें],
)

#v(2pt)
#section-banner(num: "मॉड्यूल 10", title: "SQL INJECTION (SQLi) और SQLMAP चीट शीट (मॉड्यूल 15)", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[SQLi प्रकार / टूल], text(fill: white, weight: "bold")[पेलोड डेटाबेस को कैसे हैक करता है], text(fill: white, weight: "bold")[पेलोड / कमांड],
  [Auth Bypass], [`WHERE user=''` को हमेशा TRUE बूलियन शर्त में बदल देता है], [`admin' OR '1'='1' -- `],
  [UNION-Based SQLi], [हमलावर के `SELECT` परिणाम को मूल क्वेरी के साथ जोड़ता है], [`' UNION SELECT 1,user(),3-- `],
  [Error-Based SQLi], [डेटाबेस एरर मैसेज से टेबल व कॉलम के नाम उजागर करता है], [`' AND 1=CONVERT(int,@@version)--`],
  [Time-Based Blind], [आउटपुट दिखे बिना सर्वर की देरी (`SLEEP`) से डेटा का अनुमान लगाना], [`' OR SLEEP(5)-- `],
  [#cmd("sqlmap") ऑटो], [डेटाबेस, टेबल व पासवर्ड हैश डंप करने का ऑटोमेटेड टूल], [#cmd("sqlmap -u \"URL?id=1\" --dbs --batch")],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🕷️ Burp Suite वर्कफ़्लो (वेब पेंटेस्टिंग)]
      #v(2pt)
      • *Proxy:* `127.0.0.1:8080` पर HTTP/S अनुरोध रोकें व बदलें\
      • *Repeater:* SQLi/IDOR टेस्ट करने के लिए अनुरोध बार-बार भेजें\
      • *Intruder:* ऑटोमेटेड फ़ज़िंग व ब्रूट-फोर्स (`Sniper`/`Cluster Bomb`)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🛡️ SQL Injection रोकने का #1 गोल्डन नियम]
      #v(2pt)
      हमेशा *Parameterized Queries (Prepared Statements)* (`SELECT * FROM users WHERE id = ?`) का उपयोग करें — यूज़र इनपुट को सीधे SQL में न जोड़ें!
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[वेब रिकॉन टूल], text(fill: white, weight: "bold")[डायरेक्टरी, सबडोमेन व API खोजने का उद्देश्य], text(fill: white, weight: "bold")[कमांड],
  [#cmd("gobuster") / `ffuf`], [छिपे हुए `/admin`, `/backup`, `.env` व API एंडपॉइंट्स खोजना], [#cmd("gobuster dir -u URL -w list.txt")],
  [#cmd("nikto")], [पुराने Apache/Nginx वर्जन व सर्वर गलत कॉन्फ़िग स्कैन करना], [#cmd("nikto -h https://target.com")],
  [#cmd("subfinder")], [बग बाउंटी स्कोप के लिए तेज़ पैसिव सबडोमेन एन्यूमरेशन], [#cmd("subfinder -d target.com")],
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
  text(fill: white, weight: "bold")[वेब सिक्योरिटी साइट], text(fill: white, weight: "bold")[फ्री वेब हैकिंग लैब्स, CVE पेलोड्स व वर्डलिस्ट्स], text(fill: white, weight: "bold")[डायरेक्ट लिंक],
  [*PortSwigger Academy*], [SQLi, XSS, CSRF, SSRF व Burp Suite की 100% फ्री इंटरैक्टिव लैब्स], [#link("https://portswigger.net/web-security")[portswigger.net/web-security ↗]],
  [*Exploit-DB*], [पब्लिक एक्सप्लॉइट्स, PoCs और Google Hacking Database (GHDB) का भंडार], [#link("https://www.exploit-db.com")[exploit-db.com ↗]],
  [*GTFOBins*], [लोकल सुरक्षा बाईपास व PrivEsc के लिए Unix बाइनरीज़ की सूची], [#link("https://gtfobins.github.io")[gtfobins.github.io ↗]],
)

#did-you-know[
  *SSRF (Server-Side Request Forgery)* क्लाउड के लिए सबसे खतरनाक बग है! AWS/GCP/Azure पर एक SSRF बग `http://169.254.169.254/latest/meta-data/` से अस्थायी IAM क्लाउड क्रेडेंशियल्स चुरा सकता है!
]

#pagebreak()

// =============================================================================
// PAGE 07: WIRELESS, CLOUD, IOT & CRYPTOGRAPHY MASTERY (CEH MODULES 16-20)
// =============================================================================

#section-banner(num: "मॉड्यूल 11", title: "वायरलेस हैकिंग (WI-FI), क्लाउड और IoT/OT सुरक्षा", color: rtech-blue)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[📶 Wi-Fi एन्क्रिप्शन व Aircrack-ng]
      #v(2pt)
      • *WEP:* कमजोर RC4 (मिनटों में क्रैक) · *WPA2:* AES-CCMP (4-वे हैंडशेक)\
      • *WPA3:* SAE (Dragonfly) ऑफलाइन डिक्शनरी क्रैकिंग रोकता है!\
      • *ऑडिट क्रम:* #cmd("airmon-ng start wlan0") → #cmd("airodump-ng wlan0mon") → हैंडशेक कैप्चर → #cmd("aircrack-ng -w rockyou.txt cap.cap")
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[☁️ क्लाउड, कंटेनर व IoT/OT सुरक्षा]
      #v(2pt)
      • *Shared Responsibility:* क्लाउड हार्डवेयर बचाता है; *आप* IAM, OS व डेटा बचाते हैं\
      • *मुख्य जोखिम:* पब्लिक S3 बकेट्स, अतिरिक्त IAM `*` अनुमतियाँ, SSRF\
      • *IoT/OT जोखिम:* डिफ़ॉल्ट पासवर्ड, बिना एन्क्रिप्शन MQTT (OT/SCADA के लिए VLAN अलग रखें!)
    ]
  ]
)

#v(2pt)
#section-banner(num: "मॉड्यूल 12", title: "क्रिप्टोग्राफ़ी, हैशिंग, PKI और डिजिटल सिग्नेचर (मॉड्यूल 20)", color: rtech-purple)

#table(
  columns: (auto, auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[प्रकार], text(fill: white, weight: "bold")[एल्गोरिद्म], text(fill: white, weight: "bold")[मुख्य विशेषता व उपयोग], text(fill: white, weight: "bold")[की साइज],
  [*Symmetric*], [`AES`, `ChaCha20`, `3DES`], [एन्क्रिप्शन व डिक्रिप्शन के लिए एक ही की; बल्क डेटा के लिए तेज़], [`AES-128 / 256`],
  [*Asymmetric*], [`RSA`, `ECC`, `Diffie-Hellman`], [पब्लिक की से एन्क्रिप्ट, प्राइवेट की से डिक्रिप्ट; की एक्सचेंज], [`RSA-2048 / 4096`],
  [*Hashing*], [`SHA-256`, `SHA-3`, `bcrypt`], [वन-वे फिक्स्ड डाइजेस्ट; डेटा अखंडता जाँचता है (डिक्रिप्ट नहीं होता)], [`256-bit`],
  [*कमज़ोर/पुराने*], [`MD5`, `SHA-1`, `DES`, `RC4`], [कॉलिजन व छोटे की साइज के कारण असुरक्षित — *प्रोडक्शन में वर्जित!*], [अमान्य],
)

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[✍️ डिजिटल सिग्नेचर व PKI विश्वास कैसे सुनिश्चित करते हैं]
  #v(2pt)
  *1.* भेजने वाला दस्तावेज़ को हैश (`SHA-256`) कर अपनी *Private Key* से एन्क्रिप्ट करता है = Digital Signature.\
  *2.* प्राप्तकर्ता *Sender की Public Key* (CA सर्टिफिकेट से सत्यापित) से खोलता है → *Authentication + Integrity + Non-Repudiation* सिद्ध!
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[हमला / सुरक्षा], text(fill: white, weight: "bold")[Wi-Fi, Bluetooth, मोबाइल व AI सुरक्षा], text(fill: white, weight: "bold")[टूल / मानक],
  [Evil Twin AP], [लॉगिन चुराने के लिए असली जैसा नकली कॉर्पोरेट Wi-Fi हॉटस्पॉट], [`Wifiphisher`, `802.1X`],
  [मोबाइल पेंटेस्टिंग], [APK डीकम्पाइल करना, `AndroidManifest.xml` जाँच, SSL Pinning बाईपास], [`MobSF`, `Frida`, `jadx`],
  [AI], [एथिकल ऑडिटिंग में AI रिकॉन व SOC में ऑटोमेटेड थ्रेट कंटेनमेंट], [`SOAR` / AI Playbooks],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rtech-blue)[🐙 टॉप Ethical Hacking GitHub Repos]
      #v(2pt)
      • #link("https://github.com/swisskyrepo/PayloadsAllTheThings")[*PayloadsAllTheThings*] — SQLi, XSS, PrivEsc पेलोड्स\
      • #link("https://github.com/danielmiessler/SecLists")[*SecLists*] — #1 फ़ज़िंग व ब्रूट-फोर्स वर्डलिस्ट्स\
      • #link("https://github.com/peass-ng/PEASS-ng")[*LinPEAS / WinPEAS*] — ऑटो PrivEsc ऑडिट\
      • #link("https://github.com/projectdiscovery/nuclei")[*Nuclei*] — तेज़ YAML वल्नरेबिलिटी स्कैनर
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🌐 प्रैक्टिस लैब्स व ज़रूरी वेबसाइट्स]
      #v(2pt)
      • #link("https://tryhackme.com")[*TryHackMe.com*] व #link("https://hackthebox.com")[*HackTheBox.com*] — लैब्स\
      • #link("https://portswigger.net/web-security")[*PortSwigger Academy*] — #1 फ्री वेब सुरक्षा लैब\
      • #link("https://gtfobins.github.io")[*GTFOBins*] व #link("https://www.exploit-db.com")[*Exploit-DB*] — PrivEsc व CVE\
      • #link("https://www.virustotal.com")[*VirusTotal*] व #link("https://www.eicar.org")[*EICAR*] — मैलवेयर व AV टेस्टिंग
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
  text(fill: white, weight: "bold")[प्रैक्टिस प्लेटफॉर्म], text(fill: white, weight: "bold")[बेस्ट करियर व CTF ट्रेनिंग वेबसाइट्स (आज ही शुरू करें!)], text(fill: white, weight: "bold")[डायरेक्ट लिंक],
  [*TryHackMe*], [Linux, Nmap, SOC व पेंटेस्टिंग के लिए गाइडेड ब्राउज़र लैब्स], [#link("https://tryhackme.com")[tryhackme.com ↗]],
  [*Hack The Box (HTB)*], [रियल-वर्ल्ड वल्नरेबल मशीन्स व इंटरमीडिएट/प्रो पेंटेस्ट लैब्स], [#link("https://www.hackthebox.com")[hackthebox.com ↗]],
  [*picoCTF (CMU)*], [छात्रों व कॉलेजों के लिए 100% फ्री Capture The Flag पज़ल्स], [#link("https://picoctf.org")[picoctf.org ↗]],
  [*HackerOne / LetsDefend*], [कानूनी बग बाउंटी (नकद इनाम) व SOC ब्लू टीम सिमुलेशन लैब्स], [#link("https://www.hackerone.com")[hackerone.com ↗]],
)

#v(2pt)
#block(width: 100%, fill: rgb("#0F172A"), stroke: 0.7pt + rgb("#10B981"), radius: 3pt, inset: 5pt)[
  #text(size: 7.4pt, weight: "black", fill: rgb("#34D399"))[⚡ डेली एथिकल हैकर 5-कमांड टर्मिनल रूटीन]
  #v(1.5pt)
  #text(size: 7.1pt, fill: rgb("#E2E8F0"))[
    *1.* #cmd("sudo apt update && sudo apt full-upgrade -y") · *2.* #cmd("nmap -sS -sV -T4 target") · *3.* #cmd("gobuster dir -u URL -w common.txt") · *4.* #cmd("sqlmap -u URL?id=1 --dbs")
  ]
]

#did-you-know[ पहले *Asymmetric* (`RSA`/`ECDHE`) सुरक्षित रूप से सेशन की बदलता है; फिर *Symmetric* (`AES-256`) सारा डेटा एन्क्रिप्ट करता है क्योंकि यह *1,000 गुना अधिक तेज़* है!
]

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB, MOTTO, QR CODES, Q&A & WHATSAPP HELP DESK
// =============================================================================

#align(center)[
  #box(height: 22pt)[#image("02_BRAND_ASSETS/rtechlab-header-logo.png", height: 22pt)]
  #v(1.5pt)
  #text(size: 9.8pt, weight: "black", fill: rtech-navy)[ऑथर मेंटरशिप हब, प्रमाणन व इंटरव्यू वॉल्ट]
  #v(1pt)
  #text(size: 6.7pt, fill: rtech-muted)[RTechLab ओरिजिनल संस्करण · लेखक प्रमाणन · QR कोड्स · शीर्ष 10 इंटरव्यू प्रश्न-उत्तर]
]

#section-banner(num: "बिंदु 01", title: "लेखक परिचय व सर्टिफिकेट्स: राहुल पटेल — संस्थापक व सिस्टम्स आर्किटेक्ट", color: rtech-navy)

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
          height: 58pt,
          [#image("02_BRAND_ASSETS/rahul-patel.jpg", width: 100%, height: 100%, fit: "cover")]
        )
      ],
      [
        #text(size: 9.2pt, weight: "black", fill: rtech-navy)[राहुल पटेल] #h(4pt) #hl-b[10+ वर्षों का IT अनुभव] #h(3pt) #hl-g[3,000+ छात्र प्रशिक्षित]\
        #v(1pt)
        #text(size: 6.8pt, weight: "bold", fill: rtech-red)[Founder & Lead Systems Architect · RTechLab] · #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[Director · IANT Computer Education, Palanpur]\
        #v(1.5pt)
        #text(size: 6.6pt, weight: "bold", fill: rtech-navy)[
          🏅 *लेखक प्रमाणन:* #hl-r[CEH (Certified Ethical Hacker)] · #hl-b[CSCU (EC-Council)] · #hl-y[EHE (Star Certification)] · #hl-g[SCSU (Star Certification)]
        ]\
        #v(1.5pt)
        #text(size: 6.4pt, fill: rtech-navy)[
          *RTechLab ध्येय (Motto):* _"व्यावहारिक तकनीक (Technology Made Practical) — 100% ओरिजिनल व हैंड्स-ऑन साइबर सुरक्षा गाइड्स के साथ हर छात्र को सशक्त बनाना।"_
        ]
      ]
    )
  ]
)

#section-banner(num: "बिंदु 02", title: "लेखक पोर्टफोलियो, YouTube, Instagram और WhatsApp कम्युनिटी हब", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0F9FF"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 50pt)]
        #v(1pt)
        #text(size: 6.6pt, weight: "black", fill: rtech-blue)[ऑथर पोर्टफोलियो]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 50pt)]
        #v(1pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[YouTube चैनल]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 50pt)]
        #v(1pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[Instagram हब]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 50pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 50pt)]
        #v(1pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[WhatsApp चैनल]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[फ्री कम्युनिटी एक्सेस ↗]]
      ]
    ]
  ],
)

#section-banner(num: "बिंदु 03", title: "शीर्ष 10 और साइबर सुरक्षा इंटरव्यू प्रश्न-उत्तर", color: rtech-emerald)

#table(
  columns: (auto, 1fr),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[\#], text(fill: white, weight: "bold")[परीक्षा व SOC / Pentester इंटरव्यू प्रश्न व उत्तर],
  [*Q1*], [*Encryption बनाम Hashing?* Encryption टू-वे है (की से डिक्रिप्ट हो सकता है, जैसे AES); Hashing वन-वे है (डिक्रिप्ट नहीं होता, जैसे SHA-256)।],
  [*Q2*], [*SYN Scan (`-sS`) बनाम Connect Scan (`-sT`)?* `-sS` `SYN-ACK` के बाद `RST` भेजता है (गुप्त, हाफ-ओपन); `-sT` पूरा 3-वे हैंडशेक करता है।],
  [*Q3*], [*SQL Injection हमेशा के लिए कैसे रोकें?* Parameterized Queries (Prepared Statements), सख्त इनपुट जाँच व सीमित DB अधिकार उपयोग करें।],
  [*Q4*], [*XSS बनाम CSRF?* XSS यूज़र के ब्राउज़र में गलत JS चलाता है; CSRF लॉग-इन यूज़र के ब्राउज़र से अनचाहा अनुरोध भेजता है।],
  [*Q5*], [*DNSSEC क्या सुरक्षा देता है?* यह DNS उत्तरों की ऑरिजिन ऑथेंटिकेशन व अखंडता बचाता है (स्पूफिंग रोकता है, ट्रैफ़िक एन्क्रिप्ट नहीं करता)।],
  [*Q6*], [*VA बनाम Penetration Testing?* VA कमजोरियाँ खोजता व रैंक करता है (`Nessus`); Pentesting जोखिम सिद्ध करने हेतु उन्हें एक्सप्लॉइट करता है।],
  [*Q7*], [*IDS बनाम IPS बनाम SIEM?* IDS अलर्ट देता है; IPS रोकता है; SIEM (`Splunk`/`Wazuh`) सभी सर्वरों के लॉग्स जोड़कर SOC विश्लेषण करता है।],
  [*Q8*], [*Zero-Day कमज़ोरी क्या है?* ऐसी नई सॉफ्टवेयर त्रुटि जिसका वेंडर पैच अभी तक न बना हो — WAF/IPS वर्चुअल पैचिंग से बचाया जाता है।],
  [*Q9*], [*Symmetric बनाम Asymmetric गति?* Symmetric (`AES-256`) ~1,000 गुना तेज़ है; Asymmetric (`RSA`) सुरक्षित की एक्सचेंज के लिए उपयोग होता है।],
  [*Q10*], [*Reverse Shell क्या है?* टारगेट स्वयं बाहर हमलावर के लिसनर (`nc -lvnp`) से जुड़ता है, जिससे इनबाउंड फ़ायरवॉल बाईपास हो जाता है।],
)

#did-you-know[
  *कानूनी व नैतिक नियम:* बिना लिखित अनुमति किसी भी वेबसाइट, Wi-Fi या सर्वर को स्कैन न करें! हमेशा *TryHackMe*, *HackTheBox*, *PortSwigger Academy*, या अपनी खुद की *Kali Linux* वर्चुअल लैब में ही अभ्यास करें।
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
        🚀 RTechLab की सम्पूर्ण मास्टर बुक्स, प्रैक्टिकल लैब्स और करियर सूट के लिए विज़िट करें: #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]
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
            [#text(size: 7.2pt, weight: "bold", fill: rgb("#A7F3D0"))[RTechLab WhatsApp हेल्प डेस्क: ] #link("https://wa.me/917646892094")[#text(size: 7.6pt, weight: "black", fill: white)[+91 76468 92094]] #text(size: 6.5pt, fill: rgb("#6EE7B7"))[ (केवल चैट सहायता)]]
          )
        ]
      ],
      [
        #box(fill: rgb("#DC2626"), radius: 3pt, inset: (x: 7pt, y: 4pt))[
          #text(size: 7.0pt, weight: "black", fill: white)[· 2027 संस्करण]
        ]
      ]
    )
  ]
)
