; NOTA: agregue un push 10 a n_to_str para que haga un
;       salto de linea

section .text
GLOBAL _start

_start:
    push n_arr
    push k_num
    push n_num
    call n_mul


    mov  ecx, 0
arr_lp:
    push eax
    push ecx
    push magic_str
    mov eax, [n_arr+ecx*4]
    push eax
    call n_to_str
    add esp, 8

    mov ecx, magic_str		  ; call write
    mov edx, eax            ; str_ln
    mov ebx, 1
    mov eax, 4
    int 80h

    pop ecx
    pop eax
    add ecx, 1
    sub eax, 1
    test eax, eax
    jnz arr_lp



    mov eax, 1		        ; return
    mov ebx, 0
    int 80h

n_mul:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]      ; n_num
    mov ecx, 0
    mov ebx, [ebp+16]     ; n_arr

mul_lp:
    mul ecx
    mov edx, [ebp+12]     ; k_num (tiene que haber algo mejor)
    cmp eax, edx
    jg f
    mov [ebx], eax
    add ebx, 4
    add ecx, 1
    mov eax, [ebp+8]
    jmp mul_lp
f:
    mov eax, ecx
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
    n_num equ 3
    k_num equ 35
    magic_str db 10

section .bss
    n_arr: resb 100
