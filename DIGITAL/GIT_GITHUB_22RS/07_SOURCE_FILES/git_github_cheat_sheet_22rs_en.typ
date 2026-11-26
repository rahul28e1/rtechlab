#set document(
  title: "RTechLab — Git & GitHub Mastery Quick Desk Cheat Sheet (English)",
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
      #set text(size: 7.2pt, fill: rgb("#475569"), font: "Segoe UI")
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
          #text(fill: rgb("#64748b"))[ · 10-Page Quick Desk Reference (English)]
        ],
        [
          #text(fill: rgb("#ea580c"), weight: "bold")[rtechlab.com/tools]
          #text(fill: rgb("#94a3b8"))[ | ]
          #text(fill: rgb("#dc2626"), weight: "bold")[₹22 Desk Edition]
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
      #set text(size: 7pt, fill: rgb("#64748b"), font: "Segoe UI")
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [© RTechLab Original Edition · Code · Commit · Ship · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[Page #p of 10]]]
      )
    ]
  }
)

#set text(font: "Segoe UI", size: 9pt, fill: rgb("#1e293b"))
#set par(leading: 0.94em, justify: false)

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
      text(fill: white, weight: "bold", size: 10.6pt)[#title],
      text(fill: rgb("#fed7aa"), size: 7.9pt, weight: "semibold")[#subtitle]
    )
  )
  v(11pt)
}

#let card(title, body, border: rgb("#cbd5e1"), head-bg: rgb("#f8fafc"), title-color: rgb("#0f172a"), pad: 12.5pt) = {
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
        text(weight: "bold", size: 8.9pt, fill: title-color)[#title]
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
    text(size: 8.4pt, fill: rgb("#78350f"))[
      *💡 Did You Know?* #fact
    ]
  )
}

#let tbl(cols, headers, rows, pad-y: 5.8pt, fsize: 8.3pt) = {
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
#section-banner("01", "GIT ARCHITECTURE, SETUP, SSH KEYS & .GITIGNORE", "Distributed VCS · 4-Area Workflow, Global Config & Security Hygiene")

#card(
  "Git 4-Area Architecture Visual (Working Dir → Staging → Local Repo → GitHub)",
  [
    #align(center)[#image("02_BRAND_ASSETS/git_workflow_visual.png", width: 96%)]
  ],
  head-bg: rgb("#fff7ed"),
  title-color: rgb("#9a3412")
)

