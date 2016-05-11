GLOBAL sec, min, hour, set

section .text
sec:
    mov al, 0
    out 70h, al
    xor eax, eax
    in al, 71h
    ret

min:
    mov al, 0x02
    out 70h, al
    xor eax, eax
    in al, 71h
    ret

hour:
    xor ax, ax
    mov al, 0x04
    out 70h, al
    xor eax, eax
    in al, 71h
    ret

set:
  xor ax, ax
  mov al, 0Bh
  out 70h, al
  in al, 71h
  or al, 04h
  push eax
  mov al, 0Bh
  out 70h, al
  pop eax
  out 71h, al
  ret
