// =============================================================================
// RTECHLAB LINUX & SHELL MASTERY DESK CHEAT SHEET (GUJARATI EDITION 1)
// Exactly 8 Pages · Page 1 Blank Cover Placeholder · Printable Daily Desk Companion
// Author: Rahul Patel (Founder & Systems Architect, RTechLab)
// =============================================================================

#set document(
  title: "Linux & Shell Mastery Desk Reference & Cheat Sheet (Gujarati)",
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
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[લિનક્સ અને શેલ માસ્ટરી ડેસ્ક ચીટ શીટ (ગુજરાતી)]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#059669"))[RHEL · Ubuntu · Fedora · Kali · Bash · DevOps]
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
            #text(fill: rgb("#0284C7"))[●] પ્રેક્ટિકલ ટેકનોલોજી · પ્રિન્ટ કરીને ડેસ્ક પર રાખો · ફ્રી ટૂલ્સ: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
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
      #text(size: 7.4pt, weight: "black", fill: rgb("#92400E"))[💡 શું તમે જાણો છો? ]
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

#section-banner(num: "મોડ્યુલ 01", title: "લોકપ્રિય લિનક્સ ડિસ્ટ્રો: RED HAT, UBUNTU, FEDORA અને KALI LINUX", color: rtech-red)

#text(size: 6.9pt, fill: rtech-muted)[
  Linux એક #hl-b[ફ્રી અને ઓપન-સોર્સ OS કર્નેલ] છે જે 1991 માં Linus Torvalds દ્વારા બનાવાયું. વિવિધ સંસ્થાઓ તેમાં ટૂલ્સ અને પેકેજ મેનેજર ઉમેરીને *Distros* બનાવે છે:
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
      • *પેકેજ મેનેજર:* #cmd("dnf") / #cmd("yum") (`.rpm`)\
      • *રિલીઝ:* લોંગ-ટર્મ સપોર્ટ (10 વર્ષ સુધી સ્થિર)\
      • *ઉપયોગ:* #hl-r[બેંકિંગ, ટેલિકોમ, કોર્પોરેટ ડેટા સેન્ટર અને ક્લાઉડ]\
      • *મુખ્ય પરીક્ષા:* RHCSA (EX200) અને RHCE.
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#C2410C"))[Ubuntu (Canonical)]],
        [#image("02_BRAND_ASSETS/logo_ubuntu.png", height: 16pt)]
      )
      #v(2pt)
      • *પેકેજ મેનેજર:* Debian-આધારિત · #cmd("apt") / #cmd("snap") (`.deb`)\
      • *રિલીઝ:* દર 2 વર્ષે 5-વર્ષીય LTS (જેમ કે 24.04 LTS)\
      • *ઉપયોગ:* #hl-y[શરૂઆતી વિદ્યાર્થીઓ, AWS/Azure ક્લાઉડ, Docker અને AI]\
      • *ખાસ વાત:* પબ્લિક ક્લાઉડ સર્વર પર સૌથી વધુ વપરાય છે.
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#EFF6FF"), stroke: 0.6pt + rgb("#93C5FD"), radius: 3pt, inset: 5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#1D4ED8"))[Fedora Workstation / Server]],
        [#image("02_BRAND_ASSETS/logo_fedora.png", height: 16pt)]
      )
      #v(2pt)
      • *પેકેજ મેનેજર:* Red Hat સમર્થિત · #cmd("dnf") (`.rpm`)\
      • *રિલીઝ:* ઝડપી (~6 મહિના), નવીનતમ કર્નેલ અને GNOME\
      • *ઉપયોગ:* #hl-b[ડેવલપર્સ, મોડર્ન વર્કસ્ટેશન અને RHEL ટેસ્ટિંગ]\
      • *ખાસ વાત:* Linus Torvalds પોતે Fedora નો ઉપયોગ કરે છે!
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rgb("#C4B5FD"), radius: 3pt, inset: 5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#6D28D9"))[Kali Linux (સાયબર સુરક્ષા)]],
        [#image("02_BRAND_ASSETS/logo_kali.png", height: 15pt)]
      )
      #v(2pt)
      • *પેકેજ મેનેજર:* Debian Testing · #cmd("apt") (`.deb`)\
      • *રિલીઝ:* Rolling Release (સતત સિક્યોરिटी અપડેટ્સ)\
      • *ઉપયોગ:* #hl-g[એથિકલ હેકિંગ, પેનિટ્રેશન ટેસ્ટિંગ અને ફોરેન્સિક્સ]\
      • *ટૂલ્સ:* 600+ પ્રી-ઇન્સ્ટોલ્ડ (`nmap`, `metasploit`, `wireshark`).
    ]
  ]
)

