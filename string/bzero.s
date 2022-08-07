/*
void bzero(void *s, size_t n);
*/

# %rdi - void *s
# %esi - unsigned n

        .text
        .globl  memzero
memzero:
        push    %rbp
        mov     %rsp, %rbp
        
        mov     %esi, %ecx
        mov     $0, %al
        rep     stosb
        
        mov     %rbp, %rsp
        pop     %rbp
        ret
