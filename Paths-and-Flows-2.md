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
  - Dijkstra's Shortest Path
---

<!-- title slide: content is defined in frontmatter -->

<!--
Second lecture on network analysis. Last time: centrality measures — shortest path was used there but not explicitly calculated. Today: shortest path as a concrete problem + algorithms as the overarching theme.\n\n**Structure**: Screencasts beforehand (Flipped Classroom), then group work on Dijkstra (Zurich tram network), then QGIS exercises (shortest paths in Wädenswil).
-->

---
layout: lernziele
---

# Learning Objectives

- You can explain 2–3 simple classical **algorithms** in geodata processing using simple sketches to a non-expert.
- You understand how Dijkstra's **shortest path** algorithm works as an exemplary geodata processing routine on network data.
- You recognise the value and significance of algorithms in geodata processing and gain a basic understanding of **algorithm evaluation** using the big-O notation of computational complexity.
- You can independently perform simple **network analyses** (route finding, routing) in **QGIS** using the available tools for network geodata processing.

<!--
Go through briefly, don't elaborate — serves as an orientation framework. The fourth objective (QGIS) relates to the exercise part. Dijkstra — the transcript spells it phonetically wrong ('Jaikstra', 'Jigstra' etc.).
-->

---

# Today's Schedule

| Time            | What                                                               | Format                        |
|-----------------|--------------------------------------------------------------------|-------------------------------|
| 13:00 – 13:45   | Theory recap: algorithms & Dijkstra's shortest path                | Lecture, assessment information |
| 14:00 – 15:00   | Group work: calculate Dijkstra yourselves                          | Group work in groups of 3–4   |
| 15:10 – 16:35   | QGIS exercise: calculate shortest paths with QGIS for Wädenswil   | Exercises, supervised individual work |

<!--
Structure similar to last time. Screencasts to watch beforehand, then group work: step through Dijkstra manually — slightly more complex than last time, using the Zurich tram network as a concrete example (Berninaplatz → Staufacher). Then QGIS exercise: shortest paths on OSM street data in Wädenswil. Zoom links as usual on Moodle.
-->

---

<Inhalt :active="1" />

<!--
Three parts: applications first (tangible examples), then algorithms in GIS (what are they? Big-O notation, classic examples including Douglas-Peucker), then Dijkstra's shortest path.
-->

---
layout: two-cols
---

# Applications: Vehicle Routing

- Vehicle Routing
  - e.g. Uber
  - e.g. Dispatching emergency services

::right::

<img src="/AGI_HS25_Netzwerk2/_page_5_Picture_6.jpeg" class="h-40 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_5_Figure_10.jpeg" class="h-40 object-contain mt-2" />

<!--
Relatable example: Lime scooters / e-scooters — many students will have used them. The app calculates the nearest available vehicle via a street network. Same principle for Uber dispatching and emergency services. Connection to last session: calculating centrality measures also implicitly used shortest paths.
-->

---
layout: two-cols
---

# Applications: Catchment Areas

- Catchment areas and nearest facility
  - Centrality measures ("Group exercise 1")
  - Travel times (Network Analysis III)
  - Geomarketing and real estate valuation

::right::

<img src="/AGI_HS25_Netzwerk2/_page_6_Figure_10.jpeg" class="h-36 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_6_Figure_12.jpeg" class="h-36 object-contain mt-2" />

<SlideFooter>Sources: walkalytics.com, esri.ch</SlideFooter>

<!--
Travel times: I'm at a location — how far can I get within 5 minutes via the road network? → needs shortest paths. We'll look at this in detail next session. Geomarketing: how many residents can reach a new branch on foot within 5–10 minutes?
-->

---
layout: two-cols
---

# Multiple Stops (Travelling Salesperson Problem)

Choose the order for visiting multiple nodes such that:
- no node except the first is visited more than once,
- the total travel distance/time is minimised, and
- the first stop equals the last stop.

::right::

<img src="/AGI_HS25_Netzwerk2/_page_7_Figure_6.jpeg" class="h-64 object-contain" />

