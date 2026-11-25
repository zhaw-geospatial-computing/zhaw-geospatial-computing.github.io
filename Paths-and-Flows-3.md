---
theme: default
title: Paths and Flows 3
favicon: /favicon.png
transition: none
layout: zhaw-cover
subtitle: BSc Environmental Engineering · Applied Geoinformatics
authors: Nils Ratnaweera
email: rata@zhaw.ch
heading: Paths and Flows 3
sections:
  - Travel Times & Isochrones
  - Uncertainty in Geodata
  - Monte Carlo Simulation
  - "Group Exercise: Monte Carlo"
  - R Exercises
mermaid:
  theme: default

---

<!-- title slide: content is defined in frontmatter -->

---
layout: lernziele
---

# Learning Objectives

- You can explain the concept of **accessibility** via transport networks in your own words and sketch simple spatial extents of isochrones on networks by hand.
- You are familiar with the key concepts of geodata quality: **accuracy**, **precision**, and **vagueness**.
- You can explain **Monte Carlo simulation** as a method and apply it to solve the **Birthday Paradox** in R.
- You can quantify **route uncertainty** in R by running Monte Carlo simulations with perturbed edge weights and identify robust versus contested network segments.

---

# Today's Schedule

| Time | What | Format |
|------|------|--------|
| 13:00 – 13:50 | Theory: Travel times & isochrones | Lecture |
| 14:00 – 14:40 | Theory: Uncertainty in geodata, Monte Carlo | Lecture |
| 14:50 – 15:20 | Group work: Monte Carlo  | Pairs |
| 15:30 – 16:35 | R exercise: Route uncertainty in Wädenswil | Supervised individual work |

---

<Inhalt :active="1" />

---
layout: two-cols
---

## Isochrones

- Until now we have considered paths between individual start and end points.
- To evaluate space we would like **areal** information about the accessibility of the entire settlement area.
- Isochrones make exactly this possible.

::right::

<img src="/Austro-hungarian-empire-railway-network-1912-2-2.png" class="h-80 object-contain" />

---
layout: two-cols
---

## Isochrones

- Isoline of all places reachable from an origin in the **same travel time**
- Constructed via a Shortest Path analysis from the origin to all destination points
- Varies by mode of transport

::right::

<img src="/Austro-hungarian-empire-railway-network-1912-2-2.png" class="h-80 object-contain" />

<!--
Key conceptual shift: from point-to-point routing → area-based accessibility.

The word "isochrone" comes from Greek: *isos* (equal) + *chronos* (time) — same as isohypse (contour line) or isobar (equal pressure).

Construction: run Dijkstra from the origin to ALL nodes in the network. Any node reachable within the time threshold lies inside the isochrone. Connect the boundary nodes → polygon.

The isochrone shape reflects the network geometry, not Euclidean distance — it is typically elongated along fast roads and compressed across barriers like rivers or hills.
-->

---
layout: image
image: /Isochronic_Passage_Chart_Francis_Galton_1881.jpg
backgroundSize: contain
---


<!--
- Francis Galton's first known isochronic map published for the Proceedings of the Royal Geographical Society, 1881. It shows the travel times in 1881 from London, United Kingdom to different parts of the world in days. It assumes that there are favourable travel conditions and that travel arrangements over land have been made in advance. It assumes travelling methods of the day within a reasonable cost.
- Note: Trans-Siberian Railway started in 1891 and was completed in 1904
- Note the rings around Africa and South America


-->


---
layout: image
image: /Map_of_Melbourne_and_environs_minimum_railway_or_tramway_time_zones.jpg
backgroundSize: contain
---


<!--
An early isochrone map of Melbourne rail transport travel times, 1910–1922

-->




---
layout: two-cols
hide: true
---

## The Shrinking Switzerland

- Travel-time maps do not show geographic distances, but **travel times**.
  - Map scale is one hour of travel time.
  - The map origin is Bern.
  - Since 1950 Switzerland has shrunk by more than half.

::right::

