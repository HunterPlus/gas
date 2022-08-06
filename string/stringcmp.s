        .data
fmt:
        .string "%d\n"
str1:
        .string "hello5"
str2:
        .string "hello1"
        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp
        
        lea     str1(%rip), %rdi
        lea     str2(%rip), %rsi
        call    stringcmp
        
        mov     %eax, %esi
        lea     fmt(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt
        
        xor     %rax, %rax
        mov     %rbp, %rsp
        pop     %rbp
        ret

/*
int strcmp(const char *s1, const char *s2);

0, if the s1 and s2 are equal;
a negative value if s1 is less than s2;
a positive value if s1 is greater than s2.
*/

# %rdi - char *s1
# %rsi - char *s2

        .data
        .text
        .globl  stringcmp
stringcmp:
        push    %rbp
        mov     %rsp, %rbp
.L0:
        mov     (%rdi), %al
        mov     (%rsi), %bl
        cmp     $0, %al
        jz      .L1
        cmp     $0, %bl
        jz      .L1
        
        cmp     %bl, %al
        jnz     .L1
        inc     %rdi
        inc     %rsi
        jmp      .L0
        
.L1:     
        sub     %bl, %al
        movsbl  %al, %eax

        mov     %rbp, %rsp
        pop     %rbp
        ret
