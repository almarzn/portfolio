#import "maxds.typ": *
#import "sizes.typ": *

#let default(body) = {
  set page(fill: background, margin: 48pt)
  set text(font: "Lexend")
  set text(size: sizes.p)
  set block(spacing: 20pt)

  set par(justify: true, linebreaks: "optimized")
  set heading(numbering: none)

  show heading.where(level: 1): set text(weight: "bold", size: sizes.h1, tracking: 6pt, primary)
  show heading.where(level: 1): set block(below: 30pt)
  show heading.where(level: 1): it => {
    upper(it)
  }

  show heading.where(level: 2): set text(weight: "semibold", size: sizes.h2, primary)
  show heading.where(level: 2): set block(spacing: 20pt)

  show heading.where(level: 3): set text(weight: "medium", size: sizes.h3)
  show heading.where(level: 3): set block(spacing: 20pt)

  show heading.where(level: 4): set text(weight: "regular", size: 14.58pt)
  show heading.where(level: 4): set block(spacing: 20pt)

  show heading.where(level: 5): set text(weight: "light", size: 13.67pt)
  show heading.where(level: 5): set block(spacing: 10pt)
  show heading.where(level: 5): it => {
    upper(it)
  }

  body
}