latex: fieldtest.pdf

fieldtest.pdf: fieldtest.tex fieldtest.rst
	pdflatex fieldtest.tex
	pdflatex fieldtest.tex

fieldtest.tex: fieldtest.rst
	rst2latex.py fieldtest.rst > fieldtest.tex




html: fieldtest.html

fieldtest.html: fieldtest.rst
	rst2html.py fieldtest.rst > fieldtest.html




clean:
	rm *log *aux *out *tex

reallyclean: clean
	rm *pdf *html
