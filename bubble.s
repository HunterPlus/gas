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
fmt:
    	.string "Sorted array: \n"
    	.global main
main:
	push   	%rbp
	mov    	%rsp, %rbp
	
	lea     arr(%rip), %rdi
	mov     $7, %esi
	call    bubble
	
	xor     %rax, %rax
	lea     fmt(%rip), %rdi
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
	jle	end
	dec	%esi
	mov	%esi, %edx
	mov	%rdi, %rcx
loop:
	mov	(%rcx), %eax
	cmp	%eax, 4(%rcx)
	jge	skip
	xchg	%eax, 4(%rcx)
	mov	%eax, (%rcx)
skip:
	add	$4, %rcx
	dec	%edx
	jnz	loop
	dec	%esi
	jz	end
	mov	%rdi, %rcx
	mov	%esi, %edx
	jmp	loop	
end:
	xor	%rax, %rax
	mov	%rbp, %rsp
	pop	%rbp
	ret

	.text
	.globl printarray
printarray:



	
