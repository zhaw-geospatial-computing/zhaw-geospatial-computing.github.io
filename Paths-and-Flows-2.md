---
theme: default
title: Paths and Flows 2
favicon: /favicon.png
transition: none
layout: zhaw-cover
subtitle: BSc Environmental Engineering · Applied Geoinformatics
authors: Nils Ratnaweera
email: rata@zhaw.ch
heading: Paths and Flows 2
sections:
  - Applications of Shortest Path
  - Algorithms in GIS
  - Algorithmic Geometry
  - Dijkstra's Shortest Path
  - Group Work
  - R Exercises

---

<!-- title slide: content is defined in frontmatter -->

<!--
- Second lecture on network analysis. 
- Last time: centrality measures — shortest path was used there but not explicitly calculated. 
- Today: shortest path as a concrete problem + algorithms as the overarching theme.
- **Structure**: Screencasts beforehand (Flipped Classroom), then group work on Dijkstra (Zurich tram network), then R exercises (shortest paths in Wädenswil).
-->

---
layout: lernziele
---

# Learning Objectives

- You can explain 2–3 simple classical **algorithms** in geodata processing using simple sketches to a non-expert.
- You understand how Dijkstra's **shortest path** algorithm works as an exemplary geodata processing routine on network data.
- You recognise the value and significance of algorithms in geodata processing and gain a basic understanding of **algorithm evaluation** using the big-O notation of computational complexity.
- You can independently perform simple **network analyses** (route finding, routing) in **R** using the available tools for network geodata processing.

<!--
- Go through briefly, don't elaborate — serves as an orientation framework.
- The fourth objective (R) relates to the exercise part.
- Note: the transcript spells Dijkstra phonetically wrong ('Jaikstra', 'Jigstra' etc.).
-->

---

# Today's Schedule

| Time            | What                                                               | Format                        |
|-----------------|--------------------------------------------------------------------|-------------------------------|
| 13:00 – 13:45   | Theory: Algorithms & Dijkstra's shortest path                      | Lecture                       |
| 14:00 – 15:00   | Group work: calculate Dijkstra yourselves                          | Group work in groups of 3–4   |
| 15:10 – 16:35   | R exercise: calculate shortest paths with R for Wädenswil          | Exercises, supervised individual work |

<!--
- Structure similar to last time: screencasts to watch beforehand.
- Group work: step through Dijkstra manually — slightly more complex than last time, using the Zurich tram network (Berninaplatz → Staufacher).
- R exercise: shortest paths on OSM street data in Wädenswil.
- Zoom links as usual on Moodle.
-->

---

<Inhalt :active="1" />

<!--
Three parts:
1. Applications — tangible examples
2. Algorithms in GIS — what are they? Big-O notation, classic examples including Douglas-Peucker
3. Dijkstra's shortest path
-->

---

# Applications: Vehicle Routing

- Vehicle Routing
  - e.g. Uber
  - e.g. Dispatching emergency services


<img src="/AGI_HS25_Netzwerk1/google-maps.png" class="h-80 object-contain" />

<!--
- Relatable example: Lime scooters / e-scooters — many students will have used them.
- The app calculates the nearest available vehicle via a street network.
- Same principle for Uber dispatching and emergency services.
- Connection to last session: calculating centrality measures also implicitly used shortest paths.
-->

---
layout: two-cols-header
---

# Applications: Catchment Areas

- Catchment areas (e.g. *Show all results within 10 km*)

::left::

<img src="/sharely.png" class="h-full object-contain" />



::right::

<img src="/sharely-2.png" class="h-full object-contain" />




<SlideFooter>Sources: sharely.ch, google.com</SlideFooter>


<!--
- Some poorly implemented search algorithms search in euclidean, not network space.
- These are the downsides of living next to a lake
-->

---
layout: two-cols-header
---

# Multiple Stops (Travelling Salesperson Problem)

Choose the order for visiting multiple nodes such that:


1. every node is visited once
1. the total travel distance/time is minimised
1. the first stop equals the last stop.

---

<img src="/book-crawls.jpeg" class="h-full object-contain" />

