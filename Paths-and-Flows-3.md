---
theme: default
title: AGI HS25 Netzwerk3
transition: none
layout: cover
---

# Netzwerkanalysen III

<img src="/AGI_HS25_Netzwerk3/_page_0_Picture_3.jpeg" class="h-48 object-contain" />

BSc Umweltingenieurwesen Angewandte Geoinformatik

---

## Lernziele

<img src="/AGI_HS25_Netzwerk3/_page_1_Picture_4.jpeg" class="float-right h-40 ml-4" />

- Sie sind in der Lage das Konzept der Erreichbarkeit über Verkehrsnetzwerke in eigenen Worten zu erklären und einfache räumliche Ausdehnungen von Isochronen auf Netzwerken von Hand zu skizzieren.
- Sie sind in der Lage, netzwerkbasierte Erreichbarkeits- und Erschliessungsindikatoren selbständig zu **operationalisieren**.
- Sie sind befähigt verschiedene abgeleitete Netzwerkmasse für eine Multi-Kriterien Standortsuche in einem Strassennetz anzuwenden.
- Sie sind befähigt **Isochronen** in QGIS selbständig zu berechnen.

---
layout: two-cols
---

## Rückschau Netzwerkanalyse 2

| n | $\log_e n$ | $\sqrt{n}$ | $n^2$ | $2^n$ |
|---|---|---|---|---|
| 1 | 0.0 | 1.0 | 0 | 2.0 |
| 25 | 3.1 | 5.0 | 625 | 3.3×10⁷ |
| 50 | 3.9 | 7.1 | 2500 | 1.1×10¹⁵ |
| 75 | 4.3 | 8.6 | 5625 | 3.8×10²² |
| 100 | 4.6 | 10.0 | 10000 | 1.3×10³⁰ |

<img src="/AGI_HS25_Netzwerk3/_page_2_Picture_6.jpeg" class="h-36 object-contain mt-4" />

::right::

<img src="/AGI_HS25_Netzwerk3/_page_2_Picture_8.jpeg" class="h-36 object-contain" />

<img src="/AGI_HS25_Netzwerk3/_page_2_Picture_9.jpeg" class="h-36 object-contain mt-2" />

<img src="/AGI_HS25_Netzwerk3/_page_2_Figure_11.jpeg" class="h-36 object-contain mt-2" />

---

## Zeitplan heute

| Zeitplan | Was | Form |
|---|---|---|
| 13:00 – 14:30 (inkl. Pause) | Theorie-Recap Erschliessung und Erreichbarkeit | Theorie-Input, kurze Gruppenarbeit |
| 14:30 – 14:45 | BA Themen in FG GeoI | Input Patrick |
| 14:45 – 16:35 | QGIS-Übung Reisezeiten und ÖV-Erschliessung in Wädenswil | Übungen, betreute Einzelarbeit |

---

## Inhalt

- **1. Reisezeiten**
  - Isochronen
  - Raumzeitkontinuum
- 2. Operationalisierung und Indikatoren
- 3. Anwendungen in unseren Projekten
  - Ruhige Gebiete Kt. AG
  - Bonitierung Fischerei-Reviere Kt. ZH

<div class="flex gap-4 mt-4">
<img src="/AGI_HS25_Netzwerk3/_page_4_Picture_12.jpeg" class="h-40 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_5_Figure_0.jpeg" class="h-40 object-contain" />
</div>

---
layout: two-cols
---

## Isochronen

- Bisher haben wir Pfade zwischen einzelnen Start- und End-Punkten betrachtet.
- Zur Bewertung des Raumes hätten wir aber gern **flächenhafte** Informationen über die Erschliessung des gesamten Siedlungsraumes.
- Isochronen erlauben genau dies.

**Definition Isochrone:**
- Isolinie aller Orte, die von einem Ausgangsort in der **gleichen Zeit** erreichbar sind
- Konstruktion über eine Shortest Path Analyse vom Ausgangsort zu allen Zielpunkten
- Variiert je nach Verkehrsart

::right::

<img src="/AGI_HS25_Netzwerk3/_page_6_Picture_12.jpeg" class="h-80 object-contain" />

---

