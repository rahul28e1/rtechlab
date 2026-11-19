#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Segoe UI", weight: "bold", fill: rtech-cyan)[CHAPTER 05 · DIGITAL LOGIC & BINARY MATHEMATICS]
= Chapter 5: Number Systems, 2's Complement & Boolean Logic

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  Positional number systems, radix conversion algorithms, signed 2's complement binary arithmetic, logic gate truth tables, universal NAND/NOR logic, Boolean algebra theorems, and character encodings (ASCII, Unicode, UTF-8).
]

#v(2pt)

== 5.1 Positional Number Systems: Radix & Mathematical Foundations
Digital computers represent all software opcodes, floating-point coordinates, and alphanumeric text as sequences of discrete binary digits. In a positional number system with base (radix) $r$, the numerical value $N$ is computed as the polynomial sum of its digits multiplied by integer powers of the base:
$ N = sum_(i=-m)^(n-1) d_i dot r^i $
#table(
  columns: (1fr, 0.8fr, 1.8fr, 2.4fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Number System*], [*Radix (r)*], [*Permissible Digit Symbols*], [*Positional Weight Multipliers & Real-World Use*]),
  [Binary], [2], [`0, 1`], [Powers of 2 ($2^0=1, 2^1=2, 2^2=4, 2^3=8$); native silicon transistor states.],
  [Octal], [8], [`0, 1, 2, 3, 4, 5, 6, 7`], [Powers of 8 ($8^0=1, 8^1=8, 8^2=64$); Unix file permissions (`chmod 755`).],
  [Decimal], [10], [`0, 1, 2, 3, 4, 5, 6, 7, 8, 9`], [Powers of 10 ($10^0=1, 10^1=10, 10^2=100$); human commerce and counting.],
  [Hexadecimal], [16], [`0–9, A, B, C, D, E, F`], [Powers of 16 ($16^0=1, 16^1=16, 16^2=256$); memory addresses, MAC, HTML colors.]
)

#v(2pt)

== 5.2 Step-by-Step Radix Conversion Algorithms
1. *Decimal to Binary / Octal / Hexadecimal (Repeated Division):*
   - Divide the integer decimal value by the target radix $r$; record the remainder. Continue dividing quotients until zero.
   - Read remainders in reverse order (first remainder is Least Significant Digit `LSD`, final remainder is Most Significant Digit `MSD`).
   - *Example:* Convert $43_10$ to Binary: $43 div 2 = 21 " rem 1" -> 21 div 2 = 10 " rem 1" -> 10 div 2 = 5 " rem 0" -> 5 div 2 = 2 " rem 1" -> 2 div 2 = 1 " rem 0" -> 1 div 2 = 0 " rem 1"$. Reading bottom-up yields $101011_2$.
2. *Binary to Hexadecimal & Octal (Fast Grouping):*
   - *Octal:* Partition binary string into groups of #hl[3 bits] from right to left ($2^3 = 8$). E.g., $101011_2 -> (101)_2 (011)_2 -> 53_8$.
   - *Hexadecimal:* Partition binary string into groups of #hl[4 bits] from right to left ($2^4 = 16$). E.g., $101011_2 -> (0010)_2 (1011)_2 -> 2 B_16$.

#pagebreak()

== 5.3 Signed Integer Arithmetic: 1's Complement vs 2's Complement
Digital ALUs execute signed subtraction using binary adders via complement representations:
- *Sign-Magnitude:* Uses the MSB as a sign bit (`0` = positive, `1` = negative). Suffers from two distinct representations of zero (`+0` as `00000000` and `-0` as `10000000`) and requires complex arithmetic comparison circuitry.
- *1's Complement:* Invert all bits (0 becomes 1, 1 becomes 0). Still retains dual representations of zero (`00000000` and `11111111`) and requires end-around carry addition.
- *2's Complement (Universal Hardware Standard):* Formed by taking the 1's complement and #hl[adding 1 to the least significant bit]:
$ "2\'s Complement"(X) = overline(X) + 1 $
- *Mathematical Representation Range:* For an $n$-bit signed 2's complement register, the permissible integer range is:
$ -2^(n-1) quad text("to") quad 2^(n-1) - 1 $
For an 8-bit byte ($n=8$), the valid range is precisely #hl[$-128$ to $+127$]. 2's complement provides a single unique zero (`00000000`), allows subtraction to be performed with standard adder hardware ($A - B = A + (-B)$), and enables natural hardware overflow detection (overflow occurs if two numbers of like sign yield a result with the opposite sign).

