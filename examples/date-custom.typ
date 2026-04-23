#import "@preview/fancy-cookbook:2.1.0": *

#let date = datetime(
  year: 2020,
  month: 10,
  day: 4,
)

#show: cookbook.with(
  title: "My Cookbook",
  subtitle: "little subtitle",
  book-author: "Myself",
  date: date
)

#recipe(
  [Simple Recipe],
  description: [Not really a recipe],
  authors: [Myself],
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

