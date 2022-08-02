/*
void swap(int *x, int *y)
{
        int  temp;

        temp = *x;
        *x = *y;
        *y = temp;
}
*/

        .data
        .text
        .global main
main:
        push    %rbp
        mov     %rsp, %rbp
    
        sub     $16, %rsp
        movl    $3, -4(%rbp)            # x = 3
        movl    $10, -8(%rbp)           # y = 10
    
        xor     %rax, %rax
        lea     fmt(%rip), %rdi
        mov     -4(%rbp), %esi          # x
        mov     -8(%rbp), %edx          # y
        call    printf@plt
    
        lea     -4(%rbp), %rdi          # *x
        lea     -8(%rbp), %rsi          # *y
        call    swap
     
        xor     %rax, %rax
        lea     fmt(%rip), %rdi
        mov     -4(%rbp), %esi
        mov     -8(%rbp), %edx
        call    printf@plt    
   
        xor     %rax, %rax
        mov     %rbp, %rsp
        pop     %rbp
	ret

fmt:
        .string "x = %d\ty = %d\n"


swap:
        push    %rbp
        mov     %rsp, %rbp

        mov     (%rdi), %eax
        xchg     %eax, (%rsi)
        xchg     %eax, (%rdi)

        xor     %rax, %rax
        mov     %rbp, %rsp
        pop     %rbp
        ret

