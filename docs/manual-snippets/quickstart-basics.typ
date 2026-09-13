#import "../../lib.typ": *
#import "../../../typst-contexture/lib.typ" as contexture

#let my-template(body) = {
  set page(width: 16.6cm, height: auto, margin: 12pt)
  set text(size: 10.5pt)
  body
}

#show: contexture.bundle.with(
  template: instrument(template: my-template),
  documents: (report(),),
)

= Introduction

The purpose of this study was to evaluate a new intervention for a common
condition, building on prior work by Smith and colleagues @smith2020. We
hypothesized that the intervention would outperform standard care across
several outcome measures, and designed a trial to test this directly.

== Background

Prior studies have been limited by small sample sizes and short follow-up
periods, leaving important questions about long-term benefit unanswered.

= Methods

Participants were randomly assigned to one of two groups. The primary
outcome was assessed at twelve weeks by a rater blinded to group
assignment, using a validated instrument with well-established reliability.

#figure(
  rect(width: 3cm, height: 2cm, fill: luma(230)),
  caption: [A schematic overview of the study design, showing enrollment,
    randomisation, and the two follow-up visits.],
) <fig-design>

#bibliography("quickstart-basics-refs.bib")
