# Ensure proper instruction alignment and branch/jump targets
.align 2  # Align instructions to word boundaries

# Main program entry point
main:

    # Loop counter initialization
    li $t0, 0    # Outer loop counter

outer_loop:
    li $t1, 0    # Inner loop counter

inner_loop:
    # Calculate memory addresses for the current and next numbers
    add $t2, $a0, $t1      # Address of current number
    addi $t3, $t2, 10      # Address of next number

    # Load the current and next numbers into registers
    lb $s0, 0($t2)         # Load current number into $s0
    lb $s1, 0($t3)         # Load next number into $s1

    # Compare the current and next numbers
    slt $s2, $s1, $s0      # Set $s2 to 1 if next number is less than current number

    # Branch based on the comparison result
    bne $s2, $zero, no_swap   # If $s2 is not 0, swap
    j continue_outer_loop  # Otherwise, continue the outer loop
no_swap:

    # Swap the current and next numbers
    sb $s1, 0($t2)         # Store next number at the current location
    sb $s0, 0($t3)         # Store current number at the next location

continue_outer_loop:
    # Increment the inner loop counter and check if it's less than 10 - $t1
    addi $t1, $t1, 10       # Increment inner loop counter by 10
    blt $t1, 90, inner_loop  # If $t1 < 90, repeat the inner loop

    # Increment the outer loop counter and check if it's less than 80 - $t0
    addi $t0, $t0, 10       # Increment outer loop counter by 10
    blt $t0, 80, outer_loop  # If $t0 < 80, repeat the outer loop

# At this point, the numbers should be arranged in descending order in memory

# End of the main program
