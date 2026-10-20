---
theme: default
title: VL 2 DaInfII  26 FS
transition: none
layout: cover
---

# Daten und Informationen 2

---

# **Rauminformation – Teil 2**

### Koordinatensysteme

![]( /VL_2_DaInfII_ 26_FS/_page_0_Picture_4.jpeg)

#### **Pascal Ochsner**

Forschungsgruppe Geoinformatik

Institut für Umwelt und Natürliche Ressourcen ZHAW Zürcher Hochschule für Angewandte Wissenschaften Grüental, Postfach, CH-8820 Wädenswil

pascal.ochsner@zhaw.ch

![]( /VL_2_DaInfII_ 26_FS/_page_1_Picture_4.jpeg)

---

# **Programm Teil «Rauminformation»**

#### Di 17. März

– **Vorlesung I – Einführung Rauminformation** (Aula – hybrid via Webex) / 13:00 – 14:35

#### Di 24. März

- **Übung 1** (RT 505) Gruppe 1 (08:00 09:35) / Gruppe 2 (09:50 11:35)
- **Vorlesung II – Koordinatensysteme** (Aula hybrid via Webex) / 13:00 14:35

#### Di 31. März

- **Übung 1** (RT 505) Gruppe 3 (08:00 09:35) / Gruppe 4 (09:50 11:35)
- **Vorlesung III – Kartengestaltung** (Aula hybrid via Webex) / 13:00 14:35

#### Di 7. April

- **Übung 2** (RT 505) Gruppe 1 (08:00 09:35) / Gruppe 2 (09:50 11:35)
- **Vorlesung IV – Datenquellen und -portale** (Aula hybrid via Webex) / 13:00 14:35

#### Di 14. April

- **Übung 2** (RT 505) Gruppe 3 (08:00 09:35) / Gruppe 4 (09:50 11:35)
- **Vorlesung V – Rauminformation im Umweltbereich** (Aula hybrid via Webex) / 13:00 14:35

![]( /VL_2_DaInfII_ 26_FS/_page_2_Picture_4.jpeg)

---

# **Lernziele heute**

- Du kennst den Unterschied zwischen einer Kugel, einem Geoid und einem Rotationsellipsoid.
- Du kannst erläutern, warum Kartografen Rotationsellipsoide verwenden, um die Erde auf einer 2D Darstellungsebene abbilden zu können.
- Du kannst erklären, was eine Projektion ist, und kennst die drei gängigsten Projektionstypen.
- Du weisst, dass die Erde auf einer planaren Darstellungsebene niemals gleichzeitig flächentreu, längentreu und winkeltreu abgebildet werden kann und kannst erklären, weshalb eine Kartenprojektion immer ein Kompromiss ist.
- Du kennst die Bedeutung von Koordinaten und Koordinatensystemen im Umgang mit räumlichen Daten.
- Du kannst den Unterschied zwischen geografischen und kartesischen Koordinaten erklären.
- Du kennst die für uns wichtigsten Koordinatensysteme.
- Du weisst, wie für ein bestimmtes Koordinatensystem der entsprechende EPSG Code ermittelt werden kann.

![]( /VL_2_DaInfII_ 26_FS/_page_3_Picture_4.jpeg)

---

# **Heute**

### Einführung

### Die Form der Erde

- Erde als Kugel
- Erde als Geoid
- Erde als Rotationsellipsoid

### Kartenprojektionen

- Grundlagen
- Typen von Projektionen

### Koordinatensysteme

- Grundlagen
- Kartesische Koordinaten
- Geografische Koordinaten
- Wichtigste Koordinatensysteme
- EPSG Codierung

Zusammenfassung Minor Spatial Data Science (SDS)

![]( /VL_2_DaInfII_ 26_FS/_page_4_Picture_4.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_4_Picture_6.jpeg)

### Wie gross ist die Distanz von der Aula Grüental bis zum Gipfel des Matterhorns?

![]( /VL_2_DaInfII_ 26_FS/_page_4_Figure_8.jpeg)

Quelle: <https://map.geo.admin.ch/>

**Koordinaten Aula Grüental**

X (E) = 2'693'999 Y (N) = 1'230'529 Z = 506.1

