

section .text
GLOBAL _start

_start:
    push nmb
    call n_fact

    push magic_str
    push eax
    call n_to_str

    mov ecx, magic_str		  ; call write
    mov edx, eax            ; str_ln
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 1		    ; return
    mov ebx, 0
    int 80h

n_fact:
    push ebp
    mov ebp, esp
    mov ecx, [ebp+8]
    mov eax, 1

f_lp:
    test ecx,ecx
    jz end
    mul ecx
    sub ecx, 1
    jmp f_lp

end:
    mov esp, ebp
    pop ebp
    ret

n_to_str:
    push ebp
    mov ebp, esp
    push 0
    push 10
    mov eax, [ebp+8]
    mov dh, 10
div_10:

    div dh
    add ah, 0x30
    mov cx, 0
    mov cl, ah
    push cx
    mov ah,0
    test al, al
    jnz div_10

    mov edx, [ebp+12]
    mov ecx, 0        ; str_ln count
stk_rec:
    pop ax
    mov [edx], al
    add edx, 1
    add ecx, 1
    test al, al
    jz final
    jmp stk_rec

final:
    add ecx, 1
    mov eax, ecx      ; return str_ln
    mov esp, ebp
    pop ebp
    ret

section .data
    nmb equ 6

section .bss
    magic_str: resb 10