<!--
- TSP: also known (less politically correctly) as the Travelling Salesman Problem.
- Must visit n points as efficiently as possible.
- Example from an interactive web app: sightseeing tour of San Francisco — manual ordering gives 26.3 miles, the computed optimal route is shorter.
- Computationally very expensive: many shortest-path calculations, each traversing many edges → exponential in the number of stops.
-->

---

# Applications of Shortest Path – Overview

- **Shortest Path** — route finding, multi-modal travel (Google Maps), scenic vs. fast
- **Nearest Facility** — location-based services, Lime scooters, emergency dispatch
- **Fleet Optimisation** — DHL van scheduling, waste collection, field campaigns
- **Catchment Areas** — geomarketing, travel-time service areas

<!--
- **Shortest path / travel modes**: Google Maps has icons for car, train, walking, bike, plane — completely different transport networks behind each (edges = flight corridors vs. cycle paths).
- **Nearest facility**: Where is my nearest McDonald's, nearest petrol station? → shortest path to all candidates.
- **Fleet optimisation**: DHL loads the van in the morning and optimises the order of stops.
-->

---

<Inhalt :active="2" />

<!--
- Transition to the algorithms section.
- We now leave the applications and look at what algorithms actually are and how they are evaluated.
-->

---
layout: two-cols-header
---

# What is an Algorithm?

- An algorithm is the specification of the **data processing procedure** required for a particular operation
- An algorithm is a **procedure** for solving a problem that lends itself to **implementation** as a computer program
- Algorithms often also determine how the data involved in processing must be organised, i.e. which **data structures** they must be stored in
- e.g. sorting a list



<SlideFooter>Sources: Worboys & Duckham (2004). GIS: a computing perspective. Sedgewick (2003). Algorithms in Java. </SlideFooter>

<!--
- Key distinction: the algorithm is not the computer program itself, but the **procedure** — the sequence of steps.
- Often has implications for data structures: the data must be organised so the algorithm can traverse it efficiently.
- Illustrating example: sorting a list (C, A, G, B, D, H, E, F).
- A short video follows showing two different sorting algorithms.
-->

---
layout: image
image: /quittungen.png
---





<!-- 
- A friend had a huge pile of receipts that needed to be sorted
- She asked my then 12 and 14 year old daugthers to sort them by date
- How would you have done it?
- We first sorted them by year, then by month, then within the month. But this meant, that we looked at each reciept at least three times.
- Are there better ways?
- Lets use a list of books that need to be sorted alphabetically
 -->

---


## Sorting receipts

How would you explain to a child is the best way to sort a big pile of receipts?

<CountdownTimer :minutes="1" />


---

## Bubblesort Algorithm

1. Compare the first two books. Swap them if they are not sorted
2. Apply step 1 to every following pair of books
3. Repeat step 1 & 2 until all books are sorted


<BubbleSort />


---

## Bubblesort Algorithm

R implementation

```r 
bubble_sort <- function(x) {
  n <- length(x)
  for (i in 1:(n - 1)) {
    for (j in 1:(n - i)) {
      if (x[j] > x[j + 1]) {
        x[c(j, j + 1)] <- x[c(j + 1, j)]
      }
    }
  }
  x
}

bubble_sort(c("C", "A", "G", "B", "D", "H", "E", "F"))
# [1] "A" "B" "C" "D" "E" "F" "G" "H"
```


---
layout: two-cols-header
---

## Mergesort Algorithm



1. Split the list of books into two (roughly equal) halves
2. If a list has 1 element, its sorted. Otherwise, return to step 1
3. *Merge* two sorted lists at a time


<MergeSort />

---

## Mergesort Algorithm

```r 
merge_sorted <- function(a, b) {
  out <- c()
  i <- 1; j <- 1
  while (i <= length(a) && j <= length(b)) {
    if (a[i] <= b[j]) { out <- c(out, a[i]); i <- i + 1 }
    else               { out <- c(out, b[j]); j <- j + 1 }
  }
  c(out,
    if (i <= length(a)) a[i:length(a)] else NULL,
    if (j <= length(b)) b[j:length(b)] else NULL)
}

merge_sort <- function(x) {
  if (length(x) <= 1) return(x)
  mid <- length(x) %/% 2
  merge_sorted(
    merge_sort(x[1:mid]),
    merge_sort(x[(mid + 1):length(x)])
  )
}

merge_sort(c("C", "A", "G", "B", "D", "H", "E", "F"))
# [1] "A" "B" "C" "D" "E" "F" "G" "H"
```

