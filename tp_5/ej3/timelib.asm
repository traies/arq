GLOBAL sec, min, hour

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
