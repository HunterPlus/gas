#
# int sum(int, x, int y) {
#       return x + y;
# }   
# x - %edi, y - %esi

        .globl sum
        .text
sum:
        push    %rbp
        mov     %rsp, %rbp

        mov     %edi, %eax;
        add     %esi, %eax;

        mov     %rbp, %rsp
        pop     %rbp
        ret
