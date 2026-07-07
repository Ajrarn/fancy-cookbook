#import "@local/fancy-cookbook:3.0.0": *

#let fonts = (
  body: ("Inria Serif", "New Computer Modern"),
  header: ("Inria Sans", "Noto Sans"),
  // mono: ("Fira Mono", "DejaVu Sans Mono"),
  mono: "DejaVu Sans Mono",
)


#show: cookbook.with(
  paper: "a4",
  title: "My Cookbook",
  subtitle: "little subtitle",
  book-author: "Myself",
  lang: "es",
  fonts: fonts
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