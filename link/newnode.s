/*
struct node {
    	int data;
    	struct node *next;
};

struct node *newnode(int x)
{
    	struct node *n;
    
    	if ((n = malloc(sizeof(*n))) == NULL) {
        		fprintf(stderr, "newnode: malloc error");
        		exit(1);
    	}
    	n->data = x;
    	n->next = NULL;
    	return n;
}
*/

# %edi - int x

        .text
        .globl  newnode
newnode:
        push    %rbp
        mov     %rsp, %rbp
        
        sub     $16, %rsp
        mov     %edi, -4(%rbp)          # save int x
        mov     $16, %edi               # sizeof node
        call    malloc@plt
        test    %rax, %rax              # pointer == NULL ?
        jnz     .L0
        mov     stderr(%rip), %rdi      # FILE pointer to stderr
        lea     errs(%rip), %rsi        # error string
        xor     %rax, %rax
        call    fprintf@plt
        mov     $1, %edi
        call    exit@plt
        
.L0:
        mov     -4(%rbp), %r10d
        mov     %r10d, (%rax)           # mov x to node
        movq    $0, 8(%rax)             # set next = NULL
        
        
        mov     %rbp, %rsp
        pop     %rbp
        ret
errs:
        .string "newnode: malloc error\n"

