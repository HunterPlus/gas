/*
void levelorder(struct node *node);
*/

        .text
        .globl  levelorder
levelorder:
        push    %rbp
        mov     %rsp, %rbp

        sub     $16, %rsp
        mov     %rdi, -8(%rbp)          # save node
        mov     %rdi, %rax
.L0:
        test    %rax, %rax
        jz      .L3
        mov     (%rax), %esi            # node->key
        lea     fmt(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt

        mov     -8(%rbp), %rax
        mov     8(%rax), %rdi           # node->left
        test    %rdi, %rdi
        jz      .L1
        call    enqueue
.L1:
        mov     -8(%rbp), %rax
        mov     16(%rax), %rdi          # node->right
        test    %rdi, %rdi
        jz      .L2
        call    enqueue        
.L2:
        call    dequeue
        mov     %rax, -8(%rbp)          # save node
        jmp     .L0
.L3:
        mov     %rbp, %rsp
        pop     %rbp
        ret
fmt:
        .string "%d "
