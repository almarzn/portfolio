#import "./shared/sizes.typ": scale
#import "@preview/splash:0.3.0": tailwind


#let competency-main-skills(
  list
) = [
  #for skill in list [
    #box(
      radius: 16pt,
      inset: 6pt,
      fill: tailwind.slate-200,
      skill
    )
  ]

]

#let competency-block(radius: 12pt, element) = block(width: 124.815pt)[
  #block(
    fill: white,
    width: 100%,
    radius: radius,
    inset: 8pt,
    align(center + horizon)[
      [
        #text(fill: tailwind.orange-500, weight: "semibold", size: scale.h6, element.name)
      ]
    ]
  )

  #block(inset: (x: 8pt), list(..element.items))
]

#let competency-grid(
  ..elements
) = block(inset: (x: -16pt))[
  
  #style(styles => {
    let blocks = elements.pos().map(el => competency-block(el, radius: 4pt))

    let max-height = calc.max(..blocks.map(block => measure(block, styles).height))

    for el in blocks {
        box(
          height: (max-height) + 32pt,
          radius: 8pt,
          inset: 4pt,
          fill: tailwind.slate-100,
          align(top, el)
        )

        h(8pt)
      }
    })
]

#let create-block-description(name, id, content, color: tailwind.slate-100) =  {
  if id in content {
    return ((name: name, items: content.at(id), color: color))
  }

  return ()
}

#let competencies-presets = (
  dev: (
    create-block-description.with([Langages], "languages", color: tailwind.slate-100),
    create-block-description.with([Frameworks], "frameworks", color: tailwind.slate-100),
    create-block-description.with([Tests], "test_automation"),
    create-block-description.with([CI/CD], "ci_cd"),
    create-block-description.with([SGBD], "databases"),
    create-block-description.with([Outils], "tools"),
    create-block-description.with([Méthodo], "methodologies"),
    create-block-description.with([Langues], "spoken_languages")
  )
)

#let competencies(content) = {
  // competency-main-skills(
  //   content.languages + content.frameworks
  // )

  competency-grid(
    ..competencies-presets.dev.map(sel => sel(content)).flatten()
  )
}