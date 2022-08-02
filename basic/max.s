# int max(int x, int y) {
#       if (x > y)
#               return x;
#       return y;
# }

        .globl  max
        .text
max:
        push    %rbp
        mov     %rsp, %rbp

        mov     %esi, %eax      # y - %esi, assume y >= x
        cmp     %esi, %edi      # x - %edi
        jle     end             # if x <= y
        mov     %edi, %eax      # x > y
end:
        mov     %rbp, %rsp
        pop     %rbp
        ret
