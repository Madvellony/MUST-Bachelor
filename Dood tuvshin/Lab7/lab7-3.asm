.data
result: .word 0
string1: .asciiz "puffin"
string2: .asciiz "puffins"
.text
.globl main
main:
    la $s0, string1
    la $s1, string2
    li $t0, 0
    li $t1, 0
loop:
    lb $t2, 0($s0)
    lb $t3, 0($s1)
    bne $t2, $t3, not_equal
    beqz $t2, check_length
    addi $s0, $s0, 1
    addi $s1, $s1, 1
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j loop
check_length:
    bne $t0, $t1, not_equal
    li $t4, 1
    sw $t4, result
    j end
not_equal:
    li $t4, 0
    sw $t4, result
end:
    li $v0, 10
    syscall
