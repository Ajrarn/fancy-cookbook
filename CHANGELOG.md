# Changelog

All notable changes to this project will be documented in this file.

## [3.0.0]

### New Features

- Added an `equipment` block to `recipe` for listing tools and utensils used in a recipe.
- Improved support for right-to-left writing systems and more robust column layout handling for LTR/RTL content.
- Added custom font support via the `fonts` option on the `cookbook` function.
- Added or improved language support for Arabic, Japanese, Korean, Dutch, Russian, and Chinese, alongside the existing translations.
- Added validation helpers and test coverage for cookbook and recipe content.

### Enhancements

- Better handling of page layout, paper sizing, and margins for varied document formats.
- Improved chapter, cover, TOC, and appendix behavior with more predictable page breaks.
- More consistent recipe metadata, labels, and translation keys across the package.
- Added numbering translation keys for page references and step numbering (`page-numbering`, `page-ref-numbering`, `step-numbering`).
- Better support for custom i18n overrides and bibliography/quote/front-matter usage.

---

## [2.1.0]

### New Features

Better control of paper size adjustment by adding:
- `font-size`: reference for all text
- `margin`: better fit for different paper sizes

---

## [2.0.0]

### Bug Fixes

- Fixed inconsistent color rendering across pages: colors are now applied coherently page by page throughout the entire document.

### Breaking Changes

#### Renamed: `theme` → `palette`

The `theme` concept has been renamed to `palette` everywhere for clarity.

- The `theme` parameter of the `cookbook` function is now `palette`.
- The `themes.*` namespace is now `palette.*`.
- The `set-theme` function has been replaced — see below.

Before:
```typ
#show: cookbook.with(
  title: "My Cookbook",
  theme: themes.blue
)
```

After:
```typ
#show: cookbook.with(
  title: "My Cookbook",
  palette: palette.blue
)
```

---

#### Renamed: `indexes` → `custom-indexes`

The `indexes` parameter of the `cookbook` function has been renamed to `custom-indexes` for consistency with the other `custom-*` parameters.

Before:
```typ
#show: cookbook.with(
  title: "My Cookbook",
  indexes: indexes
)
```

After:
```typ
#show: cookbook.with(
  title: "My Cookbook",
  custom-indexes: indexes
)
```

---

#### Renamed: `author` → `authors` in `recipe`

The `author` property of the `recipe` function has been renamed to `authors` and now supports multiple authors.

Before:
```typ
#recipe(
  [Banana Jam],
  author: [GrandMa]
)
```

After (single author):
```typ
#recipe(
  [Banana Jam],
  authors: [GrandMa]
)
```

After (multiple authors):
```typ
#recipe(
  [Banana Jam],
  authors: ([GrandMa], [GrandPa])
)
```

---

#### Replaced: `set-theme` → `chapter`, `set-all-palettes`

The `set-theme` function has been replaced by more specialized APIs that give finer control over color changes:

- **`chapter`**: creates a chapter separator page and sets the palette for that chapter.
- **`set-all-palettes`**: lets you manually define all palette change points at once.

Before:
```typ
#set-theme(themes.green)
```

After:
```typ
#chapter(palette: palette.green)[Main]
// or
#set-all-palettes(pages-palettes)
```

---

### New Features

#### New palettes

Seven new palettes have been added:

- `amber`
- `coral`
- `forest`
- `lagoon`
- `rose`
- `slate` (new default, replaces `grey`)
- `sunset`

The default palette is now **`slate`** (previously `grey`).

---

#### `recipe`: new `change-palette` property

You can now change the palette directly from within a recipe using the `change-palette` property.

---

#### `cookbook`: new `chapter-on-odd` behavior

The `chapter` function now integrates with `chapter-on-odd` to ensure chapter separator pages land on the correct side.

#### back-matter and front-matter

Use these to add pages before and after the main content, which is useful for publication layouts.

#### citation-block

A new function to add quote blocks in chapters and elsewhere.

## [1.0.0]

- Initial release.