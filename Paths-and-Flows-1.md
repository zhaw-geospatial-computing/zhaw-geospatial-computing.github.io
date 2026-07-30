---
theme: default
title: Path and Flows 1
transition: none
layout: zhaw-cover
subtitle: BSc Umweltingenieurwesen · Angewandte Geoinformatik
authors: Nils Ratnaweera
email: rata@zhaw.ch
heading: Path and Flows 1
sections:
  - Einleitender Rundgang – Netzwerke in der Geoinformatik
  - Graphentheorie 1.0 für die Netzwerkanalyse
  - Zentralitätsmasse
  - QGIS
---

<!-- title slide: content is defined in frontmatter -->

---
layout: lernziele
---

# Lernziele

- Sie kennen 3-4 **Anwendungsbereiche** von Netzwerk-Geodaten und können dabei in eigenen Worten erklären, welchen Nutzen die Verwendung von Netzwerkdaten in besagten Anwendungen haben.
- Sie sind in der Lage einfache **Graphen** mit gegebenen Eigenschaften selber zu skizzieren.
- Sie sind in der Lage drei verschieden **Zentralitätsmasse** von Netzwerken/Graphen in eigenen Worten zu erklären und für einfache Graphen zu berechnen.
- Sie können einfache Vektordaten in QGIS **laden** und **editieren**
- Sie können einfache **Berechnungen** von Zentralitätsmassen in QGIS ausführen.

---

# Zeitplan heute

| Zeitplan | Was | Form |
|----------|-----|------|
| 13:00 – 13:45 | **Theorie** Graphentheorie und Zentralität | Theorie-Recap |
| 14:00 – 15:00 | **Gruppenarbeit** Zentralitätsmasse selber berechnen | Gruppenarbeit in 3er/4er Gruppen |
| 15:10 – 16:35 | **QGIS-Übung** Zentralitätsmasse mit QGIS berechnen für Wädenswil | Übungen, betreute Einzelarbeit |

---

<Inhalt :active="1" />

---
layout: image
image: /AGI_HS25_Netzwerk1/_page_4_Picture_0.jpeg
---

---
layout: three-cols-header
---

# Netzwerke

Topologie im GIS basic Kurs

::left::

ÖV-Karten (GIS BSc)

![](/AGI_HS25_Netzwerk1/zvv.jpg)

::center::


Pfadberechnungen (GIS BSc)

![](/AGI_HS25_Netzwerk1/google-maps.png)

::right::

Gewässernetze (GIS BSc)

![](/AGI_HS25_Netzwerk1/river-network.png)

---

# Routensuche: Fahrplanabfrage SBB

![](/AGI_HS25_Netzwerk1/_page_6_Figure_5.jpeg)

---
layout: three-cols-header
---

# Netzwerke

Vehicle Routing, z.B Uber, notime delivery oder Dispatching Schutz & Rettung

::left::

![](/AGI_HS25_Netzwerk1/_page_7_Picture_9.jpeg)



::center::

![](/AGI_HS25_Netzwerk1/_page_7_Picture_10.jpeg) 

::right::

![](/AGI_HS25_Netzwerk1/_page_7_Picture_11.jpeg)


<SlideFooter>Quellen: stadt-zuerich.ch, uber.com, notime.ch</SlideFooter>

---
layout: three-cols-header
---

# Netzwerke

Einzugsgebiete und nächste Einrichtung

::left::

Walkalytics

![](/AGI_HS25_Netzwerk1/_page_8_Figure_9.jpeg)

::center::

Reisezeiten (Netzwerkanalyse 3)

![](/AGI_HS25_Netzwerk1/_page_8_Picture_10.jpeg)

::right::

Geomarketing und Immobilien-Bewertung

![](/AGI_HS25_Netzwerk1/_page_8_Figure_11.jpeg)

---
layout: two-cols
---

# Netzwerk-Informations-Systeme (NIS)

