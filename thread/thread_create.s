/*
void Pthread_create(pthread_t *thread, pthread_attr_t *attr, void *(*start)(void *), void *arg);
int fprintf(FILE *restrict stream, const char *restrict format, ...);
*/

# %rdi - pthread_t *thread
# %rsi - pthread_attr_t *attr
# %rdx - void *(*start)(void *)
# %rcx - void *arg

        .text
        .globl  Pthread_create
Pthread_create:
        push    %rbp
        mov     %rsp, %rbp
        
        call    pthread_create@plt
        cmp     $0, %eax
        jz      .L0
        mov     stderr(%rip), %rdi      # FILE pointer stderr
        lea     fmt(%rip), %rsi
        xor     %rax, %rax
        call    fprintf@plt
        mov     $1, %edi
        call    exit@plt
.L0:
        mov     %rbp, %rsp
        pop     %rbp
        ret
fmt:
        .string "thread create error.\n"

