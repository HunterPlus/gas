# gcc main.s thread_create.s hello.s -lpthread
        .data
        .text
        .globl  main
main:
	push    %rbp
	mov     %rsp, %rbp
	
	sub     $64, %rsp
	movq    $0, -8(%rbp)    # loop counter
	                        # -32(%rbp) - tid
	movq    $0, -64(%rbp)   # arg[0]
	movq    $1, -56(%rbp)
	movq    $2, -48(%rbp)
.L0:	
	cmpq    $3, -8(%rbp)
	je      .L1
	mov     -8(%rbp), %rax
	lea     -32(%rbp, %rax, 8), %rdi        # tid[i]
	mov     $0, %rsi                        # NULL
	lea     hello(%rip), %rdx               # thread
	lea     -64(%rbp, %rax, 8), %rax
	mov     (%rax), %rcx                    # arg[i]
	call    Pthread_create
	incq    -8(%rbp)
	jmp     .L0
.L1:
        decq    -8(%rbp)                        # i = 2
        js      .L2
        mov     -8(%rbp), %rax
        lea     -32(%rbp, %rax, 8), %rax        # pointer to tid[i]
	mov     (%rax), %rdi                    # tid[i]
	mov     $0, %rsi                        # NULL
	call    pthread_join@plt
	jmp     .L1
.L2:
	xor     %rax, %rax
	mov     %rbp, %rsp
	pop     %rbp
	ret
