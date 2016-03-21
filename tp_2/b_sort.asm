section .text
GLOBAL _start

_start:
  push arr
  push arr_l
  call b_sort

  push magic_str
  mov bl, [arr]
  push ebx
  call n_to_str

  mov ecx, magic_str		  ; call write
  mov edx, eax            ; str_ln
  mov ebx, 1
  mov eax, 4
  int 80h



  mov eax, 1		    ; return
  mov ebx, 0
  int 80h


b_sort:
  push ebp
  mov ebp, esp

  mov cl, [ebp+8]
  add cl, 1
  push ecx

b_lp_1:
  mov eax, [ebp+12]
  pop ecx
  sub cl, 1
  test cl, cl
  jz b_end
  push ecx
  push ecx
b_lp_2:
  pop ecx
  sub cl, 1
  test cl, cl
  jz b_lp_1
  push ecx
  mov cl, [eax]
  mov dl, [eax+1]
  cmp cl, dl
  jl b_switch
b_pswitch:
  add eax, 1
  jmp b_lp_2

b_switch:
  mov [eax], dl
  mov [eax+1], cl
  jmp b_pswitch

b_end:
  mov esp, ebp
  pop ebp
  ret

n_to_str:
    push ebp
    mov ebp, esp
    push 0
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
      arr db 1,12, 14, 12, 11, 10, 45
      arr_l equ 7

section .bss
    magic_str: resb 10
