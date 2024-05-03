.text
.globl main

main:
    # Prompt user to enter values of a, b, and c
    li $v0, 4            # syscall code for printing string
    la $a0, prompt_a     # load address of the string
    syscall              # print prompt
    li $v0, 5            # syscall code for reading integer
    syscall              # read integer for a
    move $t0, $v0        # store a in $t0

    li $v0, 4            # syscall code for printing string
    la $a0, prompt_b     # load address of the string
    syscall              # print prompt
    li $v0, 5            # syscall code for reading integer
    syscall              # read integer for b
    move $t1, $v0        # store b in $t1

    li $v0, 4            # syscall code for printing string
    la $a0, prompt_c     # load address of the string
    syscall              # print prompt
    li $v0, 5            # syscall code for reading integer
    syscall              # read integer for c
    move $t2, $v0        # store c in $t2

    # Compute 3ab and store the result in $t3
    mul $t3, $t0, $t1    # compute a*b
    sll $t3, $t3, 1      # multiply by 2 to get 2ab
    add $t3, $t3, $t0    # add another a to get 3ab

    # Compute 2bc and store the result in $t4
    mul $t4, $t1, $t2    # compute b*c
    sll $t4, $t4, 1      # multiply by 2 to get 2bc

    # Compute 5a and store the result in $t5
    li $t5, 5            # load immediate 5 to $t5
    mul $t5, $t5, $t0    # compute 5a

    # Compute 20ac and store the result in $t6
    li $t6, 20           # load immediate 20 to $t6
    mul $t6, $t6, $t0    # compute 20a*c

    # Compute the expression: 3ab - 2bc - 5a + 20ac - 16
    add $t7, $t3, $t4    # compute 3ab - 2bc
    sub $t7, $t7, $t5    # subtract 5a
    add $t7, $t7, $t6    # add 20ac
    li $t8, -16          # load immediate -16 to $t8
    add $t7, $t7, $t8    # subtract 16 from the result

    # Print the result
    li $v0, 1            # syscall code for printing integer
    move $a0, $t7        # move the result to $a0
    syscall              # print the result

    # Exit
    li $v0, 10           # syscall code for exit
    syscall              # exit the program

.data
prompt_a: .asciiz "a-ийн утгыг оруулна уу: "
prompt_b: .asciiz "b-ийн утгыг оруулна уу: "
prompt_c: .asciiz "c-ийн утгыг оруулна уу: "
