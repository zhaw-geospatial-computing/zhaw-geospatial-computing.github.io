---
theme: default
title: AGI HS25 Netzwerk2
transition: none
layout: cover
---

# Netzwerkanalysen II

<img src="/AGI_HS25_Netzwerk2/_page_0_Picture_3.jpeg" class="h-48 object-contain" />

BSc Umweltingenieurwesen Angewandte Geoinformatik

---

## Lernziele

<img src="/AGI_HS25_Netzwerk2/_page_1_Picture_4.jpeg" class="float-right h-40 ml-4" />

- Sie sind in der Lage 2–3 einfache klassische **Algorithmen** der Geodatenverarbeitung mit einfachen Skizzen einem Laien zu erklären
- Sie verstehen die Funktionsweise des **shortest path** Algorithmus nach Dijkstra als exemplarische Geodatenverarbeitungs-Routine auf Netzwerk-Geodaten.
- Sie erkennen den Nutzen und die entsprechende Bedeutung von Algorithmen in der Geodatenverarbeitung und erlangen ein einfaches Verständnis über die **Bewertung von Algorithmen** nach der „big-O"-Notation der komputationellen Komplexität.
- Sie sind in der Lage einfache Netzwerkanalysen (Streckenfindung, Routing) in **QGIS** mit gegebenen Werkzeugen der Netzwerk-Geodatenverarbeitung selbständig durchzuführen.

---

## Zeitplan heute

| Zeitplan | Was | Form |
|---|---|---|
| 13:00 – 13:45 | Theorie-Recap Algorithmen & Dijkstras kürzester Pfad | Vorlesung, Info Leistungsnachweise |
| 14:00 – 15:00 | Gruppenarbeit: Dijkstra selber rechnen | Gruppenarbeit in 3er/4er Gruppen |
| 15:10 – 16:35 | QGIS-Übung: Kürzeste Pfade mit QGIS berechnen für Wädenswil | Übungen, betreute Einzelarbeit |

---

## Inhalt

- **1. Anwendungen des kürzesten Pfads**
- 2. Algorithmen in GIS
  - 2.1 Grundlagen und Begriffe
  - 2.2 Einige Klassiker: Point-in-Polygon, MBR, Douglas-Peucker
- 3. Der kürzeste Pfad (*shortest path*) nach Dijkstra

<img src="/AGI_HS25_Netzwerk2/_page_4_Picture_0.jpeg" class="h-52 object-contain mt-4" />

---
layout: two-cols
---

## Anwendungen: Vehicle Routing

- Vehicle Routing
  - z.B. Uber
  - z.B. Dispatching Schutz & Rettung

::right::

<img src="/AGI_HS25_Netzwerk2/_page_5_Picture_6.jpeg" class="h-40 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_5_Figure_10.jpeg" class="h-40 object-contain mt-2" />

---
layout: two-cols
---

## Anwendungen: Einzugsgebiete

- Einzugsgebiete und nächste Einrichtung
  - Zentralitätsmasse («Gruppenarbeit 1»)
  - Reisezeiten (Netzwerkanalyse III)
  - Geomarketing und Immobilien-Bewertung

<small>Quellen: walkalytics.com, esri.ch</small>

::right::

<img src="/AGI_HS25_Netzwerk2/_page_6_Figure_10.jpeg" class="h-36 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_6_Figure_12.jpeg" class="h-36 object-contain mt-2" />

---
layout: two-cols
---

## Mehrere Stops (Travelling Salesperson Problem)

Reihenfolge für den Besuch mehrerer Knoten so wählen, dass:
- kein Knoten ausser des ersten mehr als einmal besucht wird,
- die gesamte Reisestrecke/-zeit möglichst kurz ist, und
- die erste Station gleich der letzten Station ist.

::right::

<img src="/AGI_HS25_Netzwerk2/_page_7_Figure_6.jpeg" class="h-64 object-contain" />

---
layout: two-cols
---

## z.B. Forschungsprojekt Gruppe Theo Smits, fürs BLW

Optimierung von Probenahme-Standorten für 2 Tage Feldkampagne

::right::

<img src="/AGI_HS25_Netzwerk2/_page_8_Figure_6.jpeg" class="h-72 object-contain" />

---

## Anwendungen des kürzesten Pfads – Übersicht

<div class="grid grid-cols-2 gap-4">
<div>

**Kürzester Pfad**
- Mehrere Stops (Travelling Salesperson Problem)
- Für unterschiedliche Reisemodi (Velo, Auto, Fussgänger), schön vs. schnell

