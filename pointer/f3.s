#
# struct data { char a; int b; }
# void f3(struct data *p) {
#	p->b = 2;
# }

	.globl f3
	.text
f3:
	push	%rbp
	mov	%rsp, %rbp

	movl	$2, 4(%rdi)	# p->b - 4(%rdi)
	
	mov	%rbp, %rsp
	pop	%rbp
	ret