---

## Bubble-Sort vs. Merge-Sort

Let's compare the speed to sort our list of 8 books (A – H):

<v-clicks depth="2">

- **Bubble-Sort**:
  - Worst case: each book is compared to every other (except itself)
  - 8 books: $\frac{8 \times 7}{2} = 28$ comparisons
- **Merge-Sort**:
  - Number of times we can split a list of 8 books in half: $\log_2(8) = 3$
  - Max. number of comparisons we make at each stage: 8
  - Comparisons in total: $\log_2(8) \times 8 = 24$

→ Only a small difference for 8 books, but the difference is greater with more elements

</v-clicks>




---
layout: two-cols-header
---


# Algorithmic Complexity ("big O")

::left::

- Big-O notation $O(f(n))$: relationship between input size and computation time
- The **worst-case** behaviour is normally given.
- **Bubble-Sort**: $\frac{n(n-1)}{2} \approx \frac{n^2}{2} \sim O(n^2)$
- **Merge-Sort**: $n \times \log_2(n) \sim O(n \log_2 n)$ 
- $O(n^2)$ is barely usable in practice; reducing to $O(n \log n)$ is considered a success.

::right::

<img src="/complexity-graph.png" class="h-64 object-contain" />




---

| Notation | Class | Example |
|---|---|---|
| $O(1)$ | Constant | — |
| $O(\log n)$ | Logarithmic | Binary search |
| $O(n)$ | Linear | Linear search |
| $O(n \log n)$ | Sub-linear | Merge sort |
| $O(n^k)$ | Polynomial | Shortest path |
| $O(k^n)$ | Exponential | TSP |



---
layout: two-cols-header
---

## e.g. Visibility Along a Road

- Compute a line of sight between all pairs of points
- Too computationally expensive at $O(n^2)$?

::left::

<img src="/AGI_HS25_Netzwerk2/_page_16_Picture_7.jpeg" class="h-48 object-contain mt-4" />

::right::

<img src="/astra.jpeg" class="h-80 object-contain" />

<!--
- Concrete project example (Federal Roads Office ASTRA): wildlife-vehicle collisions.
- Approach: place many points along the road section, compute a line of sight from every point to every other point.
  - Orange = not visible (forest in the way)
  - Green = visible (clearing)
- Problem: connecting every point with every other = O(n²) → so slow it could not be used in practice.
- Had to find a different approach.
-->

---
layout: two-cols-header
---

## Minimal Bounding Rectangle

Design an algorithm to determine the smallest bounding rectangle (**minimal bounding rectangle, MBR**) for a polygon given as a list of all its vertices. 

<CountdownTimer :minutes="3" />

::left::

Coordinate example:

1. Point: 2'529'500, 1'204'150
1. Point: 2'512'000, 1'175'150
1. Point: 2'496'500, 1'153'150
1. Point: 2'484'500, 1'110'650





::right::


<img src="/AGI_HS25_Netzwerk2/_page_17_Figure_8.jpeg" class="h-44 object-contain mt-2" />

<!--
- **Thinking pause ~2 minutes** — students should work out an algorithm themselves.
- Given: polygon vertices as a list of x/y coordinates.
- Hint: think in data structures — what do you actually need to define the bounding box?
- Answer on the last slide of the deck.
-->

---
layout: two-cols-header
hide: true
---

## Minimal Bounding Rectangle

Always store the four values for:

::left::

- lowest x value
- lowest y value
- highest x value
- highest y value

::right::

<img src="/mbr.jpeg" class="h-56 object-contain mt-4" />

<!--
Solution to the MBR thinking pause from earlier. Think in data structures: vertices as two lists (x-coordinates, y-coordinates). You only need two points: lower-left and upper-right.\n\nAlgorithm: create four variables (min_x, min_y, max_x, max_y). Loop through all vertices. If the current value is smaller than min → overwrite; if larger than max → overwrite. After the loop: the bounding box is defined. O(n) — very fast.
-->

---


# Summary

- The shortest path is the foundation for many **mobility applications**: route finding, LBS, travel times, service areas.
- **Algorithms** are procedures for problem-solving that work closely with **data structures**.
- Big-O notation describes the relationship between input size and computation time.

