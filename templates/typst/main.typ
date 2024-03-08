// @font-face(https://fonts.google.com/download?family=Lexend)

#import "@preview/fontawesome:0.1.0": *
#import ".template/title.typ": title
#import ".template/competencies.typ": competencies
#import ".template/about.typ": about-section
#import ".template/education.typ": education
#import ".template/presentation.typ": presentation-section
#import ".template/styles.typ"

#let content = yaml("data.yaml")

#styles.default[
    #block(inset: (x: 24pt), grid(
      row-gutter: 24pt,
      block(
        inset: (x: 24pt, top: 48pt),
        title(
          profile: (
            name: content.profile.name,
            title: content.profile.title,
            tagline: [#content.profile.experience d'XP -- Dispo #content.profile.availability]
          )
        )
      ),

      styles.margin-large()[
        #set par(justify: true)
        
        #presentation-section(content.presentation, content.links)
      ],

      styles.margin-large()[
        #styles.section-heading(fa-list-check(), [Compétences])
      ],

      styles.margin-small(
        competencies(content.skills)
      ),

      styles.margin-large()[
        #styles.section-heading(fa-user-graduate(), [Éducation])
      ],

      styles.margin-large()[
        #education(content.education)
      ],
    ))
]