<!--
TSP: also known (less politically correctly) as the Travelling Salesman Problem. Must visit n points as efficiently as possible. Example from an interactive web app: sightseeing tour of San Francisco — manual ordering gives 26.3 miles, the computed optimal route is shorter. Computationally very expensive: many shortest-path calculations, each traversing many edges → exponential in the number of stops.
-->

---
layout: two-cols
---

# e.g. Research Project – Theo Smits Group, for FOAG

Optimising sampling locations for a 2-day field campaign

::right::

<img src="/AGI_HS25_Netzwerk2/_page_8_Figure_6.jpeg" class="h-72 object-contain" />

<!--
Concrete example from ZHAW colleague Theo Smits (research group): field campaign across Switzerland, 2 days, ~30 sampling sites — exactly the Travelling Salesperson Problem. They did it by hand and got through fine. With TSP optimisation they might have had half an hour more of breaks.
-->

---

# Applications of Shortest Path – Overview

<div class="grid grid-cols-2 gap-4">
<div>

**Shortest Path**
- Multiple stops (Travelling Salesperson Problem)
- For different travel modes (bike, car, pedestrian), scenic vs. fast

**Nearest Facility**
- Location-based services (LBS)
- Lime scooters

</div>
<div>

**Fleet Optimisation**
- Multi-vehicle routing
- Fleet optimisation (delivery services, waste collection)
- Minimise total distance across multiple vehicles

**Catchment Areas**
- Along the network
- Geomarketing

</div>
</div>

<div class="flex gap-2 mt-2">
<img src="/AGI_HS25_Netzwerk2/_page_9_Picture_8.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_9_Picture_19.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_9_Picture_20.jpeg" class="h-28 object-contain" />
</div>

<!--
Different travel modes: Google Maps has icons for car, train, walking, bike, plane — completely different transport networks behind each (edges = flight corridors vs. cycle paths). Nearest facility: Where is my nearest McDonald's, nearest petrol station? → shortest path to all candidates. Fleet optimisation: DHL loads the van in the morning and optimises the order of stops.
-->

---

<Inhalt :active="2" />

<!--
Transition to the algorithms section. We now leave the applications and look at what algorithms actually are and how they are evaluated.
-->

---
layout: two-cols
---

# What is an Algorithm?

- An algorithm is the specification of the **data processing procedure** required for a particular operation. ¹
- An algorithm is a **procedure** for solving a problem that lends itself to **implementation** as a computer program. ²
- Algorithms often also determine how the data involved in processing must be organised, i.e. which **data structures** they must be stored in. ²
- e.g. sorting a list

<small>¹ Worboys & Duckham (2004). GIS: a computing perspective.</small><br>
<small>² Sedgewick (2003). Algorithms in Java.</small>

::right::

<img src="/AGI_HS25_Netzwerk2/_page_12_Picture_9.jpeg" class="h-72 object-contain" />

<!--
Key distinction: the algorithm is not the computer program itself, but the **procedure** — the sequence of steps. Often has implications for data structures: the data must be organised so the algorithm can traverse it efficiently. Illustrating example: sorting a list (C, A, G, B, D, H, E, F). A short video follows showing two different sorting algorithms.
-->

---

# Bubble-Sort vs. Merge-Sort

<div class="grid grid-cols-3 gap-1">
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_6.jpeg" class="h-32 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_7.jpeg" class="h-32 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_8.jpeg" class="h-32 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_9.jpeg" class="h-32 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_10.jpeg" class="h-32 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_11.jpeg" class="h-32 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_12.jpeg" class="h-32 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_13.jpeg" class="h-32 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_13_Picture_14.jpeg" class="h-32 object-contain" />
</div>

<!--
Video plays here (~3 minutes). Two sorting algorithms are shown visually. No explanation needed — let the video run. Discussion on the next slide.
-->

---
layout: two-cols
---

# Bubble-Sort vs. Merge-Sort

<img src="/AGI_HS25_Netzwerk2/_page_14_Picture_5.jpeg" class="h-64 object-contain" />

