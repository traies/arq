

section .text
GLOBAL _start

_start:
    push arr_l
    push arr
    call n_min

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


n_min:
    push ebp
    mov ebp, esp
    mov ebx, [ebp+12]
    test ebx, ebx
    jz n_min_end
    sub ebx, 1
    mov ecx, 0
    mov edx, [ebp+8]
    mov al, [edx]
min_lp:
    test ebx, ebx
    jz n_min_end
    sub ebx, 1
    add edx, 1
    mov cl, [edx]
    cmp al, cl
    jg asg_min
    jmp min_lp


asg_min:
    mov al, cl
    jmp min_lp

n_min_end:
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
    arr_l equ 6
    arr db 10,18,12,15,8,65
section .bss
    magic_str: resb 10
