all: everyip polyglot polyglot.bin

everyip: everyip.c
	gcc -O3 -o $@ $<

polyglot.o: polyglot.S
	gcc -m32 -c -o $@ $<

polyglot: polyglot.o
	gcc -m32 -o $@ $<

polyglot.bin: polyglot.o
	objcopy -O binary -j .text $< $@
