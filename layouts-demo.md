---
title: Slidev Layouts – Built-in und Custom
theme: default
transition: none
---

# Slidev Layouts

A reference for all built-in and custom layouts

---
layout: center
---

# `center`

Content is centered on the screen.

---
layout: cover
---

# `cover`

Used for the presentation cover page — title, subtitle, author, etc.

---
layout: default
---

# `default`

The most basic layout for any kind of content.

- Bullet one
- Bullet two

---
layout: end
---

# The End

`end` — the final page of the presentation.

---
layout: fact
---

# 42

`fact` — highlight a number or fact with prominence

---
layout: full
---

# `full`

Uses all available screen space — no padding or margins applied.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.

---
layout: image-left
image: /zhaw-logo.jpeg
---

# `image-left`

Image on the left, content on the right.

Frontmatter props:
- `image` — image source path
- `backgroundSize` — CSS background-size (default: `cover`)
- `class` — extra classes on the content pane

---
layout: image-right
image: /zhaw-logo.jpeg
---

# `image-right`

Image on the right, content on the left.

Same props as `image-left`.

---
layout: image
image: /zhaw-logo.jpeg
backgroundSize: contain
---

# `image`

Image fills the full slide. Props: `image`, `backgroundSize`.

---
layout: iframe-left
url: https://sli.dev
---

# `iframe-left`

Embeds a webpage on the left.

Frontmatter props:
- `url` — the page to embed
- `class` — extra classes on the content pane

---
layout: iframe-right
url: https://sli.dev
---

# `iframe-right`

Embeds a webpage on the right.

Same props as `iframe-left`.

---
layout: iframe
url: https://sli.dev
---

---
layout: intro
---

# `intro`

For introducing the presentation — title, short description, author.

*Nils Ratnaweera · ZHAW*

---
layout: none
---

# `none`

No built-in styling at all — a blank canvas.

---
layout: quote
---

"To display a quotation with prominence."

— Slidev Docs

---
layout: section
---

# `section`

Marks the beginning of a new section.

---
layout: statement
---

# `statement` makes a bold single statement.

---
layout: two-cols
---

# `two-cols`

Left column — default slot.

::right::

Right column — `::right::` slot.

---
layout: two-cols-header
---

# `two-cols-header`

Header row spans both columns — default slot.

::left::

Left column — `::left::` slot.

::right::

Right column — `::right::` slot.

---
layout: three-cols-header
---

# `three-cols-header` *(custom)*

Header row spans all three columns — default slot.

::left::

Left — `::left::` slot.

::center::

Center — `::center::` slot.

::right::

Right — `::right::` slot.

---
layout: two-cols-header
---

# `two-cols-header` *(custom)*

Header row spans both columns — default slot.

::left::

Left — `::left::` slot.

::right::

Right — `::right::` slot.

---
layout: zhaw-cover
heading: Titel der Vorlesung
subtitle: BSc Umweltingenieurwesen · Angewandte Geoinformatik
authors: Nils Ratnaweera
email: rata@zhaw.ch
---

---
layout: lernziele
---

# Lernziele *(custom)*

- Sie können das Layout `lernziele` verwenden.
- Sie verstehen den Unterschied zwischen Lernzielen und Zusammenfassungen.

---
layout: zusammenfassung
---

# Zusammenfassung *(custom)*

- Das Layout `zusammenfassung` verwendet blaue Pfeile als Aufzählungszeichen.
- Es eignet sich für abschliessende Rückblicke am Ende eines Abschnitts.

---
layout: exercises
---

# Aufgabe *(custom)*

## Aufgabe (5 Min)

Beschreibe in eigenen Worten den Unterschied zwischen den vier Zentralitätsmassen.
