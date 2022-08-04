
        .data
array:
        .int    3, 7, 13, 25
        
        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp
        
        lea     array(%rip), %rdi
        mov     $4, %esi
        call    arraysum
        
        mov     %eax, %esi
        lea     fmt(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt
        
        
        mov     %rbp, %rsp
        pop     %rbp
        ret
fmt:
        .string "array sum = %d\n"
        
/*
int arraysum(int arr[], int n)
{
        int sum;
        
        for (sum = 0; n > 0, n--)
                sum += arr[n];
        return sum;
}

*/
# %rdi - int *arr
# %esi - int n

        .data
        .text
        .globl arraysum
arraysum:
        push    %rbp
        mov     %rsp, %rbp
        
        xor     %rax, %rax
        cmp     $0, %esi
        jle     end
        
.L0:
        add     (%rdi), %eax
        add     $4, %rdi
        dec     %esi
        jnz     .L0

end:        
        mov     %rbp, %rsp
        pop     %rbp
        ret
