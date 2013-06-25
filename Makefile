thesis: thesis.tex thesis.pdf

thesis.pdf: thesis.tex
	xelatex thesis
	bibtex thesis
	bibtex thesis
	xelatex thesis
	xelatex thesis
	pdf2htmlEX --zoom 1.33 thesis.pdf

clean:
	rm -v *.aux *.log *.toc *.ind *.gls *.glo *.idx *.ilg *.out *.bbl *.thm *.blg *.lot *.lof *~
