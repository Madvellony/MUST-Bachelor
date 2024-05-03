.data
prompt: .asciiz "Enter a number: "
result: .asciiz "Sorted numbers: "

.text
.align 2  # Align instructions to word boundaries

# Main program entry point
main:
    # Print prompt for user input
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Initialize memory location to store input numbers
    la $a0, numbers
    li $t0, 0    # Counter for number of inputs
input_loop:
    # Read an integer from the console
    li $v0, 5
    syscall
    
    # Store the input number into memory
    sw $v0, ($a0)
    
    # Move to the next memory location
    addi $a0, $a0, 4
    
    # Increment the counter
    addi $t0, $t0, 1
    
    # Check if 10 numbers have been inputted
    bne $t0, 10, input_loop
    
    # Sort the numbers
    la $a0, numbers
    jal bubble_sort
    
    # Print the sorted numbers
    li $v0, 4
    la $a0, result
    syscall
    
    la $a0, numbers
    li $t0, 0
print_loop:
    lw $a1, ($a0)
    li $v0, 1
    move $a0, $a1
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
    addi $a0, $a0, 4
    addi $t0, $t0, 1
    blt $t0, 10, print_loop

exit:
    li $v0, 10
    syscall

# Bubble sort subroutine
# Input: $a0 - address of the array of numbers
bubble_sort:
    li $t6, 10              # Number of elements to sort
    sub $t6, $t6, 1         # Max index
    li $t7, 1               # Loop control variable (0 if no swaps made)

outer_loop:
    li $t0, 0               # Initialize index to 0
    li $t7, 0               # Reset swap flag

inner_loop:
    beq $t0, $t6, end_outer # Exit loop if index equals max index

    # Calculate memory addresses for the current and next numbers
    add $t1, $a0, $t0       # Address of current number
    add $t2, $t1, 4         # Address of next number

    # Load the current and next numbers into registers
    lw $s0, 0($t1)          # Load current number into $s0
    lw $s1, 0($t2)          # Load next number into $s1

    # Compare the current and next numbers
    bgt $s0, $s1, swap      # Swap if current number is greater than next number

    # If no swap was made, set flag to 1
    j no_swap_check

swap:
    # Swap the current and next numbers
    sw $s1, 0($t1)          # Store next number at the current location
    sw $s0, 0($t2)          # Store current number at the next location

    # Set flag to 1 indicating a swap was made
    li $t7, 1

no_swap_check:
    # Increment index
    addi $t0, $t0, 4

    # Continue inner loop
    j inner_loop

end_outer:
    # If a swap was made, repeat outer loop
    bne $t7, 0, outer_loop

    jr $ra                 # Return to calling routine

.data
numbers: .space 40
prompt: .asciiz "Enter a number: "
result: .asciiz "Sorted numbers: "
space: .asciiz " "
