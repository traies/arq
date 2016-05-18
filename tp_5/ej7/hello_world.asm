GLOBAL hello_world_asm
GLOBAL marker
section .text

hello_world_asm:
  push ebp
  mov ebp, espn
  push ebx
  push ecx
  push edx
  mov eax, 4
  mov ebx, 1
  mov ecx, hello
  mov edx, str_ln
marker:
  int 80h
  pop edx
  pop ecx
  pop ebx
  leave
  ret

section .data
  hello db "h4ppy c0d1ng", 10 ; string original
  str_ln equ 13
