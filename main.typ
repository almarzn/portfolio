#import ".template/layout.typ"
#import ".template/styles.typ"

#let content = yaml("content.yml")

#styles.default[
  #layout.presentation(content)
  #layout.skills(content)
  #layout.experiences(content)
]