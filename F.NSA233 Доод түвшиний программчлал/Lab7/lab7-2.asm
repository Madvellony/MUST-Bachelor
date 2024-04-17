.data
size: .word 7
array1: .word -30, -23, 56, -43, 72, -18, 71
array2: .word 45, 23, 21, -23, -82, 0, 69
result: .word 0, 0, 0, 0, 0, 0, 0
.text
.globl main
main:
    la $s0, array1
    la $s1, array2
    la $s2, result
    lw $t0, size
    li $t1, 0
loop:
    lw $t2, 0($s0)
    lw $t3, 0($s1)
    add $t4, $t2, $t3
    sw $t4, 0($s2)
    li $v0, 1
    move $a0, $t4
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    addi $s0, $s0, 4
    addi $s1, $s1, 4
    addi $s2, $s2, 4
    addi $t1, $t1, 1
    blt $t1, $t0, loop
    li $v0, 10
    syscall
.data
newline: .asciiz "\n"
