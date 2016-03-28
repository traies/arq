

section .text
GLOBAL _start
extern n_to_str

_start:
  mov ebp, esp

  mov eax, [ebp]
  sub eax, 1
  push magic_string
  push eax
  call n_to_str

  mov ecx, magic_string		; call write
  mov edx, eax            ; str_ln
  mov ebx, 1
  mov eax, 4
  int 80h

  mov eax, 1		    ; return
  mov ebx, 0
  int 80h


  mov esp, ebp
  pop ebp

section .bss
    magic_string: resb 20
