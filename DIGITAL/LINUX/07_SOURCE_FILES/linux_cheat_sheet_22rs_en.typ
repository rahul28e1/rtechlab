// =============================================================================
// RTECHLAB LINUX & SHELL MASTERY DESK CHEAT SHEET (ENGLISH EDITION 1)
// Exactly 8 Pages · Page 1 Blank Cover Placeholder · Zero-Gap Dense Desk Layout
// Author: Rahul Patel (Founder & Systems Architect, RTechLab)
// =============================================================================

#set document(
  title: "Linux & Shell Mastery Desk Reference & Cheat Sheet (English)",
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
          #text(size: 7.5pt, weight: "bold", fill: rgb("#0284C7"))[Linux & Shell Mastery Desk Reference & Cheat Sheet]
        ],
        [
          #text(size: 7.5pt, weight: "bold", fill: rgb("#059669"))[RHEL · Ubuntu · Fedora · Kali · Bash · DevOps]
          #text(size: 7.5pt, fill: rgb("#64748B"))[ · Rahul Patel]
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
            #text(fill: rgb("#0284C7"))[●] Technology Made Practical · Print & Keep on Desk · Free Tools: #link("https://rtechlab.com/tools")[*rtechlab.com/tools*]
          ]
        ],
        [
          #box(
            fill: rgb("#F1F5F9"),
            radius: 3pt,
            inset: (x: 5pt, y: 1.5pt),
            text(size: 6.8pt, weight: "bold", fill: rgb("#0F172A"))[Page #p of 8]
          )
        ]
      )
    ]
  }
)

#set text(
  font: ("Segoe UI", "Nirmala UI", "Arial"),
  size: 8.1pt,
  fill: rgb("#0F172A"),
  spacing: 100%
)

#set par(
  justify: false,
  leading: 0.56em,
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

#let section-banner(num: "MODULE 01", title: "TOPIC TITLE", color: rtech-blue) = {
  v(4pt)
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3.5pt + color, rest: 0.6pt + dark-border),
    radius: (right: 3pt),
    inset: (x: 6pt, y: 4pt),
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
            text(size: 6.6pt, font: ("Consolas", "Segoe UI"), weight: "black", fill: white)[#num]
          )
        ],
        [
          #text(size: 8.6pt, weight: "black", fill: rtech-navy)[#title]
        ]
      )
    ]
  )
  v(2.5pt)
}

#let did-you-know(fact) = {
  v(4pt)
  block(
    width: 100%,
    fill: rgb("#FEFCE8"),
    stroke: (left: 3.5pt + rtech-amber, rest: 0.6pt + rgb("#FDE047")),
    radius: (right: 3pt),
    inset: (x: 7pt, y: 5.5pt),
    [
      #text(size: 7.6pt, weight: "black", fill: rgb("#92400E"))[💡 DID YOU KNOW? ]
      #text(size: 7.4pt, fill: rgb("#451A03"))[#fact]
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
// PAGE 02: LINUX DISTROS (RHEL, UBUNTU, FEDORA, KALI), FHS & NAVIGATION
// =============================================================================

#section-banner(num: "MODULE 01", title: "POPULAR LINUX DISTRIBUTIONS: RED HAT, UBUNTU, FEDORA & KALI LINUX", color: rtech-red)

#text(size: 6.9pt, fill: rtech-muted)[
  Linux is a #hl-b[free, open-source OS kernel] created by Linus Torvalds in 1991. Different organizations combine the Linux kernel with GNU tools and package managers to build *Distributions (Distros)* tailored for servers, cloud, workstations, or cybersecurity:
]
#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#B91C1C"))[Red Hat Enterprise Linux (RHEL)]],
        [#image("02_BRAND_ASSETS/logo_redhat.png", height: 14pt)]
      )
      #v(2pt)
      • *Base / Pkg Mgr:* Independent Enterprise · #cmd("dnf") / #cmd("yum") (`.rpm`)\
      • *Release Cycle:* Long-Term Support (10 years enterprise stability)\
      • *Best For:* #hl-r[Banking, Telecom, Fortune 500 Data Centers & Hybrid Cloud]\
      • *Key Exam:* RHCSA (EX200) & RHCE (EX294) global certifications.
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5.5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#C2410C"))[Ubuntu (Canonical)]],
        [#image("02_BRAND_ASSETS/logo_ubuntu.png", height: 16pt)]
      )
      #v(2pt)
      • *Base / Pkg Mgr:* Debian-based · #cmd("apt") / #cmd("snap") (`.deb`)\
      • *Release Cycle:* Every 6 months; LTS (5 yrs) every 2 yrs (24.04 LTS)\
      • *Best For:* #hl-y[Beginners, AWS/Azure Cloud VMs, Docker & AI/ML]\
      • *Key Fact:* #1 most widely deployed Linux distro on public clouds.
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#EFF6FF"), stroke: 0.6pt + rgb("#93C5FD"), radius: 3pt, inset: 5.5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#1D4ED8"))[Fedora Workstation / Server]],
        [#image("02_BRAND_ASSETS/logo_fedora.png", height: 16pt)]
      )
      #v(2pt)
      • *Base / Pkg Mgr:* Red Hat-sponsored · #cmd("dnf") (`.rpm`)\
      • *Release Cycle:* Rapid (~6 months) with latest kernel & GNOME\
      • *Best For:* #hl-b[Developers, Modern Workstations & RHEL Upstream Testing]\
      • *Key Fact:* Linus Torvalds himself uses Fedora on his daily laptop!
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rgb("#C4B5FD"), radius: 3pt, inset: 5.5pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        [#text(size: 7.6pt, weight: "black", fill: rgb("#6D28D9"))[Kali Linux (Offensive Security)]],
        [#image("02_BRAND_ASSETS/logo_kali.png", height: 15pt)]
      )
      #v(2pt)
      • *Base / Pkg Mgr:* Debian Testing · #cmd("apt") (`.deb`)\
      • *Release Cycle:* Rolling Release (continuous security tool updates)\
      • *Best For:* #hl-g[Ethical Hacking, Penetration Testing & Digital Forensics]\
      • *Built-in Tools:* 600+ tools (`nmap`, `metasploit`, `wireshark`, `burpsuite`).
    ]
  ]
)

#v(2pt)
#section-banner(num: "MODULE 02", title: "LINUX FILE SYSTEM HIERARCHY (FHS) — COMPLETE DIRECTORY MAP", color: rtech-navy)

