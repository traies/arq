;hello_world.asm

GLOBAL main
EXTERN hello_world_c
section .text
main:
    call hello_world_c
    mov eax,1 ;systemcallexit()
    mov ebx,0 ;parametroparaexit()
    int 80h
