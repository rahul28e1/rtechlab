#import "/RTECHLAB_AI_PUBLISHING_ENGINE/03_TYPST_DESIGN_SYSTEM/master-theme.typ": *

// =============================================================================
// CHAPTER 05: NUMBER SYSTEMS, BINARY ARITHMETIC & BOOLEAN LOGIC
// =============================================================================

#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 05 · MATHEMATICAL FOUNDATIONS]
= Chapter 5: Number Systems, Binary Arithmetic & Boolean Logic

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  A rigorous examination of digital number representation, base conversion algorithms, signed 2's complement arithmetic, logic gates, and character encoding standards.
]

#v(2pt)

== 5.1 Why Digital Computers Use Binary (Base-2)
Human beings count in Decimal (Base-10) primarily because we evolved with 10 fingers. Electronic computers, however, do not possess hands; they are constructed from microscopic semiconductor transistors acting as #hl[bistable electrical switches]:
- #strong[Transistor ON (Conducting Voltage, e.g. +3.3V or +1.2V):] Represents binary #hl[1 (True / High)].
- #strong[Transistor OFF (Zero Voltage, 0V / Ground):] Represents binary #hl[0 (False / Low)].

Using binary eliminates analog noise. In an analog system, electrical noise could turn 3.4V into 3.5V and corrupt numbers. In binary, any voltage above a threshold is unambiguously recognized as 1!

#v(2pt)

#analogy-box(title: "The Wall Light Switch Analogy")[
  Think of a room with a row of 8 light switches:
  - Each individual switch can only be #hl[OFF (0)] or #hl[ON (1)].
  - With 1 switch, you can encode 2 states ($2^1$: Dark or Bright).
  - With 8 switches (1 Byte), you can create $2^8 = 256$ unique combinations (from `00000000` to `11111111`), representing numbers from 0 to 255!
]

#v(2pt)

#photo-card(
  "/public/images/notes/photos/silicon-wafer.jpg",
  caption: "Figure 5.1: High-Purity Monocrystalline Silicon Wafer Etched with Billions of Logic Gates",
  height: 55pt
)

#v(2pt)

== 5.2 The 4 Foundational Number Systems in Computing
Positional number systems are governed by the formula $N = sum (d_i times r^i)$, where $r$ is the radix:

#v(1pt)

