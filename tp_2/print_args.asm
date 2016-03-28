

section .text
GLOBAL _start
extern n_to_str

_start:
  mov ebp, esp

  mov eax, [ebp]
  sub eax, 1
  push magic_string
  push eax
  call n_to_str

  mov ecx, magic_string		; call write
  mov edx, eax            ; str_ln
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
  call get_str_len
  pop edx
  mov ecx, edx		        ; call write
  mov edx, eax            ; str_ln
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

get_str_len:
  push ebp
  mov ebp, esp
  mov eax, [ebp]
  mov edx, 0
  mov ebx, 0

count_lp:
  mov bl, [eax]
  test bl, bl
  jz end_str_len
  add edx, 1
  add eax, 1
  jmp count_lp

end_str_len:
  mov eax, edx
  mov esp, ebp
  pop ebp
  ret

section .bss
    magic_string: resb 20
