all: xge buildxen

clean:
	rm -rf xge buildxen

%: src/%/*.c
	clang src/$@/*.c -o $@ -lraylib -lm `pkg-config --cflags --libs libconfig` -g

install: xge buildxen
	cp xge buildxen /usr/local/bin/