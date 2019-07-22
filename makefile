PANDOC=/usr/bin/pandoc
RM=/bin/rm

SOURCE_DOCS := $(wildcard *md.md)
EXPORTED_DOCS := $(SOURCE_DOCS:.md=.pdf)
EXPORTED_TEXS := $(SOURCE_DOCS:.md=.tex)

PANDOC_PDF_OPTIONS=--pdf-engine=xelatex \
--template=layout/mwmd.tex \
layout/mwmd.yaml \
--filter pandoc-citeproc \
--lua-filter=layout/multiple-bibliographies.lua

PANDOC_TEX_OPTIONS=--template=layout/mwmd.tex \
layout/mwmd.yaml \
--filter pandoc-citeproc \
--lua-filter=layout/multiple-bibliographies.lua

%.pdf : %.md
	$(PANDOC) $(PANDOC_PDF_OPTIONS) -o $@ $<
	
%.tex : %.md
	$(PANDOC) $(PANDOC_TEX_OPTIONS) -o $@ $<

.PHONY: all clean

all : $(EXPORTED_DOCS) $(EXPORTED_TEXS)

tex : $(EXPORTED_TEXS)

clean:
	- $(RM) $(EXPORTED_DOCS)