- Versorgungsnetzwerke für Strom
- Z.B. Firma NIS.ch
  - Smallworld GIS, GE Grid Solutions
  - Applikationen für Netzinformationssysteme

::right::

<img src="/AGI_HS25_Netzwerk1/_page_9_Figure_9.jpeg" class="w-full object-contain" />

<SlideFooter>Quelle: nis.ch</SlideFooter>

---

<Inhalt :active="2" />

---
layout: image
image: /AGI_HS25_Netzwerk1/_page_11_Picture_0.jpeg
backgroundSize: contain
---

---

# Graphen

- Graphentheorie: math. Grundlage von Netzwerken
- Ein Graph wird gebildet aus einer Menge (*engl.* set) von **Kanten** (*engl.* edges) und einer Menge von **Knoten** (*engl.* nodes) → Rückblick auf BSc GIS Topologie
- Grundlegende Probleme
  - Grade von Knoten
  - Nachbarschaft von Knoten und Kanten
  - Pfade durch Graphen
  - Zentralitätsmasse

<!-- check with slide 13 -->


---

# Graphen-Typen

| Typ | Beschreibung | Anwendung |
|-----|-------------|-----------|
| zyklisch | Zyklus ist ein Pfad, bei dem erster und letzter Knoten identisch sind | Verkehrsnetze |
| gerichtet | Kanten sind gerichtet, können nur in einer Richtung durchquert werden | Strassennetz mit Einbahnstrassen |
| gewichtet | Kanten oder Knoten haben Gewichte resp. Durchquerungs-Kosten | Höchstgeschwindigkeiten pro Kante, Maut pro Kante |
| planar | Graphen, die auf einer Ebene abgebildet werden können, ohne dass ihre Kanten sich schneiden | Im planaren Strassennetz kreuzen alle Kanten in Knoten |
| hierarchisch | Ein Graph ohne Zyklen | Baumstrukturen zur Indizierung von Geodaten (quadtree, R-tree) |

<SlideFooter>Quelle: gitta.info</SlideFooter>

---


# Knotengrade


- **im ungerichteten Graph**
  - Knotengrad: Anzahl Kanten, die am Knoten zusammenlaufen
  - Loops (wie in B) werden 2 mal gezählt.

- **im gerichteten Graph**
  - indegree: Anzahl gerichteter Kanten, die im Knoten enden
  - outdegree: Anzahl gerichteter Kanten, die am Knoten starten
  - $\sum$ indegree = $\sum$ outdegree = 7
  - Quellen und Senken
    - **Quelle** (source): Knoten mit indegree = 0
    - **Senke** (sink): Knoten mit outdegree = 0
    - C ist eine Senke, Quellen hat es keine

::right::

<!-- check with slide 15 -->

<!-- ![](/AGI_HS25_Netzwerk1/_page_15_Picture_16.jpeg) -->


<!-- <img src="/AGI_HS25_Netzwerk1/_page_14_Picture_17.jpeg" class="h-44 object-contain" /> -->

<SlideFooter>Quelle: Lipschutz & Lipson (1997)</SlideFooter>


---


# Nachbarschaft

- Die Nachbarschafts-Matrix zeigt, welche Knoten in einem Graphen benachbart sind.
  - 1 heisst, es gibt eine Kante zwischen zwei Knoten (z.B. von *a* nach *b*)
  - 0 heisst, es gibt keine Kante (z.B. zwischen a und d)
- Zusätzlich können die Kanten auch gewichtet werden (Durchquerungs-Kosten oder –Zeiten)
  - Im Beispiel sind die Gewichte symmetrisch (von *a* nach *b* kostet 80, von *b* nach *a* kostet auch 80)
  - Gewichte könnten auch asymmetrisch sein (von *d* nach *e* kostet 200, von *e* nach *d* kostet 225)


<!-- <img src="/AGI_HS25_Netzwerk1/_page_16_Figure_8.jpeg" class="h-36 object-contain mb-2" />
<img src="/AGI_HS25_Netzwerk1/_page_16_Figure_12.jpeg" class="h-36 object-contain" /> -->

