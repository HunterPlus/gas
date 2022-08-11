/*
struct node {
    	int data;
    	struct node *next;
};

void printlink(struct node *p)
{
    	while (p != NULL) {
        		printf("%d ", p->data);
        		p = p->next;
    	}
    
}
*/
# %rdi - node *p

        .text
        .globl  printlink
printlink:
        push    %rbp
        mov     %rsp, %rbp

        sub     $16, %rsp
        mov     %rdi, -8(%rbp)
        mov     %rdi, %r10
.L0:
        test    %r10, %r10
        jz      .L1
        lea     fmt(%rip), %rdi
        mov     (%r10), %esi
        mov     8(%r10), %r10
        mov     %r10, -8(%rbp)
        xor     %rax, %rax
        call    printf@plt
        mov     -8(%rbp), %r10
        jmp     .L0
.L1:
        lea     newline(%rip), %rdi
        xor     %rax, %rax
        call    printf@plt

        mov     %rbp, %rsp
        pop     %rbp
        ret
fmt:
        .string "%d "
newline:
        .string "\n"
