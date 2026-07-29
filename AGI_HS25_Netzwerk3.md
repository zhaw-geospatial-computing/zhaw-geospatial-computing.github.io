---
theme: default
title: AGI HS25 Netzwerk3
transition: none
layout: cover
---

## BSc Umweltingenieurwesen Angewandte Geoinformatik

---

# **Netzwerkanalysen III**

![]( /AGI_HS25_Netzwerk3/_page_0_Picture_3.jpeg)

#### **Patrick Laube und Nils Ratnaweera**

Forschungsgruppe Geoinformatik

Institut für Umwelt und Natürliche Ressourcen ZHAW Zürcher Hochschule für Angewandte Wissenschaften Grüental, Postfach, CH-8820 Wädenswil

{laup,rata}@zhaw.ch

---

# **Lernziele**

![]( /AGI_HS25_Netzwerk3/_page_1_Picture_4.jpeg)

- Sie sind in der Lage das Konzept der Erreichbarkeit über Verkehrsnetzwerke in eigenen Worten zu erklären und einfache räumliche Ausdehnungen von Isochronen auf Netzwerken von Hand zu skizzieren.
- Sie sind in der Lage, netzwerkbasierte Erreichbarkeits- und Erschliessungsindikatoren selbständig zu **operationalisieren**.
- Sie sind befähigt verschiedene abgeleitete Netzwerkmasse für eine Multi-Kriterien Standortsuche in einem Strassennetz anzuwenden.
- Sie sind befähigt **Isochronen** in QGIS selbständig zu berechnen.


## **Rückschau Netzwerkanalyse 2**

![]( /AGI_HS25_Netzwerk3/_page_2_Picture_6.jpeg)

| n   | $\log_e n$ | $\sqrt{n}$ | $n^2$ | $2^n$                 |
|-----|------------|------------|-------|-----------------------|
| 1   | 0.0        | 1.0        | 0     | 2.0                   |
| 25  | 3.1        | 5.0        | 625   | 3.3 X10 <sup>7</sup>  |
| 50  | 3.9        | 7.1        | 2500  | 1.1 X10 <sup>15</sup> |
| 75  | 4.3        | 8.6        | 5625  | 3.8 X10 <sup>22</sup> |
| 100 | 4.6        | 10.0       | 10000 | 1.3 X10 <sup>30</sup> |

![]( /AGI_HS25_Netzwerk3/_page_2_Picture_8.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_2_Picture_9.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_2_Picture_10.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_2_Figure_11.jpeg)

## **Zeitplan heute**

| Zeitplan                                | Was                                                                     | Form                                     |  |
|-----------------------------------------|-------------------------------------------------------------------------|------------------------------------------|--|
| 13:00<br>–<br>14:30<br>(inkl.<br>Pause) | Theorie-Recap<br>Erschliessung<br>und<br>Erreichbarkeit                 | Theorie-Input,<br>kurze<br>Gruppenarbeit |  |
| 14:30 –<br>14:45                        | BA Themen<br>in FG GeoI                                                 | Input Patrick                            |  |
| 14:45 –<br>16:35                        | QGIS-Übung<br>Reisezeiten<br>und ÖV<br>Erschliessung<br>in<br>Wädenswil | Übungen, betreute<br>Einzelarbeit        |  |

## **Inhalt**

## **1. Reisezeiten**

- Isochronen
- Raumzeitkontinuum…
- 2. Operationalisierung und Indikatoren
- 3. Anwendungen in unseren Projekten
  - − Ruhige Gebiete Kt. AG
  - − Bonitierung Fischerei-Reviere Kt. ZH

![]( /AGI_HS25_Netzwerk3/_page_4_Picture_12.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_5_Figure_0.jpeg)

## **Isochronen**

- bisher haben wir Pfade zwischen einzelnen Start- und End-Punkten betrachtet
- zur Bewertung des Raumes hätten wir aber gern flächenhafte Informationen über die Erschliessung des gesamte Siedlungsraumes
- Isochronen erlauben genau dies.
- Def. **Isochrone**
  - Isolinie aller Orte, die von einem Ausgangsort in der gleichen Zeit erreichbar sind
  - Konstruktion über eine Shortest Path Analyse vom Ausgangsort zu allen Zielpunkten
  - Variiert je nach Verkehrsart

