# gcc main.s copy.s
/*
int main(int argc, char *argv[]);
void copy(int old, int new);
*/
        .bss
        .globl  buffer
buffer:
        .zero   8192
        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp

        cmp     $3, %edi
        je      .L0
        lea     str1(%rip), %rsi
        jmp     doerr
.L0:
        sub     $16, %rsp
        mov     %rsi, -8(%rbp)          # save argv
        lea     8(%rsi), %rdi           # &argv[1]
        mov     (%rdi), %rdi            # argv[1]
        mov     $0, %esi
        call    open@plt
        cmp     $-1, %eax
        jne     .L1
        mov     -8(%rbp), %rsi
        lea     8(%rsi), %rsi
        mov     (%rsi), %rdx
        lea     str2(%rip), %rsi
        jmp     doerr
.L1:
        mov     %eax, -12(%rbp)         # save fdold
        mov     -8(%rbp), %rsi
        lea     16(%rsi), %rdi
        mov     (%rdi), %rdi            # argv[2]
        mov     $0666, %esi             # octal
        call    creat@plt
        cmp     $-1, %eax
        jne     .L2
        mov     -8(%rbp), %rsi
        lea     16(%rsi), %rsi
        mov     (%rsi), %rdx
        lea     str3(%rip), %rsi
        jmp     doerr
.L2:
        mov     %eax, %esi              # fdnew
        mov     -12(%rbp), %edi
        call    copy

        xor     %rax, %rax
        mov     %rbp, %rsp
        pop     %rbp
        ret
doerr:
        mov     stderr(%rip), %rdi
        xor     %rax, %rax
        call    fprintf@plt
        mov     $1, %edi
        call    exit@plt
str1:
        .string "need 2 arguments for copy program\n"
str2:
        .string "cannot open file %s\n"
str3:
        .string "cannot create file %s\n"
