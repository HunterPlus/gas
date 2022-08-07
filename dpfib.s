        .data
        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp
        
        mov     $6, %edi
        call    fib1
        
        lea     fmt(%rip), %rdi
        mov     %eax, %esi
        xor     %rax, %rax
        call    printf@plt
        
        mov     %rbp, %rsp
        pop     %rbp
        ret
fmt:
        .string "fib(6) = %d\n"

/*
int fib (int n)
{
    int *table = (int *)malloc((n+1) * sizeof(int));	

    table[0] = 0;
    table[1] = 1;
    for (int i = 2; i <= n; i++)
        table[i] = table[i - 1] + table[i - 2];    
    return table[n];
}

void *malloc(size_t size);
*/

# %edi - int n

        .text
        .globl  fib1
fib1:
        push    %rbp
        mov     %rsp, %rbp
        
        sub     $16, %rsp
        mov     %edi, -4(%rbp)          # save n
        lea     4(, %edi, 4), %edi      # 4 + n * 4
        call    malloc@plt
        
        mov     %rax, -16(%rbp)         # save table pointer
        movl    $0, (%rax)              # table[0] = 0
        add     $4, %rax
        movl    $1, (%rax)              # table[1] = 1
        
        mov     -4(%rbp), %ecx
        dec     %ecx                    # loop n-1 times
.L0:  
        mov     -4(%rax), %r10d
        add     (%rax), %r10d
        mov     %r10d, 4(%rax)           # table[i] = table[i-1] + tabel[i=2]
        add     $4, %rax
        loop    .L0

        mov     (%rax), %eax
        mov     %eax, -8(%rbp)          # save return value
        mov     -16(%rbp), %rdi
        call    free@plt
        
        mov     -8(%rbp), %eax
        mov     %rbp, %rsp
        pop     %rbp
        ret
