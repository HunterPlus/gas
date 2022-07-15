#
# void f1(int *p) {
#	*p = 2;
# }

	.globl f1
	.text
f1:
	push	%rbp
	mov	%rsp, %rbp

	movl	$2, (%rdi)
	
	mov	%rbp, %rsp
	pop	%rbp
	ret
