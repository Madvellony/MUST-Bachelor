    .data
prompt:     .asciiz "Enter a sentence: "
resultMsg:  .asciiz "Number of characters: "
buffer: .space 16
    .text
    .globl main

main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read sentence
    li $v0, 8
    la $a0, buffer   # Buffer to store the sentence
    li $a1, 100         # Maximum length of the sentence
    syscall

    # Count characters
    li $t0, 0           # Initialize count to 0
loop:
    lb $t1, 0($a0)      # Load character from buffer
    beqz $t1, done      # Exit loop if end of string (null terminator)
    addi $a0, $a0, 1    # Move to next character
    addi $t0, $t0, 1    # Increment count
    j loop              # Repeat loop
done:
    # Print result
    li $v0, 4
    la $a0, resultMsg
    syscall

    # Print count
    move $a0, $t0       # Load count into $a0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall
