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
  - Course Overview (Lesson 1)
  - Technical Setup (Lesson 1 & 2)
  - Coordinate Reference Systems (Lesson 3)
  - "Hands-on: CRS in Practice (Lesson 4)"
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

Open RStudio and run:

```r
library(sf)
library(terra)
library(dplyr)
library(ggplot2)
library(tmap)
```

All five should load without errors. A `Warning` is fine — an `Error` is not.

<!--
If sf fails on Linux: missing system libraries — sudo apt install libgdal-dev libgeos-dev

If sf fails on Windows: install Rtools from cran.r-project.org/bin/windows/Rtools
-->

---

# Verify: QGIS

- Open QGIS and check the version number: **Help → About**
- Switch the UI language to English: **Settings → Options → General → User Interface Translation → American English** → restart QGIS

<!--
Switching to English makes it much easier to search for help online and to debug problems together in class.
-->

---

# First Spatial Workflow in R

<!-- Load a Swiss dataset (e.g. swisstopo gemeinden or similar) -->
<!-- st_read() → print CRS → plot() -->
<!-- Goal: confirm the full chain works and start building intuition -->

---

<Inhalt :active="3" />

---

# What You Already Know

&nbsp;

Already covered *Geoinformatik und GIS* last year:

- Coordinates are meaningless without a CRS — EPSG codes identify which one
- The same point in Bern: **2'600'000 E / 1'200'000 N** (LV95) or **7.45° E / 46.95° N** (WGS84)
- You can transform between CRS in QGIS: *Vector → Data Management → Reproject Layer*

**Open question:** Why are different numbers (i.e. CRS used), and why does it matter?

---

# The Shape of the Earth

&nbsp;

- The Earth is not a sphere — it's an **oblate spheroid** (slightly flatter at the poles).
- To do spatial maths, we need a simplified mathematical model: an **ellipsoid**.
- A **datum** specifies the ellipsoid shape and how it is positioned relative to the real Earth.

| Datum   | Ellipsoid           |
| ------- | ------------------- |
| CH1903  | Bessel 1841         |
| CH1903+ | GRS80               |
| WGS84   | GRS80 (≈ identical) |

<!-- CH1903+ is Switzerland's modern datum, aligned with ETRS89. Bessel 1841 and GRS80 are the *ellipsoids* — the datum is what ties the ellipsoid to the actual Earth. -->

---
layout: image
image: /Introduction/oblate-spheroid.png
backgroundSize: contain
---

---
layout: image
image: /Introduction/datum-positioning.png
backgroundSize: contain
---

---

# Datum, Ellipsoid, Projection, CRS

Four concepts that are easy to confuse:

- **Ellipsoid**: the mathematical shape of the Earth model (e.g. Bessel 1841, GRS80)
- **Datum**: the ellipsoid + how it is positioned relative to the real Earth (e.g. CH1903, WGS84)
- **Projection**: the method for flattening the curved surface onto a 2D plane (e.g. Mercator, which is cylindrical)
- **CRS**:
  - **Geographic CRS** = datum + angular coordinate system (lat/lon in degrees, no projection)
  - **Projected CRS** = geographic CRS + a map projection (Cartesian coordinates in metres)

| CRS               | Datum   | Ellipsoid   | Projection                     |
| ----------------- | ------- | ----------- | ------------------------------ |
| LV03 (EPSG:21781) | CH1903  | Bessel 1841 | Oblique Mercator (cylindrical) |
| LV95 (EPSG:2056)  | CH1903+ | GRS80       | Oblique Mercator (cylindrical) |
| WGS84 (EPSG:4326) | WGS84   | GRS80       | none (geographic)              |

---

# Geographic CRS

A **geographic CRS** stores coordinates as angles on the ellipsoid — no projection *per se*:

- **Latitude** (φ): angle from the equatorial plane, −90° … +90°
- **Longitude** (λ): angle from the prime meridian, −180° … +180°

The CRS defines which datum / ellipsoid those angles are measured against.

**WGS84 (EPSG:4326)** is the most common geographic CRS — used by GPS and most global datasets.

&nbsp;

> Any geographic CRS has no projection built in. To display it, software must choose one. The default — treating degrees as x/y — is **plate carrée**.



---

# Switzerland in plate carrée

<img src="/Introduction/platecarre-switzerland.png" style="max-height: 80%; max-width: 100%; object-fit: contain; display: block; margin: 0 auto" />

<SlideFooter>Note how 1° Lat and Lon are of equal distance</SlideFooter>

---



# World in plate carrée

<img src="/Introduction/platecarre-world.png" style="max-height: 80%; max-width: 100%; object-fit: contain; display: block; margin: 0 auto" />

---

# World in plate carrée

<img src="/Introduction/platecarre-world-circles.png" style="max-height: 80%; max-width: 100%; object-fit: contain; display: block; margin: 0 auto" />

<SlideFooter>Blue circles are 500 km radius — same size on the ground, distorted on screen</SlideFooter>

