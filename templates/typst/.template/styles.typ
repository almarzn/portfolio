#import "./page.typ": *
#import "./shared/sizes.typ": scale
#import "@preview/splash:0.3.0": tailwind

#let margin-small = block.with(inset: (x: 8pt));
#let margin-medium = block.with(inset: (x: 16pt));
#let margin-large = block.with(inset: (x: 32pt));
#let margin-xlarge = block.with(inset: (x: 48pt));

#let default(body) = {
  let footer-size = 64pt
  let base-margin = 24pt

  // set block(stroke: (paint: blue, thickness: 1pt, dash: "dashed"))
  // set grid(st: (paint: yellow, thickness: 1pt, dash: "dashed"))

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
    margin: (x: 0pt, top: 0pt, bottom: footer-size)
  )
  
  set text(font: "Lexend")
  set text(size: scale.p)

  set heading(numbering: none)

  show heading.where(level: 1): set text(size: scale.h1)
  show heading.where(level: 1): set block(below: 20pt)
  // show heading.where(level: 1): it => {
  //   upper(it)
  // }

  show heading.where(level: 2): set text(size: scale.h2, fill: tailwind.orange-500)
  show heading.where(level: 2): set block(spacing: 0pt)

  show heading.where(level: 3): set text(weight: "extrabold", size: scale.h3)
  // show heading.where(level: 3): set block(spacing: 20pt)

  show heading.where(level: 4): set text(weight: "semibold", size: scale.h4)
  // show heading.where(level: 4): set block(spacing: 20pt)

  show heading.where(level: 5): set text(weight: "light", size: scale.h5)
  // show heading.where(level: 5): set block(spacing: 10pt)
  show heading.where(level: 5): it => {
    upper(it)
  }
  body
}

#let section-heading(
  icon,
  text
) = [
  == #grid(
    columns: (32pt, auto, 1fr),
    column-gutter: 12pt,
    align(center + horizon, block(icon)),
    align(horizon, text),
    align(horizon, line(length: 100%, stroke: (paint: tailwind.orange-400, thickness: 3pt, cap: "round"))),
  )
]

// #let section-heading(
//   icon,
//   content
// ) = block(inset: 8pt, radius: 4pt, fill: tailwind.orange-400)[
//   == #text(fill: white, [#box(width: 32pt, align(center + horizon, icon)) #content])
// ]