::right::

---

<Inhalt :active="3" />

---

# Algorithmic Geometry

A branch of (geo-)informatics that studies algorithmic solutions to geometric problems.

- Does an algorithm even exist that can solve a given problem?
- What is the **most efficient** algorithm?
  - in terms of computation time?
  - in terms of memory?
- How should the data be best structured (**data structure**)?
- E.g: Does a point lie *with* a polygon or *outside*?

<img src="/AGI_HS25_Netzwerk2/_page_19_Picture_11.jpeg" class="h-48 object-contain" />

<!--
- Algorithmic geometry = sub-discipline of (geo-)informatics.
- Three guiding questions:
  1. Does an algorithmic solution even exist? For some problems there is none.
  2. What is the most efficient algorithm — in terms of time or memory?
  3. How best to structure the data?
- Entry example: the Point-in-Polygon test.
-->

---
layout: two-cols-header
---

## Point-in-Polygon Test


- **Ray casting algorithm.** Count how often a ray from the point intersects the polygon.
  - Even number of intersections → outside
  - Odd number of intersections → inside

→ *O(n)*, where *n* = number of edges

<!-- <img src="/AGI_HS25_Netzwerk2/_page_20_Figure_12.jpeg" class="h-48 object-contain" /> -->

<div class="relative w-48 h-48">
  <img src="/point-in-polygon-ray-1.png" class="absolute inset-0 h-48 object-contain" v-click-hide="1" />
  <img src="/point-in-polygon-ray-2.png" class="absolute inset-0 h-48 object-contain" v-click="[1,2]" />
  <img src="/point-in-polygon-ray-3.png" class="absolute inset-0 h-48 object-contain" v-click="[2,3]" />
  <img src="/point-in-polygon-ray-4.png" class="absolute inset-0 h-48 object-contain" v-click="[3,4]" />
  <img src="/point-in-polygon-ray-5.png" class="absolute inset-0 h-48 object-contain" v-click="4" />
</div>

---

## Point-in-Polygon Test

- **Winding number algorithm.** An observer walks counterclockwise around the polygon. After one full circuit:
  - completed a full rotation → P inside
  - otherwise → P outside

→ *O(n)*, where *n* = number of edges



<img src="/AGI_HS25_Netzwerk2/_page_20_Figure_13.jpeg" class="h-48 object-contain mt-2" />

<!--
- Classic GIS operation: every spatial query involving polygon containment requires a point-in-polygon test (e.g. "give me all bars within the municipality of Wädenswil").

**Ray casting algorithm:**
- Draw a ray from the point in any direction.
- Count intersections with the polygon: odd = inside, even = outside. Clever and elegant!

**Winding number algorithm:**
- Observer walks counterclockwise around the polygon, always looking at the point.
- Full 360° rotation = inside; no complete rotation = outside.

- Both are O(n), where n = number of edges → fast.
-->

---
layout: two-cols-header
clicks: 4
---

# Line Simplification: Douglas-Peucker

Simplify the line while preserving its essential form (e.g. cartographic generalisation)

::left::

1. Connect start–end
2. Find the most distant vertex, split there
3. Repeat **recursively** for all parts, until *dist* is below threshold

**Recursive** code calls itself until a stopping condition is met.

::right::

<img v-if="$clicks < 1"   src="/douglas-peucker-1.png" class="h-44 object-contain" />
<img v-else-if="$clicks < 2" src="/douglas-peucker-2.png" class="h-44 object-contain" />
<img v-else-if="$clicks < 3" src="/douglas-peucker-3.png" class="h-44 object-contain" />
<img v-else-if="$clicks < 4" src="/douglas-peucker-4.png" class="h-44 object-contain" />
<img v-else                  src="/douglas-peucker-5.png" class="h-44 object-contain" />

<!--
- Classic GIS algorithm — the second classic alongside Dijkstra.
- Application: cartographic generalisation, e.g. simplifying a road line from 1:25,000 → 1:50,000.

**Algorithm steps:**
1. Connect start and end.
2. Find the most distant vertex from this connecting line.
3. Split there, introduce new sub-lines.
4. Repeat for all sub-parts until the distance is below the threshold.

