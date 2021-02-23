PROJECT=cv
PROJECT_ES=cv_es

CSS_STYLE=style/style.css
HTML_TEMPLATE=style/default.html

DATE="$(shell LANG="en_EN" && date "+%B %Y")"
PANDOC_ARGS=--standalone --from markdown --to html5 --css $(CSS_STYLE) --metadata date=$(DATE) --template $(HTML_TEMPLATE)

OUTDIR=_build

all: pdf

pdf: $(PROJECT).md $(CSS_STYLE) | $(OUTDIR)
	pandoc $(PANDOC_ARGS) -o $(OUTDIR)/$(PROJECT).pdf $<

html: $(PROJECT).md $(CSS_STYLE) | $(OUTDIR)
	cp -rf style $(OUTDIR)
	touch $(OUTDIR)/.nojekyll
	pandoc $(PANDOC_ARGS) -o $(OUTDIR)/index.html $<

serve: html
	cd $(OUTDIR) && python -m http.server 8002

clean:
	rm -rf $(OUTDIR)

$(OUTDIR):
	mkdir $(OUTDIR)
