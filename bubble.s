/*
#include <stdio.h>
void swap (int *x, int *y) { int t = *x; *x = *y; *y = t; }
void bubble(int v[], int n)
{
	int i, j;
	
	for (j = n - 1; j > 0; j--) 
        	for (i = 0; i < j; i++)
			if (v[i] > v[i + 1])
				swap(&v[i], &v[i + 1]);
}

void printarray(int arr[], int size)
{
    	int i;
    	for (i=0; i < size; i++)
        	printf("%d ", arr[i]);
    	printf("\n");
}
int main()
{
    	int arr[] = {64, 34, 25, 12, 22, 11, 90};
    	int n = sizeof(arr)/sizeof(arr[0]);
	
    	bubble(arr, n);
    	printf("Sorted array: \n");
    	printarray(arr, n);

    	return 0;
}
*/

	.data
arr:
    	.int 64, 34, 25, 12, 22, 11, 90
    	.text
.L0:
    	.string "Sorted array: \n"
    	.global main
main:
	push   	%rbp
	mov    	%rsp, %rbp
	
	lea     arr(%rip), %rdi
	mov     $7, %esi
	call    bubble
	
	xor     %rax, %rax
	lea     .L0(%rip), %rdi
	call    printf@plt
	
	xor	%rax, %rax
	lea	arr(%rip), %rdi
	mov	$7, %esi
	call	printarray
	
	xor	%rax, %rax
	mov	%rbp, %rsp
	pop	%rbp
	ret
	
# %rdi - int *v
# %esi - int n

	.text
	.globl bubble
bubble:
	push	%rbp
	mov	%rsp, %rbp
	
	cmp	$1, %esi
	jle	.L3		# goto end
	dec	%esi
	mov	%esi, %edx
	mov	%rdi, %rcx
.L1:				# loop
	mov	(%rcx), %eax
	cmp	%eax, 4(%rcx)
	jge	.L2		# goto skip
	xchg	%eax, 4(%rcx)
	mov	%eax, (%rcx)
.L2:				# skip
	add	$4, %rcx
	dec	%edx
	jnz	.L1		# goto loop
	dec	%esi
	jz	.L3
	mov	%rdi, %rcx
	mov	%esi, %edx
	jmp	.L1		# goto loop
.L3:				# end
	xor	%rax, %rax
	mov	%rbp, %rsp
	pop	%rbp
	ret

# %rdi - int *arr
# %esi - int n
	.text
	.globl printarray
printarray:
	push	%rbp
	mov	%rsp, %rbp
	
	mov	%rdi, %rdx
	mov	%esi, %ecx
.L4:				#loop
	dec	%ecx
	js	.L5		# goto end
	xor	%rax, %rax
	lea	.L6(%rip), %rdi
	mov	(%rdx), %esi
	call	printf@plt
	lea	4(%rdx), %rdx
	jmp	.L4		# goto loop	
.L5:				# end
	xor	%rax, %rax
	lea	.L7(%rip), %rdi
	call	printf@plt
	
	xor	%rax, %rax
	mov	%rbp, %rsp
	pop	%rbp
	ret
.L6:
	.string "%d "
.L7:	
	.string "\n"



	
