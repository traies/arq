GLOBAL _start
extern n_to_str

section .text
_start:
  mov ebp, esp
  mov ecx, 0
  mov edx, 300
  push edx

print_lp:
  mov bl, [ebp]
  inc ecx
  inc ebp
  push magic_string
  push ecx
  call n_to_str
  mov ecx, magic_string
  mov edx, eax
  mov ebx, 1
  mov eax, 4
  int 80h

  pop ecx
  jmp print_lp

  mov eax, 1		    ; return
  mov ebx, 0
  int 80h


section .bss
    magic_string: resb 20