- **Recursion** = code calls itself in a "reduced form" until a stopping condition is met.
- Merge Sort was also recursive. It can make your head spin, but it is a powerful concept.
-->

---
layout: two-cols-header
layoutClass: 'cols-40-60'
hide: true
---

# Data Structures for Network Data


::left::

- Structure 1: Labelled Edges: `{(ab, 20), (ag15), (bc,8)...}`
- Structure 2: Adjacency Matrix (highly redundant and sparse)

<img src="/matrix-1.png" class="h-32 object-contain" />

- Structure 3: Adjacency List Compromise: only edges with value ≠ 0

<img src="/adjecency-list.png" class="h-32 object-contain" />

::right::

<img src="/AGI_HS25_Netzwerk2/_page_22_Figure_9.jpeg" class="h-96 object-contain" />

<!--
Algorithms work closely with data structures. Three options for network data:\n\n1. **Labelled Edges**: Simple list — each edge with costs (AB=20, AG=15, BC=8). Very simple.\n2. **Adjacency Matrix**: Sparsely populated (many zeros), since there is no connection between a and e → 0. Shows all possible connections + costs. Much redundancy.\n3. **Adjacency List** (compromise): For each node: list of neighbours + distances. Node A has neighbours B (20) and G (15). Particularly well suited for algorithmic traversal → used for Dijkstra.\n\nStudents do not need to derive this themselves — it illustrates the link between algorithm ↔ data structure.
-->

---
layout: two-cols-header
hide: true
---
# Systematic Traversal: Breadth-first vs. Depth-first


::left::

**Queue (Breadth-first)**
- FIFO: First in, first out
- The element inserted first is also the first to come out

::right::

<img src="/AGI_HS25_Netzwerk2/_page_22_Figure_9.jpeg" class="h-96 object-contain" />


<img src="/AGI_HS25_Netzwerk2/_page_23_Figure_6.jpeg" class="h-40 object-contain" />

---
hide: true
---

**Stack (Depth-first)**
- LIFO: Last in, first out
- Elements can only be removed (pop) or added (push) from the top

---
hide: true
---

<img src="/AGI_HS25_Netzwerk2/_page_23_Figure_8.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_23_Picture_23.jpeg" class="h-24 object-contain mt-2" />

<img src="/AGI_HS25_Netzwerk2/_page_23_Picture_26.jpeg" class="h-24 object-contain mt-2" />

<!--
Two strategies for traversing a network completely. Starting at B:\n\n**BFS / Queue (FIFO)**: First all direct neighbours of B (breadth), then their neighbours, etc. Analogy: post office queue — join at the back, leave from the front. Added at the back, removed from the front.\n\n**DFS / Stack (LIFO)**: Go as deep as possible (B→A→G→E→F→C…), only backtrack at a dead end. Analogy: stack of plates in the canteen — always added and removed from the top. Last in, first out.\n\nDifferent algorithms use different traversal strategies.
-->

---
hide: true
---

# Systematic Traversal: Animated

<div class="grid grid-cols-2 gap-4">
<div>

<img src="/AGI_HS25_Netzwerk2/_page_24_Picture_5.jpeg" class="h-48 object-contain" />

**Queue (BFS)** — FIFO: First in, first out

</div>
<div>

<img src="/AGI_HS25_Netzwerk2/_page_24_Picture_6.jpeg" class="h-48 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_24_Picture_7.jpeg" class="h-24 object-contain" />

</div>
</div>

<!--
Animations show BFS and DFS in action. Queue: add at the back, remove from the front (FIFO). Stack: add at the top and remove from the top (LIFO). Brief comment, then move on to Dijkstra — that is the actual reason we looked at all of this.
-->

---

<Inhalt :active="4" />

<!--
- Transition to Dijkstra.
- All the preparation (algorithms, data structures, BFS) now comes together here.
- "You should now be ready to take on Dijkstra."
-->

---

# Dijkstra's Shortest Path

- **Core idea** — maintain a *tentative distance* $t(x)$ for every node:
  1. Start: $t(\text{start}) = 0$, all others $= \infty$
  2. Pick the unvisited node with the **smallest** $t(x)$ → visit it
  3. For each unvisited neighbour $y$: if $t(x) + w(x,y) < t(y)$, update $t(y)$
  4. Repeat until all nodes are visited
