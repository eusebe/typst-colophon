#import "../../lib.typ": *
#import "../../../typst-contexture/lib.typ" as contexture

#let my-template(body) = {
  set page(width: 16.6cm, height: auto, margin: 12pt)
  set text(size: 10.5pt)
  set heading(numbering: "1.")
  body
}

#show: contexture.bundle.with(
  template: instrument(template: my-template),
  documents: (
    report(bib: "/typst-colophon/tests/bundle-anomalies/refs.bib"),
  ),
)

= Introduction <sec-intro>

Some background, citing prior work @smith2020 -- this heading's own
label, `<sec-intro>`, is never referenced anywhere, unlike the figure
below.

#figure(rect(), caption: [Referenced figure.]) <fig-a>

See @fig-a for the referenced figure above.

#figure(rect(), caption: [Orphan figure, never referenced anywhere.]) <fig-orphan>

#bibliography("refs.bib")
