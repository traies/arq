	section .text
	GLOBAL _start

_start:
	mov ecx, string
	mov edx, ecx
	sub edx, 1
str_lp:	add edx, 1
	mov al, [edx]
	test al, al
	jz write
	call eval_char
	jmp str_lp
write:
	mov ecx, string		; call write
	mov edx, str_ln
	mov ebx, 1
	mov eax, 4
	int 80h

	mov eax, 1		; return
	mov ebx, 0
	int 80h

eval_char:

	push ebp
	mov ebp, esp
	cmp al, 0x61		; cmp char 'a'
	jle brake
	cmp al, 0x7A		; cmp char 'z'
	jg  brake
	sub al, 0x20		; a to A
	mov [edx], al		; load val
brake:	mov esp, ebp
	pop ebp
	ret

	section .data

	string db "h4ppy c0d1ng", 10 ; string original
	str_ln equ 13
