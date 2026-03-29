#import "../colors/palettes.typ": palette
#import "../colors/colors.typ": set-palette


#let chapter(palette: palette.grey, body) = context {  
  [
    = #body
  ]
  set-palette(palette)
}