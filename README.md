# Modul Geospatial Computing – Slides

Slidev-based slide decks for the BSc Umweltingenieurwesen course *Angewandte Geoinformatik* at ZHAW.

## Getting started

```bash
pnpm install
pnpm run dev AGI_HS25_Netzwerk1.md   # or Netzwerk2/3
```

Visit <http://localhost:3030>

## Slide decks

| File | Topic |
|------|-------|
| `AGI_HS25_Netzwerk1.md` | Netzwerkanalysen I – Graphentheorie, Zentralitätsmasse, QGIS |
| `AGI_HS25_Netzwerk2.md` | Netzwerkanalysen II |
| `AGI_HS25_Netzwerk3.md` | Netzwerkanalysen III |

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
