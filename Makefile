TYP  := Vadim_Liventsev_CV.typ
BIB  := publications.bib
PDF  := Vadim_Liventsev_CV.pdf

TYPST ?= typst

.PHONY: all export open watch clean help

all: $(PDF)

export: $(PDF)

$(PDF): $(TYP) $(BIB)
	$(TYPST) compile "$<" "$@"

open: $(PDF)
	open "$<"

watch:
	$(TYPST) watch "$(TYP)" "$(PDF)"

clean:
	rm -f $(PDF)

help:
	@echo "make        build $(PDF) from $(TYP)"
	@echo "make export build $(PDF), including cited entries from $(BIB)"
	@echo "make open   build, then open the PDF"
	@echo "make watch  rebuild the PDF when the source changes"
	@echo "make clean  remove the PDF"
