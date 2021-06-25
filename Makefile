CSS_STYLE=style/style.css
HTML_TEMPLATE=style/template.html
DATE="$(shell LANG="en_EN" && date "+%B %Y")"
PANDOC_ARGS=--standalone --from markdown --to html5 --css $(CSS_STYLE) --metadata date=$(DATE) --template $(HTML_TEMPLATE)

OUT_DIR_ACADEMIC=_build
OUT_DIR=_build-non-academic

help:
	@echo ""
	@echo "  html           generate the html file for the academic CV in English."
	@echo "  pdf_academic   generate the pdf files for the academic CV."
	@echo "  pdf            generate the pdf fils for  the non-academic CV."
	@echo "  server  "
	@echo "  clean          clean up puild and generated files."


html: academic-cv_en.md $(CSS_STYLE) | $(OUT_DIR_ACADEMIC)
	cp -rf style $(OUT_DIR_ACADEMIC)
	touch $(OUT_DIR_ACADEMIC)/.nojekyll
	pandoc $(PANDOC_ARGS) -o $(OUT_DIR_ACADEMIC)/index.html $<
	@echo ""
	@echo "HTML file created in $(OUT_DIR_ACADEMIC)"

serve: html
	cd $(OUT_DIR_ACADEMIC) && python -m http.server 8002

clean:
	rm -rf $(OUT_DIR_ACADEMIC)
	rm -rf $(OUT_DIR)

pdf_academic: academic_pdf_es academic_pdf_en
	@echo ""
	@echo "Academic CV created in $(OUT_DIR_ACADEMIC)"

pdf: pdf_es pdf_en
	@echo ""
	@echo "Non academic CV created in $(OUT_DIR)"


$(OUT_DIR):
	mkdir $(OUT_DIR)

$(OUT_DIR_ACADEMIC):
	mkdir $(OUT_DIR_ACADEMIC)

academic_pdf_es: $(OUT_DIR_ACADEMIC)/academic-cv_es.pdf

academic_pdf_en: $(OUT_DIR_ACADEMIC)/academic-cv_en.pdf

$(OUT_DIR_ACADEMIC)/%.pdf: %.md | $(OUT_DIR_ACADEMIC)
	pandoc $(PANDOC_ARGS) -o $@ $<

pdf_es: $(OUT_DIR)/cv_es.pdf

pdf_en: $(OUT_DIR)/cv_en.pdf

$(OUT_DIR)/%.pdf: %.md | $(OUT_DIR)
	pandoc $(PANDOC_ARGS) -o $@ $<
