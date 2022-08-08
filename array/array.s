/*
int main() 
{
        int x[10];
        
        for (int i = 0; i < 10; i++) 
                x[i] = i;
        return 0;
}
*/ 
# 
        .data
        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp
        
        sub     $48, %rsp
        lea     -40(%rbp), %rax
        mov     $9, %rcx                # loop 9 times
.L:
        mov     %ecx, (%rax, %rcx, 4)
        loop    .L
        movl    $0, (%rax)
        
        mov     %rax, %rdi
        mov     $10, %esi
        call    printarray
        
        xor     %rax, %rax
        mov     %rbp, %rsp
        pop     %rbp
	ret

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
	mov	%rsp, %rbp
	
	sub	$16, %rsp
	mov	%rdi, -8(%rbp)
	mov	%esi, -12(%rbp)
	
.L0:				
	decl    -12(%rbp)
	js	.L1		
	xor	%rax, %rax
	lea	.L2(%rip), %rdi
	mov	-8(%rbp), %rdx
	mov	(%rdx), %esi
	call	printf@plt
	add	$4, -8(%rbp)
	jmp	.L0			
.L1:				
	xor	%rax, %rax
	lea	.L3(%rip), %rdi
	call	printf@plt
	
	xor	%rax, %rax
	mov	%rbp, %rsp
	pop	%rbp
	ret
.L2:
	.string "%d "
.L3:	
	.string "\n"

