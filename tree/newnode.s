/*
struct node {
	int	key;
	struct node *left;
	struct node *right;
};

struct node *newnode(int key);

void *malloc(size_t size);      size_t - unsigned integer
int fprintf(FILE *restrict stream, const char *restrict format, ...);
void exit(int status);

*/

# %edi - int key

        .text
        .globl  newnode
newnode:
        push    %rbp
        mov     %rsp, %rbp

        sub     $16, %rsp
        mov     %edi, -4(%rbp)          # save key
        mov     $24, %edi
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
        mov     %r10d, (%rax)           # node->key
        movq    $0, 8(%rax)             # node->left = NULL
        movq    $0, 16(%rax)            # node->right = NULL        

        mov     %rbp, %rsp
        pop     %rbp
        ret
errs:
        .string "newnode: error\n"