- **Note**: step 2 picks the globally smallest $t(x)$, not the nearest by number of hops. A direct neighbour with a high edge weight may be visited *after* a two-hop node reached cheaply.
- Complexity: $O(n^2)$
- **A\*** adds a heuristic (estimated remaining distance) → visits promising nodes first → faster in practice

<!--
- Everyday example: how do I get from Wädenswil station to the Grüntal campus by bike? Two alternatives — which is shorter? → Dijkstra calculates this.
- The graph shown: 8 nodes a–h, starting at b. Edge weights are travel costs.
- The algorithm is worked through step by step on the next slide.
- Key guarantee: because all weights are ≥ 0, visiting the smallest known distance first is always safe — no future discovery can produce a shorter path to an already-visited node.
-->

---

# Dijkstra's Shortest Path (Step by Step)

<div class="relative h-96">
  <img src="/dijkstra-1.png" class="absolute inset-0 h-96 object-contain" v-click-hide="1" />
  <img src="/dijkstra-2.png" class="absolute inset-0 h-96 object-contain" v-click="[1,2]" />
  <img src="/dijkstra-3.png" class="absolute inset-0 h-96 object-contain" v-click="[2,3]" />
  <img src="/dijkstra-4.png" class="absolute inset-0 h-96 object-contain" v-click="[3,4]" />
  <img src="/dijkstra-5.png" class="absolute inset-0 h-96 object-contain" v-click="[4,5]" />
  <img src="/dijkstra-6.png" class="absolute inset-0 h-96 object-contain" v-click="5" />
</div>

<div class="flex gap-6 text-xs mt-1 justify-center text-slate-500">
  <span><span class="inline-block w-3 h-3 rounded-full bg-slate-200 border border-slate-300 mr-1"></span>unknown</span>
  <span><span class="inline-block w-3 h-3 rounded-full bg-blue-300 mr-1"></span>queued</span>
  <span><span class="inline-block w-3 h-3 rounded-full bg-blue-600 mr-1"></span>just updated</span>
  <span><span class="inline-block w-3 h-3 rounded-full bg-orange-500 mr-1"></span>current</span>
  <span><span class="inline-block w-3 h-3 rounded-full bg-green-600 mr-1"></span>visited (finalised)</span>
</div>

<!--
- Step-by-step illustration of Dijkstra on the Worboys & Duckham example graph (8 nodes, start b).
- Key moment: step 4 — visiting d (t=9) reveals that b→d→e = 16, which beats the previously known b→c→e = 23.
- The algorithm always visits the globally smallest unvisited distance next, which guarantees correctness.
- For deeper understanding: Worboys & Duckham, Ch. 5.
-->

---
hide: true
---

# Try One of the Many Web Applications

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk2/_page_29_Figure_5.jpeg" class="h-72 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_29_Figure_6.jpeg" class="h-72 object-contain" />
</div>

<!--
Recommendation: try out 1–2 of these interactive animations before the exercise. You can enter a new graph and step through the algorithm. Significantly aids understanding — the animations are well made. Links on the reading slide.
-->

---

# Summary


- **Algorithmic geometry** is the branch of (geo-)informatics that deals with solving geometric problems for geodata processing: point-in-polygon, line simplification, shortest path.
- **Dijkstra's** algorithm for calculating the shortest path is a fine example. Almost all functions in a GIS use comparable algorithms.

<!--
- Summary: almost all GIS functions use comparable algorithms — if you look deep into the documentation, you usually find references to the papers in which they are documented.
- **Next**: Transition to the practical part.
-->

---

# Reading Material & Literature

- Lecture content is based primarily on Worboys, M. F., & Duckham, M. (2004). *GIS: a computing perspective*. CRC press, Chapter 5.
- Or in the new edition (2023) Ch. 5.5, pp. 206ff.
- GITTA lesson on Accessibility (e-learning): http://www.gitta.info/Accessibiliti/en/html/index.html
- Interactive apps for shortest path:
  - https://www.cs.usfca.edu/~galles/visualization/Dijkstra.html
  - https://algorithms.discrete.ma.tum.de/graph-algorithms/spp-dijkstra/index_en.html

