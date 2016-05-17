
#include "types.h"
#include "klib.h"
#include "arch/vdrive.h"

void irqDispatcher(dword irq){
	switch(irq) {
		case 0:
			int_08();
			break;
	}
	return;
}

static int i = 0;
static char * vptr = (char *) 0xB8000;

/* Time tick */
void int_08(){
	i++;
	if (i < 5) {
		i = 0;
		println("Hello world ", &vptr, 0x29);
	}
}
