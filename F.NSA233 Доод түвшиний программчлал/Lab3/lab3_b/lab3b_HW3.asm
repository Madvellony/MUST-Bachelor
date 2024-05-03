.text
.globl main

main:
    # Load the values of x, y, and z
    li $t1, 1600000   # $t1 = x = 1600000
    li $t2, 80000     # $t2 = y = 80000
    li $t3, 400000    # $t3 = z = 400000

    # Calculate x*y
    mul $t4, $t1, $t2  # $t4 = x*y = 1600000 * 80000 = 128000000000

    # Divide x*y by z
    div $t4, $t3       # $t4 = (x*y)/z = 128000000000 / 400000 = 320

    # Print the result
    li $v0, 1
    move $a0, $t4
    syscall

    # Exit the program
    li $v0, 10
    syscall
