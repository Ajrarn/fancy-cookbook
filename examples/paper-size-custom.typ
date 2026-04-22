#import "@local/fancy-cookbook:2.1.0": *

// Royal paper
#let royal = (
  width: 156mm,
  height: 234mm
)

// greater margin in the inside of the book
#let margin = (
  inside: 22mm,
  outside: 16mm,
  top: 22mm,
  bottom: 20mm
)

#show: cookbook.with(
  paper-width: royal.width,
  paper-height: royal.height,
  margin: margin,
  font-size: 8pt,
  title: "My Cookbook",
  subtitle: "little subtitle",
  book-author: "Myself",
  lang: "es",
  palette: palette.lagoon
)


#chapter[Here it is]

#recipe(
  [Simple Recipe],
  description: [Not really a recipe],
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

#recipe(
  [Recipe With Groups],
  description: [Not really a recipe],
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