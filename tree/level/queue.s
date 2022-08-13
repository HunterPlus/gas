/*
void enqueue(void *x);
void *dequeue();
*/
       
.local  buf
        .comm   buf, 128, 8     # name, size, align
.local  front
        .comm   front, 4, 4
.local  rear
        .comm   rear, 4, 4
.local  size
        .comm   size, 4, 4      # size <= 16

        .text
        .globl  enqueue
enqueue:
        push    %rbp
        mov     %rsp, %rbp

        cmpl    $16, size(%rip)
        je      .L0
        lea     buf(%rip), %rbx
        mov     rear(%rip), %eax        
        mov     %rdi, (%rbx, %rax, 8)

        inc     %eax                    # ++rear
        mov     $0, %rdx                # %edx : %eax
        mov     $16, %esi
        div     %esi
        mov     %edx, rear(%rip)        # mod 16 to rear
        incl    size(%rip)              # ++size
.L0:
        mov     %rbp, %rsp
        pop     %rbp
        ret

        .text
        .globl  dequeue
dequeue:
        push    %rbp
        mov     %rsp, %rbp

        xor     %rax, %rax
        cmpl    $0, size(%rip)
        jz      .L1
        lea     buf(%rip), %rbx
        mov     front(%rip), %eax
        mov     (%rbx, %rax, 8), %r10   # save return value

        inc     %eax
        mov     $0, %rdx
        mov     $16, %esi
        div     %esi
        mov     %edx, front(%rip)
        decl    size(%rip)

        mov     %r10, %rax
.L1:
        mov     %rbp, %rsp
        pop     %rbp
        ret
