all: vadim.pdf
vadim.pdf: vadim.tex page1sidebar.tex
	lualatex vadim.tex