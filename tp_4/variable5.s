	.file	"variable5.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	mov	DWORD PTR numero, 10
	nop
	pop	ebp
	ret
	.size	foo, .-foo
	.ident	"GCC: (GNU) 5.3.0"
	.section	.note.GNU-stack,"",@progbits
