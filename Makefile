HTML := Vadim_Liventsev_CV.html
PDF  := Vadim_Liventsev_CV.pdf

# Headless browser used to render the PDF. Override with:
#   make CHROME=/path/to/chromium
CHROME ?= /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

.PHONY: all open clean help

all: $(PDF)

$(PDF): $(HTML)
	"$(CHROME)" \
	  --headless=new \
	  --disable-gpu \
	  --no-pdf-header-footer \
	  --print-to-pdf="$@" \
	  "file://$(CURDIR)/$<"

open: $(PDF)
	open "$<"

clean:
	rm -f $(PDF)

help:
	@echo "make        build $(PDF) from $(HTML)"
	@echo "make open   build, then open the PDF"
	@echo "make clean  remove the PDF"
