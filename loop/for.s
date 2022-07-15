#
# int f(int n) {
# 	int 	sum, i;
#	
#	sum = 0;
#	for (i = 1; i < n; i++)
#		sum += i
#	return sum;
# }

	.globl f
	.text
f:
	push	%rbp
	mov	%rsp, %rbp
	
	sub	$8, %rsp
	
	mov	%rbp, %rsp
	pop	$rbp
	ret
