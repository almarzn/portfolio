#let education(content) = grid(
      columns: (auto, 1fr),
      gutter: 16pt,
      ..content.map(item => (align(right, block(inset: (top: 3pt), item.dates)), [
        ===== #item.name

        #item.location
      ])).flatten()
    )