![]( /AGI_HS25_Netzwerk3/_page_6_Picture_12.jpeg)

## **Isochronen**

![]( /AGI_HS25_Netzwerk3/_page_7_Picture_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_7_Picture_6.jpeg)

## **Die schrumpfende Schweiz**

- Reisezeitkarten bilden nicht die räumlichen Distanzen ab, sondern die Reisezeiten.
  - Kartenmassstab ist eine Stunde Reisezeit.
  - Der Kartennullpunkt liegt in Bern.
  - Seit 1950 ist die Schweiz um mehr als die Hälfte geschrumpft

![]( /AGI_HS25_Netzwerk3/_page_8_Figure_9.jpeg)

## **Die schrumpfende Schweiz**

![]( /AGI_HS25_Netzwerk3/_page_9_Picture_6.jpeg)

- Worin unterscheidet sich 1990 von 2000?
- Was ist passiert?

![]( /AGI_HS25_Netzwerk3/_page_9_Picture_9.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_9_Picture_10.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_9_Figure_11.jpeg)

**Die schrumpfende Schweiz**

- Worin unterscheidet sich 1990 von 2000?
- Was ist passiert?

![]( /AGI_HS25_Netzwerk3/_page_10_Picture_7.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_10_Picture_8.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_10_Picture_9.jpeg)


## **[Openroute](https://maps.openrouteservice.org/) service**

![]( /AGI_HS25_Netzwerk3/_page_11_Figure_5.jpeg)

## **Erreichbarkeit**

- Die Erreichbarkeit legt die gebaute Verkehrsinfrastruktur in Reisezeitdistanzen um.
  - quantitativer Indikatoren zur Beurteilung der Erschliessung durch den öffentlichen (OEV) und den motorisierten individuellen Verkehr (MIV)
- planungsrelevant
  - Verkehrsplanung: bei Entscheiden über zukünftige Netzausbauten
  - Raumplanung: bei der Beurteilung von Lage, Ort und Quantität Bauzonen

**Reisezeiten zu Zentren**

![]( /AGI_HS25_Netzwerk3/_page_12_Figure_10.jpeg)

## **Isochronen vs. Reisezeit?**

- **Isochronen**: Ausgehend von zentralen Knoten, Reisezeiten zu weiteren Knoten auf dem Verkehrsnetz
- **Reisezeit** zwischen Schwerpunkten von Zonen (Gde, Quartier, Kreis-Poly), übers Verkehrsnetz Strassen oder ÖV, inkl. Verkehrsbelastung, Fahrplan

![]( /AGI_HS25_Netzwerk3/_page_13_Figure_7.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_14_Picture_0.jpeg)

Kanton Zürich Volkswirtschaftsdirektion Amt für Verkehr

---

# Gesamtverkehrsmodell Kanton Zürich

![]( /AGI_HS25_Netzwerk3/_page_14_Picture_3.jpeg)

## **Gesamtverkehrskonzept Kanton Zürich**

![]( /AGI_HS25_Netzwerk3/_page_15_Picture_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_15_Figure_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_15_Figure_8.jpeg)

---

# **Pendler-Mobilität**

![]( /AGI_HS25_Netzwerk3/_page_16_Figure_10.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_16_Figure_15.jpeg)

---

# **MAUP: Abstimmung vom 24.11.2024**

![]( /AGI_HS25_Netzwerk3/_page_17_Figure_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_17_Figure_6.jpeg)

## **MAUP: Abstimmung vom 24.11.2024**

![]( /AGI_HS25_Netzwerk3/_page_18_Figure_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_18_Figure_6.jpeg)

---

# **Pendler-Mobilität**

![]( /AGI_HS25_Netzwerk3/_page_19_Figure_7.jpeg)

## Pendler-Mobilität

**7** Ergebnisse der Analyse

Tabelle 12 Mittlere Pendeldistanzen der interkommunalen Pendler in km

|                                               | 1970 | 1980 | 1990 | 2000 |
|-----------------------------------------------|------|------|------|------|
| Alle Verkehrsmittel (Luftlinienentfernung)    | 8,4  | 9,0  | 10,8 | 12,7 |
| Motorisierter Individualverkehr (Netzdistanz) | 9,6  | 11,8 | 14,3 | 16,8 |
| Bahnverkehr (Netzdistanz)                     | 15,6 | 16,8 | 20,6 | 26,0 |