Quelle: [https://www.sac](https://www.sac-cas.ch/de/huetten-und-touren/sac-tourenportal/matterhorn-1138/hochtouren/)-[cas.ch/de/huetten](https://www.sac-cas.ch/de/huetten-und-touren/sac-tourenportal/matterhorn-1138/hochtouren/)-[und](https://www.sac-cas.ch/de/huetten-und-touren/sac-tourenportal/matterhorn-1138/hochtouren/)-[touren/sac](https://www.sac-cas.ch/de/huetten-und-touren/sac-tourenportal/matterhorn-1138/hochtouren/)[tourenportal/matterhorn-1138/hochtouren/](https://www.sac-cas.ch/de/huetten-und-touren/sac-tourenportal/matterhorn-1138/hochtouren/)

![]( /VL_2_DaInfII_ 26_FS/_page_5_Picture_4.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_5_Picture_6.jpeg)

Wie gross sind die Distanzen nach Wladiwostok, Vancouver, Tromsø und Kapstadt?

![]( /VL_2_DaInfII_ 26_FS/_page_5_Figure_8.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_6_Picture_4.jpeg)

### Warum ist das wichtig?

![]( /VL_2_DaInfII_ 26_FS/_page_6_Picture_7.jpeg)

Weltkarte (Cornelis de Jode 1593)

![]( /VL_2_DaInfII_ 26_FS/_page_6_Picture_9.jpeg)

© Adobe Stock

![]( /VL_2_DaInfII_ 26_FS/_page_6_Picture_11.jpeg)

Schrumpfender Aralsee (2000 – 2013) Quelle: NASA

![]( /VL_2_DaInfII_ 26_FS/_page_7_Picture_4.jpeg)

Geography is everywhere!

Wahrscheinlich die älteste Karte eines Gebiets (in Europa), die bisher identifiziert wurde.

Der als Saint-Bélec Slab bekannte Felsbrocken stammt aus Frankreich (Bretagne) und wird auf die frühe Bronzezeit zwischen 1900 v. Chr. und 1650 v. Chr. datiert. Er wurde ursprünglich von dem Archäologen Paul du Châtellier im Jahr 1900 entdeckt.

![]( /VL_2_DaInfII_ 26_FS/_page_7_Picture_9.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_8_Picture_4.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_8_Picture_6.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_9_Picture_4.jpeg)

---

# **Heute**

### Einführung

### Die Form der Erde

- Erde als Kugel
- Erde als Geoid
- Erde als Rotationsellipsoid

### Kartenprojektionen

- Grundlagen
- Typen von Projektionen

### Koordinatensysteme

- Grundlagen
- Kartesische Koordinaten
- Geografische Koordinaten
- Wichtigste Koordinatensysteme
- EPSG Codierung

Zusammenfassung Minor Spatial Data Science (SDS)

![]( /VL_2_DaInfII_ 26_FS/_page_10_Picture_5.jpeg)

---

# **Die Erde als Kugel**

Die Form der Erde hat die Wissenschaftler im Laufe der Geschichte immer wieder fasziniert. Die allgemeine Akzeptanz der Tatsache, dass die Erde rund ist, entstand im ersten Jahrhundert nach Christus, obwohl Pythagoras bereits 600 Jahre zuvor eine kugelförmige Erde postuliert hatte. Das Konzept der flachen Erde tauchte im Mittelalter hin und wieder auf, manchmal aus religiösen Gründen, aber man kann mit Sicherheit sagen, dass die Menschheit seit 2000 Jahren weiss, dass wir auf einer Kugel leben.

![]( /VL_2_DaInfII_ 26_FS/_page_10_Picture_8.jpeg)

<https://www.national5maths.co.uk/>

Aber, glaubst Du wirklich, dass die Erde eine echte Kugel ist?

![]( /VL_2_DaInfII_ 26_FS/_page_10_Picture_11.jpeg)

Sicherlich nicht, denn die Erde ist ein **Geoid**.

![]( /VL_2_DaInfII_ 26_FS/_page_10_Picture_13.jpeg)

[https://science.nasa.gov/earth/earth](https://science.nasa.gov/earth/earth-atmosphere/earth-from-space-15-amazing-things-in-15-years/)-[atmosphere/earth-from](https://science.nasa.gov/earth/earth-atmosphere/earth-from-space-15-amazing-things-in-15-years/)-[space](https://science.nasa.gov/earth/earth-atmosphere/earth-from-space-15-amazing-things-in-15-years/)-[15](https://science.nasa.gov/earth/earth-atmosphere/earth-from-space-15-amazing-things-in-15-years/)-[amazing](https://science.nasa.gov/earth/earth-atmosphere/earth-from-space-15-amazing-things-in-15-years/)-[things](https://science.nasa.gov/earth/earth-atmosphere/earth-from-space-15-amazing-things-in-15-years/)[in-15-years/](https://science.nasa.gov/earth/earth-atmosphere/earth-from-space-15-amazing-things-in-15-years/)

---

# **Die Erde als Geoid**

Während wir uns die Erde oft als Kugel vorstellen, ist unser Planet in Wirklichkeit sehr **uneben und unregelmässig**. Der Radius am Äquator ist größer als an den Polen, was auf die langfristigen Auswirkungen der Erdrotation zurückzuführen ist. Und in kleinerem Maßstab gibt es die Topografie, d. h. Berge haben mehr Masse als Täler, so dass die Anziehungskraft in der Nähe von Bergen regional stärker ist. All diese großen und kleinen Variationen der Größe, Form und Massenverteilung der Erde führen zu leichten Schwankungen der Erdbeschleunigung (oder der «Stärke» der Anziehungskraft). Diese Schwankungen bestimmen die Form der flüssigen Umgebung des Planeten. Würde man den Ozean von den Gezeiten und Strömungen befreien, würde er sich in einer gleichmäßig gewellten Form einpendeln (er steigt dort, wo die Schwerkraft hoch ist, und sinkt dort, wo die Schwerkraft niedrig ist). Diese unregelmässige, komplexe und mathematisch nicht beschreibbare Form wird **Geoid** genannt, eine Fläche, die die Nullhöhe definiert.

![]( /VL_2_DaInfII_ 26_FS/_page_11_Figure_8.jpeg)

<https://deepearthscience.blogspot.com/2013/10/measuring-geoid-what-is-geoid.html>

![]( /VL_2_DaInfII_ 26_FS/_page_11_Figure_10.jpeg)

---

# **Die Erde als Geoid**

Du weisst jetzt, dass die Erde ein komplexes Geoid ist. In der Kartografie verwenden wir meist 2D-Oberflächen oder Karten, um die ganze Welt oder einen Teil davon darzustellen. Aber wie kann diese wellenförmige, reale Form der Erde auf einfachen, planaren 2D-Karten dargestellt werden?

![]( /VL_2_DaInfII_ 26_FS/_page_12_Picture_7.jpeg)

[https://www.europosters.ch/marketplace/mercator](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)-[world](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)-[map](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)-[physical](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)-[political](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)-[population](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)-[from](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)-[janwillemvanaalst](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)-[v95029](https://www.europosters.ch/marketplace/mercator-world-map-physical-political-population-from-janwillemvanaalst-v95029)

![]( /VL_2_DaInfII_ 26_FS/_page_13_Picture_5.jpeg)

---

# **Die Erde als Geoid**

Denke an eine Orange, deren Form ebenfalls einem «Geoid» ähnlich ist. Kann man sie schälen, um ihre 3D-Oberfläche auf einer 2D-Oberfläche darzustellen?

![]( /VL_2_DaInfII_ 26_FS/_page_13_Picture_8.jpeg)

Nach dem Schälen der Orange hat man zwar einzelne Scheiben, aber man müsste jede Scheibe zusätzlich noch flach drücken. Das ist also definitiv nicht die richtige Lösung.

Ein weiteres Problem besteht in der komplexen Form des Geoids selbst. Es kann nicht mathematisch beschrieben werden. Wir brauchen also eine einfache Figur, die die Form der Erde darstellt. Diese Figuren werden **Rotationsellipsoide** genannt.

---

# **Die Erde als Rotationsellipsoid**

Du hast gelernt, dass die reale Form der Erde (Geoid) nicht als Standortreferenzfläche geeignet ist. Es wird eine Form benötigt, die mit mathematischer Präzision beschrieben werden kann. Eine Annäherung an die reale Form der Erde ist ein **Rotationsellipsoid**.

Ein Rotationsellipsoid ist eine Rotationsfläche, die durch Drehung einer Ellipse um eine ihrer Achsen (Erdrotationsachse) entsteht.

Ein Rotationsellipsoid hat eine kreisförmige Symmetrie und ist durch die folgenden beiden Parameter gekennzeichnet:

- **1. Grosse Halbachse a** (am Äquator)
- **2. Kleine Halbachse b** (Süd- zu Nordpol)

![]( /VL_2_DaInfII_ 26_FS/_page_14_Picture_12.jpeg)

| Name              | a: grosse Halbachse (m) | Abplattung f = (a-b/a) |
|-------------------|-------------------------|------------------------|
| Bessel (1841)     | 6'377'397               | 1 : 299.1528           |
| Clarke (1880)     | 6'378'249               | 1 : 293.466            |
| Hayford<br>(1928) | 6'378'388               | 1 : 297.0              |
| WGS 84            | 6'378'137               | 1 : 298.2572           |

![]( /VL_2_DaInfII_ 26_FS/_page_15_Picture_5.jpeg)

---

# **Die Erde als Rotationsellipsoid**

**Referenzellipsoide** werden in erster Linie als Oberflächen zur Angabe von Punktkoordinaten wie Breitengraden (Nord/Süd), Längengraden (Ost/West) und Höhe verwendet. Das gebräuchlichste Referenzellipsoid in der Kartografie und Vermessung ist das **World Geodetic System (WGS 84)**.

Es gibt aber auch viele andere Referenzellipsoide, die in der Kartografie verwendet werden, z. B. **Bessel**, **Clarke** oder **Hayford**. Sie unterscheiden sich voneinander durch den unterschiedlichen Abflachungswert.

Die folgende Abbildung zeigt das Geoid (gelbe Fläche) und drei verschiedene Referenzellipsoide (blaue, rote und grüne Linien). Am Ort A auf dem Geoid wird das rote Ellipsoid verwendet, weil es am besten zur Geoidoberfläche passt. Das blaue Ellipsoid wird an Ort B und das grüne an Ort C verwendet.

![]( /VL_2_DaInfII_ 26_FS/_page_15_Picture_10.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_16_Picture_4.jpeg)

---

# **Heute**

### Einführung

### Die Form der Erde

- Erde als Kugel
- Erde als Geoid
- Erde als Rotationsellipsoid

### Kartenprojektionen

- Grundlagen
- Typen von Projektionen

### Koordinatensysteme

- Grundlagen
- Kartesische Koordinaten
- Geografische Koordinaten
- Wichtigste Koordinatensysteme
- EPSG Codierung

Zusammenfassung Minor Spatial Data Science (SDS)

---

# **Grundlagen**

![]( /VL_2_DaInfII_ 26_FS/_page_17_Picture_6.jpeg)

---

# **Grundlagen**

Wie wir das mit dem Beispiel der Orange kennengelernt haben, ist es unmöglich, die Erdoberfläche korrekt auf einer planaren Oberfläche (Ebene) darzustellen.

Da das also nicht funktioniert, behilft man sich mit einer **Projektion**:

Wir stellen uns vor, die Erde sei durchscheinend, wir haben eine Lichtquelle und ein grosses (richtig grosses) Stück Papier, welches wir um die Erde wickeln. Dieses Stück Papier fungiert nun als Leinwand, auf die das Bild, die sogenannte Projektion geworfen wird.

![]( /VL_2_DaInfII_ 26_FS/_page_18_Picture_10.jpeg)

[https://kartenprojektionen.de](https://kartenprojektionen.de/)

Die Abbildung zeigt nur eine mögliche Art, die Projektion einzufangen und auf dem Stück Papier abzubilden. Abhängig davon, wo die Lichtquelle platziert wird, wie das Papier um die Erde gewickelt wird (sofern es überhaupt rumgewickelt wird und nicht flach neben der Erde liegt), und an welcher Stelle das Papier die Erde berührt wird die Erde unterschiedlich auf dem Papier abgebildet.

Die Erde kann auf **drei verschiedene Arten** auf eine planare Oberfläche projiziert werden:

#### **1. Zylindrische Projektion**

![]( /VL_2_DaInfII_ 26_FS/_page_19_Picture_8.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_19_Picture_9.jpeg)

#### **2. Azimutale Projektion**

![]( /VL_2_DaInfII_ 26_FS/_page_19_Picture_11.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_19_Picture_12.jpeg)

#### **3. Konische Projektion**

![]( /VL_2_DaInfII_ 26_FS/_page_19_Picture_14.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_19_Picture_15.jpeg)

Wenn Du mehr über den Weg von der Erdoberfläche zur planaren Darstellung wissen möchtest, dann schaue Dir dieses Video an:

![]( /VL_2_DaInfII_ 26_FS/_page_20_Figure_7.jpeg)

Die Projektion der Erde auf eine planare Fläche führt zu verschiedenen **Kartenprojektionen**. Wichtig zu wissen ist, dass eine Kartenprojektion nicht gleichzeitig **winkeltreu**, **flächentreu** und **längentreu** sein kann.

Diese Website gibt eine Übersicht über verschiedene existierende Kartenprojektionen:

![]( /VL_2_DaInfII_ 26_FS/_page_20_Figure_10.jpeg)

<https://kartenprojektionen.de/singleview.php>

[Video:](https://www.youtube.com/watch?v=Z41Dt7_R180) [Coordinate](https://www.youtube.com/watch?v=Z41Dt7_R180) [System Jargon:](https://www.youtube.com/watch?v=Z41Dt7_R180) [geoid,](https://www.youtube.com/watch?v=Z41Dt7_R180) [datum,](https://www.youtube.com/watch?v=Z41Dt7_R180) [projection](https://www.youtube.com/watch?v=Z41Dt7_R180)

#### **Verschiedene Kartenprojektionen**

Eckert IV (flächentreu)

![]( /VL_2_DaInfII_ 26_FS/_page_21_Picture_8.jpeg)

Eisenlohr (winkeltreu)

![]( /VL_2_DaInfII_ 26_FS/_page_21_Picture_10.jpeg)

Mollweide (flächentreu)

![]( /VL_2_DaInfII_ 26_FS/_page_21_Picture_12.jpeg)

Gall (längentreu)

![]( /VL_2_DaInfII_ 26_FS/_page_21_Picture_14.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_22_Picture_5.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_22_Picture_7.jpeg)

Vergleicht die dargestellten Flächengrösse von ausgesuchten Ländern mit Ihrer tatsächlichen Grösse:

![]( /VL_2_DaInfII_ 26_FS/_page_22_Figure_9.jpeg)

Link: <https://thetruesize.com/>

#### Zum Beispiel:

- Schweiz vs. Island oder Ruanda
- Russland vs. Afrika oder Australien
- Finnland vs. Bolivien

#### 26 | Kartenprojektionen

---

# **Typen von Projektionen**

## Ländergrössen: Weltweite Übersicht

![]( /VL_2_DaInfII_ 26_FS/_page_23_Figure_7.jpeg)

Link: <https://truesizeofcountries.com/>

<https://thetruesize.com/>

### Problem: Web Mercator Projektion

![]( /VL_2_DaInfII_ 26_FS/_page_23_Picture_11.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_24_Picture_4.jpeg)

---

# **Heute**

### Einführung

### Die Form der Erde

- Erde als Kugel
- Erde als Geoid
- Erde als Rotationsellipsoid

### Kartenprojektionen

- Grundlagen
- Typen von Projektionen

### Koordinatensysteme

- Grundlagen
- Kartesische Koordinaten
- Geografische Koordinaten
- Wichtigste Koordinatensysteme
- EPSG Codierung

Zusammenfassung Minor Spatial Data Science (SDS)

![]( /VL_2_DaInfII_ 26_FS/_page_25_Picture_4.jpeg)

---

# **Grundlagen**

#### **Koordinaten Jet d'eau**

- 2'501'000.24 / 1'118'136.27
  - -> **CH1903+ LV95**
- 501'000.80 / 118'136.10
  - -> **CH1903 LV03**
- 46.207381 / 6.155883
  - -> **WGS 84**
- 280'601 / 5'121'021 (32T)
  - -> **UTM 32**
- 685'269,77 / 5'813'643.62
  - -> **Web Mercator**

![]( /VL_2_DaInfII_ 26_FS/_page_25_Picture_17.jpeg)

### **Merke Dir**

![]( /VL_2_DaInfII_ 26_FS/_page_25_Picture_19.jpeg)

Wenn Du mit räumlichen Daten arbeitest ist es immer wichtig zu wissen, in welchem Koordinatensystem die Daten resp. die Geodaten vorliegen.

---

# **Kartesische Koordinaten**

Orte auf der Erdoberfläche werden in Form von Koordinaten gemessen und dargestellt. Eine Koordinate ist ein Satz von zwei oder mehr Zahlen, der die Position eines Punktes, einer Linie oder einer anderen geometrischen Figur in Bezug auf ein Bezugssystem angibt.

Das einfachste System dieser Art ist das **kartesische Koordinatensystem** (benannt nach dem Mathematiker und Philosophen René Descartes aus dem 17. Jahrhundert). Ein kartesisches Koordinatensystem ist einfach ein Gitter, das durch die Aneinanderreihung von zwei Achsen gebildet wird, einer horizontalen X-Achse und einer vertikalen Y-Achse. Der Punkt, an dem sowohl X als auch Y gleich Null sind, wird als Ursprung des Koordinatensystems bezeichnet. Handelt es sich um ein dreidimensionales Koordinatensystem, gibt es eine zusätzliche Z-Achse.

![]( /VL_2_DaInfII_ 26_FS/_page_26_Figure_9.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_27_Picture_5.jpeg)

---

# **Geografische Koordinaten**

Kartesische Koordinatensysteme sind aufgrund ihrer Einfachheit praktisch. Aus offensichtlichen Gründen sind sie jedoch nicht perfekt geeignet, um geografische Positionen zu bestimmen. Das **geografische Koordinatensystem** ist speziell für die Bestimmung von Positionen auf der grob kugelförmigen Erdoberfläche konzipiert. Anstelle der beiden linearen Messskalen x und y stehen im geografischen Koordinatensystem zwei gekrümmte Messskalen nebeneinander. Die Ost-West-Skala, die sogenannte geographische Länge, reicht von +180° bis -180°. Da die Erde rund ist, sind +180° (oder 180° E) und -180° (oder 180° W) dieselbe Gitterlinie. Diese Gitterlinie entspricht in etwa der internationalen Datumsgrenze. Gegenüber der internationalen Datumsgrenze liegt der **Nullmeridian**, der Längengrad, der durch einen internationalen Vertrag als 0° definiert ist. Die Nord-Süd-Skala, die so genannte geographische Breite, reicht von +90° (oder 90° N) am Nordpol bis -90° (oder 90° S) am Südpol.

![]( /VL_2_DaInfII_ 26_FS/_page_27_Figure_8.jpeg)

### **CH1903+ LV95**

CH1903+ LV95 ist das Schweizerische Koordinatensystem basierend auf der Landesvermessung 1995.

Das Schweizerische Koordinatensystem beruht auf einer schiefachsigen, winkeltreuen Zylinderprojektion basierend auf dem Bessel-Ellipsoid 1841.

Ausgangspunkt ist der Fundamentalpunkt bei der alten Sternwarte in Bern. Als Projektionskoordinaten enthält der Fundamentalpunkt die Koordinatenwerte 2'600'000 (Eastern oder X-Achse) und 1'200'000 Meter (Northern oder Y-Achse)

![]( /VL_2_DaInfII_ 26_FS/_page_28_Figure_11.jpeg)

<https://www.swisstopo.admin.ch/de/schweizerische-kartenprojektionen>

### **CH1903+ LV95**

Die aktuell gültigen Koordinaten der Fixpunkte in der Schweiz wurden in den 1990er Jahren von swisstopo mit Satellitenunterstützung und GPS zentimetergenau neu erhoben. Wir sprechen daher von der Landesvermessung 1995 oder LV95.

#### **Achtung: Der «Nullpunkt» ist nicht gleich Null**

In der Schweiz ist definiert, dass der Nullpunkt bei der alten Sternwarte in Bern liegt. Von dort aus werden die Koordinaten in Metern gezählt: jeweils zunehmend nach Osten und nach Norden, abnehmend nach Westen und Süden. Dieser Nullpunkt trägt aber nicht die Koordinatenwerte 0 m / 0 m, wie der Name vermuten liesse, sondern die **siebenstelligen** Werte **E = 2'600'000 m und N = 1'200'000 m**. Somit haben Koordinaten südlich und westlich von Bern keine negativen Zahlen.

![]( /VL_2_DaInfII_ 26_FS/_page_29_Figure_11.jpeg)

<https://www.swisstopo.admin.ch/de/schweizerische-kartenprojektionen>

### **CH1903 LV03**

Bei CH1903 LV 03 handelt es sich um das alte Schweizerische Koordinatensystem welches im Jahr 2015 vom neuen CH1903+ LV95 abgelöst wurde.

CH1903 LV03 beruhte auf der Landesvermessung von 1903. Der Nullpunkt liegt wie beim neuen Koordinatensystem bei der alten Sternwarte in Bern. Die Koordinaten sind allerdings nur **sechsstellig** und lauten **x = 600'000 und y = 200'000**.

![]( /VL_2_DaInfII_ 26_FS/_page_30_Figure_11.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_30_Figure_13.jpeg)

### **CH1903 LV03 vs. CH1903+ LV95**

![]( /VL_2_DaInfII_ 26_FS/_page_31_Figure_8.jpeg)

#### CH-Koordinaten Üetliberg Aussichtsturm

| alte Koordinaten (LV03) | neue Koordinaten (LV95) |
|-------------------------|-------------------------|
| y 679 543.41 m          | E 2 679 544.28 m        |
| x 244 832.23 m          | N 1 244 832.08 m        |
| H 870.00 m ü. M.        | H 870.00 m ü. M.        |

Differenzen zwischen LV03 (alt) und LV95 (aktuell)

### **WGS 84**

Das **World Geodetic System 1984 (WGS 84)** ist das weltweit am häufigsten verwendete geodätische Referenzsystem für die Navigation, Kartografie und GPS-Technologie. Es definiert ein einheitliches Koordinatensystem für die gesamte Erde (-90° bis +90°).

WGS84 ist sowohl ein Koordinatensystem mit geografischen Koordinaten (Breite, Länge), als auch ein Referenzellipsoid.

#### **Geografische Koordinaten**

φ (griech. Phi), λ (griech. Lambda) und h.

- Breitengrad: Nord-Süd-Position in Grad (-90° bis +90°)
- Längengrad: Ost-West-Position in Grad (-180° bis +180°)
- Ellipsoidische Höhe (h): Abstand über oder unter dem Referenzellipsoid

![]( /VL_2_DaInfII_ 26_FS/_page_32_Figure_15.jpeg)

### **UTM System**

Um grosse Gebiete der Erdoberfläche in die Kartenebene abzubilden, bedient man sich besonderer Projektionen, welche die Erde in Streifen (Zonen) aufteilen. Innerhalb der Streifen bleiben die Abbildungsverzerrungen in vertretbaren Grenzen. Eine häufig gebrauchte, weltweit anwendbare Abbildung ist die **UTM-Projektion**, welche das Gebiet der Erde in **60 Zonen** von Pol zu Pol mit einer Breite von 6 Längengraden teilt. Die Abbildung innerhalb der Zonen entspricht einer konformen Zylinderprojektion mit der Zylinderachse in der Äquatorialebene. Die Schweiz wird durch die UTM-Zone 32 mit dem Hauptmeridian L = 9° Ost abgedeckt.

Bei UTM-Koordinaten handelt es sich um kartesische Koordinaten (bsp. Jet d'eau: 280'601 / 5'121'021 (32T))

![]( /VL_2_DaInfII_ 26_FS/_page_33_Figure_10.jpeg)

![]( /VL_2_DaInfII_ 26_FS/_page_34_Picture_5.jpeg)

### **UTM System - Zoneneinteilung**

![]( /VL_2_DaInfII_ 26_FS/_page_34_Figure_7.jpeg)

### **Web Mercator**

Das **Web Mercator System** ist speziell für digitale Kartenanwendungen wie Google Maps, OpenStreetMap, Here Maps und Bing Maps entwickelt worden. Es ist heute der De-facto-Standard für Web-Kartendienste.

#### **Eigenschaften**

- Winkeltreu: Winkel und Formen bleiben erhalten.
- Flächenverzerrung: Flächen werden stark verzerrt, insbesondere in hohen Breitengraden.
- Beschneidung bei 85,06° nördlicher und südlicher Breite, da sonst extreme Verzerrungen auftreten würden
- Anstelle von geografischen Koordinaten verwendet Web Mercator kartesische Koordinaten in Metern:
  - X-Koordinate reicht von −20037508,34 m bis +20037508,34 m
  - Y-Koordinate reicht von −20037508,34 m bis +20037508,34 m
  - Der N Nullpunkt (0,0) liegt am Schnittpunkt des Äquators und des WGS84 Nullmeridians (Greenwich).

![]( /VL_2_DaInfII_ 26_FS/_page_35_Figure_17.jpeg)

<https://desktop.arcgis.com/de/arcmap/latest/map/projections/mercator.htm>

---

# **EPSG Codierung**

- **EPSG Geodetic Parameter Dataset** (auch EPSG-Register) ist ein öffentliches Register von geodätischen Daten, räumlichen Bezugssystemen, Erdellipsoiden, Koordinatentransformationen und zugehörigen Maßeinheiten, das 1985 von einem Mitglied der **European Petroleum Survey Group (EPSG)** erstellt wurde.
- Jeder Einheit wird ein **EPSG-Code** zwischen 1024 und 32767 zugewiesen.
- Der Datensatz wird vom [IOGP](https://www.iogp.org/about-us/structure-and-governance/our-committees/geomatics/) [Geomatics](https://www.iogp.org/about-us/structure-and-governance/our-committees/geomatics/) [Committee](https://www.iogp.org/about-us/structure-and-governance/our-committees/geomatics/) verwaltet.
- Die meisten geografischen Informationssysteme (GIS) und GIS-Bibliotheken verwenden EPSG-Codes als Spatial Reference System Identifiers (SRIDs) und EPSG-Definitionsdaten zur Identifizierung von Koordinatenreferenzsystemen, Projektionen und zur Durchführung von Transformationen zwischen diesen Systemen.
- Website: <https://epsg.org/home.html>

EPSG Suche: <https://epsg.io/>

![]( /VL_2_DaInfII_ 26_FS/_page_36_Picture_12.jpeg)

#### **EPSG Codes:**

- CH1903+ LV95 = **[2056](https://epsg.io/2056)**
- CH1903 LV03 = **[21781](https://epsg.io/21781)**
- WGS 84 = **[4326](https://epsg.io/4326)**
- UTM 32N = **[25832](https://epsg.io/25832)**
- Web Mercator = **[3857](https://epsg.io/3857)**

![]( /VL_2_DaInfII_ 26_FS/_page_37_Picture_4.jpeg)

---

# **Heute**

### Einführung

### Die Form der Erde

- Erde als Kugel
- Erde als Geoid
- Erde als Rotationsellipsoid

### Kartenprojektionen

- Grundlagen
- Typen von Projektionen

### Koordinatensysteme

- Grundlagen
- Kartesische Koordinaten
- Geografische Koordinaten
- Wichtigste Koordinatensysteme
- EPSG Codierung

Zusammenfassung Minor Spatial Data Science (SDS)

---

# **Zusammenfassung**

- Mittels definierten Metriken können wir auf der Erde Distanzen, Flächen und Winkel messen.
- Koordinatensystem erlauben uns, uns auf der Erde zu orientieren.
- Die reale Form der Erde ist keine Kugel, sondern ein Geoid. Ein Geoid ist allerdings nicht mathematisch beschreibbar. Exakt mathematisch beschreibbar sind Rotationsellipsoide (grosse Halbachse und Abplattungsfaktor), das sind Annäherungen an die reale Form der Erde.
- Um die 3D-Form der Erde auf einer planaren Ebene darstellen zu können, verwendet man Projektion. Es gibt drei verschiedene Arten, um die Erde zu projizieren: Zylinderprojektion, Azimutalprojektion und Konische Projektion.
- Es ist nicht möglich, mittels einer Projektion die Erde sowohl flächentreu, längentreu und winkeltreu abzubilden. Jede Projektion ist ein Kompromiss. Dadurch werden gewisse Gebiete auf weltweiten Abbildungen immer verzerrt dargestellt.
- Wenn man mit räumlichen Daten (Geodaten) arbeitet, muss man immer wissen, in welchem Koordinatensystem diese vorliegen.
- Es gibt hauptsächlich zwei Arten von Koordinaten, mit denen man die Lage im Raum definieren kann: Kartesische (metrische Einheiten) und Geografische Koordinaten (Winkelgrade).
- Weltweit gibt es hunderte verschiedenster Koordinatensysteme. Die für uns wichtigsten sind: CH1903+ LV95, WGS84, Web Mercator, UTM).
- Jedes Koordinatensystem verfügt über einen eineindeutigen EPSG-Code.

![]( /VL_2_DaInfII_ 26_FS/_page_39_Picture_4.jpeg)

---

# **Heute**

### Einführung

### Die Form der Erde

- Erde als Kugel
- Erde als Geoid
- Erde als Rotationsellipsoid

### Kartenprojektionen

- Grundlagen
- Typen von Projektionen

### Koordinatensysteme

- Grundlagen
- Kartesische Koordinaten
- Geografische Koordinaten
- Wichtigste Koordinatensysteme
- EPSG Codierung

### Zusammenfassung

Minor Spatial Data Science (SDS)

![]( /VL_2_DaInfII_ 26_FS/_page_40_Picture_4.jpeg)

---

# **Minor Spatial Data Science (SDS)**

Der Minor Spatial Data Science beinhaltet drei Module:

- **Geoinformatik und GIS (3. Sem.)**
- **Remote Sensing (4. Sem.)**
- **Geospatial Computing (5. Sem.)**
- − Alle Module des Minors Spatial Data Science haben einen Umfang von 5 ECTS.
- − Alle Module können einzeln besucht werden.
- − Das Modul «Geoinformatik und GIS» ist das Grundlagenmodul des Minors.
- − Die Module «Remote Sensing» und «Geospatial Computing» bauen auf den Kompetenzen des Moduls «Geoinformatik und GIS» auf.

#### [Website: Lehre Forschungsgruppe Geoinformatik](https://www.zhaw.ch/de/lsfm/institute-zentren/iunr/geooekologie/geoinformatik/studium-und-weiterbildung)

![]( /VL_2_DaInfII_ 26_FS/_page_40_Figure_15.jpeg)

− Die Module «Remote Sensing» und «Geospatial Computing» können auch ohne vorherigen Besuch des Moduls «Geoinformatik und GIS» besucht werden, allerdings werden die im Modul «Geoinformatik und GIS» vermittelten Kompetenzen vorausgesetzt (bsp. erlangt in der Berufsbildung oder anderen Hochschulmodulen).

![]( /VL_2_DaInfII_ 26_FS/_page_41_Picture_4.jpeg)

---

# **Minor Spatial Data Science (SDS)**

#### **[Geoinformatik und GIS](https://bsc-ui-c24.studienplaner.lsfm.zhaw.ch/module/geoinformatik-und-gis)**

In diesem Modul wird ein tiefes Verständnis räumlicher Zusammenhänge in den Umweltwissenschaften vermittelt. Ihr lernt, Geodaten zu erfassen, zu analysieren und zu visualisieren. Dabei werden moderne GIS-Tools wie QGIS und ArcGIS angewandt, um räumliche Muster, Trends und Prozesse in den Bereichen Biodiversität, Klimaveränderungen und urbanen als auch natürlichen Ökosystemen zu untersuchen.

![]( /VL_2_DaInfII_ 26_FS/_page_41_Picture_9.jpeg)

#### **[Remote](https://bsc-ui-c24.studienplaner.lsfm.zhaw.ch/module/remote-sensing) [Sensing](https://bsc-ui-c24.studienplaner.lsfm.zhaw.ch/module/remote-sensing)**

Satelliten, Flugzeuge und Drohnen liefern uns wertvolle Daten über unseren Planeten. Diese Daten sind immer leichter zugänglich und bieten grosses Zukunftspotenzial. Die Fernerkundung ermöglicht es, diese Daten zu analysieren und für nachhaltige Lösungen in Umweltund Ingenieurwissenschaften zu nutzen. In diesem Modul lernt Ihr, wie diese Daten beschafft und analysiert werden.

#### **Modulleitung Modulleitung Modulleitung**

![]( /VL_2_DaInfII_ 26_FS/_page_41_Picture_14.jpeg)

#### **[Geospatial](https://bsc-ui-c24.studienplaner.lsfm.zhaw.ch/module/geospatial-computing) [Computing](https://bsc-ui-c24.studienplaner.lsfm.zhaw.ch/module/geospatial-computing)**

Noch nie waren so viele Daten für die Öffentlichkeit zugänglich. Viele dieser Daten sind räumlich. In diesem Modul lernt Ihr, mit Open-Source-Skript-Sprachen wie R oder Python Geodaten zu verarbeiten, zu analysieren und zu visualisieren. Die Verwendung dieser Sprachen bietet eine skalierbare Möglichkeit, auch komplexe Daten zu analysieren, und ebnet den Weg für Big Data, maschinelles Lernen und KI in den Umweltwissenschaften.

![]( /VL_2_DaInfII_ 26_FS/_page_41_Picture_19.jpeg)

---

# **To Do auf nächste Woche**

![]( /VL_2_DaInfII_ 26_FS/_page_42_Picture_6.jpeg)

### **Optional**

Zwei Youtube Videos von swisstopo mit Erklärungen zu Koordinatensystemen:

[https://www.youtube.com/watch?v=o2\\_t6MGieLI&t=29s](https://www.youtube.com/watch?v=o2_t6MGieLI&t=29s) <https://www.youtube.com/watch?v=WNcUxt7QfvI>