#set document(
  title: "RTechLab — Git & GitHub Mastery Quick Desk Cheat Sheet (Hindi)",
  author: "Rahul Patel — RTechLab Vocational Learning Systems",
)

#set page(
  paper: "a4",
  margin: (top: 9.5mm, bottom: 8mm, left: 8.5mm, right: 8.5mm),
  header-ascent: 2mm,
  footer-descent: 2mm,
  header: context {
    let p = counter(page).get().first()
    if p > 1 [
      #set text(size: 7.2pt, fill: rgb("#475569"), font: ("Nirmala UI", "Segoe UI"))
      #grid(
        columns: (1fr, auto),
        align: (left + bottom, right + bottom),
        [
          #box(
            fill: rgb("#0f172a"),
            inset: (x: 5pt, y: 2pt),
            radius: 2pt,
            text(fill: rgb("#ffffff"), weight: "bold", size: 6.8pt)[RTechLab]
          )
          #h(4pt)
          #text(weight: "bold", fill: rgb("#0f172a"))[Git & GitHub Mastery]
          #text(fill: rgb("#64748b"))[ · 10-पेज त्वरित डेस्क गाइड (हिंदी संस्करण)]
        ],
        [
          #text(fill: rgb("#ea580c"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 डेस्क एडिशन]
        ]
      )
      #v(-3pt)
      #line(length: 100%, stroke: 0.6pt + rgb("#cbd5e1"))
    ]
  },
  footer: context {
    let p = counter(page).get().first()
    if p > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
      #v(-2pt)
      #set text(size: 7pt, fill: rgb("#64748b"), font: ("Nirmala UI", "Segoe UI"))
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [© RTechLab Original Edition · कोड · कमिट · शिप · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[पेज #p / 10]]]
      )
    ]
  }
)

#set text(font: ("Nirmala UI", "Segoe UI"), size: 9pt, fill: rgb("#1e293b"))
#set par(leading: 1.0em, justify: false)

// --- HELPER COMPONENTS ---
#let section-banner(num, title, subtitle, bg: rgb("#0f172a"), accent: rgb("#ea580c")) = {
  box(
    width: 100%,
    fill: bg,
    radius: 3.5pt,
    inset: (x: 9pt, y: 6pt),
    stroke: (left: 4.5pt + accent),
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      gutter: 7pt,
      box(fill: accent, radius: 2.5pt, inset: (x: 6pt, y: 3pt))[
        #text(fill: white, weight: "bold", size: 9pt)[#num]
      ],
      text(fill: white, weight: "bold", size: 10.4pt)[#title],
      text(fill: rgb("#fed7aa"), size: 7.8pt, weight: "semibold")[#subtitle]
    )
  )
  v(11pt)
}

#let card(title, body, border: rgb("#cbd5e1"), head-bg: rgb("#f8fafc"), title-color: rgb("#0f172a"), pad: 14pt) = {
  box(
    width: 100%,
    fill: white,
    stroke: 0.65pt + border,
    radius: 4pt,
    [
      #box(
        width: 100%,
        fill: head-bg,
        inset: (x: 8pt, y: 4.8pt),
        stroke: (bottom: 0.5pt + border),
        radius: (top: 4pt),
        text(weight: "bold", size: 8.8pt, fill: title-color)[#title]
      )
      #box(width: 100%, inset: pad)[#body]
    ]
  )
}

#let cmd(code) = {
  box(
    fill: rgb("#0f172a"),
    inset: (x: 4.5pt, y: 2pt),
    radius: 2pt,
    text(font: "Consolas", size: 7.8pt, fill: rgb("#fdba74"))[#code]
  )
}

#let hl-y(t) = box(fill: rgb("#fef08a"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#713f12"))[#t])
#let hl-g(t) = box(fill: rgb("#dcfce7"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#14532d"))[#t])
#let hl-b(t) = box(fill: rgb("#dbeafe"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#1e3a8a"))[#t])
#let hl-o(t) = box(fill: rgb("#ffedd5"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#9a3412"))[#t])

#let did-you-know(fact) = {
  box(
    width: 100%,
    fill: rgb("#fffbeb"),
    stroke: (left: 4pt + rgb("#f59e0b"), rest: 0.6pt + rgb("#fde68a")),
    radius: 3.5pt,
    inset: (x: 8.5pt, y: 6.5pt),
    text(size: 8.3pt, fill: rgb("#78350f"))[
      *💡 क्या आप जानते हैं?* #fact
    ]
  )
}

#let tbl(cols, headers, rows, pad-y: 6.5pt, fsize: 8.4pt) = {
  set text(size: fsize)
  table(
    columns: cols,
    inset: (x: 5pt, y: pad-y),
    stroke: 0.45pt + rgb("#cbd5e1"),
    fill: (_, y) => if y == 0 { rgb("#0f172a") } else if calc.odd(y) { rgb("#ffffff") } else { rgb("#f8fafc") },
    ..headers.map(h => text(fill: white, weight: "bold", size: fsize)[#h]),
    ..rows.flatten()
  )
}

// =========================================================================
// PAGE 1: FULL-BLEED CUSTOM COVER ARTWORK
// =========================================================================
#page(margin: 0mm, header: none, footer: none)[
  #place(top + left)[
    #image("02_BRAND_ASSETS/git_cover.jpg", width: 210mm, height: 297mm, fit: "cover")
  ]
]

