/*
void printarray(int arr[], int n)
{
	for (int i = 0; i < n; i++)
		printf("%d ", arr[i]);
	printf("\n");
}
*/

# %rdi - int *arr
# %esi - int n

	    .text
	    .globl printarray
printarray:
	    push    %rbp
	    mov	    %rsp, %rbp
	
	    sub	    $16, %rsp
	    mov	    %rdi, -8(%rbp)
	    mov	    %esi, -12(%rbp)
	
.L0:				
	    decl    -12(%rbp)
	    js	    .L1		
	    xor	    %rax, %rax
	    lea	    .L2(%rip), %rdi
	    mov	    -8(%rbp), %rdx
	    mov	    (%rdx), %esi
	    call	printf@plt
	    add	    $4, -8(%rbp)
	    jmp	    .L0			
.L1:				
	    xor	    %rax, %rax
	    lea	    .L3(%rip), %rdi
	    call	printf@plt
	
	    xor	%rax, %rax
	    mov	%rbp, %rsp
	    pop	%rbp
	    ret
.L2:
	    .string "%d "
.L3:	
	    .string "\n"