#table(
  columns: (auto, 1fr, auto, 1fr),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Dir], text(fill: white, weight: "bold")[Purpose & Contents],
  text(fill: white, weight: "bold")[Dir], text(fill: white, weight: "bold")[Purpose & Contents],
  [#cmd("/")], [Root directory — top of the entire Linux filesystem],
  [#cmd("/etc")], [System configuration files (`passwd`, `fstab`, `ssh`)],
  [#cmd("/home")], [Personal folders for normal users (`/home/rahul`)],
  [#cmd("/var")], [Variable logs, mail, web files (`/var/log/syslog`)],
  [#cmd("/root")], [Home directory exclusively for `root` superuser],
  [#cmd("/tmp")], [Temporary files (cleared automatically on reboot)],
  [#cmd("/bin")], [Essential user binaries (`ls`, `cp`, `cat`, `grep`)],
  [#cmd("/sbin")], [System admin binaries (`fdisk`, `iptables`, `reboot`)],
  [#cmd("/usr")], [User programs, libraries & docs (`/usr/local/bin`)],
  [#cmd("/opt")], [Optional third-party software (Chrome, custom apps)],
  [#cmd("/dev")], [Device files representing hardware (`/dev/sda`, `/dev/null`)],
  [#cmd("/proc")], [Virtual filesystem for live kernel & process info],
  [#cmd("/boot")], [Linux kernel (`vmlinuz`), `initrd` & GRUB bootloader],
  [#cmd("/mnt") / `/media`], [Manual temporary mounts & auto-mounted USB drives],
)

#v(2pt)
#section-banner(num: "MODULE 03", title: "CORE NAVIGATION, PATHS & TERMINAL SHORTCUTS", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto, 1fr),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[Command], text(fill: white, weight: "bold")[Action],
  text(fill: white, weight: "bold")[Command], text(fill: white, weight: "bold")[Action],
  [#cmd("pwd")], [Print current working directory path],
  [#cmd("cd ~") / #cmd("cd -")], [Go to home directory / switch to previous dir],
  [#cmd("ls -lah")], [Long list, all hidden files (`.`), human-readable sizes],
  [#cmd("ls -lt") / #cmd("ls -lS")], [Sort by newest modified time / largest file size],
  [#cmd("tree -L 2")], [Visual folder tree up to 2 levels deep],
  [#cmd("find /etc -name '*.conf'")], [Search files matching pattern live on disk],
  [#cmd("which python3")], [Show exact binary path of an executable command],
  [#cmd("whereis nginx")], [Locate binary, source, and man page files],
  [#cmd("history | grep ssh")], [Search previously executed commands],
  [#cmd("man ls") / #cmd("ls --help")], [Open manual page / quick flags reference],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.6pt, weight: "black", fill: rtech-navy)[🧭 Absolute vs Relative Paths]
      #v(2pt)
      • *Absolute Path* (always starts with `/`): #cmd("cd /var/log/nginx")\
      • *Relative Path* (from current folder): #cmd("cd ./logs") or #cmd("cd ../etc")\
      • #cmd(".") = Current directory · #cmd("..") = Parent directory · #cmd("~") = Home
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.6pt, weight: "black", fill: rtech-blue)[🐚 Linux Shells & Distro Quick-Pick]
      #v(2pt)
      • *Bash* (`/bin/bash`): Default on Ubuntu, RHEL, Fedora · *Zsh*: Default on Kali\
      • *Check Shell:* #cmd("echo $SHELL") · *Check Distro:* #cmd("cat /etc/os-release")\
      • *Pick:* Server → *RHEL/Ubuntu* · Desktop → *Fedora* · Security → *Kali*
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, auto, auto, auto, 1fr),
  inset: (x: 4.5pt, y: 3.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Distro], text(fill: white, weight: "bold")[Pkg Format], text(fill: white, weight: "bold")[Firewall], text(fill: white, weight: "bold")[Default Shell], text(fill: white, weight: "bold")[Primary Enterprise / Career Role],
  [*RHEL*], [`.rpm` (`dnf`)], [`firewalld`], [`bash`], [Enterprise Banking, Telecom & RHCSA/RHCE],
  [*Ubuntu*], [`.deb` (`apt`)], [`ufw`], [`bash`], [Cloud VMs (AWS/GCP/Azure), Docker & DevOps],
  [*Fedora*], [`.rpm` (`dnf`)], [`firewalld`], [`bash`], [Developer Workstations & Upstream RHEL Lab],
  [*Kali*], [`.deb` (`apt`)], [`ufw`/`nft`], [`zsh`], [Ethical Hacking, VAPT & SOC Analysts],
)

#did-you-know[
  Linux powers *100% of the world's Top 500 supercomputers*, over *96% of the top 1 million web servers*, and *Android* itself runs on a modified Linux kernel. Mastering Linux opens doors to Cloud, DevOps, Cyber Security, and System Administration!
]

#pagebreak()

// =============================================================================
// PAGE 03: FILE OPERATIONS, ARCHIVES, TEXT PROCESSING & ENVIRONMENT VARIABLES
// =============================================================================

#section-banner(num: "MODULE 04", title: "FILE, DIRECTORY, LINK & ARCHIVE OPERATIONS", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[Command], text(fill: white, weight: "bold")[Description & Practical Usage], text(fill: white, weight: "bold")[Example],
  [#cmd("mkdir -p")], [Create nested directories in one command (no error if exists)], [#cmd("mkdir -p app/src/logs")],
  [#cmd("touch")], [Create an empty file or update timestamp of existing file], [#cmd("touch notes.txt")],
  [#cmd("cp -rp")], [Copy files/folders recursively while preserving permissions], [#cmd("cp -rp src/ backup/")],
  [#cmd("mv")], [Move OR rename files and directories], [#cmd("mv old.txt new.txt")],
  [#cmd("rm -rf")], [Forcefully & recursively delete folder (*USE WITH CAUTION!*)], [#cmd("rm -rf ./temp_cache")],
  [#cmd("ln -s")], [Create a Symbolic (Soft) Link — like a Windows shortcut], [#cmd("ln -s /var/www html")],
  [#cmd("file") / #cmd("stat")], [Identify true file type (ignoring extension) / inode metadata], [#cmd("stat app.log")],
  [#cmd("tar -czvf")], [Compress folder into a `.tar.gz` archive], [#cmd("tar -czvf bkp.tar.gz dir/")],
  [#cmd("tar -xzvf")], [Extract a `.tar.gz` compressed archive], [#cmd("tar -xzvf bkp.tar.gz")],
  [#cmd("zip -r") / #cmd("unzip")], [Create or extract `.zip` archives across Linux & Windows], [#cmd("unzip bundle.zip")],
)

#v(2pt)
#section-banner(num: "MODULE 05", title: "TEXT PROCESSING, SEARCHING, PIPES & REDIRECTION", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Command], text(fill: white, weight: "bold")[What It Does], text(fill: white, weight: "bold")[Pro 1-Liner],
  [#cmd("cat") / #cmd("less")], [Print entire file / view large file page-by-page (`q` to quit)], [#cmd("less /var/log/syslog")],
  [#cmd("head -n 20")], [Display first 20 lines of a file], [#cmd("head -n 20 data.csv")],
  [#cmd("tail -f")], [Follow live log updates in real time (essential for debugging!)], [#cmd("tail -f /var/log/nginx/error.log")],
  [#cmd("grep -rni")], [Recursive, line-numbered, case-insensitive text search], [#cmd("grep -rni 'ERROR' /var/log")],
  [#cmd("awk")], [Extract & process structured columns from text/CSV], [#cmd("awk '{print $1, $4}' access.log")],
  [#cmd("sed -i")], [Stream editor — find & replace text inside file in-place], [#cmd("sed -i 's/http/https/g' cfg.txt")],
  [#cmd("cut -d',' -f1")], [Slice specific column by delimiter (e.g., comma `,` or `:`)], [#cmd("cut -d':' -f1 /etc/passwd")],
  [#cmd("sort | uniq -c")], [Sort lines and count duplicate occurrences], [#cmd("sort ips.txt | uniq -c | sort -nr")],
  [#cmd("wc -l")], [Count total number of lines (great with pipes)], [#cmd("cat users.txt | wc -l")],
  [#cmd("diff -u") / #cmd("cmp")], [Compare two config files line-by-line], [#cmd("diff -u old.conf new.conf")],
)

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-navy)[🔀 Standard Streams & Redirection]
      #v(2pt)
      • #cmd("cmd > file.txt") : Overwrite stdout to file\
      • #cmd("cmd >> file.txt") : Append stdout to end of file\
      • #cmd("cmd 2> err.log") : Redirect only errors (stderr `2`)\
      • #cmd("cmd > out.log 2>&1") : Combine stdout + stderr into one file\
      • #cmd("cmd > /dev/null 2>&1") : Silence all output completely\
      • #cmd("cmd | tee out.log") : Print on screen AND save to file
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-blue)[⚡ Shell Wildcards, Aliases & Shortcuts]
      #v(2pt)
      • #cmd("*") matches any chars; #cmd("?") matches 1 char; #cmd("[a-z]") range\
      • #cmd("!!") : Re-run last command (e.g. #cmd("sudo !!"))\
      • #cmd("Ctrl + R") : Reverse-search command history\
      • #cmd("Ctrl + A / E") : Jump to start / end of terminal line\
      • #cmd("alias ll='ls -lah'") : Create custom shortcut in `~/.bashrc`\
      • #cmd("export PATH=$PATH:/opt/bin") : Add folder to `$PATH`
    ]
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.6pt, weight: "black", fill: rgb("#065F46"))[🔥 Top 5 Real-World Log & Text 1-Liners (DevOps Daily Use)]
  #v(2pt)
  *1.* Top 10 IPs hitting Nginx: #cmd("awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -10")\
  *2.* Find & delete `.log` files older than 7 days: #cmd("find /var/log -name '*.log' -mtime +7 -delete")\
  *3.* Count 404 errors live: #cmd("grep ' 404 ' /var/log/nginx/access.log | wc -l") · *4.* Strip blank/comment lines: #cmd("grep -vE '^#|^$' /etc/ssh/sshd_config")
]

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[Tool / Concept], text(fill: white, weight: "bold")[Integrity, Compression & Advanced File Utility], text(fill: white, weight: "bold")[Command],
  [#cmd("sha256sum")], [Verify downloaded ISO / backup file integrity against tampering], [#cmd("sha256sum ubuntu.iso")],
  [#cmd("gzip") / #cmd("xz")], [Fast `.gz` compression vs ultra-high `.xz` compression], [#cmd("tar -cJvf bkp.tar.xz dir/")],
  [#cmd("xargs")], [Pass piped output items as arguments to another command], [#cmd("find . -name '*.tmp' | xargs rm")],
  [#cmd("split -b 100M")], [Split huge log/backup file into 100MB chunks for transfer], [#cmd("split -b 100M db.sql part_")],
  [`atime`/`mtime`/`ctime`], [Access time, Content Modify time, Inode Metadata Change time], [#cmd("stat /etc/hosts")],
)

#did-you-know[
  In Linux, *"Everything is a file"* — regular text files, folders, hardware drives (`/dev/nvme0n1`), terminal windows, and even live CPU/RAM stats (`/proc/cpuinfo`) can be read using standard file tools like `cat` and `grep`!
]

#pagebreak()

// =============================================================================
// PAGE 04: USERS, GROUPS, PERMISSIONS MATRIX & SECURITY BASICS
// =============================================================================

#section-banner(num: "MODULE 06", title: "USERS, GROUPS & SUDO PRIVILEGE MANAGEMENT", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[Command / File], text(fill: white, weight: "bold")[Administrative Action], text(fill: white, weight: "bold")[Example],
  [#cmd("whoami") / #cmd("id")], [Show current username, UID, GID, and group memberships], [#cmd("id rahul")],
  [#cmd("sudo useradd -m")], [Create a new user with `/home/username` directory], [#cmd("sudo useradd -m -s /bin/bash dev")],
  [#cmd("sudo passwd dev")], [Set, reset, or lock (`-l`) a user's login password], [#cmd("sudo passwd dev")],
  [#cmd("sudo usermod -aG")], [Add user to a supplementary group (`-aG` = append!)], [#cmd("sudo usermod -aG sudo,docker dev")],
  [#cmd("sudo userdel -r")], [Delete user account along with home directory & mail], [#cmd("sudo userdel -r tempuser")],
  [#cmd("su - username")], [Switch user with full login environment], [#cmd("su - root")],
  [#cmd("/etc/passwd")], [Stores user accounts, UID, GID, home dir, default shell], [`rahul:x:1000:1000::/home/rahul:/bin/bash`],
  [#cmd("/etc/shadow")], [Stores encrypted password hashes (readable only by `root`)], [`sudo cat /etc/shadow`],
  [#cmd("visudo")], [Safely edit `/etc/sudoers` with syntax checking], [#cmd("sudo visudo")],
)

#v(2pt)
#section-banner(num: "MODULE 07", title: "LINUX FILE PERMISSIONS MATRIX (chmod, chown, umask & SPECIAL BITS)", color: rtech-amber)

#grid(
  columns: (1.1fr, 1fr),
  gutter: 6pt,
  [
    #table(
      columns: (auto, auto, auto, 1fr),
      inset: (x: 5pt, y: 4.8pt),
      stroke: 0.5pt + rgb("#CBD5E1"),
      fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#FFFBEB") } else { white },
      text(fill: white, weight: "bold")[Symbol], text(fill: white, weight: "bold")[Val], text(fill: white, weight: "bold")[On File], text(fill: white, weight: "bold")[On Directory],
      [#hl-g[`r` (Read)]], [*4*], [View file contents], [List folder (`ls`)],
      [#hl-y[`w` (Write)]], [*2*], [Modify / delete content], [Create/delete files inside],
      [#hl-b[`x` (Execute)]], [*1*], [Run as script/program], [Enter folder (`cd`)],
      [#hl-r[`-` (None)]], [*0*], [No access], [No access],
    )
    #v(2pt)
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
      #text(size: 7pt, weight: "black")[Permission String Breakdown: `-rwxr-xr--` (`754`)]
      #v(1.5pt)
      • Char 1 (`-`/`d`/`l`): File type (`-` file, `d` dir, `l` symlink)\
      • Chars 2–4 (`rwx` = 4+2+1 = *7*): *User (Owner)*\
      • Chars 5–7 (`r-x` = 4+0+1 = *5*): *Group*\
      • Chars 8–10 (`r--` = 4+0+0 = *4*): *Others (World)*
    ]
  ],
  [
    #table(
      columns: (auto, 1fr),
      inset: (x: 5pt, y: 4.8pt),
      stroke: 0.5pt + rgb("#CBD5E1"),
      fill: (_, row) => if row == 0 { rgb("#D97706") } else if calc.even(row) { rgb("#FEF3C7") } else { white },
      text(fill: white, weight: "bold")[Octal / Cmd], text(fill: white, weight: "bold")[Real-World Use Case],
      [#cmd("chmod 755")], [Scripts & Web Folders (`rwxr-xr-x`)],
      [#cmd("chmod 644")], [Standard Config & HTML Files (`rw-r--r--`)],
      [#cmd("chmod 600")], [Private SSH Keys (`~/.ssh/id_ed25519`)],
      [#cmd("chmod 700")], [Private User Home/Backup Folders],
      [#cmd("chmod +x s.sh")], [Make a Bash script executable quickly],
      [#cmd("chown -R u:g d/")], [Change Owner & Group recursively],
      [#cmd("umask 022")], [Default mask: new files `644`, dirs `755`],
    )
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#FFF1F2"), stroke: 0.6pt + rgb("#FDA4AF"), radius: 3pt, inset: 5pt)[
  #text(size: 7.1pt, weight: "black", fill: rgb("#9F1239"))[🔐 Special Permissions (4th Leading Digit):]
  #h(4pt)
  #hl-r[SUID (`4xxx`)] Runs binary with *owner's* privilege (e.g., `/usr/bin/passwd`) ·
  #hl-b[SGID (`2xxx`)] New files in folder inherit *parent group* ·
  #hl-y[Sticky Bit (`1xxx`)] Only file owner can delete their file inside shared folder (e.g., `/tmp` is `1777`).
]

#v(2pt)
#block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rgb("#6EE7B7"), radius: 3pt, inset: 5pt)[
  #text(size: 7.2pt, weight: "black", fill: rgb("#065F46"))[🛡️ SELinux (RHEL/Fedora) & AppArmor (Ubuntu) Quick Check]
  #v(1.5pt)
  • #cmd("getenforce") : Check SELinux mode (`Enforcing`, `Permissive`, `Disabled`) · #cmd("sudo setenforce 0") (temporarily Permissive for testing)\
  • #cmd("ls -Z") / #cmd("ps -Z") : View SELinux security contexts · #cmd("sudo aa-status") : Check AppArmor profiles on Ubuntu
]

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#F5F3FF"), stroke: 0.6pt + rtech-purple, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#5B21B6"))[⏳ Password Aging (`chage`) & Sudoers]
      #v(2pt)
      • #cmd("sudo chage -l rahul") : View password expiry policy\
      • #cmd("sudo chage -M 90 rahul") : Force password change every 90 days\
      • `/etc/sudoers`: `rahul ALL=(ALL) NOPASSWD: /usr/bin/systemctl`
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[📋 Access Control Lists (ACL) — Fine-Grained Perms]
      #v(2pt)
      • #cmd("getfacl file.txt") : View extended ACL permissions\
      • #cmd("setfacl -m u:dev:rw file.txt") : Grant `dev` user `rw` without changing group\
      • #cmd("setfacl -b file.txt") : Remove all extra ACL entries cleanly
    ]
  ]
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[Security Check], text(fill: white, weight: "bold")[Audit & Privilege Verification Purpose], text(fill: white, weight: "bold")[Command],
  [Sudo Audit Logs], [Inspect who ran `sudo` commands & failed SSH attempts], [#cmd("sudo tail -f /var/log/auth.log")],
  [RHEL Secure Log], [Equivalent authentication & `sudo` log on RHEL/Fedora], [#cmd("sudo tail -f /var/log/secure")],
  [Logged-In Users], [See active SSH sessions, login IP & current running tasks], [#cmd("w") / #cmd("who") / #cmd("last -n 10")],
  [Find World-Writable], [Audit dangerous `777` files across the system], [#cmd("find / -perm -0002 -type f 2>/dev/null")],
  [Lock / Unlock User], [Immediately freeze or restore a compromised account], [#cmd("sudo usermod -L dev") / #cmd("-U")],
)

#did-you-know[
  Never fix a permission error by blindly running `chmod 777` on a production server! It lets *any* user or compromised service overwrite your code. Standard secure defaults are `755` for directories/scripts and `644` for regular files (or `600` for secrets/SSH keys).
]

#pagebreak()

// =============================================================================
// PAGE 05: PROCESS MANAGEMENT, SYSTEMD, BOOT PROCESS & DISK DIAGNOSTICS
// =============================================================================

#section-banner(num: "MODULE 08", title: "PROCESS MANAGEMENT, SIGNALS & SYSTEMD SERVICES", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[Command], text(fill: white, weight: "bold")[Description], text(fill: white, weight: "bold")[Example],
  [#cmd("ps aux | grep")], [Snapshot of all running processes filtered by name], [#cmd("ps aux | grep nginx")],
  [#cmd("top") / #cmd("htop")], [Live interactive CPU, RAM, load average & PID monitor], [#cmd("htop")],
  [#cmd("kill -15 PID")], [`SIGTERM` — Politely asks process to clean up & exit], [#cmd("kill -15 4821")],
  [#cmd("kill -9 PID")], [`SIGKILL` — Force-kills hung process immediately at kernel], [#cmd("kill -9 4821")],
  [#cmd("pkill -f name")], [Kill processes matching full command name], [#cmd("pkill -f python3")],
  [#cmd("nohup cmd &")], [Run job in background immune to terminal logout], [#cmd("nohup ./sync.sh &")],
  [#cmd("systemctl status")], [Check if a systemd service is active, failed, or disabled], [#cmd("systemctl status ssh")],
  [#cmd("systemctl restart")], [Restart service immediately after config edit], [#cmd("sudo systemctl restart nginx")],
  [#cmd("systemctl enable --now")], [Start service now AND auto-start on every boot], [#cmd("sudo systemctl enable --now docker")],
  [#cmd("journalctl -u")], [Inspect systemd logs (`-f` live, `-xe` recent errors)], [#cmd("journalctl -u nginx -n 50")],
)

#v(2pt)
#section-banner(num: "MODULE 09", title: "DISK, FILESYSTEM, MEMORY & HARDWARE DIAGNOSTICS", color: rtech-emerald)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[Command], text(fill: white, weight: "bold")[Hardware / Storage Insight], text(fill: white, weight: "bold")[Pro Check],
  [#cmd("df -h")], [Disk free space of mounted partitions (human-readable)], [#cmd("df -hT") (shows ext4/xfs)],
  [#cmd("du -sh *")], [Size of each folder in current path (find what's filling disk!)], [#cmd("du -sh /var/* | sort -hr")],
  [#cmd("free -h")], [RAM & Swap usage (`available` = true free memory)], [#cmd("free -h")],
  [#cmd("lsblk")], [List all block disks, partitions & mount points visually], [#cmd("lsblk -f")],
  [#cmd("uptime")], [Server running time + 1m, 5m, 15m CPU Load Averages], [#cmd("uptime")],
  [#cmd("lscpu") / #cmd("uname -a")], [CPU cores/architecture & exact Linux Kernel version], [#cmd("uname -r")],
  [#cmd("mount") / `/etc/fstab`], [Attach storage device / permanent boot mount table], [#cmd("sudo mount /dev/sdb1 /mnt")],
  [#cmd("dmesg -T | tail")], [Read kernel ring buffer hardware/driver boot messages], [#cmd("sudo dmesg -T | grep -i error")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
  #text(size: 7.3pt, weight: "black", fill: rtech-navy)[🔄 6-Stage Linux Boot Process & Systemd Targets]
  #v(1.5pt)
  *1.* BIOS/UEFI POST → *2.* Bootloader (`GRUB2`) → *3.* Linux Kernel + `initramfs` → *4.* `systemd` (PID 1) → *5.* `multi-user.target` (CLI) or `graphical.target` (GUI) → *6.* Login Shell.\
  *Switch Target:* #cmd("systemctl get-default") · #cmd("sudo systemctl set-default multi-user.target") · #cmd("sudo reboot")
]

#v(2pt)
#block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-blue)[💾 LVM (Logical Volume Manager) & Emergency Swap Quick-Ref]
  #v(2pt)
  • *LVM Flow:* Physical Volume (#cmd("pvcreate /dev/sdb")) → Volume Group (#cmd("vgcreate vg0 /dev/sdb")) → Logical Volume (#cmd("lvcreate -L 20G -n data vg0"))\
  • *Extend Live Disk:* #cmd("sudo lvextend -L +10G -r /dev/vg0/data") (resizes filesystem online!)\
  • *Quick 2GB Swap File:* #cmd("sudo fallocate -l 2G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile")
]

#v(2pt)
#section-banner(num: "MODULE 10", title: "DEEP-DIVE PERFORMANCE MONITORING & SYSTEMD HEALTH AUDIT", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Tool / Cmd], text(fill: white, weight: "bold")[Bottleneck & Kernel Diagnostic Insight], text(fill: white, weight: "bold")[Example],
  [#cmd("vmstat 1 5")], [Monitor CPU wait (`wa`), swap in/out (`si`/`so`) & context switches], [#cmd("vmstat 1 5")],
  [#cmd("iostat -xz 1")], [Disk I/O utilization (`%util`) & read/write latency (`await`)], [#cmd("iostat -xz 1")],
  [#cmd("iotop -o")], [Show live processes actively writing/reading disk I/O], [#cmd("sudo iotop -o")],
  [#cmd("lsof +L1")], [Find deleted files still held open by a process (hidden disk fill!)], [#cmd("sudo lsof +L1")],
  [#cmd("systemctl --failed")], [List all crashed or failed systemd units on the server], [#cmd("systemctl list-units --failed")],
  [#cmd("systemd-analyze")], [Measure exact kernel + userspace boot time in seconds], [#cmd("systemd-analyze blame | head")],
)

#did-you-know[
  Always try `kill -15 <PID>` (SIGTERM) before `kill -9 <PID>` (SIGKILL)! `kill -15` allows databases and apps to flush data safely to disk, whereas `kill -9` cuts power instantly and can leave corrupt temp/lock files behind.
]

#pagebreak()

// =============================================================================
// PAGE 06: LINUX NETWORKING, SSH, REMOTE TRANSFER & FIREWALLS
// =============================================================================

#section-banner(num: "MODULE 10", title: "LINUX NETWORKING, PORTS, DNS & REMOTE TRANSFERS", color: rtech-blue)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[Command], text(fill: white, weight: "bold")[Networking & Remote Action], text(fill: white, weight: "bold")[Example],
  [#cmd("ip a") / #cmd("ip r")], [Show IP addresses, MAC & default gateway routing table], [#cmd("ip -br a")],
  [#cmd("ss -tulpn")], [List all listening TCP/UDP ports & owning PIDs], [#cmd("ss -tulpn | grep :80")],
  [#cmd("ping -c 4")], [Send 4 ICMP echo packets to test host reachability], [#cmd("ping -c 4 8.8.8.8")],
  [#cmd("curl -I") / #cmd("wget")], [Fetch HTTP headers / download files from URL], [#cmd("curl -I https://rtechlab.com")],
  [#cmd("dig") / #cmd("nslookup")], [Query DNS A, MX, TXT, NS records cleanly], [#cmd("dig rtechlab.com +short")],
  [#cmd("traceroute") / #cmd("mtr")], [Trace network hops and packet loss to destination], [#cmd("traceroute 1.1.1.1")],
  [#cmd("nmcli dev status")], [NetworkManager CLI — manage Wi-Fi, Ethernet & Static IPs], [#cmd("nmcli con show")],
  [#cmd("ssh user@ip")], [Encrypted remote shell login (Port 22)], [#cmd("ssh -i key.pem ubuntu@10.0.1.5")],
  [#cmd("ssh-keygen -t ed25519")], [Generate modern passwordless SSH key pair], [#cmd("ssh-copy-id user@server")],
  [#cmd("scp")], [Secure copy files over SSH], [#cmd("scp app.zip user@ip:/var/www/")],
  [#cmd("rsync -avz --progress")], [Fast incremental sync (only transfers changed blocks!)], [#cmd("rsync -avz src/ user@ip:/bkp/")],
  [#cmd("tcpdump -i eth0")], [Capture live network packets directly from terminal], [#cmd("sudo tcpdump -i eth0 port 80")],
)

#v(2pt)
#section-banner(num: "MODULE 11", title: "LINUX FIREWALL MASTERY: UFW (UBUNTU) vs FIREWALLD (RHEL / FEDORA)", color: rtech-red)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#C2410C"))[🟠 UFW — Ubuntu / Debian / Kali]
      #v(2pt)
      • #cmd("sudo ufw status verbose") : Check firewall rules\
      • #cmd("sudo ufw allow 22/tcp") : Allow SSH (*do before enabling!*)\
      • #cmd("sudo ufw allow 80,443/tcp") : Allow HTTP & HTTPS\
      • #cmd("sudo ufw deny from 1.2.3.4") : Block attacker IP\
      • #cmd("sudo ufw enable") : Turn firewall ON
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#B91C1C"))[🎩 Firewalld — RHEL / Fedora / Alma]
      #v(2pt)
      • #cmd("sudo firewall-cmd --state") : Check daemon status\
      • #cmd("sudo firewall-cmd --list-all") : View active zone rules\
      • #cmd("sudo firewall-cmd --add-service=http --permanent")\
      • #cmd("sudo firewall-cmd --add-port=8080/tcp --permanent")\
      • #cmd("sudo firewall-cmd --reload") : Apply permanent rules
    ]
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
  #text(size: 7.2pt, weight: "black", fill: rtech-navy)[📌 Essential Server Ports Memorizer:]
  #h(4pt)
  #cmd("22") SSH · #cmd("21") FTP · #cmd("25") SMTP · #cmd("53") DNS · #cmd("80") HTTP · #cmd("443") HTTPS · #cmd("3306") MySQL · #cmd("5432") PostgreSQL · #cmd("6379") Redis · #cmd("27017") MongoDB
]

#v(2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FEF2F2"), stroke: 0.6pt + rgb("#FCA5A5"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#B91C1C"))[🔒 SSH Server Hardening (`/etc/ssh/sshd_config`)]
      #v(2pt)
      • `PermitRootLogin no` (Disable direct root SSH login)\
      • `PasswordAuthentication no` (Allow SSH keys only!)\
      • Apply changes: #cmd("sudo sshd -t && sudo systemctl reload ssh")
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#065F46"))[🌐 API & Port Testing 1-Liners]
      #v(2pt)
      • Test TCP port open: #cmd("nc -zv 192.168.1.10 3306")\
      • POST JSON via curl: #cmd("curl -X POST -H 'Content-Type: application/json' -d '{\"ok\":1}' URL")
    ]
  ]
)

#v(2pt)
#section-banner(num: "MODULE 12", title: "DNS RESOLUTION FLOW, SSH TUNNELING & NETPLAN / NMCLI", color: rtech-purple)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.6pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0284C7") } else if calc.even(row) { rgb("#F0F9FF") } else { white },
  text(fill: white, weight: "bold")[Topic], text(fill: white, weight: "bold")[Configuration & Production Networking Workflow], text(fill: white, weight: "bold")[Command / File],
  [DNS Order], [Linux checks `/etc/hosts` first, then `/etc/resolv.conf` (`nameserver`)], [#cmd("cat /etc/resolv.conf")],
  [SSH Tunnel], [Forward remote DB port `3306` securely to your local port `3307`], [#cmd("ssh -L 3307:127.0.0.1:3306 u@ip")],
  [SSH Config], [Save server aliases & keys so you just type `ssh prod`], [`~/.ssh/config`],
  [Ubuntu Netplan], [YAML static IP config on Ubuntu 20.04/22.04/24.04 servers], [#cmd("sudo netplan apply")],
  [ARP & Neighbors], [View MAC-to-IP cache on local LAN segment], [#cmd("ip neigh show")],
  [Bandwidth / Speed], [Quickly test server download throughput from terminal], [#cmd("curl -s -o /dev/null -w '%{speed_download}' URL")],
)

#v(2pt)
#block(width: 100%, fill: rgb("#FFF7ED"), stroke: 0.6pt + rgb("#FDBA74"), radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rgb("#C2410C"))[🛠️ 5-Step Network Outage Isolation Order & Legacy `iptables` Quick-Ref]
  #v(2pt)
  *1.* #cmd("ip link") (NIC UP?) → *2.* #cmd("ip a") (Valid IP?) → *3.* #cmd("ping 8.8.8.8") (Gateway/Internet?) → *4.* #cmd("dig google.com") (DNS?) → *5.* #cmd("ss -tulpn") (Service listening?)\
  *iptables Quick Rule:* #cmd("sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT") · View rules: #cmd("sudo iptables -L -n -v")
]

#did-you-know[
  In modern Linux distributions, `ss -tulpn` has officially replaced the legacy `netstat` command. `ss` reads socket data directly from the Linux kernel's `tcp_diag` module, making it *10× faster* on busy servers with thousands of connections!
]

#pagebreak()

// =============================================================================
// PAGE 07: PACKAGE MANAGERS, CRON, VIM & BASH SCRIPTING ESSENTIALS
// =============================================================================

#section-banner(num: "MODULE 12", title: "PACKAGE MANAGERS: APT (UBUNTU/KALI) vs DNF (RHEL/FEDORA)", color: rtech-purple)

#table(
  columns: (1fr, 1fr, 1fr),
  inset: (x: 5pt, y: 4.8pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#7C3AED") } else if calc.even(row) { rgb("#F5F3FF") } else { white },
  text(fill: white, weight: "bold")[Task],
  text(fill: white, weight: "bold")[Ubuntu / Debian / Kali (`apt`)],
  text(fill: white, weight: "bold")[Red Hat / Fedora (`dnf`)],
  [Refresh package index], [#cmd("sudo apt update")], [#cmd("sudo dnf check-update")],
  [Upgrade all packages], [#cmd("sudo apt upgrade -y")], [#cmd("sudo dnf upgrade -y")],
  [Install software], [#cmd("sudo apt install nginx -y")], [#cmd("sudo dnf install nginx -y")],
  [Remove software], [#cmd("sudo apt remove --purge pkg")], [#cmd("sudo dnf remove pkg")],
  [Search repository], [#cmd("apt search htop")], [#cmd("dnf search htop")],
  [Clean unused cache], [#cmd("sudo apt autoremove -y")], [#cmd("sudo dnf autoremove -y")],
)

#v(2pt)
#section-banner(num: "MODULE 13", title: "CRON JOB SCHEDULER (crontab -e) & VIM EDITOR SURVIVAL KEYS", color: rtech-emerald)

#grid(
  columns: (1.05fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#ECFDF5"), stroke: 0.6pt + rtech-emerald, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rgb("#065F46"))[⏰ Crontab 5-Field Format: `* * * * * command`]
      #v(2pt)
      #text(size: 6.7pt)[
        `┌── Minute (0–59)` · `┌── Hour (0–23)` · `┌── Day (1–31)`\
        `│   ┌── Month (1–12)` · `│   ┌── Weekday (0–6, 0=Sun)`
      ]
      #v(2pt)
      • #cmd("0 2 * * * /bkp.sh") : Run daily at *2:00 AM*\
      • #cmd("*/15 * * * * /chk.sh") : Run every *15 minutes*\
      • #cmd("0 9 * * 1 /rep.sh") : Every *Monday at 9:00 AM*\
      • #cmd("@reboot /start.sh") : Run once on *system boot*\
      • #cmd("crontab -l") : List user's active cron jobs
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
      #text(size: 7.4pt, weight: "black", fill: rtech-navy)[📝 Vim Editor Survival Keys (Essential for Servers)]
      #v(2pt)
      • #cmd("i") / #cmd("a") : Enter *Insert Mode* (to type text)\
      • #cmd("Esc") : Return to *Normal Mode* (before saving!)\
      • #cmd(":wq") or #cmd(":x") : Save & Quit\
      • #cmd(":q!") : Force Quit *WITHOUT* saving\
      • #cmd("dd") / #cmd("yy") / #cmd("p") : Delete line / Copy line / Paste\
      • #cmd("/text") + #cmd("n") : Search forward + next match\
      • #cmd("gg") / #cmd("G") : Jump to top / bottom of file
    ]
  ]
)

#v(2pt)
#section-banner(num: "MODULE 14", title: "BASH SHELL SCRIPTING CHEAT SHEET (AUTOMATION ESSENTIALS)", color: rtech-blue)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #block(width: 100%, fill: rgb("#F0F9FF"), stroke: 0.6pt + rtech-blue, radius: 3pt, inset: 5pt)[
      #text(size: 7.2pt, weight: "black", fill: rtech-blue)[📜 Script Header, Variables & Special Args]
      #v(1.5pt)
      • `#!/bin/bash` : Shebang (must be Line 1!)\
      • `NAME="Rahul"` · `echo "Hi $NAME"` (no spaces around `=`)\
      • #cmd("$0") Script name · #cmd("$1, $2") Arguments · #cmd("$#") Arg count\
      • #cmd("$?") Exit status of last command (`0` = Success, `!= 0` Error)\
      • #cmd("$(date +%F)") : Command substitution (e.g., `2027-01-15`)
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5pt)[
      #text(size: 7.2pt, weight: "black", fill: rtech-navy)[🔁 Conditionals & Loops (`if` / `for`)]
      #v(1.5pt)
      • `if [ -f /etc/hosts ]; then echo "Exists"; fi` (`-d` dir, `-z` empty)\
      • Numeric: `-eq` (`==`), `-ne` (`!=`), `-gt` (`>`), `-lt` (`<`)\
      • `for f in *.log; do gzip "$f"; done`\
      • `chmod +x deploy.sh && ./deploy.sh` (Make executable & run)
    ]
  ]
)

#v(2pt)
#block(width: 100%, fill: rgb("#F8FAFC"), stroke: 0.6pt + dark-border, radius: 3pt, inset: 5.5pt)[
  #text(size: 7.5pt, weight: "black", fill: rtech-navy)[🐳 Docker & Git Essential Linux Commands (DevOps Daily Workflow)]
  #v(2pt)
  • *Docker:* #cmd("docker ps -a") (containers) · #cmd("docker logs -f app") · #cmd("docker exec -it app /bin/bash") · #cmd("docker system prune -af")\
  • *Git:* #cmd("git status") · #cmd("git pull origin main") · #cmd("git add . && git commit -m 'fix'") · #cmd("git log --oneline -5")
]

#v(2pt)
#section-banner(num: "MODULE 15", title: "UNIVERSAL PACKAGES (SNAP/FLATPAK) & PRODUCTION BACKUP SCRIPT", color: rtech-amber)

#grid(
  columns: (1fr, 1.15fr),
  gutter: 5pt,
  [
    #block(width: 100%, fill: rgb("#FFFBEB"), stroke: 0.6pt + rtech-amber, radius: 3pt, inset: 5.5pt)[
      #text(size: 7.5pt, weight: "black", fill: rgb("#92400E"))[📦 Snap (Ubuntu) vs Flatpak (Fedora)]
      #v(2pt)
      • #cmd("snap list") / #cmd("sudo snap install code --classic")\
      • #cmd("flatpak list") / #cmd("flatpak install flathub app")\
      • *Systemd Timer vs Cron:* Timers (`systemctl list-timers`) support missed-job catch-up & `journalctl` logging!
    ]
  ],
  [
    #block(width: 100%, fill: rgb("#0F172A"), radius: 3pt, inset: 5.5pt)[
      #text(size: 7.2pt, weight: "black", fill: rgb("#38BDF8"))[⚡ Real-World Auto-Backup Script (`backup.sh`)]
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
  inset: (x: 4.5pt, y: 3.4pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#ECFDF5") } else { white },
  text(fill: white, weight: "bold")[Profile / Env], text(fill: white, weight: "bold")[Shell Startup & Environment Variable Scope], text(fill: white, weight: "bold")[Command],
  [`~/.bashrc`], [Per-user interactive non-login shell aliases, prompt & functions], [#cmd("source ~/.bashrc")],
  [`/etc/environment`], [System-wide static environment variables for all users], [#cmd("printenv PATH")],
  [`~/.bash_profile`], [Runs once at login shell (SSH/TTY) — sets login `PATH`], [#cmd("export EDITOR=vim")],
  [`alias` / `unalias`], [Create or remove temporary command shortcuts in terminal], [#cmd("alias gs='git status'")],
)

#did-you-know[
  *Fedora* serves as the free upstream innovation lab for *Red Hat Enterprise Linux (RHEL)* — new features tested in Fedora eventually power enterprise RHEL servers! Meanwhile, *Ubuntu* and *Kali Linux* both share the *Debian* family (`apt` / `.deb`).
]

#pagebreak()

// =============================================================================
// PAGE 08: AUTHOR MENTORSHIP HUB, MOTTO, QR CODES, INTERVIEW Q&A & WHATSAPP HELP DESK
// =============================================================================

#align(center)[
  #text(size: 10.2pt, weight: "black", fill: rtech-navy)[RTECHLAB Author Mentorship Hub, Direct Socials & DevOps Interview Vault]
  #v(1pt)
  #text(size: 6.7pt, fill: rtech-muted)[Official Author Profile · RTechLab Motto · Scannable QR Hubs · Top 5 MNC Interview Q&A · Emergency SOP]
]

#section-banner(num: "POINT 01", title: "Author Profile & RTechLab Motto: Rahul Patel — Founder & Systems Architect", color: rtech-navy)

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
        #text(size: 9.2pt, weight: "black", fill: rtech-navy)[Rahul Patel] #h(4pt) #hl-b[10+ Years IT Experience] #h(3pt) #hl-g[3,000+ Students Trained]\
        #v(1pt)
        #text(size: 6.8pt, weight: "bold", fill: rtech-blue)[Founder & Lead Systems Architect · RTechLab Publications] · #text(size: 6.8pt, weight: "bold", fill: rgb("#047857"))[Director · IANT Computer Education, Palanpur]\
        #v(1.5pt)
        #text(size: 6.4pt, fill: rtech-navy)[
          *RTechLab Motto:* _"Technology Made Practical — Empowering every student from classroom to corporate with crystal-clear, hands-on engineering guides."_ Rahul created the ₹22 Desk Reference series so every learner can keep industry-grade Linux, Networking & Cloud mastery right on their desk.
        ]
      ]
    )
  ]
)

#section-banner(num: "POINT 02", title: "Author Portfolio, YouTube, Instagram & WhatsApp Community Hub", color: rtech-blue)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 5pt,
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0F9FF"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 54pt)[#image("02_BRAND_ASSETS/qr_rahul_portfolio.png", height: 54pt)]
        #v(1.5pt)
        #text(size: 6.8pt, weight: "black", fill: rtech-blue)[Author Portfolio]\
        #text(size: 5.6pt, fill: rtech-muted)[#link("https://rahulprofile28.netlify.app/")[rahulprofile28.netlify.app ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FFF1F2"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 54pt)[#image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", height: 54pt)]
        #v(1.5pt)
        #text(size: 6.8pt, weight: "black", fill: rgb("#E11D48"))[YouTube Channel]\
        #text(size: 5.6pt, fill: rtech-muted)[#link("https://www.youtube.com/@RTechLabOfficial")[#text(weight: "bold")[\@RTechLabOfficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#FDF2F8"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 54pt)[#image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", height: 54pt)]
        #v(1.5pt)
        #text(size: 6.8pt, weight: "black", fill: rgb("#DB2777"))[Instagram Hub]\
        #text(size: 5.6pt, fill: rtech-muted)[#link("https://www.instagram.com/rtechlabofficial/")[#text(weight: "bold")[\@rtechlabofficial] ↗]]
      ]
    ]
  ],
  [
    #block(width: 100%, stroke: 0.65pt + dark-border, fill: rgb("#F0FDF4"), radius: 4pt, inset: 4.5pt)[
      #align(center)[
        #box(height: 54pt)[#image("02_BRAND_ASSETS/qr_whatsapp_community.png", height: 54pt)]
        #v(1.5pt)
        #text(size: 6.8pt, weight: "black", fill: rgb("#166534"))[WhatsApp Channel]\
        #text(size: 5.6pt, fill: rtech-muted)[#link("https://whatsapp.com/channel/0029VbETSEpBvvsaksASaJ0i")[Free Community Access ↗]]
      ]
    ]
  ],
)

#section-banner(num: "POINT 03", title: "Top 5 SysAdmin / DevOps Interview Q&A & 5-Step Emergency SOP", color: rtech-emerald)

#table(
  columns: (auto, 1fr),
  inset: (x: 4.5pt, y: 3.5pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#0F172A") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  text(fill: white, weight: "bold")[\#], text(fill: white, weight: "bold")[Top MNC / DevOps Interview Question & Model Answer],
  [*Q1*], [*Hard Link vs Soft Link?* Soft link (`ln -s`) points to the filename (breaks if deleted); Hard link shares the exact *inode* (data stays intact).],
  [*Q2*], [*What is an Inode & Zombie Process?* Inode stores file metadata (permissions, owner, blocks). A Zombie (`Z`) is a finished child waiting for parent `wait()`; kill parent PID.],
  [*Q3*], [*`su` vs `sudo`?* `su` switches to another user's shell; `sudo` runs a single command with elevated root privilege and full `/var/log/auth.log` audit trail.],
  [*Q4*], [*How to debug Disk 100% Full?* Run `df -h`, locate large directories with `du -sh /var/* | sort -hr`, and safely clear logs via `truncate -s 0 app.log`.],
  [*Q5*], [*How to find & fix a Port Conflict?* Run `sudo ss -tulpn | grep :8080` to find the owning PID, then gracefully stop it with `sudo kill -15 <PID>`.],
  [*Q6*], [*`grep` vs `find`?* `find` searches for *files* by name, size, or date on disk; `grep` searches for *text patterns inside* files.],
  [*Q7*], [*What is Swap Memory?* Dedicated disk space (`free -h` / `swapon -s`) used as emergency overflow RAM when physical memory fills up.],
  [*Q8*], [*`systemctl start` vs `enable`?* `start` runs the service right now (until reboot); `enable` creates a boot symlink so it auto-starts on every reboot.],
  [*Q9*], [*Why can Disk say "No space left" at 70%?* *Inode exhaustion* (`df -i` at 100%) caused by millions of tiny files/sessions blocking new file creation.],
  [*Q10*], [*Explain Linux DNS lookup order?* First `/etc/nsswitch.conf` checks `/etc/hosts` locally, then queries DNS servers listed in `/etc/resolv.conf`.],
)

#v(2pt)
#table(
  columns: (auto, 1fr, auto),
  inset: (x: 4.5pt, y: 3.2pt),
  stroke: 0.5pt + rgb("#CBD5E1"),
  fill: (_, row) => if row == 0 { rgb("#DC2626") } else if calc.even(row) { rgb("#FEF2F2") } else { white },
  text(fill: white, weight: "bold")[Incident], text(fill: white, weight: "bold")[Root-Cause Diagnostic Command], text(fill: white, weight: "bold")[Fast Fix],
  [Disk 100% Full], [#cmd("df -h") then #cmd("du -sh /var/log/* | sort -hr")], [#cmd("truncate -s 0 app.log")],
  [Port Conflict], [#cmd("sudo ss -tulpn | grep :8080")], [#cmd("sudo kill -15 <PID>")],
  [Permission Error], [#cmd("ls -ld path/to/file") & #cmd("id")], [#cmd("sudo chown user:group file")],
  [SSH Refused], [#cmd("systemctl status ssh") + #cmd("ufw status")], [Start SSH & allow `22/tcp`],
)

#did-you-know[
  *Kali Linux* ships with 600+ penetration testing tools (`nmap`, `aircrack-ng`, `sqlmap`, `nikto`), but running them against networks you don't own is illegal. Always practice in authorized labs like *TryHackMe*, *HackTheBox*, or your own *VirtualBox/VMware* VMs!
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
        🚀 Upgrade your IT Career with RTechLab's Complete Master Books, Labs & Career Accelerator Suites at #link("https://rtechlab.com/notes")[*rtechlab.com/notes*]
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
            [#text(size: 7.2pt, weight: "bold", fill: rgb("#A7F3D0"))[RTechLab WhatsApp Help Desk: ] #link("https://wa.me/917646892094")[#text(size: 7.6pt, weight: "black", fill: white)[+91 76468 92094]] #text(size: 6.5pt, fill: rgb("#6EE7B7"))[ (Chat-Only Support)]]
          )
        ]
      ],
      [
        #box(fill: rgb("#0284C7"), radius: 3pt, inset: (x: 7pt, y: 4pt))[
          #text(size: 7.0pt, weight: "black", fill: white)[rtechlab.com/notes · 2027 EDITION]
        ]
      ]
    )
  ]
)
