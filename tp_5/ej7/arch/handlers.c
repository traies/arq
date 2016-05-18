
#include "types.h"
#include "klib.h"
#include "arch/vdriv.h"
#include "arch/kdriv.h"

void sys_write(int fd, const void * buf, unsigned int count);
void sys_write_out(const void * buf, unsigned int count);
void sys_write_err(const void * buf, unsigned int count);

static int i = 0;
static char * vptr = (char *) 0xB8000;
static char pulse = 0;

void irqDispatcher(dword irq){
	switch(irq) {
		case 0:
			int_08();
			break;
		case 1:
			int_09();
			break;
	}
	return;
}

void syscall_dispatcher(dword eax, dword ebx, dword ecx, dword edx, dword esx, dword edi){
	switch(eax){
		case 4:
			sys_write(ebx, ecx, edx);
	}
}

/* sys_write */
void sys_write(int fd, const void * buf, unsigned int count){
	if (fd == 1) {
		sys_write_out(buf, count);
	}
	else if (fd == 2) {
		sys_write_err(buf, count);
	}
}

/* stdout */
void sys_write_out(const void * buf, unsigned int count){
	printlength(buf, &vptr, 0x29, count);
}

/* std_err */
void sys_write_err(const void * buf, unsigned int count){
	printlength(buf, &vptr, 0x49, count);
}


/* Time tick */
void int_08(){
	char a;
	// if (pulse) {
	// 	*vptr = '|';
	// 	pulse = 0;
	// }
	// else {
	// 	*vptr = ' ';
	// 	pulse = 1;
	// }
}

/* Keyboard */
void int_09(){
	/* imprimir en pantalla */
	if (kstatus()) {
		char c [2];
		c[0] = get_key(kinput());
		c[1] = 0;
		println(c, &vptr, 0x29);
	}
}
