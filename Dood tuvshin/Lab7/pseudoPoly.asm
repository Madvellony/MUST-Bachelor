## pseudoPoly.asm
## evaluate the polynomial ax^2 + bx + c
.text
.globl main
main:
    lw $t3, x        # get x
    nop
    nop
    lw $t0, a        # get a
    nop
    nop
    lw $t1, bb       # get bb
    nop
    nop
    lw $t2, c        # get c
    nop
    nop
    mult $t3, $t3    # x * x
    mflo $t4         # $t4 = x^2
    mult $t4, $t0    # a * x^2
    mflo $t4         # $t4 = ax^2
    mult $t1, $t3    # b * x
    mflo $t5         # $t5 = bx
    addu $t5, $t5, $t4   # $t5 = ax^2 + bx
    addu $t5, $t5, $t2   # $t5 = ax^2 + bx + c
    sw $t5, value    # value = polynomial
.data
x: .word 4
value: .word 1
a: .word 20
bb: .word -2            # Changed bb to $bb
c: .word 5
