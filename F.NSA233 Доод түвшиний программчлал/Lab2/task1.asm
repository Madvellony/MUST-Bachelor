
## evaluate the polynomial ax^3 + bx^2 + cx + d
.text
.globl main
main:
    li $t6, 0          # Initialize result to 0
    la $t7, result     # Load base address of result array
    la $t8, coefficients # Load base address of coefficients array

   
    li $t9, 0          
coefficients_loop:
    lw $t0, a($t8)     # Load coefficient a
    lw $t1, X          # Load x
    mult $t1, $t1      # x^2
    mflo $t2           # t2 = x^2
    mult $t2, $t1      # x^3
    mflo $t3           # t3 = x^3
    mult $t0, $t3      # a * x^3
    mflo $t4           # t4 = a * x^3

    lw $t0, b($t8)     # Load coefficient b
    mult $t2, $t0      # b * x^2
    mflo $t5           # t5 = b * x^2
    add $t4, $t4, $t5  # result += b * x^2

    lw $t0, c($t8)     # Load coefficient c
    mult $t1, $t0      # c * x
    mflo $t5           # t5 = c * x
    add $t4, $t4, $t5  # result += c * x

    lw $t0, d($t8)     # Load coefficient d
    add $t4, $t4, $t0  # result += d

    sw $t4, 0($t7)     # Store result in result array
    addi $t8, $t8, 4   # Move to the next set of coefficients
    addi $t7, $t7, 4   # Move to the next position in the result array

    addi $t9, $t9, 1   # Increment loop counter
    bne $t9, 1, coefficients_loop  # Repeat for all coefficients

    # End of program
    li $v0, 10         # syscall code 10: exit
    syscall

.data
X: .word 7
result: .word 0       # Space for result

coefficients:
    a: .word -3
    b: .word 3
    c: .word 9
    d: .word -24