<img src="/Road-travel-time-scaled-maps-of-Switzerland-same-scale-for-both-years.webp" class="h-80 object-contain" />

<!--
Classic example: Axhausen et al. (2008) time-scaled maps of Switzerland.

- **Travel time rather than kilometres**. The distances between locations here do not correspond to the geographical distance, but to the travel time required by road. Both maps use exactly the same time scale (see the ‘Travel time: 1 Hour’ bar).
- **Distorted coordinate system**. The overlaid grid originally consists of regular 10 × 10 km squares. Where motorway axes (green lines) run, the locations are closer together in terms of travel time, which compresses the grid at these points. Remote mountain regions without major transport routes appear elongated in comparison.
- **Halving of the area**. Owing to the construction of national roads (motorways) and more efficient cars, the area of Switzerland in terms of travel time has roughly halved over these 50 years – destinations can now be reached in about half the time it took in 1950.
-->

---
hide: true
---

## The Shrinking Switzerland – 1990 vs. 2000

- What differs between 1990 and 2000?
- What happened?


<!--
Ask students to compare the maps like a "spot the difference" game — what changed between 1990 and 2000?

**Answer**: The Lower Engadin "tail" (Unterengadin) was pulled in. The cause: the **Vereina Tunnel** opened in 1999. Before it, travelling from Zurich to the Lower Engadin required going via the Albula line through the Upper Engadin — roughly 5–5.5 hours. The tunnel cut that dramatically.

Good discussion point: a single infrastructure investment can reshape the entire accessibility landscape.

Let students discuss in pairs for ~1 minute before revealing the answer.
-->

---
layout: image
image: /eth-28947-02-page-0002.png
backgroundSize: contain
---

---
layout: image
image: /eth-28947-02-page-0003.png
backgroundSize: contain
---

---
layout: image
image: /eth-28947-02-page-0004.png
backgroundSize: contain
---

---
layout: image
image: /eth-28947-02-page-0005.png
backgroundSize: contain
---

---
layout: image
image: /eth-28947-02-page-0006.png
backgroundSize: contain
---


<!-- The Lower Engadin "tail" (Unterengadin) was pulled in. The cause: the **Vereina Tunnel** opened in 1999. Before it, travelling from Zurich to the Lower Engadin required going via the Albula line through the Upper Engadin — roughly 5–5.5 hours. The tunnel cut that dramatically. -->



---
layout: image
image: /eth-28947-02-page-0007.png
backgroundSize: contain
---

<!--
Zoom into the 1990 → 2000 change.

The southern part (Ticino, Valais) dramatically "moved closer" to Bern — the Gotthard and Lötschberg axes made this possible.

Illustrates the planning relevance of accessibility maps: they reveal who benefits from infrastructure investment.
-->

---
layout: iframe
url: https://routing.heigit.org/ors/
---


<!--
Live demo moment: openrouteservice.org (ORS) is a free, open-source routing service based on OpenStreetMap data.

Computes isochrones interactively in the browser — open it and demonstrate live.

Key features:
- Multiple transport modes (car, cycling, walking, wheelchair)
- Multiple time/distance thresholds → nested isochrones
- Also available as a REST API and QGIS plugin

**Good in-class activity**: drop a point on ZHAW Grüntal and show the 5/10/15-minute walking isochrones. Ask: does the shape make sense given the terrain? Why does it extend further downhill than uphill?
-->

---
layout: two-cols
hide: true
---

## Accessibility

- Accessibility converts built transport infrastructure into **travel-time distances**.
  - Quantitative indicator for assessing coverage by public transport (PT) and private motorised transport (PMT)
- Planning relevance:
  - **Transport planning**: decisions on future network expansions
  - **Spatial planning**: assessing location, type and quantity of building zones

::right::

**Travel times to centres**

<img src="/Paths-and-Flows-3/_page_12_Figure_10.jpeg" class="h-72 object-contain" />

<!--
Accessibility is not just an academic concept — it is used directly in planning:

