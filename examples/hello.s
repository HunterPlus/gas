#
#       gcc -c hello.s && ld hello.o && ./a.out
#

        .globl _start
        .text
_start:
        # write(1, message, 13)
        mov     $1, %rax        # system call 1 is write
        mov     $1, %rdi        # file handle 1 is stdout
        mov     $message, %rsi  # address of string to output
        mov     $13, %rdx       # number of bytes
        syscall

        # exit(0)
        mov     $60, %rax       # system call 60 is exit
        xor     %rdi, %rdi      # return code 0
        syscall
message:
        .ascii  "Hello world\n"
