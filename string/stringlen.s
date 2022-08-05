/*
size_t strlen(const char *s);
*/

# %rdi - char * s

        .text
        .globl  stringlen
stringlen:
        push    %rbp
        mov     %rsp, %rbp

        mov     %rdi, %rax
.L0:
        cmpb    $0, (%rax)
        jz      .L1
        inc     %rax
        jmp     .L0
.L1:    
        sub     %rdi, %rax
        mov     %rbp, %rsp
        pop     %rbp
        ret
