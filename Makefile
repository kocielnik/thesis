personal_dir=personal
in=$(personal_dir)/*.md
editor=vim
out=out.pdf
shipdir=~
name=dissertation.pdf

.PHONY: test, clean, ed

all: paper
tex: out=out.tex
tex: paper
paper:
	@pandoc $(addopts) \
		--listings \
		--include-in-header=fignos_settings.tex \
		--include-in-header=$(personal_dir)/labels.tex \
		-f markdown \
		--filter=pandoc-fignos \
		--filter=pandoc-eqnos \
		--filter=pandoc-crossref \
		--citeproc \
		--top-level-division=chapter \
		--resource-path=:$(personal_dir):$(personal_dir)/infocard \
		meta.yaml \
		frontmatter.tex \
		$(in) \
		--pdf-engine=lualatex \
		-t latex \
		-o $(out)
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
