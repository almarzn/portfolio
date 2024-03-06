#import "./page.typ": *
#import "./shared/sizes.typ": scale
#import "@preview/splash:0.3.0": tailwind

#let default(body) = {
  let footer-size = 64pt

  set page(
    background: page-background(color: tailwind.orange-400),
    footer-descent: 0%,
    footer: page-footer(
      height: footer-size, 
      background: tailwind.slate-200,
      content: (
        header: "Max Digital Services Lyon",
        sub: [SIRET -- 56789876511],
        contact1: (
          name: [Kevin Delfour],
          phone: [01 02 03 04 05]
        ),
        contact2: (
          name: [Ornella Del Prado],
          phone: [07 93 10 02 30]
        )
      )
    ),
    margin: (x: 0pt, top: 48pt, bottom: footer-size)
  )
  
  set text(font: "Lexend")
  set text(size: scale.p)

  set heading(numbering: none)

  // show heading.where(level: 1): set text(weight: "bold", size: sizes.h1, tracking: 6pt, primary)
  // show heading.where(level: 1): set block(below: 30pt)
  // show heading.where(level: 1): it => {
  //   upper(it)
  // }

  // show heading.where(level: 2): set text(weight: "semibold", size: sizes.h2, primary)
  // show heading.where(level: 2): set block(spacing: 20pt)

  // show heading.where(level: 3): set text(weight: "medium", size: sizes.h3)
  // show heading.where(level: 3): set block(spacing: 20pt)

  // show heading.where(level: 4): set text(weight: "regular", size: 14.58pt)
  // show heading.where(level: 4): set block(spacing: 20pt)

  // show heading.where(level: 5): set text(weight: "light", size: 13.67pt)
  // show heading.where(level: 5): set block(spacing: 10pt)
  // show heading.where(level: 5): it => {
  //   upper(it)
  // }

  body
}