Anmerkung: Bei der Analyse konnten die Binnenpendler und nichtmotorisierten Verkehrsmittel nicht mit berücksichtigt werden.

Quelle: Eigene Auswertung

Die Distanzen haben sowohl im Straßenverkehr als auch auf der Schiene erheblich zugenommen. Betrachtet man die relativen Veränderungen zwischen den Volkszählungsjahren, so können die Prozentwerte als Anhaltspunkte der Entwicklung dienen (vgl. Tabelle 13).

Tabelle 13 Zuwachsraten der mittleren interkommunalen Distanzen in %

| Dezennium                       | 1970-1980 | 1980-1990 | 1990-2000 | 1970-2000 |  |
|---------------------------------|-----------|-----------|-----------|-----------|--|
| Alle Verkehrsmittel             | 7,1%      | 20,0%     | 17,6%     | 51,2%     |  |
| Motorisierter Individualverkehr | 22,9%     | 21,2%     | 17,5%     | 75,0%     |  |
| Bahnverkehr                     | 7,7%      | 22,6%     | 26,2%     | 66,7%     |  |
| Quelle: Eigene Auswertung       |           |           |           |           |  |

#### TECHNISCHE UNIVERSITÄT DRESDEN FAKULTÄT BAUINGENIEURWESEN

#### **DIPLOMARBEIT**

#### Strukturen des Pendelns in der Schweiz

Entwicklung von Analysemethoden - Beschreibung der Strukturen und Verflechtungen im zeitlichen Verlauf (1970-2000)

#### Eingereicht

im Studiengang Bauingenieurwesen, Vertiefungsrichtung Stadt- und Verkehrsplanung am Institut für Verkehrs- und Infrastrukturplanung

von Markus Botte

geb. am 21.01.1975 in Homberg/Efze.

Verantwortlicher Hochschullehrer: Prof. Dr. Ing. G.-A. Ahrens

Betreuer:

Prof. K.W. Axhausen, ETHZ, Institut für Verkehrsplanung und Transportsysteme

Dipl.-Ing. T. Heinemann, TUD, Institut für Verkehrs- und Infrastrukturplanung
Dipl.-Ing. Ph. Fröhlich, ETHZ, Institut für Verkehrsplanung und Transportsysteme

Dresden/Zürich, 05.10.2003

## **Inhalt**

## 1. Reisezeiten

- Isochronen
- Raumzeitkontinuum…

## **2. Operationalisierung und Indikatoren**

- 3. Anwendungen in unseren Projekten
  - − Ruhige Gebiete Kt. AG
  - − Bonitierung Fischerei-Reviere Kt. ZH

![]( /AGI_HS25_Netzwerk3/_page_21_Picture_12.jpeg)

## **Operationalisierung**

- **«Messbarmachung»** eines Aspekts eines GIS-Modells
  - Wie machen wir «Zentralität» messbar»
    - z. B. über den Knotengrad (degree centrality),
    - z. B. über betweenness centrality
  - Wie machen wir «Reisezeit zu Zentren» oder «Erreichbarkeit» messbar?
- Im Sinne der Nachvollziehbarkeit eines GIS-Modells wird definiert, mit welchen **Indikatoren/Parameter** die verschiedenen Ausprägungen der interessierenden Grösse (hier z. B. Erreichbarkeit) quantifizierbar gemacht werden.
- Im ARE Text:
  - ÖV-Güteklassen
  - Reisezeit zu Zentren
  - Isochronen
  - Potenzialerreichbarkeit

Dies ist ein **Modellierungsprozess**, meist mit verschiedenen denkbaren Lösungen, auch abhängig von der **Datenverfügbarkeit**.

## **Indikatoren**

- Dabei muss oft auch für die Indikatoren noch definiert werden, wie die Indikatoren räumlich bestimmt werden.
- Welche räumlichen Aspekte eines Themas sollen mit dem GIS quantifiziert werden?
- z. B. **Erschliessung mit ÖV**
  - Luftlinie zu nächster Haltestelle
  - Shortest Path zu nächster Haltestelle
  - Anzahl Haltestellen im Umkreis von 500m
  - Anzahl Haltestellen über shortest Path 500m
  - Anzahl oft bedienter Haltestellen über shortest Path 500m

