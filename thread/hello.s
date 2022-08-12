# %rdi - void *arg

        .text
        .globl  hello
hello:
        push    %rbp
        mov     %rsp, %rbp
        
        mov     %rdi, %rsi
        lea     fmt(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt
        
        mov     %rbp, %rsp
        pop     %rbp
        ret
fmt:
        .string "Hello from thread #%ld\n"
