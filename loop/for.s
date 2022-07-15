#
# int f(int n) {
# 	int 	sum, i;
#	
#	sum = 0;
#	for (i = 1; i <= n; i++)
#		sum += i
#	return sum;
# }

	.globl f
	.text
f:
	push	%rbp
	mov	%rsp, %rbp
	
	sub	$8, %rsp
	movl	$0, -4(%rbp)	# sum = 0
	movl	$1, -8(%rbp)	# i = 1
for:
	cmp	%edi, -8(%rbp)
	jg	end
	mov	-8(%rbp), %edx
	add	%edx, -4(%rbp)
	incl	-8(%rbp)
	jump	for
end:
	mov	%rbp, %rsp
	pop	$rbp
	ret
