GLOBAL _start

section .text
_start:

  mov eax, 2
  int 80h

  test eax, eax
  jnz parent_print
  mov ecx, child_str
  mov edx, 12
  jmp print

parent_print:
  mov ecx, parent_str
  mov edx, 13

print:
  mov ebx, 1
  mov eax, 4
  int 80h

  mov eax, 1		    ; return
	mov ebx, 0
	int 80h

section .data
  parent_str db "soy el padre", 10
  child_str db "soy el hijo", 10
