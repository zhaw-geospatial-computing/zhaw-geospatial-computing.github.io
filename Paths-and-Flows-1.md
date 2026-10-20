---
theme: default
title: Path and Flows 1
favicon: /favicon.png
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
  - Gruppenübung
  - R-Übungen
---

<!-- title slide: content is defined in frontmatter -->

<!--
Begrüssung. Dieser Block begleitet die Studierenden über drei Wochen in die Netzwerkanalyse als weiteren Anwendungsbereich der Geoinformatik.

**Flipped Classroom**: Die Studierenden sollten die Leseaufgaben vorgängig erledigt haben – die Lehrveranstaltung funktioniert nur mit vorgängiger Lektüre. Darauf explizit hinweisen.

**Struktur heute**: Theory Recap (Screencast), dann Frage-Antwort-Session, Gruppenarbeit (Zentralitätsmasse selber berechnen) und QGIS-Übungen.
-->

---
layout: lernziele
---

# Lernziele

- Sie kennen 3-4 **Anwendungsbereiche** von Netzwerk-Geodaten und können dabei in eigenen Worten erklären, welchen Nutzen die Verwendung von Netzwerkdaten in besagten Anwendungen haben.
- Sie sind in der Lage einfache **Graphen** mit gegebenen Eigenschaften selber zu skizzieren.
- Sie sind in der Lage drei verschieden **Zentralitätsmasse** von Netzwerken/Graphen in eigenen Worten zu erklären und für einfache Graphen zu berechnen.
- Sie können einfache Vektordaten in QGIS **laden** und **editieren**
- Sie können einfache **Berechnungen** von Zentralitätsmassen in QGIS ausführen.

<!--
Fünf Lernziele kurz durchgehen, nicht im Detail erklären – sie dienen als Orientierungsrahmen für die Studierenden.
-->

---

# Zeitplan heute

| Zeitplan | Was | Form |
|----------|-----|------|
| 13:00 – 13:45 | **Theorie** Graphentheorie und Zentralität | Theorie-Recap |
| 14:00 – 15:00 | **Gruppenarbeit** Zentralitätsmasse selber berechnen | Gruppenarbeit in 3er/4er Gruppen |
| 15:10 – 16:35 | **QGIS-Übung** Zentralitätsmasse mit QGIS berechnen für Wädenswil | Übungen, betreute Einzelarbeit |

<!--
**Ablauf**: Zuerst Theory Recap (Screencast oder hier präsentiert), dann kurze Frage-Antwort-Session und Einleitung in die Übungen. Anschliessend Gruppenarbeit in 3er-/4er-Gruppen, zum Schluss betreute Einzelarbeit an QGIS-Übungen.
-->

---

<Inhalt :active="1" />



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

<!--
Netzwerken sind die Studierenden bereits begegnet – im GIS-Basiskurs (4./5. Semester) bei topologischen Räumen.

- **ÖV-Karten**: Liniennetzpläne = topologische Räume – Verbindungen zwischen Haltestellen zählen, nicht geografische Distanz.
- **Pfadberechnungen**: Kürzester Weg von A nach B (z.B. Google Maps) – wird in der nächsten Woche vertieft.
- **Gewässernetze**: Abflussmodellierung – wie fliesst Wasser durch ein Netzwerk aus Flüssen und Seen? Dazu braucht man ein Netz aus Knoten und Kanten.
-->

---

# Routensuche: Fahrplanabfrage SBB

![](/AGI_HS25_Netzwerk1/_page_6_Figure_5.jpeg)

<!--
Die SBB-Fahrplanabfrage ist ein klassisches Beispiel für Netzwerkanalyse im ÖV. Die Verbindungen werden als Graph modelliert, der kürzeste (schnellste) Pfad durch das Netz berechnet.
-->

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

<!--
Zwei weitere Anwendungsbereiche von Netzwerkanalyse im Alltag:

