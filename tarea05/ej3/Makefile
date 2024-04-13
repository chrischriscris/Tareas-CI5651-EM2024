.PHONY: all
all: TikTokToe.jar

TikTokToe.jar: src/TikTokToe.kt
	kotlinc src/TikTokToe.kt -include-runtime -d TikTokToe.jar

run: TikTokToe.jar
	java -jar TikTokToe.jar

clean:
	rm -f TikTokToe.jar src/*.class src/META-INF/*.class
