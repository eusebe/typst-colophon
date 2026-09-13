// Regression test for the Phase 4 fix documented in CLAUDE.md
// ("Phase 4" -> "Correction du 2026-09-13"): colophon's word count
// must reflect exactly what palimpsest's *clean* compile shows, even
// though passage()/add()/del()/rep() all render through a `context`
// block this package's pre-layout walk can't otherwise see into.
//
// Expected total: 6 + 7 + 7 + 1 = 21 words.
// - "This sentence has and stays short." (6) -- del()'d words gone.
// - "The old wording is now different today." (7) -- rep()'s `new`
//   only, never `old`.
// - "Plain touched text with six words total." (7) -- an ordinary
//   passage/touched(), no add/del/rep at all.
// - the figure's caption (1, "Caption.") -- proves the figure
//   inventory (Phase 2, query()-based) already saw content nested
//   inside a mark correctly, unaffected by this whole problem.

#import "../../lib.typ" as colophon
#import "/typst-palimpsest/lib.typ" as palimpsest
#import "../../../typst-contexture/lib.typ" as contexture

#let my-template(body) = {
  set page(width: 16.6cm, height: auto, margin: 12pt)
  set text(size: 10.5pt)
  body
}

#show: contexture.bundle.with(
  template: colophon.instrument(template: my-template),
  documents: (colophon.report(count-captions: true),),
)

= Methods

#palimpsest.passage(none)[
  This sentence has #palimpsest.del[four deleted words] and stays short.
]

#palimpsest.passage(none)[
  The old wording #palimpsest.rep[was here before][is now different] today.
]

#palimpsest.touched(none)[
  Plain touched text with six words total.
]

#palimpsest.passage(none)[
  #palimpsest.add[
    #figure(rect(), caption: [Caption.]) <fig-in-mark>
  ]
]
