#import "colors/palettes.typ": style 

// this state will get the value chapter-start-right
#let chapter-start-right-state = state("chapter-start-right", false)

// this state will get the style of the ingredients block "flat" or "gradient"
#let style-state = state("style", style.flat)

#let set-style(style) = {
  style-state.update(style)
}
