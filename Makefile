all: xge buildxen

clean:
	rm -rf xge buildxen

bios.bin: build/b_bios.obj
	ld65 -v -o bios.bin build/b_*.obj -m bios.map -C conf/xenon_bios.ld

%: src/%
	clang src/$@/*.c -o $@ -lraylib -lm `pkg-config --cflags --libs libconfig` -g