- Swiss ARE publishes accessibility indicators for every municipality.
- ÖV-Güteklassen (PT quality classes) determine where high-density zoning is permitted.

Key message: network analysis outputs directly feed into binding spatial planning decisions.
-->

---
layout: zusammenfassung
---

# Summary

- **Isochrones** are isolines of all places reachable from an origin in the same travel time — constructed via Dijkstra's shortest path to all nodes.
- The shape of an isochrone reflects network geometry, not Euclidean distance.
- Travel-time maps and accessibility indicators are used directly in Swiss spatial planning (ÖV-Güteklassen, ARE indicators).

---

<Inhalt :active="2" />

---

## From Travel Times to Uncertainty

<v-clicks>

- We have computed routes and isochrones — but how reliable are these results?
- Edge weights (e.g. travel times) carry different types of uncertainty:
  - **Data quality**: Speed limits may be imprecise, missing, or outdated
  - **Stochastic variation**: travel times fluctuate with traffic, congestion, and time of day
- **→ If we acknowledge this uncertainty, can we address it in our analysis?**

</v-clicks>

<!--
This bridge slide is the pivot of the session.

The key message: the methods we have learned (Dijkstra, isochrones) produce a single deterministic answer. But the inputs are uncertain. What does that mean for the outputs?

The two sources of uncertainty are deliberate:
1. Data quality → connects to the broader topic of geodata quality (section 2)
2. Stochastic variation → motivates Monte Carlo as the tool (section 2 + group exercise)
-->



---
layout: two-cols
hide: true
---

## Uncertainty in Geodata

- Geodata uncertainty arises at multiple stages in the development of a GIS application:
- e.g. capturing a **forest boundary**
  - Uncertain **specification/definition** of the phenomenon 'forest boundary'
  - Uncertain/inaccurate **surveying** of the boundary vertices
  - Uncertain **data processing**, e.g. interpolation of the boundary from the points
  - Uncertain correspondence of an aerial image with reality

::right::

![]( /Paths-and-Flows-3b/_page_6_Picture_16.jpeg)

<!--
The forest boundary example is a good spatial one — students can visualise it.

Key point: uncertainty is not just measurement error. It enters at every stage of the data pipeline: concept definition, surveying, processing, and interpretation.

This is relevant to OSM data too: who decides where a road starts and ends? How is a path classified as "footway" vs "track"?
-->

---

## Typology of Imperfection


<img src="/typology-of-imperfection.svg" class="h-96 object-contain" />


<!--
The typology (from Worboys & Duckham) distinguishes several types of data imperfection:
- Inaccuracy: difference from true value
- Vagueness: inherent fuzziness of the concept itself
- Ambiguity: multiple valid interpretations
- Incompleteness: missing data

We will focus on inaccuracy (accuracy/precision) and vagueness — both are common in spatial data and have GIS-specific implications.
-->

---

## Accuracy and Precision

<img src="/precision-accuracy-dartboard.png" class="h-96 object-contain" />

<!--
Classic target diagram:
- Accurate AND precise: all shots close to the centre
- Precise but not accurate: shots cluster together but miss the centre (systematic error / bias)
- Accurate but not precise: shots scattered around centre (random error)
- Neither: scattered and off-centre

In geodata: a GPS device that always reports 5 m to the north is precise but not accurate. A device with random noise centred on the true position is accurate but not precise.
-->

---



## Vagueness — Sorites Paradox


> Under the assumption that removing a single grain does not turn a heap into a non-heap, the paradox is to consider what happens when the process is repeated enough times: is a single remaining grain still a heap? If not, when did it change from a heap to a non-heap?


<img src="/Paths-and-Flows-3b/_page_24_Picture_6.jpeg" class="h-52 object-contain" />


<!--
Vagueness is a different kind of imperfection from inaccuracy. It is not a measurement problem — it is an inherent property of the concept itself.

The Sorites paradox: "heap" has no sharp boundary. No single grain makes the difference. This is fundamental vagueness — the concept "heap" does not have a crisp extension.

