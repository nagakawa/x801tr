TEX=xelatex
TEXFLAGS=-interaction=nonstopmode -halt-on-error

all: out/1.pdf

#out/1.pdf: 1/dict/dict.tex

%/dict/dict.tex: \
		%/dict/main.dict \
		%/dict/options.json \
		workfiles/dict-to-tex.pl6
	perl6 workfiles/dict-to-tex.pl6 \
		$< \
		$@ \
		$*/dict/options.json

out/%.pdf: %/main.tex common/uruwi.sty
	mkdir -p out
	$(TEX) $(TEXFLAGS) -jobname=$* -output-directory=out $< || (rm $@; false)
	$(TEX) $(TEXFLAGS) -jobname=$* -output-directory=out $< || (rm $@; false)

clean:
	rm -rf out
