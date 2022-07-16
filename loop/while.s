#
# int w(int n) {
# 	int 	sum, i;
#	
#	sum = 0;
#       i = 1;
#	while (i <= n) {
#		sum += i;
#               i++;
#       }
#	return sum;
# }

	.globl w
	.text
w:
	push	%rbp
	mov	%rsp, %rbp
	
	xor     %rax, %rax              # sum, retval, initialize 0
        mov     $1, %ecx                # i = 1
while:
	cmp	%edi, %ecx
	jg	end			# %ecx > %edi
	add	%ecx, %eax
	inc	%ecx
	jmp	while
end:
	mov	%rbp, %rsp
	pop	%rbp
	ret
