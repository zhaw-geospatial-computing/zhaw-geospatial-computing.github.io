# Modul Geospatial Computing – Slides

Slidev-based slide decks for the BSc Umweltingenieurwesen course *Angewandte Geoinformatik* at ZHAW.

## Getting started

```bash
pnpm install

# dev server (one deck at a time)
npx slidev AGI_HS25_Netzwerk1.md

# build all decks at once
npx slidev build *.md
```

Visit <http://localhost:3030>

## Slide decks

| File | Topic |
|------|-------|
| `AGI_HS25_Netzwerk1.md` | Netzwerkanalysen I – Graphentheorie, Zentralitätsmasse, QGIS |
| `AGI_HS25_Netzwerk2.md` | Netzwerkanalysen II |
| `AGI_HS25_Netzwerk3.md` | Netzwerkanalysen III |
| `layouts-demo.md` | Reference deck for all built-in Slidev layouts |

## Custom layouts

Located in `layouts/`:

| Layout | Usage | Key props |
|--------|-------|-----------|
| `zhaw-cover` | Title slide | `heading`, `subtitle`, `authors`, `email`, `logo` |
| `lernziele` | Learning objectives | *(none — uses slot)* |

## Components

Located in `components/`:

| Component | Usage |
|-----------|-------|
| `Inhalt` | TOC slide — reads `sections:` list from slide 1 frontmatter, highlights `:active` item |

### Inhalt usage

Define sections once in slide 1's global frontmatter:

```yaml
sections:
  - Einleitender Rundgang
  - Graphentheorie
  - Zentralitätsmasse
  - QGIS
```

Then on each TOC slide:

```
<Inhalt :active="2" />
```

## Assets

- `public/zhaw-logo.jpeg` — shared ZHAW logo, used by `zhaw-cover` by default
- `public/<deck>/` — images extracted from original PowerPoint per deck
