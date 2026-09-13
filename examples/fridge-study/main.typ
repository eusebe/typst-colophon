// Copied from ../../../typst-palimpsest/examples/fridge-study/ (a real,
// full-length fake article palimpsest itself uses to test against
// @preview/unequivocal-ams + @preview/lilaq figures) and wired up for
// colophon too -- a genuinely more complex manuscript than anything in
// tests/: multiple sections/subsections, several real figures (some
// built with lilaq, not just placeholder rects), a table, a citation
// inside a passage()/rep(), a heading itself wrapped in
// passage()/add(), and both reviewer- and editor-anchored exchanges.
// See CLAUDE.md, "Examples with real palimpsest manuscripts" for what
// this was checked against.
#import "../../lib.typ" as colophon
#import "../../../typst-palimpsest/lib.typ": *
#import "../../../typst-contexture/lib.typ" as contexture
#import "@preview/unequivocal-ams:0.1.2": ams-article, theorem, proof

// A lightweight letter template echoing the manuscript's own typeface,
// rather than reusing `ams-article` itself — the letter is a short
// reviewer-facing document, not a second article with its own title
// page, abstract, and author block.
#let letter-template(body) = {
  set text(font: "New Computer Modern", size: 10pt)
  set par(justify: true, first-line-indent: 0em)
  align(center, text(size: 1.3em, weight: 700)[Response to Reviewers])
  v(0.3em)
  align(center, emph[Association between fridge opening frequency and
  probability of finding something new inside])
  v(1.5em)
  body
}

#show: contexture.bundle.with(
  template: colophon.instrument(template: ams-article.with(
    title: [Association between fridge opening frequency and probability
    of finding something new inside],
    authors: (
      (
        name: "Ivana Snackwell",
        department: [Department of Kitchen Epidemiology],
        organization: [Institute of Domestic Sciences],
        location: [Fridgeport, IL],
        email: "ivana.snackwell@example.org",
      ),
      (
        name: "Tupper Ware",
        department: [Behavioral Nutrition Laboratory],
        organization: [University of Leftovers],
        location: [Crispington, OH],
        email: "tupper.ware@example.org",
      ),
    ),
    abstract: colophon.abstract([
      Background: repeated refrigerator-door-opening behavior ("fridge-
      checking") is common, but its relationship to the subjective
      probability of discovering something new inside remains
      uncharacterized. Methods: we conducted a 30-day prospective
      observational study of 42 households, logging daily fridge-opening
      frequency and self-reported discovery of novel contents. Results:
      discovery probability increased steadily with opening frequency,
      despite grocery deliveries being held constant across groups.
      Conclusion: these findings are consistent with an intermittent-
      reinforcement account of fridge-checking behavior, in which
      occasional genuine discoveries maintain a high rate of
      unrewarded checking.
    ]),
    bibliography: bibliography("manuscript.bib"),
  )),
  documents: (
    letter(exchanges: include "responses.typ", template: letter-template),
    colophon.report(bib: "/typst-colophon/examples/fridge-study/manuscript.bib"),
  ),
)

#include "manuscript.typ"
