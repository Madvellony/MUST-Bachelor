.data
    x:      .word 7
    a:      .word -3
    b_coefficient:      .word 3
    c:      .word 9
    d:      .word -24
    result: .word 0

.text
.globl main
main:
                            # коэффициентүүдийг регистрт хийх
    lw $t0, x               # x-ийг $t0-д хийх
    lw $t1, a               # a-г $t1-д хийх
    lw $t2, b_coefficient   # $t2-д b_coefficient-ийг хийх
    lw $t3, c               # c-г $t3-д хийх
    lw $t4, d               # d-г $t4-д хийх

    mul $t5, $t0, $t0       # x^2
    mul $t6, $t5, $t0       # Cx^3
    mul $t6, $t6, $t1       # ax^3
    mul $t7, $t5, $t2       # bx^2
    mul $t8, $t0, $t3       # cx
    add $t9, $t6, $t7       # ax^3 + bx^2
    add $t9, $t9, $t8       # cx-ийг нэмэх
    add $t9, $t9, $t4       # d-г нэмэх

    sw $t9, result          # Үр дүнг санах ойд хадгалах

    li $v0, 10
    syscall
