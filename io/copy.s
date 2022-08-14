/*
void copy(int old, int new);
ssize_t read(int fd, void *buf, size_t count);
ssize_t write(int fd, const void *buf, size_t count);
*/

        .text
        .globl  copy
copy:
        push    %rbp
        mov     %rsp, %rbp

        sub     $16, %rsp
        mov     %edi, -4(%rbp)          # save old
        mov     %esi, -8(%rbp)          # save new
.L0:
        lea     buffer(%rip), %rsi
        mov     $8192, %edx             # BUFSIZ
        call    read@plt
        test    %eax, %eax              # n == 0 ?
        jz      .L1
        mov     -8(%rbp), %edi
        lea     buffer(%rip), %rsi
        mov     %eax, %edx
        call    write@plt
        mov     -4(%rbp), %edi
        jmp     .L0
.L1:  
        mov     %rbp, %rsp
        pop     %rbp
        ret