- **Uber/notime**: Wenn man ein Fahrzeug anfordert, berechnet die App, welches Fahrzeug am schnellsten vor Ort sein kann – unter Berücksichtigung von Einbahnstrassen, Höchstgeschwindigkeiten und aktueller Verkehrslage.
- **Dispatching Schutz & Rettung**: In der Einsatzzentrale werden Ambulanzen und Notärzte möglichst schnell zu Unfallstellen geschickt. Auch das läuft über Netzwerkanalysen auf einem Strassengraphen.
-->

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

<!--
Drei weitere Anwendungen von Einzugsgebiets-Analysen über Netzwerke:

- **Walkalytics** (live demo möglich): Tool berechnet, wie weit man in z.B. 15 Minuten zu Fuss von einem Startpunkt kommt. Wichtig: Die Zonen erstrecken sich entlang von Verkehrsachsen weiter aus, weil man dort schneller vorankommt.
- **Reisezeiten per ÖV**: Einzugsgebiet einer Stadt in 20/40/60 Minuten – räumlich sehr heterogen je nach ÖV-Erschliessung.
- **Geomarketing**: Wie viele Einwohner können eine neue Filiale innerhalb von 5–10 Minuten zu Fuss erreichen? Standortplanung für Grossverteiler und andere Firmen.
-->

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

<!--
NIS = Netzwerk-Informations-Systeme: Werden für Versorgungsinfrastrukturen eingesetzt, z.B. Stromnetze. Die Firma NIS.ch entwickelt auf Basis von Smallworld GIS (GE Grid Solutions) Applikationen zur Verwaltung und Analyse solcher Netze. Ein weiterer Bereich, wo Netzwerktopologie und GIS eng verknüpft sind.
-->

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

<!--
Die Graphentheorie ist die mathematische Grundlage der Netzwerkanalyse. Die Begriffe Knoten (nodes) und Kanten (edges/arcs) haben die Studierenden schon im GIS-Basiskurs kennengelernt – «Arc» in ArcGIS bezieht sich genau auf diese Kante. Jetzt werden ein paar weitere Konzepte ergänzt: Grade von Knoten, Nachbarschaft, Pfade und Zentralitätsmasse.
-->

---
class: text-sm
---

# Graphen-Typen

| | Typ | Beschreibung | Anwendung |
|:---:|-----|-------------|-----------|
| <img src="/graph-types/zyklisch.png" class="h-14 object-contain" /> | zyklisch | Zyklus ist ein Pfad, bei dem erster und letzter Knoten identisch sind | Verkehrsnetze |
| <img src="/graph-types/gerichtet.png" class="h-14 object-contain" /> | gerichtet | Kanten sind gerichtet, können nur in einer Richtung durchquert werden | Strassennetz mit Einbahnstrassen |
| <img src="/graph-types/gewichtet.png" class="h-14 object-contain" /> | gewichtet | Kanten oder Knoten haben Gewichte resp. Durchquerungs-Kosten | Höchstgeschwindigkeiten pro Kante, Maut pro Kante, Höhenmeter |
| <img src="/graph-types/planar.png" class="h-14 object-contain" /> | planar | Graphen, die auf einer Ebene abgebildet werden können, ohne dass ihre Kanten sich schneiden | Im planaren Strassennetz kreuzen alle Kanten in Knoten |
| <img src="/graph-types/hierarchisch.png" class="h-14 object-contain" /> | hierarchisch | Ein Graph ohne Zyklen | Baumstrukturen zur Indizierung von Geodaten (quadtree, R-tree) |

<SlideFooter>Quelle: gitta.info</SlideFooter>

<!--
Fünf Graphen-Typen kurz erklären:

