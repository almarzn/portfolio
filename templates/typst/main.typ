// @font-face(https://fonts.google.com/download?family=Lexend)

#import "@preview/fontawesome:0.1.0": *
#import ".template/title.typ": title
#import ".template/competencies.typ": competencies
#import ".template/about.typ": about-section
#import ".template/education.typ": education
#import ".template/presentation.typ": presentation-section
#import ".template/experiences.typ": experience-block
#import ".template/shared/flex.typ": *
#import ".template/styles.typ"

#let content = yaml("data.yaml")

#styles.default[
    #block(inset: (x: 24pt), flex(
      gap: 24pt,
      {
        block(
          inset: (x: 24pt, top: 48pt),
          title(
            profile: (
              name: content.profile.name,
              title: content.profile.title,
              tagline: [#content.profile.experience d'XP -- Dispo #content.profile.availability]
            )
          )
        )

        styles.margin-large()[
          #set par(justify: true)
          
          #presentation-section(content.presentation, content.links)
        ]

        styles.margin-large()[
          #styles.section-heading(fa-list-check(baseline: -1pt), [Compétences])
        ]

        styles.margin-small(
          competencies(content.skills)
        )

        styles.margin-large()[
          #styles.section-heading(fa-user-graduate(baseline: -2pt), [Formation])
        ]

        styles.margin-large()[
          #education(content.education)
        ]
      })
    )


    #for experience in content.experiences [
      #set page(header: [
        #place(
          top + right,
          dx: 25pt,
          dy: 30pt,
          image(".template/logo/maxds-logo-light.svg", height: 200pt)
        )
      ], margin: (top: 12pt))
      #pagebreak(weak: true)
      #block(
        inset: (top: 48pt),
        flex(gap: 24pt)[
          #styles.margin-large()[
            #styles.section-heading(fa-briefcase(baseline: -1pt), [Expériences])
          ]
          #styles.margin-xlarge()[
            #experience-block(experience)
          ]
        ]
      )
    ]
]