Spatial examples: "forest", "urban area", "wetland", "steep slope". When does scrubland become forest? There is no single pixel that makes the difference.

This matters in GIS because we constantly force vague phenomena into crisp boundaries (polygons). The boundary is a modelling choice, not a fact about reality.
-->

---
hide: true
---

## Vagueness – Where is the Forest Edge?


![]( /Paths-and-Flows-3b/_page_25_Figure_6.jpeg)

<!--
Classic GIS example of vagueness: the forest edge.

The image shows a gradient transition from open land to dense forest. There is no single "forest edge" line — there is a transition zone of varying width.

When a GIS analyst digitises a "forest boundary", they must make an arbitrary choice about where to draw the line. Different analysts will draw it differently — not because of measurement error, but because the concept is inherently vague.
-->

---
hide: true
---

## Fuzzy Set Theory in GIS

![]( /Paths-and-Flows-3b/_page_28_Figure_6.jpeg)

- **Fuzzy membership function**
- Each point has a membership to the forest $\in [0, 1]$
  - $0.0$: definitely not in the forest
  - $0.6$: more likely in the forest
  - $1.0$: definitely in the forest

<!--
Fuzzy set theory (Zadeh, 1965) provides a formal framework for modelling vagueness.

Instead of a crisp binary (in/out), each element has a *degree of membership* between 0 and 1.

The membership function shape depends on the phenomenon: a linear gradient across the transition zone is common for forest edges, but other shapes (sigmoid, trapezoidal) may better represent other phenomena.

In GIS: a raster layer where each cell contains a membership value [0,1] rather than a binary class label.
-->

---
hide: true
---

## Fuzzy Set Theory in GIS

![]( /Paths-and-Flows-3b/_page_29_Figure_6.jpeg)

<!--
Application: given fuzzy membership values for each spatial location, standard Boolean operations (AND, OR, NOT) are replaced by fuzzy operations:
- Fuzzy AND = minimum of memberships
- Fuzzy OR = maximum of memberships

This allows multi-criteria overlay with uncertainty propagation — rather than sharp class boundaries, the result reflects the underlying vagueness.

Practical tool: ArcGIS Fuzzy Membership, R packages `sets` or `FuzzyR`.
-->

---
class: text-sm
hide: true
---

## Dimensions of Data Quality

| Dimension | | |
|---|---|---|
| Data quality | Quality | Uncertainty, accuracy and precision, vagueness. Relevant for decision-making |
| Lineage | Provenance | Origin of the data, source, age, collection purpose, description of processing steps |
| Metadata | Metadata | 'Data about data'; data quality measures are important metadata |
| Bias | Systematic errors | Systematic errors, deliberately or inadvertently introduced in data collection or processing |
| Completeness | Completeness | Which elements of reality are included or not |
| Currency | Up-to-dateness | Time span between the dataset and its source |
| Timeliness | Temporal relevance | Does the collection date cover the relevant analysis period? |

<!--
Seven dimensions of data quality — a standard framework for evaluating any geodataset.

For OSM data:
- Quality: depends on contributor density and local knowledge
- Lineage: GPS tracks, aerial imagery, local surveys — varies by region
- Bias: urban areas much better mapped than rural; wealthy countries better than others
- Currency: may be years out of date in low-activity areas

For the Wädenswil network: students can think about which dimensions apply to the routing exercise we did in Parts 1 & 2.
-->

---
hide: true
---

## e.g. DTM Canton Zurich

![]( /Paths-and-Flows-3b/_page_41_Figure_6.jpeg)
![]( /Paths-and-Flows-3b/_page_41_Figure_7.jpeg)
![]( /Paths-and-Flows-3b/_page_41_Figure_8.jpeg)

<!--
Concrete example of data quality dimensions for a Digital Terrain Model (DTM) of Canton Zurich.

Shows how the quality metadata accompanies the dataset:
- Source (airborne LiDAR)
- Resolution (grid spacing)
- Accuracy (vertical RMSE in open terrain vs. under forest canopy)
- Currency (survey date)
- Completeness (coverage gaps)

