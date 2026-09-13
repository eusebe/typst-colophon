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

= Abstract

#abstract[
  This abstract has exactly seven words here.
]

= Introduction

This is the real body of the manuscript, with six words counted here.
