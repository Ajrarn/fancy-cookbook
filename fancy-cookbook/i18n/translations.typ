// like an enum to use when needed
#let i18n = (
  toc: "toc",
  ingredients: "ingredients",
  preparation: "preparation",
  notes: "notes",
  author: "author",
  annexes: "annexes",
  index: "index"
)

#let translations = state(
  "translations",
  (
    fr: (
      toc: "Table des Matières",
      ingredients: "INGRÉDIENTS",
      preparation: "PRÉPARATION",
      notes: "NOTES DU CHEF",
      author: "AUTEUR",
      annexes: "Annexes",
      index: "Index Thématique"
    ),
    en: (
      toc: "Table of Contents",
      ingredients: "INGREDIENTS",
      preparation: "PREPARATION",
      notes: "CHEF'S NOTES",
      author: "AUTHOR",
      annexes: "Appendices",
      index: "Thematic Index"
    ),
    es: (
      toc: "Tabla de Contenido",
      ingredients: "INGREDIENTES",
      preparation: "PREPARACIÓN",
      notes: "NOTAS DEL CHEF",
      author: "AUTOR",
      annexes: "Anexidades",
      index: "Índice temático"
    ),
    por: (
      toc: "Índice",
      ingredients: "INGREDIENTES",
      preparation: "PREPARAÇÃO",
      notes: "NOTAS DO CHEF",
      author: "AUTOR",
      annexes: "Anexos",
      index: "Índice Temático"
    )
  )
)


