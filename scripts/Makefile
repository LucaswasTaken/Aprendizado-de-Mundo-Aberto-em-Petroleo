MAIN := main
SOURCE := livro/main.tex
OUTDIR := build
DIST := dist/Aprendizado-de-Mundo-Aberto-em-Petroleo.pdf
AUX  := aux bbl blg idx ilg ind lof log lol lot out spl toc fls fdb_latexmk

.PHONY: all clean distclean check

all: $(DIST)

$(OUTDIR)/$(MAIN).pdf: scripts/Makefile $(SOURCE) livro/preambulo.tex livro/referencias.bib \
                       $(wildcard livro/capitulos/*.tex) $(wildcard livro/apendices/*.tex) \
                       $(wildcard livro/frontmatter/*.tex) \
                       $(wildcard livro/editorial/*.pdf)
	mkdir -p $(OUTDIR)
	pdflatex -output-directory=$(OUTDIR) -interaction=nonstopmode $(SOURCE)
	bibtex $(OUTDIR)/$(MAIN)
	makeindex -o $(OUTDIR)/$(MAIN).ind $(OUTDIR)/$(MAIN).idx
	pdflatex -output-directory=$(OUTDIR) -interaction=nonstopmode $(SOURCE)
	pdflatex -output-directory=$(OUTDIR) -interaction=nonstopmode $(SOURCE)

$(DIST): $(OUTDIR)/$(MAIN).pdf
	mkdir -p $(dir $(DIST))
	cp $(OUTDIR)/$(MAIN).pdf $(DIST)

check: $(DIST)
	@echo "Erros:                  $$(grep -c '^! ' $(OUTDIR)/$(MAIN).log || true)"
	@echo "Referencias indefinidas: $$(grep -c 'undefined' $(OUTDIR)/$(MAIN).log || true)"
	@echo "Paginas:                $$(sed -n 's/.*main\.pdf (\([0-9][0-9]*\) pages.*/\1/p' $(OUTDIR)/$(MAIN).log | tail -1)"

clean:
	rm -rf $(OUTDIR)
	rm -f $(addprefix $(MAIN).,$(AUX))

distclean: clean
	rm -f $(DIST)
