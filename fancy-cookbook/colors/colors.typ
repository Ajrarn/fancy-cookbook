#import "palettes.typ" : palettes

// color to fill the ingredients block
#let fill-ingredients(style, palette) = {
  if style == "gradient" {
    gradient.linear(palette.medium,palette.light, angle: 90deg)
  } else {
    palette.light
  }
}


// color for the group text of the ingredients block
#let ingredient-group-color(style, palette) = {
  if style == "gradient" {
    palette.dark.darken(30%)
  } else {
    palette.dark
  }
}

#let array = (
  (a: 2, b: 4),
  (a: 1, b: 5),
  (a: 2, b: 3),
)
#array.sorted(key: it => (it.a, it.b))


#let page-palette(page) = {
  let events = query(selector(metadata))
    .filter(it => it.value.kind == "page-palette")
    .sorted(key: it => it.value.page)

  // keep the event before page
  let before = events.filter(ev => {
    ev.value.page <= page
  })

  // if not found → fallback
  if before.len() == 0 {
    return palettes.grey
  }

  // We keep the last event
  let last = before.last()

  last.value.palette
}
