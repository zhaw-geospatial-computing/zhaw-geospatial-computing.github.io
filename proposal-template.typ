// ============================================================
// Semester Project Proposal Template
// BSc Environmental Engineering · Applied Geoinformatics
// ZHAW · HS26
// ============================================================
// Usage:
//   1. Fill in all fields marked with [...]
//   2. Delete sections that do not apply (e.g. Section 4 if form A or D)
//   3. Compile with: typst compile proposal-template.typ
// ============================================================

#set document(title: "Semester Project Proposal")
#set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm))
#set text(size: 11pt, lang: "en")
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.")
#show heading: it => { v(0.8em); it; v(0.4em) }

#let hint(body) = rect(
  width: 100%, inset: 10pt, fill: rgb("#f5f5f5"), radius: 3pt,
  text(style: "italic", body)
)

// ---------- Title block ----------

#align(center)[
  #text(size: 9pt, fill: rgb("#666666"))[
    BSc Environmental Engineering · Applied Geoinformatics · ZHAW · HS26
  ]

  #v(0.6em)

  #text(size: 18pt, weight: "bold")[Semester Project Proposal]

  #v(1em)

  #grid(
    columns: (1fr, 1fr),
    row-gutter: 0.5em,
    align: left,
    [*Name:*], [[Your Name]],
    [*Email:*], [[firstname.lastname\@students.zhaw.ch]],
    [*Date:*], [[DD.MM.2026]],
    [*Block:*], [(Terrain & Water / Spatial Ecology & Occurrence / Paths & Flows)],
    [*Project form:*], [(A / B / C / D)],
  )
]

#v(1em)
#line(length: 100%, stroke: 0.5pt)
#v(1em)

// ---------- 1. Abstract ----------

= Abstract

// 50–60 words. Summarise your research question, the methods you plan to use,
// and the expected outcome. Write this after completing the other sections.

#hint[Write your abstract here — 50–60 words. Summarise the research question, the
methods you plan to apply, and what you expect to find or produce.]

// ---------- 2. Research Question & Goals ----------

= Research Question & Goals

*Main research question:*

#v(0.3em)
[...]
#v(0.8em)

*Goals:*

+ [First goal — what will you do or produce?]
+ [Second goal]
+ [Third goal _(optional)_]

// ---------- 3. Topic Block & Project Form ----------

= Topic Block & Project Form

*Block:* (Terrain & Water / Spatial Ecology & Occurrence / Paths & Flows)

*Project form:*

- *A* — Extension of a course exercise, going further than what was asked
- *B* — Spatial analysis component of another project you are already involved in
- *C* — Spatial component of an upcoming project / BSc thesis
- *D* — Something entirely new

// ---------- 4. Delimitation from Parent Project (B / C only) ----------

= Delimitation from Parent Project #text(size: 9pt, style: "italic")[(Forms B and C only — delete this section for A or D)]

[Briefly describe the parent project. Then explain clearly what is *new* in your
semester project: what is the specific spatial/methodological contribution, and
how does it differ from or extend the existing work?]

// ---------- 5. Data Sources ----------

= Data Sources

// For each dataset: name, source, format, and whether it is freely accessible.
// Verify that you can actually download the data before submitting this proposal.

#table(
  columns: (2fr, 2fr, 1fr, 1.5fr),
  inset: 7pt,
  align: left,
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#e8e8e8") } else { white },
  table.header(
    [*Dataset*], [*Source*], [*Format*], [*Access*],
  ),
  [e.g. swissALTI3D 2m], [swisstopo.admin.ch], [GeoTIFF], [Free download],
  [...], [...], [...], [...],
  [...], [...], [...], [...],
)

// ---------- 6. Expected Results ----------

= Expected Results

[Describe the expected outputs concretely: maps, plots, tables, statistical
summaries, comparisons between methods or areas. What will you hand in as
evidence that the project is done?]

// ---------- 7. Methods ----------

= Methods

[Describe your planned analytical workflow step by step. Mention the R packages,
functions, or algorithms you plan to use. If you are comparing methods, name both.
You do not need to know every detail yet — but show that you have thought through
the main steps.]

// ---------- 8. Rough Timeline ----------

= Rough Timeline

#table(
  columns: (auto, 1fr),
  inset: 7pt,
  align: left,
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#e8e8e8") } else { white },
  table.header(
    [*Week*], [*Planned tasks*],
  ),
  [KW 48 · 23.11.], [Finalise and submit proposal],
  [KW 49 · 30.11.], [Data acquisition, exploratory analysis],
  [KW 50 · 07.12.], [Coaching session — implement feedback],
  [KW 51 · 14.12.], [Main analysis],
  [KW 52–01 · Christmas break], [Report writing],
  [KW 02 · 11.01.], [Revise and finalise report],
  [KW 03 · 19.01.], [Submit report, begin preparing presentation],
)

// ---------- 9. Risk Analysis & Plan B ----------

= Risk Analysis & Plan B

// Think about what could go wrong. Common risks: data not freely available,
// data quality too low, method too complex, scope too wide.
// For each risk, describe a concrete mitigation or alternative plan.

#table(
  columns: (1.5fr, auto, 1.5fr),
  inset: 7pt,
  align: left,
  stroke: 0.5pt,
  fill: (_, row) => if row == 0 { rgb("#e8e8e8") } else { white },
  table.header(
    [*Risk*], [*Likelihood*], [*Mitigation / Plan B*],
  ),
  [Data not freely accessible], [Medium], [Use alternative dataset (name it)],
  [Scope too wide for 60 h], [Medium], [Limit study area to municipality X],
  [...], [...], [...],
)

// ---------- 10. Questions for the Coaching Session ----------

= Questions for the Coaching Session

// List specific open questions you want to discuss.
// These can be about data, methods, scope, or the written report.

+
+
+
