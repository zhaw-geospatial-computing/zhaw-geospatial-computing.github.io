---
theme: default
title: Path and Flows 1
favicon: /favicon.png
transition: none
layout: zhaw-cover
subtitle: BSc Environmental Engineering · Applied Geoinformatics
authors: Nils Ratnaweera
email: rata@zhaw.ch
heading: Path and Flows 1
sections:
  - Introductory Tour – Networks in Geoinformatics
  - Graph Theory 1.0 for Network Analysis
  - Centrality Measures
  - Group Exercise
  - R Exercises
---

<!-- title slide: content is defined in frontmatter -->

<!--
Welcome. This module accompanies students over three weeks into network analysis as a further application area of geoinformatics.\n\n**Flipped Classroom**: Students should have completed the reading assignments beforehand – the course only works with prior reading. Point this out explicitly.\n\n**Today's structure**: Theory recap (screencast), then Q&A session, group work (calculating centrality measures themselves) and QGIS exercises.
-->

---
layout: lernziele
---

# Learning Objectives

- You can name 3–4 **application areas** of network geodata and explain in your own words what benefit the use of network data provides in those applications.
- You are able to sketch simple **graphs** with given properties.
- You are able to explain three different **centrality measures** of networks/graphs in your own words and calculate them for simple graphs.
- You can **load** and **edit** simple vector data in R.
- You can perform simple **calculations** of centrality measures in R.

<!--
Five learning objectives — go through briefly, don't explain in detail – they serve as an orientation framework for students.
-->

---

# Today's Schedule

| Time | What | Format |
|------|------|--------|
| 08:00 – 08:45 | **Theory** Graph theory and centrality | Theory recap |
| 09:00 – 10:00 | **Group work** Calculate centrality measures yourselves | Group work in groups of 3–4 |
| 10:10 – 11:35 | **QGIS exercise** Calculate centrality measures with QGIS for Wädenswil | Exercises, supervised individual work |

<!--
**Schedule**: First theory recap (screencast or presented here), then short Q&A and introduction to the exercises. Then group work in groups of 3–4, finally supervised individual work on QGIS exercises.
-->

---

<Inhalt :active="1" />



---
layout: three-cols-header
---

# Networks

Topology in the basic GIS course

::left::

Public transport maps (GIS BSc)

![](/AGI_HS25_Netzwerk1/zvv.jpg)

::center::

Route calculations (GIS BSc)

![](/AGI_HS25_Netzwerk1/google-maps.png)

::right::

River networks (GIS BSc)

![](/AGI_HS25_Netzwerk1/river-network.png)

<!--
Students have already encountered networks – in the basic GIS course (4th/5th semester) in the context of topological spaces.

- **Public transport maps**: Route network diagrams = topological spaces – connections between stops matter, not geographic distance.
- **Route calculations**: Shortest path from A to B (e.g. Google Maps) – covered in more depth next week.
- **River networks**: Runoff modelling – how does water flow through a network of rivers and lakes? This requires a network of nodes and edges.
-->

---

# Route Search: SBB Timetable Query

![](/AGI_HS25_Netzwerk1/_page_6_Figure_5.jpeg)

<!--
The SBB timetable query is a classic example of network analysis in public transport. Connections are modelled as a graph, and the shortest (fastest) path through the network is calculated.
-->

---
layout: three-cols-header
---

# Networks

Vehicle Routing, e.g. Uber, notime delivery or dispatching emergency services

::left::

![](/AGI_HS25_Netzwerk1/_page_7_Picture_9.jpeg)

::center::

![](/AGI_HS25_Netzwerk1/_page_7_Picture_10.jpeg) 

::right::

![](/AGI_HS25_Netzwerk1/_page_7_Picture_11.jpeg)


<SlideFooter>Sources: stadt-zuerich.ch, uber.com, notime.ch</SlideFooter>

<!--
Two further application areas of network analysis in everyday life:

- **Uber/notime**: When requesting a vehicle, the app calculates which vehicle can arrive fastest – taking into account one-way streets, speed limits, and current traffic conditions.
- **Emergency services dispatching**: Ambulances and emergency doctors are sent to accident sites as quickly as possible. This too runs on network analyses on a road graph.
-->

---
layout: three-cols-header
---

