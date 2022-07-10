#
# gcc hello1.s && ./a.out
#
# gcc -no-pie hello1.s
# mov $message, %rdi
# call puts
#

        .globl main
        .text
main:
        lea     message(%rip), %rdi
        call    puts@plt            # puts(message)
        ret                     # return to c library code
message:
        .string  "Hello, world with c library.\n"
