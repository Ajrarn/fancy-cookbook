#import "@preview/fancy-cookbook:2.1.0": *


#show: cookbook.with(
  title: "Palettes",
  subtitle: "A sample with all palettes - style gradient",
  book-author: "Ajrarn",
  style: style.gradient,
  only-recipes: true
)

#for pal in palette.keys() {
  recipe(
    [#pal],
    change-palette: palette.at(pal),
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