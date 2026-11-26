#set document(
  title: "RTechLab — Python Programming & Automation Quick Desk Cheat Sheet (Gujarati)",
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
          #text(weight: "bold", fill: rgb("#0f172a"))[Python Programming & Automation]
          #text(fill: rgb("#64748b"))[ · 10-પેજ ક્વિક ડેસ્ક ગાઈડ (ગુજરાતી આવૃત્તિ)]
        ],
        [
          #text(fill: rgb("#2563eb"), weight: "bold")[rtechlab.com/tools]
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
        [© RTechLab Original Edition · શીખો · કોડ કરો · ઓટોમેટ કરો · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[પેજ #p / 10]]]
      )
    ]
  }
)

#set text(font: ("Nirmala UI", "Segoe UI"), size: 9pt, fill: rgb("#1e293b"))
#set par(leading: 0.98em, justify: false)

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
      text(fill: white, weight: "bold", size: 10.4pt)[#title],
      text(fill: rgb("#93c5fd"), size: 7.8pt, weight: "semibold")[#subtitle]
    )
  )
  v(10pt)
}

#let card(title, body, border: rgb("#cbd5e1"), head-bg: rgb("#f8fafc"), title-color: rgb("#0f172a"), pad: 13.5pt) = {
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
    text(size: 8.3pt, fill: rgb("#78350f"))[
      *💡 શું તમે જાણો છો?* #fact
    ]
  )
}