## Isochronen – Beispiele

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk3/_page_7_Picture_5.jpeg" class="h-80 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_7_Picture_6.jpeg" class="h-80 object-contain" />
</div>

---
layout: two-cols
---

## Die schrumpfende Schweiz

- Reisezeitkarten bilden nicht die räumlichen Distanzen ab, sondern die **Reisezeiten**.
  - Kartenmassstab ist eine Stunde Reisezeit.
  - Der Kartennullpunkt liegt in Bern.
  - Seit 1950 ist die Schweiz um mehr als die Hälfte geschrumpft.

::right::

<img src="/AGI_HS25_Netzwerk3/_page_8_Figure_9.jpeg" class="h-80 object-contain" />

---

## Die schrumpfende Schweiz – 1990 vs. 2000

- Worin unterscheidet sich 1990 von 2000?
- Was ist passiert?

<div class="grid grid-cols-2 gap-2">
<img src="/AGI_HS25_Netzwerk3/_page_9_Picture_6.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_9_Picture_9.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_9_Picture_10.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_9_Figure_11.jpeg" class="h-44 object-contain" />
</div>

---

## Die schrumpfende Schweiz – Detail

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk3/_page_10_Picture_7.jpeg" class="h-72 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_10_Picture_8.jpeg" class="h-72 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_10_Picture_9.jpeg" class="h-72 object-contain" />
</div>

---
layout: image
image: /AGI_HS25_Netzwerk3/_page_11_Figure_5.jpeg
---

## Openrouteservice

---
layout: two-cols
---

## Erreichbarkeit

- Die Erreichbarkeit legt die gebaute Verkehrsinfrastruktur in **Reisezeitdistanzen** um.
  - Quantitativer Indikator zur Beurteilung der Erschliessung durch ÖV und MIV
- Planungsrelevant:
  - **Verkehrsplanung**: bei Entscheiden über zukünftige Netzausbauten
  - **Raumplanung**: bei der Beurteilung von Lage, Ort und Quantität von Bauzonen

::right::

**Reisezeiten zu Zentren**

<img src="/AGI_HS25_Netzwerk3/_page_12_Figure_10.jpeg" class="h-72 object-contain" />

---
layout: two-cols
---

## Isochronen vs. Reisezeit?

**Isochronen:**
Ausgehend von zentralen Knoten, Reisezeiten zu weiteren Knoten auf dem Verkehrsnetz

**Reisezeit:**
Zwischen Schwerpunkten von Zonen (Gde, Quartier, Kreis-Poly), übers Verkehrsnetz (Strassen oder ÖV), inkl. Verkehrsbelastung, Fahrplan

::right::

<img src="/AGI_HS25_Netzwerk3/_page_13_Figure_7.jpeg" class="h-52 object-contain" />

<img src="/AGI_HS25_Netzwerk3/_page_14_Picture_0.jpeg" class="h-32 object-contain mt-2" />

---
layout: cover
---

# Gesamtverkehrsmodell Kanton Zürich

<img src="/AGI_HS25_Netzwerk3/_page_14_Picture_3.jpeg" class="h-52 object-contain" />

---

## Gesamtverkehrskonzept Kanton Zürich

<div class="flex gap-2">
<img src="/AGI_HS25_Netzwerk3/_page_15_Picture_5.jpeg" class="h-64 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_15_Figure_6.jpeg" class="h-64 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_15_Figure_8.jpeg" class="h-64 object-contain" />
</div>

---

## Pendler-Mobilität

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk3/_page_16_Figure_10.jpeg" class="h-80 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_16_Figure_15.jpeg" class="h-80 object-contain" />
</div>

---

## MAUP: Abstimmung vom 24.11.2024

<div class="grid grid-cols-2 gap-2">
<img src="/AGI_HS25_Netzwerk3/_page_17_Figure_5.jpeg" class="h-52 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_17_Figure_6.jpeg" class="h-52 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_18_Figure_5.jpeg" class="h-52 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_18_Figure_6.jpeg" class="h-52 object-contain" />
</div>

---
layout: two-cols
---

## Pendler-Mobilität: Distanzen 1970–2000