# Networks

Catchment areas and nearest facility

::left::

Walkalytics

![](/AGI_HS25_Netzwerk1/_page_8_Figure_9.jpeg)

::center::

Travel times (Network Analysis 3)

![](/AGI_HS25_Netzwerk1/_page_8_Picture_10.jpeg)

::right::

Geomarketing and real estate valuation

![](/AGI_HS25_Netzwerk1/_page_8_Figure_11.jpeg)

<!--
Three further applications of catchment area analyses using networks:

- **Walkalytics** (live demo possible): Tool calculates how far you can walk in e.g. 15 minutes from a starting point. Key point: the zones extend further along transport axes because you can move faster there.
- **Travel times by public transport**: Catchment area of a city in 20/40/60 minutes – spatially very heterogeneous depending on public transport coverage.
- **Geomarketing**: How many residents can reach a new branch within 5–10 minutes on foot? Site planning for large retailers and other companies.
-->

---
layout: two-cols
---

# Network Information Systems (NIS)

- Utility networks for electricity
- e.g. company NIS.ch
  - Smallworld GIS, GE Grid Solutions
  - Applications for network information systems

::right::

<img src="/AGI_HS25_Netzwerk1/_page_9_Figure_9.jpeg" class="w-full object-contain" />

<SlideFooter>Source: nis.ch</SlideFooter>

<!--
NIS = Network Information Systems: Used for utility infrastructure, e.g. electricity grids. The company NIS.ch develops applications for managing and analysing such networks based on Smallworld GIS (GE Grid Solutions). A further area where network topology and GIS are closely linked.
-->

---

<Inhalt :active="2" />

---
layout: image
image: /AGI_HS25_Netzwerk1/_page_11_Picture_0.jpeg
backgroundSize: contain
---

---

# Graphs

- Graph theory: mathematical foundation of networks
- A graph is formed from a set of **edges** and a set of **nodes** → recap of BSc GIS topology
- Fundamental problems
  - Node degrees
  - Neighbourhood of nodes and edges
  - Paths through graphs
  - Centrality measures

<!--
Graph theory is the mathematical foundation of network analysis. Students have already encountered the terms nodes and edges in the basic GIS course – "Arc" in ArcGIS refers precisely to this edge. A few further concepts are now added: node degrees, neighbourhood, paths and centrality measures.
-->

---
class: text-sm
---

# Graph Types

| | Type | Description | Application |
|:---:|------|-------------|-------------|
| <img src="/graph-types/zyklisch.png" class="h-14 object-contain" /> | cyclic | A cycle is a path where the first and last node are identical | Transport networks |
| <img src="/graph-types/gerichtet.png" class="h-14 object-contain" /> | directed | Edges are directed, can only be traversed in one direction | Road network with one-way streets |
| <img src="/graph-types/gewichtet.png" class="h-14 object-contain" /> | weighted | Edges or nodes have weights / traversal costs | Speed limits per edge, toll per edge, elevation |
| <img src="/graph-types/planar.png" class="h-14 object-contain" /> | planar | Graphs that can be drawn on a plane without edges crossing | In a planar road network all edges meet at nodes |
| <img src="/graph-types/hierarchisch.png" class="h-14 object-contain" /> | hierarchical | A graph without cycles | Tree structures for indexing geodata (quadtree, R-tree) |

<SlideFooter>Source: gitta.info</SlideFooter>

<!--
Five graph types briefly explained:

- **Cyclic**: A cycle = path where first and last node are identical (closed loop). Typical in transport networks.
- **Directed**: Edges have a direction (arrow). Can only be traversed in one direction. Application: one-way streets. A directed edge also has a left and right side.
- **Weighted**: Edges (or nodes) have weights (represented e.g. by line thickness). Can represent person flows, speeds, costs or tolls.
- **Planar**: Can be drawn on a plane without edges crossing. In a planar road network edges only cross at nodes. Non-planar: a bridge over a road (edge crosses without a node). Think question: which of the shown graphs is planar, which is not?
- **Hierarchical** (trees): Graph without cycles. Tree structures are used for indexing geodata (Quadtree, R-Tree – familiar from the database module).
-->

---
layout: two-cols
---

# Node Degrees

**in the undirected graph**

