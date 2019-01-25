in=personal/*.md
editor=vim
out=out.pdf
shipdir=~
name=dissertation.pdf

.PHONY: test, clean, ed

all: paper
paper: whatsnew.tex
	@pandoc $(addopts) \
		--listings \
		--include-in-header=personal/labels.tex \
		-f markdown \
		--filter=pandoc-fignos \
		--filter=pandoc-eqnos \
		--filter=pandoc-crossref \
		--filter=pandoc-plantuml \
		--filter=pandoc-citeproc \
		--top-level-division=chapter \
		--resource-path=:personal:personal/infocard \
		meta.yaml \
		frontmatter.tex \
		$(in) \
		--pdf-engine=lualatex \
		-t latex \
		-o $(out)
	@rm whatsnew.tex
whatsnew.tex:
	@git log --max-count=7 > whatsnew.tex
verbose: addopts=--verbose
verbose: paper
ed:
	@$(editor) $(in)
show:
	@xdg-open $(out)
test:
	@validation/test_essay.py ../$(out)
ship:
	cp $(out) $(shipdir)/$(name)
clean:
	rm $(out)
