// Phase 4: colophon against a real, unrelated Typst Universe template
// (@preview/unequivocal-ams), not the minimal stand-in templates used
// throughout tests/bundle-basics/ etc. -- the same real-template check
// checkitoff/palimpsest's own roadmaps call for. Also exercises
// `abstract(...)` against the exact case it exists for: an
// `abstract:` template parameter, evaluated before `instrument()`'s
// own `template:` ever sees `body` -- `lorem(100)` is a real,
// citation-free 100-word block, so "Abstract word count: 100" here is
// a precise, hand-checkable expectation, not just "some number".

#import "@preview/unequivocal-ams:0.1.2": ams-article, theorem, proof
#import "../../lib.typ": *
#import "../../../typst-contexture/lib.typ" as contexture

#let my-template = ams-article.with(
  title: [Mathematical Theorems],
  authors: (
    (
      name: "Janet Doe",
      department: [Department of Mathematics],
      organization: [University of Exampleville],
      location: [Tennessee, TN 59341],
      email: "jdoe@math.ue.edu",
      url: "math.ue.edu/~jdoe",
    ),
  ),
  abstract: abstract(lorem(100)),
  bibliography: bibliography("refs.bib"),
)

#show: contexture.bundle.with(
  template: instrument(template: my-template),
  documents: (report(bib: "/typst-colophon/tests/bundle-real-template/refs.bib"),),
)

Call me Ishmael. Some years ago --- never mind how long precisely ---
having little or no money in my purse, and nothing particular to
interest me on shore, I thought I would sail about a little and see
the watery part of the world. It is a way I have of driving off the
spleen, and regulating the circulation.  Whenever I find myself
growing grim about the mouth; whenever it is a damp, drizzly November
in my soul; whenever I find myself involuntarily pausing before coffin
warehouses, and bringing up the rear of every funeral I meet; and
especially whenever my hypos get such an upper hand of me, that it
requires a strong moral principle to prevent me from deliberately
stepping into the street, and methodically knocking people's hats off
--- then, I account it high time to get to sea as soon as I can. This
is my substitute for pistol and ball. With a philosophical flourish
Cato throws himself upon his sword; I quietly take to the ship. There
is nothing surprising in this. If they but knew it, almost all men in
their degree, some time or other, cherish very nearly the same
feelings towards the ocean with me. @netwok2020

There now is your insular city of the Manhattoes, belted round by
wharves as Indian isles by coral reefs - commerce surrounds it with
her surf. Right and left, the streets take you waterward. Its extreme
down-town is the battery, where that noble mole is washed by waves,
and cooled by breezes, which a few hours previous were out of sight of
land. Look at the crowds of water-gazers there.

Anyone caught using formulas such as $sqrt(x+y)=sqrt(x)+sqrt(y)$
or $1/(x+y) = 1/x + 1/y$ will fail.

The binomial theorem is
$ (x+y)^n=sum_(k=0)^n binom(n, k) x^k y^(n-k). $

A favorite sum of most mathematicians is
$ sum_(n=1)^oo 1/n^2 = pi^2 / 6. $

Likewise a popular integral is
$ integral_(-oo)^oo e^(-x^2) dif x = sqrt(pi) $

#theorem[
  The square of any real number is non-negative.
]

#proof[
  Any real number $x$ satisfies $x > 0$, $x = 0$, or $x < 0$. If $x = 0$,
  then $x^2 = 0 >= 0$. If $x > 0$ then as a positive time a positive is
  positive we have $x^2 = x x > 0$. If $x < 0$ then $−x > 0$ and so by
  what we have just done $x^2 = (−x)^2 > 0$. So in all cases $x^2 ≥ 0$.
]

= Introduction
This is a new section.
You can use tables like @solids.

#figure(
  table(
    columns: (1fr, auto, auto),
    inset: 5pt,
    align: horizon,
    table.header(
      [], [*Area*], [*Parameters*]
    ),
    [*Cylinder*],
    $ pi h (D^2 - d^2) / 4 $,
    [$h$: height \
     $D$: outer radius \
     $d$: inner radius],
    [*Tetrahedron*],
    $ sqrt(2) / 12 a^3 $,
    [$a$: edge length]
  ),
  caption: "Solids",
) <solids>

== Things that need to be done
Prove theorems, such as @thm.

#theorem[The Riemann hypothesis is true.] <thm>

#proof[This is left as an exercise to the reader, given the complexity of the theorem.]

= Background
#lorem(40)

// Deliberately never referenced anywhere -- exercises orphan-label
// detection against a real template's own show rules.
#figure(rect(), caption: [An orphan figure, added for this test.]) <fig-never-referenced>
