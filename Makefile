all: xge buildxen

clean:
	rm -rf xge buildxen

bios.bin: build/b_bios.obj
	ld65 -v -o bios.bin build/b_*.obj -m bios.map -C conf/xenon_bios.ld

%: src/%/*.c
	clang src/$@/*.c -o $@ -lraylib -lm `pkg-config --cflags --libs libconfig` -g

install: xge buildxen
	cp xge buildxen /usr/local/bin/