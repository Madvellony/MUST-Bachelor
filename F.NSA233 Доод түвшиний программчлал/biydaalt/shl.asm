.data
value: .word 9
shl_amount: .word 1
result: .word 0
before_shift_msg: .asciiz "Шилжилтийн өмнөх утга: "
after_shift_msg: .asciiz "Шилжүүлсний дараах утга:: "
newline: .asciiz "\n"

.text
.globl main

main:
    lw $t0, value              # Шилжүүлэх утгыг ачаална 
    lw $t1, shl_amount         # Шилжүүлэх хэмжээг ачаална 

    # Шилжихээс өмнө утгыг хэвлэнэ
    li $v0, 4
    la $a0, before_shift_msg
    syscall
    li $v0, 1
    lw $a0, value
    syscall

    # left shift operation-ийг гүйцэтгэнэ
    sll $t2, $t0, $t1           # $t0-д шилжих утгыг $t1 битээр зүүн тийш шилжүүлж $t2 болно

    # Шилжүүлсний дараа утгыг хэвлэх
    li $v0, 4
    la $a0, after_shift_msg
    syscall
    li $v0, 1
    move $a0, $t2               # Шилжүүлсэн утгыг $a руу шилжүүлнэ
    syscall

    # Үр дүнг хадгалах
    sw $t2, result

    # Шинэ мөр хэвлэх
    li $v0, 4
    la $a0, newline
    syscall

    # Програмаас гарах
    li $v0, 10
    syscall
