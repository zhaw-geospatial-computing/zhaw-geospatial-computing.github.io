# Spatial Network Datasets for Geospatial Computing

*Findings from querying swisstopo-mcp, swiss-environment-mcp, wsl-envidat-mcp, swiss-statistics-mcp via MCP servers connected to Swiss open data.*

---

## 1. Trophic / Food Web Networks

Nodes = species, edges = who eats whom. Directed graphs with typed edges.

### trophiCH v1 — Swiss national food web

- **Source**: WSL / EnviDat — <https://www.envidat.ch/dataset/trophich-a-swiss-foodweb>
- **License**: CC-BY 4.0
- **Downloaded data**: `/home/rata/Downloads/trophich/trophiCH/data/`

#### File structure

| File | Content | Rows |
|---|---|---|
| `01_final_metaweb.csv` | **Edge list** — full metaweb (empirical + inferred) | 1,188,053 |
| `00_empirical_metaweb.csv` | Edge list — directly observed interactions only | 442,624 |
| `00_inferred_metaweb.csv` | Edge list — inferred interactions | 1,181,690 |
| `02_taxa_checklist.csv` | **Node list** — 24,169 taxa with attributes | 24,169 |
| `03_references.xlsx` | Citation database | — |
| `04_diet_ranges.csv` | Diet breadth per taxon | 264 |

#### Edge list schema (`01_final_metaweb.csv`)

```
Source_Name, Source_Rank, Source_Life_Stage,
Target_Name, Target_Rank, Target_Life_Stage,
Interaction_Type, Citation, Inference, ID
```

Each row is a directed edge: `Source` eats/parasitises/pollinates `Target`.

Edge types:

| Interaction_Type | Count |
|---|---:|
| Predation | 570,508 |
| Herbivory | 431,320 |
| Pollination | 159,314 |
| Parasitoidism | 6,447 |
| Parasitism | 5,003 |
| Kleptoparasitism | 32 |

The `Inference` column records how inferred edges were derived (diet breadth, taxonomic extrapolation, etc.).

#### Node list schema (`02_taxa_checklist.csv`)

```
Kingdom, Phylum, Class, Order, Family, Genus, Species, Taxon, Rank,
Habitat, Zone, CAT (conservation category), Count
```

`Habitat` examples: `Forest; Grassland; Urban; Cropland; Wetland`
`Zone` examples: `On ground or in leaf litter; On vegetation; In ground`

#### Loading in R

```r
library(igraph)
edges <- read.csv("01_final_metaweb.csv")
nodes <- read.csv("02_taxa_checklist.csv")

g <- graph_from_data_frame(
  d     = edges[, c("Source_Name", "Target_Name", "Interaction_Type")],
  vertices = nodes,
  directed = TRUE
)
```

#### Spatial gap

No geographic coordinates in the data. To make it spatial: join to species occurrence
records from GBIF or InfoSpecies Switzerland. The `Habitat` and `Zone` node attributes
provide a coarse ecological stratification.

---

### Plant-Orthoptera trophic networks (Swiss Alps)

- **Source**: <https://www.envidat.ch/dataset/plant-orthoptera-trophic-networks-lif3web-projet>
- **License**: WSL Data Policy
- 48 local interaction networks sampled along 6 elevation gradients in the Alps
- Each network has explicit coordinates — **directly spatial**
- Uses DNA metabarcoding for interaction detection

---

### Food web robustness under habitat loss

- **Source**: <https://www.envidat.ch/dataset/decreases-in-the-robustness-of-regional-food-webs-to-sequential-species-extincti>
- **License**: CC-BY-SA
- Multi-habitat food webs for Swiss regions, with habitat fragmentation simulation
- Includes R/Python scripts

---

### Urban garden interaction networks (Zurich)

- **Source**: <https://www.envidat.ch/dataset/data-on-alpha-and-beta-trophic-interaction-diversity-in-urban-gardens>
- **License**: CC-BY-SA
- 85 allotment/home gardens in Zurich (Lat/Long per garden)
- Trapnest data: host (bee/wasp) × natural enemy interaction matrix per garden
- **Two network levels**:
  - *Within garden*: nodes = species, edges = host-enemy interactions (in data)
  - *Between gardens*: nodes = garden sites, edges = **must be constructed** (see below)

#### Constructing spatial edges between garden sites

The dataset provides node attributes but no between-site edges. Options, in order of ecological realism:

1. **Geometric** — distance threshold, k-NN, Delaunay triangulation, Gabriel graph
2. **Dispersal biology** — weight edges by species-specific flight range (mason bee ~300 m, bumblebee ~1–2 km); species trait data included in the dataset
3. **Landscape resistance** — model urban matrix, roads, impervious surfaces as barriers (Circuitscape approach; see Blue-Green Network dataset below)
4. **Shared species composition** — connect gardens that share species; projects bipartite (species × site) matrix into a site-to-site network

