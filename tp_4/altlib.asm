;altlib.asm
GLOBAL altwrite, altread, altclose, altopen, altexit

section .text
;void altexit();
altexit:
  push ebp
  mov ebp, esp
  mov eax, 1
  int 80h
  leave
  ret

;size_t altread(size_t fd, void *buf, size_t count)
altread:
  push ebp
  mov ebp, esp

  push ebx
  mov eax, 3
  mov ebx, [ebp+8]
  mov ecx, [ebp+12]
  mov edx, [ebp+16]
  int 80h
  pop ebx

  leave
  ret

;size_t altwrite(size_t fd, void *buf, size_t count)
altwrite:
  push ebp
  mov ebp, esp
  push ebx
  mov eax, 4
  mov ebx, [ebp+8]
  mov ecx, [ebp+12]
  mov edx, [ebp+16]
  int 80h
  pop ebx
  leave
  ret

;int altopen(const char * pathname, int flags, mode_t mode)
altopen:
  push ebp
  mov ebp, esp
  push ebx
  mov eax, 5
  mov ebx, [ebp+8]
  mov ecx, [ebp+12]
  mov edx, [ebp+16]
  int 80h
  pop ebx
  leave
  ret
;int altclose(const char * pathname, int flags, mode_t mode)
altclose:
  push ebp
  mov ebp, esp
  push ebx
  mov eax, 6
  mov ebx, [ebp+8]
  mov ecx, [ebp+12]
  mov edx, [ebp+16]
  int 80h
  pop ebx
  leave
  ret
