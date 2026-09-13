#import "../../lib.typ": *
#import "../../../typst-contexture/lib.typ" as contexture

// Exercises figure-inventory() specifically: two figures, one table
// (distinct, independent numbering per kind), one figure with no
// caption at all, and confirms table cell text ("A"/"B") never leaks
// into the word count (found directly: it used to, concatenated with
// no separator into the nonsense token "AB" -- see CLAUDE.md).

#let my-template(body) = {
  set page(width: 16.6cm, height: auto, margin: 12pt)
  set text(size: 10.5pt)
  body
}

#show: contexture.bundle.with(
  template: instrument(template: my-template),
  documents: (report(),),
)

= Results

#figure(rect(width: 3cm, height: 2cm, fill: luma(230)), caption: [First figure.]) <fig-a>

#figure(table(columns: 2, [A], [B]), caption: [A results table.]) <tab-a>

#figure(rect(width: 2cm, height: 1cm, fill: luma(200)))

#figure(rect(width: 2cm, height: 1cm, fill: luma(200)), caption: [Second figure, no table in between.]) <fig-b>
