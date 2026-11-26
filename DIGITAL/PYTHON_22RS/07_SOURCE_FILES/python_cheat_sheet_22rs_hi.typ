#set document(
  title: "RTechLab — Python Programming & Automation Quick Desk Cheat Sheet (Hindi)",
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
          #text(fill: rgb("#64748b"))[ · 10-पेज त्वरित डेस्क गाइड (हिंदी संस्करण)]
        ],
        [
          #text(fill: rgb("#2563eb"), weight: "bold")[rtechlab.com/tools]
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
        [© RTechLab Original Edition · सीखें · कोड करें · ऑटोमेट करें · Free Tools: *rtechlab.com/tools*],
        [#box(fill: rgb("#f1f5f9"), stroke: 0.4pt + rgb("#cbd5e1"), radius: 2pt, inset: (x: 5pt, y: 1.5pt))[#text(weight: "bold", fill: rgb("#0f172a"))[पेज #p / 10]]]
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
      *💡 क्या आप जानते हैं?* #fact
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
#section-banner("01", "PYTHON सेटअप, डेटा टाइप्स, ऑपरेटर्स और स्ट्रिंग्स", "Python 3.12+ · वेरिएबल्स, टाइप कास्टिंग, F-Strings और स्लाइसिंग")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "मुख्य प्रिमिटिव डेटा टाइप्स और टाइप कास्टिंग",
    tbl(
      (auto, auto, 1fr),
      ("टाइप", "उदाहरण", "नोट्स और कास्टिंग"),
      (
        ([`int`], [`42`, `-7`, `1_000`], [असीमित पूर्णांक संख्या; `int("42")`]),
        ([`float`], [`3.14`, `1e-5`], [दशमलव संख्या; `float("3.5")`]),
        ([`str`], [`"RTech"`, `'Hi'`], [इम्यूटेबल टेक्स्ट; `str(100)`]),
        ([`bool`], [`True`, `False`], [`0, "", [], None` = `False` होता है]),
        ([`NoneType`], [`None`], [खाली मान दर्शाता है (`x is None`)]),
      ),
      pad-y: 5.8pt,
      fsize: 8.4pt
    ),
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "इंस्टॉलेशन और वर्चुअल एनवायरनमेंट (`venv`)",
    [
      #set text(size: 8.6pt)
      - *Python डाउनलोड:* #link("https://www.python.org")[`python.org`] से डाउनलोड करें (*"Add Python to PATH"* जरूर टिक करें!)।
      - *वर्जन जांच:* #cmd("python --version") · #cmd("pip --version")
      - *नया `venv` बनाएँ:* #cmd("python -m venv .venv")
      - *एक्टिवेट करें:* `.venv\Scripts\activate` (Win) | `source .venv/bin/activate` (Linux)
      - *पैकेज इंस्टॉल:* #cmd("pip install requests pandas") → #cmd("pip freeze > requirements.txt")
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
    "जरूरी Python ऑपरेटर्स (इंटरव्यू ट्रिक)",
    tbl(
      (auto, auto, 1fr),
      ("ऑपरेटर", "उदाहरण", "अर्थ / व्यवहार"),
      (
        ([`//` व `%`], [`7 // 2 = 3`, `7 % 2 = 1`], [फ्लोर डिवीजन और शेषफल (Modulo)]),
        ([`**`], [`2 ** 5 = 32`], [घात (Power / Exponentiation)]),
        ([`==` vs `is`], [`a == b` vs `a is None`], [`==` *मान* देखता है; `is` *मेमोरी ID* देखता है]),
        ([`in`], [`"py" in "python"`], [सदस्यता जाँच (`True`)]),
        ([`:=`], [`if (n := len(a)) > 3:`], [Walrus ऑपरेटर (एक लाइन में असाइन व जाँच)]),
      ),
      pad-y: 5.5pt,
      fsize: 8.3pt
    ),
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "F-Strings, स्ट्रिंग स्लाइसिंग और मुख्य मेथड्स",
    [
      #set text(size: 8.6pt)
      - *F-Strings (सबसे तेज़):* `f"Price: ₹{price:,.2f} | {name=}"`
      - *स्लाइसिंग `[start:stop:step]`:* `"PYTHON"[0:3]` → `"PYT"` · `"PYTHON"[::-1]` → `"NOHTYP"` (उल्टा करें!)।
      - *जरूरी मेथड्स:* `.strip()`, `.lower()`, `.upper()`, `.replace("a","b")`, `.split(",")`, `",".join(lst)`, `.startswith()`, `.isdigit()`।
      - *इनपुट:* `age = int(input("Enter age: "))`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(25pt)
#card(
  "प्रमुख बिल्ट-इन फंक्शंस (`len, range, sorted, type, isinstance`)",
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
#did-you-know[Python कोड ब्लॉक के लिए `{}` ब्रैकेट के बजाय *इंडेंटेशन (4 स्पेस)* का उपयोग करता है — और `if (n := len(items)) > 0:` (Walrus Operator) एक ही लाइन में मान निकालकर तुलना कर देता है!]

#pagebreak()

// =========================================================================
// PAGE 3: DATA STRUCTURES
// =========================================================================
#section-banner("02", "PYTHON डेटा स्ट्रक्चर्स और कॉम्प्रिहेंशन", "Lists, Tuples, Sets, Dictionaries · स्लाइसिंग और O(1) लुकअप")

#card(
  "मुख्य डेटा स्ट्रक्चर्स तुलनात्मक विजुअल",
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
    "Lists `[ ]` और Tuples `( )` चीट शीट",
    [
      #set text(size: 8.6pt)
      - *लिस्ट बनाना व बदलना:* `nums = [10, 20, 30]`
        - `.append(40)` (अंत में जोड़ें), `.insert(1, 15)`, `.extend([50, 60])`
        - `.pop()` (आखिरी हटाएँ), `.remove(20)`, `.sort(reverse=True)`
        - `sorted(nums)` मूल लिस्ट बदले बिना *नई* सॉर्टेड लिस्ट देता है!
      - *Tuple (अपरिवर्तनीय):* `pt = (10, 20)` · 1 आइटम के लिए कॉमा जरूरी: `(5,)`।
      - *Unpacking:* `x, y, *rest = [1, 2, 3, 4]` → `x=1, y=2, rest=[3, 4]`।
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  ),
  card(
    "Dictionaries `{k: v}` और Sets `{ }` चीट शीट",
    [
      #set text(size: 8.6pt)
      - *डिक्शनरी:* `user = {"name": "Rahul", "role": "Dev"}`
        - सुरक्षित लुकअप (`KeyError` से बचें): `user.get("city", "Unknown")`
        - लूप चलाएँ: `for k, v in user.items():`
        - दो डिक्ट जोड़ें (3.9+): `merged = d1 | d2`
      - *Sets (केवल अनोखे आइटम):* `s = {1, 2, 3}` (खाली सेट = `set()`, `{}` नहीं!)।
        - Union `a | b`, Intersection `a & b`, Difference `a - b`।
        - तुरंत डुप्लीकेट हटाएँ: `unique = list(set(my_list))`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(32pt)

#card(
  "List, Dict और Set कॉम्प्रिहेंशन (1-लाइनर कोड लिखें)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *List Comp:* `squares = [x**2 for x in range(1, 6)]`
        - *फ़िल्टर सहित:* `evens = [x for x in nums if x % 2 == 0]`
      ],
      [
        #set text(size: 8.6pt)
        - *Dict Comp:* `prices = {k: v*1.18 for k, v in items.items()}`
        - *Generator (कम मेमोरी):* `sum(x*x for x in range(1_000_000))`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(32pt)
#did-you-know[`if x in my_set:` या `if x in my_dict:` में *O(1) स्थिर समय* लगता है (भले ही 1 करोड़ आइटम हों!), जबकि `if x in my_list:` हर आइटम चेक करता है (*O(n)* समय)!]

#pagebreak()

// =========================================================================
// PAGE 4: CONTROL FLOW, FUNCTIONS, LAMBDA & DECORATORS
// =========================================================================
#section-banner("03", "कंट्रोल फ्लो, फंक्शंस, LAMBDA और DECORATORS", "लूप्स, enumerate/zip, *args/**kwargs, स्कोप और PEP 8")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "कंडीशनल्स, लूप्स और Pythonic इटरेशन",
    [
      #set text(size: 8.6pt)
      - *If / Elif / Else + Ternary:*
        `status = "Pass" if score >= 40 else "Fail"`
      - *Match-Case (Python 3.10+):* कमांड्स व API के लिए साफ switch-case विकल्प।
      - *For लूप + `enumerate` + `zip`:*
        ```python
        for idx, val in enumerate(names, start=1):
            print(idx, val)
        for name, mark in zip(names, marks):
            print(f"{name}: {mark}")
        ```
      - *नियंत्रण:* `break` (लूप रोकें), `continue` (अगला स्टेप), `pass` (खाली ब्लॉक)।
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "फंक्शंस, `*args`, `**kwargs` और टाइप हिंट्स",
    [
      #set text(size: 8.6pt)
      ```python
      def calc_total(price: float, tax: float = 0.18) -> float:
          return round(price * (1 + tax), 2)
      ```
      - *`*args` (Tuple):* कितने भी पोज़िशनल आर्ग्युमेंट लें (`def add(*nums):`)।
      - *`**kwargs` (Dict):* कितने भी कीवर्ड आर्ग्युमेंट लें (`def cfg(**opts):`)।
      - *खतरनाक गलती:* कभी `def f(x=[]):` न लिखें — `def f(x=None): x = x or []` लिखें!
      - *LEGB नियम:* Local → Enclosing → Global → Built-in।
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
    "Lambda, `map`, `filter` और `any`/`all`",
    [
      #set text(size: 8.6pt)
      - *Lambda (1-लाइन फंक्शन):* `square = lambda x: x * x`
      - *डिक्ट सॉर्ट करें:* `users.sort(key=lambda u: u["age"])`
      - *`map` व `filter`:* `list(map(str.upper, words))` · `list(filter(lambda x: x > 0, nums))`
      - *`any()` व `all()`:* `any(x > 90 for x in marks)` · `all(u.active for u in users)`
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  ),
  card(
    "Decorators और Generators (`yield`)",
    [
      #set text(size: 8.6pt)
      - *Decorator (`@timer`):* बिना कोड बदले फंक्शन में लॉगिंग, ऑथ या टाइमर जोड़ता है!
      ```python
      def log_call(fn):
          def wrapper(*a, **kw):
              print("Running:", fn.__name__)
              return fn(*a, **kw)
          return wrapper
      ```
      - *Generator (`yield`):* एक बार में 1 आइटम देता है — 10 GB लॉग फाइल पढ़ने के लिए बेस्ट!
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(34pt)
#card(
  "PEP 8 क्लीन कोड और Pythonic नियम (सीनियर जैसा कोड लिखें)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.6pt)
        - *नामकरण:* वेरिएबल/फंक्शन के लिए `snake_case`, क्लास के लिए `PascalCase`, कॉन्स्टेंट के लिए `UPPER_SNAKE`।
        - *Truthiness:* `if len(items) > 0:` के बजाय `if items:` लिखें।
      ],
      [
        #set text(size: 8.6pt)
        - *1 लाइन में स्वैप:* `a, b = b, a` (किसी टेम्प वेरिएबल की जरूरत नहीं!)।
        - *Docstrings:* `def` के ठीक नीचे ट्रिपल कोट्स `"""..."""` में विवरण लिखें।
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(34pt)
#did-you-know[Python इंटरव्यू की #1 गलती `def add(item, box=[]):` लिखना है — क्योंकि Python उस `[]` को केवल *एक बार* बनाता है, इसलिए हर कॉल में वही पुरानी लिस्ट शेयर होती है!]

#pagebreak()

// =========================================================================
// PAGE 5: OOP, DATACLASSES & EXCEPTION HANDLING
// =========================================================================
#section-banner("04", "ऑब्जेक्ट-ओरिएंटेड PYTHON (OOP) और एरर हैंडलिंग", "Classes, Inheritance, Dunder मेथड्स, @dataclass और try/except")

#grid(
  columns: (1.05fr, 0.95fr),
  gutter: 7pt,
  card(
    "Classes, `__init__`, Inheritance और `super()`",
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
    "OOP के 4 स्तंभ और Dunder (`__magic__`) मेथड्स",
    tbl(
      (auto, 1fr),
      ("कॉन्सेप्ट / Dunder", "उद्देश्य और उदाहरण"),
      (
        ([*Encapsulation*], [डेटा + मेथड को साथ रखें; `_protected` या `__private` प्रीफिक्स।]),
        ([*Inheritance*], [पैरेंट क्लास के गुण लें: `class Child(Parent):`।]),
        ([*Polymorphism*], [एक ही मेथड नाम (`speak()`) हर क्लास में अलग काम करे।]),
        ([*Abstraction*], [`abc.ABC` व `@abstractmethod` से आंतरिक जटिलता छिपाएँ।]),
        ([`__str__` / `__repr__`], [`print(obj)` के लिए यूजर बनाम डेवलपर आउटपुट।]),
        ([`__len__` / `__eq__`], [`len(obj)` और `obj1 == obj2` को सीधे काम करने देता है!]),
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
    "`@dataclass` (आधुनिक क्लीन Python मॉडल्स)",
    [
      #set text(size: 8.5pt)
      बिना लंबा कोड लिखे `__init__`, `__repr__` और `__eq__` स्वतः बना देता है!
      ```python
      from dataclasses import dataclass

      @dataclass
      class Student:
          name: str
          score: int = 0
      ```
      इम्यूटेबल बनाने के लिए `frozen=True` उपयोग करें!
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
          print("Success:", val) # कोई एरर न हो तब
      finally:
          conn.close() # हमेशा चलता है (क्लीनअप)
      ```
      कस्टम एरर: `if x < 0: raise ValueError("Must be >= 0")`
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(46pt)
#did-you-know[Python में *हर चीज़ एक ऑब्जेक्ट है* — संख्याएँ, फंक्शंस और यहाँ तक कि क्लासेस भी! इसलिए आप एक फंक्शन को `sorted()` में आर्ग्युमेंट की तरह पास कर सकते हैं।]

#pagebreak()

// =========================================================================
// PAGE 6: FILE I/O, JSON, CSV, REGEX & STANDARD LIBRARY
// =========================================================================
#section-banner("05", "फाइल I/O, JSON, CSV, REGEX और स्टैंडर्ड लाइब्रेरी", "pathlib, Context Managers, re, datetime और जरूरी मॉड्यूल्स")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "आधुनिक फाइल हैंडलिंग (`with open` और `pathlib`)",
    [
      #set text(size: 8.5pt)
      - *सुरक्षित Read/Write (`with` फाइल स्वतः बंद करता है):*
        ```python
        with open("notes.txt", "w", encoding="utf-8") as f:
            f.write("Hello RTechLab!\n")
        with open("notes.txt", "r", encoding="utf-8") as f:
            lines = f.read().splitlines()
        ```
      - *`pathlib` (क्रॉस-प्लेटफॉर्म पाथ):*
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
    "JSON और CSV पार्सिंग (APIs व स्प्रेडशीट्स)",
    [
      #set text(size: 8.5pt)
      - *JSON (`json` मॉड्यूल):*
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
      - *CLI आर्ग्युमेंट्स:* `import sys; print(sys.argv[1:])` या `argparse`।
    ],
    head-bg: rgb("#f0fdf4"),
    title-color: rgb("#14532d")
  )
)

#v(36pt)

#card(
  "जरूरी Python स्टैंडर्ड लाइब्रेरी मॉड्यूल्स (Batteries Included!)",
  tbl(
    (auto, auto, 1fr),
    ("मॉड्यूल", "मुख्य फंक्शंस", "वास्तविक उपयोग"),
    (
      ([`re` (Regex)], [`re.findall()`, `re.sub()`, `re.search()`], [ईमेल/फोन निकालें: `re.findall(r"\d{10}", text)`]),
      ([`datetime`], [`datetime.now()`, `.strftime("%d-%b-%Y")`, `timedelta`], [टाइमस्टैम्प, लॉग फाइल नाम व तारीख जोड़ना (`+ timedelta(days=7)`)]),
      ([`collections`], [`Counter()`, `defaultdict(list)`, `deque`], [1 लाइन में गिनती: `Counter(words).most_common(5)`]),
      ([`os` / `shutil`], [`os.getenv()`, `shutil.move()`, `shutil.copy2()`], [`.env` कीज़ पढ़ना; बल्क फाइल रीनेम, मूव व ज़िप करना]),
      ([`subprocess`], [`subprocess.run(["ping", "-n", "2", host])`], [Python स्क्रिप्ट से शेल/CLI कमांड चलाना]),
    ),
    pad-y: 5.8pt,
    fsize: 8.3pt
  ),
  head-bg: rgb("#fefce8"),
  title-color: rgb("#713f12")
)

#v(36pt)
#card(
  "सीक्रेट्स मैनेजमेंट (`.env`) और प्रोजेक्ट पैकेजिंग",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.5pt)
        - *कोड में कभी API Key न लिखें!* इन्हें `.env` (`API_KEY=sk-...`) में रखें और `.env` को `.gitignore` में जोड़ें।
      ],
      [
        #set text(size: 8.5pt)
        - Python में लोड करें: `from dotenv import load_dotenv; load_dotenv(); key = os.getenv("API_KEY")`
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(36pt)
#did-you-know[`collections.Counter(items).most_common(3)` का उपयोग करके आप 1,00,000-लाइन के सर्वर लॉग में से टॉप 3 एरर *10 मिलीसेकंड* से कम समय में निकाल सकते हैं!]

#pagebreak()

// =========================================================================
// PAGE 7: PYTHON AUTOMATION & SCRIPTING
// =========================================================================
#section-banner("06", "PYTHON ऑटोमेशन और रियल-वर्ल्ड स्क्रिप्टिंग", "बल्क फाइल ऑर्गेनाइज़र, REST APIs, वेब स्क्रैपिंग, Excel और ईमेल बॉट्स")

#card(
  "रियल-वर्ल्ड Python ऑटोमेशन पाइपलाइन विजुअल",
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
    "रेसिपी 1: Downloads फोल्डर को एक्सटेंशन से ऑटो-सॉर्ट करें",
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
    "रेसिपी 2: लाइव REST APIs से डेटा लाएँ (`requests`)",
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
    "रेसिपी 3: वेब स्क्रैपिंग (`BeautifulSoup`)",
    [
      #set text(size: 8.3pt)
      ```python
      from bs4 import BeautifulSoup
      import requests

      soup = BeautifulSoup(requests.get(url).text, "html.parser")
      titles = [h.get_text(strip=True) for h in soup.select("h2.title")]
      ```
      JS-रेंडर साइट्स के लिए *Playwright* (`pip install playwright`) उपयोग करें।
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "रेसिपी 4: ऑटो ईमेल रिपोर्ट्स (`smtplib`)",
    [
      #set text(size: 8.3pt)
      - Gmail *App Password* + `EmailMessage()` के साथ `smtplib.SMTP_SSL("smtp.gmail.com", 465)` उपयोग करें।
      - *Windows Task Scheduler* या Linux `crontab -e` से रोज़ सुबह स्क्रिप्ट ऑटो-चलाएँ!
    ],
    head-bg: rgb("#fef2f2"),
    title-color: rgb("#991b1b")
  )
)

#v(21pt)
#did-you-know[आप `pip install pyinstaller` इंस्टॉल करके और #cmd("pyinstaller --onefile my_tool.py") चलाकर अपनी किसी भी Python ऑटोमेशन स्क्रिप्ट को `.exe` ऐप में बदल सकते हैं!]

#pagebreak()

// =========================================================================
// PAGE 8: DATA SCIENCE, WEB APIS & AI AUTOMATION
// =========================================================================
#section-banner("07", "डेटा एनालिटिक्स, WEB APIS और AI के लिए PYTHON", "Pandas, NumPy, FastAPI, SQLite और OpenAI/Gemini AI इंटीग्रेशन")

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  card(
    "Pandas DataFrame चीट शीट (Excel का बाप!)",
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
      - खाली मान: `df.dropna()` या `df.fillna(0)`
      - टेबल जोड़ें: `pd.merge(orders, users, on="user_id")`
    ],
    head-bg: rgb("#eff6ff"),
    title-color: rgb("#1e3a8a")
  ),
  card(
    "FastAPI: 8 लाइन में प्रोडक्शन REST API बनाएँ",
    [
      #set text(size: 8.4pt)
      ```python
      from fastapi import FastAPI
      app = FastAPI()

      @app.get("/api/square/{num}")
      def square(num: int):
          return {"input": num, "square": num * num}
      ```
      - सर्वर चलाएँ: #cmd("uvicorn main:app --reload")
      - `http://127.0.0.1:8000/docs` पर ऑटो Swagger UI!
      - *SQLite बिल्ट-इन DB:* `import sqlite3` (जीरो-कॉन्फ़िग लोकल DB)।
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
    "Python + AI ऑटोमेशन (Gemini / OpenAI SDK)",
    [
      #set text(size: 8.4pt)
      - इंस्टॉल: #cmd("pip install google-genai") या #cmd("pip install openai")
      - 50 PDFs को ऑटो-सारांशित करें: `pymupdf` (`fitz`) से टेक्स्ट निकालें → LLM API को भेजें → Excel/MD में सेव करें!
      - *नेटवर्किंग व साइबर:* `paramiko` / `netmiko` से 5 सेकंड में 50 Cisco राउटर्स कॉन्फ़िगर करें, या `scapy` से पैकेट बनाएं।
    ],
    head-bg: rgb("#f5f3ff"),
    title-color: rgb("#5b21b6")
  ),
  card(
    "टेस्टिंग और कोड क्वालिटी (`pytest` व `ruff`)",
    [
      #set text(size: 8.4pt)
      - *यूनिट टेस्ट (`test_app.py`):*
        ```python
        def test_gst():
            assert calc_total(100, 0.18) == 118.0
        ```
      - सभी टेस्ट चलाएँ: #cmd("pytest -v")
      - सुपर-फास्ट लिंटर: #cmd("pip install ruff") → #cmd("ruff check . --fix")
    ],
    head-bg: rgb("#fefce8"),
    title-color: rgb("#713f12")
  )
)

#v(38pt)
#card(
  "SQLite3 बिल्ट-इन डेटाबेस और NumPy वेक्टर गणित क्विकस्टार्ट",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.4pt)
        - *SQLite3 (`sqlite3`):* `conn = sqlite3.connect("app.db"); cur = conn.cursor(); cur.execute("SELECT * FROM users WHERE id=?", (1,))` (SQLi से बचने के लिए हमेशा `?` लगाएँ!)।
      ],
      [
        #set text(size: 8.4pt)
        - *NumPy (`import numpy as np`):* `a = np.array([10, 20, 30])` → `a * 2` (`[20, 40, 60]`), `a.mean()`, `a.std()`, `np.zeros((2,3))` (लूप से ~50x तेज़!)।
      ]
    )
  ],
  head-bg: rgb("#fef2f2"),
  title-color: rgb("#991b1b")
)

#v(38pt)
#did-you-know[*FastAPI* दुनिया के सबसे तेज़ Python वेब फ्रेमवर्क्स में से एक है (NodeJS और Go के बराबर) — यह JSON को खुद वैलिडेट करता है और लाइव API डॉक्स भी बनाता है!]

#pagebreak()

// =========================================================================
// PAGE 9: TOP PYTHON GITHUB REPOS, PRACTICE SITES & CAREER TRACKS
// =========================================================================
#section-banner("08", "टॉप GITHUB REPOS, प्रैक्टिस साइट्स और करियर पथ", "100% मुफ्त लर्निंग संसाधन · एल्गोरिदम, प्रोजेक्ट्स और जॉब रोडमैप")

#card(
  "टॉप Python GitHub रिपोज़िटरी और नॉलेज वेबसाइट्स (क्लिकेबल लिंक्स)",
  tbl(
    (auto, 1fr, auto),
    ("संसाधन / रेपो", "क्या सीखेंगे और क्यों जरूरी है", "डायरेक्ट लिंक"),
    (
      ([*30 Days of Python*], [शुरुआती से एडवांस्ड तक स्टेप-बाय-स्टेप हैंड्स-ऑन रेपो], [#link("https://github.com/Asabeneh/30-Days-Of-Python")[`github.com/Asabeneh/30-Days...`]]),
      ([*Awesome Python*], [हर क्षेत्र की बेस्ट Python लाइब्रेरीज़ की क्यूरेटेड लिस्ट], [#link("https://github.com/vinta/awesome-python")[`github.com/vinta/awesome-python`]]),
      ([*TheAlgorithms/Python*], [सभी DSA, सॉर्टिंग, ग्राफ और DP Python कोड में], [#link("https://github.com/TheAlgorithms/Python")[`github.com/TheAlgorithms/Python`]]),
      ([*Automate Boring Stuff*], [Excel, PDF, ईमेल व स्क्रैपिंग की मुफ्त किताब + स्क्रिप्ट्स], [#link("https://automatetheboringstuff.com")[`automatetheboringstuff.com`]]),
      ([*Real Python*], [गहन, सरल Python ट्यूटोरियल्स और बेस्ट प्रैक्टिसेस], [#link("https://realpython.com")[`realpython.com`]]),
      ([*Kaggle Learn*], [Python, Pandas और Machine Learning के मुफ्त माइक्रो-कोर्स], [#link("https://www.kaggle.com/learn")[`kaggle.com/learn`]]),
      ([*NeetCode / LeetCode*], [DSA कोडिंग इंटरव्यू प्रैक्टिस (Blind 75 / NeetCode 150)], [#link("https://neetcode.io")[`neetcode.io`] · #link("https://leetcode.com")[`leetcode.com`]]),
    ),
    pad-y: 5.5pt,
    fsize: 8.2pt
  ),
  head-bg: rgb("#eff6ff"),
  title-color: rgb("#1e3a8a")
)

#v(32pt)

#card(
  "2026–27 Python करियर पथ और पोर्टफोलियो प्रोजेक्ट्स",
  tbl(
    (auto, 1fr, 1fr),
    ("करियर ट्रैक", "सीखने के लिए मुख्य लाइब्रेरीज़", "रिज्यूमे के लिए दमदार प्रोजेक्ट"),
    (
      ([*Backend / API Dev*], [`FastAPI`, `Django`, `PostgreSQL`, `Redis`, `Docker`], [Swagger व Pytest के साथ Auth + Payment REST API]),
      ([*Data / AI Engineer*], [`Pandas`, `NumPy`, `SQL`, `LangGraph`, `OpenAI/Gemini`], [ऑटोमेटेड सेल्स डैशबोर्ड + RAG PDF चैटबॉट]),
      ([*Automation / DevOps*], [`Pathlib`, `Requests`, `Playwright`, `Paramiko`, `GitHub Actions`], [बल्क GST इनवॉइस PDF जनरेटर + ऑटो ईमेल बॉट]),
      ([*Cyber / NetOps*], [`Scapy`, `Netmiko`, `Socket`, `Nmap-python`], [मल्टी-स्विच बैकअप टूल और पोर्ट स्कैनर CLI]),
    ),
    pad-y: 5.8pt,
    fsize: 8.2pt
  ),
  head-bg: rgb("#f0fdf4"),
  title-color: rgb("#14532d")
)

#v(32pt)
#card(
  "Python का भविष्य (2026–2030): Python क्यों रहेगा #1?",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.3pt)
        - *AI और Agentic सिस्टम्स:* 90%+ GenAI, RAG, LangGraph और MCP फ्रेमवर्क *Python-फर्स्ट* हैं।
        - *सुपर-फास्ट Python 3.13+:* JIT कंपाइलर + No-GIL सपोर्ट + Rust-पावर्ड `uv`, `ruff` और `polars`!
      ],
      [
        #set text(size: 8.3pt)
        - *बूमिंग करियर क्षेत्र:* AI इंजीनियरिंग, डेटा/MLOps (`PyTorch`), क्लाउड/NetDevOps (`Netmiko`), और रोबोटिक्स/IoT (`MicroPython`)।
        - *30-दिन का लक्ष्य:* W1 Core → W2 OOP → W3 APIs/Pandas → W4 1 FastAPI + AI प्रोजेक्ट लाइव करें!
      ]
    )
  ],
  head-bg: rgb("#f5f3ff"),
  title-color: rgb("#5b21b6")
)

#v(32pt)
#did-you-know[GitHub पर केवल *2–3 असली ऑटोमेशन प्रोजेक्ट्स* (जैसे ऑटो GST बिल जनरेटर या बल्क फाइल सॉर्टर) दिखाना 5 साधारण कैलकुलेटर प्रोजेक्ट्स से कहीं ज्यादा इंटरव्यू कॉल्स दिलाता है!]

#pagebreak()

// =========================================================================
// PAGE 10: TOP 10 PYTHON INTERVIEW Q&A, AUTHOR PROFILE, MOTTO & WHATSAPP DESK
// =========================================================================
#section-banner("09", "टॉप 10 PYTHON इंटरव्यू प्रश्न और RTECHLAB लेखक परिचय", "प्लेसमेंट व टेक इंटरव्यू तैयारी · प्रमाणपत्र, ध्येय और व्हाट्सएप हेल्प डेस्क")

#card(
  "टॉप 10 Python प्रोग्रामिंग इंटरव्यू प्रश्न-उत्तर",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [
        #set text(size: 8.2pt)
        *1. List बनाम Tuple?* List म्यूटेबल (`[]`, धीमी) है; Tuple इम्यूटेबल (`()`, तेज़ और डिक्ट की बन सकता है)। \
        *2. `==` बनाम `is`?* `==` मान की तुलना करता है; `is` देखता है कि दोनों वेरिएबल मेमोरी में एक ही ऑब्जेक्ट हैं या नहीं। \
        *3. Shallow बनाम Deep Copy?* Shallow copy (`copy.copy`) नेस्टेड ऑब्जेक्ट का रेफरेंस कॉपी करती है; Deep copy (`copy.deepcopy`) सब कुछ नया बनाती है। \
        *4. `*args` बनाम `**kwargs`?* `*args` पोज़िशनल आर्ग्युमेंट्स को टपल में और `**kwargs` कीवर्ड आर्ग्युमेंट्स को डिक्ट में लेता है। \
        *5. GIL क्या है?* Global Interpreter Lock — एक बार में केवल 1 थ्रेड को Python बाइटकोड चलाने देता है (CPU कामों के लिए `multiprocessing` लें)।
      ],
      [
        #set text(size: 8.2pt)
        *6. Generator बनाम List?* List पूरा डेटा RAM में रखती है; Generator (`yield`) एक समय में 1 आइटम देता है (`O(1)` मेमोरी)। \
        *7. Decorator क्या है?* ऐसा फंक्शन जो दूसरे फंक्शन का कोड बदले बिना उसकी क्षमता बढ़ाता है (`@login_required`)। \
        *8. Dict लुकअप स्पीड?* औसत `O(1)` क्योंकि Python डिक्शनरी अंदर से Hash Table उपयोग करती है। \
        *9. `venv` क्यों जरूरी है?* प्रोजेक्ट्स की लाइब्रेरी को अलग रखता है ताकि प्रोजेक्ट A का पैकेज प्रोजेक्ट B को न तोड़े। \
        *10. `try-except-else-finally`?* एरर न आने पर `else` चलता है; और `finally` *हमेशा* चलता है (क्लीनअप के लिए)।
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
          *अनुभव व प्रमाणन:* #hl-b("Python Automation & Systems Architect") · *CEH (EC-Council)* · *CSCU* · *EHE & SCSU (Star Certification)* · *CompTIA Network+ & Cisco CCNA Track* · डायरेक्टर एवं लीड आईटी ट्रेनर, IANT कंप्यूटर एजुकेशन, पालनपुर · *10+ वर्षों का अनुभव · 3,000+ छात्र प्रशिक्षित*।
        ]
        #v(4.5pt)
        #box(
          width: 100%,
          fill: rgb("#1e293b"),
          stroke: (left: 3.5pt + rgb("#f59e0b")),
          radius: 2.5pt,
          inset: (x: 7pt, y: 5pt),
          text(fill: rgb("#fef3c7"), size: 8pt)[
            *हमारा RTechLab ध्येय (Motto):* _"Technology Made Practical — सीखें, कोड करें और ऑटोमेट करें। केवल सिंटैक्स न रटें — ऐसी स्क्रिप्ट्स बनाएँ जो असली समस्याएँ हल करें। भारत में निर्मित ताकि ₹22 में ₹2,200 जैसा ज्ञान मिले।"_
          ]
        )
      ]
    )
  ]
)

#v(22pt)

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
        #link("https://rtechlab.com/tools")[#text(size: 7pt, fill: rgb("#2563eb"))[rtechlab.com/tools]]
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
        #link("https://www.instagram.com/rtechlabofficial/")[#text(size: 7pt, fill: rgb("#db2777"))[Daily Python Bytes]]
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
      #text(size: 9.2pt, weight: "bold", fill: rgb("#14532d"))[RTechLab छात्र हेल्प डेस्क और करियर मार्गदर्शन] \
      #text(size: 7.8pt, fill: rgb("#166534"))[Python एरर, ऑटोमेशन स्क्रिप्ट या इंटरव्यू तैयारी में कहीं अटक गए हैं? सीधे WhatsApp पर पूछें!]
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
