---

<Inhalt :active="5" />

---

# R Exercises – Working Data

`netzwerkanalyse.gpkg` contains the following layers:

| Layer | Content |
|-------|---------|
| `osm_highway_prepared` | Street network, LV95 |
| `Gemeinde_Waedenswil` | Municipality boundary |

<!--
Kurze Einführung: Studierende haben das GeoPackage "netzwerkanalyse.gpkg" vor sich und arbeiten direkt in R/RStudio. Die Folien zeigen die Aufgaben, Codeausschnitte und erwarteten Resultate.
-->

---
layout: two-cols
---

# Tasks 1 & 2: Load data and visualise

Load `osm_highway_prepared` and `Gemeinde_Waedenswil`. Check the number of features and the CRS. Then map the network.

```r
library(sf)
library(ggplot2)

streets      <- read_sf("netzwerkanalyse.gpkg", layer = "osm_highway_prepared")
municipality <- read_sf("netzwerkanalyse.gpkg", layer = "Gemeinde_Waedenswil")

ggplot() +
  geom_sf(data = municipality, fill = NA) +
  geom_sf(data = streets, color = "steelblue", linewidth = 0.2) +
  theme_void()
```

::right::

<img src="/netzwerkanalyse-r/strassennetz.png" class="h-full object-contain" />

<!--
Studierende sollen selber den Layer laden und den Plot reproduzieren. Dabei sehen sie, dass es sich um eine einfache Ansammlung von Linien handelt – noch kein Graph.
-->

---
layout: exercises
---

# Task 3: Create a network object

A street dataset is a collection of line segments — not yet a graph. `as_sfnetwork()` converts it:

```r
library(sfnetworks)
library(tidygraph)

net   <- as_sfnetwork(streets, directed = FALSE)
nodes <- st_as_sf(net, "nodes")
edges <- st_as_sf(net, "edges")
net
```

- How many **nodes** does the network have?
- How many **edges**?
- What do nodes and edges represent in a street network context?

<!--
Knoten = Kreuzungen/Endpunkte, Kanten = Strassensegmente. Das sfnetwork-Objekt ist gleichzeitig ein sf-Objekt und ein tidygraph-Objekt.
-->

---
layout: exercises
---

# Task 4: Edge weights

Centrality measures are based on **shortest paths** — but shortest by what measure?

**Discuss:** What different weighting schemes are possible for a street network? What does each one optimise, and for which application would you use it?

Then add physical length as a weight:

```r
net <- net |>
  activate("edges") |>
  mutate(length = edge_length())
```

<!--
Erwartete Antworten: physische Länge (kürzester Weg), Reisezeit (schnellster Weg, braucht Geschwindigkeitslimit), Strassentyp (z.B. Fussgänger vs. Auto), Steigung (Höhenmeter für Radfahrer), Anzahl Abbiegevorgänge...

Wichtig: Die Wahl des Gewichts bestimmt, was "kürzester Pfad" bedeutet – und damit auch, was die Zentralitätsmasse messen.
-->

---
layout: two-cols-header
---

# Task 5: Degree Centrality

Number of edges connected to a node — direct neighbours only.

::left::

```r
net <- net |>
  activate("nodes") |>
  mutate(degree = centrality_degree())
nodes <- st_as_sf(net, "nodes")

ggplot(nodes, aes(x = degree)) +
  geom_histogram(binwidth = 1) + theme_minimal()
```

Which degree is most common?
What does degree = 1 represent?

<img src="/netzwerkanalyse-r/degree_hist.png" class="w-full object-contain" />

::right::

<img src="/netzwerkanalyse-r/degree_map.png" class="h-full object-contain" />

<!--
Knotengrad 3 und 4 sind am häufigsten (typische Kreuzungen). Grad 1 = Sackgasse. Grad 2 = Durchgangspunkt ohne echte Verzweigung. Räumlich: hohe Degree-Werte im Zentrum und an Knotenpunkten.
-->

---
layout: two-cols
---

# Task 6: Closeness Centrality

$$C_{i}^{C} = \frac{N-1}{\sum_{j \neq i} d_{ij}}$$

How efficiently can a node reach all others?

```r
net <- net |>
  activate("nodes") |>
  mutate(closeness = centrality_closeness(weights = length))
nodes <- st_as_sf(net, "nodes")

ggplot() +
  geom_sf(data = edges, color = "gray85") +
  geom_sf(data = nodes, aes(color = closeness)) +
  scale_color_viridis_c() + theme_void()
```

::right::

<img src="/netzwerkanalyse-r/closeness_map.png" class="h-full object-contain" />

<!--
Closeness misst die durchschnittliche Erreichbarkeit – nicht nur direkte Nachbarn. Räumlich: hohe Werte im Zentrum des Netzes, niedrig an der Peripherie. Anders als Degree: Auch ein Knoten mit wenigen Kanten kann hohe Closeness haben, wenn er gut gelegen ist.
-->

---
layout: two-cols
---

# Task 7: Betweenness Centrality

$$C_i^B = \frac{1}{(N-1)(N-2)} \sum_{j \neq k \neq i} \frac{n_{jk}(i)}{n_{jk}}$$

How often does a node lie on shortest paths between other nodes?

```r
net <- net |>
  activate("nodes") |>
  mutate(betweenness = centrality_betweenness(weights = length))
nodes <- st_as_sf(net, "nodes")

ggplot() +
  geom_sf(data = edges, color = "gray85") +
  geom_sf(data = nodes, aes(color = betweenness)) +
  scale_color_viridis_c() + theme_void()
```

> ~2600 nodes — computation takes several minutes.

::right::

<img src="/netzwerkanalyse-r/betweenness_map.png" class="h-full object-contain" />

<!--
Betweenness zeigt Brückenknoten – Knoten, die viele kürzeste Pfade bündeln. Im Strassennetz sind das oft die wenigen Hauptachsen, die Stadtteile verbinden. Fällt so ein Knoten aus, bricht die Konnektivität stark ein.

Typisch für Wädenswil: Hohe Betweenness entlang der Hauptstrassen und am Seeufer.
-->

---
layout: two-cols
---

# Task 8: Compare all three measures

```r
library(patchwork)

p1 <- ggplot() +
  geom_sf(data = nodes, aes(color = degree)) +
  scale_color_viridis_c() + theme_void()
p2 <- ggplot() +
  geom_sf(data = nodes, aes(color = closeness)) +
  scale_color_viridis_c() + theme_void()
p3 <- ggplot() +
  geom_sf(data = nodes, aes(color = betweenness)) +
  scale_color_viridis_c() + theme_void()
p1 + p2 + p3
```

- Which parts are most central by each measure?
- How do the spatial patterns differ?

::right::

<img src="/netzwerkanalyse-r/comparison.png" class="h-full object-contain" />

<!--
Kernbotschaft: "Zentralität" ist keine eindeutige Grösse. Degree zeigt lokale Verbundenheit, Closeness globale Erreichbarkeit, Betweenness strukturelle Brückenfunktion. Je nach Anwendung (Notfallplanung, Geomarketing, Verkehrsplanung) ist ein anderes Mass relevant.
-->
