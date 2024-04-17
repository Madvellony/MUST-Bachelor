.data
size: .word 10
array: .word 2, 4, 7, 12, 34, 36, 42, 8, 57, 78

.text
.globl main

main:
    la $t0, size        # Load the address of 'size' into $t0
    lw $t1, 0($t0)      # Load the value of 'size' into $t1
    la $t2, array       # Load the address of 'array' into $t2
    li $t3, 1           # Initialize the loop counter

outer_loop:
    bge $t3, $t1, end_program  # If the loop counter is greater than or equal to the size, exit the loop

    sll $t4, $t3, 2           # Calculate the offset for the current element
    lw $t5, 0($t2, $t4)       # Load the current element
    sll $t6, $t3, 2           # Calculate the offset for the next element
    addi $t6, $t6, 4          # Move to the next element
    lw $t7, 0($t2, $t6)       # Load the next element

    ble $t5, $t7, check_next  # If the current element is less than or equal to the next element, continue to the next iteration

    # Swap the elements
    sw $t7, 0($t2, $t4)       # Store the next element at the current position
    sw $t5, 0($t2, $t6)       # Store the current element at the next position

check_next:
    addi $t3, $t3, 1          # Increment the loop counter
    j outer_loop              # Repeat the loop

end_program:
    # Your code continues here
