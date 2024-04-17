.data
bytes: .byte 12, 28, 33, 6, 496  # 5 bytes in memory
perfect_count: .word 0            # Counter for perfect numbers

.text
.globl main

main:
    la $t0, bytes          # Load address of bytes
    li $t1, 5              # Set loop counter to 5 (number of bytes)
    li $t2, 0              # Initialize perfect number count

loop:
    lb $t3, 0($t0)         # Load byte from memory
    move $a0, $t3          # Move byte to argument register
    jal is_perfect         # Jump to is_perfect subroutine
    beq $v0, $zero, not_perfect  # If not perfect, skip counting

    addi $t2, $t2, 1       # Increment perfect number count

not_perfect:
    addi $t0, $t0, 1       # Move to next byte
    addi $t1, $t1, -1      # Decrement loop counter
    bnez $t1, loop         # Repeat loop if counter is not zero

    # Store the count of perfect numbers in memory
    la $t4, perfect_count
    sw $t2, 0($t4)

    # Exit the program
    li $v0, 10             # Exit syscall
    syscall

# Subroutine to check if a number is perfect
is_perfect:
    li $v0, 0              # Set return value to 0
    li $t5, 1              # Initialize divisor to 1
    li $t6, 0              # Initialize sum of divisors to 0

check_divisor:
    beq $t5, $a0, check_sum    # If divisor equals the number, check sum

    div $a0, $t5               # Divide number by divisor
    mfhi $t7                   # Get remainder
    beqz $t7, add_divisor      # If remainder is zero, add divisor

    addi $t5, $t5, 1           # Increment divisor
    j check_divisor             # Check next divisor

add_divisor:
    add $t6, $t6, $t5          # Add divisor to sum of divisors
    addi $t5, $t5, 1           # Increment divisor
    j check_divisor             # Check next divisor

check_sum:
    beq $t6, $a0, perfect      # If sum of divisors equals the number, it's perfect

    jr $ra                     # Return to caller

perfect:
    li $v0, 1                  # Set return value to 1 (indicating perfect number)
    jr $ra                     # Return to caller
