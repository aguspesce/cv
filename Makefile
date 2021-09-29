CSS_STYLE=style/style.css
HTML_TEMPLATE=style/template.html
DATE="$(shell LANG="en_EN" && date "+%B %Y")"
PANDOC_ARGS=--standalone --from markdown --to html5 --css $(CSS_STYLE) --metadata date=$(DATE) --template $(HTML_TEMPLATE)

OUT_DIR=_build

help:
	@echo ""
	@echo "  html           generate the html file for the academic CV in English."
	@echo "  pdf_academic   generate the pdf files for the academic CV."
	@echo "  pdf            generate the pdf fils for  the non-academic CV."
	@echo "  server  "
	@echo "  clean          clean up puild and generated files."


html: academic-cv_en.md $(CSS_STYLE) | $(OUT_DIR)
	cp -rf style $(OUT_DIR)
	touch $(OUT_DIR)/.nojekyll
	pandoc $(PANDOC_ARGS) -o $(OUT_DIR)/index.html $<
	@echo ""
	@echo "HTML file created in $(OUT_DIR)"

serve: html
	cd $(OUT_DIR) && python -m http.server 8002

clean:
	rm -rf $(OUT_DIR)

pdf_academic: academic_pdf_en
	@echo ""
	@echo "Academic CV created in $(OUT_DIR_ACADEMIC)"

pdf: pdf_en
	@echo ""
	@echo "Non academic CV created in $(OUT_DIR)"


$(OUT_DIR):
	mkdir $(OUT_DIR)


academic_pdf_en: $(OUT_DIR)/academic-cv_en.pdf

$(OUT_DIR)/%.pdf: %.md | $(OUT_DIR)
	pandoc $(PANDOC_ARGS) -o $@ $<

pdf_en: $(OUT_DIR)/cv_en.pdf

$(OUT_DIR)/%.pdf: %.md | $(OUT_DIR)
	pandoc $(PANDOC_ARGS) -o $@ $<