![]( /AGI_HS25_Netzwerk3/_page_23_Picture_13.jpeg)

## **Bsp. aus unseren Projekten: ASTRA Wildtierunfälle**

### • **Vektordaten**

- Anzahl Quellen in der Nähe der Strasse
- Länge der Flüsse in der Nähe der Strasse
- Waldfläche in der Nähe der Strasse

### • **Rasterdaten**

- Max. Lärmbelastung in der Nähe
- Anteil Wald (nun Raster)

### • **Leitstrukturen**

- leiten Wild auf die Strasse hin
- Hydrologische Modellierung
- 2 Puffer-Modell

Laube, P., Ratnaweera, N., Wróbel, A., Kaelin, I., Stephani, A., Reifler-Baechtiger, M., ... & Suter, S. (2023). Analysing and predicting wildlife–vehicle collision hotspots for the Swiss road network. *Landscape Ecology*, 1-19.

![]( /AGI_HS25_Netzwerk3/_page_24_Picture_17.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_24_Picture_18.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_24_Picture_19.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_25_Picture_3.jpeg)

## **Inhalt**

## 1. Reisezeiten

- Isochronen
- Raumzeitkontinuum…
- 2. Operationalisierung und Indikatoren
- **3. Anwendungen in unseren Projekten**
  - − Ruhige Gebiete Kt. AG
  - − Bonitierung Fischerei-Reviere Kt. ZH

![]( /AGI_HS25_Netzwerk3/_page_25_Picture_12.jpeg)

---

# **Ruhige Gebiete im Kanton AG**

![]( /AGI_HS25_Netzwerk3/_page_26_Picture_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_26_Picture_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_27_Picture_5.jpeg)

### **ruhig**

- wenig frequentiert
- weit weg von lauten Dingen
- tief im Wald
- schlecht erschlossen
- dünne Weglein, Single trails…
- Fläche gross genug

## **gestört**

- Strassen (breit, mit viel Verkehr)
- allg. Menschen, die sich im Wald bewegen (spazieren, Joggen, MTB, …)
- Feuerstellen, Picknickplätze, Waldhütten
- Campingplätze, Modellflugplätze, Klettergebiete

![]( /AGI_HS25_Netzwerk3/_page_27_Picture_18.jpeg)

**Operationalisierung:** Wie sollen diese Kriterien nun räumlich modelliert werden?

## Wie würdet Ihr das machen?

![]( /AGI_HS25_Netzwerk3/_page_28_Picture_5.jpeg)

### ruhig

- wenig frequentiert
- weit weg von lauten Dingen
- tief im Wald
- schlecht erschlossen
- dünne Weglein, Single trails...
- Fläche gross genug

### gestört

- Strassen (breit, mit viel Verkehr)
- allg. Menschen, die sich im Wald bewegen (spazieren, Joggen, MTB, ...)
- Feuerstellen, Picknickplätze, Waldhütten
- Campingplätze,Modellflugplätze,Klettergebiete

#### **Kurzdiskussion mit Nachbar:in:**

- Diskutiere für 8 Min wie Du die Kriterien mit Geodaten modellieren würdest
- Mache ein Tabelle, ggf. Skizzen für die einzelnen Kriterien

---

# **Ruhige Gebiete AG**

## **Gewichtetes Multikriterien-Modell ZHAW**

![]( /AGI_HS25_Netzwerk3/_page_29_Picture_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_29_Figure_7.jpeg)

**Zentralität der Wege** Gerechnet pro iso-

**+**

liertem Wald (unabhängig der Grösse) 1.0

einfacher Puffer um Punkte/Linien Modellflugplätze Gebäude\* Bauten im Wald Vita Parcours Kanu/Rafting **L** Klettergebiete **P** Flugplätze Camping\* **0.6** 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0

> \* mehrere Puffer **L**inien / **P**olygone

**Objekt-Puffer**

Überlagerung

**Strassen-Puffer** Wert+Breite = F(Strassenklasse) 25m 200m 10 100 + 0.4

![]( /AGI_HS25_Netzwerk3/_page_29_Figure_12.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_30_Picture_4.jpeg)

---

# Erreichtbarkeits-Isochronen: Waldeingänge

![]( /AGI_HS25_Netzwerk3/_page_30_Figure_6.jpeg)