| | 1970 | 1980 | 1990 | 2000 |
|---|---|---|---|---|
| Alle Verkehrsmittel (Luftlinie) | 8,4 | 9,0 | 10,8 | 12,7 |
| MIV (Netzdistanz) | 9,6 | 11,8 | 14,3 | 16,8 |
| Bahn (Netzdistanz) | 15,6 | 16,8 | 20,6 | 26,0 |

Zuwachsraten interkommunale Distanzen (%)

| | 70–80 | 80–90 | 90–00 | 70–00 |
|---|---|---|---|---|
| Alle Verkehrsmittel | 7,1% | 20,0% | 17,6% | 51,2% |
| MIV | 22,9% | 21,2% | 17,5% | 75,0% |
| Bahn | 7,7% | 22,6% | 26,2% | 66,7% |

<small>Quelle: Botte (2003). Strukturen des Pendelns in der Schweiz. TU Dresden.</small>

::right::

<img src="/AGI_HS25_Netzwerk3/_page_19_Figure_7.jpeg" class="h-96 object-contain" />

---

## Inhalt

- 1. Reisezeiten
  - Isochronen, Raumzeitkontinuum
- **2. Operationalisierung und Indikatoren**
- 3. Anwendungen in unseren Projekten
  - Ruhige Gebiete Kt. AG
  - Bonitierung Fischerei-Reviere Kt. ZH

<img src="/AGI_HS25_Netzwerk3/_page_21_Picture_12.jpeg" class="h-44 object-contain mt-4" />

---

## Operationalisierung

**«Messbarmachung»** eines Aspekts eines GIS-Modells:

- Wie machen wir «Zentralität» messbar?
  - z.B. über den Knotengrad (degree centrality)
  - z.B. über betweenness centrality
- Wie machen wir «Reisezeit zu Zentren» oder «Erreichbarkeit» messbar?

Im Sinne der Nachvollziehbarkeit wird definiert, mit welchen **Indikatoren/Parametern** die interessierende Grösse quantifizierbar gemacht wird.

Beispiele aus dem ARE:
- ÖV-Güteklassen
- Reisezeit zu Zentren
- Isochronen
- Potenzialerreichbarkeit

Dies ist ein **Modellierungsprozess**, meist mit verschiedenen denkbaren Lösungen, abhängig von der **Datenverfügbarkeit**.

---
layout: two-cols
---

## Indikatoren

Welche räumlichen Aspekte eines Themas sollen mit dem GIS quantifiziert werden?

Beispiel **Erschliessung mit ÖV**:
- Luftlinie zu nächster Haltestelle
- Shortest Path zu nächster Haltestelle
- Anzahl Haltestellen im Umkreis von 500m
- Anzahl Haltestellen über Shortest Path 500m
- Anzahl oft bedienter Haltestellen über Shortest Path 500m

::right::

<img src="/AGI_HS25_Netzwerk3/_page_23_Picture_13.jpeg" class="h-80 object-contain" />

---
layout: two-cols
---

## Bsp. aus unseren Projekten: ASTRA Wildtierunfälle

**Vektordaten**
- Anzahl Quellen in der Nähe der Strasse
- Länge der Flüsse in der Nähe der Strasse
- Waldfläche in der Nähe der Strasse

**Rasterdaten**
- Max. Lärmbelastung in der Nähe
- Anteil Wald (Raster)

**Leitstrukturen**
- Leiten Wild auf die Strasse hin
- Hydrologische Modellierung, 2-Puffer-Modell

<small>Laube et al. (2023). Analysing and predicting wildlife–vehicle collision hotspots for the Swiss road network. *Landscape Ecology*.</small>

::right::

<div class="grid grid-cols-2 gap-1">
<img src="/AGI_HS25_Netzwerk3/_page_24_Picture_17.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_24_Picture_18.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_24_Picture_19.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_25_Picture_3.jpeg" class="h-36 object-contain" />
</div>

---

## Inhalt

- 1. Reisezeiten
  - Isochronen, Raumzeitkontinuum
- 2. Operationalisierung und Indikatoren
- **3. Anwendungen in unseren Projekten**
  - **Ruhige Gebiete Kt. AG**
  - Bonitierung Fischerei-Reviere Kt. ZH

