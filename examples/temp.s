movl    $0, 0x604892    # direct (address is constant value)
movl    $0, (%rax)      # indirect (address is in register %rax)

# indirect with displacement (address = base %rbp + displacement -24)
movl    $0, -24(%rbp)   

# indirect with displacement and scaled-index
# (address = base %rsp + displacement 0xc + index %rdi *scale 4)
movl    $0, 0xc(%rsp, %rdi, 4)

# special case of scaled-index, displacement assmed 0)
movl    $0, (%rax, %rcx, 8)     

# (special case of scaled-index, scale assumed 1)
movl    $0, 4(%rax, %rcx, )     


mov     src, dst        # general form of instruction dst = src
mov     $0, %eax        # register %eax = 0

# write to memory address 0x409892 = low-byte from register %eax
movb    %al, 0x409892   

# register %eax = value read from meory address %rsp + 8
mov     8(%rsp), %eax

# %rdi = %rsp + 0x20 (address, no dereference)
lea     0x20(%rsp), %rdi

# %rax = %rdi + %rdi (looks suspiciously like lea being used for ordinary math)
lea     (%rdi, %rdi, 1), %rax


# copy low-byte from %eax, sign-extend to 4 byte long in %edx
movsbl  %al, %edx

# copy low-byte from %eax, zero-extend to 4 byte long in %edx
movzbl  %al, %edx




add     src, dst        # dst += src
sub     src, dst        # dst -= src
imul    src, dst        # dst *= src
neg     dst             # dst = -dst (arithmetic inverse)

and     src, dst        # dst &= src
or      src, dst        # dst |= src
xor     src, dst        # dst ^= src
not     dst             # dst = ~dst (bitwise inverse)

shl     count, dst      # dst <<= count (left shift dst by count position), synonym sal
sar     count, dst      # dst >>= count (arithmetic right shift dst by count positions)
shr     count, dst      # dst >>= count (logical right shift dst by count positions)

# some instructions have special-case variants with different number of operands
imul    src             # dst in %rax, computes 128-bit result, %rdx : %rax
shl     dst             # dst <<= 1 (sar, shr, sal)


cmp     op2, op1        # result = op1 - op2, discard result, sets condition codes
test    op2, op1        # result = op1 & op2, discards result, sets condition codes

jmp     target          # unconditional jump
je      target          # jump equal, synonym jz jump zero (ZF = 1)
jne     target          # jump not equal, synonym jnz jump non zero (ZF = 0)
jl      target          # jump less than, synonym jnge not greater (SF != OF)
jle     target          # jump less or equal, synonym jng jump not greater or equal (ZF = 1 or SF != OF)

