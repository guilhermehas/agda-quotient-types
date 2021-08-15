PDFLAT=pdflatex
PRESENTATION=agda-quotient-types

default: pdf

agda:
	agda --latex $(PRESENTATION).lagda.tex

pdf: agda
	cd latex; \
	$(PDFLAT) --pdf $(PRESENTATION).tex

install:
	mkdir -p $(out)
	cp latex/$(PRESENTATION).pdf $(out)/$(PRESENTATION).pdf

clean:
	rm -f *.out
	rm -rf latex
