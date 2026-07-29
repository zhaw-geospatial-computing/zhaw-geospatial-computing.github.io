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

## Components (`components/`)

- `Inhalt` — TOC component. Reads `sections:` from slide 1 frontmatter via `useNav()`. Prop: `:active` (1-based)

## Known gotchas

- `display: flex` on `<li>` elements causes text justification in Slidev — use `position: absolute` for custom bullets instead
- Markdown tables inside `<div>` blocks don't parse unless there are blank lines inside the div
- `title` is a reserved Slidev deck-level key and is NOT passed as a layout prop — use `heading` instead
- Slide 1 content must be non-empty (use `<!-- comment -->`) to preserve the slide boundary
- Hot reload sometimes doesn't trigger — manual browser refresh needed
- The `sections:` key in slide 1 frontmatter is a custom extension, not a built-in Slidev feature

## Assets

- `public/zhaw-logo.jpeg` — shared ZHAW logo
- `public/AGI_HS25_Netzwerk1/` — images extracted from original PowerPoint