- **Zyklisch**: Zyklus = Pfad, bei dem erster und letzter Knoten identisch sind (geschlossener Kreis). Typisch in Verkehrsnetzen.
- **Gerichtet**: Kanten haben eine Richtung (Pfeil). Können nur in einer Richtung durchquert werden. Anwendung: Einbahnstrassen. Eine gerichtete Kante hat auch eine linke und rechte Seite.
- **Gewichtet**: Kanten (oder Knoten) haben Gewichte (dargestellt z.B. durch Strichdicke). Können Personenflows, Geschwindigkeiten, Kosten oder Maut darstellen.
- **Planar**: Kann auf einer Ebene abgebildet werden, ohne dass Kanten sich kreuzen. Im planaren Strassennetz kreuzen sich Kanten nur in Knoten. Nicht-planar: Brücke über eine Strasse (Kante kreuzt ohne Knoten). Denkaufgabe: Welcher der abgebildeten Graphen ist planar, welcher nicht?
- **Hierarchisch** (Bäume): Graph ohne Zyklen. Baumstrukturen werden zur Indizierung von Geodaten verwendet (Quadtree, R-Tree – aus dem Datenbankmodul bekannt).
-->

---
layout: two-cols
---

# Knotengrade

**im ungerichteten Graph**

- Knotengrad: Anzahl Kanten, die am Knoten zusammenlaufen
- Loops (wie in B) werden **2 mal** gezählt.

::right::

<img src="/graph-types/knotengrad-ungerichtet.png" class="h-80 object-contain" />

<SlideFooter>Quelle: Lipschutz & Lipson (1997)</SlideFooter>

<!--
Knotengrad = Anzahl Kanten am Knoten. Loops zählen doppelt.
Beispielwerte: A = 3, D = 3, C = 2, B = 6 (höchster Grad).
-->

---
layout: two-cols
---

# Knotengrade

**im gerichteten Graph**

- **indegree**: Anzahl gerichteter Kanten, die im Knoten enden
- **outdegree**: Anzahl gerichteter Kanten, die am Knoten starten
- $\sum$ indegree = $\sum$ outdegree = 7
- Quellen und Senken
  - **Quelle** (source): Knoten mit indegree = 0
  - **Senke** (sink): Knoten mit outdegree = 0
  - C ist eine Senke, Quellen hat es keine

::right::

<img src="/graph-types/knotengrad-gerichtet.png" class="h-80 object-contain" />

<SlideFooter>Quelle: Lipschutz & Lipson (1997)</SlideFooter>

<!--
In-Degree: Kanten, die reinkommen. Out-Degree: Kanten, die rausgehen.
- A: indegree = 2, outdegree = 1
- D: indegree = 1, outdegree = 2
- C: indegree = 2, outdegree = 0 → Senke (sink)
- B: indegree = 2, outdegree = 4 ← Studierende sollen B selber berechnen

Wichtige Regel: ∑ indegree = ∑ outdegree. Probe: 2+2+2+1 = 7, 1+4+0+2 = 7 ✓
-->


---
{}
---

# Adjazenzmatrix

Die Adjazenzmatrix zeigt, welche Knoten in einem Graphen benachbart sind.

- **1** = Kante vorhanden (z.B. von *a* nach *b*)
- **0** = keine Kante (z.B. *a* nach *d*)
- Diagonale (grün): Knoten mit sich selbst

<div class="flex gap-2 items-center justify-center mt-4">
  <img src="/graph-types/adjazenz-graph.png" class="h-48 object-contain" />
  <img src="/graph-types/adjazenz-matrix.png" class="h-48 object-contain" />
</div>

<!--
Die **Adjazenzmatrix** gibt an, welche Knoten verbunden sind:
- 1 = Kante vorhanden, 0 = keine Kante
- Beispiel: a→b: 1, a→c: 1, a→d: 0, a→e: 0
- Die Matrix ist symmetrisch (ungerichteter Graph): M[i,j] = M[j,i]
-->

---


# Adjazenzmatrix (gewichtet)

Kanten können auch **Gewichte** tragen (Kosten, Zeiten, Kapazitäten).

- Statt 0/1 stehen die Gewichte in der Matrix.
- **Symmetrisch**: von *a* nach *b* = von *b* nach *a*
- **Asymmetrisch**: z.B. Einbahnstrassen oder unterschiedliche Reisezeiten je Richtung


