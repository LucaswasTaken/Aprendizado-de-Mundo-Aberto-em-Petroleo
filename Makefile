MAIN := main
AUX  := aux bbl blg idx ilg ind lof log lol lot out spl toc fls fdb_latexmk

.PHONY: all clean distclean check

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex preambulo.tex referencias.bib \
             $(wildcard capitulos/*.tex) $(wildcard apendices/*.tex) \
             $(wildcard frontmatter/*.tex)
	pdflatex -interaction=nonstopmode $(MAIN).tex
	bibtex $(MAIN)
	makeindex $(MAIN)
	pdflatex -interaction=nonstopmode $(MAIN).tex
	pdflatex -interaction=nonstopmode $(MAIN).tex

check: $(MAIN).pdf
	@echo "Erros:                  $$(grep -c '^! ' $(MAIN).log || true)"
	@echo "Referencias indefinidas: $$(grep -c 'undefined' $(MAIN).log || true)"
	@echo "Paginas:                $$(grep -o 'Output written on $(MAIN).pdf ([0-9]*' $(MAIN).log | grep -o '[0-9]*$$')"

clean:
	rm -f $(addprefix $(MAIN).,$(AUX))

distclean: clean
	rm -f $(MAIN).pdf
