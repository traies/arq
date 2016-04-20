;main.asm
GLOBAL main
EXTERN printf

section .rodata
fmt_n db  'Cantidad de argumentos: %d', 10, 0
fmt_arg db "Argumento %d: %s " , 10, 0

section .text
main:
    push ebp ;Armado de stack frame
    mov ebp,esp ;
    push dword[ebp+8]
    push fmt_n
    call printf

    add esp, 8
    mov ebx, 1
    push ebx
.lp:
    pop ebx
    cmp ebx, [ebp+8]
    je .end
    push ebx
    mov edx, dword[ebp+12]
    push dword[edx + ebx * 4]
    push ebx
    push fmt_arg
    call printf
    add esp, 12
    pop ebx
    inc ebx
    push ebx
    jmp .lp
.end:
    add esp,2*4
    mov eax,0
    mov esp,ebp ;Desarmado de stack frame
    pop ebp
    ret