<div class="flex gap-2 items-center justify-center h-full">
  <img src="/graph-types/adjazenz-graph-gewichtet.png" class="h-64 object-contain" />
  <img src="/graph-types/adjazenz-matrix-gewichtet.png" class="h-64 object-contain" />
</div>

<!--
**Gewichtete Adjazenzmatrix**: Statt 0/1 stehen die Kantengewichte in der Matrix.
- Diagonale = 0 (keine Selbst-Verbindungen im gewichteten Graph)
- Symmetrisch bei ungerichtetem Graph: M[i,j] = M[j,i]
- Asymmetrisch bei gerichtetem Graph: Hin- und Rückweg können unterschiedliche Kosten haben
-->

---
{}
---

# Pfade durch Graphen

- Reisezeiten können auch über die direkte Nachbarschaft hinaus in einer Matrix angegeben werden.
- Picton → Dunedin: 5.00 + 2.10 + 2.50 = **10.0**


<div class="flex gap-2 items-start justify-center h-full">
  <img src="/nztraveltimes-map.jpg" class="h-80 object-contain" />
  <img src="/nztraveltimes.jpg" class="h-80 object-contain" />
</div>

<SlideFooter>Quelle: kiwiway.com</SlideFooter>

<!--
Neuseeland als anschauliches Beispiel: Das Strassennetz ist einfach aufgebaut, aber die Strassen sind sehr kurvig – die Reisezeiten sind daher viel länger als die Luftlinie vermuten lässt. Deshalb gibt es dort gedruckte Reisezeitmatrizen.

**Beispielrechnung**: Picton → Dunedin über drei Kanten:
- Picton → Christchurch: 5:00 h
- Christchurch → Timaru: 2:10 h
- Timaru → Dunedin: 2:50 h
- **Total: 10:00 h**

Diese Art von Reisezeitmatrix kennen die Studierenden vielleicht von Strassenkarten – jetzt sehen sie, wie sie durch Aufsummieren von Kanten entsteht.
-->

---

# Königsberger Brücken 1736

**Aufgabe (3:00)**

*Gibt es einen Runweg, bei dem man alle Sieben Brücken der Stadt genau einmal überquert und man wieder zum Ausgangspunkt gelangt?*

<div class="flex gap-2 items-start justify-center h-full">
  <img src="/Bridges_of_Konigsberg.png" class="h-80 object-contain" />
  <CountdownTimer :minutes="3" />
</div>

<!--
**Königsberger Brücken** (1736): Euler hat sich gefragt, ob man einen Pfad durch die Stadt Königsberg zeichnen kann, bei dem alle sieben Brücken GENAU EINMAL überquert werden. Denkt: Das-ist-das-haus-vom-Nikolaus

Landregionen = Knoten, Brücken = Kanten. Studierende haben ~3 Minuten Zeit, es selber auszuprobieren.

**Spoiler (erst auf der nächsten Folie zeigen)**: Es ist unmöglich – weil alle Knotengrade ungerade sind.
-->


---

# Königsberger Brücken 1736

1. Knoten stehen für Landregionen, Kanton für Brücken
2. Ausser am Start und am Ende muss ein solcher Pfad auf einer Kante in einen Knoten und auf einer Kante wieder hinausführen
3. Sprich: Die Knotengrade der Knoten müsste überall  *gerade* sein
4. Sie sind aber ungerade, es kann also kein derartigen Pfad geben


<img src="/koenigsberg.jpg" class="h-80 object-contain" />






---
layout: zusammenfassung
---

# Zusammenfassung

- Netzwerkdaten werden in GIS verwendet zur Modellierung von Nachbarschaft, Konnektivität und Zentralität.
- Anwendungsbereiche reichen von der Analyse von Verkehrsnetzen, über die Gewässerkunde bis hin zum Geomarketing.
- Die Grundlagen der Netzwerkanalyse beruhen auf der mathematischen Disziplin der Graphentheorie.
- Graphen bestehen aus Knoten und den sie verbindenden Kanten.