#v(2pt)

== 5.4 Fundamental Digital Logic Gates & Truth Tables
#table(
  columns: (1.1fr, 0.9fr, 1.3fr, 2.7fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 2.8pt,
  table.header([*Logic Gate*], [*Symbol*], [*Boolean Expression*], [*Truth Table Behavior & Functional Output*]),
  [AND Gate], [Two-input AND], [$Y = A dot B$], [Output is HIGH (1) if and only if both inputs $A$ and $B$ are HIGH. Models series switches.],
  [OR Gate], [Two-input OR], [$Y = A + B$], [Output is HIGH (1) if at least one input ($A$ or $B$) is HIGH. Models parallel switches.],
  [NOT Gate], [Inverter], [$Y = overline(A)$], [Output is the logical inversion of the input ($0 -> 1$, $1 -> 0$). Single-transistor inverter.],
  [NAND Gate], [Inverted AND], [$Y = overline(A dot B)$], [Output is LOW (0) only when both inputs are HIGH; HIGH for all other combinations.],
  [NOR Gate], [Inverted OR], [$Y = overline(A + B)$], [Output is HIGH (1) only when both inputs are LOW; LOW for all other combinations.],
  [XOR Gate], [Exclusive OR], [$Y = A xor B = A overline(B) + overline(A) B$], [#hl[Output is HIGH only when inputs differ] ($0,1$ or $1,0$); outputs 0 for identical inputs. Fundamental to binary half-adders.],
  [XNOR Gate], [Equivalence], [$Y = overline(A xor B) = A B + overline(A) overline(B)$], [Output is HIGH when both inputs are identical ($0,0$ or $1,1$). Parity checkers.]
)

#pagebreak()

== 5.5 Universal Logic Gates: NAND & NOR Implementation
A logic family is classified as *Universal* if any arbitrary Boolean function (AND, OR, NOT, XOR, multiplexers) can be synthesized exclusively using that single gate type, simplifying chip fabrication:
- *Inverter (NOT) from NAND:* Tie both inputs together: $Y = overline(A dot A) = overline(A)$.
- *AND Gate from NAND:* Follow a NAND gate with a NAND inverter: $Y = overline(overline(A dot B)) = A dot B$.
- *OR Gate from NAND (De Morgan's Theorem):* Invert inputs separately prior to NAND: $Y = overline(overline(A) dot overline(B)) = overline(overline(A)) + overline(overline(B)) = A + B$.

#v(2pt)

== 5.6 Axiomatic Boolean Algebra & De Morgan's Laws
#table(
  columns: (1.5fr, 1.8fr, 1.8fr),
  fill: (x, y) => if y == 0 { rtech-navy } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.3pt + rtech-border,
  inset: 3pt,
  table.header([*Boolean Law Name*], [*AND Form (Conjunction)*], [*OR Form (Disjunction)*]),
  [Identity Law], [$A dot 1 = A$], [$A + 0 = A$],
  [Null / Annulment Law], [$A dot 0 = 0$], [$A + 1 = 1$],
  [Idempotent Law], [$A dot A = A$], [$A + A = A$],
  [Complement Law], [$A dot overline(A) = 0$], [$A + overline(A) = 1$],
  [Commutative Law], [$A dot B = B dot A$], [$A + B = B + A$],
  [Associative Law], [$(A dot B) dot C = A dot (B dot C)$], [$(A + B) + C = A + (B + C)$],
  [Distributive Law], [$A + (B dot C) = (A + B) dot (A + C)$], [$A dot (B + C) = (A dot B) + (A dot C)$],
  [De Morgan's First Law], [$overline(A + B) = overline(A) dot overline(B)$], [The complement of a sum equals the product of complements.],
  [De Morgan's Second Law], [$overline(A dot B) = overline(A) + overline(B)$], [The complement of a product equals the sum of complements.]
)

#v(2pt)

== 5.7 Alphanumeric Character Encodings: ASCII, Unicode & UTF-8
- *Standard ASCII (7-bit):* Defines 128 characters (codes 0 to 127), including English letters (`A` = 65 = `01000001_2`), numerals (`0` = 48), and non-printable control codes (`CR` = 13, `LF` = 10).
- *Extended ASCII (8-bit):* Defines 256 characters (codes 0 to 255), adding European accented characters and graphical borders.
- *Unicode & UTF-8 (Universal Standard):* Unicode assigns a unique 21-bit code point (`U+0000` to `U+10FFFF`, over 1.1 million possible characters) to every script (Devanagari, Latin, Cyrillic, Chinese, Emoji). #hl[UTF-8] is a backwards-compatible variable-length encoding: 1 byte for standard ASCII (0–127), 2 bytes for Greek/Arabic/Hebrew, 3 bytes for Devanagari (`क` = `U+0915` encoded as `0xE0 0xA4 0x95`), and 4 bytes for mathematical symbols and emoji.

#pagebreak()

== Comprehensive Review, FAQs & Chapter Evaluation

#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[1. Frequently Asked Student Questions (FAQs)]
#faq-item(q: "Why do digital computers use binary instead of decimal internally?", a: "Transistors operate as electronic switches with two reliable physical states: saturated conductive ON (1) and cut-off non-conductive OFF (0), providing immense noise immunity.")
#faq-item(q: "What is the primary advantage of 2's complement over 1's complement?", a: "2's complement provides a single unique zero (00000000) and allows binary addition circuits to execute subtraction naturally without end-around carry correction.")
#faq-item(q: "Why is UTF-8 the universal encoding of the modern Internet?", a: "UTF-8 is completely backwards-compatible with 7-bit ASCII, uses only 1 byte for English characters, and dynamically expands up to 4 bytes for international languages and emoji.")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[2. Short-Answer Review Questions]
#short-q(num: 1, q: "What is the radix (base) of the hexadecimal number system?", ans: "16 (symbols 0-9 and A-F).")
#short-q(num: 2, q: "State the minimum and maximum signed integers representable in 8-bit 2's complement.", ans: "-128 to +127.")
#short-q(num: 3, q: "Which digital logic gate produces a HIGH output only when its inputs have different values?", ans: "XOR (Exclusive OR) gate.")
#short-q(num: 4, q: "According to Boolean algebra, what does the expression A + A' evaluate to?", ans: "1 (Complement Law).")

#v(1pt)
#text(size: 7.5pt, weight: "bold", fill: rtech-navy)[3. 5 High-Yield Multiple-Choice Questions (MCQs)]
#mcq(num: 1, q: "What is the binary representation of decimal value 29?", a: "11001", b: "11101", c: "10111", d: "11110", ans: "B", expl: "29 = 16 + 8 + 4 + 1 = 11101 in binary.")
#mcq(num: 2, q: "What is the 8-bit 2's complement representation of decimal integer -5?", a: "11111010", b: "11111011", c: "10000101", d: "11111100", ans: "B", expl: "+5 is 00000101. 1's complement is 11111010. Adding 1 yields 11111011.")
#mcq(num: 3, q: "Which of the following gates is classified as a Universal logic gate?", a: "AND", b: "OR", c: "NAND", d: "XOR", ans: "C", expl: "NAND and NOR gates are universal because any Boolean logic function can be constructed using them alone.")
#mcq(num: 4, q: "According to De Morgan's Law, what is the equivalent expression for (A . B)'?", a: "A' . B'", b: "A' + B'", c: "A + B", d: "A' + B", ans: "B", expl: "De Morgan's theorem states that the complement of a product equals the sum of complements: (A . B)' = A' + B'.")
#mcq(num: 5, q: "How many unique characters can be represented using standard 7-bit ASCII encoding?", a: "64", b: "128", c: "256", d: "512", ans: "B", expl: "A 7-bit code provides 2^7 = 128 unique character combinations (code points 0 to 127).")

#v(1pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    #fact-box(title: "The Zero Dilemma in 1's Complement")[
      Early computers using 1's complement had '+0' (00000000) and '-0' (11111111), causing software bugs when comparing conditional equality!
    ]
  ],
  [
    #tech-spotlight-box(title: "Quantum Superposition & Qubits")[
      Classical bits are strictly 0 or 1. Quantum bits (Qubits) exist in a superposition of both states simultaneously, exponentially scaling parallel compute!
    ]
  ]
)

#v(1pt)
#practice-lab-placeholder(lang: "en")
