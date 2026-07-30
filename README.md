# Modul Geospatial Computing – Folien

Slidev-basierte Foliensätze für den BSc-Kurs *Angewandte Geoinformatik* (Umweltingenieurwesen) an der ZHAW.

## Voraussetzungen

Siehe auch: https://sli.dev/guide/

- [Node.js](https://nodejs.org/) (LTS-Version empfohlen, z.B. über [nvm](https://github.com/nvm-sh/nvm))
- [pnpm](https://pnpm.io/) als Paketmanager: `npm install -g pnpm`
- [Visual Studio Code](https://code.visualstudio.com/) mit der Erweiterung [Slidev](https://marketplace.visualstudio.com/items?itemName=antfu.slidev) – ermöglicht Folienvorschau und Navigation direkt im Editor
- Ein LLM mit Tool-Use und MCP-Unterstützung, z.B. [Claude Code](https://claude.ai/code) – kann Folien direkt bearbeiten, Layouts anpassen und über den Slidev-MCP-Server mit dem laufenden Dev-Server interagieren, siehe auch: https://sli.dev/guide/work-with-ai


## Installation

```bash
pnpm install
```

## Entwicklungsserver starten

```bash
npx slidev Paths-and-Flows-1.md # z.B.
```

Danach die Präsentation im Browser unter <http://localhost:3030> öffnen.

Jeweils nur ein Foliensatz gleichzeitig. Den Dateinamen einfach anpassen.

## Alle Foliensätze bauen

```bash
npx slidev build *.md
```

## Foliensätze

- `Paths-and-Flows-1.md` – Netzwerkanalysen I: Graphentheorie, Zentralitätsmasse, QGIS
- `_Paths-and-Flows-2.md` – Netzwerkanalysen II *(in Bearbeitung, nicht publiziert)*
- `_Paths-and-Flows-3.md` – Netzwerkanalysen III *(in Bearbeitung, nicht publiziert)*
- `layouts-demo.md` – Referenzfoliensatz für alle eigenen und eingebauten Layouts

## Eigene Layouts

Alle Layouts liegen im Ordner `layouts/` und werden in den Folien per `layout:`-Frontmatter eingebunden.

- `zhaw-cover` – Titelfolie. Frontmatter-Felder: `heading`, `subtitle`, `authors`, `email`, `logo`
- `lernziele` – Lernziele mit grünen Häkchen
- `zusammenfassung` – Zusammenfassung mit blauen Pfeilen
- `exercises` – Aufgabenfolie mit orangem Akzent
- `three-cols-header` – Drei Spalten mit gemeinsamem Kopf (`::left::`, `::center::`, `::right::`)
- `two-cols-header` – Zwei Spalten mit gemeinsamem Kopf (`::left::`, `::right::`)

## Eigene Komponenten

Alle Komponenten liegen im Ordner `components/` und sind in allen Folien automatisch verfügbar.

### `Inhalt`

Inhaltsverzeichnis-Folie. Liest die `sections:`-Liste aus dem globalen Frontmatter (Folie 1) und hebt den aktiven Abschnitt hervor.

Einmalig im globalen Frontmatter definieren:

```yaml
sections:
  - Abschnitt 1 blabla
  - Abschnitt 2 usw
  - Abschnitt 3 letztes thema
```

Auf jeder Inhaltsfolie einbinden:

```
<Inhalt :active="2" />
```

### `SlideFooter`

Quellenangabe am unteren Rand einer Folie, z.B. für Bildquellen.

```
<SlideFooter>Quelle: stadt-zuerich.ch · uber.com</SlideFooter>
```

## Assets

- `public/zhaw-logo.jpeg` – ZHAW-Logo, wird von `zhaw-cover` standardmässig verwendet
- `public/<deck>/` – Bilder aus dem ursprünglichen PowerPoint, je Foliensatz ein Unterordner
