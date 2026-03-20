#import "@local/fancy-cookbook:0.1.26": *

// #set text(lang:"fr")

#let french = (
  fr: (toc: "Recettes")
)

#show: cookbook.with(
  title: "C'est ça qu'est ban !",
  subtitle: "Nos petites recettes préférées",
  style: style.gradient,
  chapter-start-right: true,
  theme: themes.blue,
  book-author: "Muriel & Christophe",
  custom-i18n: french
)

= Alcool
#recipe(
  [Whisky aux letchis],
  description: [Whisky parfumé],
  tags:("Whisky"),
  servings: 6,
  prep-time: [2 min],
  cook-time: [10 min],
  ingredients: [
    - *1* flacon d'*1 l*
    - *350 ml* de whisky
    - *150 g* de sucre
    - *1* bâton de vanille
    - des letchis
  ],
  instructions: [
    + Mettre tous les ingrédients dans le flacon.
    + Ajouter les letchis pour le faire arriver à sa capacité.
    + Laisser macérer.
  ]
)