#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: THE AI ODYSSEY & HISTORICAL FOUNDATIONS · CHAPTER 02]
= Golden Age, Perceptrons & The First AI Winter (1957–1980)

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  The initial optimism of the 1960s promised human-level machine translation and autonomous vision within a decade. However, mathematical limitations in single-layer neural architectures and gross overpromising triggered a devastating collapse in funding known as the First AI Winter.
]

#v(2pt)

== 2.1 Frank Rosenblatt & The Mark I Perceptron (1957)

In 1957, American psychologist Frank Rosenblatt constructed the *Perceptron* at the Cornell Aeronautical Laboratory. Running on an IBM 704 vacuum-tube mainframe and later custom hardware featuring 400 cadmium sulfide photocells (a 20x20 visual array) wired with motorized potentiometers for adaptive weights:

#table(
  columns: (1.2fr, 2.8fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2.2pt),
  table.header([*Component*], [*Mathematical Formula / Operation*], [*Physical Hardware Mechanism*]),
  [Input Vector ($x_i$)], [Binary photocell activations $x_1, x_2, dots, x_n in {0, 1}$], [20x20 grid of optical sensors in camera box],
  [Synaptic Weight ($w_i$)], [Continuous real-valued weight vector $arrow(w)$], [Rotary potentiometers adjusted by electric motors],
  [Net Activation ($z$)], [$z = sum_(i=1)^n w_i x_i + b = arrow(w) dot arrow(x) + b$], [Analog electrical summing junction circuit],
  [Output Function ($y$)], [$y = 1$ if $z >= 0$, else $0$ (Heaviside Step)], [Bistable relay flipping on positive voltage]
)

#v(2pt)
#concept-box(title: "PERCEPTRON WEIGHT UPDATE CONVERGENCE THEOREM (1962)")[
  Rosenblatt proved that if training data is *linearly separable*, the perceptron learning rule $w_i arrow.l w_i + eta (y_("true") - y_("pred")) x_i$ is guaranteed to converge to a separating hyperplane in a finite number of iterations, where $eta$ is the learning rate.
]
#v(2pt)

== 2.2 The Minsky-Papert Critique & The XOR Deathblow (1969)

In 1969, Marvin Minsky and Seymour Papert published their book *Perceptrons: An Introduction to Computational Geometry*. In Chapter 13, they delivered an airtight mathematical proof showing that single-layer perceptrons could not compute the simple *Exclusive-OR (XOR)* logical function:

#table(
  columns: (1fr, 1.2fr, 1.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Input $x_1$*], [*Input $x_2$*], [*Target $y$ (XOR)*], [*Geometric Impossibility with Single Line*]),
  [$0$], [$0$], [$0$], [Point $(0,0)$ requires output $0$],
  [$0$], [$1$], [$1$], [Point $(0,1)$ requires output $1$ (Separation impossible)],
  [$1$], [$0$], [$1$], [Point $(1,0)$ requires output $1$ (Requires non-linear boundary)],
  [$1$], [$1$], [$0$], [Point $(1,1)$ requires output $0$ (No single straight line can split classes)]
)

Although multi-layer networks could solve XOR, no algorithm existed in 1969 to calculate gradients for hidden layers. This caused an abrupt cessation of artificial neural network funding for over 15 years.

#v(2pt)

== 2.3 The Lighthill Report & The First AI Winter (1974–1980)

In 1973, Professor Sir James Lighthill evaluated AI research for the British Science Research Council. The *Lighthill Report (1973)* concluded that nowhere had the wild promises of AI materialized, identifying the *"Combinatorial Explosion"*—as problem complexity scaled, search spaces grew factorially beyond any computer's capacity.

#warning-box(title: "THE LESSON OF THE FIRST AI WINTER FOR MODERN ENGINEERS")[
  Simultaneously, the US Congress passed the Mansfield Amendment, barring DARPA from funding open-ended research without immediate military battlefield payoff. Funding dried up globally from 1974 to 1980. The immutable law: *When claims outpace compute, hardware capabilities, and rigorous math, an AI Winter is inevitable.*
]

#v(2.5pt)
== 2.4 The Geometric Geometry of Convex Polyhedra

The mathematical failure of single-layer perceptrons stems from the fundamental properties of linear hyperplanes:
- A single linear decision boundary $arrow(w) dot arrow(x) + b = 0$ can only divide space into two half-spaces.
- In classification problems where positive instances form disconnected clusters or non-convex regions (such as XOR or toroidal topologies), a single hyperplane provably cannot separate the classes.
- *The Multi-Layer Solution*: Stacking hidden layers transforms the input vector $arrow(x)$ into an intermediate latent representation $arrow(h)$ where non-linear activation functions ($sigma$) warp the manifold, rendering previously non-separable data linearly separable.

#v(2pt)
#concept-box(title: "ENTERPRISE EXAM & INTERVIEW SPOTLIGHT: THE LINEAR SEPARABILITY DILEMMA")[
  - *Core Interview Trap*: Interviewers frequently ask: "Why could not the Perceptron solve XOR when it easily solved AND and OR?" Answer: AND and OR truth tables can be divided by a single straight line in 2D space ($x_1 + x_2 - 1.5 = 0$). XOR requires a non-linear parabolic or double-hyperplane boundary.
  - *Modern Production Equivalent*: Single linear layers without non-linear activation functions ($sigma$) can only form convex polyhedral boundaries. Deep Learning overcomes this by stacking hidden layers with non-linear activations (GELU/Swish) to fold the geometric manifold into linearly separable spaces.
]
