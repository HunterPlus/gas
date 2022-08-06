        .data
fmt:
        .string "%s\n"
str:
        .string "heLLo world!"
        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp
        
        lea     str(%rip), %rdi
        call    convert
        
        mov     %rax, %rsi
        lea     fmt(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt
        
        xor     %rax, %rax
        mov     %rbp, %rsp
        pop     %rbp
        ret

/*
char *convert(char *s);
*/
# convert string s from lower to upper
# %rdi - char *s

        .data
        .text
        .globl  convert
convert:
        push    %rbp
        mov     %rsp, %rbp
        
        mov     %rdi, %rax
.L0:
        mov     (%rdi), %bl
        test    %bl, %bl
        jz      .L2
        cmp     $'a', %bl
        jl      .L1
        cmp     $'z', %bl
        jg      .L1
        sub     $0x20, %bl
.L1:
        mov     %bl, (%rdi)
        inc     %rdi
        jmp     .L0
.L2:
        mov     %rbp, %rsp
        pop     %rbp
        ret
