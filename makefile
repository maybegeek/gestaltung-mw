PANDOC=/usr/bin/pandoc
RM=/bin/rm

SOURCE_DOCS := $(wildcard *mw-gestaltungsrichtlinien.md)
EXPORTED_DOCS := $(SOURCE_DOCS:.md=.pdf)
EXPORTED_TEXS := $(SOURCE_DOCS:.md=.tex)
EXPORTED_MDS := $(SOURCE_DOCS:.md=.markdown.md)

PANDOC_PDF_OPTIONS=--pdf-engine=xelatex \
--from=markdown \
--template=layout/mw-gestaltungsrichtlinien.tex \
layout/mw-gestaltungsrichtlinien.yaml

PANDOC_TEX_OPTIONS=--from=markdown \
--template=layout/mw-gestaltungsrichtlinien.tex \
layout/mw-gestaltungsrichtlinien.yaml

PANDOC_MD_OPTIONS=layout/mw-gestaltungsrichtlinien.yaml

%.pdf : %.md
	$(PANDOC) $(PANDOC_PDF_OPTIONS) -o $@ $<
	
%.tex : %.md
	$(PANDOC) $(PANDOC_TEX_OPTIONS) -o $@ $<
	
%.markdown.md : %.md
	$(PANDOC) $(PANDOC_MD_OPTIONS) -o $@ $<

.PHONY: all clean

all : $(EXPORTED_DOCS)

tex : $(EXPORTED_TEXS)

md : $(EXPORTED_MDS)

clean:
	- $(RM) $(EXPORTED_DOCS)