<!--
- Required reading: Worboys & Duckham Ch. 5.
- GITTA lesson on Accessibility as supplementary e-learning.
- The two interactive Dijkstra apps are recommended before the exercise — students can enter a graph and observe the algorithm animated.
-->

---

<Inhalt :active="5" />

---

## Group Work

- Calculate Dijkstra yourselves for a query on the VBZ tram network.
- Use the worksheet on moodle for this

<!--
- Group work: calculate Dijkstra manually on the Zurich VBZ tram network (Berninaplatz → Staufacher).
- R exercise: calculate shortest paths, e.g. from the Grüntal campus down to the peninsula.
-->

---

<Inhalt :active="6" />

---

# R Exercises – Working Data

The exercises use the same GeoPackage as Part 1 and a new file you create in QGIS.

| File | Layer | Content |
|------|-------|---------|
| `netzwerkanalyse.gpkg` | `osm_highway_prepared` | Street network, LV95 |
| `netzwerkanalyse.gpkg` | `Gemeinde_Waedenswil` | Municipality boundary |
| `routing_locations.gpkg` | — | 6 named locations (created in QGIS) |

<!--
- Students work in R/RStudio.
- The `routing_locations.gpkg` is created by students in Task 2 using QGIS.
- A pre-made version is available on Moodle as a backup.
-->

---
layout: two-cols-header
---

# Task 1: Network setup (recap)

Same as Part 1 — build an undirected `sfnetwork` and add edge lengths.

::left::

```r
library(sf); library(sfnetworks)
library(tidygraph); library(dplyr)

streets      <- read_sf("netzwerkanalyse.gpkg",
                        layer = "osm_highway_prepared")
municipality <- read_sf("netzwerkanalyse.gpkg",
                        layer = "Gemeinde_Waedenswil")

net <- as_sfnetwork(streets, directed = FALSE) |>
  activate("edges") |>
  mutate(length = edge_length())

nodes <- st_as_sf(net, "nodes")
edges <- st_as_sf(net, "edges")
```

::right::

<img src="/netzwerkanalyse-r/strassennetz.png" class="h-full object-contain" />

<!--
- Quick recap — students who still have their Part 1 script can copy it directly.
- Key addition over Part 1 Task 1: the `edge_length()` call, which we now need for weighted shortest paths.
-->

---

# Task 2: Create locations in QGIS

1. Open `netzwerkanalyse.gpkg` in QGIS as background.
2. *Layer → Create Layer → New Scratch Layer*
   - Geometry: **Point** · CRS: **EPSG:2056** · field **`name`** (text)
3. Digitise six locations and give each a name:
   - Bahnhof Wädenswil, ZHAW Grüntal, Strandbad
   - Campus Reidbach, Hallenbad, Migros
4. *Export → Save Features As* → GeoPackage → **`routing_locations.gpkg`**

<!--
- Students digitise their own points — reinforces that coordinates come from GIS tools, not just typed into R.
- Emphasise: CRS must be LV95 / EPSG:2056 to match the street network.
- If QGIS causes issues, a pre-made file is available on Moodle.
-->

---
layout: two-cols-header
---

# Task 2: Load locations in R

Load the GeoPackage and snap each location to the nearest network node.

::left::

```r
locations <- read_sf("routing_locations.gpkg")

# snap all locations to network nodes
loc_idx  <- st_nearest_feature(locations, nodes)
snap_pts <- nodes[loc_idx, ] |>
  mutate(name = locations$name)

# origin / destination for Tasks 3–5
from_idx <- loc_idx[locations$name == "Bahnhof"]
to_idx   <- loc_idx[locations$name == "ZHAW Grüntal"]
```

Visualise `snap_pts` on the network. Do all nodes look right?

::right::

<img src="/netzwerkanalyse-r/routing_snap.png" class="h-full object-contain" />

<!--
- `st_nearest_feature()` returns the row index in the second argument closest to each feature in the first.
- Students should verify visually that snap points are in sensible locations — ZHAW Grüntal is up the hill, Strandbad is near the lake.
- A missnapped point usually means the GeoPackage CRS is wrong.
-->

---
layout: two-cols-header
---

# Task 3: Find the shortest path

Find the shortest network route from the Bahnhof to ZHAW Grüntal. Visualise it.


