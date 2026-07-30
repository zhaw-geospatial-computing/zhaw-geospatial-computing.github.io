# LLM Context

## Project

Slidev presentation decks for the ZHAW course *Angewandte Geoinformatik* (BSc Umweltingenieurwesen). Decks are named `Paths-and-Flows-1.md`, `Paths-and-Flows-2.md`, etc. Drafts are prefixed with `_` and not published.

A Slidev dev server runs at `http://localhost:3030`. Use the `slidev` MCP server to read and edit slides without touching the markdown directly where possible.

## Conventions

- Slides are separated by `---`
- Slide 1 is always the title slide using `layout: zhaw-cover`
- Slide 1's frontmatter is the global config for the deck — it holds `title`, `sections:`, and ZHAW author info
- TOC slides use `<Inhalt :active="N" />` — N is 1-based index into `sections:`
- Draft decks use a `_` filename prefix and are excluded from the GitHub Pages deployment
- Do NOT add `Co-Authored-By` to git commits

## Custom layouts (`layouts/`)

- `zhaw-cover` — title slide. Props: `heading`, `subtitle`, `authors`, `email`, `logo` (default: `zhaw-logo.jpeg` via `import.meta.env.BASE_URL`)
- `lernziele` — learning objectives with green checkmark bullets. Uses `<slot />`
- `zusammenfassung` — summary slide with blue arrow bullets and bottom-border title
- `exercises` — exercise/task slide with orange accent colour
- `three-cols-header` — header spanning full width (default slot) + three columns (`::left::`, `::center::`, `::right::`)
- `two-cols-header` — header spanning full width (default slot) + two columns (`::left::`, `::right::`)

Images in column layouts fill remaining vertical space automatically via `p:has(img) { flex: 1 }`.

## Components (`components/`)

- `Inhalt` — TOC component. Reads `sections:` from slide 1 frontmatter. Prop: `:active` (1-based)
- `SlideFooter` — small footer for image sources, positioned at bottom of slide. Usage: `<SlideFooter>Quelle: ...</SlideFooter>`

## Global styles (`style.css`)

- Restores `opacity: 1` on `h1 + p:has(> img:only-child)` — the default theme dims `h1 + p` to 50% opacity, which affects images directly after headings

## Building & deployment

- Dev server: `pnpm exec slidev <file>.md`
- GitHub Actions deploys all non-draft, non-excluded `.md` files to GitHub Pages on push to `main`
- Each deck is built to its own subpath: `/Paths-and-Flows-1/`, `/Paths-and-Flows-2/`, etc.

## Known gotchas

- **New layout files need a server restart** — hot reload does not pick up new files in `layouts/`
- **Absolute asset paths break on subpath deployments** — do not use `/foo.jpeg` in layout `:src` bindings; use `import.meta.env.BASE_URL + 'foo.jpeg'` instead. Static `src` attributes in templates are fine.
- `display: flex` on `<li>` elements causes text justification — use `position: absolute` for custom bullets instead
- Markdown tables inside `<div>` blocks don't parse unless there are blank lines inside the div
- `title` is a reserved Slidev deck-level key and is NOT passed as a layout prop — use `heading` instead
- Slide 1 content must be non-empty (use `<!-- comment -->`) to preserve the slide boundary
- `sections:` in slide 1 frontmatter is a custom extension, not built-in Slidev
- Scoped CSS in layouts doesn't reach slotted content — use a global `<style>` block namespaced with `.slidev-layout.<name>`
- `layout: image` uses `background-size: cover` by default — add `backgroundSize: contain` to fit the whole image
- `p:has(img)` needs `flex: 1; min-height: 0` in column layouts for images to be height-constrained correctly

## Assets

- `public/zhaw-logo.jpeg` — shared ZHAW logo, used by `zhaw-cover` by default
- `public/favicon.png` — ZHAW logo used as browser favicon
- `public/<deckname>/` — images extracted from original PowerPoint, one subfolder per deck