Key point: every professional geodataset comes with this kind of documentation. Students should always read the metadata before using a dataset in analysis.
-->

---

<Inhalt :active="3" />

---

## Monte Carlo Simulation

- For many spatial analyses we have an estimate of precision but limited knowledge of accuracy.
- We want to know the the effect of uncertainty *and it's magnitude* on our analysis.
- Monte Carlo Simulation is an **estimation method** to quantify this effect.
- Problems that are analytically difficult or impossible to solve are addressed numerically using random sampling


<!--
Monte Carlo connects the uncertainty theory to the practical exercise.

The core idea: if we can't solve the problem analytically, we can simulate it many times under different random conditions and look at the distribution of results.

For geodata: we know the precision of our measurements (or can estimate it). We don't know the exact error. → Simulate many possible error scenarios → see how much the result varies.

This is exactly what we will do in the R exercise: simulate many possible road-length scenarios and observe how the optimal route changes.
-->

---
layout: two-cols-header
---

## Monte Carlo Simulation on the *Monty Hall Problem*


::left::

<v-clicks>

- Three doors: one hides a **car**, two hide **goats**
- You pick a door 
- the host opens one of the other doors, revealing a goat
- The host asks if you want to switch to the remaining door, or stay
- **Should you switch?**
</v-clicks>

<CountdownTimer v-click="6" :minutes="5" />





::right::

<div class="relative flex items-center justify-center h-full">
  <img v-click="1" src="/montynumbers-1.PNG" class="w-full object-contain" />
  <img v-click="2" src="/montynumbers-4.PNG" class="absolute top-0 left-0 w-full object-contain" />
  <img v-click="3" src="/montynumbers-5.PNG" class="absolute top-0 left-0 w-full object-contain" />
  <img v-click="4" src="/montynumbers-7.PNG" class="absolute top-0 left-0 w-full object-contain" />
  <img v-click="5" src="/montynumbers-8.PNG" class="absolute top-0 left-0 w-full object-contain" />

</div>


<!--
Let students vote first: stay / switch / doesn't matter. Usually a majority say "doesn't matter".

Then reveal: switching wins 2/3 of the time. The room reacts.

Historical note: in 1990 Marilyn vos Savant published the correct answer in Parade magazine and received ~10,000 letters calling her wrong — including from PhD mathematicians.
-->

---

## Monte Carlo Simulation on the *Monty Hall Problem*

<v-clicks>

- This problem went "viral" in 1990 when columnist Marilyn vos Savant was asked the question in in the *Parade magazine* 
- vos Savant responded "Yes, you should switch. The first door has a 1/3 chance of winning, but the second door has a 2/3 chance."
- The magazine received more than 10,000 letters, most of readers who said she was wrong:
</v-clicks>

<div v-click>

> Since you seem to enjoy coming straight to the point, I’ll do the same. You blew it! [...] As a professional mathematician, I’m very concerned with the general public’s lack of mathematical skills. Please help by confessing your error and in the future being more careful.

</div>
<div v-click>

> Maybe women look at math problems differently than men.

</div>



---

## Monte Carlo Simulation on *Monty Hall Problem*

Let's use the Monte Carlo Simulation approach to solve this problem

<v-clicks>

```r {1-2|4-5|7-8|10-12|14-16}
# Set a number of iterations
N    <- 100000

# From Doors 1 - 3, sample *one* door N times
car_door  <- sample(1:3, N, replace = TRUE)

# Also sample the initially chosen door N times
picked_door <- sample(1:3, N, replace = TRUE)

# How often was the initially picked door the one with the car?
# (TRUE is treated as 1)
sum(picked_door == car_door) 

# How often was it in the other door (not picked)?
sum(picked_door != car_door)
```
</v-clicks>



<!--
- Switching wins whenever you **originally picked wrong** — and that happens 2/3 of the time
- 100,000 simulations in milliseconds; no probability theory required
-->

---
layout: two-cols
hide: true
---


