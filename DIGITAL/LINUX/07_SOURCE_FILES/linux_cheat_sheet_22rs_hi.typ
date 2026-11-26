// =============================================================================
// RTECHLAB LINUX & SHELL MASTERY DESK CHEAT SHEET (HINDI EDITION 1)
// Exactly 8 Pages · Page 1 Blank Cover Placeholder · Printable Daily Desk Companion
// Author: Rahul Patel (Founder & Systems Architect, RTechLab)
// =============================================================================

#set document(
  title: "Linux & Shell Mastery Desk Reference & Cheat Sheet (Hindi)",
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
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[लिनक्स एवं शेल मास्टरी डेस्क चीट शीट (हिंदी)]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#059669"))[RHEL · Ubuntu · Fedora · Kali · Bash · DevOps]
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
            #text(fill: rgb("#0284C7"))[●] व्यावहारिक तकनीक · प्रिंट करके डेस्क पर रखें · फ्री टूल्स: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
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
  size: 8.4pt,
  fill: rgb("#0F172A"),
  spacing: 100%
)

#set par(
  justify: false,
  leading: 0.62em,
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
#let cmd(k) = box(fill: rgb("#F1F5F9"), stroke: 0.5pt + rgb("#94A3B8"), radius: 2pt, inset: (x: 2.5pt, y: 0.8pt))[#text(size: 6.5pt, font: ("Consolas", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#k]]

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-blue) = {
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
  v(2pt)
}

// =============================================================================
// PAGE 01: 4K FULL-BLEED COVER PAGE
// =============================================================================
#page(margin: 0pt, header: none, footer: none, background: none)[
  #image("02_BRAND_ASSETS/linux_cover_4k.png", width: 100%, height: 100%, fit: "cover")
]

// =============================================================================
// PAGE 02: LINUX DISTROS (RHEL, UBUNTU, FEDORA, KALI) & FILE SYSTEM HIERARCHY
// =============================================================================

#section-banner(num: "मॉड्यूल 01", title: "प्रमुख लिनक्स डिस्ट्रो: RED HAT, UBUNTU, FEDORA और KALI LINUX", color: rtech-red)

#text(size: 6.9pt, fill: rtech-muted)[
  Linux एक #hl-b[फ्री और ओपन-सोर्स OS कर्नेल] है जिसे 1991 में Linus Torvalds ने बनाया। अलग-अलग कंपनियाँ इसके साथ टूल्स व पैकेज मैनेजर जोड़कर *Distros* बनाती हैं:
]
#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#B91C1C"))[Red Hat Enterprise Linux (RHEL)]],
        [#image("02_BRAND_ASSETS/logo_redhat.png", height: 14pt)]
      )
      #v(2pt)
      • *पैकेज मैनेजर:* #cmd("dnf") / #cmd("yum") (`.rpm`)\
      • *रिलीज़:* लॉन्ग-टर्म सपोर्ट (10 वर्ष तक स्थिर)\
      • *उपयोग:* #hl-r[बैंकिंग, टेलीकॉम, कॉर्पोरेट डेटा सेंटर व क्लाउड]\
      • *प्रमुख सर्टिफिकेट:* RHCSA (EX200) एवं RHCE।
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#C2410C"))[Ubuntu (Canonical)]],
        [#image("02_BRAND_ASSETS/logo_ubuntu.png", height: 16pt)]
      )
      #v(2pt)
      • *पैकेज मैनेजर:* Debian-आधारित · #cmd("apt") / #cmd("snap") (`.deb`)\
      • *रिलीज़:* हर 2 साल में 5-वर्षीय LTS (जैसे 24.04 LTS)\
      • *उपयोग:* #hl-y[शुरुआती छात्र, AWS/Azure क्लाउड, Docker और AI/ML]\
      • *खास बात:* पब्लिक क्लाउड सर्वर पर सबसे अधिक उपयोग होता है।
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#EFF6FF"), stroke: 0.6pt + rgb("#93C5FD"), radius: 3pt, inset: 5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#1D4ED8"))[Fedora Workstation / Server]],
        [#image("02_BRAND_ASSETS/logo_fedora.png", height: 16pt)]
      )
      #v(2pt)
      • *पैकेज मैनेजर:* Red Hat समर्थित · #cmd("dnf") (`.rpm`)\
      • *रिलीज़:* तेज़ (~6 महीने), नवीनतम कर्नेल व GNOME\
      • *उपयोग:* #hl-b[डेवलपर्स, मॉडर्न डेस्कटॉप व RHEL टेस्टिंग]\
      • *खास बात:* Linus Torvalds स्वयं Fedora का उपयोग करते हैं!
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rgb("#C4B5FD"), radius: 3pt, inset: 5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#6D28D9"))[Kali Linux (साइबर सुरक्षा)]],
        [#image("02_BRAND_ASSETS/logo_kali.png", height: 15pt)]
      )
      #v(2pt)
      • *पैकेज मैनेजर:* Debian Testing · #cmd("apt") (`.deb`)\
      • *रिलीज़:* Rolling Release (निरंतर सिक्योरिटी अपडेट)\
      • *उपयोग:* #hl-g[एथिकल हैकिंग, पेनिट्रेशन टेस्टिंग व फॉरेंसिक्स]\
      • *टूल्स:* 600+ प्री-इंस्टॉल्ड (`nmap`, `metasploit`, `wireshark`)।
    ]
  ]
)