**Nächste Einrichtung**
- Location-based services (LBS)
- LimeScooters

</div>
<div>

**Flotten-Optimierung**
- Multi-Vehicle Routing
- Flotten-Optimierung (Lieferdienst, Müllfahrzeuge)
- Mehrere Fahrzeuge möglichst wenig Weg

**Einzugsgebiete**
- Entlang des Netzwerkes
- Geomarketing

</div>
</div>

<div class="flex gap-2 mt-2">
<img src="/AGI_HS25_Netzwerk2/_page_9_Picture_8.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_9_Picture_19.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_9_Picture_20.jpeg" class="h-28 object-contain" />
</div>

---

## Inhalt

- 1. Anwendungen des kürzesten Pfads
- **2. Algorithmen in GIS**
  - 2.1 Grundlagen und Begriffe
  - 2.2 Einige Klassiker: Point-in-Polygon, MBR, Douglas-Peucker
- 3. Der kürzeste Pfad (*shortest path*) nach Dijkstra

---
layout: two-cols
---

## Was ist ein Algorithmus?

- Ein Algorithmus ist die Spezifikation des **Datenverarbeitungsprozesses**, welcher für eine bestimmte Operation nötig ist. ¹
- Ein Algorithmus ist ein **Verfahren** zur Problemlösung, das sich für eine **Implementierung** als Computerprogramm eignet. ²
- Algorithmen bestimmen oft auch, wie die an der Verarbeitung beteiligten Daten zu organisieren sind, d.h. in welchen **Datenstrukturen** sie abgelegt werden müssen. ²
- Bsp. Sortieren einer Liste

<small>¹ Worboys & Duckham (2004). GIS: a computing perspective.</small><br>
<small>² Sedgewick (2003). Algorithmen in Java.</small>

::right::

<img src="/AGI_HS25_Netzwerk2/_page_12_Picture_9.jpeg" class="h-72 object-contain" />

---

## Bubble-Sort vs. Merge-Sort

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

---
layout: two-cols
---

## Bubble-Sort vs. Merge-Sort

<img src="/AGI_HS25_Netzwerk2/_page_14_Picture_5.jpeg" class="h-64 object-contain" />

::right::

<img src="/AGI_HS25_Netzwerk2/_page_14_Figure_6.jpeg" class="h-64 object-contain" />

$$O(n\log_2(n))$$

---

## Algorithmische Komplexität («big O»)

- «big O»-Notation $O(f(n))$: Verhältnis zwischen Inputgrösse und Berechnungszeit
- Normalerweise wird das **«worst case»**-Verhalten angegeben.
- $O(n^2)$ in Praxis kaum brauchbar, ein Erfolg ist Reduktion auf $O(n \log n)$.

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

| Notation | Klasse | Beispiel |
|---|---|---|
| $O(1)$ | Constant | — |
| $O(\log n)$ | Logarithmic | Binary search |
| $O(n)$ | Linear | Linear search |
| $O(n \log n)$ | Sub-linear | Merge sort |
| $O(n^k)$ | Polynomial | Shortest path |
| $O(k^n)$ | Exponential | TSP |

</div>
</div>

---
layout: two-cols
---

## z.B. Sichtbarkeit entlang einer Strasse

- Berechne eine Sichtlinie zwischen allen Punktpaaren
- Zu rechenintensiv $O(n^2)$?

<img src="/AGI_HS25_Netzwerk2/_page_16_Picture_7.jpeg" class="h-48 object-contain mt-4" />

::right::

<img src="/AGI_HS25_Netzwerk2/_page_16_Picture_9.jpeg" class="h-80 object-contain" />

---
layout: two-cols
---

## Minimales umschreibendes Rechteck

Entwickle einen Algorithmus zur Bestimmung des kleinsten umschreibenden Rechtecks (**minimal bounding rectangle, MBR**) für ein Polygon gegeben als Liste all seiner Stützpunkte.

*Nimm Dir Zeit …*

Koordinaten-Beispiel:
- 2'529'500.0, 1'204'150.0
- 2'512'000.0, 1'175'150.0
- 2'496'500.0, 1'153'150.0
- 2'484'500.0, 1'110'650.0
- …

::right::

<img src="/AGI_HS25_Netzwerk2/_page_17_Picture_5.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_17_Figure_8.jpeg" class="h-44 object-contain mt-2" />

---
layout: two-cols
---

## Zusammenfassung (Teil 1)