#v(38pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Git vs GitHub & First-Time Setup",
    [
      #set text(size: 8.9pt)
      - *Git:* Local distributed Version Control System (tracks every file change offline with SHA-1/SHA-256 hashes).
      - *GitHub:* Cloud hosting platform for Git repos + Pull Requests, Issues, Actions CI/CD, and Copilot.
      - *One-Time Identity Setup:*
        - #cmd("git config --global user.name \"Rahul Patel\"")
        - #cmd("git config --global user.email \"you@email.com\"")
        - #cmd("git config --global init.defaultBranch main")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "SSH Key Auth & `.gitignore` Best Practices",
    [
      #set text(size: 8.9pt)
      - *Passwordless GitHub Push (SSH):*
        1. #cmd("ssh-keygen -t ed25519 -C \"you@email.com\"")
        2. Copy `~/.ssh/id_ed25519.pub` → GitHub *Settings → SSH Keys*.
        3. Test: #cmd("ssh -T git@github.com")
      - *`.gitignore` (NEVER push secrets or `node_modules`!):*
        Add `.env`, `node_modules/`, `.venv/`, `__pycache__/`, `*.log`, `dist/` to `.gitignore` in root!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(38pt)
#card(
  "Useful Config & Remote Inspection Shortcuts",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        - List all active settings: #cmd("git config --list --show-origin")
        - Set VS Code as default editor: #cmd("git config --global core.editor \"code --wait\"")
      ],
      [
        #set text(size: 8.9pt)
        - Fix Windows/Linux line endings: #cmd("git config --global core.autocrlf true")
        - Rename branch to `main`: #cmd("git branch -M main")
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(38pt)
#did-you-know[Git was created in *2005 by Linus Torvalds* (creator of Linux) in just *10 days* because existing tools couldn't handle thousands of Linux kernel developers collaborating at once!]

#pagebreak()

// =========================================================================
// PAGE 3: DAILY ESSENTIAL GIT COMMANDS & CONVENTIONAL COMMITS
// =========================================================================
#section-banner("02", "DAILY ESSENTIAL GIT COMMANDS & COMMIT HYGIENE", "init, clone, status, add, commit, diff, log & Conventional Commits")

#card(
  "20 Most-Used Daily Git Commands (Desk Quick Reference)",
  tbl(
    (auto, 1fr),
    ("Command", "What It Does & Pro Tip"),
    (
      ([#cmd("git init")], [Initialize a new local Git repository (creates hidden `.git/` folder).]),
      ([#cmd("git clone <url>")], [Download a remote repo + full history (`--depth 1` for fast shallow clone).]),
      ([#cmd("git status -s")], [Compact view of modified, staged (`A/M`), and untracked (`??`) files.]),
      ([#cmd("git add <file>") / #cmd("git add .")], [Stage specific file or all changes into the Staging Area (Index).]),
      ([#cmd("git commit -m \"msg\"")], [Save staged snapshot permanently to local `.git` history.]),
      ([#cmd("git commit -am \"msg\"")], [Stage tracked files + commit in 1 step (skips brand-new untracked files).]),
      ([#cmd("git diff") / #cmd("--staged")], [View line-by-line unstaged edits (or staged edits before committing).]),
      ([#cmd("git log --oneline --graph")], [Clean visual 1-line commit history with branch tree.]),
      ([#cmd("git show <commit-id>")], [Inspect exact code diff & author metadata of any past commit.]),
      ([#cmd("git remote -v")], [List connected remote URLs (`origin`, `upstream`).]),
      ([#cmd("git push -u origin main")], [Upload local commits to GitHub & set upstream tracking branch.]),
      ([#cmd("git pull --rebase")], [Fetch + replay local commits cleanly on top of remote without messy merge commits.]),
    ),
    pad-y: 6.5pt,
    fsize: 8.6pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(56pt)

#card(
  "Conventional Commits Standard (Write Resume-Grade Commit Messages)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        - `feat: add Razorpay UPI webhook` (New feature)
        - `fix: resolve null pointer in auth` (Bug fix)
        - `docs: update API setup in README` (Docs only)
      ],
      [
        #set text(size: 8.9pt)
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
#did-you-know[Accidentally committed `.env`? Deleting it in a *new* commit does NOT erase it from `.git` history—rotate the leaked API key immediately and scrub history with `git filter-repo`!]

#pagebreak()

// =========================================================================
// PAGE 4: BRANCHING, MERGING, REBASING & CONFLICT RESOLUTION
// =========================================================================
#section-banner("03", "BRANCHING, MERGING, REBASING & CONFLICTS", "Parallel Development · Fast-Forward vs 3-Way, Rebase & Conflict Fix")

#card(
  "Branching & Merge Workflow Visual",
  [
    #align(center)[#image("02_BRAND_ASSETS/git_branching_visual.png", width: 96%)]
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(24pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Branch & Merge Commands",
    [
      #set text(size: 8.9pt)
      - *List Branches:* #cmd("git branch -a")
      - *Create & Switch (Modern):* #cmd("git switch -c feature/login")
      - *Switch Existing:* #cmd("git switch main")
      - *Merge into Current:* #cmd("git merge feature/login")
        - *Fast-Forward:* Moves `main` pointer forward (no extra commit).
        - *3-Way Merge:* Creates a new merge commit combining diverged histories.
      - *Delete Merged Branch:* #cmd("git branch -d feature/login")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Rebase vs Merge & Cherry-Pick",
    [
      #set text(size: 8.9pt)
      - *Rebase (`git rebase main`):* Replays your feature commits on top of latest `main` → *linear, ultra-clean history!*
      - *Golden Rule of Rebase:* NEVER rebase a shared public branch (`main`) that teammates already pulled!
      - *Squash Merge:* Combines 20 messy WIP commits into 1 clean commit on PR merge.
      - *Cherry-Pick (`git cherry-pick <sha>`):* Copy 1 specific bugfix commit from another branch without merging the whole branch.
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(24pt)

#card(
  "How to Resolve a Merge Conflict in 4 Calm Steps",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.8pt)
        1. Open conflicted file and look for markers: `<<<<<<< HEAD` (yours), `=======`, `>>>>>>> branch` (theirs).
        2. Keep the right code (or combine both) and *delete all `<<<`, `===`, `>>>` markers*.
      ],
      [
        #set text(size: 8.8pt)
        3. Stage the fixed file: #cmd("git add <file>")
        4. Finish merge: #cmd("git commit") (or #cmd("git merge --abort") to cancel safely!).
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(24pt)
#did-you-know[A Git branch is NOT a heavy copy of your project—it is just a tiny *41-byte file* containing the 40-character SHA-1 hash of a single commit! Creating 100 branches takes milliseconds.]

#pagebreak()

// =========================================================================
// PAGE 5: UNDOING MISTAKES, STASH & TIME TRAVEL (REFLOG)
// =========================================================================
#section-banner("04", "UNDOING MISTAKES, STASH & TIME TRAVEL", "restore, reset (--soft/--mixed/--hard), revert, stash & git reflog")

#card(
  "Git Undo Matrix: Pick the Exact Right Command (Never Lose Code!)",
  tbl(
    (auto, auto, 1fr, auto),
    ("Scenario", "Command", "What Happens to Files & History", "Safe for Pushed?"),
    (
      ([*Discard unstaged edits*], [#cmd("git restore <file>")], [Reverts working file back to last commit (edits lost!).], [Local only]),
      ([*Unstage a file*], [#cmd("git restore --staged <f>")], [Moves file out of Staging back to Working Dir (keeps edits).], [Local only]),
      ([*Fix last commit msg/file*], [#cmd("git commit --amend")], [Replaces last commit with updated message/staged files.], [Local only]),
      ([*Undo commit, keep staged*], [#cmd("git reset --soft HEAD~1")], [Moves `HEAD` back 1; keeps all changes staged.], [Local only]),
      ([*Undo commit, keep files*], [#cmd("git reset --mixed HEAD~1")], [Default reset; keeps changes unstaged in Working Dir.], [Local only]),
      ([*Nuke commit + edits*], [#cmd("git reset --hard HEAD~1")], [Deletes commit AND all uncommitted edits permanently!], [*DANGER!*]),
      ([*Safe undo on `main`*], [#cmd("git revert <sha>")], [Creates a *new* commit that reverses `<sha>` cleanly.], [*YES (Safe!)*]),
    ),
    pad-y: 6.8pt,
    fsize: 8.9pt
  ),
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(31pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "`git stash` (Save Work Temporarily Without Committing)",
    [
      #set text(size: 8.9pt)
      Need to switch branches urgently with half-done code?
      - Save edits (including untracked): #cmd("git stash -u")
      - List saved stashes: #cmd("git stash list")
      - Restore & delete top stash: #cmd("git stash pop")
      - Apply without deleting: #cmd("git stash apply stash@{0}")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "`git reflog` (Your Ultimate Safety Net for Recovery)",
    [
      #set text(size: 8.9pt)
      Accidentally ran `git reset --hard` or deleted a branch?
      1. Run #cmd("git reflog") to see *every* movement of `HEAD` (even deleted commits stay 30–90 days!).
      2. Find the lost commit hash (e.g. `a1b2c3d`).
      3. Recover it instantly: #cmd("git switch -c rescued a1b2c3d")
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(31pt)
#card(
  "Safe Force-Push & Cleaning Untracked Files",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        - *NEVER use `git push --force`!* Use #cmd("git push --force-with-lease") — it aborts if a teammate pushed new commits you haven't seen!
      ],
      [
        #set text(size: 8.9pt)
        - *Clean Untracked Junk:* Dry-run first: #cmd("git clean -nd"), then delete untracked files/folders with #cmd("git clean -fd").
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(31pt)
#did-you-know[Even after a scary `git reset --hard`, your committed work is *almost never lost* for at least 30 days—`git reflog` remembers every commit `HEAD` ever pointed to!]

#pagebreak()

// =========================================================================
// PAGE 6: GITHUB MASTERY, OPEN-SOURCE PRS & GITHUB CLI
// =========================================================================
#section-banner("05", "GITHUB MASTERY, OPEN-SOURCE PRS & GITHUB CLI", "Fork → Clone → PR Workflow, gh CLI, Pages & Markdown Badges")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "5-Step Open-Source Contribution Workflow (Fork & PR)",
    [
      #set text(size: 8.9pt)
      1. *Fork* the target repo on GitHub to your own account.
      2. *Clone* your fork: #cmd("git clone git@github.com:YOU/repo.git")
      3. Add original repo as `upstream`: #cmd("git remote add upstream <orig-url>")
      4. Create feature branch (`git switch -c fix/typo`), commit, and push to `origin`.
      5. Click *"Compare & Pull Request"* on GitHub, explain changes clearly, and respond to review comments!
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "GitHub CLI (`gh`) — Control GitHub from Terminal",
    [
      #set text(size: 8.9pt)
      Install from `cli.github.com` & login (`gh auth login`):
      - Create repo & push in 1 cmd: #cmd("gh repo create my-app --public --push")
      - Open a Pull Request: #cmd("gh pr create --fill")
      - Check PRs & CI status: #cmd("gh pr list") · #cmd("gh pr checkout 42")
      - View Issues: #cmd("gh issue list") · #cmd("gh run watch")
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(48pt)

#card(
  "GitHub Profile Power-Ups (Stand Out to Tech Recruiters)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        - *Profile README:* Create a repo named *exactly your username* (`github.com/Rahul/Rahul`) with `README.md` to display a custom bio & stats on your profile!
        - *Pin Top 6 Repos:* Pin your best full-stack/AI projects with live demo URLs, screenshots, and `shields.io` badges.
      ],
      [
        #set text(size: 8.9pt)
        - *GitHub Pages (Free Hosting):* Host static HTML/React/Vite portfolios free at `username.github.io` (*Settings → Pages*).
        - *Branch Protection Rules:* Require 1 PR approval + passing CI checks before anyone can merge into `main`!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(48pt)
#card(
  "Essential `README.md` Markdown Cheat Sheet",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        - `# H1`, `## H2`, `**Bold**`, `*Italic*`, `` `inline code` ``
        - `[Link Text](https://url)` · `![Alt](screenshot.png)`
      ],
      [
        #set text(size: 8.9pt)
        - Fenced code blocks: ```` ```bash ... ``` ````
        - Task list: `- [x] Done` · `- [ ] Todo` · Alerts: `> [!NOTE]`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(48pt)
#did-you-know[You can press `.` (the period key) on *any* GitHub repository page to open a full browser-based *VS Code editor* (`github.dev`) instantly—zero installation required!]

#pagebreak()

// =========================================================================
// PAGE 7: GITHUB ACTIONS (CI/CD) & TEAM WORKFLOWS
// =========================================================================
#section-banner("06", "GITHUB ACTIONS (CI/CD) & TEAM WORKFLOWS", "Automated Testing, Deployment, Git Flow vs GitHub Flow & Tags")

#grid(
  columns: (1.05fr, 0.95fr),
  gutter: 7pt,
  card(
    "GitHub Actions CI/CD Workflow (`.github/workflows/ci.yml`)",
    [
      #set text(size: 8.9pt)
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
      - *Secrets:* Store API keys in *Settings → Secrets* and read via `${{ secrets.API_KEY }}`.
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Team Branching Strategies Compared",
    tbl(
      (auto, 1fr),
      ("Strategy", "How It Works & Best For"),
      (
        ([*GitHub Flow*], [`main` (always deployable) + short-lived feature branches + PRs. *Best for SaaS & web apps.*]),
        ([*Git Flow*], [`main` + `develop` + `feature/*` + `release/*` + `hotfix/*`. *Best for scheduled mobile/desktop releases.*]),
        ([*Trunk-Based*], [Tiny commits straight to `main` (or 1-day branches) behind feature flags. *Best for senior CI/CD teams.*]),
      ),
      pad-y: 7pt,
      fsize: 8.9pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(46pt)

#card(
  "Semantic Versioning (`v1.2.3`), Git Tags & Dependabot",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        - *SemVer (`MAJOR.MINOR.PATCH`):* `2.1.4` → `MAJOR` (breaking change), `MINOR` (new feature), `PATCH` (bugfix).
        - *Create & Push Tag:* #cmd("git tag -a v1.0.0 -m \"Launch\"") → #cmd("git push origin v1.0.0")
      ],
      [
        #set text(size: 8.9pt)
        - *GitHub Releases:* Attach compiled `.zip`/`.exe` binaries & changelogs to any tag.
        - *Dependabot:* Auto-opens PRs when `npm`/`pip` packages have security vulnerabilities!
      ]
    )
  ],
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(46pt)
#card(
  "CI/CD Auto-Deploy Triggers & Pull Request Checks",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        - *Scheduled Cron Jobs:* Run nightly tests or scrapers free via `schedule: - cron: "0 2 * * *"`.
      ],
      [
        #set text(size: 8.9pt)
        - *Auto-Deploy:* Connect GitHub repo to *Vercel, Netlify, or Render* — every `git push origin main` deploys live in 30 seconds!
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(46pt)
#did-you-know[GitHub Actions gives *2,000 free CI/CD minutes/month* on private repos and *unlimited free minutes* on public open-source repos!]

#pagebreak()

// =========================================================================
// PAGE 8: AI + GIT/GITHUB, BISECT, HOOKS & SUBMODULES
// =========================================================================
#section-banner("07", "AI + GIT/GITHUB, GIT BISECT, HOOKS & PRO TOOLS", "GitHub Copilot, AI Commit/PR Workflows, git bisect & Pre-Commit Hooks")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "AI + Git & GitHub (2026–27 Developer Superpowers)",
    [
      #set text(size: 8.9pt)
      - *GitHub Copilot CLI (`gh copilot`):* Ask in plain English: #cmd("gh copilot suggest \"undo last commit keep files\"") or `gh copilot explain`!
      - *AI PR Summaries & Reviews:* Copilot / CodeRabbit automatically reads PR diffs, flags security/null bugs, and writes review summaries.
      - *AI Commit Messages:* VS Code / Cursor *"Sparkle ✨"* button reads `git diff --staged` and generates Conventional Commit messages in 1 click!
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "`git bisect` (Find Any Bug Commit in Seconds via Binary Search)",
    [
      #set text(size: 8.9pt)
      Bug appeared somewhere in the last 1,000 commits? Binary search finds it in just *10 steps*!
      1. #cmd("git bisect start")
      2. #cmd("git bisect bad") (current commit is broken)
      3. #cmd("git bisect good v1.0.0") (old tag worked)
      4. Git jumps to midpoint—test & mark `good` or `bad` until culprit commit appears → #cmd("git bisect reset")
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  )
)

#v(45pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Git Hooks (`pre-commit` / Husky) — Auto-Check Before Commit",
    [
      #set text(size: 8.9pt)
      - Scripts inside `.git/hooks/` run automatically before `git commit` or `git push`.
      - Use *Husky* (JS/Node) or *`pre-commit`* (Python) to run `eslint`, `ruff`, `prettier`, and secret scanners (`gitleaks`) so broken or secret-leaking code is blocked locally!
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "`git worktree` & Git LFS (Large Files)",
    [
      #set text(size: 8.9pt)
      - *`git worktree add ../hotfix main`:* Work on 2 branches in 2 separate folders *simultaneously* without stashing!
      - *Git LFS:* Never store 100 MB+ `.mp4`/`.pt` weights in normal Git—use #cmd("git lfs track \"*.pt\"") so repo clones stay fast.
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(45pt)
#card(
  "Pro Git Aliases (Save 100+ Keystrokes Every Day)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        - #cmd("git config --global alias.st \"status -s\"")
        - #cmd("git config --global alias.co \"switch\"")
      ],
      [
        #set text(size: 8.9pt)
        - #cmd("git config --global alias.cm \"commit -m\"")
        - #cmd("git config --global alias.lg \"log --oneline --graph -15\"")
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(45pt)
#did-you-know[If you have 1,024 commits to search for a regression bug, `git bisect` needs at most $log_2(1024) = 10$ checks instead of testing 1,024 commits manually!]

#pagebreak()

// =========================================================================
// PAGE 9: TOP GIT/GITHUB REPOS, PRACTICE SITES & OPEN-SOURCE CAREERS
// =========================================================================
#section-banner("08", "TOP LEARNING SITES, GITHUB REPOS & OPEN-SOURCE CAREERS", "Interactive Git Practice, First Contributions, GSoC & Resume Blueprint")

#card(
  "Best Free Websites & GitHub Repos to Master Git & Open Source (Clickable)",
  tbl(
    (auto, 1fr, auto),
    ("Site / Repo", "What You Practice & Learn (100% Free)", "Direct Link"),
    (
      ([*Learn Git Branching*], [Visual interactive game to master branch, merge & rebase], [#link("https://learngitbranching.js.org")[`learngitbranching.js.org`]]),
      ([*GitHub Skills*], [Official interactive courses on PRs, Actions & Copilot], [#link("https://skills.github.com")[`skills.github.com`]]),
      ([*First Contributions*], [Guided repo to make your very first Open-Source PR in 5 mins], [#link("https://github.com/firstcontributions/first-contributions")[`firstcontributions/first-...`]]),
      ([*Pro Git Book*], [Official free deep-dive book by Scott Chacon & Ben Straub], [#link("https://git-scm.com/book")[`git-scm.com/book`]]),
      ([*Oh My Git!*], [Open-source game visualizing Git internals & commits], [#link("https://ohmygit.org")[`ohmygit.org`]]),
      ([*GitHub Explore*], [Discover trending daily AI, Python & Web repositories], [#link("https://github.com/explore")[`github.com/explore`]]),
      ([*Shields.io*], [Create clean status/tech badges for your README.md], [#link("https://shields.io")[`shields.io`]]),
    ),
    pad-y: 6.5pt,
    fsize: 7.8pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(6.5pt)

#card(
  "Open-Source & Career Guide (GSoC, Hacktoberfest & Internships)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 7.8pt)
        - *Google Summer of Code (GSoC):* Paid remote open-source internship (₹1.2L–₹2.5L+ stipend); start contributing to `good first issue` labels 3 months early!
        - *Hacktoberfest (October):* Submit 4 quality PRs to earn digital badges & real-world team review experience.
      ],
      [
        #set text(size: 7.8pt)
        - *GitHub Student Developer Pack:* Verify college email at `education.github.com` to unlock *free GitHub Copilot Pro*, domains, cloud credits & JetBrains IDEs!
        - *Green Squares Tip:* Consistent small commits + clean PRs + detailed READMEs beat empty fork spam.
      ]
    )
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(6.5pt)
#card(
  "Top 10 Most-Starred GitHub Repos of All Time (Explore & Learn Free)",
  tbl(
    (auto, auto, 1fr, auto),
    ("#", "Repository", "Why Every Student Should Star & Explore It", "Stars"),
    (
      ([*1*], [#link("https://github.com/codecrafters-io/build-your-own-x")[`codecrafters-io/build-your-own-x`]], [Build Git, Docker, Redis & React from scratch], [350K+ ⭐]),
      ([*2*], [#link("https://github.com/freeCodeCamp/freeCodeCamp")[`freeCodeCamp/freeCodeCamp`]], [Free full-stack web, Python & SQL certifications], [410K+ ⭐]),
      ([*3*], [#link("https://github.com/sindresorhus/awesome")[`sindresorhus/awesome`]], [Master directory of curated tech awesome-lists], [340K+ ⭐]),
      ([*4*], [#link("https://github.com/EbookFoundation/free-programming-books")[`EbookFoundation/free-programming-books`]], [Thousands of free coding books in 20+ languages], [345K+ ⭐]),
      ([*5*], [#link("https://github.com/public-apis/public-apis")[`public-apis/public-apis`]], [1,000+ free APIs for weather, AI, finance & cricket apps], [320K+ ⭐]),
      ([*6*], [#link("https://github.com/kamranahmedse/developer-roadmap")[`kamranahmedse/developer-roadmap`]], [Interactive Frontend, Backend, DevOps & AI roadmaps], [305K+ ⭐]),
      ([*7*], [#link("https://github.com/jwasham/coding-interview-university")[`jwasham/coding-interview-university`]], [Complete DSA & CS study plan for FAANG interviews], [310K+ ⭐]),
      ([*8*], [#link("https://github.com/donnemartin/system-design-primer")[`donnemartin/system-design-primer`]], [Learn scalable system design & architecture interviews], [280K+ ⭐]),
      ([*9*], [#link("https://github.com/vinta/awesome-python")[`vinta/awesome-python`]], [Best Python frameworks, libraries & tools list], [230K+ ⭐]),
      ([*10*], [#link("https://github.com/torvalds/linux")[`torvalds/linux`]], [The Linux Kernel source code — Git's original birthplace!], [185K+ ⭐]),
    ),
    pad-y: 3pt,
    fsize: 7.2pt
  ),
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(6.5pt)
#did-you-know[Students with a valid college email can unlock the *GitHub Student Developer Pack* (`education.github.com`) and get *GitHub Copilot Pro*, free `.me` domains, and cloud credits completely FREE!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 GIT INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "TOP 10 GIT & GITHUB INTERVIEW Q&A & AUTHOR PROFILE", "Tech Interview Prep · Credentials, Motto & Direct Support")

#card(
  "Top 10 Git & GitHub Interview Questions",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.9pt)
        *1. Git vs GitHub?* Git is a local distributed version control CLI tool; GitHub is a cloud platform hosting Git repos with PRs, Issues & CI/CD. \
        *2. `git fetch` vs `git pull`?* `fetch` downloads remote updates safely without touching your working files; `pull` runs `fetch` + `merge` (or `rebase`) immediately. \
        *3. `git merge` vs `git rebase`?* `merge` preserves full branch history with a merge commit; `rebase` replays commits linearly on top of target branch. \
        *4. `git reset` vs `git revert`?* `reset` rewrites history (use locally only); `revert` creates a new inverse commit (safe for shared `main`). \
        *5. `--soft` vs `--mixed` vs `--hard`?* `--soft` keeps edits staged; `--mixed` keeps edits unstaged; `--hard` wipes edits completely.
      ],
      [
        #set text(size: 8.9pt)
        *6. What is Staging Area (Index)?* Intermediate buffer between Working Dir & Local Repo where you craft clean, atomic commits via `git add`. \
        *7. Detached `HEAD` state?* `HEAD` points directly to a commit SHA instead of a branch name; fix by creating a branch (`git switch -c fix`). \
        *8. How to fix a merge conflict?* Edit file to keep desired code, remove `<<< === >>>` markers, `git add`, then `git commit`. \
        *9. What is `git stash`?* Temporarily shelves uncommitted changes so you can switch branches cleanly and restore later via `git stash pop`. \
        *10. How to recover a deleted commit?* Run `git reflog` to find its SHA hash, then `git switch -c rescue <sha>`.
      ]
    )
  ],
  head-bg: rgb("#fff7ed"),
  title-color: rgb("#9a3412")
)

#v(19pt)

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
          *Credentials & Practical Track:* #hl-o("Systems Architect & DevOps Trainer") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · Director & Lead IT Trainer, IANT Computer Education, Palanpur · *10+ Years IT Experience · 3,000+ Students Trained*.
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8.9pt)[
            *Our RTechLab Motto:* _"Technology Made Practical — Code, Commit & Ship. Your GitHub profile is your real-world resume—build consistently, commit cleanly, and never stop shipping. Built in India so every student gets ₹2,200-grade clarity for ₹22."_
          ]
        )
      ]
    )
  ]
)

#v(19pt)

// 4 SCANNABLE QR CODES
#card(
  "Scan & Connect with RTechLab Ecosystem (Free Labs, Tools & Updates)",
  [
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 7pt,
      align: center,
      [
        #image("02_BRAND_ASSETS/qr_rahul_portfolio.png", width: 29mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[RTechLab & Tools] \
        #link("https://rtechlab.com/tools")[#text(size: 7pt, fill: rgb("#ea580c"))[rtechlab.com/tools]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_youtube_rtechlab.png", width: 29mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[YouTube Labs] \
        #link("https://www.youtube.com/@RTechLabOfficial")[#text(size: 7pt, fill: rgb("#dc2626"))[\@RTechLabOfficial]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_instagram_rtechlab.png", width: 29mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[Instagram Reels] \
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily Dev Bytes]]
      ],
      [
        #image("02_BRAND_ASSETS/qr_whatsapp_community.png", width: 29mm)
        #v(2.5pt)
        #text(size: 7.8pt, weight: "bold", fill: rgb("#0f172a"))[WhatsApp Channel] \
        #link("https://wa.me/917646892094")[#text(size: 7pt, fill: rgb("#16a34a"))[Job & Note Alerts]]
      ]
    )
  ],
  head-bg: rgb("#f8fafc"),
  title-color: rgb("#0f172a")
)

#v(19pt)

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
      #text(size: 9.2pt, weight: "bold", fill: rgb("#14532d"))[RTechLab Student Help Desk & Career Guidance] \
      #text(size: 7.8pt, fill: rgb("#166534"))[Stuck on a Git merge conflict, SSH setup, or Open-Source PR? Message our desk on WhatsApp!]
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
