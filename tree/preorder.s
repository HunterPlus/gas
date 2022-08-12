/*
void preorder(struct node *node);
*/

# %rdi - pointer to node

        .text
        .globl  preorder
preorder:
        push    %rbp
        mov     %rsp, %rbp

        test    %rdi, %rdi
        jz      .L0
        sub     $16, %rsp
        mov     %rdi, -8(%rbp)          # save node pointer

        mov     (%rdi), %esi            # node->key
        lea     fmt(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt

        mov     -8(%rbp), %rax
        mov     8(%rax), %rdi           # node->left
        call    preorder

        mov     -8(%rbp), %rax
        mov     16(%rax), %rdi          # node->right
        call    preorder
.L0:
        mov     %rbp, %rsp
        pop     %rbp
        ret
fmt:
        .string "%d "