<img src="/AGI_HS25_Netzwerk3/_page_25_Picture_12.jpeg" class="h-44 object-contain mt-4" />

---
layout: cover
---

# Ruhige Gebiete im Kanton AG

<div class="flex gap-4 mt-4">
<img src="/AGI_HS25_Netzwerk3/_page_26_Picture_5.jpeg" class="h-52 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_26_Picture_6.jpeg" class="h-52 object-contain" />
</div>

---
layout: two-cols
---

## Was ist «ruhig» / «gestört»?

**Ruhig:**
- wenig frequentiert
- weit weg von lauten Dingen
- tief im Wald
- schlecht erschlossen
- dünne Weglein, Single Trails
- Fläche gross genug

**Gestört:**
- Strassen (breit, viel Verkehr)
- Menschen im Wald (Joggen, MTB, …)
- Feuerstellen, Picknickplätze, Waldhütten
- Campingplätze, Modellflugplätze, Klettergebiete

**Operationalisierung:** Wie sollen diese Kriterien räumlich modelliert werden?

::right::

<img src="/AGI_HS25_Netzwerk3/_page_27_Picture_5.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk3/_page_27_Picture_18.jpeg" class="h-44 object-contain mt-2" />

---
layout: two-cols
---

## Wie würdet Ihr das machen?

**Kurzdiskussion mit Nachbar:in (8 Min):**

- Diskutiere, wie Du die Kriterien mit Geodaten modellieren würdest
- Mache eine Tabelle, ggf. Skizzen für die einzelnen Kriterien

**Ruhig:** wenig frequentiert / weit von Lärm / tief im Wald / schlecht erschlossen / Single trails / Fläche gross genug

**Gestört:** Strassen (breit, Verkehr) / Menschen im Wald / Feuerstellen, Waldhütten / Campingplätze, Klettergebiete

::right::

<img src="/AGI_HS25_Netzwerk3/_page_28_Picture_5.jpeg" class="h-96 object-contain" />

---
layout: two-cols
---

## Gewichtetes Multikriterien-Modell ZHAW

<img src="/AGI_HS25_Netzwerk3/_page_29_Picture_6.jpeg" class="h-52 object-contain" />

- **Zentralität der Wege** (gerechnet pro isoliertem Wald)
- **Objekt-Puffer** (Modellflugplätze, Gebäude, Bauten im Wald, Vita Parcours, Kanu/Rafting, Klettergebiete, Flugplätze, Camping)
- **Strassen-Puffer** (Wert+Breite = f(Strassenklasse), 25–200m)

::right::

<img src="/AGI_HS25_Netzwerk3/_page_29_Figure_7.jpeg" class="h-44 object-contain" />

<img src="/AGI_HS25_Netzwerk3/_page_29_Figure_12.jpeg" class="h-44 object-contain mt-2" />

---
layout: two-cols
---

## Erreichbarkeits-Isochronen: Waldeingänge

<img src="/AGI_HS25_Netzwerk3/_page_30_Picture_4.jpeg" class="h-52 object-contain" />

Isochronen von Waldeingängen → normiertes Raster

::right::

<img src="/AGI_HS25_Netzwerk3/_page_30_Figure_6.jpeg" class="h-96 object-contain" />

---

## Erreichbarkeits-Isochronen: Bevölkerungsschwerpunkte

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk3/_page_31_Figure_5.jpeg" class="h-80 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_31_Figure_6.jpeg" class="h-80 object-contain" />
</div>

---

## Erreichbarkeits-Isochronen: Restaurants

<div class="grid grid-cols-3 gap-1">
<img src="/AGI_HS25_Netzwerk3/_page_32_Picture_6.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_32_Figure_7.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_32_Figure_8.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_32_Figure_9.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_32_Figure_10.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_32_Figure_11.jpeg" class="h-36 object-contain" />
</div>

---
layout: two-cols
---

## Erreichbarkeits-Isochronen: Verkehr

Haltestellen + Parkplätze → normiertes Raster

<img src="/AGI_HS25_Netzwerk3/_page_33_Picture_6.jpeg" class="h-52 object-contain" />

::right::

<img src="/AGI_HS25_Netzwerk3/_page_33_Figure_7.jpeg" class="h-96 object-contain" />

