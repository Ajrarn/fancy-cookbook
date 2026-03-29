#import "palettes.typ" : palette, style

// To know which palette is applied anywhere we use the metadata
// Every chapter (the function) will add a metadata to associate a palette with a page
// Every call to next-palette (function too) will do the same but with calculation for the next page
// So every components who needs to know which palette it has to use will compare his own page to the metadata, which is a list of (page, palette)


// use a constant to avoid typing errors
#let page-palette-meta-name = "page-palette"

// ------------------ States and counters --------------------------------------

// this state will get the style of the ingredients block "flat" or "gradient"
#let style-state = state("style", style.flat)

// this function just save the style in the state
#let set-style(style) = {
  style-state.update(style)
}

// this state will get the value chapter-start-right
#let chapter-on-right-state = state("chapter-on-right", false)


// This counter will help us to know if the set-palette is just after the TOC pages
#let set-palette-counter = counter("set-palette-counter")

// ------------------ Init color system --------------------------------------
#let init-color-system(style, chapter-on-right) = {
  // init the state
  chapter-on-right-state.update(chapter-on-right)
  
  // set the style between "flat" or "gradient"
  set-style(style)
}

// --------------------- Colors for ingredients functions ----------------------

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

// ------------------- Palette functions -------------------------------------

// the current palette for the page
#let page-palette(page) = {
  let events = query(selector(metadata))
    .filter(it => it.value.kind == page-palette-meta-name)
    .sorted(key: it => it.value.page)

  // keep the event before page
  let before = events.filter(ev => {
    ev.value.page <= page
  })

  // if not found → fallback
  if before.len() == 0 {
    return palette.grey
  }

  // We keep the last event
  let last = before.last()

  last.value.palette
}

// this function is used in chapter or in the cover page to set the palette. it's not for the users
#let set-palette(palette) = context {
  metadata((
    kind: page-palette-meta-name,
    palette: palette,
    page: here().position().page,
  ))
  
  set-palette-counter.step()
}


// This function is for the users, if they want to use the markup syntax for chapters
// it will set the palette in the page where the next header (chapter or recipe) will appear 
#let next-palette(palette, offset: none) = context {
  
  // in most of the case the chapter title will appear in the next page.
  let local-offset = 1
  // Now we want the current page
  let current = here().position().page
  
  if offset != none {
    local-offset = offset // if the offset is given no interpretation
  } else {
      
    let chapter-on-right = chapter-on-right-state.get()
  
    let odd = calc.odd(current)
  
    if set-palette-counter.display() == "1" { 
      // juste after the TOC we consider that next-palette is called in the same page
      local-offset = 0 
    
      if chapter-on-right and odd == false {
        local-offset += 1 // but in this case, there is one more page 
      }
      
    } else {
      if chapter-on-right and odd { // if chapter on right there is one more page
        local-offset += 1 // which is 2
      }
    }
  }
  
  // here we add the palette in the metadata
  metadata((kind: page-palette-meta-name, palette: palette, page: current + local-offset))
  set-palette-counter.step()
}

#let set-all-palettes(settings) = {
  if type(settings) == array and settings.len() > 0 {

    for setting in settings {
      metadata((kind: page-palette-meta-name, palette: setting.palette, page: setting.page))
    }
  } 
}


