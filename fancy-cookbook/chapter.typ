#import "colors/palettes.typ": palettes
#import "states.typ": *

// =============== Chapters =====================
#let chapter(palette: palettes.grey, body) = context {
  // If we want the chapter header to always be at right
  if chapter-start-right-state.get()  {
    pagebreak(to: "odd", weak: true)
  } else {
    pagebreak(weak: true)
  }

  metadata((kind: "page-palette", palette: palette, page: here().position().page))
  
  [
    = #body
  ]
}