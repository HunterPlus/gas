#
# void f(int *p) {
#	*p = 2;
# }

	.globl f
	.text
f:
	push	%rbp
	mov	%rsp, %rbp

	movl	$2, (%rdi)
	
	mov	%rbp, %rsp
	pop	%rbp
	ret
