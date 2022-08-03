/*
void swap(int *x, int *y)
{
        int  temp;
        temp = *x;
        *x = *y;
        *y = temp;
}
*/
# %rdi - int *x
# %rsi - int *y

	.data
	.text
	.globl 	swap
swap:
	push	%rbp
	mov	%rsp, %rbp

	mov	(%rdi), %ebx
	mov	(%rsi), %ecx
	mov	%ebx, (%rsi)
	mov	%ecx, (%rdi)	
	
	mov	%rbp, %rsp
	pop	%rbp
	ret
	
	
