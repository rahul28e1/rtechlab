#set document(
  title: "RTechLab — Python Programming & Automation Quick Desk Cheat Sheet (English)",
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
          #text(weight: "bold", fill: rgb("#0f172a"))[Python Programming & Automation]
          #text(fill: rgb("#64748b"))[ · 10-Page Quick Desk Reference (English)]
        ],
        [
          #text(fill: rgb("#2563eb"), weight: "bold")[rtechlab.com/tools]
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
        [© RTechLab Original Edition · Learn · Code · Automate · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[Page #p of 10]]]
      )
    ]
  }
)

#set text(font: "Segoe UI", size: 9pt, fill: rgb("#1e293b"))
#set par(leading: 0.94em, justify: false)

// --- HELPER COMPONENTS ---
#let section-banner(num, title, subtitle, bg: rgb("#0f172a"), accent: rgb("#2563eb")) = {
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
      text(fill: rgb("#93c5fd"), size: 7.9pt, weight: "semibold")[#subtitle]
    )
  )
  v(9pt)
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
    text(font: "Consolas", size: 7.8pt, fill: rgb("#38bdf8"))[#code]
  )
}

#let hl-y(t) = box(fill: rgb("#fef08a"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#713f12"))[#t])
#let hl-g(t) = box(fill: rgb("#dcfce7"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#14532d"))[#t])
#let hl-b(t) = box(fill: rgb("#dbeafe"), inset: (x: 2.5pt, y: 0.8pt), radius: 1.5pt, text(weight: "bold", fill: rgb("#1e3a8a"))[#t])

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

#let tbl(cols, headers, rows, pad-y: 5.5pt, fsize: 8.2pt) = {
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
    #image("02_BRAND_ASSETS/python_cover.jpg", width: 210mm, height: 297mm, fit: "cover")
  ]
]

#pagebreak()

