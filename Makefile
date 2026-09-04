MAIN := main
OUTDIR := build
AUX  := aux bbl blg idx ilg ind lof log lol lot out spl toc fls fdb_latexmk

.PHONY: all clean distclean check

all: $(MAIN).pdf

$(OUTDIR)/$(MAIN).pdf: Makefile $(MAIN).tex preambulo.tex referencias.bib \
                       $(wildcard capitulos/*.tex) $(wildcard apendices/*.tex) \
                       $(wildcard frontmatter/*.tex) \
                       $(wildcard editorial/*.pdf)
	mkdir -p $(OUTDIR)
	pdflatex -output-directory=$(OUTDIR) -interaction=nonstopmode $(MAIN).tex
	bibtex $(OUTDIR)/$(MAIN)
	makeindex -o $(OUTDIR)/$(MAIN).ind $(OUTDIR)/$(MAIN).idx
	pdflatex -output-directory=$(OUTDIR) -interaction=nonstopmode $(MAIN).tex
	pdflatex -output-directory=$(OUTDIR) -interaction=nonstopmode $(MAIN).tex

$(MAIN).pdf: $(OUTDIR)/$(MAIN).pdf
	cp $(OUTDIR)/$(MAIN).pdf $(MAIN).pdf

check: $(MAIN).pdf
	@echo "Erros:                  $$(grep -c '^! ' $(OUTDIR)/$(MAIN).log || true)"
	@echo "Referencias indefinidas: $$(grep -c 'undefined' $(OUTDIR)/$(MAIN).log || true)"
	@echo "Paginas:                $$(sed -n 's/.*main\.pdf (\([0-9][0-9]*\) pages.*/\1/p' $(OUTDIR)/$(MAIN).log | tail -1)"

clean:
	rm -rf $(OUTDIR)
	rm -f $(addprefix $(MAIN).,$(AUX))

distclean: clean
	rm -f $(MAIN).pdf
