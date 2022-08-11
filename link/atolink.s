/*
struct node *atolink(int a[], int n)		
{
    	struct node head = {}, *cur;
    
    	cur = &head;
    	for (int i = 0; i < n; i++)
        	cur = cur->next = newnode(a[i]);
    
    	return head.next;
}
*/

# %rdi - int *a
# %esi - int n

        .text
        .globl  atolink
atolink:
        push    %rbp
        mov     %rsp, %rbp
        
        sub     $48, %rsp
        mov     %rdi, -8(%rbp)          # int *a
        mov     %esi, -12(%rbp)         # int n
        movq    $0, -24(%rbp)           # head->next
        movq    $0, -32(%rbp)           # head and head->data
        
        lea     -32(%rbp), %rax
        mov     %rax, -40(%rbp)         # cur = &head
        
.L0:
        test    %esi, %esi              # n == 0 ?
        jz      .L1
        mov     -8(%rbp), %rdi
        mov     (%rdi), %edi
        call    newnode
        
        mov     -40(%rbp), %r10
        mov     %rax, 8(%r10)           # cur->next = newnode
        mov     %rax, -40(%rbp)         # cur = cur->next
        
        add     $4, -8(%rbp)            # pointer a += 4
        decl    -12(%rbp)               # --n
        mov     -12(%rbp), %esi
        jmp     .L0
        
.L1:
        mov     -24(%rbp), %rax
        mov     %rbp, %rsp
        pop     %rbp
        ret
