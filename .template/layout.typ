
#let presentation(contents) = [
  = #contents.name

  #set text(weight: "light")
  #contents.presentation
]

#let skills(contents) = [
  == Compétences

  #grid(
    columns: (1fr, 2fr),
    gutter: 12pt,
    ..contents.skills.flatten().map(it => ([
      #set text(weight: "light")
      #it.title
    ], it.items.join(" // "))).flatten(),
  )

]

#let experiences(contents) = [
  #import "@preview/cmarker:0.1.0"

  == Expériences

  #for experience in contents.experiences [
    === #experience.name

    #heading(level: 4, [
      #experience.title
      #h(12pt)
      #set text(size: 12pt, weight: "light")
      #experience.dates
    ])

    #experience.description

    ===== Technos

    #experience.skills.join(", ")

    ===== Réalisations

    #for work in experience.work [
      ====== #work.title

      #cmarker.render(work.content)
    ]
  ]
]