- ✓ Waldeingaenge
- ✓ NormRaster\_Waldeingaenge

#### Value

- 50
- 54
- ---
- 58
- 62
- 00
- /0
- 75
- 79
- 02
- 07
- 0.1
- 95
- 100

---

# **Erreichtbarkeits-Isochronen: Bev. Schwerpte.**

![]( /AGI_HS25_Netzwerk3/_page_31_Figure_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_31_Figure_6.jpeg)

---

# **Erreichtbarkeits-Isochronen: Restaurants**

![]( /AGI_HS25_Netzwerk3/_page_32_Picture_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_32_Figure_7.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_32_Figure_8.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_32_Figure_9.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_32_Figure_10.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_32_Figure_11.jpeg)

---

# Erreichtbarkeits-Isochronen: Verkehr

![]( /AGI_HS25_Netzwerk3/_page_33_Picture_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_33_Figure_7.jpeg)

- **✓** Haltestellen
- 0
- **✓** Parkplaetze
- ✓ NormRaster\_Verkehr

#### Value

- 20
- 27
- 31

![]( /AGI_HS25_Netzwerk3/_page_34_Picture_4.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_34_Figure_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_34_Figure_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_35_Picture_4.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_35_Figure_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_35_Figure_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_36_Picture_4.jpeg)

**Objekt -Puffer**

![]( /AGI_HS25_Netzwerk3/_page_36_Figure_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_36_Figure_7.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_37_Picture_4.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_37_Picture_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_37_Figure_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_37_Figure_7.jpeg)


## **Strava Heatmap**

![]( /AGI_HS25_Netzwerk3/_page_38_Figure_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_39_Picture_4.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_39_Picture_5.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_39_Figure_6.jpeg)

![]( /AGI_HS25_Netzwerk3/_page_39_Figure_7.jpeg)

## **Resultate**

![]( /AGI_HS25_Netzwerk3/_page_40_Figure_5.jpeg)

## **Resultate**

![]( /AGI_HS25_Netzwerk3/_page_41_Figure_5.jpeg)

## **Inhalt**

- 1. Reisezeiten
  - Isochronen
  - Raumzeitkontinuum…
- 2. Operationalisierung und Indikatoren
- 3. Anwendungen **in unseren Projekten**
  - − Ruhige Gebiete Kt. AG
  - − **Bonitierung Fischerei-Reviere Kt. ZH**

![]( /AGI_HS25_Netzwerk3/_page_43_Picture_4.jpeg)

---

# **Erreichbarkeits-Isochronen ab**

![]( /AGI_HS25_Netzwerk3/_page_43_Figure_6.jpeg)

#### **Fischerei -Reviere**

![]( /AGI_HS25_Netzwerk3/_page_44_Figure_6.jpeg)


## **Zusammenfassung**

![]( /AGI_HS25_Netzwerk3/_page_45_Picture_5.jpeg)

- **Isochronen** sind Isolinie aller Orte, die von einem Ausgangsort in der gleichen Zeit erreichbar sind.
- Isochronen erlauben die Visualisierung von **Reisezeiten** durch eine Umlegung von Netzwerkdistanzen in die Fläche.
- **Operationalisierung** bezeichnet die «Messbarmachung» eines Aspekts eines GIS-Modells, über räumliche Indikatoren.
- Masse aus der Netzwerkanalyse wie etwa Zentralität von Wegen oder Erreichbarkeits-Isochronen sind nützliche Raumvariablen zur **Modellierung von Störungen** im Naherholungsraum (Wald, Projekt-Beispiele aus der Praxis \_\_ \_\_ ).

## **Lesematerial & Literatur**

![]( /AGI_HS25_Netzwerk3/_page_46_Picture_5.jpeg)

- Laube, P., Ratnaweera, N., Wróbel, A., Kaelin, I., Stephani, A., Reifler-Baechtiger, M., ... & Suter, S. (2023). Analysing and predicting wildlife–vehicle collision hotspots for the Swiss road network. *Landscape Ecology*, 1-19.
- Axhausen, K. W., Dolci, C., Fröhlich, P., Scherer, M., & Carosio, A. (2008). Constructing Time-Scaled Maps: Switzerland from 1950 to 2000. *Transport Reviews*, 28(3), 391-413.