::right::

<img src="/AGI_HS25_Netzwerk2/_page_14_Figure_6.jpeg" class="h-64 object-contain" />

$$O(n\log_2(n))$$

<!--
After the video. **Bubble Sort**: simple instruction (compare pairs, swap if wrong order), repeated many times. Code is simple but O(n²) → every element compared with every other. **Merge Sort**: split list down to atomic elements, sort them, merge back up. Code considerably more complex (more lines, more brainpower), but O(n log n) — significantly faster.\n\nO(n²) is barely usable in practice: as n grows, computation time grows quadratically → eventually uncomputable.
-->

---

# Algorithmic Complexity ("big O")

- Big-O notation $O(f(n))$: relationship between input size and computation time
- The **worst-case** behaviour is normally given.
- $O(n^2)$ is barely usable in practice; reducing to $O(n \log n)$ is considered a success.

<div class="grid grid-cols-2 gap-4 mt-2">
<div>

| n | $\log_e n$ | $\sqrt{n}$ | $n^2$ | $2^n$ |
|---|---|---|---|---|
| 1 | 0.0 | 1.0 | 0 | 2.0 |
| 25 | 3.1 | 5.0 | 625 | 3.3×10⁷ |
| 50 | 3.9 | 7.1 | 2500 | 1.1×10¹⁵ |
| 75 | 4.3 | 8.6 | 5625 | 3.8×10²² |
| 100 | 4.6 | 10.0 | 10000 | 1.3×10³⁰ |

</div>
<div>

| Notation | Class | Example |
|---|---|---|
| $O(1)$ | Constant | — |
| $O(\log n)$ | Logarithmic | Binary search |
| $O(n)$ | Linear | Linear search |
| $O(n \log n)$ | Sub-linear | Merge sort |
| $O(n^k)$ | Polynomial | Shortest path |
| $O(k^n)$ | Exponential | TSP |

</div>
</div>

<!--
O = "order" or magnitude. n = number of elements to examine (points, edges, polygons …). Normally worst-case scenario. The table shows concretely: at n=100, 2^n is already 1.3×10^30 → completely uncomputable.\n\nHow to derive Big-O? We don't need to know — that is the domain of theoretical computer science / computational geometry. We just need to understand what it means when an algorithm is O(n²) vs. O(n log n).
-->

---
layout: two-cols
---

# e.g. Visibility Along a Road

- Compute a line of sight between all pairs of points
- Too computationally expensive at $O(n^2)$?

<img src="/AGI_HS25_Netzwerk2/_page_16_Picture_7.jpeg" class="h-48 object-contain mt-4" />

::right::

<img src="/AGI_HS25_Netzwerk2/_page_16_Picture_9.jpeg" class="h-80 object-contain" />

<!--
Concrete project example (Federal Roads Office ASTRA): wildlife-vehicle collisions. Approach: place many points along the road section, compute a line of sight from every point to every other point. Orange = not visible (forest in the way), green lines = visible (clearing). Problem: connecting every point with every other = O(n²) → so slow it could not be used in practice. Had to find a different approach.
-->

---
layout: two-cols
---

# Minimal Bounding Rectangle

Design an algorithm to determine the smallest bounding rectangle (**minimal bounding rectangle, MBR**) for a polygon given as a list of all its vertices.

*Take your time …*

Coordinate example:
- 2'529'500.0, 1'204'150.0
- 2'512'000.0, 1'175'150.0
- 2'496'500.0, 1'153'150.0
- 2'484'500.0, 1'110'650.0
- …

::right::

<img src="/AGI_HS25_Netzwerk2/_page_17_Picture_5.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_17_Figure_8.jpeg" class="h-44 object-contain mt-2" />

<!--
**Thinking pause ~2 minutes.** Students should work out an algorithm themselves. Given: polygon vertices as a list of x/y coordinates. Hint: think in data structures — what do you actually need to define the bounding box? (Answer on the last slide of the deck.)
-->

---
layout: two-cols
---

# Summary (Part 1)

