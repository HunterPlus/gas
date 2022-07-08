#
# gcc -no-pie hello1.s && ./a.out
#

        .globl main
        .text
main:
        mov     $message, %rdi
        call    puts            # puts(message)
        ret                     # return to c library code
message:
        .string  "Hello, world with c library.\n"
