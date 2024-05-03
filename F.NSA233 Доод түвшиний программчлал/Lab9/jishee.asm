.data
    prompt:     .asciiz "ug oruulah: "
    resultMsg:  .asciiz "niit usgiin too: "
    buffer:     .space 400

.text
    .globl main

main:
    li $t0, 0
    li $t1, 0

read_sentences:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 8
    la $a0, buffer
    li $a1, 100
    syscall

    li $t2, 0
    la $t3, buffer

loop:
    lb $t4, ($t3)
    beq $t4, $zero, done_sentence
    beq $t4, ' ', skip
    beq $t4, 10, done_sentence
    addi $t2, $t2, 1
skip:
    addi $t3, $t3, 1
    j loop

done_sentence:
    add $t0, $t0, $t2
    addi $t1, $t1, 1
    blt $t1, 4, read_sentences

    li $v0, 4
    la $a0, resultMsg
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    li $v0, 10
    syscall
