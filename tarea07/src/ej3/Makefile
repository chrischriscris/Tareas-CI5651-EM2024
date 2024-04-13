.PHONY: all
all: prefixSuffix.pdf

prefixSuffix.pdf: main.typ prefix-suffix.typ
	typst compile main.typ prefixSuffix.pdf

clean:
	rm -f prefixSuffix.pdf
