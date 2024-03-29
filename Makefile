# the name of master document
OUTPUT=fieldtest

#######################
# HTML
#######################

DEFAULTSTYLE=/usr/lib/python2.6/site-packages/docutils/writers/html4css1/html4css1.css
EXTRASTYLES=extrastyles.css

html: $(OUTPUT).html

$(OUTPUT).html: *.rst
	rst2html.py --stylesheet=$(DEFAULTSTYLE),$(EXTRASTYLES) $(OUTPUT).rst > $(OUTPUT).html



#######################
# LaTeX
#######################

LATEXDIR = latex
LATOPTIONS = --stylesheet-path=extrastyles.tex
latex: $(OUTPUT).pdf

$(OUTPUT).pdf: $(LATEXDIR)/$(OUTPUT).tex
	cd $(LATEXDIR);				\
	pdflatex $(OUTPUT).tex;		\
	pdflatex $(OUTPUT).tex;		\
	mv $(OUTPUT).pdf ..

$(LATEXDIR)/$(OUTPUT).tex: *.rst
	rst2latex.py --stylesheet-path=../extrastyles.tex $(OUTPUT).rst > $(LATEXDIR)/$(OUTPUT).tex




clean:
	rm -f $(LATEXDIR)/*

reallyclean: clean
	rm -f *pdf *html

all: latex html

wordcount:
	@wc -w *rst|grep total

todos:
	@grep --color=auto TODO *rst

# progon oma apu.
upload:
	scp -r fieldtest.html pics/ viuhka.fi:pubic_html/unixopas/