## Monte Carlo Simulation

<v-clicks  depth="2">

- **Question:** What is the area of a circle with radius 1m?
- **Premise:**
  - We dont know $r^2 \times \pi$
  - We *do* know how to compute rectangle areas: That square around the circle has area of 4m².
- **Idea:**
  - The circle fills some unknown fraction $f$ of the square — if we know $f$, we know the area
  - We can estimate $f$ by counting random points in the square
  - a point is inside the circle if $x^2 + y^2 \leq 1$
  - $f = \frac{\text{blue points}}{\text{all points}}$
</v-clicks>


::right::

<div class="relative flex items-center justify-center h-full">
  <img v-click="1" src="/mc-pi-circle-1.png" class="w-full object-contain" />
  <img v-click="4" src="/mc-pi-circle-2.png" class="absolute top-0 left-0 w-full object-contain" />
  <img v-click="7" src="/mc-pi-circle-3.png" class="absolute top-0 left-0 w-full object-contain" />

</div>


---
layout: two-cols
hide: true
---


## Group Exercise: Monte Carlo 

Write an R script that calculates our circle area (no  AI!)

<v-clicks>

1. Generate 1'000 random points (x and y-coordinates) in the range -1 to +1 (use `runif()`)
2. For each point, determine if its *inside* or *outside* the circle ($x^2 + y^2 \leq 1$)
3. Compute $\hat{f} = \dfrac{\text{points inside}}{1000}$
4. Calculate the area $\hat{f} \times 4\text{m}^2$

</v-clicks>


<CountdownTimer :minutes="20" />


::right::

<img src="/mc-pi-circle-4.png" class="h-full object-contain" />


<!--
Competition format — motivates fast coding.

**Expected solution (don't reveal until after):**
```r
N <- 10000
x <- runif(N, -1, 1)
y <- runif(N, -1, 1)
inside <- x^2 + y^2 <= 1

pi_hat <- 4 * sum(inside) / N
cat("π ≈", pi_hat, "\n")

library(ggplot2)
df <- data.frame(x, y, inside)
ggplot(df, aes(x, y, color = inside)) +
  geom_point(size = 0.3, alpha = 0.5) +
  coord_equal() +
  labs(title = paste("π ≈", round(pi_hat, 4)))
```

**Discussion after**: how does the estimate improve with larger N? Error ∝ 1/√N.

**Bridge to R exercise**: "We just used random sampling to solve an analytical problem. Now we apply the same idea to a network question: if edge weights are uncertain, how reliable is the optimal route?"
-->

<!--

-->

---

## Birthday Paradox


**Question:** How many people do you need in a room for a >50% chance that at least two share a birthday?

<CountdownTimer :minutes="1" />


---
layout: two-cols
---

## Group Exercise: Birthday Paradox

Solve this using Monte Carlo:

<v-clicks depth="2">

- Part a):
  - Take $k$ people, e.g. `k <- 50`
  - Sample $k$ random birthdays from 1–365 (`sample()`)
  - Check if any two are identical (`duplicated()`)
- Part b):
  - Repeat Part a) 1'000 times for each $k$ from 2 to 100 (use a `for` loop)
  - Record the fraction of runs with a shared birthday
  - Plot $k$ vs fraction — at what $k$ does it first exceed 50%?
</v-clicks>

<CountdownTimer :minutes="20" />

::right::

<!--
Expected solution:

```r
# Part a)
k <- 50
birthdays <- sample(1:365, size = k, replace = TRUE)
any(duplicated(birthdays))

# Part b)
results <- numeric(100)

for (k in 2:100) {
  shared <- 0
  for (i in 1:1000) {
    b <- sample(1:365, size = k, replace = TRUE)
    if (any(duplicated(b))) shared <- shared + 1
  }
  results[k] <- shared / 1000
}

plot(results, type = "l", xlab = "k (people)", ylab = "Probability")
abline(h = 0.5, lty = 2, col = "red")
```

Answer: k = 23 (probability ≈ 50.7%)
-->