- Node degree: number of edges meeting at a node
- Loops (as in B) are counted **twice**.

::right::

<img src="/graph-types/knotengrad-ungerichtet.png" class="h-80 object-contain" />

<SlideFooter>Source: Lipschutz & Lipson (1997)</SlideFooter>

<!--
Node degree = number of edges at a node. Loops count double.
Example values: A = 3, D = 3, C = 2, B = 6 (highest degree).
-->

---
layout: two-cols
---

# Node Degrees

**in the directed graph**

- **indegree**: number of directed edges ending at the node
- **outdegree**: number of directed edges starting at the node
- $\sum$ indegree = $\sum$ outdegree = 7
- Sources and sinks
  - **Source**: node with indegree = 0
  - **Sink**: node with outdegree = 0
  - C is a sink, there are no sources

::right::

<img src="/graph-types/knotengrad-gerichtet.png" class="h-80 object-contain" />

<SlideFooter>Source: Lipschutz & Lipson (1997)</SlideFooter>

<!--
In-degree: incoming edges. Out-degree: outgoing edges.
- A: indegree = 2, outdegree = 1
- D: indegree = 1, outdegree = 2
- C: indegree = 2, outdegree = 0 → sink
- B: indegree = 2, outdegree = 4 ← students should calculate B themselves

Important rule: ∑ indegree = ∑ outdegree. Check: 2+2+2+1 = 7, 1+4+0+2 = 7 ✓
-->

---
{}
---

# Adjacency Matrix

The adjacency matrix shows which nodes in a graph are adjacent.

- **1** = edge present (e.g. from *a* to *b*)
- **0** = no edge (e.g. *a* to *d*)
- Diagonal (green): node with itself

<div class="flex gap-2 items-center justify-center mt-4">
  <img src="/graph-types/adjazenz-graph.png" class="h-48 object-contain" />
  <img src="/graph-types/adjazenz-matrix.png" class="h-48 object-contain" />
</div>

<!--
The **adjacency matrix** indicates which nodes are connected:
- 1 = edge present, 0 = no edge
- Example: a→b: 1, a→c: 1, a→d: 0, a→e: 0
- The matrix is symmetric (undirected graph): M[i,j] = M[j,i]
-->

---

# Adjacency Matrix (weighted)

Edges can also carry **weights** (costs, times, capacities).

- Instead of 0/1, the weights appear in the matrix.
- **Symmetric**: from *a* to *b* = from *b* to *a*
- **Asymmetric**: e.g. one-way streets or different travel times per direction


<div class="flex gap-2 items-center justify-center h-full">
  <img src="/graph-types/adjazenz-graph-gewichtet.png" class="h-64 object-contain" />
  <img src="/graph-types/adjazenz-matrix-gewichtet.png" class="h-64 object-contain" />
</div>

<!--
**Weighted adjacency matrix**: Instead of 0/1, edge weights appear in the matrix.
- Diagonal = 0 (no self-connections in the weighted graph)
- Symmetric for undirected graph: M[i,j] = M[j,i]
- Asymmetric for directed graph: outward and return journeys can have different costs
-->

---
{}
---

# Paths through Graphs

- Travel times can also be given in a matrix beyond direct neighbours.
- Picton → Dunedin: 5.00 + 2.10 + 2.50 = **10.0**


<div class="flex gap-2 items-start justify-center h-full">
  <img src="/nztraveltimes-map.jpg" class="h-80 object-contain" />
  <img src="/nztraveltimes.jpg" class="h-80 object-contain" />
</div>

<SlideFooter>Source: kiwiway.com</SlideFooter>

<!--
New Zealand as an illustrative example: the road network is simple in structure, but the roads are very winding – travel times are therefore much longer than the straight-line distance suggests. That is why printed travel time matrices exist there.

**Example calculation**: Picton → Dunedin via three edges:
- Picton → Christchurch: 5:00 h
- Christchurch → Timaru: 2:10 h
- Timaru → Dunedin: 2:50 h
- **Total: 10:00 h**

Students may be familiar with this type of travel time matrix from road maps – now they see how it is built up by summing edges.
-->

---

# Königsberg Bridges 1736

**Task (3:00)**

*Is there a route in which all seven bridges of the city are crossed exactly once and you return to the starting point?*

