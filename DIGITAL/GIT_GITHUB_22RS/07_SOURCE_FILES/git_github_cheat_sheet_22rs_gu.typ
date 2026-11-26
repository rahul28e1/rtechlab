#set document(
  title: "RTechLab — Git & GitHub Mastery Quick Desk Cheat Sheet (Gujarati)",
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
          #text(fill: rgb("#64748b"))[ · 10-પેજ ક્વિક ડેસ્ક ગાઈડ (ગુજરાતી આવૃત્તિ)]
        ],
        [
          #text(fill: rgb("#ea580c"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 ડેસ્ક એડિશન]
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
        [© RTechLab Original Edition · કોડ · કમિટ · શિપ · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[પેજ #p / 10]]]
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
      *💡 શું તમે જાણો છો?* #fact
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
#section-banner("01", "GIT આર્કિટેક્ચર, સેટઅપ, SSH KEYS અને .GITIGNORE", "ડિસ્ટ્રિબ્યુટેડ VCS · 4-એરિયા વર્કફ્લો, ગ્લોબલ કોન્ફિગ અને સુરક્ષા")

#card(
  "Git 4-એરિયા આર્કિટેક્ચર વિઝ્યુઅલ (Working Dir → Staging → Local Repo → GitHub)",
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
    "Git વિરુદ્ધ GitHub અને પહેલો સેટઅપ",
    [
      #set text(size: 8.7pt)
      - *Git:* લોકલ ડિસ્ટ્રિબ્યુટેડ વર્ઝન કંટ્રોલ સિસ્ટમ (ઓફલાઇન દરેક ફેરફાર ટ્રેક કરે છે).
      - *GitHub:* Git રેપો હોસ્ટ કરવાનું ક્લાઉડ પ્લેટફોર્મ + PRs, Issues, Actions CI/CD અને Copilot.
      - *પહેલો ઓળખ સેટઅપ:*
        - #cmd("git config --global user.name \"Rahul Patel\"")
        - #cmd("git config --global user.email \"you@email.com\"")
        - #cmd("git config --global init.defaultBranch main")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "SSH Key લોગિન અને `.gitignore` નિયમો",
    [
      #set text(size: 8.7pt)
      - *પાસવર્ડ વિના GitHub Push (SSH):*
        1. #cmd("ssh-keygen -t ed25519 -C \"you@email.com\"")
        2. `~/.ssh/id_ed25519.pub` કોપી કરી GitHub *Settings → SSH Keys* માં ઉમેરો.
        3. તપાસો: #cmd("ssh -T git@github.com")
      - *`.gitignore` (ક્યારેય સિક્રેટ કે `node_modules` પુશ ન કરો!):*
        `.env`, `node_modules/`, `.venv/`, `__pycache__/`, `*.log`, `dist/` ઉમેરો!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(34pt)
#card(
  "ઉપયોગી કોન્ફિગ અને રિમોટ નિરીક્ષણ શોર્ટકટ્સ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.7pt)
        - બધી સક્રિય સેટિંગ્સ જુઓ: #cmd("git config --list --show-origin")
        - VS Code ને ડિફોલ્ટ એડિટર બનાવો: #cmd("git config --global core.editor \"code --wait\"")
      ],
      [
        #set text(size: 8.7pt)
        - Win/Linux લાઇન એન્ડિંગ ફિક્સ: #cmd("git config --global core.autocrlf true")
        - બ્રાન્ચનું નામ `main` કરો: #cmd("git branch -M main")
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(34pt)
#did-you-know[Git ને *2005 માં Linus Torvalds* (Linux ના નિર્માતા) એ માત્ર *10 દિવસ* માં બનાવ્યું હતું, જેથી હજારો Linux ડેવલપર્સ ટકરાવ વિના એક સાથે કામ કરી શકે!]

#pagebreak()

// =========================================================================
// PAGE 3: DAILY ESSENTIAL GIT COMMANDS & CONVENTIONAL COMMITS
// =========================================================================
#section-banner("02", "દૈનિક જરૂરી GIT કમાન્ડ્સ અને કમિટ નિયમો", "init, clone, status, add, commit, diff, log અને Conventional Commits")

#card(
  "રોજિંદા ઉપયોગમાં આવતા 20 મુખ્ય Git કમાન્ડ્સ",
  tbl(
    (auto, 1fr),
    ("કમાન્ડ", "કામ અને પ્રો ટિપ"),
    (
      ([#cmd("git init")], [નવી લોકલ Git રિપોઝિટરી બનાવો (છુપું `.git/` ફોલ્ડર બને છે).]),
      ([#cmd("git clone <url>")], [રિમોટ રેપો ડાઉનલોડ કરો (`--depth 1` થી ઝડપી ડાઉનલોડ).]),
      ([#cmd("git status -s")], [બદલાયેલી (`M`), સ્ટેજ્ડ (`A`) અને અનટ્રેક્ડ (`??`) ફાઇલો જુઓ.]),
      ([#cmd("git add <file>") / #cmd("git add .")], [ફાઇલને Staging Area (Index) માં ઉમેરો.]),
      ([#cmd("git commit -m \"msg\"")], [સ્ટેજ કરેલા ફેરફારોને લોકલ `.git` ઇતિહાસમાં સેવ કરો.]),
      ([#cmd("git commit -am \"msg\"")], [ટ્રેક્ડ ફાઇલોને 1 સ્ટેપમાં સ્ટેજ + કમિટ કરો.]),
      ([#cmd("git diff") / #cmd("--staged")], [કમિટ કરતા પહેલા લાઇન-દર-લાઇન ફેરફાર જુઓ.]),
      ([#cmd("git log --oneline --graph")], [બ્રાન્ચ ટ્રી સાથે 1-લાઇનમાં ચોખ્ખો કમિટ ઇતિહાસ જુઓ.]),
      ([#cmd("git show <commit-id>")], [કોઈ જૂના કમિટનો આખો કોડ ડિફ અને લેખક જુઓ.]),
      ([#cmd("git remote -v")], [જોડાયેલા રિમોટ URLs (`origin`, `upstream`) જુઓ.]),
      ([#cmd("git push -u origin main")], [લોકલ કમિટ્સને GitHub પર અપલોડ કરો.]),
      ([#cmd("git pull --rebase")], [રિમોટમાંથી નવા ફેરફાર લાવીને તમારા કમિટ્સ તેની ઉપર ચોખ્ખા લગાવો.]),
    ),
    pad-y: 6pt,
    fsize: 8.3pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(56pt)

#card(
  "Conventional Commits ધોરણ (પ્રોફેશનલ કમિટ મેસેજ લખો)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.7pt)
        - `feat: add Razorpay UPI webhook` (નવું ફીચર)
        - `fix: resolve null pointer in auth` (બગ ફિક્સ)
        - `docs: update API setup in README` (ડોક્યુમેન્ટેશન)
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
#did-you-know[ભૂલથી `.env` કમિટ થઈ ગઈ? *નવા* કમિટમાં ફાઇલ ડિલીટ કરવાથી તે `.git` ઇતિહાસમાંથી હટતી નથી — તરત API Key બદલો અને `git filter-repo` થી ઇતિહાસ સાફ કરો!]

#pagebreak()

// =========================================================================
// PAGE 4: BRANCHING, MERGING, REBASING & CONFLICT RESOLUTION
// =========================================================================
#section-banner("03", "બ્રાન્ચિંગ, મર્જિંગ, રીબેસિંગ અને કોન્ફ્લિક્ટ્સ", "સમાંતર વિકાસ · Fast-Forward વિરુદ્ધ 3-Way, Rebase અને કોન્ફ્લિક્ટ ફિક્સ")

#card(
  "બ્રાન્ચિંગ અને મર્જ વર્કફ્લો વિઝ્યુઅલ",
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
    "બ્રાન્ચ અને મર્જ કમાન્ડ્સ",
    [
      #set text(size: 8.6pt)
      - *બ્રાન્ચ યાદી:* #cmd("git branch -a")
      - *નવી બ્રાન્ચ બનાવો અને જાઓ:* #cmd("git switch -c feature/login")
      - *જૂની પર જાઓ:* #cmd("git switch main")
      - *મર્જ કરો:* #cmd("git merge feature/login")
        - *Fast-Forward:* `main` પોઇન્ટર સીધું આગળ વધે છે.
        - *3-Way Merge:* બંને ઇતિહાસ ભેગા કરીને નવો મર્જ કમિટ બને છે.
      - *મર્જ થયેલ બ્રાન્ચ હટાવો:* #cmd("git branch -d feature/login")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Rebase વિરુદ્ધ Merge અને Cherry-Pick",
    [
      #set text(size: 8.6pt)
      - *Rebase (`git rebase main`):* તમારા ફીચર કમિટ્સને નવીનતમ `main` ની ઉપર રાખે છે → *સીધો, ચોખ્ખો ઇતિહાસ!*
      - *સોનેરી નિયમ:* ક્યારેય શેર કરેલી પબ્લિક બ્રાન્ચ (`main`) પર rebase ન કરો!
      - *Squash Merge:* PR મર્જ પર 20 નાના કમિટ્સને 1 ચોખ્ખા કમિટમાં જોડે છે.
      - *Cherry-Pick (`git cherry-pick <sha>`):* આખી બ્રાન્ચ મર્જ કર્યા વિના કોઈ એક જરૂરી બગ-ફિક્સ કમિટ કોપી કરો.
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(28pt)

#card(
  "Merge Conflict ને 4 સરળ સ્ટેપમાં કેવી રીતે ઉકેલશો",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        1. કોન્ફ્લિક્ટ વાળી ફાઇલ ખોલો: `<<<<<<< HEAD` (તમારો), `=======`, `>>>>>>> branch` (બીજો).
        2. સાચો કોડ રાખો અને *બધા `<<<`, `===`, `>>>` ચિહ્નો હટાવી દો*.
      ],
      [
        #set text(size: 8.6pt)
        3. સુધારેલી ફાઇલ સ્ટેજ કરો: #cmd("git add <file>")
        4. મર્જ પૂર્ણ કરો: #cmd("git commit") (અથવા રદ કરો: #cmd("git merge --abort")).
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(28pt)
#did-you-know[Git બ્રાન્ચ તમારા પ્રોજેક્ટની ભારે કોપી હોતી નથી — તે માત્ર *41 બાઇટની એક નાની ફાઇલ* હોય છે જેમાં કમિટનો 40-અક્ષરનો હેશ હોય છે! 100 બ્રાન્ચ બનાવવી સેકન્ડનું કામ છે.]

#pagebreak()

// =========================================================================
// PAGE 5: UNDOING MISTAKES, STASH & TIME TRAVEL
// =========================================================================
#section-banner("04", "ભૂલો સુધારવી, STASH અને ટાઇમ ટ્રાવેલ", "restore, reset (--soft/--mixed/--hard), revert, stash અને git reflog")

#card(
  "Git Undo મેટ્રિક્સ: સાચો કમાન્ડ પસંદ કરો (કોડ ક્યારેય ન ગુમાવો!)",
  tbl(
    (auto, auto, 1fr, auto),
    ("સ્થિતિ", "કમાન્ડ", "ફાઇલો અને ઇતિહાસ પર અસર", "પુશ પછી સુરક્ષિત?"),
    (
      ([*અનસ્ટેજ્ડ ફેરફાર હટાવો*], [#cmd("git restore <file>")], [ફાઇલને પાછલા કમિટ જેવી કરી દે છે (ફેરફાર જશે!).], [ફક્ત લોકલ]),
      ([*ફાઇલ અનસ્ટેજ કરો*], [#cmd("git restore --staged <f>")], [Staging માંથી પાછી Working Dir માં લાવે છે (કોડ સુરક્ષિત).], [ફક્ત લોકલ]),
      ([*છેલ્લો કમિટ સુધારો*], [#cmd("git commit --amend")], [પાછલા કમિટનો મેસેજ કે ફાઇલો અપડેટ કરે છે.], [ફક્ત લોકલ]),
      ([*કમિટ હટાવો, સ્ટેજ રાખો*], [#cmd("git reset --soft HEAD~1")], [`HEAD` 1 પગલું પાછળ; ફેરફાર સ્ટેજ્ડ રહે છે.], [ફક્ત લોકલ]),
      ([*કમિટ હટાવો, ફાઇલ રાખો*], [#cmd("git reset --mixed HEAD~1")], [ડિફોલ્ટ રીસેટ; ફેરફાર અનસ્ટેજ્ડ રહે છે.], [ફક્ત લોકલ]),
      ([*કમિટ + ફેરફાર મિટાઓ*], [#cmd("git reset --hard HEAD~1")], [કમિટ અને સેવ વિનાના ફેરફાર હંમેશા માટે હટે છે!], [*જોખમી!*]),
      ([*`main` પર સુરક્ષિત Undo*], [#cmd("git revert <sha>")], [જૂના કમિટને ઉલટાવતો *નવો* કમિટ બનાવે છે.], [*હા (સુરક્ષિત!)*]),
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
    "`git stash` (કમિટ કર્યા વિના કામ અસ્થાયી સેવ કરો)",
    [
      #set text(size: 8.6pt)
      અધૂરા કામ સાથે તરત બીજી બ્રાન્ચ પર જવું હોય તો:
      - ફેરફાર સેવ કરો: #cmd("git stash -u")
      - સેવ યાદી જુઓ: #cmd("git stash list")
      - પાછું લાવી ડિલીટ કરો: #cmd("git stash pop")
      - ડિલીટ વિના પાછું લાવો: #cmd("git stash apply stash@{0}")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "`git reflog` (ખોવાયેલો કોડ પાછો લાવવાનો જાદુ)",
    [
      #set text(size: 8.6pt)
      ભૂલથી `git reset --hard` ચાલી ગયું કે બ્રાન્ચ ડિલીટ થઈ ગઈ?
      1. #cmd("git reflog") ચલાવો — `HEAD` ની દરેક હલચલ (30–90 દિવસ સુધી) અહીં દેખાય છે!
      2. ખોવાયેલ કમિટ હેશ શોધો (જેમ કે `a1b2c3d`).
      3. તરત રિકવર કરો: #cmd("git switch -c rescued a1b2c3d")
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(36pt)
#card(
  "સુરક્ષિત Force-Push અને અનટ્રેક્ડ ફાઇલો સાફ કરવી",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *ક્યારેય `git push --force` ન ચલાવો!* હંમેશા #cmd("git push --force-with-lease") વાપરો જેથી સાથીનો નવો કોડ ન ભુંસાય!
      ],
      [
        #set text(size: 8.6pt)
        - *કચરો સાફ કરો:* પહેલા તપાસો #cmd("git clean -nd"), પછી અનટ્રેક્ડ ફાઇલો હટાવો: #cmd("git clean -fd").
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(36pt)
#did-you-know[ડરામણા `git reset --hard` પછી પણ તમારો કમિટ કરેલો કોડ *લગભગ 30 દિવસ સુધી સુરક્ષિત* રહે છે — `git reflog` દરેક એ કમિટને યાદ રાખે છે જ્યાં `HEAD` ગયું હતું!]

#pagebreak()

// =========================================================================
// PAGE 6: GITHUB MASTERY, OPEN-SOURCE PRS & GITHUB CLI
// =========================================================================
#section-banner("05", "GITHUB માસ્ટરી, ઓપન-સોર્સ PRS અને GITHUB CLI", "Fork → Clone → PR વર્કફ્લો, gh CLI, Pages અને Markdown બેજ")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "5-સ્ટેપ ઓપન-સોર્સ યોગદાન (Fork & PR વર્કફ્લો)",
    [
      #set text(size: 8.6pt)
      1. GitHub પર પ્રોજેક્ટને તમારા એકાઉન્ટમાં *Fork* કરો.
      2. તમારો ફોર્ક *Clone* કરો: #cmd("git clone git@github.com:YOU/repo.git")
      3. મૂળ રેપોને `upstream` ઉમેરો: #cmd("git remote add upstream <orig-url>")
      4. ફીચર બ્રાન્ચ (`git switch -c fix/typo`) બનાવી કમિટ અને `origin` પર પુશ કરો.
      5. GitHub પર *"Compare & Pull Request"* દબાવો, વર્ણન લખો અને રિવ્યુ પર કામ કરો!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "GitHub CLI (`gh`) — ટર્મિનલથી GitHub કંટ્રોલ કરો",
    [
      #set text(size: 8.6pt)
      `cli.github.com` થી ઇન્સ્ટોલ કરી લોગિન કરો (`gh auth login`):
      - 1 કમાન્ડમાં રેપો બનાવો અને પુશ કરો: #cmd("gh repo create my-app --public --push")
      - Pull Request ખોલો: #cmd("gh pr create --fill")
      - PR અને CI સ્થિતિ જુઓ: #cmd("gh pr list") · #cmd("gh pr checkout 42")
      - Issues જુઓ: #cmd("gh issue list") · #cmd("gh run watch")
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(48pt)

#card(
  "GitHub પ્રોફાઇલ પાવર-અપ્સ (રિક્રુટર્સને પ્રભાવિત કરો)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *Profile README:* તમારા યુઝરનેમનો રેપો (`github.com/Rahul/Rahul`) બનાવી `README.md` માં બાયો અને સ્કિલ્સ બતાવો!
        - *ટોપ 6 રેપો પિન કરો:* લાઇવ ડેમો લિંક, સ્ક્રીનશોટ અને `shields.io` બેજ લગાવો.
      ],
      [
        #set text(size: 8.6pt)
        - *GitHub Pages (મફત હોસ્ટિંગ):* `username.github.io` પર HTML/React/Vite પોર્ટફોલિયો મફત હોસ્ટ કરો.
        - *Branch Protection:* `main` પર મર્જ થતા પહેલા 1 PR અપ્રૂવલ અને CI ટેસ્ટ ફરજિયાત કરો!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(48pt)
#card(
  "જરૂરી `README.md` Markdown ચીટ શીટ",
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
        - કોડ બ્લોક: ```` ```bash ... ``` ````
        - ટાસ્ક લિસ્ટ: `- [x] Done` · `- [ ] Todo` · એલર્ટ: `> [!NOTE]`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(48pt)
#did-you-know[કોઈપણ GitHub રિપોઝિટરી પેજ પર ફક્ત `.` (ડોટ) દબાવવાથી બ્રાઉઝરમાં આખું *VS Code એડિટર* (`github.dev`) તરત ખુલી જાય છે — કંઈપણ ઇન્સ્ટોલ કર્યા વિના!]

#pagebreak()

// =========================================================================
// PAGE 7: GITHUB ACTIONS (CI/CD) & TEAM WORKFLOWS
// =========================================================================
#section-banner("06", "GITHUB ACTIONS (CI/CD) અને ટીમ વર્કફ્લો", "ઓટોમેટેડ ટેસ્ટિંગ, ડિપ્લોયમેન્ટ, Git Flow વિરુદ્ધ GitHub Flow અને Tags")

#grid(
  columns: (1.05fr, 0.95fr),
  gutter: 7pt,
  card(
    "GitHub Actions CI/CD વર્કફ્લો (`.github/workflows/ci.yml`)",
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
      - *Secrets:* API Keys ને *Settings → Secrets* માં રાખો અને `${{ secrets.API_KEY }}` થી વાંચો.
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "ટીમ બ્રાન્ચિંગ વ્યૂહરચનાઓની તુલના",
    tbl(
      (auto, 1fr),
      ("વ્યૂહરચના", "કેવી રીતે કામ કરે છે અને કોના માટે બેસ્ટ"),
      (
        ([*GitHub Flow*], [`main` (હંમેશા લાઇવ-રેડી) + નાની ફીચર બ્રાન્ચ + PRs. *SaaS અને વેબ એપ્સ માટે બેસ્ટ.*]),
        ([*Git Flow*], [`main` + `develop` + `feature/*` + `release/*` + `hotfix/*`. *શેડ્યૂલ્ડ રિલીઝ માટે બેસ્ટ.*]),
        ([*Trunk-Based*], [ફીચર ફ્લેગ્સ સાથે સીધું `main` (કે 1-દિવસ બ્રાન્ચ) પર નાના કમિટ્સ. *સીનિયર CI/CD ટીમ માટે.*]),
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
  "Semantic Versioning (`v1.2.3`), Git Tags અને Dependabot",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *SemVer (`MAJOR.MINOR.PATCH`):* `2.1.4` → `MAJOR` (મોટો ફેરફાર), `MINOR` (નવું ફીચર), `PATCH` (બગ ફિક્સ).
        - *Tag બનાવો અને પુશ કરો:* #cmd("git tag -a v1.0.0 -m \"Launch\"") → #cmd("git push origin v1.0.0")
      ],
      [
        #set text(size: 8.6pt)
        - *GitHub Releases:* કોઈપણ ટેગ પર `.zip`/`.exe` ફાઇલો અને ચેન્જલોગ અપલોડ કરો.
        - *Dependabot:* `npm`/`pip` પેકેજમાં સુરક્ષા ખામી મળવા પર આપમેળે અપડેટ PR ખોલે છે!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(46pt)
#card(
  "CI/CD ઓટો-ડિપ્લોય ટ્રિગર્સ અને PR ચેક",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *શેડ્યૂલ્ડ Cron જોબ્સ:* `schedule: - cron: "0 2 * * *"` થી રોજ રાત્રે મફત ટેસ્ટ કે સ્ક્રેપર ચલાવો.
      ],
      [
        #set text(size: 8.6pt)
        - *ઓટો-ડિપ્લોય:* GitHub રેપોને *Vercel, Netlify કે Render* સાથે જોડો — દરેક `git push` પર 30 સેકન્ડમાં લાઇવ!
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(46pt)
#did-you-know[GitHub Actions પ્રાઇવેટ રેપો પર દર મહિને *2,000 મફત CI/CD મિનિટ* અને પબ્લિક ઓપન-સોર્સ રેપો પર *અનલિમિટેડ મફત મિનિટ* આપે છે!]

#pagebreak()

// =========================================================================
// PAGE 8: AI + GIT/GITHUB, BISECT, HOOKS & PRO TOOLS
// =========================================================================
#section-banner("07", "AI + GIT/GITHUB, GIT BISECT, HOOKS અને પ્રો ટૂલ્સ", "GitHub Copilot, AI કમિટ/PR વર્કફ્લો, git bisect અને Pre-Commit Hooks")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "AI + Git અને GitHub (2026–27 ડેવલપર સુપરપાવર)",
    [
      #set text(size: 8.6pt)
      - *GitHub Copilot CLI (`gh copilot`):* સરળ ભાષામાં પૂછો: #cmd("gh copilot suggest \"undo last commit keep files\"") કે `gh copilot explain`!
      - *AI PR રિવ્યુ અને સારાંશ:* Copilot / CodeRabbit આપમેળે PR ડિફ વાંચીને બગ પકડે છે અને સારાંશ લખે છે.
      - *AI કમિટ મેસેજ:* VS Code / Cursor *"Sparkle ✨"* બટન 1 ક્લિકમાં `git diff` વાંચીને સાચો કમિટ મેસેજ બનાવે છે!
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "`git bisect` (બાઇનરી સર્ચથી સેકન્ડોમાં બગ કમિટ શોધો)",
    [
      #set text(size: 8.6pt)
      છેલ્લા 1,000 કમિટ્સમાં ક્યાંક બગ આવ્યો છે? બાઇનરી સર્ચ ફક્ત *10 સ્ટેપ* માં શોધી આપશે!
      1. #cmd("git bisect start")
      2. #cmd("git bisect bad") (હાલનો કમિટ ખરાબ છે)
      3. #cmd("git bisect good v1.0.0") (આ જૂનું ટેગ સાચું હતું)
      4. Git વચ્ચે લઈ જશે — ટેસ્ટ કરો, દોષી કમિટ મળતાં જ: #cmd("git bisect reset")
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
    "Git Hooks (`pre-commit` / Husky) — કમિટ પહેલાં ઓટો-ચેક",
    [
      #set text(size: 8.6pt)
      - `.git/hooks/` ની સ્ક્રિપ્ટ્સ `git commit` કે `git push` પહેલાં આપમેળે ચાલે છે.
      - *Husky* (JS) કે *`pre-commit`* (Python) થી `eslint`, `ruff`, `prettier` અને સિક્રેટ સ્કેનર (`gitleaks`) ચલાવો જેથી તૂટેલો કોડ કમિટ જ ન થાય!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "`git worktree` અને Git LFS (મોટી ફાઇલો)",
    [
      #set text(size: 8.6pt)
      - *`git worktree add ../hotfix main`:* `stash` કર્યા વિના 2 અલગ ફોલ્ડરમાં *એક સાથે* 2 બ્રાન્ચ પર કામ કરો!
      - *Git LFS:* 100 MB+ `.mp4`/`.pt` ફાઇલોને સામાન્ય Git માં ન નાખો — #cmd("git lfs track \"*.pt\"") વાપરો.
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(46pt)
#card(
  "પ્રો Git Aliases (દરરોજ 100+ કીસ્ટ્રોક બચાવો)",
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
#did-you-know[જો તમારે 1,024 કમિટ્સમાંથી બગ વાળો કમિટ શોધવો હોય, તો `git bisect` ને વધુમાં વધુ ફક્ત $log_2(1024) = 10$ તપાસ કરવી પડે છે!]

#pagebreak()

// =========================================================================
// PAGE 9: TOP LEARNING SITES, GITHUB REPOS & OPEN-SOURCE CAREERS
// =========================================================================
#section-banner("08", "ટોપ લર્નિંગ સાઇટ્સ, GITHUB REPOS અને ઓપન-સોર્સ કરિયર", "ઇન્ટરએક્ટિવ Git પ્રેક્ટિસ, First Contributions, GSoC અને રિઝ્યુમે બ્લુપ્રિન્ટ")

#card(
  "Git અને ઓપન-સોર્સ માસ્ટર કરવાની બેસ્ટ મફત વેબસાઇટ્સ અને Repos (ક્લિકેબલ)",
  tbl(
    (auto, 1fr, auto),
    ("સાઇટ / રેપો", "શું શીખશો અને પ્રેક્ટિસ કરશો (100% મફત)", "ડાયરેક્ટ લિંક"),
    (
      ([*Learn Git Branching*], [branch, merge અને rebase શીખવાની ઇન્ટરએક્ટિવ ગેમ], [#link("https://learngitbranching.js.org")[`learngitbranching.js.org`]]),
      ([*GitHub Skills*], [PRs, Actions અને Copilot પર સત્તાવાર ઇન્ટરએક્ટિવ કોર્સ], [#link("https://skills.github.com")[`skills.github.com`]]),
      ([*First Contributions*], [5 મિનિટમાં તમારો પહેલો ઓપન-સોર્સ PR કરવાની ગાઇડ], [#link("https://github.com/firstcontributions/first-contributions")[`firstcontributions/first-...`]]),
      ([*Pro Git Book*], [Scott Chacon અને Ben Straub ની સત્તાવાર મફત ચોપડી], [#link("https://git-scm.com/book")[`git-scm.com/book`]]),
      ([*Oh My Git!*], [Git કમિટ્સને વિઝ્યુઅલ રીતે સમજાવતી ઓપન-સોર્સ ગેમ], [#link("https://ohmygit.org")[`ohmygit.org`]]),
      ([*GitHub Explore*], [રોજ ટ્રેન્ડ થતા AI, Python અને Web પ્રોજેક્ટ્સ શોધો], [#link("https://github.com/explore")[`github.com/explore`]]),
      ([*Shields.io*], [તમારા README.md માટે પ્રોફેશનલ બેજ બનાવો], [#link("https://shields.io")[`shields.io`]]),
    ),
    pad-y: 3.4pt,
    fsize: 7.5pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(6.5pt)

#card(
  "ઓપન-સોર્સ અને કરિયર ગાઇડ (GSoC, Hacktoberfest અને ઇન્ટર્નશિપ)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 7.7pt)
        - *Google Summer of Code (GSoC):* પેઇડ રિમોટ ઇન્ટર્નશિપ (₹1.2L–₹2.5L+ સ્ટાઇપેન્ડ); 3 મહિના પહેલાંથી `good first issue` પર કામ શરૂ કરો!
        - *Hacktoberfest (ઓક્ટોબર):* 4 ક્વોલિટી PR સબમિટ કરો અને ડિજિટલ બેજ તથા ટીમ રિવ્યુ અનુભવ મેળવો.
      ],
      [
        #set text(size: 7.7pt)
        - *GitHub Student Developer Pack:* કોલેજ ઈમેલથી `education.github.com` પર *મફત GitHub Copilot Pro*, ડોમેન અને ક્લાઉડ ક્રેડિટ્સ મેળવો!
        - *પ્રો ટિપ:* ખાલી ફોર્કને બદલે સતત નાના કમિટ્સ, ચોખ્ખા PRs અને વિગતવાર README બનાવો.
      ]
    )
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(6.5pt)
#card(
  "દુનિયાના ટોપ 10 સૌથી વધુ Starred GitHub Repos (દરેક વિદ્યાર્થી જરૂર જુએ)",
  tbl(
    (auto, auto, 1fr, auto),
    ("#", "રિપોઝિટરી", "વિદ્યાર્થીઓ માટે કેમ જરૂરી છે (100% મફત)", "Stars"),
    (
      ([*1*], [#link("https://github.com/freeCodeCamp/freeCodeCamp")[`freeCodeCamp/freeCodeCamp`]], [મફત ફુલ-સ્ટેક વેબ, Python અને SQL સર્ટિફિકેશન], [410K+ ⭐]),
      ([*2*], [#link("https://github.com/codecrafters-io/build-your-own-x")[`codecrafters-io/build-your-own-x`]], [શરૂઆતથી જાતે તમારું Git, Docker, Redis અને React બનાવો], [350K+ ⭐]),
      ([*3*], [#link("https://github.com/EbookFoundation/free-programming-books")[`EbookFoundation/free-programming-books`]], [20+ ભાષાઓમાં હજારો મફત પ્રોગ્રામિંગ પુસ્તકો], [345K+ ⭐]),
      ([*4*], [#link("https://github.com/sindresorhus/awesome")[`sindresorhus/awesome`]], [દરેક ટેક વિષયની ક્યુરેટેડ Awesome-Lists નો ખજાનો], [340K+ ⭐]),
      ([*5*], [#link("https://github.com/public-apis/public-apis")[`public-apis/public-apis`]], [પ્રોજેક્ટ્સ માટે 1,000+ મફત APIs (AI, હવામાન, ફાઇનાન્સ)], [320K+ ⭐]),
      ([*6*], [#link("https://github.com/jwasham/coding-interview-university")[`jwasham/coding-interview-university`]], [FAANG ઇન્ટરવ્યુ માટે સંપૂર્ણ DSA અને CS સ્ટડી પ્લાન], [310K+ ⭐]),
      ([*7*], [#link("https://github.com/kamranahmedse/developer-roadmap")[`kamranahmedse/developer-roadmap`]], [ઇન્ટરએક્ટિવ Backend, DevOps અને AI કરિયર રોડમેપ], [305K+ ⭐]),
      ([*8*], [#link("https://github.com/donnemartin/system-design-primer")[`donnemartin/system-design-primer`]], [સ્કેલેબલ સિસ્ટમ ડિઝાઇન અને આર્કિટેક્ચર ઇન્ટરવ્યુ ગાઇડ], [280K+ ⭐]),
      ([*9*], [#link("https://github.com/vinta/awesome-python")[`vinta/awesome-python`]], [બેસ્ટ Python ફ્રેમવર્ક્સ અને ટૂલ્સની સંપૂર્ણ યાદી], [230K+ ⭐]),
      ([*10*], [#link("https://github.com/torvalds/linux")[`torvalds/linux`]], [Linux Kernel નો અસલી સોર્સ કોડ — જ્યાંથી Git ની શરૂઆત થઈ!], [185K+ ⭐]),
    ),
    pad-y: 3pt,
    fsize: 7.2pt
  ),
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(6.5pt)
#did-you-know[કોલેજ ઈમેલ ધરાવતા વિદ્યાર્થીઓ *GitHub Student Developer Pack* (`education.github.com`) દ્વારા *GitHub Copilot Pro*, મફત `.me` ડોમેન અને ક્લાઉડ ક્રેડિટ્સ બિલકુલ મફત મેળવી શકે છે!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 GIT INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "ટોપ 10 GIT અને GITHUB ઇન્ટરવ્યુ પ્રશ્નો અને લેખક પરિચય", "ટેક ઇન્ટરવ્યુ તૈયારી · પ્રમાણપત્રો, અમારો ધ્યેય અને વોટ્સએપ હેલ્પ ડેસ્ક")

#card(
  "ટોપ 10 Git અને GitHub ઇન્ટરવ્યુ પ્રશ્ન-જવાબ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.1pt)
        *1. Git વિરુદ્ધ GitHub?* Git લોકલ વર્ઝન કંટ્રોલ CLI ટૂલ છે; GitHub ક્લાઉડ પ્લેટફોર્મ છે જે PRs, Issues અને CI/CD આપે છે. \
        *2. `git fetch` વિરુદ્ધ `git pull`?* `fetch` લોકલ ફાઇલોને અડ્યા વિના અપડેટ ડાઉનલોડ કરે છે; `pull` તરત `fetch` + `merge` કરે છે. \
        *3. `git merge` વિરુદ્ધ `git rebase`?* `merge` મર્જ કમિટ સાથે આખો ઇતિહાસ રાખે છે; `rebase` કમિટ્સને નવા બેઝ ઉપર સીધી લાઇનમાં ગોઠવે છે. \
        *4. `git reset` વિરુદ્ધ `git revert`?* `reset` ઇતિહાસ બદલે છે (માત્ર લોકલ); `revert` નવો ઊલટો કમિટ બનાવે છે (શેર `main` પર સુરક્ષિત). \
        *5. `--soft` vs `--mixed` vs `--hard`?* `--soft` સ્ટેજ રાખે છે; `--mixed` અનસ્ટેજ રાખે છે; `--hard` ફેરફાર ભૂંસી નાખે છે.
      ],
      [
        #set text(size: 8.1pt)
        *6. Staging Area (Index) શું છે?* Working Dir અને Local Repo વચ્ચેનું સ્તર જ્યાં `git add` થી ચોખ્ખા કમિટ તૈયાર થાય છે. \
        *7. Detached `HEAD` સ્થિતિ?* જ્યારે `HEAD` કોઈ બ્રાન્ચને બદલે સીધું કમિટ હેશ પર હોય; `git switch -c fix` થી ઠીક કરો. \
        *8. Merge Conflict કેવી રીતે ઉકેલશો?* ફાઇલમાં સાચો કોડ રાખો, `<<< === >>>` હટાવો, `git add` અને પછી `git commit` કરો. \
        *9. `git stash` શું છે?* કમિટ કર્યા વિના અધૂરા ફેરફારોને અસ્થાયી રીતે સેવ કરે છે (`git stash pop` થી પાછા લાવો). \
        *10. ડિલીટ થયેલો કમિટ પાછો કેવી રીતે લાવવો?* `git reflog` માંથી તેનો SHA હેશ શોધો અને `git switch -c rescue <sha>` ચલાવો.
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
          *અનુભવ અને પ્રમાણપત્રો:* #hl-o("Systems Architect & DevOps Trainer") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · ડાયરેક્ટર અને લીડ IT ટ્રેનર, IANT કમ્પ્યુટર એજ્યુકેશન, પાલનપુર · *10+ વર્ષનો અનુભવ · 3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત*.
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8pt)[
            *અમારો RTechLab ધ્યેય (Motto):* _"Technology Made Practical — કોડ કરો, કમિટ કરો અને શિપ કરો. તમારી GitHub પ્રોફાઇલ જ તમારું સાચું રિઝ્યુમે છે — સતત શીખો અને પ્રોજેક્ટ્સ લાઇવ કરો. ભારતમાં નિર્મિત જેથી ₹22 માં ₹2,200 જેવું જ્ઞાન મળે."_
          ]
        )
      ]
    )
  ]
)

#v(24pt)

// 4 SCANNABLE QR CODES
#card(
  "સ્કેન કરો અને RTechLab સાથે જોડાઓ (મફત લેબ્સ, ટૂલ્સ અને અપડેટ્સ)",
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
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[YouTube લેબ્સ] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 7pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 30mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[Instagram રીલ્સ] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily Dev Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 30mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp ચેનલ] \
        #link("https://wa.me/917646892094")[#text(size: 7pt, fill: rgb("#16a34a"))[જોબ અને નોટ્સ એલર્ટ]]
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
      #text(size: 9.2pt, weight: "bold", fill: rgb("#14532d"))[RTechLab વિદ્યાર્થી હેલ્પ ડેસ્ક અને કરિયર માર્ગદર્શન] \
      #text(size: 7.8pt, fill: rgb("#166534"))[Git merge conflict, SSH સેટઅપ કે Open-Source PR માં ક્યાંય અટવાયા છો? સીધું WhatsApp પર પૂછો!]
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
