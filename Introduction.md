---
theme: default
title: Introduction
favicon: /favicon.png
transition: none
layout: zhaw-cover
subtitle: BSc Umweltingenieurwesen · Geospatial Computing
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

- Verify that R, Positron, and QGIS are correctly installed and configured
- Trace the chain from geoid → ellipsoid → datum → CRS and explain the role of each step
- Distinguish between geographic CRS (degrees) and projected CRS (metres), and explain when each is appropriate
- Explain why 1° of longitude is not a constant distance and calculate its ground equivalent at a given latitude
- Select an appropriate projected CRS for a given country or region
- Use `st_transform()`, `st_make_grid()`, and `st_buffer()` to perform metric spatial operations in R
- Recognise common CRS pitfalls: computing distances in degrees, and on-the-fly reprojection in QGIS

---

<Inhalt :active="1" />

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

- **Phase 1: Foundations** (weeks 2–7): 2 input sessions per topic
- **Phase 2: Semester project launch** (~week 8): individual project, your own research question, data, and methods
- **Phase 3: Deepening & project work**:
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



AI can write spatial analysis code. It can import data, reproject it, run analyses, produce maps.

Why are we teaching any of this?

---

# AI in Geospatial Computing



**Foundations first. AI last.**

- Concepts only become real when you run the code yourself and look at the output: what came back, what's missing, what's wrong.
- Once you have that mental model, AI becomes genuinely useful: you can read its output, catch its mistakes, and trust it where it's trustworthy.
- Without it, you're copying text you can't evaluate.

**Course policy:**

- Weekly tasks: AI use **Strongly discouraged** 
- Semester project: AI use permitted with approriate citation

<!-- If all 24 people in this course send the tasks as a prompt to a data centre, all we have done is consumed a vast amount of energy without learning anything. -->
<!-- The semester project is different: you have already built the mental model. AI can help you go further — but you are responsible for what you submit. -->

---

<Inhalt :active="2" />

---

# In Preparation, You…

Installed or updated 

- R (≥ `4.4`)
- Positron (Development environment, replaces RStudio / Jupyter Notebook)
- QGIS (LTR)
- R packages `sf`, `terra`, `dplyr`, `ggplot2` `tmap`

<!-- TODO: add link to installation instructions on Moodle -->

---

# Positron: Key Concepts

**Folders, not Projects**: open a folder, that is your workspace. No `.Rproj` file needed.

**Creating an R Script**: File → New File → R Script, then `Ctrl+S` to save. Find it in Windows Explorer (it is a plain `.R` text file.)

**Autocomplete**: press `Tab` while typing to complete function names, arguments, column names (`$`), and package exports (`::`). Only works for packages that are loaded in the current session.

<!-- Demo: create a script, save it, navigate to it in Explorer to show there is no magic. -->

---

# Verify: R & Positron

Open Positron and run:

```r
library(sf)
library(terra)
library(dplyr)
library(ggplot2)
library(tmap)
```

All five should load without errors (a `Warning` is usually fine, an `Error` is not).

<!--
If sf fails on Linux: missing system libraries — sudo apt install libgdal-dev libgeos-dev