<img src="/AGI_HS25_Netzwerk2/_page_18_Picture_5.jpeg" class="h-32 object-contain mb-4" />

- The shortest path is the foundation for many **mobility applications**: route finding, LBS, travel times, service areas.
- **Algorithms** are procedures for problem-solving that work closely with **data structures**.
- Big-O notation describes the relationship between input size and computation time.

::right::

## Algorithmic Geometry

The branch of (geo-)informatics that studies algorithmic solutions to geometric problems.

- Does an algorithm even exist that can solve a given problem?
- What is the **most efficient** algorithm?
  - in terms of computation time?
  - in terms of memory?
- How should the data be best structured (**data structure**)?

<img src="/AGI_HS25_Netzwerk2/_page_19_Picture_11.jpeg" class="h-36 object-contain mt-2" />

<!--
**Left**: end of Screencast 1. Brief summary of the three key points.\n\n**Right**: start of Screencast 2. Algorithmic geometry = sub-discipline of (geo-)informatics. Three guiding questions: (1) Does an algorithmic solution even exist? For some problems there is none. (2) What is the most efficient algorithm — in terms of time or memory? (3) How best to structure the data? Entry example: the Point-in-Polygon test.
-->

---
layout: two-cols
---

# Muddiest Points: Point-in-Polygon Test

**Ray casting algorithm.** Count how often a ray from the point intersects the polygon.
- Even number of intersections → outside
- Odd number of intersections → inside

**Winding number algorithm.** An observer walks counterclockwise around the polygon. After one full circuit:
- completed a full rotation → P inside
- otherwise → P outside

Both *O(n)*, where *n* = number of edges

::right::

<img src="/AGI_HS25_Netzwerk2/_page_20_Figure_12.jpeg" class="h-48 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_20_Figure_13.jpeg" class="h-48 object-contain mt-2" />

<!--
Classic GIS operation: every spatial query involving polygon containment requires a point-in-polygon test (e.g. "give me all bars within the municipality of Wädenswil").\n\n**Ray casting algorithm**: draw a ray from the point in any direction. Count intersections with the polygon: odd = inside (example: 5 intersections = inside), even = outside (2 intersections = outside). Clever and elegant!\n\n**Winding number algorithm**: observer walks counterclockwise around the polygon, always looking at the point. Full 360° rotation = inside; no complete rotation = outside.\n\nBoth O(n), n = number of edges — fast algorithms.
-->

---
layout: two-cols
---

# Line Simplification: Douglas-Peucker

Simplify the line while preserving its essential form (e.g. cartographic generalisation)

1. Connect start–end
2. Find the most distant vertex, split there
3. Repeat **recursively** for all parts, until *dist* is below threshold

**Recursive** code calls itself, usually in a "reduced form", until a stopping condition is met.

::right::

<div class="grid grid-cols-2 gap-1">
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_6.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_11.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_12.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_13.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_14.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Figure_15.jpeg" class="h-28 object-contain" />
</div>

<!--
Classic GIS algorithm — the second classic alongside Dijkstra. Application: cartographic generalisation, e.g. simplifying a road line from 1:25,000 → 1:50,000.\n\nAlgorithm: (1) Connect start and end. (2) Find the most distant vertex from this connecting line. (3) Split there, introduce new sub-lines. (4) Repeat for all sub-parts until the distance is below the threshold.\n\n**Recursion** = code calls itself in a "reduced form" until a stopping condition is met. Merge Sort was also recursive. It can make your head spin, but it is a powerful concept.
-->

---
layout: two-cols
---

# 3 Data Structures for Network Data

**Data Structure 1: Labelled Edges**
A set of edges each with travel times

**Data Structure 2: Adjacency Matrix**
Much redundancy