---
layout: zusammenfassung
---

# Summary

- Geodata is notoriously uncertain. **Accuracy** (closeness to reality) is distinct from **precision** (degree of specificity). **Vagueness** refers to inherent fuzziness in the concept itself — not a measurement problem.
- **Fuzzy Set Theory** models vague boundaries (e.g. forest edges) via membership functions $\in [0, 1]$.
- **Monte Carlo Simulation** quantifies the effect of uncertainty numerically: simulate many random scenarios, aggregate the results.


---

<Inhalt :active="5" />

---

# R Exercises — Working Data

Same GeoPackage as Parts 1 and 2, plus the locations file from Part 2.

| File | Layer | Content |
|------|-------|---------|
| `netzwerkanalyse.gpkg` | `osm_highway_prepared` | Street network, LV95 |
| `netzwerkanalyse.gpkg` | `Gemeinde_Waedenswil` | Municipality boundary |
| `routing_locations.gpkg` | — | Named locations from Part 2 |

**Question we will answer:**

> *If travel times on each road segment are uncertain (±20%), how reliable is the computed optimal route? Which segments always appear — and which are contested?*

<!--
Students can build on their Part 1 and 2 scripts.

If routing_locations.gpkg is missing, a pre-made version should be on Moodle.

The ±20% framing covers both sources of uncertainty from the theory:
1. OSM data quality — edge lengths and speed limits may be imprecise
2. Stochastic variation — traffic, congestion, time-of-day effects
-->

---


# Task 1: Setup & Baseline (Recap)

Build the network and find the deterministic shortest path — same as Part 2.


```r
library(sf); library(sfnetworks); library(tidygraph)
library(dplyr); library(tmap)

streets   <- read_sf("netzwerkanalyse.gpkg", layer = "osm_highway_prepared")
locations <- read_sf("routing_locations.gpkg")

net <- as_sfnetwork(streets, directed = FALSE) |>
  activate("edges") |> mutate(length = edge_length())
edges <- st_as_sf(net, "edges")

spitzen <- locations |> filter(name == "Spitzen")
bahnhof <- locations |> filter(name == "Bahnhof")

baseline <- st_network_paths(net, spitzen, bahnhof, weights = "length")
baseline_edges <- net |> activate("edges") |>
  slice(baseline |> pull(edge_paths) |> unlist()) |> st_as_sf()
```

---

<img src="/netzwerkanalyse-r/shortest_path.png" class="h-full object-contain" />

<!--
Students who still have their Part 2 script can copy it directly.

We extract `edges` as a plain sf object upfront — we will mutate it later to store frequency counts.
-->

---

<img src="/Paths-and-Flows-3/task1-baseline.png" class="h-full object-contain" />

---

# Task 2: Perturb Edge Weights Once

Multiply each edge length by a random factor drawn from **Uniform(0.8, 1.2)** — a ±20% random scaling.

```r
set.seed(42)

net_noisy <- net |>
  activate("edges") |>
  mutate(length_noisy = as.numeric(length) * runif(n(), min = 0.8, max = 1.2))

noisy_path  <- st_network_paths(net_noisy, spitzen, bahnhof, weights = "length_noisy")
noisy_edges <- net_noisy |> activate("edges") |>
  slice(noisy_path |> pull(edge_paths) |> unlist()) |> st_as_sf()

tm_shape(edges) + tm_lines(col = "gray85") +
  tm_shape(baseline_edges, is.main = TRUE) + tm_lines(col = "steelblue", lwd = 2) +
  tm_shape(noisy_edges) + tm_lines(col = "tomato", lwd = 1.5) +
  tm_shape(bind_rows(spitzen, bahnhof)) + tm_dots() + tm_text("name", ymod = 0.5)
```

Did the route change? A single perturbation is inconclusive.

<!--
**Why multiply rather than add?**
Multiplicative noise keeps weights positive and scales naturally — a 20% delay on a long road has a bigger absolute effect than 20% on a short road.

