/*
#include <stdio.h>

 int main()
 {
        int     c;
        
        while ((c = getc(stdin)) != EOF)
                putc(c, stdout);
        return 0;
 } 
*/
        
        .text
        .globl main
main:
	push    %rbp
	mov     %rsp, %rbp
	
.L0:
	mov     stdin(%rip), %rdi
	call    getc@plt
	cmp     $-1, %eax
	je      .L1
	mov     %eax, %edi
	mov     stdout(%rip), %rsi
	call    putc@plt
	jmp     .L0
.L1:	
	xor     %rax, %rax
	mov     %rbp, %rsp
	pop     %rbp
	ret