| | a | b | c | d | e | f | g | h |
|---|---|---|---|---|---|---|---|---|
| a | 0 | 20 | 0 | 0 | 0 | 0 | 15 | 0 |
| b | 20 | 0 | 8 | 9 | 0 | 0 | 0 | 0 |
| c | 0 | 8 | 0 | | 15 | | 0 | 10 |
| d | 0 | 9 | 6 | 0 | 7 | 0 | 0 | 0 |
| e | 0 | 0 | 15 | 7 | | | 18 | 0 |
| g | 15 | 0 | 0 | 0 | 18 | 0 | 0 | 0 |

**Data Structure 3: Adjacency List**
Compromise: only edges with value ≠ 0

::right::

<img src="/AGI_HS25_Netzwerk2/_page_22_Figure_9.jpeg" class="h-96 object-contain" />

<!--
Algorithms work closely with data structures. Three options for network data:\n\n1. **Labelled Edges**: Simple list — each edge with costs (AB=20, AG=15, BC=8). Very simple.\n2. **Adjacency Matrix**: Sparsely populated (many zeros), since there is no connection between a and e → 0. Shows all possible connections + costs. Much redundancy.\n3. **Adjacency List** (compromise): For each node: list of neighbours + distances. Node A has neighbours B (20) and G (15). Particularly well suited for algorithmic traversal → used for Dijkstra.\n\nStudents do not need to derive this themselves — it illustrates the link between algorithm ↔ data structure.
-->

---
layout: two-cols
---

# Systematic Traversal: Breadth-first vs. Depth-first

<img src="/AGI_HS25_Netzwerk2/_page_23_Figure_6.jpeg" class="h-40 object-contain" />

**Queue (Breadth-first)**
- FIFO: First in, first out
- The element inserted first is also the first to come out

**Stack (Depth-first)**
- LIFO: Last in, first out
- Elements can only be removed (pop) or added (push) from the top

::right::

<img src="/AGI_HS25_Netzwerk2/_page_23_Figure_8.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_23_Picture_23.jpeg" class="h-24 object-contain mt-2" />

<img src="/AGI_HS25_Netzwerk2/_page_23_Picture_26.jpeg" class="h-24 object-contain mt-2" />

<!--
Two strategies for traversing a network completely. Starting at B:\n\n**BFS / Queue (FIFO)**: First all direct neighbours of B (breadth), then their neighbours, etc. Analogy: post office queue — join at the back, leave from the front. Added at the back, removed from the front.\n\n**DFS / Stack (LIFO)**: Go as deep as possible (B→A→G→E→F→C…), only backtrack at a dead end. Analogy: stack of plates in the canteen — always added and removed from the top. Last in, first out.\n\nDifferent algorithms use different traversal strategies.
-->

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

<Inhalt :active="3" />

<!--
Transition to Dijkstra. All the preparation (algorithms, data structures, BFS) now comes together here. "You should now be ready to take on Dijkstra."
-->

---
layout: two-cols
---

# Dijkstra's Shortest Path

- **1. Iteration**: All nodes set to ∞, except neighbours of *b*: a, c, d
- **2. Iteration**: *t(c)* has the smallest value (8) → visited. Neighbours *t(h)*=18 and *t(e)*=23 updated.
- **3. Iteration**: *t(d)*=9 is smallest → d visited. *b→d→e* = 16 < *b→c→e* = 23 → *t(e)* = 16
- **4. Iteration**: *e* visited, *f* and *g* updated.
- When all nodes visited → algorithm terminates.

Dijkstra has $O(n^2)$.

A* uses a heuristic (visit nearby nodes first) → faster in practice.

::right::

<img src="/AGI_HS25_Netzwerk2/_page_27_Figure_10.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_27_Figure_11.jpeg" class="h-44 object-contain mt-2" />

<!--
Everyday example: how do I get from Wädenswil station to the Grüntal campus by bike? Two alternatives — which is shorter? → Dijkstra calculates this.\n\nAlgorithm on the example network, starting at B:\n- **Init**: All distances = ∞, except direct neighbours: A=20, C=8, D=9.\n- **Iter. 2**: Smallest node = C (8). Update neighbours: H=8+10=18, E=8+15=23.\n- **Iter. 3**: Smallest = D (9). Check E: B→D→E = 9+7=16 < 23 → overwrite E with 16.\n- **Iter. 4**: Visit E=16, update the rest.\n\nAt each step: check whether a shorter distance has been found → shortest overwrites previous. At the end, each node holds the shortest path from B.\n\nDijkstra O(n²). A* with heuristic "visit nearby nodes first" → significantly faster in practice.
-->

