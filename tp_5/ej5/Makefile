INC_PATH = include/
DIRECTIVES = -fno-builtin -nostartfiles -nostdlib -I $(INC_PATH)
FLAGS = -g -m32 -c

all:
	nasm -f aout -g loader.asm -o loader.o 
	nasm -f aout -g asm/interrupts.asm -o asm_interrupts.o
	
	gcc $(FLAGS) arch/vdriv.c -o vdriv.o $(DIRECTIVES)
	gcc $(FLAGS) arch/handlers.c -o arch_hanlders.o $(DIRECTIVES)
	gcc $(FLAGS) kernel.c -o kernel.o $(DIRECTIVES) 
	
	ld -melf_i386 -T link.ld -o kernel.bin loader.o kernel.o asm_interrupts.o arch_hanlders.o vdriv.o
	rm *.o
	mcopy kernel.bin y:/boot -o
clean:
	rm *.o
	rm kernel.bin
	
