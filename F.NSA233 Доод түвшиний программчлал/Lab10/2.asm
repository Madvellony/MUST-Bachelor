.data
prompt_str: .asciiz " мөрийг оруулна уу: "
output_str: .asciiz "Урвуулсан мөр: "
buffer: .space 100  # Оруулсан мөрийг хадгалах санах ой
stack: .space 100   # Стек санах ой

.text
.globl main
main:
    # Оруулах мөр хэвлэх
    li $v0, 4
    la $a0, prompt_str
    syscall

    # Мөрийг унших
    li $v0, 8
    la $a0, buffer
    li $a1, 100  # Уншигдах максимум тэмдэгт
    syscall

    # Мөрний уртыг тодорхойлох
    move $s0, $a0  # Мөрний хаягийг $s0-д хадгалах
    li $t0, 0     # Мөрний урт тоолуурыг 0-лох
length:
    lb $t1, 0($s0)  # Мөрнөөс нэг byte унших
    beq $t1, $zero, end_length  # Хэрэв byte нь 0 бол мөрний төгсгөл
    addi $s0, $s0, 1  # Дараагийн тэмдэгт луу шилжих
    addi $t0, $t0, 1  # Тоолуурыг 1-ээр нэмэх
    j length
end_length:

    # Мөрийг стект давтан оруулах
    la $t2, buffer  # Эх мөрний хаягийг $t2-д ачаалах
    la $t3, stack   # Стекийн хаягийг $t3-д ачаалах
    add $t3, $t3, $t0  # $t3-ыг стекийн оройд руулах
reverse:
    addi $t0, $t0, -1  # Тоолуурыг 1-ээр бууруулах
    bltz $t0, end_reverse  # Хэрэв тоолуур < 0 бол мөрний төгсгөл
    lb $t1, 0($t2)   # Эх мөрнөөс 1 байтыг унших
    sb $t1, 0($t3)   # Уншсан байтыг стект хадгалах
    addi $t2, $t2, 1  # Эх мөрний дараагийн тэмдэгт луу шилжих
    addi $t3, $t3, -1  # Стекийн оройг нэг байтаар бууруулах
    j reverse
end_reverse:

    # Урвуулсан мөрийг хэвлэх
    li $v0, 4
    la $a0, output_str
    syscall
    la $t3, stack  # Стекийн хаягийг $t3-д ачаалах
print_reverse:
    addi $t3, $t3, 1  # Стекийн эхний тэмдэгт руу шилжих
    lb $a0, 0($t3)   # Стекнээс 1 байтыг унших
    beq $a0, $zero, end_print_reverse  # Хэрэв байт нь 0 бол мөрний төгсгөл
    li $v0, 11       # Тэмдэгтийг хэвлэх
    syscall
    j print_reverse
end_print_reverse:

    # Программыг дуусгах
    li $v0, 10
    syscall