#table(
  columns: (1fr, 0.7fr, 1.3fr, 3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*System*], [*Radix*], [*Valid Symbols*], [*Primary Role in Computer Engineering*]),
  [#strong[Decimal]], [Base-10], [0 to 9], [Human user interface, financial records, mathematical displays.],
  [#strong[Binary]], [Base-2], [0, 1], [Transistor gates, machine code opcodes, register state.],
  [#strong[Octal]], [Base-8], [0 to 7], [Unix file permissions (`chmod 755`), legacy mainframe computing.],
  [#strong[Hexadecimal]], [Base-16], [0--9, A--F], [RAM addresses (`0x7FFE20`), IPv6, MAC addresses, CSS colors (`#3B82F6`).]
)

#pagebreak()

// PAGE 2 OF CHAPTER 5: CONVERSION ALGORITHMS & 2'S COMPLEMENT
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 05 · MATHEMATICAL FOUNDATIONS]
== 5.3 Step-by-Step Radix Conversion Algorithms

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Mastering number conversions is mandatory for all technical competitive examinations and low-level software debugging.
]

#v(2pt)

=== 1. Decimal to Binary Conversion (Successive Division by 2)
Divide repeatedly by 2 and record remainders until quotient is 0. Read from bottom to top (MSB to LSB):
- #strong[Problem 1: Convert $(43)_{10}$ to Binary:]
  $43 / 2 = 21$ (Rem #strong[1] - LSB), $21 / 2 = 10$ (Rem #strong[1]), $10 / 2 = 5$ (Rem #strong[0]), $5 / 2 = 2$ (Rem #strong[1]), $2 / 2 = 1$ (Rem #strong[0]), $1 / 2 = 0$ (Rem #strong[1] - MSB).
  #hl[Result: $(43)_{10} = (101011)_2$]
- #strong[Problem 2: Convert $(101101)_2$ to Decimal:]
  $(1 times 2^5) + (0 times 2^4) + (1 times 2^3) + (1 times 2^2) + (0 times 2^1) + (1 times 2^0) = 32 + 0 + 8 + 4 + 0 + 1 =$ #hl[$(45)_10$].

#v(2pt)

=== 2. The 8-4-2-1 Hexadecimal Shortcut Rule
Because $16 = 2^4$, exactly #hl[one hexadecimal digit represents four binary bits] (a nibble). To convert between Binary and Hexadecimal, group bits into clusters of 4 starting from the right:

#v(1.5pt)

#table(
  columns: (0.8fr, 1.1fr, 0.8fr, 3.3fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Decimal*], [*4-Bit Binary*], [*Hex Digit*], [*Practical Worked Example*]),
  [0 to 9], [`0000` to `1001`], [`0` to `9`], [Convert `1101 1010` to Hex: `1101` = $8+4+0+1 = 13$ = #strong[D]; `1010` = $8+0+2+0 = 10$ = #strong[A]. Result: #hl[`(DA)_16`]],
  [10 to 15], [`1010` to `1111`], [`A` to `F`], [Convert `0x3F` to Binary: `3` = `0011`, `F` = `1111`. Result: #hl[`(00111111)_2 = (63)_10`]]
)

#v(2pt)

== 5.4 Signed Binary Arithmetic & 2's Complement Representation
Modern CPU ALUs execute subtraction as #hl[addition using 2's complement]: $A - B = A + ("2's comp of " B)$.
- #strong[Calculating 2's Complement of $+5$:] $+5 = `0000 0101`$ -> Invert (1's comp): `1111 1010` -> Add 1: #hl[`1111 1011` ($-5$)].
- #strong[Why 2's Complement:] Single unique zero (`00000000`), and identical adder hardware handles signed math without extra sign circuits.

#v(2pt)

// PAGE 3 OF CHAPTER 5: LOGIC GATES & CHARACTER ENCODINGS
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 05 · MATHEMATICAL FOUNDATIONS]
== 5.5 Fundamental & Universal Logic Gates
Logic gates are physical semiconductor circuits executing Boolean functions:

#v(1.5pt)

#table(
  columns: (0.8fr, 1.1fr, 1fr, 3.1fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.5pt,
  table.header([*Gate*], [*Equation*], [*Output*], [*Industrial Silicon Behavior*]),
  [#strong[AND]], [$Y = A dot B$], [1 if BOTH are 1], [True only when all prerequisites are satisfied.],
  [#strong[OR]], [$Y = A + B$], [1 if ANY is 1], [True if at least one condition is met (key press OR mouse click).],
  [#strong[NOT]], [$Y = overline{A}$], [Inverts ($0 arrow 1$)], [Inverter circuit. Reverses logic level or asserts active-low lines.],
  [#strong[NAND]], [$Y = overline{A dot B}$], [0 if BOTH are 1], [#hl[Universal Gate]. Any digital computer can be built using only NAND!],
  [#strong[NOR]], [$Y = overline{A + B}$], [1 if BOTH are 0], [#hl[Universal Gate]. Used in high-speed flash memories and latches.],
  [#strong[XOR]], [$Y = A xor B$], [1 if DIFFER], [Odd-parity generator; core calculation engine of binary adders.],
  [#strong[XNOR]], [$Y = overline{A xor B}$], [1 if MATCH], [Digital comparator circuit. Outputs 1 when register bits match.]
)

#v(1.5pt)

#block(stroke: 0.5pt + rtech-border, fill: rtech-paper, radius: 4pt, inset: 4pt)[
  #text(weight: "bold", size: 8pt, fill: rtech-navy)[De Morgan's Theorems:]
  #strong[Law 1:] $overline{A + B} = overline{A} dot overline{B}$ | #strong[Law 2:] $overline{A dot B} = overline{A} + overline{B}$
]

#v(2pt)

== 5.6 Character Encodings: ASCII vs Unicode (UTF-8)
Computers store text by mapping numeric binary integers to graphical glyphs:
- #strong[ASCII (7-Bit):] $2^7 = 128$ characters (`A` = 65 = `01000001`, `a` = 97 = `01100001`, `0` = 48 = `00110000`, Space = 32).
- #strong[Extended ASCII (8-Bit):] $2^8 = 256$ characters adding Western European special accents.
- #strong[Unicode & UTF-8:] 1 to 4-byte variable-length encoding representing #hl[1,114,112 code points]. Encodes every language on Earth (Hindi Devnagari, Mandarin, Arabic), math symbols ($pi, Sigma$), and emojis (💻, 🚀) with 100% backward compatibility with 7-bit ASCII!

#v(2pt)

=== Essential Standard ASCII Reference Matrix (High-Yield Exam Codes)
#table(
  columns: (1fr, 1.2fr, 1.2fr, 1fr, 1.2fr, 1.2fr, 1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.5pt,
  table.header([*Char*], [*Dec*], [*Binary*], [*Char*], [*Dec*], [*Binary*], [*Char*], [*Dec*], [*Binary*]),
  [`NUL`], [0], [`00000000`], [`Space`], [32], [`00100000`], [`@`], [64], [`01000000`],
  [`TAB`], [9], [`00001001`], [`0`], [48], [`00110000`], [`A`], [65], [`01000001`],
  [`LF`], [10], [`00001010`], [`1`], [49], [`00110001`], [`B`], [66], [`01000010`],
  [`CR`], [13], [`00001101`], [`9`], [57], [`00111001`], [`Z`], [90], [`01011010`],
  [`ESC`], [27], [`00011011`], [`:`], [58], [`00111010`], [`a`], [97], [`01100001`]
)

#v(2pt)

#block(stroke: 0.5pt + rtech-cyan, fill: rtech-paper, radius: 4pt, inset: 5pt)[
  #text(weight: "bold", size: 8pt, fill: rtech-navy)[Worked Boolean Simplification Problem:]\
  Simplify the expression $Y = overline{overline{A} dot B} + A dot B$ using Boolean theorems:
  - #strong[Step 1 (Apply De Morgan's Law):] $overline{overline{A} dot B} = overline{overline{A}} + overline{B} = A + overline{B}$.
  - #strong[Step 2 (Substitute):] $Y = (A + overline{B}) + A dot B = A + overline{B} + A dot B$.
  - #strong[Step 3 (Distributive Law):] $A + (overline{B} + A dot B) = A + (overline{B} + A) dot (overline{B} + B)$.
  - #strong[Step 4 (Complement Law $overline{B} + B = 1$):] $Y = A + overline{B} + A = A + overline{B}$. #hl[Final Simplified Circuit: $Y = A + overline{B}$]
]

#pagebreak()

// PAGE 4 OF CHAPTER 5: EVALUATION LAB (FAQS, Q&A, MCQS, FACT, QR)
#text(size: 8pt, font: "Consolas", weight: "bold", fill: rtech-cyan)[CHAPTER 05 · PRACTICE & EVALUATION LAB]
= Chapter 5 Comprehensive Review, FAQs & Evaluation Lab

#v(1.5pt)

== 1. Frequently Asked Student Questions (FAQs)
#faq-item(
  q: "Why do programmers and engineers use Hexadecimal instead of raw binary?",
  a: "A 32-bit binary address like `11000000101010000000000100000001` is nearly impossible for humans to read or type without error. In Hexadecimal, it condenses cleanly to 8 readable digits: `C0A80101`."
)
#faq-item(
  q: "Why is NAND called a 'Universal Gate'?",
  a: "Because any standard Boolean logic function (AND, OR, NOT, XOR, XNOR) and complex digital circuits (adders, multiplexers, latches) can be manufactured using only NAND gates, drastically simplifying silicon wafer fabrication."
)
#faq-item(
  q: "What is an integer overflow in binary computing?",
  a: "When an arithmetic operation produces a number larger than the maximum value representable in the allocated bits (e.g. adding 1 to 255 in an unsigned 8-bit register produces 0 instead of 256, because the 9th carry bit is discarded)."
)

#v(1.5pt)

== 2. Short-Answer Review Questions with Verified Answers
#short-qa(
  num: 1,
  q: "Convert decimal 25 into its equivalent 8-bit binary representation.",
  a: "Successive division yields: $25 = 16 + 8 + 1 = 2^4 + 2^3 + 2^0$. In 8-bit binary: `00011001`."
)
#short-qa(
  num: 2,
  q: "Calculate the 2's complement of the binary number `00101100`.",
  a: "Step 1 (Invert bits to 1's comp): `11010011`. Step 2 (Add 1): `11010011 + 1 = 11010100`."
)
#short-qa(
  num: 3,
  q: "Which logic gate outputs binary 1 if and only if its two inputs are different?",
  a: "The Exclusive-OR (XOR) gate ($Y = A xor B = A overline{B} + overline{A} B$)."
)
#short-qa(
  num: 4,
  q: "What is the ASCII decimal code for uppercase letter 'A' and digit '0'?",
  a: "Uppercase 'A' is 65 (`01000001`), and digit '0' is 48 (`00110000`)."
)

