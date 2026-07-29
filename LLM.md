# LLM Context

## Project

Slidev presentation decks for the ZHAW course *Angewandte Geoinformatik* (BSc Umweltingenieurwesen). The active deck being worked on is `AGI_HS25_Netzwerk1.md`. There are also `Netzwerk2.md` and `Netzwerk3.md`.

A Slidev dev server runs at `http://localhost:3030`. Use the `slidev` MCP server to read and edit slides without touching the markdown directly where possible.

## Conventions

- Slides are separated by `---`
- Slide 1 is always the title slide using `layout: zhaw-cover`
- Slide 1's frontmatter is the global config for the deck — it holds `title`, `sections:`, and ZHAW author info
- TOC slides use `<Inhalt :active="N" />` — N is 1-based index into `sections:`
- Learning objective slides use `layout: lernziele`
- Do NOT add `Co-Authored-By` to git commits

## Custom layouts (`layouts/`)

- `zhaw-cover` — title slide. Props: `heading`, `subtitle`, `authors`, `email`, `logo` (default: `/zhaw-logo.jpeg`)
- `lernziele` — learning objectives with green checkmark bullets, ragged-left text. Uses `<slot />`
- `three-cols-header` — header spanning full width (default slot) + three equal columns (`::left::`, `::center::`, `::right::`). Images in columns fill remaining vertical space automatically.

## Components (`components/`)

- `Inhalt` — TOC component. Reads `sections:` from slide 1 frontmatter via `useNav()`. Prop: `:active` (1-based)

## Building

- Dev server (one deck at a time): `pnpm exec slidev <file>.md`
- Build all decks at once: `pnpm exec slidev build *.md`

## Known gotchas

- `display: flex` on `<li>` elements causes text justification in Slidev — use `position: absolute` for custom bullets instead
- Markdown tables inside `<div>` blocks don't parse unless there are blank lines inside the div
- `title` is a reserved Slidev deck-level key and is NOT passed as a layout prop — use `heading` instead
- Slide 1 content must be non-empty (use `<!-- comment -->`) to preserve the slide boundary
- Hot reload sometimes doesn't trigger — manual browser refresh needed
- The `sections:` key in slide 1 frontmatter is a custom extension, not a built-in Slidev feature
- Markdown `![]()` images are wrapped in `<p>` tags — custom layouts targeting images need to also set `height: 100%` on `p` for vertical constraints to work
- Scoped CSS in layouts doesn't reach slotted content — use a global `<style>` block namespaced with `.slidev-layout.<name>`
- `layout: image` uses `background-size: cover` by default (crops) — add `backgroundSize: contain` in frontmatter to fit the whole image
- Side-by-side images: markdown table (`| ![](a) | ![](b) |`) is simpler than `<div class="flex">`

## Assets

- `public/zhaw-logo.jpeg` — shared ZHAW logo
- `public/AGI_HS25_Netzwerk1/` — images extracted from original PowerPoint