// =========================================================================
// PAGE 2: PYTHON SETUP, VARIABLES, DATA TYPES, OPERATORS & F-STRINGS
// =========================================================================
#section-banner("01", "PYTHON SETUP, DATA TYPES, OPERATORS & STRINGS", "Python 3.12+ · Variables, Type Casting, F-Strings & Slicing")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Core Primitive Data Types & Type Casting",
    tbl(
      (auto, auto, 1fr),
      ("Type", "Example", "Notes & Casting"),
      (
        ([`int`], [`42`, `-7`, `1_000`], [Unlimited precision integers; `int("42")`]),
        ([`float`], [`3.14`, `1e-5`], [64-bit IEEE 754 floating point; `float("3.5")`]),
        ([`str`], [`"RTech"`, `'Hi'`], [Immutable Unicode text; `str(100)`]),
        ([`bool`], [`True`, `False`], [Truthy vs Falsy (`0, "", [], None` = `False`)]),
        ([`NoneType`], [`None`], [Represents absence of value (`x is None`)]),
      ),
      pad-y: 6.8pt,
      fsize: 8.9pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Environment Setup & Virtual Environments (`venv`)",
    [
      #set text(size: 9pt)
      - *Install Python:* Download from #link("https://www.python.org")[`python.org`] (check *"Add Python to PATH"* on Windows!).
      - *Check Version:* #cmd("python --version") · #cmd("pip --version")
      - *Create Isolated Project Env:* #cmd("python -m venv .venv")
      - *Activate (Win / Linux):* `.venv\Scripts\activate` | `source .venv/bin/activate`
      - *Install & Freeze Packages:* #cmd("pip install requests pandas") → #cmd("pip freeze > requirements.txt")
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(14pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Essential Python Operators (Exam & Interview Trap)",
    tbl(
      (auto, auto, 1fr),
      ("Operator", "Example", "Meaning / Behavior"),
      (
        ([`//` & `%`], [`7 // 2 = 3`, `7 % 2 = 1`], [Floor division & Modulo (remainder)]),
        ([`**`], [`2 ** 5 = 32`], [Exponentiation (power)]),
        ([`==` vs `is`], [`a == b` vs `a is None`], [`==` compares *value*; `is` compares *memory ID*]),
        ([`in`], [`"py" in "python"`], [Membership test (`True`)]),
        ([`:=`], [`if (n := len(a)) > 3:`], [Walrus operator (assign + test inline)]),
      ),
      pad-y: 6.5pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "F-Strings, String Slicing & Top Methods",
    [
      #set text(size: 9pt)
      - *F-Strings (Fastest & Cleanest):* `f"Price: ₹{price:,.2f} | {name=}"`
      - *Slicing `[start:stop:step]`:* `"PYTHON"[0:3]` → `"PYT"` · `"PYTHON"[::-1]` → `"NOHTYP"` (reverse!).
      - *Must-Know Methods:* `.strip()`, `.lower()`, `.upper()`, `.replace("a","b")`, `.split(",")`, `",".join(lst)`, `.startswith()`, `.isdigit()`.
      - *User Input:* `age = int(input("Enter age: "))`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(20pt)
#card(
  "Must-Know Built-in Functions (`len, range, sorted, type, isinstance`)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 9pt)
        - `len(obj)`, `type(x)`, `isinstance(x, (int, float))`
        - `range(start, stop, step)` → `list(range(0, 10, 2))` (`[0,2,4,6,8]`)
      ],
      [
        #set text(size: 9pt)
        - `min()`, `max()`, `sum()`, `abs()`, `round(3.14159, 2)`
        - `sorted(items, key=len, reverse=True)` · `dir(obj)` · `help(str)`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(20pt)
#did-you-know[Python uses *indentation (4 spaces)* instead of `{}` curly braces to define code blocks—and `if (n := len(items)) > 0:` (Walrus Operator) lets you compute and check a length in one line!]

#pagebreak()

// =========================================================================
// PAGE 3: DATA STRUCTURES (LIST, TUPLE, SET, DICT & COMPREHENSIONS)
// =========================================================================
#section-banner("02", "PYTHON DATA STRUCTURES & COMPREHENSIONS", "Lists, Tuples, Sets, Dictionaries · Slicing & O(1) Lookups")

#card(
  "Core Data Structures Comparison Visual",
  [
    #align(center)[#image("02_BRAND_ASSETS/python_datatypes_visual.png", width: 96%)]
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(31pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Lists `[ ]` & Tuples `( )` Cheat Sheet",
    [
      #set text(size: 9pt)
      - *List Creation & Edit:* `nums = [10, 20, 30]`
        - `.append(40)` (add end), `.insert(1, 15)`, `.extend([50, 60])`
        - `.pop()` (remove & return last), `.remove(20)`, `.sort(reverse=True)`
        - `sorted(nums)` returns a *new* sorted list without mutating original!
      - *Tuple (Immutable):* `pt = (10, 20)` · Single-item tuple needs comma: `(5,)`.
      - *Unpacking:* `x, y, *rest = [1, 2, 3, 4]` → `x=1, y=2, rest=[3, 4]`.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "Dictionaries `{k: v}` & Sets `{ }` Cheat Sheet",
    [
      #set text(size: 9pt)
      - *Dictionary:* `user = {"name": "Rahul", "role": "Dev"}`
        - Safe lookup (no `KeyError`): `user.get("city", "Unknown")`
        - Loop items: `for k, v in user.items():`
        - Merge dicts (3.9+): `merged = d1 | d2`
      - *Sets (Unique Items):* `s = {1, 2, 3}` (Empty set = `set()`, NOT `{}`!).
        - Union `a | b`, Intersection `a & b`, Difference `a - b`.
        - Instant deduplication: `unique = list(set(my_list))`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(31pt)

#card(
  "List, Dict & Set Comprehensions (Write Clean 1-Liners)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 9pt)
        - *List Comp:* `squares = [x**2 for x in range(1, 6)]`
        - *With Filter:* `evens = [x for x in nums if x % 2 == 0]`
      ],
      [
        #set text(size: 9pt)
        - *Dict Comp:* `prices = {k: v*1.18 for k, v in items.items()}`
        - *Generator Exp (Memory Safe):* `sum(x*x for x in range(1_000_000))`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(31pt)
#did-you-know[Checking `if x in my_set:` or `if x in my_dict:` takes *O(1) constant time* (even with 10 million items!), whereas `if x in my_list:` scans item-by-item in *O(n) linear time*!]

#pagebreak()

// =========================================================================
// PAGE 4: CONTROL FLOW, FUNCTIONS, LAMBDA & DECORATORS
// =========================================================================
#section-banner("03", "CONTROL FLOW, FUNCTIONS, LAMBDA & DECORATORS", "Loops, enumerate/zip, *args/**kwargs, Scope & Higher-Order Functions")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Conditionals, Loops & Pythonic Iteration",
    [
      #set text(size: 9pt)
      - *If / Elif / Else + Ternary:*
        `status = "Pass" if score >= 40 else "Fail"`
      - *Match-Case (Python 3.10+):* Clean switch-case replacement for commands/APIs.
      - *For Loop + `enumerate` + `zip`:*
        ```python
        for idx, val in enumerate(names, start=1):
            print(idx, val)
        for name, mark in zip(names, marks):
            print(f"{name}: {mark}")
        ```
      - *Control:* `break` (exit loop), `continue` (skip iteration), `pass` (placeholder).
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Functions, `*args`, `**kwargs` & Type Hints",
    [
      #set text(size: 9pt)
      ```python
      def calc_total(price: float, tax: float = 0.18) -> float:
          return round(price * (1 + tax), 2)
      ```
      - *`*args` (Tuple):* Accepts any number of positional arguments (`def add(*nums):`).
      - *`**kwargs` (Dict):* Accepts any number of keyword arguments (`def cfg(**opts):`).
      - *Mutable Default Pitfall:* NEVER write `def f(x=[]):` — use `def f(x=None): x = x or []`!
      - *LEGB Scope Rule:* Local → Enclosing → Global → Built-in.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(38pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Lambda, `map`, `filter` & `any`/`all`",
    [
      #set text(size: 9pt)
      - *Lambda (1-line anon func):* `square = lambda x: x * x`
      - *Sort by Dict Key:* `users.sort(key=lambda u: u["age"])`
      - *`map` & `filter`:* `list(map(str.upper, words))` · `list(filter(lambda x: x > 0, nums))`
      - *`any()` & `all()`:* `any(x > 90 for x in marks)` · `all(u.active for u in users)`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "Decorators & Generators (`yield`)",
    [
      #set text(size: 9pt)
      - *Decorator (`@timer`):* Wraps a function to add logging, auth, or timing without editing it!
      ```python
      def log_call(fn):
          def wrapper(*a, **kw):
              print("Running:", fn.__name__)
              return fn(*a, **kw)
          return wrapper
      ```
      - *Generator (`yield`):* Yields 1 item at a time lazily—perfect for reading 10 GB log files!
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(38pt)
#card(
  "PEP 8 Clean Code & Pythonic Idioms (Write Senior-Level Python)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 9pt)
        - *Naming:* `snake_case` for variables/functions, `PascalCase` for Classes, `UPPER_SNAKE` for constants.
        - *Truthiness:* Write `if items:` instead of `if len(items) > 0:`.
      ],
      [
        #set text(size: 9pt)
        - *Swap in 1 Line:* `a, b = b, a` (no temp variable needed!).
        - *Docstrings:* Triple quotes `"""Explain what function does."""` right below `def`.
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(38pt)
#did-you-know[The #1 Python interview bug is using a mutable default argument like `def add(item, box=[]):`—because Python creates that `[]` *once* at function definition time, every call shares the same list!]

#pagebreak()

// =========================================================================
// PAGE 5: OOP, DATACLASSES & EXCEPTION HANDLING
// =========================================================================
#section-banner("04", "OBJECT-ORIENTED PYTHON (OOP) & ERROR HANDLING", "Classes, Inheritance, Dunder Methods, @dataclass & try/except")

#grid(
  columns: (1.05fr, 0.95fr),
  gutter: 7pt,
  card(
    "Classes, `__init__`, Inheritance & `super()`",
    [
      #set text(size: 8.9pt)
      ```python
      class Account:
          bank = "RTech Bank" # class attribute

          def __init__(self, owner: str, bal: float = 0):
              self.owner = owner
              self.__bal = bal # private (name-mangled)

          def deposit(self, amt: float):
              self.__bal += amt

      class SavingsAccount(Account):
          def __init__(self, owner, bal, rate=0.05):
              super().__init__(owner, bal)
              self.rate = rate
      ```
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "4 Pillars of OOP & Dunder (`__magic__`) Methods",
    tbl(
      (auto, 1fr),
      ("Concept / Dunder", "Purpose & Example"),
      (
        ([*Encapsulation*], [Bundle data + methods; prefix `_protected` or `__private`.]),
        ([*Inheritance*], [Reuse & extend parent class via `class Child(Parent):`.]),
        ([*Polymorphism*], [Same method name (`speak()`) behaves differently per class.]),
        ([*Abstraction*], [Hide internals using `abc.ABC` & `@abstractmethod`.]),
        ([`__str__` / `__repr__`], [Human-readable `print(obj)` vs developer debug string.]),
        ([`__len__` / `__eq__`], [Makes `len(obj)` and `obj1 == obj2` work natively!]),
      ),
      pad-y: 6.5pt,
      fsize: 8.8pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(52pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "`@dataclass` (Modern Clean Python Models)",
    [
      #set text(size: 9pt)
      Auto-generates `__init__`, `__repr__`, and `__eq__` with zero boilerplate!
      ```python
      from dataclasses import dataclass

      @dataclass
      class Student:
          name: str
          score: int = 0
      ```
      Use `frozen=True` to make dataclass instances immutable!
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "Exception Handling (`try / except / else / finally`)",
    [
      #set text(size: 9pt)
      ```python
      try:
          val = int(data["qty"])
      except (KeyError, ValueError) as e:
          print("Bad input:", e)
      else:
          print("Success:", val) # runs only if no error
      finally:
          conn.close() # ALWAYS runs (cleanup)
      ```
      Raise custom error: `if x < 0: raise ValueError("Must be >= 0")`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(52pt)
#did-you-know[In Python, *everything is an object*—even integers, functions, and classes themselves! That's why you can pass a function as an argument to `sorted()` or store functions inside a dictionary.]

#pagebreak()

// =========================================================================
// PAGE 6: FILE I/O, JSON, CSV, REGEX & STANDARD LIBRARY
// =========================================================================
#section-banner("05", "FILE I/O, JSON, CSV, REGEX & STANDARD LIBRARY", "pathlib, Context Managers, re, datetime & Essential Built-ins")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Modern File Handling (`with open` & `pathlib`)",
    [
      #set text(size: 9pt)
      - *Safe Read/Write (`with` auto-closes file):*
        ```python
        with open("notes.txt", "w", encoding="utf-8") as f:
            f.write("Hello RTechLab!\n")
        with open("notes.txt", "r", encoding="utf-8") as f:
            lines = f.read().splitlines()
        ```
      - *`pathlib` (Cross-Platform Paths):*
        ```python
        from pathlib import Path
        for p in Path("docs").glob("*.pdf"):
            print(p.stem, p.stat().st_size)
        ```
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "JSON & CSV Parsing (APIs & Spreadsheets)",
    [
      #set text(size: 9pt)
      - *JSON (`json` module):*
        ```python
        import json
        data = json.loads('{"id": 1, "ok": true}')
        with open("out.json", "w") as f:
            json.dump(data, f, indent=2)
        ```
      - *CSV (`csv.DictReader`):*
        ```python
        import csv
        with open("sales.csv", newline="") as f:
            rows = list(csv.DictReader(f))
        ```
      - *CLI Args:* `import sys; print(sys.argv[1:])` or `argparse`.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(42pt)

#card(
  "Essential Python Standard Library Modules (Batteries Included!)",
  tbl(
    (auto, auto, 1fr),
    ("Module", "Key Functions", "Real-World Use Case"),
    (
      ([`re` (Regex)], [`re.findall()`, `re.sub()`, `re.search()`], [Extract emails/phones: `re.findall(r"\d{10}", text)`]),
      ([`datetime`], [`datetime.now()`, `.strftime("%d-%b-%Y")`, `timedelta`], [Timestamps, log filenames, date arithmetic (`+ timedelta(days=7)`)]),
      ([`collections`], [`Counter()`, `defaultdict(list)`, `deque`], [Count word/IP frequency in 1 line: `Counter(words).most_common(5)`]),
      ([`os` / `shutil`], [`os.getenv()`, `shutil.move()`, `shutil.copy2()`], [Read `.env` API keys; bulk rename, move & zip folders]),
      ([`subprocess`], [`subprocess.run(["ping", "-n", "2", host])`], [Run shell/CLI commands & capture stdout in Python scripts]),
    ),
    pad-y: 6.6pt,
    fsize: 8.8pt
  ),
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(42pt)
#card(
  "Secrets Management (`.env`) & Packaging Your Project",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 9pt)
        - *Never hardcode API keys!* Store them in `.env` (`API_KEY=sk-...`) and add `.env` to `.gitignore`.
      ],
      [
        #set text(size: 9pt)
        - Load in Python: `from dotenv import load_dotenv; load_dotenv(); key = os.getenv("API_KEY")`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(42pt)
#did-you-know[Using `collections.Counter(list_of_items).most_common(3)` finds the top 3 most frequent errors in a 100,000-line server log in under *10 milliseconds*!]

#pagebreak()

// =========================================================================
// PAGE 7: PYTHON AUTOMATION & SCRIPTING (HANDS-ON RECIPES)
// =========================================================================
#section-banner("06", "PYTHON AUTOMATION & REAL-WORLD SCRIPTING", "Bulk File Organizer, REST APIs, Web Scraping, Excel & Email Bots")

#card(
  "Real-World Python Automation Pipeline Visual",
  [
    #align(center)[#image("02_BRAND_ASSETS/python_automation_visual.png", width: 96%)]
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(23pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Recipe 1: Auto-Organize Downloads Folder by Extension",
    [
      #set text(size: 8.8pt)
      ```python
      from pathlib import Path
      import shutil

      dl = Path.home() / "Downloads"
      for f in dl.iterdir():
          if f.is_file():
              ext = f.suffix[1:].upper() or "OTHER"
              dest = dl / ext
              dest.mkdir(exist_ok=True)
              shutil.move(str(f), str(dest / f.name))
      ```
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "Recipe 2: Fetch Live REST APIs (`requests`)",
    [
      #set text(size: 8.8pt)
      ```python
      import requests

      r = requests.get("https://api.github.com/users/torvalds", timeout=10)
      r.raise_for_status()
      data = r.json()
      print(data["name"], data["public_repos"])
      ```
      *POST JSON:* `requests.post(url, json={"msg": "Hi"}, headers={"Authorization": "Bearer ..."})`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(23pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Recipe 3: Web Scraping (`BeautifulSoup`)",
    [
      #set text(size: 8.8pt)
      ```python
      from bs4 import BeautifulSoup
      import requests

      soup = BeautifulSoup(requests.get(url).text, "html.parser")
      titles = [h.get_text(strip=True) for h in soup.select("h2.title")]
      ```
      For JS-rendered sites, use *Playwright* (`pip install playwright`).
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "Recipe 4: Auto-Send Email Reports (`smtplib`)",
    [
      #set text(size: 8.8pt)
      - Use `smtplib.SMTP_SSL("smtp.gmail.com", 465)` with a Gmail *App Password* + `EmailMessage()`.
      - Schedule any Python script to run automatically every morning via *Windows Task Scheduler* or Linux `crontab -e`!
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(23pt)
#did-you-know[You can turn any Python automation script into a standalone `.exe` app for non-technical clients using `pip install pyinstaller` and running #cmd("pyinstaller --onefile my_tool.py")!]

#pagebreak()

// =========================================================================
// PAGE 8: DATA SCIENCE, WEB APIS & AI AUTOMATION STACK
// =========================================================================
#section-banner("07", "PYTHON FOR DATA ANALYTICS, WEB APIS & AI", "Pandas, NumPy, FastAPI, SQLite & OpenAI/Gemini AI Integration")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Pandas DataFrame Cheat Sheet (Excel Killer!)",
    [
      #set text(size: 8.9pt)
      ```python
      import pandas as pd
      df = pd.read_csv("sales.csv")
      df.head(); df.info(); df.describe()

      # Filter, Group & Export
      top = (df[df["amount"] > 500]
             .groupby("city")["amount"].sum()
             .sort_values(ascending=False))
      top.to_excel("city_report.xlsx")
      ```
      - Handle nulls: `df.dropna()` or `df.fillna(0)`
      - Merge tables: `pd.merge(orders, users, on="user_id")`
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "FastAPI: Build a Production REST API in 8 Lines",
    [
      #set text(size: 8.9pt)
      ```python
      from fastapi import FastAPI
      app = FastAPI()

      @app.get("/api/square/{num}")
      def square(num: int):
          return {"input": num, "square": num * num}
      ```
      - Run server: #cmd("uvicorn main:app --reload")
      - Auto interactive Swagger UI at `http://127.0.0.1:8000/docs`!
      - *SQLite Built-in DB:* `import sqlite3` (zero-config local SQL database).
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(44pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Python + AI Automation (Gemini / OpenAI SDK)",
    [
      #set text(size: 8.9pt)
      - Install: #cmd("pip install google-genai") or #cmd("pip install openai")
      - Summarize 50 PDFs automatically: Extract text with `pymupdf` (`fitz`) → send to LLM API → save bullet summary to `.md` or Excel!
      - *Networking & Cyber:* Use `paramiko` / `netmiko` to configure 50 Cisco routers via SSH in 5 seconds, or `scapy` for packet crafting.
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "Testing & Code Quality (`pytest` & `ruff`)",
    [
      #set text(size: 8.9pt)
      - *Unit Test (`test_app.py`):*
        ```python
        def test_gst():
            assert calc_total(100, 0.18) == 118.0
        ```
      - Run all tests: #cmd("pytest -v")
      - Ultra-fast Linter & Formatter: #cmd("pip install ruff") → #cmd("ruff check . --fix")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(44pt)
#card(
  "SQLite3 Built-in Database & NumPy Vector Math Quickstart",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 9pt)
        - *SQLite3 (`sqlite3`):* `conn = sqlite3.connect("app.db"); cur = conn.cursor(); cur.execute("SELECT * FROM users WHERE id=?", (1,))` (always use `?` to stop SQLi!).
      ],
      [
        #set text(size: 9pt)
        - *NumPy (`import numpy as np`):* `a = np.array([10, 20, 30])` → `a * 2` (`[20, 40, 60]`), `a.mean()`, `a.std()`, `np.zeros((2,3))` (~50x faster than Python loops!).
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(44pt)
#did-you-know[*FastAPI* is one of the fastest Python web frameworks in existence—comparable to NodeJS and Go—and automatically validates incoming JSON & generates live API docs!]

#pagebreak()

// =========================================================================
// PAGE 9: TOP PYTHON GITHUB REPOS, PRACTICE SITES & CAREER TRACKS
// =========================================================================
#section-banner("08", "TOP GITHUB REPOS, PRACTICE SITES & CAREER TRACKS", "100% Free Learning Resources · Algorithms, Projects & Job Roadmaps")

#card(
  "Top Python GitHub Repositories & Knowledge Websites (Clickable Links)",
  tbl(
    (auto, 1fr, auto),
    ("Resource / Repo", "What You Learn & Why It's Gold", "Direct Link"),
    (
      ([*30 Days of Python*], [Step-by-step beginner to advanced hands-on repo], [#link("https://github.com/Asabeneh/30-Days-Of-Python")[`github.com/Asabeneh/30-Days...`]]),
      ([*Awesome Python*], [Curated list of best Python libraries for every domain], [#link("https://github.com/vinta/awesome-python")[`github.com/vinta/awesome-python`]]),
      ([*TheAlgorithms/Python*], [All DSA, sorting, graphs & DP implemented in Python], [#link("https://github.com/TheAlgorithms/Python")[`github.com/TheAlgorithms/Python`]]),
      ([*Automate Boring Stuff*], [Free book + scripts for Excel, PDFs, email & scraping], [#link("https://automatetheboringstuff.com")[`automatetheboringstuff.com`]]),
      ([*Real Python*], [Deep, crystal-clear Python tutorials & best practices], [#link("https://realpython.com")[`realpython.com`]]),
      ([*Kaggle Learn*], [Free micro-courses on Python, Pandas & Machine Learning], [#link("https://www.kaggle.com/learn")[`kaggle.com/learn`]]),
      ([*NeetCode / LeetCode*], [DSA coding interview practice (Blind 75 / NeetCode 150)], [#link("https://neetcode.io")[`neetcode.io`] · #link("https://leetcode.com")[`leetcode.com`]]),
    ),
    pad-y: 6.5pt,
    fsize: 8.8pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(38pt)

#card(
  "2026–27 Python Career Tracks & Must-Build Portfolio Projects",
  tbl(
    (auto, 1fr, 1fr),
    ("Career Track", "Core Libraries to Master", "Resume-Worthy Project"),
    (
      ([*Backend / API Dev*], [`FastAPI`, `Django`, `PostgreSQL`, `Redis`, `Docker`], [Auth + Payment REST API with Swagger & Pytest]),
      ([*Data / AI Engineer*], [`Pandas`, `NumPy`, `SQL`, `LangGraph`, `OpenAI/Gemini`], [Automated Sales Dashboard + RAG PDF Chatbot]),
      ([*Automation / DevOps*], [`Pathlib`, `Requests`, `Playwright`, `Paramiko`, `GitHub Actions`], [Bulk Invoice PDF Generator + Auto Email Bot]),
      ([*Cyber / NetOps*], [`Scapy`, `Netmiko`, `Socket`, `Nmap-python`], [Multi-Switch Backup Tool & Port Scanner CLI]),
    ),
    pad-y: 6.8pt,
    fsize: 8.8pt
  ),
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(38pt)
#card(
  "Future with Python (2026–2030): Why Python Stays #1",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.4pt)
        - *AI & Agentic Systems:* 90%+ of GenAI, RAG, LangGraph & MCP frameworks are *Python-first*.
        - *Ultra-Fast Python 3.13+:* JIT compiler + Free-threaded (No-GIL) builds + Rust-powered `uv`, `ruff` & `polars`!
      ],
      [
        #set text(size: 8.4pt)
        - *High-Growth Domains:* AI Engineering, Data/MLOps (`DuckDB`, `PyTorch`), Cloud/NetDevOps (`Ansible`, `Netmiko`), & Robotics/IoT (`MicroPython`).
        - *30-Day Path:* W1 Core → W2 OOP/Files → W3 APIs/Pandas → W4 Ship 1 FastAPI + AI Project!
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(38pt)
#did-you-know[Solving just *2–3 real automation problems* (like an automated GST invoice generator or bulk file sorter) on GitHub impresses Indian interviewers more than 5 generic calculator projects!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 PYTHON INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "TOP 10 PYTHON INTERVIEW Q&A & RTECHLAB AUTHOR PROFILE", "Placement & Tech Interview Prep · Credentials, Motto & Direct Support")

#card(
  "Top 10 Python Programming Interview Questions",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.8pt)
        *1. List vs Tuple?* List is mutable (`[]`, slower); Tuple is immutable (`()`, faster, hashable for dict keys). \
        *2. `==` vs `is`?* `==` checks value equality; `is` checks if both variables point to the exact same object in memory. \
        *3. Shallow vs Deep Copy?* Shallow copy (`copy.copy`) copies references to nested objects; Deep copy (`copy.deepcopy`) clones everything recursively. \
        *4. `*args` vs `**kwargs`?* `*args` collects extra positional args into a tuple; `**kwargs` collects keyword args into a dict. \
        *5. What is GIL?* Global Interpreter Lock — allows only 1 thread to execute Python bytecode at a time (use `multiprocessing` for CPU-bound tasks).
      ],
      [
        #set text(size: 8.8pt)
        *6. Generator vs List?* List loads all items into RAM; Generator (`yield`) produces 1 item at a time lazily (`O(1)` memory). \
        *7. What is a Decorator?* A function taking another function to extend its behavior (`@login_required`) without modifying its source. \
        *8. Dict lookup speed?* Average `O(1)` because Python dictionaries use a Hash Table under the hood. \
        *9. `venv` purpose?* Isolates project dependencies so Package v1 in Project A doesn't break Package v2 in Project B. \
        *10. `try-except-else-finally`?* `else` runs only if no exception occurred; `finally` *always* runs for resource cleanup.
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(21pt)

// AUTHOR & RTECHLAB MOTTO BLOCK
#box(
  width: 100%,
  fill: rgb("#0f172a"),
  radius: 4.5pt,
  inset: 9pt,
  stroke: 1.2pt + rgb("#2563eb"),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 9pt,
      align: (center + horizon, left + horizon),
      box(
        radius: 4pt,
        clip: true,
        stroke: 1.8pt + rgb("#60a5fa"),
        image("02_BRAND_ASSETS/rahul-patel.jpg", width: 31mm)
      ),
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          [
            #text(fill: rgb("#60a5fa"), size: 11.2pt, weight: "bold")[Rahul Patel]
            #h(6pt)
            #box(fill: rgb("#2563eb"), radius: 2pt, inset: (x: 5pt, y: 2pt))[
              #text(fill: white, size: 7.2pt, weight: "bold")[Founder & Systems Architect, RTechLab]
            ]
          ],
          image("02_BRAND_ASSETS/rtechlab-header-logo.png", width: 32mm)
        )
        #v(3.5pt)
        #text(fill: rgb("#e2e8f0"), size: 7.9pt)[
          *Credentials & Practical Track:* #hl-b("Python Automation & Systems Architect") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · Director & Lead IT Trainer, IANT Computer Education, Palanpur · *10+ Years IT Experience · 3,000+ Students Trained*.
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8.8pt)[
            *Our RTechLab Motto:* _"Technology Made Practical — Learn, Code & Automate. Don't just memorize syntax—build scripts that solve real problems. Built in India so every student gets ₹2,200-grade clarity for ₹22."_
          ]
        )
      ]
    )
  ]
)

#v(21pt)

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
        #link("https://rtechlab.com/tools")[#text(size: 7pt, fill: rgb("#2563eb"))[rtechlab.com/tools]]
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
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily Python Bytes]]
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

#v(21pt)

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
      #text(size: 7.8pt, fill: rgb("#166534"))[Stuck on Python errors, Automation scripts, or Interview prep? Message our desk on WhatsApp!]
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
