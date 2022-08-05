        .data
fmt:
        .string "%s\n"
src:
        .string "hello world"
        
        .bss
.lcomm  dest    20
        .text
        .globl main
main:
	push    %rbp
	mov     %rsp, %rbp
	
	lea     src(%rip), %rsi
	lea     dest(%rip), %rdi
	call    stringcpy
	
	lea     fmt(%rip), %rdi
	lea     dest(%rip), %rsi        # mov     %rax, %rsi
	xor     %rax, %rax
	call    printf@plt
	
	leave
	ret


/*
char *strcpy(char *restrict dest, const char *src);
*/

# %rdi - char *dest
# %rsi - char *src

        .text
        .globl  stringcpy
stringcpy:
        push    %rbp
        mov     %rsp, %rbp

        mov     %rdi, %rax      # save dest pointer, return value
        cld                     # clear the DF flag
.L0:
        movsb
        cmpb    $0, -1(%rdi)
        jne     .L0

        mov     %rbp, %rsp
        pop     %rbp
        ret
