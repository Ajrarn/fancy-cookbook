#import "fancy-cookbook/main.typ": *

#set text(lang:"fr")
#let english = (
    en: (
      toc: "Recipes"
    )
)


#show: cookbook.with(
  title: "My Cookbook",
  subtitle: "Nos petites recettes préférées",
  style: style.gradient,
  chapter-start-right: true,
  theme: themes.blue,
  book-author: "Muriel & Christophe",
  custom-i18n: english
)

= Alcool

#recipe(
  [Lychee whiskey],
  description: [Perfumed Whisky],
  tags:("Whisky"),
  servings: 6,
  prep-time: [2 min],
  cook-time: [10 min],
  ingredients: [
    - *1 l* flask empty and clean
    - *350 ml* of whisky
    - *150 g* of sugar
    - *1* vanilla stick
    - Some lychees
  ],
  instructions: [
    + Put the whisky, the sugar and the vanilla stick in the flask.
    + Add lychees in it the flask until the flask is full.
    + Leave to macerate.
  ]
)

#recipe([Something Cool],
  description: [An imaginary recipe],
  servings: 6,
  prep-time: [2 min],
  cook-time: [10 min],
  ingredients: (
    (
      title: [Dough],
      items: [
        - Some flour
        - Eggs
      ]
    ),
    (
      title: [Trim],
      items: [
        - Mandragora roots
        - Chili powder
        - Sugar
      ]
    )
  ),
  instructions: (
    (
      title: [Dough],
      steps: [
        + Put all together and mix
        + Cast a hot spell to make it burns
      ]
    ),
    (
      title: [Garnish],
      steps: [
        + Mix all together
        + And put all of these in the garbage
      ]
    )
  )
)