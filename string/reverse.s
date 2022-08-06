        .data
fmt:
        .string "%s\n"
str:
        .string "hello world"
        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp
        
        lea     str(%rip), %rdi
        call    reverse
        
        mov     %rax, %rsi
        lea     fmt(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt
        
        xor     %rax, %rax
        mov     %rbp, %rsp
        pop     %rbp
        ret

/*
char *reverse(char *s);
*/

# %rdi - char *s

        .data
        .text
        .globl  reverse
reverse:
        push    %rbp
        mov     %rsp, %rbp
        
        sub     $16, %rsp
        mov     %rdi, -8(%rbp)
        call    strlen@plt
        
        mov     -8(%rbp), %rsi
        cltq
        lea     -1(%rsi, %rax, 1), %rdi
.L0:
        cmp     %rsi, %rdi
        jbe     .L1
        mov     (%rsi), %al
        xchg    %al, (%rdi) 
        xchg    %al, (%rsi)
        dec     %rdi
        inc     %rsi
        jmp     .L0
        
.L1:
        mov     -8(%rbp), %rax       
        mov     %rbp, %rsp
        pop     %rbp
        ret
