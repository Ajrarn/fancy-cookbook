#import "@local/fancy-cookbook:1.0.8": *


#show: cookbook.with(
  title: "Palettes",
  subtitle: "A sample with all palettes - style flat",
  book-author: "Ajrarn",
  style: style.gradient,
  only-recipes: true
)

#let generate-palettes() = {
  let local-palettes = ()
  let page = 1

  for pal in palette.values() {
    local-palettes.push(
      (palette: pal, page: page)
    )
    page +=1
  }
  local-palettes
}

#set-all-palettes(generate-palettes())

#for palette in palette.keys() {
  recipe(
    [#palette],
    description: [Not really a recipe],
    authors: [Myself],
    servings: 6,
    prep-time: [2 min],
    cook-time: [10 min],
    ingredients:(
      (
        title: [Liquid],
        items: [
          - *1 l* of water
          - *350 ml* of fruit juice
        ]
      ),
      (
        title: [Solid],
        items: [
          - *300 mg* of wheat flour
          - *12 g* of butter
          - *150 g* of sugar
        ]
      )
    ),
    instructions: (
      (
        title: [Liquid],
        steps: [
          + put all together
          + shake well
          + reserve in fridge
        ]
      ),
      (
        title: [Solid],
        steps: [
          + Put all together
          + Mix well
          + Put it all in the garbage
          + Call for a pizza
        ]
      )
    )
  )  
}