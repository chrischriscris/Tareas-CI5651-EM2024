.PHONY: all
all: Main

Main: src/*.hs
	ghc -o WPSTree src/*.hs -O2

clean:
	rm -f WPSTree src/*.o src/*.hi

