INC_PATH = include/
DIRECTIVES = -fno-builtin -nostartfiles -nostdlib -I $(INC_PATH)
FLAGS = -g -m32 -c

all:
	nasm -f aout -g loader.asm -o loader.o
	nasm -f aout -g kinput.asm -o kinput.o
	gcc $(FLAGS) kernel.c  -o kernel.o $(DIRECTIVES)
	gcc $(FLAGS) vdriv.c -o vdriv.o $(DIRECTIVES)
	ld -melf_i386 -T link.ld -o kernel.bin kernel.o kinput.o vdriv.o loader.o
	rm *.o
	mcopy kernel.bin z:/boot -o
clean:
	rm *.o
	rm kernel.bin
