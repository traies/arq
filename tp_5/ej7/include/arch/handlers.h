/*
 * handlers.h
 *
 *  Created on: Apr 18, 2010
 *      Author: anizzomc
 */

#ifndef HANDLERS_H_
#define HANDLERS_H_

#include "types.h"

void irqDispatcher(dword irq);
void syscall_dispatcher(dword eax, dword ebx, dword ecx, dword edx, dword esx, dword edi);
void int_08_hand();

#endif /* HANDLERS_H_ */
