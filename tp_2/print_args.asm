

section .text
GLOBAL _start
extern n_to_str, str_len

_start:
  mov ebp, esp

  mov eax, [ebp]
  sub eax, 1
  push magic_string
  push eax
  call n_to_str

  mov ecx, magic_string		; call write
  mov edx, eax              ; str_ln
  mov ebx, 1
  mov eax, 4
  int 80h


  mov ecx, 0
  mov edx, [ebp]

print_lp:
  cmp ecx, edx
  je end
  push ecx
  push edx
  mov edx, [ebp+4*ecx + 4]
  push edx
  call str_len
  pop edx
  mov ecx, edx		        ; call write
  mov edx, eax              ; str_ln
  mov ebx, 1
  mov eax, 4
  int 80h

  mov ecx, new_ln		    ; new line
  mov edx, 1
  mov ebx, 1
  mov eax, 4
  int 80h

  pop edx
  pop ecx
  add ecx, 1
  jmp print_lp


end:
  mov eax, 1		    ; return
  mov ebx, 0
  int 80h

section .data
    new_ln db 10
section .bss
    magic_string: resb 20
