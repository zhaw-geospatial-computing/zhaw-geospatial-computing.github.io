# Geospatial Computing – Slides

Slidev-based slide decks for the BSc course *Angewandte Geoinformatik* (Environmental Engineering) at ZHAW.

## Course Context

### Target Audience

BSc Environmental Engineering students in semester 4. Students bring the following prior knowledge:

**Daten und Informationen 2** (prerequisite module)
- Introduction to spatial data with R (`sf`, basic visualisation)
- Tools: R, RStudio, QGIS

**Geoinformatik und GIS** (semester 3, autumn semester)

| Week | Topic | Software |
|------|-------|----------|
| 38 | Module introduction & Data acquisition I: coordinate transformation, georeferencing | QGIS |
| 39 | Data acquisition II: GNSS, mobile GIS, QField | QGIS |
| 40 | Data acquisition III: data accuracy, WMS & WFS, swissTLM3D | QGIS |
| 41 | Data analysis I: spatial and thematic queries (SQL) | QGIS |
| 42 | Data analysis II: vector geoprocessing, overlay, buffer, neighbourhood | QGIS |
| 43 | Data analysis III: raster geoprocessing, local/focal/zonal functions | QGIS |
| 44 | Data management I: GDB, feature classes, domains, subtypes | ArcGIS Pro |
| 45 | Data management II: joins, topology rules | ArcGIS Pro |
| 46 | Automation: ModelBuilder, Monte Carlo simulation | ArcGIS Pro |
| 47 | Web mapping: web maps & story maps with ArcGIS Online | ArcGIS Pro |
| 48–51 | Multi-criteria analysis, case studies | ArcGIS Pro |

### Tools Used in This Module

- **R + RStudio** – students already know both from D&I 2
- **QGIS** – for visual exploration and quality control

---

## Prerequisites for Slide Development

See also: https://sli.dev/guide/

- [Node.js](https://nodejs.org/) (LTS version recommended, e.g. via [nvm](https://github.com/nvm-sh/nvm))
- [pnpm](https://pnpm.io/) as package manager: `npm install -g pnpm`
- [Visual Studio Code](https://code.visualstudio.com/) with the [Slidev](https://marketplace.visualstudio.com/items?itemName=antfu.slidev) extension – enables slide preview and navigation directly in the editor
- An LLM with tool use and MCP support, e.g. [Claude Code](https://claude.ai/code) – can edit slides directly, adjust layouts, and interact with the running dev server via the Slidev MCP server; see also: https://sli.dev/guide/work-with-ai


Installation slidev via

```bash
pnpm install
```

## Starting the Dev Server for local preview


```bash
# for example:
npx slidev your-filename.md 

# You can only render one deck at a time. 
```

Then open the presentation in your browser at <http://localhost:3030>.

You can build static versions of all decks using the following command:

```bash
npx slidev build *.md
```

## Presenter Mode & Speaker Notes

Open the slide controls (bottom-right toolbar) and select **Presenter** to open the presenter view. This shows the current slide, a preview of the next slide, and any speaker notes.

Both the presenter view and the viewer window stay in sync via the browser's [BroadcastChannel API](https://developer.mozilla.org/en-US/docs/Web/API/BroadcastChannel) — no server needed. Mouse cursor position is also broadcast. This works on the deployed GitHub Pages version as well as the local dev server, as long as both windows are on the same origin.

### Adding Speaker Notes

Write speaker notes as an HTML comment **at the end of the slide**, after all visible content:

```markdown
# My Slide

Visible content here.

<!-- Speaker note: only visible in presenter mode. -->

---
```

Notes placed before visible content will not appear in the presenter view.

## Slide Decks

- `Introduction.md` - Module introduction
- `Paths-and-Flows-1.md` – Network analysis I: graph theory, centrality measures, QGIS
- `_Paths-and-Flows-2.md` – Network analysis II *(draft, not published)*
- `_Paths-and-Flows-3.md` – Network analysis III *(draft, not published)*
- `layouts-demo.md` – Reference deck showing all custom and built-in layouts

## Custom Layouts

All layouts live in `layouts/` and are applied via the `layout:` frontmatter key.

- `zhaw-cover` – Title slide. Frontmatter fields: `heading`, `subtitle`, `authors`, `email`, `logo`
- `lernziele` – Learning objectives with green checkmark bullets
- `zusammenfassung` – Summary slide with blue arrow bullets
- `exercises` – Exercise/task slide with orange accent colour
- `three-cols-header` – Three columns with a shared header (`::left::`, `::center::`, `::right::`)
- `two-cols-header` – Two columns with a shared header (`::left::`, `::right::`)

## Custom Components

All components live in `components/` and are automatically available in all decks.

### `Inhalt`

Table of contents slide. Reads the `sections:` list from the global frontmatter (slide 1) and highlights the active section.

Define once in the global frontmatter:

```yaml
sections:
  - Section 1
  - Section 2
  - Section 3
```

Include on each TOC slide:

```
<Inhalt :active="2" />
```

### `SlideFooter`

Source credit at the bottom of a slide, e.g. for image attributions.

```
<SlideFooter>Source: stadt-zuerich.ch · uber.com</SlideFooter>
```

## Assets

- `public/zhaw-logo.jpeg` – ZHAW logo, used by `zhaw-cover` by default
- `public/<deck>/` – specific images for each slidedeck (one subfolder per deck)
