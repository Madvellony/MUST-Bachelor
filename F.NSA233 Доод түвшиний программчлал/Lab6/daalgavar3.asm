.data
size: .word 8
array: .word 23, -12, 45, -32, 52, -72, 8, 13
min: .word 0
max: .word 0
max_msg: .asciiz "Массив дахь хамгийн их тоо: "
min_msg: .asciiz "Массив дахь хамгийн бага тоо: "
newline: .asciiz "\n"
.text
.globl main
main:
    # Initialize pointers
    la $t0, array               # Массивын хаягийг өгөх
    lw $t1, size                # Массивын хэмжээг өгөх
    lw $t2, 0($t0)              # Массивын эхний элементийг  min өгөх
    lw $t3, 0($t0)              # Массивын эхний элементийг  max өгөх
find_min_max_loop:
    addi $t0, $t0, 4            # Массив дахь дараагийн элемент рүү шилжиx
    lw $t4, 0($t0)              # Массивын одоогийн элементийг ачаалax
    # Хамгийн багатай харьцуулax
    slt $t5, $t4, $t2           # Одоогийн элемент одоогийн доод хэмжээнээс бага эсэхийг шалгаx
    beq $t5, $zero, check_max   # Хэрэв бага биш бол дээд хэмжээ эсэхийг шалгаx
    move $t2, $t4               # Хэрэв одоогийн элемент бага байвал хамгийн багадаа шинэчилэx
check_max:
    # Хамгийн ихтэй харьцуулax
    slt $t5, $t3, $t4           # Одоогийн элемент одоогийн дээд хэмжээнээс бага эсэхийг шалгаx
    beq $t5, $zero, continue_loop   #Хэрэв бага биш бол, loop-ийг үргэлжлүүлэx
    move $t3, $t4               # Хэрэв одоогийн элемент их байвал хамгийн ихдаа шинэчилэx
continue_loop:
    addi $t1, $t1, -1           # Counter-ыг багасгах
    bnez $t1, find_min_max_loop # Counter тэг биш бол давталтыг үргэлжлүүлнэ
    # Хамгийн бага ба хамгийн их утгыг хадгална
    sw $t2, min
    sw $t3, max
    # Хамгийн бага ба хамгийн их утгыг хэвлэх
    li $v0, 4
    la $a0, max_msg
    syscall
    li $v0, 1
    lw $a0, max
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 4
    la $a0, min_msg
    syscall
    li $v0, 1
    lw $a0, min
    syscall
    li $v0, 10
    syscall
