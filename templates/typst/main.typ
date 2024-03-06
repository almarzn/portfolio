// @font-face(https://fonts.google.com/download?family=Lexend)

#import ".template/title.typ": title
#import ".template/styles.typ"

#let content = yaml("data.yaml")

#styles.default[
  #title()
]