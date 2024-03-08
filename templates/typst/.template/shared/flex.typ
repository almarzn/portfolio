#let column(gap, children) = grid(
  columns: 1,
  gutter: gap,
  ..children
)

#let row(gap, children) = {
  let (first, ..other) = children

  set par(leading: gap)

  first

  for child in other {
    h(gap)

    child
  }
}


#let flex(gap: 0pt, direction: column, content) = {
  
  let non-empty-children = content.children.filter(child => child.fields().len() != 0)

  direction(
    gap,
    non-empty-children
  )
}