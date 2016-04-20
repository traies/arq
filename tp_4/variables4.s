	.file	"variables4.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	nop
	pop	ebp
	ret
	.size	foo, .-foo
	.data
	.align 4
	.type	numero.1802, @object
	.size	numero.1802, 4
numero.1802:
	.long	21
	.ident	"GCC: (GNU) 5.3.0"
	.section	.note.GNU-stack,"",@progbits