If sf fails on Windows: install Rtools from [cran.r-project.org/bin/windows/Rtools](https://cran.r-project.org/bin/windows/Rtools/)
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

<!-- 
- Load a Swiss dataset (e.g. swisstopo gemeinden or similar)
- st_read() → print CRS → plot()
- Goal: confirm the full chain works and start building intuition 
 -->

---

<Inhalt :active="3" />

---

# CRS: A Revisit

You covered coordinate reference systems in *Daten und Informationen II* last year. What you covered in *Daten und Informationen II*:

- The Earth is not a irregular object which is mathematically not describable (*Geooid*). 
- The Earth can be mathematically approximated as an **oblate spheroid** (a sphere slightly flatter at the poles)
- *Oblate spheroid* is the name of the shape. It is sometimes also called it's purpose, a  *reference ellipsoid*. 
- Some reference ellipsoids are Bessel 1841, GRS80, WGS84. These consist only of two numbers: semi-major axis a and b
- A reference ellipsoid specifically positioned and oriented to the real earth is called a *datum*
- The same ellipsoid can underlie multiple datums. GRS80 is used by both datums *WGS84* and *ETRS89*

---

# CRS: A Revisit (II)

You covered coordinate reference systems in *Daten und Informationen II* last year. What you covered in *Daten und Informationen II*:

- Once we have a datum, we can work directly in angular coordinates (in a so called *Geographic Coordinate Reference System*, CRS)
- However, for distance or area measurements, a flat plane is preferable: we apply a *projection* to get a *projected CRS*
- There are three types of projections: cylindrical, azimuthal, conical.                          
- Commonly used CRS are in a Database called EPSG and have a unique **EPSG code**: LV95 → 2056, WGS84 → 4326  
- The same location is described by different numbers depending on the CRS. E.g. Bern: 
  - projected CRS (LV95, EPSG:2056): **2'600'000 E / 1'200'000 N**
  - geographic CRS (WGS84, EPSG:4326): **7.45° E / 46.95° N** 


---

# The Shape of the Earth

- The Earth is not a sphere, it's an **oblate spheroid** (slightly flatter at the poles).
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

# The Reference Ellipsoid

Since the Geoid has no mathematical description, we approximate it with an **ellipsoid**: the shape created by rotating an ellipse around the Earth's rotation axis.

It is fully described by two parameters:

- **Semi-major axis a** — radius at the equator
- **Semi-minor axis b** — radius from pole to pole

| Ellipsoid     | Semi-major axis a (m) | Flattening (a−b)/a |
| ------------- | --------------------- | ------------------- |
| Bessel 1841   | 6'377'397             | 1 : 299.15          |
| Clarke 1880   | 6'378'249             | 1 : 293.47          |
| Hayford 1928  | 6'378'388             | 1 : 297.00          |
| GRS80 / WGS84 | 6'378'137             | 1 : 298.26          |

Different regions historically used different ellipsoids, each locally fitted to best match the Geoid in that area. A **datum** ties an ellipsoid to the actual Earth.

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

A **geographic CRS** stores coordinates as angles on the ellipsoid, no projection *per se*:

- **Latitude** (φ): angle from the equatorial plane, −90° … +90°
- **Longitude** (λ): angle from the prime meridian, −180° … +180°

The CRS defines which datum / ellipsoid those angles are measured against.

**WGS84 (EPSG:4326)** is the most common geographic CRS, used by GPS and most global datasets.



> Any geographic CRS has no projection built in. To display it, software must choose one. The default, treating degrees as x/y, is **plate carrée**.



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

<SlideFooter>Blue circles are 500 km radius, same size on the ground but distorted on screen</SlideFooter>

---




# Projected CRS: Families

A projected CRS flattens the curved surface by projecting it onto a **developable surface** (one that unrolls flat). Three geometric families:

| Family | Surface | Typical use |
| ------------ | ---------------------------- | --------------------------------- |
| **Cylindrical** | Cylinder wrapped around globe | World maps, equatorial regions |
| **Conic** | Cone placed over globe | Mid-latitude regions (e.g. Switzerland) |
| **Azimuthal** | Flat plane touching globe | Polar regions, hemispheres |

Coordinates are in **metres** rather than degrees.

---

# Projected CRS: Distortion Properties

Every projection distorts something — the question is **what you choose to preserve**:

- **Conformal** (angle-preserving): local shapes and angles correct — e.g. Mercator, LV95
- **Equal-area** (area-preserving): relative sizes correct — e.g. Mollweide, Equal Earth
- **Equidistant** (distance-preserving): distances along specific lines correct
- **Compromise**: no single property perfectly, but overall distortion minimised — e.g. Robinson

No projection can preserve area, shape, *and* distance simultaneously.

The family and the distortion property are **independent**: a cylindrical projection can be conformal (Mercator) or equal-area (Lambert Cylindrical). LV95 is an oblique cylindrical conformal projection.




---
hide: true
---

# Conversion vs. Transformation

**Coordinate conversion** (same datum, different representation):
- Applying or inverting a map projection (e.g. LV03 → LV95 within the CH1903 family)
- Mathematically exact, no approximation

**Coordinate transformation** (different datums, involves an approximation):
- A datum shift is applied (translation, rotation, scale)
- E.g. 2056 → 4326: CH1903+ uses GRS80 aligned to ETRS89; WGS84 is a global geocentric datum
- The European plate drifts ~2.5 cm/year → by 2026 the offset is ~70–80 cm
- High-precision work requires specifying an **epoch**



> "Reprojection" is the common term in GIS software for both. Useful shorthand, but it conflates two distinct operations.

<!-- Practical implication: for most GIS work the difference is negligible. For geodetic surveying, cadastral work, or combining datasets from different epochs, it matters. -->

---
routeAlias: degrees-to-meters
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
> - Raster Resolution explanation
> - Talk about projection (equal earth, google, etc)
> - Switch to projected CRS: 
>   - when are they necessary?
>   - how do you find a suitable projected CRS?

---


# Swiss Coordinate Systems

| CRS          | EPSG     | Type              | Use                                 |
| ------------ | -------- | ----------------- | ----------------------------------- |
| WGS84        | 4326     | Geographic (°)    | GPS, data exchange, global datasets |
| **LV95**     | **2056** | **Projected (m)** | **Swiss work (default choice)**     |
| LV03         | 21781    | Projected (m)     | Legacy (older swisstopo data)       |
| Web Mercator | 3857     | Projected (m)     | Web tile backgrounds only           |

LV95 coordinates for Switzerland: Easting ~2'600'000 m, Northing ~1'200'000 m

The "2" and "1" prefixes were chosen deliberately to distinguish LV95 from LV03 at a glance.

---

# Same Place, Five Different CRS

The Jet d'eau in Geneva, in five coordinate systems:

| CRS                      | Coordinates                        |
| ------------------------ | ---------------------------------- |
| LV95 (EPSG:2056)         | 2'501'000 E / 1'118'136 N          |
| LV03 (EPSG:21781)        | 501'001 E / 118'136 N              |
| WGS84 (EPSG:4326)        | 46.207° N / 6.156° E               |
| UTM 32N (EPSG:25832)     | 280'601 E / 5'121'021 N (zone 32T) |
| Web Mercator (EPSG:3857) | 685'270 E / 5'813'644 N            |

When you open a dataset, always check which CRS it is in before doing anything with it.

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

This is **visual only**. The data on disk is not changed.

The danger: layers look perfectly aligned on screen, but spatial operations (intersect, buffer, distance) work on raw coordinate values, which are in different CRS.

→ Always reproject to a common CRS before any analysis.

---
layout: zusammenfassung
---

# CRS: Key Takeaways

- Coordinates need a CRS to have meaning. The datum defines the Earth model, the projection defines the 2D transformation.
- Geographic CRS (degrees) ≠ Projected CRS (metres): never compute distances or areas in degrees
- 1° longitude is not a fixed distance. It shrinks from 111 km at the equator to 0 at the poles.
- For Swiss work: use **LV95 (EPSG:2056)** by default
- QGIS on-the-fly reprojection is visual only. Reproject before analysis.

---

<Inhalt :active="4" />

---

# Demo: Placing Monitoring Stations

**Scenario:** You are tasked with placing acoustic bat detectors across Switzerland on a regular 20 km grid. You can place the detector anywhere within 7km of the grid center. You recieve the area of interest in WGS84.

**Question:** How many degrees is 20 km? (see <Link to="degrees-to-meters" title="Slide 'Degrees to meters'"/>)

<v-click> 

>
> How can we convert degrees to meters?
>
> - 1° of **latitude** (North 🡘 South) is always ≈ **111 km** in the real world
> - 1° of **longitude** (East 🡘 West) shrinks toward the poles. 
> - We can calculate the real world distance of 1° lon based on the latitude (φ) as follows (assumes a perfect sphere)
> 
> $$\text{km per 1° lon} = \frac{40075 \cdot \cos(\varphi)}{360}$$
</v-click>


<div v-click class="text-xl"> 

$$ \text{20 km N-S} = \frac{20}{111} = 0.180° \qquad \text{20 km E-W at 47°N} = \frac{20}{\dfrac{40075 \cdot \cos(47°)}{360}} = \frac{20}{75.9} = 0.263°$$

</div>

<!---
So this makes no sense, 20km is a different distance north - south than east west. We need to project our data. But which projection do we use? imagine we dont know, where do we look?
-->

---
layout: iframe

# the web page source
url: https://epsg.io
---

---
layout: iframe

# the web page source
url: https://crs-explorer.proj.org
---


---

# Demo: Placing Monitoring Stations

Step 1: Get the boundary data from [NaturalEarth](https://www.naturalearthdata.com) via the R Package [`rnaturalearth`](https://docs.ropensci.org/rnaturalearth)


```r
# Load the R Packages
library(sf)
library(tmap)

library(rnaturalearth)

# check if the data is available, retrieve if not
check_rnaturalearthdata()

# download the data in the highester resolution (large)
ch <- ne_countries(country = "Switzerland", scale = "large")

# plot the geometry of switzerland for quick inspection
plot(st_geometry(ch))
```

- Visualize your data, does it look ok?
- What are the attributes? 
- What are the coordinates?

---

# Demo: Placing Monitoring Stations

Step 2: Transform the data to `EPSG: 2056` and create the regular grid (20km)

```r
# transform
ch_lv95  <- st_transform(ch, 2056)

# create a regular grid ("centers" creates points).
# Cellsize is interpreted in units of the CRS, "Meters" in our case 
grid_pts <- st_make_grid(ch_lv95, cellsize = 20000, what = "centers")

plot(st_geometry(ch_lv95))
plot(grid_pts, add = TRUE)
```

- Does the grid look OK?

---

# Demo: Placing Monitoring Stations

Step 3: Filter the points and create a buffer

```r
# Clip to Switzerland (short hand notation, note the two commas)
grid_ch  <- grid_pts[ch_lv95,, ]        

# Buffer to specified size
circles  <- st_buffer(grid_ch, dist = 7000)

plot(st_geometry(ch_lv95))
plot(circles, add = TRUE)
```

---

# Demo: Placing Monitoring Stations

Step 4: Visualize:

- `tmap` allows us to vizualize our data in a different CRS using the `crs = ` argument. 
- Try different projections: `2056`, `3857` (Web Mercator), `"+proj=eqc"` (Plat Carée). What changes? 

```r
tm_shape(ch_lv95, crs = 2056) +
  tm_polygons() +
  tm_shape(circles) +
  tm_polygons() +
  tm_graticules()
```

Tipp: Use `tmap_save()` to export the plot. You need to save the map object first


---
layout: exercises
---

- You now are assigned with the same task for a different country. Repeat the steps 1 - 4 for Germany.
- Export your data to a geopackage (`st_write()`) and visualize it similarly using QGIS.

---
layout: zusammenfassung
---

# Half-Day Summary

**What we covered**

- The chain from geoid → ellipsoid → datum → CRS: what each concept adds
- Geographic CRS (degrees) vs projected CRS (metres): why metric analysis requires projection
- 1° of longitude is not a fixed distance — it depends on latitude
- Swiss coordinate systems: LV95 (EPSG:2056) as the default for Swiss work
- On-the-fly reprojection in QGIS is visual only — always reproject before analysis
- Hands-on: building a monitoring grid in R with `sf` and visualising it in different projections with `tmap`

**Next session**

<!-- TODO: fill in once next session content is confirmed -->
