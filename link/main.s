 # gcc main.s newnode.s printlink.s atolink.s

        .data
arr:
        .long   10, 20, 30, 40
        .text
        .global main
main:
	push    %rbp
	mov     %rsp, %rbp
	
	lea     arr(%rip), %rdi
	mov     $4, %esi
	call    atolink
	
	mov     %rax, %rdi
	call    printlink
	
	xor     %rax, %rax
	mov     %rbp, %rsp
	pop     %rbp
	ret