#v(3pt)
#section-banner(num: "मॉड्यूल 02", title: "लिनक्स फाइल सिस्टम (FHS) और नेविगेशन कमांड्स", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto, 1fr),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[डायरेक्टरी], text(fill: white, weight: "bold")[उद्देश्य व सामग्री],
  text(fill: white, weight: "bold")[डायरेक्टरी], text(fill: white, weight: "bold")[उद्देश्य व सामग्री],
  [#cmd("/")], [Root डायरेक्टरी — पूरे लिनक्स ट्री का शीर्ष],
  [#cmd("/etc")], [सिस्टम कॉन्फ़िगरेशन फाइल्स (`passwd`, `fstab`, `ssh`)],
  [#cmd("/home")], [सामान्य यूज़र्स के पर्सनल फोल्डर (`/home/rahul`)],
  [#cmd("/var")], [लॉग फाइल्स, मेल, वेब डेटा (`/var/log/syslog`)],
  [#cmd("/root")], [केवल `root` एडमिन के लिए होम डायरेक्टरी],
  [#cmd("/tmp")], [अस्थायी फाइल्स (रीबूट पर स्वतः साफ़)],
  [#cmd("/bin") / `/usr/bin`], [आवश्यक कमांड बाइनरी (`ls`, `cp`, `cat`, `grep`)],
  [#cmd("/proc")], [लाइव कर्नेल व प्रोसेस जानकारी के लिए वर्चुअल सिस्टम],
  [#cmd("/dev")], [हार्डवेयर डिवाइस फाइल्स (`/dev/sda`, `/dev/null`)],
  [#cmd("/opt")], [अतिरिक्त थर्ड-पार्टी सॉफ्टवेयर (Chrome, कस्टम ऐप्स)],
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto, 1fr),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[कमांड], text(fill: white, weight: "bold")[कार्य],
  text(fill: white, weight: "bold")[कमांड], text(fill: white, weight: "bold")[कार्य],
  [#cmd("pwd")], [वर्तमान कार्यरत डायरेक्टरी का पूरा पाथ दिखाता है],
  [#cmd("cd ~") / #cmd("cd -")], [होम फोल्डर में जाएँ / पिछले फोल्डर पर लौटें],
  [#cmd("ls -lah")], [छिपी हुई फाइल्स (`.`) सहित विस्तृत सूची व साइज],
  [#cmd("tree -L 2")], [2 स्तर गहराई तक फोल्डर का ट्री स्ट्रक्चर देखें],
  [#cmd("find /etc -name '*.conf'")], [डिस्क पर पैटर्न के अनुसार फाइल्स खोजें],
  [#cmd("which python3")], [किसी कमांड की सटीक बाइनरी लोकेशन देखें],
  [#cmd("clear") / `Ctrl+L`], [टर्मिनल स्क्रीन साफ़ करें],
  [#cmd("man ls") / #cmd("ls --help")], [कमांड का मैनुअल पेज या त्वरित सहायता देखें],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.6pt, weight: "black", fill: rtech-navy)[🧭 Absolute बनाम Relative पाथ]
      #v(2pt)
      • *Absolute Path* (`/` से शुरू): #cmd("cd /var/log/nginx")\
      • *Relative Path* (मौजूदा फोल्डर से): #cmd("cd ./logs") या #cmd("cd ../etc")\
      • #cmd(".") = वर्तमान फोल्डर · #cmd("..") = पैरेंट फोल्डर · #cmd("~") = होम
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.6pt, weight: "black", fill: rtech-blue)[🐚 Linux Shells व Distro Quick-Pick]
      #v(2pt)
      • *Bash* (`/bin/bash`): Ubuntu/RHEL/Fedora डिफ़ॉल्ट · *Zsh*: Kali डिफ़ॉल्ट\
      • *Shell जाँच:* #cmd("echo $SHELL") · *Distro जाँच:* #cmd("cat /etc/os-release")\
      • *चुनें:* सर्वर → *RHEL/Ubuntu* · डेस्कटॉप → *Fedora* · सुरक्षा → *Kali*
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, auto, auto, auto, 1fr),
  inset: (x: 4.5pt, y: 3.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[डिस्ट्रो], text(fill: white, weight: "bold")[पैकेज], text(fill: white, weight: "bold")[फ़ायरवॉल], text(fill: white, weight: "bold")[डिफ़ॉल्ट शेल], text(fill: white, weight: "bold")[मुख्य एंटरप्राइज / करियर उपयोग],
  [*RHEL*], [`.rpm` (`dnf`)], [`firewalld`], [`bash`], [बैंकिंग, टेलीकॉम व RHCSA/RHCE सर्टिफिकेशन],
  [*Ubuntu*], [`.deb` (`apt`)], [`ufw`], [`bash`], [क्लाउड VMs (AWS/GCP/Azure), Docker व DevOps],
  [*Fedora*], [`.rpm` (`dnf`)], [`firewalld`], [`bash`], [डेवलपर वर्कस्टेशन व अपस्ट्रीम RHEL लैब],
  [*Kali*], [`.deb` (`apt`)], [`ufw`/`nft`], [`zsh`], [एथिकल हैकिंग, VAPT व SOC एनालिस्ट],
)

#did-you-know[
  दुनिया के *100% टॉप 500 सुपरकंप्यूटर*, *96%+ टॉप वेब सर्वर्स*, और *Android* भी Linux कर्नेल पर चलते हैं। Linux सीखकर आप Cloud, DevOps और Cyber Security करियर की नींव मजबूत करते हैं!
]

#pagebreak()

// =============================================================================
// PAGE 03: FILE OPERATIONS, ARCHIVES & TEXT PROCESSING 1-LINERS
// =============================================================================

#section-banner(num: "मॉड्यूल 03", title: "फाइल, फोल्डर, लिंक और आर्काइव (ZIP/TAR) कमांड्स", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[कमांड], text(fill: white, weight: "bold")[विवरण व व्यावहारिक उपयोग], text(fill: white, weight: "bold")[उदाहरण],
  [#cmd("mkdir -p")], [एक साथ कई नेस्टेड फोल्डर बनाएँ (त्रुटि रहित)], [#cmd("mkdir -p app/src/logs")],
  [#cmd("touch")], [नई खाली फाइल बनाएँ या टाइमस्टैम्प अपडेट करें], [#cmd("touch notes.txt")],
  [#cmd("cp -rp")], [परमिशन सुरक्षित रखते हुए फोल्डर कॉपी करें], [#cmd("cp -rp src/ backup/")],
  [#cmd("mv")], [फाइल/फोल्डर को मूव करें या नाम बदलें (Rename)], [#cmd("mv old.txt new.txt")],
  [#cmd("rm -rf")], [फोल्डर को हमेशा के लिए डिलीट करें (*सावधानी से उपयोग करें!*)], [#cmd("rm -rf ./temp_cache")],
  [#cmd("ln -s")], [Symbolic (Soft) Link बनाएँ — Windows शॉर्टकट जैसा], [#cmd("ln -s /var/www html")],
  [#cmd("file") / #cmd("stat")], [असली फाइल प्रकार पहचानें / inode व समय देखें], [#cmd("stat app.log")],
  [#cmd("tar -czvf")], [फोल्डर को `.tar.gz` में कंप्रेस करें], [#cmd("tar -czvf bkp.tar.gz dir/")],
  [#cmd("tar -xzvf")], [`.tar.gz` आर्काइव को एक्सट्रैक्ट करें], [#cmd("tar -xzvf bkp.tar.gz")],
  [#cmd("zip -r") / #cmd("unzip")], [`.zip` फाइल बनाएँ या एक्सट्रैक्ट करें], [#cmd("unzip bundle.zip")],
)

#v(3pt)
#section-banner(num: "मॉड्यूल 04", title: "टेक्स्ट प्रोसेसिंग, सर्चिंग, पाइप्स (|) और रीडायरेक्शन", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[कमांड], text(fill: white, weight: "bold")[कार्य], text(fill: white, weight: "bold")[प्रो 1-लाइनर],
  [#cmd("cat") / #cmd("less")], [पूरी फाइल प्रिंट करें / बड़ी फाइल पेज-दर-पेज देखें (`q` से बाहर)], [#cmd("less /var/log/syslog")],
  [#cmd("head -n 20")], [फाइल की शुरुआती 20 लाइनें देखें], [#cmd("head -n 20 data.csv")],
  [#cmd("tail -f")], [लाइव लॉग अपडेट्स रीयल-टाइम में देखें (डीबगिंग के लिए बेस्ट!)], [#cmd("tail -f /var/log/nginx/error.log")],
  [#cmd("grep -rni")], [फोल्डर में केस-इनसेंसिटिव टेक्स्ट सर्च (लाइन नंबर सहित)], [#cmd("grep -rni 'ERROR' /var/log")],
  [#cmd("awk")], [टेक्स्ट या CSV से विशिष्ट कॉलम निकालें], [#cmd("awk '{print $1, $4}' access.log")],
  [#cmd("sed -i")], [फाइल के अंदर सीधे शब्द खोजें और बदलें (Find & Replace)], [#cmd("sed -i 's/http/https/g' cfg.txt")],
  [#cmd("cut -d',' -f1")], [कॉमा `,` या कोलन `:` से कॉलम अलग करें], [#cmd("cut -d':' -f1 /etc/passwd")],
  [#cmd("sort | uniq -c")], [लाइनों को सॉर्ट करें और डुप्लीकेट गिनें], [#cmd("sort ips.txt | uniq -c | sort -nr")],
  [#cmd("wc -l")], [कुल लाइनों की संख्या गिनें], [#cmd("cat users.txt | wc -l")],
)

#v(3pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-navy)[🔀 स्टैंडर्ड स्ट्रीम्स व रीडायरेक्शन]
      #v(2pt)
      • #cmd("cmd > file.txt") : आउटपुट से फाइल ओवरराइट करें\
      • #cmd("cmd >> file.txt") : फाइल के अंत में आउटपुट जोड़ें\
      • #cmd("cmd 2> err.log") : केवल एरर (stderr `2`) सेव करें\
      • #cmd("cmd > out.log 2>&1") : आउटपुट व एरर एक फाइल में\
      • #cmd("cmd > /dev/null 2>&1") : सारा आउटपुट साइलेंट करें
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-blue)[⚡ शेल वाइल्डकार्ड व हिस्ट्री शॉर्टकट्स]
      #v(2pt)
      • #cmd("*") किसी भी अक्षर से मेल खाता है; #cmd("?") केवल 1 अक्षर\
      • #cmd("!!") : पिछला कमांड दोबारा चलाएँ (जैसे #cmd("sudo !!"))\
      • #cmd("Ctrl + R") : कमांड हिस्ट्री में रिवर्स सर्च करें\
      • #cmd("Ctrl + C") / #cmd("Ctrl + Z") : बंद करें / पॉज़ करें\
      • #cmd("cmd1 && cmd2") : `cmd1` सफल होने पर ही `cmd2` चलाएँ
    ]
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.6pt, weight: "black", fill: rgb("#065F46"))[🔥 शीर्ष 4 रियल-वर्ल्ड लॉग व टेक्स्ट 1-लाइनर्स (DevOps डेली यूज़)]
  #v(2pt)
  *1.* Nginx पर टॉप 10 IP: #cmd("awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -10")\
  *2.* 7 दिन पुराने `.log` हटाएँ: #cmd("find /var/log -name '*.log' -mtime +7 -delete")\
  *3.* 404 एरर गिनें: #cmd("grep ' 404 ' /var/log/nginx/access.log | wc -l") · *4.* कमेंट्स हटाकर पढ़ें: #cmd("grep -vE '^#|^$' /etc/ssh/sshd_config")
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[टूल / कॉन्सेप्ट], text(fill: white, weight: "bold")[फाइल सुरक्षा, कम्प्रेशन व एडवांस्ड उपयोग], text(fill: white, weight: "bold")[कमांड],
  [#cmd("sha256sum")], [डाउनलोड की गई ISO / बैकअप फाइल की अखंडता जाँचें], [#cmd("sha256sum ubuntu.iso")],
  [#cmd("gzip") / #cmd("xz")], [तेज़ `.gz` कम्प्रेशन बनाम अल्ट्रा-हाई `.xz` कम्प्रेशन], [#cmd("tar -cJvf bkp.tar.xz dir/")],
  [#cmd("xargs")], [पाइप से मिले आउटपुट को अगले कमांड के आर्ग्युमेंट के रूप में भेजें], [#cmd("find . -name '*.tmp' | xargs rm")],
  [#cmd("split -b 100M")], [बड़ी बैकअप/लॉग फाइल को 100MB के हिस्सों में बाँटें], [#cmd("split -b 100M db.sql part_")],
  [`atime`/`mtime`/`ctime`], [एक्सेस समय, कंटेंट बदलाव समय, व Inode मेटाडेटा समय], [#cmd("stat /etc/hosts")],
)

#did-you-know[
  Linux में *"Everything is a file"* का सिद्धांत चलता है — सामान्य फाइल्स, फोल्डर, हार्ड ड्राइव (`/dev/nvme0n1`), और लाइव CPU/RAM की जानकारी (`/proc/cpuinfo`) भी फाइल की तरह पढ़ी जा सकती है!
]

#pagebreak()

// =============================================================================
// PAGE 04: USERS, GROUPS & PERMISSIONS MATRIX (chmod, chown, umask)
// =============================================================================

#section-banner(num: "मॉड्यूल 05", title: "यूज़र्स, ग्रुप्स और SUDO एडमिनिस्ट्रेशन", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[कमांड / फाइल], text(fill: white, weight: "bold")[प्रशासनिक कार्य], text(fill: white, weight: "bold")[उदाहरण],
  [#cmd("whoami") / #cmd("id")], [वर्तमान यूज़र, UID, GID व ग्रुप्स की जानकारी देखें], [#cmd("id rahul")],
  [#cmd("sudo useradd -m")], [होम डायरेक्टरी के साथ नया यूज़र बनाएँ], [#cmd("sudo useradd -m -s /bin/bash dev")],
  [#cmd("sudo passwd dev")], [यूज़र का लॉगिन पासवर्ड सेट या रीसेट करें], [#cmd("sudo passwd dev")],
  [#cmd("sudo usermod -aG")], [यूज़र को अतिरिक्त ग्रुप में जोड़ें (`-aG` = Append!)], [#cmd("sudo usermod -aG sudo,docker dev")],
  [#cmd("su - username")], [पूर्ण एनवायरनमेंट के साथ यूज़र स्विच करें], [#cmd("su - root")],
  [#cmd("/etc/passwd")], [यूज़र अकाउंट, UID, GID व डिफ़ॉल्ट शेल की सूची], [`rahul:x:1000:1000::/home/rahul:/bin/bash`],
  [#cmd("/etc/shadow")], [एन्क्रिप्टेड पासवर्ड हैश (केवल `root` पढ़ सकता है)], [`sudo cat /etc/shadow`],
  [#cmd("visudo")], [सिंटैक्स चेक के साथ सुरक्षित रूप से `/etc/sudoers` एडिट करें], [#cmd("sudo visudo")],
)

#v(3pt)
#section-banner(num: "मॉड्यूल 06", title: "फाइल परमिशन मैट्रिक्स (chmod, chown, umask व SPECIAL BITS)", color: rtech-amber)

#grid(
  columns: (1.1fr, 1fr),
  gutter: 6pt,
  [
    #table(
      columns: (auto, auto, auto, 1fr),
      inset: (x: 5pt, y: 5.0pt),
      stroke: 0.5pt + rgb("#CBD5E1"),
      fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#FFFBEB") } else { white },
      text(fill: white, weight: "bold")[चिह्न], text(fill: white, weight: "bold")[अंक], text(fill: white, weight: "bold")[फाइल पर], text(fill: white, weight: "bold")[फोल्डर पर],
      [#hl-g[`r` (Read)]], [*4*], [फाइल पढ़ें], [लिस्ट देखें (`ls`)],
      [#hl-y[`w` (Write)]], [*2*], [बदलाव करें], [फाइल बनाएँ/हटाएँ],
      [#hl-b[`x` (Execute)]], [*1*], [स्क्रिप्ट चलाएँ], [प्रवेश करें (`cd`)],
      [#hl-r[`-` (None)]], [*0*], [कोई अनुमति नहीं], [कोई अनुमति नहीं],
    )
    #v(2pt)
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 4.5pt)[
      #text(size: 7pt, weight: "black")[परमिशन स्ट्रिंग: `-rwxr-xr--` (`754`)]
      #v(1pt)
      • अक्षर 1 (`-`/`d`/`l`): प्रकार (`-` फाइल, `d` फोल्डर, `l` लिंक)\
      • अक्षर 2–4 (`rwx` = 4+2+1 = *7*): *Owner (मालिक)*\
      • अक्षर 5–7 (`r-x` = 4+0+1 = *5*): *Group (समूह)*\
      • अक्षर 8–10 (`r--` = 4+0+0 = *4*): *Others (अन्य)*
    ]
  ],
  [
    #table(
      columns: (auto, 1fr),
      inset: (x: 5pt, y: 5.0pt),
      stroke: 0.5pt + rgb("#CBD5E1"),
      fill: (_, row) => if row == 0 { rgb("#D97706") } else if calc.even(row) { rgb("#FEF3C7") } else { white },
      text(fill: white, weight: "bold")[ऑक्टल / कमांड], text(fill: white, weight: "bold")[वास्तविक उपयोग],
      [#cmd("chmod 755")], [स्क्रिप्ट्स व वेब फोल्डर्स (`rwxr-xr-x`)],
      [#cmd("chmod 644")], [सामान्य कॉन्फ़िग व HTML फाइल्स (`rw-r--r--`)],
      [#cmd("chmod 600")], [प्राइवेट SSH कीज़ (`~/.ssh/id_ed25519`)],
      [#cmd("chmod 700")], [प्राइवेट यूज़र होम/बैकअप फोल्डर],
      [#cmd("chmod +x s.sh")], [Bash स्क्रिप्ट को तुरंत चलाने योग्य बनाएँ],
      [#cmd("chown -R u:g d/")], [Owner व Group दोनों रिकर्सिव रूप से बदलें],
      [#cmd("umask 022")], [डिफ़ॉल्ट मास्क: नई फाइल `644`, फोल्डर `755`],
    )
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#FFF1F2"), stroke: 0.6pt + rgb("#FDA4AF"), radius: 3pt, inset: 4.5pt)[
  #text(size: 7.1pt, weight: "black", fill: rgb("#9F1239"))[🔐 स्पेशल परमिशन्स (चौथा अंक):]
  #h(4pt)
  #hl-r[SUID (`4xxx`)] बाइनरी *मालिक के अधिकार* से चलती है (`/usr/bin/passwd`) ·
  #hl-b[SGID (`2xxx`)] नई फाइलें पैरेंट ग्रुप अपनाती हैं ·
  #hl-y[Sticky Bit (`1xxx`)] शेयर्ड फोल्डर में केवल मालिक अपनी फाइल हटा सकता है (`/tmp` = `1777`).
]

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[⏳ पासवर्ड एक्सपायरी (`chage`) व Sudoers]
      #v(2pt)
      • #cmd("sudo chage -l rahul") : पासवर्ड एक्सपायरी नीति देखें\
      • #cmd("sudo chage -M 90 rahul") : हर 90 दिन में पासवर्ड बदलना अनिवार्य\
      • `/etc/sudoers`: `rahul ALL=(ALL) NOPASSWD: /usr/bin/systemctl`
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[📋 Access Control Lists (ACL) — सटीक परमिशन]
      #v(2pt)
      • #cmd("getfacl file.txt") : अतिरिक्त ACL परमिशन्स देखें\
      • #cmd("setfacl -m u:dev:rw file.txt") : ग्रुप बदले बिना `dev` को `rw` दें\
      • #cmd("setfacl -b file.txt") : सभी अतिरिक्त ACL हटाएँ
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[सिक्योरिटी जाँच], text(fill: white, weight: "bold")[ऑडिट व विशेषाधिकार सत्यापन उद्देश्य], text(fill: white, weight: "bold")[कमांड],
  [Sudo ऑडिट लॉग], [`sudo` कमांड्स और असफल SSH लॉगिन प्रयास देखें], [#cmd("sudo tail -f /var/log/auth.log")],
  [RHEL सिक्योर लॉग], [RHEL/Fedora पर ऑथेंटिकेशन व `sudo` लॉग जाँचें], [#cmd("sudo tail -f /var/log/secure")],
  [लॉग-इन यूज़र्स], [सक्रिय SSH सेशन, IP और चल रहे कार्य देखें], [#cmd("w") / #cmd("who") / #cmd("last -n 10")],
  [World-Writable खोजें], [सिस्टम पर असुरक्षित `777` परमिशन्स वाली फाइलें खोजें], [#cmd("find / -perm -0002 -type f 2>/dev/null")],
  [यूज़र लॉक/अनलॉक], [संदिग्ध अकाउंट को तुरंत फ्रीज़ या बहाल करें], [#cmd("sudo usermod -L dev") / #cmd("-U")],
)

#did-you-know[
  प्रोडक्शन सर्वर पर कभी भी `chmod 777` का उपयोग न करें! इससे कोई भी यूज़र या हैक्ड सर्विस आपकी फाइल्स बदल सकती है। सुरक्षित डिफ़ॉल्ट फोल्डर के लिए `755`, फाइल्स के लिए `644`, और SSH कीज़ के लिए `600` है।
]

#pagebreak()

// =============================================================================
// PAGE 05: PROCESS MANAGEMENT, SYSTEMD SERVICES & DISK/MEMORY DIAGNOSTICS
// =============================================================================

#section-banner(num: "मॉड्यूल 07", title: "प्रोसेस मैनेजमेंट, सिग्नल्स और SYSTEMD सर्विसेज", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[कमांड], text(fill: white, weight: "bold")[विवरण], text(fill: white, weight: "bold")[उदाहरण],
  [#cmd("ps aux | grep")], [चल रहे सभी प्रोसेस का नाम के अनुसार स्नैपशॉट], [#cmd("ps aux | grep nginx")],
  [#cmd("top") / #cmd("htop")], [लाइव CPU, RAM, लोड एवरेज व PID मॉनिटर], [#cmd("htop")],
  [#cmd("kill -15 PID")], [`SIGTERM` — प्रोसेस को सुरक्षित बंद होने का निर्देश], [#cmd("kill -15 4821")],
  [#cmd("kill -9 PID")], [`SIGKILL` — हैंग प्रोसेस को तुरंत जबरन बंद करें], [#cmd("kill -9 4821")],
  [#cmd("pkill -f name")], [कमांड नाम से सभी मिलते-जुलते प्रोसेस बंद करें], [#cmd("pkill -f python3")],
  [#cmd("nohup cmd &")], [लॉगआउट के बाद भी बैकग्राउंड में जॉब चलाते रहें], [#cmd("nohup ./sync.sh &")],
  [#cmd("systemctl status")], [जाँचें कि सर्विस चल रही है या फेल हुई है], [#cmd("systemctl status ssh")],
  [#cmd("systemctl restart")], [कॉन्फ़िग बदलाव के बाद सर्विस रीस्टार्ट करें], [#cmd("sudo systemctl restart nginx")],
  [#cmd("systemctl enable --now")], [सर्विस अभी शुरू करें + बूट पर ऑटो-स्टार्ट सेट करें], [#cmd("sudo systemctl enable --now docker")],
  [#cmd("journalctl -u")], [Systemd लॉग्स देखें (`-f` लाइव, `-xe` एरर)], [#cmd("journalctl -u nginx -n 50")],
)

#v(3pt)
#section-banner(num: "मॉड्यूल 08", title: "डिस्क, फाइल सिस्टम, मेमोरी और हार्डवेयर डायग्नोस्टिक्स", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[कमांड], text(fill: white, weight: "bold")[हार्डवेयर / स्टोरेज जानकारी], text(fill: white, weight: "bold")[प्रो जाँच],
  [#cmd("df -h")], [माउंट किए गए पार्टिशन में खाली डिस्क स्पेस], [#cmd("df -hT") (ext4/xfs सहित)],
  [#cmd("du -sh *")], [वर्तमान पथ के प्रत्येक फोल्डर का साइज देखें], [#cmd("du -sh /var/* | sort -hr")],
  [#cmd("free -h")], [RAM और Swap उपयोग (`available` = असली खाली RAM)], [#cmd("free -h")],
  [#cmd("lsblk")], [सभी डिस्क, पार्टिशन व माउंट पॉइंट्स की सूची], [#cmd("lsblk -f")],
  [#cmd("uptime")], [सर्वर अपटाइम + 1m, 5m, 15m CPU लोड एवरेज], [#cmd("uptime")],
  [#cmd("lscpu") / #cmd("uname -a")], [CPU कोर व सटीक Linux कर्नेल वर्जन], [#cmd("uname -r")],
  [#cmd("mount") / `/etc/fstab`], [स्टोरेज माउंट करें / स्थायी बूट माउंट टेबल], [#cmd("sudo mount /dev/sdb1 /mnt")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-blue)[💾 LVM (Logical Volume Manager) व इमरजेंसी Swap गाइड]
  #v(2pt)
  • *LVM क्रम:* Physical Volume (#cmd("pvcreate /dev/sdb")) → Volume Group (#cmd("vgcreate vg0 /dev/sdb")) → Logical Volume (#cmd("lvcreate -L 20G -n data vg0"))\
  • *लाइव डिस्क बढ़ाएँ:* #cmd("sudo lvextend -L +10G -r /dev/vg0/data") (बिना रीबूट साइज बढ़ाएँ!)\
  • *2GB Swap फाइल:* #cmd("sudo fallocate -l 2G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile")
]

#v(2pt)
#section-banner(num: "मॉड्यूल 10", title: "परफॉर्मेंस मॉनिटरिंग व SYSTEMD हेल्थ ऑडिट", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[टूल / कमांड], text(fill: white, weight: "bold")[सिस्टम बॉटलनेक व कर्नेल डायग्नोस्टिक्स], text(fill: white, weight: "bold")[उदाहरण],
  [#cmd("vmstat 1 5")], [CPU वेट (`wa`), स्वैप (`si`/`so`) व कॉन्टेक्स्ट स्विच देखें], [#cmd("vmstat 1 5")],
  [#cmd("iostat -xz 1")], [डिस्क I/O उपयोग (`%util`) व लेटेंसी (`await`) मापें], [#cmd("iostat -xz 1")],
  [#cmd("iotop -o")], [डिस्क पर सक्रिय रूप से पढ़ने-लिखने वाले प्रोसेस देखें], [#cmd("sudo iotop -o")],
  [#cmd("lsof +L1")], [डिलीट हुई पर प्रोसेस द्वारा खुली फाइलें खोजें (छिपा डिस्क उपयोग!)], [#cmd("sudo lsof +L1")],
  [#cmd("systemctl --failed")], [सर्वर पर फेल या क्रैश हुई सभी सर्विसेज देखें], [#cmd("systemctl list-units --failed")],
  [#cmd("systemd-analyze")], [कर्नेल व यूज़रस्पेस का सटीक बूट समय सेकंड्स में मापें], [#cmd("systemd-analyze blame | head")],
)

#did-you-know[
  `kill -9` से पहले हमेशा `kill -15 <PID>` (SIGTERM) आज़माएँ! `kill -15` डेटाबेस व ऐप्स को डेटा सेव करके सुरक्षित बंद होने का समय देता है, जबकि `kill -9` तुरंत प्रक्रिया काट देता है जिससे टेम्प फाइल्स करप्ट हो सकती हैं।
]

#pagebreak()

// =============================================================================
// PAGE 06: LINUX NETWORKING, SSH, REMOTE TRANSFER & FIREWALLS
// =============================================================================

#section-banner(num: "मॉड्यूल 09", title: "लिनक्स नेटवर्किंग, पोर्ट्स, DNS और रिमोट ट्रांसफर", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[कमांड], text(fill: white, weight: "bold")[नेटवर्किंग व रिमोट कार्य], text(fill: white, weight: "bold")[उदाहरण],
  [#cmd("ip a") / #cmd("ip r")], [IP एड्रेस, MAC व डिफ़ॉल्ट गेटवे रूटिंग टेबल देखें], [#cmd("ip -br a")],
  [#cmd("ss -tulpn")], [सभी खुले TCP/UDP पोर्ट्स और उनसे जुड़े PID देखें], [#cmd("ss -tulpn | grep :80")],
  [#cmd("ping -c 4")], [नेटवर्क कनेक्टिविटी जाँचने के लिए 4 पैकेट भेजें], [#cmd("ping -c 4 8.8.8.8")],
  [#cmd("curl -I") / #cmd("wget")], [HTTP हेडर्स जाँचें / URL से फाइल डाउनलोड करें], [#cmd("curl -I https://rtechlab.com")],
  [#cmd("dig") / #cmd("nslookup")], [DNS A, MX, TXT, NS रिकॉर्ड्स की जाँच करें], [#cmd("dig rtechlab.com +short")],
  [#cmd("traceroute") / #cmd("mtr")], [गंतव्य तक के नेटवर्क हॉप्स और पैकेट लॉस ट्रैक करें], [#cmd("traceroute 1.1.1.1")],
  [#cmd("ssh user@ip")], [एन्क्रिप्टेड रिमोट शेल लॉगिन (पोर्ट 22)], [#cmd("ssh -i key.pem ubuntu@10.0.1.5")],
  [#cmd("ssh-keygen -t ed25519")], [आधुनिक पासवर्ड-रहित SSH Key पेयर बनाएँ], [#cmd("ssh-copy-id user@server")],
  [#cmd("scp")], [SSH द्वारा सुरक्षित फाइल कॉपी करें], [#cmd("scp app.zip user@ip:/var/www/")],
  [#cmd("rsync -avz --progress")], [तेज़ इंक्रीमेंटल सिंक (केवल बदले हुए हिस्से भेजता है!)], [#cmd("rsync -avz src/ user@ip:/bkp/")],
)

#v(3pt)
#section-banner(num: "मॉड्यूल 10", title: "लिनक्स फ़ायरवॉल मास्टरी: UFW (UBUNTU) बनाम FIREWALLD (RHEL/FEDORA)", color: rtech-red)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#C2410C"))[🟠 UFW — Ubuntu / Debian / Kali]
      #v(2pt)
      • #cmd("sudo ufw status verbose") : फ़ायरवॉल नियम देखें\
      • #cmd("sudo ufw allow 22/tcp") : SSH अनुमति दें (*ऑन करने से पहले!*)\
      • #cmd("sudo ufw allow 80,443/tcp") : HTTP व HTTPS खोलें\
      • #cmd("sudo ufw deny from 1.2.3.4") : संदिग्ध IP ब्लॉक करें\
      • #cmd("sudo ufw enable") : फ़ायरवॉल चालू करें
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#B91C1C"))[🎩 Firewalld — RHEL / Fedora / Alma]
      #v(2pt)
      • #cmd("sudo firewall-cmd --state") : फ़ायरवॉल स्टेटस जाँचें\
      • #cmd("sudo firewall-cmd --list-all") : सक्रिय नियम देखें\
      • #cmd("sudo firewall-cmd --add-service=http --permanent")\
      • #cmd("sudo firewall-cmd --add-port=8080/tcp --permanent")\
      • #cmd("sudo firewall-cmd --reload") : स्थायी नियम लागू करें
    ]
  ]
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🔒 SSH सर्वर हार्डनिंग (`/etc/ssh/sshd_config`)]
      #v(2pt)
      • `PermitRootLogin no` (सीधा Root SSH लॉगिन बंद करें)\
      • `PasswordAuthentication no` (केवल SSH Keys की अनुमति!)\
      • लागू करें: #cmd("sudo sshd -t && sudo systemctl reload ssh")
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🌐 API व पोर्ट टेस्टिंग 1-लाइनर्स]
      #v(2pt)
      • TCP पोर्ट जाँच: #cmd("nc -zv 192.168.1.10 3306")\
      • curl से JSON POST: #cmd("curl -X POST -H 'Content-Type: application/json' -d '{\"ok\":1}' URL")
    ]
  ]
)

#v(2pt)
#section-banner(num: "मॉड्यूल 12", title: "DNS रिज़ॉल्यूशन, SSH टनलिंग, NETPLAN व नेटवर्क आइसोलेशन", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[विषय], text(fill: white, weight: "bold")[कॉन्फ़िगरेशन व प्रोडक्शन नेटवर्किंग वर्कफ़्लो], text(fill: white, weight: "bold")[कमांड / फाइल],
  [DNS क्रम], [Linux पहले `/etc/hosts` और फिर `/etc/resolv.conf` (`nameserver`) देखता है], [#cmd("cat /etc/resolv.conf")],
  [SSH टनल], [रिमोट DB पोर्ट `3306` को सुरक्षित रूप से लोकल `3307` पर फॉरवर्ड करें], [#cmd("ssh -L 3307:127.0.0.1:3306 u@ip")],
  [SSH कॉन्फ़िग], [सर्वर शॉर्टकट्स व कीज़ सेव करें ताकि बस `ssh prod` लिखना पड़े], [`~/.ssh/config`],
  [Ubuntu Netplan], [Ubuntu 20.04/22.04/24.04 पर YAML स्टैटिक IP कॉन्फ़िग लागू करें], [#cmd("sudo netplan apply")],
  [ARP कैश], [लोकल LAN सेगमेंट पर MAC-से-IP कैश देखें], [#cmd("ip neigh show")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5pt)[
  #text(size: 7.4pt, weight: "black", fill: rgb("#C2410C"))[🛠️ 5-चरणीय नेटवर्क आउटेज जाँच क्रम व `iptables` क्विक रूल]
  #v(1.5pt)
  *1.* #cmd("ip link") (NIC चालू?) → *2.* #cmd("ip a") (सही IP?) → *3.* #cmd("ping 8.8.8.8") (इंटरनेट?) → *4.* #cmd("dig google.com") (DNS?) → *5.* #cmd("ss -tulpn") (पोर्ट खुला?)\
  *iptables रूल:* #cmd("sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT") · नियम देखें: #cmd("sudo iptables -L -n -v")
]

#did-you-know[
  आधुनिक Linux में `ss -tulpn` ने पुराने `netstat` कमांड की जगह ले ली है। `ss` सीधे Linux कर्नेल के `tcp_diag` मॉड्यूल से सॉकेट डेटा पढ़ता है, जिससे यह व्यस्त सर्वर्स पर *10 गुना अधिक तेज़* चलता है!
]

#pagebreak()

// =============================================================================
// PAGE 07: PACKAGE MANAGERS (APT vs DNF), CRON JOBS & VIM SURVIVAL KEYS
// =============================================================================

#section-banner(num: "मॉड्यूल 11", title: "पैकेज मैनेजर्स: APT (UBUNTU/KALI) बनाम DNF (RHEL/FEDORA)", color: rtech-purple)

#table(
  columns: (1fr, 1fr, 1fr),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[कार्य],
  text(fill: white, weight: "bold")[Ubuntu / Debian / Kali (`apt`)],
  text(fill: white, weight: "bold")[Red Hat / Fedora (`dnf`)],
  [पैकेज इंडेक्स रिफ्रेश करें], [#cmd("sudo apt update")], [#cmd("sudo dnf check-update")],
  [सभी पैकेज अपग्रेड करें], [#cmd("sudo apt upgrade -y")], [#cmd("sudo dnf upgrade -y")],
  [नया सॉफ्टवेयर इंस्टॉल करें], [#cmd("sudo apt install nginx -y")], [#cmd("sudo dnf install nginx -y")],
  [सॉफ्टवेयर हटाएँ], [#cmd("sudo apt remove --purge pkg")], [#cmd("sudo dnf remove pkg")],
  [पैकेज खोजें], [#cmd("apt search htop")], [#cmd("dnf search htop")],
  [अतिरिक्त कैश साफ़ करें], [#cmd("sudo apt autoremove -y")], [#cmd("sudo dnf autoremove -y")],
)

#v(3pt)
#section-banner(num: "मॉड्यूल 12", title: "CRON JOB शेड्यूलर (crontab -e) और VIM एडिटर शॉर्टकट्स", color: rtech-emerald)

#grid(
  columns: (1.05fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#065F46"))[⏰ Crontab 5-फ़ील्ड फॉर्मेट: `* * * * * command`]
      #v(2pt)
      #text(size: 6.7pt)[
        `┌── मिनट (0–59)` · `┌── घंटा (0–23)` · `┌── दिन (1–31)`\
        `│   ┌── महीना (1–12)` · `│   ┌── सप्ताह का दिन (0–6)`
      ]
      #v(2pt)
      • #cmd("0 2 * * * /bkp.sh") : प्रतिदिन *सुबह 2:00 बजे*\
      • #cmd("*/15 * * * * /chk.sh") : हर *15 मिनट* में चलाएँ\
      • #cmd("0 9 * * 1 /rep.sh") : हर *सोमवार सुबह 9:00 बजे*\
      • #cmd("@reboot /start.sh") : *सिस्टम बूट* पर एक बार चलाएँ\
      • #cmd("crontab -l") : सक्रिय क्रॉन जॉब्स की सूची देखें
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-navy)[📝 Vim एडिटर सर्वाइवल कीज़ (सर्वर के लिए ज़रूरी)]
      #v(2pt)
      • #cmd("i") / #cmd("a") : *Insert Mode* में जाएँ (लिखने के लिए)\
      • #cmd("Esc") : *Normal Mode* में लौटें (सेव करने से पहले!)\
      • #cmd(":wq") या #cmd(":x") : सेव करें और बाहर निकलें\
      • #cmd(":q!") : *बिना सेव किए* तुरंत बाहर निकलें\
      • #cmd("dd") / #cmd("yy") / #cmd("p") : लाइन काटें / कॉपी करें / पेस्ट करें\
      • #cmd("/text") + #cmd("n") : शब्द खोजें + अगला परिणाम\
      • #cmd("gg") / #cmd("G") : फाइल के शीर्ष / अंत में जाएँ
    ]
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🐳 Docker और Git आवश्यक Linux कमांड्स (DevOps डेली वर्कफ़्लो)]
  #v(2pt)
  • *Docker:* #cmd("docker ps -a") (कंटेनर्स) · #cmd("docker logs -f app") · #cmd("docker exec -it app /bin/bash") · #cmd("docker system prune -af")\
  • *Git:* #cmd("git status") · #cmd("git pull origin main") · #cmd("git add . && git commit -m 'fix'") · #cmd("git log --oneline -5")
]

#v(2pt)
#section-banner(num: "मॉड्यूल 15", title: "यूनिवर्सल पैकेज (SNAP/FLATPAK), ENV प्रोफ़ाइल्स व बैकअप स्क्रिप्ट", color: rtech-amber)

#grid(
  columns: (1fr, 1.15fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#92400E"))[📦 Snap (Ubuntu) बनाम Flatpak (Fedora)]
      #v(1.5pt)
      • #cmd("snap list") / #cmd("sudo snap install code --classic")\
      • #cmd("flatpak list") / #cmd("flatpak install flathub app")\
      • *Systemd Timer बनाम Cron:* Timers (`systemctl list-timers`) में मिस्ड-जॉब कैच-अप व `journalctl` लॉगिंग मिलती है!
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#0F172A"), radius: 3pt, inset: 5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#38BDF8"))[⚡ रियल-वर्ल्ड ऑटो-बैकअप स्क्रिप्ट (`backup.sh`)]
      #v(1.5pt)
      #text(size: 6.6pt, font: ("Consolas", "Segoe UI"), fill: rgb("#E2E8F0"))[
        `#!/bin/bash`\
        `DATE=$(date +%F)`\
        `tar -czf /bkp/www-$DATE.tar.gz /var/www/html`\
        `find /bkp -name '*.tar.gz' -mtime +7 -delete`
      ]
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.3pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[प्रोफ़ाइल / Env], text(fill: white, weight: "bold")[शेल स्टार्टअप व एनवायरनमेंट वेरिएबल स्कोप], text(fill: white, weight: "bold")[कमांड],
  [`~/.bashrc`], [यूज़र के इंटरैक्टिव शेल के aliases, प्रॉम्प्ट व फंक्शन्स], [#cmd("source ~/.bashrc")],
  [`/etc/environment`], [सभी यूज़र्स के लिए सिस्टम-वाइड स्टैटिक वेरिएबल्स], [#cmd("printenv PATH")],
  [`~/.bash_profile`], [लॉगिन शेल (SSH/TTY) पर एक बार चलता है — `PATH` सेटिंग], [#cmd("export EDITOR=vim")],
  [`alias` / `unalias`], [टर्मिनल में अस्थायी कमांड शॉर्टकट बनाएँ या हटाएँ], [#cmd("alias gs='git status'")],
)

#did-you-know[
  *Fedora* असल में *Red Hat Enterprise Linux (RHEL)* के लिए अपस्ट्रीम टेस्टिंग लैब का काम करता है — Fedora में जाँचे गए नए फीचर्स आगे चलकर एंटरप्राइज RHEL सर्वर्स में आते हैं! वहीं *Ubuntu* और *Kali Linux* दोनों *Debian* परिवार (`apt` / `.deb`) से आते हैं।
]

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB, MOTTO, QR CODES, INTERVIEW Q&A & WHATSAPP HELP DESK
// =============================================================================

#align(center)[
  #text(size: 10.2pt, weight: "black", fill: rtech-navy)[RTECHLAB ऑथर मेंटरशिप हब, सोशल मीडिया व DevOps इंटरव्यू वॉल्ट]
  #v(1pt)
  #text(size: 6.7pt, fill: rtech-muted)[लेखक परिचय · RTechLab ध्येय · स्कैन करने योग्य QR कोड्स · शीर्ष 5 इंटरव्यू प्रश्न-उत्तर · इमरजेंसी SOP]
]

#section-banner(num: "बिंदु 01", title: "लेखक परिचय व RTechLab ध्येय: राहुल पटेल — संस्थापक व सिस्टम्स आर्किटेक्ट", color: rtech-navy)

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
          stroke: 1.5pt + rtech-blue,
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
        #text(size: 6.8pt, weight: "bold", fill: rtech-blue)[Founder & Lead Systems Architect · RTechLab] · #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[Director · IANT Computer Education, Palanpur]\
        #v(1.5pt)
        #text(size: 6.4pt, fill: rtech-navy)[
          *RTechLab ध्येय (Motto):* _"व्यावहारिक तकनीक (Technology Made Practical) — हर छात्र को क्लासरूम से कॉर्पोरेट तक सटीक व हैंड्स-ऑन इंजीनियरिंग गाइड्स के साथ सशक्त बनाना।"_
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
        #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 52pt)]
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rtech-blue)[ऑथर पोर्टफोलियो]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 52pt)]
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[YouTube चैनल]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 52pt)]
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[Instagram हब]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 52pt)]
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[WhatsApp चैनल]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[फ्री कम्युनिटी एक्सेस ↗]]
      ]
    ]
  ],
)

#section-banner(num: "बिंदु 03", title: "शीर्ष 5 SysAdmin / DevOps इंटरव्यू Q&A और इमरजेंसी SOP", color: rtech-emerald)

#table(
  columns: (auto, 1fr),
  inset: (x: 4.5pt, y: 3.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[\#], text(fill: white, weight: "bold")[प्रमुख इंटरव्यू प्रश्न व सटीक उत्तर],
  [*Q1*], [*Hard Link बनाम Soft Link?* Soft link (`ln -s`) फाइल नाम की ओर संकेत करता है; Hard link सीधे *inode* साझा करता है (डेटा सुरक्षित रहता है)।],
  [*Q2*], [*Inode व Zombie Process?* Inode फाइल मेटाडेटा रखता है। Zombie (`Z`) मृत चाइल्ड प्रोसेस है जिसका स्टेटस पैरेंट ने नहीं पढ़ा; पैरेंट PID बंद करें।],
  [*Q3*], [*`su` बनाम `sudo`?* `su` दूसरे यूज़र का शेल खोलता है; `sudo` ऑडिट लॉग (`/var/log/auth.log`) के साथ एक कमांड रूट अधिकार से चलाता है।],
  [*Q4*], [*डिस्क 100% भरने पर जाँच?* `df -h` से देखें, `du -sh /var/* | sort -hr` से बड़ा फोल्डर खोजें, और `truncate -s 0 app.log` से लॉग खाली करें।],
  [*Q5*], [*Port Conflict कैसे हल करें?* `sudo ss -tulpn | grep :8080` से PID खोजें और `sudo kill -15 <PID>` से सुरक्षित बंद करें।],
  [*Q6*], [*`grep` बनाम `find`?* `find` डिस्क पर नाम/साइज से *फाइल्स* खोजता है; `grep` फाइल के *अंदर का टेक्स्ट* खोजता है।],
  [*Q7*], [*Swap Memory क्या है?* जब भौतिक RAM भर जाए तो डिस्क के एक हिस्से का इमरजेंसी RAM के रूप में उपयोग (`free -h` से जाँचें)।],
  [*Q8*], [*`systemctl start` बनाम `enable`?* `start` सर्विस को अभी चलाता है; `enable` बूट पर ऑटो-स्टार्ट के लिए सिमलिंक बनाता है।],
  [*Q9*], [*डिस्क 70% पर भी "No space left" क्यों?* *Inode exhaustion* (`df -i` 100%) — लाखों छोटी फाइलों के कारण नए इनोड खत्म हो जाना।],
  [*Q10*], [*Linux DNS लुकअप क्रम?* पहले `/etc/nsswitch.conf` के अनुसार `/etc/hosts` जाँचा जाता है, फिर `/etc/resolv.conf` के DNS सर्वर्स से।],
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[समस्या], text(fill: white, weight: "bold")[जाँच कमांड], text(fill: white, weight: "bold")[त्वरित समाधान],
  [डिस्क 100% भरी], [#cmd("df -h") फिर #cmd("du -sh /var/log/* | sort -hr")], [#cmd("truncate -s 0 app.log")],
  [पोर्ट व्यस्त], [#cmd("sudo ss -tulpn | grep :8080")], [#cmd("sudo kill -15 <PID>")],
  [Permission त्रुटि], [#cmd("ls -ld path/to/file") व #cmd("id")], [#cmd("sudo chown user:group file")],
  [SSH अस्वीकृत], [#cmd("systemctl status ssh") + #cmd("ufw status")], [SSH चालू करें व `22/tcp` खोलें],
)

#did-you-know[
  *Kali Linux* में 600+ पेनिट्रेशन टेस्टिंग टूल्स (`nmap`, `aircrack-ng`, `sqlmap`) पहले से होते हैं, लेकिन बिना अनुमति किसी नेटवर्क पर इनका उपयोग गैर-कानूनी है। हमेशा *TryHackMe*, *HackTheBox*, या अपनी खुद की *VirtualBox/VMware* लैब में अभ्यास करें!
]

#v(2pt)
#block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: 0.7pt + rgb("#93C5FD"),
  radius: 3pt,
  inset: (x: 7pt, y: 4.5pt),
  [
    #align(center)[
      #text(size: 7.4pt, weight: "bold", fill: rtech-blue)[
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
        #box(fill: rgb("#0284C7"), radius: 3pt, inset: (x: 7pt, y: 4pt))[
          #text(size: 7.0pt, weight: "black", fill: white)[rtechlab.com/notes · 2027 संस्करण]
        ]
      ]
    )
  ]
)
