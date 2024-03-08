// @font-face(https://fonts.google.com/download?family=Lexend)

#import ".template/title.typ": title
#import ".template/competencies.typ": competencies
#import ".template/about.typ": about-section
#import ".template/education.typ": education
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
        #content.presentation
      ],

      styles.margin-large()[
        == Compétences
      ],

      styles.margin-small(
        block(
          competencies(content.skills)
        )
      ),

      styles.margin-large()[
        == Formations
      ],

      styles.margin-large()[
        #education(content.education)
      ],
    ))
]