```r
library(ggplot2)

path_result   <- st_network_paths(net,
  from = from_idx, to = to_idx,
  weights = "length")

path_edge_idx <- path_result |>
  pull(edge_paths) |> unlist()

path_edges <- net |>
  activate("edges") |>
  slice(path_edge_idx) |>
  st_as_sf()

# visualise path_edges on a ggplot map
```

---

<img src="/netzwerkanalyse-r/shortest_path.png" class="h-full object-contain" />

<!--
- `st_network_paths()` returns a tibble — `edge_paths` is a list-column of edge index vectors.
- `slice()` extracts those edges as sf.
- Students produce the ggplot map themselves.
- The route should climb from the lakeside station up to Grüntal — a good sanity check.
-->

---

# Task 4: Inspect the route

```r
# Total length in metres
cat("Route length:", round(sum(as.numeric(path_edges$length))), "m\n")

# Number of street segments
cat("Segments:", nrow(path_edges), "\n")
```

- How long is the route in metres?
- How many individual street segments does it traverse?
- Change the destination to a point on the far east of the municipality. Does the result look plausible?

<!--
- Good discussion: does the computed route match what a cyclist or pedestrian would choose?
- The network only uses roads — no shortcuts across fields or down steep paths.
- Changing the destination tests whether students can adapt the code independently.
-->

---
layout: two-cols-header
---

# Task 5: Catchment area

From the Bahnhof, which parts of Wädenswil can be reached within 500 m / 1 000 m / 2 000 m?


```r
costs <- st_network_cost(net,
  from = from_idx, weights = "length")

# costs is a 1 × N matrix
nodes_iso <- nodes |>
  mutate(
    dist_m = as.numeric(costs[1, ]),
    zone   = case_when(
      dist_m <=  500 ~ "≤ 500 m",
      dist_m <= 1000 ~ "≤ 1 000 m",
      dist_m <= 2000 ~ "≤ 2 000 m",
      TRUE           ~ "> 2 000 m"
    )
  )
# → visualise nodes_iso, colour by zone
```

---

<img src="/netzwerkanalyse-r/catchment.png" class="h-full object-contain" />

<!--
- `st_network_cost()` with a single `from` returns a 1×N distance matrix.
- Colouring nodes by zone gives an isochrone-like service area.
- Discussion: how does the shape compare to a circle? The lake and terrain constrain it strongly.
- Connect to the Sharely example from the lecture.
-->

---
layout: two-cols-header
---

# Task 6: Distance matrix

Compute the pairwise network distance between all six locations.


```r
cost_mat <- st_network_cost(net,
  from    = loc_idx,
  to      = loc_idx,
  weights = "length")

rownames(cost_mat) <- locations$name
colnames(cost_mat) <- locations$name

round(cost_mat)
```

- Which two locations are farthest apart by network distance?
- How does network distance compare to straight-line distance for each pair?

---

<img src="/netzwerkanalyse-r/cost_matrix.png" class="h-full object-contain" />

<!--
- Passing vectors to both `from` and `to` gives a full n×n matrix.
- The diagonal is 0. With an undirected network the matrix is symmetric.
- Good discussion: which pairs diverge most between Euclidean and network distance? Likely the lake-facing pairs.
-->

---
layout: two-cols-header
---

# Task 7: Travelling Salesperson

Visit all six locations exactly once and return to the Bahnhof. Find the optimal order.


```r
library(TSP)

tour <- solve_TSP(TSP(
  units::drop_units(cost_mat)))

cat(paste(
  rownames(cost_mat)[as.integer(tour)],
  collapse = " → "), "\n")
cat("Total:", round(tour_length(tour)), "m\n")
```

Trace the tour back to the actual network using `st_network_paths()` for each leg.

- Why is exact TSP feasible for 6 stops but not for 20?


---

<img src="/netzwerkanalyse-r/tsp_tour.png" class="h-full object-contain" />

<!--
- `TSP::solve_TSP()` wraps multiple solvers; for n=6 it is instantaneous.
- `units::drop_units()` strips the units attribute that `edge_length()` attaches.
- Key teaching point: this is O(k^n) — 6 stops is trivial, 20 stops has ~10^17 orderings.
- Connect to the complexity table from the lecture.
- The route visualisation uses `mapply(st_network_paths, ...)` to draw actual network paths per leg, not straight lines.
-->
