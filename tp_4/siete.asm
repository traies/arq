;siete.asm
GLOBAL siete

section .text
siete:
  push ebp
  mov ebp, esp

  mov eax, 7
  leave
  ret