<!--
Ende des ersten Teils (Screencasts 1). Kurze Zusammenfassung der wichtigsten Punkte bevor Übergang zu Zentralitätsmassen.
-->

---

<Inhalt :active="3" />

---
layout: image
image: /AGI_HS25_Netzwerk1/_page_21_Picture_0.jpeg
---

<!-- Einstieg mit einem Alltagsbeispiel: Der Platz «Das Zentral» in Zürich heisst nicht zufällig so – er ist tatsächlich sehr zentral. Aber kann man das mathematisch berechnen? Ja – genau das machen Zentralitätsmasse. -->


---
layout: two-cols-header
---

# Zentralitätsmasse

Masse zur Beschreibung der relativen Wichtigkeit («Zentralität») eines Knotens in einem Graphen resp. Netzwerk.

::left::

- **Anwendungen**
  - Verkehrsknoten
  - Soziale Netzwerke ([influencer](https://likeometer.co/weltweit/alle/)...)

- **Wir betrachten vier Zentralitätsmasse**
  - Degree Centrality
  - Closeness Centrality
  - Betweenness Centrality
  - Straightness Centrality

::right::

![](/AGI_HS25_Netzwerk1/_page_22_Picture_15.jpeg)

<!--

Zweites Motivationsbeispiel: **Influencer in sozialen Netzwerken** – Influencer sind Personen, die mit sehr vielen anderen verbunden sind. In der Schweiz gibt es den «Leikometer» als Ranking. Je nach verwendetem Zentralitätsmass kommt man zu unterschiedlichen Ergebnissen.

**Vier Masse** werden besprochen: Degree, Closeness, Betweenness, Straightness Centrality. Alle vier werden auch im Paper von Wang et al. (2011) verwendet.
-->

---
layout: two-cols-header
---

# Zentralitätsmasse: Degree centrality

Entspricht dem Knotengrad im ungerichteten Graphen, d.h. der Anzahl Kanten, die am Knoten zusammenlaufen.

::left::

![](/graph-types/knotengrad-ungerichtet.png)

::right::

![](/AGI_HS25_Netzwerk1/_page_23_Picture_7.jpeg)

<!--
**Degree Centrality** ist das einfachste Mass – es entspricht direkt dem Knotengrad (Anzahl Kanten).

Beispielwerte aus dem vorherigen Graphen: B (Grad 6, höchste Zentralität) > A und D (je 3) > C (2, tiefste Zentralität).

Im Netzwerk-Visualisierungsbeispiel: Das dichte Netzwerk unten hat viele Knoten mit hohem Grad – hohe Degree Centrality. An der Peripherie ist sie deutlich tiefer.
-->

---
layout: two-cols-header
---

# Zentralitätsmasse: Closeness centrality

Misst wie nahe ein Knoten an allen anderen Knoten im Netzwerk liegt, entlang der kürzesten Pfade durch das Netzwerk.
$N$ Anzahl Knoten im Netzwerk,  $d_{ij}$ Distanz des kürzesten Pfads zwischen Knoten $i$ und $j$

$$C_{i}^{C} = \frac{N-1}{\sum_{j=1: j \neq i}^{N} d_{ij}}$$



::right::

![](/AGI_HS25_Netzwerk1/closeness-a.jpeg)

::left::

![](/AGI_HS25_Netzwerk1/closeness-b.jpeg)



<!--
**Closeness Centrality** schaut nicht nur auf direkte Nachbarn, sondern berechnet für jeden Knoten die Summe aller kürzesten Pfade zu allen anderen Knoten im Netzwerk. Je kleiner die Summe, desto zentraler.

Das Beispiel zeigt eine amerikanische Stadt (LA?): Der CBD (Central Business District) hat die höchste Closeness Centrality, weil von dort die Wege zu allen anderen Punkten im Schnitt am kürzesten sind. Im selben Graphen wie bei Degree Centrality liegen die höchsten Werte nun im Zentrum des Netzwerks – ein anderes Bild als bei Degree.
-->

---
layout: two-cols-header
---

# Zentralitätsmasse: Betweenness centrality

- Misst wie oft ein Knoten von allen kürzesten Pfaden zwischen allen Knotenpaaren im Netzwerk durchquert wird.
- Zeigt welche Knoten im Netzwerk die wichtigen Brücken- resp. Verbindungsknoten sind.
- $N$ Anzahl Knoten, $n_{jk}$ Anzahl kürzeste Pfade zwischen $j$ und $k$, $n_{jk}(i)$ davon durch $i$

<span class="block text-center text-xl mt-2">$C_i^B =$ <span v-mark.circle.orange="1" class="px-3 py-4">$\dfrac{1}{(N-1)(N-2)}$</span> $\displaystyle\sum_{j=1;\, k=1;\, j \neq k \neq i}^{N} \dfrac{n_{jk}(i)}{n_{jk}}$</span>

::left::

![](/AGI_HS25_Netzwerk1/betweenness-a.jpeg)

::right::

![](/AGI_HS25_Netzwerk1/betweenness-b.jpeg)

<!--
**Zur Normierung $\frac{1}{(N-1)(N-2)}$:**

$(N-1)(N-2)$ ist die maximale Anzahl geordneter Knotenpaare $(j, k)$, die den Knoten $i$ nicht enthalten: $j$ kann einer der $N-1$ anderen Knoten sein, $k$ einer der verbleibenden $N-2$ Knoten (ohne $i$ und $j$).

Die rohe Summe $\sum \frac{n_{jk}(i)}{n_{jk}}$ erreicht ihr Maximum $(N-1)(N-2)$ nur dann, wenn Knoten $i$ auf *jedem* kürzesten Pfad zwischen *jedem* anderen Knotenpaar liegt. Die Division durch diesen Maximalwert ergibt einen Wert zwischen 0 und 1.

Ohne Normierung würde ein Knoten in einem grossen Netzwerk allein durch die grössere Anzahl von Paaren immer höher abschneiden als ein gleich zentraler Knoten in einem kleineren Netzwerk. Der Faktor macht die Betweenness Centrality netzwerkübergreifend vergleichbar.
-->

---
layout: two-cols
---

::left::

![](/AGI_HS25_Netzwerk1/betweenness-a.jpeg)

::right::

![](/AGI_HS25_Netzwerk1/betweenness-b.jpeg)


<!--
**Betweenness Centrality**: Zuerst werden ALLE kürzesten Pfade zwischen ALLEN Knotenpaaren berechnet. Dann wird für jeden Knoten gezählt, wie viele dieser kürzesten Pfade ihn durchqueren.

Ergebnis: Nur wenige Knoten haben sehr hohe Werte – das sind die eigentlichen «Brücken-» oder «Schlüsselknoten» im Netzwerk. Im Strassennetzbeispiel zeigen sich 1–2 Verbindungsachsen, die von sehr vielen kürzesten Pfaden genutzt werden. Fällt diese Verbindung aus, bricht das Netz zusammen.

Das Bild ist nochmals ganz anders als bei Degree oder Closeness Centrality.
-->

---
layout: two-cols-header
---

# Zentralitätsmasse: Straightness centrality

::left::

- Misst wie stark alle kürzesten Pfade von einem Knoten zu allen anderen Knoten von der Luftlinienverbindung (Euklidische Distanz) abweicht.
- «Wie direkt (sprich geradeaus) kann ein Knoten erreicht werden?»
- $d_{ij}^{Eucl}$ Euklidische Distanz zwischen Knoten $i$ und $j$, $d_{ij}$ kürzester Pfad zwischen Knoten $i$ und $j$
$$C_i^S = \frac{1}{N-1} \sum_{j=1, j \neq i}^{N} \frac{d_{ij}^{Eucl}}{d_{ij}}$$



::right::

<img src="/AGI_HS25_Netzwerk1/_page_26_Figure_10.jpeg" class="h-80 object-contain" />

<!--
**Straightness Centrality** misst, wie stark der kürzeste Netzwerkpfad von der direkten Luftlinie (euklidischen Distanz) abweicht. Ein Knoten hat eine hohe Straightness Centrality, wenn man ihn «geradeaus» erreichen kann.

Dieses Mass ist vor allem relevant bei schachbrettartigen Strassennetzen (USA) – in der Schweiz mit gewundenen Alpentälern und historisch gewachsenen Ortskernen ist es weniger aussagekräftig.
-->

---

# Vergleich der Zentralitätsmasse

<img src="/AGI_HS25_Netzwerk1/_page_27_Figure_5.jpeg" class="h-80 object-contain mx-auto" />

<!--
Alle vier Masse auf demselben Netzwerk – die Resultate sind ganz unterschiedlich. Das zeigt, dass «Zentralität» keine eindeutige Grösse ist, sondern davon abhängt, was man messen will.

Für uns besonders wichtig: **Closeness** und **Betweenness** Centrality – diese unbedingt merken (auch im Paper von Wang et al. verwendet).
-->




---
layout: zusammenfassung
---

# Zusammenfassung

- Zentralitätsmasse beschreiben die relative Wichtigkeit ("Zentralität") eines Knotens in einem Graphen resp. Netzwerk.
- Wichtig sind vor allem die *closeness* und die *betweenness* centrality

---
layout: two-cols-header
---

# Gruppenarbeit: Degree Centrality berechnen

- Bildet Gruppen zu 3–4 Personen mit Euren Nachbarn. 
- Berechnet *Degree Centrality* für den nachstehnden Graphen. 
- Zähle dazu für jeden Knoten die Anzahl Kanten, die in diesem Knoten zusammenlaufen. 

::left::

![](/AGI_HS25_Netzwerk1/mygraph.png)

::right::

<CountdownTimer :minutes="5" />

---
layout: two-cols-header
---

# Gruppenarbeit: Closeness Centrality berechnen

- Berechnet in den gleichen Gruppen die *Closeness Centrality* für den gleichen Graphen. 
- Ihr braucht dazu Excel o.ä. Darin müsst ihr folgende Schritte ausführen
  1. Erstellt eine Kreuzmatrix mit den Zeilen A bis H und Spalten A bis H
  2. Berechnet die Länge der kürzesten Pfade von jedem Knoten zu jedem anderen Knoten (alle Kanten L = 1)
  3. Berechnet die Summe dieser Längen pro Knoten
  4. Invertiert diesen Wert ($\frac{1}{x}$)


::left::

![](/AGI_HS25_Netzwerk1/mygraph.png)

::right::

<CountdownTimer :minutes="15" />



---
layout: two-cols-header
---

# Gruppenarbeit: Betweenness Centrality berechnen

- Berechnet jetzt die *Betweenness Centrality* für den gleichen Graphen <span v-mark.underline>nur für die Knoten B, C und F</span>
- Ihr braucht dazu Excel o.ä. Darin müsst ihr folgende Schritte ausführen: Für jedes Knotenpaar:
  1. Wie viele kürzeste Pfade gibt es? ($n_{jk}$)
  2. Wie viele davon verlaufen durch den untersuchten Knoten? ($n_{jk}(i)$)
  3. Berechne das Verhältnis ($\frac{n_{jk}(i)}{n_{jk}}$)
  4. Summiert alle Verhältnisse auf (auf die Normalisierung verzichten wir)

  

::left::

![](/AGI_HS25_Netzwerk1/mygraph.png)

::right::

<CountdownTimer :minutes="30" />

---


# Lesematerial & Literatur

- Wang, F., Antipova, A., & Porta, S. (2011). Street centrality and land use intensity in Baton Rouge, Louisiana. *Journal of Transport Geography*, **19**(2), 285-293.
- Heywood, I., Cornelius, S., & Carver, S. (2011). An introduction to GIS. Pearson Education, Kapitel zu Network Analysis, Seiten 218-219.
- Big Data Analytics by Anuradha Bhatia: https://www.youtube.com/watch?v=ptqt2zr9ZRE


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
