# 
        .data
        .text
        .global main
main:
	push    %rbp
	mov     %rsp, %rbp
	
	mov     $3, %edi
	mov     $4, %esi
	call    power
	
	mov     %eax, %esi
	lea     fmt(%rip), %rdi
	xor     %rax, %rax
	call    printf@plt
	
	
	mov     %rbp, %rsp
	pop     %rbp
	ret
fmt:
        .string "3 ^ 4 = %d\n"
	
/*
int power(int b, int n)
{
        int     i, val;
        
        sum = 1;
        for (i = 0, i < n; i++)
                val *= b;
}
*/
# %ebi - int b, base number
# %esi - int n, exp number

        .text
        .globl power
power:
        push   	%rbp
        mov     %rsp, %rbp
        
        mov     $1, %rax        # default return value 
.L0:
        test    %esi, %esi
        je      .L1
        imul    %edi, %eax
        dec     %esi
        jmp     .L0
        
.L1:
        mov     %rbp, %rsp
        pop     %rbp
        ret
