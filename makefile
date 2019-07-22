PANDOC=/usr/bin/pandoc
RM=/bin/rm

SOURCE_DOCS := $(wildcard *md.md)
EXPORTED_DOCS := $(SOURCE_DOCS:.md=.pdf)
EXPORTED_TEXS := $(SOURCE_DOCS:.md=.tex)
EXPORTED_MDS := $(SOURCE_DOCS:.md=.markdown.md)

PANDOC_PDF_OPTIONS=--pdf-engine=xelatex \
--template=layout/mwmd.tex \
layout/mwmd.yaml

PANDOC_TEX_OPTIONS=--template=layout/mwmd.tex \
layout/mwmd.yaml

PANDOC_MD_OPTIONS=layout/mwmd.yaml

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
