#!/usr/bin/bash

# Ordner erstellen, temporär,
# für den Vergleich der bisherigen
# und zu erstellenden PDF-Datei.
mkdir diff-dir

# Herunterladen der aktuellen Datei
# und Kopieren der Datei in den
# temporären Ordner.
wget https://github.com/maybegeek/gestaltung-mw/raw/master/mw-gestaltungsrichtlinien.pdf \
-O diff-dir/mw-gestaltungsrichtlinien-orig.pdf

# Erstellen einer überarbeiteten
# Version der Gestaltrichtlinien um
# Änderungen zu visualisieren.
pandoc --from=markdown \
--pdf-engine=xelatex \
--template=layout/mw-gestaltungsrichtlinien.tex \
layout/mw-gestaltungsrichtlinien.yaml \
-o diff-dir/mw-gestaltungsrichtlinien-neu.pdf \
mw-gestaltungsrichtlinien.md

# Visualisieren der Änderungen mit `diffpdf`
# diffpdf wird geöffnet:
diffpdf -a diff-dir/mw-gestaltungsrichtlinien-orig.pdf \
-a diff-dir/mw-gestaltungsrichtlinien-neu.pdf

# Nach Schließen des Programms wird der 
# temporäre Ordner samt heruntergeladener Datei
# und gerade erstellter PDF-Datei gelöscht.
rm -rf diff-dir/