---

## Modell-Komponenten: Aufbau

<div class="grid grid-cols-3 gap-1">
<img src="/AGI_HS25_Netzwerk3/_page_34_Picture_4.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_34_Figure_5.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_34_Figure_6.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_35_Picture_4.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_35_Figure_5.jpeg" class="h-36 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_35_Figure_6.jpeg" class="h-36 object-contain" />
</div>

---

## Objekt-Puffer: Überlagerung

<div class="grid grid-cols-2 gap-2">
<img src="/AGI_HS25_Netzwerk3/_page_36_Picture_4.jpeg" class="h-52 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_36_Figure_6.jpeg" class="h-52 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_36_Figure_7.jpeg" class="h-52 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_37_Picture_4.jpeg" class="h-52 object-contain" />
</div>

---

## Modell: Gesamtüberlagerung

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk3/_page_37_Picture_5.jpeg" class="h-72 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_37_Figure_6.jpeg" class="h-72 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_37_Figure_7.jpeg" class="h-72 object-contain" />
</div>

---
layout: two-cols
---

## Strava Heatmap

<img src="/AGI_HS25_Netzwerk3/_page_38_Figure_5.jpeg" class="h-80 object-contain" />

::right::

<div class="grid grid-cols-2 gap-1">
<img src="/AGI_HS25_Netzwerk3/_page_39_Picture_4.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_39_Picture_5.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_39_Figure_6.jpeg" class="h-44 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_39_Figure_7.jpeg" class="h-44 object-contain" />
</div>

---
layout: image
image: /AGI_HS25_Netzwerk3/_page_40_Figure_5.jpeg
---

## Resultate

---
layout: image
image: /AGI_HS25_Netzwerk3/_page_41_Figure_5.jpeg
---

## Resultate (2)

---

## Inhalt

- 1. Reisezeiten
  - Isochronen, Raumzeitkontinuum
- 2. Operationalisierung und Indikatoren
- 3. Anwendungen in unseren Projekten
  - Ruhige Gebiete Kt. AG
  - **Bonitierung Fischerei-Reviere Kt. ZH**

<img src="/AGI_HS25_Netzwerk3/_page_43_Picture_4.jpeg" class="h-44 object-contain mt-4" />

---

## Erreichbarkeits-Isochronen: Fischerei-Reviere

<div class="flex gap-4">
<img src="/AGI_HS25_Netzwerk3/_page_43_Figure_6.jpeg" class="h-72 object-contain" />
<img src="/AGI_HS25_Netzwerk3/_page_44_Figure_6.jpeg" class="h-72 object-contain" />
</div>

---
layout: two-cols
---

## Zusammenfassung

<img src="/AGI_HS25_Netzwerk3/_page_45_Picture_5.jpeg" class="h-32 object-contain mb-4" />

- **Isochronen** sind Isolinien aller Orte, die von einem Ausgangsort in der gleichen Zeit erreichbar sind.
- Isochronen erlauben die Visualisierung von **Reisezeiten** durch eine Umlegung von Netzwerkdistanzen in die Fläche.
- **Operationalisierung** bezeichnet die «Messbarmachung» eines Aspekts eines GIS-Modells über räumliche Indikatoren.
- Masse aus der Netzwerkanalyse (Zentralität von Wegen, Erreichbarkeits-Isochronen) sind nützliche Raumvariablen zur **Modellierung von Störungen** im Naherholungsraum.

::right::

## Lesematerial & Literatur

<img src="/AGI_HS25_Netzwerk3/_page_46_Picture_5.jpeg" class="h-32 object-contain mb-4" />

- Laube, P., Ratnaweera, N., Wróbel, A., Kaelin, I., Stephani, A., Reifler-Baechtiger, M., ... & Suter, S. (2023). Analysing and predicting wildlife–vehicle collision hotspots for the Swiss road network. *Landscape Ecology*, 1-19.
- Axhausen, K. W., Dolci, C., Fröhlich, P., Scherer, M., & Carosio, A. (2008). Constructing Time-Scaled Maps: Switzerland from 1950 to 2000. *Transport Reviews*, 28(3), 391-413.
