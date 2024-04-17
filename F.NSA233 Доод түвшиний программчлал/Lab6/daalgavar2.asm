.data
string: .asciiz "pentium is example of CISC processor"
capitalized_string: .space 100  # Өөрчлөгдсөн мөрөнд зориулж зай нөөцлөx
.text
.globl main

main:
    # Initialize pointers
    la $a0, string               # original string-ийн хаягийг ачаалах
    la $a1, capitalized_string   # modified string-ийн хаягийг ачаалах
capitalize_loop:
    lb $t0, 0($a0)               # original string-өөс тэмдэгт ачаалах
    beqz $t0, done               # Хэрэв null байвал давталтаас гарна

    # string-ний эхний үсгийг томоор бичиx
    lb $t1, -1($a1)               # Өмнөх тэмдэгтийг ачаалax
    li $t2, ' '                   # ASCII space-ийн value
    beq $t1, $zero, capitalize_next  # Хэрэв мөрийн эхэнд байгаа бол дараагийн тэмдэгтийг томоор бичих
    beq $t1, $t2, capitalize_next  # Хэрэв өмнө нь хоосон зай байгаа бол дараагийн тэмдэгтийг томоор бичих

    j copy_and_continue

capitalize_next:
    # тэмдэгтийг жижиг үсэгтэй бол том үсгээр хөрвүүлнэ
    li $t1, 'a'                  # A'-н ASCII утгыг ачаалах
    li $t2, 'z'                  # Z'-н ASCII утгыг ачаалах
    blt $t0, $t1, copy_and_continue  # Хэрэв жижиг үсэг биш бол үргэлжлүүлэх
    bgt $t0, $t2, copy_and_continue  # Хэрэв жижиг үсэг биш бол үргэлжлүүлэх
    sub $t0, $t0, 32             #Жижиг үсгийг том үсгээр хөрвүүлэх

copy_and_continue:
    #  Өөрчилсөн тэмдэгтийг мөрөнд хуулаx
    sb $t0, 0($a1)
    addi $a0, $a0, 1             # original string-ийн дараагийн тэмдэгт рүү шилжинэ
    addi $a1, $a1, 1             # modified string-ийн дараагийн тэмдэгт рүү шилжинэ
    j capitalize_loop

done:
    # Өөрчлөгдсөн string-ийг дуусгах
    sb $zero, 0($a1)

    # Өөрчлөгдсөн string-ийг хэвлэх
    li $v0, 4
    la $a0, capitalized_string
    syscall

    # Exit the program
    li $v0, 10
    syscall
