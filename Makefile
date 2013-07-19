thesis: thesis.tex thesis.pdf

thesis.pdf: thesis.tex
	xelatex thesis
	bibtex thesis
	bibtex thesis
	xelatex thesis
	xelatex thesis

clean:
	rm -v *.aux *.log *.toc *.ind *.gls *.glo *.idx *.ilg *.out *.bbl *.thm *.blg *.lot *.lof *~
