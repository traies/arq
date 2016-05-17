
#include "types.h"
#include "klib.h"
#include "arch/vdriv.h"
#include "arch/kdriv.h"

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

static int i = 0;
static char * vptr = (char *) 0xB8000;
static char pulse = 0;
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
