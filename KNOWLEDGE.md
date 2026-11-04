# Project Knowledge

## Paths-and-Flows-1: Teaching Notes (last taught 2026-10-21)

- **Applications intro**: Needs more variety — input was too repetitive. Check what Patrick covered in his version to avoid overlap and get fresh examples.
- **Timing**: Theory part (lesson 1) was exactly 35 minutes — good length, keep it.
- **New Zealand example**: Replace with something more relatable / closer to home.
- **Group exercises**: Degree and closeness centrality should be done without Excel (mental/paper calculation). Remove the unnecessary pre-filled tables from the spreadsheet — they reduce cognitive engagement.
- **Betweenness exercise**: Excel is appropriate here due to complexity; keep it.
- **R exercises — project setup**: Even creating a new RStudio project with an explicit working directory and an R script file is a challenge for students. Walk through this explicitly at the start.
- **Preparatory tasks for next time**:
  - Reading the Wang et al. (2011) paper
  - Installing required packages (`sfnetworks`, `igraph`) **before** the lesson — add this to the assignment/prep sheet.

## Paths-and-Flows-2: Teaching Notes (last taught 2026-10-28)

- **BFS / DFS**: Slides exist but are hidden (`hide: true`). Given the connection to https://www.secretsofmaps.com, this distinction would be worth including — consider unhiding or referencing it.
- **Dijkstra group exercise**: Did not work paperless. Either simplify the exercise or print and hand out the worksheets.
- **QGIS digitizing (Task 2)**: Takes far too long in class. Digitize the six locations beforehand and hand them out — or upload the ready-made GeoPackage to Moodle as the primary file (not just as a fallback).
- **R exercises**: Far too complex as a follow-along exercise — students were frantically typing without understanding. Provide a structured "demo script" (similar to Reme's approach) so students can run it themselves rather than copy live-typing.
- **`activate()` concept**: The idea of activating nodes vs. edges in `sfnetworks`/`tidygraph` is hard to grasp and is currently glossed over. Needs a dedicated explanation or visual.
- **Prerequisite R skills**: Piping (`|>`), `mutate()`, and `summarise()` must be taught in the introductory R lecture — students lack this foundation when it appears in the network exercises.

## Mermaid diagram styling in Slidev

Slidev renders Mermaid diagrams inside a **Shadow DOM** (`ShadowRoot.vue`). This means **external CSS (including `style.css`) cannot reach Mermaid SVG elements** — any selector-based override from outside will silently do nothing.

To style Mermaid elements (e.g. Gantt axis labels), inject CSS **inside** the diagram using the `themeCSS` init option:

```
%%{init: {'gantt': {'fontSize': 28}, 'themeCSS': '.grid text { font-size: 20px !important; }'}}%%
```

The `themeCSS` value is embedded in a `<style>` element inside the SVG, making it live within the Shadow DOM where it can actually reach the elements.

## Slidev speaker notes

Only the **last** `<!-- ... -->` comment block on a slide is used as speaker notes in presenter view. If a slide needs multiple comment blocks (e.g. for inline code comments), only the final one will appear. Keep all presenter notes in a single comment at the bottom of the slide.
