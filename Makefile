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
		-f markdown \
		--filter=pandoc-fignos \
		--filter=pandoc-eqnos \
		--filter=pandoc-crossref \
		--bibliography=bib/dsr.bib \
		--bibliography=bib/architecture.bib \
		--bibliography=bib/practical_measurement.bib \
		--top-level-division=chapter \
		--resource-path=:$(personal_dir):$(personal_dir)/infocard \
		meta.yaml \
		$(personal_dir)/labels.tex \
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
