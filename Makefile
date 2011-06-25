# the name of master document
OUTPUT=fieldtest

#######################
# HTML
#######################

DEFAULTSTYLE=/usr/share/doc/docutils-0.7/html/html4css1.css
EXTRASTYLES=extrastyles.css

html: $(OUTPUT).html

$(OUTPUT).html: *.rst
	rst2html.py --stylesheet=$(DEFAULTSTYLE),$(EXTRASTYLES) $(OUTPUT).rst > $(OUTPUT).html



#######################
# LaTeX
#######################

LATEXDIR = latex
latex: $(OUTPUT).pdf

$(OUTPUT).pdf: $(LATEXDIR)/$(OUTPUT).tex
	cd $(LATEXDIR);				\
	pdflatex $(OUTPUT).tex;		\
	pdflatex $(OUTPUT).tex;		\
	mv $(OUTPUT).pdf ..

$(LATEXDIR)/$(OUTPUT).tex: *.rst
	rst2latex.py $(OUTPUT).rst > $(LATEXDIR)/$(OUTPUT).tex




clean:
	rm -f $(LATEXDIR)/*

reallyclean: clean
	rm -f *pdf *html

all: latex html