<div class="flex gap-2 items-start justify-center h-full">
  <img src="/Bridges_of_Konigsberg.png" class="h-80 object-contain" />
  <CountdownTimer :minutes="3" />
</div>

<!--
**Königsberg Bridges** (1736): Euler asked whether one could draw a path through the city of Königsberg in which all seven bridges are crossed EXACTLY ONCE. Think: the-house-that-Jack-built.

Land regions = nodes, bridges = edges. Students have ~3 minutes to try it themselves.

**Spoiler (only show on the next slide)**: It is impossible – because all node degrees are odd.
-->

---

# Königsberg Bridges 1736

1. Nodes represent land regions, edges represent bridges
2. Except at the start and end, such a path must enter a node on one edge and leave it on another
3. That means: the node degrees would need to be *even* everywhere
4. They are odd, so no such path can exist


<img src="/koenigsberg.jpg" class="h-80 object-contain" />

---
layout: zusammenfassung
---

# Summary

- Network data is used in GIS to model neighbourhood, connectivity and centrality.
- Application areas range from the analysis of transport networks to hydrology and geomarketing.
- The foundations of network analysis are based on the mathematical discipline of graph theory.
- Graphs consist of nodes and the edges connecting them.

<!--
End of part one (Screencast 1). Brief summary of the key points before transitioning to centrality measures.
-->

---

<Inhalt :active="3" />

---
layout: image
image: /AGI_HS25_Netzwerk1/_page_21_Picture_0.jpeg
---

<!--
Opening with an everyday example: the square «Das Zentral» in Zurich is not named that by coincidence – it really is very central. But can that be calculated mathematically? Yes – that is exactly what centrality measures do.
-->

---
layout: two-cols-header
---

# Centrality Measures

Measures describing the relative importance ("centrality") of a node in a graph or network.

::left::

