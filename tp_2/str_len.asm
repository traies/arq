; forked from print_args
GLOBAL str_len

section .text

str_len:
  push ebp
  mov ebp, esp
  mov eax, [ebp + 8]
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