---
layout: two-cols
---

# Pfade durch Graphen

- Reisezeiten können auch über die direkte Nachbarschaft hinaus in einer Matrix angegeben werden.
  - Picton → Dunedin: 5.00 + 2.10 + 2.50 = **10.0**

::right::

<img src="/AGI_HS25_Netzwerk1/_page_17_Figure_8.jpeg" class="h-96 object-contain" />

<SlideFooter>Quelle: kiwiway.com</SlideFooter>

---
layout: two-cols
---

# Königsberger Brücken 1736

**Aufgabe (3:00)**

Zeichne einen Pfad durch das Netzwerk rechts, sodass alle Kanten genau einmal durchquert werden.

::right::

<img src="/AGI_HS25_Netzwerk1/_page_18_Picture_7.jpeg" class="h-80 object-contain" />

---
layout: zusammenfassung
---

# Zusammenfassung

- Netzwerkdaten werden in GIS verwendet zur Modellierung von Nachbarschaft, Konnektivität und Zentralität.
- Anwendungsbereiche reichen von der Analyse von Verkehrsnetzen, über die Gewässerkunde bis hin zum Geomarketing.
- Die Grundlagen der Netzwerkanalyse beruhen auf der mathematischen Disziplin der Graphentheorie.
- Graphen bestehen aus Knoten und den sie verbindenden Kanten.

---

<Inhalt :active="3" />

---
layout: image
image: /AGI_HS25_Netzwerk1/_page_21_Picture_0.jpeg
---

---
layout: two-cols-header
---

# Zentralitätsmasse

Masse zur Beschreibung der relativen Wichtigkeit («Zentralität») eines Knotens in einem Graphen resp. Netzwerk.

::left::

- **Anwendungen**
  - Verkehrsknoten
  - Soziale Netzwerke (influencer...)
- **Wir betrachten vier Zentralitätsmasse**
  - Degree Centrality
  - Closeness Centrality
  - Betweenness Centrality
  - Straightness Centrality

::right::

![](/AGI_HS25_Netzwerk1/_page_22_Picture_15.jpeg)


---
layout: two-cols-header
---

# Zentralitätsmasse: Degree centrality

Entspricht dem Knotengrad im ungerichteten Graphen, d.h. der Anzahl Kanten, die am Knoten zusammenlaufen.

::left::

![](/AGI_HS25_Netzwerk1/_page_23_Picture_6.jpeg)

::right::

![](/AGI_HS25_Netzwerk1/_page_23_Picture_7.jpeg)

---

# Zentralitätsmasse: Closeness centrality

Misst wie nahe ein Knoten an allen anderen Knoten im Netzwerk liegt, entlang der kürzesten Pfade durch das Netzwerk.

$$C_{i}^{C} = \frac{N-1}{\sum_{j=1: j \neq i}^{N} d_{ij}}$$

- *N* Anzahl Knoten im Netzwerk
- *dij* Distanz des kürzesten Pfads zwischen Knoten *i* und *j*



<img src="/AGI_HS25_Netzwerk1/_page_24_Figure_9.jpeg" class="h-80 object-contain" />

---
layout: two-cols-header
---

# Zentralitätsmasse: Betweenness centrality

::left::

- Misst wie oft ein Knoten von allen kürzesten Pfaden zwischen allen Knotenpaaren im Netzwerk durchquert wird.
- Zeigt welche Knoten im Netzwerk die wichtigen Brücken- resp. Verbindungsknoten sind.

$$C_i^B = \frac{1}{(N-1)(N-2)} \sum_{j=1; k=1; j \neq k \neq i}^{N} \frac{n_{jk}(i)}{n_{jk}}$$

- *N* Anzahl Knoten, *njk* Anzahl kürzeste Pfade zwischen *j* und *k*, *njk(i)* davon durch *i*

::right::

