.data
prompt: .asciiz "String оруулна уу: "
input_buffer: .space 81 # Allocate 80 bytes for the input string + null terminator
stack: .space 81        # Stack to store characters

.text
.globl main

main:
    # Prompt the user for input
    li $v0, 4
    la $a0, prompt
    syscall

    # Read the input string
    li $v0, 8
    la $a0, input_buffer
    li $a1, 81
    syscall

    # Initialize stack pointer
    la $sp, stack
    move $t0, $sp

    # Push characters onto the stack
    la $t1, input_buffer   # Pointer to input string
push_loop:
    lb $t2, ($t1)          # Load character from input string
    beq $t2, $zero, reverse   # If end of string, start reversing
    sb $t2, ($t0)          # Store character on stack
    addi $t1, $t1, 1       # Move to next character in input string
    addi $t0, $t0, 1       # Move to next position in stack
    j push_loop            # Continue pushing characters

reverse:
    # Pop characters from the stack and print them
    move $t1, $t0          # End of string in stack
    addi $t1, $t1, -1      # Move to last character
    la $a0, stack          # Load address of stack
    move $t2, $zero        # Clear $t2 (counter)

pop_loop:
    beq $t1, $sp, exit    # If reached the bottom of the stack, exit
    lb $a0, ($t1)          # Load character from stack
    li $v0, 11             # Print character syscall
    syscall
    addi $t1, $t1, -1      # Move to previous character in stack
    j pop_loop             # Continue popping characters

exit:
    # Exit the program
    li $v0, 10
    syscall
