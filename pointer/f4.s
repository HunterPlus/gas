#
# struct data { char a; int b; long c; }
# void f3(struct data *p, int i) {
#	p[i].b = 2;
# }

	.globl f4
	.text
f4:
	push	%rbp
	mov	%rsp, %rbp
		
	movslq	$esi, $rsi
	imul	$16, $rsi		# 16 - sizeof(struct data), i'th index
	movl	$2, 4(%rdi, %rsi)	# p[i]->b - p + sizoef(data) * i + 4
	
	mov	%rbp, %rsp
	pop	%rbp
	ret