Expected result: routes are often identical or differ by only 1–3 segments near junctions where alternative paths have similar total cost.

Key insight: a single perturbation is inconclusive. We need many iterations to see the pattern.
-->

---

<img src="/Paths-and-Flows-3/task2-perturbation.png" class="h-full object-contain" />

---

# Task 3: Monte Carlo Loop

Run **100 iterations**. In each: perturb weights → shortest path → accumulate which edges appeared.

```r
edge_count <- rep(0L, nrow(edges))

for (i in 1:100) {
  net_i  <- net |> activate("edges") |>
    mutate(length_noisy = _____)              # 1. perturb weights ±20%
  path_i <- st_network_paths(net_i, spitzen, bahnhof, weights = "length_noisy")
  idx    <- path_i |> pull(edge_paths) |> unlist()
  edge_count[idx] <- _____                   # 2. accumulate
}
```

Fill in the two blanks — then run the loop. What does `edge_count` now contain?

<!--
**Solutions:**
1. `as.numeric(length) * runif(n(), min = 0.8, max = 1.2)`
2. `edge_count[idx] + 1L`

**Performance**: 100 iterations on the Wädenswil network runs in roughly 10–20 seconds.

**Common question**: "Why not set.seed() inside the loop?" — because then every iteration would produce the same perturbation, defeating the purpose.

**The accumulator pattern** (`edge_count[idx] <- edge_count[idx] + 1`) is a fundamental Monte Carlo building block.
-->

---

# Task 4: Visualise & Interpret

```r
edges_mc <- edges |> mutate(n = edge_count)

tm_shape(edges_mc |> filter(n == 0)) +
  tm_lines(col = "gray90") +
  tm_shape(edges_mc |> filter(n > 0), is.main = TRUE) +
  tm_lines(col = "n", palette = "inferno", style = "cont",
           title.col = "Times\nin path") +
  tm_shape(bind_rows(spitzen, bahnhof)) +
  tm_dots() + tm_text("name", ymod = 0.5)
```

- Which segments appear in nearly **all 100** paths? Why are they always chosen?
- Which are **contested** (sometimes chosen, sometimes not)? Where do they occur?
- **Bonus:** try `runif(n(), 0.5, 1.5)` — does the robust core shrink?

<!--
**Reading the map:**

- **Bright (yellow/white)** edges: appear in almost every path → **robust core**
- **Dark (purple)** edges: appear only occasionally → **alternative segments**
- **Gray** edges: never in any optimal path

Expected result: a small bright core along the main road climbing from the station. Around junctions where alternative paths have nearly equal total cost, you will see dark-purple competing segments.

**Planning relevance:** Segments with freq ≈ 1.0 are critical infrastructure — if closed, there is no good alternative.
-->

---

<img src="/Paths-and-Flows-3/task4-frequency.png" class="h-full object-contain" />

---
layout: zusammenfassung
---

# Summary

- **Monte Carlo simulation** replaces an analytical problem with many random experiments and aggregates the results.
- In network analysis, edge weights (travel times, distances) are **uncertain** — from OSM data quality and from stochastic variation (traffic, congestion, time of day).
- Repeating shortest-path calculations with **perturbed weights** reveals which route segments are **robust** and which are **contested**.
- Segments with high frequency (`freq ≈ 1`) are **critical infrastructure** — the route depends on them regardless of conditions.

---

## Reading Material & Literature

- Duckham, M., Sun, Q. C., & Worboys, M. F. (2024). *GIS: a computing perspective*. CRC press, Ch. 10.1.1, The ontology of imperfection, pp. 403–409.
- Axhausen, K. W., Dolci, C., Fröhlich, P., Scherer, M., & Carosio, A. (2008). Constructing Time-Scaled Maps: Switzerland from 1950 to 2000. *Transport Reviews*, 28(3), 391–413.
- Interactive isochrone tool: openrouteservice.org
- Swiss accessibility indicators (ARE): are.admin.ch → Grundlagen und Daten → Raumbeobachtung → Erreichbarkeit
