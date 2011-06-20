#######################
# LaTeX
#######################

LATEXDIR = latex
latex: fieldtest.pdf

fieldtest.pdf: $(LATEXDIR)/fieldtest.tex
	cd $(LATEXDIR);				\
	pdflatex fieldtest.tex;		\
	pdflatex fieldtest.tex;		\
	mv fieldtest.pdf ..

$(LATEXDIR)/fieldtest.tex: fieldtest.rst
	rst2latex.py fieldtest.rst > $(LATEXDIR)/fieldtest.tex



#######################
# HTML
#######################

html: fieldtest.html

fieldtest.html: fieldtest.rst
	rst2html.py fieldtest.rst > fieldtest.html




clean:
	rm $(LATEXDIR)/*

reallyclean: clean
	rm *pdf *html

all: latex html