<img src="/AGI_HS25_Netzwerk2/_page_18_Picture_5.jpeg" class="h-32 object-contain mb-4" />

- Der kürzeste Pfad bildet die Grundlage für viele **Mobilitäts-Anwendungen**: Routensuche, LBS, Reisezeiten, Versorgungsgebiete.
- **Algorithmen** sind Verfahren zur Problemlösung, die eng mit **Datenstrukturen** zusammenarbeiten.
- «big O»-Notation bezeichnet das Verhältnis zwischen Inputgrösse und Berechnungszeit.

::right::

## Algorithmische Geometrie

Teil der (Geo-)Informatik, welche die algorithmische Lösung von geometrischen Problemen untersucht.

- Gibt es überhaupt einen Algorithmus, der ein bestimmtes Problem lösen kann?
- Was ist der **effizienteste** Algorithmus?
  - bezüglich Rechenzeit?
  - bezüglich Speicherplatz?
- Wie werden die Daten am besten strukturiert (**Datenstruktur**)?

<img src="/AGI_HS25_Netzwerk2/_page_19_Picture_11.jpeg" class="h-36 object-contain mt-2" />

---
layout: two-cols
---

## Muddiest Points: Point-in-Polygon Test

**Halblinien-Algorithmus.** Prüfe, wie oft eine vom Punkt ausgehende Halblinie das Polygon schneidet.
- Gerade Anzahl Schnitte → ausserhalb
- Ungerade Anzahl Schnitte → innerhalb

**Aufwickel-Algorithmus.** Ein Betrachter bewegt sich gegen den Uhrzeigersinn auf dem Polygon. Wenn er nach einer Runde:
- eine komplette Drehung gemacht hat → P innerhalb
- sonst → P ausserhalb

Beide *O(n)*, mit *n* = Anzahl Kanten

::right::

<img src="/AGI_HS25_Netzwerk2/_page_20_Figure_12.jpeg" class="h-48 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_20_Figure_13.jpeg" class="h-48 object-contain mt-2" />

---
layout: two-cols
---

## Linienvereinfachung nach Douglas-Peucker

Vereinfachung der Linie unter Bewahrung der essentielle Form (z.B. kartographische Generalisierung)

1. Verbinde Start–Ende
2. Suche weitest entfernten Stützpunkt, splitte dort
3. Wiederhole **rekursiv** für alle Teile, bis *dist* unter Schwellenwert

**Rekursiver** Code ruft sich selber auf, meist in «verkleinerter Form», bis eine Abbruchbedingung erreicht ist.

::right::

<div class="grid grid-cols-2 gap-1">
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_6.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_11.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_12.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_13.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Picture_14.jpeg" class="h-28 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_21_Figure_15.jpeg" class="h-28 object-contain" />
</div>

---
layout: two-cols
---

## 3 Datenstrukturen für Netzwerkdaten

**Datenstruktur 1: Gelabelte Kanten**
Menge (set) von Kanten je mit Reisezeiten

**Datenstruktur 2: Nachbarschafts-Matrix**
Viel Redundanz

| | a | b | c | d | e | f | g | h |
|---|---|---|---|---|---|---|---|---|
| a | 0 | 20 | 0 | 0 | 0 | 0 | 15 | 0 |
| b | 20 | 0 | 8 | 9 | 0 | 0 | 0 | 0 |
| c | 0 | 8 | 0 | | 15 | | 0 | 10 |
| d | 0 | 9 | 6 | 0 | 7 | 0 | 0 | 0 |
| e | 0 | 0 | 15 | 7 | | | 18 | 0 |
| g | 15 | 0 | 0 | 0 | 18 | 0 | 0 | 0 |

**Datenstruktur 3: Nachbarschafts-Liste**
Kompromiss: nur Kanten mit Wert ≠ 0

::right::

<img src="/AGI_HS25_Netzwerk2/_page_22_Figure_9.jpeg" class="h-96 object-contain" />

---
layout: two-cols
---

## Systematisches Durchsuchen: Breadth-first vs. Depth-first

<img src="/AGI_HS25_Netzwerk2/_page_23_Figure_6.jpeg" class="h-40 object-contain" />

**Queue (Breadth-first)**
- FIFO: First in, first out
- Das Element was zuerst eingefügt wird, kommt auch zuerst wieder raus

**Stack (Depth-first)**
- LIFO: Last in, first out
- Elemente können nur von oben weggenommen (pop) bzw. draufgelegt (push) werden

::right::

