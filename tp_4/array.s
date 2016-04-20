	.file	"array.c"
	.intel_syntax noprefix
	.globl	array
	.bss
	.align 32
	.type	array, @object
	.size	array, 80
array:
	.zero	80
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	push	edi
	sub	esp, 160
	mov	DWORD PTR [ebp-84], 35
	lea	edx, [ebp-164]
	mov	eax, 0
	mov	ecx, 20
	mov	edi, edx
	rep stosd
	mov	DWORD PTR [ebp-124], 40
	nop
	add	esp, 160
	pop	edi
	pop	ebp
	ret
	.size	foo, .-foo
	.ident	"GCC: (GNU) 5.3.0"
	.section	.note.GNU-stack,"",@progbits
