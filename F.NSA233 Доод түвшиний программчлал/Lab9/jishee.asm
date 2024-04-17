# addthree.asm --- read in three integers and print their sum
# pread -- prompt for and read an integer
# on entry: 
# This program uses simple linkage.
# Sra -- return address on exit:
.text
.globl main
.globl pread

main:
    jal pread      # read first integer
    move $s0, $v0  # save it in $s0

    jal pread      # read second integer
    move $s1, $v0  # save it in $s1

    jal pread      # read third integer
    move $s2, $v0  # save it in $s2

    add $s3, $s0, $s1  # compute the sum of first two integers
    add $s3, $s3, $s2  # add the third integer to the sum

    li $v0, 1      # print the sum
    move $a0, $s3
    syscall

    li $v0, 10     # exit
    syscall

pread:
    li $v0, 4      # syscall 4 to print prompt
    la $a0, prompt
    syscall

    li $v0, 5      # syscall 5 to read integer
    syscall
    jr $ra         # return

.data
prompt: .asciiz "Enter an integer: "