<img src="/AGI_HS25_Netzwerk2/_page_23_Figure_8.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_23_Picture_23.jpeg" class="h-24 object-contain mt-2" />

<img src="/AGI_HS25_Netzwerk2/_page_23_Picture_26.jpeg" class="h-24 object-contain mt-2" />

---

## Systematisches Durchsuchen: Animiert

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

---

## Inhalt

- 1. Anwendungen des kürzesten Pfads
- 2. Algorithmen in GIS
  - 2.1 Grundlagen und Begriffe
  - 2.2 Einige Klassiker: Point-in-Polygon, MBR, Douglas-Peucker
- **3. Der kürzeste Pfad (*shortest path*) nach Dijkstra**

<img src="/AGI_HS25_Netzwerk2/_page_26_Figure_0.jpeg" class="h-52 object-contain mt-4" />

---
layout: two-cols
---

## Der kürzeste Pfad nach Dijkstra

- **1. Iteration**: Alle Knoten auf ∞, ausser Nachbarn von *b*: a, c, d
- **2. Iteration**: *t(c)* hat kleinsten Wert (8) → wird besucht. Nachbarn *t(h)*=18 und *t(e)*=23 aufdatiert.
- **3. Iteration**: *t(d)*=9 am kleinsten → d wird besucht. *b→d→e* = 16 < *b→c→e* = 23 → *t(e)* = 16
- **4. Iteration**: *e* wird besucht, *f* und *g* aufdatiert.
- Wenn alle Knoten besucht → Algorithmus endet.

Dijkstra hat $O(n^2)$.

A* braucht eine Heuristik (besuche nahe Knoten zuerst) → in Praxis schneller.

::right::

<img src="/AGI_HS25_Netzwerk2/_page_27_Figure_10.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk2/_page_27_Figure_11.jpeg" class="h-44 object-contain mt-2" />

---
layout: two-cols
---

## Der kürzeste Pfad nach Dijkstra (Schritt für Schritt)

- **1. Iteration**: Alle Knoten auf ∞, ausser Nachbarn von *b*: a, c, d
- **2. Iteration**: *t(c)*=8 → besucht. *t(h)*=18, *t(e)*=23
- **3. Iteration**: *t(d)*=9 → besucht. *t(e)*=16
- **4. Iteration**: *e* besucht, *f* und *g* aufdatiert.
- Wenn alle Knoten besucht → fertig.

::right::

<img src="/AGI_HS25_Netzwerk2/_page_28_Figure_10.jpeg" class="h-80 object-contain" />

---

## Teste eine der vielen Web-Applikationen

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk2/_page_29_Figure_5.jpeg" class="h-72 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_29_Figure_6.jpeg" class="h-72 object-contain" />
</div>

---
layout: two-cols
---

## Zusammenfassung

<img src="/AGI_HS25_Netzwerk2/_page_30_Picture_5.jpeg" class="h-32 object-contain mb-4" />

- Die **algorithmische Geometrie** ist der Teil der (Geo-)informatik, welcher sich mit der Lösung geometrischer Probleme zur Geodatenverarbeitung befasst: Point-in-Polygon, Linienvereinfachung, kürzester Pfad.
- **Dijkstras** Algorithmus zur Berechnung des kürzesten Pfads ist ein schönes Beispiel. Fast alle Funktionen in einem GIS verwenden vergleichbare Algorithmen.

::right::

## Praktischer Teil

**Gruppenarbeit**
Dijkstra für eine Abfrage übers VBZ-Netz selber nachrechnen.

**Übungen mit QGIS**
Kürzeste Pfade für OSM-Strassendaten von Wädenswil mit QGIS berechnen.

<img src="/AGI_HS25_Netzwerk2/_page_31_Figure_7.jpeg" class="h-36 object-contain mt-4" />

---

## Lesematerial & Literatur

<img src="/AGI_HS25_Netzwerk2/_page_32_Picture_5.jpeg" class="float-right h-40 ml-4" />

- Inhalte der Vorlesung basieren im Wesentlichen auf Worboys, M. F., & Duckham, M. (2004). *GIS: a computing perspective*. CRC press, Kapitel 5.
- Resp. in Neuauflage (2023) Kap. 5.5, S. 206ff.
- GITTA-Lektion zu Accessibility (e-Learning): http://www.gitta.info/Accessibiliti/en/html/index.html
- Interaktive Apps zum kürzesten Pfad:
  - https://www.cs.usfca.edu/~galles/visualization/Dijkstra.html
  - https://algorithms.discrete.ma.tum.de/graph-algorithms/spp-dijkstra/index_en.html

