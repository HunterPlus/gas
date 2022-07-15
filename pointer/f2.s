#
# void f2(int *p, int i) {
#	p[i] = 2;
# }

	.globl f2
	.text
f2:
	push	%rbp
	mov	%rsp, %rbp

	movslq	%esi, %rsi		# i - %esi, convert signed esi to rsi
	movl	$2, (%rdi, %rsi, 4)	# p - %rdi, p[i] = p + sizeof(int) * i
	
	mov	%rbp, %rsp
	pop	%rbp
	ret
