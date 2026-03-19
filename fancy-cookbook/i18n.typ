// =============== i18n =====================
// --------- Given Translations -------------
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
      annexes: "Annexes",
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

// -------------- Gears of translation --------------------
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


#let update-translation(t) = context {
  let base = translations.get()
  let lang-key = t.keys().first()        // extrait "fr", "en", etc.
  let previous = base.at(lang-key, default: (:))  // récupère l'entrée existante si elle existe

  // Fusionne l'ancienne entrée avec la nouvelle (les nouvelles valeurs écrasent)
  let merged-lang = previous + t.at(lang-key)

  // Reconstruit le dictionnaire complet avec la langue mise à jour
  let merged = base
  merged.insert(lang-key, merged-lang)
  translations.update(merged)
}

// translate the labels with text.lang ("en" by default)
#let translate(key) = context {
  let lang = if text.lang != none {
      text.lang
    } else {
      "en"
    }
  let dict = translations.get().at(lang, default: translations.get().at("en"))
  dict.at(key, default: key)
}