---
layout: cover
---

# Semesterprojekt

<img src="/AGI_HS25_Netzwerk2/_page_33_Picture_3.jpeg" class="h-48 object-contain" />

BSc Umweltingenieurwesen Angewandte Geoinformatik

---

## LN2: Dokumentation Spezialisierung

- Eigenes Semesterprojekt, exemplifiziert, schafft etwas Sinnvolles
  - kann eine der ersten 4 Aufgaben ausbauen,
  - kann ein Teilaspekt eines anderen Projekts sein, oder
  - kann ein Teilaspekt der anstehenden BSc-Arbeit umfassen (Delta dokumentieren!)
- Muss technische Fertigkeiten aus **2 der ersten 4** thematischen Blöcke aufgreifen:
  - *Datenqualität & Unsicherheit, Programmieren, Geodatenbanken, Netzwerkanalyse*
  - z.B. Netzwerkanalyse zur Erreichbarkeit im urbanen Raum
  - z.B. Kombiniert mit Unsicherheits-Aspekten zur Datenlage

---

## Semester-Projekte: Beispiele

<div class="grid grid-cols-2 gap-2">
<img src="/AGI_HS25_Netzwerk2/_page_35_Picture_6.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_35_Picture_12.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_35_Picture_16.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_35_Picture_21.jpeg" class="h-44 object-contain" />
</div>

**Abgabe Proposal: Do. 20.11.2025, 23:00**

---

## Semester-Projekte: Bewertungsraster

<img src="/AGI_HS25_Netzwerk2/_page_36_Picture_6.jpeg" class="h-80 object-contain" />

<small>basierend auf Z-RL-Richtlinie KI bei Leistungsnachweisen sowie Z-RL-Richtlinie Anhang Deklarationspflicht KI bei Arbeiten (Version 1.1.0, 01.03.2025)</small>

---

## Bewertungsraster (Forts.)

<div class="flex gap-2">
<img src="/AGI_HS25_Netzwerk2/_page_39_Picture_5.jpeg" class="h-48 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_39_Picture_9.jpeg" class="h-48 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_40_Picture_6.jpeg" class="h-48 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_40_Figure_8.jpeg" class="h-48 object-contain" />
</div>

---
layout: image
image: /AGI_HS25_Netzwerk2/_page_41_Picture_6.jpeg
---

## AI / KI zitieren?

---

## AI / KI zitieren?

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk2/_page_42_Figure_6.jpeg" class="h-80 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_42_Picture_7.jpeg" class="h-80 object-contain" />
</div>

---
layout: two-cols
---

## Reminder: Proposal & Coaching

- Proposal schreiben ist **schwierig**: ihr sollt beschreiben, wie ihr ein Problem lösen werdet, ohne alle Herausforderungen zu kennen.
- Wir können nur Feedback geben wenn ihr **konkret** beschreibt, was ihr zu machen gedenkt. Je detaillierter, desto besser.
- Die Vorgabe 1×A4 ist sowohl als **Minimal-** als auch als **Maximalumfang** zu verstehen.
- Schreibt **ausformulierte Sätze statt Stichworte** – letztere lassen zu viel Interpretationsspielraum.

::right::

<img src="/AGI_HS25_Netzwerk2/_page_43_Picture_4.jpeg" class="h-80 object-contain" />

---

## Proposal: so nicht …

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk2/_page_44_Picture_6.jpeg" class="h-64 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_44_Picture_20.jpeg" class="h-64 object-contain" />
<img src="/AGI_HS25_Netzwerk2/_page_44_Picture_22.jpeg" class="h-64 object-contain" />
</div>

---
layout: image
image: /AGI_HS25_Netzwerk2/_page_45_Picture_5.jpeg
---

## Proposal: viel besser!

---
layout: image
image: /AGI_HS25_Netzwerk2/_page_46_Picture_6.jpeg
---

## Proposal: viel besser! (2)

---
layout: image
image: /AGI_HS25_Netzwerk2/_page_47_Picture_5.jpeg
---

## Proposal: viel besser! (3)

---

## MBR – Lösung

Prüfe alle Stützpunkte (Vertices), d.h. deren Liste mit *x*-/*y*-Koordinaten.

Speichere immer die vier Werte für:
- tiefster x-Wert
- tiefster y-Wert
- höchster x-Wert
- höchster y-Wert

<img src="/AGI_HS25_Netzwerk2/_page_49_Figure_10.jpeg" class="h-56 object-contain mt-4" />