---
layout: two-cols
---

# Dijkstra's Shortest Path (Step by Step)

- **1. Iteration**: All nodes set to ∞, except neighbours of *b*: a, c, d
- **2. Iteration**: *t(c)*=8 → visited. *t(h)*=18, *t(e)*=23
- **3. Iteration**: *t(d)*=9 → visited. *t(e)*=16
- **4. Iteration**: *e* visited, *f* and *g* updated.
- When all nodes visited → done.

::right::

<img src="/AGI_HS25_Netzwerk2/_page_28_Figure_10.jpeg" class="h-80 object-contain" />

<!--
Step-by-step illustration of the four iterations. For deeper understanding: Worboys & Duckham, Ch. 5 — each iteration is described clearly there. If the explanation here is not completely clear, consult the book.
-->

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
layout: two-cols
---

# Summary

<img src="/AGI_HS25_Netzwerk2/_page_30_Picture_5.jpeg" class="h-32 object-contain mb-4" />

- **Algorithmic geometry** is the branch of (geo-)informatics that deals with solving geometric problems for geodata processing: point-in-polygon, line simplification, shortest path.
- **Dijkstra's** algorithm for calculating the shortest path is a fine example. Almost all functions in a GIS use comparable algorithms.

::right::

## Practical Part

**Group Work**
Calculate Dijkstra yourselves for a query on the VBZ tram network.

**QGIS Exercises**
Calculate shortest paths for OSM street data of Wädenswil with QGIS.

<img src="/AGI_HS25_Netzwerk2/_page_31_Figure_7.jpeg" class="h-36 object-contain mt-4" />

<!--
**Left**: Summary. Almost all GIS functions use comparable algorithms — if you look deep into the documentation, you usually find references to the papers in which they are documented.\n\n**Right**: Transition to the practical part. Group work: calculate Dijkstra manually on the Zurich VBZ tram network (Berninaplatz → Staufacher). QGIS exercise: calculate shortest paths, e.g. from the Grüntal campus down to the peninsula.
-->

---

# Reading Material & Literature

<img src="/AGI_HS25_Netzwerk2/_page_32_Picture_5.jpeg" class="float-right h-40 ml-4" />

- Lecture content is based primarily on Worboys, M. F., & Duckham, M. (2004). *GIS: a computing perspective*. CRC press, Chapter 5.
- Or in the new edition (2023) Ch. 5.5, pp. 206ff.
- GITTA lesson on Accessibility (e-learning): http://www.gitta.info/Accessibiliti/en/html/index.html
- Interactive apps for shortest path:
  - https://www.cs.usfca.edu/~galles/visualization/Dijkstra.html
  - https://algorithms.discrete.ma.tum.de/graph-algorithms/spp-dijkstra/index_en.html

<!--
Required reading: Worboys & Duckham Ch. 5. GITTA lesson on Accessibility as supplementary e-learning. The two interactive Dijkstra apps are recommended before the exercise — students can enter a graph and observe the algorithm animated.
-->


---

# MBR – Solution

Examine all vertices, i.e. their list of *x*/*y* coordinates.

Always store the four values for:
- lowest x value
- lowest y value
- highest x value
- highest y value

<img src="/AGI_HS25_Netzwerk2/_page_49_Figure_10.jpeg" class="h-56 object-contain mt-4" />

<!--
Solution to the MBR thinking pause from earlier. Think in data structures: vertices as two lists (x-coordinates, y-coordinates). You only need two points: lower-left and upper-right.\n\nAlgorithm: create four variables (min_x, min_y, max_x, max_y). Loop through all vertices. If the current value is smaller than min → overwrite; if larger than max → overwrite. After the loop: the bounding box is defined. O(n) — very fast.
-->
