PANDOC=/usr/bin/pandoc
RM=/bin/rm

SOURCE_DOCS := $(wildcard *md.md)
EXPORTED_DOCS := $(SOURCE_DOCS:.md=.pdf)

PANDOC_PDF_OPTIONS=--pdf-engine=xelatex \
--template=layout/mwmd.tex \
layout/mwmd.yaml \
--filter pandoc-citeproc

%.pdf : %.md
	$(PANDOC) $(PANDOC_PDF_OPTIONS) -o $@ $<

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)
