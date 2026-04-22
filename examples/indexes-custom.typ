#import "@local/fancy-cookbook:2.1.0": *

#let dict-values(d) = d.keys().map(k => d.at(k))

#let dict-one = (
  good: "Good",
  awful: "Awful"
)

#let dict-two = (
  cold: "Cold",
  hot: "Hot"
)

#let indexes = (
  (
    title: [Dict One],
    tags: dict-values(dict-one)
  ),
  (
    title: [Dict Two],
    tags: dict-values(dict-two)
  )
)

#let OEuf = [Œuf]

#show: cookbook.with(
  title: "My Cookbook",
  subtitle: "little subtitle",
  book-author: "Myself",
  custom-indexes: indexes
)

#chapter(change-palette: palette.coral)[Here it is]

#recipe(
  [Recipe With Groups],
  description: [Not really a recipe],
  tags: (dict-one.good, dict-two.hot),
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

#recipe(
  [#OEuf],
  sort-title: "Oeuf",
  description: [Not really a recipe],
  tags: (dict-one.good, dict-two.cold),
  servings: 6,
  prep-time: [2 min],
  cook-time: [10 min],
  ingredients:[
    - *1 l* of water
    - *350 ml* of fruit juice
  ],
  instructions: [
    + put all together
    + shake well
    + reserve in fridge
  ]
)