<img src="/AGI_HS25_Netzwerk1/_page_25_Figure_11.jpeg" class="h-80 object-contain" />

---
layout: two-cols-header
---

# Zentralitätsmasse: Straightness centrality

::left::

- Misst wie stark alle kürzesten Pfade von einem Knoten zu allen anderen Knoten von der Luftlinienverbindung (Euklidische Distanz) abweicht.
- «Wie direkt (sprich geradeaus) kann ein Knoten erreicht werden?»

$$C_i^S = \frac{1}{N-1} \sum_{j=1, j \neq i}^{N} \frac{d_{ij}^{Eucl}}{d_{ij}}$$

- $d_{ij}^{Eucl}$ Euklidische Distanz zwischen Knoten *i* und *j*
- $d_{ij}$ kürzester Pfad zwischen Knoten *i* und *j*

::right::

<img src="/AGI_HS25_Netzwerk1/_page_26_Figure_10.jpeg" class="h-80 object-contain" />

---

# Vergleich der Zentralitätsmasse

<img src="/AGI_HS25_Netzwerk1/_page_27_Figure_5.jpeg" class="h-80 object-contain mx-auto" />

---
layout: two-cols-header
---

# Kurze Kontext-Aufgabe

## Aufgabe (5 Min)

«Welche GIS-Techniken, die Du kennst, haben die Autoren im Paper verwendet?»


---

<Inhalt :active="4" />

---
layout: image
image: /AGI_HS25_Netzwerk1/_page_30_Picture_0.jpeg
---

---


# QGIS

- Professionelle GIS-Anwendung auf Basis von Free/Open-Source-Software (GNU License)
- Läuft unter Linux, Unix, Mac OSX, Windows und Android
- Unterstützt viele Vektor-, Raster- und Datenbankformate
- Kompatibel mit PostGIS, GRASS GIS, und MapServer
- Entwickelt von Freiwilligen aus Industrie und Forschung (qgis.org)
- Unzählige Plugins zur Geodatenverarbeitung

::right::


---

# QGIS vs. ArcGIS

| | QGIS | ArcGIS |
|----|------|--------|
| Kosten | gratis | teuer |
| Betriebssysteme | Linux, Unix, Mac OSX, Windows, Android | nur Windows |
| Datenformate | viele unterschiedliche Formate | proprietäre Datenformate |
| Benutzerfreundlichkeit | z.T. noch umständlich | ausgereift, in ArcGIS Pro noch besser |
| Dokumentation | o.k., aber nicht grossartig | sehr gut und ausführlich |
| Vielseitigkeit | über unzählige Plugins (v.a. Vektordaten) | breites Angebot an Tools |
| Geschwindigkeit | lädt und rechnet schneller | — |
| 3D | es gibt ein Plugin… | deutlich besser, v.a. ArcGIS Pro |

---
layout: 
  - two-cols-header
---

# Und was sagt ChatGPT?

*"Please write a comparison between ESRI ArcGIS Pro and QGIS, with 6-8 strengths and weaknesses of both platforms."*

::left::

<small>

**ArcGIS Pro (Esri)**