The choice of edge construction determines network topology and all derived metrics (centrality, shortest paths). This is a core methodological decision, not a technical detail.

---

## 2. Habitat Connectivity / Ecological Corridor Networks

Nodes = habitat patches, edges = dispersal corridors. Underlying question: can organisms move between patches?

### Nationales ökologisches Netzwerk REN (BAFU)

Five separate spatial datasets, one per habitat type:

| Dataset | URL |
|---|---|
| Forest | <https://opendata.swiss/de/dataset/nationales-okologisches-netzwerk-ren-lebensraum-wald> |
| Wetland | <https://opendata.swiss/de/dataset/nationales-okologisches-netzwerk-ren-lebensraum-feuchtgebiet> |
| Dry sites | <https://opendata.swiss/de/dataset/nationales-okologisches-netzwerk-ren-lebensraum-trockenstandort> |
| Extensive farmland | <https://opendata.swiss/de/dataset/nationales-okologisches-netzwerk-ren-lebensraum-extensives-landwirtschaftsgebiet> |
| Rivers / lakes | <https://opendata.swiss/de/dataset/nationales-okologisches-netzwerk-ren-lebensraum-fliessgewasser-seen> |

Official federal GIS layers. Patches + corridors already defined — a ready-made spatial graph.

### Wildlife corridors (BAFU)

| Dataset | URL |
|---|---|
| Wildtierkorridore Überregional | <https://opendata.swiss/de/dataset/wildtierkorridore-uberregional> |
| Vernetzungssystem Wildtiere | <https://opendata.swiss/de/dataset/vernetzungssystem-wildtiere> |
| Wildtierpassagen | <https://opendata.swiss/de/dataset/wildtierpassagen-der-schweiz> |

Wildtierpassagen (wildlife crossing structures) are literal network nodes: points where animals can cross infrastructure barriers.

### Blue-Green Ecological Network — Circuitscape (Zurich)

- **Source**: <https://www.envidat.ch/dataset/bluegreen-ecological-network-data>
- **License**: CC-BY-SA
- Resistance layers (land cover) + focal nodes → Circuitscape outputs network with **node and branch cumulative currents**
- Circuitscape output = fully constructed spatial edge list
- Includes R scripts for resistance aggregation and network analysis
- Covers amphibian connectivity in urban Zurich

This is the methodological complement to the urban gardens dataset: same urban Swiss context, fully worked-through edge construction pipeline.

### Amphibian connectivity — Swiss lowlands

- **Source**: <https://www.envidat.ch/dataset/amphibian-and-landscape-data-swiss-lowlands>
- **License**: CC-BY-SA
- 10 amphibian species across cantons Aargau and Zurich (2017–2019)
- Uses circuit theory (Circuitscape) for corridor modelling

---

## 3. Hydrological Networks

Directed acyclic graphs: flow only goes downhill. Different topology from road or ecological networks.

| Dataset | URL |
|---|---|
| Fliessgewässer und Seen | <https://opendata.swiss/de/dataset/allgemeine-lage-der-fliessgewasser-und-seen> |
| Typisierung der Schweizer Fliessgewässer | <https://opendata.swiss/de/dataset/typisierung-der-schweizer-fliessgewasser> |
| NADUF monitoring stations | <https://opendata.swiss/de/dataset/nationale-daueruntersuchung-der-schweizerischen-fliessgewasser-naduf-standorte-der-messstatione> |
| Sediment transport — mountain streams | <https://www.envidat.ch/dataset/sediment-transport-observations-in-swiss-mountain-streams> |

The river network is a natural DAG: nodes = confluences, edges = stream segments, direction = flow.

---

## 4. Invasion / Spread Networks

How disturbance propagates through space using existing networks as corridors.

| Dataset | Note | URL |
|---|---|---|
| Invasive neophytes along national roads | 3.8M km, AI-based detection; road network as dispersal pathway | <https://www.envidat.ch/dataset/invasive-neopyhtes-along-national-roads> |
| Bark beetle disturbance predisposition maps | Spatially explicit susceptibility across forest stands | <https://www.envidat.ch/dataset/disturbance-predisposition-mapping-and-forest-structure> |

---

## Key Conceptual Points for Teaching

1. **Edges are not always given** — for point observation data (gardens, species occurrences) the choice of edge construction encodes a hypothesis about the underlying process.

2. **Same data, different networks** — the urban gardens data supports both a species interaction network (nodes=species, edges=trophic links) and a spatial site network (nodes=gardens, edges=constructed). Different representations answer different questions.

3. **Directed vs undirected** — food webs and river networks are directed (energy/flow has direction); habitat corridor networks are typically undirected.

4. **Empirical vs inferred edges** — trophiCH explicitly separates observed from inferred interactions. Network metrics differ substantially between the two; always check which you are using.

5. **Scale** — trophiCH has 24k nodes and 1.2M edges. Most network visualisation and some algorithms do not scale to this. Subnetworks (filter by habitat, trophic level, interaction type) are more tractable for teaching examples.
