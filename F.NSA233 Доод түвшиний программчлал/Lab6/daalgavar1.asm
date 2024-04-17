.data
string: .asciiz "MIPS IS RISC and PIPELINED PrOCesSoR"
lowercase_string: .space 100    # Өөрчлөгдсөн мөрөнд зориулж зай нөөцлөx

.text
.globl main

main:
    # Initialize pointers
    la $a0, string             # Load address-ийн хаягийг ачаалах
    la $a1, lowercase_string   # Load address-ийн хаягийг ачаалах

convert_loop:
    lb $t0, 0($a0)             # Анхны мөрөөс тэмдэгт ачаалах
    beqz $t0, done             # Хэрэв null байвал давталтаас гарна

    # Тэмдэгт нь том үсгээр бичигдсэн эсэхийг шалгана
    li $t1, 'A'                # A'-н ASCII утгыг ачаалах
    li $t2, 'Z'                # Z'-н ASCII утгыг ачаалах
    blt $t0, $t1, not_uppercase
    bgt $t0, $t2, not_uppercase

    # Том үсгийг жижиг үсэг рүү хөрвүүлэх
    addi $t0, $t0, 32          # 32-ыг нэмж жижиг үсэг рүү хөрвүүлнэ
    sb $t0, 0($a1)             # Жижиг үсгийг хадгалах
    j continue

not_uppercase:
    sb $t0, 0($a1)             # Тэмдэгтүүдийг хуулах

continue:
    addi $a0, $a0, 1           # Original string-ийн дараагийн тэмдэгт рүү шилжинэ
    addi $a1, $a1, 1           # Modified string-ийн дараагийн тэмдэгт рүү шилжинэ
    j convert_loop

done:
    # Өөрчлөгдсөн мөрийг дуусгах
    sb $zero, 0($a1)

    # Өөрчлөгдсөн мөрийг хэвлэх
    li $v0, 4
    la $a0, lowercase_string
    syscall

    #Програмаас гарах
    li $v0, 10
    syscall
