.PHONY: all
all: src/main.class

src/main.class: src/main.scala
	cd src; \
	scalac3 main.scala

run: src/main.class
	scala3 -classpath src main $(FILE)

clean:
	rm -f src/*.class src/*.tasty