#pagebreak()

// =========================================================================
// PAGE 2: GIT ARCHITECTURE, SETUP, SSH KEYS & .GITIGNORE
// =========================================================================
#section-banner("01", "GIT आर्किटेक्चर, सेटअप, SSH KEYS और .GITIGNORE", "डिस्ट्रिब्यूटेड VCS · 4-एरिया वर्कफ़्लो, ग्लोबल कॉन्फ़िग और सुरक्षा")

#card(
  "Git 4-एरिया आर्किटेक्चर विजुअल (Working Dir → Staging → Local Repo → GitHub)",
  [
    #align(center)[#image("02_BRAND_ASSETS/git_workflow_visual.png", width: 96%)]
  ],
  head-bg: rgb("#fff7ed"),
  title-color: rgb("#9a3412")
)

#v(34pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Git बनाम GitHub और पहला सेटअप",
    [
      #set text(size: 8.7pt)
      - *Git:* लोकल डिस्ट्रिब्यूटेड वर्जन कंट्रोल सिस्टम (ऑफलाइन हर बदलाव ट्रैक करता है)।
      - *GitHub:* Git रेपो होस्ट करने का क्लाउड प्लेटफॉर्म + PRs, Issues, Actions CI/CD व Copilot।
      - *पहला पहचान सेटअप:*
        - #cmd("git config --global user.name \"Rahul Patel\"")
        - #cmd("git config --global user.email \"you@email.com\"")
        - #cmd("git config --global init.defaultBranch main")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "SSH Key लॉगिन और `.gitignore` नियम",
    [
      #set text(size: 8.7pt)
      - *बिना पासवर्ड GitHub Push (SSH):*
        1. #cmd("ssh-keygen -t ed25519 -C \"you@email.com\"")
        2. `~/.ssh/id_ed25519.pub` कॉपी कर GitHub *Settings → SSH Keys* में जोड़ें।
        3. जाँचें: #cmd("ssh -T git@github.com")
      - *`.gitignore` (कभी सीक्रेट या `node_modules` पुश न करें!):*
        `.env`, `node_modules/`, `.venv/`, `__pycache__/`, `*.log`, `dist/` जोड़ें!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(34pt)
#card(
  "उपयोगी कॉन्फ़िग और रिमोट निरीक्षण शॉर्टकट्स",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.7pt)
        - सभी सक्रिय सेटिंग्स देखें: #cmd("git config --list --show-origin")
        - VS Code को डिफ़ॉल्ट एडिटर बनाएँ: #cmd("git config --global core.editor \"code --wait\"")
      ],
      [
        #set text(size: 8.7pt)
        - Win/Linux लाइन एंडिंग फिक्स: #cmd("git config --global core.autocrlf true")
        - ब्रांच का नाम `main` करें: #cmd("git branch -M main")
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(34pt)
#did-you-know[Git को *2005 में Linus Torvalds* (Linux के निर्माता) ने मात्र *10 दिनों* में बनाया था, ताकि हजारों Linux डेवलपर्स बिना टकराव के एक साथ काम कर सकें!]

#pagebreak()

// =========================================================================
// PAGE 3: DAILY ESSENTIAL GIT COMMANDS & CONVENTIONAL COMMITS
// =========================================================================
#section-banner("02", "दैनिक जरूरी GIT कमांड्स और कमिट नियम", "init, clone, status, add, commit, diff, log और Conventional Commits")

#card(
  "रोज़ाना उपयोग होने वाले 20 मुख्य Git कमांड्स",
  tbl(
    (auto, 1fr),
    ("कमांड", "काम और प्रो टिप"),
    (
      ([#cmd("git init")], [नया लोकल Git रिपोज़िटरी बनाएँ (छिपा `.git/` फोल्डर बनता है)।]),
      ([#cmd("git clone <url>")], [रिमोट रेपो डाउनलोड करें (`--depth 1` से तेज़ डाउनलोड)।]),
      ([#cmd("git status -s")], [बदली हुई (`M`), स्टेज्ड (`A`) और अनट्रैक्ड (`??`) फाइलें देखें।]),
      ([#cmd("git add <file>") / #cmd("git add .")], [फाइल को Staging Area (Index) में जोड़ें।]),
      ([#cmd("git commit -m \"msg\"")], [स्टेज किए गए बदलावों को लोकल `.git` इतिहास में सेव करें।]),
      ([#cmd("git commit -am \"msg\"")], [ट्रैक्ड फाइलों को 1 स्टेप में स्टेज + कमिट करें।]),
      ([#cmd("git diff") / #cmd("--staged")], [कमिट करने से पहले लाइन-दर-लाइन बदलाव देखें।]),
      ([#cmd("git log --oneline --graph")], [ब्रांच ट्री के साथ 1-लाइन में साफ कमिट इतिहास देखें।]),
      ([#cmd("git show <commit-id>")], [किसी पुराने कमिट का पूरा कोड डिफ और लेखक देखें।]),
      ([#cmd("git remote -v")], [जुड़े हुए रिमोट URLs (`origin`, `upstream`) देखें।]),
      ([#cmd("git push -u origin main")], [लोकल कमिट्स को GitHub पर अपलोड करें।]),
      ([#cmd("git pull --rebase")], [रिमोट से नए बदलाव लाकर अपने कमिट्स उसके ऊपर साफ लगाएँ।]),
    ),
    pad-y: 6pt,
    fsize: 8.3pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(56pt)

#card(
  "Conventional Commits मानक (प्रोफेशनल कमिट मैसेज लिखें)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.7pt)
        - `feat: add Razorpay UPI webhook` (नया फीचर)
        - `fix: resolve null pointer in auth` (बग फिक्स)
        - `docs: update API setup in README` (डॉक्यूमेंटेशन)
      ],
      [
        #set text(size: 8.7pt)
        - `refactor: extract shared validation helper`
        - `test: add pytest cases for GST calc`
        - `chore: upgrade vite to 8.3.7`
      ]
    )
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(56pt)
#did-you-know[गलती से `.env` कमिट हो गया? *नए* कमिट में फाइल डिलीट करने से वह `.git` इतिहास से नहीं हटती — तुरंत API Key बदलें और `git filter-repo` से इतिहास साफ करें!]

#pagebreak()

// =========================================================================
// PAGE 4: BRANCHING, MERGING, REBASING & CONFLICT RESOLUTION
// =========================================================================
#section-banner("03", "ब्रांचिंग, मर्जिंग, रीबेसिंग और कॉन्फ्लिक्ट्स", "समानांतर विकास · Fast-Forward बनाम 3-Way, Rebase और कॉन्फ्लिक्ट फिक्स")

#card(
  "ब्रांचिंग और मर्ज वर्कफ़्लो विजुअल",
  [
    #align(center)[#image("02_BRAND_ASSETS/git_branching_visual.png", width: 96%)]
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(28pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "ब्रांच और मर्ज कमांड्स",
    [
      #set text(size: 8.6pt)
      - *ब्रांच सूची:* #cmd("git branch -a")
      - *नई ब्रांच बनाएँ व जाएँ:* #cmd("git switch -c feature/login")
      - *पुरानी पर जाएँ:* #cmd("git switch main")
      - *मर्ज करें:* #cmd("git merge feature/login")
        - *Fast-Forward:* `main` पॉइंटर सीधे आगे बढ़ता है।
        - *3-Way Merge:* दोनों इतिहास मिलाकर नया मर्ज कमिट बनता है।
      - *मर्ज हो चुकी ब्रांच हटाएँ:* #cmd("git branch -d feature/login")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Rebase बनाम Merge और Cherry-Pick",
    [
      #set text(size: 8.6pt)
      - *Rebase (`git rebase main`):* आपके फीचर कमिट्स को नवीनतम `main` के ऊपर रखता है → *सीधा, साफ इतिहास!*
      - *सुनहरा नियम:* कभी भी शेयर की हुई पब्लिक ब्रांच (`main`) पर rebase न करें!
      - *Squash Merge:* PR मर्ज पर 20 छोटे कमिट्स को 1 साफ कमिट में जोड़ता है।
      - *Cherry-Pick (`git cherry-pick <sha>`):* पूरी ब्रांच मर्ज किए बिना किसी एक जरूरी बग-फिक्स कमिट को कॉपी करें।
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(28pt)

#card(
  "Merge Conflict को 4 आसान स्टेप्स में कैसे सुलझाएँ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        1. कॉन्फ्लिक्ट वाली फाइल खोलें: `<<<<<<< HEAD` (आपका), `=======`, `>>>>>>> branch` (दूसरा)।
        2. सही कोड रखें और *सभी `<<<`, `===`, `>>>` चिह्न हटा दें*।
      ],
      [
        #set text(size: 8.6pt)
        3. सही की गई फाइल स्टेज करें: #cmd("git add <file>")
        4. मर्ज पूरा करें: #cmd("git commit") (या रद्द करें: #cmd("git merge --abort"))।
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(28pt)
#did-you-know[Git ब्रांच आपके प्रोजेक्ट की भारी कॉपी नहीं होती — यह मात्र *41 बाइट की एक छोटी फाइल* होती है जिसमें कमिट का 40-अक्षरों का हैश होता है! 100 ब्रांच बनाना सेकंड का काम है।]

#pagebreak()

// =========================================================================
// PAGE 5: UNDOING MISTAKES, STASH & TIME TRAVEL
// =========================================================================
#section-banner("04", "गलतियाँ सुधारना, STASH और टाइम ट्रैवल", "restore, reset (--soft/--mixed/--hard), revert, stash और git reflog")

#card(
  "Git Undo मैट्रिक्स: सही कमांड चुनें (कोड कभी न खोएँ!)",
  tbl(
    (auto, auto, 1fr, auto),
    ("स्थिति", "कमांड", "फाइलों और इतिहास पर असर", "पुश के बाद सुरक्षित?"),
    (
      ([*अनस्टेज्ड बदलाव हटाएँ*], [#cmd("git restore <file>")], [फाइल को पिछले कमिट जैसा कर देता है (बदलाव हटेंगे!)।], [केवल लोकल]),
      ([*फाइल अनस्टेज करें*], [#cmd("git restore --staged <f>")], [Staging से वापस Working Dir में लाता है (कोड सुरक्षित)।], [केवल लोकल]),
      ([*आखिरी कमिट सुधारें*], [#cmd("git commit --amend")], [पिछले कमिट का मैसेज या फाइलें अपडेट करता है।], [केवल लोकल]),
      ([*कमिट हटाएँ, स्टेज रखें*], [#cmd("git reset --soft HEAD~1")], [`HEAD` 1 कदम पीछे; बदलाव स्टेज्ड रहते हैं।], [केवल लोकल]),
      ([*कमिट हटाएँ, फाइल रखें*], [#cmd("git reset --mixed HEAD~1")], [डिफ़ॉल्ट रीसेट; बदलाव अनस्टेज्ड रहते हैं।], [केवल लोकल]),
      ([*कमिट + बदलाव मिटाएँ*], [#cmd("git reset --hard HEAD~1")], [कमिट और बिना सेव बदलाव हमेशा के लिए हटते हैं!], [*खतरनाक!*]),
      ([*`main` पर सुरक्षित Undo*], [#cmd("git revert <sha>")], [पुराने कमिट को उलटने वाला *नया* कमिट बनाता है।], [*हाँ (सुरक्षित!)*]),
    ),
    pad-y: 5.8pt,
    fsize: 8.1pt
  ),
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(36pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "`git stash` (बिना कमिट किए काम अस्थायी सेव करें)",
    [
      #set text(size: 8.6pt)
      अधूरे काम के साथ तुरंत दूसरी ब्रांच पर जाना हो तो:
      - बदलाव सेव करें: #cmd("git stash -u")
      - सेव सूची देखें: #cmd("git stash list")
      - वापस लाकर डिलीट करें: #cmd("git stash pop")
      - बिना डिलीट वापस लाएँ: #cmd("git stash apply stash@{0}")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "`git reflog` (खोया हुआ कोड वापस पाने का जादू)",
    [
      #set text(size: 8.6pt)
      गलती से `git reset --hard` चल गया या ब्रांच डिलीट हो गई?
      1. #cmd("git reflog") चलाएँ — `HEAD` की हर हलचल (30–90 दिन तक) यहाँ दिखती है!
      2. खोया कमिट हैश खोजें (जैसे `a1b2c3d`)।
      3. तुरंत रिकवर करें: #cmd("git switch -c rescued a1b2c3d")
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(36pt)
#card(
  "सुरक्षित Force-Push और अनट्रैक्ड फाइलें साफ करना",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *कभी `git push --force` न चलाएँ!* हमेशा #cmd("git push --force-with-lease") उपयोग करें ताकि साथी का नया कोड न मिटे!
      ],
      [
        #set text(size: 8.6pt)
        - *कचरा साफ करें:* पहले जाँचें #cmd("git clean -nd"), फिर अनट्रैक्ड फाइलें हटाएँ: #cmd("git clean -fd")।
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(36pt)
#did-you-know[डरावने `git reset --hard` के बाद भी आपके कमिट किए हुए कोड *लगभग 30 दिनों तक सुरक्षित* रहते हैं — `git reflog` हर उस कमिट को याद रखता है जहाँ `HEAD` गया था!]

#pagebreak()

// =========================================================================
// PAGE 6: GITHUB MASTERY, OPEN-SOURCE PRS & GITHUB CLI
// =========================================================================
#section-banner("05", "GITHUB मास्टरी, ओपन-सोर्स PRS और GITHUB CLI", "Fork → Clone → PR वर्कफ़्लो, gh CLI, Pages और Markdown बैज")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "5-स्टेप ओपन-सोर्स योगदान (Fork & PR वर्कफ़्लो)",
    [
      #set text(size: 8.6pt)
      1. GitHub पर प्रोजेक्ट को अपने अकाउंट में *Fork* करें।
      2. अपना फोर्क *Clone* करें: #cmd("git clone git@github.com:YOU/repo.git")
      3. मूल रेपो को `upstream` जोड़ें: #cmd("git remote add upstream <orig-url>")
      4. फीचर ब्रांच (`git switch -c fix/typo`) बनाकर कमिट व `origin` पर पुश करें।
      5. GitHub पर *"Compare & Pull Request"* दबाएँ, विवरण लिखें और रिव्यू पर काम करें!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "GitHub CLI (`gh`) — टर्मिनल से GitHub कंट्रोल करें",
    [
      #set text(size: 8.6pt)
      `cli.github.com` से इंस्टॉल कर लॉगिन करें (`gh auth login`):
      - 1 कमांड में रेपो बनाएँ व पुश करें: #cmd("gh repo create my-app --public --push")
      - Pull Request खोलें: #cmd("gh pr create --fill")
      - PR व CI स्थिति देखें: #cmd("gh pr list") · #cmd("gh pr checkout 42")
      - Issues देखें: #cmd("gh issue list") · #cmd("gh run watch")
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(48pt)

#card(
  "GitHub प्रोफाइल पावर-अप्स (रिक्रूटर्स को प्रभावित करें)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *Profile README:* अपने यूजरनेम का रेपो (`github.com/Rahul/Rahul`) बनाकर `README.md` में बायो व स्किल्स दिखाएँ!
        - *टॉप 6 रेपो पिन करें:* लाइव डेमो लिंक, स्क्रीनशॉट और `shields.io` बैज लगाएँ।
      ],
      [
        #set text(size: 8.6pt)
        - *GitHub Pages (मुफ्त होस्टिंग):* `username.github.io` पर HTML/React/Vite पोर्टफोलियो मुफ्त होस्ट करें।
        - *Branch Protection:* `main` पर मर्ज होने से पहले 1 PR अप्रूवल और CI टेस्ट अनिवार्य करें!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(48pt)
#card(
  "जरूरी `README.md` Markdown चीट शीट",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - `# H1`, `## H2`, `*Bold*`, `*Italic*`, `` `inline code` ``
        - `[Link Text](https://url)` · `![Alt](screenshot.png)`
      ],
      [
        #set text(size: 8.6pt)
        - कोड ब्लॉक: ```` ```bash ... ``` ````
        - टास्क लिस्ट: `- [x] Done` · `- [ ] Todo` · अलर्ट: `> [!NOTE]`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(48pt)
#did-you-know[किसी भी GitHub रिपोज़िटरी पेज पर केवल `.` (डॉट) दबाने से ब्राउज़र में पूरा *VS Code एडिटर* (`github.dev`) तुरंत खुल जाता है — बिना कुछ इंस्टॉल किए!]

#pagebreak()

// =========================================================================
// PAGE 7: GITHUB ACTIONS (CI/CD) & TEAM WORKFLOWS
// =========================================================================
#section-banner("06", "GITHUB ACTIONS (CI/CD) और टीम वर्कफ़्लो", "ऑटोमेटेड टेस्टिंग, डिप्लॉयमेंट, Git Flow बनाम GitHub Flow और Tags")

#grid(
  columns: (1.05fr, 0.95fr),
  gutter: 7pt,
  card(
    "GitHub Actions CI/CD वर्कफ़्लो (`.github/workflows/ci.yml`)",
    [
      #set text(size: 8.2pt)
      ```yaml
      name: CI Pipeline
      on: [push, pull_request]
      jobs:
        test:
          runs-on: ubuntu-latest
          steps:
            - uses: actions/checkout@v4
            - uses: actions/setup-node@v4
              with: { node-version: 20 }
            - run: npm ci && npm test && npm run build
      ```
      - *Secrets:* API Keys को *Settings → Secrets* में रखें और `${{ secrets.API_KEY }}` से पढ़ें।
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "टीम ब्रांचिंग रणनीतियों की तुलना",
    tbl(
      (auto, 1fr),
      ("रणनीति", "कैसे काम करती है और किसके लिए बेस्ट"),
      (
        ([*GitHub Flow*], [`main` (हमेशा लाइव-रेडी) + छोटी फीचर ब्रांच + PRs। *SaaS और वेब ऐप्स के लिए बेस्ट।*]),
        ([*Git Flow*], [`main` + `develop` + `feature/*` + `release/*` + `hotfix/*`। *शेड्यूल्ड रिलीज़ के लिए बेस्ट।*]),
        ([*Trunk-Based*], [फीचर फ्लैग्स के साथ सीधे `main` (या 1-दिन ब्रांच) पर छोटे कमिट्स। *सीनियर CI/CD टीमों के लिए।*]),
      ),
      pad-y: 6pt,
      fsize: 8.1pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(46pt)

#card(
  "Semantic Versioning (`v1.2.3`), Git Tags और Dependabot",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *SemVer (`MAJOR.MINOR.PATCH`):* `2.1.4` → `MAJOR` (बड़ा बदलाव), `MINOR` (नया फीचर), `PATCH` (बग फिक्स)।
        - *Tag बनाएँ व पुश करें:* #cmd("git tag -a v1.0.0 -m \"Launch\"") → #cmd("git push origin v1.0.0")
      ],
      [
        #set text(size: 8.6pt)
        - *GitHub Releases:* किसी भी टैग पर `.zip`/`.exe` फाइलें व चेंजलॉग अपलोड करें।
        - *Dependabot:* `npm`/`pip` पैकेज में सुरक्षा खामी मिलने पर स्वतः अपडेट PR खोलता है!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(46pt)
#card(
  "CI/CD ऑटो-डिप्लॉय ट्रिगर्स और PR चेक",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *शेड्यूल्ड Cron जॉब्स:* `schedule: - cron: "0 2 * * *"` से रोज़ रात को मुफ्त टेस्ट या स्क्रैपर चलाएँ।
      ],
      [
        #set text(size: 8.6pt)
        - *ऑटो-डिप्लॉय:* GitHub रेपो को *Vercel, Netlify या Render* से जोड़ें — हर `git push` पर 30 सेकंड में लाइव!
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(46pt)
#did-you-know[GitHub Actions प्राइवेट रेपो पर हर महीने *2,000 मुफ्त CI/CD मिनट* और पब्लिक ओपन-सोर्स रेपो पर *अनलिमिटेड मुफ्त मिनट* देता है!]

#pagebreak()

// =========================================================================
// PAGE 8: AI + GIT/GITHUB, BISECT, HOOKS & PRO TOOLS
// =========================================================================
#section-banner("07", "AI + GIT/GITHUB, GIT BISECT, HOOKS और प्रो टूल्स", "GitHub Copilot, AI कमिट/PR वर्कफ़्लो, git bisect और Pre-Commit Hooks")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "AI + Git और GitHub (2026–27 डेवलपर सुपरपावर)",
    [
      #set text(size: 8.6pt)
      - *GitHub Copilot CLI (`gh copilot`):* हिंदी/अंग्रेजी में पूछें: #cmd("gh copilot suggest \"undo last commit keep files\"") या `gh copilot explain`!
      - *AI PR रिव्यू व सारांश:* Copilot / CodeRabbit अपने आप PR डिफ पढ़कर बग पकड़ते हैं और सारांश लिखते हैं।
      - *AI कमिट मैसेज:* VS Code / Cursor *"Sparkle ✨"* बटन 1 क्लिक में `git diff` पढ़कर सही कमिट मैसेज बनाता है!
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "`git bisect` (बाइनरी सर्च से सेकंडों में बग कमिट ढूँढें)",
    [
      #set text(size: 8.6pt)
      पिछले 1,000 कमिट्स में कहीं बग आया है? बाइनरी सर्च केवल *10 स्टेप्स* में ढूँढ देगा!
      1. #cmd("git bisect start")
      2. #cmd("git bisect bad") (मौजूदा कमिट खराब है)
      3. #cmd("git bisect good v1.0.0") (यह पुराना टैग सही था)
      4. Git बीच में ले जाएगा — टेस्ट करें, दोषी कमिट मिलते ही: #cmd("git bisect reset")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  )
)

#v(46pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Git Hooks (`pre-commit` / Husky) — कमिट से पहले ऑटो-चेक",
    [
      #set text(size: 8.6pt)
      - `.git/hooks/` की स्क्रिप्ट्स `git commit` या `git push` से पहले स्वतः चलती हैं।
      - *Husky* (JS) या *`pre-commit`* (Python) से `eslint`, `ruff`, `prettier` और सीक्रेट स्कैनर (`gitleaks`) चलाएँ ताकि टूटा कोड कमिट ही न हो!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "`git worktree` और Git LFS (बड़ी फाइलें)",
    [
      #set text(size: 8.6pt)
      - *`git worktree add ../hotfix main`:* बिना `stash` किए 2 अलग फोल्डर में *एक साथ* 2 ब्रांच पर काम करें!
      - *Git LFS:* 100 MB+ `.mp4`/`.pt` फाइलों को सामान्य Git में न डालें — #cmd("git lfs track \"*.pt\"") उपयोग करें।
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(46pt)
#card(
  "प्रो Git Aliases (रोज़ाना 100+ कीस्ट्रोक बचाएँ)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - #cmd("git config --global alias.st \"status -s\"")
        - #cmd("git config --global alias.co \"switch\"")
      ],
      [
        #set text(size: 8.6pt)
        - #cmd("git config --global alias.cm \"commit -m\"")
        - #cmd("git config --global alias.lg \"log --oneline --graph -15\"")
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(46pt)
#did-you-know[यदि आपको 1,024 कमिट्स में से बग वाला कमिट खोजना हो, तो `git bisect` को अधिकतम केवल $log_2(1024) = 10$ जाँच करनी पड़ती हैं!]

#pagebreak()

// =========================================================================
// PAGE 9: TOP LEARNING SITES, GITHUB REPOS & OPEN-SOURCE CAREERS
// =========================================================================
#section-banner("08", "टॉप लर्निंग साइट्स, GITHUB REPOS और ओपन-सोर्स करियर", "इंटरैक्टिव Git प्रैक्टिस, First Contributions, GSoC और रिज्यूमे ब्लूप्रिंट")

#card(
  "Git व ओपन-सोर्स मास्टर करने की बेस्ट मुफ्त वेबसाइट्स व Repos (क्लिकेबल)",
  tbl(
    (auto, 1fr, auto),
    ("साइट / रेपो", "क्या सीखेंगे और अभ्यास करेंगे (100% मुफ्त)", "डायरेक्ट लिंक"),
    (
      ([*Learn Git Branching*], [branch, merge व rebase सीखने का इंटरैक्टिव गेम], [#link("https://learngitbranching.js.org")[`learngitbranching.js.org`]]),
      ([*GitHub Skills*], [PRs, Actions और Copilot पर आधिकारिक इंटरैक्टिव कोर्स], [#link("https://skills.github.com")[`skills.github.com`]]),
      ([*First Contributions*], [5 मिनट में अपना पहला ओपन-सोर्स PR करने की गाइड], [#link("https://github.com/firstcontributions/first-contributions")[`firstcontributions/first-...`]]),
      ([*Pro Git Book*], [Scott Chacon व Ben Straub की आधिकारिक मुफ्त किताब], [#link("https://git-scm.com/book")[`git-scm.com/book`]]),
      ([*Oh My Git!*], [Git कमिट्स को विजुअल रूप से समझाने वाला ओपन-सोर्स गेम], [#link("https://ohmygit.org")[`ohmygit.org`]]),
      ([*GitHub Explore*], [रोज़ ट्रेंड होने वाले AI, Python व Web प्रोजेक्ट्स खोजें], [#link("https://github.com/explore")[`github.com/explore`]]),
      ([*Shields.io*], [अपने README.md के लिए प्रोफेशनल बैज बनाएँ], [#link("https://shields.io")[`shields.io`]]),
    ),
    pad-y: 3.4pt,
    fsize: 7.5pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(6.5pt)

#card(
  "ओपन-सोर्स और करियर गाइड (GSoC, Hacktoberfest और इंटर्नशिप)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 7.7pt)
        - *Google Summer of Code (GSoC):* पेड रिमोट इंटर्नशिप (₹1.2L–₹2.5L+ स्टाइपेंड); 3 महीने पहले से `good first issue` पर काम शुरू करें!
        - *Hacktoberfest (अक्टूबर):* 4 क्वालिटी PR सबमिट करें और डिजिटल बैज व टीम रिव्यू अनुभव पाएँ।
      ],
      [
        #set text(size: 7.7pt)
        - *GitHub Student Developer Pack:* कॉलेज ईमेल से `education.github.com` पर *मुफ्त GitHub Copilot Pro*, डोमेन और क्लाउड क्रेडिट्स पाएँ!
        - *प्रो टिप:* खाली फोर्क के बजाय लगातार छोटे कमिट्स, साफ PRs और विस्तृत README बनाएँ।
      ]
    )
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(6.5pt)
#card(
  "दुनिया के टॉप 10 सबसे ज्यादा Starred GitHub Repos (हर छात्र जरूर देखें)",
  tbl(
    (auto, auto, 1fr, auto),
    ("#", "रिपोज़िटरी", "छात्रों के लिए क्यों जरूरी है (100% मुफ्त)", "Stars"),
    (
      ([*1*], [#link("https://github.com/freeCodeCamp/freeCodeCamp")[`freeCodeCamp/freeCodeCamp`]], [मुफ्त फुल-स्टैक वेब, Python व SQL सर्टिफिकेशन], [410K+ ⭐]),
      ([*2*], [#link("https://github.com/codecrafters-io/build-your-own-x")[`codecrafters-io/build-your-own-x`]], [शुरू से खुद अपना Git, Docker, Redis व React बनाएँ], [350K+ ⭐]),
      ([*3*], [#link("https://github.com/EbookFoundation/free-programming-books")[`EbookFoundation/free-programming-books`]], [20+ भाषाओं में हजारों मुफ्त प्रोग्रामिंग किताबें], [345K+ ⭐]),
      ([*4*], [#link("https://github.com/sindresorhus/awesome")[`sindresorhus/awesome`]], [हर टेक विषय की क्यूरेटेड Awesome-Lists का खजाना], [340K+ ⭐]),
      ([*5*], [#link("https://github.com/public-apis/public-apis")[`public-apis/public-apis`]], [प्रोजेक्ट्स के लिए 1,000+ मुफ्त APIs (AI, मौसम, फाइनेंस)], [320K+ ⭐]),
      ([*6*], [#link("https://github.com/jwasham/coding-interview-university")[`jwasham/coding-interview-university`]], [FAANG इंटरव्यू के लिए संपूर्ण DSA व CS स्टडी प्लान], [310K+ ⭐]),
      ([*7*], [#link("https://github.com/kamranahmedse/developer-roadmap")[`kamranahmedse/developer-roadmap`]], [इंटरैक्टिव Backend, DevOps व AI करियर रोडमैप्स], [305K+ ⭐]),
      ([*8*], [#link("https://github.com/donnemartin/system-design-primer")[`donnemartin/system-design-primer`]], [स्केलेबल सिस्टम डिज़ाइन व आर्किटेक्चर इंटरव्यू गाइड], [280K+ ⭐]),
      ([*9*], [#link("https://github.com/vinta/awesome-python")[`vinta/awesome-python`]], [बेस्ट Python फ्रेमवर्क्स और टूल्स की संपूर्ण सूची], [230K+ ⭐]),
      ([*10*], [#link("https://github.com/torvalds/linux")[`torvalds/linux`]], [Linux Kernel का असली सोर्स कोड — जहाँ से Git शुरू हुआ!], [185K+ ⭐]),
    ),
    pad-y: 3pt,
    fsize: 7.2pt
  ),
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(6.5pt)
#did-you-know[कॉलेज ईमेल वाले छात्र *GitHub Student Developer Pack* (`education.github.com`) के ज़रिए *GitHub Copilot Pro*, मुफ्त `.me` डोमेन और क्लाउड क्रेडिट्स बिल्कुल मुफ्त पा सकते हैं!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 GIT INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "टॉप 10 GIT व GITHUB इंटरव्यू प्रश्न और लेखक परिचय", "टेक इंटरव्यू तैयारी · प्रमाणपत्र, हमारा ध्येय और व्हाट्सएप हेल्प डेस्क")

#card(
  "टॉप 10 Git और GitHub इंटरव्यू प्रश्न-उत्तर",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.1pt)
        *1. Git बनाम GitHub?* Git लोकल वर्जन कंट्रोल CLI टूल है; GitHub क्लाउड प्लेटफॉर्म है जो PRs, Issues व CI/CD देता है। \
        *2. `git fetch` बनाम `git pull`?* `fetch` लोकल फाइलों को छुए बिना अपडेट डाउनलोड करता है; `pull` तुरंत `fetch` + `merge` करता है। \
        *3. `git merge` बनाम `git rebase`?* `merge` मर्ज कमिट के साथ पूरा इतिहास रखता है; `rebase` कमिट्स को नई बेस के ऊपर सीधी लाइन में लगाता है। \
        *4. `git reset` बनाम `git revert`?* `reset` इतिहास बदलता है (केवल लोकल); `revert` नया उल्टा कमिट बनाता है (शेयर `main` पर सुरक्षित)। \
        *5. `--soft` vs `--mixed` vs `--hard`?* `--soft` स्टेज रखता है; `--mixed` अनस्टेज रखता है; `--hard` बदलाव मिटा देता है।
      ],
      [
        #set text(size: 8.1pt)
        *6. Staging Area (Index) क्या है?* Working Dir और Local Repo के बीच की परत जहाँ `git add` से साफ कमिट तैयार होते हैं। \
        *7. Detached `HEAD` स्थिति?* जब `HEAD` किसी ब्रांच के बजाय सीधे कमिट हैश पर हो; `git switch -c fix` से ठीक करें। \
        *8. Merge Conflict कैसे सुलझाएँ?* फाइल में सही कोड रखें, `<<< === >>>` हटाएँ, `git add` और फिर `git commit` करें। \
        *9. `git stash` क्या है?* बिना कमिट किए अधूरे बदलाव अस्थायी रूप से सेव करता है (`git stash pop` से वापस लाएँ)। \
        *10. डिलीट हुआ कमिट कैसे वापस लाएँ?* `git reflog` से उसका SHA हैश खोजें और `git switch -c rescue <sha>` चलाएँ।
      ]
    )
  ],
  head-bg: rgb("#fff7ed"),
  title-color: rgb("#9a3412")
)

#v(24pt)

// AUTHOR & RTECHLAB MOTTO BLOCK
#box(
  width: 100%,
  fill: rgb("#0f172a"),
  radius: 4.5pt,
  inset: 9pt,
  stroke: 1.2pt + rgb("#ea580c"),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 9pt,
      align: (center + horizon, left + horizon),
      box(
        radius: 4pt,
        clip: true,
        stroke: 1.8pt + rgb("#fdba74"),
        image("02_BRAND_ASSETS/rahul-patel.jpg", width: 31mm)
      ),
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          [
            #text(fill: rgb("#fdba74"), size: 11.2pt, weight: "bold")[Rahul Patel]
            #h(6pt)
            #box(fill: rgb("#ea580c"), radius: 2pt, inset: (x: 5pt, y: 2pt))[
              #text(fill: white, size: 7.2pt, weight: "bold")[Founder & Systems Architect, RTechLab]
            ]
          ],
          image("02_BRAND_ASSETS/rtechlab-header-logo.png", width: 32mm)
        )
        #v(3.5pt)
        #text(fill: rgb("#e2e8f0"), size: 7.9pt)[
          *अनुभव व प्रमाणन:* #hl-o("Systems Architect & DevOps Trainer") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · डायरेक्टर एवं लीड आईटी ट्रेनर, IANT कंप्यूटर एजुकेशन, पालनपुर · *10+ वर्षों का अनुभव · 3,000+ छात्र प्रशिक्षित*।
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8pt)[
            *हमारा RTechLab ध्येय (Motto):* _"Technology Made Practical — कोड करें, कमिट करें और शिप करें। आपका GitHub प्रोफाइल ही आपका असली रिज्यूमे है — लगातार सीखें और प्रोजेक्ट्स लाइव करें। भारत में निर्मित ताकि ₹22 में ₹2,200 जैसा ज्ञान मिले।"_
          ]
        )
      ]
    )
  ]
)

#v(24pt)

// 4 SCANNABLE QR CODES
#card(
  "स्कैन करें और RTechLab से जुड़ें (मुफ्त लैब्स, टूल्स और अपडेट्स)",
  [
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 7pt,
      align: center,
      [
        #image("02_BRAND_ASSETS/qr_rahul_portfolio.png", width: 30mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[RTechLab & Tools] \
        #link("https://rtechlab.com/tools")[#text(size: 7pt, fill: rgb("#ea580c"))[rtechlab.com/tools]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", width: 30mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[YouTube लैब्स] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 7pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 30mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[Instagram रील्स] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily Dev Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 30mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp चैनल] \
        #link("https://wa.me/917646892094")[#text(size: 7pt, fill: rgb("#16a34a"))[जॉब व नोट्स अलर्ट]]
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(24pt)

// WHATSAPP HELP DESK CTA
#box(
  width: 100%,
  fill: rgb("#dcfce7"),
  stroke: 1.2pt + rgb("#16a34a"),
  radius: 4.5pt,
  inset: (x: 9pt, y: 7pt),
  grid(
    columns: (auto, 1fr, auto),
    gutter: 9pt,
    align: (left + horizon, left + horizon, right + horizon),
    image("02_BRAND_ASSETS/whatsapp_logo.svg", width: 10mm),
    [
      #text(size: 9.2pt, weight: "bold", fill: rgb("#14532d"))[RTechLab छात्र हेल्प डेस्क और करियर मार्गदर्शन] \
      #text(size: 7.8pt, fill: rgb("#166534"))[Git merge conflict, SSH सेटअप या Open-Source PR में कहीं अटक गए हैं? सीधे WhatsApp पर पूछें!]
    ],
    link("https://wa.me/917646892094")[
      #box(
        fill: rgb("#16a34a"),
        radius: 3.5pt,
        inset: (x: 9pt, y: 5.5pt),
        text(fill: white, weight: "bold", size: 9pt)[WhatsApp: +91 76468 92094]
      )
    ]
  )
)
