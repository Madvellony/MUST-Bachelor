.text
.globl main

main:
    
    li $t1, 0xb     # $t1 = x
    li $t2, 0x5b    # $t2 = y

    mul $t3, $t1, $t2     # $t3 = x * y
    li $t4, 17            # $t4 = 17
    mul $t0, $t3, $t4     # $t0 = 17 * x * y

    li $t5, 12            # $t5 = 12
    mul $t6, $t1, $t5     # $t6 = 12 * x
    sub $t0, $t0, $t6     # 17xy-12x

    li $t7, 6             # $t7 = 6
    mul $t8, $t2, $t7     # $t8 = 6 * y
    sub $t0, $t0, $t8     # 6-g hasah

    addi $t0, $t0, 12

    
    li $v0, 10           
    syscall               
