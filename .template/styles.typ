#let default(body) = {
  set text(font: "Lexend")
  set text(size: 12pt)
  set block(spacing: 20pt)

  let primary = orange

  set par(justify: true, linebreaks: "optimized")
  set heading(numbering: none)

  show heading.where(level: 1): set text(weight: "bold", size: 17.71pt, tracking: 6pt, primary)
  show heading.where(level: 1): set block(below: 30pt)
  show heading.where(level: 1): it => {
    upper(it)
  }

  show heading.where(level: 2): set text(weight: "semibold", size: 16.6pt, primary)
  show heading.where(level: 2): set block(spacing: 20pt)

  show heading.where(level: 3): set text(weight: "medium", size: 15.56pt)
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