GLOBAL _start
extern n_to_str
section .text
_start:
  mov eax, 20
  int 80h

  push magic_string
  push eax
  call n_to_str

  mov ecx, magic_string
  mov edx, eax
  mov ebx, 1
  mov eax, 4
  int 80h

  mov eax, 1		    ; return
	mov ebx, 0
	int 80h

section .bss
    magic_string: resb 20