#v(3pt)
#section-banner(num: "મોડ્યુલ 02", title: "લિનક્સ ફાઇલ સિસ્ટમ (FHS) અને નેવિગેશન કમાન્ડ્સ", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto, 1fr),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[ડિરેક્ટરી], text(fill: white, weight: "bold")[હેતુ અને સામગ્રી],
  text(fill: white, weight: "bold")[ડિરેક્ટરી], text(fill: white, weight: "bold")[હેતુ અને સામગ્રી],
  [#cmd("/")], [Root ડિરેક્ટરી — સમગ્ર લિનક્સ ટ્રીની ટોચ],
  [#cmd("/etc")], [સિસ્ટમ કોન્ફિગરેશન ફાઇલ્સ (`passwd`, `fstab`, `ssh`)],
  [#cmd("/home")], [સામાન્ય યુઝર્સના પર્સનલ ફોલ્ડર્સ (`/home/rahul`)],
  [#cmd("/var")], [લોગ ફાઇલ્સ, મેઇલ, વેબ ડેટા (`/var/log/syslog`)],
  [#cmd("/root")], [માત્ર `root` એડમિન માટે હોમ ડિરેક્ટરી],
  [#cmd("/tmp")], [અસ્થાયી ફાઇલ્સ (રીબૂટ પર આપોઆપ સાફ થાય)],
  [#cmd("/bin") / `/usr/bin`], [જરૂરી કમાન્ડ બાઇનરીઝ (`ls`, `cp`, `cat`, `grep`)],
  [#cmd("/proc")], [લાઇવ કર્નેલ અને પ્રોસેસ માહિતી માટે વર્ચ્યુઅલ સિસ્ટમ],
  [#cmd("/dev")], [હાર્ડવેર ડિવાઇસ ફાઇલ્સ (`/dev/sda`, `/dev/null`)],
  [#cmd("/opt")], [વધારાના થર્ડ-પાર્ટી સોફ્ટવેર (Chrome, કસ્ટમ એપ્સ)],
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto, 1fr),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[કમાન્ડ], text(fill: white, weight: "bold")[કાર્ય],
  text(fill: white, weight: "bold")[કમાન્ડ], text(fill: white, weight: "bold")[કાર્ય],
  [#cmd("pwd")], [હાલની વર્કિંગ ડિરેક્ટરીનો સંપૂર્ણ પાથ બતાવે છે],
  [#cmd("cd ~") / #cmd("cd -")], [હોમ ફોલ્ડરમાં જાઓ / પાછલા ફોલ્ડરમાં પાછા આવો],
  [#cmd("ls -lah")], [છુપાયેલી ફાઇલ્સ (`.`) સાથે વિગતવાર લિસ્ટ અને સાઇઝ],
  [#cmd("tree -L 2")], [2 લેવલ સુધી ફોલ્ડરનું ટ્રી સ્ટ્રક્ચર જુઓ],
  [#cmd("find /etc -name '*.conf'")], [ડિસ્ક પર પેટર્ન મુજબ ફાઇલ્સ શોધો],
  [#cmd("which python3")], [કમાન્ડનું ચોક્કસ બાઇનરી લોકેશન બતાવે છે],
  [#cmd("clear") / `Ctrl+L`], [ટર્મિનલ સ્ક્રીન સાફ કરો],
  [#cmd("man ls") / #cmd("ls --help")], [કમાન્ડનું મેન્યુઅલ પેજ અથવા ઝડપી મદદ જુઓ],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.6pt, weight: "black", fill: rtech-navy)[🧭 Absolute વિરુદ્ધ Relative પાથ]
      #v(2pt)
      • *Absolute Path* (`/` થી શરૂ): #cmd("cd /var/log/nginx")\
      • *Relative Path* (હાલના ફોલ્ડરથી): #cmd("cd ./logs") કે #cmd("cd ../etc")\
      • #cmd(".") = હાલનું ફોલ્ડર · #cmd("..") = પેરેન્ટ ફોલ્ડર · #cmd("~") = હોમ
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.6pt, weight: "black", fill: rtech-blue)[🐚 Linux Shells અને Distro Quick-Pick]
      #v(2pt)
      • *Bash* (`/bin/bash`): Ubuntu/RHEL/Fedora ડિફોલ્ટ · *Zsh*: Kali ડિફોલ્ટ\
      • *Shell તપાસ:* #cmd("echo $SHELL") · *Distro તપાસ:* #cmd("cat /etc/os-release")\
      • *પસંદગી:* સર્વર → *RHEL/Ubuntu* · ડેસ્કટોપ → *Fedora* · સુરક્ષા → *Kali*
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, auto, auto, auto, 1fr),
  inset: (x: 4.5pt, y: 3.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[ડિસ્ટ્રો], text(fill: white, weight: "bold")[પેકેજ], text(fill: white, weight: "bold")[ફાયરવોલ], text(fill: white, weight: "bold")[ડિફોલ્ટ શેલ], text(fill: white, weight: "bold")[મુખ્ય એન્ટરપ્રાઇઝ / કરિયર ઉપયોગ],
  [*RHEL*], [`.rpm` (`dnf`)], [`firewalld`], [`bash`], [બેંકિંગ, ટેલિકોમ અને RHCSA/RHCE સર્ટિફિકેશન],
  [*Ubuntu*], [`.deb` (`apt`)], [`ufw`], [`bash`], [ક્લાઉડ VMs (AWS/GCP/Azure), Docker અને DevOps],
  [*Fedora*], [`.rpm` (`dnf`)], [`firewalld`], [`bash`], [ડેવલપર વર્કસ્ટેશન અને અપસ્ટ્રીમ RHEL લેબ],
  [*Kali*], [`.deb` (`apt`)], [`ufw`/`nft`], [`zsh`], [એથિકલ હેકિંગ, VAPT અને SOC એનાલિસ્ટ],
)

#did-you-know[
  વિશ્વના *100% ટોપ 500 સુપરકોમ્પ્યુટર્સ*, *96%+ ટોપ વેબ સર્વર્સ*, અને *Android* પણ Linux કર્નેલ પર ચાલે છે. Linux શીખવાથી Cloud, DevOps અને Cyber Security કરિયરનો મજબૂત પાયો બને છે!
]

#pagebreak()

// =============================================================================
// PAGE 03: FILE OPERATIONS, ARCHIVES & TEXT PROCESSING 1-LINERS
// =============================================================================

#section-banner(num: "મોડ્યુલ 03", title: "ફાઇલ, ફોલ્ડર, લિંક અને આર્કાઇવ (ZIP/TAR) કમાન્ડ્સ", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[કમાન્ડ], text(fill: white, weight: "bold")[વર્ણન અને વ્યવહારિક ઉપયોગ], text(fill: white, weight: "bold")[ઉદાહરણ],
  [#cmd("mkdir -p")], [એકસાથે અનેક નેસ્ટેડ ફોલ્ડર્સ બનાવો (એરર વગર)], [#cmd("mkdir -p app/src/logs")],
  [#cmd("touch")], [નવી ખાલી ફાઇલ બનાવો અથવા ટાઇમસ્ટેમ્પ અપડેટ કરો], [#cmd("touch notes.txt")],
  [#cmd("cp -rp")], [પરમિશન જાળવીને ફોલ્ડર કોપી કરો], [#cmd("cp -rp src/ backup/")],
  [#cmd("mv")], [ફાઇલ/ફોલ્ડરને મૂવ કરો અથવા નામ બદલો (Rename)], [#cmd("mv old.txt new.txt")],
  [#cmd("rm -rf")], [ફોલ્ડર કાયમ માટે ડિલીટ કરો (*સાવચેતીથી વાપરો!*)], [#cmd("rm -rf ./temp_cache")],
  [#cmd("ln -s")], [Symbolic (Soft) Link બનાવો — Windows શોર્ટકટ જેવું], [#cmd("ln -s /var/www html")],
  [#cmd("file") / #cmd("stat")], [સાચો ફાઇલ પ્રકાર ઓળખો / inode અને સમય જુઓ], [#cmd("stat app.log")],
  [#cmd("tar -czvf")], [ફોલ્ડરને `.tar.gz` માં કોમ્પ્રેસ કરો], [#cmd("tar -czvf bkp.tar.gz dir/")],
  [#cmd("tar -xzvf")], [`.tar.gz` આર્કાઇવને એક્સટ્રેક્ટ કરો], [#cmd("tar -xzvf bkp.tar.gz")],
  [#cmd("zip -r") / #cmd("unzip")], [`.zip` ફાઇલ બનાવો અથવા એક્સટ્રેક્ટ કરો], [#cmd("unzip bundle.zip")],
)

#v(3pt)
#section-banner(num: "મોડ્યુલ 04", title: "ટેક્સ્ટ પ્રોસેસિંગ, સર્ચિંગ, પાઇપ્સ (|) અને રીડાયરેક્શન", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[કમાન્ડ], text(fill: white, weight: "bold")[કાર્ય], text(fill: white, weight: "bold")[પ્રો 1-લાઇનર],
  [#cmd("cat") / #cmd("less")], [આખી ફાઇલ પ્રિન્ટ કરો / મોટી ફાઇલ પેજ-બાય-પેજ જુઓ (`q` થી બહાર)], [#cmd("less /var/log/syslog")],
  [#cmd("head -n 20")], [ફાઇલની શરૂઆતની 20 લાઇન જુઓ], [#cmd("head -n 20 data.csv")],
  [#cmd("tail -f")], [લાઇવ લોગ અપડેટ્સ રીઅલ-ટાઇમમાં જુઓ (ડીબગિંગ માટે બેસ્ટ!)], [#cmd("tail -f /var/log/nginx/error.log")],
  [#cmd("grep -rni")], [ફોલ્ડરમાં કેસ-ઇન્સેન્સિટિવ ટેક્સ્ટ સર્ચ (લાઇન નંબર સાથે)], [#cmd("grep -rni 'ERROR' /var/log")],
  [#cmd("awk")], [ટેક્સ્ટ અથવા CSV માંથી ચોક્કસ કોલમ કાઢો], [#cmd("awk '{print $1, $4}' access.log")],
  [#cmd("sed -i")], [ફાઇલની અંદર સીધા શબ્દ શોધો અને બદલો], [#cmd("sed -i 's/http/https/g' cfg.txt")],
  [#cmd("cut -d',' -f1")], [કોમા `,` કે કોલન `:` થી કોલમ અલગ કરો], [#cmd("cut -d':' -f1 /etc/passwd")],
  [#cmd("sort | uniq -c")], [લાઇનોને સોર્ટ કરો અને ડુપ્લિકેટ ગણો], [#cmd("sort ips.txt | uniq -c | sort -nr")],
  [#cmd("wc -l")], [કુલ લાઇનોની સંખ્યા ગણો], [#cmd("cat users.txt | wc -l")],
)

#v(3pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-navy)[🔀 સ્ટાન્ડર્ડ સ્ટ્રીમ્સ અને રીડાયરેક્શન]
      #v(2pt)
      • #cmd("cmd > file.txt") : આઉટપુટથી ફાઇલ ઓવરરાઇટ કરો\
      • #cmd("cmd >> file.txt") : ફાઇલના અંતે આઉટપુટ ઉમેરો\
      • #cmd("cmd 2> err.log") : માત્ર એરર (stderr `2`) સેવ કરો\
      • #cmd("cmd > out.log 2>&1") : આઉટપુટ અને એરર એક ફાઇલમાં\
      • #cmd("cmd > /dev/null 2>&1") : બધું આઉટપુટ સાઇલન્ટ કરો
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-blue)[⚡ શેલ વાઇલ્ડકાર્ડ અને હિસ્ટ્રી શોર્ટકટ્સ]
      #v(2pt)
      • #cmd("*") કોઈપણ અક્ષરો સાથે મેળ ખાય; #cmd("?") માત્ર 1 અક્ષર\
      • #cmd("!!") : છેલ્લો કમાન્ડ ફરી ચલાવો (જેમ કે #cmd("sudo !!"))\
      • #cmd("Ctrl + R") : કમાન્ડ હિસ્ટ્રીમાં રિવર્સ સર્ચ કરો\
      • #cmd("Ctrl + C") / #cmd("Ctrl + Z") : બંધ કરો / પોઝ કરો\
      • #cmd("cmd1 && cmd2") : `cmd1` સફળ થાય તો જ `cmd2` ચલાવો
    ]
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.6pt, weight: "black", fill: rgb("#065F46"))[🔥 ટોપ 4 રીઅલ-વર્લ્ડ લોગ અને ટેક્સ્ટ 1-લાઇનર્સ (DevOps ડેઇલી યુઝ)]
  #v(2pt)
  *1.* Nginx પર ટોપ 10 IP: #cmd("awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -10")\
  *2.* 7 દિવસ જૂના `.log` હટાવો: #cmd("find /var/log -name '*.log' -mtime +7 -delete")\
  *3.* 404 એરર ગણો: #cmd("grep ' 404 ' /var/log/nginx/access.log | wc -l") · *4.* કોમેન્ટ્સ વગર વાંચો: #cmd("grep -vE '^#|^$' /etc/ssh/sshd_config")
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[ટૂલ / કોન્સેપ્ટ], text(fill: white, weight: "bold")[ફાઇલ સુરક્ષા, કમ્પ્રેશન અને એડવાન્સ્ડ ઉપયોગ], text(fill: white, weight: "bold")[કમાન્ડ],
  [#cmd("sha256sum")], [ડાઉનલોડ કરેલી ISO / બેકઅપ ફાઇલની અખંડિતતા તપાસો], [#cmd("sha256sum ubuntu.iso")],
  [#cmd("gzip") / #cmd("xz")], [ઝડપી `.gz` કમ્પ્રેશન વિરુદ્ધ અલ્ટ્રા-હાઈ `.xz` કમ્પ્રેશન], [#cmd("tar -cJvf bkp.tar.xz dir/")],
  [#cmd("xargs")], [પાઇપમાંથી મળેલા આઉટપુટને આગળના કમાન્ડના આર્ગ્યુમેન્ટ તરીકે મોકલો], [#cmd("find . -name '*.tmp' | xargs rm")],
  [#cmd("split -b 100M")], [મોટી બેકઅપ/લોગ ફાઇલને 100MB ના ભાગોમાં વહેંચો], [#cmd("split -b 100M db.sql part_")],
  [`atime`/`mtime`/`ctime`], [એક્સેસ સમય, કન્ટેન્ટ ફેરફાર સમય અને Inode મેટાડેટા સમય], [#cmd("stat /etc/hosts")],
)

#did-you-know[
  Linux માં *"Everything is a file"* નો સિદ્ધાંત ચાલે છે — સામાન્ય ફાઇલ્સ, ફોલ્ડર્સ, હાર્ડ ડ્રાઇવ (`/dev/nvme0n1`), અને લાઇવ CPU/RAM ની માહિતી (`/proc/cpuinfo`) પણ ફાઇલની જેમ વાંચી શકાય છે!
]

#pagebreak()

// =============================================================================
// PAGE 04: USERS, GROUPS & PERMISSIONS MATRIX (chmod, chown, umask)
// =============================================================================

#section-banner(num: "મોડ્યુલ 05", title: "યુઝર્સ, ગ્રુપ્સ અને SUDO એડમિનિસ્ટ્રેશન", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[કમાન્ડ / ફાઇલ], text(fill: white, weight: "bold")[વહીવટી કાર્ય], text(fill: white, weight: "bold")[ઉદાહરણ],
  [#cmd("whoami") / #cmd("id")], [હાલના યુઝર, UID, GID અને ગ્રુપ્સની માહિતી જુઓ], [#cmd("id rahul")],
  [#cmd("sudo useradd -m")], [હોમ ડિરેક્ટરી સાથે નવો યુઝર બનાવો], [#cmd("sudo useradd -m -s /bin/bash dev")],
  [#cmd("sudo passwd dev")], [યુઝરનો લોગિન પાસવર્ડ સેટ કે રીસેટ કરો], [#cmd("sudo passwd dev")],
  [#cmd("sudo usermod -aG")], [યુઝરને વધારાના ગ્રુપમાં ઉમેરો (`-aG` = Append!)], [#cmd("sudo usermod -aG sudo,docker dev")],
  [#cmd("su - username")], [સંપૂર્ણ એન્વાયર્નમેન્ટ સાથે યુઝર બદલો], [#cmd("su - root")],
  [#cmd("/etc/passwd")], [યુઝર એકાઉન્ટ, UID, GID અને ડિફોલ્ટ શેલની યાદી], [`rahul:x:1000:1000::/home/rahul:/bin/bash`],
  [#cmd("/etc/shadow")], [એન્ક્રિપ્ટેડ પાસવર્ડ હેશ (માત્ર `root` વાંચી શકે)], [`sudo cat /etc/shadow`],
  [#cmd("visudo")], [સિન્ટેક્સ ચેક સાથે સુરક્ષિત રીતે `/etc/sudoers` એડિટ કરો], [#cmd("sudo visudo")],
)

#v(3pt)
#section-banner(num: "મોડ્યુલ 06", title: "ફાઇલ પરમિશન મેટ્રિક્સ (chmod, chown, umask અને SPECIAL BITS)", color: rtech-amber)

#grid(
  columns: (1.1fr, 1fr),
  gutter: 6pt,
  [
    #table(
      columns: (auto, auto, auto, 1fr),
      inset: (x: 5pt, y: 5.0pt),
      stroke: 0.5pt + rgb("#CBD5E1"),
      fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#FFFBEB") } else { white },
      text(fill: white, weight: "bold")[ચિહ્ન], text(fill: white, weight: "bold")[મૂલ્ય], text(fill: white, weight: "bold")[ફાઇલ પર], text(fill: white, weight: "bold")[ફોલ્ડર પર],
      [#hl-g[`r` (Read)]], [*4*], [ફાઇલ વાંચો], [લિસ્ટ જુઓ (`ls`)],
      [#hl-y[`w` (Write)]], [*2*], [ફેરફાર કરો], [ફાઇલ બનાવો/હટાવો],
      [#hl-b[`x` (Execute)]], [*1*], [સ્ક્રિપ્ટ ચલાવો], [પ્રવેશ કરો (`cd`)],
      [#hl-r[`-` (None)]], [*0*], [કોઈ પરમિશન નહીં], [કોઈ પરમિશન નહીં],
    )
    #v(2pt)
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 4.5pt)[
      #text(size: 7pt, weight: "black")[પરમિશન સ્ટ્રિંગ: `-rwxr-xr--` (`754`)]
      #v(1pt)
      • અક્ષર 1 (`-`/`d`/`l`): પ્રકાર (`-` ફાઇલ, `d` ફોલ્ડર, `l` લિંક)\
      • અક્ષર 2–4 (`rwx` = 4+2+1 = *7*): *Owner (માલિક)*\
      • અક્ષર 5–7 (`r-x` = 4+0+1 = *5*): *Group (જૂથ)*\
      • અક્ષર 8–10 (`r--` = 4+0+0 = *4*): *Others (અન્ય)*
    ]
  ],
  [
    #table(
      columns: (auto, 1fr),
      inset: (x: 5pt, y: 5.0pt),
      stroke: 0.5pt + rgb("#CBD5E1"),
      fill: (_, row) => if row == 0 { rgb("#D97706") } else if calc.even(row) { rgb("#FEF3C7") } else { white },
      text(fill: white, weight: "bold")[ઓક્ટલ / કમાન્ડ], text(fill: white, weight: "bold")[વાસ્તવિક ઉપયોગ],
      [#cmd("chmod 755")], [સ્ક્રિપ્ટ્સ અને વેબ ફોલ્ડર્સ (`rwxr-xr-x`)],
      [#cmd("chmod 644")], [સામાન્ય કોન્ફિગ અને HTML ફાઇલ્સ (`rw-r--r--`)],
      [#cmd("chmod 600")], [પ્રાઇવેટ SSH કીઝ (`~/.ssh/id_ed25519`)],
      [#cmd("chmod 700")], [પ્રાઇવેટ યુઝર હોમ/બેકઅપ ફોલ્ડર],
      [#cmd("chmod +x s.sh")], [Bash સ્ક્રિપ્ટને તરત ચલાવવા યોગ્ય બનાવો],
      [#cmd("chown -R u:g d/")], [Owner અને Group બંને રિકર્સિવ બદલો],
      [#cmd("umask 022")], [ડિફોલ્ટ માસ્ક: નવી ફાઇલ `644`, ફોલ્ડર `755`],
    )
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#FFF1F2"), stroke: 0.6pt + rgb("#FDA4AF"), radius: 3pt, inset: 4.5pt)[
  #text(size: 7.1pt, weight: "black", fill: rgb("#9F1239"))[🔐 સ્પેશિયલ પરમિશન્સ (ચોથો અંક):]
  #h(4pt)
  #hl-r[SUID (`4xxx`)] બાઇનરી *માલિકના અધિકાર* થી ચાલે છે (`/usr/bin/passwd`) ·
  #hl-b[SGID (`2xxx`)] નવી ફાઇલો પેરેન્ટ ગ્રુપ અપનાવે છે ·
  #hl-y[Sticky Bit (`1xxx`)] શેર્ડ ફોલ્ડરમાં માત્ર માલિક પોતાની ફાઇલ હટાવી શકે (`/tmp` = `1777`).
]

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[⏳ પાસવર્ડ એક્સપાયરી (`chage`) અને Sudoers]
      #v(2pt)
      • #cmd("sudo chage -l rahul") : પાસવર્ડ એક્સપાયરી નીતિ જુઓ\
      • #cmd("sudo chage -M 90 rahul") : દર 90 દિવસે પાસવર્ડ બદલવો ફરજિયાત\
      • `/etc/sudoers`: `rahul ALL=(ALL) NOPASSWD: /usr/bin/systemctl`
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[📋 Access Control Lists (ACL) — ચોક્કસ પરમિશન]
      #v(2pt)
      • #cmd("getfacl file.txt") : વધારાની ACL પરમિશન્સ જુઓ\
      • #cmd("setfacl -m u:dev:rw file.txt") : ગ્રુપ બદલ્યા વગર `dev` ને `rw` આપો\
      • #cmd("setfacl -b file.txt") : બધી વધારાની ACL હટાવો
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[સિક્યોરિટી તપાસ], text(fill: white, weight: "bold")[ઓડિટ અને વિશેષાધિકાર ચકાસણી હેતુ], text(fill: white, weight: "bold")[કમાન્ડ],
  [Sudo ઓડિટ લોગ], [`sudo` કમાન્ડ્સ અને નિષ્ફળ SSH લોગિન પ્રયાસો જુઓ], [#cmd("sudo tail -f /var/log/auth.log")],
  [RHEL સિક્યોર લોગ], [RHEL/Fedora પર ઓથેન્ટિકેશન અને `sudo` લોગ તપાસો], [#cmd("sudo tail -f /var/log/secure")],
  [લોગ-ઇન યુઝર્સ], [સક્રિય SSH સેશન, IP અને ચાલી રહેલા કાર્યો જુઓ], [#cmd("w") / #cmd("who") / #cmd("last -n 10")],
  [World-Writable શોધો], [સિસ્ટમ પર અસુરક્ષિત `777` પરમિશન્સ વાળી ફાઇલ્સ શોધો], [#cmd("find / -perm -0002 -type f 2>/dev/null")],
  [યુઝર લોક/અનલોક], [શંકાસ્પદ એકાઉન્ટને તરત ફ્રીઝ અથવા પુનઃસ્થાપિત કરો], [#cmd("sudo usermod -L dev") / #cmd("-U")],
)

#did-you-know[
  પ્રોડક્શન સર્વર પર ક્યારેય `chmod 777` ન વાપરશો! તેનાથી કોઈપણ યુઝર કે હેક્ડ સર્વિસ તમારી ફાઇલ્સ બદલી શકે છે. સુરક્ષિત ડિફોલ્ટ ફોલ્ડર માટે `755`, ફાઇલ્સ માટે `644`, અને SSH કીઝ માટે `600` છે.
]

#pagebreak()

// =============================================================================
// PAGE 05: PROCESS MANAGEMENT, SYSTEMD SERVICES & DISK/MEMORY DIAGNOSTICS
// =============================================================================

#section-banner(num: "મોડ્યુલ 07", title: "પ્રોસેસ મેનેજમેન્ટ, સિગ્નલ્સ અને SYSTEMD સર્વિસિસ", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[કમાન્ડ], text(fill: white, weight: "bold")[વર્ણન], text(fill: white, weight: "bold")[ઉદાહરણ],
  [#cmd("ps aux | grep")], [ચાલી રહેલી બધી પ્રોસેસનો નામ મુજબ સ્નેપશોટ], [#cmd("ps aux | grep nginx")],
  [#cmd("top") / #cmd("htop")], [લાઇવ CPU, RAM, લોડ એવરેજ અને PID મોનિટર], [#cmd("htop")],
  [#cmd("kill -15 PID")], [`SIGTERM` — પ્રોસેસને સુરક્ષિત બંધ થવાની સૂચના], [#cmd("kill -15 4821")],
  [#cmd("kill -9 PID")], [`SIGKILL` — હેંગ પ્રોસેસને તરત બળજબરીથી બંધ કરો], [#cmd("kill -9 4821")],
  [#cmd("pkill -f name")], [કમાન્ડ નામથી મળતી બધી પ્રોસેસ બંધ કરો], [#cmd("pkill -f python3")],
  [#cmd("nohup cmd &")], [લોગઆઉટ પછી પણ બેકગ્રાઉન્ડમાં જોબ ચાલુ રાખો], [#cmd("nohup ./sync.sh &")],
  [#cmd("systemctl status")], [સર્વિસ ચાલુ છે કે ફેલ થઈ તે તપાસો], [#cmd("systemctl status ssh")],
  [#cmd("systemctl restart")], [કોન્ફિગ બદલ્યા પછી સર્વિસ રીસ્ટાર્ટ કરો], [#cmd("sudo systemctl restart nginx")],
  [#cmd("systemctl enable --now")], [સર્વિસ અત્યારે ચાલુ કરો + બૂટ પર ઓટો-સ્ટાર્ટ સેટ કરો], [#cmd("sudo systemctl enable --now docker")],
  [#cmd("journalctl -u")], [Systemd લોગ્સ જુઓ (`-f` લાઇવ, `-xe` એરર)], [#cmd("journalctl -u nginx -n 50")],
)

#v(3pt)
#section-banner(num: "મોડ્યુલ 08", title: "ડિસ્ક, ફાઇલ સિસ્ટમ, મેમરી અને હાર્ડવેર ડાયગ્નોસ્ટિક્સ", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[કમાન્ડ], text(fill: white, weight: "bold")[હાર્ડવેર / સ્ટોરેજ માહિતી], text(fill: white, weight: "bold")[પ્રો તપાસ],
  [#cmd("df -h")], [માઉન્ટ કરેલા પાર્ટિશનમાં ખાલી ડિસ્ક સ્પેસ], [#cmd("df -hT") (ext4/xfs સાથે)],
  [#cmd("du -sh *")], [હાલના પાથના દરેક ફોલ્ડરની સાઇઝ જુઓ], [#cmd("du -sh /var/* | sort -hr")],
  [#cmd("free -h")], [RAM અને Swap વપરાશ (`available` = સાચી ખાલી RAM)], [#cmd("free -h")],
  [#cmd("lsblk")], [બધી ડિસ્ક, પાર્ટિશન અને માઉન્ટ પોઇન્ટ્સની યાદી], [#cmd("lsblk -f")],
  [#cmd("uptime")], [સર્વર અપટાઇમ + 1m, 5m, 15m CPU લોડ એવરેજ], [#cmd("uptime")],
  [#cmd("lscpu") / #cmd("uname -a")], [CPU કોર્સ અને ચોક્કસ Linux કર્નેલ વર્ઝન], [#cmd("uname -r")],
  [#cmd("mount") / `/etc/fstab`], [સ્ટોરેજ માઉન્ટ કરો / કાયમી બૂટ માઉન્ટ ટેબલ], [#cmd("sudo mount /dev/sdb1 /mnt")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-blue)[💾 LVM (Logical Volume Manager) અને ઇમરજન્સી Swap ગાઇડ]
  #v(2pt)
  • *LVM ક્રમ:* Physical Volume (#cmd("pvcreate /dev/sdb")) → Volume Group (#cmd("vgcreate vg0 /dev/sdb")) → Logical Volume (#cmd("lvcreate -L 20G -n data vg0"))\
  • *લાઇવ ડિસ્ક વધારો:* #cmd("sudo lvextend -L +10G -r /dev/vg0/data") (રીબૂટ વગર સાઇઝ વધારો!)\
  • *2GB Swap ફાઇલ:* #cmd("sudo fallocate -l 2G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile")
]

#v(2pt)
#section-banner(num: "મોડ્યુલ 10", title: "પરફોર્મન્સ મોનિટરિંગ અને SYSTEMD હેલ્થ ઓડિટ", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[ટૂલ / કમાન્ડ], text(fill: white, weight: "bold")[સિસ્ટમ બોટલનેક અને કર્નેલ ડાયગ્નોસ્ટિક્સ], text(fill: white, weight: "bold")[ઉદાહરણ],
  [#cmd("vmstat 1 5")], [CPU વેઇટ (`wa`), સ્વેપ (`si`/`so`) અને કોન્ટેક્સ્ટ સ્વિચ જુઓ], [#cmd("vmstat 1 5")],
  [#cmd("iostat -xz 1")], [ડિસ્ક I/O ઉપયોગ (`%util`) અને લેટન્સી (`await`) માપો], [#cmd("iostat -xz 1")],
  [#cmd("iotop -o")], [ડિસ્ક પર સક્રિય રીતે વાંચતી-લખતી પ્રોસેસ જુઓ], [#cmd("sudo iotop -o")],
  [#cmd("lsof +L1")], [ડિલીટ થયેલી પણ પ્રોસેસ દ્વારા ખુલ્લી ફાઇલ્સ શોધો], [#cmd("sudo lsof +L1")],
  [#cmd("systemctl --failed")], [સર્વર પર ફેલ કે ક્રેશ થયેલી બધી સર્વિસિસ જુઓ], [#cmd("systemctl list-units --failed")],
  [#cmd("systemd-analyze")], [કર્નેલ અને યુઝરસ્પેસનો ચોક્કસ બૂટ સમય સેકન્ડ્સમાં માપો], [#cmd("systemd-analyze blame | head")],
)

#did-you-know[
  `kill -9` પહેલાં હંમેશા `kill -15 <PID>` (SIGTERM) અજમાવો! `kill -15` ડેટાબેઝ અને એપ્સને ડેટા સેવ કરીને સુરક્ષિત બંધ થવાનો સમય આપે છે, જ્યારે `kill -9` તરત જ પ્રક્રિયા કાપી નાખે છે.
]

#pagebreak()

// =============================================================================
// PAGE 06: LINUX NETWORKING, SSH, REMOTE TRANSFER & FIREWALLS
// =============================================================================

#section-banner(num: "મોડ્યુલ 09", title: "લિનક્સ નેટવર્કિંગ, પોર્ટ્સ, DNS અને રિમોટ ટ્રાન્સફર", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[કમાન્ડ], text(fill: white, weight: "bold")[નેટવર્કિંગ અને રિમોટ કાર્ય], text(fill: white, weight: "bold")[ઉદાહરણ],
  [#cmd("ip a") / #cmd("ip r")], [IP એડ્રેસ, MAC અને ડિફોલ્ટ ગેટવે રૂટિંગ ટેબલ જુઓ], [#cmd("ip -br a")],
  [#cmd("ss -tulpn")], [બધા ખુલ્લા TCP/UDP પોર્ટ્સ અને તેના PID જુઓ], [#cmd("ss -tulpn | grep :80")],
  [#cmd("ping -c 4")], [નેટવર્ક કનેક્ટિવિટી તપાસવા 4 પેકેટ મોકલો], [#cmd("ping -c 4 8.8.8.8")],
  [#cmd("curl -I") / #cmd("wget")], [HTTP હેડર્સ તપાસો / URL થી ફાઇલ ડાઉનલોડ કરો], [#cmd("curl -I https://rtechlab.com")],
  [#cmd("dig") / #cmd("nslookup")], [DNS A, MX, TXT, NS રેકોર્ડ્સ તપાસો], [#cmd("dig rtechlab.com +short")],
  [#cmd("traceroute") / #cmd("mtr")], [ડેસ્ટિનેશન સુધીના નેટવર્ક હોપ્સ અને પેકેટ લોસ ટ્રેક કરો], [#cmd("traceroute 1.1.1.1")],
  [#cmd("ssh user@ip")], [એન્ક્રિપ્ટેડ રિમોટ શેલ લોગિન (પોર્ટ 22)], [#cmd("ssh -i key.pem ubuntu@10.0.1.5")],
  [#cmd("ssh-keygen -t ed25519")], [આધુનિક પાસવર્ડ-વગરની SSH Key પેર બનાવો], [#cmd("ssh-copy-id user@server")],
  [#cmd("scp")], [SSH દ્વારા સુરક્ષિત ફાઇલ કોપી કરો], [#cmd("scp app.zip user@ip:/var/www/")],
  [#cmd("rsync -avz --progress")], [ઝડપી ઇન્ક્રીમેન્ટલ સિંક (માત્ર બદલાયેલા ભાગ મોકલે છે!)], [#cmd("rsync -avz src/ user@ip:/bkp/")],
)

#v(3pt)
#section-banner(num: "મોડ્યુલ 10", title: "લિનક્સ ફાયરવોલ માસ્ટરી: UFW (UBUNTU) વિરુદ્ધ FIREWALLD (RHEL/FEDORA)", color: rtech-red)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#C2410C"))[🟠 UFW — Ubuntu / Debian / Kali]
      #v(2pt)
      • #cmd("sudo ufw status verbose") : ફાયરવોલ નિયમો જુઓ\
      • #cmd("sudo ufw allow 22/tcp") : SSH મંજૂરી આપો (*ચાલુ કરતાં પહેલાં!*)\
      • #cmd("sudo ufw allow 80,443/tcp") : HTTP અને HTTPS ખોલો\
      • #cmd("sudo ufw deny from 1.2.3.4") : શંકાસ્પદ IP બ્લોક કરો\
      • #cmd("sudo ufw enable") : ફાયરવોલ ચાલુ કરો
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#B91C1C"))[🎩 Firewalld — RHEL / Fedora / Alma]
      #v(2pt)
      • #cmd("sudo firewall-cmd --state") : ફાયરવોલ સ્ટેટસ તપાસો\
      • #cmd("sudo firewall-cmd --list-all") : સક્રિય નિયમો જુઓ\
      • #cmd("sudo firewall-cmd --add-service=http --permanent")\
      • #cmd("sudo firewall-cmd --add-port=8080/tcp --permanent")\
      • #cmd("sudo firewall-cmd --reload") : કાયમી નિયમો લાગુ કરો
    ]
  ]
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🔒 SSH સર્વર હાર્ડનિંગ (`/etc/ssh/sshd_config`)]
      #v(2pt)
      • `PermitRootLogin no` (સીધો Root SSH લોગિન બંધ કરો)\
      • `PasswordAuthentication no` (માત્ર SSH Keys ની મંજૂરી!)\
      • લાગુ કરો: #cmd("sudo sshd -t && sudo systemctl reload ssh")
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🌐 API અને પોર્ટ ટેસ્ટિંગ 1-લાઇનર્સ]
      #v(2pt)
      • TCP પોર્ટ તપાસ: #cmd("nc -zv 192.168.1.10 3306")\
      • curl થી JSON POST: #cmd("curl -X POST -H 'Content-Type: application/json' -d '{\"ok\":1}' URL")
    ]
  ]
)

#v(2pt)
#section-banner(num: "મોડ્યુલ 12", title: "DNS રિઝોલ્યુશન, SSH ટનલિંગ, NETPLAN અને નેટવર્ક આઇસોલેશન", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[વિષય], text(fill: white, weight: "bold")[કોન્ફિગરેશન અને પ્રોડક્શન નેટવર્કિંગ વર્કફ્લો], text(fill: white, weight: "bold")[કમાન્ડ / ફાઇલ],
  [DNS ક્રમ], [Linux પહેલા `/etc/hosts` અને પછી `/etc/resolv.conf` (`nameserver`) જુએ છે], [#cmd("cat /etc/resolv.conf")],
  [SSH ટનલ], [રિમોટ DB પોર્ટ `3306` ને સુરક્ષિત રીતે લોકલ `3307` પર ફોરવર્ડ કરો], [#cmd("ssh -L 3307:127.0.0.1:3306 u@ip")],
  [SSH કોન્ફિગ], [સર્વર શોર્ટકટ્સ અને કીઝ સેવ કરો જેથી ફક્ત `ssh prod` લખવું પડે], [`~/.ssh/config`],
  [Ubuntu Netplan], [Ubuntu 20.04/22.04/24.04 પર YAML સ્ટેટિક IP કોન્ફિગ લાગુ કરો], [#cmd("sudo netplan apply")],
  [ARP કેશ], [લોકલ LAN સેગમેન્ટ પર MAC-થી-IP કેશ જુઓ], [#cmd("ip neigh show")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5pt)[
  #text(size: 7.4pt, weight: "black", fill: rgb("#C2410C"))[🛠️ 5-પગલાંનો નેટવર્ક આઉટેજ તપાસ ક્રમ અને `iptables` ક્વિક રૂલ]
  #v(1.5pt)
  *1.* #cmd("ip link") (NIC ચાલુ?) → *2.* #cmd("ip a") (સાચો IP?) → *3.* #cmd("ping 8.8.8.8") (ઇન્ટરનેટ?) → *4.* #cmd("dig google.com") (DNS?) → *5.* #cmd("ss -tulpn") (પોર્ટ ખુલ્લો?)\
  *iptables રૂલ:* #cmd("sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT") · નિયમો જુઓ: #cmd("sudo iptables -L -n -v")
]

#did-you-know[
  આધુનિક Linux માં `ss -tulpn` એ જૂના `netstat` કમાન્ડનું સ્થાન લીધું છે. `ss` સીધું Linux કર્નેલના `tcp_diag` મોડ્યુલમાંથી સોકેટ ડેટા વાંચે છે, જેનાથી તે વ્યસ્ત સર્વર્સ પર *10 ગણું ઝડપી* ચાલે છે!
]

#pagebreak()

// =============================================================================
// PAGE 07: PACKAGE MANAGERS (APT vs DNF), CRON JOBS & VIM SURVIVAL KEYS
// =============================================================================

#section-banner(num: "મોડ્યુલ 11", title: "પેકેજ મેનેજર્સ: APT (UBUNTU/KALI) વિરુદ્ધ DNF (RHEL/FEDORA)", color: rtech-purple)

#table(
  columns: (1fr, 1fr, 1fr),
  inset: (x: 5pt, y: 5.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[કાર્ય],
  text(fill: white, weight: "bold")[Ubuntu / Debian / Kali (`apt`)],
  text(fill: white, weight: "bold")[Red Hat / Fedora (`dnf`)],
  [પેકેજ ઇન્ડેક્સ રિફ્રેશ કરો], [#cmd("sudo apt update")], [#cmd("sudo dnf check-update")],
  [બધા પેકેજ અપગ્રેડ કરો], [#cmd("sudo apt upgrade -y")], [#cmd("sudo dnf upgrade -y")],
  [નવું સોફ્ટવેર ઇન્સ્ટોલ કરો], [#cmd("sudo apt install nginx -y")], [#cmd("sudo dnf install nginx -y")],
  [સોફ્ટવેર દૂર કરો], [#cmd("sudo apt remove --purge pkg")], [#cmd("sudo dnf remove pkg")],
  [પેકેજ શોધો], [#cmd("apt search htop")], [#cmd("dnf search htop")],
  [વધારાની કેશ સાફ કરો], [#cmd("sudo apt autoremove -y")], [#cmd("sudo dnf autoremove -y")],
)

#v(3pt)
#section-banner(num: "મોડ્યુલ 12", title: "CRON JOB શેડ્યૂલર (crontab -e) અને VIM એડિટર શોર્ટકટ્સ", color: rtech-emerald)

#grid(
  columns: (1.05fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#065F46"))[⏰ Crontab 5-ફીલ્ડ ફોર્મેટ: `* * * * * command`]
      #v(2pt)
      #text(size: 6.7pt)[
        `┌── મિનિટ (0–59)` · `┌── કલાક (0–23)` · `┌── દિવસ (1–31)`\
        `│   ┌── મહિનો (1–12)` · `│   ┌── અઠવાડિયાનો દિવસ (0–6)`
      ]
      #v(2pt)
      • #cmd("0 2 * * * /bkp.sh") : દરરોજ *સવારે 2:00 વાગ્યે*\
      • #cmd("*/15 * * * * /chk.sh") : દર *15 મિનિટે* ચલાવો\
      • #cmd("0 9 * * 1 /rep.sh") : દર *સોમવારે સવારે 9:00 વાગ્યે*\
      • #cmd("@reboot /start.sh") : *સિસ્ટમ બૂટ* પર એકવાર ચલાવો\
      • #cmd("crontab -l") : સક્રિય ક્રોન જોબ્સની યાદી જુઓ
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-navy)[📝 Vim એડિટર સર્વાઇવલ કીઝ (સર્વર માટે જરૂરી)]
      #v(2pt)
      • #cmd("i") / #cmd("a") : *Insert Mode* માં જાઓ (લખવા માટે)\
      • #cmd("Esc") : *Normal Mode* માં પાછા આવો (સેવ કરતાં પહેલાં!)\
      • #cmd(":wq") કે #cmd(":x") : સેવ કરીને બહાર નીકળો\
      • #cmd(":q!") : *સેવ કર્યા વગર* તરત બહાર નીકળો\
      • #cmd("dd") / #cmd("yy") / #cmd("p") : લાઇન કાપો / કોપી / પેસ્ટ કરો\
      • #cmd("/text") + #cmd("n") : શબ્દ શોધો + આગળનું પરિણામ\
      • #cmd("gg") / #cmd("G") : ફાઇલની ટોચ / તળિયે જાઓ
    ]
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🐳 Docker અને Git આવશ્યક Linux કમાન્ડ્સ (DevOps ડેઇલી વર્કફ્લો)]
  #v(2pt)
  • *Docker:* #cmd("docker ps -a") (કન્ટેનર્સ) · #cmd("docker logs -f app") · #cmd("docker exec -it app /bin/bash") · #cmd("docker system prune -af")\
  • *Git:* #cmd("git status") · #cmd("git pull origin main") · #cmd("git add . && git commit -m 'fix'") · #cmd("git log --oneline -5")
]

#v(2pt)
#section-banner(num: "મોડ્યુલ 15", title: "યુનિવર્સલ પેકેજ (SNAP/FLATPAK), ENV પ્રોફાઇલ્સ અને બેકઅપ સ્ક્રિપ્ટ", color: rtech-amber)

#grid(
  columns: (1fr, 1.15fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#92400E"))[📦 Snap (Ubuntu) વિરુદ્ધ Flatpak (Fedora)]
      #v(1.5pt)
      • #cmd("snap list") / #cmd("sudo snap install code --classic")\
      • #cmd("flatpak list") / #cmd("flatpak install flathub app")\
      • *Systemd Timer વિરુદ્ધ Cron:* Timers (`systemctl list-timers`) માં મિસ્ડ-જોબ કેચ-અપ અને `journalctl` લોગિંગ મળે છે!
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#0F172A"), radius: 3pt, inset: 5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#38BDF8"))[⚡ રીઅલ-વર્લ્ડ ઓટો-બેકઅપ સ્ક્રિપ્ટ (`backup.sh`)]
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
  text(fill: white, weight: "bold")[પ્રોફાઇલ / Env], text(fill: white, weight: "bold")[શેલ સ્ટાર્ટઅપ અને એન્વાયર્નમેન્ટ વેરિએબલ સ્કોપ], text(fill: white, weight: "bold")[કમાન્ડ],
  [`~/.bashrc`], [યુઝરના ઇન્ટરેક્ટિવ શેલના aliases, પ્રોમ્પ્ટ અને ફંક્શન્સ], [#cmd("source ~/.bashrc")],
  [`/etc/environment`], [બધા યુઝર્સ માટે સિસ્ટમ-વાઇડ સ્ટેટિક વેરિએબલ્સ], [#cmd("printenv PATH")],
  [`~/.bash_profile`], [લોગિન શેલ (SSH/TTY) પર એકવાર ચાલે છે — `PATH` સેટિંગ], [#cmd("export EDITOR=vim")],
  [`alias` / `unalias`], [ટર્મિનલમાં અસ્થાયી કમાન્ડ શોર્ટકટ બનાવો કે હટાવો], [#cmd("alias gs='git status'")],
)

#did-you-know[
  *Fedora* હકીકતમાં *Red Hat Enterprise Linux (RHEL)* માટે અપસ્ટ્રીમ ટેસ્ટિંગ લેબ તરીકે કામ કરે છે — Fedora માં ચકાસાયેલા નવા ફીચર્સ આગળ જતાં એન્ટરપ્રાઇઝ RHEL સર્વર્સમાં આવે છે! જ્યારે *Ubuntu* અને *Kali Linux* બંને *Debian* પરિવાર (`apt` / `.deb`) ના છે.
]

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB, MOTTO, QR CODES, INTERVIEW Q&A & WHATSAPP HELP DESK
// =============================================================================

#align(center)[
  #text(size: 10.2pt, weight: "black", fill: rtech-navy)[RTECHLAB ઓથર મેન્ટરશિપ હબ, સોશિયલ મીડિયા અને DevOps ઇન્ટરવ્યુ વોલ્ટ]
  #v(1pt)
  #text(size: 6.7pt, fill: rtech-muted)[લેખક પરિચય · RTechLab ધ્યેય · સ્કેન કરી શકાય તેવા QR કોડ્સ · ટોપ 5 ઇન્ટરવ્યુ પ્રશ્ન-જવાબ · ઇમરજન્સી SOP]
]

#section-banner(num: "મુદ્દો 01", title: "લેખક પરિચય અને RTechLab ધ્યેય: રાહુલ પટેલ — સ્થાપક અને સિસ્ટમ્સ આર્કિટેક્ટ", color: rtech-navy)

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
        #text(size: 9.2pt, weight: "black", fill: rtech-navy)[રાહુલ પટેલ] #h(4pt) #hl-b[10+ વર્ષનો IT અનુભવ] #h(3pt) #hl-g[3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત]\
        #v(1pt)
        #text(size: 6.8pt, weight: "bold", fill: rtech-blue)[Founder & Lead Systems Architect · RTechLab] · #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[Director · IANT Computer Education, Palanpur]\
        #v(1.5pt)
        #text(size: 6.4pt, fill: rtech-navy)[
          *RTechLab ધ્યેય (Motto):* _"વ્યવહારિક ટેકનોલોજી (Technology Made Practical) — દરેક વિદ્યાર્થીને ક્લાસરૂમથી કોર્પોરેટ સુધી સચોટ અને હેન્ડ્સ-ઓન એન્જિનિયરિંગ ગાઇડ્સ સાથે સશક્ત બનાવવા."_
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
        #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 52pt)]
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rtech-blue)[ઓથર પોર્ટફોલિયો]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 52pt)]
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#E11D48"))[YouTube ચેનલ]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 52pt)]
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#DB2777"))[Instagram હબ]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 52pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 52pt)]
        #v(1.5pt)
        #text(size: 6.6pt, weight: "black", fill: rgb("#166534"))[WhatsApp ચેનલ]\
        #text(size: 5.5pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[ફ્રી કોમ્યુનિટી એક્સેસ ↗]]
      ]
    ]
  ],
)

#section-banner(num: "મુદ્દો 03", title: "ટોપ 5 SysAdmin / DevOps ઇન્ટરવ્યુ Q&A અને ઇમરજન્સી SOP", color: rtech-emerald)

#table(
  columns: (auto, 1fr),
  inset: (x: 4.5pt, y: 3.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[\#], text(fill: white, weight: "bold")[મુખ્ય ઇન્ટરવ્યુ પ્રશ્ન અને સચોટ જવાબ],
  [*Q1*], [*Hard Link વિરુદ્ધ Soft Link?* Soft link (`ln -s`) ફાઇલના નામને પોઇન્ટ કરે છે; Hard link સીધું *inode* શેર કરે છે (ડેટા સુરક્ષિત રહે છે).],
  [*Q2*], [*Inode અને Zombie Process?* Inode ફાઇલ મેટાડેટા રાખે છે. Zombie (`Z`) મૃત ચાઇલ્ડ પ્રોસેસ છે જેનું સ્ટેટસ પેરેન્ટે વાંચ્યું નથી; પેરેન્ટ PID બંધ કરો.],
  [*Q3*], [*`su` વિરુદ્ધ `sudo`?* `su` બીજા યુઝરનું શેલ ખોલે છે; `sudo` ઓડિટ લોગ (`/var/log/auth.log`) સાથે એક કમાન્ડ રૂટ અધિકારથી ચલાવે છે.],
  [*Q4*], [*ડિસ્ક 100% ભરાય ત્યારે તપાસ?* `df -h` થી જુઓ, `du -sh /var/* | sort -hr` થી મોટું ફોલ્ડર શોધો, અને `truncate -s 0 app.log` થી લોગ ખાલી કરો.],
  [*Q5*], [*Port Conflict કેવી રીતે ઉકેલવો?* `sudo ss -tulpn | grep :8080` થી PID શોધો અને `sudo kill -15 <PID>` થી સુરક્ષિત બંધ કરો.],
  [*Q6*], [*`grep` વિરુદ્ધ `find`?* `find` ડિસ્ક પર નામ/સાઇઝથી *ફાઇલ્સ* શોધે છે; `grep` ફાઇલની *અંદરનું ટેક્સ્ટ* શોધે છે.],
  [*Q7*], [*Swap Memory શું છે?* ભૌતિક RAM ભરાઈ જાય ત્યારે ડિસ્કના એક ભાગનો ઇમરજન્સી RAM તરીકે ઉપયોગ (`free -h` થી તપાસો).],
  [*Q8*], [*`systemctl start` વિરુદ્ધ `enable`?* `start` સર્વિસને અત્યારે ચલાવે છે; `enable` બૂટ પર ઓટો-સ્ટાર્ટ માટે સિમલિંક બનાવે છે.],
  [*Q9*], [*ડિસ્ક 70% પર પણ "No space left" કેમ?* *Inode exhaustion* (`df -i` 100%) — લાખો નાની ફાઇલ્સને કારણે નવા ઇનોડ ખતમ થઈ જવા.],
  [*Q10*], [*Linux DNS લુકઅપ ક્રમ?* પહેલા `/etc/nsswitch.conf` મુજબ `/etc/hosts` તપાસાય છે, પછી `/etc/resolv.conf` ના DNS સર્વર્સથી.],
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.0pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[સમસ્યા], text(fill: white, weight: "bold")[તપાસ કમાન્ડ], text(fill: white, weight: "bold")[ઝડપી ઉકેલ],
  [ડિસ્ક 100% ફુલ], [#cmd("df -h") પછી #cmd("du -sh /var/log/* | sort -hr")], [#cmd("truncate -s 0 app.log")],
  [પોર્ટ વ્યસ્ત], [#cmd("sudo ss -tulpn | grep :8080")], [#cmd("sudo kill -15 <PID>")],
  [Permission એરર], [#cmd("ls -ld path/to/file") અને #cmd("id")], [#cmd("sudo chown user:group file")],
  [SSH રિફ્યુઝ્ડ], [#cmd("systemctl status ssh") + #cmd("ufw status")], [SSH ચાલુ કરો અને `22/tcp` ખોલો],
)

#did-you-know[
  *Kali Linux* માં 600+ પેનિટ્રેશન ટેસ્ટિંગ ટૂલ્સ (`nmap`, `aircrack-ng`, `sqlmap`) પ્રી-ઇન્સ્ટોલ્ડ હોય છે, પરંતુ પરવાનગી વગર કોઈના નેટવર્ક પર તેનો ઉપયોગ ગેરકાયદેસર છે. હંમેશા *TryHackMe*, *HackTheBox*, અથવા તમારી પોતાની *VirtualBox/VMware* લેબમાં પ્રેક્ટિસ કરો!
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
        #box(fill: rgb("#0284C7"), radius: 3pt, inset: (x: 7pt, y: 4pt))[
          #text(size: 7.0pt, weight: "black", fill: white)[rtechlab.com/notes · 2027 આવૃત્તિ]
        ]
      ]
    )
  ]
)
