.PHONY: all
all: peeler/Utils.class \
	peeler/SStack.class \
	peeler/Peeler.class \
	peeler/peel.class

peeler/Utils.class: peeler/Utils.scala
	scalac3 -classpath .:peeler peeler/Utils.scala

peeler/SStack.class: peeler/SStack.scala
	scalac3 -classpath .:peeler peeler/SStack.scala

peeler/Peeler.class: peeler/Peeler.scala peeler/SStack.class
	scalac3 -classpath .:peeler peeler/Peeler.scala

peeler/peel.class: peeler/Main.scala peeler/Peeler.class peeler/Utils.class
	scalac3 -classpath .:peeler peeler/Main.scala

run: peeler/peel.class
	scala3 -classpath peeler peeler.peel $(FILE)

clean:
	rm -f peeler/*.class peeler/*.tasty
