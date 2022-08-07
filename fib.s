        .data
        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp
        
        mov     $6, %edi
        call    fib
        
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
int fib(int n) 
{ 
     if(n <= 1) 
         return n; 
     else 
         return (fib(n - 1) + fib(n - 2));      
}
*/

# %edi - int n

        .text
        .globl  fib
fib:
        push    %rbp
        mov     %rsp, %rbp
        
        mov     %edi, %eax
        cmp     $1, %edi
        jle     .L0
        sub     $16, %rsp
        mov     %edi, -4(%rbp)          # save n
        dec     %edi
        call    fib
        mov     %eax, -8(%rbp)          # save fib(n - 1)
        mov     -4(%rbp), %edi
        sub     $2, %edi
        call    fib                     # call fib(n - 2)
        add     -8(%rbp), %eax

.L0:
        mov     %rbp, %rsp
        pop     %rbp
        ret
