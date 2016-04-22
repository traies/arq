;loader.asm

GLOBAL _start
EXTERN main

section .text
_start:
  push ebp
  mov ebp, esp
  lea eax, [ebp + 8]
  push eax
  push dword[ebp + 4]
  call main
  leave
  mov eax, 1
  int 80h
