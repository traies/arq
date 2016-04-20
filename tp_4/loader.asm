;loader.asm

GLOBAL _start
EXTERN main

section .text
_start:
  push ebp
  mov ebp, esp
  lea eax, [ebp + 12]
  push eax
  push dword[ebp + 8]
  call main
  leave
  mov eax, 1
  int 80h
