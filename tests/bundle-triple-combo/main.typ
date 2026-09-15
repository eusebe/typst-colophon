// Phase 4, part 2: colophon combined with BOTH palimpsest and checkitoff
// in the same bundle -- reuses the exact manuscript/responses already
// exercised by ../../combo-test-consort-palimpsest/, so this adds a
// third satellite (colophon's report()) to an already-proven
// combination rather than inventing a new one. Specifically checks
// whether colophon's word count sees text rendered by palimpsest's
// add()/del() -- which, unlike checkitoff's check(), always wraps its
// rendering in `context`, even in plain/clean mode (see CLAUDE.md).

#import "../../lib.typ" as colophon
#import "/typst-palimpsest/lib.typ" as palimpsest
#import "/typst-checkitoff/lib.typ" as checkitoff
#import "../../../typst-contexture/lib.typ" as contexture

#let simple-template(title: none, body) = {
  set page(paper: "a4", margin: 2.5cm)
  set text(size: 11pt)
  set heading(numbering: "1.")
  align(center, text(size: 1.4em, weight: "bold")[#title])
  v(1em)
  body
}

#show: contexture.bundle.with(
  template: colophon.instrument(
    template: simple-template.with(title: [Combined test -- palimpsest + checkitoff + colophon]),
  ),
  documents: (
    palimpsest.letter(exchanges: include "/combo-test-consort-palimpsest/responses.typ", round: 1),
    checkitoff.checklist(checklist: checkitoff.checklists.consort),
    colophon.report(),
  ),
)

#include "/combo-test-consort-palimpsest/manuscript.typ"
