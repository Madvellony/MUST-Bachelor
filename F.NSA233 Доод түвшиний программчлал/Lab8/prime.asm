.data
    prompt:   .asciiz "Enter five numbers separated by spaces: "
    msg:      .asciiz "The number of prime numbers: "
    newline:  .asciiz "\n"
    numbers:  .space 50  # Reserve space for 5 input numbers
    count:    .byte 0    # Store the count of prime numbers

.text
    .globl main
main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read input
    li $v0, 8
    la $a0, numbers
    li $a1, 50
    syscall

    # Reset the count of prime numbers
    sb $zero, count

    # Parse input and count prime numbers
    la $t0, numbers
    jal parse_and_count_primes

    # Print the count of prime numbers
    li $v0, 4
    la $a0, msg
    syscall

    lb $a0, count
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # Exit the program
    li $v0, 10
    syscall

# Subroutine to parse input and count prime numbers
parse_and_count_primes:
    move $t1, $t0
    li $t2, 0

loop:
    # Parse the next number
    jal parse_number
    beq $v0, $zero, end_loop

    # Check if the number is prime
    move $a0, $v0
    jal is_prime
    beq $v0, $zero, loop

    # Increment the prime count
    lb $t3, count
    addi $t3, $t3, 1
    sb $t3, count
    j loop

end_loop:
    jr $ra

# Subroutine to check if a number is prime
is_prime:
    li $t0, 2
    beq $a0, $t0, prime
    li $t0, 1
    ble $a0, $t0, not_prime

check_divisors:
    div $a0, $t0
    mfhi $t1
    beq $t1, $zero, not_prime
    addi $t0, $t0, 1
    blt $t0, $a0, check_divisors

prime:
    li $v0, 1
    jr $ra

not_prime:
    li $v0, 0
    jr $ra

# Subroutine to parse a number from the input
parse_number:
    li $v0, 0
    li $t0, 0

parse_loop:
    lb $t1, ($t0)
    beq $t1, ' ', end_parse
    beq $t1, $zero, end_parse
    subi $t1, $t1, '0'
    mul $v0, $v0, 10
    add $v0, $v0, $t1
    addi $t0, $t0, 1
    j parse_loop

end_parse:
    jr $ra