- **Applications**
  - Transport hubs
  - Social networks ([influencer](https://likeometer.co/weltweit/alle/)...)

- **We examine four centrality measures**
  - Degree Centrality
  - Closeness Centrality
  - Betweenness Centrality
  - Straightness Centrality

::right::

![](/AGI_HS25_Netzwerk1/_page_22_Picture_15.jpeg)

<!--
Second motivational example: **influencers in social networks** – influencers are people connected to very many others. In Switzerland there is the "Leikometer" as a ranking. Depending on the centrality measure used, you get different results.

**Four measures** are discussed: Degree, Closeness, Betweenness, Straightness Centrality. All four are also used in the paper by Wang et al. (2011).
-->

---
layout: two-cols-header
---

# Centrality Measures: Degree Centrality

Corresponds to the node degree in the undirected graph, i.e. the number of edges meeting at a node.

::left::

![](/graph-types/knotengrad-ungerichtet.png)

::right::

![](/AGI_HS25_Netzwerk1/_page_23_Picture_7.jpeg)

<!--
**Degree Centrality** is the simplest measure – it corresponds directly to the node degree (number of edges).

Example values from the previous graph: B (degree 6, highest centrality) > A and D (3 each) > C (2, lowest centrality).

In the network visualisation example: the dense network at the bottom has many nodes with high degree – high degree centrality. At the periphery it is significantly lower.
-->

---
layout: two-cols-header
---

# Centrality Measures: Closeness Centrality

Measures how close a node is to all other nodes in the network, along the shortest paths through the network.
$N$ number of nodes in the network, $d_{ij}$ distance of the shortest path between nodes $i$ and $j$

$$C_{i}^{C} = \frac{N-1}{\sum_{j=1: j \neq i}^{N} d_{ij}}$$



::right::

![](/AGI_HS25_Netzwerk1/closeness-a.jpeg)

::left::

![](/AGI_HS25_Netzwerk1/closeness-b.jpeg)

<!--
**Closeness Centrality** looks not only at direct neighbours, but calculates for each node the sum of all shortest paths to all other nodes in the network. The smaller the sum, the more central.

The example shows an American city (LA?): the CBD (Central Business District) has the highest closeness centrality because the paths from there to all other points are on average shortest. In the same graph as for degree centrality, the highest values are now in the centre of the network – a different picture than with degree.
-->

---
layout: two-cols-header
---

# Centrality Measures: Betweenness Centrality

- Measures how often a node is traversed by all shortest paths between all node pairs in the network.
- Shows which nodes are the important bridge or connector nodes in the network.
- $N$ number of nodes, $n_{jk}$ number of shortest paths between $j$ and $k$, $n_{jk}(i)$ of those passing through $i$

<span class="block text-center text-xl mt-2">$C_i^B =$ <span v-mark.circle.orange="1" class="px-3 py-4">$\dfrac{1}{(N-1)(N-2)}$</span> $\displaystyle\sum_{j=1;\, k=1;\, j \neq k \neq i}^{N} \dfrac{n_{jk}(i)}{n_{jk}}$</span>

::left::

![](/AGI_HS25_Netzwerk1/betweenness-a.jpeg)

::right::

![](/AGI_HS25_Netzwerk1/betweenness-b.jpeg)

<!--
**On the normalisation $\frac{1}{(N-1)(N-2)}$:**

$(N-1)(N-2)$ is the maximum number of ordered node pairs $(j, k)$ not containing node $i$: $j$ can be one of the $N-1$ other nodes, $k$ one of the remaining $N-2$ nodes (excluding $i$ and $j$).

The raw sum $\sum \frac{n_{jk}(i)}{n_{jk}}$ reaches its maximum $(N-1)(N-2)$ only when node $i$ lies on *every* shortest path between *every* other node pair. Dividing by this maximum yields a value between 0 and 1.

Without normalisation, a node in a large network would always score higher than an equally central node in a smaller network, simply due to the larger number of pairs. The factor makes betweenness centrality comparable across networks.
-->

---
layout: two-cols
---

::left::

![](/AGI_HS25_Netzwerk1/betweenness-a.jpeg)

::right::

![](/AGI_HS25_Netzwerk1/betweenness-b.jpeg)

<!--
**Betweenness Centrality**: First ALL shortest paths between ALL node pairs are calculated. Then for each node, the number of those shortest paths passing through it is counted.

Result: Only a few nodes have very high values – these are the true "bridge" or "key nodes" in the network. In the road network example, 1–2 connecting axes appear that are used by very many shortest paths. If this connection fails, the network collapses.

The picture is once again completely different from degree or closeness centrality.
-->

---
layout: two-cols-header
---

# Centrality Measures: Straightness Centrality

::left::

- Measures how much all shortest paths from a node to all other nodes deviate from the straight-line connection (Euclidean distance).
- "How directly (i.e. straight) can a node be reached?"
- $d_{ij}^{Eucl}$ Euclidean distance between nodes $i$ and $j$, $d_{ij}$ shortest path between nodes $i$ and $j$
$$C_i^S = \frac{1}{N-1} \sum_{j=1, j \neq i}^{N} \frac{d_{ij}^{Eucl}}{d_{ij}}$$



::right::

<img src="/AGI_HS25_Netzwerk1/_page_26_Figure_10.jpeg" class="h-80 object-contain" />

<!--
**Straightness Centrality** measures how much the shortest network path deviates from the direct straight line (Euclidean distance). A node has high straightness centrality if it can be reached "straight ahead".

This measure is particularly relevant for grid-like road networks (USA) – in Switzerland with winding Alpine valleys and historically grown town centres it is less informative.
-->

---

# Comparison of Centrality Measures

<img src="/AGI_HS25_Netzwerk1/_page_27_Figure_5.jpeg" class="h-80 object-contain mx-auto" />

<!--
All four measures on the same network – the results are completely different. This shows that "centrality" is not a single unambiguous quantity, but depends on what you want to measure.

Particularly important for us: **Closeness** and **Betweenness** Centrality – make sure to remember these (also used in the Wang et al. (2011) paper).
-->

---
layout: zusammenfassung
---

# Summary

- Centrality measures describe the relative importance ("centrality") of a node in a graph or network.
- Particularly important are *closeness* and *betweenness* centrality.

---
layout: two-cols-header
---

# Group Exercise: Calculate Degree Centrality

- Form groups of 3–4 with your neighbours.
- Calculate *Degree Centrality* for the graph below.
- For each node, count the number of edges meeting at that node.

::left::

![](/AGI_HS25_Netzwerk1/mygraph.png)

::right::

<CountdownTimer :minutes="5" />

---
layout: two-cols-header
---

# Group Exercise: Calculate Closeness Centrality

- In the same groups, calculate *Closeness Centrality* for the same graph.
- You will need Excel or similar. Follow these steps:
  1. Create a cross matrix with rows A to H and columns A to H
  2. Calculate the length of the shortest path from each node to every other node (all edges L = 1)
  3. Calculate the sum of these lengths per node
  4. Invert this value ($\frac{1}{x}$)


::left::

![](/AGI_HS25_Netzwerk1/mygraph.png)

::right::

<CountdownTimer :minutes="15" />

---
layout: two-cols-header
---

# Group Exercise: Calculate Betweenness Centrality

- Now calculate *Betweenness Centrality* for the same graph <span v-mark.underline>only for nodes B, C and F</span>
- You will need Excel or similar. For each node pair:
  1. How many shortest paths are there? ($n_{jk}$)
  2. How many of them pass through the node under investigation? ($n_{jk}(i)$)
  3. Calculate the ratio ($\frac{n_{jk}(i)}{n_{jk}}$)
  4. Sum up all ratios (we skip the normalisation)

  

::left::

![](/AGI_HS25_Netzwerk1/mygraph.png)

::right::

<CountdownTimer :minutes="30" />

---

# Reading Material & Literature

- Wang, F., Antipova, A., & Porta, S. (2011). Street centrality and land use intensity in Baton Rouge, Louisiana. *Journal of Transport Geography*, **19**(2), 285-293.
- Heywood, I., Cornelius, S., & Carver, S. (2011). An introduction to GIS. Pearson Education, Chapter on Network Analysis, pages 218-219.
- Big Data Analytics by Anuradha Bhatia: https://www.youtube.com/watch?v=ptqt2zr9ZRE

---

# R Exercises – Working Data

`netzwerkanalyse.gpkg` contains the following layers:

| Layer | Content |
|-------|---------|
| `osm_highway_prepared` | Street network, LV95 |
| `Gemeinde_Waedenswil` | Municipality boundary |

<!--
Brief introduction: students have the GeoPackage "netzwerkanalyse.gpkg" in front of them and work directly in R/RStudio. The slides show the tasks, code snippets and expected results.
-->

---
layout: two-cols-header
---

# Tasks 1: Load data and visualise

Load `osm_highway_prepared` and `Gemeinde_Waedenswil`. Check the number of features and the CRS. Then map the network.


::left::

```r
library(sf)
library(ggplot2)

gpkg <- "netzwerkanalyse.gpkg"
st_layers(gpkg) # what layers are available?

municipality <- read_sf(gpkg, layer = "Gemeinde_Waedenswil")

# read in the "osm" dataset as "streets"

ggplot() +
  geom_sf(data = municipality, fill = NA) +
  ...   # ← add the other layers
```

::right::

<img src="/netzwerkanalyse-r/strassennetz.png" class="h-full object-contain" />

<!--
Students should load the layer themselves and reproduce the plot. In doing so they see that it is a simple collection of lines – not yet a graph.
-->

---

# Task 2: Create a network object

A street dataset is a collection of line segments — not yet a graph. `as_sfnetwork()` converts it:

```r
library(sfnetworks)
library(tidygraph)

net   <- as_sfnetwork(streets, directed = FALSE)

net
```

- How many **nodes** does the network have?
- How many **edges**?
- What do nodes and edges represent in a street network context?

<!--
Nodes = intersections/endpoints, edges = road segments. The sfnetwork object is simultaneously an sf object and a tidygraph object.
-->

---
{}
---

# The pipe `|>`

The pipe passes the result on the left as the **first argument** to the function on the right:

```r
streets |> nrow()             # same as nrow(streets)
streets |> st_crs()           # same as st_crs(streets)
streets |> st_transform(2056) # same as st_transform(streets, 2056)
```

- This lets you chain steps without storing intermediate results.
- `|>` is the base R pipe (R ≥ 4.1). You may also see `%>%` from the `magrittr` package — it works the same way in most cases.
- Keyboard shortcut:
  - windows / linux <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>m</kbd>
  - mac: <kbd>command</kbd> + <kbd>shift</kbd> + <kbd>m</kbd>

<!--
Students may already know pipes from tidyverse (%>%). The native pipe operator |> has been available since R 4.1 and has no external dependencies. The difference is minimal in practice.
-->

---
{}
---

# Nodes & Edges in `sfnetworks`

- An `sfnetwork` holds **two tables** — one for nodes, one for edges.
- Use `activate()` to choose which table dplyr operations (like `mutate()`) apply to:

```r
net |> activate("nodes")   # subsequent operations affect nodes
net |> activate("edges")   # subsequent operations affect edges
```

Extract either table as a regular `sf` object at any time:

```r
nodes <- st_as_sf(net, "nodes")
edges <- st_as_sf(net, "edges")
```

> After a `mutate()` on the network, re-run `st_as_sf()` to get the updated table.

<!--
sfnetworks combines two concepts: tidygraph (nodes/edges as tbl_graph) and sf (spatial geometry). activate() is the key concept: it determines which table subsequent dplyr operations apply to.
-->

---
layout: two-cols-header
---

# Task 3: Degree Centrality

- Number of edges connected to a node — direct neighbours only.
- Which degree is most common?  What does degree = 1 represent?

::left::

```r
net <- net |>
  activate("nodes") |>
  mutate(degree = centrality_degree())

# export to sf to make a ggplot
nodes <- st_as_sf(net, "nodes")

ggplot() +
  geom_sf(data = edges, color = "gray85") +
  geom_sf(data = nodes, aes(color = degree)) 

# optionally use a nice colour scale (scale_color_...)
```

::right::

<img src="/netzwerkanalyse-r/degree_map.png" class="h-full object-contain" />

<!--
Degree 3 and 4 are most common (typical intersections). Degree 1 = dead end. Degree 2 = through point without a real branch. Spatially: high degree values in the centre and at junctions.
-->

---

# Task 4: Edge weights

Closeness and betweenness centrality measures are based on **shortest paths** — but shortest by what measure?

- **Discuss:** What different weighting schemes are possible for a street network? What does each one optimise, and for which application would you use it?
- Then add physical length (in meters) as a weight:

```r

net <- net |>
  activate("edges") |>              # we need to activate the edges to add edge weight
  mutate(length = edge_length())    # we can use mutate to add the weight
```

- Look at the result, visualize to verify

<!--
Expected answers: physical length (shortest route), travel time (fastest route, needs speed limit), road type (e.g. pedestrian vs. car), gradient (elevation for cyclists), number of turns... Important: the choice of weight determines what "shortest path" means – and therefore also what the centrality measures capture.
-->

---
layout: two-cols-header
---

# Task 5: Closeness Centrality

How efficiently can a node reach all others?

::left::

```r
net <- net |>
  activate("nodes") |>
  mutate(closeness = centrality_closeness(weights = length))

nodes <- st_as_sf(net, "nodes")

# visualize using ggplot2
```

::right::

<img src="/netzwerkanalyse-r/closeness_map.png" class="h-full object-contain" />

<!--
Closeness measures average reachability – not just direct neighbours. Spatially: high values in the centre of the network, low at the periphery. Unlike degree: even a node with few edges can have high closeness if it is well located.
-->

---
layout: two-cols-header
---

# Task 6: Betweenness Centrality

How often does a node lie on shortest paths between other nodes?

::left::

```r
net <- net |>
  activate("nodes") |>
  mutate(betweenness = ...) # find the correct function

# Computation might take a while...
```



::right::

<img src="/netzwerkanalyse-r/betweenness_map.png" class="h-full object-contain" />

<!--
Betweenness reveals bridge nodes – nodes that concentrate many shortest paths. In a road network these are often the few main axes connecting neighbourhoods. If such a node fails, connectivity drops sharply. Typical for Wädenswil: high betweenness along the main roads and along the lakeshore.
-->

---

# Task 7: Compare all three measures

- Which parts are most central by each measure?
- How do the spatial patterns differ?

![](/netzwerkanalyse-r/comparison.png)

<!--
Key message: "centrality" is not a single unambiguous quantity. Degree shows local connectivity, closeness global reachability, betweenness structural bridging function. Depending on the application (emergency planning, geomarketing, transport planning), a different measure is relevant.
-->
