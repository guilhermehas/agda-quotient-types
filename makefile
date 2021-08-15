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
	rm -rf latex

distclean: clean
	rm -f *.agdai
	rm -f _region_.tex
	rm -rf .auctex-auto
	rm -f *.log
	rm -f result
