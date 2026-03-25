#import "@preview/ez-today:2.1.0"
#import "colors/colors.typ": *
#import "i18n/i18n.typ": *
#import "i18n/translations.typ": *
#import "chapter.typ": *
#import "states.typ": *
#import "fonts.typ": *


#let cookbook(
  title: "Recipe Collection",
  book-author: "Unknown",
  subtitle: "Ours Recipe",
  date: datetime.today(),
  paper: "a4",
  cover-image: none,
  custom-i18n: none,
  style: style.flat,
  chapter-start-right: false,
  palette: palettes.grey,
  back-cover-content: none,
  back-cover-image: none,
  indexes: none,
  custom-appendices: none,
  multicolor: false,
  body
) = {
  //Memorize chapter-start-right-chapter
  chapter-start-right-state.update(chapter-start-right)
  
  // Add custom translation if exists
  if custom-i18n != none {
    update-translation(custom-i18n)
  }

  // set the style between "flat" or "gradient"
  set-style(style)

  // -------------- General Settings of the document --------------------  
  set document(title: title, author: book-author)
  
  set text(
    font: fonts.body,
    size: 11pt,
    features: (onum: 1)
  )
    
  set page(
    paper: paper,
    margin: (x: 2cm, top: 2.5cm, bottom: 2.5cm),
    header: context {

      let palette = page-palette(here().page())

      set par(spacing: 1.2em) // to protect from changes for the content
      let p = counter(page).get().first()
      if p > 1 {
        set text(font: fonts.header, size: 9pt, fill: palette.dark)
        
        // get the previous chapter for the header
        let headings = query(selector(heading.where(level: 1)).before(here()))
        let chapter = if headings.len() > 0 {
          headings.last().body
        } else {
          []
        }
        
        grid(
          columns: (1fr, 1fr),
          align(left, title),
          align(right, chapter)
        )
        v(-0.8em)
        line(length: 100%, stroke: 0.5pt + palette.medium)
      }
    },
    footer: context {
      let palette = page-palette(here().page())
      set text(font: fonts.header, size: 9pt, fill: palette.dark)
      let p = counter(page).get().first()
      line(length: 100%, stroke: 0.5pt + palette.medium)
      align(center)[— #p —]
    }
  )
    
    
  // Headings
  show heading.where(level: 1): it => {

    // If the book is not multicolor we can apply these rules, if we must use the chapter function
    if multicolor == false {
      // If we want the chapter header to always be at right
      if chapter-start-right {
        pagebreak(to: "odd", weak: true)
      } else {
        pagebreak(weak: true)
      }
    }
     
    counter(heading).step(level: 1)
    context {
      // let palette = palette-state.get()
      let palette = page-palette(here().page())
    
      set align(center + horizon)
      block(width: 100%)[
        #text(font: fonts.header, weight: "black", size: 3.5em, fill: palette.dark, it.body)
      ]
    }
  }
    
  show heading.where(level: 2): it => {
    pagebreak(weak: true)
    block(below: 1.5em,  // ← ajustez "below" selon votre goût
      text(font: fonts.header, weight: "bold", size: 2.2em, it.body)
    )
  }

  // reference on recipe
  show ref: it => {
    let el = it.element
    if el != none and el.func() == heading and el.level == 2 {
      context {
        let p = counter(page).at(el.location()).first()
        [#el.body (p. #p)] 
      }
    } else {
      it
    }
  }
  
  // -------------- Cover Page --------------------
  if title != none {

    context metadata((kind: "page-palette", palette: palette, page: here().position().page))
    
    page(margin: 0pt, header: none)[
      // Optional Background Image
      #if cover-image != none {
        place(top, cover-image)
      }
      
      #place(center + horizon)[
        #block(
           width: 75%, 
           stroke: (
             top: 4pt + palette.dark, 
             bottom: if cover-image == none { 4pt + palette.dark } else { none }
           ), 
           inset: (y: 3em),
           fill: if cover-image != none { palette.light } else { none },
           outset: if cover-image != none { 1cm } else { 0cm }
        )[
          #par(leading: 0.35em)[
            #text(font: fonts.header, weight: "black", size: 4.5em, title)
          ]
          #v(1.5em)
          #text(font: fonts.body, style: "italic", size: 1.5em, fill: palette.dark, subtitle)
        ]
      ]
      #context {
        place(bottom + center)[
           #pad(bottom: 3cm, text(font: fonts.header, size: 0.8em, tracking: 3pt, fill: palette.dark, upper(ez-today.today(lang: text.lang, format: "M Y") )))
        ]
      }
    ]
  }
  
  // -------------- TOC --------------------
  page(header: none)[
    #v(3cm)
    #align(center)[
       #text(font: fonts.header, weight: "bold", size: 1.2em, tracking: 2pt, upper(translate(i18n.toc)))
       #v(1em)
       #line(length: 3cm, stroke: 0.5pt + palette.dark)
    ]
    #v(1.5cm)
    
    #show outline.entry: it => {
      context {
        if it.level == 1 {
            align(center)[
              #box(width:70%)[
              // Section / Chapter Header
              #v(1.5em)
              #text(font: fonts.header, weight: "black", fill: palette.dark, size: 1.3em, upper(it.element.body))
              #h(1fr)
              // No page number for chapters, looks cleaner
              ]
            ]
          } else {
            align(center)[
              // Recipe Entry
              #v(0.5em)
              #box(width: 65%)[
                #link(it.element.location())[
                  #text(font: fonts.body, size: 1.1em, it.element.body)
                  #box(width: 1fr, repeat[ #h(0.3em) #text(fill: palette.dark, size: 0.6em)[.] #h(0.3em) ])
                  #text(font: fonts.header, weight: "bold", fill: palette.dark, [#it.element.location().page()])
                ]
              ]
            ]
          }
      }
    }
    #outline(title: none, indent: 0pt, depth: 2)
  ]
  // ----------------- Body --------------
  
  body

  // ---------------- Annexes ------------------
  context {
    let recipes = query(selector(metadata))
                    .filter(x => x.value.kind == "recipe")
  
  
    let all-tags = recipes.map(r => r.value.tags)
                          .flatten()
                          .dedup()
                          .sorted()
                          
    // We show annexes only if there is tags or custom annexes
    if all-tags.len() > 0 or custom-appendices!= none {

      metadata((kind: "page-palette", palette: palette, page: here().position().page))
      
      if multicolor {
        chapter(palette:palette, translate(i18n.annexes))
      } else {
        heading(level: 1, translate(i18n.annexes))
      }

      if all-tags.len() > 0 {

        // ------- indexes pages ----------------

        set par(spacing: 0.5em)
        
        if indexes != none and indexes.len() > 0 {
          // custom index pages
          for index in indexes {
            heading(level: 2, index.title)

            for tag in index.tags {
              align(center)[
                #box(width:70%)[
                  // Tag
                  #v(0.5em)
                  #text(font: fonts.header, weight: "black", fill: palette.dark, size: 0.8em, upper(tag))
                  #h(1fr)
                ]
              ]
          
              let filtered = recipes.filter(r => tag in r.value.tags)
          
              for r in filtered {
                align(center)[
                  // Recipe Entry
                  #v(0.05em)
                  #box(width: 65%)[
                        #link(r.value.location)[
                          #text(font: fonts.body, size: 0.8em, r.value.title)
                          #box(width: 1fr, repeat[ #h(0.3em) #text(fill: palette.dark, size: 0.6em)[.] #h(0.3em) ])
                          #text(font: fonts.header, size: 0.8em, weight: "bold", fill: palette.dark, [#r.value.location.position().page])
                        ]
                      ]
                  ]
              }
            }
          }
        } else {
          // default index pages
          heading(level: 2, translate(i18n.index))
      
          for tag in all-tags {
    
            align(center)[
              #box(width:70%)[
                // Tag
                #v(0.5em)
                #text(font: fonts.header, weight: "black", fill: palette.dark, size: 0.8em, upper(tag))
                #h(1fr)
              ]
            ]
        
            let filtered = recipes.filter(r => tag in r.value.tags)
        
            for r in filtered {
              align(center)[
                // Recipe Entry
                #v(0.05em)
                #box(width: 65%)[
                  #link(r.value.location)[
                    #text(font: fonts.body, size: 0.8em, r.value.title)
                    #box(width: 1fr, repeat[ #h(0.3em) #text(fill: palette.dark, size: 0.6em)[.] #h(0.3em) ])
                    #text(font: fonts.header, size: 0.8em, weight: "bold", fill: palette.dark, [#r.value.location.position().page])
                  ]
                ]
              ]
            }
          }
        }
      }
      // if custom annexes
      custom-appendices
    }                        
  }
  

  // --------------- Back Cover -------------
  if back-cover-content != none or back-cover-image != none {
    pagebreak(to:"even", weak:true)
    page(margin: 5cm, header: none, footer: none)[

      #set par(spacing: 3em)
      
      #place(center + horizon)[

        // Title
        #text(font: fonts.header, weight: "bold", fill: palette.dark, size: 2em, title)

        // Back cover image
        #if back-cover-image != none {
          back-cover-image
        }
        // separation line
        #if back-cover-content != none and back-cover-image != none {
           line(length: 5cm, stroke: 0.5pt + palette.dark)
        }
        // back cover content
        #if back-cover-content != none {  
          text(font: fonts.header, size: 1em, tracking: 2pt, back-cover-content)
        }
        // author
        #par(
            text(font: fonts.header, style: "italic", fill: palette.dark, size: 1.2em, book-author)
          )
      ]
    ]
  }
}




// =============== Not a Recipe =====================

// a simple part for what is not a recipe
#let not-a-recipe(name: none, body) = {

  set par(first-line-indent: (amount: 2em, all: true))
  set list(indent: 2em, body-indent: 0.5em)
  
  if name != none {
    heading(level: 2, name)
  }
  v(4em)
  body
}