#let tbl(cols, headers, rows, pad-y: 6.2pt, fsize: 8.4pt) = {
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
// PAGE 2: PYTHON SETUP, DATA TYPES, OPERATORS & STRINGS
// =========================================================================
#section-banner("01", "PYTHON સેટઅપ, ડેટા ટાઇપ્સ, ઓપરેટર્સ અને સ્ટ્રિંગ્સ", "Python 3.12+ · વેરિએબલ્સ, ટાઇપ કાસ્ટિંગ, F-Strings અને સ્લાઇસિંગ")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "મુખ્ય પ્રિમિટિવ ડેટા ટાઇપ્સ અને ટાઇપ કાસ્ટિંગ",
    tbl(
      (auto, auto, 1fr),
      ("ટાઇપ", "ઉદાહરણ", "નોંધ અને કાસ્ટિંગ"),
      (
        ([`int`], [`42`, `-7`, `1_000`], [અમર્યાદિત પૂર્ણાંક સંખ્યા; `int("42")`]),
        ([`float`], [`3.14`, `1e-5`], [દશાંશ સંખ્યા; `float("3.5")`]),
        ([`str`], [`"RTech"`, `'Hi'`], [ઇમ્યુટેબલ ટેક્સ્ટ; `str(100)`]),
        ([`bool`], [`True`, `False`], [`0, "", [], None` = `False` થાય છે]),
        ([`NoneType`], [`None`], [ખાલી કિંમત દર્શાવે છે (`x is None`)]),
      ),
      pad-y: 5.8pt,
      fsize: 8.4pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "ઇન્સ્ટોલેશન અને વર્ચ્યુઅલ એન્વાયર્નમેન્ટ (`venv`)",
    [
      #set text(size: 8.6pt)
      - *Python ડાઉનલોડ:* #link("https://www.python.org")[`python.org`] પરથી ડાઉનલોડ કરો (*"Add Python to PATH"* જરૂર ટિક કરો!).
      - *વર્ઝન તપાસ:* #cmd("python --version") · #cmd("pip --version")
      - *નવું `venv` બનાવો:* #cmd("python -m venv .venv")
      - *એક્ટિવેટ કરો:* `.venv\Scripts\activate` (Win) | `source .venv/bin/activate` (Linux)
      - *પેકેજ ઇન્સ્ટોલ:* #cmd("pip install requests pandas") → #cmd("pip freeze > requirements.txt")
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(25pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "જરૂરી Python ઓપરેટર્સ (ઇન્ટરવ્યુ ટ્રિક)",
    tbl(
      (auto, auto, 1fr),
      ("ઓપરેટર", "ઉદાહરણ", "અર્થ / વર્તન"),
      (
        ([`//` અને `%`], [`7 // 2 = 3`, `7 % 2 = 1`], [ફ્લોર ડિવિઝન અને શેષ (Modulo)]),
        ([`**`], [`2 ** 5 = 32`], [ઘાત (Power / Exponentiation)]),
        ([`==` vs `is`], [`a == b` vs `a is None`], [`==` *કિંમત* જુએ છે; `is` *મેમરી ID* જુએ છે]),
        ([`in`], [`"py" in "python"`], [સભ્યપદ તપાસ (`True`)]),
        ([`:=`], [`if (n := len(a)) > 3:`], [Walrus ઓપરેટર (એક લાઇનમાં અસાઇન અને તપાસ)]),
      ),
      pad-y: 5.5pt,
      fsize: 8.3pt
    ),
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "F-Strings, સ્ટ્રિંગ સ્લાઇસિંગ અને મુખ્ય મેથડ્સ",
    [
      #set text(size: 8.6pt)
      - *F-Strings (સૌથી ઝડપી):* `f"Price: ₹{price:,.2f} | {name=}"`
      - *સ્લાઇસિંગ `[start:stop:step]`:* `"PYTHON"[0:3]` → `"PYT"` · `"PYTHON"[::-1]` → `"NOHTYP"` (ઊલટું કરો!).
      - *જરૂરી મેથડ્સ:* `.strip()`, `.lower()`, `.upper()`, `.replace("a","b")`, `.split(",")`, `",".join(lst)`, `.startswith()`, `.isdigit()`.
      - *ઇનપુટ:* `age = int(input("Enter age: "))`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(25pt)
#card(
  "મુખ્ય બિલ્ટ-ઇન ફંક્શન્સ (`len, range, sorted, type, isinstance`)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - `len(obj)`, `type(x)`, `isinstance(x, (int, float))`
        - `range(start, stop, step)` → `list(range(0, 10, 2))` (`[0,2,4,6,8]`)
      ],
      [
        #set text(size: 8.6pt)
        - `min()`, `max()`, `sum()`, `abs()`, `round(3.14159, 2)`
        - `sorted(items, key=len, reverse=True)` · `dir(obj)` · `help(str)`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(25pt)
#did-you-know[Python કોડ બ્લોક માટે `{}` બ્રેકેટને બદલે *ઇન્ડેન્ટેશન (4 સ્પેસ)* વાપરે છે — અને `if (n := len(items)) > 0:` (Walrus Operator) એક જ લાઇનમાં કિંમત કાઢીને સરખામણી કરી દે છે!]

#pagebreak()

// =========================================================================
// PAGE 3: DATA STRUCTURES
// =========================================================================
#section-banner("02", "PYTHON ડેટા સ્ટ્રક્ચર્સ અને કોમ્પ્રિહેન્શન", "Lists, Tuples, Sets, Dictionaries · સ્લાઇસિંગ અને O(1) લુકઅપ")

#card(
  "મુખ્ય ડેટા સ્ટ્રક્ચર્સ તુલનાત્મક વિઝ્યુઅલ",
  [
    #align(center)[#image("02_BRAND_ASSETS/python_datatypes_visual.png", width: 96%)]
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(32pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Lists `[ ]` અને Tuples `( )` ચીટ શીટ",
    [
      #set text(size: 8.6pt)
      - *લિસ્ટ બનાવવું અને બદલવું:* `nums = [10, 20, 30]`
        - `.append(40)` (અંતે ઉમેરો), `.insert(1, 15)`, `.extend([50, 60])`
        - `.pop()` (છેલ્લું હટાવો), `.remove(20)`, `.sort(reverse=True)`
        - `sorted(nums)` મૂળ લિસ્ટ બદલ્યા વગર *નવી* સોર્ટેડ લિસ્ટ આપે છે!
      - *Tuple (અપરિવર્તનીય):* `pt = (10, 20)` · 1 આઇટમ માટે કોમા જરૂરી: `(5,)`.
      - *Unpacking:* `x, y, *rest = [1, 2, 3, 4]` → `x=1, y=2, rest=[3, 4]`.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "Dictionaries `{k: v}` અને Sets `{ }` ચીટ શીટ",
    [
      #set text(size: 8.6pt)
      - *ડિક્શનરી:* `user = {"name": "Rahul", "role": "Dev"}`
        - સુરક્ષિત લુકઅપ (`KeyError` થી બચો): `user.get("city", "Unknown")`
        - લૂપ ચલાવો: `for k, v in user.items():`
        - બે ડિક્ટ જોડો (3.9+): `merged = d1 | d2`
      - *Sets (માત્ર અનોખી આઇટમ):* `s = {1, 2, 3}` (ખાલી સેટ = `set()`, `{}` નહીં!).
        - Union `a | b`, Intersection `a & b`, Difference `a - b`.
        - તરત ડુપ્લિકેટ હટાવો: `unique = list(set(my_list))`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(32pt)

#card(
  "List, Dict અને Set કોમ્પ્રિહેન્શન (1-લાઇનર કોડ લખો)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *List Comp:* `squares = [x**2 for x in range(1, 6)]`
        - *ફિલ્ટર સાથે:* `evens = [x for x in nums if x % 2 == 0]`
      ],
      [
        #set text(size: 8.6pt)
        - *Dict Comp:* `prices = {k: v*1.18 for k, v in items.items()}`
        - *Generator (ઓછી મેમરી):* `sum(x*x for x in range(1_000_000))`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(32pt)
#did-you-know[`if x in my_set:` કે `if x in my_dict:` માં *O(1) સ્થિર સમય* લાગે છે (ભલે 1 કરોડ આઇટમ હોય!), જ્યારે `if x in my_list:` દરેક આઇટમ તપાસે છે (*O(n)* સમય)!]

#pagebreak()

// =========================================================================
// PAGE 4: CONTROL FLOW, FUNCTIONS, LAMBDA & DECORATORS
// =========================================================================
#section-banner("03", "કંટ્રોલ ફ્લો, ફંક્શન્સ, LAMBDA અને DECORATORS", "લૂપ્સ, enumerate/zip, *args/**kwargs, સ્કોપ અને PEP 8")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "કન્ડિશનલ્સ, લૂપ્સ અને Pythonic ઇટરેશન",
    [
      #set text(size: 8.6pt)
      - *If / Elif / Else + Ternary:*
        `status = "Pass" if score >= 40 else "Fail"`
      - *Match-Case (Python 3.10+):* કમાન્ડ્સ અને API માટે ચોખ્ખો switch-case વિકલ્પ.
      - *For લૂપ + `enumerate` + `zip`:*
        ```python
        for idx, val in enumerate(names, start=1):
            print(idx, val)
        for name, mark in zip(names, marks):
            print(f"{name}: {mark}")
        ```
      - *નિયંત્રણ:* `break` (લૂપ રોકો), `continue` (આગળનું સ્ટેપ), `pass` (ખાલી બ્લોક).
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "ફંક્શન્સ, `*args`, `**kwargs` અને ટાઇપ હિન્ટ્સ",
    [
      #set text(size: 8.6pt)
      ```python
      def calc_total(price: float, tax: float = 0.18) -> float:
          return round(price * (1 + tax), 2)
      ```
      - *`*args` (Tuple):* ગમે તેટલા પોઝિશનલ આર્ગ્યુમેન્ટ લો (`def add(*nums):`).
      - *`**kwargs` (Dict):* ગમે તેટલા કીવર્ડ આર્ગ્યુમેન્ટ લો (`def cfg(**opts):`).
      - *ખતરનાક ભૂલ:* ક્યારેય `def f(x=[]):` ન લખો — `def f(x=None): x = x or []` લખો!
      - *LEGB નિયમ:* Local → Enclosing → Global → Built-in.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(34pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Lambda, `map`, `filter` અને `any`/`all`",
    [
      #set text(size: 8.6pt)
      - *Lambda (1-લાઇન ફંક્શન):* `square = lambda x: x * x`
      - *ડિક્ટ સોર્ટ કરો:* `users.sort(key=lambda u: u["age"])`
      - *`map` અને `filter`:* `list(map(str.upper, words))` · `list(filter(lambda x: x > 0, nums))`
      - *`any()` અને `all()`:* `any(x > 90 for x in marks)` · `all(u.active for u in users)`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "Decorators અને Generators (`yield`)",
    [
      #set text(size: 8.6pt)
      - *Decorator (`@timer`):* કોડ બદલ્યા વગર ફંક્શનમાં લોગિંગ, ઓથ કે ટાઇમર ઉમેરે છે!
      ```python
      def log_call(fn):
          def wrapper(*a, **kw):
              print("Running:", fn.__name__)
              return fn(*a, **kw)
          return wrapper
      ```
      - *Generator (`yield`):* એક સમયે 1 આઇટમ આપે છે — 10 GB લોગ ફાઇલ વાંચવા માટે બેસ્ટ!
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(34pt)
#card(
  "PEP 8 ક્લીન કોડ અને Pythonic નિયમો (સીનિયર જેવો કોડ લખો)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *નામકરણ:* વેરિએબલ/ફંક્શન માટે `snake_case`, ક્લાસ માટે `PascalCase`, કોન્સ્ટન્ટ માટે `UPPER_SNAKE`.
        - *Truthiness:* `if len(items) > 0:` ને બદલે `if items:` લખો.
      ],
      [
        #set text(size: 8.6pt)
        - *1 લાઇનમાં સ્વેપ:* `a, b = b, a` (કોઈ ટેમ્પ વેરિએબલની જરૂર નથી!).
        - *Docstrings:* `def` ની બરાબર નીચે ટ્રિપલ કોટ્સ `"""..."""` માં વર્ણન લખો.
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(34pt)
#did-you-know[Python ઇન્ટરવ્યુની #1 ભૂલ `def add(item, box=[]):` લખવી છે — કારણ કે Python તે `[]` ને ફક્ત *એક જ વાર* બનાવે છે, તેથી દરેક કોલમાં તે જ જૂની લિસ્ટ શેર થાય છે!]

#pagebreak()

// =========================================================================
// PAGE 5: OOP, DATACLASSES & EXCEPTION HANDLING
// =========================================================================
#section-banner("04", "ઓબ્જેક્ટ-ઓરિએન્ટેડ PYTHON (OOP) અને એરર હેન્ડલિંગ", "Classes, Inheritance, Dunder મેથડ્સ, @dataclass અને try/except")

#grid(
  columns: (1.05fr, 0.95fr),
  gutter: 7pt,
  card(
    "Classes, `__init__`, Inheritance અને `super()`",
    [
      #set text(size: 8.4pt)
      ```python
      class Account:
          bank = "RTech Bank" # class attribute

          def __init__(self, owner: str, bal: float = 0):
              self.owner = owner
              self.__bal = bal # private attribute

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
    "OOP ના 4 સ્તંભ અને Dunder (`__magic__`) મેથડ્સ",
    tbl(
      (auto, 1fr),
      ("કોન્સેપ્ટ / Dunder", "હેતુ અને ઉદાહરણ"),
      (
        ([*Encapsulation*], [ડેટા + મેથડને સાથે રાખો; `_protected` કે `__private` પ્રિફિક્સ.]),
        ([*Inheritance*], [પેરન્ટ ક્લાસના ગુણો લો: `class Child(Parent):`.]),
        ([*Polymorphism*], [એક જ મેથડ નામ (`speak()`) દરેક ક્લાસમાં અલગ કામ કરે.]),
        ([*Abstraction*], [`abc.ABC` અને `@abstractmethod` થી આંતરિક જટિલતા છુપાવો.]),
        ([`__str__` / `__repr__`], [`print(obj)` માટે યુઝર વિરુદ્ધ ડેવલપર આઉટપુટ.]),
        ([`__len__` / `__eq__`], [`len(obj)` અને `obj1 == obj2` ને સીધું કામ કરવા દે છે!]),
      ),
      pad-y: 5.5pt,
      fsize: 8.2pt
    ),
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(46pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "`@dataclass` (આધુનિક ક્લીન Python મોડેલ્સ)",
    [
      #set text(size: 8.5pt)
      લાંબો કોડ લખ્યા વિના `__init__`, `__repr__` અને `__eq__` આપમેળે બનાવી દે છે!
      ```python
      from dataclasses import dataclass

      @dataclass
      class Student:
          name: str
          score: int = 0
      ```
      ઇમ્યુટેબલ બનાવવા માટે `frozen=True` વાપરો!
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "Exception Handling (`try / except / else / finally`)",
    [
      #set text(size: 8.5pt)
      ```python
      try:
          val = int(data["qty"])
      except (KeyError, ValueError) as e:
          print("Bad input:", e)
      else:
          print("Success:", val) # કોઈ એરર ન હોય ત્યારે
      finally:
          conn.close() # હંમેશા ચાલે છે (ક્લીનઅપ)
      ```
      કસ્ટમ એરર: `if x < 0: raise ValueError("Must be >= 0")`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(46pt)
#did-you-know[Python માં *દરેક વસ્તુ એક ઓબ્જેક્ટ છે* — સંખ્યાઓ, ફંક્શન્સ અને ક્લાસ પણ! તેથી જ તમે એક ફંક્શનને `sorted()` માં આર્ગ્યુમેન્ટ તરીકે પાસ કરી શકો છો.]

#pagebreak()

// =========================================================================
// PAGE 6: FILE I/O, JSON, CSV, REGEX & STANDARD LIBRARY
// =========================================================================
#section-banner("05", "ફાઇલ I/O, JSON, CSV, REGEX અને સ્ટાન્ડર્ડ લાઇબ્રેરી", "pathlib, Context Managers, re, datetime અને જરૂરી મોડ્યુલ્સ")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "આધુનિક ફાઇલ હેન્ડલિંગ (`with open` અને `pathlib`)",
    [
      #set text(size: 8.5pt)
      - *સુરક્ષિત Read/Write (`with` ફાઇલ આપમેળે બંધ કરે છે):*
        ```python
        with open("notes.txt", "w", encoding="utf-8") as f:
            f.write("Hello RTechLab!\n")
        with open("notes.txt", "r", encoding="utf-8") as f:
            lines = f.read().splitlines()
        ```
      - *`pathlib` (ક્રોસ-પ્લેટફોર્મ પાથ):*
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
    "JSON અને CSV પાર્સિંગ (APIs અને સ્પ્રેડશીટ્સ)",
    [
      #set text(size: 8.5pt)
      - *JSON (`json` મોડ્યુલ):*
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
      - *CLI આર્ગ્યુમેન્ટ્સ:* `import sys; print(sys.argv[1:])` કે `argparse`.
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(36pt)

#card(
  "જરૂરી Python સ્ટાન્ડર્ડ લાઇબ્રેરી મોડ્યુલ્સ (Batteries Included!)",
  tbl(
    (auto, auto, 1fr),
    ("મોડ્યુલ", "મુખ્ય ફંક્શન્સ", "વાસ્તવિક ઉપયોગ"),
    (
      ([`re` (Regex)], [`re.findall()`, `re.sub()`, `re.search()`], [ઈમેલ/ફોન કાઢો: `re.findall(r"\d{10}", text)`]),
      ([`datetime`], [`datetime.now()`, `.strftime("%d-%b-%Y")`, `timedelta`], [ટાઇમસ્ટેમ્પ, લોગ ફાઇલ નામ અને તારીખ ઉમેરવી (`+ timedelta(days=7)`)]),
      ([`collections`], [`Counter()`, `defaultdict(list)`, `deque`], [1 લાઇનમાં ગણતરી: `Counter(words).most_common(5)`]),
      ([`os` / `shutil`], [`os.getenv()`, `shutil.move()`, `shutil.copy2()`], [`.env` કીઝ વાંચવી; બલ્ક ફાઇલ રીનેમ, મૂવ અને ઝિપ કરવી]),
      ([`subprocess`], [`subprocess.run(["ping", "-n", "2", host])`], [Python સ્ક્રિપ્ટમાંથી શેલ/CLI કમાન્ડ ચલાવવા]),
    ),
    pad-y: 5.8pt,
    fsize: 8.3pt
  ),
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(36pt)
#card(
  "સિક્રેટ્સ મેનેજમેન્ટ (`.env`) અને પ્રોજેક્ટ પેકેજિંગ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.5pt)
        - *કોડમાં ક્યારેય API Key ન લખો!* તેને `.env` (`API_KEY=sk-...`) માં રાખો અને `.env` ને `.gitignore` માં ઉમેરો.
      ],
      [
        #set text(size: 8.5pt)
        - Python માં લોડ કરો: `from dotenv import load_dotenv; load_dotenv(); key = os.getenv("API_KEY")`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(36pt)
#did-you-know[`collections.Counter(items).most_common(3)` વાપરીને તમે 1,00,000-લાઇનના સર્વર લોગમાંથી ટોપ 3 એરર *10 મિલિસેકન્ડ* થી ઓછા સમયમાં શોધી શકો છો!]

#pagebreak()

// =========================================================================
// PAGE 7: PYTHON AUTOMATION & SCRIPTING
// =========================================================================
#section-banner("06", "PYTHON ઓટોમેશન અને રિયલ-વર્લ્ડ સ્ક્રિપ્ટિંગ", "બલ્ક ફાઇલ ઓર્ગેનાઇઝર, REST APIs, વેબ સ્ક્રેપિંગ, Excel અને ઈમેલ બોટ્સ")

#card(
  "રિયલ-વર્લ્ડ Python ઓટોમેશન પાઇપલાઇન વિઝ્યુઅલ",
  [
    #align(center)[#image("02_BRAND_ASSETS/python_automation_visual.png", width: 96%)]
  ],
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(21pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "રેસિપી 1: Downloads ફોલ્ડરને એક્સટેન્શન મુજબ ઓટો-સોર્ટ કરો",
    [
      #set text(size: 8.3pt)
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
    "રેસિપી 2: લાઇવ REST APIs માંથી ડેટા લાવો (`requests`)",
    [
      #set text(size: 8.3pt)
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

#v(21pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "રેસિપી 3: વેબ સ્ક્રેપિંગ (`BeautifulSoup`)",
    [
      #set text(size: 8.3pt)
      ```python
      from bs4 import BeautifulSoup
      import requests

      soup = BeautifulSoup(requests.get(url).text, "html.parser")
      titles = [h.get_text(strip=True) for h in soup.select("h2.title")]
      ```
      JS-રેન્ડર સાઇટ્સ માટે *Playwright* (`pip install playwright`) વાપરો.
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "રેસિપી 4: ઓટો ઈમેલ રિપોર્ટ્સ (`smtplib`)",
    [
      #set text(size: 8.3pt)
      - Gmail *App Password* + `EmailMessage()` સાથે `smtplib.SMTP_SSL("smtp.gmail.com", 465)` વાપરો.
      - *Windows Task Scheduler* કે Linux `crontab -e` થી રોજ સવારે સ્ક્રિપ્ટ ઓટો-ચલાવો!
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(21pt)
#did-you-know[તમે `pip install pyinstaller` ઇન્સ્ટોલ કરીને અને #cmd("pyinstaller --onefile my_tool.py") ચલાવીને તમારી કોઈપણ Python ઓટોમેશન સ્ક્રિપ્ટને `.exe` એપમાં બદલી શકો છો!]

#pagebreak()

// =========================================================================
// PAGE 8: DATA SCIENCE, WEB APIS & AI AUTOMATION
// =========================================================================
#section-banner("07", "ડેટા એનાલિટિક્સ, WEB APIS અને AI માટે PYTHON", "Pandas, NumPy, FastAPI, SQLite અને OpenAI/Gemini AI ઇન્ટિગ્રેશન")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Pandas DataFrame ચીટ શીટ (Excel કરતાં વધુ પાવરફુલ!)",
    [
      #set text(size: 8.4pt)
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
      - ખાલી કિંમતો: `df.dropna()` કે `df.fillna(0)`
      - ટેબલ જોડો: `pd.merge(orders, users, on="user_id")`
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "FastAPI: 8 લાઇનમાં પ્રોડક્શન REST API બનાવો",
    [
      #set text(size: 8.4pt)
      ```python
      from fastapi import FastAPI
      app = FastAPI()

      @app.get("/api/square/{num}")
      def square(num: int):
          return {"input": num, "square": num * num}
      ```
      - સર્વર ચલાવો: #cmd("uvicorn main:app --reload")
      - `http://127.0.0.1:8000/docs` પર ઓટો Swagger UI!
      - *SQLite બિલ્ટ-ઇન DB:* `import sqlite3` (ઝીરો-કોન્ફિગ લોકલ DB).
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
    "Python + AI ઓટોમેશન (Gemini / OpenAI SDK)",
    [
      #set text(size: 8.4pt)
      - ઇન્સ્ટોલ: #cmd("pip install google-genai") કે #cmd("pip install openai")
      - 50 PDFs નો ઓટો-સારાંશ: `pymupdf` (`fitz`) થી ટેક્સ્ટ કાઢો → LLM API ને મોકલો → Excel/MD માં સેવ કરો!
      - *નેટવર્કિંગ અને સાયબર:* `paramiko` / `netmiko` થી 5 સેકન્ડમાં 50 Cisco રાઉટર્સ કોન્ફિગર કરો, કે `scapy` થી પેકેટ બનાવો.
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "ટેસ્ટિંગ અને કોડ ક્વોલિટી (`pytest` અને `ruff`)",
    [
      #set text(size: 8.4pt)
      - *યુનિટ ટેસ્ટ (`test_app.py`):*
        ```python
        def test_gst():
            assert calc_total(100, 0.18) == 118.0
        ```
      - બધા ટેસ્ટ ચલાવો: #cmd("pytest -v")
      - સુપર-ફાસ્ટ લિન્ટર: #cmd("pip install ruff") → #cmd("ruff check . --fix")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(38pt)
#card(
  "SQLite3 બિલ્ટ-ઇન ડેટાબેઝ અને NumPy વેક્ટર ગણિત ક્વિકસ્ટાર્ટ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.4pt)
        - *SQLite3 (`sqlite3`):* `conn = sqlite3.connect("app.db"); cur = conn.cursor(); cur.execute("SELECT * FROM users WHERE id=?", (1,))` (SQLi થી બચવા હંમેશા `?` વાપરો!).
      ],
      [
        #set text(size: 8.4pt)
        - *NumPy (`import numpy as np`):* `a = np.array([10, 20, 30])` → `a * 2` (`[20, 40, 60]`), `a.mean()`, `a.std()`, `np.zeros((2,3))` (લૂપ કરતાં ~50x ઝડપી!).
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(38pt)
#did-you-know[*FastAPI* દુનિયાના સૌથી ઝડપી Python વેબ ફ્રેમવર્ક્સમાંનું એક છે (NodeJS અને Go જેટલું ઝડપી) — તે JSON ને જાતે વેલિડેટ કરે છે અને લાઇવ API ડોક્સ પણ બનાવે છે!]

#pagebreak()

// =========================================================================
// PAGE 9: TOP PYTHON GITHUB REPOS, PRACTICE SITES & CAREER TRACKS
// =========================================================================
#section-banner("08", "ટોપ GITHUB REPOS, પ્રેક્ટિસ સાઇટ્સ અને કરિયર પાથ", "100% મફત લર્નિંગ સંસાધનો · અલ્ગોરિધમ, પ્રોજેક્ટ્સ અને જોબ રોડમેપ")

#card(
  "ટોપ Python GitHub રિપોઝિટરી અને નોલેજ વેબસાઇટ્સ (ક્લિકેબલ લિંક્સ)",
  tbl(
    (auto, 1fr, auto),
    ("સંસાધન / રેપો", "શું શીખશો અને કેમ જરૂરી છે", "ડાયરેક્ટ લિંક"),
    (
      ([*30 Days of Python*], [શરૂઆતીથી એડવાન્સ સુધી સ્ટેપ-બાય-સ્ટેપ હેન્ડ્સ-ઓન રેપો], [#link("https://github.com/Asabeneh/30-Days-Of-Python")[`github.com/Asabeneh/30-Days...`]]),
      ([*Awesome Python*], [દરેક ક્ષેત્રની બેસ્ટ Python લાઇબ્રેરીઝની ક્યુરેટેડ લિસ્ટ], [#link("https://github.com/vinta/awesome-python")[`github.com/vinta/awesome-python`]]),
      ([*TheAlgorithms/Python*], [બધા DSA, સોર્ટિંગ, ગ્રાફ અને DP Python કોડમાં], [#link("https://github.com/TheAlgorithms/Python")[`github.com/TheAlgorithms/Python`]]),
      ([*Automate Boring Stuff*], [Excel, PDF, ઈમેલ અને સ્ક્રેપિંગની મફત ચોપડી + સ્ક્રિપ્ટ્સ], [#link("https://automatetheboringstuff.com")[`automatetheboringstuff.com`]]),
      ([*Real Python*], [ઊંડાણપૂર્વક, સરળ Python ટ્યુટોરિયલ્સ અને બેસ્ટ પ્રેક્ટિસ], [#link("https://realpython.com")[`realpython.com`]]),
      ([*Kaggle Learn*], [Python, Pandas અને Machine Learning ના મફત માઇક્રો-કોર્સ], [#link("https://www.kaggle.com/learn")[`kaggle.com/learn`]]),
      ([*NeetCode / LeetCode*], [DSA કોડિંગ ઇન્ટરવ્યુ પ્રેક્ટિસ (Blind 75 / NeetCode 150)], [#link("https://neetcode.io")[`neetcode.io`] · #link("https://leetcode.com")[`leetcode.com`]]),
    ),
    pad-y: 5.5pt,
    fsize: 8.2pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(32pt)

#card(
  "2026–27 Python કરિયર પાથ અને પોર્ટફોલિયો પ્રોજેક્ટ્સ",
  tbl(
    (auto, 1fr, 1fr),
    ("કરિયર ટ્રેક", "શીખવા માટે મુખ્ય લાઇબ્રેરીઝ", "રિઝ્યુમે માટે દમદાર પ્રોજેક્ટ"),
    (
      ([*Backend / API Dev*], [`FastAPI`, `Django`, `PostgreSQL`, `Redis`, `Docker`], [Swagger અને Pytest સાથે Auth + Payment REST API]),
      ([*Data / AI Engineer*], [`Pandas`, `NumPy`, `SQL`, `LangGraph`, `OpenAI/Gemini`], [ઓટોમેટેડ સેલ્સ ડેશબોર્ડ + RAG PDF ચેટબોટ]),
      ([*Automation / DevOps*], [`Pathlib`, `Requests`, `Playwright`, `Paramiko`, `GitHub Actions`], [બલ્ક GST ઇનવોઇસ PDF જનરેટર + ઓટો ઈમેલ બોટ]),
      ([*Cyber / NetOps*], [`Scapy`, `Netmiko`, `Socket`, `Nmap-python`], [મલ્ટી-સ્વિચ બેકઅપ ટૂલ અને પોર્ટ સ્કેનર CLI]),
    ),
    pad-y: 5.8pt,
    fsize: 8.2pt
  ),
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(32pt)
#card(
  "Python નું ભવિષ્ય (2026–2030): Python કેમ રહેશે #1?",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.3pt)
        - *AI અને Agentic સિસ્ટમ્સ:* 90%+ GenAI, RAG, LangGraph અને MCP ફ્રેમવર્ક *Python-ફર્સ્ટ* છે.
        - *સુપર-ફાસ્ટ Python 3.13+:* JIT કમ્પાઇલર + No-GIL સપોર્ટ + Rust-પાવર્ડ `uv`, `ruff` અને `polars`!
      ],
      [
        #set text(size: 8.3pt)
        - *બૂમિંગ કરિયર ક્ષેત્રો:* AI એન્જિનિયરિંગ, ડેટા/MLOps (`PyTorch`), ક્લાઉડ/NetDevOps (`Netmiko`), અને રોબોટિક્સ/IoT (`MicroPython`).
        - *30-દિવસનો લક્ષ્ય:* W1 Core → W2 OOP → W3 APIs/Pandas → W4 1 FastAPI + AI પ્રોજેક્ટ લાઇવ કરો!
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(32pt)
#did-you-know[GitHub પર ફક્ત *2–3 અસલી ઓટોમેશન પ્રોજેક્ટ્સ* (જેમ કે ઓટો GST બિલ જનરેટર કે બલ્ક ફાઇલ સોર્ટર) બતાવવાથી 5 સામાન્ય કેલ્ક્યુલેટર પ્રોજેક્ટ્સ કરતાં ઘણા વધુ ઇન્ટરવ્યુ કોલ્સ મળે છે!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 PYTHON INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "ટોપ 10 PYTHON ઇન્ટરવ્યુ પ્રશ્નો અને RTECHLAB લેખક પરિચય", "પ્લેસમેન્ટ અને ટેક ઇન્ટરવ્યુ તૈયારી · પ્રમાણપત્રો, ધ્યેય અને વોટ્સએપ હેલ્પ ડેસ્ક")

#card(
  "ટોપ 10 Python પ્રોગ્રામિંગ ઇન્ટરવ્યુ પ્રશ્ન-જવાબ",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.2pt)
        *1. List વિરુદ્ધ Tuple?* List મ્યુટેબલ (`[]`, ધીમી) છે; Tuple ઇમ્યુટેબલ (`()`, ઝડપી અને ડિક્ટ કી બની શકે છે). \
        *2. `==` વિરુદ્ધ `is`?* `==` કિંમતની સરખામણી કરે છે; `is` જુએ છે કે બંને વેરિએબલ મેમરીમાં એક જ ઓબ્જેક્ટ છે કે નહીં. \
        *3. Shallow વિરુદ્ધ Deep Copy?* Shallow copy (`copy.copy`) નેસ્ટેડ ઓબ્જેક્ટનો રેફરન્સ કોપી કરે છે; Deep copy (`copy.deepcopy`) બધું નવું બનાવે છે. \
        *4. `*args` વિરુદ્ધ `**kwargs`?* `*args` પોઝિશનલ આર્ગ્યુમેન્ટ્સને ટપલમાં અને `**kwargs` કીવર્ડ આર્ગ્યુમેન્ટ્સને ડિક્ટમાં લે છે. \
        *5. GIL શું છે?* Global Interpreter Lock — એક સમયે ફક્ત 1 થ્રેડને Python બાઇટકોડ ચલાવવા દે છે (CPU કામો માટે `multiprocessing` વાપરો).
      ],
      [
        #set text(size: 8.2pt)
        *6. Generator વિરુદ્ધ List?* List આખો ડેટા RAM માં રાખે છે; Generator (`yield`) એક સમયે 1 આઇટમ આપે છે (`O(1)` મેમરી). \
        *7. Decorator શું છે?* એવું ફંક્શન જે બીજા ફંક્શનનો કોડ બદલ્યા વગર તેની ક્ષમતા વધારે છે (`@login_required`). \
        *8. Dict લુકઅપ સ્પીડ?* સરેરાશ `O(1)` કારણ કે Python ડિક્શનરી અંદરથી Hash Table વાપરે છે. \
        *9. `venv` કેમ જરૂરી છે?* પ્રોજેક્ટ્સની લાઇબ્રેરીને અલગ રાખે છે જેથી પ્રોજેક્ટ A નું પેકેજ પ્રોજેક્ટ B ને ન તોડે. \
        *10. `try-except-else-finally`?* એરર ન આવે ત્યારે `else` ચાલે છે; અને `finally` *હંમેશા* ચાલે છે (ક્લીનઅપ માટે).
      ]
    )
  ],
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(22pt)

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
          *અનુભવ અને પ્રમાણપત્રો:* #hl-b("Python Automation & Systems Architect") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · ડાયરેક્ટર અને લીડ IT ટ્રેનર, IANT કમ્પ્યુટર એજ્યુકેશન, પાલનપુર · *10+ વર્ષનો અનુભવ · 3,000+ વિદ્યાર્થીઓ પ્રશિક્ષિત*.
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8pt)[
            *અમારો RTechLab ધ्येय (Motto):* _"Technology Made Practical — શીખો, કોડ કરો અને ઓટોમેટ કરો. ફક્ત સિન્ટેક્સ ન ગોખો — એવી સ્ક્રિપ્ટ્સ બનાવો જે અસલી સમસ્યાઓ ઉકેલે. ભારતમાં નિર્મિત જેથી ₹22 માં ₹2,200 જેવું જ્ઞાન મળે."_
          ]
        )
      ]
    )
  ]
)

#v(22pt)

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
        #link("https://rtechlab.com/tools")[#text(size: 7pt, fill: rgb("#2563eb"))[rtechlab.com/tools]]
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
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily Python Bytes]]
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

#v(22pt)

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
      #text(size: 9.2pt, weight: "bold", fill: rgb("#14532d"))[RTechLab વિદ્યાર્થી હેલ્પ ડેस्क અને કરિયર માર્ગદર્શન] \
      #text(size: 7.8pt, fill: rgb("#166534"))[Python એરર, ઓટોમેશન સ્ક્રિપ્ટ કે ઇન્ટરવ્યુ તૈયારીમાં ક્યાંય અટવાયા છો? સીધું WhatsApp પર પૂછો!]
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
