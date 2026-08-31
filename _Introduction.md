---
theme: default
title: Introduction
favicon: /favicon.png
transition: none
layout: zhaw-cover
subtitle: BSc Umweltingenieurwesen · Angewandte Geoinformatik
authors: Nils Ratnaweera
email: rata@zhaw.ch
heading: Introduction
sections:
  - Course Overview
  - Technical Setup
  - Coordinate Reference Systems
  - "Hands-on: CRS in Practice"
---

<!-- title slide: content is defined in frontmatter -->

---
layout: lernziele
---

# Learning Objectives

<!-- TODO: fill in once lesson content is finalised -->

- ...

---

<Inhalt :active="1" />

---

# Schedule

| Time          | Content                                                                       | Format              |
| ------------- | ----------------------------------------------------------------------------- | ------------------- |
| 13:00 – 13:45 | **Course Overview** – semester plan, Leistungsnachweis, AI in geospatial work | Lecture             |
| 13:50 – 14:35 | **Technical Setup** – R, RStudio, QGIS, first spatial workflow                | Demo & guided setup |
| 14:50 – 15:35 | **Coordinate Reference Systems** – recap & mental model                       | Lecture             |
| 15:50 – 16:35 | **Hands-on: CRS in Practice** – working with mismatched CRS in R and QGIS     | Exercise            |

---

# The Course at a Glance

Three topics, each led by one lecturer:

| Topic                        | Focus            | Lecturer |
| ---------------------------- | ---------------- | -------- |
| Terrain & Water              | Raster data      | murj     |
| Spatial Ecology & Occurrence | Vector data      | rahn     |
| Paths & Flows                | Network Analysis | rata     |

---

# The Course at a Glance

Three phases

- **Phase 1 — Foundations** (weeks 2–7): 2 input sessions per topic
- **Phase 2 — Semester project launch** (~week 8): individual project — your own research question, data, and methods
- **Phase 3 — Deepening & project work**: 
  - 1 further input per topic
  - 1× coaching session (**you** present your RQ, data & planned methods → feedback from lecturers / peers)
  - 2× guided self study (bring your data and questions, lecturers present)

<!-- Detailed week-by-week plan: link to Moodle -->

---

# Assessments (Leistungsnachweise)

|                  | What                                         | How         |
| ---------------- | -------------------------------------------- | ----------- |
| Attendance       | Coaching session                             | Pass / Fail |
| Project report   | Written report submitted during the semester | Pass / Fail |
| Oral Module exam | **Project presentation (CW 3 or 4)**         | **Graded**  |

The presentation is the only graded assessment. The other two are pass/fail prerequisites.

<!-- TODO: add deadlines and submission details once confirmed -->

---

# AI in Geospatial Computing

&nbsp;

AI can write spatial analysis code. It can import data, reproject it, run analyses, produce maps.

So — why are we teaching any of this?

---

# AI in Geospatial Computing

&nbsp;

**Foundations first. AI last.**

- Concepts only become real when you run the code yourself and look at the output — what came back, what's missing, what's wrong.
- Once you have that mental model, AI becomes genuinely useful: you can read its output, catch its mistakes, and trust it where it's trustworthy.
- Without it, you're copying text you can't evaluate.

**Course policy:** AI use is permitted, cite it like any other tool. But in the exercises, we build the foundation first.

---

<Inhalt :active="2" />

---

# In Preparation, You…

Installed or updated 

- R (≥ 4.4)
- RStudio
- QGIS (LTR)
- R packages `sf`, `terra`, `dplyr`, `ggplot2` `tmap`

<!-- TODO: add link to installation instructions on Moodle -->

---

# Verify: R & RStudio

<!-- Live check: open RStudio, run library(sf) -->
<!-- Expected output / how to spot a broken install -->
<!-- Common issues: missing system libs on Linux/Mac, Rtools on Windows -->

---

# Verify: QGIS

<!-- Open QGIS, load a sample dataset -->
<!-- Check that the layer appears in the right place -->
<!-- Quick tour of the QGIS interface for those who haven't used it recently -->

---

# First Spatial Workflow in R

<!-- Load a Swiss dataset (e.g. swisstopo gemeinden or similar) -->
<!-- st_read() → print CRS → plot() -->
<!-- Goal: confirm the full chain works and start building intuition -->

---

<Inhalt :active="3" />

---

# Why CRS Still Trips People Up

<!-- Brief framing: students have seen CRS before (GIS module, D&I 2) -->
<!-- But: common source of silent errors in practice -->
<!-- Goal of this lesson: build a mental model, not just rules -->

---

# The Shape of the Earth

<!-- Earth is not a sphere — it's an oblate spheroid (flatter at poles) -->
<!-- We need a mathematical model: the ellipsoid -->
<!-- Different ellipsoids fit different regions better (Bessel 1841 for CH historically) -->
<!-- The datum defines: which ellipsoid + where is the origin -->

---

# Geographic vs. Projected CRS

<!-- Geographic CRS: coordinates in degrees (lon/lat) on the ellipsoid surface -->
<!--   - WGS84 (EPSG:4326): global standard, used by GPS -->
<!-- Projected CRS: coordinates in metres on a flat 2D surface -->
<!--   - Requires a projection: mathematical transformation from curved to flat -->
<!--   - All projections introduce distortion (area, shape, distance, direction) -->
<!-- Rule of thumb: never compute distances or areas in a geographic CRS -->

---

# Swiss Coordinate Systems

<!-- LV95 (EPSG:2056): current Swiss national CRS, projected, origin near Bern -->
<!--   - Easting (X) ~2'600'000 m, Northing (Y) ~1'200'000 m -->
<!--   - Prefix digits (2/1) intentionally different from LV03 to avoid mix-ups -->
<!-- LV03 (EPSG:21781): old system, still in historical/legacy data -->
<!-- WGS84 (EPSG:4326): geographic, used for GPS and data exchange -->
<!-- Web Mercator (EPSG:3857): for web tile backgrounds only — never analyse in this -->

---

# The Axis Order Trap

<!-- Geographic CRS: mathematically defined as (latitude, longitude) -->
<!--   - lat = north-south, lon = east-west -->
<!-- But most software uses (x, y) = (lon, lat) -->
<!-- GeoJSON spec: always (lon, lat) -->
<!-- EPSG registry: (lat, lon) for geographic CRS -->
<!-- Result: same numbers, swapped axes → point ends up in the wrong hemisphere -->
<!-- sf in R: follows EPSG axis order — be explicit when reading external data -->

---

# On-the-Fly Reprojection in QGIS

<!-- QGIS can display layers in any CRS regardless of the layer's native CRS -->
<!-- "On-the-fly" = visual only; the data on disk is unchanged -->
<!-- Danger: layers look aligned but spatial operations will fail or give wrong results -->
<!-- Fix: always reproject to a common CRS before any analysis -->

---

<!-- TODO: additional CRS slides based on discussion of open questions -->

---
layout: zusammenfassung
---

# CRS — Key Takeaways

<!-- Summary of the 3-4 most important points from this lesson -->

---

<Inhalt :active="4" />

---
layout: exercises
---

# Hands-on: CRS in Practice

<!-- Exercise 1: load two layers with mismatched CRS, observe the misalignment -->
<!-- Exercise 2: measure a distance in WGS84 → compare to correct result in LV95 -->
<!-- Exercise 3: reproject to LV95, redo the measurement, confirm -->
<!-- Stretch: QGIS on-the-fly trap — run a spatial join on visually aligned but unrerojected layers -->

---
layout: zusammenfassung
---

# Half-Day Summary

<!-- What we covered today -->
<!-- What's coming next session -->
