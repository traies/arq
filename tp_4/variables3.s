	.file	"variables3.c"
	.intel_syntax noprefix
	.comm	numero,4,4
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	mov	DWORD PTR numero, 21
	nop
	pop	ebp
	ret
	.size	foo, .-foo
	.ident	"GCC: (GNU) 5.3.0"
	.section	.note.GNU-stack,"",@progbits
