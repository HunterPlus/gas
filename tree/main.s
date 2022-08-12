# gcc main.s newnode.s preorder.s
/*
struct node *newnode(int);
void preorder(struct node *);
*/

        .text
        .globl  main
main:
        push    %rbp
        mov     %rsp, %rbp

        sub     $16, %rsp
        mov     $1, %edi
        call    newnode
        mov     %rax, -8(%rbp)          # root

        mov     $2, %edi
        call    newnode
        mov     -8(%rbp), %rdi
        mov     %rax, 8(%rdi)
        mov     %rax, -16(%rbp)         # root->left

        mov     $3, %edi
        call    newnode
        mov     -8(%rbp), %rdi
        mov     %rax, 16(%rdi)          # root->right

        mov     $4, %edi
        call    newnode
        mov     -16(%rbp), %rdi
        mov     %rax, 8(%rdi)           # root->left->left

        mov     -8(%rbp), %rdi
        call    preorder

        lea     fmt(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt

        xor     %rax, %rax
        mov     %rbp, %rsp
        pop     %rbp
        ret
fmt:
        .string "\n"