**Strengths**
- Enterprise integration with ArcGIS Online/Enterprise
- Highly polished interface & cartography tools
- Extensive analytical toolboxes (Spatial, Network, 3D, Image
- Strong data editing, topology, versioning
- Excellent 3D and imagery workflows
- Robust performance and stability
- Professional support, training, and documentation



</small>

::right::

<small>

**QGIS (Open Source)**

**Strengths**
- Free and open-source (no licensing fees)
- Cross-platform (Windows, macOS, Linux)
- Broad format support (via GDAL/OGR)
- Rich plugin ecosystem (SAGA, GRASS, Mergin, etc.)
- Strong cartographic flexibility
- Powerful Python automation (PyQGIS)
- Transparent development and active community



</small>


---
layout: two-cols-header
---



::left::

<small>

**ArcGIS Pro (Esri)**

**Weaknesses**
- High cost (licenses + extensions)
- Windows-only environment
- Vendor lock-in (proprietary formats/services)
- Some tools require paid extensions
- Closed ecosystem limits transparency
- Limited collaboration without ArcGIS Online

</small>

::right::


<small>

**QGIS (Open Source)**

**Weaknesses**
- No unified enterprise environment (DIY integrations)
- Slower with very large datasets
- 3D and imagery less advanced than ArcGIS Pro
- Plugin quality varies
- Limited official technical support
- Complex setup for enterprise-level workflows

</small>

---
layout: zusammenfassung
---

# Zusammenfassung

- Zentralitätsmasse beschreiben die relative Wichtigkeit («Zentralität») eines Knotens in einem Graphen resp. Netzwerk.
- Merken Sie sich v.a. die closeness centrality und die betweenness centrality.
- QGIS ist *die* open source Alternative zu kommerziellen GIS-Softwaren wie ArcGIS oder ArcGIS Pro. Wer sich bereits mit ArcGIS auskennt, kommt schnell rein in die Verwendung von QGIS.

---
layout: two-cols
---

# Praktischer Teil

- **Gruppenarbeit** Zentralitätsmasse für einen einfachen Graphen selber berechnen.
- **Übungen mit QGIS** Zentralitätsmasse für OSM-Strassendaten von Wädenswil mit QGIS berechnen.

::right::

<img src="/AGI_HS25_Netzwerk1/_page_36_Picture_8.jpeg" class="h-48 object-contain mb-2" />
<img src="/AGI_HS25_Netzwerk1/_page_36_Figure_9.jpeg" class="h-48 object-contain" />

---
layout: two-cols-header
---

# Praktischer Teil

**Gruppenarbeit** Zentralitätsmasse für einen einfachen Graphen selber berechnen.

::left::

1. Bildet Gruppen mit Nachbarn
2. Tragt Euch ein in der Liste
3. Bearbeitet Euer Google Spreadsheet

::right::

<img src="/AGI_HS25_Netzwerk1/_page_37_Figure_10.jpeg" class="h-48 object-contain mb-2" />
<img src="/AGI_HS25_Netzwerk1/_page_37_Figure_11.jpeg" class="h-48 object-contain" />

---


# Lesematerial & Literatur

- Wang, F., Antipova, A., & Porta, S. (2011). Street centrality and land use intensity in Baton Rouge, Louisiana. *Journal of Transport Geography*, **19**(2), 285-293.
- Heywood, I., Cornelius, S., & Carver, S. (2011). An introduction to GIS. Pearson Education, Kapitel zu Network Analysis, Seiten 218-219.
- Big Data Analytics by Anuradha Bhatia: https://www.youtube.com/watch?v=ptqt2zr9ZRE


---
layout: two-cols-header
---

# Königsberger Brücken 1736

«Gibt es einen Rundweg, bei dem man alle sieben Brücken der Stadt über den Pregel genau einmal überquert und wieder zum Ausgangspunkt gelangt?»

::left::

**Eulers Überlegungen:**
1. Knoten stehen für Landregionen, Kanten für Brücken.
2. Ausser am Start und am Ende muss ein solcher Pfad auf einer Kante in einen Knoten und auf einer Kante wieder hinausführen.
3. Die Knotengrade der Knoten müssten alle gerade sein — sie sind aber alle ungerade.
4. D.h. es kann keinen derartigen Pfad geben.


::right::

![](/AGI_HS25_Netzwerk1/_page_39_Picture_11.jpeg)

![](/AGI_HS25_Netzwerk1/_page_39_Picture_12.jpeg)

---


# Kurze Kontext-Aufgabe — Lösung

**Welche GIS-Techniken haben die Autoren im Paper verwendet?**

- Vektor zu Raster-Umwandlung (District Choroplethen-Karten zu Dichtenkarten)
- Fokale Operation: KDE Kernel density estimation
- Map algebra (Verrechnen von Layern):
  *combined density = employment density + population density × LPR*

::right::

