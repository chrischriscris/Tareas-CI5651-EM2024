.PHONY: all
all: Main

Main: src/*.hs
	ghc -o Main src/*.hs -O2

clean:
	rm -f Main src/*.o src/*.hi
