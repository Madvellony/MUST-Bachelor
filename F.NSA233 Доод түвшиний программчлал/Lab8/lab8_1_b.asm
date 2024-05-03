.data
prompt: .asciiz "F/Fahrenheit or C/Celcius or Q/Quit: "
tempPrompt: .asciiz "Temperature: "
result: .asciiz "Ur dun: "
newline: .asciiz "\n"

.text
.globl main
main:
    #prompt хэвлэх
    la $a0, prompt
    li $v0, 4
    syscall
	#char унших
    li $v0, 12
    syscall
    #гараас авсан утгыг $t0-д хадгалах
	move $t0, $v0
	
	li $v0, 4
    la $a0, newline
    syscall

	#гараас авсан утга==Q бол дуусах
    beq $t0, 'Q', end
	
    la $a0, tempPrompt
    li $v0, 4
    syscall
	
	#гараас авсан температурын утгыг $t1-д хадгалах
    li $v0, 5
    syscall
    move $t1, $v0
	
	#F ба C аль нь болохыг шалгах, үсрэх
    beq $t0, 'F', f_to_c
    beq $t0, 'C', c_to_f

f_to_c:
    #(5/9)(F-32)
	sub $t1, $t1, 32
    mul $t1, $t1, 5
    div $t1, $t1, 9
    j print_result

c_to_f:
    #(9/5)32+C
	mul $t1, $t1, 9
    div $t1, $t1, 5
    add $t1, $t1, 32

print_result:
    #үр дүнг хэвлэх
	la $a0, result
    li $v0, 4
    syscall

    move $a0, $t1
    li $v0, 1
    syscall
	li $v0, 4
    la $a0, newline
    syscall

    j main

end:
    li $v0, 10
    syscall







