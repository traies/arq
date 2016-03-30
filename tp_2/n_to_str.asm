; NOTA: hice el ejercicio en 8 bits porque me parecio mas facil.
;       tampoco verifico que el numero sea un entero.
section .text
GLOBAL n_to_str, _start

;_start:
;    push magic_string
;    push magic_number
;    call n_to_str
;
;    mov ecx, magic_string		; call write
;  	mov edx, eax            ; str_ln
;  	mov ebx, 1
;  	mov eax, 4
;  	int 80h
;
;  	mov eax, 1		    ; return
;  	mov ebx, 0
;  	int 80h


n_to_str:
    push ebp
    mov ebp, esp
    push 0
    push 10
    mov eax, [ebp+8]  ; n
    mov edx, 0
    mov ebx, 10
div_10:

    div ebx
    add edx, 0x30
    push edx
    mov edx, 0
    test eax, eax
    jnz div_10

    mov edx, [ebp+12]
    mov ecx, 0        ; str_ln count
stk_rec:
    pop eax
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
    magic_number equ 126

section .bss
    magic_string: resb 20