---




# Projected CRS

&nbsp;

- A mathematical transformation flattens the curved surface onto a 2D plane
- All projections distort something: area, shape, distance, or direction
- Coordinates usually in **metres**




---
hide: true
---

# Conversion vs. Transformation

**Coordinate conversion** — same datum, different representation:
- Applying or inverting a map projection (e.g. LV03 → LV95 within the CH1903 family)
- Mathematically exact, no approximation

**Coordinate transformation** — different datums, involves an approximation:
- A datum shift is applied (translation, rotation, scale)
- E.g. 2056 → 4326: CH1903+ uses GRS80 aligned to ETRS89; WGS84 is a global geocentric datum
- The European plate drifts ~2.5 cm/year → by 2026 the offset is ~70–80 cm
- High-precision work requires specifying an **epoch**

&nbsp;

> "Reprojection" is the common term in GIS software for both — useful shorthand, but it conflates two distinct operations.

<!-- Practical implication: for most GIS work the difference is negligible. For geodetic surveying, cadastral work, or combining datasets from different epochs, it matters. -->

---

# Degrees to Metres

How can we convert degrees to meters?

- 1° of **latitude** (North 🡘 South) is always ≈ **111 km** in the real world
- 1° of **longitude** (East 🡘 West) shrinks toward the poles. 
- We can calculate the real world distance of 1° lon based on the latitude (φ) as follows (assumes a perfect sphere)

$$\text{km per 1° lon} = \frac{40075 \cdot \cos(\varphi)}{360}$$



---

<img src="/Introduction/lon-km-by-lat.png" style="max-height: 85%; object-fit: contain; display: block; margin: 0 auto" />

---


> todo:
> - Raster Resolution explenation
> - Talk about projection (equal earth, google, etc)
> - Switch to projected CRS: 
>   - when are they necessary?
>   - how do you find a suitable projected CRS?

---


# Swiss Coordinate Systems

| CRS          | EPSG     | Type              | Use                                 |
| ------------ | -------- | ----------------- | ----------------------------------- |
| WGS84        | 4326     | Geographic (°)    | GPS, data exchange, global datasets |
| **LV95**     | **2056** | **Projected (m)** | **Swiss work — default choice**     |
| LV03         | 21781    | Projected (m)     | Legacy — older swisstopo data       |
| Web Mercator | 3857     | Projected (m)     | Web tile backgrounds only           |

LV95 coordinates for Switzerland: Easting ~2'600'000 m, Northing ~1'200'000 m

The "2" and "1" prefixes were chosen deliberately to distinguish LV95 from LV03 at a glance.

---

# The Axis Order Trap

Geographic coordinates are ordered differently depending on who you ask:

| Convention         | Order                 | Used by                     |
| ------------------ | --------------------- | --------------------------- |
| Mathematics / EPSG | (latitude, longitude) | ISO standard, EPSG registry |
| Software / GeoJSON | (longitude, latitude) | Most APIs, GeoJSON spec     |

Same numbers, swapped axes → your point ends up in the wrong hemisphere.

`sf` in R follows the EPSG axis order. When reading external data (CSV, APIs, GeoJSON), always check which order the coordinates are in.

---

# On-the-Fly Reprojection in QGIS

QGIS can display any layer in any CRS, regardless of what CRS the data is stored in.

This is **visual only** — the data on disk is not changed.

The danger: layers look perfectly aligned on screen, but spatial operations (intersect, buffer, distance) work on raw coordinate values — which are in different CRS.

→ Always reproject to a common CRS before any analysis.

---
layout: zusammenfassung
---

# CRS — Key Takeaways

- Coordinates need a CRS to have meaning — the datum defines the Earth model, the projection defines the 2D transformation
- Geographic CRS (degrees) ≠ Projected CRS (metres): never compute distances or areas in degrees
- 1° longitude is not a fixed distance — it shrinks from 111 km at the equator to 0 at the poles
- For Swiss work: use **LV95 (EPSG:2056)** by default
- QGIS on-the-fly reprojection is visual only — reproject before analysis

---

<Inhalt :active="4" />

---
layout: exercises
---

# Hands-on: CRS in Practice

Open `crs-experiments.R` and run it section by section.

## Experiment 1 — Real-world size of a 1° cell

How large is one degree on the globe, and how does it vary with direction and latitude?

## Experiment 2 — Raster resolution in context

Pick a global raster dataset you know (e.g. from *Geoinformatik und GIS*). What is its resolution in degrees? What does that mean in kilometres — at the equator, and at Switzerland's latitude?

## Experiment 3 — Projection distortion

Run the equal-area circles demo. Which projection would you choose if you needed to:
- Show a map of Switzerland for a report?
- Compute the area of land cover classes globally?
- Show a web map with OSM tiles as background?

---
layout: zusammenfassung
---

# Half-Day Summary

<!-- What we covered today -->
<!-- What's coming next session -->