#v(1.5pt)

== 3. 5 High-Yield Chapter 5 Multiple-Choice Questions (MCQs)
#mcq(num: 1, q: "What is the decimal equivalent of the hexadecimal value 0x2A?", a: "32", b: "42", c: "52", d: "64", ans: "B", expl: "$0x2A = (2 times 16^1) + (10 times 16^0) = 32 + 10 = 42$.")
#mcq(num: 2, q: "Which of the following gates is classified as a Universal Gate?", a: "AND", b: "OR", c: "NAND", d: "XOR", ans: "C", expl: "NAND and NOR gates are universal gates because any logic circuit can be created using them exclusively.")
#mcq(num: 3, q: "In 8-bit signed 2's complement, what is the maximum positive value representable?", a: "+255", b: "+128", c: "+127", d: "+64", ans: "C", expl: "8-bit signed range is $-2^7 \" to \" +(2^7 - 1)$, which equals $-128 \" to \" +127$.")
#mcq(num: 4, q: "According to De Morgan's first theorem, the complement of (A + B) is equal to:", a: "not(A) + not(B)", b: "not(A) * not(B)", c: "A * B", d: "not(A) * B", ans: "B", expl: "De Morgan's first law states: (A + B)' = A' * B'.")
#mcq(num: 5, q: "How many bits are used in standard baseline ASCII character encoding?", a: "4 bits", b: "7 bits", c: "16 bits", d: "32 bits", ans: "B", expl: "Standard ASCII uses 7 bits to encode 128 distinct characters (0 to 127).")

#v(1.5pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [
    #fact-box(title: "Why 255 is Gaming's Most Famous Number")[
      In classic games like Pac-Man and early Pokémon, stats were stored in an 8-bit unsigned integer ($2^8 = 256$, values 0 to 255). Reaching level 256 caused an #hl[integer overflow], corrupting memory and creating the famous 'Split-Screen Kill Screen'!
    ]
  ],
  [
    #tool-qr-card(
      tool-name: "RTechLab Interactive Binary Converter",
      tool-desc: "Instantly convert numbers between Decimal, Binary, Octal, and Hexadecimal live on our interactive web tool:",
      qr-img: "/public/images/notes/qr-tool-binary-converter.svg",
      tool-url: "http://localhost:5173/tools/binary-converter"
    )
  ]
)
