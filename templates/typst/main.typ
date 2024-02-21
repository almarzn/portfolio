// @font-face(https://fonts.google.com/download?family=Lexend)

#import ".template/layout.typ"
#import ".template/styles.typ"

#let content = yaml("data.json")

#styles.default[
  #layout.presentation(content)
  #grid(
    gutter: 12pt,
    columns: (3fr, 7fr),
    [
      #layout.skills(content)
    ],
    layout.experiences(content)
  )
]