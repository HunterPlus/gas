        .data
        .text
        .global main
main:
	push    %rbp
	mov     %rsp, %rbp
	
	mov     $4, %edi
	call    factorial
	
	mov     %rax, %rsi
	lea     fmt(%rip), %rdi
	xor     %rax, %rax
	call    printf@plt
	
	
	mov     %rbp, %rsp
	pop     %rbp
	ret
fmt:
        .string "4! = %ld\n"

/*
unsigned long factorial(unsigned n)
{
        return (n <= 1) ? 1: n * factorial(n - 1);
}
*/

# %edi - unsigned n
# %rax - unsigned long, return value

        .text
        .globl  factorial
factorial:
        push    %rbp
        mov     %rsp, %rbp
        
        mov     $1, %rax        # n <= 1, return 1
        cmp     $1, %edi
        jbe     .L1             # unsigned <=, below or equal
        
        sub     $16, %rsp
        mov     %rdi, -8(%rbp)
        dec     %edi
        call    factorial
        
        mov     -8(%rbp), %rdi
        mul     %rdi
        
.L1:    
        mov     %rbp, %rsp
        pop     %rbp
        ret
